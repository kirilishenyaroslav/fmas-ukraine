Unit UNewHolidayParams;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, cxCalendar, cxDropDownEdit, cxCalc, cxControls,
    cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, Buttons,
    uFControl, uLabeledFControl, uCharControl, uIntControl, uSpravControl,
    FIBDatabase, pFIBDatabase, Ibase, pFibQuery, cxLookAndFeelPainters,
    cxButtons, ExtCtrls, ActnList, pFibStoredProc, uBoolControl, cxRadioGroup,
    cxCheckBox, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
    cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxClasses,
    RxMemDS;

Type
    TfrmNewHolidayParams = Class(TForm)
        WorkDatabase: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        ActionList1: TActionList;
        Action1: TAction;
        Action2: TAction;
        Panel1: TPanel;
        Label3: TLabel;
        HolidayPeriod: TqFSpravControl;
        Label11: TLabel;
        WorkDogValue: TqFCharControl;
        Label9: TLabel;
        PostValue: TqFCharControl;
        Label10: TLabel;
        IsPostMainValue: TqFBoolControl;
        Panel2: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Panel3: TPanel;
        Label5: TLabel;
        Label6: TLabel;
        HolidayDayCount: TqFIntControl;
        Label7: TLabel;
        TotalDayCount: TqFIntControl;
        Panel4: TPanel;
        Label2: TLabel;
        StartDate: TcxDateEdit;
        Label8: TLabel;
        DateEndForCalc: TcxDateEdit;
        Label4: TLabel;
        cxButton1: TcxButton;
        cxButton2: TcxButton;
        PeriodArrayButton: TcxButton;
        Panel5: TPanel;
        NotFixedTypeHoliday: TcxRadioButton;
        Label12: TLabel;
        FixedTypeHoliday: TcxRadioButton;
        Label1: TLabel;
        HolidayType: TqFSpravControl;
        Panel6: TPanel;
        PeriodsPanel: TPanel;
        StyleRepository: TcxStyleRepository;
        stBackground: TcxStyle;
        stContent: TcxStyle;
        stContentEven: TcxStyle;
        stContentOdd: TcxStyle;
        stFilterBox: TcxStyle;
        stFooter: TcxStyle;
        stGroup: TcxStyle;
        stGroupByBox: TcxStyle;
        stHeader: TcxStyle;
        stInactive: TcxStyle;
        stIncSearch: TcxStyle;
        stIndicator: TcxStyle;
        stPreview: TcxStyle;
        stSelection: TcxStyle;
        stHotTrack: TcxStyle;
        ContentError: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        ItemsGrid: TcxGrid;
        PeopleView: TcxGridDBTableView;
        PeopleViewDBColumn2: TcxGridDBColumn;
        PeopleViewDBColumn4: TcxGridDBColumn;
        PeopleViewDBColumn3: TcxGridDBColumn;
        cxGridLevel5: TcxGridLevel;
        PeopleViewDBColumn1: TcxGridDBColumn;
        PeopleViewDBColumn5: TcxGridDBColumn;
        PeriodsDataSet: TRxMemoryData;
        PeriodsDataSetdate_beg: TDateTimeField;
        PeriodsDataSetdate_end: TDateTimeField;
        PeriodsDataSetorder_count: TIntegerField;
        PeriodsDataSethol_count: TIntegerField;
        PeriodsDataSetsum_count: TIntegerField;
        PeriodsDataSource: TDataSource;
        Panel7: TPanel;
        AddPeriodButton: TcxButton;
        cxButton3: TcxButton;
        cxButton4: TcxButton;
        DayCount: TcxTextEdit;
        Procedure OkButtonClick(Sender: TObject);
        Procedure CancelButtonClick(Sender: TObject);
        Procedure HolidayTypeOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure HolidayPeriodOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure cxButton1Click(Sender: TObject);
        Procedure cxButton2Click(Sender: TObject);
        Procedure DateEndForCalcPropertiesChange(Sender: TObject);
        Procedure NotFixedTypeHolidayClick(Sender: TObject);
        Procedure FixedTypeHolidayClick(Sender: TObject);
        Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
        Procedure DateEndForCalcExit(Sender: TObject);
        Procedure PeriodArrayButtonClick(Sender: TObject);
        Procedure AddPeriodButtonClick(Sender: TObject);
        Procedure cxButton3Click(Sender: TObject);
        Procedure cxButton4Click(Sender: TObject);
        Procedure DayCountExit(Sender: TObject);
        Procedure HolidayTypeChange(Sender: TObject);
        Procedure HolidayPeriodChange(Sender: TObject);
    private
        { Private declarations }
        cid_pcard: int64;
        cshow_plan_holidays: Integer;
        UpdateFlag: integer;
        IdGroupHoliday: Variant;
        IdGroupHolidayPeriod: Variant;
        Function CheckCrossPeriods(Ds: TDataSet; date_beg, date_end: TDateTime): Boolean;
    public
        { Public declarations }
        out_id_work_dog_moving: Variant;
        auto_fill_not_post_main_values: Integer;
        id_post: Variant;
        is_post_main: Variant;
        max_day_count: Integer;
        loc_is_insert: Boolean;
        id_annual_holiday: Integer;
        id_annual_holiday_val: String;
        Constructor Create(AOwner: TComponent;
            DB_Handle: TISC_DB_HANDLE;
            id_type_holiday: integer;
            id_holiday_period: variant;
            date_start: TdateTime;
            end_date: TdateTime;
            day_count: integer;
            ipcard: int64;
            can_edit_holiday: Boolean;
            show_plan_holidays: Integer;
            id_work_dog_moving: variant;
            id_post_in: variant;
            is_post_main_in: variant;
            show_radio_buttons: Boolean;
            is_insert: boolean = false); reintroduce;
    End;


Implementation

Uses uUnivSprav, qFTools, FIBQuery, BaseTypes, DateUtils, UpKernelUnit;

{$R *.dfm}

Procedure TfrmNewHolidayParams.OkButtonClick(Sender: TObject);
Begin
    If (HolidayPeriod.Value = null) And FixedTypeHoliday.Checked And (Not loc_is_insert)
        Then
    Begin
        agShowMessage('Треба вибрати період, за який надається відпустка!');
        exit;
    End;


    If (HolidayType.Value = null) And FixedTypeHoliday.Checked
        Then
    Begin
        agShowMessage('Треба вибрати тип відпустки!');
        exit;
    End;

    If DayCount.EditValue = null
        Then
    Begin
        agShowMessage('Треба ввести кількість днів відпустки!');
        exit;
    End;


    ModalResult := mrYes;
End;

Procedure TfrmNewHolidayParams.CancelButtonClick(Sender: TObject);
Begin
    ModalResult := mrNo;
End;

Procedure TfrmNewHolidayParams.HolidayTypeOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Params.FormCaption := 'Довідник типів відпусток';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    If cshow_plan_holidays = -1
        Then
        Params.TableName := 'HL_SP_TYPE_HOLIDAY_SEL';
    If cshow_plan_holidays = 0
        Then
        Params.TableName := 'HL_SP_TYPE_NPHOLIDAY_SEL';
    If cshow_plan_holidays = 1
        Then
        Params.TableName := 'HL_SP_TYPE_PHOLIDAY_SEL';
    If Not (VarIsNull(IdGroupHolidayPeriod)) Then
        Params.TableName := Params.TableName + ' WHERE ID_GROUP_HOLIDAY = ' + VarToStr(IdGroupHolidayPeriod);

    Params.Fields := 'FULL_NAME,CHECK_PLAN_WITH_FACT,ID_TYPE_HOLIDAY,ID_GROUP_HOLIDAY';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_TYPE_HOLIDAY';
    Params.ReturnFields := 'FULL_NAME,CHECK_PLAN_WITH_FACT,ID_TYPE_HOLIDAY,ID_GROUP_HOLIDAY';
    Params.DBHandle := Integer(WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        value := output['ID_TYPE_HOLIDAY'];
        DisplayText := VarToStr(output['FULL_NAME']);
        HolidayPeriod.Value := null;
        HolidayPeriod.Clear;
        IdGroupHoliday := output['ID_GROUP_HOLIDAY'];
    End;

End;

Constructor TfrmNewHolidayParams.Create(AOwner: TComponent;
    DB_Handle: TISC_DB_HANDLE;
    id_type_holiday: integer;
    id_holiday_period: variant;
    date_start: TdateTime;
    end_date: TdateTime;
    day_count: integer;
    ipcard: int64;
    can_edit_holiday: Boolean;
    show_plan_holidays: Integer;
    id_work_dog_moving: variant;
    id_post_in: variant;
    is_post_main_in: variant;
    show_radio_buttons: Boolean;
    is_insert: boolean = false);
Var
    GetInfo: TpFibQuery;
    GetInfoStoredProc: TpFibStoredProc;
Begin
    Inherited Create(Aowner);
    self.loc_is_insert := is_insert;

    UpdateFlag := 0;
    auto_fill_not_post_main_values := 0;

    IdGroupHoliday := null;
    IdGroupHolidayPeriod := null;
     
    cid_pcard := ipcard;
    WorkDatabase.Handle := DB_Handle;
    ReadTransaction.StartTransaction;

    cshow_plan_holidays := show_plan_holidays;

    GetInfo := TpFibQuery.Create(self);
    GetInfo.Database := WorkDatabase;
    GetInfo.Transaction := ReadTransaction;

    GetInfo.Close;
    GetInfo.SQL.Text := 'SELECT ID_ANNUAL_HOLIDAY FROM UP_SYS_INI_CONSTS';
    GetInfo.ExecQuery;
    If GetInfo.RecordCount > 0
        Then
    Begin
        id_annual_holiday := GetInfo.FieldByName('ID_ANNUAL_HOLIDAY').Value;
    End;
    GetInfo.Close;
    If Not VarIsNull(id_annual_holiday) Then
    Begin
        GetInfo.SQL.Text := 'SELECT FULL_NAME FROM HL_SP_TYPE_HOLIDAY WHERE ID_TYPE_HOLIDAY=' +
            IntToStr(id_annual_holiday);
        GetInfo.ExecQuery;
        If GetInfo.RecordCount > 0
            Then
            id_annual_holiday_val := GetInfo.FieldByName('FULL_NAME').Value;
    End;
    GetInfo.Close;

    If (id_type_holiday <> -1)
        Then
    Begin
        GetInfo.SQL.Text := 'SELECT * FROM HL_SP_TYPE_HOLIDAY WHERE ID_TYPE_HOLIDAY=' + IntToStr(id_type_holiday);
        GetInfo.ExecQuery;
        If GetInfo.RecordCount > 0
            Then
        Begin
            HolidayType.Value := id_type_holiday;
            HolidayType.DisplayText := GetInfo.FieldByName('FULL_NAME').Value;
            IdGroupHoliday := GetInfo.FieldByName('ID_GROUP_HOLIDAY').Value;
            If GetInfo.FieldByName('CHECK_PLAN_WITH_FACT').Value = 1
                Then
            Begin
                HolidayPeriod.Value := null;
                HolidayPeriod.Clear;
            End;
        End;

        Self.Height := Self.Height - PeriodsPanel.Height;
    End
    Else
    Begin
        If is_insert
            Then
        Begin
            AutoLoadFromRegistry(self, Nil);

            Label3.Visible := False;
            Label9.Visible := False;
            Label10.Visible := False;
            Label11.Visible := False;


            HolidayPeriod.Visible := False;
            WorkDogValue.Visible := False;
            PostValue.Visible := False;
            IsPostMainValue.Visible := False;
            Panel1.Visible := False;

            Self.Height := Self.Height - Panel1.Height;
            Self.Height := Self.Height - PeriodsPanel.Height;

            PeriodArrayButton.Visible := True;
        End;
    End;

    //Получаем количество праздничных дней между двумя датами
    StartDate.Date := date_start;

    GetInfoStoredProc := TpFibStoredProc.Create(self);
    GetInfoStoredProc.Database := WorkDatabase;
    GetInfoStoredProc.Transaction := ReadTransaction;
    GetInfoStoredProc.StoredProcName := 'HOLIDAYS_BETWEEN_2_DATES_EX';
    GetInfoStoredProc.Prepare;
    GetInfoStoredProc.ParamByName('ID_TYPE_HOLIDAY').Value := HolidayType.Value;
    GetInfoStoredProc.ParamByName('DATE1').Value := StartDate.Date;
    GetInfoStoredProc.ParamByName('DATE2').Value := end_date;
    GetInfoStoredProc.ExecProc;
    HolidayDayCount.Value := GetInfoStoredProc.ParamByName('HCOUNT').Value;
    GetInfoStoredProc.Close;
    GetInfoStoredProc.Free;

    DayCount.EditValue := Day_Count;

    DateEndForCalc.Date := end_date;
    TotalDayCount.Value := DaysBetween(StartDate.Date, DateEndForCalc.Date) + 1;


    If (id_holiday_period <> null)
        Then
    Begin
        self.out_id_work_dog_moving := id_work_dog_moving;
        self.id_post := id_post_in;
        self.is_post_main := is_post_main_in;

        IsPostMainValue.Value := is_post_main;

        GetInfoStoredProc := TpFibStoredProc.Create(self);
        GetInfoStoredProc.Database := WorkDatabase;
        GetInfoStoredProc.Transaction := ReadTransaction;
        GetInfoStoredProc.StoredProcName := 'UP_KER_GET_POST_INFO';
        GetInfoStoredProc.Prepare;
        GetInfoStoredProc.ParamByName('ID_POST').Value := id_post;
        GetInfoStoredProc.ExecProc;
        PostValue.Value := GetInfoStoredProc.ParamByName('NAME_POST').Value;
        GetInfoStoredProc.Close;

        If out_id_work_dog_moving <> null
            Then
        Begin
            GetInfoStoredProc.StoredProcName := 'UP_KER_GET_RMOVING_INFO';
            GetInfoStoredProc.Prepare;
            GetInfoStoredProc.ParamByName('ID_WORK_DOG_MOVING').asInt64 := out_id_work_dog_moving;
            GetInfoStoredProc.ExecProc;
            WorkDogValue.Value := GetInfoStoredProc.ParamByName('STR_VALUE').Value;
            GetInfoStoredProc.Close;
        End;

        HolidayPeriod.Clear;
        HolidayPeriod.Value := id_holiday_period;

        GetInfoStoredProc.StoredProcName := 'UP_KER_GET_HOLIDAY_PERIOD_INFO';
        GetInfoStoredProc.Prepare;
        GetInfoStoredProc.ParamByName('ID_HOLIDAY_PERIOD').asInt64 := id_holiday_period;
        GetInfoStoredProc.ExecProc;
        HolidayPeriod.DisplayText := GetInfoStoredProc.ParamByName('PERIOD_STR').Value;
        IdGroupHolidayPeriod := GetInfoStoredProc.ParamByName('ID_GROUP_HOLIDAY').Value;
        GetInfoStoredProc.Close;

        GetInfoStoredProc.Free;
    End;

    GetInfo.Free;

    //HolidayType.Blocked := not can_edit_holiday;
    UpdateFlag := 1;

    If NotFixedTypeHoliday.Checked Then
    Begin
        HolidayType.Enabled := False;
        If can_edit_holiday = false Then
        Begin
            HolidayType.Value := id_annual_holiday;
            HolidayType.DisplayText := id_annual_holiday_val;
            HolidayType.Enabled := False;
        End;
    End;
    //NotFixedTypeHoliday.Enabled:=show_radio_buttons;
    //FixedTypeHoliday.Enabled   :=show_radio_buttons;
    //Label12.Enabled            :=show_radio_buttons;

    If Not show_radio_buttons
        Then
    Begin
        NotFixedTypeHoliday.Visible := show_radio_buttons;
        FixedTypeHoliday.Visible := show_radio_buttons;
    End;
End;


Procedure TfrmNewHolidayParams.HolidayPeriodOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Screen.Cursor := crHourGlass;
    Params.FormCaption := 'За який період надається планова відпустка?';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'HL_DT_PHOLIDAY_SEL_BY_PCARD(' + IntToStr(cid_pcard) + ')';
    If Not (VarIsNull(IdGroupHoliday)) Then
        Params.TableName := Params.TableName + ' WHERE ID_GROUP_HOLIDAY = ' + VarToStr(IdGroupHoliday);
    Params.Fields :=
        'PERIOD_STR,WORK_POST_STR,ID_HOLIDAY_PERIOD,ID_WORK_DOG_MOVING,PERIOD_BEG,PERIOD_END,ID_POST,IS_POST_MAIN,NAME_POST,ID_GROUP_HOLIDAY';
    Params.FieldsName := 'Період,~*Посада';
    Params.KeyField := 'ID_HOLIDAY_PERIOD';
    Params.ReturnFields :=
        'WORK_POST_STR,PERIOD_STR,ID_HOLIDAY_PERIOD,ID_WORK_DOG_MOVING,PERIOD_BEG,PERIOD_END,ID_POST,IS_POST_MAIN,NAME_POST,ID_GROUP_HOLIDAY';
    Params.DBHandle := Integer(WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    Screen.Cursor := crDefault;
    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        WorkDogValue.Value := VarToStr(output['WORK_POST_STR']);
        value := output['ID_HOLIDAY_PERIOD'];
        id_post := output['ID_POST'];
        is_post_main := output['IS_POST_MAIN'];
        IsPostMainValue.Value := output['IS_POST_MAIN'];
        PostValue.Value := output['NAME_POST'];
        out_id_work_dog_moving := output['ID_WORK_DOG_MOVING'];
        DisplayText := VarToStr(output['PERIOD_STR']);
        IdGroupHolidayPeriod := output['ID_GROUP_HOLIDAY'];
    End;

End;

Procedure TfrmNewHolidayParams.cxButton1Click(Sender: TObject);
Var
    GetInfoStoredProc: TpFibStoredProc;
Begin
    //Необходимо получить количество дней между двумя датами
    TotalDayCount.Value := DaysBetween(StartDate.Date, DateEndForCalc.Date) + 1;

    //Получаем количество праздничных дней между двумя датами
    GetInfoStoredProc := TpFibStoredProc.Create(self);
    GetInfoStoredProc.Database := WorkDatabase;
    GetInfoStoredProc.Transaction := ReadTransaction;
    GetInfoStoredProc.StoredProcName := 'HOLIDAYS_BETWEEN_2_DATES_EX';
    GetInfoStoredProc.Prepare;
    GetInfoStoredProc.ParamByName('ID_TYPE_HOLIDAY').Value := HolidayType.Value;
    GetInfoStoredProc.ParamByName('DATE1').Value := StartDate.Date;
    GetInfoStoredProc.ParamByName('DATE2').Value := DateEndForCalc.Date;
    GetInfoStoredProc.ExecProc;
    HolidayDayCount.Value := GetInfoStoredProc.ParamByName('HCOUNT').Value;
    GetInfoStoredProc.Close;
    GetInfoStoredProc.Free;

    DayCount.EditValue := TotalDayCount.Value - HolidayDayCount.Value;
End;

Procedure TfrmNewHolidayParams.cxButton2Click(Sender: TObject);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    If PeriodArrayButton.Caption = '>>'
        Then
    Begin
        If PeriodsDataSet.Active
            Then
        Begin
            If PeriodsDataSet.RecordCount > 0
                Then
            Begin
                If PeriodsDataSet.FieldByName('order_count').Value > 0
                    Then
                Begin
                    Params.FormCaption := 'Святкові дні за період ' + PeriodsDataSet.fieldbyname('date_beg').asstring +
                        '-' + PeriodsDataSet.fieldbyname('date_end').asstring;
                    Params.ShowMode := fsmSelect;
                    Params.ShowButtons := [fbExit];
                    Params.TableName := 'HOLIDAYS_BETWEEN_2_DATES_EX2(' + '''' +
                        PeriodsDataSet.fieldbyname('date_beg').asstring + '''' + ',' + '''' +
                        PeriodsDataSet.fieldbyname('date_end').asstring + '''' + ')';
                    Params.Fields := 'HDATE';
                    Params.FieldsName := 'Свято';
                    Params.KeyField := 'HDATE';
                    Params.ReturnFields := 'HDATE';
                    Params.DBHandle := Integer(WorkDatabase.Handle);

                    OutPut := TRxMemoryData.Create(self);

                    GetUnivSprav(Params, OutPut);
                End
                Else
                    agShowMessage('Немає жодного святкового дня!');
            End;
        End;
    End
    Else
    Begin
        If (HolidayDayCount.Value > 0)
            Then
        Begin
            Params.FormCaption := 'Святкові дні за період ' + DateToStr(StartDate.Date) + '-' +
                DateToStr(DateEndForCalc.Date);
            Params.ShowMode := fsmSelect;
            Params.ShowButtons := [fbExit];
            Params.TableName := 'HOLIDAYS_BETWEEN_2_DATES_EX2(' + '''' + DateToStr(StartDate.Date) + '''' + ',' + ''''
                + DateToStr(DateEndForCalc.Date) + '''' + ')';
            Params.Fields := 'HDATE';
            Params.FieldsName := 'Свято';
            Params.KeyField := 'HDATE';
            Params.ReturnFields := 'HDATE';
            Params.DBHandle := Integer(WorkDatabase.Handle);

            OutPut := TRxMemoryData.Create(self);

            GetUnivSprav(Params, OutPut)
        End
        Else
            agShowMessage('Немає жодного святкового дня!');
    End;
End;

Procedure TfrmNewHolidayParams.DateEndForCalcPropertiesChange(
    Sender: TObject);
Begin
    If UpdateFlag = 1
        Then
        cxButton1Click(self);
End;

Procedure TfrmNewHolidayParams.NotFixedTypeHolidayClick(Sender: TObject);
Begin
    If NotFixedTypeHoliday.Checked Then
    Begin
        HolidayType.Value := id_annual_holiday;
        HolidayType.DisplayText := id_annual_holiday_val;
        HolidayType.Enabled := False;
    End;

End;

Procedure TfrmNewHolidayParams.FixedTypeHolidayClick(Sender: TObject);
Begin
    HolidayType.Enabled := True;
End;

Procedure TfrmNewHolidayParams.FormClose(Sender: TObject;
    Var Action: TCloseAction);
Begin
    AutoSaveIntoRegistry(self, Nil);
End;

Procedure TfrmNewHolidayParams.DateEndForCalcExit(Sender: TObject);
Begin
    If UpdateFlag = 1
        Then
        cxButton1Click(self);
End;

Procedure TfrmNewHolidayParams.PeriodArrayButtonClick(Sender: TObject);
Begin
    If (PeriodArrayButton.Caption = '<<')
        Then
    Begin
        If Not PeriodsDataSet.Active
            Then
            PeriodsDataSet.Active := True;
        PeriodArrayButton.Caption := '>>';
        PeriodsPanel.Visible := True;
        AddPeriodButton.Visible := True;
        Self.Height := Self.Height + PeriodsPanel.Height;
        Panel3.Visible := False;
        Self.Height := Self.Height - Panel3.Height;
        Panel2.Top := Self.Height - Panel2.Height;
    End
    Else
    Begin
        PeriodArrayButton.Caption := '<<';
        PeriodsPanel.Visible := false;
        AddPeriodButton.Visible := false;
        Self.Height := Self.Height - PeriodsPanel.Height;
        Panel3.Visible := true;
        Self.Height := Self.Height + Panel3.Height;
        Panel2.Top := Self.Height - Panel2.Height;
    End;
End;

Procedure TfrmNewHolidayParams.AddPeriodButtonClick(Sender: TObject);
Begin
    If PeriodsDataSet.Active
        Then
    Begin
        cxButton1Click(Self);

        If Not CheckCrossPeriods(PeriodsDataSet, StartDate.Date, DateEndForCalc.Date)
            Then
        Begin
            PeriodsDataSet.Insert;
            PeriodsDataSet.FieldByName('date_beg').Value := StartDate.Date;
            PeriodsDataSet.FieldByName('date_end').Value := DateEndForCalc.Date;
            PeriodsDataSet.FieldByName('order_count').Value := DayCount.EditValue;
            PeriodsDataSet.FieldByName('hol_count').Value := HolidayDayCount.Value;
            PeriodsDataSet.FieldByName('sum_count').Value := TotalDayCount.Value;
            PeriodsDataSet.Post;
        End;
    End;
End;

Procedure TfrmNewHolidayParams.cxButton3Click(Sender: TObject);
Begin
    If PeriodsDataSet.Active
        Then
        If PeriodsDataSet.RecordCount > 0
            Then
            PeriodsDataSet.Delete;
End;

Function TfrmNewHolidayParams.CheckCrossPeriods(Ds: TDataSet; date_beg,
    date_end: TDateTime): Boolean;
Var
    Res: Boolean;

Begin
    Res := false;
    Res := DS.Locate('date_beg;date_end', VarArrayOf([Date_beg, date_end]), []);

    If Not Res
        Then
    Begin
        Ds.First;
        While Not ds.Eof Do
        Begin
            If (Ds['date_beg'] <= date_end)
                And (Ds['date_end'] >= date_beg)
                Then
            Begin
                Res := True;
                Break;
            End;

            ds.Next;
        End;
    End;

    Result := Res;
End;

Procedure TfrmNewHolidayParams.cxButton4Click(Sender: TObject);
Var
    Calc_date_end: TpFibStoredProc;
Begin
    //Получаем количество праздничных дней между двумя датами
    Calc_date_end := TpFibStoredProc.Create(self);
    Calc_date_end.Database := WorkDatabase;
    Calc_date_end.Transaction := ReadTransaction;
    Calc_date_end.StoredProcName := 'HL_GET_HOLIDAY_TERMS_INFO';
    Calc_date_end.Prepare;
    Calc_date_end.ParamByName('ID_TYPE_HOLIDAY_IN').Value := HolidayType.Value;
    If Not VarIsNull(DayCount.EditValue) Then
        Calc_date_end.ParamByName('CNT').Value := DayCount.EditValue
    Else
        Calc_date_end.ParamByName('CNT').Value := 0;
    Calc_date_end.ParamByName('HOLIDAY_BEG').Value := StartDate.Date;
    Calc_date_end.ExecProc;
    DateEndForCalc.Date := Calc_date_end.ParamByName('REAL_HOLIDAY_END').Value;
    Calc_date_end.Close;
    Calc_date_end.Free;
End;

Procedure TfrmNewHolidayParams.DayCountExit(Sender: TObject);
Begin
    cxButton4Click(self);
End;

Procedure TfrmNewHolidayParams.HolidayTypeChange(Sender: TObject);
Begin
    If VarIsNull(HolidayType.Value) Then
        IdGroupHoliday := Null;
End;

Procedure TfrmNewHolidayParams.HolidayPeriodChange(Sender: TObject);
Begin
    If VarIsNull(HolidayPeriod.Value) Then
        IdGroupHolidayPeriod := null;
End;

End.

