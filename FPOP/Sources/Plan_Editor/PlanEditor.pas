{******************************************************************************}
{*              Автоматизированная система «Формирование планов основного     *}
{*                         производства ГПП «Укрпромводчермет»                *}
{*              (c) Донецкий национальный университет, 2002-2006              *}
{******************************************************************************}

{                      Модуль "Редактор планов производства"                   }
{ Добавление, изменение и удаление документов плана. Печать и экспорт планов.  }
{ Автоматический рассчет стоимости продукции, автоматическое деление периодов  }
{ при изменении цены продукции. Возможность автоматического внесения поправок  }
{ в объемы продукции при несовпадениях при округлении.                         }
{                                               ответственный: Андрей Таганский}

unit PlanEditor;

interface                                  

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, Grids, ToolWin, ComCtrls, StdCtrls, pFIBStoredProc,
  FIBQuery, pFIBQuery, tagBaseTypes, ImgList, Menus, tagSys_Options, FR_Class, FR_DSet,
  TagLib, ActnList, FR_DBSet, FR_E_TXT, frOLEExl, FR_E_HTML2, FR_E_RTF, frRtfExp,
  Db, FIBDataSet, pFIBDataSet, cxInplaceContainer, cxTL, cxControls,
  cxGraphics, cxCustomData, cxStyles, cxTextEdit, cxMemo,
  cxCheckBox, cxContainer, cxEdit, cxMaskEdit, cxSpinEdit, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxCalendar, cxSplitter, Math, cxLookAndFeelPainters, cxButtons, cxLabel,
  cxCalc, dxStatusBar, dxBar, dxBarExtItems, cxCurrencyEdit,
  cxEditRepositoryItems;

  function AddSpaces(Str : string; SpacesCount : integer = -1) : string;
  function DelSpaces(Str : string; SpacesCount : integer = -1) : string;
  function RoundValueQ(Value : Extended) : String;
  function RoundValueC(Value : Extended) : string;
  function Order_Level (Display_Order, Max_Sub_Count : integer) : integer;

const
 SAVE_TO_PLAN_DATA = 0;
 SAVE_TO_TEMP      = 1;
 SPACES_COUNT      = 3;

 LAST_COL          = 10; // Index of the last statically created collumn

type
  TDocRecord = packed record
   _id_Doc      : integer;
   _id_Type_Doc : integer;
   _Name_Doc    : string;
   _Date_Doc    : TDateTime;
   _Date_Reg    : TDateTime;
   _is_Signed   : boolean;
  end;

  TStagesRecord = packed record
   _Link_To     : integer;
   _Modified    : string; // 'Add', 'Edit', 'Divided'
   _id_Doc      : integer;
   _id_Stage    : integer;
   _Date_Beg    : TDateTime;
   _Date_End    : TDateTime;
   _isItCostBeg : boolean;
  end;

  TStages = packed record
   _Link_To     : integer;
   _id_Stage    : integer;
  end;

  TPlanDataRecord = packed record
   _Modified        : string;
   _id_Department   : integer;
   _Name_Department : string;
   _id_Stage        : integer;
   _id_Product      : integer;
   _Name_Product    : string;
   _id_Unit_Meas    : integer;
   _Name_Unit_Meas  : string;
   _Coefficient     : integer;
   _id_Cat_Cust     : integer;
   _Name_Cat_Cust   : string;
   _Cost            : Currency;
   _Volume          : Currency;
   _Summa           : Currency;
   _id_Object       : integer;
   _Name_Object     : string;
   _Need_Cat_Cust   : boolean;
   _Need_Objects    : boolean;
   _DispOrder_Prod  : integer;
   _Display_Order   : integer;
  end;

  TSP_ResultRecord = packed record
   _Cost     : Currency;
   _Date_Beg : TDate;
   _Date_End : TDate;
  end;

  TYearDataRecord = packed record
   _id_Department : integer;
   _id_Product    : integer;
   _id_Cat_Cust   : integer;
   _id_Object     : integer;
   _Volume        : Currency;
   _Summa         : Currency;
  end;

  TProductRecord = packed record
   _id_Department   : integer;
   _Name_Department : string;
   _id_Product      : integer;
   _Name_Product    : string;
   _id_Cat_Cust     : integer;
   _Name_Cat_Cust   : string;
   _id_Object       : integer;
   _Name_Object     : string;
   _id_Unit_Meas    : integer;
   _Name_Unit_Meas  : string;
   _Coefficient     : integer;
   _Need_Cat_Cust   : boolean;
   _Need_Objects    : boolean;
   _DispOrder_Prod  : integer;
   _Display_Order   : integer;
  end;

  TLastCostRecord = packed record
   _id_Department : integer;
   _id_Product    : integer;
   _id_Cat_Cust   : integer;
   _Cost          : Currency;
  end;

  TProductCostRecord = packed record
   _id_Product  : integer;
   _id_Cat_Cust : integer;
   _id_Stage    : integer;
   _Cost        : Currency
  end;

  TDepPlanRecord = packed record
   _id_Plan         : integer;
   _id_Department   : integer;
   _Name_Department : string;
  end;

  TStagesNamesRecord = packed record
   _Name    : string;
   _Col_Num : integer;
  end;

  TObjectsRecord = packed record
   _id    : Integer;
   _Name  : String;
   _Plan  : boolean; //Указатель на то, что данный объект входит состав планов производства
   _Order : integer; // Порядок отображения
  end;

  TPrintRecord = packed record
   _Visible : boolean;
   _Value   : variant;
   _Width   : integer;
   _Height  : integer;
   _Left    : integer;
   _Top     : integer;
   _FStyle  : TFontStyles;
  end;

  TAdjustmentRecord = packed record
   _id_Stage    : integer;
   _id_Product  : integer;
   _id_Cat_Cust : integer;
   _Volume      : currency;
  end;

  PStagesRecord = ^TStagesRecord;

  TStagesArray      = array of TStagesRecord;
  TPlanDataArray    = array of TPlanDataRecord;
  TSP_Result        = array of TSP_ResultRecord;
  TYearDataArray    = array of TYearDataRecord;
  TLastCostArray    = array of TLastCostRecord;
  TProductArray     = array of TProductRecord;
  TProductCostArray = array of TProductCostRecord;
  TDepPlanArray     = array of TDepPlanRecord;
  TStagesNames      = array of TStagesNamesRecord;
  TPrintArray       = array of array of TPrintRecord;
  TAdjustmentArray  = array of TAdjustmentRecord; // Массив, в котором хранятся поправки

  TIntArray         = array of integer;

//  TT = class(TcxTreeList) // It is used to show protected method GetAbsoluteNode
//  end;

  TPlanEditorForm = class(TForm)
    RightPanel: TPanel;
    LeftPanel: TPanel;
    Query: TpFIBQuery;
    StoredProc: TpFIBStoredProc;
    Label3: TLabel;
    RowDataset: TfrUserDataset;
    ColDataset: TfrUserDataset;
    Report: TfrReport;
    ActionList1: TActionList;
    ActionExit: TAction;
    FontDialog: TFontDialog;
    RTFExport: TfrRTFExport;
    HTML2Export: TfrHTML2Export;
    SaveDialog: TSaveDialog;
    PageControl: TPageControl;
    TabSheetDep: TTabSheet;
    TabSheetProd: TTabSheet;
    DataSet: TpFIBDataSet;
    ProductTreeList: TcxTreeList;
    id_Product_Column: TcxTreeListColumn;
    Name_Column: TcxTreeListColumn;
    id_Cat_Cust_Column: TcxTreeListColumn;
    id_Object_Column: TcxTreeListColumn;
    Name_Unit_Meas_Column: TcxTreeListColumn;
    NeedCatCustColumn: TcxTreeListColumn;
    Need_Objects_Column: TcxTreeListColumn;
    id_Unit_Meas_Column: TcxTreeListColumn;
    Coefficient_Column: TcxTreeListColumn;
    id_Department_Column: TcxTreeListColumn;
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    GridDoc: TcxGridTableView;
    id_Doc_SG: TcxGridColumn;
    id_Type_Doc_SG: TcxGridColumn;
    Name_Doc_SG: TcxGridColumn;
    Date_Doc_SG: TcxGridColumn;
    Date_Reg_SG: TcxGridColumn;
    id_Unit_Meas_SG: TcxGridColumn;
    Name_Unit_Meas_SG: TcxGridColumn;
    Coefficient_SG: TcxGridColumn;
    DepTreeList: TcxTreeList;
    id_Product_Column2: TcxTreeListColumn;
    Name_Column2: TcxTreeListColumn;
    id_Cat_Cust_Column2: TcxTreeListColumn;
    id_Object_Column2: TcxTreeListColumn;
    Name_Unit_Meas_Column2: TcxTreeListColumn;
    NeedCatCustColumn2: TcxTreeListColumn;
    Need_Objects_Column2: TcxTreeListColumn;
    id_Unit_Meas_Column2: TcxTreeListColumn;
    Coefficient_Column2: TcxTreeListColumn;
    id_Department_Column2: TcxTreeListColumn;
    Splitter: TcxSplitter;
    ImageList2: TImageList;
    WaitPanel: TPanel;
    Display_Order_Column: TcxTreeListColumn;
    Display_Order_Column2: TcxTreeListColumn;
    StatusBar1: TdxStatusBar;
    is_Signed_SG: TcxGridColumn;
    DocBarDockControl: TdxBarDockControl;
    BarManager: TdxBarManager;
    AddDocButton: TdxBarButton;
    CloseButton: TdxBarButton;
    DelDocButton: TdxBarButton;
    EditNameDocBtn: TdxBarButton;
    SaveButton: TdxBarButton;
    SignButton: TdxBarButton;
    EditDocButton: TdxBarButton;
    PlanBarDockControl: TdxBarDockControl;
    EditButton: TdxBarButton;
    AddButton: TdxBarSubItem;
    AddProductButton: TdxBarButton;
    AddObjectButton: TdxBarButton;
    DelButton: TdxBarButton;
    StagesButton: TdxBarButton;
    SetCDataBtn: TdxBarButton;
    FontPrintButton: TdxBarButton;
    PreviewButton: TdxBarSubItem;
    PrintButton: TdxBarSubItem;
    ExportButton: TdxBarSubItem;
    OptionsBtn: TdxBarSubItem;
    SpinEditQ: TdxBarSpinEdit;
    SpinEditC: TdxBarSpinEdit;
    ApplyButton: TdxBarButton;
    CancelButton: TdxBarButton;
    SimplePreviewBtn: TdxBarButton;
    ComplicatedPreviewBtn: TdxBarButton;
    SimplePrintBtn: TdxBarButton;
    ComplicatedPrintBtn: TdxBarButton;
    SimpleExpBtn: TdxBarSubItem;
    ComplicatedExpBtn: TdxBarSubItem;
    RTFButton: TdxBarButton;
    HTMLButton: TdxBarButton;
    ExcelButton: TdxBarButton;
    RTFButtonC: TdxBarButton;
    HTMLButtonC: TdxBarButton;
    ExcelButtonC: TdxBarButton;
    TotalObjects: TdxBarButton;
    PrintDate: TdxBarButton;
    CostPrint: TdxBarButton;
    NaturalPrint: TdxBarButton;
    DocPopupMenu: TPopupMenu;
    pAddDocToolButton: TMenuItem;
    pEditNameDocBtn: TMenuItem;
    pEditDocButton: TMenuItem;
    pDelDocButton: TMenuItem;
    DepTreePopupMenu: TPopupMenu;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    ProductTreePopupMenu: TPopupMenu;
    pAddButton: TMenuItem;
    pAddProductButton: TMenuItem;
    pAddObjectButton: TMenuItem;
    pEditButton: TMenuItem;
    pDelButton: TMenuItem;
    N12: TMenuItem;
    pStagesButton: TMenuItem;
    N14: TMenuItem;
    pPreviewButton: TMenuItem;
    pPrintButton: TMenuItem;
    N17: TMenuItem;
    ExpandButton: TMenuItem;
    CollapseButton: TMenuItem;
    N1: TMenuItem;
    pApplyButton: TMenuItem;
    pCancelButton: TMenuItem;
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
    cxTreeListStyleSheet1: TcxTreeListStyleSheet;
    pSignButton: TMenuItem;
    N2: TMenuItem;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    AdjustButton: TdxBarButton;
    ExcelExport: TfrOLEExcelExport;
    ReportSumsPreview: TdxBarButton;
    ReportSumsPrint: TdxBarButton;
    dxBarButton1: TdxBarButton;
    SumExpBtn: TdxBarSubItem;
    RTFButtonS: TdxBarButton;
    HTMLButtonS: TdxBarButton;
    ExcelButtonS: TdxBarButton;
    CellWidthSpinEdit: TdxBarEdit;
    Image1: TImage;
    EditRepository: TcxEditRepository;
    EditRepositoryButtonItem1: TcxEditRepositoryButtonItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddProductButtonClick(Sender: TObject);
    procedure AddObjectButtonClick(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure DelProductButtonClick(Sender: TObject);
    procedure DelCatCustButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure EditDocButtonClick(Sender: TObject);
    procedure DelDocButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ProductTreeListKeyPress(Sender: TObject; var Key: Char);
    procedure EditButtonClick(Sender: TObject);
    procedure StagesButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionExitExecute(Sender: TObject);
    procedure ExpandButtonClick(Sender: TObject);
    procedure CollapseButtonClick(Sender: TObject);
    procedure ProductTreeListContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure AddOnDerivedPlansClick(Sender: TObject);
    procedure AddDocButtonClick(Sender: TObject);
    procedure NewCostCalcButtonClick(Sender: TObject);
    procedure FontPrintButtonClick(Sender: TObject);
    procedure ProductTreeListClick(Sender: TObject);
    procedure RTFButtonClick(Sender: TObject);
    procedure ExcelButtonClick(Sender: TObject);
    procedure HTMLButtonClick(Sender: TObject);
    procedure ExportButtonClick(Sender: TObject);
    procedure TotalObjectsClick(Sender: TObject);
    procedure PrintDateClick(Sender: TObject);
    procedure SpinEditQChange(Sender: TObject);
    procedure SpinEditCChange(Sender: TObject);
    procedure SpinEditCKeyPress(Sender: TObject; var Key: Char);
    procedure NaturalPrintClick(Sender: TObject);
    procedure CostPrintClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure SimplePrintBtnClick(Sender: TObject);
    procedure ComplicatedPrintBtnClick(Sender: TObject);
    procedure SimplePreviewBtnClick(Sender: TObject);
    procedure ComplicatedPreviewBtnClick(Sender: TObject);
    procedure SetCDataBtnClick(Sender: TObject);
    procedure ProductTreeListEdited(Sender: TObject;
      AColumn: TcxTreeListColumn);
    procedure ProductTreeListEditing(Sender: TObject;
      AColumn: TcxTreeListColumn; var Allow: Boolean);
    procedure GridDocFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure DepTreeListClick(Sender: TObject);
    procedure EditNameDocBtnClick(Sender: TObject);
    procedure ReportBeginBand(Band: TfrBand);
    procedure DepTreeListCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure ProductTreeListCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure SignButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdjustButtonClick(Sender: TObject);
    procedure ProductTreeListFocusedColumnChanged(Sender: TObject;
      APrevFocusedColumn, AFocusedColumn: TcxTreeListColumn);
    procedure ProductTreeListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure CellWidthSpinEditCurChange(Sender: TObject);
    procedure ReportSumsPreviewClick(Sender: TObject);
    procedure ReportSumsPrintClick(Sender: TObject);
    procedure DoColumnGetEditProperties(
      Sender: TcxTreeListColumn; ANode: TcxTreeListNode;
      var EditProperties: TcxCustomEditProperties);
    procedure EditRepositoryButtonItem1PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure GridDocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
//    procedure AddButtonClick(Sender: TObject);
//    procedure RowDatasetNext(Sender: TObject); // Sets is_Cost_Beg for the MainPlan's Stages

  public
   Name_Dep          : string;


   id_Department     : integer;
   DepName           : string;
   id_Plan           : integer;
   id_Year_Plan      : integer;
   Plan_Name         : string;
   Plan_Date_Beg     : TDate;
   Plan_Date_End     : TDate;

   YearPlan          : boolean; // is it year plan?
   MainPlan          : boolean; // is it summary plan?
   NeedRefresh       : boolean; // For year plan, wich has edited derived plans


   ColCount          : integer;
   RowCount          : integer;

   StagesArray       : TStagesArray;
   TempStagesArray   : TStagesArray;
   PlanDataArray     : TPlanDataArray;
   TempPlanDataArray : TPlanDataArray;
   NewPlanDataArray  : TPlanDataArray;
   YearDataArray     : TYearDataArray;
   NewStagesArray    : TStagesArray;
   id_New_Stage      : integer;
   EditedDocArray    : array of integer;
   DelDocArray       : array of integer;
   DelStagesArray    : array of integer;
   Adjustments       : TAdjustmentArray;

   FixedStages       : TStagesArray;
   NewFixedStages    : TStagesArray;
   TempFixedStages   : TStagesArray;

   FirstPrint        : boolean; // Shows that it is the first time print or not

   EditValue         : currency;

   destructor Destroy; override;

   procedure SaveWork(GetQuery : boolean);
   procedure RefreshData;

   procedure SelectAll;
   procedure CalcSumms(InputStages, InputFixed : TStagesArray; id_Doc, Coefficient : integer);
   procedure CalcSummsDep(InputStages, InputFixed : TStagesArray; id_Doc, Coefficient : integer);
   procedure CalcSummsProd(InputStages, InputFixed : TStagesArray; id_Doc, Coefficient : integer);

   procedure EditStages;
   procedure AddDocMore(id_Doc : integer);
   procedure EnableButtons(Enable : boolean);
   procedure DocSelect(id_Plan : integer);
   procedure StagesSelect(id_Doc : integer);
   procedure PlanDataSelect;
   function  AddDoc : boolean;
   procedure ReportBeginDocComplicated;
   procedure ReportBeginDocSimple;
   procedure SetContractsData(Fixed : TStagesArray; Stages : TStagesArray;
             TreeList : TcxTreeList; id_Doc : integer);
   procedure NullTheTreeData(TreeList : TcxTreeList);
   procedure GetSummaryPlanData;
   procedure DepStagesDeviding(OldFixed, Fixed, OldStages, Stages : TStagesArray;
             DocArray : TIntArray);
   procedure FillSummaryPlanByProduct(InputStagesArray, InputFixed : TStagesArray;
             InputPlanDataArray : TPlanDataArray; id_Doc : integer);
   procedure FillSummaryPlanByDeps(InputStagesArray, InputFixed : TStagesArray;
             InputPlanDataArray : TPlanDataArray; id_Doc : integer);
   procedure AddNodeDep(PlanDataRecord : TPlanDataRecord; Stage_id : integer;
             Col_Name : string; Cost_Beg : boolean);
   procedure AddNodeProd(PlanDataRecord : TPlanDataRecord; Stage_id : integer;
             Col_Name : string; Cost_Beg : boolean);
   procedure AddSumNodeDep;
   procedure FillSumNodeDep; // Fills SumNode by summing the data from the nodes of derived departments
   procedure SavePlanData(InputStages, Fixed : TStagesArray; SaveToWhat : integer;
             TreeList : TcxTreeList);
   procedure SavePlanDataDep(InputStages, Fixed : TStagesArray; SaveToWhat : integer);
   procedure MakeTreeList(InputArray, InputFixed : TStagesArray;
             id_Doc : integer; TreeList : TcxTreeList);
   procedure TreeListClearNodes(TreeList : TcxTreeList);
   procedure SaveResult;
   procedure PrintReportSimple(const ParName: String;
     var ParValue: Variant);
   procedure PrintReportComplicated(const ParName: String;
     var ParValue: Variant);
   procedure PrintReportSums(const ParName: String;
     var ParValue: Variant);
   procedure EditCatCust;
   procedure EditObject;
   procedure FillProductTreeList(isItNewDoc : boolean; InputStagesArray,
             InputFixed : TStagesArray; InputPlanDataArray : TPlanDataArray;
             id_Doc, Coefficient : integer);
   procedure FillOnlyData(Stages, Fixed : TStagesArray; PlanData : TPlanDataArray;
             id_Doc : integer);
   procedure FillOnlyDataWithCompare(OldStages, NewStages,                           //Deviding quantity of products
             Fixed : TStagesArray; DataArray : TPlanDataArray; id_Doc : integer);    //between the stages
   procedure StagesDeviding(Stages : TStagesArray; SP_Result : TSP_Result);
   procedure ReadYearPlan;
   procedure FillYearColumns;
   procedure FillYearColumnsDep;
   procedure FillYearColumnsProd;
   procedure SortObjects_and_CatCust;
   procedure GetDerivedPlansData;
   procedure AddNode(InputStagesRecord, InputFixedRecord : TStagesRecord;
             InputDataRecord : TPlanDataRecord; TreeList : TcxTreeList;
             OnlyFixed : boolean = False);
   procedure Analyze_SP_Result(var SP_Result : TSP_Result; ADate_Beg, ADate_End : TDate);
   procedure SetCostBeg(AFixed, AStages : TStagesArray; APlanData : TPlanDataArray);
   procedure SetAdjustments(InFixed, InStages : TStagesArray; id_Doc : integer; Coefficient : integer);
   procedure DelAdjustment(NumRecord : integer);
   procedure AddOnExistingPlan(id_Doc : integer);
   procedure FillWithNewCost(Fixed, Stages : TStagesArray; PlanData : TPlanDataArray);
   function  BeforePrintSimple : boolean;
   function  BeforePrintComplicated : boolean;
   function  BeforePrintSums : boolean;
   function  CreatePrintArray(PageWidth, LeftSpace, RightSpace, BlockSpace : integer;
             Stages : TStagesNames) : TPrintArray;

   function CreateColumn(TreeList : TcxTreeList; BandNum : integer; ColName,
            CaptionText : string; CaptionAlignHorz: TAlignment;
            CaptionAlignVert : TcxAlignmentVert; TextAlignHorz: TAlignment;
            ColWidth : integer; ColVisible, ColSorting : boolean; Tag : integer = 0) : TcxTreeListColumn;
  end;

var
 PlanEditorForm    : TPlanEditorForm;

implementation

uses DataModule, dt_Doc_Form_Add, fpop_PackageLoader,
     dt_Stage_Add, New_Stages, sp_Object_Form, Add_Product, AddProduct, MainU,
     Variants, cxRadioGroup, EditNameDoc, Types, DateUtils, View_Dogs_Data;

var
  RoundCountQ       : byte;
  RoundCountC       : byte;



  ProductArray      : TProductArray;

  PrintFont         : TFont;
  LastCol           : integer;

  ProdNameWidth     : integer;
  DefCellWidth      : integer;
  DefCellHeight     : integer;
  LeftSpace         : integer;
  RightSpace        : integer;
  TopSpace          : integer;
  OffSetY           : integer; // Space between the blocks in report
  PrintArray        : TPrintArray;

  NatCount          : integer; // Count of cols with natural value of product
  CostCount         : integer; // Count of cols with cost value of product
  FirstCostCol      : integer; // Number of col from which cost values of product begins

  ProdCount         : integer;

  PageBottom        : integer;
  PageTop           : integer;
  PageWidth         : integer;
  CellWidth         : integer;

  StagesNames       : TStagesNames;

  ChangeProduct     : TProductArray; // This array store the information about the product in focused node
                                     // before the page control changing

  TempTreeList      : TcxTreeList;

{$R *.DFM}

destructor TPlanEditorForm.Destroy;
begin
 PlanEditorForm := nil;
 inherited;
end;

function AddSpaces(Str : string; SpacesCount : integer = -1) : string;
begin
 if SpacesCount = -1 then SpacesCount := SPACES_COUNT;

 SetLength(Result, SpacesCount);
 FillChar(Result[1], Length(Result), Ord(' '));

 Result := Result + Str;
end;

function DelSpaces(Str : string; SpacesCount : integer = -1) : string;
begin
 if SpacesCount = -1 then SpacesCount := SPACES_COUNT;

 Result :=  Copy(Str, SpacesCount + 1, Length(Str) - SpacesCount + 1);
end;

function RoundValueQ(Value : Extended) : String;
{var
 s : string;
 i : integer;
 p : integer;}
begin
 Result := FloatToStrF(Value, ffFixed, 100, RoundCountQ);

{ p := Pos(',', s);
 if (p = 0) and (RoundCountQ > 0) then s := s + ',';}

// Result := s;

{ for i := 1 to RoundCountQ - (Length(s) - p) do
  Result := Result + '0';}
end;

function RoundValueC(Value : Extended) : String;
{var
 s : string;
 i : integer;
 p : integer;}
begin
 Result := FloatToStrF(Value, ffFixed, 100, RoundCountC);

{ p := Pos(',', s);
 if (p = 0) and (RoundCountC > 0) then s := s + ',';}

// Result := s;

{ for i := 1 to RoundCountC - (Length(s) - p) do
  Result := Result + '0';}
end;

function Order_Level (Display_Order, Max_Sub_Count : integer) : integer;
begin
 Result := Display_Order;

 while Result < Power(SYS_MAX_CHILD_COUNT, Max_Sub_Count) do
  Result := Result * SYS_MAX_CHILD_COUNT;
end;

procedure RowsClear(Sender : TObject);
begin
 TStringGrid(Sender).RowCount := 2;
 TStringGrid(Sender).Rows[1].Clear;
end;

procedure DelArrayVar(InputArray : TPlanDataArray; VarNum : integer);
var
 i : integer;
begin
 for i := VarNum to Length(InputArray) - 2 do
  InputArray[i] := InputArray[i + 1];

 SetLength(InputArray, Length(InputArray) - 1);
end;

procedure TPlanEditorForm.DoColumnGetEditProperties(
  Sender: TcxTreeListColumn; ANode: TcxTreeListNode;
  var EditProperties: TcxCustomEditProperties);
begin
 EditProperties := EditRepositoryButtonItem1.Properties;
end;

///////////~~~~~~~~~~~~~~~~~~~~~~~/////////////////

procedure TPlanEditorForm.CalcSumms(InputStages, InputFixed : TStagesArray;
          id_Doc, Coefficient : integer);
var
 i, j       : integer;
 t, k       : integer;
 QntSum     : Currency; //Total quantity of product by categories
 TotalSum   : Currency; //Total cost of those products
 Cost       : Currency;
 a          : integer;
 s          : string;
 ObjectSum  : Currency;

 Bool       : boolean;

 Sum        : Currency; // Quantity sum by devoted stages
 CostSum    : Currency; // Cost sum by devoted stages
 Index      : integer;
 Index2     : integer;
begin
 if (ProductTreeList.Count = 0) or (ProductTreeList.Bands.Count <= 2) then Exit;

 ProductTreeList.BeginUpdate;
 FillYearColumns;

 for i := 0 to ProductTreeList.Count - 1 do begin
  if ProductTreeList.Items[i].Values[0] < -1 then Continue;

  if ProductTreeList.Items[i].Values[5] then begin
   for j := 0 to ProductTreeList.Items[i].Count - 1 do begin // Summing by rows
    if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;

    if ProductTreeList.Items[i].Items[j].Values[3] > 0 then begin
     QntSum := 0;
     for t := 0 to Length(InputFixed) - 1 do begin
      if InputFixed[t]._id_Doc <> id_Doc then Continue;
      Bool := True;
      Sum  := 0;

      for k := 0 to Length(InputStages) - 1 do begin
       if InputStages[k]._Link_To <> InputFixed[t]._id_Stage then Continue;
       Bool := False;

       Index := ProductTreeList.ColumnByName('QntCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

       if VarIsNull(ProductTreeList.Items[i].Items[j].Values[Index]) then
        ProductTreeList.Items[i].Items[j].Values[Index] := 0;

       ProductTreeList.Items[i].Items[j].Values[Index] := RoundValueQ(ProductTreeList.Items[i].Items[j].Values[Index]);

       Sum := Sum + ProductTreeList.Items[i].Items[j].Values[Index];
      end;

      Index := ProductTreeList.ColumnByName('FQntCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;

      if not Bool then
       ProductTreeList.Items[i].Items[j].Values[Index] := Sum
      else if VarIsNull(ProductTreeList.Items[i].Items[j].Values[Index]) then
       ProductTreeList.Items[i].Items[j].Values[Index] := 0;

      ProductTreeList.Items[i].Items[j].Values[Index] := RoundValueQ(ProductTreeList.Items[i].Items[j].Values[Index]);

      QntSum := QntSum + ProductTreeList.Items[i].Items[j].Values[Index];
     end;

     ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('TotalQntCol').ItemIndex] := QntSum;
    end;

    if ProductTreeList.Items[i].Items[j].Values[2] > 0 then begin
     QntSum   := 0;
     TotalSum := 0;
     for t := 0 to Length(InputFixed) - 1 do begin
      if InputFixed[t]._id_Doc <> id_Doc then Continue;

      Sum     := 0;
      CostSum := 0;
      Bool    := True;
      for k := 0 to Length(InputStages) - 1 do begin
       if InputStages[k]._id_Doc <> id_Doc then Continue;
       if InputStages[k]._Link_To <> InputFixed[t]._id_Stage then Continue;
       Bool := False;

       Index := ProductTreeList.ColumnByName('QntCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

       if VarIsNull(ProductTreeList.Items[i].Items[j].Values[Index]) then
        ProductTreeList.Items[i].Items[j].Values[Index] := 0;

       ProductTreeList.Items[i].Items[j].Values[Index] := RoundValueQ(ProductTreeList.Items[i].Items[j].Values[Index]);

       Sum := Sum + ProductTreeList.Items[i].Items[j].Values[Index];

       a := ProductTreeList.Columns[Index].VisibleIndexAtBand;
       while a < ProductTreeList.Bands[1].VisibleColumnCount do begin
        if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
        else Break;
       end;

       if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
       then begin
        if VarIsNull(ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex]) then
         ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex] := 0;
        Cost := ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex];
       end
       else Cost := 0;

       Index2 := ProductTreeList.ColumnByName('CostCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;
       ProductTreeList.Items[i].Items[j].Values[Index2] := RoundValueC(ProductTreeList.Items[i].Items[j].Values[Index]
        * Cost * ProductTreeList.Items[i].Values[8] / Coefficient);
       CostSum := CostSum + ProductTreeList.Items[i].Items[j].Values[Index]
        * Cost * ProductTreeList.Items[i].Values[8] / Coefficient;
      end;

      Index := ProductTreeList.ColumnByName('FQntCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;

      if not Bool then begin
       ProductTreeList.Items[i].Items[j].Values[Index] := Sum;
       Index2 := ProductTreeList.ColumnByName('FCostCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;
       ProductTreeList.Items[i].Items[j].Values[Index2] := RoundValueC(CostSum);
      end
      else begin
       if VarIsNull(ProductTreeList.Items[i].Items[j].Values[Index]) then
        ProductTreeList.Items[i].Items[j].Values[Index] := 0;

       ProductTreeList.Items[i].Items[j].Values[Index] := RoundValueQ(ProductTreeList.Items[i].Items[j].Values[Index]);

       a := ProductTreeList.Columns[Index].VisibleIndexAtBand;
       while a < ProductTreeList.Bands[1].VisibleColumnCount do begin
        if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
        else Break;
       end;

       if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
       then begin
        if VarIsNull(ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex]) then
         ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex] := 0;
        Cost := ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex];
       end
       else Cost := 0;

       Index2 := ProductTreeList.ColumnByName('FCostCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;
       ProductTreeList.Items[i].Items[j].Values[Index2]
        := RoundValueC(ProductTreeList.Items[i].Items[j].Values[Index]
        * Cost * ProductTreeList.Items[i].Values[8] / Coefficient);
      end;


      if VarIsNull(ProductTreeList.Items[i].Items[j].Values[Index2]) then
       ProductTreeList.Items[i].Items[j].Values[Index2] := 0;

      QntSum   := QntSum + ProductTreeList.Items[i].Items[j].Values[Index];
      TotalSum := TotalSum + ProductTreeList.Items[i].Items[j].Values[Index2];
     end;
     ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('TotalQntCol').ItemIndex] := QntSum;
     ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('TotalCostCol').ItemIndex] := RoundValueC(TotalSum);
    end;

    if not YearPlan then begin
     ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex]
     := Currency(ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex])
     + Currency(ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('TotalQntCol').ItemIndex]);

     if ProductTreeList.Items[i].Items[j].Values[2] > 0 then
      ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex]
      := RoundValueC(Currency(ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex])
      + Currency(ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('TotalCostCol').ItemIndex]))
     else
      ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex] := Null;
    end;
   end;

   for t := LAST_COL + 1 to ProductTreeList.ColumnCount - 1 do begin //Summing by columns
    s := Copy(ProductTreeList.Columns[t].Name, 0, 6);
    if s = 'PriceC' then Continue;
    Sum := 0;
    for j := 0 to ProductTreeList.Items[i].Count - 1 do begin
     if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;
     if ProductTreeList.Items[i].Items[j].Values[2] <= 0 then Continue;
     if VarIsNull(ProductTreeList.Items[i].Items[j].Values[t]) then ProductTreeList.Items[i].Items[j].Values[t] := 0;

     Sum := Sum + ProductTreeList.Items[i].Items[j].Values[t];
    end;
    if (s = 'CostCo') or (s = 'FCostC') or (s = 'TotalC') or (s ='YearCo') then
     ProductTreeList.Items[i].Values[t] := RoundValueC(Sum)
    else
     ProductTreeList.Items[i].Values[t] := Sum;
   end;
  end
  else begin
   QntSum   := 0;
   TotalSum := 0;

   for t := 0 to Length(InputFixed) - 1 do begin
    if InputFixed[t]._id_Doc <> id_Doc then Continue;

    Bool := True;
    Sum  := 0;
    CostSum := 0;
    for k := 0 to Length(InputStages) - 1 do begin
     if InputStages[k]._Link_To <> InputFixed[t]._id_Stage then Continue;
     Bool := False;

     Index := ProductTreeList.ColumnByName('QntCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

     if VarIsNull(ProductTreeList.Items[i].Values[Index]) then
      ProductTreeList.Items[i].Values[Index] := 0;

     ProductTreeList.Items[i].Values[Index] := RoundValueQ(ProductTreeList.Items[i].Values[Index]); 

     Sum := Sum + ProductTreeList.Items[i].Values[Index];

     a := ProductTreeList.Columns[Index].VisibleIndexAtBand;
     while a < ProductTreeList.Bands[1].VisibleColumnCount do begin
      if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
      else Break;
     end;

     if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
     then begin
      if VarIsNull(ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex]) then
       ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex] := 0;
      Cost := ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex];
     end
     else Cost := 0;

     Index2 := ProductTreeList.ColumnByName('CostCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;
     ProductTreeList.Items[i].Values[Index2] := RoundValueC(ProductTreeList.Items[i].Values[Index]
      * Cost * ProductTreeList.Items[i].Values[8] / Coefficient);
     CostSum := CostSum + ProductTreeList.Items[i].Values[Index]
      * Cost * ProductTreeList.Items[i].Values[8] / Coefficient;
    end;

    Index := ProductTreeList.ColumnByName('FQntCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;

    if not Bool then begin
     ProductTreeList.Items[i].Values[Index] := Sum;
     Index2 := ProductTreeList.ColumnByName('FCostCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;
     ProductTreeList.Items[i].Values[Index2] := RoundValueC(CostSum);
    end
    else begin
     if VarIsNull(ProductTreeList.Items[i].Values[Index]) then
      ProductTreeList.Items[i].Values[Index] := 0;

     ProductTreeList.Items[i].Values[Index] := RoundValueQ(ProductTreeList.Items[i].Values[Index]); 

     a := ProductTreeList.Columns[Index].VisibleIndexAtBand;
     while a < ProductTreeList.Bands[1].VisibleColumnCount do begin
      if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
      else Break;
     end;

     if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
     then begin
      if VarIsNull(ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex]) then
       ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex] := 0;
      Cost := ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex];
     end
     else Cost := 0;

     Index2 := ProductTreeList.ColumnByName('FCostCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;
     ProductTreeList.Items[i].Values[Index2] := RoundValueC(ProductTreeList.Items[i].Values[Index]
      * Cost * ProductTreeList.Items[i].Values[8] / Coefficient);
    end;

    QntSum   := QntSum + ProductTreeList.Items[i].Values[Index];
    TotalSum := TotalSum + ProductTreeList.Items[i].Values[Index2];
   end;
   ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('TotalQntCol').ItemIndex] :=  QntSum;
   ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('TotalCostCol').ItemIndex] := RoundValueC(TotalSum);

   if ProductTreeList.Items[i].Values[6] and ProductTreeList.Items[i].HasChildren then begin
    for j := 0 to ProductTreeList.Items[i].Count - 1 do begin
     if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;
     if ProductTreeList.Items[i].Items[j].Values[3] <= 0 then Continue;

     QntSum := 0;
     for t := 0 to Length(InputFixed) - 1 do begin
      if InputFixed[t]._id_Doc <> id_Doc then Continue;
      Bool := True;
      Sum  := 0;

      for k := 0 to Length(InputStages) - 1 do begin
       if InputStages[k]._Link_To <> InputFixed[t]._id_Stage then Continue;
       Bool := False;

       Index := ProductTreeList.ColumnByName('QntCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

       if VarIsNull(ProductTreeList.Items[i].Items[j].Values[Index]) then
        ProductTreeList.Items[i].Items[j].Values[Index] := 0;

       ProductTreeList.Items[i].Items[j].Values[Index] := RoundValueQ(ProductTreeList.Items[i].Items[j].Values[Index]);

       Sum := Sum + ProductTreeList.Items[i].Items[j].Values[Index];
      end;

      Index := ProductTreeList.ColumnByName('FQntCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;

      if not Bool then
       ProductTreeList.Items[i].Items[j].Values[Index] := Sum
      else if VarIsNull(ProductTreeList.Items[i].Items[j].Values[Index]) then
       ProductTreeList.Items[i].Items[j].Values[Index] := 0;

      ProductTreeList.Items[i].Items[j].Values[Index] := RoundValueQ(ProductTreeList.Items[i].Items[j].Values[Index]); 

      QntSum := QntSum + ProductTreeList.Items[i].Items[j].Values[Index];
     end;

     ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('TotalQntCol').ItemIndex] := QntSum;

     if not YearPlan then
      ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex]
      := Currency(ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex])
      + Currency(ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('TotalQntCol').ItemIndex]);
    end;
   end;

   if not YearPlan then begin
    ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex]
    := Currency(ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex])
    + Currency(ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('TotalQntCol').ItemIndex]);

    ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex]
    := RoundValueC(Currency(ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex])
    + Currency(ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('TotalCostCol').ItemIndex]))
   end;
  end;
 end;

 t := LAST_COL + 1;
 while t < ProductTreeList.ColumnCount do begin
  s := Copy(ProductTreeList.Columns[t].Name, 0, 6);
  if (s <> 'CostCo') and (s <> 'TotalC')
  and (s <> 'FCostC') and (s <> 'YearCo') then begin
   if TotalObjects.Down then begin
    if (s = 'QntCol') or (s = 'FQntCo') or (s = 'TotalQ') or (s = 'YearQn') then begin
     for i := 0 to ProductTreeList.Count - 1 do begin
      if ProductTreeList.Items[i].Values[0] < -1 then Continue;
      if not ProductTreeList.Items[i].Values[6] then Continue;
      if ProductTreeList.Items[i].Count = 0 then Continue;
      ObjectSum := 0;
      for j := 0 to ProductTreeList.Items[i].Count - 1 do begin
       if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;

       if ProductTreeList.Items[i].Items[j].Values[3] > 0 then begin
        if VarIsNull(ProductTreeList.Items[i].Items[j].Values[t]) then
         ProductTreeList.Items[i].Items[j].Values[t] := 0;

        ObjectSum := ObjectSum + ProductTreeList.Items[i].Items[j].Values[t];
       end;
      end;

      ProductTreeList.Items[i].GetLastChild.Values[t] := ObjectSum;
     end;
    end;
   end;

   Inc(t);
   Continue;
  end
  else begin
   if YearPlan and (s ='YearCo') then begin
    Inc(t);
    Continue;
   end;

   Sum := 0;
   for i := 0 to ProductTreeList.Count - 1 do begin
    if ProductTreeList.Items[i].Values[0] < -1 then Continue;
    if VarIsNull(ProductTreeList.Items[i].Values[t]) then Continue;

    Sum := Sum + ProductTreeList.Items[i].Values[t];
   end;

   ProductTreeList.LastNode.Values[t] := RoundValueC(Sum);
   Inc(t);
  end;
 end;

// Filling Unit_Meas in Price Columns

{ for i := 0 to ProductTreeList.Count - 2 do
  for j := 0 to ProductTreeList.Bands[1].VisibleColumnCount - 1 do
   if Copy(ProductTreeList.Bands[1].Columns[j].Name, 0, 6) = 'PriceC' then
    ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].Columns[j].ItemIndex] := ProductTreeList.Items[i].Values[10];
}
 ProductTreeList.EndUpdate;
end;

////////------------///////////

procedure TPlanEditorForm.CalcSummsDep(InputStages,
  InputFixed: TStagesArray; id_Doc, Coefficient: integer);
var
 d          : integer;
 i, j       : integer;
 t, k       : integer;
 QntSum     : Currency; //Total quantity of product by categories
 TotalSum   : Currency; //Total cost of those products
 Cost       : Currency;
 a          : integer;
 s          : string;

 DepNode    : TcxTreeListNode;

 Bool       : boolean;

 Sum        : Currency; // Quantity sum by devoted stages
 CostSum    : Currency; // Cost sum by devoted stages
 Index      : integer;
 Index2     : integer;
begin
 if (DepTreeList.Count = 0) or (DepTreeList.Bands.Count <= 2) then Exit;

 DepTreeList.BeginUpdate;

 FillYearColumnsDep;

 for d := 0 to DepTreeList.Count - 1 do begin
  DepNode := DepTreeList.Items[d];

  for i := 0 to DepNode.Count - 1 do begin
   if DepNode.Items[i].Values[5] then begin
    for j := 0 to DepNode.Items[i].Count - 1 do begin // Summing by rows
     if DepNode.Items[i].Items[j].Values[0] < -1 then Continue;

     if DepNode.Items[i].Items[j].Values[2] > 0 then begin
      QntSum   := 0;
      TotalSum := 0;
      for t := 0 to Length(InputFixed) - 1 do begin
       if InputFixed[t]._id_Doc <> id_Doc then Continue;

       Sum     := 0;
       CostSum := 0;
       Bool    := True;
       for k := 0 to Length(InputStages) - 1 do begin
        if InputStages[k]._id_Doc <> id_Doc then Continue;
        if InputStages[k]._Link_To <> InputFixed[t]._id_Stage then Continue;
        Bool := False;

        Index := DepTreeList.ColumnByName('QntCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

        if VarIsNull(DepNode.Items[i].Items[j].Values[Index]) then
         DepNode.Items[i].Items[j].Values[Index] := 0;

        Sum := Sum + DepNode.Items[i].Items[j].Values[Index];

        a := DepTreeList.Columns[Index].VisibleIndexAtBand;
        while a < DepTreeList.Bands[1].VisibleColumnCount do begin
         if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
         else Break;
        end;

        if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
        then begin
         if VarIsNull(DepNode.Items[i].Items[j].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex]) then
          DepNode.Items[i].Items[j].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex] := 0;
         Cost := DepNode.Items[i].Items[j].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex];
        end
        else Cost := 0;

        Index2 := DepTreeList.ColumnByName('CostCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;
        DepNode.Items[i].Items[j].Values[Index2] := RoundValueC(DepNode.Items[i].Items[j].Values[Index]
         * Cost * DepNode.Items[i].Values[8] / Coefficient);
        CostSum := CostSum + DepNode.Items[i].Items[j].Values[Index]
         * Cost * DepNode.Items[i].Values[8] / Coefficient;
       end;

       Index := DepTreeList.ColumnByName('FQntCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;

       if not Bool then begin
        DepNode.Items[i].Items[j].Values[Index] := Sum;
        Index2 := DepTreeList.ColumnByName('FCostCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;
        DepNode.Items[i].Items[j].Values[Index2] := RoundValueC(CostSum);
       end
       else begin
        if VarIsNull(DepNode.Items[i].Items[j].Values[Index]) then
         DepNode.Items[i].Items[j].Values[Index] := 0;

        a := DepTreeList.Columns[Index].VisibleIndexAtBand;
        while a < DepTreeList.Bands[1].VisibleColumnCount do begin
         if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
         else Break;
        end;

        if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
        then begin
         if VarIsNull(DepNode.Items[i].Items[j].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex]) then
          DepNode.Items[i].Items[j].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex] := 0;
         Cost := DepNode.Items[i].Items[j].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex];
        end
        else Cost := 0;

        Index2 := DepTreeList.ColumnByName('FCostCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;
        DepNode.Items[i].Items[j].Values[Index2]
         := RoundValueC(DepNode.Items[i].Items[j].Values[Index]
         * Cost * DepNode.Items[i].Values[8] / Coefficient);
       end;

       QntSum   := QntSum + DepNode.Items[i].Items[j].Values[Index];
       TotalSum := TotalSum + DepNode.Items[i].Items[j].Values[Index2];
      end;
      DepNode.Items[i].Items[j].Values[DepTreeList.ColumnByName('TotalQntCol').ItemIndex] := QntSum;
      DepNode.Items[i].Items[j].Values[DepTreeList.ColumnByName('TotalCostCol').ItemIndex] := RoundValueC(TotalSum);
     end;

     if not YearPlan then begin
      DepNode.Items[i].Items[j].Values[DepTreeList.ColumnByName('YearQntColumn').ItemIndex]
      := Currency(DepNode.Items[i].Items[j].Values[DepTreeList.ColumnByName('YearQntColumn').ItemIndex])
      + Currency(DepNode.Items[i].Items[j].Values[DepTreeList.ColumnByName('TotalQntCol').ItemIndex]);

      if DepNode.Items[i].Items[j].Values[2] > 0 then
       DepNode.Items[i].Items[j].Values[DepTreeList.ColumnByName('YearCostColumn').ItemIndex]
       := RoundValueC(Currency(DepNode.Items[i].Items[j].Values[DepTreeList.ColumnByName('YearCostColumn').ItemIndex])
       + Currency(DepNode.Items[i].Items[j].Values[DepTreeList.ColumnByName('TotalCostCol').ItemIndex]))
      else
       DepNode.Items[i].Items[j].Values[DepTreeList.ColumnByName('YearCostColumn').ItemIndex] := Null;
     end;
    end;

    for t := LAST_COL + 1 to DepTreeList.ColumnCount - 1 do begin //Summing by columns
     s := Copy(DepTreeList.Columns[t].Name, 0, 6);
     if s = 'PriceC' then Continue;
     Sum := 0;
     for j := 0 to DepNode.Items[i].Count - 1 do begin
      if DepNode.Items[i].Items[j].Values[0] < -1 then Continue;
      if DepNode.Items[i].Items[j].Values[2] <= 0 then Continue;
      if VarIsNull(DepNode.Items[i].Items[j].Values[t]) then DepNode.Items[i].Items[j].Values[t] := 0;
      Sum := Sum + DepNode.Items[i].Items[j].Values[t];
     end;
     if (s = 'CostCo') or (s = 'FCostC') or (s = 'TotalC') or (s ='YearCo') then
      DepNode.Items[i].Values[t] := RoundValueC(Sum)
     else
      DepNode.Items[i].Values[t] := Sum;
    end;
   end
   else begin
    QntSum   := 0;
    TotalSum := 0;

    for t := 0 to Length(InputFixed) - 1 do begin
     if InputFixed[t]._id_Doc <> id_Doc then Continue;

     Bool := True;
     Sum  := 0;
     CostSum := 0;
     for k := 0 to Length(InputStages) - 1 do begin
      if InputStages[k]._Link_To <> InputFixed[t]._id_Stage then Continue;
      Bool := False;

      Index := DepTreeList.ColumnByName('QntCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

      if VarIsNull(DepNode.Items[i].Values[Index]) then
       DepNode.Items[i].Values[Index] := 0;

      Sum := Sum + DepNode.Items[i].Values[Index];

      a := DepTreeList.Columns[Index].VisibleIndexAtBand;
      while a < DepTreeList.Bands[1].VisibleColumnCount do begin
       if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
       else Break;
      end;

      if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
      then begin
       if VarIsNull(DepNode.Items[i].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex]) then
        DepNode.Items[i].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex] := 0;
       Cost := DepNode.Items[i].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex];
      end
      else Cost := 0;

      Index2 := DepTreeList.ColumnByName('CostCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;
      DepNode.Items[i].Values[Index2] := RoundValueC(DepNode.Items[i].Values[Index]
       * Cost * DepNode.Items[i].Values[8] / Coefficient);
      CostSum := CostSum + DepNode.Items[i].Values[Index]
       * Cost * DepNode.Items[i].Values[8] / Coefficient;
     end;

     Index := DepTreeList.ColumnByName('FQntCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;

     if not Bool then begin
      DepNode.Items[i].Values[Index] := Sum;
      Index2 := DepTreeList.ColumnByName('FCostCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;
      DepNode.Items[i].Values[Index2] := RoundValueC(CostSum);
     end
     else begin
      if VarIsNull(DepNode.Items[i].Values[Index]) then
       DepNode.Items[i].Values[Index] := 0;

      a := DepTreeList.Columns[Index].VisibleIndexAtBand;
      while a < DepTreeList.Bands[1].VisibleColumnCount do begin
       if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
       else Break;
      end;

      if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
      then begin
       if VarIsNull(DepNode.Items[i].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex]) then
        DepNode.Items[i].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex] := 0;
       Cost := DepNode.Items[i].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex];
      end
      else Cost := 0;

      Index2 := DepTreeList.ColumnByName('FCostCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;
      DepNode.Items[i].Values[Index2] := RoundValueC(DepNode.Items[i].Values[Index]
       * Cost * DepNode.Items[i].Values[8] / Coefficient);
     end;

     QntSum   := QntSum + DepNode.Items[i].Values[Index];
     TotalSum := TotalSum + DepNode.Items[i].Values[Index2];
    end;
    DepNode.Items[i].Values[DepTreeList.ColumnByName('TotalQntCol').ItemIndex] := QntSum;
    DepNode.Items[i].Values[DepTreeList.ColumnByName('TotalCostCol').ItemIndex] := RoundValueC(TotalSum);

    if not YearPlan then begin
     DepNode.Items[i].Values[DepTreeList.ColumnByName('YearQntColumn').ItemIndex]
     := Currency(DepNode.Items[i].Values[DepTreeList.ColumnByName('YearQntColumn').ItemIndex])
     + Currency(DepNode.Items[i].Values[DepTreeList.ColumnByName('TotalQntCol').ItemIndex]);

     DepNode.Items[i].Values[DepTreeList.ColumnByName('YearCostColumn').ItemIndex]
     := RoundValueC(Currency(DepNode.Items[i].Values[DepTreeList.ColumnByName('YearCostColumn').ItemIndex])
     + Currency(DepNode.Items[i].Values[DepTreeList.ColumnByName('TotalCostCol').ItemIndex]))
    end;
   end;
  end;
 end;

{ t := LAST_COL + 1;
 while t < DepTreeList.ColumnCount do begin
  s := Copy(DepTreeList.Columns[t].Name, 0, 6);
  if (s = 'CostCo') or (s = 'TotalC')
  or (s = 'FCostC') or (s = 'YearCo') then begin
   if not (YearPlan and (s = 'YearCo')) then begin
    for d := 0 to DepTreeList.Count - 1 do begin
     DepSum := 0;

     for i := 0 to DepTreeList.Items[d].Count - 1 do
      if DepTreeList.Items[d].Items[i].Values[0] > 0 then
       DepSum := DepSum + DepTreeList.Items[d].Items[i].Values[t];

     DepTreeList.Items[d].Values[t] := RoundValueC(DepSum);
    end;
   end;

   Inc(t);
  end
  else Inc(t);
 end;  }

 DepTreeList.EndUpdate;
end;

////////--------------------//////////////

procedure TPlanEditorForm.CalcSummsProd(InputStages,
  InputFixed: TStagesArray; id_Doc, Coefficient: integer);
var
 i, j       : integer;
 t, k       : integer;
 d          : integer;
 QntSum     : Currency; //Total quantity of product by categories
 TotalSum   : Currency; //Total cost of those products
 Cost       : Currency;
 a          : integer;

 Bool       : boolean;

 Sum        : Currency; // Quantity sum by devoted stages
 CostSum    : Currency; // Cost sum by devoted stages
 Index      : integer;
 Index2     : integer;
begin
 if (ProductTreeList.Count = 0) or (ProductTreeList.Bands.Count <= 2) then Exit;

 ProductTreeList.BeginUpdate;

 FillYearColumnsProd;

 for i := 0 to ProductTreeList.Count - 1 do begin
  if ProductTreeList.Items[i].Values[5] then begin
   for j := 0 to ProductTreeList.Items[i].Count - 1 do begin // Summing by rows
    if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;

    if ProductTreeList.Items[i].Items[j].Values[2] > 0 then begin
     for d := 0 to ProductTreeList.Items[i].Items[j].Count - 1 do begin
      QntSum   := 0;
      TotalSum := 0;
      for t := 0 to Length(InputFixed) - 1 do begin
       if InputFixed[t]._id_Doc <> id_Doc then Continue;

       Sum     := 0;
       CostSum := 0;
       Bool    := True;
       for k := 0 to Length(InputStages) - 1 do begin
        if InputStages[k]._id_Doc <> id_Doc then Continue;
        if InputStages[k]._Link_To <> InputFixed[t]._id_Stage then Continue;
        Bool := False;

        Index := ProductTreeList.ColumnByName('QntCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

        if VarIsNull(ProductTreeList.Items[i].Items[j].Items[d].Values[Index]) then
         ProductTreeList.Items[i].Items[j].Items[d].Values[Index] := 0;

        Sum := Sum + ProductTreeList.Items[i].Items[j].Items[d].Values[Index];

        a := ProductTreeList.Columns[Index].VisibleIndexAtBand;
        while a < ProductTreeList.Bands[1].VisibleColumnCount do begin
         if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
         else Break;
        end; 

        if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
        then begin
         if VarIsNull(ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex]) then
          ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex] := 0;
         Cost := ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex];
        end
        else Cost := 0;

        Index2 := ProductTreeList.ColumnByName('CostCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;
        ProductTreeList.Items[i].Items[j].Items[d].Values[Index2] :=
          RoundValueC(ProductTreeList.Items[i].Items[j].Items[d].Values[Index]
          * Cost * ProductTreeList.Items[i].Values[8] / Coefficient);
        CostSum := CostSum + ProductTreeList.Items[i].Items[j].Items[d].Values[Index]
          * Cost * ProductTreeList.Items[i].Values[8] / Coefficient;
       end;

       Index := ProductTreeList.ColumnByName('FQntCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;

       if not Bool then begin
        ProductTreeList.Items[i].Items[j].Items[d].Values[Index] := Sum;
        Index2 := ProductTreeList.ColumnByName('FCostCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;
        ProductTreeList.Items[i].Items[j].Items[d].Values[Index2] := RoundValueC(CostSum);
       end
       else begin
        if VarIsNull(ProductTreeList.Items[i].Items[j].Items[d].Values[Index]) then
         ProductTreeList.Items[i].Items[j].Items[d].Values[Index] := 0;

        a := ProductTreeList.Columns[Index].VisibleIndexAtBand;
        while a < ProductTreeList.Bands[1].VisibleColumnCount do begin
         if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
         else Break;
        end; 

        if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
        then begin
         if VarIsNull(ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex]) then
          ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex] := 0;
         Cost := ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex];
        end
        else Cost := 0;

        Index2 := ProductTreeList.ColumnByName('FCostCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;
        ProductTreeList.Items[i].Items[j].Items[d].Values[Index2]
         := RoundValueC(ProductTreeList.Items[i].Items[j].Items[d].Values[Index]
         * Cost * ProductTreeList.Items[i].Values[8] / Coefficient);
       end;

       QntSum   := QntSum + ProductTreeList.Items[i].Items[j].Items[d].Values[Index];
       TotalSum := TotalSum + ProductTreeList.Items[i].Items[j].Items[d].Values[Index2];
      end;
      ProductTreeList.Items[i].Items[j].Items[d].Values[ProductTreeList.ColumnByName('TotalQntCol').ItemIndex] := QntSum;
      ProductTreeList.Items[i].Items[j].Items[d].Values[ProductTreeList.ColumnByName('TotalCostCol').ItemIndex] := RoundValueC(TotalSum);

      if not YearPlan then begin
       ProductTreeList.Items[i].Items[j].Items[d].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex]
       := Currency(ProductTreeList.Items[i].Items[j].Items[d].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex])
       + Currency(ProductTreeList.Items[i].Items[j].Items[d].Values[ProductTreeList.ColumnByName('TotalQntCol').ItemIndex]);

       ProductTreeList.Items[i].Items[j].Items[d].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex]
       := RoundValueC(Currency(ProductTreeList.Items[i].Items[j].Items[d].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex])
       + Currency(ProductTreeList.Items[i].Items[j].Items[d].Values[ProductTreeList.ColumnByName('TotalCostCol').ItemIndex]))
      end;
     end;
    end;
   end;
  end
  else begin
   for d := 0 to ProductTreeList.Items[i].Count - 1 do begin
    QntSum   := 0;
    TotalSum := 0;

    for t := 0 to Length(InputFixed) - 1 do begin
     if InputFixed[t]._id_Doc <> id_Doc then Continue;

     Bool := True;
     Sum  := 0;
     CostSum := 0;
     for k := 0 to Length(InputStages) - 1 do begin
      if InputStages[k]._Link_To <> InputFixed[t]._id_Stage then Continue;
      Bool := False;

      Index := ProductTreeList.ColumnByName('QntCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

      if VarIsNull(ProductTreeList.Items[i].Items[d].Values[Index]) then
       ProductTreeList.Items[i].Items[d].Values[Index] := 0;

      Sum := Sum + ProductTreeList.Items[i].Items[d].Values[Index];

      a := ProductTreeList.Columns[Index].VisibleIndexAtBand;
      while a < ProductTreeList.Bands[1].VisibleColumnCount do begin
       if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
       else Break;
      end; 

      if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
      then begin
       if VarIsNull(ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex]) then
        ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex] := 0;
       Cost := ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex];
      end
      else Cost := 0;

      Index2 := ProductTreeList.ColumnByName('CostCol_' + IntToStr(InputStages[k]._id_Stage)).ItemIndex;
      ProductTreeList.Items[i].Items[d].Values[Index2] := RoundValueC(ProductTreeList.Items[i].Items[d].Values[Index]
       * Cost * ProductTreeList.Items[i].Values[8] / Coefficient);
      CostSum := CostSum + ProductTreeList.Items[i].Items[d].Values[Index]
       * Cost * ProductTreeList.Items[i].Values[8] / Coefficient;
     end;

     Index := ProductTreeList.ColumnByName('FQntCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;

     if not Bool then begin
      ProductTreeList.Items[i].Items[d].Values[Index] := Sum;
      Index2 := ProductTreeList.ColumnByName('FCostCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;
      ProductTreeList.Items[i].Items[d].Values[Index2] := RoundValueC(CostSum);
     end
     else begin
      if VarIsNull(ProductTreeList.Items[i].Items[d].Values[Index]) then
       ProductTreeList.Items[i].Items[d].Values[Index] := 0;

      a := ProductTreeList.Columns[Index].VisibleIndexAtBand;
      while a < ProductTreeList.Bands[1].VisibleColumnCount do begin
       if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
       else Break;
      end; 

      if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
      then begin
       if VarIsNull(ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex]) then
        ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex] := 0;
       Cost := ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex];
      end
      else Cost := 0;

      Index2 := ProductTreeList.ColumnByName('FCostCol_' + IntToStr(InputFixed[t]._id_Stage)).ItemIndex;
      ProductTreeList.Items[i].Items[d].Values[Index2] := RoundValueC(ProductTreeList.Items[i].Items[d].Values[Index]
       * Cost * ProductTreeList.Items[i].Values[8] / Coefficient);
     end;

     QntSum   := QntSum + ProductTreeList.Items[i].Items[d].Values[Index];
     TotalSum := TotalSum + ProductTreeList.Items[i].Items[d].Values[Index2];
    end;
    ProductTreeList.Items[i].Items[d].Values[ProductTreeList.ColumnByName('TotalQntCol').ItemIndex] := QntSum;
    ProductTreeList.Items[i].Items[d].Values[ProductTreeList.ColumnByName('TotalCostCol').ItemIndex] := RoundValueC(TotalSum);


    if not YearPlan then begin
     ProductTreeList.Items[i].Items[d].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex]
     := Currency(ProductTreeList.Items[i].Items[d].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex])
     + Currency(ProductTreeList.Items[i].Items[d].Values[ProductTreeList.ColumnByName('TotalQntCol').ItemIndex]);

     ProductTreeList.Items[i].Items[d].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex]
     := RoundValueC(Currency(ProductTreeList.Items[i].Items[d].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex])
     + Currency(ProductTreeList.Items[i].Items[d].Values[ProductTreeList.ColumnByName('TotalCostCol').ItemIndex]))
    end;
   end;
  end;
 end;

 ProductTreeList.EndUpdate;
end;

procedure TPlanEditorForm.FillSumNodeDep;
var
 i, j     : integer;
 d, k     : integer;
 l, t     : integer;

 s        : string;
 Flag     : boolean;

 HasLinks : boolean;
begin
 DepTreeList.BeginUpdate;

 HasLinks := False;

 for t := LAST_COL + 1 to DepTreeList.ColumnCount - 1 do begin
  s := Copy(DepTreeList.Columns[t].Name, 0, 6);

  if (s <> 'FQntCo') and (s <> 'QntCol') and (s <> 'PriceC') then Continue;

  if s = 'QntCol' then HasLinks := True
  else if (s = 'FQntCo') and HasLinks then begin
   HasLinks := False;       // Если данный период имеет детей, то я его пропускаю, т.к. он заполняется в CalcSummsDep
   Continue;
  end;

  for d := 1 to DepTreeList.Count - 1 do begin
   for i := 0 to DepTreeList.Items[d].Count - 1 do begin
    if DepTreeList.Items[d].Items[i].Values[0] <= 0 then Continue;

    if (DepTreeList.Items[d].Items[i].Count = 0)
    and DepTreeList.Items[d].Items[i].Values[5] then Continue;

    Flag := True;
    for k := 0 to DepTreeList.Items[0].Count - 1 do
     if DepTreeList.Items[0].Items[k].Values[0] = DepTreeList.Items[d].Items[i].Values[0] then begin
      Flag := False;
      Break;
     end;

    if Flag then Continue;

    if DepTreeList.Items[d].Items[i].Values[5] then begin
     for j := 0 to DepTreeList.Items[d].Items[i].Count - 1 do begin
      if DepTreeList.Items[d].Items[i].Items[j].Values[0] < -1 then Continue;

      for l := 0 to DepTreeList.Items[0].Items[k].Count - 1 do begin
       if (DepTreeList.Items[0].Items[k].Items[l].Values[0] < -1)
       or (DepTreeList.Items[0].Items[k].Items[l].Values[2] <> DepTreeList.Items[d].Items[i].Items[j].Values[2])
       then Continue;

       if s = 'PriceC' then begin
        if VarIsNull(DepTreeList.Items[0].Items[k].Items[l].Values[t]) then
         DepTreeList.Items[0].Items[k].Items[l].Values[t] := DepTreeList.Items[d].Items[i].Items[j].Values[t];
        Continue;
       end;


       if VarIsNull(DepTreeList.Items[0].Items[k].Items[l].Values[t]) then
        DepTreeList.Items[0].Items[k].Items[l].Values[t] := 0;

       if VarIsNull(DepTreeList.Items[0].Items[k].Items[l].Values[t])
       or VarIsNull(DepTreeList.Items[d].Items[i].Items[j].Values[t]) then Continue;

       DepTreeList.Items[0].Items[k].Items[l].Values[t] := DepTreeList.Items[0].Items[k].Items[l].Values[t]
        + Integer(DepTreeList.Items[d].Items[i].Items[j].Values[t]);
      end;
     end;
    end
    else begin
     if (s = 'PriceC') and VarIsNull(DepTreeList.Items[0].Items[k].Values[t]) then begin
      DepTreeList.Items[0].Items[k].Values[t] := DepTreeList.Items[d].Items[i].Values[t];
      Continue;
     end;

     if VarIsNull(DepTreeList.Items[0].Items[k].Values[t]) then
      DepTreeList.Items[0].Items[k].Values[t] := 0;

     DepTreeList.Items[0].Items[k].Values[t] := DepTreeList.Items[0].Items[k].Values[t]
      + Integer(DepTreeList.Items[d].Items[i].Values[t]);
    end;
   end;
  end;
 end;

 DepTreeList.EndUpdate;
end;

procedure TPlanEditorForm.EnableButtons(Enable : boolean);
var
 i            : integer;
 AddedDocFlag : boolean;
begin
 AddedDocFlag := False;

 for i := 0 to GridDoc.DataController.RecordCount - 1 do begin
  if GridDoc.DataController.Values[i, 0] = -1 then begin
   AddedDocFlag := True;
   Break;
  end;
 end;

 AddButton.Enabled      := Enable and not MainPlan;
 DelButton.Enabled      := Enable and not MainPlan;
 EditButton.Enabled     := Enable and not MainPlan;
 SetCDataBtn.Enabled    := Enable and not MainPlan;
 StagesButton.Enabled   := Enable and not MainPlan;
 AdjustButton.Enabled   := Enable and not MainPlan;

 pAddButton.Enabled     := Enable and not MainPlan;
 pDelButton.Enabled     := Enable and not MainPlan;
 pEditButton.Enabled    := Enable and not MainPlan;
 pStagesButton.Enabled  := Enable and not MainPlan;

 DelDocButton.Enabled   := not(Enable);
 EditDocButton.Enabled  := not(Enable or MainPlan);
 EditNameDocBtn.Enabled := not(Enable);
 SaveButton.Enabled     := not(Enable);

 pDelDocButton.Enabled   := not(Enable);
 pEditDocButton.Enabled  := not(Enable or MainPlan);
 pEditNameDocBtn.Enabled := not(Enable);

 if AddedDocFlag then
  AddDocButton.Enabled  := False
 else
  AddDocButton.Enabled  := not(Enable);

 if Enable then begin
  ApplyButton.Visible    := ivAlways;
  CancelButton.Visible   := ivAlways;
 end
 else begin
  ApplyButton.Visible    := ivNever;
  CancelButton.Visible   := ivNever;
 end;

 SignButton.Enabled     := not Enable;
 SaveButton.Enabled     := not Enable;

 if Enable and not MainPlan then
  ProductTreeList.OptionsData.Editing := True
 else
  ProductTreeList.OptionsData.Editing := False;

 if Enable and not MainPlan then
  ProductTreeList.OptionsSelection.CellSelect := True
 else
  ProductTreeList.OptionsSelection.CellSelect := False;

 if MainPlan then CellWidthSpinEdit.Visible := ivAlways
 else CellWidthSpinEdit.Visible := ivNever;

 Grid.Enabled := not(Enable);
end;

procedure TPlanEditorForm.NullTheTreeData(TreeList: TcxTreeList);
var
 i, j, t : integer;
 s       : string;
begin
 for t := LAST_COL to TreeList.ColumnCount - 1 do begin
  s := Copy(TreeList.Columns[t].Name, 0, 6);

  if (s <> 'QntCol') and (s <> 'FQntCo') then Continue;

  for i := 0 to TreeList.Count - 1 do begin
   if TreeList.Items[i].Values[0] < 0 then Continue;

   if TreeList.Items[i].Count = 0 then begin
    TreeList.Items[i].Values[t] := 0;
    Continue;
   end;

   for j := 0 to TreeList.Items[i].Count - 1 do begin
    if TreeList.Items[i].Items[j].Values[0] < -1 then Continue;

    TreeList.Items[i].Items[j].Values[t] := 0;
   end;
  end;
 end;
end;

procedure TPlanEditorForm.DocSelect(id_Plan : integer);
var
 id_Doc         : integer;
 id_Type_Doc    : integer;
 Date_Doc       : TDate;
 Name_Doc       : string;
 Date_Reg       : TDateTime;
 id_Unit_Meas   : integer;
 Name_Unit_Meas : string;
 Coefficient    : integer;
 is_Signed      : integer;

 k              : integer;
begin
 GridDoc.DataController.RecordCount := 0;

 Query.SQL.Text := 'select * from SP_DT_PLAN_DOC_SEL(' + IntToStr(id_Plan) + ','
 + QuotedStr(DateTimeToStr(SYS_MAX_TIMESTAMP)) + ')';
 Query.ExecQuery;

 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;

 GridDoc.DataController.BeginUpdate;

 while not Query.Eof do begin
  id_Doc         := Query['ID_DOC'].AsInteger;
  id_Type_Doc    := Query['ID_TYPE_DOC'].AsInteger;
  Name_Doc       := Query['NAME_DOC'].AsString;
  Date_Doc       := Query['DATE_DOC'].AsDate;
  Date_Reg       := Query['DATE_REG'].AsDateTime;
  id_Unit_Meas   := Query['ID_UNIT_MEAS'].AsInteger;
  Name_Unit_Meas := Query['NAME_UNIT_MEAS'].AsString;
  Coefficient    := Query['COEFFICIENT'].AsInteger;
  is_Signed      := Query['IS_SIGNED'].AsInteger;

  GridDoc.DataController.RecordCount := GridDoc.DataController.RecordCount + 1;
  k := GridDoc.DataController.RecordCount - 1;

  GridDoc.DataController.Values[k, 0] := id_Doc;
  GridDoc.DataController.Values[k, 1] := id_Type_Doc;
  GridDoc.DataController.Values[k, 2] := Name_Doc;
  GridDoc.DataController.Values[k, 3] := Date_Doc;
  GridDoc.DataController.Values[k, 4] := Date_Reg;
  GridDoc.DataController.Values[k, 5] := id_Unit_Meas;
  GridDoc.DataController.Values[k, 6] := Name_Unit_Meas;
  GridDoc.DataController.Values[k, 7] := Coefficient;
  GridDoc.DataController.Values[k, 8] := is_Signed;

  Query.Next;
 end;

 GridDoc.DataController.EndUpdate;

 Query.Close;
end;

procedure TPlanEditorForm.StagesSelect(id_Doc : integer);
var
 id_Stage : integer;
 Date_Beg : TDate;
 Date_End : TDate;

 i        : integer;
begin
 Query.SQL.Text := 'select * from SP_DT_STAGE_SEL(' + IntToStr(id_Doc) + ',-1' + ')';
 Query.ExecQuery;

 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;
 
 while not Query.Eof do begin
  id_Stage := Query['Id_Stage_Param'].AsInteger;
  Date_Beg := Query['Date_Beg_Param'].AsDate;
  Date_End := Query['Date_End_Param'].AsDate;

  SetLength(FixedStages, Length(FixedStages) + 1);

  with FixedStages[Length(FixedStages) - 1] do begin
   _Link_To  := -1;
   _id_Doc   := id_Doc;
   _id_Stage := id_Stage;
   _Date_Beg := Date_Beg;
   _Date_End := Date_End;
  end;

  Query.Next;
 end;
 Query.Close;

 if Length(FixedStages) = 0 then Exit;

 for i := 0 to Length(FixedStages) - 1 do begin
  if FixedStages[i]._id_Doc <> id_Doc then Continue;

  Query.SQL.Text := 'select * from SP_DT_STAGE_SEL(' + IntToStr(id_Doc) + ','
  + IntToStr(FixedStages[i]._id_Stage) + ')';
  Query.ExecQuery;

  if Query.RecordCount = 0 then begin
   Query.Close;
   Continue;
  end;

  while not Query.Eof do begin
   id_Stage := Query['Id_Stage_Param'].AsInteger;
   Date_Beg := Query['Date_Beg_Param'].AsDate;
   Date_End := Query['Date_End_Param'].AsDate;

   SetLength(StagesArray, Length(StagesArray) + 1);

   with StagesArray[Length(StagesArray) - 1] do begin
    _Link_To  := FixedStages[i]._id_Stage;
    _id_Doc   := id_Doc;
    _id_Stage := id_Stage;
    _Date_Beg := Date_Beg;
    _Date_End := Date_End;
   end;

   Query.Next;
  end;
  Query.Close;
 end;
end;

procedure TPlanEditorForm.PlanDataSelect;
var
 id_Department   : integer;
 Name_Department : string;
 id_Product      : integer;
 Name_Product    : string;
 id_Unit_Meas    : integer;
 Name_Unit_Meas  : string;
 Coefficient     : integer;
 id_Cat_Cust     : integer;
 Name_Cat_Cust   : string;
 Cost            : Currency;
 Volume          : Currency;
 Summa           : Currency;
 id_Object       : integer;
 Name_Object     : string;
 Need_Cat_Cust   : boolean;
 Need_Objects    : boolean;
 DispOrder_Prod  : integer;
 Display_Order   : integer;

 MAX_SUB_COUNT   : integer;

 i, j            : integer;
 Year,
 Month,
 Day             : word;

 Flag            : boolean;
 Bool            : boolean;
 t, k, n         : integer;

 LastCost        : Currency;
 LastDep         : integer;
 EmptyFixed      : array of integer;
begin
 ProductArray := nil;
 EmptyFixed   := nil;

 for i := 0 to Length(FixedStages) - 1 do begin
  Bool := True;

  for j := 0 to Length(StagesArray) - 1 do begin
   if StagesArray[j]._Link_To <> FixedStages[i]._id_Stage then Continue;

   Bool := False;

   DecodeDate(SYS_MAX_TIMESTAMP, Year, Month, Day);
   Query.sql.Text := 'select * from SP_DT_PLAN_DATA_SEL(' + IntToStr(StagesArray[j]._id_Stage)
   + ', ' + #39 + IntToStr(Day) + '.' + IntToStr(Month) + '.' + IntToStr(Year) + #39 + ')';
   Query.ExecQuery;
   if Query.RecordCount = 0 then begin
    Query.Close;
    Continue;
   end;

   while not Query.Eof do begin
    SetLength(PlanDataArray, Length(PlanDataArray) + 1);

    id_Department  := Query['ID_DEPARTMENT'].AsInteger;
    id_Product     := Query['ID_PRODUCT'].AsInteger;
    Name_Product   := Query['Name_Product'].AsString;
    id_Unit_Meas   := Query['ID_UNIT_MEAS'].AsInteger;
    Name_Unit_Meas := Query['Name_Unit_Meas'].AsString;
    Coefficient    := Query['COEFFICIENT'].AsInteger;
    id_Cat_Cust    := Query['ID_CAT_CUST'].AsInteger;
    Name_Cat_Cust  := Query['Name_Cat_Cust'].AsString;
    Cost           := Query['COST'].AsCurrency;
    Volume         := Query['VOLUME'].AsCurrency;
    Summa          := Query['SUMMA'].AsCurrency;
    id_Object      := Query['ID_OBJECT'].AsInteger;
    Name_Object    := Query['Name_Object'].AsString;
    Need_Cat_Cust  := (Query['Need_Cat_Cust'].AsInteger = 1);
    Need_Objects   := (Query['Need_Objects'].AsInteger = 1);
    DispOrder_Prod := Query['DISPLAY_ORDER_PROD'].AsInteger;
    Display_Order  := Query['DISPLAY_ORDER'].AsInteger;

    if id_Object <= 0 then begin
     Flag := True;
     for k := 0 to Length(ProductArray) - 1 do
      if (ProductArray[k]._id_Product = id_Product)
      and (ProductArray[k]._id_Cat_Cust = id_Cat_Cust) then begin
       Flag := False;
       Break;
      end;

     if Flag then begin
      SetLength(ProductArray, Length(ProductArray) + 1);
      ProductArray[Length(ProductArray) - 1]._id_Product  := id_Product;
      ProductArray[Length(ProductArray) - 1]._id_Cat_Cust := id_Cat_Cust;
     end;
    end;

    with PlanDataArray[Length(PlanDataArray) - 1] do begin
     _Modified       := 'no';
     _id_Department  := id_Department;
     _id_Stage       := StagesArray[j]._id_Stage;
     _id_Product     := id_Product;
     _Name_Product   := Name_Product;
     _id_Unit_Meas   := id_Unit_Meas;
     _Name_Unit_Meas := Name_Unit_Meas;
     _Coefficient    := Coefficient;
     _id_Cat_Cust    := id_Cat_Cust;
     _Name_Cat_Cust  := Name_Cat_Cust;
     _Name_Object    := Name_Object;
     _Cost           := Cost;
     _Volume         := Volume;
     _Summa          := Summa;
     _id_Object      := id_Object;
     _Need_Cat_Cust  := Need_Cat_Cust;
     _Need_Objects   := Need_Objects;
     _DispOrder_Prod := DispOrder_Prod;
     _Display_Order  := Display_Order;
    end;

    Query.Next;
   end;

  { TODO 1 -oAndrew :
Строка ниже вообще-то пока не нужна.
Трабл с дисплеем продукции - если виды продукции на разных уровнях вложенности }

   if not VarIsNull(Query['MAX_SUB_COUNT'].AsVariant) then
    if MAX_SUB_COUNT < Query['MAX_SUB_COUNT'].AsInteger then MAX_SUB_COUNT := Query['MAX_SUB_COUNT'].AsInteger;

   Query.Close;
  end;

  if Bool then begin
   DecodeDate(SYS_MAX_TIMESTAMP, Year, Month, Day);
   Query.sql.Text := 'select * from SP_DT_PLAN_DATA_SEL(' + IntToStr(FixedStages[i]._id_Stage)
   + ', ' + #39 + IntToStr(Day) + '.' + IntToStr(Month) + '.' + IntToStr(Year) + #39 + ')';
   Query.ExecQuery;
   if Query.RecordCount = 0 then begin
    Query.Close;
    SetLength(EmptyFixed, Length(EmptyFixed) + 1);
    EmptyFixed[Length(EmptyFixed) - 1] := FixedStages[i]._id_Stage;
    Continue;
   end;

   while not Query.Eof do begin
    SetLength(PlanDataArray, Length(PlanDataArray) + 1);

    id_Department  := Query['ID_DEPARTMENT'].AsInteger;
    id_Product     := Query['ID_PRODUCT'].AsInteger;
    Name_Product   := Query['Name_Product'].AsString;
    id_Unit_Meas   := Query['ID_UNIT_MEAS'].AsInteger;
    Name_Unit_Meas := Query['Name_Unit_Meas'].AsString;
    Coefficient    := Query['COEFFICIENT'].AsInteger;
    id_Cat_Cust    := Query['ID_CAT_CUST'].AsInteger;
    Name_Cat_Cust  := Query['Name_Cat_Cust'].AsString;
    Cost           := Query['COST'].AsCurrency;
    Volume         := Query['VOLUME'].AsCurrency;
    Summa          := Query['SUMMA'].AsCurrency;
    id_Object      := Query['ID_OBJECT'].AsInteger;
    Name_Object    := Query['Name_Object'].AsString;
    Need_Cat_Cust  := (Query['Need_Cat_Cust'].AsInteger = 1);
    Need_Objects   := (Query['Need_Objects'].AsInteger = 1);
    DispOrder_Prod := Query['DISPLAY_ORDER_PROD'].AsInteger;
    Display_Order  := Query['DISPLAY_ORDER'].AsInteger;

    if id_Object <= 0 then begin
     Flag := True;
     for k := 0 to Length(ProductArray) - 1 do
      if (ProductArray[k]._id_Product = id_Product)
      and (ProductArray[k]._id_Cat_Cust = id_Cat_Cust) then begin
       Flag := False;
       Break;
      end;

     if Flag then begin
      SetLength(ProductArray, Length(ProductArray) + 1);
      ProductArray[Length(ProductArray) - 1]._id_Product  := id_Product;
      ProductArray[Length(ProductArray) - 1]._id_Cat_Cust := id_Cat_Cust;
     end;
    end;

    with PlanDataArray[Length(PlanDataArray) - 1] do begin
     _Modified       := 'no';
     _id_Department  := id_Department;
     _id_Stage       := FixedStages[i]._id_Stage;
     _id_Product     := id_Product;
     _Name_Product   := Name_Product;
     _id_Unit_Meas   := id_Unit_Meas;
     _Name_Unit_Meas := Name_Unit_Meas;
     _Coefficient    := Coefficient;
     _id_Cat_Cust    := id_Cat_Cust;
     _Name_Cat_Cust  := Name_Cat_Cust;
     _Name_Object    := Name_Object;
     _Cost           := Cost;
     _Volume         := Volume;
     _Summa          := Summa;
     _id_Object      := id_Object;
     _Need_Cat_Cust  := Need_Cat_Cust;
     _Need_Objects   := Need_Objects;
     _DispOrder_Prod := DispOrder_Prod;
     _Display_Order  := Display_Order;
    end;

    Query.Next;
   end;

   if not VarIsNull(Query['MAX_SUB_COUNT'].AsVariant) then
    if MAX_SUB_COUNT < Query['MAX_SUB_COUNT'].AsInteger then MAX_SUB_COUNT := Query['MAX_SUB_COUNT'].AsInteger;

   Query.Close;
  end;
 end;

 LastDep := -2;
 Name_Department := '';

 Query.Close;

 for i := 0 to Length(PlanDataArray) - 1 do begin
  PlanDataArray[i]._DispOrder_Prod := Order_Level(PlanDataArray[i]._DispOrder_Prod, MAX_SUB_COUNT);

  if PlanDataArray[i]._id_Department <> LastDep then begin
   LastDep := PlanDataArray[i]._id_Department;
   Query.SQL.Text := 'select Name_Short from sp_Department where id_Department='
   + IntToStr(PlanDataArray[i]._id_Department);
   Query.ExecQuery;

   if Query.RecordCount <> 0 then Name_Department := Query.Fields[0].AsString;
   Query.Close;
  end;

  PlanDataArray[i]._Name_Department := Name_Department;
 end;

 for i := 0 to Length(EmptyFixed) - 1 do
  for j := 0 to Length(FixedStages) - 1 do
   if FixedStages[j]._id_Stage = EmptyFixed[i] then
    FixedStages[j]._id_Doc := 0;

 for k := 0 to GridDoc.DataController.RecordCount - 1 do begin
  for i := 0 to Length(ProductArray) - 1 do begin
   if ProductArray[i]._id_Object > 0 then Continue;
   LastCost := -1;
   for n := 0 to Length(FixedStages) - 1 do begin
    if FixedStages[n]._id_Doc <> GridDoc.DataController.Values[k, 0] then Continue;

    Flag := True;
    for j := 0 to Length(StagesArray) - 1 do begin
     if StagesArray[j]._id_Doc <> GridDoc.DataController.Values[k, 0] then Continue;
     if StagesArray[j]._Link_To <> FixedStages[n]._id_Stage then Continue;

     Flag := False;

     for t := 0 to Length(PlanDataArray) - 1 do
      if (PlanDataArray[t]._id_Stage = StagesArray[j]._id_Stage)
      and (PlanDataArray[t]._id_Product = ProductArray[i]._id_Product)
      and (PlanDataArray[t]._id_Cat_Cust = ProductArray[i]._id_Cat_Cust)
      and (PlanDataArray[t]._id_Object <= 0)
      and (PlanDataArray[t]._Cost <> LastCost) then begin
       LastCost := PlanDataArray[t]._Cost;
       StagesArray[j]._isItCostBeg := True;
       Break;
      end;
    end;

    if Flag then begin
     for t := 0 to Length(PlanDataArray) - 1 do
      if  (PlanDataArray[t]._id_Stage = FixedStages[n]._id_Stage)
      and (PlanDataArray[t]._id_Product = ProductArray[i]._id_Product)
      and (PlanDataArray[t]._id_Cat_Cust = ProductArray[i]._id_Cat_Cust)
      and (PlanDataArray[t]._id_Object <= 0)
      and (PlanDataArray[t]._Cost <> LastCost) then begin
       LastCost := PlanDataArray[t]._Cost;
       FixedStages[n]._isItCostBeg := True;
       Break;
      end;
    end;
   end;
  end;
 end;
end;

procedure TPlanEditorForm.ReadYearPlan;
var
 i      : integer;
 Flag   : boolean;
begin
 if id_Year_Plan < 0 then Exit;

 Query.SQL.Text := 'select distinct * from PROC_GET_YEAR_DATA(' + IntToStr(id_Plan) + ')';
 Query.ExecQuery;
 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;

 YearDataArray := nil;

 while not Query.Eof do begin
  Flag := True;
  for i := 0 to Length(YearDataArray) - 1 do begin
   if YearDataArray[i]._id_Department = Query['ID_DEPARTMENT_PARAM'].AsInteger then
    if YearDataArray[i]._id_Product = Query['ID_PRODUCT_PARAM'].AsInteger then
     if (YearDataArray[i]._id_Cat_Cust = Query['ID_CAT_CUST_PARAM'].AsInteger)
     and (YearDataArray[i]._id_Object = Query['ID_OBJECT_PARAM'].AsInteger)
     then begin
      Flag := False;
      Break;
     end;
  end;

  if Flag then begin
   SetLength(YearDataArray, Length(YearDataArray) + 1);

   with YearDataArray[Length(YearDataArray) - 1] do begin
    _id_Department := Query['ID_DEPARTMENT_PARAM'].AsInteger;
    _id_Product    := Query['ID_PRODUCT_PARAM'].AsInteger;
    _id_Cat_Cust   := Query['ID_CAT_CUST_PARAM'].AsInteger;
    _id_Object     := Query['ID_OBJECT_PARAM'].AsInteger;
    _Volume        := Query['VOLUME_PARAM'].AsCurrency;
    _Summa         := Query['SUMMA_PARAM'].AsCurrency;
   end;
  end
  else begin
   YearDataArray[i]._Volume := YearDataArray[i]._Volume
    + Query['VOLUME_PARAM'].AsCurrency;

   YearDataArray[i]._Summa := YearDataArray[i]._Summa
    + Query['SUMMA_PARAM'].AsCurrency
  end;

  Query.Next;
 end;
 Query.Close;
end;

procedure TPlanEditorForm.FillYearColumns;
var
 i, j  : integer;
 k     : integer;
 Flag  : boolean;
begin
 if YearPlan then Exit;
 if ProductTreeList.Count = 0 then Exit;


 for i := 0 to ProductTreeList.Count - 1 do begin
  if ProductTreeList.Items[i].Values[0] < -1  then Continue;

  if ProductTreeList.Items[i].Values[5] then begin
   for j := 0 to ProductTreeList.Items[i].Count - 1 do begin
    if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;

    Flag := True;
    for k := 0 to Length(YearDataArray) - 1 do begin
     if YearDataArray[k]._id_Department <> id_Department then Continue;

     if YearDataArray[k]._id_Product = ProductTreeList.Items[i].Values[0] then
      if (YearDataArray[k]._id_Cat_Cust = ProductTreeList.Items[i].Items[j].Values[2])
      and (YearDataArray[k]._id_Object = ProductTreeList.Items[i].Items[j].Values[3])
      then begin
       ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex]
       := YearDataArray[k]._Volume;
       ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex]
       := YearDataArray[k]._Summa;
       Flag := False;
       Break;
      end;
    end;

    if Flag then begin
     ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex] := 0;
     ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex] := 0;
    end;
   end;
  end
  else begin
   if ProductTreeList.Items[i].Values[6] then begin
    Flag := True;
    for k := 0 to Length(YearDataArray) - 1 do begin
     if YearDataArray[k]._id_Department <> id_Department then Continue;

     if (YearDataArray[k]._id_Product = ProductTreeList.Items[i].Values[0])
     and (YearDataArray[k]._id_Cat_Cust <= 0) and (YearDataArray[k]._id_Object <= 0) then begin
      ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex]
      := YearDataArray[k]._Volume;
      ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex]
      := YearDataArray[k]._Summa;
      Flag := False;
      Break;
     end;
    end;

    if Flag then begin
     ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex] := 0;
     ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex] := 0;
    end;

    for j := 0 to ProductTreeList.Items[i].Count - 1 do begin
     if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;
     Flag := True;
     for k := 0 to Length(YearDataArray) - 1 do begin
      if YearDataArray[k]._id_Department <> id_Department then Continue;

      if (YearDataArray[k]._id_Product = ProductTreeList.Items[i].Values[0])
      and (YearDataArray[k]._id_Cat_Cust <= 0) then
       if YearDataArray[k]._id_Object = ProductTreeList.Items[i].Items[j].Values[3] then begin
        ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex]
        := YearDataArray[k]._Volume;
        ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex]
        := YearDataArray[k]._Summa;
        Flag := False;
        Break;
       end
       else if YearDataArray[k]._id_Object <= 0 then begin
        ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex]
        := YearDataArray[k]._Volume;
        ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex]
        := YearDataArray[k]._Summa;
        Flag := False;
        Break;
       end;
     end;

     if Flag then begin
      ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex] := 0;
      ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex] := 0;
     end;
    end;
   end
   else begin
    if ProductTreeList.Items[i].Count <> 0 then Continue;

    Flag := True;
    for k := 0 to Length(YearDataArray) - 1 do begin
     if YearDataArray[k]._id_Department <> id_Department then Continue;

     if YearDataArray[k]._id_Product = ProductTreeList.Items[i].Values[0] then
      if (YearDataArray[k]._id_Cat_Cust <= 0) and (YearDataArray[k]._id_Object <= 0)
      then begin
       ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex]
       := YearDataArray[k]._Volume;
       ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex]
       := YearDataArray[k]._Summa;
       Flag := False;
       Break;
      end;
    end;

    if Flag then begin
     ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex] := 0;
     ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex] := 0;
    end;
   end;
  end;
 end;
end;

//----------------------

procedure TPlanEditorForm.FillYearColumnsDep;
var
 i, j  : integer;
 k, d  : integer;
 Flag  : boolean;
begin
 if YearPlan then Exit;
 if DepTreeList.Count = 0 then Exit;

 for d := 0 to DepTreeList.Count - 1 do begin
  for i := 0 to DepTreeList.Items[d].Count - 1 do begin
   if DepTreeList.Items[d].Items[i].Values[5] then begin
    if DepTreeList.Items[d].Items[i].Count = 0 then Continue;
    for j := 0 to DepTreeList.Items[d].Items[i].Count - 1 do begin
     if DepTreeList.Items[d].Items[i].Items[j].Values[0] < -1 then Continue;
     Flag := True;
     for k := 0 to Length(YearDataArray) - 1 do begin
      if YearDataArray[k]._id_Department <> DepTreeList.Items[d].Values[9] then Continue;

      if YearDataArray[k]._id_Product = DepTreeList.Items[d].Items[i].Values[0] then
       if YearDataArray[k]._id_Cat_Cust = DepTreeList.Items[d].Items[i].Items[j].Values[2]
       then begin
        DepTreeList.Items[d].Items[i].Items[j].Values[DepTreeList.ColumnByName('YearQntColumn').ItemIndex]
        := YearDataArray[k]._Volume;
        DepTreeList.Items[d].Items[i].Items[j].Values[DepTreeList.ColumnByName('YearCostColumn').ItemIndex]
        := YearDataArray[k]._Summa;
        Flag := False;
        Break;
       end;
     end;

     if Flag then begin
      DepTreeList.Items[d].Items[i].Items[j].Values[DepTreeList.ColumnByName('YearQntColumn').ItemIndex] := 0;
      DepTreeList.Items[d].Items[i].Items[j].Values[DepTreeList.ColumnByName('YearCostColumn').ItemIndex] := 0;
     end;
    end;
   end
   else begin
    if DepTreeList.Items[d].Items[i].Count <> 0 then Continue;

    Flag := True;
    for k := 0 to Length(YearDataArray) - 1 do begin
     if YearDataArray[k]._id_Department <> DepTreeList.Items[d].Values[9] then Continue;

     if YearDataArray[k]._id_Product = DepTreeList.Items[d].Items[i].Values[0] then
      if (YearDataArray[k]._id_Cat_Cust <= 0) and (YearDataArray[k]._id_Object <= 0)
      then begin
       DepTreeList.Items[d].Items[i].Values[DepTreeList.ColumnByName('YearQntColumn').ItemIndex]
       := YearDataArray[k]._Volume;
       DepTreeList.Items[d].Items[i].Values[DepTreeList.ColumnByName('YearCostColumn').ItemIndex]
       := YearDataArray[k]._Summa;
       Flag := False;
       Break;
      end;
    end;

    if Flag then begin
     DepTreeList.Items[d].Items[i].Values[DepTreeList.ColumnByName('YearQntColumn').ItemIndex] := 0;
     DepTreeList.Items[d].Items[i].Values[DepTreeList.ColumnByName('YearCostColumn').ItemIndex] := 0;
    end;
   end;
  end;
 end;
end;

//-------------

procedure TPlanEditorForm.FillYearColumnsProd;
var
 i, j  : integer;
 k, d  : integer;
 Flag  : boolean;
begin
 if YearPlan then Exit;
 if ProductTreeList.Count = 0 then Exit;

 for i := 0 to ProductTreeList.Count - 1 do begin
  if ProductTreeList.Items[i].Values[5] then begin
   if ProductTreeList.Items[i].Count = 0 then Continue;
   for j := 0 to ProductTreeList.Items[i].Count - 1 do begin
    if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;

    for d := 0 to ProductTreeList.Items[i].Items[j].Count - 1 do begin
     Flag := True;
     for k := 0 to Length(YearDataArray) - 1 do begin
      if YearDataArray[k]._id_Department <> ProductTreeList.Items[i].Items[j].Items[d].Values[9] then Continue;

      if YearDataArray[k]._id_Product = ProductTreeList.Items[i].Values[0] then
       if (YearDataArray[k]._id_Cat_Cust = ProductTreeList.Items[i].Items[j].Values[2])
       and (YearDataArray[k]._id_Object = ProductTreeList.Items[i].Items[j].Values[3])
       then begin
        ProductTreeList.Items[i].Items[j].Items[d].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex]
        := YearDataArray[k]._Volume;
        ProductTreeList.Items[i].Items[j].Items[d].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex]
        := YearDataArray[k]._Summa;
        Flag := False;
        Break;
       end;
     end;

     if Flag then begin
      ProductTreeList.Items[i].Items[j].Items[d].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex] := 0;
      ProductTreeList.Items[i].Items[j].Items[d].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex] := 0;
     end;
    end;
   end;
  end
  else begin
   for d := 0 to ProductTreeList.Items[i].Count - 1 do begin
    Flag := True;
    for k := 0 to Length(YearDataArray) - 1 do begin
     if YearDataArray[k]._id_Department <> ProductTreeList.Items[i].Items[d].Values[9] then Continue;

     if YearDataArray[k]._id_Product = ProductTreeList.Items[i].Values[0] then begin
      ProductTreeList.Items[i].Items[d].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex]
      := YearDataArray[k]._Volume;
      ProductTreeList.Items[i].Items[d].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex]
      := YearDataArray[k]._Summa;
      Flag := False;
      Break;
     end;
    end;

    if Flag then begin
     ProductTreeList.Items[i].Items[d].Values[ProductTreeList.ColumnByName('YearQntColumn').ItemIndex] := 0;
     ProductTreeList.Items[i].Items[d].Values[ProductTreeList.ColumnByName('YearCostColumn').ItemIndex] := 0;
    end;
   end;
  end;
 end;
end;

//~~~~~~~~~~~~~~~~~~~~~~~

procedure TPlanEditorForm.SortObjects_and_CatCust;
var
 i, k     : integer;
 j        : integer;
 Count    : integer;
 Node     : TcxTreeListNode;

 Flag     : boolean;
begin
 Count := ProductTreeList.Count;
 k     := 0;

 // Deleting informatinal nodes, such as 'Разом по ДВП'

 while k <= Count - 1 do
  if ProductTreeList.Items[k].Values[0] < -1 then begin
   ProductTreeList.Items[k].Destroy;
   Dec(Count);
   Continue;
  end
  else Inc(k);

 // Sorting objects and Cat_Custs

 for i := 0 to ProductTreeList.Count - 1 do begin
  if (ProductTreeList.Items[i].Count = 0)
  or (not ProductTreeList.Items[i].Values[5] and  not ProductTreeList.Items[i].Values[6]) then Continue;
  Count := ProductTreeList.Items[i].Count;
  k := 0;
  while k <= Count - 1 do begin
   if ProductTreeList.Items[i].Items[k].Values[0] < -1 then begin
    ProductTreeList.Items[i].Items[k].Destroy;
    Dec(Count);
    Continue;
   end
   else if ProductTreeList.Items[i].Items[k].Values[2] > 0 then
    ProductTreeList.Items[i].Items[k].MoveTo(ProductTreeList.Items[i] , tlamAddChildFirst);

   Inc(k);
  end;
 end;

 // Sorting Products, Objects and CatCusts by Display_Order

 Flag := True;
 while Flag do begin
  Flag := False;

  for i := 1 to ProductTreeList.Count - 1 do begin
   if StrToInt(ProductTreeList.Items[i - 1].Values[10]) > StrToInt(ProductTreeList.Items[i].Values[10]) then begin
    ProductTreeList.Items[i].MoveTo(ProductTreeList.Items[i - 1], tlamInsert);
    Flag := True;
   end;
  end;
 end;

 // Sorting Objects and CatCusts by Display_Order

 for i := 0 to ProductTreeList.Count - 1 do begin
  Flag := True;
  while Flag do begin
   Flag := False;

   for j := 1 to ProductTreeList.Items[i].Count - 1 do begin
    // if the j-node is the first object's node then continue
    if (ProductTreeList.Items[i].Items[j].Values[0] < -1)
    or (ProductTreeList.Items[i].Items[j - 1].Values[0] < -1) then Continue;

    if ((ProductTreeList.Items[i].Items[j].Values[2] > 0) and (ProductTreeList.Items[i].Items[j - 1].Values[2] <= 0))
    or ((ProductTreeList.Items[i].Items[j].Values[2] <= 0) and (ProductTreeList.Items[i].Items[j - 1].Values[2] > 0)) then Continue;

    if StrToInt(ProductTreeList.Items[i].Items[j - 1].Values[10]) > StrToInt(ProductTreeList.Items[i].Items[j].Values[10]) then begin
     ProductTreeList.Items[i].Items[j].MoveTo(ProductTreeList.Items[i].Items[j - 1], tlamInsert);
     Flag := True;
    end;
   end;
  end;
 end;

 // Adding informational nodes

 for i := 0 to ProductTreeList.Count - 1 do begin
  if (ProductTreeList.Items[i].Count = 0)
  or not ProductTreeList.Items[i].Values[6] then Continue;

  for j := 0 to ProductTreeList.Items[i].Count - 1 do
   if ProductTreeList.Items[i].Items[j].Values[3] > 0 then begin
    Node := ProductTreeList.Items[i].AddChild;
    Node.Values[0] := -3;
    Node.Values[1] := 'Джерела:';

    Node.MoveTo(ProductTreeList.Items[i].Items[j], tlamInsert);
    Break;
   end;

  if TotalObjects.Down then begin
   Node := ProductTreeList.Items[i].AddChild;
   Node.Values[0] := -2;
   Node.Values[1] := 'Разом за джерелами';
  end;
 end;

 if ProductTreeList.Count = 0 then Exit;

 Node := ProductTreeList.Add;
 Node.Values[0] := -2;
 Node.Values[1] := 'Разом по підприємству';
end;

procedure TPlanEditorForm.SavePlanData(InputStages, Fixed : TStagesArray;
          SaveToWhat : integer; TreeList : TcxTreeList);
var
 i , j       : integer;
 a           : integer;
 Cost        : Currency;
 k           : integer;
 SaveToArray : TPlanDataArray;
 n           : integer;
 id_Doc      : integer;

 Flag        : boolean;
 Index       : integer;
begin
 if (TreeList.Count = 0) or (TreeList.Bands.Count = 1) then Exit;
 SaveToArray := nil;
 id_Doc      := GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0];

 for i := 0 to TreeList.Count - 1 do begin
  if ProductTreeList.Items[i].Values[0] < -1 then Continue;

  if TreeList.Items[i].Values[5] then begin
   for j := 0 to TreeList.Items[i].Count - 1 do begin
    if TreeList.Items[i].Items[j].Values[0] < -1 then Continue;
    for n := 0 to Length(Fixed) - 1 do begin
     if Fixed[n]._id_Doc <> id_Doc then Continue;

     Flag := True;
     for k := 0 to Length(InputStages) - 1 do begin
      if InputStages[k]._id_Doc <> id_Doc then Continue;
      if InputStages[k]._Link_To <> Fixed[n]._id_Stage then Continue;

      Flag  := False;
      Index := TreeList.ColumnByName('QntCol_'
             + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

      SetLength(SaveToArray, Length(SaveToArray) + 1);
      with SaveToArray[Length(SaveToArray) - 1] do begin
       _Modified        := 'Edit'; // It has matter only for not_New document
       _id_Department   := SYS_DEF_ID_DEPARTMENT;
       _id_Stage        := InputStages[k]._id_Stage;
       _id_Product      := TreeList.Items[i].Values[0];
       _Name_Product    := TreeList.Items[i].Values[1];
       _id_Cat_Cust     := TreeList.Items[i].Items[j].Values[2];
       _Need_Cat_Cust   := TreeList.Items[i].Values[5];
       _Need_Objects    := TreeList.Items[i].Values[6];
       _id_Unit_Meas    := TreeList.Items[i].Values[7];
       _Name_Unit_Meas  := TreeList.Items[i].Values[4];
       _Coefficient     := TreeList.Items[i].Values[8];
       _DispOrder_Prod  := TreeList.Items[i].Values[10];
       _Display_Order   := TreeList.Items[i].Items[j].Values[10];

       if _id_Cat_Cust > 0 then begin
        _Name_Cat_Cust  := TreeList.Items[i].Items[j].Values[1];

        a := ProductTreeList.Columns[Index].VisibleIndexAtBand;
        while a < ProductTreeList.Bands[1].VisibleColumnCount do begin
         if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
         else Break
        end;

        if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
        then Cost := ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex]
        else Cost := 0;

        _Cost           := Cost;
        if VarIsNull(TreeList.Items[i].Items[j].Values[Index])
        then TreeList.Items[i].Items[j].Values[Index] := 0;
        _Volume         := TreeList.Items[i].Items[j].Values[Index];
        _Summa          := _Cost*_Volume;
       end;
       _id_Object       := TreeList.Items[i].Items[j].Values[3];
       if _id_Object > 0 then begin
         _Name_Object   := DelSpaces(TreeList.Items[i].Items[j].Values[1]);
         if VarIsNull(TreeList.Items[i].Items[j].Values[Index])
         then TreeList.Items[i].Items[j].Values[Index] := 0;
         _Volume        := TreeList.Items[i].Items[j].Values[Index];
       end;
      end;
     end;

     if Flag then begin
      Index := TreeList.ColumnByName('FQntCol_'
             + IntToStr(Fixed[n]._id_Stage)).ItemIndex;

      SetLength(SaveToArray, Length(SaveToArray) + 1);
      with SaveToArray[Length(SaveToArray) - 1] do begin
       _Modified        := 'Edit'; // It has matter only for not_New document
       _id_Department   := SYS_DEF_ID_DEPARTMENT;
       _id_Stage        := Fixed[n]._id_Stage;
       _id_Product      := TreeList.Items[i].Values[0];
       _Name_Product    := TreeList.Items[i].Values[1];
       _id_Cat_Cust     := TreeList.Items[i].Items[j].Values[2];
       _id_Object       := TreeList.Items[i].Items[j].Values[3];
       _Need_Cat_Cust   := TreeList.Items[i].Values[5];
       _Need_Objects    := TreeList.Items[i].Values[6];
       _id_Unit_Meas    := TreeList.Items[i].Values[7];
       _Name_Unit_Meas  := TreeList.Items[i].Values[4];
       _Coefficient     := TreeList.Items[i].Values[8];
       _DispOrder_Prod  := TreeList.Items[i].Values[10];
       _Display_Order   := TreeList.Items[i].Items[j].Values[10];

       if VarIsNull(TreeList.Items[i].Items[j].Values[Index])
       then TreeList.Items[i].Items[j].Values[Index] := 0;

       _Volume := TreeList.Items[i].Items[j].Values[Index];

       if _id_Cat_Cust > 0 then begin
        _Name_Cat_Cust  := TreeList.Items[i].Items[j].Values[1];

        a := ProductTreeList.Columns[Index].VisibleIndexAtBand;
        while a < ProductTreeList.Bands[1].VisibleColumnCount do begin
         if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
         else Break;
        end;

        if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
        then Cost := ProductTreeList.Items[i].Items[j].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex]
        else Cost := 0;

        _Cost           := Cost;

        _Summa          := _Cost*_Volume;
       end
       else if _id_Object > 0 then
        _Name_Object   := DelSpaces(TreeList.Items[i].Items[j].Values[1]);

      end;
     end;
    end;
   end;
  end
  else begin
   for n := 0 to Length(Fixed) - 1 do begin
    if Fixed[n]._id_Doc <> id_Doc then Continue;
    Flag := True;

    for k := 0 to Length(InputStages) - 1 do begin
     if InputStages[k]._id_Doc <> id_Doc then Continue;
     if Fixed[n]._id_Stage <> InputStages[k]._Link_To then Continue;

     Flag := False;
     Index := TreeList.ColumnByName('QntCol_'
            + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

     SetLength(SaveToArray, Length(SaveToArray) + 1);
     with SaveToArray[Length(SaveToArray) - 1] do begin
      _Modified        := 'Edit'; // It has matter only for not_New document
      _id_Department   := SYS_DEF_ID_DEPARTMENT;
      _id_Stage        := InputStages[k]._id_Stage;
      _id_Product      := TreeList.Items[i].Values[0];
      _Name_Product    := TreeList.Items[i].Values[1];
      _Need_Cat_Cust   := TreeList.Items[i].Values[5];
      _Need_Objects    := TreeList.Items[i].Values[6];
      _id_Unit_Meas    := TreeList.Items[i].Values[7];
      _Name_Unit_Meas  := TreeList.Items[i].Values[4];
      _Coefficient     := TreeList.Items[i].Values[8];
      _DispOrder_Prod  := TreeList.Items[i].Values[10];

      if VarIsNull(TreeList.Items[i].Values[Index])
      then TreeList.Items[i].Values[Index] := 0;

      a := ProductTreeList.Columns[Index].VisibleIndexAtBand;
      while a < ProductTreeList.Bands[1].VisibleColumnCount do begin
       if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
       else Break;
      end;

      if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
      then Cost := ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex]
      else Cost := 0;

      _Cost           := Cost;
      _Volume         := TreeList.Items[i].Values[Index];
      _Summa          := _Cost*_Volume;
     end;
    end;

    if Flag then begin
     Index := TreeList.ColumnByName('FQntCol_'
            + IntToStr(Fixed[n]._id_Stage)).ItemIndex;

     SetLength(SaveToArray, Length(SaveToArray) + 1);
     with SaveToArray[Length(SaveToArray) - 1] do begin
      _Modified        := 'Edit'; // It has matter only for not_New document
      _id_Department   := SYS_DEF_ID_DEPARTMENT;
      _id_Stage        := Fixed[n]._id_Stage;
      _id_Product      := TreeList.Items[i].Values[0];
      _Name_Product    := TreeList.Items[i].Values[1];
      _Need_Cat_Cust   := TreeList.Items[i].Values[5];
      _Need_Objects    := TreeList.Items[i].Values[6];
      _id_Unit_Meas    := TreeList.Items[i].Values[7];
      _Name_Unit_Meas  := TreeList.Items[i].Values[4];
      _Coefficient     := TreeList.Items[i].Values[8];
      _DispOrder_Prod  := TreeList.Items[i].Values[10];

      if VarIsNull(TreeList.Items[i].Values[Index])
      then TreeList.Items[i].Values[Index] := 0;

      a := ProductTreeList.Columns[Index].VisibleIndexAtBand;
      while a < ProductTreeList.Bands[1].VisibleColumnCount do begin
       if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
       else Break
      end;

      if Copy(ProductTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
      then Cost := ProductTreeList.Items[i].Values[ProductTreeList.Bands[1].VisibleColumns[a].ItemIndex]
      else Cost := 0;

      _Cost           := Cost;
      _Volume         := TreeList.Items[i].Values[Index];
      _Summa          := _Cost*_Volume;
     end;
    end;
   end;

   if TreeList.Items[i].Values[6] and TreeList.Items[i].HasChildren then begin
    for j := 0 to TreeList.Items[i].Count - 1 do begin
     if TreeList.Items[i].Items[j].Values[0] < -1 then Continue;
     if TreeList.Items[i].Items[j].Values[3] <= 0 then Continue;

     for n := 0 to Length(Fixed) - 1 do begin
      if Fixed[n]._id_Doc <> id_Doc then Continue;

      Flag := True;
      for k := 0 to Length(InputStages) - 1 do begin
       if InputStages[k]._id_Doc <> id_Doc then Continue;
       if InputStages[k]._Link_To <> Fixed[n]._id_Stage then Continue;

       Flag  := False;
       Index := TreeList.ColumnByName('QntCol_'
              + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

       SetLength(SaveToArray, Length(SaveToArray) + 1);
       with SaveToArray[Length(SaveToArray) - 1] do begin
        _Modified        := 'Edit'; // It has matter only for not_New document
        _id_Department   := SYS_DEF_ID_DEPARTMENT;
        _id_Stage        := InputStages[k]._id_Stage;
        _id_Product      := TreeList.Items[i].Values[0];
        _Name_Product    := TreeList.Items[i].Values[1];
        _id_Cat_Cust     := 0;
        _Need_Cat_Cust   := TreeList.Items[i].Values[5];
        _Need_Objects    := TreeList.Items[i].Values[6];
        _id_Object       := TreeList.Items[i].Items[j].Values[3];
        _Name_Object     := DelSpaces(TreeList.Items[i].Items[j].Values[1]);
        _id_Unit_Meas    := TreeList.Items[i].Values[7];
        _Name_Unit_Meas  := TreeList.Items[i].Values[4];
        _Coefficient     := TreeList.Items[i].Values[8];
        _DispOrder_Prod  := TreeList.Items[i].Values[10];
        _Display_Order   := TreeList.Items[i].Items[j].Values[10];

        if VarIsNull(TreeList.Items[i].Items[j].Values[Index])
        then TreeList.Items[i].Items[j].Values[Index] := 0;

        _Volume          := TreeList.Items[i].Items[j].Values[Index];
       end;
      end;

      if Flag then begin
       Index := TreeList.ColumnByName('FQntCol_'
              + IntToStr(Fixed[n]._id_Stage)).ItemIndex;

       SetLength(SaveToArray, Length(SaveToArray) + 1);
       with SaveToArray[Length(SaveToArray) - 1] do begin
        _Modified        := 'Edit'; // It has matter only for not_New document
        _id_Department   := SYS_DEF_ID_DEPARTMENT;
        _id_Stage        := Fixed[n]._id_Stage;
        _id_Product      := TreeList.Items[i].Values[0];
        _Name_Product    := TreeList.Items[i].Values[1];
        _id_Cat_Cust     := 0;
        _id_Object       := TreeList.Items[i].Items[j].Values[3];
        _Need_Cat_Cust   := TreeList.Items[i].Values[5];
        _Need_Objects    := TreeList.Items[i].Values[6];
        _Name_Object     := DelSpaces(TreeList.Items[i].Items[j].Values[1]);
        _id_Unit_Meas    := TreeList.Items[i].Values[7];
        _Name_Unit_Meas  := TreeList.Items[i].Values[4];
        _Coefficient     := TreeList.Items[i].Values[8];
        _DispOrder_Prod  := TreeList.Items[i].Values[10];
        _Display_Order   := TreeList.Items[i].Items[j].Values[10];

        if VarIsNull(TreeList.Items[i].Items[j].Values[Index])
        then TreeList.Items[i].Items[j].Values[Index] := 0;

        _Volume          := TreeList.Items[i].Items[j].Values[Index];
       end;
      end;
     end;
    end;
   end;
  end;
 end;

 if id_Doc > 0 then
  if SaveToWhat = SAVE_TO_PLAN_DATA then
   for i := 0 to Length(SaveToArray) - 1 do begin
    SetLength(PlanDataArray, Length(PlanDataArray) + 1);
    PlanDataArray[Length(PlanDataArray) - 1] := SaveToArray[i];
   end
  else
   for i := 0 to Length(SaveToArray) - 1 do begin
    SetLength(TempPlanDataArray, Length(TempPlanDataArray) + 1);
    TempPlanDataArray[Length(TempPlanDataArray) - 1] := SaveToArray[i];
   end
 else
  if SaveToWhat = SAVE_TO_PLAN_DATA then NewPlanDataArray := Copy(SaveToArray, 0, Length(SaveToArray))
  else TempPlanDataArray := Copy(SaveToArray, 0, Length(SaveToArray));
end;

procedure TPlanEditorForm.SavePlanDataDep(InputStages, Fixed: TStagesArray;
  SaveToWhat: integer);
var
 i, j        : integer;
 a, d        : integer;
 Cost        : Currency;
 k           : integer;
 SaveToArray : TPlanDataArray;
 n           : integer;
 id_Doc      : integer;

 Flag        : boolean;
 Index       : integer;
begin
 if (DepTreeList.Count = 0) or (DepTreeList.Bands.Count = 1) then Exit;
 SaveToArray := nil;
 id_Doc      := GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0];

 for d := 0 to DepTreeList.Count - 1 do begin
  for i := 0 to DepTreeList.Items[d].Count - 1 do begin
   if DepTreeList.Items[d].Items[i].Values[5] then begin
    if DepTreeList.Items[d].Items[i].Count = 0 then Continue;
    for j := 0 to DepTreeList.Items[d].Items[i].Count - 1 do begin
     if DepTreeList.Items[d].Items[i].Items[j].Values[0] < -1 then Continue;
     for n := 0 to Length(Fixed) - 1 do begin
      if Fixed[n]._id_Doc <> id_Doc then Continue;

      Flag := True;
      for k := 0 to Length(InputStages) - 1 do begin
       if InputStages[k]._id_Doc <> id_Doc then Continue;
       if InputStages[k]._Link_To <> Fixed[n]._id_Stage then Continue;

       Flag  := False;
       Index := DepTreeList.ColumnByName('QntCol_'
              + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

       SetLength(SaveToArray, Length(SaveToArray) + 1);
       with SaveToArray[Length(SaveToArray) - 1] do begin
        _Modified        := 'Edit'; // It has matter only for not_New document
        _id_Department   := DepTreeList.Items[d].Values[9];
        _Name_Department := DepTreeList.Items[d].Values[1];
        _id_Stage        := InputStages[k]._id_Stage;
        _id_Product      := DepTreeList.Items[d].Items[i].Values[0];
        _Name_Product    := DepTreeList.Items[d].Items[i].Values[1];
        _id_Cat_Cust     := DepTreeList.Items[d].Items[i].Items[j].Values[2];
        _Need_Cat_Cust   := DepTreeList.Items[d].Items[i].Values[5];
        _Need_Objects    := DepTreeList.Items[d].Items[i].Values[6];
        _id_Unit_Meas    := DepTreeList.Items[d].Items[i].Values[7];
        _Name_Unit_Meas  := DepTreeList.Items[d].Items[i].Values[4];

        _Coefficient     := DepTreeList.Items[d].Items[i].Values[8];

        if _id_Cat_Cust > 0 then begin
         _Name_Cat_Cust  := DepTreeList.Items[d].Items[i].Items[j].Values[1];

         a := DepTreeList.Columns[Index].VisibleIndexAtBand;
         while a < DepTreeList.Bands[1].VisibleColumnCount do begin
          if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
          else Break;
         end;

         if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
         then Cost := DepTreeList.Items[d].Items[i].Items[j].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex]
         else Cost := 0;

         _Cost           := Cost;
         if VarIsNull(DepTreeList.Items[d].Items[i].Items[j].Values[Index])
         then DepTreeList.Items[d].Items[i].Items[j].Values[Index] := 0;
         _Volume         := DepTreeList.Items[d].Items[i].Items[j].Values[Index];
         _Summa          := _Cost*_Volume;
        end;
       end;
      end;

      if Flag then begin
       Index := DepTreeList.ColumnByName('FQntCol_'
              + IntToStr(Fixed[n]._id_Stage)).ItemIndex;

       SetLength(SaveToArray, Length(SaveToArray) + 1);
       with SaveToArray[Length(SaveToArray) - 1] do begin
        _Modified        := 'Edit'; // It has matter only for not_New document
        _id_Department   := DepTreeList.Items[d].Values[9];
        _Name_Department := DepTreeList.Items[d].Values[1];
        _id_Stage        := Fixed[n]._id_Stage;
        _id_Product      := DepTreeList.Items[d].Items[i].Values[0];
        _Name_Product    := DepTreeList.Items[d].Items[i].Values[1];
        _id_Cat_Cust     := DepTreeList.Items[d].Items[i].Items[j].Values[2];
        _Need_Cat_Cust   := DepTreeList.Items[d].Items[i].Values[5];
        _Need_Objects    := DepTreeList.Items[d].Items[i].Values[6];
        _id_Unit_Meas    := DepTreeList.Items[d].Items[i].Values[7];
        _Name_Unit_Meas  := DepTreeList.Items[d].Items[i].Values[4];
        _Coefficient     := DepTreeList.Items[d].Items[i].Values[8];

        if VarIsNull(DepTreeList.Items[d].Items[i].Items[j].Values[Index])
        then DepTreeList.Items[d].Items[i].Items[j].Values[Index] := 0;

        _Volume := DepTreeList.Items[d].Items[i].Items[j].Values[Index];

        if _id_Cat_Cust > 0 then begin
         _Name_Cat_Cust  := DepTreeList.Items[d].Items[i].Items[j].Values[1];

         a := DepTreeList.Columns[Index].VisibleIndexAtBand;
         while a < DepTreeList.Bands[1].VisibleColumnCount do begin
          if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
          else Break;
         end; 

         if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
         then Cost := DepTreeList.Items[d].Items[i].Items[j].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex]
         else Cost := 0;

         _Cost           := Cost;

         _Summa          := _Cost*_Volume;
        end;
       end;
      end;
     end;
    end;
   end
   else begin
    for n := 0 to Length(Fixed) - 1 do begin
     if Fixed[n]._id_Doc <> id_Doc then Continue;
     Flag := True;

     for k := 0 to Length(InputStages) - 1 do begin
      if InputStages[k]._id_Doc <> id_Doc then Continue;
      if Fixed[n]._id_Stage <> InputStages[k]._Link_To then Continue;

      Flag := False;
      Index := DepTreeList.ColumnByName('QntCol_'
             + IntToStr(InputStages[k]._id_Stage)).ItemIndex;

      SetLength(SaveToArray, Length(SaveToArray) + 1);
      with SaveToArray[Length(SaveToArray) - 1] do begin
       _Modified        := 'Edit'; // It has matter only for not_New document
       _id_Department   := DepTreeList.Items[d].Values[9];
       _Name_Department := DepTreeList.Items[d].Values[1];
       _id_Stage        := InputStages[k]._id_Stage;
       _id_Product      := DepTreeList.Items[d].Items[i].Values[0];
       _Name_Product    := DepTreeList.Items[d].Items[i].Values[1];
       _Need_Cat_Cust   := DepTreeList.Items[d].Items[i].Values[5];
       _Need_Objects    := DepTreeList.Items[d].Items[i].Values[6];
       _id_Unit_Meas    := DepTreeList.Items[d].Items[i].Values[7];
       _Name_Unit_Meas  := DepTreeList.Items[d].Items[i].Values[4];
       _Coefficient     := DepTreeList.Items[d].Items[i].Values[8];

       if VarIsNull(DepTreeList.Items[d].Items[i].Values[Index])
       then DepTreeList.Items[d].Items[i].Values[Index] := 0;

       a := DepTreeList.Columns[Index].VisibleIndexAtBand;
       while a < DepTreeList.Bands[1].VisibleColumnCount do begin
        if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
        else Break;
       end; 

       if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
       then Cost := DepTreeList.Items[d].Items[i].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex]
       else Cost := 0;

       _Cost           := Cost;
       _Volume         := DepTreeList.Items[d].Items[i].Values[Index];
       _Summa          := _Cost*_Volume;
      end;
     end;

     if Flag then begin
      Index := DepTreeList.ColumnByName('FQntCol_'
             + IntToStr(Fixed[n]._id_Stage)).ItemIndex;

      SetLength(SaveToArray, Length(SaveToArray) + 1);
      with SaveToArray[Length(SaveToArray) - 1] do begin
       _Modified        := 'Edit'; // It has matter only for not_New document
       _id_Department   := DepTreeList.Items[d].Values[9];
       _Name_Department := DepTreeList.Items[d].Values[1];
       _id_Stage        := Fixed[n]._id_Stage;
       _id_Product      := DepTreeList.Items[d].Items[i].Values[0];
       _Name_Product    := DepTreeList.Items[d].Items[i].Values[1];
       _Need_Cat_Cust   := DepTreeList.Items[d].Items[i].Values[5];
       _Need_Objects    := DepTreeList.Items[d].Items[i].Values[6];
       _id_Unit_Meas    := DepTreeList.Items[d].Items[i].Values[7];
       _Name_Unit_Meas  := DepTreeList.Items[d].Items[i].Values[4];
       _Coefficient     := DepTreeList.Items[d].Items[i].Values[8];

       if VarIsNull(DepTreeList.Items[d].Items[i].Values[Index])
       then DepTreeList.Items[d].Items[i].Values[Index] := 0;

       a := DepTreeList.Columns[Index].VisibleIndexAtBand;
       while a < DepTreeList.Bands[1].VisibleColumnCount do begin
        if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) <> 'PriceC' then inc(a)
        else Break;
       end;

       if Copy(DepTreeList.Bands[1].VisibleColumns[a].Name, 0, 6) = 'PriceC'
       then Cost := DepTreeList.Items[d].Items[i].Values[DepTreeList.Bands[1].VisibleColumns[a].ItemIndex]
       else Cost := 0;

       _Cost           := Cost;
       _Volume         := DepTreeList.Items[d].Items[i].Values[Index];
       _Summa          := _Cost*_Volume;
      end;
     end;
    end;
   end;
  end;
 end;

 if id_Doc > 0 then
  if SaveToWhat = SAVE_TO_PLAN_DATA then
   for i := 0 to Length(SaveToArray) - 1 do begin
    SetLength(PlanDataArray, Length(PlanDataArray) + 1);
    PlanDataArray[Length(PlanDataArray) - 1] := SaveToArray[i];
   end
  else
   for i := 0 to Length(SaveToArray) - 1 do begin
    SetLength(TempPlanDataArray, Length(TempPlanDataArray) + 1);
    TempPlanDataArray[Length(TempPlanDataArray) - 1] := SaveToArray[i];
   end
 else
  if SaveToWhat = SAVE_TO_PLAN_DATA then NewPlanDataArray := Copy(SaveToArray, 0, Length(SaveToArray))
  else TempPlanDataArray := Copy(SaveToArray, 0, Length(SaveToArray));
end;

function TPlanEditorForm.CreateColumn(TreeList : TcxTreeList; BandNum : integer; ColName, CaptionText : string;
         CaptionAlignHorz: TAlignment; CaptionAlignVert : TcxAlignmentVert; TextAlignHorz: TAlignment;
         ColWidth : integer; ColVisible, ColSorting : boolean; Tag : integer = 0) : TcxTreeListColumn;
var
 s : string;
begin
 Result                   := TreeList.CreateColumn(TreeList.Bands[BandNum]);
 Result.Name              := ColName;

 Result.Caption.Text      := CaptionText;
 Result.Caption.AlignHorz := CaptionAlignHorz;
 Result.Caption.AlignVert := CaptionAlignVert;

 Result.Width             := ColWidth;
 Result.Visible           := ColVisible;
 Result.Options.Sorting   := ColSorting;

 s := Copy(ColName, 1, 6);
 if (s = 'FQntCo') or (s = 'QntCol') then begin
  Result.OnGetEditProperties := DoColumnGetEditProperties;
 end
 else begin
  Result.PropertiesClass   := TcxTextEditProperties;
  TcxTextEditProperties(Result.Properties).Alignment.Horz := TextAlignHorz;
 end;

 Result.Tag := Tag;
end;

procedure TPlanEditorForm.MakeTreeList(InputArray, InputFixed : TStagesArray;
          id_Doc : integer; TreeList : TcxTreeList);
var
 NewCol          : TcxTreeListColumn;
 i, j            : integer;
 Last_id_CostBeg : integer;
 Flag            : boolean;

 s               : string;
begin
// TreeList.Bands[1].Width := 0;
// TreeList.Bands[2].Width := 0;

 CreateColumn(TreeList, 1, 'YearQntColumn', 'За рік', taCenter, vaCenter, taRightJustify, 70,
              not YearPlan, False);

 CreateColumn(TreeList, 1, 'TotalQntCol', 'За ' + GetPeriodName(Plan_Date_Beg, Plan_Date_End),
              taCenter, vaCenter, taRightJustify, 95, True, False);

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 Last_id_CostBeg :=  -1;

 for i := 0 to Length(InputFixed) - 1 do begin
  if InputFixed[i]._id_Doc <> id_Doc then Continue;
  Flag := True;
  for j := 0 to Length(InputArray) - 1 do begin
   if InputArray[j]._id_Doc <> id_Doc then Continue;
   if InputArray[j]._Link_To <> InputFixed[i]._id_Stage then Continue;

   FLag := False;

   if InputArray[j]._isItCostBeg then begin
    CreateColumn(TreeList, 1, 'PriceCol_' + IntToStr(InputArray[j]._id_Stage),
                 'Тариф за од. пр-ції', taCenter, vaCenter, taRightJustify, 60, True, False);

    Last_id_CostBeg           := InputArray[j]._id_Stage;
   end;


   CreateColumn(TreeList, 1, 'QntCol_' + IntToStr(InputArray[j]._id_Stage),
                GetPeriodName(InputArray[j]._Date_Beg, InputArray[j]._Date_End),
                taCenter, vaCenter, taRightJustify, 60, True, False, Integer(@InputArray[j]));

   if Last_id_CostBeg > 0 then begin
    NewCol := TreeList.ColumnByName('PriceCol_' + IntToStr(Last_id_CostBeg));
    NewCol.Position.ColIndex := NewCol.Position.ColIndex + 1;
   end;
  end;

  if Flag and InputFixed[i]._isItCostBeg then begin
   CreateColumn(TreeList, 1, 'PriceCol_' + IntToStr(InputFixed[i]._id_Stage),
                'Тариф за од. пр-ції' , taCenter, vaCenter, taRightJustify, 60, True, False);

   Last_id_CostBeg           := InputFixed[i]._id_Stage;
  end;

  if Flag then
   s := GetPeriodName(InputFixed[i]._Date_Beg, InputFixed[i]._Date_End)
  else
   s := 'Всього за ' + GetPeriodName(InputFixed[i]._Date_Beg, InputFixed[i]._Date_End);

  CreateColumn(TreeList, 1, 'FQntCol_' + IntToStr(InputFixed[i]._id_Stage),
               s , taCenter, vaCenter, taRightJustify, 60, True, False, Integer(@InputFixed[i]));



  if Last_id_CostBeg > 0 then begin
   NewCol := TreeList.ColumnByName('PriceCol_' + IntToStr(Last_id_CostBeg));
   NewCol.Position.ColIndex := NewCol.Position.ColIndex + 1;
  end;
 end;

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

 CreateColumn(TreeList, 2, 'YearCostColumn', 'За рік', taCenter, vaCenter, taRightJustify, 70,
              not YearPlan, False);

 CreateColumn(TreeList, 2, 'TotalCostCol', 'За ' + GetPeriodName(Plan_Date_Beg, Plan_Date_End),
              taCenter, vaCenter, taRightJustify, 90, True, False);

 for i := 0 to Length(InputFixed) - 1 do begin
  if InputFixed[i]._id_Doc <> id_Doc then Continue;

  Flag := True;
  for j := 0 to Length(InputArray) - 1 do begin
   if InputArray[j]._id_Doc <> id_Doc then Continue;
   if InputArray[j]._Link_To <> InputFixed[i]._id_Stage then Continue;

   Flag := False;

   CreateColumn(TreeList, 2, 'CostCol_' + IntToStr(InputArray[j]._id_Stage),
                GetPeriodName(InputArray[j]._Date_Beg, InputArray[j]._Date_End),
                taCenter, vaCenter, taRightJustify, 60, True, False, Integer(@InputArray[j]));
  end;

  if Flag then
   s := GetPeriodName(InputFixed[i]._Date_Beg, InputFixed[i]._Date_End)
  else
   s := 'Всього за ' + GetPeriodName(InputFixed[i]._Date_Beg, InputFixed[i]._Date_End);

  CreateColumn(TreeList, 2, 'FCostCol_' + IntToStr(InputFixed[i]._id_Stage),
               s, taCenter, vaCenter, taRightJustify, 60, True, False, Integer(@InputFixed[i]));
 end;
end;

procedure TPlanEditorForm.TreeListClearNodes(TreeList : TcxTreeList);
begin
 TreeList.Clear;
 while TreeList.ColumnCount > LAST_COL + 1 do
  TreeList.Columns[TreeList.ColumnCount - 1].Destroy;
end;

procedure TPlanEditorForm.AddNode(InputStagesRecord, InputFixedRecord: TStagesRecord;
          InputDataRecord: TPlanDataRecord; TreeList : TcxTreeList;
          OnlyFixed : boolean = False);
var
 i     : integer;
 Node  : TcxTreeListNode;
 Child : TcxTreeListNode;

 Flag  : boolean;
begin
 Flag := True;
 for i := 0 to TreeList.Count - 1 do
  if TreeList.Items[i].Values[0] = InputDataRecord._id_Product  then begin
   Flag := False;
   Break;
  end;

 if Flag then begin
  Node := TreeList.Add;

  Node.Values[0]  := InputDataRecord._id_Product;
  Node.Values[1]  := InputDataRecord._Name_Product;
  Node.Values[4]  := InputDataRecord._Name_Unit_Meas;
  Node.Values[5]  := InputDataRecord._Need_Cat_Cust;
  Node.Values[6]  := InputDataRecord._Need_Objects;
  Node.Values[7]  := InputDataRecord._id_Unit_Meas;
  Node.Values[8]  := InputDataRecord._Coefficient;
  Node.Values[10] := InputDataRecord._DispOrder_Prod;
 end
 else Node := TreeList.Items[i];

 if Node.Values[5] then begin
  if InputDataRecord._id_Cat_Cust > 0 then begin
   Flag := True;
   for i := 0 to Node.Count - 1 do
    if Node.Items[i].Values[2] = InputDataRecord._id_Cat_Cust then begin
     Flag := False;
     Break;
    end;

   if Flag then begin
    Child := Node.AddChild;

    Child.Values[0]  := -1;
    Child.Values[1]  := InputDataRecord._Name_Cat_Cust;
    Child.Values[2]  := InputDataRecord._id_Cat_Cust;
    Child.Values[3]  := 0;
    Child.Values[10] := InputDataRecord._Display_Order;
   end
   else Child := Node.Items[i];

   if OnlyFixed then begin
    Child.Values[TreeList.ColumnByName('FQntCol_'
         + IntToStr(InputFixedRecord._id_Stage)).ItemIndex]
         := InputDataRecord._Volume;

    if InputFixedRecord._isItCostBeg then
     Child.Values[TreeList.ColumnByName('PriceCol_'
           + IntToStr(InputFixedRecord._id_Stage)).ItemIndex]
           := InputDataRecord._Cost;
   end
   else begin
    Child.Values[TreeList.ColumnByName('QntCol_'
         + IntToStr(InputStagesRecord._id_Stage)).ItemIndex]
         := InputDataRecord._Volume;

    if InputStagesRecord._isItCostBeg then
     Child.Values[TreeList.ColumnByName('PriceCol_'
           + IntToStr(InputStagesRecord._id_Stage)).ItemIndex]
           := InputDataRecord._Cost;
   end;
  end
  else if InputDataRecord._id_Object > 0 then begin
   Flag := True;
   for i := 0 to Node.Count - 1 do begin
    if Node.Items[i].Values[2] > 0 then Continue;
    if Node.Items[i].Values[3] = InputDataRecord._id_Object then begin
     Flag := False;
     Break;
    end;
   end;

   if Flag then begin
    Child := Node.AddChild;

    Child.Values[0]  := -1;
    Child.Values[1]  := AddSpaces(InputDataRecord._Name_Object);
    Child.Values[2]  := 0;
    Child.Values[3]  := InputDataRecord._id_Object;
    Child.Values[10] := InputDataRecord._Display_Order;
   end
   else Child := Node.Items[i];

   if OnlyFixed then
    Child.Values[TreeList.ColumnByName('FQntCol_'
         + IntToStr(InputFixedRecord._id_Stage)).ItemIndex]
         := InputDataRecord._Volume
   else
    Child.Values[TreeList.ColumnByName('QntCol_'
         + IntToStr(InputStagesRecord._id_Stage)).ItemIndex]
         := InputDataRecord._Volume;
  end;
 end
 else begin
  if Node.Values[6] and (InputDataRecord._id_Object > 0) then begin
    Flag := True;
    for i := 0 to Node.Count - 1 do begin
     if Node.Items[i].Values[2] > 0 then Continue;
     if Node.Items[i].Values[3] = InputDataRecord._id_Object then begin
      Flag := False;
      Break;
     end;
    end;

    if Flag then begin
     Child := Node.AddChild;

     Child.Values[0]  := -1;
     Child.Values[1]  := AddSpaces(InputDataRecord._Name_Object);
     Child.Values[2]  := 0;
     Child.Values[3]  := InputDataRecord._id_Object;
     Child.Values[10] := InputDataRecord._Display_Order;
    end
    else Child := Node.Items[i];

    if OnlyFixed then
     Child.Values[TreeList.ColumnByName('FQntCol_'
          + IntToStr(InputFixedRecord._id_Stage)).ItemIndex]
          := InputDataRecord._Volume
    else
     Child.Values[TreeList.ColumnByName('QntCol_'
          + IntToStr(InputStagesRecord._id_Stage)).ItemIndex]
          := InputDataRecord._Volume;
  end
  else begin
   if OnlyFixed then begin
    Node.Values[TreeList.ColumnByName('FQntCol_'
         + IntToStr(InputFixedRecord._id_Stage)).ItemIndex]
         := InputDataRecord._Volume;

    if InputFixedRecord._isItCostBeg then
     Node.Values[TreeList.ColumnByName('PriceCol_'
           + IntToStr(InputFixedRecord._id_Stage)).ItemIndex]
           := InputDataRecord._Cost;
   end
   else begin
    Node.Values[TreeList.ColumnByName('QntCol_'
         + IntToStr(InputStagesRecord._id_Stage)).ItemIndex]
         := InputDataRecord._Volume;

    if InputStagesRecord._isItCostBeg then
     Node.Values[TreeList.ColumnByName('PriceCol_'
           + IntToStr(InputStagesRecord._id_Stage)).ItemIndex]
           := InputDataRecord._Cost;
   end;
  end;
 end;
end;

procedure TPlanEditorForm.FillProductTreeList(isItNewDoc : boolean; InputStagesArray,
          InputFixed : TStagesArray; InputPlanDataArray : TPlanDataArray; id_Doc,
          Coefficient : integer);
var
 i, j, k       : integer;
 Product_Array : TIntArray;
 Flag          : boolean;
 Edited        : boolean;

 EmptyRecord   : TStagesRecord;
begin
 Product_Array := nil;

 if Length(InputPlanDataArray) = 0 then Exit;

 ProductTreeList.BeginUpdate;

 Flag := False;
 for i := 0 to Length(EditedDocArray) - 1 do
  if EditedDocArray[i] = id_Doc then begin
   Flag := True;
   Break;
  end;

 Edited := Flag;

 for i := 0 to Length(InputFixed) - 1 do begin
  if InputFixed[i]._id_Doc <> id_Doc then Continue;
  Flag := True;
  for j := 0 to Length(InputStagesArray) - 1 do begin
   if InputStagesArray[j]._id_Doc <> id_Doc then Continue;
   if InputStagesArray[j]._Link_To <> InputFixed[i]._id_Stage then Continue;

   for k := 0 to Length(InputPlanDataArray) - 1 do begin
    if Edited and (InputPlanDataArray[k]._Modified <> 'Edit') then Continue;

    if InputPlanDataArray[k]._id_Stage = InputStagesArray[j]._id_Stage then
     AddNode(InputStagesArray[j], InputFixed[i], InputPlanDataArray[k], ProductTreeList);
   end;

   Flag := False;

   if InputStagesArray[j]._Date_End = InputFixed[i]._Date_End then Break;
  end;

  if Flag then
   for k := 0 to Length(InputPlanDataArray) - 1 do begin
    if Edited and (InputPlanDataArray[k]._Modified <> 'Edit') then Continue;

    if InputPlanDataArray[k]._id_Stage = InputFixed[i]._id_Stage then
     AddNode(EmptyRecord, InputFixed[i], InputPlanDataArray[k], ProductTreeList, True);
   end;
 end;

 SortObjects_and_CatCust;

 if ApplyButton.Visible = ivAlways then
  CalcSumms(TempStagesArray, TempFixedStages, id_Doc, Coefficient)
 else begin
  if id_Doc > 0 then
   CalcSumms(StagesArray, FixedStages, id_Doc, Coefficient)
  else
   CalcSumms(NewStagesArray, NewFixedStages, id_Doc, Coefficient);
 end;

 ProductTreeList.EndUpdate;
 ProductTreeList.FullExpand;
end;

procedure TPlanEditorForm.FillOnlyDataWithCompare(OldStages, NewStages,
          Fixed : TStagesArray; DataArray : TPlanDataArray; id_Doc : integer);
var
 i, j, k           : integer;
 Multiplicator     : Currency;
 p, r              : integer;
 Flag              : boolean;
 Flag2             : boolean;
 f                 : integer;
 Bool              : boolean;
begin
 if Length(Fixed) = 0 then Exit;

 ProductTreeList.BeginUpdate;

 for f := 0 to Length(Fixed) - 1 do begin
  if Fixed[f]._id_Doc <> id_Doc then Continue;
  Bool := True;

  for i := 0 to Length(NewStages) - 1 do begin
   if NewStages[i]._id_Doc <> id_Doc then Continue;
   if NewStages[i]._Link_To <> Fixed[f]._id_Stage then Continue;
   Flag2 := True;

   for k := 0 to Length(OldStages) - 1 do begin
    if OldStages[k]._id_Doc <> id_Doc then Continue;
    if OldStages[i]._Link_To <> Fixed[f]._id_Stage then Continue;

    Flag2 := False;

    if (NewStages[i]._Date_Beg > OldStages[k]._Date_End)
    or (NewStages[i]._Date_End < OldStages[k]._Date_Beg)
    then Continue;

    if (NewStages[i]._Date_Beg >= OldStages[k]._Date_Beg)
    and (NewStages[i]._Date_End <= OldStages[k]._Date_End)
    then begin
     Multiplicator := (NewStages[i]._Date_End - NewStages[i]._Date_Beg)
                     /(OldStages[k]._Date_End - OldStages[k]._Date_Beg);
     Break;
    end;
   end;

   if Flag2 then
    Multiplicator := (NewStages[i]._Date_End - NewStages[i]._Date_Beg)
                    /(Fixed[f]._Date_End - Fixed[f]._Date_Beg);

   for j := 0 to Length(DataArray) - 1 do begin
    if DataArray[j]._id_Stage <> NewStages[i]._id_Stage then Continue;

    p := 0;
    Flag := False;
    while (not Flag) and (p <= ProductTreeList.Count - 2) do begin
     if ProductTreeList.Items[p].Values[0] = DataArray[j]._id_Product
     then Flag := True
     else inc(p);
    end;

    if not Flag then Continue;

    if DataArray[j]._Need_Cat_Cust then begin
     if DataArray[j]._id_Cat_Cust > 0 then begin
      r := 0;
      Flag := False;
      while (not Flag) and (r <= ProductTreeList.Items[p].Count - 2) do begin
       if ProductTreeList.Items[p].Items[r].Values[0] < -1 then begin
        Inc(r);
        Continue;
       end;

       if ProductTreeList.Items[p].Items[r].Values[2] = DataArray[j]._id_Cat_Cust
       then Flag := True
       else inc(r);
      end;

      if not Flag then Continue;

      ProductTreeList.Items[p].Items[r].Values[ProductTreeList.ColumnByName('QntCol_'
      + IntToStr(NewStages[i]._id_Stage)).ItemIndex] := Integer(Round(DataArray[j]._Volume*Multiplicator));

      if NewStages[i]._isItCostBeg then
       ProductTreeList.Items[p].Items[r].Values[ProductTreeList.ColumnByName('PriceCol_'
       + IntToStr(NewStages[i]._id_Stage)).ItemIndex] := DataArray[j]._Cost;

     end;
    end
    else begin
     if (DataArray[j]._id_Cat_Cust <= 0) and (DataArray[j]._id_Object <= 0) then begin
      ProductTreeList.Items[p].Values[ProductTreeList.ColumnByName('QntCol_'
      + IntToStr(NewStages[i]._id_Stage)).ItemIndex] := Integer(Round(DataArray[j]._Volume*Multiplicator));

      if NewStages[i]._isItCostBeg then
       ProductTreeList.Items[p].Values[ProductTreeList.ColumnByName('PriceCol_'
       + IntToStr(NewStages[i]._id_Stage)).ItemIndex] := DataArray[j]._Cost;
      end;
    end;

    if DataArray[j]._Need_Objects then
     if DataArray[j]._id_Object > 0 then begin
      r := 0;
      Flag := False;
      while (not Flag) and (r <= ProductTreeList.Items[p].Count - 2) do begin
       if ProductTreeList.Items[p].Items[r].Values[0] < -1 then begin
        Inc(r);
        Continue;
       end;

       if ProductTreeList.Items[p].Items[r].Values[3] = DataArray[j]._id_Object
       then Flag := True
       else inc(r);
      end;

      if not Flag then Continue;

      ProductTreeList.Items[p].Items[r].Values[ProductTreeList.ColumnByName('QntCol_'
      + IntToStr(NewStages[i]._id_Stage)).ItemIndex] := Integer(Round(DataArray[j]._Volume*Multiplicator));
     end;
   end;
  end;

  if Bool then begin
   Multiplicator := 1;
   for j := 0 to Length(DataArray) - 1 do begin
    if DataArray[j]._id_Stage <> Fixed[f]._id_Stage then Continue;

    p := 0;
    Flag := False;
    while (not Flag) and (p <= ProductTreeList.Count - 2) do begin
     if ProductTreeList.Items[p].Values[0] = DataArray[j]._id_Product
     then Flag := True
     else inc(p);
    end;

    if not Flag then Continue;

    if DataArray[j]._Need_Cat_Cust then begin
     if DataArray[j]._id_Cat_Cust > 0 then begin
      r := 0;
      Flag := False;
      while (not Flag) and (r <= ProductTreeList.Items[p].Count - 1) do begin
       if ProductTreeList.Items[p].Items[r].Values[0] < -1 then begin
        Inc(r);
        Continue;
       end;

       if ProductTreeList.Items[p].Items[r].Values[2] = DataArray[j]._id_Cat_Cust
       then Flag := True
       else inc(r);
      end;

      if not Flag then Continue;

      ProductTreeList.Items[p].Items[r].Values[ProductTreeList.ColumnByName('FQntCol_'
      + IntToStr(Fixed[f]._id_Stage)).ItemIndex] := Integer(Round(DataArray[j]._Volume*Multiplicator));

      if Fixed[f]._isItCostBeg then
       ProductTreeList.Items[p].Items[r].Values[ProductTreeList.ColumnByName('PriceCol_'
       + IntToStr(Fixed[f]._id_Stage)).ItemIndex] := DataArray[j]._Cost;

     end;
    end
    else begin
     if (DataArray[j]._id_Cat_Cust <= 0) and (DataArray[j]._id_Object <= 0) then begin
      ProductTreeList.Items[p].Values[ProductTreeList.ColumnByName('FQntCol_'
      + IntToStr(Fixed[f]._id_Stage)).ItemIndex] := Integer(Round(DataArray[j]._Volume*Multiplicator));

      if Fixed[f]._isItCostBeg then
       ProductTreeList.Items[p].Values[ProductTreeList.ColumnByName('PriceCol_'
       + IntToStr(Fixed[f]._id_Stage)).ItemIndex] := DataArray[j]._Cost;
      end;
    end;

    if DataArray[j]._Need_Objects then
     if DataArray[j]._id_Object > 0 then begin
      r := 0;
      Flag := False;
      while (not Flag) and (r <= ProductTreeList.Items[p].Count - 1) do begin
       if ProductTreeList.Items[p].Items[r].Values[0] < -1 then begin
        Inc(r);
        Continue;
       end;

       if ProductTreeList.Items[p].Items[r].Values[3] = DataArray[j]._id_Object
       then Flag := True
       else inc(r);
      end;

      if not Flag then Continue;

      ProductTreeList.Items[p].Items[r].Values[ProductTreeList.ColumnByName('FQntCol_'
      + IntToStr(Fixed[f]._id_Stage)).ItemIndex] := Integer(Round(DataArray[j]._Volume*Multiplicator));
     end;
   end;
  end;
 end;

 ProductTreeList.EndUpdate;
end;

procedure TPlanEditorForm.FillOnlyData(Stages, Fixed : TStagesArray;
          PlanData : TPlanDataArray; id_Doc : integer);
var
 i, j, k, d : integer;
 Flag       : boolean;
 ColNum     : integer;
 f          : integer;
 Bool       : boolean;
begin
 if (Length(Stages) = 0) or (Length(PlanData) = 0) then Exit;

 ProductTreeList.BeginUpdate;

 for i := 0 to ProductTreeList.Count - 1 do begin
  if ProductTreeList.Items[i].Values[0] < -1 then Continue;
  if ProductTreeList.Items[i].HasChildren then begin
   for d := 0 to ProductTreeList.Items[i].Count - 1 do begin
    if ProductTreeList.Items[i].Items[d].Values[0] < -1 then Continue;
    for f := 0 to Length(Fixed) - 1 do begin
     if Fixed[f]._id_Doc <> id_Doc then Continue;
     Bool := True;
     for j := 0 to Length(Stages) - 1 do begin
      if Stages[j]._id_Doc <> id_Doc then Continue;
      if Stages[j]._Link_To <> Fixed[f]._id_Stage then Continue;
      Bool := False;

      Flag := False;
      for k := 0 to Length(PlanData) - 1 do
       if (PlanData[k]._id_Stage = Stages[j]._id_Stage)
       and (PlanData[k]._id_Product = ProductTreeList.Items[i].Values[0])
       and (PlanData[k]._id_Cat_Cust = ProductTreeList.Items[i].Items[d].Values[2])
       and (PlanData[k]._id_Object = ProductTreeList.Items[i].Items[d].Values[3])
       then begin
        Flag := True;
        Break;
       end;

      ColNum := ProductTreeList.ColumnByName('QntCol_' + IntToStr(Stages[j]._id_Stage)).ItemIndex;
      if Flag then ProductTreeList.Items[i].Items[d].Values[ColNum] := PlanData[k]._Volume;

      if Stages[j]._isItCostBeg then begin
       ColNum := ProductTreeList.ColumnByName('PriceCol_' + IntToStr(Stages[j]._id_Stage)).ItemIndex;
       ProductTreeList.Items[i].Items[d].Values[ColNum] := PlanData[k]._Cost;
      end;
     end;

     if Bool then begin
      Flag := False;
      for k := 0 to Length(PlanData) - 1 do
       if (PlanData[k]._id_Stage = Fixed[f]._id_Stage)
       and (PlanData[k]._id_Product = ProductTreeList.Items[i].Values[0])
       and (PlanData[k]._id_Cat_Cust = ProductTreeList.Items[i].Items[d].Values[2])
       and (PlanData[k]._id_Object = ProductTreeList.Items[i].Items[d].Values[3])
       then begin
        Flag := True;
        Break;
       end;

      ColNum := ProductTreeList.ColumnByName('FQntCol_' + IntToStr(Fixed[f]._id_Stage)).ItemIndex;
      if Flag then ProductTreeList.Items[i].Items[d].Values[ColNum] := PlanData[k]._Volume;

      if Fixed[f]._isItCostBeg then begin
       ColNum := ProductTreeList.ColumnByName('PriceCol_' + IntToStr(Fixed[f]._id_Stage)).ItemIndex;
       ProductTreeList.Items[i].Items[d].Values[ColNum] := PlanData[k]._Cost;
      end;
     end;
    end;
   end;
  end
  else begin
   for f := 0 to Length(Fixed) - 1 do begin
    if Fixed[f]._id_Doc <> id_Doc then Continue;
    Bool := True;
    for j := 0 to Length(Stages) - 1 do begin
     if Stages[j]._id_Doc <> id_Doc then Continue;
     if Stages[j]._Link_To <> Fixed[f]._id_Stage then Continue;

     Flag := False;
     for k := 0 to Length(PlanData) - 1 do
      if (PlanData[k]._id_Stage = Stages[j]._id_Stage)
      and (PlanData[k]._id_Product = ProductTreeList.Items[i].Values[0])
      then begin
       Flag := True;
       Break;
      end;

     if Flag then ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('QntCol_'
     + IntToStr(Stages[j]._id_Stage)).ItemIndex] := PlanData[k]._Volume;

     if Stages[j]._isItCostBeg
     then ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('PriceCol_'
     + IntToStr(Stages[j]._id_Stage)).ItemIndex] := PlanData[k]._Cost;
    end;

    if Bool then begin
     Flag := False;
     for k := 0 to Length(PlanData) - 1 do
      if (PlanData[k]._id_Stage = Fixed[f]._id_Stage)
      and (PlanData[k]._id_Product = ProductTreeList.Items[i].Values[0])
      then begin
       Flag := True;
       Break;
      end;

     if Flag then ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('FQntCol_'
     + IntToStr(Fixed[f]._id_Stage)).ItemIndex] := PlanData[k]._Volume;

     if Fixed[f]._isItCostBeg
     then ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('PriceCol_'
     + IntToStr(Fixed[f]._id_Stage)).ItemIndex] := PlanData[k]._Cost;
    end;
   end;
  end;
 end;

 ProductTreeList.EndUpdate;
end;

procedure TPlanEditorForm.SaveResult;
var
 i, j, f   : integer;
 Flag      : boolean;
 id_Doc    : integer;
 id_Fixed  : integer;
 id_Stage  : integer;
begin
 if (Length(NewFixedStages) = 0) then Exit;

 Flag := False;
 id_Doc := 0;
 for i := 0 to GridDoc.DataController.RecordCount - 1 do begin
  if GridDoc.DataController.Values[i, 0] = '-1' then begin
   StoredProc.ExecProcedure('SP_DT_PLAN_DOC_ADD', [id_Plan, GridDoc.DataController.Values[i, 1],
   GridDoc.DataController.Values[i, 2], GridDoc.DataController.Values[i, 3], 0, GridDoc.DataController.Values[i, 5]]);
   id_Doc := StoredProc['id_Doc_Param'].AsInteger;
   Flag := True;
   Break;
  end;
 end;
 if not(Flag) then Exit;

 for f := 0 to Length(NewFixedStages) - 1 do begin
  StoredProc.ExecProcedure('PROC_DT_STAGE_ADD', [id_Doc, '-1', NewFixedStages[f]._Date_Beg,
   NewFixedStages[f]._Date_End]);

  id_Fixed := StoredProc['ID_STAGE_PARAM'].AsInteger;

  Flag := True;
  for i := 0 to Length(NewStagesArray) - 1 do begin
   if NewFixedStages[f]._id_Stage <> NewStagesArray[i]._Link_To then Continue;

   Flag := False;

   StoredProc.ExecProcedure('PROC_DT_STAGE_ADD', [id_Doc, id_Fixed,
   NewStagesArray[i]._Date_Beg, NewStagesArray[i]._Date_End]);
   id_Stage := StoredProc['ID_STAGE_PARAM'].AsInteger;
   for j := 0 to Length(NewPlanDataArray) - 1 do begin
    if not(NewPlanDataArray[j]._id_Stage = NewStagesArray[i]._id_Stage) or (id_Stage < 0)
    then Continue;

    if NewPlanDataArray[j]._id_Cat_Cust > 0 then begin
     StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_ADD', [id_Stage,
     NewPlanDataArray[j]._id_Department, NewPlanDataArray[j]._id_Product,
     NewPlanDataArray[j]._id_Unit_Meas, NewPlanDataArray[j]._id_Cat_Cust,
     NewPlanDataArray[j]._Cost, NewPlanDataArray[j]._Volume, NewPlanDataArray[j]._Summa,
     0, Sys_Max_TimeStamp]);
    end
    else if NewPlanDataArray[j]._id_Object > 0 then begin
     StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_ADD', [id_Stage,
     NewPlanDataArray[j]._id_Department, NewPlanDataArray[j]._id_Product,
     NewPlanDataArray[j]._id_Unit_Meas, 0, 0, NewPlanDataArray[j]._Volume, 0,
     NewPlanDataArray[j]._id_Object, Sys_Max_TimeStamp]);
    end
    else
     StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_ADD', [id_Stage,
     NewPlanDataArray[j]._id_Department, NewPlanDataArray[j]._id_Product,
     NewPlanDataArray[j]._id_Unit_Meas, 0, NewPlanDataArray[j]._Cost, NewPlanDataArray[j]._Volume,
     NewPlanDataArray[j]._Summa, 0, Sys_Max_TimeStamp]);
   end;
  end;

  if Flag then begin
   for j := 0 to Length(NewPlanDataArray) - 1 do begin
    if NewPlanDataArray[j]._id_Stage <> NewFixedStages[f]._id_Stage then Continue;

    if NewPlanDataArray[j]._id_Cat_Cust > 0 then begin
     StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_ADD', [id_Fixed,
     NewPlanDataArray[j]._id_Department, NewPlanDataArray[j]._id_Product,
     NewPlanDataArray[j]._id_Unit_Meas, NewPlanDataArray[j]._id_Cat_Cust, NewPlanDataArray[j]._Cost,
     NewPlanDataArray[j]._Volume, NewPlanDataArray[j]._Summa, 0, Sys_Max_TimeStamp]);
    end
    else if NewPlanDataArray[j]._id_Object > 0 then begin
     StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_ADD', [id_Fixed,
     NewPlanDataArray[j]._id_Department, NewPlanDataArray[j]._id_Product,
     NewPlanDataArray[j]._id_Unit_Meas, 0, 0, NewPlanDataArray[j]._Volume, 0,
     NewPlanDataArray[j]._id_Object, Sys_Max_TimeStamp]);
    end
    else
     StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_ADD', [id_Fixed,
     NewPlanDataArray[j]._id_Department, NewPlanDataArray[j]._id_Product,
     NewPlanDataArray[j]._id_Unit_Meas, 0, NewPlanDataArray[j]._Cost, NewPlanDataArray[j]._Volume,
     NewPlanDataArray[j]._Summa, 0, Sys_Max_TimeStamp]);
   end;
  end;
 end;

 if YearPlan
 then StoredProc.ExecProcedure('PROC_DT_PLANS_MARK_AS_CHANGED', [id_Plan, 0])
 else StoredProc.ExecProcedure('PROC_DT_PLANS_MARK_AS_CHANGED', [id_Year_Plan, 1]);
end;

procedure TPlanEditorForm.EditStages;
var
 i, j, t  : integer;
begin
 if ProductTreeList.Bands.Count = 1 then Exit;

 if New_Stages_Form <> nil then Exit;
 Application.CreateForm(TNew_Stages_Form, New_Stages_Form);

 New_Stages_Form.StringGridStage.DataController.BeginUpdate;

 for i := 0 to Length(TempFixedStages) - 1 do begin
  if TempFixedStages[i]._id_Doc <> GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0] then Continue;
  New_Stages_Form.StringGridStage.DataController.RecordCount := New_Stages_Form.StringGridStage.DataController.RecordCount + 1;

  New_Stages_Form.StringGridStage.DataController.Values[New_Stages_Form.StringGridStage.DataController.RecordCount - 1, 0] := '-';
  New_Stages_Form.StringGridStage.DataController.Values[New_Stages_Form.StringGridStage.DataController.RecordCount - 1, 1] := TempFixedStages[i]._id_Stage;
  New_Stages_Form.StringGridStage.DataController.Values[New_Stages_Form.StringGridStage.DataController.RecordCount - 1, 2] := TempFixedStages[i]._Date_Beg;
  New_Stages_Form.StringGridStage.DataController.Values[New_Stages_Form.StringGridStage.DataController.RecordCount - 1, 3] := TempFixedStages[i]._Date_End;
 end;

 New_Stages_Form.StringGridStage.DataController.EndUpdate;

 New_Stages_Form.ShowModal;

 if New_Stages_Form.ModalResult <> mrOk then Exit;

 for i := 0 to New_Stages_Form.StringGridStage.DataController.RecordCount - 1 do begin
  if New_Stages_Form.StringGridStage.DataController.Values[i, 0] = 'add' then begin
   SetLength(TempFixedStages, Length(TempFixedStages) + 1);
   TempFixedStages[Length(TempFixedStages) - 1]._id_Doc   := -1;
   inc(id_New_Stage);
   TempFixedStages[Length(TempFixedStages) - 1]._Modified := 'add';
   TempFixedStages[Length(TempFixedStages) - 1]._id_Stage := id_New_Stage;
   TempFixedStages[Length(TempFixedStages) - 1]._Date_Beg := StrToDate(New_Stages_Form.StringGridStage.DataController.Values[i, 2]);
   TempFixedStages[Length(TempFixedStages) - 1]._Date_End := StrToDate(New_Stages_Form.StringGridStage.DataController.Values[i, 3]);
  end;
  if New_Stages_Form.StringGridStage.DataController.Values[i, 0] = 'edit' then begin
   for j := 0 to Length(TempFixedStages) - 1 do begin
    if TempFixedStages[j]._id_Stage = StrToInt(New_Stages_Form.StringGridStage.DataController.Values[i, 1]) then begin
     TempFixedStages[j]._Date_Beg := StrToDate(New_Stages_Form.StringGridStage.DataController.Values[i, 2]);
     TempFixedStages[j]._Date_End := StrToDate(New_Stages_Form.StringGridStage.DataController.Values[i, 3]);
    end;
   end;
  end;
 end;

 if Length(new_Stages.DelArray) <> 0 then begin
  for i := Length(New_Stages.DelArray) - 1 downto 0 do begin
   for t := 0 to Length(TempFixedStages) - 1 do begin
    if TempFixedStages[t]._id_Stage <> New_Stages.DelArray[i]._id_Stage then Continue;

    for j := 0 to Length(TempStagesArray) - 1 do
     if TempStagesArray[j]._Link_To = TempFixedStages[t]._id_Stage then begin
      ProductTreeList.ColumnByName('QntCol_' + IntToStr(TempStagesArray[j]._id_Stage)).Destroy;
      ProductTreeList.ColumnByName('CostCol_' + IntToStr(TempStagesArray[j]._id_Stage)).Destroy;
     end;

    ProductTreeList.ColumnByName('FQntCol_' + IntToStr(TempFixedStages[t]._id_Stage)).Destroy;
    ProductTreeList.ColumnByName('FCostCol_' + IntToStr(TempFixedStages[t]._id_Stage)).Destroy;

    for j := t to Length(TempFixedStages) - 2 do
     TempFixedStages[j] := TempFixedStages[j + 1];

    SetLength(TempFixedStages, Length(TempFixedStages) - 1);
   end;
  end;
 end;

 GridDoc.Tag := 1;

 GridDocFocusedRecordChanged(nil, GridDoc.Controller.FocusedRow, GridDoc.Controller.FocusedRow, False);
end;

//------------------------------------------

function TPlanEditorForm.AddDoc : boolean;
var
 i              : integer;
 k              : integer;
 id_Type_Doc    : integer;
 Name_Doc       : string;
 Date_Doc       : TDateTime;
 id_Unit_Meas   : integer;
 Name_Unit_Meas : string;
 Coefficient    : integer;

 Flag           : boolean;
begin
{ if MainDoc then begin
  id_Type_Doc    := AddSummaryDoc._id_Type_Doc;
  Name_Doc       := AddSummaryDocForm.Name_Doc.Text;
  Date_Doc       := AddSummaryDoc._Date_Doc;
  id_Unit_Meas   := AddSummaryDoc._id_unit_meas;
  Name_Unit_Meas := AddSummaryDocForm.Cost_Unit_Meas.Text;
  Coefficient    := AddSummaryDoc._Coefficient;
 end}

 id_Type_Doc     := dt_Doc_Form_Add._id_Type_Doc;
 Name_Doc        := dt_Doc_Form_Add1.Name_Doc.Text;
 Date_Doc        := dt_Doc_Form_Add._Date_Doc;
 id_Unit_Meas    := dt_Doc_Form_Add.id_unit_meas;
 Name_Unit_Meas  := dt_Doc_Form_Add1.Cost_Unit_Meas.Text;
 Coefficient     := dt_Doc_Form_Add.Coefficient;

 TempFixedStages := nil;

 Result := True;

 Flag := True;
 while Flag do begin
  Flag := False;

  TempStagesArray := nil;
  id_New_Stage := 0;

  if New_Stages_Form = nil then begin
   Application.CreateForm(TNew_Stages_Form, New_Stages_Form);
   New_Stages_Form.ShowModal;
   if (New_Stages_Form.ModalResult = mrOk)
   and (New_Stages_Form.StringGridStage.DataController.RecordCount > 0) then begin
    for i := 0 to New_Stages_Form.StringGridStage.DataController.RecordCount - 1 do begin
     SetLength(TempFixedStages, Length(TempFixedStages) + 1);
     with TempFixedStages[Length(TempFixedStages) - 1] do begin
      _id_Doc   := -1;
      inc(id_New_Stage);
      _id_Stage := id_New_Stage;
      _Date_Beg := StrToDate(New_Stages_Form.StringGridStage.DataController.Values[i, 2]);
      _Date_End := StrToDate(New_Stages_Form.StringGridStage.DataController.Values[i, 3]);
      if Length(TempFixedStages) = 1 then _isItCostBeg := True
      else _isItCostBeg := False;
     end;
    end;
   end
   else begin
    if MessageDlg('Увага', 'Неможна додати документ без періодів.'
    + ' Чи бажаєте Ви додати періоди?', mtConfirmation, [mbYes, mbNo]) = mrNo then begin
     Result := False;
     Exit;
    end;
    Flag := True;
    Continue;
   end;
  end;
 end;

 with GridDoc.DataController do begin
  BeginUpdate;

  k := RecordCount;
  RecordCount := k + 1;

  Values[k, 0] := '-1';
  Values[k, 1] := id_Type_Doc;
  Values[k, 2] := Name_Doc;
  Values[k, 3] := Date_Doc;
  Values[k, 5] := id_Unit_Meas;
  Values[k, 6] := Name_Unit_Meas;
  Values[k, 7] := Coefficient;
  Values[k, 8] := 0;

  EndUpdate;
 end;

 ApplyButton.Tag     := 1;

 GridDoc.DataController.FocusedRowIndex := k;

 if AddDocButton.Tag = 0 then AddProductButtonClick(nil);

 AddDocButton.Tag := 0;

 EnableButtons(True);
end;

procedure TPlanEditorForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 SetFormParams(Self);
 Action := caFree;
end;

procedure TPlanEditorForm.AddProductButtonClick(Sender: TObject);
var
 opt            : TSpravOptions;

 id_Product     : integer;
 id_Cat_Cust    : integer;
 Name_Product   : string;
 Name_Cat_Cust  : string;
 id_Unit_Meas   : integer;
 Name_Unit_Meas : string;
 Coefficient    : integer;
 Need_Cat_Cust  : boolean;
 Need_Objects   : boolean;
 DispOrder_Prod : integer;
 Display_Order  : integer;

 i, j, k        : integer;

 Node           : TcxTreeListNode;
 Child          : TcxTreeListNode;

 Flag           : boolean;
 Bool           : boolean;
 NotSelect      : boolean;

 SP_Result      : TSP_Result;

 TempStages     : TStagesArray;

 id_Doc         : integer;
begin
 if MainPlan then Exit;

 Opt.canSelect     := True;
 Opt.canDelete     := True;
 Opt.HideButtons   := False;
 Opt.isModal       := True;

 id_Doc := GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0];

 NotSelect := True;
 while NotSelect do begin
  NotSelect := False;

  Add_Product.Date_Beg := Plan_Date_Beg;
  Add_Product.Date_End := Plan_Date_End;

  Application.CreateForm(TAddProductForm, AddProductForm);
  AddProductForm.Caption := 'Додавання продукції';
  AddProductForm.ShowModal;

  if AddProductForm.ModalResult <> mrOk then Exit;

  id_Product     := AddProductForm.id_Product;
  Name_Product   := AddProductForm.Name_Product;
  id_Cat_Cust    := AddProductForm.id_Cat_Cust;
  Name_Cat_Cust  := AddProductForm.Name_Cat_Cust;
  id_Unit_Meas   := AddProductForm.id_Unit_Meas;
  Name_Unit_Meas := AddProductForm.Name_Unit_Meas;
  Coefficient    := AddProductForm.Coefficient;
  Need_Cat_Cust  := AddProductForm.Need_Cat_Cust;
  Need_Objects   := AddProductForm.Need_Objects;
  DispOrder_Prod := AddProductForm.DispOrder_Prod;
  Display_Order  := AddProductForm.Display_Order;


  if Need_Cat_Cust then begin
   for i := 0 to ProductTreeList.Count - 1 do begin
    if ProductTreeList.Items[i].Values[0] <> id_Product then Continue;
    for j := 0 to ProductTreeList.Items[i].Count - 1 do begin
     if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;
     if ProductTreeList.Items[i].Items[j].Values[2] = id_Cat_Cust then begin
      if MessageDlg('Увага', 'Обрана категорія споживачів вже додана до списку '
      + 'категорій споживачів цієї продукції! Чи бажаєте Ви обрати іншу категорію споживачів?',
      mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;
      NotSelect := True;
      Break;
     end;
    end;
    if NotSelect then Break;
   end;
  end
  else begin
   for i := 0 to ProductTreeList.Count - 1 do
    if ProductTreeList.Items[i].Values[0] = id_Product then begin
     if MessageDlg('Увага', 'Не можна двічі додавати той же самий вид продукції до плану!'
     + ' Чи бажаєте Ви обрати інший вид продукції?', mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;
     NotSelect := True;
     Break;
    end;
  end;

  if not NotSelect then begin
   Query.SQL.Text := 'select * from PL_DT_COST_PRODUCT_SEL_COST('
   + QuotedStr(DateToStr(Plan_Date_Beg)) + ',' + QuotedStr(DateToStr(Plan_Date_End))
   + ',' + IntToStr(id_Product) + ',' + IntToStr(id_Cat_Cust) + ')';
   Query.ExecQuery;
   if Query.RecordCount = 0 then begin
    if MessageDlg('Увага', 'Неможна додати категорію споживачів, тому що для неї у '
    + 'довіднику тарифів та прейскурантів не вказана ціна! Чи бажаєте Ви обрати іншу '
    + 'категорію споживачів?', mtConfirmation,[mbYes, mbNo]) = mrNo then Exit;
    NotSelect := True;
    Query.Close;
    Continue;
   end;
  end;
 end;

// ------------------

 SP_Result := nil;

 while not Query.Eof do begin
  if Query.Fields[0].AsString = '' then begin
   Query.Next;
   Continue;
  end;

  SetLength(SP_Result, Length(SP_Result) + 1);
  with SP_Result[Length(SP_Result) - 1] do begin
   _Cost     := Query.Fields[0].AsCurrency;
   _Date_Beg := Query.Fields[1].AsDate;
   _Date_End := Query.Fields[2].AsDate;
  end;

  Query.Next;
 end;

 Query.Close;

 SavePlanData(TempStagesArray, TempFixedStages, SAVE_TO_TEMP, ProductTreeList);

 TempStages := nil;
 TempStages := Copy(TempStagesArray, 0, Length(TempStagesArray));

 Analyze_SP_Result(SP_Result, Plan_Date_Beg, Plan_Date_End);
 StagesDeviding(TempStagesArray, SP_Result);

 if ProductTreeList.Count = 0 then Flag := True;

 ProductTreeList.BeginUpdate;

 while ProductTreeList.ColumnCount > LAST_COL + 1 do
  ProductTreeList.Columns[ProductTreeList.ColumnCount - 1].Destroy;

 MakeTreeList(TempStagesArray, TempFixedStages, id_Doc, ProductTreeList);

 if not Flag then
  FillOnlyDataWithCompare(TempStages, TempStagesArray, TempFixedStages,
  TempPlanDataArray, id_Doc);

// Adding of nodes

 if Need_Cat_Cust then begin
  Flag := True;
  for i := 0 to ProductTreeList.Count - 1 do
   if ProductTreeList.Items[i].Values[0] = id_Product then begin
    Flag := False;
    Break;
   end;

  if Flag then begin
   Node            := ProductTreeList.Add;

   Node.Values[0]  := id_Product;
   Node.Values[1]  := Name_Product;
   Node.Values[2]  := 0;
   Node.Values[3]  := 0;
   Node.Values[4]  := Name_Unit_Meas;
   Node.Values[5]  := Need_Cat_Cust;
   Node.Values[6]  := Need_Objects;
   Node.Values[7]  := id_Unit_Meas;
   Node.Values[8]  := Coefficient;
   Node.Values[10] := DispOrder_Prod;
  end
  else Node := ProductTreeList.Items[i];

  Child := Node.AddChild;
  Child.Values[0]  := 0;
  Child.Values[1]  := Name_Cat_Cust;
  Child.Values[2]  := id_Cat_Cust;
  Child.Values[3]  := 0;
  Child.Values[8]  := Coefficient;
  Child.Values[10] := Display_Order;
 end
 else begin
  Node            := ProductTreeList.Add;
  Node.Values[0]  := id_Product;
  Node.Values[1]  := Name_Product;
  Node.Values[2]  := 0;
  Node.Values[3]  := 0;
  Node.Values[4]  := Name_Unit_Meas;
  Node.Values[5]  := Need_Cat_Cust;
  Node.Values[6]  := Need_Objects;
  Node.Values[7]  := id_Unit_Meas;
  Node.Values[8]  := Coefficient;
  Node.Values[10] := DispOrder_Prod;
 end;

 for k := 0 to Length(TempFixedStages) - 1 do begin
  if TempFixedStages[k]._id_Doc <> id_Doc then Continue;
  Bool := True;

  for i := 0 to Length(TempStagesArray) - 1 do begin
   if TempStagesArray[i]._id_Doc <> id_Doc then Continue;
   if TempStagesArray[i]._Link_To <> TempFixedStages[k]._id_Stage then Continue;

   Bool := False;

   if TempStagesArray[i]._isItCostBeg then begin
    Flag := False;

    for j := 0 to Length(SP_Result) - 1 do
     if (TempStagesArray[i]._Date_Beg >= SP_Result[j]._Date_Beg)
     and (TempStagesArray[i]._Date_End <= SP_Result[j]._Date_End)
     then begin
      Flag := True;
      Break;
     end;

    if not Flag then Continue;

    if id_Cat_Cust > 0 then
     Child.Values[ProductTreeList.ColumnByName('PriceCol_'
     + IntToStr(TempStagesArray[i]._id_Stage)).ItemIndex] := SP_Result[j]._Cost
    else
     Node.Values[ProductTreeList.ColumnByName('PriceCol_'
     + IntToStr(TempStagesArray[i]._id_Stage)).ItemIndex] := SP_Result[j]._Cost;
   end;
  end;

  if Bool then  begin
   if TempFixedStages[k]._isItCostBeg then begin
    Flag := False;

    for j := 0 to Length(SP_Result) - 1 do
     if (TempFixedStages[k]._Date_Beg >= SP_Result[j]._Date_Beg)
     and (TempFixedStages[k]._Date_End <= SP_Result[j]._Date_End)
     then begin
      Flag := True;
      Break;
     end;

    if not Flag then Continue;

    if id_Cat_Cust > 0 then
     Child.Values[ProductTreeList.ColumnByName('PriceCol_'
     + IntToStr(TempFixedStages[k]._id_Stage)).ItemIndex] := SP_Result[j]._Cost
    else
     Node.Values[ProductTreeList.ColumnByName('PriceCol_'
     + IntToStr(TempFixedStages[k]._id_Stage)).ItemIndex] := SP_Result[j]._Cost;
   end;
  end;
 end;

 SortObjects_and_CatCust;

 CalcSumms(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
          GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);

 ProductTreeList.FullExpand;     
 ProductTreeList.EndUpdate;

 if Child <> nil then Child.Focused := True
 else if Node <> nil then Node.Focused := True;
end;

procedure TPlanEditorForm.StagesDeviding(Stages: TStagesArray;
          SP_Result : TSP_Result);
var
 i, j           : integer;

 Flag        : boolean;

 TempArray1  : TStagesArray;
 TempArray2  : TStagesArray;
 k           : integer;

 Incrementa  : integer;
 LastCost    : Currency;
 id_Doc      : integer;

 Bool        : boolean;
 Date_Beg    : TDate;
begin
 id_Doc :=  GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0];

 TempArray1 := nil;
 TempArray2 := nil;
 LastCost   := -1;

 TempArray1 := Copy(Stages, 0, Length(Stages));

 Incrementa := TempFixedStages[0]._id_Stage;

 for i := 1 to Length(TempFixedStages) - 1 do
  if Incrementa < TempFixedStages[i]._id_Stage
  then Incrementa := TempFixedStages[i]._id_Stage;

 for i := 0 to Length(TempArray1) - 1 do
  if Incrementa < TempArray1[i]._id_Stage
  then Incrementa := TempArray1[i]._id_Stage;

 Inc(Incrementa);

 for j := 0 to Length(TempFixedStages) - 1 do begin
  if TempFixedStages[j]._id_Doc <> id_Doc then begin
   for i := 0 to Length(TempArray1) - 1 do begin
    if TempArray1[i]._Link_To <> TempFixedStages[j]._id_Stage then Continue;
    SetLength(TempArray2, Length(TempArray2) + 1);
    TempArray2[Length(TempArray2) - 1] := TempArray1[i];
   end;
   Continue;
  end;

  Bool := True;

  for i := 0 to Length(TempArray1) - 1 do begin
   if TempArray1[i]._Link_To <> TempFixedStages[j]._id_Stage then Continue;
   Bool := False;

   Flag := False;
   k    := 0;
   while (k <= Length(SP_Result) - 1) and not Flag do begin
    //----------
    if (TempArray1[i]._Date_End < SP_Result[k]._Date_Beg) then begin
     SetLength(TempArray2, Length(TempArray2) + 1);
     TempArray2[Length(TempArray2) - 1] := TempArray1[i];
     Flag := True;
    end;

    //------------

    if (TempArray1[i]._Date_Beg < SP_Result[k]._Date_Beg)
    and (TempArray1[i]._Date_End > SP_Result[k]._Date_Beg) then begin
     SetLength(TempArray2, Length(TempArray2) + 2);
     with TempArray2[Length(TempArray2) - 2] do begin
      _Link_To     := TempArray1[i]._Link_To;
      _Modified    := 'Divided';
      _id_Doc      := TempArray1[i]._id_Doc;
      Inc(Incrementa);
      _id_Stage    := Incrementa;
      _Date_Beg    := TempArray1[i]._Date_Beg;
      _Date_End    := SP_Result[k]._Date_Beg - 1;
      _isItCostBeg := True;
     end;
     with TempArray2[Length(TempArray2) - 1] do begin
      _Link_To     := TempArray1[i]._Link_To;
      _Modified    := 'Divided';
      _id_Doc      := TempArray1[i]._id_Doc;
      Inc(Incrementa);
      _id_Stage    := Incrementa;
      _Date_Beg    := SP_Result[k]._Date_Beg;

      if TempArray1[i]._Date_End > SP_Result[k]._Date_End then begin
       _Date_End               := SP_Result[k]._Date_End;
       TempArray1[i]._Date_Beg := SP_Result[k]._Date_End + 1;
      end
      else _Date_End := TempArray1[i]._Date_End;

      if LastCost <> SP_Result[k]._Cost then begin
       _isItCostBeg := True;
       LastCost     := SP_Result[k]._Cost;
      end;
     end;

     Flag := True;

     if TempArray1[i]._Date_End > SP_Result[k]._Date_End then begin
      TempArray1[i]._Date_Beg := SP_Result[k]._Date_End + 1;
      Flag := False;
     end;
    end;

    //------------

    if (TempArray1[i]._Date_Beg >= SP_Result[k]._Date_Beg)
    and (TempArray1[i]._Date_End <= SP_Result[k]._Date_End) then begin
     SetLength(TempArray2, Length(TempArray2) + 1);
     TempArray2[Length(TempArray2) - 1] := TempArray1[i];
     if LastCost <> SP_Result[k]._Cost then begin
      TempArray2[Length(TempArray2) - 1]._isItCostBeg := True;
      LastCost     := SP_Result[k]._Cost;
     end;
     Flag := True;
    end;

    //--------------

    if (TempArray1[i]._Date_Beg <= SP_Result[k]._Date_End)
    and (TempArray1[i]._Date_End > SP_Result[k]._Date_End) then begin
     if TempArray1[i]._Date_Beg < SP_Result[k]._Date_Beg then begin
      SetLength(TempArray2, Length(TempArray2) + 1);
      with TempArray2[Length(TempArray2) - 1] do begin
       _Link_To     := TempArray1[i]._Link_To;
       _Modified    := 'Divided';
       _id_Doc      := TempArray1[i]._id_Doc;
       Inc(Incrementa);
       _id_Stage    := Incrementa;
       _Date_Beg    := TempArray1[i]._Date_Beg;
       _Date_End    := SP_Result[k]._Date_Beg;
       _isItCostBeg := True;
      end;
     end;

     SetLength(TempArray2, Length(TempArray2) + 1);
     with TempArray2[Length(TempArray2) - 1] do begin
      _Link_To     := TempArray1[i]._Link_To;
      _Modified    := 'Divided';
      _id_Doc      := TempArray1[i]._id_Doc;
      Inc(Incrementa);
      _id_Stage    := Incrementa;
      _Date_Beg    := TempArray1[i]._Date_Beg;
      _Date_End    := SP_Result[k]._Date_End;
      if LastCost <> SP_Result[k]._Cost then begin
       _isItCostBeg := True;
       LastCost     := SP_Result[k]._Cost;
      end;
     end;

     TempArray1[i]._Date_Beg := SP_Result[k]._Date_End + 1;
    end;

    inc(k);
   end;
  end;
//===========

  if Bool then begin
   Flag     := False;
   Date_Beg := TempFixedStages[j]._Date_Beg;
   k        := 0;
   while (k <= Length(SP_Result) - 1) and not Flag do begin
//-------
    if  (Date_Beg < SP_Result[k]._Date_Beg)
    and (TempFixedStages[j]._Date_End > SP_Result[k]._Date_Beg) then begin
     SetLength(TempArray2, Length(TempArray2) + 2);
     with TempArray2[Length(TempArray2) - 2] do begin
      _Link_To     := TempFixedStages[j]._id_Stage;
      _Modified    := 'Divided';
      _id_Doc      := TempFixedStages[j]._id_Doc;
      Inc(Incrementa);
      _id_Stage    := Incrementa;
      _Date_Beg    := Date_Beg;
      _Date_End    := SP_Result[k]._Date_Beg - 1;
      _isItCostBeg := True;
     end;

     with TempArray2[Length(TempArray2) - 1] do begin
      _Link_To     := TempFixedStages[j]._id_Stage;
      _Modified    := 'Divided';
      _id_Doc      := TempFixedStages[j]._id_Doc;
      Inc(Incrementa);
      _id_Stage    := Incrementa;
      _Date_Beg    := SP_Result[k]._Date_Beg;

      if TempFixedStages[j]._Date_End > SP_Result[k]._Date_End then begin
       _Date_End := SP_Result[k]._Date_End;
       Date_Beg  := SP_Result[k]._Date_End + 1;
      end
      else
       _Date_End := TempFixedStages[j]._Date_End;

      if LastCost <> SP_Result[k]._Cost then begin
       _isItCostBeg := True;
       LastCost     := SP_Result[k]._Cost;
      end;
     end;

     Flag := True;

     if TempFixedStages[j]._Date_End > SP_Result[k]._Date_End then
      Flag := False;
    end;

//--------

    if  (Date_Beg < SP_Result[k]._Date_End)
    and (TempFixedStages[j]._Date_End > SP_Result[k]._Date_End) then begin
     if Date_Beg < SP_Result[k]._Date_Beg then begin
      SetLength(TempArray2, Length(TempArray2) + 1);
      with TempArray2[Length(TempArray2) - 1] do begin
       _Link_To     := TempFixedStages[j]._id_Stage;
       _Modified    := 'Divided';
       _id_Doc      := TempFixedStages[j]._id_Doc;
       Inc(Incrementa);
       _id_Stage    := Incrementa;
       _Date_Beg    := Date_Beg;
       _Date_End    := SP_Result[k]._Date_Beg;
       _isItCostBeg := True;
      end;
     end;

     SetLength(TempArray2, Length(TempArray2) + 1);
     with TempArray2[Length(TempArray2) - 1] do begin
      _Link_To     := TempFixedStages[j]._id_Stage;
      _Modified    := 'Divided';
      _id_Doc      := TempFixedStages[j]._id_Doc;
      Inc(Incrementa);
      _id_Stage    := Incrementa;
      _Date_Beg    := Date_Beg;
      _Date_End    := SP_Result[k]._Date_End;
      if LastCost <> SP_Result[k]._Cost then begin
       _isItCostBeg := True;
       LastCost     := SP_Result[k]._Cost;
      end;
     end;

     TempFixedStages[j]._Modified := 'Divided';

     if TempFixedStages[j]._Date_End > SP_Result[k]._Date_End then
      Date_Beg  := SP_Result[k]._Date_End + 1
    end;

//-----------

    if TempFixedStages[j]._Modified = 'Divided' then begin
     if TempFixedStages[j]._Date_End <= SP_Result[k]._Date_Beg then begin
      SetLength(TempArray2, Length(TempArray2) + 1);
      with TempArray2[Length(TempArray2) - 1] do begin
       _Link_To     := TempFixedStages[j]._id_Stage;
       _Modified    := 'Divided';
       _id_Doc      := TempFixedStages[j]._id_Doc;
       Inc(Incrementa);
       _id_Stage    := Incrementa;
       _Date_Beg    := Date_Beg;
       _Date_End    := TempFixedStages[j]._Date_End;
       _isItCostBeg := True;
      end;

      LastCost      := 0;
      Date_Beg      := TempFixedStages[j]._Date_End + 1;
     end
     else if (Date_Beg >= SP_Result[k]._Date_Beg)
     and (TempFixedStages[j]._Date_End <= SP_Result[k]._Date_End) then begin
      SetLength(TempArray2, Length(TempArray2) + 1);
      with TempArray2[Length(TempArray2) - 1] do begin
       _Link_To     := TempFixedStages[j]._id_Stage;
       _Modified    := 'Divided';
       _id_Doc      := TempFixedStages[j]._id_Doc;
       Inc(Incrementa);
       _id_Stage    := Incrementa;
       _Date_Beg    := Date_Beg;
       _Date_End    := TempFixedStages[j]._Date_End;
       if LastCost <> SP_Result[k]._Cost then begin
        _isItCostBeg := True;
        LastCost     := SP_Result[k]._Cost;
       end;

       Date_Beg := TempFixedStages[j]._Date_End + 1;
      end;
     end
     else if (Date_Beg >= SP_Result[k]._Date_Beg)
     and (Date_Beg < SP_Result[k]._Date_End)
     and (TempFixedStages[j]._Date_End > SP_Result[k]._Date_End) then begin
      SetLength(TempArray2, Length(TempArray2) + 1);
      with TempArray2[Length(TempArray2) - 1] do begin
       _Link_To     := TempFixedStages[j]._id_Stage;
       _Modified    := 'Divided';
       _id_Doc      := TempFixedStages[j]._id_Doc;
       Inc(Incrementa);
       _id_Stage    := Incrementa;
       _Date_Beg    := Date_Beg;
       _Date_End    := SP_Result[k]._Date_End;
       if LastCost <> SP_Result[k]._Cost then begin
        _isItCostBeg := True;
        LastCost     := SP_Result[k]._Cost;
       end;

       Date_Beg := SP_Result[k]._Date_End + 1;
      end;
     end;
    end;

//-----------

    if (Date_Beg >= SP_Result[k]._Date_Beg)
    and (TempFixedStages[j]._Date_End <= SP_Result[k]._Date_End) then
     if LastCost <> SP_Result[k]._Cost then begin
      TempFixedStages[j]._isItCostBeg := True;
      LastCost := SP_Result[k]._Cost;
     end;

    Inc(k);
   end;
  end;
 end;

 TempStagesArray := Copy(TempArray2, 0, Length(TempArray2));
end;

procedure TPlanEditorForm.AddObjectButtonClick(Sender: TObject);
var
 Node        : TcxTreeListNode;
 ItemNum     : integer;
 opt         : TSpravOptions;
 Result      : TResultArray;
 i           : integer;
 id_Object   : integer;
 Name_Object : string;

 Flag        : boolean;
begin
 if ProductTreeList.Count = 0 then begin
  ShowMessage('Додайте спочатку продукцію');
  Exit;
 end;

 if ProductTreeList.FocusedNode = nil then Exit;

 if ProductTreeList.FocusedNode.Level = 0 then begin
  if ProductTreeList.FocusedNode.Values[0] < -1 then Exit
  else if not ProductTreeList.FocusedNode.Values[6] then Exit
  else ItemNum := ProductTreeList.FocusedNode.Index;
 end
 else if not ProductTreeList.FocusedNode.Parent.Values[6] then Exit
 else ItemNum := ProductTreeList.FocusedNode.Parent.Index;

 opt.canAdd      := true;
 opt.canEdit     := true;
 opt.canDelete   := true;
 opt.canSelect   := true;
 opt.HideButtons := False;
 opt.isModal     := true;

 sp_Object_Form.PanelVisible := False;

 Flag := True;
 while Flag do begin
  Flag := False;
  if sp_Object_Form1 <> nil then Exit;
  Result := sp_Object_Form1.tagShow(opt);
  if Length(Result) > 0 then begin
   id_Object   := Result[0];
   Name_Object := Result[1];
  end
  else Exit;

  if ProductTreeList.Items[ItemNum].Count > 0 then begin
   for i := 0 to ProductTreeList.Items[ItemNum].Count - 1 do begin
    if ProductTreeList.Items[ItemNum].Items[i].Values[0] < -1 then Continue;
    if ProductTreeList.Items[ItemNum].Items[i].Values[3] = id_Object then begin
     if MessageDlg('Увага', 'Не можна двічі додавати обраний об''єкт постачання до списку '
     + 'об''єктів постачання цієї продукції! Чи бажаєте Ви обрати інший об''єкт постачання?',
     mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;

     Flag := True;
     Continue;
    end;
   end;
  end;
 end;

 Node := ProductTreeList.Items[ItemNum].AddChild;

 Node.Values[0]  := 0;
 Node.Values[1]  := AddSpaces(Name_Object);
 Node.Values[2]  := 0;
 Node.Values[3]  := id_Object;
 Node.Values[10] := 0; // It's not good. You should do display order soon or later

 ProductTreeList.FullExpand;

 SortObjects_and_CatCust;

 Node.Focused   := True;

 CalcSumms(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
           GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
end;

procedure TPlanEditorForm.ApplyButtonClick(Sender: TObject);
var
  Flag : boolean;
  i    : integer;
begin
 if PageControl.ActivePageIndex = 0 then begin
  if not  MainPlan then Exit;

  if DepTreeList.Count = 0 then begin
   ShowMessage('Неможна зберегти порожній документ!');
   Exit;
  end;

  CalcSummsDep(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
             GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);

  if GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0] < 0 then begin
   NewStagesArray := Copy(TempStagesArray, 0, Length(TempStagesArray));
   NewFixedStages := Copy(TempFixedStages, 0, Length(TempFixedStages));
   SavePlanDataDep(NewStagesArray, NewFixedStages, SAVE_TO_PLAN_DATA);
   EnableButtons(False);
  end;
 end
 else begin
  if MainPlan then begin
   PageControl.ActivePageIndex := 0;
   PageControlChanging(Sender, Flag);
   PageControlChange(Sender);
   ApplyButtonClick(Sender);
   Exit;
  end;

  if ProductTreeList.Count = 0 then begin
   ShowMessage('Неможна зберегти порожній документ!');
   Exit;
  end;

  CalcSumms(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
            GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);

  if GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0] > 0 then begin
   FixedStages := Copy(TempFixedStages, 0, Length(TempFixedStages));
   StagesArray := Copy(TempStagesArray, 0, Length(TempStagesArray));
   SavePlanData(StagesArray, FixedStages, SAVE_TO_PLAN_DATA, ProductTreeList);
   SetLength(EditedDocArray, Length(EditedDocArray) + 1);
   EditedDocArray[Length(EditedDocArray) - 1] := GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0];
   EnableButtons(False);
  end
  else begin
   NewStagesArray := Copy(TempStagesArray, 0, Length(TempStagesArray));
   NewFixedStages := Copy(TempFixedStages, 0, Length(TempFixedStages));
   SavePlanData(NewStagesArray, NewFixedStages, SAVE_TO_PLAN_DATA, ProductTreeList);
   EnableButtons(False);
  end;
 end;

 if ApplyButton.Tag in [1, 2] then begin
  AddDocButton.Enabled      := False;
  pAddDocToolButton.Enabled := False;
 end;

 if Length(New_Stages.DelArray) > 0 then begin
  for i := 0 to Length(New_Stages.DelArray) - 1 do begin
   SetLength(DelStagesArray, Length(DelStagesArray) + 1);
   DelStagesArray[Length(DelStagesArray) - 1] := New_Stages.DelArray[i]._id_Stage;
  end;
  New_Stages.DelArray := nil;
 end;

 ApplyButton.Tag := 0;

 GridDocFocusedRecordChanged(GridDoc, GridDoc.Controller.FocusedRow, GridDoc.Controller.FocusedRow, False);
end;

procedure TPlanEditorForm.DelProductButtonClick(Sender: TObject);
begin
 if ProductTreeList.FocusedNode.Level > 0 then Exit;

 if ProductTreeList.FocusedNode.Count > 0 then begin
  ShowMessage('Видалите спочатку усі категорії споживачів та об''єкти, що пов''язані '
  + 'з цією продукцією');
  Exit;
 end;

 ProductTreeList.FocusedNode.Destroy;
end;

procedure TPlanEditorForm.DelCatCustButtonClick(Sender: TObject);
var
 i          : integer;
 Flag       : boolean;
begin
// This proc deletes CatCust or Object

 Flag       := True;

 for i := 0 to ProductTreeList.FocusedNode.Parent.Count - 1 do
  if ProductTreeList.FocusedNode.Parent.Items[i].Values[0] < -1 then Continue
  else if not ProductTreeList.FocusedNode.Parent.Items[i].Focused
  and (ProductTreeList.FocusedNode.Parent.Items[i].Values[2] > 0) then begin
   Flag := False;
   Break;
  end;

 if Flag then begin
  ProductTreeList.FocusedNode.Parent.Delete;
 end
 else ProductTreeList.FocusedNode.Delete;
end;

procedure TPlanEditorForm.DelButtonClick(Sender: TObject);
begin
 if ProductTreeList.FocusedNode = nil then Exit;
 if ProductTreeList.FocusedNode.Values[0] < -1 then Exit;

 case ProductTreeList.FocusedNode.Level of
  0 : DelProductButtonClick(Sender);
  1 : DelCatCustButtonClick(Sender);
 end;

 SortObjects_and_CatCust;
 SpinEditCChange(Sender);
end;

procedure TPlanEditorForm.AddDocMore(id_Doc : integer);
var
 i : integer;
 j    : integer;
 k    : integer;

 Row  : integer;
 Flag : boolean;

 p    : integer;
begin
 if MainPlan then Exit;

 Flag := False;
 for Row := 0 to GridDoc.DataController.RecordCount - 1 do
  if GridDoc.DataController.Values[Row, 0] = IntToStr(id_Doc) then begin
   Flag := True;
   Break;
  end;

 if not Flag then Exit;

 p := GridDoc.DataController.RecordCount;
 Inc(p);
 GridDoc.DataController.RecordCount := p;

 with GridDoc.DataController do begin
  Values[p - 1, 0] := '-1';
  Values[p - 1, 1] := dt_Doc_Form_Add._id_Type_Doc;
  Values[p - 1, 2] := dt_Doc_Form_Add1.Name_Doc.Text;
  Values[p - 1, 3] := dt_Doc_Form_Add._Date_Doc;
  Values[p - 1, 5] := dt_Doc_Form_Add.id_unit_meas;
  Values[p - 1, 6] := dt_Doc_Form_Add1.Cost_Unit_Meas.Text;
  Values[p - 1, 7] := dt_Doc_Form_Add.Coefficient;
  Values[p - 1, 8] := 0;

  FocusedRowIndex := p - 1;
 end;



 id_New_Stage := 0;

 TempFixedStages   := nil;
 TempStagesArray   := nil;
 TempPlanDataArray := nil;


 for i := 0 to Length(FixedStages) - 1 do begin
  if FixedStages[i]._id_Doc <> id_Doc then Continue;

  Inc(id_New_Stage);

  SetLength(TempFixedStages, Length(TempFixedStages) + 1);
  TempFixedStages[Length(TempFixedStages) - 1]           := FixedStages[i];
  TempFixedStages[Length(TempFixedStages) - 1]._id_Doc   := -1;
  TempFixedStages[Length(TempFixedStages) - 1]._id_Stage := id_New_Stage;

  Flag := False;
  for j := 0 to Length(StagesArray) - 1 do begin
   if StagesArray[j]._id_Doc <> id_Doc then Continue;
   if StagesArray[j]._Link_To <> FixedStages[i]._id_Stage then Continue;

   Flag := True;

   Inc(id_New_Stage);

   SetLength(TempStagesArray, Length(TempStagesArray) + 1);
   TempStagesArray[Length(TempStagesArray) - 1]           := StagesArray[j];
   TempStagesArray[Length(TempStagesArray) - 1]._id_Doc   := -1;
   TempStagesArray[Length(TempStagesArray) - 1]._Link_To  := TempFixedStages[Length(TempFixedStages) - 1]._id_Stage;
   TempStagesArray[Length(TempStagesArray) - 1]._id_Stage := id_New_Stage;

   for k := 0 to Length(PlanDataArray) - 1 do begin
    if PlanDataArray[k]._id_Stage <> StagesArray[j]._id_Stage then Continue;

    SetLength(TempPlanDataArray, Length(TempPlanDataArray) + 1);
    TempPlanDataArray[Length(TempPlanDataArray) - 1]           := PlanDataArray[k];
    TempPlanDataArray[Length(TempPlanDataArray) - 1]._id_Stage := TempStagesArray[Length(TempStagesArray) - 1]._id_Stage;
   end;
  end;

  if not Flag then begin
   for k := 0 to Length(PlanDataArray) - 1 do begin
    if PlanDataArray[k]._id_Stage <> FixedStages[i]._id_Stage then Continue;

    SetLength(TempPlanDataArray, Length(TempPlanDataArray) + 1);
    TempPlanDataArray[Length(TempPlanDataArray) - 1]           := PlanDataArray[k];
    TempPlanDataArray[Length(TempPlanDataArray) - 1]._id_Stage := TempFixedStages[Length(TempFixedStages) - 1]._id_Stage;
   end;
  end;
 end;

 ProductTreeList.OptionsData.Editing := True;
 EnableButtons(True);

 MakeTreeList(TempStagesArray, TempFixedStages, -1, ProductTreeList);

 FillProductTreeList(True, TempStagesArray, TempFixedStages, TempPlanDataArray, -1,
            GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);

 ProductTreeList.FullExpand;

 ApplyButton.Tag := 2;
end;

procedure TPlanEditorForm.EditNameDocBtnClick(Sender: TObject);
var
 k : integer;
begin
 k := GridDoc.DataController.FocusedRecordIndex;
 if k < 0 then Exit;
 if EditNameDocForm <> nil then Exit;

 Application.CreateForm(TEditNameDocForm, EditNameDocForm);

 EditNameDocForm.Name_Doc.Text        := GridDoc.DataController.Values[k, 2];
 EditNameDocForm.DateTimePicker1.Date := GridDoc.DataController.Values[k, 3];
 EditNameDoc.id_unit_meas             := GridDoc.DataController.Values[k, 5];
 EditNameDocForm.Cost_Unit_Meas.Text  := GridDoc.DataController.Values[k, 6];

 EditNameDocForm.ShowModal;

 if EditNameDocForm.ModalResult <> mrOk then Exit;

 if GridDoc.DataController.Values[k, 0] < 0 then begin
  GridDoc.DataController.Values[k, 2] := EditNameDocForm.Name_Doc.Text;
  GridDoc.DataController.Values[k, 3] := EditNameDocForm.DateTimePicker1.Date;
  GridDoc.DataController.Values[k, 5] := EditNameDoc.id_unit_meas;
  GridDoc.DataController.Values[k, 6] := EditNameDocForm.Cost_Unit_Meas.Text;
  GridDoc.DataController.Values[k, 7] := EditNameDoc.Coefficient;
 end
 else begin
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_DT_PLAN_DOC_MODIFY', [GridDoc.DataController.Values[k, 0],
             EditNameDocForm.Name_Doc.Text, EditNameDocForm.DateTimePicker1.Date,
             EditNameDoc.id_unit_meas]);
  StoredProc.Transaction.Commit;

  RefreshData;
 end;
end;

procedure TPlanEditorForm.EditDocButtonClick(Sender: TObject);
begin
 if GridDoc.DataController.FocusedRecordIndex < 0 then Exit;

 EnableButtons(True);
 ProductTreeList.Items[0].Focused := True;

 if GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0] = '-1'
 then begin
  TempStagesArray   := Copy(NewStagesArray, 0, Length(NewStagesArray));
  TempFixedStages   := Copy(NewFixedStages, 0, Length(NewFixedStages));
  TempPlanDataArray := Copy(NewPlanDataArray, 0, Length(NewPlanDataArray));
 end
 else begin
  TempStagesArray   := Copy(StagesArray, 0, Length(StagesArray));
  TempFixedStages   := Copy(FixedStages, 0, Length(FixedStages));
  TempPlanDataArray := Copy(PlanDataArray, 0, Length(PlanDataArray));
 end;
end;

procedure TPlanEditorForm.DelDocButtonClick(Sender: TObject);
var
 i, j, t : integer;
 k       : integer;
begin
 k := GridDoc.DataController.FocusedRecordIndex;

 if k < 0 then Exit;

 if GridDoc.DataController.Values[k, 0] > 0 then begin
  if MessageDlg('Видалення документу', 'Чи Ви дійсно бажаєте видалити цей документ?',
  mtConfirmation, [mbYes, mbNo]) = mrYes then begin
   for i := 0 to Length(FixedStages) - 1 do begin
    if FixedStages[i]._id_Doc <> GridDoc.ViewData.Records[k].Values[0] then Continue;

    for j := 0 to Length(PlanDataArray) do begin
     if PlanDataArray[j]._id_Stage = FixedStages[i]._id_Stage
     then DelArrayVar(PlanDataArray, j);
    end;
    for t := i to Length(FixedStages) - 2 do FixedStages[t] := FixedStages[t + 1];
    SetLength(FixedStages, Length(FixedStages) - 1);
   end;

   SetLength(DelDocArray, Length(DelDocArray) + 1);
   DelDocArray[Length(DelDocArray) - 1] := GridDoc.DataController.Values[k, 0];

   for i := 0 to Length(EditedDocArray) - 1 do begin
    if EditedDocArray[i] = GridDoc.DataController.Values[k, 0] then begin
     for j := i to Length(EditedDocArray) - 2 do
      EditedDocArray[j] := EditedDocArray[j + 1];

     SetLength(EditedDocArray, Length(EditedDocArray) - 1);
     Break;
    end;
   end;

   GridDoc.DataController.DeleteFocused;
  end;
 end
 else begin
  if MessageDlg('Видалення документу', 'Чи Ви дійсно бажаєте видалити цей документ?',
  mtConfirmation, [mbYes, mbNo]) = mrYes then begin
   NewPlanDataArray := nil;
   GridDoc.DataController.DeleteFocused;
   AddDocButton.Enabled      := True;
   pAddDocToolButton.Enabled := True;
  end;
 end;
end;

procedure TPlanEditorForm.SaveButtonClick(Sender: TObject);
begin
 SaveWork(True);
end;

procedure TPlanEditorForm.CloseButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TPlanEditorForm.CancelButtonClick(Sender: TObject);
begin
 if MessageDlg('Увага', 'Ви дійсно бажаєте відмінити усі зміни у документі?',
    mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;

 if ApplyButton.Tag = 1 then begin // AddDoc was clicked
  GridDoc.DataController.RecordCount := GridDoc.DataController.RecordCount - 1;

  NewStagesArray := nil;
  NewPlanDataArray := nil;
 end
 else if ApplyButton.Tag = 2 then  // AddDocMore was clicked
  GridDoc.DataController.RecordCount := GridDoc.DataController.RecordCount - 1;

 EnableButtons(False);

 AddDocButton.Enabled := (Length(NewPlanDataArray) = 0);

 New_Stages.DelArray  := nil;

 if (GridDoc.DataController.RecordCount > 0) and (ApplyButton.Tag in [1, 2]) then
  GridDoc.ViewData.Records[GridDoc.DataController.RecordCount - 1].Focused := True;
{ else begin
  k := GridDoc.DataController.FocusedRecordIndex;
  GridDocFocusedRecordChanged(GridDoc, nil, nil, False);
 end;}

 ApplyButton.Tag := 0;
end;

procedure TPlanEditorForm.FormResize(Sender: TObject);
begin
 StatusBar1.Panels[2].Width := 160;
 StatusBar1.Panels[1].Width := 100;
 StatusBar1.Panels[0].Width := Width - 160 - 100;

 WaitPanel.Left := (Width - WaitPanel.Width) div 2;
 WaitPanel.Top  := (Height - WaitPanel.Height) div 2;
end;

procedure TPlanEditorForm.EditCatCust;
var
 opt            : TSpravOptions;

 id_Product     : integer;
 id_Cat_Cust    : integer;
 Name_Product   : string;
 Name_Cat_Cust  : string;
 id_Unit_Meas   : integer;
 Name_Unit_Meas : string;
 Coefficient    : integer;
 Need_Cat_Cust  : boolean;
 Need_Objects   : boolean;

 i, j, k        : integer;

 Node           : TcxTreeListNode;
 Child          : TcxTreeListNode;

 Flag           : boolean;
 Bool           : boolean;
 NotSelect      : boolean;

 SP_Result      : TSP_Result;

 TempStages     : TStagesArray;

 id_Doc         : integer;
begin
 if MainPlan then Exit;

 Opt.canSelect     := True;
 Opt.canDelete     := True;
 Opt.HideButtons   := False;
 Opt.isModal       := True;

 id_Doc := GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0];

 NotSelect := True;
 while NotSelect do begin
  NotSelect := False;

  Add_Product.Date_Beg := Plan_Date_Beg;
  Add_Product.Date_End := Plan_Date_End;

  Application.CreateForm(TAddProductForm, AddProductForm);
  AddProductForm.Caption := 'Зміна продукції';

//  AddProductForm.id_Product := -1;

{  if ProductTreeList.FocusedNode.Level = 0 then begin
   Add_Product.OnlyProduct := ProductTreeList.FocusedNode.Values[0];

   AddProductForm.NameProduct.Text  := ProductTreeList.FocusedNode.Values[1];
   AddProductForm.NameUnitMeas.Text := ProductTreeList.FocusedNode.Values[4];
  end
  else begin
   Add_Product.OnlyProduct := ProductTreeList.FocusedNode.Parent.Values[0];

   AddProductForm.NameProduct.Text  := ProductTreeList.FocusedNode.Parent.Values[1];
   AddProductForm.NameUnitMeas.Text := ProductTreeList.FocusedNode.Parent.Values[4];
   AddProductForm.NameCatCust.Text  := ProductTreeList.FocusedNode.Values[1];
  end;}

  AddProductForm.ShowModal;

  if AddProductForm.ModalResult <> mrOk then Exit;
  if AddProductForm.id_Product < 0 then Exit;

  id_Product     := AddProductForm.id_Product;
  Name_Product   := AddProductForm.Name_Product;
  id_Cat_Cust    := AddProductForm.id_Cat_Cust;
  Name_Cat_Cust  := AddProductForm.Name_Cat_Cust;
  id_Unit_Meas   := AddProductForm.id_Unit_Meas;
  Name_Unit_Meas := AddProductForm.Name_Unit_Meas;
  Coefficient    := AddProductForm.Coefficient;
  Need_Cat_Cust  := AddProductForm.Need_Cat_Cust;
  Need_Objects   := AddProductForm.Need_Objects;

  if Need_Cat_Cust then begin
   for i := 0 to ProductTreeList.Count - 1 do begin
    if ProductTreeList.Items[i].Values[0] <> id_Product then Continue;
    for j := 0 to ProductTreeList.Items[i].Count - 1 do begin
     if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;
     if ProductTreeList.Items[i].Items[j].Values[2] = id_Cat_Cust then begin
      if ProductTreeList.Items[i].Items[j].Focused then Continue;

      if MessageDlg('Увага', 'Обрана категорія споживачів вже додана до списку '
      + 'категорій споживачів цієї продукції! Чи бажаєте Ви обрати іншу категорію споживачів?',
      mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;
      NotSelect := True;
      Break;
     end;
    end;
    if NotSelect then Break;
   end;
  end
  else begin
   for i := 0 to ProductTreeList.Count - 1 do
    if ProductTreeList.Items[i].Values[0] = id_Product then begin
     if ProductTreeList.Items[i].Focused then Continue;

     if MessageDlg('Увага', 'Не можна двічі додавати той же самий вид продукції до плану!'
     + ' Чи бажаєте Ви обрати інший вид продукції?', mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;
     NotSelect := True;
     Break;
    end;
  end;

  if not NotSelect then begin
   Query.SQL.Text := 'select * from PL_DT_COST_PRODUCT_SEL_COST('
   + QuotedStr(DateToStr(Plan_Date_Beg)) + ',' + QuotedStr(DateToStr(Plan_Date_End))
   + ',' + IntToStr(id_Product) + ',' + IntToStr(id_Cat_Cust) + ')';
   Query.ExecQuery;
   if Query.RecordCount = 0 then begin
    if MessageDlg('Увага', 'Неможна додати категорію споживачів, тому що для неї у '
    + 'довіднику тарифів та прейскурантів не вказана ціна! Чи бажаєте Ви обрати іншу '
    + 'категорію споживачів?', mtConfirmation,[mbYes, mbNo]) = mrNo then Exit;
    NotSelect := True;
    Query.Close;
    Continue;
   end;
  end;
 end;

// ------------------

 SP_Result := nil;

 while not Query.Eof do begin
  if Query.Fields[0].AsString = '' then begin
   Query.Next;
   Continue;
  end;
  SetLength(SP_Result, Length(SP_Result) + 1);

  with SP_Result[Length(SP_Result) - 1] do begin
   _Cost     := Query.Fields[0].AsCurrency;
   _Date_Beg := Query.Fields[1].AsDate;
   _Date_End := Query.Fields[2].AsDate;
  end;

  Query.Next;
 end;

 Query.Close;

 SavePlanData(TempStagesArray, TempFixedStages, SAVE_TO_TEMP, ProductTreeList);

 TempStages := nil;
 TempStages := Copy(TempStagesArray, 0, Length(TempStagesArray));

 StagesDeviding(TempStagesArray, SP_Result);

 if ProductTreeList.Count = 0 then Flag := True;

 ProductTreeList.BeginUpdate;

 while ProductTreeList.ColumnCount > LAST_COL + 1 do
  ProductTreeList.Columns[ProductTreeList.ColumnCount - 1].Destroy;

 MakeTreeList(TempStagesArray, TempFixedStages, id_Doc, ProductTreeList);

 if not Flag then
  FillOnlyDataWithCompare(TempStages, TempStagesArray, TempFixedStages,
  TempPlanDataArray, id_Doc);

// Adding of nodes

 if Need_Cat_Cust and (ProductTreeList.FocusedNode.Level = 1) then begin
  Child := ProductTreeList.FocusedNode;

  Child.Values[0] := 0;
  Child.Values[1] := Name_Cat_Cust;
  Child.Values[2] := id_Cat_Cust;
  Child.Values[3] := 0;

  Child.Focused := True;
 end
 else if not Need_Cat_Cust and (ProductTreeList.FocusedNode.Level = 0) then begin
  Node           := ProductTreeList.FocusedNode;

  Node.Values[0] := id_Product;
  Node.Values[1] := Name_Product;
  Node.Values[2] := 0;
  Node.Values[3] := 0;
  Node.Values[4] := Name_Unit_Meas;
  Node.Values[5] := Need_Cat_Cust;
  Node.Values[6] := Need_Objects;
  Node.Values[7] := id_Unit_Meas;
  Node.Values[8] := Coefficient;

  Node.Focused := True;
 end;

 for k := 0 to Length(TempFixedStages) - 1 do begin
  if TempFixedStages[k]._id_Doc <> id_Doc then Continue;
  Bool := True;

  for i := 0 to Length(TempStagesArray) - 1 do begin
   if TempStagesArray[i]._id_Doc <> id_Doc then Continue;
   if TempStagesArray[i]._Link_To <> TempFixedStages[k]._id_Stage then Continue;

   Bool := False;

   if TempStagesArray[i]._isItCostBeg then begin
    Flag := False;

    for j := 0 to Length(SP_Result) - 1 do
     if (TempStagesArray[i]._Date_Beg >= SP_Result[j]._Date_Beg)
     and (TempStagesArray[i]._Date_End <= SP_Result[j]._Date_End)
     then begin
      Flag := True;
      Break;
     end;

    if not Flag then Continue;

    if id_Cat_Cust > 0 then
     Child.Values[ProductTreeList.ColumnByName('PriceCol_'
     + IntToStr(TempStagesArray[i]._id_Stage)).ItemIndex] := SP_Result[j]._Cost
    else
     Node.Values[ProductTreeList.ColumnByName('PriceCol_'
     + IntToStr(TempStagesArray[i]._id_Stage)).ItemIndex] := SP_Result[j]._Cost;
   end;
  end;

  if Bool then  begin
   if TempFixedStages[k]._isItCostBeg then begin
    Flag := False;

    for j := 0 to Length(SP_Result) - 1 do
     if (TempFixedStages[k]._Date_Beg >= SP_Result[j]._Date_Beg)
     and (TempFixedStages[k]._Date_End <= SP_Result[j]._Date_End)
     then begin
      Flag := True;
      Break;
     end;

    if not Flag then Continue;

    if id_Cat_Cust > 0 then
     Child.Values[ProductTreeList.ColumnByName('PriceCol_'
     + IntToStr(TempFixedStages[k]._id_Stage)).ItemIndex] := SP_Result[j]._Cost
    else
     Node.Values[ProductTreeList.ColumnByName('PriceCol_'
     + IntToStr(TempFixedStages[k]._id_Stage)).ItemIndex] := SP_Result[j]._Cost;
   end;
  end;
 end;

 ProductTreeList.EndUpdate;
 ProductTreeList.FullExpand;

 SortObjects_and_CatCust;

 CalcSumms(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
          GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
end;

procedure TPlanEditorForm.FormCreate(Sender: TObject);
begin
 StoredProc.Transaction := dm.WriteTransaction;
 is_Signed_SG.DataBinding.ValueTypeClass := TcxIntegerValueType;

 FirstPrint := True;
 FontDialog.Font.Name    := SYS_FONT;
 FontDialog.Font.Size    := SYS_FSIZE;
 CellWidthSpinEdit.Text  := IntToStr(SYS_COLW);
end;

procedure TPlanEditorForm.FormShow(Sender: TObject);
begin
 GetFormParams(Self);

 FormResize(Sender);

 AddDocButton.Tag := 0;

//~~~~~~~~~~~~~~~~~~~~~~~

 id_Doc_SG.DataBinding.ValueTypeClass         := TcxIntegerValueType;
 id_Type_Doc_SG.DataBinding.ValueTypeClass    := TcxIntegerValueType;
 Name_Doc_SG.DataBinding.ValueTypeClass       := TcxStringValueType;
 Date_Doc_SG.DataBinding.ValueTypeClass       := TcxDateTimeValueType;
 Date_Reg_SG.DataBinding.ValueTypeClass       := TcxDateTimeValueType;
 id_Unit_Meas_SG.DataBinding.ValueTypeClass   := TcxIntegerValueType;
 Name_Unit_Meas_SG.DataBinding.ValueTypeClass := TcxStringValueType;
 Coefficient_SG.DataBinding.ValueTypeClass    := TcxIntegerValueType;

 RoundCountC := SpinEditC.IntValue;

 Name_Column.Width              := 200;
 Name_Unit_Meas_Column.Width    := 60;
 Name_Column2.Width             := 200;
 Name_Unit_Meas_Column2.Width   := 60;
 DepTreeList.Bands[0].Width     := 260;
 ProductTreeList.Bands[0].Width := 260;

 ProductTreeList.Bands[0].Caption.Text := '';
 DepTreeList.Bands[0].Caption.Text     := '';
end;

procedure TPlanEditorForm.SelectAll;
begin
 Caption := 'Редактор планів виробництва' + ' [' + Plan_Name + ']';
 StatusBar1.Panels[0].Text  := DepName + ':  ' + Plan_Name;
 StatusBar1.Panels[2].Text  := DateToStr(Plan_Date_Beg)
 + '-' + DateToStr(Plan_Date_End);

 EnableButtons(False);

 ReadYearPlan;

 PageControl.Pages[0].TabVisible := MainPlan;
 
 if not MainPlan then begin
  ComplicatedPreviewBtn.Visible   := ivNever;
  ComplicatedPrintBtn.Visible     := ivNever;
  ComplicatedExpBtn.Visible       := ivNever;
  ReportSumsPreview.Visible       := ivNever;
  ReportSumsPrint.Visible         := ivNever;
  SumExpBtn.Visible               := ivNever;
  CellWidthSpinEdit.Visible       := ivNever;
 end
 else begin
  TotalObjects.Visible := ivNever;
  PrintDate.Visible    := ivNever;
 end;

 if MainPlan then begin
  NaturalPrint.Down           := True;
  CostPrint.Down              := False;
  PageControl.ActivePageIndex := 0
 end
 else PageControl.ActivePageIndex := 1;

{Query.SQL.Text := 'select * from GET_MAN_ON_DEP_AND_POST(' + ''''
 + DateTimeToStr(Now) + '''' + ',' + IntToStr(id_Department) + ','
 +}

 RefreshData;
end;

procedure TPlanEditorForm.ProductTreeListKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not(Key in ['0'..'9', #44, #8, #13]) then Key := #0;
end;

procedure TPlanEditorForm.EditButtonClick(Sender: TObject);
begin
 if ProductTreeList.FocusedNode = nil then Exit;
 if ProductTreeList.FocusedNode.Values[0] < -1 then Exit;
 if ProductTreeList.FocusedNode.HasChildren then Exit;

 if (ProductTreeList.FocusedNode.Level = 1) and (ProductTreeList.FocusedNode.Values[3] > 0) then
  EditObject
 else
  EditCatCust;
end;

procedure TPlanEditorForm.StagesButtonClick(Sender: TObject);
begin
 if PageControl.ActivePageIndex = 0 then begin
  if MainPlan then
   SavePlanDataDep(TempStagesArray, TempFixedStages, SAVE_TO_TEMP)
  else
   Exit;
 end
 else if PageControl.ActivePageIndex = 1 then
  SavePlanData(TempStagesArray, TempFixedStages, SAVE_TO_TEMP, ProductTreeList);

 EditStages;

 GridDoc.Tag := 1;
end;

function TPlanEditorForm.BeforePrintSimple : boolean;
var
 d : TfrBandView;
begin
 Result := False;

 if PageControl.ActivePageIndex = 0 then
  TempTreeList := DepTreeList
 else
  TempTreeList := ProductTreeList;

 if (TempTreeList.Count = 0) or not (NaturalPrint.Down or CostPrint.Down) then begin
  ShowMessage('Неможна друкувати порожній план!');
  Exit;
 end;

 if not Report.LoadFromFile(APP_PATH + '\Reports\FPOP\Planning.frf') then begin
  ShowMessage('Файл звіту не знайдено! (' + APP_PATH + '\Reports\FPOP\Planning.frf)');
  Exit;
 end;

 ColDataset.RangeEnd      := reCount;

 TempTreeList.FullExpand;

 NatCount  := 0;
 CostCount := 0;

 if NaturalPrint.Down then NatCount := TempTreeList.Bands[1].VisibleColumnCount;
 if CostPrint.Down then CostCount   := TempTreeList.Bands[2].VisibleColumnCount;

 if NatCount = 0 then FirstCostCol := TempTreeList.Bands[2].VisibleColumns[0].ItemIndex;

 ColDataset.RangeEndCount := 2 + NatCount + CostCount;

 RowDataset.RangeEnd      := reCount;
 RowDataset.RangeEndCount := TempTreeList.LastNode.AbsoluteIndex +  2;

 PrintFont := FontDialog.Font;
 LastCol   := -1;

 d := TfrBandView(Report.FindObject('MasterData1'));
 if d <> nil then d.dy := PrintFont.Size + 2;

 Result := True;
end;

function TPlanEditorForm.BeforePrintComplicated : boolean;
var
 i             : integer;
 s             : string;
 k             : TStagesRecord;
begin
 Result := False;

 ProdNameWidth := 35 * 18 div 5;
 DefCellWidth  := StrToInt(CellWidthSpinEdit.Text);
 DefCellHeight := Trunc(SYS_FSIZE*1.25);
 TopSpace      := 110;
 OffSety       := 20;

 TempTreeList := DepTreeList;

 if TempTreeList.Count = 0 then begin
  ShowMessage('Неможна друкувати порожній план!');
  Exit;
 end;

 if not (NaturalPrint.Down xor CostPrint.Down) then begin
  ShowMessage('Оберіть один з видів друку: у натуральному або вартістному виразі!');
  Exit;
 end;

 ProdCount := TempTreeList.Items[0].Count;

 if not Report.LoadFromFile('Reports\FPOP\PlanningC.frf') then begin
  ShowMessage('Файл звіту не знайдено! (' + APP_PATH + '\Reports\FPOP\PlanningC.frf)');
  Exit;
 end;

 SetLength(StagesNames, 0);

 if NaturalPrint.Down then begin
  for i := LAST_COL + 1 to TempTreeList.ColumnCount - 1 do begin
   if TempTreeList.Columns[i].Position.BandIndex <> 1 then Continue;

   s := Copy(TempTreeList.Columns[i].Name, 0, 6);
   if (s = 'FQntCo') or (s = 'TotalQ') then begin
    SetLength(StagesNames, Length(StagesNames) + 1);


    if s = 'FQntCo' then begin
     k := PStagesRecord(Pointer(TempTreeList.Columns[i].Tag))^;
     StagesNames[Length(StagesNames) - 1]._Name := GetPeriodName(k._Date_Beg, k._Date_End, False, True);
    end
    else StagesNames[Length(StagesNames) - 1]._Name := GetPeriodName(Plan_Date_Beg, Plan_Date_End, False, True);

    StagesNames[Length(StagesNames) - 1]._Col_Num := i;
   end;
  end;
 end
 else if CostPrint.Down then begin
  for i := LAST_COL + 1 to TempTreeList.ColumnCount - 1 do begin
   if TempTreeList.Columns[i].Position.BandIndex <> 2 then Continue;

   s := Copy(TempTreeList.Columns[i].Name, 0, 6);
   if (s = 'FCostC') or (s = 'TotalC') then begin
    SetLength(StagesNames, Length(StagesNames) + 1);

    if s = 'FCostC' then begin
     k := PStagesRecord(Pointer(TempTreeList.Columns[i].Tag))^;
     StagesNames[Length(StagesNames) - 1]._Name := GetPeriodName(k._Date_Beg, k._Date_End, False, True);
    end
    else StagesNames[Length(StagesNames) - 1]._Name := GetPeriodName(Plan_Date_Beg, Plan_Date_End, False, True);

    StagesNames[Length(StagesNames) - 1]._Col_Num := i;
   end;
  end;
 end;

 PrintFont  := FontDialog.Font;

 Result       := True;
end;

function TPlanEditorForm.BeforePrintSums : boolean;
var
 i : integer;
 s : string;
 k : TStagesRecord;
begin
 Result := False;

 PageControl.ActivePageIndex := 0;

 if DepTreeList.Count = 0 then begin
  ShowMessage('Неможна друкувати порожній план!');
  Exit;
 end;

 if not Report.LoadFromFile(APP_PATH + '\Reports\FPOP\PlanningT.frf') then begin
  ShowMessage('Файл звіту не знайдено! (' + APP_PATH + '\Reports\FPOP\PlanningT.frf)');
  Exit;
 end;

 SetLength(StagesNames, 0);


 for i := LAST_COL + 1 to DepTreeList.ColumnCount - 1 do begin
  if DepTreeList.Columns[i].Position.BandIndex <> 2 then Continue;

  s := Copy(DepTreeList.Columns[i].Name, 0, 6);
  if (s = 'FCostC') or (s = 'TotalC') or (s = 'YearCo') then begin
   SetLength(StagesNames, Length(StagesNames) + 1);

   if s = 'FCostC' then begin
    k := PStagesRecord(Pointer(DepTreeList.Columns[i].Tag))^;
    StagesNames[Length(StagesNames) - 1]._Name := GetPeriodName(k._Date_Beg, k._Date_End, False, True);
   end
   else if s = 'YearCo' then
    StagesNames[Length(StagesNames) - 1]._Name := GetPeriodName(StartOfTheYear(Plan_Date_Beg), EndOfTheYear(Plan_Date_Beg), True, False)
   else StagesNames[Length(StagesNames) - 1]._Name := GetPeriodName(Plan_Date_Beg, Plan_Date_End, False, True);

   StagesNames[Length(StagesNames) - 1]._Col_Num := i;
  end;
 end;

 DepTreeList.FullExpand;

 RowDataset.RangeEnd      := reCount;
 RowDataset.RangeEndCount := DepTreeList.Count;

 PrintFont := FontDialog.Font;

 for i := 1 to 40 do TfrMemoView(Report.FindObject('Memo' + IntToStr(i))).Font := PrintFont;

 Result := True;
end;

procedure TPlanEditorForm.SimplePreviewBtnClick(Sender: TObject);
begin
 if not BeforePrintSimple then Exit;

 Report.OnGetValue  := PrintReportSimple;
 Report.OnBeginDoc  := ReportBeginDocSimple;
 Report.OnBeginBand := nil;

 Report.ShowReport;
end;

procedure TPlanEditorForm.ComplicatedPreviewBtnClick(Sender: TObject);
begin
 if not BeforePrintComplicated then Exit;

 Report.OnGetValue  := PrintReportComplicated;
 Report.OnBeginDoc  := ReportBeginDocComplicated;
 Report.OnBeginBand := ReportBeginBand;

 Report.ShowReport;
end;

procedure TPlanEditorForm.ReportSumsPreviewClick(Sender: TObject);
begin
 if not BeforePrintSums then Exit;

 Report.OnGetValue  := PrintReportSums;
 Report.OnBeginDoc  := nil;
 Report.OnBeginBand := nil;

 Report.ShowReport;
end;

procedure TPlanEditorForm.ReportBeginBand(Band: TfrBand);
var
 MemoRecord : TPrintRecord;
begin
 if RowDataset.RecNo + 1 >= RowDataset.RangeEndCount then Exit;

 MemoRecord := PrintArray[RowDataset.RecNo + 1, 0];

 Band.NewPageAfter := (MemoRecord._Top < PageTop + DefCellHeight);
end;

procedure TPlanEditorForm.SimplePrintBtnClick(Sender: TObject);
begin
 if not BeforePrintSimple then Exit;

 Report.OnGetValue  := PrintReportSimple;
 Report.OnBeginDoc  := ReportBeginDocSimple;
 Report.OnBeginBand := nil;

 Report.PrepareReport;
 Report.PrintPreparedReportDlg;
end;

procedure TPlanEditorForm.ComplicatedPrintBtnClick(Sender: TObject);
begin
 if not BeforePrintComplicated then Exit;

 Report.OnGetValue  := PrintReportComplicated;
 Report.OnBeginDoc  := ReportBeginDocComplicated;
 Report.OnBeginBand := ReportBeginBand;

 Report.PrepareReport;
 Report.PrintPreparedReportDlg;
end;

procedure TPlanEditorForm.ReportSumsPrintClick(Sender: TObject);
begin
 if not BeforePrintSums then Exit;

 Report.OnGetValue  := PrintReportSums;
 Report.OnBeginDoc  := nil;
 Report.OnBeginBand := nil;

 Report.PrepareReport;
 Report.PrintPreparedReportDlg;
end;

procedure TPlanEditorForm.RTFButtonClick(Sender: TObject);
begin
 if Sender = RTFButton then begin
  if not BeforePrintSimple then Exit;

  Report.OnGetValue  := PrintReportSimple;
  Report.OnBeginDoc  := ReportBeginDocSimple;
  Report.OnBeginBand := nil;
 end
 else if Sender = RTFButtonC then begin
  if not BeforePrintComplicated then Exit;

  Report.OnGetValue  := PrintReportComplicated;
  Report.OnBeginDoc  := ReportBeginDocComplicated;
  Report.OnBeginBand := ReportBeginBand;
 end
 else if Sender = RTFButtonS then begin
  if not BeforePrintSums then Exit;

  Report.OnGetValue  := PrintReportSums;
  Report.OnBeginDoc  := nil;
  Report.OnBeginBand := nil;
 end;

 SaveDialog.Filter := 'RTF files (*.rtf)|*.rtf';
 if not SaveDialog.Execute then Exit;

 try
  Report.PrepareReport;
  Report.ExportTo(RTFExport, SaveDialog.FileName + '.rtf');
 except
  ShowMessage('Неможна закінчити експорт даних!');
 end;
end;

procedure TPlanEditorForm.ExcelButtonClick(Sender: TObject);
//var
// ExcelExport : TfrOLEExcelExport;
begin
 if Sender = ExcelButton then begin
  if not BeforePrintSimple then Exit;

  Report.OnGetValue  := PrintReportSimple;
  Report.OnBeginDoc  := ReportBeginDocSimple;
  Report.OnBeginBand := nil;
 end
 else if Sender = ExcelButtonC then begin
  if not BeforePrintComplicated then Exit;

  Report.OnGetValue  := PrintReportComplicated;
  Report.OnBeginDoc  := ReportBeginDocComplicated;
  Report.OnBeginBand := ReportBeginBand;
 end
 else if Sender = ExcelButtonS then begin
  if not BeforePrintSums then Exit;

  Report.OnGetValue  := PrintReportSums;
  Report.OnBeginDoc  := nil;
  Report.OnBeginBand := nil;
 end;

 SaveDialog.Filter := 'Excel files (*.xls)|*.xls';
 if not SaveDialog.Execute then Exit;

 try
//  ExcelExport := TfrOLEExcelExport.Create(Self);
  Report.PrepareReport;
  Report.ExportTo(ExcelExport, SaveDialog.FileName + '.xls');
 except
  ShowMessage('Неможна закінчити експорт даних!');
 end;
end;

procedure TPlanEditorForm.HTMLButtonClick(Sender: TObject);
begin
 if Sender = HTMLButton then begin
  if not BeforePrintSimple then Exit;

  Report.OnGetValue  := PrintReportSimple;
  Report.OnBeginDoc  := ReportBeginDocSimple;
  Report.OnBeginBand := nil;
 end
 else if Sender = HTMLButtonC then begin
  if not BeforePrintComplicated then Exit;

  Report.OnGetValue  := PrintReportComplicated;
  Report.OnBeginDoc  := ReportBeginDocComplicated;
  Report.OnBeginBand := ReportBeginBand;
 end
 else if Sender = HTMLButtonS then begin
  if not BeforePrintSums then Exit;

  Report.OnGetValue  := PrintReportSums;
  Report.OnBeginDoc  := nil;
  Report.OnBeginBand := nil;
 end;

 SaveDialog.Filter := 'HTML files (*.html)|*.html';
 if not SaveDialog.Execute then Exit;

 try
  Report.PrepareReport;
  Report.ExportTo(HTML2Export, SaveDialog.FileName + '.html');
 except
  ShowMessage('Неможна закінчити експорт даних!');
 end;
end;

procedure TPlanEditorForm.FontPrintButtonClick(Sender: TObject);
begin
 if not FontDialog.Execute then Exit;

 SYS_FONT  := FontDialog.Font.Name;
 SYS_FSIZE := FontDialog.Font.Size;
end;

procedure TPlanEditorForm.PrintReportSimple(const ParName: String;
  var ParValue: Variant);
var
 Memo      : TfrMemoView;
 Page      : TfrPage;

 k         : integer;

 s         : string;
 n         : TcxTreeListNode;
begin
 Memo := TfrMemoView(Report.FindObject('Memo1'));
 Page := Report.Pages[0];

 if Memo <> nil then begin
  if ColDataset.RecNo > 0 then begin
   if ColDataset.RecNo = 1 then begin
    Report.Dictionary.Variables['CellWidth'] := 50;
    Report.Dictionary.Variables['CellLeft']  := 144 + Page.pgMargins.Left;

    Memo.Alignment := 2 + 8; //Center
   end
   else begin
    Report.Dictionary.Variables['CellWidth']    := CellWidth;
    Report.Dictionary.Variables['CellLeft']     := Page.pgMargins.Left + 144 + 50 + CellWidth*(ColDataset.RecNo - 2);
    if RowDataset.RecNo = 0 then Memo.Alignment := 2 + 8 //Center
    else Memo.Alignment := 1 + 8; //Right
   end;
  end
  else begin
   Report.Dictionary.Variables['CellWidth'] := 144;
   Report.Dictionary.Variables['CellLeft']  := Page.pgMargins.Left;
   Memo.Alignment := 0 + 8; //Left
  end;
  if RowDataset.RecNo = 0 then Memo.Alignment := 2 + 8; //Center
 end;

 if ParName = 'Title' then
  ParValue := Plan_Name + #13 + DepName
 else if ParName = 'RU' then
  ParValue := DepName
 else if ParName = 'Post' then begin
  ParValue := Post_Name;
//  if MainPlan then ParValue := 'Генеральний директор'
//  else ParValue := 'Директор';
 end
 else if ParName = 'EconPost' then begin
  ParValue := EconPost_Name;
//  if MainPlan then ParValue := 'Начальник економічного відділу'
//  else ParValue := 'Начальник економічної служби';
 end
 else if ParName = 'EconPost_FIO' then ParValue := EconPost_FIO
 else if ParName = 'Post_FIO' then ParValue := Post_FIO
 else if ParName = 'Cell' then begin
  if (NatCount = 0) and (ColDataset.RecNo > 1) then begin
   k := TempTreeList.Columns[FirstCostCol].VisibleIndex;
   k := TempTreeList.VisibleColumns[ColDataset.RecNo + k - 2].ItemIndex
  end
  else
   k := TempTreeList.VisibleColumns[ColDataset.RecNo].ItemIndex;

  if RowDataset.RecNo = 0 then ParValue := TempTreeList.Columns[k].Caption.Text
  else begin
   n := TempTreeList.Nodes.AbsoluteItems[RowDataset.RecNo - 1];

   if (Memo <> nil) then begin
    if (ColDataset.RecNo = 0) then begin
     if n.Level = 0 then
      Memo.Font.Style := Memo.Font.Style + [fsBold]
     else
      Memo.Font.Style := Memo.Font.Style - [fsBold];
    end
    else
     Memo.Font.Style  := Memo.Font.Style - [fsBold];
   end;

   if ColDataset.RecNo > 1 then begin
    s := Copy(TempTreeList.Columns[k].Name, 0, 6);
    if (n.Values[k] = '0') then begin
     if (s = 'QntCol') or (s = 'FQntCo') then
      ParValue := '-'
     else if (s = 'FCostC') or (s = 'CostCo') or (s = 'YearCo') or (s = 'TotalC') then
      ParValue := ''
     else
      ParValue := n.Values[k];
    end
    else
     ParValue := n.Values[k];
   end
   else begin
    if ColDataset.RecNo = 0 then begin
     if (n.Level = 0) then begin
      if not VarIsNull(n.Values[0]) then begin
       if (n.AbsoluteIndex <= TempTreeList.LastNode.AbsoluteIndex - 1)
       and (n.Values[0] <> -3) and n.Values[5] then
        ParValue := n.Values[1] + ' - разом'
       else
        ParValue := n.Values[1];
      end
      else ParValue := n.Values[1];
     end
     else if MainPlan and (PageControl.ActivePageIndex = 0) then begin
      if n.Values[0] > 0 then
       ParValue := AddSpaces('', 1) + n.Values[1]
      else if n.Values[2] > 0 then
       ParValue := AddSpaces('', SPACES_COUNT*2) + n.Values[1]
      else ParValue := n.Values[1];
     end
     else if MainPlan and (PageControl.ActivePageIndex = 1) then begin
      if n.Values[2] > 0 then
       ParValue := AddSpaces('', 1) + n.Values[1]
      else if n.Values[9] > 0 then
       ParValue := AddSpaces('', SPACES_COUNT*2) + n.Values[1]
      else ParValue := n.Values[1];
     end
     else begin
      if n.Values[0] < -1 then
       ParValue := n.Values[1]
      else if n.Values[2] > 0 then
       ParValue := AddSpaces('') + n.Values[1]
      else ParValue := n.Values[1];
     end;
    end;
    if ColDataset.RecNo = 1 then ParValue := n.Values[4];
   end;
  end;
 end
 else if ParName = 'Header1' then ParValue       := TempTreeList.Bands[0].Caption.Text
   else if ParName = 'Header2' then ParValue     := TempTreeList.Bands[1].Caption.Text
    else if ParName = 'Header3' then ParValue    := TempTreeList.Bands[2].Caption.Text
     else if ParName = 'PrintDate' then ParValue := DateToStr(Now);
end;

procedure TPlanEditorForm.PrintReportComplicated(const ParName: String;
  var ParValue: Variant);
var
 Memo       : TfrMemoView;
 MemoRecord : TPrintRecord;
begin
 if ParName = 'Title' then ParValue := Plan_Name
 else if ParName = 'Post' then begin
  if MainPlan then ParValue := 'Генеральний директор'
  else ParValue := 'Директор';
 end
 else if ParName = 'Cell' then begin
  MemoRecord   := PrintArray[RowDataset.RecNo, ColDataset.RecNo];

  Memo         := TfrMemoView(Report.FindObject('Memo1'));
  Memo.Font    := PrintFont;

  Memo.Font.Style := MemoRecord._FStyle;

  ParValue     := MemoRecord._Value;
  Memo.Visible := MemoRecord._Visible;
  Memo.dx      := MemoRecord._Width;
  Memo.dy      := MemoRecord._Height;
  Memo.x       := MemoRecord._Left;
  Memo.y       := MemoRecord._Top;
 end;
end;

procedure TPlanEditorForm.PrintReportSums(const ParName: String;
  var ParValue: Variant);
var
 r, k        : integer;
 i, j        : integer;
 s           : string;
 Sum         : extended;
 MainProduct : boolean;
begin
 if ParName = 'Title' then ParValue := 'на ' +  GetPeriodName(Plan_Date_Beg, Plan_Date_End, True, False)
 else if Copy(ParName, 1, 6) = 'Period' then begin
  s := Copy(ParName, 7, 1);

  if s = '' then ParValue := StagesNames[1]._Name
  else if s = 'Y' then ParValue := StagesNames[0]._Name
  else ParValue := StagesNames[StrToInt(s) + 1]._Name;
 end
 else if ParName = 'Post' then ParValue := 'Генеральний директор'
 else if ParName = 'NameDep' then begin
  if RowDataset.RecNo = DepTreeList.Count - 1 then ParValue := 'Разом по підприємству'
  else begin
   r := RowDataset.RecNo + 1;
   ParValue := DepTreeList.Items[r].Values[1];
  end;
 end
 else if (Copy(ParName, 1, 2) = 'PM') or (Copy(ParName, 1, 2) = 'PN') then begin
  MainProduct := (Copy(ParName, 1, 2) = 'PM');
  s := Copy(ParName, 3, 1);

  if s = '' then k := StagesNames[1]._Col_Num
  else if s = 'Y' then k := StagesNames[0]._Col_Num
  else k := StagesNames[StrToInt(s) + 1]._Col_Num;

  Sum := 0;

  if RowDataset.RecNo = DepTreeList.Count - 1 then begin
   for i := 1 to DepTreeList.Count - 1 do
    for j := 0 to DepTreeList.Items[i].Count - 1 do
     if DepTreeList.Items[i].Items[j].Values[6] = MainProduct then
      Sum := Sum + DepTreeList.Items[i].Items[j].Values[k];
  end
  else begin
   r := RowDataset.RecNo + 1;

   for i := 0 to DepTreeList.Items[r].Count - 1 do
    if DepTreeList.Items[r].Items[i].Values[6] = MainProduct then
     Sum := Sum + DepTreeList.Items[r].Items[i].Values[k];
  end;

  if not MainProduct and (Sum = 0) then ParValue := ''
  else ParValue := Sum;
 end
 else if Copy(ParName, 1, 2) = 'PS' then begin
  s := Copy(ParName, 3, 1);

  if s = '' then k := StagesNames[1]._Col_Num
  else if s = 'Y' then k := StagesNames[0]._Col_Num
  else k := StagesNames[StrToInt(s) + 1]._Col_Num;

  Sum := 0;

  if RowDataset.RecNo = DepTreeList.Count - 1 then begin
   for i := 1 to DepTreeList.Count - 1 do
    for j := 0 to DepTreeList.Items[i].Count - 1 do Sum := Sum + DepTreeList.Items[i].Items[j].Values[k];
  end
  else begin
   r := RowDataset.RecNo + 1;

   for i := 0 to DepTreeList.Items[r].Count - 1 do Sum := Sum + DepTreeList.Items[r].Items[i].Values[k];
  end;

  ParValue := Sum;
 end
 else ParValue := '';
end;

procedure TPlanEditorForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
 i    : integer;
 Flag : boolean;
begin
 Flag := False;

 if (Length(NewStagesArray) > 0) or (Length(NewPlanDataArray) > 0)
 or (Length(DelDocArray) > 0) or (Length(DelStagesArray) > 0) then Flag := True;

 if not(Flag) then begin
  for i := 0 to Length(PlanDataArray) - 1 do begin
   if PlanDataArray[i]._Modified <> 'no' then begin
    Flag := True;
    Break;
   end;
  end;
 end;

 if Flag or ProductTreeList.OptionsData.Editing then begin
  case MessageDlg('Вихід', 'У плані відбулися зміни. Чи бажаєте Ви зберегти їх?',
       mtConfirmation, [mbYes, mbNo, mbCancel]) of
   mrYes    :
    begin
     if ProductTreeList.OptionsData.Editing then ApplyButtonClick(Sender);
     SaveWork(False);
     CanClose := True;
    end;
   mrNo     : CanClose := True;
   mrCancel : CanClose := False;
  end;
 end
 else CanClose := True;
end;

procedure TPlanEditorForm.ActionExitExecute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

procedure TPlanEditorForm.ExpandButtonClick(Sender: TObject);
begin
 if PageControl.ActivePageIndex = 0 then
  DepTreeList.FullExpand
 else if PageControl.ActivePageIndex = 1 then
  ProductTreeList.FullExpand;
end;

procedure TPlanEditorForm.CollapseButtonClick(Sender: TObject);
begin
 if PageControl.ActivePageIndex = 0 then
  DepTreeList.FullCollapse
 else if PageControl.ActivePageIndex = 1 then
  ProductTreeList.FullCollapse;
end;

procedure TPlanEditorForm.ProductTreeListContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
{ if ProductTreeList.Count = 0 then begin
  ExpandButton.Enabled   := False;
  CollapseButton.Enabled := False;
 end
 else begin
  ExpandButton.Enabled   := True;
  CollapseButton.Enabled := True;
 end;}
end;

procedure TPlanEditorForm.GetDerivedPlansData;
var
 i, j , k, n       : integer;
 f, t, p           : integer;
 AutoInc           : integer;

 LinkedPlansArray  : array of integer;
 LinkedDocsArray   : array of integer;
 LinkedFixedStages : TStagesArray;
 LinkedStagesArray : TStagesArray;
 LinkedPlanData    : TPlanDataArray;

 TempRecord        : TStagesRecord;

 Flag              : boolean;
 Flag1             : boolean;
 Bool1             : boolean;
 Bool2             : boolean;

 LastCostArray     : TLastCostArray;
 LastDep_id        : integer;
 LastDep_Name      : string;

 MinDate           : TDate;
 MinNum            : integer;

 Multiplicator     : Currency;

 Date_Beg          : TDate;
 Date_End          : TDate;

 Devided           : boolean;
begin
 LinkedPlansArray  := nil;
 LinkedDocsArray   := nil;
 LinkedFixedStages := nil;
 LinkedStagesArray := nil;
 LinkedPlanData    := nil;
 LastCostArray     := nil;

 // Selecting derived Plans

 Query.Close;
 Query.SQL.Text := 'select id_Plan from dt_Plans where LINK_PLAN_TO=' + IntToStr(id_Plan);
 Query.ExecQuery;
 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;

 while not Query.Eof do begin
  SetLength(LinkedPlansArray, Length(LinkedPlansArray) + 1);
  LinkedPlansArray[Length(LinkedPlansArray) - 1] := Query.Fields[0].AsInteger;

  Query.Next;
 end;
 Query.Close;

 // Selecting docs of derived Plans

 if Length(LinkedPlansArray) = 0 then Exit;

 for i := 0 to Length(LinkedPlansArray) - 1 do begin
  Query.SQL.Text := 'select * from PROC_DT_PLANS_DERIVED_SEL(' + IntToStr(LinkedPlansArray[i]) + ')';
  Query.ExecQuery;

  if Query.RecordCount = 0 then begin
   Query.Close;
   Break;
  end;

  while not Query.Eof do begin
   if Query.Fields[0].AsInteger > 0 then begin
    SetLength(LinkedDocsArray, Length(LinkedDocsArray) + 1);
    LinkedDocsArray[Length(LinkedDocsArray) - 1] := Query.Fields[0].AsInteger;
   end;

   Query.Next;
  end;
  Query.Close;
 end;

 // Selecting fixed stages of derived plans

 if Length(LinkedDocsArray) = 0 then Exit;

 for i := 0 to Length(LinkedDocsArray) - 1 do begin
  if LinkedDocsArray[i] <= 0 then Continue;

  Query.SQL.Text := 'select id_Stage, Date_Beg, Date_End from dt_Stage where id_Doc='
  + IntToStr(LinkedDocsArray[i]) + ' and Link_To=-1';
  Query.ExecQuery;

  if Query.RecordCount = 0 then begin
   Query.Close;
   Continue;
  end;

  while not Query.Eof do begin
   if Query.Fields[0].AsInteger > 0 then begin
    SetLength(LinkedFixedStages, Length(LinkedFixedStages) + 1);
    with LinkedFixedStages[Length(LinkedFixedStages) -  1] do begin
     _Link_To  := -1;
     _Modified := '';
     _id_Doc   := -1;
     _id_Stage := Query.Fields[0].AsInteger;
     _Date_Beg := Query.Fields[1].AsDate;
     _Date_End := Query.Fields[2].AsDate;
    end;
   end;

   Query.Next;
  end;

  Query.Close;
 end;

 // Selecting  derived stages of derived plans

 for i := 0 to Length(LinkedFixedStages) - 1 do begin
  Query.SQL.Text := 'select id_Stage, Date_Beg, Date_End from dt_Stage where Link_To='
  + IntToStr(LinkedFixedStages[i]._id_Stage);
  Query.ExecQuery;

  if Query.RecordCount = 0 then begin
   Query.Close;
   Continue;
  end;

  while not Query.Eof do begin
   if Query.Fields[0].AsInteger > 0 then begin
    SetLength(LinkedFixedStages, Length(LinkedFixedStages) + 1);
    with LinkedFixedStages[Length(LinkedFixedStages) -  1] do begin
     _Link_To  := LinkedFixedStages[i]._id_Stage;
     _Modified := '';
     _id_Doc   := -1;
     _id_Stage := Query.Fields[0].AsInteger;
     _Date_Beg := Query.Fields[1].AsDate;
     _Date_End := Query.Fields[2].AsDate;
    end;
   end;

   Query.Next;
  end;

  Query.Close;
 end;

 // Sorting LinkedFixedStages descending

 k := 0;
 while k < Length(LinkedFixedStages) - 1 do begin
  MinDate := LinkedFixedStages[k]._Date_Beg;
  MinNum  := k;

  for i := k + 1 to Length(LinkedFixedStages) - 1 do begin
   if LinkedFixedStages[i]._Date_Beg < MinDate then begin
    MinDate := LinkedFixedStages[i]._Date_Beg;
    MinNum  := i;
   end;
  end;

  TempRecord := LinkedFixedStages[MinNum];
  LinkedFixedStages[MinNum] := LinkedFixedStages[k];
  LinkedFixedStages[k]      := TempRecord;
  Inc(k);
 end;

 // Selecting PlanData

 if Length(LinkedFixedStages) = 0 then Exit;

 for f := 0 to Length(LinkedFixedStages) - 1 do begin
  Bool1 := True;
  for i := 0 to Length(LinkedStagesArray) - 1 do begin
   if LinkedStagesArray[i]._Link_To <> LinkedFixedStages[f]._id_Stage then Continue;

   Query.SQL.Text := 'select * from SP_DT_PLAN_DATA_SEL('
   + IntToStr(LinkedStagesArray[i]._id_Stage) + ',' + #39 + DateToStr(SYS_MAX_TIMESTAMP)
   + #39 + ')';
   Query.ExecQuery;

   if Query.RecordCount = 0 then begin
    Query.Close;
    Break;
   end;

   Bool1 := False;

   while not Query.Eof do begin
    SetLength(LinkedPlanData, Length(LinkedPlanData) + 1);
    with LinkedPlanData[Length(LinkedPlanData) - 1] do begin
     _Modified        := '';
     _id_Stage        := LinkedStagesArray[i]._id_Stage;
     _id_Department   := Query['ID_DEPARTMENT'].AsInteger;
     _id_Product      := Query['ID_PRODUCT'].AsInteger;
     _Name_Product    := Query['NAME_PRODUCT'].AsString;
     _id_Unit_Meas    := Query['ID_UNIT_MEAS'].AsInteger;
     _Name_Unit_Meas  := Query['NAME_UNIT_MEAS'].AsString;
     _Coefficient     := Query['COEFFICIENT'].AsInteger;
     _id_Cat_Cust     := Query['ID_CAT_CUST'].AsInteger;
     _Name_Cat_Cust   := Query['NAME_CAT_CUST'].AsString;
     _Cost            := Query['COST'].AsCurrency;
     _Volume          := Query['VOLUME'].AsCurrency;
     _Summa           := Query['SUMMA'].AsCurrency;
     _id_Object       := Query['ID_OBJECT'].AsInteger;
     _Name_Object     := Query['NAME_OBJECT'].AsString;
     _Need_Cat_Cust   := (Query['NEED_CAT_CUST'].AsInteger = 1);
     _Need_Objects    := (Query['NEED_OBJECTS'].AsInteger = 1);
     _DispOrder_Prod  := Query['DISPLAY_ORDER_PROD'].AsInteger;
     _Display_Order   := Query['DISPLAY_ORDER'].AsInteger;
    end;

    Flag := False;
    if Length(LastCostArray) = 0 then begin
     SetLength(LastCostArray, Length(LastCostArray) + 1);
     with LastCostArray[Length(LastCostArray) - 1] do begin
      _id_Product  := Query['ID_PRODUCT'].AsInteger;
      _id_Cat_Cust := Query['ID_CAT_CUST'].AsInteger;
      _Cost        := Query['COST'].AsCurrency;
     end;

     Flag := True;
    end
    else begin
     for j := 0 to Length(LastCostArray) - 1 do begin
      if  (LastCostArray[j]._id_Product = Query['ID_PRODUCT'].AsInteger)
      and (LastCostArray[j]._id_Cat_Cust = Query['ID_CAT_CUST'].AsInteger)
      then begin
       if LastCostArray[j]._Cost = Query['COST'].AsCurrency
       then Break
       else begin
        LastCostArray[j]._Cost := Query['COST'].AsCurrency;
        Flag := True;
       end;
      end
      else Continue;
     end;
    end;

    LinkedStagesArray[i]._isItCostBeg := Flag;

    Query.Next;
   end;
   Query.Close;
  end;

  if Bool1 then begin
   Query.SQL.Text := 'select * from SP_DT_PLAN_DATA_SEL('
   + IntToStr(LinkedFixedStages[f]._id_Stage) + ',' + #39 + DateToStr(SYS_MAX_TIMESTAMP)
   + #39 + ')';
   Query.ExecQuery;

   if Query.RecordCount = 0 then begin
    Query.Close;
    Break;
   end;

   while not Query.Eof do begin
    SetLength(LinkedPlanData, Length(LinkedPlanData) + 1);
    with LinkedPlanData[Length(LinkedPlanData) - 1] do begin
     _Modified        := '';
     _id_Stage        := LinkedFixedStages[f]._id_Stage;
     _id_Department   := Query['ID_DEPARTMENT'].AsInteger;
     _id_Product      := Query['ID_PRODUCT'].AsInteger;
     _Name_Product    := Query['NAME_PRODUCT'].AsString;
     _id_Unit_Meas    := Query['ID_UNIT_MEAS'].AsInteger;
     _Name_Unit_Meas  := Query['NAME_UNIT_MEAS'].AsString;
     _Coefficient     := Query['COEFFICIENT'].AsInteger;
     _id_Cat_Cust     := Query['ID_CAT_CUST'].AsInteger;
     _Name_Cat_Cust   := Query['NAME_CAT_CUST'].AsString;
     _Cost            := Query['COST'].AsCurrency;
     _Volume          := Query['VOLUME'].AsCurrency;
     _Summa           := Query['SUMMA'].AsCurrency;
     _id_Object       := Query['ID_OBJECT'].AsInteger;
     _Name_Object     := Query['NAME_OBJECT'].AsString;
     _Need_Cat_Cust   := (Query['NEED_CAT_CUST'].AsInteger = 1);
     _Need_Objects    := (Query['NEED_OBJECTS'].AsInteger = 1);
     _DispOrder_Prod  := Query['DISPLAY_ORDER_PROD'].AsInteger;
     _Display_Order   := Query['DISPLAY_ORDER'].AsInteger;
    end;

    Flag := False;
    if Length(LastCostArray) = 0 then begin
     SetLength(LastCostArray, Length(LastCostArray) + 1);
     with LastCostArray[Length(LastCostArray) - 1] do begin
      _id_Product  := Query['ID_PRODUCT'].AsInteger;
      _id_Cat_Cust := Query['ID_CAT_CUST'].AsInteger;
      _Cost        := Query['COST'].AsCurrency;
     end;

     Flag := True;
    end
    else begin
     Flag1 := True;
     for j := 0 to Length(LastCostArray) - 1 do begin
      if  (LastCostArray[j]._id_Product = Query['ID_PRODUCT'].AsInteger)
      and (LastCostArray[j]._id_Cat_Cust = Query['ID_CAT_CUST'].AsInteger)
      then begin
       if LastCostArray[j]._Cost = Query['COST'].AsCurrency
       then begin
        Flag1 := False;
        Break;
       end
       else begin
        LastCostArray[j]._Cost := Query['COST'].AsCurrency;
        Flag1 := False;
        Flag  := True;
       end;
      end
      else Continue;
     end;

     if Flag1 then begin
      SetLength(LastCostArray, Length(LastCostArray) + 1);
      with LastCostArray[Length(LastCostArray) - 1] do begin
       _id_Product  := Query['ID_PRODUCT'].AsInteger;
       _id_Cat_Cust := Query['ID_CAT_CUST'].AsInteger;
       _Cost        := Query['COST'].AsCurrency;
      end;

      Flag := True;
     end;
    end;

    if Flag then LinkedFixedStages[f]._isItCostBeg := True;

    Query.Next;
   end;
   Query.Close;
  end;
 end;

// Setting isItCostBeg of first element of LinkedFixedStages to right form

 if Length(LinkedFixedStages) > 1 then begin
  Flag := False;

  for f := 1 to Length(LinkedFixedStages) - 1 do
   if LinkedFixedStages[f]._isItCostBeg then begin
    Flag := True;
    Break;
   end;

  if not Flag then LinkedFixedStages[0]._isItCostBeg := False;
 end;

// Filling Name_Department

 LastDep_id := -2;
 for i := 0 to Length(LinkedPlanData) - 1 do begin
  if LinkedPlanData[i]._id_Department <> LastDep_id then begin
   LastDep_id := LinkedPlanData[i]._id_Department;
   Query.SQL.Text := 'select Name_Short from sp_Department where id_Department='
   + IntToStr(LinkedPlanData[i]._id_Department);
   Query.ExecQuery;

   if Query.RecordCount <> 0 then LastDep_Name := Query.Fields[0].AsString;
   Query.Close;
  end;

  LinkedPlanData[i]._Name_Department := LastDep_Name;
 end;

 // Setting AutoInc

 for i := 0 to Length(TempFixedStages) - 1 do
  if TempFixedStages[i]._id_Stage >= AutoInc then
   AutoInc := TempFixedStages[i]._id_Stage + 1;

 // Filling of TempStagesArray

 TempStagesArray := nil;

 for i := 0 to Length(TempFixedStages) - 1 do begin
  Date_Beg := TempFixedStages[i]._Date_Beg;
  Date_End := TempFixedStages[i]._Date_End;

  Devided := False;
  for f := 0 to Length(LinkedFixedStages) - 1 do begin
   if (LinkedFixedStages[f]._Date_Beg > Date_End)
   or (LinkedFixedStages[f]._Date_End < Date_Beg)
   then Continue;

   Bool1 := True;

   for j := 0 to Length(LinkedStagesArray) - 1 do begin
    if LinkedStagesArray[j]._Link_To <> LinkedFixedStages[f]._id_Stage then Continue;

    Bool1 := False;

    if (LinkedStagesArray[j]._Date_Beg > Date_End)
    or (LinkedStagesArray[j]._Date_End < Date_Beg)
    then Continue;

    Flag := True;

    if LinkedStagesArray[j]._isItCostBeg then begin
     if  (LinkedStagesArray[j]._Date_Beg < Date_Beg)
     and (LinkedStagesArray[j]._Date_End > Date_Beg)
     and (LinkedStagesArray[j]._Date_End < Date_End)
     then begin
      SetLength(TempStagesArray, Length(TempStagesArray) + 1);
      with TempStagesArray[Length(TempStagesArray) - 1] do begin
       _Link_To     := LinkedFixedStages[f]._id_Stage;
       _Modified    := '';
       _id_Doc      := TempFixedStages[i]._id_Doc;
       Inc(AutoInc);
       _id_Stage    := AutoInc;
       _Date_Beg    := LinkedStagesArray[j]._Date_Beg;
       _Date_End    := Date_Beg - 1;
       _isItCostBeg := TempFixedStages[i]._isItCostBeg;
      end;

      SetLength(TempStagesArray, Length(TempStagesArray) + 1);
      with TempStagesArray[Length(TempStagesArray) - 1] do begin
       _Link_To     := LinkedFixedStages[f]._id_Stage;
       _Modified    := '';
       _id_Doc      := TempFixedStages[i]._id_Doc;
       Inc(AutoInc);
       _id_Stage    := AutoInc;
       _Date_Beg    := Date_Beg;
       _Date_End    := LinkedStagesArray[j]._Date_End;
       _isItCostBeg := True;
      end;
      Date_Beg := LinkedStagesArray[j]._Date_End + 1;
      Flag := False;
     end;

     if  (LinkedStagesArray[j]._Date_Beg < Date_End)
     and (LinkedStagesArray[j]._Date_Beg > Date_Beg)
     and (LinkedStagesArray[j]._Date_End > Date_End)
     then begin
      SetLength(TempStagesArray, Length(TempStagesArray) + 1);
      with TempStagesArray[Length(TempStagesArray) - 1] do begin
       _Link_To     := LinkedFixedStages[f]._id_Stage;
       _Modified    := '';
       _id_Doc      := TempFixedStages[i]._id_Doc;
       Inc(AutoInc);
       _id_Stage    := AutoInc;
       _Date_Beg    := LinkedStagesArray[j]._Date_Beg;
       _Date_End    := Date_End - 1;
       _isItCostBeg := TempFixedStages[i]._isItCostBeg;
      end;

      SetLength(TempStagesArray, Length(TempStagesArray) + 1);
      with TempStagesArray[Length(TempStagesArray) - 1] do begin
       _Link_To     := LinkedFixedStages[f]._id_Stage;
       _Modified    := '';
       _id_Doc      := TempFixedStages[i]._id_Doc;
       Inc(AutoInc);
       _id_Stage    := AutoInc;
       _Date_Beg    := Date_End;
       _Date_End    := LinkedStagesArray[j]._Date_End;
       _isItCostBeg := True;
      end;
      Break;
     end;
    end;

    if Flag then begin
     SetLength(TempStagesArray, Length(TempStagesArray) + 1);
     with TempStagesArray[Length(TempStagesArray) - 1] do begin
      _Link_To     := LinkedFixedStages[f]._id_Stage;
      _Modified    := '';
      _id_Doc      := TempFixedStages[i]._id_Doc;
      Inc(AutoInc);
      _id_Stage    := AutoInc;
      _Date_Beg    := Date_Beg;
      _Date_End    := Date_End;
      _isItCostBeg := TempFixedStages[i]._isItCostBeg;
     end;
    end;
   end;

   if Bool1 then begin
    if (LinkedFixedStages[f]._Date_Beg > Date_End)
    or (LinkedFixedStages[f]._Date_End < Date_Beg)
    then Continue;

    if LinkedFixedStages[f]._isItCostBeg {and (f > 0)} then begin
     if  (LinkedFixedStages[f]._Date_Beg < Date_Beg)
     and (LinkedFixedStages[f]._Date_End > Date_Beg)
     and (LinkedFixedStages[f]._Date_End < Date_End)
     then begin
      Devided := True;

      SetLength(TempStagesArray, Length(TempStagesArray) + 1);
      with TempStagesArray[Length(TempStagesArray) - 1] do begin
       _Link_To     := TempFixedStages[i]._id_Stage;
       _Modified    := '';
       _id_Doc      := TempFixedStages[i]._id_Doc;
       Inc(AutoInc);
       _id_Stage    := AutoInc;
       _Date_Beg    := LinkedFixedStages[f]._Date_Beg;
       _Date_End    := Date_Beg - 1;
       _isItCostBeg := TempFixedStages[i]._isItCostBeg;
      end;

      SetLength(TempStagesArray, Length(TempStagesArray) + 1);
      with TempStagesArray[Length(TempStagesArray) - 1] do begin
       _Link_To     := TempFixedStages[i]._id_Stage;
       _Modified    := '';
       _id_Doc      := TempFixedStages[i]._id_Doc;
       Inc(AutoInc);
       _id_Stage    := AutoInc;
       _Date_Beg    := Date_Beg;
       _Date_End    := LinkedFixedStages[f]._Date_End;
       _isItCostBeg := True;
      end;
      Date_Beg := LinkedFixedStages[f]._Date_End + 1;
     end;

     if  (LinkedFixedStages[f]._Date_Beg < Date_End)
     and (LinkedFixedStages[f]._Date_Beg > Date_Beg)
     and (LinkedFixedStages[f]._Date_End > Date_End)
     then begin
      Devided := True;

      SetLength(TempStagesArray, Length(TempStagesArray) + 1);
      with TempStagesArray[Length(TempStagesArray) - 1] do begin
       _Link_To     := TempFixedStages[i]._id_Stage;
       _Modified    := '';
       _id_Doc      := TempFixedStages[i]._id_Doc;
       Inc(AutoInc);
       _id_Stage    := AutoInc;
       _Date_Beg    := LinkedFixedStages[f]._Date_Beg;
       _Date_End    := Date_End - 1;
       _isItCostBeg := TempFixedStages[i]._isItCostBeg;
      end;

      SetLength(TempStagesArray, Length(TempStagesArray) + 1);
      with TempStagesArray[Length(TempStagesArray) - 1] do begin
       _Link_To     := TempFixedStages[i]._id_Stage;
       _Modified    := '';
       _id_Doc      := TempFixedStages[i]._id_Doc;
       Inc(AutoInc);
       _id_Stage    := AutoInc;
       _Date_Beg    := Date_End;
       _Date_End    := LinkedFixedStages[f]._Date_End;
       _isItCostBeg := True;
      end;
      Break;
     end;

     if  ((LinkedFixedStages[f]._Date_Beg >= Date_Beg)
      and (LinkedFixedStages[f]._Date_End < Date_End))
     or ((LinkedFixedStages[f]._Date_Beg > Date_Beg)
      and (LinkedFixedStages[f]._Date_End <= Date_End))
     then begin
      Devided := True;

      SetLength(TempStagesArray, Length(TempStagesArray) + 1);
      with TempStagesArray[Length(TempStagesArray) - 1] do begin
       _Link_To     := TempFixedStages[i]._id_Stage;
       _Modified    := '';
       _id_Doc      := TempFixedStages[i]._id_Doc;
       Inc(AutoInc);
       _id_Stage    := AutoInc;
       _Date_Beg    := LinkedFixedStages[f]._Date_Beg;
       _Date_End    := LinkedFixedStages[f]._Date_End;
       _isItCostBeg := LinkedFixedStages[f]._isItCostBeg;
      end;
     end;
    end
    else if Devided then begin
     SetLength(TempStagesArray, Length(TempStagesArray) + 1);
     with TempStagesArray[Length(TempStagesArray) - 1] do begin
      _Link_To     := TempFixedStages[i]._id_Stage;
      _Modified    := '';
      _id_Doc      := TempFixedStages[i]._id_Doc;
      Inc(AutoInc);
      _id_Stage    := AutoInc;
      _Date_Beg    := LinkedFixedStages[f]._Date_Beg;
      _Date_End    := LinkedFixedStages[f]._Date_End;
      _isItCostBeg := LinkedFixedStages[f]._isItCostBeg;
     end;
    end;
   end;
  end;
 end;

 // Filling of TempPlanDataArray

 TempPlanDataArray := nil;

 for f := 0 to Length(TempFixedStages) - 1 do begin
  Bool1 := True;

  for i := 0 to Length(TempStagesArray) - 1 do begin
   if TempStagesArray[i]._Link_To <> TempFixedStages[f]._id_Stage then Continue;
   Bool1 := False;

   for t := 0 to Length(LinkedFixedStages) - 1 do begin
    if (LinkedFixedStages[t]._Date_Beg > TempStagesArray[i]._Date_End)
    or (LinkedFixedStages[t]._Date_End < TempStagesArray[i]._Date_Beg) then Continue;
    Bool2 := True;

    for j := 0 to Length(LinkedStagesArray) - 1 do begin
     if LinkedStagesArray[j]._Link_To <> LinkedFixedStages[t]._id_Stage then Continue;

     Bool2 := False;

     if  (LinkedStagesArray[j]._Date_Beg <= TempStagesArray[i]._Date_Beg)
     and (LinkedStagesArray[j]._Date_End >= TempStagesArray[i]._Date_End)
     then Multiplicator := (TempStagesArray[i]._Date_End - TempStagesArray[i]._Date_End)
                      /(LinkedStagesArray[j]._Date_Beg - LinkedStagesArray[j]._Date_End)

     else if  (LinkedStagesArray[j]._Date_Beg >= TempStagesArray[i]._Date_Beg)
          and (LinkedStagesArray[j]._Date_End <= TempStagesArray[i]._Date_End)
          then Multiplicator := 1

     else if  (LinkedStagesArray[j]._Date_Beg <= TempStagesArray[i]._Date_Beg)
          and (LinkedStagesArray[j]._Date_End <= TempStagesArray[i]._Date_End)
          and (LinkedStagesArray[j]._Date_End > TempStagesArray[i]._Date_Beg)
          then Multiplicator := (LinkedStagesArray[j]._Date_End - TempStagesArray[i]._Date_Beg)
                           /(LinkedStagesArray[j]._Date_Beg - LinkedStagesArray[j]._Date_End)

     else if  (LinkedStagesArray[j]._Date_Beg <= TempStagesArray[i]._Date_End)
          and (LinkedStagesArray[j]._Date_Beg > TempStagesArray[i]._Date_Beg)
          and (LinkedStagesArray[j]._Date_End > TempStagesArray[i]._Date_End)
          then Multiplicator := (TempStagesArray[i]._Date_End - LinkedStagesArray[j]._Date_Beg)
                           /(LinkedStagesArray[j]._Date_Beg - LinkedStagesArray[j]._Date_End);


     for k := 0 to Length(LinkedPlanData) - 1 do begin
      if LinkedPlanData[k]._id_Stage <> LinkedStagesArray[j]._id_Stage then Continue;

      Flag := True;
      for n := 0 to Length(TempPlanDataArray) - 1 do
       if  (TempPlanDataArray[n]._id_Stage = TempStagesArray[i]._id_Stage)
       and (TempPlanDataArray[n]._id_Product = LinkedPlanData[k]._id_Product) then begin
        if LinkedPlanData[k]._Need_Cat_Cust then begin
         if not TempPlanDataArray[n]._Need_Cat_Cust then Continue;

         if (LinkedPlanData[k]._id_Cat_Cust > 0)
         and (TempPlanDataArray[n]._id_Cat_Cust = LinkedPlanData[k]._id_Cat_Cust) then begin
          Flag := False;
          Break;
         end
         else if LinkedPlanData[k]._Need_Objects and (LinkedPlanData[k]._id_Object > 0)
              and (TempPlanDataArray[n]._id_Object = LinkedPlanData[k]._id_Object)
              and TempPlanDataArray[n]._Need_Objects then begin
               Flag := False;
               Break;
              end;
        end
        else if LinkedPlanData[k]._Need_Objects then begin
         if not TempPlanDataArray[n]._Need_Objects then Continue;

         if (LinkedPlanData[k]._id_Object > 0)
         and (TempPlanDataArray[n]._id_Object = LinkedPlanData[k]._id_Object)
         and TempPlanDataArray[n]._Need_Objects then begin
          Flag := False;
          Break;
         end;
        end
        else if not (TempPlanDataArray[n]._Need_Cat_Cust or TempPlanDataArray[n]._Need_Objects) then begin
         Flag := False;
         Break;
        end;
       end;

      if Flag then begin
       SetLength(TempPlanDataArray, Length(TempPlanDataArray) + 1);
       TempPlanDataArray[Length(TempPlanDataArray) - 1]           := LinkedPlanData[k];
       TempPlanDataArray[Length(TempPlanDataArray) - 1]._id_Stage := TempStagesArray[i]._id_Stage;
       TempPlanDataArray[Length(TempPlanDataArray) - 1]._Volume   :=
           LinkedPlanData[k]._Volume * Multiplicator;
      end
      else TempPlanDataArray[n]._Volume := TempPlanDataArray[n]._Volume
           + LinkedPlanData[k]._Volume * Multiplicator;
     end;
    end;

    if Bool2 then begin
     if  (LinkedFixedStages[t]._Date_Beg <= TempStagesArray[i]._Date_Beg)
     and (LinkedFixedStages[t]._Date_End >= TempStagesArray[i]._Date_End)
     then Multiplicator := (TempStagesArray[i]._Date_End - TempStagesArray[i]._Date_Beg)
                      /(LinkedFixedStages[t]._Date_End - LinkedFixedStages[t]._Date_Beg)

     else if  (LinkedFixedStages[t]._Date_Beg >= TempStagesArray[i]._Date_Beg)
          and (LinkedFixedStages[t]._Date_End <= TempStagesArray[i]._Date_End)
          then Multiplicator := 1

     else if  (LinkedFixedStages[t]._Date_Beg <= TempStagesArray[i]._Date_Beg)
          and (LinkedFixedStages[t]._Date_End <= TempStagesArray[i]._Date_End)
          and (LinkedFixedStages[t]._Date_End > TempStagesArray[i]._Date_Beg)
          then Multiplicator := (LinkedFixedStages[t]._Date_End - TempStagesArray[i]._Date_Beg)
                           /(LinkedFixedStages[t]._Date_Beg - LinkedFixedStages[t]._Date_End)

     else if  (LinkedFixedStages[t]._Date_Beg <= TempStagesArray[i]._Date_End)
          and (LinkedFixedStages[t]._Date_Beg > TempStagesArray[i]._Date_Beg)
          and (LinkedFixedStages[t]._Date_End > TempStagesArray[i]._Date_End)
          then Multiplicator := (TempStagesArray[i]._Date_End - LinkedFixedStages[t]._Date_Beg)
                           /(LinkedFixedStages[t]._Date_Beg - LinkedFixedStages[t]._Date_End);


     for k := 0 to Length(LinkedPlanData) - 1 do begin
      if LinkedPlanData[k]._id_Stage <> LinkedFixedStages[t]._id_Stage then Continue;

      Flag := True;
      for n := 0 to Length(TempPlanDataArray) - 1 do
       if  (TempPlanDataArray[n]._id_Stage = TempStagesArray[i]._id_Stage)
       and (TempPlanDataArray[n]._id_Product = LinkedPlanData[k]._id_Product) then begin
        if LinkedPlanData[k]._Need_Cat_Cust then begin
         if not TempPlanDataArray[n]._Need_Cat_Cust then Continue;

         if (LinkedPlanData[k]._id_Cat_Cust > 0)
         and (TempPlanDataArray[n]._id_Cat_Cust = LinkedPlanData[k]._id_Cat_Cust) then begin
          Flag := False;
          Break;
         end
         else if LinkedPlanData[k]._Need_Objects and (LinkedPlanData[k]._id_Object > 0)
              and (TempPlanDataArray[n]._id_Object = LinkedPlanData[k]._id_Object)
              and TempPlanDataArray[n]._Need_Objects then begin
               Flag := False;
               Break;
              end;
        end
        else if LinkedPlanData[k]._Need_Objects then begin
         if not TempPlanDataArray[n]._Need_Objects then Continue;

         if (LinkedPlanData[k]._id_Object > 0)
         and (TempPlanDataArray[n]._id_Object = LinkedPlanData[k]._id_Object)
         and TempPlanDataArray[n]._Need_Objects then begin
          Flag := False;
          Break;
         end;
        end
        else if not (TempPlanDataArray[n]._Need_Cat_Cust or TempPlanDataArray[n]._Need_Objects) then begin
         Flag := False;
         Break;
        end;
       end;

      if Flag then begin
       SetLength(TempPlanDataArray, Length(TempPlanDataArray) + 1);
       TempPlanDataArray[Length(TempPlanDataArray) - 1]           := LinkedPlanData[k];
       TempPlanDataArray[Length(TempPlanDataArray) - 1]._id_Stage := TempStagesArray[i]._id_Stage;
       TempPlanDataArray[Length(TempPlanDataArray) - 1]._Volume   :=
           LinkedPlanData[k]._Volume * Multiplicator;
      end
      else TempPlanDataArray[n]._Volume := TempPlanDataArray[n]._Volume
           + LinkedPlanData[k]._Volume * Multiplicator;
     end;
    end;
   end;
  end;

  if Bool1 then begin
   for t := 0 to Length(LinkedFixedStages) - 1 do begin
    if (LinkedFixedStages[t]._Date_Beg > TempFixedStages[f]._Date_End)
    or (LinkedFixedStages[t]._Date_End < TempFixedStages[f]._Date_Beg) then Continue;
    Bool2 := True;

    for j := 0 to Length(LinkedStagesArray) - 1 do begin
     if LinkedStagesArray[j]._Link_To <> LinkedFixedStages[t]._id_Stage then Continue;

     Bool2 := False;

     if  (LinkedStagesArray[j]._Date_Beg <= TempFixedStages[f]._Date_Beg)
     and (LinkedStagesArray[j]._Date_End >= TempFixedStages[f]._Date_End)
     then Multiplicator := (TempFixedStages[f]._Date_End - TempFixedStages[f]._Date_End)
                      /(LinkedStagesArray[j]._Date_Beg - LinkedStagesArray[j]._Date_End)

     else if  (LinkedStagesArray[j]._Date_Beg >= TempFixedStages[f]._Date_Beg)
          and (LinkedStagesArray[j]._Date_End <= TempFixedStages[f]._Date_End)
          then Multiplicator := 1

     else if  (LinkedStagesArray[j]._Date_Beg <= TempFixedStages[f]._Date_Beg)
          and (LinkedStagesArray[j]._Date_End <= TempFixedStages[f]._Date_End)
          and (LinkedStagesArray[j]._Date_End > TempFixedStages[f]._Date_Beg)
          then Multiplicator := (LinkedStagesArray[j]._Date_End - TempFixedStages[f]._Date_Beg)
                           /(LinkedStagesArray[j]._Date_Beg - LinkedStagesArray[j]._Date_End)

     else if  (LinkedStagesArray[j]._Date_Beg <= TempFixedStages[f]._Date_End)
          and (LinkedStagesArray[j]._Date_Beg > TempFixedStages[f]._Date_Beg)
          and (LinkedStagesArray[j]._Date_End > TempFixedStages[f]._Date_End)
          then Multiplicator := (TempFixedStages[f]._Date_End - LinkedStagesArray[j]._Date_Beg)
                           /(LinkedStagesArray[j]._Date_Beg - LinkedStagesArray[j]._Date_End);


     for k := 0 to Length(LinkedPlanData) - 1 do begin
      if LinkedPlanData[k]._id_Stage <> LinkedStagesArray[j]._id_Stage then Continue;

      Flag := True;
      for n := 0 to Length(TempPlanDataArray) - 1 do
       if  (TempPlanDataArray[n]._id_Stage = TempFixedStages[f]._id_Stage)
       and (TempPlanDataArray[n]._id_Product = LinkedPlanData[k]._id_Product) then begin
        if LinkedPlanData[k]._Need_Cat_Cust then begin
         if not TempPlanDataArray[n]._Need_Cat_Cust then Continue;

         if (LinkedPlanData[k]._id_Cat_Cust > 0)
         and (TempPlanDataArray[n]._id_Cat_Cust = LinkedPlanData[k]._id_Cat_Cust) then begin
          Flag := False;
          Break;
         end
         else if LinkedPlanData[k]._Need_Objects and (LinkedPlanData[k]._id_Object > 0)
              and (TempPlanDataArray[n]._id_Object = LinkedPlanData[k]._id_Object)
              and TempPlanDataArray[n]._Need_Objects then begin
               Flag := False;
               Break;
              end;
        end
        else if LinkedPlanData[k]._Need_Objects then begin
         if not TempPlanDataArray[n]._Need_Objects then Continue;

         if (LinkedPlanData[k]._id_Object > 0)
         and (TempPlanDataArray[n]._id_Object = LinkedPlanData[k]._id_Object)
         and TempPlanDataArray[n]._Need_Objects then begin
          Flag := False;
          Break;
         end;
        end
        else if not (TempPlanDataArray[n]._Need_Cat_Cust or TempPlanDataArray[n]._Need_Objects) then begin
         Flag := False;
         Break;
        end;
       end;

      if Flag then begin
       SetLength(TempPlanDataArray, Length(TempPlanDataArray) + 1);
       TempPlanDataArray[Length(TempPlanDataArray) - 1]           := LinkedPlanData[k];
       TempPlanDataArray[Length(TempPlanDataArray) - 1]._id_Stage := TempFixedStages[f]._id_Stage;
       TempPlanDataArray[Length(TempPlanDataArray) - 1]._Volume   :=
           LinkedPlanData[k]._Volume * Multiplicator;
      end
      else TempPlanDataArray[n]._Volume := TempPlanDataArray[n]._Volume
           + LinkedPlanData[k]._Volume * Multiplicator;
     end;
    end;

    if Bool2 then begin
     if  (LinkedFixedStages[t]._Date_Beg <= TempFixedStages[f]._Date_Beg)
     and (LinkedFixedStages[t]._Date_End >= TempFixedStages[f]._Date_End)
     then Multiplicator := (TempFixedStages[f]._Date_End - TempFixedStages[f]._Date_End)
                      /(LinkedFixedStages[t]._Date_Beg - LinkedFixedStages[t]._Date_End)

     else if  (LinkedFixedStages[t]._Date_Beg >= TempFixedStages[f]._Date_Beg)
          and (LinkedFixedStages[t]._Date_End <= TempFixedStages[f]._Date_End)
          then Multiplicator := 1

     else if  (LinkedFixedStages[t]._Date_Beg <= TempFixedStages[f]._Date_Beg)
          and (LinkedFixedStages[t]._Date_End <= TempFixedStages[f]._Date_End)
          and (LinkedFixedStages[t]._Date_End > TempFixedStages[f]._Date_Beg)
          then Multiplicator := (LinkedFixedStages[t]._Date_End - TempFixedStages[f]._Date_Beg)
                           /(LinkedFixedStages[t]._Date_Beg - LinkedFixedStages[t]._Date_End)

     else if  (LinkedFixedStages[t]._Date_Beg <= TempFixedStages[f]._Date_End)
          and (LinkedFixedStages[t]._Date_Beg > TempFixedStages[f]._Date_Beg)
          and (LinkedFixedStages[t]._Date_End > TempFixedStages[f]._Date_End)
          then Multiplicator := (TempFixedStages[f]._Date_End - LinkedFixedStages[t]._Date_Beg)
                           /(LinkedFixedStages[t]._Date_Beg - LinkedFixedStages[t]._Date_End);


     for k := 0 to Length(LinkedPlanData) - 1 do begin
      if LinkedPlanData[k]._id_Stage <> LinkedFixedStages[t]._id_Stage then Continue;

      Flag := True;
      for n := 0 to Length(TempPlanDataArray) - 1 do
       if  (TempPlanDataArray[n]._id_Stage = TempFixedStages[f]._id_Stage)
       and (TempPlanDataArray[n]._id_Product = LinkedPlanData[k]._id_Product) then begin
        if LinkedPlanData[k]._Need_Cat_Cust then begin
         if not TempPlanDataArray[n]._Need_Cat_Cust then Continue;

         if (LinkedPlanData[k]._id_Cat_Cust > 0)
         and (TempPlanDataArray[n]._id_Cat_Cust = LinkedPlanData[k]._id_Cat_Cust) then begin
          Flag := False;
          Break;
         end
         else if LinkedPlanData[k]._Need_Objects and (LinkedPlanData[k]._id_Object > 0)
              and (TempPlanDataArray[n]._id_Object = LinkedPlanData[k]._id_Object)
              and TempPlanDataArray[n]._Need_Objects then begin
               Flag := False;
               Break;
              end;
        end
        else if LinkedPlanData[k]._Need_Objects then begin
         if not TempPlanDataArray[n]._Need_Objects then Continue;

         if (LinkedPlanData[k]._id_Object > 0)
         and (TempPlanDataArray[n]._id_Object = LinkedPlanData[k]._id_Object)
         and TempPlanDataArray[n]._Need_Objects then begin
          Flag := False;
          Break;
         end;
        end
        else if not (TempPlanDataArray[n]._Need_Cat_Cust or TempPlanDataArray[n]._Need_Objects) then begin
         Flag := False;
         Break;
        end;
       end;

      if Flag then begin
       SetLength(TempPlanDataArray, Length(TempPlanDataArray) + 1);
       TempPlanDataArray[Length(TempPlanDataArray) - 1]           := LinkedPlanData[k];
       TempPlanDataArray[Length(TempPlanDataArray) - 1]._id_Stage := TempFixedStages[f]._id_Stage;
       TempPlanDataArray[Length(TempPlanDataArray) - 1]._Volume   :=
           LinkedPlanData[k]._Volume * Multiplicator;
      end
      else TempPlanDataArray[n]._Volume := TempPlanDataArray[n]._Volume
           + LinkedPlanData[k]._Volume * Multiplicator;
     end;
    end;
   end;
  end;
 end;
end;

procedure TPlanEditorForm.AddOnDerivedPlansClick(Sender: TObject);
{var
 i, j, k : integer;}
begin
//TODO 1 -oAndrew : 'What is this!'
 if not YearPlan then Exit;

 if (GridDoc.DataController.RecordCount = 2)
 and ((GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0] = '')
 or (GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0] = '-1'))
 then begin
  AddDocButton.Tag := 1;
  AddDocButtonClick(Sender);
  GetDerivedPlansData;
  FillProductTreeList(True, NewStagesArray, NewFixedStages, TempPlanDataArray, -1,
                      GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
 end
 else begin
  GetDerivedPlansData;
  FillOnlyData(NewStagesArray, NewFixedStages, TempPlanDataArray, -1);

{ for i := 0 to Length(TempPlanDataArray) - 1 do
  for j := 0 to Length(NewPlanDataArray) - 1 do
   if (NewPlanDataArray[j]._id_Stage = TempPlanDataArray[i]._id_Stage)
    and (NewPlanDataArray[j]._id_Product = TempPlanDataArray[i]._id_Product)
    and (NewPlanDataArray[j]._id_Cat_Cust = TempPlanDataArray[i]._id_Cat_Cust)
    and (NewPlanDataArray[j]._id_Object = TempPlanDataArray[i]._id_Object)
    then NewPlanDataArray[j]._Volume := TempPlanDataArray[i]._Volume;}

 end;

 TempStagesArray := Copy(NewStagesArray, 0, Length(NewStagesArray));

 TempPlanDataArray := Copy(NewPlanDataArray, 0, Length(NewPlanDataArray));

 CalcSumms(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
           GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
end;

procedure TPlanEditorForm.AddDocButtonClick(Sender: TObject);
var
 UseContracts : boolean;
begin
 if dt_Doc_Form_Add1 <> nil then Exit;

 dt_Doc_Form_Add1.Caption := 'Додавання нового документу';
 Application.CreateForm(Tdt_Doc_Form_Add1, dt_Doc_Form_Add1);

 if AddDocButton.Tag = 1 then begin
  dt_Doc_Form_Add1.RadioGroup.Enabled   := False;
  dt_Doc_Form_Add1.RadioGroup.ItemIndex := 0;
 end
 else dt_Doc_Form_Add1.RadioGroup.Enabled := True;

 if MainPlan then begin
  dt_Doc_Form_Add1.RadioGroup.ItemIndex  := 3;

  TcxRadioButton(dt_Doc_Form_Add1.RadioGroup.Components[3]).Enabled := True;
  TcxRadioButton(dt_Doc_Form_Add1.RadioGroup.Components[3]).Visible := True;

  TcxRadioButton(dt_Doc_Form_Add1.RadioGroup.Components[0]).Enabled := False;
  TcxRadioButton(dt_Doc_Form_Add1.RadioGroup.Components[1]).Enabled := False;
 end
 else begin
  if (YearPlan and NeedRefresh) then dt_Doc_Form_Add1.RadioGroup.ItemIndex  := 2;

//  TcxRadioButton(dt_Doc_Form_Add1.RadioGroup.Components[2]).Enabled := (YearPlan and NeedRefresh);
  TcxRadioButton(dt_Doc_Form_Add1.RadioGroup.Components[2]).Enabled := YearPlan;
  TcxRadioButton(dt_Doc_Form_Add1.RadioGroup.Components[3]).Visible := False;
  TcxRadioButton(dt_Doc_Form_Add1.RadioGroup.Components[3]).Enabled := False;
 end;

 if dt_Doc_Form_Add1.ShowModal <> mrOk then Exit;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 if dt_Doc_Form_Add1.RadioGroup.ItemIndex = 0 then AddDoc
 else if dt_Doc_Form_Add1.RadioGroup.ItemIndex = 1 then begin
  UseContracts := dt_Doc_Form_Add1.UseContracts.Checked;

  if (dt_Doc_Form_Add._id_Sel_Plan = id_Plan) and not dt_Doc_Form_Add1.NewCost.Checked then
   AddDocMore(dt_Doc_Form_Add._id_Sel_Doc)
  else begin
   AddDocButton.Tag := 1; // Don't add product after adding of doc

   if not AddDoc then Exit;

   AddOnExistingPlan(dt_Doc_Form_Add._id_Sel_Doc);
   if UseContracts then SetCDataBtnClick(Sender);
  end;
 end
 else if dt_Doc_Form_Add1.RadioGroup.ItemIndex = 2 then begin
  AddDocButton.Tag := 1;
  if AddDoc then begin
   GetDerivedPlansData;

   while ProductTreeList.ColumnCount > LAST_COL + 1 do
    ProductTreeList.Columns[ProductTreeList.ColumnCount - 1].Destroy;

   MakeTreeList(TempStagesArray, TempFixedStages, -1, ProductTreeList);

   FillProductTreeList(True, TempStagesArray, TempFixedStages, TempPlanDataArray, -1,
             GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);

  end
  else Exit;
 end
 else if dt_Doc_Form_Add1.RadioGroup.ItemIndex = 3 then begin
  AddDocButton.Tag := 1;
  if AddDoc then begin
   GetSummaryPlanData;
   SetCostBeg(TempFixedStages, TempStagesArray, TempPlanDataArray);
   if PageControl.ActivePageIndex = 0 then begin
    MakeTreeList(TempStagesArray, TempFixedStages, -1, DepTreeList);
    FillSummaryPlanByDeps(TempStagesArray, TempFixedStages, TempPlanDataArray, -1);

    AddSumNodeDep;
    FillSumNodeDep;
    CalcSummsDep(TempStagesArray, TempFixedStages, -1, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
   end
   else begin
    MakeTreeList(TempStagesArray, TempFixedStages, -1, ProductTreeList);

    FillSummaryPlanByProduct(TempStagesArray, TempFixedStages, TempPlanDataArray, -1);

    CalcSummsProd(TempStagesArray, TempFixedStages, -1, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
   end;

//   DepTreeList.Columns[10].SortOrder := soAscending;

   SortObjects_and_CatCust;
  end
  else Exit;
 end;
end;

procedure TPlanEditorForm.AddOnExistingPlan(id_Doc: integer);
var
 Fixed            : array of integer;
 Stages           : array of TStages;
 i, j, k          : integer;
 f                : integer;

 id_Product       : integer;
 Name_Product     : string;
 id_Unit_Meas     : integer;
 Name_Unit_Meas   : string;
 Coefficient      : integer;
 id_Cat_Cust      : integer;
 Name_Cat_Cust    : string;
 id_Object        : integer;
 Name_Object      : string;
 Need_Cat_Cust    : boolean;
 Need_Objects     : boolean;
 DispOrder_Prod   : integer;
 Display_Order    : integer;

 MAX_SUB_COUNT    : integer;

 Flag             : boolean;
 Bool             : boolean;

 SP_Result        : TSP_Result;

 TempStages       : TStagesArray;

 Node             : TcxTreeListNode;
 Child            : TcxTreeListNode;

 ProductCostArray : TProductCostArray;

 Last_Cost        : Currency;
 LastCost_Col     : integer;
begin
 if Length(TempFixedStages) = 0 then Exit;

 Fixed        := nil;
 Stages       := nil;
 ProductArray := nil;

// Selecting fixed stages

 Query.SQL.Text := 'select * from SP_DT_STAGE_SEL(' + IntToStr(id_Doc) + ', -1)';
 Query.ExecQuery;
 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;
 while not Query.Eof do begin
  SetLength(Fixed, Length(Fixed) + 1);

  Fixed[Length(Fixed) - 1] := Query['Id_Stage_Param'].AsInteger;

  Query.Next;
 end;
 Query.Close;

// Selecting not-fixed stages

 for f := 0 to Length(Fixed) - 1 do begin
  Query.SQL.Text := 'select * from SP_DT_STAGE_SEL(' + IntToStr(id_Doc) + ','
  + IntToStr(Fixed[f]) + ')';
  Query.ExecQuery;
  if Query.RecordCount = 0 then begin
   Query.Close;
   Continue;
  end;
  while not Query.Eof do begin
   SetLength(Stages, Length(Stages) + 1);

   with Stages[Length(Stages) - 1] do begin
    _Link_To  := Fixed[f];
    _id_Stage := Query['Id_Stage_Param'].AsInteger;
   end;

   Query.Next;
  end;
  Query.Close;
 end;

// Slelcting the data

 for f := 0 to Length(Fixed) - 1 do begin
  Bool := True;

  for i := 0 to Length(Stages) - 1 do begin
   if Fixed[f] <> Stages[i]._Link_To then Continue;

   Query.sql.Text := 'select * from SP_DT_PLAN_DATA_SEL(' + IntToStr(Stages[i]._id_Stage)
   + ', ' + #39 + DateTimeToStr(SYS_MAX_TIMESTAMP) + #39 + ')';
   Query.ExecQuery;
   if Query.RecordCount = 0 then begin
    Query.Close;
    Continue;
//    Exit;
   end;

   while not Query.Eof do begin
    id_Product     := Query['ID_PRODUCT'].AsInteger;
    Name_Product   := Query['Name_Product'].AsString;
    id_Unit_Meas   := Query['id_Unit_Meas'].AsInteger;
    Name_Unit_Meas := Query['Name_Unit_Meas'].AsString;
    Coefficient    := Query['Coefficient'].AsInteger;
    id_Cat_Cust    := Query['ID_CAT_CUST'].AsInteger;
    Name_Cat_Cust  := Query['Name_Cat_Cust'].AsString;
    id_Object      := Query['ID_OBJECT'].AsInteger;
    Name_Object    := Query['Name_Object'].AsString;
    Need_Cat_Cust  := (Query['NEED_CAT_CUST'].AsInteger = 1);
    Need_Objects   := (Query['NEED_OBJECTS'].AsInteger = 1);
    DispOrder_Prod := Query['DISPLAY_ORDER_PROD'].AsInteger;
    Display_Order  := Query['DISPLAY_ORDER'].AsInteger;

    Flag := True;
    for j := 0 to Length(ProductArray) - 1 do
     if (ProductArray[j]._id_Product = id_Product)
     and (ProductArray[j]._id_Cat_Cust = id_Cat_Cust)
     and (ProductArray[j]._id_Object = id_Object) then begin
      Flag := False;
      Break;
     end;

    if Flag then begin
     SetLength(ProductArray, Length(ProductArray) + 1);
     ProductArray[Length(ProductArray) - 1]._id_Product     := id_Product;
     ProductArray[Length(ProductArray) - 1]._Name_Product   := Name_Product;
     ProductArray[Length(ProductArray) - 1]._id_Cat_Cust    := id_Cat_Cust;
     ProductArray[Length(ProductArray) - 1]._Name_Cat_Cust  := Name_Cat_Cust;
     ProductArray[Length(ProductArray) - 1]._id_Object      := id_Object;
     ProductArray[Length(ProductArray) - 1]._Name_Object    := Name_Object;
     ProductArray[Length(ProductArray) - 1]._id_Unit_Meas   := id_Unit_Meas;
     ProductArray[Length(ProductArray) - 1]._Name_Unit_Meas := Name_Unit_Meas;
     ProductArray[Length(ProductArray) - 1]._Coefficient    := Coefficient;
     ProductArray[Length(ProductArray) - 1]._Need_Cat_Cust  := Need_Cat_Cust;
     ProductArray[Length(ProductArray) - 1]._Need_Objects   := Need_Objects;
     ProductArray[Length(ProductArray) - 1]._DispOrder_Prod := DispOrder_Prod;
     ProductArray[Length(ProductArray) - 1]._Display_Order  := Display_Order;
    end;

    Query.Next;
   end;

   if not VarIsNull(Query['MAX_SUB_COUNT'].AsVariant) then
    if MAX_SUB_COUNT < Query['MAX_SUB_COUNT'].AsInteger then MAX_SUB_COUNT := Query['MAX_SUB_COUNT'].AsInteger;

   Query.Close;
  end;

  if Bool then Begin
   Query.sql.Text := 'select * from SP_DT_PLAN_DATA_SEL(' + IntToStr(Fixed[f])
   + ', ' + #39 + DateTimeToStr(SYS_MAX_TIMESTAMP) + #39 + ')';
   Query.ExecQuery;
   if Query.RecordCount = 0 then begin
    Query.Close;
    Continue;
//    Exit;
   end;

   while not Query.Eof do begin
    id_Product     := Query['ID_PRODUCT'].AsInteger;
    Name_Product   := Query['Name_Product'].AsString;
    id_Unit_Meas   := Query['id_Unit_Meas'].AsInteger;
    Name_Unit_Meas := Query['Name_Unit_Meas'].AsString;
    Coefficient    := Query['Coefficient'].AsInteger;
    id_Cat_Cust    := Query['ID_CAT_CUST'].AsInteger;
    Name_Cat_Cust  := Query['Name_Cat_Cust'].AsString;
    id_Object      := Query['ID_OBJECT'].AsInteger;
    Name_Object    := Query['Name_Object'].AsString;
    Need_Cat_Cust  := (Query['NEED_CAT_CUST'].AsInteger = 1);
    Need_Objects   := (Query['NEED_OBJECTS'].AsInteger = 1);
    DispOrder_Prod := Query['DISPLAY_ORDER_PROD'].AsInteger;
    Display_Order  := Query['DISPLAY_ORDER'].AsInteger;

    Flag := True;
    for j := 0 to Length(ProductArray) - 1 do
     if (ProductArray[j]._id_Product = id_Product)
     and (ProductArray[j]._id_Cat_Cust = id_Cat_Cust)
     and (ProductArray[j]._id_Object = id_Object) then begin
      Flag := False;
      Break;
     end;

    if Flag then begin
     SetLength(ProductArray, Length(ProductArray) + 1);
     ProductArray[Length(ProductArray) - 1]._id_Product     := id_Product;
     ProductArray[Length(ProductArray) - 1]._Name_Product   := Name_Product;
     ProductArray[Length(ProductArray) - 1]._id_Cat_Cust    := id_Cat_Cust;
     ProductArray[Length(ProductArray) - 1]._Name_Cat_Cust  := Name_Cat_Cust;
     ProductArray[Length(ProductArray) - 1]._id_Object      := id_Object;
     ProductArray[Length(ProductArray) - 1]._Name_Object    := Name_Object;
     ProductArray[Length(ProductArray) - 1]._id_Unit_Meas   := id_Unit_Meas;
     ProductArray[Length(ProductArray) - 1]._Name_Unit_Meas := Name_Unit_Meas;
     ProductArray[Length(ProductArray) - 1]._Coefficient    := Coefficient;
     ProductArray[Length(ProductArray) - 1]._Need_Cat_Cust  := Need_Cat_Cust;
     ProductArray[Length(ProductArray) - 1]._Need_Objects   := Need_Objects;
     ProductArray[Length(ProductArray) - 1]._DispOrder_Prod := DispOrder_Prod;
     ProductArray[Length(ProductArray) - 1]._Display_Order  := Display_Order;
    end;

    Query.Next;
   end;

   if not VarIsNull(Query['MAX_SUB_COUNT'].AsVariant) then
    if MAX_SUB_COUNT < Query['MAX_SUB_COUNT'].AsInteger then MAX_SUB_COUNT := Query['MAX_SUB_COUNT'].AsInteger;   

   Query.Close;
  end;
 end;

 ProductCostArray := nil;

 while ProductTreeList.ColumnCount > LAST_COL + 1 do
  ProductTreeList.Columns[ProductTreeList.ColumnCount - 1].Destroy;

// Adding nodes and stages deviding

 ProductTreeList.BeginUpdate;

 for i := 0 to Length(ProductArray) - 1 do begin
//  Last_Cost := -1;

  ProductArray[i]._DispOrder_Prod := Order_Level(ProductArray[i]._DispOrder_Prod, MAX_SUB_COUNT);

  if (ProductArray[i]._id_Cat_Cust > 0)    // If not Object
  or ((ProductArray[i]._id_Cat_Cust <= 0) and (ProductArray[i]._id_Object <= 0))
  then begin
   Query.SQL.Text := 'select * from PL_DT_COST_PRODUCT_SEL_COST(' 
   + QuotedStr(DateToStr(Plan_Date_Beg)) + ',' + QuotedStr(DateToStr(Plan_Date_End))
   + ',' + IntToStr(ProductArray[i]._id_Product) + ',' + IntToStr(ProductArray[i]._id_Cat_Cust) + ')';

   Query.ExecQuery;

   if Query.RecordCount = 0 then begin
    ShowMessage('Неможна додати категорію споживачів, ' + ProductArray[i]._Name_Cat_Cust
    + ' для продукції ' + ProductArray[i]._Name_Product + ', тому що для неї у '
    + 'довіднику тарифів та прейскурантів не вказана ціна!');
    Query.Close;
    Continue;
   end;

   SP_Result := nil;

   while not Query.Eof do begin
    if Query.Fields[0].AsString = '' then begin
     Query.Next;
     Continue;
    end;

    SetLength(SP_Result, Length(SP_Result) + 1);
    with SP_Result[Length(SP_Result) - 1] do begin
     _Cost     := Query.Fields[0].AsCurrency;
     _Date_Beg := Query.Fields[1].AsDate;
     _Date_End := Query.Fields[2].AsDate;
    end;

    Query.Next;
   end;

   Query.Close;
  end;

  TempStages := nil;
  TempStages := Copy(TempStagesArray, 0, Length(TempStagesArray));

  Analyze_SP_Result(SP_Result, Plan_Date_Beg, Plan_Date_End);
  StagesDeviding(TempStagesArray, SP_Result);

  // Adding of node

  if ProductArray[i]._Need_Cat_Cust then begin
   if ProductArray[i]._id_Cat_Cust > 0 then begin
    Flag := True;
    for j := 0 to ProductTreeList.Count - 1 do
     if ProductTreeList.Items[j].Values[0] = ProductArray[i]._id_Product then begin
      Flag := False;
      Break;
     end;

    if Flag then begin
     Node           := ProductTreeList.Add;
     Node.Values[0] := ProductArray[i]._id_Product;
     Node.Values[1] := ProductArray[i]._Name_Product;
     Node.Values[2] := 0;
     Node.Values[3] := 0;
     Node.Values[4] := ProductArray[i]._Name_Unit_Meas;
     Node.Values[5] := ProductArray[i]._Need_Cat_Cust;
     Node.Values[6] := ProductArray[i]._Need_Objects;
     Node.Values[7] := ProductArray[i]._id_Unit_Meas;
     Node.Values[8] := ProductArray[i]._Coefficient;
     Node.Values[10] := ProductArray[i]._DispOrder_Prod;
    end
    else Node := ProductTreeList.Items[j];

    Child := Node.AddChild;
    Child.Values[0] := 0;
    Child.Values[1] := ProductArray[i]._Name_Cat_Cust;
    Child.Values[2] := ProductArray[i]._id_Cat_Cust;
    Child.Values[3] := 0;
    Child.Values[10] := ProductArray[i]._Display_Order;

    Child.Focused := True;
   end
   else if ProductArray[i]._id_Object > 0 then begin
    Flag := True;
    for j := 0 to ProductTreeList.Count - 1 do
     if ProductTreeList.Items[j].Values[0] = ProductArray[i]._id_Product then begin
      Flag := False;
      Break;
     end;

    if Flag then begin
     Node           := ProductTreeList.Add;
     Node.Values[0] := ProductArray[i]._id_Product;
     Node.Values[1] := ProductArray[i]._Name_Product;
     Node.Values[2] := 0;
     Node.Values[3] := 0;
     Node.Values[4] := ProductArray[i]._Name_Unit_Meas;
     Node.Values[5] := ProductArray[i]._Need_Cat_Cust;
     Node.Values[6] := ProductArray[i]._Need_Objects;
     Node.Values[7] := ProductArray[i]._id_Unit_Meas;
     Node.Values[8] := ProductArray[i]._Coefficient;
     Node.Values[10] := ProductArray[i]._DispOrder_Prod;
    end
    else Node := ProductTreeList.Items[j];

    Child := Node.AddChild;
    Child.Values[0] := 0;
    Child.Values[1] := AddSpaces(ProductArray[i]._Name_Object);
    Child.Values[2] := 0;
    Child.Values[3] := ProductArray[i]._id_Object;
    Child.Values[10] := ProductArray[i]._Display_Order;

    Child.Focused := True;
   end;
  end
  else begin
   Node           := ProductTreeList.Add;
   Node.Values[0] := ProductArray[i]._id_Product;
   Node.Values[1] := ProductArray[i]._Name_Product;
   Node.Values[2] := 0;
   Node.Values[3] := 0;
   Node.Values[4] := ProductArray[i]._Name_Unit_Meas;
   Node.Values[5] := ProductArray[i]._Need_Cat_Cust;
   Node.Values[6] := ProductArray[i]._Need_Objects;
   Node.Values[7] := ProductArray[i]._id_Unit_Meas;
   Node.Values[8] := ProductArray[i]._Coefficient;
   Node.Values[10] := ProductArray[i]._DispOrder_Prod;

   Node.Focused := True;
  end;

  for f := 0 to Length(TempFixedStages) - 1 do begin
   Bool := True;

   for k := 0 to Length(TempStagesArray) - 1 do begin
    if TempStagesArray[k]._Link_To <> TempFixedStages[f]._id_Stage then Continue;

    Bool := False;

    if TempStagesArray[k]._isItCostBeg then begin
     Flag := False;

     for j := 0 to Length(SP_Result) - 1 do
      if (TempStagesArray[k]._Date_Beg >= SP_Result[j]._Date_Beg)
      and (TempStagesArray[k]._Date_End <= SP_Result[j]._Date_End)
      then begin
//       if SP_Result[j]._Cost = Last_Cost then Continue;
//       Last_Cost := SP_Result[j]._Cost;
       Flag := True;
       Break;
      end;

     if not Flag then Continue;

     SetLength(ProductCostArray, Length(ProductCostArray) + 1);
     with ProductCostArray[Length(ProductCostArray) - 1] do begin
      _id_Product  := ProductArray[i]._id_Product;
      _id_Cat_Cust := ProductArray[i]._id_Cat_Cust;
      _id_Stage    := TempStagesArray[k]._id_Stage;
      _Cost        := SP_Result[j]._Cost;
     end;
    end;
   end;

   if Bool then begin
    if TempFixedStages[f]._isItCostBeg then begin
     Flag := False;

     for j := 0 to Length(SP_Result) - 1 do
      if (TempFixedStages[f]._Date_Beg >= SP_Result[j]._Date_Beg)
      and (TempFixedStages[f]._Date_End <= SP_Result[j]._Date_End)
      then begin
//       if SP_Result[j]._Cost = Last_Cost then Continue;
//       Last_Cost := SP_Result[j]._Cost;
       Flag := True;
       Break;
      end;

     if not Flag then Continue;

     SetLength(ProductCostArray, Length(ProductCostArray) + 1);
     with ProductCostArray[Length(ProductCostArray) - 1] do begin
      _id_Product  := ProductArray[i]._id_Product;
      _id_Cat_Cust := ProductArray[i]._id_Cat_Cust;
      _id_Stage    := TempFixedStages[f]._id_Stage;
      _Cost        := SP_Result[j]._Cost;
     end;
    end;
   end;
  end;
 end;

 MakeTreeList(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.RecordCount - 1, 0], ProductTreeList);

 ProductTreeList.FullExpand;

 Flag := True;
 for k := 0 to ProductTreeList.Count - 1 do
  if ProductTreeList.Items[k].Values[0] = -2 then begin
   Flag := False;
   Break;
  end;

 if Flag then begin
  Node := ProductTreeList.Add;
  Node.Values[0] := -2;
  Node.Values[1] := 'Разом по підприємству';
 end;

 for i := 0 to ProductTreeList.Count - 1 do begin
  if ProductTreeList.Items[i].Values[0] < -1 then Continue;
  if ProductTreeList.Items[i].Values[5] then begin
   for j := 0 to ProductTreeList.Items[i].Count - 1 do begin
    if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;
    if ProductTreeList.Items[i].Items[j].Values[3] > 0 then Continue;

    Last_Cost    := 0;
    LastCost_Col := 0;

    for k := 0 to Length(ProductCostArray) - 1 do
     if  (ProductTreeList.Items[i].Values[0] = ProductCostArray[k]._id_Product)
     and (ProductTreeList.Items[i].Items[j].Values[2] = ProductCostArray[k]._id_Cat_Cust)
     then begin
      if ProductTreeList.ColumnByName('PriceCol_' + IntToStr(ProductCostArray[k]._id_Stage)) = nil then Continue;

      ProductTreeList.Items[i].Items[j].Values[ProductTreeList.ColumnByName('PriceCol_'
      + IntToStr(ProductCostArray[k]._id_Stage)).ItemIndex] := ProductCostArray[k]._Cost;

      Last_Cost    := ProductCostArray[k]._Cost;
      LastCost_Col := ProductTreeList.ColumnByName('PriceCol_'
                    + IntToStr(ProductCostArray[k]._id_Stage)).ItemIndex;
     end;

    for k := LastCost_Col + 1 to ProductTreeList.ColumnCount - 1 do
     if Copy(ProductTreeList.Columns[k].Name, 0, 6) = 'PriceC' then
      ProductTreeList.Items[i].Items[j].Values[k] := Last_Cost;

   end;
  end
  else begin
   Last_Cost    := 0;
   LastCost_Col := -1;

   for k := 0 to Length(ProductCostArray) - 1 do
    if  (ProductTreeList.Items[i].Values[0] = ProductCostArray[k]._id_Product)
    then begin
     if ProductTreeList.ColumnByName('PriceCol_' + IntToStr(ProductCostArray[k]._id_Stage)) = nil then Continue;

     ProductTreeList.Items[i].Values[ProductTreeList.ColumnByName('PriceCol_'
     + IntToStr(ProductCostArray[k]._id_Stage)).ItemIndex] := ProductCostArray[k]._Cost;

     Last_Cost    := ProductCostArray[k]._Cost;
     LastCost_Col := ProductTreeList.ColumnByName('PriceCol_'
                   + IntToStr(ProductCostArray[k]._id_Stage)).ItemIndex;
    end;

    for k := LastCost_Col + 1 to ProductTreeList.ColumnCount - 1 do
     if Copy(ProductTreeList.Columns[k].Name, 0, 6) = 'PriceC' then
      ProductTreeList.Items[i].Values[k] := Last_Cost;
  end;
 end;

 ProductTreeList.EndUpdate;

 SortObjects_and_CatCust;
 CalcSumms(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
           GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
end;

procedure TPlanEditorForm.NewCostCalcButtonClick(Sender: TObject);
begin
// Coming soon or never :(
end;

procedure TPlanEditorForm.ProductTreeListClick(Sender: TObject);
begin
{ if ProductTreeList.FocusedColumn = nil then Exit;
 text := IntToStr(ProductTreeList.FocusedColumn.Position.ColIndex) + ' - '
 + IntToStr(ProductTreeList.FocusedColumn.VisibleIndex) + ' - '
 + IntToStr(ProductTreeList.FocusedColumn.ItemIndex);}

// Text := IntToStr(ProductTreeList.FocusedColumn.VisibleIndexAtBand);

{
 if ProductTreeList.FocusedColumn = nil then Exit;
 Text := ProductTreeList.FocusedColumn.Name + ',' + IntToStr(ProductTreeList.FocusedColumn.Width);
}
end;


procedure TPlanEditorForm.FillWithNewCost(Fixed, Stages: TStagesArray;
  PlanData: TPlanDataArray);
//var
// i , j : integer;
begin
 {SavePlanData(Stages, Fixed, SAVE_TO_TEMP);

 ProductTreeList.ClearNodes;
 while ProductTreeList.ColumnCount > LAST_COL + 1 do
  ProductTreeList.Columns[ProductTreeList.ColumnCount - 1].Destroy;


 for i := 0 to Length(Fixed) - 1 do begin
  for j := 0 to Length(Stages) - 1 do begin
   if Stages[j]._Link_To <> Fixed[i]._id_Stage then Continue;


  end;
 end;}
end;

procedure TPlanEditorForm.ExportButtonClick(Sender: TObject);
begin
 ExcelButtonClick(Sender);
end;

procedure TPlanEditorForm.TotalObjectsClick(Sender: TObject);
var
 id_Doc : integer;
begin
 SortObjects_and_CatCust;
 if TotalObjects.Down then begin
  id_Doc := GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0];

  if ProductTreeList.OptionsData.Editing then
   CalcSumms(TempStagesArray, TempFixedStages, id_Doc, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])
  else if id_Doc < 0 then
   CalcSumms(NewStagesArray, NewFixedStages, id_Doc, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])
  else CalcSumms(StagesArray, FixedStages, id_Doc, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])

 end;
end;

procedure TPlanEditorForm.PrintDateClick(Sender: TObject);
begin
 PrintDate.Down := not(PrintDate.Down);
end;

procedure TPlanEditorForm.NaturalPrintClick(Sender: TObject);
begin
 if MainPlan then CostPrint.Down   := not CostPrint.Down;
end;

procedure TPlanEditorForm.CostPrintClick(Sender: TObject);
begin
 if MainPlan then NaturalPrint.Down := not NaturalPrint.Down;
end;

procedure TPlanEditorForm.SpinEditQChange(Sender: TObject);
begin
 if GridDoc.DataController.FocusedRecordIndex < 0 then Exit;

 if SpinEditQ.CurValue > 6 then SpinEditQ.CurValue := 6;
 SpinEditQ.Value := SpinEditQ.CurValue;

 RoundCountQ := SpinEditQ.IntValue;
end;

procedure TPlanEditorForm.SpinEditCChange(Sender: TObject);
var
 id_Doc : integer;
begin
 if GridDoc.DataController.FocusedRecordIndex < 0 then Exit;

 if SpinEditC.CurValue > 6 then SpinEditC.CurValue := 6;
 SpinEditC.Value := SpinEditC.CurValue;

 RoundCountC := SpinEditC.IntValue;

 id_Doc     := GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0];

 if PageControl.ActivePageIndex = 0 then begin
  if DepTreeList.Count = 0 then Exit;

  if DepTreeList.OptionsData.Editing then
   CalcSummsDep(TempStagesArray, TempFixedStages, id_Doc, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])
  else if id_Doc < 0 then
   CalcSummsDep(NewStagesArray, NewFixedStages, id_Doc, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])
  else
   CalcSummsDep(StagesArray, FixedStages, id_Doc, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])
 end
 else if PageControl.ActivePageIndex = 1 then
  if ProductTreeList.Count = 0 then Exit;

  if MainPlan then begin
   if ProductTreeList.OptionsData.Editing then
    CalcSummsProd(TempStagesArray, TempFixedStages, id_Doc, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])
   else if id_Doc < 0 then
    CalcSummsProd(NewStagesArray, NewFixedStages, id_Doc, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])
   else
    CalcSummsProd(StagesArray, FixedStages, id_Doc, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])
  end
  else begin
   if ProductTreeList.OptionsData.Editing then
    CalcSumms(TempStagesArray, TempFixedStages, id_Doc, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])
   else if id_Doc < 0 then
    CalcSumms(NewStagesArray, NewFixedStages, id_Doc, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])
   else
    CalcSumms(StagesArray, FixedStages, id_Doc, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])
  end;
end;

procedure TPlanEditorForm.SpinEditCKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9']) then Key := #0;
end;

procedure TPlanEditorForm.DepStagesDeviding(OldFixed, Fixed, OldStages,
          Stages: TStagesArray; DocArray : TIntArray);
var
 i, j, t, f, d : integer;

 Bool1         : boolean;
 Bool2         : boolean;

 TempArray1    : TStagesArray;
 TempArray2    : TStagesArray;

 id_Doc        : integer;

 AutoInc       : integer;
begin
 TempArray1 := nil;
 TempArray2 := nil;
 AutoInc    := 0;

 TempArray1 := Copy(OldStages, 0, Length(OldStages));

 for d := 0 to Length(DocArray) - 1 do begin
  id_Doc := DocArray[d];

  for f := 0 to Length(OldFixed) - 1 do begin
   for i := 0 to Length(Fixed) - 1 do begin
    if (Fixed[i]._Date_Beg > OldFixed[f]._Date_End)
    or (Fixed[i]._Date_End < OldFixed[f]._Date_Beg) then Continue;

    if Fixed[i]._id_Doc <> id_Doc then Continue;

    Bool1 := True;
    for j := 0 to Length(TempArray1) - 1 do begin
     if TempArray1[j]._Link_To <> OldFixed[f]._id_Stage then Continue;
     Bool1 := False;

     Bool2 := True;
     for t := 0 to Length(Stages) - 1 do begin
      if Stages[t]._id_Doc <> id_Doc then Continue;
      if Stages[t]._Link_To <> Fixed[i]._id_Stage then Continue;

      Bool2 := False;

      if (Stages[t]._Date_Beg > TempArray1[j]._Date_End)
      or (Stages[t]._Date_End < TempArray1[j]._Date_Beg) then Continue;
      //----- (0<->1)---------

{0,1} if  (Stages[t]._Date_Beg <= TempArray1[j]._Date_Beg)
      and (Stages[t]._Date_End >= TempArray1[j]._Date_End) then Break;

{0,0} if  (Stages[t]._Date_Beg < TempArray1[j]._Date_Beg)
      and (Stages[t]._Date_End < TempArray1[j]._Date_End)
      and (Stages[t]._Date_End > TempArray1[j]._Date_Beg) then begin
       SetLength(TempArray2, Length(TempArray2) + 1);

       with TempArray2[Length(TempArray2) - 1] do begin
        _Link_To  := OldFixed[f]._id_Stage;
        _Modified := '';
        _id_Doc   := -1;

        Inc(AutoInc);

        _id_Stage := AutoInc;
        _Date_Beg := TempArray1[j]._Date_Beg;
        _Date_End := Stages[t]._Date_End;
       end;
      end;

{1,0} if  (Stages[t]._Date_Beg > TempArray1[j]._Date_Beg)
      and (Stages[t]._Date_End < TempArray1[j]._Date_End) then begin
       SetLength(TempArray2, Length(TempArray2) + 1);

       with TempArray2[Length(TempArray2) - 1] do begin
        _Link_To  := OldFixed[f]._id_Stage;
        _Modified := '';
        _id_Doc   := -1;

        Inc(AutoInc);

        _id_Stage := AutoInc;
        _Date_Beg := Stages[t]._Date_Beg;
        _Date_End := Stages[t]._Date_End;
       end;
      end;

{1,1} if  (Stages[t]._Date_Beg > TempArray1[j]._Date_Beg)
      and (Stages[t]._Date_Beg < TempArray1[j]._Date_End)
      and (Stages[t]._Date_End > TempArray1[j]._Date_End) then begin
       SetLength(TempArray2, Length(TempArray2) + 1);

       with TempArray2[Length(TempArray2) - 1] do begin
        _Link_To  := OldFixed[f]._id_Stage;
        _Modified := '';
        _id_Doc   := -1;

        Inc(AutoInc);

        _id_Stage := AutoInc;
        _Date_Beg := Stages[t]._Date_Beg;
        _Date_End := TempArray1[j]._Date_End;
       end;
      end;

{CheckEnd}
      if Stages[t]._Date_End >= TempArray1[j]._Date_End then Break;
     end;

    //--------------------------------------------------------------------------

     if Bool2 then begin
      if (Fixed[i]._Date_Beg > TempArray1[j]._Date_End)
      or (Fixed[i]._Date_End < TempArray1[j]._Date_Beg) then Continue;
      //----- (0<->1)---------

{0,1} if  (Fixed[i]._Date_Beg <= TempArray1[j]._Date_Beg)
      and (Fixed[i]._Date_End >= TempArray1[j]._Date_End) then Break;

{0,0} if  (Fixed[i]._Date_Beg < TempArray1[j]._Date_Beg)
      and (Fixed[i]._Date_End < TempArray1[j]._Date_End)
      and (Fixed[i]._Date_End > TempArray1[j]._Date_Beg) then begin
       SetLength(TempArray2, Length(TempArray2) + 1);

       with TempArray2[Length(TempArray2) - 1] do begin
        _Link_To  := OldFixed[f]._id_Stage;
        _Modified := '';
        _id_Doc   := -1;

        Inc(AutoInc);

        _id_Stage := AutoInc;
        _Date_Beg := TempArray1[j]._Date_Beg;
        _Date_End := Fixed[i]._Date_End;
       end;
      end;

{1,0} if  (Fixed[i]._Date_Beg > TempArray1[j]._Date_Beg)
      and (Fixed[i]._Date_End < TempArray1[j]._Date_End) then begin
       SetLength(TempArray2, Length(TempArray2) + 1);

       with TempArray2[Length(TempArray2) - 1] do begin
        _Link_To  := OldFixed[f]._id_Stage;
        _Modified := '';
        _id_Doc   := -1;

        Inc(AutoInc);

        _id_Stage := AutoInc;
        _Date_Beg := Fixed[i]._Date_Beg;
        _Date_End := Fixed[i]._Date_End;
       end;
      end;

{1,1} if  (Fixed[i]._Date_Beg > TempArray1[j]._Date_Beg)
      and (Fixed[i]._Date_Beg < TempArray1[j]._Date_End)
      and (Fixed[i]._Date_End > TempArray1[j]._Date_End) then begin
       SetLength(TempArray2, Length(TempArray2) + 1);

       with TempArray2[Length(TempArray2) - 1] do begin
        _Link_To  := OldFixed[f]._id_Stage;
        _Modified := '';
        _id_Doc   := -1;

        Inc(AutoInc);

        _id_Stage := AutoInc;
        _Date_Beg := Fixed[i]._Date_Beg;
        _Date_End := TempArray1[j]._Date_End;
       end;
      end;

{CheckEnd}
      if Fixed[i]._Date_End >= TempArray1[j]._Date_End then Break;
     end;
    end;

   //--------------------------------------------------------------------------

    if Bool1 then begin
     Bool2 := True;
     for t := 0 to Length(Stages) - 1 do begin
      if Stages[t]._id_Doc <> id_Doc then Continue;
      if Stages[t]._Link_To <> Fixed[i]._id_Stage then Continue;

      Bool2 := False;

      if (Stages[t]._Date_Beg > OldFixed[f]._Date_End)
      or (Stages[t]._Date_End < OldFixed[f]._Date_Beg) then Continue;
      //----- (0<->1)---------

{0,1} if  (Stages[t]._Date_Beg <= OldFixed[f]._Date_Beg)
      and (Stages[t]._Date_End >= OldFixed[f]._Date_End) then Break;

{0,0} if  (Stages[t]._Date_Beg <= OldFixed[f]._Date_Beg)
      and (Stages[t]._Date_End <  OldFixed[f]._Date_End)
      and (Stages[t]._Date_End >  OldFixed[f]._Date_Beg) then begin
       SetLength(TempArray2, Length(TempArray2) + 1);

       with TempArray2[Length(TempArray2) - 1] do begin
        _Link_To  := OldFixed[f]._id_Stage;
        _Modified := '';
        _id_Doc   := -1;

        Inc(AutoInc);

        _id_Stage := AutoInc;
        _Date_Beg := OldFixed[f]._Date_Beg;
        _Date_End := Stages[t]._Date_End;
       end;
      end;

{1,0} if  (Stages[t]._Date_Beg > OldFixed[f]._Date_Beg)
      and (Stages[t]._Date_End < OldFixed[f]._Date_End) then begin
       SetLength(TempArray2, Length(TempArray2) + 1);

       with TempArray2[Length(TempArray2) - 1] do begin
        _Link_To  := OldFixed[f]._id_Stage;
        _Modified := '';
        _id_Doc   := -1;

        Inc(AutoInc);

        _id_Stage := AutoInc;
        _Date_Beg := Stages[t]._Date_Beg;
        _Date_End := Stages[t]._Date_End;
       end;
      end;

{1,1} if  (Stages[t]._Date_Beg > OldFixed[f]._Date_Beg)
      and (Stages[t]._Date_Beg < OldFixed[f]._Date_End)
      and (Stages[t]._Date_End >= OldFixed[f]._Date_End) then begin
       SetLength(TempArray2, Length(TempArray2) + 1);

       with TempArray2[Length(TempArray2) - 1] do begin
        _Link_To  := OldFixed[f]._id_Stage;
        _Modified := '';
        _id_Doc   := -1;

        Inc(AutoInc);

        _id_Stage := AutoInc;
        _Date_Beg := Stages[t]._Date_Beg;
        _Date_End := OldFixed[f]._Date_End;
       end;
      end;

{CheckEnd}
      if Stages[t]._Date_End >= OldFixed[f]._Date_End then Break;
     end;

     if Bool2 then begin
      if (Fixed[i]._Date_Beg > OldFixed[f]._Date_End)
      or (Fixed[i]._Date_End < OldFixed[f]._Date_Beg) then Continue;
      //----- (0<->1)---------

  {0,1}if  (Fixed[i]._Date_Beg <= OldFixed[f]._Date_Beg)
      and (Fixed[i]._Date_End >= OldFixed[f]._Date_End) then Break;

  {0,0}if  (Fixed[i]._Date_Beg < OldFixed[f]._Date_Beg)
      and (Fixed[i]._Date_End < OldFixed[f]._Date_End)
      and (Fixed[i]._Date_End > OldFixed[f]._Date_Beg) then begin
       SetLength(TempArray2, Length(TempArray2) + 1);

       with TempArray2[Length(TempArray2) - 1] do begin
        _Link_To  := OldFixed[f]._id_Stage;
        _Modified := '';
        _id_Doc   := -1;

        Inc(AutoInc);

        _id_Stage := AutoInc;
        _Date_Beg := OldFixed[f]._Date_Beg;
        _Date_End := Fixed[i]._Date_End;
       end;
      end;

  {1,0}if  (Fixed[i]._Date_Beg > OldFixed[f]._Date_Beg)
      and (Fixed[i]._Date_End < OldFixed[f]._Date_End) then begin
       SetLength(TempArray2, Length(TempArray2) + 1);

       with TempArray2[Length(TempArray2) - 1] do begin
        _Link_To  := OldFixed[f]._id_Stage;
        _Modified := '';
        _id_Doc   := -1;

        Inc(AutoInc);

        _id_Stage := AutoInc;
        _Date_Beg := Fixed[i]._Date_Beg;
        _Date_End := Fixed[i]._Date_End;
       end;
      end;

  {1,1}if  (Fixed[i]._Date_Beg > OldFixed[f]._Date_Beg)
      and (Fixed[i]._Date_Beg < OldFixed[f]._Date_End)
      and (Fixed[i]._Date_End > OldFixed[f]._Date_End) then begin
       SetLength(TempArray2, Length(TempArray2) + 1);

       with TempArray2[Length(TempArray2) - 1] do begin
        _Link_To  := OldFixed[f]._id_Stage;
        _Modified := '';
        _id_Doc   := -1;

        Inc(AutoInc);

        _id_Stage := AutoInc;
        _Date_Beg := Fixed[i]._Date_Beg;
        _Date_End := OldFixed[f]._Date_End;
       end;
      end;

  {CheckEnd}
      if Fixed[i]._Date_End >= OldFixed[f]._Date_End then Break;
     end;
    end;
   end;
  end;

  TempArray1 := nil;
  TempArray1 := Copy(TempArray2, 0, Length(TempArray2));
  TempArray2 := nil;
 end;

 TempStagesArray := Copy(TempArray1, 0, Length(TempArray1));
end;

procedure TPlanEditorForm.GetSummaryPlanData;
var
 i, j, k, n      : integer;
 f, t, p, d      : integer;
 AutoInc         : integer;

 DepPlansArray   : TIntArray;
 DepDocsArray    : TIntArray;
 DepFixedStages  : TStagesArray;
 DepStagesArray  : TStagesArray;
 DepPlanData     : TPlanDataArray;

 LastDep         : integer;
 Name_Department : string;

 TempRecord      : TStagesRecord;

 Flag            : boolean;
 Bool1           : boolean;
 Bool2           : boolean;

 LastCostArray   : TLastCostArray;

 MinDate         : TDate;
 MinNum          : integer;

 Multiplicator   : Currency;

 Date_Beg        : TDate;
 Date_End        : TDate;

 id_Doc          : integer;
begin
// Just under constructing. It hasn't finished yet!

 DepPlansArray  := nil;
 DepDocsArray   := nil;
 DepFixedStages := nil;
 DepStagesArray := nil;
 DepPlanData    := nil;
 LastCostArray  := nil;

 Query.Close;

 if YearPlan then
  Query.SQL.Text := 'select * from PROC_DEP_FOR_PLANS_SEL(1,'
  + #39 + DateToStr(Plan_Date_Beg) + #39 + ','
  + #39 + DateToStr(Plan_Date_End) + #39 + ')'
 else
  Query.SQL.Text := 'select * from PROC_DEP_FOR_PLANS_SEL(0,'
  + #39 + DateToStr(Plan_Date_Beg) + #39 + ','
  + #39 + DateToStr(Plan_Date_End) + #39 + ')';

 Query.ExecQuery;

 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;

 while not Query.Eof do begin
  SetLength(DepPlansArray, Length(DepPlansArray) + 1);

  DepPlansArray[Length(DepPlansArray) - 1] := Query['ID_PLAN'].AsInteger;

  Query.Next;
 end;

 Query.Close;

 if Length(DepPlansArray) = 0 then Exit;

 // Selecting docs of derived Plans

 for i := 0 to Length(DepPlansArray) - 1 do begin
  Query.SQL.Text := 'select * from PROC_DT_PLANS_DERIVED_SEL(' + IntToStr(DepPlansArray[i]) + ')';
  Query.ExecQuery;

  if Query.RecordCount = 0 then begin
   Query.Close;
   Break;
  end;

  while not Query.Eof do begin
   if Query.Fields[0].AsInteger > 0 then begin
    SetLength(DepDocsArray, Length(DepDocsArray) + 1);
    DepDocsArray[Length(DepDocsArray) - 1] := Query.Fields[0].AsInteger;
   end;

   Query.Next;
  end;
  Query.Close;
 end;

 // Selecting fixed stages of derived plans

 if Length(DepDocsArray) = 0 then Exit;

 for i := 0 to Length(DepDocsArray) - 1 do begin
  if DepDocsArray[i] <= 0 then Continue;

  Query.SQL.Text := 'select id_Stage, Date_Beg, Date_End from dt_Stage where id_Doc='
  + IntToStr(DepDocsArray[i]) + ' and Link_To=-1';
  Query.ExecQuery;

  if Query.RecordCount = 0 then begin
   Query.Close;
   Continue;
  end;

  while not Query.Eof do begin
   if Query.Fields[0].AsInteger > 0 then begin
    SetLength(DepFixedStages, Length(DepFixedStages) + 1);
    with DepFixedStages[Length(DepFixedStages) -  1] do begin
     _Link_To  := -1;
     _Modified := '';
     _id_Doc   := DepDocsArray[i];
     _id_Stage := Query.Fields[0].AsInteger;
     _Date_Beg := Query.Fields[1].AsDate;
     _Date_End := Query.Fields[2].AsDate;
    end;
   end;

   Query.Next;
  end;

  Query.Close;
 end;

 // Selecting  derived stages of derived plans

 for i := 0 to Length(DepFixedStages) - 1 do begin
  Query.SQL.Text := 'select id_Stage, Date_Beg, Date_End from dt_Stage where Link_To='
  + IntToStr(DepFixedStages[i]._id_Stage);
  Query.ExecQuery;

  if Query.RecordCount = 0 then begin
   Query.Close;
   Continue;
  end;

  while not Query.Eof do begin
   if Query.Fields[0].AsInteger > 0 then begin
    SetLength(DepStagesArray, Length(DepStagesArray) + 1);
    with DepStagesArray[Length(DepStagesArray) -  1] do begin
     _Link_To  := DepFixedStages[i]._id_Stage;
     _Modified := '';
     _id_Doc   := DepFixedStages[i]._id_Doc;
     _id_Stage := Query.Fields[0].AsInteger;
     _Date_Beg := Query.Fields[1].AsDate;
     _Date_End := Query.Fields[2].AsDate;
    end;
   end;

   Query.Next;
  end;

  Query.Close;
 end;

 // Selecting PlanData

 if Length(DepFixedStages) = 0 then Exit;

 for f := 0 to Length(DepFixedStages) - 1 do begin
  Bool1 := True;
  for i := 0 to Length(DepStagesArray) - 1 do begin
   if DepStagesArray[i]._Link_To <> DepFixedStages[f]._id_Stage then Continue;

   Query.SQL.Text := 'select * from SP_DT_PLAN_DATA_SEL('
   + IntToStr(DepStagesArray[i]._id_Stage) + ',' + #39 + DateToStr(SYS_MAX_TIMESTAMP)
   + #39 + ') order by DISPLAY_ORDER_PROD, DISPLAY_ORDER';
   Query.ExecQuery;

   if Query.RecordCount = 0 then begin
    Query.Close;
    Continue;
   end;

   Bool1 := False;

   while not Query.Eof do begin
    SetLength(DepPlanData, Length(DepPlanData) + 1);
    with DepPlanData[Length(DepPlanData) - 1] do begin
     _Modified        := '';
     _id_Department  := Query['ID_DEPARTMENT'].AsInteger;
     _id_Stage       := DepStagesArray[i]._id_Stage;
     _id_Product     := Query['ID_PRODUCT'].AsInteger;
     _Name_Product   := Query['Name_Product'].AsString;
     _id_Unit_Meas   := Query['ID_UNIT_MEAS'].AsInteger;
     _Name_Unit_Meas := Query['Name_Unit_Meas'].AsString;
     _Coefficient    := Query['COEFFICIENT'].AsInteger;
     _id_Cat_Cust    := Query['ID_CAT_CUST'].AsInteger;
     _Name_Cat_Cust  := Query['Name_Cat_Cust'].AsString;
     _Cost           := Query['COST'].AsCurrency;
     _Volume         := Query['VOLUME'].AsCurrency;
     _Summa          := Query['SUMMA'].AsCurrency;
     _id_Object      := Query['ID_OBJECT'].AsInteger;
     _Name_Object    := Query['Name_Object'].AsString;
     _Need_Cat_Cust  := (Query['Need_Cat_Cust'].AsInteger = 1);
     _Need_Objects   := (Query['Need_Objects'].AsInteger = 1);
     _DispOrder_Prod := Query['DISPLAY_ORDER_PROD'].AsInteger;
     _Display_Order  := Query['DISPLAY_ORDER'].AsInteger;
    end;

    if DepPlanData[Length(DepPlanData) - 1]._id_Object > 0 then begin
     Query.Next;
     Continue;
    end;

    Flag := False;
    if Length(LastCostArray) = 0 then begin
     SetLength(LastCostArray, Length(LastCostArray) + 1);
     with LastCostArray[Length(LastCostArray) - 1] do begin
      _id_Product  := Query.Fields[0].AsInteger;
      _id_Cat_Cust := Query.Fields[3].AsInteger;
      _Cost        := Query.Fields[5].AsCurrency;
     end;

     Flag := True;
    end
    else begin
     for j := 0 to Length(LastCostArray) - 1 do begin
      if  (LastCostArray[j]._id_Product = Query.Fields[0].AsInteger)
      and (LastCostArray[j]._id_Cat_Cust = Query.Fields[3].AsInteger)
      then begin
       if LastCostArray[j]._Cost = Query.Fields[5].AsCurrency
       then Break
       else begin
        LastCostArray[j]._Cost := Query.Fields[5].AsCurrency;
        Flag := True;
       end;
      end
      else Continue;
     end;
    end;

    DepStagesArray[i]._isItCostBeg := Flag;

    Query.Next;
   end;
   Query.Close;
  end;

  if Bool1 then begin
   Query.SQL.Text := 'select * from SP_DT_PLAN_DATA_SEL('
   + IntToStr(DepFixedStages[f]._id_Stage) + ',' + #39 + DateToStr(SYS_MAX_TIMESTAMP)
   + #39 + ') order by DISPLAY_ORDER_PROD, DISPLAY_ORDER';
   Query.ExecQuery;

   if Query.RecordCount = 0 then begin
    Query.Close;
    Continue;
   end;

   while not Query.Eof do begin
    SetLength(DepPlanData, Length(DepPlanData) + 1);
    with DepPlanData[Length(DepPlanData) - 1] do begin
     _Modified        := '';
     _id_Department  := Query['ID_DEPARTMENT'].AsInteger;
     _id_Stage       := DepFixedStages[f]._id_Stage;
     _id_Product     := Query['ID_PRODUCT'].AsInteger;
     _Name_Product   := Query['Name_Product'].AsString;
     _id_Unit_Meas   := Query['ID_UNIT_MEAS'].AsInteger;
     _Name_Unit_Meas := Query['Name_Unit_Meas'].AsString;
     _Coefficient    := Query['COEFFICIENT'].AsInteger;
     _id_Cat_Cust    := Query['ID_CAT_CUST'].AsInteger;
     _Name_Cat_Cust  := Query['Name_Cat_Cust'].AsString;
     _Cost           := Query['COST'].AsCurrency;
     _Volume         := Query['VOLUME'].AsCurrency;
     _Summa          := Query['SUMMA'].AsCurrency;
     _id_Object      := Query['ID_OBJECT'].AsInteger;
     _Name_Object    := Query['Name_Object'].AsString;
     _Need_Cat_Cust  := (Query['Need_Cat_Cust'].AsInteger = 1);
     _Need_Objects   := (Query['Need_Objects'].AsInteger = 1);
     _DispOrder_Prod := Query['DISPLAY_ORDER_PROD'].AsInteger;
     _Display_Order  := Query['DISPLAY_ORDER'].AsInteger;     
    end;

    Flag := False;
    if Length(LastCostArray) = 0 then begin
     SetLength(LastCostArray, Length(LastCostArray) + 1);
     with LastCostArray[Length(LastCostArray) - 1] do begin
      _id_Product  := Query.Fields[0].AsInteger;
      _id_Cat_Cust := Query.Fields[3].AsInteger;
      _Cost        := Query.Fields[5].AsCurrency;
     end;

     Flag := True;
    end
    else begin
     for j := 0 to Length(LastCostArray) - 1 do begin
      if  (LastCostArray[j]._id_Product = Query.Fields[0].AsInteger)
      and (LastCostArray[j]._id_Cat_Cust = Query.Fields[3].AsInteger)
      then begin
       if LastCostArray[j]._Cost = Query.Fields[5].AsCurrency
       then Break
       else begin
        LastCostArray[j]._Cost := Query.Fields[5].AsCurrency;
        Flag := True;
       end;
      end
      else Continue;
     end;
    end;

    DepFixedStages[f]._isItCostBeg := Flag;

    Query.Next;
   end;
   Query.Close;
  end;
 end;

 // Selecting Department's names

 LastDep := -2;
 Name_Department := '';

 for i := 0 to Length(DepPlanData) - 1 do begin
  if DepPlanData[i]._id_Department <> LastDep then begin
   LastDep := DepPlanData[i]._id_Department;
   Query.SQL.Text := 'select Name_Short, Display_Order2 from sp_Department where id_Department='
   + IntToStr(DepPlanData[i]._id_Department);
   Query.ExecQuery;

   if Query.RecordCount <> 0 then Name_Department := Query.Fields[0].AsString;

   Query.Close;
  end;

  DepPlanData[i]._Name_Department := Name_Department;
 end;

 // Sorting DepFixedStages descending

 k := 0;
 while k < Length(DepFixedStages) - 1 do begin
  MinDate := DepFixedStages[k]._Date_Beg;
  MinNum  := k;

  for i := k + 1 to Length(DepFixedStages) - 1 do begin
   if DepFixedStages[i]._Date_Beg < MinDate then begin
    MinDate := DepFixedStages[i]._Date_Beg;
    MinNum  := i;
   end;
  end;

  TempRecord := DepFixedStages[MinNum];
  DepFixedStages[MinNum] := DepFixedStages[k];
  DepFixedStages[k]      := TempRecord;
  Inc(k);
 end;

 // Filling TempStagesArray

 DepStagesDeviding(TempFixedStages, DepFixedStages, TempStagesArray, DepStagesArray, DepDocsArray);

 // Filling of TempPlanDataArray

 TempPlanDataArray := nil;

 for d := 0 to Length(DepDocsArray) - 1 do begin
  id_Doc := DepDocsArray[d];

  for f := 0 to Length(TempFixedStages) - 1 do begin
   for i := 0 to Length(DepFixedStages) - 1 do begin
    if (DepFixedStages[i]._Date_Beg > TempFixedStages[f]._Date_End)
    or (DepFixedStages[i]._Date_End < TempFixedStages[f]._Date_Beg) then Continue;

    if DepFixedStages[i]._id_Doc <> id_Doc then Continue;

    Bool1 := True;
    for j := 0 to Length(TempStagesArray) - 1 do begin
     if TempStagesArray[j]._Link_To <> TempFixedStages[f]._id_Stage then Continue;
     Bool1 := False;

     Bool2 := True;
     for t := 0 to Length(DepStagesArray) - 1 do begin
      if (DepStagesArray[t]._Date_Beg > TempStagesArray[j]._Date_End)
      or (DepStagesArray[t]._Date_End < TempStagesArray[j]._Date_Beg) then Continue;

      if DepStagesArray[t]._id_Doc <> id_Doc then Continue;
      if DepStagesArray[t]._Link_To <> DepFixedStages[i]._id_Stage then Continue;

      Bool2 := False;

      if  (DepStagesArray[t]._Date_Beg <= TempStagesArray[j]._Date_Beg)
      and (DepStagesArray[t]._Date_End >= TempStagesArray[j]._Date_End)
      then Multiplicator := (TempStagesArray[j]._Date_End - TempStagesArray[j]._Date_Beg)
                           /(DepStagesArray[t]._Date_End - DepStagesArray[t]._Date_Beg)

      else if  (DepStagesArray[t]._Date_Beg >= TempStagesArray[j]._Date_Beg)
           and (DepStagesArray[t]._Date_End <= TempStagesArray[j]._Date_End)
           then Multiplicator := 1

      else if  (DepStagesArray[t]._Date_Beg <= TempStagesArray[j]._Date_Beg)
           and (DepStagesArray[t]._Date_End <= TempStagesArray[j]._Date_End)
           and (DepStagesArray[t]._Date_End > TempStagesArray[j]._Date_Beg)
           then Multiplicator := (DepStagesArray[t]._Date_End - TempStagesArray[j]._Date_Beg)
                            /(DepStagesArray[t]._Date_Beg - DepStagesArray[t]._Date_End)

      else if  (DepStagesArray[t]._Date_Beg <= TempStagesArray[j]._Date_End)
           and (DepStagesArray[t]._Date_Beg > TempStagesArray[j]._Date_Beg)
           and (DepStagesArray[t]._Date_End > TempStagesArray[j]._Date_End)
           then Multiplicator := (TempStagesArray[j]._Date_End - DepStagesArray[t]._Date_Beg)
                            /(DepStagesArray[t]._Date_Beg - DepStagesArray[t]._Date_End);


      for k := 0 to Length(DepPlanData) - 1 do begin
       if DepPlanData[k]._id_Stage <> DepStagesArray[t]._id_Stage then Continue;

       Flag := True;
       for n := 0 to Length(TempPlanDataArray) - 1 do
        if  (TempPlanDataArray[n]._id_Stage = TempStagesArray[j]._id_Stage)
        and (TempPlanDataArray[n]._id_Product = DepPlanData[k]._id_Product) then begin
         if DepPlanData[k]._Need_Cat_Cust then begin
          if not TempPlanDataArray[n]._Need_Cat_Cust then Continue;

          if (DepPlanData[k]._id_Cat_Cust > 0)
          and (TempPlanDataArray[n]._id_Cat_Cust = DepPlanData[k]._id_Cat_Cust) then begin
           Flag := False;
           Break;
          end
          else if DepPlanData[k]._Need_Objects and (DepPlanData[k]._id_Object > 0)
               and (TempPlanDataArray[n]._id_Object = DepPlanData[k]._id_Object)
               and TempPlanDataArray[n]._Need_Objects then begin
                Flag := False;
                Break;
               end;
         end
         else if DepPlanData[k]._Need_Objects then begin
          if not TempPlanDataArray[n]._Need_Objects then Continue;

          if (DepPlanData[k]._id_Object > 0)
          and (TempPlanDataArray[n]._id_Object = DepPlanData[k]._id_Object)
          and TempPlanDataArray[n]._Need_Objects then begin
           Flag := False;
           Break;
          end;
         end
         else if not (TempPlanDataArray[n]._Need_Cat_Cust or TempPlanDataArray[n]._Need_Objects) then begin
          Flag := False;
          Break;
         end;
        end;

       if Flag then begin
        SetLength(TempPlanDataArray, Length(TempPlanDataArray) + 1);
        TempPlanDataArray[Length(TempPlanDataArray) - 1]           := DepPlanData[k];
        TempPlanDataArray[Length(TempPlanDataArray) - 1]._id_Stage := TempStagesArray[j]._id_Stage;
        TempPlanDataArray[Length(TempPlanDataArray) - 1]._Volume   :=
            DepPlanData[k]._Volume * Multiplicator;
       end
       else TempPlanDataArray[n]._Volume := TempPlanDataArray[n]._Volume
            + DepPlanData[k]._Volume * Multiplicator;
      end;

     end;

     if Bool2 then begin
      if  (DepFixedStages[i]._Date_Beg <= TempStagesArray[j]._Date_Beg)
      and (DepFixedStages[i]._Date_End >= TempStagesArray[j]._Date_End)
      then Multiplicator := (TempStagesArray[j]._Date_End - TempStagesArray[j]._Date_Beg)
                       /(DepFixedStages[i]._Date_End - DepFixedStages[i]._Date_Beg)

      else if  (DepFixedStages[i]._Date_Beg >= TempStagesArray[j]._Date_Beg)
           and (DepFixedStages[i]._Date_End <= TempStagesArray[j]._Date_End)
           then Multiplicator := 1

      else if  (DepFixedStages[i]._Date_Beg <= TempStagesArray[j]._Date_Beg)
           and (DepFixedStages[i]._Date_End <= TempStagesArray[j]._Date_End)
           and (DepFixedStages[i]._Date_End > TempStagesArray[j]._Date_Beg)
           then Multiplicator := (DepFixedStages[i]._Date_End - TempStagesArray[j]._Date_Beg)
                            /(DepFixedStages[i]._Date_Beg - DepFixedStages[i]._Date_End)

      else if  (DepFixedStages[i]._Date_Beg <= TempStagesArray[j]._Date_End)
           and (DepFixedStages[i]._Date_Beg > TempStagesArray[j]._Date_Beg)
           and (DepFixedStages[i]._Date_End > TempStagesArray[j]._Date_End)
           then Multiplicator := (TempStagesArray[j]._Date_End - DepFixedStages[i]._Date_Beg)
                            /(DepFixedStages[i]._Date_Beg - DepFixedStages[i]._Date_End);


      for k := 0 to Length(DepPlanData) - 1 do begin
       if DepPlanData[k]._id_Stage <> DepFixedStages[i]._id_Stage then Continue;

       Flag := True;
       for n := 0 to Length(TempPlanDataArray) - 1 do
        if  (TempPlanDataArray[n]._id_Stage = TempStagesArray[j]._id_Stage)
        and (TempPlanDataArray[n]._id_Product = DepPlanData[k]._id_Product) then begin
         if DepPlanData[k]._Need_Cat_Cust then begin
          if not TempPlanDataArray[n]._Need_Cat_Cust then Continue;

          if (DepPlanData[k]._id_Cat_Cust > 0)
          and (TempPlanDataArray[n]._id_Cat_Cust = DepPlanData[k]._id_Cat_Cust) then begin
           Flag := False;
           Break;
          end
          else if DepPlanData[k]._Need_Objects and (DepPlanData[k]._id_Object > 0)
               and (TempPlanDataArray[n]._id_Object = DepPlanData[k]._id_Object)
               and TempPlanDataArray[n]._Need_Objects then begin
                Flag := False;
                Break;
               end;
         end
         else if DepPlanData[k]._Need_Objects then begin
          if not TempPlanDataArray[n]._Need_Objects then Continue;

          if (DepPlanData[k]._id_Object > 0)
          and (TempPlanDataArray[n]._id_Object = DepPlanData[k]._id_Object)
          and TempPlanDataArray[n]._Need_Objects then begin
           Flag := False;
           Break;
          end;
         end
         else if not (TempPlanDataArray[n]._Need_Cat_Cust or TempPlanDataArray[n]._Need_Objects) then begin
          Flag := False;
          Break;
         end;
        end;

       if Flag then begin
        SetLength(TempPlanDataArray, Length(TempPlanDataArray) + 1);
        TempPlanDataArray[Length(TempPlanDataArray) - 1]           := DepPlanData[k];
        TempPlanDataArray[Length(TempPlanDataArray) - 1]._id_Stage := TempStagesArray[j]._id_Stage;
        TempPlanDataArray[Length(TempPlanDataArray) - 1]._Volume   :=
            DepPlanData[k]._Volume * Multiplicator;
       end
       else TempPlanDataArray[n]._Volume := TempPlanDataArray[n]._Volume
            + DepPlanData[k]._Volume * Multiplicator;
      end;
     end;
    end;

    if Bool1 then begin
     for t := 0 to Length(DepFixedStages) - 1 do begin
      if (DepFixedStages[t]._Date_Beg > TempFixedStages[f]._Date_End)
      or (DepFixedStages[t]._Date_End < TempFixedStages[f]._Date_Beg) then Continue;

      if DepFixedStages[t]._id_Doc <> id_Doc then Continue;

      Bool2 := True;

      for j := 0 to Length(DepStagesArray) - 1 do begin
       if DepStagesArray[j]._Link_To <> DepFixedStages[t]._id_Stage then Continue;

       Bool2 := False;

       if  (DepStagesArray[j]._Date_Beg <= TempFixedStages[f]._Date_Beg)
       and (DepStagesArray[j]._Date_End >= TempFixedStages[f]._Date_End)
       then Multiplicator := (TempFixedStages[f]._Date_End - TempFixedStages[f]._Date_Beg)
                        /(DepStagesArray[j]._Date_End - DepStagesArray[j]._Date_Beg)

       else if  (DepStagesArray[j]._Date_Beg >= TempFixedStages[f]._Date_Beg)
            and (DepStagesArray[j]._Date_End <= TempFixedStages[f]._Date_End)
            then Multiplicator := 1

       else if  (DepStagesArray[j]._Date_Beg <= TempFixedStages[f]._Date_Beg)
            and (DepStagesArray[j]._Date_End <= TempFixedStages[f]._Date_End)
            and (DepStagesArray[j]._Date_End > TempFixedStages[f]._Date_Beg)
            then Multiplicator := (DepStagesArray[j]._Date_End - TempFixedStages[f]._Date_Beg)
                             /(DepStagesArray[j]._Date_Beg - DepStagesArray[j]._Date_End)

       else if  (DepStagesArray[j]._Date_Beg <= TempFixedStages[f]._Date_End)
            and (DepStagesArray[j]._Date_Beg > TempFixedStages[f]._Date_Beg)
            and (DepStagesArray[j]._Date_End > TempFixedStages[f]._Date_End)
            then Multiplicator := (TempFixedStages[f]._Date_End - DepStagesArray[j]._Date_Beg)
                             /(DepStagesArray[j]._Date_Beg - DepStagesArray[j]._Date_End);


       for k := 0 to Length(DepPlanData) - 1 do begin
        if DepPlanData[k]._id_Stage <> DepStagesArray[j]._id_Stage then Continue;

        Flag := True;
        for n := 0 to Length(TempPlanDataArray) - 1 do
         if  (TempPlanDataArray[n]._id_Stage = TempFixedStages[f]._id_Stage)
         and (TempPlanDataArray[n]._id_Product = DepPlanData[k]._id_Product) then begin
          if DepPlanData[k]._Need_Cat_Cust then begin
           if not TempPlanDataArray[n]._Need_Cat_Cust then Continue;

           if (DepPlanData[k]._id_Cat_Cust > 0)
           and (TempPlanDataArray[n]._id_Cat_Cust = DepPlanData[k]._id_Cat_Cust) then begin
            Flag := False;
            Break;
           end
           else if DepPlanData[k]._Need_Objects and (DepPlanData[k]._id_Object > 0)
                and (TempPlanDataArray[n]._id_Object = DepPlanData[k]._id_Object)
                and TempPlanDataArray[n]._Need_Objects then begin
                 Flag := False;
                 Break;
                end;
          end
          else if DepPlanData[k]._Need_Objects then begin
           if not TempPlanDataArray[n]._Need_Objects then Continue;

           if (DepPlanData[k]._id_Object > 0)
           and (TempPlanDataArray[n]._id_Object = DepPlanData[k]._id_Object)
           and TempPlanDataArray[n]._Need_Objects then begin
            Flag := False;
            Break;
           end;
          end
          else if not (TempPlanDataArray[n]._Need_Cat_Cust or TempPlanDataArray[n]._Need_Objects) then begin
           Flag := False;
           Break;
          end;
         end;

        if Flag then begin
         SetLength(TempPlanDataArray, Length(TempPlanDataArray) + 1);
         TempPlanDataArray[Length(TempPlanDataArray) - 1]           := DepPlanData[k];
         TempPlanDataArray[Length(TempPlanDataArray) - 1]._id_Stage := TempFixedStages[f]._id_Stage;
         TempPlanDataArray[Length(TempPlanDataArray) - 1]._Volume   :=
             DepPlanData[k]._Volume * Multiplicator;
        end
        else TempPlanDataArray[n]._Volume := TempPlanDataArray[n]._Volume
             + DepPlanData[k]._Volume * Multiplicator;
       end;
      end;

      if Bool2 then begin
       if  (DepFixedStages[t]._Date_Beg <= TempFixedStages[f]._Date_Beg)
       and (DepFixedStages[t]._Date_End >= TempFixedStages[f]._Date_End)
       then Multiplicator := (TempFixedStages[f]._Date_End - TempFixedStages[f]._Date_Beg)
                        /(DepFixedStages[t]._Date_End - DepFixedStages[t]._Date_Beg)

       else if  (DepFixedStages[t]._Date_Beg >= TempFixedStages[f]._Date_Beg)
            and (DepFixedStages[t]._Date_End <= TempFixedStages[f]._Date_End)
            then Multiplicator := 1

       else if  (DepFixedStages[t]._Date_Beg <= TempFixedStages[f]._Date_Beg)
            and (DepFixedStages[t]._Date_End <= TempFixedStages[f]._Date_End)
            and (DepFixedStages[t]._Date_End > TempFixedStages[f]._Date_Beg)
            then Multiplicator := (DepFixedStages[t]._Date_End - TempFixedStages[f]._Date_Beg)
                             /(DepFixedStages[t]._Date_Beg - DepFixedStages[t]._Date_End)

       else if  (DepFixedStages[t]._Date_Beg <= TempFixedStages[f]._Date_End)
            and (DepFixedStages[t]._Date_Beg > TempFixedStages[f]._Date_Beg)
            and (DepFixedStages[t]._Date_End > TempFixedStages[f]._Date_End)
            then Multiplicator := (TempFixedStages[f]._Date_End - DepFixedStages[t]._Date_Beg)
                             /(DepFixedStages[t]._Date_Beg - DepFixedStages[t]._Date_End);


       for k := 0 to Length(DepPlanData) - 1 do begin
        if DepPlanData[k]._id_Stage <> DepFixedStages[t]._id_Stage then Continue;

        Flag := True;
        for n := 0 to Length(TempPlanDataArray) - 1 do
         if  (TempPlanDataArray[n]._id_Stage = TempFixedStages[f]._id_Stage)
         and (TempPlanDataArray[n]._id_Department = DepPlanData[k]._id_Department)
         and (TempPlanDataArray[n]._id_Product = DepPlanData[k]._id_Product) then begin
          if DepPlanData[k]._Need_Cat_Cust then begin
           if not TempPlanDataArray[n]._Need_Cat_Cust then Continue;

           if (DepPlanData[k]._id_Cat_Cust > 0)
           and (TempPlanDataArray[n]._id_Cat_Cust = DepPlanData[k]._id_Cat_Cust) then begin
            Flag := False;
            Break;
           end
           else if DepPlanData[k]._Need_Objects and (DepPlanData[k]._id_Object > 0)
                and (TempPlanDataArray[n]._id_Object = DepPlanData[k]._id_Object)
                and TempPlanDataArray[n]._Need_Objects then begin
                 Flag := False;
                 Break;
                end;
          end
          else if DepPlanData[k]._Need_Objects then begin
           if not TempPlanDataArray[n]._Need_Objects then Continue;

           if (DepPlanData[k]._id_Object > 0)
           and (TempPlanDataArray[n]._id_Object = DepPlanData[k]._id_Object)
           and TempPlanDataArray[n]._Need_Objects then begin
            Flag := False;
            Break;
           end;
          end
          else if not (TempPlanDataArray[n]._Need_Cat_Cust or TempPlanDataArray[n]._Need_Objects) then begin
           Flag := False;
           Break;
          end;
         end;

        if Flag then begin
         SetLength(TempPlanDataArray, Length(TempPlanDataArray) + 1);
         TempPlanDataArray[Length(TempPlanDataArray) - 1]           := DepPlanData[k];
         TempPlanDataArray[Length(TempPlanDataArray) - 1]._id_Stage := TempFixedStages[f]._id_Stage;
         TempPlanDataArray[Length(TempPlanDataArray) - 1]._Volume   :=
             DepPlanData[k]._Volume * Multiplicator;
        end
        else TempPlanDataArray[n]._Volume := TempPlanDataArray[n]._Volume
             + DepPlanData[k]._Volume * Multiplicator;
       end;
      end;
     end;
    end;
   end;
  end;
 end;
end;

procedure TPlanEditorForm.AddNodeDep(PlanDataRecord: TPlanDataRecord; Stage_id : integer;
  Col_Name: string; Cost_Beg : boolean);
var
 i       : integer;

 Node    : TcxTreeListNode;
 Child   : TcxTreeListNode;
 Child2  : TcxTreeListNode;

 Flag    : boolean;
begin
//TODO 2 -oAndrew : 'Don't forget that you are to compare coefficients of product's which are added to plan!'

 Flag := True;
 for i := 0 to DepTreeList.Count - 1 do
  if PlanDataRecord._id_Department = DepTreeList.Items[i].Values[9] then begin
   Flag := False;
   Break;
  end;

 if Flag then begin
  Node := DepTreeList.Add;

  Node.Values[9]  := PlanDataRecord._id_Department;
  Node.Values[1]  := PlanDataRecord._Name_Department;
 end
 else Node := DepTreeList.Items[i];

 Flag := True;
 for i := 0 to Node.Count - 1 do
  if PlanDataRecord._id_Product = Node.Items[i].Values[0] then begin
   Flag := False;
   Break;
  end;

 if Flag then begin
  Child := Node.AddChild;

  Child.Values[0]  := PlanDataRecord._id_Product;
  Child.Values[1]  := PlanDataRecord._Name_Product;
  Child.Values[4]  := PlanDataRecord._Name_Unit_Meas;
  Child.Values[5]  := PlanDataRecord._Need_Cat_Cust;
  Child.Values[6]  := PlanDataRecord._Need_Objects;
  Child.Values[7]  := SYS_DEF_UNIT_MEAS;
  Child.Values[8]  := SYS_DEF_UNIT_MEAS_COEF;
  Child.Values[10] := PlanDataRecord._DispOrder_Prod;
 end
 else Child := Node.Items[i];

 if PlanDataRecord._Need_Cat_Cust and (PlanDataRecord._id_Cat_Cust > 0) then begin
  Flag := True;
  for i := 0 to Child.Count - 1 do
   if PlanDataRecord._id_Cat_Cust = Child.Items[i].Values[2] then begin
    Flag := False;
    Break;
   end;

  if Flag then begin
   Child2 := Child.AddChild;

   Child2.Values[0]  := -1;
   Child2.Values[1]  := PlanDataRecord._Name_Cat_Cust;
   Child2.Values[2]  := PlanDataRecord._id_Cat_Cust;
   Child2.Values[3]  := -1;
   Child2.Values[10] := PlanDataRecord._Display_Order;
  end
  else Child2 := Child.Items[i];

  Child2.Values[DepTreeList.ColumnByName(Col_Name).ItemIndex] :=
    RoundTo(PlanDataRecord._Volume * PlanDataRecord._Coefficient
    / SYS_DEF_UNIT_MEAS_COEF, RoundCountQ);

  if Cost_Beg then
   Child2.Values[DepTreeList.ColumnByName('PriceCol_'
         + IntToStr(Stage_id)).ItemIndex] := PlanDataRecord._Cost;
 end
 else begin
  Child.Values[DepTreeList.ColumnByName(Col_Name).ItemIndex] :=
    RoundTo(PlanDataRecord._Volume * PlanDataRecord._Coefficient
    / SYS_DEF_UNIT_MEAS_COEF, RoundCountQ);

  if Cost_Beg then
   Child.Values[DepTreeList.ColumnByName('PriceCol_'
         + IntToStr(Stage_id)).ItemIndex] := PlanDataRecord._Cost;
 end;
end;

procedure TPlanEditorForm.AddNodeProd(PlanDataRecord: TPlanDataRecord;
  Stage_id: integer; Col_Name: string; Cost_Beg: boolean);
var
 i       : integer;

 Node    : TcxTreeListNode;
 Child   : TcxTreeListNode;
 Child2  : TcxTreeListNode;

 Flag    : boolean;
begin
 Flag := True;
 for i := 0 to ProductTreeList.Count - 1 do
  if PlanDataRecord._id_Product = ProductTreeList.Items[i].Values[0] then begin
   Flag := False;
   Break;
  end;

 if Flag then begin
  Node := ProductTreeList.Add;

  Node.Values[0] := PlanDataRecord._id_Product;
  Node.Values[1] := PlanDataRecord._Name_Product;
  Node.Values[4] := PlanDataRecord._Name_Unit_Meas;
  Node.Values[5] := PlanDataRecord._Need_Cat_Cust;
  Node.Values[6] := PlanDataRecord._Need_Objects;
  Node.Values[7] := PlanDataRecord._id_Unit_Meas;
  Node.Values[8] := PlanDataRecord._Coefficient;
  Node.Values[9] := -1;
 end
 else Node := ProductTreeList.Items[i];

 if PlanDataRecord._Need_Cat_Cust and (PlanDataRecord._id_Cat_Cust > 0) then begin
  Flag := True;
  for i := 0 to Node.Count - 1 do
   if PlanDataRecord._id_Cat_Cust = Node.Items[i].Values[2] then begin
    Flag := False;
    Break;
   end;

  if Flag then begin
   Child := Node.AddChild;

   Child.Values[0] := -1;
   Child.Values[1] := PlanDataRecord._Name_Cat_Cust;
   Child.Values[2] := PlanDataRecord._id_Cat_Cust;
   Child.Values[3] := -1;
   Child.Values[9] := -1;
  end
  else Child := Node.Items[i];

  if Cost_Beg then
   Child.Values[ProductTreeList.ColumnByName('PriceCol_'
         + IntToStr(Stage_id)).ItemIndex] := PlanDataRecord._Cost;
 end
 else begin
  Child := Node;

  if Cost_Beg then
   Child.Values[ProductTreeList.ColumnByName('PriceCol_'
         + IntToStr(Stage_id)).ItemIndex] := PlanDataRecord._Cost;
 end;

 Flag := True;
 for i := 0 to Child.Count - 1 do
  if Child.Items[i].Values[9] = PlanDataRecord._id_Department then begin
    Flag := False;
    Break;
   end;

 if Flag then begin
  Child2 := Child.AddChild;

  Child2.Values[0] := -1;
  Child2.Values[1] := PlanDataRecord._Name_Department;
  Child2.Values[2] := -1;
  Child2.Values[9] := PlanDataRecord._id_Department;
  Child2.Values[ProductTreeList.ColumnByName(Col_Name).ItemIndex] := PlanDataRecord._Volume;
 end
 else begin
  Child2 := Child.Items[i];
  Child2.Values[ProductTreeList.ColumnByName(Col_Name).ItemIndex] := PlanDataRecord._Volume;
 end;
end;

procedure TPlanEditorForm.FillSummaryPlanByDeps(InputStagesArray, InputFixed : TStagesArray;
          InputPlanDataArray : TPlanDataArray; id_Doc : integer);
var
 i, j, t : integer;

 Bool    : boolean;
begin
// DepTreeList.BeginUpdate;

 for i := 0 to Length(InputFixed) - 1 do begin
  if InputFixed[i]._id_Doc <> id_Doc then Continue;

  Bool := True;
  for j := 0 to Length(InputStagesArray) - 1 do begin
   if InputStagesArray[j]._id_Doc <> id_Doc then Continue;
   if InputStagesArray[j]._Link_To <> InputFixed[i]._id_Stage then Continue;

   Bool := False;

   for t := 0 to Length(InputPlanDataArray) - 1 do begin
    if InputPlanDataArray[t]._id_Stage <> InputStagesArray[j]._id_Stage then Continue;

    AddNodeDep(InputPlanDataArray[t], InputStagesArray[j]._id_Stage, 'QntCol_'
    + IntToStr(InputStagesArray[j]._id_Stage), InputStagesArray[j]._isItCostBeg);
   end;
  end;

  if Bool then
   for t := 0 to Length(InputPlanDataArray) - 1 do begin
    if InputPlanDataArray[t]._id_Stage <> InputFixed[i]._id_Stage then Continue;

    AddNodeDep(InputPlanDataArray[t], InputFixed[i]._id_Stage, 'FQntCol_'
    + IntToStr(InputFixed[i]._id_Stage), InputFixed[i]._isItCostBeg);
   end;
 end;

 if GridDoc.DataController.FocusedRowIndex < 0 then Exit;

 if GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0] > 0 then
  CalcSummsDep(StagesArray, FixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0], GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7])
 else
  CalcSummsDep(NewStagesArray, NewFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0], GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);

// DepTreeList.EndUpdate;
 DepTreeList.FullExpand;
end;

procedure TPlanEditorForm.AddSumNodeDep;
var
 i, j    : integer;
 d, k    : integer;
 DepNode : TcxTreeListNode;

 Node    : TcxTreeListNode;
 Child   : TcxTreeListNode;
 Child2  : TcxTreeListNode;

 Flag    : boolean;
begin
 Node := DepTreeList.AddFirst;
// Node.MoveTo(DepTreeList.Items[0], tlamAddFirst);

 Node.Values[0] := -3;
 Node.Values[1] := 'Разом по ДВП';
 Node.Values[9] := id_Department;

 for d := 1 to DepTreeList.Count - 1 do begin
  DepNode := DepTreeList.Items[d];

  for i := 0 to DepNode.Count - 1 do begin
   Flag := True;
   for j := 0 to Node.Count - 1 do
    if Node.Items[j].Values[0] = DepNode.Items[i].Values[0] then begin
     Flag := False;
     Break;
    end;

   if Flag then begin
    Child := Node.AddChild;

    Child.Values[0]  := DepNode.Items[i].Values[0];
    Child.Values[1]  := DepNode.Items[i].Values[1];
    Child.Values[4]  := DepNode.Items[i].Values[4];
    Child.Values[5]  := DepNode.Items[i].Values[5];
    Child.Values[6]  := DepNode.Items[i].Values[6];
    Child.Values[7]  := DepNode.Items[i].Values[7];
    Child.Values[8]  := DepNode.Items[i].Values[8];
    Child.Values[10] := DepNode.Items[i].Values[10];
   end
   else Child := Node.Items[j];

   for j := 0 to DepNode.Items[i].Count - 1 do begin
    if DepNode.Items[i].Items[j].Values[0] < -1 then Continue;

    Flag := True;
    for k := 0 to Child.Count - 1 do
     if (Child.Items[k].Values[2] = DepNode.Items[i].Items[j].Values[2])
     and (Child.Items[k].Values[3] = DepNode.Items[i].Items[j].Values[3]) then begin
      Flag := False;
      Break;
     end;

    if Flag then begin
     Child2 := Child.AddChild;

     Child2.Values[0]  := -1;
     Child2.Values[1]  := DepNode.Items[i].Items[j].Values[1];
     Child2.Values[2]  := DepNode.Items[i].Items[j].Values[2];
     Child2.Values[3]  := DepNode.Items[i].Items[j].Values[3];
     Child2.Values[10] := DepNode.Items[i].Items[j].Values[10];
    end;
   end;
  end;
 end;

 DepTreeList.FullExpand;
 DepTreeList.GotoBOF;
end;

procedure TPlanEditorForm.FillSummaryPlanByProduct(InputStagesArray, InputFixed : TStagesArray;
          InputPlanDataArray : TPlanDataArray; id_Doc : integer);
var
 i, j, t : integer;

 Bool    : boolean;
begin
 ProductTreeList.BeginUpdate;

 for i := 0 to Length(InputFixed) - 1 do begin
  if InputFixed[i]._id_Doc <> id_Doc then Continue;

  Bool := True;
  for j := 0 to Length(InputStagesArray) - 1 do begin
   if InputStagesArray[j]._id_Doc <> id_Doc then Continue;
   if InputStagesArray[j]._Link_To <> InputFixed[i]._id_Stage then Continue;

   Bool := False;

   for t := 0 to Length(InputPlanDataArray) - 1 do begin
    if InputPlanDataArray[t]._id_Stage <> InputStagesArray[j]._id_Stage then Continue;

    AddNodeProd(InputPlanDataArray[t], InputStagesArray[j]._id_Stage, 'QntCol_'
    + IntToStr(InputStagesArray[j]._id_Stage), InputStagesArray[j]._isItCostBeg);
   end;
  end;

  if Bool then
   for t := 0 to Length(InputPlanDataArray) - 1 do begin
    if InputPlanDataArray[t]._id_Stage <> InputFixed[i]._id_Stage then Continue;

    AddNodeProd(InputPlanDataArray[t], InputFixed[i]._id_Stage, 'FQntCol_'
    + IntToStr(InputFixed[i]._id_Stage), InputFixed[i]._isItCostBeg);
   end;
 end;

 ProductTreeList.EndUpdate;
 ProductTreeList.FullExpand;
end;

procedure TPlanEditorForm.PageControlChange(Sender: TObject);
var
 i, j, k : integer;
 Flag    : boolean;
begin
 TreeListClearNodes(DepTreeList);
 TreeListClearNodes(ProductTreeList);

 if GridDoc.DataController.FocusedRowIndex < 0 then Exit;

 if PageControl.ActivePageIndex = 0 then begin
  if ApplyButton.Visible = ivAlways then begin
   MakeTreeList(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0], DepTreeList);
   FillSummaryPlanByDeps(TempStagesArray, TempFixedStages, TempPlanDataArray, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0]);
   CalcSummsDep(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
             GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
  end
  else if GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0] >= 0 then begin
   MakeTreeList(StagesArray, FixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0], DepTreeList);
   FillSummaryPlanByDeps(StagesArray, FixedStages, PlanDataArray, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0]);
   CalcSummsDep(StagesArray, FixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
             GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
  end
  else begin
   MakeTreeList(NewStagesArray, NewFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0], DepTreeList);
   FillSummaryPlanByDeps(NewStagesArray, NewFixedStages, NewPlanDataArray, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0]);
   CalcSummsDep(NewStagesArray, NewFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
             GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
  end;
 end
 else if PageControl.ActivePageIndex = 1 then begin
  if ApplyButton.Visible = ivAlways then begin
   MakeTreeList(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0], ProductTreeList);
   FillSummaryPlanByProduct(TempStagesArray, TempFixedStages, TempPlanDataArray, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0]);
   CalcSummsProd(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
             GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
  end
  else if GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0] >= 0 then begin
   MakeTreeList(StagesArray, FixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0], ProductTreeList);
   FillSummaryPlanByProduct(StagesArray, FixedStages, PlanDataArray, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0]);
   CalcSummsProd(StagesArray, FixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
             GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
  end
  else begin
   MakeTreeList(NewStagesArray, NewFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0], ProductTreeList);
   FillSummaryPlanByProduct(NewStagesArray, NewFixedStages, NewPlanDataArray, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0]);
   CalcSummsProd(NewStagesArray, NewFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
             GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
  end;
 end;

 if Length(ChangeProduct) = 0 then Exit;

 if PageControl.ActivePageIndex = 0 then begin
  if ChangeProduct[0]._id_Department < 0 then Exit;

  Flag := True;
  for i := 0 to DepTreeList.Count - 1 do
   if DepTreeList.Items[i].Values[9] = ChangeProduct[0]._id_Department then begin
    Flag := False;
    Break;
   end;

  if Flag then Exit;

  Flag := True;
  for j := 0 to DepTreeList.Items[i].Count - 1 do
   if DepTreeList.Items[i].Items[j].Values[0] = ChangeProduct[0]._id_Product then begin
    Flag := False;
    Break;
   end;

  if j >= DepTreeList.Items[i].Count then j := DepTreeList.Items[i].Count - 1;

  if Flag then begin
   DepTreeList.Items[i].Focused := True;
   Exit;
  end;

  Flag := True;
  for k := 0 to DepTreeList.Items[i].Items[j].Count - 1 do
   if DepTreeList.Items[i].Items[j].Items[k].Values[2] = ChangeProduct[0]._id_Cat_Cust then begin
    Flag := False;
    Break;
   end;

  if k >= DepTreeList.Items[i].Items[j].Count then k := DepTreeList.Items[i].Items[j].Count - 1;

  if Flag then begin
   DepTreeList.Items[i].Items[j].Focused := True;
   Exit;
  end
  else DepTreeList.Items[i].Items[j].Items[k].Focused := True;
 end
 else if PageControl.ActivePageIndex = 1 then begin
  if ChangeProduct[0]._id_Product < 0 then Exit;

  Flag := True;
  for i := 0 to ProductTreeList.Count - 1 do
   if ProductTreeList.Items[i].Values[0] = ChangeProduct[0]._id_Product then begin
    Flag := False;
    Break;
   end;

  if Flag then Exit;

  if ProductTreeList.Items[i].Values[5] then begin

   Flag := True;
   for j := 0 to ProductTreeList.Items[i].Count - 1 do
    if ProductTreeList.Items[i].Items[j].Values[2] = ChangeProduct[0]._id_Cat_Cust then begin
     Flag := False;
     Break;
    end;

   if j >= ProductTreeList.Items[i].Count then j := ProductTreeList.Items[i].Count - 1;

   if Flag then begin
    ProductTreeList.Items[i].Focused := True;
    Exit;
   end;

   Flag := True;
   for k := 0 to ProductTreeList.Items[i].Items[j].Count - 1 do
    if ProductTreeList.Items[i].Items[j].Items[k].Values[9] = ChangeProduct[0]._id_Department then begin
     Flag := False;
     Break;
    end;

   if k >= ProductTreeList.Items[i].Items[j].Count then k := ProductTreeList.Items[i].Items[j].Count - 1;

   if Flag then begin
    ProductTreeList.Items[i].Items[j].Focused := True;
    Exit;
   end
   else ProductTreeList.Items[i].Items[j].Items[k].Focused := True;
  end
  else begin
   Flag := True;
   for k := 0 to ProductTreeList.Items[i].Count - 1 do
    if ProductTreeList.Items[i].Items[k].Values[9] = ChangeProduct[0]._id_Department then begin
     Flag := False;
     Break;
    end;

   if k >= ProductTreeList.Items[i].Count then k := ProductTreeList.Items[i].Count - 1;

   if Flag then begin
    ProductTreeList.Items[i].Focused := True;
    Exit;
   end
   else ProductTreeList.Items[i].Items[k].Focused := True;
  end;
 end;
end;

procedure TPlanEditorForm.PageControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 if PageControl.ActivePageIndex = 0 then begin
  if ApplyButton.Visible = ivAlways then SavePlanDataDep(TempStagesArray, TempFixedStages, SAVE_TO_TEMP);

  ChangeProduct := nil;

  if DepTreeList.FocusedNode = nil then Exit;

  SetLength(ChangeProduct, 1);

  case DepTreeList.FocusedNode.Level of
   0 :
    begin
     ChangeProduct[0]._id_Department := DepTreeList.FocusedNode.Values[9];
     ChangeProduct[0]._id_Product    := -1;
     ChangeProduct[0]._id_Cat_Cust   := -1;
    end;
   1 :
    begin
     ChangeProduct[0]._id_Department := DepTreeList.FocusedNode.Parent.Values[9];
     ChangeProduct[0]._id_Product    := DepTreeList.FocusedNode.Values[0];
     ChangeProduct[0]._id_Cat_Cust   := -1;
    end;
   2 :
    begin
     ChangeProduct[0]._id_Department := DepTreeList.FocusedNode.Parent.Parent.Values[9];
     ChangeProduct[0]._id_Product    := DepTreeList.FocusedNode.Parent.Values[0];
     ChangeProduct[0]._id_Cat_Cust   := DepTreeList.FocusedNode.Values[2];
    end;
  end;
 end
 else begin
  ChangeProduct := nil;

  if ProductTreeList.FocusedNode = nil then Exit;

  SetLength(ChangeProduct, 1);

  case ProductTreeList.FocusedNode.Level of
   0 :
    begin
     ChangeProduct[0]._id_Product    := ProductTreeList.FocusedNode.Values[0];
     ChangeProduct[0]._id_Cat_Cust   := -1;
     ChangeProduct[0]._id_Department := -1;
    end;
   1 :
    begin
     if ProductTreeList.FocusedNode.Parent.Values[5] then begin
      ChangeProduct[0]._id_Product    := ProductTreeList.FocusedNode.Parent.Values[0];
      ChangeProduct[0]._id_Cat_Cust   := ProductTreeList.FocusedNode.Values[2];
      ChangeProduct[0]._id_Department := -1;
     end
     else begin
      ChangeProduct[0]._id_Product    := ProductTreeList.FocusedNode.Parent.Values[0];
      ChangeProduct[0]._id_Cat_Cust   := -1;
      ChangeProduct[0]._id_Department := ProductTreeList.FocusedNode.Values[9];
     end;
    end;
   2 :
    begin
     ChangeProduct[0]._id_Product    := ProductTreeList.FocusedNode.Parent.Parent.Values[0];
     ChangeProduct[0]._id_Cat_Cust   := ProductTreeList.FocusedNode.Parent.Values[2];
     ChangeProduct[0]._id_Department := ProductTreeList.FocusedNode.Values[9];
    end;
  end;
 end;
end;

procedure TPlanEditorForm.SetCDataBtnClick(Sender: TObject);
begin
 NullTheTreeData(ProductTreeList);

 WaitPanel.Visible := True;
 Application.ProcessMessages;

 SetContractsData(TempFixedStages, TempStagesArray, ProductTreeList,
                  GridDoc.DataController.Values[GridDoc.DataController.FocusedRecordIndex, 0]);

 SortObjects_and_CatCust;                 

 WaitPanel.Visible := False;

 CalcSumms(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
           GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
end;

procedure TPlanEditorForm.SetContractsData(Fixed : TStagesArray; Stages: TStagesArray;
          TreeList: TcxTreeList; id_Doc : integer);
var
 i, j, f, t    : integer;
 Bool          : boolean;
 Num           : integer;
 Multiplicator : extended;

 Child         : TcxTreeListNode;

 Stage_Beg     : TDate;
 Stage_End     : TDate;
 Id_Product    : integer;
 Id_Cat_Cust   : integer;
 Deliver_Count : Currency;

 Flag          : boolean;

 id_Point      : integer;
 Volume        : Currency;
 ObjectRecord  : TObjectsRecord;

 function GetObject(Point : integer) : TObjectsRecord;
 var
  id_Object : integer;
  For_Plan  : boolean;
 begin
  Result._id := -1;
  if Point < 0 then Exit;

  Query.Close;
  Query.SQL.Text := 'select Name_Object, FOR_PLAN, DISPLAY_ORDER from SP_OBJECT where id_Object='
  + IntToStr(Point);
  Query.ExecQuery;

  if Query.RecordCount = 0 then begin
   Query.Close;
   Exit;
  end;

  For_Plan := (1 = Query['FOR_PLAN'].AsInteger);
  Query.Close;

  if For_Plan then begin
   with Result do begin
    _id    :=  Point;
    _Name  :=  Query['NAME_OBJECT'].AsString;
    _Plan  := (1 = Query['FOR_PLAN'].AsInteger);
    _Order :=  Query['DISPLAY_ORDER'].AsInteger;
   end;
  end
  else begin
   Query.Close;
   Query.SQL.Text := 'select * from PROC_DT_PAIR_SCHEME_SEL_PREV('
   + IntToStr(Point) + ',' + QuotedStr(DateTimeToStr(SYS_MAX_TIMESTAMP)) + ')';
   Query.ExecQuery;

   if Query.RecordCount = 0 then begin
    Query.Close;
    Exit;
   end;

   id_Object := Query['ID_OBJECT'].AsInteger;
   Query.Close;

   Result := GetObject(id_Object);
  end;
 end;
begin 
 for f := 0 to Length(Fixed) - 1 do begin
  if Fixed[f]._id_Doc <> id_Doc then Continue;

  Bool := True;

  for t := 0 to Length(Stages) - 1 do begin
   if (Stages[t]._id_Doc <> id_Doc) or (Stages[t]._Link_To <> Fixed[f]._id_Stage) then Continue;

   Bool := False;

   Num := TreeList.ColumnByName('QntCol_' + IntToStr(Stages[t]._id_Stage)).ItemIndex;

   DataSet.Active := False;
   DataSet.SQLs.SelectSQL.Text := 'select * from PROC_DT_CONTRACT_ANALYSE_ALL('
   + #39 + DateToStr(Stages[t]._Date_Beg) + #39 + ',' + #39 + DateToStr(Stages[t]._Date_End)
   + #39 + ',' + IntToStr(id_Department) + ')';

   DataSet.Active := True;

   if DataSet.RecordCount = 0 then begin
    DataSet.Active := False;
    Continue;
   end;

   while not DataSet.Eof do begin
    Stage_Beg     := DataSet.FieldValues['STAGE_BEG'];
    Stage_End     := DataSet.FieldValues['STAGE_END'];
    Id_Product    := DataSet.FieldValues['ID_PRODUCT'];
    Id_Cat_Cust   := DataSet.FieldValues['ID_CAT_CUST'];
    Deliver_Count := DataSet.FieldValues['DELIVER_COUNT'] * DataSet.FieldValues['COEFFICIENT'];

    if not VarIsNull(DataSet.FieldValues['ID_POINT']) then begin
     id_Point      := DataSet.FieldValues['ID_POINT'];
     Volume        := DataSet.FieldValues['VOLUME'] * DataSet.FieldValues['COEFFICIENT'];
    end
    else id_Point := -1;

    Multiplicator := 0;

    if (Stage_Beg < Stages[t]._Date_Beg) and (Stage_End > Stages[t]._Date_Beg)
    and (Stage_End < Stages[t]._Date_End)
    then Multiplicator := (Stage_End - Stages[t]._Date_Beg)/(Stage_End - Stage_Beg)
    else
     if (Stage_Beg >= Stages[t]._Date_Beg) and (Stage_End <= Stages[t]._Date_End)
     then Multiplicator := 1
     else
      if (Stage_Beg < Stages[t]._Date_End) and (Stage_End > Stages[t]._Date_End)
      then Multiplicator := (Stages[t]._Date_End - Stage_Beg)/(Stage_End - Stage_Beg)
      else
       if (Stage_Beg <= Stages[t]._Date_Beg) and (Stage_End >= Stages[t]._Date_End)
       then Multiplicator := (Stages[t]._Date_End - Stages[t]._Date_Beg)/(Stage_End - Stage_Beg);

    for i := 0 to TreeList.Count - 1 do begin
     if (TreeList.Items[i].Values[0] < 0)
     or (TreeList.Items[i].Values[0] <> Id_Product) then Continue;

     // Filling the Cat_Cust for product

     Flag := False;

     if TreeList.Items[i].Values[5] then begin
      for j := 0 to TreeList.Items[i].Count - 1 do begin
       if (TreeList.Items[i].Items[j].Values[0] < -1)
       or (TreeList.Items[i].Items[j].Values[2] <> Id_Cat_Cust) then Continue;

       TreeList.Items[i].Items[j].Values[Num] := TreeList.Items[i].Items[j].Values[Num]
       + RoundTo(Deliver_Count * Multiplicator / TreeList.Items[i].Values[8], -6);

       Flag := True;
       Break;
      end;
     end
     else TreeList.Items[i].Values[Num] := TreeList.Items[i].Values[Num]
     + RoundTo(Deliver_Count * Multiplicator / TreeList.Items[i].Values[8], -6);

     if not Flag then Break;

     // Filling the objects for product

     ObjectRecord := GetObject(id_Point);

     if TreeList.Items[i].Values[6] and (ObjectRecord._id >= 0) then begin
      Flag := True;
      for j := 0 to TreeList.Items[i].Count - 1 do begin
       if (TreeList.Items[i].Items[j].Values[0] < -1)
       or (TreeList.Items[i].Items[j].Values[3] <> ObjectRecord._id) then Continue;

       if VarIsNull(TreeList.Items[i].Items[j].Values[Num]) then TreeList.Items[i].Items[j].Values[Num] := 0;
       TreeList.Items[i].Items[j].Values[Num] := TreeList.Items[i].Items[j].Values[Num]
       + RoundTo(Volume * Multiplicator / TreeList.Items[i].Values[8], -6);
       Flag := False;
      end;

      if Flag then begin
       Child := TreeList.Items[i].AddChild;

       Child.Values[0]  := -1;
       Child.Values[1]  := AddSpaces(ObjectRecord._Name);
       Child.Values[2]  := 0;
       Child.Values[3]  := ObjectRecord._id;
       Child.Values[10] := ObjectRecord._Order;

       Child.Values[Num] := RoundTo(Volume * Multiplicator / TreeList.Items[i].Values[8], -6);
      end;
     end;
    end;

    DataSet.Next;
   end;
  end;

  if Bool then begin
   Num := TreeList.ColumnByName('FQntCol_' + IntToStr(Fixed[f]._id_Stage)).ItemIndex;

   DataSet.Active := False;
   DataSet.SQLs.SelectSQL.Text := 'select * from PROC_DT_CONTRACT_ANALYSE_ALL('
   + #39 + DateToStr(Fixed[f]._Date_Beg) + #39 + ',' + #39 + DateToStr(Fixed[f]._Date_End)
   + #39 + ',' + IntToStr(id_Department) + ')';

   DataSet.Active := True;

   if DataSet.RecordCount = 0 then begin
    DataSet.Active := False;
    Continue;
   end;

   while not DataSet.Eof do begin
    Stage_Beg     := DataSet.FieldValues['STAGE_BEG'];
    Stage_End     := DataSet.FieldValues['STAGE_END'];
    Id_Product    := DataSet.FieldValues['ID_PRODUCT'];
    Id_Cat_Cust   := DataSet.FieldValues['ID_CAT_CUST'];
    Deliver_Count := DataSet.FieldValues['DELIVER_COUNT'] * DataSet.FieldValues['COEFFICIENT'];

    if not VarIsNull(DataSet.FieldValues['ID_POINT']) then begin
     id_Point      := DataSet.FieldValues['ID_POINT'];
     Volume        := DataSet.FieldValues['VOLUME'] * DataSet.FieldValues['COEFFICIENT'];
    end
    else id_Point := -1;

    if (Stage_Beg < Fixed[f]._Date_Beg) and (Stage_End > Fixed[f]._Date_Beg)
    and (Stage_End < Fixed[f]._Date_End)
    then Multiplicator := (Stage_End - Fixed[f]._Date_Beg)/(Stage_End - Stage_Beg)
    else
     if (Stage_Beg >= Fixed[f]._Date_Beg) and (Stage_End <= Fixed[f]._Date_End)
     then Multiplicator := 1
     else
      if (Stage_Beg < Fixed[f]._Date_End) and (Stage_End > Fixed[f]._Date_End)
      then Multiplicator := (Fixed[f]._Date_End - Stage_Beg)/(Stage_End - Stage_Beg)
      else
       if (Stage_Beg < Fixed[f]._Date_Beg) and (Stage_End > Fixed[f]._Date_End)
       then Multiplicator := (Fixed[f]._Date_End - Fixed[f]._Date_Beg)/(Stage_End - Stage_Beg);

    for i := 0 to TreeList.Count - 1 do begin
     if (TreeList.Items[i].Values[0] < 0)
     or (TreeList.Items[i].Values[0] <> Id_Product) then Continue;

     // Filling the Cat_Cust for product

     Flag := False;

     if TreeList.Items[i].Values[5] then begin
      for j := 0 to TreeList.Items[i].Count - 1 do begin
       if (TreeList.Items[i].Items[j].Values[0] < -1)
       or (TreeList.Items[i].Items[j].Values[2] <> Id_Cat_Cust) then Continue;

       TreeList.Items[i].Items[j].Values[Num] := TreeList.Items[i].Items[j].Values[Num]
       + RoundTo(Deliver_Count * Multiplicator / TreeList.Items[i].Values[8], -6);

       Flag := True;
       Break;
      end;
     end
     else TreeList.Items[i].Values[Num] := TreeList.Items[i].Values[Num]
     + RoundTo(Deliver_Count * Multiplicator / TreeList.Items[i].Values[8], -6);

     // Filling the objects for product

     if not Flag then Break;

     ObjectRecord := GetObject(id_Point);

     if TreeList.Items[i].Values[6] and (ObjectRecord._id >= 0) then begin
      Flag := True;
      for j := 0 to TreeList.Items[i].Count - 1 do begin
       if (TreeList.Items[i].Items[j].Values[0] < -1)
       or (TreeList.Items[i].Items[j].Values[3] <> ObjectRecord._id) then Continue;

       if VarIsNull(TreeList.Items[i].Items[j].Values[Num]) then TreeList.Items[i].Items[j].Values[Num] := 0;
       TreeList.Items[i].Items[j].Values[Num] := TreeList.Items[i].Items[j].Values[Num]
       + RoundTo(Volume * Multiplicator / TreeList.Items[i].Values[8], -6);
       Flag := False;
      end;

      if Flag then begin
       Child := TreeList.Items[i].AddChild;

       Child.Values[0]  := -1;
       Child.Values[1]  := AddSpaces(ObjectRecord._Name);
       Child.Values[2]  := 0;
       Child.Values[3]  := ObjectRecord._id;
       Child.Values[10] := ObjectRecord._Order;

       Child.Values[Num] := RoundTo(Volume * Multiplicator / TreeList.Items[i].Values[8], -6);
      end;
     end;
    end;

    DataSet.Next;
   end;
  end;
 end;
end;

procedure TPlanEditorForm.ProductTreeListEdited(Sender: TObject;
  AColumn: TcxTreeListColumn);
var
 i           : integer;
 id_Stage    : integer;
 id_Prod     : integer;
 id_Cat_Cust : integer;
 Name        : string;
 Num         : integer;
begin
 if ProductTreeList.FocusedNode.Values[AColumn.ItemIndex] <> EditValue then begin
  Name := ProductTreeList.FocusedColumn.Name;

  Num  := Pos('_', Name);

  id_Stage   := StrToInt(Copy(Name, Num + 1, Length(Name) - Num));

  if ProductTreeList.FocusedNode.Level = 0 then begin
   id_Prod     := ProductTreeList.FocusedNode.Values[0];
   id_Cat_Cust := 0;
  end
  else begin
   id_Prod     := ProductTreeList.FocusedNode.Parent.Values[0];
   id_Cat_Cust := ProductTreeList.FocusedNode.Values[2];
  end;

  for i := 0 to Length(Adjustments) - 1 do
   if (Adjustments[i]._id_Stage = id_Stage) and (Adjustments[i]._id_Product = id_Prod)
   and (Adjustments[i]._id_Cat_Cust = id_Cat_Cust) then DelAdjustment(i);
 end;

 CalcSumms(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
           GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]);
end;

procedure TPlanEditorForm.ProductTreeListEditing(Sender: TObject;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
var
 s        : string;
 i        : integer;
 Flag     : boolean;
 Num      : Integer;
 id_Stage : integer;
 Name     : string;
begin
 if ProductTreeList.FocusedNode.Values[0] < -1 then begin
  Allow := False;
  Exit;
 end;

 if ProductTreeList.FocusedNode.Level = 0 then
  if ProductTreeList.FocusedNode.Values[5] then begin
   Allow := False;
   Exit;
  end;

 Name := ProductTreeList.FocusedColumn.Name;
 s := Copy(Name, 0, 6);

 if s = 'QntCol' then Allow := True
 else if s = 'FQntCo' then begin
  Num  := Pos('_', Name);

  id_Stage := StrToInt(Copy(Name, Num + 1, Length(Name) - Num));

  Flag := True;
  for i := 0 to Length(TempStagesArray) - 1 do
   if TempStagesArray[i]._Link_To = id_Stage then begin
    Flag := False;
    Break;
   end;

  Allow := Flag;
 end
 else Allow := False;

 if Allow then EditValue := ProductTreeList.FocusedNode.Values[AColumn.ItemIndex];
end;

procedure TPlanEditorForm.GridDocFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
 i    : integer;
 Flag : boolean;
begin
 TreeListClearNodes(ProductTreeList);
 TreeListClearNodes(DepTreeList);

 if GridDoc.DataController.RecordCount = 0 then begin
  DelDocButton.Enabled  := False;
  EditDocButton.Enabled := False;
  AddDocButton.Enabled  := True;
  SignButton.Enabled    := False;
  Exit;
 end
 else begin
  DelDocButton.Enabled  := not(ApplyButton.Visible = ivAlways);
  EditDocButton.Enabled := not(ApplyButton.Visible = ivAlways);
  AddDocButton.Enabled  := False;
 end;

 if AFocusedRecord = nil then begin
  SignButton.Enabled    := False;
  Exit;
 end;

 SignButton.Enabled     := (AFocusedRecord.Values[8] <> 1) and (AFocusedRecord.Values[0] >= 0);
 pSignButton.Enabled    := (AFocusedRecord.Values[8] <> 1) and (AFocusedRecord.Values[0] >= 0);
 EditDocButton.Enabled  := (AFocusedRecord.Values[8] <> 1);
 pEditDocButton.Enabled := (AFocusedRecord.Values[8] <> 1);

 Caption := 'Редактор планів виробництва' + ' [' + Plan_Name + ']' + ' ['
 + AFocusedRecord.Values[2] + ']';

 ProductTreeList.Bands[2].Caption.Text := 'Вартість продукції, ' + AFocusedRecord.Values[6];
 if MainPlan then DepTreeList.Bands[2].Caption.Text := 'Вартість продукції, ' + AFocusedRecord.Values[6];

 Flag := False;
 for i := 0 to GridDoc.DataController.RecordCount - 1 do
  if GridDoc.DataController.Values[i, 0] = '-1'
  then begin
   Flag := True;
   Break;
  end;

 if Flag then
  AddDocButton.Enabled  := False
 else
  AddDocButton.Enabled  := True;

 if AFocusedRecord.Values[0] >= 0 then ProductTreeList.OptionsData.Editing := False
 else ProductTreeList.OptionsData.Editing := True;

 if GridDoc.Tag = 0 then begin
  if (AFocusedRecord.Values[0] = '-1') and (Length(NewFixedStages) > 0) then begin
   if PageControl.ActivePageIndex = 0 then
    MakeTreeList(NewStagesArray, NewFixedStages, AFocusedRecord.Values[0], DepTreeList)
   else
    MakeTreeList(NewStagesArray, NewFixedStages, AFocusedRecord.Values[0], ProductTreeList);
  end
  else if (AFocusedRecord.Values[0] >= 0) and (Length(FixedStages) > 0) then begin
   if PageControl.ActivePageIndex = 0 then
    MakeTreeList(StagesArray, FixedStages, AFocusedRecord.Values[0], DepTreeList)
   else
    MakeTreeList(StagesArray, FixedStages, AFocusedRecord.Values[0], ProductTreeList);
  end;

  if MainPlan then begin
   if PageControl.ActivePageIndex = 0 then begin
    if AFocusedRecord.Values[0] >= 0 then
     FillSummaryPlanByDeps(StagesArray, FixedStages, PlanDataArray, AFocusedRecord.Values[0])
    else
     FillSummaryPlanByDeps(NewStagesArray, NewFixedStages, NewPlanDataArray, AFocusedRecord.Values[0]);
   end
   else if PageControl.ActivePageIndex = 1 then begin
    if AFocusedRecord.Values[0] >= 0 then
     FillSummaryPlanByProduct(StagesArray, FixedStages, PlanDataArray, AFocusedRecord.Values[0])
    else
     FillSummaryPlanByProduct(NewStagesArray, NewFixedStages, NewPlanDataArray, AFocusedRecord.Values[0]);
   end
  end
  else begin
   if AFocusedRecord.Values[0] >= 0 then
    FillProductTreeList(False, StagesArray, FixedStages, PlanDataArray, AFocusedRecord.Values[0], AFocusedRecord.Values[7])
   else
    FillProductTreeList(True, NewStagesArray, NewFixedStages, NewPlanDataArray, -1, AFocusedRecord.Values[7]);
  end;
 end
 else begin
  if Length(TempFixedStages) > 0 then begin
   if (PageControl.ActivePageIndex = 0) and MainPlan then begin
    MakeTreeList(TempStagesArray, TempFixedStages, AFocusedRecord.Values[0], DepTreeList);
    FillSummaryPlanByDeps(TempStagesArray, TempFixedStages, TempPlanDataArray, AFocusedRecord.Values[0]);
   end
   else if MainPlan then begin
    MakeTreeList(TempStagesArray, TempFixedStages, AFocusedRecord.Values[0], ProductTreeList);
    FillSummaryPlanByProduct(TempStagesArray, TempFixedStages, TempPlanDataArray, AFocusedRecord.Values[0]);
   end
   else begin
    MakeTreeList(TempStagesArray, TempFixedStages, AFocusedRecord.Values[0], ProductTreeList);
    FillProductTreeList(False, TempStagesArray, TempFixedStages, TempPlanDataArray, AFocusedRecord.Values[0],
                        AFocusedRecord.Values[7]);
   end;
  end;
 end;

 GridDoc.Tag := 0;

end;

function TPlanEditorForm.CreatePrintArray(PageWidth, LeftSpace,
  RightSpace, BlockSpace : integer; Stages: TStagesNames): TPrintArray;
var
 DepCount     : integer;
 StagesCount  : integer;
 TempArray    : TPrintArray;
 ProdCount    : integer;
 CatCustCount : integer;
 ColCount     : integer;
 BlockCount   : integer;

 i, j, n, t   : integer;
 Dep          : TcxTreeListNode;
 Prod         : TcxTreeListNode;
 Cat          : TcxTreeListNode;

 k            : integer;
 d            : integer;
 p            : integer;

 ResArray     : TPrintArray;

 aLeft        : integer;
 aWidth       : integer;
 LastCol      : integer;

 Residual     : integer;  // Остатки

 procedure SetNullCells(InputArray : TPrintArray);
 var
  i, j : integer;
 begin
  for i := 0 to Length(InputArray) - 1 do
   for j := 0 to Length(InputArray[0]) - 1 do
    with InputArray[i, j] do
     if VarIsEmpty(_Value) then begin
      _Visible := (i mod (DepCount + 3) > 2) and ((_Left <> 0) or (_Top <> 0)); // Если хэдэр или лишняя ячейка, то прячем
      _Value   := '';
      _Width   := DefCellWidth;
      _Height  := DefCellHeight;
     end;
 end;

 function FindNode(id_Product, id_Cat_Cust : integer) : integer;
 var
  i, j : integer;
 begin
  Result := -1;

  for i := 0 to DepTreeList.Items[0].Count - 1 do begin
   if DepTreeList.Items[0].Items[i].Values[0] <> id_Product then Continue;

   if (DepTreeList.Items[0].Items[i].Count = 0) or (id_Cat_Cust < 0)
   then Result := DepTreeList.Items[0].Items[i].AbsoluteIndex
   else begin
    for j := 0 to DepTreeList.Items[0].Items[i].Count - 1 do begin
     if DepTreeList.Items[0].Items[i].Items[j].Values[2] <> id_Cat_Cust then Continue;

     Result := DepTreeList.Items[0].Items[i].Items[j].AbsoluteIndex;
     Break;
    end;
   end;

   Break;
  end;
 end;
begin
 DepCount    := DepTreeList.Count;
 ProdCount   := DepTreeList.Items[0].Count;
 StagesCount := Length(Stages);

 ColCount := 0;
 for i := 0 to DepTreeList.Items[0].Count - 1 do
  if DepTreeList.Items[0].Items[i].Count = 0 then Inc(ColCount)
  else Inc(ColCount, DepTreeList.Items[0].Items[i].Count + 1);

 TempArray := nil;
 SetLength(TempArray, DepCount + 3, ColCount * StagesCount + 1);

// Seting the header and first column of the TempArray

 with TempArray[0, 0] do begin
  _Visible := True;
  _Value   := 'Назва підрозділів';
  _Width   := ProdNameWidth;
  _Height  := 3 * DefCellHeight;
  _FStyle  := [fsBold];
 end;

 for i := 0 to DepTreeList.Items[0].Count - 1 do begin
  Prod := DepTreeList.Items[0].Items[i];

  k := (Prod.AbsoluteIndex - 1) * StagesCount + 1;

  with TempArray[0, k] do begin
   _Visible := True;
   _Value   := Prod.Values[1] + ', ' + Prod.Values[4];
   _Width   := (1 + Prod.Count) * StagesCount * DefCellWidth;
   _Height  := DefCellHeight;
   _FStyle  := [fsBold];
  end;

  if Prod.HasChildren then begin
   with TempArray[1, k] do begin
    _Visible := True;
    _Value   := 'Разом';
    _Width   := StagesCount * DefCellWidth;
    _Height  := DefCellHeight;
    _FStyle  := [fsItalic];
   end;

   for j := 0 to StagesCount - 1 do begin
    with TempArray[2, k + j] do begin
     _Visible := True;
     _Value   := Stages[j]._Name;
     _Width   := DefCellWidth;
     _Height  := DefCellHeight;
     _FStyle  := [];
    end;
   end;
  end else begin
   for j := 0 to StagesCount - 1 do begin
    with TempArray[1, k + j] do begin
     _Visible := True;
     _Value   := Stages[j]._Name;
     _Width   := DefCellWidth;
     _Height  := 2 * DefCellHeight;
     _FStyle  := [];
    end;
   end;
  end;

  for j := 0 to Prod.Count - 1 do begin
   Cat := Prod.Items[j];

   with TempArray[1, k + (j + 1) * StagesCount] do begin
    _Visible := True;
    _Value   := Cat.Values[1];
    _Width   := StagesCount * DefCellWidth;
    _Height  := DefCellHeight;
    _FStyle  := [fsItalic];
   end;

   for n := 0 to StagesCount - 1 do begin
    with TempArray[2, k + (j + 1) * StagesCount + n] do begin
     _Visible := True;
     _Value   := Stages[n]._Name;
     _Width   := DefCellWidth;
     _Height  := DefCellHeight;
     _FStyle  := [];
    end;
   end;
  end;
 end;

// Seting the data of the TempArray

 for i := 0 to DepTreeList.Count - 1 do begin
  Dep := DepTreeList.Items[i];

  with TempArray[3 + i, 0] do begin
   _Visible := True;
   _Value   := Dep.Values[1];
   _Width   := ProdNameWidth;
   _Height  := DefCellHeight;
  end;

  for j := 0 to Dep.Count - 1 do begin
   Prod := Dep.Items[j];

   if Prod.AbsoluteIndex < DepTreeList.Items[1].AbsoluteIndex - 1 then
    k := (Prod.AbsoluteIndex - 1) * StagesCount + 1
   else
    k := (FindNode(Prod.Values[0], -1) - 1) * StagesCount + 1;

   for t := 0 to StagesCount - 1 do begin
    with TempArray[3 + i, k + t] do begin
     _Visible := True;
     _Value   := Prod.Values[Stages[t]._Col_Num];
     _Width   := DefCellWidth;
     _Height  := DefCellHeight;
    end;
   end;


   for n := 0 to Prod.Count - 1 do begin
    Cat := Prod.Items[n];

    k := (FindNode(Prod.Values[0], Cat.Values[2]) - 1) * StagesCount + 1;

    for t := 0 to StagesCount - 1 do begin
     with TempArray[3 + i, k + t] do begin
      _Visible := True;
      _Value   := Cat.Values[Stages[t]._Col_Num];
      _Width   := DefCellWidth;
      _Height  := DefCellHeight;
     end;
    end;
   end;
  end;
 end;


// Filling ResultArray


 ColCount   := (PageWidth - ProdNameWidth) div DefCellWidth + 1;
 k := ((Length(TempArray[0]) - 1) * DefCellWidth) div ((ColCount -  1) * DefCellWidth);
 if k * (ColCount -  1) * DefCellWidth = (Length(TempArray[0]) - 1) * DefCellWidth then
  BlockCount := k
 else BlockCount := k + 1;

 ResArray := nil;
 SetLength(ResArray, BlockCount * Length(TempArray), ColCount);

 Residual := 0;

 for i := 0 to Length(ResArray) - 1 do begin
  for j := 0 to Length(ResArray[i]) - 1 do begin
   if j = 0 then begin
    if i < DepCount + 3 then begin
     ResArray[i, j]      := TempArray[i, j];
     ResArray[i, j]._Top := TopSpace + i * DefCellHeight;
    end
    else begin
     ResArray[i, j]      := TempArray[i mod (DepCount + 3), j];
     ResArray[i, j]._Top := TopSpace + (i div (DepCount + 3)) * (BlockSpace + DefCellHeight * (DepCount + 3))
                            + (i mod (DepCount + 3)) * DefCellHeight;
    end;

    ResArray[i, j]._Left := LeftSpace;
   end
   else begin
    if i < DepCount + 3 then begin
     ResArray[i, j]       := TempArray[i, j];
     ResArray[i, j]._Top  := TopSpace + i * DefCellHeight;
     ResArray[i, j]._Left := LeftSpace + ProdNameWidth + (j - 1) * DefCellWidth;

     if ResArray[i, j]._Left + ResArray[i, j]._Width > LeftSpace + PageWidth then begin
      ResArray[i, j]._Width := LeftSpace + PageWidth - ResArray[i, j]._Left;
      ResArray[i, j]._Width := (ResArray[i, j]._Width div DefCellWidth) * DefCellWidth;
     end;
    end
    else begin
     k := j + (ColCount - 1) * (i div (DepCount + 3));

     if k >= Length(TempArray[0]) then Continue;

     n := 0;
     if (j = 1) and (i mod (DepCount + 3) < 2) then
      while TempArray[i mod (DepCount + 3), k]._Value = '' do begin
       Inc(n);
       Dec(k);
      end;

     ResArray[i, j]         := TempArray[i mod (DepCount + 3), k];
     ResArray[i, j]._Left   := LeftSpace + ProdNameWidth + (j - 1) * DefCellWidth;
     ResArray[i, j]._Top    := TopSpace + (i div (DepCount + 3)) * (BlockSpace + DefCellHeight * (DepCount + 3))
                              + (i mod (DepCount + 3)) * DefCellHeight;

     if ResArray[i, j]._Height = 0 then ResArray[i, j]._Height := DefCellHeight;

     ResArray[i, j]._Width  := ResArray[i, j]._Width - n * DefCellWidth;

     if ResArray[i, j]._Left + ResArray[i, j]._Width > LeftSpace + PageWidth then begin
      ResArray[i, j]._Width := LeftSpace + PageWidth - ResArray[i, j]._Left;
      ResArray[i, j]._Width := (ResArray[i, j]._Width div DefCellWidth) * DefCellWidth;
     end;
    end;
   end;

   if (ResArray[i, j]._Top + ResArray[i, j]._Height) > PageBottom then begin
    if ResArray[i, j]._Top < PageBottom then begin
     if j = 0 then Residual := Residual + (PageBottom - ResArray[i, j]._Top);
     ResArray[i, j]._Top := Residual - (PageBottom - ResArray[i, j]._Top);
    end
    else begin
     ResArray[i, j]._Top := ResArray[i, j]._Top mod PageBottom;
     ResArray[i, j]._Top := ResArray[i, j]._Top + Residual;
    end;

    ResArray[i, j]._Top := ResArray[i, j]._Top + PageTop;//*(c + 1);
   end;
  end;
 end;

 SetNullCells(ResArray);

 Result := nil;
 Result := ResArray;
// Result := TempArray;
end;

procedure TPlanEditorForm.DepTreeListClick(Sender: TObject);
begin
// Text := IntToStr(DepTreeList.FocusedColumn.VisibleIndexAtBand);
end;

procedure TPlanEditorForm.ReportBeginDocComplicated;
var
 Page : TfrPage;
begin
 Page := Report.Pages[0];

 if FirstPrint then begin
  Page.pgMargins.Left   := SYS_LEFT ;
  Page.pgMargins.Right  := SYS_RIGHT;
  Page.pgMargins.Top    := SYS_TOP;
  Page.pgMargins.Bottom := SYS_BOTTOM;

  FirstPrint := False;
 end
 else begin
  SYS_LEFT   := Page.pgMargins.Left;
  SYS_RIGHT  := Page.pgMargins.Right;
  SYS_TOP    := Page.pgMargins.Top;
  SYS_BOTTOM := Page.pgMargins.Bottom;
 end;

 LeftSpace  := Page.pgMargins.Left;
 RightSpace := Page.pgMargins.Right;

 PageWidth  := (Page.pgWidth * 18 div 50) - Page.pgMargins.Left
              - Page.pgMargins.Right;

 PageBottom := (Page.pgHeight * 18 div 50) - Page.pgMargins.Bottom;

 PageTop    := Page.pgMargins.Top;

 PrintArray := nil;
 PrintArray := CreatePrintArray(PageWidth, LeftSpace, RightSpace, OffSetY, StagesNames);

 RowDataset.RangeEnd      := reCount;
 RowDataset.RangeEndCount := Length(PrintArray);

 ColDataset.RangeEnd      := reCount;
 ColDataset.RangeEndCount := Length(PrintArray[0]);
end;

procedure TPlanEditorForm.ReportBeginDocSimple;
var
 Page : TfrPage;
begin
 Report.Dictionary.Variables['OnYearVisible'] := not YearPlan;

 Page := Report.Pages[0];

 if FirstPrint then begin
  Page.pgMargins.Left   := SYS_LEFT ;
  Page.pgMargins.Right  := SYS_RIGHT;
  Page.pgMargins.Top    := SYS_TOP;
  Page.pgMargins.Bottom := SYS_BOTTOM;

  FirstPrint := False;
 end
 else begin
  SYS_LEFT   := Page.pgMargins.Left;
  SYS_RIGHT  := Page.pgMargins.Right;
  SYS_TOP    := Page.pgMargins.Top;
  SYS_BOTTOM := Page.pgMargins.Bottom;
 end;

 PageWidth := (Page.pgWidth * 18) div 50;
 CellWidth := (PageWidth - Page.pgMargins.Left - Page.pgMargins.Right - 144 - 50) div (ColDataset.RangeEndCount - 2);

 Report.Dictionary.Variables['HeaderLeft']       := Page.pgMargins.Left;
 Report.Dictionary.Variables['Header1Width']     := 144 + 50;
 Report.Dictionary.Variables['PrintDateVisible'] := PrintDate.Down;

 Report.Dictionary.Variables['Header2Width'] := CellWidth * NatCount;
 Report.Dictionary.Variables['Header3Width'] := CellWidth * CostCount;


 TfrMemoView(Report.FindObject('Memo1')).Font := PrintFont;
 TfrMemoView(Report.FindObject('Memo2')).Font := PrintFont;
 TfrMemoView(Report.FindObject('Memo3')).Font := PrintFont;
 TfrMemoView(Report.FindObject('Memo4')).Font := PrintFont;
 TfrMemoView(Report.FindObject('Memo5')).Font := PrintFont;
 TfrMemoView(Report.FindObject('Memo6')).Font := PrintFont;
 TfrMemoView(Report.FindObject('Memo7')).Font := PrintFont;
 TfrMemoView(Report.FindObject('Memo8')).Font := PrintFont;
 TfrMemoView(Report.FindObject('Memo9')).Font := PrintFont;
end;

procedure TPlanEditorForm.EditObject;
var
 opt         : TSpravOptions;
 Result      : TResultArray;

 id_Object   : integer;
 Name_Object : string;
 
 i           : integer;
begin
 if not ProductTreeList.FocusedNode.Parent.Values[5] then Exit;
 if ProductTreeList.FocusedNode.Values[3] <= 0 then Exit;
 if ProductTreeList.FocusedNode.Values[3] <= 0 then Exit;

 opt.canAdd      := true;
 opt.canEdit     := true;
 opt.canDelete   := true;
 opt.canSelect   := true;
 opt.HideButtons := false;
 opt.isModal     := true;

 sp_Object_Form.PanelVisible := False;
 Result := sp_Object_Form1.tagShow(opt);
 if Length(Result) > 0 then begin
  id_Object   := Result[0];
  Name_Object := Result[1];
 end
 else Exit;

 if ProductTreeList.FocusedNode.Values[3] = id_Object then Exit;

 for i := 0 to ProductTreeList.FocusedNode.Parent.Count - 1 do begin
  if ProductTreeList.FocusedNode.Parent.Items[i].Focused then Continue;
  if ProductTreeList.FocusedNode.Parent.Items[i].Values[0] < -1 then Continue;
  if ProductTreeList.FocusedNode.Parent.Items[i].Values[3] = id_Object then begin
   ShowMessage('Не можна двічі додавати обраний об''єкт постачання до списку об''єктів постачання цієї продукції!');
   Exit;
  end;
 end;


 ProductTreeList.FocusedNode.Values[1] := AddSpaces(Name_Object);
 ProductTreeList.FocusedNode.Values[3] := id_Object;
end;

procedure TPlanEditorForm.Analyze_SP_Result(var SP_Result: TSP_Result;
  ADate_Beg, ADate_End: TDate);
var
 i         : integer;
 TempArray : TSP_Result;
begin
 TempArray := nil;
 if Length(SP_Result) = 0 then Exit;

 if SP_Result[0]._Date_Beg > ADate_Beg then begin
  SetLength(TempArray, 1);
  with TempArray[0] do begin
   _Cost := 0;
   _Date_Beg := ADate_Beg;
   _Date_End := SP_Result[0]._Date_Beg - 1;
  end;
 end;

 SetLength(TempArray, Length(TempArray) + 1);
 TempArray[Length(TempArray) - 1] := SP_Result[0];

 for i := 1 to Length(SP_Result) - 1 do begin
  if SP_Result[i - 1]._Date_End + 1 < SP_Result[i]._Date_Beg then begin
   SetLength(TempArray, Length(TempArray) + 1);
   with TempArray[Length(TempArray) - 1] do begin
    _Cost := 0;
    _Date_Beg := SP_Result[i - 1]._Date_End + 1;
    _Date_End := SP_Result[i]._Date_Beg - 1;
   end;
  end;

  SetLength(TempArray, Length(TempArray) + 1);
  TempArray[Length(TempArray) - 1] := SP_Result[i];
 end;

 if SP_Result[Length(SP_Result) - 1]._Date_End < ADate_End then begin
  SetLength(TempArray, Length(TempArray) + 1);
  with TempArray[Length(TempArray) - 1] do begin
   _Cost := 0;
   _Date_Beg := SP_Result[Length(SP_Result) - 1]._Date_End + 1;
   _Date_End := ADate_End;
  end;
 end;

 SP_Result := nil;
 SP_Result := Copy(TempArray, 0, Length(TempArray));
end;

procedure TPlanEditorForm.SetCostBeg(AFixed, AStages: TStagesArray;
  APlanData: TPlanDataArray);
var
 i, j, n, t   : integer;
 ProductArray : TProductArray;
 LastCost     : Currency;
 Flag         : boolean;
begin
 for t := 0 to Length(APlanData) - 1 do begin

  Flag := True;
  for i := 0 to Length(ProductArray) - 1 do
   if (APlanData[t]._id_Product = ProductArray[i]._id_Product)
   and (APlanData[t]._id_Cat_Cust = ProductArray[i]._id_Cat_Cust) then begin
    Flag := False;
    Break;
   end;

  if Flag then begin
   SetLength(ProductArray, Length(ProductArray) + 1);

   with ProductArray[Length(ProductArray) - 1] do begin
    _id_Product  := APlanData[t]._id_Product;
    _id_Cat_Cust := APlanData[t]._id_Cat_Cust;
   end;
  end;
 end;

 for i := 0 to Length(ProductArray) - 1 do begin
  LastCost := -1;
  for n := 0 to Length(AFixed) - 1 do begin
   Flag := True;
   for j := 0 to Length(AStages) - 1 do begin
    if AStages[j]._Link_To <> AFixed[n]._id_Stage then Continue;

    Flag := False;

    for t := 0 to Length(APlanData) - 1 do
     if (APlanData[t]._id_Stage = AStages[j]._id_Stage)
     and (APlanData[t]._id_Product = ProductArray[i]._id_Product)
     and (APlanData[t]._id_Cat_Cust = ProductArray[i]._id_Cat_Cust)
     and (APlanData[t]._id_Object <= 0)
     and (APlanData[t]._Cost <> LastCost) then begin
      LastCost := APlanData[t]._Cost;
      AStages[j]._isItCostBeg := True;
      Break;
     end;
   end;

   if Flag then begin
    for t := 0 to Length(APlanData) - 1 do
     if  (APlanData[t]._id_Stage = AFixed[n]._id_Stage)
     and (APlanData[t]._id_Product = ProductArray[i]._id_Product)
     and (APlanData[t]._id_Cat_Cust = ProductArray[i]._id_Cat_Cust)
     and (APlanData[t]._id_Object <= 0)
     and (APlanData[t]._Cost <> LastCost) then begin
      LastCost := APlanData[t]._Cost;
      AFixed[n]._isItCostBeg := True;
      Break;
     end;
   end;
  end;
 end;
end;

{procedure TPlanEditorForm.RowDatasetNext(Sender: TObject);
var
 MemoRecord : TPrintRecord;
 Memo       : TfrMemoView;
 k          : integer;
begin
 MemoRecord   := PrintArray[RowDataset.RecNo, ColDataset.RecNo];

 k := (MemoRecord._Top + MemoRecord._Height) div PageBottom;
 while Report.Pages.Count < (k + 1) do Report.Pages.Add;

 Memo         := TfrMemoView(Report.FindObject('Memo1'));

 Memo.ParentPage := Report.Pages[k];

// Report.Dictionary.Variables['PageName'] := s;
end;}

procedure TPlanEditorForm.DepTreeListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
var
 Name : string;
begin
 if AViewInfo.Node.Focused then Exit;

 Name := AViewInfo.Column.Name;

 if (Copy(Name, 0, 6) = 'PriceC')
 and not VarIsNull(AViewInfo.Node.Values[AViewInfo.Column.ItemIndex])  then begin
  ACanvas.Brush.Color := $D8FFD0;  //Green
  Exit;
 end;

 if AViewInfo.Node.Level = 0 then begin
  ACanvas.Brush.Color := clBtnFace;
  Exit;
 end
 else if (AViewInfo.Node.Level = 1) then begin
  ACanvas.Brush.Color := $00FDEAD7; //Blue
  Exit;
 end;
end;

procedure TPlanEditorForm.ProductTreeListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
var
 NameCol  : string;
 i        : integer;
 s        : string;
 id_Stage : integer;
begin
 if AViewInfo.Node.Focused then Exit;

 NameCol := AViewInfo.Column.Name;

 if (Copy(NameCol, 0, 6) = 'PriceC')
 and not VarIsNull(AViewInfo.Node.Values[AViewInfo.Column.ItemIndex])  then begin
  ACanvas.Brush.Color := $D8FFD0;  //Green
  Exit;
 end;

 s := Copy(NameCol, 0, 6);
 if ((s = 'QntCol') or (s = 'FQntCo')) and ((AViewInfo.Node.Level = 0) or AViewInfo.Node.Values[2] > 0) then begin
  if s = 'QntCol' then
   id_Stage := StrToInt(Copy(NameCol, 8, Length(NameCol) - 7))
  else
   id_Stage := StrToInt(Copy(NameCol, 9, Length(NameCol) - 8));

  for i := 0 to Length(Adjustments) - 1 do
   if (Adjustments[i]._id_Stage = id_Stage) and (Adjustments[i]._id_Product = AViewInfo.Node.Parent.Values[0])
   and (Adjustments[i]._id_Cat_Cust = AViewInfo.Node.Values[2]) then begin
    ACanvas.Brush.Color := $7799ff; // Orange
    Exit;
   end;
 end;

 if AViewInfo.Node.Level = 0 then begin
  ACanvas.Brush.Color := $00EBC4A4; //Blue
  Exit;
 end;
end;

procedure TPlanEditorForm.SignButtonClick(Sender: TObject);
var
 i, k, j, t   : integer;
 Cat_Cust_Sum : Currency;
 Object_Sum   : Currency;
 s            : string;
begin
 k := GridDoc.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

{ if GridDoc.DataController.Values[k, 0] = 1 then begin
  if MessageDlg('Підписування', 'Ви дійсно бажаєте вилучити підпис з обраного документу?',
     mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_DT_PLAN_DOC_SIGN', [GridDoc.DataController.Values[k, 0]]);
  StoredProc.Transaction.Commit;
 end}

 // Checking cat_cust's and object's summs

 t := LAST_COL + 1;
 while (t < ProductTreeList.ColumnCount) do begin
  s := Copy(ProductTreeList.Columns[t].Name, 0, 6);
  if (s <> 'QntCol') and (s <> 'FQntCo') then begin
   Inc(t);
   if t >= ProductTreeList.ColumnCount then
    Break
   else
    Continue;
  end;

  for i := 0 to ProductTreeList.Count - 1 do begin
   if ProductTreeList.Items[i].Values[0] < -1 then Continue;
   if not ProductTreeList.Items[i].Values[6] then Continue;
   if not ProductTreeList.Items[i].Values[5] then
    Cat_Cust_Sum := ProductTreeList.Items[i].Values[t]
   else
    Cat_Cust_Sum := 0;

   Object_Sum   := 0;
   for j := 0 to ProductTreeList.Items[i].Count - 1 do begin
    if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;
    if (ProductTreeList.Items[i].Items[j].Values[2] > 0) and ProductTreeList.Items[i].Values[5] then
     Cat_Cust_Sum := Cat_Cust_Sum + ProductTreeList.Items[i].Items[j].Values[t]
    else if ProductTreeList.Items[i].Items[j].Values[3] > 0 then
     Object_Sum := Object_Sum + ProductTreeList.Items[i].Items[j].Values[t];
   end;
   if Cat_Cust_Sum <> Object_Sum then begin
    ShowMessage('Сумарна кількість продукції ' + #39 + ProductTreeList.Items[i].Values[1]
    + #39 + ' по категоріям споживачів у періоді ' + #39 + ProductTreeList.Columns[t].Caption.Text
    + #39 +  ' повинна бути рівною сумарній кількості продукції по об''єктам водопосточання!'
    + #13 + #13 + 'Підписування неможливе!');
    Exit;
   end;
  end;
  Inc(t);
 end;

 // Signing

 if MessageDlg('Підписування', 'Ви дійсно бажаєте підписати обраний документ?',
    mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_DT_PLAN_DOC_SIGN', [GridDoc.DataController.Values[k, 0]]);
 StoredProc.Transaction.Commit;

 RefreshData;
end;

{procedure TPlanEditorForm.AddButtonClick(Sender: TObject);
begin
 if (ProductTreeList.FocusedNode = nil)
 or (ProductTreeList.FocusedNode.Level = 0)
 or (ProductTreeList.FocusedNode.Values[0] < -1) then AddProductButtonClick(Sender)
 else if ProductTreeList.FocusedNode.Level = 1 then
  if ProductTreeList.FocusedNode.Values[2] > 0 then AddProductButtonClick(Sender)
  else if ProductTreeList.FocusedNode.Values[3] > 0 then AddObjectButtonClick(Sender);
end;}

procedure TPlanEditorForm.SetAdjustments(InFixed, InStages: TStagesArray;
  id_Doc, Coefficient: integer);
var
 k          : integer;
 i, j, t    : integer;
 Bool       : boolean;
 QIndex     : integer;
 PIndex     : integer;
 CIndex     : integer;

 MaxValue   : currency;
 MaxNum     : integer;

 Sum        : currency; // Sum of not rounded costs
 RSum       : currency; // Sum of rounded costs
 AdjValue   : currency;

 OldVolume  : currency;
 NewCost    : currency;
 Price      : currency;

 function FindNewVolume(TempVolume : currency) : string;
 var
  Res  : currency;
  k    : currency;
  Flag : boolean;
 begin
  Res := RoundTo(TempVolume, -1*RoundCountQ);

  if (FloatToCurr(RoundTo(Res*Price, -1*RoundCountC)) <> NewCost)
  or (RoundTo((Res - OldVolume)*Price + Sum, -1*RoundCountC) <> RoundTo(Sum, -1*RoundCountC)) then begin
   k := 1/Power(10, RoundCountQ);
   Flag := False;
   while (Res + k)*Price <= NewCost + 1 do
    if RoundTo((Res + k)*Price, -1*RoundCountC) = NewCost then begin
     Flag := True;
     Res  := Res + k;
     Break;
    end
    else k := k + 1/Power(10, RoundCountQ);

   if (RoundTo((Res - OldVolume)*Price + Sum, -1*RoundCountC) <> RoundTo(Sum, -1*RoundCountC)) then Flag := False;

   if not Flag then begin
    Res := RoundTo(TempVolume, -1*RoundCountQ);
    k   := -1/Power(10, RoundCountQ);
    while (Res + k)*Price >= NewCost - 1 do
     if RoundTo((Res + k)*Price, -1*RoundCountC) = NewCost then begin
      Res  := Res + k;
      Break;
     end
     else k := k - 1/Power(10, RoundCountQ);
   end;
  end;

  if (RoundTo((Res - OldVolume)*Price + Sum, -1*RoundCountC) <> RoundTo(Sum, -1*RoundCountC)) then Res := OldVolume;

  Result := RoundValueQ(Res);
 end;
begin
 Adjustments := nil;

 for t := 0 to Length(InFixed) - 1 do begin
  if InFixed[t]._id_Doc <> id_Doc then Exit;

  Bool := True;

  for k := 0 to Length(InStages) - 1 do begin
   if InStages[k]._Link_To <> InFixed[t]._id_Stage then Continue;
   Bool := False;

   QIndex := ProductTreeList.ColumnByName('QntCol_' + IntToStr(InStages[k]._id_Stage)).ItemIndex;
   CIndex := ProductTreeList.ColumnByName('CostCol_' + IntToStr(InStages[k]._id_Stage)).ItemIndex;

   PIndex := ProductTreeList.Columns[QIndex].VisibleIndexAtBand;
   while PIndex < ProductTreeList.Bands[1].VisibleColumnCount do begin
    if Copy(ProductTreeList.Bands[1].VisibleColumns[PIndex].Name, 0, 6) <> 'PriceC' then inc(PIndex)
    else Break;
   end;

   if Copy(ProductTreeList.Bands[1].VisibleColumns[PIndex].Name, 0, 6) <> 'PriceC' then Continue;

   PIndex := ProductTreeList.Bands[1].VisibleColumns[PIndex].ItemIndex;

   for i := 0 to ProductTreeList.Count - 1 do begin
    if ProductTreeList.Items[i].Values[0] < -1 then Continue;
    if ProductTreeList.Items[i].Items[j].Values[2] <= 0 then Continue;

    if ProductTreeList.Items[i].Values[5] then begin
     Sum      := 0;
     RSum     := 0;
     MaxValue := 0;
     MaxNum   := -1;

     for j := 0 to ProductTreeList.Items[i].Count - 1 do begin
      if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;

      if ProductTreeList.Items[i].Items[j].Values[QIndex] > MaxValue then begin
       MaxNum   := j;
       MaxValue := ProductTreeList.Items[i].Items[j].Values[QIndex];
      end;

      Sum  := Sum  + ProductTreeList.Items[i].Items[j].Values[QIndex] * ProductTreeList.Items[i].Items[j].Values[PIndex];
      RSum := RSum + ProductTreeList.Items[i].Items[j].Values[CIndex];
     end;

     if MaxNum < 0 then Continue;

//     Sum := RoundTo(Sum, -1*RoundCountC);

     if FloatToCurr(RoundTo(Sum, -1*RoundCountC)) <> RSum then begin
      NewCost := ProductTreeList.Items[i].Items[MaxNum].Values[CIndex] - RSum + RoundTo(Sum, -1*RoundCountC);
      Price   := ProductTreeList.Items[i].Items[MaxNum].Values[PIndex];

      AdjValue := ProductTreeList.Items[i].Items[MaxNum].Values[QIndex];

      OldVolume := ProductTreeList.Items[i].Items[MaxNum].Values[QIndex];
      ProductTreeList.Items[i].Items[MaxNum].Values[QIndex] :=
      FindNewVolume(NewCost * ProductTreeList.Items[i].Values[8] / Price / Coefficient);

      AdjValue := ProductTreeList.Items[i].Items[MaxNum].Values[QIndex] - AdjValue;

      if ProductTreeList.Items[i].Items[MaxNum].Values[QIndex] = OldVolume then Continue;

      SetLength(Adjustments, Length(Adjustments) + 1);
      with Adjustments[Length(Adjustments) - 1] do begin
       _id_Stage    := InStages[k]._id_Stage;
       _id_Product  := ProductTreeList.Items[i].Values[0];
       _id_Cat_Cust := ProductTreeList.Items[i].Items[MaxNum].Values[2];
       _Volume      := AdjValue;
      end;
     end;
    end;
   end;
  end;

  if Bool then begin
   QIndex := ProductTreeList.ColumnByName('FQntCol_' + IntToStr(InFixed[t]._id_Stage)).ItemIndex;
   CIndex := ProductTreeList.ColumnByName('FCostCol_' + IntToStr(InFixed[t]._id_Stage)).ItemIndex;

   PIndex := ProductTreeList.Columns[QIndex].VisibleIndexAtBand;
   while PIndex < ProductTreeList.Bands[1].VisibleColumnCount do begin
    if Copy(ProductTreeList.Bands[1].VisibleColumns[PIndex].Name, 0, 6) <> 'PriceC' then inc(PIndex)
    else Break;
   end;

   if Copy(ProductTreeList.Bands[1].VisibleColumns[PIndex].Name, 0, 6) <> 'PriceC' then Continue;

   PIndex := ProductTreeList.Bands[1].VisibleColumns[PIndex].ItemIndex;

   for i := 0 to ProductTreeList.Count - 1 do begin
    if ProductTreeList.Items[i].Values[0] < -1 then Continue;

    if ProductTreeList.Items[i].Values[5] then begin
     Sum      := 0;
     RSum     := 0;
     MaxValue := 0;
     MaxNum   := -1;

     for j := 0 to ProductTreeList.Items[i].Count - 1 do begin
      if ProductTreeList.Items[i].Items[j].Values[0] < -1 then Continue;
      if ProductTreeList.Items[i].Items[j].Values[2] <= 0 then Continue;

      if ProductTreeList.Items[i].Items[j].Values[QIndex] > MaxValue then begin
       MaxNum   := j;
       MaxValue := ProductTreeList.Items[i].Items[j].Values[QIndex];
      end;

      Sum  := Sum  + ProductTreeList.Items[i].Items[j].Values[QIndex] * ProductTreeList.Items[i].Items[j].Values[PIndex];
      RSum := RSum + ProductTreeList.Items[i].Items[j].Values[CIndex];
     end;

     if MaxNum < 0 then Continue;

//     Sum := RoundTo(Sum, -1*RoundCountC);


     if FloatToCurr(RoundTo(Sum, -1*RoundCountC)) <> RSum then begin
      NewCost  := ProductTreeList.Items[i].Items[MaxNum].Values[CIndex] - RSum + RoundTo(Sum, -1*RoundCountC);
      Price    := ProductTreeList.Items[i].Items[MaxNum].Values[PIndex];
      AdjValue := ProductTreeList.Items[i].Items[MaxNum].Values[QIndex];

      OldVolume := ProductTreeList.Items[i].Items[MaxNum].Values[QIndex];
      ProductTreeList.Items[i].Items[MaxNum].Values[QIndex] :=
      FindNewVolume(NewCost * ProductTreeList.Items[i].Values[8] / Price / Coefficient);

      AdjValue := ProductTreeList.Items[i].Items[MaxNum].Values[QIndex] - AdjValue;

      if ProductTreeList.Items[i].Items[MaxNum].Values[QIndex] = OldVolume then Continue;

      SetLength(Adjustments, Length(Adjustments) + 1);
      with Adjustments[Length(Adjustments) - 1] do begin
       _id_Stage    := InFixed[t]._id_Stage;
       _id_Product  := ProductTreeList.Items[i].Values[0];
       _id_Cat_Cust := ProductTreeList.Items[i].Items[MaxNum].Values[2];
       _Volume      := AdjValue;
      end;
     end;
    end;
   end;
  end;
 end;

 CalcSumms(TempStagesArray, TempFixedStages, GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 0],
           GridDoc.DataController.Values[GridDoc.DataController.FocusedRowIndex, 7]); 
end;

procedure TPlanEditorForm.AdjustButtonClick(Sender: TObject);
var
 k : integer;
begin
 k := GridDoc.DataController.FocusedRowIndex;
 if k < 0 then Exit;

 SetAdjustments(TempFixedStages, TempStagesArray, GridDoc.DataController.Values[k, 0],
 GridDoc.DataController.Values[k, 7]);
end;

procedure TPlanEditorForm.ProductTreeListFocusedColumnChanged(
  Sender: TObject; APrevFocusedColumn, AFocusedColumn: TcxTreeListColumn);
var
 i : integer;
 NameCol : string;
 s       : string;
 id_Stage : integer;
begin
 StatusBar1.Panels[1].Text := 'Поправка:';
 StatusBar1.Panels[1].PanelStyle.Font.Style := [];

 if AFocusedColumn = nil then Exit;

 NameCol := AFocusedColumn.Name;

 s := Copy(NameCol, 0, 6);
 if ((s = 'QntCol') or (s = 'FQntCo')) and ((ProductTreeList.FocusedNode.Level = 0) or (ProductTreeList.FocusedNode.Values[2] > 0)) then begin
  if s = 'QntCol' then
   id_Stage := StrToInt(Copy(NameCol, 8, Length(NameCol) - 7))
  else
   id_Stage := StrToInt(Copy(NameCol, 9, Length(NameCol) - 8));

  for i := 0 to Length(Adjustments) - 1 do
   if (Adjustments[i]._id_Stage = id_Stage) and (Adjustments[i]._id_Product = ProductTreeList.FocusedNode.Parent.Values[0])
   and (Adjustments[i]._id_Cat_Cust = ProductTreeList.FocusedNode.Values[2]) then begin
    if Adjustments[i]._Volume > 0 then StatusBar1.Panels[1].Text := 'Поправка:+' + FloatToStr(Adjustments[i]._Volume)
    else StatusBar1.Panels[1].Text := 'Поправка:' + FloatToStr(Adjustments[i]._Volume);

    StatusBar1.Panels[1].PanelStyle.Font.Style := [fsBold];
    Exit;
   end;
 end;
end;

procedure TPlanEditorForm.ProductTreeListFocusedNodeChanged(
  Sender: TObject; APrevFocusedNode, AFocusedNode: TcxTreeListNode);
var
 i : integer;
 NameCol : string;
 s       : string;
 id_Stage : integer;
begin
 StatusBar1.Panels[1].Text := 'Поправка:';
 StatusBar1.Panels[1].PanelStyle.Font.Style := [];

 if AFocusedNode = nil then Exit;
 if ProductTreeList.FocusedColumn = nil then Exit;

 NameCol := ProductTreeList.FocusedColumn.Name;

 s := Copy(NameCol, 0, 6);
 if ((s = 'QntCol') or (s = 'FQntCo')) and ((AFocusedNode.Level = 0) or (AFocusedNode.Values[2] > 0)) then begin
  if s = 'QntCol' then
   id_Stage := StrToInt(Copy(NameCol, 8, Length(NameCol) - 7))
  else
   id_Stage := StrToInt(Copy(NameCol, 9, Length(NameCol) - 8));

  for i := 0 to Length(Adjustments) - 1 do
   if (Adjustments[i]._id_Stage = id_Stage) and (Adjustments[i]._id_Product = AFocusedNode.Parent.Values[0])
   and (Adjustments[i]._id_Cat_Cust = AFocusedNode.Values[2]) then begin
    if Adjustments[i]._Volume > 0 then StatusBar1.Panels[1].Text := 'Поправка:+' + FloatToStr(Adjustments[i]._Volume)
    else StatusBar1.Panels[1].Text := 'Поправка:' + FloatToStr(Adjustments[i]._Volume);

    StatusBar1.Panels[1].PanelStyle.Font.Style := [fsBold];
    Exit;
   end;
 end;

end;

procedure TPlanEditorForm.DelAdjustment(NumRecord : integer);
var
 i : integer;
begin
 for i := NumRecord to Length(Adjustments) - 2 do
  Adjustments[i] := Adjustments[i + 1];

 SetLength(Adjustments, Length(Adjustments) - 1);
end;

procedure TPlanEditorForm.CellWidthSpinEditCurChange(Sender: TObject);
var
 i : integer;
begin
 if not TryStrToInt(CellWidthSpinEdit.CurText, i) then begin
  CellWidthSpinEdit.Text := IntToStr(SYS_COLW);
  Exit;
 end;

 CellWidthSpinEdit.Text := CellWidthSpinEdit.CurText;

 SYS_COLW := StrToInt(CellWidthSpinEdit.CurText);
end;

procedure TPlanEditorForm.EditRepositoryButtonItem1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 f : TView_Dogs_DataForm;
 k : TStagesRecord;
begin
 if (ProductTreeList.FocusedNode.Values[0] < 0) and (ProductTreeList.FocusedNode.Count > 0) then Exit;
 if (ProductTreeList.FocusedNode.Values[2] <= 0) and (ProductTreeList.FocusedNode.Values[3] <= 0) then Exit;

 f := TView_Dogs_DataForm.Create(Self);

 if ProductTreeList.FocusedNode.Values[0] <= 0 then begin
  f.id_Product := ProductTreeList.FocusedNode.Parent.Values[0];
  f.ProdCoef   := ProductTreeList.FocusedNode.Parent.Values[8];
 end
 else begin
  f.id_Product := ProductTreeList.FocusedNode.Values[0];
  f.ProdCoef   := ProductTreeList.FocusedNode.Values[8];
 end;

 if ProductTreeList.FocusedNode.Values[2] > 0 then begin
  f.id_Cat_Cust := ProductTreeList.FocusedNode.Values[2];
  f.id_Object   := -1;
 end
 else if ProductTreeList.FocusedNode.Values[3] > 0 then begin
  f.id_Cat_Cust := -1;
  f.id_Object   := ProductTreeList.FocusedNode.Values[3];
 end;

 k := PStagesRecord(Pointer(ProductTreeList.FocusedColumn.Tag))^;

 f.Date_Beg := k._Date_Beg;
 f.Date_End := k._Date_End;

 if f.ShowModal <> mrOk then Exit
 else begin
  ProductTreeList.FocusedNode.Values[ProductTreeList.FocusedColumn.ItemIndex] := RoundValueQ(f.ResSum);
  ProductTreeList.FocusedNode.EndEdit(False);
 end;
end;

procedure TPlanEditorForm.GridDocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 k : integer;
begin
 with GridDoc.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  try
   ShowMessage('ID_DOC: '      + Values[k, 0] + #13
             + 'DATE_REG: '    + Values[k, 4] + #13
             + 'ID_UNIT_M: '   + IntToStr(Values[k, 5]));
  except
  end;
 end;
end;

procedure TPlanEditorForm.SaveWork(GetQuery: boolean);
var
 i, j, t : integer;
 Flag    : boolean;
 k, f    : integer;
 Bool    : boolean;
 id_Doc  : integer;
begin
 Flag := False;

 if (Length(NewStagesArray) > 0) or (Length(NewPlanDataArray) > 0)
 or (Length(DelDocArray) > 0) or (Length(DelStagesArray) > 0) then Flag := True;

 if not(Flag) then begin
  for i := 0 to Length(PlanDataArray) - 1 do begin
   if PlanDataArray[i]._Modified <> 'no' then begin
    Flag := True;
    Break;
   end;
  end;
 end;

 if not(Flag) then begin
  ShowMessage('У плані не відбулося змін, які б треба було зберегти!');
  Exit;
 end;

 if GetQuery then if MessageDlg('Зберегання плану/змін до плану', 'Чи дійсно ви бажаєте зберегти зміни '
 + 'у документах плану?', mtConfirmation, [mbYes, mbNo]) = mrNo  then Exit;

 StoredProc.Transaction.StartTransaction;

 SaveResult; // <-- Saving of new doc

 if (Length(EditedDocArray) = 0) and (Length(DelDocArray) = 0) then begin
  StoredProc.Transaction.Commit;
  RefreshData;
  Exit;
 end;

 //Saving of edited docs
 if Length(EditedDocArray) > 0 then begin
  for t := 0 to GridDoc.DataController.RecordCount - 1 do begin
   Flag := True;
   id_Doc := GridDoc.DataController.Values[t, 0];

   for k := 0 to Length(EditedDocArray) - 1 do
    if id_Doc = EditedDocArray[k] then begin
     Flag := False;
    end;

   if Flag then Continue;

   for f := 0 to Length(FixedStages) - 1 do begin
    if FixedStages[f]._id_Doc <> id_Doc then Continue;
    Bool := True;

    for i := 0 to Length(StagesArray) - 1 do begin
     if StagesArray[i]._id_Doc  <> id_Doc then Continue;
     if StagesArray[i]._Link_To <> FixedStages[f]._id_Stage then Continue;

     StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_MODIFY', [StagesArray[i]._id_Stage, Sys_Max_TimeStamp]);

     for j := 0 to Length(PlanDataArray) - 1 do begin
      if (PlanDataArray[j]._id_Stage <> StagesArray[i]._id_Stage)
      or (PlanDataArray[j]._Modified <> 'Edit') then Continue;

      Bool := False;

      if PlanDataArray[j]._id_Cat_Cust > 0 then begin
       StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_ADD', [StagesArray[i]._id_Stage,
       SYS_DEF_ID_DEPARTMENT, PlanDataArray[j]._id_Product, PlanDataArray[j]._id_Unit_Meas,
       PlanDataArray[j]._id_Cat_Cust, PlanDataArray[j]._Cost, PlanDataArray[j]._Volume,
       PlanDataArray[j]._Summa, 0, Sys_Max_TimeStamp]);
      end
      else if PlanDataArray[j]._id_Object > 0 then begin
       StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_ADD', [StagesArray[i]._id_Stage,
       SYS_DEF_ID_DEPARTMENT, PlanDataArray[j]._id_Product, PlanDataArray[j]._id_Unit_Meas,
       0, 0, PlanDataArray[j]._Volume, 0, PlanDataArray[j]._id_Object, Sys_Max_TimeStamp]);
      end
      else begin
       StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_ADD', [StagesArray[i]._id_Stage,
       SYS_DEF_ID_DEPARTMENT, PlanDataArray[j]._id_Product, PlanDataArray[j]._id_Unit_Meas,
       0, PlanDataArray[j]._Cost, PlanDataArray[j]._Volume, PlanDataArray[j]._Summa,
       0, Sys_Max_TimeStamp]);
      end;
     end;
    end;

    if Bool then begin
     StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_MODIFY', [FixedStages[f]._id_Stage, Sys_Max_TimeStamp]);

     for j := 0 to Length(PlanDataArray) - 1 do begin
      if (PlanDataArray[j]._id_Stage <> FixedStages[f]._id_Stage)
      or (PlanDataArray[j]._Modified <> 'Edit') then Continue;

      if PlanDataArray[j]._id_Cat_Cust > 0 then begin
       StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_ADD', [FixedStages[f]._id_Stage,
       SYS_DEF_ID_DEPARTMENT, PlanDataArray[j]._id_Product, PlanDataArray[j]._id_Unit_Meas,
       PlanDataArray[j]._id_Cat_Cust, PlanDataArray[j]._Cost, PlanDataArray[j]._Volume,
       PlanDataArray[j]._Summa, 0, Sys_Max_TimeStamp]);
      end
      else if PlanDataArray[j]._id_Object > 0 then begin
       StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_ADD', [FixedStages[f]._id_Stage,
       SYS_DEF_ID_DEPARTMENT, PlanDataArray[j]._id_Product, PlanDataArray[j]._id_Unit_Meas,
       0, 0, PlanDataArray[j]._Volume, 0, PlanDataArray[j]._id_Object, Sys_Max_TimeStamp]);
      end
      else begin
       StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_ADD', [FixedStages[f]._id_Stage,
       SYS_DEF_ID_DEPARTMENT, PlanDataArray[j]._id_Product, PlanDataArray[j]._id_Unit_Meas,
       0, PlanDataArray[j]._Cost, PlanDataArray[j]._Volume, PlanDataArray[j]._Summa, 0,
       Sys_Max_TimeStamp]);
      end;
     end;
    end;
   end;
  end;

  if Length(DelStagesArray) > 0 then begin
   for i := 0 to Length(DelStagesArray) - 1 do begin
    StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_MODIFY', [DelStagesArray[i], Sys_Max_TimeStamp]);
   end;
  end;

  if YearPlan
  then StoredProc.ExecProcedure('PROC_DT_PLANS_MARK_AS_CHANGED', [id_Plan, 0])
  else StoredProc.ExecProcedure('PROC_DT_PLANS_MARK_AS_CHANGED', [id_Year_Plan, 1]);
 end;

 if Length(DelDocArray) > 0 then begin
  for i := 0 to Length(DelDocArray) - 1 do begin
   StoredProc.ExecProcedure('PROC_DT_PLAN_DATA_MODIFY1', [DelDocArray[i], Sys_Max_TimeStamp]);
  end;
 end;

 StoredProc.Transaction.Commit;

 EditedDocArray := nil;
 DelStagesArray := nil;
 DelStagesArray := nil;
 DelDocArray    := nil;

 RefreshData;
end;

procedure TPlanEditorForm.RefreshData;
var
 k : integer;
 i : integer;
begin
 k := GridDoc.DataController.FocusedRecordIndex;

 NewPlanDataArray := nil;
 PlanDataArray    := nil;
 NewStagesArray   := nil;
 StagesArray      := nil;
 EditedDocArray   := nil;
 FixedStages      := nil;
 NewFixedStages   := nil;

 DocSelect(id_Plan);

 if GridDoc.DataController.RecordCount = 0 then Exit;


 StagesArray := nil;
 for i := 0 to GridDoc.DataController.RecordCount - 1 do begin
  StagesSelect(GridDoc.DataController.Values[i, 0]);
 end;
 PlanDataArray := nil;
 if Length(FixedStages) > 0 then PlanDataSelect;

 if (k >=0 ) and (k < GridDoc.DataController.RecordCount) then GridDoc.DataController.FocusedRecordIndex := k
 else GridDoc.DataController.FocusedRecordIndex := GridDoc.DataController.RecordCount - 1;
end;

end.
