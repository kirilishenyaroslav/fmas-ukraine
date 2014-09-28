unit Arnd_Sch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, IBase, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridBandedTableView, cxGridTableView, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridDBTableView,
  cxGrid, ExtCtrls, dxBar, dxBarExtItems, cxCalendar, cxTextEdit,
  cxCurrencyEdit, FIBDataSet, pFIBDataSet, cxMaskEdit, cxDropDownEdit,
  cxMemo, StdCtrls, cxContainer, frxClass, FIBQuery, pFIBQuery, cxTL,
  DogLoaderUnit, frxDBSet, dxStatusBar, pFIBStoredProc, ActnList,WSUnit,
  Arnd_Filter, frxDesgn, frxExportRTF, frxExportXLS, Accmgmt, ImgList,
  Registry, cxCheckBox, DBCtrls, cxButtonEdit,VikonDataEdit, frxExportPDF,ActiveX,
  frxExportHTML, Menus, ReeUrzbImport,SysAdmin;

type
  TMemoRecord = packed record
   Value      : string;
   Width      : integer;
   Visible    : boolean;
   Align      : TfrxHAlign;
   FrameType  : TfrxFrameTypes;
  end;

  TSmetRecord = packed record
   _id_Period : integer;
   _S         : integer;
   _R         : integer;
   _St        : integer;
   _Sum       : extended;
   _S_Name    : string;
   _R_Name    : string;
   _St_Name   : string;
   _id_S      : integer;
   _id_R      : integer;
   _id_St     : integer;
   _is_Recalc : boolean;
  end;

  TSmetArray = array of TSmetRecord;
  TMemoArray = array of array of TMemoRecord;

  TArnd_Sch_Form = class(TForm)
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    BottomPanel: TPanel;
    SchTableView: TcxGridDBTableView;
    SchGridLevel1: TcxGridLevel;
    SchGrid: TcxGrid;
    DataSource1: TDataSource;
    DataSet: TpFIBDataSet;
    SchTableViewID_SCH: TcxGridDBColumn;
    SchTableViewOUT_SCH: TcxGridDBColumn;
    SchTableViewID_DOG: TcxGridDBColumn;
    SchTableViewTIP_DOG: TcxGridDBColumn;
    SchTableViewS_DATE_REG: TcxGridDBColumn;
    SchTableViewDATE_CR: TcxGridDBColumn;
    SchTableViewPRINT_DATE: TcxGridDBColumn;
    SchTableViewPRN_NN_DAT: TcxGridDBColumn;
    SchTableViewDATE_SCH: TcxGridDBColumn;
    SchTableViewDATE_BEG: TcxGridDBColumn;
    SchTableViewDATE_END: TcxGridDBColumn;
    SchTableViewNUM_SCH: TcxGridDBColumn;
    SchTableViewPRINTED: TcxGridDBColumn;
    SchTableViewKODP: TcxGridDBColumn;
    SchTableViewMFO: TcxGridDBColumn;
    SchTableViewRSCHET: TcxGridDBColumn;
    SchTableViewSUMMA: TcxGridDBColumn;
    SchTableViewNAME_TIP_DOG: TcxGridDBColumn;
    SchTableViewNAME_CUSTOMER: TcxGridDBColumn;
    PayerEdit: TcxTextEdit;
    MFOEdit: TcxTextEdit;
    RateAccEdit: TcxTextEdit;
    RegNumEdit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    NoteMemo: TcxMemo;
    Label6: TLabel;
    SchTableViewREGEST_NUM: TcxGridDBColumn;
    SchTableViewDOG_NOTE: TcxGridDBColumn;
    PrnDateEdit: TcxTextEdit;
    PreviewButton: TdxBarLargeButton;
    PrintSchButton: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    SchTableViewBANK_NAME: TcxGridDBColumn;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    ExportButton: TdxBarLargeButton;
    ExportPopupMenu: TdxBarPopupMenu;
    dxBarSubItem4: TdxBarSubItem;
    dxBarSubItem5: TdxBarSubItem;
    dxBarSubItem6: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    Query: TpFIBQuery;
    PrintNalogButton: TdxBarLargeButton;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    frxRahDataset: TfrxDBDataset;
    RahDataSet: TpFIBDataSet;
    dxStatusBar1: TdxStatusBar;
    StoredProc: TpFIBStoredProc;
    frxDBDataset2: TfrxDBDataset;
    SchDataSet: TpFIBDataSet;
    ActionList: TActionList;
    add: TAction;
    red: TAction;
    del: TAction;
    up: TAction;
    cl: TAction;
    prosmotr: TAction;
    print_sch: TAction;
    dxBarLargeButton1: TdxBarLargeButton;
    Fltr: TAction;
    SchTableViewPK_ID_DOC: TcxGridDBColumn;
    SchTableViewWorkDate: TcxGridDBColumn;
    RecalcDataSet: TpFIBDataSet;
    frxDBDataset3: TfrxDBDataset;
    DataSetNacl: TpFIBDataSet;
    frxNaclDataSet: TfrxDBDataset;
    DataSetSumNds: TpFIBDataSet;
    frxSumNdsDataSet: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    Report: TfrxReport;
    frxDatasetSchDbet: TfrxDBDataset;
    DataSetSchDbet: TpFIBDataSet;
    PrintPopupMenu: TdxBarPopupMenu;
    PrintSchA4Button: TdxBarButton;
    PrintSchA5Button: TdxBarButton;
    LargeImages: TImageList;
    ColDataSet: TfrxUserDataSet;
    RowDataSet: TfrxUserDataSet;
    DataSetTemp: TpFIBDataSet;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarButton3: TdxBarButton;
    NumNaklButton: TdxBarLargeButton;
    SchTableViewNUM_NAKL: TcxGridDBColumn;
    NaklPopupMenu: TdxBarPopupMenu;
    Print1NaklButton: TdxBarButton;
    Print2NaklButton: TdxBarButton;
    PrintSchA42Button: TdxBarButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    AktDataSet: TpFIBDataSet;
    frxAktDataSet: TfrxDBDataset;
    Label7: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarButton6: TdxBarButton;
    PrintAktButton: TdxBarLargeButton;
    dxBarEdit1: TdxBarEdit;
    dxBarDateCombo1: TdxBarDateCombo;
    dxBarSubItem7: TdxBarSubItem;
    dxBarEdit2: TdxBarEdit;
    pFIBQuery1: TpFIBQuery;
    AktSchDataSet: TpFIBDataSet;
    frxAktSchDataSet: TfrxDBDataset;
    frxAktRecalcDataSet: TfrxDBDataset;
    AktRecalcDataSet: TpFIBDataSet;
    pFIBStoredProc1: TpFIBStoredProc;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    dxBarPopupMenu2: TdxBarPopupMenu;
    print_bez_gemora: TAction;
    dxBarButton9: TdxBarButton;
    AktReportxA42: TfrxReport;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    PrintAkt: TAction;
    PrintNakl: TAction;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarButton14: TdxBarButton;
    SchTableViewDATE_NAKL: TcxGridDBColumn;
    SchTableViewDATE_AKT: TcxGridDBColumn;
    ButtonEditGl: TdxBarButton;
    ReportMultyA4: TfrxReport;
    buttonExportToTI: TdxBarButton;
    ButtonExportTi: TdxBarLargeButton;
    ColumnCheck: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    dxBarButton15: TdxBarButton;
    SchTableViewDBColumn1: TcxGridDBColumn;
    SchTableViewDBColumn2: TcxGridDBColumn;
    ButtonNumBegin: TdxBarButton;
    NumRuhButton: TdxBarLargeButton;
    dxBarPopupMenuRahunok: TdxBarPopupMenu;
    dxBarButton16: TdxBarButton;
    dxBarButton71: TdxBarButton;
    RahDataSetNacl: TpFIBDataSet;
    frxRahDatasetNacl: TfrxDBDataset;
    frxReport2: TfrxReport;
    frxReport1: TfrxReport;
    ReportNacl: TfrxReport;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    procedure SchTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure PreviewButtonClick(Sender: TObject);
    function  BeforePrintSch : boolean;
    function  BeforePrintNakl : boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PrintNalogButtonClick(Sender: TObject);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure SchTableViewDblClick(Sender: TObject);
    procedure ExportButtonClick(Sender: TObject);
    procedure CreatePrintArray(id_Sch : integer);
    procedure FormCreate(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure frxReport2GetValue(const VarName: String;
      var Value: Variant);
    procedure addExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure upExecute(Sender: TObject);
    procedure clExecute(Sender: TObject);
    procedure prosmotrExecute(Sender: TObject);
    procedure print_schExecute(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure FltrExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SchTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure frxReport2AfterPrintReport(Sender: TObject);
    procedure PrintSchA4ButtonClick(Sender: TObject);
    procedure PrintSchA5ButtonClick(Sender: TObject);
    procedure PrintSchButtonClick(Sender: TObject);
    procedure NumNaklButtonClick(Sender: TObject);
    procedure Print1NaklButtonClick(Sender: TObject);
    procedure Print2NaklButtonClick(Sender: TObject);
    procedure PrintSchA42ButtonClick(Sender: TObject);
    procedure ReportNaclGetValue(const VarName: String;
      var Value: Variant);
    procedure dxBarButton3Click(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure EditDateAktOrNukl(IsAkt:Boolean);
    procedure print_bez_gemoraExecute(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
    procedure PrintAktButtonClick(Sender: TObject);
    procedure PrintAktExecute(Sender: TObject);
    procedure PrintNaklExecute(Sender: TObject);
    procedure SchGridEnter(Sender: TObject);
    procedure PrintNewNakl();
    procedure dxBarButton13Click(Sender: TObject);
    procedure dxBarButton14Click(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure dxBarButton12Click(Sender: TObject);
    procedure SchTableViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ButtonExportTiClick(Sender: TObject);
    procedure dxBarButton15Click(Sender: TObject);
    procedure NumRuhButtonClick(Sender: TObject);
    procedure ButtonNumBeginClick(Sender: TObject);
    procedure SchTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure dxbrbtn1Click(Sender: TObject);
    procedure dxBarButton17Click(Sender: TObject);
    procedure dxBarButton18Click(Sender: TObject);
    procedure dxBarButton19Click(Sender: TObject);
  private
    { Private declarations }
  public
   FltrForm : TfrmFilterArnd;
   PrintArray : TMemoArray;
   PrintSum   : currency;
   FastPrint  : Boolean;

   PrintSchProc  : TNotifyEvent;
   PrintNaklProc : TNotifyEvent;
   PrintAktProc  : TNotifyEvent;
   TotalSchSum : string;

   sum_all, nds_all, sum_to_pay: Currency;
   AktDate  :TDate;
   NaklDate  :TDate;
   AktVikon :String;
   procedure SelectAll;
   procedure LocateRecord(Key : integer);
   procedure InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
   function  Filter(s:String): String;

   function  DeleteDocument : boolean;
   function  DeleteArndDoc(pk_id : string; WorkDate : TDate) : boolean;
   function  CheckSchIsLast(id_Dog : int64; id_Sch : integer) : boolean;
   function  CheckCanDelete(id_Tip_Dog : integer; Work_Date : TDate) : variant;

   procedure PrintSch;
   procedure PrintSch_1;
   function  PrintNacl : boolean;
  end;

function GoToFirstSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;
function GoToNextSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;

function ArndSch(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         WTrans : TISC_TR_HANDLE; FS : Integer; group: Integer; id_dog: Integer): variant; stdcall;
exports  ArndSch;

var
  Arnd_Sch_Form : TArnd_Sch_Form;
  EditVikon     :  TVikonEdit;
  id_group      : integer;
  sel           : string;
  PrintMomentPrizn : Integer;
  Id:integer;

implementation

uses Arnd_Sch_Add, Math, DateUtils, SumPropis, arndNaklNum, Clipbrd,Kernel;

{$R *.dfm}

{ TArnd_Sch_Form }

const DefFrameType = [ftLeft,ftRight,ftTop,ftBottom];

procedure TArnd_Sch_Form.InitConnection(DBhandle: TISC_DB_HANDLE;
  RTransaction, WTransaction: TISC_TR_HANDLE);
begin
 Database.Handle         := DBhandle;
 ReadTransaction.Handle  := RTransaction;
 WriteTransaction.Handle := WTransaction;
end;

function ArndSch(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         WTrans : TISC_TR_HANDLE; FS : Integer; group: Integer; id_dog: Integer): variant; stdcall;
var
F : TArnd_Sch_Form;
fSStyle:TFormStyle;
begin
 id_group := group;
 if (FS=1) then fSStyle := fsMDIChild;
 if (FS=2) then fSStyle := fsMDIChild;
 if (FS=3) then begin
  fSStyle := fsNormal;

 end;

 if fSStyle = fsNormal then begin
  Arnd_Sch_Form := TArnd_Sch_Form.Create(AOwner);
  Arnd_Sch_Form.InitConnection(DBHandle, RTrans, WTrans);
  Arnd_Sch_Form.FormStyle  := fSStyle;
  Result := Arnd_Sch_Form.ShowModal;

  Arnd_Sch_Form := nil;
 end
 else begin
  F := TArnd_Sch_Form.Create(AOwner);
  //F.SchTableView.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
  F.InitConnection(DBHandle, RTrans, WTrans);
  F.FormStyle  := fSStyle;

  Result := F.Handle;
  F.show;
 end;

 F.DataSetNacl.Close;
 F.pFIBQuery1.Close;
 F.pFIBQuery1.SQL.Clear;
 F.pFIBQuery1.SQL.Add('SELECT NATURAL_ARND, ID_SERVER FROM DOG_SYS_OPTIONS, PUB_SYS_DATA');
 F.pFIBQuery1.ExecQuery;
  //.FldByName['ID_SERVER'].AsInteger <>97 донгует использует ндс в качестве услуг
 if ((F.pFIBQuery1.FldByName['NATURAL_ARND'].AsInteger = 1)and(F.pFIBQuery1.FldByName['ID_SERVER'].AsInteger <>97)) then
 begin
  F.DataSetNacl.SQLs.SelectSQL.Clear;
  F.DataSetNacl.SQLs.SelectSQL.Add('SELECT * from DOG_DT_NAKL_AKT_REPORT(:id_sch,-1,1) where pr_nds<>1 and st_kod<>0');
 end
 else
 begin
  F.DataSetNacl.SQLs.SelectSQL.Clear;
  F.DataSetNacl.SQLs.SelectSQL.Add('SELECT * from DOG_DT_NAKL_AKT_REPORT(:id_sch,-1,1) where pr_nds<>1 and st_kod<>0');
 // F.DataSetNacl.SQLs.SelectSQL.Add('SELECT * from DOG_DT_ARND_SCH_REPORT(:id_sch,-1,1) where pr_nds<>1 and st_kod<>0');
//  F.DataSetNacl.SQLs.SelectSQL.Add('SELECT * from DOG_DT_ARND_AKT_REPORT(:id_sch,-1,1) where pr_nds<>1 and st_kod<>0');
 end;
 F.pFIBQuery1.Close;



 {посмотреть счета по договору}
{ if id_dog > 0 then
 begin
   F.DataSet.Active := false;
   F.DataSet.SQLs.SelectSQL.Text := 'select * from  DOG_DT_ARND_SCH_SEL_BY_ID_DOG(' + IntToStr(id_dog) + ')';
   F.DataSet.Active := true;
 end;}
end;

procedure TArnd_Sch_Form.SchTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if AFocusedRecord = nil then begin
  PayerEdit.Text   := '';
  MFOEdit.Text     := '';
  RegNumEdit.Text  := '';
  PrnDateEdit.Text := '';
  RateAccEdit.Text := '';
  NoteMemo.Text    := '';

  Exit;
 end;

 if not VarIsNull(AFocusedRecord.Values[10]) then PayerEdit.Text   := AFocusedRecord.Values[10];
 if not VarIsNull(AFocusedRecord.Values[15]) then MFOEdit.Text     := AFocusedRecord.Values[15];
 if not VarIsNull(AFocusedRecord.Values[19]) then RegNumEdit.Text  := AFocusedRecord.Values[19];

 if VarIsNull(AFocusedRecord.Values[6]) then PrnDateEdit.Text := ''
 else PrnDateEdit.Text := DateToStr(AFocusedRecord.Values[6]);

 if not VarIsNull(AFocusedRecord.Values[16]) then RateAccEdit.Text := AFocusedRecord.Values[16];
 if not VarIsNull(AFocusedRecord.Values[20]) then NoteMemo.Text    := AFocusedRecord.Values[20];
 // Для редактирования даты договора (Динамической)
 if not VarIsNull(AFocusedRecord.Values[8]) then dxBarDateCombo1.Date:=AFocusedRecord.Values[8];

 AktDate:=StrToDateDef(VarToStrDef (SchTableView.DataController.Values[SchTableView.DataController.FocusedRowIndex,26],''),Date);
 NaklDate:=StrToDateDef(VarToStrDef (SchTableView.DataController.Values[SchTableView.DataController.FocusedRowIndex,25],''),Date);

 Id:=SchTableView.DataController.Values[SchTableView.DataController.FocusedRowIndex,0];
end;

procedure TArnd_Sch_Form.FormShow(Sender: TObject);
begin
 LoadPositionFromRegistry(Self);

 SelectAll;

 pFIBQuery1.Close;
 pFIBQuery1.SQL.Clear;
 pFIBQuery1.SQL.Add('select vikon from DOG_SYS_OPTIONS;');
 pFIBQuery1.ExecQuery;
 AktVikon:=pFIBQuery1.FldByName['vikon'].AsString;

 SchTableView.Items[29].DataBinding.ValueTypeClass := TcxIntegerValueType;
end;

procedure TArnd_Sch_Form.AddButtonClick(Sender: TObject);
var
 F      : TArnd_Sch_Add_Form;
 id_Sch : integer;
begin
 F         := TArnd_Sch_Add_Form.Create(Self,id_group);
 F.State   := 'add';
 F.Caption := 'Виставляння рахунку за оренду';
 F.WindowState:=wsMaximized;
 //F.FormStyle := fsMDIChild;
 // F.WindowState:=wsNormal;
// F.WindowState:=wsMaximized;
 if F.ShowModal <> mrOk then Exit;

 id_Sch := F.id_Sch;

 SelectAll;
 LocateRecord(id_Sch);
end;

procedure TArnd_Sch_Form.RefreshButtonClick(Sender: TObject);
var
 Key : integer;
begin
 Key := -1;
 if DataSet.RecordCount > 0 then Key := DataSet.FieldValues['ID_SCH'];

 SelectAll;
 LocateRecord(Key);

// SchTableView.DataController.FocusedRowIndex:=DataSet.RecordCount;
// SchTableView.Controller.FocusedRowIndex:=DataSet.RecordCount;
// ShowMessage(IntToStr(SchTableView.Controller.FocusedRowIndex));

end;

procedure TArnd_Sch_Form.SelectAll;
var
  Fr: TForm;
  f, w, d: String;
  ds : Char;
begin
  fr := WaitScreenShow(Self);
  DataSet.Close;

 //обновление согласно фильтру
  f :=  ' SELECT P.SHORT_NAME,  P.ID_TIP_DOG AS V_TIP_DOG, R.ID_CUSTOMER, R.LINKTO, ' + #13 +
           ' R.RATE_ACCOUNT, B.*, C.NAME_CUSTOMER, D.REGEST_NUM, D.ID_TIP_DOG, D.N_DOG, ' + #13 +
           ' D.D_DOG, D.ID_CUSTOMER, D.NAME_CUSTOMER, D.ID_RATE_ACCOUNT, D.NOT_SUMMA, ' + #13 +
           ' D.DOG_CLOSE, D.DOG_NOTE, D.FIO_DONGU, D.FIO_POSTAV, D.NDS_SUM, D.NDS_PAY, ' + #13 +
           ' D.SUM_FULFIL, D.SUM_PAY, D.SUM_TODAY, D.ID_USER, D.COMMENT, D.ID_RATE_ACC_NATIVE, ' + #13 +
           ' D.TMP_PAY, D.TMP_FULFIL, D.ID_MAN, D.TIME_EDIT, D.IP_COMP, D.NAME_COMP, A.ID_SCH, ' + #13 +
           ' A.OUT_SCH, A.ID_DOG, A.TIP_DOG, A.S_DATE_REG, A.DATE_CR, A.PRINT_DATE, ' + #13 +
           ' A.PRINT_DATE, A.PRN_NN_DAT, A.DATE_SCH, A.DATE_BEG, A.DATE_END, A.NUM_SCH, ' + #13 +
           ' A.PRINTED, A.KODP, A.MFO, A.RSCHET, A.SUMMA, A.WORKDATE, A.ADRESS, ' + #13 +
           ' CAST(A.PK_ID_DOC AS VARCHAR(16)) AS PK_ID_DOC, A.NAKL_NUM, A.DATE_NAKL, A.DATE_AKT ' + #13 +
        'FROM DOG_DT_ARND_SCH A ' + #13 +
        '     INNER JOIN PUB_SP_TIP_DOG P ON A.TIP_DOG=P.ID_TIP_DOG ' + #13 +
        '     INNER JOIN DOG_DT_DOCUMENT D ON D.ID_DOG=A.ID_DOG ' + #13 +
        '     INNER JOIN PUB_SP_CUST_RATE_ACC R ON R.ID_RATE_ACCOUNT = D.ID_RATE_ACCOUNT ' + #13 +
        '     INNER JOIN PUB_SP_BANK B ON R.ID_BANK = B.ID_BANK ' + #13 +
        '     INNER JOIN PUB_SP_CUSTOMER C ON R.ID_CUSTOMER=C.ID_CUSTOMER ' + #13 +
        '     INNER JOIN DOG_GROUP_TIP_DOG GD ON GD.ID_TIP_DOG = P.ID_TIP_DOG ' + #13 +
        '     LEFT JOIN ACCESS_CHECK_PERM_BY_OBJ_NAME(' + QuotedStr('/ROOT/DOG/TIP_DOG/') + ' || CAST(P.ID_TIP_DOG AS VARCHAR(16)), '
              + QuotedStr('View') + ', ' + IntToStr(SYS_ID_USER) + ') ACC ON ((1 = 1) AND (ACC.RESULT = ' + QuotedStr('T') + ')) ';

  if (FltrForm.fltRegNumCheck.Checked) then begin
   w := w + 'A.NUM_SCH = ' + QuotedStr(Trim(FltrForm.fltRegNumEdit.Text));
  end;

  if (FltrForm.fltrRegNumDogCheck.Checked) then begin
   if w <> '' then w := w + ' AND ';
   w := w + 'D.REGEST_NUM = ' + QuotedStr(Trim(FltrForm.fltrRegNumDogEdit.Text));
  end;

  if (FltrForm.fltCustCheck.Checked) then begin
   if w <> '' then w := w + ' AND ';

   if FltrForm.fltCustEdited then
    w := w + 'UPPER(C.NAME_CUSTOMER) LIKE UPPER(' + QuotedStr('%' + FltrForm.fltCustEdit.Text + '%') + ')'
   else
    w := w + 'C.ID_CUSTOMER=' + IntToStr(FltrForm.flt_id_Customer);
  end;

  if (FltrForm.fltTipDogCheck.Checked) then begin
   if w <> '' then w := w + ' AND ';
   w := w + ' P.ID_TIP_DOG =' + IntToStr(FltrForm.fltId_tip_dog);
  end;

  if FltrForm.fltDatePeriodCheck.Checked then begin
   if w <> '' then w := w + ' AND ';
   w := w + 'A.DATE_SCH >= ' + QuotedStr(DateToStr(FltrForm.fltDateBegEdit.Date)) + ' AND A.DATE_SCH <= ' + QuotedStr(DateToStr(FltrForm.fltDateEndEdit.Date));
  end;

  ds :=  DecimalSeparator;
  DecimalSeparator := '.';
  if FltrForm.fltSumCheck.Checked then begin
   if w <> '' then w := w + ' AND ';
   w := w + 'A.SUMMA >= ' +  FormatFloat('0.00', FltrForm.fltSumFromEdit.Value) + ' and A.SUMMA <= ' + FormatFloat('0.00', FltrForm.fltSumToEdit.Value);
  end;
  DecimalSeparator := ds;

  if w <> '' then w := w + ' AND ';
  w := w + 'GD.ID_GROUP_DOC = ' + IntToStr(id_group);

  DataSet.SQLs.SelectSQL.Text := f + ' where ' + w;

  DataSet.Open;
  WaitScreenClose(fr);
end;

procedure TArnd_Sch_Form.LocateRecord(Key: integer);
begin
 DataSet.Locate('ID_SCH', Key, []);
end;

procedure TArnd_Sch_Form.CloseButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TArnd_Sch_Form.PreviewButtonClick(Sender: TObject);
var
 F : TArnd_Sch_Add_Form;
 k : integer;
begin
 k := SchTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 F := TArnd_Sch_Add_Form.Create(Self);

 F.DogNameEdit.Text := RegNumEdit.Text;
 F.NameCustEdit.Text := PayerEdit.Text;
 F.RateAccEdit.Text := RateAccEdit.Text;
 F.MFOEdit.Text := MFOEdit.Text;
 F.NoteMemo.Text := NoteMemo.Text;
 F.id_Dog := DataSet.FieldValues['ID_DOG'];
 F.id_Tip_Dog := DataSet.FieldValues['V_TIP_DOG'];

 if not VarIsNull (DataSet.FieldValues['SHORT_NAME'])   then F.TipDogEdit.Text  := DataSet.FieldValues['SHORT_NAME'];
 if not VarIsNull (DataSet.FieldValues['DATE_SCH'])     then F.DateSchEdit.Date := DataSet.FieldValues['DATE_SCH'];
 if not VarIsNull (DataSet.FieldValues['DATE_BEG'])     then F.DateBegEdit.Text := DateToStr(DataSet.FieldValues['DATE_BEG']);
 if not VarIsNull (DataSet.FieldValues['DATE_END'])     then F.DateEndEdit.Date := DataSet.FieldValues['DATE_END'];
 if not VarIsNull (DataSet.FieldValues['NUM_SCH'])      then F.NumSchEdit.Text  := DataSet.FieldValues['NUM_SCH'];
 if not VarIsNull (DataSet.FieldValues['REGEST_NUM'])   then F.RegNumEdit.Text  := DataSet.FieldValues['REGEST_NUM'];

 F.State   := 'view';
 F.id_Sch  := DataSet.FieldValues['ID_SCH'];
 F.Caption := 'Перегляд рахунку за оренду';

 F.FormStyle := fsMDIChild;
 F.Show;
end;

function TArnd_Sch_Form.BeforePrintSch: boolean;
var
 k : integer;
begin
 k := SchTableView.DataController.FocusedRecordIndex;
 if k < 0 then begin
  ShowMessage('Неможна друкувати порожній документ!');
  Result := False;
  Exit;
 end;

 Report.LoadFromFile('Reports\Sch.fr3');

 CreatePrintArray(SchTableView.DataController.Values[k, 0]);

 ColDataSet.RangeEnd := reCount;
 ColDataSet.RangeEndCount := 3;

 RowDataSet.RangeEnd := reCount;
 RowDataSet.RangeEndCount := Length(PrintArray);

{ k := 0;
 for i := 0 to TreeList.LastNode.AbsoluteIndex do
  if not VarIsNull(TreeList.Nodes.AbsoluteItems[i].Values[1]) or not VarIsNull(TreeList.Nodes.AbsoluteItems[i].Values[2]) then inc(k);

 RowDataset.RangeEnd      := reCount;
 RowDataset.RangeEndCount := k;}

 Result := True;
end;

function TArnd_Sch_Form.BeforePrintNakl: boolean;
{var
 i : integer;
 k : integer;}
begin
{ if TreeList.Count <= 0 then begin
  agShowMessage('Неможна друкувати порожній документ!');
  Result := False;
  Exit;
 end;}

 //Report.LoadFromFile('Reports\NalogNakl.fr3');

{ k := 0;
 for i := 0 to TreeList.LastNode.AbsoluteIndex do
  if not VarIsNull(TreeList.Nodes.AbsoluteItems[i].Values[1]) or not VarIsNull(TreeList.Nodes.AbsoluteItems[i].Values[2]) then inc(k);

 RowDataset.RangeEnd      := reCount;
 RowDataset.RangeEndCount := k;}


// Result := True;
end;

procedure TArnd_Sch_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 SavePositionToRegistry(Self);
 Action := caFree;
end;

procedure TArnd_Sch_Form.PrintNalogButtonClick(Sender: TObject);
begin
 PrintNewNakl();
// Print1NaklButtonClick(Sender);
end;

procedure TArnd_Sch_Form.ReportGetValue(const VarName: String;
  var Value: Variant);
const
 w = 90;
var
 m : TfrxMemoView;
 d : TfrxMasterData;
begin
 if VarName = 'Name_Cust' then Value := PayerEdit.Text
 else if VarName = 'Rate_Acc_Cust' then Value := RateAccEdit.Text
 else if VarName = 'MFO_Cust' then Value := MFOEdit.Text
 else if VarName = 'Bank_Cust' then Value := DataSet.FieldValues['BANK_NAME']
 else if VarName = 'Period_Name' then Value := 'За період з ' + DateToStr(DataSet.FieldValues['Date_Beg'])
      + ' по ' + DateToStr(DataSet.FieldValues['Date_End'])
 else if VarName = 'Sch_Num' then Value := 'Рахунок № ' + DataSet.FieldValues['Num_Sch']
      + ' від ' + DateToStr(DataSet.FieldValues['Date_Sch'])
 else if VarName = 'SUM' then Value := AnsiUpperCase(ConvertNumber(PrintSum))
 else if VarName = 'Cell' then begin
  Value     := PrintArray[RowDataSet.RecNo, ColDataSet.RecNo].Value;

  d         := TfrxMasterData(Report.FindObject('MasterData2'));
  m         := TfrxMemoView(Report.FindObject('Memo16'));

  d.Width     := PrintArray[RowDataSet.RecNo, ColDataSet.RecNo].Width;
  m.Width     := PrintArray[RowDataSet.RecNo, ColDataSet.RecNo].Width;
  m.HAlign    := PrintArray[RowDataSet.RecNo, ColDataSet.RecNo].Align;
  m.Frame.Typ := PrintArray[RowDataSet.RecNo, ColDataSet.RecNo].FrameType;
 end;
end;

procedure TArnd_Sch_Form.SchTableViewDblClick(Sender: TObject);
begin
 if SchTableView.DataController.FocusedRecordIndex >= 0 then PreviewButtonClick(Sender);
end;

procedure TArnd_Sch_Form.ExportButtonClick(Sender: TObject);
begin
 ExportButton.DropDownMenu.PopupFromCursorPos;
end;

procedure TArnd_Sch_Form.CreatePrintArray(id_Sch: integer);
const
 fFull   = [ftLeft,ftRight, ftTop, ftBottom];
 fBottom = [ftLeft,ftRight, ftTop];
 fTop    = [ftLeft,ftRight, ftBottom];
var
 DataArray : TSmetArray;
 Flag      : boolean;
 i         : integer;

 Sum       : currency;
 ReSum     : currency;
// NDS       : currency;

 procedure AddRec(Num : integer; Value : string; Width : integer; Visible : boolean;
           HAlign : TfrxHAlign; FrameType : TfrxFrameTypes);
 begin
  if Num = 0 then begin
   SetLength(PrintArray, Length(PrintArray) + 1);
   SetLength(PrintArray[Length(PrintArray) - 1], 3);
  end;

  PrintArray[Length(PrintArray) - 1, Num].Value      := Value;
  PrintArray[Length(PrintArray) - 1, Num].Width      := Width;
  PrintArray[Length(PrintArray) - 1, Num].Visible    := Visible;
  PrintArray[Length(PrintArray) - 1, Num].Align      := HAlign;
  PrintArray[Length(PrintArray) - 1, Num].FrameType  := FrameType;
 end;
begin
 DataArray  := nil;
 PrintArray := nil;

 Query.SQL.Text := 'select * from DOG_DT_ARND_SMT_SEL(' + IntToStr(id_Sch) + ')';
 Query.ExecQuery;

 Flag := False;
 while not Query.Eof do begin
  SetLength(DataArray, Length(DataArray) + 1);

  with DataArray[Length(DataArray) - 1] do begin

   _S         :=  Query.FldByName['KOD_S'].AsInteger;
   _R         :=  Query.FldByName['KOD_R'].AsInteger;
   _St        :=  Query.FldByName['KOD_St'].AsInteger;
   _Sum       :=  Query.FldByName['SUMMA'].AsCurrency;
   _S_Name    :=  Query.FldByName['NAME_SMETA'].AsString;
   _R_Name    :=  Query.FldByName['NAME_RAZD'].AsString;
   _St_Name   :=  Query.FldByName['NAME_ST'].AsString;
   _id_S      :=  Query.FldByName['ID_S'].AsInteger;
   _id_R      :=  Query.FldByName['ID_R'].AsInteger;
   _id_St     :=  Query.FldByName['ID_ST'].AsInteger;
   _is_Recalc := (Query.FldByName['IS_RECALC'].AsInteger = 1);

   if _is_Recalc then Flag := True;
  end;

  Query.Next;
 end;

 Query.Close;

 AddRec(0, 'Розділ/Стаття', 98, True, haCenter, fFull);
 AddRec(1, 'Найменування статті', 469, True, haCenter, fFull);
 AddRec(2, 'Сума без ПДВ', 143, True, haCenter, fFull);

 Sum := 0;

 for i := 0 to Length(DataArray) - 1 do begin
  if DataArray[i]._is_Recalc then Continue;

  AddRec(0, IntToStr(DataArray[i]._R) + '/' + IntToStr(DataArray[i]._St), 98, True, haRight, fFull);
  AddRec(1, DataArray[i]._St_Name, 469, True, haLeft, fFull);
  AddRec(2, FloatToStrF(DataArray[i]._Sum, ffFixed, 100, 2), 143, True, haRight, fFull);

  Sum := Sum + DataArray[i]._Sum;
 end;

 AddRec(0, 'Ітого без ПДВ', 567, True, haRight, fBottom);
 AddRec(1, '', 0, False, haRight, fFull);
 AddRec(2, FloatToStrF(Sum, ffFixed, 100, 2), 143, True, haRight, fBottom);

 AddRec(0, 'ПДВ', 567, True, haRight, fTop);
 AddRec(1, '', 0, False, haRight, fFull);
 AddRec(2, FloatToStrF(Sum/5, ffFixed, 100, 2), 143, True, haRight, fTop);

 AddRec(0, 'ІТОГО ЗА ПЕРІОД', 567, True, haRight, fFull);
 AddRec(1, '', 0, False, haRight, fFull);
 AddRec(2, FloatToStrF(Sum*1.2, ffFixed, 100, 2), 143, True, haRight, fFull);

//////////

 ReSum := 0;

 if Flag then begin
  AddRec(0, 'ПЕРЕРАХУВАННЯ МИНУЛИХ ПЕРІОДІВ', 710, True, haCenter, fFull);
  AddRec(1, '', 0, False, haLeft, fFull);
  AddRec(2, '', 0, False, haRight, fFull);

  AddRec(0, 'Розділ/Стаття', 98, True, haCenter, fFull);
  AddRec(1, 'Найменування статті', 469, True, haCenter, fFull);
  AddRec(2, 'Сума без ПДВ', 143, True, haCenter, fFull);

  for i := 0 to Length(DataArray) - 1 do begin
   if not DataArray[i]._is_Recalc then Continue;

   AddRec(0, IntToStr(DataArray[i]._R) + '/' + IntToStr(DataArray[i]._St), 98, True, haRight, fFull);
   AddRec(1, DataArray[i]._St_Name, 469, True, haLeft, fFull);
   AddRec(2, FloatToStrF(DataArray[i]._Sum, ffFixed, 100, 2), 143, True, haRight, fFull);

   ReSum := ReSum + DataArray[i]._Sum;
  end;

  AddRec(0, 'Ітого без ПДВ', 567, True, haRight, fBottom);
  AddRec(1, '', 0, False, haRight, fFull);
  AddRec(2, FloatToStrF(ReSum, ffFixed, 100, 2), 143, True, haRight, fBottom);

  AddRec(0, 'ПДВ', 567, True, haRight, fTop);
  AddRec(1, '', 0, False, haRight, fFull);
  AddRec(2, FloatToStrF(ReSum/5, ffFixed, 100, 2), 143, True, haRight, fTop);

  AddRec(0, 'ІТОГО ПО ПЕРЕРАХУНКУ', 567, True, haRight, fFull);
  AddRec(1, '', 0, False, haRight, fFull);
  AddRec(2, FloatToStrF(ReSum*1.2, ffFixed, 100, 2), 143, True, haRight, fFull);
 end;

 AddRec(0, 'ВСЬОГО БЕЗ ПДВ', 567, True, haRight, fBottom);
 AddRec(1, '', 0, False, haRight, fFull);
 AddRec(2, FloatToStrF(Sum + ReSum, ffFixed, 100, 2), 143, True, haRight, fBottom);

 AddRec(0, 'ВСЬОГО ПДВ', 567, True, haRight, fTop);
 AddRec(1, '', 0, False, haRight, fFull);
 AddRec(2, FloatToStrF((Sum + ReSum)/5, ffFixed, 100, 2), 143, True, haRight, fTop);

 AddRec(0, 'І Т О Г О   Д О   С П Л А Т И ', 567, True, haRight, fFull);
 AddRec(1, '', 0, False, haRight, fFull);
 AddRec(2, FloatToStrF((Sum + ReSum)*1.2, ffFixed, 100, 2), 143, True, haRight, fFull);

 PrintSum := (Sum + ReSum)*1.2;
end;

procedure TArnd_Sch_Form.FormCreate(Sender: TObject);
var
 reg : TRegistry;
 s   : string;
begin
 if fibCheckPermission('/ROOT/DOG/SPRAV/ARENDA','Add') <> 0 then AddButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/ARENDA','Del') <> 0 then DelButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/ARENDA','View') <> 0 then PreviewButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/ARENDA','Print') <> 0 then begin
  PrintSchButton.Visible   := ivNever;
  PrintNalogButton.Visible := ivNever;
 end;

 FltrForm := TfrmFilterArnd.Create(Self);

 FltrForm.fltDatePeriodCheck.Checked := true;
 //FltrForm.fltDateBegEdit.Date := IncYear(Date, -1);
 FltrForm.fltDateBegEdit.Date := IncMonth(Date, -1);
 FltrForm.fltDateEndEdit.Date := Date;

 PrintAktProc := dxBarButton3Click;
 PrintSchProc := PrintSchA4ButtonClick;
 reg := TRegistry.Create;
 reg.RootKey := HKEY_CURRENT_USER;
 reg.OpenKey('\Software\FMAS\Dogovor\', true);

 s := reg.ReadString('SchPrintFormat');
 if s <> '' then begin
  if UpperCase(s) = 'A4' then begin
   PrintSchProc := PrintSchA4ButtonClick;
   PrintSchButton.LargeImageIndex := 1;
  end;
  if UpperCase(s) = 'A5' then begin
   PrintSchProc := PrintSchA5ButtonClick;
   PrintSchButton.LargeImageIndex := 2;
  end;
  if UpperCase(s) = 'A42' then begin
   PrintSchProc := PrintSchA42ButtonClick;
   PrintSchButton.LargeImageIndex := 1;
  end;
 end;

 s := '';
 // Чисто для теста пока что)
 s := reg.ReadString('AktPrintFormat');
 if s <> '' then begin
  if UpperCase(s) = 'A5' then begin
    PrintAktProc := dxBarButton9Click;
  end;
  if UpperCase(s) = 'A4' then begin
    PrintAktProc := dxBarButton3Click;
  end;
 end;

 s := '';
 s := reg.ReadString('NaklPrintFormat');
 if s <> '' then begin
  if UpperCase(s) = '1P' then begin
   PrintNaklProc := PrintSchA4ButtonClick;
   PrintNalogButton.Caption := 'Накладна(1)';
  end;
  if UpperCase(s) = '2P' then begin
   PrintNaklProc := PrintSchA5ButtonClick;
   PrintNalogButton.Caption := 'Накладна(2)';
  end;
 end;

 reg.CloseKey;
 reg.Free;
end;

procedure TArnd_Sch_Form.DelButtonClick(Sender: TObject);
var
 k        : integer;
 WorkDate : TDate;
 pk_id    : string;

 temp_date : variant;
begin
 k := SchTableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 if MessageBox(Handle,PChar('Вы дійсно бажаєте видалити запис?'),
   'Підтвердження видалення',MB_YesNo or MB_Iconquestion) = mrYes then
 begin

 with SchTableView.DataController do begin
  if not CheckSchIsLast(Values[k, 2], Values[k, 0]) then begin
   ShowMessage('Увага! Видалення рахунку неможливе!' + #13 + #13
   + 'Рахунок не є останнім по договору.');
   Exit;
  end;
 end;

 with SchTableView.DataController do begin
  if not VarIsNull(Values[k, 23]) then WorkDate := Values[k, 23]
  else WorkDate := Now;

  if not VarIsNull(Values[k, 22]) then begin
   pk_id := Values[k, 22];

   temp_date := CheckCanDelete(Values[k, 3], WorkDate);

   if VarIsNull(temp_date) then Exit
   else WorkDate := temp_date;

   WriteTransaction.StartTransaction;

   if not DeleteArndDoc(pk_id, WorkDate) then begin
    WriteTransaction.Rollback;
    ShowMessage('Видаленння рахунку неможливо!');
    Exit;
   end;
  end
  else begin
   if MessageDlg('Увага!', 'Ідентифікатор документу не знайдено!'
   + #13 + #13 + 'Ви дійсно бажаєте видалити цей рахунок?', mtConfirmation, [mbYes, mbNo]) <> mrYes then begin
    WriteTransaction.Rollback;
    Exit;
   end;
  end;
 end;

  StoredProc.StoredProcName := 'DOG_DT_ARND_SCH_DEL';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_SCH').Value := DataSet.FieldByName('id_sch').AsVariant;
  try
    StoredProc.ExecProc;
  except
   begin
    WriteTransaction.Rollback;
    Exit;
   end;
  end;
  WriteTransaction.Commit;
  SelectAll;
 end;
end;

procedure TArnd_Sch_Form.frxReport2GetValue(const VarName: String;
  var Value: Variant);
//var
//  summa: Currency;
begin
 if VarName = 'TotalSchSum' then Value := TotalSchSum
 else if VarName = 'AllSum' then Value := CurrToStr(sum_all)
 else if VarName = 'NdsAll' then Value := CurrToStr(nds_all)
 else if VarName = 'SumToPay' then Value := CurrToStr(sum_to_pay)
 else if VarName = 'ARND_VISA' then Value := RahDataset.FieldByName('ARND_VISA').AsString
 else if VarName = 'VIKON_RCH' then
      begin
           pFIBQuery1.Close;
           pFIBQuery1.SQL.Clear;
           pFIBQuery1.SQL.Add('select vikon_rch from DOG_SYS_OPTIONS;');
           pFIBQuery1.ExecQuery;
           Value:=pFIBQuery1.FldByName['vikon_rch'].AsString;
           pFIBQuery1.Close;
      end
   else  if VarName = 'USER_NAME1' then begin
     Query.Close;
     Query.SQL.Text:='select * from users where id_user = '+inttostr(SYS_ID_USER);
     Query.ExecQuery;
     Value := Query.FldByName['FULL_NAME'].AsString;
    Query.Close;
   end
{  if VarName =11 'SUM_PROP' then
  begin
    summa := StrToCurr(FormatFloat('0.00', IfNull(TfrxMemoView(frxReport2.FindObject('Memo7')).Value, 0)));
    if summa > 0 then
    Value := ConvertNumber(summa);
  end;}
 //ShowMessage( FormatFloat('0.00', IfNull(TfrxMemoView(frxReport2.FindObject('Memo7')).Value, 0)));
//  if VarName = 'SUM' the Value :=
end;

procedure TArnd_Sch_Form.addExecute(Sender: TObject);
begin
  AddButtonClick(Self);
end;

procedure TArnd_Sch_Form.delExecute(Sender: TObject);
begin
  DelButtonClick(Self);
end;

procedure TArnd_Sch_Form.upExecute(Sender: TObject);
begin
  RefreshButtonClick(Self);
end;

procedure TArnd_Sch_Form.clExecute(Sender: TObject);
var
  EditVikon1:TVikonEdit;
begin
 EditVikon1:=TVikonEdit.Create(Self);

 pFIBQuery1.Close;
 pFIBQuery1.SQL.Clear;
 pFIBQuery1.SQL.Add('select vikon_rch from DOG_SYS_OPTIONS;');
 pFIBQuery1.ExecQuery;
 EditVikon1.OldEdit.Text:=pFIBQuery1.FldByName['vikon_rch'].AsString;
 EditVikon1.DateBeg.Enabled:=false;
 pFIBQuery1.Close;


 EditVikon1.DateBeg.Date:= AktDate;

 if EditVikon1.ShowModal = mrAll then begin
  pFIBQuery1.SQL.Clear;
  pFIBQuery1.SQL.Add('Update DOG_SYS_OPTIONS SET vikon_rch='''+EditVikon1.OldEdit.Text+''';');
  pFIBQuery1.ExecQuery;
  pFIBQuery1.Close;
  AktVikon:=EditVikon1.OldEdit.Text;
 end;
 if EditVikon1.ModalResult = mrOk then
 begin
  AktVikon:=EditVikon1.OldEdit.Text;
 end
 else
   Exit;

  
end;

procedure TArnd_Sch_Form.prosmotrExecute(Sender: TObject);
begin
  PreviewButtonClick(Self);
end;

procedure TArnd_Sch_Form.print_schExecute(Sender: TObject);
begin
  PrintSchProc(Sender);
end;

procedure TArnd_Sch_Form.dxBarLargeButton1Click(Sender: TObject);
begin
  if FltrForm.ShowModal <> mrCancel then SelectAll;
end;

function TArnd_Sch_Form.Filter(s:String): String;
begin
  sel := s;
//  Edit1.Text := s;
end;

procedure TArnd_Sch_Form.FltrExecute(Sender: TObject);
begin
  dxBarLargeButton1Click(Self);
end;

function TArnd_Sch_Form.DeleteDocument : boolean;
{var
 k           : integer;
 PK_id       : int64;

 RecInfo     : RECORD_INFO_STRUCTURE;
 ResultInfo  : RESULT_STRUCTURE;

 STRU        : KERNEL_MODE_STRUCTURE;
 DoResult    : Boolean;
 KEY_SESSION : integer;
 ErrorList   : TStringList;
 DocDate     : TDate;

 Key         : int64;{}
begin
{ k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;
 if TableView.DataController.Values[k, 5] <> SYS_INFO^._id_Type_Doc then begin
  ShowMessage('Документ видалити не можна, тому що він створений в іншій системі!');
  Exit;
 end;

 PK_id   := TableView.DataController.Values[k, 0];
 DocDate := SYS_INFO^._Period_Beg; 

 if not WriteTransaction.Active then WriteTransaction.StartTransaction;

 RecInfo.TRHANDLE       := WriteTransaction.Handle;
 RecInfo.DBHANDLE       := Database.Handle;
 RecInfo.ID_RECORD      := VarArrayOf([PK_id]);
 RecInfo.PK_FIELD_NAME  := VarArrayOf(['PK_ID']);
 RecInfo.TABLE_NAME     := 'PUB_DT_ALL_DOC';
 RecInfo.RAISE_FLAG     := false;

 ResultInfo := Kernel.LockRecord(@RecInfo);
 if ResultInfo.RESULT_CODE = 0 then begin
  WriteTransaction.Rollback;
  ShowMessage(ResultInfo.RESULT_MESSAGE);
  Exit;
 end;

 Key := -1;
 with TableView.DataController do begin
  if k + 1 < RecordCount then Key := Values[k + 1, 0]
  else if k - 1 >= 0 then Key := Values[k - 1, 0];
 end;

 if MessageDlg('Увага!', 'Ви дійсно бажаєте видалити обраний документ?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

 WriteTransaction.StartTransaction;

 KEY_SESSION := Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

 STRU.KEY_SESSION   := KEY_SESSION;
 STRU.WORKDATE      := DocDate;
 STRU.DBHANDLE      := Database.Handle;
 STRU.TRHANDLE      := WriteTransaction.Handle;
 STRU.KERNEL_ACTION := 2;
 STRU.PK_ID         := PK_id;
 STRU.ID_USER       := SYS_INFO^._id_User;

 try
  DoResult:=Kernel.KernelDo(@STRU);
 except
  on E:Exception do begin
   WriteTransaction.Rollback;
   ShowMessage('Помилка ядра ' + E.Message);
   Exit;
  end;
 end;                    

 if not DoResult then begin
  ErrorList := Kernel.GetDocErrorsList(@STRU);
  WriteTransaction.Rollback;
  ShowMessage(ErrorList.Text);
  Exit;
 end;

 WriteTransaction.Commit;

 SelectAll;
 LocateRecord(Key);{}
end;

procedure TArnd_Sch_Form.FormDestroy(Sender: TObject);
begin
  FltrForm.Free;
end;

function TArnd_Sch_Form.DeleteArndDoc(pk_id: string; WorkDate : TDate): boolean;
var
 RecInfo     : RECORD_INFO_STRUCTURE;
 ResultInfo  : RESULT_STRUCTURE;

 STRU        : KERNEL_MODE_STRUCTURE;
 DoResult    : Boolean;
 KEY_SESSION : integer;
 ErrorList   : TStringList;
begin
 RecInfo.TRHANDLE       := WriteTransaction.Handle;
 RecInfo.DBHANDLE       := Database.Handle;
 RecInfo.ID_RECORD      := VarArrayOf([PK_id]);
 RecInfo.PK_FIELD_NAME  := VarArrayOf(['PK_ID']);
 RecInfo.TABLE_NAME     := 'PUB_DT_ALL_DOC';
 RecInfo.RAISE_FLAG     := False;

 ResultInfo := Kernel.LockRecord(@RecInfo);
 if ResultInfo.RESULT_CODE = 0 then begin
//  WriteTransaction.Rollback;
  ShowMessage(ResultInfo.RESULT_MESSAGE);
  Exit;
 end;

 KEY_SESSION := Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);


 STRU.KEY_SESSION   := KEY_SESSION;
 STRU.WORKDATE      := WorkDate;
 STRU.DBHANDLE      := Database.Handle;
 STRU.TRHANDLE      := WriteTransaction.Handle;
 STRU.KERNEL_ACTION := 2;
 STRU.PK_ID         := StrToInt64(PK_id);
 STRU.ID_USER       := SYS_ID_USER;

 try
  DoResult:=Kernel.KernelDo(@STRU);
 except
  on E:Exception do begin
   WriteTransaction.Rollback;
   ShowMessage('Помилка ядра ' + E.Message);
   Exit;
  end;
 end;

 if not DoResult then begin
  ErrorList := Kernel.GetDocErrorsListEx(@STRU);
  ShowMessage(ErrorList.Text);
  Exit;
 end;

 Result := True;
end;

procedure TArnd_Sch_Form.SchTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 k : integer;
 id_sch : integer;
 id_dog : integer;
 pk_id : int64;
 work : TDate;
begin

 if (Key = Ord('P')) and (ssShift in Shift) and (PrintSchButton.Visible = ivAlways) then
 begin
   FastPrint := True;
   PrintSchProc(Self);
   FastPrint := False;
 end;

if (Key = Ord('N')) and (ssShift in Shift) and (PrintSchButton.Visible = ivAlways) then
 begin
   FastPrint := True;
   PrintNalogButtonClick(Self);
   FastPrint := False;
 end;

if (Key = VK_ESCAPE) then CloseButtonClick(Self);

if (Key = Ord('A')) and (ssShift in Shift) and (PrintSchButton.Visible = ivAlways) then
 begin
   FastPrint := True;
   PrintAktButtonClick(Self);
   FastPrint := False;
 end;


 with SchTableView.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;
 //  if not ADMIN_MODE then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  try
   id_sch := Values[k, 0];
   id_dog := Values[k, 2];
   pk_id  := Values[k, 22];
   work   := Values[k, 23];

   ShowMessage('ID_SCH: '      + IntToStr(id_sch)+ #13
             + 'ID_DOG: '      + IntToStr(id_dog)+ #13
             + 'PK_ID: '       + IntToStr(pk_id) + #13
             + 'WORK_DATE: '   + DateToStr(work));
  except
  end;
 end;
end;

procedure TArnd_Sch_Form.dxBarButton1Click(Sender: TObject);
begin
 PrintSch;

 frxReport2.PrepareReport(true);

 RahDataSet.Active    := false;
 SchDataSet.Active    := false;
 RecalcDataSet.Active := false;

 frxReport2.Export(frxRTFExport1);
end;

procedure TArnd_Sch_Form.dxBarButton2Click(Sender: TObject);
begin
 PrintSch;

 frxReport2.PrepareReport(true);

 RahDataSet.Active    := false;
 SchDataSet.Active    := false;
 RecalcDataSet.Active := false;

 frxReport2.Export(frxXLSExport1);
end;

procedure TArnd_Sch_Form.dxBarButton4Click(Sender: TObject);
begin
 PrintNacl();

 ReportNacl.PrepareReport(true);

 RahDataSet.Active    := false;
 RahDataSetNacl.Active := false;
 DataSetNacl.Active    := false;
 DataSetSumNds.Active := false;

 ReportNacl.Export(frxRTFExport1);
end;

procedure TArnd_Sch_Form.dxBarButton5Click(Sender: TObject);
var
   RepFile : string;
begin
 PrintNacl();
 RepFile := '';
 Query.Close;
 Query.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 6';
 Query.ExecQuery;
 if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then repFile := 'Invoice2011.fr3';
 Query.Close;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then ReportNacl.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;

 ReportNacl.PrepareReport(true);

 // ReportNacl.DesignReport;
  if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  ReportNacl.DesignReport else ReportNacl.ShowReport;
 RahDataSet.Active    := false;
 RahDataSetNacl.Active := False;
 DataSetNacl.Active    := false;
 DataSetSumNds.Active := false;

 ReportNacl.Export(frxXLSExport1);
end;

procedure TArnd_Sch_Form.PrintSch;
var
 DataSetR : TpFIBDataSet;
 sum_sch, sum_recalc, nds_sch, nds_recalc : currency;
 sum_debt, nds_debt : currency;
begin
 if not BeforePrintSch then Exit;
 SchDataSet.Close;
 RahDataSet.Close;
 RecalcDataSet.Close;
 DataSetSchDbet.Close;

 RahDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 RahDataSet.Open;

 SchDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 SchDataSet.Open;

 RecalcDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 RecalcDataSet.Open;

 //задолженность
 DataSetSchDbet.ParamByName('id_sch').Value :=  SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 DataSetSchDbet.Open;

 sum_debt := DataSetSchDbet.FBN('SUMMA_DEBT').AsCurrency;
 nds_debt := DataSetSchDbet.FBN('SUMMA_NDS_DEBT').AsCurrency;

 if (sum_debt <= 0) then begin
   if frxReport2.FindObject('Memo52') <> nil then begin
    frxReport2.FindObject('Memo52').Visible := false;
    frxReport2.FindObject('Subreport2').Top := frxReport2.FindObject('Memo52').Top;
   end;

   if frxReport2.FindObject('Memo78') <> nil then begin
    frxReport2.FindObject('Memo78').Visible := false;
    frxReport2.FindObject('Subreport3').Top := frxReport2.FindObject('Memo78').Top;
   end;
 end;

 //сумма дя печати прописью
 SchDataSet.Last;
 RecalcDataSet.Last;
 nds_sch := SchDataSet.FieldByName('summ_st').AsCurrency;
 nds_recalc := RecalcDataSet.FieldByName('summ_st').AsCurrency;
 nds_all := nds_sch + nds_recalc + nds_debt;

 SchDataSet.MoveBy(-1);
 RecalcDataSet.MoveBy(-1);
 sum_sch := SchDataSet.FieldByName('summ_st').AsCurrency;
 sum_recalc := RecalcDataSet.FieldByName('summ_st').AsCurrency;
 sum_all := sum_sch + sum_recalc + sum_debt - nds_debt;

 sum_to_pay := sum_all + nds_all;

 SchDataSet.First;
 RecalcDataSet.First;


 DataSetR := TpFIBDataSet.Create(Self);
 DataSetR.Database := Database;
 DataSetR.Transaction := ReadTransaction;
 DataSetR.SQLs.SelectSQL.Text := 'select * from DOG_DT_PL_DOC_REPORT_IS_RECALC (' + IntToStr(SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0]) + ')';
 DataSetR.Open;

 if DataSetR.FieldByName('calc').AsInteger = 0 then
 begin
   frxReport2.FindObject('MasterData12').Visible := false;
   frxReport2.FindObject('MasterData1').Visible := false;
   frxReport2.FindObject('Memo8').Visible := false;
   frxReport2.FindObject('Memo7').Visible := false;
//   frxReport2.FindObject('Subreport1').Top := 0.00;
 end
 else
 begin
   frxReport2.FindObject('MasterData12').Visible := true;
   frxReport2.FindObject('MasterData1').Visible := true;
   frxReport2.FindObject('Memo8').Visible := true;
   frxReport2.FindObject('Memo7').Visible := true;
//   frxReport2.FindObject('Subreport1').Top := 13.00;
   if (sum_sch + nds_sch) < 0 then
   begin
      TotalSchSum := 'Мінус' + '  ' + ConvertNumber((sum_sch + nds_sch)*(-1));
   end
   else
   begin
    TotalSchSum := ConvertNumber(sum_sch + nds_sch);
   end;
 end;

 if DataSetR.FieldByName('recalc').AsInteger = 0 then
 begin
   frxReport2.FindObject('Subreport1').Visible := false;
 end
 else
 begin
   frxReport2.FindObject('Footer1').Height := 1.04;
   frxReport2.FindObject('Subreport1').Visible := true;
  if (sum_recalc + nds_recalc) < 0 then
  begin
     TotalSchSum := 'Мінус' + '  ' + ConvertNumber((sum_recalc + nds_recalc)*(-1));
  end
  else
  begin
     TotalSchSum := ConvertNumber(sum_recalc + nds_recalc);
  end;
 end;

 //если есть счет и пересчет, то печатаются общие суммы.
 if ((DataSetR.FieldByName('calc').AsInteger = 1) and
   (DataSetR.FieldByName('recalc').AsInteger = 1)) then
 begin
   if sum_to_pay > 0 then
   begin
     if frxReport2.FindObject('MasterData4') <> nil then frxReport2.FindObject('MasterData4').Visible := true;
     if frxReport2.FindObject('MasterData6') <> nil then frxReport2.FindObject('MasterData6').Visible := true;

     TotalSchSum := ConvertNumber(sum_to_pay);
  end;
 end
 else
 begin
     if frxReport2.FindObject('MasterData4') <> nil then frxReport2.FindObject('MasterData4').Visible := False;
     if frxReport2.FindObject('MasterData6') <> nil then frxReport2.FindObject('MasterData6').Visible := False;
 end;

 //если есть задолженность, то печаются общие суммы
 if (sum_debt > 0) then
 begin
     if frxReport2.FindObject('MasterData4') <> nil then frxReport2.FindObject('MasterData4').Visible := true;
     if frxReport2.FindObject('MasterData6') <> nil then frxReport2.FindObject('MasterData6').Visible := true;

     TotalSchSum := ConvertNumber(sum_to_pay);
 //    frxReport2.FindObject('Subreport1').Top := 13.00;
 end
 else
 begin
     if frxReport2.FindObject('MasterData4') <> nil then frxReport2.FindObject('MasterData4').Visible := False;
     if frxReport2.FindObject('MasterData6') <> nil then frxReport2.FindObject('MasterData6').Visible := False;
 end;

 DataSetR.Close;
 DataSetR.Free;

end;

procedure TArnd_Sch_Form.PrintSch_1;
var
  DataSetR: TpFIBDataSet;
  sum_sch, sum_recalc, nds_sch, nds_recalc: Currency;
begin
 if not BeforePrintSch then Exit;
 SchDataSet.Close;
 RahDataSet.Close;
 RecalcDataSet.Close;


 RahDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 RahDataSet.Open;

 SchDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 SchDataSet.Open;

 RecalcDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 RecalcDataSet.Open;


 //сумма дя печати прописью
 SchDataSet.Last;
 RecalcDataSet.Last;
 nds_sch := SchDataSet.FieldByName('summ_st').AsCurrency;
 nds_recalc := RecalcDataSet.FieldByName('summ_st').AsCurrency;
 nds_all := nds_sch + nds_recalc;

 SchDataSet.MoveBy(-1);
 RecalcDataSet.MoveBy(-1);
 sum_sch := SchDataSet.FieldByName('summ_st').AsCurrency;
 sum_recalc := RecalcDataSet.FieldByName('summ_st').AsCurrency;
 sum_all := sum_sch + sum_recalc;

 sum_to_pay := sum_all + nds_all;

 SchDataSet.First;
 RecalcDataSet.First;


 DataSetR := TpFIBDataSet.Create(Self);
 DataSetR.Database := Database;
 DataSetR.Transaction := ReadTransaction;
 DataSetR.SQLs.SelectSQL.Text := 'select * from DOG_DT_PL_DOC_REPORT_IS_RECALC (' + IntToStr(SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0]) + ')';
 DataSetR.Open;

 if DataSetR.FieldByName('calc').AsInteger = 0 then
 begin
   frxReport2.FindObject('MasterData12').Visible := false;
   frxReport2.FindObject('MasterData1').Visible := false;
   frxReport2.FindObject('Memo8').Visible := false;
   frxReport2.FindObject('Memo7').Visible := false;
//   frxReport2.FindObject('Subreport1').Top := 0.00;
 end
 else
 begin
   frxReport2.FindObject('MasterData12').Visible := true;
   frxReport2.FindObject('MasterData1').Visible := true;
   frxReport2.FindObject('Memo8').Visible := true;
   frxReport2.FindObject('Memo7').Visible := true;
//   frxReport2.FindObject('Subreport1').Top := 13.00;
   if (sum_sch + nds_sch) < 0 then
   begin
      TotalSchSum := 'Мінус' + '  ' + ConvertNumber((sum_sch + nds_sch)*(-1));
   end
   else
   begin
     if sum_sch + nds_sch <> 0 then
      TotalSchSum := ConvertNumber(sum_sch + nds_sch)
     else
      TotalSchSum := '0';
   end;
 end;

 if DataSetR.FieldByName('recalc').AsInteger = 0 then
 begin
   frxReport2.FindObject('Subreport1').Visible := false;
 end
 else
 begin
   frxReport2.FindObject('Subreport1').Visible := true;
  if (sum_recalc + nds_recalc) < 0 then
  begin
     TotalSchSum := 'Мінус' + '  ' + ConvertNumber((sum_recalc + nds_recalc)*(-1));
  end
  else
  begin
     TotalSchSum := ConvertNumber(sum_recalc + nds_recalc);
  end;
 end;

 //если есть счет и пересчет, то печатаются общие суммы.

 if (DataSetR.FieldByName('calc').AsInteger = 1) and (DataSetR.FieldByName('recalc').AsInteger = 1) then
 begin
   if sum_to_pay > 0 then
   begin
     if frxReport2.FindObject('MasterData4') <> nil then frxReport2.FindObject('MasterData4').Visible := true;
     if frxReport2.FindObject('MasterData6') <> nil then frxReport2.FindObject('MasterData6').Visible := true;

     TotalSchSum := ConvertNumber(sum_to_pay);
   end;
 end
 else
 begin
   if frxReport2.FindObject('MasterData4') <> nil then frxReport2.FindObject('MasterData4').Visible := false;
   if frxReport2.FindObject('MasterData6') <> nil then frxReport2.FindObject('MasterData6').Visible := false;
 end;

   if frxReport2.FindObject('Memo52') <> nil then frxReport2.FindObject('Memo52').Visible := false;
   if frxReport2.FindObject('Memo78') <> nil then frxReport2.FindObject('Memo78').Visible := false;

// frxReport2.FindObject('Subreport2').Top := 35.00;

 DataSetR.Close;
 DataSetR.Free;

end;

function TArnd_Sch_Form.PrintNacl : boolean;
begin
 Result := False;

 if not BeforePrintNakl then Exit;
 DataSetNacl.Close;
 RahDataSet.Close;
 RahDataSetNacl.Close;
 RahDataSet.Close;
 DataSetSumNds.Close;

 RahDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 RahDataSet.Open;

 RahDataSetNacl.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 RahDataSetNacl.Open;

 if VarToStr(RahDataSetNacl['NAKL_NUM']) = '' then begin
  RahDataSetNacl.Close;

  ShowMessage('Ви маєте увести номер податкової накладної!');
  Exit;
 end;

 DataSetNacl.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 DataSetNacl.Open;

 DataSetSumNds.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 DataSetSumNds.Open;

 Result := True;
end;

procedure TArnd_Sch_Form.frxReport2AfterPrintReport(Sender: TObject);
var
  QueryUpd: TpFIBQuery;
begin
//обновляем дату печать счета
  QueryUpd := TpFIBQuery.Create(Self);
  QueryUpd.Database    := Database;
  QueryUpd.Transaction := WriteTransaction;
  QueryUpd.Transaction.StartTransaction;
  QueryUpd.SQL.Text := 'update dog_dt_arnd_sch set print_date=' +  '''' +DateToStr(Date) + '''' +
                    ' where id_sch= ' + IntToStr(DataSet['id_sch']);
  QueryUpd.ExecQuery;
  QueryUpd.Transaction.Commit;
  QueryUpd.Free;
end;

procedure TArnd_Sch_Form.PrintSchA4ButtonClick(Sender: TObject);
var
 RepFile     : string;
 is_debt_sch : Integer;
 reg         : TRegistry;
begin
 RepFile := '';
 Query.Close;
 Query.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 5';
 Query.ExecQuery;
 if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then repFile := Query['REPORT_FILE'].AsString;
 Query.Close;

 repFile := Copy(repFile, 1, Pos('.fr3', repFile) - 1) + 'A4' + '.fr3';

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;

 reg := TRegistry.Create;
 reg.RootKey := HKEY_CURRENT_USER;
 reg.OpenKey('\Software\FMAS\Dogovor\', true);
 reg.WriteString('SchPrintFormat', 'A4');
 reg.CloseKey;
 reg.Free;

 PrintSchProc := PrintSchA4ButtonClick;
 PrintSchButton.LargeImageIndex := 1;

 Query.Close;
 Query.SQL.Text := 'select o.is_debt_sch from dog_sys_options o';
 Query.ExecQuery;
 is_debt_sch := Query['is_debt_sch'].AsInteger;
 Query.Close;

 if is_debt_sch = 1 then PrintSch
 else PrintSch_1; //без задолженности

// frxReport2.LoadFromFile('Reports\Sch.fr3');
// if (PrintMomentPrizn = 1) then
// begin
//  PlatInfoA4.PrintOptions.ShowDialog := False;
//  PlatInfoA4.PrepareReport();
//  PlatInfoA4.Print;
//  frxReport2.PrintOptions.ShowDialog := False;
//  frxReport2.PrepareReport();
//  frxReport2.Print;
//  PrintMomentPrizn:= 0;
// end
// else
//  begin
//   frxReport2.ShowReport;
//  end;

{ if FastPrint then
 begin
  frxReport2.PrintOptions.ShowDialog := False;
  frxReport2.PrepareReport();
  frxReport2.Print;
 end else frxReport2.ShowReport;
}
 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  frxReport2.DesignReport else frxReport2.ShowReport;

 RahDataSet.Close;
 SchDataSet.Close;
 RecalcDataSet.Close;
end;

procedure TArnd_Sch_Form.PrintSchA5ButtonClick(Sender: TObject);
var
 RepFile     : string;
 is_debt_sch : Integer;
 reg         : TRegistry;
begin
 RepFile := '';
 Query.Close;
 Query.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 5';
 Query.ExecQuery;
 if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then repFile := Query['REPORT_FILE'].AsString;
 Query.Close;

 PrintSchProc := PrintSchA5ButtonClick;
 PrintSchButton.LargeImageIndex := 2;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;

 reg := TRegistry.Create;
 reg.RootKey := HKEY_CURRENT_USER;
 reg.OpenKey('\Software\FMAS\Dogovor\', true);
 reg.WriteString('SchPrintFormat', 'A5');
 reg.CloseKey;
 reg.Free;

 PrintSchButton.LargeImageIndex := 2;

 Query.Close;
 Query.SQL.Text := 'select o.is_debt_sch from dog_sys_options o';
 Query.ExecQuery;
 is_debt_sch := Query['is_debt_sch'].AsInteger;
 Query.Close;

 if is_debt_sch = 1 then PrintSch
 else PrintSch_1; //без задолженности

 if FastPrint then
 begin
  frxReport2.PrintOptions.ShowDialog := False;
  frxReport2.PrepareReport();
  frxReport2.Print;
 end else
 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  frxReport2.DesignReport else frxReport2.ShowReport;

 RahDataSet.Close;
 SchDataSet.Close;
 RecalcDataSet.Close;
end;

procedure TArnd_Sch_Form.PrintSchButtonClick(Sender: TObject);
begin
 PrintSchProc(Sender);
end;

function TArnd_Sch_Form.CheckSchIsLast(id_Dog : int64; id_Sch : integer) : boolean;
begin
 DataSetTemp.Close;

 DataSetTemp.SelectSQL.Text :=
      ' SELECT COUNT(*) ' +
      ' FROM DOG_DT_ARND_SCH S ' +
      ' WHERE S.ID_DOG = ' + IntToStr(id_Dog) +
      ' AND S.ID_SCH >'+ IntToStr(id_Sch);

 DataSetTemp.Open;

 Result := DataSetTemp.Fields[0].AsInteger = 0;

 DataSetTemp.Close;
end;


function TArnd_Sch_Form.CheckCanDelete(id_Tip_Dog : integer; Work_Date: TDate): variant;
var
 id_Sch_DB  : integer;
begin
 Result := null;

 DataSetTemp.Close;

 // Выбираю Дб счет

 DataSetTemp.SelectSQL.Text := 'select ID_BL_ACCOUNT from PUB_SP_TIP_DOG_INFO('
 + IntToStr(id_Tip_Dog) + ')';
 DataSetTemp.Open;

 if VarIsNull(DataSetTemp['ID_BL_ACCOUNT']) then begin
  ShowMessage('Кореспондуючий рахунок не знайдено!');
  DataSetTemp.Close;
  Exit;
 end;

 id_Sch_DB := DataSetTemp['ID_BL_ACCOUNT'];

 DataSetTemp.Close;

 // Проверяю балансовый счет на факт закрытости или заблокированности

 DataSetTemp.SelectSQL.Text := 'select * from PUB_SP_MAIN_SCH_INFO('
 + QuotedStr(DateToStr(Work_Date)) + ',' + IntToStr(id_Sch_DB) + ')';

 DataSetTemp.Open;

 if DataSetTemp['IS_BLOCKED'] = 1 then begin
  ShowMessage('Увага! Рахунок [' + DataSetTemp['SCH_NUMBER'] + ' - '
  + DataSetTemp['SCH_TITLE'] + '] заблоковано!' + #13 + #13
  + 'Видалення неможливе.');

  Exit;
 end;

 if DataSetTemp['OPEN_SCH'] > Work_Date then begin
  if MessageDlg('Увага!', 'Період "' + DateToStr(Work_Date) + '" зачинено.'
  + #13 + 'Чи бажаєте Ви сторнувати рахунок у періоді "' + DateToStr(DataSetTemp['OPEN_SCH']) + '" ?',
  mtConfirmation, [mbYes, mbNo]) = mrYes then Result := DataSetTemp['OPEN_SCH'];

  Result := DataSetTemp['OPEN_SCH'];

  Exit;
 end
 else Result := Work_Date;
end;

procedure TArnd_Sch_Form.NumNaklButtonClick(Sender: TObject);
var
 f : TTNaklNumForm;
begin
  with SchTableView.DataController do begin
  if FocusedRecordIndex < 0 then Exit;

  f := TTNaklNumForm.Create(Self);
  f.Caption:='Номер налоговой накладной';
  f.cxSpinEdit1.Visible:= False;

  if not VarIsNull(Values[FocusedRecordIndex, 24]) then
   f.NumNaklEdit.Text := Values[FocusedRecordIndex, 24];

  if f.ShowModal <> mrOk then Exit;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('DOG_DT_ARND_SCH_NAKL_NUM', [Values[FocusedRecordIndex, 0], f.NumNaklEdit.Text]);
  StoredProc.Transaction.Commit;
 end;
 RefreshButtonClick(Sender);
end;

procedure TArnd_Sch_Form.Print1NaklButtonClick(Sender: TObject);
var
 RepFile : string;
 NewSh : Integer;
begin
 RepFile := '';
 Query.Close;
 Query.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 6';
 Query.ExecQuery;
 if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then repFile := Query['REPORT_FILE'].AsString;
 Query.Close;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then ReportNacl.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;

 if not PrintNacl then Exit;

// FastPrint
// if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
// begin
//  ReportNacl.DesignReport;
// end else begin
   if FastPrint then
   begin
    ReportNacl.PrintOptions.ShowDialog := False;
    ReportNacl.PrepareReport();
    ReportNacl.Print;
   end else  if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  ReportNacl.DesignReport else ReportNacl.ShowReport;
// end;

// ReportNacl.DesignReport;
if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  ReportNacl.DesignReport else ReportNacl.ShowReport;

 RahDataSet.Close;
 RahDataSetNacl.Close;
 DataSetNacl.Close;
 DataSetSumNds.Close;
 DataSetSchDbet.Close;
end;

procedure TArnd_Sch_Form.PrintNewNakl();
var
 RepFile : string;
 NewSh : Integer;
 m1 : TfrxMemoView;
 m2 : TfrxMemoView;
 m3 : TfrxMemoView;
 m4 : TfrxMemoView;
 m5 : TfrxMemoView;
 m6 : TfrxMemoView;
 m7 : TfrxMemoView;
begin
 RepFile:='';
 Query.Close;
 Query.SQL.Text:='select REPORT_FILE from dog_ini_reports where id_report = 13';
 Query.ExecQuery;
 //if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then repFile := 'Invoice2011.fr3';
 repFile := Query['REPORT_FILE'].AsString;
 Query.Close;
 DataSetNacl.FetchAll;
 RahDataSet.FetchAll;
 RahDataSetNacl.FetchAll;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then ReportNacl.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;

 {m1:= TfrxMemoView(ReportNacl.FindObject('Memo210'));
 m1.Text := '';

 m2:= TfrxMemoView(ReportNacl.FindObject('Memo3'));
 m2.Text := 'Х';

 m3:= TfrxMemoView(ReportNacl.FindObject('Memo211'));
 m3.Text := '';

 m4:= TfrxMemoView(ReportNacl.FindObject('Memo212'));
 m4.Text := '';       }

 //m5 :=TfrxMemoView(ReportNacl.FindObject('Memo165'));
 //m5.Text :='';

 //m6 :=TfrxMemoView(ReportNacl.FindObject('Memo189'));
 //m6.Text :='';

 //m7 :=TfrxMemoView(ReportNacl.FindObject('Memo214'));
 //m7.Text :='';

 if not PrintNacl then Exit;

  // if FastPrint then
  // begin
  // ReportNacl.PrintOptions.ShowDialog := False;
  // ReportNacl.PrepareReport();
  // ReportNacl.Print;
  // end else ReportNacl.ShowReport;
  //
  if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  ReportNacl.DesignReport else ReportNacl.ShowReport;

 RahDataSet.Close;
 RahDataSetNacl.Close;
 DataSetNacl.Close;
 DataSetSumNds.Close;
 DataSetSchDbet.Close;
end;

procedure TArnd_Sch_Form.Print2NaklButtonClick(Sender: TObject);
var
 RepFile : string;
begin
 RepFile := '';
 Query.Close;
 Query.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 6';
 Query.ExecQuery;
 if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then repFile := Query['REPORT_FILE'].AsString;
 Query.Close;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then ReportNacl.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;

 if not PrintNacl then Exit;

 ReportNacl.PrepareReport;

  // frxReportNacl.LoadFromFile('Reports\WorkDog\NalogNakl.fr3');
 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then ReportNacl.DesignReport else ReportNacl.ShowReport;

 RahDataSet.Close;
 DataSetNacl.Close;
 DataSetSumNds.Close;
 DataSetSchDbet.Close;
end;

procedure TArnd_Sch_Form.PrintSchA42ButtonClick(Sender: TObject);
var
 RepFile     : string;
 is_debt_sch : Integer;
 reg         : TRegistry;
begin
 {RepFile := '';
 Query.Close;
 Query.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 5';
 Query.ExecQuery;
 if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then repFile := Query['REPORT_FILE'].AsString;
 Query.Close;

 repFile := Copy(repFile, 1, Pos('.fr3', repFile) - 1) + 'A4' + '.fr3';}

 repFile := 'SchetA42.fr3';

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;


 reg := TRegistry.Create;
 reg.RootKey := HKEY_CURRENT_USER;
 reg.OpenKey('\Software\FMAS\Dogovor\', true);
 reg.WriteString('SchPrintFormat', 'A42');
 reg.CloseKey;
 reg.Free;

// PrintSchButton.LargeImageIndex := 1;

 Query.Close;
 Query.SQL.Text := 'select o.is_debt_sch from dog_sys_options o';
 Query.ExecQuery;
 is_debt_sch := Query['is_debt_sch'].AsInteger;
 Query.Close;

 if is_debt_sch = 1 then PrintSch
 else PrintSch_1; //без задолженности

// frxReport2.LoadFromFile('Reports\Sch.fr3');

/// if FastPrint then
// begin
//  frxReport2.PrintOptions.ShowDialog := False;
//  frxReport2.PrepareReport();
//  frxReport2.Print;
// end else frxReport2.ShowReport;

 // if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then frxReport2.DesignReport else frxReport2.ShowReport;
 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  frxReport2.DesignReport else frxReport2.ShowReport;

 RahDataSet.Close;
 SchDataSet.Close;
 RecalcDataSet.Close;
end;

procedure TArnd_Sch_Form.ReportNaclGetValue(const VarName: String;
  var Value: Variant);
  var stD, stPh, stPh1, stR, NNS_N, NNS_K, NNN, NNK,  D :string;
    l,i:Integer;
begin
   if VarName = 'SUM_BY_ST_10' then begin
    if DataSetSumNds.FieldByName('SUM_BY_ST_10').AsCurrency = 0 then Value := ''
    else Value := DataSetSumNds.FieldByName('SUM_BY_ST_10').AsCurrency;
   end;

   stD:=DateToStr(RahDataSetNacl['DATE_NAKL']);
   delete(stD,3,1);
   delete(stD,5,1);
   stR:=RahDataSetNacl['NAKL_NUM'];
   l:=LENGTH(str);
   if l>7 then  begin  stR:='Error';  l:=5; end  ;
   stR:=stR+'         ';
   if VarName = 'D1' then begin Value:=stD[1];Exit; end;
   if VarName = 'D2' then begin Value:=stD[2];Exit;  end;
   if VarName = 'D3' then begin Value:=stD[3];Exit;  end;
   if VarName = 'D4' then begin Value:=stD[4];Exit;  end;
   if VarName = 'D5' then begin Value:=stD[5];Exit;  end;
   if VarName = 'D6' then begin Value:=stD[6];Exit;  end;
   if VarName = 'D7' then begin Value:=stD[7];Exit;  end;
   if VarName = 'D8' then begin Value:=stD[8];Exit;  end;
   if VarName = 'R'+inttostr(l+8) then begin Value:='';Exit;  end;
   if VarName = 'R'+inttostr(l+7) then begin Value:='';Exit;  end;
   if VarName = 'R'+inttostr(l+6) then begin Value:='';Exit;  end;
   if VarName = 'R'+inttostr(l+5) then begin Value:='';Exit;  end;
   if VarName = 'R'+inttostr(l+4) then begin Value:='';Exit;  end;
   if VarName = 'R'+inttostr(l+3) then begin Value:='';Exit;  end;
   if VarName = 'R'+inttostr(l+2) then begin Value:='';Exit;  end;
   if VarName = 'R'+inttostr(l+1) then begin Value:='';Exit;  end;
   if VarName = 'R'+inttostr(l) then begin Value:=stR[1];Exit;  end;
   if VarName = 'R'+inttostr(l-1) then begin Value:=stR[2];Exit;  end;
   if VarName = 'R'+inttostr(l-2) then begin Value:=stR[3];Exit;  end;
   if VarName = 'R'+inttostr(l-3) then begin Value:=stR[4];Exit;  end;
   if VarName = 'R'+inttostr(l-4) then begin Value:=stR[5];Exit;  end;
   if VarName = 'R'+inttostr(l-5) then begin Value:=stR[6];Exit;  end;
   if VarName = 'R'+inttostr(l-6) then begin Value:=stR[7];Exit;  end;
   if VarName = 'R'+inttostr(l-7) then begin Value:=stR[8];Exit;  end;
   if VarName = 'R'+inttostr(l-8) then begin Value:=stR[9];Exit;  end;

   stPh:=RahDataSetNacl['Phone_Native'];
   l:=LENGTH(stPh);
   i:=1;

   while (i<l) do
   begin
     if ((stPh[i]=' ') or ( stPh[i]='-'))then begin delete(stPh,i,1);   end else i:=i+1;
   end;

   l:=LENGTH(stPh);
   if l>10 then  begin  stPh:='Error';  l:=4; end  ;
   stPh:=stPh+'           ';

   if VarName = 'PH'+inttostr(l+1) then begin Value:='';Exit;  end;
   if VarName = 'PH'+inttostr(l+2) then begin Value:='';Exit;  end;
   if VarName = 'PH'+inttostr(l+3) then begin Value:='';Exit;  end;
   if VarName = 'PH'+inttostr(l+4) then begin Value:='';Exit;  end;
   if VarName = 'PH'+inttostr(l+5) then begin Value:='';Exit;  end;
   if VarName = 'PH'+inttostr(l+6) then begin Value:='';Exit;  end;
   if VarName = 'PH'+inttostr(l+7) then begin Value:='';Exit;  end;
   if VarName = 'PH'+inttostr(l+8) then begin Value:='';Exit;  end;
   if VarName = 'PH'+inttostr(l+9) then begin Value:='';Exit;  end;
   if VarName = 'PH'+inttostr(l+10) then begin Value:='';Exit;  end;
   if VarName = 'PH'+inttostr(l) then begin Value:=stPh[1];Exit;  end;
   if VarName = 'PH'+inttostr(l-1) then begin Value:=stPh[2];Exit;  end;
   if VarName = 'PH'+inttostr(l-2) then begin Value:=stPh[3];Exit;  end;
   if VarName = 'PH'+inttostr(l-3) then begin Value:=stPh[4];Exit;  end;
   if VarName = 'PH'+inttostr(l-4) then begin Value:=stPh[5];Exit;  end;
   if VarName = 'PH'+inttostr(l-5) then begin Value:=stPh[6];Exit;  end;
   if VarName = 'PH'+inttostr(l-6) then begin Value:=stPh[7];Exit;  end;
   if VarName = 'PH'+inttostr(l-7) then begin Value:=stPh[8];Exit;  end;
   if VarName = 'PH'+inttostr(l-8) then begin Value:=stPh[9];Exit;  end;
   if VarName = 'PH'+inttostr(l-9) then begin Value:=stPh[10];Exit;  end;



   stPh1:=VarToStrDef(RahDataSetNacl['Phone'], '');
   l:=LENGTH(stPh1);
   i:=1;
   while (i<l) do
   begin
     if ((stPh1[i]=' ') or ( stPh1[i]='-'))then begin delete(stPh1,i,1);   end else i:=i+1;
   end;
    l:=LENGTH(stPh1);
   if l>10 then  begin  stPh1:='Error';  l:=4; end  ;
   stPh1:=stPh1+'           ';
   if VarName = 'PH_Cust'+inttostr(l+1) then begin Value:='';Exit; end;
   if VarName = 'PH_Cust'+inttostr(l+2) then begin Value:=''; Exit;end;
   if VarName = 'PH_Cust'+inttostr(l+3) then begin Value:='';Exit; end;
   if VarName = 'PH_Cust'+inttostr(l+4) then begin Value:='';Exit; end;
   if VarName = 'PH_Cust'+inttostr(l+5) then begin Value:=''; Exit;end;
   if VarName = 'PH_Cust'+inttostr(l+6) then begin Value:='';Exit; end;
   if VarName = 'PH_Cust'+inttostr(l+7) then begin Value:='';Exit; end;
   if VarName = 'PH_Cust'+inttostr(l+8) then begin Value:='';Exit; end;
   if VarName = 'PH_Cust'+inttostr(l+9) then begin Value:='';Exit; end;
   if VarName = 'PH_Cust'+inttostr(l+10) then begin Value:='';Exit; end;
   if VarName = 'PH_Cust'+inttostr(l) then begin Value:=stPh1[1]; Exit;end;
   if VarName = 'PH_Cust'+inttostr(l) then begin Value:=stPh1[1]; Exit;end;
   if VarName = 'PH_Cust'+inttostr(l-1) then begin Value:=stPh1[2];Exit; end;
   if VarName = 'PH_Cust'+inttostr(l-2) then begin Value:=stPh1[3];Exit; end;
   if VarName = 'PH_Cust'+inttostr(l-3) then begin Value:=stPh1[4]; Exit;end;
   if VarName = 'PH_Cust'+inttostr(l-4) then begin Value:=stPh1[5]; Exit;end;
   if VarName = 'PH_Cust'+inttostr(l-5) then begin Value:=stPh1[6];Exit; end;
   if VarName = 'PH_Cust'+inttostr(l-6) then begin Value:=stPh1[7]; Exit;end;
   if VarName = 'PH_Cust'+inttostr(l-7) then begin Value:=stPh1[8];Exit; end;
   if VarName = 'PH_Cust'+inttostr(l-8) then begin Value:=stPh1[9];Exit; end;
   if VarName = 'PH_Cust'+inttostr(l-9) then begin Value:=stPh1[10];Exit; end;



   NNS_N:=VarToStrDef(RahDataSetNacl['NNS_N'], '');
   l:=LENGTH(NNS_N);
   i:=1;
   while (i<l) do
   begin
     if ((NNS_N[i]=' ') or (NNS_N[i]='-'))then begin delete(NNS_N,i,1);   end else i:=i+1;
   end;
    l:=LENGTH(NNS_N);
   if l>10 then  begin  NNS_N:='Error';  l:=4; end  ;
   NNS_N:=NNS_N+'           ';
   if VarName = 'NNS_N_Cust'+inttostr(l+1) then begin Value:='';Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l+2) then begin Value:=''; Exit;end;
   if VarName = 'NNS_N_Cust'+inttostr(l+3) then begin Value:='';Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l+4) then begin Value:='';Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l+5) then begin Value:=''; Exit;end;
   if VarName = 'NNS_N_Cust'+inttostr(l+6) then begin Value:='';Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l+7) then begin Value:='';Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l+8) then begin Value:='';Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l+9) then begin Value:='';Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l+10) then begin Value:='';Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l) then begin Value:=NNS_N[1]; Exit;end;
   if VarName = 'NNS_N_Cust'+inttostr(l-1) then begin Value:=NNS_N[2];Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l-2) then begin Value:=NNS_N[3];Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l-3) then begin Value:=NNS_N[4]; Exit;end;
   if VarName = 'NNS_N_Cust'+inttostr(l-4) then begin Value:=NNS_N[5]; Exit;end;
   if VarName = 'NNS_N_Cust'+inttostr(l-5) then begin Value:=NNS_N[6];Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l-6) then begin Value:=NNS_N[7]; Exit;end;
   if VarName = 'NNS_N_Cust'+inttostr(l-7) then begin Value:=NNS_N[8];Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l-8) then begin Value:=NNS_N[9];Exit; end;
   if VarName = 'NNS_N_Cust'+inttostr(l-9) then begin Value:=NNS_N[10];Exit; end;


   NNS_K:=VarToStrDef(RahDataSetNacl['NNS_K'], '');
   l:=LENGTH(NNS_K);
   i:=1;
   while (i<l) do
   begin
     if ((NNS_K[i]=' ') or (NNS_K[i]='-'))then begin delete(NNS_K,i,1);   end else i:=i+1;
   end;
    l:=LENGTH(NNS_K);
   if l>10 then  begin  NNS_K:='Error';  l:=4; end  ;
   NNS_K:=NNS_K+'           ';
   if VarName = 'NNS_K_Cust'+inttostr(l+1) then begin Value:='';Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l+2) then begin Value:=''; Exit;end;
   if VarName = 'NNS_K_Cust'+inttostr(l+3) then begin Value:='';Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l+4) then begin Value:='';Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l+5) then begin Value:=''; Exit;end;
   if VarName = 'NNS_K_Cust'+inttostr(l+6) then begin Value:='';Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l+7) then begin Value:='';Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l+8) then begin Value:='';Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l+9) then begin Value:='';Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l+10) then begin Value:='';Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l) then begin Value:=NNS_K[1]; Exit;end;
   if VarName = 'NNS_K_Cust'+inttostr(l-1) then begin Value:=NNS_K[2];Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l-2) then begin Value:=NNS_K[3];Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l-3) then begin Value:=NNS_K[4]; Exit;end;
   if VarName = 'NNS_K_Cust'+inttostr(l-4) then begin Value:=NNS_K[5]; Exit;end;
   if VarName = 'NNS_K_Cust'+inttostr(l-5) then begin Value:=NNS_K[6];Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l-6) then begin Value:=NNS_K[7]; Exit;end;
   if VarName = 'NNS_K_Cust'+inttostr(l-7) then begin Value:=NNS_K[8];Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l-8) then begin Value:=NNS_K[9];Exit; end;
   if VarName = 'NNS_K_Cust'+inttostr(l-9) then begin Value:=NNS_K[10];Exit; end;



   NNN:=VarToStrDef(RahDataSetNacl['NALOG_NOM_N'], '');
   l:=LENGTH(NNN);
   i:=1;
   while (i<l) do
   begin
     if ((NNN[i]=' ') or (NNN[i]='-'))then begin delete(NNN,i,1);   end else i:=i+1;
   end;
    l:=LENGTH(NNN);
   if l>12 then  begin  NNN:='Error';  l:=4; end  ;
   NNN:=NNN+'           ';
   if VarName = 'NNN_Cust'+inttostr(l+1) then begin Value:='';Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l+2) then begin Value:=''; Exit;end;
   if VarName = 'NNN_Cust'+inttostr(l+3) then begin Value:='';Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l+4) then begin Value:='';Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l+5) then begin Value:=''; Exit;end;
   if VarName = 'NNN_Cust'+inttostr(l+6) then begin Value:='';Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l+7) then begin Value:='';Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l+8) then begin Value:='';Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l+9) then begin Value:='';Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l+10) then begin Value:='';Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l+11) then begin Value:='';Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l+12) then begin Value:='';Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l) then begin Value:=NNN[1]; Exit;end;
   if VarName = 'NNN_Cust'+inttostr(l-1) then begin Value:=NNN[2];Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l-2) then begin Value:=NNN[3];Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l-3) then begin Value:=NNN[4]; Exit;end;
   if VarName = 'NNN_Cust'+inttostr(l-4) then begin Value:=NNN[5]; Exit;end;
   if VarName = 'NNN_Cust'+inttostr(l-5) then begin Value:=NNN[6];Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l-6) then begin Value:=NNN[7]; Exit;end;
   if VarName = 'NNN_Cust'+inttostr(l-7) then begin Value:=NNN[8];Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l-8) then begin Value:=NNN[9];Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l-9) then begin Value:=NNN[10];Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l-10) then begin Value:=NNN[11];Exit; end;
   if VarName = 'NNN_Cust'+inttostr(l-11) then begin Value:=NNN[12];Exit; end;



   NNK:=VarToStrDef(RahDataSetNacl['NALOG_NOM_K'], '');
   l:=LENGTH(NNK);
   i:=1;
   while (i<l) do
   begin
     if ((NNK[i]=' ') or (NNK[i]='-'))then begin delete(NNK,i,1);   end else i:=i+1;
   end;
    l:=LENGTH(NNK);
   if l>12 then  begin  NNK:='Error';  l:=4; end;
   NNK:=NNK+'           ';
   if VarName = 'NNK_Cust'+inttostr(l+1) then begin Value:='';Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l+2) then begin Value:=''; Exit;end;
   if VarName = 'NNK_Cust'+inttostr(l+3) then begin Value:='';Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l+4) then begin Value:='';Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l+5) then begin Value:=''; Exit;end;
   if VarName = 'NNK_Cust'+inttostr(l+6) then begin Value:='';Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l+7) then begin Value:='';Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l+8) then begin Value:='';Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l+9) then begin Value:='';Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l+10) then begin Value:='';Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l+11) then begin Value:='';Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l+12) then begin Value:='';Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l) then begin Value:=NNK[1]; Exit;end;
   if VarName = 'NNK_Cust'+inttostr(l-1) then begin Value:=NNK[2];Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l-2) then begin Value:=NNK[3];Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l-3) then begin Value:=NNK[4]; Exit;end;
   if VarName = 'NNK_Cust'+inttostr(l-4) then begin Value:=NNK[5]; Exit;end;
   if VarName = 'NNK_Cust'+inttostr(l-5) then begin Value:=NNK[6];Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l-6) then begin Value:=NNK[7]; Exit;end;
   if VarName = 'NNK_Cust'+inttostr(l-7) then begin Value:=NNK[8];Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l-8) then begin Value:=NNK[9];Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l-9) then begin Value:=NNK[10];Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l-10) then begin Value:=NNK[11];Exit; end;
   if VarName = 'NNK_Cust'+inttostr(l-11) then begin Value:=NNK[12];Exit; end;



   D:=VarToStrDef(RahDataSetNacl['D_DOG_RND'], '');
   l:=LENGTH(D);
   i:=1;
   while (i<l) do
   begin
     if ((D[i]=' ') or (D[i]='-'))then begin delete(D,i,1);   end else i:=i+1;
   end;
    l:=LENGTH(D);
   if l>8 then  begin  D:='Error';  l:=4; end;
   D:=D+'           ';
   if VarName = 'D_Cust'+inttostr(l+1) then begin Value:='';Exit; end;
   if VarName = 'D_Cust'+inttostr(l+2) then begin Value:=''; Exit;end;
   if VarName = 'D_Cust'+inttostr(l+3) then begin Value:='';Exit; end;
   if VarName = 'D_Cust'+inttostr(l+4) then begin Value:='';Exit; end;
   if VarName = 'D_Cust'+inttostr(l+5) then begin Value:=''; Exit;end;
   if VarName = 'D_Cust'+inttostr(l+6) then begin Value:='';Exit; end;
   if VarName = 'D_Cust'+inttostr(l+7) then begin Value:='';Exit; end;
   if VarName = 'D_Cust'+inttostr(l) then begin Value:=D[1]; Exit;end;
   if VarName = 'D_Cust'+inttostr(l-1) then begin Value:=D[2];Exit; end;
   if VarName = 'D_Cust'+inttostr(l-2) then begin Value:=D[3];Exit; end;
   if VarName = 'D_Cust'+inttostr(l-3) then begin Value:=D[4]; Exit;end;
   if VarName = 'D_Cust'+inttostr(l-4) then begin Value:=D[5]; Exit;end;
   if VarName = 'D_Cust'+inttostr(l-5) then begin Value:=D[6];Exit; end;
   if VarName = 'D_Cust'+inttostr(l-6) then begin Value:=D[7]; Exit;end;
   if VarName = 'D_Cust'+inttostr(l-7) then begin Value:=D[8];Exit; end;


end;




{ Процедура формирования акта приёма - передачи}
procedure TArnd_Sch_Form.dxBarButton3Click(Sender: TObject);
var
 RepFile     : string;
 is_debt_sch : Integer;
 reg         : TRegistry;
 DataSetR : TpFIBDataSet;
 sum_sch, sum_recalc, nds_sch, nds_recalc : currency;
 sum_debt, nds_debt : currency;
begin
 // Акт к счёту
 CoInitialize(nil);

 if not BeforePrintSch then Exit;
 AktSchDataSet.Close;
 RahDataSet.Close;
 AktRecalcDataSet.Close;
 DataSetSchDbet.Close;

 RahDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 RahDataSet.Open;

 AktSchDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 AktSchDataSet.Open;

 AktRecalcDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 AktRecalcDataSet.Open;

 //задолженность
 DataSetSchDbet.ParamByName('id_sch').Value :=  SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 DataSetSchDbet.Open;
 sum_debt := DataSetSchDbet.FBN('SUMMA_DEBT').AsCurrency;
 nds_debt := DataSetSchDbet.FBN('SUMMA_NDS_DEBT').AsCurrency;

 //сумма дя печати прописью
 AktSchDataSet.Last;
 AktRecalcDataSet.Last;
 nds_sch := AktSchDataSet.FieldByName('summ_st').AsCurrency;
 nds_recalc := AktRecalcDataSet.FieldByName('summ_st').AsCurrency;
 nds_all := nds_sch + nds_recalc + nds_debt;

 AktSchDataSet.MoveBy(-1);
 AktRecalcDataSet.MoveBy(-1);
 sum_sch := AktSchDataSet.FieldByName('summ_st').AsCurrency;
 sum_recalc := AktRecalcDataSet.FieldByName('summ_st').AsCurrency;
 sum_all := sum_sch + sum_recalc + sum_debt - nds_debt;

 sum_to_pay := sum_all + nds_all;

 AktSchDataSet.First;
 AktRecalcDataSet.First;


 DataSetR := TpFIBDataSet.Create(Self);
 DataSetR.Database := Database;
 DataSetR.Transaction := ReadTransaction;
 DataSetR.SQLs.SelectSQL.Text := 'select * from DOG_DT_PL_DOC_REPORT_IS_RECALC (' + IntToStr(SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0]) + ')';
 DataSetR.Open;

{ <-------------------------------------------------------------------------> }
 Query.Close;
 Query.SQL.Clear;
 Query.SQL.Add('SELECT * FROM ARND_AKT_REPORT('+DBText1.Caption+','+DBText2.Caption+');');
 Query.ExecQuery;
 AktDataSet.Close;
 AktDataSet.ParamByName('ID_DOG').Value:=DBText1.Caption;
 AktDataSet.ParamByName('ID_SCH_IN').Value:=DBText2.Caption;
 AktDataSet.Active:=true;
 Query.Close;

 //RepFile:='AktReport.fr3';
    Query.Close;
    Query.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 9';
    Query.ExecQuery;
    if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then RepFile := Query['REPORT_FILE'].AsString;
    Query.Close;

 reg := TRegistry.Create;
 reg.RootKey := HKEY_CURRENT_USER;
 reg.OpenKey('\Software\FMAS\Dogovor\', true);
 reg.WriteString('AktPrintFormat', 'A4');
 reg.CloseKey;
 reg.Free;

 PrintAktProc := dxBarButton3Click;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;

 if (DataSetR.FieldByName('RECALC').AsInteger <> 1) then
 begin
  if frxReport2.FindObject('MasterData3') <> nil then frxReport2.FindObject('MasterData3').Visible := false;
  if frxReport2.FindObject('MasterData4') <> nil then frxReport2.FindObject('MasterData4').Visible := false;
  if frxReport2.FindObject('MasterData5') <> nil then frxReport2.FindObject('MasterData5').Visible := false;
  if frxReport2.FindObject('Footer2') <> nil then frxReport2.FindObject('Footer2').Visible := false;
 end;

 pFIBStoredProc1.Close;
 pFIBStoredProc1.Transaction.StartTransaction;
 pFIBStoredProc1.StoredProcName:='DOG_DT_ARND_DATE_CONVERT';
 pFIBStoredProc1.ParamByName('DATE_IN').AsDate:=AktDate;
 pFIBStoredProc1.ExecProc;

 frxReport2.Script.Variables['DateAktIns']:=pFIBStoredProc1.FldByName['DATE_OUT'].AsString;
 frxReport2.Script.Variables['VikonIns']:=AktVikon;
 pFIBStoredProc1.Transaction.Commit;

// if FastPrint then
// begin
//  frxReport2.PrintOptions.ShowDialog := False;
//  frxReport2.PrepareReport();
//  frxReport2.Print;
// end else frxReport2.ShowReport;
 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  frxReport2.DesignReport else frxReport2.ShowReport;

// if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then frxReport2.DesignReport else frxReport2.ShowReport;

 RahDataSet.Close;
 AktSchDataSet.Close;
 AktRecalcDataSet.Close;
 DataSetR.Close;
 DataSetR.Free;
 RefreshButtonClick(Sender);
end;
// Редактирование исполнителя акта
procedure TArnd_Sch_Form.dxBarButton7Click(Sender: TObject);
var
  EditVikon1:TVikonEdit;
begin
 EditVikon1:=TVikonEdit.Create(Self);

 pFIBQuery1.Close;
 pFIBQuery1.SQL.Clear;
 pFIBQuery1.SQL.Add('select VIKON from DOG_SYS_OPTIONS;');
 pFIBQuery1.ExecQuery;
 EditVikon1.OldEdit.Text:=pFIBQuery1.FldByName['vikon'].AsString;
 EditVikon1.DateBeg.Enabled:=false;
 pFIBQuery1.Close;


 EditVikon1.DateBeg.Date:= AktDate;

 if EditVikon1.ShowModal = mrAll then begin
  pFIBQuery1.SQL.Clear;
  pFIBQuery1.SQL.Add('Update DOG_SYS_OPTIONS SET VIKON='''+EditVikon1.OldEdit.Text+''';');
  pFIBQuery1.ExecQuery;
  pFIBQuery1.Close;
  AktVikon:=EditVikon1.OldEdit.Text;
 end;
 if EditVikon1.ModalResult = mrOk then
 begin
  AktVikon:=EditVikon1.OldEdit.Text;
 end
 else
   Exit;
end;



// Редактирование даты акта  или накладной
procedure TArnd_Sch_Form.EditDateAktOrNukl(IsAkt:Boolean);
var
 RepFile     : string;
 DateToPrnt : Tdate;
 is_debt_sch : Integer;
 reg         : TRegistry;
 DataSetR : TpFIBDataSet;
 sum_sch, sum_recalc, nds_sch, nds_recalc : currency;
 sum_debt, nds_debt : currency;
begin
 EditVikon:=TVikonEdit.Create(Self);
 pFIBQuery1.Close;
 pFIBQuery1.SQL.Clear;
 pFIBQuery1.SQL.Add('select vikon from DOG_SYS_OPTIONS;');
 pFIBQuery1.ExecQuery;
 EditVikon.OldEdit.Text:=pFIBQuery1.FldByName['vikon'].AsString;
 EditVikon.OldEdit.Enabled:=false;
 EditVikon.ApplyButton.Caption:='Друкувати';
 if IsAkt then
   EditVikon.DateBeg.Date:=AktDate
 else
   EditVikon.DateBeg.Date:=NaklDate;
 if EditVikon.ShowModal <> mrOk then
 begin
   pFIBStoredProc1.Transaction.StartTransaction;
   pFIBStoredProc1.StoredProcName:='DOG_DT_ARND_SCH_DATE_NAKL_AKT';
   pFIBStoredProc1.Prepare;
   pFIBStoredProc1.ParamByName('ID_SCH').AsInteger:=Id;
   pFIBStoredProc1.ParamByName('DATE_IN').AsDate:=EditVikon.DateBeg.Date;
   if IsAkt then
     pFIBStoredProc1.ParamByName('IS_AKT').AsString:= 'T'
   else
     pFIBStoredProc1.ParamByName('IS_AKT').AsString:= 'F' ;
   pFIBStoredProc1.ExecProc;
   pFIBStoredProc1.Transaction.Commit;
   RefreshButtonClick(nil);

   Exit;
 end;
 DateToPrnt:=EditVikon.DateBeg.Date;
 // Выводим на печать текущий акт, подставляя нужную дату

 CoInitialize(nil);

 if not BeforePrintSch then Exit;
 AktSchDataSet.Close;
 RahDataSet.Close;
 AktRecalcDataSet.Close;
 DataSetSchDbet.Close;

 RahDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 RahDataSet.Open;

 AktSchDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 AktSchDataSet.Open;

 AktRecalcDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 AktRecalcDataSet.Open;

 //задолженность
 DataSetSchDbet.ParamByName('id_sch').Value :=  SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 DataSetSchDbet.Open;
 sum_debt := DataSetSchDbet.FBN('SUMMA_DEBT').AsCurrency;
 nds_debt := DataSetSchDbet.FBN('SUMMA_NDS_DEBT').AsCurrency;

 //сумма дя печати прописью
 AktSchDataSet.Last;
 AktRecalcDataSet.Last;
 nds_sch := AktSchDataSet.FieldByName('summ_st').AsCurrency;
 nds_recalc := AktRecalcDataSet.FieldByName('summ_st').AsCurrency;
 nds_all := nds_sch + nds_recalc + nds_debt;

 AktSchDataSet.MoveBy(-1);
 AktRecalcDataSet.MoveBy(-1);
 sum_sch := AktSchDataSet.FieldByName('summ_st').AsCurrency;
 sum_recalc := AktRecalcDataSet.FieldByName('summ_st').AsCurrency;
 sum_all := sum_sch + sum_recalc + sum_debt - nds_debt;

 sum_to_pay := sum_all + nds_all;

 AktSchDataSet.First;
 AktRecalcDataSet.First;


 DataSetR := TpFIBDataSet.Create(Self);
 DataSetR.Database := Database;
 DataSetR.Transaction := ReadTransaction;
 DataSetR.SQLs.SelectSQL.Text := 'select * from DOG_DT_PL_DOC_REPORT_IS_RECALC (' + IntToStr(SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0]) + ')';
 DataSetR.Open;

{ <-------------------------------------------------------------------------> }
 Query.Close;
 Query.SQL.Clear;
 Query.SQL.Add('SELECT * FROM ARND_AKT_REPORT('+DBText1.Caption+','+DBText2.Caption+');');
 Query.ExecQuery;
 AktDataSet.Close;
 AktDataSet.ParamByName('ID_DOG').Value:=DBText1.Caption;
 AktDataSet.ParamByName('ID_SCH_IN').Value:=DBText2.Caption;
 AktDataSet.Active:=true;
 Query.Close;
 RepFile:='AktReport.fr3';

 reg := TRegistry.Create;
 reg.RootKey := HKEY_CURRENT_USER;
 reg.OpenKey('\Software\FMAS\Dogovor\', true);
 reg.WriteString('AktPrintFormat', 'A4');
 reg.CloseKey;
 reg.Free;

 PrintAktProc := dxBarButton3Click;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;

 if (DataSetR.FieldByName('RECALC').AsInteger <> 1) then
 begin
  if frxReport2.FindObject('MasterData3') <> nil then frxReport2.FindObject('MasterData3').Visible := false;
  if frxReport2.FindObject('MasterData4') <> nil then frxReport2.FindObject('MasterData4').Visible := false;
  if frxReport2.FindObject('MasterData5') <> nil then frxReport2.FindObject('MasterData5').Visible := false;
  if frxReport2.FindObject('Footer2') <> nil then frxReport2.FindObject('Footer2').Visible := false;
 end;

 pFIBStoredProc1.Close;
 pFIBStoredProc1.Transaction.StartTransaction;
 pFIBStoredProc1.StoredProcName:='DOG_DT_ARND_DATE_CONVERT';
 pFIBStoredProc1.ParamByName('DATE_IN').AsDate:=DateToPrnt;
 pFIBStoredProc1.ExecProc;

 frxReport2.Script.Variables['DateAktIns']:=pFIBStoredProc1.FldByName['DATE_OUT'].AsString;
 frxReport2.Script.Variables['VikonIns']:=AktVikon;
 pFIBStoredProc1.Transaction.Commit;


// if FastPrint then
// begin
//  frxReport2.PrintOptions.ShowDialog := False;
//  frxReport2.PrepareReport();
//  frxReport2.Print;
// end else frxReport2.ShowReport;

// if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then frxReport2.DesignReport else frxReport2.ShowReport;
if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
 frxReport2.DesignReport
 else frxReport2.ShowReport;

 RahDataSet.Close;
 AktSchDataSet.Close;
 AktRecalcDataSet.Close;
 DataSetR.Close;
 DataSetR.Free;
 RefreshButtonClick(nil);



end;
// Моментальная печать
procedure TArnd_Sch_Form.print_bez_gemoraExecute(Sender: TObject);
begin
// PrintMomentPrizn:= 1;
// if (GetAsyncKeyState(VK_SHIFT) and GetAsyncKeyState(80)) <> 0 then PrintMomentPrizn:= 1 else PrintMomentPrizn:= 0;
 print_schExecute(self);
//
end;
// 2 акта приёма передачи на 1м листе
procedure TArnd_Sch_Form.dxBarButton9Click(Sender: TObject);
var
 RepFile     : string;
 is_debt_sch : Integer;
 reg         : TRegistry;
 DataSetR : TpFIBDataSet;
 sum_sch, sum_recalc, nds_sch, nds_recalc : currency;
 sum_debt, nds_debt : currency;
begin
 CoInitialize(nil);

 if not BeforePrintSch then Exit;
 AktSchDataSet.Close;
 RahDataSet.Close;
 AktRecalcDataSet.Close;
 DataSetSchDbet.Close;

 RahDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 RahDataSet.Open;

 AktSchDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 AktSchDataSet.Open;

 AktRecalcDataSet.ParamByName('ID_SCH').AsInt64 := SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 AktRecalcDataSet.Open;

 //задолженность
 DataSetSchDbet.ParamByName('id_sch').Value :=  SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0];
 DataSetSchDbet.Open;
 sum_debt := DataSetSchDbet.FBN('SUMMA_DEBT').AsCurrency;
 nds_debt := DataSetSchDbet.FBN('SUMMA_NDS_DEBT').AsCurrency;

 //сумма дя печати прописью
 AktSchDataSet.Last;
 AktRecalcDataSet.Last;
 nds_sch := AktSchDataSet.FieldByName('summ_st').AsCurrency;
 nds_recalc := AktRecalcDataSet.FieldByName('summ_st').AsCurrency;
 nds_all := nds_sch + nds_recalc + nds_debt;

 AktSchDataSet.MoveBy(-1);
 AktRecalcDataSet.MoveBy(-1);
 sum_sch := AktSchDataSet.FieldByName('summ_st').AsCurrency;
 sum_recalc := AktRecalcDataSet.FieldByName('summ_st').AsCurrency;
 sum_all := sum_sch + sum_recalc + sum_debt - nds_debt;

 sum_to_pay := sum_all + nds_all;

 AktSchDataSet.First;
 AktRecalcDataSet.First;


 DataSetR := TpFIBDataSet.Create(Self);
 DataSetR.Database := Database;
 DataSetR.Transaction := ReadTransaction;
 DataSetR.SQLs.SelectSQL.Text := 'select * from DOG_DT_PL_DOC_REPORT_IS_RECALC (' + IntToStr(SchTableView.DataController.Values[SchTableView.DataController.FocusedRecordIndex, 0]) + ')';
 DataSetR.Open;

{ <-------------------------------------------------------------------------> }
 Query.Close;
 Query.SQL.Clear;
 Query.SQL.Add('SELECT * FROM ARND_AKT_REPORT('+DBText1.Caption+','+DBText2.Caption+');');
 Query.ExecQuery;
 AktDataSet.Close;
 AktDataSet.ParamByName('ID_DOG').Value:=DBText1.Caption;
 AktDataSet.ParamByName('ID_SCH_IN').Value:=DBText2.Caption;
 AktDataSet.Active:=true;
 Query.Close;

 //RepFile:='AktReportA42.fr3';

    Query.Close;
    Query.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 10';
    Query.ExecQuery;
    if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then RepFile := Query['REPORT_FILE'].AsString;
    Query.Close;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;

 reg := TRegistry.Create;
 reg.RootKey := HKEY_CURRENT_USER;
 reg.OpenKey('\Software\FMAS\Dogovor\', true);
 reg.WriteString('AktPrintFormat', 'A5');
 reg.CloseKey;
 reg.Free;
 PrintAktProc := dxBarButton9Click;

 if (DataSetR.FieldByName('RECALC').AsInteger <> 1) then
 begin
  if frxReport2.FindObject('MasterData3') <> nil then frxReport2.FindObject('MasterData3').Visible := false;
  if frxReport2.FindObject('MasterData4') <> nil then frxReport2.FindObject('MasterData4').Visible := false;
  if frxReport2.FindObject('MasterData5') <> nil then frxReport2.FindObject('MasterData5').Visible := false;
  if frxReport2.FindObject('Footer2') <> nil then frxReport2.FindObject('Footer2').Visible := false;
 end;

 pFIBStoredProc1.Close;
 pFIBStoredProc1.Transaction.StartTransaction;
 pFIBStoredProc1.StoredProcName:='DOG_DT_ARND_DATE_CONVERT';
 pFIBStoredProc1.ParamByName('DATE_IN').AsDate:=AktDate;
 pFIBStoredProc1.ExecProc;

 frxReport2.Script.Variables['DateAktIns']:=pFIBStoredProc1.FldByName['DATE_OUT'].AsString;
 frxReport2.Script.Variables['VikonIns']:=AktVikon;
 pFIBStoredProc1.Transaction.Commit;

// if FastPrint then
// begin
//  frxReport2.PrintOptions.ShowDialog := False;
//  frxReport2.PrepareReport();
//  frxReport2.Print;
// end else frxReport2.ShowReport;
 // if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then frxReport2.DesignReport else frxReport2.ShowReport;
// frxReport2.DesignReport;
 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
 frxReport2.DesignReport
 else frxReport2.ShowReport;

 RahDataSet.Close;
 AktSchDataSet.Close;
 AktRecalcDataSet.Close;
 DataSetR.Close;
 DataSetR.Free;
 RefreshButtonClick(Sender);
end;

// Печать акта приёма - передачи
procedure TArnd_Sch_Form.PrintAktButtonClick(Sender: TObject);
begin
 PrintAktProc(Sender);
end;

procedure TArnd_Sch_Form.PrintAktExecute(Sender: TObject);
begin
 PrintAktButtonClick(Sender);
end;

procedure TArnd_Sch_Form.PrintNaklExecute(Sender: TObject);
begin
 PrintNalogButtonClick(Sender);
end;

procedure TArnd_Sch_Form.SchGridEnter(Sender: TObject);
begin
 DataSet.FetchAll;
 DataSet.Last;
end;

procedure TArnd_Sch_Form.dxBarButton13Click(Sender: TObject);
begin
 Print1NaklButtonClick(Sender);
// PrintNewNakl();

end;

procedure TArnd_Sch_Form.dxBarButton18Click(Sender: TObject);
var
 RepFile : string;
 NewSh : Integer;
 m1 : TfrxMemoView;
 m2 : TfrxMemoView;

 m3 : TfrxMemoView;
 m4 : TfrxMemoView;

 m5 : TfrxMemoView;
 m6 : TfrxMemoView;

 m7 : TfrxMemoView;
 m8 : TfrxMemoView;

begin
 RepFile := '';
 Query.Close;
 Query.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 6';
 Query.ExecQuery;
 //if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then repFile := 'Invoice2011.fr3';
 repFile := Query['REPORT_FILE'].AsString;
 Query.Close;

 DataSetNacl.FetchAll;
 RahDataSetNacl.FetchAll;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then ReportNacl.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;



 m1:= TfrxMemoView(ReportNacl.FindObject('Memo210'));
 m1.Text := 'X';

 m2:= TfrxMemoView(ReportNacl.FindObject('Memo3'));
 m2.Text := '';

 m3:= TfrxMemoView(ReportNacl.FindObject('Memo211'));
 m3.Text := '0';

 m4:= TfrxMemoView(ReportNacl.FindObject('Memo212'));
 m4.Text := '2';

 //m5 :=TfrxMemoView(ReportNacl.FindObject('Memo165'));
 //m5.Text :='0';

 //m6 :=TfrxMemoView(ReportNacl.FindObject('Memo189'));
 //m6.Text :='0';

  m7:= TfrxMemoView(ReportNacl.FindObject('Memo214'));
  m7.Text := '';


 if not PrintNacl then Exit;

// if FastPrint then
//  begin
//   ReportNacl.PrintOptions.ShowDialog := False;
//   ReportNacl.PrepareReport();
//   ReportNacl.Print;
//  end else ReportNacl.ShowReport;
//
if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  ReportNacl.DesignReport else ReportNacl.ShowReport;

 RahDataSet.Close;
 DataSetNacl.Close;
 DataSetSumNds.Close;
 DataSetSchDbet.Close;
end;

procedure TArnd_Sch_Form.dxBarButton8Click(Sender: TObject);
begin
  EditDateAktOrNukl(false);
end;

procedure TArnd_Sch_Form.dxBarButton12Click(Sender: TObject);
begin
  EditDateAktOrNukl(true);
end;

procedure TArnd_Sch_Form.SchTableViewCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  AHandled := false;
 if ACellViewInfo.Item.Index =29  then begin
  if Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 29] = 1 then
    Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 29] := 0
   else
    Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 29] := 1;
   AHandled := true;
// end;
end;
end;

procedure TArnd_Sch_Form.ButtonExportTiClick(Sender: TObject);
  var formExport : TFormExport;
      selected,i,j:Integer;
       id_sch : array of integer;
       dates : array of tdate;
       T : TDate;
       T1:Integer;
       s:String;
begin

  selected := SchTableView.DataController.RecNo;
  if GoToFirstSelected(SchTableView, DataSet) then repeat
    SetLength(id_sch, Length(id_sch) + 1);
    id_sch[Length(id_sch) - 1] := DataSet['ID_SCH'];

    SetLength(dates, Length(dates) + 1);
    dates[Length(dates) - 1] := DataSet['DATE_SCH'];

  until not GoToNextSelected(SchTableView, DataSet);
  if Length(id_sch) = 0 then begin
    SchTableView.DataController.RecNo := selected;
    SetLength(id_sch, Length(id_sch) + 1);
    id_sch[Length(id_sch) - 1] := DataSet['ID_SCH'];
    SetLength(dates, Length(dates) + 1);
    dates[Length(dates) - 1] := DataSet['DATE_SCH'];
    //ShowMessage('Виберіть хоча б один запис.');
    //exit;
  end;

  for i:=0 to Length(dates)-1 do
  begin
    j:= Length(dates)-1;
    while (j>i)do
    begin
      if ( dates[j-1] >dates[j] ) then
      begin
        T:= dates[j-1]; dates[j-1]:=dates[j]; dates[j]:=T;
        T1:= id_sch[j-1]; id_sch[j-1]:=id_sch[j]; id_sch[j]:=T1;
      end;
       j:=j-1;
    end
  end;




  s:='';
  for i:=0 to Length(id_sch)-1 do
  begin
    s:=s+inttostr(id_sch[i]);
    if i<>Length(id_sch)-1 then s:=s+',';
  end;




  formExport          := TformExport.Create(self);
  formExport.Database.Handle:= Database.Handle;
  formExport.Database.Open;
  formExport.DataSet.Close;
  formExport.DataSet.SelectSQL.Text:='select * from DOG_IMPORT_PREVIOUS('''+s+''')';

  formExport.DataSet.Open;
  formExport.DataSet.FetchAll;
   formExport.SelectAll;
   if ( formExport.ShowModal = mrYes)then
   begin
     RefreshButtonClick(Sender);
   end;

end;

function GoToFirstSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;
var
  i : integer;

begin
  Result := false;
  if DataSet.RecordCount = 0 then exit;
  TableView.DataController.FocusedRecordIndex := 0;
  i := 0;
  while (i < TableView.DataController.RecordCount) and (TableView.DataController.Values[i, 29] <> 1) do inc(i);
  DataSet.MoveBy(i);
  if i <> TableView.DataController.RecordCount then Result := true;
end;

function GoToNextSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;
var
  i : integer;
begin
  Result := false;
  if DataSet.RecordCount = 0 then exit;
  i := TableView.DataController.FocusedRecordIndex + 1;
  while (i < TableView.DataController.RecordCount) and (TableView.DataController.Values[i, 29] <> 1) do inc(i);
  DataSet.MoveBy(i - TableView.DataController.FocusedRecordIndex);
  if i <> TableView.DataController.RecordCount then Result := true;
end;

procedure TArnd_Sch_Form.dxBarButton19Click(Sender: TObject);
var
 RepFile : string;
 NewSh : Integer;
 m1 : TfrxMemoView;
 m2 : TfrxMemoView;

 m3 : TfrxMemoView;
 m4 : TfrxMemoView;

 m5 : TfrxMemoView;
 m6 : TfrxMemoView;

 m7 : TfrxMemoView;
 m8 : TfrxMemoView;

begin
 RepFile := '';
 Query.Close;
 Query.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 6';
 Query.ExecQuery;
 //if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then repFile := 'Invoice2011.fr3';
 repFile := Query['REPORT_FILE'].AsString;
 Query.Close;

 DataSetNacl.FetchAll;
 RahDataSetNacl.FetchAll;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then ReportNacl.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;

 m1:= TfrxMemoView(ReportNacl.FindObject('Memo210'));
 m1.Text := '';

 m2:= TfrxMemoView(ReportNacl.FindObject('Memo3'));
 m2.Text := '';

 m3:= TfrxMemoView(ReportNacl.FindObject('Memo211'));
 m3.Text := '';

 m4:= TfrxMemoView(ReportNacl.FindObject('Memo212'));
 m4.Text := '';

 //m5 :=TfrxMemoView(ReportNacl.FindObject('Memo165'));
 //m5.Text :='';

 //m6 :=TfrxMemoView(ReportNacl.FindObject('Memo189'));
 //m6.Text :='';

 m7 :=TfrxMemoView(ReportNacl.FindObject('Memo214'));
 m7.Text :='X';

 if not PrintNacl then Exit;

// if FastPrint then
//  begin
//   ReportNacl.PrintOptions.ShowDialog := False;
//   ReportNacl.PrepareReport();
//   ReportNacl.Print;
//  end else ReportNacl.ShowReport;
//
if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  ReportNacl.DesignReport else ReportNacl.ShowReport;

 RahDataSet.Close;
 DataSetNacl.Close;
 DataSetSumNds.Close;
 DataSetSchDbet.Close;

end;



procedure TArnd_Sch_Form.NumRuhButtonClick(Sender: TObject);
var
 f : TTNaklNumForm;
begin
  with SchTableView.DataController do begin

    if FocusedRecordIndex < 0 then Exit;
    f := TTNaklNumForm.Create(Self);
    f.Caption:='Редагувати номер';
    f.cxSpinEdit1.Visible:= False;

    if not VarIsNull(Values[FocusedRecordIndex, 9]) then
      f.NumNaklEdit.Text :=  SchTableView.DataController.Values[FocusedRecordIndex, 9];
      if f.ShowModal <> mrOk then Exit;
      StoredProc.Transaction.StartTransaction;
      StoredProc.ExecProcedure('DOG_DT_ARND_SCH_NUM', [f.NumNaklEdit.Text,Values[FocusedRecordIndex, 0]]);
      StoredProc.Transaction.Commit;
  end;
  RefreshButtonClick(Sender);
end;




procedure TArnd_Sch_Form.ButtonNumBeginClick(Sender: TObject);
var
 f : TTNaklNumForm;
 a : Integer;
begin
  with SchTableView.DataController do begin

    if FocusedRecordIndex < 0 then Exit;

    f := TTNaklNumForm.Create(Self);
    f.Caption:='Почати нумерувати з';
    f.NumNaklEdit.Visible:= False;
    f.cxSpinEdit1.Visible:= True;
    f.cxSpinEdit1.Enabled:= True;

    if f.ShowModal <> mrOk then Exit;
    if f.cxSpinEdit1.Value<=0
    then
      begin
        ShowMessage('Номер рахунку повинен бути більше 0!');
        f.cxSpinEdit1.Value:=0;
        f.ShowModal;
      end
    else
      begin
        a:=f.cxSpinEdit1.Value;
        StoredProc.Transaction.StartTransaction;
        StoredProc.ExecProcedure('DOG_DT_ARND_SCH_NUM_GEN', [a-1]);
        StoredProc.Transaction.Commit;
        RefreshButtonClick(Sender);
      end;
  end;
end;


  
procedure TArnd_Sch_Form.SchTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Selected
  then begin
    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := RGB(43, 139, 236);
  end;
end;


procedure TArnd_Sch_Form.dxbrbtn1Click(Sender: TObject);
var
  EditVikon1:TVikonEdit;
begin
 EditVikon1:=TVikonEdit.Create(Self);

 pFIBQuery1.Close;
 pFIBQuery1.SQL.Clear;
 pFIBQuery1.SQL.Add('select ARND_INVOICE_VISA from DOG_SYS_OPTIONS;');
 pFIBQuery1.ExecQuery;
 EditVikon1.OldEdit.Text:=pFIBQuery1.FldByName['ARND_INVOICE_VISA'].AsString;
 EditVikon1.DateBeg.Enabled:=false;
 pFIBQuery1.Close;


 EditVikon1.DateBeg.Date:= AktDate;

 if EditVikon1.ShowModal = mrAll then begin
  pFIBQuery1.SQL.Clear;
  pFIBQuery1.SQL.Add('Update DOG_SYS_OPTIONS SET ARND_INVOICE_VISA='''+EditVikon1.OldEdit.Text+''';');
  pFIBQuery1.ExecQuery;
  pFIBQuery1.Close;
  AktVikon:=EditVikon1.OldEdit.Text;
 end;
 if EditVikon1.ModalResult = mrOk then
 begin
  AktVikon:=EditVikon1.OldEdit.Text;
 end
 else
   Exit;
end;

procedure TArnd_Sch_Form.dxBarButton17Click(Sender: TObject);
var
 RepFile : string;
 NewSh : Integer;
 m1 : TfrxMemoView;
 m2 : TfrxMemoView;
 m3 : TfrxMemoView;
 m4 : TfrxMemoView;
 m5 : TfrxMemoView;
 m6 : TfrxMemoView;
 m7 : TfrxMemoView;
begin
 RepFile:='';
 Query.Close;
 Query.SQL.Text:='select REPORT_FILE from dog_ini_reports where id_report = 6';
 Query.ExecQuery;
 //if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then repFile := 'Invoice2011.fr3';
 repFile := Query['REPORT_FILE'].AsString;
 Query.Close;

 DataSetNacl.FetchAll;
 RahDataSet.FetchAll;
 RahDataSetNacl.FetchAll;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then ReportNacl.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   exit;
 end;

 m1:= TfrxMemoView(ReportNacl.FindObject('Memo210'));
 m1.Text := '';

 m2:= TfrxMemoView(ReportNacl.FindObject('Memo3'));
 m2.Text := 'Х';

 m3:= TfrxMemoView(ReportNacl.FindObject('Memo211'));
 m3.Text := '';

 m4:= TfrxMemoView(ReportNacl.FindObject('Memo212'));
 m4.Text := '';

 //m5 :=TfrxMemoView(ReportNacl.FindObject('Memo165'));
 //m5.Text :='';

 //m6 :=TfrxMemoView(ReportNacl.FindObject('Memo189'));
 //m6.Text :='';

 m7 :=TfrxMemoView(ReportNacl.FindObject('Memo214'));
 m7.Text :='';

 if not PrintNacl then Exit;

  // if FastPrint then
  // begin
  // ReportNacl.PrintOptions.ShowDialog := False;
  // ReportNacl.PrepareReport();
  // ReportNacl.Print;
  // end else ReportNacl.ShowReport;
  //
  if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  ReportNacl.DesignReport else ReportNacl.ShowReport;

 RahDataSet.Close;
 RahDataSetNacl.Close;
 DataSetNacl.Close;
 DataSetSumNds.Close;
 DataSetSchDbet.Close;
end;

procedure TArnd_Sch_Form.dxBarButton14Click(Sender: TObject);
var
 RepFile : string;
 NewSh : Integer;
 m1 : TfrxMemoView;
 m2 : TfrxMemoView;

 m3 : TfrxMemoView;
 m4 : TfrxMemoView;

 m5 : TfrxMemoView;
 m6 : TfrxMemoView;

 m7 : TfrxMemoView;
 m8 : TfrxMemoView;


begin
   RepFile := '';
   Query.Close;
   Query.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 13';
   Query.ExecQuery;
   //if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then repFile := 'Invoice2011.fr3';
   repFile := Query['REPORT_FILE'].AsString;
   Query.Close;

   DataSetNacl.FetchAll;
   RahDataSetNacl.FetchAll;

   if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then ReportNacl.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
   else
   begin
     ShowMessage('Файл звіту "' + repFile + '" не знайден!');
     exit;
   end;



   m1:= TfrxMemoView(ReportNacl.FindObject('Memo210'));
   m1.Text := 'X';

   m2:= TfrxMemoView(ReportNacl.FindObject('Memo3'));
   m2.Text := '';

   m3:= TfrxMemoView(ReportNacl.FindObject('Memo211'));
   m3.Text := '0';

   m4:= TfrxMemoView(ReportNacl.FindObject('Memo212'));
   m4.Text := '2';

   //m5 :=TfrxMemoView(ReportNacl.FindObject('Memo165'));
   //m5.Text :='0';

   //m6 :=TfrxMemoView(ReportNacl.FindObject('Memo189'));
   //m6.Text :='0';

    m7:= TfrxMemoView(ReportNacl.FindObject('Memo4'));
    m7.Text := '';


   if not PrintNacl then Exit;

  // if FastPrint then
  //  begin
  //   ReportNacl.PrintOptions.ShowDialog := False;
  //   ReportNacl.PrepareReport();
  //   ReportNacl.Print;
  //  end else ReportNacl.ShowReport;
  //
  if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
    ReportNacl.DesignReport else ReportNacl.ShowReport;

   RahDataSet.Close;
   DataSetNacl.Close;
   DataSetSumNds.Close;
   DataSetSchDbet.Close;
end;


procedure TArnd_Sch_Form.dxBarButton15Click(Sender: TObject);
var
 RepFile : string;
 NewSh : Integer;
 m1 : TfrxMemoView;
 m2 : TfrxMemoView;

 m3 : TfrxMemoView;
 m4 : TfrxMemoView;

 m5 : TfrxMemoView;
 m6 : TfrxMemoView;

 m7 : TfrxMemoView;
 m8 : TfrxMemoView;

begin
   RepFile := '';
   Query.Close;
   Query.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 13';
   Query.ExecQuery;
   //if Query.RecordCount <> 0 then if not VarIsNull(Query['REPORT_FILE'].AsVariant) then repFile := 'Invoice2011.fr3';
   repFile := Query['REPORT_FILE'].AsString;
   Query.Close;

   DataSetNacl.FetchAll;
   RahDataSetNacl.FetchAll;

   if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then ReportNacl.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
   else
   begin
     ShowMessage('Файл звіту "' + repFile + '" не знайден!');
     exit;
   end;

   m1:= TfrxMemoView(ReportNacl.FindObject('Memo210'));
   m1.Text := '';

   m2:= TfrxMemoView(ReportNacl.FindObject('Memo3'));
   m2.Text := '';

   m3:= TfrxMemoView(ReportNacl.FindObject('Memo211'));
   m3.Text := '';

   m4:= TfrxMemoView(ReportNacl.FindObject('Memo212'));
   m4.Text := '';

   //m5 :=TfrxMemoView(ReportNacl.FindObject('Memo165'));
   //m5.Text :='';

   //m6 :=TfrxMemoView(ReportNacl.FindObject('Memo189'));
   //m6.Text :='';

   m7 :=TfrxMemoView(ReportNacl.FindObject('Memo4'));
   m7.Text :='X';

   if not PrintNacl then Exit;

  // if FastPrint then
  //  begin
  //   ReportNacl.PrintOptions.ShowDialog := False;
  //   ReportNacl.PrepareReport();
  //   ReportNacl.Print;
  //  end else ReportNacl.ShowReport;
  //
  if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
    ReportNacl.DesignReport else ReportNacl.ShowReport;

   RahDataSet.Close;
   DataSetNacl.Close;
   DataSetSumNds.Close;
   DataSetSchDbet.Close;
end;

end.

