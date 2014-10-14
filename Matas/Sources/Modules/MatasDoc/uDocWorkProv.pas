{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet,
  cxCurrencyEdit, cxContainer, cxTextEdit, StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxButtons, ExtCtrls, FIBQuery, pFIBQuery,
  pFIBStoredProc, ImgList, cxClasses, pFIBDataSet, FIBDatabase,
  pFIBDatabase, ibase, uResources, Resources_unitb, RxMemDS, Grids, DBGrids, Kernel,
  Menus, cxCheckBox, ToolWin, ComCtrls, ActnList, XPStyleActnCtrls,
  ActnMan, ActnCtrls, DogLoaderUnit, uMatasVars, uMatasUtils,
  cxGridBandedTableView, cxGridDBBandedTableView, cxMaskEdit, cxButtonEdit;

type
  TDocWorkProv = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
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
    PanelButtons: TPanel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    PanelDocInfo: TPanel;
    LabelTIPD: TLabel;
    LabelNumDoc: TLabel;
    cxNumDoc: TcxTextEdit;
    LabelDateDoc: TLabel;
    LabelSumma: TLabel;
    cxTotalSum: TcxCurrencyEdit;
    LabelOut: TLabel;
    LabelIn: TLabel;
    cxNameOut: TcxTextEdit;
    cxNameIn: TcxTextEdit;
    cxDateDoc: TcxTextEdit;
    cxTipDoc: TcxTextEdit;
    DocDataSet: TpFIBDataSet;
    DocDataSetNAME_IN: TStringField;
    DocDataSetNAME_OUT: TStringField;
    DocDataSource: TDataSource;
    StoredProc: TpFIBStoredProc;
    PubSchDataSet: TpFIBDataSet;
    WorkDataSet: TpFIBDataSet;
    ErrorDataSet: TpFIBDataSet;
    ErrorDataSetERROR_MESSAGE: TFIBStringField;
    ErrorDataSource: TDataSource;
    PanelProvs: TPanel;
    PosProvDataSet: TpFIBDataSet;
    PosProvDataSource: TDataSource;
    ProvItogDataSet: TpFIBDataSet;
    ProvItogDataSource: TDataSource;
    ProvItogDataSetDB_ID_SCH: TFIBBCDField;
    ProvItogDataSetDB_SCH_NUMBER: TFIBStringField;
    ProvItogDataSetKR_ID_SCH: TFIBBCDField;
    ProvItogDataSetKR_SCH_NUMBER: TFIBStringField;
    ProvItogDataSetSUM: TFIBBCDField;
    IstFinDataSet: TpFIBDataSet;
    IstFinDataSource: TDataSource;
    PosProvDataSetID_DOC: TFIBIntegerField;
    PosProvDataSetID_POS: TFIBIntegerField;
    PosProvDataSetID_NOMN: TFIBIntegerField;
    PosProvDataSetNAME: TFIBStringField;
    PosProvDataSetID_UNIT: TFIBIntegerField;
    PosProvDataSetUNIT: TFIBStringField;
    PosProvDataSetKOL_MAT: TFIBBCDField;
    PosProvDataSetKOL_DOC: TFIBBCDField;
    PosProvDataSetPRICE: TFIBBCDField;
    PosProvDataSetPOS_SUMMA: TFIBBCDField;
    PosProvDataSetID_OST: TFIBIntegerField;
    PosProvDataSetID_SCH: TFIBIntegerField;
    PosProvDataSetNAME_SCH: TFIBStringField;
    PosProvDataSetID_MARK: TFIBIntegerField;
    PosProvDataSetSCH_NUMBER: TFIBStringField;
    PosProvDataSetDB_ID_SCH: TFIBBCDField;
    PosProvDataSetDB_SCH_NUMBER: TFIBStringField;
    PosProvDataSetDB_SCH_TITLE: TFIBStringField;
    PosProvDataSetKR_ID_SCH: TFIBBCDField;
    PosProvDataSetKR_SCH_NUMBER: TFIBStringField;
    PosProvDataSetKR_SCH_TITLE: TFIBStringField;
    PosProvDataSetSUMMA: TFIBBCDField;
    PosProvDataSetIS_MAIN: TFIBIntegerField;
    PanelIstfin: TPanel;
    cxGridProv: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2DB_ID_SCH: TcxGridDBColumn;
    cxGridDBTableView2DB_SCH_NUMBER: TcxGridDBColumn;
    cxGridDBTableView2KR_ID_SCH: TcxGridDBColumn;
    cxGridDBTableView2KR_SCH_NUMBER: TcxGridDBColumn;
    cxGridDBTableView2SUM: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    PanelInfo: TPanel;
    cxGridIstfin: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    PanelTools: TPanel;
    PanelPosProv: TPanel;
    cxGridPos: TcxGrid;
    cxGridPosDBTableView1: TcxGridDBTableView;
    cxGridPosDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridPosDBTableView1ID_DOC: TcxGridDBColumn;
    cxGridPosDBTableView1ID_POS: TcxGridDBColumn;
    cxGridPosDBTableView1ID_NOMN: TcxGridDBColumn;
    cxGridPosDBTableView1NAME: TcxGridDBColumn;
    cxGridPosDBTableView1ID_UNIT: TcxGridDBColumn;
    cxGridPosDBTableView1UNIT: TcxGridDBColumn;
    cxGridPosDBTableView1KOL_MAT: TcxGridDBColumn;
    cxGridPosDBTableView1KOL_DOC: TcxGridDBColumn;
    cxGridPosDBTableView1PRICE: TcxGridDBColumn;
    cxGridPosDBTableView1SUMMA: TcxGridDBColumn;
    cxGridPosDBTableView1ID_OST: TcxGridDBColumn;
    cxGridPosDBTableView1ID_SCH: TcxGridDBColumn;
    cxGridPosDBTableView1NAME_SCH: TcxGridDBColumn;
    cxGridPosDBTableView1ID_MARK: TcxGridDBColumn;
    cxGridPosDBTableView1SCH_NUMBER: TcxGridDBColumn;
    cxGridPosLevel1: TcxGridLevel;
    PanelError: TPanel;
    cxGridError: TcxGrid;
    cxGridErrorDBTableView1: TcxGridDBTableView;
    cxGridErrorDBTableView1ERROR_MESSAGE: TcxGridDBColumn;
    cxGridErrorLevel1: TcxGridLevel;
    PanelErrButons: TPanel;
    cxCheckErrors: TcxCheckBox;
    cxCheckItogIstFin: TcxCheckBox;
    cxAddButton: TcxButton;
    cxEditButton: TcxButton;
    cxDelButton: TcxButton;
    Label1: TLabel;
    cxGridIstfinDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridIstfinDBBandedTableView1DB_SM_TITLE: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_SM_KOD: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_RZ_TITLE: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_RZ_KOD: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_ST_TITLE: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_ST_KOD: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_KEKV_TITLE: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_KEKV_KOD: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_REG_NUM: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_TIP_DOG: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_TIP_DOG_SHORT_NAME: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_TIP_DOG_NAME: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_N_DOG: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_DATE_DOG: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_SM_TITLE: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_SM_KOD: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_RZ_TITLE: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_RZ_KOD: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_ST_TITLE: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_ST_KOD: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_KEKV_TITLE: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_KEKV_KOD: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_REG_NUM: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_TIP_DOG: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_TIP_DOG_SHORT_NAME: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_TIP_DOG_NAME: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_N_DOG: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_DATE_DOG: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DB_ISTFIN: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1KR_ISTFIN: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1SUMMA: TcxGridDBBandedColumn;
    cxGridIstfinDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    WorkQuery: TpFIBQuery;
    cxFullSumma: TcxButtonEdit;
    PosProvDataSetID_PROV: TFIBBCDField;
    WorkTransaction: TpFIBTransaction;
    cxGridPosDBTableView2: TcxGridDBTableView;
    cxGridPosDBTableView2DB_ID_SM: TcxGridDBColumn;
    cxGridPosDBTableView2DB_SM_TITLE: TcxGridDBColumn;
    cxGridPosDBTableView2DB_SM_KOD: TcxGridDBColumn;
    cxGridPosDBTableView2DB_ID_RZ: TcxGridDBColumn;
    cxGridPosDBTableView2DB_RZ_TITLE: TcxGridDBColumn;
    cxGridPosDBTableView2DB_RZ_KOD: TcxGridDBColumn;
    cxGridPosDBTableView2DB_ID_ST: TcxGridDBColumn;
    cxGridPosDBTableView2DB_ST_TITLE: TcxGridDBColumn;
    cxGridPosDBTableView2DB_ST_KOD: TcxGridDBColumn;
    cxGridPosDBTableView2DB_ID_KEKV: TcxGridDBColumn;
    cxGridPosDBTableView2DB_KEKV_TITLE: TcxGridDBColumn;
    cxGridPosDBTableView2DB_KEKV_KOD: TcxGridDBColumn;
    cxGridPosDBTableView2DB_ID_DOG: TcxGridDBColumn;
    cxGridPosDBTableView2DB_KOD_DOG: TcxGridDBColumn;
    cxGridPosDBTableView2DB_REG_NUM: TcxGridDBColumn;
    cxGridPosDBTableView2DB_ID_TIP_DOG: TcxGridDBColumn;
    cxGridPosDBTableView2DB_TIP_DOG: TcxGridDBColumn;
    cxGridPosDBTableView2DB_TIP_DOG_SHORT_NAME: TcxGridDBColumn;
    cxGridPosDBTableView2DB_TIP_DOG_NAME: TcxGridDBColumn;
    cxGridPosDBTableView2DB_N_DOG: TcxGridDBColumn;
    cxGridPosDBTableView2DB_DATE_DOG: TcxGridDBColumn;
    cxGridPosDBTableView2KR_ID_SM: TcxGridDBColumn;
    cxGridPosDBTableView2KR_SM_TITLE: TcxGridDBColumn;
    cxGridPosDBTableView2KR_SM_KOD: TcxGridDBColumn;
    cxGridPosDBTableView2KR_ID_RZ: TcxGridDBColumn;
    cxGridPosDBTableView2KR_RZ_TITLE: TcxGridDBColumn;
    cxGridPosDBTableView2KR_RZ_KOD: TcxGridDBColumn;
    cxGridPosDBTableView2KR_ID_ST: TcxGridDBColumn;
    cxGridPosDBTableView2KR_ST_TITLE: TcxGridDBColumn;
    cxGridPosDBTableView2KR_ST_KOD: TcxGridDBColumn;
    cxGridPosDBTableView2KR_ID_KEKV: TcxGridDBColumn;
    cxGridPosDBTableView2KR_KEKV_TITLE: TcxGridDBColumn;
    cxGridPosDBTableView2KR_KEKV_KOD: TcxGridDBColumn;
    cxGridPosDBTableView2KR_ID_DOG: TcxGridDBColumn;
    cxGridPosDBTableView2KR_KOD_DOG: TcxGridDBColumn;
    cxGridPosDBTableView2KR_REG_NUM: TcxGridDBColumn;
    cxGridPosDBTableView2KR_ID_TIP_DOG: TcxGridDBColumn;
    cxGridPosDBTableView2KR_TIP_DOG: TcxGridDBColumn;
    cxGridPosDBTableView2KR_TIP_DOG_SHORT_NAME: TcxGridDBColumn;
    cxGridPosDBTableView2KR_TIP_DOG_NAME: TcxGridDBColumn;
    cxGridPosDBTableView2KR_N_DOG: TcxGridDBColumn;
    cxGridPosDBTableView2KR_DATE_DOG: TcxGridDBColumn;
    cxGridPosDBTableView2DB_ISTFIN: TcxGridDBColumn;
    cxGridPosDBTableView2KR_ISTFIN: TcxGridDBColumn;
    cxGridPosDBTableView2SUMMA: TcxGridDBColumn;
    cxGridPosDBTableView2ID_PROV: TcxGridDBColumn;
    cxShowErrors: TcxCheckBox;
    PosProvDataSetEXISTS_ERROR: TFIBIntegerField;
    cxGridPosDBTableView1Erorrs: TcxGridDBColumn;
    ErrorDataSetID_ERROR: TFIBIntegerField;
    PubSchDataSetID_SCH: TFIBIntegerField;
    PubSchDataSetSCH_TITLE: TFIBStringField;
    PubSchDataSetSCH_NUMBER: TFIBStringField;
    PubSchDataSetSCH_TYPE: TFIBIntegerField;
    PubSchDataSetLINK_TO: TFIBIntegerField;
    PubSchDataSetBAL_ID_SCH: TFIBIntegerField;
    PubSchDataSetBAL_SCH_NUMBER: TFIBStringField;
    PubSchDataSetBAL_SCH_TITLE: TFIBStringField;
    PubSchDataSetDATE_BEG: TFIBDateTimeField;
    PubSchDataSetDATE_END: TFIBDateTimeField;
    PubSchDataSetTYPE_OBJECT: TFIBIntegerField;
    PubSchDataSetSCH_OBJ_TYPE_TITLE: TFIBStringField;
    PubSchDataSetSCH_TYPE_TITLE: TFIBStringField;
    PubSchDataSetID_SYSTEM: TFIBIntegerField;
    PubSchDataSetSYSTEM_TEXT: TFIBStringField;
    PubSchDataSetKOD_SYSTEM: TFIBIntegerField;
    PubSchDataSetIS_BLOCKED: TFIBIntegerField;
    PubSchDataSetOPEN_SCH: TFIBDateField;
    PubSchDataSetID_REG_UCH: TFIBIntegerField;
    IstFinDataSetID_PROV: TFIBBCDField;
    IstFinDataSetDB_ID_SM: TFIBBCDField;
    IstFinDataSetDB_SM_TITLE: TFIBStringField;
    IstFinDataSetDB_SM_KOD: TFIBIntegerField;
    IstFinDataSetDB_ID_RZ: TFIBBCDField;
    IstFinDataSetDB_RZ_TITLE: TFIBStringField;
    IstFinDataSetDB_RZ_KOD: TFIBIntegerField;
    IstFinDataSetDB_ID_ST: TFIBBCDField;
    IstFinDataSetDB_ST_TITLE: TFIBStringField;
    IstFinDataSetDB_ST_KOD: TFIBIntegerField;
    IstFinDataSetDB_ID_KEKV: TFIBBCDField;
    IstFinDataSetDB_KEKV_TITLE: TFIBStringField;
    IstFinDataSetDB_KEKV_KOD: TFIBIntegerField;
    IstFinDataSetDB_ID_DOG: TFIBBCDField;
    IstFinDataSetDB_KOD_DOG: TFIBBCDField;
    IstFinDataSetDB_REG_NUM: TFIBStringField;
    IstFinDataSetDB_ID_TIP_DOG: TFIBBCDField;
    IstFinDataSetDB_TIP_DOG: TFIBStringField;
    IstFinDataSetDB_TIP_DOG_SHORT_NAME: TFIBStringField;
    IstFinDataSetDB_TIP_DOG_NAME: TFIBStringField;
    IstFinDataSetDB_N_DOG: TFIBStringField;
    IstFinDataSetDB_DATE_DOG: TFIBDateField;
    IstFinDataSetKR_ID_SM: TFIBBCDField;
    IstFinDataSetKR_SM_TITLE: TFIBStringField;
    IstFinDataSetKR_SM_KOD: TFIBIntegerField;
    IstFinDataSetKR_ID_RZ: TFIBBCDField;
    IstFinDataSetKR_RZ_TITLE: TFIBStringField;
    IstFinDataSetKR_RZ_KOD: TFIBIntegerField;
    IstFinDataSetKR_ID_ST: TFIBBCDField;
    IstFinDataSetKR_ST_TITLE: TFIBStringField;
    IstFinDataSetKR_ST_KOD: TFIBIntegerField;
    IstFinDataSetKR_ID_KEKV: TFIBBCDField;
    IstFinDataSetKR_KEKV_TITLE: TFIBStringField;
    IstFinDataSetKR_KEKV_KOD: TFIBIntegerField;
    IstFinDataSetKR_ID_DOG: TFIBBCDField;
    IstFinDataSetKR_KOD_DOG: TFIBBCDField;
    IstFinDataSetKR_REG_NUM: TFIBStringField;
    IstFinDataSetKR_ID_TIP_DOG: TFIBBCDField;
    IstFinDataSetKR_TIP_DOG: TFIBStringField;
    IstFinDataSetKR_TIP_DOG_SHORT_NAME: TFIBStringField;
    IstFinDataSetKR_TIP_DOG_NAME: TFIBStringField;
    IstFinDataSetKR_N_DOG: TFIBStringField;
    IstFinDataSetKR_DATE_DOG: TFIBDateField;
    IstFinDataSetDB_ISTFIN: TFIBStringField;
    IstFinDataSetKR_ISTFIN: TFIBStringField;
    IstFinDataSetSUMMA: TFIBBCDField;
    IstFinDataSetID_ISTFIN: TFIBIntegerField;
    DocDataSetID_DOC: TFIBBCDField;
    DocDataSetID_TIPD: TFIBBCDField;
    DocDataSetTIPD: TFIBStringField;
    DocDataSetNAME_TIPD: TFIBStringField;
    DocDataSetKOD_DOC: TFIBSmallIntField;
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
    DocDataSetOKPO_CUSTOMER: TFIBStringField;
    DocDataSetSUMMA: TFIBBCDField;
    DocDataSetID_MAN: TFIBBCDField;
    DocDataSetFIO_MAN: TFIBStringField;
    DocDataSetSFIO_MAN: TFIBStringField;
    DocDataSetDOV_NUM: TFIBStringField;
    DocDataSetDOV_DATE: TFIBDateField;
    DocDataSetDATE_REC: TFIBDateField;
    DocDataSetPERIOD: TFIBStringField;
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
    DocDataSetDOC_NOTE: TFIBStringField;
    DocDataSetINV_KART_MODE: TFIBIntegerField;
    DocDataSetMNA_KART_MODE: TFIBIntegerField;
    DocDataSetIKOL_MAT: TFIBBCDField;
    DocDataSetIKOL_DOC: TFIBBCDField;
    DocDataSetCOUNT_POS: TFIBIntegerField;
    DocDataSetPUB_ID_USER: TFIBBCDField;
    DocDataSetPUB_USER_NAME: TFIBStringField;
    DocDataSetPUB_USER_FULL_NAME: TFIBStringField;
    DocDataSetPUB_COMPUTER: TFIBStringField;
    DocDataSetPUB_DATETIME: TFIBDateTimeField;
    DocDataSetSUMMA_DOC: TFIBBCDField;
    ActionListProv: TActionList;
    acAddProv: TAction;
    acEditProv: TAction;
    acDelProv: TAction;
    acSaveProv: TAction;
    acClose: TAction;
    acSetFocus: TAction;
    PopupMenu1: TPopupMenu;
    acAddProv1: TMenuItem;
    acEditProv1: TMenuItem;
    acDelProv1: TMenuItem;
    N1: TMenuItem;
    acClose1: TMenuItem;
    RxMemoryData: TRxMemoryData;
    DataSource: TDataSource;
    DataSetProba: TpFIBDataSet;
    Zapros: TpFIBDataSet;
    DS_Proverka: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure DocDataSetCalcFields(DataSet: TDataSet);
    procedure cxGridPosDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCheckErrorsPropertiesChange(Sender: TObject);
    procedure cxCheckItogIstFinPropertiesChange(Sender: TObject);
    procedure cxFullSummaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGridIstfinEnter(Sender: TObject);
    procedure cxGridPosEnter(Sender: TObject);
    procedure cxGridProvEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridPosDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxShowErrorsPropertiesChange(Sender: TObject);
    procedure PosProvDataSetAfterScroll(DataSet: TDataSet);
    procedure acCloseExecute(Sender: TObject);
    procedure acAddProvExecute(Sender: TObject);
    procedure acEditProvExecute(Sender: TObject);
    procedure acDelProvExecute(Sender: TObject);
    procedure acSaveProvExecute(Sender: TObject);
    procedure acSetFocusExecute(Sender: TObject);
  private
    DBHandle: TISC_DB_HANDLE;
  public
    WORK_MODE: integer;
    PUB_ID_DOC: int64;
    ID_DOC, ID_OPER: integer;
    DATE_DOC: TDateTime;
    PERIOD: TDateTime;
    USE_DOG: integer;
    FULL_SUMMA: Extended;
    ActiveGrid: string;
    KEY_SESSION: int64;
    CLEAR_BUFFERS: boolean;
    SUMM_BY_DOG: Extended;
    n_st, is_istfin:Integer;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; ID_DOC: integer; DATE_DOC: TDateTime; ID_OPER: integer; WORK_PERIOD: TDateTime; aWorkMode: integer);overload;
  end;

 procedure WorkDoc(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER: int64; aID_DOC: integer; aDATE_DOC: TDateTime; aID_OPER: integer; aWORK_PERIOD: TDateTime; aWorkMode: integer);stdcall;
 exports WorkDoc;

var
  DocWorkProv: TDocWorkProv;

implementation

uses uDocWaitWindow, uDocWorkPosEditForm, uDocWorkSplash, uDocWorkProvEditForm, uDocWorkProvSelTip, uDocWorkShProvEditForm, uDocWorkBudgetEditForm, uDocWorkSchKekv;
{$R *.dfm}

procedure WorkDoc(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER: int64; aID_DOC: integer; aDATE_DOC: TDateTime; aID_OPER: integer; aWORK_PERIOD: TDateTime; aWorkMode: integer);stdcall;
var
 fprov: TDocWorkProv;
begin
 fprov := TDocWorkProv.Create(aOwner, aDBHANDLE, aID_USER, aID_DOC, aDATE_DOC, aID_OPER, aWORK_PERIOD, aWorkMode);
 fprov.FormStyle:=fsNormal;
 fprov.ShowModal;
 fprov.Free;
end;

constructor TDocWorkProv.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; ID_DOC: integer; DATE_DOC: TDateTime; ID_OPER: integer; WORK_PERIOD: TDateTime; aWorkMode: integer);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
 end;
 Self.WORK_MODE:=aWorkMode;
 Self.ID_DOC:=ID_DOC;
 Self.DATE_DOC:=DATE_DOC;
 Self.ID_OPER:=ID_OPER;
 Self.PERIOD:=WORK_PERIOD;
 Self.ActiveGrid:='';
 Self.CLEAR_BUFFERS:=_CLEAR_BUFFERS_AFTER_SAVE;
end;


procedure TDocWorkProv.FormCreate(Sender: TObject);
var
 wait: TWaitForm;
begin
 PUB_ID_DOC:=0;
 wait:=TWaitForm.Create(self);
 wait.Show;
 wait.Update;

 try
   StoredProc.Close;
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName:='MAT_DT_DOC_PROV_PREPARE';
   StoredProc.Prepare;
   StoredProc.ParamByName('P_ID_DOC').Value:=ID_DOC;
   StoredProc.ParamByName('P_ID_OPER').Value:=ID_OPER;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    wait.Free;
    exit;
   end;
 end;
 Caption:=MAT_SYS_PREFIX+MAT_DOC_STR_WORK_DOC_CAP;
 cxAddButton.Caption:=MAT_ACTION_ADD_CONST;
 cxEditButton.Caption:=MAT_ACTION_UPDATE_CONST;
 cxDelButton.Caption:=MAT_ACTION_DELETE_CONST;
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 // DocDataSet.ParamByName('DATE_BEG').Value:=DATE_DOC;
 // DocDataSet.ParamByName('DATE_END').Value:=DATE_DOC;
 DocDataSet.ParamByName('ID_DOC').Value:=ID_DOC;
 DocDataSet.CloseOpen(True);
 PubSchDataSet.ParamByName('P_DATE').Value:=_MATAS_PERIOD;
 PubSchDataSet.CloseOpen(true);
 cxTipDoc.Text:=DocDataSetTIPD.AsString;
 cxNumDoc.Text:=DocDataSetNUM_DOC.AsString;
 cxDateDoc.Text:=DocDataSetDATE_DOC.AsString;
 cxNameOut.Text:=DocDataSetNAME_OUT.AsString;
 cxNameIn.Text:=DocDataSetNAME_IN.AsString;
 cxTotalSum.Text:=DocDataSetSUMMA.AsString;
 PosProvDataSet.ParamByName('PID_DOC').Value:=ID_DOC;
 PosProvDataSet.ParamByName('PKEY_SESSION').AsInt64:=KEY_SESSION;
 PosProvDataSet.CloseOpen(false);
 ProvItogDataSet.ParamByName('PID_DOC').Value:=ID_DOC;
 ProvItogDataSet.CloseOpen(false);
 IstFinDataSet.ParamByName('PID_DOC').Value:=ID_DOC;
 IstFinDataSet.ParamByName('FLAG').Value:=0;
 IstFinDataSet.CloseOpen(false);
 if DocDataSetSUMMA_DOC.IsNull then
  FULL_SUMMA:=0.00
 else
  FULL_SUMMA:=DocDataSetSUMMA_DOC.AsFloat;
 cxFullSumma.Text:=FloatToStr(FULL_SUMMA);
 Caption:=Caption+ ' :: '+cxTipDoc.Text+' '+cxNumDoc.Text+' від '+cxDateDoc.Text;
 SUMM_BY_DOG:=0;

 ds_proverka.Close;
 ds_proverka.SelectSQL.Text:='select IS_CHANGE_ISTFIN from MAT_SP_OPER_BASE where id_oper='+IntToSTr(ID_OPER);
 ds_proverka.CloseOpen(False);

 if ds_proverka.FieldByName('IS_CHANGE_ISTFIN').AsInteger = 1 then
 begin
 is_istfin:=ds_proverka.FieldByName('IS_CHANGE_ISTFIN').AsInteger;
 cxAddButton.Enabled:=False;
 cxEditButton.Enabled:=False;
 cxDelButton.Enabled:=False;
 end;
 ds_proverka.close;
 wait.Free;
end;

procedure TDocWorkProv.DocDataSetCalcFields(DataSet: TDataSet);
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

procedure TDocWorkProv.cxGridPosDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
 begin
  acEditProvExecute(Self);
 end;
end;

procedure TDocWorkProv.cxCheckErrorsPropertiesChange(Sender: TObject);
begin
 if not cxCheckErrors.Checked then
 begin
  PanelIstfin.Visible:=true;
  PanelError.Visible:=false;
  cxCheckErrors.Visible:=false;
  cxShowErrors.Checked:=false;
 end;
end;

procedure TDocWorkProv.cxCheckItogIstFinPropertiesChange(Sender: TObject);
begin
 if cxCheckItogIstFin.Checked then
  begin
   IstFinDataSet.ParamByName('FLAG').Value:=1;
   IstFinDataSet.CloseOpen(false);
  end
 else
  begin
  IstFinDataSet.ParamByName('FLAG').Value:=0;
  IstFinDataSet.CloseOpen(false);
  end
end;

procedure TDocWorkProv.cxFullSummaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 summa: double;
 flag: boolean;
begin
 flag:=false;
 summa:=FULL_SUMMA;
 summa:=GetSumma(self, summa, flag);
 if not flag then begin
 try
  WorkQuery.Transaction := WorkTransaction;
  WorkQuery.Transaction.StartTransaction;
  WorkQuery.Close;
  WorkQuery.SQL.Clear;
  WorkQuery.SQL.Add('UPDATE MAT_DT_DOC SET summa_doc=:SUMMA');
  WorkQuery.SQL.Add(' WHERE ID_DOC='+IntToStr(ID_DOC));
  WorkQuery.Prepare;
  WorkQuery.ParamByName('SUMMA').Value:=summa;
  WorkQuery.Prepare;
  WorkQuery.ExecQuery;
  WorkQuery.Transaction.Commit;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      WorkQuery.Transaction.Rollback;
     end;
   end;
  cxFullSumma.Text:=FloatToStr(summa);
  cxFullSumma.EditValue:=summa;
  FULL_SUMMA:=summa;
 end;
end;

procedure TDocWorkProv.cxGridIstfinEnter(Sender: TObject);
begin
 ActiveGrid:=cxGridIstfin.Name;
end;

procedure TDocWorkProv.cxGridPosEnter(Sender: TObject);
begin
 ActiveGrid:=cxGridPos.Name;
end;

procedure TDocWorkProv.cxGridProvEnter(Sender: TObject);
begin
 ActiveGrid:=cxGridProv.Name;
end;

procedure TDocWorkProv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 // удаляем все проводки в буфферах
 try
  WorkQuery.Transaction := WriteTransaction;
  WorkQuery.Transaction.StartTransaction;
  WorkQuery.Close;
  WorkQuery.SQL.Clear;
  WorkQuery.SQL.Add('DELETE FROM MAT_DT_DOC_PROV_INTF');
  WorkQuery.SQL.Add(' WHERE ID_DOC=:ID_DOC');
  WorkQuery.Prepare;
  WorkQuery.ParamByName('ID_DOC').Value:=ID_DOC;
  WorkQuery.Prepare;
  WorkQuery.ExecQuery;
  WorkQuery.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   WorkQuery.Transaction.Rollback;
  end;
 end;

 if CLEAR_BUFFERS then begin
  try
   WorkQuery.Transaction := WriteTransaction;
   WorkQuery.Transaction.StartTransaction;
   WorkQuery.Close;
   WorkQuery.SQL.Clear;
   WorkQuery.SQL.Add('EXECUTE PROCEDURE KERNEL_CLEAR_TMP(:KEY_SESSION)');
   WorkQuery.Prepare;
   WorkQuery.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
   WorkQuery.Prepare;
   WorkQuery.ExecProc;
   WorkQuery.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkQuery.Transaction.Rollback;
   end;
  end;
 end;

 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TDocWorkProv.cxGridPosDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if (AViewInfo.GridRecord.Values[0] = 1)  then
  begin
      ACanvas.Canvas.Font.Color := clRed;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TDocWorkProv.cxShowErrorsPropertiesChange(Sender: TObject);
begin
 if cxShowErrors.Checked then
 begin
  PanelIstfin.Visible:=false;
  PanelError.Visible:=true;
  cxCheckErrors.Visible:=true;
  cxCheckErrors.Checked:=true;
 end
 else begin
  PanelIstfin.Visible:=true;
  PanelError.Visible:=false;
  cxCheckErrors.Visible:=false;
  cxCheckErrors.Checked:=false;
 end
end;

procedure TDocWorkProv.PosProvDataSetAfterScroll(DataSet: TDataSet);
begin
  ErrorDataSet.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
  ErrorDataSet.ParamByName('ID_DOC').Value:=ID_DOC;
  ErrorDataSet.ParamByName('ID_POS').Value:=PosProvDataSetID_POS.AsInteger;
  ErrorDataSet.ParamByName('ID_PROV').AsInt64:=PosProvDataSetID_PROV.AsInt64;
  ErrorDataSet.CloseOpen(true);
end;

procedure TDocWorkProv.acCloseExecute(Sender: TObject);
begin
 if WORK_MODE=3 then
 begin
  try
   WorkQuery.Transaction := WriteTransaction;
   WorkQuery.Transaction.StartTransaction;
   WorkQuery.Close;
   WorkQuery.SQL.Clear;
   WorkQuery.SQL.Add('DELETE FROM MAT_DT_DOC');
   WorkQuery.SQL.Add(' WHERE ID_DOC=:ID_DOC');
   WorkQuery.Prepare;
   WorkQuery.ParamByName('ID_DOC').Value:=ID_DOC;
   WorkQuery.Prepare;
   WorkQuery.ExecQuery;
   WorkQuery.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkQuery.Transaction.Rollback;
   end;
  end;
  try
   WorkQuery.Transaction := WriteTransaction;
   WorkQuery.Transaction.StartTransaction;
   WorkQuery.Close;
   WorkQuery.SQL.Clear;
   WorkQuery.SQL.Add('DELETE FROM MAT_DT_DOC_POS');
   WorkQuery.SQL.Add(' WHERE ID_DOC=:ID_DOC');
   WorkQuery.Prepare;
   WorkQuery.ParamByName('ID_DOC').Value:=ID_DOC;
   WorkQuery.Prepare;
   WorkQuery.ExecQuery;
   WorkQuery.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkQuery.Transaction.Rollback;
   end;
  end;
 end;
 Close;
end;

procedure TDocWorkProv.acAddProvExecute(Sender: TObject);
var
 pform: TDocWorkShProvEditForm;
 bform: TDocWorkBudgetEditForm;
 probform:TDocWorkSchKekvForm;
 tip: integer;
 ftip: TDocWorkProvSelTipForm;
 ID_USER : Int64;
 input : TDogInput;
 dog_filter: TDogFilter;
 dog_pos: TDogLocateInfo;
 res   : TDogResult;
 cur_summa: double;
 s: string;
 i: integer;
 Vals: array of variant;
 dog_summa: double;
 flag: boolean;
 wait: TWaitForm;
 TMP_ID_SM, TMP_ID_RZ, TMP_ID_ST, TMP_ID_KEKV: integer;
 sch:string;
 kol,j:Integer;
 razdel, smeta, stat, kekv: Variant;
 summa_1:Double;
begin
 ftip:=TDocWorkProvSelTipForm.Create(self);
 if ftip.ShowModal=mrOk then
  tip:=ftip.TIP_ISTFIN
 else
  tip:=-1;
 ftip.Free;

 if is_istfin=1 then tip:=0;

 if tip=0 then
 begin
  pform:=TDocWorkShProvEditForm.Create(self);
  pform.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK+' :: '+MAT_STR_MODE_ADD;
  pform.DBHANDLE:=WorkDatabase.Handle;
  // заполняем значения по умолчанию
  if _USE_DEFAULT_SMETA=1 then begin
   pform.DB_ID_SM:=_DEFAULT_ID_SM;
   pform.DB_ID_RZ:=_DEFAULT_ID_RZ;
   pform.DB_ID_ST:=_DEFAULT_ID_ST;
   pform.KR_ID_SM:=_DEFAULT_ID_SM;
   pform.KR_ID_RZ:=_DEFAULT_ID_RZ;
   pform.KR_ID_ST:=_DEFAULT_ID_ST;
   pform.cxDbSmeta.Text:=IntToStr(_DEFAULT_SM_KOD);
   pform.cxDBRazdel.Text:=IntToStr(_DEFAULT_RZ_KOD);
   pform.cxDBStatya.Text:=IntToStr(_DEFAULT_ST_KOD);
   pform.cxKRSmeta.Text:=IntToStr(_DEFAULT_SM_KOD);
   pform.cxKRRazdel.Text:=IntToStr(_DEFAULT_RZ_KOD);
   pform.cxKRStatya.Text:=IntToStr(_DEFAULT_ST_KOD);
  end;
  if _USE_DEFAULT_KEKV=1 then begin
   pform.cxDBKEKV.Text:=IntToStr(_DEFAULT_KEKV_KOD);
   pform.cxKRKEKV.Text:=IntToStr(_DEFAULT_KEKV_KOD);
   pform.DB_ID_KEKV:=_DEFAULT_ID_KEKV;
   pform.KR_ID_KEKV:=_DEFAULT_ID_KEKV;
  end;
  if pform.ShowModal=mrOk then
  begin
   Refresh;
   wait:=TWaitForm.Create(self);
   wait.Show;
   wait.Update;
  { PROCEDURE MAT_DT_DOC_PROV_INTF_ADD_EX(
0    PID_DOC NUMERIC(10,0),
1    PDB_ID_SCH NUMERIC(10,0),
2    PDB_ID_SM NUMERIC(10,0),
3    PDB_ID_RZ NUMERIC(10,0),
4    PDB_ID_ST NUMERIC(10,0),
5    PDB_ID_KEKV NUMERIC(10,0),
6    PDB_ID_DOG NUMERIC(16,0),
7    PDB_KOD_DOG NUMERIC(16,0),
8    PKR_ID_SCH NUMERIC(10,0),
9    PKR_ID_SM NUMERIC(10,0),
0    PKR_ID_RZ NUMERIC(10,0),
1    PKR_ID_ST NUMERIC(10,0),
2    PKR_ID_KEKV NUMERIC(10,0),
3    PKR_ID_DOG NUMERIC(16,0),
4    PKR_KOD_DOG NUMERIC(16,0),
5    PSUMMA NUMERIC(16,2))
}
    SetLength(Vals, 16);
    Vals[0]  := ID_DOC;
    Vals[1]  := pform.DB_ID_SCH;
    Vals[2]  := pform.DB_ID_SM;
    Vals[3]  := pform.DB_ID_RZ;
    Vals[4]  := pform.DB_ID_ST;
    Vals[5]  := pform.DB_ID_KEKV;
    Vals[6]  := pform.DB_ID_DOG;
    Vals[7]  := pform.DB_KOD_DOG;
    Vals[8]  := pform.KR_ID_SCH;
    Vals[9]  := pform.KR_ID_SM;
    Vals[10] := pform.KR_ID_RZ;
    Vals[11] := pform.KR_ID_ST;
    Vals[12] := pform.KR_ID_KEKV;
    Vals[13] := pform.KR_ID_DOG;
    Vals[14] := pform.KR_KOD_DOG;
    Vals[15] := pform.cxSumma.Value;
    try
     StoredProc.Close;
     StoredProc.Transaction := WriteTransaction;
     StoredProc.Transaction.StartTransaction;
     StoredProc.StoredProcName:='MAT_DT_DOC_PROV_INTF_ADD_EX';
     StoredProc.Prepare;
     StoredProc.ExecProcedure('MAT_DT_DOC_PROV_INTF_ADD_EX', vals);
     StoredProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
     end;
    end;
   PosProvDataSet.CloseOpen(false);
   ProvItogDataSet.CloseOpen(false);
   IstFinDataSet.CloseOpen(false);
   wait.Free;
  end;
  pform.Free;
 end;

 if tip=2 then
 begin
  bform:=TDocWorkBudgetEditForm.Create(self);
  bform.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK+' :: '+MAT_STR_MODE_ADD;
  bform.DBHANDLE:=WorkDatabase.Handle;
  if DocDataSetSUMMA_DOC.AsFloat=0 then
   bform.cxSumma.EditValue:=DocDataSetSUMMA.AsFloat
  else
   bform.cxSumma.EditValue:=DocDataSetSUMMA_DOC.AsFloat;
  if bform.ShowModal=mrOk then
  begin
   Refresh;
   wait:=TWaitForm.Create(self);
   wait.Show;
   wait.Update;
   SetLength(Vals, 10);
   Vals[0]  := ID_DOC;
   Vals[1]  := 0;
   Vals[2]  := bform.ID_SM;
   Vals[3]  := bform.ID_RZ;
   Vals[4]  := bform.ID_ST;
   Vals[5]  := bform.ID_KEKV;
   Vals[6]  := 0;
   Vals[7]  := 0;
   Vals[8]  := bform.cxSumma.EditValue;
   Vals[9]  := bform.cxSumma.EditValue;
   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_DT_DOC_PROV_INTF_ADD';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_DT_DOC_PROV_INTF_ADD', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
     end;
   end;
   PosProvDataSet.CloseOpen(false);
   ProvItogDataSet.CloseOpen(false);
   IstFinDataSet.CloseOpen(false);
   wait.Free;
  end;
  bform.Free;
 end;

 if tip=1 then
 begin
  flag:=false;
  cur_summa:=GetSumma(self, FULL_SUMMA-SUMM_BY_DOG, flag);
  if flag then exit;
  // добавляем Договор
  ID_USER:=ID_USER;
//  LoadSysData(ReadTransaction);
  SYS_ID_USER:=_CURRENT_USER_ID;
  input            := SYS_DEFAULT_DOG_INPUT;
  input.Owner      := self;
  input.DBHandle   := DBHandle;
  input.ReadTrans  := ReadTransaction.Handle;
  input.WriteTrans := WriteTransaction.Handle;
  input.FormStyle  := fsNormal;
  input.isZayav    := false;
  input.id_Group_add := _GROUP_DOG_ADD_COMMON;
  input.id_Group   := _GROUP_DOG_SEL_COMMON;
  input.Summa := cur_summa;
  with dog_pos do
  begin
   summa:=cur_summa;
   name_customer:=DocDataSetNAME_CUSTOMER.AsString;
  end;

  with dog_filter do
  begin

   bUseFilter :=true;      // Применен ли фильтр
   bShowFilterForm:=false; // отображать ли форму фильтрации при открытии договоров
   //  RegNum     : string;       // Фильтр по рег. номеру
   bRegNum    :=false;      // Применять ли фильтр по рег. номеру
   SummaFrom  :=cur_summa;     // Фильтр по сумме
   SummaTo    :=cur_summa;     // Фильтр по сумме
   bSumma     :=false;      // Применять ли фильтр по сумме
   //  DateBeg    : TDate;        // Фильтр по дате
   //  DateEnd    : TDAte;        // Фильтр по дате
   bDate      := false;      // Применять ли фильтр по дате
   //  DateBeg    := Date;        // Фильтр по дате
   //  DateEnd    := Date;        // Фильтр по дате
   ShowClosed := 0;      // Отображать закрытые
   NameCust   :='';       // Фильтр по названию контрагента
   bNameCust  :=false;      // Применять ли фильтр по названию контрагента
   id_cust    := DocDataSetID_CUST.AsInt64;      // Фильтр по идентификатору контрагента
   bID_Cust   := true;      // Применять ли фильтр по идентификатору контрагента
   NameTipDog :='';       // Значение названия типа договора
   id_tip_dog :=0;      // Фильтр по типу договора
   bTipdog    :=false;      // Применять ли фильтр по типу договора
  end;
  input.filter:=dog_filter;
  input.lInfo:=dog_pos;

  res := ShowDogMain(input);
  if res.ModalResult=mrOk then
  begin
   Refresh;
   wait:=TWaitForm.Create(self);
   wait.Show;
   wait.Update;
  {
0    PID_DOC NUMERIC(10,0),
1    PID_POS NUMERIC(10,0),
2    PID_SM NUMERIC(10,0),
3    PID_RZ NUMERIC(10,0),
4    PID_ST NUMERIC(10,0),
5    PID_KEKV NUMERIC(10,0),
6    PID_DOG NUMERIC(16,0),
7    PKOD_DOG NUMERIC(16,0),
8    PISUMMA NUMERIC(16,2),
9    PSUMMA NUMERIC(16,2)
}

{
  s:='SMETA:';
  for i:=0 to High(res.Smets) do
   s:=s+'['+IntToStr(res.Smets[i].NumSmeta)
       +'/'+IntToStr(res.Smets[i].NumRazd)
       +'/'+IntToStr(res.Smets[i].NumStat)+']='+
       FloatToStr(res.Smets[i].Summa)+'/'+FloatToStr(res.Smets[i].NSumma)+chr(13)+chr(10);

  ShowMessage('kod_dog='+VarToStr(res.kod_dog)+chr(13)+chr(10)+
              'id_dog='+VarToStr(res.id_dog)+chr(13)+chr(10)+
              'id_tip_dog='+VarToStr(res.id_tip_dog)+chr(13)+chr(10)+
              'name_tip_dog='+VarToStr(res.name_tip_dog)+chr(13)+chr(10)+
              'n_dog='+VarToStr(res.n_dog)+chr(13)+chr(10)+
              'd_dog='+VarToStr(res.d_dog)+chr(13)+chr(10)+
              'id_customer='+VarToStr(res.id_customer)+chr(13)+chr(10)+
              'name_customer='+VarToStr(res.name_customer)+chr(13)+chr(10)+
              'summa='+VarToStr(res.summa)+chr(13)+chr(10)+
              'dog_note='+VarToStr(res.dog_note)+chr(13)+chr(10)+s);
}
 //сюда!!
 if  High(res.Smets) > 0 then
  begin
  if agMessageDlg(MAT_STR_WARNING, 'Бажаєте автоматично додати джерела фінансування?', mtConfirmation, [mbYes, mbNo]) = ID_NO then
  begin
//  RXMemoryData.ClearFields;
  RXMemoryData.Close;
  RxMemoryData.FieldDefs.Clear;
  RxMemoryData.FieldDefs.Add('ID_SCH', ftInteger, 0, True);
  RxMemoryData.FieldDefs.Add('SCH_TITLE', ftSTRING, 20, True);
  RxMemoryData.FieldDefs.Add('SCH_NUMBER', ftstring, 20, True);
  for i:=0 to High(res.Smets) do
  begin
  //  showmessage(inttostr(res.Smets[i].NumStat)+' '+inttostr(_NDS_ST));
   Zapros.Close;
   Zapros.SQLs.SelectSQL.Clear;
   Zapros.SQLs.SelectSQL.Add('SELECT RAZD_ST_NUM FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST = :ST');
   Zapros.ParamByName('ST').AsInt64:= res.Smets[i].NumStat;
   Zapros.Open;
   n_st:=Zapros['RAZD_ST_NUM'];
//   showmessage(inttostr(n_st)+' '+inttostr(_NDS_ST));
  if  n_st<>_NDS_ST then
    RxMemoryData.FieldDefs.Add('R_'+VarToStr(res.Smets[i].NumRazd)+'_Sm_'+VarToStr(res.Smets[i].NumSmeta)+'_St_'+VarToStr(res.Smets[i].NumStat)+'_Kekv_'+VarToStr(res.Smets[i].NumKekv), ftInteger, 0, True);
  end;
 //RxMemoryData.FieldDefs.Add('Kekv_'+VarToStr(res.Smets[i].NumKekv), ftInteger, 0, True);

  PosProvDataSet.Open;
  RXMemoryData.Open;
 while not PosProvDataSet.Eof do
  begin
  if not RxMemoryData.Locate('SCH_NUMBER', PosProvDataSet['DB_SCH_NUMBER'],[loCaseInsensitive]) then
   begin
    RxMemoryData.Append;
    rxMemoryData.FieldByName('SCH_NUMBER').AsString:= PosProvDataSet['DB_SCH_NUMBER'];
    RxMemoryData.FieldByName('SCH_TITLE').AsString:=PosProvDataSet['DB_SCH_TITLE'];
    RxMemoryData.FieldByName('ID_SCH').value:=PosProvDataSet['DB_ID_SCH'];
    for i:=0 to High(res.Smets) do
    begin
    Zapros.Close;
    Zapros.SQLs.SelectSQL.Clear;
    Zapros.SQLs.SelectSQL.Add('SELECT RAZD_ST_NUM FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST = :ST');
    Zapros.ParamByName('ST').AsInt64:= res.Smets[i].NumStat;
    Zapros.Open;
    n_st:=Zapros['RAZD_ST_NUM'];
    if  n_st<>_NDS_ST then
     RxMemoryData.FieldByName('R_'+VarToStr(res.Smets[i].NumRazd)+'_Sm_'+VarToStr(res.Smets[i].NumSmeta)+'_St_'+VarToStr(res.Smets[i].NumStat)+'_Kekv_'+VarToStr(res.Smets[i].NumKekv)).value:=0;
     end;
     RxMemoryData.Post;
   end;
   PosProvDataSet.Next;
  end;

 probform:=TDocWorkSchKekvForm.Create(self);
 probform.ID_SCH.DataBinding.FieldName:='ID_SCH';
 probform.SCH_TITLE.DataBinding.FieldName:='SCH_TITLE';
 probform.SCH_NUMBER.DataBinding.FieldName:='SCH_NUMBER';
 for i:=0 to High(res.Smets) do
  begin
    Zapros.Close;
    Zapros.SQLs.SelectSQL.Clear;
    Zapros.SQLs.SelectSQL.Add('SELECT RAZD_ST_NUM FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST = :ST');
    Zapros.ParamByName('ST').AsInt64:= res.Smets[i].NumStat;
    Zapros.Open;
    n_st:=Zapros['RAZD_ST_NUM'];
  if  n_st<>_NDS_ST then
   begin
   Zapros.Close;
   Zapros.SQLs.SelectSQL.Clear;
   Zapros.SQLs.SelectSQL.Add('SELECT RAZD_ST_NUM FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST = :RAZD');
   Zapros.ParamByName('RAZD').AsInt64:= res.Smets[i].NumRazd;
   Zapros.Open;
   razdel:=Zapros['RAZD_ST_NUM'];

   Zapros.Close;
   Zapros.SQLs.SelectSQL.Clear;
   Zapros.SQLs.SelectSQL.Add('SELECT SMETA_KOD FROM PUB_SPR_SMETA WHERE ID_SMETA = :SMETA');
   Zapros.ParamByName('SMETA').AsInt64:= res.Smets[i].NumSmeta;
   Zapros.Open;
   smeta:=Zapros['SMETA_KOD'];

    Zapros.Close;
    Zapros.SQLs.SelectSQL.Clear;
    Zapros.SQLs.SelectSQL.Add('SELECT KEKV_KODE FROM PUB_SPR_KEKV WHERE ID_KEKV = :KEKV');
    Zapros.ParamByName('KEKV').AsInt64:= res.Smets[i].NumKekv;
    Zapros.Open;
    kekv:=Zapros['KEKV_KODE'];

   probform.cxGridPosDBTableView1.Columns[i+3].Caption:= VarToStr(smeta)+ '/'+ VarToStr(razdel) + '/' + IntToStr(n_st)+'/'+VarToStr(kekv);
   probform.cxGridPosDBTableView1.Columns[i+3].DataBinding.FieldName:= 'R_'+VarToStr(res.Smets[i].NumRazd)+'_Sm_'+VarToStr(res.Smets[i].NumSmeta)+'_St_'+VarToStr(res.Smets[i].NumStat)+'_Kekv_'+VarToStr(res.Smets[i].NumKekv);
   probform.cxGridPosDBTableView1.Columns[i+3].Visible:=True;
   end;
  end;

 probform.ShowModal;
 if probform.ModalResult = mrOk then
  begin
   for i:=0 to High(res.Smets) do
   begin
    Zapros.Close;
    Zapros.SQLs.SelectSQL.Clear;
    Zapros.SQLs.SelectSQL.Add('SELECT RAZD_ST_NUM FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST = :ST');
    Zapros.ParamByName('ST').AsInt64:= res.Smets[i].NumStat;
    Zapros.Open;
    n_st:=Zapros['RAZD_ST_NUM'];
    if  n_st=_NDS_ST then
    begin
     SetLength(Vals, 10);
     Vals[0]  := ID_DOC;
     Vals[1]  := 0;
     Vals[2]  := VarToStr(res.Smets[i].NumSmeta);
     Vals[3]  := VarToStr(res.Smets[i].NumRazd);
     Vals[4]  := VarToStr(res.Smets[i].NumStat);
     Vals[5]  := VarToStr(res.Smets[i].NumKekv);
     Vals[6]  := VarToStr(res.id_dog);
     Vals[7]  := VarToStr(res.kod_dog);
     Vals[8]  := cur_summa;
     Vals[9]  := VarToStr(res.Smets[i].NSumma);
     try
     
      StoredProc.Close;
      StoredProc.Transaction := WriteTransaction;
      StoredProc.Transaction.StartTransaction;
      StoredProc.StoredProcName:='MAT_DT_DOC_PROV_INTF_ADD';
      StoredProc.Prepare;
      StoredProc.ExecProcedure('MAT_DT_DOC_PROV_INTF_ADD', vals);
      StoredProc.Transaction.Commit;
      SUMM_BY_DOG:=SUMM_BY_DOG+res.Smets[i].NSumma;
     except on E : Exception
     do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
        end;
     end;
     end;
   end;
   //
   RXMemoryData.Open;
   RXMemoryData.first;
   summa_1:=0;
   while not RXMemoryData.Eof do
    begin
     for i:=0 to High(res.Smets) do
      begin
      Zapros.Close;
      Zapros.SQLs.SelectSQL.Clear;
      Zapros.SQLs.SelectSQL.Add('SELECT RAZD_ST_NUM FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST = :ST');
      Zapros.ParamByName('ST').AsInt64:= res.Smets[i].NumStat;
      Zapros.Open;
      n_st:=Zapros['RAZD_ST_NUM'];
       if  n_st<>_NDS_ST then
       if  RXMemoryData.FieldByName('R_'+VarToStr(res.Smets[i].NumRazd)+'_Sm_'+VarToStr(res.Smets[i].NumSmeta)+'_St_'+VarToStr(res.Smets[i].NumStat)+'_Kekv_'+VarToStr(res.Smets[i].NumKekv)).value = 1 then
        begin

         summa_1  :=summa_1+ StrToFloat(VarToStr(res.Smets[i].NSumma));

        end;
        end;
  //  RXMemoryData.Post;
     RXMemoryData.Next;
    end;
   //
    //showmessage(FloatToStr(summa_1));
   RXMemoryData.Open;
   RXMemoryData.first;
   while not RXMemoryData.Eof do
    begin
     for i:=0 to High(res.Smets) do
      begin
      Zapros.Close;
      Zapros.SQLs.SelectSQL.Clear;
      Zapros.SQLs.SelectSQL.Add('SELECT RAZD_ST_NUM FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST = :ST');
      Zapros.ParamByName('ST').AsInt64:= res.Smets[i].NumStat;
      Zapros.Open;
      n_st:=Zapros['RAZD_ST_NUM'];
       if  n_st<>_NDS_ST then
       if  RXMemoryData.FieldByName('R_'+VarToStr(res.Smets[i].NumRazd)+'_Sm_'+VarToStr(res.Smets[i].NumSmeta)+'_St_'+VarToStr(res.Smets[i].NumStat)+'_Kekv_'+VarToStr(res.Smets[i].NumKekv)).value = 1 then
        begin
         SetLength(Vals, 11);
         Vals[0]  := ID_DOC;
         Vals[1]  := 0;
         Vals[2]  := VarToStr(res.Smets[i].NumSmeta);
         Vals[3]  := VarToStr(res.Smets[i].NumRazd);
         Vals[4]  := VarToStr(res.Smets[i].NumStat);
         Vals[5]  := VarToStr(res.Smets[i].NumKekv);
         Vals[6]  := VarToStr(res.id_dog);
         Vals[7]  := VarToStr(res.kod_dog);
         Vals[8]  := cur_summa;
        //Vals[8]  :=summa_1;
         Vals[9]  := VarToStr(res.Smets[i].NSumma);
         Vals[10] := RxMemoryData.FieldByName('ID_SCH').value;
         try
          StoredProc.Close;
          StoredProc.Transaction := WriteTransaction;
          StoredProc.Transaction.StartTransaction;
          StoredProc.StoredProcName:='MAT_DT_DOC_PROV_INTF_ADD_2';
          StoredProc.Prepare;
          StoredProc.ExecProcedure('MAT_DT_DOC_PROV_INTF_ADD_2', vals);
          StoredProc.Transaction.Commit;
          SUMM_BY_DOG:=SUMM_BY_DOG+res.Smets[i].NSumma;
          except on E : Exception
           do begin
           ShowMessage(E.Message);
           StoredProc.Transaction.Rollback;
              end;
         end;
        end;
        end;
  //  RXMemoryData.Post;
     RXMemoryData.Next;
    end;
  end;
//  else RXMemoryData.ClearFields;

  end
  else
    begin
      for i:=0 to High(res.Smets) do
  begin
   SetLength(Vals, 10);
   Vals[0]  := ID_DOC;
   Vals[1]  := 0;
   Vals[2]  := VarToStr(res.Smets[i].NumSmeta);
   Vals[3]  := VarToStr(res.Smets[i].NumRazd);
   Vals[4]  := VarToStr(res.Smets[i].NumStat);
   Vals[5]  := VarToStr(res.Smets[i].NumKekv);
   Vals[6]  := VarToStr(res.id_dog);
   Vals[7]  := VarToStr(res.kod_dog);
   Vals[8]  := cur_summa;
   Vals[9]  := VarToStr(res.Smets[i].NSumma);
        
   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_DT_DOC_PROV_INTF_ADD';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_DT_DOC_PROV_INTF_ADD', vals);
{    StoredProc.ParamByName('PID_DOC').AsInt64:=ID_DOC;
    StoredProc.ParamByName('PID_POS').AsInt64:=0;
    StoredProc.ParamByName('PID_SM').AsString:=VarToStr(res.Smets[i].NumSmeta);
    StoredProc.ParamByName('PID_RZ').AsString:=VarToStr(res.Smets[i].NumRazd);
    StoredProc.ParamByName('PID_ST').AsString:=VarToStr(res.Smets[i].NumStat);
    StoredProc.ParamByName('PID_KEKV').AsString:=VarToStr(res.Smets[i].NumKekv);
    StoredProc.ParamByName('PID_DOG').AsString:=VarToStr(res.id_dog);
    StoredProc.ParamByName('PKOD_DOG').AsString:=VarToStr(res.kod_dog);
    StoredProc.ParamByName('PISUMMA').Value:=cur_summa;
    StoredProc.ParamByName('PSUMMA').Value:=VarToStr(res.Smets[i].NSumma);
    StoredProc.ExecProc;
}
    StoredProc.Transaction.Commit;
    SUMM_BY_DOG:=SUMM_BY_DOG+res.Smets[i].NSumma;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
     end;
   end;
  //   ShowMessage('добавлена '+inttostr(i)+' из' +inttostr(High(res.Smets))+' сумма'+floattostr(res.Smets[i].NSumma));
  end;
    end;
 end
else
 begin
  for i:=0 to High(res.Smets) do
  begin
   SetLength(Vals, 10);
   Vals[0]  := ID_DOC;
   Vals[1]  := 0;
   Vals[2]  := VarToStr(res.Smets[i].NumSmeta);
   Vals[3]  := VarToStr(res.Smets[i].NumRazd);
   Vals[4]  := VarToStr(res.Smets[i].NumStat);
   Vals[5]  := VarToStr(res.Smets[i].NumKekv);
   Vals[6]  := VarToStr(res.id_dog);
   Vals[7]  := VarToStr(res.kod_dog);
   Vals[8]  := cur_summa;
   Vals[9]  := VarToStr(res.Smets[i].NSumma);

   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_DT_DOC_PROV_INTF_ADD';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_DT_DOC_PROV_INTF_ADD', vals);
{    StoredProc.ParamByName('PID_DOC').AsInt64:=ID_DOC;
    StoredProc.ParamByName('PID_POS').AsInt64:=0;
    StoredProc.ParamByName('PID_SM').AsString:=VarToStr(res.Smets[i].NumSmeta);
    StoredProc.ParamByName('PID_RZ').AsString:=VarToStr(res.Smets[i].NumRazd);
    StoredProc.ParamByName('PID_ST').AsString:=VarToStr(res.Smets[i].NumStat);
    StoredProc.ParamByName('PID_KEKV').AsString:=VarToStr(res.Smets[i].NumKekv);
    StoredProc.ParamByName('PID_DOG').AsString:=VarToStr(res.id_dog);
    StoredProc.ParamByName('PKOD_DOG').AsString:=VarToStr(res.kod_dog);
    StoredProc.ParamByName('PISUMMA').Value:=cur_summa;
    StoredProc.ParamByName('PSUMMA').Value:=VarToStr(res.Smets[i].NSumma);
    StoredProc.ExecProc;
}
    StoredProc.Transaction.Commit;
    SUMM_BY_DOG:=SUMM_BY_DOG+res.Smets[i].NSumma;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
     end;
   end;
  //   ShowMessage('добавлена '+inttostr(i)+' из' +inttostr(High(res.Smets))+' сумма'+floattostr(res.Smets[i].NSumma));
  end;
end;
  if FULL_SUMMA<=SUMM_BY_DOG then
  begin
   // проверяем округления по позициям
   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_DT_DOC_PROV_INTF_ROUND_POS';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_DT_DOC_PROV_INTF_ROUND_POS', [ID_DOC]);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
     end;
   end;

{   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_DT_DOC_PROV_INTF_ROUND_DOG';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_DT_DOC_PROV_INTF_ROUND_POS', [ID_DOC]);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
     end;
   end;
}
  end;

  // проверяем округления по договорам
{  for i:=0 to High(res.Smets) do
  begin
   SetLength(Vals, 8);
   Vals[0]  := ID_DOC;
   Vals[1]  := IntToStr(res.Smets[i].NumSmeta);
   Vals[2]  := IntToStr(res.Smets[i].NumRazd);
   Vals[3]  := IntToStr(res.Smets[i].NumStat);
   Vals[4]  := IntToStr(res.Smets[i].NumKekv);
   Vals[5]  := IntToStr(res.id_dog);
   Vals[6]  := IntToStr(res.kod_dog);
   Vals[7]  := res.Smets[i].NSumma;
   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_DT_DOC_PROV_INTF_ROUND_DOG';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_DT_DOC_PROV_INTF_ROUND_DOG', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
     end;
   end;
  end;
}
  PosProvDataSet.CloseOpen(false);
  ProvItogDataSet.CloseOpen(false);
  IstFinDataSet.CloseOpen(false);
  wait.Free;
 end;
{

 TShablonInputData = record //Используеться для передачи параметров ао умолчанию в шаблоны
  bUse     : Boolean;  //использовать ли присланные параметры
  num      : string;   //номер договора
  date_dog : TDate;    //дата договора
  note     : string;   //основание договора(Отображаеться в реестре внизу)
  summa    : currency; //сумма договора(Отображаеться в реестре внизу)
  id_rate_account    : Integer; //ид-р счета контрагента
  id_rate_acc_native : Integer; //ид-р собственного счета
 end;

 TDogFilter = record         // Используеться для фильтрации
  bUseFilter : boolean;      // Применен ли фильтр
  bShowFilterForm : boolean; // отображать ли форму фильтрации при открытии договоров
  RegNum     : string;       // Фильтр по рег. номеру
  bRegNum    : boolean;      // Применять ли фильтр по рег. номеру
  SummaFrom  : currency;     // Фильтр по сумме
  SummaTo    : currency;     // Фильтр по сумме
  bSumma     : boolean;      // Применять ли фильтр по сумме
  DateBeg    : TDate;        // Фильтр по дате
  DateEnd    : TDAte;        // Фильтр по дате
  bDate      : boolean;      // Применять ли фильтр по дате
  ShowClosed : integer;      // Отображать закрытые
  NameCust   : string;       // Фильтр по названию контрагента
  bNameCust  : boolean;      // Применять ли фильтр по названию контрагента
  id_cust    : integer;      // Фильтр по идентификатору контрагента
  bID_Cust   : boolean;      // Применять ли фильтр по идентификатору контрагента
  NameTipDog : string;       // Значение названия типа договора
  id_tip_dog : integer;      // Фильтр по типу договора
  bTipdog    : boolean;      // Применять ли фильтр по типу договора
 end;

 TDogInput = record             // Запись используеться для передачи входящих параметров
  Owner      : TComponent;      // Родительская форма
  DBHandle   : TISC_DB_HANDLE;  // Хэндл БД
  WriteTrans : TISC_TR_HANDLE;  // Хэндл пишущей транзакции
  ReadTrans  : TISC_TR_HANDLE;  // Хэндл читающей транзакции
  FormStyle  : TFormStyle;      // Стиль формы
  isZayav    : boolean;         // Справочник вызываеться как реестр заявок к оплате
  FormCaption : string;         // Заголофок формы договоров
  //--------------------------
  Summa       : Currency;       // Сумма передаваемая для разбивки
  id_TypeDog  : integer;        // Не используеться
  id_Group    : integer;        // ID группы которые пользователь сможет добавлять;
  id_Group_add: integer;        // ID группы которые пользователь сможет видеть;
  id_Customer : integer;        // Не используеться
  MFO         : string;         // Не используеться
  RateAcc     : string;         // Не используеться
  DateSys     : TDate;          // Не используеться
  NumDoc      : string;         // Не используеться
  DateDoc     : TDate;          // Не используеться
  id_dog      : integer;        // Не используеться
  id_doc      : integer;        // Идентификатор который игнорируетьс при расчете суммы оплаты по ALL_PROV
  lInfo       : TDogLocateInfo; // Используеться для позиционирования
  filter      : TDogFilter;     // Используеться для фильтрации
  columns     : TDogColumns;    // Колонки которые необходимо отображать
 end;

 TDogLocateInfo = record // Информация для позиционирования
  summa : Variant; // По сумме
  name_customer : Variant; // По низванию контрагента
  rate_acc : Variant; // По р/р
 end;

 TDogSmeta = record
  NumSmeta : integer;
  NumRazd  : integer;
  NumStat  : integer;
  NumKekv  : integer;
  id_people: integer;
  Summa    : currency;
  NSumma   : currency;
  tn       : string[20];
  kod_payer: string[20];
 end;

 TDogResult = record
  ModalResult     : integer;
  kod_dog         : Variant;
  id_dog          : Variant;
  id_tip_dog      : Variant;
  name_tip_dog    : Variant;
  n_dog           : Variant;
  d_dog           : Variant;
  nomn_dog        : Variant;
  nomd_dog        : Variant;
  id_customer     : Variant;
  name_customer   : Variant;
  id_rate_acc     : Variant;
  rate_acc        : Variant;
  mfo             : Variant;
  bank            : Variant;
  id_rate_acc_nat : Variant;
  date_beg        : Variant;
  date_end        : Variant;
  summa           : Variant;
  continue        : Variant;
  not_summa       : Variant;
  close           : Variant;
  dog_note        : Variant;
  fio_donnu       : Variant;
  fio_postav      : Variant;
  krit_date       : Variant;
  nds_sum         : Variant;
  nds_pay         : Variant;
  sum_fulfil      : Variant;
  sum_pay         : Variant;
  sum_today       : Variant;
  before_pay      : Variant;
  before_prcn     : Variant;
  regest_num      : Variant;
  comment         : Variant;
  name_shablon    : Variant;
  id_bl_account   : int64;
  Smets           : array of TDogSmeta;
  handle          : THandle;
 end;

}
 end;
end;

procedure TDocWorkProv.acEditProvExecute(Sender: TObject);
var
 pform: TDocWorkProvEditForm;
 sform: TDocWorkShProvEditForm;
 ID_POS: integer;
 ID_PROV: int64;
 Vals: array of variant;
begin
 if PosProvDataSetIS_MAIN.Value=1 then
 begin
  pform:=TDocWorkProvEditForm.Create(self);
  pform.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK+' :: '+'Редактирование';
  pform.DBHANDLE:=WorkDatabase.Handle;
  ID_POS:=PosProvDataSet.FieldByName('ID_POS').AsInteger;
  pform.cxName.Text:=PosProvDataSet.FieldByName('NAME').AsString;
  pform.cxKolMat.EditValue:=PosProvDataSet.FieldByName('KOL_MAT').AsFloat;
  pform.cxKolDoc.EditValue:=PosProvDataSet.FieldByName('KOL_DOC').AsFloat;
  pform.cxPrice.EditValue:=PosProvDataSet.FieldByName('PRICE').AsFloat;
  pform.cxSumma.EditValue:=IstFinDataSet.FieldByName('SUMMA').AsFloat;
  pform.cxUnit.Text:=PosProvDataSet.FieldByName('UNIT').AsString;
  pform.DB_ID_SCH:=PosProvDataSet.FieldByName('DB_ID_SCH').AsInteger;
  pform.cxNameDbSch.Text:=PosProvDataSet.FieldByName('DB_SCH_NUMBER').AsString;
  pform.KR_ID_SCH:=PosProvDataSet.FieldByName('KR_ID_SCH').AsInteger;
  pform.cxNameKrSch.Text:=PosProvDataSet.FieldByName('KR_SCH_NUMBER').AsString;
  pform.DB_ID_DOG:=IstFinDataSetDB_ID_DOG.AsInt64;
  pform.DB_KOD_DOG:=IstFinDataSetDB_KOD_DOG.AsInt64;
  pform.DB_ID_SM:=IstFinDataSet.FieldByName('DB_ID_SM').AsInteger;
  pform.DB_ID_RZ:=IstFinDataSet.FieldByName('DB_ID_RZ').AsInteger;
  pform.DB_ID_ST:=IstFinDataSet.FieldByName('DB_ID_ST').AsInteger;
  pform.DB_ID_KEKV:=IstFinDataSet.FieldByName('DB_ID_KEKV').AsInteger;
  pform.KR_ID_SM:=IstFinDataSet.FieldByName('KR_ID_SM').AsInteger;
  pform.KR_ID_RZ:=IstFinDataSet.FieldByName('KR_ID_RZ').AsInteger;
  pform.KR_ID_ST:=IstFinDataSet.FieldByName('KR_ID_ST').AsInteger;
  pform.KR_ID_KEKV:=IstFinDataSet.FieldByName('KR_ID_KEKV').AsInteger;
  pform.KR_ID_DOG:=IstFinDataSetKR_ID_DOG.AsInt64;
  pform.KR_KOD_DOG:=IstFinDataSetKR_KOD_DOG.AsInt64;
  pform.cxDbSmeta.Text:=IstFinDataSet.FieldByName('DB_SM_KOD').AsString;
  pform.cxDBRazdel.Text:=IstFinDataSet.FieldByName('DB_RZ_KOD').AsString;
  pform.cxDBStatya.Text:=IstFinDataSet.FieldByName('DB_ST_KOD').AsString;
  pform.cxDBKEKV.Text:=IstFinDataSet.FieldByName('DB_KEKV_KOD').AsString;
  pform.cxKRSmeta.Text:=IstFinDataSet.FieldByName('KR_SM_KOD').AsString;
  pform.cxKRRazdel.Text:=IstFinDataSet.FieldByName('KR_RZ_KOD').AsString;
  pform.cxKRStatya.Text:=IstFinDataSet.FieldByName('KR_ST_KOD').AsString;
  pform.cxKRKEKV.Text:=IstFinDataSet.FieldByName('KR_KEKV_KOD').AsString;
  if pform.ShowModal=mrOk then
  begin
   ID_PROV:=IstFinDataSetID_PROV.AsInt64;
{
CREATE PROCEDURE MAT_DT_DOC_PROV_INTF_EDIT_EX(
0    PID_DOC NUMERIC(10,0),
1    PID_PROV NUMERIC(16,0),
2    PDB_ID_SCH NUMERIC(10,0),
3    PDB_ID_SM NUMERIC(10,0),
4    PDB_ID_RZ NUMERIC(10,0),
5    PDB_ID_ST NUMERIC(10,0),
6    PDB_ID_KEKV NUMERIC(10,0),
7    PDB_ID_DOG NUMERIC(16,0),
8    PDB_KOD_DOG NUMERIC(16,0),
9    PKR_ID_SCH NUMERIC(10,0),
0    PKR_ID_SM NUMERIC(10,0),
1    PKR_ID_RZ NUMERIC(10,0),
2    PKR_ID_ST NUMERIC(10,0),
3    PKR_ID_KEKV NUMERIC(10,0),
4    PKR_ID_DOG NUMERIC(16,0),
5    PKR_KOD_DOG NUMERIC(16,0),
6    PSUMMA NUMERIC(16,2))
}
    SetLength(Vals, 26);
    Vals[0]  := ID_DOC;
    Vals[1]  := IntToStr(ID_PROV);
    Vals[2]  := pform.DB_ID_SCH;
    Vals[3]  := pform.DB_ID_SM;
    Vals[4]  := pform.DB_ID_RZ;
    Vals[5]  := pform.DB_ID_ST;
    Vals[6]  := pform.DB_ID_KEKV;
    Vals[7]  := IntToStr(pform.DB_ID_DOG);
    Vals[8]  := IntToStr(pform.DB_KOD_DOG);
    Vals[9]  := pform.KR_ID_SCH;
    Vals[10] := pform.KR_ID_SM;
    Vals[11] := pform.KR_ID_RZ;
    Vals[12] := pform.KR_ID_ST;
    Vals[13] := pform.KR_ID_KEKV;
    Vals[14] := IntToStr(pform.KR_ID_DOG);
    Vals[15] := IntToStr(pform.KR_KOD_DOG);
    Vals[16] := pform.cxSumma.Value;
    if pform.IS_FACED then
     Vals[17] := IntToStr(pform.FACED_ID_PROV)
    else
     Vals[17] := 0;
    if cxCheckItogIstFin.checked=true then Vals[17]  := 2;

    Vals[18]  := IstFinDataSet.FieldByName('DB_ID_SM').AsInteger;
    Vals[19]  := IstFinDataSet.FieldByName('DB_ID_RZ').AsInteger;
    Vals[20]  := IstFinDataSet.FieldByName('DB_ID_ST').AsInteger;
    Vals[21]  := IstFinDataSet.FieldByName('DB_ID_KEKV').AsInteger;
    Vals[22]  := IstFinDataSet.FieldByName('KR_ID_SM').AsInteger;
    Vals[23]  := IstFinDataSet.FieldByName('KR_ID_RZ').AsInteger;
    Vals[24] := IstFinDataSet.FieldByName('KR_ID_ST').AsInteger;
    Vals[25] := IstFinDataSet.FieldByName('KR_ID_KEKV').AsInteger;

     try
     StoredProc.Close;
     StoredProc.Transaction := WriteTransaction;
     StoredProc.Transaction.StartTransaction;
     StoredProc.StoredProcName:='MAT_DT_DOC_PROV_INTF_EDIT_EX';
     StoredProc.Prepare;
     StoredProc.ExecProcedure('MAT_DT_DOC_PROV_INTF_EDIT_EX', vals);
     StoredProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
     end;
    end;
   PosProvDataSet.CloseOpen(false);
   ProvItogDataSet.CloseOpen(false);
   IstFinDataSet.CloseOpen(false);
   PosProvDataSet.Locate('ID_POS',ID_POS,[]);
  end;
  pform.Free;
 end
 else
 begin
  ID_PROV:=PosProvDataSetID_PROV.AsInt64;
  sform:=TDocWorkShProvEditForm.Create(self);
  sform.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK+'  : :  '+'Редагування';
  sform.DBHANDLE:=WorkDatabase.Handle;
  sform.DB_ID_SCH:=PosProvDataSet.FieldByName('DB_ID_SCH').AsInteger;
  sform.cxNameDbSch.Text:=PosProvDataSet.FieldByName('DB_SCH_NUMBER').AsString;
  sform.KR_ID_SCH:=PosProvDataSet.FieldByName('KR_ID_SCH').AsInteger;
  sform.cxNameKrSch.Text:=PosProvDataSet.FieldByName('KR_SCH_NUMBER').AsString;
  sform.cxSumma.EditValue:=PosProvDataSet.FieldByName('SUMMA').AsFloat;
  sform.DB_ID_DOG:=IstFinDataSetDB_ID_DOG.AsInt64;
  sform.DB_KOD_DOG:=IstFinDataSetDB_KOD_DOG.AsInt64;
  sform.DB_ID_SM:=IstFinDataSet.FieldByName('DB_ID_SM').AsInteger;
  sform.DB_ID_RZ:=IstFinDataSet.FieldByName('DB_ID_RZ').AsInteger;
  sform.DB_ID_ST:=IstFinDataSet.FieldByName('DB_ID_ST').AsInteger;
  sform.DB_ID_KEKV:=IstFinDataSet.FieldByName('DB_ID_KEKV').AsInteger;
  sform.KR_ID_DOG:=IstFinDataSetKR_ID_DOG.AsInt64;
  sform.KR_KOD_DOG:=IstFinDataSetKR_KOD_DOG.AsInt64;
  sform.KR_ID_SM:=IstFinDataSet.FieldByName('KR_ID_SM').AsInteger;
  sform.KR_ID_RZ:=IstFinDataSet.FieldByName('KR_ID_RZ').AsInteger;
  sform.KR_ID_ST:=IstFinDataSet.FieldByName('KR_ID_ST').AsInteger;
  sform.KR_ID_KEKV:=IstFinDataSet.FieldByName('KR_ID_KEKV').AsInteger;
  sform.cxDbSmeta.Text:=IstFinDataSet.FieldByName('DB_SM_KOD').AsString;
  sform.cxDBRazdel.Text:=IstFinDataSet.FieldByName('DB_RZ_KOD').AsString;
  sform.cxDBStatya.Text:=IstFinDataSet.FieldByName('DB_ST_KOD').AsString;
  sform.cxDBKEKV.Text:=IstFinDataSet.FieldByName('DB_KEKV_KOD').AsString;
  sform.cxKRSmeta.Text:=IstFinDataSet.FieldByName('KR_SM_KOD').AsString;
  sform.cxKRRazdel.Text:=IstFinDataSet.FieldByName('KR_RZ_KOD').AsString;
  sform.cxKRStatya.Text:=IstFinDataSet.FieldByName('KR_ST_KOD').AsString;
  sform.cxKRKEKV.Text:=IstFinDataSet.FieldByName('KR_KEKV_KOD').AsString;
  if sform.ShowModal=mrOk then
  begin
{
CREATE PROCEDURE MAT_DT_DOC_PROV_INTF_EDIT_EX(
0    PID_DOC NUMERIC(10,0),
1    PID_PROV NUMERIC(16,0),
2    PDB_ID_SCH NUMERIC(10,0),
3    PDB_ID_SM NUMERIC(10,0),
4    PDB_ID_RZ NUMERIC(10,0),
5    PDB_ID_ST NUMERIC(10,0),
6    PDB_ID_KEKV NUMERIC(10,0),
7    PDB_ID_DOG NUMERIC(16,0),
8    PDB_KOD_DOG NUMERIC(16,0),
9    PKR_ID_SCH NUMERIC(10,0),
0    PKR_ID_SM NUMERIC(10,0),
1    PKR_ID_RZ NUMERIC(10,0),
2    PKR_ID_ST NUMERIC(10,0),
3    PKR_ID_KEKV NUMERIC(10,0),
4    PKR_ID_DOG NUMERIC(16,0),
5    PKR_KOD_DOG NUMERIC(16,0),
6    PSUMMA NUMERIC(16,2))
}
    SetLength(Vals, 26);
    Vals[0]  := ID_DOC;
    Vals[1]  := IntToStr(ID_PROV);
    Vals[2]  := sform.DB_ID_SCH;
    Vals[3]  := sform.DB_ID_SM;
    Vals[4]  := sform.DB_ID_RZ;
    Vals[5]  := sform.DB_ID_ST;
    Vals[6]  := sform.DB_ID_KEKV;
    Vals[7]  := IntToStr(sform.DB_ID_DOG);
    Vals[8]  := IntToStr(sform.DB_KOD_DOG);
    Vals[9]  := sform.KR_ID_SCH;
    Vals[10] := sform.KR_ID_SM;
    Vals[11] := sform.KR_ID_RZ;
    Vals[12] := sform.KR_ID_ST;
    Vals[13] := sform.KR_ID_KEKV;
    Vals[14] := IntToStr(sform.KR_ID_DOG);
    Vals[15] := IntToStr(sform.KR_KOD_DOG);
    Vals[16] := sform.cxSumma.Value;
    Vals[17] := 0;
    if cxCheckItogIstFin.checked=true then Vals[17]  := 2;

    Vals[18]  := IstFinDataSet.FieldByName('DB_ID_SM').AsInteger;
    Vals[19]  := IstFinDataSet.FieldByName('DB_ID_RZ').AsInteger;
    Vals[20]  := IstFinDataSet.FieldByName('DB_ID_ST').AsInteger;
    Vals[21]  := IstFinDataSet.FieldByName('DB_ID_KEKV').AsInteger;
    Vals[22]  := IstFinDataSet.FieldByName('KR_ID_SM').AsInteger;
    Vals[23]  := IstFinDataSet.FieldByName('KR_ID_RZ').AsInteger;
    Vals[24] := IstFinDataSet.FieldByName('KR_ID_ST').AsInteger;
    Vals[25] := IstFinDataSet.FieldByName('KR_ID_KEKV').AsInteger;
    try
     StoredProc.Close;
     StoredProc.Transaction := WriteTransaction;
     StoredProc.Transaction.StartTransaction;
     StoredProc.StoredProcName:='MAT_DT_DOC_PROV_INTF_EDIT_EX';
     StoredProc.Prepare;
     StoredProc.ExecProcedure('MAT_DT_DOC_PROV_INTF_EDIT_EX', vals);
     StoredProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
     end;
    end;
   PosProvDataSet.CloseOpen(false);
   ProvItogDataSet.CloseOpen(false);
   IstFinDataSet.CloseOpen(false);
   PosProvDataSet.Locate('ID_PROV',ID_PROV,[]);
  end;
  sform.Free;
 end;
end;

procedure TDocWorkProv.acDelProvExecute(Sender: TObject);
var
 id_prov: int64;
begin
 if ActiveGrid=cxGridPos.Name then
 begin
  if PosProvDataSetIS_MAIN.Value=1 then
  begin
   ShowMessage(MAT_DOC_STR_WORK_DOC_MSG5);
   exit;
  end;
  if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES
  then begin
   id_prov:=PosProvDataSetID_PROV.AsInt64;
   try
    WorkQuery.Transaction := WriteTransaction;
    WorkQuery.Transaction.StartTransaction;
    WorkQuery.Close;
    WorkQuery.SQL.Clear;
    WorkQuery.SQL.Add('DELETE FROM MAT_DT_DOC_PROV_INTF');
    WorkQuery.SQL.Add(' WHERE ID_PROV=:ID_PROV');
    WorkQuery.Prepare;
    WorkQuery.ParamByName('ID_PROV').AsInt64:=id_prov;
    WorkQuery.Prepare;
    WorkQuery.ExecQuery;
    WorkQuery.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkQuery.Transaction.Rollback;
    end;
   end;
   PosProvDataSet.CloseOpen(false);
   ProvItogDataSet.CloseOpen(false);
   IstFinDataSet.CloseOpen(false);
  end;
 end;
 if ActiveGrid=cxGridIstfin.Name then
 begin
  if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES
  then begin
   try
    WorkQuery.Transaction := WriteTransaction;
    WorkQuery.Transaction.StartTransaction;
    WorkQuery.Close;
    WorkQuery.SQL.Clear;
    WorkQuery.SQL.Add('UPDATE MAT_DT_DOC_PROV_INTF SET ');
    WorkQuery.SQL.Add('DB_ID_SM=0, DB_ID_RZ=0, DB_ID_ST=0, DB_ID_KEKV=0, ');
    WorkQuery.SQL.Add('DB_ID_DOG=0, DB_KOD_DOG=0,');
    WorkQuery.SQL.Add('KR_ID_SM=0, KR_ID_RZ=0, KR_ID_ST=0, KR_ID_KEKV=0, ');
    WorkQuery.SQL.Add('KR_ID_DOG=0, KR_KOD_DOG=0 ');
    if cxCheckItogIstFin.Checked then
     begin
      WorkQuery.SQL.Add('WHERE ID_DOC=:ID_DOC');
      if not IstFinDataSetDB_ID_SM.IsNull then
       WorkQuery.SQL.Add('AND DB_ID_SM=:DB_ID_SM ');
      if not IstFinDataSetDB_ID_RZ.IsNull then
       WorkQuery.SQL.Add('AND DB_ID_RZ=:DB_ID_RZ');
      if not IstFinDataSetDB_ID_ST.IsNull then
       WorkQuery.SQL.Add('AND DB_ID_ST=:DB_ID_ST');
      if not IstFinDataSetDB_ID_KEKV.IsNull then
       WorkQuery.SQL.Add('AND DB_ID_KEKV=:DB_ID_KEKV');
      if not IstFinDataSetDB_ID_DOG.IsNull then
       WorkQuery.SQL.Add('AND DB_ID_DOG=:DB_ID_DOG');
      if not IstFinDataSetDB_KOD_DOG.IsNull then
       WorkQuery.SQL.Add('AND DB_KOD_DOG=:DB_KOD_DOG');
      if not IstFinDataSetKR_ID_SM.IsNull then
       WorkQuery.SQL.Add('AND KR_ID_SM=:KR_ID_SM');
      if not IstFinDataSetKR_ID_RZ.IsNull then
       WorkQuery.SQL.Add('AND KR_ID_RZ=:KR_ID_RZ');
      if not IstFinDataSetKR_ID_ST.IsNull then
       WorkQuery.SQL.Add('AND KR_ID_ST=:KR_ID_ST');
      if not IstFinDataSetKR_ID_KEKV.IsNull then
       WorkQuery.SQL.Add('AND KR_ID_KEKV=:KR_ID_KEKV');
      if not IstFinDataSetKR_ID_DOG.IsNull then
       WorkQuery.SQL.Add('AND KR_ID_DOG=:KR_ID_DOG');
      if not IstFinDataSetKR_KOD_DOG.IsNull then
       WorkQuery.SQL.Add('AND KR_KOD_DOG=:KR_KOD_DOG');
      WorkQuery.Prepare;
      WorkQuery.ParamByName('ID_DOC').Value:=ID_DOC;
      if not IstFinDataSetDB_ID_SM.IsNull then
       WorkQuery.ParamByName('DB_ID_SM').Value:=IstFinDataSetDB_ID_SM.AsInteger;
      if not IstFinDataSetKR_ID_RZ.IsNull then
       WorkQuery.ParamByName('DB_ID_RZ').Value:=IstFinDataSetDB_ID_RZ.AsInteger;
      if not IstFinDataSetKR_ID_ST.IsNull then
       WorkQuery.ParamByName('DB_ID_ST').Value:=IstFinDataSetDB_ID_ST.AsInteger;
      if not IstFinDataSetKR_ID_KEKV.IsNull then
       WorkQuery.ParamByName('DB_ID_KEKV').Value:=IstFinDataSetDB_ID_KEKV.AsInteger;
      if not IstFinDataSetKR_ID_DOG.IsNull then
       WorkQuery.ParamByName('DB_ID_DOG').Value:=IstFinDataSetDB_ID_DOG.AsInteger;
      if not IstFinDataSetKR_KOD_DOG.IsNull then
       WorkQuery.ParamByName('DB_KOD_DOG').Value:=IstFinDataSetDB_KOD_DOG.AsInteger;
      if not IstFinDataSetKR_ID_SM.IsNull then
       WorkQuery.ParamByName('KR_ID_SM').Value:=IstFinDataSetKR_ID_SM.AsInteger;
      if not IstFinDataSetKR_ID_RZ.IsNull then
       WorkQuery.ParamByName('KR_ID_RZ').Value:=IstFinDataSetKR_ID_RZ.AsInteger;
      if not IstFinDataSetKR_ID_ST.IsNull then
       WorkQuery.ParamByName('KR_ID_ST').Value:=IstFinDataSetKR_ID_ST.AsInteger;
      if not IstFinDataSetKR_ID_KEKV.IsNull then
       WorkQuery.ParamByName('KR_ID_KEKV').Value:=IstFinDataSetKR_ID_KEKV.AsInteger;
      if not IstFinDataSetKR_ID_DOG.IsNull then
       WorkQuery.ParamByName('KR_ID_DOG').Value:=IstFinDataSetKR_ID_DOG.AsInteger;
      if not IstFinDataSetKR_KOD_DOG.IsNull then
       WorkQuery.ParamByName('KR_KOD_DOG').Value:=IstFinDataSetKR_KOD_DOG.AsInteger;
     end
    else
     begin
      WorkQuery.SQL.Add('WHERE ID_PROV=:ID_PROV');
      WorkQuery.Prepare;
      WorkQuery.ParamByName('ID_PROV').AsInt64:=IstFinDataSetID_PROV.AsInt64;
     end;
    WorkQuery.ExecQuery;
    WorkQuery.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkQuery.Transaction.Rollback;
    end;
   end;
   IstFinDataSet.CloseOpen(false);
  end;
 end
end;

procedure TDocWorkProv.acSaveProvExecute(Sender: TObject);
var
 PUB_ID_PROV: int64;
 vals: array of Variant;
 Splash:TSplashForm;
 p: real;
 i: integer;
 STRU: KERNEL_MODE_STRUCTURE;
 ErrorList: TStringList;
 DoResult: boolean;
 StringError: string;
 MaxErrCount: integer;
 OLD_ID_DOC: integer;
 CHECK_RESULT: integer;
begin
 // проверяем корректность проводок
 try
  StoredProc.Close;
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='MAT_DT_DOC_PROV_INTF_CHECK';
  StoredProc.Prepare;
  StoredProc.ParamByName('PID_DOC').Value:=ID_DOC;
  StoredProc.ExecProc;
  CHECK_RESULT:=StoredProc.ParamByName('RESULT').AsInteger;
  StoredProc.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   StoredProc.Transaction.Rollback;
   Splash.Free;
   exit;
  end;
 end;
 if CHECK_RESULT=0 then
 begin
    ShowMessage('Проводки не відповідають документу!');
    Exit;
 end;
 // записываем проводки
 CLEAR_BUFFERS:=_CLEAR_BUFFERS_AFTER_SAVE;
 ErrorDataSet.DataSource:=nil;
 ErrorDataSet.Close;
 Splash:=TSplashForm.Create(Application);
 Splash.MsgLabel.Caption:=MAT_DOC_STR_WORK_DOC_MSG2;
 Splash.Show;
 Splash.Update;
 try
  WorkDataSet.Close;
  WorkDataSet.SelectSQL.Clear;
  WorkDataSet.SelectSQL.Add('SELECT GEN_ID(KERNEL_GEN_ID_SESSION,1) FROM MAT_INI');
  WorkDataSet.CloseOpen(true);
  KEY_SESSION:=WorkDataSet.FieldByName('GEN_ID').AsInteger;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   Splash.Free;
   exit;
  end;
 end;
 Splash.MsgLabel.Caption:=MAT_DOC_STR_WORK_DOC_MSG3;
 Splash.ProgressBar.Position:=20;
 Splash.Update;
 try
  StoredProc.Close;
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='MAT_PUB_DOC_INSERT';
  StoredProc.Prepare;
  StoredProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
  StoredProc.ParamByName('NUM_DOC').Value:=DocDataSetNUM_DOC.Value;
  StoredProc.ParamByName('DATE_DOC').Value:=DocDataSetDATE_DOC.Value;
  StoredProc.ParamByName('SUMMA').Value:=DocDataSetSUMMA.Value;
  StoredProc.ParamByName('ID_DOC').Value:=ID_DOC;
  StoredProc.ParamByName('ID_USER').AsInt64:=_CURRENT_USER_ID;
  StoredProc.ParamByName('COMPUTER_NAME').Value:=GetCompName;
  StoredProc.ParamByName('MODE').Value:=WORK_MODE;

  StoredProc.ExecProc;
  PUB_ID_DOC:=StoredProc.ParamByName('PUB_ID_DOC').AsInt64;
  StoredProc.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   StoredProc.Transaction.Rollback;
   Splash.Free;
   exit;
  end;
 end;
 Splash.ProgressBar.Position:=40;
 Splash.Update;
 try
   StoredProc.Close;
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName:='MAT_PUB_PROV_INSERT_EX';
   StoredProc.Prepare;
   StoredProc.ParamByName('PID_DOC').Value:=ID_DOC;
   StoredProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
 except on E : Exception
   do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    Splash.Free;
    exit;
   end;
 end;
 Splash.MsgLabel.Caption:=MAT_DOC_STR_WORK_DOC_MSG4;
 Splash.Update;

 // начинаем транзакцию
 cxShowErrors.Visible:=false;
 WriteTransaction.StartTransaction;
 STRU.DBHANDLE:=WorkDatabase.Handle;
 STRU.TRHANDLE:=WriteTransaction.Handle;
 STRU.WORKDATE:=PERIOD;

 STRU.KERNEL_ACTION:=WORK_MODE;
 if WORK_MODE=3 then
   STRU.PK_ID:=PUB_ID_DOC;

 STRU.KEY_SESSION:=KEY_SESSION;
 STRU.ID_USER:=_CURRENT_USER_ID;
 DoResult:=Kernel.KernelDo(@STRU);
 if not DoResult
 then begin
  ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
  StringError:=MAT_STR_SAVE_ERROR+chr(10)+chr(13);
  MaxErrCount:=ErrorList.Count-1;
  if MaxErrCount>20 then MaxErrCount:=20;
  if ErrorList<>nil then
   for i:=0 to MaxErrCount do
    StringError:=StringError+ErrorList.Strings[i]+chr(10)+chr(13);
  StringError:=StringError+chr(10)+chr(13)+'KEY_SESSION:'+IntToStr(KEY_SESSION);
  ShowMessage(StringError);
 end;
 try
   StoredProc.Close;
   StoredProc.Transaction := WriteTransaction;
   StoredProc.StoredProcName:='MAT_DT_DOC_LOG_UPDATE';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_DOC').Value:=ID_DOC;
   StoredProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
   StoredProc.ParamByName('KERNEL_RESULT').Value:=BoolToInt(DoResult);
   StoredProc.ExecProc;
 except on E : Exception
   do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    Splash.Free;
    exit;
   end;
 end;
 Splash.Free;
 if not DoResult
 then begin
  WriteTransaction.Commit;
  CLEAR_BUFFERS:=false;
  PanelIstfin.Visible:=false;
  PanelError.Visible:=true;
  cxCheckErrors.Visible:=true;
  cxCheckErrors.Checked:=true;
  cxShowErrors.Visible:=true;
  PosProvDataSet.Close;
  PosProvDataSet.ParamByName('PID_DOC').Value:=ID_DOC;
  PosProvDataSet.ParamByName('PKEY_SESSION').AsInt64:=KEY_SESSION;
  PosProvDataSet.CloseOpen(false);
  IstFinDataSet.CloseOpen(false);
  ErrorDataSet.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
  ErrorDataSet.ParamByName('ID_DOC').Value:=ID_DOC;
  ErrorDataSet.CloseOpen(true);
 end;
 if DoResult then
 begin
  try
   StoredProc.Transaction := WriteTransaction;
   StoredProc.StoredProcName:='MAT_DT_DOC_POS_PROV_UPDATE_EX';
   StoredProc.Prepare;
   StoredProc.ParamByName('PID_DOC').Value:=ID_DOC;
   StoredProc.ExecProc;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    exit;
   end;
  end;
  try
   StoredProc.Transaction := WriteTransaction;
   StoredProc.StoredProcName:='MAT_DT_DOC_UPDATE_DATE_REC';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_DOC').Value:=ID_DOC;
   StoredProc.ParamByName('PUB_ID_DOC').AsInt64:=PUB_ID_DOC;
   StoredProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
   StoredProc.ExecProc;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    exit;
   end;
  end;
  WriteTransaction.Commit;
  ModalResult:=mrOk;
  Close;
 end
end;

procedure TDocWorkProv.acSetFocusExecute(Sender: TObject);
begin
  CancelButton.SetFocus;
end;

end.
