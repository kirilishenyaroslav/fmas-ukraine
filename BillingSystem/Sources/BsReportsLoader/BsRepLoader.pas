unit BsRepLoader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, DB, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, dxBar, dxBarExtItems, ActnList, cxMaskEdit, ImgList,
  cxClasses, cxGridTableView,  uCommon_Types, FIBQuery,
  pFIBQuery, pFIBStoredProc, ExtCtrls, DateUtils, cxTextEdit, cxDBEdit,
  cxContainer, cxEdit, cxLabel, uCommon_Messages, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, cxButtonEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit, uCommon_Loader,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Menus,
  uCommon_Funcs, uConsts, cxCheckBox, cxCalendar, cxMemo, frxExportPDF,
  frxExportXML, frxExportXLS, frxClass, frxExportHTML, frxDBSet;

const
   pnlGridHeight=159;
   frmTop=180;

type

  TfrmReportLoader = class(TForm)
    ReportReadTrans: TpFIBTransaction;
    ActionList1: TActionList;
    ImageList: TImageList;
    pnlGrid: TPanel;
    BarManager: TdxBarManager;
    btnSelect: TdxBarLargeButton;
    btnClose: TdxBarLargeButton;
    ActClose: TAction;
    ReportGridDBView: TcxGridDBTableView;
    ReportGridLevel: TcxGridLevel;
    ReportGrid: TcxGrid;
    ReportDSet: TpFIBDataSet;
    ReportDS: TDataSource;
    ColumnNumReport: TcxGridDBColumn;
    ColumnNameReport: TcxGridDBColumn;
    Panel1: TPanel;
    DisObjStyleRepository: TcxStyleRepository;
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
    DisObjectGridStyle: TcxGridTableViewStyleSheet;
    BsConstDset: TpFIBDataSet;
    ActPrint: TAction;
    ReportDB: TpFIBDatabase;
    ReportWriteTrans: TpFIBTransaction;
    ColumnGroupName: TcxGridDBColumn;
    frDB: TfrxDBDataset;
    frReport: TfrxReport;
    PrintDSet: TpFIBDataSet;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxPDFExport1: TfrxPDFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure ReportGridDBViewDblClick(Sender: TObject);
    procedure ReportDSetEndScroll(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CloseConnect;
    procedure ReportDSetCloseOpen;
  public
    { Public declarations }
    constructor  Create(AParameter:TBsSimpleParams);reintroduce;
  end;

var
  frmReportLoader: TfrmReportLoader;

implementation

{$R *.dfm}

constructor TfrmReportLoader.Create(AParameter:TBsSimpleParams);
begin
   inherited Create(AParameter.Owner);
   ReportDB.Handle:=AParameter.Db_Handle;
   BsConstDset.Close;
   BsConstDset.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CONSTS';
   BsConstDset.Open;
   ReportDSetCloseOpen;
end;

procedure TfrmReportLoader.ReportDSetCloseOpen;
begin
   if ReportDSet.Active then ReportDSet.Close;
   ReportDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DT_REPORTS_SEL ORDER BY NUM_REPORT';
   ReportDSet.Open;
end;


procedure TfrmReportLoader.CloseConnect;
var i:Integer;
begin
   for i:=0 to ReportDB.TransactionCount-1 do
   begin
      if ReportDB.Transactions[i].Active then ReportDB.Transactions[i].Rollback;
   end;
   ReportDB.Close;
end;


procedure TfrmReportLoader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CloseConnect;
   if FormStyle = fsMDIChild then action:=caFree;
end;

procedure TfrmReportLoader.btnCloseClick(Sender: TObject);
begin
   Close
end;

procedure TfrmReportLoader.btnSelectClick(Sender: TObject);
var sqlStr:String;
    AParameter:TBsSimpleParams;
begin
   if ReportDSet.IsEmpty then Exit;
   if ReportDSet['With_Filters']=1 then
   begin
      AParameter:= TBsSimpleParams.Create;
      AParameter.Owner:=self;
      AParameter.Db_Handle:= ReportDB.Handle;
      AParameter.Formstyle:=fsMDIChild;
      AParameter.WaitPakageOwner:=self;
      AParameter.ID_Locate:=ReportDSet['Id_Report'];
      RunFunctionFromPackage(AParameter, 'BillingSystem\BsUnivReport.bpl','ShowUnivReport');
      AParameter.Free;
   end
   else
   begin
     try
        sqlStr:='SELECT DISTINCT * FROM '+ReportDSet['Name_Procedure'];
        if not VarIsNull(ReportDSet['Add_Info']) then sqlStr:=sqlStr+ReportDSet['Add_Info'];
        if PrintDSet.Active then PrintDSet.Close;
        PrintDSet.SQLs.SelectSQL.Text:=sqlStr;
        PrintDSet.Open;
        if PrintDSet.IsEmpty then
        begin
           bsShowMessage('Увага!', 'Для формування звіту не має даних!', mtInformation, [mbOK]);
           Exit;
        end;
        frReport.Clear;
        frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\'+ReportDSet['Name_Fr3'], True);
        frReport.ShowReport(True);
     except on E:Exception do
            begin
               bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
            end;
     end;
   end;
end;

procedure TfrmReportLoader.ReportGridDBViewDblClick(Sender: TObject);
begin
   btnSelectClick(Sender);
end;

procedure TfrmReportLoader.ReportDSetEndScroll(DataSet: TDataSet);
begin
   {if ReportDSet['With_Filters']=1 then btnSelect.Caption:='Показати звіт'
   else btnSelect.Caption:='Друк звіту';  }
end;

end.
