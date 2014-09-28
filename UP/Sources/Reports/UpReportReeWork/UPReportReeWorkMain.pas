unit UPReportReeWorkMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uCommonSp,DB, FIBDatabase, pFIBDatabase,IBase, ComCtrls,
  cxLookAndFeelPainters, StdCtrls, cxButtons,Gauges,pFIBStoredProc,
  FIBQuery, pFIBQuery, frxDesgn, frxClass, frxDBSet, frxExportXLS,
  FIBDataSet, pFIBDataSet, frxExportHTML, frxExportRTF, ActnList,
  ASUP_LoaderPrintDocs_Messages,ASUP_LoaderPrintDocs_Consts, frxExportPDF,
  frxExportXML;

    type
    TUP_PrintLongAge = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

type
  TfrmUPReportReeWorkMain = class(TForm)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StatusBar1: TStatusBar;
    cxButtonFilter: TcxButton;
    cxButtonPrint: TcxButton;
    StoredProc: TpFIBStoredProc;
    ActionList1: TActionList;
    FilterAction: TAction;
    PrintAction: TAction;
    DesAction: TAction;
    cxButtonClose: TcxButton;
    Designer: TfrxDesigner;
    ReportDsetData: TfrxDBDataset;
    ReportDSetGlobalData: TfrxDBDataset;
    HTMLExport: TfrxHTMLExport;
    XLSExport: TfrxXLSExport;
    RTFExport: TfrxRTFExport;
    DSetGlobalData: TpFIBDataSet;
    DSetData: TpFIBDataSet;
    cxButtonDraft: TcxButton;
    FontDialogs: TFontDialog;
    FontAction: TAction;
    Report: TfrxReport;
    PDFExp: TfrxPDFExport;
    XMLExp: TfrxXMLExport;
  Constructor Create(aOwner : TComponent;HandleDb:Integer);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FontActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
    ReportTHerited = class (TThread)
      DataBase:TpFIBDatabase;
      Transaction:TpFIBTransaction;
      bar:TGauge;
      pos:Integer;
      ID_SESSION:Variant;
      ReportParam:Variant;
      Constructor Create (InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;RepParam:Variant);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
    end;

var
  frmUPReportReeWorkMain: TfrmUPReportReeWorkMain;
  id_sp_report,id_session:Int64;
  IsDesign:Boolean;
    PFontNames:string;
    PFontSizes:integer;
    PFontColors:TColor;
    PFontStyles:TFontStyles;  report:ReportTHerited;

implementation

{$R *.dfm}

Constructor ReportTHerited.Create(InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;RepParam:Variant);
begin
  inherited Create(False);
  DataBase:=InDataBase;
  Transaction:=InTransaction;
  bar:=prog;
  ID_SESSION:=ID_TRAN;
  ReportParam:=RepParam;
end;

procedure ReportTHerited.Execute;
var
  SP_DataSet:TpFIBDataSet;
  Report:TfrxReport;
  DataSetReport:TfrxDBDataset;
  DesignReport:TfrxDesigner;
  ExportXLS:TfrxXLSExport;
  ExportRTF:TfrxRTFExport;
  ExportHTML:TfrxHTMLExport;
  SP:TpFIBStoredProc;
begin
{  SP_DataSet:=TpFIBDataSet.Create(nil);
  SP_DataSet.Database:=DataBase;
  SP_DataSet.Transaction:=Transaction;
  SP_DataSet.SelectSQL.Text:='select * from UP_DT_REPORT_SV_LONG_AGE(:IN_ID_REPORT_SESSION)';
  SP_DataSet.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
  try
    SP_DataSet.Open;
    except
    on E:Exception do
    begin
        messageBox(0,PChar('Помилка при підготовці звіту!'),'Помилка!!!',MB_OK);
        Exit;
    end;
  end;}

   SP:=TpFIBStoredProc.Create(nil);
  SP.Transaction:=Transaction;
  SP.Database:=DataBase;
  Transaction.StartTransaction;
  SP.StoredProcName:='UP_DT_REPORT_SV_LONG_AGE';
  SP.Prepare;
  SP.ParamByName('IN_ID_REPORT_SESSION').asInt64:=id_session;
  try
    SP.ExecProc;
  except
    begin
      Transaction.Rollback;
      messageBox(0,PChar('Ошибка при выполнении процедуры'),'Ошибка!!!',MB_OK);
      Exit;
    end;
  end;
  Transaction.Commit;


  if SP_DataSet.RecordCount>0 then
    begin
      Report:=TfrxReport.Create(nil);
      DataSetReport:=TfrxDBDataset.Create(nil);
      DesignReport:=TfrxDesigner.Create(nil);
      ExportXLS:=TfrxXLSExport.Create(nil);
      ExportRTF:=TfrxRTFExport.Create(nil);
      ExportHTML:=TfrxHTMLExport.Create(nil);
      DataSetReport.DataSet:=SP_DataSet;

      Report.Clear;
      Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Report\Up\'+ReportParam[0][0]);

      if ReportParam[1][0]=true then
        begin
          Report.DesignReport;
        end
        else
        begin
          Report.PrepareReport(true);
          Report.ShowPreparedReport;
          Report.Free;
        end;
        Report.Destroy;
        DataSetReport.Destroy;
        DesignReport.Destroy;
        ExportXLS.Destroy;
        ExportRTF.Destroy;
        ExportHTML.Destroy;
    end
    else
    begin
      messageBox(0,PChar('За такими данними співробітників не знайдено'),'Увага!!!',MB_OK);
    end;
end;

procedure ReportTHerited.UpdateBar;
begin
  bar.Progress:=pos;
end;


destructor ReportTHerited.Destroy;
begin
  Inherited destroy;
end;

function CreateSprav: TSprav;stdcall;
begin
    Result := TUP_PrintLongAge.Create;
end;

constructor TUP_PrintLongAge.Create;
begin
  inherited Create;
  Input.FieldDefs.Add('id_session', ftVariant);
  Input.FieldDefs.Add('id_sp_report', ftVariant);
  Input.FieldDefs.Add('DesignReport', ftBoolean);
  PrepareMemoryDatasets;

  PFontNames:='Times New Roman';
  PFontSizes:=-255;
  PFontColors:=clDefault;
end;

procedure TUP_PrintLongAge.Show;
var
    hnd: Integer;
    Print: TfrmUPReportReeWorkMain;
begin
  hnd := Input['DBHandle'];
  id_sp_report := Input['id_sp_report'];
  IsDesign := Input['DesignReport'];
  Print:=TfrmUPReportReeWorkMain.Create(Application.MainForm,hnd);
  Print.ShowModal;
  Print.Free;
end;

constructor TfrmUPReportReeWorkMain.Create(aOwner : TComponent;HandleDb:Integer);
begin
  inherited Create(aOwner);
  DB.Handle := TISC_DB_Handle(HandleDb);

  //получаем идентификатор транзакции
  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName:='UP_DT_REPORT_SESSION';
  StoredProc.Prepare;
  try
    StoredProc.ExecProc;
  except
    begin
      WriteTransaction.Rollback;
      Exit;
    end;
   end;
 ID_SESSION:= StoredProc.FieldByName('OUT_ID_REPORT_SESSION').AsVariant;
 WriteTransaction.Commit;

end;

procedure TfrmUPReportReeWorkMain.cxButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUPReportReeWorkMain.FilterActionExecute(Sender: TObject);
var
    sp: TSprav;
begin
  try
    sp :=  GetSprav('UP\UpReportFilter');
    if sp <> nil
     then begin
       with sp.Input do
       begin
         Append;
         FieldValues['DBHandle'] := Integer(DB.Handle);
         FieldValues['id_session'] := id_session;
         FieldValues['id_sp_report'] := id_sp_report;
         Post;
       end;
       sp.Show;
       if sp.Output['CorrFilter']=1 then cxButtonPrint.Enabled:=true;
       sp.Free;
    end
    else ShowMessage('');
  except on e:Exception do
    MessageDlg(e.Message,mtError,[mbOk],0);
  end;
end;


procedure TfrmUPReportReeWorkMain.PrintActionExecute(Sender: TObject);
var
  SP_DataSet:TpFIBDataSet;
  SP:TpFIBStoredProc;
  NameReport:TpFIBDataSet;
  wf:TForm;
  m : TfrxMasterData;
begin
  NameReport:=TpFIBDataSet.Create(Self);
  NameReport.Database:=DB;
  NameReport.Transaction:=ReadTransaction;
  NameReport.SelectSQL.Text:='select R.name_fr3 from up_dt_report_sp_report  R where R.id_sp_report=:id_sp_report';
  NameReport.ParamByName('id_sp_report').AsInt64:=id_sp_report;
  NameReport.Active:=true;

  DSetData.SQLs.SelectSQL.Text:='select distinct * from UP_DT_REPORT_REE_WORKERS(:IN_ID_REPORT_SESSION) order by name_faculty collate win1251_ua, name_cafedra collate win1251_ua, fio collate win1251_ua';
  DSetData.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
  DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT FIRM_NAME FROM INI_ASUP_CONSTS';
  try
      DSetData.Open;
      DSetGlobalData.Open;
      except
      on E:Exception do
      begin
          AsupShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
          Screen.Cursor:=crDefault;
          Exit;
      end;
   end;

   if  DSetData.IsEmpty then
   begin
       ShowMessage('За такими даними співробітників не знайдено!');
       Screen.Cursor:=crDefault;
       Exit;
   end;

   Report.Clear;
   Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\UP\'+NameReport.FieldByName('name_fr3').AsString+'.fr3');
   Report.Variables['NameV']:=QuotedStr(DSetGlobalData['FIRM_NAME']);

   if PFontSizes=-255 then PFontSizes:=10;

   m := TfrxMasterData(Report.FindObject('MasterData1'));
   if m <> nil then
   begin
       m.Font.Name := PFontNames;
       m.Font.Size := PFontSizes;
       m.Font.Color := PFontColors;
       m.Font.Style := PFontStyles;
   end;
  if IsDesign then
    begin
      Report.DesignReport
    end
    else
    begin
      Report.PrepareReport(true);
      Report.ShowPreparedReport;
    end;
  if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

procedure TfrmUPReportReeWorkMain.FormDestroy(Sender: TObject);
begin
  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName:='UP_DT_REPORT_VAL_PARAM_DEL';
  StoredProc.Prepare;
  StoredProc.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
  try
    StoredProc.ExecProc;
  except
    begin
      WriteTransaction.Rollback;
      Exit;
    end;
   end;
 WriteTransaction.Commit;
end;

procedure TfrmUPReportReeWorkMain.FontActionExecute(Sender: TObject);
begin
    if FontDialogs.Execute
    then
    begin
        PFontNames := FontDialogs.Font.Name;
        PFontSizes := FontDialogs.Font.Size;
        PFontColors := FontDialogs.Font.Color;
        PFontStyles := FontDialogs.Font.Style;
    end;
end;

end.
