unit MainReportPercentPay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox,
  FIBQuery, pFIBQuery, pFIBStoredProc, ExtCtrls, RxMemDS, FIBDataSet,
  pFIBDataSet, cxGridTableView, FIBDatabase, pFIBDatabase, StdCtrls,
  cxRadioGroup, ComCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxLabel, cxGroupBox, Gauges,IBase,cn_Common_Loader,
  cnConsts,cn_Common_Funcs,cn_Common_Types,Cn_uReportsConst, ActnList;

type
  TfrmMainReportPercentPay = class(TForm)
    Gauge1: TGauge;
    cxGroupBoxPeriodStud: TcxGroupBox;
    cxButtonFilter: TcxButton;
    cxButtonRun: TcxButton;
    cxButtonCancel: TcxButton;               
    cxButtonQuit: TcxButton;
    StatusBar1: TStatusBar;
    cxButtonView: TcxButton;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
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
    Timer1: TTimer;
    StoredProc: TpFIBStoredProc;
    pFIBDataSetSetup: TpFIBDataSet;
    cxLabelPriodBegin: TcxLabel;
    cxLabelPeriodEnd: TcxLabel;
    cxDateEditPeriodEnd: TcxDateEdit;
    cxDateEditPeriodBegin: TcxDateEdit;
    pFIBDataSet1: TpFIBDataSet;
    DataSourcePrintSetup: TDataSource;
    pFIBDataSetPrintSetup: TpFIBDataSet;
    RxMemoryDataPrintSetup: TRxMemoryData;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    SelectField: TcxGridDBColumn;
    NameField: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    ActionList1: TActionList;
    ActionRun: TAction;
    ActionView: TAction;
    ActionParam: TAction;
    pFIBDataSetInitDate: TpFIBDataSet;
    isDebug_act: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonRunClick(Sender: TObject);
    procedure cxButtonFilterClick(Sender: TObject);
    procedure cxButtonQuitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InitForm();
    procedure Timer1Timer(Sender: TObject);
    procedure cxButtonViewClick(Sender: TObject);
    procedure ActionParamExecute(Sender: TObject);
    procedure ActionRunExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure isDebug_actExecute(Sender: TObject);
  private
    { Private declarations }
  public
    isDebug : Boolean;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;
    ReportTHerited = class (TThread)
      DataBase:TpFIBDatabase;
      Transaction,ReadTransaction:TpFIBTransaction;
      bar:TGauge;
      pos:Integer;
      ID_SESSION:Variant;
      BOK,BCANCEL,BVIEW:TcxButton;
      ReportOptions:Variant;
      Constructor Create (InDataBase:TpFIBDatabase;InTransaction,InReadTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL,InBVIEW:TcxButton;InReportOptions:Variant);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
    end;

function ShowReportPercentPay(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowReportPercentPay;
var
  frmMainReportPercentPay: TfrmMainReportPercentPay;
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
Constructor ReportTHerited.Create(InDataBase:TpFIBDatabase;InTransaction,InReadTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL,InBVIEW:TcxButton;InReportOptions:Variant);
begin
  inherited Create(False);
  DataBase:=InDataBase;
  Transaction:=InTransaction;
  ReadTransaction:=InReadTransaction;
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
  selectAll:TpFIBDataSet;
  i:Integer;
begin

  SP:=TpFIBStoredProc.Create(nil);
  SP.Transaction:=Transaction;
  SP.Database:=DataBase;
  Transaction.StartTransaction;
  SP.StoredProcName:='CN_TMP_REPORT_STUD_SELECT';
  SP.Prepare;
  SP.ParamByName('ID_SESSION').asInt64:=ID_SESSION;
  SP.ParamByName('IN_DATE_BEG').AsDateTime:=VarToDateTime(ReportOptions[0][0]);
  SP.ParamByName('IN_DATE_END').AsDateTime:=VarToDateTime(ReportOptions[1][0]);
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
//начинаем рассчет сумм, блин как же это долго
  selectAll:=TpFIBDataSet.create(nil);
  selectAll.Database:=DataBase;
  selectAll.Transaction:=ReadTransaction;
  selectAll.SQLs.SelectSQL.Add('select ID_STUD  from CN_TMP_REPORT_STUD where id_session=:pid_session');
  selectAll.ParamByName('pid_session').AsInt64:=ID_SESSION;
  selectAll.Active:=true;
  selectAll.FetchAll;
  selectAll.First;

  bar.MaxValue:=selectAll.RecordCount-1;
  for i:=0 to selectAll.RecordCount-1 do
    begin
       pos:=i;
       Synchronize(UpdateBar);
       With SP do
          begin
          try
          StoredProcName:='CN_TMP_REPORT_PERCENT_PAY';
          Database:=Database;
          Transaction:=Transaction;
          Transaction.StartTransaction;
          Prepare;
          ParamByName('ID_STUD').Asint64:=SelectAll.FieldByName('ID_STUD').AsVariant;
          ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
          ParamByName('BEG_DATE').AsDate:=VarToDateTime(ReportOptions[0][0]);
          ParamByName('END_DATE').AsDate:=VarToDateTime(ReportOptions[1][0]);
          ExecProc;
          Transaction.Commit;
        except
          MessageBox(Application.MainForm.Handle,'Ошибка расчета при формирование отчета!','Внимание!',MB_ICONWARNING or MB_OK);
          Transaction.Rollback;
          raise;
        end;
        end;
      selectAll.Next;
    end;
  
//Активация кнопок
  if not Terminated then
    begin
      BOK.Enabled:=true;
      BCANCEL.Enabled:=false;
      BVIEW.Enabled:=true;
    end;
  selectAll.Active := false;
  selectAll.Destroy;
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

function ShowReportPercentPay(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmMainReportPercentPay;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmMainReportPercentPay) then exit;
 ViewForm := TfrmMainReportPercentPay.Create(AParameter.Owner, AParameter.Db_Handle);
 ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
   else begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
Result:=res;
end;

constructor TfrmMainReportPercentPay.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DB.Handle:=DB_Handle;
Screen.Cursor:=crDefault;
end;

procedure TfrmMainReportPercentPay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMainReportPercentPay.cxButtonRunClick(Sender: TObject);
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
 cxButtonView.Enabled:=false;
 TimeStart:=Now;
 Timer1.Enabled:=true;
 ReportOptions:=VarArrayCreate([0,1],varVariant);
 ReportOptions[0]:=VarArrayOf([cxDateEditPeriodBegin.Date]);
 ReportOptions[1]:=VarArrayOf([cxDateEditPeriodEnd.Date]);
 report:=ReportTHerited.Create(DB,WriteTransaction,ReadTransaction,
          Gauge1,ID_SESSION,cxButtonRun,cxButtonCancel,cxButtonView,ReportOptions);
end;

procedure TfrmMainReportPercentPay.cxButtonFilterClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:=DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  AParameter.ID_SESSION:=ID_SESSION;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsFilter.bpl','ShowReportFilter');
  AParameter.Free;
  cxButtonView.Enabled:=false;
end;

procedure TfrmMainReportPercentPay.cxButtonQuitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMainReportPercentPay.FormDestroy(Sender: TObject);
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

procedure TfrmMainReportPercentPay.FormCreate(Sender: TObject);
begin
  PLanguageIndex:=                      cn_Common_Funcs.cnLanguageIndex();
  caption:=                             Cn_uReportsConst.cn_RepSVPercent[PLanguageIndex];
  cxGroupBoxPeriodStud.Caption:=        Cn_uReportsConst.cn_RepSVPercentPeriod[PLanguageIndex];
  cxLabelPriodBegin.Caption:=           Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex];
  cxLabelPeriodEnd.Caption:=            Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex];
  cxButtonFilter.Caption:=              Cn_uReportsConst.cn_RepStudFilter[PLanguageIndex];
  cxButtonRun.Caption:=                 Cn_uReportsConst.cn_RepStudRun[PLanguageIndex];
  cxButtonCancel.Caption:=              Cn_uReportsConst.cn_RepStudCancel[PLanguageIndex];
  cxButtonQuit.Caption:=                Cn_uReportsConst.cn_RepStudQuit[PLanguageIndex];
  cxButtonView.Caption:=                Cn_uReportsConst.cn_RepStudView[PLanguageIndex];

  NameField.Caption:=                   Cn_uReportsConst.cn_RepStudSelFiled[PLanguageIndex];
  SelectField.Caption:=                 '';

  InitForm();
end;

procedure TfrmMainReportPercentPay.InitForm();
var
  i:Integer;
  yyyy,mm,dd:word;
begin
  pFIBDataSetPrintSetup.Database:=      DB;
  pFIBDataSetPrintSetup.Transaction:=   ReadTransaction;
  pFIBDataSetPrintSetup.Active:=        false;
  pFIBDataSetPrintSetup.Active:=        true;
  pFIBDataSetPrintSetup.FetchAll;
  pFIBDataSetPrintSetup.First;
  RxMemoryDataPrintSetup.EmptyTable;
  for i:=0 to pFIBDataSetPrintSetup.RecordCount-1 do
    begin
      RxMemoryDataPrintSetup.Open;
      RxMemoryDataPrintSetup.Insert;
      RxMemoryDataPrintSetup.FieldByName('RxSelectField').Value:= pFIBDataSetPrintSetup.FieldByName('SELECT_FIELD').AsInteger;
      RxMemoryDataPrintSetup.FieldByName('RxNameField').Value:=   pFIBDataSetPrintSetup.FieldByName('NAME_FIELD').AsString;
      RxMemoryDataPrintSetup.FieldByName('RxNameVariant').Value:= pFIBDataSetPrintSetup.FieldByName('VARIABLE_FILEDS').AsString;
      RxMemoryDataPrintSetup.FieldByName('RxLenghtField').Value:= pFIBDataSetPrintSetup.FieldByName('LENGHT_FIELDS').AsInteger;
      RxMemoryDataPrintSetup.FieldByName('RxOrdFileds').Value:=   pFIBDataSetPrintSetup.FieldByName('ORD_FIELD').AsInteger;
      RxMemoryDataPrintSetup.Post;
      pFIBDataSetPrintSetup.Next;
    end;

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

procedure TfrmMainReportPercentPay.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='Час формування звіту: '+TimeToStr(Now-TimeStart);
  if cxButtonView.Enabled=true then
    begin
      Timer1.Enabled:=false;
    end;
end;

procedure TfrmMainReportPercentPay.cxButtonViewClick(Sender: TObject);
var
  query:String;
  AParameter:TcnSimpleParams;
  sql_master,order:String;
  i,j,nj:Integer;
  FieldView,NFieldView,FieldGroup,FieldSum,FieldNameReport:Variant;
begin

    j:=0;
    RxMemoryDataPrintSetup.First;
    order:='';
    sql_master:='';
    for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
      begin
        if RxMemoryDataPrintSetup.FieldByName('RxSelectField').AsInteger=1 then
          begin
            if RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString<>'' then
              begin
                inc(j);
                sql_master:=sql_master+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+',';
                order:=order +RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+'=:'+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+' and ';
              end;
          end;
        RxMemoryDataPrintSetup.Next;
      end;
    FieldView:=VarArrayCreate([0,j+7],varVariant);
    nj:=RxMemoryDataPrintSetup.RecordCount-j;
    if nj>=0 then
      begin
        NFieldView:=VarArrayCreate([0,nj-1],varVariant);
      end
      else
      begin
        NFieldView:=VarArrayCreate([0,0],varVariant);
      end;

    RxMemoryDataPrintSetup.First;
    if j>0 then
      begin
        j:=0;
        nj:=0;
        for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
          begin
          if RxMemoryDataPrintSetup.FieldByName('RxSelectField').AsInteger=1 then
              begin
                if RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString<>'' then
                  begin
                    FieldView[j]:=VarArrayOf([RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString,RxMemoryDataPrintSetup.FieldByName('RxNameField').AsString,RxMemoryDataPrintSetup.FieldByName('RxLenghtField').AsInteger]);
                    inc(j);
                  end;
              end
              else
              begin
                NFieldView[nj]:=VarArrayOf([RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString,RxMemoryDataPrintSetup.FieldByName('RxNameField').AsString]);
                inc(nj);
              end;
            RxMemoryDataPrintSetup.Next;
          end;
      end;
FieldView[j]:=VarArrayOf(['SUM_PERCENTH100']);
FieldView[j+1]:=VarArrayOf(['SUM_PERCENT100']);
FieldView[j+2]:=VarArrayOf(['SUM_PERCENTS100']);
FieldView[j+3]:=VarArrayOf(['SUM_PERCENT50']);
FieldView[j+4]:=VarArrayOf(['SUM_PERCENTS50']);
FieldView[j+5]:=VarArrayOf(['SUM_PERCENT0']);
FieldView[j+6]:=VarArrayOf(['SUM_PERCENTS0']);
FieldView[j+7]:=VarArrayOf(['CNT']);

if (order='')then
  begin
    messageBox(Handle,'Не виран жоден з параметрів групування','Увага',MB_ICONWARNING or MB_OK);
    Exit;
  end;

    query:='select '+sql_master+'S.ID_SESSION,count(*) CNT,count(P.sum_percenth100) sum_percenth100,';
    query:=query+' count(P.sum_percent100) sum_percent100,count(P.sum_percents100) sum_percents100,';
    query:=query+' count(P.sum_percent50) sum_percent50,count(P.sum_percents50) sum_percents50,';
    query:=query+' count(P.sum_percent0) sum_percent0,count(P.sum_percents0) sum_percents0';
    query:=query+' from cn_tmp_report_pay_doc_prov P,CN_TMP_REPORT_STUD S';
    query:=query+' where P.id_session=S.id_session and P.id_stud=S.id_stud';
    query:=query+' and S.ID_SESSION='+IntToStr(ID_SESSION);    
    query:=query+' group by '+sql_master+' S.ID_SESSION';
    query:=query+ ' order by '+sql_master+' S.ID_SESSION';


    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    AParameter.Formstyle:=fsMDIChild;
    AParameter.WaitPakageOwner:=self;
    AParameter.Sql_Master:=query;
    AParameter.Sql_Detail:=query;
    AParameter.FieldView:=FieldView;
    AParameter.NotFieldView:=NFieldView;
    AParameter.FieldNameReport:=null;
    AParameter.Type_Report:=1;
    AParameter.LastIgnor:=8;
    AParameter.Report_Name:='SVPERCENTPAY';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;
end;

procedure TfrmMainReportPercentPay.ActionParamExecute(Sender: TObject);
begin
  cxButtonFilterClick(self);
end;

procedure TfrmMainReportPercentPay.ActionRunExecute(Sender: TObject);
begin
  cxButtonRun.SetFocus;
  cxButtonRunClick(self);
end;

procedure TfrmMainReportPercentPay.ActionViewExecute(Sender: TObject);
begin
if cxButtonView.Enabled=true then
  begin
    cxButtonViewClick(self);
  end;
end;

procedure TfrmMainReportPercentPay.isDebug_actExecute(Sender: TObject);
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
