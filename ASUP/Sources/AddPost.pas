
{ -$Id: AddPost.pas,v 1.3 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                         Модуль "Добавление должности"                        }
{                Добавление и изменение данных о должности                     }
{                                                  ответственный: Олег Волков  }

unit AddPost;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Mask, CheckEditUnit, Buttons, Db,
    IBCustomDataSet, IBQuery, FieldControl, EditControl, PersonalCommon,
    SpCommon, ADODB, Buffer, CheckLst, SpFormUnit;

type
    TAddPostForm = class(TForm)
        PostLabel: TLabel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        CategoryLabel: TLabel;
        NamePostEdit: TCheckEdit;
        CategoryBox: TSpComboBox;
        HolidayEdit: TCheckEdit;
        HolidayLabel: TLabel;
        FC_NamePost: TFieldControl;
        FC_Category: TFieldControl;
        FC_Holiday: TFieldControl;
        DetailsQuery: TIBQuery;
        DetailsQueryID_CATEGORY: TIntegerField;
        DetailsQueryNAME_POST: TIBStringField;
        DetailsQueryHOLIDAY_LONG: TIntegerField;
        CodeLabel: TLabel;
        CodeEdit: TCheckEdit;
        FC_Code: TFieldControl;
        DetailsQueryPOST_CODE: TIBStringField;
        DetailsQueryOKL_FORK: TIBStringField;
        DetailsQueryOKL_MIN: TIBBCDField;
        DetailsQueryOKL_MAX: TIBBCDField;
        DetailsQueryMAIN_WORKER: TIBStringField;
        DetailsQueryONE_SPZ: TIBStringField;
        DetailsQueryID_SPZ: TIntegerField;
        MinLabel: TLabel;
        MaxLabel: TLabel;
        Okl_Fork_Box: TCheckBox;
        OklMinEdit: TCheckEdit;
        OklMaxEdit: TCheckEdit;
        Main_Worker: TCheckBox;
        OneSPZ: TCheckBox;
        SPZBox: TSpComboBox;
        FC_Okl_Fork: TFieldControl;
        FC_Okl_Min: TFieldControl;
        FC_Okl_Max: TFieldControl;
        FC_Main_Worker: TFieldControl;
        FC_OneSPZ: TFieldControl;
        FC_SPZ: TFieldControl;
        SPZLabel: TLabel;
        Label1: TLabel;
        WorkCondBox: TSpComboBox;
        FC_Work_Cond: TFieldControl;
        DetailsQueryID_WORK_COND: TIntegerField;
        BufferQuery: TIBQuery;
        PropertiesLabel: TLabel;
        PropListBox: TCheckListBox;
        AddButton: TSpeedButton;
        AllPropQuery: TIBQuery;
        PropQuery: TIBQuery;
        WritePropQuery: TIBQuery;
        NBuffQuery: TIBQuery;
        NotDigitBox: TCheckBox;
        FC_NotDigit: TFieldControl;
        DetailsQueryNOT_DIGIT: TIBStringField;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormActivate(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure Okl_Fork_BoxClick(Sender: TObject);
        procedure OneSPZClick(Sender: TObject);
        procedure CategoryBoxEnter(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
    private
        procedure RebuildPropList;
        procedure PreparePropList;
        procedure WriteProperties;
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        Id_Post: Integer;

        procedure Prepare(id: Integer; Mode: TEditMode);
    end;

var
    AddPostForm: TAddPostForm;

implementation

{$R *.DFM}

uses uBuffer2;

procedure TAddPostForm.Prepare(id: Integer; Mode: TEditMode);
begin
    Self.Mode := Mode;
    if Mode = emNew then
        Caption := 'Додати посаду'
    else if Mode = emModify then
        Caption := 'Змінити посаду'
    else
        Caption := 'Додаткова інформація по посаді';

    Id_Post := id;

    if Mode <> emNew then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['Id_Post'] := id;
            Open;
            if DetailsQuery.IsEmpty then
                MessageDlg('Не вдалося знайти запис. Можливо, його вилучив інший користувач!',
                    mtError, [mbOk], 0);
        end;
    FormControl.Prepare(Mode);
    FormControl.SetReadOnly(Mode = emView);

    RebuildPropList;
    PreparePropList;
end;

procedure TAddPostForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    FormControl.Free;
    CategoryBox.SaveIntoRegistry;
    SPZBox.SaveIntoRegistry;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TAddPostForm.FormActivate(Sender: TObject);
begin
    CodeEdit.SetFocus;
end;

procedure TAddPostForm.FormCreate(Sender: TObject);
begin
    DetailsQuery.Transaction := ReadTransaction;
    AllPropQuery.Transaction := ReadTransaction;
    PropQuery.Transaction := ReadTransaction;
    WritePropQuery.Transaction := WriteTransaction;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_Category, FC_Code, FC_NamePost, FC_Holiday,
        FC_Work_Cond, FC_Okl_Fork, FC_Okl_Min, FC_Okl_Max,
            FC_Main_Worker, FC_OneSPZ, FC_SPZ, FC_NotDigit]);
end;

procedure TAddPostForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
    Id_PBKey: Integer;
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
begin
    if Mode = emView then Exit;

    FormControl.Read;
    if FormControl.CheckFill then
    begin
        if Okl_Fork_Box.Checked and
            (FC_Okl_Max.Value < FC_Okl_Min.Value) then
        begin
            MessageDlg('Максимальне значення повинно бути не меншим за мінімальне',
                mtError, [mbOk], 0);
            ModalResult := 0;
            Exit;
        end;

        BufTran2 := nil;
        if WriteTransaction.InTransaction then WriteTransaction.Rollback;
        WriteTransaction.StartTransaction;

        try
             // запись наших данных
            with FormControl do
                if Mode = emNew then
                    ok := ExecProc('Sp_Post_Insert', [], True)
                else
                    ok := ExecProc('Sp_Post_Update',
                        [DetailsQuery.Params.ParamValues['Id_Post']]);
            if not ok then raise Exception.Create('');

            if Mode = emNew then Id_Post := LastId;

                                 // запись свойств должности
            WriteProperties;

            if ok and not DontWriteToDbf then
            begin
                BufferQuery.Transaction := WriteTransaction;
                BufferQuery.Close;
                BufferQuery.ParamByName('Id_Post').AsInteger := Id_Post;
                BufferQuery.Open;

                First_PBKey := BufferQuery['First_PBKey'];
                Last_PBKey := BufferQuery['Last_PBKey'];

                BufTran2 := TBufferTransaction2.
                    Create('SP_POST', 'BUFF_SP_POST', WriteTransaction);
                BufTran2.WriteRange(First_PBKey, Last_PBKey);
            end;
            WriteTransaction.Commit;

        except on e: Exception do
            begin
                WriteTransaction.Rollback;
                if BufTran2 <> nil then BufTran2.RollbackOnError;

                MessageDlg('При занесенні інформації виникла помилка: ' +
                    e.Message, mtError, [mbOk], 0);
                ModalResult := 0;
            end;
        end;

        if BufTran2 <> nil then BufTran2.Free;
        Exit;
    end
    else
        ModalResult := 0;
end;

procedure TAddPostForm.WriteProperties;
var
    i, Ch: Integer;
begin
    WritePropQuery.Params.ParamValues['Id_Post'] := Id_Post;

    with PropListBox do
        for i := 0 to PropListBox.Items.Count - 1 do
        begin
            if Checked[i] then
                Ch := 1
            else
                Ch := 0;

            AllPropQuery.Locate('Name_Post_Prop', Items[i], []);

            with WritePropQuery.Params do
            begin
                ParamValues['Id_Post_Prop'] := AllPropQuery['Id_Post_Prop'];
                ParamValues['Flag'] := Ch;
            end;
            ExecQuery(WritePropQuery);
        end;
end;

procedure TAddPostForm.Okl_Fork_BoxClick(Sender: TObject);
begin
    MinLabel.Visible := Okl_Fork_Box.Checked;
    MaxLabel.Visible := Okl_Fork_Box.Checked;
    OklMinEdit.Visible := Okl_Fork_Box.Checked;
    OklMaxEdit.Visible := Okl_Fork_Box.Checked;
    FC_Okl_Min.Required := Okl_Fork_Box.Checked;
    FC_Okl_Max.Required := Okl_Fork_Box.Checked;
    if not Okl_Fork_Box.Checked then
    begin
        FC_Okl_Min.Value := '';
        FC_Okl_Max.Value := '';
    end;
end;

procedure TAddPostForm.OneSPZClick(Sender: TObject);
begin
    SPZBox.Visible := OneSPZ.Checked;
    SPZLabel.Visible := OneSPZ.Checked;
    FC_SPZ.Required := OneSPZ.Checked;
    if not OneSPZ.Checked then
        FC_SPZ.Value := -1;
end;

procedure TAddPostForm.CategoryBoxEnter(Sender: TObject);
begin
    if Mode = emView then OkButton.SetFocus;
end;

procedure TAddPostForm.AddButtonClick(Sender: TObject);
var
    form: TSpForm;
    PropParams: TSpParams;
begin
    form := TSpForm.Create(Self);
    PropParams := TSpParams.Create;
    with PropParams do
    begin
        Table := 'Sp_Post_Prop';
        Title := 'Властивості посад';
        IdField := 'Id_Post_Prop';
        SpFields := 'Name_Post_Prop';
        ColumnNames := 'Властивість посади';
        InsertProcName := 'Sp_Post_Prop_Insert';
        UpdateProcName := 'Sp_Post_Prop_Update';
        DeleteProcName := 'Sp_Post_Prop_Delete';
        SelectProcName := 'Sp_Post_Prop_Select';
        SpMode := spmNormal;
    end;

    form.Init(PropParams);
    form.ShowModal;
    RebuildPropList;
    form.Free;
    PropParams.Free;
end;

procedure TAddPostForm.RebuildPropList;
begin
    PropListBox.Clear;
    with AllPropQuery do
    begin
        Close;
        Open;
        First;
        while not Eof do
        begin

            PropListBox.Items.Add(FieldValues['Name_Post_Prop']);
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

procedure TAddPostForm.PreparePropList;
var
    i: Integer;
begin
    PropQuery.Close;
    PropQuery.Params.ParamValues['Id_Post'] := Id_Post;
    PropQuery.Open;
    if Mode = emNew then Exit;
    with PropListBox do
        for i := 0 to Items.Count - 1 do
            if PropQuery.Locate('Name_Post_Prop', Items[i], []) then
                PropListBox.Checked[i] := True;
end;


end.
