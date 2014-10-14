{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, Kernel, uMatasVars, GlobalSPR, uSplash,
  ImgList, ComCtrls, ToolWin, ibase, DateUtils,
  uResources, DB, FIBDataSet, pFIBDataSet, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxSplitter, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, ActnMan, ActnCtrls, ActnList,
  XPStyleActnCtrls, Menus, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxButtonEdit, cxCalendar,
  cxCheckBox, FR_Class, Placemnt, Buttons,
  uPackageManager, uSpOper, uSpTipDoc, uMatasUtils, uDocWorkForm,
  uDocWorkFilter, uDocWorkOstB, uDocWorkProv, uDocWorkMolOborot,
  uDocWorkPrintMatGrp, uDocWorkPrintMatRep, uDocWorkReestr, SIBEABase,
  SIBFIBEA, uPrintWorkedDoc, uDocFilterNomn;

type

  TDocWorkForm = class(TForm)
    DocWorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    DocImageList: TImageList;
    DocDataSet: TpFIBDataSet;
    DocDataSource: TDataSource;
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
    PanelDocWork: TPanel;
    DocGrid: TcxGrid;
    DocsView: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DocMainPopupMenu: TPopupMenu;
    NDocFilter: TMenuItem;
    N1: TMenuItem;
    NDocAdd: TMenuItem;
    NDocDel: TMenuItem;
    N2: TMenuItem;
    NDocPrint: TMenuItem;
    N3: TMenuItem;
    NDocRefresh: TMenuItem;
    cxSplitter1: TcxSplitter;
    ActionToolBar1: TActionToolBar;
    DocDataSetID_DOC: TFIBIntegerField;
    DocDataSetID_TIPD: TFIBIntegerField;
    DocDataSetTIPD: TFIBStringField;
    DocDataSetNAME_TIPD: TFIBStringField;
    DocDataSetNUM_DOC: TFIBStringField;
    DocDataSetDATE_DOC: TFIBDateField;
    DocDataSetOSN_ID_TIPD: TFIBIntegerField;
    DocDataSetOTIPD: TFIBStringField;
    DocDataSetNAME_OSN: TFIBStringField;
    DocDataSetOSN_NUM_DOC: TFIBStringField;
    DocDataSetOSN_DATE_DOC: TFIBDateField;
    DocDataSetID_MO_IN: TFIBIntegerField;
    DocDataSetFIO_MO_IN: TFIBStringField;
    DocDataSetNAME_DEP_IN: TFIBStringField;
    DocDataSetID_MO_OUT: TFIBIntegerField;
    DocDataSetFIO_MO_OUT: TFIBStringField;
    DocDataSetNAME_DEP_OUT: TFIBStringField;
    DocDataSetNAME_CUSTOMER: TFIBStringField;
    DocDataSetSUMMA: TFIBBCDField;
    DocDataSetID_MAN: TFIBIntegerField;
    DocDataSetFIO_MAN: TFIBStringField;
    DocDataSetDOV_NUM: TFIBStringField;
    DocDataSetDOV_DATE: TFIBDateField;
    DocDataSetDATE_REC: TFIBDateField;
    DocsViewTIPD: TcxGridDBColumn;
    DocsViewNUM_DOC: TcxGridDBColumn;
    DocsViewDATE_DOC: TcxGridDBColumn;
    DocsViewSUMMA: TcxGridDBColumn;
    DocPosDataSource: TDataSource;
    DocPosDataSet: TpFIBDataSet;
    DocStoredProc: TpFIBStoredProc;
    DocDataSetNAME_IN: TStringField;
    DocDataSetNAME_OUT: TStringField;
    DocsViewNameIn: TcxGridDBColumn;
    DocsViewNameOut: TcxGridDBColumn;
    PanelWork: TPanel;
    PanelPos: TPanel;
    TipdDataSet: TpFIBDataSet;
    TipdDataSource: TDataSource;
    TipdDataSetID_TIPD: TFIBIntegerField;
    TipdDataSetTIPD: TFIBStringField;
    TipdDataSetNAME: TFIBStringField;
    TipdDataSetPROPERTIES: TFIBStringField;
    TipdDataSetIS_OSN: TFIBSmallIntField;
    TipdDataSetSYSTEM: TFIBSmallIntField;
    cxFilterDateBeg: TcxDateEdit;
    cxFilterDateEnd: TcxDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    cxCheckPos: TcxCheckBox;
    cxFilterTipd: TcxLookupComboBox;
    PrintDataSet: TpFIBDataSet;
    N4: TMenuItem;
    NDocWork: TMenuItem;
    NDocUnWork: TMenuItem;
    DocDataSetKOD_DOC: TFIBSmallIntField;
    DocDataSetPERIOD: TStringField;
    DocsViewDBPeriod: TcxGridDBColumn;
    DocFormStorage: TFormStorage;
    NDocEdit: TMenuItem;
    N7: TMenuItem;
    NDocView: TMenuItem;
    PosGrid: TcxGrid;
    PosGridDBTableView1: TcxGridDBTableView;
    PosGridDBTableView1ID_DOC: TcxGridDBColumn;
    PosGridDBTableView1ID_POS: TcxGridDBColumn;
    PosGridDBTableView1ID_NOMN: TcxGridDBColumn;
    PosGridDBTableView1NAME: TcxGridDBColumn;
    PosGridDBTableView1ID_UNIT: TcxGridDBColumn;
    PosGridDBTableView1UNIT: TcxGridDBColumn;
    PosGridDBTableView1KOL_MAT: TcxGridDBColumn;
    PosGridDBTableView1KOL_DOC: TcxGridDBColumn;
    PosGridDBTableView1PRICE: TcxGridDBColumn;
    PosGridDBTableView1SUMMA: TcxGridDBColumn;
    PosGridDBTableView1ID_OST: TcxGridDBColumn;
    PosGridDBTableView1ID_SCH: TcxGridDBColumn;
    PosGridDBTableView1NAME_SCH: TcxGridDBColumn;
    PosGridLevel1: TcxGridLevel;
    ModeButton: TSpeedButton;
    DocDataSetPUB_ID_DOC: TFIBBCDField;
    DocPosProvDataSet: TpFIBDataSet;
    DocPosProvDataSource: TDataSource;
    PosProvGrid: TcxGrid;
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
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    DocPosProvDataSetID_DOC: TFIBIntegerField;
    DocPosProvDataSetID_POS: TFIBIntegerField;
    DocPosProvDataSetID_NOMN: TFIBIntegerField;
    DocPosProvDataSetNAME: TFIBStringField;
    DocPosProvDataSetID_UNIT: TFIBIntegerField;
    DocPosProvDataSetUNIT: TFIBStringField;
    DocPosProvDataSetKOL_MAT: TFIBBCDField;
    DocPosProvDataSetKOL_DOC: TFIBBCDField;
    DocPosProvDataSetPRICE: TFIBBCDField;
    DocPosProvDataSetSUMMA: TFIBBCDField;
    DocPosProvDataSetDB_ID_SCH: TFIBIntegerField;
    DocPosProvDataSetKR_ID_SCH: TFIBIntegerField;
    DocPosProvDataSetDB_SCH: TFIBStringField;
    DocPosProvDataSetKR_SCH: TFIBStringField;
    cxFooter: TcxCheckBox;
    NPrintRep: TMenuItem;
    NDocPrintRep: TMenuItem;
    NDocRepPrh: TMenuItem;
    NDocRepRsh: TMenuItem;
    DocDataSetUSER_NAME: TFIBStringField;
    DocDataSetCOMPUTER: TFIBStringField;
    DocDataSetDATETIME: TFIBDateTimeField;
    DocDataSetNUM_REESTR: TFIBStringField;
    DocDataSetDATE_REESTR: TFIBDateField;
    DocDataSetDIR_KOMISSIA: TFIBStringField;
    DocDataSetKOMISSIA: TFIBStringField;
    DocDataSetNUM_PRIKAZ_KOMISSIA: TFIBStringField;
    DocDataSetDATE_PRIKAZ_KOMISSIA: TFIBDateField;
    ButtonUpDate: TSpeedButton;
    ButtonDownDate: TSpeedButton;
    acmDocWork: TActionManager;
    acDocAdd: TAction;
    acDocDel: TAction;
    acDocEdit: TAction;
    acDocPrint: TAction;
    acDocFilter: TAction;
    acDocRefresh: TAction;
    acDocExit: TAction;
    acDocWork: TAction;
    acDocUnWork: TAction;
    acDocView: TAction;
    acDocReestr: TAction;
    OborotButton: TSpeedButton;
    DocDataSetFIO_IN: TFIBStringField;
    DocDataSetFIO_OUT: TFIBStringField;
    DocDataSetSUMMA_DOC: TFIBBCDField;
    DocDataSetSFIO_MAN: TFIBStringField;
    DocDataSetDOC_NOTE: TFIBStringField;
    DocDataSetINV_KART_MODE: TFIBIntegerField;
    DocDataSetMNA_KART_MODE: TFIBIntegerField;
    acDocTools: TAction;
    PosGridDBTableView1SCH_NUMBER: TcxGridDBColumn;
    DocDataSetID_CUST: TFIBBCDField;
    acDocRepMat: TAction;
    ErrorDataSet: TpFIBDataSet;
    FilterStoredProc: TpFIBStoredProc;
    acDocRepDoc: TAction;
    actHistory: TAction;
    SIBfibEventAlerter1: TSIBfibEventAlerter;
    actPrintWorked: TAction;
    N5: TMenuItem;
    ClearTr: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    acDocClone: TAction;
    acDocClone1: TMenuItem;
    actFiltrNomn: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acDocExitExecute(Sender: TObject);
    procedure acDocAddExecute(Sender: TObject);
    procedure acDocDelExecute(Sender: TObject);
    procedure acDocEditExecute(Sender: TObject);
    procedure acDocPrintExecute(Sender: TObject);
    procedure acDocFilterExecute(Sender: TObject);
    procedure acDocRefreshExecute(Sender: TObject);
    procedure DocDataSetCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure cxCheckPosPropertiesChange(Sender: TObject);
    procedure cxFilterDateBegPropertiesChange(Sender: TObject);
    procedure cxFilterDateEndPropertiesChange(Sender: TObject);
    procedure cxLookupComboBox1PropertiesChange(Sender: TObject);
    procedure acDocWorkExecute(Sender: TObject);
    procedure acDocUnWorkExecute(Sender: TObject);
    procedure DocMainPopupMenuPopup(Sender: TObject);
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure cxSplitter1AfterClose(Sender: TObject);
    procedure DocsViewDblClick(Sender: TObject);
    procedure acDocViewExecute(Sender: TObject);
    procedure ModeButtonClick(Sender: TObject);
    procedure cxFooterPropertiesChange(Sender: TObject);
    procedure acDocReestrExecute(Sender: TObject);
    procedure ButtonUpDateClick(Sender: TObject);
    procedure ButtonDownDateClick(Sender: TObject);
    procedure OborotButtonClick(Sender: TObject);
    procedure acDocRepMatExecute(Sender: TObject);
    procedure DocsViewColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure FormDestroy(Sender: TObject);
    procedure acDocToolsExecute(Sender: TObject);
    procedure acDocRepDocExecute(Sender: TObject);
    procedure actHistoryExecute(Sender: TObject);
    procedure SIBfibEventAlerter1EventAlert(Sender: TObject;
      EventName: String; EventCount: Integer);
    procedure actPrintWorkedExecute(Sender: TObject);
    procedure acDocCloneExecute(Sender: TObject);
    procedure actFiltrNomnExecute(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
    FMode: TFMode;
  public
   WORK_PERIOD: TDateTime;
   IsFilterSet: boolean;
   F_DATE_BEG, F_DATE_END: TDateTime;
   F_ID_TIPD, F_ID_MO_IN, F_ID_MO_OUT: integer;
   F_ID_CUST: int64;
   F_TIPD, F_FIO_MO_IN, F_FIO_MO_OUT, F_NAME_CUST: string;
   F_NUM_DOC: string;
   F_DOC_WORK: integer;
   F_IS_SUMMA: boolean;
   F_SUMMA_BEG, F_SUMMA_END: double;
   F_CONDITION: boolean;
   F_WORK_PERIOD: boolean;
   F_WORK_DATE_BEG, F_WORK_DATE_END: TDateTime;
   FILTER_ID_SESSION: integer;
   F_SCH_LIST: string;
   F_OPER_PARAM: string;
   F_NAME_TMC: string;
   F_IS_NOMN: Boolean;
   F_IS_GROUP: Boolean;
   F_GROUP_LIST: string;

   mode:TFMode;
   doc_filtr:string;
   IsOne:Integer;

   ViewMode: TPosMode;
   function GetNewFilterID: Integer;

   procedure InitDocDataSet;

   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; aWORK_PERIOD: TDateTime; FMode: TFMode);overload;
  end;

procedure DocWork(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; WORK_PERIOD: TDateTime);stdcall;
procedure DocWork_Compare(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; WORK_PERIOD: TDateTime; doc:Integer);stdcall;
procedure OstWork(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

exports DocWork, OstWork, DocWork_Compare;

const
 OST_ID_TIPD = 13;

var
 DocWorkForm: TDocWorkForm;
 MainSplash: TSplashForm;
 DocFilter:  TDocWorkFilterForm;

implementation

{$R *.dfm}
uses uDocHistory;

function GetPosModeName(m: TPosMode):string;
var
 res: string;
begin
 case m of
  PosMode: res:=MAT_DOC_STR_PosMode;
  ProvMode: res:=MAT_DOC_STR_ProvMode;
  PPMode: res:=MAT_DOC_STR_PPMode;
 end;
 GetPosModeName:=res;
end;

procedure DocWork(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; WORK_PERIOD: TDateTime);stdcall;
var
 form : TDocWorkForm;
begin
 form := TDocWorkForm.Create(AOwner, DBHANDLE, aID_USER, WORK_PERIOD, DocMode);
 form.FormStyle := fsMDIChild;
end;

procedure OstWork(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 form : TDocWorkForm;
begin
 form := TDocWorkForm.Create(AOwner, DBHANDLE, aID_USER, Date, OstMode);
 form.FormStyle := fsMDIChild;
end;

procedure DocWork_Compare(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; WORK_PERIOD: TDateTime; doc:Integer);stdcall;
var
 form : TDocWorkForm;
begin
 form := TDocWorkForm.Create(AOwner, DBHANDLE, aID_USER, WORK_PERIOD, DocMode);
 form.FormStyle := fsMDIChild;

 form.DocDataSet.CLose;
 form.DocDataSet.SelectSql.Text:='select * from MAT_DT_DOC_SELECT_COMPARE_OST('+Inttostr(doc)+')';
 form.docdataset.closeOpen(False);
end;

constructor TDocWorkForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; aWORK_PERIOD:TDateTime; FMode: TFMode);
var
 DateBeg, DateEnd: TDateTime;
 Year, Month, Day: Word;
begin
 inherited Create(AOwner);
 MainSplash:=TSplashForm.Create(self);
 MainSplash.Title.Caption:=MAT_DOC_STR_SPLASH_CAPTION;
 MainSplash.MsgLabel.Caption:=MAT_DOC_STR_SPLASH_INIT1;
 MainSplash.Show;
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.DocWorkDatabase.Handle:=DBHANDLE;
   Self.TipdDataSet.CloseOpen(true);
 end;
 MainSplash.Progress.StepBy(20);
 MainSplash.MsgLabel.Caption:=MAT_DOC_STR_SPLASH_INIT2;
 MainSplash.Update;
 Self.WORK_PERIOD:=aWORK_PERIOD;
 if FMode=OstMode then
  Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_OSTWORK
 else
  Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK;
 acDocAdd.Caption:=MAT_ACTION_ADD_CONST;
 acDocDel.Caption:=MAT_ACTION_DELETE_CONST;
 acDocEdit.Caption:=MAT_ACTION_UPDATE_CONST;
 acDocFilter.Caption:=MAT_ACTION_FILTER_CONST;
 acDocPrint.Caption:=MAT_ACTION_PRINT_CONST;
 acDocReestr.Caption:=MAT_DOC_STR_PRINT_REP;
 acDocRefresh.Caption:=MAT_ACTION_REFRESH_CONST;
 acDocExit.Caption:=MAT_BUTTON_EXIT_CONST;
 acDocWork.Caption:=MAT_DOC_STR_ACTION_WORK;
 acDocUnWork.Caption:=MAT_DOC_STR_ACTION_UNWORK;
 acDocView.Caption:=MAT_ACTION_VIEW_CONST;
 acDocTools.Caption:=MAT_ACTION_WORK_CONST;
 acDocRepMat.Caption:=MAT_DOC_STR_PRINT_MAT;
 acDocRepDoc.Caption:=MAT_DOC_STR_PRINT_DOC;
 acDocClone.Caption:=MAT_DOC_STR_CLONE_DOC;
 NDocAdd.Caption:=MAT_ACTION_ADD_CONST;
 NDocDel.Caption:=MAT_ACTION_DELETE_CONST;
 NDocEdit.Caption:=MAT_ACTION_UPDATE_CONST;
 NDocFilter.Caption:=MAT_ACTION_FILTER_CONST;
 NDocPrint.Caption:=MAT_ACTION_PRINT_CONST;
 NDocPrintRep.Caption:=MAT_DOC_STR_PRINT_REP;
 NDocRepPrh.Caption:=MAT_DOC_STR_PRINT_PRH;
 NDocRepRsh.Caption:=MAT_DOC_STR_PRINT_RSH;
 NDocRefresh.Caption:=MAT_ACTION_REFRESH_CONST;
 NDocWork.Caption:=MAT_DOC_STR_ACTION_WORK;
 NDocUnWork.Caption:=MAT_DOC_STR_ACTION_UNWORK;
 NDocView.Caption:=MAT_ACTION_VIEW_CONST;
 NPrintRep.Caption:=MAT_ACTION_PRINT_REP_CONST;
 MainSplash.Progress.StepBy(20);
 MainSplash.MsgLabel.Caption:=MAT_DOC_STR_SPLASH_INIT3;
 MainSplash.Update;
 DocFormStorage.RestoreFormPlacement;
 if DocFormStorage.ReadString('cxCheckPos_Checked','')='True' then
  cxCheckPos.Checked:=true
 else
  cxCheckPos.Checked:=false;
 if cxCheckPos.Checked then
  cxSplitter1.OpenSplitter
 else
  cxSplitter1.CloseSplitter;
 ModeButton.Enabled:=cxCheckPos.Checked;
 ViewMode:=PosMode;
 ModeButton.Caption:=GetPosModeName(ViewMode);
 Self.FMode:=FMode;
 Self.IsFilterSet:=false;
 DecodeDate(WORK_PERIOD, Year, Month, Day);
 if (FMode=DocMode) then
 begin
  DateBeg:=StartOfAMonth(Year, Month);
  DateEnd:=EndOfAMonth(Year, Month);
 end
 else
 begin
  DateBeg:=StartOfTheYear(_MATAS_PERIOD);
  DateEnd:=EndOfTheYear(_MATAS_PERIOD);
 end;
 MainSplash.Progress.StepBy(20);
 MainSplash.MsgLabel.Caption:=MAT_DOC_STR_SPLASH_INIT4;
 MainSplash.Update;
 Self.InitDocDataSet;
 Self.DocDataSet.ParamByName('DATE_BEG').Value:=DateBeg;
 Self.DocDataSet.ParamByName('DATE_END').Value:=DateEnd;
 if FMode=OstMode then
 begin
  Self.DocDataSet.ParamByName('ID_TIPD').Value:=OST_ID_TIPD;
  Self.cxFilterTipd.Enabled:=False;
 end;
 Self.DocDataSet.ParamByName('ID_FILTER').Value:=null;
 Self.DocDataSet.CloseOpen(False);
 Self.DocDataset.First;
 MainSplash.Progress.StepBy(20);
 MainSplash.MsgLabel.Caption:=MAT_DOC_STR_SPLASH_INIT5;
 MainSplash.Update;
 F_DATE_BEG:=DateBeg;
 F_DATE_END:=DateEnd;
 F_WORK_DATE_BEG:=_MATAS_PERIOD;
 F_WORK_DATE_END:=_MATAS_PERIOD;
 F_WORK_PERIOD:=false;

 FILTER_ID_SESSION:=GetNewFilterID;

 self.cxFilterDateBeg.Date:=DateBeg;
 self.cxFilterDateEnd.Date:=DateEnd;
 Self.DocDataSet.First;
 Self.PosGridDBTableView1NAME.Caption:=MAT_STR_COL_NAME_TMC;
 Self.PosGridDBTableView1UNIT.Caption:=MAT_STR_COL_NAME_UNIT;
 Self.PosGridDBTableView1SCH_NUMBER.Caption:=MAT_STR_COL_SCH;
 Self.PosGridDBTableView1KOL_MAT.Caption:=MAT_STR_COL_KOL_MAT;
 Self.PosGridDBTableView1KOL_DOC.Caption:=MAT_STR_COL_KOL_DOC;
 Self.PosGridDBTableView1PRICE.Caption:=MAT_STR_COL_PRICE;
 Self.PosGridDBTableView1SUMMA.Caption:=MAT_STR_COL_SUMMA;
 // расставляем права
 if (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/DOC','View', false)=0) then
 begin
  Self.acDocAdd.Enabled:=false;
  Self.acDocDel.Enabled:=false;
  Self.acDocEdit.Enabled:=false;
  Self.acDocClone.Enabled:=false;
 end;

 Self.acDocPrint.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/DOC','Print', false)=0;
 Self.acDocTools.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/DOC','Work', false)=0;
 
 Self.acDocWork.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/DOC','Work', false)=0;
 Self.acDocUnWork.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/DOC','Work', false)=0;

 DocFilter:=TDocWorkFilterForm.Create(self);

 MainSplash.Free;
end;

procedure TDocWorkForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DocFormStorage.SaveFormPlacement;
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TDocWorkForm.acDocExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TDocWorkForm.acDocAddExecute(Sender: TObject);
var
 TA: TDocEditForm;
 ID_SESSION: integer;
 id_doc, id_tipd: integer;
 vals : array of Variant;
begin
 if FMode=DocMode then
  id_tipd:=0
 else
  id_tipd:=OST_ID_TIPD;
 TA:=TDocEditForm.Create(self, DBHANDLE, 0, id_tipd,0);
// TA.cxDateDoc.EditValue:=GetDateDoc;
 TA.cxUserName.Text:=_CURRENT_USER_NAME;
 TA.cxComputer.Text:=GetComputerNetName;
 TA.cxDateTime.Text:='';
 TA.GroupBox4.Enabled:=false;
 TA.GroupBox6.Visible:=false;
 TA.OperTabSheet.TabVisible:=false;
 TA.DOC_WORK_MODE:=FMode;
 TA.is_add:=1;
 if TA.ShowModal=mrOk then
  begin
   ID_SESSION:=TA.ID_SESSION;
   id_doc:=TA.ID_DOC;
   DocDataSet.CloseOpen(False);
   DocDataSet.Locate('ID_DOC', id_doc, []);
  end
 else
  if ID_SESSION>0 then begin
   ID_SESSION:=TA.ID_SESSION;
   SetLength(Vals, 1);
   Vals[0]  := ID_SESSION;
   try
    DocStoredProc.Transaction := WriteTransaction;
    DocStoredProc.Transaction.StartTransaction;
    DocStoredProc.ExecProcedure('MAT_DT_DOC_INTF_DEL', vals);
    DocStoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     DocStoredProc.Transaction.Rollback;
     exit;
    end;
  end;
 end;
 TA.Free;
end;

procedure TDocWorkForm.acDocDelExecute(Sender: TObject);
var
 vals : array of Variant;
 ndp: string;
begin
 if (_ALLOW_EDIT_OWNER=0) then
  if (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/DOC','Edit', false)<>0) then
   if DocDataSet.FieldByName('USER_NAME').AsString <> _CURRENT_USER_NAME then
   begin
    ShowMessage(MAT_STR_ERR_ACCESS_DEL);
    exit;
   end;
 if DocDataSet.IsEmpty then exit;
 ndp:=DocDataSet.FieldByName('TIPD').AsString+' N '+DocDataSet.FieldByName('NUM_DOC').AsString+' от '+DocDataSet.FieldByName('DATE_DOC').AsString;
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DOC_DELETE+chr(13)+ndp+' ?', mtConfirmation, [mbYes, mbNo]) = ID_YES then
 begin
  SetLength(Vals, 3);

  Vals[0] := DocDataSet.FieldByName('id_doc').AsInteger;
  Vals[1] := 0;
  Vals[2] := 0;
  try
   DocStoredProc.Transaction := WriteTransaction;
   DocStoredProc.Transaction.StartTransaction;
   DocStoredProc.ExecProcedure('MAT_DT_DOC_DEL', vals);
   DocStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     DocStoredProc.Transaction.Rollback;
     exit;
    end;
  end;
  DocDataSet.CloseOpen(False);
 end;
end;

procedure TDocWorkForm.acDocEditExecute(Sender: TObject);
var
 T: TDocEditForm;
 ID_SESSION: integer;
 id_doc: integer;
 Res : Variant;
 prop: string[20];
 nt, nf, n: integer;
 w: TForm;
begin
 if DocDataSet.IsEmpty then exit;
 if not DocDataSet.FieldByName('DATE_REC').IsNull then
 begin
  ShowMessage(MAT_STR_CANNOT_EDIT_WORK_DOC);
  exit;
 end;
 if DocDataSet.FieldByName('INV_KART_MODE').Value=2 then
 begin
  ShowMessage(MAT_STR_CANNOT_KART_EDIT_DOC);
  exit;
 end;
 if DocDataSet.FieldByName('MNA_KART_MODE').Value=2 then
 begin
  ShowMessage(MAT_STR_CANNOT_KART_EDIT_DOC);
  exit;
 end;
 if (_ALLOW_EDIT_OWNER=0) then
 begin
  if (MatasCheckAccess('/ROOT/MATAS/ACCOUNT/DOC','Edit', false)<>0) then
  begin
   if DocDataSet.FieldByName('USER_NAME').AsString <> _CURRENT_USER_NAME then
   begin
    ShowMessage(MAT_STR_ERR_ACCESS_EDIT);
    exit;
   end;
  end;
 end;
 w:=ShowWaitWindow(self);
 id_doc:=DocDataSet.FieldByName('ID_DOC').AsInteger;
 T:=TDocEditForm.Create(self, DBHANDLE, id_doc, 0,0 );
 T.DOC_WORK_MODE:=FMode;
 T.ID_TIPD:=DocDataSet.FieldByName('ID_TIPD').AsInteger;
 T.ID_MO_IN:=DocDataSet.FieldByName('ID_MO_IN').AsInteger;
 T.ID_MO_OUT:=DocDataSet.FieldByName('ID_MO_OUT').AsInteger;
 T.ID_CUST:=DocDataSetID_CUST.AsInt64;
 T.ID_MAN:=DocDataSet.FieldByName('ID_MAN').AsInteger;
 T.OSN_ID_TIPD:=DocDataSet.FieldByName('OSN_ID_TIPD').AsInteger;
 T.cxTipDoc.Text:=DocDataSet.FieldByName('TIPD').AsString;
 T.cxTipDoc.Enabled:=false;
 T.cxNumDoc.Text:=DocDataSet.FieldByName('NUM_DOC').AsString;
 T.cxDateDoc.EditValue:=DocDataSet.FieldByName('DATE_DOC').AsDateTime;
 T.cxTotalSum.Value:=DocDataSet.FieldByName('SUMMA').AsFloat;
 T.cxTipOsn.Text:=DocDataSet.FieldByName('OTIPD').AsString;
 T.cxNumOsn.Text:=DocDataSet.FieldByName('OSN_NUM_DOC').AsString;
 if not DocDataSet.FieldByName('OSN_DATE_DOC').IsNull then
 T.cxDateOsn.EditValue:=DocDataSet.FieldByName('OSN_DATE_DOC').AsDateTime;
 T.cxDovNum.Text:=DocDataSet.FieldByName('DOV_NUM').AsString;
 if not DocDataSet.FieldByName('DOV_DATE').IsNull then
  T.cxDovDate.EditValue:=DocDataSet.FieldByName('DOV_DATE').AsDateTime;
 T.cxManFio.Text:=DocDataSet.FieldByName('FIO_MAN').AsString;
 T.PosButtonPanel.Visible:=true;
 T.cxUserName.Text:=DocDataSet.FieldByName('USER_NAME').AsString;
 T.cxComputer.Text:=DocDataSet.FieldByName('COMPUTER').AsString;
 T.cxDateTime.Text:=DocDataSet.FieldByName('DATETIME').AsString;
 T.GroupBox4.Enabled:=false;
 T.cxNumReestr.Text:=DocDataSet.FieldByName('NUM_REESTR').AsString;
 T.cxDateReestr.EditValue:=DocDataSet.FieldByName('DATE_REESTR').AsString;
 T.cxKomissia.Text:=DocDataSet.FieldByName('KOMISSIA').AsString;
 T.cxDirKomissia.Text:=DocDataSet.FieldByName('DIR_KOMISSIA').AsString;
 T.cxNumPrikazKomissia.Text:=DocDataSet.FieldByName('NUM_PRIKAZ_KOMISSIA').AsString;
 if not DocDataSet.FieldByName('DATE_PRIKAZ_KOMISSIA').IsNull then
  T.cxDatePrikazKomissia.EditValue:=DocDataSet.FieldByName('DATE_PRIKAZ_KOMISSIA').AsDateTime;
 if DocDataSet.FieldByName('DATE_REC').IsNull then
  T.OperTabSheet.TabVisible:=false;
 T.cxDocNote.EditingText:=DocDataSet.FieldByName('DOC_NOTE').AsString;
 T.SetDocProperties;
 T.cxMoOut.Enabled:=false;
 if  T.cxCustOut.Visible then
  T.cxCustOut.Text:=DocDataSet.FieldByName('NAME_CUSTOMER').AsString;
 if T.cxCustTo.Visible then
  T.cxCustTo.Text:=DocDataSet.FieldByName('NAME_CUSTOMER').AsString;
 if T.cxMoOut.Visible then
  T.cxMoOut.Text:=DocDataSet.FieldByName('FIO_MO_OUT').AsString + ' / ' + DocDataSet.FieldByName('NAME_DEP_OUT').AsString;
 if T.cxMoTo.Visible then
  T.cxMoTo.Text:=DocDataSet.FieldByName('FIO_MO_IN').AsString + ' / ' + DocDataSet.FieldByName('NAME_DEP_IN').AsString;
  T.is_add:=0;
  T.num_doc:= DocDataSet.FieldByName('NUM_DOC').AsString;
 CloseWaitWindow(w);
 if T.ShowModal=mrOk then
 begin
  DocDataSet.CloseOpen(False);
  DocDataSet.Locate('ID_DOC', id_doc, []);
 end
 else
  ID_SESSION:=T.ID_SESSION;
  if ID_SESSION>0 then begin
   try
    DocStoredProc.Transaction := WriteTransaction;
    DocStoredProc.Transaction.StartTransaction;
    DocStoredProc.ExecProcedure('MAT_DT_DOC_INTF_DEL', [ID_SESSION]);
    DocStoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     DocStoredProc.Transaction.Rollback;
     exit;
    end;
  end;
 end;
 T.Free;
end;

procedure TDocWorkForm.acDocPrintExecute(Sender: TObject);
begin
 uPackageManager.LPrtShablon(self, DocWorkDatabase.Handle, ReadTransaction.Handle,
 DocDataSet.FieldByName('ID_TIPD').AsInteger, DocDataSet.FieldByName('id_doc').AsInteger, Shablon_doc);
end;

procedure TDocWorkForm.acDocFilterExecute(Sender: TObject);
var
 ff: TDocWorkFilterForm;
 prefix: string;
 cond: string;
 sk_cnt: Integer;
 w: TForm;
begin
 ff:=TDocWorkFilterForm.Create(self);
 ff.DBHANDLE:=Self.DBHANDLE;
 ff.Caption:=MAT_SYS_PREFIX+MAT_ACTION_FILTER_CONST;
 ff.cxFilterDateBeg.Date:=F_DATE_BEG;
 ff.cxFilterDateEnd.Date:=F_DATE_END;
 ff.cxFilterTipd.Text:=F_TIPD;
 ff.cxFilterTipd.EditValue:=F_ID_TIPD;
 ff.cxFilterMoOut.EditValue:=F_ID_MO_OUT;
 ff.cxFilterMoIn.EditValue:=F_ID_MO_IN;
 ff.cxFilterCust.EditValue:=IntToStr(F_ID_CUST);
 ff.cxFilterMoIn.Text:=F_FIO_MO_IN;
 ff.cxFilterMoOut.Text:=F_FIO_MO_OUT;
 ff.cxFilterCust.Text:=F_NAME_CUST;
 ff.cxFilterNumDoc.Text:=F_NUM_DOC;
 ff.F_ID_TIPD:=F_ID_TIPD;
 ff.F_ID_MO_IN:=F_ID_MO_IN;
 ff.F_ID_MO_OUT:=F_ID_MO_OUT;
 ff.F_ID_CUST:=F_ID_CUST;
 ff.F_TIPD:=F_TIPD;
 ff.F_FIO_MO_IN:=F_FIO_MO_IN;
 ff.F_FIO_MO_OUT:=F_FIO_MO_OUT;
 ff.F_NAME_CUST:=F_NAME_CUST;
 ff.F_DATE_BEG:=F_DATE_BEG;
 ff.F_DATE_END:=F_DATE_END;
 ff.F_NUM_DOC:=F_NUM_DOC;
 ff.cxFilterPrefix.Checked:=F_CONDITION;
 ff.F_DOC_WORK:=F_DOC_WORK;
 ff.cxFilterWorkDoc.ItemIndex:=F_DOC_WORK;
 ff.cxFilterOnSumma.Checked:=F_IS_SUMMA;
 ff.cxFilterSummaBeg.EditValue:=F_SUMMA_BEG;
 ff.cxFilterSummaEnd.EditValue:=F_SUMMA_END;
 ff.F_WORK_DATE_BEG:=F_WORK_DATE_BEG;
 ff.F_WORK_DATE_END:=F_WORK_DATE_END;
 ff.cxCheckWorkPeriod.Checked:=F_WORK_PERIOD;
 ff.FILTER_ID_SESSION:=FILTER_ID_SESSION;
 ff.F_SCH_LIST:=F_SCH_LIST;
 ff.F_OPER_PARAM:=F_OPER_PARAM;
 ff.cxSchList.Text:=F_SCH_LIST;
 ff.cxOperParamList.Text:=F_OPER_PARAM;
 ff.cxFilterNomn.Text:=F_NAME_TMC;
 ff.F_IS_NOMN:=F_IS_NOMN;
 ff.F_IS_GROUP:=F_IS_GROUP;
 ff.cxFilterGroup.Text:=F_GROUP_LIST;
 if ff.ShowModal=mrOk then
 begin
  Application.ProcessMessages;
  w:=ShowWaitWindow(self);
  if ff.cxFilterPrefix.Checked then
   cond:='OR '
  else
   cond:='AND ';
  F_CONDITION:=ff.cxFilterPrefix.Checked;
  F_ID_TIPD:=ff.F_ID_TIPD;
  F_ID_MO_IN:=ff.F_ID_MO_IN;
  F_ID_MO_OUT:=ff.F_ID_MO_OUT;
  F_ID_CUST:=ff.F_ID_CUST;
  F_TIPD:=ff.F_TIPD;
  F_FIO_MO_IN:=ff.cxFilterMoIn.Text;
  F_FIO_MO_OUT:=ff.cxFilterMoOut.Text;
  F_NAME_CUST:=ff.cxFilterCust.Text;
  F_DATE_BEG:=ff.F_DATE_BEG;
  F_DATE_END:=ff.F_DATE_END;
  F_NUM_DOC:=ff.F_NUM_DOC;
  F_DOC_WORK:=ff.F_DOC_WORK;
  F_IS_SUMMA:=ff.cxFilterOnSumma.Checked;
  F_SUMMA_BEG:=ff.cxFilterSummaBeg.EditValue;
  F_SUMMA_END:=ff.cxFilterSummaEnd.EditValue;
  F_WORK_DATE_BEG:=ff.F_WORK_DATE_BEG;
  F_WORK_DATE_END:=ff.F_WORK_DATE_END;
  F_WORK_PERIOD:=ff.cxCheckWorkPeriod.Checked;
  F_SCH_LIST:=ff.F_SCH_LIST;
  F_OPER_PARAM:=ff.F_OPER_PARAM;
  F_NAME_TMC:=AnsiUpperCase(ff.cxFilterNomn.Text);
  F_IS_NOMN:=ff.F_IS_NOMN;
  F_IS_GROUP:=ff.F_IS_GROUP;
  F_GROUP_LIST:=ff.cxFilterGroup.Text;
  FILTER_ID_SESSION:=ff.FILTER_ID_SESSION;
  cxFilterTipd.EditValue:=F_ID_TIPD;
  cxFilterDateBeg.EditValue:=F_DATE_BEG;
  cxFilterDateEnd.EditValue:=F_DATE_END;
  IsFilterSet:=True;
  prefix:='WHERE ';
  InitDocDataSet;

  if ff.cxFilterPrefix.Checked then prefix:=prefix+' (';
  if F_ID_MO_IN>0 then
  begin
   DocDataSet.SelectSQL.Add(prefix+'ID_MO_IN='+IntToStr(F_ID_MO_IN));
   prefix:=cond;
  end;
  if F_ID_MO_OUT>0 then
  begin
   DocDataSet.SelectSQL.Add(prefix+'ID_MO_OUT='+IntToStr(F_ID_MO_OUT));
   prefix:=cond;
  end;
  if F_ID_CUST>0 then
  begin
   DocDataSet.SelectSQL.Add(prefix+'ID_CUST='+IntToStr(F_ID_CUST));
   prefix:=cond;
  end;

  if ff.cxFilterPrefix.Checked then DocDataSet.SelectSQL.Add(' )');

  cond:='AND ';
  if  F_NUM_DOC<>'' then
  begin
   DocDataSet.SelectSQL.Add(prefix+'NUM_DOC LIKE '+QuotedStr(trim(F_NUM_DOC)+'%'));
   prefix:=cond;
  end;
  if  F_DOC_WORK=1 then
  begin
   if F_WORK_PERIOD then
    DocDataSet.SelectSQL.Add(prefix+'DATE_REC BETWEEN :WORK_BEG AND :WORK_END')
   else
    DocDataSet.SelectSQL.Add(prefix+'DATE_REC IS NOT NULL');
   prefix:=cond;
  end;
  if  F_DOC_WORK=2 then
  begin
   DocDataSet.SelectSQL.Add(prefix+'DATE_REC IS NULL');
   prefix:=cond;
  end;
  if F_IS_SUMMA then
  begin
   DocDataSet.SelectSQL.Add(prefix+'SUMMA BETWEEN :SUMMA_BEG AND :SUMMA_END');
  end;
  DocDataSet.SelectSQL.Add('ORDER BY DATE_DOC, TIPD, NUM_DOC');
  DocDataSet.Prepare;
  if F_IS_SUMMA then
  begin
   DocDataSet.ParamByName('SUMMA_BEG').Value:=F_SUMMA_BEG;
   DocDataSet.ParamByName('SUMMA_END').Value:=F_SUMMA_END;
  end ;
  if ((F_DOC_WORK=1) and F_WORK_PERIOD) then
  begin
   DocDataSet.ParamByName('WORK_BEG').Value:=F_WORK_DATE_BEG;
   DocDataSet.ParamByName('WORK_END').Value:=F_WORK_DATE_END;
  end;
  if F_IS_NOMN then
   DocDataSet.ParamByName('P_NAME_TMC').Value:=Null
  else begin
    if F_NAME_TMC<>'' then
      DocDataSet.ParamByName('P_NAME_TMC').Value:=AnsiUpperCase(F_NAME_TMC+'%')
    else
      DocDataSet.ParamByName('P_NAME_TMC').Value:=null;
  end;
  DocDataSet.ParamByName('DATE_BEG').Value:=F_DATE_BEG;
  DocDataSet.ParamByName('DATE_END').Value:=F_DATE_END;
  DocDataSet.ParamByName('ID_TIPD').Value:=F_ID_TIPD;
  DocDataSet.ParamByName('ID_FILTER').Value:=FILTER_ID_SESSION;
  DocDataSet.CloseOpen(false);
  DocDataSet.First;
  CloseWaitWindow(w);
 end;
 ff.Free;
end;

procedure TDocWorkForm.acDocRefreshExecute(Sender: TObject);
var
 id_doc: integer;
begin
 id_doc:=DocDataSet.FieldByName('id_doc').AsInteger;
 DocDataSet.CloseOpen(False);
 DocDataSet.Locate('ID_DOC', id_doc, []);
end;

procedure TDocWorkForm.DocDataSetCalcFields(DataSet: TDataSet);
begin
 if DocDataSetID_MO_IN.Value<>0 then
 begin
  DocDataSetNAME_IN.Value:=DocDataSetFIO_MO_IN.AsString; //+' / '+DocDataSetNAME_DEP_IN.AsString;
  if DocDataSetID_CUST.Value<>0 then
   DocDataSetNAME_OUT.Value:=DocDataSetNAME_CUSTOMER.Value;
 end;
 if DocDataSetID_MO_OUT.Value<>0 then
 begin
  DocDataSetNAME_OUT.Value:=DocDataSetFIO_MO_OUT.Value; //+' / '+DocDataSetNAME_DEP_IN.AsString;
  if DocDataSetID_CUST.Value<>0 then
   DocDataSetNAME_IN.Value:=DocDataSetNAME_CUSTOMER.Value;
 end;
 if DocDataSetDATE_REC.IsNull then
  DocDataSetPERIOD.Value:=''
 else
  DocDataSetPERIOD.Value:=IntToStr(MonthOf(DocDataSetDATE_REC.Value))+'/'+IntToStr(YearOf(DocDataSetDATE_REC.Value));
end;

procedure TDocWorkForm.FormActivate(Sender: TObject);
begin
// cxSplitter1.CloseSplitter;
end;

procedure TDocWorkForm.cxCheckPosPropertiesChange(Sender: TObject);
begin
 if cxCheckPos.Checked then
  cxSplitter1.OpenSplitter
 else
  cxSplitter1.CloseSplitter;
 ModeButton.Enabled:=cxCheckPos.Checked;
end;

procedure TDocWorkForm.cxFilterDateBegPropertiesChange(Sender: TObject);
begin
 if cxFilterDateBeg.EditText='' then
  F_DATE_BEG:=StrToDate('01.01.1900')
 else
  F_DATE_BEG:=cxFilterDateBeg.EditValue;
 DocDataSet.ParamByName('DATE_BEG').Value:=F_Date_Beg;
 DocDataSet.CloseOpen(False);
 DocDataSet.First;
end;

procedure TDocWorkForm.cxFilterDateEndPropertiesChange(Sender: TObject);
begin
 if cxFilterDateEnd.EditText='' then
  F_DATE_END:=StrToDate('01.01.9999')
 else
  F_DATE_END:=cxFilterDateEnd.EditValue;
 DocDataSet.ParamByName('DATE_END').Value:=F_Date_End;
 DocDataSet.CloseOpen(False);
 DocDataSet.First;
end;

procedure TDocWorkForm.cxLookupComboBox1PropertiesChange(Sender: TObject);
begin
 if cxFilterTipd.EditText='' then begin
  F_ID_TIPD:=0;
  F_TIPD:='';
 end
 else begin
  F_ID_TIPD:=cxFilterTipd.EditValue;
  F_TIPD:=cxFilterTipd.Text;
 end;
 DocDataSet.ParamByName('ID_TIPD').Value:=F_ID_TIPD;
 DocDataSet.CloseOpen(False);
 DocDataSet.First;
end;

procedure TDocWorkForm.acDocWorkExecute(Sender: TObject);
var
 form : TDocWorkOstBForm;
 fprov: TDocWorkProv;
 ID_DOC: Integer;
 ID_OPER: integer;
 ID_TIPD: integer;
 USE_DOG: integer;
 Res: Variant;
 work_mode: integer;
 OLD_ID_DOC: integer;
begin
 ID_DOC:=DocDataSet.FieldByName('ID_DOC').AsInteger;
 OLD_ID_DOC:=ID_DOC;

 if DocDataSet.FieldByName('KOD_DOC').AsInteger=1 then
  begin
   if DocDataSet.FieldByName('DATE_REC').IsNull then
   begin
    form := TDocWorkOstBForm.Create(self, DBHANDLE, 0, ID_DOC, DocDataSet.FieldByName('DATE_DOC').AsDateTime);
    form.ShowModal;
    form.Free;
   end else
   begin
     ShowMessage('Неможливо змінити відпрацьований документ!');
     exit;
   end
  end
 else begin
  work_mode:=1;
  if not DocDataSet.FieldByName('DATE_REC').IsNull then
  begin
   if StartOfTheMonth(DocDataSet.FieldByName('DATE_REC').Value)<>StartOfTheMonth(_MATAS_PERIOD) then
   begin
//    ShowMessage('Неможливо змінити відпрацювання в обліку документа, що було відпрацьовано в минулому або майбутньому періоді!');
//    exit;
   end;
   if agMessageDlg(MAT_STR_WARNING, 'Ви дійсно бажаєте змінити поточне відпрацювання в обліку?', mtConfirmation, [mbYes, mbNo]) = ID_YES then
   begin
   work_mode:=3;
   try
    DocStoredProc.Close;
    DocStoredProc.Transaction := WriteTransaction;
    DocStoredProc.Transaction.StartTransaction;
    DocStoredProc.StoredProcName:='MAT_DT_DOC_CLONE';
    DocStoredProc.Prepare;
    DocStoredProc.ParamByName('ID_DOC').Value:=ID_DOC;
    DocStoredProc.ExecProc;
    ID_DOC:=DocStoredProc.ParamByName('NEW_ID_DOC').Value;
    DocStoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     DocStoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   end
   else  exit;
  end;

  ID_TIPD:=DocDataSet.FieldByName('ID_TIPD').AsInteger;
 if _SHOW_OPER_FORM = 0 then
  ID_TIPD:=0;
  Res:=uSpOper.GetOper(self, DocWorkDatabase.Handle,0,ID_TIPD);
  if  VarType(Res) <> varEmpty
  then begin
   ID_OPER := Res[0];
   USE_DOG := Res[2];
  end;
  if ID_OPER >0 then
  begin
   Refresh;
   WorkDoc(self, DBHANDLE, 0, ID_DOC, DocDataSet.FieldByName('DATE_DOC').AsDateTime, ID_OPER, WORK_PERIOD, work_mode);
  end;
 end;
 DocDataSet.CloseOpen(False);
 DocDataSet.Locate('ID_DOC', ID_DOC, []);
end;

procedure TDocWorkForm.acDocUnWorkExecute(Sender: TObject);
var
 ID_DOC, i: integer;
 STRU: KERNEL_MODE_STRUCTURE;
 ErrorList: TStringList;
 DoResult: boolean;
 MSG_STRING: string;
 KEY_SESSION: INT64;
begin
 if DocDataSet.FieldByName('DATE_REC').IsNull then exit;
 id_doc:=DocDataSet.FieldByName('id_doc').AsInteger;
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_UNWORK, mtConfirmation, [mbYes, mbNo]) = ID_YES then
 begin
  if not DocDataSet.FieldByName('PUB_ID_DOC').IsNull then
  begin
   WriteTransaction.StartTransaction;
   STRU.DBHANDLE:=DocWorkDatabase.Handle;
   STRU.TRHANDLE:=WriteTransaction.Handle;
   STRU.WORKDATE:=_MATAS_PERIOD;
   STRU.KERNEL_ACTION:=2;
   STRU.KEY_SESSION:=DocWorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
   STRU.PK_ID:=StrToInt64(DocDataSet.FieldByName('PUB_ID_DOC').AsString);
   DoResult:=Kernel.KernelDo(@STRU);
   if not DoResult then
   begin
    ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
    MSG_STRING:=MAT_STR_ERR_DEL_DOC+chr(10)+chr(13);
    if ErrorList<>nil then
    begin
     for i:=0 to ErrorList.Count-1 do
      MSG_STRING:=MSG_STRING+ErrorList.Strings[i]+chr(10)+chr(13);
    end;
   end;
   WriteTransaction.Commit;
   if not DoResult then
   begin
    MSG_STRING:=MSG_STRING+'KEY_SESSION:'+IntToStr(STRU.KEY_SESSION_EX)+chr(10)+chr(13);
    ErrorDataSet.Close;
    with ErrorDataSet.SelectSQL do
    begin
     Clear;
     Add('SELECT ID_ERROR, ERROR_MESSAGE');
     Add('   FROM KERNEL_PROVS_ERRORS');
     Add('   WHERE KEY_SESSION='+IntToStr(STRU.KEY_SESSION_EX));
    end;
    ErrorDataSet.CloseOpen(true);
    ErrorDataSet.First;
    while not ErrorDataSet.Eof do
    begin
     MSG_STRING:=MSG_STRING+ErrorDataSet.FieldByName('ERROR_MESSAGE').AsString+chr(10)+chr(13);
     ErrorDataSet.Next;
    end;
    ErrorDataSet.Close;
    Showmessage(MSG_STRING);
   end;
   if DoResult then begin
    ID_DOC  := DocDataSet.FieldByName('ID_DOC').AsInteger;

    try
     DocStoredProc.Transaction := WriteTransaction;
     DocStoredProc.Transaction.StartTransaction;
     DocStoredProc.ExecProcedure('MAT_DT_DOC_UNWORK', [ID_DOC]);
     DocStoredProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      DocStoredProc.Transaction.Rollback;
      exit;
     end;
    end;
   end;
   DocDataSet.CloseOpen(False);
   DocDataSet.Locate('ID_DOC', ID_DOC, []);
  end
  else
   if not DocDataSet.FieldByName('DATE_REC').IsNull then
   begin
    ID_DOC  := DocDataSet.FieldByName('ID_DOC').AsInteger;
    try
     DocStoredProc.Transaction := WriteTransaction;
     DocStoredProc.Transaction.StartTransaction;
     DocStoredProc.ExecProcedure('MAT_DT_DOC_UNWORK', [ID_DOC]);
     DocStoredProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      DocStoredProc.Transaction.Rollback;
      exit;
     end;
    end;
    DocDataSet.CloseOpen(False);
    DocDataSet.Locate('ID_DOC', ID_DOC, []);
   end;
 end;
end;

procedure TDocWorkForm.DocMainPopupMenuPopup(Sender: TObject);
begin
 if not DocDataSet.FieldByName('DATE_REC').IsNull then
 begin
//  NDocWork.Enabled:=false;
  NDocUnWork.Enabled:=true;
 end
 else
 begin
  NDocUnWork.Enabled:=false;
  NDocWork.Enabled:=true;
 end;
 if DocDataSet.FieldByName('KOD_DOC').AsInteger<>1 then
 begin
  if NDocWork.Enabled then
   NDocWork.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/DOC','Work', false)=0;
  if NDocUnWork.Enabled then
   NDocUnWork.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/DOC','Work', false)=0;
 end;
 NPrintRep.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/DOC','Print', false)=0;
end;

procedure TDocWorkForm.cxSplitter1AfterOpen(Sender: TObject);
begin
 cxCheckPos.Checked:=True;
 ModeButton.Enabled:=cxCheckPos.Checked;
end;

procedure TDocWorkForm.cxSplitter1AfterClose(Sender: TObject);
begin
 cxCheckPos.Checked:=false;
 ModeButton.Enabled:=cxCheckPos.Checked;
end;

procedure TDocWorkForm.DocsViewDblClick(Sender: TObject);
begin
 acDocView.Execute;
end;

procedure TDocWorkForm.acDocViewExecute(Sender: TObject);
var
 T: TDocEditForm;
 ID_SESSION: integer;
 id_doc: integer;
begin
 if DocDataSet.IsEmpty then exit;
 id_doc:=DocDataSet.FieldByName('ID_DOC').AsInteger;
 ViewDoc(self, DBHANDLE,  id_Doc);
end;

procedure TDocWorkForm.ModeButtonClick(Sender: TObject);
begin
 if ViewMode=PosMode then
  ViewMode:=ProvMode
 else if ViewMode=ProvMode then
  ViewMode:=PosMode;
 ModeButton.Caption:=GetPosModeName(ViewMode);
 case ViewMode of
  PosMode: begin
            PosGrid.Visible:=true;
            PosProvGrid.Visible:=false;
           end;
  ProvMode: begin
            PosGrid.Visible:=false;
            PosProvGrid.Visible:=true;
           end;
  end;
end;

procedure TDocWorkForm.cxFooterPropertiesChange(Sender: TObject);
begin
 DocsView.OptionsView.Footer:=cxFooter.Checked;
end;

procedure TDocWorkForm.acDocReestrExecute(Sender: TObject);
var
 rep: TDocWorkReestr;
begin
 rep:=TDocWorkReestr.Create(self, DBHANDLE);
 rep.ShowModal;
 rep.free;
end;

procedure TDocWorkForm.ButtonUpDateClick(Sender: TObject);
begin
 cxFilterDateBeg.EditValue:=IncMonth(cxFilterDateBeg.EditValue,-1);
 cxFilterDateEnd.EditValue:=EndOfTheMonth(IncMonth(cxFilterDateEnd.EditValue,-1));
end;

procedure TDocWorkForm.ButtonDownDateClick(Sender: TObject);
begin
 cxFilterDateBeg.EditValue:=IncMonth(cxFilterDateBeg.EditValue,1);
 cxFilterDateEnd.EditValue:=EndOfTheMonth(IncMonth(cxFilterDateEnd.EditValue,1));
end;

procedure TDocWorkForm.OborotButtonClick(Sender: TObject);
var
 T: TDocWorkMolOborotForm;
 id: integer;
 fio: string;
begin
 if F_ID_MO_IN<>0 then begin
  id:=F_ID_MO_IN;
  fio:=F_FIO_MO_IN;
 end
 else if F_ID_MO_OUT<>0 then begin
  id:=F_ID_MO_OUT;
  fio:=F_FIO_MO_OUT;
 end
 else if DocDataSet.FieldByName('ID_MO_IN').AsInteger<>0 then begin
  id:=DocDataSet.FieldByName('ID_MO_IN').AsInteger;
  fio:=DocDataSet.FieldByName('FIO_MO_IN').AsString;
 end
 else if DocDataSet.FieldByName('ID_MO_OUT').AsInteger<>0 then begin
  id:=DocDataSet.FieldByName('ID_MO_OUT').AsInteger;
  fio:=DocDataSet.FieldByName('FIO_MO_OUT').AsString;
 end;
 T:=TDocWorkMolOborotForm.Create(self);
 T.DBHANDLE:=DBHANDLE;
 T.WorkDatabase.Handle:=DBHANDLE;
 T.ID_MO:=id;
 T.cxMatOtv.Text:=fio;
 T.WorkDataSet.ParamByName('ID_MO').Value:=id;
 T.WorkDataSet.ParamByName('DATE_BEG').Value:=F_DATE_BEG;
 T.WorkDataSet.ParamByName('DATE_END').Value:=F_DATE_END;
 T.DateBeg:=F_DATE_BEG;
 T.DateEnd:=F_DATE_END;
 T.WorkDataSet.CloseOpen(false);
 T.ShowModal;
 T.Free;
end;

procedure TDocWorkForm.acDocRepMatExecute(Sender: TObject);
var
 rep: TDocWorkPrintMatGrp;
begin
 rep:=TDocWorkPrintMatGrp.Create(self);
 rep.pFIBDatabase1.Handle:=DBHANDLE;
 rep.pFIBDatabase1.Open;
 rep.ShowModal;
 rep.free;
end;

procedure TDocWorkForm.DocsViewColumnHeaderClick(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
 DocsView.OptionsBehavior.IncSearchItem:=AColumn;
end;

procedure TDocWorkForm.FormDestroy(Sender: TObject);
begin
 DocFilter.Free;
end;

function TDocWorkForm.GetNewFilterID: Integer;
var
  OldIdSession: Integer;
begin
  OldIdSession:=FILTER_ID_SESSION;
  try
   FilterStoredProc.Transaction.StartTransaction;
   FilterStoredProc.StoredProcName:='MAT_FILTER_CLEAR';
   FilterStoredProc.Prepare;
   FilterStoredProc.ParamByName('ID_SESSION').Value:=OldIdSession;
   FilterStoredProc.ExecProc;
   FilterStoredProc.Transaction.Commit;
   except on E : Exception
   do begin
    ShowMessage(E.Message);
    FilterStoredProc.Transaction.Rollback;
    Exit;
   end;
 end;
  Result:=DocWorkDatabase.Gen_Id('MAT_ID_SESSION',1, WriteTransaction);
end;

procedure TDocWorkForm.InitDocDataSet;
begin
  DocDataSet.Close;
  DocDataSet.SelectSQL.Clear;
  DocDataSet.SelectSQL.Add('SELECT * FROM MAT_DT_DOC_SELECT(:DATE_BEG, :DATE_END, :ID_TIPD, :ID_FILTER, :P_NAME_TMC, :P_ID_USER)');
  if _USE_EXT_ACCESS_FOR_MO=1 then
  begin
    if MatasCheckAccess('/ROOT/MATAS/ACCOUNT/DOC','Work', false)=0 then
      DocDataSet.ParamByName('P_ID_USER').Value:=null
    else
      DocDataSet.ParamByName('P_ID_USER').AsInt64:=_CURRENT_USER_ID;
  end
  else
   DocDataSet.ParamByName('P_ID_USER').Value:=null;
end;

procedure TDocWorkForm.acDocToolsExecute(Sender: TObject);
begin
  acDocWorkExecute(self);
end;

procedure TDocWorkForm.acDocRepDocExecute(Sender: TObject);
var
 rep: TDocWorkPrintMatRep;
begin
 rep:=TDocWorkPrintMatRep.Create(self);
 rep.pFIBDatabase1.Handle:=DBHANDLE;
 rep.pFIBDatabase1.Open;
 rep.ShowModal;
 rep.free;
end;

procedure TDocWorkForm.actHistoryExecute(Sender: TObject);
var Form_hist:THistoryForm;
begin
if DocDataSet.IsEmpty then Exit;
Form_hist:=THistoryForm.Create(Self);
Form_hist.id:=DocDataSet.FieldValues['ID_DOC'];
Form_hist.ShowModal;
Form_hist.Free;
end;

procedure TDocWorkForm.SIBfibEventAlerter1EventAlert(Sender: TObject;
  EventName: String; EventCount: Integer);
var
 id_doc: integer;
begin
showmessage(EventName);
 id_doc:=DocDataSet.FieldByName('id_doc').AsInteger;
 DocDataSet.CloseOpen(False);
 DocDataSet.Locate('ID_DOC', id_doc, []);
end;

procedure TDocWorkForm.actPrintWorkedExecute(Sender: TObject);
var rep: TPrintWorkedForm;
begin
 rep:=TPrintWorkedForm.Create(self, DBHANDLE, cxFilterDateBeg.Date, cxFilterDateEnd.Date);

 rep.ShowModal;
 rep.free;

end;

procedure TDocWorkForm.acDocCloneExecute(Sender: TObject);
var
 TA: TDocEditForm;
 ID_SESSION: integer;
 id_doc, id_tipd: integer;
 vals : array of Variant;
begin
 id_tipd:=DocDataSetID_TIPD.AsInteger;
 TA:=TDocEditForm.Create(self, DBHANDLE, 0, id_tipd, DocDataSetID_DOC.AsInteger);
// TA.cxDateDoc.EditValue:=GetDateDoc;
 TA.cxUserName.Text:=_CURRENT_USER_NAME;
 TA.cxComputer.Text:=GetComputerNetName;
 TA.cxDateTime.Text:='';
 TA.GroupBox4.Enabled:=false;
 TA.GroupBox6.Visible:=false;
 TA.OperTabSheet.TabVisible:=false;
 TA.DOC_WORK_MODE:=FMode;
 TA.is_clone:=1;
 TA.ID_MO_IN:=DocDataSetID_MO_IN.AsInteger;
 TA.ID_MO_OUT:=DocDataSetID_MO_OUT.AsInteger;
 TA.cxDateDoc.EditValue:=DocDataSetDATE_DOC.AsDateTime;
 TA.cxTotalSum.Editvalue:= DocDataSetSUMMA.AsFloat;
 TA.ID_CUST:=DocDataSetID_CUST.AsInt64;
 if  TA.cxCustOut.Visible then
 TA.cxCustOut.Text:=DocDataSet.FieldByName('NAME_CUSTOMER').AsString;
 TA.is_add:=1;
 {// заполняем документ
try
  StPrClone.Close;
  StPrClone.Transaction := TrClone;
  StPrClone.Transaction.StartTransaction;
  StPrClone.StoredProcName:='MAT_DT_DOC_POS_INTF_ADD_CLONE';
  StPrClone.Prepare;
  StPrClone.ParamByName('ID_DOC').AsInteger:=DocDataSetID_DOC.AsInteger;
  StPrClone.ParamByName('ID_SESSION').AsInteger:= TA.ID_SESSION;
  StPrClone.ExecProc;
  StPrClone.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   StPrClone.Transaction.Rollback;
  end;
 end;
 //         }
 if TA.ShowModal=mrOk then
  begin
   ID_SESSION:=TA.ID_SESSION;
   id_doc:=TA.ID_DOC;
   DocDataSet.CloseOpen(False);
   DocDataSet.Locate('ID_DOC', id_doc, []);
  end
 else
  if ID_SESSION>0 then begin
   ID_SESSION:=TA.ID_SESSION;
   SetLength(Vals, 1);
   Vals[0]  := ID_SESSION;
   try
    DocStoredProc.Transaction := WriteTransaction;
    DocStoredProc.Transaction.StartTransaction;
    DocStoredProc.ExecProcedure('MAT_DT_DOC_INTF_DEL', vals);
    DocStoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     DocStoredProc.Transaction.Rollback;
     exit;
    end;
  end;
 end;
 TA.Free;
end;

procedure TDocWorkForm.actFiltrNomnExecute(Sender: TObject);
var rep: TFilterNomnForm;
begin
 rep:=TFilterNomnForm.Create(self, DBHANDLE, cxFilterDateBeg.Date, cxFilterDateEnd.Date);

 rep.ShowModal;
 rep.free;

end;

end.
