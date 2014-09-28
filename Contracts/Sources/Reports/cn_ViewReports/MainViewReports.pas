unit MainViewReports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxExportXML, frxClass, frxExportXLS, ExtCtrls, FIBQuery,
  pFIBQuery, pFIBStoredProc, frxDBSet, DB, frxDesgn, RxMemDS, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxControls, cxContainer, cxEdit,
  cxLabel, ComCtrls,IBase,cn_Common_Types,cn_Common_Funcs,Cn_uReportsConst,
  Gauges, frxExportRTF, frxExportPDF, frxExportHTML, frxExportImage;

type
  TfrmMainViewReports = class(TForm)
    Panel1: TPanel;
    Animate1: TAnimate;
    cxLabel1: TcxLabel;
    pFIBDataSetPrintMaster: TpFIBDataSet;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    RxMemoryData: TRxMemoryData;
    frxDesigner1: TfrxDesigner;
    pFIBDataSetPrintDetail: TpFIBDataSet;
    DataSourceMaster: TDataSource;
    frxDBDatasetDetails: TfrxDBDataset;
    frxDBDatasetMaster: TfrxDBDataset;
    pFIBStoredProcSaveRX: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    pFIBDataSetPrintMasterRX: TpFIBDataSet;
    frxDBDatasetMasterRX: TfrxDBDataset;
    TimerReports: TTimer;
    Gauge: TGauge;
    pFIBDataSetPere: TpFIBDataSet;
    pFIBDataSetZad: TpFIBDataSet;
    frxDBDatasetPere: TfrxDBDataset;
    frxDBDatasetZad: TfrxDBDataset;
    pFIBDataSetPere2: TpFIBDataSet;
    frxDBDatasetPere2: TfrxDBDataset;
    pFIBDataSetZad2: TpFIBDataSet;
    frxDBDatasetZad2: TfrxDBDataset;
    frxHTMLExport1: TfrxHTMLExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxReport: TfrxReport;
    DataSet_diss: TpFIBDataSet;
    frxDataset_diss: TfrxDBDataset;
    procedure RDocClear();
    procedure RDocClearFunc();
    procedure RCNTDOG();
    procedure RCNTDOGL();
    procedure SVCNTDOG();
    procedure SVCNTDOG_DONGUET();
    procedure RSUMPAY();
    procedure RSUMPAY_EX();
    procedure RSUMPAY_DONGU();
    procedure RSUMPAY_EX_DONGU();
    procedure RSUMPAY_ANALYZ();
    procedure SVSUMPAY();
    procedure SVSUMPAY_ANALYZ();
    procedure SVSUMPAY_ANALYZ_DONGUET();
    procedure SVSUMPAY_DONGUET();
    procedure SVPayDaySM();
    procedure SVPayDay();
    procedure SVPayDay_DONGUET();
    procedure RACCOUNT();
    procedure RACCOUNT_NACH();
    procedure SVACCOUNT();
    procedure SVAnalyzSmeta();
    procedure RDOCPROVCNT();
    procedure SVPERCENTPAY();
    procedure SVSUMLGOT();
    procedure RSUMLGOT();
    procedure SVUNSUM();
    procedure RUNSUM();
    procedure SVDISS();
    procedure SVDISS_CNT();
    procedure SVDISSR();
    procedure SVPAYANALYZ();
    procedure RPAYANALYZ();
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerReportsTimer(Sender: TObject);
    procedure DeleteDoc();
  private
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer;
          Date_beg,Date_end:TDateTime;ID_SESSION_L:int64; is_debug : Boolean);overload;
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;LastIgnor:Integer;FieldView:Variant;sql_text:String; is_Debug : Boolean);overload;
    { Private declarations }
  public
    is_debug : Boolean;
    { Public declarations }
  end;

function ReportsView(AParameter:TcnSimpleParams):Variant;stdcall;
 exports ReportsView;

function ReportsLogClear(AParameter:TcnSimpleParams):TRxMemoryData;stdcall;
 exports ReportsLogClear;

var
  frmMainViewReports: TfrmMainViewReports;
  ReportName:String;
  LastIg:Integer;
  Type_R,PLanguageIndex:Integer;
  FV,NFV,FNR:Variant;
  Sql_Master_l,Sql_Detail_l:String;
  res:Variant;
  LDate_beg,LDate_end:TDateTime;
  ID_SESSION:Int64;
  ResRxMemoryData:TRxMemoryData;
implementation

uses MainViewReportsSmeta;

{$R *.dfm}

function ReportsView(AParameter:TcnSimpleParams):Variant;stdcall;
var
  View:TfrmMainViewReports;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmMainViewReports) then exit;
  View:=TfrmMainViewReports.Create(AParameter.Owner,AParameter.Db_Handle,AParameter.Type_Report,
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

function ReportsLogClear(AParameter:TcnSimpleParams):TRxMemoryData;stdcall;
var
  View:TfrmMainViewReports;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmMainViewReports) then exit;

 //if not Assigned(AParameter.Db_Handle) then ShowMessage('Error in MainViewReports');
 //ShowMessage(IntToStr(AParameter.Id_session));

 View:=TfrmMainViewReports.Create(AParameter.Owner,AParameter.Db_Handle,AParameter.LastIgnor,
        AParameter.FieldNameReport,AParameter.Sql_Master, AParameter.is_debug);

 View.FormStyle:= AParameter.Formstyle;

   case View.FormStyle of
    fsNormal, fsStayOnTop : View.ShowModal;
    fsMDIChild	          : View.Show;
   else begin
    View.ShowModal;
    View.free;
   end;
  end;
Result:=ResRxMemoryData;
end;


Constructor TfrmMainViewReports.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer;Date_beg,Date_end:TDateTime;
          ID_SESSION_L:int64; is_debug : Boolean);
begin
  Inherited Create(AOwner);

  self.is_debug := is_debug;
  PLanguageIndex :=                      cn_Common_Funcs.cnLanguageIndex();

  Panel1.Visible:=true;
  Animate1.CommonAVI := aviFindFolder;
  Animate1.Active    := true;
  refresh;

  Sql_Master_l:=Sql_Master;
  Sql_Detail_l:=Sql_Detail;

  Database.Handle:=DB;
  database.Open;

  Type_R:=Type_Report;
  FV:=FieldView;
  NFV:=NotFieldView;
  FNR:=FieldNameReport;
  ReportName:=Report_Name;
  LastIg:=LastIgnor;

  LDate_beg:=Date_beg;
  LDate_end:=Date_end;

  ID_SESSION:=ID_SESSION_L;

  TimerReports.Enabled:=true;

  Caption := Cn_uReportsConst.Studcity_MESSAGE_WAIT_CONST[PLanguageIndex];
  cxLabel1.Caption := Cn_uReportsConst.Studcity_MESSAGE_WAIT_CONST[PLanguageIndex];
end;


Constructor TfrmMainViewReports.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;
                         LastIgnor:Integer;FieldView:Variant;sql_text:String; is_debug : Boolean);
begin
  Inherited Create(AOwner);

  self.is_debug := is_Debug;
  PLanguageIndex:=                      cn_Common_Funcs.cnLanguageIndex();

  Panel1.Visible:=true;
  Animate1.CommonAVI := aviFindFolder;
  Animate1.Active    := true;
  refresh;

  Sql_Master_l:=sql_text;

  Database.Handle:=DB;

  //if not Assigned(Db) then ShowMessage('Error in MainViewREports');

  FV:=FieldView;

  LastIg:=LastIgnor;

  TimerReports.Enabled:=true;

  Caption := Cn_uReportsConst.Studcity_MESSAGE_WAIT_CONST[PLanguageIndex];
  cxLabel1.Caption := Cn_uReportsConst.Studcity_MESSAGE_WAIT_CONST[PLanguageIndex];

  ResRxMemoryData:=TRxMemoryData.Create(self);
  pFIBDataSetPrintMaster.Active:=false;
  pFIBDataSetPrintMaster.SQLs.SelectSQL.Text:=sql_text;
  pFIBDataSetPrintMaster.Active:=True;
  RDocClearFunc();
  Exit;
end;


procedure TfrmMainViewReports.FormCreate(Sender: TObject);
begin
{  Panel1.Visible:=true;
  Animate1.CommonAVI := aviFindFolder;
  Animate1.Active    := true;
  refresh;}
end;

procedure TfrmMainViewReports.DeleteDoc();
Begin
  if ((ReportName='SVCNTDOG')
   or (ReportName='SVSUMPAY')
   or (ReportName='SVPayDaySM')
   or (ReportName='SVPayDay')
   or (ReportName='SVCNTDOG_DONGUET')
   or (ReportName='SVSUMPAY_DONGUET')
   or (ReportName='SVPayDay_DONGUET')
   or (ReportName='SVSUMPAY_ANALYZ')
   or (ReportName='SVSUMPAY_ANALYZ_DONGUET')
   or (ReportName='SVAnalyzSmeta')
   or (ReportName='SVPERCENTPAY')
   or (ReportName='SVSUMLGOT')
   or (ReportName='SVUNSUM')
   or (ReportName='SVACCOUNT')
   or (ReportName='SVDISS')
   or (ReportName='SVDISS_CNT')
   or (ReportName='SVPAYANALYZ'))
   then
    begin
     pFIBStoredProcSaveRX.Database:=Database;
     WriteTransaction.DefaultDatabase:=Database;
     WriteTransaction.StartTransaction;
     pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
     pFIBStoredProcSaveRX.StoredProcName:='CN_TMP_REPORT_STUD_SV_DELETE';
     pFIBStoredProcSaveRX.Prepare;
     pFIBStoredProcSaveRX.ParamByName('ID_SESSION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsInteger;
     try
       pFIBStoredProcSaveRX.ExecProc;
      except
       begin
        Exit;
        WriteTransaction.Rollback;
       end;
     end;
     WriteTransaction.Commit;
    end;
End;

procedure TfrmMainViewReports.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
  DeleteDoc;
end;

procedure  TfrmMainViewReports.RDocClear();
var
  i,j:Integer;
  countF,maxCountF:Integer;
  FiledC,FiledT:array of Variant;
  FlagEmpty,Ignor:Integer;
  fieldstring : string;
begin
  countF:=0;
  if Type_R=1 then
    begin
      RxMemoryData.Active:=false;
      RxMemoryData.FieldDefs.Clear;
      for i:=0 to VarArrayHighBound(FV,1) do
        begin
          RxMemoryData.FieldDefs.Add(FV[i][0],ftVariant);
          RxMemoryData.FieldDefs.Add(FV[i][0]+'TB',ftVariant);
          Inc(countF);
        end;
      RxMemoryData.Active:=true;
      maxCountF:=countF;
      SetLength(FiledC,LastIg+1);
      for i:=0 to LastIg do
        begin
          FiledC[i]:='';
        end;
      RxMemoryData.Active:=true;
      pFIBDataSetPrintMaster.FetchAll;
      RxMemoryData.EmptyTable;
      pFIBDataSetPrintMaster.First;
      //ShowMessage(pFIBDataSetPrintMaster.sqls.SelectSQL.Text);
      for j:=0 to pFIBDataSetPrintMaster.RecordCount-1 do
        begin
          RxMemoryData.Open;
          RxMemoryData.Insert;
          for i:=0 to VarArrayHighBound(FV,1) do
            begin
              RxMemoryData.FieldValues[FV[i][0]]:='';
              RxMemoryData.FieldValues[FV[i][0]+'TB']:=0;
            end;
        end;
      RxMemoryData.First;
      for j:=0 to pFIBDataSetPrintMaster.RecordCount-1 do
        begin
         //проверка на объединение
         countF:=0;
         FlagEmpty:=0;
         for i:=0 to LastIg do
          begin
            if FlagEmpty=0 then
              begin
                if FiledC[countF]<>pFIBDataSetPrintMaster.FieldByName(FV[i][0]).AsString then
                  begin
                    FlagEmpty:=1;
                    FiledC[countF]:='';
                    Inc(countF);
                  end
                  else
                  begin
                    Inc(countF);
                  end;
              end
              else
              begin
                FiledC[countF]:='';
                Inc(countF);
              end;
          end;
         //запись данных
         RxMemoryData.Open;
         RxMemoryData.Edit;
         countF:=0;
         Ignor:=0;
         for i:=0 to VarArrayHighBound(FV,1) do
          begin
            if Ignor<=LastIg then
              begin
                if FiledC[countF]<>pFIBDataSetPrintMaster.FieldByName(FV[i][0]).AsString then
                  begin
                    RxMemoryData.FieldByName(FV[i][0]).Value:=pFIBDataSetPrintMaster.FieldValues[FV[i][0]];
                    FiledC[countF]:=pFIBDataSetPrintMaster.FieldByName(FV[i][0]).AsString;
                    Inc(countF);
                  end
                  else
                  begin
                    RxMemoryData.FieldValues[FV[i][0]]:='';
                    Inc(countF);
                  end;
                  Inc(Ignor);
               end
               else
               begin
                 Inc(Ignor);
                 RxMemoryData.FieldByName(FV[i][0]).Value:=pFIBDataSetPrintMaster.FieldValues[FV[i][0]];
                 Inc(countF);
               end;
          end;
        RxMemoryData.Post;
        pFIBDataSetPrintMaster.Next;
        RxMemoryData.Next;
        end;
    end;
//определение верхней границы
RxMemoryData.Last;
SetLength(FiledT,VarArrayHighBound(FV,1)+1);
//начальный забор данных
for j:=0 to VarArrayHighBound(FV,1) do
  begin
    FiledT[j]:=RxMemoryData.FieldByName(FV[j][0]).AsString;
  end;
//проверка
RxMemoryData.Prior;
for i:=1 to RxMemoryData.RecordCount-1 do
  begin
    for j:=0 to VarArrayHighBound(FV,1) do
      begin
        if ((FiledT[j]<>'') and (RxMemoryData.FieldByName(FV[j][0]).AsString<>'')
            or(FiledT[j]<>'') and (RxMemoryData.FieldByName(FV[j][0]).AsString='')) then
          begin
            RxMemoryData.Open;
            RxMemoryData.Edit;
            RxMemoryData.FieldValues[FV[j][0]+'TB']:=1;
          end
          else
          begin
            RxMemoryData.Open;
            RxMemoryData.Edit;
            RxMemoryData.FieldValues[FV[j][0]+'TB']:=0;
          end;
        FiledT[j]:=RxMemoryData.FieldByName(FV[j][0]).AsString;
      end;
    RxMemoryData.Prior;
  end;

  RxMemoryData.First;
  //сохранение в БД
  if (ReportName='SVCNTDOG') or  (ReportName='SVSUMPAY') or (ReportName='SVPayDaySM')
   or (ReportName='SVPayDay')or (ReportName='SVCNTDOG_DONGUET') or(ReportName='SVSUMPAY_DONGUET')or
      (ReportName='SVPayDay_DONGUET') or (ReportName='SVSUMPAY_ANALYZ') or (ReportName='SVSUMPAY_ANALYZ_DONGUET') or
      (ReportName='SVACCOUNT') or (ReportName='SVAnalyzSmeta') or (ReportName='SVPERCENTPAY')or
      (ReportName='SVSUMLGOT') or (ReportName='SVUNSUM') or (ReportName='SVDISS')or (ReportName='SVDISS_CNT')
      or (ReportName='SVPAYANALYZ')
      then
  begin
   //удаление
    DeleteDoc;
    
   //сохранение
   pFIBStoredProcSaveRX.Database:=Database;
   WriteTransaction.DefaultDatabase:=Database;
   WriteTransaction.StartTransaction;
   pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
   if ReportName='SVACCOUNT' then
    begin
     pFIBStoredProcSaveRX.StoredProcName:='CN_ACCOUNT_OLAP_SV_INSERT';
    end
   else
    begin
     pFIBStoredProcSaveRX.StoredProcName:='CN_TMP_REPORT_STUD_SV_INSERT';
    end;
    pFIBStoredProcSaveRX.Prepare;
    RxMemoryData.First;
    Gauge.MaxValue:=RxMemoryData.RecordCount;
    for j:=0 to RxMemoryData.RecordCount-1 do
      begin
        Gauge.Progress:=j;
        pFIBStoredProcSaveRX.ParamByName('ID_SESSION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsInteger;

        {fieldstring := '';
        for i:=0 to VarArrayHighBound(FV,1) do fieldstring := fieldstring+FV[i][0]+';';
        ShowMessage(fieldstring);}

        //ShowMessage(IntToStr(VarArrayHighBound(FV,1)));
        for i:=0 to VarArrayHighBound(FV,1) do
          begin
            //ShowMessage(FV[i][0]);
            if ((FV[i][0]='CNT')or (FV[i][0]='SUM_NEED') or (FV[i][0]='SUM_PAY') or (FV[i][0]='SUM_OVERPAY')
            or (FV[i][0]='SUM_IN_SALDO') or (FV[i][0]='SUM_OUT_SALDO') or
            (FV[i][0]='CUR_NACH') or (FV[i][0]='CUR_PAY') or (FV[i][0]='IN_NACH_DOLG') or (FV[i][0]='OUT_NACH_DOLG')
              or (FV[i][0]='IN_NACH_PERE') or (FV[i][0]='OUT_NACH_PERE'))
              or (FV[i][0]='summa_n_nach') or (FV[i][0]='summa_n_pay')or (FV[i][0]='summa_p_dolg')
              or (FV[i][0]='summa_p_pere') or (FV[i][0]='SUM_PERCENTH100') or (FV[i][0]='SUM_PERCENT100')
              or (FV[i][0]='SUM_PERCENTS100') or (FV[i][0]='SUM_PERCENT50')or (FV[i][0]='SUM_PERCENTS50')
              or (FV[i][0]='SUM_PERCENT0')or (FV[i][0]='SUM_PERCENTS0')
              or (FV[i][0]='SUM_LGOT') or (FV[i][0]='CNTDISS') or (FV[i][0]='CNTUNDISS')
              or (FV[i][0]='CN_SUM_P_DOLG')or (FV[i][0]='CN_SUM_P_PERE')or (FV[i][0]='CN_SUM_P')
              or (FV[i][0]='CN_SUM_N_PAY')or (FV[i][0]='CN_SUM_N_POG_DOLG')
              or (FV[i][0]='CN_SUM_N_PAY_REPORT')or (FV[i][0]='CN_SUM_N_PAY_F')
              or (FV[i][0]='CN_SUM_N_NEEDL')or (FV[i][0]='CN_SUM_N_NEED')or (FV[i][0]='CN_SUM_P_N_PAY')
              or (FV[i][0]='CN_SUM_F_DOLG')or (FV[i][0]='CN_SUM_F_PERE')or (FV[i][0]='CN_SUM_F_ZAD')
              or (FV[i][0]='TYPE_PAY')// or (FV[i][0]='EMIT_FACULT')
              then
              begin
                //showmessage(FV[i][0]);
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]).AsVariant:=RxMemoryData.FieldByName(FV[i][0]).AsVariant;
              end
              else
              begin
                //showmessage(FV[i][0]);
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]).AsString:=RxMemoryData.FieldByName(FV[i][0]).AsString;
              end;
            if (RxMemoryData.FieldByName(FV[i][0]+'TB').IsNull = true) then
              begin
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]+'TB').AsInteger:=0;
              end
              else
              begin
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]+'TB').AsInteger:=RxMemoryData.FieldByName(FV[i][0]+'TB').AsInteger;
              end;  
          end;
          try
            pFIBStoredProcSaveRX.ExecProc;
          except
            begin
              WriteTransaction.Rollback;
//              ShowMessage(E.Message);
              Exit;
            end;
          end;
        RxMemoryData.Next;
      end;
    WriteTransaction.Commit;
  end;
end;

procedure  TfrmMainViewReports.RDocClearFunc();
var
  i,j:Integer;
  countF,maxCountF:Integer;
  FiledC,FiledT:array of Variant;
  FlagEmpty,Ignor:Integer;
begin
  countF:=0;
  if Type_R=1 then
    begin
      RxMemoryData.Active:=false;
      RxMemoryData.FieldDefs.Clear;
      for i:=0 to VarArrayHighBound(FV,1) do
        begin
          RxMemoryData.FieldDefs.Add(FV[i][0],ftVariant);
          RxMemoryData.FieldDefs.Add(FV[i][0]+'TB',ftVariant);
          Inc(countF);
        end;
      RxMemoryData.Active:=true;
      maxCountF:=countF;
      SetLength(FiledC,LastIg+1);
      for i:=0 to LastIg do
        begin
          FiledC[i]:='';
        end;
      RxMemoryData.Active:=true;
      pFIBDataSetPrintMaster.FetchAll;
      RxMemoryData.EmptyTable;
      pFIBDataSetPrintMaster.First;
      for j:=0 to pFIBDataSetPrintMaster.RecordCount-1 do
        begin
          RxMemoryData.Open;
          RxMemoryData.Insert;
          for i:=0 to VarArrayHighBound(FV,1) do
            begin
              RxMemoryData.FieldValues[FV[i][0]]:='';
              RxMemoryData.FieldValues[FV[i][0]+'TB']:=0;
            end;
        end;
      RxMemoryData.First;
      for j:=0 to pFIBDataSetPrintMaster.RecordCount-1 do
        begin
         //проверка на объединение
         countF:=0;
         FlagEmpty:=0;
         for i:=0 to LastIg do
          begin
            if FlagEmpty=0 then
              begin
                if FiledC[countF]<>pFIBDataSetPrintMaster.FieldByName(FV[i][0]).AsString then
                  begin
                    FlagEmpty:=1;
                    FiledC[countF]:='';
                    Inc(countF);
                  end
                  else
                  begin
                    Inc(countF);
                  end;
              end
              else
              begin
                FiledC[countF]:='';
                Inc(countF);
              end;
          end;
         //запись данных
         RxMemoryData.Open;
         RxMemoryData.Edit;
         countF:=0;
         Ignor:=0;
         for i:=0 to VarArrayHighBound(FV,1) do
          begin
            if Ignor<=LastIg then
              begin
                if FiledC[countF]<>pFIBDataSetPrintMaster.FieldByName(FV[i][0]).AsString then
                  begin
                    RxMemoryData.FieldByName(FV[i][0]).Value:=pFIBDataSetPrintMaster.FieldValues[FV[i][0]];
                    FiledC[countF]:=pFIBDataSetPrintMaster.FieldByName(FV[i][0]).AsString;
                    Inc(countF);
                  end
                  else
                  begin
                    RxMemoryData.FieldValues[FV[i][0]]:='';
                    Inc(countF);
                  end;
                  Inc(Ignor);
               end
               else
               begin
                 Inc(Ignor);
                 RxMemoryData.FieldByName(FV[i][0]).Value:=pFIBDataSetPrintMaster.FieldValues[FV[i][0]];
                 Inc(countF);
               end;
          end;
        RxMemoryData.Post;
        pFIBDataSetPrintMaster.Next;
        RxMemoryData.Next;
        end;
    end;
//определение верхней границы
RxMemoryData.Last;
SetLength(FiledT,VarArrayHighBound(FV,1)+1);
//начальный забор данных
for j:=0 to VarArrayHighBound(FV,1) do
  begin
    FiledT[j]:=RxMemoryData.FieldByName(FV[j][0]).AsString;
  end;
//проверка
RxMemoryData.Prior;
for i:=1 to RxMemoryData.RecordCount-1 do
  begin
    for j:=0 to VarArrayHighBound(FV,1) do
      begin
        if ((FiledT[j]<>'') and (RxMemoryData.FieldByName(FV[j][0]).AsString<>'')
            or(FiledT[j]<>'') and (RxMemoryData.FieldByName(FV[j][0]).AsString='')) then
          begin
            RxMemoryData.Open;
            RxMemoryData.Edit;
            RxMemoryData.FieldValues[FV[j][0]+'TB']:=1;
          end
          else
          begin
            RxMemoryData.Open;
            RxMemoryData.Edit;
            RxMemoryData.FieldValues[FV[j][0]+'TB']:=0;
          end;
        FiledT[j]:=RxMemoryData.FieldByName(FV[j][0]).AsString;
      end;
    RxMemoryData.Prior;
  end;
ResRxMemoryData:=RxMemoryData;
end;

procedure TfrmMainViewReports.RCNTDOG();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\RCNTDOG.fr3');
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
  frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepALL[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;

      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.RCNTDOGL();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\RCNTDOGL.fr3');
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
  frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepALL[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;

      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVCNTDOG();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPrintMasterRX.Active:=true;
    end
    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\SVCNTDOG.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSV[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_DOP']:= ''''+Cn_uReportsConst.cn_RepDopDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';

  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
  frxReport.Variables['SPEC']:= ''''+Cn_uReportsConst.cn_RepSpec[PLanguageIndex]+'''';
  frxReport.Variables['NATIONAL']:= ''''+Cn_uReportsConst.cn_RepNational[PLanguageIndex]+'''';
  frxReport.Variables['FORMSTUD']:= ''''+Cn_uReportsConst.cn_RepFormStud[PLanguageIndex]+'''';
  frxReport.Variables['KATSTUD']:= ''''+Cn_uReportsConst.cn_RepKatStud[PLanguageIndex]+'''';
  frxReport.Variables['KURS']:= ''''+Cn_uReportsConst.cn_RepKurs[PLanguageIndex]+'''';
  frxReport.Variables['GROUP']:= ''''+Cn_uReportsConst.cn_RepGroup[PLanguageIndex]+'''';
  frxReport.Variables['ZAMOV']:= ''''+Cn_uReportsConst.cn_Zamov[PLanguageIndex]+'''';
  frxReport.Variables['TYPE_STAGE']:= ''''+Cn_uReportsConst.cn_Type_stage[PLanguageIndex]+'''';

  frxReport.Variables['FIO']:= ''''+Cn_uReportsConst.cn_RepFIO[PLanguageIndex]+'''';
  frxReport.Variables['DOG']:= ''''+Cn_uReportsConst.  cn_RepDog[PLanguageIndex]+'''';
  frxReport.Variables['DATEDOG']:= ''''+Cn_uReportsConst.cn_RepDateDog[PLanguageIndex]+'''';
  frxReport.Variables['PERIODDOG']:= ''''+Cn_uReportsConst.cn_RepDogperiod[PLanguageIndex]+'''';
  frxReport.Variables['PAYDOG']:= ''''+Cn_uReportsConst.cn_RepDogPay[PLanguageIndex]+'''';
  frxReport.Variables['SUMENDDOG']:= ''''+Cn_uReportsConst.cn_RepDogSumEnd[PLanguageIndex]+'''';

  frxReport.Variables['BEGIN']:= ''''+Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex]+'''';
  frxReport.Variables['END']:= ''''+Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex]+'''';
  frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepSVALL[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepStudSVFT[PLanguageIndex]+'''';

  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;
  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
   MFR:=frxReport.FindObject('MemoSUM_NEED') as TfrxMemoView;
   MFR.Width:=100;

   MFR:=frxReport.FindObject('MemoSumSUM_NEED') as TfrxMemoView;
   MFR.Width:=100;

   MFR:=frxReport.FindObject('MemoTitleSUM_NEED') as TfrxMemoView;
   MFR.Width:=100;
//   frxReport.DesignReport;
   frxReport.PrepareReport(true);
   if is_debug then frxReport.DesignReport
               else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVCNTDOG_DONGUET();
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPere.Active:=false;
      pFIBDataSetPere.SQLs.SelectSQL.Clear;
      pFIBDataSetPere.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where EMIT_FACULT =0 and ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPere.Active:=true;

      pFIBDataSetZad.Active:=false;
      pFIBDataSetZad.SQLs.SelectSQL.Clear;
      pFIBDataSetZad.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where EMIT_FACULT =1 and ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetZad.Active:=true;
    end;
{    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;}
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\SVCNTDOG_DONGUET.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSV[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_DOP']:= ''''+Cn_uReportsConst.cn_RepDopDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';

  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
  frxReport.Variables['SPEC']:= ''''+Cn_uReportsConst.cn_RepSpec[PLanguageIndex]+'''';
  frxReport.Variables['NATIONAL']:= ''''+Cn_uReportsConst.cn_RepNational[PLanguageIndex]+'''';
  frxReport.Variables['FORMSTUD']:= ''''+Cn_uReportsConst.cn_RepFormStud[PLanguageIndex]+'''';
  frxReport.Variables['KATSTUD']:= ''''+Cn_uReportsConst.cn_RepKatStud[PLanguageIndex]+'''';
  frxReport.Variables['KURS']:= ''''+Cn_uReportsConst.cn_RepKurs[PLanguageIndex]+'''';
  frxReport.Variables['GROUP']:= ''''+Cn_uReportsConst.cn_RepGroup[PLanguageIndex]+'''';
  frxReport.Variables['TYPE_STAGE']:= ''''+Cn_uReportsConst.cn_type_stage[PLanguageIndex]+'''';

  frxReport.Variables['FIO']:= ''''+Cn_uReportsConst.cn_RepFIO[PLanguageIndex]+'''';
  frxReport.Variables['DOG']:= ''''+Cn_uReportsConst.  cn_RepDog[PLanguageIndex]+'''';
  frxReport.Variables['DATEDOG']:= ''''+Cn_uReportsConst.cn_RepDateDog[PLanguageIndex]+'''';
  frxReport.Variables['PERIODDOG']:= ''''+Cn_uReportsConst.cn_RepDogperiod[PLanguageIndex]+'''';
  frxReport.Variables['PAYDOG']:= ''''+Cn_uReportsConst.cn_RepDogPay[PLanguageIndex]+'''';
  frxReport.Variables['SUMENDDOG']:= ''''+Cn_uReportsConst.cn_RepDogSumEnd[PLanguageIndex]+'''';

  frxReport.Variables['BEGIN']:= ''''+Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex]+'''';
  frxReport.Variables['END']:= ''''+Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex]+'''';
  frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepSVALL[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepStudSVFT[PLanguageIndex]+'''';

  frxReport.Variables['cn_RepDONGUETOtdel']:= ''''+Cn_uReportsConst.cn_RepDONGUETOtdel[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDONGUETCNT']:= ''''+Cn_uReportsConst.cn_RepDONGUETCNT[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDONGUETCNTOtdel']:= ''''+Cn_uReportsConst.cn_RepDONGUETCNTOtdel[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDONGUETAll']:= ''''+Cn_uReportsConst.cn_RepDONGUETAll[PLanguageIndex]+'''';

{  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;}
//   frxReport.DesignReport;
   frxReport.PrepareReport(true);
   if is_debug then frxReport.DesignReport
               else frxReport.ShowReport;
end;


procedure TfrmMainViewReports.RSUMPAY();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\RSUMPAY.fr3');
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
  frxReport.Variables['cn_RepDogSumNeedPay']:= ''''+Cn_uReportsConst.cn_RepDogSumNeedPay[PLanguageIndex]+'''';
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


  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;
  //frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.RSUMPAY_EX();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\RSUMPAY_EX.fr3');
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
  frxReport.Variables['cn_RepDogSumNeedPay']:= ''''+Cn_uReportsConst.cn_RepDogSumNeedPay[PLanguageIndex]+'''';
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


  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;
  //frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.RSUMPAY_DONGU();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\RSUMPAY_DONGU.fr3');
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
  frxReport.Variables['cn_RepDogSumNeedPay']:= ''''+Cn_uReportsConst.cn_RepDogSumNeedPay[PLanguageIndex]+'''';
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


  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;
  //frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.RSUMPAY_EX_DONGU();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\RSUMPAY_EX_DONGU.fr3');
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
  frxReport.Variables['cn_RepDogSumNeedPay']:= ''''+Cn_uReportsConst.cn_RepDogSumNeedPay[PLanguageIndex]+'''';
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


  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;
  //frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVSUMPAY();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  pFIBDataSetPrintMasterRX.Active:=false;
  pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
  pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION='+VarToStr(ID_SESSION));
  pFIBDataSetPrintMasterRX.Active:=true;

  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\SVSUMPAY.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSVPAY[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT1']:= ''''+Cn_uReportsConst.cn_RepSVPAY1[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';
  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
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
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepSumAll[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPAYPERE']:= ''''+Cn_uReportsConst.cn_RepSVPAYPERE[PLanguageIndex]+'''';


  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
     MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
     MFR.Visible:=true;
     MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
     MFR.Visible:=true;
     MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
     MFR.Visible:=true;
    end;
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVSUMPAY_ANALYZ();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPrintMasterRX.Active:=true;
    end
    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;


  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\SVSUMPAY_ANALYZ.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSVPAY[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT1']:= ''''+Cn_uReportsConst.cn_RepSVPAY1[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';
  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
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
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepSumAll[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPAYPERE']:= ''''+Cn_uReportsConst.cn_RepSVPAYPERE[PLanguageIndex]+'''';

  frxReport.Variables['cn_RepSVAnalyz']:= ''''+Cn_uReportsConst.cn_RepSVAnalyz[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzIN']:= ''''+Cn_uReportsConst.cn_RepRAnalyzIN[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzNEED']:= ''''+Cn_uReportsConst.cn_RepRAnalyzNEED[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzPAY']:= ''''+Cn_uReportsConst.cn_RepRAnalyzPAY[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzOUT']:= ''''+Cn_uReportsConst.cn_RepRAnalyzOUT[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzAllSaldo']:= ''''+Cn_uReportsConst.cn_RepRAnalyzAllSaldo[PLanguageIndex]+'''';

  frxReport.Variables['cn_RepRAnalyzCNT']:= ''''+Cn_uReportsConst.cn_RepRAnalyzCNT[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzSUMPrint']:= ''''+Cn_uReportsConst.cn_RepRAnalyzSUMPrint[PLanguageIndex]+'''';


  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVSUMPAY_DONGUET();
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPere.Active:=false;
      pFIBDataSetPere.SQLs.SelectSQL.Clear;
      pFIBDataSetPere.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where EMIT_FACULT =0 and TYPE_PAY=1 and ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPere.Active:=true;

      pFIBDataSetZad.Active:=false;
      pFIBDataSetZad.SQLs.SelectSQL.Clear;
      pFIBDataSetZad.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where EMIT_FACULT =1 and TYPE_PAY=1 and ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetZad.Active:=true;

      pFIBDataSetPere2.Active:=false;
      pFIBDataSetPere2.SQLs.SelectSQL.Clear;
      pFIBDataSetPere2.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where EMIT_FACULT =0 and TYPE_PAY=-1 and ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPere2.Active:=true;

      pFIBDataSetZad2.Active:=false;
      pFIBDataSetZad2.SQLs.SelectSQL.Clear;
      pFIBDataSetZad2.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where EMIT_FACULT =1 and TYPE_PAY=-1 and ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetZad2.Active:=true;

    end;
{    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;}
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\SVSUMPAY_DONGUET.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSVPAY[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPAYPERE']:= ''''+Cn_uReportsConst.cn_RepSVPAYPERE[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT1']:= ''''+Cn_uReportsConst.cn_RepSVPAY1[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_DOP']:= ''''+Cn_uReportsConst.cn_RepDopDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';

  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
  frxReport.Variables['SPEC']:= ''''+Cn_uReportsConst.cn_RepSpec[PLanguageIndex]+'''';
  frxReport.Variables['NATIONAL']:= ''''+Cn_uReportsConst.cn_RepNational[PLanguageIndex]+'''';
  frxReport.Variables['FORMSTUD']:= ''''+Cn_uReportsConst.cn_RepFormStud[PLanguageIndex]+'''';
  frxReport.Variables['KATSTUD']:= ''''+Cn_uReportsConst.cn_RepKatStud[PLanguageIndex]+'''';
  frxReport.Variables['KURS']:= ''''+Cn_uReportsConst.cn_RepKurs[PLanguageIndex]+'''';
  frxReport.Variables['GROUP']:= ''''+Cn_uReportsConst.cn_RepGroup[PLanguageIndex]+'''';
  frxReport.Variables['TYPE_STAGE']:= ''''+Cn_uReportsConst.cn_type_stage[PLanguageIndex]+'''';

  frxReport.Variables['FIO']:= ''''+Cn_uReportsConst.cn_RepFIO[PLanguageIndex]+'''';
  frxReport.Variables['DOG']:= ''''+Cn_uReportsConst.  cn_RepDog[PLanguageIndex]+'''';
  frxReport.Variables['DATEDOG']:= ''''+Cn_uReportsConst.cn_RepDateDog[PLanguageIndex]+'''';
  frxReport.Variables['PERIODDOG']:= ''''+Cn_uReportsConst.cn_RepDogperiod[PLanguageIndex]+'''';
  frxReport.Variables['PAYDOG']:= ''''+Cn_uReportsConst.cn_RepDogPay[PLanguageIndex]+'''';
  frxReport.Variables['SUMENDDOG']:= ''''+Cn_uReportsConst.cn_RepDogSumEnd[PLanguageIndex]+'''';

  frxReport.Variables['BEGIN']:= ''''+Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex]+'''';
  frxReport.Variables['END']:= ''''+Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex]+'''';
  frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepSVALL[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepStudSVFT[PLanguageIndex]+'''';

  frxReport.Variables['cn_RepDONGUETOtdel']:= ''''+Cn_uReportsConst.cn_RepDONGUETOtdel[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDONGUETCNT']:= ''''+Cn_uReportsConst.cn_RepDONGUETCNT[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDONGUETCNTOtdel']:= ''''+Cn_uReportsConst.cn_RepDONGUETCNTOtdel[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDONGUETAll']:= ''''+Cn_uReportsConst.cn_RepDONGUETAll[PLanguageIndex]+'''';

{  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;}
//   frxReport.DesignReport;
   frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;


procedure TfrmMainViewReports.SVPayDaySM();
begin
        if pFIBDataSetPrintMaster.RecordCount>0 then
          begin
            pFIBDataSetPrintMasterRX.Active:=false;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
            pFIBDataSetPrintMasterRX.Active:=true;
          end
          else
          begin
            pFIBDataSetPrintMasterRX.Active:=false;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION<-1');
            pFIBDataSetPrintMasterRX.Active:=true;
          end;

      frxReport.Clear;
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\SVPayDaySM.fr3');
      frxReport.Variables.Clear;

      frxReport.Variables['cn_RepDocProvR']:= ''''+Cn_uReportsConst.cn_RepDocProvR[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvR1']:= ''''+Cn_uReportsConst.cn_RepDocProvR1[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvR2']:= ''''+Cn_uReportsConst.cn_RepDocProvR2[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvR3']:= ''''+Cn_uReportsConst.cn_RepDocProvR3[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvRT1']:= ''''+Cn_uReportsConst.cn_RepDocProvRT1[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvRT2']:= ''''+Cn_uReportsConst.cn_RepDocProvRT2[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvRT3']:= ''''+Cn_uReportsConst.cn_RepDocProvRT3[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvRT4']:= ''''+Cn_uReportsConst.cn_RepDocProvRT4[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvRT5']:= ''''+Cn_uReportsConst.cn_RepDocProvRT5[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepDocProvRT6']:= ''''+Cn_uReportsConst.cn_RepDocProvRT6[PLanguageIndex]+'''';
      frxReport.Variables['cn_RepSumAll']:= ''''+Cn_uReportsConst.cn_RepSumAll[PLanguageIndex]+'''';

      frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
      frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';


      frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
//    frxReport.DesignReport;
end;

procedure TfrmMainViewReports.SVPayDay();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPrintMasterRX.Active:=true;
    end
    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;

  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\SVPayDay.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSVPAY[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT1']:= ''''+Cn_uReportsConst.cn_RepSVPAY1[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';
  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
  frxReport.Variables['SPEC']:= ''''+Cn_uReportsConst.cn_RepSpec[PLanguageIndex]+'''';
  frxReport.Variables['NATIONAL']:= ''''+Cn_uReportsConst.cn_RepNational[PLanguageIndex]+'''';
  frxReport.Variables['FORMSTUD']:= ''''+Cn_uReportsConst.cn_RepFormStud[PLanguageIndex]+'''';
  frxReport.Variables['KATSTUD']:= ''''+Cn_uReportsConst.cn_RepKatStud[PLanguageIndex]+'''';
  frxReport.Variables['KURS']:= ''''+Cn_uReportsConst.cn_RepKurs[PLanguageIndex]+'''';
  frxReport.Variables['GROUP']:= ''''+Cn_uReportsConst.cn_RepGroup[PLanguageIndex]+'''';
  frxReport.Variables['ZAMOV']:= ''''+Cn_uReportsConst.cn_Zamov[PLanguageIndex]+'''';
  frxReport.Variables['TYPE_STAGE']:= ''''+Cn_uReportsConst.cn_type_stage[PLanguageIndex]+'''';
  frxReport.Variables['ALL']:= ''''+'К-ть студ., що опл.'+'''';

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
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepSumAll[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDocProvR']:= ''''+Cn_uReportsConst.cn_RepDocProvR[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDocProvR1']:= ''''+Cn_uReportsConst.cn_RepDocProvR1[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDocProvR2']:= ''''+Cn_uReportsConst.cn_RepDocProvR2[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDocProvR3']:= ''''+Cn_uReportsConst.cn_RepDocProvR3[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;

  frxReport.PrepareReport(true);
  if is_debug
   then frxReport.DesignReport
   else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVPayDay_DONGUET();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPere.Active:=false;
      pFIBDataSetPere.SQLs.SelectSQL.Clear;
      pFIBDataSetPere.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where EMIT_FACULT =0 and ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPere.Active:=true;

      pFIBDataSetZad.Active:=false;
      pFIBDataSetZad.SQLs.SelectSQL.Clear;
      pFIBDataSetZad.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where EMIT_FACULT =1 and ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetZad.Active:=true;
    end;


  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\SVPayDay_DONGUET.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSVPAY[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT1']:= ''''+Cn_uReportsConst.cn_RepSVPAY1[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';
  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
  frxReport.Variables['SPEC']:= ''''+Cn_uReportsConst.cn_RepSpec[PLanguageIndex]+'''';
  frxReport.Variables['NATIONAL']:= ''''+Cn_uReportsConst.cn_RepNational[PLanguageIndex]+'''';
  frxReport.Variables['FORMSTUD']:= ''''+Cn_uReportsConst.cn_RepFormStud[PLanguageIndex]+'''';
  frxReport.Variables['KATSTUD']:= ''''+Cn_uReportsConst.cn_RepKatStud[PLanguageIndex]+'''';
  frxReport.Variables['KURS']:= ''''+Cn_uReportsConst.cn_RepKurs[PLanguageIndex]+'''';
  frxReport.Variables['GROUP']:= ''''+Cn_uReportsConst.cn_RepGroup[PLanguageIndex]+'''';

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
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepSumAll[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDocProvR']:= ''''+Cn_uReportsConst.cn_RepDocProvR[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDocProvR1']:= ''''+Cn_uReportsConst.cn_RepDocProvR1[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDocProvR2']:= ''''+Cn_uReportsConst.cn_RepDocProvR2[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDocProvR3']:= ''''+Cn_uReportsConst.cn_RepDocProvR3[PLanguageIndex]+'''';

  frxReport.Variables['cn_RepDONGUETOtdel']:= ''''+Cn_uReportsConst.cn_RepDONGUETOtdel[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDONGUETCNT']:= ''''+Cn_uReportsConst.cn_RepDONGUETCNT[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDONGUETCNTOtdel']:= ''''+Cn_uReportsConst.cn_RepDONGUETCNTOtdel[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDONGUETAll']:= ''''+Cn_uReportsConst.cn_RepDONGUETAll[PLanguageIndex]+'''';
  frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepSVALL[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

{  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;}
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.RSUMPAY_ANALYZ();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\RSUMPAY_ANALYZ.fr3');
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
  frxReport.Variables['cn_RepDogSumNeedPay']:= ''''+Cn_uReportsConst.cn_RepDogSumNeedPay[PLanguageIndex]+'''';
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

  frxReport.Variables['cn_RepRAnalyz']:= ''''+Cn_uReportsConst.cn_RepRAnalyz[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzIN']:= ''''+Cn_uReportsConst.cn_RepRAnalyzIN[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzNEED']:= ''''+Cn_uReportsConst.cn_RepRAnalyzNEED[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzPAY']:= ''''+Cn_uReportsConst.cn_RepRAnalyzPAY[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzOUT']:= ''''+Cn_uReportsConst.cn_RepRAnalyzOUT[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzAllSaldo']:= ''''+Cn_uReportsConst.cn_RepRAnalyzAllSaldo[PLanguageIndex]+'''';

  frxReport.Variables['cn_RepRAnalyzCNT']:= ''''+Cn_uReportsConst.cn_RepRAnalyzCNT[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzSUMPrint']:= ''''+Cn_uReportsConst.cn_RepRAnalyzSUMPrint[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;  

procedure TfrmMainViewReports.SVSUMPAY_ANALYZ_DONGUET();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPere.Active:=false;
      pFIBDataSetPere.SQLs.SelectSQL.Clear;
      pFIBDataSetPere.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where EMIT_FACULT =0 and ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPere.Active:=true;

      pFIBDataSetZad.Active:=false;
      pFIBDataSetZad.SQLs.SelectSQL.Clear;
      pFIBDataSetZad.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where EMIT_FACULT =1 and ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetZad.Active:=true;
    end;
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\SVSUMPAY_ANALYZ_DONGUET.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSVPAY[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPAYPERE']:= ''''+Cn_uReportsConst.cn_RepSVPAYPERE[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT1']:= ''''+Cn_uReportsConst.cn_RepSVPAY1[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_DOP']:= ''''+Cn_uReportsConst.cn_RepDopDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';

  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
  frxReport.Variables['SPEC']:= ''''+Cn_uReportsConst.cn_RepSpec[PLanguageIndex]+'''';
  frxReport.Variables['NATIONAL']:= ''''+Cn_uReportsConst.cn_RepNational[PLanguageIndex]+'''';
  frxReport.Variables['FORMSTUD']:= ''''+Cn_uReportsConst.cn_RepFormStud[PLanguageIndex]+'''';
  frxReport.Variables['KATSTUD']:= ''''+Cn_uReportsConst.cn_RepKatStud[PLanguageIndex]+'''';
  frxReport.Variables['KURS']:= ''''+Cn_uReportsConst.cn_RepKurs[PLanguageIndex]+'''';
  frxReport.Variables['GROUP']:= ''''+Cn_uReportsConst.cn_RepGroup[PLanguageIndex]+'''';
  frxReport.Variables['TYPE_STAGE']:= ''''+Cn_uReportsConst.cn_type_stage[PLanguageIndex]+'''';
  frxReport.Variables['SUMENDDOG']:= ''''+Cn_uReportsConst.cn_RepDogSumEnd[PLanguageIndex]+'''';  

  frxReport.Variables['FIO']:= ''''+Cn_uReportsConst.cn_RepFIO[PLanguageIndex]+'''';
  frxReport.Variables['DOG']:= ''''+Cn_uReportsConst.  cn_RepDog[PLanguageIndex]+'''';
  frxReport.Variables['DATEDOG']:= ''''+Cn_uReportsConst.cn_RepDateDog[PLanguageIndex]+'''';
  frxReport.Variables['PERIODDOG']:= ''''+Cn_uReportsConst.cn_RepDogperiod[PLanguageIndex]+'''';
  frxReport.Variables['PAYDOG']:= ''''+Cn_uReportsConst.cn_RepDogPay[PLanguageIndex]+'''';
  frxReport.Variables['SUMENDDOG']:= ''''+Cn_uReportsConst.cn_RepDogSumEnd[PLanguageIndex]+'''';

  frxReport.Variables['BEGIN']:= ''''+Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex]+'''';
  frxReport.Variables['END']:= ''''+Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex]+'''';
  frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepSVALL[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepStudSVFT[PLanguageIndex]+'''';

  frxReport.Variables['cn_RepDONGUETOtdel']:= ''''+Cn_uReportsConst.cn_RepDONGUETOtdel[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDONGUETCNT']:= ''''+Cn_uReportsConst.cn_RepDONGUETCNT[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDONGUETCNTOtdel']:= ''''+Cn_uReportsConst.cn_RepDONGUETCNTOtdel[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDONGUETAll']:= ''''+Cn_uReportsConst.cn_RepDONGUETAll[PLanguageIndex]+'''';

  frxReport.Variables['cn_RepRAnalyzIN']:= ''''+Cn_uReportsConst.cn_RepRAnalyzIN[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzNEED']:= ''''+Cn_uReportsConst.cn_RepRAnalyzNEED[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzPAY']:= ''''+Cn_uReportsConst.cn_RepRAnalyzPAY[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzOUT']:= ''''+Cn_uReportsConst.cn_RepRAnalyzOUT[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepRAnalyzAllSaldo']:= ''''+Cn_uReportsConst.cn_RepRAnalyzAllSaldo[PLanguageIndex]+'''';

//   frxReport.DesignReport;
   frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.RACCOUNT();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\RACCOUNT.fr3');
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
  frxReport.Variables['SUMENDDOG']:= ''''+Cn_uReportsConst.cn_RepDogSumEnd[PLanguageIndex]+'''';  
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
  frxReport.Variables['cn_RepDogSumNeedPay']:= ''''+Cn_uReportsConst.cn_RepDogSumNeedPay[PLanguageIndex]+'''';
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


  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;  
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.RACCOUNT_NACH();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\RACCOUNT_NACH.fr3');
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
  frxReport.Variables['SUMENDDOG']:= ''''+Cn_uReportsConst.cn_RepDogSumEnd[PLanguageIndex]+'''';  
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
  frxReport.Variables['cn_RepDogSumNeedPay']:= ''''+Cn_uReportsConst.cn_RepDogSumNeedPay[PLanguageIndex]+'''';
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


  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;  
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVACCOUNT();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_ACCOUNT_OLAP_OBOR_DATA_SV where ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPrintMasterRX.Active:=true;
    end
    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_ACCOUNT_OLAP_OBOR_DATA_SV where ID_SESSION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;


  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\SVACCOUNT.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSVPAY[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT1']:= ''''+Cn_uReportsConst.cn_RepSVPAY1[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';
  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
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
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepSumAll[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPAYPERE']:= ''''+Cn_uReportsConst.cn_RepSVPAYPERE[PLanguageIndex]+'''';


  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;
  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVAnalyzSmeta();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_SVAnalyzSmeta.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['cn_RepRAnalyzSmetaSV']:= ''''+Cn_uReportsConst.cn_RepRAnalyzSmetaSV[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVAnalyzSmName']:= ''''+Cn_uReportsConst.cn_RepSVAnalyzSmName[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVAnalyzSmOstNach']:= ''''+Cn_uReportsConst.cn_RepSVAnalyzSmOstNach[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVAnalyzSmOstNow']:= ''''+Cn_uReportsConst.cn_RepSVAnalyzSmOstNow[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVAnalyzSmOstBeg']:= ''''+Cn_uReportsConst.cn_RepSVAnalyzSmOstBeg[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVAnalyzSmDolg']:= ''''+Cn_uReportsConst.cn_RepSVAnalyzSmDolg[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVAnalyzSmPere']:= ''''+Cn_uReportsConst.cn_RepSVAnalyzSmPere[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVAnalyzSmIn']:= ''''+Cn_uReportsConst.cn_RepSVAnalyzSmIn[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVAnalyzSmOut']:= ''''+Cn_uReportsConst.cn_RepSVAnalyzSmOut[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVAnalyzSmNach']:= ''''+Cn_uReportsConst.cn_RepSVAnalyzSmNach[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVAnalyzSmOpl']:= ''''+Cn_uReportsConst.cn_RepSVAnalyzSmOpl[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVAnalyzSmZad']:= ''''+Cn_uReportsConst.cn_RepSVAnalyzSmZad[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDocProvR2']:= ''''+Cn_uReportsConst.cn_RepDocProvR2[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepDocProvR3']:= ''''+Cn_uReportsConst.cn_RepDocProvR3[PLanguageIndex]+'''';
  frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepSumAll[PLanguageIndex]+'''';


  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;


procedure TfrmMainViewReports.RDOCPROVCNT();
var
  View:TfrmMainViewReportsSmeta;
  query:String;
begin
{  frxReport.Clear;
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

//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  frxReport.ShowPreparedReport;   }


  View:=TfrmMainViewReportsSmeta.Create(self,Database.Handle,1,'','',null,null,null,'CN_RDOCPROVCNT',0,date,date,ID_SESSION, is_debug);
  View.FormStyle:=fsNormal;
  View.Visible:=false;
  View.ShowModal;
  View.free;

end;

procedure TfrmMainViewReports.SVPERCENTPAY();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
pFIBStoredProcSaveRX.Database:=Database;
WriteTransaction.DefaultDatabase:=Database;
WriteTransaction.StartTransaction;
pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
pFIBStoredProcSaveRX.StoredProcName:='CN_TMP_REPORT_STUD_SV_PERCENT';
pFIBStoredProcSaveRX.Prepare;
pFIBStoredProcSaveRX.ParamByName('ID_SESSION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsInteger;
try
  pFIBStoredProcSaveRX.ExecProc;
  except
    begin
      Exit;
      WriteTransaction.Rollback;
    end;
  end;
  WriteTransaction.Commit;

  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPrintMasterRX.Active:=true;
    end
    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_SVPERCENTPAY.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSV[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_DOP']:= ''''+Cn_uReportsConst.cn_RepDopDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';

  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
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
  frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepSVALL[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPercent']:= ''''+Cn_uReportsConst.cn_RepSVPercent[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPercentPay']:= ''''+Cn_uReportsConst.cn_RepSVPercentPay[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPercentCNT']:= ''''+Cn_uReportsConst.cn_RepSVPercentCNT[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPercentCNTShort']:= ''''+Cn_uReportsConst.cn_RepSVPercentCNTShort[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepStudSVFT[PLanguageIndex]+'''';

  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;
  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
//   frxReport.DesignReport;
   frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVSUMLGOT();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPrintMasterRX.Active:=true;
    end
    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_SVSUMLGOT.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSV[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_DOP']:= ''''+Cn_uReportsConst.cn_RepDopDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';

  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
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
  frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepSVALL[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPercent']:= ''''+Cn_uReportsConst.cn_RepSVPercent[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPercentPay']:= ''''+Cn_uReportsConst.cn_RepSVPercentPay[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPercentCNT']:= ''''+Cn_uReportsConst.cn_RepSVPercentCNT[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPercentCNTShort']:= ''''+Cn_uReportsConst.cn_RepSVPercentCNTShort[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepStudSVFT[PLanguageIndex]+'''';

  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;
  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;

//   frxReport.DesignReport;
   frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.RSUMLGOT();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_RSUMLGOT.fr3');
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
  frxReport.Variables['cn_RepDogSumNeedPay']:= ''''+Cn_uReportsConst.cn_RepDogSumNeedPay[PLanguageIndex]+'''';
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


  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;  
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVUNSUM();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPrintMasterRX.Active:=true;
    end
    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;


  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_SVUNSUM.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepUnSumSV[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT1']:= ''''+Cn_uReportsConst.cn_RepSVPAY1[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';
  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
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
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepSumAll[PLanguageIndex]+'''';
  frxReport.Variables['cn_RepSVPAYPERE']:= ''''+Cn_uReportsConst.cn_RepSVPAYPERE[PLanguageIndex]+'''';

  frxReport.Variables['CNT']:= ''''+Cn_uReportsConst.cn_RepUnSumCNT[PLanguageIndex]+'''';
  frxReport.Variables['SUM']:= ''''+Cn_uReportsConst.cn_RepUnSumSum[PLanguageIndex]+'''';
  frxReport.Variables['SUMALL']:= ''''+Cn_uReportsConst.cn_RepUnSumSumALL[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;
  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.RUNSUM();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_UNSUM.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepUnSumR[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';

  frxReport.Variables['SPEC']:= ''''+Cn_uReportsConst.cn_RepSpec[PLanguageIndex]+'''';
  frxReport.Variables['NATIONAL']:= ''''+Cn_uReportsConst.cn_RepNational[PLanguageIndex]+'''';
  frxReport.Variables['FORMSTUD']:= ''''+Cn_uReportsConst.cn_RepFormStud[PLanguageIndex]+'''';
  frxReport.Variables['KATSTUD']:= ''''+Cn_uReportsConst.cn_RepKatStud[PLanguageIndex]+'''';
  frxReport.Variables['KURS']:= ''''+Cn_uReportsConst.cn_RepKurs[PLanguageIndex]+'''';
  frxReport.Variables['GROUP']:= ''''+Cn_uReportsConst.cn_RepGroup[PLanguageIndex]+'''';
  frxReport.Variables['FIO']:= ''''+Cn_uReportsConst.cn_RepFIO[PLanguageIndex]+'''';
  frxReport.Variables['DOG']:= ''''+Cn_uReportsConst.  cn_RepDog[PLanguageIndex]+'''';
  frxReport.Variables['ZAMOV']:= ''''+Cn_uReportsConst.cn_Zamov[PLanguageIndex]+'''';
  frxReport.Variables['TYPE_STAGE']:= ''''+Cn_uReportsConst.cn_type_stage[PLanguageIndex]+'''';  

  frxReport.Variables['BEGIN']:= ''''+Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex]+'''';
  frxReport.Variables['END']:= ''''+Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex]+'''';

  frxReport.Variables['cn_RepSumAll']:= ''''+Cn_uReportsConst.cn_RepSumAll[PLanguageIndex]+'''';

  frxReport.Variables['CNT']:= ''''+Cn_uReportsConst.cn_RepUnRSumCNT[PLanguageIndex]+'''';
  frxReport.Variables['SUM']:= ''''+Cn_uReportsConst.cn_RepUnRSumSum[PLanguageIndex]+'''';
  frxReport.Variables['SUMALL']:= ''''+Cn_uReportsConst.cn_RepUnRSumSumALL[PLanguageIndex]+'''';
  frxReport.Variables['SRUMALL']:= ''''+Cn_uReportsConst.cn_RepUnRSumALL[PLanguageIndex]+'''';
  frxReport.Variables['PERIOD']:= ''''+Cn_uReportsConst.cn_RepSVPeriod[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;  
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVDISS();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPrintMasterRX.Active:=true;
    end
    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;

  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_SVDISS.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSVDiss[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT1']:= ''''+Cn_uReportsConst.cn_RepSVPAY1[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';
  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
  frxReport.Variables['SPEC']:= ''''+Cn_uReportsConst.cn_RepSpec[PLanguageIndex]+'''';
  frxReport.Variables['NATIONAL']:= ''''+Cn_uReportsConst.cn_RepNational[PLanguageIndex]+'''';
  frxReport.Variables['FORMSTUD']:= ''''+Cn_uReportsConst.cn_RepFormStud[PLanguageIndex]+'''';
  frxReport.Variables['KATSTUD']:= ''''+Cn_uReportsConst.cn_RepKatStud[PLanguageIndex]+'''';
  frxReport.Variables['KURS']:= ''''+Cn_uReportsConst.cn_RepKurs[PLanguageIndex]+'''';
  frxReport.Variables['GROUP']:= ''''+Cn_uReportsConst.cn_RepGroup[PLanguageIndex]+'''';
  frxReport.Variables['ZAMOV']:= ''''+Cn_uReportsConst.cn_Zamov[PLanguageIndex]+'''';
  frxReport.Variables['TYPE_STAGE']:= ''''+Cn_uReportsConst.cn_type_stage[PLanguageIndex]+'''';  

  frxReport.Variables['LOH']:= ''''+Cn_uReportsConst.cn_RepFIO[PLanguageIndex]+'''';

  frxReport.Variables['FIO']:= ''''+Cn_uReportsConst.cn_RepFIO[PLanguageIndex]+'''';
  frxReport.Variables['DOG']:= ''''+Cn_uReportsConst.  cn_RepDog[PLanguageIndex]+'''';
  frxReport.Variables['DATEDOG']:= ''''+Cn_uReportsConst.cn_RepDateDog[PLanguageIndex]+'''';
  frxReport.Variables['PERIODDOG']:= ''''+Cn_uReportsConst.cn_RepDogperiod[PLanguageIndex]+'''';
  frxReport.Variables['PAYDOG']:= ''''+Cn_uReportsConst.cn_RepDogPay[PLanguageIndex]+'''';
  frxReport.Variables['SUMENDDOG']:= ''''+Cn_uReportsConst.cn_RepDogSumEnd[PLanguageIndex]+'''';

  frxReport.Variables['BEGIN']:= ''''+Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex]+'''';
  frxReport.Variables['END']:= ''''+Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex]+'''';

  frxReport.Variables['DISS']:= ''''+Cn_uReportsConst.cn_RepSVDISSDISS[PLanguageIndex]+'''';
  frxReport.Variables['UNDISS']:= ''''+Cn_uReportsConst.cn_RepSVDISSUNDISS[PLanguageIndex]+'''';
  frxReport.Variables['PERCENT']:= ''''+Cn_uReportsConst.cn_RepSVDISSPERSENT[PLanguageIndex]+'''';

  frxReport.Variables['CNT']:= ''''+Cn_uReportsConst.cn_RepUnSumCNT[PLanguageIndex]+'''';
  frxReport.Variables['SUM']:= ''''+Cn_uReportsConst.cn_RepUnSumSum[PLanguageIndex]+'''';
  frxReport.Variables['SUMALL']:= ''''+Cn_uReportsConst.cn_RepUnSumSumALL[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;
  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  //frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVDISSR();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\SVDISSR.fr3');
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
  frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepALL[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;

      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug
   then frxReport.DesignReport
   else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVDISS_CNT();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPrintMasterRX.Active:=true;
    end
    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;

  DataSet_diss.Active := false;
  DataSet_diss.SQLs.SelectSQL.Text := 'select NAME_TYPE_DISS,count (S.ID_DOG_ROOT) as CNT, id_session';
  DataSet_diss.SQLs.SelectSQL.add(' from CN_TMP_REPORT_STUD S where ');
  DataSet_diss.SQLs.SelectSQL.add(' S.ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
  DataSet_diss.SQLs.SelectSQL.add(' and id_type_diss<>0');
  DataSet_diss.SQLs.SelectSQL.add(' group by NAME_TYPE_DISS, S.ID_SESSION');
  DataSet_diss.SQLs.SelectSQL.add(' order by NAME_TYPE_DISS, S.ID_SESSION');
  DataSet_diss.Active := True;


  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_SVDISS_CNT.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSVDissArchName[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT1']:= ''''+Cn_uReportsConst.cn_RepSVPAY1[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';
  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
  frxReport.Variables['SPEC']:= ''''+Cn_uReportsConst.cn_RepSpec[PLanguageIndex]+'''';
  frxReport.Variables['NATIONAL']:= ''''+Cn_uReportsConst.cn_RepNational[PLanguageIndex]+'''';
  frxReport.Variables['FORMSTUD']:= ''''+Cn_uReportsConst.cn_RepFormStud[PLanguageIndex]+'''';
  frxReport.Variables['KATSTUD']:= ''''+Cn_uReportsConst.cn_RepKatStud[PLanguageIndex]+'''';
  frxReport.Variables['KURS']:= ''''+Cn_uReportsConst.cn_RepKurs[PLanguageIndex]+'''';
  frxReport.Variables['GROUP']:= ''''+Cn_uReportsConst.cn_RepGroup[PLanguageIndex]+'''';
  frxReport.Variables['ZAMOV']:= ''''+Cn_uReportsConst.cn_Zamov[PLanguageIndex]+'''';
  frxReport.Variables['TYPE_STAGE']:= ''''+Cn_uReportsConst.cn_type_stage[PLanguageIndex]+'''';    
  frxReport.Variables['NAME_DISS']:= ''''+Cn_uReportsConst.cn_RepSVDissType[PLanguageIndex]+'''';

  frxReport.Variables['FIO']:= ''''+Cn_uReportsConst.cn_RepFIO[PLanguageIndex]+'''';
  frxReport.Variables['DOG']:= ''''+Cn_uReportsConst.  cn_RepDog[PLanguageIndex]+'''';
  frxReport.Variables['DATEDOG']:= ''''+Cn_uReportsConst.cn_RepDateDog[PLanguageIndex]+'''';
  frxReport.Variables['PERIODDOG']:= ''''+Cn_uReportsConst.cn_RepDogperiod[PLanguageIndex]+'''';
  frxReport.Variables['PAYDOG']:= ''''+Cn_uReportsConst.cn_RepDogPay[PLanguageIndex]+'''';
  frxReport.Variables['SUMENDDOG']:= ''''+Cn_uReportsConst.cn_RepDogSumEnd[PLanguageIndex]+'''';

  frxReport.Variables['BEGIN']:= ''''+Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex]+'''';
  frxReport.Variables['END']:= ''''+Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex]+'''';

  frxReport.Variables['DISS']:= ''''+Cn_uReportsConst.cn_RepSVDissType[PLanguageIndex]+'''';

  frxReport.Variables['CNT']:= ''''+Cn_uReportsConst.cn_RepUnSumCNT[PLanguageIndex]+'''';
  frxReport.Variables['SUM']:= ''''+Cn_uReportsConst.cn_RepUnSumSum[PLanguageIndex]+'''';
  frxReport.Variables['SUMALL']:= ''''+Cn_uReportsConst.cn_RepUnSumSumALL[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;
  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      //ShowMessage(VarToStr(FV[i][0]));
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  //frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.SVPAYANALYZ();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION='+pFIBDataSetPrintMaster.FieldByName('ID_SESSION').AsString);
      pFIBDataSetPrintMasterRX.Active:=true;
    end
    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from CN_TMP_REPORT_STUD_SV where ID_SESSION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;
  frxReport.Clear;


  if FNR[2][0]=0 then
    begin
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_SVPAYANALYZSUM.fr3');
    end
    else
    begin
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_SVPAYANALYZSUM_SMALL.fr3');
    end;

//      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_SVPAYANALYZSUM_SMALL.fr3');

  frxReport.Variables.Clear;

  frxReport.Variables['NAME_REPORT']:= ''''+Cn_uReportsConst.cn_RepSV[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_MAIN']:= ''''+Cn_uReportsConst.cn_RepMainDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_DOP']:= ''''+Cn_uReportsConst.cn_RepDopDog[PLanguageIndex]+'''';
  frxReport.Variables['NAME_REPORT_REIOD']:= ''''+Cn_uReportsConst.cn_RepPeiodDog[PLanguageIndex]+'''';

  frxReport.Variables['FACULT']:= ''''+Cn_uReportsConst.cn_RepFacult[PLanguageIndex]+'''';
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
  frxReport.Variables['ALL']:= ''''+Cn_uReportsConst.cn_RepSVALL[PLanguageIndex]+'''';

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';
  frxReport.Variables['cn_RepStudSVFT']:= ''''+Cn_uReportsConst.cn_RepStudSVFT[PLanguageIndex]+'''';

  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
      MFR:=frxReport.FindObject('MemoTitle'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR:=frxReport.FindObject('MemoSum'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
    end;
  for i:=0 to VarArrayHighBound(FV,1) do
    begin
//      showmessage(VarToStr(FV[i][0]));
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
//   frxReport.DesignReport;
   frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;

procedure TfrmMainViewReports.RPAYANALYZ();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\CN_RPAYANALYZ.fr3');
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
  frxReport.Variables['cn_RepDogSumNeedPay']:= ''''+Cn_uReportsConst.cn_RepDogSumNeedPay[PLanguageIndex]+'''';
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


  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(LDate_beg)+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(LDate_end)+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTITLE'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;      
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;

      MFR:=frxReport.FindObject('MemoTITLE'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end;  
//  frxReport.DesignReport;
  frxReport.PrepareReport(true);
  if is_debug then frxReport.DesignReport
              else frxReport.ShowReport;
end;


procedure TfrmMainViewReports.TimerReportsTimer(Sender: TObject);
var
  i:Integer;
begin
TimerReports.Enabled:=false;
  if Type_R=1 then
    begin
      if (ReportName='SVCNTDOG') or (ReportName='SVPayDaySM')
          or (ReportName='SVPayDay') or (ReportName='SVCNTDOG_DONGUET') or (ReportName='SVPayDay_DONGUET')
          or (ReportName='SVSUMPAY_ANALYZ')or (ReportName='SVSUMPAY_ANALYZ_DONGUET')
          or (ReportName='SVACCOUNT') or (ReportName='SVAnalyzSmeta') or (ReportName='SVPERCENTPAY')
          or (ReportName='SVSUMLGOT') or (ReportName='SVUNSUM') or (ReportName='SVDISS')
          or (ReportName='SVDISS_CNT')or (ReportName='SVPAYANALYZ') then
        begin
              pFIBDataSetPrintMaster.Active:=false;
              pFIBDataSetPrintMaster.SQLs.SelectSQL.Clear;
              pFIBDataSetPrintMaster.SQLs.SelectSQL.Add(Sql_Master_l);
              pFIBDataSetPrintMaster.Active:=true;
              RDocClear();
        end
        else
        begin
          pFIBStoredProcSaveRX.Database:=Database;
          WriteTransaction.DefaultDatabase:=Database;
          WriteTransaction.StartTransaction;
          pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
          pFIBStoredProcSaveRX.StoredProcName:='CN_TMP_REPORT_STUD_SV_DELETE';
          pFIBStoredProcSaveRX.Prepare;
          pFIBStoredProcSaveRX.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
          try
            pFIBStoredProcSaveRX.ExecProc;
            except
              begin
                Exit;
                WriteTransaction.Rollback;
              end;
          end;
          WriteTransaction.Commit;
          pFIBDataSetPrintMaster.Active:=false;
          pFIBDataSetPrintMaster.SQLs.SelectSQL.Clear;
          pFIBDataSetPrintMaster.SQLs.SelectSQL.Add(Sql_Master_l);
          pFIBDataSetPrintMaster.Active:=true;
          RDocClear();
          pFIBDataSetPrintMaster.Active:=false;
          pFIBDataSetPrintMaster.SQLs.SelectSQL.Clear;
          pFIBDataSetPrintMaster.SQLs.SelectSQL.Add(Sql_Detail_l);
          pFIBDataSetPrintMaster.Active:=true;
          RDocClear();
        end;
    end;
  if Type_R=0 then
    begin
      pFIBDataSetPrintMaster.Active:=false;
      pFIBDataSetPrintMaster.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMaster.SQLs.SelectSQL.Add(Sql_Master_l);
      pFIBDataSetPrintMaster.Active:=true;
      pFIBDataSetPrintDetail.Active:=false;
      pFIBDataSetPrintDetail.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintDetail.SQLs.SelectSQL.Add(Sql_Detail_l);
    end;
  if Type_R=2 then
    begin
      pFIBDataSetPrintMaster.Active:=false;
      pFIBDataSetPrintMaster.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMaster.SQLs.SelectSQL.Add(Sql_Master_l);
      pFIBDataSetPrintMaster.Active:=true;
    end;

   if ReportName='RCNTDOG' then
     begin
       RCNTDOG();
     end;
   if ReportName='RCNTDOGL' then
     begin
       RCNTDOGL();
     end;
   if ReportName='SVCNTDOG' then
     begin
       SVCNTDOG();
     end;
   if ReportName='SVCNTDOG_DONGUET' then
     begin
       SVCNTDOG_DONGUET();
     end;
   if ReportName='RSUMPAY' then
     begin
       RSUMPAY();
     end;
   if ReportName='RSUMPAY_EX' then
     begin
       RSUMPAY_EX();
     end;
   if ReportName='RSUMPAY_DONGU' then
     begin
       RSUMPAY_DONGU();
     end;
   if ReportName='RSUMPAY_EX_DONGU' then
     begin
       RSUMPAY_EX_DONGU();
     end;
   if ReportName='SVSUMPAY' then
     begin
       SVSUMPAY();
     end;
   if ReportName='SVSUMPAY_DONGUET' then
     begin
       SVSUMPAY_DONGUET();
     end;
//сводная по ист фин.
   if ReportName='SVPayDaySM' then
     begin
       SVPayDaySM();
     end;
//сводная поступлений
   if ReportName='SVPayDay' then
     begin
       SVPayDay();
     end;
   if ReportName='SVPayDay_DONGUET' then
     begin
       SVPayDay_DONGUET();
     end;
   if ReportName='RSUMPAY_ANALYZ' then
     begin
       RSUMPAY_ANALYZ();
     end;
   if ReportName='SVSUMPAY_ANALYZ' then
     begin
       SVSUMPAY_ANALYZ();
     end;
   if ReportName='SVSUMPAY_ANALYZ_DONGUET' then
     begin
       SVSUMPAY_ANALYZ_DONGUET();
     end;
   if ReportName='RACCOUNT' then
     begin
       RACCOUNT();
     end;
   if ReportName='RACCOUNT_NACH' then
     begin
       RACCOUNT_NACH();
     end;
   if ReportName='SVACCOUNT' then
     begin
       SVACCOUNT();
     end;
   if ReportName='SVAnalyzSmeta' then
     begin
       SVAnalyzSmeta();
     end;
   if ReportName='RDOCPROVCNT' then
     begin
       RDOCPROVCNT();
     end;
   if ReportName='SVPERCENTPAY' then
     begin
       SVPERCENTPAY();
     end;
   if ReportName='SVSUMLGOT' then
     begin
       SVSUMLGOT();
     end;
   if ReportName='RSUMLGOT' then
     begin
       RSUMLGOT();
     end;
{недопоступившые суммы}
   if ReportName='SVUNSUM' then
     begin
       SVUNSUM();
     end;
   if ReportName='RUNSUM' then
     begin
       RUNSUM();
     end;
{Отчисленние}
   if ReportName='SVDISS' then
     begin
       SVDISS();
     end;
   if ReportName='SVDISSR' then
     begin
       SVDISSR();
     end;
   if ReportName='SVDISS_CNT' then
     begin
       SVDISS_CNT();
     end;
{Анализ договоров}
   if ReportName='SVPAYANALYZ' then
     begin
       SVPAYANALYZ();
     end;
{Аналитический реестр}
   if ReportName='RPAYANALYZ' then
     begin
       RPAYANALYZ();
     end;
//frxReport.DesignReport;
close;
end;

end.


