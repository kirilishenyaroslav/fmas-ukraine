
{ -$Id: PCardsDetailsUnit.pas,v 1.30 2008/03/18 14:41:59 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Информация по личной карточке"                 }
{    Отображение и редактирование информации по личной карточке.               }
{    Ответственный:Данил Збуривский.                                           }

unit PCardsDetailsUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ComCtrls, StdCtrls, Buttons, Mask, CheckEditUnit, Db, IBCustomDataSet,
    IBQuery, DBCtrls, IB, IBErrorCodes, SpWarpostUnit, SpComboBox, IBTable,
    ExtCtrls, FieldControl, EditControl, PersonalCommon,
    Grids, DBGrids, ToolWin, MainUnit, ManPunishingUnit, PrivUnit, FR_DSet,
    FR_DBSet, FR_Class, ManAwardUnit, WorkBookUnit, SpCommon, OrdersEditUnit,
    Halcn6db, variants, ADODB, Buffer, DepartmentsViewUnit, PeopleDetailsUnit,
    VoenkomFormUnit,
    cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
    PCardAttrEditUnit, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
    WorkModeChanges, uTimeTable, DateUtils, cxCurrencyEdit, uBuffer2,
    ClipBrd;

type
    TPCardsDetailsForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        FamilyStatusQuery: TIBQuery;
        FamilyStatusSource: TDataSource;
        ValidTable: TIBTable;
        ValidDataSource: TDataSource;
        WarQuery: TIBQuery;
        WarQueryID_CATEGORY: TIntegerField;
        WarQueryID_WARPOST: TIntegerField;
        WarQueryWAR_SPEC: TIBStringField;
        WarQueryIS_BRON: TIBStringField;
        WarQueryVOENKOMAT: TIBStringField;
        WarQuerySPECUCHET: TIBStringField;
        WarQueryID_VALID: TIntegerField;
        ManDetailsQuery: TIBQuery;
        ManDetailsQueryID_SEX: TIntegerField;
        ManDetailsQueryFAMILIA: TIBStringField;
        ManDetailsQueryIMYA: TIBStringField;
        ManDetailsQueryOTCHESTVO: TIBStringField;
        ManDetailsQueryRUS_FAMILIA: TIBStringField;
        ManDetailsQueryRUS_IMYA: TIBStringField;
        ManDetailsQueryRUS_OTCHESTVO: TIBStringField;
        ManDetailsQueryBIRTH_DATE: TDateField;
        ManDetailsQueryID_BIRTH_PLACE: TIntegerField;
        WarPostQuery: TIBQuery;
        WarPostQueryNAME_WARSOSTAV: TIBStringField;
        WarPostQueryNAME_WARPOSTGR: TIBStringField;
        ManEducationQuery: TIBQuery;
        ManEducSource: TDataSource;
        ManPrivQuery: TIBQuery;
        PrivSourse: TDataSource;
        PCardsPageControl: TPageControl;
        GeneralPage: TTabSheet;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Label7: TLabel;
        Label11: TLabel;
        Label12: TLabel;
        Label13: TLabel;
        Label14: TLabel;
        Label15: TLabel;
        FC_Familia: TFieldControl;
        FC_RusFamilia: TFieldControl;
        FC_Imya: TFieldControl;
        FC_RusImya: TFieldControl;
        FC_Otchestvo: TFieldControl;
        FC_RusOtchestvo: TFieldControl;
        FC_Birth_Date: TFieldControl;
        BirthDateLabel: TLabel;
        FC_CardNumber: TFieldControl;
        FC_TN: TFieldControl;
        FamiliaEdit: TCheckEdit;
        ImyaEdit: TCheckEdit;
        OtchestvoEdit: TCheckEdit;
        TNEdit: TCheckEdit;
        CardNumberEdit: TCheckEdit;
        PeopleButton: TBitBtn;
        RusFamiliaEdit: TCheckEdit;
        RusImyaEdit: TCheckEdit;
        RusOtchestvoEdit: TCheckEdit;
        EducationPage: TTabSheet;
        EducationGrid: TDBGrid;
        Panel1: TPanel;
        Label24: TLabel;
        Label25: TLabel;
        Label26: TLabel;
        Label27: TLabel;
        Label28: TLabel;
        AkredText: TDBText;
        SpecName: TDBText;
        KvalText: TDBText;
        DiplomText: TDBText;
        DateText: TDBText;
        WarPage: TTabSheet;
        MovesPage: TTabSheet;
        Awards_Encouragment: TTabSheet;
        Bevel1: TBevel;
        PrivelegesPage: TTabSheet;
        Label32: TLabel;
        PunishingSource: TDataSource;
        PunishingQuery: TIBQuery;
        Label44: TLabel;
        PunishingGrid: TDBGrid;
        InfoPanel: TPanel;
        Label34: TLabel;
        OrderBegText: TDBText;
        Label35: TLabel;
        NumBegText: TDBText;
        Label36: TLabel;
        Panel2: TPanel;
        Label37: TLabel;
        Label39: TLabel;
        OrderEndText: TDBText;
        NumEndText: TDBText;
        Label33: TLabel;
        PrivGrid: TDBGrid;
        Panel3: TPanel;
        Label38: TLabel;
        POrderBeg: TDBText;
        Label40: TLabel;
        PItemBeg: TDBText;
        Label41: TLabel;
        Panel4: TPanel;
        Label42: TLabel;
        Label43: TLabel;
        POrderEnd: TDBText;
        PItemEnd: TDBText;
        Label45: TLabel;
        Panel5: TPanel;
        Label46: TLabel;
        DBText1: TDBText;
        Label47: TLabel;
        DBText2: TDBText;
        Label48: TLabel;
        AwardGrid: TDBGrid;
        ManAwardQuery: TIBQuery;
        ManAwardDataSet: TDataSource;
        WorkBookPage: TTabSheet;
        WorkBookGrid: TDBGrid;
        TNQuery: TIBQuery;
        TNQueryCARDNUMBER: TIntegerField;
        TNQueryTN: TIntegerField;
        WorkNote: TDBMemo;
        Label49: TLabel;
        WorkBookQuery: TIBQuery;
        WorkBookSource: TDataSource;
        WorkBookQueryID_MAN_WORK: TIntegerField;
        WorkBookQueryDATE_BEG: TDateField;
        WorkBookQueryDATE_END: TDateField;
        WorkBookQueryUSE_BEG: TDateField;
        WorkBookQueryUSE_END: TDateField;
        MWDeleteQuery: TIBQuery;
        Label29: TLabel;
        StajGrid: TDBGrid;
        StajDaysSource: TDataSource;
        StajDaysQuery: TIBQuery;
        GroupBox1: TGroupBox;
        Label30: TLabel;
        ManMovingSource: TDataSource;
        MovGrid: TDBGrid;
        Label31: TLabel;
        Label50: TLabel;
        DateBegText: TDBText;
        DataEndText: TDBText;
        ManMovingQuery: TIBQuery;
        Label9: TLabel;
        Label10: TLabel;
        StavkiText: TDBText;
        ManDetailsQueryTIN: TIBStringField;
        DetailsQuery: TIBQuery;
        DetailsQueryCARD_NUMBER: TIntegerField;
        DetailsQueryID_FAMILY_STATUS: TIntegerField;
        DetailsQueryTN: TIntegerField;
        DetailsQueryT_UNION: TIBStringField;
        MovCheckBox: TCheckBox;
        Label52: TLabel;
        DismDateText: TDBText;
        FirstDateQuery: TIBQuery;
        FirstDateSource: TDataSource;
        Label53: TLabel;
        MinDateText: TDBText;
        Label54: TLabel;
        MinOrderText: TDBText;
        ManAwardQueryID_MAN_AWARD: TIntegerField;
        ManAwardQueryID_MAN_MOVING: TIntegerField;
        ManAwardQueryID_AWARD: TIntegerField;
        ManAwardQueryNAME_AWARD: TIBStringField;
        ManAwardQueryID_AWARD_TYPE: TIntegerField;
        ManAwardQueryNAME_AWARD_TYPE: TIBStringField;
        ManAwardQueryID_ORDER: TIntegerField;
        ManAwardQueryNUM_ITEM: TIntegerField;
        ManAwardQueryDEPARTMENT_NAME: TIBStringField;
        ManAwardQueryPOST_NAME: TIBStringField;
        ManAwardQueryDATE_ORDER: TDateField;
        ManAwardQueryID_STATUS: TIntegerField;
        ManAwardQueryNUM_ORDER: TIBStringField;
        PunishingQueryID_MAN_PUNISHING: TIntegerField;
        PunishingQueryID_MAN_MOVING: TIntegerField;
        PunishingQueryID_PUNISHING: TIntegerField;
        PunishingQueryNAME_PUNISHING: TIBStringField;
        PunishingQueryFIO: TIBStringField;
        PunishingQueryDEPARTMENT_NAME: TIBStringField;
        PunishingQueryPOST_NAME: TIBStringField;
        PunishingQueryID_ORDER_BEG: TIntegerField;
        PunishingQueryID_STATUS_BEG: TIntegerField;
        PunishingQueryNUM_ITEM_BEG: TIntegerField;
        PunishingQueryNUM_ORDER_BEG: TIBStringField;
        PunishingQueryDATE_ORDER_BEG: TDateField;
        PunishingQueryID_ORDER_END: TIntegerField;
        PunishingQueryNUM_ORDER_END: TIBStringField;
        PunishingQueryNUM_ITEM_END: TIntegerField;
        PunishingQueryDATE_ORDER_END: TDateField;
        PunishingQueryID_STATUS_END: TIntegerField;
        Label55: TLabel;
        PostText: TDBText;
        Label56: TLabel;
        DepText: TDBText;
        Label57: TLabel;
        OrderNumText: TDBText;
        AllMovingSource: TDataSource;
        ManPrivQueryID_MAN_PRIV: TIntegerField;
        ManPrivQueryID_MAN_MOVING: TIntegerField;
        ManPrivQueryID_PRIV: TIntegerField;
        ManPrivQueryNAME_PRIV: TIBStringField;
        ManPrivQueryID_PRIV_TYPE: TIntegerField;
        ManPrivQueryNAME_PRIV_TYPE: TIBStringField;
        ManPrivQueryDEPARTMENT_NAME: TIBStringField;
        ManPrivQueryPOST_NAME: TIBStringField;
        ManPrivQueryID_ORDER_BEG: TIntegerField;
        ManPrivQueryID_STATUS_BEG: TIntegerField;
        ManPrivQueryNUM_ITEM_BEG: TIntegerField;
        ManPrivQueryNUM_ORDER_BEG: TIBStringField;
        ManPrivQueryDATE_ORDER_BEG: TDateField;
        ManPrivQueryID_ORDER_END: TIntegerField;
        ManPrivQueryNUM_ORDER_END: TIBStringField;
        ManPrivQueryNUM_ITEM_END: TIntegerField;
        ManPrivQueryDATE_ORDER_END: TDateField;
        ManPrivQueryID_STATUS_END: TIntegerField;
        Panel6: TPanel;
        Label59: TLabel;
        DepNameText: TDBText;
        Label60: TLabel;
        PostDBText: TDBText;
        DetailsQueryENTER_DATE: TDateField;
        GetIdPCardQuery: TIBQuery;
        GetIdPCardQueryIDPCARD: TIntegerField;
        BufCopyQuery: TIBQuery;
        Panel7: TPanel;
        AddEducButton: TSpeedButton;
        ModifyEducButton: TSpeedButton;
        DetailsEducButton: TSpeedButton;
        Panel8: TPanel;
        DetailsWorkBButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        ModifyWorkBButton: TSpeedButton;
        AddWorkBookButton: TSpeedButton;
        GetBufInfoQuery: TIBQuery;
        GetBufInfoQueryOUT: TIntegerField;
        WorkQuery: TIBQuery;
        ManEducationQueryNAME_SHORT: TIBStringField;
        ManEducationQueryNAME_EDUC: TIBStringField;
        ManEducationQueryDATE_BEG: TDateField;
        ManEducationQueryDATE_END: TDateField;
        ManEducationQueryAKREDITATION: TIntegerField;
        ManEducationQueryNAME_SPEC: TIBStringField;
        ManEducationQueryNAME_KVAL: TIBStringField;
        ManEducationQueryDIPLOM_DATE: TDateField;
        WarDeleteQuery: TIBQuery;
        Label61: TLabel;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        DetailsQueryKLASS: TIBStringField;
        DetailsQueryINVALID: TIBStringField;
        NachislPage: TTabSheet;
        NachislQuery: TIBQuery;
        NachislSource: TDataSource;
        TotalNachLabel: TLabel;
        ManEducationQueryDIPLOM_NUMBER: TIBStringField;
        TotalUdLabel: TLabel;
        TotalLabel: TLabel;
        ReportDataset: TfrDBDataSet;
        Report: TfrReport;
        CardReportDataSet: TfrDBDataSet;
        CardReport: TfrReport;
        PassQuery: TIBQuery;
        PassQueryNUMBER: TIBStringField;
        PassQuerySERIA: TIBStringField;
        PassQueryDATE_BEG: TDateField;
        PassQueryDATE_END: TDateField;
        PassQueryVIDAN: TIBStringField;
        PassQueryFAMILIA: TIBStringField;
        PassQueryIMYA: TIBStringField;
        PassQueryOTCHESTVO: TIBStringField;
        PassQueryRUS_FAMILIA: TIBStringField;
        PassQueryRUS_IMYA: TIBStringField;
        PassQueryRUS_OTCHESTVO: TIBStringField;
        MovingDataSource: TfrDBDataSet;
        HolidaysQuery: TIBQuery;
        HolidayDataSource: TfrDBDataSet;
        CommentPage: TTabSheet;
        Label68: TLabel;
        CommentQuery: TIBQuery;
        CommentMemo: TMemo;
        FC_Comment: TFieldControl;
        CommentQueryCOMMENT: TIBStringField;
        DetailsQueryRAZRAYD: TIBStringField;
        DetailsQueryPENSIA_DATE: TDateField;
        WarPanel: TPanel;
        Label18: TLabel;
        WarPostBox: TSpComboBox;
        FC_WarPost: TFieldControl;
        Label16: TLabel;
        WarPostGrLabel: TLabel;
        FC_WarPostGroup: TFieldControl;
        Label19: TLabel;
        FC_WarSostav: TFieldControl;
        WarBevel: TBevel;
        Label17: TLabel;
        CategoryComboBox: TComboBox;
        FC_Category: TFieldControl;
        BronCheck: TCheckBox;
        FC_Bron: TFieldControl;
        Label20: TLabel;
        WarSpecEdit: TCheckEdit;
        FC_WarSpec: TFieldControl;
        Label21: TLabel;
        ValidComboBox: TDBLookupComboBox;
        FC_Valid: TFieldControl;
        Label22: TLabel;
        VoenkomatEdit: TCheckEdit;
        VoenkomBtn: TSpeedButton;
        FC_Voenkomat: TFieldControl;
        Label23: TLabel;
        SpecUchetEdit: TCheckEdit;
        FC_SpecUchet: TFieldControl;
        WarDeleteButton: TBitBtn;
        SostavLabel: TLabel;
        WarQueryISWAR: TIBStringField;
        Label70: TLabel;
        ParentPodrName: TDBText;
        FC_ISWAR: TFieldControl;
        IsWarCheck: TCheckBox;
        DelButtonClick: TSpeedButton;
        EducDeleteQuery: TIBQuery;
        FirstDateQueryMIN_DATE: TDateField;
        FirstDateQueryORDER_N: TIBStringField;
        FirstDateQueryID_F_ORDER: TIntegerField;
        Label74: TLabel;
        IsMainText: TDBText;
        Label75: TLabel;
        OkladText: TDBText;
        Label76: TLabel;
        TarstText: TDBText;
        WorkBookQueryNOTE: TIBStringField;
        TableButton: TBitBtn;
        Label77: TLabel;
        DigitText: TDBText;
        RecalcButton: TBitBtn;
        PCardReportQuery: TIBQuery;
        PCardReportQueryFAMILIA: TIBStringField;
        PCardReportQueryIMYA: TIBStringField;
        PCardReportQueryOTCHESTVO: TIBStringField;
        PCardReportQueryADR_BIRTH: TIBStringField;
        PCardReportQueryEDUC_TYPE: TIBStringField;
        PCardReportQueryEDUC_VUZ: TIBStringField;
        PCardReportQueryEDUC_SPEC: TIBStringField;
        PCardReportQueryEDUC_KVAL: TIBStringField;
        PCardReportQueryEDUC_NUM: TIBStringField;
        PCardReportQueryEDUC_DATE: TDateField;
        PCardReportQueryBIRTH_YEAR: TIntegerField;
        PCardReportQueryBIRTH_MONTH: TIntegerField;
        PCardReportQueryBIRTH_DAY: TIntegerField;
        PCardReportQueryCONT_STAJ: TIntegerField;
        PCardReportQueryLAST_WORK: TIBStringField;
        PCardReportQueryDATE_DISMISS: TDateField;
        PCardReportQueryORDER_DISMISS: TIBStringField;
        PCardReportQueryFAMILI_STATUS: TIBStringField;
        PCardReportQueryPASS_SERIA: TIBStringField;
        PCardReportQueryPASS_NOMER: TIBStringField;
        PCardReportQueryPASS_VIDAN: TIBStringField;
        PCardReportQueryPASS_DATE: TDateField;
        PCardReportQueryADR: TIBStringField;
        PCardReportQueryPHONE: TIBStringField;
        PCardReportQueryWAR_GROUP: TIBStringField;
        PCardReportQueryWAR_CATEGORY: TIntegerField;
        PCardReportQueryWAR_SOSTAV: TIBStringField;
        PCardReportQueryWAR_ZVANIE: TIBStringField;
        PCardReportQueryWAR_SPEC: TIBStringField;
        PCardReportQueryWAR_GODEN: TIBStringField;
        PCardReportQueryWAR_VOENKOM: TIBStringField;
        PCardReportQueryWAR_SPEC_UCHET: TIBStringField;
        PCardReportQuerySEX: TIBStringField;
        PCardReportQueryTN: TIntegerField;
        PCardReportQueryCARD_NUM: TIntegerField;
        PCardReportQueryIS_WAR: TIBStringField;
        DetailsQueryWORK_TR: TIBStringField;
        DetailsQueryINOSTR: TIBStringField;
        Label5: TLabel;
        Label8: TLabel;
        FamilyStatusBox: TDBLookupComboBox;
        FC_FamilyStatus: TFieldControl;
        DriverPanel: TGroupBox;
        Label62: TLabel;
        FC_KLASS: TFieldControl;
        KlassEdit: TCheckEdit;
        Label51: TLabel;
        Label6: TLabel;
        FC_TIN: TFieldControl;
        UnionMemberBox: TCheckBox;
        InvalidCheckBox: TCheckBox;
        FC_INVALID: TFieldControl;
        FC_TUNION: TFieldControl;
        FC_EnterDate: TFieldControl;
        Label69: TLabel;
        RazEdit: TCheckEdit;
        FC_RAZRAYD: TFieldControl;
        AdditionalBox: TGroupBox;
        FC_INOSTR: TFieldControl;
        FC_WORK_TR: TFieldControl;
        ForeignWorkerBox: TCheckBox;
        Tr_Box: TCheckBox;
        PensionerPanel: TGroupBox;
        PensiaLabel: TLabel;
        FC_PENSIA_DATE: TFieldControl;
        PensiaCheck: TCheckBox;
        PensiaDate: TDateTimePicker;
        PrintCardButton: TBitBtn;
        ExportButton: TBitBtn;
        Panel10: TPanel;
        AccessDeniedPanel: TPanel;
        PCardReportQueryMAIN_STAJ_YEAR: TIntegerField;
        PCardReportQueryMAIN_STAJ_MONTH: TIntegerField;
        PCardReportQueryKOD_FIRM: TIBStringField;
        AttrPage: TTabSheet;
        AttrToolPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        AttrDelButton: TSpeedButton;
        AttributesGridDBTableView1: TcxGridDBTableView;
        AttributesGridLevel1: TcxGridLevel;
        AttributesGrid: TcxGrid;
        AttrDataSet: TDataSource;
        AttributesDetailsQuery: TIBQuery;
        AttributesDetailsQueryNAME_GROUP: TIBStringField;
        AttributesDetailsQueryNAME_PROPERTY: TIBStringField;
        AttributesDetailsQueryRESULT: TIBStringField;
        AttributesDetailsQueryID_GROUP: TIntegerField;
        AttributesDetailsQueryID_PROPERTY: TIntegerField;
        AttributesGridDBTableView1NAME_GROUP: TcxGridDBColumn;
        AttributesGridDBTableView1NAME_PROPERTY: TcxGridDBColumn;
        AttributesGridDBTableView1RESULT: TcxGridDBColumn;
        PCardsGridStyle: TcxStyleRepository;
        PCardStyle: TcxStyle;
        GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
        cxStyle1: TcxStyle;
        cxStyle2: TcxStyle;
        cxStyle3: TcxStyle;
        cxStyle4: TcxStyle;
        cxStyle5: TcxStyle;
        cxStyle6: TcxStyle;
        cxStyle7: TcxStyle;
        cxStyle8: TcxStyle;
        cxStyle9: TcxStyle;
        cxStyle10: TcxStyle;
        cxStyle11: TcxStyle;
        cxStyle12: TcxStyle;
        cxStyle13: TcxStyle;
        cxStyle14: TcxStyle;
        AttrDeleteQuery: TIBQuery;
        WorkModeChanges: TBitBtn;
        Page2Query: TIBQuery;
        ManAwardQueryID_DEPARTMENT: TIntegerField;
        ManPrivQueryID_DEPARTMENT: TIntegerField;
        PCardReportQueryALL_FAMILY: TIBStringField;
        StajDaysQueryID_STAJ: TIntegerField;
        StajDaysQueryNAME_STAJ: TIBStringField;
        StajDaysQuerySTAJ_YEARS: TIntegerField;
        StajDaysQuerySTAJ_MONTHS: TIntegerField;
        StajDaysQuerySTAJ_DAYS: TIntegerField;
        DBText3: TDBText;
        Label58: TLabel;
        Panel9: TPanel;
        Label64: TLabel;
        Label65: TLabel;
        Label66: TLabel;
        Label67: TLabel;
        PodrText: TDBText;
        PrintButton: TBitBtn;
        WAccountGrid: TcxGrid;
        WAccountView: TcxGridDBTableView;
        WAccountGridLevel1: TcxGridLevel;
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
        NachislQuerySUMMA: TIBBCDField;
        NachislQueryID_VIDOPL: TIntegerField;
        NachislQueryNAME_VIDOPL: TIBStringField;
        NachislQueryTIP_NACH: TIntegerField;
        NachislQueryID_POST: TIntegerField;
        NachislQueryNAME_POST: TIBStringField;
        NachislQueryID_DEPARTMENT: TIntegerField;
        NachislQueryNAME_DEPARTMENT: TIBStringField;
        NachislQueryYEAR_1: TIntegerField;
        NachislQueryMONTH_1: TIntegerField;
        NachislQueryYEAR_2: TIntegerField;
        NachislQueryMONTH_2: TIntegerField;
        WAccountViewSUMMA: TcxGridDBColumn;
        WAccountViewID_VIDOPL: TcxGridDBColumn;
        WAccountViewNAME_VIDOPL: TcxGridDBColumn;
        WAccountViewTIP_NACH: TcxGridDBColumn;
        WAccountViewID_POST: TcxGridDBColumn;
        WAccountViewNAME_POST: TcxGridDBColumn;
        WAccountViewID_DEPARTMENT: TcxGridDBColumn;
        WAccountViewNAME_DEPARTMENT: TcxGridDBColumn;
        WAccountViewYEAR_1: TcxGridDBColumn;
        WAccountViewMONTH_1: TcxGridDBColumn;
        WAccountViewMONTH_2: TcxGridDBColumn;
        WAccountViewYEAR_2: TcxGridDBColumn;
        NachislQuerySUM_WITH_SIGN: TIBBCDField;
        WAccountViewSUM_WITH_SIGN: TcxGridDBColumn;
        WAccountGridLevel2: TcxGridLevel;
        BufferQuery: TIBQuery;
        CheckPCard: TIBQuery;
        Label63: TLabel;
        DateCloseLabel: TLabel;
        DetailsQueryDate_Close: TDateField;
        TopPanel: TPanel;
        OrderDate: TDBText;
        Label71: TLabel;
    ManEducationQueryID_EDUC_KEY: TLargeintField;
        procedure PeopleButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure WarPostBoxChange(Sender: TObject);
        procedure Focus(Sender: TObject);
        procedure BirthDatePickerClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CancelButtonClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure AddEducButtonClick(Sender: TObject);
        procedure ModifyEducButtonClick(Sender: TObject);
        procedure DetailsEducButtonClick(Sender: TObject);
        procedure EditMouseDown(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
        procedure ManEducationQueryDIPLOM_DATEGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure PunishingQueryNUM_ITEM_BEGGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure ManPrivQueryNUM_ITEM_ENDGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);


        procedure PunishingQueryNUM_ITEM_ENDGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure PunishingQueryNUM_ORDER1GetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure AddWorkBookButtonClick(Sender: TObject);
        procedure ModifyWorkBButtonClick(Sender: TObject);
        procedure DetailsWorkBButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ManMovingQueryDATE_ENDGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure TinEditMouseDown(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
        procedure TNEditEnter(Sender: TObject);
        procedure PunishingQueryCalcFields(DataSet: TDataSet);
        procedure ManPrivQueryCalcFields(DataSet: TDataSet);
        procedure UnionMemberBoxMouseDown(Sender: TObject;
            Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure MovCheckBoxClick(Sender: TObject);
        procedure WorkBookQueryDATE_ENDGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure Label53MouseMove(Sender: TObject; Shift: TShiftState; X,
            Y: Integer);
        procedure GeneralPageMouseMove(Sender: TObject; Shift: TShiftState; X,
            Y: Integer);
        procedure FirstDateQueryMIN_DATEGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure PunishingQueryNUM_ORDER_ENDGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure Label53Click(Sender: TObject);
        procedure PunishingGridDrawColumnCell(Sender: TObject;
            const Rect: TRect; DataCol: Integer; Column: TColumn;
            State: TGridDrawState);
        procedure WorkBookGridDrawColumnCell(Sender: TObject;
            const Rect: TRect; DataCol: Integer; Column: TColumn;
            State: TGridDrawState);
        procedure ManPrivQueryNUM_ORDER_ENDGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure PrivGridDrawColumnCell(Sender: TObject; const Rect: TRect;
            DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure WarDeleteButtonClick(Sender: TObject);
        procedure DepartmentButtonClick(Sender: TObject);
        procedure InvalidCheckBoxMouseDown(Sender: TObject;
            Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure PrintButtonClick(Sender: TObject);
        procedure PrintCardButtonClick(Sender: TObject);
        procedure PensiaCheckClick(Sender: TObject);
        procedure VoenkomBtnClick(Sender: TObject);
        procedure IsWarCheckClick(Sender: TObject);
        procedure DelButtonClickClick(Sender: TObject);
        procedure ManMovingQueryIS_MAINGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure TableButtonClick(Sender: TObject);
        procedure RecalcButtonClick(Sender: TObject);
        procedure MovGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure PCardsPageControlChanging(Sender: TObject;
            var AllowChange: Boolean);
        procedure PCardsPageControlMouseMove(Sender: TObject;
            Shift: TShiftState; X, Y: Integer);
        procedure PCardsPageControlChange(Sender: TObject);
        procedure PCardsPageControlMouseDown(Sender: TObject;
            Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure AttrDelButtonClick(Sender: TObject);
        procedure WorkModeChangesClick(Sender: TObject);
        procedure WAccountViewCustomDrawCell(Sender: TcxCustomGridTableView;
            ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
            var ADone: Boolean);
        procedure EducationGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure WorkBookGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);


    private
        function CheckData: Boolean;
        procedure PrepareQueries;
        procedure ShowChangeForm(theMode: TEditMode);
        procedure ShowWorkBookForm(WMode: TEditMode);
    public
        Id_PCard: Integer;
        Id_Man: Integer;
        Id_Department: Integer;
        PodrBKod: string;
        Id_Moving: Integer;
        Id_Man_Sel_Moving: Integer;
        Mode: TEditMode;
        PCardEditControl: TEditControl;
        WarEditControl: TEditControl;
        ManEditControl: TEditControl;
        WarChanged: Boolean;
        Flag: Boolean;
        IDPCARD: Integer;
        Cur_X, Cur_Y: Integer;
        AllMovings: Boolean;
        procedure PrepareForm;
    end;

var
    PCardsDetailsForm: TPCardsDetailsForm;

implementation
uses PCardsViewUnit, PeopleViewUnit, AdressViewUnit, EducationUnit,
    uTableSelectFrame, uExportReport, uShouldClosePCard, qFTools, Math;

{$R *.DFM}
{Коммент}

procedure TPCardsDetailsForm.PrepareQueries;
begin
    Id_Man_Sel_Moving := -1;

    if Id_Man <> -1 then
    begin
        if PCardsPageControl.ActivePage = NachislPage then
        begin
            NachislQuery.Close;
            NachislQuery.ParamByName('Id_PCard').AsInteger := Id_PCARD;
            NachislQuery.Open;
        end;
        if PCardsPageControl.ActivePage = CommentPage then
        begin
            CommentQuery.Params.ParamValues['ID_PCARD'] := ID_PCARD;
            CommentQuery.Open;
            if not (CommentQueryCOMMENT.IsNull) then
                CommentMemo.Lines.Text := CommentQuery['COMMENT'];
            CommentQuery.Close;

        end;

        if PCardsPageControl.ActivePage = GeneralPage then
        begin

            ManDetailsQuery.Params.ParamValues['Id_Man'] := Id_Man;
            ManDetailsQuery.Close;
            ManDetailsQuery.Open;
            DetailsQuery.Params.ParamValues['Id_PCard'] := Id_PCARD;
            DetailsQuery.Close;
            DetailsQuery.Open;
            if DetailsQueryPENSIA_DATE.IsNull then
            begin
                PensiaCheck.Checked := False;
                PensiaLabel.Visible := False;
                PensiaDate.Visible := False;
            end
            else
            begin
                PensiaCheck.Checked := True;
                PensiaLabel.Visible := True;
                PensiaDate.Visible := True;
            end;

            FirstDateQuery.Params.ParamValues['Id_PCard'] := Id_PCard;
            FirstDateQuery.Close;
            FirstDateQuery.Open;

            if not ManDetailsQuery.IsEmpty then
                with FamilyStatusQuery do
                begin
                    Params.ParamValues['Id_Sex'] := ManDetailsQuery['Id_Sex'];
                    Close;
                    Open;
                    FetchAll;
                end;
        end;
    end;

    if PCardsPageControl.ActivePage = Awards_Encouragment then
    begin
        PunishingQuery.Params.ParamValues['Id_PCard'] := Id_Pcard;
        PunishingQuery.Close;
        PunishingQuery.Open;
        ManAwardQuery.Params.ParamValues['Id_PCard'] := Id_Pcard;
        ManAwardQuery.Close;
        ManAwardQuery.Open;
        GridResize(PunishingGrid);
        GridResize(AwardGrid);

    end;

    if PCardsPageControl.ActivePage = PrivelegesPage then
    begin
        ManPrivQuery.Params.ParamValues['Id_PCard'] := Id_Pcard;
        ManPrivQuery.Close;
        ManPrivQuery.Open;
        GridResize(PrivGrid);
    end;

    if PCardsPageControl.ActivePage = WorkBookPage then
    begin
        StajDaysQuery.Params.ParamValues['ID_PCARD'] := Id_Pcard;
        StajDaysQuery.Close;
        StajDaysQuery.Open;
        WorkBookQuery.Params.ParamValues['Id_Pcard'] := Id_Pcard;
        WorkBookQuery.Close;
        WorkBookQuery.Open;
        GridResize(WorkBookGrid);
        GridResize(StajGrid);
    end;

    if PCardsPageControl.ActivePage = EducationPage then
    begin
        try
        ManEducationQuery.Params.ParamValues['Id_Man'] := Id_Man;
        ManEducationQuery.Close;
        ManEducationQuery.Open;
        except on E: Exception do
            ShowMessage(E.Message);
        end;
        GridResize(EducationGrid);
    end;

    if PCardsPageControl.ActivePage = MovesPage then
    begin
        AllMovings := False;
        ManMovingQuery.Params.ParamValues['Id_Pcard'] := Id_Pcard;
        ManMovingQuery.Params.ParamValues['All_Movings'] := 0;
        ManMovingQuery.Close;
        ManMovingQuery.Open;
        GridResize(MovGrid);
        if (Mode <> emNew) and (not VarIsNull(ManMovingQuery['ID_BUHG_DEP']))
            then
        begin
            DepartmentEdit.Text := Coalesce(ManMovingQuery['BUHG_PODR_NAME'], '');
            Id_Department := ManMovingQuery['ID_BUHG_DEP'];
            Id_Moving := ManMovingQuery['ID_Man_MOVING'];
            //PodrBKod := ManMOvingQuery['PODRB_KOD'];
        end;
        if (ManMovingQuery.IsEmpty) then
            DepartmentButton.Enabled := False;
    end;

    if PCardsPageControl.ActivePage = WarPage then
    begin
        WarQuery.Params.ParamValues['Id_PCard'] := Id_PCard;
        WarQuery.Close;
        WarQuery.Open;
        if (WarQuery['IsWar'] = 'F') or (VarIsNull(WarQuery['IsWar'])) then
            WarPanel.Enabled := False;

        if not WarQuery.IsEmpty then
        begin
            WarEditControl.Read;
            WarEditControl.Prepare(Mode);
            WarPostQuery.Params.ParamValues['Id_WarPost'] :=
                WarQuery['Id_WarPost'];
            WarPostQuery.Close;
            WarPostQuery.Open;
        end;
    end;
    if PCardsPageControl.ActivePage = AttrPage then
    begin
        AttributesDetailsQuery.Params.ParamByName('ID_PCARD').Value :=
            ID_PCARD;
        AttributesDetailsQuery.Close;
        AttributesDetailsQuery.Open;

    end;
end;

procedure TPCardsDetailsForm.PrepareForm;
var
    i, k: Integer;
    c: Boolean;
begin
    PCardsPageControl.ActivePageIndex := 0;
    PCardsPageControlChanging(Self, C);
    PrepareQueries;


    case Mode of
        emNew:
            Caption := 'Особисті картки: Додати нову картку ';
        emModify:
            Caption := 'Особисті картки: Редагувати картку ';
        emView:
            Caption := 'Особисті картки: Перегляд ';
    end;

    PCardEditControl.Prepare(Mode);

    if Mode = emNew then
    begin
        WorkBookPage.TabVisible := False;
        EducationPage.TabVisible := False;
        WarPage.TabVisible := False;
        Awards_Encouragment.TabVisible := False;
        MovesPage.TabVisible := False;
        PrivelegesPage.TabVisible := False;
        NachislPage.TabVisible := False;
        CommentPage.TabVisible := False;
        PensiaLabel.Visible := False;
        PensiaDate.Visible := False;
        FC_PENSIA_DATE.Required := False;
        FC_PENSIA_DATE.Value := NULL;
        AttrPage.TabVisible := False;

        Flag := False;
        RecalcButton.Click;
    end;

    ManEditControl.Prepare(Mode);
    if FC_TIN.Value < 0 then Label6.Caption := '';

    if WarQuery.IsEmpty then
        WarEditControl.Prepare(emNew)
    else
        WarEditControl.Prepare(Mode);

    PCardEditControl.SetReadOnly(Mode = emView);
    WarEditControl.SetReadOnly(Mode = emView);
    //	PeopleButton.Enabled := (Mode = emNew);
    if Mode = emView then
    begin
        AddEducButton.Visible := False;
        ModifyEducButton.Visible := False;
        DelButtonClick.Visible := False;
        DetailsEducButton.Left := ModifyEducButton.Left;
        AddWorkBookButton.Visible := False;
        ModifyWorkBButton.Visible := False;
        DeleteButton.Visible := False;
        DetailsWorkBButton.Left := DeleteButton.Left;
        DepartmentButton.Enabled := False;
        KlassEdit.Enabled := False;
        WarDeleteButton.Enabled := False;
//        PeopleButton.Enabled := False;
        DriverPanel.Enabled := False;
        PensionerPanel.Enabled := False;
        AdditionalBox.Enabled := false;
        AttrPage.TabVisible := True;
    end;
    if Mode = emView then IsWarCheck.Enabled := False;

    if Mode = emModify then DepartmentButton.Enabled := True;

    if (Mode = emNew) and (Id_Man <> -1) then
    begin
        PrepareQueries;
        ManEditControl.Prepare(emView);
        PeopleButton.Enabled := False;
    end;

    if (Mode <> emNew) and
        (DetailsQuery['Date_Close'] < StrToDate('31.12.2150'))
        then DateCloseLabel.Caption := 'Картка закрита з ' +
        DateToStr(DetailsQuery['Date_Close']);

    TopPanel.Caption := TNEdit.Text + '. ' + FamiliaEdit.Text + ' ' + ImyaEdit.Text + ' ' +
        OtchestvoEdit.Text;
end;

procedure TPCardsDetailsForm.PeopleButtonClick(Sender: TObject);
var
    form: TPeopleViewForm;
    dform: TPeopleDetailsForm;
    checkForm: TfmShouldClosePCard;
    checkOK: Boolean;
begin
    if Mode = emNew then
    begin
        //Либо вызываем форму со списком всех людей
        form := TPeopleViewForm.Create(Self);
        form.Prepare(True);
        if form.ShowModal = mrOk then
        begin
            //и забираем данные из ResultQuery
            Id_Man := form.ResultQuery['Id_Man'];

                // проверка, вдруг уже есть карточка
            CheckOK := True;

            CheckPCard.Transaction := ReadTransaction;
            CheckPCard.Close;
            CheckPCard.Params.ParamValues['Id_Man'] := Id_Man;
            CheckPCard.Open;
            if not CheckPCard.IsEmpty then
            begin
                checkForm := TfmShouldClosePCard.Create(Self, WriteTransaction, Id_Man);
                checkForm.ShowModal;
                CheckOK := checkForm.CheckOK;
                checkForm.Free;
            end;

            if checkOK then
            begin
                PrepareQueries;
                ManEditControl.Prepare(emView);
                if FC_TIN.Value < 0 then Label6.Caption := '';
            end
            else Id_Man := -1;
        end;
        form.Free;
    end
    else
    begin
        //Либо вызываем фому с информацией по человеку
        dform := TPeopleDetailsForm.Create(Self);
        dform.Prepare(Id_Man, Mode);
        if dform.ShowModal = mrOk then
            PrepareForm;
        dform.Free;
    end;
end;

function TPCardsDetailsForm.CheckData: Boolean;
var
    C: Boolean;
begin
    if Id_Man = -1 then
    begin
        MessageDlg('Не вибрана фізична особа!',
            mtError, [mbOk], 0);

        PCardsPageControl.ActivePage := GeneralPage;
        PCardsPageControlChanging(SElf, C);

        if PCardsPageControl.ActivePage = GeneralPage then
            PeopleButton.SetFocus;

        Result := False;
        Exit;
    end;

    PCardEditControl.Read;
    if not PCardEditControl.CheckFill then
    begin
        Result := False;
        Exit;
    end;


    WarEditControl.Read;
    WarChanged := WarEditControl.Changed;

    Result := True;

    if IsWarCheck.Checked then
    begin
        if WarChanged then

            if not WarEditControl.CheckFill then
            begin
                Result := False;
                Exit;
            end;

        if Flag = True then
        begin
            if (Mode = emNew) and not WarChanged and (ManDetailsQuery['Id_Sex']
                = 1) and IsWarCheck.Checked
                then
                if
                    MessageDlg('Не занесені відомості про війсковій облік.Занести ці данні?',
                    mtWarning, [mbOk, mbCancel], 0) = mrOk then
                begin
                    PCardsPageControl.ActivePage := WarPage;
                    Result := False;
                end
                else
                    Exit;
        end;
    end;
end;

procedure TPCardsDetailsForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
    TN: Integer;
    Ink: string;
    Invalid: Char;
    TUnion: Char;
    First_PBKey, Last_PBKey: Integer;
    IdWorkMode: Integer;
    Klass: string;
    work_Tr: string;
    inostr: string;
    BufTran2: TBufferTransaction2;
    Action_Ltd: Integer;
begin
        // если режим просмотра, ничего не делать
    if Mode = emView then
    begin
        Close;
        Exit;
    end;

        // если чего-то с данными не то, забить
    if not CheckData then Exit;

        // заполнить правильно поля, на всякий случай
    if not PensiaCheck.Checked then FC_PENSIA_DATE.Value := NULL;

    WorkQuery.Transaction := PersonalCommon.WriteTransaction;

        // получить идентификатор личной карточки, если она новая
    if (Mode = emNew) and (Flag = False) then
        IDPCARD := ExecQuery(GetIdPCardQuery);

    if (Mode = emView) or (Mode = EmModify) then IDPCARD := Id_Pcard;

    ok := True;

    BufTran2 := nil;
    if WriteTransaction.Active then WriteTransaction.Rollback;
    WriteTransaction.StartTransaction;
    try
                // если новая карточка, добавить карточку
        if (Mode = emNew) and (Flag = False) then
            ok := ok and PCardEditControl.ExecProc('PRIVATE_CARDS_INSERT', [Id_Man, IDPCARD]);

                // если вторая стадия добавления или изменение - изменить основную информацию
        if ((Mode = emNew) and (Flag = True)) or (Mode = emModify) then
        begin
            PCardEditControl.Read;
            if PensiaCheck.Checked = False then
            begin
                FC_PENSIA_DATE.Required := False;
                FC_PENSIA_DATE.Value := NULL;
            end;
            ok := ok and PCardEditControl.ExecProc('PRIVATE_CARDS_UPDATE', [IDPCARD]);
        end;

            // пишем данные по воинскому учету, если они изменились
        if WarChanged then
            if (Mode = emModify) and not WarQuery.IsEmpty then
                ok := ok and WarEditControl.ExecProc('Man_War_Update', [IDPCARD])
            else ok := ok and WarEditControl.ExecProc('Man_War_Insert', [IDPCARD]);

        if not ok then
        begin
            WriteTransaction.Rollback;
            ModalResult := mrNone;
            Exit;
        end;

            // если получилось, пишем в дублирующий буфер в Interbase
        if ok and not DontWriteToDbf then
        begin
            BufferQuery.Close;
            BufferQuery.ParamByName('Id_PCard').AsInteger := IDPCARD;
            BufferQuery.Open;
            First_PBKey := BufferQuery['First_PBKey'];
            Last_PBKey := BufferQuery['Last_PBKey'];

            BufTran2 := TBufferTransaction2.
                Create('PEP_DATA', 'BUFF_PEP_DATA', WriteTransaction);
            BufTran2.WriteRange(First_PBKey, Last_PBKey);
        end;
        WriteTransaction.Commit;

    except on e: Exception do
        begin
            WriteTransaction.Rollback;
            if BufTran2 <> nil then BufTran2.RollbackOnError;

            MessageDlg('При занесенні інформації виникла помилка: ' +
                e.Message, mtError, [mbOk], 0);
        end;
    end;
    if BufTran2 <> nil then BufTran2.Free;

        // если добавление - добавить скрытые вкладки
    if (Mode = emNew) and (Flag = False) then
    begin
        NachislPage.TabVisible := True;
        WorkBookPage.TabVisible := True;
        EducationPage.TabVisible := True;
        WarPage.TabVisible := True;
        Awards_Encouragment.TabVisible := True;
        MovesPage.TabVisible := True;
        PrivelegesPage.TabVisible := True;
        CommentPage.TabVisible := True;
        AttrPage.TabVisible := True;
        Flag := True;
        MessageDlg('Картка занесена до бази данних.Внесіть додаткову інформацію.',
            mtInformation, [mbOk], 0);
        PeopleButton.Enabled := False;
        Exit;
    end
    else ModalResult := mrOk;
end;


procedure TPCardsDetailsForm.FormCreate(Sender: TObject);
begin
    Id_Moving := -1;
    AttrDeleteQuery.Transaction := PersonalCommon.WriteTransaction;
    AttributesDetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    CommentQuery.Transaction := PersonalCommon.ReadTransaction;
    NachislQuery.Transaction := PersonalCommon.ReadTransaction;
    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    WarQuery.Transaction := PersonalCommon.ReadTransaction;
    ManDetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    GetIdPCardQuery.Transaction := PersonalCommon.ReadTransaction;
    TNQuery.Transaction := PersonalCommon.ReadTransaction;
    WarPostQuery.Transaction := PersonalCommon.ReadTransaction;
    FamilyStatusQuery.Transaction := PersonalCommon.ReadTransaction;
    ValidTable.Transaction := PersonalCommon.ReadTransaction;
    ManEducationQuery.Transaction := PersonalCommon.ReadTransaction;
    PunishingQuery.Transaction := PersonalCommon.ReadTransaction;
    ManPrivQuery.Transaction := PersonalCommon.ReadTransaction;
    ManAwardQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkBookQuery.Transaction := PersonalCommon.ReadTransaction;
    StajDaysQuery.Transaction := PersonalCommon.ReadTransaction;
    ManMovingQuery.Transaction := PersonalCommon.ReadTransaction;
    FirstDateQuery.Transaction := PersonalCommon.ReadTransaction;
    MWDeleteQuery.Transaction := PersonalCommon.WriteTransaction;
    WarDeleteQuery.Transaction := PersonalCommon.WriteTransaction;
    GetBufInfoQuery.Transaction := BufferTransaction;
    EducDeleteQuery.Transaction := PersonalCommon.WriteTransaction;
    PCardReportQuery.Transaction := PersonalCommon.ReadTransaction;
    Page2Query.Transaction := PersonalCommon.ReadTransaction;
    BufferQuery.Transaction := WriteTransaction;




    FamilyStatusQuery.Open;
    ValidTable.Active := True;
    ValidTable.FetchAll;

    PCardEditControl := TEditControl.Create;
    PCardEditControl.Add([FC_CardNumber, FC_TN, FC_FamilyStatus, FC_TUNION,
        FC_EnterDate, FC_KLASS, FC_INVALID, FC_COMMENT, FC_PENSIA_DATE, FC_RAZRAYD,
            FC_WORK_TR, FC_INOSTR]);

    WarEditControl := TEditControl.Create;
    WarEditControl.Add([FC_WarPost, FC_Category, FC_Bron, FC_WarSpec,
        FC_Valid, FC_Voenkomat, FC_SpecUchet, FC_ISWAR, FC_WarPostGroup,
            FC_WarSostav]);

    ManEditControl := TEditControl.Create;
    ManEditControl.Add([FC_Familia, FC_Imya, FC_Otchestvo, FC_RusFamilia,
        FC_RusImya, FC_RusOtchestvo, FC_Birth_Date, FC_TIN]);

    Top := 0;
end;

procedure TPCardsDetailsForm.WarPostBoxChange(Sender: TObject);
begin
    if (WarPostQuery <> nil) and (WarPostQuery.Transaction <> nil)
        and (WarPostBox.ItemIndex > 0) then
    begin
        WarPostQuery.Close;
        WarPostQuery.Params.ParamValues['Id_WarPost'] :=
            WarPostBox.GetId;
        WarPostQuery.Open;
        FC_WarSostav.Prepare;
        FC_WarPostGroup.Prepare;
    end
end;

procedure TPCardsDetailsForm.Focus(Sender: TObject);
begin
    if Sender is TWinControl then
        if (Sender as TWinControl).TabStop = False then
            OkButton.SetFocus;
end;

procedure TPCardsDetailsForm.BirthDatePickerClick(Sender: TObject);
begin
    OkButton.SetFocus;
end;

procedure TPCardsDetailsForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    PCardEditControl.Free;
    WarEditControl.Free;
    ManEditControl.Free;
    WarPostBox.SaveIntoRegistry;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TPCardsDetailsForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TPCardsDetailsForm.FormShow(Sender: TObject);
var
    c: Boolean;
begin

    PCardsPageControl.ActivePage := GeneralPage;
    PCardsPageControlChanging(Self, C);


    if (PCardsPageControl.ActivePage = GeneralPage) then
    begin
        if (PeopleButton.Enabled) then
            PeopleButton.SetFocus
        else
            CardNumberEdit.SetFocus;
    end;

end;

procedure TPCardsDetailsForm.ShowChangeForm(theMode: TEditMode);
var
    form: TEducationForm;
begin
    form := TEducationForm.Create(Self);
    with form do
    begin
        if theMode = emNew then
        begin
            idman := Id_Man;
            id := -1;
        end
        else if not ManEducationQuery.IsEmpty then
        begin
            id := ManEducationQuery['Id_Educ_Key'];
            Idman := Id_Man;
        end
        else
        begin
            idman := Id_Man;
            id := -1;
        end;
    end;

    Form.BirthDate := ManDetailsQuery['Birth_Date'];

    Form.Prepare(theMode, emEducation);
    try
    if form.ShowModal = 1 then
    begin
    
        TRY
        ManEducationQuery.Close;
        ManEducationQuery.Open;
        EXCEPT ON e: eXCEPTION DO
            ShowMessage(E.Message);
        END;


    end;
    {обновляем грид в любом случае}
    ManEducationQuery.Close;
    ManEducationQuery.Open;
    GridResize(EducationGrid);
    form.Free;
     except on E: Exception do
        ShowMessage(E.Message);
    end;
end;

procedure TPCardsDetailsForm.ShowWorkBookForm(WMode: TEditMode);
var
    form: TWorkBookForm;
    idwork: integer;
begin
    form := TWorkBookForm.Create(Self);
    if not WorkBookQuery.IsEmpty then
        idwork := WorkBookQuery['Id_Man_Work']
    else
        idwork := -1;


    if Mode = emNew then
        form.Prepare(WMode, idwork, IDPCARD)
    else
        form.Prepare(WMode, idwork, ID_PCARD);

    if form.ShowModal = mrOk then
    begin

        WorkBookQuery.Close;
        if Mode = emNew then
        begin
            WorkBookQuery.Params.ParamValues['Id_Pcard'] := IDPCARD;
            StajDaysQuery.Params.ParamValues['ID_PCARD'] := IDPCARD;
            StajDaysQuery.Close;
            StajDaysQuery.Open;

        end
        else
        begin
            WorkBookQuery.Params.ParamValues['Id_Pcard'] := ID_PCARD;
            StajDaysQuery.Params.ParamValues['ID_PCARD'] := ID_PCARD;
            StajDaysQuery.Close;
            StajDaysQuery.Open;

        end;
        WorkBookQuery.Open;

    end;

    GridResize(WorkBookGrid);
    GridResize(StajGrid);

end;

procedure TPCardsDetailsForm.AddEducButtonClick(Sender: TObject);
begin
    if Mode <> emView then
        ShowChangeForm(emNew);
end;

procedure TPCardsDetailsForm.ModifyEducButtonClick(Sender: TObject);
begin
    if (not ManEducationQuery.IsEmpty) and (Mode <> emView) then
        ShowChangeForm(emModify);
end;

procedure TPCardsDetailsForm.DetailsEducButtonClick(Sender: TObject);
begin
    if not manEducationQuery.IsEmpty then ShowChangeForm(emView);
end;

procedure TPCardsDetailsForm.EditMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if (Mode = emNew) and (Flag = False) then
    begin
        MessageDlg('Потрібно вибрати фізичну особу!',
            mtWarning, [mbOk], 0);
        PeopleButton.SetFocus;
    end;
    if (Mode = emModify) or ((Flag = True) and (Mode = emNew)) then
        MessageDlg('Ці дані змінюються у довіднику фізичних осіб!',
            mtWarning, [mbOk], 0);

end;




procedure TPCardsDetailsForm.ManEducationQueryDIPLOM_DATEGetText(
    Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if (ManEducationQueryDIPLOM_DATE.asString = '01.01.3333')
        or (ManEducationQueryDIPLOM_DATE.asString = '')

    then
        DateText.Visible := False
    else
    begin
        DateText.Visible := True;
        Text :=
            DateToStr(ManEducationQueryDIPLOM_DATE.AsDateTime);
    end;

end;

procedure TPCardsDetailsForm.PunishingQueryNUM_ITEM_BEGGetText(
    Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if PunishingQueryNUM_ITEM_BEG.asinteger <> 0 then
        Text := PunishingQueryNUM_ITEM_BEG.asstring;

end;

procedure TPCardsDetailsForm.ManPrivQueryNUM_ITEM_ENDGetText(
    Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if ManPrivQuery['ID_STATUS_END'] = 5 then
        Text := ManPrivQueryNUM_ITEM_END.asString
    else
        Text := 'Не знята';


end;

procedure TPCardsDetailsForm.PunishingQueryNUM_ITEM_ENDGetText(
    Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if PunishingQuery['ID_STATUS_END'] = 5 then
        Text := PunishingQueryNUM_ITEM_END.asString
    else
        Text := 'Не знято';

end;




procedure TPCardsDetailsForm.PunishingQueryNUM_ORDER1GetText(
    Sender: TField; var Text: string; DisplayText: Boolean);
begin
    {       if PunishingQueryID_ORDER1.asinteger<>0
           then
                          Text:=PunishingQueryNUM_ORDER1.asString;}

end;

procedure TPCardsDetailsForm.AddWorkBookButtonClick(Sender: TObject);
begin
    ShowWorkBookForm(EmNew);
end;

procedure TPCardsDetailsForm.ModifyWorkBButtonClick(Sender: TObject);
begin
    if not WorkBookQuery.IsEmpty then
        ShowWorkBookForm(emModify)
    else
    begin
        MessageDlg('Немає активних записів!',
            mtError, [mbOk], 0);
        Exit;
    end;
end;

procedure TPCardsDetailsForm.DetailsWorkBButtonClick(Sender: TObject);
begin
    if not WorkBookQuery.IsEmpty then ShowWorkBookForm(emView);
end;

procedure TPCardsDetailsForm.DeleteButtonClick(Sender: TObject);
var
    I: Integer;
    S: string;
begin

    if WorkBookQuery.IsEmpty then
    begin
        MessageDlg('Немає активних записів!',
            mtError, [mbOk], 0);
        Exit;
    end
    else if (MessageDlg('Чи ви справді бажаєте вилучити запис?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
        MWDeleteQuery.SQL.Clear;
        I := WorkBookQuery['Id_Man_Work'];
        Str(I, s);
        MWDeleteQuery.SQL.Add
            ('EXECUTE PROCEDURE Man_WorkBook_Delete ' + s);
        ExecQuery(MWDeleteQuery);
        WorkBookQuery.Close;
        WorkBookQuery.Open;


        if Mode = emNew then
        begin
            StajDaysQuery.Params.ParamValues['ID_PCARD'] := IDPCARD;
            StajDaysQuery.Close;
            StajDaysQuery.Open;

        end
        else
        begin
            StajDaysQuery.Params.ParamValues['ID_PCARD'] := ID_PCARD;
            StajDaysQuery.Close;
            StajDaysQuery.Open;

        end;

    end;



end;

procedure TPCardsDetailsForm.ManMovingQueryDATE_ENDGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
{    if not ManMovingQueryDATE_END.IsNull
        then
        if PersonalCommon.Consts_Query['DATE_END'] = ManMovingQuery['DATE_END']
            then
            Text := 'безстроково'
        else
            Text := DateToStr(ManMovingQuery['DATE_END']);
}
end;

procedure TPCardsDetailsForm.TinEditMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if Mode = emNew then
    begin
        MessageDlg('Потрібно вибрати фізичну особу!',
            mtWarning, [mbOk], 0);
        PeopleButton.SetFocus;
    end;
    if Mode = emModify then
        MessageDlg('Ці дані змінюються у довіднику фізичних осіб!',
            mtWarning, [mbOk], 0);

end;

procedure TPCardsDetailsForm.TNEditEnter(Sender: TObject);
begin
    if Mode = emView then TNEdit.ReadOnly := True;
end;

procedure TPCardsDetailsForm.PCardsPageControlChange(Sender: TObject);
begin
    PrepareQueries;
end;

procedure TPCardsDetailsForm.PunishingQueryCalcFields(DataSet: TDataSet);
begin
    {       if PunishingQueryNUM_ORDER1.value<>'1'
                   then
                    PunishingQueryIsRemoved.Value:='Так'
                 else
                     PunishingQueryIsRemoved.Value:='Ні'}

end;

procedure TPCardsDetailsForm.ManPrivQueryCalcFields(DataSet: TDataSet);
begin
    {        if ManPrivQueryNUM_ORDER1.value<>'1'
                   then
                    PunishingQueryIsRemoved.Value:='Так'
                 else
                     PunishingQueryIsRemoved.Value:='Ні'}


end;

procedure TPCardsDetailsForm.UnionMemberBoxMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if Mode = emView
        then FamiliaEdit.SetFocus;
end;

procedure TPCardsDetailsForm.MovCheckBoxClick(Sender: TObject);
begin
    AllMovings := not AllMovings;
    ManMovingQuery.Close;
    if AllMovings then
        ManMovingQuery.ParamByName('All_Movings').AsInteger := 1
    else ManMovingQuery.ParamByName('All_Movings').AsInteger := 0;
    ManMovingQuery.ParamByName('Id_PCard').AsInteger := Id_PCard;
    ManMovingQuery.Open;
    ManMovingQuery.Last;
end;

procedure TPCardsDetailsForm.WorkBookQueryDATE_ENDGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
var
    D1, D2: TDate;
begin
    if not WorkBookQuery.IsEmpty then
    begin
        D1 := WorkBookQueryDATE_END.AsDateTime;
        D2 := Consts_Query['DATE_END'];
        if D1 = D2 then
            Text := 'не закінчений'
        else
            Text := DateToStr(WorkBookQueryDATE_END.Value);
    end;
end;

procedure TPCardsDetailsForm.Label53MouseMove(Sender: TObject;
    Shift: TShiftState; X, Y: Integer);
begin
    if not (FirstDateQueryMIN_DATE.IsNull) then
    begin
        Label53.Cursor := crHandPoint;
        Label54.Cursor := crHandPoint;
        MinDateText.Cursor := crHandPoint;
        MinOrderText.Cursor := crHandPoint;
        Label53.Font.Color := clBlue;
        Label53.Font.Style := [fsUnderline, fsBold];
        MInDateText.Font.Color := clBlue;
        MinDateText.Font.Style := [fsUnderline, fsBold];
        Label54.Font.Color := clBlue;
        Label54.Font.Style := [fsUnderline, fsBold];
        MInOrderText.Font.Color := clBlue;
        MinOrderText.Font.Style := [fsUnderline, fsBold];
    end;
end;

procedure TPCardsDetailsForm.GeneralPageMouseMove(Sender: TObject;
    Shift: TShiftState; X, Y: Integer);
begin
    if not (FirstDateQueryMIN_DATE.IsNull) then
    begin
        Label53.Cursor := crHandPoint;
        Label54.Cursor := crHandPoint;
        MinDateText.Cursor := crHandPoint;
        MinOrderText.Cursor := crHandPoint;
        Label53.Font.Color := clGreen;
        Label53.Font.Style := [fsBold];
        MInDateText.Font.Color := clBlack;
        MinDateText.Font.Style := [fsBold];
        Label54.Font.Color := clGreen;
        Label54.Font.Style := [fsBold];
        MInOrderText.Font.Color := clBlack;
        MinOrderText.Font.Style := [fsBold];
    end;


end;

procedure TPCardsDetailsForm.FirstDateQueryMIN_DATEGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if FirstDateQueryMIN_DATE.Value = Consts_Query['DATE_END'] then
        Text := ''
    else
        Text := DateToStr(FirstDateQueryMIN_DATE.Value);


end;

procedure TPCardsDetailsForm.PunishingQueryNUM_ORDER_ENDGetText(
    Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if PunishingQuery['ID_STATUS_END'] <> 5 then
        Text := 'Не знято'
    else
        Text := PunishingQueryNUM_ORDER_END.asString;
    {comment}
end;

procedure TPCardsDetailsForm.Label53Click(Sender: TObject);
var
    Temp: TOrdersEditForm;

begin
    if (not FirstDateQueryMIN_DATE.IsNull)
        and (FirstDateQuery['Id_F_Order'] <> -1) then
    begin
        //Создаем новую форму добавления приказа.
        Temp := TOrdersEditForm.Create(Self);
        //Передаем ей параметры
        Temp.FMode := 1;
        Temp.ID_ORDER := FirstDateQuery['ID_F_ORDER'];
        Temp.PrepareForm;
        Temp.ShowModal;

        Temp.Free;
    end;
end;

procedure TPCardsDetailsForm.PunishingGridDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin
    if not PunishingQuery.IsEmpty then
    begin
        if PunishingQuery['ID_STATUS_END'] <> 5 then
            PunishingGrid.Canvas.Brush.Color := RGB(100, 220, 0);
        PunishingGrid.Canvas.FillRect(Rect);

    end;
    PunishingGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TPCardsDetailsForm.WorkBookGridDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin
    if WorkBookQuery['DATE_END'] = Consts_Query['DATE_END'] then
    begin
        WorkBookGrid.Canvas.Brush.Color := RGB(100, 220, 0);
        WorkBookGrid.Canvas.FillRect(Rect);
        WorkBookGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;


    WorkBookGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TPCardsDetailsForm.ManPrivQueryNUM_ORDER_ENDGetText(
    Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if ManPrivQuery['ID_STATUS_END'] <> 5 then
        Text := 'Не знята'
    else
        Text := ManPrivQueryNUM_ORDER_END.asString;

end;

procedure TPCardsDetailsForm.PrivGridDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin
    if ManPrivQuery['ID_STATUS_END'] <> 5 then
        PrivGrid.Canvas.Brush.Color := RGB(100, 220, 0);
    PrivGrid.Canvas.FillRect(Rect);
    {	if (gdSelected in State) then
      PrivGrid.Canvas.Brush.Color := clHighlight;}
    if (gdSelected in State) then
        PrivGrid.Canvas.Font.Color := clWhite
    else
        PrivGrid.Canvas.Font.Color := clBlack;
    PrivGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TPCardsDetailsForm.WarDeleteButtonClick(Sender: TObject);
begin
    if (Mode <> emView) then
    begin
        if MessageDlg('Данні про війсковий облік будут вилучені?',
            mtWarning, [mbOk, mbCancel], 0) = mrOk then
        begin
            WarDeleteQuery.Params.ParamValues['Id_Pcard'] := ID_PCARD;
            WarDeleteQuery.Open;
            PersonalCommon.WriteTransaction.Commit;
            PrepareQueries;
            WarEditControl.Prepare(emModify);
        end;
    end;
end;

procedure TPCardsDetailsForm.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    if MovGrid.DataSource.DataSet.IsEmpty then
    begin
        MessageDlg('Немає переміщень!', mtError, [mbOk], 0);
        Exit;
    end;

    form := TDepartmentsViewForm.Create(Self);
    form.Buhg := True;
    form.Prepare(True, Date);
    form.CanSelectROOT := True;

    if form.ShowModal = mrOk then
        with form do
        begin
            Id_Department := Selected_Id;
            PodrbKod := ResultQuery['ID_Department'];
            if Id_Department = -1 then
                DepartmentEdit.Text := Consts_Query['Firm_Name']
            else
            begin
                DepartmentEdit.Text := ResultQuery['Name_Short'];

                        // обновить подразделение
                WorkQuery.Transaction := PersonalCommon.WriteTransaction;
                WorkQuery.SQL.Text := 'UPDATE Man_Moving SET Buhg_Podr = ' +
                    IntToStr(Id_Department) + ' WHERE Id_Man_Moving = ' +
                    IntToStr(MovGrid.DataSource.DataSet['Id_Man_Moving']);
                ExecQuery(WorkQuery);
            end;
        end;
    form.Free;
end;

procedure TPCardsDetailsForm.InvalidCheckBoxMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if Mode = emView
        then FamiliaEdit.SetFocus;
end;

procedure TPCardsDetailsForm.PrintButtonClick(Sender: TObject);
begin
    if (not NachislQuery.IsEmpty) then
    begin
        Report.LoadFromFile(ProgramPath + 'Reports\ASUP\NachislReport.frf');
        frVariables['FIO'] := ManDetailsQuery['Familia'] + ' ' +
            ManDetailsQuery['Imya'] + ' ' +
            ManDetailsQuery['Otchestvo'];
        frVariables['TN'] := DetailsQuery['TN'];
        Report.PrepareReport;
        if sDesignReport then Report.DesignReport
        else Report.ShowReport;
    end;

end;

procedure TPCardsDetailsForm.PrintCardButtonClick(Sender: TObject);
begin
    if CheckAccess('/ROOT/PCardsList/PCardsDetails/PCARDPRINTEXPORT', 'View', True) <> 0 then Exit;

    if (Mode = emNew) then exit;

    PCardReportQuery.Params.ParamByName('ID_PCARD').Value := ID_PCARD;
    PCardReportQuery.Open;

    HolidaysQuery.Close;
    HolidaysQuery.Params.ParamByName('ID_PCARD').Value := ID_PCARD;
    HolidaysQuery.Open;
    HolidaysQuery.First;

    CardReport.LoadFromFile(ProgramPath + 'Reports\ASUP\PCardReport.frf');

    frVariables['FState'] := FamilyStatusBox.Text;
    frVariables['Firm_Name'] := Consts_Query['Firm_Name'];
    frVariables['Firm_Ukud'] := Consts_Query['Firm_Ukud'];

    if (Sender as TButton).Name = 'PrintCardButton'
        then
    begin

        if SDesignReport = True
            then
            CardReport.DesignReport
        else
        begin
            CardReport.PrepareReport;
            CardReport.ShowReport;
        end;
    end;

    if (Sender as TButton).Name = 'ExportButton' then
        ExportReportTo(CardReport);

    PCardReportQuery.Close;
end;

procedure TPCardsDetailsForm.PensiaCheckClick(Sender: TObject);
begin
    if PensiaCheck.Checked then
    begin
        PensiaDate.Enabled := True;
        PensiaLabel.Visible := True;
        PensiaDate.Visible := True;
        PensiaDate.Date := Date();
        FC_PENSIA_DATE.Required := True;
    end;

    if not PensiaCheck.Checked then
    begin
        PensiaDate.Enabled := False;
        PensiaLabel.Visible := False;
        PensiaDate.Visible := False;
        FC_PENSIA_DATE.Value := NULL;
        FC_PENSIA_DATE.Required := False;
    end;


end;

procedure TPCardsDetailsForm.VoenkomBtnClick(Sender: TObject);
var
    form: TVoenkomForm;
begin
    if (Mode <> emView) then
    begin
        form := TVoenkomForm.Create(Self);
        if Form.ShowModal = mrOk then
        begin
            VoenkomatEdit.Text := form.ResultQuery['VOENKOMAT'];
        end;
        form.Free;
    end;
end;

procedure TPCardsDetailsForm.IsWarCheckClick(Sender: TObject);
begin
    if IsWarCheck.Checked then
        WarPanel.Enabled := true
    else
    begin
        WarPanel.Enabled := false;
    end;

end;

procedure TPCardsDetailsForm.DelButtonClickClick(Sender: TObject);
begin
    if ManEducationQuery.IsEmpty then Exit;
    if (MessageDlg('Чи ви справді бажаєте вилучити запис?', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes) then
    begin
        EducDeleteQuery.ParamByName('ID').Value :=
            ManEducationQuery['ID_EDUC_KEY'];
        ExecQuery(EducDeleteQuery);
        ManEducationQuery.Close;
        ManEducationQuery.Open;
    end;

end;

procedure TPCardsDetailsForm.ManMovingQueryIS_MAINGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if Sender.Value = 1 then
        Text := 'Так'
    else Text := 'Ні';
end;

procedure TPCardsDetailsForm.TableButtonClick(Sender: TObject);
var
    form: TfmTimeTable;
begin
    if Mode = emNew then Exit;

    form := TfmTimeTable.Create(Self);
    form.Show;
    with form.TableSelectFrame do
    begin
        OptionPageControl.ActivePage := OneManPage;
        Id_PCard := Self.Id_PCard;
        YearEdit.Value := YearOf(Date);
        MonthBox.ItemIndex := MonthOf(Date) - 1;
        FIOEdit.Text := FamiliaEdit.Text + ' ' + ImyaEdit.Text + ' ' +
            OtchestvoEdit.Text;
        AcceptButton.Click;
    end;
end;

procedure TPCardsDetailsForm.RecalcButtonClick(Sender: TObject);
var
    tn, cn: Integer;
begin
    try
        tn := StrToInt(TNEdit.Text);
    except
        tn := 1;
    end;

    try
        cn := StrToInt(CardNumberEdit.Text);
    except
    end;

    TNQuery.Close;
    TNQuery.Params.ParamValues['Start_TN'] := tn;
    TNQuery.Params.ParamValues['Start_CardNumber'] := cn;
    TNQuery.Open;
    if TNQuery.FieldByName('CardNumber').IsNull then
        CardNumberEdit.Text := '1'
    else
        CardNumberEdit.Text := TNQuery['CardNumber'];
    if TNQuery.FieldByName('TN').IsNull then
        TNEdit.Text := '1'
    else
        TNEdit.Text := TNQuery['TN'];
end;

procedure TPCardsDetailsForm.MovGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        Clipboard.AsText := IntToStr(ManMovingQuery['Id_Man_Moving']);
        ShowMessage('Id_Man_Moving: ' +
            IntToStr(ManMovingQuery['Id_Man_Moving']) +
            ' Id_Order: ' + IntToStr(ManMovingQuery['Id_Order']));
    except
    end;
    //!
end;

procedure TPCardsDetailsForm.PCardsPageControlChanging(Sender: TObject;
    var AllowChange: Boolean);
var
    i: Integer;
    s: string;

begin
    AccessDeniedPanel.SendToBack;
    i := PCardsPageControl.IndexOfTabAt(Cur_X, Cur_Y);
    if i < 0 then i := 0;
    s := PCardsPageControl.Pages[i].Name;
    if (CheckAccess('/ROOT/PCardsList/PCardsDetails/' + s, 'View') <> 0) then
    begin
        AllowChange := False;
        AccessDeniedPanel.BringToFront;

    end
    else
    begin
        PCardsPageControl.ActivePageIndex := i;
        AllowChange := True;
        PrepareQueries;
    end;


end;

procedure TPCardsDetailsForm.PCardsPageControlMouseMove(Sender: TObject;
    Shift: TShiftState; X, Y: Integer);
begin
    Cur_X := X;
    Cur_Y := Y;
end;


procedure TPCardsDetailsForm.PCardsPageControlMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    t: Boolean;
begin
    if PCardsPageControl.IndexOfTabAt(X, Y) = PCardsPageControl.ActivePageIndex
        then
    begin
        PCardsPageControlChanging(Self, t);
        if t then AccessDeniedPanel.SendToBack;
    end;
end;

procedure TPCardsDetailsForm.AddButtonClick(Sender: TObject);
var
    form: TEditPCardAttrForm;
begin
    if Mode = emView then Exit;
    form := TEditPCardAttrForm.Create(Self);
    form.Prepare(emNew, ID_PCARD, -1, -1);

    if form.ShowModal = mrOk then
    begin
        AttributesDetailsQuery.Close;
        AttributesDetailsQuery.Open;
    end;

end;

procedure TPCardsDetailsForm.ModifyButtonClick(Sender: TObject);
var
    form: TEditPCardAttrForm;
begin
    if Mode = emView then Exit;
    if not AttributesDetailsQuery.IsEmpty then
    begin
        form := TEditPCardAttrForm.Create(Self);
        form.Prepare(emModify, ID_PCARD, AttributesDetailsQuery['ID_PROPERTY'],
            AttributesDetailsQuery['ID_GROUP']);
        if form.ShowModal = mrOK then
        begin
            AttributesDetailsQuery.Close;
            AttributesDetailsQuery.Open;

        end;
    end;
end;

procedure TPCardsDetailsForm.AttrDelButtonClick(Sender: TObject);
begin
    if Mode = emView then Exit;
    if not AttributesDetailsQuery.IsEmpty then
    begin
        if
            MessageDlg
            ('Запис,будуте вилучено!Продовжити?', mtconfirmation, [mbYes,
            MbNo], 0) = mrYes
            then
        begin
            AttrDeleteQuery.Params.ParamByName('ID_PCARD').Value := ID_PCARD;
            AttrDeleteQuery.Params.ParamByName('ID_PROP').Value :=
                AttributesDetailsQuery['ID_PROPERTY'];
            AttrDeleteQuery.Params.ParamByName('ID_GROUP').Value :=
                AttributesDetailsQuery['ID_GROUP'];
            PersonalCommon.WriteTransaction.StartTransaction;
            AttrDeleteQuery.Open;
            AttrDeleteQuery.Close;
            PersonalCommon.WriteTransaction.Commit;
        end;

    end;

    AttributesDetailsQuery.Close;
    AttributesDetailsQuery.Open;


end;

procedure TPCardsDetailsForm.WorkModeChangesClick(Sender: TObject);
var
    form: TWorkModeChangesForm;
    id_man_moving: Integer;
begin
    id_man_moving := ManMovingQuery['Id_Man_Moving'];

    form := TWorkModeChangesForm.Create(Self, id_man_moving);
    form.ShowModal;
    form.Free;
end;

procedure TPCardsDetailsForm.WAccountViewCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Tip_Nach: Integer;
begin
    Tip_Nach := AViewInfo.GridRecord.Values[WAccountViewTIP_NACH.Index];
    if Tip_Nach = 1 then ACanvas.Brush.Color := RGB(222, 255, 159)
    else
        if Tip_Nach = 2 then ACanvas.Brush.Color := RGB(213, 213, 200)
        else
            if Tip_Nach = 5 then ACanvas.Brush.Color := RGB(252, 182, 203);
end;

procedure TPCardsDetailsForm.EducationGridKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Educ_Key: ' +
            IntToStr(ManEducationQuery['Id_Educ_Key']));
    except
    end;
    //!
end;

procedure TPCardsDetailsForm.WorkBookGridKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        Clipboard.AsText := IntToStr(WorkBookQuery['Id_Man_Work']);
        ShowMessage('Id_Man_Work: ' + IntToStr(WorkBookQuery['Id_Man_Work']));
    except
    end;
    //!
end;

end.
