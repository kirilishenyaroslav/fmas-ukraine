unit MainReportsViewDPK;

interface

uses              
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, OleCtrls, SHDocVw, StdCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,IBase, RxMemDS,
  StudcityConst,Printers, frxClass, frxDBSet, frxDesgn, FIBQuery,
  pFIBQuery, pFIBStoredProc, cxContainer, cxLabel, ExtCtrls, frxExportXML,
  frxExportXLS, frxExportImage, frxExportPDF, frxExportRTF, frxExportTXT;

type
  TfrmMainReportsView = class(TForm)
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
    Panel1: TPanel;
    Animate1: TAnimate;
    cxLabel1: TcxLabel;
    TimerReports: TTimer;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxTXTExport1: TfrxTXTExport;
    frxXLSExport2: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxReport: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SVLivers();
    procedure RLivers();
    procedure SVPay();
    procedure RPay();
    procedure RPaySubs();
    procedure RPayLgot();
    procedure SVPayDay();
    procedure SVPayDaySM();
    procedure ACC_OBOR();
    procedure SVACC_OBOR();
    procedure RNarush();
    procedure SVNarush();
    procedure RPropiskHistory();
    procedure MarriedSt();
    procedure RPaySubsRashifr();
    procedure FormCreate(Sender: TObject);
    procedure TimerReportsTimer(Sender: TObject);
  private
    is_debug : Boolean;
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer;is_debug:Boolean);overload;
    procedure RDocClear();
    { Private declarations }
  public
    { Public declarations }
  end;
function ReportsView(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer;is_debug:boolean):Integer;stdcall;
exports ReportsView;
var
  frmMainReportsView: TfrmMainReportsView;
  ReportName:String;
  LastIg:Integer;
  Type_R:Integer;
  FV,NFV,FNR:Variant;
  Sql_Master_l,Sql_Detail_l:String;
implementation

{$R *.dfm}
function ReportsView(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer; is_debug: boolean):Integer;
var
  View:TfrmMainReportsView;
begin
  View:=TfrmMainReportsView.Create(AOwner,DB,Type_Report,Sql_Master,Sql_Detail,FieldView,NotFieldView,FieldNameReport,Report_Name,LastIgnor,is_debug);
end;

Constructor TfrmMainReportsView.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer; is_debug:boolean);
var
  i,j:Integer;
  FieldCount:Integer;
  T:TcxDataSummaryItem;
  MFR:TfrxMemoView;
  CountVisible:Integer;
begin
  Inherited Create(AOwner);
  Sql_Master_l:=Sql_Master;
  Sql_Detail_l:=Sql_Detail;

  Self.is_debug := is_debug;

  Database.Handle:=DB;
  Type_R:=Type_Report;
  FV:=FieldView;
  NFV:=NotFieldView;
  FNR:=FieldNameReport;
  ReportName:=Report_Name;
  LastIg:=LastIgnor;
  TimerReports.Enabled:=true;
end;

procedure TfrmMainReportsView.FormCreate(Sender: TObject);
begin
  Panel1.Visible:=true;
  Animate1.CommonAVI := aviFindFolder;
  Animate1.Active    := true;
  refresh;
end;

procedure TfrmMainReportsView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
//удаление
if ReportName='SVLivers' then
  begin
    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;
    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_DT_REPORT_LIVER_SV_TEMP_DEL';
    pFIBStoredProcSaveRX.Prepare;
    pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
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
if ReportName='SVPayer' then
  begin
    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;
    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_DT_REPORT_PAY_SV_TEMP_DEL';
    pFIBStoredProcSaveRX.Prepare;
    pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
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
if ReportName='SVACC_OBOR' then
  begin
    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;
    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_ACCOUNT_OLAP_OBOR_SV_DELETE';
    pFIBStoredProcSaveRX.Prepare;
    pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
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
end;

procedure TfrmMainReportsView.RDocClear();
var
  i,j,k:Integer;
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

RxMemoryData.First;

//сохранение в Ѕƒ
if ReportName='SVLivers' then
  begin
//удаление
    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;
    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_DT_REPORT_LIVER_SV_TEMP_DEL';
    pFIBStoredProcSaveRX.Prepare;
    pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
    try
      pFIBStoredProcSaveRX.ExecProc;
      except
        begin
          Exit;
          WriteTransaction.Rollback;
        end;
    end;
    WriteTransaction.Commit;
    //сохранение
    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;
    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_DT_REPORT_LIVER_SV_TEMP_INS';
    pFIBStoredProcSaveRX.Prepare;
    RxMemoryData.First;
    for j:=0 to RxMemoryData.RecordCount-1 do
      begin
        pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
        for i:=0 to VarArrayHighBound(FV,1) do
          begin
            if (FV[i][0]='CNT') then
              begin
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]).AsVariant:=RxMemoryData.FieldByName(FV[i][0]).AsVariant;
              end
              else
              begin
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]).AsString:=RxMemoryData.FieldByName(FV[i][0]).AsString;
              end;

            pFIBStoredProcSaveRX.ParamByName(FV[i][0]+'TB').AsInteger:=RxMemoryData.FieldByName(FV[i][0]+'TB').AsInteger;
          end;
          try
            pFIBStoredProcSaveRX.ExecProc;
          except
            begin
              WriteTransaction.Rollback;
              Exit;
            end;
          end;
        RxMemoryData.Next;
      end;
    WriteTransaction.Commit;
  end;

  if ReportName='SVNarush' then
  begin
//удаление

    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;
    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_DT_REPORT_LIVER_SV_TEMP_DEL';
    pFIBStoredProcSaveRX.Prepare;
    pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
    try
      pFIBStoredProcSaveRX.ExecProc;
      except
        begin
          Exit;
          WriteTransaction.Rollback;
        end;
    end;
    WriteTransaction.Commit;
    //сохранение
    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;

    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_DT_REPORT_LIVER_SV_TEMP_INS';
    pFIBStoredProcSaveRX.Prepare;
    RxMemoryData.First;

    for j:=0 to RxMemoryData.RecordCount-1 do
      begin
        pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
        for i:=0 to VarArrayHighBound(FV,1) do
          begin
            if (FV[i][0]='CNT') then
              begin
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]).AsVariant:=RxMemoryData.FieldByName(FV[i][0]).AsVariant;
              end
              else
              begin
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]).AsString:=RxMemoryData.FieldByName(FV[i][0]).AsString;
              end;

            pFIBStoredProcSaveRX.ParamByName(FV[i][0]+'TB').AsInteger:=RxMemoryData.FieldByName(FV[i][0]+'TB').AsInteger;
          end;
          try
            pFIBStoredProcSaveRX.ExecProc;
          except
            begin
              WriteTransaction.Rollback;
              Exit;
            end;
          end;
        RxMemoryData.Next;
      end;
    WriteTransaction.Commit;
  end;
//дл€ свода по оплате
if ReportName='SVPayer' then
  begin
//удаление
    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;
    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_DT_REPORT_PAY_SV_TEMP_DEL';
    pFIBStoredProcSaveRX.Prepare;
    pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
    try
      pFIBStoredProcSaveRX.ExecProc;
      except
        begin
          Exit;
          WriteTransaction.Rollback;
        end;
    end;
    WriteTransaction.Commit;
    //сохранение
    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;
    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_DT_REPORT_PAY_SV_TEMP_INS';
    pFIBStoredProcSaveRX.Prepare;
    RxMemoryData.First;
    for j:=0 to RxMemoryData.RecordCount-1 do
      begin
        pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
        for i:=0 to VarArrayHighBound(FV,1) do
          begin
            if ((FV[i][0]='SUMMA_PAYDATE') or (FV[i][0]='SUMMA_PAY') or (FV[i][0]='SUMMA_OVERPAY')) then
              begin
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]).AsVariant:=RxMemoryData.FieldByName(FV[i][0]).AsVariant;
              end
              else
              begin
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]).AsString:=RxMemoryData.FieldByName(FV[i][0]).AsString;
              end;

            pFIBStoredProcSaveRX.ParamByName(FV[i][0]+'TB').AsInteger:=RxMemoryData.FieldByName(FV[i][0]+'TB').AsInteger;
          end;
          try
            pFIBStoredProcSaveRX.ExecProc;
          except
            begin
              WriteTransaction.Rollback;
              Exit;
            end;
          end;
        RxMemoryData.Next;
      end;
    WriteTransaction.Commit;
  end;

//дл€ свода по поступлени€м и по источникам финансировани€
if (ReportName='SVPayDay')  or (ReportName='SVPayDaySM') then
  begin
//удаление
    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;
    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_DT_REPORT_PAY_SV_TEMP_DEL';
    pFIBStoredProcSaveRX.Prepare;
    pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
    try
      pFIBStoredProcSaveRX.ExecProc;
      except
        begin
          Exit;
          WriteTransaction.Rollback;
        end;
    end;
    WriteTransaction.Commit;
    //сохранение
    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;
    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_DT_REPORT_PAY_SV_TEMP_INS';
    pFIBStoredProcSaveRX.Prepare;
    RxMemoryData.First;
    for j:=0 to RxMemoryData.RecordCount-1 do
      begin
        pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
        for i:=0 to VarArrayHighBound(FV,1) do
          begin
            if (FV[i][0]='SUMMA_PAY')then
              begin
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]).AsVariant:=RxMemoryData.FieldByName(FV[i][0]).AsVariant;
              end
              else
              begin
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]).AsString:=RxMemoryData.FieldByName(FV[i][0]).AsString;
              end;

            pFIBStoredProcSaveRX.ParamByName(FV[i][0]+'TB').AsInteger:=RxMemoryData.FieldByName(FV[i][0]+'TB').AsInteger;
          end;
          try
            pFIBStoredProcSaveRX.ExecProc;
          except
            begin
              WriteTransaction.Rollback;
              Exit;
            end;
          end;
        RxMemoryData.Next;
      end;
    WriteTransaction.Commit;
  end;
//дл€ свода по оплате
if ReportName='SVACC_OBOR' then
  begin
//удаление
    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;
    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_ACCOUNT_OLAP_OBOR_SV_DELETE';
    pFIBStoredProcSaveRX.Prepare;
    pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
    try
      pFIBStoredProcSaveRX.ExecProc;
      except
        begin
          Exit;
          WriteTransaction.Rollback;
        end;
    end;
    WriteTransaction.Commit;
    //сохранение
    pFIBStoredProcSaveRX.Database:=Database;
    WriteTransaction.DefaultDatabase:=Database;
    WriteTransaction.StartTransaction;
    pFIBStoredProcSaveRX.Transaction:=WriteTransaction;
    pFIBStoredProcSaveRX.StoredProcName:='ST_ACCOUNT_OLAP_OBOR_SV_INSERT';
    pFIBStoredProcSaveRX.Prepare;
    RxMemoryData.First;
    for j:=0 to RxMemoryData.RecordCount-1 do
      begin
        pFIBStoredProcSaveRX.ParamByName('ID_TRANSACTION').AsInt64:=pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsInteger;
        for i:=0 to VarArrayHighBound(FV,1) do
          begin
            if ((FV[i][0]='CUR_NACH') or (FV[i][0]='CUR_PAY') or (FV[i][0]='IN_NACH') or (FV[i][0]='OUT_NACH')
            or  (FV[i][0]='SB_SUB')or  (FV[i][0]='IN_NACH_PERE')or  (FV[i][0]='OUT_NACH_DOLG')or  (FV[i][0]='OUT_NACH_PERE')or  (FV[i][0]='IN_NACH_DOLG')) then
              begin
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]).AsVariant:=RxMemoryData.FieldByName(FV[i][0]).AsVariant;
              end
              else
              begin
                pFIBStoredProcSaveRX.ParamByName(FV[i][0]).AsString:=RxMemoryData.FieldByName(FV[i][0]).AsString;
//                ShowMessage(VarToStr(FV[i][0]));
              end;

            pFIBStoredProcSaveRX.ParamByName(FV[i][0]+'TB').AsInteger:=RxMemoryData.FieldByName(FV[i][0]+'TB').AsInteger;
          end;
          try
            pFIBStoredProcSaveRX.ExecProc;
          except
            begin
              WriteTransaction.Rollback;
              Exit;
            end;
          end;
        RxMemoryData.Next;
      end;
    WriteTransaction.Commit;
  end;

end;

procedure TfrmMainReportsView.SVLivers();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from ST_DT_REPORT_LIVER_SV_TEMP where ID_TRANSACTION='+pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsString);
      pFIBDataSetPrintMasterRX.Active:=true;
    end
    else
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from ST_DT_REPORT_LIVER_SV_TEMP where ID_TRANSACTION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'SVLivers'+'.fr3');
  frxReport.Variables.Clear;
  frxReport.Variables['VBUILDS']:= ''''+StudcityConst.Studcity_ReportsLiversBuild+'''';
  frxReport.Variables['VFAK']:= ''''+StudcityConst.Studcity_ReportsLiversFak+'''';
  frxReport.Variables['VKURS']:= ''''+StudcityConst.Studcity_ReportsLiversCurs+'''';
  frxReport.Variables['VCATPAY']:= ''''+StudcityConst.Studcity_ReportsLiversCatPay+'''';
  frxReport.Variables['VTYPELIVE']:= ''''+StudcityConst.Studcity_ReportsLiversTypeLive+'''';
  frxReport.Variables['VCLASSLIVE']:= ''''+StudcityConst.Studcity_ReportsLiversClassLive+'''';
  frxReport.Variables['VCNT']:= ''''+StudcityConst.Studcity_ReportsLiversCNT+'''';
  frxReport.Variables['VNAMEREPORT']:= ''''+StudcityConst.Studcity_ReportsLiversNameReportS+'''';
  frxReport.Variables['VALL']:= ''''+StudcityConst.Studcity_ReportsALL+'''';
  frxReport.Variables['VPAGE']:= ''''+StudcityConst.Studcity_ReportsPage[2]+'''';
  
 for i:=0 to VarArrayHighBound(FNR,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FNR[i][1]) as TfrxMemoView;
      if (FNR[i][0]=1) then
        begin
          MFR.Visible:=true;
          MFR.Text:=VarToStr(FNR[i][2]);
        end
        else
        begin
          MFR.Visible:=false;
        end;
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

   frxReport.PrepareReport(true);
   frxReport.ShowReport;
//   frxReport.DesignReport;

end;

procedure TfrmMainReportsView.RLivers();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'RLivers'+'.fr3');
  frxReport.Variables.Clear;
  frxReport.Variables['BUILDS']:= ''''+StudcityConst.Studcity_ReportsLiversBuild+'''';
  frxReport.Variables['FAK']:= ''''+StudcityConst.Studcity_ReportsLiversFak+'''';
  frxReport.Variables['KURS']:= ''''+StudcityConst.Studcity_ReportsLiversCurs+'''';
  frxReport.Variables['CATPAY']:= ''''+StudcityConst.Studcity_ReportsLiversCatPay+'''';
  frxReport.Variables['TYPELIVE']:= ''''+StudcityConst.Studcity_ReportsLiversTypeLive+'''';
  frxReport.Variables['CLASSLIVE']:= ''''+StudcityConst.Studcity_ReportsLiversClassLive+'''';
  frxReport.Variables['NAMEREPORT']:= ''''+StudcityConst.Studcity_ReportsLiversNameReportR[2]+'''';
  frxReport.Variables['DATEROJ']:= ''''+StudcityConst.Studcity_ReportsPrintDATEROJ+'''';
  frxReport.Variables['BEGPROPI']:= ''''+StudcityConst.Studcity_ReportsPrintBegPROPI+'''';
  frxReport.Variables['ENDPROPI']:= ''''+StudcityConst.Studcity_ReportsPrintENDPROPI+'''';
  frxReport.Variables['ROOM']:= ''''+StudcityConst.Studcity_ReportsPrintROOM+'''';
  frxReport.Variables['FIO']:= ''''+StudcityConst.Studcity_ReportsPrintFIO+'''';
  frxReport.Variables['NN']:= ''''+StudcityConst.Studcity_SubsRegNomber+'''';
  frxReport.Variables['VNAMEREPORT']:= ''''+StudcityConst.Studcity_ReportsLiversNameReportR+'''';
  frxReport.Variables['VPAGE']:= ''''+StudcityConst.Studcity_ReportsPage+'''';
  for i:=0 to VarArrayHighBound(FNR,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FNR[i][1]) as TfrxMemoView;
      if (FNR[i][0]=1) then
        begin
          MFR.Visible:=true;
          MFR.Text:=VarToStr(FNR[i][2]);
        end
        else
        begin
          MFR.Visible:=false;
        end;
    end;

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
  //frxReport.DesignReport;
  frxReport.PrepareReport(true);
  frxReport.ShowReport(true);

end;


procedure TfrmMainReportsView.SVPay();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
        if pFIBDataSetPrintMaster.RecordCount>0 then
          begin
            pFIBDataSetPrintMasterRX.Active:=false;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from ST_DT_REPORT_PAY_SV_TEMP where ID_TRANSACTION='+pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsString);
            pFIBDataSetPrintMasterRX.Active:=true;
          end
          else
          begin
            pFIBDataSetPrintMasterRX.Active:=false;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from ST_DT_REPORT_PAY_SV_TEMP where ID_TRANSACTION<-1');
            pFIBDataSetPrintMasterRX.Active:=true;
          end;

      frxReport.Clear;
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'SVPayer'+'.fr3');
      frxReport.Variables.Clear;
      frxReport.Variables['SUMMA_PAYDATE']:=''''+StudcityConst.Studcity_ReportsPrintPAYDATE+'''';
      frxReport.Variables['SUMMA_PAY']:=''''+StudcityConst.Studcity_ReportsPrintPAY+'''';
      frxReport.Variables['SUMMA_OVERPAY']:=''''+StudcityConst.Studcity_ReportsPrintZAD+'''';
      frxReport.Variables['BUILDS']:= ''''+StudcityConst.Studcity_ReportsLiversBuild+'''';
      frxReport.Variables['FAK']:= ''''+StudcityConst.Studcity_ReportsLiversFak+'''';
      frxReport.Variables['KURS']:= ''''+StudcityConst.Studcity_ReportsLiversCurs+'''';
      frxReport.Variables['CATPAY']:= ''''+StudcityConst.Studcity_ReportsLiversCatPay+'''';
      frxReport.Variables['TYPELIVE']:= ''''+StudcityConst.Studcity_ReportsLiversTypeLive+'''';
      frxReport.Variables['CLASSLIVE']:= ''''+StudcityConst.Studcity_ReportsLiversClassLive+'''';
      frxReport.Variables['DATERUN']:= ''''+DateToStr(FNR[0][0])+'''';


      for i:=0 to VarArrayHighBound(FV,1) do
        begin
          MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
          MFR.Visible:=true;
          MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
          MFR.Visible:=true;
          MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
          MFR.Visible:=true;
        end;
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
       frxReport.PrepareReport(true);
       frxReport.ShowReport(true);
//       frxReport.DesignReport;
end;

procedure TfrmMainReportsView.RPay();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'RPay'+'.fr3');
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
  frxReport.Variables['DATERUN']:= ''''+DateToStr(FNR[0][0])+'''';

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
  frxReport.ShowReport(true);

end;

procedure TfrmMainReportsView.RPaySubs();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'RPaySubs'+'.fr3');
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
  frxReport.Variables['DATERUN']:= ''''+DateToStr(FNR[0][0])+'''';


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
  if is_debug
   then frxReport.DesignReport
   else frxReport.ShowReport(true);
end;

procedure TfrmMainReportsView.RPayLgot();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'RPayLgot'+'.fr3');
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
  frxReport.Variables['DATERUN']:= ''''+DateToStr(FNR[0][0])+'''';

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

  frxReport.Variables['DATE_BEG']:= ''''+DateToStr(FNR[0][0])+'''';
  frxReport.Variables['DATE_END']:= ''''+DateToStr(FNR[0][1])+'''';

  frxReport.PrepareReport(true);
  if is_debug
   then frxReport.DesignReport
   else frxReport.ShowReport(true);
end;

procedure TfrmMainReportsView.SVPayDay();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
        if pFIBDataSetPrintMaster.RecordCount>0 then
          begin
            pFIBDataSetPrintMasterRX.Active:=false;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from ST_DT_REPORT_PAY_SV_TEMP where ID_TRANSACTION='+pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsString);
            pFIBDataSetPrintMasterRX.Active:=true;
          end
          else
          begin
            pFIBDataSetPrintMasterRX.Active:=false;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from ST_DT_REPORT_PAY_SV_TEMP where ID_TRANSACTION<-1');
            pFIBDataSetPrintMasterRX.Active:=true;
          end;

      frxReport.Clear;
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'SVPayDay'+'.fr3');
      frxReport.Variables.Clear;
      frxReport.Variables['NAME_REPORT']:=''''+StudcityConst.StRrPrintPAYSVOnDAYNAME+'''';
      frxReport.Variables['SUMMA_PAY']:=''''+StudcityConst.StRrPrintPAYSVOnDAYSUMMA+'''';
      frxReport.Variables['BUILDS']:= ''''+StudcityConst.Studcity_ReportsLiversBuild+'''';
      frxReport.Variables['FAK']:= ''''+StudcityConst.Studcity_ReportsLiversFak+'''';
      frxReport.Variables['KURS']:= ''''+StudcityConst.Studcity_ReportsLiversCurs+'''';
      frxReport.Variables['CATPAY']:= ''''+StudcityConst.Studcity_ReportsLiversCatPay+'''';
      frxReport.Variables['TYPELIVE']:= ''''+StudcityConst.Studcity_ReportsLiversTypeLive+'''';
      frxReport.Variables['CLASSLIVE']:= ''''+StudcityConst.Studcity_ReportsLiversClassLive+'''';
      frxReport.Variables['DATEBEG']:= ''''+DateToStr(FNR[0][0])+'''';
      frxReport.Variables['DATEEND']:= ''''+DateToStr(FNR[1][0])+'''';

      for i:=0 to VarArrayHighBound(FV,1) do
        begin
          MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
          MFR.Visible:=true;
          MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
          MFR.Visible:=true;
          MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
          MFR.Visible:=true;
        end;
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
       frxReport.PrepareReport(true);
       frxReport.ShowReport(true);
//       frxReport.DesignReport;

end;


procedure TfrmMainReportsView.SVPayDaySM();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
        if pFIBDataSetPrintMaster.RecordCount>0 then
          begin
            pFIBDataSetPrintMasterRX.Active:=false;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from ST_DT_REPORT_PAY_SV_TEMP where ID_TRANSACTION='+pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsString);
            pFIBDataSetPrintMasterRX.Active:=true;
          end
          else
          begin
            pFIBDataSetPrintMasterRX.Active:=false;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from ST_DT_REPORT_PAY_SV_TEMP where ID_TRANSACTION<-1');
            pFIBDataSetPrintMasterRX.Active:=true;
          end;

      frxReport.Clear;
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'SVPayDaySM'+'.fr3');
      frxReport.Variables.Clear;
      frxReport.Variables['NAME_REPORT']:=''''+StudcityConst.StRrPrintPAYSVOnDAYNAME+'''';
      frxReport.Variables['SUMMA_PAY']:=''''+StudcityConst.StRrPrintPAYSVOnDAYSUMMA+'''';
      frxReport.Variables['BUILDS']:= ''''+StudcityConst.Studcity_ReportsLiversBuild+'''';
      frxReport.Variables['FAK']:= ''''+StudcityConst.Studcity_ReportsLiversFak+'''';
      frxReport.Variables['KURS']:= ''''+StudcityConst.Studcity_ReportsLiversCurs+'''';
      frxReport.Variables['CATPAY']:= ''''+StudcityConst.Studcity_ReportsLiversCatPay+'''';
      frxReport.Variables['TYPELIVE']:= ''''+StudcityConst.Studcity_ReportsLiversTypeLive+'''';
      frxReport.Variables['CLASSLIVE']:= ''''+StudcityConst.Studcity_ReportsLiversClassLive+'''';
      frxReport.Variables['DATEBEG']:= ''''+DateToStr(FNR[0][0])+'''';
      frxReport.Variables['DATEEND']:= ''''+DateToStr(FNR[1][0])+'''';

      frxReport.PrepareReport(true);
      frxReport.ShowReport(true);
//      frxReport.DesignReport;

end;

procedure TfrmMainReportsView.ACC_OBOR();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'ACC_OBOR.fr3');
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
  frxReport.Variables['DATEBEG']:= ''''+DateToStr(FNR[0][0])+'''';
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
  frxReport.ShowReport(true);

end;

procedure TfrmMainReportsView.SVACC_OBOR();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
        if pFIBDataSetPrintMaster.RecordCount>0 then
          begin
            pFIBDataSetPrintMasterRX.Active:=false;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from ST_ACCOUNT_OLAP_OBOR_DATA_SV where ID_TRANSACTION='+pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsString);
            pFIBDataSetPrintMasterRX.Active:=true;
          end
          else
          begin
            pFIBDataSetPrintMasterRX.Active:=false;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
            pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from ST_ACCOUNT_OLAP_OBOR_DATA_SV where ID_TRANSACTION<-1');
            pFIBDataSetPrintMasterRX.Active:=true;
          end;

      frxReport.Clear;
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'SVACC_OBOR.fr3');
      frxReport.Variables.Clear;

      frxReport.Variables['BUILDS']:= ''''+StudcityConst.Studcity_ReportsLiversBuild+'''';
      frxReport.Variables['FAK']:= ''''+StudcityConst.Studcity_ReportsLiversFak+'''';
      frxReport.Variables['KURS']:= ''''+StudcityConst.Studcity_ReportsLiversCurs+'''';
      frxReport.Variables['CATPAY']:= ''''+StudcityConst.Studcity_ReportsLiversCatPay+'''';
      frxReport.Variables['TYPELIVE']:= ''''+StudcityConst.Studcity_ReportsLiversTypeLive+'''';
      frxReport.Variables['CLASSLIVE']:= ''''+StudcityConst.Studcity_ReportsLiversClassLive+'''';
      frxReport.Variables['DATEBEG']:= ''''+DateToStr(FNR[0][0])+'''';
      frxReport.Variables['DATEEND']:= ''''+DateToStr(FNR[1][0])+'''';


      for i:=0 to VarArrayHighBound(FV,1) do
        begin
          MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
          MFR.Visible:=true;
          MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
          MFR.Visible:=true;
          MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
          MFR.Visible:=true;
        end;
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
       frxReport.PrepareReport(true);
       frxReport.ShowReport(true);
//       frxReport.DesignReport;
end;

procedure TfrmMainReportsView.RNarush();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'RNarush.fr3');
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

  frxReport.PrepareReport(true);
  //frxReport.DesignReport;
  frxReport.ShowReport(true);

end;

procedure TfrmMainReportsView.RPaySubsRashifr();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'RPaySubsRashifr.fr3');
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

  frxReport.PrepareReport(true);
  //frxReport.DesignReport;
  frxReport.ShowReport(true);

end;

procedure TfrmMainReportsView.MarriedSt();
var
  i:Integer;
  MFR:TfrxMemoView;
begin

  frxReport.Clear;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'MarriedSt.fr3');

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

  frxReport.PrepareReport(true);
  //frxReport.DesignReport;
  frxReport.ShowReport(true);

end;

procedure TfrmMainReportsView.SVNarush();
var
  i:Integer;
  MFR:TfrxMemoView;
begin

 if pFIBDataSetPrintMaster.RecordCount>0 then
    begin
      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from ST_DT_REPORT_LIVER_SV_TEMP where ID_TRANSACTION='+pFIBDataSetPrintMaster.FieldByName('ID_TRANSACTION').AsString);
      pFIBDataSetPrintMasterRX.Active:=true;
    end
    else
    begin

      pFIBDataSetPrintMasterRX.Active:=false;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMasterRX.SQLs.SelectSQL.Add('select * from ST_DT_REPORT_LIVER_SV_TEMP where ID_TRANSACTION<-1');
      pFIBDataSetPrintMasterRX.Active:=true;
    end;

  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'SVNarush'+'.fr3');
  frxReport.Variables.Clear;
  frxReport.Variables['VBUILDS']:= ''''+StudcityConst.Studcity_ReportsLiversBuild+'''';
  frxReport.Variables['VFAK']:= ''''+StudcityConst.Studcity_ReportsLiversFak+'''';
  frxReport.Variables['VKURS']:= ''''+StudcityConst.Studcity_ReportsLiversCurs+'''';
  frxReport.Variables['VCATPAY']:= ''''+StudcityConst.Studcity_ReportsLiversCatPay+'''';
  frxReport.Variables['VTYPELIVE']:= ''''+StudcityConst.Studcity_ReportsLiversTypeLive+'''';
  frxReport.Variables['VCLASSLIVE']:= ''''+StudcityConst.Studcity_ReportsLiversClassLive+'''';
  frxReport.Variables['VCNT']:= ''''+StudcityConst.Studcity_ReportsLiversCNT+'''';
  frxReport.Variables['VNAMEREPORT']:= ''''+StudcityConst.Studcity_ReportsLiversNameReportS+'''';
  frxReport.Variables['VALL']:= ''''+StudcityConst.Studcity_ReportsALL+'''';
  frxReport.Variables['VPAGE']:= ''''+StudcityConst.Studcity_ReportsPage[2]+'''';
  frxReport.Variables['DATEBEGIN']:= ''''+DateToStr(FNR[0][0])+'''';
  frxReport.Variables['DATEEND']:= ''''+DateToStr(FNR[1][0])+'''';

  for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoTitle'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
      MFR:=frxReport.FindObject('MemoSum'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;

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


   frxReport.PrepareReport(true);
   frxReport.ShowReport;
//   frxReport.DesignReport;

end;

procedure TfrmMainReportsView.RPropiskHistory();
var
  i:Integer;
  MFR:TfrxMemoView;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\'+'RPropiskHistory.fr3');
  frxReport.Variables.Clear;
  //frxReport.Variables['BUILDS']:= ''''+StudcityConst.Studcity_ReportsLiversBuild+'''';
  //frxReport.Variables['FAK']:= ''''+StudcityConst.Studcity_ReportsLiversFak+'''';
  //frxReport.Variables['KURS']:= ''''+StudcityConst.Studcity_ReportsLiversCurs+'''';
  //frxReport.Variables['CATPAY']:= ''''+StudcityConst.Studcity_ReportsLiversCatPay+'''';
  //frxReport.Variables['TYPELIVE']:= ''''+StudcityConst.Studcity_ReportsLiversTypeLive+'''';
  //frxReport.Variables['CLASSLIVE']:= ''''+StudcityConst.Studcity_ReportsLiversClassLive+'''';
  frxReport.Variables['NAMEREPORT']:= ''''+StudcityConst.Studcity_ReportsLiversNameReportR+'''';
  //frxReport.Variables['DATEROJ']:= ''''+StudcityConst.Studcity_ReportsPrintDATEROJ+'''';
  frxReport.Variables['BEGPROPI']:= ''''+StudcityConst.Studcity_ReportsPrintBegPROPI+'''';
  frxReport.Variables['ENDPROPI']:= ''''+StudcityConst.Studcity_ReportsPrintENDPROPI+'''';
  //frxReport.Variables['ROOM']:= ''''+StudcityConst.Studcity_ReportsPrintROOM+'''';
  frxReport.Variables['FIO']:= ''''+StudcityConst.Studcity_ReportsPrintFIO+'''';
  frxReport.Variables['NN']:= ''''+StudcityConst.Studcity_SubsRegNomber+'''';
  frxReport.Variables['VNAMEREPORT']:= ''''+StudcityConst.Studcity_ReportsLiversNameReportR+'''';
  //frxReport.Variables['VPAGE']:= ''''+StudcityConst.Studcity_ReportsPage+'''';    }

  frxReport.Variables['DATEBEGIN']:= ''''+DateToStr(FNR[0][0])+'''';
  frxReport.Variables['DATEEND']:= ''''+DateToStr(FNR[1][0])+'''';


{  for i:=0 to VarArrayHighBound(FNR,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FNR[i][1]) as TfrxMemoView;
      if (FNR[i][0]=1) then
        begin
          MFR.Visible:=true;
          MFR.Text:=VarToStr(FNR[i][2]);
        end
        else
        begin
          MFR.Visible:=false;
        end;
    end;}

  {for i:=0 to VarArrayHighBound(FV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+FV[i][0]) as TfrxMemoView;
      MFR.Visible:=true;
    end;
  for i:=0 to VarArrayHighBound(NFV,1) do
    begin
      MFR:=frxReport.FindObject('Memo'+NFV[i][0]) as TfrxMemoView;
      MFR.Visible:=false;
      MFR.DataSet:=nil;
    end; }

  frxReport.PrepareReport(true);
  if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  frxReport.DesignReport else frxReport.ShowReport(True);
  //frxReport.DesignReport;
//  frxReport.ShowReport(true);

end;


procedure TfrmMainReportsView.TimerReportsTimer(Sender: TObject);
var
  i:Integer;
begin
TimerReports.Enabled:=false;
  if Type_R=1 then
    begin
      pFIBDataSetPrintMaster.Active:=false;
      pFIBDataSetPrintMaster.SQLs.SelectSQL.Clear;
      pFIBDataSetPrintMaster.SQLs.SelectSQL.Add(Sql_Master_l);
      pFIBDataSetPrintMaster.Active:=true;
      RDocClear();
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


//сводна€ по колличеству проживающих
   if ReportName='SVLivers' then
     begin
       SVLivers();
     end;
//–еестр по проживающим
   if ReportName='RLivers' then
     begin
       RLivers();
     end;

//сводна€ по оплате
   if ReportName='SVPayer' then
     begin
       SVPay();
     end;
//реестр по оплате
   if ReportName='RPayer' then
     begin
       RPay();
     end;
//реестр по субсидируемым
   if ReportName='RPaySubs' then
     begin
       RPaySubs();
     end;
//реестр по льготникам
   if ReportName='RPayLgot' then
     begin
       RPayLgot();
     end;
//—водна€ поступлений
   if ReportName='SVPayDay' then
     begin
       SVPayDay();
     end;
//—водна€ поступлений
   if ReportName='SVPayDaySM' then
     begin
       SVPayDaySM();
     end;
//ќборотна€ ведомость
   if ReportName='ACC_OBOR' then
     begin
       ACC_OBOR();
     end;
//ќборотна€ ведомость сводна€
   if ReportName='SVACC_OBOR' then
     begin
       SVACC_OBOR();
     end;
//Ќарушители  reestr
   if ReportName='RNarush' then
     begin
       RNarush();
     end;

   //Semeinie  reestr
   if ReportName='MarriedSt' then
     begin
       MarriedSt();
     end;
//Ќарушители  svodnaja
     if ReportName='SVNarush' then
     begin
       SVNarush();
     end;

//Rasshirenii reestr subsidirovanih
   if ReportName='RPaySubsRashifr' then
     begin
       RPaySubsRashifr();
     end;

//—писок прописок
   if ReportName='RPropiskHistory' then
     begin
       RPropiskHistory();
     end;
Close;

end;




end.

