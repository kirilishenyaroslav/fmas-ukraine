unit ManWorkModeChangeUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, DB,
    IBCustomDataSet, IBQuery, SpFormUnit, SpCommon, PersonalCommon, WorkModeCentral;

type
    TManWorkModeChangeForm = class(TForm)
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        BonusGrid: TDBGrid;
        Panel3: TPanel;
        Label2: TLabel;
        Label9: TLabel;
        SearchEdit: TEdit;
        WriteQuery: TIBQuery;
        ResultQuery: TIBQuery;
        ResultSource: TDataSource;
        OrderItemsButton: TSpeedButton;
        ResultQueryID_WORK_MODE_CHANGE: TIntegerField;
        ResultQueryID_MAN_MOVING: TIntegerField;
        ResultQueryRMOVING: TIntegerField;
        ResultQueryID_WORK_MODE: TIntegerField;
        ResultQuerySHIFT: TIntegerField;
        ResultQueryDATE_BEG: TDateField;
        ResultQueryDATE_END: TDateField;
        ResultQueryREASON: TIBStringField;
        ResultQueryNUM_ITEM: TIntegerField;
        ResultQueryIS_ACTIVE: TIntegerField;
        ResultQueryPIDSTAVA: TIBStringField;
        ResultQueryFIO: TIBStringField;
        ResultQueryWHY: TIBStringField;
        ResultQueryDEPARTMENT_NAME: TIBStringField;
        ResultQueryPOST_NAME: TIBStringField;
        ResultQueryWORK_MODE_NAME: TIBStringField;
        ResultQueryTN: TIntegerField;
        ResultQueryID_PCARD: TIntegerField;
        ViewButton: TSpeedButton;
        ResultQueryID_HOSPITAL: TIntegerField;
        ResultQueryHOSP_STR: TIBStringField;
        SpeedButton1: TSpeedButton;
        ResultQueryUSE_KOL_STAVOK: TIntegerField;
        procedure BitBtn2Click(Sender: TObject);
        procedure OrderItemsButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure ResultQueryAfterOpen(DataSet: TDataSet);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure ViewButtonClick(Sender: TObject);
        procedure FormResize(Sender: TObject);
    private

        Num_Item: Integer;
        FMode: TEditMode;
        NUM_ORDER: string;

    public
        ID_ORDER: Integer;
        Order_Date: TDate;

        constructor Create(AOwner: TComponent; ID_ORDER_TYPE: Integer; aOrder_Date: TDate; aNUM_ORDER: string; Note_Order: string; Mode: TEditMode; idOrder: Integer = -1; numItem: Integer = -1);
            reintroduce;
    end;

var
    ManWorkModeChangeForm: TManWorkModeChangeForm;

implementation

uses DtManBonusItemsUnit, AddManWorkModeChangeUnit, GoodFunctionsUnit;

{$R *.dfm}

constructor TManWorkModeChangeForm.Create(AOwner: TComponent; ID_ORDER_TYPE: Integer; aOrder_Date: TDate; aNUM_ORDER: string; Note_Order: string; Mode: TEditMode; idOrder: Integer = -1; numItem: Integer = -1);
begin
    inherited Create(AOwner);

    FMode := Mode;
    Num_Order := aNUM_ORDER;
    Order_Date := aOrder_Date;

    WriteQuery.Transaction := PersonalCommon.WriteTransaction;
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;

    Id_Order := idOrder;
    Num_Item := numItem;


    if FMode = emNew then
    begin

        PersonalCommon.WriteTransaction.StartTransaction;

        try
            WriteQuery.Close;
            WriteQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' +
                QuotedStr(Num_ORDER) + ',''' +
                DateToStr(Order_DATE) + ''',' +
                QuotedStr(NOTE_ORDER) + ',' +
                IntToStr(1) + ');';
            Id_Order := ExecQuery(WriteQuery);

        except on e: exception
            do
            begin
                PersonalCommon.WriteTransaction.Rollback;
                ModalResult := mrNone;
                MessageDlg('При занесенні данних у базу виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
                exit;
            end;
        end;

        PersonalCommon.WriteTransaction.Commit;

    end;

    ResultQuery.Close;
    ResultQuery.Params.ParamValues['ID_ORDER'] := id_Order;
    ResultQuery.Open;

    Caption := 'Зміна графіків працівникам за наказом №' + NUM_ORDER;

    if FMode = emView then
    begin
        AddButton.Enabled := False;
        ModifyButton.Enabled := False;
        DeleteButton.Enabled := False;
        OrderItemsButton.Enabled := False;

        Caption := Caption + ' (перегляд)';
    end;

end;

procedure TManWorkModeChangeForm.BitBtn2Click(Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.OkButton.Visible := False;
    Form.Prepare;

    Form.ShowModal;

    Form.Free;
end;

procedure TManWorkModeChangeForm.OrderItemsButtonClick(Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.OkButton.Visible := False;
    Form.Prepare;

    Form.ShowModal;

    Form.Free;
end;

procedure TManWorkModeChangeForm.AddButtonClick(Sender: TObject);
var
    form: TAddManWorkModeChangeForm;
    new_id: Integer;
    use_kol_stavok: Integer;
begin
    form := TAddManWorkModeChangeForm.Create(self);
    Form.Order_Date := Order_Date;
    Form.FMode := emNew;
    Form.Id_Order := Id_Order;

    if Form.ShowModal = mrOk then
    begin
        if form.UseKolStavokBox.Checked then Use_Kol_Stavok := 1
        else Use_Kol_Stavok := 0;

        WriteQuery.Transaction.StartTransaction;

        try

            WriteQuery.Close;

            WriteQuery.SQL.Text := 'SELECT ID_WORK_MODE_CHANGE FROM DT_WORK_MODE_CHANGE_INSERT_2(' +
                IntToStr(Form.ID_MAN_MOVING) + ',' +
                IntToStr(Form.WorkModeBox.GetId) + ',' +
                IntToStr(Form.RealShift) + ',' +
                QuotedStr(DateToStr(Form.DateBeg.Date)) + ',' +
                QuotedStr(DateToStr(Form.DateEnd.Date)) + ',' +
                QuotedStr('Наказ №' + NUM_ORDER) + ',' +
                IntToStr(ID_ORDER) + ',' +
                Form.NumItemEdit.Text + ',' +
                IntToStr(1) + ',' +
                QuotedStr(Form.PidstavaEdit.Text) + ',' +
                QuotedStr(Form.WhyEdit.Text) + ',' +
                IntToStr(Use_Kol_Stavok) + ')';

            new_id := ExecQuery(WriteQuery);

            if not (VarIsNull(Form.Hospital.Value) and (Form.Hospital.DisplayText = '')) then
            begin

                WriteQuery.Close;
                WriteQuery.SQL.Text := 'update DT_WORK_MODE_CHANGE set ID_HOSPITAL = ' +
                    VarToStr(Form.Hospital.Value) + ' where ID_WORK_MODE_CHANGE = ' + IntToStr(new_id);
                ExecQuery(WriteQuery);

            end;

        except on E: Exception do
            begin
                ErrMsg('При занесенні даних віникла помилка: "' + E.Message + '"');
                WriteQuery.Transaction.Rollback;
                Form.Free;
                exit;
            end;
        end;

        WriteQuery.Transaction.Commit;
        QueryCloseOpen(ResultQuery, 'ID_WORK_MODE_CHANGE', new_id);
    end;

    Form.Free;
end;

procedure TManWorkModeChangeForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TManWorkModeChangeForm.ResultQueryAfterOpen(DataSet: TDataSet);
begin
    GridResize(BonusGrid);
end;

procedure TManWorkModeChangeForm.DeleteButtonClick(Sender: TObject);
begin
    if not CheckQueryForDel(ResultQuery) then exit;

    WriteQuery.Close;
    WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_WORK_MODE_CHANGE_DELETE(' + IntToStr(ResultQueryID_WORK_MODE_CHANGE.value) + ')';
    ExecQuery(WriteQuery);

    ResultQuery.Close;
    ResultQuery.Open;
end;

procedure TManWorkModeChangeForm.ModifyButtonClick(Sender: TObject);
var
    form: TAddManWorkModeChangeForm;
    new_id: Integer;
    not_real_shift: Integer;
    USe_Kol_Stavok: Integer;
begin
    if not CheckQueryForModify(ResultQuery) then exit;

    form := TAddManWorkModeChangeForm.Create(self);
    Form.Order_Date := Order_Date;
    Form.FMode := emModify;
    Form.Id_Order := Id_Order;

    Form.WorkModeBox.Prepare(-1, '');

    Form.FIO.Text := ResultQueryFIO.Value;
    Form.DepartmentName.Text := ResultQueryDEPARTMENT_NAME.Value;
    Form.PostName.Text := ResultQueryPOST_NAME.Value;
    Form.ID_PCARD := ResultQueryID_PCARD.Value;
    Form.ID_MAN_MOVING := ResultQueryID_MAN_MOVING.Value;

    Form.DateBeg.Date := ResultQueryDATE_BEG.Value;
    Form.DateEnd.Date := ResultQueryDATE_END.Value;

    Form.Hospital.Value := ResultQuery['ID_HOSPITAL'];
    Form.IsHospital.Checked := not VarIsNull(Form.Hospital.Value);
    Form.Hospital.DisplayText := ResultQueryHOSP_STR.Value;

//    not_real_shift := ConvertShift(ResultQuerySHIFT.Value, ResultQueryDATE_BEG.value, False);
//    Form.ShiftSpin.Value := not_real_shift;

        // берем реальную сдвижку, блин
    Form.ShiftSpin.Value := ResultQuerySHIFT.Value;

    Form.DateBegChange(Form.DateBeg);
    Form.WhyEdit.Text := ResultQueryWHY.Value;
    Form.PidstavaEdit.Text := ResultQueryPIDSTAVA.Value;
    Form.NumItemEdit.Text := ResultQueryNUM_ITEM.AsString;

    Form.WorkModeBox.Prepare(ResultQueryID_WORK_MODE.Value, ResultQueryWORK_MODE_NAME.Value);

    if ResultQuery['Use_Kol_Stavok'] = 1 then form.UseKolStavokBox.Checked := True
    else form.UseKolStavokBox.Checked := False;

    if ResultQueryDATE_END.Value = PersonalCommon.Consts_Query['DATE_END']
        then
    begin
        Form.RadioButton1.Checked := true;
        Form.RadioButton1Click(Form.RadioButton1);
    end;

    if Form.ShowModal = mrOk then
    begin
        if form.UseKolStavokBox.Checked then Use_Kol_Stavok := 1
        else Use_Kol_Stavok := 0;

        WriteQuery.Transaction.StartTransaction;

        try

            WriteQuery.Close;

            WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_WORK_MODE_CHANGE_UPDATE_3(' +
                IntToStr(ResultQueryID_WORK_MODE_CHANGE.Value) + ',' +
                IntToStr(Form.ID_MAN_MOVING) + ',' +
                IntToStr(Form.WorkModeBox.GetId) + ',' +
                IntToStr(Form.RealShift) + ',' +
                QuotedStr(DateToStr(Form.DateBeg.Date)) + ',' +
                QuotedStr(DateToStr(Form.DateEnd.Date)) + ',' +
                QuotedStr('Наказ №' + NUM_ORDER) + ',' +
                IntToStr(ID_ORDER) + ',' +
                Form.NumItemEdit.Text + ',' +
                IntToStr(1) + ',' +
                QuotedStr(Form.PidstavaEdit.Text) + ',' +
                QuotedStr(Form.WhyEdit.Text) + ',' +
                IntToStr(Use_Kol_Stavok) + ')';
            ExecQuery(WriteQuery);

            new_id := ResultQueryID_WORK_MODE_CHANGE.Value;

            if not (VarIsNull(Form.Hospital.Value) and (Form.Hospital.DisplayText = '')) then
            begin
                WriteQuery.Close;
                WriteQuery.SQL.Text := 'update DT_WORK_MODE_CHANGE set ID_HOSPITAL = ' +
                    IntToStr(Form.Hospital.Value) + ' where ID_WORK_MODE_CHANGE = ' + IntToStr(new_id);
                ExecQuery(WriteQuery);
            end;

        except on E: Exception do
            begin
                ErrMsg('При занесенні даних віникла помилка: "' + E.Message + '"');
                WriteQuery.Transaction.Rollback;
                Form.Free;
                exit;
            end;
        end;

        WriteQuery.Transaction.Commit;
        QueryCloseOpen(ResultQuery, 'ID_WORK_MODE_CHANGE', new_id);
    end;

    Form.Free;

end;

procedure TManWorkModeChangeForm.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        ResultQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        ResultQuery.Locate('FIO', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TManWorkModeChangeForm.ViewButtonClick(Sender: TObject);
var
    form: TAddManWorkModeChangeForm;
    new_id: Integer;
    not_real_shift: Integer;
begin
    if not CheckQueryForModify(ResultQuery) then exit;

    form := TAddManWorkModeChangeForm.Create(self);
    Form.Order_Date := Order_Date;
    Form.FMode := emView;
    Form.Panel1.Enabled := False;
    Form.Id_Order := Id_Order;

    Form.WorkModeBox.Prepare(-1, '');

    Form.FIO.Text := ResultQueryFIO.Value;
    Form.DepartmentName.Text := ResultQueryDEPARTMENT_NAME.Value;
    Form.PostName.Text := ResultQueryPOST_NAME.Value;
    Form.ID_PCARD := ResultQueryID_PCARD.Value;
    Form.ID_MAN_MOVING := ResultQueryID_MAN_MOVING.Value;

    Form.DateBeg.Date := ResultQueryDATE_BEG.Value;
    Form.DateEnd.Date := ResultQueryDATE_END.Value;

    Form.Hospital.Value := ResultQuery['ID_HOSPITAL'];
    Form.IsHospital.Checked := not VarIsNull(Form.Hospital.Value);
    Form.Hospital.DisplayText := ResultQueryHOSP_STR.Value;

//    not_real_shift := ConvertShift(ResultQuerySHIFT.Value, ResultQueryDATE_BEG.value, False);
//    Form.ShiftSpin.Value := not_real_shift;

    Form.ShiftSpin.Value := ResultQuerySHIFT.Value;

    if ResultQuery['Use_Kol_Stavok'] = 1 then form.UseKolStavokBox.Checked := True
    else form.UseKolStavokBox.Checked := False;

    Form.DateBegChange(Form.DateBeg);
    Form.WhyEdit.Text := ResultQueryWHY.Value;
    Form.PidstavaEdit.Text := ResultQueryPIDSTAVA.Value;
    Form.NumItemEdit.Text := ResultQueryNUM_ITEM.AsString;

    Form.WorkModeBox.Prepare(ResultQueryID_WORK_MODE.Value, ResultQueryWORK_MODE_NAME.Value);

    if ResultQueryDATE_END.Value = PersonalCommon.Consts_Query['DATE_END']
        then
    begin
        Form.RadioButton1.Checked := true;
        Form.RadioButton1Click(Form.RadioButton1);
    end;

    Form.ShowModal;

    Form.Free;
end;

procedure TManWorkModeChangeForm.FormResize(Sender: TObject);
begin
    GridResize(BonusGrid);
end;

end.
