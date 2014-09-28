{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit MainInvKartForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxMaskEdit, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, Ibase,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxInplaceContainer, cxDBTL, cxTLData, ActnList, ImgList, Menus,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxCalendar,
  cxContainer, cxLabel, FR_DSet, FR_DBSet, FR_Class,
  FR_Desgn, cxCurrencyEdit, cxSplitter, StdCtrls, cxTextEdit, cxMemo,
  cxLookAndFeelPainters, cxButtons, Mask,
  {ToolEdit, Placemnt,} dxStatusBar, cxGroupBox, cxDBEdit, uWaite,
  cxProgressBar, RxMemDS, dxBar, cxCheckBox, Placemnt, cxButtonEdit, GlobalSpr,
  pFIBStoredProc, uMatasVars, cxDropDownEdit, uMatasUtils, FIBQuery,
  pFIBQuery, DateUtils, uResources, uChecked, uPackageManager, FR_E_TXT,
  FR_E_RTF, frOLEExl, frxExportRTF, frxClass, frxExportXLS, frxDBSet,
  frxDesgn,uLinkAmortAndGrupp;

type
  TfmMode = (Show, Edit);

  TfmMainIvKartForm = class(TForm)
    ImageListButton: TImageList;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    ActionClose: TAction;
    PopupMenuPapka: TPopupMenu;
    PopupMenuPrim: TPopupMenu;
    ActionCancel: TAction;
    DataSourcePapka: TDataSource;
    DataSourceInvKart: TDataSource;
    DataSetKart: TpFIBDataSet;
    DatabaseMain: TpFIBDatabase;
    TransactionRead: TpFIBTransaction;
    ActionRefresh: TAction;
    ActionAdd1: TMenuItem;
    ActionChange1: TMenuItem;
    ActionDelete1: TMenuItem;
    ActionCancel1: TMenuItem;
    ActionAdd2: TMenuItem;
    ActionChange2: TMenuItem;
    ActionDelete2: TMenuItem;
    ActionRefresh1: TMenuItem;
    ActionCancel2: TMenuItem;
    ActionRefresh2: TMenuItem;
    ActionLast: TAction;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    DataSetPapka: TpFIBDataSet;
    ForHaeder: TcxStyle;
    AfterSelection: TcxStyle;
    GroupBox1: TGroupBox;
    cxGridInvKart: TcxGrid;
    cxGridInvKartDBTableView1: TcxGridDBTableView;
    cxGridInvKartDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridInvKartLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    cxDBTreeListPapka: TcxDBTreeList;
    cxDBTreeListPapkacxDBTreeListColumn1: TcxDBTreeListColumn;
    cxGridInvKartDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridInvKartDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridInvKartDBTableView1DBColumn4: TcxGridDBColumn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DataSourceOsn: TDataSource;
    DataSetOsn: TpFIBDataSet;
    Panel3: TPanel;
    cxGridInvKartDBTableView1DBColumn8: TcxGridDBColumn;
    cxTextEditKartNum: TcxTextEdit;
    cxTextEditTypKart: TcxTextEdit;
    cxTextEditDateOstPrice: TcxTextEdit;
    cxTextEditDateOprih: TcxTextEdit;
    cxTextEditDateStartExpl: TcxTextEdit;
    cxTextEditDateUpdate: TcxTextEdit;
    cxTextEditDateOut: TcxTextEdit;
    cxTextEditZavNum: TcxTextEdit;
    cxTextEditPassNum: TcxTextEdit;
    cxTextEditModel: TcxTextEdit;
    cxTextEditMarka: TcxTextEdit;
    cxMemoNote: TcxMemo;
    cxTextEditDateCreate: TcxTextEdit;
    cxTextEditDocReg: TcxTextEdit;
    cxTextEditDateReg: TcxTextEdit;
    cxGridDragMetal: TcxGrid;
    cxGridDBTableViewDragMetal: TcxGridDBTableView;
    cxGridLevelDragMetal: TcxGridLevel;
    cxGridDBTableViewDragMetalDBColumn1: TcxGridDBColumn;
    DataSetDrag: TpFIBDataSet;
    DataSourceDragMet: TDataSource;
    cxGridDBTableViewDragMetalDBColumn2: TcxGridDBColumn;
    cxGridDBTableViewDragMetalDBColumn3: TcxGridDBColumn;
    cxTextEditStartPrice: TcxCurrencyEdit;
    cxTextEditStartIznos: TcxCurrencyEdit;
    cxTextEditOstPrice: TcxCurrencyEdit;
    cxTextEditOstIznos: TcxCurrencyEdit;
    cxGroupBoxNal: TcxGroupBox;
    cxSplitter3: TcxSplitter;
    cxGroupBoxBuh: TcxGroupBox;
    Label_buh_db_sch: TLabel;
    cxTextEdit_buh_db_sch: TcxTextEdit;
    cxTextEdit_buh_kr_sch: TcxTextEdit;
    Label_buh_kr_sch: TLabel;
    Label_am_grp: TLabel;
    cxTextEdit_am_grp: TcxTextEdit;
    Label_method_name: TLabel;
    cxTextEdit_method_name: TcxTextEdit;
    cxCurrencyEditminprice: TcxCurrencyEdit;
    Labelminprice: TLabel;
    LabelPercent: TLabel;
    cxCurrencyEditPercent: TcxCurrencyEdit;
    cxTextEditPerNach_Perc: TcxTextEdit;
    LabelPerNach_Perc: TLabel;
    LabelMonthYear: TLabel;
    cxTextEditYear: TcxTextEdit;
    LabelGod: TLabel;
    cxTextEditMonth: TcxTextEdit;
    LabelMonth: TLabel;
    Label_Nal_db_sch: TLabel;
    cxTextEdit_Nal_db_sch: TcxTextEdit;
    cxTextEdit_Nal_kr_sch: TcxTextEdit;
    Label_Nal_kr_sch: TLabel;
    Label_Nal_am_grp: TLabel;
    cxTextEdit_Nal_am_grp: TcxTextEdit;
    cxTextEdit_Nal_method_name: TcxTextEdit;
    Label_Nal_method_name: TLabel;
    Label_Nal_minprice: TLabel;
    cxCurrencyEdit_Nal_minprice: TcxCurrencyEdit;
    cxCurrencyEdit_Nal_Percent: TcxCurrencyEdit;
    Label_Nal_Percent: TLabel;
    Label_Nal_PerNach_Perc: TLabel;
    cxTextEdit_Nal_PerNach_Perc: TcxTextEdit;
    Label_Nal_mes: TLabel;
    cxTextEdit_Nal_Month: TcxTextEdit;
    cxTextEdit_Nal_Year: TcxTextEdit;
    Label_Nal_God: TLabel;
    Label_Nal_MonthYear: TLabel;
    TabSheet5: TTabSheet;
    cxGridObjects: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxSplitterNote_obj_control: TcxSplitter;
    pFIBDataSetFor_Printing: TpFIBDataSet;
    PopupMenuDragAndNormi: TPopupMenu;
    Operacii1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Oprihod1: TMenuItem;
    Vnutrperem1: TMenuItem;
    Vvodvexpl1: TMenuItem;
    Spisanie1: TMenuItem;
    ActionPrint: TAction;
    cxSplitter2: TcxSplitter;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton111: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ActionFind: TAction;
    pFIBDataSetFor_PrintingR_ID_KART: TFIBBCDField;
    pFIBDataSetFor_PrintingTIP_KRT: TFIBStringField;
    pFIBDataSetFor_PrintingGRP_NUM: TFIBStringField;
    pFIBDataSetFor_PrintingINV_NUM: TFIBIntegerField;
    pFIBDataSetFor_PrintingKART_NUM: TFIBIntegerField;
    pFIBDataSetFor_PrintingBEG_PRICE: TFIBBCDField;
    pFIBDataSetFor_PrintingBEG_IZNOS: TFIBBCDField;
    pFIBDataSetFor_PrintingOST_PRICE: TFIBBCDField;
    pFIBDataSetFor_PrintingOST_IZNOS: TFIBBCDField;
    pFIBDataSetFor_PrintingDATE_OST: TFIBDateField;
    pFIBDataSetFor_PrintingDATE_OPR: TFIBDateField;
    pFIBDataSetFor_PrintingID_OPER_OPR: TFIBBCDField;
    pFIBDataSetFor_PrintingDATE_EXPL: TFIBDateField;
    pFIBDataSetFor_PrintingID_OPER_EXPL: TFIBBCDField;
    pFIBDataSetFor_PrintingDATE_UPDATE: TFIBDateField;
    pFIBDataSetFor_PrintingID_OPER_UPDATE: TFIBBCDField;
    pFIBDataSetFor_PrintingDATE_OUT: TFIBDateField;
    pFIBDataSetFor_PrintingID_OPER_OUT: TFIBBCDField;
    pFIBDataSetFor_PrintingZAV_NUM: TFIBStringField;
    pFIBDataSetFor_PrintingPASS_NUM: TFIBStringField;
    pFIBDataSetFor_PrintingMODEL: TFIBStringField;
    pFIBDataSetFor_PrintingMARK: TFIBStringField;
    pFIBDataSetFor_PrintingDATE_CREATE: TFIBDateField;
    pFIBDataSetFor_PrintingID_CUST: TFIBBCDField;
    pFIBDataSetFor_PrintingDOC_REG: TFIBStringField;
    pFIBDataSetFor_PrintingDATE_REG: TFIBDateField;
    pFIBDataSetFor_PrintingNOTE: TFIBStringField;
    pFIBDataSetFor_PrintingNAME_NORM: TFIBStringField;
    pFIBDataSetFor_PrintingAMORT_PERC: TFIBFloatField;
    pFIBDataSetFor_PrintingMIN_PRICE: TFIBBCDField;
    pFIBDataSetFor_PrintingMETHOD_NAME: TFIBStringField;
    pFIBDataSetFor_PrintingNORM_TIP: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNORM_FORMULA: TFIBStringField;
    pFIBDataSetFor_PrintingBUH_DB_SCH: TFIBStringField;
    pFIBDataSetFor_PrintingBUH_KR_SCH: TFIBStringField;
    pFIBDataSetFor_PrintingNORM_YEAR: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNORM_MONTH: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNORM_ID: TFIBBCDField;
    pFIBDataSetFor_PrintingNORM_PER_PERIOD: TFIBSmallIntField;
    pFIBDataSetFor_PrintingIS_NALOG_ACC: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNAL_NAME_NORM: TFIBStringField;
    pFIBDataSetFor_PrintingNAL_AMORT_PERC: TFIBFloatField;
    pFIBDataSetFor_PrintingNAL_MIN_PRICE: TFIBBCDField;
    pFIBDataSetFor_PrintingNAL_METHOD_NAME: TFIBStringField;
    pFIBDataSetFor_PrintingNAL_NORM_TIP: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNAL_NORM_FORMULA: TFIBStringField;
    pFIBDataSetFor_PrintingNAL_DB_SCH: TFIBStringField;
    pFIBDataSetFor_PrintingNAL_KR_SCH: TFIBStringField;
    pFIBDataSetFor_PrintingNAL_NORM_YEAR: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNAL_NORM_MONTH: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNAL_NORM_ID: TFIBBCDField;
    pFIBDataSetFor_PrintingNAL_NORM_PER_PERIOD: TFIBSmallIntField;
    pFIBDataSetFor_PrintingID_BUH_DB: TFIBBCDField;
    pFIBDataSetFor_PrintingID_BUH_KR: TFIBBCDField;
    pFIBDataSetFor_PrintingID_NAL_DB: TFIBBCDField;
    pFIBDataSetFor_PrintingID_NAL_KR: TFIBBCDField;
    pFIBDataSetFor_PrintingID_METHD: TFIBBCDField;
    pFIBDataSetFor_PrintingID_METHD_NAL: TFIBBCDField;
    pFIBDataSetFor_PrintingFIO_MOL: TFIBStringField;
    pFIBDataSetFor_PrintingMAIN_NOMN: TFIBStringField;
    pFIBDataSetFor_PrintingDEPARTMENT: TFIBStringField;
    pFIBDataSetFor_PrintingMAIN_SCH_NUM: TFIBStringField;
    DataSetOperacii: TpFIBDataSet;
    Namoder1: TMenuItem;
    DataSetOperaciiID_OPER: TFIBBCDField;
    DataSetOperaciiDATE_DOC: TFIBDateField;
    DataSetOperaciiDATE_REG: TFIBDateField;
    DataSetOperaciiID_MO_NEW: TFIBBCDField;
    DataSetOperaciiID_MO_OLD: TFIBBCDField;
    DataSetOperaciiID_SCH_NEW: TFIBBCDField;
    DataSetOperaciiID_SCH_OLD: TFIBBCDField;
    DataSetOperaciiNUM_DOC: TFIBStringField;
    DataSetOperaciiOST_IZNOS_NEW: TFIBBCDField;
    DataSetOperaciiOST_IZNOS_OLD: TFIBBCDField;
    DataSetOperaciiOST_PRICE_NEW: TFIBBCDField;
    DataSetOperaciiOST_PRICE_OLD: TFIBBCDField;
    DataSetOperaciiPUB_ID_DOC: TFIBBCDField;
    DataSetOperaciiSUMMA: TFIBBCDField;
    DataSetOperaciiTIP_OPER: TFIBSmallIntField;
    DataSet_INV_num: TpFIBDataSet;
    DataSet_INV_numGRP_NUM: TFIBStringField;
    DataSet_INV_numINV_NUM: TFIBIntegerField;
    DataSet_INV_numSCH_NUM: TFIBStringField;
    PopupMenu_Print: TPopupMenu;
    Print_inv_kart_main: TMenuItem;
    Print_akt_priema_peredachi: TMenuItem;
    DataSetPrinting_peredachu: TpFIBDataSet;
    DataSetPrinting_peredachuNUM_DOC: TFIBStringField;
    DataSetPrinting_peredachuDATE_DOC: TFIBDateField;
    DataSetPrinting_peredachuID_MOL: TFIBBCDField;
    DataSetPrinting_peredachuID_OPER: TFIBBCDField;
    DataSetPrinting_peredachuNOMN_NAME: TFIBStringField;
    DataSetPrinting_peredachuNAME_SCH: TFIBStringField;
    DataSetPrinting_peredachuBEG_PR: TFIBBCDField;
    DataSetPrinting_peredachuPASS_NUM: TFIBStringField;
    DataSetPrinting_peredachuDATE_EXPL: TFIBDateField;
    DataSetPrinting_peredachuDATE_CREATE: TFIBDateField;
    DataSetPrinting_peredachuIZNOS: TFIBBCDField;
    DataSetPrinting_peredachuDATE_PERIODA: TFIBDateField;
    DataSetPrinting_peredachuZAV_NUM: TFIBStringField;
    Inv_sp_osn_sredstv: TMenuItem;
    DataSet_inv_sp_os: TpFIBDataSet;
    DataSet_Auto_full_inv_num: TpFIBDataSet;
    DataSet_Auto_full_inv_numGRP_NUM: TFIBStringField;
    DataSet_Auto_full_inv_numINV_NUM: TFIBIntegerField;
    DataSet_Auto_full_inv_numSCH_NUM: TFIBStringField;
    DataSet_Auto_full_inv_numID_KART: TFIBBCDField;
    DataSet_inv_sp_osKART_NUM: TFIBIntegerField;
    DataSet_inv_sp_osDATE_REG: TFIBDateField;
    DataSet_inv_sp_osID_INV_KART: TFIBBCDField;
    DataSet_inv_sp_osNOM_NAME: TFIBStringField;
    DataSet_inv_sp_osBEG_PR: TFIBBCDField;
    DataSet_inv_sp_osINV_FULL: TFIBIntegerField;
    Akt_na_spisanie: TMenuItem;
    DataSet_Akt_na_spisanie: TpFIBDataSet;
    DataSet_Akt_na_spisanieNUM_DOC: TFIBStringField;
    DataSet_Akt_na_spisanieDATE_DOC: TFIBDateField;
    DataSet_Akt_na_spisanieID_MOL: TFIBBCDField;
    DataSet_Akt_na_spisanieID_OPER: TFIBBCDField;
    DataSet_Akt_na_spisanieNOMN_NAME: TFIBStringField;
    DataSet_Akt_na_spisanieNAME_SCH: TFIBStringField;
    DataSet_Akt_na_spisanieBEG_PR: TFIBBCDField;
    DataSet_Akt_na_spisaniePASS_NUM: TFIBStringField;
    DataSet_Akt_na_spisanieDATE_EXPL: TFIBDateField;
    DataSet_Akt_na_spisanieDATE_CREATE: TFIBDateField;
    DataSet_Akt_na_spisanieIZNOS: TFIBBCDField;
    DataSet_Akt_na_spisanieDATE_PERIODA: TFIBDateField;
    DataSet_Akt_na_spisanieZAV_NUM: TFIBStringField;
    DataSet_Akt_na_spisanieINV_NUM: TFIBIntegerField;
    Invkniga1: TMenuItem;
    DataSet_inv_book: TpFIBDataSet;
    DataSet_inv_bookNAME_NOM: TFIBStringField;
    DataSet_inv_bookSCH_NUM: TFIBStringField;
    DataSet_inv_bookDATE_EXPL: TFIBDateField;
    DataSet_inv_bookAKT_EXPL_NUM: TFIBStringField;
    DataSet_inv_bookNACH_STOIM: TFIBBCDField;
    DataSet_inv_bookNACH_IZN: TFIBBCDField;
    DataSet_inv_bookOST_STOIM: TFIBBCDField;
    DataSet_inv_bookSUM_IZN: TFIBBCDField;
    DataSet_inv_bookDATE_OUT: TFIBDateField;
    DataSet_inv_bookAKT_OUT_NUM: TFIBStringField;
    DataSet_inv_bookMOL_NAME: TFIBStringField;
    DataSet_inv_bookTIP_UCHETA: TFIBSmallIntField;
    DataSet_inv_bookID_SCH: TFIBBCDField;
    DataSet_inv_bookID_MOL: TFIBBCDField;
    Special_action: TAction;
    cxTextEdit_grp_num: TcxTextEdit;
    cxTextEdit_Inv_num: TcxTextEdit;
    FormStorage1: TFormStorage;
    Select_line: TAction;
    Pereocenka: TMenuItem;
    TabSheet6: TTabSheet;
    ToolButton7: TToolButton;
    PopupMenu_oper: TPopupMenu;
    Oprihod2: TMenuItem;
    Vnutrperem2: TMenuItem;
    Vvodvexpl2: TMenuItem;
    Spisanie2: TMenuItem;
    Namoder2: TMenuItem;
    Pereocenka2: TMenuItem;
    Oprihod: TAction;
    perem: TAction;
    vvod_v_exp: TAction;
    Spisanie: TAction;
    na_moder: TAction;
    Peremeshenie: TAction;
    cxGrid_historyDBTableView1: TcxGridDBTableView;
    cxGrid_historyLevel1: TcxGridLevel;
    cxGrid_history: TcxGrid;
    cxGrid_historyDBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid_historyDBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid_historyDBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid_historyDBTableView1DBColumn4: TcxGridDBColumn;
    DataSet_history: TpFIBDataSet;
    DataSource_history: TDataSource;
    unOprihodovanie: TAction;
    PopupMenu_un_oper: TPopupMenu;
    un_operaciya: TMenuItem;
    WriteTransaction: TpFIBTransaction;
    ToolButton8: TToolButton;
    ActionLook: TAction;
    cxGroupBox1: TcxGroupBox;
    cxMemo_primech: TcxMemo;
    LabelPrimechanie: TLabel;
    ActionLook1: TMenuItem;
    Print_dragMetall: TMenuItem;
    DataSetSellect_info_about_drag: TpFIBDataSet;
    DataSetSellect_info_about_dragID_INV_KART: TFIBBCDField;
    DataSetSellect_info_about_dragID_MET: TFIBBCDField;
    DataSetSellect_info_about_dragKOL_MET: TFIBBCDField;
    DataSetSellect_info_about_dragNAME: TFIBStringField;
    DataSetSellect_info_about_dragINV_NUM_FULL: TFIBStringField;
    DataSetSellect_info_about_dragSFIO: TFIBStringField;
    DataSetSellect_info_about_dragNAMENOMN: TFIBStringField;
    DataSetSellect_info_about_dragID_MO: TFIBBCDField;
    ActionUpdateMetall: TAction;
    ActionUpdateHist: TAction;
    ActionUpdateKart: TAction;
    cxGrid_historyDBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid_historyDBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid_historyDBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid_historyDBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid_historyDBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid_historyDBTableView1DBColumn10: TcxGridDBColumn;
    ved_main_menu: TMenuItem;
    looksrooved: TMenuItem;
    destroyved: TMenuItem;
    create_ved: TMenuItem;
    Panel2: TPanel;
    cxButtonEditFiltring_Po_Sch: TcxButtonEdit;
    cxLabelSelPoRah: TcxLabel;
    cxLabel_Sel_Mol: TcxLabel;
    cxButtonEdit_Filtring_Po_Mol: TcxButtonEdit;
    cxButtonSetSelection: TcxButton;
    ActionFiending_in_main_form: TAction;
    cxCheckBoxWorked1: TcxCheckBox;
    cxButton_Clearing: TcxButton;
    Action_Cleaning: TAction;
    DataSet_historyID_OP: TFIBBCDField;
    DataSet_historyNUM_D: TFIBStringField;
    DataSet_historyDATE_D: TFIBDateField;
    DataSet_historySUMMA: TFIBBCDField;
    DataSet_historyINDEX_OPER: TFIBSmallIntField;
    DataSet_historyFIO_NEW: TFIBStringField;
    DataSet_historyFIO_OLD: TFIBStringField;
    DataSet_historySCH_NUM_NEW: TFIBStringField;
    DataSet_historySCH_NUM_OLD: TFIBStringField;
    DataSet_historyOST_PRICE: TFIBBCDField;
    DataSet_historyOST_IZNOS: TFIBBCDField;
    DataSetDragR_ID_METALL: TFIBBCDField;
    DataSetDragDRAG_KOL: TFIBBCDField;
    DataSetDragDRAG_NAME: TFIBStringField;
    DataSetDragDRAG_SHORT: TFIBStringField;
    DataSetDragID_FOR_DEL: TFIBBCDField;
    DataSetPapkaID_INV_GRP: TFIBBCDField;
    DataSetPapkaLINK_TO: TFIBBCDField;
    DataSetPapkaNAME_GRP: TFIBStringField;
    DataSetPapkaHAS_CHILD: TFIBSmallIntField;
    DataSetPapkaKOD_GRP: TFIBBCDField;
    ButAmort: TToolButton;
    PopupMenuFor_Amort: TPopupMenu;
    create_ved_main: TMenuItem;
    looksrooved_main: TMenuItem;
    destroyved_main: TMenuItem;
    Action_destroy_amort_ved: TAction;
    ActionLookSroo_Ved: TAction;
    cxComboBoxWorked: TcxComboBox;
    cxLabelTypKart: TLabel;
    cxLabelKartNum: TLabel;
    cxLabelStartPrice: TLabel;
    cxLabelStartIznos: TLabel;
    cxLabelOstPrice: TLabel;
    cxLabelOstIznos: TLabel;
    cxLabelDateOstPrice: TLabel;
    cxLabelDateOprih: TLabel;
    cxLabelDateStartExpl: TLabel;
    cxLabelDateUpdate: TLabel;
    cxLabelDateOut: TLabel;
    cxLabel_Inv_num_short: TLabel;
    cxLabel_Grp_num: TLabel;
    cxLabelZavNum: TLabel;
    cxLabelPassNum: TLabel;
    cxLabelModel: TLabel;
    cxLabelMarka: TLabel;
    cxLabelNote: TLabel;
    cxLabelDateCreate: TLabel;
    cxLabelDocReg: TLabel;
    cxLabelDateReg: TLabel;
    LookSrooInvKart: TAction;
    cxGridInvKartDBTableView1DBColumn5: TcxGridDBColumn;
    pFIBStoredProc1: TpFIBStoredProc;
    UnChecked: TMenuItem;
    checkedall: TMenuItem;
    UnCheckedone: TMenuItem;
    UnCheckedall: TMenuItem;
    CanSeeId: TAction;
    cxCurrencyEditBal: TcxCurrencyEdit;
    LabelBal: TLabel;
    Kartaprint: TAction;
    spr_ost_price: TMenuItem;
    ved_nal_os: TMenuItem;
    vedcomeos: TMenuItem;
    vedoutos: TMenuItem;
    InvopisOS: TMenuItem;
    matinvgrp: TMenuItem;
    matnomngrp: TMenuItem;
    cxGridInvKartDBTableView1DBColumn6: TcxGridDBColumn;
    LookingHistory: TAction;
    DataSetKartID_MO: TFIBBCDField;
    DataSetKartFIO_MOL: TFIBStringField;
    DataSetKartNAME_DEPARTMENT: TFIBStringField;
    DataSetKartNAME_KART: TFIBStringField;
    DataSetKartNAME_SCH: TFIBStringField;
    DataSetKartGRP_NUM: TFIBStringField;
    DataSetKartINV_NUM: TFIBStringField;
    DataSetKartNUM_SCH: TFIBStringField;
    DataSetKartBAL_PRICE: TFIBBCDField;
    DataSetKartOST_PRICE: TFIBBCDField;
    DataSetKartIZNOS: TFIBBCDField;
    DataSetKartR_ID_KART: TFIBBCDField;
    DataSetKartID_INV_GRP: TFIBBCDField;
    DataSetKartID_OST: TFIBBCDField;
    DataSetKartID_MANS: TFIBBCDField;
    DataSetKartID_NOMNS: TFIBBCDField;
    DataSetKartID_SCHS: TFIBBCDField;
    DataSetKartDOC_REC: TFIBDateField;
    DataSetKartWORKED: TFIBSmallIntField;
    DataSetKartTIP_KART: TFIBStringField;
    DataSetKartUSE_IN_NALOG: TFIBSmallIntField;
    DataSetKartKART_NUM: TFIBIntegerField;
    DataSetKartID_DB: TFIBBCDField;
    DataSetKartID_KR: TFIBBCDField;
    DataSetKartDATE_EXPL: TFIBDateField;
    DataSetKartDATE_OUT: TFIBDateField;
    DataSetKartDATE_OPR: TFIBDateField;
    DataSetKartDATE_UP: TFIBDateField;
    DataSetKartFULL_INV: TFIBStringField;
    DataSetKartIS_BUHG_ACC: TFIBSmallIntField;
    DataSetKartBAL_ID_SCH: TFIBBCDField;
    DataSetKartBAL_SCH_NUMBER: TFIBStringField;
    DataSetKartBAL_SCH_TITLE: TFIBStringField;
    DataSetKartCHEKER: TFIBIntegerField;
    DataSetKartIS_SKLAD: TFIBSmallIntField;
    Actiontemp: TAction;
    OpenMemOrd: TAction;
    DataSet_historyID_USER: TFIBBCDField;
    DataSet_historyPUB_DT_ID_DOC: TFIBBCDField;
    Doocenka1: TMenuItem;
    doocenivanie: TAction;
    doocenka2: TMenuItem;
    Komplectaciya1: TMenuItem;
    Komplectaciya: TAction;
    Komplectaciya2: TMenuItem;
    Razukomplect1: TMenuItem;
    Razukomplect: TAction;
    Razukomplect2: TMenuItem;
    Chastspis1: TMenuItem;
    Chast_spis: TAction;
    Chastspis2: TMenuItem;
    ved_peremesheniya: TMenuItem;
    CheckBoxShowSumma: TCheckBox;
    cross_tab_print: TMenuItem;
    name_grp_che: TMenuItem;
    DataSetKartIS_INV_OBJ: TFIBIntegerField;
    ShowVedPereoc: TMenuItem;
    DataSet_NaTe_object: TpFIBDataSet;
    DataSourceObj: TDataSource;
    N4: TMenuItem;
    DataSet_historyUNDELOPER: TFIBIntegerField;
    N5: TMenuItem;
    NExport: TMenuItem;
    acExport: TAction;
    WorkQuery: TpFIBQuery;
    cxGridInvKartDBTableView1DBColumn7: TcxGridDBColumn;
    Proverka_is_do_exists: TpFIBDataSet;
    Proverka_is_do_existsID_DOC: TFIBBCDField;
    DataSetKartID_SPODR: TFIBBCDField;
    actNormIzn: TAction;
    btnNormIzn: TToolButton;
    DataSetKartNAME_FULL: TFIBStringField;
    Teh_charact_print: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Beg_Price_Nal: TLabel;
    Beg_Iznos_Nal: TLabel;
    Ost_Price_Nal: TLabel;
    Ost_Iznos_Nal: TLabel;
    Date_Ost_Nal: TLabel;
    DateOstNal: TcxTextEdit;
    BegIznosNal: TcxCurrencyEdit;
    BegPriceNal: TcxCurrencyEdit;
    OstIznosNal: TcxCurrencyEdit;
    OstPriceNal: TcxCurrencyEdit;
    DataSetKartBEG_PRICE_NAL: TFIBBCDField;
    DataSetKartBEG_IZNOS_NAL: TFIBBCDField;
    DataSetKartOST_PRICE_NAL: TFIBBCDField;
    DataSetKartOST_IZNOS_NAL: TFIBBCDField;
    N8: TMenuItem;
    N9: TMenuItem;
    StPr: TpFIBStoredProc;
    Tr: TpFIBTransaction;
    InvBook2: TMenuItem;
    DataSet_historyTIP_OP: TFIBStringField;
    frDBDataSetPrint_karta: TfrDBDataSet;
    frReportPrint_karta: TfrReport;
    Ds_moderniz: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    ts1: TTabSheet;
    pnl1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ds1: TDataSource;
    DS_KapRem: TpFIBDataSet;
    DS_KapRemID_INV_KAP_REM: TFIBBCDField;
    DS_KapRemDATE_REM: TFIBDateField;
    DS_KapRemISPOLNITEL: TFIBStringField;
    DS_KapRemSODERJANIE: TFIBStringField;
    DS_KapRemDB_ID_SCH: TFIBBCDField;
    DS_KapRemKR_ID_SCH: TFIBBCDField;
    DS_KapRemID_SM: TFIBBCDField;
    DS_KapRemID_RZ: TFIBBCDField;
    DS_KapRemID_ST: TFIBBCDField;
    DS_KapRemID_KEKV: TFIBBCDField;
    DS_KapRemSUMMA: TFIBBCDField;
    DS_KapRemSM_TITLE: TFIBStringField;
    DS_KapRemSM_KOD: TFIBIntegerField;
    DS_KapRemRZ_TITLE: TFIBStringField;
    DS_KapRemRZ_KOD: TFIBIntegerField;
    DS_KapRemST_TITLE: TFIBStringField;
    DS_KapRemST_KOD: TFIBIntegerField;
    DS_KapRemKEKV_TITLE: TFIBStringField;
    DS_KapRemKEKV_KOD: TFIBIntegerField;
    DS_KapRemDB_SCH_NUMBER: TFIBStringField;
    DS_KapRemDB_SCH_TITLE: TFIBStringField;
    DS_KapRemKR_SCH_NUMBER: TFIBStringField;
    DS_KapRemKR_SCH_TITLE: TFIBStringField;
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn10: TcxGridDBColumn;
    StPr_KapRem: TpFIBStoredProc;
    Tr_Kap_Rem: TpFIBTransaction;
    actUpdateKapRem: TAction;
    N10: TMenuItem;
    ds_modern: TpFIBDataSet;
    frxrprt1: TfrxReport;
    ds_modernNAME_NOMN: TFIBStringField;
    ds_modernNAME_DEP: TFIBStringField;
    ds_modernSFIO: TFIBStringField;
    ds_modernINV_FULL: TFIBStringField;
    ds_modernSCH_NUM: TFIBStringField;
    ds_modernSUM_PO_OPER: TFIBBCDField;
    ds_modernDATE_DOC: TFIBDateField;
    ds_modernNUM_DOC: TFIBStringField;
    ds_modernOST_PRICE: TFIBBCDField;
    ds_modernOST_IZNOS: TFIBBCDField;
    ds_modernBAL_PRICE: TFIBBCDField;
    N11: TMenuItem;
    N12: TMenuItem;
    frxDBDataset: TfrxDBDataset;
    btn1: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure cxGridInvKartDBTableView1DblClick(Sender: TObject);
    procedure ActionLastExecute(Sender: TObject);
    procedure DataSetOsnAfterScroll(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure unOprihod1Click(Sender: TObject);
    procedure unVnutrperem1Click(Sender: TObject);
    procedure unoperout1Click(Sender: TObject);
    procedure smoder1Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ActionFindExecute(Sender: TObject);
    procedure cxDBTreeListPapkaClick(Sender: TObject);
    procedure smoder2Click(Sender: TObject);
    procedure PopupMenuPrimPopup(Sender: TObject);
    procedure Print_inv_kart_mainClick(Sender: TObject);
    procedure Print_akt_priema_peredachiClick(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure Inv_sp_osn_sredstvClick(Sender: TObject);
    procedure Akt_na_spisanieClick(Sender: TObject);
    procedure Explnow1Click(Sender: TObject);
    procedure donotexpl1Click(Sender: TObject);
    procedure Special_actionExecute(Sender: TObject);
    procedure FormStorage1RestorePlacement(Sender: TObject);
    procedure cxSplitter2AfterClose(Sender: TObject);
    procedure cxSplitter2AfterOpen(Sender: TObject);
    procedure cxSplitter1AfterClose(Sender: TObject);
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure cxGridInvKartDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Select_lineExecute(Sender: TObject);
    procedure OprihodExecute(Sender: TObject);
    procedure PopupMenu_operPopup(Sender: TObject);
    procedure peremExecute(Sender: TObject);
    procedure vvod_v_expExecute(Sender: TObject);
    procedure SpisanieExecute(Sender: TObject);
    procedure na_moderExecute(Sender: TObject);
    procedure PeremeshenieExecute(Sender: TObject);
    procedure unOprihodovanieExecute(Sender: TObject);
    procedure ActionLookExecute(Sender: TObject);
    procedure Print_dragMetallClick(Sender: TObject);
    procedure ActionUpdateMetallExecute(Sender: TObject);
    procedure ActionUpdateHistExecute(Sender: TObject);
    procedure ActionUpdateKartExecute(Sender: TObject);
    procedure create_vedClick(Sender: TObject);
    procedure cxButtonEdit_Filtring_Po_MolPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxButtonEditFiltring_Po_SchPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure ActionFiending_in_main_formExecute(Sender: TObject);
    procedure cxButtonEditFiltring_Po_SchKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEdit_Filtring_Po_MolKeyPress(Sender: TObject;
      var Key: Char);
    procedure Action_CleaningExecute(Sender: TObject);
    procedure cxGridInvKartDblClick(Sender: TObject);
    procedure create_ved_mainClick(Sender: TObject);
    procedure Action_destroy_amort_vedExecute(Sender: TObject);
    procedure ActionLookSroo_VedExecute(Sender: TObject);
    procedure Invkniga1Click(Sender: TObject);
    procedure LookSrooInvKartExecute(Sender: TObject);
    procedure cxGridInvKartMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure checkedallClick(Sender: TObject);
    procedure UnCheckedallClick(Sender: TObject);
    procedure UnCheckedoneClick(Sender: TObject);
    procedure CanSeeIdExecute(Sender: TObject);
    procedure cxGridInvKartDBTableView1DBColumn1HeaderClick(
      Sender: TObject);
    procedure cxGridInvKartDBTableView1DBColumn8HeaderClick(
      Sender: TObject);
    procedure cxGridInvKartDBTableView1DBColumn2HeaderClick(
      Sender: TObject);
    procedure cxGridInvKartDBTableView1DBColumn3HeaderClick(
      Sender: TObject);
    procedure KartaprintExecute(Sender: TObject);
    procedure spr_ost_priceClick(Sender: TObject);
    procedure ved_nal_osClick(Sender: TObject);
    procedure vedcomeosClick(Sender: TObject);
    procedure vedoutosClick(Sender: TObject);
    procedure InvopisOSClick(Sender: TObject);
    procedure matinvgrpClick(Sender: TObject);
    procedure matnomngrpClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure LookingHistoryExecute(Sender: TObject);
    procedure ActiontempExecute(Sender: TObject);
    procedure doocenivanieExecute(Sender: TObject);
    procedure KomplectaciyaExecute(Sender: TObject);
    procedure RazukomplectExecute(Sender: TObject);
    procedure Chast_spisExecute(Sender: TObject);
    procedure ved_peremesheniyaClick(Sender: TObject);
    procedure CheckBoxShowSummaClick(Sender: TObject);
    procedure cross_tab_printClick(Sender: TObject);
    procedure name_grp_cheClick(Sender: TObject);
    procedure ShowVedPereocClick(Sender: TObject);
    procedure DataSet_NaTe_objectAfterScroll(DataSet: TDataSet);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu_un_operPopup(Sender: TObject);
    procedure acExportExecute(Sender: TObject);
    procedure cxGridInvKartDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actNormIznExecute(Sender: TObject);
    procedure Teh_charact_printClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure InvBook2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure actUpdateKapRemExecute(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    DBHANDLE: TISC_DB_HANDLE;
    main_m : TfmMode;
    print_id : string;
    Up_Date_filter : boolean;
    krt_praporec : integer;
    multi_sel_id : String;

    id_krt, name_nomn : String;
    sch_idih, id_nomn, id_man, id_db, id_kr, id_spodr : int64;
    praporec, filter_fg  : boolean;
    prefix    : string;
    grp1, grp2, inv1, inv2, TIP_KART, krt1, krt2, iznosec : string;
    sch_name, FIO_name, nomn_name, db_name, kr_name, dep_name : string;
    working,  is_buh, fw, fold : integer;
    beg_price_beg, beg_price_end, beg_ost_pr, end_ost_pr, beg_ost_iz, end_ost_iz : String;
    all, expl, out_proch : integer;
    date_expl1, date_expl2, date_out1, date_out2, date_opr1, date_opr2, date_up1, date_up2 : Variant;
    ostPriceCheck, ostIznosCheck, balPriceCheck, id_filter, buh_pers : Integer;

    undeloper1 : integer;
    BuhPers:Boolean;
    user_name :String;
    id_ost_in : Int64;
    ID_SESSION_PER : int64;
  public
    For_del_last_line : integer;
    MrOkOrCancel : integer;
    ID_USER    :Int64;
    name_user:string;
    is_nalog:Integer;
    constructor Create(AOwner: TComponent; DataB: TISC_DB_HANDLE; m : TfmMode); reintroduce; overload;
  end;


implementation

uses AddInvKartForm, uAddMetall, uOperacii, uFind, Kernel, uCreateVed,
     AddGroupForm, MaskUtils, uAddNew_Object, ClassInvKart,
     uAmort_selection, uShowAmVed, uPrintAllDoc, uSpMatSchMulti,
     uPereocenka, uLookingHistory, WorldLookingKKart, uShowAllVedPereoc,
     uKapRem;

var
    Virtual_DataSet        : TpFIBDataSet;
    Virtual_StoredProc     : TpFIBStoredProc;

{$R *.dfm}


constructor TfmMainIvKartForm.Create(AOwner: TComponent; DataB: TISC_DB_HANDLE; m : TfmMode);
var
 w: TForm;
 TR : TfmWaite;
begin
    inherited Create (AOwner);
    w:=ShowWaitWindow(AOwner);
    DBHANDLE:= Datab;
    DatabaseMain.Handle := Datab;
    main_m := m;
    TransactionRead.DefaultDatabase := DatabaseMain;
    DatabaseMain.Connected := true;

    MrOkOrCancel := 0;

    Virtual_DataSet.Database    := DatabaseMain;
    Virtual_DataSet.Transaction := TransactionRead;
    id_user:=_CURRENT_USER_ID;
    name_user:=_CURRENT_USER_NAME;

    //***********  Расстановка доступа *****************************************
    ActionAdd.Enabled    := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Add', false)=0);
    N1.Enabled           := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Add', false)=0);

    ActionChange.Enabled := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Edit', false)=0);
    N2.Enabled           := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Edit', false)=0);

    ActionDelete.Enabled := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Del', false)=0);
    N3.Enabled           := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Del', false)=0);

    ActionPrint.Enabled  := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Print', false)=0);

    ToolButton7.Enabled  := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Work', false)=0);
    ButAmort.Enabled     := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Work', false)=0);
    Operacii1.Enabled    := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Work', false)=0);
    ved_main_menu.Enabled:= (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Work', false)=0);
    un_operaciya.Enabled := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Work', false)=0);

    //************  Конец расстановки прав доступа  ****************************


    cxLabelSelPoRah.Caption                      := MAT_INV_SCH;
    cxLabel_Sel_Mol.Caption                      := MAT_INV_MOL;
    cxButtonSetSelection.Caption                 := MAT_INV_sel_in_main;
    cxButton_Clearing.Caption                    := MAT_INV_clear;
    cxMemoNote.Clear;
    ToolButton5.Caption                          := MAT_INV_Print;
    ToolButton7.Caption                          := MAT_INV_oper;
    ButAmort.Caption                             := MAT_INV_Iznos;
    Operacii1.caption                            := MAT_INV_oper;
    Oprihod1.caption                             := MAT_INV_oprihodov;
    Vnutrperem1.caption                          := MAT_INV_vnutr;
    Vvodvexpl1.caption                           := MAT_INV_VvodvExpl;
    Spisanie1.caption                            := MAT_INV_Spisanie;
    Namoder1.caption                             := MAT_INV_Namoder;
    Pereocenka.caption                           := MAT_INV_Pereoc;
    LabelPrimechanie.Caption                     := MAT_INV_primitka;

    ActionLook.Caption                           := MAT_INV_look;
    ToolButton7.Hint                             := MAT_INV_oper;
    ActionLook.Hint                              := MAT_INV_look;

    Oprihod2.caption                             := MAT_INV_oprihodov;
    Vnutrperem2.caption                          := MAT_INV_vnutr;
    Vvodvexpl2.caption                           := MAT_INV_VvodvExpl;
    Spisanie2.caption                            := MAT_INV_Spisanie;
    Namoder2.caption                             := MAT_INV_Namoder;
    Pereocenka2.caption                          := MAT_INV_Pereoc;
    unOprihodovanie.caption                      := MAT_INV_un_oper;
    Invkniga1.Caption                            := MAT_INV_inv_kniga;
    cxLabel_Grp_num.caption                      := MAT_INV_Num_Grp;
    cxLabel_Inv_num_short.Caption                := MAT_INV_Inv_Num;

    spr_ost_price.Caption                        := MAT_INV_spr_ost_pr;
    ved_nal_os.Caption                           := MAT_INV_ved_nal_os;
    vedcomeos.Caption                            := MAT_INV_ved_come_os;
    vedoutos.Caption                             := MAT_INV_ved_out_os;
    InvopisOS.Caption                            := MAT_INV_inv_opis_os;
    matinvgrp.Caption                            := MAT_INV_inv_inv_grp;
    matnomngrp.Caption                           := MAT_INV_inv_nomn_grp;

    ActionAdd.Caption                            := MAT_INV_Add;
    ActionChange.Caption                         := MAT_INV_Change;
    ActionDelete.Caption                         := MAT_INV_Delete;
    ActionRefresh.Caption                        := MAT_INV_Refrash;
    ActionClose.Caption                          := MAT_INV_Close;
    ActionCancel.Caption                         := MAT_INV_Cansel;
    ActionFind.Caption                           := MAT_INV_Find;
    Caption                                      := MAT_INV_system_name + MAT_INV_Work_with_inv_kart_capsh;
    cxDBTreeListPapka.Columns[0].Caption.Text    := MAT_INV_Folders;
    cxGridInvKartDBTableView1DBColumn1.Caption   := MAT_INV_SCH;
    cxGridInvKartDBTableView1DBColumn2.Caption   := MAT_INV_MOL;
    cxGridInvKartDBTableView1DBColumn3.Caption   := MAT_INV_Name;
    cxGridInvKartDBTableView1DBColumn4.Caption   := MAT_INV_Bal_price;
    cxGridInvKartDBTableView1DBColumn8.Caption   := MAT_INV_Inv_Num;
    cxGrid_historyDBTableView1DBColumn1.Caption  := MAT_INV_oper_Labl_oper;
    cxGrid_historyDBTableView1DBColumn2.Caption  := MAT_INV_oper_date_doc;
    cxGrid_historyDBTableView1DBColumn3.Caption  := MAT_INV_oper_num_doc;
    cxGrid_historyDBTableView1DBColumn4.Caption  := MAT_INV_obj_sum;
    cxGridInvKartDBTableView1DBColumn5.Caption   := '';//MAT_INV_Mitka;
    cxGridInvKartDBTableView1DBColumn6.Caption   := MAT_STR_COL_DEP;
    TabSheet1.Caption                            := MAT_INV_Vklad_Osnovnie;
    TabSheet2.Caption                            := MAT_INV_Vklad_Amort;
    TabSheet3.Caption                            := MAT_INV_Vklad_Dop;
    TabSheet4.Caption                            := MAT_INV_Vklad_Dragmet;
    TabSheet5.Caption                            := MAT_INV_Vklad_Sost_obekta;
    TabSheet6.Caption                            := MAT_INV_history;
    cxLabelTypKart.Caption                       := MAT_INV_Tip_karti;
    cxLabelKartNum.Caption                       := MAT_INV_Num_kart;
    cxLabelStartPrice.Caption                    := MAT_INV_Nach_price;
    cxLabelStartIznos.Caption                    := MAT_INV_Nach_Iznos;
    cxLabelDateOprih.Width                       := 130;
    cxLabelOstPrice.Caption                      := MAT_INV_Ost_price;
    cxLabelOstIznos.Caption                      := MAT_INV_Ost_Iznos;
    cxLabelDateOstPrice.Caption                  := MAT_INV_Date_ost;
    cxLabelDateOprih.Caption                     := MAT_INV_Date_opr;
    cxLabelDateStartExpl.Caption                 := MAT_INV_date_nach_expl;
    cxLabelDateUpdate.Caption                    := MAT_INV_Date_Refrash;
    cxLabelDateOut.Caption                       := MAT_INV_Date_Exit;
    //Вкладка дополнительные
    cxLabelNote.Caption                          := MAT_INV_Primechanie;
    cxLabelZavNum.Caption                        := MAT_INV_Zav_num;
    cxLabelPassNum.Caption                       := MAT_INV_Pass_num;
    cxLabelModel.Caption                         := MAT_INV_Model;
    cxLabelMarka.Caption                         := MAT_INV_Marka;
    cxLabelDateCreate.Caption                    := MAT_INV_Date_vipuska;
    cxLabelDocReg.Caption                        := MAT_INV_Reg_doc;
    cxLabelDateReg.Caption                       := MAT_INV_Date_reg_doc;
    //Вкладка драгметалы
    cxGridDBTableViewDragMetalDBColumn1.Caption  := MAT_INV_Nazv_full;
    cxGridDBTableViewDragMetalDBColumn2.Caption  := MAT_INV_Nazv_Short;
    cxGridDBTableViewDragMetalDBColumn3.Caption  := MAT_INV_Kol_vo;
    //Вкладка аморотизация
    LabelMonthYear.Caption                       := MAT_INV_MonthYear;
    LabelPerNach_Perc.Caption                    := MAT_INV_PerNach_Perc;
    Label_buh_db_sch.Caption                     := MAT_INV_buh_db_sch;
    Label_buh_kr_sch.Caption                     := MAT_INV_buh_kr_sch;
    Label_am_grp.Caption                         := MAT_INV__am_grp;
    Label_method_name.Caption                    := MAT_INV__method_name;
    Labelminprice.Caption                        := MAT_INV_minprice;
    LabelPercent.Caption                         := MAT_INV_Percent;
    cxGroupBoxNal.caption                        := MAT_INV_GroupBoxNal;
    cxGroupBoxBuh.caption                        := MAT_INV_GroupBoxBuh;
    Label_Nal_db_sch.Caption                     := MAT_INV_buh_db_sch;
    Label_Nal_kr_sch.Caption                     := MAT_INV_buh_kr_sch;
    Label_Nal_am_grp.Caption                     := MAT_INV__am_grp;
    Label_Nal_method_name.Caption                := MAT_INV__method_name;
    Label_Nal_minprice.Caption                   := MAT_INV_minprice;
    Label_Nal_Percent.Caption                    := MAT_INV_Percent;
    Label_Nal_PerNach_Perc.Caption               := MAT_INV_PerNach_Perc;
    Label_Nal_MonthYear.Caption                  := MAT_INV_MonthYear;
    cxGridDBTableView1DBColumn1.caption          := MAT_INV_obj_material;
    cxGridDBTableView1DBColumn7.Caption          := MAT_INV_Name;
    cxGridDBTableView1DBColumn2.caption          := MAT_INV_obj_kol_sh;
    cxGridDBTableView1DBColumn3.caption          := MAT_INV_obj_sum;
    cxGridDBTableView1DBColumn4.caption          := MAT_INV_obj_siyz_sh;
    cxGridDBTableView1DBColumn5.caption          := MAT_INV_obj_koef_sh;
    cxGrid_historyDBTableView1DBColumn5.caption  := MAT_INV_mol_old;
    cxGrid_historyDBTableView1DBColumn6.caption  := MAT_INV_mol_new;
    cxGrid_historyDBTableView1DBColumn7.caption  := MAT_INV_sch_old;
    cxGrid_historyDBTableView1DBColumn8.caption  := MAT_INV_sch_new;
    cxGrid_historyDBTableView1DBColumn9.caption  := MAT_INV_ost_price_old;
    cxGrid_historyDBTableView1DBColumn10.caption := MAT_INV_ost_iznos_old;
    LabelBal.Caption                             := MAT_INV_Bal_price;

    UnChecked.caption                            := MAT_INV_un_metka;
    checkedall.caption                           := MAT_INV_pometit_all;
    UnCheckedall.caption                         := MAT_INV_unmetka_all;
    UnCheckedone.caption                         := MAT_INV_unmetka_one;
    //cxGridDBTableViewNote_objDBColumn1.caption   := MAT_INV_Primechanie;
    Print_inv_kart_main.Caption                  := MAT_INV_popup_print_main;
    Print_akt_priema_peredachi.Caption           := MAT_INV_priem_peredacha;
    Inv_sp_osn_sredstv.Caption                   := MAT_INV_inv_os;
    Akt_na_spisanie.Caption                      := MAT_INV_inv_spisanie;
    Print_dragMetall.Caption                     := MAT_INV_print_drag;

    ToolButton111.Hint                           := MAT_INV_Add;
    ToolButton2.Hint                             := MAT_INV_Change;
    ToolButton3.Hint                             := MAT_INV_Delete;
    ToolButton4.Hint                             := MAT_INV_Refrash;
    ToolButton5.Hint                             := MAT_INV_Print+'(Ctrl+P)';
    ToolButton6.Hint                             := MAT_INV_Find;
    ToolButton1.Hint                             := MAT_INV_Close;

    ved_main_menu.Caption                        := MAT_INV_ved_main_menu;
    looksrooved.Caption                          := MAT_INV_looksrooved;
    destroyved.Caption                           := MAT_INV_destroyved;
    create_ved.Caption                           := MAT_INV_create_ved;

    create_ved_main.Caption                      := MAT_INV_create_ved;
    looksrooved_main.Caption                     := MAT_INV_looksrooved;
    destroyved_main.Caption                      := MAT_INV_destroyved;

    Doocenka1.Caption                            := 'Дооцiнка';
    doocenka2.Caption                            := 'Дооцiнка';
    Komplectaciya2.Caption                       := 'Комплектацiя';
    Komplectaciya1.Caption                       := 'Комплектацiя';
    Razukomplect1.Caption                        := 'Разукомплектацiя';
    Razukomplect2.Caption                        := 'Разукомплектацiя';
    Chastspis1.Caption                           := 'Часткове списання';
    Chastspis2.Caption                           := 'Часткове списання';
    ved_peremesheniya.Caption                    := 'Ведомость перемещённых';
    

    acExport.Caption                              := MAT_ACTION_EXPORT_CONST;

    cxLabelKartNum.width                         := 120;
    cxLabelNote.Width                            := 120;
    cxLabelZavNum.Width                          := 120;
    cxLabelPassNum.Width                         := 120;
    cxLabelModel.Width                           := 120;
    cxLabelMarka.Width                           := 120;
    cxLabelDateCreate.Width                      := 120;
    cxLabelDocReg.Width                          := 120;
    cxLabelDateReg.Width                         := 120;
    cxSplitterNote_obj_control.CloseSplitter;

    fw := width;
    cxButtonEdit_Filtring_Po_Mol.left  := 187;
    fold := width;
    cxButton_Clearing.left             := width - 110;
    cxButtonSetSelection.left          := width - 215;
    cxButtonEdit_Filtring_Po_Mol.Width := width - cxComboBoxWorked.Width - cxButtonEdit_Filtring_Po_Mol.left - 220;
    cxComboBoxWorked.left              := width - cxComboBoxWorked.Width - 220;

    PageControl1.ActivePage:=TabSheet1;

    krt_praporec                                 := 1;
    DataSet_history.SQLs.SelectSQL.Text      := 'SELECT * FROM MAT_INV_SEL_TO_HISTORY(?R_ID_KART)';
    DataSetDrag.SQLs.SelectSQL.Text          := 'SELECT * FROM MAT_INV_SEL_DRAG_MET (?R_ID_KART)';
    DataSetOsn.SQLs.SelectSQL.Text           := 'SELECT * FROM MAT_INV_SEL_TO_GRID_2 (?R_ID_KART)';
    DataSet_NaTe_object.SQLs.SelectSQL.Text  := 'select * from MAT_INV_SEL_FOR_OBJECT (?R_ID_KART)';
    DataSetKart.SQLs.SelectSQL.Text          := 'SELECT * FROM MAT_INV_SEL_TO_GRID (?ID_INV_GRP) ORDER BY FIO_MOL';
    DS_KapRem.SQLs.SelectSQL.Text            := 'select * from MAT_INV_KAP_REM_SEL (?R_ID_KART)';

    cxGridInvKartDBTableView1DBColumn1.GroupIndex;
    DataSetPapka.Close;
    DataSetPapka.SQLs.SelectSQL.Text := 'SELECT * FROM MAT_DT_INV_GROUPS';

    Up_Date_filter := false;

    if DataSetKart['WORKED'] = 0 then
    begin
//        showmessage(' '+MAT_INV_worked);
    end;

    CloseWaitWindow(w);
    DataSourcePapka.Enabled :=false;
    DataSourceInvKart.Enabled := False;
    DataSetPapka.active := true;
    DataSetPapka.Locate('LINK_TO','-1', []);
    ActionFindExecute(Self);

    {TR := TfmWaite.creATE(self);
    TR.Label1.Caption := Global_constant_for_Hunter.Hunte_loading;
    Application.Initialize;
    TR.Show;
    TR.Repaint;
    TR.cxProgressBar1.Position := 50;
    }
    DataSourcePapka.Enabled :=true;

    {TR.cxProgressBar1.Position := 100;
    TR.Update;
    TR.Free;}
    cxDBTreeListPapka.Preview.TreeList.FullExpand;
    DataSourceInvKart.Enabled := true;

    if CheckBoxShowSumma.Checked = true then
    begin
        cxGridInvKartDBTableView1.OptionsView.Footer := true;
    end else
    begin
        cxGridInvKartDBTableView1.OptionsView.Footer := false;
    end;
     DS_KapRem.CloseOpen(false);
end;

procedure TfmMainIvKartForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmMainIvKartForm.ActionCloseExecute(Sender: TObject);
begin
    FormStorage1.StoredValue['save_pos_in_the_tree']:= DataSetPapka['ID_INV_GRP'];
    FormStorage1.StoredValue['save_pos_in_grid']    := DataSetKart['R_ID_KART'];
    Close;
end;

procedure TfmMainIvKartForm.ActionAddExecute(Sender: TObject);
var
    T   : TfmInvAddPapka;
    H   : TfmInvKartAdd;
    TR  : TfmAddDragMetall;
    Obj : TfmAddNewObject;
   id_kart : Int64;
   id_d    : Variant;
   inventarnik : String;
   inv, inv1, inv2, inv3, sch : String;
   grp  : String;
   tak  : string;
begin
    id_d := DataSetKart['R_ID_KART'];
    if cxDBTreeListPapka.IsFocused then
    begin
        if (DataSetPapka['HAS_CHILD'] = 0) or (DataSetPapka['HAS_CHILD'] = 2)  then
         begin
             //добавление папки
             T := TfmInvAddPapka.create(self, true);
             T.ShowModal;
             T.Free;
         end else
        begin
            ShowMessage(MAT_INV_Error_add_Papka);
        end;
        DataSetPapka.CloseOpen(false);
    end;
    if cxGridInvKart.IsFocused then
    begin
      if DataSetPapka['HAS_CHILD'] = 2 then
        begin
            ShowMessage(MAT_INV_Error_add_Kart);
            Exit;
        end;
            if (DataSetPapka['LINK_TO'] = -1) then
              begin
                 ShowMessage(MAT_INV_Error_add_to_main_Papka);
                 Exit;
              end else
        DataSourceInvKart.Enabled :=false;
                     begin
                        //добавление карточки
                         H := TfmInvKartAdd.Create(self, 0, 0);
                         H.id_man:=id_man;
                         H.cxButtonEditSelMOL.Text:=cxButtonEdit_Filtring_Po_Mol.Text;
                         H.ShowModal;
                         H.Free;
                     end;

        DataSetKart.Locate('R_ID_KART',id_d, []);
        LookSrooInvKartExecute(self);
        DataSourceInvKart.Enabled :=true;
    end;


     if cxGridDragMetal.IsFocused then
     begin
         TR := TfmAddDragMetall.create(self, True);
         TR.ShowModal;
         TR.Free;
     end;

     if cxGridObjects.IsFocused then
     begin
         id_d := DataSetKart['R_ID_KART'];
         Obj := TfmAddNewObject.create(self, True);
         Obj.ShowModal;
         Obj.Free;
         DataSet_NaTe_object.CloseOpen(False);
         cxGridObjects.SetFocus;
         DataSetKart.Locate('R_ID_KART',id_d, []);

     end;

     
end;

procedure TfmMainIvKartForm.ActionChangeExecute(Sender: TObject);
var
    T   : TfmInvAddPapka;
    H   : TfmInvKartAdd;
    TR  : TfmAddDragMetall;
    Obj : TfmAddNewObject;
   id_kart : Int64;
   inventarnik : String;
   inv, inv1, inv2, inv3, sch : String;
   grp  : String;
   tak  : string;
   id_d : Variant;
   obj_: Integer;
begin
//showmessage(inttostr(DataSet_NaTe_object.FieldByName('OBJ_ID').AsInteger));
 obj_:=0;
    MrOkOrCancel := 0;
    id_d := DataSetKart['R_ID_KART'];
    DataSourceInvKart.Enabled :=false;

    if cxDBTreeListPapka.IsFocused then
    begin
       if not DataSetPapka.IsEmpty then
       begin
           //изменение папки
           T := TfmInvAddPapka.create(self, false);
           T.ShowModal;
           T.Free;
       end;
       if MrOkOrCancel = 0 then DataSetPapka.CloseOpen(false);
    end;
    if cxGridInvKart.IsFocused then
    begin
       if not DataSetKart.IsEmpty then
       begin
           //изменение карточки
           if DataSetOsn.FieldByName('IS_NALOG_ACC').AsVariant = 1 then
           begin
                H := TfmInvKartAdd.Create(self, 1, 1);
                H.ShowModal;
                H.Free;
           end else
           begin
                H := TfmInvKartAdd.Create(self, 1, 0);
                H.ShowModal;
                H.Free;
           end;
       end;
    end;
    if cxGridDragMetal.IsFocused then
       begin
           TR := TfmAddDragMetall.create(self, False);
           TR.ShowModal;
           TR.Free;
       end;

     if cxGridObjects.IsFocused then
     begin
         if DataSet_NaTe_object['OBJ_ID'] = null then
         begin
             ShowMessage(MAT_INV_vot_urodi);
             Exit;
         end;
         Obj := TfmAddNewObject.create(self, False);
         Obj.ShowModal;
         Obj.Free;
         DataSet_NaTe_object.CloseOpen(False);

         obj_:=1;
     end;
if obj_ = 0 then
if MrOkOrCancel = 0 then DataSetKart.CloseOpen(False);
DataSetKart.Locate('R_ID_KART',id_d, []);
DataSourceInvKart.Enabled := true;
end;

procedure TfmMainIvKartForm.ActionRefreshExecute(Sender: TObject);
var
    id_d : int64;
begin
        id_d := DataSetPapka.FieldByname('ID_INV_GRP').AsVariant;
        DataSetPapka.CloseOpen(false);
        DataSetPapka.Locate('ID_INV_GRP',id_d, []);

        DataSourceInvKart.Enabled := false;
        LookSrooInvKartExecute(Sender);
        DataSourceInvKart.Enabled := true;

        {if Up_Date_filter = true then
        begin
            DataSetKart.close;
            DataSetKart.SelectSQL.Clear;
            DataSetKart.SQLs.SelectSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID (?ID_INV_GRP)';
            DataSetKart.Open;
            //DataSetKart.CloseOpen(false);
            Up_Date_filter := false;
        end;}
        
end;

procedure TfmMainIvKartForm.ActionDeleteExecute(Sender: TObject);
var
    id_del, id, id_d : int64;
begin
    if cxDBTreeListPapka.IsFocused then
    begin
        if DataSetPapka.IsEmpty then
        begin
            MessageBox(Handle, PChar(MAT_INV_Del_papka_not_Checked), PChar(MAT_INV_Error_Connect), 16);
            exit;
        end
        else begin
            if MessageBox(Handle, Pchar(MAT_INV_Delete_Papka+ ' ' + DataSetPapka.FieldByName('NAME_GRP').AsString+'?' ), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
            then
            begin
            if DataSetPapka.FieldByName('LINK_TO').AsInteger <> 0 then
            begin
                if DataSetPapka['LINK_TO'] = -1 then
                  begin
                      ShowMessage(MAT_INV_Del_papka_not_Checked);
                      Exit;
                  end else
                      begin
                         DataSourceInvKart.Enabled :=false;
                         id_del := DataSetPapka.FieldByname('LINK_TO').AsVariant;
                         ChangeChild(DataSetPapka.FieldByName('LINK_TO').AsVariant, 0);
                         DeletePapka(DataSetPapka['ID_INV_GRP']);

                         LookSrooInvKartExecute(self);
                         DataSourceInvKart.Enabled :=true;
                         //Special_actionExecute(Sender);
                         //DataSetPapka.Locate('ID_INV_GRP',id_del, []);
                         DataSetPapka.CloseOpen(false);
                      end;
            end;
        end;
    end;
    end;
    if cxGridInvKart.IsFocused then
    begin
        if DataSetKart.IsEmpty then
        begin
            MessageBox(Handle, PChar(MAT_INV_Dele_pole_not_insert), PChar(MAT_INV_Attention), 16);
            exit;
        end
        else begin
            if MessageBox(Handle,Pchar(MAT_INV_delete_pole+':  ' + DataSetKart.FieldByName('NAME_KART').AsString+'?'), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
            then
            begin
                // Удаляем поле
               if DataSetOsn.FieldByName('ID_OPER_OPR').Value <> '0' then
               begin
                   ShowMessage(MAT_INV_Error_for_del_kart);
                   Exit;
               end;
               if DataSetOsn.FieldByName('ID_OPER_EXPL').Value <> '0' then
               begin
                   ShowMessage(MAT_INV_Error_for_del_kart);
                   Exit;
               end;
               if DataSetOsn.FieldByName('ID_OPER_UPDATE').Value <> '0' then
               begin
                   ShowMessage(MAT_INV_Error_for_del_kart);
                   Exit;
               end;
               if DataSetOsn.FieldByName('ID_OPER_OUT').Value <> '0' then
               begin
                   ShowMessage(MAT_INV_Error_for_del_kart);
                   Exit;
               end;
                id_del := DataSetKart['ID_INV_GRP'];
                DeleteKartochku(DataSetKart['R_ID_KART']);
                //Special_actionExecute(Sender);
                LookSrooInvKartExecute(self);
                DataSetPapka.Locate('ID_INV_GRP',id_del, []);
            end;
        end;
    end;

    if cxGridDragMetal.IsFocused then
    begin
        if DataSetDrag.IsEmpty then
        begin
            MessageBox(Handle, PChar(MAT_INV_Dele_pole_not_insert), PChar(MAT_INV_Attention), 16);
            exit;
        end
        else begin
            if MessageBox(Handle,Pchar(MAT_INV_delete_pole+'?'), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
            then
            begin
                // Удаляем металл
                id := DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
                id_del := DataSetDrag['ID_FOR_DEL'];
                DeleteMetall(id_del);
                Special_actionExecute(Sender);
                DataSetPapka.Locate('ID_INV_GRP', id, []);
            end;
        end;
    end;


    if cxGridObjects.IsFocused then
    begin
        if DataSet_NaTe_object.IsEmpty then
        begin
            MessageBox(Handle, PChar(MAT_INV_Dele_pole_not_insert), PChar(MAT_INV_Attention), 16);
            exit;
        end
        else begin
            if MessageBox(Handle,Pchar(MAT_INV_delete_pole+':  ' + DataSet_NaTe_object.FieldByName('OBJ_NAME_NOMN').AsString+'?'), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
            then
            begin
                // Удаляем объект
                id := DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
                id_del := DataSet_NaTe_object['OBJ_ID'];
                id_d := DataSetKart['R_ID_KART'];
                DeleteObject(id_del);
                DataSet_NaTe_object.CloseOpen(False);
                //Special_actionExecute(Sender);
                DataSetPapka.Locate('ID_INV_GRP', id, []);
                DataSetKart.Locate('R_ID_KART',id_d, []);
            end;
        end;
    end;

end;

procedure TfmMainIvKartForm.cxGridInvKartDBTableView1DblClick(
  Sender: TObject);
var
    id : int64;
begin
        id := DataSetKart['R_ID_KART'];
        DataSetPapka.Locate('ID_INV_GRP', id, []);
    begin
        ToolButton2.Click;
    end;
end;

procedure TfmMainIvKartForm.ActionLastExecute(Sender: TObject);
var
    id : int64;
begin
    id := DataSetPapka['LINK_TO'];
    DataSetPapka.Locate('ID_INV_GRP', id, []);

end;

procedure TfmMainIvKartForm.DataSetOsnAfterScroll(DataSet: TDataSet);
var
   long_pole : string;
   i, prap_flag, d : integer;
   zpt, zpt1 : string;
begin
   if (cxTextEditKartNum.Text           <> null) and
      (cxTextEditStartPrice.Text        <> null) and
      (cxTextEditStartIznos.Text        <> null) and
      (cxTextEditTypKart.Text           <> null) and
      (cxTextEditOstPrice.Text          <> null) and
      (cxTextEditOstIznos.Text          <> null) and
      (cxTextEditDateOstPrice.Text      <> null) and
      (cxTextEditDateOprih.Text         <> null) and
      (cxTextEditDateUpdate.Text        <> null) and
      (cxTextEditDateOut.Text           <> null) and
      (cxTextEditDateStartExpl.Text     <> null) and
      (cxTextEditZavNum.Text            <> null) and
      (cxTextEditPassNum.Text           <> null) and
      (cxTextEditModel.Text             <> null) and
      (cxTextEditMarka.Text             <> null) and
      (cxTextEditDateCreate.Text        <> null) and
      (cxTextEditDocReg.Text            <> null) and
      (cxTextEditDateReg.Text           <> null) and
      (cxTextEditYear.Text              <> null) and
      (cxTextEditMonth.text             <> null) and
      (cxCurrencyEditPercent.Text       <> null) and
      (cxCurrencyEditminprice.Text      <> null) and
      (cxTextEdit_method_name.text      <> null) and
      (cxTextEdit_am_grp.Text           <> null) and
      (cxTextEdit_buh_kr_sch.Text       <> null) and
      (cxTextEdit_buh_db_sch.Text       <> null) and
      (cxTextEdit_Nal_Year.Text         <> null) and
      (cxTextEdit_Nal_Month.text        <> null) and
      (cxCurrencyEdit_Nal_Percent.Text  <> null) and
      (cxCurrencyEdit_Nal_minprice.Text <> null) and
      (cxTextEdit_Nal_method_name.text  <> null) and
      (cxTextEdit_Nal_am_grp.Text       <> null) and
      (cxTextEdit_Nal_kr_sch.Text       <> null) and
      (cxTextEdit_Nal_db_sch.Text       <> null) and
      (cxTextEdit_Inv_num.Text          <> null) and
      (cxTextEdit_grp_num.Text          <> null) and
      (cxCurrencyEditBal.Text           <> null) and
      (cxMemoNote.Text                  <> null) then
    begin
        cxTextEditKartNum.Text              :=DataSetOsn.FieldByName('KART_NUM').AsString;
        cxTextEditStartPrice.Text           :=DataSetOsn.FieldByName('BEG_PRICE').AsString;
        cxTextEditStartIznos.Text           :=DataSetOsn.FieldByName('BEG_IZNOS').AsString;
        cxTextEditTypKart.Text              :=DataSetOsn.FieldByName('TIP_KRT').AsString;
        cxTextEditOstPrice.Text             :=DataSetOsn.FieldByName('OST_PRICE').AsString;
        cxTextEditOstIznos.Text             :=DataSetOsn.FieldByName('OST_IZNOS').AsString;
        cxTextEdit_Inv_num.Text             :=DataSetOsn.FieldByName('INV_NUM').AsString;
        cxTextEdit_grp_num.Text             :=DataSetOsn.FieldByName('GRP_NUM').AsString;

        cxTextEditZavNum.Text               :=DataSetOsn.FieldByName('ZAV_NUM').AsString;
        cxTextEditPassNum.Text              :=DataSetOsn.FieldByName('PASS_NUM').AsString;
        cxTextEditModel.Text                :=DataSetOsn.FieldByName('MODEL').AsString;
        cxTextEditMarka.Text                :=DataSetOsn.FieldByName('MARK').AsString;

        cxMemoNote.Text                     :=DataSetOsn.FieldByName('NOTE').AsString;
        cxTextEditYear.Text                 :=DataSetOsn.FieldByName('NORM_YEAR').AsString;
        cxTextEditMonth.Text                :=DataSetOsn.FieldByName('NORM_MONTH').AsString;
        print_id                            :=DataSetOsn.FieldByName('R_ID_KART').AsString;
        cxCurrencyEditPercent.Text          :=DataSetOsn.FieldByName('AMORT_PERC').AsString;
        cxCurrencyEditminprice.Text         :=DataSetOsn.FieldByName('MIN_PRICE').AsString;
        cxTextEdit_method_name.text         :=DataSetOsn.FieldByName('METHOD_NAME').AsString;
        cxTextEdit_am_grp.Text              :=DataSetOsn.FieldByName('NAME_NORM').AsString;
        cxTextEdit_buh_kr_sch.Text          :=DataSetOsn.FieldByName('BUH_KR_SCH').AsString;
        cxTextEdit_buh_db_sch.Text          :=DataSetOsn.FieldByName('BUH_DB_SCH').AsString;

        cxCurrencyEditBal.Text              :=DataSetOsn.FieldByName('bal_price').AsString;


        cxTextEditDateOstPrice.Text         :=DataSetOsn.FieldByName('DATE_OST').AsString;
        cxTextEditDateOprih.Text            :=DataSetOsn.FieldByName('DATE_OPR').AsString;
        cxTextEditDateStartExpl.Text        :=DataSetOsn.FieldByName('DATE_EXPL').AsString;
        cxTextEditDateUpdate.Text           :=DataSetOsn.FieldByName('DATE_UPDATE').AsString;
        cxTextEditDateOut.Text              :=DataSetOsn.FieldByName('DATE_OUT').AsString;

        cxTextEditDateCreate.Text           :=DataSetOsn.FieldByName('DATE_CREATE').AsString;
        cxTextEditDocReg.Text               :=DataSetOsn.FieldByName('DOC_REG').AsString;
        cxTextEditDateReg.Text              :=DataSetOsn.FieldByName('DATE_REG').AsString;

        if cxTextEditDateCreate.Text = '30.12.1900' then
        begin
            cxTextEditDateCreate.Text := '';
        end;
        if cxTextEditDateReg.Text = '30.12.1900' then
        begin
            cxTextEditDateReg.Text := '';
        end;

        if cxTextEditDateOprih.Text = '30.12.1900' then
        begin
            cxTextEditDateOprih.Text := '';
        end;
        if cxTextEditDateStartExpl.Text = '30.12.1900' then
        begin
            cxTextEditDateStartExpl.Text := '';
        end;
        if cxTextEditDateUpdate.Text = '30.12.1900' then
        begin
            cxTextEditDateUpdate.Text := '';
        end;
        if cxTextEditDateOut.Text = '30.12.1900' then
        begin
            cxTextEditDateOut.Text := '';
        end;



        if (cxTextEditDateCreate.Text = '30.12.1899') or (cxTextEditDateCreate.Text = '30.12.2999') then
        begin
            cxTextEditDateCreate.Text         := '';
        end;
        if (cxTextEditDocReg.Text = '30.12.1899') or (cxTextEditDocReg.Text = '30.12.2999') then
        begin
            cxTextEditDocReg.Text         := '';
        end;
        if (cxTextEditDateReg.Text = '30.12.1899') or (cxTextEditDateReg.Text = '30.12.2999') then
        begin
            cxTextEditDateReg.Text         := '';
        end;

        if (cxTextEditDateOstPrice.Text = '30.12.1899') or (cxTextEditDateOstPrice.Text = '30.12.2999') then
        begin
            cxTextEditDateOstPrice.Text         := '';
        end;
        if (cxTextEditDateOprih.Text = '30.12.1899') or (cxTextEditDateOprih.Text = '30.12.2999') then
        begin
            cxTextEditDateOprih.Text         := '';
        end;
        if (cxTextEditDateStartExpl.Text = '30.12.1899') or (cxTextEditDateStartExpl.Text = '30.12.2999') then
        begin
            cxTextEditDateStartExpl.Text         := '';
        end;
        if (cxTextEditDateUpdate.Text = '30.12.1899') or (cxTextEditDateUpdate.Text = '30.12.2999') then
        begin
            cxTextEditDateUpdate.Text         := '';
        end;
        if (cxTextEditDateOut.Text = '30.12.1899') or (cxTextEditDateOut.Text = '30.12.2999') then
        begin
            cxTextEditDateOut.Text         := '';
        end;


        if DataSetOsn.FieldByName('IS_NALOG_ACC').Asvariant = 1 then
        begin
            cxSplitter3.OpenSplitter;
            cxSplitter3.Visible  :=true;
            cxTextEdit_Nal_Year.Text            := DataSetOsn.FieldByName('NAL_NORM_YEAR').AsString;
            cxTextEdit_Nal_Month.Text           := DataSetOsn.FieldByName('NAL_NORM_MONTH').AsString;
            cxCurrencyEdit_Nal_Percent.Text     := DataSetOsn.FieldByName('NAL_AMORT_PERC').AsString;
            cxCurrencyEdit_Nal_minprice.Text    := DataSetOsn.FieldByName('NAL_MIN_PRICE').AsString;
            cxTextEdit_Nal_method_name.Text     := DataSetOsn.FieldByName('NAL_METHOD_NAME').AsString;
            cxTextEdit_Nal_am_grp.Text          := DataSetOsn.FieldByName('NAL_NAME_NORM').AsString;
            cxTextEdit_Nal_kr_sch.Text          := DataSetOsn.FieldByName('NAL_KR_SCH').AsString;
            cxTextEdit_Nal_db_sch.Text          := DataSetOsn.FieldByName('NAL_DB_SCH').AsString;
            BegPriceNal.Text                    := DataSetOsn.FieldByName('BEG_PRICE_NAL').AsString;
            BegIznosNal.Text                    := DataSetOsn.FieldByName('BEG_IZNOS_NAL').AsString;
            OstPriceNal.Text                    := DataSetOsn.FieldByName('OST_PRICE_NAL').AsString;
            OstIznosNal.Text                    := DataSetOsn.FieldByName('OST_IZNOS_NAL').AsString;
            DateOstNal.Text                     := DataSetOsn.FieldByName('BEG_PRICE_NAL').AsString;
        end else
               begin
                   cxSplitter3.CloseSplitter;
                   cxSplitter3.Visible             := false;
                   cxTextEdit_Nal_db_sch.Text      := '0';
                   cxTextEdit_Nal_kr_sch.Text      := '0';
                   cxTextEdit_Nal_am_grp.Text      := '0';
                   cxTextEdit_Nal_method_name.Text := '0';
                   cxCurrencyEdit_Nal_minprice.Text:= '0';
                   cxCurrencyEdit_Nal_Percent.Text := '0';
                   cxTextEdit_Nal_PerNach_Perc.Text:= '0';
                   cxTextEdit_Nal_Year.Text        := '0';
                   cxTextEdit_Nal_Month.Text       := '0';
               end;
        cxTextEditPerNach_Perc.Text         := MAT_INV_const_PerNach_Perc;
        cxTextEdit_Nal_PerNach_Perc.Text    := MAT_INV_const_PerNach_Perc;

        //*******************************************//

        if(cxTextEditYear.Text = '2') or (cxTextEditYear.Text = '3') or (cxTextEditYear.Text = '4') then
        begin
            LabelGod.Caption:= MAT_INV_const_Goda;
        end else
            begin
                LabelGod.Caption := MAT_INV_const_Let;
            end;
        if (cxTextEditYear.Text = '1') then
        begin
            LabelGod.Caption:= MAT_INV_const_God;
        end;
        //****************************************************//
        if(cxTextEdit_Nal_Year.Text = '2') or (cxTextEdit_Nal_Year.Text = '3') or (cxTextEdit_Nal_Year.Text = '4') then
        begin
            Label_Nal_God.Caption := MAT_INV_const_Goda;
        end else
            begin
                Label_Nal_God.Caption := MAT_INV_const_Let;
            end;
        if (cxTextEdit_Nal_Year.Text = '1') then
        begin
            Label_Nal_God.Caption := MAT_INV_const_God;
        end;

        //**************************************************//

        if (cxTextEditMonth.Text = '2') or (cxTextEditMonth.Text = '3') or (cxTextEditMonth.Text = '4') then
        begin
            LabelMonth.Caption:= MAT_INV_const_mesyaca;
        end else
        begin
            LabelMonth.Caption:= MAT_INV_const_mesyacev;
        end;
        if cxTextEditMonth.text = '1' then
        begin
            LabelMonth.Caption:= MAT_INV_const_mesyac;
        end;
        //***********************************************************//
        if (cxTextEdit_Nal_Month.Text = '2') or (cxTextEdit_Nal_Month.Text = '3') or (cxTextEdit_Nal_Month.Text = '4') then
        begin
            Label_Nal_mes.Caption := MAT_INV_const_mesyaca;
        end else
        begin
            Label_Nal_mes.Caption :=  MAT_INV_const_mesyacev;
        end;
        if cxTextEdit_Nal_Month.Text = '1' then
        begin
            Label_Nal_mes.Caption := MAT_INV_const_mesyac;
        end;
        //***************************************************//
        if DataSetOsn.FieldByName('NORM_PER_PERIOD').AsVariant = 0 then
        begin
            cxTextEditPerNach_Perc.Text := MAT_INV_const_Pomesyachno;
        end;
        if DataSetOsn.FieldByName('NORM_PER_PERIOD').AsVariant = 1 then
        begin
            cxTextEditPerNach_Perc.Text := MAT_INV_const_Pokvartalno;
        end;
        if DataSetOsn.FieldByName('NORM_PER_PERIOD').AsVariant = 2 then
        begin
            cxTextEditPerNach_Perc.Text := MAT_INV_const_Ejegodno;
        end;
        //*****************************************************//
        if DataSetOsn.FieldByName('NAL_NORM_PER_PERIOD').AsVariant = 0 then
        begin
            cxTextEdit_Nal_PerNach_Perc.Text := MAT_INV_const_Pomesyachno;
        end;
        if DataSetOsn.FieldByName('NAL_NORM_PER_PERIOD').AsVariant = 1 then
        begin
            cxTextEdit_Nal_PerNach_Perc.Text := MAT_INV_const_Pokvartalno;
        end;
        if DataSetOsn.FieldByName('NAL_NORM_PER_PERIOD').AsVariant = 2 then
        begin
            cxTextEdit_Nal_PerNach_Perc.Text:= MAT_INV_const_Ejegodno;
        end;
    end;
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxCurrencyEditBal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxCurrencyEditBal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxCurrencyEditBal.Clear;
                    cxCurrencyEditBal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxCurrencyEditBal.Clear;
                cxCurrencyEditBal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxCurrencyEditBal.Clear;
                cxCurrencyEditBal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditStartPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditStartPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditStartPrice.Clear;
                    cxTextEditStartPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditStartPrice.Clear;
                cxTextEditStartPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditStartPrice.Clear;
                cxTextEditStartPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditStartIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditStartIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditStartIznos.Clear;
                    cxTextEditStartIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditStartIznos.Clear;
                cxTextEditStartIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditStartIznos.Clear;
                cxTextEditStartIznos.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditOstPrice.Clear;
                    cxTextEditOstPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditOstIznos.Clear;
                    cxTextEditOstIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
end;

procedure TfmMainIvKartForm.N1Click(Sender: TObject);
var
    TR  : TfmAddDragMetall;
    Obj : TfmAddNewObject;
    id  : integer;
begin
  id:=DataSetKartR_ID_KART.AsInteger;
begin
     if cxGridDragMetal.IsFocused then
     begin
         TR := TfmAddDragMetall.create(self, True);
         TR.ShowModal;
         TR.Free;
         DataSetKart.Locate('R_ID_KART', id, []);
     end;
end;

begin
     if cxGridObjects.IsFocused then
     begin
         Obj := TfmAddNewObject.create(self, True);
         Obj.ShowModal;
         Obj.Free;
         DataSetKart.Locate('R_ID_KART', id, []);
         DataSet_NaTe_object.CloseOpen(False);
     end;
end;

end;

procedure TfmMainIvKartForm.N3Click(Sender: TObject);
var
    id_del, id, id_kart : int64;
begin
  id_kart:=DataSetKartR_ID_KART.AsInt64;
begin
    if cxGridDragMetal.IsFocused then
    begin
        if DataSetDrag.IsEmpty then
        begin
            MessageBox(Handle, PChar(MAT_INV_Dele_pole_not_insert), PChar(MAT_INV_Attention), 16);
            exit;
        end
        else begin
            if MessageBox(Handle,Pchar(MAT_INV_delete_pole+':  ' + DataSetDrag.FieldByName('DRAG_NAME').AsString+'?'), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
            then
            begin
                // Удаляем металл
                id := DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
                id_del := DataSetDrag['ID_FOR_DEL'];
                DeleteMetall(id_del);
                ActionRefreshExecute(Sender);
                DataSetPapka.Locate('ID_INV_GRP', id, []);
            end;
        end;
    end;
    end;
begin
    if cxGridObjects.IsFocused then
    begin
        if DataSetOsn.IsEmpty then
        begin
            MessageBox(Handle, PChar(MAT_INV_Dele_pole_not_insert), PChar(MAT_INV_Attention), 16);
            exit;
        end
        else begin
            if MessageBox(Handle,Pchar(MAT_INV_delete_pole+':  ' + DataSetOsn.FieldByName('OBJ_NAME_NOMN').AsString+'?'), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
            then
            begin
                // Удаляем объект
                id := DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
                id_del := DataSetOsn['OBJ_ID'];
                DeleteObject(id_del);
                ActionRefreshExecute(Sender);
                DataSetPapka.Locate('ID_INV_GRP', id, []);
                DataSetKart.Locate('R_ID_KART', id_kart, []);
                DataSet_NaTe_object.CloseOpen(False);
            end;
        end;
    end;
    end;
end;

procedure TfmMainIvKartForm.N2Click(Sender: TObject);
var
    TR  : TfmAddDragMetall;
    Obj : TfmAddNewObject;
    id  : Int64;
begin
  id:=DataSetKartR_ID_KART.AsInteger;
begin
     if cxGridDragMetal.IsFocused then
       begin
           TR := TfmAddDragMetall.create(self, False);
           TR.ShowModal;
           TR.Free;
           DataSetKart.Locate('R_ID_KART',id,[]);
       end;
end;

begin
     if cxGridObjects.IsFocused then
     begin
         Obj := TfmAddNewObject.create(self, False);
         Obj.ShowModal;
         Obj.Free;
         DataSetKart.Locate('R_ID_KART',id,[]);
         DataSet_NaTe_object.CloseOpen(False);
     end;
end;

end;

procedure TfmMainIvKartForm.unOprihod1Click(Sender: TObject);
var
   idd, id_oper, id_kart : int64;
begin
    id_kart := DataSetOsn.FieldByName('R_ID_KART').AsVariant;
    idd     := DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
    if DataSetOsn['ID_OPER_OPR'] <> 0 then
    begin
        if MessageBox(Handle, Pchar(MAT_INV_opov_ob_otmene_oper), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
            then
            begin
                id_oper    := 0;
                Update_oprih(id_kart, id_oper, '30.12.2999');
                ActionRefreshExecute(Sender);
                DataSetPapka.Locate('ID_INV_GRP', idd, []);
            end;
    end else
    begin
        showmessage(MAT_INV_Error_oper_otmena);
    end;
end;


procedure TfmMainIvKartForm.unVnutrperem1Click(Sender: TObject);
var
   idd, id_oper, id_kart : int64;
begin
    id_kart := DataSetOsn.FieldByName('R_ID_KART').AsVariant;
    idd     := DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
    if DataSetOsn['ID_OPER_EXPL'] <> 0 then
    begin
        if MessageBox(Handle, Pchar(MAT_INV_opov_ob_otmene_oper), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
            then
            begin
                id_oper    := 0;
                Update_expl(id_kart, id_oper, '30.12.2999',0);
                ActionRefreshExecute(Sender);
                DataSetPapka.Locate('ID_INV_GRP', idd, []);
            end;
    end else
    begin
        showmessage(MAT_INV_Error_oper_otmena);
    end;
end;


procedure TfmMainIvKartForm.unoperout1Click(Sender: TObject);
var
   idd, id_kart : int64;
begin
    id_kart := DataSetOsn.FieldByName('R_ID_KART').AsVariant;
    idd     := DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
    if DataSetOsn['ID_OPER_OUT'] <> 0 then
    begin
        if MessageBox(Handle, Pchar(MAT_INV_opov_ob_otmene_oper), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
            then
            begin
                Update_out(id_kart, '30.12.2999');
                ActionRefreshExecute(Sender);
                DataSetPapka.Locate('ID_INV_GRP', idd, []);
            end;
    end else
    begin
        showmessage(MAT_INV_Error_oper_otmena);
    end;
end;

procedure TfmMainIvKartForm.smoder1Click(Sender: TObject);
var
    T : TfmOperacion;
    id_db, id_kr, id_sch : int64;
    sch, db, kr, iznos, ost_price, beg_pr : string;
    Period : TDateTime;
begin
    multi_sel_id := '';
    if DataSetOsn['ID_OPER_OPR'] > 0 then
    begin
        if DataSetOsn['BUH_DB_SCH'] = null then
        begin
            db := ' ';
        end else
        begin
            db  := DataSetOsn['BUH_DB_SCH'];
        end;
        if DataSetOsn['BUH_KR_SCH'] = null  then
        begin
            kr  := ' ';
        end else
        begin
            kr  := DataSetOsn['BUH_KR_SCH'];
        end;
        if DataSetOsn['ID_BUH_DB'] =null then
        begin
            id_db := 0;
        end else
        begin
            id_db := DataSetOsn['ID_BUH_DB'];
        end;
        if DataSetOsn['ID_BUH_KR'] = null then
        begin
            id_kr := 0;
        end else
        begin
            id_kr := DataSetOsn['ID_BUH_KR'];
        end;
        if DataSetKart['ID_SCHS'] = null then
        begin
            id_sch := 0;
        end else
        begin
            id_sch := DataSetKart['ID_SCHS'];
        end;
        if DataSetKart['NUM_SCH'] = null then
        begin
            sch    := ' ';
        end else
        begin
            sch    := DataSetKart['NUM_SCH'];
        end;
        if DataSetKart['OST_PRICE'] = null then
        begin
            ost_price := '0';
        end else
        begin
            ost_price := DataSetKart['OST_PRICE'];
        end;
        if DataSetKart['IZNOS'] = null then
        begin
            iznos     := '0';
        end else
        begin
            iznos     := DataSetKart['IZNOS'];
        end;
        if DataSetKart['BAL_PRICE'] = null then
        begin
            beg_pr    := '0';
        end else
        begin
            beg_pr    := DataSetKart['BAL_PRICE'];
        end;
        Period    := DataSetOsn['Period'];
        T := TfmOperacion.create(self, true, 6, db, kr, sch, id_db, id_kr, id_sch, ost_price, iznos, beg_pr, Period, multi_sel_id);
        T.ShowModal;
        T.Free;
        ActionRefreshExecute(Sender);
    end else showmessage(MAT_INV_opov_oper);
end;

procedure TfmMainIvKartForm.ToolButton14Click(Sender: TObject);
begin
    Close;
end;

procedure TfmMainIvKartForm.ActionFindExecute(Sender: TObject);
VAR
    res : Variant;
    id_d : int64;
begin
    DataSourceInvKart.Enabled := false;
    if Up_Date_filter = false then
    begin
        sch_name  := '';
        FIO_name  := '';
        dep_name  := '';
        nomn_name := '';
        sch_idih  := 0;
        id_nomn   := 0;
        id_man    := 0;
        id_spodr   := 0;
        grp1      := '';
        grp2      := '';
        inv1      := '';
        inv2      := '';
        TIP_KART  := '';
        krt1      := '';
        krt2      := '';
        working   := -1;
        is_nalog  := 0;
        is_buh    := 1;
        id_db     := 0;
        id_kr     := 0;
        db_name   := '';
        kr_name   := '';
        beg_price_beg := '0.00';
        beg_price_end := '0.00';
        all       := 1;
        expl      := 0;
        out_proch := 0;
        date_expl1:= '';
        date_expl2:= '';
        date_out1 := '';
        date_out2 := '';
        date_opr1 := '';
        date_opr2 := '';
        date_up1 := '';
        date_up2 := '';
        beg_ost_pr:= '0.00';
        end_ost_pr:= '0.00';
        beg_ost_iz:= '0.00';
        end_ost_iz:= '0.00';
        ostPriceCheck := 0;
        ostIznosCheck := 0;
        balPriceCheck := 0;
        name_nomn     := '';
        filter_fg     := false;
        id_filter     := 0;
        BuhPers       :=False;
    end;
    if beg_price_beg  = '' then beg_price_beg := '0.00';
    if beg_price_end  = '' then beg_price_end := '0.00';
    if beg_ost_pr = '' then beg_ost_pr:= '0.00';
    if end_ost_pr = '' then end_ost_pr:= '0.00';
    if beg_ost_iz = '' then beg_ost_iz:= '0.00';
    if end_ost_iz = '' then end_ost_iz:= '0.00';

    if beg_price_beg  = '' then beg_price_beg := '0.00';
    if beg_price_end  = '' then beg_price_end := '0.00';
    if beg_ost_pr = '0' then beg_ost_pr:= '0.00';
    if end_ost_pr = '0' then end_ost_pr:= '0.00';
    if beg_ost_iz = '0' then beg_ost_iz:= '0.00';
    if end_ost_iz = '0' then end_ost_iz:= '0.00';

    //ShowMessage('sch_name='+sch_name);

    res := uFind.Find(self, true, self, sch_name, FIO_name, dep_name, nomn_name, sch_idih, id_nomn, id_man, id_spodr, grp1, grp2, inv1, inv2, TIP_KART, krt1, krt2, working, is_nalog, id_db, id_kr, db_name, kr_name, beg_price_beg, beg_price_end, all, expl, out_proch, date_expl1, date_expl2, date_out1, date_out2, date_opr1, date_opr2, date_up1, date_up2, beg_ost_pr, end_ost_pr, beg_ost_iz, end_ost_iz, ostPriceCheck, ostIznosCheck, balPriceCheck, is_buh, name_nomn,DatabaseMain.Handle, filter_fg, id_filter, BuhPers);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
                sch_idih         := res[0];
                id_nomn          := res[1];
                id_man           := res[2];
                grp1             := res[3];
                grp2             := res[4];
                inv1             := res[5];
                inv2             := res[6];
                sch_name         := res[7];
                FIO_name         := res[8];
                dep_name         := res[43];
                id_spodr         := res[44];
                nomn_name        := res[9];
                TIP_KART         := res[10];
                krt1             := res[11];
                krt2             := res[12];
                is_nalog         := res[13];
                working          := res[14];
                db_name          := res[15];
                kr_name          := res[16];
                id_db            := res[17];
                id_kr            := res[18];
                beg_price_beg    := res[19];
                all              := res[20];
                expl             := res[21];
                out_proch        := res[22];
                date_expl1       := res[23];
                date_expl2       := res[24];
                date_out1        := res[25];
                date_out2        := res[26];
                date_opr1        := res[27];
                date_opr2        := res[28];
                date_up1         := res[29];
                date_up2         := res[30];
                beg_ost_pr       := res[31];
                end_ost_pr       := res[32];
                beg_ost_iz       := res[33];
                end_ost_iz       := res[34];
                ostPriceCheck    := res[35];
                ostIznosCheck    := res[36];
                balPriceCheck    := res[37];
                is_buh           := res[38];
                name_nomn        := res[39];
                filter_fg        := res[40];
                id_filter        := res[41];
                beg_price_end    := res[42];
                BuhPers          := res[45];

                cxButtonEditFiltring_Po_Sch.Text  := sch_name;
                cxButtonEdit_Filtring_Po_Mol.Text := FIO_name;

                cxComboBoxWorked.ItemIndex:=working+1;

                Up_Date_filter := true;
//*************   Обработка данных из фильтра и загрузка их в dataset   ********
                DatasetPapka.Open;
                cxDBTreeListPapka.Preview.TreeList.FullExpand;

                LookSrooInvKartExecute(Sender);
                DataSourceInvKart.Enabled := true;
{                if (sch_idih = 0) and (id_nomn = 0) and (id_man = 0) and (grp1 = '') and (grp2 = '') and (inv1 = '') and
                (inv2 = '') and (TIP_KART = '') and (krt1 = '') and (krt2 = '') and (is_nalog = 0) and
                (id_db = 0) and (id_kr = 0) and (beg_price_beg = '') and (beg_price_end = '') and (date_expl1= '') and (date_expl2 = '') and (expl = 0) and
                (all = 0) and (out_proch = 0) and (date_out1 = '') and (date_out2 = '') and (date_opr1 = '') and (date_opr2 = '') and
                (date_up1 = '') and (date_up2 = '') and (name_nomn = '') then
                begin
                    id_d := DataSetPapka.FieldByname('ID_INV_GRP').AsVariant;
                    DataSetPapka.CloseOpen(false);
                    DataSetPapka.Locate('ID_INV_GRP',id_d, []);
                    DataSetKart.close;
                    DataSetKart.SelectSQL.Clear;
                    DataSetKart.SQLs.SelectSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID (?ID_INV_GRP)';
                    DataSetKart.Open;
                    DataSetKart.closeopen(false);
                    Up_Date_filter := false;
                end;
}        end;
    end;
 //   cxDBTreeListPapkaClick(self);
end;

procedure TfmMainIvKartForm.cxDBTreeListPapkaClick(Sender: TObject);
var
    id_d : int64;
    TT : TfmWaite;
begin
    LookSrooInvKartExecute(self);
end;

procedure TfmMainIvKartForm.smoder2Click(Sender: TObject);
var
   idd, id_kart, j : int64;
   ost_pr, dengi1, dengi2, dengi: String;
   ost_price_old : string;
   ost_iznos_old : string;
   ost_price_new : string;
   ost_iznos_new : string;
   Kakaya_oper   : Integer;
   iznos         : string;
   summa         : string;
   id_user       : int64;
   computer_name : string;
   user_name     : string;
   id_mo_old     : int64;
   id_mo_new     : int64;
   id_sch_old    : int64;
   id_sch_new    : int64;
   doc_rec       : string;
   Doc_num       : string;
   Date_doc      : string;
begin
    id_kart := DataSetOsn.FieldByName('R_ID_KART').AsVariant;
    idd     := DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
    ost_pr  := DataSetOsn.FieldByName('OST_PRICE').AsVariant;
    if DataSetOsn['ID_OPER_UPDATE'] <> 0 then
    begin
        if MessageBox(Handle, Pchar(MAT_INV_opov_ob_otmene_oper), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
            then
            begin
                DataSetOperacii.close;
                DataSetOperacii.SelectSQL.Clear;
                DataSetOperacii.SelectSQL.Add('SELECT * FROM MAT_INV_CANSEL_MODERN ('+IntToStr(id_kart)+', '''+ost_pr+''', 5)');
                DataSetOperacii.Open;
                DataSetOperacii.closeopen(false);
                dengi1  := DataSetOperacii.FieldByName('OST_PRICE_NEW').AsString;
                dengi2  := DataSetOperacii.FieldByName('OST_PRICE_OLD').AsString;
                dengi   := CurrToStr(StrToCurr(dengi1) - StrToCurr(dengi2));
                summa   := dengi;
                dengi   := CurrToStr(StrToCurr(dengi1) - StrToCurr(dengi));
                if dengi = '0' then
                begin
                    dengi   := dengi1;
                end;
                Update_modern_cansel(id_kart, 0, '30.12.2999', dengi, iznosec);
//***********Запись в справочник операций   ************************************
                begin
                    DecimalSeparator := '.';
                    ost_price_new           := dengi;
                    ost_price_old           := DataSetOperacii.FieldByName('OST_PRICE_OLD').AsString;
                    ost_iznos_new           := DataSetOperacii.FieldByName('OST_IZNOS_NEW').AsString;
                    ost_iznos_old           := DataSetOperacii.FieldByName('OST_IZNOS_OLD').AsString;

                    Kakaya_oper             := 6;
                    id_mo_old               := DataSetOperacii['ID_MO_OLD'];
                    id_mo_new               := DataSetOperacii['ID_MO_NEW'];
                    id_sch_old              := DataSetOperacii['ID_SCH_OLD'];
                    id_sch_new              := DataSetOperacii['ID_SCH_NEW'];
                    doc_rec                 := DataSetKart['DOC_REC'];
                    Doc_num                 := DataSetOperacii['NUM_DOC'];
                    Date_doc                := DataSetOperacii['DATE_DOC'];
                    iznos                   := DataSetKart['IZNOS'];
                    id_user                 := 0;
                    computer_name           := '';

                try
                    j:= Provodki(Kakaya_oper, Doc_num, Date_doc, doc_rec, id_mo_old, id_mo_new, id_sch_old, id_sch_new, StringReplace(ost_price_old,',','.',[]), StringReplace(ost_price_new,',','.',[]), StringReplace(ost_iznos_old,',','.',[]), StringReplace(ost_iznos_new,',','.',[]), StringReplace(iznos,',','.',[]), StringReplace(summa,',','.',[]), 0, id_kart, id_user, computer_name);
                except on E:Exception
                do begin
                    MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                    Application.Terminate;
                end;
                end;
                If j > 0 then
                begin
                    DecimalSeparator := ',';
                end;
              end;
//**************  Конец записи в историю операций     **************************

                ActionRefreshExecute(Sender);
                DataSetPapka.Locate('ID_INV_GRP', idd, []);
            end;
    end else
    begin
        showmessage(MAT_INV_Error_oper_otmena);
    end;
end;

procedure TfmMainIvKartForm.PopupMenuPrimPopup(Sender: TObject);
begin
    {if DataSetPrap['POLKOVNIK'] <> 1 then
    begin
        Vnutrperem1.Enabled := False;
    end else
    begin
        Vnutrperem1.Enabled := True;
    end; }

    //Блокировка операций для бух учет
    if DataSetOsn['ID_OPER_OPR'] <> 0 then
    begin
        Oprihod1.Enabled := False;
        //unOprihod1.Enabled := True;
    end else
    begin
        Oprihod1.Enabled := True;
        //unOprihod1.Enabled := False;
    end;
    //Oprihod1.Enabled := True;

    if DataSetOsn['ID_OPER_EXPL'] <> 0 then
    begin
        Vvodvexpl1.Enabled := False;
        //unVnutrperem1.Enabled := True;
    end else
    begin
        Vvodvexpl1.Enabled := True;
        //unVnutrperem1.Enabled := False;
    end;
    //Vvodvexpl1.Enabled := True;

    if DataSetOsn['ID_OPER_UPDATE'] <> 0 then
    begin
        Namoder1.Enabled := False;
        //smoder1.Enabled := True;
    end else
    begin
        Namoder1.Enabled := True;
        //smoder1.Enabled := False;
    end;
    //Namoder1.Enabled := True;

    if DataSetOsn['ID_OPER_OUT'] <> 0 then
    begin
        Spisanie1.Enabled := False;
        //unoperout1.Enabled := True;
    end else
    begin
        Spisanie1.Enabled := True;
        //unoperout1.Enabled := False;
    end;
    //Spisanie1.Enabled := True;

end;



procedure TfmMainIvKartForm.Print_inv_kart_mainClick(Sender: TObject);
var
   res : Variant;
   idishnik_kartki : Int64;
begin
    if (cxGridInvKart.IsFocused) and (not DataSetKart.IsEmpty) then
    begin
    res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 1, StrToInt64(DataSetKart.FieldByName('R_ID_KART').AsString), StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString),'',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
    end else
    begin
        showmessage(MAT_INV_mess_print);
    end;
end;

procedure TfmMainIvKartForm.Print_akt_priema_peredachiClick(
  Sender: TObject);
var
   res : Variant;
begin
    if (cxGridInvKart.IsFocused) and (not DataSetKart.IsEmpty) then
    begin
        res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 2, StrToInt64(DataSetKart.FieldByName('R_ID_KART').AsString), StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), DataSetKart.FieldByName('FULL_INV').AsString,id_filter,id_man, is_nalog);
        if VarArrayDimCount(res) > 0 then
        begin
            if (res[0]<>null) then
            begin
                //
            end;
        end;
    end else
    begin
        showmessage(MAT_INV_mess_print);
    end;
end;

procedure TfmMainIvKartForm.ActionPrintExecute(Sender: TObject);
begin
 PopupMenu_Print.Popup(300, 200);
end;

procedure TfmMainIvKartForm.Inv_sp_osn_sredstvClick(Sender: TObject);
var
   res : Variant;
begin
//id_filter := 0;
     res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 3, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
    //*****************  Снимаем все чекеры  *******************************
        try
           Virtual_StoredProc.Close;
           Virtual_StoredProc.Database    := DatabaseMain;
           Virtual_StoredProc.Transaction := WriteTransaction;
           Virtual_StoredProc.Transaction.StartTransaction;
           Virtual_StoredProc.StoredProcName:='MAT_INV_UNSET_CHEKER';
           Virtual_StoredProc.Prepare;
           Virtual_StoredProc.ExecProc;
        except on E : Exception do
        begin
         ShowMessage(E.Message);
         Virtual_StoredProc.Transaction.Rollback;
         exit;
        end;
        end;
        Virtual_StoredProc.Transaction.Commit;
        ActionUpdateKartExecute(Sender);
end;

procedure TfmMainIvKartForm.Akt_na_spisanieClick(Sender: TObject);
var
   res : Variant;
   idishnik_kartki : Int64;
begin
    if (cxGridInvKart.IsFocused) and (not DataSetKart.IsEmpty) then
    begin
    res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 4, StrToInt64(DataSetKart.FieldByName('R_ID_KART').AsString), StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
    end else
    begin
        showmessage(MAT_INV_mess_print);
    end;
end;

procedure TfmMainIvKartForm.Explnow1Click(Sender: TObject);
var
    tak : String;
    TT : TfmWaite;
begin
    TT := TfmWaite.creATE(Self);
    TT.Label1.Caption := MAT_INV_loading;
    Application.Initialize;
    TT.Show;
    TT.Repaint;
    TT.cxProgressBar1.Position := 0;

    frDBDataSetPrint_karta.Dataset := DataSet_inv_book;

    TT.cxProgressBar1.Position := TT.cxProgressBar1.Position + 10;
    TT.UpDate;

    DataSet_inv_book.close;
    DataSet_inv_book.SelectSQL.Clear;
    DataSet_inv_book.SelectSQL.Add('select * from MAT_INV_SEL_TO_PR_INV_KNIGA');

    TT.cxProgressBar1.Position := TT.cxProgressBar1.Position + 10;
    TT.UpDate;
    begin
        DataSet_inv_book.SelectSQL.Add('Where ' + 'DATE_EXPL> ' +'''30.12.1901''');
        DataSet_inv_book.SelectSQL.Add('And ' + 'DATE_EXPL< ' +'''30.12.2999''');
        DataSet_inv_book.Open;
        //DataSet_inv_book.CloseOpen(false);

        TT.cxProgressBar1.Position := 100;
        TT.Label1.Caption := MAT_INV_loading;
        TT.UpDate;
        TT.Free;

        frVariables['expluat']  := MAT_INV_expl_now;
     //   DataSet_inv_book.First;
        frReportPrint_karta.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\'+'Print_inv_book.frf');
        frReportPrint_karta.PrepareReport;
        frReportPrint_karta.ShowReport;
   end;


end;

procedure TfmMainIvKartForm.donotexpl1Click(Sender: TObject);
var
   TT : TfmWaite;
   res : Variant;
   idishnik_kartki : Int64;
begin
    TT := TfmWaite.create(Self);
    TT.Label1.Caption := MAT_INV_loading;
    Application.Initialize;
    TT.Show;
    TT.Repaint;
    TT.cxProgressBar1.Position := 50;
    TT.Update;

    DataSetPapka.First;
while not DataSetPapka.Eof do
begin
    DataSetKart.First;
    while not DataSetKart.Eof do
    begin
        idishnik_kartki := StrToInt(DataSetKart.FieldByName('R_ID_KART').AsString);

        try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_ADD_TO_TEMP';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('id_inv_kniga').AsInt64 := idishnik_kartki;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;

        DataSetKart.Next;
    end;
    TT.cxProgressBar1.Position := TT.cxProgressBar1.Position +10;
    TT.UpDate;
    DataSetPapka.Next;
end;
    TT.cxProgressBar1.Position := 100;
    TT.UpDate;
    TT.Free;

    res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 5, StrToInt64(DataSetKart.FieldByName('R_ID_KART').AsString), StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString),'',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;

    try
       Virtual_StoredProc.Close;
       Virtual_StoredProc.Database    := DatabaseMain;
       Virtual_StoredProc.Transaction := WriteTransaction;
       Virtual_StoredProc.Transaction.StartTransaction;
       Virtual_StoredProc.StoredProcName:='MAT_INV_DROP_FROM_TEMP';
       Virtual_StoredProc.Prepare;
       Virtual_StoredProc.ExecProc;
    except on E : Exception do
    begin
     ShowMessage(E.Message);
     Virtual_StoredProc.Transaction.Rollback;
     exit;
    end;
    end;
    Virtual_StoredProc.Transaction.Commit;

    close;
end;

procedure TfmMainIvKartForm.Special_actionExecute(Sender: TObject);
var
       id_d : int64;
       TR   : TfmWaite;
begin
    TR := TfmWaite.creATE(self);
    TR.Label1.Caption := MAT_INV_loading;
    Application.Initialize;
    TR.Show;
    TR.Repaint;
    TR.cxProgressBar1.Position := 50;
    if Up_Date_filter = true then
    begin
         praporec := false;
                DataSetKart.close;
                DataSetKart.SelectSQL.Clear;
                DataSetKart.SelectSQL.Add('SELECT * FROM MAT_INV_SEL_TO_GRID (:D_ID)');

                if filter_fg <> false then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix +'(ID_SCHS IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_filter)+') OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(id_filter)+'))');
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix +'(ID_SCHS IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_filter)+') OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(id_filter)+'))');
                    end;
                end;
                if id_nomn <> 0 then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'ID_NOMNS= ' + IntToStr(id_nomn));
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'ID_NOMNS= ' + IntToStr(id_nomn));
                    end;
                end;
                if name_nomn <> '' then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'NAME_KART LIKE ' + ''''+ name_nomn +'''');
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'NAME_KART LIKE ' + ''''+name_nomn+'''');
                    end;
                end;
                if id_man <> 0 then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'ID_MANS= ' + IntToStr(id_man));
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'ID_MANS= ' + IntToStr(id_man));
                    end;
                end;
                if id_spodr <> 0 then
                begin

                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'ID_SPODR= ' + IntToStr(id_spodr));
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'ID_SPODR= ' + IntToStr(id_spodr));
                    end;
                end;
                if grp1 <> '' then
                begin
                    if grp2 <> '' then
                    begin
                        if praporec = false then
                        begin
                            prefix := 'where ';
                            DataSetKart.SelectSQL.Add(prefix + 'GRP_NUM>= ' + grp1);
                            DataSetKart.SelectSQL.Add('and ' + 'GRP_NUM<= ' + grp2);
                            praporec := true;
                        end else
                        begin
                            prefix := 'and ';
                            DataSetKart.SelectSQL.Add(prefix + 'GRP_NUM>= ' + grp1);
                            DataSetKart.SelectSQL.Add('and ' + 'GRP_NUM<= ' + grp2);
                        end;
                    end;
                end;
                if inv1 <> '' then
                begin
                    if inv2 <> '' then
                    begin
                        if praporec = false then
                        begin
                            prefix := 'where ';
                            DataSetKart.SelectSQL.Add(prefix + 'FULL_INV>= ' + inv1);
                            DataSetKart.SelectSQL.Add('and ' + 'FULL_INV<= ' + inv2);
                            praporec := true;
                        end else
                        begin
                            prefix := 'and ';
                            DataSetKart.SelectSQL.Add(prefix + 'FULL_INV>= ' + inv1);
                            DataSetKart.SelectSQL.Add('and ' + 'FULL_INV<= ' + inv2);
                        end;
                    end;
                end;
                if TIP_KART <> '' then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'TIP_KART= ' + TIP_KART);
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'TIP_KART= ' + TIP_KART);
                    end;
                end;
                if krt1 <> '' then
                begin
                    if krt2 <> '' then
                    begin
                        if praporec = false then
                        begin
                            prefix := 'where ';
                            DataSetKart.SelectSQL.Add(prefix + 'kart_num>= ' + krt1);
                            DataSetKart.SelectSQL.Add('and ' + 'kart_num<= ' + krt2);
                            praporec := true;
                        end else
                        begin
                            prefix := 'and ';
                            DataSetKart.SelectSQL.Add(prefix + 'kart_num>= ' + krt1);
                            DataSetKart.SelectSQL.Add('and ' + 'kart_num<= ' + krt2);
                        end;
                    end;
                end;
                if working = 1 then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'WORKED= ' + IntToStr(working));
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'WORKED= ' + IntToStr(working));
                    end;
                end;
                if working = 0 then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'worked= ' + IntToStr(working));
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'worked= ' + IntToStr(working));
                    end;
                end;
                if is_nalog <> 0 then
                begin
                  if is_buh=0 then
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'USE_IN_NALOG= ' + IntToStr(is_nalog));
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'USE_IN_NALOG= ' + IntToStr(is_nalog));
                    end;
                end;
                if is_nalog = 0 then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'USE_IN_NALOG= ' + IntToStr(is_nalog));
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'USE_IN_NALOG= ' + IntToStr(is_nalog));
                    end;
                end;
                if id_db <> 0 then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'id_db= ' + IntToStr(id_db));
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'id_db= ' + IntToStr(id_db));
                    end;
                end;
                if id_kr <> 0 then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'id_kr= ' + IntToStr(id_kr));
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'id_kr= ' + IntToStr(id_kr));
                    end;
                end;
                if beg_price_beg <> '' then
                begin
                    if beg_price_end <> '' then
                    begin
                        if praporec = false then
                        begin
                            prefix := 'where ';
                            DataSetKart.SelectSQL.Add(prefix + 'bal_price>= ' + beg_price_beg);
                            DataSetKart.SelectSQL.Add('and ' + 'bal_price<= ' + beg_price_end);
                            praporec := true;
                        end else
                        begin
                            prefix := 'and ';
                            DataSetKart.SelectSQL.Add(prefix + 'bal_price>= ' + beg_price_beg);
                            DataSetKart.SelectSQL.Add(prefix + 'bal_price<= ' + beg_price_end);
                        end;
                    end;
                end;
                if date_expl1 <> '' then
                begin
                    if date_expl2 <> '' then
                    begin
                        if praporec = false then
                        begin
                            prefix := 'where ';
                            DataSetKart.SelectSQL.Add(prefix + 'DATE_EXPL>=' +''''+date_expl1+'''');
                            DataSetKart.SelectSQL.Add('and ' + 'DATE_EXPL<=' +''''+date_expl2+'''');
                            praporec := true;
                        end else
                        begin
                            prefix := 'and ';
                            DataSetKart.SelectSQL.Add(prefix + 'DATE_EXPL>=' +''''+date_expl1+'''');
                            DataSetKart.SelectSQL.Add(prefix + 'DATE_EXPL<=' +''''+date_expl2+'''');
                        end;
                    end;
                end;
                if expl <> 0 then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'date_out is null');
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'date_out is null');
                    end;
                end;
                if out_proch <> 0 then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix + 'DATE_OUT>' + '''30.12.1901''');
                        DataSetKart.SelectSQL.Add('and ' + 'DATE_OUT<>' + '''30.12.2999''');
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix + 'DATE_OUT>' + '''30.12.1901''');
                        DataSetKart.SelectSQL.Add(prefix + 'DATE_OUT<>' + '''30.12.2999''');
                    end;
                end;
                if date_out1 <> '' then
                begin
                    if date_out2 <> '' then
                    begin
                        if praporec = false then
                        begin
                            prefix := 'where ';
                            DataSetKart.SelectSQL.Add(prefix + 'DATE_OUT>=' +''''+date_out1+'''');
                            DataSetKart.SelectSQL.Add('and ' + 'DATE_OUT<=' +''''+date_out2+'''');
                            praporec := true;
                        end else
                        begin
                            prefix := 'and ';
                            DataSetKart.SelectSQL.Add(prefix + 'DATE_OUT>=' +''''+date_out1+'''');
                            DataSetKart.SelectSQL.Add(prefix + 'DATE_OUT<=' +''''+date_out2+'''');
                        end;
                    end;
                end;
                if date_opr1 <> '' then
                begin
                    if date_opr2 <> '' then
                    begin
                        if praporec = false then
                        begin
                            prefix := 'where ';
                            DataSetKart.SelectSQL.Add(prefix + 'DATE_OPR>=' +''''+date_opr1+'''');
                            DataSetKart.SelectSQL.Add('and ' + 'DATE_OPR<=' +''''+date_opr2+'''');
                            praporec := true;
                        end else
                        begin
                            prefix := 'and ';
                            DataSetKart.SelectSQL.Add(prefix + 'DATE_OPR>=' +''''+date_opr1+'''');
                            DataSetKart.SelectSQL.Add(prefix + 'DATE_OPR<=' +''''+date_opr2+'''');
                        end;
                    end;
                end;
                if date_up1 <> '' then
                begin
                    if date_up2 <> '' then
                    begin
                        if praporec = false then
                        begin
                            prefix := 'where ';
                            DataSetKart.SelectSQL.Add(prefix + 'DATE_UP>=' +''''+date_up1+'''');
                            DataSetKart.SelectSQL.Add('and ' + 'DATE_UP<=' +''''+date_up2+'''');
                            praporec := true;
                        end else
                        begin
                            prefix := 'and ';
                            DataSetKart.SelectSQL.Add(prefix + 'DATE_UP>=' +''''+date_up1+'''');
                            DataSetKart.SelectSQL.Add(prefix + 'DATE_UP<=' +''''+date_up2+'''');
                        end;
                    end;
                end;
                if beg_ost_pr <> '' then
                begin
                    if end_ost_pr <> '' then
                    begin
                        if praporec = false then
                        begin
                            prefix := 'where ';
                            DataSetKart.SelectSQL.Add(prefix + 'OST_PRICE>= ' + beg_ost_pr);
                            DataSetKart.SelectSQL.Add('and ' + 'OST_PRICE<= ' + end_ost_pr);
                            praporec := true;
                        end else
                        begin
                            prefix := 'and ';
                            DataSetKart.SelectSQL.Add(prefix + 'OST_PRICE>= ' + beg_ost_pr);
                            DataSetKart.SelectSQL.Add(prefix + 'OST_PRICE<= ' + end_ost_pr);
                        end;
                    end;
                end;
                if beg_ost_iz <> '' then
                begin
                    if end_ost_iz <> '' then
                    begin
                        if praporec = false then
                        begin
                            prefix := 'where ';
                            DataSetKart.SelectSQL.Add(prefix + 'IZNOS>= ' + beg_ost_iz);
                            DataSetKart.SelectSQL.Add('and ' + 'IZNOS<= ' + end_ost_iz);
                            praporec := true;
                        end else
                        begin
                            prefix := 'and ';
                            DataSetKart.SelectSQL.Add(prefix + 'IZNOS>= ' + beg_ost_iz);
                            DataSetKart.SelectSQL.Add(prefix + 'IZNOS<= ' + end_ost_iz);
                        end;
                    end;
                end;
                if BuhPers = true then
                begin
                    if praporec = false then
                        begin
                            prefix := 'where ';
                            DataSetKart.SelectSQL.Add(prefix + 'BUH_AMORT_PERCENT=0 ');

                            praporec := true;
                        end else
                        begin
                            prefix := 'and ';
                            DataSetKart.SelectSQL.Add(prefix + 'BUH_AMORT_PERCENT=0 ');
                        end;

                end;
                DataSetKart.SelectSQL.Add(' ORDER BY FIO_MOL ');
                DataSetKart.ParamByName('D_ID').Value:= DataSetPapka.FieldByname('ID_INV_GRP').Value;
                DataSetKart.Open;
                //DataSetKart.CloseOpen(false);
                DataSetKart.First;
    end else
    begin
        id_d := DataSetPapka.FieldByname('ID_INV_GRP').AsVariant;
        DataSetPapka.CloseOpen(false);
        DataSetPapka.Locate('ID_INV_GRP',id_d, []);
    end;

    TR.cxProgressBar1.Position := 100;
    TR.Update;
    TR.Free;
end;

procedure TfmMainIvKartForm.FormStorage1RestorePlacement(Sender: TObject);
var
   id_d, id_kart : variant;
begin
    id_d    := FormStorage1.StoredValue['save_pos_in_the_tree'];
    id_kart := FormStorage1.StoredValue['save_pos_in_grid'];
   // DataSetPapka.Locate('ID_INV_GRP',id_d, []);
   // DataSetKart.Locate('R_ID_KART',id_kart, []);
    if FormStorage1.StoredValue['tree_spliter_pos'] = true then
    begin
        cxSplitter2.OpenSplitter;
    end else
    begin
        cxSplitter2.CloseSplitter;
    end;
    if FormStorage1.StoredValue['panel_spliter_pos'] = true then
    begin
        cxSplitter1.OpenSplitter;
    end else
    begin
        cxSplitter1.CloseSplitter;
    end;
end;


procedure TfmMainIvKartForm.cxSplitter2AfterClose(Sender: TObject);
begin
    FormStorage1.StoredValue['tree_spliter_pos']:= false;
end;

procedure TfmMainIvKartForm.cxSplitter2AfterOpen(Sender: TObject);
begin
    FormStorage1.StoredValue['tree_spliter_pos']:= true;
end;

procedure TfmMainIvKartForm.cxSplitter1AfterClose(Sender: TObject);
begin
    FormStorage1.StoredValue['panel_spliter_pos']:= false;
end;

procedure TfmMainIvKartForm.cxSplitter1AfterOpen(Sender: TObject);
begin
    FormStorage1.StoredValue['panel_spliter_pos']:= true;
end;

procedure TfmMainIvKartForm.cxGridInvKartDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
    if krt_praporec = 1 then
    begin
        krt_praporec := 1;
    end;
    if krt_praporec = 0 then
    begin
        krt_praporec := 0;
    end;
end;

procedure TfmMainIvKartForm.Button1Click(Sender: TObject);
var
    i, dlina : integer;
    tex_text : string;
    currtext : string;
begin
    tex_text := id_krt;// cxmemoinv.Text;
    dlina    := Length(id_krt);//.GetTextLen;
    for i:=0 to dlina do
    begin
        if i = 1 then
        begin
            currtext := tex_text[i];
            currtext := '';
        end;
        if tex_text[i] <> ',' then
        begin
            currtext := currtext+tex_text[i];
        end;
        if tex_text[i] = ',' then
        begin
            showMessage(currtext);
            currtext := '';
        end;
    end;
       showMessage(currtext);
end;


procedure TfmMainIvKartForm.Select_lineExecute(Sender: TObject);
begin
    if DataSetKart['CHEKER'] = 0 then
    begin
    //********   Проставляем флажок ************************************************
        try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
               Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 1;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;
            DataSetKart.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
            DataSetKart.SQLs.RefreshSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID_BY_KEY('+IntToStr(DataSetKart['R_ID_KART'])+')';
            DataSetKart.Edit;
            DataSetKart.Post;
    //********  Закончили это глупое занятие  **************************************
    end else
    begin
    //********   Снимаем флажок ************************************************
        try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
               Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 0;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;
            DataSetKart.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
            DataSetKart.SQLs.RefreshSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID_BY_KEY('+IntToStr(DataSetKart['R_ID_KART'])+')';
            DataSetKart.Edit;
            DataSetKart.Post;
    //********  Закончили это глупое занятие  **************************************
    end;
end;

procedure TfmMainIvKartForm.OprihodExecute(Sender: TObject);
var
    T : TfmOperacion;
    id_db, id_kr, id_sch, id_k_art : int64;
    sch, db, kr, iznos, ost_price, beg_pr : string;
    Period : TDateTime;

begin
    multi_sel_id := '0';
    DataSourceInvKart.Enabled := false;
    id_k_art     := DataSetKart['R_ID_KART'];
    if DataSetOsn['ID_OPER_OPR'] = 0 then
    begin
        if DataSetOsn['BUH_DB_SCH'] = null then
        begin
            db := ' ';
        end else
        begin
            db  := DataSetOsn['BUH_DB_SCH'];
        end;
        if DataSetOsn['BUH_KR_SCH'] = null  then
        begin
            kr  := ' ';
        end else
        begin
            kr  := DataSetOsn['BUH_KR_SCH'];
        end;
        if DataSetOsn['ID_BUH_DB'] =null then
        begin
            id_db := 0;
        end else
        begin
            id_db := DataSetOsn['ID_BUH_DB'];
        end;
        if DataSetOsn['ID_BUH_KR'] = null then
        begin
            id_kr := 0;
        end else
        begin
            id_kr := DataSetOsn['ID_BUH_KR'];
        end;
        if DataSetKart['ID_SCHS'] = null then
        begin
            id_sch := 0;
        end else
        begin
            id_sch := DataSetKart['ID_SCHS'];
        end;
        if DataSetKart['NUM_SCH'] = null then
        begin
            sch    := ' ';
        end else
        begin
            sch    := DataSetKart['NUM_SCH'];
        end;
        if DataSetKart['OST_PRICE'] = null then
        begin
            ost_price := '0';
        end else
        begin
            ost_price := DataSetKart['OST_PRICE'];
        end;
        if DataSetKart['IZNOS'] = null then
        begin
            iznos     := '0';
        end else
        begin
            iznos     := DataSetKart['IZNOS'];
        end;
        if DataSetKart['BAL_PRICE'] = null then
        begin
            beg_pr    := '0';
        end else
        begin
            beg_pr    := DataSetKart['BAL_PRICE'];
        end;
        Period    := DataSetOsn['Period'];


        {if (DataSetKart['USE_IN_NALOG'] = 1) and (DataSetKart['IS_BUHG_ACC'] = 0) then
        begin}
            T := TfmOperacion.create(self, true, 1, db, kr, sch, id_db, id_kr, id_sch, ost_price, iznos, beg_pr, Period, multi_sel_id);
            T.ShowModal;
            T.Free;
            //ActionRefreshExecute(Sender);
            ActionUpdateHistExecute(Sender);
            ActionUpdateKartExecute(Sender);
            DataSetKart.Locate('R_ID_KART',id_k_art, []);
            DataSourceInvKart.Enabled := true;
        {end else
        begin
            showmessage(MAT_INV_Operaciya_ne_diysna);
        end;}
    end else showmessage(MAT_INV_opov_oper);
end;

procedure TfmMainIvKartForm.PopupMenu_operPopup(Sender: TObject);
begin
    //Блокировка операций для бух учета
    if DataSetOsn['ID_OPER_OPR'] <> 0 then
    begin
        Oprihod2.Enabled := False;
        //unOprihod1.Enabled := True;
    end else
    begin
        Oprihod2.Enabled := True;
        //unOprihod1.Enabled := False;
    end;
    //Oprihod2.Enabled := True;

    if DataSetOsn['ID_OPER_EXPL'] <> 0 then
    begin
        Vvodvexpl2.Enabled := False;
        //unVnutrperem1.Enabled := True;
    end else
    begin
        Vvodvexpl2.Enabled := True;
        //unVnutrperem1.Enabled := False;
    end;
    //Vvodvexpl2.Enabled := True;

    if DataSetOsn['ID_OPER_UPDATE'] <> 0 then
    begin
        Namoder2.Enabled := False;
        //smoder1.Enabled := True;
    end else
    begin
        Namoder2.Enabled := True;
        //smoder1.Enabled := False;
    end;
    //Namoder2.Enabled := True;

    if DataSetOsn['ID_OPER_OUT'] <> 0 then
    begin
        Spisanie2.Enabled := False;
        //unoperout1.Enabled := True;
    end else
    begin
        Spisanie2.Enabled := True;
        //unoperout1.Enabled := False;
    end;
    //Spisanie2.Enabled := True;

end;

procedure TfmMainIvKartForm.peremExecute(Sender: TObject);
var
    T : TfmOperacion;
    id_db, id_kr, id_sch, id_k_art : int64;
    sch, db, kr,iznos, ost_price, beg_pr : string;
    Period : TDateTime;
begin
     multi_sel_id := '0';
     id_k_art     := DataSetKart['R_ID_KART'];
     DataSourceInvKart.Enabled := false;
        if DataSetOsn['BUH_DB_SCH'] = null then
        begin
            db := ' ';
        end else
        begin
            db  := DataSetOsn['BUH_DB_SCH'];
        end;
        if DataSetOsn['BUH_KR_SCH'] = null  then
        begin
            kr  := ' ';
        end else
        begin
            kr  := DataSetOsn['BUH_KR_SCH'];
        end;
        if DataSetOsn['ID_BUH_DB'] =null then
        begin
            id_db := 0;
        end else
        begin
            id_db := DataSetOsn['ID_BUH_DB'];
        end;
        if DataSetOsn['ID_BUH_KR'] = null then
        begin
            id_kr := 0;
        end else
        begin
            id_kr := DataSetOsn['ID_BUH_KR'];
        end;
        if DataSetKart['ID_SCHS'] = null then
        begin
            id_sch := 0;
        end else
        begin
            id_sch := DataSetKart['ID_SCHS'];
        end;
        if DataSetKart['NUM_SCH'] = null then
        begin
            sch    := ' ';
        end else
        begin
            sch    := DataSetKart['NUM_SCH'];
        end;
        if DataSetKart['OST_PRICE'] = null then
        begin
            ost_price := '0';
        end else
        begin
            ost_price := DataSetKart['OST_PRICE'];
        end;
        if DataSetKart['IZNOS'] = null then
        begin
            iznos     := '0';
        end else
        begin
            iznos     := DataSetKart['IZNOS'];
        end;
        if DataSetKart['BAL_PRICE'] = null then
        begin
            beg_pr    := '0';
        end else
        begin
            beg_pr    := DataSetKart['BAL_PRICE'];
        end;
        Period    := DataSetOsn['Period'];

        {if (DataSetKart['USE_IN_NALOG'] = 1) and (DataSetKart['IS_BUHG_ACC'] = 0) then
        begin}
            T := TfmOperacion.create(self, true, 2, db, kr, sch, id_db, id_kr, id_sch, ost_price, iznos, beg_pr, Period, multi_sel_id);
            T.ShowModal;
            T.Free;
            //ActionRefreshExecute(Sender);
            ActionUpdateHistExecute(Sender);
            ActionUpdateKartExecute(Sender);
            DataSetKart.Locate('R_ID_KART',id_k_art, []);
            DataSourceInvKart.Enabled := true;
        {end else
        begin
            showmessage(MAT_INV_Operaciya_ne_diysna);
        end;}
end;

procedure TfmMainIvKartForm.vvod_v_expExecute(Sender: TObject);
var
    T : TfmOperacion;
    id_db, id_kr, id_sch, id_k_art : int64;
    sch, db, kr, iznos, ost_price, beg_pr : string;
    Period : TDateTime;
begin
    multi_sel_id := '0';
    id_k_art     := DataSetKart['R_ID_KART'];
    DataSourceInvKart.Enabled := false;
    if DataSetOsn['ID_OPER_EXPL'] = 0 then
    begin
        if DataSetOsn['BUH_DB_SCH'] = null then
        begin
            db := ' ';
        end else
        begin
            db  := DataSetOsn['BUH_DB_SCH'];
        end;
        if DataSetOsn['BUH_KR_SCH'] = null  then
        begin
            kr  := ' ';
        end else
        begin
            kr  := DataSetOsn['BUH_KR_SCH'];
        end;
        if DataSetOsn['ID_BUH_DB'] =null then
        begin
            id_db := 0;
        end else
        begin
            id_db := DataSetOsn['ID_BUH_DB'];
        end;
        if DataSetOsn['ID_BUH_KR'] = null then
        begin
            id_kr := 0;
        end else
        begin
            id_kr := DataSetOsn['ID_BUH_KR'];
        end;
        if DataSetKart['ID_SCHS'] = null then
        begin
            id_sch := 0;
        end else
        begin
            id_sch := DataSetKart['ID_SCHS'];
        end;
        if DataSetKart['NUM_SCH'] = null then
        begin
            sch    := ' ';
        end else
        begin
            sch    := DataSetKart['NUM_SCH'];
        end;
        if DataSetKart['OST_PRICE'] = null then
        begin
            ost_price := '0';
        end else
        begin
            ost_price := DataSetKart['OST_PRICE'];
        end;
        if DataSetKart['IZNOS'] = null then
        begin
            iznos     := '0';
        end else
        begin
            iznos     := DataSetKart['IZNOS'];
        end;
        if DataSetKart['BAL_PRICE'] = null then
        begin
            beg_pr    := '0';
        end else
        begin
            beg_pr    := DataSetKart['BAL_PRICE'];
        end;
        Period    := DataSetOsn['Period'];

        {if (DataSetKart['USE_IN_NALOG'] = 1) and (DataSetKart['IS_BUHG_ACC'] = 0) then
        begin}
            T := TfmOperacion.create(self, true, 3, db, kr, sch, id_db, id_kr, id_sch, ost_price, iznos, beg_pr, Period, multi_sel_id);
            T.ShowModal;
            T.Free;
            ActionUpdateHistExecute(Sender);
            ActionUpdateKartExecute(Sender);
            DataSetKart.Locate('R_ID_KART',id_k_art, []);
            DataSourceInvKart.Enabled := true;
        {end else
        begin
            showmessage(MAT_INV_Operaciya_ne_diysna);
        end;}
    end else showmessage(MAT_INV_opov_oper);
end;

procedure TfmMainIvKartForm.SpisanieExecute(Sender: TObject);
var
    T : TfmOperacion;
    id_db, id_kr, id_sch, id_k_art : int64;
    sch, db, kr, iznos, ost_price, beg_pr : string;
    Period : TDateTime;
begin
    multi_sel_id := '0';
    id_k_art     := DataSetKart['R_ID_KART'];
    DataSourceInvKart.Enabled := false;
    if DataSetOsn['ID_OPER_OUT'] = 0 then
    begin
        if DataSetOsn['BUH_DB_SCH'] = null then
        begin
            db := ' ';
        end else
        begin
            db  := DataSetOsn['BUH_DB_SCH'];
        end;
        if DataSetOsn['BUH_KR_SCH'] = null  then
        begin
            kr  := ' ';
        end else
        begin
            kr  := DataSetOsn['BUH_KR_SCH'];
        end;
        if DataSetOsn['ID_BUH_DB'] =null then
        begin
            id_db := 0;
        end else
        begin
            id_db := DataSetOsn['ID_BUH_DB'];
        end;
        if DataSetOsn['ID_BUH_KR'] = null then
        begin
            id_kr := 0;
        end else
        begin
            id_kr := DataSetOsn['ID_BUH_KR'];
        end;
        if DataSetKart['ID_SCHS'] = null then
        begin
            id_sch := 0;
        end else
        begin
            id_sch := DataSetKart['ID_SCHS'];
        end;
        if DataSetKart['NUM_SCH'] = null then
        begin
            sch    := ' ';
        end else
        begin
            sch    := DataSetKart['NUM_SCH'];
        end;
        if DataSetKart['OST_PRICE'] = null then
        begin
            ost_price := '0';
        end else
        begin
            ost_price := DataSetKart['OST_PRICE'];
        end;
        if DataSetKart['IZNOS'] = null then
        begin
            iznos     := '0';
        end else
        begin
            iznos     := DataSetKart['IZNOS'];
        end;
        if DataSetKart['BAL_PRICE'] = null then
        begin
            beg_pr    := '0';
        end else
        begin
            beg_pr    := DataSetKart['BAL_PRICE'];
        end;
        Period    := DataSetOsn['Period'];

        {if (DataSetKart['USE_IN_NALOG'] = 1) and (DataSetKart['IS_BUHG_ACC'] = 0) then
        begin}
        {Showmessage('db='+db+' kr='+kr+' sch='+sch+
        ' id_db='+IntToStr(id_db)+' id_kr='+IntToStr(id_kr)+' id_sch='+IntToStr(id_sch)+
        ' ost_price='+ost_price+' iznos='+iznos+' beg_pr='+
        beg_pr+' Period='+DateToStr(Period)+' multi_sel_id='+multi_sel_id);
        }
            T := TfmOperacion.create(self, true, 4, db, kr, sch, id_db, id_kr, id_sch, ost_price, iznos, beg_pr, Period, multi_sel_id);
            T.ShowModal;
            T.Free;
            ActionUpdateHistExecute(Sender);
            ActionUpdateKartExecute(Sender);
            DataSetKart.Locate('R_ID_KART',id_k_art, []);
            DataSourceInvKart.Enabled := true;
        {end else
        begin
            showmessage(MAT_INV_Operaciya_ne_diysna);
        end;}
    end else showmessage(MAT_INV_opov_oper);
end;

procedure TfmMainIvKartForm.na_moderExecute(Sender: TObject);
var
    T : TfmOperacion;
    id_db, id_kr, id_sch, id_k_art : int64;
    sch, db, kr, iznos, ost_price, beg_pr : string;
    Period : TDateTime;
begin
    multi_sel_id := '0';
    id_k_art     := DataSetKart['R_ID_KART'];
    DataSourceInvKart.Enabled := false;
    if DataSetOsn['ID_OPER_UPDATE'] = 0 then
    begin
        if DataSetOsn['BUH_DB_SCH'] = null then
        begin
            db := ' ';
        end else
        begin
            db  := DataSetOsn['BUH_DB_SCH'];
        end;
        if DataSetOsn['BUH_KR_SCH'] = null  then
        begin
            kr  := ' ';
        end else
        begin
            kr  := DataSetOsn['BUH_KR_SCH'];
        end;
        if DataSetOsn['ID_BUH_DB'] =null then
        begin
            id_db := 0;
        end else
        begin
            id_db := DataSetOsn['ID_BUH_DB'];
        end;
        if DataSetOsn['ID_BUH_KR'] = null then
        begin
            id_kr := 0;
        end else
        begin
            id_kr := DataSetOsn['ID_BUH_KR'];
        end;
        if DataSetKart['ID_SCHS'] = null then
        begin
            id_sch := 0;
        end else
        begin
            id_sch := DataSetKart['ID_SCHS'];
        end;
        if DataSetKart['NUM_SCH'] = null then
        begin
            sch    := ' ';
        end else
        begin
            sch    := DataSetKart['NUM_SCH'];
        end;
        if DataSetKart['OST_PRICE'] = null then
        begin
            ost_price := '0';
        end else
        begin
            ost_price := DataSetKart['OST_PRICE'];
        end;
        if DataSetKart['IZNOS'] = null then
        begin
            iznos     := '0';
        end else
        begin
            iznos     := DataSetKart['IZNOS'];
        end;
        if DataSetKart['BAL_PRICE'] = null then
        begin
            beg_pr    := '0';
        end else
        begin
            beg_pr    := DataSetKart['BAL_PRICE'];
        end;

        if multi_sel_id = '' then multi_sel_id  := '0';

        Period    := DataSetOsn['Period'];
        T := TfmOperacion.create(self, true, 5, db, kr, sch, id_db, id_kr, id_sch, ost_price, iznos, beg_pr, Period, multi_sel_id);
        T.ShowModal;
        T.Free;
        //ActionRefreshExecute(Sender);
        ActionUpdateHistExecute(Sender);
        ActionUpdateKartExecute(Sender);
        DataSetKart.Locate('R_ID_KART',id_k_art, []);
        DataSourceInvKart.Enabled := true;
    end else showmessage(MAT_INV_opov_oper);
end;

procedure TfmMainIvKartForm.PeremeshenieExecute(Sender: TObject);
var
    T : TfmPereocenka;
    //T : TfmOperacion;
    id_db, id_kr, id_sch, id_k_art : int64;
    sch, db, kr, iznos, ost_price, beg_pr : string;
    Period : TDateTime;
begin
    MrOkOrCancel := 0;
     id_k_art := DataSetKart['R_ID_KART'];
     DataSourceInvKart.Enabled := false;

         Virtual_DataSet.close;
         Virtual_DataSet.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_PO_CHEKERU';
         Virtual_DataSet.Open;
         Virtual_DataSet.First;
         id_krt := Virtual_DataSet.FieldByName('ID_KART').AsString;
         undeloper1 := 0;
         Virtual_DataSet.Next;

         while not Virtual_DataSet.Eof do
         begin
             id_krt := id_krt + ',' + Virtual_DataSet.FieldByName('ID_KART').AsString;
             undeloper1 := undeloper1 + 1;
             Virtual_DataSet.Next;
         end;
         Virtual_DataSet.close;

         if id_krt = '' then
         begin
             id_krt := DataSetKart['R_ID_KART'];
             undeloper1 := 0;
             //********   Проставляем флажок ************************************************
             try
                   Virtual_StoredProc.Close;
                   Virtual_StoredProc.Database    := DatabaseMain;
                   Virtual_StoredProc.Transaction := WriteTransaction;
                   Virtual_StoredProc.Transaction.StartTransaction;
                   Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
                   Virtual_StoredProc.Prepare;
                   Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
                   Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 1;
                   Virtual_StoredProc.ExecProc;
                except on E : Exception do
                begin
                 ShowMessage(E.Message);
                 Virtual_StoredProc.Transaction.Rollback;
                 exit;
                end;
                end;
                Virtual_StoredProc.Transaction.Commit;
                DataSetKart.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
                DataSetKart.SQLs.RefreshSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID_BY_KEY('+IntToStr(DataSetKart['R_ID_KART'])+')';
                DataSetKart.Edit;
                DataSetKart.Post;
             //********  Закончили это глупое занятие  *************************
         end;

        multi_sel_id := id_krt;

        if DataSetOsn.fieldByName('BUH_DB_SCH').AsString = '' then
        begin
            db := ' ';
        end else
        begin
            db  := DataSetOsn.fieldByName('BUH_DB_SCH').AsString;
        end;
        if DataSetOsn.fieldByName('BUH_KR_SCH').AsString = ''  then
        begin
            kr  := ' ';
        end else
        begin
            kr  := DataSetOsn.fieldByName('BUH_KR_SCH').AsString;
        end;
        if DataSetOsn.fieldByName('ID_BUH_DB').AsInteger =null then
        begin
            id_db := 0;
        end else
        begin
            id_db := DataSetOsn.fieldByName('ID_BUH_DB').AsInteger;
        end;
        if DataSetOsn.fieldByName('ID_BUH_KR').AsInteger = null then
        begin
            id_kr := 0;
        end else
        begin
            id_kr := DataSetOsn.fieldByName('ID_BUH_KR').AsInteger;
        end;
        if DataSetKart['ID_SCHS'] = null then
        begin
            id_sch := 0;
        end else
        begin
            id_sch := DataSetKart['ID_SCHS'];
        end;
        if DataSetKart['NUM_SCH'] = null then
        begin
            sch    := ' ';
        end else
        begin
            sch    := DataSetKart['NUM_SCH'];
        end;
        if DataSetKart['OST_PRICE'] = null then
        begin
            ost_price := '0';
        end else
        begin
            ost_price := DataSetKart['OST_PRICE'];
        end;
        if DataSetKart['IZNOS'] = null then
        begin
            iznos     := '0';
        end else
        begin
            iznos     := DataSetKart['IZNOS'];
        end;
        if DataSetKart['BAL_PRICE'] = null then
        begin
            beg_pr    := '0';
        end else
        begin
            beg_pr    := DataSetKart['BAL_PRICE'];
        end;

        //********   Удаляем данные из врем табл MAT_INV_TMP_KART  ***************
         try
           WorkQuery.Close;
           WorkQuery.SQL.Clear;
           WorkQuery.SQL.Add('DELETE FROM MAT_INV_TMP_KART');
           WorkQuery.Transaction.StartTransaction;
           WorkQuery.ExecQuery;
           WorkQuery.Transaction.Commit;
         except on E : Exception do
            begin
              ShowMessage(E.Message);
              WorkQuery.Transaction.Rollback;
            end;
         end;
        //********   Удаляем данные из врем табл MAT_INV_TMP_KART_CONST  ***************
         try
           WorkQuery.Close;
           WorkQuery.SQL.Clear;
           WorkQuery.SQL.Add('DELETE FROM MAT_INV_TMP_KART_CONST');
           WorkQuery.Transaction.StartTransaction;
           WorkQuery.ExecQuery;
           WorkQuery.Transaction.Commit;
         except on E : Exception do
            begin
              ShowMessage(E.Message);
              WorkQuery.Transaction.Rollback;
            end;
         end;

        //********   Пишем данные во врем табл MAT_INV_TMP_KART  ***************
         try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_ADD_FOR_PEREOCENKA';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('revers_sch').AsInteger := 1;
               Virtual_StoredProc.ExecProc;
               ID_SESSION_PER := Virtual_StoredProc.FieldByName('ID_SESSION').AsInt64;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
         //********  Закончили это глупое занятие  *****************************
         multi_sel_id := IntToStr(ID_SESSION_PER);

        Period    := DataSetKart['DOC_REC'];

        T := TfmPereocenka.create(self, true, 7, db, kr, sch, id_db, id_kr, id_sch, ost_price, iznos, beg_pr, Period, multi_sel_id, DatabaseMain.Handle, undeloper1);
        T.ShowModal;
        T.Free;
        //ActionRefreshExecute(Sender);
        //********   Удаляем данные из врем табл MAT_INV_TMP_KART  ***************
         try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_UNADD_FOR_PEREOCENKA';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('ID_SESSION').AsString := IntToStr(ID_SESSION_PER);
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
         //********  Закончили это глупое занятие  *****************************
         //********  Чистим буфер проводок  ************************************
         try
           Virtual_StoredProc.Close;
           Virtual_StoredProc.Database    := DatabaseMain;
           Virtual_StoredProc.Transaction := WriteTransaction;
           Virtual_StoredProc.Transaction.StartTransaction;
           Virtual_StoredProc.StoredProcName:='MAT_INV_DROP_BUFF_PROV';
           Virtual_StoredProc.Prepare;
           Virtual_StoredProc.ExecProc;
        except on E : Exception do
        begin
         ShowMessage(E.Message);
         Virtual_StoredProc.Transaction.Rollback;
         exit;
        end;
        end;
        Virtual_StoredProc.Transaction.Commit;
        //*****************  Снимаем все чекеры  *******************************
        try
           Virtual_StoredProc.Close;
           Virtual_StoredProc.Database    := DatabaseMain;
           Virtual_StoredProc.Transaction := WriteTransaction;
           Virtual_StoredProc.Transaction.StartTransaction;
           Virtual_StoredProc.StoredProcName:='MAT_INV_UNSET_CHEKER';
           Virtual_StoredProc.Prepare;
           Virtual_StoredProc.ExecProc;
        except on E : Exception do
        begin
         ShowMessage(E.Message);
         Virtual_StoredProc.Transaction.Rollback;
         exit;
        end;
        end;
        Virtual_StoredProc.Transaction.Commit;
        if MrOkOrCancel = 0 then
        begin
            ActionUpdateHistExecute(Sender);
            ActionUpdateKartExecute(Sender);
        end;

        id_krt := '';
        krt_praporec := 1;

        DataSetKart.CloseOpen(False);
        DataSetKart.Locate('R_ID_KART',id_k_art, []);
        DataSourceInvKart.Enabled := true;
end;



procedure TfmMainIvKartForm.unOprihodovanieExecute(Sender: TObject);
var
   idd, id_oper, id_kart, tipok : int64;

   STRU:KERNEL_MODE_STRUCTURE;
   DoResult:Boolean;
   KEY_SESSION,ID_DOC_FOR_DELETING:Int64;
   ErrorList:TStringList;

   j : int64;
   ost_pr, ost_pr_cikl, dengi1, dengi2, dengi : String;
   ost_price_old : string;
   ost_iznos_old : string;
   ost_price_new : string;
   ost_iznos_new : string;
   Kakaya_oper   : Integer;
   iznos         : string;
   summa         : string;
   id_user       : int64;
   computer_name : string;
   id_mo_old     : int64;
   id_mo_new     : int64;
   id_sch_old    : int64;
   id_sch_new    : int64;
   my_pub_id     : int64;
   doc_rec       : string;
   Doc_num       : string;
   Date_doc      : string;
   PUB_ID_DOC    : Int64;
   is_doc_ex     : Integer;

   tmpString: string;
   long_pole : string;
   i : integer;
   zpt : string;
   undel_oper : integer;
begin
    DataSourceInvKart.Enabled := false;
    id_kart                   := DataSetKart.FieldByName('R_ID_KART').AsVariant;
    idd                       := DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
    id_oper                   := DataSet_history.FieldByName('ID_OP').AsVariant;
    tipok                     := DataSet_history.FieldByName('INDEX_OPER').AsInteger;
    my_pub_id                 := DataSet_history.FieldByName('PUB_DT_ID_DOC').AsVariant;
    id_user                   := StrToInt(DataSet_history.FieldByName('ID_USER').AsString);
    Date_doc                  := DataSet_history.FieldByName('date_d').AsString;
    PUB_ID_DOC                := StrToInt64(DataSet_history.FieldByName('pub_dt_id_doc').AsString);
    undel_oper                := DataSet_history.FieldByName('UNDELOPER').AsInteger;
if undel_oper = 0 then
begin
  if cxGrid_history.IsFocused then
  begin
        if MessageBox(Handle, Pchar(MAT_INV_opov_ob_otmene_oper), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
            then
            begin
            if (my_pub_id <> 0) and (tipok <> 1) and (tipok <> 3) then
            begin
            end;
              Proverka_is_do_exists.Close;
              Proverka_is_do_exists.SelectSQL.Clear;
              Proverka_is_do_exists.SelectSQL.Add('SELECT ID_DOC FROM PUB_DT_ALL_DOC WHERE ID_DOC=' + IntToStr(PUB_ID_DOC));
              Proverka_is_do_exists.CloseOpen(False);
              if (Proverka_is_do_exists.IsEmpty) then is_doc_ex:=0 else is_doc_ex:=1;
              Proverka_is_do_exists.Close;
            //  showmessage(inttostr(tipok));
                if ((tipok = 7) or (tipok = 21) or (tipok = 22)) then
                begin
                  if is_doc_ex=1 then
                  begin
                     STRU.DBHANDLE      := DatabaseMain.Handle;
                     STRU.TRHANDLE      := TransactionRead.Handle;
                     STRU.WORKDATE      := _MATAS_PERIOD;//StrToDate(Date_doc);
                     STRU.KERNEL_ACTION := 2;
                     STRU.KEY_SESSION   := DatabaseMain.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
                     STRU.id_user       := id_user;
                     STRU.PK_ID         := PUB_ID_DOC;//all_doc;
                     DoResult:=Kernel.KernelDo(@STRU);
                     if DoResult
                     then
                     begin
                         TransactionRead.Commit;
                         Delete_prov_from_doc(PUB_ID_DOC, tipok);
                         //Un_Pereocenka(id_kart, id_oper, tipok);
                         //Un_all_Operacii(id_kart, id_oper);
                     end else
                     begin
                         TransactionRead.Rollback;
                         ShowMessage('Виникла помилка! Можливо обрано не той перiод...');
                     end;
                  end
                  else
                    Delete_prov_from_doc(PUB_ID_DOC, tipok);
                end;
                if ((tipok = 23) or (tipok = 24)) then
                begin
                  if is_doc_ex=1 then
                  begin
                     STRU.DBHANDLE      := DatabaseMain.Handle;
                     STRU.TRHANDLE      := TransactionRead.Handle;
                     STRU.WORKDATE      := _MATAS_PERIOD;
                     STRU.KERNEL_ACTION := 2;
                     STRU.KEY_SESSION   := DatabaseMain.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
                     STRU.id_user       := id_user;
                     STRU.PK_ID         := PUB_ID_DOC;//all_doc;
                     DoResult:=Kernel.KernelDo(@STRU);
                     if DoResult
                     then
                     begin
                         TransactionRead.Commit;
                         Delete_prov_from_doc(PUB_ID_DOC, tipok);
                         //Delete_prov_from_doc_minus(PUB_ID_DOC);
                         //Un_Pereocenka(id_kart, id_oper, tipok);
                         //Un_all_Operacii(id_kart, id_oper);
                     end else
                     begin
                         TransactionRead.Rollback;
                         ShowMessage('Виникла помилка! Можливо обрано не той перiод...');
                     end;
                     end
                  else
                    Delete_prov_from_doc(PUB_ID_DOC, tipok);
                end;
                if tipok = 1 then
                begin
                    if DataSetOsn['ID_OPER_OPR'] <> 0 then
                    begin
                        Update_oprih(id_kart, id_oper, '30.12.2999');
                        Un_all_Operacii(id_kart, id_oper);
                    end else
                    begin
                        showmessage(MAT_INV_Error_oper_otmena);
                    end;
                end;
                if tipok = 2 then
                begin
                    UnOper_peremeshenie(DataSetOsn.FieldByName('R_ID_KART').AsVariant, DataSet_history.FieldByName('ID_OP').AsVariant);//id_oper);
                    Un_all_Operacii(id_kart, id_oper);
                end;
                if tipok = 3 then
                begin
                    UnOper_expl(DataSetOsn.FieldByName('R_ID_KART').AsVariant, DataSet_history.FieldByName('ID_OP').AsVariant);//id_oper);
                    Un_all_Operacii(id_kart, id_oper);
                end;
                if tipok = 4 then
                begin
                    Update_out(id_kart, '30.12.2999');
                    Un_all_Operacii(id_kart, id_oper);
                end;


                if tipok = 5 then
                begin
                    ost_pr  := DataSetOsn.FieldByName('OST_PRICE').AsVariant;
                    if DataSetOsn['ID_OPER_UPDATE'] <> 0 then
                    begin
                    {    if MessageBox(Handle, Pchar(Global_constant_for_Hunter.Hnut_opov_ob_otmene_oper), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
                    then
                    begin }

                    //**********************************************************
                            zpt := ost_pr;
                            tmpString := zpt;
                            long_pole:= IntToStr(Length(tmpString));
                            ost_pr := '';
                            for i := 1 to StrToInt(long_pole) do
                            begin
                                ost_pr_cikl := zpt[i];
                                if zpt[i] = ',' then
                                begin
                                    ost_pr_cikl := '.';
                                end;
                                ost_pr := ost_pr + ost_pr_cikl;
                            end;
                    //**********************************************************

                        DataSetOperacii.close;
                        DataSetOperacii.SelectSQL.Clear;
                        DataSetOperacii.SelectSQL.Add('SELECT * FROM MAT_INV_CANSEL_MODERN ('+IntToStr(id_kart)+', '''+ost_pr+''', 5)');
                        DataSetOperacii.Open;
                        DataSetOperacii.closeopen(false);
                        dengi1  := DataSetOperacii.FieldByName('OST_PRICE_NEW').AsString;
                        dengi2  := DataSetOperacii.FieldByName('OST_PRICE_OLD').AsString;
                        iznosec := DataSetOperacii.FieldByName('OST_IZNOS_OLD').AsString;

                        dengi   := CurrToStr(StrToCurr(dengi1) - StrToCurr(dengi2));
                        summa   := dengi;
                        dengi   := CurrToStr(StrToCurr(dengi1) - StrToCurr(dengi));
                        if dengi = '0' then
                        begin
                            dengi   := dengi1;
                        end;
                        Update_modern_cansel(id_kart, 0, '30.12.2999', dengi, iznosec);
                //***********Запись в справочник операций   ************************************
                        begin
                            DecimalSeparator := '.';
                            ost_price_new           := dengi;
                            ost_price_old           := DataSetOperacii.FieldByName('OST_PRICE_OLD').AsString;
                            ost_iznos_new           := DataSetOperacii.FieldByName('OST_IZNOS_NEW').AsString;
                            ost_iznos_old           := DataSetOperacii.FieldByName('OST_IZNOS_OLD').AsString;

                            Kakaya_oper             := 6;
                            id_mo_old               := DataSetOperacii['ID_MO_OLD'];
                            id_mo_new               := DataSetOperacii['ID_MO_NEW'];
                            id_sch_old              := DataSetOperacii['ID_SCH_OLD'];
                            id_sch_new              := DataSetOperacii['ID_SCH_NEW'];
                            doc_rec                 := DataSetKart['DOC_REC'];
                            Doc_num                 := DataSetOperacii['NUM_DOC'];
                            Date_doc                := DataSetOperacii['DATE_DOC'];
                            iznos                   := DataSetKart['IZNOS'];
                            id_user                 := _CURRENT_USER_ID;
                            computer_name           := '';
                            user_name               := _CURRENT_USER_FIO;

                            id_ost_in               := DataSetKart.FieldByName('ID_OST').AsVariant;
                            id_nomn                 := DataSetKart.FieldByName('ID_NOMNS').AsVariant;
                            beg_price_beg           := DataSetKart.FieldByName('BAL_PRICE').Asstring;

                            try
                            j:= Provodki(Kakaya_oper, Doc_num, Date_doc, doc_rec, id_mo_old, id_mo_new, id_sch_old, id_sch_new, StringReplace(ost_price_old,',','.',[]), StringReplace(ost_price_new,',','.',[]), StringReplace(ost_iznos_old,',','.',[]), StringReplace(ost_iznos_new,',','.',[]), StringReplace(iznos,',','.',[]), StringReplace(summa,',','.',[]), 0, id_kart, id_user, computer_name);
//                            Insert_into_MATAS(Doc_num, Date_doc, id_mo_old, StringReplace(summa,',','.',[]), id_user, user_name, computer_name, id_nomn, beg_price, StringReplace(summa,',','.',[]), id_sch_old, id_ost_in, id_kart);
                            except on E:Exception
                            do begin
                                MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                                Application.Terminate;
                            end;
                            end;
                            If j > 0 then
                            begin
                                DecimalSeparator := ',';
                            end;
                          end;
                     //**************  Конец записи в историю операций     **************************

                        //end;
                         end else
                        begin
                            showmessage(MAT_INV_Error_oper_otmena);
                        end;

                end;

                //ActionRefreshExecute(Sender);
                //ActionUpdateHistExecute(Sender);
                ActionUpdateHistExecute(Sender);
                ActionUpdateKartExecute(Sender);
                DataSetKart.Locate('R_ID_KART',id_kart, []);
            end;
      //Un_all_Operacii(id_kart, id_oper);
  end;
  DataSetKart.CloseOpen(False);
  cxGridInvKart.SetFocus;
  DataSetKart.Locate('R_ID_KART',id_kart, []);
  DataSourceInvKart.Enabled := true;
end else
begin
    DataSourceInvKart.Enabled := true;
end;
end;

procedure TfmMainIvKartForm.ActionLookExecute(Sender: TObject);
var
    T   : TfmInvAddPapka;
    H   : TfmInvKartAdd;
    TR  : TfmAddDragMetall;
    Obj : TfmAddNewObject;
    id_kart : Int64;
    inventarnik : String;
    inv, inv1, inv2, inv3, sch : String;
    grp  : String;
    tak  : string;
begin
    if cxGridInvKart.IsFocused then
    begin
       if not DataSetKart.IsEmpty then
       begin
           //просмотр карточки
           if DataSetOsn.FieldByName('IS_NALOG_ACC').AsVariant = 1 then
           begin
                H := TfmInvKartAdd.Create(self, 2, 1);
                H.ShowModal;
                H.Free;
           end else
              begin
                H := TfmInvKartAdd.Create(self, 2, 0);
                H.ShowModal;
                H.Free;
           end;

       end;
    end;
end;

procedure TfmMainIvKartForm.Print_dragMetallClick(Sender: TObject);
var
   res : Variant;
begin
     res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 6, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
end;

procedure TfmMainIvKartForm.ActionUpdateMetallExecute(Sender: TObject);
begin
    DataSetDrag.CloseOpen(false);
end;

procedure TfmMainIvKartForm.ActionUpdateHistExecute(Sender: TObject);
begin
    DataSet_history.CloseOpen(false);
end;

procedure TfmMainIvKartForm.ActionUpdateKartExecute(Sender: TObject);
begin
    DataSetKart.CloseOpen(false);
end;

procedure TfmMainIvKartForm.create_vedClick(Sender: TObject);
var
    T : TfmCreateVedomost;
    date_now : TDateTime;
    TYPE_ACC : Integer;
begin
    Virtual_DataSet.close;
    Virtual_DataSet.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_INFO_FOR_VED';
    Virtual_DataSet.Open;
    date_now := Virtual_DataSet.FieldByName('DATE_REC').AsDateTime;
    TYPE_ACC := Virtual_DataSet.FieldByName('TYPE_ACCOUNT').AsInteger;
    Virtual_DataSet.close;

    T := TfmCreateVedomost.Create(self, date_now, TYPE_ACC, DatabaseMain.Handle);
    T.ShowModal;
    T.Free;
    //DataSetKartDOC_REC
end;

procedure TfmMainIvKartForm.cxButtonEdit_Filtring_Po_MolPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 hPack     : HModule;
 SpravFunc : function (AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_MO: integer):Variant;stdcall;
 Res:Variant;
 sResult: string;
begin
 hPack := GetModuleHandle('MatasSpr.bpl');
 if hPack < 32 then hPack := LoadPackage('MatasSpr.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('GetMatOtv'));
  if @SpravFunc <> NIL then Res := SpravFunc(self, DatabaseMain.Handle, 0, id_man);
 end else begin
  ShowMessage(PChar('Error!'));
 end;
 if  VarType(Res) <> varEmpty then
 begin
  id_man:=Res[0];
  cxButtonEdit_Filtring_Po_Mol.Text:=Res[1]+' / '+Res[2];
  FIO_name := cxButtonEdit_Filtring_Po_Mol.Text;
 end;
end;

procedure TfmMainIvKartForm.cxButtonEditFiltring_Po_SchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 id_filter := GenId_sessionFilter;
 mr:=false;
 Res:=uSpMatSchMulti.GetMatSchMulti(self, DatabaseMain.Handle, 0, id_filter, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxButtonEditFiltring_Po_Sch.Text := s;
   filter_fg:=true;
  end
 end
 else
 begin
  filter_fg:=false;
  cxButtonEditFiltring_Po_Sch.Text:='';
 end;

end;

procedure TfmMainIvKartForm.ActionFiending_in_main_formExecute(
  Sender: TObject);
var
    id_d : int64;
begin
    working:=cxComboBoxWorked.ItemIndex-1;

    Up_Date_filter := true;

    //*************   Обработка данных из фильтра и загрузка их в dataset   ********
        praporec := false;
        DataSetKart.close;
        DataSetKart.SelectSQL.Clear;
        DataSetKart.SelectSQL.Add('SELECT * FROM MAT_INV_SEL_TO_GRID (:D_ID)');

        if filter_fg <> false then
                begin
                    if praporec = false then
                    begin
                        prefix := 'where ';
                        DataSetKart.SelectSQL.Add(prefix +'(ID_SCHS IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_filter)+') OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(id_filter)+'))');
                        praporec := true;
                    end else
                    begin
                        prefix := 'and ';
                        DataSetKart.SelectSQL.Add(prefix +'(ID_SCHS IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_filter)+') OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(id_filter)+'))');
                    end;
                end;
        if id_man <> 0 then
        begin
            if praporec = false then
            begin
                prefix := 'where ';
                DataSetKart.SelectSQL.Add(prefix + 'ID_MANS= ' + IntToStr(id_man));
                praporec := true;
            end else
            begin
                prefix := 'and ';
                DataSetKart.SelectSQL.Add(prefix + 'ID_MANS= ' + IntToStr(id_man));
            end;
        end;
        if working = 1 then
        begin
            if praporec = false then
            begin
                prefix := 'where ';
                DataSetKart.SelectSQL.Add(prefix + 'WORKED= ' + IntToStr(working));
                praporec := true;
            end else
            begin
                prefix := 'and ';
                DataSetKart.SelectSQL.Add(prefix + 'WORKED= ' + IntToStr(working));
            end;
        end;
        if working = 0 then
        begin
            if praporec = false then
            begin
                prefix := 'where ';
                DataSetKart.SelectSQL.Add(prefix + 'worked= ' + IntToStr(working));
                praporec := true;
            end else
            begin
                prefix := 'and ';
                DataSetKart.SelectSQL.Add(prefix + 'worked= ' + IntToStr(working));
            end;
        end;
        DataSetKart.ParamByName('D_ID').Value:= DataSetPapka.FieldByname('ID_INV_GRP').Value;
        DataSetKart.Open;
        DataSetKart.First;
end;

procedure TfmMainIvKartForm.cxButtonEditFiltring_Po_SchKeyPress(
  Sender: TObject; var Key: Char);
begin
    key := chr(0);
end;

procedure TfmMainIvKartForm.cxButtonEdit_Filtring_Po_MolKeyPress(
  Sender: TObject; var Key: Char);
begin
    key := chr(0);
end;

procedure TfmMainIvKartForm.Action_CleaningExecute(Sender: TObject);
begin
    cxButtonEditFiltring_Po_Sch.Clear;
    cxButtonEdit_Filtring_Po_Mol.Clear;
//    cxCheckBoxWorked.Checked  := true;
    cxComboBoxWorked.ItemIndex:=0;
    sch_idih                  := 0;
    id_man                    := 0;
    filter_fg                 := false;
    id_filter                 := 0;
    sch_name                  := '';
    Up_Date_filter := false;
end;

procedure TfmMainIvKartForm.cxGridInvKartDblClick(Sender: TObject);
begin
    if DataSetKart.IsEmpty then
    begin
        ShowMessage(MAT_INV_vot_urodi);
    end;
end;

procedure TfmMainIvKartForm.create_ved_mainClick(Sender: TObject);
var
    T : TfmCreateVedomost;
    date_now : TDateTime;
    TYPE_ACC : Integer;
begin
    Virtual_DataSet.close;
    Virtual_DataSet.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_INFO_FOR_VED';
    Virtual_DataSet.Open;
    date_now := Virtual_DataSet.FieldByName('DATE_REC').AsDateTime;
    date_now := StartOfTheMonth(IncDay(date_now,1));
    TYPE_ACC := Virtual_DataSet.FieldByName('TYPE_ACCOUNT').AsInteger;
    Virtual_DataSet.close;

    DataSourceInvKart.Enabled := false;

    T := TfmCreateVedomost.Create(self, date_now, TYPE_ACC, DatabaseMain.Handle);
    T.ShowModal;
    T.Free;

    //DataSetKart.CloseOpen(false);
    DataSourceInvKart.Enabled := true;
end;

procedure TfmMainIvKartForm.Action_destroy_amort_vedExecute(
  Sender: TObject);
var
    id_amort_rasform : int64;
    Date_last_amort  : String;
    est_ostatki      : Integer;
    res              : Variant;
    TT               : TfmWaite;
begin
    TT := TfmWaite.creATE(Self);
    TT.Label1.Caption := MAT_INV_loading;
    Application.Initialize;
    TT.Show;
    TT.Repaint;
    TT.cxProgressBar1.Position := 0;
    TT.UpDate;

    Virtual_DataSet.close;
    Virtual_DataSet.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_MAX_AMORT';
    Virtual_DataSet.Open;

    id_amort_rasform := StrToInt64(Virtual_DataSet.FieldByName('ID_AMORT_VED').AsString);
    Date_last_amort  := Virtual_DataSet.FieldByName('DATE_AMORT').AsString;

    TT.cxProgressBar1.Position := TT.cxProgressBar1.Position + 1;
    TT.UpDate;

    if MessageBox(Handle, Pchar(MAT_INV_uncreate_amort_ved + Date_last_amort + '. ' + MAT_INV_Quetion), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
    then
    begin
        Virtual_DataSet.close;
        Virtual_DataSet.SQLs.SelectSQL.Text := 'select * from MAT_INV_AMORT_OTKAT('+IntToStr(id_amort_rasform)+')';
        Virtual_DataSet.Open;

        TT.cxProgressBar1.Properties.Max := 6000;
        TT.UpDate;

        Virtual_DataSet.First;

        while not Virtual_DataSet.Eof do
        begin
            TT.cxProgressBar1.Position := TT.cxProgressBar1.Position + 1;
            TT.UpDate;

            if Virtual_DataSet.FieldByName('VSE_LI_KILL').AsInteger = 1 then
            begin
                est_ostatki := 1;
            end else
            begin
                try
                   Virtual_StoredProc.Close;
                   Virtual_StoredProc.Database    := DatabaseMain;
                   Virtual_StoredProc.Transaction := WriteTransaction;
                   Virtual_StoredProc.Transaction.StartTransaction;
                   Virtual_StoredProc.StoredProcName:='MAT_INV_AMORT_UPDATE';
                   Virtual_StoredProc.Prepare;
                   Virtual_StoredProc.ParamByName('ID_AMORT_VED').AsInt64   := id_amort_rasform;
                   Virtual_StoredProc.ParamByName('ID_INV_KART').AsString   := Virtual_DataSet.FieldByName('ID_INV_KART').AsString;
                   Virtual_StoredProc.ParamByName('ID_INV_OPER').AsString   := Virtual_DataSet.FieldByName('ID_INV_OPER').AsString;
                   Virtual_StoredProc.ParamByName('OST_IZN_OLD').AsString   := Virtual_DataSet.FieldByName('OST_IZN_OLD').AsString;
                   Virtual_StoredProc.ParamByName('OST_PRICE_OLD').AsString := Virtual_DataSet.FieldByName('OST_PRICE_OLD').AsString;
                   Virtual_StoredProc.ParamByName('DATE_OST_OLD').AsString  := Virtual_DataSet.FieldByName('DATE_OST_OLD').AsString;
                   Virtual_StoredProc.ExecProc;
                   except on E : Exception do
                   begin
                     ShowMessage(E.Message);
                     Virtual_StoredProc.Transaction.Rollback;
                     exit;
                   end;
                 end;
                 Virtual_StoredProc.Transaction.Commit;
            end;
        Virtual_DataSet.Next;
        end;



       if est_ostatki = 1 then
        begin
            showMessage(MAT_INV_She_E_Z_oper);
            res := UAmort_selection.ShowAm_Ved(DatabaseMain.Handle, id_amort_rasform, false);
            if VarArrayDimCount(res) > 0 then
            begin
                if (res[0]<>null) then
                begin
                    //
                end;
            end;
        end else
        begin
            try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_OTKAT_VED';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('ID_AMORT_VED').AsInt64 := id_amort_rasform;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;
        ShowMessage(MAT_INV_Finish_otkat);
        end;
        TT.Free;
    end else
    begin
        Virtual_DataSet.close;
        exit;
    end;
end;

procedure TfmMainIvKartForm.ActionLookSroo_VedExecute(Sender: TObject);
var
   res : Variant;
begin
    res := UShowAmVed.ShowAm_OstAmVed(DatabaseMain.Handle);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
end;

procedure TfmMainIvKartForm.Invkniga1Click(Sender: TObject);
var
   TT : TfmWaite;
   res : Variant;
   idishnik_kartki, id_d : Int64;
begin
    id_d := DataSetKart.FieldByname('R_ID_KART').AsVariant;
    DataSourceInvKart.Enabled :=false;

    TT := TfmWaite.create(Self);
    TT.Label1.Caption := MAT_INV_loading;
    Application.Initialize;
    TT.Show;
    TT.Repaint;
    TT.cxProgressBar1.Position := 50;
    TT.Update;

    DataSetKart.First;
    while not DataSetKart.Eof do
    begin
        idishnik_kartki := StrToInt(DataSetKart.FieldByName('R_ID_KART').AsString);

        try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_ADD_TO_TEMP';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('id_inv_kniga').AsInt64 := idishnik_kartki;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;

        DataSetKart.Next;
    end;

    TT.cxProgressBar1.Position := 100;
    TT.UpDate;
    TT.Free;

    res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 5, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;

    try
       Virtual_StoredProc.Close;
       Virtual_StoredProc.Database    := DatabaseMain;
       Virtual_StoredProc.Transaction := WriteTransaction;
       Virtual_StoredProc.Transaction.StartTransaction;
       Virtual_StoredProc.StoredProcName:='MAT_INV_DROP_FROM_TEMP';
       Virtual_StoredProc.Prepare;
       Virtual_StoredProc.ExecProc;
    except on E : Exception do
    begin
     ShowMessage(E.Message);
     Virtual_StoredProc.Transaction.Rollback;
     exit;
    end;
    end;
    Virtual_StoredProc.Transaction.Commit;

    DataSetKart.Locate('R_ID_KART',id_d, []);
    DataSourceInvKart.Enabled :=true;

end;


procedure TfmMainIvKartForm.LookSrooInvKartExecute(Sender: TObject);
var
    id_d : int64;
    TT : TfmWaite;
begin
    TT := TfmWaite.creATE(Self);
    TT.Label1.Caption := MAT_INV_loading;
    Application.Initialize;
    TT.Show;
    TT.Repaint;
    TT.cxProgressBar1.Position := 0;

   // showMessage(VarToStr(Up_Date_filter));
    Special_actionExecute(Sender);

    TT.cxProgressBar1.Position := 100;
    TT.Update;
    TT.Free;
end;

procedure TfmMainIvKartForm.cxGridInvKartMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    //********   Проставляем флажок ************************************************
        try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_UNSET_CHEKER';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;
//********  Хакончили это глупое занятие  **************************************
    //ShowMessage('looked');
end;

procedure TfmMainIvKartForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    //*****************  Снимаем все чекеры  *******************************
        try
           Virtual_StoredProc.Close;
           Virtual_StoredProc.Database    := DatabaseMain;
           Virtual_StoredProc.Transaction := WriteTransaction;
           Virtual_StoredProc.Transaction.StartTransaction;
           Virtual_StoredProc.StoredProcName:='MAT_INV_UNSET_CHEKER';
           Virtual_StoredProc.Prepare;
           Virtual_StoredProc.ExecProc;
        except on E : Exception do
        begin
         ShowMessage(E.Message);
         Virtual_StoredProc.Transaction.Rollback;
         exit;
        end;
        end;
        Virtual_StoredProc.Transaction.Commit;
end;

procedure TfmMainIvKartForm.checkedallClick(Sender: TObject);
var
    id_d : int64;
begin
    id_d := DataSetKart['R_ID_KART'];
    DataSourceInvKart.Enabled :=false;
    DataSetKart.First;
    while not DataSetKart.Eof do
    begin
        //********   Проставляем флажок ************************************************
        try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
               Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 1;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;
    //********  Закончили это глупое занятие  **************************************

        DataSetKart.Next;
    end;
    DataSetKart.CloseOpen(false);
    DataSetKart.Locate('R_ID_KART',id_d, []);
    DataSourceInvKart.Enabled :=true;
end;

procedure TfmMainIvKartForm.UnCheckedallClick(Sender: TObject);
var
    id_d : int64;
begin
    id_d := DataSetKart['R_ID_KART'];
    DataSourceInvKart.Enabled :=false;

    //*****************  Снимаем все чекеры  *******************************
        try
           Virtual_StoredProc.Close;
           Virtual_StoredProc.Database    := DatabaseMain;
           Virtual_StoredProc.Transaction := WriteTransaction;
           Virtual_StoredProc.Transaction.StartTransaction;
           Virtual_StoredProc.StoredProcName:='MAT_INV_UNSET_CHEKER';
           Virtual_StoredProc.Prepare;
           Virtual_StoredProc.ExecProc;
        except on E : Exception do
        begin
         ShowMessage(E.Message);
         Virtual_StoredProc.Transaction.Rollback;
         exit;
        end;
        end;
        Virtual_StoredProc.Transaction.Commit;

    DataSetKart.CloseOpen(false);
    DataSetKart.Locate('R_ID_KART',id_d, []);
    DataSourceInvKart.Enabled :=true;
end;

procedure TfmMainIvKartForm.UnCheckedoneClick(Sender: TObject);
begin
    //********   Снимаем флажок ************************************************
        try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
               Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 0;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;
            DataSetKart.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
            DataSetKart.SQLs.RefreshSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID_BY_KEY('+IntToStr(DataSetKart['R_ID_KART'])+')';
            DataSetKart.Edit;
            DataSetKart.Post;
    //********  Закончили это глупое занятие  **************************************
end;

procedure TfmMainIvKartForm.CanSeeIdExecute(Sender: TObject);
begin
    ShowMessage(IntToStr(DataSetKart['R_ID_KART']));
end;

procedure TfmMainIvKartForm.cxGridInvKartDBTableView1DBColumn1HeaderClick(
  Sender: TObject);
begin
 cxGridInvKartDBTableView1.OptionsBehavior.IncSearchItem:=cxGridInvKartDBTableView1DBColumn1;
end;

procedure TfmMainIvKartForm.cxGridInvKartDBTableView1DBColumn8HeaderClick(
  Sender: TObject);
begin
 cxGridInvKartDBTableView1.OptionsBehavior.IncSearchItem:=cxGridInvKartDBTableView1DBColumn8;
end;

procedure TfmMainIvKartForm.cxGridInvKartDBTableView1DBColumn2HeaderClick(
  Sender: TObject);
begin
  cxGridInvKartDBTableView1.OptionsBehavior.IncSearchItem:=cxGridInvKartDBTableView1DBColumn2;
end;

procedure TfmMainIvKartForm.cxGridInvKartDBTableView1DBColumn3HeaderClick(
  Sender: TObject);
begin
 cxGridInvKartDBTableView1.OptionsBehavior.IncSearchItem:=cxGridInvKartDBTableView1DBColumn3;
end;

procedure TfmMainIvKartForm.KartaprintExecute(Sender: TObject);
var
   res : Variant;
   idishnik_kartki : Int64;
begin
    if (cxGridInvKart.IsFocused) and (not DataSetKart.IsEmpty) then
    begin
    res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 1, StrToInt64(DataSetKart.FieldByName('R_ID_KART').AsString), StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
    end else
    begin
        showmessage(MAT_INV_mess_print);
    end;
end;

procedure TfmMainIvKartForm.spr_ost_priceClick(Sender: TObject);
var
   res : Variant;
begin
     res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 11, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
end;

procedure TfmMainIvKartForm.ved_nal_osClick(Sender: TObject);
var
   res : Variant;
begin
     res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 12, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
end;

procedure TfmMainIvKartForm.vedcomeosClick(Sender: TObject);
var
   res : Variant;
  // f: TPrintOstForm;
   ID_D: Variant;
begin
     res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 13, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
{    f:=TPrintOstForm.Create(Self, DBHANDLE, ID_USER,0);
    f.id := DataSetPapka.FieldByname('ID_INV_GRP').AsVariant;
    f.ShowModal;

    f.Free; }
end;

procedure TfmMainIvKartForm.vedoutosClick(Sender: TObject);
var
   res : Variant;
 //  f: TPrintOstForm;
   ID_D: Variant;
begin
     res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 14, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
  {  f:=TPrintOstForm.Create(Self, DBHANDLE, ID_USER,1);
    f.id := DataSetPapka.FieldByname('ID_INV_GRP').AsVariant;
    f.ShowModal;

    f.Free;  }
end;

procedure TfmMainIvKartForm.InvopisOSClick(Sender: TObject);
var
   res : Variant;
begin
     res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 15, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
end;

procedure TfmMainIvKartForm.matinvgrpClick(Sender: TObject);
var
   res : Variant;
begin
     res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 16, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
end;

procedure TfmMainIvKartForm.matnomngrpClick(Sender: TObject);
var
   res : Variant;
begin
     res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 17, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
end;

procedure TfmMainIvKartForm.FormResize(Sender: TObject);
var
   pwm, pwl, pwc, pwo : integer;
begin
    pwm := cxButtonEdit_Filtring_Po_Mol.Width;
    pwl := cxComboBoxWorked.left;
    pwc := cxButton_Clearing.left;
    pwo := cxButtonSetSelection.left;
//    fw := width - fw;
//ShowMessage('width='+IntToStr(width)+' ,fold='+IntToStr(fold));
    if width < fold then
    begin
    // Уменьшение
    fw := width - fw;
        If cxButtonEdit_Filtring_Po_Mol.Width >= 0 then
        begin
            if fw > 0 then
            begin
                pwm := pwm - fw;
                {if pwm <= 100 then }cxButtonEdit_Filtring_Po_Mol.Width := pwm;
                {if pwm <= 100 then }cxComboBoxWorked.left              := pwl - fw;
                {if width <= 100 then }cxButton_Clearing.left         := width - 215;
                {if pwm <= 100 then }cxButtonSetSelection.left        := width - 110;
            end else
            begin
                pwm := pwm + fw;
                {if pwm >= 100 then }cxButtonEdit_Filtring_Po_Mol.Width := pwm;
                {if pwm >= 100 then }cxComboBoxWorked.left              := pwl + fw;
                {if pwm >= 100 then }cxButton_Clearing.left             := width - 215;//pwl + 115 + fw;
                {if pwm >= 100 then }cxButtonSetSelection.left          := width - 110;//pwl + 220 + fw;
            end;
        end;
    end else
    begin
    //Увеличиваем
    fw := width - fw;
                pwm := pwm + fw;
                cxButtonEdit_Filtring_Po_Mol.Width := width - cxComboBoxWorked.Width - cxButtonEdit_Filtring_Po_Mol.left - 220;
                cxComboBoxWorked.left              := width - cxComboBoxWorked.Width - 220;
                {if pwm <= width-(215+fw) then cxButtonEdit_Filtring_Po_Mol.Width := pwm;
                if pwm <= width-(215+fw) then cxComboBoxWorked.left              := pwl + fw;  }
                {if pwm <= 300 then }cxButton_Clearing.left             := width - 215;//pwl + 115 + fw;
                {if pwm <= 300 then }cxButtonSetSelection.left          := width - 110;//pwl + 220 + fw;
    end;
    fw := width;
    fold := fw;
end;

procedure TfmMainIvKartForm.LookingHistoryExecute(Sender: TObject);
VAR
    res : Variant;
begin
    res := ULookingHistory.Lookhistory(self, DatabaseMain.Handle, StrToInt64(DataSetKart.FieldByName('R_ID_KART').AsString));
    if VarArrayDimCount(res) > 0 then
    begin
        //
    end;
end;

procedure TfmMainIvKartForm.ActiontempExecute(Sender: TObject);
VAR
    res : Variant;
begin
    res := WorldLookingKKart.WLKart(self,StrToInt64(DataSetKart.FieldByName('R_ID_KART').AsString),DatabaseMain.Handle);
    if VarArrayDimCount(res) > 0 then
    begin
        //
    end;
end;

procedure TfmMainIvKartForm.doocenivanieExecute(Sender: TObject);
var
    T : TfmPereocenka;
    id_db, id_kr, id_sch, id_k_art : int64;
    sch, db, kr, iznos, ost_price, beg_pr : string;
    Period : TDateTime;
begin
     id_k_art := DataSetKart['R_ID_KART'];

     DataSourceInvKart.Enabled := false;

             id_krt := DataSetKart['R_ID_KART'];
             //********   Проставляем флажок ************************************************
             try
                   Virtual_StoredProc.Close;
                   Virtual_StoredProc.Database    := DatabaseMain;
                   Virtual_StoredProc.Transaction := WriteTransaction;
                   Virtual_StoredProc.Transaction.StartTransaction;
                   Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
                   Virtual_StoredProc.Prepare;
                   Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
                   Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 1;
                   Virtual_StoredProc.ExecProc;
                except on E : Exception do
                begin
                 ShowMessage(E.Message);
                 Virtual_StoredProc.Transaction.Rollback;
                 exit;
                end;
                end;
                Virtual_StoredProc.Transaction.Commit;
                DataSetKart.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
                DataSetKart.SQLs.RefreshSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID_BY_KEY('+IntToStr(DataSetKart['R_ID_KART'])+')';
                DataSetKart.Edit;
                DataSetKart.Post;
             //********  Закончили это глупое занятие  *************************
        multi_sel_id := id_krt;

        if DataSetOsn.fieldByName('BUH_DB_SCH').AsString = '' then
        begin db := ' '; end else begin db  := DataSetOsn.fieldByName('BUH_DB_SCH').AsString; end;
        if DataSetOsn.fieldByName('BUH_KR_SCH').AsString = ''  then
        begin
            kr  := ' ';
        end else
        begin
            kr  := DataSetOsn.fieldByName('BUH_KR_SCH').AsString;
        end;
        if DataSetOsn.fieldByName('ID_BUH_DB').AsInteger =null then
        begin
            id_db := 0;
        end else
        begin
            id_db := DataSetOsn.fieldByName('ID_BUH_DB').AsInteger;
        end;
        if DataSetOsn.fieldByName('ID_BUH_KR').AsInteger = null then
        begin
            id_kr := 0;
        end else
        begin
            id_kr := DataSetOsn.fieldByName('ID_BUH_KR').AsInteger;
        end;
        if DataSetKart['ID_SCHS'] = null then
        begin
            id_sch := 0;
        end else
        begin
            id_sch := DataSetKart['ID_SCHS'];
        end;
        if DataSetKart['NUM_SCH'] = null then
        begin
            sch    := ' ';
        end else
        begin
            sch    := DataSetKart['NUM_SCH'];
        end;
        if DataSetKart['OST_PRICE'] = null then
        begin
            ost_price := '0';
        end else
        begin
            ost_price := DataSetKart['OST_PRICE'];
        end;
        if DataSetKart['IZNOS'] = null then
        begin
            iznos     := '0';
        end else
        begin
            iznos     := DataSetKart['IZNOS'];
        end;
        if DataSetKart['BAL_PRICE'] = null then
        begin
            beg_pr    := '0';
        end else
        begin
            beg_pr    := DataSetKart['BAL_PRICE'];
        end;

                //********   Удаляем данные из врем табл MAT_INV_TMP_KART  ***************
         try
           WorkQuery.Close;
           WorkQuery.SQL.Clear;
           WorkQuery.SQL.Add('DELETE FROM MAT_INV_TMP_KART');
           WorkQuery.Transaction.StartTransaction;
           WorkQuery.ExecQuery;
           WorkQuery.Transaction.Commit;
         except on E : Exception do
            begin
              ShowMessage(E.Message);
              WorkQuery.Transaction.Rollback;
            end;
         end;
        //********   Удаляем данные из врем табл MAT_INV_TMP_KART_CONST  ***************
         try
           WorkQuery.Close;
           WorkQuery.SQL.Clear;
           WorkQuery.SQL.Add('DELETE FROM MAT_INV_TMP_KART_CONST');
           WorkQuery.Transaction.StartTransaction;
           WorkQuery.ExecQuery;
           WorkQuery.Transaction.Commit;
         except on E : Exception do
            begin
              ShowMessage(E.Message);
              WorkQuery.Transaction.Rollback;
            end;
         end;

        //********   Пишем данные во врем табл MAT_INV_TMP_KART  ***************
         try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_ADD_FOR_PEREOCENKA';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('revers_sch').AsInteger := 1;
               Virtual_StoredProc.ExecProc;
               ID_SESSION_PER := Virtual_StoredProc.FieldByName('ID_SESSION').AsInt64;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
         //********  Закончили это глупое занятие  *****************************
         multi_sel_id := IntToStr(ID_SESSION_PER);

        Period    := DataSetKart['DOC_REC'];

        T := TfmPereocenka.create(self, true, 21, db, kr, sch, id_db, id_kr, id_sch, ost_price, iznos, beg_pr, Period, multi_sel_id, DatabaseMain.Handle, 0);
        T.ShowModal;
        T.Free;
        //ActionRefreshExecute(Sender);
        //********   Удаляем данные из врем табл MAT_INV_TMP_KART  ***************
         try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_UNADD_FOR_PEREOCENKA';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('ID_SESSION').AsString := IntToStr(ID_SESSION_PER);
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
         //********  Закончили это глупое занятие  *****************************
         //********  Чистим буфер проводок  ************************************
         try
           Virtual_StoredProc.Close;
           Virtual_StoredProc.Database    := DatabaseMain;
           Virtual_StoredProc.Transaction := WriteTransaction;
           Virtual_StoredProc.Transaction.StartTransaction;
           Virtual_StoredProc.StoredProcName:='MAT_INV_DROP_BUFF_PROV';
           Virtual_StoredProc.Prepare;
           Virtual_StoredProc.ExecProc;
        except on E : Exception do
        begin
         ShowMessage(E.Message);
         Virtual_StoredProc.Transaction.Rollback;
         exit;
        end;
        end;
        Virtual_StoredProc.Transaction.Commit;
        if MrOkOrCancel = 0 then
        begin
            //*****************  Снимаем все чекеры  ***************************
            try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_UNSET_CHEKER';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;

            ActionUpdateHistExecute(Sender);
            ActionUpdateKartExecute(Sender);
            DataSetKart.CloseOpen(False);
        end else
        begin
            //********   Проставляем флажок ************************************
             try
                   Virtual_StoredProc.Close;
                   Virtual_StoredProc.Database    := DatabaseMain;
                   Virtual_StoredProc.Transaction := WriteTransaction;
                   Virtual_StoredProc.Transaction.StartTransaction;
                   Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
                   Virtual_StoredProc.Prepare;
                   Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
                   Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 0;
                   Virtual_StoredProc.ExecProc;
                except on E : Exception do
                begin
                 ShowMessage(E.Message);
                 Virtual_StoredProc.Transaction.Rollback;
                 exit;
                end;
                end;
                Virtual_StoredProc.Transaction.Commit;
                DataSetKart.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
                DataSetKart.SQLs.RefreshSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID_BY_KEY('+IntToStr(DataSetKart['R_ID_KART'])+')';
                DataSetKart.Edit;
                DataSetKart.Post;
             //********  Закончили это глупое занятие  *************************
        end;

        id_krt := '';
        krt_praporec := 1;

        DataSetKart.Locate('R_ID_KART',id_k_art, []);
        DataSourceInvKart.Enabled := true;
end;

procedure TfmMainIvKartForm.KomplectaciyaExecute(Sender: TObject);
var
    T : TfmPereocenka;
    id_db, id_kr, id_sch, id_k_art : int64;
    sch, db, kr, iznos, ost_price, beg_pr : string;
    Period : TDateTime;
begin
     id_k_art := DataSetKart['R_ID_KART'];

     DataSourceInvKart.Enabled := false;
             id_krt := DataSetKart['R_ID_KART'];
             //********   Проставляем флажок ************************************************
             try
                   Virtual_StoredProc.Close;
                   Virtual_StoredProc.Database    := DatabaseMain;
                   Virtual_StoredProc.Transaction := WriteTransaction;
                   Virtual_StoredProc.Transaction.StartTransaction;
                   Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
                   Virtual_StoredProc.Prepare;
                   Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
                   Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 1;
                   Virtual_StoredProc.ExecProc;
                except on E : Exception do
                begin
                 ShowMessage(E.Message);
                 Virtual_StoredProc.Transaction.Rollback;
                 exit;
                end;
                end;
                Virtual_StoredProc.Transaction.Commit;
                DataSetKart.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
                DataSetKart.SQLs.RefreshSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID_BY_KEY('+IntToStr(DataSetKart['R_ID_KART'])+')';
                DataSetKart.Edit;
                DataSetKart.Post;
             //********  Закончили это глупое занятие  *************************
         //end;

        multi_sel_id := id_krt;

        if DataSetOsn.fieldByName('BUH_DB_SCH').AsString = '' then
        begin
            db := ' ';
        end else
        begin
            db  := DataSetOsn.fieldByName('BUH_DB_SCH').AsString;
        end;
        if DataSetOsn.fieldByName('BUH_KR_SCH').AsString = ''  then
        begin
            kr  := ' ';
        end else
        begin
            kr  := DataSetOsn.fieldByName('BUH_KR_SCH').AsString;
        end;
        if DataSetOsn.fieldByName('ID_BUH_DB').AsInteger =null then
        begin
            id_db := 0;
        end else
        begin
            id_db := DataSetOsn.fieldByName('ID_BUH_DB').AsInteger;
        end;
        if DataSetOsn.fieldByName('ID_BUH_KR').AsInteger = null then
        begin
            id_kr := 0;
        end else
        begin
            id_kr := DataSetOsn.fieldByName('ID_BUH_KR').AsInteger;
        end;
        if DataSetKart['ID_SCHS'] = null then
        begin
            id_sch := 0;
        end else
        begin
            id_sch := DataSetKart['ID_SCHS'];
        end;
        if DataSetKart['NUM_SCH'] = null then
        begin
            sch    := ' ';
        end else
        begin
            sch    := DataSetKart['NUM_SCH'];
        end;
        if DataSetKart['OST_PRICE'] = null then
        begin
            ost_price := '0';
        end else
        begin
            ost_price := DataSetKart['OST_PRICE'];
        end;
        if DataSetKart['IZNOS'] = null then
        begin
            iznos     := '0';
        end else
        begin
            iznos     := DataSetKart['IZNOS'];
        end;
        if DataSetKart['BAL_PRICE'] = null then
        begin
            beg_pr    := '0';
        end else
        begin
            beg_pr    := DataSetKart['BAL_PRICE'];
        end;

        //********   Пишем данные во врем табл MAT_INV_TMP_KART  ***************
         try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_ADD_FOR_PEREOCENKA';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('revers_sch').AsInteger := 1;
               Virtual_StoredProc.ExecProc;
               ID_SESSION_PER := Virtual_StoredProc.FieldByName('ID_SESSION').AsInt64;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
         //********  Закончили это глупое занятие  *****************************
         multi_sel_id := IntToStr(ID_SESSION_PER);

        Period    := DataSetKart['DOC_REC'];

        T := TfmPereocenka.create(self, true, 22, db, kr, sch, id_db, id_kr, id_sch, ost_price, iznos, beg_pr, Period, multi_sel_id, DatabaseMain.Handle, 0);
        T.ShowModal;
        T.Free;
        //ActionRefreshExecute(Sender);
        //********   Удаляем данные из врем табл MAT_INV_TMP_KART  ***************
         try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_UNADD_FOR_PEREOCENKA';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('ID_SESSION').AsString := IntToStr(ID_SESSION_PER);
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
         //********  Закончили это глупое занятие  *****************************
         //********  Чистим буфер проводок  ************************************
         try
           Virtual_StoredProc.Close;
           Virtual_StoredProc.Database    := DatabaseMain;
           Virtual_StoredProc.Transaction := WriteTransaction;
           Virtual_StoredProc.Transaction.StartTransaction;
           Virtual_StoredProc.StoredProcName:='MAT_INV_DROP_BUFF_PROV';
           Virtual_StoredProc.Prepare;
           Virtual_StoredProc.ExecProc;
        except on E : Exception do
        begin
         ShowMessage(E.Message);
         Virtual_StoredProc.Transaction.Rollback;
         exit;
        end;
        end;
        Virtual_StoredProc.Transaction.Commit;
        if MrOkOrCancel = 0 then
        begin
            //*****************  Снимаем все чекеры  ***************************
            try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_UNSET_CHEKER';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;

            ActionUpdateHistExecute(Sender);
            ActionUpdateKartExecute(Sender);
            DataSetKart.CloseOpen(False);
        end else
        begin
            //********   Проставляем флажок ************************************
             try
                   Virtual_StoredProc.Close;
                   Virtual_StoredProc.Database    := DatabaseMain;
                   Virtual_StoredProc.Transaction := WriteTransaction;
                   Virtual_StoredProc.Transaction.StartTransaction;
                   Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
                   Virtual_StoredProc.Prepare;
                   Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
                   Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 0;
                   Virtual_StoredProc.ExecProc;
                except on E : Exception do
                begin
                 ShowMessage(E.Message);
                 Virtual_StoredProc.Transaction.Rollback;
                 exit;
                end;
                end;
                Virtual_StoredProc.Transaction.Commit;
                DataSetKart.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
                DataSetKart.SQLs.RefreshSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID_BY_KEY('+IntToStr(DataSetKart['R_ID_KART'])+')';
                DataSetKart.Edit;
                DataSetKart.Post;
             //********  Закончили это глупое занятие  *************************
        end;
        id_krt := '';
        krt_praporec := 1;

        DataSetKart.Locate('R_ID_KART',id_k_art, []);
        DataSourceInvKart.Enabled := true;
end;

procedure TfmMainIvKartForm.RazukomplectExecute(Sender: TObject);
var
    T : TfmPereocenka;
    id_db, id_kr, id_sch, id_k_art : int64;
    sch, db, kr, iznos, ost_price, beg_pr : string;
    Period : TDateTime;
begin
     id_k_art := DataSetKart['R_ID_KART'];

     DataSourceInvKart.Enabled := false;
             id_krt := DataSetKart['R_ID_KART'];
             //********   Проставляем флажок ************************************************
             try
                   Virtual_StoredProc.Close;
                   Virtual_StoredProc.Database    := DatabaseMain;
                   Virtual_StoredProc.Transaction := WriteTransaction;
                   Virtual_StoredProc.Transaction.StartTransaction;
                   Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
                   Virtual_StoredProc.Prepare;
                   Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
                   Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 1;
                   Virtual_StoredProc.ExecProc;
                except on E : Exception do
                begin
                 ShowMessage(E.Message);
                 Virtual_StoredProc.Transaction.Rollback;
                 exit;
                end;
                end;
                Virtual_StoredProc.Transaction.Commit;
                DataSetKart.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
                DataSetKart.SQLs.RefreshSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID_BY_KEY('+IntToStr(DataSetKart['R_ID_KART'])+')';
                DataSetKart.Edit;
                DataSetKart.Post;
             //********  Закончили это глупое занятие  *************************
         //end;

        multi_sel_id := id_krt;

        if DataSetOsn.fieldByName('BUH_DB_SCH').AsString = '' then
        begin
            db := ' ';
        end else
        begin
            db  := DataSetOsn.fieldByName('BUH_DB_SCH').AsString;
        end;
        if DataSetOsn.fieldByName('BUH_KR_SCH').AsString = ''  then
        begin
            kr  := ' ';
        end else
        begin
            kr  := DataSetOsn.fieldByName('BUH_KR_SCH').AsString;
        end;
        if DataSetOsn.fieldByName('ID_BUH_DB').AsInteger =null then
        begin
            id_db := 0;
        end else
        begin
            id_db := DataSetOsn.fieldByName('ID_BUH_DB').AsInteger;
        end;
        if DataSetOsn.fieldByName('ID_BUH_KR').AsInteger = null then
        begin
            id_kr := 0;
        end else
        begin
            id_kr := DataSetOsn.fieldByName('ID_BUH_KR').AsInteger;
        end;
        if DataSetKart['ID_SCHS'] = null then
        begin
            id_sch := 0;
        end else
        begin
            id_sch := DataSetKart['ID_SCHS'];
        end;
        if DataSetKart['NUM_SCH'] = null then
        begin
            sch    := ' ';
        end else
        begin
            sch    := DataSetKart['NUM_SCH'];
        end;
        if DataSetKart['OST_PRICE'] = null then
        begin
            ost_price := '0';
        end else
        begin
            ost_price := DataSetKart['OST_PRICE'];
        end;
        if DataSetKart['IZNOS'] = null then
        begin
            iznos     := '0';
        end else
        begin
            iznos     := DataSetKart['IZNOS'];
        end;
        if DataSetKart['BAL_PRICE'] = null then
        begin
            beg_pr    := '0';
        end else
        begin
            beg_pr    := DataSetKart['BAL_PRICE'];
        end;

        //********   Пишем данные во врем табл MAT_INV_TMP_KART  ***************
         try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_ADD_FOR_PEREOCENKA';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('revers_sch').AsInteger := 0;
               Virtual_StoredProc.ExecProc;
               ID_SESSION_PER := Virtual_StoredProc.FieldByName('ID_SESSION').AsInt64;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
         //********  Закончили это глупое занятие  *****************************
         multi_sel_id := IntToStr(ID_SESSION_PER);

        Period    := DataSetKart['DOC_REC'];

        T := TfmPereocenka.create(self, true, 23, db, kr, sch, id_db, id_kr, id_sch, ost_price, iznos, beg_pr, Period, multi_sel_id, DatabaseMain.Handle, 0);
        T.ShowModal;
        T.Free;
        //ActionRefreshExecute(Sender);
        //********   Удаляем данные из врем табл MAT_INV_TMP_KART  ***************
         try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_UNADD_FOR_PEREOCENKA';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('ID_SESSION').AsString := IntToStr(ID_SESSION_PER);
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
         //********  Закончили это глупое занятие  *****************************
         //********  Чистим буфер проводок  ************************************
         try
           Virtual_StoredProc.Close;
           Virtual_StoredProc.Database    := DatabaseMain;
           Virtual_StoredProc.Transaction := WriteTransaction;
           Virtual_StoredProc.Transaction.StartTransaction;
           Virtual_StoredProc.StoredProcName:='MAT_INV_DROP_BUFF_PROV';
           Virtual_StoredProc.Prepare;
           Virtual_StoredProc.ExecProc;
        except on E : Exception do
        begin
         ShowMessage(E.Message);
         Virtual_StoredProc.Transaction.Rollback;
         exit;
        end;
        end;
        Virtual_StoredProc.Transaction.Commit;
        if MrOkOrCancel = 0 then
        begin
            //*****************  Снимаем все чекеры  ***************************
            try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_UNSET_CHEKER';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;

            ActionUpdateHistExecute(Sender);
            ActionUpdateKartExecute(Sender);
            DataSetKart.CloseOpen(False);
        end else
        begin
            //********   Проставляем флажок ************************************
             try
                   Virtual_StoredProc.Close;
                   Virtual_StoredProc.Database    := DatabaseMain;
                   Virtual_StoredProc.Transaction := WriteTransaction;
                   Virtual_StoredProc.Transaction.StartTransaction;
                   Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
                   Virtual_StoredProc.Prepare;
                   Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
                   Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 0;
                   Virtual_StoredProc.ExecProc;
                except on E : Exception do
                begin
                 ShowMessage(E.Message);
                 Virtual_StoredProc.Transaction.Rollback;
                 exit;
                end;
                end;
                Virtual_StoredProc.Transaction.Commit;
                DataSetKart.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
                DataSetKart.SQLs.RefreshSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID_BY_KEY('+IntToStr(DataSetKart['R_ID_KART'])+')';
                DataSetKart.Edit;
                DataSetKart.Post;
             //********  Закончили это глупое занятие  *************************
        end;

        id_krt := '';
        krt_praporec := 1;

        DataSetKart.Locate('R_ID_KART',id_k_art, []);
        DataSourceInvKart.Enabled := true;
end;

procedure TfmMainIvKartForm.Chast_spisExecute(Sender: TObject);
var
    T : TfmPereocenka;
    id_db, id_kr, id_sch, id_k_art : int64;
    sch, db, kr, iznos, ost_price, beg_pr : string;
    Period : TDateTime;
begin
     id_k_art := DataSetKart['R_ID_KART'];

     DataSourceInvKart.Enabled := false;

             id_krt := DataSetKart['R_ID_KART'];
             //********   Проставляем флажок ************************************************
             try
                   Virtual_StoredProc.Close;
                   Virtual_StoredProc.Database    := DatabaseMain;
                   Virtual_StoredProc.Transaction := WriteTransaction;
                   Virtual_StoredProc.Transaction.StartTransaction;
                   Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
                   Virtual_StoredProc.Prepare;
                   Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
                   Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 1;
                   Virtual_StoredProc.ExecProc;
                except on E : Exception do
                begin
                 ShowMessage(E.Message);
                 Virtual_StoredProc.Transaction.Rollback;
                 exit;
                end;
                end;
                Virtual_StoredProc.Transaction.Commit;
                DataSetKart.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
                DataSetKart.SQLs.RefreshSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID_BY_KEY('+IntToStr(DataSetKart['R_ID_KART'])+')';
                DataSetKart.Edit;
                DataSetKart.Post;
             //********  Закончили это глупое занятие  *************************

        multi_sel_id := id_krt;

        if DataSetOsn.fieldByName('BUH_DB_SCH').AsString = '' then
        begin
            db := ' ';
        end else
        begin
            db  := DataSetOsn.fieldByName('BUH_DB_SCH').AsString;
        end;
        if DataSetOsn.fieldByName('BUH_KR_SCH').AsString = ''  then
        begin
            kr  := ' ';
        end else
        begin
            kr  := DataSetOsn.fieldByName('BUH_KR_SCH').AsString;
        end;
        if DataSetOsn.fieldByName('ID_BUH_DB').AsInteger =null then
        begin
            id_db := 0;
        end else
        begin
            id_db := DataSetOsn.fieldByName('ID_BUH_DB').AsInteger;
        end;
        if DataSetOsn.fieldByName('ID_BUH_KR').AsInteger = null then
        begin
            id_kr := 0;
        end else
        begin
            id_kr := DataSetOsn.fieldByName('ID_BUH_KR').AsInteger;
        end;
        if DataSetKart['ID_SCHS'] = null then
        begin
            id_sch := 0;
        end else
        begin
            id_sch := DataSetKart['ID_SCHS'];
        end;
        if DataSetKart['NUM_SCH'] = null then
        begin
            sch    := ' ';
        end else
        begin
            sch    := DataSetKart['NUM_SCH'];
        end;
        if DataSetKart['OST_PRICE'] = null then
        begin
            ost_price := '0';
        end else
        begin
            ost_price := DataSetKart['OST_PRICE'];
        end;
        if DataSetKart['IZNOS'] = null then
        begin
            iznos     := '0';
        end else
        begin
            iznos     := DataSetKart['IZNOS'];
        end;
        if DataSetKart['BAL_PRICE'] = null then
        begin
            beg_pr    := '0';
        end else
        begin
            beg_pr    := DataSetKart['BAL_PRICE'];
        end;

        //********   Пишем данные во врем табл MAT_INV_TMP_KART  ***************
         try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_ADD_FOR_PEREOCENKA';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('revers_sch').AsInteger := 0;
               Virtual_StoredProc.ExecProc;
               ID_SESSION_PER := Virtual_StoredProc.FieldByName('ID_SESSION').AsInt64;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
         //********  Закончили это глупое занятие  *****************************
         multi_sel_id := IntToStr(ID_SESSION_PER);

        Period    := DataSetKart['DOC_REC'];

        T := TfmPereocenka.create(self, true, 24, db, kr, sch, id_db, id_kr, id_sch, ost_price, iznos, beg_pr, Period, multi_sel_id, DatabaseMain.Handle, 0);
        T.ShowModal;
        T.Free;
        //ActionRefreshExecute(Sender);
        //********   Удаляем данные из врем табл MAT_INV_TMP_KART  ***************
         try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_UNADD_FOR_PEREOCENKA';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('ID_SESSION').AsString := IntToStr(ID_SESSION_PER);
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
         //********  Закончили это глупое занятие  *****************************
         //********  Чистим буфер проводок  ************************************
         try
           Virtual_StoredProc.Close;
           Virtual_StoredProc.Database    := DatabaseMain;
           Virtual_StoredProc.Transaction := WriteTransaction;
           Virtual_StoredProc.Transaction.StartTransaction;
           Virtual_StoredProc.StoredProcName:='MAT_INV_DROP_BUFF_PROV';
           Virtual_StoredProc.Prepare;
           Virtual_StoredProc.ExecProc;
        except on E : Exception do
        begin
         ShowMessage(E.Message);
         Virtual_StoredProc.Transaction.Rollback;
         exit;
        end;
        end;
        Virtual_StoredProc.Transaction.Commit;
        if MrOkOrCancel = 0 then
        begin
            //*****************  Снимаем все чекеры  ***************************
            try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_UNSET_CHEKER';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;

            ActionUpdateHistExecute(Sender);
            ActionUpdateKartExecute(Sender);
            DataSetKart.CloseOpen(False);
        end else
        begin
            //********   Проставляем флажок ************************************
             try
                   Virtual_StoredProc.Close;
                   Virtual_StoredProc.Database    := DatabaseMain;
                   Virtual_StoredProc.Transaction := WriteTransaction;
                   Virtual_StoredProc.Transaction.StartTransaction;
                   Virtual_StoredProc.StoredProcName:='MAT_INV_SET_CHEKER';
                   Virtual_StoredProc.Prepare;
                   Virtual_StoredProc.ParamByName('ID_KART').AsInt64   := DataSetKart['R_ID_KART'];
                   Virtual_StoredProc.ParamByName('CHECKED').AsInteger := 0;
                   Virtual_StoredProc.ExecProc;
                except on E : Exception do
                begin
                 ShowMessage(E.Message);
                 Virtual_StoredProc.Transaction.Rollback;
                 exit;
                end;
                end;
                Virtual_StoredProc.Transaction.Commit;
                DataSetKart.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
                DataSetKart.SQLs.RefreshSQL.Text := 'SELECT * FROM MAT_INV_SEL_TO_GRID_BY_KEY('+IntToStr(DataSetKart['R_ID_KART'])+')';
                DataSetKart.Edit;
                DataSetKart.Post;
             //********  Закончили это глупое занятие  *************************
        end;

        id_krt := '';
        krt_praporec := 1;

        DataSetKart.Locate('R_ID_KART',id_k_art, []);
        DataSourceInvKart.Enabled := true;
end;

procedure TfmMainIvKartForm.ved_peremesheniyaClick(Sender: TObject);
var
   res : Variant;
begin
     res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 18, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
end;

procedure TfmMainIvKartForm.CheckBoxShowSummaClick(Sender: TObject);
begin
    if CheckBoxShowSumma.Checked = true then
    begin
        cxGridInvKartDBTableView1.OptionsView.Footer := true;
    end else
    begin
        cxGridInvKartDBTableView1.OptionsView.Footer := false;
    end;
end;

procedure TfmMainIvKartForm.cross_tab_printClick(Sender: TObject);
var
   res : Variant;
begin
     res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 19, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
end;

procedure TfmMainIvKartForm.name_grp_cheClick(Sender: TObject);
var
    res : Variant;
begin
    DataSourceInvKart.Enabled := false;
    res := UChecked.GetCheck(self);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_SET_NEW_GRP';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('id_kart').AsInteger := DataSetKart.FieldByName('R_ID_KART').AsInteger;
               Virtual_StoredProc.ParamByName('id_grp').AsInteger  := res[0];
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;
        end;
    end;
    LookSrooInvKartExecute(Sender);
    DataSourceInvKart.Enabled := true;
end;

procedure TfmMainIvKartForm.ShowVedPereocClick(Sender: TObject);
var
   res : Variant;
begin
    res := UShowAllVedPereoc.ShowAllVedPereoc(DatabaseMain.Handle);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            if res[0] = 1 then
            begin
                DataSourceInvKart.Enabled := false;
                LookSrooInvKartExecute(Sender);
                DataSourceInvKart.Enabled := true;
            end;
        end;
    end;
end;

procedure TfmMainIvKartForm.DataSet_NaTe_objectAfterScroll(
  DataSet: TDataSet);
begin
    if (cxMemo_primech.Text              <> null) then
    begin
        cxMemo_primech.Text := DataSet_NaTe_object.FieldByName('NOTE_OBJ').AsString;
    end;
end;

procedure TfmMainIvKartForm.N4Click(Sender: TObject);
var
    H          : TfmInvKartAdd;
   id_d        : Variant;
begin
    id_d := DataSetKart['R_ID_KART'];
    DataSourceInvKart.Enabled :=false;

    if cxGridInvKart.IsFocused then
    begin
        //добавление карточки
        H := TfmInvKartAdd.Create(self, 3, 0);
        H.ShowModal;
        H.Free;

        if MrOkOrCancel = 0 then DataSetKart.CloseOpen(False);
        DataSetKart.Locate('R_ID_KART',id_d, []);
        //LookSrooInvKartExecute(self);
        DataSourceInvKart.Enabled :=true;
    end;
end;

procedure TfmMainIvKartForm.PopupMenu_un_operPopup(Sender: TObject);
var
    undel_oper : integer;
begin
    undel_oper               := DataSet_history.FieldByName('UNDELOPER').AsInteger;
    if undel_oper <> 0 then
    begin
        un_operaciya.Enabled := False;
    end else
    begin
        un_operaciya.Enabled := True;
    end;
end;

procedure TfmMainIvKartForm.acExportExecute(Sender: TObject);
begin
 ExportDataSet(self, DataSetKart);
end;

procedure TfmMainIvKartForm.cxGridInvKartDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var   Arect : TRect;
begin
 Arect:=AViewInfo.Bounds;
  if (vartostr(AViewInfo.GridRecord.Values[7])<> '')  then
  begin
      ACanvas.Canvas.Brush.Color := $00D2D2D2;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmMainIvKartForm.actNormIznExecute(Sender: TObject);
begin
  uPackageManager.ShowNormIzn(self, DBHANDLE);
end;

procedure TfmMainIvKartForm.Teh_charact_printClick(Sender: TObject);
var
   res : Variant;
begin
   res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 20, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
end;

procedure TfmMainIvKartForm.N6Click(Sender: TObject);
var
   res : Variant;
begin
   res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 21, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;

end;

procedure TfmMainIvKartForm.N7Click(Sender: TObject);
var
   res : Variant;
begin
   res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 22, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;

end;

procedure TfmMainIvKartForm.N9Click(Sender: TObject);
begin
//LookSrooInvKartExecute(Sender);
  try
   StPr.Close;
   StPr.Transaction := Tr;
   StPr.Transaction.StartTransaction;
   StPr.StoredProcName:='MAT_ROZ_POS_IN_INV_KART';
   StPr.Prepare;
   StPr.paramByName('ID_INV_KART_OLD').AsInteger:=DataSetKartR_ID_KART.AsInteger;
   StPr.ExecProc;
   StPr.Transaction.Commit;
  except on E : Exception do
  begin
   ShowMessage(E.Message);
   StPr.Transaction.Rollback;
   exit;
  end;
  end;
//  showmessage('2');
  if StPr.ParamByName('RESULT').Value = 0 then ShowMessage('Узгодження не відбулося: або картка вже узгоджена, або суми в картці та в залишках не співпадають')
  else ActionRefresh.Execute;
end;

procedure TfmMainIvKartForm.InvBook2Click(Sender: TObject);
var
   TT : TfmWaite;
   res : Variant;
   idishnik_kartki, id_d : Int64;
begin
    id_d := DataSetKart.FieldByname('R_ID_KART').AsVariant;
    DataSourceInvKart.Enabled :=false;

    TT := TfmWaite.create(Self);
    TT.Label1.Caption := MAT_INV_loading;
    Application.Initialize;
    TT.Show;
    TT.Repaint;
    TT.cxProgressBar1.Position := 50;
    TT.Update;

    DataSetKart.First;
    while not DataSetKart.Eof do
    begin
        idishnik_kartki := StrToInt(DataSetKart.FieldByName('R_ID_KART').AsString);

        try
               Virtual_StoredProc.Close;
               Virtual_StoredProc.Database    := DatabaseMain;
               Virtual_StoredProc.Transaction := WriteTransaction;
               Virtual_StoredProc.Transaction.StartTransaction;
               Virtual_StoredProc.StoredProcName:='MAT_INV_ADD_TO_TEMP';
               Virtual_StoredProc.Prepare;
               Virtual_StoredProc.ParamByName('id_inv_kniga').AsInt64 := idishnik_kartki;
               Virtual_StoredProc.ExecProc;
            except on E : Exception do
            begin
             ShowMessage(E.Message);
             Virtual_StoredProc.Transaction.Rollback;
             exit;
            end;
            end;
            Virtual_StoredProc.Transaction.Commit;

        DataSetKart.Next;
    end;

    TT.cxProgressBar1.Position := 100;
    TT.UpDate;
    TT.Free;

    res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 25, 0, StrToInt64(DataSetKart.FieldByName('ID_INV_GRP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;

    try
       Virtual_StoredProc.Close;
       Virtual_StoredProc.Database    := DatabaseMain;
       Virtual_StoredProc.Transaction := WriteTransaction;
       Virtual_StoredProc.Transaction.StartTransaction;
       Virtual_StoredProc.StoredProcName:='MAT_INV_DROP_FROM_TEMP';
       Virtual_StoredProc.Prepare;
       Virtual_StoredProc.ExecProc;
    except on E : Exception do
    begin
     ShowMessage(E.Message);
     Virtual_StoredProc.Transaction.Rollback;
     exit;
    end;
    end;
    Virtual_StoredProc.Transaction.Commit;

    DataSetKart.Locate('R_ID_KART',id_d, []);
    DataSourceInvKart.Enabled :=true;

end;

procedure TfmMainIvKartForm.cxButton1Click(Sender: TObject);
var f:TKapRemForm;
id_kart:integer;
begin
  id_kart:=DataSetKart.FieldByName('R_ID_KART').AsInteger;
f:= TKapRemForm.Create(Self);
f.cxDateEdit.EditValue:=_Matas_Period;
f.DbHandle:=DatabaseMain.Handle;
f.ShowModal;
if f.ModalResult = mrOk then
begin

 try
 StPr_KapRem.Close;
 StPr_KapRem.Transaction := Tr_Kap_Rem;
 StPr_KapRem.Transaction.StartTransaction;
 StPr_KapRem.StoredProcName:='MAT_INV_KAP_REM_INS';
 StPr_KapRem.Prepare;
 StPr_KapRem.ParamByName('ID_INV_KART').AsInteger:=id_kart;
 StPr_KapRem.ParamByName('DATE_REM').AsDate:=f.cxDateEdit.EditValue;
 StPr_KapRem.ParamByName('ISPOLNITEL').AsString:=f.cxIspolnit.Text;
 StPr_KapRem.ParamByName('SODERJANIE').AsString:=f.cxSoderj.Text;
 StPr_KapRem.ParamByName('DB_ID_SCH').AsInteger:=f.db_id_sch;
 StPr_KapRem.ParamByName('KR_ID_SCH').AsInteger:=f.kr_id_sch;
 StPr_KapRem.ParamByName('ID_SM').AsInteger:=f.id_sm;
 StPr_KapRem.ParamByName('ID_RZ').AsInteger:=f.id_rz;
 StPr_KapRem.ParamByName('ID_ST').AsInteger:=f.id_st;
 StPr_KapRem.ParamByName('ID_KEKV').AsInteger:=f.id_kekv;
 StPr_KapRem.ParamByName('SUMMA').AsInteger:=f.cxSumma.Editvalue;

 StPr_KapRem.ExecProc;
 StPr_KapRem.Transaction.Commit;
 except on E : Exception do
  begin
   ShowMessage(E.Message);
   StPr_KapRem.Transaction.Rollback;
   exit;
  end;
 end;
end;
f.free;
DS_KapRem.CloseOpen(false);
end;

procedure TfmMainIvKartForm.cxButton2Click(Sender: TObject);
var f:TKapRemForm;
id_kart, id_pos_rem:integer;
begin
  id_kart:=DataSetKart.FieldByName('R_ID_KART').AsInteger;
  id_pos_rem:=DS_KapRem.FieldByName('ID_INV_KAP_REM').AsInteger;

f:= TKapRemForm.Create(Self);
f.cxDateEdit.EditValue:=DS_KapRem.FieldByName('DATE_REM').AsDateTIME;
f.cxNameDbSch.Text:=DS_KapRem.FieldByName('DB_SCH_NUMBER').AsString;
f.cxNameKrSch.Text:=DS_KapRem.FieldByName('KR_SCH_NUMBER').AsString;
f.cxDbSmeta.Text:= DS_KapRem.FieldByName('SM_KOD').AsString;
f.cxDBRazdel.Text:= DS_KapRem.FieldByName('RZ_KOD').AsString;
f.cxDBStatya.Text:= DS_KapRem.FieldByName('ST_KOD').AsString;
f.cxDBKEKV.Text:= DS_KapRem.FieldByName('KEKV_KOD').AsString;
f.cxIspolnit.Text:= DS_KapRem.FieldByName('ISPOLNITEL').AsString;
f.cxSoderj.Text:= DS_KapRem.FieldByName('SODERJANIE').AsString;
f.cxSumma.Editvalue:= DS_KapRem.FieldByName('SUMMA').AsString;
f.db_id_sch:=DS_KapRem.FieldByName('DB_ID_SCH').AsInteger;
f.kr_id_sch:=DS_KapRem.FieldByName('KR_ID_SCH').AsInteger;
f.id_sm:= DS_KapRem.FieldByName('ID_SM').AsInteger;
f.id_rz:= DS_KapRem.FieldByName('ID_RZ').AsInteger;
f.id_st:= DS_KapRem.FieldByName('ID_ST').AsInteger;
f.id_kekv:= DS_KapRem.FieldByName('ID_KEKV').AsInteger;
f.DbHandle:=DatabaseMain.Handle;
f.ShowModal;
if f.ModalResult = mrOk then
begin

 try
 StPr_KapRem.Close;
 StPr_KapRem.Transaction := Tr_Kap_Rem;
 StPr_KapRem.Transaction.StartTransaction;
 StPr_KapRem.StoredProcName:='MAT_INV_KAP_REM_UPD';
 StPr_KapRem.Prepare;
 StPr_KapRem.ParamByName('ID_INV_KAP_REM').AsInteger:=id_pos_rem;
 StPr_KapRem.ParamByName('ID_INV_KART').AsInteger:=id_kart;
 StPr_KapRem.ParamByName('DATE_REM').AsDate:=f.cxDateEdit.EditValue;
 StPr_KapRem.ParamByName('ISPOLNITEL').AsString:=f.cxIspolnit.Text;
 StPr_KapRem.ParamByName('SODERJANIE').AsString:=f.cxSoderj.Text;
 StPr_KapRem.ParamByName('DB_ID_SCH').AsInteger:=f.db_id_sch;
 StPr_KapRem.ParamByName('KR_ID_SCH').AsInteger:=f.kr_id_sch;
 StPr_KapRem.ParamByName('ID_SM').AsInteger:=f.id_sm;
 StPr_KapRem.ParamByName('ID_RZ').AsInteger:=f.id_rz;
 StPr_KapRem.ParamByName('ID_ST').AsInteger:=f.id_st;
 StPr_KapRem.ParamByName('ID_KEKV').AsInteger:=f.id_kekv;
 StPr_KapRem.ParamByName('SUMMA').AsInteger:=f.cxSumma.Editvalue;

 StPr_KapRem.ExecProc;
 StPr_KapRem.Transaction.Commit;
 except on E : Exception do
  begin
   ShowMessage(E.Message);
   StPr_KapRem.Transaction.Rollback;
   exit;
  end;
 end;
end;
f.free;
DS_KapRem.CloseOpen(false);

end;

procedure TfmMainIvKartForm.actUpdateKapRemExecute(Sender: TObject);
begin
DS_KapRem.CloseOpen(False);
end;

procedure TfmMainIvKartForm.cxButton3Click(Sender: TObject);
var id_pos_rem:integer;
begin
id_pos_rem:=DS_KapRem.FieldByName('ID_INV_KAP_REM').AsInteger;
if DS_KapRem.IsEmpty then
 begin
  MessageBox(Handle, PChar(MAT_INV_Dele_pole_not_insert), PChar(MAT_INV_Attention), 16);
  exit;
 end
 else begin
 if MessageBox(Handle,Pchar(MAT_INV_delete_pole+'?'), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
  then
   begin
                // Удаляем металл
                {id := DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
                id_del := DataSetDrag['ID_FOR_DEL'];
                DeleteMetall(id_del);
                Special_actionExecute(Sender);
                DataSetPapka.Locate('ID_INV_GRP', id, []); }
 try
 StPr_KapRem.Close;
 StPr_KapRem.Transaction := Tr_Kap_Rem;
 StPr_KapRem.Transaction.StartTransaction;
 StPr_KapRem.StoredProcName:='MAT_INV_KAP_REM_DEL';
 StPr_KapRem.Prepare;
 StPr_KapRem.ParamByName('ID_INV_KAP_REM').AsInteger:=id_pos_rem;
 StPr_KapRem.ExecProc;
 StPr_KapRem.Transaction.Commit;
 except on E : Exception do
  begin
   ShowMessage(E.Message);
   StPr_KapRem.Transaction.Rollback;
   exit;
  end;
 end;
end;

 end;
 DS_KapRem.CloseOpen(False);
end;

procedure TfmMainIvKartForm.N10Click(Sender: TObject);
var res : Variant;
begin
//showmessage(DataSetKart.FieldByName('R_ID_KART').AsString+' '+DataSet_history.FieldByName('ID_OP').AsString);
 {  res := UPrintAllDoc.Setings_Print(DatabaseMain.Handle, 26, StrToInt64(DataSetKart.FieldByName('R_ID_KART').AsString), StrToInt64(DataSet_history.FieldByName('ID_OP').AsString), '',id_filter,id_man, is_nalog);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;}
 ds_modern.close;
 ds_modern.Prepare;
 ds_modern.ParamByName('id_kart').asInteger:= DataSetKart.FieldByName('R_ID_KART').AsInteger;
 ds_modern.ParamByName('id_oper').asInteger:= DataSet_history.FieldByName('ID_OP').AsInteger;
 ds_modern.CloseOpen(False);

 frxrprt1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\Akt_moderniz_inv_obj.fr3');

 frxrprt1.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
 frxrprt1.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';
 frxrprt1.PrepareReport;
 if _ALLOW_EDIT_TEMPLATE=1 then frxrprt1.DesignReport
 else
 frxrprt1.ShowReport;

end;

procedure TfmMainIvKartForm.N12Click(Sender: TObject);
begin
frxrprt1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\Print_inv_table.fr3');

 frxrprt1.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
 frxrprt1.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';
 frxrprt1.PrepareReport;
 if _ALLOW_EDIT_TEMPLATE=1 then frxrprt1.DesignReport
 else
 frxrprt1.ShowReport;
end;

procedure TfmMainIvKartForm.btn1Click(Sender: TObject);
var form:TGrpAmortForm;
i:Integer;
begin
 form:=TGrpAmortForm.Create(Self);
 form.pFIBDatabase.Handle:= DBHANDLE;
 //счета
 form.pFIBDSSch.close;
 form.pFIBDSSch.SelectSql.Clear;
 form.pFIBDSSch.SelectSql.Add('Select * from pub_sp_main_sch where id_system=5 and link_to<0 and :date_rec between date_beg and date_end order by sch_number');
 form.pFIBDSSch.Prepare;
 form.pFIBDSSch.ParamByNAme('date_rec').AsDateTime:=_MATAS_PERIOD;
 form.pFIBDSSch.CloseOpen(False);
 form.pFIBDSSch.FetchAll;
 form.pFIBDSSch.First;
 if form.cxDBSch.Properties.Items.Count>0 then
 for i:=0 to form.cxDBSch.Properties.Items.Count do
 form.cxDBSch.Properties.Items.Delete(i);
 while  not  form.pFIBDSSch.Eof do
 begin
  form.cxDBSch.Properties.Items.Add(form.pFIBDSSch.FieldByName('Sch_number').AsString);
  form.pFIBDSSch.Next;
 end;
 //группы аммортизации
 form.pFIBDSAmort.close;
 form.pFIBDSAmort.SelectSql.Clear;
 form.pFIBDSAmort.SelectSql.Add('select name, percent from MAT_SP_NORM_IZN');
 form.pFIBDSAmort.Prepare;
 form.pFIBDSAmort.CloseOpen(False);
 form.pFIBDSAmort.FetchAll;
 form.pFIBDSAmort.First;
 if form.cxDBGrpAmort.Properties.Items.Count>0 then
 for i:=0 to form.cxDBGrpAmort.Properties.Items.Count do
 form.cxDBGrpAmort.Properties.Items.Delete(i);
 while  not  form.pFIBDSAmort.Eof do
 begin
  form.cxDBGrpAmort.Properties.Items.Add(form.pFIBDSAmort.FieldByName('name').AsString);
  form.pFIBDSAmort.Next;
 end;
 //справочник
 form.pFIBDataSet.close;
 form.pFIBDataSet.SelectSql.Clear;
 form.pFIBDataSet.SelectSql.Add('select * from MAT_SP_LINK_GRP_OS_AMORT_SEL order by sch_number ');
 form.pFIBDataSet.Prepare;
 form.pFIBDataSet.CloseOpen(False);
 form.pFIBDataSet.FetchAll;
 form.pFIBDataSet.First;

 form.ShowModal;
end;

initialization
    Virtual_DataSet        := TpFIBDataSet.Create(nil);
    Virtual_StoredProc     := TpFIBStoredProc.Create(nil);
finalization
    Virtual_DataSet.Free;
    Virtual_StoredProc.Free;

end.



