Unit Up_Acception;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, ExtCtrls, uFControl, uLabeledFControl, uSpravControl,
    uDateControl, uBoolControl, uEnumControl, uCharControl, uIntControl,
    cxControls, cxGroupBox, StdCtrls, Buttons, cxStyles, cxCustomData,
    cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
    cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
    cxGridTableView, cxGridDBTableView, cxGrid, ImgList, ActnList, dxBar,
    dxBarExtItems, UP_DMAcception, uCommonSp, IBase, uFormControl,
    FIBDataSet, pFIBDataSet, uInvisControl, uSelectForm, uActionControl,
    uLogicCheck, cxGridBandedTableView, cxGridDBBandedTableView,
    FIBDatabase, pFibDatabase, uSimpleCheck, Clipbrd, uAbsent, Accmgmt,
    cxContainer, cxLabel, SpComboBox, cxTextEdit, cxMaskEdit, cxSpinEdit,
    Grids, TuCommonLoader, TuCommontypes, BaseTypes, cxButtonEdit, uWMFillGrid,
    cxLookAndFeelPainters, cxCurrencyEdit, cxButtons, FIBQuery, pFIBQuery,
    pFIBStoredProc;

Type
    TUPAcceptOrder = Class(TSprav)
    private
        Function DoShow(AsFrame: Boolean): TFrame;
    public
        Constructor Create;
        Procedure Show; override;
        Function GetFrame: TFrame; override;
    End;

Function CreateSprav: TSprav; stdcall;
Exports CreateSprav;

Type
    TUP_AcceptForm = Class(TForm)
        PageControl1: TPageControl;
        Panel1: TPanel;
        TS_Main: TTabSheet;
        TS_Additional: TTabSheet;
        TS_FinSources: TTabSheet;
        qFSC_FIO: TqFSpravControl;
        DateBeg: TqFDateControl;
        DateEnd: TqFDateControl;
        UnLimit: TqFBoolControl;
        qFSC_Department: TqFSpravControl;
        qFSC_Post: TqFSpravControl;
        qFSC_WReason: TqFSpravControl;
        qFSC_WCond: TqFSpravControl;
        qFSC_PayForm: TqFSpravControl;
        qFCC_Note: TqFCharControl;
        qFIC_TestT: TqFIntControl;
        qFIC_StajT: TqFIntControl;
        qFSC_Acception: TqFSpravControl;
        qFDC_AccBeg: TqFDateControl;
        qFDC_AccEnd: TqFDateControl;
        cxGroupBox1: TcxGroupBox;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        cxG_OrdAccLevel1: TcxGridLevel;
        cxG_OrdAcc: TcxGrid;
        AL_OrdAcc: TActionList;
        IL_OrdAcc: TImageList;
        A_Add: TAction;
        A_Modif: TAction;
        A_Del: TAction;
        qFSC_PostFact: TqFSpravControl;
        DS_Smets: TDataSource;
        KeySession: TqFInvisControl;
        qFIC_NumItem: TqFInvisControl;
        qFIC_NumSubItem: TqFInvisControl;
        qFIC_IdOrder: TqFInvisControl;
        qFIC_IdType: TqFInvisControl;
        ActionControl: TqFActionControl;
        qFSC_TypePost: TqFSpravControl;
        FormControl: TqFFormControl;
        DateEndCheck: TqFLogicCheck;
        Reason: TqFCharControl;
        FinView: TcxGridDBTableView;
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
        qizzStyle: TcxGridTableViewStyleSheet;
        FinViewSMETA_NAME: TcxGridDBColumn;
        FinViewRATE_COUNT: TcxGridDBColumn;
        FinViewOKLAD_BASE: TcxGridDBColumn;
        FinViewKOEFF_PPS: TcxGridDBColumn;
        FinViewSMETA_PPS_NAME: TcxGridDBColumn;
        FinViewOKLAD_PPS: TcxGridDBColumn;
        FinViewDATES_STR: TcxGridDBColumn;
        RefreshAction: TAction;
        AcceptAction: TAction;
        qFEC_IsTarif: TqFEnumControl;
        qFBC_Bonuses: TqFBoolControl;
        qFBC_IsPostMain: TqFBoolControl;
        BonusPage: TTabSheet;
        cxGrid1: TcxGrid;
        BonusView: TcxGridDBTableView;
        cxGridLevel1: TcxGridLevel;
        Panel2: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        SpeedButton1: TSpeedButton;
        AddBonus: TAction;
        ModifyBonus: TAction;
        DeleteBonus: TAction;
        BonusViewDATE_BEG: TcxGridDBColumn;
        BonusViewDATE_END: TcxGridDBColumn;
        BonusViewPERCENT: TcxGridDBColumn;
        BonusViewSUMMA: TcxGridDBColumn;
        BonusViewID_ORDER_ITEM: TcxGridDBColumn;
        BonusViewRAISE_NAME: TcxGridDBColumn;
        BonusViewBONUS_SUMMA: TcxGridDBColumn;
        BonusViewBONUS_SUMMA_PPS: TcxGridDBColumn;
        BonusViewSMETA_TITLE: TcxGridDBColumn;
        BonusViewSMETA_PPS_TITLE: TcxGridDBColumn;
        BonusViewDATES_STR: TcxGridDBColumn;
        AuxAction: TAction;
        Panel3: TPanel;
        SpeedButton2: TSpeedButton;
        SpeedButton3: TSpeedButton;
        SpeedButton4: TSpeedButton;
        SpeedButton5: TSpeedButton;
        SpeedButton6: TSpeedButton;
        qFSimpleCheck1: TqFSimpleCheck;
        Absent: TqFSpravControl;
        Id_Type_Away: TqFInvisControl;
        Id_Key: TqFInvisControl;
        Absent_Date_Beg: TqFInvisControl;
        Absent_Date_End: TqFInvisControl;
        AcceptAbsentCheck: TqFLogicCheck;
        TsWorkMode: TTabSheet;
        ShiftEdit: TcxSpinEdit;
        WorkModeGrid: TcxGrid;
        lblWorkMode: TLabel;
        lblShift: TLabel;
        lblWorkModeAccept: TLabel;
        WorkModeGridLevel: TcxGridLevel;
        WorkModeGridTableView1: TcxGridTableView;
        WorkModeGridTableView1Column1: TcxGridColumn;
        WorkModeGridTableView1Column2: TcxGridColumn;
        WorkModeGridTableView1Column3: TcxGridColumn;
        WorkModeGridTableView1Column4: TcxGridColumn;
        WorkModeGridTableView1Column5: TcxGridColumn;
        WorkModeGridTableView1Column6: TcxGridColumn;
        WorkModeGridTableView1Column7: TcxGridColumn;
        WorkModeGridTableView1Column8: TcxGridColumn;
        WorkModeSprav: TcxButtonEdit;
        ShiftControl: TqFInvisControl;
        IdWorkModeControl: TqFInvisControl;
        IdShrEdit: TcxTextEdit;
        lblIdShr: TcxLabel;
        lblRateCnt: TcxLabel;
        btnSearchShr: TcxButton;
        RateCntEdit: TcxCurrencyEdit;
        btnShowShrGrid: TcxButton;
        pnlIdShrGrid: TPanel;
        pnlbtn: TPanel;
        btnAddIdShr: TcxButton;
        btnDelIdShr: TcxButton;
        ShrGridDBView: TcxGridDBTableView;
        ShrGridLevel: TcxGridLevel;
        ShrGrid: TcxGrid;
        ShrGridDBViewDBColumn1: TcxGridDBColumn;
        ShrGridDBViewDBColumn2: TcxGridDBColumn;
        ShrDataSource: TDataSource;
        DelBonus: TAction;
    lblMonthCnt: TcxLabel;
    month_hours_count: TqFInvisControl;
    lblHoursCnt: TcxLabel;
    HoursCntEdit: TcxCurrencyEdit;
    Month_Count: TcxMaskEdit;
    Count_month_check: TqFLogicCheck;
    FinViewHoursCount: TcxGridDBColumn;
    ShrGridDBViewDBColumn3: TcxGridDBColumn;
        Constructor Create(aOwner: TComponent; DM: TUPAcceptDM;
            Id_Order_Item: Variant; AsFrame: Boolean; Mode: integer;
            Num_Item, Num_Sub_Item, Id_Order, Id_Order_Type: Variant;
            Outer_HWND: Variant); reintroduce;
        Procedure qFSC_FIOOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure qFSC_DepartmentOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure qFSC_PostOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure qFSC_WReasonOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure qFSC_TypePostOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure qFSC_AcceptionOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure qFSC_PayFormOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure qFSC_PostFactOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure UnLimitChange(Sender: TObject);
        Procedure qFSC_WCondOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure ActionControlBeforePrepare(Sender: TObject; Form: TForm);
        Procedure CancelButtonClick(Sender: TObject);
        Procedure DateEndCheckCheck(Sender: TObject; Var Error: String);
        Procedure ActionControlCanEdit(Sender: TObject; Mode: TFormMode;
            Var CanPrepare: Boolean);
        Procedure ActionControlAfterRefresh(Sender: TObject; Value: Variant);
        Procedure FormControlDatabaseEventAfter(Sender: TObject; Form: TForm;
            Mode: TFormMode; Transaction: TFIBTransaction);
        Procedure AcceptActionExecute(Sender: TObject);
        Procedure DateBegChange(Sender: TObject);
        Procedure DateEndChange(Sender: TObject);
        Procedure qFSC_PostFactChange(Sender: TObject);
        Procedure qFSC_HospFIOOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure AuxActionExecute(Sender: TObject);
        Procedure TS_MainMouseDown(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
        Procedure qFSC_WReasonChange(Sender: TObject);
        Procedure qFSC_HolFIOOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure FormControlDatabaseEventBefore(Sender: TObject; Form: TForm;
            Mode: TFormMode; Transaction: TFIBTransaction);
        Procedure FinViewKeyUp(Sender: TObject; Var Key: Word;
            Shift: TShiftState);
        Procedure BonusViewKeyUp(Sender: TObject; Var Key: Word;
            Shift: TShiftState);
        Procedure FormKeyUp(Sender: TObject; Var Key: Word;
            Shift: TShiftState);
        Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
        Procedure AbsentOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure AbsentChange(Sender: TObject);
        Procedure AcceptAbsentCheckCheck(Sender: TObject; Var Error: String);
        Procedure A_DelExecute(Sender: TObject);
        Procedure FormShow(Sender: TObject);
        Procedure ShiftEditPropertiesChange(Sender: TObject);
        Procedure WorkModeSpravPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        Procedure qFSC_FIOKeyDown(Sender: TObject; Var Key: Word;
            Shift: TShiftState);
        Procedure qFSC_WCondChange(Sender: TObject);
        Procedure qFSC_PayFormChange(Sender: TObject);
        Procedure IdShrEditKeyPress(Sender: TObject; Var Key: Char);
        Procedure btnShowShrGridClick(Sender: TObject);
        Procedure btnSearchShrClick(Sender: TObject);
        Procedure btnDelIdShrClick(Sender: TObject);
        Procedure qFSC_PostChange(Sender: TObject);
        Procedure btnAddIdShrClick(Sender: TObject);
        Procedure ShrGridDBViewKeyDown(Sender: TObject; Var Key: Word;
            Shift: TShiftState);
        Procedure DelBonusExecute(Sender: TObject);
        Procedure AddBonusExecute(Sender: TObject);
        Procedure ModifyBonusExecute(Sender: TObject);
        Procedure qFSC_TypePostChange(Sender: TObject);
    procedure Month_CountPropertiesChange(Sender: TObject);
    procedure RateCntEditPropertiesChange(Sender: TObject);
    procedure HoursCntEditPropertiesChange(Sender: TObject);
    procedure Count_month_checkCheck(Sender: TObject; var Error: String);
    procedure RateCntEditPropertiesEditValueChanged(Sender: TObject);
    procedure HoursCntEditPropertiesEditValueChanged(Sender: TObject);
    procedure Month_CountPropertiesEditValueChanged(Sender: TObject);
    private
        Id_Order_Item: Variant;
        Outer_HWND: Variant;
        show_hours: Boolean;

        InForm: Boolean;

        //Default_Date_Beg: TDate;
        Inf_Date_End: TDate;
        MaxBound: Integer; //Максимальное значение сдвижки
        DefaultMonthCount: Integer; //Количество месяцев по умолчанию для педработников
        MaxMonthCount: Integer; //Максимально возможное кол-во месяцев для педработников
        IdWorkMode: Variant;
        IsEditWorkMode: Integer;
        //IdShr:Integer;
        isReformSmets: Boolean;
        DefaultReason: String; //заданная по умолчанию приставка к основанию
        Procedure AddOrderItemPrepare; //Подготовка перед добавлением
        Procedure ModifyOrderItemPrepare; //Подготовка перед изменением
        Procedure ViewOrderItemPrepare; //Подготовка перед просмотром

        Procedure Expand(View: TcxGridDBTableView);

        Procedure ReformSmets;

        Procedure RefreshBonuses;

        Procedure ResizeHospBlock;

        Procedure GenKeySession;
        Function CheckVacByIdUs: Boolean;
        Procedure DataSetShrCloseOpen;
        Procedure EnableBtn(Flag: Boolean);
        Procedure AddBuffInfoByIdShr;
        Procedure RefreshSmetsBonus;
        Procedure ClearGridWorkMode;
        Function GetDSetIdShr: Variant;
        Procedure BlockedSprav;
        Function ShowHoursByTypePost(Id_Type_Post: Integer): Boolean;
    public
        DMod: TUPAcceptDM;
    End;

Const
    DebugMode = False;

Implementation

Uses RxMemDS, UP_AccAddSmeta, UpKernelUnit, qFTools, AppStruClasses, uBonusEdit, DateUtils,
    uUnivSprav;

{$R *.dfm}

Function CreateSprav: TSprav;
Begin
    Result := TUPAcceptOrder.Create;
End;

Constructor TUPAcceptOrder.Create;
Begin
    Inherited Create;
    // создание входных/выходных полей
   //  Input.FieldDefs.Add('DBHandle', ftInteger);
    Input.FieldDefs.Add('mode', ftInteger);
    Input.FieldDefs.Add('Id_order', ftVariant);
    Input.FieldDefs.Add('Id_Item', ftVariant);
    Input.FieldDefs.Add('Id_order_type', ftVariant);
    Input.FieldDefs.Add('num_item', ftVariant);
    Input.FieldDefs.Add('num_sub_item', ftVariant);
    Input.FieldDefs.Add('outer_hwnd', ftInteger);

    OutPut.FieldDefs.Add('Id_item', ftLargeint);

    // подготовить параметры
    PrepareMemoryDatasets;
End;


Procedure TUPAcceptOrder.Show;
Begin
    DoShow(False);
End;

Procedure TUP_AcceptForm.ClearGridWorkMode;
Begin
    WorkModeGridTableView1.DataController.BeginUpdate;
    WorkModeGridTableView1.DataController.DeleteRecord(1);
    WorkModeGridTableView1.DataController.DeleteRecord(0);
    WorkModeGridTableView1.DataController.EndUpdate;
End;

Function TUP_AcceptForm.GetDSetIdShr: Variant;
Begin
    With DMod Do
    Begin
        DsetIdShr.FetchAll;
        DsetIdShr.First;
        If Not DsetIdShr.IsEmpty Then
            Result := DsetIdShr['ID_SH_R']
        Else
            Result := null;
    End;
End;

Procedure TUP_AcceptForm.DataSetShrCloseOpen;
Begin
    With DMod.DsetIdShr Do
    Begin
        Close;
        SQLs.SelectSQL.Text := 'select distinct * from Up_Accept_Sh_R_Tmp where key_session=:key_session';
        ParamByName('key_session').AsInt64 := KeySession.Value;
        Open;
    End;
End;

Procedure TUP_AcceptForm.BlockedSprav;
Begin
    If Not DMod.DsetIdShr.IsEmpty Then
    Begin
        qFSC_Department.Blocked := True;
        qFSC_Post.Blocked := True;
        qFSC_TypePost.Blocked := True;
    End
    Else
    Begin
        qFSC_Department.Blocked := False;
        qFSC_Post.Blocked := False;
        qFSC_TypePost.Blocked := False;
    End;
End;

Procedure TUP_AcceptForm.RefreshSmetsBonus;
Begin
    With DMod Do
    Begin
        Smets.Close;
        Smets.ParamByName('key_session').AsInt64 := KeySession.Value;
        Smets.Open;
        FinView.ViewData.Expand(True);

        AcceptBonusSelect.Close;
        AcceptBonusSelect.ParamByName('key_session').AsInt64 := KeySession.Value;
        AcceptBonusSelect.Open;
        BonusView.ViewData.Expand(True);
    End;
End;

Procedure TUP_AcceptForm.AddBuffInfoByIdShr;
Var
    Er: String;
    Res: Variant;
Begin
    If VarIsNull(qFSC_FIO.Value) Then
    Begin
        qFSC_FIO.Highlight(True);
        qFSC_FIO.SetFocus;
        agMessageDlg('Увага!', 'Спочатку треба обрати людину', mtInformation, [mbOK]);
        Exit;
    End;
    If (IdShrEdit.Text = '') Then
        agMessageDlg('Увага!', 'Не можна додавати позицію, якщо не заповнено поле "Ідентифікатор ШР"!',
            mtInformation, [mbOk]);

    If (RateCntEdit.Value = Null) Then
        if (HoursCntEdit.Value = Null) then
            agMessageDlg('Увага!', 'Не можна додавати позицію, якщо не заповнено поле "Кількість ставок" або "Кількість годин"!',
            mtInformation, [mbOk]);

    If ((IdShrEdit.Text = '') Or (RateCntEdit.Value = Null)) Then
        exit;

    DataSetShrCloseOpen;
    Try
        EnableBtn(False);
        With DMod Do
        Begin
            If DsetIdShr.RecordCount = 0 Then
            Begin
                ShrProc.StoredProcName := 'UP_GET_INFO_BY_ID_SHR';
                ShrProc.Transaction.StartTransaction;
                ShrProc.Prepare;
                try
                ShrProc.ParamByName('ID_SHR').AsInteger := StrToInt(IdShrEdit.Text);
                ShrProc.ParamByName('KEY_SESSION').AsInt64 := KeySession.Value;
                ShrProc.ParamByName('RATE_COUNT').Value := RateCntEdit.EditValue;
                ShrProc.ParamByName('ID_PCARD').AsInt64 := qFSC_FIO.Value;
                ShrProc.ParamByName('PERIOD_BEG').AsDate := DateBeg.Value;
                ShrProc.ParamByName('PERIOD_END').AsDate := DateEnd.Value;
                ShrProc.ParamByName('ID_ORDER_ITEM').AsInteger := -1;
                ShrProc.ParamByName('ADD_BONUSES').AsInteger := Integer(Boolean(qFBC_Bonuses.Value));
                ShrProc.ParamByName('HOURS_COUNT').Value := HoursCntEdit.EditValue;
                ShrProc.ParamByName('MONTH_HOURS_COUNT').AsInteger := Month_Count.EditValue;
                ShrProc.ExecProc;
                except on E: Exception do
                    showmessage(E.Message);
                end;
                Er := ShrProc.FieldByName('ERROR_MESSAGE').AsString;
                If Er = 'No' Then
                Begin
                    isReformSmets := False;
                    qFSC_Department.Value := ShrProc.FieldByName('ID_DEPARTMENT').Value;
                    qFSC_Department.DisplayText := ShrProc.FieldByName('NAME_DEPARTMENT').Value;
                    qFSC_Post.Value := ShrProc.FieldByName('ID_POST_SALARY').Value;
                    qFSC_Post.DisplayText := ShrProc.FieldByName('NAME_POST').Value;
                    qFSC_PostFact.Value := ShrProc.FieldByName('ID_POST_SALARY').Value;
                    qFSC_PostFact.DisplayText := ShrProc.FieldByName('NAME_POST').Value;
                    qFSC_TypePost.Value := ShrProc.FieldByName('ID_TYPE_POST').Value;
                    qFSC_TypePost.DisplayText := ShrProc.FieldByName('NAME_TYPE_POST').Value;
                    qFSC_PayForm.Value := ShrProc.FieldByName('ID_PAY_FORM').Value;
                    qFSC_PayForm.DisplayText := ShrProc.FieldByName('NAME_PAY_FORM').Value;
                    qFSC_WCond.Value := ShrProc.FieldByName('ID_WORK_COND').Value;
                    qFSC_WCond.DisplayText := ShrProc.FieldByName('NAME_WORK_COND').Value;

                    show_hours := ShowHoursByTypePost(qFSC_TypePost.Value);

                    if not(show_hours) then Month_Count.EditValue := 0;
                    Month_Count.Visible := show_hours;
                    lblMonthCnt.Visible := show_hours;

                    IdWorkModeControl.Value := ShrProc.FieldByName('ID_WORK_MODE').Value;
                    WorkModeSprav.Text := ShrProc.FieldByName('NAME_WORK_MODE').Value;
                    ShiftControl.Value := 0;
                    ShiftEdit.Value := 0;
                    IdWorkMode := IdWorkModeControl.Value;
                    FillWorkModeDSet(WMByPeriodSet, DateBeg.Value, DateEnd.Value, IdWorkModeControl.Value,
                        null, null, ShiftControl.Value, 7);
                    FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
                    ShrProc.Transaction.Commit;

                    Res := GetWorkModeInfo(DMod.GetWorkMode, IdWorkModeControl.Value);
                    If VarIsArray(Res) Then
                    Begin
                        MaxBound := Res[1];
                    End;
                    try
                    DataSetShrCloseOpen;
                    RefreshSmetsBonus;
                    except on E: Exception do
                        Showmessage(E.Message);
                    end;
                    IdShrEdit.Text := '';
                    RateCntEdit.Text := '';
                    If btnShowShrGrid.Caption = '<<' Then
                    Begin
                        btnShowShrGrid.Caption := '>>';
                        pnlIdShrGrid.Height := 160;
                        pnlIdShrGrid.Visible := True;
                        ShrGridDBViewDBColumn3.Visible := show_hours;
                    End;
                End
                Else
                Begin
                    agMessageDlg('Увага!', Er, mtInformation, [mbOK]);
                    ShrProc.Transaction.Rollback;
                End;
            End
            Else
            Begin
                ShrProc.StoredProcName := 'UP_MAN_SMET_BUFF_INS_BY_IDSHR';
                ShrProc.Transaction.StartTransaction;
                ShrProc.Prepare;
                ShrProc.ParamByName('KEY_SESSION').AsInt64 := KeySession.Value;
                ShrProc.ParamByName('ID_SHR').AsInteger := StrToInt(IdShrEdit.Text);
                ShrProc.ParamByName('RATE_COUNT').AsFloat := RateCntEdit.Value;
                ShrProc.ParamByName('PERIOD_BEG').AsDate := DateBeg.Value;
                ShrProc.ParamByName('PERIOD_END').AsDate := DateEnd.Value;
                ShrProc.ParamByName('ID_PCARD').AsInt64 := qFSC_FIO.Value;
                ShrProc.ParamByName('ADD_BONUSES').AsInteger := Integer(Boolean(qFBC_Bonuses.Value));
                ShrProc.ParamByName('ID_ORDER_ITEM').AsInteger := -1;
                ShrProc.ParamByName('ID_SHR_PROV').Value := GetDSetIdShr;
                ShrProc.ParamByName('HOURS_COUNT').AsFloat := HoursCntEdit.Value;
                ShrProc.ExecProc;
                Er := ShrProc.FieldByName('ERROR_MESSAGE').AsString;
                If Er = 'No' Then
                Begin
                    isReformSmets := False;
                    ShrProc.Transaction.Commit;

                    DataSetShrCloseOpen;
                    RefreshSmetsBonus;

                    IdShrEdit.Text := '';
                    RateCntEdit.Text := '';
                    If btnShowShrGrid.Caption = '<<' Then
                    Begin
                        btnShowShrGrid.Caption := '>>';
                        pnlIdShrGrid.Height := 160;
                        pnlIdShrGrid.Visible := True;
                    End;
                End
                Else
                Begin
                    agMessageDlg('Увага!', Er, mtInformation, [mbOK]);
                    ShrProc.Transaction.Rollback;
                End;
            End;
        End;
    Except On e: Exception
        Do
            ShowMessage(e.Message);
    End;
    EnableBtn(True);
    isReformSmets := True;
    BlockedSprav;
End;

Procedure TUP_AcceptForm.EnableBtn(Flag: Boolean);
Begin
    btnAddIdShr.Enabled := Flag;
    btnSearchShr.Enabled := Flag;
    btnDelIdShr.Enabled := Flag;
    qFSC_Department.Blocked := Not Flag;
    qFSC_Post.Blocked := Not Flag;
    qFSC_PostFact.Blocked := Not Flag;
    qFSC_TypePost.Blocked := Not Flag;
End;

Function TUPAcceptOrder.DoShow(AsFrame: Boolean): TFrame;
Var
    DM: TUPAcceptDM;
    hnd, mode: Integer;
    AcceptForm: TUP_AcceptForm;
Begin
    DM := TUPAcceptDM.Create(Application.MainForm);
    hnd := Input['DBHandle'];
    DM.DB.Handle := TISC_DB_Handle(hnd);

    If (VarIsNull(Input['Mode'])) Then
        mode := 0
    Else
        mode := Input['Mode'];

    AcceptForm := TUP_AcceptForm.Create(Application.MainForm, DM, Input['Id_Item'],
        AsFrame, mode, Input['Num_Item'], Input['Num_Sub_Item'], Input['Id_Order'],
        Input['Id_Order_Type'], Input['Outer_HWND']);

    If AsFrame Then
        Result := TFrame(AcceptForm)
    Else
        With AcceptForm Do
        Begin
            If ShowModal = mrOk Then
            Begin
                //Забираем идентификатор выбранного приказа
            End;
            Free;
            Result := Nil;
        End;
End;

Function TUPAcceptOrder.GetFrame: TFrame;
Begin
    Result := DoShow(True);
End;

Constructor TUP_AcceptForm.Create(aOwner: TComponent; DM: TUPAcceptDM;
    Id_Order_Item: Variant; AsFrame: Boolean; Mode: integer;
    Num_Item, Num_Sub_Item, Id_Order, Id_Order_Type: Variant;
    Outer_HWND: Variant);
Var
    SysInfo: TpFibDataSet;
    i: Integer;
Begin
try
    Inherited Create(aOwner);
    If Mode = 0 Then
        IdWorkMode := null;
    IsEditWorkMode := 0;
    For i := 0 To WorkModeGridTableView1.ColumnCount - 1 Do
        WorkModeGridTableView1.Columns[i].DataBinding.ValueTypeClass := TcxStringValueType;

    DMod := DM;
    PageControl1.ActivePage := TS_Main;

    SysInfo := TpFibDataSet.Create(self);
    SysInfo.Database := DMod.DB;
    SysInfo.Transaction := DMod.ReadTransaction;
    SysInfo.SelectSQL.Text := 'SELECT * FROM UP_SYS_INI_CONSTS';
    SysInfo.Open;
    SysInfo.FetchAll;
    If (SysInfo.RecordCount > 0)
        Then
    Begin
        DefaultMonthCount := SysInfo.FieldByName('MONTHS_COUNT_DEFAULT').AsInteger;
        MaxMonthCount := SysInfo.FieldByName('MAX_MONTHS_COUNT').AsInteger;
        If (SysInfo.FieldByName('DISABLE_CHOISE').Value <> null)
            Then
        Begin
            If (SysInfo.FieldByName('DISABLE_CHOISE').Value = 1)
                Then
            Begin
                qFSC_FIO.AutoSaveToRegistry := False;
                DateBeg.AutoSaveToRegistry := False;
                DateEnd.AutoSaveToRegistry := False;
                UnLimit.AutoSaveToRegistry := False;
                qFSC_Department.AutoSaveToRegistry := False;
                qFSC_WReason.AutoSaveToRegistry := False;
                qFBC_IsPostMain.AutoSaveToRegistry := False;
                Reason.AutoSaveToRegistry := False;
                //qFSC_FIO.Clear;
                //DateBeg.Clear;
                //DateEnd.Clear;
                //UnLimit.Clear;
                //qFSC_Department.Clear;
                //qFSC_WReason.Clear;
                //qFBC_IsPostMain.Clear;
                //Reason.Clear;
            End;
        End;
    End;
    SysInfo.Close;

    SysInfo.SQLs.SelectSQL.Text := 'SELECT DEFAULT_REASON FROM UP_DT_ORDER_TYPE WHERE ID_TYPE = '+VarToStr(Id_Order_Type);
    SysInfo.Open;
    If ((SysInfo.FieldByName('DEFAULT_REASON').Value <> null) and
        (Trim(SysInfo.FieldByName('DEFAULT_REASON').AsString)<>''))
    Then DefaultReason := SysInfo.FieldByName('DEFAULT_REASON').AsString
    Else DefaultReason := '';
    SysInfo.Close;
    SysInfo.Free;
    isReformSmets := True;
    show_hours := false;
    DateBeg.Value := Date();

    Month_Count.EditValue := 0;

    DS_Smets.DataSet := DMod.Smets;
    BonusView.DataController.DataSource := DMod.AcceptBonusSource;

    Self.Id_Order_Item := Id_Order_Item;

    Self.Outer_HWND := Outer_HWND;

    InForm := True;

    DM.UPConsts.Close;
    DM.UPConsts.Open;
    Inf_Date_End := DM.UpConsts['INFINITY_DATE'];

    Case Mode Of
        0: AddOrderItemPrepare;
        1: ModifyOrderItemPrepare;
        2: ViewOrderItemPrepare;
        3: ;
    End;

    ActionControl.Database := DMod.DB;
    ActionControl.SelectDataSet := DMod.Smets;


    qFIC_NumItem.Value := Num_Item;
    qFIC_NumSubItem.Value := Num_Sub_Item;
    qFIC_IdOrder.Value := Id_Order;
    qFIC_IdType.Value := Id_Order_Type;


    If AsFrame Then
    Begin
        self.BorderStyle := bsNone;
        //self.Align := alClient;  by Kirilishen Y.
        self.BorderIcons := [];
        self.Visible := true;
    End;
    ShrDataSource.DataSet := DMod.DsetIdShr;
    //if not DMod.ShrTrans.Active then DMod.ShrTrans.Active:=True;

    except on E: Exception do
        showmessage(E.Message);
    end;

    SendMessage(outer_hwnd, FMAS_MESS_GET_BUTTON_OK, OkButton.Handle, OkButton.Handle);
    SendMessage(outer_hwnd, FMAS_MESS_GET_BUTTON_CANCEL, CancelButton.Handle, CancelButton.Handle);
End;


Procedure TUP_AcceptForm.AddOrderItemPrepare;
Begin
    With DMod Do
    Begin
        FormControl.Prepare(DB, fmAdd, null, null);

        If UnLimit.Value Then
        Begin
            DateEnd.Visible := False;
            DateEnd.Value := Inf_Date_End;
        End;

        ReadTransaction.StartTransaction;
        GenKeySession;

        Smets.Close;
        Smets.ParamByName('key_session').AsInt64 := KeySession.Value;
        Smets.Open;

        AcceptBonusSelect.Close;
        AcceptBonusSelect.ParamByName('key_session').AsInt64 := KeySession.Value;
        AcceptBonusSelect.Open;

        ReadTransaction.Commit;
    End;
End;

Procedure TUP_AcceptForm.ModifyOrderItemPrepare;
Var
    Res: Variant;
Begin
    With DMod Do
    Begin
    
        CopyIntoBuffer.Close;
        CopyIntoBuffer.ParamByName('Id_Order_Item').AsInt64 := Id_Order_Item;
        CopyIntoBuffer.Transaction.StartTransaction;
        CopyIntoBuffer.Open;

        KeySession.Value := CopyIntoBuffer['Key_Session'];
        //BonusControl.AddKeys := KeySession.Value;
        CopyIntoBuffer.Transaction.Commit;

        ShrProc.StoredProcName := 'UP_DT_ID_SH_R_BUFF_MOV_SEL';
        ShrProc.Transaction.StartTransaction;
        ShrProc.Prepare;
        ShrProc.ParamByName('KEY_SESSION').AsInt64 := KeySession.Value;
        ShrProc.ParamByName('IS_NEW').AsInteger := 1;
        ShrProc.ParamByName('ID_MAN_MOVING').Value := null;
        ShrProc.ParamByName('ID_ORDER_ITEM').AsInt64 := Self.Id_Order_Item;
        ShrProc.ExecProc;
        ShrProc.Transaction.Commit;
        ShrProc.Close;


        DataSetShrCloseOpen;


        FormControl.Prepare(DB, fmModify, KeySession.Value, null);

        If YearOf(DateEnd.Value) >= 2050 Then
        Begin
            UnLimit.Value := True;
            DateEnd.Visible := False;
        End
        Else
            UnLimit.Value := False;

        if not (VarIsNull(qFSC_TypePost.Value)) then
            show_hours := ShowHoursByTypePost(qFSC_TypePost.Value)
        else show_hours := false;

        Month_Count.Visible := show_hours;
        lblMonthCnt.Visible := show_hours;

        if show_hours then
        begin
            if Month_Count.EditValue = 0 then
                Month_Count.EditValue := month_hours_count.Value;
        end
        else Month_Count.EditValue := 0;


        Smets.Close;
        Smets.ParamByName('Key_Session').AsInt64 := KeySession.Value;
        Smets.Open;


        If Not VarIsNull(IdWorkModeControl.Value) Then
            IdWorkMode := IdWorkModeControl.Value
        Else
            IdWorkMode := null;

        Res := GetWorkModeInfo(GetWorkMode, IdWorkMode);
        If VarIsArray(Res) Then
        Begin
            WorkModeSprav.Text := Res[0];
            MaxBound := Res[1];
        End;

        ShiftEdit.Value := ShiftControl.Value;


        FillWorkModeDSet(WMByPeriodSet, DateBeg.Value, DateEnd.Value, IdWorkMode, null, null,
            ShiftEdit.Value, 7);
        FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);

        Expand(FinView);

        RefreshBonuses;

        Expand(BonusView);

        ResizeHospBlock;
    End;
End;

Procedure TUP_AcceptForm.ViewOrderItemPrepare;
Var
    Res: Variant;
Begin
    WorkModeSprav.Enabled := False;
    ShiftEdit.Enabled := False;
    btnSearchShr.Visible := False;
    btnShowShrGrid.Visible := False;
    IdShrEdit.Enabled := False;
    RateCntEdit.Enabled := False;
    HoursCntEdit.Enabled := False;
    Month_Count.Enabled := false;

    With DMod Do
    Begin
        CopyIntoBuffer.Close;
        CopyIntoBuffer.ParamByName('Id_Order_Item').AsInt64 := Id_Order_Item;
        CopyIntoBuffer.Transaction.StartTransaction;
        CopyIntoBuffer.Open;
        KeySession.Value := CopyIntoBuffer['Key_Session'];
        //BonusControl.AddKeys := KeySession.Value;
        CopyIntoBuffer.Transaction.Commit;

        if not (VarIsNull(qFSC_TypePost.Value)) then
            show_hours := ShowHoursByTypePost(qFSC_TypePost.Value.AsInteger)
        else show_hours := false;

        Month_Count.Visible := show_hours;
        lblMonthCnt.Visible := show_hours;

        if show_hours then Month_Count.EditValue := month_hours_count.Value
        else Month_Count.EditValue := 0;

        FormControl.Prepare(DB, fmInfo, KeySession.Value, null);

        Smets.Close;
        Smets.ParamByName('Key_Session').AsInt64 := KeySession.Value;
        Smets.Open;
        Expand(FinView);

        If Not VarIsNull(IdWorkModeControl.Value) Then
            IdWorkMode := IdWorkModeControl.Value
        Else
            IdWorkMode := null;

        Res := GetWorkModeInfo(GetWorkMode, IdWorkMode);
        If VarIsArray(Res) Then
        Begin
            WorkModeSprav.Text := Res[0];
            MaxBound := Res[1];
        End;

        ShiftEdit.Value := ShiftControl.Value;

        FillWorkModeDSet(WMByPeriodSet, DateBeg.Value, DateEnd.Value, IdWorkMode, null, null,
            ShiftEdit.Value, 7);
        FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);

        RefreshBonuses;

        Expand(BonusView);

        ResizeHospBlock;

        A_Add.Enabled := False;
        A_Modif.Enabled := False;
        A_Del.Enabled := False;
        AddBonus.Enabled := False;
        ModifyBonus.Enabled := False;
        DeleteBonus.Enabled := False;

        OkButton.Visible := False;
    End;
End;


Procedure TUP_AcceptForm.qFSC_FIOOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    sp: TSprav;
    Reason_s: String;
Begin
    // создать справочник
    sp := GetSprav('asup\PCardsList');
    If sp <> Nil Then
    Begin
        // заполнить входные параметры
        With sp.Input Do
        Begin
            Append;
            FieldValues['DBHandle'] := Integer(DMod.DB.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := False;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['ShowStyle'] := 0;
            FieldValues['NewVersion'] := 1;
            Post;
        End;
        // показать справочник и проанализировать результат
        sp.Show;
        If (sp.Output <> Nil) And Not sp.Output.IsEmpty Then
        Begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'] + ' (т/н ' + IntToStr(sp.Output['TN']) + ')';

            Reason_s := DefaultReason;
            if DefaultReason = ''
            then
                Reason.Value := 'заява '+ sp.Output['FIO_Small']
            else
                Reason.Value := StringReplace(Reason_s,'%FIO%',sp.Output['FIO_Small'],[rfReplaceAll]);
        End;
        sp.Free;
    End;
End;

Procedure TUP_AcceptForm.qFSC_DepartmentOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    sp: TSprav;
    OldValue: integer;
Begin
    If (Not VarIsNull(qFSC_Department.Value))
        Then
        OldValue := qFSC_Department.Value
    Else
        OldValue := -1;
    // создать справочник
    sp := GetSprav('SpDepartment');
    If sp <> Nil Then
    Begin
        // заполнить входные параметры
        With sp.Input Do
        Begin
            Append;
            FieldValues['DBHandle'] := Integer(DMod.DB.Handle);
            FieldValues['Actual_Date'] := Date();
            FieldValues['AllowEdit'] := False;
            Post;
        End;
        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        If (sp.Output <> Nil) And Not sp.Output.IsEmpty Then
        Begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];

            If (Value <> OldValue)
                Then
            Begin
                qFSC_Post.Clear;
                qFSC_PostFact.Clear;
                qFSC_TypePost.Clear;
            End;
        End;
        sp.Free;
    End;
End;

Procedure TUP_AcceptForm.qFSC_PostOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Res: Variant;
Begin
    If VarIsNull(qFSC_Department.Value) Then
    Begin
        qFErrorDialog('Спочатку треба обрати підрозділ!');
        Exit;
    End;

    dMod.PostSalarySelect.Close;
    dMod.PostSalarySelect.ParamByName('Id_Department').AsInteger := qFSC_Department.Value;
    dMod.PostSalarySelect.ParamByName('Act_Date').AsDate := DateBeg.Value;
    dMod.PostSalarySelect.Open;

    If qSelect(dMod.PostSalarySelect) Then
    Begin
    TRY
        Value := dMod.PostSalarySelect['id_post_salary'];
        DisplayText := dMod.PostSalarySelect['Post_name'];
        qFSC_Post.Value := dMod.PostSalarySelect['id_post_salary'];
        qFSC_Post.DisplayText := dMod.PostSalarySelect['Post_name'];

        qFSC_PostFact.value := Value;
        qFSC_PostFact.DisplayText := DisplayText;
        qFSC_WCond.Value := DMod.PostSalarySelect['Id_Work_Cond'];
        qFSC_PayForm.Value := DMod.PostSalarySelect['Id_Pay_Form'];
    EXCEPT ON E: EXCEPTION DO
        ShowMessage(E.Message);
    end;
        If IsEditWorkMode = 1 Then
        Begin
            Try
                IdWorkModeControl.Value := DMod.PostSalarySelect['Id_Work_Mode'];
                ShiftControl.Value := 0;
                ShiftEdit.Value := 0;
                IdWorkMode := IdWorkModeControl.Value;
                FillWorkModeDSet(DMod.WMByPeriodSet, DateBeg.Value, DateEnd.Value, IdWorkModeControl.Value,
                    null, null, ShiftControl.Value, 7);
                FillWorkModeGrid(WorkModeGridTableView1, DMod.WMByPeriodSet);
                Res := GetWorkModeInfo(DMod.GetWorkMode, IdWorkModeControl.Value);
                If VarIsArray(Res) Then
                Begin
                    WorkModeSprav.Text := Res[0];
                    MaxBound := Res[1];
                End;
            Except On e: Exception
                Do
                    showmessage(e.message);
            End;
        End;
             try
        // попробуем автоматически проставить тип персонала
        DMod.SelectTypePost.Close;
        DMod.SelectTypePost.ParamByName('Id_Post_Salary').AsInteger := qFSC_Post.Value;
        DMod.SelectTypePost.ParamByName('Id_Department').AsInteger := qFSC_Department.Value;
        DMod.SelectTypePost.ParamByName('Act_Date').AsDate := DateBeg.Value;
        DMod.SelectTypePost.Open;
            except on E: Exception do
                Showmessage(E.Message);
            end;
        DMod.SelectTypePost.FetchAll;
        If DMod.SelectTypePost.RecordCount = 1 Then
        Begin
            qFSC_TypePost.Value := DMod.SelectTypePost['Id_Type_Post'];
            qFSC_TypePost.DisplayText := DMod.SelectTypePost['Name_Type_Post'];
            show_hours := (DMod.SelectTypePost['IS_PED_WORK'] = 1);

            lblMonthCnt.Visible := show_hours;
            Month_Count.Visible := show_hours;
            if Month_Count.Visible then
            begin
                if Month_Count.EditValue = 0 then
                Month_Count.EditValue := DefaultMonthCount;
            end
            else Month_Count.EditValue := 0;
            //            qFSC_TypePost.Blocked := True;
        End
            //        else
            //            qFSC_TypePost.Blocked := False;
    End;
End;

Procedure TUP_AcceptForm.qFSC_WReasonOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Params.FormCaption := 'Довідник підстав роботи';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'ASUP_INI_WORK_REASON';
    Params.Fields := 'name_full,name_short,Id_WORK_REASON';
    Params.FieldsName := 'Назва підстави,скорочено';
    Params.KeyField := 'Id_WORK_REASON';
    Params.ReturnFields := 'name_full,Id_WORK_REASON';
    Params.DBHandle := Integer(DMod.DB.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        value := output['Id_WORK_REASON'];
        DisplayText := VarToStr(output['name_full']);
    End;
End;

Procedure TUP_AcceptForm.qFSC_TypePostOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Begin
    If VarIsNull(qFSC_Department.Value) Or VarIsNull(qFSC_Post.Value) Then
    Begin
        qFErrorDialog('Спочатку треба обрати підрозділ і посаду!');
        Exit;
    End;

    DMod.SelectTypePost.Close;
    DMod.SelectTypePost.ParamByName('Id_Post_Salary').AsInteger := qFSC_Post.Value;
    DMod.SelectTypePost.ParamByName('Id_Department').AsInteger := qFSC_Department.Value;
    DMod.SelectTypePost.ParamByName('Act_Date').AsDate := DateBeg.Value;
    DMod.SelectTypePost.Open;

    If qSelect(DMod.SelectTypePost) Then
    Begin
        value := DMod.SelectTypePost['Id_Type_Post'];
        DisplayText := DMod.SelectTypePost['Name_Type_Post'];
        show_hours := (DMod.SelectTypePost['IS_PED_WORK'] = 1);

    End
    Else
        show_hours := false;

    lblMonthCnt.Visible := show_hours;
    Month_Count.Visible := show_hours;
    if Month_Count.Visible then
    begin
        if Month_Count.EditValue = 0 then
        Month_Count.EditValue := DefaultMonthCount;
    end
    else Month_Count.EditValue := 0;
End;

Procedure TUP_AcceptForm.qFSC_AcceptionOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Params.FormCaption := 'Умови вступу на посаду';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'ASUP_ORDERS_ACCEPT_COND';
    Params.Fields := 'NAME_ACCEPT_COND_print,NAME_ACCEPT_COND,id_ACCEPT_COND';
    Params.FieldsName := 'Назва умови, скорочено';
    Params.KeyField := 'ID_ACCEPT_COND';
    Params.ReturnFields := 'NAME_ACCEPT_COND,ID_ACCEPT_COND';
    Params.DBHandle := Integer(DMod.DB.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        value := output['ID_ACCEPT_COND'];
        DisplayText := VarToStr(output['NAME_ACCEPT_COND']);
        DMod.AcceptSet.Close;
        DMod.AcceptSet.SQLs.SelectSQL.Text := 'select date_end, kol_month' +
            ' from asup_accept_calc_dates(:id_accept_cond,:date_beg)';
        DMod.AcceptSet.ParamByName('id_accept_cond').AsInteger := value;
        DMod.AcceptSet.ParamByName('date_beg').AsDate := DateBeg.Value;
        DMod.AcceptSet.Open;
        If (DMod.AcceptSet['kol_month'] <> 0) Then
        Begin
            qFDC_AccBeg.Value := DateBeg.Value;
            qFDC_AccEnd.Value := DMod.AcceptSet['date_end'];
        End
        Else
        Begin
            qFDC_AccBeg.Value := null;
            qFDC_AccEnd.Value := null;
        End;
        // ShowMessage('kol='+inttostr(KolMonth));
    End;
End;

Procedure TUP_AcceptForm.qFSC_PayFormOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Params.FormCaption := 'Довідник форм оплати праці';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'INI_PAY_FORM';
    Params.Fields := 'NAME_PAY_FORM,id_PAY_FORM';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_PAY_FORM';
    Params.ReturnFields := 'NAME_PAY_FORM,ID_PAY_FORM';
    Params.DBHandle := Integer(DMod.DB.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        value := output['id_PAY_FORM'];
        DisplayText := VarToStr(output['name_PAY_FORM']);
    End;
End;

Procedure TUP_AcceptForm.qFSC_PostFactOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    If VarIsNull(qFSC_Post.Value)
        Then
    Begin
        qFErrorDialog('Спочатку треба обрати штатну посаду!');
        Exit;
    End;

    Params.FormCaption := 'Посадові оклади';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    {Params.TableName := 'UP_ACCEPT_GET_POST_real(' + QuotedStr(DateToStr(DateBeg.Value)) + ')'; }
    Params.TableName := 'UP_ACCEPT_GET_POST_REAL_2(' + QuotedStr(qFSC_Post.Value) + ',' +
        QuotedStr(DateToStr(DateBeg.Value)) + ')';
    Params.Fields := 'Post_Name,Num_Digit,Salary_Min,Salary_Max,id_post_salary';
    Params.FieldsName := 'Назва посади, Р-д, від, до';
    Params.KeyField := 'id_post_salary';
    Params.ReturnFields := 'post_NAME,id_post_salary';
    Params.DBHandle := Integer(DMod.DB.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        value := output['id_post_salary'];
        DisplayText := VarToStr(output['post_name']);
    End;
End;

Procedure TUP_AcceptForm.ResizeHospBlock;
Begin
End;


Procedure TUP_AcceptForm.UnLimitChange(Sender: TObject);
Begin
    DateEnd.Blocked := UnLimit.Value;
    DateEnd.Asterisk := UnLimit.Value;
    DateEnd.Required := UnLimit.Value;
    DateEnd.Visible := Not UnLimit.Value;
    If UnLimit.Value Then
        DateEnd.Value := EncodeDate(9999, 12, 31); //DateEnd.Value := Inf_Date_End;
End;

Procedure TUP_AcceptForm.qFSC_WCondOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Params.FormCaption := 'Умови праці';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'INI_WORK_COND';
    Params.Fields := 'NAME_WORK_COND,id_WORK_COND';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'id_WORK_COND';
    Params.ReturnFields := 'NAME_WORK_COND,id_WORK_COND';
    Params.DBHandle := Integer(DMod.DB.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        value := output['id_WORK_COND'];
        DisplayText := VarToStr(output['NAME_WORK_COND']);
    End;
End;


Procedure TUP_AcceptForm.ActionControlBeforePrepare(Sender: TObject;
    Form: TForm);
Var
    Date_End: TDate;
    dost: Boolean;
Begin
    Try
        If VarIsNull(DateEnd.Value) Or (DateEnd.Value <= 0) Then
            Date_End := Inf_Date_End
        Else
            Date_End := DateEnd.Value;

        dost := False;
        If CheckVacByIdUs Then
            dost := True
        Else
            dost := False;

        If Form Is TUP_AccAddSmetaForm Then
            With Form As TUP_AccAddSmetaForm Do
                Prepare(DMod, Self.KeySession.Value, qFSC_PostFact.Value,
                    Self.DateBeg.Value, Date_End, qFBC_Bonuses.Value, qFSC_FIO.Value,
                    qFSC_Department.Value, qFSC_Post.Value, qFSC_TypePost.Value,
                    Absent.Value, dost, show_hours, Self.Month_Count.EditValue);
    Except On E: Exception
        Do
            Showmessage(E.MEssage);
    End;
End;


Procedure TUP_AcceptForm.CancelButtonClick(Sender: TObject);
Begin
    If Not InForm Or (FormControl.Mode = fmInfo) Or
        qFConfirm('Відмінити формування пункту наказу?')
        Then
        SendMessage(outer_hwnd, FMAS_MESS_CLOSE_FRAME, 0, 0);
End;

Procedure TUP_AcceptForm.DateEndCheckCheck(Sender: TObject;
    Var Error: String);
Begin
    If (UnLimit.Value = False) And
        (VarIsNull(DateEnd.Value) Or (DateEnd.Value <= 0))
        Then
    Begin
        Error := 'Потрібно вказати дату, по яку приймається людина (або встановити "Безстроково")';
    End;
End;

Procedure TUP_AcceptForm.ActionControlCanEdit(Sender: TObject;
    Mode: TFormMode; Var CanPrepare: Boolean);
Begin
    CanPrepare := qFCheckAll(Self);
    If CanPrepare And (PageControl1.ActivePage <> TS_FinSources) Then
        PageControl1.ActivePage := TS_FinSources;
    FinViewHoursCount.Visible := show_hours;
End;

Procedure TUP_AcceptForm.Expand(View: TcxGridDBTableView);
Var
    i: Integer;
Begin
    i := 0;
    While true Do
    Begin
        If i >= View.ViewData.RowCount Then
            break;
        View.ViewData.Rows[i].Expand(True);
        inc(i);
    End;
End;

Procedure TUP_AcceptForm.ActionControlAfterRefresh(Sender: TObject;
    Value: Variant);
Begin
    RefreshBonuses;

    Expand(FinView);
    Expand(BonusView);
End;

Procedure TUP_AcceptForm.FormControlDatabaseEventAfter(Sender: TObject;
    Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
Var
    KerMode: UP_KERNEL_MODE_STRUCTURE;
    Error: Boolean;
Begin
    // в режиме отладки забить на ядро...
    If DebugMode Then
        Exit;

    Error := False;

    // подготовим параметры ядру
    With KerMode Do
    Begin
        AOWNER := Self; //Контейнер
        ID_ORDER := qFIC_IdOrder.Value; //Идентификатор приказа
        KEY_SESSION := KeySession.Value; //Идентификатор сессии работы ядра
        DBHANDLE := Transaction.DefaultDatabase.Handle;
        //Хендл соединения в рамках которого будет осуществляться работа
    End;

    DMod.GetItems.Close;
    DMod.GetItems.Transaction := Transaction;
    DMod.GetItems.ParamByName('Key_Session').AsInt64 := KeySession.Value;
    DMod.GetItems.Open;

    KerMode.TRHANDLE := Transaction.Handle;

    // пройдемся по всем пунктам
    DMod.GetItems.First;
    While Not DMod.GetItems.Eof Do
    Begin
        KerMode.ID_ORDER_ITEM_IN := DMod.GetItems['Id_Item'];
        If Not UpKernelDo(@KerMode) Then
        Begin
            Error := True;
            GetUpSessionErrors(self, DMod.DB.Handle, KeySession.Value,
                KerMode.ID_ORDER_ITEM_IN);
            break;
        End;

        DMod.GetItems.Next;
    End;

    If Error Then
    Begin
        // не будем показывать стандартное сообщение об ошибке, т.к. ядро скажет
        FormControl.ShowErrorDialog := False;
        Raise Exception.Create('Помилка під час визову ядра');
    End;
End;

Procedure TUP_AcceptForm.AcceptActionExecute(Sender: TObject);
Begin
    If FormControl.Mode = fmInfo Then
        Exit;

    If Not FormControl.Check Then
    Begin
        ModalResult := 0;
        Exit;
    End;

    FormControl.ShowErrorDialog := True;

    If DMod.Smets.IsEmpty Then
    Begin
        qFErrorDialog('Не заповнені джерела фінансування!');
        PageControl1.ActivePage := TS_FinSources;
        ModalResult := 0;
        SendMessage(outer_hwnd, FMAS_MESS_SAVE_ITEM_ERR, 0, 0);
        Exit;
    End;

    If UnLimit.Value Then
        DateEnd.Value := Inf_Date_End;

    // проверить разбивку окладов
    DMod.CheckValidOklad.Close;
    DMod.CheckValidOklad.ParamByName('Key_Session').Value := KeySession.Value;
    DMod.CheckValidOklad.Open;

    If (FormControl.Mode = fmModify) And Not DMod.CheckValidOklad.IsEmpty Then
    Begin
        If qFConfirm('Невірно встановлені оклади! Виправити?') Then
            ReformSmets
        Else
        Begin
            PageControl1.ActivePage := TS_FinSources;
            ModalResult := 0;
            SendMessage(outer_hwnd, FMAS_MESS_SAVE_ITEM_ERR, 0, 0);
            Exit;
        End
    End;

    // вся работа с ядром в событии FormControl.DatabaseEventAfter
    If FormControl.Ok Then
    Begin
        FormControl.Mode := fmModify;
        qFInformDialog('Пункт наказу успішно занесено до бази даних');
        InForm := False;
        // в режиме отладки сказать KeySession...
        If DebugMode Then
        Begin
            Clipboard.AsText := VarToStrDef(KeySession.Value, 'NULL');
            ShowMessage(VarToStrDef(KeySession.Value, 'NULL'));
        End;
        SendMessage(outer_hwnd, FMAS_MESS_SAVE_ITEM_OK, 0, 0);
    End
    Else
        SendMessage(outer_hwnd, FMAS_MESS_SAVE_ITEM_ERR, 0, 0);
End;

Procedure TUP_AcceptForm.ReformSmets;
Var
    Date_End: TDate;
Begin
    If DateBeg.Value > DateEnd.Value Then
        Exit;

    If Not DMod.Smets.IsEmpty Then
    Begin
        With DMod.ManSmetReform Do
        Begin
            DMod.ManSmetReform.Transaction.StartTransaction;

            If VarIsNull(DateEnd.Value) Or (DateEnd.Value <= 0) Then
                Date_End := Inf_Date_End
            Else
                Date_End := DateEnd.Value;

            //            ShowMessage('Date_Beg: ' + VarToStrDef(DateBeg.Value, 'NULL')+
            //               'Date_End: ' + VarToStrDef(Date_End, 'NULL'));

            ParamByName('Key_Session').Value := KeySession.Value;
            ParamByName('Period_Beg').AsDate := DateBeg.Value;
            ParamByName('Period_End').AsDate := Date_End;
            ParamByName('Id_Post_Salary').Value := qFSC_PostFact.Value;
            ParamByName('Id_PCard').Value := qFSC_FIO.Value;
            ParamByName('Id_Type_Post').Value := qFSC_TypePost.Value;
            ParamByName('Month_Hours_Count').AsInteger := Month_Count.EditValue;

            {      ShowMessage('SQL=' + SQL.Text + #13#10 + 'Key_Session: ' +
                    IntToStr(KeySession.Value) + #13#10 + 'Date_Beg: ' + DateToStr(DateBeg.Value)+
                    #13#10 + DateToStr(ParamByName('Period_End').Value) + #1310 +
                    IntToStr(ParamByName('Id_Post_Salary').Value));}

            ExecQuery;
            DMod.ManSmetReform.Transaction.Commit;
        End;

        //    RefreshAction.Execute;
        DMod.Smets.Close;
        DMod.Smets.Open;
        RefreshBonuses;

        Expand(FinView);
        Expand(BonusView);
    End;
End;

Procedure TUP_AcceptForm.DateBegChange(Sender: TObject);
Begin
    ReformSmets;
    If IsEditWorkMode = 1 Then
    Begin
        FillWorkModeDSet(DMod.WMByPeriodSet, DateBeg.Value, DateEnd.Value, IdWorkMode, null, null,
            ShiftEdit.Value, 7);
        FillWorkModeGrid(WorkModeGridTableView1, DMod.WMByPeriodSet);
    End;
End;

Procedure TUP_AcceptForm.DateEndChange(Sender: TObject);
Begin
    ReformSmets;
    If IsEditWorkMode = 1 Then
    Begin
        FillWorkModeDSet(DMod.WMByPeriodSet, DateBeg.Value, DateEnd.Value, IdWorkMode, null, null,
            ShiftEdit.Value, 7);
        FillWorkModeGrid(WorkModeGridTableView1, DMod.WMByPeriodSet);
    End;
End;

Procedure TUP_AcceptForm.qFSC_PostFactChange(Sender: TObject);
Begin
    If isReformSmets Then
        ReformSmets;
End;

Procedure TUP_AcceptForm.qFSC_HospFIOOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    sp: TSprav;
Begin
    sp := GetSprav('Asup\AsupHospital');
    If sp <> Nil Then
    Begin
        // заполнить входные параметры
        With sp.Input Do
        Begin
            Append;
            FieldValues['DBHandle'] := Integer(DMod.DB.Handle);
            FieldValues['Select'] := 1;
            Post;
        End;
        // показать справочник и проанализировать результат
        sp.Show;
        If (sp.Output <> Nil) And Not sp.Output.IsEmpty Then
        Begin
            Value := sp.Output['Id_Man_Hosp'];
            DisplayText := sp.Output['DisplayText'];
            DateBeg.Value := sp.Output['Date_Beg'];
            If sp.Output['Ending'] <> 2 Then
                DateBeg.Value := sp.Output['Date_End']
            Else
            Begin
                DateBeg.Value := Inf_Date_End;
                UnLimit.Value := True;
            End
        End;
        sp.Free;
    End;
End;

Procedure TUP_AcceptForm.AuxActionExecute(Sender: TObject);
Begin
    Clipboard.AsText := IntToStr(KeySession.Value);
    ShowMessage('Key_Session: ' + IntToStr(KeySession.Value) + ' Id_Order_Item: '
        + VarToStrDef(Id_Order_Item, 'NULL'));
End;

Procedure TUP_AcceptForm.TS_MainMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
    If (ssCtrl In Shift) And (ssAlt In Shift) And (ssShift In Shift) Then
        AuxAction.Execute;
End;

Procedure TUP_AcceptForm.GenKeySession;
Begin
    DMod.KeySessionGenerate.Open;
    KeySession.Value := DMod.KeySessionGenerate['ret_value'];
    DMod.KeySessionGenerate.Close;
End;

Procedure TUP_AcceptForm.qFSC_WReasonChange(Sender: TObject);
Begin
    DMod.WorkReasonSelect.Close;
    DMod.WorkReasonSelect.Open;
    DMod.WorkReasonSelect.Locate('Id_Work_Reason', qFSC_WReason.Value, []);

    If DMod.WorkReasonSelect['IS_SHTAT'] = 'T' Then
        qFBC_IsPostMain.Value := True
    Else
        qFBC_IsPostMain.Value := False;


    If DMod.WorkReasonSelect['FIX_MAIN_POST'] = 'T' Then
        qFBC_IsPostMain.Blocked := True
    Else
        qFBC_IsPostMain.Blocked := False;
End;

Procedure TUP_AcceptForm.qFSC_HolFIOOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    sp: TSprav;
Begin
    sp := GetSprav('Up\UpHolidayFact.bpl');
    If sp <> Nil Then
    Begin
        // заполнить входные параметры
        With sp.Input Do
        Begin
            Append;
            FieldValues['DBHandle'] := Integer(DMod.DB.Handle);
            FieldValues['Select'] := 1;
            Post;
        End;

        // показать справочник и проанализировать результат
        sp.Show;
        If (sp.Output <> Nil) And Not sp.Output.IsEmpty Then
        Begin
            Value := sp.Output['Id_Man_Holiday_Fact'];
            DisplayText := sp.Output['Full_Name'];
            DateBeg.Value := sp.Output['Holiday_Beg'];
            DateBeg.Value := sp.Output['Holiday_End']
        End;
        sp.Free;
    End;
End;

Procedure TUP_AcceptForm.FormControlDatabaseEventBefore(Sender: TObject;
    Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
Begin
    UpKernelUnit.StartHistory(TpFIBTransaction(Transaction));
End;

Procedure TUP_AcceptForm.RefreshBonuses;
Begin
    DMod.AcceptBonusSelect.Close;
    DMod.AcceptBonusSelect.ParamByName('Key_Session').AsInt64 := KeySession.Value;
    DMod.AcceptBonusSelect.Open;
End;

Procedure TUP_AcceptForm.FinViewKeyUp(Sender: TObject; Var Key: Word;
    Shift: TShiftState);
Begin
    If Key = VK_INSERT Then
        A_Add.Execute;
    If Key = VK_F2 Then
        A_Modif.Execute;
    If Key = VK_F5 Then
        RefreshAction.Execute;
    If Key = VK_DELETE Then
        A_Del.Execute;
End;

Procedure TUP_AcceptForm.BonusViewKeyUp(Sender: TObject; Var Key: Word;
    Shift: TShiftState);
Begin
    If Key = VK_INSERT Then
        AddBonus.Execute;
    If Key = VK_F2 Then
        ModifyBonus.Execute;
    If Key = VK_F5 Then
        RefreshAction.Execute;
    If Key = VK_DELETE Then
        DelBonusExecute(Sender);
End;

Procedure TUP_AcceptForm.FormKeyUp(Sender: TObject; Var Key: Word;
    Shift: TShiftState);
Begin
    If (ssCtrl In Shift) And (ssShift In Shift) And (Key = VK_TAB) Then
        PageControl1.SelectNextPage(False, True)
    Else
        If (ssCtrl In Shift) And (Key = VK_TAB) Then
            PageControl1.SelectNextPage(True, True);
End;

Procedure TUP_AcceptForm.FormClose(Sender: TObject;
    Var Action: TCloseAction);
Begin
    // в режиме отладки забить на очистку буфера...
    If DebugMode Then
        Exit;

    // очистим буфера
    Try
        DMod.ClearBuffQuery.Transaction.StartTransaction;
        DMod.ClearBuffQuery.ParamByName('Key_Session').Value := KeySession.Value;
        DMod.ClearBuffQuery.ExecQuery;
        DMod.ClearBuffQuery.Transaction.Commit;
    Except
    End;
End;

Procedure TUP_AcceptForm.AbsentOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    form: TfmAbsentForm;
Begin
    form := TfmAbsentForm.Create(Self, DMod);
    If FormControl.Mode <> fmAdd Then
        form.Prepare(Id_Type_Away.Value, Absent.Value,
            Id_Key.Value);
    If form.ShowModal = mrOk Then
    Begin
        { if VarIsNull(form.Id_Key.Value) then
         begin
            agMessageDlg('Увага!', 'Не вдалося зберегти інформацію, треба обрати документ!', mtInformation, [mbOK]);
            Exit;
         end; }
        Id_Type_Away.Value := form.Id_Away_Type.Value;
        Value := form.Id_PCard_Away.Value;
        Id_Key.Value := form.Id_Key.Value;

        Absent_Date_Beg.Value := form.Date_Beg;
        Absent_Date_End.Value := form.Date_End;

        {if form.Date_Beg <> 0 then
            DateBeg.Value := form.Date_Beg;

        if form.Date_End <> 0 then
        begin
            DateEnd.Value := form.Date_End;
            if not DMod.UPConsts.Active then DMod.UPConsts.Open;
            if form.Date_End = DMod.UpConsts['INFINITY_DATE'] then
                UnLimit.Value := True;
        end;}

        If DMod.IniAwayType.Locate('Id_Type_Away', Id_Type_Away.Value, []) Then
        Begin
            //            qFSC_WReason.Value := DMod.IniAwayType['Id_Work_Reason'];
            //            qFSC_WReason.DisplayText := DMod.IniAwayType['Name_Work_Reason'];

            DisplayText := DMod.IniAwayType['Name_Type_Away'] + ' працівника '
                + form.Id_PCard_Away.DisplayText;
            If Not VarIsNull(form.Id_Key.Value) Then
            Begin
                DisplayText := DisplayText + ' (підстава: ' + form.Reason + ')';
            End
        End;
    End;
    form.free;
End;

Procedure TUP_AcceptForm.AbsentChange(Sender: TObject);
Begin
    If FormControl.Mode <> fmInfo Then
    Begin
        {if VarIsNull(Absent.Value) then
        begin
            qFSC_WReason.Blocked := False;
            qFSC_WReason.AutoSaveToRegistry := True;
        end
        else
        begin
            qFSC_WReason.AutoSaveToRegistry := False;
            qFSC_WReason.Blocked := True;
        end;}
    End;

    If VarIsNull(Absent.Value) Then
    Begin
        Id_Type_Away.Clear;
        Id_Key.Clear;
    End;
End;

Procedure TUP_AcceptForm.AcceptAbsentCheckCheck(Sender: TObject;
    Var Error: String);
Begin
    Error := '';
    If Not VarIsNull(Id_Key.Value) And Not VarIsEmpty(Id_Key.Value) Then
    Begin
        If (DateBeg.Value < Absent_Date_Beg.Value) Or
            (DateBeg.Value > Absent_Date_End.Value) Or
            (DateEnd.Value < Absent_Date_Beg.Value) Or
            (DateEnd.Value > Absent_Date_End.Value)
            Then
        Begin
            Error := 'Період прийняття повинен належати періоду відсутності працівника!';
            DateBeg.Highlight(True);
            DateEnd.Highlight(True);
        End;
    End;
End;

Procedure TUP_AcceptForm.A_DelExecute(Sender: TObject);
Begin
    With DMod Do
    Begin
        If Smets.IsEmpty Then
            Exit;

        DeleteManSmet.Close;
        DeleteManSmet.ParamByName('Id_Rec').AsInt64 := Smets['Id_Rec'];
        DeleteManSmet.ParamByName('Key_Session').AsInt64 := KeySession.Value;
        DeleteManSmet.ParamByName('Id_PCard').AsInt64 := qFSC_FIO.Value;
        DeleteManSmet.ParamByName('Id_Post_Salary').AsInt64 := qFSC_PostFact.Value;
        DeleteManSmet.Transaction.StartTransaction;
        DeleteManSmet.ExecQuery;
        DeleteManSmet.Transaction.Commit;
    End;
    RefreshAction.Execute;
End;

{Function TUPAcceptOrder.CheckVacByIdUser: Boolean;
Var IUStoredProc: TpFibStoredProc;
    Res: Integer;
Begin
    IUStoredProc := TpFibStoredProc.Create(self);
    IUStoredProc.Database := Dmod.WorkDatabase;
    IUStoredProc.Transaction := WriteTransaction;
  //  WriteTransaction.StartTransaction;
    IUStoredProc.StoredProcName := 'UP_KER_CHECK_VACANCIES';
    IUStoredProc.Prepare;
    IUStoredProc.ParamByName('ID_USER').AsInt64 := GetUserId;
    IUStoredProc.ExecProc;
    Res := IUStoredProc.ParamByName('RESULT').Value;
  //  WriteTransaction.Commit;
    IUStoredProc.Close;
    IUStoredProc.Free;

    If (Res = 1)
        Then Result := true
    Else Result := false;
End;    }

Function TUP_AcceptForm.CheckVacByIdUs: Boolean;
Var
    IUStoredProc: TpFibStoredProc;
    Res: Integer;
Begin
    IUStoredProc := TpFibStoredProc.Create(self);
    IUStoredProc.Database := Dmod.DB;
    IUStoredProc.Transaction := DMod.ReadTransaction;
    IUStoredProc.StoredProcName := 'UP_KER_CHECK_VACANCIES';
    IUStoredProc.Prepare;
    IUStoredProc.ParamByName('ID_USER').AsInt64 := GetUserId;
    IUStoredProc.ExecProc;
    Res := IUStoredProc.ParamByName('RESULT').Value;
    IUStoredProc.Close;
    IUStoredProc.Free;

    If (Res = 1)
        Then
        Result := true
    Else
        Result := false;
End;

Procedure TUP_AcceptForm.FormShow(Sender: TObject);
Var
    Check: Integer;
Begin
    Check := fibCheckPermission('/ROOT/up_order_system/up_order_types/1_UP_ORDER_TYPE/UP_WORKMODE_TAB',
        'Edit');
    If Check <> 0 Then
        TsWorkMode.TabVisible := False;
    IsEditWorkMode := 1;
End;

Procedure TUP_AcceptForm.ShiftEditPropertiesChange(Sender: TObject);
Begin
    If IsEditWorkMode = 0 Then
        Exit;
    If ShiftEdit.Value > MaxBound - 1 Then
        ShiftEdit.Value := MaxBound - 1;
    If ShiftEdit.Value < 0 Then
        ShiftEdit.Value := 0;
    ShiftControl.Value := ShiftEdit.Value;
    FillWorkModeDSet(DMod.WMByPeriodSet, DateBeg.Value, DateEnd.Value, IdWorkMode, null, null,
        ShiftEdit.Value, 7);
    FillWorkModeGrid(WorkModeGridTableView1, DMod.WMByPeriodSet);
End;

Procedure TUP_AcceptForm.WorkModeSpravPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
Var
    res: Variant;
    Parameter: TTuSimpleParam;
Begin
    Parameter := TTuSimpleParam.Create;
    Parameter.DB_Handle := Dmod.DB.Handle;
    Parameter.Owner := self;
    Parameter.CFStyle := tfsModal;
    res := DoFunctionFromPackage(Parameter, Tu_SpWorkMode_Pack);
    If VarIsArray(res) Then
    Begin
        IdWorkMode := res[0];
        IdWorkModeControl.Value := res[0];
        WorkModeSprav.Text := res[1];
        MaxBound := res[2];
        IsEditWorkMode := 1;
    End;
    FillWorkModeDSet(DMod.WMByPeriodSet, DateBeg.Value, DateEnd.Value, IdWorkMode, null, null,
        ShiftEdit.Value, 7);
    FillWorkModeGrid(WorkModeGridTableView1, DMod.WMByPeriodSet);
    Parameter.Destroy;
End;

Procedure TUP_AcceptForm.qFSC_FIOKeyDown(Sender: TObject; Var Key: Word;
    Shift: TShiftState);
Begin
    With DMod Do
    Begin
        DSetShowInfo.Close;
        DSetShowInfo.SelectSQL.Text := 'select distinct * ' +
            '  from up_dt_man_moving_buff ' +
            ' where key_session=:key_session';
        DSetShowInfo.ParamByName('key_session').Value := KeySession.Value;
        DSetShowInfo.Open;
        If ((DSetShowInfo.RecordCount > 0) And (Key = VK_F12)
            And (ssShift In Shift)) Then
            ShowInfo(DSetShowInfo);
    End
End;

Procedure TUP_AcceptForm.qFSC_WCondChange(Sender: TObject);
Begin
    If VarIsNull(qFSC_WCond.Value) Then
        Exit;
    With DMod Do
    Begin
        Try
            DSetTemp.Close;
            DSetTemp.SQLs.SelectSQL.Clear;
            DSetTemp.SQLs.SelectSQL.Text := 'select first(1) name_work_cond ' +
                '  from ini_work_cond ' +
                ' where id_work_cond=:id_work_cond';
            DSetTemp.ParamByName('id_work_cond').AsInteger := qFSC_WCond.Value;
            DSetTemp.Open;
            If Not DSetTemp.IsEmpty Then
                qFSC_WCond.DisplayText := DSetTemp['name_work_cond'];
        Except On E: Exception
            Do
            Begin
                agMessageDlg('Увага!', E.Message, mtError, [mbOK]);
                DSetTemp.Close;
            End;
        End;
    End;
End;

Procedure TUP_AcceptForm.qFSC_PayFormChange(Sender: TObject);
Begin
    If VarIsNull(qFSC_PayForm.Value) Then
        Exit;
    With DMod Do
    Begin
        Try
            DSetTemp.Close;
            DSetTemp.SQLs.SelectSQL.Clear;
            DSetTemp.SQLs.SelectSQL.Text := 'select first(1) name_pay_form ' +
                '  from ini_pay_form ' +
                ' where id_pay_form=:id_pay_form';
            DSetTemp.ParamByName('id_pay_form').AsInteger := qFSC_PayForm.Value;
            DSetTemp.Open;
            If Not DSetTemp.IsEmpty Then
                qFSC_PayForm.DisplayText := DSetTemp['name_pay_form'];
        Except On E: Exception
            Do
            Begin
                agMessageDlg('Увага!', E.Message, mtError, [mbOK]);
                DSetTemp.Close;
            End;
        End;
    End;
End;

Procedure TUP_AcceptForm.IdShrEditKeyPress(Sender: TObject; Var Key: Char);
Begin
    If ((Key In ['0'..'9']) Or (Key = #8)) Then
        IdShrEdit.Properties.ReadOnly := False
    Else
        IdShrEdit.Properties.ReadOnly := True;
End;

Procedure TUP_AcceptForm.btnShowShrGridClick(Sender: TObject);
Begin
    If btnShowShrGrid.Caption = '<<' Then
    Begin
        btnShowShrGrid.Caption := '>>';
        pnlIdShrGrid.Height := 160;
        pnlIdShrGrid.Visible := True;
    End
    Else
    Begin
        btnShowShrGrid.Caption := '<<';
        pnlIdShrGrid.Visible := False;
    End;
End;

Procedure TUP_AcceptForm.btnSearchShrClick(Sender: TObject);
Var
    er: String;
Begin
    AddBuffInfoByIdShr;
End;

Procedure TUP_AcceptForm.btnDelIdShrClick(Sender: TObject);
Begin
    EnableBtn(False);
    Try
        With DMod Do
        Begin
            If DSetIdShR.RecordCount > 0 Then
            Begin
                ShrProc.Transaction.StartTransaction;
                ShrProc.StoredProcName := 'UP_IDSHR_BUFF_DEL';
                ShrProc.Prepare;
                ShrProc.ParamByName('KEY_SESSION').AsInteger := KeySession.Value;
                ShrProc.ParamByName('ID_SH_R').AsInt64 := DSetIdShR['ID_SH_R'];
                ShrProc.ParamByName('RATE_COUNT').AsFloat := DSetIdShR['RATE_COUNT'];
                ShrProc.ExecProc;
                ShrProc.Transaction.Commit;
                RefreshSmetsBonus;
                DataSetShrCloseOpen;
            End;
            If DSetIdShR.IsEmpty Then
            Begin
                //btnShowShrGrid.Caption := '<<';
                qFSC_Department.Value := null;
                qFSC_Department.DisplayText := '';
                qFSC_Post.Value := null;
                qFSC_Post.DisplayText := '';
                qFSC_TypePost.Value := null;
                qFSC_TypePost.DisplayText := '';
                qFSC_PostFact.Value := null;
                qFSC_PostFact.DisplayText := '';
                qFSC_WReason.Value := null;
                qFSC_WReason.DisplayText := '';
                qFSC_PayForm.Value := null;
                qFSC_PayForm.DisplayText := '';
                qFSC_WCond.Value := null;
                qFSC_WCond.DisplayText := '';
                IdWorkModeControl.Value := null;
                IdWorkMode := null;
                ShiftEdit.Value := 0;
                ClearGridWorkMode;
                WorkModeSprav.Text := '';
                MaxBound := 0;
                HoursCntEdit.EditValue := null;
                Month_Count.EditValue := 0;
                Show_hours := false;
                lblMonthCnt.Visible := show_hours;
                Month_Count.Visible := show_hours;
            End;
        End;
    Except On E: Exception
        Do
        Begin
            agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
            DMod.ShrProc.Transaction.Rollback;
        End;
    End;
    EnableBtn(True);
    BlockedSprav;
End;

Procedure TUP_AcceptForm.qFSC_PostChange(Sender: TObject);
Var
    DS: TpFIBDataSet;
    Res: Variant;
Begin
    {try
      if not VarIsNull(qFSC_Post.Value) then
      begin
         DS:=TpFIBDataSet.Create(Self);
         DS.Database:=DMod.DB;
         DS.Transaction:=DMod.ReadTransaction;
         DS.Close;
         DS.SQLs.SelectSQL.Text:='select first(1) r.id_work_mode '+
                                 'from dt_shtatras r, dt_shtatras_smet s '+
                                 'where s.id_shtatras=r.id_shtatras '+
                                 'and s.id_sh_r=:id_sh_r';
         DS.ParamByName('id_sh_r').AsInteger:=IdShr;
         DS.Open;
         DS.FetchAll;
         If ((not DS.IsEmpty) And (IsEditWorkMode=1)) then
         begin
            IdWorkModeControl.Value:=DS['Id_Work_Mode'];
            ShiftControl.Value:=0;
            ShiftEdit.Value:=0;
            IdWorkMode:=IdWorkModeControl.Value;
            FillWorkModeDSet(DMod.WMByPeriodSet, DateBeg.Value, DateEnd.Value, IdWorkModeControl.Value, null, null, ShiftControl.Value, 7);
            FillWorkModeGrid(WorkModeGridTableView1, DMod.WMByPeriodSet);
            Res:=GetWorkModeInfo(DMod.GetWorkMode, IdWorkModeControl.Value);
            If VarIsArray(Res) then
            begin
               WorkModeSprav.Text:=Res[0];
               MaxBound:=Res[1];
            end;
         end;
         DS.Close;
         DS.Free;
      end;
    except on e:Exception
           do ShowMessage(e.Message);
    end; }
End;

Procedure TUP_AcceptForm.btnAddIdShrClick(Sender: TObject);
Begin
    AddBuffInfoByIdShr;
End;

Procedure TUP_AcceptForm.ShrGridDBViewKeyDown(Sender: TObject;
    Var Key: Word; Shift: TShiftState);
Begin
    If ((DMod.DsetIdShr.RecordCount > 0) And (Key = VK_F12)
        And (ssShift In Shift)) Then
        ShowInfo(DMod.DsetIdShr);
End;

Procedure TUP_AcceptForm.DelBonusExecute(Sender: TObject);
Begin
    If agMessageDlg('Увага!', 'Ви дійсно бажаєте вилучити це запис?', mtConfirmation, [mbYes, mbNo]) = mrNo
        Then
        Exit;
    With DMod Do
    Begin
        Try
            BonusStoredProc.StoredProcName := 'UP_ACCEPT_DELETE_BONUS';
            BonusStoredProc.Transaction.StartTransaction;
            BonusStoredProc.Prepare;
            BonusStoredProc.ParamByName('Id_Raise').AsInteger := DMod.AcceptBonusSelect['ID_RAISE'];
            BonusStoredProc.ParamByName('Key_Session').AsInt64 := KeySession.Value;
            BonusStoredProc.ParamByName('Id_Rec').AsInt64 := DMod.AcceptBonusSelect['ID_REC'];
            BonusStoredProc.ExecProc;
            BonusStoredProc.Transaction.Commit;
            RefreshBonuses;
            BonusView.ViewData.Expand(True);
        Except On E: Exception
            Do
            Begin
                agMessageDlg('Увага!', E.Message, mtInformation, [mbOk]);
                BonusStoredProc.Transaction.Rollback;
            End;
        End;
    End;
End;

Procedure TUP_AcceptForm.AddBonusExecute(Sender: TObject);
Var
    frm: TfmBonusEdit;
Begin
    frm := TfmBonusEdit.Create(Self, DateBeg.Value, KeySession.Value, null, False, DMod);
    frm.Caption := 'Додати';
    If frm.ShowModal = mrOk Then
    Begin
        With DMod Do
        Begin
            BonusStoredProc.StoredProcName := 'UP_ACCEPT_ADD_BONUS';
            BonusStoredProc.Transaction.StartTransaction;
            BonusStoredProc.Prepare;
            BonusStoredProc.ParamByName('KEY_SESSION').AsInt64 := KeySession.Value;
            BonusStoredProc.ParamByName('ID_RAISE').AsInteger := frm.IdRaise.Value;
            If VarIsNull(frm.Percent.Value) Then
                BonusStoredProc.ParamByName('PERCENT').Value := null
            Else
                BonusStoredProc.ParamByName('PERCENT').AsFloat := frm.Percent.Value;
            If VarIsNull(frm.Summa.Value) Then
                BonusStoredProc.ParamByName('SUMMA').Value := null
            Else
                BonusStoredProc.ParamByName('SUMMA').AsFloat := frm.Summa.Value;
            BonusStoredProc.ParamByName('ID_SMET').Value := frm.Smeta.Value;
            BonusStoredProc.ParamByName('ID_SMET_PPS').Value := frm.Kod_Sm_Pps.Value;
            BonusStoredProc.ParamByName('ALL_PERIODS').AsInteger := Integer(Boolean(frm.All_Periods.Value));
            If frm.All_Periods.Value = True Then
            Begin
                BonusStoredProc.ParamByName('PERIOD_BEG').Value := Null;
                BonusStoredProc.ParamByName('PERIOD_END').Value := Null;
            End
            Else
            Begin
                BonusStoredProc.ParamByName('PERIOD_BEG').AsDate := frm.DateBeg.Date;
                BonusStoredProc.ParamByName('PERIOD_END').AsDate := frm.DateEnd.Date;
            End;
            Try
                BonusStoredProc.ExecProc;
                BonusStoredProc.Transaction.Commit;
                RefreshBonuses;
                BonusView.ViewData.Expand(True);
            Except On E: Exception
                Do
                Begin
                    agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
                    BonusStoredProc.Transaction.Rollback;
                End;
            End;
        End;
    End;
    frm.Free;
End;

Procedure TUP_AcceptForm.ModifyBonusExecute(Sender: TObject);
Var
    frm: TfmBonusEdit;
    DateB: TDate;
Begin
    DateB := DMod.AcceptBonusSelect['DATE_BEG'];
    frm := TfmBonusEdit.Create(Self, DateB, KeySession.Value, DMod.AcceptBonusSelect['ID_RAISE'], True,
        DMod);
    frm.Caption := 'Змінити';
    If frm.ShowModal = mrOk Then
    Begin
        With DMod Do
        Begin
            BonusStoredProc.StoredProcName := 'UP_ACCEPT_MODIFY_BONUS';
            BonusStoredProc.Transaction.StartTransaction;
            BonusStoredProc.Prepare;
            BonusStoredProc.ParamByName('KEY_SESSION').AsInt64 := KeySession.Value;
            BonusStoredProc.ParamByName('ID_RAISE').AsInteger := frm.IdRaise.Value;
            If VarIsNull(frm.Percent.Value) Then
                BonusStoredProc.ParamByName('PERCENT').Value := null
            Else
                BonusStoredProc.ParamByName('PERCENT').AsFloat := frm.Percent.Value;
            If VarIsNull(frm.Summa.Value) Then
                BonusStoredProc.ParamByName('SUMMA').Value := null
            Else
                BonusStoredProc.ParamByName('SUMMA').AsFloat := frm.Summa.Value;
            BonusStoredProc.ParamByName('ID_SMET').Value := frm.Smeta.Value;
            BonusStoredProc.ParamByName('ID_SMET_PPS').Value := frm.Kod_Sm_Pps.Value;
            BonusStoredProc.ParamByName('ALL_PERIODS').AsInteger := Integer(Boolean(frm.All_Periods.Value));
            If frm.All_Periods.Value = True Then
            Begin
                BonusStoredProc.ParamByName('PERIOD_BEG').Value := Null;
                BonusStoredProc.ParamByName('PERIOD_END').Value := Null;
            End
            Else
            Begin
                BonusStoredProc.ParamByName('PERIOD_BEG').AsDate := frm.DateBeg.Date;
                BonusStoredProc.ParamByName('PERIOD_END').AsDate := frm.DateEnd.Date;
            End;
            BonusStoredProc.ParamByName('OLD_PERIOD_BEG').AsDate := DateB;
            BonusStoredProc.ParamByName('OLD_PERIOD_END').AsDate := DMod.AcceptBonusSelect['DATE_END'];
            BonusStoredProc.ParamByName('ID_REC').AsInt64 := DMod.AcceptBonusSelect['ID_REC'];
            Try
                BonusStoredProc.ExecProc;
                BonusStoredProc.Transaction.Commit;
                RefreshBonuses;
                BonusView.ViewData.Expand(True);
            Except On E: Exception
                Do
                Begin
                    agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
                    BonusStoredProc.Transaction.Rollback;
                End;
            End;
        End;
    End;
    frm.Free;
End;

Procedure TUP_AcceptForm.qFSC_TypePostChange(Sender: TObject);
Begin
    If Not (VarIsNull(qFSC_TypePost.Value)) Then
    Begin
     
        show_hours := ShowHoursByTypePost(qFSC_TypePost.Value);
   
        lblMonthCnt.Visible := show_hours;
        Month_Count.Visible := show_hours;
        
        if Month_Count.Visible then
        begin
            if Month_Count.EditValue = 0 then
            Month_Count.EditValue := DefaultMonthCount;
        end
        else Month_Count.EditValue := 0;
    End;
End;

function TUP_AcceptForm.ShowHoursByTypePost(Id_Type_Post: Integer): Boolean;
var
    DS: TpFibDataSet;
begin
    Try
    DS := TpFibDataSet.Create(self);
    DS.Database := Dmod.DB;
    DS.Transaction := DMod.ReadTransaction;

    If DS.Active Then
        DS.Close;
    DS.SQLs.SelectSQL.Text := 'SELECT * FROM SP_TYPE_POST WHERE ID_TYPE_POST = ' + IntToStr(Id_Type_Post);
    DS.Open;

    ShowHoursByTypePost := false;

    if not (VarIsNull(DS.FieldByName('IS_PED_WORK').Value)) then
        if (DS.FieldByName('IS_PED_WORK').AsInteger = 1) then
            ShowHoursByTypePost := true;

    DS.Close;
    DS.Free;
    Except on E: Exception do
        ShowMessage(E.Message);
    End;
end;

procedure TUP_AcceptForm.Month_CountPropertiesChange(Sender: TObject);
begin
       if VarIsNull(Month_Count.EditValue) then
        Month_Count.EditValue := 0;
    if Month_Count.EditValue > MaxMonthCount then
    begin
        agMessageDlg('Увага!', 'Кількість місяців не може перевищувати ' + IntToStr(MaxMonthCount), mtInformation, [mbOK]);
        Month_Count.EditValue := MaxMonthCount;
    end;
    month_hours_count.Value := Month_Count.EditValue;
    try
    ReformSmets;
    except on E: Exception do
        showMessage(E.Message);
    end;
end;

procedure TUP_AcceptForm.RateCntEditPropertiesChange(Sender: TObject);
begin
    if not VarIsNull(RateCntEdit.Value) then
    begin
        HoursCntEdit.EditValue := null;
        Month_Count.EditValue := 0;
        Month_Count.Visible := false;
        lblMonthCnt.Visible := false;
    end;
end;

procedure TUP_AcceptForm.HoursCntEditPropertiesChange(Sender: TObject);
begin
    if not VarIsNull(HoursCntEdit.Value) then
    begin
        RateCntEdit.EditValue := null;
        if (Month_Count.EditValue = 0) then
        Month_Count.EditValue := DefaultMonthCount;
        Month_Count.Visible := True;
        lblMonthCnt.Visible := True;
    end;
end;

procedure TUP_AcceptForm.Count_month_checkCheck(Sender: TObject;
  var Error: String);
begin
    Error := '';
    if Show_hours then
       if Month_Count.EditValue <= 0 then
       begin
           Error := 'Кількість місяців має бути більша за 0!';
           Month_Count.SetFocus;
       end;
end;

procedure TUP_AcceptForm.RateCntEditPropertiesEditValueChanged(
  Sender: TObject);
begin
    if not VarIsNull(RateCntEdit.Value) then
    begin
        HoursCntEdit.EditValue := null;
        Month_Count.EditValue := 0;
        Month_Count.Visible := false;
        lblMonthCnt.Visible := false;
    end;
end;

procedure TUP_AcceptForm.HoursCntEditPropertiesEditValueChanged(
  Sender: TObject);
begin
    if not VarIsNull(HoursCntEdit.Value) then
    begin
        RateCntEdit.EditValue := null;
        if (Month_Count.EditValue = 0) then
        Month_Count.EditValue := DefaultMonthCount;
        Month_Count.Visible := True;
        lblMonthCnt.Visible := True;
    end;
end;

procedure TUP_AcceptForm.Month_CountPropertiesEditValueChanged(
  Sender: TObject);
begin

    if VarIsNull(Month_Count.EditValue) then
        Month_Count.EditValue := 0;
    if Month_Count.EditValue > MaxMonthCount then
    begin
        agMessageDlg('Увага!', 'Кількість місяців не може перевищувати ' + IntToStr(MaxMonthCount), mtInformation, [mbOK]);
        Month_Count.EditValue := MaxMonthCount;
    end;
    month_hours_count.Value := Month_Count.EditValue;
    try
    ReformSmets;
    except on E: Exception do
        ShowMessage(E.Message);
    end;
end;

End.

