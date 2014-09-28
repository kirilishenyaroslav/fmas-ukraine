unit dogFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDataSet, pFIBDataSet, cxContainer, cxLabel, cxCheckBox,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxCalendar, cxCurrencyEdit, dxBar,
  dxBarExtItems, StdCtrls, ActnList, IBase, FIBDatabase, pFIBDatabase,
  cxTextEdit, cxMemo, cxFilterControl, cxDBFilterControl, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, LoadDogManedger, ImgList, cxTL, frxClass, frxDBSet,
  cxGroupBox, Registry, DogLoaderUnit, cxVariants, cxLookAndFeelPainters,
  cxButtons, cxButtonEdit, cxImage, Menus, GlobalSPR, fltDogFormUnit, ClipBrd,
  DateUtils, Math, dxStatusBar, AArray, Grids, DBGrids, frxDesgn,
  frxExportRTF, frxExportXLS, frxExportHTML, frxExportTXT, frxExportPDF, Accmgmt,
  CustomizerUnit, cxDBLabel, Printers, AppEvnts,ActiveX,ComObj,spec_flt;

type
  TPeriodRecord = packed record
   _id_Period : integer;
   _Date_Beg  : TDate;
   _Date_End  : TDate;
   _Sum       : currency;
  end;

  TPeriodDataRecord = packed record
   _id_Period : integer;
   _id_S    : integer;
   _id_R    : integer;
   _id_St   : integer;
   _id_Kekv : integer;
   _Sum     : currency;
  end;

  TSmetRecord = packed record
   _id_S    : integer;
   _id_R    : integer;
   _id_St   : integer;
   _id_Kekv : integer;
   _Sum     : currency;

   _Handled : boolean;
  end;

  TPeriodArray = array of TPeriodRecord;
  TPeriodDataArray = array of TPeriodDataRecord;
  TSmetArray = array of TSmetRecord;

  TdogForm = class(TForm)
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    WriteProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    ViewButton: TdxBarLargeButton;
    FilterButton: TdxBarLargeButton;
    pFIBStoredProc1: TpFIBStoredProc;
    cxStyleRepository1: TcxStyleRepository;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    DisabledLargeImages: TImageList;
    DisabledSmallImages: TImageList;
    SmallImages: TImageList;
    LargeImages: TImageList;
    SelButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    pFIBQuery1: TpFIBQuery;
    CloseOpenButton: TdxBarLargeButton;
    pFIBTransaction1: TpFIBTransaction;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DOG_CLOSE: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_TIP_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1KOD_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1ID_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1ID_TIP_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1N_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1D_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1NOMN_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1NOMD_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1ID_CUSTOMER: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_CUSTOMER: TcxGridDBColumn;
    cxGrid1DBTableView1ID_RATE_ACCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_END: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1DOG_CONTINUE: TcxGridDBColumn;
    cxGrid1DBTableView1NOT_SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1DOG_NOTE: TcxGridDBColumn;
    cxGrid1DBTableView1FIO_DONGU: TcxGridDBColumn;
    cxGrid1DBTableView1FIO_POSTAV: TcxGridDBColumn;
    cxGrid1DBTableView1KRIT_DAT: TcxGridDBColumn;
    cxGrid1DBTableView1NDS_SUM: TcxGridDBColumn;
    cxGrid1DBTableView1NDS_PAY: TcxGridDBColumn;
    cxGrid1DBTableView1SUM_PAY: TcxGridDBColumn;
    cxGrid1DBTableView1SUM_FULFIL: TcxGridDBColumn;
    cxGrid1DBTableView1SUM_TODAY: TcxGridDBColumn;
    cxGrid1DBTableView1BEFOR_PAY: TcxGridDBColumn;
    cxGrid1DBTableView1BEFOR_PRCN: TcxGridDBColumn;
    cxGrid1DBTableView1REGEST_NUM: TcxGridDBColumn;
    cxGrid1DBTableView1USE_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1USE_END: TcxGridDBColumn;
    cxGrid1DBTableView1TIME_EDIT: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_EDIT: TcxGridDBColumn;
    cxGrid1DBTableView1ID_USER: TcxGridDBColumn;
    cxGrid1DBTableView1COMMENT: TcxGridDBColumn;
    cxGrid1DBTableView1ID_RATE_ACC_NATIVE: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_SHABLON: TcxGridDBColumn;
    cxGrid1DBTableView1RATE_ACC: TcxGridDBColumn;
    cxGrid1DBTableView1MFO: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_BANK: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    PayFulfilButton: TdxBarLargeButton;
    InputGroupBox: TGroupBox;
    Label1: TLabel;
    InputSummaEdit: TcxTextEdit;
    Label2: TLabel;
    InputCustomerEdit: TcxTextEdit;
    InputRateAccEdit: TcxTextEdit;
    Label3: TLabel;
    Panel3: TPanel;
    cxGrid1DBTableView1ID_BL_ACCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1IMAGE: TcxGridDBColumn;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ShowUserButton: TcxButton;
    Label5: TLabel;
    SumFindEdit: TcxTextEdit;
    N2: TMenuItem;
    N3: TMenuItem;
    piCloseOpen: TMenuItem;
    N5: TMenuItem;
    dxBarLargeButton1: TdxBarLargeButton;
    N6: TMenuItem;
    piAdd: TMenuItem;
    piEdit: TMenuItem;
    piDelete: TMenuItem;
    piView: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    Panel2: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxDBMemo1: TcxDBMemo;
    cxLabel2: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxLabel11: TcxLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    HideInfoPanelButton: TSpeedButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    PayButton: TdxBarLargeButton;
    PayAllButton: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar2: TdxStatusBar;
    miPlat: TMenuItem;
    dxBarLargeButton3: TdxBarLargeButton;
    Label6: TLabel;
    InfoNoteMemo: TcxMemo;
    cxGrid1DBTableView1IS_ZAYAV: TcxGridDBColumn;
    ActionList1: TActionList;
    FilterAction: TAction;
    CancelFilterAction: TAction;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    dxBarInPlaceSubItem1: TdxBarInPlaceSubItem;
    dxBarContainerItem1: TdxBarContainerItem;
    CustEdit: TcxTextEdit;
    Label4: TLabel;
    Timer1: TTimer;
    cbSort: TcxComboBox;
    cxLabel1: TcxLabel;
    SpeedButton1: TSpeedButton;
    dxBarLargeButton4: TdxBarLargeButton;
    frxDBDatasetRep: TfrxDBDataset;
    dxBarLargeButton5: TdxBarLargeButton;
    frxDesigner1: TfrxDesigner;
    dxBarButton3: TdxBarButton;
    DataSet1: TpFIBDataSet;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxLabel10: TcxLabel;
    cxLabel12: TcxLabel;
    frxPDFExport1: TfrxPDFExport;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    add: TAction;
    edit: TAction;
    view: TAction;
    Print: TAction;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    cxButton1: TcxButton;
    cbUseShort: TcxCheckBox;
    dxBarLargeButton8: TdxBarLargeButton;
    cxGrid1DBTableView1Information: TcxGridDBColumn;
    Panel4: TPanel;
    cxDBLabel1: TcxDBLabel;
    Bevel1: TBevel;
    cxLabel13: TcxLabel;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxDBLabel4: TcxDBLabel;
    cxDBLabel5: TcxDBLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxDBLabel6: TcxDBLabel;
    Bevel2: TBevel;
    cxLabel18: TcxLabel;
    cxDBLabel7: TcxDBLabel;
    cxLabel19: TcxLabel;
    cxDBLabel8: TcxDBLabel;
    cxLabel20: TcxLabel;
    cxDBLabel9: TcxDBLabel;
    cxLabel21: TcxLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBLabel10: TcxDBLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxDBLabel11: TcxDBLabel;
    cxLabel24: TcxLabel;
    cxDBLabel12: TcxDBLabel;
    cxDBLabel13: TcxDBLabel;
    cxDBCheckBox2: TcxDBCheckBox;
    cxLabel25: TcxLabel;
    cxDBCheckBox3: TcxDBCheckBox;
    cxLabel26: TcxLabel;
    cxLabel28: TcxLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    cxLabel29: TcxLabel;
    cxLabel27: TcxLabel;
    cxDBLabel14: TcxDBLabel;
    cxDBLabel15: TcxDBLabel;
    cxLabel30: TcxLabel;
    cxLabel31: TcxLabel;
    cxDBLabel16: TcxDBLabel;
    cxLabel32: TcxLabel;
    cxDBLabel17: TcxDBLabel;
    cxLabel33: TcxLabel;
    cxDBLabel18: TcxDBLabel;
    cxLabel34: TcxLabel;
    cxDBLabel19: TcxDBLabel;
    Bevel5: TBevel;
    cxLabel35: TcxLabel;
    cxDBMemo2: TcxDBMemo;
    Bevel6: TBevel;
    Bevel7: TBevel;
    WTransaction2: TpFIBTransaction;
    ApplicationEvents1: TApplicationEvents;
    WriteProc2: TpFIBStoredProc;
    dxBarLargeButton9: TdxBarLargeButton;
    RepSpecMainDS: TpFIBDataSet;
    RepSpecDetailDS: TpFIBDataSet;
    SpecDS: TDataSource;
    frxRepSpecMainDS: TfrxDBDataset;
    frxRepSpecDetailDS: TfrxDBDataset;
    PrintSpecButton: TdxBarLargeButton;
    RepSpec: TfrxReport;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton4: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton5: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    DataSource1: TDataSource;
    ShifrDSet: TfrxDBDataset;
    pFIBQuery2: TpFIBQuery;
    dxBarButton7: TdxBarButton;
    pFIBDataSet1: TpFIBDataSet;
    ShifrRep: TfrxReport;
    pFIBQuery3: TpFIBQuery;
    //agColumnCustomizer1: TagColumnCustomizer;
    frxDBDataset1: TfrxDBDataset;
    repClassDataset: TpFIBDataSet;
    RepDataSet: TpFIBDataSet;
    ClassPrepare: TpFIBStoredProc;
    agColumnCustomizer1: TagColumnCustomizer;
    cxLabel36: TcxLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    frxReportDog: TfrxReport;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarPopupMenu2: TdxBarPopupMenu;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure CloseOpenButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure PayFulfilButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1IMAGECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure N1Click(Sender: TObject);
    procedure ShowUserButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SumFindEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure CancelFilterButtonClick(Sender: TObject);
    procedure piCloseOpenClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure HideInfoPanelButtonClick(Sender: TObject);
    procedure PayButtonClick(Sender: TObject);
    procedure PayAllButtonClick(Sender: TObject);
    procedure miPlatClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FilterButtonClick(Sender: TObject);
    procedure CustEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure frxReportDogGetValue(const VarName: String;
      var Value: Variant);
    procedure dxBarButton3Click(Sender: TObject);
    procedure addExecute(Sender: TObject);
    procedure editExecute(Sender: TObject);
    procedure viewExecute(Sender: TObject);
    procedure PrintExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cbUseShortClick(Sender: TObject);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure cxGrid1DBTableView1MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure cxGrid1DBTableView1InformationCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure dxBarLargeButton9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PrintSpecButtonClick(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarLargeButton10Click(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
//    procedure dxBarButton3Click(Sender: TObject);
  public
    fltForm : TFltDogForm;
    AllowMultiSelect : boolean;
    KeyField : string;
    res : TDogResult;
    id_class:integer;
    input : TDogInput;
    a_in  : TAArray;
    a_out : TAArray;
    search_str:string;
    rpDateBeg, rpDateEnd : TDate;
    DatasetCheck:TFIBDataSet;
    t:Variant;
//    ShowInfoPanel : boolean;

    CheckForUrzbByDog : boolean;

    procedure CheckRecordExists;
    procedure SelectAll(doOrderById : Boolean = False; filter_by_sum_today : Boolean = false);
    procedure InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
    procedure ResProc(id : int64; Action : TResAction);
    procedure CalcSmetsSumma(ts : Currency);
    procedure BuildColumns;
    procedure ShowHidButtonCaptions;
    function  Calc(InArray: TSmetArray; InSum: currency; id_Dog : int64): TSmetArray;
  end;

  function GetSpr(input_params : TDogInput) : TDogResult; stdcall;
  procedure Load(input, Result : TAArray);
  exports GetSpr, Load;

implementation
uses
    WSUnit, DogDataInputForm, ST_Loader_Unit, LangUnit, IB_EXTERNALS, dogFormRepDataUnit,
    platInfoForm,
    //BRom
    {uTreatiesDM,
    ujbTypes, ujbApplication, ujbKernel, } cn_Common_Loader,  cn_Common_Types, Types;

{$R *.dfm}
procedure Load(input, Result : TAArray);
var
  frm : TdogForm;
  r   : Integer;
begin
 frm := TDogForm.Create(TComponent(input['Owner'].asObject));
 frm.a_in := input;
 frm.a_out := result;
 frm.input.Summa := IfNull(frm.a_in['summa'].AsVariant, 0);
// showmessage(floattostr(input['summa'].AsVariant));

 frm.fltForm.id_Group := frm.a_in['ID_GROUP'].AsInteger;
 if frm.a_in['Caption'].AsString <> '' then frm.Caption := frm.a_in['Caption'].AsString;
 if frm.a_in['isZayav'].AsVariant then
 begin
   frm.Caption := 'Реєстр заявок до оплати';
   frm.fltForm.ShowClosedCheck.Visible := false;
   frm.fltForm.fltShowClosed := 0;
   frm.PayButton.Visible := ivAlways;
   frm.PayAllButton.Visible := ivAlways;
 end;

 frm.BuildColumns;
 frm.InitConnection(PVoid(frm.a_in['Database'].AsInteger), PVoid(frm.a_in['ReadTransaction'].AsInteger), PVoid(frm.a_in['WriteTransaction'].AsInteger));
 frm.FormStyle := frm.a_in['FormStyle'].AsVariant;

 if frm.a_in['Filter']['Use'].AsVariant then
 begin
   frm.fltForm.fltRegNumCheck.Checked := frm.a_in['Filter']['bRegNum'].AsVariant;
   frm.fltForm.fltRegNumEdit.Text     := frm.a_in['Filter']['RegNum'].AsString;
   frm.fltForm.fltSumCheck.Checked    := frm.a_in['Filter']['bSumma'].AsVariant;
   frm.fltForm.fltSumFromEdit.Value   := frm.a_in['Filter']['SummaFrom'].AsCurrency;
   frm.fltForm.fltSumToEdit.Value     := frm.a_in['Filter']['SummaTo'].AsCurrency;
   if frm.a_in['Filter']['bDate'].AsVariant then
   begin
     frm.fltForm.fltDatePeriodCheck.Checked := frm.a_in['Filter']['bDate'].AsVariant;
     frm.fltForm.fltDateBegEdit.Date    := frm.a_in['Filter']['DateBeg'].AsVariant;
     frm.fltForm.fltDateEndEdit.Date    := frm.a_in['Filter']['DateEnd'].AsVariant;
   end;

   frm.fltForm.ShowClosedCheck.Checked := frm.a_in['Filter']['ShowClosed'].AsVariant;
   frm.fltForm.fltShowClosed          := frm.a_in['Filter']['ShowClosed'].AsVariant;
   frm.fltForm.fltCustCheck.Checked   := frm.a_in['Filter']['bNameCust'].AsVariant;
   frm.fltForm.fltCustEdited          := frm.a_in['Filter']['bNameCust'].AsVariant;
   frm.fltForm.fltCustEdit.Text       := frm.a_in['Filter']['NameCust'].AsString;
   frm.fltForm.flt_id_Customer        := frm.a_in['Filter']['id_cust'].AsInteger;
   frm.fltForm.fltTipDogCheck.Checked := frm.a_in['Filter']['bTipdog'].AsVariant;
   frm.fltForm.fltTipDogEdit.Text     := frm.a_in['Filter']['NameTipDog'].AsString;
   frm.fltForm.fltId_tip_dog          := frm.a_in['Filter']['id_tip_dog'].AsInteger;
 end;
 if frm.FormStyle = fsNormal then
 begin
   frm.SelButton.Visible := ivAlways;
   if frm.a_in['Filter']['bShowFilter'].AsVariant then r := frm.fltform.ShowModal;
   if r = mrCancel then begin
     frm.free;
     exit;
   end;
   if frm.a_in['Shablon']['bUse'].AsVariant then
   begin
     frm.InputGroupBox.Visible := True;
     frm.InputSummaEdit.Text := FormatFloat('0.00', frm.a_in['Shablon']['summa'].AsCurrency);
     frm.InfoNoteMemo.Text := frm.a_in['Shablon']['note'].AsString;
   end;
   frm.ShowModal;
   frm.Free;
 end
 else
 begin
   frm.SelButton.Visible := ivNever;
   frm.a_out['Handle'].AsVariant := frm.Handle;
   frm.show;
   frm.Repaint;
   frm.SelectAll;
   if frm.a_in['shablon']['bUse'].AsVariant then
   begin
     frm.InputGroupBox.Visible := True;
     frm.InputSummaEdit.Text := FormatFloat('0.00', frm.a_in['shablon']['summa'].AsCurrency);
     frm.InfoNoteMemo.Text := frm.a_in['shablon']['note'].AsString;
   end;
 end;
end;

function GetSpr(input_params : TDogInput) : TDogResult;
var
 dogForm : TdogForm;
 r       : integer;
begin
 dogForm := TdogForm.Create(input_params.Owner);
 dogForm.input := input_params;
 dogForm.fltForm.id_Group := dogForm.input.id_Group;
// ShowMessage(FloatToStr(dogForm.input.Summa));
 if dogForm.input.FormCaption <> '' then dogForm.Caption := dogForm.input.FormCaption;
 if dogForm.input.isZayav then begin
  dogForm.Caption := 'Реєстр заявок до оплати';
  dogForm.fltForm.ShowClosedCheck.Visible := false;
  dogForm.fltForm.fltShowClosed := 0;
  dogForm.PayButton.Visible := ivAlways;
  dogForm.PayAllButton.Visible := ivAlways;
 end;

 dogForm.BuildColumns;
 dogForm.InitConnection(input_params.DBHandle, input_params.ReadTrans, input_params.WriteTrans);
 dogForm.FormStyle := input_params.FormStyle;

 if input_params.filter.bUseFilter then begin
//  dogForm.fltForm.inFlt := true;
  dogForm.fltForm.fltRegNumCheck.Checked := input_params.filter.bRegNum;
  dogForm.fltForm.fltRegNumEdit.Text     := input_params.filter.RegNum;
  dogForm.fltForm.fltSumCheck.Checked    := input_params.filter.bSumma;
  dogForm.fltForm.fltSumFromEdit.Value   := input_params.filter.SummaFrom;
  dogForm.fltForm.fltSumToEdit.Value     := input_params.filter.SummaTo;
  dogForm.fltForm.chSumPayFulfil1.Checked := input_params.filter.ShowClosed = 1;
  //dogForm.fltForm.chSumDogPay.Checked := input_params.filter.ShowClosed = 1;
  dogForm.fltForm.fltDatePeriodCheck.Checked := input_params.filter.bDate;
  dogForm.fltForm.fltDateBegEdit.Date    := input_params.filter.DateBeg;
  dogForm.fltForm.fltDateEndEdit.Date    := input_params.filter.DateEnd;

  //if (dogForm.fltForm.chSumPayFulfil1.Checked = true) then

  if input_params.filter.bDate then begin
   dogForm.fltForm.fltDatePeriodCheck.Checked := input_params.filter.bDate;
   dogForm.fltForm.fltDateBegEdit.Date    := input_params.filter.DateBeg;
   dogForm.fltForm.fltDateEndEdit.Date    := input_params.filter.DateEnd;
  end;
//  dogForm.fltForm.ShowClosedCheck.Checked := input_params.filter.ShowClosed = 1;
//  dogForm.fltForm.fltShowClosed          := input_params.filter.ShowClosed;
  dogForm.fltForm.fltCustCheck.Checked   := input_params.filter.bNameCust;
  dogForm.fltForm.fltCustEdited          := input_params.filter.bNameCust;
  dogForm.fltForm.fltCustEdit.Text       := input_params.filter.NameCust;
  dogForm.fltForm.flt_id_Customer        := input_params.filter.id_cust;
  dogForm.fltForm.fltTipDogCheck.Checked := input_params.filter.bTipdog;
  dogForm.fltForm.fltTipDogEdit.Text     := input_params.filter.NameTipDog;
  dogForm.fltForm.fltId_tip_dog          := input_params.filter.id_tip_dog;
//  dogForm.fltForm.inFlt := false;
 end;
 if dogForm.FormStyle = fsNormal then begin
  dogForm.SelButton.Visible := ivAlways;
(* dogForm.SelectAll;
  dogForm.cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;
  // Поиск договора по присланным параметрам
  if dogForm.input.lInfo.Summa = Unassigned then dogForm.input.lInfo.Summa := NULL;
  if dogForm.input.lInfo.name_customer = Unassigned then dogForm.input.lInfo.name_customer := NULL;
  if dogForm.input.lInfo.rate_acc = Unassigned then dogForm.input.lInfo.rate_acc := NULL;
  if not VarIsNull(dogForm.input.lInfo.name_customer) then dogForm.input.lInfo.name_customer := AnsiUpperCase(dogForm.input.lInfo.name_customer);
  if not (VarIsNull(dogForm.input.lInfo.summa) and VarIsNull(dogForm.input.lInfo.name_customer) and VarIsNull(dogForm.input.lInfo.rate_acc)) then begin
   dogForm.InputGroupBox.Visible := true;
   if not VarIsNull(dogForm.input.lInfo.Summa) then dogForm.InputSummaEdit.Text := dogForm.input.lInfo.Summa;
   if not VarIsNull(dogForm.input.lInfo.name_customer) then dogForm.InputCustomerEdit.Text := dogForm.input.lInfo.name_customer;
   if not VarIsNull(dogForm.input.lInfo.rate_acc) then dogForm.InputRateAccEdit.Text := dogForm.input.lInfo.rate_acc;
   dogForm.pFIBStoredProc1.StoredProcName := 'PROC_DOG_DT_DOCUMENT_FIND';
   dogForm.pFIBStoredProc1.Prepare;
   dogForm.pFIBStoredProc1.ParamByName('SUMMA').AsVariant := dogForm.input.lInfo.Summa;
   dogForm.pFIBStoredProc1.ParamByName('NAME_CUSTOMER').AsVariant := dogForm.input.lInfo.name_customer;
   dogForm.pFIBStoredProc1.ParamByName('RATE_ACCOUNT').AsVariant := dogForm.input.lInfo.rate_acc;
   dogForm.pFIBStoredProc1.ExecProc;
   if not VarIsNull(dogForm.pFIBStoredProc1['ID_DOG'].AsVariant) then dogForm.DataSet.Locate('ID_DOG', dogForm.pFIBStoredProc1['ID_DOG'].AsInt64, [loCaseInsensitive]);
   dogForm.pFIBStoredProc1.Close;
  end; *)
  if input_params.filter.bShowFilterForm then r := dogForm.fltform.ShowModal;
  if r = mrCancel then begin
   dogForm.free;
   exit;
  end;
  if dogForm.input.shablon_data.bUse then
  begin
    dogForm.InputGroupBox.Visible := True;
    dogForm.InputSummaEdit.Text := FormatFloat('0.00', dogForm.input.shablon_data.summa);
    dogForm.InfoNoteMemo.Text := dogForm.input.shablon_data.note;
  end;
  dogForm.ShowModal;
  Result := dogForm.res;
  dogForm.Free;
 end else begin
  dogForm.SelButton.Visible := ivNever;
  Result.handle := dogForm.Handle;
  dogForm.show;
  dogForm.Repaint;
  dogForm.SelectAll;
  if dogForm.input.shablon_data.bUse then
  begin
    dogForm.InputGroupBox.Visible := True;
    dogForm.InputSummaEdit.Text := FormatFloat('0.00', dogForm.input.shablon_data.summa);
    dogForm.InfoNoteMemo.Text := dogForm.input.shablon_data.note;
  end;
//  dogForm.cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;
  // Поиск договора по присланным параметрам
{  if dogForm.input.lInfo.Summa = Unassigned then dogForm.input.lInfo.Summa := NULL;
  if dogForm.input.lInfo.name_customer = Unassigned then dogForm.input.lInfo.name_customer := NULL;
  if dogForm.input.lInfo.rate_acc = Unassigned then dogForm.input.lInfo.rate_acc := NULL;
  if not VarIsNull(dogForm.input.lInfo.name_customer) then dogForm.input.lInfo.name_customer := AnsiUpperCase(dogForm.input.lInfo.name_customer);
  if not (VarIsNull(dogForm.input.lInfo.summa) and VarIsNull(dogForm.input.lInfo.name_customer) and VarIsNull(dogForm.input.lInfo.rate_acc)) then begin
   dogForm.InputGroupBox.Visible := true;
   if not VarIsNull(dogForm.input.lInfo.Summa) then dogForm.InputSummaEdit.Text := dogForm.input.lInfo.Summa;
   if not VarIsNull(dogForm.input.lInfo.name_customer) then dogForm.InputCustomerEdit.Text := dogForm.input.lInfo.name_customer;
   if not VarIsNull(dogForm.input.lInfo.rate_acc) then dogForm.InputRateAccEdit.Text := dogForm.input.lInfo.rate_acc;
   dogForm.pFIBStoredProc1.StoredProcName := 'PROC_DOG_DT_DOCUMENT_FIND';
   dogForm.pFIBStoredProc1.Prepare;
   dogForm.pFIBStoredProc1.ParamByName('SUMMA').AsVariant := dogForm.input.lInfo.Summa;
   dogForm.pFIBStoredProc1.ParamByName('NAME_CUSTOMER').AsVariant := dogForm.input.lInfo.name_customer;
   dogForm.pFIBStoredProc1.ParamByName('RATE_ACCOUNT').AsVariant := dogForm.input.lInfo.rate_acc;
   dogForm.pFIBStoredProc1.ExecProc;
   if not VarIsNull(dogForm.pFIBStoredProc1['ID_DOG'].AsVariant) then dogForm.DataSet.Locate('ID_DOG', dogForm.pFIBStoredProc1['ID_DOG'].AsInt64, []);
   dogForm.pFIBStoredProc1.Close;
  end;}
 end;
end;

procedure TdogForm.InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
begin
 WorkDatabase.Handle := DBhandle;
 ReadTransaction.Handle := RTransaction;
 WriteTransaction.Handle := WTransaction;
end;

procedure TdogForm.SelectAll(doOrderById : Boolean = False; filter_by_sum_today : Boolean = false);
var
 f : TForm;
 s, s2 : string;
 ch : Char;
 id_grp : int64;
begin
 ch := DecimalSeparator;
 DecimalSeparator := '.';
 f := WaitScreenShow(Self);
 DataSet.Close;
 DataSet.SelectSQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_SEL3(:ID_GROUP, :ID_USER, :FLT_ID_TIP_DOG, :WHRE_COND, :WHRE_COND_FOR_MAN, :ID_OTDEL, :USE_SHORT, :ID_MATERIAL, :ID_SESSION_TYPE,:P_ID_CLASS, :WHRE_COND_SUM) ORDER BY NAME_TIP_DOG,NAME_CUSTOMER';


 id_grp := input.id_Group;
 if a_in <> nil then id_grp := a_in['ID_GROUP'].AsInt64;
 fltform.ApplyToDataset(DataSet, id_grp, input.isZayav, filter_by_sum_today, cbUseShort.Checked, doOrderById);


(* if cbUseShort.Checked then DataSet.ParamByName('USE_SHORT').AsInteger := 1 else DataSet.ParamByName('USE_SHORT').AsInteger := 0;

 if doOrderById then DataSet.SelectSQL.Text := DataSet.SelectSQL.Text + ' order by id_dog';
 DataSet.ParamByName('ID_GROUP').AsInteger := input.id_Group;
 if a_in <> nil then DataSet.ParamByName('ID_GROUP').AsInteger := a_in['ID_GROUP'].AsInteger;
 DataSet.ParamByName('ID_USER').AsInteger := SYS_ID_USER;

 if fltForm.depCheck.Checked then DataSet.ParamByName('ID_OTDEL').AsInt64 := fltForm.flt_id_department
                             else DataSet.ParamByName('ID_OTDEL').AsInt64 := -1;

// if fltForm.otdelCheck.Checked then DataSet.ParamByName('ID_OTDEL').AsInt64 := fltForm.id_otdel
//                               else DataSet.ParamByName('ID_OTDEL').AsInt64 := -1;

 if fltForm.fltTipDogCheck.Checked then DataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger := fltForm.fltId_tip_dog
                                   else DataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger := -1;
 s := '';
 s2 := '';
{ if fltForm.fltDateCheck.Checked then begin
  s := s + '(doc.D_DOG >= ''' + DateToStr(fltForm.fltDateBeg) + ''') and (doc.D_DOG <= ''' + DateToStr(fltForm.fltDateEnd) + ''') and ';
  s2 := s2 + '(doc.D_DOG >= ''' + DateToStr(fltForm.fltDateBeg) + ''') and (doc.D_DOG <= ''' + DateToStr(fltForm.fltDateEnd) + ''') and ';
 end;}
 if fltForm.chId_dog.Checked then
 begin
   s := s + '(doc.id_dog = ' + fltForm.id_dogEdit.Text + ') and ';
   s2 := s2 + '(doc.id_dog = ' + fltForm.id_dogEdit.Text + ') and ';
 end;

 if fltForm.NomnCheck.Checked then
 begin
   s := s + '(doc.nomn_dog like ''%' + fltForm.nomnEdit.Text + '%'') and ';
   s2 := s2 + '(doc.nomn_dog like ''%' + fltForm.nomnEdit.Text + '%'') and ';
 end;
 if fltForm.DateNomnCheck.Checked then begin
  s := s + '(doc.nomd_dog >= ''' + DateToStr(fltForm.DateNomnBegEdit.Date) + ''') and (doc.nomd_dog <= ''' + DateToStr(fltForm.DateNomnEndEdit.Date) + ''') and ';
  s2 := s2 + '(doc.nomd_dog >= ''' + DateToStr(fltForm.DateNomnBegEdit.Date) + ''') and (doc.nomd_dog <= ''' + DateToStr(fltForm.DateNomnEndEdit.Date) + ''') and ';
 end;
 if fltForm.DateActCheck.Checked then begin
  s := s + '(doc.date_end >= ''' + DateToStr(fltForm.DateActBegEdit.Date) + ''') and (doc.date_beg <= ''' + DateToStr(fltForm.DateActEndEdit.Date) + ''') and ';
  s2 := s2 + '(doc.date_end >= ''' + DateToStr(fltForm.DateActBegEdit.Date) + ''') and (doc.date_beg <= ''' + DateToStr(fltForm.DateActEndEdit.Date) + ''') and ';
 end;

 { if fltForm.depCheck.Checked then
 begin
   s := s + '(doc.id_department = ' + IntToStr(fltForm.flt_id_department) + ') and ';
   s2 := s2 + '(doc.id_department = ' + IntToStr(fltForm.flt_id_department) + ') and ';
 end;}
 if fltForm.chNumDog.Checked then
 begin
   s := s + '(doc.n_dog like ''%' + fltForm.NumDogEdit.Text + '%'') and ';
   s2 := s2 + '(doc.n_dog like ''%' + fltForm.NumDogEdit.Text + '%'') and ';
 end;
 if fltForm.chSumPayFulfil1.Checked then
 begin
   s := s + '(doc.sum_pay <> doc.sum_fulfil) and ';
   s2 := s2 + '(doc.sum_pay <> doc.sum_fulfil) and ';
 end;
 if fltForm.chSumPayFulfil2.Checked then
 begin
   s := s + '(doc.sum_pay = doc.sum_fulfil) and ';
   s2 := s2 + '(doc.sum_pay = doc.sum_fulfil) and ';
 end;
 if fltForm.fltDatePeriodCheck.Checked then begin
  s := s + '(doc.D_DOG >= ''' + DateToStr(fltForm.fltDateBegEdit.Date) + ''') and (doc.D_DOG <= ''' + DateToStr(fltForm.fltDateEndEdit.Date) + ''') and ';
  s2 := s2 + '(doc.D_DOG >= ''' + DateToStr(fltForm.fltDateBegEdit.Date) + ''') and (doc.D_DOG <= ''' + DateToStr(fltForm.fltDateEndEdit.Date) + ''') and ';
 end;
 if fltForm.fltSumCheck.Checked then begin
  s := s + '(doc.SUMMA >= ' +  FormatFloat('0.00', fltForm.fltSumFromEdit.Value) + ') and (doc.SUMMA <= ' + FormatFloat('0.00', fltForm.fltSumToEdit.Value) + ') and ';
  s2 := s2 + '(doc.SUMMA >= ' + FormatFloat('0.00', fltForm.fltSumFromEdit.Value) + ') and (doc.SUMMA <= ' + FormatFloat('0.00', fltForm.fltSumToEdit.Value) + ') and ';
 end;
 if fltForm.fltRegNumCheck.Checked then begin
   pFIBQuery1.Close;
   pFIBQuery1.SQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_FIND_BYNUM(''' + fltform.fltRegNumEdit.Text + ''', ' + IntToStr(input.id_Group) + ')';
   pFIBQuery1.ExecQuery;
   if pFIBQuery1['TOP_LEVEL'].AsInteger = 1 then
   begin
     s := s + '(doc.REGEST_NUM like ' + QuotedStr('%'+fltform.fltRegNumEdit.Text+'%') + ') and ';
     s2 := s2 + '(doc.REGEST_NUM like ' + QuotedStr('%'+fltform.fltRegNumEdit.Text+'%') + ') and ';
   end
   else
   begin
     s := s + '(doc.ID_DOG = ' + IntToStr(pFIBQuery1['ID_DOG'].ASInt64) + ') and ';
     s2 := s2 + '(doc.ID_DOG = ' + IntToStr(pFIBQuery1['ID_DOG'].ASInt64) + ') and ';
   end;
   pFIBQuery1.Close;
 end;
 s := s + '(doc.DOG_CLOSE <= ' + IntToStr(fltform.fltShowClosed) + ') and ';
 s2 := s2 + '(doc.DOG_CLOSE <= ' + IntToStr(fltform.fltShowClosed) + ') and ';
 if fltForm.fltCustCheck.Checked then begin
  if fltForm.fltCustEdited then begin
   s := s + '(cust.NAME_CUSTOMER_UPPER like ' + QuotedStr(AnsiUpperCase('%' + fltform.fltCustEdit.Text + '%')) + ') and ';
   s2 := s2 + '(Upper(p.FAMILIA || '' '' || p.IMYA || '' '' || p.OTCHESTVO || ''('' || CAST(pc.TN as varchar(20)) || '')'') like ' + QuotedStr(AnsiUpperCase('%' + fltform.fltCustEdit.Text + '%')) + ') and ';
  end else s := s + '(cust.ID_CUSTOMER = ' + IntToStr(fltForm.flt_id_Customer) + ') and ';
 end;
 if input.isZayav then begin
  s := s + 'doc.summa > doc.sum_pay and ';
  s2 := s2 + 'doc.summa > doc.sum_pay and ';
 end;
 if filter_by_sum_today then
 begin
  s := s + 'doc.sum_today > 0 and ';
  s2 := s2 + 'doc.sum_today > 0 and ';
 end;
 if s <> '' then s := Copy(s, 1, Length(s) - 4);
 if s2 <> '' then s2 := Copy(s2, 1, Length(s2) - 4);
// ShowMessage(s);
 DataSet.ParamByName('WHERE_COND').AsString := s;
 DataSet.ParamByName('WHERE_COND_FOR_MAN').AsString := s2;
*)

 DataSet.Close;
 DataSet.Open;
 DecimalSeparator := ch;
 case cbSort.ItemIndex of
   1: DataSet.DoSort(['NAME_TIP_DOG'], [True]);
   2: DataSet.DoSort(['NAME_CUSTOMER'], [True]);
   3: DataSet.DoSort(['SUMMA'], [True]);
   4: DataSet.DoSort(['SUM_PAY'], [True]);
   5: DataSet.DoSort(['SUM_FULFIL'], [True]);
 end;
 WaitScreenClose(f);
end;

procedure TdogForm.ExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TdogForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 SavePositionToRegistry(Self);
 Action := caFree;
end;

procedure TdogForm.RefreshButtonClick(Sender: TObject);
var
 selected : int64;
begin
 selected := -1;

 if DataSet.RecordCount <> 0 then selected := TFIBBCDField(DataSet.fbn('ID_DOG')).AsInt64;
 SelectAll;
 DataSet.Locate('ID_DOG', selected, []);
end;

procedure TdogForm.FormShow(Sender: TObject);
begin
 LoadPositionFromRegistry(Self);
 cxGrid1DBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
 if AllowMultiSelect then cxGrid1DBTableView1.Columns[0].Visible := true;
 if FormStyle = fsNormal then begin
   SelectAll;
  if input.lInfo.summa <> 0 then
  begin
    DataSet.Locate('SUMMA', input.lInfo.summa, [loCaseInsensitive]);
    input.lInfo.summa := 0;
  end else cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;
 end;
 cxGrid1.SetFocus;
end;

procedure TdogForm.FormCreate(Sender: TObject);
var
 reg : TRegistry;
begin
 LangPackApply(Self);
 cxGrid1.ShowHint := true;
 cbSort.ItemIndex := 2;
 reg := TRegistry.Create;
 if reg.OpenKey(REG_KEY + 'dogForm\Buttons', false) then if not reg.ReadBool('ShowCaptions') then ShowHidButtonCaptions;
 reg.CloseKey;
 if reg.OpenKey(REG_KEY + 'dogForm\ShowInfo', false) then if not reg.ReadBool('Show') then HideInfoPanelButtonClick(Self);
 reg.Free;

 HideInfoPanelButton.Glyph.Width := 16;
 HideInfoPanelButton.Glyph.Height := 16;
 ImageList1.Draw(HideInfoPanelButton.Glyph.Canvas, 0, 0, 2);

 fltForm := TfltDogForm.Create(Self);
 fltForm.pFIBDatabase1 := WorkDatabase;
 fltForm.flt_id_department := dogLoaderUnit.SYS_DEF_ID_DEPARTMENT;
 fltForm.depEdit.Text := dogLoaderUnit.SYS_DEF_NAME_DEPARTMENT;
 fltForm.depCheck.Checked := true;
  
 ShowUserButton.Visible := isAdmin;
 if not SYS_IS_DNEPR then PrintSpecButton.Visible := ivNever;
{ AddButton.Caption       := rsb_Add;
 EditButton.Caption      := rsb_Edit;
 DeleteButton.Caption    := rsb_Del;
 ViewButton.Caption      := rsb_View;
 CloseOpenButton.Caption := rsb_CloseOpen;
 FilterButton.Caption    := rsb_Filter;
 RefreshButton.Caption   := rsb_Refresh;
 SelButton.Caption       := rsb_Select;
 ExitButton.Caption      := rsb_Close;
 PayFulfilButton.Caption := rsb_PayFulfil;
 PayButton.Caption       := rsb_Pay;
 //labels
 cxLabel4.Caption := rsl_MFO;
 cxLabel7.Caption := rsl_MFO;
 cxLabel5.Caption := rsl_Bank;
 cxLabel8.Caption := rsl_Bank;
 cxLabel6.Caption := rsl_RateAcc;
 cxLabel9.Caption := rsl_RateAcc;
// cxLabel11.Caption := rsl_RegNum;
 cxLabel2.Caption := rsl_Date;
 cxLabel3.Caption := rsl_Number;
// cxLabel1.Caption := rsl_Note;}
 cxLabel29.Caption := cxLabel29.Caption + ' ' + SYS_NAME_CUSTOMER_NATIVE + ' ';
 cxGroupBox1.Caption := ' ' + cxGroupBox1.Caption + ' ' + SYS_NAME_CUSTOMER_NATIVE + ' ';

 if input.isZayav then
 begin
   if fibCheckPermission('/ROOT/DOG/SPRAV/ZAYAV','Add') <> 0 then AddButton.Visible := ivNever;
   if fibCheckPermission('/ROOT/DOG/SPRAV/ZAYAV','Del') <> 0 then DeleteButton.Visible := ivNever;
   if fibCheckPermission('/ROOT/DOG/SPRAV/ZAYAV','Edit') <> 0 then EditButton.Visible := ivNever;
   if fibCheckPermission('/ROOT/DOG/SPRAV/ZAYAV','View') <> 0 then ViewButton.Visible := ivNever;
   if fibCheckPermission('/ROOT/DOG/SPRAV/ZAYAV','Print') <> 0 then PrintButton.Visible := ivNever;
 end
 else
 begin
   if fibCheckPermission('/ROOT/DOG/SPRAV/DOGOVOR','Add') <> 0 then AddButton.Visible := ivNever;
   if fibCheckPermission('/ROOT/DOG/SPRAV/DOGOVOR','Del') <> 0 then DeleteButton.Visible := ivNever;
   if fibCheckPermission('/ROOT/DOG/SPRAV/DOGOVOR','Edit') <> 0 then EditButton.Visible := ivNever;
   if fibCheckPermission('/ROOT/DOG/SPRAV/DOGOVOR','View') <> 0 then ViewButton.Visible := ivNever;
   if fibCheckPermission('/ROOT/DOG/SPRAV/DOGOVOR','Print') <> 0 then PrintButton.Visible := ivNever;
 end;

{ if input.isZayav then
 begin
   if fibCheckPermission('/ROOT/DOG/SPRAV/ZAYAV','Add') <> 0 then add.Enabled := true;
   if fibCheckPermission('/ROOT/DOG/SPRAV/ZAYAV','Del') <> 0 then DeleteButton.Enabled := true;
   if fibCheckPermission('/ROOT/DOG/SPRAV/ZAYAV','Edit') <> 0 then edit.Enabled := true;
   if fibCheckPermission('/ROOT/DOG/SPRAV/ZAYAV','View') <> 0 then view.Enabled := true;
   if fibCheckPermission('/ROOT/DOG/SPRAV/ZAYAV','Print') <> 0 then Print.Enabled := true;
 end
 else
 begin
   if fibCheckPermission('/ROOT/DOG/SPRAV/DOGOVOR','Add') <> 0 then add.Enabled := true else add.Enabled := false;
   if fibCheckPermission('/ROOT/DOG/SPRAV/DOGOVOR','Del') <> 0 then DeleteButton.Enabled := false;
   if fibCheckPermission('/ROOT/DOG/SPRAV/DOGOVOR','Edit') <> 0 then edit.Enabled := true else edit.Enabled := false;
   if fibCheckPermission('/ROOT/DOG/SPRAV/DOGOVOR','View') <> 0 then view.Enabled := true else view.Enabled := false;
   if fibCheckPermission('/ROOT/DOG/SPRAV/DOGOVOR','Print') <> 0 then Print.Enabled := true else Print.Enabled := false;
 end;
 }
// ShowMessage(IntToStr(SYS_SERVER));
// if SYS_SERVER = 99 then dxBarLargeButton4.Visible := ivNever;

 KeyField := 'ID_DOCUMENT';
 cxGrid1DBTableView1.Items[cxGrid1DBTableView1IS_ZAYAV.Index].DataBinding.ValueTypeClass := TcxIntegerValueType;
 if input.isZayav then agColumnCustomizer1.RegParam := 'ZayavRee' else agColumnCustomizer1.RegParam := 'DogRee';
 agColumnCustomizer1.LoadFromRegistry;
// if Length(input.columns) <> 0 then begin
end;

procedure TdogForm.DataSetAfterOpen(DataSet: TDataSet);
begin
{ if DataSet.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
 end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
end;}
end;

procedure TdogForm.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
 if ACellViewInfo.Item.Index <> cxGrid1DBTableView1Information.Index then exit;
// Panel4.left := Width div 2 - Panel4.width div 2;
 Panel4.left := ScreenToClient(Mouse.CursorPos).x;
 Panel4.top := ScreenToClient(Mouse.CursorPos).y;
 if Panel4.Top + panel4.Height > Height - 64 then Panel4.Top := Panel4.Top - Panel4.Height div 2;
// try
 Panel4.Show;
// except
// end;
 //cxGrid1DBTableView1Information
(* AHandled := false;
// if not AllowMultiSelect then exit;
 if ACellViewInfo.Item.Index <> cxGrid1DBTableView1IS_ZAYAV.Index then exit;
 if Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, cxGrid1DBTableView1IS_ZAYAV.Index] = 1 then
 begin
  Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, cxGrid1DBTableView1IS_ZAYAV.Index] := 0;
  ShowMessage('off');
 end
 else
 begin
  Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, cxGrid1DBTableView1IS_ZAYAV.Index] := 1;
  ShowMessage('on');
 end;
 AHandled := true;*)
end;

procedure TdogForm.AddButtonClick(Sender: TObject);
begin
 LoadDogManedger.WorkTypeDogSPR(Self, WorkDatabase.Handle, fsNormal, 'get', ResProc, input.id_Group_add, @input.shablon_data);
end;

procedure TdogForm.EditButtonClick(Sender: TObject);
var
  upd_arnd : string;
  arnd_chck: integer;
begin

 if DataSet.RecordCount = 0 then exit;
 if DataSet['ID_DEPARTMENT'] <> SYS_DEF_ID_DEPARTMENT then
 begin
   ShowMessage('Не можна редагувати договір іншого підрозділу.');
   exit;
 end;
 if DataSet['DOG_CLOSE'] = 1 then
 begin
   ShowMessage('Спочатку необхідно відкрити договор.');
   exit;
 end;

// pFIBQuery1.Close;
// pFIBQuery1.SQL.Clear;
// pFIBQuery1.SQL.Add('SELECT NATURAL_ARND FROM DOG_SYS_OPTIONS;');
// pFIBQuery1.ExecQuery;
// arnd_chck:= pFIBQuery1.FldByName['NATURAL_ARND'].AsInteger;

// if ((DataSet.FieldByName('name_shablon').asString = 'add_arnd_contract.bpl') and (arnd_chck = 1)) then
//    upd_arnd :='add_arnd_favour.bpl'
// else
// upd_arnd := DataSet.FieldByName('name_shablon').asString;

// LoadDogManedger.LoadShablon(self, WorkDatabase.Handle, fsMDIChild, DataSet.FieldByName('ID_DOG').AsVariant, 'red', DataSet.FieldByName('id_tip_dog').AsVariant, PChar(upd_arnd), ResProc);
  LoadDogManedger.LoadShablon(self, WorkDatabase.Handle, fsMDIChild, DataSet.FieldByName('ID_DOG').AsVariant, 'red', DataSet.FieldByName('id_tip_dog').AsVariant, PChar(DataSet.FieldByName('name_shablon').asString), ResProc);
 //   exit;
 end;

procedure TdogForm.ViewButtonClick(Sender: TObject);
var
  upd_arnd : string;
  arnd_chck: integer;
begin
 if DataSet.RecordCount = 0 then exit;
 // Проверка по признаку ведения аренды в разрезе учёта натуральных показателей
 // Одновременно может использоватся только один из шаблонов
// pFIBQuery1.Close;
// pFIBQuery1.SQL.Clear;
// pFIBQuery1.SQL.Add('SELECT NATURAL_ARND FROM DOG_SYS_OPTIONS;');
// pFIBQuery1.ExecQuery;
// arnd_chck:= pFIBQuery1.FldByName['NATURAL_ARND'].AsInteger;
//
// if ((DataSet.FieldByName('name_shablon').asString = 'add_arnd_contract.bpl') and (arnd_chck = 1)) then
//    upd_arnd :='add_arnd_favour.bpl'
// else
// upd_arnd := DataSet.FieldByName('name_shablon').asString;

 LoadDogManedger.LoadShablon(self, WorkDatabase.Handle, fsMDIChild, DataSet.FieldByName('ID_DOG').AsVariant, 'prosmotr', DataSet.FieldByName('id_tip_dog').AsVariant, PChar(DataSet.FieldByName('name_shablon').asString), ResProc);
// LoadDogManedger.LoadShablon(self, WorkDatabase.Handle, fsMDIChild, DataSet.FieldByName('ID_DOG').AsVariant, 'prosmotr', DataSet.FieldByName('id_tip_dog').AsVariant, PChar(upd_arnd), ResProc);
end;

procedure TdogForm.DeleteButtonClick(Sender: TObject);
var
 selected : Int64;
begin

 if DataSet.RecordCount = 0 then exit;

 if DataSet['ID_DEPARTMENT'] <> SYS_DEF_ID_DEPARTMENT then
 begin
   ShowMessage('Не можна видалити договір іншого підрозділу.');
   exit;
 end;


 selected := cxGrid1DBTableView1.DataController.FocusedRowIndex;
 if MessageDlg('Увага', 'Ви дійсно бажаєте видалити запис?', mtConfirmation, [mbYes, mbNo]) <> mrYes then exit;
 WriteProc.Transaction.StartTransaction;
 WriteProc.StoredProcName := 'DOG_DT_DOCUMENT_DELETE';
 WriteProc.Prepare;
 WriteProc.ParamByName('D_ID_DOG').AsInt64 := DataSet.FieldByName('ID_DOG').AsVariant;
 WriteProc.ExecProc;
 WriteProc.Transaction.Commit;
 WriteProc.Close;
 SelectAll;
 cxGrid1DBTableView1.DataController.FocusedRowIndex := selected;
end;

procedure TdogForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
if SelButton.Visible = ivAlways then
   SelButtonClick(Self)
else
if EditButton.Visible = ivAlways then
   EditButtonClick(Self)
else

   ViewButtonClick(Self);

end;

procedure TdogForm.SelButtonClick(Sender: TObject);
var
 ts : Currency;
 RecordsOfRes : integer;
 rr : Variant;
 i : integer;
 id_session : int64;
 sa, new_sa : TSmetArray;

 // BRom
//  Current: IjbSendData;
  SmetID, RazdID, StatID: integer;
  StudDogID: integer;
//  LoadData: TjbLoadData;


  procedure FillDefValues;
  begin
    res.id_dog           := DataSet['ID_DOG'];
    res.kod_dog          := DataSet['KOD_DOG'];
    res.id_tip_dog       := DataSet['ID_TIP_DOG'];
    res.name_tip_dog     := DataSet['NAME_TIP_DOG'];
    res.n_dog            := DataSet['N_DOG'];
    res.d_dog            := DataSet['D_DOG'];
    res.nomn_dog         := DataSet['NOMN_DOG'];
    res.nomd_dog         := DataSet['NOMD_DOG'];
    res.id_customer      := DataSet['ID_CUSTOMER'];
    res.name_customer    := DataSet['NAME_CUSTOMER'];
    res.id_rate_acc      := DataSet['ID_RATE_ACCOUNT'];
    res.rate_acc         := DataSet['RATE_ACC'];
    res.mfo              := DataSet['MFO'];
    res.bank             := '';//DataSet[''];
    res.id_rate_acc_nat  := DataSet['ID_RATE_ACC_NATIVE'];
    res.date_beg         := DataSet['DATE_BEG'];
    res.date_end         := DataSet['DATE_END'];
    res.summa            := DataSet['SUMMA'];
    res.continue         := DataSet['DOG_CONTINUE'];
    res.not_summa        := DataSet['NOT_SUMMA'];
    res.close            := DataSet['DOG_CLOSE'];
    res.dog_note         := DataSet['DOG_NOTE'];
    res.fio_donnu        := DataSet['FIO_DONGU'];
    res.fio_postav       := DataSet['FIO_POSTAV'];
    res.krit_date        := DataSet['KRIT_DAT'];
    res.nds_sum          := DataSet['NDS_SUM'];
    res.nds_pay          := DataSet['NDS_PAY'];
    res.sum_fulfil       := DataSet['SUM_FULFIL'];
    res.sum_pay          := DataSet['SUM_PAY'];
    res.sum_today        := DataSet['ID_MAN'];
    res.regest_num       := DataSet['REGEST_NUM'];
    res.comment          := DataSet['COMMENT'];
    res.name_shablon     := DataSet['NAME_SHABLON'];
    if not VarIsNull(DataSet['ID_BL_ACCOUNT']) then res.id_bl_account := DataSet['ID_BL_ACCOUNT'] else res.id_bl_account    :=  -1;
  end;

  procedure alg1;
  begin
    pFIBQuery1.Close;
    pFIBQuery1.SQL.Text := 'SELECT * from PROC_DOG_DT_SMET_DOG_SEL(' + IntToStr(TFIBBCDField(DataSet.fbn('ID_DOG')).AsInt64) + ')';
    pFIBQuery1.ExecQuery;
  if pFIBQuery1.RecordCount <> 0 then begin
   while not pFIBQuery1.Eof do begin
    SetLength(res.Smets, Length(res.Smets) + 1);
    res.Smets[Length(res.Smets) - 1].NumSmeta := pFIBQuery1['ID_SMETA'].AsInteger;
    res.Smets[Length(res.Smets) - 1].NumRazd  := pFIBQuery1['ID_RAZD'].AsInteger;
    res.Smets[Length(res.Smets) - 1].NumStat  := pFIBQuery1['ID_STAT'].AsInteger;
    res.Smets[Length(res.Smets) - 1].NumKekv  := pFIBQuery1['ID_KEKV'].AsInteger;
    res.Smets[Length(res.Smets) - 1].id_people:= pFIBQuery1['ID_PEOPLE'].AsInteger;
    res.Smets[Length(res.Smets) - 1].Summa    := pFIBQuery1['SUMMA'].AsCurrency;
    pFIBQuery1.Next;
   end;
   CalcSmetsSumma(ts);
  end else begin
    SetLength(res.Smets, Length(res.Smets) + 1);
    res.Smets[Length(res.Smets) - 1].NumSmeta := -1;
    res.Smets[Length(res.Smets) - 1].NumRazd  := -1;
    res.Smets[Length(res.Smets) - 1].NumStat  := -1;
    res.Smets[Length(res.Smets) - 1].NumKekv  := -1;
    res.Smets[Length(res.Smets) - 1].id_people:= -1;
    res.Smets[Length(res.Smets) - 1].Summa    := input.Summa;
    res.Smets[Length(res.Smets) - 1].NSumma   := input.Summa;
  end;
  pFIBQuery1.Close;


  FillDefValues;
(*  res.id_dog           := DataSet['ID_DOG'];
  res.kod_dog          := DataSet['KOD_DOG'];
  res.id_tip_dog       := DataSet['ID_TIP_DOG'];
  res.name_tip_dog     := DataSet['NAME_TIP_DOG'];
  res.n_dog            := DataSet['N_DOG'];
  res.d_dog            := DataSet['D_DOG'];
  res.nomn_dog         := DataSet['NOMN_DOG'];
  res.nomd_dog         := DataSet['NOMD_DOG'];
  res.id_customer      := DataSet['ID_CUSTOMER'];
  res.name_customer    := DataSet['NAME_CUSTOMER'];
  res.id_rate_acc      := DataSet['ID_RATE_ACCOUNT'];
  res.rate_acc         := DataSet['RATE_ACC'];
  res.mfo              := '';//DataSet[''];
  res.bank             := '';//DataSet[''];
  res.id_rate_acc_nat  := DataSet['ID_RATE_ACC_NATIVE'];
  res.date_beg         := DataSet['DATE_BEG'];
  res.date_end         := DataSet['DATE_END'];
  res.summa            := DataSet['SUMMA'];
  res.continue         := DataSet['DOG_CONTINUE'];
  res.not_summa        := DataSet['NOT_SUMMA'];
  res.close            := DataSet['DOG_CLOSE'];
  res.dog_note         := DataSet['DOG_NOTE'];
  res.fio_donnu        := DataSet['FIO_DONGU'];
  res.fio_postav       := DataSet['FIO_POSTAV'];
  res.krit_date        := DataSet['KRIT_DAT'];
  res.nds_sum          := DataSet['NDS_SUM'];
  res.nds_pay          := DataSet['NDS_PAY'];
  res.sum_fulfil       := DataSet['SUM_FULFIL'];
  res.sum_pay          := DataSet['SUM_PAY'];
  res.sum_today        := DataSet['SUM_TODAY'];
  res.regest_num       := DataSet['REGEST_NUM'];
  res.comment          := DataSet['COMMENT'];
  res.name_shablon     := DataSet['NAME_SHABLON'];
  if not VarIsNull(DataSet['ID_BL_ACCOUNT']) then res.id_bl_account := DataSet['ID_BL_ACCOUNT'] else res.id_bl_account    :=  -1;*)
  res.handle           := 0;
  res.ModalResult := mrOk;
  ModalResult := mrOk;
  end;

var
 param : TcnSimpleParamsEx;
 ResOpl:Variant;
begin

 if DataSet.RecordCount = 0 then exit;

 pFIBQuery1.Close;
 pFIBQuery1.SQL.Text := 'SELECT result from PUB_SP_TIP_DOG_BELONG_GROUP(' + VarToStr(DataSet['ID_TIP_DOG']) + ', 7)';

 pFIBQuery1.ExecQuery;

 // FixMe
 if pFIBQuery1['RESULT'].AsInteger = 1 then begin
 pFIBQuery1.Close;
   //Договора за обучение;
   param:= TcnSimpleParamsEx.Create;
   param.Owner:=self;
   param.Db_Handle:= WorkDatabase.Handle;
   param.Formstyle:=fsNormal;
   param.WaitPakageOwner:=self;
   param.cnParamsToPakage.Summa := input.Summa;
   param.cnParamsToPakage.IsWithSumma:=true;
   ResOpl:= RunFunctionFromPackage(param, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');
   if VarArrayDimCount(ResOpl)>0 then
   begin
    res.id_dog           := ResOpl[0][2];
    res.kod_dog          := ResOpl[0][12];

      res.id_tip_dog       := DataSet['ID_TIP_DOG'];
      res.name_tip_dog     := DataSet['NAME_TIP_DOG'];
      res.n_dog            := DataSet['N_DOG'];
      res.d_dog            := DataSet['D_DOG'];
      res.nomn_dog         := DataSet['NOMN_DOG'];
      res.nomd_dog         := DataSet['NOMD_DOG'];
      res.id_customer      := DataSet['ID_CUSTOMER'];
      res.name_customer    := DataSet['NAME_CUSTOMER'];
      res.id_rate_acc      := DataSet['ID_RATE_ACCOUNT'];
      res.rate_acc         := DataSet['RATE_ACC'];
      res.mfo              := '';//DataSet[''];
      res.bank             := '';//DataSet[''];
      res.id_rate_acc_nat  := DataSet['ID_RATE_ACC_NATIVE'];
      res.date_beg         := DataSet['DATE_BEG'];
      res.date_end         := DataSet['DATE_END'];
      res.summa            := DataSet['SUMMA'];
      res.continue         := DataSet['DOG_CONTINUE'];
      res.not_summa        := DataSet['NOT_SUMMA'];
      res.close            := DataSet['DOG_CLOSE'];
      res.dog_note         := DataSet['DOG_NOTE'];
      res.fio_donnu        := DataSet['FIO_DONGU'];
      res.fio_postav       := DataSet['FIO_POSTAV'];
      res.krit_date        := DataSet['KRIT_DAT'];
      res.nds_sum          := DataSet['NDS_SUM'];
      res.nds_pay          := DataSet['NDS_PAY'];
      res.sum_fulfil       := DataSet['SUM_FULFIL'];
      res.sum_pay          := DataSet['SUM_PAY'];
      res.sum_today        := DataSet['ID_MAN'];
      res.regest_num       := DataSet['REGEST_NUM'];
      res.comment          := DataSet['COMMENT'];
      res.name_shablon     := DataSet['NAME_SHABLON'];
      if not VarIsNull(DataSet['ID_BL_ACCOUNT']) then res.id_bl_account := DataSet['ID_BL_ACCOUNT'] else res.id_bl_account    :=  -1;

       res.handle           := 0;
       res.ModalResult := mrOk;
      end;
      //! ----------------
    for i := 1 to ResOpl[0][11]+1 - 1 do
    begin
      SetLength(res.Smets, Length(res.Smets) + 1);
      res.Smets[Length(res.Smets) - 1].NumSmeta := ResOpl[i][0];
      res.Smets[Length(res.Smets) - 1].NumRazd  := ResOpl[i][1];
      res.Smets[Length(res.Smets) - 1].NumStat  := ResOpl[i][2];
      res.Smets[Length(res.Smets) - 1].NumKekv  := ResOpl[i][3];
      res.Smets[Length(res.Smets) - 1].Summa    := ResOpl[i][4];
    end;

    res.ModalResult := mrOk;
    ModalResult := mrOk;
    exit;
   end;

  //! ----------------BRom
  (* LoadJiBiApplication(WorkDatabase.Handle);

  // 10 - GUI interface
  // 11 - auto calculate interface
  LoadData := TjbLoadData.Create(Self, 11);
  LoadData.Params.Values['SUMMA'] := input.Summa;
  if (JiBiKernel.Load('DFSRegisrty.bpl',  LoadData) <> nil)
  then begin
//       JiBiKernel.LoadFullResult.ShowDump;
// example

//  	StudDogID := JiBiKernel.LoadFullResult.Dims['DOG_INFO'].Values['ID_STUD_DOG'];
//=======

    i := 0;
    while JiBiKernel.LoadFullResult.Has(i) do
    begin
      Current := JiBiKernel.LoadFullResult.Dims[i];
      SetLength(res.Smets, Length(res.Smets) + 1);
      res.Smets[Length(res.Smets) - 1].NumSmeta := Current.Values['ID_SMET'];
      res.Smets[Length(res.Smets) - 1].NumRazd  := Current.Values['ID_RAZD'];
      res.Smets[Length(res.Smets) - 1].NumStat  := Current.Values['ID_STAT'];
      res.Smets[Length(res.Smets) - 1].NumKekv  := Current.Values['ID_KEKV'];
      res.Smets[Length(res.Smets) - 1].Summa    := Current.Values['SUMMA'];
      inc(i);
    end;*)

//    ShowMessage(IntToStr(JiBiKernel.LoadFullResult.Dims['DOG_INFO'].Values['KOD_DOG']));
//  res.kod_dog          := DataSet['KOD_DOG'];

 //Студгородок
 pFIBQuery1.Close;
 pFIBQuery1.SQL.Text := 'SELECT result from PUB_SP_TIP_DOG_BELONG_GROUP(' + VarToStr(DataSet['ID_TIP_DOG']) + ', 6)';
 pFIBQuery1.ExecQuery;

 if pFIBQuery1['RESULT'].AsInteger = 1 then begin

   FillDefValues;
//   ResOpl:= Load_st_BuildLivers(self, WorkDatabase.Handle, true, input.shablon_data.note, input.Summa, true);
   ResOpl:= Load_st_BuildLivers(self, WorkDatabase.Handle, true, '', input.shablon_data.note, input.Summa, true);
   if VarArrayDimCount(ResOpl)>0 then
   begin
     res.Smets := nil;
     RecordsOfRes:= ResOpl[0][9]+1;
     //     RecordsOfRes:= ResOpl[0][1]+1;
     for i:=1 to RecordsOfRes-1 do
     begin;
       SetLength(res.Smets, Length(res.Smets) + 1);
       res.Smets[Length(res.Smets) - 1].NumSmeta := ResOpl[i][0];
       res.Smets[Length(res.Smets) - 1].NumRazd  := ResOpl[i][1];
       res.Smets[Length(res.Smets) - 1].NumStat  := ResOpl[i][2];
       res.Smets[Length(res.Smets) - 1].NumKekv  := ResOpl[i][3];
       res.Smets[Length(res.Smets) - 1].Summa    := ResOpl[i][4];
     end;
     res.id_dog := ResOpl[0][0];
   end;
(*  pFIBQuery1.Close;
  Rr := Load_st_BuildLivers(Self,WorkDatabase.Handle, true, input.shablon_data.note ,input.Summa, true);
//  Rr := Load_st_BuildLivers(self, WorkDatabase.Handle, True, input.Summa, true);
  if VarArrayDimCount(Rr)>0 then begin
   res.Smets := nil;
   RecordsOfRes:= rr[0][1]+1;
   if RecordsOfRes <> 0 then for i:=1 to RecordsOfRes - 1 do begin
    SetLength(res.Smets, Length(res.Smets) + 1);
    res.Smets[Length(res.Smets) - 1].NumSmeta := StrToInt(VarToStr(rr[i][0]));
    res.Smets[Length(res.Smets) - 1].NumRazd  := StrToInt(VarToStr(rr[i][1]));
    res.Smets[Length(res.Smets) - 1].NumStat  := StrToInt(VarToStr(rr[i][2]));
    res.Smets[Length(res.Smets) - 1].NumKekv  := StrToInt(VarToStr(rr[i][3]));
    res.Smets[Length(res.Smets) - 1].Summa    := StrToFloat(VarToStr(rr[i][4]));
   end;
  end;
  res.id_dog := rr[0][0];*)
  CalcSmetsSumma(0);
  res.ModalResult := mrOk;
  ModalResult := mrOk;
  exit;
 end;


 //Аренда (алгоритм №3);
 pFIBQuery1.Close;
 pFIBQuery1.SQL.Text := 'SELECT result from PUB_SP_TIP_DOG_BELONG_GROUP(' + VarToStr(DataSet['ID_TIP_DOG']) + ', 11)';

 pFIBQuery1.ExecQuery;

 if pFIBQuery1['RESULT'].AsInteger = 1 then begin

  pFIBQuery1.Transaction := WriteTransaction;
  pFIBQuery1.Transaction.StartTransaction;
  pFIBQuery1.Close;
  pFIBQuery1.SQL.Text := 'select id_session from PROC_DOG_DT_DOC_GET_PAY_FULFIL(' + IntToStr(TFIBBCDField(DataSet.fbn('ID_DOG')).AsInt64) + ', null )';
  pFIBQuery1.ExecQuery;
  id_session := pFIBQuery1['ID_SESSION'].AsInt64;
  pFIBQuery1.Close;
  pFIBQuery1.Transaction.Commit;

  pFIBQuery1.Transaction.StartTransaction;
  pFIBQuery1.SQL.text := 'select * from PROC_DOG_DT_DOC_PAY_FULFIL_SEL3(' + IntToStr(id_session) + ', ' + IntToStr(input.arndGetPay) + ', ' + IntToStr(TFIBBCDField(DataSet.fbn('ID_DOG')).AsInt64) + ')';
  pFIBQuery1.ExecQuery;
  while not pFIBQuery1.Eof do
  begin
    SetLength(sa, Length(sa) + 1);
    sa[Length(sa) - 1]._id_S    := pFIBQuery1['ID_SMETA'].AsInt64;
    sa[Length(sa) - 1]._id_R    := pFIBQuery1['ID_RAZD'].AsInt64;
    sa[Length(sa) - 1]._id_St   := pFIBQuery1['ID_STAT'].AsInt64;
    sa[Length(sa) - 1]._id_Kekv := pFIBQuery1['ID_KEKV'].AsInt64;
    sa[Length(sa) - 1]._Sum     := pFIBQuery1['SUMMA'].AsCurrency;
    pFIBQuery1.Next;
  end;
  pFIBQuery1.Close;
  pFIBQuery1.Transaction.Commit;
  pFIBQuery1.Transaction.StartTransaction;
  pFIBQuery1.SQL.Text := 'delete from dog_dt_all_prov where id_session = ' + IntToStr(id_session);
  pFIBQuery1.ExecQuery;
  pFIBQuery1.Transaction.Commit;



//  ShowMessage('alg 3');
  new_sa := Calc(sa, input.Summa, TFIBBCDField(DataSet.fbn('ID_DOG')).AsInt64);
  // Забираешь у Антона по ИД договора разбивку суммы по договору
  // Calc(Разбивка_Антона, Сумма, ИД_Договора) -  новая разбивка
  //////////////////////==============
  FillDefValues;
  for i := 0 to Length(new_sa) - 1 do
  begin
   SetLength(res.Smets, Length(res.Smets) + 1);
   res.Smets[Length(res.Smets) - 1].NumSmeta := new_sa[i]._id_S;
   res.Smets[Length(res.Smets) - 1].NumRazd  := new_sa[i]._id_R;
   res.Smets[Length(res.Smets) - 1].NumStat  := new_sa[i]._id_St;
   res.Smets[Length(res.Smets) - 1].NumKekv  := new_sa[i]._id_Kekv;
   res.Smets[Length(res.Smets) - 1].NSumma    := new_sa[i]._Sum;
  end;
  res.ModalResult := mrOk;
  ModalResult := mrOk;
  exit;
 end;

 //Алгоритм №2;
 pFIBQuery1.Close;

 pFIBQuery1.SQL.Text := 'SELECT result from PUB_SP_TIP_DOG_BELONG_GROUP(' + VarToStr(DataSet['ID_TIP_DOG']) + ', 13)';

 pFIBQuery1.ExecQuery;
 //ShowMessage('Result: ' + IntToStr(pFIBQuery1['RESULT'].AsInteger));
 if pFIBQuery1['RESULT'].AsInteger = 1 then begin
  FillDefValues;
  pFIBQuery1.Close;
  pFIBQuery1.SQL.Text := 'SELECT * from PROC_DOG_DT_DOC_PAY_FULFIL_ALG2(' + IntToStr(TFIBBCDField(DataSet.fbn('ID_DOG')).AsInt64) + ')'{ where SUMMA <> 0'};
  pFIBQuery1.ExecQuery;
  //ShowMessage('Recordcount: ' + IntToStr(pFIBQuery1.RecordCount));
  if pFIBQuery1.RecordCount = 0 then BEGIN
   pFIBQuery1.Close;
   res.ModalResult := mrOk;
   ModalResult := mrOk;
   exit;
  end;
  while not pFIBQuery1.Eof do begin
   SetLength(res.Smets, Length(res.Smets) + 1);
   res.Smets[Length(res.Smets) - 1].NumSmeta := pFIBQuery1['ID_SMETA'].AsInteger;
   res.Smets[Length(res.Smets) - 1].NumRazd  := pFIBQuery1['ID_RAZD'].AsInteger;
   res.Smets[Length(res.Smets) - 1].NumStat  := pFIBQuery1['ID_STAT'].AsInteger;
   res.Smets[Length(res.Smets) - 1].NumKekv  := pFIBQuery1['ID_KEKV'].AsInteger;
//   res.Smets[Length(res.Smets) - 1].id_people:= pFIBQuery1['ID_PEOPLE'].AsInteger;
   res.Smets[Length(res.Smets) - 1].Summa    := pFIBQuery1['SUMMA'].AsCurrency;
   pFIBQuery1.Next;
  end;
//  ShowMessage(formatFloat('0.00', input.summa));

  CalcSmetsSumma(0);
  res.ModalResult := mrOk;
  ModalResult := mrOk;
  exit;
 end else begin
  //Алгоритм №1;
  ts := 0;
  Alg1;
 end;
end;

procedure TdogForm.PrintButtonClick(Sender: TObject);
begin
 ReadDataSet.SelectSQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_SEL';
 ReadDataSet.Open;
// frxReport1.ShowReport;
 ReadDataSet.Close;
end;

procedure TdogForm.ResProc(id: int64; Action: TResAction);
begin
 if (Action <> raView) and (Action <> raClose)  then begin
  SelectAll;
//  ShowMessage(IntToStr(id));
  DataSet.Locate('ID_DOG', id, []);
 end;
end;

procedure TdogForm.CloseOpenButtonClick(Sender: TObject);
begin
 if DataSet.RecordCount = 0 then exit;
 if DataSet['ID_DEPARTMENT'] <> SYS_DEF_ID_DEPARTMENT then
 begin
   ShowMessage('Не можна зачинити договір іншого підрозділу.');
   exit;
 end;


 if MessageDlg('Увага','Ви дійсно бажаєте закрити(відкрити) документ?',mtConfirmation,[mbYes,mbNo]) = mrNo then Exit;
 WriteProc.Transaction.StartTransaction;
 WriteProc.StoredProcName := 'PROC_DOG_DT_DOCUMENT_CLOSE_OPEN';
 WriteProc.Prepare;
 WriteProc.ParamByName('ID_DOG').AsInt64 := TFIBBCDField(DataSet.fbn('ID_DOG')).AsInt64;
 WriteProc.ExecProc;
 WriteProc.Transaction.Commit;
 RefreshButtonClick(Self);
end;

procedure TdogForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  var
   i, c : integer;
begin
 ADone := false;
 ACanvas.Font.Style := [];
 if fltForm.cbEnds.Checked then
 begin
   if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1DOG_CONTINUE.Index] = 1) then
   begin
     ACanvas.Font.Color := RGB(255, 255, 74);
     ACanvas.Font.Style := [fsBold];
   end;
 end;
 if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1DOG_CLOSE.Index] = 1) then begin
  ACanvas.Font.Color := clGray;
  ACanvas.Font.Style := [fsUnderline];
{  for i := AViewInfo.Bounds.Top to AViewInfo.Bounds.Bottom - 1 do
  begin
   c := Round((i - AViewInfo.Bounds.Top) / (AViewInfo.Bounds.Bottom - AViewInfo.Bounds.Top) * 255);
   c := c*2 + 60;
   if c < 0 then c := 0;
   if c >255 then c := 255;
   ACanvas.Pen.Color := RGB(140,c,140);
   ACanvas.MoveTo(AViewInfo.Bounds.Left, i);
   ACanvas.LineTo(AViewInfo.Bounds.Right, i);
  end;
  ADone := true;}
 end;
end;

procedure TdogForm.CheckRecordExists;
begin
 pFIBQuery1.Close;
 pFIBQuery1.SQL.Text := 'select ID_DOG from DOG_DT_DOCUMENT WHERE ID_DOG = ' + IntToStr(DataSet.fieldbyname('ID_DOG').AsInteger) + ' and KOD_DOG = ' + IntToStr(DataSet.fieldbyname('KOD_DOG').AsInteger);
 pFIBQuery1.ExecQuery;
 if pFIBQuery1.RecordCount = 0 then begin
  if MessageDlg('Увага', 'Данная запись отсутствует.' + #13 + #10 + 'Обновить?', mtConfirmation, [mbYes, mbNo]) = mrYes then RefreshButtonClick(Self);
  pFIBQuery1.Close;
  exit;
 end;
 pFIBQuery1.Close;
end;

procedure TdogForm.CalcSmetsSumma(ts : Currency);
var
 i     : integer;
 delta : array of double;
 total_summa : currency;
 max_id  : integer;
 max_sum : currency;
 ex : Boolean;
begin
// ShowMessage('len ' + IntToStr(Length(res.Smets)) + ', ' + 'Сумма ' + FloatToStr(input.summa));
 if (Length(res.Smets) = 1) then if (res.Smets[0].Summa = 0) then
 begin
   if ts = 0 then res.Smets[0].NSumma := input.Summa else res.Smets[0].NSumma := ts;
   Exit;
 end;
 if Length(res.Smets) = 0 then exit;
 SetLength(delta, Length(res.Smets));
 total_summa := 0;
 for i := 0 to Length(res.Smets) - 1 do begin
  delta[i] := res.Smets[i].Summa;
  total_summa := total_summa + res.Smets[i].Summa;
 end;
 if ts <> 0 then total_summa := ts;
 if total_summa = 0 then
 begin
   ex := False;
   for i := 0 to Length(res.Smets) - 1 do if res.Smets[i].NSumma <> 0 then ex := True;
   if (not ex) and (Length(res.Smets) <> 0) then res.Smets[0].NSumma := input.Summa;
   exit;
 end;
 for i := 0 to Length(res.Smets) - 1 do delta[i] := delta[i] / total_summa;
 max_id  := 0;
 max_sum := -9999;
 for i := 0 to Length(res.Smets) - 1 do begin
  res.Smets[i].NSumma := RoundTo(input.Summa * delta[i], -2);
  if res.Smets[i].NSumma > max_sum then begin
   max_id := i;
   max_sum := res.Smets[i].NSumma;
  end;
 end;
 total_summa := 0;
 for i := 0 to Length(res.Smets) - 1 do total_summa := total_summa + res.Smets[i].NSumma;
 if input.Summa <> total_summa then res.Smets[max_id].NSumma := res.Smets[max_id].NSumma + (input.Summa - total_summa);
 ex := False;
 for i := 0 to Length(res.Smets) - 1 do if res.Smets[i].NSumma <> 0 then ex := True;
 if (not ex) and (Length(res.Smets) <> 0) then res.Smets[0].NSumma := input.Summa;
// ShowMessage('len ' + IntToStr(Length(res.Smets)) + ', ' + 'Сумма ' + FloatToStr(input.summa));
end;

procedure TdogForm.PayFulfilButtonClick(Sender: TObject);
begin
 if DataSet.RecordCount = 0 then exit;
 if cxGrid1DBTableView1.DataController.RecordCount = 0 then exit;
 ShowDogPayFulfil(Self, WorkDatabase.Handle, ReadTransaction.Handle, WriteTransaction.Handle, fsNormal, TFIBBCDField(DataSet.fbn('ID_DOG')).AsInt64, -1);
end;

procedure TdogForm.cxGrid1DBTableView1IMAGECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if AViewInfo.GridRecord.Values[cxGrid1DBTableView1DOG_CLOSE.Index] = 1 then begin
  ACanvas.FillRect(AViewInfo.Bounds);
  ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 0);
  ADone := true;
 end; 
end;

procedure TdogForm.N1Click(Sender: TObject);
begin
 fltForm.fltId_tip_dog := DataSet['ID_TIP_DOG'];
 fltForm.fltTipDogEdit.Text := DataSet['NAME_TIP_DOG'];
 fltForm.fltTipDogCheck.Checked := true;
 SelectAll;
end;

procedure TdogForm.ShowUserButtonClick(Sender: TObject);
var
 s : string;
 name_comp, user_name : string;
 time_edit : string;
begin
 if DataSet.RecordCount = 0 then Exit;
 ReadDataSet.Close;
 if VarIsNull(DataSet['ID_DOG']) then
 begin
   Exit;
 end;

 ReadDataSet.SelectSQL.Text := 'select NAME_COMP, TIME_EDIT from dog_dt_document where id_dog = '+VarToStr( DataSet['ID_DOG']);
 ReadDataSet.Open;

 name_comp := IfNull(ReadDataSet['NAME_COMP'], '');
 if VarIsNull(ReadDataSet['TIME_EDIT']) then time_edit := '' else time_edit := DateTimeToStr(ReadDataSet['TIME_EDIT']);
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select full_name from users where id_user = ' + IntToStr(IfNull(DataSet['ID_USER'], -111));
 ReadDataSet.Open;

 user_name := IfNull(ReadDataSet['FULL_NAME'], '');
 ReadDataSet.Close;
 s := 'Користувач: ' + user_name + #13 + 'Комп''ютер: ' + name_comp + #13 + 'Додано: ' + time_edit;
 agShowMessage(s);
{ if DataSet.RecordCount = 0 then exit;
 if VarIsNull(DataSet['ID_USER']) then begin
  ShowMessage('Информация о пользователе отсутствует.');
  exit;
 end;
 pFIBQuery1.SQL.Text := 'select FULL_NAME from USERS where id_user = ' + IntToStr(DataSet['ID_USER']);
 pFIBQuery1.ExecQuery;
 if pFIBQuery1.RecordCount <> 0 then begin
  ShowMessage('Договор был добавлен пользователем: ' + pFIBQuery1['FULL_NAME'].AsString);
 end else ShowMessage('Информация о пользователе отсутствует.');
 pFIBQuery1.Close;}
end;


procedure TdogForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 kl : HKL;
 s  : string;
begin
// ShowMessage('gdfgdf');

// if (GetAsyncKeyState(VK_DELETE) and $8000) <> 0 then ShowMessage('gdfgfdf');
 if (Key = ord('Z')) and (ssCtrl in Shift) and (ssShift in Shift) {and (isAdmin)} then begin
  cxGrid1DBTableView1ID_DOG.Visible := not cxGrid1DBTableView1ID_DOG.Visible;
 end;
 if (Key = ord('I')) and (ssCtrl in Shift) and (ssShift in Shift) {and (isAdmin)} then begin
  Clipboard.Clear;
  Clipboard.AsText := FormatFloat('0', TFIBBCDField(DataSet.fbn('ID_DOG')).AsInt64);
 end;
 if (Key = ord('Q')) and (ssCtrl in Shift) then
 begin
   Dataset.FetchAll;
   ShowMessage('Количество записей: ' + IntToStr(DataSet.RecordCount));
 end;

 if (Key = ord('C')) and (ssCtrl in Shift) then begin
  s := 'Договор № ' + DataSet['REGEST_NUM'] + ' от ' + DateToStr(DataSet['D_DOG']) + 'г.' + #13 + 'Заключен с "' + DataSet['NAME_CUSTOMER'] + '" на сумму ' + FormatFloat('0.00', DataSet['SUMMA']) + ' грн.';
  if ssShift in Shift then s := s + #13 + 'ID_DOG = ' + FormatFloat('0', TFIBBCDField(DataSet.fbn('ID_DOG')).AsInt64);
  kl := GetKeyboardLayout(0);
  LoadKeyboardLayout('00000422',KLF_ACTIVATE or KLF_SUBSTITUTE_OK);
  Clipboard.Clear;
  Clipboard.AsText := s;
  ActivateKeyboardLayout(kl, 0);
 end;

 if Key = VK_SCROLL then ShowHidButtonCaptions;
 if Key = VK_RETURN then cxGrid1DBTableView1DblClick(Self);
 if (Key = VK_DELETE) and (DeleteButton.VisibleForUser) then DeleteButtonClick(Self);
// if Key = VK_INSERT then if AddButton.Visible = ivAlways then AddButtonClick(Self);
// if Key = VK_F2 then if EditButton.Visible = ivAlways then EditButtonClick(Self);
 if Key = VK_F10 then cxGrid1DBTableView1DblClick(Self);
 if Key = VK_F5 then RefreshButtonClick(Self);
// if (Key = VK_F3) or (Key = VK_SPACE) then if ViewButton.Visible = ivAlways then ViewButtonClick(Self);
// if Key = VK_F8 then if ssShift in Shift then CancelFilterButtonClick(Self) else FilterButtonClick(Self);
 if Key = VK_F9 then CloseOpenButtonClick(Self);
 if Key = VK_F11 then PayFulfilButtonClick(Self);
 if (Key = VK_F12) and (PayButton.VisibleForUser) and (not (ssCtrl in Shift)) then PayButtonClick(Self);
 if (Key = VK_F12) and (PayAllButton.VisibleForUser) and (ssCtrl in Shift) then PayAllButtonClick(Self);
 if Key = VK_ESCAPE then ExitButtonClick(Self);
end;

procedure TdogForm.SumFindEditKeyPress(Sender: TObject; var Key: Char);
var
 f : TForm;
begin
 if SumFindEdit.Text = '' then exit;
 if Key = #13 then begin
  f := WaitScreenShow(Self);
  DataSet.Locate('SUMMA', SumFindEdit.Text, [loCaseInsensitive]);
  Key := #0;
  WaitScreenClose(f);
  cxGrid1.SetFocus;
 end;
end;

procedure TdogForm.FormDestroy(Sender: TObject);
var
 reg : TRegistry;
begin
 reg := TRegistry.Create;
 reg.OpenKey(REG_KEY + 'dogForm\Buttons', true);
 reg.WriteBool('ShowCaptions', AddButton.ShowCaption);
 reg.OpenKey(REG_KEY + 'dogForm\ShowInfo', true);
 if Panel2.Height < 100 then reg.WriteBool('Show', False) else reg.WriteBool('Show', true);  
 reg.Free;
 fltform.Free;
end;

procedure TdogForm.N2Click(Sender: TObject);
begin
 fltForm.fltCustEdit.Text := DataSet['NAME_CUSTOMER'];
 fltForm.fltCustEdited := true;
 fltForm.fltCustCheck.Checked := true;
 SelectAll;
end;

procedure TdogForm.CancelFilterButtonClick(Sender: TObject);
begin
 fltForm.cxButton2Click(fltForm);
 SelectAll;
end;

procedure TdogForm.piCloseOpenClick(Sender: TObject);
begin
 CloseOpenButtonClick(Self);
end;

procedure TdogForm.N5Click(Sender: TObject);
begin
 CancelFilterButtonClick(Self);
end;

procedure TdogForm.dxBarLargeButton1Click(Sender: TObject);
begin
 ShowCustomers(Owner, WorkDatabase.Handle, fsMDIChild, now, csmNone, DataSet['ID_CUSTOMER'], -1, False, -1, True);
end;

procedure TdogForm.HideInfoPanelButtonClick(Sender: TObject);
begin
 HideInfoPanelButton.Glyph.Canvas.FillRect(Rect(0, 0, 16, 16));
// HideInfoPanelButton.Repaint;
 if Panel2.Height > 100 then begin
  Panel2.Height := 24;
  ImageList1.Draw(HideInfoPanelButton.Glyph.Canvas, 0, 0, 1);
 end else begin
  Panel2.Height := 137;
  ImageList1.Draw(HideInfoPanelButton.Glyph.Canvas, 0, 0, 2);
 end;
end;

procedure TdogForm.BuildColumns;
var
 i, j, idx : integer;
 finded    : boolean;
begin
 if input.isZayav then begin
  SetLength(input.columns, 6);
  input.columns[0].FieldName := 'NAME_TIP_DOG';
  input.columns[1].FieldName := 'NAME_CUSTOMER';
  input.columns[3].FieldName := 'SUM_TODAY';
  input.columns[4].FieldName := 'SUMMA';
  input.columns[5].FieldName := 'SUM_PAY';
 end;
 if length(input.columns) = 0 then exit;
 idx := 0;
 for i := 0 to cxGrid1DBTableView1.ColumnCount - 1 do begin
  finded := false;
  for j := 0 to Length(input.columns) - 1 do if UpperCase('cxGrid1DBTableView1' + input.columns[j].FieldName) = UpperCase(cxGrid1DBTableView1.Columns[i].Name) then begin
   finded := true;
   idx := j;
   break;
  end;
  if finded then begin
   cxGrid1DBTableView1.Columns[i].Visible := true;
   if input.columns[idx].Caption <> '' then cxGrid1DBTableView1.Columns[i].Caption := input.columns[idx].Caption;
  end else cxGrid1DBTableView1.Columns[i].Visible := false;
 end;
// ********************************** WTF this?????? ****************************
// if not input.isZayav then cxGrid1DBTableView1IMAGE.Visible := True else cxGrid1DBTableView1IS_ZAYAV.Visible := True;
end;


procedure TdogForm.PayButtonClick(Sender: TObject);
var
 f : TDateInputForm;
 form_date : TDate;
 num_pl : integer;
 DataSet_pl: TpFIBDataSet;
 b : boolean;
 sum_today : currency;
 //RecInfo: RECORD_INFO_STRUCTURE;
 // ResultInfo: RESULT_STRUCTURE;
begin
// RefreshButtonClick(Self);

 if DataSet['ID_DEPARTMENT'] <> SYS_DEF_ID_DEPARTMENT then
 begin
   ShowMessage('Не можна сплатити договір іншого підрозділу.');
   exit;
 end;


 ReadDataSet.SelectSQL.Text := 'select SUM_TODAY from dog_dt_document where id_dog = ' + IntToStr(TFIBBCDField(DataSet.fbn('id_dog')).AsInt64);
 ReadDataSet.Open;
 sum_today := ReadDataSet.fbn('SUM_TODAY').AsCurrency;
 ReadDataSet.Close;

// if (not VarIsNull(DataSet.FieldByName('SUM_TODAY').AsVariant)) then begin
  if {DataSet.FieldByName('SUM_TODAY').AsCurrency} sum_today <= 0 then begin
   ShowMessage('Введіть суму до сплати.');
   exit;
  end;
// end else begin
//  ShowMessage('Введіть суму до сплати.');
//  exit;
// end;

 ReadDataSet.Active := false;
 ReadDataSet.SelectSQL.Text := 'select * from dog_dt_sum_predopl(' + IntToStr( TFIBBCDField(DataSet.fbn('id_dog')).AsInt64) +')';
 ReadDataSet.Active := true;
 if  ReadDataSet.FieldByName('pr').Value='1' then
 begin
   ReadDataSet.Close;
   ShowMessage('Неможливо сплатити платіжне доручення, тому що сума передсплати перевищує суму кошторису');
   Exit;
 end;
 ReadDataSet.Close;

 DataSet_pl := TpFIBDataSet.Create(Self);
 DataSet_pl.Transaction := WTransaction2;
 DataSet_pl.Transaction.StartTransaction;
 DataSet_pl.SelectSQL.Text := 'select nOMER_pl from dog_ini_pl with lock';
 try
  DataSet_pl.Open;
 except
  DataSet_pl.Transaction.Rollback;
  DataSet_pl.Close;
  DataSet_pl.Free;
  ShowMessage('Формування платежу не можливо. Таблиця заблокована іншим користувачем');
  exit;
 end;

 f := TDateInputForm.Create(Self);
 f.NumEdit.Text := DataSet_pl['NOMER_PL'];

 DataSet_pl.Transaction.Commit;
 DataSet_pl.Close;
 DataSet_pl.Free;

 if f.ShowModal <> mrOk then begin
  f.free;
  exit;
 end;
 form_date := f.DateEdit.Date;
 if f.cxCheckBox1.Checked then num_pl := StrToInt(f.numedit.Text) else num_pl := -1;
 f.Free;

 {блокировка при формировании платежек}
{try
  Trans := TpFIBTransaction.Create(Self);

  pFIBStoredProc1.Database:=WorkDatabase;
  Trans.DefaultDatabase := WorkDatabase;

  pFIBStoredProc1.Transaction := Trans;
  Trans.StartTransaction;

  RecInfo.TRHANDLE       :=Trans.Handle;
  RecInfo.DBHANDLE       :=WorkDatabase.Handle;
  RecInfo.ID_RECORD      :=VarArrayOf([DataSet.FieldByName('ID_DOG').AsVariant]);
  RecInfo.PK_FIELD_NAME  :=VarArrayOf(['ID_DOG']);
  RecInfo.TABLE_NAME     :='DOG_DT_DOCUMENT';
  RecInfo.RAISE_FLAG     :=True;
  LockRecord(@RecInfo);
}


 DataSet_pl := TpFIBDataSet.Create(Self);
 DataSet_pl.Transaction := WriteTransaction;
 DataSet_pl.Transaction.StartTransaction;
 DataSet_pl.SelectSQL.Text := 'select nOMER_pl from dog_ini_pl with lock';
 try
  DataSet_pl.Open;
 except
  DataSet_pl.Transaction.Commit;
  DataSet_pl.Close;
  DataSet_pl.Free;
  ShowMessage('Формування платежу не можливо. Таблиця заблокована іншим користувачем');
  exit;
 end;

 if num_pl = -1 then num_pl := DataSet_pl.FieldByName('nOMER_pl').AsInteger;

// Showmessage('gfdgdf');
 try
  if LoadDogManedger.SavePlDoc(self,DataSet,WorkDatabase.Handle,WriteTransaction.Handle, DataSet.FieldByName('ID_DOG').AsVariant, form_date, num_pl) = 1 then
  begin
   b := true;
   ShowMessage('Платіжне доручення сформовано.');
  end;
 except
  ShowMessage('Помилка при формуванні платежа.');
 end;

 DataSet_pl.Transaction.Commit;
 DataSet_pl.Close;
 DataSet_pl.Free;
 if b then RefreshButtonClick(Self);

{
 Trans.Commit;
  except on e:exception do
  begin
    MessageBox(self.Handle,PChar(e.Message),'Помилка',MB_OK+MB_ICONERROR);
    Trans.Rollback;
  end;
 end;
}
end;

procedure TdogForm.PayAllButtonClick(Sender: TObject);
var
// i : integer;
 formed : boolean;
 fr : TForm;
 cnt : integer;
 form_date : TDate;
 f : TDateInputForm;
 num_pl : integer;
 DataSet_pl: TpFIBDataSet;
 ids : array of Int64;
 sl :TStringList;
 err : boolean;
begin


 DataSet_pl := TpFIBDataSet.Create(Self);
 DataSet_pl.Transaction := WTransaction2;
 DataSet_pl.Transaction.StartTransaction;
 DataSet_pl.SelectSQL.Text := 'select nOMER_pl from dog_ini_pl with lock';
 try
  DataSet_pl.Open;
 except
  DataSet_pl.Transaction.Commit;
  DataSet_pl.Close;
  DataSet_pl.Free;
  ShowMessage('Формування платежу не можливо. Таблиця заблокована іншим користувачем');
  exit;
 end;

// Showmessage('1');

 f := TDateInputForm.Create(Self);
 f.NumEdit.Text := DataSet_pl['NOMER_PL'];
 DataSet_pl.Transaction.Commit;
 DataSet_pl.Close;
 DataSet_pl.Free;

// Showmessage('2');

 if f.ShowModal <> mrOk then begin
  f.free;
  exit;
 end;

// Showmessage('3');

 form_date := f.DateEdit.Date;
 num_pl := StrToInt(f.NumEdit.Text);
 f.Free;

 fr := WaitScreenShow(Self);

// Showmessage('4');

 SelectAll;//(True, True);
 DataSet.FetchAll;

 WaitScreenClose(fr);

 fr := WaitScreenShowWithProgress(Self, DataSet.RecordCount);

// Showmessage('5');
 //----
  DataSet_pl := TpFIBDataSet.Create(Self);
 DataSet_pl.Transaction := WriteTransaction;
 DataSet_pl.Transaction.StartTransaction;
 DataSet_pl.SelectSQL.Text := 'select nOMER_pl from dog_ini_pl with lock';
 try
  DataSet_pl.Open;
 except
  DataSet_pl.Transaction.Commit;
  DataSet_pl.Close;
  DataSet_pl.Free;
  WaitScreenClose(fr);
  ShowMessage('Формування платежу не можливо. Таблиця заблокована іншим користувачем');
  exit;
 end;

// Showmessage('6');
 // ---


 formed := false;
 cnt := 0;
 err := false;
 while not DataSet.Eof do begin
  if DataSet['ID_DEPARTMENT'] <> SYS_DEF_ID_DEPARTMENT then
  begin
   ShowMessage('Не можна сплатити договір іншого підрозділу.');
   err := true;
   break;
  end;
  if (not VarIsNull(DataSet.FieldByName('SUM_TODAY').AsVariant)) then if DataSet.FieldByName('SUM_TODAY').AsCurrency > 0 then if DataSet.FieldByName('SUM_TODAY').AsCurrency <> 0 then begin
   try
    cnt := cnt + LoadDogManedger.SavePlDoc(self,DataSet,WorkDatabase.Handle,WriteTransaction.Handle,DataSet.FieldByName('ID_DOG').AsVariant, form_date, num_pl);
//    DataSet_pl := TpFIBDataSet.Create(Self);
//    DataSet_pl.Transaction := ReadTransaction;
    DataSet_pl.Active := false;
    DataSet_pl.SelectSQL.Text := 'select nOMER_pl from dog_ini_pl';
    DataSet_pl.Open;
//    Showmessage('7');
    num_pl := DataSet_pl['NOMER_PL'];
//   DataSet_pl.Close;
//    DataSet_pl.Free;

   except
    ShowMessage('Ошибка при формировании платежки.');
   end;
  end;
  DataSet.Next;
  WaitScreenStep(fr);
 end;
// Showmessage('8');

 if not err then DataSet_pl.Transaction.Commit else DataSet_pl.Transaction.Rollback;
 DataSet_pl.Close;
 DataSet_pl.Free;

// Showmessage('9');

 SelectAll;
 WaitScreenClose(fr);
// Showmessage('10');
 if cnt <> 0 then formed := true;
 if formed then begin
  RefreshButtonClick(Self);
  ShowMessage('Сформовано платежек: ' + IntToStr(cnt));
 end else ShowMessage('Ні однієї платежки не сформовано.');
end;

procedure TdogForm.ShowHidButtonCaptions;
var
 i : integer;
begin
 dxBarManager1.LockUpdate := True;
 for i:=0 to ComponentCount - 1 do if Components[i] is TdxBarLargeButton then TdxBarLargeButton(Components[i]).ShowCaption := not TdxBarLargeButton(Components[i]).ShowCaption;
 dxBarManager1.LockUpdate := False;
end;


(*
function TdogForm.Calc(InArray: TSmetArray; InSum: currency; id_Dog : integer): TSmetArray;
var
 i, j, t : integer;
 Sx      : currency;
 St      : currency;
 Flag    : boolean;

 Periods : TPeriodArray;
 PerData : TPeriodDataArray;

 PerSum  : currency;
 TempSum : currency;
 ResSum  : currency;
 Sum     : currency;

// min_Num : Integer;

 k : Integer;

 DataSetArnd : TpFIBDataSet;

 function FindPeriodSum(DBeg, DEnd : TDate; InSum : currency) : currency;
 var
  Month : word;
  Year  : word;
 begin
  Result := 0;

  if (MonthOfTheYear(DBeg) = MonthOfTheYear(DEnd)) and (YearOf(DBeg) = YearOf(DEnd)) then
   Result := InSum * (DEnd - DBeg + 1) / DaysInMonth(DBeg)
  else begin
   Month := MonthOfTheYear(DBeg);
   Year  := YearOf(DBeg);

   while YearOf(DEnd) >= Year do begin
    while MonthOfTheYear(DEnd) >= Month do begin
     if (Month = MonthOfTheYear(DBeg)) and (Year = YearOf(DBeg)) then
      Result := Result + InSum * (DaysInMonth(DBeg) - DayOf(DBeg) + 1) / DaysInMonth(DBeg)
     else if (Month = MonthOfTheYear(DEnd)) and (Year = YearOf(DEnd)) then
      Result := Result + InSum * DayOf(DEnd) / DaysInMonth(DEnd)
     else
      Result := Result + InSum;

     Inc(Month);
     if Month > 12 then begin
      Month := 1;
      Break;
     end;
    end;

    Inc(Year);
   end;
  end;
 end;
begin
 Sx := 0;
 for i := 0 to Length(InArray) - 1 do Sx := Sx + InArray[i]._Sum;

// Selecting Dog's :) data

 Periods := nil;
 PerData := nil;

 DataSetArnd := TpFIBDataSet.Create(Self);
 DataSetArnd.Database := WorkDatabase;
 DataSetArnd.Transaction := ReadTransaction;
 DataSetArnd.Close;

 DataSetArnd.SelectSQL.Text := 'select * from DOG_DT_ARENDA_P_SEL(' + IntToStr(id_Dog) + ')';
 DataSetArnd.Open;
 while not DataSetArnd.Eof do begin
  SetLength(Periods, Length(Periods) + 1);

  with Periods[Length(Periods) - 1] do begin
   _id_Period := DataSetArnd.FieldValues['ID_PERIOD'];
   _Date_Beg  := DataSetArnd.FieldValues['DATE_BEG'];
   _Date_End  := DataSetArnd.FieldValues['DATE_END'];
   _Sum       := DataSetArnd.FieldValues['SUMMA'];
  end;

  DataSetArnd.Next;
 end;

 DataSetArnd.Close;

 for i := 0 to Length(Periods) - 1 do begin
  DataSetArnd.SelectSQL.Text := 'select * from DOG_DT_ARENDA_S_SEL(' + IntToStr(Periods[i]._id_Period) + ') order by SUMMA ASC';
  DataSetArnd.Open;

  while not DataSetArnd.Eof do begin
   SetLength(PerData, Length(PerData) + 1);

   with PerData[Length(PerData) - 1] do begin
    _id_Period := Periods[i]._id_Period;
    _id_S      := DataSetArnd.FieldValues['ID_S'];
    _id_R      := DataSetArnd.FieldValues['ID_R'];
    _id_St     := DataSetArnd.FieldValues['ID_ST'];
    _id_Kekv   := DataSetArnd.FieldValues['ID_KEKV'];
    _Sum       := DataSetArnd.FieldValues['SUMMA'];
   end;

   DataSetArnd.Next;
  end;

  DataSetArnd.Close;
 end;

 // Filling sum

 St := Sx + InSum;
 Result := nil;

 for i := 0 to Length(Periods) - 1 do begin
  PerSum :=  RoundTo(FindPeriodSum(Periods[i]._Date_Beg, Periods[i]._Date_End, Periods[i]._Sum), -2);

  if (St >= PerSum) and (i <> Length(Periods) - 1) then begin
   TempSum := PerSum;
   St      := St - TempSum;
  end
  else begin
   TempSum := St;
   St := 0;
  end;

  Sum := TempSum;

  for j := 0 to Length(PerData) - 1 do begin
   if PerData[j]._id_Period <> Periods[i]._id_Period then Continue;

   ResSum := RoundTo(TempSum * FindPeriodSum(Periods[i]._Date_Beg, Periods[i]._Date_End, PerData[j]._Sum) / PerSum, -2);
   if ResSum <= 0 then Continue;

   Flag := False;
   for t := 0 to Length(Result) - 1 do
    if (Result[t]._id_S = PerData[j]._id_S) and (Result[t]._id_R = PerData[j]._id_R)
    and (Result[t]._id_St = PerData[j]._id_St) and (Result[t]._id_Kekv = PerData[j]._id_Kekv) then begin
     Flag := True;
     Break;
    end;

   if not Flag then begin
    SetLength(Result, Length(Result) + 1);
    with Result[Length(Result) - 1] do begin
     _id_S    := PerData[j]._id_S;
     _id_R    := PerData[j]._id_R;
     _id_St   := PerData[j]._id_St;
     _id_Kekv := PerData[j]._id_Kekv;
    end;

    t := Length(Result) - 1;
   end;

   if Flag then begin
    if ResSum <= Sum then Result[t]._Sum := Result[t]._Sum + ResSum
    else Result[t]._Sum := Result[t]._Sum + Sum;
   end
   else begin
    if ResSum <= Sum then Result[t]._Sum := ResSum
    else Result[t]._Sum := Sum;
   end;

   Sum := Sum - ResSum;

   if Sum <= 0 then Break;
  end;

  if St = 0 then Break;
 end;

 // Result := Plan - Fact

 for i := 0 to Length(InArray) - 1 do begin
  InArray[i]._Handled := False;

  for j := 0 to Length(Result) - 1 do begin
   if (InArray[i]._id_S = Result[j]._id_S) and (InArray[i]._id_R = Result[j]._id_R)
   and(InArray[i]._id_St = Result[j]._id_St) and (InArray[i]._id_Kekv = Result[j]._id_Kekv) then begin
    Result[j]._Sum      := Result[j]._Sum - InArray[i]._Sum;
    InArray[i]._Handled := True;
   end;
  end;
 end;

 for i := 0 to Length(InArray) - 1 do begin
  if InArray[i]._Handled then Continue;

  SetLength(Result, Length(Result) + 1);
  Result[Length(Result) - 1] := InArray[i];
  Result[Length(Result) - 1]._Sum := -1 * Result[Length(Result) - 1]._Sum;
 end;


 k := 0;
 while k <= Length(Result) - 1 do begin
  if Result[k]._Sum = 0 then begin
   for i := k to Length(Result) - 2 do Result[i] := Result[i + 1];

   SetLength(Result, Length(Result) - 1);
  end
  else Inc(k);
 end;
end;
*)

function TdogForm.Calc(InArray: TSmetArray; InSum: currency; id_Dog : int64): TSmetArray;
var
 i, j, t : integer;
 Sx      : currency;
 St      : currency;
 Flag    : boolean;

 Periods : TPeriodArray;
 PerData : TPeriodDataArray;

 PerSum  : currency;
 TempSum : currency;
 ResSum  : currency;
 Sum     : currency;

 maxSum  : currency;
 maxNum  : integer;
 SumSum  : currency;
 ZerNum  : integer;

// min_Num : Integer;

 k : Integer;

 DataSetArnd : TpFIBDataSet;

 function FindPeriodSum(DBeg, DEnd : TDate; InSum : currency) : currency;
 var
  Month : word;
  Year  : word;
 begin
  Result := 0;

  if (MonthOfTheYear(DBeg) = MonthOfTheYear(DEnd)) and (YearOf(DBeg) = YearOf(DEnd)) then
   Result := InSum * (DEnd - DBeg + 1) / DaysInMonth(DBeg)
  else begin
   Month := MonthOfTheYear(DBeg);
   Year  := YearOf(DBeg);

   while YearOf(DEnd) >= Year do begin
    while MonthOfTheYear(DEnd) >= Month do begin
     if (Month = MonthOfTheYear(DBeg)) and (Year = YearOf(DBeg)) then
      Result := Result + InSum * (DaysInMonth(DBeg) - DayOf(DBeg) + 1) / DaysInMonth(DBeg)
     else if (Month = MonthOfTheYear(DEnd)) and (Year = YearOf(DEnd)) then
      Result := Result + InSum * DayOf(DEnd) / DaysInMonth(DEnd)
     else
      Result := Result + InSum;

     Inc(Month);
     if Month > 12 then begin
      Month := 1;
      Break;
     end;
    end;

    Inc(Year);
   end;
  end;
 end;
begin
 Sx := 0;
 for i := 0 to Length(InArray) - 1 do Sx := Sx + InArray[i]._Sum;

// Selecting Dog's  data

 Periods := nil;
 PerData := nil;

 DataSetArnd := TpFIBDataSet.Create(Self);
 DataSetArnd.Database := WorkDatabase;
 DataSetArnd.Transaction := ReadTransaction;
 DataSetArnd.Close;

 DataSetArnd.SelectSQL.Text := 'select * from DOG_DT_ARENDA_P_SEL(' + IntToStr(id_Dog) + ')';
 DataSetArnd.Open;
 while not DataSetArnd.Eof do begin
  SetLength(Periods, Length(Periods) + 1);

  with Periods[Length(Periods) - 1] do begin
   _id_Period := DataSetArnd.FieldValues['ID_PERIOD'];
   _Date_Beg  := DataSetArnd.FieldValues['DATE_BEG'];
   _Date_End  := DataSetArnd.FieldValues['DATE_END'];
   _Sum       := DataSetArnd.FieldValues['SUMMA'];
  end;

  DataSetArnd.Next;
 end;

 DataSetArnd.Close;

 for i := 0 to Length(Periods) - 1 do begin
  DataSetArnd.SelectSQL.Text := 'select * from DOG_DT_ARENDA_S_SEL(' + IntToStr(Periods[i]._id_Period) + ') order by SUMMA ASC';
  DataSetArnd.Open;

  while not DataSetArnd.Eof do begin
   SetLength(PerData, Length(PerData) + 1);

   with PerData[Length(PerData) - 1] do begin
    _id_Period := Periods[i]._id_Period;
    _id_S      := DataSetArnd.FieldValues['ID_S'];
    _id_R      := DataSetArnd.FieldValues['ID_R'];
    _id_St     := DataSetArnd.FieldValues['ID_ST'];
    _id_Kekv   := DataSetArnd.FieldValues['ID_KEKV'];
    _Sum       := DataSetArnd.FieldValues['SUMMA'];
   end;

   DataSetArnd.Next;
  end;

  DataSetArnd.Close;
 end;

 // Filling sum

 St := Sx + InSum;
 Result := nil;

 for i := 0 to Length(Periods) - 1 do begin
  PerSum :=  RoundTo(FindPeriodSum(Periods[i]._Date_Beg, Periods[i]._Date_End, Periods[i]._Sum), -2);

  if (St >= PerSum) and (i <> Length(Periods) - 1) then begin
   TempSum := PerSum;
   St      := St - TempSum;
  end
  else begin
   TempSum := St;
   St := 0;
  end;

  Sum := TempSum;

  for j := 0 to Length(PerData) - 1 do begin
   if PerData[j]._id_Period <> Periods[i]._id_Period then Continue;

   ResSum := RoundTo(TempSum * FindPeriodSum(Periods[i]._Date_Beg, Periods[i]._Date_End, PerData[j]._Sum) / PerSum, -2);
   if ResSum <= 0 then Continue;

   Flag := False;
   for t := 0 to Length(Result) - 1 do
    if (Result[t]._id_S = PerData[j]._id_S) and (Result[t]._id_R = PerData[j]._id_R)
    and (Result[t]._id_St = PerData[j]._id_St) and (Result[t]._id_Kekv = PerData[j]._id_Kekv) then begin
     Flag := True;
     Break;
    end;

   if not Flag then begin
    SetLength(Result, Length(Result) + 1);
    with Result[Length(Result) - 1] do begin
     _id_S    := PerData[j]._id_S;
     _id_R    := PerData[j]._id_R;
     _id_St   := PerData[j]._id_St;
     _id_Kekv := PerData[j]._id_Kekv;
    end;

    t := Length(Result) - 1;
   end;

   if Flag then begin
    if ResSum <= Sum then Result[t]._Sum := Result[t]._Sum + ResSum
    else Result[t]._Sum := Result[t]._Sum + Sum;
   end
   else begin
    if ResSum <= Sum then Result[t]._Sum := ResSum
    else Result[t]._Sum := Sum;
   end;

   Sum := Sum - ResSum;

   if Sum <= 0 then Break;
  end;

  if St = 0 then Break;
 end;

 // Result := Plan - Fact

 for i := 0 to Length(InArray) - 1 do begin
  InArray[i]._Handled := False;

  for j := 0 to Length(Result) - 1 do begin
   if (InArray[i]._id_S = Result[j]._id_S) and (InArray[i]._id_R = Result[j]._id_R)
   and(InArray[i]._id_St = Result[j]._id_St) and (InArray[i]._id_Kekv = Result[j]._id_Kekv) then begin
    Result[j]._Sum      := Result[j]._Sum - InArray[i]._Sum;
    InArray[i]._Handled := True;
   end;
  end;
 end;

 for i := 0 to Length(InArray) - 1 do begin
  if InArray[i]._Handled then Continue;

  SetLength(Result, Length(Result) + 1);
  Result[Length(Result) - 1] := InArray[i];
  Result[Length(Result) - 1]._Sum := -1 * Result[Length(Result) - 1]._Sum;
 end;

 // Перекидываю потери от округления
 SumSum := 0;
 maxNum := -1;
 zerNum := -1;
 for i := 0 to Length(Result) - 1 do begin
  SumSum := SumSum + Result[i]._Sum;

  if Result[i]._Sum = 0 then begin
   if zerNum < 0 then zerNum := i;
  end
  else begin
   if maxNum < 0 then begin
    maxSum := Result[i]._Sum;
    maxNum := i;
   end
   else if maxSum < Result[i]._Sum then begin
    maxSum := Result[i]._Sum;
    maxNum := i;
   end;
  end;
 end;

 if MaxNum >= 0 then begin
  if SumSum <> InSum then Result[MaxNum]._Sum := Result[MaxNum]._Sum + (InSum - SumSum);
 end
 else if zerNum >= 0 then begin
  Result[zerNum]._Sum := Result[zerNum]._Sum + (InSum - SumSum);
 end;

 k := 0;
 while k <= Length(Result) - 1 do begin
  if Result[k]._Sum = 0 then begin
   for i := k to Length(Result) - 2 do Result[i] := Result[i + 1];

   SetLength(Result, Length(Result) - 1);
  end
  else Inc(k);
 end;
end;

procedure TdogForm.miPlatClick(Sender: TObject);
begin
  ShowPlat(Owner, WorkDatabase.Handle, ReadTransaction.Handle, WriteTransaction.Handle, fsMDIChild, -1, DataSet['REGEST_NUM']);
end;

procedure TdogForm.dxBarLargeButton3Click(Sender: TObject);
begin
 miPlatClick(Self);
end;

procedure TdogForm.cxTextEdit1PropertiesChange(Sender: TObject);
begin
 if CustEdit.Tag <> 1 then Timer1.Enabled := True;
 CustEdit.Tag := 0; 
end;

procedure TdogForm.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled := False;
 fltForm.fltCustEdit.Text := CustEdit.Text;
 fltForm.fltCustCheck.Checked := True;
 fltForm.fltCustEdited := True;
 SelectAll;
end;

procedure TdogForm.FilterButtonClick(Sender: TObject);
begin
 fltForm.report_class := 0;
 if fltForm.ShowModal = mrOk then begin
 id_class:=fltForm.id_class;

 SelectAll;
 end;
end;

procedure TdogForm.CustEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then cxGrid1.SetFocus;
end;

procedure TdogForm.SpeedButton1Click(Sender: TObject);
begin
 SelectAll();
end;

procedure TdogForm.dxBarLargeButton4Click(Sender: TObject);
var
 id_dog : int64;
 res : integer;
 name_proc : string;
begin
 if DataSet.RecordCount = 0 then exit;

 if DataSet['ID_DEPARTMENT'] <> SYS_DEF_ID_DEPARTMENT then
 begin
   ShowMessage('Не можна клонувати договір іншого підрозділу.');
   exit;
 end;

 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select name_proc_for_clone from DOG_INI_SHABLON where id_shablon = (select id_ini_shablon from pub_sp_tip_dog where id_tip_dog = ' + IntToStr(DataSet['ID_TIP_DOG']) +')';

 ReadDataSet.Open;
 if VarIsNull(ReadDataSet['name_proc_for_clone']) then
 begin
   ReadDataSet.Close;
   ShowMessage('Цей договор не можна клонувати.');
   exit;
 end;
 name_proc := ReadDataSet['name_proc_for_clone'];
 ReadDataSet.Close;

{ ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select RESULT from pub_sp_tip_dog_belong_group(' + IntToStr(DataSet['ID_TIP_DOG']) + ', 99)';
 ReadDataSet.Open;
 res := ReadDataSet['RESULT'];
 ReadDataSet.Close;

 if res <> 1 then
 begin
   ShowMessage('Цей договор не можна клонувати.');
   exit;
 end;}

 WriteProc2.Transaction.StartTransaction;
 WriteProc2.StoredProcName := name_proc;
 WriteProc2.Prepare;
 WriteProc2.ParamByName('IN_ID_CONTRACT').AsInt64 := TFIBBCDField(DataSet.fbn('ID_DOG')).asInt64;
 WriteProc2.ExecProc;
 id_dog := WriteProc2.ParamByName('NEW_ID_CONTRACT').AsInt64;

 WriteProc2.Transaction.Commit;
 WriteProc2.Close;


 WriteProc2.Transaction.StartTransaction;
 WriteProc2.StoredProcName := 'PROC_CLONE_CLEAR';
 WriteProc2.Prepare;
 WriteProc2.ParamByName('ID_DOG').AsInt64 := id_dog;
 WriteProc2.ExecProc;
 WriteProc2.Transaction.Commit;
 WriteProc2.Close;

// UPDATE DOG_DT_DOCUMENT SET SUM_PAY=0,SUM_FULFIL=0,NDS_SUM=0,NDS_PAY=0,N_DOG='оО' WHERE kod_dog=:id_dog;

 SelectAll;
 DataSet.Locate('ID_DOG', id_dog, []);

//При клонировании договоров занулять суммы оплаты и выполнения (Sum_Pay, Sum_Fulfil и НДС с ними связанный)



 if UpperCase(DataSet['name_shablon']) = 'SHABLON_VCV.BPL' then
 begin
    LoadDogManedger.LoadShablon(self, WorkDatabase.Handle, fsMDIChild, DataSet.FieldByName('ID_DOG').AsVariant, 'red2', DataSet.FieldByName('id_tip_dog').AsVariant, PChar(DataSet.FieldByName('name_shablon').asString), ResProc);
 end;

end;

procedure TdogForm.dxBarLargeButton5Click(Sender: TObject);
var
 repFile : string;
// f : TfrmRepDate;
 flt : TfltDogForm;
begin
 pFIBQuery1.Close;
 pFIBQuery1.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 4';
 pFIBQuery1.ExecQuery;
 if pFIBQuery1.RecordCount <> 0 then if not VarIsNull(pFIBQuery1['REPORT_FILE'].AsVariant) then repFile := pFIBQuery1['REPORT_FILE'].AsString;
 pFIBQuery1.Close;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReportDog.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден.');
   exit;
 end;

 flt := TfltDogForm.Create(Self);
    flt.report_class := 1;
 if a_in <> nil then flt.id_Group := a_in['ID_GROUP'].AsInt64 else flt.id_Group := input.id_Group;

 flt.repGroupBox.Visible := true;
 flt.Height := 680;
 flt.repGroupBox.Top := 435;
 flt.pFIBDatabase1 := WorkDatabase;

 flt.fltDateBegEdit.Date:=date;
 flt.fltDateEndEdit.Date:=date;

 {flt.fltRegNumEdit.Text := fltForm.fltRegNumEdit.Text;
 flt.fltRegNumCheck.Checked := fltForm.fltRegNumCheck.Checked;
 flt.NumDogEdit.Text := fltForm.NumDogEdit.Text;
 flt.chNumDog.Checked := fltForm.chNumDog.Checked;
 flt.flt_id_Customer := fltForm.flt_id_Customer;
 flt.fltCustEdit.Text := fltForm.fltCustEdit.Text;
 flt.fltCustCheck.Checked := fltForm.fltCustCheck.Checked;
 flt.fltId_tip_dog := fltForm.fltId_tip_dog;
 flt.fltTipDogEdit.Text := fltForm.fltTipDogEdit.Text;
 flt.fltTipDogCheck.Checked := fltForm.fltTipDogCheck.Checked;
 flt.fltDateBegEdit.Text := fltForm.fltDateBegEdit.Text;
 flt.fltDateEndEdit.Text := fltForm.fltDateEndEdit.Text; }
 flt.fltDatePeriodCheck.Checked :=  fltForm.fltDatePeriodCheck.Checked;
 flt.flt_id_department := fltForm.flt_id_department;
 flt.depEdit.Text := fltForm.depEdit.Text;
 flt.depCheck.Checked := fltform.depCheck.Checked;
 {flt.DateActBegEdit.Text :=  fltForm.DateActBegEdit.Text;
 flt.DateActEndEdit.Text :=  fltForm.DateActEndEdit.Text;
 flt.dateactCheck.Checked := fltForm.dateactCheck.Checked;
 flt.nomnEdit.Text := fltForm.nomnEdit.Text;
 flt.NomnCheck.Checked := fltForm.NomnCheck.Checked;
 flt.DateNomnBegEdit.Text := fltForm.DateNomnBegEdit.Text;
 flt.DateNomnEndEdit.Text := fltForm.DateNomnEndEdit.Text;
 flt.DateNomnCheck.Checked := fltForm.DateNomnCheck.Checked;
 flt.flt_id_rate_acc_native := fltForm.flt_id_rate_acc_native;
 flt.RateAccNativeEdit.Text := fltForm.RateAccNativeEdit.Text;
 flt.cbRateAccNative.Checked := fltForm.cbRateAccNative.Checked;
 flt.ShowClosedCheck.Checked := fltForm.ShowClosedCheck.Checked;
 flt.chSumPayFulfil1.Checked := fltform.chSumPayFulfil1.Checked;
 flt.chSumPayFulfil2.Checked := fltform.chSumPayFulfil2.Checked;
 flt.MatEdit.Text := fltForm.MatEdit.Text;
 flt.cbMat.Checked := fltForm.cbMat.Checked;     }

 if flt.ShowModal <> mrOK then
 begin
  id_class:=fltForm.id_class;
  flt.Free;
  exit;
 end;
 RepDataSet.Close;
 RepDataSet.SelectSQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_SEL_REP(:ID_GROUP, :ID_USER, :FLT_ID_TIP_DOG, :WHRE_COND, :WHRE_COND_FOR_MAN, :ID_OTDEL, :USE_SHORT, :ID_MATERIAL, :ID_SESSION_TYPE, ' + QuotedStr(flt.fltDateBegEdit.Text) + ', ' + QuotedStr(flt.fltDateEndEdit.Text) + ', :P_ID_CLASS, :WHRE_COND_SUM)';
 flt.ApplyToDataset(RepDataSet, input.id_Group, input.isZayav, false, cbUseShort.Checked, false);

 if flt.repA4.Checked then
 begin
   if flt.repBook.Checked then
   begin
    TfrxReportPage(frxReportDog.Pages[0]).Orientation:=poPortrait;
   end
   else
   begin
    TfrxReportPage(frxReportDog.Pages[0]).Orientation:=poLandscape;
   end;
 end;
 if flt.repA3.Checked then
 begin
   if flt.repBook.Checked then
   begin
     TfrxReportPage(frxReportDog.Pages[0]).PaperWidth := 297;
     TfrxReportPage(frxReportDog.Pages[0]).PaperHeight := 420;
   end
   else
   begin
     TfrxReportPage(frxReportDog.Pages[0]).PaperWidth := 420;
     TfrxReportPage(frxReportDog.Pages[0]).PaperHeight := 297;
   end;
 end;
// frxReportDog.Page.
 frxReportDog.Variables['ShowFulfilDoc'] := flt.repDocFulfilCheck.Checked;
 frxReportDog.Variables['ShowPayDoc'] := flt.repDocPaycheck.Checked;
 frxReportDog.Variables['ShowSumPay'] := flt.repSumPayCheck.Checked;
 frxReportDog.Variables['ShowSumFulfil'] := flt.repSumFulfilCheck.Checked;
 frxReportDog.Variables['ShowNumdog'] := flt.repNumDogCheck.Checked;
 frxReportDog.Variables['ShowRegNum'] := flt.repRegNumCheck.Checked;
 frxReportDog.Variables['ShowSum'] := flt.repSumCheck.Checked;
 frxReportDog.Variables['ShowRest'] := flt.repRestCheck.Checked;
 frxReportDog.Variables['ShowPerF'] := flt.repPercentCheck.Checked;
 frxReportDog.Variables['ShowNote'] := flt.repNoteCheck.Checked;
 frxReportDog.Variables['from_date'] := DateToStr(rpDateBeg);
 frxReportDog.Variables['to_date'] := DateToStr(rpDateEnd);
 frxReportDog.Variables['ShowNumDatedog'] := flt.repNumDateDogCheck.Checked;
 flt.Free;

 RepDataSet.ParamByName('ID_GROUP').AsInteger := DataSet.ParamByName('ID_GROUP').AsInteger;
 RepDataSet.ParamByName('ID_USER').AsInteger := DataSet.ParamByName('ID_USER').AsInteger;
 //RepDataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger := DataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger;
 //RepDataSet.ParamByName('WHERE_COND').AsString := DataSet.ParamByName('WHERE_COND').AsString;
 RepDataSet.Active := true;

 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
 begin
 frxReportDog.DesignReport;
   Exit;
 end else frxReportDog.ShowReport();
end;

procedure TdogForm.frxReportDogGetValue(const VarName: String;
  var Value: Variant);
begin
 if VarName = 'from_date' then Value := DateToStr(rpDateBeg);
 if VarName = 'to_date' then Value := DateToStr(rpDateEnd);
end;

procedure TdogForm.dxBarButton3Click(Sender: TObject);
//var
// frm : TfrmDogOptions;
{ Res      : TDogResult;
 input    : TDogInput;
 s  : string;

 id_s,
 id_r,
 id_st,
 id_kekv : integer;
 summa : currency;

 kod_s,
 kod_r,
 kod_st,
 kod_kekv : integer;

 sum : currency;

 i : integer;}
begin
{ frm := TfrmDogOptions.Create(Self, cxGrid1DBTableView1);
 frm.ShowModal;
 frm.Free;}
 agColumnCustomizer1.Customize;
{ input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := WorkDatabase.Handle;
 input.ReadTrans    := ReadTransaction.Handle;
 input.WriteTrans   := WriteTransaction.Handle;
 input.FormStyle    := fsNormal;
 input.id_Group     := 3299;
 input.id_Group_add := 3399;
 input.Summa        := 0;
 input.arndGetPay   := 1;

 input.filter.bUseFilter      := True;
 input.filter.bRegNum := True;
 input.filter.RegNum  := '1089/06-41';

 res := DogLoaderUnit.ShowDogMain(Input);

 if res.ModalResult <> mrOk then Exit;

 s:= '';
 sum := 0;
 if Length(res.Smets) > 0 then begin
  for i := 0 to Length(res.Smets) - 1 do begin
    id_s := res.Smets[i].NumSmeta;
    id_R       := res.Smets[i].NumRazd;
    id_St      := res.Smets[i].NumStat;
    id_Kekv    := res.Smets[i].NumKekv;
    Summa      := res.Smets[i].NSumma;

    DataSet1.SelectSQL.Text := 'select SMETA_TITLE, SMETA_KOD from PUB_SPR_SMETA_INFO(' + IntToStr(res.Smets[i].NumSmeta) + ')';
    DataSet1.Open;
    Kod_S  := DataSet1['SMETA_KOD'];
    DataSet1.Close;

    DataSet1.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(res.Smets[i].NumRazd) + ')';
    DataSet1.Open;
    Kod_R  := DataSet1['RAZD_ST_NUM'];
    DataSet1.Close;

    DataSet1.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(res.Smets[i].NumStat) + ')';
    DataSet1.Open;
    Kod_St  := DataSet1['RAZD_ST_NUM'];
    DataSet1.Close;

    DataSet1.SelectSQL.Text := 'select KEKV_CODE, KEKV_TITLE from PUB_GET_KEKV_INFO(' + IntToStr(res.Smets[i].NumKekv)
    + ',' + QuotedStr(DateToStr(Date)) + ')';
    DataSet1.Open;
    Kod_Kekv  := DataSet1['KEKV_CODE'];
    DataSet1.Close;

    if s <> '' then s := s + #13;

    sum := sum + summa;
    s := s + InttOstr(kod_s) + '-' + InttOstr(kod_r) + '-' + InttOstr(kod_st) + '-' + InttOstr(kod_kekv) + ':' + CurrToStr(summa);
  end;
 end;


 ShowMessage(s + #13 + CurrToStr(sum));  }
end;

procedure TdogForm.addExecute(Sender: TObject);
begin
  AddButtonClick(Self);
end;

procedure TdogForm.editExecute(Sender: TObject);

 begin
 {
 DatasetCheck:= TpFIBDataSet.Create(Self);
 DatasetCheck.Transaction := WTransaction2;
 DatasetCheck.Transaction.StartTransaction;
 DatasetCheck.SelectSQL.Text := 'select * from dog_dt_document where ID_DOG='+DataSet.FieldByName('ID_DOG').AsString+' with lock';

 try
  DatasetCheck.Open;
 except
  DatasetCheck.Transaction.Rollback;
  DatasetCheck.Close;
  DatasetCheck.Free;
  ShowMessage('Дговір заблокована іншим користувачем. редагування не можліве.');
  exit;
 end;
 }
  EditButtonClick(Self);
 {
  DatasetCheck.Transaction.Commit;
  DatasetCheck.Close;
  DatasetCheck.Free;
  }

end;

procedure TdogForm.viewExecute(Sender: TObject);
begin
  ViewButtonClick(Self);
end;

procedure TdogForm.PrintExecute(Sender: TObject);
begin
  PrintButtonClick(Self);
end;
(*
procedure TdogForm.dxBarButton3Click(Sender: TObject);
var
 Res      : TDogResult;
 input    : TDogInput;
 s  : string;

 id_s,
 id_r,
 id_st,
 id_kekv : integer;
 summa : currency;

 kod_s,
 kod_r,
 kod_st,
 kod_kekv : integer;

 sum : currency;

 i : integer;
begin
 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := WorkDatabase.Handle;
 input.ReadTrans    := ReadTransaction.Handle;
 input.WriteTrans   := WriteTransaction.Handle;
 input.FormStyle    := fsNormal;
 input.id_Group     := 3299;
 input.id_Group_add := 3399;
 input.Summa        := 0;
 input.arndGetPay   := 1;

 input.filter.bUseFilter      := True;
 input.filter.bRegNum := True;
 input.filter.RegNum  := '1089/06-41';

 res := DogLoaderUnit.ShowDogMain(Input);

 if res.ModalResult <> mrOk then Exit;

 s:= '';
 sum := 0;
 if Length(res.Smets) > 0 then begin
  for i := 0 to Length(res.Smets) - 1 do begin
    id_s := res.Smets[i].NumSmeta;
    id_R       := res.Smets[i].NumRazd;
    id_St      := res.Smets[i].NumStat;
    id_Kekv    := res.Smets[i].NumKekv;
    Summa      := res.Smets[i].NSumma;

    DataSet1.SelectSQL.Text := 'select SMETA_TITLE, SMETA_KOD from PUB_SPR_SMETA_INFO(' + IntToStr(res.Smets[i].NumSmeta) + ')';
    DataSet1.Open;
    Kod_S  := DataSet1['SMETA_KOD'];
    DataSet1.Close;

    DataSet1.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(res.Smets[i].NumRazd) + ')';
    DataSet1.Open;
    Kod_R  := DataSet1['RAZD_ST_NUM'];
    DataSet1.Close;

    DataSet1.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE from PUB_SPR_RAZD_ST_INFO(' + IntToStr(res.Smets[i].NumStat) + ')';
    DataSet1.Open;
    Kod_St  := DataSet1['RAZD_ST_NUM'];
    DataSet1.Close;

    DataSet1.SelectSQL.Text := 'select KEKV_CODE, KEKV_TITLE from PUB_GET_KEKV_INFO(' + IntToStr(res.Smets[i].NumKekv)
    + ',' + QuotedStr(DateToStr(Date)) + ')';
    DataSet1.Open;
    Kod_Kekv  := DataSet1['KEKV_CODE'];
    DataSet1.Close;

    if s <> '' then s := s + #13;

    sum := sum + summa;
    s := s + InttOstr(kod_s) + '-' + InttOstr(kod_r) + '-' + InttOstr(kod_st) + '-' + InttOstr(kod_kekv) + ':' + CurrToStr(summa);
  end;
 end;


 ShowMessage(s + #13 + CurrToStr(sum));
end;
*)

procedure TdogForm.cxButton1Click(Sender: TObject);
begin
 agColumnCustomizer1.Customize;
end;

procedure TdogForm.cbUseShortClick(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TdogForm.dxBarLargeButton8Click(Sender: TObject);
var
  frm : TfrmPlatInfo;
  S:String;
begin
  frm := TfrmPlatInfo.Create(Self);
  frm.DataSetInfo.Database := WorkDatabase;
  frm.DataSetInfo.Transaction := ReadTransaction;
  frm.DateBegEdit.date := fltform.fltDateBegEdit.date;
  frm.DateEndEdit.date := fltform.fltDateEndEdit.date;
  frm.DataSetInfo.ParamByName('ID_GROUP').asString := DataSet.ParamByName('ID_GROUP').AsString;
  frm.DataSetInfo.ParamByName('ID_USER').asString := DataSet.ParamByName('ID_USER').AsString;
  frm.DataSetInfo.ParamByName('FLT_ID_TIP_DOG').asString := DataSet.ParamByName('FLT_ID_TIP_DOG').AsString;
  frm.DataSetInfo.ParamByName('ID_OTDEL').asString := DataSet.ParamByName('ID_OTDEL').AsString;
  frm.DataSetInfo.ParamByName('USE_SHORT').asString := DataSet.ParamByName('USE_SHORT').AsString;
  frm.DataSetInfo.ParamByName('WHRE_COND').asString := DataSet.ParamByName('WHRE_COND').AsString;
  frm.DataSetInfo.ParamByName('WHRE_COND_FOR_MAN').asString := DataSet.ParamByName('WHRE_COND_FOR_MAN').AsString;
  frm.DataSetInfo.ParamByName('WHRE_COND_SUM').asString := DataSet.ParamByName('WHRE_COND_SUM').AsString;

  {
  s:=s+frm.DataSetInfo.ParamByName('ID_GROUP').asString+'  ';
  s:=s+frm.DataSetInfo.ParamByName('ID_USER').asString+'  ';
  s:=s+frm.DataSetInfo.ParamByName('FLT_ID_TIP_DOG').asString+'  ';
  s:=s+frm.DataSetInfo.ParamByName('ID_OTDEL').asString+'  ';
  s:=s+frm.DataSetInfo.ParamByName('USE_SHORT').asString+'   ';
  s:=s+frm.DataSetInfo.ParamByName('WHERE_COND').asString+'   ';
  s:=s+ frm.DataSetInfo.ParamByName('WHERE_COND_FOR_MAN').asString;

  ShowMessage(s);
  }
//  ShowMessage(frm.DataSetInfo.ParamByName('WHERE_COND').asString);
  frm.ShowModal;

  frm.Free;
end;

procedure TdogForm.cxGrid1DBTableView1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var
   i : integer;
begin
 Panel4.Visible := false;
 cxGrid1.ShowHint := false;
 cxGrid1.Hint := '';
 for i := 0 to cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Count - 1 do
 if (x > cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Bounds.Left) and
    (y > cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Bounds.Top) and
    (x < cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Bounds.Right) and
    (y < cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Bounds.Bottom) then
    begin
      cxGrid1.ShowHint := true;
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1DOG_CLOSE' then cxGrid1.Hint := 'Ознака того, що даний договір закритий';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1NAME_TIP_DOG' then cxGrid1.Hint := 'Назва типу договору';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1KOD_DOG' then cxGrid1.Hint := 'Код договору(внутрішня інформація)';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1ID_DOG' then cxGrid1.Hint := 'Ідентифікатор договору(внутрішня інформація)';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1N_DOG' then cxGrid1.Hint := 'Номер зареєстрированого договору';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1D_DOG' then cxGrid1.Hint := 'Дата реєстрації договору';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1NOMN_DOG' then cxGrid1.Hint := 'Номенклатурний номер договору';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1NOMD_DOG' then cxGrid1.Hint := 'Номенклатурна дата договору';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1NAME_CUSTOMER' then cxGrid1.Hint := 'Назва контрагента з яким укладений договір';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1DATE_BEG' then cxGrid1.Hint := 'Дата початку дії договору';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1DATE_END' then cxGrid1.Hint := 'Дата закінчення дії договору';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1SUMMA' then cxGrid1.Hint := 'Сумма по договору';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1DOG_CONTINUE' then cxGrid1.Hint := 'Ознака того, що договір пролонгований';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1NOT_SUMMA' then cxGrid1.Hint := 'Ознака того, що договір без суми';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1DOG_NOTE' then cxGrid1.Hint := 'Примичание договору';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1FIO_DONGU' then cxGrid1.Hint := 'ФИО відповідальної особи ' + SYS_NAME_CUSTOMER_NATIVE;
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1FIO_POSTAV' then cxGrid1.Hint := 'ФИО відповідальної особи контрагента';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1NDS_SUM' then cxGrid1.Hint := 'Сума ПДВ за договором';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1NDS_PAY' then cxGrid1.Hint := 'Сума ПДВ оплати за договором';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1SUM_PAY' then cxGrid1.Hint := 'Сума оплати за договором';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1SUM_FULFIL' then cxGrid1.Hint := 'Сума виконання за договором';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1SUM_TODAY' then cxGrid1.Hint := 'Заявлена сума до оплати за договором';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1REGEST_NUM' then cxGrid1.Hint := 'Реєстраційний номер договору';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1COMMENT' then cxGrid1.Hint := 'Коментарий за договором';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1NAME_SHABLON' then cxGrid1.Hint := 'Найменування шаблона договору';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1RATE_ACC' then cxGrid1.Hint := 'Розрахунковий рахунок контрагента з яким укладений договір';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1MFO' then cxGrid1.Hint := 'МФО банку контрагента з яким укладений договір';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1NAME_BANK' then cxGrid1.Hint := 'Назва банку контрагента з яким укладений договір';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1IMAGE' then cxGrid1.Hint := 'Ознака того, що даний договір закритий';
      if cxGrid1DBTableView1.ViewInfo.HeaderViewInfo.Items[i].Column.Name = 'cxGrid1DBTableView1Information' then cxGrid1.Hint := 'Відображає інформацію з договору';
    end; //ShowMessage(IntToStr(i));
end;

procedure TdogForm.cxGrid1DBTableView1InformationCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 ACanvas.FillRect(AViewInfo.Bounds);
 ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 3);
 ADone := true;
end;

procedure TdogForm.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 Panel4.Visible := false;
end;

procedure TdogForm.ApplicationEvents1Hint(Sender: TObject);
begin
// if (Sender is TcxGrid) then if TcxGrid(Sender) = cxGrid1 then Showmessage('gdf');
end;

procedure TdogForm.dxBarLargeButton9Click(Sender: TObject);
var
 i, o : TSpravParams;
begin
  if DataSet.RecordCount = 0 then exit;
  i := DogLoaderUnit.TSpravParams.Create;
  o := DogLoaderUnit.TSpravParams.Create;

  i['DataBase']  := Integer(WorkDatabase.Handle);
  i['ReadTransaction'] := Integer(ReadTransaction.Handle);
  i['WriteTransaction'] := Integer(WriteTransaction.Handle);
  i['FormStyle'] := fsNormal;
  i['ID_DOG']    :=  TFIBBCDField(DataSet.FieldByName('ID_DOG')).AsInt64;

  LoadSprav('workdog\dogspec.bpl', Self, i, o);
  i.Free;
  o.Free;
end;

procedure TdogForm.Button1Click(Sender: TObject);
var
 s : string;
 name_comp, user_name : string;
 time_edit : string;
begin
 if DataSet.RecordCount = 0 then Exit;
 ReadDataSet.Close;
 if VarIsNull(DataSet['ID_DOG']) then
 begin
   Exit;
 end;

 ReadDataSet.SelectSQL.Text := 'select NAME_COMP, TIME_EDIT from dog_dt_document where id_dog = '+VarToStr( DataSet['ID_DOG']);
 ReadDataSet.Open;

 name_comp := IfNull(ReadDataSet['NAME_COMP'], '');
 if VarIsNull(ReadDataSet['TIME_EDIT']) then time_edit := '' else time_edit := DateTimeToStr(ReadDataSet['TIME_EDIT']);
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select full_name from users where id_user = ' + IntToStr(IfNull(DataSet['ID_USER'], -111));
 ReadDataSet.Open;
//  ShowMessage('# 5');
 user_name := IfNull(ReadDataSet['FULL_NAME'], '');
 ReadDataSet.Close;
 s := 'Користувач: ' + user_name + #13 + 'Комп''ютер: ' + name_comp + #13 + 'Додано: ' + time_edit;
 agShowMessage(s);
{ if DataSet.RecordCount = 0 then exit;
 if VarIsNull(DataSet['ID_USER']) then begin
  ShowMessage('Информация о пользователе отсутствует.');
  exit;
 end;
 pFIBQuery1.SQL.Text := 'select FULL_NAME from USERS where id_user = ' + IntToStr(DataSet['ID_USER']);
 pFIBQuery1.ExecQuery;
 if pFIBQuery1.RecordCount <> 0 then begin
  ShowMessage('Договор был добавлен пользователем: ' + pFIBQuery1['FULL_NAME'].AsString);
 end else ShowMessage('Информация о пользователе отсутствует.');
 pFIBQuery1.Close;}
end;

procedure TdogForm.PrintSpecButtonClick(Sender: TObject);
 var
 f: TForm;
 repFile : string;
 flt : TfltDogForm;
begin
 repFile:='dogovor_class.fr3';

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReportDog.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден.');
   exit;
 end;

 flt := TfltDogForm.Create(Self);
 if a_in <> nil then flt.id_Group := a_in['ID_GROUP'].AsInt64 else flt.id_Group := input.id_Group;

 flt.repGroupBox.Visible := true;
 flt.Height := 682;
 flt.repGroupBox.Top := 435;
 flt.pFIBDatabase1 := WorkDatabase;
 //flt.fltClassBox.Visible := true;
 flt.repNumDateDogCheck.Visible:=False;
 flt.repNumDateDogCheck.Checked:=False;
 flt.chSumDogPay.Visible:=False;

 flt.fltDateBegEdit.Date:=date;
 flt.fltDateEndEdit.Date:=date;
 flt.repPercentCheck.Checked := false;
 flt.report_class := 1;

 {flt.fltRegNumEdit.Text := fltForm.fltRegNumEdit.Text;
 flt.fltRegNumCheck.Checked := fltForm.fltRegNumCheck.Checked;
 flt.NumDogEdit.Text := fltForm.NumDogEdit.Text;
 flt.chNumDog.Checked := fltForm.chNumDog.Checked;
 flt.flt_id_Customer := fltForm.flt_id_Customer;
 flt.fltCustEdit.Text := fltForm.fltCustEdit.Text;
 flt.fltCustCheck.Checked := fltForm.fltCustCheck.Checked;
 flt.fltId_tip_dog := fltForm.fltId_tip_dog;
 flt.fltTipDogEdit.Text := fltForm.fltTipDogEdit.Text;
 flt.fltTipDogCheck.Checked := fltForm.fltTipDogCheck.Checked;
 flt.fltDateBegEdit.Text := fltForm.fltDateBegEdit.Text;
 flt.fltDateEndEdit.Text := fltForm.fltDateEndEdit.Text; }
 flt.fltDatePeriodCheck.Checked :=  fltForm.fltDatePeriodCheck.Checked;
 flt.flt_id_department := fltForm.flt_id_department;
 flt.depEdit.Text := fltForm.depEdit.Text;
 flt.depCheck.Checked := fltform.depCheck.Checked;
 {flt.DateActBegEdit.Text :=  fltForm.DateActBegEdit.Text;
 flt.DateActEndEdit.Text :=  fltForm.DateActEndEdit.Text;
 flt.dateactCheck.Checked := fltForm.dateactCheck.Checked;
 flt.nomnEdit.Text := fltForm.nomnEdit.Text;
 flt.NomnCheck.Checked := fltForm.NomnCheck.Checked;
 flt.DateNomnBegEdit.Text := fltForm.DateNomnBegEdit.Text;
 flt.DateNomnEndEdit.Text := fltForm.DateNomnEndEdit.Text;
 flt.DateNomnCheck.Checked := fltForm.DateNomnCheck.Checked;
 flt.flt_id_rate_acc_native := fltForm.flt_id_rate_acc_native;
 flt.RateAccNativeEdit.Text := fltForm.RateAccNativeEdit.Text;
 flt.cbRateAccNative.Checked := fltForm.cbRateAccNative.Checked;
 flt.ShowClosedCheck.Checked := fltForm.ShowClosedCheck.Checked;
 flt.chSumPayFulfil1.Checked := fltform.chSumPayFulfil1.Checked;
 flt.chSumPayFulfil2.Checked := fltform.chSumPayFulfil2.Checked;
 flt.MatEdit.Text := fltForm.MatEdit.Text;
 flt.cbMat.Checked := fltForm.cbMat.Checked;    }

 if flt.ShowModal <> mrOK then
 begin
  id_class:=fltForm.id_class;
  flt.Free;
  exit;
 end;
 RepDataSet.Close;
 f := WaitScreenShow(Self);

 repClassDataset.SelectSQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_CLASS_PREP(:ID_GROUP, :ID_USER, :FLT_ID_TIP_DOG, :WHRE_COND, :WHRE_COND_FOR_MAN, :ID_OTDEL, :USE_SHORT, :ID_MATERIAL, :ID_SESSION_TYPE, ' + QuotedStr(flt.fltDateBegEdit.Text) + ', ' + QuotedStr(flt.fltDateEndEdit.Text) + ', 0, 0, :P_ID_CLASS, :whre_cond_sum)';
 flt.ApplyToDataset(repClassDataset, input.id_Group, input.isZayav, false, cbUseShort.Checked, false);
 repClassDataset.ParamByName('ID_GROUP').AsInteger            := DataSet.ParamByName('ID_GROUP').AsInteger;
 repClassDataset.ParamByName('ID_USER').AsInteger             := DataSet.ParamByName('ID_USER').AsInteger;
 //repClassDataset.ParamByName('FLT_ID_TIP_DOG').AsInteger      := DataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger;
 //repClassDataset.ParamByName('WHERE_COND').AsString           := DataSet.ParamByName('WHERE_COND').AsString;
 //repClassDataset.ParamByName('WHERE_COND_FOR_MAN').AsVariant  := Null;
 repClassDataset.ParamByName('ID_OTDEL').AsVariant            :=Null;
 repClassDataset.ParamByName('USE_SHORT').AsVariant           :=Null;
 repClassDataset.ParamByName('ID_MATERIAL').AsVariant         := Null;
 repClassDataset.ParamByName('ID_SESSION_TYPE').AsVariant     := Null;
 //showmessage(inttostr(DataSet.ParamByName('ID_GROUP').AsInteger));
 //showmessage(inttostr(DataSet.ParamByName('ID_USER').AsInteger));
 //showmessage(inttostr(DataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger));
 //showmessage(DataSet.ParamByName('WHERE_COND').AsString);
 repClassDataset.Active:=true;
 repClassDataset.FetchAll;
 repClassDataset.Close;

 if (flt.fltClassBox.Checked = true) then
 begin
     RepDataSet.SelectSQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_REP_CLASS(:ID_GROUP, :ID_USER, :FLT_ID_TIP_DOG, :WHRE_COND, :WHRE_COND_FOR_MAN, :ID_OTDEL, :USE_SHORT, :ID_MATERIAL, :ID_SESSION_TYPE, ' + QuotedStr(flt.fltDateBegEdit.Text) + ', ' + QuotedStr(flt.fltDateEndEdit.Text) + ', 0, 0, :P_ID_CLASS, :whre_cond_sum)';
     repClassDataset.SelectSQL.Text:='select * from PROC_DOG_DT_DOCUMENT_REP_GR_CL(:ID_GROUP, :ID_USER, :FLT_ID_TIP_DOG, :WHRE_COND, :WHRE_COND_FOR_MAN, :ID_OTDEL, :USE_SHORT, :ID_MATERIAL, :ID_SESSION_TYPE, ' + QuotedStr(flt.fltDateBegEdit.Text) + ', ' + QuotedStr(flt.fltDateEndEdit.Text) + ', 0, 0)';
 end;
 if (flt.fltClassBox.Checked = false) then
 begin
     RepDataSet.SelectSQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_REP_CLASS(:ID_GROUP, :ID_USER, :FLT_ID_TIP_DOG, :WHRE_COND, :WHRE_COND_FOR_MAN, :ID_OTDEL, :USE_SHORT, :ID_MATERIAL, :ID_SESSION_TYPE, ' + QuotedStr(flt.fltDateBegEdit.Text) + ', ' + QuotedStr(flt.fltDateEndEdit.Text) + ', 0, 0, :P_ID_CLASS :whre_cond_sum)';
     repClassDataset.SelectSQL.Text:='select * from PROC_DOG_DT_DOCUMENT_REP_GR_CL(:ID_GROUP, :ID_USER, :FLT_ID_TIP_DOG, :WHRE_COND, :WHRE_COND_FOR_MAN, :ID_OTDEL, :USE_SHORT, :ID_MATERIAL, :ID_SESSION_TYPE, ' + QuotedStr(flt.fltDateBegEdit.Text) + ', ' + QuotedStr(flt.fltDateEndEdit.Text) + ', 0, 0)';
 end;



 flt.ApplyToDataset(RepDataSet, input.id_Group, input.isZayav, false, cbUseShort.Checked, false);

 if flt.repA4.Checked then
 begin

   TfrxReportPage(frxReportDog.Pages[0]).Orientation:=poLandscape;
 end;
 if flt.repA3.Checked then
 begin
   if flt.repBook.Checked then
   begin
     TfrxReportPage(frxReportDog.Pages[0]).PaperWidth := 297;
     TfrxReportPage(frxReportDog.Pages[0]).PaperHeight := 420;
   end
   else
   begin
     TfrxReportPage(frxReportDog.Pages[0]).PaperWidth := 420;
     TfrxReportPage(frxReportDog.Pages[0]).PaperHeight := 297;
   end;
 end;
 //frxReportDog.Page.
 frxReportDog.Variables['ShowFulfilDoc'] := flt.repDocFulfilCheck.Checked;
 frxReportDog.Variables['ShowPayDoc'] := flt.repDocPaycheck.Checked;
 frxReportDog.Variables['ShowSumPay'] := flt.repSumPayCheck.Checked;
 frxReportDog.Variables['ShowSumFulfil'] := flt.repSumFulfilCheck.Checked;
 frxReportDog.Variables['ShowNumdog'] := flt.repNumDogCheck.Checked;
 frxReportDog.Variables['ShowRegNum'] := flt.repRegNumCheck.Checked;
 frxReportDog.Variables['ShowSum'] := flt.repSumCheck.Checked;
 frxReportDog.Variables['ShowRest'] := flt.repRestCheck.Checked;
 frxReportDog.Variables['ShowPerF'] := flt.repPercentCheck.Checked;
 frxReportDog.Variables['ShowNote'] := flt.repNoteCheck.Checked;
 flt.Free;

 RepDataSet.ParamByName('ID_GROUP').AsInteger := DataSet.ParamByName('ID_GROUP').AsInteger;
 RepDataSet.ParamByName('ID_USER').AsInteger := DataSet.ParamByName('ID_USER').AsInteger;
 //RepDataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger := DataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger;
 //RepDataSet.ParamByName('WHERE_COND').AsString := DataSet.ParamByName('WHERE_COND').AsString;
 RepDataSet.Active := true;
 //repClassDataset.SelectSQL.Text:='select * from PROC_DOG_DT_DOCUMENT_REP_GR_CL(null, null, null, null, null, null, null, null, null,null,null, 0, null)';
 //repClassDataset.Active := true;
 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
 begin
  frxReportDog.DesignReport;
  Exit;
 end
 else  frxReportDog.ShowReport();
 RepDataSet.Close;
 repClassDataset.Close;
 WaitScreenClose(f);
end;


//------------------------------------------------------------------------------
procedure TdogForm.dxBarButton6Click(Sender: TObject);

begin
 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\spec.fr3') then RepSpec.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\spec.fr3')
 else
 begin
   ShowMessage('Файл звіту "spec.fr3" не знайден.');
   exit;
 end;

 RepSpecMainDS.Open;
 RepSpecDetailDS.Open;
 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
 begin
   RepSpec.DesignReport;
   Exit;
 end else RepSpec.ShowReport();
end;
//------------------------------------------------------------------------------


procedure TdogForm.dxBarButton5Click(Sender: TObject);
begin
 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\spec.fr3') then RepSpec.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\spec.fr3')
 else
 begin
   ShowMessage('Файл звіту "spec.fr3" не знайден.');
   exit;
 end;

 RepSpecMainDS.Open;
 RepSpecDetailDS.Open;
 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
 begin
   RepSpec.DesignReport;
   Exit;
 end else RepSpec.ShowReport();
end;

procedure TdogForm.dxBarButton7Click(Sender: TObject);
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\ShifrReport.fr3') then ShifrRep.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\ShifrReport.fr3')
 else
 begin
   ShowMessage('Файл звіту "ShifrReport.fr3" не знайден.');
   exit;
 end;

end;


procedure TdogForm.dxBarLargeButton10Click(Sender: TObject);
var
 repFile : string;
 flt : TfltDogForm;
begin
 pFIBQuery1.Close;
 pFIBQuery1.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 11';
 pFIBQuery1.ExecQuery;
 if pFIBQuery1.RecordCount <> 0 then if not VarIsNull(pFIBQuery1['REPORT_FILE'].AsVariant) then repFile := pFIBQuery1['REPORT_FILE'].AsString;
 pFIBQuery1.Close;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReportDog.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден.');
   exit;
 end;

 flt := TfltDogForm.Create(Self);
    flt.report_class := 1;
 if a_in <> nil then flt.id_Group := a_in['ID_GROUP'].AsInt64 else flt.id_Group := input.id_Group;

 flt.repGroupBox.Visible := true;
 flt.Height := 680;
 flt.repGroupBox.Top := 435;
 flt.pFIBDatabase1 := WorkDatabase;

 flt.fltDateBegEdit.Date:=date;
 flt.fltDateEndEdit.Date:=date;

 {flt.fltRegNumEdit.Text := fltForm.fltRegNumEdit.Text;
 flt.fltRegNumCheck.Checked := fltForm.fltRegNumCheck.Checked;
 flt.NumDogEdit.Text := fltForm.NumDogEdit.Text;
 flt.chNumDog.Checked := fltForm.chNumDog.Checked;
 flt.flt_id_Customer := fltForm.flt_id_Customer;
 flt.fltCustEdit.Text := fltForm.fltCustEdit.Text;
 flt.fltCustCheck.Checked := fltForm.fltCustCheck.Checked;
 flt.fltId_tip_dog := fltForm.fltId_tip_dog;
 flt.fltTipDogEdit.Text := fltForm.fltTipDogEdit.Text;
 flt.fltTipDogCheck.Checked := fltForm.fltTipDogCheck.Checked;
 flt.fltDateBegEdit.Text := fltForm.fltDateBegEdit.Text;
 flt.fltDateEndEdit.Text := fltForm.fltDateEndEdit.Text; }
 flt.fltDatePeriodCheck.Checked :=  fltForm.fltDatePeriodCheck.Checked;
 flt.flt_id_department := fltForm.flt_id_department;
 flt.depEdit.Text := fltForm.depEdit.Text;
 flt.depCheck.Checked := fltform.depCheck.Checked;
 flt.repNoteCheck.Checked:=true;
 {flt.DateActBegEdit.Text :=  fltForm.DateActBegEdit.Text;
 flt.DateActEndEdit.Text :=  fltForm.DateActEndEdit.Text;
 flt.dateactCheck.Checked := fltForm.dateactCheck.Checked;
 flt.nomnEdit.Text := fltForm.nomnEdit.Text;
 flt.NomnCheck.Checked := fltForm.NomnCheck.Checked;
 flt.DateNomnBegEdit.Text := fltForm.DateNomnBegEdit.Text;
 flt.DateNomnEndEdit.Text := fltForm.DateNomnEndEdit.Text;
 flt.DateNomnCheck.Checked := fltForm.DateNomnCheck.Checked;
 flt.flt_id_rate_acc_native := fltForm.flt_id_rate_acc_native;
 flt.RateAccNativeEdit.Text := fltForm.RateAccNativeEdit.Text;
 flt.cbRateAccNative.Checked := fltForm.cbRateAccNative.Checked;
 flt.ShowClosedCheck.Checked := fltForm.ShowClosedCheck.Checked;
 flt.chSumPayFulfil1.Checked := fltform.chSumPayFulfil1.Checked;
 flt.chSumPayFulfil2.Checked := fltform.chSumPayFulfil2.Checked;
 flt.MatEdit.Text := fltForm.MatEdit.Text;
 flt.cbMat.Checked := fltForm.cbMat.Checked;     }

 if flt.ShowModal <> mrOK then
 begin
  id_class:=fltForm.id_class;
  flt.Free;
  exit;
 end;
 RepDataSet.Close;
 RepDataSet.SelectSQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_SEL_REPORT(:ID_GROUP, :ID_USER, :FLT_ID_TIP_DOG, :WHRE_COND, :WHRE_COND_FOR_MAN, :ID_OTDEL, :USE_SHORT, :ID_MATERIAL, :ID_SESSION_TYPE, ' + QuotedStr(flt.fltDateBegEdit.Text) + ', ' + QuotedStr(flt.fltDateEndEdit.Text) + ', :P_ID_CLASS, :WHRE_COND_SUM)';
 flt.ApplyToDataset(RepDataSet, input.id_Group, input.isZayav, false, cbUseShort.Checked, false);

 if flt.repA4.Checked then
 begin
   if flt.repBook.Checked then
   begin
    TfrxReportPage(frxReportDog.Pages[0]).Orientation:=poPortrait;
   end
   else
   begin
    TfrxReportPage(frxReportDog.Pages[0]).Orientation:=poLandscape;
   end;
 end;
 if flt.repA3.Checked then
 begin
   if flt.repBook.Checked then
   begin
     TfrxReportPage(frxReportDog.Pages[0]).PaperWidth := 297;
     TfrxReportPage(frxReportDog.Pages[0]).PaperHeight := 420;
   end
   else
   begin
     TfrxReportPage(frxReportDog.Pages[0]).PaperWidth := 420;
     TfrxReportPage(frxReportDog.Pages[0]).PaperHeight := 297;
   end;
 end;
// frxReportDog.Page.
 frxReportDog.Variables['ShowFulfilDoc'] := flt.repDocFulfilCheck.Checked;
 frxReportDog.Variables['ShowPayDoc'] := flt.repDocPaycheck.Checked;
 frxReportDog.Variables['ShowSumPay'] := flt.repSumPayCheck.Checked;
 frxReportDog.Variables['ShowSumFulfil'] := flt.repSumFulfilCheck.Checked;
 frxReportDog.Variables['ShowNumdog'] := flt.repNumDogCheck.Checked;
 frxReportDog.Variables['ShowRegNum'] := flt.repRegNumCheck.Checked;
 frxReportDog.Variables['ShowSum'] := flt.repSumCheck.Checked;
 frxReportDog.Variables['ShowRest'] := flt.repRestCheck.Checked;
 frxReportDog.Variables['ShowPerF'] := flt.repPercentCheck.Checked;
 frxReportDog.Variables['ShowNote'] := flt.repNoteCheck.Checked;
 //frxReportDog.Variables['from_date'] := DateToStr(flt.fltDateBegEdit.Date);
 //frxReportDog.Variables['to_date'] := DateToStr(flt.fltDateEndEdit.Date);
 frxReportDog.Variables['ShowNumDatedog'] := flt.repNumDateDogCheck.Checked;
 flt.Free;

 RepDataSet.ParamByName('ID_GROUP').AsInteger := DataSet.ParamByName('ID_GROUP').AsInteger;
 RepDataSet.ParamByName('ID_USER').AsInteger := DataSet.ParamByName('ID_USER').AsInteger;
 //RepDataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger := DataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger;
 //RepDataSet.ParamByName('WHERE_COND').AsString := DataSet.ParamByName('WHERE_COND').AsString;
 RepDataSet.Active := true;

 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
 begin
 frxReportDog.DesignReport;
   Exit;
 end else frxReportDog.ShowReport();
end;

procedure TdogForm.dxBarButton10Click(Sender: TObject);
var
 repFile : string;
 flt : TfltDogForm;
begin
 pFIBQuery1.Close;
 pFIBQuery1.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 11';
 pFIBQuery1.ExecQuery;
 if pFIBQuery1.RecordCount <> 0 then if not VarIsNull(pFIBQuery1['REPORT_FILE'].AsVariant) then repFile := pFIBQuery1['REPORT_FILE'].AsString;
 pFIBQuery1.Close;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReportDog.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile)
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден.');
   exit;
 end;

 flt := TfltDogForm.Create(Self);
    flt.report_class := 1;
 if a_in <> nil then flt.id_Group := a_in['ID_GROUP'].AsInt64 else flt.id_Group := input.id_Group;

 flt.repGroupBox.Visible := true;
 flt.Height := 680;
 flt.repGroupBox.Top := 435;
 flt.pFIBDatabase1 := WorkDatabase;

 flt.fltDateBegEdit.Date:=date;
 flt.fltDateEndEdit.Date:=date;

 {flt.fltRegNumEdit.Text := fltForm.fltRegNumEdit.Text;
 flt.fltRegNumCheck.Checked := fltForm.fltRegNumCheck.Checked;
 flt.NumDogEdit.Text := fltForm.NumDogEdit.Text;
 flt.chNumDog.Checked := fltForm.chNumDog.Checked;
 flt.flt_id_Customer := fltForm.flt_id_Customer;
 flt.fltCustEdit.Text := fltForm.fltCustEdit.Text;
 flt.fltCustCheck.Checked := fltForm.fltCustCheck.Checked;
 flt.fltId_tip_dog := fltForm.fltId_tip_dog;
 flt.fltTipDogEdit.Text := fltForm.fltTipDogEdit.Text;
 flt.fltTipDogCheck.Checked := fltForm.fltTipDogCheck.Checked;
 flt.fltDateBegEdit.Text := fltForm.fltDateBegEdit.Text;
 flt.fltDateEndEdit.Text := fltForm.fltDateEndEdit.Text; }
 flt.fltDatePeriodCheck.Checked :=  fltForm.fltDatePeriodCheck.Checked;
 flt.flt_id_department := fltForm.flt_id_department;
 flt.depEdit.Text := fltForm.depEdit.Text;
 flt.depCheck.Checked := fltform.depCheck.Checked;
 flt.repNoteCheck.Checked:=true;
 {flt.DateActBegEdit.Text :=  fltForm.DateActBegEdit.Text;
 flt.DateActEndEdit.Text :=  fltForm.DateActEndEdit.Text;
 flt.dateactCheck.Checked := fltForm.dateactCheck.Checked;
 flt.nomnEdit.Text := fltForm.nomnEdit.Text;
 flt.NomnCheck.Checked := fltForm.NomnCheck.Checked;
 flt.DateNomnBegEdit.Text := fltForm.DateNomnBegEdit.Text;
 flt.DateNomnEndEdit.Text := fltForm.DateNomnEndEdit.Text;
 flt.DateNomnCheck.Checked := fltForm.DateNomnCheck.Checked;
 flt.flt_id_rate_acc_native := fltForm.flt_id_rate_acc_native;
 flt.RateAccNativeEdit.Text := fltForm.RateAccNativeEdit.Text;
 flt.cbRateAccNative.Checked := fltForm.cbRateAccNative.Checked;
 flt.ShowClosedCheck.Checked := fltForm.ShowClosedCheck.Checked;
 flt.chSumPayFulfil1.Checked := fltform.chSumPayFulfil1.Checked;
 flt.chSumPayFulfil2.Checked := fltform.chSumPayFulfil2.Checked;
 flt.MatEdit.Text := fltForm.MatEdit.Text;
 flt.cbMat.Checked := fltForm.cbMat.Checked;     }

 if flt.ShowModal <> mrOK then
 begin
  id_class:=fltForm.id_class;
  flt.Free;
  exit;
 end;
 RepDataSet.Close;
 RepDataSet.SelectSQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_SEL_REPORT(:ID_GROUP, :ID_USER, :FLT_ID_TIP_DOG, :WHRE_COND, :WHRE_COND_FOR_MAN, :ID_OTDEL, :USE_SHORT, :ID_MATERIAL, :ID_SESSION_TYPE, ' + QuotedStr(flt.fltDateBegEdit.Text) + ', ' + QuotedStr(flt.fltDateEndEdit.Text) + ', :P_ID_CLASS, :WHRE_COND_SUM)';
 flt.ApplyToDataset(RepDataSet, input.id_Group, input.isZayav, false, cbUseShort.Checked, false);

 if flt.repA4.Checked then
 begin
   if flt.repBook.Checked then
   begin
    TfrxReportPage(frxReportDog.Pages[0]).Orientation:=poPortrait;
   end
   else
   begin
    TfrxReportPage(frxReportDog.Pages[0]).Orientation:=poLandscape;
   end;
 end;
 if flt.repA3.Checked then
 begin
   if flt.repBook.Checked then
   begin
     TfrxReportPage(frxReportDog.Pages[0]).PaperWidth := 297;
     TfrxReportPage(frxReportDog.Pages[0]).PaperHeight := 420;
   end
   else
   begin
     TfrxReportPage(frxReportDog.Pages[0]).PaperWidth := 420;
     TfrxReportPage(frxReportDog.Pages[0]).PaperHeight := 297;
   end;
 end;
// frxReportDog.Page.
 frxReportDog.Variables['ShowFulfilDoc'] := flt.repDocFulfilCheck.Checked;
 frxReportDog.Variables['ShowPayDoc'] := flt.repDocPaycheck.Checked;
 frxReportDog.Variables['ShowSumPay'] := flt.repSumPayCheck.Checked;
 frxReportDog.Variables['ShowSumFulfil'] := flt.repSumFulfilCheck.Checked;
 frxReportDog.Variables['ShowNumdog'] := flt.repNumDogCheck.Checked;
 frxReportDog.Variables['ShowRegNum'] := flt.repRegNumCheck.Checked;
 frxReportDog.Variables['ShowSum'] := flt.repSumCheck.Checked;
 frxReportDog.Variables['ShowRest'] := flt.repRestCheck.Checked;
 frxReportDog.Variables['ShowPerF'] := flt.repPercentCheck.Checked;
 frxReportDog.Variables['ShowNote'] := flt.repNoteCheck.Checked;
 //frxReportDog.Variables['from_date'] := DateToStr(flt.fltDateBegEdit.Date);
 //frxReportDog.Variables['to_date'] := DateToStr(flt.fltDateEndEdit.Date);
 frxReportDog.Variables['ShowNumDatedog'] := flt.repNumDateDogCheck.Checked;
 flt.Free;

 RepDataSet.ParamByName('ID_GROUP').AsInteger := DataSet.ParamByName('ID_GROUP').AsInteger;
 RepDataSet.ParamByName('ID_USER').AsInteger := DataSet.ParamByName('ID_USER').AsInteger;
 //RepDataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger := DataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger;
 //RepDataSet.ParamByName('WHERE_COND').AsString := DataSet.ParamByName('WHERE_COND').AsString;
 RepDataSet.Active := true;

 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
 begin
 frxReportDog.DesignReport;
   Exit;
 end else frxReportDog.ShowReport();

end;

end.




