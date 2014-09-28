unit uMoveAddSmet;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uSpravControl, uCharControl,
    uIntControl, StdCtrls, Buttons, cxLookAndFeelPainters, cxButtons,
    cxControls, cxContainer, cxEdit, cxLabel, uFloatControl, DB, FIBDataSet,
    pFIBDataSet, uInvisControl, cxTextEdit, cxCurrencyEdit;

type
    TfrmAddSmet = class(TForm)
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        PPSNumSm: TqFIntControl;
        cxB_GetFromShtat: TcxButton;
        NumSm: TqFIntControl;
        PubSprSmet: TpFIBDataSet;
        PubSprSmetID_SMETA: TFIBBCDField;
        PubSprSmetSMETA_TITLE: TFIBStringField;
        PubSprSmetSMETA_KOD: TFIBIntegerField;
        GetFreeFunds: TpFIBDataSet;
        FreeFundsSource: TDataSource;
        GetSalary: TpFIBDataSet;
        FreeRate: TcxCurrencyEdit;
        LblFreeRate: TcxLabel;
        Smet: TqFSpravControl;
        PPSVal: TqFFloatControl;
        PPSSmet: TqFSpravControl;
    cntHours: TcxCurrencyEdit;
    lblHoursCount: TcxLabel;
    lblRateCount: TcxLabel;
    RateCount: TcxCurrencyEdit;
    GetRateCount: TpFIBDataSet;
    pFIBDataSet1: TpFIBDataSet;
    FIBStringField1: TFIBStringField;
    FIBFloatField1: TFIBFloatField;
    FIBFloatField2: TFIBFloatField;
    FIBFloatField3: TFIBFloatField;
    FIBStringField2: TFIBStringField;
    FIBStringField3: TFIBStringField;
    FIBIntegerField1: TFIBIntegerField;
    FIBStringField4: TFIBStringField;
    FIBIntegerField2: TFIBIntegerField;
    FIBFloatField4: TFIBFloatField;
    FIBStringField5: TFIBStringField;
    FIBIntegerField3: TFIBIntegerField;
    FIBIntegerField4: TFIBIntegerField;
    FIBIntegerField5: TFIBIntegerField;
    FIBIntegerField6: TFIBIntegerField;
    FIBStringField6: TFIBStringField;
    FIBIntegerField7: TFIBIntegerField;
    FIBStringField7: TFIBStringField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    VariantField1: TVariantField;
        procedure SmetaEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure SmetaPPSEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure btnCancelClick(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
        procedure cxB_GetFromShtatClick(Sender: TObject);
        procedure SmetOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure NumSmChange(Sender: TObject);
        procedure RateCountChange(Sender: TObject);
        procedure PPSValChange(Sender: TObject);
        procedure PPSSmetOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PPSNumSmChange(Sender: TObject);
    procedure cntHoursPropertiesChange(Sender: TObject);
    private
        { Private declarations }
    public
        mov_dostup: boolean;
        IdPostSalary : Integer;
        PeriodBeg, PeriodEnd : TDate;
        cntMonth, IdTypePost : Smallint;
    end;

var
    frmAddSmet: TfrmAddSmet;

implementation
uses uMoveAdd, GlobalSPR, qfTools, uMoveFreeFundsSelect;
{$R *.dfm}

procedure TfrmAddSmet.SmetaEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    smet: Variant;
begin
    smet := GetSmets(self, TfrmAddMoving(Owner).Database.Handle, Date, psmSmetWithoutPeriod);
    if VarArrayDimCount(smet) > 0 then
    begin
        if smet[0] <> 0 then
        begin
            Value := smet[0];
            DisplayText := smet[2];
            //      kod_sm := smet[3];
        end;
    end;
end;

procedure TfrmAddSmet.SmetaPPSEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    smet: Variant;
begin
    smet := GetSmets(self, TfrmAddMoving(Owner).Database.Handle, Date, psmSmetWithoutPeriod);
    if VarArrayDimCount(smet) > 0 then
    begin
        if smet[0] <> 0 then
        begin
            Value := smet[0];
            DisplayText := smet[2];
            //      kod_sm := smet[3];
        end;
    end;
end;

procedure TfrmAddSmet.btnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmAddSmet.btnOkClick(Sender: TObject);
begin
    if qFCheckAll(Self) then ModalResult := mrOk;
end;

procedure TfrmAddSmet.cxB_GetFromShtatClick(Sender: TObject);
var
    form: TfmMoveFreeFundsSelect;
begin
  try
    GetFreeFunds.Close;
    GetFreeFunds.ParamByName('Id_Post_Salary').AsVariant := TfrmAddMoving(Owner).PosadOkladEdit.Value;
    GetFreeFunds.ParamByName('Id_Department').AsVariant := TfrmAddMoving(Owner).DepartmentEdit.Value;
    GetFreeFunds.ParamByName('Id_Type_Post').AsVariant := TfrmAddMoving(Owner).PersonalTypeEdit.Value;
    GetFreeFunds.ParamByName('Act_Date').AsDate := TfrmAddMoving(Owner).cxDateBegEdit.Date;
    GetFreeFunds.ParamByName('Id_Level').AsInteger := 199;
    if TfrmAddMoving(Owner).Id_PCard_Away = -1 then
        GetFreeFunds.ParamByName('Id_PCard_Away').AsVariant := Null
    else
        GetFreeFunds.ParamByName('Id_PCard_Away').AsInt64 := TfrmAddMoving(Owner).Id_PCard_Away;

    GetFreeFunds.Open;

    form := TfmMoveFreeFundsSelect.Create(Self);

    form.mov_fdostup := mov_dostup;

    form.TableView.DataController.DataSource := FreeFundsSource;
    if form.ShowModal = mrOk then
    begin
        Smet.Value := GetFreeFunds['Id_Smeta'];
        Smet.DisplayText := GetFreeFunds['Smeta_Title'];
        if mov_dostup then FreeRate.Value := GetFreeFunds['Kol_Vacant_Stavok']
        else FreeRate.Text := '***';
        PPSVal.Value := GetFreeFunds['Koeff_Pps'];
        PPSSmet.Value := GetFreeFunds['Id_Smeta_Pps'];
        PPSSmet.DisplayText := GetFreeFunds['Smeta_Pps_Title'];
    end;

    form.Free;
    //GetFreeFunds.Close;
    if RateCount.Enabled then RateCount.SetFocus
    else cntHours.SetFocus;
  except on E:Exception
         do begin
              ShowMessage(E.Message);
         end;
  end;       
end;

procedure TfrmAddSmet.SmetOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    id: Variant;
begin
    id := GlobalSPR.GetSmets(Self, TfrmAddMoving(Owner).Database.Handle, now, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null)
        then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TfrmAddSmet.NumSmChange(Sender: TObject);
begin
    if VarIsNull(NumSm.Value)
        then exit;

    try
        PubSprSmet.Close;
        PubSprSmet.Database := TfrmAddMoving(Owner).Database;
        PubSprSmet.Transaction := TfrmAddMoving(Owner).WriteTransaction;
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(NumSm.Value);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;

        if PubSprSmet.RecordCount = 1 then
        begin
            Smet.Value := PubSprSmet['ID_SMETA'];
            Smet.DisplayText := IntToStr(PubSprSmet['SMETA_KOD']) +
                '. ' + PubSprSmet['SMETA_TITLE'];
        end
        else
        begin
            Smet.Value := Null;
            Smet.DisplayText := 'бюджет не знайдено!';
            if mov_dostup then FreeRate.Value := 0
            else FreeRate.Text := '***';
        end;



    except on e: Exception do
            ShowMessage(e.Message);
    end;
end;

procedure TfrmAddSmet.RateCountChange(Sender: TObject);
begin
    //    CalcOklad;
end;

procedure TfrmAddSmet.PPSValChange(Sender: TObject);
begin
    //    CalcOklad;
    PPSSmet.Blocked := VarIsNull(PPSVal.Value);
    PPSNumSm.Blocked := VarIsNull(PPSVal.Value);
end;

procedure TfrmAddSmet.PPSSmetOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    id: Variant;
begin
    id := GlobalSPR.GetSmets(Self, TfrmAddMoving(Owner).Database.Handle, now, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null)
        then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TfrmAddSmet.PPSNumSmChange(Sender: TObject);
begin
    if VarIsNull(PPSNumSm.Value)
        then exit;

    try
        PubSprSmet.Close;
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(PPSNumSm.Value);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;

        if PubSprSmet.RecordCount = 1
            then
        begin
            PPSSmet.Value := PubSprSmet['ID_SMETA'];
            PPSSmet.DisplayText := IntToStr(PubSprSmet['SMETA_KOD']) +
                '. ' + PubSprSmet['SMETA_TITLE'];
        end;
    except
        ShowMessage('Помилка!');
    end;
end;


procedure TfrmAddSmet.cntHoursPropertiesChange(Sender: TObject);
begin
    if cntHours.Text = '' then exit;

    try
        GetRateCount.Close;
        GetRateCount.SQLs.SelectSQL.Text := 'select distinct * from up_get_salary_period2(:id_post_salary,'+
                                                                    ':id_type_post, :period_beg, :period_end, :rate_count,'+
                                                                    ':hours_count, :month_hours_count, :koeff_pps)';
        GetRateCount.ParamByName('id_post_salary').AsInteger := IdPostSalary;
        GetRateCount.ParamByName('id_type_post').AsShort := IdTypePost;
        GetRateCount.ParamByName('period_beg').AsDate := PeriodBeg;
        GetRateCount.ParamByName('period_end').AsDate := PeriodEnd;
        GetRateCount.ParamByName('rate_count').Value := null;
        if cntHours.EditingText = '' then GetRateCount.ParamByName('hours_count').AsDouble := 0
        else GetRateCount.ParamByName('hours_count').Value := cntHours.EditValue;
        GetRateCount.ParamByName('month_hours_count').AsShort := cntMonth;
        if VarIsNull(PPSVal.Value) then GetRateCount.ParamByName('koeff_pps').AsDouble := 0
        else GetRateCount.ParamByName('koeff_pps').AsDouble := PPSVal.Value;
        GetRateCount.Open;
        GetRateCount.FetchAll;
        if GetRateCount.RecordCount > 0 then
        begin
            if (not VarIsNull(GetRateCount['RATE_COUNT_HOURS'])) then RateCount.Value := GetRateCount['RATE_COUNT_HOURS'];
        end
        else
        begin
            RateCount.Value := 0;
        end;
    except on e: Exception do
            ShowMessage(e.Message);
    end;
end;

end.
