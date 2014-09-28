unit UP_HP_AddPHoliday;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uAddModifForm, UP_HP_DM, uFormControl, uMemoControl,
    uCharControl, uIntControl, uDateControl, uFControl, uLabeledFControl,
    uSpravControl, StdCtrls, Buttons, ExtCtrls, DB, FIBDataSet, pFIBDataSet,
    uLogicCheck, uSimpleCheck, uInvisControl, qFTools, ActnList, cxControls,
    cxContainer, cxEdit, cxTextEdit, cxMemo, cxLabel, FIBQuery, pFIBQuery,
    pFIBStoredProc;

type
    THP_AddPlanHol = class(TAddModifForm)
        qFFC_AddPeriod: TqFFormControl;
        qFSC_Period: TqFSpravControl;
        qFDC_DBeg: TqFDateControl;
        qFDC_DEnd: TqFDateControl;
        qFSC_HType: TqFSpravControl;
        qFIC_Days: TqFIntControl;
        BottomPanel: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        qFSC_People: TqFSpravControl;
        qFSC_ChPeriod: TqFSimpleCheck;
        qFIC_PPBeg: TqFInvisControl;
        qFIC_PPEnd: TqFInvisControl;
        qFSC_PBeg: TqFSimpleCheck;
        qFSC_PEnd: TqFSimpleCheck;
        qFIC_Fact: TqFIntControl;
        ActionList1: TActionList;
        SecretAction: TAction;
        OK: TAction;
        ESC: TAction;
        cxM_Note: TcxMemo;
        Label1: TLabel;
        VisibleUsedDays: TAction;
        UserLabel: TcxLabel;
        DateTimeLabel: TcxLabel;
        CheckIDecret: TpFIBDataSet;
        StorProc: TpFIBStoredProc;
        VisibleDatesAction: TAction;
        HolCount: TpFIBDataSet;
        ActCheckPlanFactDays: TAction;
        lblPlanFactDyas: TcxLabel;
        qFIC_Group: TqFInvisControl;
        procedure qFSC_HTypeOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure qFSC_PeriodOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure qFSC_PeopleOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure qFSC_PeopleChange(Sender: TObject);
        procedure OKExecute(Sender: TObject);
        procedure ESCExecute(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure VisibleUsedDaysExecute(Sender: TObject);
        procedure VisibleDatesActionExecute(Sender: TObject);
        procedure ActCheckPlanFactDaysExecute(Sender: TObject);
    private
        Mode: TFormMode;
        CheckPlanFactDays: Boolean;
        { Private declarations }
    public
        TDM: THP_DM;
        ActDate: TDate;
        CheckVal: Integer;
        id_pcard: variant;
        can_add_hol: Integer;
        VisibleDays, VisibleDates: boolean;
        Id_Holiday_Period: Integer;
        constructor Create(AOwner: TComponent; DMod: THP_DM; Mode: TFormMode; Where: Variant); reintroduce;
        { Public declarations }
    end;

implementation

{$R *.dfm}

uses RxMemDS, uCommonSP, uUnivSprav, UP_HP_Full;

constructor THP_AddPlanHol.Create(AOwner: TComponent; DMod: THP_DM; Mode: TFormMode; Where: Variant);
begin
    inherited Create(AOwner);
    Self.Mode := Mode;
    DBHandle := Integer(DMod.pFIBD_HP.Handle);
    qFIC_Fact.Blocked := True;
    qFFC_AddPeriod.Prepare(DMod.pFIBD_HP, Mode, Where, Null);
    Self.CheckPlanFactDays := True;
end;

procedure THP_AddPlanHol.qFSC_HTypeOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
    CountDays, HolidayDays: Integer;
begin

    TDM := THP_DM.Create(Self);
    with Params do
    begin
        FormCaption := 'Довідник типів відпусток';
        ShowMode := fsmSelect;
        ShowButtons := [fbExit];
        if varIsNull(qFIC_Group.Value) then
            TableName := 'HL_SP_TYPE_PHOLIDAY_SEL'
        else
            TableName := 'HL_SP_TYPE_PHOLIDAY_SEL WHERE ID_GROUP_HOLIDAY = ' + VarToStr(qFIC_Group.Value);
        Fields := 'FULL_NAME,ID_TYPE_HOLIDAY,ID_GROUP_HOLIDAY';
        FieldsName := 'Назва';
        KeyField := 'ID_TYPE_HOLIDAY';
        ReturnFields := 'FULL_NAME,ID_TYPE_HOLIDAY,ID_GROUP_HOLIDAY';
        DBHandle := Self.DBHandle;
    end;
    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut) then
    begin
        value := output['ID_TYPE_HOLIDAY'];
        DisplayText := VarToStr(output['FULL_NAME']);
        qFIC_Group.Value := output['ID_GROUP_HOLIDAY'];
        CheckIDecret.Close;
        CheckIDecret.SQLs.SelectSQL.Text := 'SELECT H.ID_TYPE_HOLIDAY ' +
            'FROM   HL_SP_TYPE_HOLIDAY H, HOLIDAY_PROPERTY P ' +
            'WHERE P.ID_HOLIDAY=H.ID_TYPE_HOLIDAY AND ' +
            'P.ID_PROP=99 AND ' +
            'H.ID_TYPE_HOLIDAY=:ID_TYPE_HOLIDAY ';
        CheckIDecret.ParamByName('ID_TYPE_HOLIDAY').AsInteger := value;
        CheckIDecret.Open;
        if not VarIsNull(CheckIDecret['ID_TYPE_HOLIDAY']) then
        begin
            CountDays := (qFIC_PPEnd.Value - qFIC_PPBeg.Value) + 1;
            HolCount.Close;
            HolCount.SQLs.SelectSQL.Text :=
                'select HCOUNT from HOLIDAYS_BETWEEN_2_DATES_EX(:id_type,:date_beg, :date_end)';
            HolCount.ParamByName('id_type').AsInteger := Value;
            HolCount.ParamByName('date_beg').AsDate := qFIC_PPBeg.Value;
            HolCount.ParamByName('date_end').AsDate := qFIC_PPEnd.Value;
            HolCount.Open;
            HolidayDays := HolCount['HCOUNT'];
            if VarIsNull(HolidayDays) then
                HolidayDays := 0;
            CountDays := CountDays - HolidayDays;
            qFIC_Days.Value := CountDays;
        end;
    end;

end;

procedure THP_AddPlanHol.qFSC_PeriodOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    if VarIsNull(id_pcard) then
    begin
        qFErrorDialog('Треба спочатку обрати особисту картку!');
        //MessageDlg('Треба спочатку обрати особисту картку!', mtError, [mbOk],-1);
        Exit;
    end;

    Screen.Cursor := crHourGlass;

    with Params do
    begin
        FormCaption := 'За який період надається планова відпустка?';
        ShowMode := fsmSelect;
        //ShowButtons := [fbExit, fbAdd, fbModif, fbDelete];
        ShowButtons := [fbExit];
        TableName := 'HL_DT_PHOLIDAY_SEL_BY_PCARD2(' + IntToStr(id_pcard) + ')';
        if not (VarIsNull(qFIC_Group.Value)) then
            TableName := TableName + ' WHERE ID_GROUP_HOLIDAY = ' + VarToStr(qFIC_Group.Value);
        Fields := 'PERIOD_STR,WORK_POST_STR,ID_HOLIDAY_PERIOD,ID_WORK_DOG_MOVING,PERIOD_BEG,PERIOD_END,ID_GROUP_HOLIDAY';
        FieldsName := 'Період,~*Посада';
        AddFormClass := 'THP_AddPeriod';
        ModifFormClass := 'THP_AddPeriod';
        DeleteSQL := 'execute procedure HL_DT_HOLIDAY_PERIODS_DEL(:ID_HOLIDAY_PERIOD)';
        KeyField := 'ID_HOLIDAY_PERIOD';
        ReturnFields := 'WORK_POST_STR,PERIOD_STR,ID_HOLIDAY_PERIOD,ID_WORK_DOG_MOVING,PERIOD_BEG,PERIOD_END,ID_GROUP_HOLIDAY';
        DBHandle := Self.DBHandle;
        AddParametrs := TRxMemoryData.Create(Self);

        AddParametrs.FieldDefs.Add('id_pcard', ftVariant);
        AddParametrs.Open;
        AddParametrs.Append;
        AddParametrs['id_pcard'] := id_pcard;
        AddParametrs.Post;
    end;
    OutPut := TRxMemoryData.Create(self);
    try
        Screen.Cursor := crDefault;
        if GetUnivSprav(Params, OutPut) then
        begin
            value := VarAsType(output['ID_HOLIDAY_PERIOD'], varInt64);
            qFDC_DBeg.Value := VarAsType(output['PERIOD_BEG'], varDate);
            qFDC_DEnd.Value := VarAsType(output['PERIOD_END'], varDate);
            qFIC_PPBeg.SetValue(output['PERIOD_BEG']);
            qFIC_PPEnd.SetValue(output['PERIOD_END']);
            DisplayText := VarToStr(output['WORK_POST_STR']) + ': ' + VarToStr(output['PERIOD_STR']);
            qFIC_Group.Value := output['ID_GROUP_HOLIDAY'];
        end;

    except on E: Exception do
        begin
            // qFSC_Period.OpenSprav;
           //exit;
        end;
    end;

end;

procedure THP_AddPlanHol.qFSC_PeopleOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    sp := GetSprav('asup\PCardsList');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := DBHandle;
            FieldValues['ActualDate'] := Date;
            FieldValues['AdminMode'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['ShowStyle'] := 0;
            FieldValues['NewVersion'] := 1;
            Post;
        end;
        sp.Show;

        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];
        end;
    end;
end;

procedure THP_AddPlanHol.qFSC_PeopleChange(Sender: TObject);
begin
    id_pcard := qFSC_People.Value;
end;

procedure THP_AddPlanHol.OKExecute(Sender: TObject);
begin
    if (qFIC_Days.Value < qFIC_Fact.Value) and Self.CheckPlanFactDays then
    begin
        ShowMessage('Використаних днів не може бути більше запланованих!');
        exit;
    end;
    ModalResult := mrOk;
end;

procedure THP_AddPlanHol.ESCExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure THP_AddPlanHol.FormCreate(Sender: TObject);
begin
    qFDC_DBeg.Visible := False;
    qFDC_DEnd.Visible := False;
    //qFIC_Days.Value:=0;
end;

procedure THP_AddPlanHol.VisibleUsedDaysExecute(Sender: TObject);
begin
    if (VisibleDays = False) then
    begin
        qFIC_Fact.Blocked := True;
        VisibleDays := True;
    end
    else
    begin
        qFIC_Fact.Blocked := False;
        VisibleDays := False;
    end;
end;

procedure THP_AddPlanHol.VisibleDatesActionExecute(Sender: TObject);
begin
    if (VisibleDates = False) then
    begin
        qFDC_DBeg.Visible := False;
        qFDC_DEnd.Visible := False;
        qFDC_DBeg.Blocked := True;
        qFDC_DEnd.Blocked := True;
        VisibleDates := True;
    end
    else
    begin
        qFDC_DBeg.Visible := True;
        qFDC_DEnd.Visible := True;
        qFDC_DBeg.Blocked := True;
        qFDC_DEnd.Blocked := True;
        VisibleDates := False;

    end;
end;

procedure THP_AddPlanHol.ActCheckPlanFactDaysExecute(Sender: TObject);
begin
    Self.CheckPlanFactDays := not Self.CheckPlanFactDays;
    if Self.CheckPlanFactDays = False then
        lblPlanFactDyas.Visible := True
    else
        lblPlanFactDyas.Visible := False;
end;

initialization
    RegisterClass(THP_AddPlanHol);

end.
