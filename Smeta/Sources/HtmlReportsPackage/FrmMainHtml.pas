unit FrmMainHtml;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxHyperLinkEdit,Ibase, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  Contnrs, cxGridBandedTableView, cxGridDBBandedTableView, Menus,
  cxExportGrid4Link, cxExport, cxTextEdit, frxClass, frxDBSet, cxContainer,
  cxDBEdit,pFibStoredProc, cxMaskEdit, cxDropDownEdit, cxCalendar,
  frxExportPDF, frxExportImage, frxExportRTF, frxExportXML, frxExportXLS,
  frxExportHTML, frxExportTXT, Placemnt, ComCtrls, cxCalc, cxSpinEdit,
  cxMRUEdit, cxCurrencyEdit;

type
  QueneLevelInfo = class
  public
       FActualDate      :TDateTime;
       FFilterObject    :Int64;
       FFilterObject2   :Int64;
       FFilterObjectEx  :array of Int64;
       FLevel           :Integer;
       FReportTitle     :String;
       FFocusedRowIndex :Integer;
       FDateBeg         :TDateTime;
       FDateEnd         :TDateTime;
  end;

  TfrmHtmlReport = class(TForm)
    Panel2: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetHighContrastWhite: TcxGridTableViewStyleSheet;
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
    TitlePanel: TPanel;
    WorkDatabase: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    GridBandedTableViewStyleSheetHighContrastWhite: TcxGridBandedTableViewStyleSheet;
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
    ExportPopupMenu: TPopupMenu;
    HTML1: TMenuItem;
    Excelajhvfne1: TMenuItem;
    SaveDialog1: TSaveDialog;
    RAZD_STYLE: TcxStyle;
    ST_STYLE: TcxStyle;
    SM_STYLE: TcxStyle;
    DBDataset: TfrxDBDataset;
    PlanRestsDataSet: TpFIBDataSet;
    PlanRestDataset: TfrxDBDataset;
    Panel1: TPanel;
    RestDataSource: TDataSource;
    RED_SUM_STYLE: TcxStyle;
    RAZD_STYLE_RED: TcxStyle;
    ST_STYLE_RED: TcxStyle;
    SM_STYLE_RED: TcxStyle;
    Label4: TLabel;
    Panel4: TPanel;
    BackButton: TcxButton;
    cxButton7: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    PrintButton: TcxButton;
    cxButton11: TcxButton;
    cxStyle24: TcxStyle;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    GridTableViewStyleSheetWindowsClassic: TcxGridTableViewStyleSheet;
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
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet;
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
    cxGridTableViewStyleSheet3: TcxGridTableViewStyleSheet;
    RowDataSet: TfrxUserDataSet;
    ColDataSet: TfrxUserDataSet;
    FormStorage1: TFormStorage;
    PrintPopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    cxDBTextEdit1: TcxDBTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxStyle58: TcxStyle;
    cxButton3: TcxButton;
    UnWorkedPLDocsDataSet: TpFIBDataSet;
    UpWorkSource: TfrxDBDataset;
    Label6: TLabel;
    frxReport1: TfrxReport;
    Label5: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    BuReportsInfoGrid: TcxGrid;
    ViewLevel0: TcxGridDBTableView;
    ViewLevel0DBColumn2: TcxGridDBColumn;
    ViewLevel0DBColumn3: TcxGridDBColumn;
    ViewLevel0DBColumn5: TcxGridDBColumn;
    ViewLevel0DBColumn4: TcxGridDBColumn;
    ViewLevel0DBColumn1: TcxGridDBColumn;
    OBJECT_TYPE_COL: TcxGridDBColumn;
    ViewLevel1: TcxGridDBTableView;
    ViewLevel1DBColumn1: TcxGridDBColumn;
    ViewLevel1DBColumn2: TcxGridDBColumn;
    ViewLevel1DBColumn9: TcxGridDBColumn;
    ViewLevel1DBColumn10: TcxGridDBColumn;
    ViewLevel1DBColumn3: TcxGridDBColumn;
    ViewLevel1DBColumn4: TcxGridDBColumn;
    ViewLevel1DBColumn5: TcxGridDBColumn;
    ViewLevel1DBColumn6: TcxGridDBColumn;
    ViewLevel1DBColumn7: TcxGridDBColumn;
    ViewLevel1DBColumn8: TcxGridDBColumn;
    ViewLevel1DBColumn11: TcxGridDBColumn;
    ViewLevel2: TcxGridDBBandedTableView;
    PLAN_VALUE: TcxGridDBBandedColumn;
    BU_KASSA_FACT: TcxGridDBBandedColumn;
    BU_DEBIT_Z: TcxGridDBBandedColumn;
    BU_KREDIT_Z: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN: TcxGridDBBandedColumn;
    SHOW_TITLE: TcxGridDBBandedColumn;
    ViewLevel2DBBandedColumn1: TcxGridDBBandedColumn;
    PROFIT_FLAG_TITLE: TcxGridDBBandedColumn;
    PLAN_VALUE_FC: TcxGridDBBandedColumn;
    BU_KASSA_FACT_FC: TcxGridDBBandedColumn;
    BU_DEBIT_Z_FC: TcxGridDBBandedColumn;
    BU_KREDIT_Z_FC: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN_FC: TcxGridDBBandedColumn;
    TYPE_OBJ: TcxGridDBBandedColumn;
    DIFF_WITH_PLATS: TcxGridDBBandedColumn;
    ViewLevel3: TcxGridDBBandedTableView;
    ViewLevel3DBBandedColumn4: TcxGridDBBandedColumn;
    ViewLevel3DBBandedColumn1: TcxGridDBBandedColumn;
    ViewLevel3DBBandedColumn2: TcxGridDBBandedColumn;
    ViewLevel3DBBandedColumn5: TcxGridDBBandedColumn;
    ViewLevel3DBBandedColumn3: TcxGridDBBandedColumn;
    ViewLevel4: TcxGridDBBandedTableView;
    ViewLevel4DBBandedColumn1: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn3: TcxGridDBBandedColumn;
    PLAN_VALUE_COLUMN: TcxGridDBBandedColumn;
    BU_KASSA_FACT_COLUMN: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn6: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn7: TcxGridDBBandedColumn;
    BU_KREDIT_Z_COLUMN: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN_COLUMN: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn2: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn10: TcxGridDBBandedColumn;
    PLAN_FC: TcxGridDBBandedColumn;
    KASSA_FC: TcxGridDBBandedColumn;
    DIFF_FC: TcxGridDBBandedColumn;
    ViewLevelMonth: TcxGridDBBandedTableView;
    OBJECT_TYPE: TcxGridDBBandedColumn;
    SHOW_TITLE_: TcxGridDBBandedColumn;
    PLAN_VALUE_: TcxGridDBBandedColumn;
    BU_KASSA_FACT_: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN_: TcxGridDBBandedColumn;
    PROFIT_FLAG_TITLE_EX_: TcxGridDBBandedColumn;
    PLAN_VALUE_FC_: TcxGridDBBandedColumn;
    BU_KASSA_FACT_FC_: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN_FC_: TcxGridDBBandedColumn;
    PLReestrView: TcxGridDBBandedTableView;
    PLReestrViewDBBandedColumn1: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn2: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn4: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn5: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn6: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn3: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn7: TcxGridDBBandedColumn;
    ViewLevel8: TcxGridDBBandedTableView;
    ViewLevel8DBBandedColumn1: TcxGridDBBandedColumn;
    ViewLevel8DBBandedColumn2: TcxGridDBBandedColumn;
    BU_KASSA_FACTColumn: TcxGridDBBandedColumn;
    FACT_FINANCEColumn: TcxGridDBBandedColumn;
    ViewLevel8DBBandedColumn5: TcxGridDBBandedColumn;
    Prgm_SmGroup: TcxGridLevel;
    SmGroup_Sm: TcxGridLevel;
    Sm_RazdSt: TcxGridLevel;
    SmGroup_Detail: TcxGridLevel;
    SmGroup_RazdSt: TcxGridLevel;
    SmMonthLevel: TcxGridLevel;
    PLReestrLevel: TcxGridLevel;
    SmGroupV_Detail: TcxGridLevel;
    edtMonthBeg: TcxMRUEdit;
    edtYearBeg: TcxSpinEdit;
    edtMonthEnd: TcxMRUEdit;
    edtYearEnd: TcxSpinEdit;
    ViewLevel0DBColumn6: TcxGridDBColumn;
    SmGroup_MonthDetail: TcxGridLevel;
    ViewLevel10: TcxGridDBBandedTableView;
    MonthShow_title: TcxGridDBBandedColumn;
    MonthShow_Plan_value: TcxGridDBBandedColumn;
    ViewLevel10DBBandedColumn2: TcxGridDBBandedColumn;
    ViewLevel10DBBandedColumn3: TcxGridDBBandedColumn;
    MonthShow_OBJECT_TYPE: TcxGridDBBandedColumn;
    Assign: TcxGridDBBandedColumn;
    Assign_differ: TcxGridDBBandedColumn;
    ExtendedPopupMenu: TPopupMenu;
    N3: TMenuItem;
    procedure ViewLevel0DBColumn3GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ViewLevel0DBColumn4GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ViewLevel0FocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
    procedure ViewLevel0DblClick(Sender: TObject);
    procedure ViewLevel1FocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
    procedure BackButtonClick(Sender: TObject);
    procedure ViewLevel1DblClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Excelajhvfne1Click(Sender: TObject);
    procedure HTML1Click(Sender: TObject);
    procedure SHOW_TITLEStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure PLAN_VALUEStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure BU_KASSA_FACTStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure BU_FINANCE_FACTStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure BU_DEBIT_ZStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure BU_KREDIT_ZStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure DIFF_FROM_PLANStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel2DblClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ViewLevel1DBColumn3StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel1DBColumn4StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxDateEdit1PropertiesChange(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure ViewLevel1DBColumn5StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel2FocusedItemChanged(Sender: TcxCustomGridTableView;
      APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
    procedure ViewLevel4DBBandedColumn3StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel4DBBandedColumn1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel4DBBandedColumn4StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel4DBBandedColumn5StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel4DBBandedColumn6StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel4DBBandedColumn7StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel4DBBandedColumn8StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel4DBBandedColumn9StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel4DBBandedColumn2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel4DBBandedColumn10StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevelMonthDBBandedColumn4StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevelMonthDBBandedColumn1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevelMonthDBBandedColumn2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevelMonthDBBandedColumn3StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel1DBColumn7GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ViewLevelMonthDblClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ViewLevel1DBColumn8GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ViewLevel3DBBandedColumn1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel3DBBandedColumn2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel3DBBandedColumn3StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel0DBColumn5GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ViewLevel8DBBandedColumn1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel8DBBandedColumn2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel8DBBandedColumn3StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel8DBBandedColumn4StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel8DBBandedColumn5StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel1DBColumn9StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel1DBColumn10StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel0DBColumn2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxButton3Click(Sender: TObject);
    procedure DIFF_WITH_PLATSStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel0DBColumn6GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure MonthShow_titleStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel10DBBandedColumn1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure AssignStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure Assign_differStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    CurActualDate: TDateTime;
    CurUser      : Int64;
    CurColumnSel : Integer;
    Quene        : TObjectStack;
    ChengePeriodDateBeg:TDateTime;
    ChengePeriodDateEnd:TDateTime;
    function    getStartDate:TDateTime;
    function    getEndDate:TdateTime;
    function    getSQLTextByLevel(const Step:QueneLevelInfo):String;
    function    getSQLTextForMonthLevel (const Step:QueneLevelInfo):String;
    function    getSQLTextForGroupMonthLevel (const Step:QueneLevelInfo):String;
    function    getSQLTextForGroupPlanDetail (const Step:QueneLevelInfo):String;
    function    getSQLTextForGroupFactDetail (const Step:QueneLevelInfo):String;
    function    getSQLTextForMonthLevelF(const Step:QueneLevelInfo):String;
    procedure   getViewData(const Step:QueneLevelInfo);
    procedure   doExportToExtFormat(const Step:QueneLevelInfo;FmtType:Byte);
    procedure   doConfigureMonthGrid(const Step:QueneLevelInfo);
    procedure   doConfigureGroupDetailGrid(const Step:QueneLevelInfo);
    procedure   doConfigureGroupMonthDetailGrid(const Step:QueneLevelInfo);
    procedure   doConfigureGroupDetailGridV(const Step:QueneLevelInfo);
    function    DoMonthReport : boolean;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; DB_Handle:TISC_DB_HANDLE; Id_USER:Int64);reintroduce;
  end;

  procedure ShowHtmlReport(AOwner:TComponent; DB_Handle:TISC_DB_HANDLE; Id_USER:Int64);stdcall;
  exports ShowHtmlReport;

implementation

uses FrmQueryDocSearch, GlobalSpr, BaseTypes, cxGridViewData, FrmTypeUchQuery, DocSearchInfo, UChangeWorkPeriod, DateUtils;

{$R *.dfm}
procedure ShowHtmlReport(AOwner:TComponent; DB_Handle:TISC_DB_HANDLE; Id_USER:Int64);
begin
     TfrmHtmlReport.Create(AOwner,DB_Handle,Id_USER);
end;

constructor TfrmHtmlReport.Create(AOwner: TComponent; DB_Handle: TISC_DB_HANDLE; Id_USER: Int64);
var SystemInfoDS:TpfibdataSet;
    FirstStep:QueneLevelInfo;
begin
    inherited Create(AOwner);
    CurColumnSel:=1;
    Quene       :=TObjectStack.Create;
    CurUser     :=id_user;

    edtMonthBeg.AddItem('грудень');
    edtMonthBeg.AddItem('листопад');
    edtMonthBeg.AddItem('жовтень');
    edtMonthBeg.AddItem('вересень');
    edtMonthBeg.AddItem('серпень');
    edtMonthBeg.AddItem('липень');
    edtMonthBeg.AddItem('червень');
    edtMonthBeg.AddItem('травень');
    edtMonthBeg.AddItem('квітень');
    edtMonthBeg.AddItem('березень');
    edtMonthBeg.AddItem('лютий');
    edtMonthBeg.AddItem('січень');

    edtMonthEnd.AddItem('грудень');
    edtMonthEnd.AddItem('листопад');
    edtMonthEnd.AddItem('жовтень');
    edtMonthEnd.AddItem('вересень');
    edtMonthEnd.AddItem('серпень');
    edtMonthEnd.AddItem('липень');
    edtMonthEnd.AddItem('червень');
    edtMonthEnd.AddItem('травень');
    edtMonthEnd.AddItem('квітень');
    edtMonthEnd.AddItem('березень');
    edtMonthEnd.AddItem('лютий');
    edtMonthEnd.AddItem('січень');

    edtMonthBeg.Properties.LookupItems.IndexOf(trim(edtMonthBeg.Properties.LookupItems[MonthOf(StartOftheYear( Date )) - 1]));
    edtMonthEnd.Properties.LookupItems.IndexOf(trim(edtMonthEnd.Properties.LookupItems[MonthOf(EndOftheYear( Date )) - 1]));
    edtMonthBeg.Text:=edtMonthBeg.Properties.LookupItems[MonthOf(StartOftheYear( Date )) - 1];
    edtMonthEnd.Text:=edtMonthEnd.Properties.LookupItems[MonthOf(EndOftheYear( Date )) - 1];

    edtYearBeg.Value:=YearOf(Date);
    edtYearBeg.Properties.MinValue := 2000;
    edtYearBeg.Properties.MaxValue := 2050;


    edtYearEnd.Value:=YearOf(Date);
    edtYearEnd.Properties.MinValue := 2000;
    edtYearEnd.Properties.MaxValue := 2050;

    WorkDatabase.Handle:=DB_Handle;
    ReadTransaction.StartTransaction;

    SystemInfoDS:=TpfibdataSet.Create(self);
    SystemInfoDS.Database:=WorkDatabase;
    SystemInfoDS.Transaction:=ReadTransaction;
    SystemInfoDS.SelectSQL.Text:='Select * from PUB_SYS_DATA';
    SystemInfoDS.Open;
    CurActualDate:=Date;
    SystemInfoDS.Close;
    SystemInfoDS.Free;

    FirstStep:=QueneLevelInfo.Create;
    FirstStep.FActualDate     :=CurActualDate;
    FirstStep.FLevel          :=0;
    FirstStep.FFilterObject   :=0;
    FirstStep.FReportTitle    :='ГРУПИ БЮДЖЕТІВ';
    FirstStep.FFocusedRowIndex:=0;
    Quene.Push(TObject(FirstStep));

    if QueneLevelInfo(Quene.Peek)<>nil
    then getViewData(QueneLevelInfo(Quene.Peek));

    SendMessage(self.Handle,WM_SIZE,SIZE_MAXIMIZED,0);
end;

function TfrmHtmlReport.getSQLTextByLevel(const Step:QueneLevelInfo): String;
var  Res:String;
     T:TTypeUchQuery;
     TypeUch:Integer;
begin
     Step.FActualDate:=CurActualDate;
     Step.FDateBeg   :=getStartDate;
     Step.FDateEnd   :=getEndDate;
     PrintButton.Kind:=cxbkStandard;

     edtMonthBeg.Visible:=false;
     edtYearBeg.Visible:=false;
     edtMonthEnd.Visible:=false;
     edtYearEnd.Visible:=false;


     if (Step.FLevel=0)
     then begin
                CurColumnSel:=1;
                Res:=' Select * from BU_GET_GROUP_PLUS_PKV_2012('+''''+DateTimeToStr(Step.FDateBeg)+''''+','
                                                                 +''''+DateTimeToStr(Step.FDateEnd)+''''+','
                                                                 +IntToStr(Self.CurUser)+')';
                Panel1.Visible:=false;
                Label4.Font.Size:=8;
                Label4.visible:=true;
                Label6.visible:=true;
                Label4.Caption:='Сформувати показники за період з';
                edtMonthBeg.Visible:=true;
                edtYearBeg.Visible:=true;
                edtMonthEnd.Visible:=true;
                edtYearEnd.Visible:=true;
     end;

     if (Step.FLevel=1)
     then begin


               CurColumnSel:=1;
               Res:=' Select * from BU_GET_BUGTS_REST_BY_GROUP_2012('+IntToStr(Step.FFilterObject)+','+
                                                                     ''''+DateTimeToStr(Step.FDateBeg)+''''+','+
                                                                     ''''+DateTimeToStr(Step.FDateEnd)+''''+','+
                                                                     IntToStr(Self.CurUser)+') ORDER BY BU_KOD ASC';
               Panel1.Visible:=false;
               Label4.Font.Size:=2;
               Label4.visible:=true;
               Label6.Visible:=false;
               Label4.Caption:='Cформовано за період '+DateToStr(Step.FDateBeg)+' по '+DateToStr(Step.FDateEnd);
     end;

     if (Step.FLevel=2)
     then begin
               CurColumnSel:=1;

               T:=TTypeUchQuery.Create(self, getStartDate, getEndDate);
               T.ShowModal;
               TypeUch:=T.RadioGroup.ItemIndex;
               Step.FDateBeg:=T.getStartDate;
               Step.FDateEnd:=T.getEndDate;

               if TypeUch=0
               then begin
                         BU_KASSA_FACT.Caption:='Управлінський';
                         DIFF_WITH_PLATS.Visible:=true;
                         ViewLevel2.Bands[3].Visible:=true;
               end
               else begin
                         BU_KASSA_FACT.Caption:='Фінансовий';
                         ViewLevel2.Bands[3].Visible:=false;
                         DIFF_WITH_PLATS.Visible:=false;
               end;

               T.Free;

               Res:=' Select * from BU_GET_BUDGET_REST_BY_PLAN_2012('+IntToStr(Step.FFilterObject)+','+
                                                                    ''''+DateTimeToStr(Step.FDateBeg)+''''+','+
                                                                    ''''+DateTimeToStr(Step.FDateEnd)+''''+','+
                                                                    IntToStr(TypeUch)+') ORDER BY PROFIT_FLAG DESC, SHOW_POSITION, SHOW_NUM';
               if PlanRestsDataSet.Active then PlanRestsDataSet.Close;

               PlanRestsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_RESTS_BY_PLAN_2012('+IntToStr(Step.FFilterObject)+','+
                                                                    ''''+DateTimeToStr(Step.FDateBeg)+''''+','+
                                                                    ''''+DateTimeToStr(Step.FDateEnd)+''''+')';
               PlanRestsDataSet.Open;
               Panel1.Visible:=true;

               if (PlanRestsDataSet.FieldByName('REST_K').Value<0)
               then cxDBTextEdit1.Style.Font.Color:=clRed
               else cxDBTextEdit1.Style.Font.Color:=clBlack;

               if (PlanRestsDataSet.FieldByName('REST_F').Value<0)
               then cxDBTextEdit3.Style.Font.Color:=clRed
               else cxDBTextEdit3.Style.Font.Color:=clBlack;

               if (PlanRestsDataSet.FieldByName('REST_Z').Value<0)
               then cxDBTextEdit2.Style.Font.Color:=clRed
               else cxDBTextEdit2.Style.Font.Color:=clBlack;

               Label4.Font.Size:=2;
               Label4.visible:=true;
               Label6.visible:=false;
               Label4.Caption:='Cформовано за період '+DateToStr(Step.FDateBeg)+' по '+DateToStr(Step.FDateEnd);

               PrintButton.Kind:=cxbkDropDownButton;
               PrintButton.DropDownMenu:=PrintPopupMenu;
     end;

     if (Step.FLevel=3)
     then begin
               CurColumnSel:=1;
               Res:=getSQLTextForGroupPlanDetail(Step);
               Panel1.Visible:=false;
               Label4.Font.Size:=2;
               Label4.visible:=true;
               Label6.visible:=false;
               Label4.Caption:='Cформовано за період '+DateToStr(Step.FDateBeg)+' по '+DateToStr(Step.FDateEnd);
     end;

     if (Step.FLevel=4)
     then begin
               T:=TTypeUchQuery.Create(self, getStartDate, getEndDate);
               T.RadioGroup.Visible:=false;
               T.ShowModal;
               Step.FDateBeg:=T.getStartDate;
               Step.FDateEnd:=T.getEndDate;

               CurColumnSel:=1;
               Res:=' Select * from BU_GET_BU_REST_BY_GROUP_RS_2012('+IntToStr(Step.FFilterObject)+','+
                                                                    ''''+DateTimeToStr(Step.FDateBeg)+''''+','+
                                                                    ''''+DateTimeToStr(Step.FDateEnd)+''''+') where show_id>-99';
               Panel1.Visible:=false;
               Label4.Font.Size:=2;
               Label4.visible:=true;
               Label6.visible:=false;
               Label4.Caption:='Cформовано за період '+DateToStr(getStartDate)+' по '+DateToStr(getEndDate);
     end;

     if (Step.FLevel=5)
     then begin
               if PlanRestsDataSet.Active then PlanRestsDataSet.Close;
               PlanRestsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_RESTS_BY_PLAN_2012('+IntToStr(Step.FFilterObject)+','+
                                                                    ''''+DateTimeToStr(Step.FDateBeg)+''''+','+
                                                                    ''''+DateTimeToStr(Step.FDateEnd)+''''+')';
               PlanRestsDataSet.Open;

               if (PlanRestsDataSet.FieldByName('REST_K').Value<0)
               then cxDBTextEdit1.Style.Font.Color:=clRed
               else cxDBTextEdit1.Style.Font.Color:=clBlack;

               if (PlanRestsDataSet.FieldByName('REST_F').Value<0)
               then cxDBTextEdit3.Style.Font.Color:=clRed
               else cxDBTextEdit3.Style.Font.Color:=clBlack;

               if (PlanRestsDataSet.FieldByName('REST_Z').Value<0)
               then cxDBTextEdit2.Style.Font.Color:=clRed
               else cxDBTextEdit2.Style.Font.Color:=clBlack;

               if PlanRestsDataSet.FieldByName('REST_K').Value<0
               then cxDBTextEdit1.Style.Font.Color:=clRed
               else cxDBTextEdit1.Style.Font.Color:=clBlack;

               if PlanRestsDataSet.FieldByName('REST_Z').Value<0
               then cxDBTextEdit2.Style.Font.Color:=clRed
               else cxDBTextEdit2.Style.Font.Color:=clBlack;

               CurColumnSel:=1;
               Res:=getSQLTextForMonthLevel(Step);
               Panel1.Visible:=true;
               TabSheet1.TabVisible:=true;
               Label4.Font.Size:=2;
               Label4.visible:=true;
               Label6.visible:=false;
               Label4.Caption:='Cформовано за період '+DateToStr(getStartDate)+' по '+DateToStr(getEndDate);
     end;

     if (Step.FLevel=6)
     then begin
               CurColumnSel:=1;
               Res:=' Select * from BU_GET_NOT_WORKED_PL_DOC_2012('+IntToStr(Step.FFilterObject)+','+''''+DateTimeToStr(Step.FDateBeg)+''''+','+''''+DateTimeToStr(Step.FDateEND)+''''+')';
               Panel1.Visible:=false;
               Label4.Font.Size:=2;
               Label4.visible:=true;
               Label6.visible:=false;
               Label4.Caption:='Cформовано за період '+DateToStr(getStartDate)+' по '+DateToStr(getEndDate);
     end;

     if (Step.FLevel=7)
     then begin
               CurColumnSel:=1;
               Res:=getSQLTextForMonthLevelF(Step);
               Panel1.Visible:=true;
               TabSheet1.TabVisible:=false;
               Label4.Font.Size:=2;
               Label4.visible:=true;
               Label6.visible:=false;
               Label4.Caption:='Cформовано за період '+DateToStr(getStartDate)+' по '+DateToStr(getEndDate);
     end;

     if (Step.FLevel=8)
     then begin
               CurColumnSel:=1;
               Res:=getSQLTextForGroupFactDetail(Step);
               Panel1.Visible:=false;
               Label4.Font.Size:=2;
               Label4.visible:=true;
               Label6.visible:=false;
               Label4.Caption:='Cформовано за період '+DateToStr(Step.FDateBeg)+' по '+DateToStr(Step.FDateEnd);
     end;

     if (Step.FLevel=9)
     then begin
               T:=TTypeUchQuery.Create(self, getStartDate, getEndDate);
               T.RadioGroup.Visible:=false;
               T.ShowModal;
               Step.FDateBeg:=T.getStartDate;
               Step.FDateEnd:=T.getEndDate;

               CurColumnSel:=1;
               Res:=' Select * from BU_GET_BU_REST_BY_PKV_TF_2012('+IntToStr(Step.FFilterObject)+','+
                                                                    IntToStr(Step.FFilterObject2)+','+
                                                                    ''''+DateTimeToStr(Step.FDateBeg)+''''+','+
                                                                    ''''+DateTimeToStr(Step.FDateEnd)+''''+') where show_id>-99';
               Panel1.Visible:=false;
               Label4.Font.Size:=2;
               Label4.visible:=true;
               Label6.visible:=false;
               Label4.Caption:='Cформовано за період '+DateToStr(getStartDate)+' по '+DateToStr(getEndDate);
     end;

     if (Step.FLevel=10)
     then begin
               Step.FDateBeg:=getStartDate;
               Step.FDateEnd:=getEndDate;

               CurColumnSel:=1;
               Res:=getSQLTextForGroupMonthLevel(Step);
               Panel1.Visible:=false;
               Label4.Font.Size:=2;
               Label4.visible:=true;
               Label6.visible:=false;
               Label4.Caption:='Cформовано за період '+DateToStr(getStartDate)+' по '+DateToStr(getEndDate);
     end;

     TitlePanel.Caption:=Step.FReportTitle;

     Result:=Res;
end;

procedure TfrmHtmlReport.ViewLevel0DBColumn3GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     if (ARecord.Values[OBJECT_TYPE_COL.Index]=3)
     or (ARecord.Values[OBJECT_TYPE_COL.Index]=2)
     then AText:='[...]'
     else AText:='';
end;

procedure TfrmHtmlReport.ViewLevel0DBColumn4GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     if (ARecord.Values[OBJECT_TYPE_COL.Index]=3)
     then AText:='[...]'
     else AText:='';
end;

procedure TfrmHtmlReport.getViewData(const Step:QueneLevelInfo);
 var I:Integer;
     LocalLevel:Integer;
begin
     BuReportsInfoGrid.PopupMenu:=nil;
     if (Step.FLevel=2) then BuReportsInfoGrid.PopupMenu:=ExtendedPopupMenu;

     if (Step.FLevel<>7)
     then begin
               LocalLevel:=Step.FLevel;
               if DataSet.Active then DataSet.Close;
               BU_KASSA_FACT_.DataBinding.FieldName   :='BU_KASSA_FACT';
               BU_KASSA_FACT_FC_.DataBinding.FieldName:='BU_KASSA_FACT_FC';
               DIFF_FROM_PLAN_.DataBinding.FieldName  :='DIFF_FROM_PLAN';
     end
     else begin
               LocalLevel:=5;
               if DataSet.Active then DataSet.Close;
               BU_KASSA_FACT_.DataBinding.FieldName   :='BU_FINANCE_FACT';
               BU_KASSA_FACT_FC_.DataBinding.FieldName:='BU_FINANCE_FACT_FC';
               DIFF_FROM_PLAN_.DataBinding.FieldName  :='DIFF_FROM_PLAN_F';
     end;

     if (Step.FLevel=8) then LocalLevel:=7;

     Screen.Cursor:=crSQLWait;

     if (Quene.Count>1)
     then BackButton.Enabled:=true
     else BackButton.Enabled:=false;


     BuReportsInfoGrid.BeginUpdate;
     if DataSet.Active then DataSet.Close;
     DataSet.SelectSQL.Text:=getSQLTextByLevel(Step);
     DataSet.Open;


     for i:=0 to BuReportsInfoGrid.Levels.Count-1 do BuReportsInfoGrid.Levels[i].Visible:=false;

     if (LocalLevel<9)
     then begin
               BuReportsInfoGrid.Levels[LocalLevel].Visible:=true
     end
     else begin
               if (LocalLevel=9)
               then BuReportsInfoGrid.Levels[4].Visible:=true;

               if (LocalLevel=10)
               then BuReportsInfoGrid.Levels[8].Visible:=true;
     end;

     if (Step.FLevel in [2,3,4,5,9,10])
     then begin
               if (Step.FLevel in [2,3,4,5])
               then TcxGridDBTableView(BuReportsInfoGrid.Levels[LocalLevel].GridView).ViewData.Expand(false)
               else begin
                         if (LocalLevel=9)
                         then TcxGridDBTableView(BuReportsInfoGrid.Levels[4].GridView).ViewData.Expand(false);

                         if (LocalLevel=10)
                         then TcxGridDBTableView(BuReportsInfoGrid.Levels[8].GridView).ViewData.Expand(false);
               end;
     end
     else TcxGridDBTableView(BuReportsInfoGrid.Levels[LocalLevel].GridView).ViewData.Expand(true);

     if LocalLevel<9
     then TcxGridDBTableView(BuReportsInfoGrid.Levels[LocalLevel].GridView).DataController.FocusedRowIndex:=Step.FFocusedRowIndex
     else begin
               if (LocalLevel=9)
               then TcxGridDBTableView(BuReportsInfoGrid.Levels[4].GridView).DataController.FocusedRowIndex:=Step.FFocusedRowIndex;

               if (LocalLevel=10)
               then TcxGridDBTableView(BuReportsInfoGrid.Levels[8].GridView).DataController.FocusedRowIndex:=Step.FFocusedRowIndex;
     end;

     if LocalLevel<9
     then TcxGridDBTableView(BuReportsInfoGrid.Levels[LocalLevel].GridView).Focused:=true
     else begin
               if (LocalLevel=9)
               then TcxGridDBTableView(BuReportsInfoGrid.Levels[4].GridView).Focused:=true;

               if (LocalLevel=10)
               then TcxGridDBTableView(BuReportsInfoGrid.Levels[8].GridView).Focused:=true;
     end;

     if BuReportsInfoGrid.Showing then BuReportsInfoGrid.SetFocus;

     if LocalLevel<9
     then TcxGridDBTableView(BuReportsInfoGrid.Levels[LocalLevel].GridView).Controller.FocusedColumnIndex:=CurColumnSel
     else begin
               if (LocalLevel=9)
               then TcxGridDBTableView(BuReportsInfoGrid.Levels[4].GridView).Controller.FocusedColumnIndex:=CurColumnSel;

               if (LocalLevel=10)
               then TcxGridDBTableView(BuReportsInfoGrid.Levels[8].GridView).Controller.FocusedColumnIndex:=CurColumnSel;
     end;

     BuReportsInfoGrid.EndUpdate;
     Screen.Cursor:=crDefault;
end;

procedure TfrmHtmlReport.ViewLevel0FocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin
     CurColumnSel:=AFocusedItem.Index;
end;

procedure TfrmHtmlReport.ViewLevel0DblClick(Sender: TObject);
var NextStep:QueneLevelInfo;
begin
               NextStep:=QueneLevelInfo.Create;
               NextStep.FActualDate  :=CurActualDate;
               if (CurColumnSel=0)
               then begin
                         if DataSet.FieldByName('OBJECT_TYPE').Value=3
                         then begin
                                   NextStep.FLevel       :=1;
                                   if (DataSet.RecordCount>0)
                                   then NextStep.FFilterObject:=DataSet.FieldByName('ID_GROUP').Value
                                   else NextStep.FFilterObject:=-1;
                                   NextStep.FReportTitle:=LowerCase(DataSet.FieldByName('GROUP_TITLE_EX').AsString);
                                   NextStep.FFocusedRowIndex:=0;

                                   {Сохранение информации об активной ячейке}
                                   QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;

                                   Quene.Push(TObject(NextStep));

                                   if QueneLevelInfo(Quene.Peek)<>nil
                                   then getViewData(QueneLevelInfo(Quene.Peek));
                         end;

                         Exit;
               end;
               if (CurColumnSel=1)
               then begin
                         if DataSet.FieldByName('OBJECT_TYPE').Value=3
                         then begin
                                   NextStep.FLevel       :=4;
                                   if (DataSet.RecordCount>0)
                                   then NextStep.FFilterObject:=DataSet.FieldByName('ID_GROUP').Value
                                   else NextStep.FFilterObject:=-1;
                                   NextStep.FReportTitle:=LowerCase(DataSet.FieldByName('GROUP_TITLE_EX').AsString);
                                   NextStep.FFocusedRowIndex:=0;


                                   {Сохранение информации об активной ячейке}
                                   QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;

                                   Quene.Push(TObject(NextStep));

                                   if QueneLevelInfo(Quene.Peek)<>nil
                                   then getViewData(QueneLevelInfo(Quene.Peek));
                                   Exit;
                         end;

                         if DataSet.FieldByName('OBJECT_TYPE').Value=2
                         then begin
                                   NextStep.FLevel       :=9;
                                   if (DataSet.RecordCount>0)
                                   then begin
                                             NextStep.FFilterObject:=DataSet.FieldByName('ID_PKV').Value;
                                             NextStep.FFilterObject2:=DataSet.FieldByName('ID_TF').Value;

                                   end
                                   else begin
                                             NextStep.FFilterObject:=-1;
                                             NextStep.FFilterObject2:=-1;
                                   end;
                                   NextStep.FReportTitle:=LowerCase(DataSet.FieldByName('PKV_CODE').AsString+'('+DataSet.FieldByName('TYPE_FINANCE_TEXT').AsString)+')';
                                   NextStep.FFocusedRowIndex:=0;


                                   {Сохранение информации об активной ячейке}
                                   QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;

                                   Quene.Push(TObject(NextStep));

                                   if QueneLevelInfo(Quene.Peek)<>nil
                                   then getViewData(QueneLevelInfo(Quene.Peek));
                                   Exit;
                         end;

               end;

               if (CurColumnSel=2)
               then begin
                         if DataSet.FieldByName('OBJECT_TYPE').Value=3
                         then begin
                                   NextStep.FLevel       :=8;
                                   if (DataSet.RecordCount>0)
                                   then NextStep.FFilterObject:=DataSet.FieldByName('ID_GROUP').Value
                                   else NextStep.FFilterObject:=-1;

                                   NextStep.FReportTitle:=LowerCase(DataSet.FieldByName('GROUP_TITLE_EX').AsString) +' (виконання бюджетів)';
                                   NextStep.FFocusedRowIndex:=0;

                                   QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;

                                   Quene.Push(TObject(NextStep));

                                   if QueneLevelInfo(Quene.Peek)<>nil
                                   then begin
                                             doConfigureGroupDetailGridV(QueneLevelInfo(Quene.Peek));
                                             getViewData(QueneLevelInfo(Quene.Peek));
                                   end;
                         end;

                         Exit;
               end;

               if (CurColumnSel=3)
               then begin
                         if DataSet.FieldByName('OBJECT_TYPE').Value=3
                         then begin
                                   NextStep.FLevel       :=3;
                                   if (DataSet.RecordCount>0)
                                   then NextStep.FFilterObject:=DataSet.FieldByName('ID_GROUP').Value
                                   else NextStep.FFilterObject:=-1;
                                   NextStep.FDateBeg:=getStartDate;
                                   NextStep.FDateEnd:=getEndDate;
                                   NextStep.FReportTitle:=LowerCase(DataSet.FieldByName('GROUP_TITLE_EX').AsString) +' (планові показники)';
                                   NextStep.FFocusedRowIndex:=0;

                                   {Сохранение информации об активной ячейке}
                                   QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;

                                   Quene.Push(TObject(NextStep));

                                   if QueneLevelInfo(Quene.Peek)<>nil
                                   then begin
                                             doConfigureGroupDetailGrid(QueneLevelInfo(Quene.Peek));
                                             getViewData(QueneLevelInfo(Quene.Peek));
                                   end;
                         end;
                         
                         Exit;
               end;

               if (CurColumnSel=4)
               then begin
                         if DataSet.FieldByName('OBJECT_TYPE').Value=3
                         then begin
                                   NextStep.FLevel       :=10;
                                   if (DataSet.RecordCount>0)
                                   then NextStep.FFilterObject:=DataSet.FieldByName('ID_GROUP').Value
                                   else NextStep.FFilterObject:=-1;
                                   NextStep.FDateBeg:=getStartDate;
                                   NextStep.FDateEnd:=getEndDate;
                                   NextStep.FReportTitle:=LowerCase(DataSet.FieldByName('GROUP_TITLE_EX').AsString) +' (планові показники помісячно)';
                                   NextStep.FFocusedRowIndex:=0;

                                   {Сохранение информации об активной ячейке}
                                   QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;

                                   Quene.Push(TObject(NextStep));

                                   if QueneLevelInfo(Quene.Peek)<>nil
                                   then begin
                                             doConfigureGroupMonthDetailGrid(QueneLevelInfo(Quene.Peek));
                                             getViewData(QueneLevelInfo(Quene.Peek));
                                   end;
                         end;
                         
                         Exit;
               end;
end;

procedure TfrmHtmlReport.ViewLevel1FocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin
     CurColumnSel:=AFocusedItem.Index;
end;

procedure TfrmHtmlReport.BackButtonClick(Sender: TObject);
begin
     Quene.Pop;
     if QueneLevelInfo(Quene.Peek)<>nil
     then getViewData(QueneLevelInfo(Quene.Peek));
end;

procedure TfrmHtmlReport.ViewLevel1DblClick(Sender: TObject);
var NextStep:QueneLevelInfo;
begin
      if  not(CurColumnSel in [9,7,8]) //окрывается бюджет в разрезе разделов/статей
      then begin
                if (DataSet.RecordCount>0)
                then begin
                         NextStep:=QueneLevelInfo.Create;
                         NextStep.FActualDate  :=CurActualDate;
                         NextStep.FLevel       :=2;
                         {Сохранение информации об активной ячейке}
                         QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;

                         if (DataSet.RecordCount>0)
                         then NextStep.FFilterObject:=StrToInt64(DataSet.FieldByName('ID_PLAN').asString)
                         else NextStep.FFilterObject:=-1;

                         NextStep.FReportTitle:='Бюджет: '+DataSet.FieldByName('BU_KOD').asString+' '+DataSet.FieldByName('BU_TITLE').asString+'('+DataSet.FieldByName('DATE_BEG').asString+'-'+DataSet.FieldByName('DATE_END').asString+')';
                         ChengePeriodDateBeg:=DataSet.FieldByName('DATE_BEG').Value;
                         ChengePeriodDateEnd:=DataSet.FieldByName('DATE_END').Value;

                         Quene.Push(TObject(NextStep));
                         if QueneLevelInfo(Quene.Peek)<>nil
                         then getViewData(QueneLevelInfo(Quene.Peek));
               end
      end
      else begin
                if (CurColumnSel=8)
                then begin
                          if (DataSet.RecordCount>0)
                          then begin
                                     QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;
                                     NextStep:=QueneLevelInfo.Create;
                                     NextStep.FActualDate  :=CurActualDate;
                                     NextStep.FLevel       :=5;
                                     NextStep.FFilterObject:=StrToInt64(DataSet.FieldByName('ID_PLAN').asString);
                                     NextStep.FReportTitle:='Бюджет: '+DataSet.FieldByName('BU_KOD').asString+' '+DataSet.FieldByName('BU_TITLE').asString+'('+DataSet.FieldByName('DATE_BEG').asString+'-'+DataSet.FieldByName('DATE_END').asString+') касовий щомісячно';
                                     ChengePeriodDateBeg:=DataSet.FieldByName('DATE_BEG').Value;
                                     ChengePeriodDateEnd:=DataSet.FieldByName('DATE_END').Value;

                                     Quene.Push(TObject(NextStep));
                                     if QueneLevelInfo(Quene.Peek)<>nil
                                     then begin
                                               doConfigureMonthGrid(QueneLevelInfo(Quene.Peek));
                                               getViewData(QueneLevelInfo(Quene.Peek));
                                     end;
                           end;
                end;
                if (CurColumnSel=9)
                then begin
                           if (DataSet.RecordCount>0)
                           then begin
                                     QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;
                                     NextStep:=QueneLevelInfo.Create;
                                     NextStep.FActualDate  :=CurActualDate;
                                     NextStep.FLevel       :=7;
                                     NextStep.FFilterObject:=StrToInt64(DataSet.FieldByName('ID_PLAN').asString);
                                     NextStep.FReportTitle:='Бюджет: '+DataSet.FieldByName('BU_KOD').asString+' '+DataSet.FieldByName('BU_TITLE').asString+'('+DataSet.FieldByName('DATE_BEG').asString+'-'+DataSet.FieldByName('DATE_END').asString+') фінансвоий щомісячно';
                                     Quene.Push(TObject(NextStep));
                                     if QueneLevelInfo(Quene.Peek)<>nil
                                     then begin
                                             doConfigureMonthGrid(QueneLevelInfo(Quene.Peek));
                                             getViewData(QueneLevelInfo(Quene.Peek));
                                     end;
                           end;
                end;
                if (CurColumnSel=7)
                then begin
                           if (DataSet.RecordCount>0)
                           then begin
                                     QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;
                                     NextStep:=QueneLevelInfo.Create;
                                     NextStep.FActualDate  :=CurActualDate;
                                     NextStep.FLevel       :=6;
                                     NextStep.FFilterObject:=StrToInt64(DataSet.FieldByName('ID_PLAN').asString);
                                     NextStep.FReportTitle:='Необроблені платіжні доручення: '+DataSet.FieldByName('BU_KOD').asString+' '+DataSet.FieldByName('BU_TITLE').asString+'(за останні 30 діб)';
                                     Quene.Push(TObject(NextStep));
                                     if QueneLevelInfo(Quene.Peek)<>nil
                                     then begin
                                               doConfigureMonthGrid(QueneLevelInfo(Quene.Peek));
                                               getViewData(QueneLevelInfo(Quene.Peek));
                                     end;
                           end;
                end;
      end;
end;

procedure TfrmHtmlReport.cxButton1Click(Sender: TObject);
begin
      if (Application.Title<>'Управління бюджетами')
      then PostMessage(TForm(self.Owner).Handle,WM_CLOSE,0,0);
      Close;
end;

procedure TfrmHtmlReport.cxButton2Click(Sender: TObject);
begin
     if (Quene.Count>0)
     then begin
               if QueneLevelInfo(Quene.Peek)<>nil
               then begin
                         getViewData(QueneLevelInfo(Quene.Peek));
                         QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;
               end;
     end;
end;

procedure TfrmHtmlReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmHtmlReport.doExportToExtFormat(const Step:QueneLevelInfo;FmtType:Byte);
begin
     if SaveDialog1.Execute
     then begin
          if (FmtType=1) then ExportGrid4ToExcel(SaveDialog1.FileName,BuReportsInfoGrid, false, true, true);
          if (FmtType=2) then ExportGrid4ToHTML(SaveDialog1.FileName, BuReportsInfoGrid, false, true);
     end;
end;

procedure TfrmHtmlReport.Excelajhvfne1Click(Sender: TObject);
var CurCurrencyString:String;
begin
     if (Quene.Count>0)
     then begin
               if QueneLevelInfo(Quene.Peek)<>nil
               then begin
                         CurCurrencyString:=CurrencyString;
                         CurrencyString:=#0;
                         CurrencyDecimals:=3;
                         doExportToExtFormat(QueneLevelInfo(Quene.Peek),1);
                         CurrencyString:=CurCurrencyString;
               end;
     end;
end;

procedure TfrmHtmlReport.HTML1Click(Sender: TObject);
begin
     if (Quene.Count>0)
     then begin
               if QueneLevelInfo(Quene.Peek)<>nil
               then doExportToExtFormat(QueneLevelInfo(Quene.Peek),2);
     end;
end;

procedure TfrmHtmlReport.SHOW_TITLEStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[TYPE_OBJ.Index]=0)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[TYPE_OBJ.Index]=1)
      then AStyle:=RAZD_STYLE;

      if (ARecord.Values[TYPE_OBJ.Index]=2)
      then AStyle:=SM_STYLE;
end;

procedure TfrmHtmlReport.PLAN_VALUEStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[TYPE_OBJ.Index]=0)
      then begin
                 if ARecord.Values[PLAN_VALUE.Index]<0
                 then AStyle:=ST_STYLE_RED
                 else AStyle:=ST_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=1)
      then begin
                 if ARecord.Values[PLAN_VALUE.Index]<0
                 then AStyle:=RAZD_STYLE_RED
                 else AStyle:=RAZD_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=2)
      then begin
                 if ARecord.Values[PLAN_VALUE.Index]<0
                 then AStyle:=SM_STYLE_RED
                 else AStyle:=SM_STYLE;
      end;
end;

procedure TfrmHtmlReport.BU_KASSA_FACTStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[TYPE_OBJ.Index]=0)
      then begin
                 if ARecord.Values[BU_KASSA_FACT.Index]<0
                 then AStyle:=ST_STYLE_RED
                 else AStyle:=ST_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=1)
      then begin
                 if ARecord.Values[BU_KASSA_FACT.Index]<0
                 then AStyle:=RAZD_STYLE_RED
                 else AStyle:=RAZD_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=2)
      then begin
                 if ARecord.Values[BU_KASSA_FACT.Index]<0
                 then AStyle:=SM_STYLE_RED
                 else AStyle:=SM_STYLE;
      end;
end;

procedure TfrmHtmlReport.BU_FINANCE_FACTStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[TYPE_OBJ.Index]=0)
      then begin
                 if ARecord.Values[BU_KASSA_FACT.Index]<0
                 then AStyle:=ST_STYLE_RED
                 else AStyle:=ST_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=1)
      then begin
                 if ARecord.Values[BU_KASSA_FACT.Index]<0
                 then AStyle:=RAZD_STYLE_RED
                 else AStyle:=RAZD_STYLE;
      end;
      if (ARecord.Values[TYPE_OBJ.Index]=2)
      then begin
                 if ARecord.Values[BU_KASSA_FACT.Index]<0
                 then AStyle:=SM_STYLE_RED
                 else AStyle:=SM_STYLE;
      end;
end;

procedure TfrmHtmlReport.BU_DEBIT_ZStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[TYPE_OBJ.Index]=0)
      then begin
                 if ARecord.Values[BU_DEBIT_Z.Index]<0
                 then AStyle:=ST_STYLE_RED
                 else AStyle:=ST_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=1)
      then begin
                 if ARecord.Values[BU_DEBIT_Z.Index]<0
                 then AStyle:=RAZD_STYLE_RED
                 else AStyle:=RAZD_STYLE;
      end;
      if (ARecord.Values[TYPE_OBJ.Index]=2)
      then begin
                 if ARecord.Values[BU_DEBIT_Z.Index]<0
                 then AStyle:=SM_STYLE_RED
                 else AStyle:=SM_STYLE;
      end;
end;

procedure TfrmHtmlReport.BU_KREDIT_ZStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[TYPE_OBJ.Index]=0)
      then begin
                 if ARecord.Values[BU_KREDIT_Z.Index]<0
                 then AStyle:=ST_STYLE_RED
                 else AStyle:=ST_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=1)
      then begin
                 if ARecord.Values[BU_KREDIT_Z.Index]<0
                 then AStyle:=RAZD_STYLE_RED
                 else AStyle:=RAZD_STYLE;
      end;
      if (ARecord.Values[TYPE_OBJ.Index]=2)
      then begin
                 if ARecord.Values[BU_KREDIT_Z.Index]<0
                 then AStyle:=SM_STYLE_RED
                 else AStyle:=SM_STYLE;
      end;
end;

procedure TfrmHtmlReport.DIFF_FROM_PLANStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[TYPE_OBJ.Index]=0)
      then begin
                 if ARecord.Values[DIFF_FROM_PLAN.Index]<0
                 then AStyle:=ST_STYLE_RED
                 else AStyle:=ST_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=1)
      then begin
                 if ARecord.Values[DIFF_FROM_PLAN.Index]<0
                 then AStyle:=RAZD_STYLE_RED
                 else AStyle:=RAZD_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=2)
      then begin
                 if ARecord.Values[DIFF_FROM_PLAN.Index]<0
                 then AStyle:=SM_STYLE_RED
                 else AStyle:=SM_STYLE;
      end;
end;

procedure TfrmHtmlReport.ViewLevel2DblClick(Sender: TObject);
   var NextStep:QueneLevelInfo;
begin
     if (true{CurColumnSel = 6})
     then begin
               if (ViewLevel2.Controller.FocusedRecord.Values[TYPE_OBJ.Index]=2)
               then begin
                         //Необходимо получить информацию по внутреннему бюджету
                         QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;

                         NextStep:=QueneLevelInfo.Create;
                         NextStep.FActualDate  :=CurActualDate;
                         NextStep.FLevel       :=2;

                         if (DataSet.RecordCount>0)
                         then NextStep.FFilterObject:=StrToInt64(DataSet.FieldByName('ID_INNER_PLAN').asString)
                         else NextStep.FFilterObject:=-1;
                         NextStep.FReportTitle:='Бюджет: '+DataSet.FieldByName('SHOW_TITLE').asString+'('+DataSet.FieldByName('PLAN_DATE_BEG').asString+'-'+DataSet.FieldByName('PLAN_DATE_END').asString+')';

                         Quene.Push(TObject(NextStep));
                         if QueneLevelInfo(Quene.Peek)<>nil
                         then getViewData(QueneLevelInfo(Quene.Peek));
               end
               else begin
                         //Необходимо получить информацию по документам,
                         //которые влияют на выполнение бюджета
                         GlobalSpr.GetDocsUnderBudget(self,
                                                      WorkDatabase.Handle,
                                                      QueneLevelInfo(Quene.Peek).FFilterObject,
                                                      DataSet.FieldByName('ID_FILTER_SM').Value,
                                                      DataSet.FieldByName('ID_FILTER_RZ').Value,
                                                      DataSet.FieldByName('ID_FILTER_ST').Value);
               end;
     end;
end;

procedure TfrmHtmlReport.PrintButtonClick(Sender: TObject);
begin
      if (DataSet.RecordCount>0)
      then begin
                 BuReportsInfoGrid.ActiveView.BeginUpdate;

                 if (QueneLevelInfo(Quene.Peek).FLevel=0)
                 then begin
                            Screen.Cursor:=crHourGlass;
                            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportSmPKV_Gr.fr3',true);
                            frxReport1.PrepareReport(true);
                            Screen.Cursor:=crDefault;
                            frxReport1.ShowPreparedReport;
                 end;

                 if (QueneLevelInfo(Quene.Peek).FLevel=1)
                 then begin
                            Screen.Cursor:=crHourGlass;
                            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportSm_Gr.fr3',true);
                            frxReport1.Variables['TITLE']:=''''+TitlePanel.Caption+'''';
                            frxReport1.PrepareReport(true);
                            Screen.Cursor:=crDefault;
                            frxReport1.ShowPreparedReport;
                 end;

                 if (QueneLevelInfo(Quene.Peek).FLevel=2)
                 then begin
                            Screen.Cursor:=crHourGlass;
                            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportSmState.fr3',true);
                            frxReport1.Variables['TITLE']:=''''+TitlePanel.Caption+'''';
                            frxReport1.Variables['DATE_DATA']:=getStartDate;
                            frxReport1.PrepareReport(true);
                            Screen.Cursor:=crDefault;
                            frxReport1.ShowPreparedReport;
                 end;

                 if (QueneLevelInfo(Quene.Peek).FLevel in [4,9])
                 then begin
                            Screen.Cursor:=crHourGlass;
                            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportGrStateByRzSt.fr3',true);
                            frxReport1.Variables['TITLE']:=''''+TitlePanel.Caption+'''';
                            frxReport1.PrepareReport(true);
                            Screen.Cursor:=crDefault;
                            frxReport1.ShowPreparedReport;
                 end;

                 if (QueneLevelInfo(Quene.Peek).FLevel in [5,7])
                 then begin
                            Screen.Cursor:=crHourGlass;
                            //Coding by A.Tagansky  DataSet
                            if not DoMonthReport
                            then begin
                                      ShowMessage('Помилка при відкритті шаблону звіту!');
                                      Exit;
                            end;
                            frxReport1.Variables['TITLE']:=''''+TitlePanel.Caption+'''';
                            frxReport1.Variables['OST']  :=''''+cxDBTextEdit1.Text+'''';
                            frxReport1.Variables['COST'] :=''''+cxDBTextEdit1.Text+'''';

                            frxReport1.PrepareReport(true);
                            Screen.Cursor:=crDefault;
                            frxReport1.ShowPreparedReport;
                 end;

                 BuReportsInfoGrid.ActiveView.EndUpdate;

      end;
end;

procedure TfrmHtmlReport.ViewLevel1DBColumn3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[ViewLevel1DBColumn3.Index]<0)
      then AStyle:=RED_SUM_STYLE;
end;

procedure TfrmHtmlReport.ViewLevel1DBColumn4StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[ViewLevel1DBColumn4.Index]<0)
      then AStyle:=RED_SUM_STYLE;
end;

procedure TfrmHtmlReport.cxDateEdit1PropertiesChange(Sender: TObject);
var i:Integer;
begin
     for i := 0 to edtMonthBeg.Properties.LookupItems.Count-1 do
     begin
         if Trim(edtMonthBeg.Text) = Trim(edtMonthBeg.Properties.LookupItems[i]) then Break;
     end;
     CurActualDate:=EncodeDate( StrToInt( edtYearBeg.Text ), i + 1, 1 );

     cxButton2Click(self);
end;

procedure TfrmHtmlReport.cxButton4Click(Sender: TObject);
begin
     //TcxGridDBTableView(BuReportsInfoGrid.ActiveLevel.GridView).Controller.Customization :=not TcxGridDBTableView(BuReportsInfoGrid.ActiveLevel.GridView).Controller.Customization;
end;

procedure TfrmHtmlReport.ViewLevel1DBColumn5StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[ViewLevel1DBColumn5.Index]<0)
      then AStyle:=RED_SUM_STYLE;
end;

procedure TfrmHtmlReport.ViewLevel2FocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin
     CurColumnSel:=AFocusedItem.Index;
end;

procedure TfrmHtmlReport.doConfigureMonthGrid(const Step: QueneLevelInfo);
var ArrColumns: array of TcxGridDBBandedColumn;
    i, ColCount:Integer;
    D,M,Y:Word;
    D1, D2:TDateTime;
begin
    Screen.Cursor:=crSQLWait;

    D1:=getStartDate;
    D2:=getEndDate;

    i:=0;
    while (i<=ViewLevelMonth.ColumnCount-1) do
    begin
         if TcxGridDBBandedColumn(ViewLevelMonth.Columns[i]).Position.BandIndex=1
         then begin
                   ViewLevelMonth.Columns[i].Free;
                   i:=i-1;
         end
         else i:=i+1;
    end;

    ColCount:=MonthsBetween(D1, D2+1);

    SetLength(ArrColumns,ColCount);
    ViewLevelMonth.Bands[1].Width:=ColCount*100;
    for i:=1 to ColCount do
    begin
         ArrColumns[i-1]:= ViewLevelMonth.CreateColumn;
         ArrColumns[i-1].HeaderAlignmentHorz:=taCenter;
         ArrColumns[i-1].PropertiesClass:=TcxCurrencyEditProperties;
         TcxCurrencyEditProperties(ArrColumns[i-1].Properties).Alignment.Vert:=taTopJustify;
         ArrColumns[i-1].Position.BandIndex:=1;
         ArrColumns[i-1].Width:=80;
         ArrColumns[i-1].Styles.OnGetContentStyle:=ViewLevelMonthDBBandedColumn1StylesGetContentStyle;
         ArrColumns[i-1].DataBinding.FieldName:='M'+IntToStr(i);
         DecodeDate(D1,Y,M,D);
         ArrColumns[i-1].Caption:=IntToStr(M)+'/'+IntToStr(Y);

         with ViewLevelMonth.DataController.Summary.DefaultGroupSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
         begin
              Column := ArrColumns[i-1];
              FieldName:='M'+IntToStr(i)+'_FC';
              Kind := skSum;
              Format := '0.00;-0.00';
              Position:=spFooter;
        end;

         D1:=IncMonth(D1,1);
    end;
    Screen.Cursor:=crDefault;
end;

procedure TfrmHtmlReport.ViewLevel4DBBandedColumn3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[9]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[9]=0)
      then AStyle:=RAZD_STYLE;
end;

procedure TfrmHtmlReport.ViewLevel4DBBandedColumn1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[9]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[9]=0)
      then AStyle:=RAZD_STYLE;
end;

procedure TfrmHtmlReport.ViewLevel4DBBandedColumn4StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[9]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[9]=0)
      then AStyle:=RAZD_STYLE;

end;

procedure TfrmHtmlReport.ViewLevel4DBBandedColumn5StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[9]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[9]=0)
      then AStyle:=RAZD_STYLE;

end;

procedure TfrmHtmlReport.ViewLevel4DBBandedColumn6StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[9]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[9]=0)
      then AStyle:=RAZD_STYLE;

end;

procedure TfrmHtmlReport.ViewLevel4DBBandedColumn7StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[9]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[9]=0)
      then AStyle:=RAZD_STYLE;

end;

procedure TfrmHtmlReport.ViewLevel4DBBandedColumn8StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[9]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[9]=0)
      then AStyle:=RAZD_STYLE;

end;

procedure TfrmHtmlReport.ViewLevel4DBBandedColumn9StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[9]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[9]=0)
      then AStyle:=RAZD_STYLE;

end;

procedure TfrmHtmlReport.ViewLevel4DBBandedColumn2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[9]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[9]=0)
      then AStyle:=RAZD_STYLE;

end;

procedure TfrmHtmlReport.ViewLevel4DBBandedColumn10StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[9]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[9]=0)
      then AStyle:=RAZD_STYLE;
end;

function TfrmHtmlReport.getSQLTextForMonthLevel(const Step: QueneLevelInfo): String;
var i:Integer;
    D1,D2:TDateTime;
    ResStr:String;
begin
    D1:=StartOfTheMonth(Step.FDateBeg);
    D2:=EndOfTheMonth(Step.FDateEnd);

    ResStr:=' SELECT VAL.*, ';
    i:=1;
    while (D1<D2) do
    begin
         ResStr:=ResStr+' (SELECT RESULT FROM BU_GET_SM_VALUE_BY_MONTH_2012(VAL.ID_SMETA, '+
                                                                           ' VAL.ID_SM_GROUP,'+
                                                                           ' VAL.ID_OBJECT,VAL.OBJECT_TYPE,'+
                                                                           ''''+DateToStr(D1)+''''+','+
                                                                           ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                           ''''+DateToStr(Step.FDateEnd)+''''+',0)) AS M'+IntToStr(i)+' ,';
         ResStr:=ResStr+' (SELECT RESULT_FC FROM BU_GET_SM_VALUE_BY_MONTH_2012(VAL.ID_SMETA, '+
                                                                           ' VAL.ID_SM_GROUP,'+
                                                                           ' VAL.ID_OBJECT,VAL.OBJECT_TYPE,'+
                                                                           ''''+DateToStr(D1)+''''+','+
                                                                           ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                           ''''+DateToStr(Step.FDateEnd)+''''+',0)) AS M'+IntToStr(i)+'_FC ';
         if (IncMonth(D1,1)<D2) then ResStr:=ResStr+' , ';

         D1:=IncMonth(D1,1);
         i:=i+1;
    end;

    ResStr:=ResStr+'  FROM BU_GET_BUDGET_REST_BY_PLAN_2012('+IntToStr(Step.FFilterObject)+','+
                                                           ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                           ''''+DateToStr(Step.FDateEnd)+''''+',0) VAL  ORDER BY VAL.SHOW_POSITION ASC ';

    Result:=ResStr;
end;

procedure TfrmHtmlReport.ViewLevelMonthDBBandedColumn4StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[0]=0)
      then begin
                 if ARecord.Values[4]<0
                 then AStyle:=ST_STYLE_RED
                 else AStyle:=ST_STYLE;
      end;

      if (ARecord.Values[0]=1)
      then begin
                 if ARecord.Values[4]<0
                 then AStyle:=RAZD_STYLE_RED
                 else AStyle:=RAZD_STYLE;
      end;

      if (ARecord.Values[0]=2)
      then begin
                 if ARecord.Values[4]<0
                 then AStyle:=SM_STYLE_RED
                 else AStyle:=SM_STYLE;
      end;
end;

procedure TfrmHtmlReport.ViewLevelMonthDBBandedColumn1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[0]=0)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[0]=1)
      then AStyle:=RAZD_STYLE;

      if (ARecord.Values[0]=2)
      then AStyle:=SM_STYLE;

end;

procedure TfrmHtmlReport.ViewLevelMonthDBBandedColumn2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[0]=0)
      then begin
                 if ARecord.Values[2]<0
                 then AStyle:=ST_STYLE_RED
                 else AStyle:=ST_STYLE;
      end;

      if (ARecord.Values[0]=1)
      then begin
                 if ARecord.Values[2]<0
                 then AStyle:=RAZD_STYLE_RED
                 else AStyle:=RAZD_STYLE;
      end;

      if (ARecord.Values[0]=2)
      then begin
                 if ARecord.Values[2]<0
                 then AStyle:=SM_STYLE_RED
                 else AStyle:=SM_STYLE;
      end;
end;

procedure TfrmHtmlReport.ViewLevelMonthDBBandedColumn3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[0]=0)
      then begin
                 if ARecord.Values[3]<0
                 then AStyle:=ST_STYLE_RED
                 else AStyle:=ST_STYLE;
      end;

      if (ARecord.Values[0]=1)
      then begin
                 if ARecord.Values[3]<0
                 then AStyle:=RAZD_STYLE_RED
                 else AStyle:=RAZD_STYLE;
      end;

      if (ARecord.Values[0]=2)
      then begin
                 if ARecord.Values[3]<0
                 then AStyle:=SM_STYLE_RED
                 else AStyle:=SM_STYLE;
      end;

end;

procedure TfrmHtmlReport.ViewLevel1DBColumn7GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     AText:='...';
end;

procedure TfrmHtmlReport.ViewLevelMonthDblClick(Sender: TObject);
var NextStep:QueneLevelInfo;
begin
     if (DataSet.RecordCount>0)
     then begin
               if (ViewLevelMonth.Controller.FocusedRecord.Values[0]=2)
               then begin
                         //Необходимо получить информацию по внутреннему бюджету
                         QueneLevelInfo(Quene.Peek).FFocusedRowIndex:=BuReportsInfoGrid.ActiveView.DataController.FocusedRowIndex;
                         NextStep:=QueneLevelInfo.Create;
                         NextStep.FActualDate  :=CurActualDate;
                         NextStep.FLevel       :=5;
                         NextStep.FFilterObject:=StrToInt64(DataSet.FieldByName('ID_INNER_PLAN').asString);
                         NextStep.FReportTitle:='Бюджет: '+DataSet.FieldByName('SHOW_TITLE').asString+' щомісячно';
                         Quene.Push(TObject(NextStep));
                         if QueneLevelInfo(Quene.Peek)<>nil
                         then begin
                                   doConfigureMonthGrid(QueneLevelInfo(Quene.Peek));
                                   getViewData(QueneLevelInfo(Quene.Peek));
                         end;
               end
               else begin
                         //Необходимо получить информацию по документам,
                         //которые влияют на выполнение бюджета
                         GlobalSpr.GetDocsUnderBudget(self,
                                                      WorkDatabase.Handle,
                                                      QueneLevelInfo(Quene.Peek).FFilterObject,
                                                      DataSet.FieldByName('ID_FILTER_SM').Value,
                                                      DataSet.FieldByName('ID_FILTER_RZ').Value,
                                                      DataSet.FieldByName('ID_FILTER_ST').Value);
               end;
     end;
end;

function TfrmHtmlReport.DoMonthReport : boolean;
begin
 Result := False;

 if not frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportViewMonth.fr3',true) then Exit;

 RowDataSet.RangeEndCount := ViewLevelMonth.ViewData.RowCount;
 ColDataSet.RangeEndCount := ViewLevelMonth.VisibleColumnCount;

 Result := True;
end;

procedure TfrmHtmlReport.frxReport1GetValue(const VarName: String;
  var Value: Variant);
const
 c = 18/5;
var
 m : TfrxMemoView;
 pWidth  : extended;
 p       : TfrxReportPage;
 w       : extended;
 Col     : integer;

 i       : integer;
 Sum     : currency;
begin
 if(VarName = 'Cell') or (VarName = 'Col') then begin
  if ColDataSet.RecNo = 0 then Col := SHOW_TITLE_.Index
  else if ColDataSet.RecNo = 1 then Col := PLAN_VALUE_.Index
  else if ColDataSet.RecNo = ColDataSet.RangeEndCount - 2 then Col := BU_KASSA_FACT_.Index
  else if ColDataSet.RecNo = ColDataSet.RangeEndCount - 1 then Col := DIFF_FROM_PLAN_.Index
  else Col := ViewLevelMonth.Bands[1].Columns[ColDataSet.RecNo - 2].Index;

  p      := (frxReport1.FindObject('Page1') as TfrxReportPage);
  pWidth := p.PaperWidth - p.LeftMargin - p.RightMargin;
  w      := (pWidth - (35 + 20 + (20 * 2))) / ViewLevelMonth.Bands[1].ColumnCount;


  if VarName = 'Cell' then
   m := (frxReport1.FindObject('Memo2') as TfrxMemoView)
  else
   m := (frxReport1.FindObject('Memo3') as TfrxMemoView);


  if VarName = 'Col' then Value := ViewLevelMonth.Columns[Col].Caption
  else begin
   if ViewLevelMonth.ViewData.Rows[RowDataSet.RecNo].Expandable then begin
    if ColDataSet.RecNo = 0 then Value := ViewLevelMonth.ViewData.Rows[RowDataSet.RecNo].Values[Col]
    else begin
     if (ViewLevelMonth.Columns[Col] = BU_KASSA_FACT_)
     or (ViewLevelMonth.Columns[Col] = DIFF_FROM_PLAN_)
     or (ViewLevelMonth.Columns[Col] = PLAN_VALUE_) then begin
      i   := RowDataSet.RecNo + 1;
      Sum := 0;

      while i < ViewLevelMonth.ViewData.RowCount do begin
       if ViewLevelMonth.ViewData.Rows[i].Expandable then Break;

       if ViewLevelMonth.ViewData.Rows[i].Values[0] = 1 then
        if not VarIsNull(ViewLevelMonth.ViewData.Rows[i].Values[Col]) then Sum := Sum + ViewLevelMonth.ViewData.Rows[i].Values[Col];

       inc(i);
      end;

      Value := Sum;
     end
     else Value := '';
    end;

    m.Color      := clSilver;
    m.Font.Style := [fsBold];
   end
   else begin
    if ViewLevelMonth.ViewData.Rows[RowDataSet.RecNo].Values[0] = 1 then begin
     m.Color      := $00E4E4E4;
     m.Font.Style := [fsBold];
    end
    else begin
     m.Color      := clNone;
     m.Font.Style := [fsItalic];
    end;

    Value := ViewLevelMonth.ViewData.Rows[RowDataSet.RecNo].Values[Col];
   end;
  end;

  if VarName = 'Cell' then begin
   if ColDataSet.RecNo = 0 then m.HAlign := haLeft
   else m.HAlign := haRight;
  end
  else m.HAlign := haCenter;

  if m = nil then Exit;

  if ColDataSet.RecNo = 0 then begin
   m.Width      := c*35;
   m.Font.Color := clBlack;
  end
  else if ColDataSet.RecNo = 1 then begin
   m.Width := c*20;
   m.Left  := c*35;

   if not VarIsNull(Value) and (VarName = 'Cell')
   and not ViewLevelMonth.ViewData.Rows[RowDataSet.RecNo].Expandable then if Value < 0 then m.Font.Color := clRed
   else m.Font.Color := clBlack;
  end
  else if ViewLevelMonth.Columns[Col].Position.BandIndex = 2 then begin
   m.Width := c*20;
   m.Left := (35 + 20 + w * ViewLevelMonth.Bands[1].ColumnCount)*c;

   if not VarIsNull(Value) and (VarName = 'Cell')
   and not ViewLevelMonth.ViewData.Rows[RowDataSet.RecNo].Expandable then if Value < 0 then m.Font.Color := clRed
   else m.Font.Color := clBlack;

   if ViewLevelMonth.Columns[Col] = DIFF_FROM_PLAN_ then m.Left := m.Left + c*20;
  end
  else begin
   m.Width := c*w;
   if ColDataSet.RecNo = 2 then m.Left := c*(35 + 20)
   else m.Left := c*(35 + 20 + w * (ColDataSet.RecNo - 2));

   if not VarIsNull(Value) and (VarName = 'Cell')
   and not ViewLevelMonth.ViewData.Rows[RowDataSet.RecNo].Expandable then if Value < 0 then m.Font.Color := clRed
   else m.Font.Color := clBlack;
  end;
 end;
end;

procedure TfrmHtmlReport.N1Click(Sender: TObject);
begin
      BuReportsInfoGrid.ActiveView.BeginUpdate;
          Screen.Cursor:=crHourGlass;
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportSmState.fr3',true);
          frxReport1.Variables['TITLE']:=''''+TitlePanel.Caption+'''';
          frxReport1.Variables['DATE_DATA']:=getStartDate;
          frxReport1.PrepareReport(true);
          Screen.Cursor:=crDefault;
          frxReport1.ShowPreparedReport;
      BuReportsInfoGrid.ActiveView.EndUpdate;
end;

procedure TfrmHtmlReport.N2Click(Sender: TObject);
begin
      BuReportsInfoGrid.ActiveView.BeginUpdate;
          Screen.Cursor:=crHourGlass;
          frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportSmStateF.fr3',true);
          frxReport1.Variables['TITLE']:=''''+TitlePanel.Caption+'''';
          frxReport1.Variables['DATE_DATA']:=getStartDate;
          frxReport1.PrepareReport(true);
          Screen.Cursor:=crDefault;
          frxReport1.ShowPreparedReport;
      BuReportsInfoGrid.ActiveView.EndUpdate;
end;

function TfrmHtmlReport.getSQLTextForMonthLevelF(const Step: QueneLevelInfo): String;
var i:Integer;
    D1,D2:TDateTime;
    ResStr:String;
begin
    D1:=StartOfTheMonth(Step.FDateBeg);
    D2:=EndOfTheMonth(Step.FDateEnd);

    ResStr:=' SELECT VAL.*, ';
    i:=1;
    while (D1<D2) do
    begin
         ResStr:=ResStr+' (SELECT RESULT FROM BU_GET_SM_VALUE_BY_MONTH_2012(VAL.ID_SMETA, '+
                                                                           ' VAL.ID_SM_GROUP,'+
                                                                           ' VAL.ID_OBJECT,VAL.OBJECT_TYPE,'+
                                                                           ''''+DateToStr(D1)+''''+','+
                                                                           ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                           ''''+DateToStr(Step.FDateEnd)+''''+',1)) AS M'+IntToStr(i)+' ,';
         ResStr:=ResStr+' (SELECT RESULT_FC FROM BU_GET_SM_VALUE_BY_MONTH_2012(VAL.ID_SMETA, '+
                                                                           ' VAL.ID_SM_GROUP,'+
                                                                           ' VAL.ID_OBJECT,VAL.OBJECT_TYPE,'+
                                                                           ''''+DateToStr(D1)+''''+','+
                                                                           ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                           ''''+DateToStr(Step.FDateEnd)+''''+',1)) AS M'+IntToStr(i)+'_FC ';
         if (IncMonth(D1,1)<D2) then ResStr:=ResStr+' , ';

         D1:=IncMonth(D1,1);
         i:=i+1;
    end;

    ResStr:=ResStr+'  FROM BU_GET_BUDGET_REST_BY_PLAN_2012('+IntToStr(Step.FFilterObject)+','+
                                                           ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                           ''''+DateToStr(Step.FDateEnd)+''''+',1) VAL  ORDER BY VAL.SHOW_POSITION ASC ';

    Result:=ResStr;
end;

procedure TfrmHtmlReport.ViewLevel1DBColumn8GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     AText:='...';
end;

procedure TfrmHtmlReport.ViewLevel3DBBandedColumn1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[3]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[3]=0)
      then AStyle:=RAZD_STYLE;
end;

procedure TfrmHtmlReport.ViewLevel3DBBandedColumn2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[3]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[3]=0)
      then AStyle:=RAZD_STYLE;

end;

procedure TfrmHtmlReport.doConfigureGroupDetailGrid(const Step: QueneLevelInfo);
var ArrColumns: array of TcxGridDBBandedColumn;
    i:Integer;
    D,M,Y:Word;
    SmTitleQuery:TpfibDataSet;
    D1:TDateTime;
begin
    //Получаем информацию по периоду функционирования бюджета
    i:=0;
    while (i<=ViewLevel3.ColumnCount-1) do
    begin
         if TcxGridDBBandedColumn(ViewLevel3.Columns[i]).Position.BandIndex=1
         then begin
                   ViewLevel3.Columns[i].Free;
                   i:=i-1;
         end
         else i:=i+1;
    end;

    SmTitleQuery:=TpfibDataSet.Create(self);
    SmTitleQuery.Database:=WorkDatabase;
    SmTitleQuery.Transaction:=ReadTransaction;


    SmTitleQuery.SelectSQL.Text:='SELECT * FROM BU_GET_SM_IN_GROUP_2012('+IntToStr(Step.FFilterObject)+','+
                                                                         ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                         ''''+DateToStr(Step.FDateEnd)+''''+') ORDER BY SM_CODE ASC';
    SmTitleQuery.Open;
    SmTitleQuery.FetchAll;
    SmTitleQuery.First;

    SetLength(ArrColumns,SmTitleQuery.RecordCount);
    ViewLevel3.Bands[1].Width:=SmTitleQuery.RecordCount*100;

    for i:=1 to SmTitleQuery.RecordCount do
    begin
         ArrColumns[i-1]:= ViewLevel3.CreateColumn;
         ArrColumns[i-1].HeaderAlignmentHorz:=taCenter;
         ArrColumns[i-1].PropertiesClass:=TcxCurrencyEditProperties;
         TcxCurrencyEditProperties(ArrColumns[i-1].Properties).Alignment.Vert:=taTopJustify;
         ArrColumns[i-1].Position.BandIndex:=1;
         ArrColumns[i-1].Width:=80;
         ArrColumns[i-1].Options.Filtering:=false;
         ArrColumns[i-1].Styles.OnGetContentStyle:=ViewLevel3DBBandedColumn2StylesGetContentStyle;
         ArrColumns[i-1].DataBinding.FieldName:='SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString;
         ArrColumns[i-1].Name:='SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString;
         DecodeDate(D1,Y,M,D);
         ArrColumns[i-1].Caption:=SmTitleQuery.FieldByName('SM_CODE').AsString;
         D1:=IncMonth(D1,1);

         with ViewLevel3.DataController.Summary.DefaultGroupSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
         begin
              Column := ArrColumns[i-1];
              FieldName:='SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString+'_FC';
              Kind := skSum;
              Format := '0.00;-0.00';
              Position:=spFooter;
        end;

        SmTitleQuery.Next;
    end;

    SmTitleQuery.Close;

    SmTitleQuery.Free;
    Screen.Cursor:=crDefault;
end;

procedure TfrmHtmlReport.ViewLevel3DBBandedColumn3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[3]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[3]=0)
      then AStyle:=RAZD_STYLE;
end;

function TfrmHtmlReport.getSQLTextForGroupPlanDetail(const Step: QueneLevelInfo): String;
var i:Integer;
    SmTitleQuery:TpfibDataSet;
    ResStr:String;
    T:TfrmDocSearchInfo;
begin
    //Получаем информацию по бюджетам, которые входят в группу
    T:=TfrmDocSearchInfo.Create(self, getStartDate, getEndDate);
    T.ShowModal;
    Step.FDateBeg:=T.getStartDate;
    Step.FDateEnd:=T.getEndDate;

    SmTitleQuery:=TpfibDataSet.Create(self);
    SmTitleQuery.Database:=WorkDatabase;
    SmTitleQuery.Transaction:=ReadTransaction;
    SmTitleQuery.SelectSQL.Text:='SELECT * FROM BU_GET_SM_IN_GROUP_2012('+IntToStr(Step.FFilterObject)+','+
                                                                         ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                         ''''+DateToStr(Step.FDateEnd)+''''+') ORDER BY SM_CODE ASC';
    SmTitleQuery.Open;
    SmTitleQuery.FetchAll;
    SmTitleQuery.First;

    ResStr:=' SELECT VAL.*, ';
    i:=1;
    while (i<SmTitleQuery.RecordCount) do
    begin
         ResStr:=ResStr+' (SELECT PLAN_VALUE FROM BU_GET_PLAN_VALUE_2012(VAL.SHOW_ID,'+
                                                                         SmTitleQuery.FieldByName('ID_SMETA').AsString+','+
                                                                         SmTitleQuery.FieldByName('ID_GROUP').AsString+','+
                                                                         ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                         ''''+DateToStr(Step.FDateEnd)+''''+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString;
         ResStr:=ResStr+' , ';

         ResStr:=ResStr+' (SELECT PLAN_VALUE_FC FROM BU_GET_PLAN_VALUE_2012(VAL.SHOW_ID,'+
                                                                         SmTitleQuery.FieldByName('ID_SMETA').AsString+','+
                                                                         SmTitleQuery.FieldByName('ID_GROUP').AsString+','+
                                                                         ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                         ''''+DateToStr(Step.FDateEnd)+''''+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString+'_FC';
         ResStr:=ResStr+' , ';

         i:=i+1;
         SmTitleQuery.Next;
    end;
    ResStr:=ResStr+' (SELECT PLAN_VALUE FROM BU_GET_PLAN_VALUE_2012(VAL.SHOW_ID,'+
                                                                         SmTitleQuery.FieldByName('ID_SMETA').AsString+','+
                                                                         SmTitleQuery.FieldByName('ID_GROUP').AsString+','+
                                                                         ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                         ''''+DateToStr(Step.FDateEnd)+''''+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString +' , ';
    ResStr:=ResStr+' (SELECT PLAN_VALUE_FC FROM BU_GET_PLAN_VALUE_2012(VAL.SHOW_ID,'+
                                                                         SmTitleQuery.FieldByName('ID_SMETA').AsString+','+
                                                                         SmTitleQuery.FieldByName('ID_GROUP').AsString+','+
                                                                         ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                         ''''+DateToStr(Step.FDateEnd)+''''+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString+'_FC';

    if T.RadioButton1.Checked
    then ResStr:=ResStr+'  FROM BU_GET_BU_REST_BY_GROUP_RS_2012('+IntToStr(Step.FFilterObject)+','+
                                                                ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                ''''+DateToStr(Step.FDateEnd)+''''+') VAL WHERE VAL.IS_DETAIL=0'

    else ResStr:=ResStr+'  FROM BU_GET_BU_REST_BY_GROUP_RS_2012('+IntToStr(Step.FFilterObject)+','+
                                                                ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                ''''+DateToStr(Step.FDateEnd)+''''+') VAL';
    T.Free;
    Result:=ResStr;
end;

procedure TfrmHtmlReport.ViewLevel0DBColumn5GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     if(ARecord.Values[OBJECT_TYPE_COL.Index]=3)
     then AText:='[...]'
     else AText:='';
end;

procedure TfrmHtmlReport.ViewLevel8DBBandedColumn1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[4]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[4]=0)
      then AStyle:=RAZD_STYLE;
end;

procedure TfrmHtmlReport.ViewLevel8DBBandedColumn2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[4]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[4]=0)
      then AStyle:=RAZD_STYLE;
end;

procedure TfrmHtmlReport.ViewLevel8DBBandedColumn3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[4]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[4]=0)
      then AStyle:=RAZD_STYLE;
end;

procedure TfrmHtmlReport.ViewLevel8DBBandedColumn4StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[4]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[4]=0)
      then AStyle:=RAZD_STYLE;
end;

procedure TfrmHtmlReport.ViewLevel8DBBandedColumn5StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[4]=1)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[4]=0)
      then AStyle:=RAZD_STYLE;
end;

procedure TfrmHtmlReport.doConfigureGroupDetailGridV (const Step: QueneLevelInfo);
var ArrColumns: array of TcxGridDBBandedColumn;
    i:Integer;
    D,M,Y:Word;
    SmTitleQuery:TpfibDataSet;
    D1:TDateTime;
begin
    i:=0;
    while (i<=ViewLevel8.ColumnCount-1) do
    begin
         if TcxGridDBBandedColumn(ViewLevel8.Columns[i]).Position.BandIndex=1
         then begin
                   ViewLevel8.Columns[i].Free;
                   i:=i-1;
         end
         else i:=i+1;
    end;

    SmTitleQuery:=TpfibDataSet.Create(self);
    SmTitleQuery.Database:=WorkDatabase;
    SmTitleQuery.Transaction:=ReadTransaction;
    SmTitleQuery.SelectSQL.Text:='SELECT * FROM BU_GET_SM_IN_GROUP_2012('+IntToStr(Step.FFilterObject)+','+
                                                                         ''''+DateToStr(getStartDate)+''''+','+
                                                                         ''''+DateToStr(getEndDate)+''''+') ORDER BY SM_CODE ASC';

    SmTitleQuery.Open;
    SmTitleQuery.FetchAll;
    SmTitleQuery.First;

    SetLength(ArrColumns,SmTitleQuery.RecordCount);
    ViewLevel8.Bands[1].Width:=SmTitleQuery.RecordCount*100;

    for i:=1 to SmTitleQuery.RecordCount do
    begin
         ArrColumns[i-1]:= ViewLevel8.CreateColumn;
         ArrColumns[i-1].HeaderAlignmentHorz:=taCenter;
         ArrColumns[i-1].PropertiesClass:=TcxCurrencyEditProperties;
         TcxCurrencyEditProperties(ArrColumns[i-1].Properties).Alignment.Vert:=taTopJustify;
         ArrColumns[i-1].Position.BandIndex:=1;
         ArrColumns[i-1].Width:=80;
         ArrColumns[i-1].Options.Filtering:=false;
         ArrColumns[i-1].Styles.OnGetContentStyle:=ViewLevel8DBBandedColumn5StylesGetContentStyle;
         ArrColumns[i-1].DataBinding.FieldName:='SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString;
         ArrColumns[i-1].Name:='xSM_'+SmTitleQuery.FieldByName('SM_CODE').AsString;
         DecodeDate(D1,Y,M,D);
         ArrColumns[i-1].Caption:=SmTitleQuery.FieldByName('SM_CODE').AsString;
         D1:=IncMonth(D1,1);

         SmTitleQuery.Next;
    end;

    SmTitleQuery.Close;
    SmTitleQuery.Free;
    Screen.Cursor:=crDefault;

end;


function TfrmHtmlReport.getSQLTextForGroupFactDetail(const Step: QueneLevelInfo): String;
var i:Integer;
    SmTitleQuery:TpfibDataSet;
    T:TfrmDocsSearchInfo;
    ResStr:String;
    Type_:String;
begin
    //Получаем информацию по бюджетам, которые входят в группу

    T:=TfrmDocsSearchInfo.Create(self, getStartDate, getEndDate);

    
    if T.ShowModal=mrOk then
    begin
        Step.FDateBeg:=T.getStartDate;
        Step.FDateEnd:=T.getEndDate;

        if T.rb3.Checked
        then begin
                  BU_KASSA_FACTColumn.Visible:=true;
                  FACT_FINANCEColumn.Visible :=false;
                  Type_:='0'
        end
        else begin
                  BU_KASSA_FACTColumn.Visible:=false;
                  FACT_FINANCEColumn.Visible :=true;
                  Type_:='1';
        end;

        SmTitleQuery:=TpfibDataSet.Create(self);
        SmTitleQuery.Database:=WorkDatabase;
        SmTitleQuery.Transaction:=ReadTransaction;

        SmTitleQuery.SelectSQL.Text:='SELECT * FROM BU_GET_SM_IN_GROUP_2012('+IntToStr(Step.FFilterObject)+','+
                                                                         ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                         ''''+DateToStr(Step.FDateEnd)+''''+') ORDER BY SM_CODE ASC';

        SmTitleQuery.Open;
        SmTitleQuery.FetchAll;
        SmTitleQuery.First;

        ResStr:=' SELECT VAL.*, ';
        i:=1;
        while (i<SmTitleQuery.RecordCount) do
        begin
             ResStr:=ResStr+' (SELECT FACT_VALUE FROM BU_GET_FACT_VALUE_2012(VAL.SHOW_ID,'+
                                                                             SmTitleQuery.FieldByName('ID_GROUP').AsString+','+
                                                                             SmTitleQuery.FieldByName('ID_SMETA').AsString+','+
                                                                             ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                             ''''+DateToStr(Step.FDateEnd)+''''+','+
                                                                             Type_+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString + ' , ';
             i:=i+1;
             SmTitleQuery.Next;
        end;
        ResStr:=ResStr+' (SELECT FACT_VALUE FROM BU_GET_FACT_VALUE_2012(VAL.SHOW_ID,'+
                                                                         SmTitleQuery.FieldByName('ID_GROUP').AsString+','+
                                                                         SmTitleQuery.FieldByName('ID_SMETA').AsString+','+
                                                                         ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                         ''''+DateToStr(Step.FDateEnd)+''''+','+
                                                                         Type_+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString;

        if T.rb1.Checked
        then ResStr:=ResStr+'  FROM BU_GET_BU_REST_BY_GROUP_RS_2012('+IntToStr(Step.FFilterObject)+','+
                                                                    ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                    ''''+DateToStr(Step.FDateEnd)+''''+') VAL WHERE VAL.IS_DETAIL=0'
        else ResStr:=ResStr+'  FROM BU_GET_BU_REST_BY_GROUP_RS_2012('+IntToStr(Step.FFilterObject)+','+
                                                                    ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                                    ''''+DateToStr(Step.FDateEnd)+''''+') VAL';

        T.Free;

        Result:=ResStr;
    end;
end;

procedure TfrmHtmlReport.ViewLevel1DBColumn9StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[ViewLevel1DBColumn9.Index]<0)
      then AStyle:=RED_SUM_STYLE;

end;

procedure TfrmHtmlReport.ViewLevel1DBColumn10StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[ViewLevel1DBColumn10.Index]<0)
      then AStyle:=RED_SUM_STYLE;
end;

procedure TfrmHtmlReport.ViewLevel0DBColumn2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[OBJECT_TYPE_COL.Index]=1)
      then AStyle:=cxStyle4;
      if (ARecord.Values[OBJECT_TYPE_COL.Index]=2)
      then AStyle:=cxStyle25;
      if (ARecord.Values[OBJECT_TYPE_COL.Index]=3)
      then AStyle:=st_STYLE;
end;

procedure TfrmHtmlReport.cxButton3Click(Sender: TObject);
var str:String;
begin
     if UnWorkedPLDocsDataSet.Active
     then UnWorkedPLDocsDataSet.close;

     UnWorkedPLDocsDataSet.SelectSQL.Text:='SELECT * from BU_GET_NOT_WRKD_PL_DOC_EX_2012('+
                                            ''''+DateToStr(getStartDate)+''''+','+
                                            ''''+DateToStr(getEndDate)+''''+') order by smeta_full asc';

     Screen.Cursor:=crHourGlass;
     frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\UnWorkedPLDocs.fr3',true);
     str:='('+DateToStr(date-30)+'-'+DateToStr(date)+')';
     frxReport1.Variables['PERIOD']:=''''+str+'''';
     frxReport1.PrepareReport(true);
     Screen.Cursor:=crDefault;
     frxReport1.ShowPreparedReport;
end;

procedure TfrmHtmlReport.DIFF_WITH_PLATSStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[TYPE_OBJ.Index]=0)
      then begin
                 if ARecord.Values[DIFF_WITH_PLATS.Index]<0
                 then AStyle:=ST_STYLE_RED
                 else AStyle:=ST_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=1)
      then begin
                 if ARecord.Values[DIFF_WITH_PLATS.Index]<0
                 then AStyle:=RAZD_STYLE_RED
                 else AStyle:=RAZD_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=2)
      then begin
                 if ARecord.Values[DIFF_WITH_PLATS.Index]<0
                 then AStyle:=SM_STYLE_RED
                 else AStyle:=SM_STYLE;
      end;

end;

function TfrmHtmlReport.getStartDate: TdateTime;
var i:Integer;
begin
     for i := 0 to edtMonthBeg.Properties.LookupItems.Count-1 do
     begin
         if Trim(edtMonthBeg.Text) = Trim(edtMonthBeg.Properties.LookupItems[i]) then Break;
     end;
     Result:=EncodeDate( StrToInt( edtYearBeg.Text ), i + 1, 1 );
end;

function TfrmHtmlReport.getEndDate: TDateTime;
var i:Integer;
begin
     for i := 0 to edtMonthEnd.Properties.LookupItems.Count-1 do
     begin
         if Trim(edtMonthEnd.Text) = Trim(edtMonthEnd.Properties.LookupItems[i]) then Break;
     end;
     Result:=IncMonth(EncodeDate( StrToInt( edtYearEnd.Text ), i + 1, 1 ))-1;
end;

procedure TfrmHtmlReport.ViewLevel0DBColumn6GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     if (ARecord.Values[OBJECT_TYPE_COL.Index]=3)
     then AText:='[...]'
     else AText:='';
end;

procedure TfrmHtmlReport.doConfigureGroupMonthDetailGrid(
  const Step: QueneLevelInfo);
var ArrColumns: array of TcxGridDBBandedColumn;
    i, ColCount:Integer;
    D,M,Y:Word;
    D1, D2:TDateTime;
begin
    Screen.Cursor:=crSQLWait;

    D1:=getStartDate;
    D2:=getEndDate;

    i:=0;
    while (i<=ViewLevel10.ColumnCount-1) do
    begin
         if TcxGridDBBandedColumn(ViewLevel10.Columns[i]).Position.BandIndex=1
         then begin
                   ViewLevel10.Columns[i].Free;
                   i:=i-1;
         end
         else i:=i+1;
    end;

    ColCount:=MonthsBetween(D1, D2+1)+1;

    SetLength(ArrColumns,ColCount);
    ViewLevel10.Bands[1].Width:=ColCount*100;
    for i:=1 to ColCount do
    begin
         ArrColumns[i-1]:= ViewLevel10.CreateColumn;
         ArrColumns[i-1].HeaderAlignmentHorz:=taCenter;
         ArrColumns[i-1].PropertiesClass:=TcxCurrencyEditProperties;
         TcxCurrencyEditProperties(ArrColumns[i-1].Properties).Alignment.Vert:=taTopJustify;
         ArrColumns[i-1].Position.BandIndex:=1;
         ArrColumns[i-1].Width:=80;
         ArrColumns[i-1].Options.Filtering:=false;
         ArrColumns[i-1].Options.Editing:=false;
         ArrColumns[i-1].Styles.OnGetContentStyle:=MonthShow_titleStylesGetContentStyle;
         ArrColumns[i-1].DataBinding.FieldName:='M'+IntToStr(i);
         DecodeDate(D1,Y,M,D);
         ArrColumns[i-1].Caption:=IntToStr(M)+'/'+IntToStr(Y);

         with ViewLevelMonth.DataController.Summary.DefaultGroupSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
         begin
              Column := ArrColumns[i-1];
              FieldName:='M'+IntToStr(i)+'_FC';
              Kind := skSum;
              Format := '0.00;-0.00';
              Position:=spFooter;
         end;


         D1:=IncMonth(D1,1);
    end;
    Screen.Cursor:=crDefault;
end;

function TfrmHtmlReport.getSQLTextForGroupMonthLevel(
  const Step: QueneLevelInfo): String;
var i:Integer;
    D1,D2:TDateTime;
    ResStr:String;
begin
    D1:=StartOfTheMonth(Step.FDateBeg);
    D2:=EndOfTheMonth(Step.FDateEnd);

    ResStr:=' SELECT VAL.*,  ';
    i:=1;
    while (D1<D2) do
    begin
         ResStr:=ResStr+' (SELECT SUMMA FROM BU_GET_MONTH_PLAN_2012_VAL(VAL.ID_SMETA ,'+IntToStr(Step.FFilterObject)+','+
                                                                           ' VAL.ID_OBJECT,'+
                                                                           ' VAL.OBJECT_TYPE,'+
                                                                           ''''+DateToStr(D1)+''''+')) AS M'+IntToStr(i);
         if (IncMonth(D1,1)<D2) then ResStr:=ResStr+' , ';

         D1:=IncMonth(D1,1);
         i:=i+1;
    end;

    ResStr:=ResStr+'  FROM BU_GET_GROUP_MONTH_PLAN_2012('+IntToStr(Step.FFilterObject)+','+
                                                           ''''+DateToStr(Step.FDateBeg)+''''+','+
                                                           ''''+DateToStr(Step.FDateEnd)+''''+') VAL  ORDER BY VAL.SHOW_POSITION ASC ';

    Result:=ResStr;
end;

procedure TfrmHtmlReport.MonthShow_titleStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[0]=0)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[0]=1)
      then AStyle:=RAZD_STYLE;

      if (ARecord.Values[0]=2)
      then AStyle:=SM_STYLE;
end;

procedure TfrmHtmlReport.ViewLevel10DBBandedColumn1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[0]=0)
      then AStyle:=ST_STYLE;

      if (ARecord.Values[0]=1)
      then AStyle:=RAZD_STYLE;

      if (ARecord.Values[0]=2)
      then AStyle:=SM_STYLE;

end;

procedure TfrmHtmlReport.AssignStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[TYPE_OBJ.Index]=0)
      then begin
                 if ARecord.Values[Assign.Index]<0
                 then AStyle:=ST_STYLE_RED
                 else AStyle:=ST_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=1)
      then begin
                 if ARecord.Values[Assign.Index]<0
                 then AStyle:=RAZD_STYLE_RED
                 else AStyle:=RAZD_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=2)
      then begin
                 if ARecord.Values[Assign.Index]<0
                 then AStyle:=SM_STYLE_RED
                 else AStyle:=SM_STYLE;
      end;
end;

procedure TfrmHtmlReport.Assign_differStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
      if (ARecord.Values[TYPE_OBJ.Index]=0)
      then begin
                 if ARecord.Values[Assign_differ.Index]<0
                 then AStyle:=ST_STYLE_RED
                 else AStyle:=ST_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=1)
      then begin
                 if ARecord.Values[Assign_differ.Index]<0
                 then AStyle:=RAZD_STYLE_RED
                 else AStyle:=RAZD_STYLE;
      end;

      if (ARecord.Values[TYPE_OBJ.Index]=2)
      then begin
                 if ARecord.Values[Assign_differ.Index]<0
                 then AStyle:=SM_STYLE_RED
                 else AStyle:=SM_STYLE;
      end;
end;

procedure TfrmHtmlReport.N3Click(Sender: TObject);
begin
     Assign.Visible:=true;
     Assign_differ.Visible:=true;
end;

end.
