
{ -$Id: DepartmentsDetailsUnit.pas,v 1.4 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                   Модуль "Редактирование подразделения"                      }
{               Добавление/изменение данных о подразделении                    }
{                                                  ответственный: Олег Волков  }

unit DepartmentsDetailsUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpCommon, EditControl, StdCtrls, Buttons, ComCtrls, Mask, CheckEditUnit,
    SpComboBox, Db, IBCustomDataSet, IBQuery, FieldControl, CheckLst,
    SpFormUnit, IBSQL, DepartmentsViewUnit, PersonalCommon, Buffer;

type
    TDepartmentsDetailsForm = class(TForm)
        CancelButton: TBitBtn;
        NameFullLabel: TLabel;
        NameFullEdit: TCheckEdit;
        NameShortLabel: TLabel;
        NameShortEdit: TCheckEdit;
        DepTypeBox: TSpComboBox;
        TypeLabel: TLabel;
        DetailsQuery: TIBQuery;
        FC_NameFull: TFieldControl;
        FC_NameShort: TFieldControl;
        FC_DepType: TFieldControl;
        ParentLabel: TLabel;
        DateBegLabel: TLabel;
        DateEndLabel: TLabel;
        DateBegPicker: TDateTimePicker;
        DateEndPicker: TDateTimePicker;
        FC_DateBeg: TFieldControl;
        FC_DateEnd: TFieldControl;
        PropertiesLabel: TLabel;
        PropListBox: TCheckListBox;
        OkButton: TBitBtn;
        AllPropQuery: TIBQuery;
        AllPropQueryID_PROPERTY: TIntegerField;
        AllPropQueryNAME_PROPERTY: TIBStringField;
        PropQuery: TIBQuery;
        PropQueryID_PROPERTY: TIntegerField;
        PropQueryNAME_PROPERTY: TIBStringField;
        CodeLabel: TLabel;
        CodeEdit: TCheckEdit;
        FC_Code: TFieldControl;
        DetailsQueryID_DEP_TYPE: TIntegerField;
        DetailsQueryDEPARTMENT_CODE: TIBStringField;
        DetailsQueryNAME_FULL: TIBStringField;
        DetailsQueryNAME_SHORT: TIBStringField;
        DetailsQueryDATE_BEG: TDateField;
        DetailsQueryDATE_END: TDateField;
        ChangeProperty: TIBQuery;
        GetIdDepartmentQuery: TIBQuery;
        AddButton: TSpeedButton;
        BufferQuery: TIBQuery;
        procedure FormCreate(Sender: TObject);
        procedure DepTypeBoxEnter(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure NameShortEditEnter(Sender: TObject);
        procedure PropListBoxClick(Sender: TObject);
    private
        procedure RebuildPropList;
        procedure PreparePropList;
    public
        IDDEP: Integer;
        Mode: TEditMode;
        DepEditControl: TEditControl;
        PropParams: TSpParams;
        id, id_parent: Integer;
        Name_Department, Name_Parent: string;
        procedure Prepare(Mode: TEditMode);
    end;

var
    DepartmentsDetailsForm: TDepartmentsDetailsForm;

implementation

{$R *.DFM}

uses uBuffer2;


procedure TDepartmentsDetailsForm.Prepare(Mode: TEditMode);
begin
    Self.Mode := Mode;

    DetailsQuery.Params.ParamValues['Id_Department'] := id;
    DetailsQuery.Close;
    DetailsQuery.Open;

    PropQuery.Params.ParamValues['Id_Department'] := id;
    PropQuery.Close;
    PropQuery.Open;

    DepEditControl.Prepare(Mode);
    DepEditControl.SetReadOnly(Mode = emView);
    PreparePropList;

    if Mode = emNew then
        ParentLabel.Caption := 'Додається до складу підрозділу «' +
            Name_Parent + '»'
    else ParentLabel.Caption := 'Належить до складу підрозділу «' +
        Name_Parent + '»';
end;

procedure TDepartmentsDetailsForm.FormCreate(Sender: TObject);
begin
    GetIdDepartmentQuery.Transaction := ReadTransaction;
    DetailsQuery.Transaction := ReadTransaction;
    AllPropQuery.Transaction := ReadTransaction;
    PropQuery.Transaction := ReadTransaction;
    ChangeProperty.Transaction := WriteTransaction;
    BufferQuery.Transaction := BufferTransaction;

    RebuildPropList;

    DepEditControl := TEditControl.Create;
    DepEditControl.Add([FC_Code, FC_NameFull, FC_NameShort, FC_DepType,
        FC_DateBeg, FC_DateEnd]);

    PropParams := TSpParams.Create;
    with PropParams do
    begin
        Table := 'Sp_Dep_Prop';
        Title := 'Властивості підрозділів';
        IdField := 'Id_Property';
        SpFields := 'Name_Property';
        ColumnNames := 'Властивість';
        InsertProcName := 'Sp_Dep_Prop_Insert';
        UpdateProcName := 'Sp_Dep_Prop_Update';
        DeleteProcName := 'Sp_Dep_Prop_Delete';
        SpMode := spmNormal;
    end;
end;

procedure TDepartmentsDetailsForm.DepTypeBoxEnter(Sender: TObject);
begin
    if Sender is TWinControl then
        if (Sender as TWinControl).TabStop = False then
            OkButton.SetFocus;
end;

procedure TDepartmentsDetailsForm.FormActivate(Sender: TObject);
begin
    CodeEdit.SetFocus;
end;

procedure TDepartmentsDetailsForm.OkButtonClick(Sender: TObject);
var
    IDPARENT, i, Ch: Integer;
    ok: Boolean;
    Id_PBKey: Integer;
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
begin
    if Mode = emView then Exit;

    DepEditControl.Read;
    if not DepEditControl.CheckFill then
    begin
        ModalResult := 0;
        Exit;
    end;

    if Mode = emNew then
    begin
        IDDEP := ExecQuery(GetIdDepartmentQuery);
    end
    else IDDEP := id;

    if id_parent = -1 then IDPARENT := IDDEP
    else IDPARENT := id_parent;

    BufTran2 := nil;
    if WriteTransaction.InTransaction then WriteTransaction.Rollback;
    WriteTransaction.StartTransaction;
    try
          // пишем данные в свою базу
        ok := DepEditControl.ExecProc('Sp_Department_Insert', [IDPARENT, IDDEP]);
        if not ok then raise Exception.Create('');

                 // пишем свойства
        with PropListBox do
            for i := 0 to PropListBox.Items.Count - 1 do
            begin
                if Checked[i] then Ch := 1
                else Ch := 0;
                with ChangeProperty.SQL do
                begin
                    Clear;
                    AllPropQuery.Locate('Name_Property', Items[i], []);
                    Add('EXECUTE PROCEDURE SP_DEP_PROPERTIES_UPDATE ' +
                        IntToStr(AllPropQuery['Id_Property']) + ',' + IntToStr(IDDEP) + ',' +
                        IntToStr(Ch));
                end;
                ExecQuery(ChangeProperty);
            end;

        if not DontWriteToDbf then
        begin
            BufferQuery.Transaction := WriteTransaction;
            BufferQuery.Close;
            BufferQuery.ParamByName('Id_Department').AsInteger := IDDEP;
            BufferQuery.Open;

            First_PBKey := BufferQuery['First_PBKey'];
            Last_PBKey := BufferQuery['Last_PBKey'];

            BufTran2 := TBufferTransaction2.
                Create('SP_PODRK', 'BUFF_SP_PODRK', WriteTransaction);
            BufTran2.WriteRange(First_PBKey, Last_PBKey);
        end;
        WriteTransaction.Commit;

    except on e: Exception do
        begin
            WriteTransaction.Rollback;
            if BufTran2 <> nil then BufTran2.RollbackOnError;

            ModalResult := 0;

            MessageDlg('При занесенні інформації виникла помилка: ' +
                e.Message, mtError, [mbOk], 0);
        end;
    end;

    if BufTran2 <> nil then BufTran2.Free;
end;


procedure TDepartmentsDetailsForm.AddButtonClick(Sender: TObject);
var
    form: TSpForm;
begin
    form := TSpForm.Create(Self);
    form.Init(PropParams);
    form.ShowModal;
    RebuildPropList;
    form.Free;
end;

procedure TDepartmentsDetailsForm.PreparePropList;
var
    i: Integer;
begin
    for i := 0 to PropListBox.Items.Count - 1 do
        PropListBox.Checked[i] := False;
    if Mode = emNew then Exit;
    with PropListBox do
        for i := 0 to Items.Count - 1 do
            if PropQuery.Locate('Name_Property', Items[i], []) then
                PropListBox.Checked[i] := True;
end;

procedure TDepartmentsDetailsForm.RebuildPropList;
begin
    PropListBox.Clear;
    with AllPropQuery do
    begin
        Close;
        Open;
        First;
        while not Eof do
        begin

            PropListBox.Items.Add(FieldValues['Name_Property']);
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

procedure TDepartmentsDetailsForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    DepEditControl.Free;
    PropParams.Free;
    DepTypeBox.SaveIntoRegistry;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TDepartmentsDetailsForm.NameShortEditEnter(Sender: TObject);
begin
    if NameShortEdit.Text = '' then
        NameShortEdit.Text :=
            Copy(NameFullEdit.Text, 1, NameShortEdit.MaxLength);
end;

procedure TDepartmentsDetailsForm.PropListBoxClick(Sender: TObject);
begin
    if Mode = emView then
        MessageDlg('У режимі просмотра ці дані не змінюються',
            mtWarning, [mbOk], 0);
end;

end.
