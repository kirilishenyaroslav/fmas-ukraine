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
  frxExportHTML, frxExportTXT, Placemnt, ComCtrls, cxCalc;

type


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
    BuReportsInfoGrid: TcxGrid;
    ViewLevel0: TcxGridDBTableView;
    ViewLevel0DBColumn2: TcxGridDBColumn;
    ViewLevel0DBColumn3: TcxGridDBColumn;
    ViewLevel0DBColumn4: TcxGridDBColumn;
    ViewLevel1: TcxGridDBTableView;
    ViewLevel1DBColumn1: TcxGridDBColumn;
    ViewLevel1DBColumn2: TcxGridDBColumn;
    ViewLevel1DBColumn3: TcxGridDBColumn;
    ViewLevel1DBColumn4: TcxGridDBColumn;
    ViewLevel2: TcxGridDBBandedTableView;
    PLAN_VALUE: TcxGridDBBandedColumn;
    BU_KASSA_FACT: TcxGridDBBandedColumn;
    BU_FINANCE_FACT: TcxGridDBBandedColumn;
    BU_DEBIT_Z: TcxGridDBBandedColumn;
    BU_KREDIT_Z: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN: TcxGridDBBandedColumn;
    SHOW_TITLE: TcxGridDBBandedColumn;
    ViewLevel3: TcxGridDBBandedTableView;
    ViewLevel4: TcxGridDBBandedTableView;
    ViewLevel4DBBandedColumn1: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn3: TcxGridDBBandedColumn;
    PLAN_VALUE_COLUMN: TcxGridDBBandedColumn;
    BU_KASSA_FACT_COLUMN: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn6: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn7: TcxGridDBBandedColumn;
    BU_KREDIT_Z_COLUMN: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN_COLUMN: TcxGridDBBandedColumn;
    ExportPopupMenu: TPopupMenu;
    HTML1: TMenuItem;
    Excelajhvfne1: TMenuItem;
    SaveDialog1: TSaveDialog;
    ViewLevel2DBBandedColumn1: TcxGridDBBandedColumn;
    PROFIT_FLAG_TITLE: TcxGridDBBandedColumn;
    PLAN_VALUE_FC: TcxGridDBBandedColumn;
    BU_KASSA_FACT_FC: TcxGridDBBandedColumn;
    BU_FINANCE_FACT_FC: TcxGridDBBandedColumn;
    BU_DEBIT_Z_FC: TcxGridDBBandedColumn;
    BU_KREDIT_Z_FC: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN_FC: TcxGridDBBandedColumn;
    RAZD_STYLE: TcxStyle;
    ST_STYLE: TcxStyle;
    SM_STYLE: TcxStyle;
    TYPE_OBJ: TcxGridDBBandedColumn;
    ViewLevel4DBBandedColumn2: TcxGridDBBandedColumn;
    DBDataset: TfrxDBDataset;
    PlanRestsDataSet: TpFIBDataSet;
    PlanRestDataset: TfrxDBDataset;
    RestDataSource: TDataSource;
    RED_SUM_STYLE: TcxStyle;
    RAZD_STYLE_RED: TcxStyle;
    ST_STYLE_RED: TcxStyle;
    SM_STYLE_RED: TcxStyle;
    Panel4: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    PrintButton: TcxButton;
    cxButton11: TcxButton;
    ViewLevel1DBColumn5: TcxGridDBColumn;
    ViewLevel1DBColumn6: TcxGridDBColumn;
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
    ViewLevel1DBColumn7: TcxGridDBColumn;
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
    ViewLevel4DBBandedColumn10: TcxGridDBBandedColumn;
    PLAN_FC: TcxGridDBBandedColumn;
    KASSA_FC: TcxGridDBBandedColumn;
    DIFF_FC: TcxGridDBBandedColumn;
    ViewLevelMonth: TcxGridDBBandedTableView;
    SHOW_TITLE_: TcxGridDBBandedColumn;
    PLAN_VALUE_: TcxGridDBBandedColumn;
    BU_KASSA_FACT_: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN_: TcxGridDBBandedColumn;
    PROFIT_FLAG_TITLE_EX_: TcxGridDBBandedColumn;
    OBJECT_TYPE: TcxGridDBBandedColumn;
    PLAN_VALUE_FC_: TcxGridDBBandedColumn;
    BU_KASSA_FACT_FC_: TcxGridDBBandedColumn;
    DIFF_FROM_PLAN_FC_: TcxGridDBBandedColumn;
    RowDataSet: TfrxUserDataSet;
    ColDataSet: TfrxUserDataSet;
    PLReestrView: TcxGridDBBandedTableView;
    PLReestrViewDBBandedColumn1: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn2: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn4: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn5: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn6: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn3: TcxGridDBBandedColumn;
    PLReestrViewDBBandedColumn7: TcxGridDBBandedColumn;
    FormStorage1: TFormStorage;
    PrintPopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    FPlanRestsDataSet: TpFIBDataSet;
    FRestDataSource: TDataSource;
    ViewLevel1DBColumn8: TcxGridDBColumn;
    frxReport1: TfrxReport;
    ViewLevel3DBBandedColumn1: TcxGridDBBandedColumn;
    ViewLevel3DBBandedColumn2: TcxGridDBBandedColumn;
    ViewLevel3DBBandedColumn4: TcxGridDBBandedColumn;
    ViewLevel3DBBandedColumn5: TcxGridDBBandedColumn;
    ViewLevel3DBBandedColumn3: TcxGridDBBandedColumn;
    ViewLevel0DBColumn5: TcxGridDBColumn;
    SmGroupV_Detail: TcxGridLevel;
    ViewLevel8: TcxGridDBBandedTableView;
    ViewLevel8DBBandedColumn1: TcxGridDBBandedColumn;
    ViewLevel8DBBandedColumn2: TcxGridDBBandedColumn;
    ViewLevel8DBBandedColumn5: TcxGridDBBandedColumn;
    ChengeWorkperiodMenu: TPopupMenu;
    N3: TMenuItem;
    ViewLevel1DBColumn9: TcxGridDBColumn;
    ViewLevel1DBColumn10: TcxGridDBColumn;
    ViewLevel0DBColumn1: TcxGridDBColumn;
    OBJECT_TYPE_COL: TcxGridDBColumn;
    cxStyle58: TcxStyle;
    ViewLevel1DBColumn11: TcxGridDBColumn;
    procedure ViewLevel0DBColumn4GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ViewLevel4DBBandedColumn3StylesGetContentStyle(
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
    procedure N3Click(Sender: TObject);
    procedure ViewLevel1DBColumn9StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel1DBColumn10StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewLevel0DBColumn2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure PrintButtonClick(Sender: TObject);
  private
    { Private declarations }
    CurActualDate: TDateTime;
    CurUser      : Int64;
    CurColumnSel : Integer;
    Quene        : TObjectStack;
    MayChengeSmWorkPeriod:Boolean;
    ChengePeriodDateBeg:TDateTime;
    ChengePeriodDateEnd:TDateTime;    
  public
    constructor Create(AOwner:TComponent; DB_Handle:TISC_DB_HANDLE; Id_USER:Int64);overload;
    function    getSQLTextForGroupPlanDetail:String;
    function    getSQLTextForGroupFactDetail:String;
    procedure   doConfigureGroupDetailGrid;
    procedure   doConfigureGroupDetailGridV;
    function    DoMonthReport : boolean;
    { Public declarations }
  end;

  procedure ShowHtmlReport(AOwner:TComponent; DB_Handle:TISC_DB_HANDLE; Id_USER:Int64);stdcall;
  exports ShowHtmlReport;

implementation

uses GobalSpr, BaseTypes, cxGridViewData, FrmTypeUchQuery,
UChangeWorkPeriod;

{$R *.dfm}
procedure ShowHtmlReport(AOwner:TComponent; DB_Handle:TISC_DB_HANDLE; Id_USER:Int64);
begin
     TfrmHtmlReport.Create(AOwner,DB_Handle,Id_USER);
end;

constructor TfrmHtmlReport.Create(AOwner: TComponent; DB_Handle: TISC_DB_HANDLE;
  Id_USER: Int64);

begin
    inherited Create(AOwner);

end;

function TfrmHtmlReport.getSQLTextByLevel(const Step:QueneLevelInfo): String;
var  Res:String;
begin
     CurColumnSel:=1;
     Res:=getSQLTextForGroupFactDetail(Step);
     Result:=Res;
end;

procedure TfrmHtmlReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmHtmlReport.doExportToExtFormat(const Step:QueneLevelInfo;FmtType:Byte);
begin
end;

procedure TfrmHtmlReport.doConfigureMonthGrid(const Step: QueneLevelInfo);
begin
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

function TfrmHtmlReport.getSQLTextForMonthLevel(const Step: QueneLevelInfo): String;
begin
end;

function TfrmHtmlReport.DoMonthReport : boolean;
begin
end;

function TfrmHtmlReport.getSQLTextForMonthLevelF(const Step: QueneLevelInfo): String;
begin
end;

procedure TfrmHtmlReport.doConfigureGroupDetailGrid(const Step: QueneLevelInfo);
begin
    //Получаем информацию по периоду функционирования бюджета

    Screen.Cursor:=crSQLWait;
    GetSmInfoSP:=TpfibStoredProc.Create(self);
    GetSmInfoSP.Database:=WorkDatabase;
    GetSmInfoSP.Transaction:=ReadTransaction;
    GetSmInfoSP.StoredProcName:='BU_GET_SM_IN_GROUP';
    GetSmInfoSP.Prepare;
    GetSmInfoSP.ParamByName('ID_SM_GROUP').AsInt64:=Step.FFilterObject;
    GetSmInfoSP.ParamByName('ACTUAL_DATE').Value  :=Step.FActualDate;
    GetSmInfoSP.ExecProc;

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
    SmTitleQuery.SelectSQL.Text:='SELECT * FROM BU_GET_SM_IN_GROUP_EX('+IntToStr(Step.FFilterObject)+','+''''+DateToStr(Step.FActualDate)+''''+') ORDER BY SM_CODE ASC';
    SmTitleQuery.Open;
    SmTitleQuery.FetchAll;
    SmTitleQuery.First;

    SetLength(ArrColumns,SmTitleQuery.RecordCount);
    ViewLevel3.Bands[1].Width:=SmTitleQuery.RecordCount*100;

    for i:=1 to SmTitleQuery.RecordCount do
    begin
         ArrColumns[i-1]:= ViewLevel3.CreateColumn;
         ArrColumns[i-1].HeaderAlignmentHorz:=taCenter;
         ArrColumns[i-1].PropertiesClass:=TcxTextEditProperties;
         TcxTextEditProperties(ArrColumns[i-1].Properties).Alignment.Vert:=taTopJustify;
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
    GetSmInfoSP.Close;
    GetSmInfoSP.Free;
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
    T:TfrmDocSearchInfo;
    ResStr:String;
begin
    //Получаем информацию по бюджетам, которые входят в группу
    SmTitleQuery:=TpfibDataSet.Create(self);
    SmTitleQuery.Database:=WorkDatabase;
    SmTitleQuery.Transaction:=ReadTransaction;
    SmTitleQuery.SelectSQL.Text:='SELECT * FROM BU_GET_SM_IN_GROUP_EX('+IntToStr(Step.FFilterObject)+','+''''+DateToStr(Step.FActualDate)+''''+') ORDER BY SM_CODE ASC';
    SmTitleQuery.Open;
    SmTitleQuery.FetchAll;
    SmTitleQuery.First;

    ResStr:=' SELECT VAL.*, ';
    i:=1;
    while (i<SmTitleQuery.RecordCount) do
    begin
         ResStr:=ResStr+' (SELECT PLAN_VALUE FROM BU_GET_PLAN_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString;
         ResStr:=ResStr+' , ';

         ResStr:=ResStr+' (SELECT PLAN_VALUE_FC FROM BU_GET_PLAN_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString+'_FC';
         ResStr:=ResStr+' , ';

         i:=i+1;
         SmTitleQuery.Next;
    end;
    ResStr:=ResStr+' (SELECT PLAN_VALUE FROM BU_GET_PLAN_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString+' , ';
    ResStr:=ResStr+' (SELECT PLAN_VALUE_FC FROM BU_GET_PLAN_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString+'_FC';


    T:=TfrmDocSearchInfo.Create(self);
    T.ShowModal;
    if T.RadioButton1.Checked
    then ResStr:=ResStr+'  FROM BU_GET_BUDGETS_REST_BY_GROUP_RS('+IntToStr(Step.FFilterObject)+','+''''+DateToStr(Step.FActualDate)+''''+') VAL WHERE VAL.IS_DETAIL=0'
    else ResStr:=ResStr+'  FROM BU_GET_BUDGETS_REST_BY_GROUP_RS('+IntToStr(Step.FFilterObject)+','+''''+DateToStr(Step.FActualDate)+''''+') VAL';

    Result:=ResStr;
end;

procedure TfrmHtmlReport.ViewLevel0DBColumn5GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     if (ARecord.Values[OBJECT_TYPE_COL.Index]=3)
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

procedure TfrmHtmlReport.doConfigureGroupDetailGridV(
  const Step: QueneLevelInfo);
var ArrColumns: array of TcxGridDBBandedColumn;
    i:Integer;
    D,M,Y:Word;
    GetSmInfoSP:TpfibStoredProc;
    SmTitleQuery:TpfibDataSet;
    D1:TDateTime;
begin
    //Получаем информацию по периоду функционирования бюджета

    Screen.Cursor:=crSQLWait;
    GetSmInfoSP:=TpfibStoredProc.Create(self);
    GetSmInfoSP.Database:=WorkDatabase;
    GetSmInfoSP.Transaction:=ReadTransaction;
    GetSmInfoSP.StoredProcName:='BU_GET_SM_IN_GROUP';
    GetSmInfoSP.Prepare;
    GetSmInfoSP.ParamByName('ID_SM_GROUP').AsInt64:=Step.FFilterObject;
    GetSmInfoSP.ParamByName('ACTUAL_DATE').Value  :=Step.FActualDate;
    GetSmInfoSP.ExecProc;

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
    SmTitleQuery.SelectSQL.Text:='SELECT * FROM BU_GET_SM_IN_GROUP_EX('+IntToStr(Step.FFilterObject)+','+''''+DateToStr(Step.FActualDate)+''''+') ORDER BY SM_CODE ASC';
    SmTitleQuery.Open;
    SmTitleQuery.FetchAll;
    SmTitleQuery.First;

    SetLength(ArrColumns,SmTitleQuery.RecordCount);
    ViewLevel8.Bands[1].Width:=SmTitleQuery.RecordCount*100;

    for i:=1 to SmTitleQuery.RecordCount do
    begin
         ArrColumns[i-1]:= ViewLevel8.CreateColumn;
         ArrColumns[i-1].HeaderAlignmentHorz:=taCenter;
         ArrColumns[i-1].PropertiesClass:=TcxTextEditProperties;
         TcxTextEditProperties(ArrColumns[i-1].Properties).Alignment.Vert:=taTopJustify;
         ArrColumns[i-1].Position.BandIndex:=1;
         ArrColumns[i-1].Width:=80;
         ArrColumns[i-1].Options.Filtering:=false;
         ArrColumns[i-1].Styles.OnGetContentStyle:=ViewLevel8DBBandedColumn5StylesGetContentStyle;
         ArrColumns[i-1].DataBinding.FieldName:='SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString;
         ArrColumns[i-1].Name:='xSM_'+SmTitleQuery.FieldByName('SM_CODE').AsString;
         DecodeDate(D1,Y,M,D);
         ArrColumns[i-1].Caption:=SmTitleQuery.FieldByName('SM_CODE').AsString;
         D1:=IncMonth(D1,1);

         with ViewLevel8.DataController.Summary.DefaultGroupSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
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
    GetSmInfoSP.Close;
    GetSmInfoSP.Free;
    SmTitleQuery.Free;
    Screen.Cursor:=crDefault;

end;

function TfrmHtmlReport.getSQLTextForGroupFactDetail(const Step: QueneLevelInfo): String;
var i:Integer;
    SmTitleQuery:TpfibDataSet;
    T:TfrmDocSearchInfo;
    ResStr:String;
    Type_:String;
begin
    //Получаем информацию по бюджетам, которые входят в группу
    T:=TfrmDocSearchInfo.Create(self);
    T.RadioButton1.Caption:='Управлінський облік';
    T.RadioButton2.Caption:='Фінансовий облік';
    T.ShowModal;

    if T.RadioButton1.Checked
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
    T.Free;

    SmTitleQuery:=TpfibDataSet.Create(self);
    SmTitleQuery.Database:=WorkDatabase;
    SmTitleQuery.Transaction:=ReadTransaction;
    SmTitleQuery.SelectSQL.Text:='SELECT * FROM BU_GET_SM_IN_GROUP_EX('+IntToStr(Step.FFilterObject)+','+''''+DateToStr(Step.FActualDate)+''''+') ORDER BY SM_CODE ASC';
    SmTitleQuery.Open;
    SmTitleQuery.FetchAll;
    SmTitleQuery.First;

    ResStr:=' SELECT VAL.*, ';
    i:=1;
    while (i<SmTitleQuery.RecordCount) do
    begin
         ResStr:=ResStr+' (SELECT FACT_VALUE FROM BU_GET_FACT_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+','+Type_+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString;
         ResStr:=ResStr+' , ';

         ResStr:=ResStr+' (SELECT FACT_VALUE_FC FROM BU_GET_FACT_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+','+Type_+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString+'_FC';
         ResStr:=ResStr+' , ';

         i:=i+1;
         SmTitleQuery.Next;
    end;
    ResStr:=ResStr+' (SELECT FACT_VALUE FROM BU_GET_FACT_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+','+Type_+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString+' , ';
    ResStr:=ResStr+' (SELECT FACT_VALUE_FC FROM BU_GET_FACT_VALUE(VAL.SHOW_ID,'+SmTitleQuery.FieldByName('ID_PLAN').AsString+','+Type_+')) AS '+'SM_'+SmTitleQuery.FieldByName('SM_CODE').AsString+'_FC';


    T:=TfrmDocSearchInfo.Create(self);
    T.ShowModal;

    if T.RadioButton1.Checked
    then ResStr:=ResStr+'  FROM BU_GET_BUDGETS_REST_BY_GROUP_RS('+IntToStr(Step.FFilterObject)+','+''''+DateToStr(Step.FActualDate)+''''+') VAL WHERE VAL.IS_DETAIL=0'
    else ResStr:=ResStr+'  FROM BU_GET_BUDGETS_REST_BY_GROUP_RS('+IntToStr(Step.FFilterObject)+','+''''+DateToStr(Step.FActualDate)+''''+') VAL';

    Result:=ResStr;
end;

procedure TfrmHtmlReport.N3Click(Sender: TObject);
var T:TfrmGetDates;
    Str:String;
begin
     T:=TfrmGetDates.Create(self);
     T.cxDateEdit1.Date:=ChengePeriodDateBeg;
     T.cxDateEdit2.Date:=ChengePeriodDateEnd;
     T.ShowModal;
     ChengePeriodDateBeg:=T.cxDateEdit1.Date;
     ChengePeriodDateEnd:=T.cxDateEdit2.Date;
     MayChengeSmWorkPeriod:=true;
     T.Free;
     Str:=TitlePanel.Caption;
     Delete(Str,
            Pos('(',Str),
            Length(Str)-Pos('(',Str)+1
            );

     TitlePanel.Caption:=Str+' ('+DateToStr(ChengePeriodDateBeg)+'-'+DateToStr(ChengePeriodDateEnd)+')';
     cxButton2Click(Self);
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

procedure TfrmHtmlReport.PrintButtonClick(Sender: TObject);
begin
     with TfrmReport1Diagram.
end;

end.
