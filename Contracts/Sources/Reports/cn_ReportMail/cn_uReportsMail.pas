unit cn_uReportsMail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,cn_Common_Funcs, cn_Common_Types,IBase, FIBDatabase,
  pFIBDatabase, cxControls, cxGroupBox, cxContainer, cxEdit, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxCheckBox, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, ComCtrls, cxRadioGroup,
  cn_Common_Loader, ExtCtrls, RxMemDS, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, Gauges,Cn_uReportsConst, ActnList, cnConsts,
  frxClass, frxDBSet, frxDesgn, frxExportPDF, frxExportXLS, frxExportImage,
  frxExportRTF, frxExportTXT, frxExportXML;

type
  TfrmMainReportsMail = class(TForm)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxGroupBoxPeriodStud: TcxGroupBox;
    cxLabelPriodBegin: TcxLabel;
    cxLabelPeriodEnd: TcxLabel;
    cxDateEditPeriodBegin: TcxDateEdit;
    cxDateEditPeriodEnd: TcxDateEdit;
    cxButtonFilter: TcxButton;
    cxButtonRun: TcxButton;
    cxButtonQuit: TcxButton;
    StatusBar1: TStatusBar;
    cxRadioGrouptypeRep: TcxRadioGroup;
    cxButtonView: TcxButton;
    Timer1: TTimer;
    StoredProc: TpFIBStoredProc;
    Gauge1: TGauge;
    pFIBDataSetSetup: TpFIBDataSet;
    ActionList1: TActionList;
    ActionRun: TAction;
    ActionView: TAction;
    ActionParam: TAction;
    cxButtonCancel: TcxButton;
    pFIBDataSetInitDate: TpFIBDataSet;
    isDebug_act: TAction;
    DataSetReports: TpFIBDataSet;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    frxTXTExport1: TfrxTXTExport;
    frxRTFExport1: TfrxRTFExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxXMLExport1: TfrxXMLExport;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonQuitClick(Sender: TObject);
    procedure cxButtonFilterClick(Sender: TObject);
    procedure InitForm();
    procedure cxButtonRunClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButtonViewClick(Sender: TObject);
    procedure ActionParamExecute(Sender: TObject);
    procedure ActionRunExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure isDebug_actExecute(Sender: TObject);
  private
    { Private declarations }
  public
    isDebug: Boolean;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
    { Public declarations }
  end;

    ReportTHerited = class (TThread)
      DataBase:TpFIBDatabase;
      Transaction:TpFIBTransaction;
      bar:TGauge;
      pos:Integer;
      ID_SESSION:Variant;
      BOK,BCANCEL,BVIEW:TcxButton;
      ReportOptions:Variant;
      Constructor Create (InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL,InBVIEW:TcxButton;InReportOptions:Variant);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
    end;

function ShowReportsMail(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowReportsMail;

var
  frmMainReportsMail: TfrmMainReportsMail;
  PLanguageIndex: Integer;
  res:Variant;
  report:ReportTHerited;
  ID_SESSION:Int64;
  TimeStart:TTime;
  IS_DONGUET:Integer;
  cn_date_start:TDate;
  cn_end_month:Integer;
implementation

{$R *.dfm}

Constructor ReportTHerited.Create(InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL,InBVIEW:TcxButton;InReportOptions:Variant);
begin
  inherited Create(False);
  DataBase:=InDataBase;
  Transaction:=InTransaction;
  bar:=prog;
  ID_SESSION:=ID_TRAN;
  BOK:=InBOK;
  BCANCEL:=InBCANCEL;
  BVIEW:=InBVIEW;
  ReportOptions:=InReportOptions;
end;

procedure ReportTHerited.Execute;
var
  SP:TpFIBStoredProc;
begin
  pos:=0;
  Synchronize(UpdateBar);

  //bar.MaxValue := 3;
  SP:=TpFIBStoredProc.Create(nil);
  SP.Transaction:=Transaction;
  SP.Database:=DataBase;
  Transaction.StartTransaction;
  pos:=33;
  Synchronize(UpdateBar);
  SP.StoredProcName:='CN_TMP_REPORT_STUD_SELECT_PLAN';
  SP.Prepare;
  SP.ParamByName('ID_SESSION').asInt64:=ID_SESSION;
  SP.ParamByName('IN_DATE_BEG').AsDateTime:=VarToDateTime(ReportOptions[0][0]);
  SP.ParamByName('IN_DATE_END').AsDateTime:=VarToDateTime(ReportOptions[1][0]);
  try
    SP.ExecProc;
  except
    begin
      Transaction.Rollback;
      messageBox(0,PChar('Ошибка при выполнении процедуры: CN_TMP_REPORT_STUD_SELECT_PLAN'),'Ошибка!!!',MB_OK);
      Exit;
    end;
  end;
  Transaction.Commit;
  pos:=66;
  Synchronize(UpdateBar);
//Активация кнопок
  if not Terminated then
    begin
      BOK.Enabled:=true;
      BCANCEL.Enabled:=false;
      BVIEW.Enabled:=true;
    end;
  pos:=100;
  Synchronize(UpdateBar);
  SP.Destroy;
end;

procedure ReportTHerited.UpdateBar;
begin
  bar.Progress:=pos;
end;

destructor ReportTHerited.Destroy;
begin
  Inherited destroy;
end;

function ShowReportsMail(AParameter:TcnSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmMainReportsMail;
begin
  if AParameter.Formstyle = fsMDIChild then
  if IsMDIChildFormShow(TfrmMainReportsMail) then exit;

  ViewForm := TfrmMainReportsMail.Create(AParameter.Owner, AParameter.Db_Handle);
  ViewForm.FormStyle:= AParameter.Formstyle;

  case ViewForm.FormStyle of
   fsNormal, fsStayOnTop : ViewForm.ShowModal;
   fsMDIChild	          : ViewForm.Show;
   else
    begin
     ViewForm.ShowModal;
     ViewForm.free;
    end;
  end;

  Result:=res;
end;

constructor TfrmMainReportsMail.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);
  DB.Handle:=DB_Handle;

  Screen.Cursor:=crDefault;
end;


procedure TfrmMainReportsMail.FormCreate(Sender: TObject);
begin
  PLanguageIndex:=                      cn_Common_Funcs.cnLanguageIndex();

  caption:=                             'Реєстр студентів для листів';//Cn_uReportsConst.cn_RepStudFT[PLanguageIndex];
  cxGroupBoxPeriodStud.Caption:=        Cn_uReportsConst.cn_RepStudPeriod[PLanguageIndex];
  cxLabelPriodBegin.Caption:=           Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex];
  cxLabelPeriodEnd.Caption:=            Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex];
  cxButtonFilter.Caption:=              Cn_uReportsConst.cn_RepStudFilter[PLanguageIndex];
  cxButtonRun.Caption:=                 Cn_uReportsConst.cn_RepStudRun[PLanguageIndex];
  cxButtonCancel.Caption:=              Cn_uReportsConst.cn_RepStudCancel[PLanguageIndex];
  cxButtonQuit.Caption:=                Cn_uReportsConst.cn_RepStudQuit[PLanguageIndex];

  cxButtonView.Caption:=                Cn_uReportsConst.cn_RepStudView[PLanguageIndex];

  cxRadioGrouptypeRep.Properties.Items[0].Caption := Cn_uReportsConst.cn_RepRestr[PLanguageIndex];
  //cxRadioGrouptypeRep.Properties.Items[1].Caption := 'Листи';//Cn_uReportsConst.cn_RepSV[PLanguageIndex];

  InitForm();
end;

procedure TfrmMainReportsMail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMainReportsMail.cxButtonQuitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMainReportsMail.cxButtonFilterClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  Gauge1.Progress := 0;
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:=DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  AParameter.ID_SESSION:=ID_SESSION;
  Res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsFilter.bpl','ShowReportFilter');
  AParameter.Free;
  cxButtonView.Enabled:=false;  
end;

procedure TfrmMainReportsMail.InitForm();
var
  yyyy,mm,dd:word;
begin
  //получаем идентификатор транзакции
  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName:='CN_DT_REPORTS_SESSION';
  StoredProc.Prepare;
  try
    StoredProc.ExecProc;
  except
    begin
      WriteTransaction.Rollback;
      Exit;
    end;
   end;
 ID_SESSION:= StoredProc.FieldByName('ID_SESSION').AsVariant;
 WriteTransaction.Commit; 

 {Делаем проверку на даты}
 pFIBDataSetInitDate.Database:=DB;
 pFIBDataSetInitDate.Transaction:=ReadTransaction;
 pFIBDataSetInitDate.Active:=true;
 cn_date_start:=pFIBDataSetInitDate.FieldByName('cn_date_start').AsDateTime;
 cn_end_month:=pFIBDataSetInitDate.FieldByName('cn_end_month').AsInteger;


  DecodeDate(Now,yyyy,mm,dd);
  if mm>=09 then
    begin
      cxDateEditPeriodBegin.Date:=      EncodeDate(yyyy,09,01);
      cxDateEditPeriodEnd.Date:=        EncodeDate(yyyy+1,07,01);
      if cn_end_month=1 then
        begin
          cxDateEditPeriodEnd.Date:=        EncodeDate(yyyy+1,06,30);
        end;
    end
    else
    begin
      cxDateEditPeriodBegin.Date:=      EncodeDate(yyyy-1,09,01);
      cxDateEditPeriodEnd.Date:=        EncodeDate(yyyy,07,01);
      if cn_end_month=1 then
        begin
          cxDateEditPeriodEnd.Date:=        EncodeDate(yyyy,06,30);
        end;
    end;
  cxButtonView.Enabled:=      false;
  cxButtonCancel.Enabled:=    false;

  pFIBDataSetSetup.Active:=false;
  pFIBDataSetSetup.Active:=true;
  IS_DONGUET:=pFIBDataSetSetup.FieldByName('IS_DONGUET').AsInteger;
end;

procedure TfrmMainReportsMail.cxButtonRunClick(Sender: TObject);
var
  ReportOptions:Variant;
begin
  if cxDateEditPeriodBegin.Date>cxDateEditPeriodEnd.Date then
   begin
    messageBox(Handle,'Дата початку вибраного періоду більша, за дату кінця вибраного періоду!',
         'Увага',MB_ICONWARNING or MB_OK);
    exit;
   end;
  if cxDateEditPeriodBegin.Date<cn_date_start then
   begin
    messageBox(Handle,'Дата початку вибраного періоду меньша за дату старту системи!',
         'Увага',MB_ICONWARNING or MB_OK);
    exit;
   end;

  cxButtonRun.Enabled:=false;
  cxButtonCancel.Enabled:=true;
  cxButtonFilter.Enabled:=false;
  cxButtonView.Enabled:=false;

  TimeStart:=Now;
  Timer1.Enabled:=true;

  ReportOptions:=VarArrayCreate([0,1],varVariant);
  ReportOptions[0]:=VarArrayOf([cxDateEditPeriodBegin.Date]);
  ReportOptions[1]:=VarArrayOf([cxDateEditPeriodEnd.Date]);
  report := ReportTHerited.Create(DB,WriteTransaction,
            Gauge1,ID_SESSION,cxButtonRun,cxButtonCancel,cxButtonView,ReportOptions);
end;

procedure TfrmMainReportsMail.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='Час формування звіту: '+TimeToStr(Now-TimeStart);
  if  Gauge1.Progress = 0 then Gauge1.MaxValue := 100;
  if  Gauge1.Progress < 98 then Gauge1.Progress := Gauge1.Progress + 1;
  if cxButtonView.Enabled=true then
    begin
      Timer1.Enabled:=false;
      cxButtonFilter.Enabled:=true;
    end;
end;

procedure TfrmMainReportsMail.FormDestroy(Sender: TObject);
begin
  if report<>nil then
    begin
      report.Terminate;
    end;
if ID_SESSION<>0 then
  begin
    WriteTransaction.StartTransaction;
    StoredProc.StoredProcName:='CN_TMP_REPORT_DELETE';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_SESSION').asInt64:=ID_SESSION;
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
end;

procedure TfrmMainReportsMail.cxButtonViewClick(Sender: TObject);
begin
  if cxRadioGrouptypeRep.ItemIndex = 1 then
   begin
   //листы
   end
  else
   begin
    //реестр
    DataSetReports.Close;
    DataSetReports.SelectSQL.Text := 'SELECT * FROM CN_SELECT_DOG_FOR_MAIL(:id_session)';
    DataSetReports.ParamByName('id_session').AsInt64 := id_session;
    DataSetReports.open;

    frxReport1.Clear;
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\RListMail.fr3');
    frxReport1.Variables.Clear;

    frxReport1.PrepareReport(True);
    if isDebug
     then frxReport1.DesignReport
     else frxReport1.ShowReport;
   end;
end;

procedure TfrmMainReportsMail.ActionParamExecute(Sender: TObject);
begin
  cxButtonFilterClick(self);
end;

procedure TfrmMainReportsMail.ActionRunExecute(Sender: TObject);
begin
  cxButtonRun.SetFocus;
  cxButtonRunClick(self);
end;

procedure TfrmMainReportsMail.ActionViewExecute(Sender: TObject);
begin
if cxButtonView.Enabled=true then
  begin
    cxButtonViewClick(self);
  end;  
end;

procedure TfrmMainReportsMail.isDebug_actExecute(Sender: TObject);
begin
  if isDebug
   then
    begin
     isDebug := False;
     StatusBar1.Panels[1].Text:= '';
    end
   else
    begin
     isDebug := True;
     StatusBar1.Panels[1].Text:= '*debug';
    end;
end;

end.
