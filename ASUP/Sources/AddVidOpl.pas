
{ -$Id: AddVidOpl.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Добавление вида оплаты"                        }
{      Добавление и изменение вида оплаты из справочника видов оплат           }
{                                                  ответственный: Олег Волков  }

unit AddVidOpl;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Mask, CheckEditUnit, Buttons, Db, IBCustomDataSet,
    IBQuery, FieldControl, EditControl, SpCommon, PersonalCommon, CheckLst;

type
    TAddVidOplForm = class(TAddForm)
        PropertiesLabel: TLabel;
        PropListBox: TCheckListBox;
        AddButton: TSpeedButton;
        PropQuery: TIBQuery;
        AllPropQuery: TIBQuery;
        WritePropQuery: TIBQuery;
        BuffQuery: TIBQuery;
        Label1: TLabel;
        CashBox: TCheckBox;
        Nach_TypeBox: TSpComboBox;
        Label2: TLabel;
        Label3: TLabel;
        Fund_TypeBox: TSpComboBox;
        FC_Cash: TFieldControl;
        FC_Nach_Type: TFieldControl;
        FC_Fund_Type: TFieldControl;
        DetailsQueryCASH: TIBStringField;
        DetailsQueryTIP_NACH: TIntegerField;
        DetailsQueryTIP_FUND: TIntegerField;
        procedure AddButtonClick(Sender: TObject);
    published
        Name_VidOplLabel: TLabel;
        DetailsQuery: TIBQuery;
        Name_VidOplEdit: TCheckEdit;
        DetailsQueryName_VidOpl: TIBStringField;
        FC_Name_VidOpl: TFieldControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
    private
        procedure RebuildPropList;
        procedure PreparePropList;
        procedure WriteProperties;
        procedure Write;
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        Id_VidOpl: Integer;

        procedure Prepare(Mode: TEditMode; id: Integer); override;
        function GetId: Integer; override;
    end;

var
    AddVidOplForm: TAddVidOplForm;

implementation

uses SpFormUnit, Buffer;

{$R *.DFM}

procedure TAddVidOplForm.Prepare(Mode: TEditMode; id: Integer);
begin
    Self.Mode := Mode;

    if Mode = emNew then Caption := 'Додати види оплати'
    else if Mode = emModify then Caption := 'Змінити вид оплати'
    else Caption := 'Додаткова інформація по виду оплати';

    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;

    Id_VidOpl := id;

    if Mode <> emNew then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['Id_VidOpl'] := id;
            Open;
            if DetailsQuery.IsEmpty then
                MessageDlg('Не вдалося знайти запис. ' +
                    'Можливо, його вилучив інший користувач!',
                    mtError, [mbOk], 0);
        end;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_Name_VidOpl, FC_Cash, FC_Nach_Type, FC_Fund_Type]);
    FormControl.Prepare(Mode);
    FormControl.SetReadOnly(Mode = emView);

    AllPropQuery.Transaction := ReadTransaction;
    PropQuery.Transaction := ReadTransaction;
    WritePropQuery.Transaction := WriteTransaction;
    BuffQuery.Transaction := BufferTransaction;

    RebuildPropList;
    PreparePropList;

    OkButton.OnClick := OkButtonClick;
    OnClose := FormClose;
end;

function TAddVidOplForm.GetId: Integer;
begin
    Result := Id_VidOpl;
end;

procedure TAddVidOplForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormControl.Free;
    Nach_TypeBox.SaveIntoRegistry;
    Fund_TypeBox.SaveIntoRegistry;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TAddVidOplForm.OkButtonClick(Sender: TObject);
begin
    FormControl.Read;
    if FormControl.CheckFill then Write
    else ModalResult := 0;
end;

procedure TAddVidOplForm.Write;
var
    ok: Boolean;
    Id_PBKey: Integer;
begin
    BufTran.Start;
    try
          // пишем данные в Interbase
        if Mode = emNew then
            ok := FormControl.ExecProc('Sp_VidOpl_Insert', [], True)
        else ok := FormControl.ExecProc('Sp_VidOpl_Update', [
                DetailsQuery.Params.ParamValues['Id_VidOpl']]);
        if not ok then raise Exception.Create('');

        if Mode = emNew then Id_VidOpl := LastId;

   // запись свойств вида оплаты
        WriteProperties;

        Id_PBKey := BufTran.AddRecord('Payment', 'Buff_Payment');

                 // запись в буфер Interbase
        with BuffQuery.Params do
        begin
            ParamValues['Id_VidOpl'] := Id_VidOpl;
            ParamValues['Id_Action'] := ActionFromEditMode(Mode);
            ParamValues['Name_VidOpl'] := FC_Name_Vidopl.Value;
            ParamValues['Cash'] := FC_Cash.Value;
            ParamValues['Tip_Nach'] := FC_Nach_Type.Value;
            ParamValues['Id_PBKey'] := Id_PBKey;
        end;
        ExecQuery(BuffQuery);

   // запись в dbf
        WriteToDbf('Payment', 'Buff_Payment', Id_PBKey);

    except on e: Exception do
        begin
            ShowError(e);
            BufTran.Rollback;
            ModalResult := 0;
            Exit;
        end
    end;
    BufTran.Commit;
end;

procedure TAddVidOplForm.RebuildPropList;
begin
    PropListBox.Clear;
    with AllPropQuery do
    begin
        Close;
        Open;
        First;
        while not Eof do
        begin

            PropListBox.Items.Add(FieldValues['Name_Vidopl_Prop']);
            Next;
        end;
    end;
    with PropQuery do
    begin
        Close;
        Open;
        PreparePropList;
    end;
end;

procedure TAddVidOplForm.WriteProperties;
var
    i, Ch: Integer;
begin
    with PropListBox do
        for i := 0 to PropListBox.Items.Count - 1 do
        begin
            if Checked[i] then Ch := 1
            else Ch := 0;

            AllPropQuery.Locate('Name_Vidopl_Prop', Items[i], []);

            with WritePropQuery.Params do
            begin
                ParamValues['Id_Vidopl'] := Id_Vidopl;
                ParamValues['Id_Vidopl_Prop'] := AllPropQuery['Id_Vidopl_Prop'];
                ParamValues['Flag'] := Ch;
            end;
            ExecQuery(WritePropQuery);
        end;
end;

procedure TAddVidOplForm.PreparePropList;
var
    i: Integer;
begin
    PropQuery.Close;
    PropQuery.Params.ParamValues['Id_Vidopl'] := Id_Vidopl;
    PropQuery.Open;
    if Mode = emNew then Exit;
    with PropListBox do
        for i := 0 to Items.Count - 1 do
            if PropQuery.Locate('Name_Vidopl_Prop', Items[i], []) then
                PropListBox.Checked[i] := True;
end;

procedure TAddVidOplForm.AddButtonClick(Sender: TObject);
var
    form: TSpForm;
    PropParams: TSpParams;
begin
    form := TSpForm.Create(Self);
    PropParams := TSpParams.Create;
    with PropParams do
    begin
        Table := 'Sp_Vidopl_Prop';
        Title := 'Властивості видів оплати';
        IdField := 'Id_Vidopl_Prop';
        SpFields := 'Name_Vidopl_Prop';
        ColumnNames := 'Властивість виду оплати';
        InsertProcName := 'Sp_Vidopl_Prop_Insert';
        UpdateProcName := 'Sp_Vidopl_Prop_Update';
        DeleteProcName := 'Sp_Vidopl_Prop_Delete';
        SelectProcName := 'Sp_Vidopl_Prop_Select';
        SpMode := spmNormal;
    end;

    form.Init(PropParams);
    form.ShowModal;
    RebuildPropList;
    form.Free;
    PropParams.Free;
end;

initialization
    RegisterClass(TAddVidOplForm);
end.
