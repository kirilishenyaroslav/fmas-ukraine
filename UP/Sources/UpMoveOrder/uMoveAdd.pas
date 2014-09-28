{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
Unit uMoveAdd;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, Buttons, ExtCtrls,
    cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
    cxGridCustomView, cxGrid, cxPC, FIBDatabase, pFIBDatabase, FIBDataSet,
    pFIBDataSet, cxCheckBox, dxBar, dxBarExtItems, uFControl,
    uLabeledFControl, uDateControl, uBoolControl, uSpravControl, uMemoControl,
    uCharControl, uEnumControl, uCommonSP, uUnivSprav, RxMemDS, FIBQuery,
    pFIBQuery, pFIBStoredProc, Math, uLogicCheck, uSimpleCheck, cxContainer,
    cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, AccMgmt,
    cxLookAndFeelPainters, cxButtons, cxGridDBTableView, uFloatControl,
    cxCurrencyEdit, ActnList, cxSpinEdit, TuCommonLoader, TuCommontypes, DateUtils,
    cxButtonEdit, uWMFillGrid, cxDBEdit;

Type
    TfrmAddMoving = Class(TForm)
        cxPageControl1: TcxPageControl;
        cxTabSheet1: TcxTabSheet;
        cxTabSheet2: TcxTabSheet;
        cxGrid3: TcxGrid;
        cxGridDBBandedTableView2: TcxGridDBBandedTableView;
        cxGridDBBandedColumn13: TcxGridDBBandedColumn;
        cxGridDBBandedColumn14: TcxGridDBBandedColumn;
        cxGridDBBandedColumn15: TcxGridDBBandedColumn;
        cxGridDBBandedColumn16: TcxGridDBBandedColumn;
        cxGridDBBandedColumn17: TcxGridDBBandedColumn;
        cxGridDBBandedColumn18: TcxGridDBBandedColumn;
        cxGridDBBandedColumn19: TcxGridDBBandedColumn;
        cxGridDBBandedColumn20: TcxGridDBBandedColumn;
        cxGridDBBandedColumn21: TcxGridDBBandedColumn;
        cxGridDBBandedColumn22: TcxGridDBBandedColumn;
        cxGridDBBandedColumn23: TcxGridDBBandedColumn;
        cxGridDBBandedColumn24: TcxGridDBBandedColumn;
        cxGridLevel2: TcxGridLevel;
        cxTabSheet3: TcxTabSheet;
        cxGrid6: TcxGrid;
        cxGridDBBandedTableView4: TcxGridDBBandedTableView;
        cxGridDBBandedColumn25: TcxGridDBBandedColumn;
        cxGridDBBandedColumn26: TcxGridDBBandedColumn;
        cxGridDBBandedColumn27: TcxGridDBBandedColumn;
        cxGridDBBandedColumn28: TcxGridDBBandedColumn;
        cxGridDBBandedColumn29: TcxGridDBBandedColumn;
        cxGridDBBandedColumn30: TcxGridDBBandedColumn;
        cxGridDBBandedColumn31: TcxGridDBBandedColumn;
        cxGridDBBandedColumn32: TcxGridDBBandedColumn;
        cxGridDBBandedColumn33: TcxGridDBBandedColumn;
        cxGridDBBandedColumn34: TcxGridDBBandedColumn;
        cxGridDBBandedColumn35: TcxGridDBBandedColumn;
        cxGridDBBandedColumn36: TcxGridDBBandedColumn;
        cxGridDBBandedColumn37: TcxGridDBBandedColumn;
        cxGridDBBandedColumn38: TcxGridDBBandedColumn;
        cxGridDBBandedColumn39: TcxGridDBBandedColumn;
        cxGridDBBandedColumn40: TcxGridDBBandedColumn;
        cxGridDBBandedColumn41: TcxGridDBBandedColumn;
        cxGridDBBandedColumn42: TcxGridDBBandedColumn;
        cxGridDBBandedColumn43: TcxGridDBBandedColumn;
        cxGridDBBandedColumn44: TcxGridDBBandedColumn;
        cxGridDBBandedColumn45: TcxGridDBBandedColumn;
        cxGridLevel5: TcxGridLevel;
        Panel2: TPanel;
        Bevel1: TBevel;
        Panel1: TPanel;
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        WriteTransaction: TpFIBTransaction;
        DataSetNad: TpFIBDataSet;
        Database: TpFIBDatabase;
        DataSourceNad: TDataSource;
        dxBarManager1: TdxBarManager;
        btnAdd: TdxBarLargeButton;
        btnDelete: TdxBarLargeButton;
        btnView: TdxBarLargeButton;
        btnEdit: TdxBarLargeButton;
        dxBarDockControl1: TdxBarDockControl;
        dxBarDockControl2: TdxBarDockControl;
        cbNoDateEnd: TqFBoolControl;
        DepartmentEdit: TqFSpravControl;
        PosadOkladEdit: TqFSpravControl;
        FactOkladEdit: TqFSpravControl;
        PersonalTypeEdit: TqFSpravControl;
        WorkReasonEdit: TqFSpravControl;
        cbIsMainPost: TqFBoolControl;
        WorkCondEdit: TqFSpravControl;
        PayFormEdit: TqFSpravControl;
        ReasonEdit: TqFCharControl;
        NoteEdit: TqFCharControl;
        GroupBox1: TGroupBox;
        CondEdit: TqFSpravControl;
        PayEdit: TqFEnumControl;
        SelectTypePost: TpFIBDataSet;
        WorkReasonSelect: TpFIBDataSet;
        StoredProc: TpFIBStoredProc;
        DataSourceSmet: TDataSource;
        DataSetSmet: TpFIBDataSet;
        StoredProcSmet: TpFIBStoredProc;
        SelectTypePostID_TYPE_POST: TFIBIntegerField;
        SelectTypePostNAME_TYPE_POST: TFIBStringField;
        cxDateBegEdit: TcxDateEdit;
        cxDateEndEdit: TcxDateEdit;
        LblDateBegEdit: TcxLabel;
        LblDateEndEdit: TcxLabel;
        cxDateBegObrEdit: TcxDateEdit;
        cxDateEndObrEdit: TcxDateEdit;
        LblDateBegObrEdit: TcxLabel;
        LblDateEndObrEdit: TcxLabel;
        Absent: TqFSpravControl;
        ReadTransaction: TpFIBTransaction;
        DSetSmet: TpFIBDataSet;
        PostSalarySelect: TpFIBDataSet;
        PostSalarySelectID_POST_SALARY: TFIBBCDField;
        PostSalarySelectID_POST_SALARY_I: TFIBIntegerField;
        PostSalarySelectPOST_NAME: TFIBStringField;
        PostSalarySelectSALARY_MIN: TFIBFloatField;
        PostSalarySelectNUM_DIGIT: TFIBIntegerField;
        PostSalarySelectDISPLAY_NAME: TFIBStringField;
        PostSalarySelectNAME_TYPE_POST: TFIBStringField;
        PostSalarySelectSALARY_MAX: TFIBFloatField;
        PostSalarySelectADD_NAME: TFIBStringField;
        PostSalarySelectSMETA_FULL_TITLE: TFIBStringField;
        Panel_Top: TPanel;
        Panel_Bottom: TPanel;
        IdShrPanel: TPanel;
        ItemsGrid: TcxGrid;
        PeopleView: TcxGridDBTableView;
        PeopleViewDBColumn3: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
        Panel7: TPanel;
        AddIdShr: TcxButton;
        DelIdShR: TcxButton;
        cxLabel1: TcxLabel;
        IdShr: TcxCurrencyEdit;
        ShowButton: TcxButton;
        FindIdShR: TcxButton;
        ShRDataSource: TDataSource;
        ActionList1: TActionList;
        Act_Find_Id_ShR: TAction;
        InsertShR: TpFIBStoredProc;
        SmetShR: TpFIBDataSet;
        DSetIdShR: TpFIBDataSet;
        AcceptSet: TpFIBDataSet;
        TSWorkMode: TcxTabSheet;
        WorkModeGrid: TcxGrid;
        WorkModeGridTableView: TcxGridTableView;
        WorkModeGridTableViewColumn1: TcxGridColumn;
        WorkModeGridTableViewColumn2: TcxGridColumn;
        WorkModeGridTableViewColumn3: TcxGridColumn;
        WorkModeGridTableViewColumn4: TcxGridColumn;
        WorkModeGridTableViewColumn5: TcxGridColumn;
        WorkModeGridTableViewColumn6: TcxGridColumn;
        WorkModeGridTableViewColumn7: TcxGridColumn;
        WorkModeGridTableViewColumn8: TcxGridColumn;
        WorkModeGridTableView1: TcxGridTableView;
        WorkModeGridTableView1Column8: TcxGridColumn;
        WorkModeGridTableView1Column1: TcxGridColumn;
        WorkModeGridTableView1Column2: TcxGridColumn;
        WorkModeGridTableView1Column3: TcxGridColumn;
        WorkModeGridTableView1Column4: TcxGridColumn;
        WorkModeGridTableView1Column5: TcxGridColumn;
        WorkModeGridTableView1Column6: TcxGridColumn;
        WorkModeGridTableView1Column7: TcxGridColumn;
        WorkModeGridLevel: TcxGridLevel;
        lblWorkMode: TLabel;
        ShiftEdit: TcxSpinEdit;
        lblShift: TLabel;
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
        WMByPeriodSet: TpFIBDataSet;
        WorkModeSprav: TcxButtonEdit;
        GetWorkMode: TpFIBDataSet;
        PostSalarySelectId_Work_Mode: TIntegerField;
        PostSalarySelectWork_Mode_Shift: TIntegerField;
        PostSalarySelectSalary_Max_Str: TStringField;
        btnEditBonusSmet: TdxBarLargeButton;
        EditBonusSmet: TAction;
        ActAdd: TAction;
        ActDel: TAction;
        UpdBonusSmet: TpFIBStoredProc;
    lblMonth: TcxLabel;
    cntHours: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    cntMonth: TcxTextEdit;
    SelectTypePostIS_PED_WORK: TSmallintField;
    trShr: TpFIBTransaction;
    IdShrSelect: TpFIBDataSet;
    BotomPanel: TPanel;
    lblHours: TcxLabel;
    dbHours: TcxDBCurrencyEdit;
    PeopleViewDBColumn2: TcxGridDBColumn;
    RateCount: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    PeopleViewDBColumn1: TcxGridDBColumn;
        Procedure FormShow(Sender: TObject);
        Procedure btnCancelClick(Sender: TObject);
        Procedure btnOkClick(Sender: TObject);
        Procedure DepartmentEditOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure PosadOkladEditOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure DateBegEditChange(Sender: TObject);
        Procedure PosadOkladEditChange(Sender: TObject);
        Procedure WorkReasonEditOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure PersonalTypeEditOpenSprav(Sender: TObject;
            Var Value: Variant; Var DisplayText: String);
        Procedure CondEditOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure PayFormEditOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure FactOkladEditOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure WorkCondEditOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure HospitalEditOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure WorkReasonEditChange(Sender: TObject);
        Procedure DateEndEditChange(Sender: TObject);
        Procedure HolidayEditChange(Sender: TObject);
        Procedure HospitalEditChange(Sender: TObject);
        Procedure DepartmentEditChange(Sender: TObject);
        Procedure FactOkladEditChange(Sender: TObject);
        Procedure PersonalTypeEditChange(Sender: TObject);
        Procedure WorkCondEditChange(Sender: TObject);
        Procedure PayFormEditChange(Sender: TObject);
        Procedure ReasonEditChange(Sender: TObject);
        Procedure NoteEditChange(Sender: TObject);
        Procedure CondEditChange(Sender: TObject);
        Procedure DateBegObrEditChange(Sender: TObject);
        Procedure DateEndObrEditChange(Sender: TObject);
        Procedure PayEditChange(Sender: TObject);
        Procedure cbIsMainPostChange(Sender: TObject);
        Procedure cbBackChange(Sender: TObject);
        Procedure cbNoDateEndChange(Sender: TObject);
        Procedure btnEditClick(Sender: TObject);
        Procedure cxGridDBBandedTableView2KeyDown(Sender: TObject;
            Var Key: Word; Shift: TShiftState);
        Procedure cxGridDBBandedTableView4KeyDown(Sender: TObject;
            Var Key: Word; Shift: TShiftState);
        Procedure AbsentChange(Sender: TObject);
        Procedure AbsentOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure AddIdShrClick(Sender: TObject);
        Procedure DelIdShRClick(Sender: TObject);
        Procedure ShowButtonClick(Sender: TObject);
        Procedure Act_Find_Id_ShRExecute(Sender: TObject);
        Procedure cxDateBegEditPropertiesChange(Sender: TObject);
        Procedure ShiftEditPropertiesChange(Sender: TObject);
        Procedure cxDateEndEditPropertiesChange(Sender: TObject);
        Procedure WorkModeSpravPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        Procedure EditBonusSmetExecute(Sender: TObject);
        Procedure cxTabSheet3Show(Sender: TObject);
        Procedure cxTabSheet2Show(Sender: TObject);
        Procedure ActAddExecute(Sender: TObject);
        Procedure ActDelExecute(Sender: TObject);
    procedure cntMonthKeyPress(Sender: TObject; var Key: Char);
    procedure cxPageControl1Change(Sender: TObject);
    procedure cntHoursKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RateCountKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    private
        IdOrderType: Integer;
        Function CheckVacById_Us: Boolean;
    public
        id_order_item: int64;
        id_session: int64;
        MassEdit: boolean;
        isContinue, isWorkModeEdit: boolean;
        isTemp, IsEditSmet, IsPedType: boolean;
        isDepartmentEdit: Boolean;
        isChangeTeachingLoad : Boolean;
        Id_Type_Away: integer;
        Id_PCard_Away, man_m, IdPcard, MaxCntMonth: integer;
        rc1, rc2: Real;
        Date_B, Date_E: TDAte;
        check_date_beg, check_date_end: tdate;
        IsOnlyOpenSpr: Boolean;
        IdWorkMode: Variant;
        MaxBound: Integer;
        AbsentDateBeg, AbsentDateEnd: TDate;
        Constructor Create(AOwner: Tcomponent; IdType: Integer);
        Procedure SelectNad;
        Procedure SelectSmet;
        Procedure AddBonus;
        Procedure DelBonus;
        Function CheckShR: Boolean;
        Procedure FindOnIdShr(Flag: Boolean);
        Procedure SaveDataOnIdShr;
        Function IsShowTabSheet(OrderType: Variant): Boolean;
    End;

Var
    frmAddMoving: TfrmAddMoving;

Implementation
Uses uMove, qfTools, uSelectForm, uMoveAddSmet, uMoveBonusEdit, BaseTypes, uMoveAbsent;
{$R *.dfm}

{function ifthen2(condition : boolean;valTrue : Variant; valFalse : Variant) : Variant;
begin
  if condition then Result := valTrue else Result := valFalse;
end;}

{ TfrmAddMoving }

Constructor TfrmAddMoving.Create(AOwner: Tcomponent; IdType: Integer);
Begin
    Inherited Create(AOwner);
    IdOrderType := IdType;
    IdWorkMode := null;
    IsPedType := false;

    if TfrmMoveOrder(owner).Mode = 2 then  btnOk.Enabled := false;
End;

Procedure TfrmAddMoving.SelectNad;
Begin
    DataSetNad.Close;
    DataSetNad.ParamByName('ID_SESSION').AsInt64 := id_session;
    If MassEdit Then
        DataSetNad.ParamByName('ID_ORDER_ITEM').AsVariant := Null
    Else
        DataSetNad.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;

    DataSetNad.Open;
    cxGridDBBandedTableView4.ViewData.Expand(true);
End;

Procedure TfrmAddMoving.FormShow(Sender: TObject);
Var
    i: Integer;
Begin
    If PosadOkladEdit.Enabled Then
        PosadOkladEdit.Blocked := VarIsNull(cxDateBegEdit.Date) Or VarIsNull(DepartmentEdit.Value);
    If FactOkladEdit.Enabled Then
        FactOkladEdit.Blocked := VarIsNull(cxDateBegEdit.Date) Or VarIsNull(DepartmentEdit.Value);
    If PersonalTypeEdit.Enabled Then
        PersonalTypeEdit.Blocked := VarIsNull(PosadOkladEdit.Value);

    check_date_beg := cxDateBegEdit.Date;
    check_date_end := cxDateEndEdit.Date;

    If IsShowTabSheet(IdOrderType) = False Then
        TSWorkMode.TabVisible := False;

    If isContinue  Then
    Begin
        DepartmentEdit.Blocked := true;
        PosadOkladEdit.Blocked := true;
        FactOkladEdit.Blocked := true;
        PersonalTypeEdit.Blocked := true;

        IdShr.Enabled := false;
        RateCount.Enabled := false;
        cntHours.Enabled := false;
        cntMonth.Enabled := false;
        ShowButton.Visible := false;
        FindIdShR.Visible := false;
        AddIdShr.Visible := false;
        DelIdShR.Visible := false;
        cbIsMainPost.Blocked := true;
        //cbBack.Blocked := true;
    End;

    if isChangeTeachingLoad then
        cntMonth.Enabled := true;

    If isWorkModeEdit Then
    Begin
        cxTabSheet2.TabVisible := False;
        cxTabSheet3.TabVisible := False;
    End;

    If IsEditSmet Then
    Begin
        WorkModeSprav.Enabled := False;
        ShiftEdit.Enabled := False;
    End;

    If isDepartmentEdit Then
    Begin
        DepartmentEdit.Blocked := false;
        DepartmentEdit.Enabled := true;
        cbNoDateEnd.Enabled := False;
        cxDateEndEdit.Enabled := False;
        btnAdd.Enabled := False;
        btnDelete.Enabled := False;
        btnEdit.Enabled := False;
        btnEditBonusSmet.Enabled := False;
        WorkModeSprav.Enabled := False;
        ShiftEdit.Enabled := False;
    End;
    {* DSetIdShR.Close;
     DSetIdShR.SelectSQL.Text := 'SELECT * FROM UP_DT_ID_SH_R_BUFF_MOV_SEL(:key_session ,1, null, :Id_Order_Item)';
     DSetIdShR.ParamByName('key_session').AsInt64 := id_session;
     if MassEdit then
         DataSetSmet.ParamByName('ID_ORDER_ITEM').AsVariant := Null
     else
         DataSetSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
     DSetIdShR.Open;
     DSetIdShR.FetchAll;
     *}



    DSetIdShR.Close;
    DSetIdShR.SelectSQL.Text := 'SELECT DISTINCT * FROM Up_Accept_Sh_R_Tmp WHERE KEY_SESSION=:KEY_SESSION';
    DSetIdShR.ParamByName('key_session').AsInt64 := id_session;
    DSetIdShR.Open;
    DSetIdShR.FetchAll;

    If DSetIdShR.RecordCount > 0 Then
    Begin
        DepartmentEdit.Blocked := true;
        PosadOkladEdit.Blocked := true;
        PersonalTypeEdit.Blocked := true;
    End;

    SelectNad;
    SelectSmet;
    For i := 0 To WorkModeGridTableView1.ColumnCount - 1 Do
    Begin
        WorkModeGridTableView1.Columns[i].DataBinding.ValueTypeClass := TcxStringValueType;
    End;
    FillWorkModeDSet(WMByPeriodSet, cxDateBegEdit.Date, cxDateEndEdit.Date, IdWorkMode, Null, Null, ShiftEdit.Value, 7);
    FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
    IsOnlyOpenSpr := False;
End;

Function TfrmAddMoving.IsShowTabSheet(OrderType: Variant): Boolean;
Var
    check: Integer;
Begin
    Result := True;
    If VarIsNull(OrderType) Then
        Exit;
    check := fibCheckPermission('/ROOT/Up_order_system/Up_order_types/' + IntToStr(OrderType) +
        '_UP_ORDER_TYPE/' + IntToStr(OrderType) + '_WORKMODE_TAB', 'Edit');
    If check <> 0 Then
        Result := False;
End;

Procedure TfrmAddMoving.btnCancelClick(Sender: TObject);
Begin
    Close;
End;

Procedure TfrmAddMoving.btnOkClick(Sender: TObject);
Var
    i: Integer;
Begin
    If Not qFCheckAll(Self) Then
        exit;

    if (IsPedType) then
    begin
       if (cntMonth.Text = '') then
       begin
          agMessageDlg('Увага!', 'Треба ввести кількість місяців!', mtInformation, [mbOK]);
          Exit;
       end
       else if (MaxCntMonth < StrToInt(cntMonth.Text)) then
            begin
               cntMonth.SetFocus;
               cntMonth.Style.Color := clRed;
               agMessageDlg('Увага!', 'Кількість місяців не може перевищувати ('+IntToStr(MaxCntMonth)+'!', mtInformation, [mbOK]);
               Exit;
            end;
    end;

    If Not VarIsNull(Absent.Value) Then
    Begin
        If (cxDateBegEdit.Date < AbsentDateBeg) Or
            (cxDateBegEdit.Date > AbsentDateEnd) Or
            (cxDateEndEdit.Date < AbsentDateBeg) Or
            (cxDateEndEdit.Date > AbsentDateEnd) Then
        Begin
            cxDateBegEdit.Style.Color := clRed;
            cxDateEndEdit.Style.Color := clRed;
            agMessageDlg('Увага!', 'Період переведення повинен належати періоду відсутності працівника!', mtInformation, [mbOK]);
            Exit;
        End;
    End;

    If IsEditSmet Then
    Begin
        If rc1 <> rc2 Then
        Begin
            showmessage('Кількість ставок повинна співпадати з тією кількістю ставок, що була до переводу');
            exit;
        End;
    End;


    // проверка на заполнение даты
    If Trim(cxDateBegEdit.Text) = '' Then
    Begin
        agMessageDlg('Увага!', 'Введіть дату початку!', mtError, [mbOk]);
        cxDateBegEdit.SetFocus;
        cxDateBegEdit.Style.Color := clRed;
        Exit;
    End;

    // проверка на заполнение даты
    If Trim(cxDateEndEdit.Text) = '' Then
    Begin
        agMessageDlg('Увага!', 'Введіть дату кінця!', mtError, [mbOk]);
        cxDateEndEdit.SetFocus;
        cxDateEndEdit.Style.Color := clRed;
        Exit;
    End;

    // проверка на корректность даты
    If cxDateBegEdit.Date > cxDateEndEdit.Date Then
    Begin
        agMessageDlg('Увага!', 'Дата кінця повинна бути більше дати початку!', mtError, [mbOk]);
        cxDateBegEdit.SetFocus;
        cxDateBegEdit.Style.Color := clRed;
        cxDateEndEdit.Style.Color := clRed;
        Exit;
    End;

    // проверка на корректность даты избрания
    If ((Trim(cxDateBegObrEdit.Text) <> '') And
        (Trim(cxDateEndObrEdit.Text) <> '') And
        (cxDateBegObrEdit.Date > cxDateEndObrEdit.Date))
        Then
    Begin
        agMessageDlg('Увага!', 'Дата кінця обрання повинна бути більше дати початку!', mtError, [mbOk]);
        cxDateBegObrEdit.SetFocus;
        cxDateBegObrEdit.Style.Color := clRed;
        cxDateEndObrEdit.Style.Color := clRed;
        Exit;
    End;
 try
    StoredProc.StoredProcName := 'UP_DT_MAN_MOVING_BUFF_MAS_UPD';
    StoredProc.Prepare;

    If Trim(cxDateBegEdit.Text) = '' Then
        StoredProc.ParamByName('date_beg').AsVariant := Null
    Else
        StoredProc.ParamByName('date_beg').asDate := cxDateBegEdit.Date;

    If Trim(cxDateEndEdit.Text) = '' Then
        StoredProc.ParamByName('date_end').AsVariant := Null
    Else
        StoredProc.ParamByName('date_end').AsDate := cxDateEndEdit.Date;

    StoredProc.ParamByName('id_pcard').AsVariant := Null;
    StoredProc.ParamByName('id_department').AsVariant := DepartmentEdit.Value;
    If PayEdit.LabelColor = SYS_MASS_COLOR Then
        StoredProc.ParamByName('is_tarif').AsVariant := Null
    Else
        StoredProc.ParamByName('is_tarif').AsInteger := PayEdit.Value;

    StoredProc.ParamByName('id_post_salary_real').AsVariant := FactOkladEdit.Value;
    StoredProc.ParamByName('id_post_salary').AsVariant := PosadOkladEdit.Value;
    StoredProc.ParamByName('id_type_post').AsVariant := PersonalTypeEdit.Value;
    If cbIsMainPost.LabelColor = SYS_MASS_COLOR Then
        StoredProc.ParamByName('is_post_main').AsVariant := Null
    Else
        StoredProc.ParamByName('is_post_main').AsInteger := round(sqr(cbIsMainPost.Value));
    StoredProc.ParamByName('id_work_reason').AsVariant := WorkReasonEdit.Value;
    StoredProc.ParamByName('id_work_condition').AsVariant := WorkCondEdit.Value;
    StoredProc.ParamByName('id_pay_form').AsVariant := PayFormEdit.Value;
    StoredProc.ParamByName('id_man_hospital').AsVariant := Null; //HospitalEdit.Value;
    StoredProc.ParamByName('id_man_holiday').AsVariant := Null; //HolidayEdit.Value;
    StoredProc.ParamByName('key_session').AsInt64 := id_session;
    StoredProc.ParamByName('id_accept_cond').AsVariant := CondEdit.Value;
    If Trim(cxDateBegObrEdit.Text) = '' Then
        StoredProc.ParamByName('accept_beg').AsVariant := Null
    Else
        StoredProc.ParamByName('accept_beg').AsDate := cxDateBegObrEdit.Date;
    If Trim(cxDateEndObrEdit.Text) = '' Then
        StoredProc.ParamByName('accept_end').AsVariant := Null
    Else
        StoredProc.ParamByName('accept_end').AsDate := cxDateEndObrEdit.Date;
    StoredProc.ParamByName('note').AsVariant := NoteEdit.Value;
    StoredProc.ParamByName('num_item').AsVariant := Null;
    StoredProc.ParamByName('num_sub_item').AsVariant := Null;
    StoredProc.ParamByName('id_order').AsVariant := (owner As TfrmMoveOrder).Input['ID_ORDER'];
    StoredProc.ParamByName('id_order_type').AsVariant := (owner As TfrmMoveOrder).Input['ID_ORDER_TYPE'];
    StoredProc.ParamByName('reason').AsVariant := ReasonEdit.Value;
    StoredProc.ParamByName('id_man_moving').AsVariant := Null;
    { If cbBack.LabelColor = SYS_MASS_COLOR Then
         StoredProc.ParamByName('with_return').AsVariant := Null
     Else
         StoredProc.ParamByName('with_return').AsInteger := round(sqr(cbBack.Value));     }
    If isTemp Then
        StoredProc.ParamByName('with_return').AsInteger := 1;
    If isContinue Then
        StoredProc.ParamByName('with_return').AsVariant := Null;
    If IsEditSmet Then
        StoredProc.ParamByName('with_return').AsVariant := 1;
    If MassEdit Then
        StoredProc.ParamByName('id_order_item').AsVariant := Null
    Else
        StoredProc.ParamByName('id_order_item').AsInt64 := id_order_item;

    If Absent.DisplayText = '' Then
        Id_Type_Away := -1;

    If Id_Type_Away = -1 Then
    Begin
        StoredProc.ParamByName('Id_Type_Away').AsVariant := Null;
    End
    Else
    Begin
        StoredProc.ParamByName('Id_Type_Away').AsInteger := Id_Type_Away;
    End;

    If Absent.DisplayText = '' Then
        Id_Pcard_Away := -1;
    If Id_Pcard_Away = -1 Then
        StoredProc.ParamByName('Id_Pcard_Away').AsVariant := Null
    Else
        StoredProc.ParamByName('Id_Pcard_Away').AsInt64 := Id_Pcard_Away;

    If VarIsNull(Absent.Value) Then
        StoredProc.ParamByName('Id_Key').AsVariant := Null
    Else
        StoredProc.ParamByName('Id_Key').AsInt64 := Absent.Value;

    If VarIsNull(IdWorkMode) Then
        StoredProc.ParamByName('Id_Work_Mode').AsVariant := Null
    Else
        StoredProc.ParamByName('Id_Work_Mode').AsInteger := IdWorkMode;

    StoredProc.ParamByName('Work_Mode_Shift').AsInteger := ShiftEdit.Value;
    if not IsPedType then cntMonth.Text := '';
    if cntMonth.Text = '' then StoredProc.ParamByName('month_hours_count').Value := null
    else StoredProc.ParamByName('month_hours_count').AsShort := StrToInt(cntMonth.Text);


    { if cbHosp.LabelColor = SYS_MASS_COLOR then
       StoredProc.ParamByName('is_on_hospital').AsVariant := Null
                                           else
       StoredProc.ParamByName('is_on_hospital').AsInteger := round(sqr(cbHosp.Value));
     if cbHoliday.LabelColor = SYS_MASS_COLOR then
       StoredProc.ParamByName('is_on_holiday').AsVariant := Null
                                              else
       StoredProc.ParamByName('is_on_holiday').AsInteger := round(sqr(cbHoliday.Value));}
    StoredProc.ExecProc;
 except on E:Exception do
    Showmessage(E.Message);
 end;
    ModalResult := mrOk;
End;

Procedure TfrmAddMoving.DepartmentEditOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    sp: TSprav;
    OldValue: integer;
Begin
    If (Not VarIsNull(DepartmentEdit.Value))
        Then
        OldValue := DepartmentEdit.Value
    Else
        OldValue := -1;
    sp := GetSprav('SpDepartment');
    If sp <> Nil Then
    Begin
        With sp.Input Do
        Begin
            Append;
            FieldValues['DBHandle'] := Integer(Database.Handle);
            FieldValues['Actual_Date'] := Date();
            FieldValues['AllowEdit'] := False;
            Post;
        End;
        sp.Show;
        If (sp.Output <> Nil) And Not sp.Output.IsEmpty Then
        Begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];

            If (Value <> OldValue)
                Then
            Begin
                PosadOkladEdit.Clear;
                PosadOkladEdit.LabelColor := SYS_MASS_NORM_COLOR;
                FactOkladEdit.Clear;
                FactOkladEdit.LabelColor := SYS_MASS_NORM_COLOR;
                PersonalTypeEdit.Clear;
                PersonalTypeEdit.LabelColor := SYS_MASS_NORM_COLOR;
            End;
        End;
        sp.Free;
    End;
End;

Procedure TfrmAddMoving.PosadOkladEditOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Res: Variant;
Begin
    If VarIsNull(DepartmentEdit.Value) Then
    Begin
        MessageDlg('Спочатку треба обрати підрозділ!', mtError, [mbYes], -1);
        Exit;
    End;

    PostSalarySelect.Close;
    PostSalarySelect.ParamByName('Id_Department').AsInteger := DepartmentEdit.Value;
    PostSalarySelect.ParamByName('Act_Date').AsDate := cxDateBegEdit.Date;
    PostSalarySelect.Open;

    If qSelect(PostSalarySelect) Then
    Begin
        Value := PostSalarySelect['id_post_salary'];
        DisplayText := PostSalarySelect['Post_name'];

        FactOkladEdit.value := Value;
        FactOkladEdit.DisplayText := DisplayText;

        IdWorkMode := PostSalarySelect['Id_Work_Mode'];
        ShiftEdit.Value := 0;

        FillWorkModeDSet(WMByPeriodSet, cxDateBegEdit.Date, cxDateEndEdit.Date, IdWorkMode, Null, Null, ShiftEdit.Value, 7);
        FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
        Res := GetWorkModeInfo(GetWorkMode, IdWorkMode);
        If VarIsArray(Res) Then
        Begin
            WorkModeSprav.Text := Res[0];
            MaxBound := Res[1];
        End;

        // попробуем автоматически проставить тип персонала
        SelectTypePost.Close;
        SelectTypePost.ParamByName('Id_Post_Salary').AsInteger := PosadOkladEdit.Value;
        SelectTypePost.ParamByName('Id_Department').AsInteger := DepartmentEdit.Value;
        SelectTypePost.ParamByName('Act_Date').AsDate := cxDateBegEdit.Date;
        SelectTypePost.Open;

        SelectTypePost.FetchAll;
        If SelectTypePost.RecordCount = 1 Then
        Begin
            PersonalTypeEdit.Value := SelectTypePost['Id_Type_Post'];
            PersonalTypeEdit.DisplayText := SelectTypePost['Name_Type_Post'];
            if (not VarIsNull(SelectTypePost['IS_PED_WORK']))  then
            begin
               cntMonth.Visible := (SelectTypePost['IS_PED_WORK'] = 1);
            end
            else
            begin
               cntMonth.Visible := false;
            end;
            lblMonth.Visible := cntMonth.Visible;
            IsPedType := cntMonth.Visible;
            //            qFSC_TypePost.Blocked := True;
        End
            //        else
            //            qFSC_TypePost.Blocked := False;
    End;
End;

Procedure TfrmAddMoving.DateBegEditChange(Sender: TObject);
Begin
    If Not isContinue Then
    Begin
        PosadOkladEdit.Blocked := VarIsNull(cxDateBegEdit.Date) Or VarIsNull(DepartmentEdit.Value);
        FactOkladEdit.Blocked := VarIsNull(cxDateBegEdit.Date) Or VarIsNull(DepartmentEdit.Value);
    End;

    LblDateBegEdit.Style.Font.Color := SYS_MASS_NORM_COLOR;
    cxDateBegObrEdit.Date := cxDateBegEdit.Date;
End;

Procedure TfrmAddMoving.PosadOkladEditChange(Sender: TObject);
Begin
    PersonalTypeEdit.Blocked := VarIsNull(PosadOkladEdit.Value);
    PosadOkladEdit.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.WorkReasonEditOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Params.FormCaption := 'Довідник підстав роботи';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_WORK_REASON_ACC_SELECT';
    Params.Fields := 'NAME_FULL,NAME_SHORT,ID_WORK_REASON';
    Params.FieldsName := 'Назва підстави,скорочено';
    Params.KeyField := 'ID_WORK_REASON';
    Params.ReturnFields := 'NAME_FULL,ID_WORK_REASON';
    Params.DBHandle := Integer(Database.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut) Then
    Begin
        value := output['ID_WORK_REASON'];
        DisplayText := VarToStr(output['NAME_FULL']);
    End;
    If Value <> 1 Then
        cbIsMainPost.Value := False;
End;

Procedure TfrmAddMoving.PersonalTypeEditOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Begin
    If VarIsNull(DepartmentEdit.Value) Then
    Begin
        MessageDlg('Спочатку треба обрати посаду!', mtError, [mbYes], -1);
        Exit;
    End;

    SelectTypePost.Close;
    SelectTypePost.ParamByName('Id_Post_Salary').AsInteger := PosadOkladEdit.Value;
    SelectTypePost.ParamByName('Id_Department').AsInteger := DepartmentEdit.Value;
    SelectTypePost.ParamByName('Act_Date').AsDate := cxDateBegEdit.Date;
    SelectTypePost.Open;

    If qSelect(SelectTypePost) Then
    Begin
        value := SelectTypePost['Id_Type_Post'];
        DisplayText := SelectTypePost['Name_Type_Post'];
        if (not VarIsNull(SelectTypePost['IS_PED_WORK']))  then
        begin
            cntMonth.Visible := (SelectTypePost['IS_PED_WORK'] = 1);
        end
        else
        begin
            cntMonth.Visible := false;
        end;
        lblMonth.Visible := cntMonth.Visible;
        IsPedType := cntMonth.Visible;
    End;
End;

Procedure TfrmAddMoving.CondEditOpenSprav(Sender: TObject;
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
    Params.DBHandle := Integer(Database.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        value := output['ID_ACCEPT_COND'];
        DisplayText := VarToStr(output['NAME_ACCEPT_COND']);
        AcceptSet.Close;
        AcceptSet.SQLs.SelectSQL.Text := 'select date_end, kol_month' +
            ' from asup_accept_calc_dates(:id_accept_cond,:date_beg)';
        AcceptSet.ParamByName('id_accept_cond').AsInteger := value;
        AcceptSet.ParamByName('date_beg').AsDate := cxDateBegEdit.Date;
        AcceptSet.Open;
        If (AcceptSet['kol_month'] <> 0) Then
        Begin
            cxDateBegObrEdit.Date := cxDateBegEdit.Date;
            cxDateEndObrEdit.Date := AcceptSet['date_end'];
        End
        Else
        Begin
            cxDateBegObrEdit.EditValue := null;
            cxDateEndObrEdit.EditValue := null;
        End;
    End;
End;

Procedure TfrmAddMoving.PayFormEditOpenSprav(Sender: TObject;
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
    Params.DBHandle := Integer(Database.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        value := output['ID_PAY_FORM'];
        DisplayText := VarToStr(output['NAME_PAY_FORM']);
    End;
End;

Procedure TfrmAddMoving.FactOkladEditOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    If VarIsNull(PosadOkladEdit.Value) Then
    Begin
        MessageDlg('Спочатку треба обрати штатну посаду!', mtError, [mbYes], -1);
        Exit;
    End;

    Params.FormCaption := 'Посадові оклади';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_ACCEPT_GET_POST_REAL_2(' + IntToStr(FactOkladEdit.Value) + ',' + QuotedStr(DateToStr(cxDateBegEdit.Date)) + ')';
    Params.Fields := 'POST_NAME,NUM_DIGIT,SALARY_MIN,SALARY_MAX,ID_POST_SALARY';
    Params.FieldsName := 'Назва посади, Р-д, від, до';
    Params.KeyField := 'ID_POST_SALARY';
    Params.ReturnFields := 'POST_NAME,ID_POST_SALARY';
    Params.DBHandle := Integer(Database.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        value := output['ID_POST_SALARY'];
        DisplayText := VarToStr(output['POST_NAME']);
    End;
End;

Procedure TfrmAddMoving.WorkCondEditOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Params.FormCaption := 'Умови праці';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'INI_WORK_COND';
    Params.Fields := 'NAME_WORK_COND,ID_WORK_COND';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_WORK_COND';
    Params.ReturnFields := 'NAME_WORK_COND,ID_WORK_COND';
    Params.DBHandle := Integer(Database.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        value := output['ID_WORK_COND'];
        DisplayText := VarToStr(output['NAME_WORK_COND']);
    End;
End;

Procedure TfrmAddMoving.HospitalEditOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
{var
    sp: TSprav; }
Begin
    {sp := GetSprav('Asup\AsupHospital');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(Database.Handle);
            FieldValues['Select'] := 1;
            Post;
        end;
                // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Man_Hosp'];
            DisplayText := sp.Output['DisplayText'];
            cxDateBegEdit.Date := sp.Output['Date_Beg'];
            LblDateBegEdit.Style.Font.Color := SYS_MASS_NORM_COLOR;
            if sp.Output['Ending'] <> 2 then
                cxDateBegEdit.Date := sp.Output['Date_End']
            else
            begin
                cxDateBegEdit.Text := Inf_Date_End;
                cbNoDateEnd.Value := True;
            end
        end;
        sp.Free;
    end; }
End;

Procedure TfrmAddMoving.WorkReasonEditChange(Sender: TObject);
Begin
    WorkReasonSelect.Close;
    WorkReasonSelect.Open;
    WorkReasonSelect.Locate('ID_WORK_REASON', WorkReasonEdit.Value, []);

    If WorkReasonSelect['IS_SHTAT'] = 'T' Then
        cbIsMainPost.Value := True
    Else
        cbIsMainPost.Value := False;


    If WorkReasonSelect['FIX_MAIN_POST'] = 'T' Then
        cbIsMainPost.Blocked := True
    Else
        cbIsMainPost.Blocked := False;

    WorkReasonSelect.Close;
    WorkReasonEdit.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.DateEndEditChange(Sender: TObject);
Begin
    LblDateEndEdit.Style.Font.Color := SYS_MASS_NORM_COLOR;
    cxDateEndObrEdit.Date := cxDateEndEdit.Date;
End;

Procedure TfrmAddMoving.HolidayEditChange(Sender: TObject);
Begin
    //HolidayEdit.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.HospitalEditChange(Sender: TObject);
Begin
    //HospitalEdit.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.DepartmentEditChange(Sender: TObject);
Begin
    If isDepartmentEdit Then
        DepartmentEdit.LabelColor := SYS_MASS_NORM_COLOR
    Else
    Begin
        PosadOkladEdit.Blocked := VarIsNull(cxDateBegEdit.Date) Or VarIsNull(DepartmentEdit.Value);
        FactOkladEdit.Blocked := VarIsNull(cxDateBegEdit.Date) Or VarIsNull(DepartmentEdit.Value);
        DepartmentEdit.LabelColor := SYS_MASS_NORM_COLOR;
    End;
End;

Procedure TfrmAddMoving.FactOkladEditChange(Sender: TObject);
Begin
    FactOkladEdit.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.PersonalTypeEditChange(Sender: TObject);
Begin
    PersonalTypeEdit.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.WorkCondEditChange(Sender: TObject);
Begin
    WorkCondEdit.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.PayFormEditChange(Sender: TObject);
Begin
    PayFormEdit.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.ReasonEditChange(Sender: TObject);
Begin
    ReasonEdit.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.NoteEditChange(Sender: TObject);
Begin
    NoteEdit.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.CondEditChange(Sender: TObject);
Begin
    CondEdit.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.DateBegObrEditChange(Sender: TObject);
Begin
    LblDateBegObrEdit.Style.Font.Color := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.DateEndObrEditChange(Sender: TObject);
Begin
    LblDateEndObrEdit.Style.Font.Color := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.PayEditChange(Sender: TObject);
Begin
    PayEdit.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.cbIsMainPostChange(Sender: TObject);
Begin
    cbIsMainPost.LabelColor := SYS_MASS_NORM_COLOR;
End;

Procedure TfrmAddMoving.cbBackChange(Sender: TObject);
Begin
    { cbBack.LabelColor := SYS_MASS_NORM_COLOR; }
End;

Procedure TfrmAddMoving.cbNoDateEndChange(Sender: TObject);
Begin
    cbNoDateEnd.LabelColor := SYS_MASS_NORM_COLOR;
    If cbNoDateEnd.Value = True Then
    Begin
        cxDateEndEdit.Date := EncodeDate(9999, 12, 31);
        cxDateEndEdit.Enabled := false;
        //cbBack.Value := false;
        //cbBack.Blocked := true;
        cxDateEndEdit.Visible := False;
        LblDateEndEdit.Visible := False;
    End
    Else
    Begin
        //cbBack.Blocked := false;
        cxDateEndEdit.Enabled := True;
        cxDateEndEdit.Visible := True;
        LblDateEndEdit.Visible := True;
    End;
End;

Procedure TfrmAddMoving.SelectSmet;
Begin
  try
    DataSetSmet.Close;
    DataSetSmet.ParamByName('ID_SESSION').AsInt64 := id_session;
    If MassEdit Then
        DataSetSmet.ParamByName('ID_ORDER_ITEM').AsVariant := Null
    Else
        DataSetSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;

    DataSetSmet.Open;

    {* StoredProcSmet.Close;
     StoredProcSmet.StoredProcName := 'UP_DT_ID_SH_R_BUFF_MOV_SEL';
     StoredProcSmet.ParamByName('KEY_SESSION').AsInt64 := id_session;
     StoredProcSmet.ParamByName('IS_NEW').AsInt64 := 1;
     StoredProcSmet.ParamByName('ID_MAN_MOVING').AsVariant := Null;
     //перекладываем данные о идентификаторах ШР во временную таблицу
     if MassEdit then
         StoredProcSmet.ParamByName('ID_ORDER_ITEM').AsVariant := Null
     else
         StoredProcSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
     StoredProcSmet.ExecProc;
     StoredProcSmet.Close;
    *}
   {*  DSetIdShR.SelectSQL.Text := 'SELECT * FROM UP_DT_ID_SH_R_BUFF_MOV_SEL(:key_session ,1, null, :Id_Order_Item)';
     DSetIdShR.ParamByName('key_session').AsInt64 := id_session;
     if MassEdit then
         DataSetSmet.ParamByName('ID_ORDER_ITEM').AsVariant := Null
     else
         DataSetSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
    *}
    except on E:Exception
           do begin
                 ShowMessage(E.Message);
           end;
    end;
End;

Procedure TfrmAddMoving.btnEditClick(Sender: TObject);
Var
    frm: TfrmAddSmet;
    id_rec: int64;
Begin
    frm := TfrmAddSmet.Create(Self);
    frm.Caption := 'Змінити ' + frm.Caption;
    frm.Smet.Value := DataSetSmet['ID_SMET'];
    frm.Smet.DisplayText := DataSetSmet['SMETA_NAME'];
    frm.PPSSmet.Value := DataSetSmet['ID_SMET_PPS'];
    frm.PPSSmet.DisplayText := DataSetSmet['SMETA_PPS_NAME'];
    frm.PPSVal.Value := DataSetSmet['KOEFF_PPS'];
    frm.RateCount.Value := DataSetSmet['RATE_COUNT'];
    id_rec := TFIBBCDField(DataSetSmet.FBN('ID_REC')).AsInt64;

    If frm.ShowModal = mrOk Then
    Begin
        //Удаляем
        StoredProcSmet.Close;
        StoredProcSmet.StoredProcName := 'UP_DT_MAN_SMET_BUFF_MOV_DEL';
        StoredProcSmet.ParamByName('ID_REC').AsInt64 := DataSetSmet['ID_REC'];
        StoredProcSmet.ParamByName('ID_SMET').AsInt64 := DataSetSmet['ID_SMET'];
        StoredProcSmet.ParamByName('ID_SMET_PPS').Value := DataSetSmet['ID_SMET_PPS'];
        StoredProcSmet.ParamByName('KOEFF_PPS').Value := DataSetSmet['KOEFF_PPS'];
        StoredProcSmet.ParamByName('RATE_COUNT').Value := DataSetSmet['RATE_COUNT'];
        StoredProcSmet.ParamByName('KEY_SESSION').AsInt64 := id_session;
        StoredProcSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;

        StoredProcSmet.ExecProc;
        StoredProcSmet.Close;

        //Добавляем
        StoredProcSmet.Close;
        StoredProcSmet.StoredProcName := 'UP_DT_MAN_SMET_BUFF_MOV_INS';
        StoredProcSmet.ParamByName('ID_SMET').AsInt64 := frm.Smet.Value;
        StoredProcSmet.ParamByName('ID_SMET_PPS').Value := frm.PPSSmet.Value;
        StoredProcSmet.ParamByName('KOEFF_PPS').Value := frm.PPSVal.Value;
        StoredProcSmet.ParamByName('RATE_COUNT').Value := frm.RateCount.Value;
        StoredProcSmet.ParamByName('KEY_SESSION').AsInt64 := id_session;
        StoredProcSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
        StoredProcSmet.ParamByName('ID_SH_R').AsVariant := null; //добавлено без идентификатора ШР

        StoredProcSmet.ExecProc;
        StoredProcSmet.Close;
        SelectSmet;

    End;
    frm.Free;
End;

Procedure TfrmAddMoving.AddBonus;
Var
    frm: TfmMoveBonusEdit;
Begin
    frm := TfmMoveBonusEdit.Create(Self);
    frm.Caption := 'Додати ' + frm.Caption;
    frm.Smets.Database := Database;
    frm.Smets.Transaction := WriteTransaction;
    frm.RaiseDefaults.Database := Database;
    frm.RaiseDefaults.Transaction := WriteTransaction;
    frm.id_session := id_session;
    frm.mode := 1;

    If frm.ShowModal = mrOk Then
    Begin
        StoredProcSmet.Close;
        StoredProcSmet.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_MOV_INS';
        StoredProcSmet.ParamByName('KEY_SESSION').AsInt64 := id_session;
        StoredProcSmet.ParamByName('ID_RAISE').Value := frm.IdRaise.Value;
        StoredProcSmet.ParamByName('PERCENT').Value := frm.Percent.Value;
        StoredProcSmet.ParamByName('SUMMA').Value := frm.Summa.Value;
        StoredProcSmet.ParamByName('ID_ORDER_ITEM_IN').AsInt64 := id_order_item;
        StoredProcSmet.ParamByName('PERIOD_BEG').AsDate := frm.cxDateBeg.Date;
        StoredProcSmet.ParamByName('PERIOD_END').AsDate := frm.cxDateEnd.Date;
        StoredProcSmet.ParamByName('NOTE').Value := NoteEdit.Value;
        StoredProcSmet.ParamByName('REASON').Value := ReasonEdit.Value;
        StoredProcSmet.ParamByName('ID_SMET').Value := frm.Smeta.Value;
        StoredProcSmet.ParamByName('ID_SMET_PPS').Value := frm.Kod_Sm_Pps.Value;
        StoredProcSmet.ParamByName('ALL_PERIODS').Value := frm.All_Periods.Value;

        StoredProcSmet.ExecProc;
        StoredProcSmet.Close;
        SelectNad;
    End;
    frm.Free;
End;

Procedure TfrmAddMoving.DelBonus;
Begin
    StoredProcSmet.Close;
    StoredProcSmet.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_MOV_DEL';
    StoredProcSmet.ParamByName('ID_REC').AsInt64 := DataSetNad['ID_REC'];
    StoredProcSmet.ParamByName('KEY_SESSION').AsInt64 := id_session;
    StoredProcSmet.ParamByName('ID_ORDER_ITEM_IN').AsInt64 := id_order_item;

    StoredProcSmet.ExecProc;
    StoredProcSmet.Close;

    DataSetNad.CacheDelete;
End;

Procedure TfrmAddMoving.cxGridDBBandedTableView2KeyDown(Sender: TObject;
    Var Key: Word; Shift: TShiftState);
Begin
    If ((DataSetSmet.RecordCount > 0) And (Key = VK_F12)
        And (ssShift In Shift)) Then
        ShowInfo(DataSetSmet);
End;

Procedure TfrmAddMoving.cxGridDBBandedTableView4KeyDown(Sender: TObject;
    Var Key: Word; Shift: TShiftState);
Begin
    If ((DataSetNad.RecordCount > 0) And (Key = VK_F12)
        And (ssShift In Shift)) Then
        ShowInfo(DataSetNad);
End;

Procedure TfrmAddMoving.AbsentChange(Sender: TObject);
Begin
    Absent.LabelColor := SYS_MASS_NORM_COLOR;
    If {FormControl.Mode <> fmInfo} TfrmMoveOrder(owner).Mode <> 2 Then
    Begin
        If VarIsNull(Absent.Value) Then
        Begin
            //WorkReasonEdit.Blocked := False;
            WorkReasonEdit.AutoSaveToRegistry := True;
        End
        Else
        Begin
            WorkReasonEdit.AutoSaveToRegistry := False;
            //WorkReasonEdit.Blocked := True;
        End;
    End;

    If Absent.DisplayText = '' Then
    Begin
        //Id_Type_Away.Clear;
        //Id_PCard_Away.Clear;
        Id_Type_Away := -1;
        Id_PCard_Away := -1;

    End;
End;

Procedure TfrmAddMoving.AbsentOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Const
    INFINITY_DATE = '31.12.9999';
Var
    frm: TfmUpAbsentForm;
Begin
    frm := TfmUpAbsentForm.Create(Self);
    frm.IniAwayType.Database := Database;
    frm.IniAwayType.Transaction := ReadTransaction;
    frm.AwayInfo.Database := Database;
    frm.AwayInfo.Transaction := ReadTransaction;
    frm.ConstSet.Database := Database;
    frm.ConstSet.Transaction := ReadTransaction;

    //if TfrmMoveOrder(owner).Mode <> 1 then
    If Not VarIsNull(Absent.Value) Then
    Begin
        frm.Prepare(Id_Type_Away, Id_PCard_Away,
            Absent.Value);
    End;

    If frm.ShowModal = mrOk Then
    Begin
        Id_Type_Away := frm.Id_Away_Type.Value;
        Value := frm.Id_Key.Value;
        Id_PCard_Away := frm.Id_PCard_Away.Value;
        AbsentDateBeg := frm.Date_Beg;
        AbsentDateEnd := frm.Date_End;

        { if frm.Date_Beg <> 0 then
             cxDateBegEdit.Value := frm.Date_Beg;

         if frm.Date_End <> 0 then
         begin
             cxDateEndEdit.Value := frm.Date_End;
             //if not DMod.UPConsts.Active then DMod.UPConsts.Open;
             //if form.Date_End = DMod.UpConsts['INFINITY_DATE'] then
            //     UnLimit.Value := True;
         end;   }

        If frm.Locate_Id_Type_Away Then
        Begin
            // WorkReasonEdit.Value := frm.Id_Work_Reason_W;
            // WorkReasonEdit.DisplayText := frm.Name_Work_Reason_W;
            DisplayText := frm.Name_Type_Away_W + ' працівника '
                + frm.Id_PCard_Away.DisplayText;
            If Not VarIsNull(frm.Id_Key.Value) Then
            Begin
                DisplayText := DisplayText + ' (підстава: ' + frm.Reason + ')';
            End;
        End;

    End;
    frm.Free;

End;

Function TfrmAddMoving.CheckVacById_Us: Boolean;
Var
    IUStoredProc: TpFibStoredProc;
    Res: Integer;
Begin
    IUStoredProc := TpFibStoredProc.Create(self);
    IUStoredProc.Database := Database;
    IUStoredProc.Transaction := WriteTransaction;
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

Procedure TfrmAddMoving.AddIdShrClick(Sender: TObject);
Begin
    If (IdShr.Text = '') Then
        agMessageDlg('Увага!', 'Не можна додавати позицію, якщо не заповнено поле "Ідентифікатор ШР"!', mtInformation, [mbOk]);

    If (((IdShr.Text = '') And (RateCount.Value = Null)) or ((IdShr.Text = '') And (cntHours.Text = '')) ) Then
        exit;

    DSetIdShR.Close;
    DSetIdShR.Open;

    If CheckShR
        Then
    Begin
        InsertShR.StoredProcName := 'UP_ACCEPT_SH_R_INS';
        InsertShR.Prepare;
        InsertShR.ParamByName('KEY_SESSION').AsInt64 := id_session;
        InsertShR.ParamByName('ID_SH_R').Value := IdShr.Value;
        InsertShR.ParamByName('RATE_COUNT').Value := RateCount.Value;
        InsertShR.ParamByName('HOURS_COUNT').AsDouble := cntHours.Value;
        InsertShR.ParamByName('MONTH_HOURS_COUNT').AsDouble := StrToInt(cntMonth.Text);
        InsertShR.ExecProc;
        DSetIdShR.Close;
        DSetIdShR.Open;

        IdShr.Text := '';
        RateCount.Value := Null;

        SaveDataOnIdShr;
    End;

End;

Procedure TfrmAddMoving.DelIdShRClick(Sender: TObject);
Begin
    {    if ShRDataSet.Active
            then if ShRDataSet.RecordCount > 0
            then ShRDataSet.Delete;}
    If DSetIdShR.RecordCount > 0 Then
    Begin
        InsertShR.StoredProcName := 'UP_ACCEPT_SH_R_DEL_IDSHR';
        InsertShR.Prepare;
        InsertShR.ParamByName('KEY_SESSION').AsInt64 := id_session;
        InsertShR.ParamByName('ID_SH_R').AsInt64 := DSetIdShR['ID_SH_R'];
        InsertShR.ExecProc;
        FindOnIdShr(false);
        DSetIdShR.Close;
        DSetIdShR.Open;
    End;
    If DSetIdShR.IsEmpty Then
    Begin
        ShowButton.Caption := '<<';
        IdShrPanel.Align := alTop;
        Panel_Bottom.Align := alCustom; //alClient;
        IdShrPanel.Visible := false;
        AddIdShr.Visible := false;
        Panel_Bottom.Visible := True;
        Panel2.Top := Panel_Bottom.Top + Panel_Bottom.Height;
        DepartmentEdit.Blocked := False;
        PosadOkladEdit.Blocked := False;
        PersonalTypeEdit.Blocked := False;
    End;
End;

Procedure TfrmAddMoving.ShowButtonClick(Sender: TObject);
Begin
    If (ShowButton.Caption = '<<')
        Then
    Begin
        If Not DSetIdShR.Active
            Then
            DSetIdShR.Active := True;
        ShowButton.Caption := '>>';
        IdShrPanel.Align := alClient;
        Panel_Bottom.Align := alBottom;
        IdShrPanel.Visible := True;

        AddIdShr.Visible := True;
        Panel_Bottom.Visible := False;

    End
    Else
    Begin
        ShowButton.Caption := '<<';
        IdShrPanel.Align := alTop;
        Panel_Bottom.Align := alCustom; //alClient;
        IdShrPanel.Visible := false;
        AddIdShr.Visible := false;
        Panel_Bottom.Visible := True;
        Panel2.Top := Panel_Bottom.Top + Panel_Bottom.Height;
    End;
End;

Function TfrmAddMoving.CheckShR: Boolean;
Var
    IUStoredProc: TpFibStoredProc;
    Res: Integer;
    Mess: String;
Begin
    Res := 1;
    IUStoredProc := TpFibStoredProc.Create(self);
    IUStoredProc.Database := Database;
    IUStoredProc.Transaction := ReadTransaction;
    IUStoredProc.StoredProcName := 'UP_ACCEPT_CHECK_SH_R';

    If DSetIdShR.RecordCount > 0
        Then
    Begin
        DSetIdShR.First;
        While (Not DSetIdShR.Eof) And (Res = 1) Do
        Begin
            If DSetIdShR.FieldByName('ID_SH_R').Value = IdShr.Value
                Then
            Begin
                Res := 0;
                agMessageDlg('Увага!', 'Не можна додавати однакові значення ідентифікатору ШР!', mtInformation, [mbOk]);
            End
            Else
            Begin
                IUStoredProc.Prepare;
                IUStoredProc.ParamByName('ID_SH_R').Value := DSetIdShR.FieldByName('ID_SH_R').Value;
                IUStoredProc.ParamByName('ID_SH_R_PROV').Value := IdShr.Value;
                IUStoredProc.ExecProc;
                Res := IUStoredProc.ParamByName('RESULT').Value;
                Mess := IUStoredProc.ParamByName('MESS').Value;
                If Res = 0 Then
                    agMessageDlg('Увага!', Mess, mtInformation, [mbOk]);
                DSetIdShR.Next;
            End;
        End;
        IUStoredProc.Free;
    End
    Else
    Begin
        IUStoredProc.Prepare;
        IUStoredProc.ParamByName('ID_SH_R').Value := Null;
        IUStoredProc.ParamByName('ID_SH_R_PROV').Value := IdShr.Value;
        IUStoredProc.ExecProc;
        Res := IUStoredProc.ParamByName('RESULT').Value;
        Mess := IUStoredProc.ParamByName('MESS').Value;
        If Res = 0 Then
            agMessageDlg('Увага!', Mess, mtInformation, [mbOk]);
    End;

    If (Res = 1)
        Then
        Result := true
    Else
        Result := false;
End;

Procedure TfrmAddMoving.FindOnIdShr(Flag: Boolean);
Var
    OldValue, i: integer;
Begin
    If Flag Then
    Begin
        {поля не заполнены, в таблице ничего нет}
        If ((DSetIdShR.RecordCount = 0) And
            ((IdShr.Text = '') And ((RateCount.Text = '') Or (cntHours.Text = ''))))
            Then
        Begin
            agMessageDlg('Увага!', 'За введеним(-и) ідентифікатором(-ами) ШР дані не знайдено!', mtInformation, [mbOk]);
            DepartmentEdit.Blocked := False;
            PosadOkladEdit.Blocked := False;
            PersonalTypeEdit.Blocked := False;
            exit;
        End;

        If (IdShr.Text = '') Then
        Begin
            agMessageDlg('Увага!', 'Не можна додавати позицію, якщо не заповнено поле "Ідентифікатор ШР"!', mtInformation, [mbOk]);
            DepartmentEdit.Blocked := False;
            PosadOkladEdit.Blocked := False;
            PersonalTypeEdit.Blocked := False;
            Exit;
        End;

        If (IdShr.Text <> '') Then
        begin
          if ((RateCount.Text = '') and (cntHours.Text = '')) then
          Begin
              agMessageDlg('Увага!', 'Не можна додавати позицію, якщо не заповнено поле "Кількість ставок" або "Кількість годин"!', mtInformation, [mbOk]);
              DepartmentEdit.Blocked := False;
              PosadOkladEdit.Blocked := False;
              PersonalTypeEdit.Blocked := False;
              Exit;
          End;

          if ((RateCount.Text <> '') and (cntHours.Text <> '')) then
          Begin
              agMessageDlg('Увага!', 'Треба заповнити поле або "Кількість ставок" або "Кількість годин"!', mtInformation, [mbOk]);
              DepartmentEdit.Blocked := False;
              PosadOkladEdit.Blocked := False;
              PersonalTypeEdit.Blocked := False;
              Exit;
          End;
        end;

        If ((IdShr.Text <> '') And ((RateCount.Text <> '') or (cntHours.Text <> '')))
            Then
        Begin
            {добавляем данные в таблицу}
            //DSetIdShR.Close;
            //DSetIdShR.Open;

            If CheckShR
                Then
            Begin
                InsertShR.StoredProcName := 'UP_ACCEPT_SH_R_INS';
                InsertShR.Prepare;
                InsertShR.ParamByName('KEY_SESSION').AsInt64 := id_session;
                InsertShR.ParamByName('ID_SH_R').Value := IdShr.Value;
                InsertShR.ParamByName('RATE_COUNT').Value := RateCount.Value;
                InsertShR.ParamByName('HOURS_COUNT').AsDouble := cntHours.Value;
                InsertShR.ParamByName('MONTH_HOURS_COUNT').AsDouble := StrToInt(cntMonth.Text);
                InsertShR.ExecProc;

                DSetIdShR.Close;
                DSetIdShR.SelectSQL.Text := 'SELECT DISTINCT * FROM Up_Accept_Sh_R_Tmp WHERE KEY_SESSION=:KEY_SESSION';
                DSetIdShR.ParamByName('key_session').AsInt64 := id_session;
                DSetIdShR.Open;
                DSetIdShR.FetchAll;

                IdShr.Text := '';
                RateCount.Text :='';
                cntHours.Text := '';
            End
            Else
            Begin
                exit;
            End;
        End;

        SaveDataOnIdShr;
        FactOkladEdit.Blocked := False;

        {разворачиваем таблицу, по которой будет выполнятся поиск}
        If (ShowButton.Caption = '<<')
            Then
        Begin
            If Not DSetIdShR.Active
                Then
                DSetIdShR.Active := True;  
            ShowButton.Caption := '>>';
            IdShrPanel.Align := alClient;
            Panel_Bottom.Align := alBottom;
            IdShrPanel.Visible := True;

            AddIdShr.Visible := True;
            Panel_Bottom.Visible := False;
        End;
    End;
End;

Procedure TfrmAddMoving.SaveDataOnIdShr;
Var
    OldValue, i: integer;
Begin
    {если есть данные для поиска, то ищем}
    If (DSetIdShR.RecordCount > 0)
        Then
    Begin
        FindIdShR.Enabled := False;
        IdShr.Properties.ReadOnly := True;
        IdShr.Style.Color := $00EBEBEB;
        RateCount.Enabled := false;
        PersonalTypeEdit.Clear;
        FactOkladEdit.Clear;
        PosadOkladEdit.Clear;
        DepartmentEdit.Clear;
        DepartmentEdit.Blocked := True;
        PersonalTypeEdit.Blocked := True;
        PosadOkladEdit.Blocked := True;

        Try
            IdShRSelect.Close;
            IdShRSelect.SelectSQL.Text := 'SELECT * FROM UP_DT_ID_SH_R_SELECT(:DATE_BEG, :DATE_END, :KEY_SESSION, :ID_PCARD)';
            IdShRSelect.ParamByName('DATE_BEG').AsDate := cxDateBegEdit.Date;
            IdShRSelect.ParamByName('DATE_END').AsDate := cxDateEndEdit.Date;
            IdShRSelect.ParamByName('KEY_SESSION').AsInt64 := id_session;
            IdShRSelect.ParamByName('ID_PCARD').Value := IdPcard; //id_pcard;
            IdShRSelect.Open;
            IdShRSelect.FetchAll;

            If IdShRSelect.RecordCount > 0 Then
            Begin
                If VarIsNull(IdShRSelect['Id_Department']) Then
                Begin
                    agMessageDlg('Увага!', 'За введеним(-и) ідентифікатором(-ами) ШР дані не знайдено!', mtInformation, [mbOk]);
                    FindIdShR.Enabled := True;
                    IdShr.Properties.ReadOnly := False;
                    IdShr.Style.Color := clWindow;
                    RateCount.Enabled := true;
                    DepartmentEdit.Blocked := False;
                    PosadOkladEdit.Blocked := False;
                    PersonalTypeEdit.Blocked := False;
                    IdShRSelect.Close;
                    exit;
                End;

                DepartmentEdit.Blocked := True;
                PersonalTypeEdit.Blocked := True;
                PosadOkladEdit.Blocked := True;

                DepartmentEdit.Value := IdShRSelect['ID_DEPARTMENT'];
                DepartmentEdit.DisplayText := IdShRSelect['DEPARTMENT_NAME'];
                PosadOkladEdit.Value := IdShRSelect['ID_POST_SALARY'];
                PosadOkladEdit.DisplayText := IdShRSelect['NAME_POST'];
                FactOkladEdit.value := IdShRSelect['ID_POST_SALARY'];
                FactOkladEdit.DisplayText := IdShRSelect['NAME_POST'];

                PersonalTypeEdit.Value := IdShRSelect['ID_TYPE_POST'];
                PersonalTypeEdit.DisplayText := IdShRSelect['NAME_TYPE_POST'];

                cntMonth.Visible := (IdShRSelect['is_ped_work']=1);
                lblMonth.Visible := cntMonth.Visible;
                IsPedType := cntMonth.Visible;

                IdShRSelect.Close;

                SmetShR.Close;
                SmetShR.SelectSQL.Text := 'SELECT * FROM UP_DT_SH_R_MOV_SMET_SEL(:DATE_BEG, :DATE_END, :KEY_SESSION, :ID_ORDER_ITEM)';
                SmetShR.ParamByName('DATE_BEG').AsDate := cxDateBegEdit.Date;
                SmetShR.ParamByName('DATE_END').AsDate := cxDateEndEdit.Date;
                SmetShR.ParamByName('KEY_SESSION').AsInt64 := id_session;
                SmetShR.ParamByName('ID_ORDER_ITEM').AsInt64 := ID_ORDER_ITEM;
                SmetShR.Open;
                SmetShR.FetchAll;

                If SmetShR.RecordCount > 0 Then
                Begin
                    StoredProcSmet.StoredProcName := 'UP_DT_MAN_MOVING_BUFF_DEL_ALL';
                    StoredProcSmet.Prepare;
                    StoredProcSmet.ParamByName('KEY_SESSION').AsInt64 := id_session;
                    Try
                        StoredProcSmet.ExecProc;
                    Except
                        StoredProcSmet.Close;
                        exit;
                    End;

                    StoredProcSmet.Close;
                    StoredProcSmet.StoredProcName := 'UP_DT_MAN_SMET_BUFF_MOV_INS';
                    SmetShR.First;
                    For i := 0 To SmetShR.RecordCount - 1 Do
                    Begin
                        StoredProcSmet.Close;
                        StoredProcSmet.ParamByName('ID_SMET').Value := SmetShR['ID_SMET'];
                        StoredProcSmet.ParamByName('ID_SMET_PPS').Value := SmetShR['ID_SMET_PPS'];
                        StoredProcSmet.ParamByName('KOEFF_PPS').Value := SmetShR['KOEFF_PPS'];
                        StoredProcSmet.ParamByName('RATE_COUNT').Value := SmetShR['RATE_COUNT'];
                        StoredProcSmet.ParamByName('KEY_SESSION').AsInt64 := id_session;
                        StoredProcSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
                        StoredProcSmet.ParamByName('ID_SH_R').AsInt64 := SmetShR['ID_SH_R_IN'];
                        StoredProcSmet.ParamByName('HOURS_COUNT').value := SmetShR['HOURS_COUNT'];
                        StoredProcSmet.ExecProc;
                        StoredProcSmet.Close;
                        SelectSmet;
                        rc2 := DataSetSmet['RATE_COUNT']; //f
                        SmetShR.Next;
                    End;
                End;

                DataSetSmet.Close;
                DataSetSmet.ParamByName('ID_SESSION').AsInt64 := id_session;
                DataSetSmet.Open;

                DataSetNad.Close;
                DataSetNad.ParamByName('ID_SESSION').AsInt64 := id_session;
                DataSetNad.Open;

                {if not VarIsNull(DepartmentEdit.Value) then }DepartmentEdit.Blocked := True;
                {if not VarIsNull(PosadOkladEdit.Value) then }PosadOkladEdit.Blocked := True;
                {if not VarIsNull(FactOkladEdit.Value) then }FactOkladEdit.Blocked := True;
                {if not VarIsNull(PersonalTypeEdit.Value) then }PersonalTypeEdit.Blocked := True;
            End
            Else
            Begin
                agMessageDlg('Увага!', 'За введеним(-и) ідентифікатором(-ами) ШР дані не знайдено!', mtInformation, [mbOk]);
            End;

        Except On e: Exception Do
            Begin
                ShowMessage(e.Message);
                FindIdShR.Enabled := True;
                IdShr.Properties.ReadOnly := False;
                IdShr.Style.Color := clWindow;
                RateCount.Enabled := true;
                DepartmentEdit.Blocked := False;
                PosadOkladEdit.Blocked := False;
                PersonalTypeEdit.Blocked := False;
            End;
        End;
        FindIdShR.Enabled := True;
        IdShr.Properties.ReadOnly := False;
        IdShr.Style.Color := clWindow;
        RateCount.Enabled := true;
    End;
End;

Procedure TfrmAddMoving.Act_Find_Id_ShRExecute(Sender: TObject);
Begin
    FindOnIdShr(true);
End;

Procedure TfrmAddMoving.cxDateBegEditPropertiesChange(Sender: TObject);
Begin
    If IsEditSmet Then
    Begin
        If cxDateBegEdit.Date < Date_B Then
        Begin
            agMessageDlg('Увага!', 'Початок не може бути менш ніж дата початку трудового договору!', mtError, [mbOk]);
            cxDateBegEdit.SetFocus;
            cxDateBegEdit.Style.Color := clRed;
            Exit;
        End;
    End;
    FillWorkModeDSet(WMByPeriodSet, cxDateBegEdit.Date, cxDateEndEdit.Date, IdWorkMode, Null, Null, ShiftEdit.Value, 7);
    FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
End;

Procedure TfrmAddMoving.ShiftEditPropertiesChange(Sender: TObject);
Begin
    If ShiftEdit.Value > MaxBound - 1 Then
        ShiftEdit.Value := MaxBound - 1;
    If ShiftEdit.Value < 0 Then
        ShiftEdit.Value := 0;
    FillWorkModeDSet(WMByPeriodSet, cxDateBegEdit.Date, cxDateEndEdit.Date, IdWorkMode, Null, Null, ShiftEdit.Value, 7);
    FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
End;

Procedure TfrmAddMoving.cxDateEndEditPropertiesChange(Sender: TObject);
Begin
    FillWorkModeDSet(WMByPeriodSet, cxDateBegEdit.Date, cxDateEndEdit.Date, IdWorkMode, Null, Null, ShiftEdit.Value, 7);
    FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
End;

Procedure TfrmAddMoving.WorkModeSpravPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
Var
    res: Variant;
    Parameter: TTuSimpleParam;
Begin
    Parameter := TTuSimpleParam.Create;
    Parameter.DB_Handle := Database.Handle;
    Parameter.Owner := self;
    Parameter.CFStyle := tfsModal;
    res := DoFunctionFromPackage(Parameter, Tu_SpWorkMode_Pack);
    If VarIsArray(res) Then
    Begin
        IdWorkMode := res[0];
        WorkModeSprav.Text := res[1];
        MaxBound := res[2];
    End;
    FillWorkModeDSet(WMByPeriodSet, cxDateBegEdit.Date, cxDateEndEdit.Date, IdWorkMode, Null, Null, ShiftEdit.Value, 7);
    FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
    Parameter.Destroy;
End;

Procedure TfrmAddMoving.EditBonusSmetExecute(Sender: TObject);
Var
    frm: TfmMoveBonusEdit;
    er: String;
    Id: Integer;
    SmDateBeg, SmDateEnd: TDate;
Begin
    If cxPageControl1.ActivePage = cxTabSheet1 Then
        Exit;
    If ((btnEditBonusSmet.Visible = ivNever) Or (btnEditBonusSmet.Enabled = False)) Then
        Exit;
    If ((IsEditSmet) And (DataSetNad['id_calc_type'] <> 1)
        And (DataSetNad['id_calc_type'] <> 4)) Then
        Exit;
    Id := DataSetNad['id_rec'];
    frm := TfmMoveBonusEdit.Create(Self);
    frm.NumBon.Blocked := True;
    frm.IdRaise.Blocked := True;
    frm.Percent.Blocked := True;
    frm.Summa.Blocked := True;
    frm.Kod_Sm_Pps.Blocked := True;
    If IsEditSmet Then
        frm.All_Periods.Blocked := True
    Else
    Begin
        frm.All_Periods.Value := False;
        frm.All_Periods.Visible := False;
        frm.Smeta.Blocked := True;
        frm.cxDateBeg.Visible := True;
        frm.cxDateEnd.Visible := True;
        frm.LblDateBeg.Visible := True;
        frm.LblDateEnd.Visible := True;
        frm.LblDateBeg.Top := 168;
        frm.LblDateEnd.Top := 168;
        frm.cxDateBeg.Top := 168;
        frm.cxDateEnd.Top := 168;
    End;
    frm.IdRaise.Required := False;
    frm.IdRaise.DisplayText := DataSetNad['raise_name'];
    If DataSetNad['percent'] = DataSetNad['summa'] Then
        frm.Summa.Value := DataSetNad['summa']
    Else
        frm.Percent.Value := DataSetNad['percent'];
    frm.Smeta.Value := DataSetNad['id_smet'];
    frm.Smeta.DisplayText := DataSetNad['Smeta_Name'];
    If Not VarIsNull(DataSetNad['Id_Smet_Pps']) Then
    Begin
        frm.Kod_Sm_Pps.Value := DataSetNad['Id_Smet_Pps'];
        frm.Kod_Sm_Pps.DisplayText := DataSetNad['Smeta_Pps_Name'];
    End;
    frm.cxDateBeg.Date := DataSetNad['date_beg'];
    SmDateBeg := DataSetNad['date_beg'];
    frm.cxDateEnd.Date := DataSetNad['date_end'];
    SmDateEnd := DataSetNad['date_end'];
    If frm.ShowModal = mrOk Then
    Begin
        UpdBonusSmet.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_MOV_UPD';
        UpdBonusSmet.Prepare;
        UpdBonusSmet.ParamByName('key_session').AsInteger := id_session;
        UpdBonusSmet.ParamByName('id_order_item').AsInteger := DataSetNad['id_order_item'];
        UpdBonusSmet.ParamByName('PERIOD_BEG').AsDate := frm.cxDateBeg.Date;
        UpdBonusSmet.ParamByName('PERIOD_END').AsDate := frm.cxDateEnd.Date;
        UpdBonusSmet.ParamByName('ID_SMET').AsInteger := frm.Smeta.Value;
        UpdBonusSmet.ParamByName('ID_SMET_PPS').AsInteger := frm.Kod_Sm_Pps.Value;
        UpdBonusSmet.ParamByName('ID_CALC_TYPE').AsInteger := DataSetNad['id_calc_type'];
        UpdBonusSmet.ParamByName('ID_REC').AsInteger := DataSetNad['id_rec'];
        UpdBonusSmet.ParamByName('ID_RAISE').AsInteger := DataSetNad['id_raise'];
        UpdBonusSmet.ParamByName('IS_EDIT_SMET').AsInteger := Integer(Boolean(IsEditSmet));
        UpdBonusSmet.ParamByName('SMET_PERIOD_BEG').AsDate := SmDateBeg;
        UpdBonusSmet.ParamByName('SMET_PERIOD_END').AsDate := SmDateEnd;
        UpdBonusSmet.ExecProc;
        er := UpdBonusSmet.FieldByName('ERROR_MESSAGE').AsString;
        If er <> 'No' Then
            agMessageDlg('Увага!', er, mtInformation, [mbOK]);
    End;
    SelectSmet;
    SelectNad;
    frm.Free;
    DataSetNad.Locate('Id_Rec', Id, []);
End;

Procedure TfrmAddMoving.cxTabSheet3Show(Sender: TObject);
Begin
    If IsEditSmet = True Then
    Begin
        btnAdd.Visible := ivNever;
        btnDelete.Visible := ivNever;
    End;
    //else btnEditBonusSmet.Visible:=ivNever;
End;

Procedure TfrmAddMoving.cxTabSheet2Show(Sender: TObject);
Begin
    btnAdd.Visible := ivAlways;
    btnDelete.Visible := ivAlways;
End;

Procedure TfrmAddMoving.ActAddExecute(Sender: TObject);
Var
    frm: TfrmAddSmet;
    mov_dost: Boolean;
Begin
  try
    If cxPageControl1.ActivePage = cxTabSheet1 Then
        Exit;
    If ((btnAdd.Visible = ivNever) Or (btnAdd.Enabled = False)) Then
        Exit;
    If cxPageControl1.ActivePageIndex = 2 Then
    Begin
        AddBonus;
        exit;
    End;

    frm := TfrmAddSmet.Create(Self);
    frm.Caption := 'Додати ' + frm.Caption;

    frm.mov_dostup := False;
    If CheckVacById_Us Then
        frm.mov_dostup := True
    Else
        frm.mov_dostup := False;


    frm.RateCount.Enabled := not IsPedType;
    frm.cntHours.Visible := IsPedType;
    frm.PPSVal.Blocked := IsPedType;

    if IsPedType then
    begin
       frm.lblRateCount.Left := 188;
       frm.RateCount.Left := 300;
       frm.LblFreeRate.Left := 361;
       frm.FreeRate.Left := 475;
    end;

    if (not VarIsNull(FactOkladEdit.Value)) then
    begin
        frm.PeriodBeg := cxDateBegEdit.Date;
        frm.PeriodEnd := cxDateEndEdit.Date;
        frm.IdPostSalary := FactOkladEdit.Value;
        frm.IdTypePost := PersonalTypeEdit.Value;
        frm.cntMonth := StrToInt(cntMonth.Text);
    end;

    If frm.ShowModal = mrOk Then
    Begin
        StoredProcSmet.Close;
        StoredProcSmet.StoredProcName := 'UP_DT_MAN_SMET_BUFF_MOV_INS';
        StoredProcSmet.Prepare;
        StoredProcSmet.ParamByName('ID_SMET').AsInt64 := frm.Smet.Value;
        if frm.PPSSmet.Value = null then StoredProcSmet.ParamByName('ID_SMET_PPS').Value := null
        else StoredProcSmet.ParamByName('ID_SMET_PPS').AsInt64 := frm.PPSSmet.Value;
        if frm.PPSVal.Value = null then StoredProcSmet.ParamByName('KOEFF_PPS').Value := null
        else StoredProcSmet.ParamByName('KOEFF_PPS').AsDouble := frm.PPSVal.Value;
        StoredProcSmet.ParamByName('RATE_COUNT').AsDouble := StrToFloat(frm.RateCount.Text);
        StoredProcSmet.ParamByName('KEY_SESSION').AsInt64 := id_session;
        StoredProcSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
        StoredProcSmet.ParamByName('ID_SH_R').AsVariant := null; //добавлено без идентификатора ШР
        if frm.cntHours.Text = '' then  StoredProcSmet.ParamByName('HOURS_COUNT').AsDouble := 0
        else StoredProcSmet.ParamByName('HOURS_COUNT').AsCurrency := frm.cntHours.Value;
        StoredProcSmet.ExecProc;
        StoredProcSmet.Close;
        SelectSmet;
        rc2 := DataSetSmet['SUM_RATE_COUNT']; //f
    End;
    frm.Free;
  except on E:Exception
         do begin
              ShowMessage(e.Message);
         end;
  end;
End;

Procedure TfrmAddMoving.ActDelExecute(Sender: TObject);
Begin
  try
    If cxPageControl1.ActivePage = cxTabSheet1 Then
        Exit;
    If ((btnDelete.Visible = ivNever) Or (btnDelete.Enabled = False)) Then
        Exit;

    If cxPageControl1.ActivePageIndex = 2 Then
    Begin
        DelBonus;
        exit;
    End;

    StoredProcSmet.Close;
    StoredProcSmet.StoredProcName := 'UP_DT_MAN_SMET_BUFF_MOV_DEL';
    StoredProcSmet.ParamByName('ID_REC').AsInt64 := DataSetSmet['ID_REC'];
    StoredProcSmet.ParamByName('ID_SMET').AsInt64 := DataSetSmet['ID_SMET'];
    StoredProcSmet.ParamByName('ID_SMET_PPS').Value := DataSetSmet['ID_SMET_PPS'];
    StoredProcSmet.ParamByName('KOEFF_PPS').Value := DataSetSmet['KOEFF_PPS'];
    StoredProcSmet.ParamByName('RATE_COUNT').Value := DataSetSmet['RATE_COUNT'];
    StoredProcSmet.ParamByName('KEY_SESSION').AsInt64 := id_session;
    StoredProcSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;

    StoredProcSmet.ExecProc;
    StoredProcSmet.Close;

    DataSetSmet.CacheDelete;
    DataSetSmet.CloseOpen(True);
    if not VarIsNull(DataSetSmet['Sum_Rate_Count']) then rc2 := DataSetSmet['Sum_Rate_Count'];
  except on E:Exception
         do begin
              ShowMessage(E.Message);
         end;
  end;
End;

procedure TfrmAddMoving.cntMonthKeyPress(Sender: TObject; var Key: Char);
begin
   if ((Key = #8) or (Key in ['0'..'9'])) then cntMonth.Properties.ReadOnly := false
   else cntMonth.Properties.ReadOnly := true;
end;

procedure TfrmAddMoving.cxPageControl1Change(Sender: TObject);
begin
   if (cxPageControl1.ActivePage = cxTabSheet2) then
   begin
      BotomPanel.Visible := IsPedType;
   end;
end;

procedure TfrmAddMoving.cntHoursKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   RateCount.Text := '';
end;


procedure TfrmAddMoving.RateCountKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   cntHours.Text := '';
end;

End.

