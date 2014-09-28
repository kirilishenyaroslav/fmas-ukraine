unit ViewReportsPayOnDay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, RxMemDS, ExtCtrls, frxClass, frxDesgn, frxDBSet, DB,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxClasses, ComCtrls, cxLookAndFeelPainters,
  StdCtrls, cxButtons,StudcityConst,St_ser_function, frxExportRTF,
  frxExportPDF, frxExportImage, frxExportXLS, frxExportTXT;

type
  TfrmMainPayOnDay = class(TForm)
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    Transaction: TpFIBTransaction;
    pFIBStoredProcSaveRX: TpFIBStoredProc;
    DataSourceMaster: TDataSource;
    pFIBDataSetPrintMaster: TpFIBDataSet;
    frxDBDatasetMaster: TfrxDBDataset;
    pFIBDataSetPrintDetail: TpFIBDataSet;
    frxDBDatasetDetails: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    TimerReports: TTimer;
    RxMemoryData: TRxMemoryData;
    frxDBDatasetMasterRX: TfrxDBDataset;
    pFIBDataSetPrintMasterRX: TpFIBDataSet;
    pFIBDataSetSchDB: TpFIBDataSet;
    pFIBDataSetSchCR: TpFIBDataSet;
    pFIBDataSetSM: TpFIBDataSet;
    StyleRepository: TcxStyleRepository;
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
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGridDB: TcxGrid;
    cxGridDBDBTableView1: TcxGridDBTableView;
    CxSelectField: TcxGridDBColumn;
    CxNameField: TcxGridDBColumn;
    cxGridDBLevel1: TcxGridLevel;
    RxMemoryDataDB: TRxMemoryData;
    DataSourceDB: TDataSource;
    RxNameVariant: TcxGridDBColumn;
    cxGridCR: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    RxMemoryDataCR: TRxMemoryData;
    DataSourceCR: TDataSource;
    cxGridSM: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    DataSourceSM: TDataSource;
    RxMemoryDataSM: TRxMemoryData;
    StatusBar1: TStatusBar;
    cxButtonOK: TcxButton;
    cxButtonCancel: TcxButton;
    frxReport: TfrxReport;
    frxTXTExport1: TfrxTXTExport;
    frxXLSExport2: TfrxXLSExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonOKClick(Sender: TObject);
  private
  private
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,sql_master_add,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer);overload;
    { Private declarations }
  public
    Lang:Integer;
    { Public declarations }
  end;

function ReportsViewOnDay(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,sql_master_add,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer):Integer;stdcall;
exports ReportsViewOnDay;

var
  frmMainPayOnDay: TfrmMainPayOnDay;
  ReportName:String;
  LastIg:Integer;
  Type_R:Integer;
  FV,NFV,FNR:Variant;
  Sql_Master_l,sql_master_add_l,Sql_Detail_l:String;

implementation

{$R *.dfm}
function ReportsViewOnDay(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,sql_master_add,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer):Integer;
var
  View:TfrmMainPayOnDay;
begin
  View:=TfrmMainPayOnDay.Create(AOwner,DB,Type_Report,Sql_Master,sql_master_add,Sql_Detail,FieldView,NotFieldView,FieldNameReport,Report_Name,LastIgnor);;
  View.ShowModal;
  View.free;
end;


Constructor TfrmMainPayOnDay.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,sql_master_add,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer);
var
  i,j:Integer;
  FieldCount:Integer;
  MFR:TfrxMemoView;
  CountVisible:Integer;
begin
  Inherited Create(AOwner);

  Lang:=ST_serLanguageIndex(DB);

  RxNameVariant.Caption:=StudcityConst.ST_DB_EX[lang];
  cxGridDBColumn3.Caption:=StudcityConst.ST_CR_EX[lang];
  cxGridDBColumn5.Caption:=StudcityConst.ST_SM_RZ_ST_EX[lang];
  cxGridDBColumn6.Caption:=StudcityConst.ST_SM_EX[lang];
  cxButtonOK.Caption:=StudcityConst.Studcity_ACTION_VIEW_CONST_EX[lang];
  cxButtonCancel.Caption:=StudcityConst.Studcity_ACTION_CANCEL_CONST_EX[lang];

  Sql_Master_l:=Sql_Master;
  Sql_Detail_l:=Sql_Detail;
  sql_master_add_l:=sql_master_add;

  Database.Handle:=DB;
  Type_R:=Type_Report;
  FV:=FieldView;
  NFV:=NotFieldView;
  FNR:=FieldNameReport;
  ReportName:=Report_Name;
  LastIg:=LastIgnor;

  TimerReports.Enabled:=true;

  pFIBDataSetSchDB.Database:=Database;
  pFIBDataSetSchDB.Transaction:=Transaction;

  pFIBDataSetSchDB.Active:=false;
  pFIBDataSetSchDB.ParamByName('ID_SESSION').AsVariant:=FNR[2][0];
  pFIBDataSetSchDB.Active:=true;
  pFIBDataSetSchDB.FetchAll;

  RxMemoryDataDB.EmptyTable;
  for i:=0 to pFIBDataSetSchDB.RecordCount-1 do
    begin
      RxMemoryDataDB.Open;
      RxMemoryDataDB.Insert;
      RxMemoryDataDB.FieldByName('RxSelectField').Value:=1;
      RxMemoryDataDB.FieldByName('RxNameField').Value:=pFIBDataSetSchDB.FieldByName('sch_number_db').AsString;
      RxMemoryDataDB.FieldByName('RxNameVariant').Value:=pFIBDataSetSchDB.FieldByName('sch_title_db').AsString;
      RxMemoryDataDB.Post;
      pFIBDataSetSchDB.Next;
    end;



  pFIBDataSetSchCR.Database:=Database;
  pFIBDataSetSchCR.Transaction:=Transaction;

  pFIBDataSetSchCR.Active:=false;
  pFIBDataSetSchCR.ParamByName('ID_SESSION').AsInt64:=FNR[2][0];
  pFIBDataSetSchCR.Active:=true;
  pFIBDataSetSchCR.FetchAll;

  RxMemoryDataCR.EmptyTable;
  for i:=0 to pFIBDataSetSchCR.RecordCount-1 do
    begin
      RxMemoryDataCR.Open;
      RxMemoryDataCR.Insert;
      RxMemoryDataCR.FieldByName('RxSelectField').Value:=1;
      RxMemoryDataCR.FieldByName('RxNameField').Value:=pFIBDataSetSchCR.FieldByName('sch_number_kd').AsString;
      RxMemoryDataCR.FieldByName('RxNameVariant').Value:=pFIBDataSetSchCR.FieldByName('sch_title_kd').AsString;
      RxMemoryDataCR.Post;
      pFIBDataSetSchCR.Next;
    end;

  pFIBDataSetSM.Database:=Database;
  pFIBDataSetSM.Transaction:=Transaction;

  pFIBDataSetSM.Active:=false;
  pFIBDataSetSM.ParamByName('ID_SESSION').AsInt64:=FNR[2][0];
  pFIBDataSetSM.Active:=true;

  pFIBDataSetSM.FetchAll;

  RxMemoryDataSM.EmptyTable;
  for i:=0 to pFIBDataSetSM.RecordCount-1 do
    begin
      RxMemoryDataSM.Open;
      RxMemoryDataSM.Insert;
      RxMemoryDataSM.FieldByName('RxSelectField').Value:=1;
      RxMemoryDataSM.FieldByName('RxNameField').Value:=pFIBDataSetSM.FieldByName('SMETA_KOD').AsString+'.'+pFIBDataSetSM.FieldByName('RAZD_KOD').AsString+'.'+pFIBDataSetSM.FieldByName('ST_KOD').AsString+'.'+pFIBDataSetSM.FieldByName('KEKV_KOD').AsString;
      RxMemoryDataSM.FieldByName('RxNameVariant').Value:=pFIBDataSetSM.FieldByName('SMETA_TITLE').AsString;

      RxMemoryDataSM.FieldByName('RxMemoryDataSM').Value:=pFIBDataSetSM.FieldByName('SMETA_KOD').AsVariant;
      RxMemoryDataSM.FieldByName('RxMemoryDataRAZD').Value:=pFIBDataSetSM.FieldByName('RAZD_KOD').AsVariant;
      RxMemoryDataSM.FieldByName('RxMemoryDataST').Value:=pFIBDataSetSM.FieldByName('ST_KOD').AsVariant;
      RxMemoryDataSM.FieldByName('RxMemoryDataKEKV').Value:=pFIBDataSetSM.FieldByName('KEKV_KOD').AsVariant;

      RxMemoryDataSM.Post;
      pFIBDataSetSM.Next;
    end;

end;

procedure TfrmMainPayOnDay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMainPayOnDay.cxButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainPayOnDay.cxButtonOKClick(Sender: TObject);
var
  sql_where_db,sql_where_cr,sql_where_sm,sql_master_result,sql_detail_result:String;
  i:Integer;
  MFR:TfrxMemoView;
begin
  sql_where_db:='';
  RxMemoryDataDB.First;

  for i:=0 to RxMemoryDataDB.RecordCount-1 do
    begin
      if RxMemoryDataDB.FieldByName('RxSelectField').Value=1 then
        begin
          if sql_where_db<>'' then
            begin
              sql_where_db:=sql_where_db+' or ';
            end;
         sql_where_db:=sql_where_db+ ' ST_DT_REPORT_PAY_DOC_PROV.SCH_NUMBER_DB='+''''+RxMemoryDataDB.FieldByName('RxNameField').AsString+'''';
        end;
      RxMemoryDataDB.next;
    end;

  sql_where_db:='('+sql_where_db+')';

  sql_where_cr:='';
  RxMemoryDataCR.First;

  for i:=0 to RxMemoryDataCR.RecordCount-1 do
    begin
      if RxMemoryDataCR.FieldByName('RxSelectField').Value=1 then
        begin
          if sql_where_cr<>'' then
            begin
              sql_where_cr:=sql_where_cr+' or ';
            end;
          sql_where_cr:=sql_where_cr+ ' ST_DT_REPORT_PAY_DOC_PROV.SCH_NUMBER_KD='+''''+RxMemoryDataCR.FieldByName('RxNameField').AsString+'''';
        end;
      RxMemoryDataCR.next;
    end;

  sql_where_cr:='('+sql_where_cr+')';

  sql_where_sm:='';
  RxMemoryDataSM.First;

  for i:=0 to RxMemoryDataSM.RecordCount-1 do
    begin
      if RxMemoryDataSM.FieldByName('RxSelectField').Value=1 then
        begin
          if sql_where_sm<>'' then
            begin
              sql_where_sm:=sql_where_sm+' or ';
            end;
          sql_where_sm:=sql_where_sm+ '(ST_DT_REPORT_PAY_DOC_PROV.SMETA_KOD='+''''+RxMemoryDataSM.FieldByName('RxMemoryDataSM').asString+'''';
          sql_where_sm:=sql_where_sm+ ' and  ST_DT_REPORT_PAY_DOC_PROV.RAZD_KOD='+''''+RxMemoryDataSM.FieldByName('RxMemoryDataRAZD').asString+'''';
          sql_where_sm:=sql_where_sm+ ' and  ST_DT_REPORT_PAY_DOC_PROV.ST_KOD='+''''+RxMemoryDataSM.FieldByName('RxMemoryDataST').asString+'''';
          sql_where_sm:=sql_where_sm+ ' and  ST_DT_REPORT_PAY_DOC_PROV.KEKV_KOD='+''''+RxMemoryDataSM.FieldByName('RxMemoryDataKEKV').asString+''''+')';
        end;
      RxMemoryDataSM.next;
    end;
    sql_where_sm:='('+sql_where_sm+')';
// FNR

  sql_master_result:=Sql_Master_l+' and '+sql_where_db+' and '+sql_where_cr+' and '+sql_where_sm+sql_master_add_l;
  sql_detail_result:=Sql_Detail_l+' and '+sql_where_db+' and '+sql_where_cr+' and '+sql_where_sm+' ORDER BY FAMILIA,IMYA,OTCHESTVO';
  if (sql_where_db='()') then
    begin
      messageBox(Handle,PChar('Не выбран дебетовый счет'),
           PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_ICONWARNING or MB_OK);
      exit;
    end;

  if (sql_where_cr='()') then
    begin
      messageBox(Handle,PChar('Не выбран кредитовый счет'),
           PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_ICONWARNING or MB_OK);
      exit;
    end;

  if (sql_where_sm='()') then
    begin
      messageBox(Handle,PChar('Не выбрана смета '),
           PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_ICONWARNING or MB_OK);
      exit;
    end;

  if Type_R=0 then
    begin
      pFIBDataSetPrintMaster.Active:=false;
      pFIBDataSetPrintMaster.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMaster.SQLs.SelectSQL.Add(sql_master_result);
      pFIBDataSetPrintMaster.Active:=true;
      pFIBDataSetPrintDetail.Active:=false;
      pFIBDataSetPrintDetail.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintDetail.SQLs.SelectSQL.Add(sql_detail_result);
    end;
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'RPayOnDay'+'.fr3');
  frxReport.Variables.Clear;
  frxReport.Variables['BUILDS']:= ''''+StudcityConst.Studcity_ReportsLiversBuild+'''';
  frxReport.Variables['FAK']:= ''''+StudcityConst.Studcity_ReportsLiversFak+'''';
  frxReport.Variables['KURS']:= ''''+StudcityConst.Studcity_ReportsLiversCurs+'''';
  frxReport.Variables['CATPAY']:= ''''+StudcityConst.Studcity_ReportsLiversCatPay+'''';
  frxReport.Variables['TYPELIVE']:= ''''+StudcityConst.Studcity_ReportsLiversTypeLive+'''';
  frxReport.Variables['CLASSLIVE']:= ''''+StudcityConst.Studcity_ReportsLiversClassLive+'''';
  frxReport.Variables['NAMEREPORT']:= ''''+StudcityConst.Studcity_ReportsLiversNameReportR+'''';
  frxReport.Variables['DATEROJ']:= ''''+StudcityConst.Studcity_ReportsPrintDATEROJ+'''';
  frxReport.Variables['BEGPROPI']:= ''''+StudcityConst.Studcity_ReportsPrintBegPROPI+'''';
  frxReport.Variables['ENDPROPI']:= ''''+StudcityConst.Studcity_ReportsPrintENDPROPI+'''';
  frxReport.Variables['ROOM']:= ''''+StudcityConst.Studcity_ReportsPrintROOM+'''';
  frxReport.Variables['FIO']:= ''''+StudcityConst.Studcity_ReportsPrintFIO+'''';
  frxReport.Variables['NN']:= ''''+StudcityConst.Studcity_SubsRegNomber+'''';
  frxReport.Variables['VNAMEREPORT']:= ''''+StudcityConst.Studcity_ReportsLiversNameReportR+'''';
  frxReport.Variables['VPAGE']:= ''''+StudcityConst.Studcity_ReportsPage+'''';
  frxReport.Variables['DATEBEGIN']:= ''''+DateToStr(FNR[0][0])+'''';
  frxReport.Variables['DATEEND']:= ''''+DateToStr(FNR[1][0])+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;

    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  frxReport.ShowPreparedReport;

end;

end.


