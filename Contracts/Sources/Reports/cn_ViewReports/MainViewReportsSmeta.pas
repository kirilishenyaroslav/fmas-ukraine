unit MainViewReportsSmeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase,cn_Common_Types,cn_Common_Funcs, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxCheckBox, cxLookAndFeelPainters, cxGridTableView, RxMemDS, ExtCtrls,
  frxClass, frxDesgn, frxDBSet, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, StdCtrls,
  cxButtons, ComCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  Cn_uReportsConst, frxExportImage, frxExportPDF, frxExportRTF,
  frxExportXML, frxExportHTML;
type
  TfrmMainViewReportsSmeta = class(TForm)
    cxGridDB: TcxGrid;
    cxGridDBDBTableView1: TcxGridDBTableView;
    CxSelectField: TcxGridDBColumn;
    CxNameField: TcxGridDBColumn;
    RxNameVariantDB: TcxGridDBColumn;
    cxGridDBLevel1: TcxGridLevel;
    cxGridCR: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    RxNameVariantKD: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridSM: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    RxNameVariantSmRzSt: TcxGridDBColumn;
    RxNameVariantSmeta: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    StatusBar1: TStatusBar;
    cxButtonOK: TcxButton;
    cxButtonCancel: TcxButton;
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
    RxMemoryDataDB: TRxMemoryData;
    DataSourceDB: TDataSource;
    RxMemoryDataCR: TRxMemoryData;
    DataSourceCR: TDataSource;
    DataSourceSM: TDataSource;
    RxMemoryDataSM: TRxMemoryData;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    frxReport: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxJPEGExport1: TfrxJPEGExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    is_debug : Boolean;
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer;Date_beg,Date_end:TDateTime;
          ID_SES:Int64; is_debug : Boolean);overload;
    { Public declarations }
  end;

function ReportsViewSmeta(AParameter:TcnSimpleParams):Variant;stdcall;
exports ReportsViewSmeta;

var
  frmMainViewReportsSmeta: TfrmMainViewReportsSmeta;
  ReportName:String;
  LastIg:Integer;
  Type_R,PLanguageIndex:Integer;
  FV,NFV,FNR:Variant;
  Sql_Master_l,sql_master_add_l,Sql_Detail_l:String;
  res:Variant;
  LDate_beg,LDate_end:TDateTime;
  ID_SESSION:int64;
implementation

{$R *.dfm}

function ReportsViewSmeta(AParameter:TcnSimpleParams):Variant;stdcall;
var
  View:TfrmMainViewReportsSmeta;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmMainViewReportsSmeta) then exit;
  View:=TfrmMainViewReportsSmeta.Create(AParameter.Owner,AParameter.Db_Handle,AParameter.Type_Report,
        AParameter.Sql_Master,AParameter.Sql_Detail,AParameter.FieldView,AParameter.NotFieldView,
        AParameter.FieldNameReport,AParameter.Report_Name,AParameter.LastIgnor,AParameter.Date_beg,
        AParameter.Date_end,AParameter.ID_SESSION, AParameter.is_debug);
 View.FormStyle:= AParameter.Formstyle;

   case View.FormStyle of
    fsNormal, fsStayOnTop : View.ShowModal;
    fsMDIChild	          : View.Show;
   else begin
    View.ShowModal;
    View.free;
   end;
  end;
Result:=res;
end;

Constructor TfrmMainViewReportsSmeta.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer;Date_beg,Date_end:TDateTime;
          ID_SES:Int64; is_debug : Boolean);
var
  i,j:Integer;
  FieldCount:Integer;
  MFR:TfrxMemoView;
  CountVisible:Integer;
begin
  Inherited Create(AOwner);

  Self.is_debug := is_debug;

  PLanguageIndex:=                      cn_Common_Funcs.cnLanguageIndex();

{  Panel1.Visible:=true;
  Animate1.CommonAVI := aviFindFolder;
  Animate1.Active    := true;
  refresh;}

  Sql_Master_l:=Sql_Master;
  Sql_Detail_l:=Sql_Detail;
  if (VarArrayDimCount(FieldNameReport)>0) then
  sql_master_add_l:=VarToStr(FieldNameReport[0][0]);

  Database.Handle:=DB;
  Type_R:=Type_Report;
  FV:=FieldView;
  NFV:=NotFieldView;
  FNR:=FieldNameReport;
  ReportName:=Report_Name;
  LastIg:=LastIgnor;

  LDate_beg:=Date_beg;
  LDate_end:=Date_end;

  ID_SESSION := ID_SES;

  TimerReports.Enabled:=true;

  pFIBDataSetSchDB.Database:=Database;
  pFIBDataSetSchDB.Transaction:=Transaction;

  pFIBDataSetSchDB.Active:=false;
  pFIBDataSetSchDB.ParamByName('ID_SESSION').Asint64:= ID_SESSION;
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
  pFIBDataSetSchCR.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
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
  pFIBDataSetSM.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
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
  cxButtonOK.Caption := Cn_uReportsConst.cn_ButtonView[PLanguageIndex];
  cxButtonCancel.Caption := Cn_uReportsConst.cn_ButtonCancel[PLanguageIndex];

  Caption := Cn_uReportsConst.cn_RepFormFilter[PLanguageIndex];

  RxNameVariantDB.Caption:= Cn_uReportsConst.cn_RepSchDB[PLanguageIndex];
  RxNameVariantKD.Caption:= Cn_uReportsConst.cn_RepSchKD[PLanguageIndex];
  RxNameVariantSmRzSt.Caption:= Cn_uReportsConst.cn_RepSmeta[PLanguageIndex];
  RxNameVariantSmeta.Caption:= Cn_uReportsConst.cn_RepSmetaName[PLanguageIndex];
end;

procedure TfrmMainViewReportsSmeta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMainViewReportsSmeta.cxButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainViewReportsSmeta.cxButtonOKClick(Sender: TObject);
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
             sql_where_db:=sql_where_db+ ' P.SCH_NUMBER_DB='+''''+RxMemoryDataDB.FieldByName('RxNameField').AsString+'''';
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
              sql_where_cr:=sql_where_cr+ ' P.SCH_NUMBER_KD='+''''+RxMemoryDataCR.FieldByName('RxNameField').AsString+'''';
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
              sql_where_sm:=sql_where_sm+ '(P.SMETA_KOD='+''''+RxMemoryDataSM.FieldByName('RxMemoryDataSM').asString+'''';
              sql_where_sm:=sql_where_sm+ ' and  P.RAZD_KOD='+''''+RxMemoryDataSM.FieldByName('RxMemoryDataRAZD').asString+'''';
              sql_where_sm:=sql_where_sm+ ' and  P.ST_KOD='+''''+RxMemoryDataSM.FieldByName('RxMemoryDataST').asString+'''';
              sql_where_sm:=sql_where_sm+ ' and  P.KEKV_KOD='+''''+RxMemoryDataSM.FieldByName('RxMemoryDataKEKV').asString+''''+')';
            end;
          RxMemoryDataSM.next;
        end;
        sql_where_sm:='('+sql_where_sm+')';

      if (sql_where_db='()') then
        begin
          messageBox(Handle,PChar(Cn_uReportsConst.Studcity_MESSAGE_SCH_DB[PLanguageIndex]),
               PChar(Cn_uReportsConst.Studcity_MESSAGE_WARNING_CONST[PLanguageIndex]),MB_ICONWARNING or MB_OK);
          exit;
        end;

      if (sql_where_cr='()') then
        begin
          messageBox(Handle,PChar(Cn_uReportsConst.Studcity_MESSAGE_SCH_KD[PLanguageIndex]),
               PChar(Cn_uReportsConst.Studcity_MESSAGE_WARNING_CONST[PLanguageIndex]),MB_ICONWARNING or MB_OK);
          exit;
        end;

      if (sql_where_sm='()') then
        begin
          messageBox(Handle,PChar(Cn_uReportsConst.Studcity_MESSAGE_SMETA[PLanguageIndex]),
               PChar(Cn_uReportsConst.Studcity_MESSAGE_WARNING_CONST[PLanguageIndex]),MB_ICONWARNING or MB_OK);
          exit;
        end;


if ReportName='RDOCPROV' then
  begin
      sql_master_result:=Sql_Master_l+' and '+sql_where_db+' and '+sql_where_cr+' and '+sql_where_sm+sql_master_add_l;
      sql_detail_result:=Sql_Detail_l+' and '+sql_where_db+' and '+sql_where_cr+' and '+sql_where_sm+' ORDER BY ISMAINDOG,FIO collate win1251_ua,DOC_DATE';

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
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\CN_RPAYONDAY.fr3');
      frxReport.Variables.Clear;
      frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepRestr[PLanguageIndex]+'''';
      frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
      frxReport.Variables['NAME_REPORT_DOP']:= ''''+Cn_uReportsConst.cn_RepDopDog[PLanguageIndex]+'''';
      frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';

      frxReport.Variables['SPEC']:= ''''+Cn_uReportsConst.cn_RepSpec[PLanguageIndex]+'''';
      frxReport.Variables['NATIONAL']:= ''''+Cn_uReportsConst.cn_RepNational[PLanguageIndex]+'''';
      frxReport.Variables['FORMSTUD']:= ''''+Cn_uReportsConst.cn_RepFormStud[PLanguageIndex]+'''';
      frxReport.Variables['KATSTUD']:= ''''+Cn_uReportsConst.cn_RepKatStud[PLanguageIndex]+'''';
      frxReport.Variables['KURS']:= ''''+Cn_uReportsConst.cn_RepKurs[PLanguageIndex]+'''';
      frxReport.Variables['GROUP']:= ''''+Cn_uReportsConst.cn_RepGroup[PLanguageIndex]+'''';
      frxReport.Variables['ZAMOV']:= ''''+Cn_uReportsConst.cn_Zamov[PLanguageIndex]+'''';
      frxReport.Variables['TYPE_STAGE']:= ''''+Cn_uReportsConst.cn_type_stage[PLanguageIndex]+'''';

      frxReport.Variables['FIO']:= ''''+Cn_uReportsConst.cn_RepFIO[PLanguageIndex]+'''';
      frxReport.Variables['DOG']:= ''''+Cn_uReportsConst.  cn_RepDog[PLanguageIndex]+'''';
      frxReport.Variables['DATEDOG']:= ''''+Cn_uReportsConst.cn_RepDateDog[PLanguageIndex]+'''';
      frxReport.Variables['PERIODDOG']:= ''''+Cn_uReportsConst.cn_RepDogperiod[PLanguageIndex]+'''';
      frxReport.Variables['PAYDOG']:= ''''+Cn_uReportsConst.cn_RepDogPay[PLanguageIndex]+'''';
      frxReport.Variables['SUMENDDOG']:= ''''+Cn_uReportsConst.cn_RepDogSumEnd[PLanguageIndex]+'''';

      frxReport.Variables['BEGIN']:= ''''+Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex]+'''';
      frxReport.Variables['END']:= ''''+Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex]+'''';

      frxReport.Variables['cn_RepDogSumNeed']:= ''''+Cn_uReportsConst.cn_RepDogSumNeed[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDogSumPay']:= ''''+Cn_uReportsConst.cn_RepDogSumPay[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDogSumOverPay']:= ''''+Cn_uReportsConst.cn_RepDogSumOverPay[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDogSumDate']:= ''''+Cn_uReportsConst.cn_RepDogSumDate[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDogSumTextOver']:= ''''+Cn_uReportsConst.cn_RepDogSumTextOver[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDogSumText']:= ''''+Cn_uReportsConst.cn_RepDogSumText[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDogSumTextNEED']:= ''''+Cn_uReportsConst.cn_RepDogSumTextNEED[PLanguageIndex]+'''';

      frxReport.Variables['cn_RepPere']:= ''''+Cn_uReportsConst.cn_RepPere[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepNeed']:= ''''+Cn_uReportsConst.cn_RepNeed[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepToch']:= ''''+Cn_uReportsConst.cn_RepToch[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepOpldate']:= ''''+Cn_uReportsConst.cn_RepOpldate[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepMainDogEX']:= ''''+Cn_uReportsConst.cn_RepMainDogEX[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDopDogEX']:= ''''+Cn_uReportsConst.cn_RepDopDogEX[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepSumAll']:= ''''+Cn_uReportsConst.cn_RepSumAll[PLanguageIndex]+'''';

      frxReport.Variables['cn_RepDocProvR2']:= ''''+Cn_uReportsConst.cn_RepDocProvR2[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvR3']:= ''''+Cn_uReportsConst.cn_RepDocProvR3[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvR6']:= ''''+Cn_uReportsConst.cn_RepDocProvRT6[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvR7']:= ''''+Cn_uReportsConst.cn_RepDocProvRT7[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvR8']:= ''''+Cn_uReportsConst.cn_RepDocProvRT8[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvR9']:= ''''+Cn_uReportsConst.cn_RepDocProvRT9[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvR10']:= ''''+Cn_uReportsConst.cn_RepDocProvRT10[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvR11']:= ''''+Cn_uReportsConst.cn_RepDocProvRT11[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvR12']:= ''''+Cn_uReportsConst.cn_RepDocProvRT12[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvR13']:= ''''+Cn_uReportsConst.cn_RepDocProvRT13[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvROS']:= ''''+Cn_uReportsConst.cn_RepDocProvROS[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvRDop']:= ''''+Cn_uReportsConst.cn_RepDocProvRDop[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocAllSum']:= ''''+Cn_uReportsConst.cn_RepDocAllSum[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocAllDoc']:= ''''+Cn_uReportsConst.cn_RepDocAllDoc[PLanguageIndex]+'''';

      frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
      frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

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
  end;
if ReportName='CN_RDOCPROVCNT'  then
  begin
    sql_master_result:='select P.doc_date,COUNT(*),SUM(P.summa) from   cn_tmp_report_pay_doc_prov P where  P.id_session='+IntToStr(ID_SESSION);
    sql_master_result:=sql_master_result+' and '+sql_where_db+' and '+sql_where_cr+' and '+sql_where_sm+' group by P.doc_date order by P.doc_date';

    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_RDOCPROVCNT.fr3');
    frxReport.Variables.Clear;

    frxReport.Variables['cn_RepSVDPDoc']:= ''''+Cn_uReportsConst.cn_RepSVDPDoc[PLanguageIndex]+'''';
    frxReport.Variables['cn_RepSVDPDocNumber']:= ''''+Cn_uReportsConst.cn_RepSVDPDocNumber[PLanguageIndex]+'''';
    frxReport.Variables['cn_RepSVDPDocDate']:= ''''+Cn_uReportsConst.cn_RepSVDPDocDate[PLanguageIndex]+'''';
    frxReport.Variables['cn_RepSVDPDocCNT']:= ''''+Cn_uReportsConst.cn_RepSVDPDocCNT[PLanguageIndex]+'''';
    frxReport.Variables['cn_RepSVDPDocSumma']:= ''''+Cn_uReportsConst.cn_RepSVDPDocSumma[PLanguageIndex]+'''';

    frxReport.Variables['cn_RepDocProvR2']:= ''''+Cn_uReportsConst.cn_RepDocProvR2[PLanguageIndex]+'''';
    frxReport.Variables['cn_RepDocProvR3']:= ''''+Cn_uReportsConst.cn_RepDocProvR3[PLanguageIndex]+'''';
    frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepSumAll[PLanguageIndex]+'''';


    frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
    frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

    pFIBDataSetPrintMaster.Active:=false;
    pFIBDataSetPrintMaster.SQLs.SelectSQL.Clear;
    pFIBDataSetPrintMaster.SQLs.SelectSQL.Add(sql_master_result);
    pFIBDataSetPrintMaster.Active:=true;
  end;

//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

end.
