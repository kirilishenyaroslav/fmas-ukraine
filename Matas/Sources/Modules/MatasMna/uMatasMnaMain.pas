{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Картотека МНА и МБП                                   }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasMnaMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, ibase, FIBDatabase, pFIBDatabase, Menus,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxSplitter, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, ImgList,
  Placemnt, FIBQuery, pFIBQuery, pFIBStoredProc, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxContainer, cxTextEdit, cxMaskEdit, cxButtonEdit,
  uSpMatOtv, uPackageManager, uMatasVars, uSpMatSchMulti, ComCtrls, uMatasUtils,
  uResources, cxGridBandedTableView, cxGridDBBandedTableView, cxCheckBox, ActnList,
  cxDBEdit, frxClass, frxDBSet, frxDesgn, frxExportXLS, frxExportRTF,
  ToolWin, frxExportPDF, frxExportHTML, uMnaFilter;

type
  TMnaKartMainForm = class(TForm)
    MnaKartDatabase: TpFIBDatabase;
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
    SpFormStorage: TFormStorage;
    StoredProc: TpFIBStoredProc;
    KartDataSet: TpFIBDataSet;
    KartDataSource: TDataSource;
    PanelMain: TPanel;
    PanelData: TPanel;
    cxSplitter1: TcxSplitter;
    OperDataSet: TpFIBDataSet;
    OperDataSource: TDataSource;
    zDBTableView1: TcxGridDBTableView;
    zLevel1: TcxGridLevel;
    z: TcxGrid;
    zDBTableView1ID_MNA_KART: TcxGridDBColumn;
    zDBTableView1TIP_MNA_KART: TcxGridDBColumn;
    zDBTableView1ID_MO: TcxGridDBColumn;
    zDBTableView1FIO: TcxGridDBColumn;
    zDBTableView1SFIO: TcxGridDBColumn;
    zDBTableView1ID_SPODR: TcxGridDBColumn;
    zDBTableView1NAME_DEPARTMENT: TcxGridDBColumn;
    zDBTableView1IS_SKLAD: TcxGridDBColumn;
    zDBTableView1ID_SCH: TcxGridDBColumn;
    zDBTableView1SCH_NUMBER: TcxGridDBColumn;
    zDBTableView1SCH_TITLE: TcxGridDBColumn;
    zDBTableView1NNUM: TcxGridDBColumn;
    zDBTableView1GNUM: TcxGridDBColumn;
    zDBTableView1INUM: TcxGridDBColumn;
    zDBTableView1ID_NOMN: TcxGridDBColumn;
    zDBTableView1NOMN: TcxGridDBColumn;
    zDBTableView1NAME: TcxGridDBColumn;
    zDBTableView1ID_OST: TcxGridDBColumn;
    zDBTableView1ID_UNIT: TcxGridDBColumn;
    zDBTableView1UNIT: TcxGridDBColumn;
    zDBTableView1PRICE: TcxGridDBColumn;
    zDBTableView1KOL_MAT: TcxGridDBColumn;
    zDBTableView1SUMMA: TcxGridDBColumn;
    zDBTableView1SUMMA_OST: TcxGridDBColumn;
    zDBTableView1DATE_OST: TcxGridDBColumn;
    zDBTableView1SUMMA_AMORT: TcxGridDBColumn;
    zDBTableView1DATE_OPR: TcxGridDBColumn;
    zDBTableView1ID_OPER_OPR: TcxGridDBColumn;
    zDBTableView1DATE_EXPL: TcxGridDBColumn;
    zDBTableView1ID_OPER_EXPL: TcxGridDBColumn;
    zDBTableView1DATE_OUT: TcxGridDBColumn;
    zDBTableView1ID_OPER_OUT: TcxGridDBColumn;
    zDBTableView1YEAR_EXPL: TcxGridDBColumn;
    zDBTableView1MONTH_EXPL: TcxGridDBColumn;
    zDBTableView1DATE_CREATE: TcxGridDBColumn;
    zDBTableView1MODEL: TcxGridDBColumn;
    zDBTableView1MARKA: TcxGridDBColumn;
    zDBTableView1ZAVNUM: TcxGridDBColumn;
    zDBTableView1PASSNUM: TcxGridDBColumn;
    zDBTableView1NOTE: TcxGridDBColumn;
    zDBTableView1IS_AMORT: TcxGridDBColumn;
    zDBTableView1AMOR_METHOD: TcxGridDBColumn;
    zDBTableView1AMORT_PERCENT: TcxGridDBColumn;
    zDBTableView1DB_ID_SCH_AMORT: TcxGridDBColumn;
    zDBTableView1DB_ID_SM_AMORT: TcxGridDBColumn;
    zDBTableView1DB_ID_RZ_AMORT: TcxGridDBColumn;
    zDBTableView1DB_ID_ST_AMORT: TcxGridDBColumn;
    zDBTableView1DB_ID_KEKV_AMORT: TcxGridDBColumn;
    zDBTableView1KR_ID_SCH_AMORT: TcxGridDBColumn;
    zDBTableView1KR_ID_SM_AMORT: TcxGridDBColumn;
    zDBTableView1KR_ID_RZ_AMORT: TcxGridDBColumn;
    zDBTableView1KR_ID_ST_AMORT: TcxGridDBColumn;
    zDBTableView1KR_ID_KEKV_AMORT: TcxGridDBColumn;
    OperDataSetID_MNA_OPER: TFIBBCDField;
    OperDataSetTIP_OPER: TFIBIntegerField;
    OperDataSetNUM_DOC: TFIBStringField;
    OperDataSetDATE_DOC: TFIBDateField;
    OperDataSetDATE_REC: TFIBDateField;
    OperDataSetPUB_ID_DOC: TFIBBCDField;
    OperDataSetID_MO_OLD: TFIBBCDField;
    OperDataSetFIO_OLD: TFIBStringField;
    OperDataSetSFIO_OLD: TFIBStringField;
    OperDataSetNAME_DEPARTMENT_OLD: TFIBStringField;
    OperDataSetID_MO_NEW: TFIBBCDField;
    OperDataSetFIO_NEW: TFIBStringField;
    OperDataSetSFIO_NEW: TFIBStringField;
    OperDataSetNAME_DEPARTMENT_NEW: TFIBStringField;
    OperDataSetID_SCH_OLD: TFIBBCDField;
    OperDataSetSCH_NUMBER_OLD: TFIBStringField;
    OperDataSetID_SCH_NEW: TFIBBCDField;
    OperDataSetSCH_NUMBER_NEW: TFIBStringField;
    OperDataSetSUMMA_OLD: TFIBBCDField;
    OperDataSetSUMMA_NEW: TFIBBCDField;
    OperDataSetSUMMA: TFIBBCDField;
    OperDataSetSUMMA_AMORT_OLD: TFIBBCDField;
    OperDataSetSUMMA_AMORT_NEW: TFIBBCDField;
    OperDataSetSUMMA_AMORT: TFIBBCDField;
    OperDataSetID_USER: TFIBBCDField;
    OperDataSetCOMPUTER_NAME: TFIBStringField;
    OperDataSetID_MNA_KART: TFIBBCDField;
    OperDataSetKOL_MAT_OLD: TFIBBCDField;
    OperDataSetKOL_MAT_NEW: TFIBBCDField;
    OperDataSetKOL_MAT: TFIBBCDField;
    DragMetDataSet: TpFIBDataSet;
    DragMetDataSource: TDataSource;
    DragMetDataSetID_MNA_DRAGMET: TFIBBCDField;
    DragMetDataSetID_DRAG_MET: TFIBBCDField;
    DragMetDataSetNAME_DRAG_MET: TFIBStringField;
    DragMetDataSetSHORT_NAME: TFIBStringField;
    DragMetDataSetKOL_DRAG_MET: TFIBFloatField;
    PopupMenuDragMetOper: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    OperDataSetNAME_OPER: TFIBStringField;
    ActionList1: TActionList;
    acAdd: TAction;
    acEdit: TAction;
    acDel: TAction;
    acPrint: TAction;
    acRefresh: TAction;
    PopupMenuOper: TPopupMenu;
    acAdd1: TMenuItem;
    acEdit1: TMenuItem;
    acDel1: TMenuItem;
    N4: TMenuItem;
    acPrint1: TMenuItem;
    N5: TMenuItem;
    acRefresh1: TMenuItem;
    zDBTableView1NNUM_FULL: TcxGridDBColumn;
    acPereoc: TAction;
    zDBTableView1INV_NUM_FULL: TcxGridDBColumn;
    acExit: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label5: TLabel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_MNA_DRAGMET: TcxGridDBColumn;
    cxGrid1DBTableView1ID_DRAG_MET: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_DRAG_MET: TcxGridDBColumn;
    cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1KOL_DRAG_MET: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridOper: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridOperDBBandedTableView1ID_MNA_OPER: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1TIP_OPER: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1NUM_DOC: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1NAME_OPER: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1DATE_DOC: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1DATE_REC: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1ID_MO_OLD: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1FIO_OLD: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1SFIO_OLD: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1NAME_DEPARTMENT_OLD: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1ID_MO_NEW: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1FIO_NEW: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1SFIO_NEW: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1NAME_DEPARTMENT_NEW: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1ID_SCH_OLD: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1SCH_NUMBER_OLD: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1ID_SCH_NEW: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1SCH_NUMBER_NEW: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1SUMMA_OLD: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1SUMMA_NEW: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1SUMMA: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1SUMMA_AMORT_OLD: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1SUMMA_AMORT_NEW: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1SUMMA_AMORT: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1ID_USER: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1COMPUTER_NAME: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1ID_MNA_KART: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1KOL_MAT_OLD: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1KOL_MAT_NEW: TcxGridDBBandedColumn;
    cxGridOperDBBandedTableView1KOL_MAT: TcxGridDBBandedColumn;
    cxGridLevel3: TcxGridLevel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    acFiltr: TAction;
    frDataSet: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    KartDataSetID_MNA_KART: TFIBBCDField;
    KartDataSetTIP_MNA_KART: TFIBIntegerField;
    KartDataSetID_MO: TFIBBCDField;
    KartDataSetFIO: TFIBStringField;
    KartDataSetSFIO: TFIBStringField;
    KartDataSetID_SPODR: TFIBIntegerField;
    KartDataSetNAME_DEPARTMENT: TFIBStringField;
    KartDataSetIS_SKLAD: TFIBSmallIntField;
    KartDataSetBAL_ID_SCH: TFIBBCDField;
    KartDataSetBAL_SCH_NUMBER: TFIBStringField;
    KartDataSetBAL_SCH_TITLE: TFIBStringField;
    KartDataSetID_SCH: TFIBBCDField;
    KartDataSetSCH_NUMBER: TFIBStringField;
    KartDataSetSCH_TITLE: TFIBStringField;
    KartDataSetNNUM: TFIBIntegerField;
    KartDataSetGNUM: TFIBSmallIntField;
    KartDataSetINUM: TFIBIntegerField;
    KartDataSetID_NOMN: TFIBBCDField;
    KartDataSetNOMN: TFIBStringField;
    KartDataSetNAME: TFIBStringField;
    KartDataSetID_OST: TFIBBCDField;
    KartDataSetID_UNIT: TFIBBCDField;
    KartDataSetUNIT: TFIBStringField;
    KartDataSetPRICE: TFIBBCDField;
    KartDataSetKOL_MAT: TFIBBCDField;
    KartDataSetSUMMA: TFIBBCDField;
    KartDataSetSUMMA_OST: TFIBBCDField;
    KartDataSetDATE_OST: TFIBDateField;
    KartDataSetSUMMA_AMORT: TFIBBCDField;
    KartDataSetDATE_OPR: TFIBDateField;
    KartDataSetID_OPER_OPR: TFIBBCDField;
    KartDataSetDATE_EXPL: TFIBDateField;
    KartDataSetID_OPER_EXPL: TFIBBCDField;
    KartDataSetDATE_OUT: TFIBDateField;
    KartDataSetID_OPER_OUT: TFIBBCDField;
    KartDataSetYEAR_EXPL: TFIBIntegerField;
    KartDataSetMONTH_EXPL: TFIBIntegerField;
    KartDataSetDATE_CREATE: TFIBDateField;
    KartDataSetMODEL: TFIBStringField;
    KartDataSetMARKA: TFIBStringField;
    KartDataSetZAVNUM: TFIBStringField;
    KartDataSetPASSNUM: TFIBStringField;
    KartDataSetNOTE: TFIBStringField;
    KartDataSetIS_AMORT: TFIBIntegerField;
    KartDataSetAMOR_METHOD: TFIBIntegerField;
    KartDataSetAMORT_PERCENT: TFIBFloatField;
    KartDataSetDB_ID_SCH_AMORT: TFIBBCDField;
    KartDataSetDB_ID_SM_AMORT: TFIBBCDField;
    KartDataSetDB_ID_RZ_AMORT: TFIBBCDField;
    KartDataSetDB_ID_ST_AMORT: TFIBBCDField;
    KartDataSetDB_ID_KEKV_AMORT: TFIBBCDField;
    KartDataSetKR_ID_SCH_AMORT: TFIBBCDField;
    KartDataSetKR_ID_SM_AMORT: TFIBBCDField;
    KartDataSetKR_ID_RZ_AMORT: TFIBBCDField;
    KartDataSetKR_ID_ST_AMORT: TFIBBCDField;
    KartDataSetKR_ID_KEKV_AMORT: TFIBBCDField;
    KartDataSetINV_NUM_FULL: TFIBStringField;
    KartDataSetNNUM_EXT: TFIBStringField;
    KartDataSetNNUM_FULL: TFIBStringField;
    KartDataSetOST_INFO: TFIBStringField;
    TabSheet4: TTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    InvNumDataSet: TpFIBDataSet;
    InvNumDataSetID_MNA_INUM: TFIBBCDField;
    InvNumDataSetINV_NUM: TFIBStringField;
    InvNumDataSetZAVNUM: TFIBStringField;
    InvNumDataSetPASSNUM: TFIBStringField;
    ToolButton9: TToolButton;
    acNum: TAction;
    InvNumDataSource: TDataSource;
    Panel1: TPanel;
    cxAddButton: TcxButton;
    cxEditButton: TcxButton;
    cxDelButton: TcxButton;
    acAddSameKart: TAction;
    acAddSameKart1: TMenuItem;
    PopupMenuAdd: TPopupMenu;
    acAddSameKart2: TMenuItem;
    acAddSameKart3: TMenuItem;
    actShowHistory: TAction;
    cxgrdbclmnDate_out: TcxGridDBColumn;
    frReport: TfrxReport;
    Label1: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    lbl1: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    KartDataSetAMORT_ALL: TCurrencyField;
    frxDBDataset_mna_kart: TfrxDBDataset;
    frxDBDataset_oper: TfrxDBDataset;
    ds_kart: TpFIBDataSet;
    ds_prh_rsh: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
//    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
//      AButtonIndex: Integer);
//    procedure ApplyButtonClick(Sender: TObject);
//    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
//    procedure cxMatOtvPropertiesButtonClick(Sender: TObject;
//      AButtonIndex: Integer);
//    procedure cxMatOtvKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
    procedure cxAddButtonClick(Sender: TObject);
    procedure cxEditButtonClick(Sender: TObject);
    procedure cxDelButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acPereocExecute(Sender: TObject);
//    procedure cxCheckViewInvPropertiesChange(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure cxDelNumClick(Sender: TObject);
    procedure acNumExecute(Sender: TObject);
    procedure acAddSameKartExecute(Sender: TObject);
    procedure actShowHistoryExecute(Sender: TObject);
    procedure zDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure KartDataSetCalcFields(DataSet: TDataSet);
  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    f_id_session,tip_kart,pid_mo,pid_nomn,filter_opr,filter_expl,filter_out,vib_k:Integer;
    date_opr_beg,date_opr_end,date_expl_beg,date_expl_end,date_out_beg,date_out_end:TDateTime;
    s_nomn,s_sch,s_mvo: string;
   ID_SCH, ID_MO: integer;
   SCH_NUMBER: string;
   ID_MNA_KART: integer;
   FILTER_ID_SESSION: integer;
   F_SCH, F_MO: boolean;
   Flag:Integer;
   iznos:Double;
   constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aLANG: smallint);overload;
  end;

  procedure ShowMnaKart(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

  exports ShowMnaKart;

var
  MnaKartMainForm: TMnaKartMainForm;
  FM: TMnaFilterForm;


implementation

{$R *.dfm}

uses uMnaDragMetWork, uMnaWorkForm, uMnaPrintForm, uMnaPereocForm, uMnaNumWork, uMnaHistory,
  cxCurrencyEdit;

constructor TMnaKartMainForm.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aLANG: smallint);
begin
 inherited Create(AOwner);
 if Assigned(aDBHandle) then
 begin
  Self.DBHANDLE := aDBHandle;
  Self.MnaKartDatabase.Close;
  Self.MnaKartDatabase.Handle := DBHANDLE;
  Self.ReadTransaction.StartTransaction;
//  Self.KartDataSet.CloseOpen(false);
 end;
 // права
  acAdd.Enabled    := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/MNA_KART','Add', false)=0);
  acEdit.Enabled   := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/MNA_KART','Edit', false)=0);
  acDel.Enabled    := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/MNA_KART','Edit', false)=0);
  acPrint.Enabled  := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/MNA_KART','Print', false)=0);
  acNum.Enabled    := (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/MNA_KART','Edit', false)=0);
  //
 Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_MNA;
 // подписи к гридам
 Self.cxGridOperDBBandedTableView1NUM_DOC.Caption:=MAT_STR_COL_NUM_DOC;
 Self.cxGridOperDBBandedTableView1NAME_OPER.Caption:='';
 Self.cxGridOperDBBandedTableView1DATE_DOC.Caption:=MAT_STR_COL_DATE_DOC;
 Self.cxGridOperDBBandedTableView1SFIO_OLD.Caption:=MAT_STR_COL_MOL+' (до)';
 Self.cxGridOperDBBandedTableView1SFIO_NEW.Caption:=MAT_STR_COL_MOL+' (після)';
 Self.cxGridOperDBBandedTableView1SCH_NUMBER_OLD.Caption:=MAT_STR_COL_SCH+' (до)';
 Self.cxGridOperDBBandedTableView1SCH_NUMBER_NEW.Caption:=MAT_STR_COL_SCH+' (після)';
 Self.cxGridOperDBBandedTableView1SUMMA.Caption:=MAT_STR_COL_SUMMA;
 Self.cxGridOperDBBandedTableView1KOL_MAT.Caption:=MAT_STR_COL_KOL_MAT;
 Self.cxGrid1DBTableView1NAME_DRAG_MET.Caption:=MAT_STR_COL_NAME;
 Self.cxGrid1DBTableView1KOL_DRAG_MET.Caption:=MAT_STR_COL_KOL;
// Self.ApplyButton.Caption:=MAT_BUTTON_SHOW_CONST;
 Self.acPrint.Caption:=MAT_ACTION_PRINT_CONST;
 Self.acAdd.Caption:=MAT_ACTION_ADD_CONST;
 Self.acDel.Caption:=MAT_ACTION_DELETE_CONST;
 Self.acEdit.Caption:=MAT_ACTION_UPDATE_CONST;
 Self.acExit.Caption:=MAT_ACTION_CLOSE_CONST;
 Self.acFiltr.Caption:=MAT_ACTION_FILTER_CONST;
 Self.acRefresh.Caption:=MAT_ACTION_REFRESH_CONST;
 Self.acAddSameKart.Caption:='Клонувати';
 if (_MNA_INV_ACC=0) and (_MBP_INV_ACC=0) then Self.zDBTableView1INV_NUM_FULL.Visible:=false;
 // восстанавливаем настройки
 with SpFormStorage do
 begin
  RestoreFormPlacement;
  Self.Width:=StoredValue['FormWidth'];
  Self.Height:=StoredValue['FormHeight'];
 end;
 Self.FILTER_ID_SESSION:=Self.MnaKartDatabase.Gen_Id('MAT_ID_SESSION',1, Self.ReadTransaction);
 Self.F_SCH:=false;
 Self.F_MO:=false;
 FM:=TMnaFilterForm.Create(Self);
 acFilterExecute(self);
end;


procedure ShowMnaKart(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : int64);stdcall;
var
 form : TMnaKartMainForm;
begin
 form := TMnaKartMainForm.Create(aOwner, aDBHANDLE, 0);
 form.ID_USER := aID_USER;
 form.FormStyle := fsMDIChild;
 form.Show;
end;


procedure TMnaKartMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 SpFormStorage.StoredValue['FormWidth']:=Width;
 SpFormStorage.StoredValue['FormHeight']:=Height;
 SpFormStorage.SaveFormPlacement;
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TMnaKartMainForm.FormShow(Sender: TObject);
begin
// OkButton.Visible := not (Self.FormStyle = fsMDIChild);
 if Width<400 then Width:=450;
 if Height<160 then Height:=175;
// ShowMessage('W='+IntToStr(Width)+' H='+Inttostr(Height));
end;

procedure TMnaKartMainForm.cxAddButtonClick(Sender: TObject);
var
 T: TMnaDragMetWorkForm;
 vals : array of Variant;
begin
 T:=TMnaDragMetWorkForm.Create(self);
 if T.ShowModal=mrOk then
 begin
   SetLength(Vals, 3);
   Vals[0] := KartDataSet.FieldByName('ID_MNA_KART').AsInteger;
   Vals[2] := T.cxKolDragMet.Value;
   Vals[1] := T.cxDragMet.EditValue;
   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('MAT_DT_MNA_DRAGMET_ADD', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   DragMetDataSet.CloseOpen(False);
 end;
end;

procedure TMnaKartMainForm.cxEditButtonClick(Sender: TObject);
var
 T: TMnaDragMetWorkForm;
 vals : array of Variant;
 id: integer;
begin
 id:=DragMetDataSet.FieldByName('ID_MNA_DRAGMET').AsInteger;
 T:=TMnaDragMetWorkForm.Create(self);
 T.cxKolDragMet.Value:=DragMetDataSet.FieldByName('KOL_DRAG_MET').AsFloat;
 T.cxDragMet.EditValue:=DragMetDataSet.FieldByName('ID_DRAG_MET').AsInteger;
 if T.ShowModal=mrOk then
 begin
   SetLength(Vals, 3);
   Vals[0] := id;
   Vals[2] := T.cxKolDragMet.Value;
   Vals[1] := T.cxDragMet.EditValue;
   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('MAT_DT_MNA_DRAGMET_EDIT', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   DragMetDataSet.CloseOpen(False);
 end;
end;

procedure TMnaKartMainForm.cxDelButtonClick(Sender: TObject);
var
 vals : array of Variant;
begin
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES
 then begin
   SetLength(Vals, 1);
   Vals[0]  := DragMetDataSet.FieldByName('ID_MNA_DRAGMET').AsInteger;
   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('MAT_DT_MNA_DRAGMET_DEL', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   DragMetDataSet.CloseOpen(False);
  end;
end;

procedure TMnaKartMainForm.AddButtonClick(Sender: TObject);
begin

end;

{
0    TIP_MNA_KART INTEGER,
1   ID_MO NUMERIC(10,0),
2    ID_SCH NUMERIC(10,0),
3    NNUM INTEGER,
4    GNUM SMALLINT,
5    INUM INTEGER,
6    ID_NOMN NUMERIC(10,0),
7    ID_OST NUMERIC(10,0),
8    ID_UNIT NUMERIC(10,0),
9    PRICE DECIMAL(16,4),
10    KOL_MAT NUMERIC(16,4),
11    SUMMA NUMERIC(16,2),
12    SUMMA_OST NUMERIC(16,2),
13    DATE_OST DATE,
14    SUMMA_AMORT NUMERIC(16,2),
15    DATE_OPR DATE,
16    ID_OPER_OPR NUMERIC(10,0),
17    DATE_EXPL DATE,
18    ID_OPER_EXPL NUMERIC(10,0),
19    DATE_OUT DATE,
20    ID_OPER_OUT NUMERIC(10,0),
21    YEAR_EXPL INTEGER,
22    MONTH_EXPL INTEGER,
23    DATE_CREATE DATE,
24    MODEL VARCHAR(50),
25    MARKA VARCHAR(50),
26    ZAVNUM VARCHAR(30),
27    PASSNUM VARCHAR(30),
28    NOTE VARCHAR(255),
29    IS_AMORT INTEGER,
30    AMOR_METHOD INTEGER,
31   AMORT_PERCENT NUMERIC(6,2),
32    DB_ID_SCH_AMORT NUMERIC(10,0),
33    DB_ID_SM_AMORT NUMERIC(10,0),
34    DB_ID_RZ_AMORT NUMERIC(10,0),
35    DB_ID_ST_AMORT NUMERIC(10,0),
36    DB_ID_KEKV_AMORT NUMERIC(10,0),
37    KR_ID_SCH_AMORT NUMERIC(10,0),
38    KR_ID_SM_AMORT NUMERIC(10,0),
39    KR_ID_RZ_AMORT NUMERIC(10,0),
40    KR_ID_ST_AMORT NUMERIC(10,0),
41    KR_ID_KEKV_AMORT NUMERIC(10,0)
}

procedure TMnaKartMainForm.acAddExecute(Sender: TObject);
var
 T: TMnaWorkFrom;
 vals : array of Variant;
begin
 T:=TMnaWorkFrom.Create(self);
 T.DBHANDLE:=DBHANDLE;
 if FM.cxCheckBoxMVO.Checked then
 begin
  T.ID_MO:=FM.ID_MO;
  T.cxMatOtv.Text:=FM.cxButtonEditMVO.Text;
 end;
 if FM.cxfilterSch.Checked then
 begin
   T.ID_SCH:=FM.ID_SCH;
   T.cxSch.Text:=FM.SCH_NUMBER;
 end;

 T.Caption:=MAT_SYS_PREFIX + MAT_STR_MAIN_MENU_ACC_MNA+' :: '+MAT_STR_MODE_ADD;
 T.cxTip.ItemIndex:=1;
 if T.ShowModal=mrOk then
 begin
 {  SetLength(Vals, 45);
   Vals[0]  := T.cxTip.ItemIndex;
   Vals[1]  := T.ID_MO;
   Vals[2]  := T.ID_SCH;
   if T.cxNNum.Text=''
    then Vals[3] := null
    else Vals[3]  := T.cxNNum.Text;

   Vals[4]  := 0;
   Vals[5]  := 0;
   Vals[6]  := T.ID_NOMN;
   Vals[7]  := T.ID_OST;
   Vals[8]  := T.ID_UNIT;
   Vals[9]  := T.cxPrice.EditValue;
   Vals[10] := T.cxKolMat.EditValue;
   Vals[11] := T.cxSumma.EditValue;
   Vals[12] := 0;
   Vals[13] := Null;

   iznos:= T.Iznos.EditValue;
   showmessage(floattostr(iznos));
   Vals[14] := T.Iznos.EditValue;
   showmessage(vartostr(Vals[14]));

   if T.cxDateOpr.EditText=''
    then Vals[15] := null
    else Vals[15] := T.cxDateOpr.EditValue;

   if T.cxDateExpl.EditText=''
    then Vals[17] := null
    else Vals[17] := T.cxDateExpl.EditValue;

   Vals[16] := Null;
   Vals[18] := Null;
   Vals[19] := Null;
   Vals[20] := Null;
   Vals[21] := Null;
   Vals[22] := Null;
   Vals[23] := Null;
   Vals[24] := T.cxModel.Text;
   Vals[25] := T.cxMarka.Text;
   Vals[26] := Null;
   Vals[27] := Null;
   Vals[28] := T.cxNote.Text;
   Vals[29] := 0;
   Vals[30] := Null;
   Vals[31] := Null;
   Vals[32] := Null;
   Vals[33] := Null;
   Vals[34] := Null;
   Vals[35] := Null;
   Vals[36] := Null;
   Vals[37] := Null;
   Vals[38] := Null;
   Vals[39] := Null;
   Vals[40] := Null;
   Vals[41] := Null;
   Vals[42] := T.InvNum.Text;
   Vals[43] := T.cxNNumExt.Text;
   if T.cxCheckOst.Checked then
    Vals[44] := 1
   else
    Vals[44] := 0;
   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('MAT_DT_MNA_KART_ADD', vals);
    StoredProc.Transaction.Commit;
    ID_MNA_KART:=StoredProc.ParamByName('ID_MNA_KART').AsInteger;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end; }
    try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_DT_MNA_KART_ADD';
    StoredProc.Prepare;
   // StoredProc.ParamByName('ID_MNA_KART').AsInteger:=ID_MNA_KART;
    StoredProc.ParamByName('TIP_MNA_KART').AsInteger:=T.cxTip.ItemIndex;
    StoredProc.ParamByName('ID_MO').AsInteger:=T.ID_MO;
    StoredProc.ParamByName('ID_SCH').AsInteger:=T.ID_SCH;

     if T.cxNNum.Text=''
    then StoredProc.ParamByName('NNUM').Value:= null
    else StoredProc.ParamByName('NNUM').AsInteger:=StrToInt(T.cxNNum.Text);

    StoredProc.ParamByName('GNUM').AsInteger:=0;
    StoredProc.ParamByName('INUM').AsInteger:=0;
    StoredProc.ParamByName('ID_NOMN').AsInteger:=T.ID_NOMN;
    StoredProc.ParamByName('ID_OST').AsInteger:=T.ID_OST;
    StoredProc.ParamByName('ID_UNIT').AsInteger:= T.ID_UNIT;
    StoredProc.ParamByName('PRICE').AsCurrency:=T.cxPrice.EditValue;
    StoredProc.ParamByName('KOL_MAT').AsCurrency:=T.cxKolMat.EditValue;
    StoredProc.ParamByName('SUMMA').AsCurrency:=T.cxSumma.EditValue;
    StoredProc.ParamByName('SUMMA_OST').AsCurrency:=0;
    StoredProc.ParamByName('DATE_OST').Value:=null;
    StoredProc.ParamByName('SUMMA_AMORT').AsCurrency:=T.Iznos.EditValue;

    if T.cxDateOpr.EditText=''
    then StoredProc.ParamByName('DATE_OPR').Value:= null
    else StoredProc.ParamByName('DATE_OPR').AsDate:= T.cxDateOpr.EditValue;

    StoredProc.ParamByName('ID_OPER_OPR').Value:=null;

    if T.cxDateExpl.EditText=''
    then StoredProc.ParamByName('DATE_EXPL').Value:=null
    else StoredProc.ParamByName('DATE_EXPL').AsDate:= T.cxDateExpl.EditValue;

    StoredProc.ParamByName('ID_OPER_EXPL').Value:=null;
    StoredProc.ParamByName('DATE_OUT').Value:=null;
    StoredProc.ParamByName('ID_OPER_OUT').Value:=null;
    StoredProc.ParamByName('YEAR_EXPL').Value:=null;
    StoredProc.ParamByName('MONTH_EXPL').Value:=null;
    StoredProc.ParamByName('DATE_CREATE').Value:=null;
    StoredProc.ParamByName('MODEL').AsString:=T.cxModel.Text;
    StoredProc.ParamByName('MARKA').AsString:=T.cxMarka.Text;
    StoredProc.ParamByName('ZAVNUM').Value:=null;
    StoredProc.ParamByName('PASSNUM').Value:=null;
    StoredProc.ParamByName('NOTE').AsString:=T.cxMemo1.Text;
    StoredProc.ParamByName('IS_AMORT').AsInteger:=0;
    StoredProc.ParamByName('AMOR_METHOD').Value:=null;
    StoredProc.ParamByName('AMORT_PERCENT').Value:=null;
    StoredProc.ParamByName('DB_ID_SCH_AMORT').Value:=null;
    StoredProc.ParamByName('DB_ID_SM_AMORT').Value:=null;
    StoredProc.ParamByName('DB_ID_RZ_AMORT').Value:=null;
    StoredProc.ParamByName('DB_ID_ST_AMORT').Value:=null;
    StoredProc.ParamByName('DB_ID_KEKV_AMORT').Value:=null;
    StoredProc.ParamByName('KR_ID_SCH_AMORT').Value:=null;
    StoredProc.ParamByName('KR_ID_SM_AMORT').Value:=null;
    StoredProc.ParamByName('KR_ID_RZ_AMORT').Value:=null;
    StoredProc.ParamByName('KR_ID_ST_AMORT').Value:=null;
    StoredProc.ParamByName('KR_ID_KEKV_AMORT').Value:=null;
    StoredProc.ParamByName('INV_NUM_FULL').AsString:=T.InvNum.Text;
    StoredProc.ParamByName('NNUM_EXT').AsString:=T.cxNNumExt.Text;

    if T.cxCheckOst.Checked then
    StoredProc.ParamByName('IS_CREATE_OST').AsInteger:= 1
   else
    StoredProc.ParamByName('IS_CREATE_OST').AsInteger:= 0;
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
    ID_MNA_KART:=StoredProc.ParamByName('ID_MNA_KART').AsInteger;
    except on E : Exception
    do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    exit;
    end;
   end;

  KartDataSet.CloseOpen(False);
  KartDataSet.Locate('ID_MNA_KART', ID_MNA_KART, []);
 end;
 T.Free;
end;

procedure TMnaKartMainForm.acEditExecute(Sender: TObject);
var
 T: TMnaWorkFrom;
 vals : array of Variant;
 ID_OST:integer;
begin
 if KartDataSet.IsEmpty then
  Exit;
 T:=TMnaWorkFrom.Create(self);
 T.DBHANDLE:=DBHANDLE;
 T.Caption:=MAT_SYS_PREFIX + MAT_STR_MAIN_MENU_ACC_MNA+' :: '+MAT_STR_MODE_EDIT;
 ID_MNA_KART:=KartDataSet.FieldByName('ID_MNA_KART').AsInteger;
 ID_OST:=KartDataSet.FieldByName('ID_OST').AsInteger;
 T.ID_MO:=KartDataSet.FieldByName('ID_MO').AsInteger;
 T.cxMatOtv.Text:=KartDataSet.FieldByName('FIO').AsString+'/'+KartDataSet.FieldByName('NAME_DEPARTMENT').AsString;
 T.ID_SCH:=KartDataSet.FieldByName('ID_SCH').AsInteger;
 T.ID_NOMN:=KartDataSet.FieldByName('ID_NOMN').AsInteger;
 T.cxSch.Text:=KartDataSet.FieldByName('SCH_NUMBER').AsString;
 if not KartDataSet.FieldByName('DATE_OPR').IsNull then
  T.cxDateOpr.EditValue:=KartDataSet.FieldByName('DATE_OPR').AsDateTime;
 if not KartDataSet.FieldByName('DATE_EXPL').IsNull then
  T.cxDateExpl.EditValue:=KartDataSet.FieldByName('DATE_EXPL').AsDateTime;
 T.cxName.Text:=KartDataSet.FieldByName('NAME').AsString;
 T.cxKolMat.EditValue:=KartDataSet.FieldByName('KOL_MAT').AsFloat;
 T.cxSumma.EditValue:=KartDataSet.FieldByName('SUMMA').AsFloat;
 T.cxPrice.EditValue:=KartDataSet.FieldByName('PRICE').AsFloat;
 T.ID_UNIT:=KartDataSet.FieldByName('ID_UNIT').AsInteger;
 T.cxUnit.Text:=KartDataSet.FieldByName('UNIT').AsString;
 T.cxModel.Text:=KartDataSet.FieldByName('MODEL').AsString;
 T.cxMarka.Text:=KartDataSet.FieldByName('MARKA').AsString;
 //T.cxZavNum.Text:=KartDataSet.FieldByName('ZAVNUM').AsString;
 //T.cxPassNum.Text:=KartDataSet.FieldByName('PASSNUM').AsString;
 T.cxMemo1.Text:=KartDataSet.FieldByName('NOTE').AsString;
 //T.cxINum.Text:=KartDataSet.FieldByName('INV_NUM_FULL').AsString;
 T.cxNNum.Text:=KartDataSet.FieldByName('NNUM').AsString;
 T.cxNNumExt.Text:=KartDataSet.FieldByName('NNUM_EXT').AsString;
 T.cxOstLink.Text:=KartDataSet.FieldByName('OST_INFO').AsString;
 T.InvNum.Text:=KartDataSet.FieldByName('INV_NUM_FULL').AsString;
 T.Iznos.EditValue:=KartDataSet.FieldByName('SUMMA_AMORT').AsFloat;
 T.ID_OST:=ID_OST;
 if ID_OST>0 then
  T.cxCheckOst.Enabled:=false;
 if T.ShowModal=mrOk then
  begin
   {SetLength(Vals, 46);
   Vals[0]  := ID_MNA_KART;
   Vals[1]  := T.cxTip.ItemIndex;
   Vals[2]  := T.ID_MO;
   Vals[3]  := T.ID_SCH;

   if T.cxNNum.Text=''
    then Vals[4] := null
    else Vals[4]  := T.cxNNum.Text;

   Vals[5]  := 0;
   Vals[6]  := 0;
   Vals[7]  := T.ID_NOMN;
   Vals[8]  := T.ID_OST;
   Vals[9]  := T.ID_UNIT;
   Vals[10] := T.cxPrice.EditValue;
   Vals[11] := T.cxKolMat.EditValue;
   Vals[12] := T.cxSumma.EditValue;
   Vals[13] := 0;
   Vals[14] := Null;

   showmessage(vartostr(Vals[15]));
   showmessage(floattostr(T.Iznos.EditValue));
   Vals[15] := T.Iznos.EditValue;
   showmessage(vartostr(Vals[15]));

   if T.cxDateOpr.EditText=''
    then Vals[16] := null
    else Vals[16] := T.cxDateOpr.EditValue;

   Vals[17] := Null;

   if T.cxDateExpl.EditText=''
    then Vals[18] := null
    else Vals[18] := T.cxDateExpl.EditValue;

   Vals[19] := Null;
   Vals[20] := Null;
   Vals[21] := Null;
   Vals[22] := Null;
   Vals[23] := Null;
   Vals[24] := Null;
   Vals[25] := T.cxModel.Text;
   Vals[26] := T.cxMarka.Text;
   Vals[27] := Null;
   Vals[28] := Null;
   Vals[29] := T.cxNote.Text;
   Vals[30] := 0;
   Vals[31] := Null;
   Vals[32] := Null;
   Vals[33] := Null;
   Vals[34] := Null;
   Vals[35] := Null;
   Vals[36] := Null;
   Vals[37] := Null;
   Vals[38] := Null;
   Vals[39] := Null;
   Vals[40] := Null;
   Vals[41] := Null;
   Vals[42] := Null;
   Vals[43] := T.InvNum.Text;
   Vals[44] := T.cxNNumExt.Text;
   if T.cxCheckOst.Checked then
    Vals[45] := 1
   else
    Vals[45] := 0; }
   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_DT_MNA_KART_EDIT';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_MNA_KART').AsInteger:=ID_MNA_KART;
    StoredProc.ParamByName('TIP_MNA_KART').AsInteger:=T.cxTip.ItemIndex;
    StoredProc.ParamByName('ID_MO').AsInteger:=T.ID_MO;
    StoredProc.ParamByName('ID_SCH').AsInteger:=T.ID_SCH;

     if T.cxNNum.Text=''
    then StoredProc.ParamByName('NNUM').Value:= null
    else StoredProc.ParamByName('NNUM').AsInteger:=StrToInt(T.cxNNum.Text);

    StoredProc.ParamByName('GNUM').AsInteger:=0;
    StoredProc.ParamByName('INUM').AsInteger:=0;
    StoredProc.ParamByName('ID_NOMN').AsInteger:=T.ID_NOMN;
    StoredProc.ParamByName('ID_OST').AsInteger:=T.ID_OST;
    StoredProc.ParamByName('ID_UNIT').AsInteger:= T.ID_UNIT;
    StoredProc.ParamByName('PRICE').AsCurrency:=T.cxPrice.EditValue;
    StoredProc.ParamByName('KOL_MAT').AsCurrency:=T.cxKolMat.EditValue;
    StoredProc.ParamByName('SUMMA').AsCurrency:=T.cxSumma.EditValue;
    StoredProc.ParamByName('SUMMA_OST').AsCurrency:=0;
    StoredProc.ParamByName('DATE_OST').Value:=null;
    StoredProc.ParamByName('SUMMA_AMORT').AsCurrency:=T.Iznos.EditValue;

    if T.cxDateOpr.EditText=''
    then StoredProc.ParamByName('DATE_OPR').Value:= null
    else StoredProc.ParamByName('DATE_OPR').AsDate:= T.cxDateOpr.EditValue;

    StoredProc.ParamByName('ID_OPER_OPR').Value:=null;

    if T.cxDateExpl.EditText=''
    then StoredProc.ParamByName('DATE_EXPL').Value:=null
    else StoredProc.ParamByName('DATE_EXPL').AsDate:= T.cxDateExpl.EditValue;

    StoredProc.ParamByName('ID_OPER_EXPL').Value:=null;
    StoredProc.ParamByName('DATE_OUT').Value:=null;
    StoredProc.ParamByName('ID_OPER_OUT').Value:=null;
    StoredProc.ParamByName('YEAR_EXPL').Value:=null;
    StoredProc.ParamByName('MONTH_EXPL').Value:=null;
    StoredProc.ParamByName('DATE_CREATE').Value:=null;
    StoredProc.ParamByName('MODEL').AsString:=T.cxModel.Text;
    StoredProc.ParamByName('MARKA').AsString:=T.cxMarka.Text;
    StoredProc.ParamByName('ZAVNUM').Value:=null;
    StoredProc.ParamByName('PASSNUM').Value:=null;
    StoredProc.ParamByName('NOTE').AsString:=T.cxMemo1.Text;;
    StoredProc.ParamByName('IS_AMORT').AsInteger:=0;
    StoredProc.ParamByName('AMOR_METHOD').Value:=null;
    StoredProc.ParamByName('AMORT_PERCENT').Value:=null;
    StoredProc.ParamByName('DB_ID_SCH_AMORT').Value:=null;
    StoredProc.ParamByName('DB_ID_SM_AMORT').Value:=null;
    StoredProc.ParamByName('DB_ID_RZ_AMORT').Value:=null;
    StoredProc.ParamByName('DB_ID_ST_AMORT').Value:=null;
    StoredProc.ParamByName('DB_ID_KEKV_AMORT').Value:=null;
    StoredProc.ParamByName('KR_ID_SCH_AMORT').Value:=null;
    StoredProc.ParamByName('KR_ID_SM_AMORT').Value:=null;
    StoredProc.ParamByName('KR_ID_RZ_AMORT').Value:=null;
    StoredProc.ParamByName('KR_ID_ST_AMORT').Value:=null;
    StoredProc.ParamByName('KR_ID_KEKV_AMORT').Value:=null;
    StoredProc.ParamByName('INV_NUM_FULL').AsString:=T.InvNum.Text;
    StoredProc.ParamByName('NNUM_EXT').AsString:=T.cxNNumExt.Text;

    if T.cxCheckOst.Checked then
    StoredProc.ParamByName('IS_CREATE_OST').AsInteger:= 1
   else
    StoredProc.ParamByName('IS_CREATE_OST').AsInteger:= 0;
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
    except on E : Exception
    do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    exit;
    end;
   end;
  KartDataSet.CloseOpen(False);
  KartDataSet.Locate('ID_MNA_KART', ID_MNA_KART, []);
 end;
 T.Free;
end;

procedure TMnaKartMainForm.acDelExecute(Sender: TObject);
begin
 if KartDataSet.IsEmpty then
  Exit;
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES then
 begin
  ID_MNA_KART:=KartDataSet.FieldByName('ID_MNA_KART').AsInteger;
  try
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('MAT_DT_MNA_KART_DEL', [ID_MNA_KART]);
   StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
  end;
  KartDataSet.CloseOpen(False);
 end;
end;

procedure TMnaKartMainForm.acPrintExecute(Sender: TObject);
var
 T: TMnaPrintForm;
 nrep: integer;
begin
  if KartDataSet.IsEmpty then Exit;
 T:=TMnaPrintForm.Create(self);
 if T.ShowModal=mrOk then
 begin
  nrep:=T.cxReport.ItemIndex;
  if nrep=0 then
  begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MnaList.fr3');
  end;
  if nrep=1 then
  frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oz-9.fr3');
  if not KartDataSet.IsEmpty then
  begin
//   KartDataSet.SelectSql.Add(' ORDER BY FIO, SCH_NUMBER, NAME ');
//   KartDataSet.CloseOpen(False);
   if nrep=0 then
   KartDataSource.Enabled:=false;

   if nrep=1 then
   begin
     frxDBDataset_oper.DataSet:=ds_prh_rsh;
     frxDBDataset_mna_kart.DataSet:=ds_kart;
     ds_kart.Close;
     ds_kart.SelectSQL.Clear;
     ds_kart.SelectSQL.Add('select * from MAT_DT_MNA_KART_SEL_FOR_ONE(:id_kart)');
     ds_kart.Prepare;
     ds_kart.ParamByName('id_kart').AsInteger:=KartDataSetID_MNA_KART.AsInteger;
     ds_kart.CloseOpen(False);

     ds_prh_rsh.Close;
     ds_prh_rsh.SelectSQL.Clear;
     ds_prh_rsh.SelectSQL.Add('select * from MAT_DT_MNA_OPER_SEL_PR_RSH(:id_kart)');
     ds_prh_rsh.Prepare;
     ds_prh_rsh.ParamByName('id_kart').AsInteger:=KartDataSetID_MNA_KART.AsInteger;
     ds_prh_rsh.CloseOpen(False);
   end;
    frReport.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
    frReport.Variables['ORG_SHORT_NAME']:=''''+_ORG_SHORT_NAME+'''';
    frReport.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
    frReport.Variables['PERIOD']:=''''+DateToStr(_MATAS_PERIOD)+'''';
    frReport.PrepareReport;

     if T.cxCopies.Value>1 then
    frReport.PrintOptions.Copies:=T.cxCopies.Value;
    frReport.PrintOptions.ShowDialog:=T.cxSelectPrinter.Checked;
    if T.cxCheckOnPrinter.Checked then
    frReport.Print
    else
     if T.cxEditTemplate.Checked then
     frReport.DesignReport
     else frReport.ShowReport;
       if nrep=0 then KartDataSource.Enabled:=true;
     end;
 end;
 T.Free;
end;

procedure TMnaKartMainForm.acPereocExecute(Sender: TObject);
var
 T: TMnaPereocForm;
begin
 T:=TMnaPereocForm.Create(self);
 T.ShowModal;
 T.Free;
end;

procedure TMnaKartMainForm.acExitExecute(Sender: TObject);
begin
 Close;
end;

procedure TMnaKartMainForm.acFilterExecute(Sender: TObject);
var
  w: TForm;
begin
  FM.DBHANDLE:=DBHANDLE;
  FM.FILTER_ID_SESSION:=FILTER_ID_SESSION;
  if Flag=1 then
  begin
   if not (f_id_session=0) then
    begin
     FM.cxfilterSch.Checked:=True;
     FM.f_id_session:=f_id_session;
     FM.cxButtonEditRsc.Text:=s_sch;
    end;

   if not (pid_mo=0) then
    begin
     FM.cxCheckBoxMVO.Checked:=True;
     FM.pid_mo:=pid_mo;
     FM.cxButtonEditMVO.Text:=s_mvo;
    end;

   if not (pid_nomn=0) then
    begin
     FM.cxCheckBoxName.Checked:=True;
     FM.pid_nomn:=pid_nomn;
     FM.cxButtonEditName.Text:=s_nomn;
    end;

   if not (filter_opr=0) then
    begin
     FM.cxCheckBoxDateOpr.Checked:=True;
     FM.date_opr_beg:=date_opr_beg;
     FM.date_opr_end:=date_opr_end;
     FM.cxDateOprBeg.editvalue:=date_opr_beg;
     FM.cxDateOprEnd.editvalue:=date_opr_end;
    end;

   if not (filter_expl=0) then
    begin
     FM.cxCheckBoxDateExpl.Checked:=True;
     FM.date_expl_beg:=date_expl_beg;
     FM.date_expl_end:=date_expl_end;
     FM.cxDateExplBeg.editvalue:=date_expl_beg;
     FM.cxDateExplEnd.editvalue:=date_expl_end;
    end;

   if not (filter_out=0) then
    begin
     FM.cxCheckBoxDateOut.Checked:=True;
     FM.date_out_beg:=date_out_beg;
     FM.date_out_end:=date_out_end;
     FM.cxDateOutBeg.editvalue:=date_out_beg;
     FM.cxDateOutEnd.editvalue:=date_out_end;
    end;

    fm.vib_k:=vib_k;
    if vib_k=1 then FM.VibKart.checked:=True;

  end;
  FM.ShowModal;

  if FM.ModalResult=mrOk then
   begin
    flag:=fm.flag;
    KartDataSet.Close;
    if FM.f_id_session=0 then
      KartDataSet.ParamByName('id_session').Value:=null
    else
      KartDataSet.ParamByName('id_session').Value:=FM.f_id_session;

    if FM.s_nomn='' then
      KartDataSet.ParamByName('Name_Str').Value:=null
    else
      KartDataSet.ParamByName('Name_Str').value:=fm.s_nomn;

    if FM.tip_kart=2 then
      KartDataSet.ParamByName('tip_kart').Value:=null
    else
      KartDataSet.ParamByName('Tip_KART').Value:=FM.tip_kart;

    if FM.pid_mo=0 then
      KartDataSet.ParamByName('Pid_mo').Value:=null
    else
      KartDataSet.ParamByName('Pid_mo').Value:=FM.pid_mo;

    if FM.pid_nomn=0 then
      KartDataSet.ParamByName('Pid_nomn').Value:=null
    else
      KartDataSet.ParamByName('Pid_nomn').Value:=FM.pid_nomn;

    if DateToStr(FM.date_opr_beg)='31.12.1899' then
     KartDataSet.ParamByName('Date_opr_beg').Value:=Null
    else
     KartDataSet.ParamByName('Date_opr_beg').Value:=FM.Date_opr_beg;
    if DateToStr(FM.date_opr_end)='31.12.1899' then
     KartDataSet.ParamByName('Date_opr_end').Value:=null
    else
     KartDataSet.ParamByName('Date_opr_end').Value:=FM.Date_opr_end;
    if DateToStr(FM.date_expl_beg)='31.12.1899' then
     KartDataSet.ParamByName('Date_expl_beg').Value:=null
    else
     KartDataSet.ParamByName('Date_expl_beg').Value:=FM.Date_expl_beg;
    if DateToStr(FM.date_expl_end)='31.12.1899' then
     KartDataSet.ParamByName('Date_expl_end').Value:=null
    else
      KartDataSet.ParamByName('Date_expl_end').Value:=FM.Date_expl_end;
    if DateToStr(FM.date_out_beg)='31.12.1899' then
     KartDataSet.ParamByName('Date_out_beg').Value:=null
    else
      KartDataSet.ParamByName('Date_out_beg').Value:=FM.Date_out_beg;
    if DateToStr(FM.date_out_end)='31.12.1899' then
     KartDataSet.ParamByName('Date_out_end').Value:=null
    else
      KartDataSet.ParamByName('Date_out_end').Value:=FM.Date_out_end;
    if FM.filter_opr=0 then
      KartDataSet.ParamByName('filter_opr').Value:=null
    else
      KartDataSet.ParamByName('filter_opr').Value:=FM.filter_opr;
    if FM.filter_expl=0 then
      KartDataSet.ParamByName('filter_expl').Value:=null
    else
      KartDataSet.ParamByName('filter_expl').Value:=FM.filter_expl;
    if FM.filter_out=0 then
      KartDataSet.ParamByName('filter_out').Value:=null
    else
      KartDataSet.ParamByName('filter_out').Value:=FM.filter_out;
    if FM.vib_k=0 then
      KartDataSet.ParamByName('Vib_K').Value:=null
    else
      KartDataSet.ParamByName('Vib_K').Value:=FM.vib_k;
    w:=ShowWaitWindow(self);
    KartDataSet.CloseOpen(false);
    CloseWaitWindow(w);
    f_id_session:=FM.f_id_session;
    s_nomn:=fm.s_nomn;
    tip_kart:=fm.tip_kart;
    vib_k:=fm.vib_k;
    pid_mo:=Fm.pid_mo;
    pid_nomn:=fm.pid_nomn;
    date_opr_beg:=FM.date_opr_beg;
    date_opr_end:=FM.date_opr_end;
    date_expl_beg:=FM.date_expl_beg;
    date_expl_end:=FM.date_expl_end;
    date_out_beg:=FM.date_out_beg;
    date_out_end:=FM.date_out_end;
    filter_opr:= FM.filter_opr;
    filter_expl:= FM.filter_expl;
    filter_out:= FM.filter_out;
    s_sch:=FM.s_sch;
    s_mvo:=FM.s_mvo;
  end;

end;

procedure TMnaKartMainForm.acRefreshExecute(Sender: TObject);
var
  w: TForm;
begin
  w:=ShowWaitWindow(self);
  KartDataSet.CloseOpen(false);
  CloseWaitWindow(w);
end;

procedure TMnaKartMainForm.cxDelNumClick(Sender: TObject);
var
   vals : array of Variant;
begin
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES
 then begin
   SetLength(Vals, 1);
   Vals[0]  := InvNumDataSet.FieldByName('ID_MNA_INUM').AsInteger;
   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('MAT_DT_MNA_INUM_DELETE', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   InvNumDataSet.CloseOpen(False);
  end;
end;

procedure TMnaKartMainForm.acNumExecute(Sender: TObject);
var  form : TNumWork;
     mna_kart:Integer;
begin
 if KartDataSet.IsEmpty then
  exit;
 mna_kart:=KartDataSet.FieldByName('ID_MNA_KART').AsInteger;
form := TNumWork.Create(self, DBHANDLE, mna_kart );
// form.ID_USER := aID_USER;
// form.FormStyle := fsMDIChild;
 form.ShowModal;
 form.Free;
end;

procedure TMnaKartMainForm.acAddSameKartExecute(Sender: TObject);
var
 T: TMnaWorkFrom;
 vals : array of Variant;
 ID_OST:integer;
begin

 if KartDataSet.IsEmpty then
  Exit;
 T:=TMnaWorkFrom.Create(self);
 T.DBHANDLE:=DBHANDLE;
 ID_MNA_KART:=KartDataSet.FieldByName('ID_MNA_KART').AsInteger;
 ID_OST:=KartDataSet.FieldByName('ID_OST').AsInteger;
 T.ID_MO:=KartDataSet.FieldByName('ID_MO').AsInteger;
 T.cxMatOtv.Text:=KartDataSet.FieldByName('FIO').AsString+'/'+KartDataSet.FieldByName('NAME_DEPARTMENT').AsString;
 T.ID_SCH:=KartDataSet.FieldByName('ID_SCH').AsInteger;
 T.ID_NOMN:=KartDataSet.FieldByName('ID_NOMN').AsInteger;
 T.cxSch.Text:=KartDataSet.FieldByName('SCH_NUMBER').AsString;
 if not KartDataSet.FieldByName('DATE_OPR').IsNull then
  T.cxDateOpr.EditValue:=KartDataSet.FieldByName('DATE_OPR').AsDateTime;
 if not KartDataSet.FieldByName('DATE_EXPL').IsNull then
  T.cxDateExpl.EditValue:=KartDataSet.FieldByName('DATE_EXPL').AsDateTime;
 T.cxName.Text:=KartDataSet.FieldByName('NAME').AsString;
 T.cxKolMat.EditValue:=KartDataSet.FieldByName('KOL_MAT').AsFloat;
 T.cxSumma.EditValue:=KartDataSet.FieldByName('SUMMA').AsFloat;
 T.cxPrice.EditValue:=KartDataSet.FieldByName('PRICE').AsFloat;
 T.ID_UNIT:=KartDataSet.FieldByName('ID_UNIT').AsInteger;
 T.cxUnit.Text:=KartDataSet.FieldByName('UNIT').AsString;
 T.cxModel.Text:=KartDataSet.FieldByName('MODEL').AsString;
 T.cxMarka.Text:=KartDataSet.FieldByName('MARKA').AsString;
 //T.cxZavNum.Text:=KartDataSet.FieldByName('ZAVNUM').AsString;
 //T.cxPassNum.Text:=KartDataSet.FieldByName('PASSNUM').AsString;
 T.cxNote.Text:=KartDataSet.FieldByName('NOTE').AsString;
 //T.cxINum.Text:=KartDataSet.FieldByName('INV_NUM_FULL').AsString;
 T.cxNNum.Text:=KartDataSet.FieldByName('NNUM').AsString;
 T.cxNNumExt.Text:=KartDataSet.FieldByName('NNUM_EXT').AsString;
 T.cxOstLink.Text:=KartDataSet.FieldByName('OST_INFO').AsString;
 T.ID_OST:=ID_OST;
 if ID_OST>0 then
  T.cxCheckOst.Enabled:=false;
 if T.ShowModal=mrOk then
 begin
   SetLength(Vals, 45);
   Vals[0]  := T.cxTip.ItemIndex;
   Vals[1]  := T.ID_MO;
   Vals[2]  := T.ID_SCH;
   if T.cxNNum.Text='' then
    Vals[3] := null
   else
    Vals[3]  := T.cxNNum.Text;
   Vals[4]  := 0;
   Vals[5]  := 0;
   Vals[6]  := T.ID_NOMN;
   Vals[7]  := T.ID_OST;
   Vals[8]  := T.ID_UNIT;
   Vals[9] := T.cxPrice.EditValue;
   Vals[10] := T.cxKolMat.EditValue;
   Vals[11] := T.cxSumma.EditValue;
   Vals[12] := 0;
   Vals[13] := Null;
   Vals[14] := 0;
   if T.cxDateOpr.EditText='' then
    Vals[15] := null
   else
    Vals[15] := T.cxDateOpr.EditValue;
   Vals[16] := Null;
   if T.cxDateExpl.EditText='' then
    Vals[16] := null
   else
    Vals[17] := T.cxDateExpl.EditValue;
   Vals[18] := Null;
   Vals[19] := Null;
   Vals[20] := Null;
   Vals[21] := Null;
   Vals[22] := Null;
   Vals[23] := Null;
   Vals[24] := T.cxModel.Text;
   Vals[25] := T.cxMarka.Text;
   Vals[26] := Null;
   Vals[27] := Null;
   Vals[28] := T.cxNote.Text;
   Vals[29] := 0;
   Vals[30] := Null;
   Vals[31] := Null;
   Vals[32] := Null;
   Vals[33] := Null;
   Vals[34] := Null;
   Vals[35] := Null;
   Vals[36] := Null;
   Vals[37] := Null;
   Vals[38] := Null;
   Vals[39] := Null;
   Vals[40] := Null;
   Vals[41] := Null;
   Vals[42] := Null;
   Vals[43] := T.cxNNumExt.Text;
   if T.cxCheckOst.Checked then
    Vals[44] := 1
   else
    Vals[44] := 0;
   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('MAT_DT_MNA_KART_ADD', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
  KartDataSet.CloseOpen(False);
  KartDataSet.Locate('ID_MNA_KART', ID_MNA_KART, []);
 end;
 T.Free;
end;

procedure TMnaKartMainForm.actShowHistoryExecute(Sender: TObject);
var Form_hist:THistoryForm;
begin
if KartDataSet.IsEmpty then Exit;
Form_hist:=THistoryForm.Create(Self);
Form_hist.id:=KartDataSet.FieldValues['ID_MNA_KART'];
Form_hist.ShowModal;
Form_hist.Free;
end;

procedure TMnaKartMainForm.zDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var   Arect : TRect;
begin
 Arect:=AViewInfo.Bounds;
  if (vartostr(AViewInfo.GridRecord.Values[55])<> '')  then
  begin
      ACanvas.Canvas.Brush.Color := $00D2D2D2;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TMnaKartMainForm.KartDataSetCalcFields(DataSet: TDataSet);
begin
KartDataSetAMORT_ALL.Value:= KartDataSetKOL_MAT.AsInteger*KartDataSetSUMMA_AMORT.AsCurrency;
end;

end.
