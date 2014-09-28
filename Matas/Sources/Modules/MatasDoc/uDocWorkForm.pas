{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils,
  Dialogs, uResources, Resources_unitb, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ExtCtrls, ComCtrls, cxCurrencyEdit, cxDropDownEdit, ibase,
  cxCalendar, cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxButtonEdit, pFibStoredProc, uSpTipDoc, uSpMatOtv, GlobalSPR, FIBQuery,
  pFIBQuery, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxClasses, cxStyles,
  cxGridTableView, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, Buttons, ImgList, Menus,
  uMatasVars, uMatasUtils, uSpCustWork,  uSpKomissia, cxSplitter, cxGroupBox,
  cxLabel, cxDBLabel, cxCheckBox, DateUtils, Math, IBCustomDataSet,
  cxDBEdit, cxRadioGroup, uNDSLoader, ActnList, uPackageManager, SIBEABase,
  SIBFIBEA;

type
  TDocEditForm = class(TForm)
    Panel1: TPanel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    MainPages: TPageControl;
    MainTabSheet: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxTipDoc: TcxButtonEdit;
    cxNumDoc: TcxTextEdit;
    cxDateDoc: TcxDateEdit;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    Label4: TLabel;
    cxTotalSum: TcxCurrencyEdit;
    PosWorkImageList: TImageList;
    WriteTransaction: TpFIBTransaction;
    WorkProc: TpFIBStoredProc;
    DocPosDataSet: TpFIBDataSet;
    DocPosDataSource: TDataSource;
    DocPosDataSetID_SESSION: TFIBIntegerField;
    DocPosDataSetID_POS: TFIBIntegerField;
    DocPosDataSetID_NOMN: TFIBIntegerField;
    DocPosDataSetNAME: TFIBStringField;
    DocPosDataSetID_UNIT: TFIBIntegerField;
    DocPosDataSetUNIT: TFIBStringField;
    DocPosDataSetKOL_MAT: TFIBBCDField;
    DocPosDataSetKOL_DOC: TFIBBCDField;
    DocPosDataSetPRICE: TFIBBCDField;
    DocPosDataSetSUMMA: TFIBBCDField;
    DocPosDataSetID_SCH: TFIBIntegerField;
    DocPosDataSetNAME_SCH: TFIBStringField;
    ExtTabSheet: TTabSheet;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cxManFio: TcxButtonEdit;
    cxDovNum: TcxTextEdit;
    cxDovDate: TcxDateEdit;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    cxTipOsn: TcxButtonEdit;
    Label10: TLabel;
    cxNumOsn: TcxTextEdit;
    Label11: TLabel;
    cxDateOsn: TcxDateEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    cxMoOut: TcxButtonEdit;
    cxCustOut: TcxButtonEdit;
    cxCustTo: TcxButtonEdit;
    cxMoTo: TcxButtonEdit;
    Label8: TLabel;
    PosPanel: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    PosButtonPanel: TPanel;
    cxGridDBColumnNpp: TcxGridDBColumn;
    DocPosDataSetNpp: TIntegerField;
    cxAddButton: TcxButton;
    cxEditButton: TcxButton;
    cxDelButton: TcxButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DocPosDataSetSCH_NUMBER: TFIBStringField;
    cxExitButton: TcxButton;
    DocPosDataSetID_MARK: TFIBIntegerField;
    DocPosDataSetNAME_MARK: TFIBStringField;
    DocPosDataSetSHORT_MARK: TFIBStringField;
    cxGridDBTableView1SHORT_MARK: TcxGridDBColumn;
    DocPosDataSetID_OST: TFIBIntegerField;
    DocPosDataSetID_OST_IN: TFIBIntegerField;
    NumDocDataSet: TpFIBDataSet;
    cxGridDBTableView1SCH_NUMBER: TcxGridDBColumn;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    cxUserName: TcxTextEdit;
    cxComputer: TcxTextEdit;
    cxDateTime: TcxTextEdit;
    GroupBox6: TGroupBox;
    cxNumReestr: TcxTextEdit;
    cxDateReestr: TcxDateEdit;
    Label17: TLabel;
    Label18: TLabel;
    GroupBox8: TGroupBox;
    cxDirKomissia: TcxTextEdit;
    Label19: TLabel;
    Label20: TLabel;
    cxKomissia: TcxTextEdit;
    Label21: TLabel;
    Label22: TLabel;
    cxNumPrikazKomissia: TcxTextEdit;
    cxDatePrikazKomissia: TcxDateEdit;
    cxSprKomiss: TcxButton;
    OperTabSheet: TTabSheet;
    PanelDate: TPanel;
    PanelOper: TPanel;
    cxGridOper: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    DocProvDataSet: TpFIBDataSet;
    DocProvDataSetDB_ID_SCH: TFIBBCDField;
    DocProvDataSetKR_ID_SCH: TFIBBCDField;
    DocProvDataSetDB_SCH: TFIBStringField;
    DocProvDataSetKR_SCH: TFIBStringField;
    DocProvDataSetSUMMA: TFIBBCDField;
    DocProvDataSource: TDataSource;
    DocProvDataSetID_PROV: TFIBBCDField;
    DocProvDataSetIS_MAIN: TFIBIntegerField;
    DocProvDataSetDB_SCH_TITLE: TFIBStringField;
    DocProvDataSetDB_ID_SM: TFIBBCDField;
    DocProvDataSetDB_SM_TITLE: TFIBStringField;
    DocProvDataSetDB_SM_KOD: TFIBIntegerField;
    DocProvDataSetDB_ID_RZ: TFIBBCDField;
    DocProvDataSetDB_RZ_TITLE: TFIBStringField;
    DocProvDataSetDB_RZ_KOD: TFIBIntegerField;
    DocProvDataSetDB_ID_ST: TFIBBCDField;
    DocProvDataSetDB_ST_TITLE: TFIBStringField;
    DocProvDataSetDB_ST_KOD: TFIBIntegerField;
    DocProvDataSetDB_ID_KEKV: TFIBBCDField;
    DocProvDataSetDB_KEKV_TITLE: TFIBStringField;
    DocProvDataSetDB_KEKV_KOD: TFIBIntegerField;
    DocProvDataSetDB_ID_DOG: TFIBBCDField;
    DocProvDataSetDB_KOD_DOG: TFIBBCDField;
    DocProvDataSetDB_REG_NUM: TFIBStringField;
    DocProvDataSetDB_ID_TIP_DOG: TFIBBCDField;
    DocProvDataSetDB_TIP_DOG: TFIBStringField;
    DocProvDataSetDB_TIP_DOG_SHORT_NAME: TFIBStringField;
    DocProvDataSetDB_TIP_DOG_NAME: TFIBStringField;
    DocProvDataSetDB_N_DOG: TFIBStringField;
    DocProvDataSetDB_DATE_DOG: TFIBDateField;
    DocProvDataSetKR_SCH_TITLE: TFIBStringField;
    DocProvDataSetKR_ID_SM: TFIBBCDField;
    DocProvDataSetKR_SM_TITLE: TFIBStringField;
    DocProvDataSetKR_SM_KOD: TFIBIntegerField;
    DocProvDataSetKR_ID_RZ: TFIBBCDField;
    DocProvDataSetKR_RZ_TITLE: TFIBStringField;
    DocProvDataSetKR_RZ_KOD: TFIBIntegerField;
    DocProvDataSetKR_ID_ST: TFIBBCDField;
    DocProvDataSetKR_ST_TITLE: TFIBStringField;
    DocProvDataSetKR_ST_KOD: TFIBIntegerField;
    DocProvDataSetKR_ID_KEKV: TFIBBCDField;
    DocProvDataSetKR_KEKV_TITLE: TFIBStringField;
    DocProvDataSetKR_KEKV_KOD: TFIBIntegerField;
    DocProvDataSetKR_ID_DOG: TFIBBCDField;
    DocProvDataSetKR_KOD_DOG: TFIBBCDField;
    DocProvDataSetKR_REG_NUM: TFIBStringField;
    DocProvDataSetKR_ID_TIP_DOG: TFIBBCDField;
    DocProvDataSetKR_TIP_DOG: TFIBStringField;
    DocProvDataSetKR_TIP_DOG_SHORT_NAME: TFIBStringField;
    DocProvDataSetKR_TIP_DOG_NAME: TFIBStringField;
    DocProvDataSetKR_N_DOG: TFIBStringField;
    DocProvDataSetKR_DATE_DOG: TFIBDateField;
    DocProvDataSetDB_ISTFIN: TFIBStringField;
    DocProvDataSetKR_ISTFIN: TFIBStringField;
    cxGridDBTableView2DB_ID_SCH: TcxGridDBColumn;
    cxGridDBTableView2KR_ID_SCH: TcxGridDBColumn;
    cxGridDBTableView2DB_SCH: TcxGridDBColumn;
    cxGridDBTableView2KR_SCH: TcxGridDBColumn;
    cxGridDBTableView2SUMMA: TcxGridDBColumn;
    cxGridDBTableView2ID_PROV: TcxGridDBColumn;
    cxGridDBTableView2IS_MAIN: TcxGridDBColumn;
    cxGridDBTableView2DB_SCH_TITLE: TcxGridDBColumn;
    cxGridDBTableView2DB_ID_SM: TcxGridDBColumn;
    cxGridDBTableView2DB_SM_TITLE: TcxGridDBColumn;
    cxGridDBTableView2DB_SM_KOD: TcxGridDBColumn;
    cxGridDBTableView2DB_ID_RZ: TcxGridDBColumn;
    cxGridDBTableView2DB_RZ_TITLE: TcxGridDBColumn;
    cxGridDBTableView2DB_RZ_KOD: TcxGridDBColumn;
    cxGridDBTableView2DB_ID_ST: TcxGridDBColumn;
    cxGridDBTableView2DB_ST_TITLE: TcxGridDBColumn;
    cxGridDBTableView2DB_ST_KOD: TcxGridDBColumn;
    cxGridDBTableView2DB_ID_KEKV: TcxGridDBColumn;
    cxGridDBTableView2DB_KEKV_TITLE: TcxGridDBColumn;
    cxGridDBTableView2DB_KEKV_KOD: TcxGridDBColumn;
    cxGridDBTableView2DB_ID_DOG: TcxGridDBColumn;
    cxGridDBTableView2DB_KOD_DOG: TcxGridDBColumn;
    cxGridDBTableView2DB_REG_NUM: TcxGridDBColumn;
    cxGridDBTableView2DB_ID_TIP_DOG: TcxGridDBColumn;
    cxGridDBTableView2DB_TIP_DOG: TcxGridDBColumn;
    cxGridDBTableView2DB_TIP_DOG_SHORT_NAME: TcxGridDBColumn;
    cxGridDBTableView2DB_TIP_DOG_NAME: TcxGridDBColumn;
    cxGridDBTableView2DB_N_DOG: TcxGridDBColumn;
    cxGridDBTableView2DB_DATE_DOG: TcxGridDBColumn;
    cxGridDBTableView2KR_SCH_TITLE: TcxGridDBColumn;
    cxGridDBTableView2KR_ID_SM: TcxGridDBColumn;
    cxGridDBTableView2KR_SM_TITLE: TcxGridDBColumn;
    cxGridDBTableView2KR_SM_KOD: TcxGridDBColumn;
    cxGridDBTableView2KR_ID_RZ: TcxGridDBColumn;
    cxGridDBTableView2KR_RZ_TITLE: TcxGridDBColumn;
    cxGridDBTableView2KR_RZ_KOD: TcxGridDBColumn;
    cxGridDBTableView2KR_ID_ST: TcxGridDBColumn;
    cxGridDBTableView2KR_ST_TITLE: TcxGridDBColumn;
    cxGridDBTableView2KR_ST_KOD: TcxGridDBColumn;
    cxGridDBTableView2KR_ID_KEKV: TcxGridDBColumn;
    cxGridDBTableView2KR_KEKV_TITLE: TcxGridDBColumn;
    cxGridDBTableView2KR_KEKV_KOD: TcxGridDBColumn;
    cxGridDBTableView2KR_ID_DOG: TcxGridDBColumn;
    cxGridDBTableView2KR_KOD_DOG: TcxGridDBColumn;
    cxGridDBTableView2KR_REG_NUM: TcxGridDBColumn;
    cxGridDBTableView2KR_ID_TIP_DOG: TcxGridDBColumn;
    cxGridDBTableView2KR_TIP_DOG: TcxGridDBColumn;
    cxGridDBTableView2KR_TIP_DOG_SHORT_NAME: TcxGridDBColumn;
    cxGridDBTableView2KR_TIP_DOG_NAME: TcxGridDBColumn;
    cxGridDBTableView2KR_N_DOG: TcxGridDBColumn;
    cxGridDBTableView2KR_DATE_DOG: TcxGridDBColumn;
    cxGridDBTableView2DB_ISTFIN: TcxGridDBColumn;
    cxGridDBTableView2KR_ISTFIN: TcxGridDBColumn;
    Label5: TLabel;
    cxSplitterInfo: TcxSplitter;
    cxCheckInfo: TcxCheckBox;
    DocPosDataSetOUT_POS: TFIBIntegerField;
    DocPosDataSetPOS_NOTE: TFIBStringField;
    cxGridDBTableView1POS_NOTE: TcxGridDBColumn;
    DocDataSet: TpFIBDataSet;
    DocDataSetNAME_IN: TStringField;
    DocDataSetNAME_OUT: TStringField;
    DocDataSetKOD_DOC: TFIBSmallIntField;
    DocDataSetID_DOC: TFIBBCDField;
    DocDataSetID_TIPD: TFIBBCDField;
    DocDataSetTIPD: TFIBStringField;
    DocDataSetNAME_TIPD: TFIBStringField;
    DocDataSetNUM_DOC: TFIBStringField;
    DocDataSetDATE_DOC: TFIBDateField;
    DocDataSetOSN_ID_TIPD: TFIBBCDField;
    DocDataSetOTIPD: TFIBStringField;
    DocDataSetNAME_OSN: TFIBStringField;
    DocDataSetOSN_NUM_DOC: TFIBStringField;
    DocDataSetOSN_DATE_DOC: TFIBDateField;
    DocDataSetID_MO_IN: TFIBBCDField;
    DocDataSetFIO_MO_IN: TFIBStringField;
    DocDataSetFIO_IN: TFIBStringField;
    DocDataSetNAME_DEP_IN: TFIBStringField;
    DocDataSetID_MO_OUT: TFIBBCDField;
    DocDataSetFIO_MO_OUT: TFIBStringField;
    DocDataSetFIO_OUT: TFIBStringField;
    DocDataSetNAME_DEP_OUT: TFIBStringField;
    DocDataSetID_CUST: TFIBBCDField;
    DocDataSetNAME_CUSTOMER: TFIBStringField;
    DocDataSetSUMMA: TFIBBCDField;
    DocDataSetID_MAN: TFIBBCDField;
    DocDataSetFIO_MAN: TFIBStringField;
    DocDataSetSFIO_MAN: TFIBStringField;
    DocDataSetDOV_NUM: TFIBStringField;
    DocDataSetDOV_DATE: TFIBDateField;
    DocDataSetDATE_REC: TFIBDateField;
    DocDataSetPUB_ID_DOC: TFIBBCDField;
    DocDataSetNUM_REESTR: TFIBStringField;
    DocDataSetDATE_REESTR: TFIBDateField;
    DocDataSetUSER_NAME: TFIBStringField;
    DocDataSetCOMPUTER: TFIBStringField;
    DocDataSetDATETIME: TFIBDateTimeField;
    DocDataSetDIR_KOMISSIA: TFIBStringField;
    DocDataSetKOMISSIA: TFIBStringField;
    DocDataSetNUM_PRIKAZ_KOMISSIA: TFIBStringField;
    DocDataSetDATE_PRIKAZ_KOMISSIA: TFIBDateField;
    DocPosDataSetSTATE: TFIBIntegerField;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    GroupBox7: TGroupBox;
    cxDocNote: TcxTextEdit;
    DocPosDataSetOUT_POS_MSG: TIBStringField;
    cxGridDBTableView1OUT_POS_MSG: TcxGridDBColumn;
    DocDataSetDOC_NOTE: TFIBStringField;
    DocDataSetINV_KART_MODE: TFIBIntegerField;
    DocDataSetMNA_KART_MODE: TFIBIntegerField;
    DocDataSetPERIOD: TFIBStringField;
    cxDBTextEdit1: TcxDBTextEdit;
    DocDataSource: TDataSource;
    Panel2: TPanel;
    PanelUser: TPanel;
    PanelInfo: TPanel;
    cxGroupBoxDb: TcxGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    cxLabelDbSm: TcxDBLabel;
    cxLabelDbRz: TcxDBLabel;
    cxLabelDbSt: TcxDBLabel;
    cxLabelDbKekv: TcxDBLabel;
    cxLabelDbDogTip: TcxDBLabel;
    cxLabelDbDogReg: TcxDBLabel;
    cxLabelDbDogNum: TcxDBLabel;
    cxLabelDbDogData: TcxDBLabel;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    cxGroupBox1: TcxGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    cxLabelKrSm: TcxDBLabel;
    cxLabelKrRz: TcxDBLabel;
    cxLabelKrSt: TcxDBLabel;
    cxLabelKrKekv: TcxDBLabel;
    cxLabelKrDogTIp: TcxDBLabel;
    cxLabelKrDogReg: TcxDBLabel;
    cxLabelKrDogNum: TcxDBLabel;
    cxLabelKrDogData: TcxDBLabel;
    cxDBLabel5: TcxDBLabel;
    cxDBLabel6: TcxDBLabel;
    cxDBLabel7: TcxDBLabel;
    cxDBLabel8: TcxDBLabel;
    GroupBox9: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    DocDataSetIKOL_MAT: TFIBBCDField;
    DocDataSetIKOL_DOC: TFIBBCDField;
    DocDataSetCOUNT_POS: TFIBIntegerField;
    DocDataSetPUB_ID_USER: TFIBBCDField;
    DocDataSetPUB_USER_NAME: TFIBStringField;
    DocDataSetPUB_USER_FULL_NAME: TFIBStringField;
    DocDataSetPUB_COMPUTER: TFIBStringField;
    DocDataSetPUB_DATETIME: TFIBDateTimeField;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxRadioData: TcxRadioButton;
    cxRadioUser: TcxRadioButton;
    cxCheckNDS: TcxCheckBox;
    ActionList1: TActionList;
    acViewNum: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    acViewHistory: TAction;
    PopupMenuView: TPopupMenu;
    NInvNomView: TMenuItem;
    NHistView: TMenuItem;
    N8: TMenuItem;
    DocPosDataSetKOD_SYSTEM: TFIBIntegerField;
    DocPosDataSetINV_KART_MODE: TFIBIntegerField;
    DocPosDataSetMNA_KART_MODE: TFIBIntegerField;
    SIBfibEventAlerter1: TSIBfibEventAlerter;
    ForFIO: TpFIBDataSet;
    ForBSO: TpFIBDataSet;
    StPrClearClone: TpFIBStoredProc;
    TrClearClone: TpFIBTransaction;
    StPrClone: TpFIBStoredProc;
    TrClone: TpFIBTransaction;
    procedure cxTipOsnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxMoOutPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxMoToPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCustOutPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCustToPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SaveDocIntf;
    function CheckDocData: boolean;
    procedure GetTipDoc;
    procedure MainPagesChange(Sender: TObject);
    procedure DocPosDataSetCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cxTipDocPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxAddButtonClick(Sender: TObject);
    procedure cxEditButtonClick(Sender: TObject);
    procedure cxDelButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCheckInfoPropertiesChange(Sender: TObject);
    procedure cxSprKomissClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DocDataSetCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxExitButtonClick(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxTipOsnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNumOsnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxMoOutKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCustOutKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxMoToKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCustToKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxTipDocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNumDocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDateDocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDateOsnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SetDocProperties;
    procedure GetInvKartData;
    procedure SaveDocPosData(aVals: array of Variant);
    procedure cxRadioUserClick(Sender: TObject);
    procedure cxRadioDataClick(Sender: TObject);
    procedure acViewNumExecute(Sender: TObject);
    procedure acViewHistoryExecute(Sender: TObject);
    procedure SIBfibEventAlerter1EventAlert(Sender: TObject;
      EventName: String; EventCount: Integer);

  private
   DBHANDLE : TISC_DB_HANDLE;
  public
   ID_DOC, ID_TIPD, OSN_ID_TIPD, ID_MO_IN, ID_MO_OUT, ID_MAN: integer;
   ID_CUST: int64;
   IsMoIn, IsMoOut, IsCust: boolean;
   IsNeedKolDoc: boolean;
   IsNeedWorkPos: boolean;
   POS_MODE: integer;
   ID_SESSION: integer;
   IsVisiblePosPanel: boolean;
   ResTipDoc : Variant;
   ID_POS: integer;
   DOC_WORK_MODE: TFMode;
   last_num_doc, next_num_doc_string, num_doc: string;
   next_num_doc, kol_null, NumDocLength, ID_DOCCLONE:Integer;
   is_add, is_clone:Integer;
   NumDoc, error_clone: string;
   date_opr:TDateTime;
   function IsOnlyNumber(numb:string):Integer;
   function NumDocLiter (numb:string):String;
   function NumDocNumber(numb:string):String;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_DOC: integer; ID_TIPD: integer; ID_DOC_CLONE:Integer);overload;
  end;

 procedure ViewDoc(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_DOC: integer);stdcall;
 exports ViewDoc;

var
  DocEditForm: TDocEditForm;

implementation

{$R *.dfm}
uses uDocWork, uDocWorkPosEditForm, uDocWorkOstForm, uDocWorkInvKartForm,
     uDocWorkNalogInvoice, uDocWorkOstInvKart, uDocWorkHistoryForm, uDocWorkOstMnaKart,
     uDocMnaKartForm, uDocWorkBSO, uBSOView;

procedure ViewDoc(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_DOC: integer);stdcall;
var
 T: TDocEditForm;
begin
 T:=TDocEditForm.Create(aOwner, aDBHANDLE, aID_DOC, 0,0);
 T.FormStyle:=fsMDIChild;
 T.IsVisiblePosPanel:=false;
 T.DocDataSet.ParamByName('ID_DOC').Value:=aID_DOC;
 T.DocDataSet.CloseOpen(false);
 T.ID_TIPD:=T.DocDataSet.FieldByName('ID_TIPD').AsInteger;
 T.ID_MO_IN:=T.DocDataSet.FieldByName('ID_MO_IN').AsInteger;
 T.ID_MO_OUT:=T.DocDataSet.FieldByName('ID_MO_OUT').AsInteger;
 T.ID_CUST:=T.DocDataSetID_CUST.AsInt64;
 T.ID_MAN:=T.DocDataSet.FieldByName('ID_MAN').AsInteger;
 T.OSN_ID_TIPD:=T.DocDataSet.FieldByName('OSN_ID_TIPD').AsInteger;
 T.cxTipDoc.Text:=T.DocDataSet.FieldByName('TIPD').AsString;
 T.cxTipDoc.Enabled:=false;
 T.cxNumDoc.Text:=T.DocDataSet.FieldByName('NUM_DOC').AsString;
 T.cxDateDoc.EditValue:=T.DocDataSet.FieldByName('DATE_DOC').AsDateTime;
 T.cxTotalSum.Value:=T.DocDataSet.FieldByName('SUMMA').AsFloat;
 T.cxTipOsn.Text:=T.DocDataSet.FieldByName('OTIPD').AsString;
 T.cxNumOsn.Text:=T.DocDataSet.FieldByName('OSN_NUM_DOC').AsString;
 if not T.DocDataSet.FieldByName('OSN_DATE_DOC').IsNull then
  T.cxDateOsn.EditValue:=T.DocDataSet.FieldByName('OSN_DATE_DOC').AsDateTime;
 T.cxDovNum.Text:=T.DocDataSet.FieldByName('DOV_NUM').AsString;
 if not T.DocDataSet.FieldByName('DOV_DATE').IsNull then
  T.cxDovDate.EditValue:=T.DocDataSet.FieldByName('DOV_DATE').AsDateTime;
// T.cxPeriod.EditValue:=T.DocDataSet.FieldByName('PERIOD').AsString;
 T.cxManFio.Text:=T.DocDataSet.FieldByName('FIO_MAN').AsString;
 T.cxMoOut.Text:=T.DocDataSet.FieldByName('NAME_OUT').AsString + ' / ' + T.DocDataSet.FieldByName('NAME_DEP_OUT').AsString;
 T.cxMoTo.Text:=T.DocDataSet.FieldByName('NAME_IN').AsString + ' / ' + T.DocDataSet.FieldByName('NAME_DEP_IN').AsString;
 T.GroupBox1.Enabled:=false;
 T.GroupBox2.Enabled:=false;
 T.GroupBox5.Enabled:=false;
 T.GroupBox3.Enabled:=false;
 T.PosButtonPanel.Visible:=false;
 T.OkButton.Visible:=false;
 T.CancelButton.Visible:=false;
 T.cxExitButton.Visible:=true;
 T.cxUserName.Text:=T.DocDataSet.FieldByName('USER_NAME').AsString;
 T.cxComputer.Text:=T.DocDataSet.FieldByName('COMPUTER').AsString;
 T.cxDateTime.Text:=T.DocDataSet.FieldByName('DATETIME').AsString;
 T.GroupBox4.Enabled:=false;
 T.cxNumReestr.Text:=T.DocDataSet.FieldByName('NUM_REESTR').AsString;
 T.cxDateReestr.EditValue:=T.DocDataSet.FieldByName('DATE_REESTR').AsString;
 T.GroupBox8.Enabled:=false;
// if not T.DocDataSet.FieldByName('DATE_REC').IsNull then
//  T.cxPeriod.EditValue:=T.DocDataSet.FieldByName('DATE_REC').AsString;
 if T.DocDataSet.FieldByName('DATE_REC').IsNull then
  T.OperTabSheet.TabVisible:=false
 else
  T.OperTabSheet.TabVisible:=true;
 T.DocProvDataSet.ParamByName('P_ID_DOC').Value:=aID_DOC;
 T.DocProvDataSet.CloseOpen(false);
 T.cxGrid2.PopupMenu:=T.PopupMenuView;
 T.Panel1.PopupMenu:=nil;
 T.Caption:=MAT_SYS_PREFIX+MAT_ACTION_VIEW_CONST;
 T.Caption:=T.Caption+ ' :: '+T.cxTipDoc.Text+' '+T.cxNumDoc.Text+' від '+T.cxDateDoc.Text;
 T.cxCheckNDS.Visible:=false;
 T.cxDocNote.Text:=T.DocDataSet.FieldByName('DOC_NOTE').AsString;
 T.cxKomissia.Text:=T.DocDataSet.FieldByName('KOMISSIA').AsString;
 T.cxDirKomissia.Text:=T.DocDataSet.FieldByName('DIR_KOMISSIA').AsString;
 T.Show;
// T.Free;
end;

function GetNextNumDoc(sNumDoc: string): string;
var
 n, ln: integer;
 l, num: integer;
 rs: string;
 sc: char;
 sn: string;
begin
 sn:=trim(sNumDoc);
 n:=0;
 ln:=Length(sn);
 l:=ln;
 repeat
  sc:=sn[l];
  if (sc in ['0'..'9']) then
   n:=l
  else begin
   n:=l-1;
   break;
  end;
  l:=l-1;
 until (sc in ['0'..'9']);
 if n=0 then
  rs:=sn
 else begin
  TryStrToInt(RightStr(sn,ln-n+1),num);
  rs:=LeftStr(sn,n-1)+IntToStr(num+1);
 end;
 GetNextNumDoc:=rs;
end;

{
function GetNextNumDoc(sNumDoc: string): string;
var
 i, n: integer;
 l: integer;
 rs, sn, sc: string;
begin
 sn:=trim(sNumDoc);
 sc:='';
 n:=0;
 for l:=1 to Length(sn) do
 begin
  sc:=RightStr(sn,l);
  if not TryStrToInt(sc, i) then
  begin
   n:=Length(sn)-l+2;
   sc:=RightStr(sn,l-1);
   break;
  end;
 end;
 if sc='' then
  rs:=sn
 else
  rs:=LeftStr(sn,n-1)+IntToStr(StrToInt(sc)+1);
 GetNextNumDoc:=rs;
end;
}

constructor TDocEditForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_DOC: integer; ID_TIPD: integer; ID_DOC_CLONE:integer);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.WorkDatabase.Close;
  Self.WorkDatabase.Handle:=DBHANDLE;
 end;
 Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK+' :: '+MAT_STR_MODE_ADD;
 Self.MainPages.ActivePage:=Self.MainTabSheet;
 Self.ID_DOC:=ID_DOC;
 Self.ID_TIPD:=ID_TIPD;
 Self.IsVisiblePosPanel:=true;
 Self.cxDateDoc.EditValue:=GetDateDoc;
 Self.cxCheckNDS.Visible:=IntToBool(_LINK_TO_NDS_ENABLED);

 if ID_DOC=0 then
 begin
//  Self.ID_TIPD:=0;
  Self.OSN_ID_TIPD:=0;
  Self.ID_MO_IN:=0;
  Self.ID_MO_OUT:=0;
  Self.ID_CUST:=0;
  Self.ID_MAN:=-1;
  Self.ID_SESSION:=-1;
  Self.cxNumDoc.Text:='1';
  Self.IsMoIn:=false;
  Self.IsMoOut:=false;
  Self.IsCust:=false;
 end;
  ID_DOCCLONE:=ID_DOC_CLONE;
end;

procedure TDocEditForm.SetDocProperties;
var
 prop: string[20];
 nt, nf: integer;
begin
  if ID_TIPD=0 then
   ResTipDoc:=uSpTipDoc.GetTipDoc(self, self.DBHANDLE, 0, 0)
  else
   ResTipDoc:=uSpTipDoc.GetTipDocEx(self, self.DBHANDLE, 0, ID_TIPD);
  if  VarType(ResTipDoc) <> varEmpty then
  begin
    ID_TIPD := ResTipDoc[0];
    cxTipDoc.Text := ResTipDoc[1];
    cxTipDoc.Enabled:=False;
    prop:=ResTipDoc[3];
    if (prop[1] in ['0', '1', '2']) then
     nt:=StrToInt(prop[1])
    else
     nt:=2;
    if (prop[3] in ['0', '1', '2']) then
     nf:=StrToInt(prop[3])
    else
     nf:=2;
    if prop[5]='1' then IsNeedKolDoc:=true
    else IsNeedKolDoc:=false;
    if prop[9]='1' then IsNeedWorkPos:=true
    else IsNeedWorkPos:=false;
    POS_MODE:=ResTipDoc[8];
    if prop[7]='1' then
     cxCheckNDS.Visible:=true
    else
     cxCheckNDS.Visible:=false;
    if nt=0 then
    begin
     cxMoTo.Enabled:=True;
     cxCustTo.Visible:=False;
     IsMoIn:=true;
    end;
    if nt=1 then
    begin
     cxCustTo.Enabled:=True;
     cxMoTo.Visible:=False;
     IsCust:=true;
    end;
    if nt=2 then
    begin
     cxMoTo.Enabled:=False;
     cxCustTo.Visible:=False;
    end;
    if nf=0 then
    begin
     cxMoOut.Enabled:=True;
     cxCustOut.Visible:=False;
     IsMoOut:=True;
    end;
    if nf=1 then
    begin
     cxCustOut.Enabled:=True;
     cxMoOut.Visible:=False;
     IsCust:=true;
    end;
    if nf=2 then
    begin
     cxCustOut.Visible:=false;
     cxMoOut.Enabled:=False;
    end;

    if ((ResTipDoc[10]<> null) and (ResTipDoc[10]<>0)) then
    begin
      ID_MO_IN:=ResTipDoc[10];
      ForFIO.Close;
      ForFio.SelectSql.Clear;
      ForFIO.SelectSQL.Add(' SELECT SFIO, NAME_DEPARTMENT FROM MAT_SP_MO_SELECT_BY_ID(:ID_MO) ');
      ForFIO.Prepare;
      ForFIO.ParamByName('ID_MO').Value:=ResTipDoc[10];
      ForFIO.CloseOpen(False);
      cxMOTo.Text:= ForFIO.FieldValues['SFIO']+' / '+ForFIO.FieldValues['NAME_DEPARTMENT'];
    end;
    if ((ResTipDoc[11]<> null) and (ResTipDoc[11]<>0)) then
    begin
      ID_MO_OUT:=ResTipDoc[11];
      ForFIO.Close;
      ForFio.SelectSql.Clear;
      ForFIO.SelectSQL.Add(' SELECT SFIO, NAME_DEPARTMENT FROM MAT_SP_MO_SELECT_BY_ID(:ID_MO) ');
      ForFIO.Prepare;
      ForFIO.ParamByName('ID_MO').Value:=ResTipDoc[11];
      ForFIO.CloseOpen(False);
      cxMOOUT.Text:= ForFIO.FieldValues['SFIO']+' / '+ForFIO.FieldValues['NAME_DEPARTMENT'];
    end;
  end;

end;

procedure TDocEditForm.GetTipDoc;
var
  vals : array of Variant;
 // NumDoc: string;
  flag: boolean;
  NumDocInt, MaxNumDocInt: integer;
  NumDocPrefix: string;
  NumDocLen1: integer;
  ZeroStr: string;
  DocYear, DocMonth, DocDay: word;
  n: integer;
  num_doc_without, num_doc_liter, num_doc_number, next_num_doc_str:string;
  next_num_doc_int:Integer;
begin
   num_doc:='';
   SetDocProperties;
   if  VarType(ResTipDoc) <> varEmpty then
   begin
    NumDocPrefix:=ResTipDoc[4];
    NumDocLength:=ResTipDoc[5];
    Cursor:=crSQLWait;
    DecodeDate(VarToDateTime(cxDateDoc.EditValue), DocYear, DocMonth, DocDay);
    try
     if _AUTO_NUM_DOC_MODE=1 then
     begin
      NumDocDataSet.Close;
      NumDocDataSet.SelectSQL.Clear;
      NumDocDataSet.SelectSQL.Add('SELECT LAST_NUM_DOC AS NUM_DOC FROM MAT_INI_NUM_DOC ');
      NumDocDataSet.SelectSQL.Add('WHERE ID_TIPD='+IntToStr(ID_TIPD)+' AND YEAR_DOC='+IntToStr(DocYear));
      NumDocDataSet.CloseOpen(false);
     end;
     if _AUTO_NUM_DOC_MODE=0 then
     begin
      NumDocDataSet.Close;
      NumDocDataSet.SelectSQL.Clear;
      NumDocDataSet.SelectSQL.Add('SELECT MAX(NUM_DOC) AS NUM_DOC FROM MAT_DT_DOC ');
      NumDocDataSet.SelectSQL.Add('WHERE ID_TIPD='+IntToStr(ID_TIPD)+' AND DATE_DOC>=:YEAR_DOC');
      NumDocDataSet.Prepare;
      NumDocDataSet.ParamByName('YEAR_DOC').Value:=StartOfTheYear(cxDateDoc.EditValue);
      NumDocDataSet.CloseOpen(false);
     end;
     flag:=true;

     if NumDocDataSet.FieldByName('NUM_DOC').AsString = '' then last_num_doc:='0'
     else last_num_doc:=NumDocDataSet.FieldByName('NUM_DOC').AsString;

     if IsOnlyNumber(last_num_doc) = 0 then last_num_doc:='0';
     next_num_doc:=StrToInt(last_num_doc)+1;
     next_num_doc_string:=IntToStr(next_num_doc);
     kol_null:= NumDocLength - Length(next_num_doc_string);
     num_doc:='';
     while (kol_null <>0) do
     begin
      num_doc:=num_doc+'0';
      kol_null:=kol_null-1;
     end;
      num_doc:=num_doc+next_num_doc_string;
    { NumDocInt:=0;
     MaxNumDocInt:=0;
     if not NumDocDataSet.IsEmpty then
     begin
      NumDocDataSet.First;
      while not NumDocDataSet.Eof do
      begin
       num_doc_without:=NumDocDataSet.FieldByName('NUM_DOC').AsString;
       num_doc_liter:=NumDocLiter(num_doc_without);
       num_doc_number:=NumDocNumber(num_doc_without);
       TryStrToInt(num_doc_number, NumDocInt);
       if MaxNumDocInt<NumDocInt then
        MaxNumDocInt:=NumDocInt;
       NumDocDataSet.Next;
      end;
      NumDocDataSet.First;
      NumDoc:=NumDocDataSet.FieldByName('NUM_DOC').AsString;
      if MaxNumDocInt=0 then
       NumDoc:=GetNextNumDoc(NumDoc)
      else
       NumDoc:=IntToStr(MaxNumDocInt+1);
      end
      else
       NumDoc:='1';
      if (_SET_AUTO_DOC_NUMBER=1) and (NumDocLength>0) then
      begin
       if strlen(PChar(NumDocPrefix+NumDoc))<NumDocLength then
       begin
        NumDocLen1:=NumDocLength-strlen(PChar(NumDocPrefix+NumDoc));
        ZeroStr:='';
        for n:=1 to NumDocLen1 do ZeroStr:=ZeroStr+'0';
        NumDoc:=NumDocPrefix+ZeroStr+NumDoc;
       end
      end;  }
     // cxNumDoc.Text:=num_doc_liter+NumDoc;
     cxNumDoc.Text:=num_doc;
    except on E:Exception do
     begin
      ShowMessage(E.Message);
     end;
    end;
    try
      WriteTransaction.StartTransaction;
      StoredProc.Transaction := WriteTransaction;
      StoredProc.ExecProcedure('MAT_INI_NUM_DOC_UPDATE_EX', [YearOf(cxDateDoc.EditValue), ID_TIPD, next_num_doc]);
      WriteTransaction.Commit;
    except on E : Exception
    do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
      exit;
      end;
    end;
   { try
     StoredProc.Transaction.StartTransaction;
     StoredProc.ExecProcedure('MAT_INI_NUM_DOC_UPDATE', [DocYear, ID_TIPD, next_num_doc_str]);
     StoredProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
      exit;
     end;
    end; }
    Cursor:=crDefault;
   end;
end;

procedure TDocEditForm.cxTipOsnPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
  Res:=uSpTipDoc.GetTipDoc(self, self.DBHANDLE, 0, 1);
  if  VarType(Res) <> varEmpty
   then begin
    OSN_ID_TIPD:=Res[0];
    cxTipOsn.Text := Res[1];
  end;
end;

procedure TDocEditForm.cxMoOutPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 if DocPosDataSet.RecordCount<>0 then
 begin
  ShowMessage('Неможливо змінити МВО, тому що в документі введені його залишки!');
  Exit;
 end;
  Res:=uSpMatOtv.GetMatOtv(self, self.DBHANDLE, 0, ID_MO_OUT);
  if  VarType(Res) <> varEmpty
   then begin
    ID_MO_OUT:=Res[0];
    cxMoOut.Text := Res[1] + ' / ' + Res[2];
  end;
end;

procedure TDocEditForm.cxMoToPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  USE_EXT_ACCESS_FOR_MO_OLD: integer;
begin
  USE_EXT_ACCESS_FOR_MO_OLD:=_USE_EXT_ACCESS_FOR_MO;
  _USE_EXT_ACCESS_FOR_MO:=0;
  Res:=uSpMatOtv.GetMatOtv(self, self.DBHANDLE, 0, ID_MO_IN);
  _USE_EXT_ACCESS_FOR_MO:=USE_EXT_ACCESS_FOR_MO_OLD;
  if  VarType(Res) <> varEmpty
   then begin
    ID_MO_IN:=Res[0];
    cxMoTo.Text := Res[1] + ' / ' + Res[2];
  end;
end;

procedure TDocEditForm.cxCustOutPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=uSpCustWork.GetCustomers(self, self.DBHANDLE, 0, fsNormal, Date, csmCustomers, ID_CUST, -1, false, -1);
  if  VarType(Res) <> varEmpty
   then begin
    ID_CUST:=Res[0];
    cxCustOut.Text := Res[2];
  end;
end;

procedure TDocEditForm.cxCustToPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=uSpCustWork.GetCustomers(self, self.DBHANDLE, 0, fsNormal, Date, csmCustomers, ID_CUST, -1, false, -1);
// Res:=GlobalSPR.GetCustomers(self, self.DBHANDLE, fsNormal, Date, csmCustomers);
  if  VarType(Res) <> varEmpty
   then begin
    ID_CUST:=Res[0];
    cxCustTo.Text := Res[2];
  end;
end;

function TDocEditForm.CheckDocData;
var
 lok: boolean;
begin
 lok:=true;
 CheckDocData:=false;
 if (ID_TIPD=0) or (cxTipDoc.Text='') then
 begin
  lok:=false;
  ShowMessage('Необхідно вказати тип документа!');
  cxTipDoc.SetFocus;
  Exit;
 end;
 if cxNumDoc.Text='' then
 begin
  lok:=false;
  ShowMessage('Необхідно вказати номер документа!');
  cxNumDoc.SetFocus;
  Exit;
 end;
 if cxDateDoc.EditText='' then
 begin
  lok:=false;
  ShowMessage('Необхідно вказати дату документа!');
  cxDateDoc.SetFocus;
  Exit;
 end;
 if IsMoIn and (ID_MO_IN=0) then
 begin
  lok:=false;
  ShowMessage('Необхідно вказатм МВО (кому)!');
  cxMoTo.SetFocus;
  Exit;
 end;
 if IsMoOut and (ID_MO_OUT=0) then
 begin
  lok:=false;
  ShowMessage('Необхідно вказати МВО (від кого)!');
  cxMoOut.SetFocus;
  Exit;
 end;
 if IsCust and (ID_CUST=0) then
 begin
  lok:=false;
  ShowMessage('Необхідно вказати контрагента!');
  Exit;
 end;
 CheckDocData:=lok;
end;


procedure TDocEditForm.OkButtonClick(Sender: TObject);
var
 lok: boolean;
 w: TForm;
 num_doc_, stroka:string;
 itsOk:Boolean;
 ost:string;
{ MassData1      :Variant;
 i              :Integer;
 RecordMassData :uNDSLoader.TInvoces;
 MassError      :variant;
 BoundMassError :Integer;
 T: TDocWorkNalogInvoiceForm;
 ErrStr: string;
}
 begin
   OkButton.Enabled:=False;
{ if cxCheckNDS.Checked then
 begin
  T:=TDocWorkNalogInvoiceForm.Create(self);
  T.cxDateDoc.EditValue:=cxDateDoc.EditValue;
  if T.ShowModal=mrCancel then
   cxCheckNDS.Checked:=false
 end;
}
itsOk:=True;
 num_doc_:= cxNumDoc.Text;
{ if ((IsOnlyNumber(last_num_doc) = 1) and (IsOnlyNumber(cxNumDoc.Text) = 0)) then
 begin
  if MessageBox(Handle,'Раніше номера цього типу документів містили тільки цифри. Бажаєте змінити структуру?','Увага', MB_YESNO) = mrNo then
  if NumDoc<>'' then  cxNumDoc.Text:= NumDoc else cxNumDoc.Text:=num_doc_;
 end;
}
if is_add = 1 then
begin
if num_doc = num_doc_ then itsOk:=True
else
 begin
  stroka:=Copy(num_doc_, 1, NumDocLength);
  ost:= Copy(num_doc_, NumDocLength+1,1);
 // ShowMessage(stroka+' '+ost+' ' +num_doc);
  if (num_doc = stroka) and ((ost<>'0') or (ost<>'1') or(ost<>'2') or(ost<>'3') or(ost<>'4') or(ost<>'5') or(ost<>'6') or(ost<>'7') or(ost<>'8') or(ost<>'9') )
  then  itsOk:=True
  else itsOk:=False;
 end;
end;

 w:=ShowWaitWindow(self);
 lok:=CheckDocData;
 if lok then
 begin
 if (itsOk=False) and (is_add = 1) then
 begin
  if MessageDlgU('Увага','Для цього типа документа інша структура номера. Зберігти зміни?', mtConfirmation, [mbYes, mbNo]) = ID_NO then cxNumDoc.Text:=num_doc
  else begin cxNumDoc.Text:=num_doc_; next_num_doc:=next_num_doc-1; end;
 end;
  WriteTransaction.StartTransaction;
  SaveDocIntf;
   // showmessage('1');
  try
    StoredProc.Transaction := WriteTransaction;
//   StoredProc.Transaction.StartTransaction;

   StoredProc.ExecProcedure('MAT_DT_DOC_SAVE', [ID_SESSION]);
//   StoredProc.Transaction.Commit;
   id_doc:=StoredProc.ParamByName('ID_DOC').AsInteger;
 
{   // создаем налог. накладную в буфере
   if cxCheckNDS.Checked then
   begin
    SetLength(RecordMassData.MassSingleInv, 1);
    SetLength(RecordMassData.MassSingleInv[0].MassPos, DocPosDataSet.RecordCount);
    //Заполняем данные по накладной
    RecordMassData.MassSingleInv[0].ID_INVOISE             :=ID_DOC;
    RecordMassData.MassSingleInv[0].NUM_INVOICE            :=T.cxNumDoc.Text;
    RecordMassData.MassSingleInv[0].DATE_INVOICE           :=T.cxDateDoc.EditValue;
    RecordMassData.MassSingleInv[0].ID_REESTR              :=212;
    RecordMassData.MassSingleInv[0].Id_CUSTOMER            :=ID_CUST;
    RecordMassData.MassSingleInv[0].ID_OWNER               :=Null;
    RecordMassData.MassSingleInv[0].FIO                    :='';//T.cxFio.Text;
//    RecordMassData.MassSingleInv[0].ID_FORM_RASCH          :=Null;
//    RecordMassData.MassSingleInv[0].NOTE_FORM_RASCH        :='';
    RecordMassData.MassSingleInv[0].NOTE_BY                :='';
    RecordMassData.MassSingleInv[0].COMMENT                :='';
    RecordMassData.MassSingleInv[0].SUMMA                  :=cxTotalSum.EditValue;
    RecordMassData.MassSingleInv[0].ID_POLZOVATEL_SENDING  :=_CURRENT_USER_ID;
    RecordMassData.MassSingleInv[0].DATE_TIME_SENDING      :=Now;
    RecordMassData.MassSingleInv[0].NAME_COMP_SENDING      :=cxComputer.Text;
    RecordMassData.MassSingleInv[0].PK_ID_DOC              :=990000021;

    //Заполняем данные по позициям
    DocPosDataSource.Enabled:=false;
    DocPosDataSet.First;
    for i:=0 to DocPosDataSet.RecordCount-1 do
    begin
     RecordMassData.MassSingleInv[0].MassPos[i].ID_POSITION    :=DocPosDataSet.FieldByName('ID_POS').AsInteger;
     RecordMassData.MassSingleInv[0].MassPos[i].ID_NOMN        :=DocPosDataSet.FieldByName('ID_NOMN').AsInteger;
     RecordMassData.MassSingleInv[0].MassPos[i].ID_UNIT        :=DocPosDataSet.FieldByName('ID_UNIT').AsInteger;
     RecordMassData.MassSingleInv[0].MassPos[i].DATE_SHIPMENT  :=T.cxDateDoc.EditValue;
     RecordMassData.MassSingleInv[0].MassPos[i].QUANTITY       :=DocPosDataSet.FieldByName('KOL_MAT').AsFloat;
     RecordMassData.MassSingleInv[0].MassPos[i].PRICE_LESS_NDS :=DocPosDataSet.FieldByName('PRICE').AsFloat;
     RecordMassData.MassSingleInv[0].MassPos[i].SUMMA_LESS_NDS :=DocPosDataSet.FieldByName('SUMMA').AsFloat;
//     RecordMassData.MassSingleInv[0].MassPos[i].ID_TIP_NDS     :=Null;
//     RecordMassData.MassSingleInv[0].MassPos[0].ID_TIP_OBJECT  :=Null;
     DocPosDataSet.Next;
    end;
    DocPosDataSource.Enabled:=true;

    MassError :=uNDSLoader.ShowImportNds(Self, DBHANDLE, _CURRENT_USER_ID, RecordMassData);
    //Сообщения об ошибках
    BoundMassError:=VarArrayHighBound(MassError, 1)-VarArrayLowBound(MassError, 1);
    if BoundMassError>0 then
    begin
     for i:=1 to BoundMassError do
     begin
      ErrStr:=ErrStr+chr(13)+VarToStr(MassError[i][1]);
     end;
     ShowMessage(VarToStr(MassError[0][0])+chr(13)+ErrStr);
    end;
    T.Free;
   end;
}
   ModalResult:=mrOk;
   WriteTransaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    ModalResult:=mrNone;
    CloseWaitWindow(w);
    exit;
   end;
  end;

 {if is_add = 1 then
  try
    WriteTransaction.StartTransaction;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.ExecProcedure('MAT_INI_NUM_DOC_UPDATE_EX', [YearOf(cxDateDoc.EditValue), ID_TIPD, next_num_doc]);
    WriteTransaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    exit;
   end;
  end; }

 end;
 CloseWaitWindow(w);
    OkButton.Enabled:=True;
end;

procedure TDocEditForm.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 Res: Variant;
 nIdMan: integer;
begin
 nIdMan:=ID_MAN;
 if nIdMan=0 then nIdMan:=-1;
 Res:=uPackageManager.GetMan(self, self.DBHANDLE, nIdMan);
 if VarArrayDimCount(Res)>0 then
 begin
  ID_MAN := (Res[0]);
  cxManFio.Text := VarToStr(Res[1]);
 end;
end;

procedure TDocEditForm.SaveDocIntf;
var
 vals : array of Variant;
 NUM_DOC: string;
 DATE_DOC: TDateTime;
 OSN_NUM_DOC: string;
 OSN_DATE_DOC: TDateTime;
 SUMMA: real;
 DOV_NUM: string;
 DOV_DATE: TDateTime;
 komis, komis_1:string;
 i:Integer;
begin
 if ID_SESSION>=0 then
 begin
  Cursor:=crSQLWait;
  NUM_DOC:=cxNumDoc.Text;
  DATE_DOC:=cxDateDoc.Date;
  OSN_NUM_DOC:=cxNumOsn.Text;
  OSN_DATE_DOC:=cxDateOsn.Date;
  SUMMA:=0.00;
  DOV_NUM:=cxDovNum.Text;
  DOV_DATE:=cxDovDate.Date;
  SetLength(Vals, 23);
  Vals[0]  := ID_SESSION;
  Vals[1]  := ID_TIPD;
  Vals[2]  := NUM_DOC;
  Vals[3]  := DATE_DOC;
  Vals[4]  := OSN_ID_TIPD;
  Vals[5]  := OSN_NUM_DOC;
  if cxDateOsn.EditText='' then
   Vals[6] := null
  else
   Vals[6]  := OSN_DATE_DOC;
  Vals[7] := ID_MO_IN;
  Vals[8] := ID_MO_OUT;
  Vals[9] := IntToStr(ID_CUST);
  Vals[10] := SUMMA;
  Vals[11] := ID_MAN;
  Vals[12] := DOV_NUM;
  if cxDovDate.EditText='' then
   Vals[13] := null
  else
   Vals[13] := DOV_DATE;
  Vals[14] := ID_DOC;
  Vals[15] := IntToStr(_CURRENT_USER_ID);
  Vals[16] := _CURRENT_USER_NAME;
  Vals[17] := GetComputerNetName;
  Vals[18] := cxDirKomissia.Text;
   {for i:=1 to Length (cxKomissia.Text) do
   if Copy(cxKomissia.Text, i, 1)=' ' then komis:=komis+#13+#10
   else komis:=komis+ Copy(cxKomissia.Text, i, 1);  }
 
  Vals[19] := cxKomissia.Text;
  Vals[20] := cxNumPrikazKomissia.Text;
  if cxDatePrikazKomissia.EditText='' then
   Vals[21] := null
  else
   Vals[21] := cxDatePrikazKomissia.EditValue;
  Vals[22] := cxDocNote.Text;
  try
   WorkProc.Transaction := WriteTransaction;
//   WorkProc.Transaction.StartTransaction;
   WorkProc.StoredProcName:='MAT_DT_DOC_INTF_ADD';
   WorkProc.Prepare;
   WorkProc.ExecProcedure('MAT_DT_DOC_INTF_ADD', vals);
//   WorkProc.Transaction.Commit;
   cxMoOut.Enabled:=false;
   cxMoTo.Enabled:=false;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkProc.Transaction.Rollback;
     exit;
    end;
  end;
  Cursor:=crDefault;
 end;
end;

procedure TDocEditForm.MainPagesChange(Sender: TObject);
begin
 if IsVisiblePosPanel then begin
  if ((Sender as TPageControl).ActivePage <> MainTabSheet) then
   PosButtonPanel.Visible:=False
  else
   PosButtonPanel.Visible:=True;
 end;
end;

procedure TDocEditForm.DocPosDataSetCalcFields(DataSet: TDataSet);
begin
 DocPosDataSetNpp.Value:=DocPosDataSet.Recno;
 if DocPosDataSetOUT_POS.Value=1 then
  DocPosDataSetOUT_POS_MSG.Value:='С'
 else
  DocPosDataSetOUT_POS_MSG.Value:='';
end;

procedure TDocEditForm.FormCreate(Sender: TObject);
begin
 cxAddButton.Caption:=MAT_ACTION_ADD_CONST;
 cxEditButton.Caption:=MAT_ACTION_UPDATE_CONST;
 cxDelButton.Caption:=MAT_ACTION_DELETE_CONST;
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 cxExitButton.Caption:=MAT_ACTION_CLOSE_CONST;
 if ID_DOC=0 then
 begin
  try
   WorkProc.Close;
   WorkProc.Transaction := WriteTransaction;
   WorkProc.Transaction.StartTransaction;
   WorkProc.StoredProcName:='MAT_GET_ID_SESSION';
   WorkProc.Prepare;
   WorkProc.ExecProc;
   ID_SESSION:=WorkProc.ParamByName('ID_SESSION').AsInteger;
   WorkProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkProc.Transaction.Rollback;
    exit;
   end;
  end;
  GetTipDoc;
 end
 else
 begin
  try
   WorkProc.Close;
   WorkProc.Transaction := WriteTransaction;
   WorkProc.Transaction.StartTransaction;
   WorkProc.StoredProcName:='MAT_DT_DOC_POS_INTF_MOVE';
   WorkProc.Prepare;
   WorkProc.ParamByName('ID_DOC').Value:=ID_DOC;
   WorkProc.ExecProc;
   ID_SESSION:=WorkProc.ParamByName('ID_SESSION').AsInteger;
   WorkProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkProc.Transaction.Rollback;
    exit;
   end;
  end;
//  GroupBox1.Enabled:=false;
//  GroupBox3.Enabled:=false;
 end;
 if ID_TIPD>0 then
  PosButtonPanel.Visible:=true;
  // заполняем документ
try
  StPrClone.Close;
  StPrClone.Transaction := TrClone;
  StPrClone.Transaction.StartTransaction;
  StPrClone.StoredProcName:='MAT_DT_DOC_POS_INTF_ADD_CLONE';
  StPrClone.Prepare;
  StPrClone.ParamByName('ID_DOC').AsInteger:=ID_DOCCLONE;
  StPrClone.ParamByName('ID_SESSION').AsInteger:= ID_SESSION;
  StPrClone.ExecProc;
  StPrClone.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   StPrClone.Transaction.Rollback;
  end;
 end;
 //
 DocPosDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
 DocPosDataSet.CloseOpen(false);
end;

procedure TDocEditForm.cxTipDocPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 GetTipDoc;
 if ID_TIPD>0 then
  PosButtonPanel.Visible:=true;
end;

procedure TDocEditForm.GetInvKartData;
begin
//
end;

procedure TDocEditForm.SaveDocPosData(aVals: array of Variant);
var
 FLAG_INV_KART, FLAG_MNA_KART, kod_system, sch_prop_inv_acc: integer;
 iform: TDocWorkInvKartForm;
 mform: TDocMnaKartForm;
 w: TForm;
 vals: array of Variant;
begin
 // приходные документы
 w:=ShowWaitWindow(self);
 try
  WorkProc.Close;
  WorkProc.Transaction := WriteTransaction;
  WorkProc.Transaction.StartTransaction;
  WorkProc.StoredProcName:='MAT_DT_DOC_POS_INTF_ADD';
  WorkProc.Prepare;
  WorkProc.ExecProcedure('MAT_DT_DOC_POS_INTF_ADD', aVals);
  ID_POS:=WorkProc.ParamByName('ID_POS').AsInteger;
  FLAG_INV_KART:=WorkProc.ParamByName('FLAG_INV_KART').AsInteger;
  FLAG_MNA_KART:=WorkProc.ParamByName('FLAG_MNA_KART').AsInteger;
  kod_system:=WorkProc.ParamByName('KOD_SYSTEM').AsInteger;
  sch_prop_inv_acc:=WorkProc.ParamByName('sch_prop_inv_acc').AsInteger;
  cxTotalSum.Value:=cxTotalSum.Value + aVals[6];
  WorkProc.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   WorkProc.Transaction.Rollback;
  end;
 end;
 if FLAG_INV_KART=1 then begin
  if ((ResTipDoc[6]=3) or (ResTipDoc[6]=4) or (ResTipDoc[6]=6)
   or ((_GET_INV_NOM_MODE=2) and (ResTipDoc[6]=2))) then
  begin
   iform:=TDocWorkInvKartForm.Create(self);
   iform.ID_POS:=0; //ID_POS;
   iform.ID_OST:=aVals[8];
   iform.KOL_KART:=aVals[3];
   iform.WorkDatabase.Handle:=DBHANDLE;
   iform.PrepareInvKart;
   if iform.ShowModal = mrOk then
   begin
    iform.RxMemoryData1.First;
    SetLength(Vals, 5);
    while not iform.RxMemoryData1.Eof do
    begin
     if iform.RxMemoryData1CHECKED.Value then
     begin
      vals[0]:=ID_SESSION;
      vals[1]:=ID_POS;
      vals[2]:=iform.RxMemoryData1FID_INV_KART.AsInteger;
      vals[3]:=null;
      vals[4]:=null;
      try
       WorkProc.Close;
       WorkProc.Transaction := WriteTransaction;
       WorkProc.Transaction.StartTransaction;
       WorkProc.StoredProcName:='MAT_DT_DOC_POS_KART_INTF_I';
       WorkProc.Prepare;
       WorkProc.ExecProcedure('MAT_DT_DOC_POS_KART_INTF_I', Vals);
       WorkProc.Transaction.Commit;
      except on E : Exception
       do begin
        ShowMessage(E.Message);
        WorkProc.Transaction.Rollback;
       end;
      end;
     end;
     iform.RxMemoryData1.Next;
    end;
   end;
  end
 end;

// showmessage(inttostr(kod_system)+' '+inttostr(sch_prop_inv_acc)+' '+inttostr(_MNA_INV_ACC)+' '+inttostr(_MBP_INV_ACC));
  if FLAG_MNA_KART = 1 then
  begin
   if (ResTipDoc[7]=2) or (ResTipDoc[7]=4) or (ResTipDoc[7]=6)or (ResTipDoc[7]=3)then
   if ((kod_system = 134) and (sch_prop_inv_acc = 1) and (_MNA_INV_ACC = 1)) or
      ((kod_system = 132) and (sch_prop_inv_acc = 1) and (_MBP_INV_ACC = 1)) then
   begin
   mform:=TDocMnaKartForm.Create(self);
   mform.ID_POS:=0; //ID_POS;
   mform.ID_OST:=aVals[8];
   mform.KOL_KART:=aVals[3];
   mform.MnaDB.Handle:=DBHANDLE;
   mform.PrepareInvKart;
   if mform.ShowModal = mrOk then
   begin
    mform.RxMemoryData1.First;
    SetLength(Vals, 5);
    while not mform.RxMemoryData1.Eof do
    begin
     if mform.RxMemoryData1CHECKED.Value = 1 then
     begin
      vals[0]:=ID_SESSION;
      vals[1]:=ID_POS;
      VALS[2]:=null;
      vals[3]:=mform.RxMemoryData1ID_MNA_KART.AsInteger;
      VALS[4]:=null;
      //  ShowMessage(vartostr(vals[2]));
      try
       WorkProc.Close;
       WorkProc.Transaction := WriteTransaction;
       WorkProc.Transaction.StartTransaction;
       WorkProc.StoredProcName:='MAT_DT_DOC_POS_KART_INTF_I';
       WorkProc.Prepare;
       WorkProc.ExecProcedure('MAT_DT_DOC_POS_KART_INTF_I', Vals);
       WorkProc.Transaction.Commit;
      except on E : Exception
       do begin
        ShowMessage(E.Message);
        WorkProc.Transaction.Rollback;
       end;
      end;
     end;
     mform.RxMemoryData1.Next;
    end;
   end;
  end
 end;
 CloseWaitWindow(w);
end;

procedure TDocEditForm.cxAddButtonClick(Sender: TObject);
var
 form: TDocWorkPosEditForm;
 vals : array of Variant;
 total: double;
 lok: boolean;
 Res: Variant;
 TipMat: integer;
 T: TDocWorkOstForm;
 i, j: integer;
 OST_KOL_MAT, CUR_KOL_MAT, qsumma: Extended;
 is_bso, id_sch_bso:Integer;
 f_bso:TBSOForm;
 number_bso:string;
 kol_kart:Integer;
begin
 if CheckDocData then
 begin
  if ID_MO_OUT<>0 then
  begin
   if _GET_OST_MODE=0 then
   begin
     form:=TDocWorkPosEditForm.Create(self);
     form.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK+' :: '+MAT_STR_MODE_ADD;
     form.DBHANDLE:=DBHANDLE;
     form.ID_MO_OUT:=ID_MO_OUT;
     form.ID_MO_IN:=ID_MO_IN;
     form.cxKolDoc.Enabled:=IsNeedKolDoc;
     form.cxCheckWorkPos.Visible:=IsNeedWorkPos;
     form.cxPosNote.Text:=' ';
     form.ID_SESSION:=ID_SESSION;
     form.POS_MODE:=POS_MODE;
     if form.ShowModal=mrOk then
     begin
      TipMat:=form.TypeMat;
      SetLength(Vals, 13);
      Vals[0]  := ID_SESSION;
      Vals[1]  := form.ID_NOMN;
      Vals[2]  := form.ID_UNIT;
      Vals[3]  := form.cxKolMat.EditValue;
      if IsNeedKolDoc then
        Vals[4]  := form.cxKolDoc.EditValue
      else
       Vals[4]  := form.cxKolMat.EditValue;
      Vals[5]  := form.cxPrice.EditValue;
      Vals[6]  := form.cxSumma.EditValue;
      Vals[7]  := form.ID_SCH;
      Vals[8]  := form.ID_OST;
      Vals[9]  := form.ID_MARK;
      Vals[10] := BoolToInt(form.cxCheckWorkPos.Checked);
      Vals[11] := form.cxPosNote.Text;
      if form.dateopr<>StartOfAMonth(3050,1) then
      Vals[12] := form.dateopr
      else Vals[12] := null;

      SaveDocPosData(Vals);
     end;
     form.Free;
   end;
   if _GET_OST_MODE=1 then //мультивыбор
   begin
     T:=TDocWorkOstForm.Create(self);
     T.DBHANDLE:=DBHANDLE;
     T.WorkDatabase.Handle:=DBHANDLE;
     T.ID_MO:=ID_MO_OUT;
     T.ID_SESSION:=ID_SESSION;
     T.KOL_MODE:=_TYPE_MAT_ACCOUNT;
     T.INV_KART_MODE:=ResTipDoc[6];
     T.MNA_KART_MODE:=ResTipDoc[7];
     T.IS_NEED_KOL_DOC:=IsNeedKolDoc;
     T.IS_NEED_WORK_POS:=IsNeedWorkPos;
     T.DocOstDataSet.ParamByName('ID_MO').Value:=ID_MO_OUT;
     T.DocOstDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
     T.OstSpecDataSet.ParamByName('PID_MO').Value:=ID_MO_OUT;
     T.OstSpecDataSet.ParamByName('PID_SESSION').Value:=ID_SESSION;
     T.SchDataSet.ParamByName('ID_MO').Value:=ID_MO_OUT;
     T.SchDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
     T.DocOstDataSet.CloseOpen(False);
     T.OstSpecDataSet.CloseOpen(False);
     T.OstIstfinDataSet.CloseOpen(false);
     T.SchDataSet.CloseOpen(false);
     T.DocOstDataSet.First;
     if _COMPARE_OST_OBOROT = 1 then
     T.CompareOst;
     
     T.ShowModal;

     cxTotalSum.Value:=cxTotalSum.Value + T.TotalSum;
     T.Free;
   end;
  end
  else
   begin
    form:=TDocWorkPosEditForm.Create(self);
    form.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK+' :: '+MAT_STR_MODE_ADD;
    form.DBHANDLE:=self.DBHANDLE;
    form.ID_MO_OUT:=ID_MO_OUT;
    form.ID_MO_IN:=ID_MO_IN;
    form.ISTFIN_MODE:=false;
{    if DOC_WORK_MODE=OstMode then
    begin
      form.LabelIstfin.Visible:=true;
      form.cxButtonIstfin.Visible:=True;
      Form.ISTFIN_MODE:=True;
    end;
}
    form.cxKolDoc.Enabled:=IsNeedKolDoc;
    form.cxCheckWorkPos.Visible:=IsNeedWorkPos;
    form.cxPosNote.Text:=' ';
    form.ID_SESSION:=ID_SESSION;
    form.POS_MODE:=POS_MODE;
    if form.ShowModal=mrOk then
    begin
      // opredelit svoystvo scheta na BSO
      is_bso:=0;
      ForBSO.Close;
      ForBSO.SelectSQL.Clear;
      ForBSO.SelectSQL.Add(' SELECT C.ID_SCH FROM PUB_SP_MAIN_SCH C INNER JOIN PUB_DT_OBJ_PROP PR ON C.ID_SCH = PR.ID_OBJ ');
      ForBSO.SelectSQL.Add(' INNER JOIN PUB_SP_PROPERTIES P ON PR.ID_PROP = P.ID_PROP WHERE P.PROP_N_PP = 2030 AND C.ID_SCH=:ID_SCH');
      ForBSO.SelectSQL.Add(' AND :DATE_BEG BETWEEN C.DATE_BEG AND C.DATE_END ');
      ForBSO.Prepare;
      ForBSO.ParamByName('DATE_BEG').AsDate:=_MATAS_PERIOD;
      ForBSO.ParamByName('ID_SCH').AsInteger:=form.ID_SCH;
      ForBSO.CloseOpen(False);
      if ForBSO.FieldValues['ID_SCH']<> null then is_bso:=1
      else is_bso:=0;
      ForBSO.Close;
      //
     TipMat:=form.TypeMat;
     SetLength(Vals, 13);
     Vals[0]  := ID_SESSION;
     Vals[1]  := form.ID_NOMN;
     Vals[2]  := form.ID_UNIT;
     Vals[3]  := form.cxKolMat.EditValue;
     if IsNeedKolDoc then
       Vals[4]  := form.cxKolDoc.EditValue
     else
       Vals[4]  := form.cxKolMat.EditValue;
     Vals[5]  := form.cxPrice.EditValue;
     Vals[6]  := form.cxSumma.EditValue;
     Vals[7]  := form.ID_SCH;
     Vals[8]  := form.ID_OST;
     Vals[9]  := form.ID_MARK;
     Vals[10] := BoolToInt(form.cxCheckWorkPos.Checked);
     Vals[11] := form.cxPosNote.Text;
     vals[12] := null;
     SaveDocPosData(Vals);
      //blok raboti s BSO
       if is_bso = 1 then
       begin
       f_bso:=TBSOForm.Create(Self);
       f_bso.lblName.Caption:=form.cxName.Text;
       f_bso.cxKolDoc.Text:=form.cxKolMat.Text;
       f_bso.kol_mat:=form.cxKolMat.EditValue;
       kol_kart:= form.cxKolMat.EditValue;
       f_bso.ShowModal;
       if f_bso.ModalResult = mrOk then
       begin
         number_bso:=f_bso.cxNumBeg.Text;
         for j:=1 to kol_kart do
         begin
           try
            WorkProc.Close;
            WorkProc.Transaction := WriteTransaction;
            WorkProc.Transaction.StartTransaction;
            WorkProc.StoredProcName:='MAT_DT_BSO_KART_INTF_INS';
            WorkProc.Prepare;
            WorkProc.ParamByName('ID_POS').AsInteger:=ID_POS;
            WorkProc.ParamByName('ID_OST').AsInteger:=form.ID_OST;
            WorkProc.ParamByName('SERIYA').AsString:=AnsiUpperCase(f_bso.cxSeriya.Text);
            WorkProc.ParamByName('NUMBER').AsString:=number_bso;
            WorkProc.ParamByName('ID_SESSION').AsInteger:=ID_SESSION;
            WorkProc.ParamByName('ID_BSO_KART').AsInteger:=0;
            WorkProc.ExecProc;
            WorkProc.Transaction.Commit;
             except on E : Exception
             do begin
               ShowMessage(E.Message);
               WorkProc.Transaction.Rollback;
             end;
             end;
            number_bso:=FloatToStr(StrToFloat(number_bso)+1);
         end;
       end;
       end;
      //
    end;
    form.Free;
  end;
  DocPosDataSet.CloseOpen(False);
  DocPosDataSet.Locate('ID_POS', id_pos, []);
 end;
end;

procedure TDocEditForm.cxEditButtonClick(Sender: TObject);
var
 form: TDocWorkPosEditForm;
 vals : array of Variant;
 id_pos: integer;
 old_summa: double;
 is_bso,id_sch_bso, kol_kart, j:Integer;
 number_bso:String;
 f_bso:TBSOForm;
begin
 if DocPosDataSet.IsEmpty then
  exit;
 if DocPosDataSet.FieldByName('STATE').Value=2 then
 begin
  ShowMessage(MAT_STR_NO_EDIT);
  exit;
 end;
 id_pos:=DocPosDataSet.FieldByName('ID_POS').AsInteger;
 form:=TDocWorkPosEditForm.Create(self);
 form.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK+' :: '+MAT_STR_MODE_EDIT;
 form.DBHANDLE:=DBHANDLE;
 form.ID_SESSION:=ID_SESSION;
 form.ID_MO_OUT:=ID_MO_OUT;
 form.ID_MO_IN:=ID_MO_IN;
 form.cxKolDoc.Enabled:=IsNeedKolDoc;
 form.cxCheckWorkPos.Visible:=IsNeedWorkPos;
 form.ID_NOMN:=DocPosDataSet.FieldByName('ID_NOMN').AsInteger;
 form.cxName.Text:=DocPosDataSet.FieldByName('NAME').AsString;
 form.ID_UNIT:=DocPosDataSet.FieldByName('ID_UNIT').AsInteger;
 form.cxKolMat.EditValue:=DocPosDataSet.FieldByName('KOL_MAT').AsFloat;
 form.cxKolDoc.EditValue:=DocPosDataSet.FieldByName('KOL_DOC').AsFloat;
 form.cxPrice.EditValue:=DocPosDataSet.FieldByName('PRICE').AsFloat;
 form.cxSumma.EditValue:=DocPosDataSet.FieldByName('SUMMA').AsFloat;
 old_summa:=DocPosDataSet.FieldByName('SUMMA').AsFloat;
 form.ID_SCH:=DocPosDataSet.FieldByName('ID_SCH').AsInteger;
 form.ID_OST:=DocPosDataSet.FieldByName('ID_OST').AsInteger;
 form.cxNameSch.Text:=DocPosDataSet.FieldByName('SCH_NUMBER').AsString;
 form.cxUnit.Text:=DocPosDataSet.FieldByName('UNIT').AsString;
 form.cxCheckWorkPos.Checked:=IntToBool(DocPosDataSet.FieldByName('OUT_POS').AsInteger);
 form.cxPosNote.Text:=DocPosDataSet.FieldByName('POS_NOTE').AsString;
 form.POS_MODE:=POS_MODE;
 form.cxName.Enabled:=false;
 if DocPosDataSet.FieldByName('ID_MARK').IsNull then
  form.ID_MARK:=0
 else
  form.ID_MARK:=DocPosDataSet.FieldByName('ID_MARK').AsInteger;
 if form.ShowModal=mrOk then
 begin
  SetLength(Vals, 12);
  Vals[0]  := ID_POS;
  Vals[1]  := form.ID_NOMN;
  Vals[2]  := form.ID_UNIT;
  Vals[3]  := form.cxKolMat.EditValue;
  Vals[4]  := form.cxKolDoc.EditValue;
  Vals[5]  := form.cxPrice.EditValue;
  Vals[6]  := form.cxSumma.EditValue;
  Vals[7]  := form.ID_SCH;
  Vals[8]  := form.ID_OST;
  Vals[9]  := form.ID_MARK;
  Vals[10] := BoolToInt(form.cxCheckWorkPos.Checked);
  Vals[11] := form.cxPosNote.Text;
  try
   WorkProc.Close;
   WorkProc.Transaction := WriteTransaction;
   WorkProc.Transaction.StartTransaction;
   WorkProc.StoredProcName:='MAT_DT_DOC_POS_INTF_EDIT';
   WorkProc.Prepare;
   WorkProc.ExecProcedure('MAT_DT_DOC_POS_INTF_EDIT', vals);
   WorkProc.Transaction.Commit;
   cxTotalSum.Value:=cxTotalSum.Value-old_summa+form.cxSumma.Value;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkProc.Transaction.Rollback;
    end;
  end;
  //BSO_kart
 // opredelit svoystvo scheta na BSO
      is_bso:=0;
      ForBSO.Close;
      ForBSO.SelectSQL.Clear;
      ForBSO.SelectSQL.Add(' SELECT C.ID_SCH FROM PUB_SP_MAIN_SCH C INNER JOIN PUB_DT_OBJ_PROP PR ON C.ID_SCH = PR.ID_OBJ ');
      ForBSO.SelectSQL.Add(' INNER JOIN PUB_SP_PROPERTIES P ON PR.ID_PROP = P.ID_PROP WHERE P.PROP_N_PP = 2030 AND ');
      ForBSO.SelectSQL.Add(' :DATE_BEG BETWEEN C.DATE_BEG AND C.DATE_END ');
      ForBSO.Prepare;
      ForBSO.ParamByName('DATE_BEG').AsDate:=_MATAS_PERIOD;
      ForBSO.CloseOpen(False);
      if ForBSO.FieldValues['ID_SCH']<> null then id_sch_bso:=ForBSO.FieldValues['ID_SCH']
      else id_sch_bso:=0;
      ForBSO.Close;
      if id_sch_bso=form.ID_SCH then is_bso:=1;
   //
  //blok raboti s BSO
       if is_bso = 1 then
       begin
       f_bso:=TBSOForm.Create(Self);
       f_bso.lblName.Caption:=form.cxName.Text;
       f_bso.cxKolDoc.Text:=form.cxKolMat.Text;
       f_bso.kol_mat:=form.cxKolMat.EditValue;
       kol_kart:= form.cxKolMat.EditValue;
       f_bso.ShowModal;
       if f_bso.ModalResult = mrOk then
       begin
        try
        WorkProc.Close;
        WorkProc.Transaction := WriteTransaction;
        WorkProc.Transaction.StartTransaction;
        WorkProc.StoredProcName:='MAT_DT_BSO_KART_INTF_DEL';
        WorkProc.Prepare;
        WorkProc.ParamByName('ID_POS').AsInteger:=ID_POS;
        WorkProc.ExecProc;
        WorkProc.Transaction.Commit;
        except on E : Exception
        do begin
         ShowMessage(E.Message);
         WorkProc.Transaction.Rollback;
        end;
        end;

         number_bso:=f_bso.cxNumBeg.Text;
         for j:=1 to kol_kart do
         begin
           try
            WorkProc.Close;
            WorkProc.Transaction := WriteTransaction;
            WorkProc.Transaction.StartTransaction;
            WorkProc.StoredProcName:='MAT_DT_BSO_KART_INTF_INS';
            WorkProc.Prepare;
            WorkProc.ParamByName('ID_POS').AsInteger:=ID_POS;
            WorkProc.ParamByName('ID_OST').AsInteger:=form.ID_OST;
            WorkProc.ParamByName('SERIYA').AsString:=AnsiUpperCase(f_bso.cxSeriya.Text);
            WorkProc.ParamByName('NUMBER').AsString:=number_bso;
            WorkProc.ParamByName('ID_SESSION').AsInteger:=ID_SESSION;
            WorkProc.ExecProc;
            WorkProc.Transaction.Commit;
             except on E : Exception
             do begin
               ShowMessage(E.Message);
               WorkProc.Transaction.Rollback;
             end;
             end;
            number_bso:=FloatToStr(StrToFloat(number_bso)+1);
         end;
       end;
       end;
   //
  //
  DocPosDataSet.CloseOpen(False);
  DocPosDataSet.Locate('ID_POS', id_pos, []);
 end;
 form.Free;
end;

procedure TDocEditForm.cxDelButtonClick(Sender: TObject);
var
 vals : array of Variant;
 id_pos: integer;
 summa: double;
 is_bso, id_sch_bso:Integer;
begin
 if DocPosDataSet.FieldByName('STATE').Value=2 then
 begin
  ShowMessage(MAT_STR_NO_DELETE);
  exit;
 end;
 id_pos:=DocPosDataSet.FieldByName('ID_POS').AsInteger;
 summa:=DocPosDataSet.FieldByName('SUMMA').AsFloat;
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES
 then begin
   SetLength(Vals, 1);
   Vals[0]  := ID_POS;
   try
    WorkProc.Close;
    WorkProc.Transaction := WriteTransaction;
    WorkProc.Transaction.StartTransaction;
    WorkProc.StoredProcName:='MAT_DT_DOC_POS_INTF_DEL';
    WorkProc.Prepare;
    WorkProc.ExecProcedure('MAT_DT_DOC_POS_INTF_DEL', vals);
    cxTotalSum.Value:=cxTotalSum.Value-summa;
    WorkProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkProc.Transaction.Rollback;
     exit;
    end;
   end;
   DocPosDataSet.CloseOpen(False);
   // opredelit svoystvo scheta na BSO
      is_bso:=0;
      ForBSO.Close;
      ForBSO.SelectSQL.Clear;
      ForBSO.SelectSQL.Add(' SELECT C.ID_SCH FROM PUB_SP_MAIN_SCH C INNER JOIN PUB_DT_OBJ_PROP PR ON C.ID_SCH = PR.ID_OBJ ');
      ForBSO.SelectSQL.Add(' INNER JOIN PUB_SP_PROPERTIES P ON PR.ID_PROP = P.ID_PROP WHERE P.PROP_N_PP = 2030 AND ');
      ForBSO.SelectSQL.Add(' :DATE_BEG BETWEEN C.DATE_BEG AND C.DATE_END ');
      ForBSO.Prepare;
      ForBSO.ParamByName('DATE_BEG').AsDate:=_MATAS_PERIOD;
      ForBSO.CloseOpen(False);
      if ForBSO.FieldValues['ID_SCH']<> null then id_sch_bso:=ForBSO.FieldValues['ID_SCH']
      else id_sch_bso:=0;
      ForBSO.Close;
      if id_sch_bso=DocPosDataSetID_SCH.AsInteger then is_bso:=1;
   //
   // удаляем бсо
   if is_bso = 1 then
   try
   WorkProc.Close;
   WorkProc.Transaction := WriteTransaction;
   WorkProc.Transaction.StartTransaction;
   WorkProc.StoredProcName:='MAT_DT_BSO_KART_INTF_INS';
   WorkProc.Prepare;
   WorkProc.ParamByName('ID_POS').AsInteger:=ID_POS;
   WorkProc.ExecProc;
   WorkProc.Transaction.Commit;
    except on E : Exception
    do begin
    ShowMessage(E.Message);
    WorkProc.Transaction.Rollback;
    end;
    end;
   DocPosDataSet.CloseOpen(False);
   //
  end;
end;

procedure TDocEditForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if (Key=VK_RETURN) and (Shift<>[ssCtrl]) then
//  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  if CancelButton.Visible then
   CancelButton.SetFocus
  else
   cxExitButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.Click;
end;

procedure TDocEditForm.cxCheckInfoPropertiesChange(Sender: TObject);
begin
 if cxCheckInfo.Checked then
  cxSplitterInfo.OpenSplitter
 else
  cxSplitterInfo.CloseSplitter;
end;

procedure TDocEditForm.cxSprKomissClick(Sender: TObject);
var
  Res : Variant;
begin
 Res:=uSpKomissia.GetKomissia(self, DBHANDLE, 0);
 if  VarType(Res) <> varEmpty then
 begin
  cxDirKomissia.Text:=Res[2];
  cxKomissia.Text:=Res[3];
  cxNumPrikazKomissia.Text:=Res[4];
  cxDatePrikazKomissia.EditValue:=Res[5];
 end;
end;

procedure TDocEditForm.FormShow(Sender: TObject);
var
 Res: Variant;
 prop: string;
begin
  Res:=uSpTipDoc.GetTipDocEx(self, self.DBHANDLE, 0, ID_TIPD);
  if  VarType(Res) <> varEmpty then
  begin
   prop:=Res[3];
//   ShowMessage(prop);
   if prop[5]='1' then IsNeedKolDoc:=true
   else IsNeedKolDoc:=false;
   if prop[9]='1' then IsNeedWorkPos:=true
   else IsNeedWorkPos:=false;
   if prop[7]='1' then
   begin
//    LabelDocSumma.Enabled:=true;
//    cxDocSumma.Enabled:=true;
   end;
  end;
  if GroupBox1.Enabled then
  begin
   if ID_TIPD>0 then
    cxNumDoc.SetFocus
   else
    cxTipDoc.SetFocus
  end
  else
   cxGrid2.SetFocus;
  // showmessage(Inttostr(is_clone));
  if is_clone=1 then
  begin

      ForFIO.Close;
      ForFio.SelectSql.Clear;
      ForFIO.SelectSQL.Add(' SELECT SFIO, NAME_DEPARTMENT FROM MAT_SP_MO_SELECT_BY_ID(:ID_MO) ');
      ForFIO.Prepare;
      ForFIO.ParamByName('ID_MO').Value:=ID_MO_IN;
      ForFIO.CloseOpen(False);
      if ForFIO.FieldValues['SFIO']<> null then
      cxMOTo.Text:= ForFIO.FieldValues['SFIO']+' / '+ForFIO.FieldValues['NAME_DEPARTMENT'];

      ForFIO.Close;
      ForFio.SelectSql.Clear;
      ForFIO.SelectSQL.Add(' SELECT SFIO, NAME_DEPARTMENT FROM MAT_SP_MO_SELECT_BY_ID(:ID_MO) ');
      ForFIO.Prepare;
      ForFIO.ParamByName('ID_MO').Value:=ID_MO_OUT;
      ForFIO.CloseOpen(False);
      if ForFIO.FieldValues['SFIO']<> null then
      cxMOOUT.Text:= ForFIO.FieldValues['SFIO']+' / '+ForFIO.FieldValues['NAME_DEPARTMENT'];

      ForFIO.Close;
      ForFio.SelectSql.Clear;
      ForFIO.SelectSQL.Add(' SELECT NAME FROM mat_clone_doc where id_session=:id_session');
      ForFIO.Prepare;
      ForFIO.ParamByName('ID_SESSION').Value:=ID_SESSION;
      ForFIO.CloseOpen(False);
      ForFIO.FetchAll;
      error_clone:='';
      if ForFIO.RecordCount<>0 then
      begin
        ForFIO.First;
        while not ForFIO.Eof do
        begin
          error_clone:=error_clone+#13+#10+ForFIO.FieldValues['Name'];
          ForFIO.Next;
        end;
        ShowMessage('Наступні позиції не вдалося склонувати:'+#13+#10+error_clone);
      try
       StPrClearClone.Close;
       StPrClearClone.Transaction := TrClearClone;
       StPrClearClone.Transaction.StartTransaction;
       StPrClearClone.StoredProcName:='MAT_DT_DOC_CLONE_CLEAR';
       StPrClearClone.Prepare;
       StPrClearClone.ParamByName('ID_SESSION').AsInteger:= ID_SESSION;
       StPrClearClone.Transaction.Commit;
      except on E : Exception
      do begin
      ShowMessage(E.Message);
      StPrClearClone.Transaction.Rollback;
      end;
      end;

 end;
  end;
end;

procedure TDocEditForm.DocDataSetCalcFields(DataSet: TDataSet);
begin
 if DocDataSetID_MO_IN.Value<>0 then
 begin
  DocDataSetNAME_IN.Value:=DocDataSetFIO_MO_IN.Value;
  if DocDataSetID_CUST.Value<>0 then
   DocDataSetNAME_OUT.Value:=DocDataSetNAME_CUSTOMER.Value;
 end;
 if DocDataSetID_MO_OUT.Value<>0 then
 begin
  DocDataSetNAME_OUT.Value:=DocDataSetFIO_MO_OUT.Value;
  if DocDataSetID_CUST.Value<>0 then
   DocDataSetNAME_IN.Value:=DocDataSetNAME_CUSTOMER.Value;
 end;
end;

procedure TDocEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TDocEditForm.cxExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TDocEditForm.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if (AViewInfo.GridRecord.Values[0] = 2)  then
  begin
      ACanvas.Canvas.Font.Color := clRed;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TDocEditForm.cxTipOsnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then begin
  cxTipOsnPropertiesButtonClick(self, 0);
  cxNumOsn.SetFocus;
 end;
end;

procedure TDocEditForm.cxNumOsnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxDateOsn.SetFocus;
end;

procedure TDocEditForm.cxMoOutKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then begin
  cxMoOutPropertiesButtonClick(self, 0);
  if cxMoTo.Enabled then
   cxMoTo.SetFocus;
  if cxCustTo.Enabled then
   cxCustTo.SetFocus;
 end;
end;

procedure TDocEditForm.cxCustOutKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then begin
  cxCustOutPropertiesButtonClick(self, 0);
  if cxMoTo.Enabled then
   cxMoTo.SetFocus;
  if cxCustTo.Enabled then
   cxCustTo.SetFocus;
 end;
end;

procedure TDocEditForm.cxMoToKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then begin
  cxMoToPropertiesButtonClick(self, 0);
  cxGrid2.SetFocus;
 end;
end;

procedure TDocEditForm.cxCustToKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then begin
  cxCustToPropertiesButtonClick(self, 0);
  cxGrid2.SetFocus;
 end;
end;

procedure TDocEditForm.cxTipDocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxNumDoc.SetFocus;
end;

procedure TDocEditForm.cxNumDocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxDateDoc.SetFocus;
end;

procedure TDocEditForm.cxDateDocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxTipOsn.SetFocus;
end;

procedure TDocEditForm.cxDateOsnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (Shift<>[ssCtrl]) then
  Key:=VK_TAB;
end;

procedure TDocEditForm.cxRadioUserClick(Sender: TObject);
begin
 cxRadioData.Checked:=false;
 PanelInfo.Visible:=false;
 PanelUser.Visible:=true;
 cxRadioUser.Checked:=true;
end;

procedure TDocEditForm.cxRadioDataClick(Sender: TObject);
begin
 cxRadioData.Checked:=true;
 PanelInfo.Visible:=true;
 PanelUser.Visible:=false;
 cxRadioUser.Checked:=false;
end;

procedure TDocEditForm.acViewNumExecute(Sender: TObject);
var
 T: TDocWorkOstInvKartForm;
 M: TDocWorkOstMnaKartForm;
 id: integer;
 B: TViewBSOForm;
 is_bso:Integer;
begin
 id:=DocPosDataSet.FieldByName('ID_POS').AsInteger;
 if DocPosDataSet.FieldByName('KOD_SYSTEM').AsInteger=_KOD_SYSTEM_OS then
 begin
  T:=TDocWorkOstInvKartForm.Create(self);
  T.WorkDatabase.Handle:=DBHANDLE;
  T.KartDataSet.ParamByName('ID_POS').Value:=id;
  T.KartDataSet.ParamByName('ID_OST').Value:=0;
  T.KartDataSet.CloseOpen(false);
  T.ShowModal;
  T.Free;
 end;
 if (DocPosDataSet.FieldByName('KOD_SYSTEM').AsInteger=_KOD_SYSTEM_MNA) or
  (DocPosDataSet.FieldByName('KOD_SYSTEM').AsInteger=_KOD_SYSTEM_MBP) then
 begin
  M:=TDocWorkOstMnaKartForm.Create(self);
  M.WorkDatabase.Handle:=DBHANDLE;
  M.KartDataSet.ParamByName('ID_POS').Value:=id;
  M.KartDataSet.ParamByName('ID_OST').Value:=0;
  M.KartDataSet.CloseOpen(false);
  M.ShowModal;
  M.Free;
 end;
 // opredelit svoystvo scheta na BSO
  is_bso:=0;
  ForBSO.Close;
  ForBSO.SelectSQL.Clear;
  ForBSO.SelectSQL.Add(' SELECT C.ID_SCH FROM PUB_SP_MAIN_SCH C INNER JOIN PUB_DT_OBJ_PROP PR ON C.ID_SCH = PR.ID_OBJ ');
  ForBSO.SelectSQL.Add(' INNER JOIN PUB_SP_PROPERTIES P ON PR.ID_PROP = P.ID_PROP WHERE P.PROP_N_PP = 2030 AND C.ID_SCH=:ID_SCH AND');
  ForBSO.SelectSQL.Add(' :DATE_BEG BETWEEN C.DATE_BEG AND C.DATE_END ');
  ForBSO.Prepare;
  ForBSO.ParamByName('DATE_BEG').AsDate:=_MATAS_PERIOD;
  ForBSO.ParamByName('ID_SCH').AsInteger:=DocPosDataSetID_SCH.AsInteger;
  ForBSO.CloseOpen(False);
 if ForBSO.FieldValues['ID_SCH']<> null then is_bso:=1
 else is_bso:=0;
  ForBSO.Close;
  //
 if is_bso = 1 then
 begin
  B:=TViewBSOForm.Create(Self);
  ForBSO.Close;
  ForBSO.SelectSQL.Clear;
  ForBSO.SelectSQL.Add(' SELECT * FROM MAT_DT_BSO_KART I INNER JOIN MAT_DT_DOC_POS_KART K ON K.ID_BSO_KART=I.ID_BSO_KART WHERE K.ID_POS=:ID_POS');
  ForBSO.Prepare;
  ForBSO.ParamByName('ID_POS').AsInteger:=DocPosDataSetID_POS.AsInteger;
  ForBSO.CloseOpen(False);
  ForBSO.FetchAll;
  ForBSO.First;
  B.ds1.DataSet:=ForBSO;
  B.ShowModal;
  B.Free;
 end;
end;

procedure TDocEditForm.acViewHistoryExecute(Sender: TObject);
var
  T: TDocWorkViewHistoryForm;
begin
 T:=TDocWorkViewHistoryForm.Create(self);
 T.WorkDatabase.Handle:=DBHANDLE;
 if ((DocPosDataSet.FieldByName('ID_OST_IN').AsInteger = 0) or (DocPosDataSet.FieldByName('ID_OST_IN').AsInteger = null)) then
 T.HistoryDataSet.ParamByName('PID_OST').Value:=DocPosDataSet.FieldByName('ID_OST').AsInteger
 else
 T.HistoryDataSet.ParamByName('PID_OST').Value:=DocPosDataSet.FieldByName('ID_OST_IN').AsInteger;

 T.cxCheckBox.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 T.HistoryDataSet.CloseOpen(false);
 T.ShowModal;
 T.Free;
end;

procedure TDocEditForm.SIBfibEventAlerter1EventAlert(Sender: TObject;
  EventName: String; EventCount: Integer);
begin
showmessage(EventName);
end;

function TDocEditForm.IsOnlyNumber(numb:string):Integer;
var l,i:Integer;
    k:string;
    flag:Boolean;
begin
  l:=Length(numb);
  flag:=True;
  i:=1;
  while ((flag) and (i<=l)) do
  begin
    k:=Copy(numb,i,1);
    if ((k ='0') or (k='1')or (k='2')or (k='3')or (k='4')or (k='5')or (k='6')or (k='7')or (k='8')or (k='9')) then Inc(i)
    else flag:=False;
  end;
  if flag = True then Result:=1 else Result:=0;
end;

function TDocEditForm.NumDocLiter(numb:string):String;
var l,i:Integer;
    text, k: string;
    flag:Boolean;
begin
  l:=Length(numb);
  flag:=True;
  i:=1;
  while (i<=l) do
  begin
    k:=Copy(numb,i,1);
    if ((k ='0') or (k='1')or (k='2')or (k='3')or (k='4')or (k='5')or (k='6')or (k='7')or (k='8')or (k='9')) then
    begin
     if flag then
        text:=text+k;
     Inc(i);
    end
    else
    begin
     flag:=False;
     text:=text+k;
     Inc(i);
    end;
  end;
  if flag then Result:='' else Result:=text;
end;

function TDocEditForm.NumDocNumber(numb:string):String;
var l,i:Integer;
    text, number,k: string;
    flag:Boolean;
begin
  l:=Length(numb);
  flag:=True;
  i:=1;
  while (i<=l) do
  begin
    k:=Copy(numb,i,1);
    if ((k ='0') or (k='1')or (k='2')or (k='3')or (k='4')or (k='5')or (k='6')or (k='7')or (k='8')or (k='9')) then
    begin
     if flag then
        text:=text+k;
     if flag = False
     then number:= number+k;
     Inc(i);
    end
    else
    begin
     flag:=False;
     number:='';
     text:=text+k;
     Inc(i);
    end;
  end;
  if flag = false then Result:=number else Result:=text;
end;
end.


