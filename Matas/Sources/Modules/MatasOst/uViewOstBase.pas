{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль просмотра остатков и оборотов                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uViewOstBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxMaskEdit, cxButtonEdit,
  Buttons, cxContainer, cxTextEdit, cxDBEdit, StdCtrls, ExtCtrls,
  cxGridTableView, FIBDataSet, pFIBDataSet, cxGridLevel, ibase,
  cxLookAndFeelPainters, ImgList, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, pFIBStoredProc, Menus, cxButtons, cxSpinEdit, cxDropDownEdit,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, uSpMatOtv, uPackageManager, uMatasVars,
  uSpMatSchEx, uSpMatSchMulti, uMatasUtils, cxSplitter, DateUtils,
  Placemnt, cxCheckBox, ActnList, frxClass,
  frxDBSet, frxDesgn, frxExportHTML, frxExportPDF, frxExportRTF,
  frxExportXML;

type
  TOstBaseForm = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_OST: TcxGridDBColumn;
    cxGrid1DBTableView1ID_MO: TcxGridDBColumn;
    cxGrid1DBTableView1FIO: TcxGridDBColumn;
    cxGrid1DBTableView1SFIO: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_DEPARTMENT: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1ID_NOMN: TcxGridDBColumn;
    cxGrid1DBTableView1ID_UNIT: TcxGridDBColumn;
    cxGrid1DBTableView1UNIT: TcxGridDBColumn;
    cxGrid1DBTableView1KOL_MAT: TcxGridDBColumn;
    cxGrid1DBTableView1PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1ID_PRH: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DocOstDataSet: TpFIBDataSet;
    DocOstDataSource: TDataSource;
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
    cxGrid1DBTableView1SCH2: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    NAdd: TMenuItem;
    NEdit: TMenuItem;
    NDel: TMenuItem;
    WorkProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    ImageList1: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    cxGrid1DBTableView1SCH: TcxGridDBColumn;
    OstDatabase: TpFIBDatabase;
    cxSplitterInfo: TcxSplitter;
    IstfinDataSet: TpFIBDataSet;
    IstfinDataSetISTFIN_ID_SM: TFIBBCDField;
    IstfinDataSetISTFIN_SM_TITLE: TFIBStringField;
    IstfinDataSetISTFIN_SM_KOD: TFIBIntegerField;
    IstfinDataSetISTFIN_ID_RZ: TFIBBCDField;
    IstfinDataSetISTFIN_RZ_TITLE: TFIBStringField;
    IstfinDataSetISTFIN_RZ_KOD: TFIBIntegerField;
    IstfinDataSetISTFIN_ID_ST: TFIBBCDField;
    IstfinDataSetISTFIN_ST_TITLE: TFIBStringField;
    IstfinDataSetISTFIN_ST_KOD: TFIBIntegerField;
    IstfinDataSetISTFIN_ID_KEKV: TFIBBCDField;
    IstfinDataSetISTFIN_KEKV_TITLE: TFIBStringField;
    IstfinDataSetISTFIN_KEKV_KOD: TFIBIntegerField;
    IstfinDataSetISTFIN_STR: TFIBStringField;
    IstfinDataSetISTFIN_PERCENT: TFIBBCDField;
    IstfinDataSource: TDataSource;
    Panel1: TPanel;
    LabelMol: TLabel;
    LabelSch: TLabel;
    cxMatOtv: TcxButtonEdit;
    ApplyButton: TcxButton;
    PrintButton: TcxButton;
    ExitButton: TcxButton;
    cxLookupSch: TcxButtonEdit;
    FilterButton: TcxButton;
    IstfinDataSetISTFIN_ID: TFIBBCDField;
    N3: TMenuItem;
    NRefresh: TMenuItem;
    N4: TMenuItem;
    NInvKart: TMenuItem;
    DocOstDataSetID_OST: TFIBBCDField;
    DocOstDataSetID_OST_CUR: TFIBBCDField;
    DocOstDataSetID_MO: TFIBBCDField;
    DocOstDataSetFIO: TFIBStringField;
    DocOstDataSetSFIO: TFIBStringField;
    DocOstDataSetNAME_DEPARTMENT: TFIBStringField;
    DocOstDataSetID_SCH: TFIBBCDField;
    DocOstDataSetID_NOMN: TFIBBCDField;
    DocOstDataSetNOMN: TFIBStringField;
    DocOstDataSetLINKTO: TFIBBCDField;
    DocOstDataSetNAME: TFIBStringField;
    DocOstDataSetID_UNIT: TFIBBCDField;
    DocOstDataSetUNIT: TFIBStringField;
    DocOstDataSetKOL_MAT: TFIBBCDField;
    DocOstDataSetPRICE: TFIBBCDField;
    DocOstDataSetSUMMA: TFIBBCDField;
    DocOstDataSetID_DOC: TFIBBCDField;
    DocOstDataSetID_DOC_PRH: TFIBBCDField;
    DocOstDataSetSCH_NUMBER: TFIBStringField;
    DocOstDataSetNAME_SCH: TFIBStringField;
    DocOstDataSetBAL_ID_SCH: TFIBBCDField;
    DocOstDataSetBAL_SCH_NUMBER: TFIBStringField;
    DocOstDataSetBAL_SCH_TITLE: TFIBStringField;
    DocOstDataSetDOC_ID_TIPD: TFIBBCDField;
    DocOstDataSetDOC_TIPD: TFIBStringField;
    DocOstDataSetDOC_NAME_TIPD: TFIBStringField;
    DocOstDataSetDOC_NUM_DOC: TFIBStringField;
    DocOstDataSetDOC_DATE_DOC: TFIBDateField;
    DocOstDataSetDOC_OSN_ID_TIPD: TFIBBCDField;
    DocOstDataSetDOC_OTIPD: TFIBStringField;
    DocOstDataSetDOC_NAME_OSN: TFIBStringField;
    DocOstDataSetDOC_OSN_NUM_DOC: TFIBStringField;
    DocOstDataSetDOC_OSN_DATE_DOC: TFIBDateField;
    DocOstDataSetDOC_ID_MO_IN: TFIBIntegerField;
    DocOstDataSetDOC_FIO_MO_IN: TFIBStringField;
    DocOstDataSetDOC_FIO_IN: TFIBStringField;
    DocOstDataSetDOC_NAME_DEP_IN: TFIBStringField;
    DocOstDataSetDOC_ID_MO_OUT: TFIBIntegerField;
    DocOstDataSetDOC_FIO_MO_OUT: TFIBStringField;
    DocOstDataSetDOC_FIO_OUT: TFIBStringField;
    DocOstDataSetDOC_NAME_DEP_OUT: TFIBStringField;
    DocOstDataSetDOC_ID_CUST: TFIBIntegerField;
    DocOstDataSetDOC_NAME_CUSTOMER: TFIBStringField;
    DocOstDataSetDOC_SUMMA: TFIBBCDField;
    DocOstDataSetDOC_DATE_REC: TFIBDateField;
    DocOstDataSetINV_ACC: TFIBIntegerField;
    DocOstDataSetNAME_IN: TStringField;
    DocOstDataSetNAME_OUT: TStringField;
    DocOstDataSetDOC_PERIOD: TStringField;
    ReportDataSet: TpFIBDataSet;
    ReportDataSetID_OST: TFIBBCDField;
    ReportDataSetID_MO: TFIBBCDField;
    ReportDataSetFIO: TFIBStringField;
    ReportDataSetSFIO: TFIBStringField;
    ReportDataSetNAME_DEPARTMENT: TFIBStringField;
    ReportDataSetID_SCH: TFIBBCDField;
    ReportDataSetGROUP_ID_SCH: TFIBBCDField;
    ReportDataSetGROUP_SCH_NUMBER: TFIBStringField;
    ReportDataSetGROUP_SCH_TITLE: TFIBStringField;
    ReportDataSetID_NOMN: TFIBBCDField;
    ReportDataSetNOMN: TFIBStringField;
    ReportDataSetLINKTO: TFIBBCDField;
    ReportDataSetNAME: TFIBStringField;
    ReportDataSetID_UNIT: TFIBIntegerField;
    ReportDataSetUNIT: TFIBStringField;
    ReportDataSetKOL_MAT: TFIBBCDField;
    ReportDataSetPRICE: TFIBBCDField;
    ReportDataSetSUMMA: TFIBBCDField;
    ReportDataSetID_DOC: TFIBBCDField;
    ReportDataSetSCH_NUMBER: TFIBStringField;
    ReportDataSetNAME_SCH: TFIBStringField;
    ReportDataSetDATE_OPR: TFIBDateField;
    ReportDataSetDATE_EXPL: TFIBDateField;
    ReportDataSetBEG_PRICE: TFIBBCDField;
    ReportDataSetOST_PRICE: TFIBBCDField;
    ReportDataSetOST_IZNOS: TFIBBCDField;
    ReportDataSetINVNOM: TFIBStringField;
    ReportDataSetZAVNUM: TFIBStringField;
    DocOstDataSetCHECKED: TFIBIntegerField;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    ReadTransaction: TpFIBTransaction;
    WorkQuery: TpFIBQuery;
    OstFormStorage: TFormStorage;
    MainActionList: TActionList;
    acShow: TAction;
    acFilter: TAction;
    acPrint: TAction;
    acExit: TAction;
    acFields: TAction;
    acExport: TAction;
    N5: TMenuItem;
    Export1: TMenuItem;
    DocOstDataSetKOD_SYSTEM: TFIBIntegerField;
    Label3: TLabel;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frReport: TfrxReport;
    frxDBDataset2: TfrxDBDataset;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    acPrint1: TMenuItem;
    N6: TMenuItem;
    PanelInfo: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1ISTFIN_ID_SM: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_SM_TITLE: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_SM_KOD: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ID_RZ: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_RZ_TITLE: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_RZ_KOD: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ID_ST: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ST_TITLE: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ST_KOD: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ID_KEKV: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_KEKV_TITLE: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_KEKV_KOD: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_STR: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_PERCENT: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    PopupMenu2: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    acAdd: TAction;
    acChange: TAction;
    acDel: TAction;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    ActionList: TActionList;
    acAddB: TAction;
    acChangeB: TAction;
    acDelB: TAction;
    IstfinDataSetSUMMA: TFIBBCDField;
    cxGrid2DBTableView1Summa: TcxGridDBColumn;
    procedure cxMatOtvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure N2Click(Sender: TObject);
    procedure cxMatOtvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DocOstDataSetCalcFields(DataSet: TDataSet);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure NInvKartClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure OstFilterCheck;
    procedure acExitExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure acShowExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acFieldsExecute(Sender: TObject);
    procedure acExportExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acChangeExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure acAddBExecute(Sender: TObject);
    procedure acChangeBExecute(Sender: TObject);
    procedure acDelBExecute(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   ID_MO: integer;
   ID_SCH: integer;
   PERIOD: TDateTime;
   F_LINKTO, F_ID_NOMN: integer;
   F_NAME_TMC, F_GROUP_TMC: string;
   TIP_SCH: integer;
   F_SORT: string;
   F_SCH: boolean;
   F_SELECT: boolean;
   FILTER_ID_SESSION: integer;
   PRINT_ID_SESSION: integer;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;

  procedure ShowOstBase(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
  exports ShowOstBase;

var
  OstBaseForm: TOstBaseForm;

implementation

uses uPrnForm, uEditOstBase, uViewOstFilter, uViewOstInvKart, uViewOstMnaKart;
{$R *.dfm}

procedure ShowOstBase(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 TOstBaseForm.Create(AOwner, DBHANDLE, aID_USER);
end;

constructor TOstBaseForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.ID_USER:=ID_USER;
   Self.OstDatabase.Handle:=DBHANDLE;
   Self.WriteTransaction.StartTransaction;
   Self.TIP_SCH:=1;
   Self.F_SORT:='ORDER BY FIO, SCH_NUMBER, NAME';
   Self.F_SCH:=false;
   Self.F_SELECT:=false;
 end;
end;

procedure TOstBaseForm.cxMatOtvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  FioMO, SpodrMO: string;
  IsMoOk: boolean;
 dm, dy: Word;
begin
//  dy:=cxYear.Value;
//  dm:=cxMonth.ItemIndex+1;
  PERIOD:=StartOfTheMonth(_MATAS_OST_PERIOD);
  IsMoOk:=false;
  Res:=uSpMatOtv.GetMatOtv(self, DBHandle, 0, ID_MO);
  if  VarType(Res) <> varEmpty
   then begin
    ID_MO:=Res[0];
    FioMO := Res[1];
    SpodrMO := Res[2];
    IsMoOk:=true;
  end;
  if IsMoOk then
  begin
   cxMatOtv.Text:=FioMO+' / '+SpodrMO;
   acShow.Execute;
  end;
end;

procedure TOstBaseForm.FormCreate(Sender: TObject);
var
  dd, dm, dy: Word;
begin
 Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_OSTB;
 OstFormStorage.RestoreFormPlacement;
 try
  Width:=OstFormStorage.StoredValue['FormWidth'];
  Height:=OstFormStorage.StoredValue['FormHeight'];
 except
  Width:=750;
  Height:=500;
 end;
 if Width<200 then Width:=750;
 if Height<100 then Height:=500;
 ID_MO:=0;
 ID_SCH:=0;
 F_ID_NOMN:=0;
 F_LINKTO:=0;
 PERIOD:=StartOfTheMonth(_MATAS_OST_PERIOD);
// DecodeDate(PERIOD, dy, dm, dd);
// LoadMonthTocxComboBox(cxMonth);
// cxMonth.ItemIndex:=dm-1;
// cxYear.Value:=dy;
 LabelMol.Caption:=MAT_STR_COL_MOL;
// LabelPeriod.Caption:=MAT_STR_COL_PERIOD;
 LabelSch.Caption:=MAT_STR_COL_SCH;
 acShow.Caption:=MAT_BUTTON_SHOW_CONST;
 acPrint.Caption:=MAT_ACTION_PRINT_CONST;
 acExit.Caption:=MAT_ACTION_CLOSE_CONST;
 acFilter.Caption:=MAT_ACTION_FILTER_CONST;
 cxGrid1DBTableView1SCH.Caption:=MAT_STR_COL_SCH;
 cxGrid1DBTableView1NAME.Caption:=MAT_STR_COL_NAME_TMC;
 cxGrid1DBTableView1UNIT.Caption:=MAT_STR_COL_NAME_UNIT;
 cxGrid1DBTableView1KOL_MAT.Caption:=MAT_STR_COL_KOL_MAT;
 cxGrid1DBTableView1PRICE.Caption:=MAT_STR_COL_PRICE;
 cxGrid1DBTableView1SUMMA.Caption:=MAT_STR_COL_SUMMA;
 cxGrid2DBTableView1ISTFIN_STR.Caption:=MAT_STR_COL_ISTFIN;
 cxGrid2DBTableView1ISTFIN_PERCENT.Caption:=MAT_STR_COL_PERCENT;
 NAdd.Caption:=MAT_ACTION_ADD_CONST;
 NDel.Caption:=MAT_ACTION_DELETE_CONST;
 NEdit.Caption:=MAT_ACTION_UPDATE_CONST;
 N2.Caption:=MAT_STR_CORRECT_OST_CUR;
 NRefresh.Caption:=MAT_ACTION_REFRESH_CONST;
 NInvKart.Caption:=MAT_STR_COL_INV_NUMS;
 acExport.Caption:=MAT_ACTION_EXPORT_CONST;
 PRINT_ID_SESSION:=OstDatabase.Gen_Id('MAT_ID_SESSION',1, WriteTransaction);
end;

procedure TOstBaseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 OstFormStorage.StoredValue['FormWidth']:=Width;
 OstFormStorage.StoredValue['FormHeight']:=Height;
 OstFormStorage.SaveFormPlacement;
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TOstBaseForm.cxLookupSchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  F_SCH:=false;
  FILTER_ID_SESSION:=0;
 end
end;

procedure TOstBaseForm.cxLookupSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 if FILTER_ID_SESSION=0 then
  FILTER_ID_SESSION:=OstDatabase.Gen_Id('MAT_ID_SESSION',1, WriteTransaction);

 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxLookupSch.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  FILTER_ID_SESSION:=0;
  cxLookupSch.Text:='';
 end;
 acShowExecute(self);
end;

procedure TOstBaseForm.N2Click(Sender: TObject);
begin
 if ID_MO<=0 then exit;
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_CORRECT_OST, mtConfirmation, [mbYes, mbNo]) = ID_YES then
 begin
   try
    WorkProc.Close;
    WorkProc.Transaction := WriteTransaction;
    WorkProc.Transaction.StartTransaction;
    WorkProc.StoredProcName:='MAT_MOVE_OST_BASE_TO_CUR';
    WorkProc.Prepare;
    WorkProc.ExecProcedure('MAT_MOVE_OST_BASE_TO_CUR',[ID_MO, PERIOD]);
    WorkProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkProc.Transaction.Rollback;
     exit;
    end;
   end;
  end;
end;

procedure TOstBaseForm.cxMatOtvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxMatOtv.Text:='';
  ID_MO:=0;
  DocOstDataSet.Close;
 end;
end;

procedure TOstBaseForm.DocOstDataSetCalcFields(DataSet: TDataSet);
begin
 if DocOstDataSetDOC_ID_MO_IN.Value<>0 then
 begin
  DocOstDataSetNAME_IN.Value:=DocOstDataSetDOC_FIO_MO_IN.Value;
  if DocOstDataSetDOC_ID_CUST.Value<>0 then
   DocOstDataSetNAME_OUT.Value:=DocOstDataSetDOC_NAME_CUSTOMER.Value;
 end;
 if DocOstDataSetDOC_ID_MO_OUT.Value<>0 then
 begin
  DocOstDataSetNAME_OUT.Value:=DocOstDataSetDOC_FIO_MO_OUT.Value;
  if DocOstDataSetDOC_ID_CUST.Value<>0 then
   DocOstDataSetNAME_IN.Value:=DocOstDataSetDOC_NAME_CUSTOMER.Value;
 end;
 if DocOstDataSetDOC_DATE_REC.IsNull then
  DocOstDataSetDOC_PERIOD.Value:=''
 else
  DocOstDataSetDOC_PERIOD.Value:=IntToStr(MonthOf(DocOstDataSetDOC_DATE_REC.Value))+'/'+IntToStr(YearOf(DocOstDataSetDOC_DATE_REC.Value));
end;

procedure TOstBaseForm.cxDBButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
 uPackageManager.ViewDoc(self, DBHANDLE, DocOstDataSet.FieldByName('ID_DOC_PRH').AsInteger);
end;

procedure TOstBaseForm.NInvKartClick(Sender: TObject);
var
 T: TOstInvKartForm;
 M: TOstMnaKartForm;
begin
 if DocOstDataSet.FieldByName('KOD_SYSTEM').AsInteger=_KOD_SYSTEM_OS then
 begin
  T:=TOstInvKartForm.Create(self);
  T.KartDataSet.ParamByName('ID_POS').Value:=0;
  T.KartDataSet.ParamByName('ID_OST').Value:=DocOstDataSet.FieldByName('ID_OST_CUR').AsInteger;
  T.KartDataSet.CloseOpen(false);
  T.ShowModal;
  T.Free;
 end;
 if (DocOstDataSet.FieldByName('KOD_SYSTEM').AsInteger=_KOD_SYSTEM_MNA) or
  (DocOstDataSet.FieldByName('KOD_SYSTEM').AsInteger=_KOD_SYSTEM_MBP) then
 begin
  M:=TOstMnaKartForm.Create(self);
  M.KartDataSet.ParamByName('ID_POS').Value:=0;
  M.KartDataSet.ParamByName('ID_OST').Value:=DocOstDataSet.FieldByName('ID_OST_CUR').AsInteger;
  M.KartDataSet.CloseOpen(false);
  M.ShowModal;
  M.Free;
 end;
end;

procedure TOstBaseForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_SPACE then OstFilterCheck;
end;

procedure TOstBaseForm.OstFilterCheck;
begin
   try
    WriteTransaction.StartTransaction;
    WorkProc.StoredProcName:='MAT_FILTER_CHECK';
    WorkProc.Prepare;
    WorkProc.ParamByName('ID_SESSION').AsInt64:=PRINT_ID_SESSION;
    WorkProc.ParamByName('ID_KEY').AsInt64:=DocOstDataSet.FieldByName('ID_OST').AsInteger;
    WorkProc.ParamByName('ID_OBJECT').Value:=20;
    WorkProc.ExecProc;
    WriteTransaction.Commit;
   except on E : Exception
    do begin
     WriteTransaction.Rollback;
     ShowMessage(E.Message);
    end;
   end;
   DocOstDataSet.Refresh;
   DocOstDataSet.Next;
end;

procedure TOstBaseForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
 ARect: TRect;
begin
  Arect:=AViewInfo.Bounds;
  if (AViewInfo.GridRecord.Values[0] = 1)  then
  begin
      ACanvas.Canvas.Font.Color := clRed;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TOstBaseForm.acExitExecute(Sender: TObject);
begin
 WorkQuery.Close;
 WorkQuery.SQL.Clear;
 WorkQuery.SQL.Add('DELETE FROM MAT_TMP_FILTER WHERE ID_SESSION='+IntToStr(PRINT_ID_SESSION));
 WorkQuery.SQL.Add('OR ID_SESSION='+IntToStr(FILTER_ID_SESSION));
 try
  WorkQuery.Transaction := WriteTransaction;
  WorkQuery.Transaction.StartTransaction;
  WorkQuery.ExecQuery;
  WorkQuery.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkQuery.Transaction.Rollback;
     exit;
   end;
 end;
 Close;
end;

procedure TOstBaseForm.acFilterExecute(Sender: TObject);
var
 F: TOstFilterForm;
begin
 F:=TOstFilterForm.Create(self);
 F.DBHandle:=DBHANDLE;
 F.F_ID_NOMN:=F_ID_NOMN;
 F.F_LINKTO:=F_LINKTO;
 F.cxNOMN.Text:=F_NAME_TMC;
 F.cxLINKTO.Text:=F_GROUP_TMC;
 if F.ShowModal=mrOk then
 begin
  F_ID_NOMN:=F.F_ID_NOMN;
  F_LINKTO:=F.F_LINKTO;
  F_NAME_TMC:=F.cxNOMN.Text;
  if F.cxCheckSubstr.Checked then
   F_NAME_TMC:='%'+F_NAME_TMC;
  F_GROUP_TMC:=F.cxLINKTO.Text;
  acShowExecute(self);
 end;
 F.Free;
end;

procedure TOstBaseForm.acShowExecute(Sender: TObject);
var
 dm, dy: Word;
 prefix: string;
 w: TForm;
begin
  if not(ID_MO>0) then
   begin
     Showmessage('Выберите мат. ответственного!');
     Exit;
   end;
 w:=ShowWaitWindow(self);
 prefix:='WHERE';
// dy:=cxYear.Value;
// dm:=cxMonth.ItemIndex+1;
// PERIOD:=EncodeDate(dy, dm, 1);
 DocOstDataSet.Close;
 DocOstDataSet.SelectSQL.Clear;
 DocOstDataSet.SelectSQL.Add('SELECT * FROM MAT_SEL_MO_OST_BASE(:ID_MO, :PERIOD, :PID_SESSION, :FLAG)') ;
 if F_LINKTO>0 then
 begin
  DocOstDataSet.SelectSQL.Add(prefix+' LINKTO=:LINKTO');
  prefix:='AND';
 end;
 if F_ID_NOMN>0 then
 begin
  DocOstDataSet.SelectSQL.Add(prefix+' ID_NOMN=:NOMN');
  prefix:='AND';
 end;
 if (F_ID_NOMN=0) and (F_NAME_TMC<>'') then
 begin
  DocOstDataSet.SelectSQL.Add(prefix+' NAME LIKE :NAME');
  prefix:='AND';
 end;
 if F_SCH then
 begin
  DocOstDataSet.SelectSQL.Add(prefix+'( ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
  DocOstDataSet.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
  prefix:='AND';
 end;
 if F_SELECT then
 begin
  DocOstDataSet.SelectSQL.Add(prefix+' CHECKED=1');
  prefix:='AND';
 end;
 DocOstDataSet.Prepare;
 DocOstDataSet.ParamByName('ID_MO').Value:=ID_MO;
 DocOstDataSet.ParamByName('PERIOD').Value:=PERIOD;
 DocOstDataSet.ParamByName('PID_SESSION').Value:=PRINT_ID_SESSION;
 
 if F_LINKTO>0 then
  DocOstDataSet.ParamByName('LINKTO').Value:=F_LINKTO;
 if F_ID_NOMN>0 then
  DocOstDataSet.ParamByName('NOMN').Value:=F_ID_NOMN;
 if ID_SCH>0 then
  DocOstDataSet.ParamByName('ID_SCH').Value:=ID_SCH;
 if (F_ID_NOMN=0) and (F_NAME_TMC<>'') then
  DocOstDataSet.ParamByName('NAME').Value:=F_NAME_TMC+'%';
 DocOstDataSet.SelectSQL.Add(F_SORT);
 DocOstDataSet.CloseOpen(false);
 IstfinDataSet.CloseOpen(false);
  cxGrid1DBTableView1.ViewData.Expand(true);
  CloseWaitWindow(w);
end;

procedure TOstBaseForm.acPrintExecute(Sender: TObject);
var
 fp : TPrintForm;
 id: integer;
 prefix: string;
begin
 if DocOstDataSet.IsEmpty then Exit;
 fp:=TPrintForm.Create(self);
 fp.DBHANDLE:=DBHANDLE;
 if fp.ShowModal = mrOk then
 begin
  id:=DocOstDataSet.FieldByName('ID_OST').Value;
  DocOstDataSource.Enabled:=false;
  F_SELECT:=fp.cxPrintSelected.Checked;

  if fp.cxPrintForm.ItemIndex=0 then begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\OstBase.fr3');
   acShowExecute(self);
  end;

  if fp.cxPrintForm.ItemIndex=1 then begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\OstBaseSchMol.fr3');
   F_SORT:='ORDER BY SCH_NUMBER, FIO, NAME';
   acShowExecute(self);
  end;

  if fp.cxPrintForm.ItemIndex=2 then begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\OstBaseMolSch.fr3');
   F_SORT:='ORDER BY FIO, SCH_NUMBER, NAME';
   acShowExecute(self);
  end;

  if fp.cxPrintForm.ItemIndex=3 then begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\OstBaseBschMol.fr3');
   F_SORT:='ORDER BY BAL_SCH_NUMBER, SCH_NUMBER, FIO, NAME';
   acShowExecute(self);
  end;

  if fp.cxPrintForm.ItemIndex=4 then begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\OstBaseMolBsch.fr3');
   F_SORT:='ORDER BY FIO, BAL_SCH_NUMBER, SCH_NUMBER, NAME';
   acShowExecute(self);
  end;

   if fp.cxPrintForm.ItemIndex=8 then begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\InvVedDragMet.fr3');
   F_SORT:='ORDER BY FIO, BAL_SCH_NUMBER, SCH_NUMBER, NAME';
   acShowExecute(self);
  end;


  if fp.cxPrintForm.ItemIndex=5 then
  begin
   prefix:='WHERE ';
   ReportDataSet.Close;
   with ReportDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT * FROM MAT_MAKE_INV_VED(:ID_MO, :PDATE)');
    if F_SCH then
    begin
     Add(prefix+' (ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
     Add('OR GROUP_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
     prefix:='AND ';
    end;
    if F_SELECT then
    begin
     Add(prefix+' ID_OST IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=20 AND ID_SESSION='+IntToStr(PRINT_ID_SESSION)+')');
     prefix:='AND ';
    end;
    Add('ORDER BY GROUP_SCH_NUMBER, SCH_NUMBER, NAME, ID_OST, INVNOM');
   end;
   ReportDataSet.Prepare;
   ReportDataSet.ParamByName('ID_MO').Value:=ID_MO;
   ReportDataSet.ParamByName('PDATE').Value:=PERIOD;
   ReportDataSet.CloseOpen(false);
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\OstInv.fr3');
  end;

  if fp.cxPrintForm.ItemIndex=6 then
  begin
   prefix:='WHERE ';
   ReportDataSet.Close;
   with ReportDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT * FROM MAT_MAKE_INV_VED(:ID_MO, :PDATE)');
    if F_SCH then
    begin
     Add(prefix+' (ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
     Add('OR GROUP_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
     prefix:='AND ';
    end;
    if F_SELECT then
    begin
     Add(prefix+' ID_OST IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=20 AND ID_SESSION='+IntToStr(PRINT_ID_SESSION)+')');
     prefix:='AND ';
    end;
    Add('ORDER BY GROUP_SCH_NUMBER, NAME, ID_OST, INVNOM');
   end;
   ReportDataSet.Prepare;
   ReportDataSet.ParamByName('ID_MO').Value:=ID_MO;
   ReportDataSet.ParamByName('PDATE').Value:=PERIOD;
   ReportDataSet.CloseOpen(false);
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\InvVed2.fr3');
  end;

  if fp.cxPrintForm.ItemIndex=7 then
  begin
   prefix:='WHERE ';
   ReportDataSet.Close;
   with ReportDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT * FROM MAT_MAKE_INV_VED2(:ID_MO, :PDATE)');
    if F_SCH then
    begin
     Add(prefix+' (ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
     Add('OR GROUP_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
     prefix:='AND ';
    end;
    if F_SELECT then
    begin
     Add(prefix+' ID_OST IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=20 AND ID_SESSION='+IntToStr(PRINT_ID_SESSION)+')');
     prefix:='AND ';
    end;
    Add('ORDER BY GROUP_SCH_NUMBER, SCH_NUMBER, NAME, ID_OST, INVNOM');
   end;
   ReportDataSet.Prepare;
   ReportDataSet.ParamByName('ID_MO').Value:=ID_MO;
   ReportDataSet.ParamByName('PDATE').Value:=PERIOD;
   ReportDataSet.CloseOpen(false);
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\InvVed3.fr3');
  end;

  if not DocOstDataSet.IsEmpty then
  begin
    frReport.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
    frReport.Variables['ORG_SHORT_NAME']:=''''+_ORG_SHORT_NAME+'''';
    frReport.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
    frReport.Variables['PERIOD']:=''''+DateToStr(PERIOD)+'''';

    frReport.PrepareReport;
    if fp.cxCopies.Value>1 then
      frReport.PrintOptions.Copies:=fp.cxCopies.Value;
      frReport.PrintOptions.ShowDialog:=fp.cxSelectPrinter.Checked;
      if fp.cxCheckOnPrinter.Checked then
        frReport.Print
      else
        frReport.ShowReport;
      if fp.cxCheckEdit.Checked then
      frReport.DesignReport;
  end;

  F_SORT:='ORDER BY FIO, SCH_NUMBER, NAME';
  F_SELECT:=false;
  acShowExecute(self);
  DocOstDataSource.Enabled:=true;
  DocOstDataSet.Locate('ID_OST', id, []);
 end;
 fp.Free;
end;

procedure TOstBaseForm.acFieldsExecute(Sender: TObject);
begin
 ShowDataSetFields(self, DocOstDataSet);
end;

procedure TOstBaseForm.acExportExecute(Sender: TObject);
begin
 ExportDataSet(self, DocOstDataSet);
end;

procedure TOstBaseForm.acAddExecute(Sender: TObject);
var
 f: TEditOstBaseForm;
 vals: array of Variant;
 ID_OST: integer;
 ID_OST_CUR:Integer;
begin
 if ID_MO<=0 then exit;
 f:=TEditOstBaseForm.Create(self);
 f.DBHANDLE:=DBHANDLE;
 if f.ShowModal=mrOk then
 begin
  try
    SetLength(Vals, 8);
    Vals[0] := PERIOD;
    Vals[1] := ID_MO;
    Vals[2] := f.ID_NOMN;
    Vals[3] := f.ID_SCH;
    Vals[4] := f.ID_UNIT;
    Vals[5] := f.cxKolMat.Value;
    Vals[6] := f.cxPrice.Value;
    Vals[7] := f.cxSumma.Value;
    WorkProc.Close;
    WorkProc.Transaction := WriteTransaction;
    WorkProc.Transaction.StartTransaction;
    WorkProc.StoredProcName:='MAT_DT_OST_BASE_INS';
    WorkProc.Prepare;
    WorkProc.ExecProcedure('MAT_DT_OST_BASE_INS', Vals);
    WorkProc.Transaction.Commit;
    ID_OST:=WorkProc.ParamByName('ID_OST').AsInteger;
    ID_OST_CUR:=WorkProc.ParamByName('ID_OST_CUR').AsInteger;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkProc.Transaction.Rollback;
     exit;
    end;
   end;

   try
    SetLength(Vals, 6);
    Vals[0] := ID_OST_CUR;
    Vals[1] := F.ID_SM;
    Vals[2] := f.ID_RZ;
    Vals[3] := f.ID_ST;
    Vals[4] := f.ID_KEKV;
    Vals[5] := f.cxSumma.Value;
    WorkProc.Close;
    WorkProc.Transaction:= WriteTransaction;
    WorkProc.Transaction.StartTransaction;
    WorkProc.StoredProcName:='MAT_DT_OST_ISTFIN_INS ';
    WorkProc.Prepare;
    WorkProc.ExecProcedure('MAT_DT_OST_ISTFIN_INS', Vals);
    WorkProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkProc.Transaction.Rollback;
     exit;
    end;
   end;
   DocOstDataSet.CloseOpen(False);
   DocOstDataSet.Locate('ID_OST', ID_OST, []);
 end;
 f.Free;

end;

procedure TOstBaseForm.acChangeExecute(Sender: TObject);
var
 fe: TEditOstBaseForm;
 vals: array of Variant;
begin
 if DocOstDataSet.IsEmpty then
  exit;
 fe:=TEditOstBaseForm.Create(self);
 fe.ID_NOMN:=DocOstDataSet.FieldByName('ID_NOMN').AsInteger;
 fe.ID_UNIT:=DocOstDataSet.FieldByName('ID_UNIT').AsInteger;
 fe.ID_SCH:=DocOstDataSet.FieldByName('ID_SCH').AsInteger;
 fe.ID_OST:=DocOstDataSet.FieldByName('ID_OST').AsInteger;
 fe.cxName.Text:=DocOstDataSet.FieldByName('NAME').AsString;
 fe.cxKolMat.Value:=DocOstDataSet.FieldByName('KOL_MAT').AsFloat;
 fe.cxSumma.Value:=DocOstDataSet.FieldByName('SUMMA').AsFloat;
 fe.cxPrice.Value:=DocOstDataSet.FieldByName('PRICE').AsFloat;
 fe.cxUnit.Text:=DocOstDataSet.FieldByName('UNIT').AsString;
 fe.cxNameSch.Text:=DocOstDataSet.FieldByName('SCH_NUMBER').AsString;
 fe.cxByujet.Enabled:=False;
 fe.cxKEKV.Enabled:=False;
 fe.cxRazd.Enabled:=False;
 fe.cxStat.Enabled:=False;
 fe.Label1.Enabled:=False;
 fe.Label2.Enabled:=False;
 fe.Label3.Enabled:=False;
 fe.Label4.Enabled:=False;
 fe.DBHANDLE:=DBHANDLE;
 if fe.ShowModal=mrOk then
 begin
  try
    SetLength(Vals, 7);
    Vals[0] := fe.ID_OST;
    Vals[1] := fe.ID_NOMN;
    Vals[2] := fe.ID_SCH;
    Vals[3] := fe.ID_UNIT;
    Vals[4] := fe.cxKolMat.Value;
    Vals[5] := fe.cxPrice.Value;
    Vals[6] := fe.cxSumma.Value;
    WorkProc.Close;
    WorkProc.Transaction := WriteTransaction;
    WorkProc.Transaction.StartTransaction;
    WorkProc.StoredProcName:='MAT_DT_OST_BASE_UPD';
    WorkProc.Prepare;
    WorkProc.ExecProcedure('MAT_DT_OST_BASE_UPD', Vals);
    WorkProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkProc.Transaction.Rollback;
     exit;
    end;
   end;
   DocOstDataSet.CloseOpen(False);
   DocOstDataSet.Locate('ID_OST', fe.ID_OST, []);
 end;
 fe.Free;

end;

procedure TOstBaseForm.acDelExecute(Sender: TObject);
var
 ID_OSTB: integer;
 ID_ISTFIN: integer;
begin
 if DocOstDataSet.IsEmpty then
  exit;
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES then
 begin
   ID_OSTB := DocOstDataSetID_OST.AsInteger;
   try
    WorkProc.Close;
    WorkProc.Transaction := WriteTransaction;
    WorkProc.Transaction.StartTransaction;
    WorkProc.StoredProcName:='MAT_DT_OST_BASE_DEL';
    WorkProc.Prepare;
    WorkProc.ExecProcedure('MAT_DT_OST_BASE_DEL', [ID_OSTB]);
    WorkProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkProc.Transaction.Rollback;
     exit;
    end;
   end;
   ID_ISTFIN := IstfinDataSetISTFIN_ID.AsInteger;
   try
    WorkProc.Close;
    WorkProc.Transaction := WriteTransaction;
    WorkProc.Transaction.StartTransaction;
    WorkProc.StoredProcName:='MAT_DT_OST_ISTFIN_D ';
    WorkProc.Prepare;
    WorkProc.ExecProcedure('MAT_DT_OST_ISTFIN_D', [ID_ISTFIN]);
    WorkProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkProc.Transaction.Rollback;
     exit;
    end;
   end;
   IstfinDataSet.CloseOpen(false);
   DocOstDataSet.CloseOpen(False);
   cxGrid1DBTableView1.ViewData.Expand(true);
   cxGrid2DBTableView1.ViewData.Expand(true);
  end;

end;

procedure TOstBaseForm.acAddBExecute(Sender: TObject);
var
 fe: TEditOstBaseForm;
 vals: array of Variant;
 ID_ISTFIN:Integer;
begin
 if DocOstDataSet.IsEmpty then
  exit;
 fe:=TEditOstBaseForm.Create(self);
 fe.cxSumma.Value:=DocOstDataSet.FieldByName('SUMMA').AsFloat;
 fe.cxName.Enabled:=False;
 fe.cxKolMat.Enabled:=False;
 fe.cxPrice.Enabled:=False;
 fe.cxUnit.Enabled:=False;
 fe.cxNameSch.Enabled:=False;
 fe.LabelName.Enabled:=False;
 fe.LabelKolMat.Enabled:=False;
 fe.LabelPrice.Enabled:=False;
 fe.LabelUnit.Enabled:=False;
 fe.LabelSch.Enabled:=False;
 fe.DBHANDLE:=DBHANDLE;
 if fe.ShowModal=mrOk then
 begin
  try
    SetLength(Vals, 6);
    Vals[0] := DocOstDataSetID_OST_CUR.AsInteger;
    Vals[1] := Fe.ID_SM;
    Vals[2] := fe.ID_RZ;
    Vals[3] := fe.ID_ST;
    Vals[4] := fe.ID_KEKV;
    Vals[5] := fe.cxSumma.Value;
    WorkProc.Close;
    WorkProc.Transaction:= WriteTransaction;
    WorkProc.Transaction.StartTransaction;
    WorkProc.StoredProcName:='MAT_DT_OST_ISTFIN_INS ';
    WorkProc.Prepare;
    WorkProc.ExecProcedure('MAT_DT_OST_ISTFIN_INS ', Vals);
    WorkProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkProc.Transaction.Rollback;
     exit;
    end;
   end;
    IstfinDataSet.CloseOpen(False);
 end;
 fe.Free;

end;

procedure TOstBaseForm.acChangeBExecute(Sender: TObject);
var
 fe: TEditOstBaseForm;
 vals: array of Variant;
 ID_ISTFIN:Integer;
begin
 if IstfinDataSet.IsEmpty or DocOstDataSet.IsEmpty then
  exit;
 fe:=TEditOstBaseForm.Create(self);
 fe.cxSumma.Value:=IstfinDataSet.FieldByName('SUMMA').AsFloat;
 fe.cxName.Enabled:=False;
 fe.cxKolMat.Enabled:=False;
 fe.cxPrice.Enabled:=False;
 fe.cxUnit.Enabled:=False;
 fe.cxNameSch.Enabled:=False;
 fe.LabelName.Enabled:=False;
 fe.LabelKolMat.Enabled:=False;
 fe.LabelPrice.Enabled:=False;
 fe.LabelUnit.Enabled:=False;
 fe.LabelSch.Enabled:=False;
 fe.cxByujet.Text:=IstfinDataSet.FieldByName('ISTFIN_SM_KOD').AsString;
 fe.cxKEKV.Text:=IstfinDataSet.FieldByName('ISTFIN_KEKV_KOD').AsString;
 fe.cxRazd.Text:=IstfinDataSet.FieldByName('ISTFIN_RZ_KOD').AsString;
 fe.cxStat.Text:=IstfinDataSet.FieldByName('ISTFIN_ST_KOD').AsString;
 fe.DBHANDLE:=DBHANDLE;
 if fe.ShowModal=mrOk then
 begin
   if  (fe.flag=1) and (fe.flag_kekv=1) then
   begin
   ID_ISTFIN := IstfinDataSetISTFIN_ID.AsInteger;
  try
    SetLength(Vals, 7);
    Vals[0] := ID_ISTFIN;
    Vals[1] := DocOstDataSetID_OST_CUR.AsInteger;
    Vals[2] := Fe.ID_SM;
    Vals[3] := fe.ID_RZ;
    Vals[4] := fe.ID_ST;
    Vals[5] := fe.ID_KEKV;
    Vals[6] := fe.cxSumma.Value;
    WorkProc.Close;
    WorkProc.Transaction:= WriteTransaction;
    WorkProc.Transaction.StartTransaction;
    WorkProc.StoredProcName:='MAT_DT_OST_ISTFIN_U';
    WorkProc.Prepare;
    WorkProc.ExecProcedure('MAT_DT_OST_ISTFIN_U', Vals);
    WorkProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkProc.Transaction.Rollback;
     exit;
    end;
   end;
  end;
    IstfinDataSet.CloseOpen(False);
 end;
 fe.Free;

end;

procedure TOstBaseForm.acDelBExecute(Sender: TObject);
var ID_ISTFIN: Integer;
begin
  if IstfinDataSet.IsEmpty then
  exit;
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES then
 begin
  ID_ISTFIN := IstfinDataSetISTFIN_ID.AsInteger;
   try
    WorkProc.Close;
    WorkProc.Transaction := WriteTransaction;
    WorkProc.Transaction.StartTransaction;
    WorkProc.StoredProcName:='MAT_DT_OST_ISTFIN_D';
    WorkProc.Prepare;
    WorkProc.ExecProcedure('MAT_DT_OST_ISTFIN_D', [ID_ISTFIN]);
    WorkProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkProc.Transaction.Rollback;
     exit;
    end;
   end;
   IstfinDataSet.CloseOpen(false);
   cxGrid2DBTableView1.ViewData.Expand(true);
 end;

end;

end.

