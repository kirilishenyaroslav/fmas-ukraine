unit IncreaseOrderUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, SpComboBox, ComCtrls, DB, IBCustomDataSet, IBQuery,
    Buttons, PersonalCommon, SpCommon, GoodFunctionsUnit, ExtCtrls, DBCtrls,
    Grids, DBGrids, DepartmentsViewUnit, ShtatRas;

type
    TIncreaseOrderForm = class(TForm)
        ResultQuery: TIBQuery;
        ResultQueryRULES_DATE: TDateField;
        ResultQueryREASON: TIBStringField;
        ResultQueryID_SR: TIntegerField;
        ResultQuerySR_NAME: TIBStringField;
        ResultQueryNEW_ID_SR: TIntegerField;
        ResultQueryNEW_SR_NAME: TIBStringField;
        OutputQuery: TIBQuery;
        SrQuery: TIBQuery;
        SrQueryNAME: TIBStringField;
        Panel1: TPanel;
        Label1: TLabel;
        Label2: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        NewSRLabel: TLabel;
        ReasonEdit: TEdit;
        RulesDate: TDateTimePicker;
        SRBox: TSpComboBox;
        MiddlePanel: TPanel;
        ResultGrid: TDBGrid;
        Panel2: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        Panel3: TPanel;
        Label8: TLabel;
        WorkDateBeg: TDBText;
        WorkDateEnd: TDBText;
        Label9: TLabel;
        Label10: TLabel;
        SearchEdit: TEdit;
        ResultQuery2: TIBQuery;
        ResultSource2: TDataSource;
        ResultQuery2ID_MOVING_DEPEND: TIntegerField;
        ResultQuery2FIO_SMALL: TIBStringField;
        ResultQuery2ID_PCARD: TIntegerField;
        ResultQuery2NEW_ID_MAN_MOVING: TIntegerField;
        ResultQuery2NEW_ID_SHTATRAS: TIntegerField;
        ResultQuery2NEW_ID_DEPARTMENT: TIntegerField;
        ResultQuery2NEW_ID_POST: TIntegerField;
        ResultQuery2NEW_DATE_BEG: TDateField;
        ResultQuery2NEW_DATE_END: TDateField;
        ResultQuery2OLD_ID_MAN_MOVING: TIntegerField;
        ResultQuery2OLD_ID_SHTATRAS: TIntegerField;
        ResultQuery2OLD_ID_DEPARTMENT: TIntegerField;
        ResultQuery2OLD_DEPARTMENT_NAME: TIBStringField;
        ResultQuery2OLD_ID_POST: TIntegerField;
        ResultQuery2OLD_POST_NAME: TIBStringField;
        ResultQuery2OLD_MONEY: TIBBCDField;
        ResultQuery2OLD_DATE_BEG: TDateField;
        ResultQuery2OLD_DATE_END: TDateField;
        ResultQuery2TN: TIntegerField;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label3: TLabel;
        Label6: TLabel;
        DBText1: TDBText;
        Label7: TLabel;
        DBText2: TDBText;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        DecBox: TCheckBox;
        DepartmentLabel: TLabel;
        Button1: TButton;
        RefreshButton: TSpeedButton;
        AllLabel: TLabel;
        ResultQuery2IS_DELETED: TBooleanField;
        ResultQuery2IS_EDITED: TBooleanField;
        ResultQuery2NEW_POST_NAME2: TIBStringField;
        ResultQuery2NEW_DEPARTMENT_NAME2: TIBStringField;
        ResultQuery2NEW_MONEY2: TIBBCDField;
        ResultQuery2NEW_DEPARTMENT_NAME: TIBStringField;
        ResultQuery2NEW_POST_NAME: TIBStringField;
        ResultQuery2NEW_MONEY: TIBBCDField;
        procedure Prepare;
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure SRBoxChange(Sender: TObject);
        procedure ResultQuery2AfterOpen(DataSet: TDataSet);
        procedure SearchEditChange(Sender: TObject);
        procedure ResultGridKeyPress(Sender: TObject; var Key: Char);
        procedure ResultGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FormResize(Sender: TObject);
        procedure DepartmentButtonClick(Sender: TObject);
        procedure Button1Click(Sender: TObject);
        procedure DecBoxClick(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ResultGridDrawColumnCell(Sender: TObject; const Rect: TRect;
            DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure ModifyButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure ResultQuery2CalcFields(DataSet: TDataSet);
    private

    public
    // in
        FMode: TEditMode;
        ID_ORDER: integer;
        ID_ACTION: integer;

        ID_ORDER_TYPE: Integer;
        ORDER_DATE: TDATE;
        NUM_ORDER: string;
        Note_Order: string;
        Id_Department: Integer;
        Only_Bad: Integer;

        temp: TShtatRasForm;

    // here

    end;

var
    IncreaseOrderForm: TIncreaseOrderForm;

implementation

uses NagScreenUnit;

{$R *.dfm}

procedure TIncreaseOrderForm.Prepare;
begin
//
    if FMode = emNew
        then begin
        ReasonEdit.Text := '';
        RulesDate.Date := Date;
        SRBox.Prepare(-1, '');
        NewSrLabel.Caption := '';
    end;

    if (FMode = emModify) or (FMode = emView)
        then begin
        ResultQuery.Close;
        ResultQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        ResultQuery.Open;

        ReasonEdit.Text := ResultQueryREASON.Value;
        RulesDate.Date := ResultQueryRULES_DATE.Value;
        SrBox.Prepare(ResultQueryID_SR.Value, ResultQuerySR_NAME.Value);

        NewSrLabel.Caption := ResultQueryNEW_SR_NAME.Value;

        MiddlePanel.Visible := True;
        {
        ResultQuery2.Close;
        ResultQuery2.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        ResultQuery2.Params.ParamValues['ID_DEPARTMENT'] := -1;
        ResultQuery2.Params.ParamValues['Only_Bad'] := -1;
        ResultQuery2.DisableControls;
        ResultQuery2.Open;
        ResultQuery2.EnableControls;
        }
        MessageDlg('Щоб відібрати записи треба нажати Оновити!', mtInformation, [mbOk], 0);
    end;

    Panel1.Enabled := not (FMode = emView);
    AddButton.Enabled := not (FMode = emView);
    ModifyButton.Enabled := not (FMode = emView);
    DeleteButton.Enabled := not (FMode = emView);

    Id_Department := -1;
    Only_Bad := -1;
end;

procedure TIncreaseOrderForm.FormCreate(Sender: TObject);
begin
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    SrQuery.Transaction := PersonalCommon.ReadTransaction;
    ResultQuery2.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
end;

procedure TIncreaseOrderForm.OkButtonClick(Sender: TObject);
var
    NagScreen: TNagScreen;
begin
    if FMode = emView
        then begin
        ModalResult := mrOk;
    end;

    if not CheckForFill(ReasonEdit, 'Підстава для підвищення окладів та тарифів')
        then exit;

    if not CheckForFill(SRBox, 'Штатний розклад')
        then exit;

    if FMode <> emNew
        then begin
        if MessageDlg('Увага! Це призведе до нового переводу, усі старі дані буде назавжди загублено!', mtConfirmation, [mbYes, mbNO], 0) <> Id_Yes then exit;
    end;

    PersonalCommon.WriteTransaction.StartTransaction;

    try
        NagScreen := TNagScreen.Create(Self);
        NagScreen.Show;
        NagScreen.SetStatusText('Автоматичний перевод усіх робітників на новий штатний розклад');

        if FMode = emNew
            then begin

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' + QuotedStr(Num_ORDER) + ',''' + DateToStr(Order_DATE) + ''',' + QuotedStr(NOTE_ORDER) + ',' + IntToStr(1) + ');';
            ID_ORDER := ExecQuery(OutputQuery);

        end;

        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE SHTAT_INCREASE_ORDER(' + QuotedStr(DateToStr(RulesDate.Date)) + ',' +
            IntToStr(Id_Order) + ',' +
            QuotedStr(ReasonEdit.Text) + ',' +
            IntToStr(SrBox.GetId) + ')';
        ExecQuery(OutputQuery);
    except on E: Exception
        do begin
            PersonalCommon.WriteTransaction.Rollback;
            ModalResult := mrNone;
            MessageDlg('При занесенні данних у базу виникла помилка: ' + E.message, mtError, [mbOk], 0);
            NagScreen.Free;
            exit;
        end;
    end;

    NagScreen.Free;
    PersonalCommon.WriteTransaction.Commit;


    MiddlePanel.Visible := True;
        {
        ResultQuery2.Close;
        ResultQuery2.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        ResultQuery2.Params.ParamValues['ID_DEPARTMENT'] := Id_Department;
        ResultQuery2.Params.ParamValues['Only_Bad'] := -1;
        ResultQuery2.DisableControls;
        ResultQuery2.Open;
        ResultQuery2.EnableControls;}
    MessageDlg('Створення наказу завершено. Щоб відібрати записи треба нажати Оновити!', mtInformation, [mbOk], 0);
end;

procedure TIncreaseOrderForm.SRBoxChange(Sender: TObject);
begin
    SrQuery.Close;
    SrQuery.Params.ParamValues['ID_SR'] := SrBox.GetId;
    SrQuery.Open;

    if not SrQuery.IsEmpty
        then NewSrLabel.Caption := SrQueryNAME.Value
    else NewSrLabel.Caption := 'Немає';
end;

procedure TIncreaseOrderForm.ResultQuery2AfterOpen(DataSet: TDataSet);
var
    i: Integer;
begin
    GridResize(ResultGrid);
    ResultQuery2.FetchAll;
    AllLabel.Caption := 'Усього записів : ' + IntToStr(ResultQuery2.RecordCount);
end;

procedure TIncreaseOrderForm.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        ResultQuery2.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        ResultQuery2.Locate('FIO_SMALL', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TIncreaseOrderForm.ResultGridKeyPress(Sender: TObject;
    var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TIncreaseOrderForm.ResultGridKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    try
        ShowMessage('OLD_Id_Man_Moving: ' + IntToStr(ResultQuery2['Old_Id_Man_Moving']) + ' New_Id_Man_Moving: ' + IntToStr(ResultQuery2['New_Id_Man_Moving']));
    except
    end;
end;

procedure TIncreaseOrderForm.FormResize(Sender: TObject);
begin
    GridResize(ResultGrid);
end;

procedure TIncreaseOrderForm.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Self);
    form.Prepare(True, RulesDate.Date);
    form.CanSelectRoot := True;
    form.ResultQuery.Locate('Id_Department', Id_Department, []);
    if form.ShowModal = mrOk then
        with form do
        begin
            Id_Department := Selected_Id;
            if Id_Department <> -1
                then begin
                DepartmentEdit.Text := ResultQuery['Name_Full'];

                ResultQuery2.Close;
                ResultQuery2.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                ResultQuery2.Params.ParamValues['ID_DEPARTMENT'] := Id_Department;
                ResultQuery2.Params.ParamValues['Only_Bad'] := Only_Bad;
                ResultQuery2.DisableControls;
                ResultQuery2.Open;
                ResultQuery2.EnableControls;
            end;
        end;
    form.Free;
end;

procedure TIncreaseOrderForm.Button1Click(Sender: TObject);
begin
    Id_Department := -1;

    DepartmentEdit.Text := '';

    ResultQuery2.Close;
    ResultQuery2.Params.ParamValues['ID_ORDER'] := ID_ORDER;
    ResultQuery2.Params.ParamValues['ID_DEPARTMENT'] := Id_Department;
    ResultQuery2.Params.ParamValues['Only_Bad'] := Only_Bad;
    ResultQuery2.DisableControls;
    ResultQuery2.Open;
    ResultQuery2.EnableControls;
end;

procedure TIncreaseOrderForm.DecBoxClick(Sender: TObject);
begin
    if DecBox.Checked
        then Only_Bad := 1
    else Only_Bad := -1;

    ResultQuery2.Close;
    ResultQuery2.Params.ParamValues['ID_ORDER'] := ID_ORDER;
    ResultQuery2.Params.ParamValues['ID_DEPARTMENT'] := Id_Department;
    ResultQuery2.Params.ParamValues['Only_Bad'] := Only_Bad;
    ResultQuery2.DisableControls;
    ResultQuery2.Open;
    ResultQuery2.EnableControls;
end;

procedure TIncreaseOrderForm.RefreshButtonClick(Sender: TObject);
begin
    ResultQuery2.Close;
    ResultQuery2.Params.ParamValues['ID_ORDER'] := ID_ORDER;
    ResultQuery2.Params.ParamValues['ID_DEPARTMENT'] := Id_Department;
    ResultQuery2.Params.ParamValues['Only_Bad'] := Only_Bad;
    ResultQuery2.DisableControls;
    ResultQuery2.Open;
    ResultQuery2.EnableControls;
end;

procedure TIncreaseOrderForm.DeleteButtonClick(Sender: TObject);
begin
    if not CheckQueryForDel(ResultQuery2) then exit;

    OutputQuery.Close;
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE SHTAT_INCREASE_MOVING_DEP_DEL(' + ResultQuery2ID_MOVING_DEPEND.AsString + ')';
    ExecQuery(OutputQuery);

    ResultQuery2['IS_DELETED'] := True;
    ResultQuery2['IS_EDITED'] := False;
end;

procedure TIncreaseOrderForm.ResultGridDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin

    if (ResultQuery2IS_DELETED.Value = True)
        then
        ResultGrid.Canvas.Brush.Color := clRed
    else
        ResultGrid.Canvas.Brush.Color := ResultGrid.Color;

    if (ResultQuery2IS_EDITED.Value = True)
        then
        ResultGrid.Canvas.Brush.Color := clGreen
    else
        if (ResultQuery2IS_DELETED.Value <> True)
            then ResultGrid.Canvas.Brush.Color := ResultGrid.Color;

    if (gdSelected in State) and (not (ResultQuery2IS_DELETED.Value = True)) and (not (ResultQuery2IS_EDITED.Value = True))
        then
        ResultGrid.Canvas.Brush.Color := clGray;


    ResultGrid.Canvas.FillRect(Rect);
    ResultGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State)

end;

procedure TIncreaseOrderForm.ModifyButtonClick(Sender: TObject);
begin
    if ResultQuery2['IS_DELETED'] = True
        then begin
        MessageDlg('Цей запис вилучено, неможливе його редагування!', mtError, [mbOk], 0);
        exit;
    end;

    if temp = nil then temp := TShtatRasForm.Create(Self, spmReadOnly + [spfCantRemoveFilter], -1, -1, True, RulesDate.Date);

    temp.WindowState := wsMaximized;
    temp.ShowModal;

    if temp.ModalResult = mrOk then begin

        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE SHTAT_INCREASE_MOVING_DEP_UPD(' + ResultQuery2NEW_ID_MAN_MOVING.AsString + ',' + IntToStr(temp.ShtatQuery['ID_SHTATRAS']) + ')';
        ExecQuery(OutputQuery);


        ResultQuery2IS_EDITED.Value := True;

        ResultQuery2NEW_DEPARTMENT_NAME2.Value := temp.DepartmentsQuery['NAME_SHORT'];
        ResultQuery2NEW_MONEY2.Value := temp.ShtatQuery['MONEY'];
        ResultQuery2NEW_POST_NAME2.Value := temp.ShtatQuery['NAME_POST'];
    end;
end;

procedure TIncreaseOrderForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    temp.Free;
end;

procedure TIncreaseOrderForm.ResultQuery2CalcFields(DataSet: TDataSet);
begin
    if not varisnull(ResultQuery2['NEW_POST_NAME'])
        then ResultQuery2NEW_POST_NAME2.Value := ResultQuery2['NEW_POST_NAME'];

    if not varisnull(ResultQuery2['NEW_DEPARTMENT_NAME'])
        then ResultQuery2NEW_DEPARTMENT_NAME2.Value := ResultQuery2['NEW_DEPARTMENT_NAME'];

    if not varisnull(ResultQuery2['NEW_MONEY'])
        then ResultQuery2NEW_MONEY2.Value := ResultQuery2['NEW_MONEY'];
end;

end.
