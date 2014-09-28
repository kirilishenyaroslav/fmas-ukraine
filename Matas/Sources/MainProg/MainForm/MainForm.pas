{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Главный модуль                                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DateUtils,
  Dialogs, ComCtrls, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList, StdActns,
  XPStyleActnCtrls, ImgList, ibase, XPMan, Menus, AppEvnts, StdCtrls,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxStyles, cxCustomData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  uResources, GlobalSPR, uSpDogWork, uSpCustWork, ExtCtrls,
  pFIBErrorHandler, cxContainer, cxLabel, DogLoaderUnit, AccMgmt,
  uPackageManager, uMatasUtils, uMatasVars, dxBar, uMDIFormsBar,
  dxBarExtItems, uMatasFilter, cxHint;

type
  TMatasMainForm = class(TForm)
    MatasStatusBar: TStatusBar;
    MatasActionManager: TActionManager;
    acNobase: TAction;
    acExit: TAction;
    acMolBase: TAction;
    acTipDoc: TAction;
    acBalSch: TAction;
    acAmorBase: TAction;
    acOperBase: TAction;
    acSetup: TAction;
    acAbout: TAction;
    acMatDoc: TAction;
    acRepProv: TAction;
    acOborot: TAction;
    acInvKart: TAction;
    acOboMO: TAction;
    acCustomer: TAction;
    acUnitMeas: TAction;
    acWindowCascade: TWindowCascade;
    acWindowTileHorizontal: TWindowTileHorizontal;
    acWindowTileVertical: TWindowTileVertical;
    acWindowArrange: TWindowArrange;
    acDepartment: TAction;
    XPManifest1: TXPManifest;
    MainImageList: TImageList;
    wMatasAppEvents: TApplicationEvents;
    acOstView: TAction;
    acOstBView: TAction;
    acWorkOstB: TAction;
    acNextPeriod: TAction;
    acDogWork: TAction;
    acRep51: TAction;
    acSetPeriod: TAction;
    acRepOOV: TAction;
    acRepMO: TAction;
    acRepOBR: TAction;
    acRepMB: TAction;
    acRepOst: TAction;
    acRepInv: TAction;
    acAdminUsers: TAction;
    acAdminErrors: TAction;
    LabelNameSys: TLabel;
    acMnaKart: TAction;
    acTools: TAction;
    LabelPeriod: TLabel;
    acViewOborot: TAction;
    acRepDragMet: TAction;
    acRepNoMove: TAction;
    acRepMoOborot: TAction;
    acGlobalSchOborot: TAction;
    acViewWHKart: TAction;
    acVedPereoc: TAction;
    acOstIstFin: TAction;
    dxMainBarManager: TdxBarManager;
    dxBarSubItemSystem: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarSubItemAccount: TdxBarSubItem;
    dxBarSubItemReports: TdxBarSubItem;
    dxBarSubItemSprav: TdxBarSubItem;
    dxBarSubItemWindow: TdxBarSubItem;
    dxBarSubItemHelp: TdxBarSubItem;
    dxBarButtonExit: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarButton21: TdxBarButton;
    dxBarButton22: TdxBarButton;
    dxBarButton23: TdxBarButton;
    dxBarButton24: TdxBarButton;
    dxBarButton25: TdxBarButton;
    dxBarButton26: TdxBarButton;
    dxBarButton27: TdxBarButton;
    dxBarButton28: TdxBarButton;
    dxBarButton29: TdxBarButton;
    dxBarButton30: TdxBarButton;
    dxBarButton31: TdxBarButton;
    dxBarButton32: TdxBarButton;
    dxBarButton33: TdxBarButton;
    dxBarButton34: TdxBarButton;
    dxBarButton35: TdxBarButton;
    dxBarButton36: TdxBarButton;
    dxBarButton37: TdxBarButton;
    dxBarButton38: TdxBarButton;
    dxBarButton39: TdxBarButton;
    dxBarButton40: TdxBarButton;
    dxBarButton41: TdxBarButton;
    dxBarButton42: TdxBarButton;
    dxBarButton43: TdxBarButton;
    dxBarButton44: TdxBarButton;
    dxBarButton45: TdxBarButton;
    dxBarButton46: TdxBarButton;
    dxBarButton47: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    acSchCommonOborot: TAction;
    dxBarButton48: TdxBarButton;
    acRepAnalizeTMC: TAction;
    dxBarButton49: TdxBarButton;
    acDebugReport: TAction;
    cxHintStyleController1: TcxHintStyleController;
    acShowIstFinOborot: TAction;
    dxBarButton50: TdxBarButton;
    acWorkBegOst: TAction;
    dxBarButton51: TdxBarButton;
    dxBarButton52: TdxBarButton;
    dxBarButton53: TdxBarButton;
    dxBarButton54: TdxBarButton;
    dxBarButton55: TdxBarButton;
    dxBarButton56: TdxBarButton;
    dxBarButton57: TdxBarButton;
    acOstBaseIstFin: TAction;
    dxBarButton58: TdxBarButton;
    dxBarButton59: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acAboutExecute(Sender: TObject);
    procedure acMolBaseExecute(Sender: TObject);
    procedure acCustomerExecute(Sender: TObject);
    procedure acBalSchExecute(Sender: TObject);
    procedure acMatDocExecute(Sender: TObject);
    procedure acNobaseExecute(Sender: TObject);
    procedure acUnitMeasExecute(Sender: TObject);
    procedure acTipDocExecute(Sender: TObject);
    procedure acDepartmentExecute(Sender: TObject);
    procedure wMatasAppEventsException(Sender: TObject; E: Exception);
    procedure SetEnvironment;
    procedure acSetupExecute(Sender: TObject);
    procedure acOstViewExecute(Sender: TObject);
    procedure acOstBViewExecute(Sender: TObject);
    procedure acOboMOExecute(Sender: TObject);
    procedure acWorkOstBExecute(Sender: TObject);
    procedure acOperBaseExecute(Sender: TObject);
    procedure acOborotExecute(Sender: TObject);
    procedure acNextPeriodExecute(Sender: TObject);
    procedure acRepProvExecute(Sender: TObject);
    procedure acDogWorkExecute(Sender: TObject);
    procedure acRep51Execute(Sender: TObject);
    procedure acSetPeriodExecute(Sender: TObject);
    procedure acInvKartExecute(Sender: TObject);
    procedure acRepOstExecute(Sender: TObject);
    procedure acRepInvExecute(Sender: TObject);
    procedure acRepOOVExecute(Sender: TObject);
    procedure acRepOBRExecute(Sender: TObject);
    procedure acRepMBExecute(Sender: TObject);
    procedure acAdminUsersExecute(Sender: TObject);
    procedure acAdminErrorsExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acMnaKartExecute(Sender: TObject);
    procedure acRepMOExecute(Sender: TObject);
    procedure acAmorBaseExecute(Sender: TObject);
    procedure acToolsExecute(Sender: TObject);
    procedure InitSystem;
    procedure SetAccess;
    procedure acViewOborotExecute(Sender: TObject);
    procedure acRepDragMetExecute(Sender: TObject);
    procedure acRepNoMoveExecute(Sender: TObject);
    procedure acRepMoOborotExecute(Sender: TObject);
    procedure acGlobalSchOborotExecute(Sender: TObject);
    procedure acViewWHKartExecute(Sender: TObject);
    procedure acVedPereocExecute(Sender: TObject);
    procedure acOstIstFinExecute(Sender: TObject);
    procedure acSchCommonOborotExecute(Sender: TObject);
    procedure acRepAnalizeTMCExecute(Sender: TObject);
    procedure acDebugReportExecute(Sender: TObject);
    procedure acShowIstFinOborotExecute(Sender: TObject);
    procedure acWorkBegOstExecute(Sender: TObject);
    procedure dxBarButton52Click(Sender: TObject);
    procedure dxBarButton53Click(Sender: TObject);
    procedure dxBarButton54Click(Sender: TObject);
    procedure dxBarButton55Click(Sender: TObject);
    procedure dxBarButton56Click(Sender: TObject);
    procedure acOstBaseIstFinExecute(Sender: TObject);
   
  private
    { Private declarations }
  public
   MATAS_MONTH, MATAS_YEAR: Word;
   MATAS_PERIOD: TDateTime;
  end;

var
  MatasMainForm: TMatasMainForm;
  MatasMDIFormBar: TMDIToolBar;

const
  ID_SYSTEM = 4;

implementation

uses dmMain, fmExit, fmAbout, fmPeriod, fmSetup, fmNextPeriod,
     uSpMatOtv, uSpTipDoc, uSpOper, FIBQuery, SysAdmin;

{$R *.dfm}

procedure TMatasMainForm.InitSystem;
begin
 InitializaAdminSystem(Self, dmMatas.fdbMatas.Handle, ID_SYSTEM, _CURRENT_USER_ID, false);
 LoadSysData(dmMatas.ftrReadTransaction);
end;

procedure TMatasMainForm.SetAccess;
begin
// расставляем права на пункты меню
 acWorkOstB.Enabled:=MatasCheckAccess('/ROOT/MATAS/SYSTEM/OST_PRH','Belong', false)=0;
 acNextPeriod.Enabled:=MatasCheckAccess('/ROOT/MATAS/SYSTEM/MOVE_PERIOD','Belong', false)=0;
 acSetPeriod.Enabled:=MatasCheckAccess('/ROOT/MATAS/SYSTEM/SET_PERIOD','Belong', false)=0;
 acSetup.Enabled:=MatasCheckAccess('/ROOT/MATAS/SYSTEM/SETUP','Belong', false)=0;
 acTools.Enabled:=MatasCheckAccess('/ROOT/MATAS/SYSTEM/TOOLS','Belong', false)=0;
 acWorkBegOst.Enabled:=MatasCheckAccess('/ROOT/MATAS/SYSTEM/NACH_OST','Belong', false)=0;

 acMatDoc.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/DOC','Belong', false)=0;
 acOstView.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/OST_CUR','Belong', false)=0;
 acOstBView.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/OST_BASE','Belong', false)=0;
 acOborot.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/OBOR_VED','Belong', false)=0;
 acGlobalSchOborot.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/Obor_sch','Belong', false)=0;
 acVedPereoc.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/VED_PEREOC','Belong', false)=0;
 acOstIstFin.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/OST_BYUT','Belong', false)=0;
 acShowIstFinOborot.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/OBOROT_BYUT','Belong', false)=0;
 acOstBaseIstFin.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/OST_BYUT','Belong', false)=0;
 acRepOOV.Enabled:=MatasCheckAccess('/ROOT/MATAS/REPORTS/OBOROT','Print', false)=0;
// acRepMO.Enabled:=MatasCheckAccess('/ROOT/MATAS/REPORTS/MEMORIAL','Print', false)=0;
 acRepOBR.Enabled:=MatasCheckAccess('/ROOT/MATAS/REPORTS/RVED','Print', false)=0;
 acRepMB.Enabled:=MatasCheckAccess('/ROOT/MATAS/REPORTS/MBOOK','Print', false)=0;
 acRepOst.Enabled:=MatasCheckAccess('/ROOT/MATAS/REPORTS/OST','Print', false)=0;
 acRepInv.Enabled:=MatasCheckAccess('/ROOT/MATAS/REPORTS/INV','Print', false)=0;
 acRepProv.Enabled:=MatasCheckAccess('/ROOT/MATAS/REPORTS/OPER','Print', false)=0;
 acRep51.Enabled:=MatasCheckAccess('/ROOT/MATAS/REPORTS/PVED','Print', false)=0;

 acMolBase.Enabled:=(MatasCheckAccess('/ROOT/MATAS/SPRAV/SP_MO','View', false)=0);
 acBalSch.Enabled:=(MatasCheckAccess('/ROOT/MATAS/SPRAV/SP_SCH','View', false)=0);
 acTipDoc.Enabled:=(MatasCheckAccess('/ROOT/MATAS/SPRAV/SP_TIPD','View', false)=0);
 acOperBase.Enabled:=(MatasCheckAccess('/ROOT/MATAS/SPRAV/SP_OPER','View', false)=0);
 acNobase.Enabled:=(MatasCheckAccess('/ROOT/MATAS/SPRAV/NOMN','Belong', false)=0);
 acUnitMeas.Enabled:=(MatasCheckAccess('/ROOT/MATAS/SPRAV/ED_IZM','Belong', false)=0);
 acDogWork.Enabled:=(MatasCheckAccess('/ROOT/MATAS/SPRAV/DOGS','Belong', false)=0);
 acDepartment.Enabled:=(MatasCheckAccess('/ROOT/MATAS/SPRAV/PIDR','Belong', false)=0);

// NSpAmort.Enabled:=(MatasCheckAccess('/ROOT/MATAS/SPRAV/SP_AMORT','View', false)=0);

 acAdminUsers.Enabled:=(MatasCheckAccess('/ROOT/MATAS/ADMIN','Belong', false)=0);
 acAdminErrors.Enabled:=(MatasCheckAccess('/ROOT/MATAS/ADMIN','Belong', false)=0);

 dxBarButton52.Enabled:=(MatasCheckAccess('/ROOT/MATAS/REPORTS/INV_OBJ','Belong', false)=0);

end;

procedure TMatasMainForm.SetEnvironment;
var
 dd, dm, dy: Word;
begin
 dmMatas.IniDataSet.CloseOpen(true);
 dmMatas.SetDataSet.CloseOpen(true);
 DecodeDate(dmMatas.IniDataSet.FieldByName('DATE_REC').AsDateTime, dy, dm, dd);
 MATAS_PERIOD:=dmMatas.IniDataSet.FieldByName('DATE_REC').AsDateTime;
 MATAS_YEAR:=dy;
 MATAS_MONTH:=dm;

 // устанавливаем период
 _MATAS_BEG_PERIOD:=StartOfTheMonth(dmMatas.IniDataSet.FieldByName('BEG_DATE_REC').AsDateTime);
 _MATAS_OST_PERIOD:=StartOfTheMonth(dmMatas.IniDataSet.FieldByName('DATE_OST_REC').AsDateTime);

 _MATAS_PERIOD:=StartOfTheMonth(MATAS_PERIOD);
 _MATAS_MONTH:=MATAS_MONTH;
 _MATAS_YEAR:=MATAS_YEAR;

 // параметры системы
 _MATAS_ID_SYSTEM:=dmMatas.IniDataSet.FieldByName('MAT_ID_SYSTEM').AsInteger;
 _ID_SETUP:=dmMatas.SetDataSet.FieldByName('ID').AsInteger;
 _ID_DEP_ROOT:=dmMatas.IniDataSet.FieldByName('ID_DEP_ROOT').AsInteger;
 _MAX_DEP_DATE:=dmMatas.IniDataSet.FieldByName('MAX_DEP_DATE').AsDateTime;
 _ID_SCH_ROOT:=dmMatas.IniDataSet.FieldByName('ID_SCH_ROOT').AsInteger;


 // настройки
 _SYSTEM_LANG:=dmMatas.SetDataSet.FieldByName('SYSTEM_LANG').AsInteger;
 _SAVE_USER_PARAMS:=dmMatas.SetDataSet.FieldByName('SAVE_USER_PARAMS').AsInteger;
 _SAVE_HISTORY:=dmMatas.SetDataSet.FieldByName('SAVE_HISTORY').AsInteger;
 _SAVE_OWNER:=dmMatas.SetDataSet.FieldByName('SAVE_OWNER').AsInteger;
 _PRINT_LANG:=dmMatas.SetDataSet.FieldByName('PRINT_LANG').AsInteger;
 _SET_PRINT_ON_PRINTER:=dmMatas.SetDataSet.FieldByName('PRINT_ON_PRINTER').AsInteger;
 _ALLOW_EDIT_TEMPLATE:=dmMatas.SetDataSet.FieldByName('EDIT_TEMPLATE').AsInteger;
 _SET_POS_MODAL_WINDOW:=dmMatas.SetDataSet.FieldByName('POS_MODAL_WINDOW').AsInteger;
 _ALLOW_CLOSE_WINDOW_ESC:=dmMatas.SetDataSet.FieldByName('CLOSE_WINDOW_ESC').AsInteger;
 _SAVE_GROUP:=dmMatas.SetDataSet.FieldByName('SAVE_GROUP').AsInteger;
 _SET_UPPER_KOD:=dmMatas.SetDataSet.FieldByName('UPPER_KOD').AsInteger;
 _SET_UPPER_SHORT_NAME:=dmMatas.SetDataSet.FieldByName('UPPER_SHORT_NAME').AsInteger;
 _SET_UPPER_NAME:=dmMatas.SetDataSet.FieldByName('UPPER_NAME').AsInteger;
 _SET_UPPER_DOC_NUMBER:=dmMatas.SetDataSet.FieldByName('UPPER_DOC_NUMBER').AsInteger;
 _ALLOW_EDIT_OWNER:=dmMatas.SetDataSet.FieldByName('ALLOW_EDIT_OWNER').AsInteger;
 _SET_DATE_DOC:=dmMatas.SetDataSet.FieldByName('SET_DATE_DOC').AsInteger;
 _ALLOW_DUP_NUMBER:=dmMatas.SetDataSet.FieldByName('ALLOW_DUP_NUMBER').AsInteger;
 _SET_AUTO_DOC_NUMBER:=dmMatas.SetDataSet.FieldByName('AUTO_DOC_NUMBER').AsInteger;
 _AUTO_NUM_DOC_MODE:=dmMatas.SetDataSet.FieldByName('AUTO_NUM_DOC_MODE').AsInteger;
 _SET_SCH_ID_DOC:=dmMatas.IniDataSet.FieldByName('SCH_IN_DOC').AsInteger;
 _CLOSE_SYS_SCH:=dmMatas.IniDataSet.FieldByName('CLOSE_MAT_SCH').AsInteger;
 _MAKE_MBOOK_REP:=dmMatas.IniDataSet.FieldByName('MAKE_MBOOK_REP').AsInteger;

 _SHOW_EXCEPTIONS:=true;

 // данные о группах договоров
 _GROUP_DOG_SEL_COMMON:=dmMatas.IniDataSet.FieldByName('GROUP_DOG_SELECT').AsInteger;
 _GROUP_DOG_ADD_COMMON:=dmMatas.IniDataSet.FieldByName('GROUP_DOG_ADD').AsInteger;

 _INV_KART_ENABLED:=dmMatas.IniDataSet.FieldByName('INV_KART_ENABLED').AsInteger;
 _MNA_KART_ENABLED:=dmMatas.IniDataSet.FieldByName('MNA_KART_ENABLED').AsInteger;

 _TOOLS_ENABLED:=dmMatas.IniDataSet.FieldByName('TOOLS_ENABLED').AsInteger;
 _MBOOK_ENABLED:=dmMatas.IniDataSet.FieldByName('MBOOK_ENABLED').AsInteger;

 _LINK_TO_NDS_ENABLED:=dmMatas.IniDataSet.FieldByName('LINK_TO_NDS_ENABLED').AsInteger;
 
 _CLEAR_ISTFIN_BY_DOG:=dmMatas.IniDataSet.FieldByName('CLEAR_ISTFIN_BY_DOG').AsInteger;

 _CHECK_PROV_BY_MANAGER:=false;

 _CLEAR_BUFFERS_AFTER_SAVE:=true;

 _USE_EXT_ACCESS_FOR_MO:=dmMatas.IniDataSet.FieldByName('USE_EXT_ACCESS_FOR_MO').AsInteger;

 _TYPE_MAT_ACCOUNT:=dmMatas.IniDataSet.FieldByName('TYPE_MAT_ACCOUNT').AsInteger;
 _GET_OST_MODE:=dmMatas.IniDataSet.FieldByName('GET_OST_MODE').AsInteger;
 _GET_INV_NOM_MODE:=dmMatas.IniDataSet.FieldByName('GEN_INUM_MODE').AsInteger;
 _USE_FIFO_ON_MAT_SCH:=dmMatas.IniDataSet.FieldByName('USE_FIFO_ON_MAT_SCH').AsInteger;
 
  _USE_ORG_SHORT_NAME:=dmMatas.IniDataSet.FieldByName('USE_SHORT_ORG_NAME').AsInteger;
  _SHOW_OPER_FORM:=dmMatas.IniDataSet.FieldByName('SHOW_OPER_FORM').AsInteger;
 
 if _INV_KART_ENABLED=0 then
  acInvKart.Enabled:=false;

 if _MNA_KART_ENABLED=0 then
  acMnaKart.Enabled:=false;

 if dmMatas.IniDataSet.FieldByName('MNA_INV_ACC').AsInteger = null then
 _MNA_INV_ACC :=0
 else _MNA_INV_ACC:=dmMatas.IniDataSet.FieldByName('MNA_INV_ACC').AsInteger;

 if dmMatas.IniDataSet.FieldByName('MBP_INV_ACC').AsInteger = null then
 _MBP_INV_ACC :=0
 else _MBP_INV_ACC:=dmMatas.IniDataSet.FieldByName('MBP_INV_ACC').AsInteger;

 if dmMatas.IniDataSet.FieldByName('KOD_ST_NDS').AsInteger = null then
 _NDS_ST :=0
 else _NDS_ST:=dmMatas.IniDataSet.FieldByName('KOD_ST_NDS').AsInteger;

 if dmMatas.IniDataSet.FieldByName('IS_TWICE_INV_NUM').AsInteger = null then
 _IS_TWICE_INV_NUM :=0
 else _IS_TWICE_INV_NUM:=dmMatas.IniDataSet.FieldByName('IS_TWICE_INV_NUM').AsInteger;

 if dmMatas.IniDataSet.FieldByName('NOT_CHANGE_INV_NUM').AsInteger = null then
 _NOT_CHANGE_INV_NUM :=0
 else _NOT_CHANGE_INV_NUM:=dmMatas.IniDataSet.FieldByName('NOT_CHANGE_INV_NUM').AsInteger;

 if dmMatas.IniDataSet.FieldByName('PRINT_ISPOLNIT_IN_DOC').AsInteger = null then
 _PRINT_ISPOLNIT_IN_DOC :=0
 else _PRINT_ISPOLNIT_IN_DOC:=dmMatas.IniDataSet.FieldByName('PRINT_ISPOLNIT_IN_DOC').AsInteger;

  if dmMatas.IniDataSet.FieldByName('COMPARE_OST_OBOROT').AsInteger = null then
 _COMPARE_OST_OBOROT :=0
 else _COMPARE_OST_OBOROT:=dmMatas.IniDataSet.FieldByName('COMPARE_OST_OBOROT').AsInteger;

  if dmMatas.IniDataSet.FieldByName('PRINT_INV_VED_BY_SCH').AsInteger = null then
 _PRINT_INV_VED_BY_SCH :=0
 else _PRINT_INV_VED_BY_SCH:=dmMatas.IniDataSet.FieldByName('PRINT_INV_VED_BY_SCH').AsInteger;


 if _TOOLS_ENABLED=0 then
  acTools.Enabled:=false;

 if _MBOOK_ENABLED=0 then
  acRepMB.Enabled:=false;

 if (_INV_KART_ENABLED=1) then
  acInvKart.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/INV_KART','Belong', false)=0;

 if (_MNA_KART_ENABLED=1) then
  acMnaKart.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/MNA_KART','Belong', false)=0;

 try
   dmMatas.MatasStoredProc.Transaction.StartTransaction;
   dmMatas.MatasStoredProc.StoredProcName:='MAT_GET_ORG_DATA';
   dmMatas.MatasStoredProc.Prepare;
   dmMatas.MatasStoredProc.ExecProc;
   _ORG_FULL_NAME:=dmMatas.MatasStoredProc.ParamByName('FULL_NAME').AsString;
   _ORG_SHORT_NAME:=dmMatas.MatasStoredProc.ParamByName('SHORT_NAME').AsString;
   _ORG_KOD_OKPO:=dmMatas.MatasStoredProc.ParamByName('OKPO').AsString;
   _SERVER_TITLE:=dmMatas.MatasStoredProc.ParamByName('SERVER_TITLE').AsString;
   dmMatas.MatasStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    dmMatas.MatasStoredProc.Transaction.Rollback;
    Exit;
   end;
 end;


  if _USE_ORG_SHORT_NAME=1 then _ORG_FULL_NAME:= _ORG_SHORT_NAME;

 Caption:=MAT_SYSTEM_FULL_NAME+' - '+_ORG_FULL_NAME;

 with dmMatas.MatasWorkDataSet do
 begin
  SelectSQL.Clear;
  SelectSQL.Add('SELECT * FROM MAT_GET_MBOOK_DEF_DATA');
  CloseOpen(true);
  _USE_DEFAULT_SMETA:=FieldByName('USE_DEFAULT_VALUES').AsInteger;
  _USE_DEFAULT_KEKV:=FieldByName('USE_DEFAULT_KEKV').AsInteger;
  _DEFAULT_ID_SM:=FieldByName('DEFAULT_ID_SM').AsInteger;
  _DEFAULT_ID_RZ:=FieldByName('DEFAULT_ID_RZ').AsInteger;
  _DEFAULT_ID_ST:=FieldByName('DEFAULT_ID_ST').AsInteger;
  _DEFAULT_ID_KEKV:=FieldByName('DEFAULT_ID_KEKV').AsInteger;
  _DEFAULT_SM_TITLE:=FieldByName('DEFAULT_SM_TITLE').AsString;
  _DEFAULT_RZ_TITLE:=FieldByName('DEFAULT_RZ_TITLE').AsString;
  _DEFAULT_ST_TITLE:=FieldByName('DEFAULT_ST_TITLE').AsString;
  _DEFAULT_KEKV_TITLE:=FieldByName('DEFAULT_KEKV_TITLE').AsString;
  _DEFAULT_SM_KOD:=FieldByName('DEFAULT_SM_KOD').AsInteger;
  _DEFAULT_RZ_KOD:=FieldByName('DEFAULT_RZ_KOD').AsInteger;
  _DEFAULT_ST_KOD:=FieldByName('DEFAULT_ST_KOD').AsInteger;
  _DEFAULT_KEKV_KOD:=FieldByName('DEFAULT_KEKV_KOD').AsInteger;
  Close;
 end;

 MatasStatusBar.Panels[3].Width:=MatasStatusBar.Width-660;
 MatasStatusBar.Panels[0].Text:=' '+MAT_STR_PERIOD+': '+GetMonthName(dm)+' '+IntToStr(dy);
 MatasStatusBar.Panels[1].Text:=MAT_STR_SERVER+': '+_SERVER_TITLE;
 MatasStatusBar.Panels[2].Text:=MAT_STR_USER+': '+_CURRENT_USER_FIO+' ('+_CURRENT_USER_NAME+')';
 MatasStatusBar.Panels[3].Text:=MAT_STR_DB+': '+fibGetCurrentDBPath;
 MatasStatusBar.Panels[4].Text:=GetVersionStrInfo;

 MatasStatusBar.Hint:='';
 MatasStatusBar.Hint:=MatasStatusBar.Panels[0].Text+chr(13);
 MatasStatusBar.Hint:=MatasStatusBar.Hint+MatasStatusBar.Panels[1].Text+chr(13);
 MatasStatusBar.Hint:=MatasStatusBar.Hint+MatasStatusBar.Panels[2].Text+chr(13);
 MatasStatusBar.Hint:=MatasStatusBar.Hint+MatasStatusBar.Panels[3].Text+chr(13);
 MatasStatusBar.Hint:=MatasStatusBar.Hint+MAT_STR_VERSION+': '+MatasStatusBar.Panels[4].Text+chr(13);
  

 LabelPeriod.Caption:=GetMonthName(dm)+' '+IntToStr(dy);

 dxBarSubItemSystem.Caption:=MAT_STR_MAIN_MENU_SYS;
 dxBarSubItemAccount.Caption:=MAT_STR_MAIN_MENU_ACC;
 dxBarSubItemReports.Caption:=MAT_STR_MAIN_MENU_REP;
 dxBarSubItemSprav.Caption:=MAT_STR_MAIN_MENU_SPR;
 dxBarSubItemWindow.Caption:=MAT_STR_MAIN_MENU_WIN;
 dxBarSubItemHelp.Caption:=MAT_STR_MAIN_MENU_HELP;

 acSetup.Caption:=MAT_STR_MAIN_MENU_SYS_SETUP;
 acExit.Caption:=MAT_STR_MAIN_MENU_SYS_EXIT;
 acWorkOstB.Caption:=MAT_STR_MAIN_MENU_SYS_OST;
 acNextPeriod.Caption:=MAT_STR_MAIN_MENU_SYS_NEXT;
 acSetPeriod.Caption:=MAT_STR_MAIN_MENU_SYS_PERIOD;
 acTools.Caption:=MAT_STR_MAIN_MENU_SYS_TOOLS;
 acWorkBegOst.Caption:=MAT_STR_MAIN_MENU_SYS_BEG_OST;

 acMatDoc.Caption:=MAT_STR_MAIN_MENU_ACC_DOC;
 acOborot.Caption:=MAT_STR_MAIN_MENU_ACC_OBV;
 acOboMO.Caption:=MAT_STR_MAIN_MENU_ACC_OBM;
 acInvKart.Caption:=MAT_STR_MAIN_MENU_ACC_INV;
 acOstView.Caption:=MAT_STR_MAIN_MENU_ACC_OSTC;
 acOstBView.Caption:=MAT_STR_MAIN_MENU_ACC_OSTB;
 acMnaKart.Caption:=MAT_STR_MAIN_MENU_ACC_MNA;
 acViewOborot.Caption:=MAT_STR_MAIN_MENU_ACC_OBOR;
 acGlobalSchOborot.Caption:=MAT_STR_MAIN_MENU_ACC_OSCH;
 acVedPereoc.Caption:=MAT_STR_MAIN_MENU_ACC_RECOST;
 acOstIstFin.Caption:=MAT_STR_MAIN_MENU_ACC_ISTF;
 acSchCommonOborot.Caption:=MAT_STR_MAIN_MENU_ACC_SCH_OB;
 acShowIstFinOborot.Caption:=MAT_STR_MAIN_MENU_ACC_OBOR_IF;
  acOstBaseIstFin.Caption:=MAT_STR_MAIN_MENU_ACC_B_ISTF;
 acRepOOV.Caption:=MAT_STR_MAIN_MENU_REP_OOV;
 acRepMO.Caption:=MAT_STR_MAIN_MENU_REP_MO;
 acRepOBR.Caption:=MAT_STR_MAIN_MENU_REP_OBR;
 acRepMB.Caption:=MAT_STR_MAIN_MENU_REP_MB;
 acRepOSt.Caption:=MAT_STR_MAIN_MENU_REP_OST;
 acRepProv.Caption:=MAT_STR_MAIN_MENU_REP_OPER;
 acRep51.Caption:=MAT_STR_MAIN_MENU_REP_DJO;
 acRepInv.Caption:=MAT_STR_MAIN_MENU_REP_INV;
 acRepDragMet.Caption:=MAT_STR_MAIN_MENU_REP_DM;
 acRepNoMove.Caption:=MAT_STR_MAIN_MENU_REP_NOMOVE;
 acRepMoOborot.Caption:=MAT_STR_MAIN_MENU_REP_OMO;
 acRepAnalizeTMC.Caption:=MAT_STR_MAIN_MENU_REP_TMC;

 acViewWHKart.Caption:=MAT_STR_MAIN_MENU_REP_WHKART;

 acNobase.Caption:=MAT_STR_MAIN_MENU_SPR_NOM;
 acMolBase.Caption:=MAT_STR_MAIN_MENU_SPR_MOL;
 acTipDoc.Caption:=MAT_STR_MAIN_MENU_SPR_TIPD;
 acBalSch.Caption:=MAT_STR_MAIN_MENU_SPR_SCH;
 acAmorBase.Caption:=MAT_STR_MAIN_MENU_SPR_AMOR;
 acOperBase.Caption:=MAT_STR_MAIN_MENU_SPR_OPER;
 acCustomer.Caption:=MAT_STR_MAIN_MENU_SPR_CUST;
 acUnitMeas.Caption:=MAT_STR_MAIN_MENU_SPR_UNITS;
 acDepartment.Caption:=MAT_STR_MAIN_MENU_SPR_DEP;
 acDogWork.Caption:=MAT_STR_MAIN_MENU_SPR_DOG;

 acWindowCascade.Caption:=MAT_STR_MAIN_MENU_WIN_CASC;
 acWindowTileHorizontal.Caption:=MAT_STR_MAIN_MENU_WIN_HORZ;
 acWindowTileVertical.Caption:=MAT_STR_MAIN_MENU_WIN_VERT;
 acWindowArrange.Caption:=MAT_STR_MAIN_MENU_WIN_SORT;

 acAbout.Caption:=MAT_STR_MAIN_MENU_HELP_ABOUT;
 acAdminUsers.Caption:=MAT_STR_MAIN_MENU_HELP_USERS;
 acAdminErrors.Caption:=MAT_STR_MAIN_MENU_HELP_ERRORS;

 acSetup.Hint:=MAT_STR_MAIN_MENU_SYS_SETUP;
 acExit.Hint:=MAT_STR_MAIN_MENU_SYS_EXIT;
 acWorkOstB.Hint:=MAT_STR_MAIN_MENU_SYS_OST;
 acNextPeriod.Hint:=MAT_STR_MAIN_MENU_SYS_NEXT;
 acSetPeriod.Hint:=MAT_STR_MAIN_MENU_SYS_PERIOD;
 acWorkBegOst.Hint:=MAT_STR_MAIN_MENU_SYS_BEG_OST;

 acMatDoc.Hint:=MAT_STR_MAIN_MENU_ACC_DOC;
 acOborot.Hint:=MAT_STR_MAIN_MENU_ACC_OBV;
 acOboMO.Hint:=MAT_STR_MAIN_MENU_ACC_OBM;
 acInvKart.Hint:=MAT_STR_MAIN_MENU_ACC_INV;
 acOstView.Hint:=MAT_STR_MAIN_MENU_ACC_OSTC;
 acOstBView.Hint:=MAT_STR_MAIN_MENU_ACC_OSTB;
 acMnaKart.Hint:=MAT_STR_MAIN_MENU_ACC_MNA;
 acViewOborot.Hint:=MAT_STR_MAIN_MENU_ACC_OBOR;
 acGlobalSchOborot.Hint:=MAT_STR_MAIN_MENU_ACC_OSCH;
 acVedPereoc.Hint:=MAT_STR_MAIN_MENU_ACC_RECOST;
 acShowIstFinOborot.Hint:=MAT_STR_MAIN_MENU_ACC_OBOR_IF;

 acRepOOV.Hint:=MAT_STR_MAIN_MENU_REP_OOV;
 acRepMO.Hint:=MAT_STR_MAIN_MENU_REP_MO;
 acRepOBR.Hint:=MAT_STR_MAIN_MENU_REP_OBR;
 acRepMB.Hint:=MAT_STR_MAIN_MENU_REP_MB;
 acRepOSt.Hint:=MAT_STR_MAIN_MENU_REP_OST;
 acRepProv.Hint:=MAT_STR_MAIN_MENU_REP_OPER;
 acRep51.Hint:=MAT_STR_MAIN_MENU_REP_DJO;
 acRepInv.Hint:=MAT_STR_MAIN_MENU_REP_INV;
 acRepDragMet.Hint:=MAT_STR_MAIN_MENU_REP_DM;
 acRepNoMove.Hint:=MAT_STR_MAIN_MENU_REP_NOMOVE;
 acRepMoOborot.Hint:=MAT_STR_MAIN_MENU_REP_OMO;
 acRepAnalizeTMC.Hint:=MAT_STR_MAIN_MENU_REP_TMC;

 acViewWHKart.Hint:=MAT_STR_MAIN_MENU_REP_WHKART;

 acNobase.Hint:=MAT_STR_MAIN_MENU_SPR_NOM;
 acMolBase.Hint:=MAT_STR_MAIN_MENU_SPR_MOL;
 acTipDoc.Hint:=MAT_STR_MAIN_MENU_SPR_TIPD;
 acBalSch.Hint:=MAT_STR_MAIN_MENU_SPR_SCH;
 acAmorBase.Hint:=MAT_STR_MAIN_MENU_SPR_AMOR;
 acOperBase.Hint:=MAT_STR_MAIN_MENU_SPR_OPER;
 acCustomer.Hint:=MAT_STR_MAIN_MENU_SPR_CUST;
 acUnitMeas.Hint:=MAT_STR_MAIN_MENU_SPR_UNITS;
 acDepartment.Hint:=MAT_STR_MAIN_MENU_SPR_DEP;
 acDogWork.Hint:=MAT_STR_MAIN_MENU_SPR_DOG;

 acWindowCascade.Hint:=MAT_STR_MAIN_MENU_WIN_CASC;
 acWindowTileHorizontal.Hint:=MAT_STR_MAIN_MENU_WIN_HORZ;
 acWindowTileVertical.Hint:=MAT_STR_MAIN_MENU_WIN_VERT;
 acWindowArrange.Hint:=MAT_STR_MAIN_MENU_WIN_SORT;

 acAbout.Hint:=MAT_STR_MAIN_MENU_HELP_ABOUT;
 acAdminUsers.Hint:=MAT_STR_MAIN_MENU_HELP_USERS;
 acAdminErrors.Hint:=MAT_STR_MAIN_MENU_HELP_ERRORS; 
end;

procedure TMatasMainForm.FormCreate(Sender: TObject);
begin
 SetAccess;
 LabelNameSys.Caption:=MAT_SYSTEM_SHORT_NAME;
 MatasMDIFormBar:=TMDIToolBar.Create(dxMainBarManager);
end;

procedure TMatasMainForm.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMatasMainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
 i: integer;
 T: TExitForm;
begin
 T:=TExitForm.Create(Application);
 T.ShowModal;
 CanClose:=T.IsOk;
 T.Free;
 if CanClose then begin
  FinalizeAdminSystem;
  for i:=0 to self.MDIChildCount-1 do
  begin
   if (MDIChildren[i].Owner as TForm).Handle=self.Handle
   then begin
     MDIChildren[i].Release;
    end;
  end;
 end;
end;

procedure TMatasMainForm.acAboutExecute(Sender: TObject);
var
 T: TAboutForm;
begin
 T:=TAboutForm.Create(Application);
 T.ShowModal;
 T.Free;
end;

procedure TMatasMainForm.acMolBaseExecute(Sender: TObject);
begin
 uSpMatOtv.ShowSpMatOtv(Self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.acCustomerExecute(Sender: TObject);
begin
 uSpCustWork.ShowSpCustomers(self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.acBalSchExecute(Sender: TObject);
begin
 GlobalSPR.GetSch(self,dmMatas.fdbMatas.Handle, fsMdiChild, MATAS_PERIOD, _ID_SCH_ROOT, -1, -1);
end;

procedure TMatasMainForm.acMatDocExecute(Sender: TObject);
begin
 uPackageManager.LDocWork(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acNobaseExecute(Sender: TObject);
begin
 uPackageManager.LGetNomn(self, dmMatas.fdbMatas.Handle, fsMDIChild, 0, 0, 0, 0, 0, 0, 1);
end;

procedure TMatasMainForm.acUnitMeasExecute(Sender: TObject);
begin
 uPackageManager.ShowUnitMeas(Self, dmMatas.fdbMatas.Handle, fsMdichild, 1);
end;

procedure TMatasMainForm.acTipDocExecute(Sender: TObject);
begin
 uSpTipDoc.ShowSpTipDoc(self, dmMatas.fdbMatas.Handle , 0);
end;

procedure TMatasMainForm.acDepartmentExecute(Sender: TObject);
begin
 uPackageManager.ShowSpDepartment(self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.wMatasAppEventsException(Sender: TObject; E: Exception);
begin
 if _SHOW_EXCEPTIONS then Application.ShowException(E);
end;

procedure TMatasMainForm.acSetupExecute(Sender: TObject);
var
 TS: TfrmSetup;
begin
 TS:=TfrmSetup.Create(self);
 TS.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_SETUP;
 TS.ShowModal;

{
 if TS.ShowModal=mrOk then
 begin
 try
   dmMatas.MatasStoredProc.Transaction.StartTransaction;
   dmMatas.MatasStoredProc.StoredProcName:='MAT_SETUP_UPDATE';
   dmMatas.MatasStoredProc.Prepare;
   dmMatas.MatasStoredProc.ParamByName('ID').Value:=_ID_SETUP;
   dmMatas.MatasStoredProc.ParamByName('SYSTEM_LANG').Value:=TS.cxSystemLang.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('SAVE_USER_PARAMS').Value:=BoolToInt(TS.cxSaveUserParams.Checked);
   dmMatas.MatasStoredProc.ParamByName('SAVE_HISTORY').Value:=TS.cxSaveHistory.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('SAVE_OWNER').Value:=TS.cxSaveUserInDoc.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('PRINT_LANG').Value:=TS.cxPrintLang.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('PRINT_ON_PRINTER').Value:=BoolToInt(TS.cxPrintOnPrinter.Checked);
   dmMatas.MatasStoredProc.ParamByName('EDIT_TEMPLATE').Value:=BoolToInt(TS.cxEditTemplate.Checked);
   dmMatas.MatasStoredProc.ParamByName('POS_MODAL_WINDOW').Value:=BoolToInt(TS.cxPosModalWindow.Checked);
   dmMatas.MatasStoredProc.ParamByName('CLOSE_WINDOW_ESC').Value:=BoolToInt(TS.cxCloseWindowByEsc.Checked);
   dmMatas.MatasStoredProc.ParamByName('SAVE_GROUP').Value:=BoolToInt(TS.cxSaveGroup.Checked);
   dmMatas.MatasStoredProc.ParamByName('UPPER_KOD').Value:=BoolToInt(TS.cxSetUpperCaseKOD.Checked);
   dmMatas.MatasStoredProc.ParamByName('UPPER_SHORT_NAME').Value:=BoolToInt(TS.cxSetUpperCaseShortName.Checked);
   dmMatas.MatasStoredProc.ParamByName('UPPER_NAME').Value:=BoolToInt(TS.cxSetUpperCaseName.Checked);
   dmMatas.MatasStoredProc.ParamByName('UPPER_DOC_NUMBER').Value:=BoolToInt(TS.cxSetUpperCaseNumber.Checked);
   dmMatas.MatasStoredProc.ParamByName('ALLOW_EDIT_OWNER').Value:=BoolToInt(TS.cxEditDocOwner.Checked);
   dmMatas.MatasStoredProc.ParamByName('SET_DATE_DOC').Value:=TS.cxSetDateDoc.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('ALLOW_DUP_NUMBER').Value:=BoolToInt(TS.cxAllowDuplicateNumber.Checked);
   dmMatas.MatasStoredProc.ParamByName('AUTO_DOC_NUMBER').Value:=BoolToInt(TS.cxAutoLengthNumber.Checked);
   dmMatas.MatasStoredProc.ExecProc;
   dmMatas.MatasStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    dmMatas.MatasStoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
  SetEnvironment;
 end;
}
 SetEnvironment;
 TS.Free;
end;

procedure TMatasMainForm.acOstViewExecute(Sender: TObject);
begin
 uPackageManager.ShowOstCur(self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.acOstBViewExecute(Sender: TObject);
begin
 uPackageManager.ShowOstBase(self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.acOboMOExecute(Sender: TObject);
begin
 uPackageManager.ShowOborotByMO(self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.acWorkOstBExecute(Sender: TObject);
begin
 uPackageManager.LOstWork(self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.acOperBaseExecute(Sender: TObject);
begin
 uSpOper.ShowSpOper(self, dmMatas.fdbMatas.Handle , 0);
end;

procedure TMatasMainForm.acOborotExecute(Sender: TObject);
begin
 uPackageManager.ShowOborot(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acNextPeriodExecute(Sender: TObject);
var
 TS: TfrmNextPeriod;
 NewDateRec: TDateTime;
begin
 TS:=TfrmNextPeriod.Create(self);
 TS.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_PERIOD;
 TS.Label1.Caption:=MAT_STR_NEXT_PERIOD;
 TS.OkButton.Caption:=MAT_BUTTON_MOVE_CONST;
 if TS.ShowModal=mrOk then
 begin
  if TS.cxSetPeriod.Checked then
  begin
   NewDateRec:=EndOfAMonth(TS.MatasYear, TS.MatasMonth);
   try
    dmMatas.MatasStoredProc.Transaction.StartTransaction;
    dmMatas.MatasStoredProc.StoredProcName:='MAT_INI_UPDATE';
    dmMatas.MatasStoredProc.Prepare;
    dmMatas.MatasStoredProc.ParamByName('NEW_DATE_REC').Value:=NewDateRec;
    dmMatas.MatasStoredProc.ExecProc;
    dmMatas.MatasStoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     dmMatas.MatasStoredProc.Transaction.Rollback;
     Exit;
    end;
   end;
   SetEnvironment;
  end;
 end;
 TS.Free;
end;

procedure TMatasMainForm.acRepProvExecute(Sender: TObject);
begin
 uPackageManager.ShowOperProv(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acDogWorkExecute(Sender: TObject);
begin
 uSpDogWork.ShowSpDog(self, dmMatas.fdbMatas.Handle, dmMatas.ftrReadTransaction.Handle, dmMatas.ftrWriteTransaction.Handle, dmMatas.ftrReadTransaction, fsMDIChild, _CURRENT_USER_ID);
end;

procedure TMatasMainForm.acRep51Execute(Sender: TObject);
begin
 uPackageManager.ShowOper51(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acSetPeriodExecute(Sender: TObject);
var
 TS: TfrmPeriod;
 NewDateRec: TDateTime;
begin
 TS:=TfrmPeriod.Create(self);
 TS.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_SETUP;
 TS.Label1.Caption:=MAT_SETUP_GROUP_PERIOD;
 TS.MatasMonth:=MATAS_MONTH;
 TS.MatasYear:=MATAS_YEAR;
 if TS.ShowModal=mrOk then
 begin
  NewDateRec:=EndOfAMonth(TS.MatasYear, TS.MatasMonth);
  try
   dmMatas.MatasStoredProc.Transaction.StartTransaction;
   dmMatas.MatasStoredProc.StoredProcName:='MAT_INI_UPDATE';
   dmMatas.MatasStoredProc.Prepare;
   dmMatas.MatasStoredProc.ParamByName('NEW_DATE_REC').Value:=NewDateRec;
   dmMatas.MatasStoredProc.ExecProc;
   dmMatas.MatasStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    dmMatas.MatasStoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
  SetEnvironment;
 end;
 TS.Free;
end;

procedure TMatasMainForm.acInvKartExecute(Sender: TObject);
begin
 uPackageManager.InvKartWork(Self, 1, dmMatas.fdbMatas);
end;

procedure TMatasMainForm.acRepOstExecute(Sender: TObject);
begin
 uPackageManager.ShowOstReport(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acRepInvExecute(Sender: TObject);
begin
 uPackageManager.ShowInvReport(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acRepOOVExecute(Sender: TObject);
begin
 uPackageManager.ShowSchOborot(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acRepOBRExecute(Sender: TObject);
begin
 uPackageManager.ShowAnalize(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acRepMBExecute(Sender: TObject);
begin
 uPackageManager.ShowMBook(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acAdminUsersExecute(Sender: TObject);
begin
 AdminShowUsers(Self);
end;


procedure TMatasMainForm.acAdminErrorsExecute(Sender: TObject);
begin
 AdminShowErrors(Self);
end;

procedure TMatasMainForm.FormResize(Sender: TObject);
begin
 LabelNameSys.Top:=Height-150-LabelNameSys.Height;
 LabelPeriod.Top:=Height-100-LabelPeriod.Height;
 MatasStatusBar.Panels[3].Width:=MatasStatusBar.Width-660;
// Refresh;
 Repaint;
end;

procedure TMatasMainForm.FormShow(Sender: TObject);
begin
 InitSystem;
 SetEnvironment;
 LabelNameSys.Top:=Height-150-LabelNameSys.Height;
 LabelPeriod.Top:=Height-100-LabelPeriod.Height;

 dxBarSubItemReports.Enabled:=(MatasCheckAccess('/ROOT/MATAS/REPORTS','Belong', false)=0);
end;

procedure TMatasMainForm.acMnaKartExecute(Sender: TObject);
begin
 uPackageManager.MnaKartWork(self, dmMatas.fdbMatas.Handle, _CURRENT_USER_ID);
end;

procedure TMatasMainForm.acRepMOExecute(Sender: TObject);
begin
 uPackageManager.ShowMORep(self, dmMatas.fdbMatas.Handle);
end;

procedure TMatasMainForm.acAmorBaseExecute(Sender: TObject);
begin
//
end;

procedure TMatasMainForm.acToolsExecute(Sender: TObject);
begin
 uPackageManager.ShowTools(self, dmMatas.fdbMatas.Handle);
end;

procedure TMatasMainForm.acViewOborotExecute(Sender: TObject);
begin
 uPackageManager.ViewOborot(self, dmMatas.fdbMatas.Handle);
end;

procedure TMatasMainForm.acRepDragMetExecute(Sender: TObject);
begin
 uPackageManager.ShowDragMetRepForm(self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.acRepNoMoveExecute(Sender: TObject);
begin
 uPackageManager.ShowNoMoves(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acRepMoOborotExecute(Sender: TObject);
begin
 uPackageManager.ShowMoOborot(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acGlobalSchOborotExecute(Sender: TObject);
begin
 GlobalSPR.GetOborAnalize(self, dmMatas.fdbMatas.Handle, _CURRENT_USER_ID);
end;

procedure TMatasMainForm.acViewWHKartExecute(Sender: TObject);
begin
 uPackageManager.ShowWareHouseKart(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acVedPereocExecute(Sender: TObject);
begin
 uPackageManager.ShowVedPereoc(self, dmMatas.fdbMatas.Handle, _CURRENT_USER_ID);
end;

procedure TMatasMainForm.acOstIstFinExecute(Sender: TObject);
begin
 uPackageManager.ShowOstIstFin(self, dmMatas.fdbMatas.Handle, _CURRENT_USER_ID);
end;

procedure TMatasMainForm.acSchCommonOborotExecute(Sender: TObject);
begin
 uPackageManager.ShowSchCommonOborot(self, dmMatas.fdbMatas.Handle);
end;

procedure TMatasMainForm.acRepAnalizeTMCExecute(Sender: TObject);
begin
 uPackageManager.ShowAnalizeTMC(self, dmMatas.fdbMatas.Handle, 0, MATAS_PERIOD);
end;

procedure TMatasMainForm.acDebugReportExecute(Sender: TObject);
begin
  if _ALLOW_EDIT_TEMPLATE=1 then
  begin
   _ALLOW_EDIT_TEMPLATE:=0;
   MatasStatusBar.Panels[3].Text:=MAT_STR_DB+': '+fibGetCurrentDBPath;
  end
  else
  begin
   _ALLOW_EDIT_TEMPLATE:=1;
   MatasStatusBar.Panels[3].Text:=MAT_STR_DB+': '+fibGetCurrentDBPath+' (design reports)';
  end
end;

procedure TMatasMainForm.acShowIstFinOborotExecute(Sender: TObject);
begin
 uPackageManager.ShowIstFinOborot(self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.acWorkBegOstExecute(Sender: TObject);
begin
 uPackageManager.ShowBegOst(self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.dxBarButton52Click(Sender: TObject);
begin
 uPackageManager.ShowPrintOstForm(self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.dxBarButton53Click(Sender: TObject);
begin
 uPackageManager.ShowIznosMNAForm(self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.dxBarButton54Click(Sender: TObject);
begin
  uPackageManager.ShowRoshifrIznosMNAForm(self, dmMatas.fdbMatas.Handle, 0);
end;

procedure TMatasMainForm.dxBarButton55Click(Sender: TObject);
begin
  uPackageManager.ShowNormIzn(self, dmMatas.fdbMatas.Handle);
end;

procedure TMatasMainForm.dxBarButton56Click(Sender: TObject);
begin
  uPackageManager.ShowBSOKart(self, dmMatas.fdbMatas.Handle);
end;

procedure TMatasMainForm.acOstBaseIstFinExecute(Sender: TObject);
begin
 uPackageManager.ShowOstBaseIstFin(self, dmMatas.fdbMatas.Handle, 0);
end;



end.
