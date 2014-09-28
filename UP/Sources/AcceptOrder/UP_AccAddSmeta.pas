unit UP_AccAddSmeta;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, uCharControl,
    uIntControl, uFControl, uLabeledFControl, uSpravControl, Buttons, DB,
    FIBDataSet, pFIBDataSet, uFloatControl, uFormControl, cxControls,
    cxContainer, cxEdit, cxLabel, UP_DMAcception, uInvisControl, ActnList,
    NagScreenUnit, cxTextEdit, cxCurrencyEdit, BaseTypes;

type
    TUP_AccAddSmetaForm = class(TForm)
        cxB_GetFromShtat: TcxButton;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Smet: TqFSpravControl;
        NumSm: TqFIntControl;
        PubSprSmet: TpFIBDataSet;
        PubSprSmetID_SMETA: TFIBBCDField;
        PubSprSmetSMETA_TITLE: TFIBStringField;
        PubSprSmetSMETA_KOD: TFIBIntegerField;
        RateCount: TqFFloatControl;
        PPSVal: TqFFloatControl;
        PPSSmet: TqFSpravControl;
        PPSNumSm: TqFIntControl;
        Oklad: TqFFloatControl;
        PPSOklad: TqFFloatControl;
        OkladSum: TqFFloatControl;
        AddSmet: TqFFormControl;
        cxL_OklRange: TcxLabel;
        cxLabel1: TcxLabel;
        qFIC_KeySession: TqFInvisControl;
        IdPostSalaryReal: TqFInvisControl;
        DateBeg: TqFInvisControl;
        DateEnd: TqFInvisControl;
        OkladSTRLabel: TLabel;
        AddBonuses: TqFInvisControl;
        IdPCard: TqFInvisControl;
        ActionList1: TActionList;
        AcceptAction: TAction;
        CancelAction: TAction;
        FreeRate: TcxCurrencyEdit;
        LblFreeRate: TcxLabel;
        HoursCnt: TcxCurrencyEdit;
        lblHoursCnt: TcxLabel;
        hours_count: TqFInvisControl;
        MonthHoursCount: TqFInvisControl;
        IdTypePost: TqFInvisControl;
        //  constructor Create(aOwner: TComponent; DM: TUPAcceptDM; Mode: TFormMode; idRec: Variant; ActDate: TDate); reintroduce;
        procedure Prepare(DM: TUPAcceptDM; Key_Session: Int64;
            Id_Post_Salary_Real: Integer; Date_Beg, Date_End: TDate;
            Add_Bonuses: Boolean; Id_PCard: Variant;
            Id_Department, Id_Post_Salary, Id_Type_Post, Id_Pcard_Away: Variant;
            dost: Boolean; show_hours: Boolean; month_hours_count: Integer);

        procedure SmetOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure NumSmChange(Sender: TObject);
        procedure PPSSmetOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PPSNumSmChange(Sender: TObject);
        procedure cxB_GetFromShtatClick(Sender: TObject);

        procedure RateCountChange(Sender: TObject);
        procedure PPSValChange(Sender: TObject);
        procedure FormKeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure AcceptActionExecute(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure SmetChange(Sender: TObject);
        procedure HoursCntEditPropertiesChange(Sender: TObject);
    procedure HoursCntPropertiesEditValueChanged(Sender: TObject);

    private
        ActualDate: TDate;
        Period_Beg: TDate;
        Period_End: TDate;
        Date_Beg: TDate;
        Id_Department, Id_Post_Salary, Id_Type_Post, Id_Pcard_Away: Variant;
        ReadVacant, dost, show_hours: Boolean;
        min_level: integer;
        DmSmet: TUPAcceptDM;
        procedure CalcOklad;
        procedure OpenFreeFunds(ShowWaiting: Boolean);
        procedure ShowEnable(Show_Hours: Boolean);

    public
        Id_Man_moving_inst: Int64;
    end;

var
    UP_AccAddSmetaForm: TUP_AccAddSmetaForm;

implementation

uses GlobalSPR, uSelectForm, Math, qFTools, uFreeFundsSelect;

{$R *.dfm}

procedure TUP_AccAddSmetaForm.Prepare(DM: TUPAcceptDM; Key_Session: Int64;
    Id_Post_Salary_Real: Integer; Date_Beg, Date_End: TDate; Add_Bonuses: Boolean;
    Id_PCard: Variant; Id_Department, Id_Post_Salary, Id_Type_Post, Id_Pcard_Away: Variant;
    dost: Boolean; show_hours: Boolean; month_hours_count: Integer);
begin
    DmSmet := DM;
    PubSprSmet.DataBase := DmSmet.DB;
    qFIC_KeySession.Value := Key_Session;
    ActualDate := Date_Beg;
    IdPostSalaryReal.Value := Id_Post_Salary_Real;

    Period_Beg := Date_Beg;
    Period_End := Date_End;

    DateBeg.Value := QuotedStr(DateToStr(Date_Beg));
    DateEnd.Value := QuotedStr(DateToStr(Date_End));

    DmSmet.GetMinLevel.Close;
    DmSmet.GetMinLevel.Open;

    min_level := DmSmet.GetMinLevel['Id_Level'];

    AddBonuses.Value := Add_Bonuses;
    IdPCard.Value := Id_PCard;

    Self.Id_Department := Id_Department;
    Self.Id_Post_Salary := Id_Post_Salary;
    Self.Id_Type_Post := Id_Type_Post;
    Self.Id_Pcard_Away := Id_PCard_Away;
    Self.Date_Beg := Date_Beg;
    Self.dost := dost;
    Self.show_hours := show_hours;
    MonthHoursCount.Value := month_hours_count;
    IdTypePost.Value := Id_Type_Post;

    try
        if show_hours then
            begin
                lblHoursCnt.Top := RateCount.Top;
                lblHoursCnt.Left := RateCount.Left;
                HoursCnt.Top := lblHoursCnt.Top;
                HoursCnt.Left := lblHoursCnt.Left + lblHoursCnt.Width;
                RateCount.Left := HoursCnt.Left + HoursCnt.Width + 6;
                LblFreeRate.Left := RateCount.Left + RateCount.Width + 6;
                FreeRate.Left := LblFreeRate.Left + LblFreeRate.Width;
                { PPSVal.Blocked := True;
                 PPSSmet.Blocked := True;
                 PPSNumSm.Blocked := True;}

            end
        else if (HoursCnt.Left < RateCount.Left) then
            begin
                RateCount.Left := PPSVal.Left;
                LblFreeRate.Left := RateCount.Left + RateCount.Width + 10;
                FreeRate.Left := LblFreeRate.Left + LblFreeRate.Width + 3;
                lblHoursCnt.Top := PPSVal.Top; //на уровень ниже опускаем, там сейчас ставки
                lblHoursCnt.Left := PPSVal.Left + PPSVal.Width + 32; //выравниваем по КПО, кпо сейчас поднимется на эту строчку
                LblFreeRate.Top := RateCount.Top;
            end;
        lblHoursCnt.Visible := show_hours;
        HoursCnt.Visible := show_hours;
        //HoursCount.Asterisk := show_hours;
        PPSVal.Top := RateCount.Top + 32;
        PPSSmet.Top := PPSVal.Top + 32;
        PPSNumSm.Top := PPSSmet.Top;
        Oklad.Top := PPSSmet.Top + 32;
        cxL_OklRange.Top := Oklad.Top;
        PPSOklad.Top := Oklad.Top;
        cxLabel1.Top := Oklad.Top;
        OkladSum.Top := Oklad.Top + 32;
        OkButton.Top := OkladSum.Top + 32;
        CancelButton.Top := OkButton.Top;
    except on E: Exception do
            ShowMessage(E.Message);
    end;

    ShowEnable(show_hours);
    ReadVacant := True;
end;

procedure TUP_AccAddSmetaForm.CalcOklad;
var
    OkladSTR: string;
    cnt: Integer;
begin
    with DmSmet do
        begin
            GetSalary.Close;
            GetSalary.ParamByName('Id_Post_Salary').AsInteger := IdPostSalaryReal.Value;
            GetSalary.ParamByName('Id_Type_Post').AsInt64 := IdTypePost.Value;
            GetSalary.ParamByName('Period_Beg').AsDate := Period_Beg;
            GetSalary.ParamByName('Period_End').AsDate := Period_End;
            GetSalary.ParamByName('Rate_Count').Value := RateCount.Value;
            GetSalary.ParamByName('Hours_Count').AsDouble := HoursCnt.Value;
            GetSalary.ParamByName('Month_Hours_Count').AsInteger := MonthHoursCount.Value;
            GetSalary.ParamByName('Koeff_Pps').Value := PPSVal.Value;
            GetSalary.Open;
            GetSalary.First;

            OkladSTR := '';

            if show_hours then RateCount.Value := GetSalary['RATE_COUNT_HOURS'];

            cnt := 0;
            while not GetSalary.Eof do
                begin
                    if not VarIsNull(GetSalary['Date_Beg'])
                        and not VarIsNull(GetSalary['Oklad']) then
                        begin
                            if Period_Beg = GetSalary['Date_Beg'] then
                                begin
                                    Oklad.Value := GetSalary['Oklad'];
                                    PPSOklad.Value := GetSalary['Oklad_Pps'];
                                    OkladSum.Value := Oklad.Value + Coalesce(PPSOklad.Value, 0);
                                end;

                            if GetSalary['Oklad'] > 0 then
                                begin
                                    if OkladSTR <> '' then OkladSTR := OkladSTR + ', ';
                                    OkladSTR := OkladSTR + FloatToStr(GetSalary['Oklad']) + ' грн. з ' +
                                        DateToStr(GetSalary['Date_Beg']);
                                    inc(cnt);
                                end;
                        end;
                    GetSalary.Next;
                end;

            if cnt > 1 then OkladSTRLabel.Font.Color := clRed
            else OkladSTRLabel.Font.Color := clGreen;

            if OkladSTR <> '' then
                OkladSTRLabel.Caption := 'Оклад: ' + OkladSTR;
        end;
end;

procedure TUP_AccAddSmetaForm.SmetOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    id: Variant;
begin
    id := GlobalSPR.GetSmets(Self, PubSprSmet.Database.Handle, ActualDate, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null)
        then
        begin
            Value := id[0];
            DisplayText := IntToStr(id[3]) + '. ' + id[2];
        end;
end;

procedure TUP_AccAddSmetaForm.NumSmChange(Sender: TObject);
begin
    if VarIsNull(NumSm.Value)
        then exit;

    try
        PubSprSmet.Close;
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
                if dost then FreeRate.Value := 0
                else FreeRate.Text := '***';
            end;

    except on e: Exception do
            ShowMessage(e.Message);
    end;
end;

procedure TUP_AccAddSmetaForm.PPSSmetOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    id: Variant;
begin
    id := GlobalSPR.GetSmets(Self, PubSprSmet.Database.Handle, ActualDate, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null)
        then
        begin
            Value := id[0];
            DisplayText := IntToStr(id[3]) + '. ' + id[2];
        end;
end;

procedure TUP_AccAddSmetaForm.PPSNumSmChange(Sender: TObject);
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
        ShowMessage('Error!');
    end;
end;

procedure TUP_AccAddSmetaForm.cxB_GetFromShtatClick(Sender: TObject);
var
    form: TfmFreeFundsSelect;
begin
    OpenFreeFunds(True);
    form := TfmFreeFundsSelect.Create(Self);
    form.Prepare(dost);
    form.TableView.DataController.DataSource := DmSmet.FreeFundsSource;
    if form.ShowModal = mrOk then
        begin
            ReadVacant := False;
            Smet.Value := DmSmet.GetFreeFunds['Id_Smeta'];
            Smet.DisplayText := IntToStr(DmSmet.GetFreeFunds['Smeta_Kod']) + '. ' +
                DmSmet.GetFreeFunds['Smeta_Title'];
            if dost then FreeRate.Value := DmSmet.GetFreeFunds['Kol_Vacant_Stavok']
            else FreeRate.Text := '***';
            PPSVal.Value := DmSmet.GetFreeFunds['Koeff_Pps'];
            PPSSmet.Value := DmSmet.GetFreeFunds['Id_Smeta_Pps'];
            PPSSmet.DisplayText := DmSmet.GetFreeFunds['Smeta_Pps_Title'];
            ReadVacant := True;
            CalcOklad;

            RateCount.SetFocus;
        end;
    form.Free;
   // if DmSmet.GetFreeFunds.Transaction.Active then
      //  DmSmet.GetFreeFunds.Transaction.Rollback;
end;

procedure TUP_AccAddSmetaForm.RateCountChange(Sender: TObject);
begin
    if show_hours = false then
        CalcOklad;
end;

procedure TUP_AccAddSmetaForm.PPSValChange(Sender: TObject);
begin
    CalcOklad;
    PPSSmet.Blocked := VarIsNull(PPSVal.Value);
    PPSNumSm.Blocked := VarIsNull(PPSVal.Value);
end;

procedure TUP_AccAddSmetaForm.FormKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then OkButton.Click;
end;

procedure TUP_AccAddSmetaForm.AcceptActionExecute(Sender: TObject);
begin
    if RateCount.Value = 0 then
    begin
        if show_hours then
        begin
            //agMessageDlg('Увага!', 'Кількість годин не може дорівнювати нулю!', mtInformation, [mbOK]);
            HoursCnt.EditValue := null;
        end
        else
        begin
            //agMessageDlg('Увага!', 'Кількість ставок не може дорівнювати нулю!', mtInformation, [mbOK]);
            RateCount.Value := null;
        end;
    end;
        AddSmet.Ok;
end;

procedure TUP_AccAddSmetaForm.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TUP_AccAddSmetaForm.FormActivate(Sender: TObject);
begin

    try
        cxB_GetFromShtat.SetFocus;
        HoursCnt.EditValue := hours_count.Value;
    except on E: Exception do
            ShowMessage('E.Message');
    end;
end;

procedure TUP_AccAddSmetaForm.OpenFreeFunds(ShowWaiting: Boolean);
var
    NagScreen: TNagScreen;
begin
    if ShowWaiting then
        begin
            NagScreen := TNagScreen.Create(nil);
            NagScreen.Show;
            NagScreen.SetStatusText('Розрахунок вакантних ставок...');
        end;

    with DmSmet do
        begin
           { try
               // if GetMinLevel.Active then
                    GetMinLevel.Close;
                GetMinLevel.Open;
            except on E: Exception do
                    Showmessage(E.Message);
            end;
           }
            try
               // if GetFreeFunds.Transaction.Active then
               //     GetFreeFunds.Transaction.Rollback;

               // if GetFreeFunds.Active then
                GetFreeFunds.Close;

                GetFreeFunds.ParamByName('Id_Department').AsVariant := Id_Department;
                GetFreeFunds.ParamByName('Id_Post_Salary').AsVariant := Id_Post_Salary;
                GetFreeFunds.ParamByName('Id_Type_Post').AsVariant := Id_Type_Post;
                GetFreeFunds.ParamByName('Act_Date').AsDate := Date_Beg;
                GetFreeFunds.ParamByName('Id_Level').AsInteger := Min_Level;
                GetFreeFunds.ParamByName('Id_PCard_Away').AsVariant := Id_PCard_Away;

               // GetFreeFunds.Transaction.StartTransaction;

                GetFreeFunds.Open;

            except  on E: Exception do
                    ShowMessage(E.Message);
            end;

        end;

    if ShowWaiting then NagScreen.Free;
end;

procedure TUP_AccAddSmetaForm.SmetChange(Sender: TObject);
var
    foc: Boolean;
begin
    if ReadVacant then
        begin
            foc := NumSm.Focused;
            OpenFreeFunds(False);

            if DmSmet.GetFreeFunds.IsEmpty then
                begin
                    if dost then FreeRate.Value := 0
                    else FreeRate.Text := '***';
                end
            else
                if DmSmet.GetFreeFunds.Locate('Id_Smeta; Id_Smeta_Pps',
                    VarArrayOf([Smet.Value, PPSSmet.Value]), []) then
                    begin
                        if dost then
                            FreeRate.Value := DmSmet.GetFreeFunds['Kol_Vacant_Stavok']
                        else FreeRate.Text := '***';
                    end
                else
                    begin
                        if dost then FreeRate.Value := 0
                        else FreeRate.Text := '***';
                    end;
            if foc then NumSm.SetFocus;
        end;
end;

procedure TUP_AccAddSmetaForm.HoursCntEditPropertiesChange(
    Sender: TObject);
begin
    try
    hours_count.Value := HoursCnt.EditValue;
    if not VarIsNull(HoursCnt.Value) then
        CalcOklad;
    except on E: Exception do ShowMessage(E.Message);
    end;
end;

procedure TUP_AccAddSmetaForm.ShowEnable(Show_Hours: Boolean);
begin
    RateCount.Blocked := Show_Hours;
    PPSVal.Blocked := Show_Hours;
    PPSSmet.Blocked := Show_Hours;
    PPSNumSm.Blocked := Show_Hours;
end;

procedure TUP_AccAddSmetaForm.HoursCntPropertiesEditValueChanged(
  Sender: TObject);
begin
    hours_count.Value := HoursCnt.EditValue;
    if not VarIsNull(HoursCnt.Value) then
        CalcOklad;
end;

initialization
    RegisterClass(TUP_AccAddSmetaForm);

end.

