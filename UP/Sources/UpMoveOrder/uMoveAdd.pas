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
unit uMoveAdd;

interface

uses
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

type
    TfrmAddMoving = class(TForm)
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
        procedure FormShow(Sender: TObject);
        procedure btnCancelClick(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
        procedure DepartmentEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PosadOkladEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure DateBegEditChange(Sender: TObject);
        procedure PosadOkladEditChange(Sender: TObject);
        procedure WorkReasonEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PersonalTypeEditOpenSprav(Sender: TObject;
            var Value: Variant; var DisplayText: string);
        procedure CondEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PayFormEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FactOkladEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure WorkCondEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure HospitalEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure WorkReasonEditChange(Sender: TObject);
        procedure DateEndEditChange(Sender: TObject);
        procedure HolidayEditChange(Sender: TObject);
        procedure HospitalEditChange(Sender: TObject);
        procedure DepartmentEditChange(Sender: TObject);
        procedure FactOkladEditChange(Sender: TObject);
        procedure PersonalTypeEditChange(Sender: TObject);
        procedure WorkCondEditChange(Sender: TObject);
        procedure PayFormEditChange(Sender: TObject);
        procedure ReasonEditChange(Sender: TObject);
        procedure NoteEditChange(Sender: TObject);
        procedure CondEditChange(Sender: TObject);
        procedure DateBegObrEditChange(Sender: TObject);
        procedure DateEndObrEditChange(Sender: TObject);
        procedure PayEditChange(Sender: TObject);
        procedure cbIsMainPostChange(Sender: TObject);
        procedure cbBackChange(Sender: TObject);
        procedure cbNoDateEndChange(Sender: TObject);
        procedure btnEditClick(Sender: TObject);
        procedure cxGridDBBandedTableView2KeyDown(Sender: TObject;
            var Key: Word; Shift: TShiftState);
        procedure cxGridDBBandedTableView4KeyDown(Sender: TObject;
            var Key: Word; Shift: TShiftState);
        procedure AbsentChange(Sender: TObject);
        procedure AbsentOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure AddIdShrClick(Sender: TObject);
        procedure DelIdShRClick(Sender: TObject);
        procedure ShowButtonClick(Sender: TObject);
        procedure Act_Find_Id_ShRExecute(Sender: TObject);
        procedure cxDateBegEditPropertiesChange(Sender: TObject);
        procedure ShiftEditPropertiesChange(Sender: TObject);
        procedure cxDateEndEditPropertiesChange(Sender: TObject);
        procedure WorkModeSpravPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure EditBonusSmetExecute(Sender: TObject);
        procedure cxTabSheet3Show(Sender: TObject);
        procedure cxTabSheet2Show(Sender: TObject);
        procedure ActAddExecute(Sender: TObject);
        procedure ActDelExecute(Sender: TObject);
        procedure cntMonthKeyPress(Sender: TObject; var Key: Char);
        procedure cxPageControl1Change(Sender: TObject);
        procedure cntHoursKeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure RateCountKeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
        IdOrderType: Integer;
        function CheckVacById_Us: Boolean;

        function checkOrder: Boolean;
        function checkOrderDialog: Boolean;

    public
        id_order_item: int64;
        id_session: int64;
        MassEdit: boolean;
        isContinue, isWorkModeEdit: boolean;
        isTemp, IsEditSmet, IsPedType: boolean;
        isDepartmentEdit: Boolean;
        isChangeTeachingLoad: Boolean;
        Id_Type_Away: integer;
        Id_PCard_Away, man_m, IdPcard, MaxCntMonth: integer;
        rc1, rc2: Real;
        Date_B, Date_E: TDAte;
        check_date_beg, check_date_end: tdate;
        IsOnlyOpenSpr: Boolean;
        IdWorkMode: Variant;
        MaxBound: Integer;
        AbsentDateBeg, AbsentDateEnd: TDate;
        constructor Create(AOwner: Tcomponent; IdType: Integer);
        procedure SelectNad;
        procedure SelectSmet;
        procedure AddBonus;
        procedure DelBonus;
        function CheckShR: Boolean;
        procedure FindOnIdShr(Flag: Boolean);
        procedure SaveDataOnIdShr;
        function IsShowTabSheet(OrderType: Variant): Boolean;
    end;

var
    frmAddMoving: TfrmAddMoving;

implementation
uses uMove, qfTools, uSelectForm, uMoveAddSmet, uMoveBonusEdit, BaseTypes, uMoveAbsent;
{$R *.dfm}

constructor TfrmAddMoving.Create(AOwner: Tcomponent; IdType: Integer);
begin
    inherited Create(AOwner);
    IdOrderType := IdType;
    IdWorkMode := null;
    IsPedType := false;

    if TfrmMoveOrder(owner).Mode = 2 then
        btnOk.Enabled := false;
end;

procedure TfrmAddMoving.SelectNad;
begin
    DataSetNad.Close;
    DataSetNad.ParamByName('ID_SESSION').AsInt64 := id_session;
    if MassEdit then
        DataSetNad.ParamByName('ID_ORDER_ITEM').AsVariant := Null
    else
        DataSetNad.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;

    DataSetNad.Open;
    cxGridDBBandedTableView4.ViewData.Expand(true);
end;

procedure TfrmAddMoving.FormShow(Sender: TObject);
var
    i: Integer;
begin
    if PosadOkladEdit.Enabled then
        PosadOkladEdit.Blocked := VarIsNull(cxDateBegEdit.Date) or VarIsNull(DepartmentEdit.Value);
    if FactOkladEdit.Enabled then
        FactOkladEdit.Blocked := VarIsNull(cxDateBegEdit.Date) or VarIsNull(DepartmentEdit.Value);
    if PersonalTypeEdit.Enabled then
        PersonalTypeEdit.Blocked := VarIsNull(PosadOkladEdit.Value);

    check_date_beg := cxDateBegEdit.Date;
    check_date_end := cxDateEndEdit.Date;

    if IsShowTabSheet(IdOrderType) = False then
        TSWorkMode.TabVisible := False;

    if isContinue then
    begin
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
    end;

    if isChangeTeachingLoad then
        cntMonth.Enabled := true;

    if isWorkModeEdit then
    begin
        cxTabSheet2.TabVisible := False;
        cxTabSheet3.TabVisible := False;
    end;

    if IsEditSmet then
    begin
        WorkModeSprav.Enabled := False;
        ShiftEdit.Enabled := False;
    end;

    if isDepartmentEdit then
    begin
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
    end;
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

    if DSetIdShR.RecordCount > 0 then
    begin
        DepartmentEdit.Blocked := true;
        PosadOkladEdit.Blocked := true;
        PersonalTypeEdit.Blocked := true;
    end;

    SelectNad;
    SelectSmet;
    for i := 0 to WorkModeGridTableView1.ColumnCount - 1 do
    begin
        WorkModeGridTableView1.Columns[i].DataBinding.ValueTypeClass := TcxStringValueType;
    end;
    FillWorkModeDSet(WMByPeriodSet, cxDateBegEdit.Date, cxDateEndEdit.Date, IdWorkMode, Null, Null, ShiftEdit.Value, 7);
    FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
    IsOnlyOpenSpr := False;
end;

function TfrmAddMoving.IsShowTabSheet(OrderType: Variant): Boolean;
var
    check: Integer;
begin
    Result := True;
    if VarIsNull(OrderType) then
        Exit;
    check := fibCheckPermission('/ROOT/Up_order_system/Up_order_types/' + IntToStr(OrderType) +
        '_UP_ORDER_TYPE/' + IntToStr(OrderType) + '_WORKMODE_TAB', 'Edit');
    if check <> 0 then
        Result := False;
end;

procedure TfrmAddMoving.btnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmAddMoving.btnOkClick(Sender: TObject);
var
    i: Integer;
begin
    if not qFCheckAll(Self) then
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
            agMessageDlg('Увага!', 'Кількість місяців не може перевищувати (' + IntToStr(MaxCntMonth) + '!', mtInformation, [mbOK]);
            Exit;
        end;
    end;

    if not VarIsNull(Absent.Value) then
    begin
        if (cxDateBegEdit.Date < AbsentDateBeg) or
            (cxDateBegEdit.Date > AbsentDateEnd) or
            (cxDateEndEdit.Date < AbsentDateBeg) or
            (cxDateEndEdit.Date > AbsentDateEnd) then
        begin
            cxDateBegEdit.Style.Color := clRed;
            cxDateEndEdit.Style.Color := clRed;
            agMessageDlg('Увага!', 'Період переведення повинен належати періоду відсутності працівника!', mtInformation, [mbOK]);
            Exit;
        end;
    end;

    if IsEditSmet then
    begin
        if rc1 <> rc2 then
        begin
            showmessage('Кількість ставок повинна співпадати з тією кількістю ставок, що була до переводу');
            exit;
        end;
    end;

    // проверка на заполнение даты
    if Trim(cxDateBegEdit.Text) = '' then
    begin
        agMessageDlg('Увага!', 'Введіть дату початку!', mtError, [mbOk]);
        cxDateBegEdit.SetFocus;
        cxDateBegEdit.Style.Color := clRed;
        Exit;
    end;

    // проверка на заполнение даты
    if Trim(cxDateEndEdit.Text) = '' then
    begin
        agMessageDlg('Увага!', 'Введіть дату кінця!', mtError, [mbOk]);
        cxDateEndEdit.SetFocus;
        cxDateEndEdit.Style.Color := clRed;
        Exit;
    end;

    // проверка на корректность даты
    if cxDateBegEdit.Date > cxDateEndEdit.Date then
    begin
        agMessageDlg('Увага!', 'Дата кінця повинна бути більше дати початку!', mtError, [mbOk]);
        cxDateBegEdit.SetFocus;
        cxDateBegEdit.Style.Color := clRed;
        cxDateEndEdit.Style.Color := clRed;
        Exit;
    end;

    // проверка на корректность даты избрания
    if ((Trim(cxDateBegObrEdit.Text) <> '') and
        (Trim(cxDateEndObrEdit.Text) <> '') and
        (cxDateBegObrEdit.Date > cxDateEndObrEdit.Date)) then
    begin
        agMessageDlg('Увага!', 'Дата кінця обрання повинна бути більше дати початку!', mtError, [mbOk]);
        cxDateBegObrEdit.SetFocus;
        cxDateBegObrEdit.Style.Color := clRed;
        cxDateEndObrEdit.Style.Color := clRed;
        Exit;
    end;

    // Проверка даты обрання з датой перемещения и диалог с пользователем
    if not checkOrder then
        if not checkOrderDialog then
            Exit;

    try
        StoredProc.StoredProcName := 'UP_DT_MAN_MOVING_BUFF_MAS_UPD';
        StoredProc.Prepare;

        if Trim(cxDateBegEdit.Text) = '' then
            StoredProc.ParamByName('date_beg').AsVariant := Null
        else
            StoredProc.ParamByName('date_beg').asDate := cxDateBegEdit.Date;

        if Trim(cxDateEndEdit.Text) = '' then
            StoredProc.ParamByName('date_end').AsVariant := Null
        else
            StoredProc.ParamByName('date_end').AsDate := cxDateEndEdit.Date;

        StoredProc.ParamByName('id_pcard').AsVariant := Null;
        StoredProc.ParamByName('id_department').AsVariant := DepartmentEdit.Value;

        if PayEdit.LabelColor = SYS_MASS_COLOR then
            StoredProc.ParamByName('is_tarif').AsVariant := Null
        else
            StoredProc.ParamByName('is_tarif').AsInteger := PayEdit.Value;

        StoredProc.ParamByName('id_post_salary_real').AsVariant := FactOkladEdit.Value;
        StoredProc.ParamByName('id_post_salary').AsVariant := PosadOkladEdit.Value;
        StoredProc.ParamByName('id_type_post').AsVariant := PersonalTypeEdit.Value;

        if cbIsMainPost.LabelColor = SYS_MASS_COLOR then
            StoredProc.ParamByName('is_post_main').AsVariant := Null
        else
            StoredProc.ParamByName('is_post_main').AsInteger := round(sqr(cbIsMainPost.Value));

        StoredProc.ParamByName('id_work_reason').AsVariant := WorkReasonEdit.Value;
        StoredProc.ParamByName('id_work_condition').AsVariant := WorkCondEdit.Value;
        StoredProc.ParamByName('id_pay_form').AsVariant := PayFormEdit.Value;
        StoredProc.ParamByName('id_man_hospital').AsVariant := Null;
        StoredProc.ParamByName('id_man_holiday').AsVariant := Null;
        StoredProc.ParamByName('key_session').AsInt64 := id_session;
        StoredProc.ParamByName('id_accept_cond').AsVariant := CondEdit.Value;

        if Trim(cxDateBegObrEdit.Text) = '' then
            StoredProc.ParamByName('accept_beg').AsVariant := Null
        else
            StoredProc.ParamByName('accept_beg').AsDate := cxDateBegObrEdit.Date;

        if Trim(cxDateEndObrEdit.Text) = '' then
            StoredProc.ParamByName('accept_end').AsVariant := Null
        else
            StoredProc.ParamByName('accept_end').AsDate := cxDateEndObrEdit.Date;

        StoredProc.ParamByName('note').AsVariant := NoteEdit.Value;
        StoredProc.ParamByName('num_item').AsVariant := Null;
        StoredProc.ParamByName('num_sub_item').AsVariant := Null;
        StoredProc.ParamByName('id_order').AsVariant := (owner as TfrmMoveOrder).Input['ID_ORDER'];
        StoredProc.ParamByName('id_order_type').AsVariant := (owner as TfrmMoveOrder).Input['ID_ORDER_TYPE'];
        StoredProc.ParamByName('reason').AsVariant := ReasonEdit.Value;
        StoredProc.ParamByName('id_man_moving').AsVariant := Null;

        if isTemp then
            StoredProc.ParamByName('with_return').AsInteger := 1;
        if isContinue then
            StoredProc.ParamByName('with_return').AsVariant := Null;
        if IsEditSmet then
            StoredProc.ParamByName('with_return').AsVariant := 1;
        if MassEdit then
            StoredProc.ParamByName('id_order_item').AsVariant := Null
        else
            StoredProc.ParamByName('id_order_item').AsInt64 := id_order_item;

        if Absent.DisplayText = '' then
            Id_Type_Away := -1;

        if Id_Type_Away = -1 then
        begin
            StoredProc.ParamByName('Id_Type_Away').AsVariant := Null;
        end
        else
        begin
            StoredProc.ParamByName('Id_Type_Away').AsInteger := Id_Type_Away;
        end;

        if Absent.DisplayText = '' then
            Id_Pcard_Away := -1;
        if Id_Pcard_Away = -1 then
            StoredProc.ParamByName('Id_Pcard_Away').AsVariant := Null
        else
            StoredProc.ParamByName('Id_Pcard_Away').AsInt64 := Id_Pcard_Away;

        if VarIsNull(Absent.Value) then
            StoredProc.ParamByName('Id_Key').AsVariant := Null
        else
            StoredProc.ParamByName('Id_Key').AsInt64 := Absent.Value;

        if VarIsNull(IdWorkMode) then
            StoredProc.ParamByName('Id_Work_Mode').AsVariant := Null
        else
            StoredProc.ParamByName('Id_Work_Mode').AsInteger := IdWorkMode;

        StoredProc.ParamByName('Work_Mode_Shift').AsInteger := ShiftEdit.Value;

        if not IsPedType then
            cntMonth.Text := '';

        if cntMonth.Text = '' then
            StoredProc.ParamByName('month_hours_count').Value := null
        else
            StoredProc.ParamByName('month_hours_count').AsShort := StrToInt(cntMonth.Text);

        StoredProc.ExecProc;

        Modalresult := mrOk;

    except on E: Exception do
            Showmessage(E.Message);
    end;
end;

procedure TfrmAddMoving.DepartmentEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
    OldValue: integer;
begin
    if (not VarIsNull(DepartmentEdit.Value)) then
        OldValue := DepartmentEdit.Value
    else
        OldValue := -1;
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(Database.Handle);
            FieldValues['Actual_Date'] := Date();
            FieldValues['AllowEdit'] := False;
            Post;
        end;
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];

            if (Value <> OldValue) then
            begin
                PosadOkladEdit.Clear;
                PosadOkladEdit.LabelColor := SYS_MASS_NORM_COLOR;
                FactOkladEdit.Clear;
                FactOkladEdit.LabelColor := SYS_MASS_NORM_COLOR;
                PersonalTypeEdit.Clear;
                PersonalTypeEdit.LabelColor := SYS_MASS_NORM_COLOR;
            end;
        end;
        sp.Free;
    end;
end;

procedure TfrmAddMoving.PosadOkladEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Res: Variant;
begin
    if VarIsNull(DepartmentEdit.Value) then
    begin
        MessageDlg('Спочатку треба обрати підрозділ!', mtError, [mbYes], -1);
        Exit;
    end;

    PostSalarySelect.Close;
    PostSalarySelect.ParamByName('Id_Department').AsInteger := DepartmentEdit.Value;
    PostSalarySelect.ParamByName('Act_Date').AsDate := cxDateBegEdit.Date;
    PostSalarySelect.Open;

    if qSelect(PostSalarySelect) then
    begin
        Value := PostSalarySelect['id_post_salary'];
        DisplayText := PostSalarySelect['Post_name'];

        FactOkladEdit.value := Value;
        FactOkladEdit.DisplayText := DisplayText;

        IdWorkMode := PostSalarySelect['Id_Work_Mode'];
        ShiftEdit.Value := 0;

        FillWorkModeDSet(WMByPeriodSet, cxDateBegEdit.Date, cxDateEndEdit.Date, IdWorkMode, Null, Null, ShiftEdit.Value, 7);
        FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
        Res := GetWorkModeInfo(GetWorkMode, IdWorkMode);
        if VarIsArray(Res) then
        begin
            WorkModeSprav.Text := Res[0];
            MaxBound := Res[1];
        end;

        // попробуем автоматически проставить тип персонала
        SelectTypePost.Close;
        SelectTypePost.ParamByName('Id_Post_Salary').AsInteger := PosadOkladEdit.Value;
        SelectTypePost.ParamByName('Id_Department').AsInteger := DepartmentEdit.Value;
        SelectTypePost.ParamByName('Act_Date').AsDate := cxDateBegEdit.Date;
        SelectTypePost.Open;

        SelectTypePost.FetchAll;
        if SelectTypePost.RecordCount = 1 then
        begin
            PersonalTypeEdit.Value := SelectTypePost['Id_Type_Post'];
            PersonalTypeEdit.DisplayText := SelectTypePost['Name_Type_Post'];
            if (not VarIsNull(SelectTypePost['IS_PED_WORK'])) then
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
        end
            //        else
            //            qFSC_TypePost.Blocked := False;
    end;
end;

procedure TfrmAddMoving.DateBegEditChange(Sender: TObject);
begin
    if not isContinue then
    begin
        PosadOkladEdit.Blocked := VarIsNull(cxDateBegEdit.Date) or VarIsNull(DepartmentEdit.Value);
        FactOkladEdit.Blocked := VarIsNull(cxDateBegEdit.Date) or VarIsNull(DepartmentEdit.Value);
    end;

    LblDateBegEdit.Style.Font.Color := SYS_MASS_NORM_COLOR;
    cxDateBegObrEdit.Date := cxDateBegEdit.Date;
end;

procedure TfrmAddMoving.PosadOkladEditChange(Sender: TObject);
begin
    PersonalTypeEdit.Blocked := VarIsNull(PosadOkladEdit.Value);
    PosadOkladEdit.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.WorkReasonEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
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

    if GetUnivSprav(Params, OutPut) then
    begin
        value := output['ID_WORK_REASON'];
        DisplayText := VarToStr(output['NAME_FULL']);
    end;
    if Value <> 1 then
        cbIsMainPost.Value := False;
end;

procedure TfrmAddMoving.PersonalTypeEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if VarIsNull(DepartmentEdit.Value) then
    begin
        MessageDlg('Спочатку треба обрати посаду!', mtError, [mbYes], -1);
        Exit;
    end;

    SelectTypePost.Close;
    SelectTypePost.ParamByName('Id_Post_Salary').AsInteger := PosadOkladEdit.Value;
    SelectTypePost.ParamByName('Id_Department').AsInteger := DepartmentEdit.Value;
    SelectTypePost.ParamByName('Act_Date').AsDate := cxDateBegEdit.Date;
    SelectTypePost.Open;

    if qSelect(SelectTypePost) then
    begin
        value := SelectTypePost['Id_Type_Post'];
        DisplayText := SelectTypePost['Name_Type_Post'];
        if (not VarIsNull(SelectTypePost['IS_PED_WORK'])) then
        begin
            cntMonth.Visible := (SelectTypePost['IS_PED_WORK'] = 1);
        end
        else
        begin
            cntMonth.Visible := false;
        end;
        lblMonth.Visible := cntMonth.Visible;
        IsPedType := cntMonth.Visible;
    end;
end;

procedure TfrmAddMoving.CondEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
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

    if GetUnivSprav(Params, OutPut) then
    begin
        value := output['ID_ACCEPT_COND'];
        DisplayText := VarToStr(output['NAME_ACCEPT_COND']);
        AcceptSet.Close;
        AcceptSet.SQLs.SelectSQL.Text := 'select date_end, kol_month' +
            ' from asup_accept_calc_dates(:id_accept_cond,:date_beg)';
        AcceptSet.ParamByName('id_accept_cond').AsInteger := value;
        AcceptSet.ParamByName('date_beg').AsDate := cxDateBegEdit.Date;
        AcceptSet.Open;
        if (AcceptSet['kol_month'] <> 0) then
        begin
            cxDateBegObrEdit.Date := cxDateBegEdit.Date;
            cxDateEndObrEdit.Date := AcceptSet['date_end'];
        end
        else
        begin
            cxDateBegObrEdit.EditValue := null;
            cxDateEndObrEdit.EditValue := null;
        end;
    end;
end;

procedure TfrmAddMoving.PayFormEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
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

    if GetUnivSprav(Params, OutPut) then
    begin
        value := output['ID_PAY_FORM'];
        DisplayText := VarToStr(output['NAME_PAY_FORM']);
    end;
end;

procedure TfrmAddMoving.FactOkladEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    if VarIsNull(PosadOkladEdit.Value) then
    begin
        MessageDlg('Спочатку треба обрати штатну посаду!', mtError, [mbYes], -1);
        Exit;
    end;

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

    if GetUnivSprav(Params, OutPut) then
    begin
        value := output['ID_POST_SALARY'];
        DisplayText := VarToStr(output['POST_NAME']);
    end;
end;

procedure TfrmAddMoving.WorkCondEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
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

    if GetUnivSprav(Params, OutPut) then
    begin
        value := output['ID_WORK_COND'];
        DisplayText := VarToStr(output['NAME_WORK_COND']);
    end;
end;

procedure TfrmAddMoving.HospitalEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
{var
    sp: TSprav; }
begin
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
end;

procedure TfrmAddMoving.WorkReasonEditChange(Sender: TObject);
begin
    WorkReasonSelect.Close;
    WorkReasonSelect.Open;
    WorkReasonSelect.Locate('ID_WORK_REASON', WorkReasonEdit.Value, []);

    if WorkReasonSelect['IS_SHTAT'] = 'T' then
        cbIsMainPost.Value := True
    else
        cbIsMainPost.Value := False;

    if WorkReasonSelect['FIX_MAIN_POST'] = 'T' then
        cbIsMainPost.Blocked := True
    else
        cbIsMainPost.Blocked := False;

    WorkReasonSelect.Close;
    WorkReasonEdit.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.DateEndEditChange(Sender: TObject);
begin
    LblDateEndEdit.Style.Font.Color := SYS_MASS_NORM_COLOR;
    cxDateEndObrEdit.Date := cxDateEndEdit.Date;
end;

procedure TfrmAddMoving.HolidayEditChange(Sender: TObject);
begin
    //HolidayEdit.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.HospitalEditChange(Sender: TObject);
begin
    //HospitalEdit.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.DepartmentEditChange(Sender: TObject);
begin
    if isDepartmentEdit then
        DepartmentEdit.LabelColor := SYS_MASS_NORM_COLOR
    else
    begin
        PosadOkladEdit.Blocked := VarIsNull(cxDateBegEdit.Date) or VarIsNull(DepartmentEdit.Value);
        FactOkladEdit.Blocked := VarIsNull(cxDateBegEdit.Date) or VarIsNull(DepartmentEdit.Value);
        DepartmentEdit.LabelColor := SYS_MASS_NORM_COLOR;
    end;
end;

procedure TfrmAddMoving.FactOkladEditChange(Sender: TObject);
begin
    FactOkladEdit.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.PersonalTypeEditChange(Sender: TObject);
begin
    PersonalTypeEdit.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.WorkCondEditChange(Sender: TObject);
begin
    WorkCondEdit.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.PayFormEditChange(Sender: TObject);
begin
    PayFormEdit.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.ReasonEditChange(Sender: TObject);
begin
    ReasonEdit.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.NoteEditChange(Sender: TObject);
begin
    NoteEdit.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.CondEditChange(Sender: TObject);
begin
    CondEdit.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.DateBegObrEditChange(Sender: TObject);
begin
    LblDateBegObrEdit.Style.Font.Color := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.DateEndObrEditChange(Sender: TObject);
begin
    LblDateEndObrEdit.Style.Font.Color := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.PayEditChange(Sender: TObject);
begin
    PayEdit.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.cbIsMainPostChange(Sender: TObject);
begin
    cbIsMainPost.LabelColor := SYS_MASS_NORM_COLOR;
end;

procedure TfrmAddMoving.cbBackChange(Sender: TObject);
begin
    { cbBack.LabelColor := SYS_MASS_NORM_COLOR; }
end;

procedure TfrmAddMoving.cbNoDateEndChange(Sender: TObject);
begin
    cbNoDateEnd.LabelColor := SYS_MASS_NORM_COLOR;
    if cbNoDateEnd.Value = True then
    begin
        cxDateEndEdit.Date := EncodeDate(9999, 12, 31);
        cxDateEndEdit.Enabled := false;
        //cbBack.Value := false;
        //cbBack.Blocked := true;
        cxDateEndEdit.Visible := False;
        LblDateEndEdit.Visible := False;
    end
    else
    begin
        //cbBack.Blocked := false;
        cxDateEndEdit.Enabled := True;
        cxDateEndEdit.Visible := True;
        LblDateEndEdit.Visible := True;
    end;
end;

procedure TfrmAddMoving.SelectSmet;
begin
    try
        DataSetSmet.Close;
        DataSetSmet.ParamByName('ID_SESSION').AsInt64 := id_session;
        if MassEdit then
            DataSetSmet.ParamByName('ID_ORDER_ITEM').AsVariant := Null
        else
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
    except on E: Exception do
        begin
            ShowMessage(E.Message);
        end;
    end;
end;

procedure TfrmAddMoving.btnEditClick(Sender: TObject);
var
    frm: TfrmAddSmet;
    id_rec: int64;
begin
    frm := TfrmAddSmet.Create(Self);
    frm.Caption := 'Змінити ' + frm.Caption;
    frm.Smet.Value := DataSetSmet['ID_SMET'];
    frm.Smet.DisplayText := DataSetSmet['SMETA_NAME'];
    frm.PPSSmet.Value := DataSetSmet['ID_SMET_PPS'];
    frm.PPSSmet.DisplayText := DataSetSmet['SMETA_PPS_NAME'];
    frm.PPSVal.Value := DataSetSmet['KOEFF_PPS'];
    frm.RateCount.Value := DataSetSmet['RATE_COUNT'];
    id_rec := TFIBBCDField(DataSetSmet.FBN('ID_REC')).AsInt64;

    if frm.ShowModal = mrOk then
    begin
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

    end;
    frm.Free;
end;

procedure TfrmAddMoving.AddBonus;
var
    frm: TfmMoveBonusEdit;
begin
    frm := TfmMoveBonusEdit.Create(Self);
    frm.Caption := 'Додати ' + frm.Caption;
    frm.Smets.Database := Database;
    frm.Smets.Transaction := WriteTransaction;
    frm.RaiseDefaults.Database := Database;
    frm.RaiseDefaults.Transaction := WriteTransaction;
    frm.id_session := id_session;
    frm.mode := 1;

    if frm.ShowModal = mrOk then
    begin
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
    end;
    frm.Free;
end;

procedure TfrmAddMoving.DelBonus;
begin
    StoredProcSmet.Close;
    StoredProcSmet.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_MOV_DEL';
    StoredProcSmet.ParamByName('ID_REC').AsInt64 := DataSetNad['ID_REC'];
    StoredProcSmet.ParamByName('KEY_SESSION').AsInt64 := id_session;
    StoredProcSmet.ParamByName('ID_ORDER_ITEM_IN').AsInt64 := id_order_item;

    StoredProcSmet.ExecProc;
    StoredProcSmet.Close;

    DataSetNad.CacheDelete;
end;

procedure TfrmAddMoving.cxGridDBBandedTableView2KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((DataSetSmet.RecordCount > 0) and (Key = VK_F12)
        and (ssShift in Shift)) then
        ShowInfo(DataSetSmet);
end;

procedure TfrmAddMoving.cxGridDBBandedTableView4KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((DataSetNad.RecordCount > 0) and (Key = VK_F12)
        and (ssShift in Shift)) then
        ShowInfo(DataSetNad);
end;

procedure TfrmAddMoving.AbsentChange(Sender: TObject);
begin
    Absent.LabelColor := SYS_MASS_NORM_COLOR;
    if {FormControl.Mode <> fmInfo} TfrmMoveOrder(owner).Mode <> 2 then
    begin
        if VarIsNull(Absent.Value) then
        begin
            //WorkReasonEdit.Blocked := False;
            WorkReasonEdit.AutoSaveToRegistry := True;
        end
        else
        begin
            WorkReasonEdit.AutoSaveToRegistry := False;
            //WorkReasonEdit.Blocked := True;
        end;
    end;

    if Absent.DisplayText = '' then
    begin
        //Id_Type_Away.Clear;
        //Id_PCard_Away.Clear;
        Id_Type_Away := -1;
        Id_PCard_Away := -1;

    end;
end;

procedure TfrmAddMoving.AbsentOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
const
    INFINITY_DATE = '31.12.9999';
var
    frm: TfmUpAbsentForm;
begin
    frm := TfmUpAbsentForm.Create(Self);
    frm.IniAwayType.Database := Database;
    frm.IniAwayType.Transaction := ReadTransaction;
    frm.AwayInfo.Database := Database;
    frm.AwayInfo.Transaction := ReadTransaction;
    frm.ConstSet.Database := Database;
    frm.ConstSet.Transaction := ReadTransaction;

    //if TfrmMoveOrder(owner).Mode <> 1 then
    if not VarIsNull(Absent.Value) then
    begin
        frm.Prepare(Id_Type_Away, Id_PCard_Away,
            Absent.Value);
    end;

    if frm.ShowModal = mrOk then
    begin
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

        if frm.Locate_Id_Type_Away then
        begin
            // WorkReasonEdit.Value := frm.Id_Work_Reason_W;
            // WorkReasonEdit.DisplayText := frm.Name_Work_Reason_W;
            DisplayText := frm.Name_Type_Away_W + ' працівника '
                + frm.Id_PCard_Away.DisplayText;
            if not VarIsNull(frm.Id_Key.Value) then
            begin
                DisplayText := DisplayText + ' (підстава: ' + frm.Reason + ')';
            end;
        end;

    end;
    frm.Free;

end;

function TfrmAddMoving.CheckVacById_Us: Boolean;
var
    IUStoredProc: TpFibStoredProc;
    Res: Integer;
begin
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

    if (Res = 1) then
        Result := true
    else
        Result := false;
end;

procedure TfrmAddMoving.AddIdShrClick(Sender: TObject);
begin
    if (IdShr.Text = '') then
        agMessageDlg('Увага!', 'Не можна додавати позицію, якщо не заповнено поле "Ідентифікатор ШР"!', mtInformation, [mbOk]);

    if (((IdShr.Text = '') and (RateCount.Value = Null)) or ((IdShr.Text = '') and (cntHours.Text = ''))) then
        exit;

    DSetIdShR.Close;
    DSetIdShR.Open;

    if CheckShR then
    begin
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
    end;

end;

procedure TfrmAddMoving.DelIdShRClick(Sender: TObject);
begin
    {    if ShRDataSet.Active
            then if ShRDataSet.RecordCount > 0
            then ShRDataSet.Delete;}
    if DSetIdShR.RecordCount > 0 then
    begin
        InsertShR.StoredProcName := 'UP_ACCEPT_SH_R_DEL_IDSHR';
        InsertShR.Prepare;
        InsertShR.ParamByName('KEY_SESSION').AsInt64 := id_session;
        InsertShR.ParamByName('ID_SH_R').AsInt64 := DSetIdShR['ID_SH_R'];
        InsertShR.ExecProc;
        FindOnIdShr(false);
        DSetIdShR.Close;
        DSetIdShR.Open;
    end;
    if DSetIdShR.IsEmpty then
    begin
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
    end;
end;

procedure TfrmAddMoving.ShowButtonClick(Sender: TObject);
begin
    if (ShowButton.Caption = '<<') then
    begin
        if not DSetIdShR.Active then
            DSetIdShR.Active := True;
        ShowButton.Caption := '>>';
        IdShrPanel.Align := alClient;
        Panel_Bottom.Align := alBottom;
        IdShrPanel.Visible := True;

        AddIdShr.Visible := True;
        Panel_Bottom.Visible := False;

    end
    else
    begin
        ShowButton.Caption := '<<';
        IdShrPanel.Align := alTop;
        Panel_Bottom.Align := alCustom; //alClient;
        IdShrPanel.Visible := false;
        AddIdShr.Visible := false;
        Panel_Bottom.Visible := True;
        Panel2.Top := Panel_Bottom.Top + Panel_Bottom.Height;
    end;
end;

function TfrmAddMoving.CheckShR: Boolean;
var
    IUStoredProc: TpFibStoredProc;
    Res: Integer;
    Mess: string;
begin
    Res := 1;
    IUStoredProc := TpFibStoredProc.Create(self);
    IUStoredProc.Database := Database;
    IUStoredProc.Transaction := ReadTransaction;
    IUStoredProc.StoredProcName := 'UP_ACCEPT_CHECK_SH_R';

    if DSetIdShR.RecordCount > 0 then
    begin
        DSetIdShR.First;
        while (not DSetIdShR.Eof) and (Res = 1) do
        begin
            if DSetIdShR.FieldByName('ID_SH_R').Value = IdShr.Value then
            begin
                Res := 0;
                agMessageDlg('Увага!', 'Не можна додавати однакові значення ідентифікатору ШР!', mtInformation, [mbOk]);
            end
            else
            begin
                IUStoredProc.Prepare;
                IUStoredProc.ParamByName('ID_SH_R').Value := DSetIdShR.FieldByName('ID_SH_R').Value;
                IUStoredProc.ParamByName('ID_SH_R_PROV').Value := IdShr.Value;
                IUStoredProc.ExecProc;
                Res := IUStoredProc.ParamByName('RESULT').Value;
                Mess := IUStoredProc.ParamByName('MESS').Value;
                if Res = 0 then
                    agMessageDlg('Увага!', Mess, mtInformation, [mbOk]);
                DSetIdShR.Next;
            end;
        end;
        IUStoredProc.Free;
    end
    else
    begin
        IUStoredProc.Prepare;
        IUStoredProc.ParamByName('ID_SH_R').Value := Null;
        IUStoredProc.ParamByName('ID_SH_R_PROV').Value := IdShr.Value;
        IUStoredProc.ExecProc;
        Res := IUStoredProc.ParamByName('RESULT').Value;
        Mess := IUStoredProc.ParamByName('MESS').Value;
        if Res = 0 then
            agMessageDlg('Увага!', Mess, mtInformation, [mbOk]);
    end;

    if (Res = 1) then
        Result := true
    else
        Result := false;
end;

procedure TfrmAddMoving.FindOnIdShr(Flag: Boolean);
var
    OldValue, i: integer;
begin
    if Flag then
    begin
        {поля не заполнены, в таблице ничего нет}
        if ((DSetIdShR.RecordCount = 0) and
            ((IdShr.Text = '') and ((RateCount.Text = '') or (cntHours.Text = '')))) then
        begin
            agMessageDlg('Увага!', 'За введеним(-и) ідентифікатором(-ами) ШР дані не знайдено!', mtInformation, [mbOk]);
            DepartmentEdit.Blocked := False;
            PosadOkladEdit.Blocked := False;
            PersonalTypeEdit.Blocked := False;
            exit;
        end;

        if (IdShr.Text = '') then
        begin
            agMessageDlg('Увага!', 'Не можна додавати позицію, якщо не заповнено поле "Ідентифікатор ШР"!', mtInformation, [mbOk]);
            DepartmentEdit.Blocked := False;
            PosadOkladEdit.Blocked := False;
            PersonalTypeEdit.Blocked := False;
            Exit;
        end;

        if (IdShr.Text <> '') then
        begin
            if ((RateCount.Text = '') and (cntHours.Text = '')) then
            begin
                agMessageDlg('Увага!', 'Не можна додавати позицію, якщо не заповнено поле "Кількість ставок" або "Кількість годин"!', mtInformation, [mbOk]);
                DepartmentEdit.Blocked := False;
                PosadOkladEdit.Blocked := False;
                PersonalTypeEdit.Blocked := False;
                Exit;
            end;

            if ((RateCount.Text <> '') and (cntHours.Text <> '')) then
            begin
                agMessageDlg('Увага!', 'Треба заповнити поле або "Кількість ставок" або "Кількість годин"!', mtInformation, [mbOk]);
                DepartmentEdit.Blocked := False;
                PosadOkladEdit.Blocked := False;
                PersonalTypeEdit.Blocked := False;
                Exit;
            end;
        end;

        if ((IdShr.Text <> '') and ((RateCount.Text <> '') or (cntHours.Text <> ''))) then
        begin
            {добавляем данные в таблицу}
            //DSetIdShR.Close;
            //DSetIdShR.Open;

            if CheckShR then
            begin
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
                RateCount.Text := '';
                cntHours.Text := '';
            end
            else
            begin
                exit;
            end;
        end;

        SaveDataOnIdShr;
        FactOkladEdit.Blocked := False;

        {разворачиваем таблицу, по которой будет выполнятся поиск}
        if (ShowButton.Caption = '<<') then
        begin
            if not DSetIdShR.Active then
                DSetIdShR.Active := True;
            ShowButton.Caption := '>>';
            IdShrPanel.Align := alClient;
            Panel_Bottom.Align := alBottom;
            IdShrPanel.Visible := True;

            AddIdShr.Visible := True;
            Panel_Bottom.Visible := False;
        end;
    end;
end;

procedure TfrmAddMoving.SaveDataOnIdShr;
var
    OldValue, i: integer;
begin
    {если есть данные для поиска, то ищем}
    if (DSetIdShR.RecordCount > 0) then
    begin
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

        try
            IdShRSelect.Close;
            IdShRSelect.SelectSQL.Text := 'SELECT * FROM UP_DT_ID_SH_R_SELECT(:DATE_BEG, :DATE_END, :KEY_SESSION, :ID_PCARD)';
            IdShRSelect.ParamByName('DATE_BEG').AsDate := cxDateBegEdit.Date;
            IdShRSelect.ParamByName('DATE_END').AsDate := cxDateEndEdit.Date;
            IdShRSelect.ParamByName('KEY_SESSION').AsInt64 := id_session;
            IdShRSelect.ParamByName('ID_PCARD').Value := IdPcard; //id_pcard;
            IdShRSelect.Open;
            IdShRSelect.FetchAll;

            if IdShRSelect.RecordCount > 0 then
            begin
                if VarIsNull(IdShRSelect['Id_Department']) then
                begin
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
                end;

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

                cntMonth.Visible := (IdShRSelect['is_ped_work'] = 1);
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

                if SmetShR.RecordCount > 0 then
                begin
                    StoredProcSmet.StoredProcName := 'UP_DT_MAN_MOVING_BUFF_DEL_ALL';
                    StoredProcSmet.Prepare;
                    StoredProcSmet.ParamByName('KEY_SESSION').AsInt64 := id_session;
                    try
                        StoredProcSmet.ExecProc;
                    except
                        StoredProcSmet.Close;
                        exit;
                    end;

                    StoredProcSmet.Close;
                    StoredProcSmet.StoredProcName := 'UP_DT_MAN_SMET_BUFF_MOV_INS';
                    SmetShR.First;
                    for i := 0 to SmetShR.RecordCount - 1 do
                    begin
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
                    end;
                end;

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
            end
            else
            begin
                agMessageDlg('Увага!', 'За введеним(-и) ідентифікатором(-ами) ШР дані не знайдено!', mtInformation, [mbOk]);
            end;

        except on e: Exception do
            begin
                ShowMessage(e.Message);
                FindIdShR.Enabled := True;
                IdShr.Properties.ReadOnly := False;
                IdShr.Style.Color := clWindow;
                RateCount.Enabled := true;
                DepartmentEdit.Blocked := False;
                PosadOkladEdit.Blocked := False;
                PersonalTypeEdit.Blocked := False;
            end;
        end;
        FindIdShR.Enabled := True;
        IdShr.Properties.ReadOnly := False;
        IdShr.Style.Color := clWindow;
        RateCount.Enabled := true;
    end;
end;

procedure TfrmAddMoving.Act_Find_Id_ShRExecute(Sender: TObject);
begin
    FindOnIdShr(true);
end;

procedure TfrmAddMoving.cxDateBegEditPropertiesChange(Sender: TObject);
begin
    if IsEditSmet then
    begin
        if cxDateBegEdit.Date < Date_B then
        begin
            agMessageDlg('Увага!', 'Початок не може бути менш ніж дата початку трудового договору!', mtError, [mbOk]);
            cxDateBegEdit.SetFocus;
            cxDateBegEdit.Style.Color := clRed;
            Exit;
        end;
    end;
    FillWorkModeDSet(WMByPeriodSet, cxDateBegEdit.Date, cxDateEndEdit.Date, IdWorkMode, Null, Null, ShiftEdit.Value, 7);
    FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
end;

procedure TfrmAddMoving.ShiftEditPropertiesChange(Sender: TObject);
begin
    if ShiftEdit.Value > MaxBound - 1 then
        ShiftEdit.Value := MaxBound - 1;
    if ShiftEdit.Value < 0 then
        ShiftEdit.Value := 0;
    FillWorkModeDSet(WMByPeriodSet, cxDateBegEdit.Date, cxDateEndEdit.Date, IdWorkMode, Null, Null, ShiftEdit.Value, 7);
    FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
end;

procedure TfrmAddMoving.cxDateEndEditPropertiesChange(Sender: TObject);
begin
    FillWorkModeDSet(WMByPeriodSet, cxDateBegEdit.Date, cxDateEndEdit.Date, IdWorkMode, Null, Null, ShiftEdit.Value, 7);
    FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
end;

procedure TfrmAddMoving.WorkModeSpravPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
var
    res: Variant;
    Parameter: TTuSimpleParam;
begin
    Parameter := TTuSimpleParam.Create;
    Parameter.DB_Handle := Database.Handle;
    Parameter.Owner := self;
    Parameter.CFStyle := tfsModal;
    res := DoFunctionFromPackage(Parameter, Tu_SpWorkMode_Pack);
    if VarIsArray(res) then
    begin
        IdWorkMode := res[0];
        WorkModeSprav.Text := res[1];
        MaxBound := res[2];
    end;
    FillWorkModeDSet(WMByPeriodSet, cxDateBegEdit.Date, cxDateEndEdit.Date, IdWorkMode, Null, Null, ShiftEdit.Value, 7);
    FillWorkModeGrid(WorkModeGridTableView1, WMByPeriodSet);
    Parameter.Destroy;
end;

procedure TfrmAddMoving.EditBonusSmetExecute(Sender: TObject);
var
    frm: TfmMoveBonusEdit;
    er: string;
    Id: Integer;
    SmDateBeg, SmDateEnd: TDate;
begin
    if cxPageControl1.ActivePage = cxTabSheet1 then
        Exit;
    if ((btnEditBonusSmet.Visible = ivNever) or (btnEditBonusSmet.Enabled = False)) then
        Exit;
    if ((IsEditSmet) and (DataSetNad['id_calc_type'] <> 1)
        and (DataSetNad['id_calc_type'] <> 4)) then
        Exit;
    Id := DataSetNad['id_rec'];
    frm := TfmMoveBonusEdit.Create(Self);
    frm.NumBon.Blocked := True;
    frm.IdRaise.Blocked := True;
    frm.Percent.Blocked := True;
    frm.Summa.Blocked := True;
    frm.Kod_Sm_Pps.Blocked := True;
    if IsEditSmet then
        frm.All_Periods.Blocked := True
    else
    begin
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
    end;
    frm.IdRaise.Required := False;
    frm.IdRaise.DisplayText := DataSetNad['raise_name'];
    if DataSetNad['percent'] = DataSetNad['summa'] then
        frm.Summa.Value := DataSetNad['summa']
    else
        frm.Percent.Value := DataSetNad['percent'];
    frm.Smeta.Value := DataSetNad['id_smet'];
    frm.Smeta.DisplayText := DataSetNad['Smeta_Name'];
    if not VarIsNull(DataSetNad['Id_Smet_Pps']) then
    begin
        frm.Kod_Sm_Pps.Value := DataSetNad['Id_Smet_Pps'];
        frm.Kod_Sm_Pps.DisplayText := DataSetNad['Smeta_Pps_Name'];
    end;
    frm.cxDateBeg.Date := DataSetNad['date_beg'];
    SmDateBeg := DataSetNad['date_beg'];
    frm.cxDateEnd.Date := DataSetNad['date_end'];
    SmDateEnd := DataSetNad['date_end'];
    if frm.ShowModal = mrOk then
    begin
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
        if er <> 'No' then
            agMessageDlg('Увага!', er, mtInformation, [mbOK]);
    end;
    SelectSmet;
    SelectNad;
    frm.Free;
    DataSetNad.Locate('Id_Rec', Id, []);
end;

procedure TfrmAddMoving.cxTabSheet3Show(Sender: TObject);
begin
    if IsEditSmet = True then
    begin
        btnAdd.Visible := ivNever;
        btnDelete.Visible := ivNever;
    end;
    //else btnEditBonusSmet.Visible:=ivNever;
end;

procedure TfrmAddMoving.cxTabSheet2Show(Sender: TObject);
begin
    btnAdd.Visible := ivAlways;
    btnDelete.Visible := ivAlways;
end;

procedure TfrmAddMoving.ActAddExecute(Sender: TObject);
var
    frm: TfrmAddSmet;
    mov_dost: Boolean;
begin
    try
        if cxPageControl1.ActivePage = cxTabSheet1 then
            Exit;
        if ((btnAdd.Visible = ivNever) or (btnAdd.Enabled = False)) then
            Exit;
        if cxPageControl1.ActivePageIndex = 2 then
        begin
            AddBonus;
            exit;
        end;

        frm := TfrmAddSmet.Create(Self);
        frm.Caption := 'Додати ' + frm.Caption;

        frm.mov_dostup := False;
        if CheckVacById_Us then
            frm.mov_dostup := True
        else
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

        if frm.ShowModal = mrOk then
        begin
            StoredProcSmet.Close;
            StoredProcSmet.StoredProcName := 'UP_DT_MAN_SMET_BUFF_MOV_INS';
            StoredProcSmet.Prepare;
            StoredProcSmet.ParamByName('ID_SMET').AsInt64 := frm.Smet.Value;
            if frm.PPSSmet.Value = null then
                StoredProcSmet.ParamByName('ID_SMET_PPS').Value := null
            else
                StoredProcSmet.ParamByName('ID_SMET_PPS').AsInt64 := frm.PPSSmet.Value;
            if frm.PPSVal.Value = null then
                StoredProcSmet.ParamByName('KOEFF_PPS').Value := null
            else
                StoredProcSmet.ParamByName('KOEFF_PPS').AsDouble := frm.PPSVal.Value;
            StoredProcSmet.ParamByName('RATE_COUNT').AsDouble := StrToFloat(frm.RateCount.Text);
            StoredProcSmet.ParamByName('KEY_SESSION').AsInt64 := id_session;
            StoredProcSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
            StoredProcSmet.ParamByName('ID_SH_R').AsVariant := null; //добавлено без идентификатора ШР
            if frm.cntHours.Text = '' then
                StoredProcSmet.ParamByName('HOURS_COUNT').AsDouble := 0
            else
                StoredProcSmet.ParamByName('HOURS_COUNT').AsCurrency := frm.cntHours.Value;
            StoredProcSmet.ExecProc;
            StoredProcSmet.Close;
            SelectSmet;
            rc2 := DataSetSmet['SUM_RATE_COUNT']; //f
        end;
        frm.Free;
    except on E: Exception do
        begin
            ShowMessage(e.Message);
        end;
    end;
end;

procedure TfrmAddMoving.ActDelExecute(Sender: TObject);
begin
    try
        if cxPageControl1.ActivePage = cxTabSheet1 then
            Exit;
        if ((btnDelete.Visible = ivNever) or (btnDelete.Enabled = False)) then
            Exit;

        if cxPageControl1.ActivePageIndex = 2 then
        begin
            DelBonus;
            exit;
        end;

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
        if not VarIsNull(DataSetSmet['Sum_Rate_Count']) then
            rc2 := DataSetSmet['Sum_Rate_Count'];
    except on E: Exception do
        begin
            ShowMessage(E.Message);
        end;
    end;
end;

procedure TfrmAddMoving.cntMonthKeyPress(Sender: TObject; var Key: Char);
begin
    if ((Key = #8) or (Key in ['0'..'9'])) then
        cntMonth.Properties.ReadOnly := false
    else
        cntMonth.Properties.ReadOnly := true;
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

//Диалог с пользователем после проверки даты перемещение и обрання

function tfrmaddmoving.checkOrderDialog: boolean;
var
    dialog: TForm;
    btnOne, btnTwo, btnEdit, btnSave: TBitBtn;
    messageText: string;
begin
    messageText := 'Термін закінчення дії контракту ';

    if (cxDateEndObrEdit.Date > cxDateEndEdit.Date) then
        messageText := messageText + 'більший';

    if (cxDateEndObrEdit.Date < cxDateEndEdit.Date) then
        messageText := messageText + 'менший';

    messageText := messageText + ' за' + #13#10 +
        'термін закінчення нового переміщення.' + #13#10 + #13#10 +
        'Термін дії контракту: ' + DateToStr(cxDateBegObrEdit.Date) +
        ' - ' + DateToStr(cxDateEndObrEdit.Date) + '.' + #13#10 +
        'Термін нового переміщення: ' + DateToStr(cxDateBegEdit.Date) +
        ' - ' + DateToStr(cxDateEndEdit.Date) + '.';

    dialog := CreateMessageDialog(messageText
        , mtWarning, []);

    dialog.Caption := ' Увага';

    btnOne := TBitBtn.Create(dialog);
    btnOne.Caption := 'Повернутись до редагування';
    btnOne.Parent := dialog;
    btnOne.Default := True;
    btnOne.ModalResult := mrCancel;
    btnOne.Cancel := True;
    btnOne.Width := 190;
    btnOne.Top := dialog.ClientHeight - btnOne.Height - 10;
    btnOne.Left := 15;

    btnTwo := TBitBtn.Create(dialog);
    btnTwo.Caption := 'Продовжити збереження';
    btnTwo.Parent := dialog;
    btnTwo.ModalResult := mrOk;
    btnTwo.Width := 190;
    btnTwo.Top := dialog.ClientHeight - btnTwo.Height - 10;
    btnTwo.Left := btnOne.Left + btnOne.Width + 10;

    dialog.Width := btnTwo.Left + btnTwo.Width + 20;

    if dialog.ShowModal = mrOk then
        Result := True
    else
        Result := False;

    btnOne.Free;
    btnTwo.Free;
    dialog.Free;
end;

// Функция проверки правильности даты перемещения и обрання

function TfrmAddMoving.checkOrder: Boolean;
var
    checkVariant: integer;
begin
    if (CondEdit.Value <> null) and (cxDateEndObrEdit.Text<>'') then
    begin
        if isContinue then
            checkVariant := 0;
        if isEditSmet then
            checkVariant := 0;
        if isWorkModeEdit then
            checkVariant := 0;
        if isDepartmentEdit then
            checkVariant := 0;
        if isChangeTeachingLoad then
            checkVariant := 0;
        if isTemp then
            checkVariant := 1;

        result := True;

        if (checkVariant = 0) then
        begin
            if (cxDateEndEdit.Date <> cxDateEndObrEdit.Date) then
            begin
                result := False;
            end;
        end
        else
        begin
            if not (cxDateEndEdit.Date <= cxDateEndObrEdit.Date) then
            begin
                result := False;
            end;
        end;
    end;
end;

end.

