unit cn_MainReportsAnalyzSmeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox,
  FIBQuery, pFIBQuery, pFIBStoredProc, ExtCtrls, RxMemDS, FIBDataSet,
  pFIBDataSet, cxGridTableView, FIBDatabase, pFIBDatabase, StdCtrls,
  cxRadioGroup, ComCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxButtons, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxGroupBox, Gauges,Ibase,cn_Common_Types,cn_Common_Funcs,
  cn_Common_Loader, Cn_uReportsConst, cxLabel, ActnList,Kernel, cxMemo,
  ClipBrd, frxClass, frxDBSet, frxExportRTF, frxExportXLS, frxExportHTML,
  cn_Common_Messages, cnConsts;

type
  TfrmReportsAnalyzSmeta = class(TForm)
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
    pFIBDataSetPrintSetup: TpFIBDataSet;
    RxMemoryDataPrintSetup: TRxMemoryData;
    DataSourcePrintSetup: TDataSource;
    Timer1: TTimer;
    StoredProc: TpFIBStoredProc;
    pFIBDataSetSetup: TpFIBDataSet;
    cxLabelPriodBegin: TcxLabel;
    cxLabelPeriodEnd: TcxLabel;
    cxDateEditPeriodEnd: TcxDateEdit;
    cxDateEditPeriodBegin: TcxDateEdit;
    ActionList1: TActionList;
    ActionRun: TAction;
    ActionView: TAction;
    ActionParam: TAction;
    pFIBDataSetInitDate: TpFIBDataSet;
    cxButtonDOC: TcxButton;
    pFIBDataSetToDoc: TpFIBDataSet;
    ActionDebug: TAction;
    isDebug_act: TAction;
    cxRadioGrouptypeRep: TcxRadioGroup;
    pFIBDataSet1: TpFIBDataSet;
    pFIBDataSet1SMETA_KOD: TFIBIntegerField;
    pFIBDataSet1NAME_FACULT: TFIBStringField;
    pFIBDataSet1NAME_SPEC: TFIBStringField;
    pFIBDataSet1NAME_FORM_STUD: TFIBStringField;
    pFIBDataSet1NAME_KAT_STUD: TFIBStringField;
    pFIBDataSet1FIO: TFIBStringField;
    pFIBDataSet1NUM_DOG: TFIBStringField;
    pFIBDataSet1SUMMA_F_PERE: TFIBBCDField;
    pFIBDataSet1SMETA_TITLE: TFIBStringField;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    procedure cxButtonFilterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InitForm();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonQuitClick(Sender: TObject);
    procedure cxButtonRunClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxButtonViewClick(Sender: TObject);
    procedure ActionParamExecute(Sender: TObject);
    procedure ActionRunExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure cxButtonDOCClick(Sender: TObject);
    procedure Save_doc();
    function Del_doc(id_doc_del:Int64):Integer;
    procedure ActionDebugExecute(Sender: TObject);
    procedure isDebug_actExecute(Sender: TObject);
  private
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
    { Private declarations }
  public
    { Public declarations }
    IS_DEBUG_MODE: boolean;
    isDebug : Boolean; 
  end;

    ReportTHerited = class (TThread)
      DataBase:TpFIBDatabase;
      Transaction,ReadTransaction:TpFIBTransaction;
      bar:TGauge;
      pos:Integer;
      ID_SESSION:Variant;
      BOK,BCANCEL,BVIEW,BFilter,BDoc:TcxButton;
      ReportOptions:Variant;
      Constructor Create (InDataBase:TpFIBDatabase;InTransaction,InReadTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL,InBVIEW,InBFilter,InBDoc:TcxButton;InReportOptions:Variant);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
    end;

function ShowReportPayAnalyzSmeta(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowReportPayAnalyzSmeta;

var
  frmReportsAnalyzSmeta: TfrmReportsAnalyzSmeta;
  PLanguageIndex: Integer;
  res:Variant;
  report:ReportTHerited;
  ID_SESSION:Int64;
  TimeStart:TTime;
  IS_DONGUET:Integer;
  cn_date_start:TDate;
  cn_end_month:Integer;  
implementation

uses cn_ErrorDocProv, cn_Form_Get_ID;
{$R *.dfm}

Constructor ReportTHerited.Create(InDataBase:TpFIBDatabase;InTransaction,InReadTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL,InBVIEW,InBFilter,InBDoc:TcxButton;InReportOptions:Variant);
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
  BFilter:=InBFilter;
  BDoc:=InBDoc;
  ReportOptions:=InReportOptions;
end;

procedure ReportTHerited.Execute;
var
  SP:TpFIBStoredProc;
  selectAll:TpFIBDataSet;
  i:Integer;
begin

  pos:=0;
  Synchronize(UpdateBar);

  SP:=TpFIBStoredProc.Create(nil);
  SP.Transaction:=Transaction;
  SP.Database:=DataBase;
  Transaction.StartTransaction;
  SP.StoredProcName:='CN_TMP_REPORT_STUD_SELECT';
  SP.Prepare;
  SP.ParamByName('ID_SESSION').asInt64:=ID_SESSION;
  SP.ParamByName('IN_DATE_BEG').AsDateTime:=VarToDateTime(ReportOptions[0][0]); //StrToDate('01.01.1900');
  SP.ParamByName('IN_DATE_END').AsDateTime:=VarToDateTime(ReportOptions[1][0]); //StrToDate('31.12.9999');
  SP.Prepare;
  try
    SP.ExecProc;
  except
    begin
      Transaction.Rollback;
      messageBox(0,PChar('Ошибка при выполнении процедуры CN_TMP_REPORT_STUD_SELECT'),'Ошибка!!!',MB_OK);
      Exit;
    end;
  end;
  Transaction.Commit;
  bar.Progress:=2;
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
          StoredProcName:='CN_TMP_REPORT_ANALYZ_SMETA';
          Database:=Database;
          Transaction:=Transaction;
          Transaction.StartTransaction;
          Prepare;
          ParamByName('ID_STUD').Asint64:=SelectAll.FieldByName('ID_STUD').AsVariant;
          ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
          ParamByName('BEG_CHECK').AsDate:=VarToDateTime(ReportOptions[0][0]);
          ParamByName('END_CHECK').AsDate:=VarToDateTime(ReportOptions[1][0]);          
          ExecProc;
          Transaction.Commit;
        except
          MessageBox(Application.MainForm.Handle,PChar('Ошибка расчета при формирование отчета!'+#13+' Прцедура CN_TMP_REPORT_ANALYZ_SMETA'+#13+SelectAll.FieldByName('FIO').AsString),'Внимание!',MB_ICONWARNING or MB_OK);
          Clipboard.AsText:=SelectAll.FieldByName('ID_STUD').AsVariant;
          Transaction.Rollback;
          raise;
        end;
        end;
      selectAll.Next;
    end;

  Transaction.StartTransaction;
  SP.StoredProcName:='CN_TMP_REPORT_SMETA_INFO';
  SP.Prepare;
  SP.ParamByName('ID_SESSION').asInt64:=ID_SESSION;
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
//Активация кнопок
  if not Terminated then
    begin
      BOK.Enabled:=true;
      BCANCEL.Enabled:=false;
      BVIEW.Enabled:=true;
      BDoc.Enabled:=true;
      BFilter.Enabled:=true;
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

function ShowReportPayAnalyzSmeta(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmReportsAnalyzSmeta;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmReportsAnalyzSmeta) then exit;
 ViewForm := TfrmReportsAnalyzSmeta.Create(AParameter.Owner, AParameter.Db_Handle);
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

constructor TfrmReportsAnalyzSmeta.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  DB.Handle:=DB_Handle;
  Screen.Cursor:=crDefault;
end;


procedure TfrmReportsAnalyzSmeta.cxButtonFilterClick(Sender: TObject);
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

procedure TfrmReportsAnalyzSmeta.FormCreate(Sender: TObject);
begin
  PLanguageIndex:=                      cn_Common_Funcs.cnLanguageIndex();
  caption:=                             Cn_uReportsConst.cn_RepDocProv[PLanguageIndex];
  cxGroupBoxPeriodStud.Caption:=        Cn_uReportsConst.cn_RepDatePayNeed[PLanguageIndex];
  cxLabelPriodBegin.Caption:=           Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex];
  cxLabelPeriodEnd.Caption:=            Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex];
  cxButtonFilter.Caption:=              Cn_uReportsConst.cn_RepStudFilter[PLanguageIndex];
  cxButtonRun.Caption:=                 Cn_uReportsConst.cn_RepStudRun[PLanguageIndex];
  cxButtonCancel.Caption:=              Cn_uReportsConst.cn_RepStudCancel[PLanguageIndex];
  cxButtonQuit.Caption:=                Cn_uReportsConst.cn_RepStudQuit[PLanguageIndex];
  cxButtonView.Caption:=                Cn_uReportsConst.cn_RepStudView[PLanguageIndex];
  cxButtonDOC.Caption:=                 Cn_uReportsConst.cn_RepStudDOC[PLanguageIndex];

  cxRadioGrouptypeRep.Properties.Items[0].Caption:=Cn_uReportsConst.cn_RepRestr[PLanguageIndex];
  cxRadioGrouptypeRep.Properties.Items[1].Caption:=Cn_uReportsConst.cn_RepSV[PLanguageIndex];
  cxRadioGrouptypeRep.ItemIndex:=1;
  InitForm();
end;

procedure TfrmReportsAnalyzSmeta.InitForm();
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
      cxDateEditPeriodEnd.Date:=        EncodeDate(yyyy+1,09,01);
      if cn_end_month=1 then
        begin
          cxDateEditPeriodEnd.Date:=        EncodeDate(yyyy+1,08,31);
        end;
    end
    else
    begin
      cxDateEditPeriodBegin.Date:=      EncodeDate(yyyy-1,09,01);
      cxDateEditPeriodEnd.Date:=        EncodeDate(yyyy,09,01);
      if cn_end_month=1 then
        begin
          cxDateEditPeriodEnd.Date:=        EncodeDate(yyyy,08,31);
        end;
    end;
//  cxButtonView.Enabled:=      false;
  cxButtonCancel.Enabled:=    false;

  pFIBDataSetSetup.Active:=false;
  pFIBDataSetSetup.Active:=true;
  IS_DONGUET:=pFIBDataSetSetup.FieldByName('IS_DONGUET').AsInteger;  
end;

procedure TfrmReportsAnalyzSmeta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmReportsAnalyzSmeta.cxButtonQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReportsAnalyzSmeta.cxButtonRunClick(Sender: TObject);
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
 cxButtonFilter.Enabled:=false;
 cxButtonDOC.Enabled:=false;

 TimeStart:=Now;
 Timer1.Enabled:=true;
 ReportOptions:=VarArrayCreate([0,1],varVariant);
 ReportOptions[0]:=VarArrayOf([cxDateEditPeriodBegin.Date]);
 ReportOptions[1]:=VarArrayOf([cxDateEditPeriodEnd.Date]);
 report:=ReportTHerited.Create(DB,WriteTransaction,ReadTransaction,
          Gauge1,ID_SESSION,cxButtonRun,cxButtonCancel,cxButtonView,cxButtonFilter,cxButtonDOC,ReportOptions);
end;

procedure TfrmReportsAnalyzSmeta.FormDestroy(Sender: TObject);
begin
if report<>nil then
  begin
    report.Terminate;
  end;
if ID_SESSION<>0 then
  begin
    if not IS_DEBUG_MODE then
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
end;

procedure TfrmReportsAnalyzSmeta.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='Час формування звіту: '+TimeToStr(Now-TimeStart);
  if cxButtonView.Enabled=true then
    begin
      Timer1.Enabled:=false;
      cxButtonFilter.Enabled:=true;      
    end;
end;

procedure TfrmReportsAnalyzSmeta.cxButtonViewClick(Sender: TObject);
var
  query,sql_master,sql_master_add,order,text_sum_select,text_sum_where:String;
  i,j,nj,SumC:integer;
  Doc_R,Doc_Sv,Doc_SvSM:Integer;
  FieldView,NFieldView,FieldGroup,FieldSum,FieldNameReport:Variant;
  type_report:String;
  AParameter:TcnSimpleParams;
begin
  Doc_SvSM:=0;
  Doc_SV:=0;
  Doc_R:=0;
  if cxRadioGrouptypeRep.ItemIndex=1 then
  begin
    Doc_SV:=1;
    Doc_R:=0;
  end
  else
  begin
    Doc_SV:=0;
    Doc_R:=1;
  end;

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

//реестр
  if Doc_R=1 then
  begin
    pFIBDataSet1.Close;
//    ShowMessage(IntToStr(ID_SESSION));
    pFIBDataSet1.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
    pFIBDataSet1.Open;
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\ReportSmPereplata.fr3');
    frxReport1.PrepareReport;
    frxReport1.ShowPreparedReport;
    if isDebug then frxReport1.DesignReport;
  end;
{  if Doc_R=1 then
  begin
    RxMemoryDataPrintSetup.First;
    if j>=0 then
      begin
        FieldGroup:=VarArrayCreate([0,j-1],varVariant);
        NFieldView:=VarArrayCreate([0,RxMemoryDataPrintSetup.RecordCount+2-j-1],varVariant);
        j:=0;
        nj:=0;
        for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
          begin
          if RxMemoryDataPrintSetup.FieldByName('RxSelectField').AsInteger=1 then
              begin
                if RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString<>'' then
                  begin
                    FieldGroup[j]:=VarArrayOf([RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString,'',RxMemoryDataPrintSetup.FieldByName('RxLenghtField').AsInteger]);
                    inc(j);
                  end;
              end
              else
              begin
                NFieldView[nj]:=VarArrayOf([RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString,'',RxMemoryDataPrintSetup.FieldByName('RxLenghtField').AsInteger]);
                inc(nj);
              end;
            RxMemoryDataPrintSetup.Next;
          end;
      end;

    //создаем мастер запрос
    if j>0 then
      begin
        sql_master_add:=' order by ISMAINDOG,'+sql_master+'S.ID_SESSION';
        sql_master:='select distinct ISMAINDOG,'+sql_master + 'S.ID_SESSION from CN_TMP_REPORT_PAY_DOC_PROV P,CN_TMP_REPORT_STUD S where P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION);
      end
      else
      begin
        sql_master_add:=' order by ISMAINDOG,S.ID_SESSION';
        sql_master:='select distinct ISMAINDOG,S.ID_SESSION from CN_TMP_REPORT_PAY_DOC_PROV P,CN_TMP_REPORT_STUD S where P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION);
      end;

    query:='select * from CN_TMP_REPORT_PAY_DOC_PROV P,CN_TMP_REPORT_STUD S where ';
    query:=query+'P.id_session=S.id_session and P.id_stud=S.id_stud and  S.ID_SESSION='+IntToStr(ID_SESSION)+' and ISMAINDOG=:ISMAINDOG';

    query:=query+' and '+order+' S.ID_SESSION=:ID_SESSION ';
//    query:=query+' ORDER BY ISMAINDOG,'+sql_master+',FIO';

    FieldNameReport:=VarArrayCreate([0,1],varVariant);
    FieldNameReport[0]:=VarArrayOf([sql_master_add]);

    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    AParameter.Formstyle:=fsMDIChild;
    AParameter.WaitPakageOwner:=self;
    AParameter.Sql_Master:=Sql_Master;
    AParameter.Sql_Detail:=query;
    AParameter.FieldView:=FieldGroup;
    AParameter.NotFieldView:=NFieldView;
    AParameter.FieldNameReport:=FieldNameReport;
    AParameter.FieldNameReport:= FieldNameReport;
    AParameter.Type_Report:=0;
    AParameter.LastIgnor:=0;
    AParameter.Report_Name:='RDOCPROV';
    AParameter.ID_SESSION := ID_SESSION;
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;    
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsViewSmeta');
    AParameter.Free;
  end;
}
//сводная не для ДонГУЭТ
if (Doc_Sv=1) and (IS_DONGUET =0 )then
  begin

{
    FieldView[j]:=VarArrayOf(['summa_n_nach','Сумма поступлений',70]);
    FieldView[j+1]:=VarArrayOf(['summa_n_pay','Сумма поступлений',70]);
    FieldView[j+2]:=VarArrayOf(['summa_p_dolg','Сумма поступлений',70]);
    FieldView[j+3]:=VarArrayOf(['summa_p_pere','Сумма поступлений',70]);   }

    query:='select DP.smeta_kod,DP.ID_SESSION,SUM(DP.summa_n_nach)as summa_n_nach,';
    query:=query+' SUM(DP.summa_n_pay)as summa_n_pay,SUM(DP.summa_p_dolg)as summa_p_dolg,';
    query:=query+' SUM(DP.summa_p_pere) as summa_p_pere ,SUM(DP.summa_p_in_saldo) as summa_p_in_saldo,';
    query:=query+' SUM(DP.summa_n_zad) as summa_n_zad ,SUM(DP.summa_f_dolg) as summa_f_dolg,';
    query:=query+' SUM(DP.summa_f_pere) as summa_f_pere ,SUM(DP.summa_f_out_saldo) as summa_f_out_saldo';
    query:=query+' from CN_TMP_REPORT_PAY_DOC_PROV  DP,CN_TMP_REPORT_STUD S where DP.id_session=S.id_session and DP.id_stud=S.id_stud';
    query:=query+' and  DP.ID_SESSION='+IntToStr(ID_SESSION);
    query:=query+' group by DP.smeta_kod,DP.ID_SESSION';

    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    AParameter.Formstyle:=fsMDIChild;
    AParameter.WaitPakageOwner:=self;
    AParameter.Sql_Master:=query;
    AParameter.Sql_Detail:=query;
    AParameter.FieldView:=FieldView;
    AParameter.NotFieldView:=NFieldView;
    AParameter.FieldNameReport:=FieldNameReport;
    AParameter.Type_Report:=0;
    AParameter.LastIgnor:=0;
    AParameter.Report_Name:='SVAnalyzSmeta';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;    
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
  end;


//сводная по ист. финансирования
if Doc_SvSM=1 then
  begin
    FieldView:=VarArrayCreate([0,4],varVariant);
    FieldView[0]:=VarArrayOf(['SMETA_KOD','',1]);
    FieldView[1]:=VarArrayOf(['RZST','',1]);
    FieldView[2]:=VarArrayOf(['SCH_NUMBER_DB','',1]);
    FieldView[3]:=VarArrayOf(['SCH_NUMBER_KD','',1]);
    FieldView[4]:=VarArrayOf(['SUM_PAY','Сумма поступлений',70]);

    sql_master:='smeta_kod||'''+'.'+'''||smeta_title as smeta_kod,razd_kod||'''+'.'+'''||st_kod||'''+'.'+'''||KEKV_KOD as RZST,sch_number_db,sch_number_kd';

    query:='select '+sql_master+' ,sum(summa) as sum_pay,ID_SESSION from CN_TMP_REPORT_PAY_DOC_PROV D ';
    query:=query+' where ID_SESSION='+IntToStr(ID_SESSION);
    query:=query+' group by smeta_kod,smeta_title,razd_kod,st_kod,KEKV_KOD,sch_number_db,sch_number_kd,ID_SESSION';
    query:=query+ ' order by  smeta_kod,smeta_title,razd_kod,st_kod,KEKV_KOD,sch_number_db,sch_number_kd,ID_SESSION';

    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    AParameter.Formstyle:=fsMDIChild;
    AParameter.WaitPakageOwner:=self;
    AParameter.Sql_Master:=query;
    AParameter.Sql_Detail:=query;
    AParameter.FieldView:=FieldView;
    AParameter.NotFieldView:=null;
    AParameter.FieldNameReport:=FieldNameReport;
    AParameter.Type_Report:=1;
    AParameter.LastIgnor:=j-1;
    AParameter.Report_Name:='SVPayDaySM';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;    
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;
  end;

//сводная для ДонГУЭТ
if (Doc_Sv=1) and (IS_DONGUET =1)then
  begin

    FieldView:=VarArrayCreate([0,6],varVariant);
    FieldView[0]:=VarArrayOf(['NAME_OTDEL']);
    FieldView[1]:=VarArrayOf(['NAME_FACULT']);
    FieldView[2]:=VarArrayOf(['NAME_FORM_STUD']);
    FieldView[3]:=VarArrayOf(['EMIT_FACULT']);
    FieldView[4]:=VarArrayOf(['SUM_PAY']);
    FieldView[5]:=VarArrayOf(['NAME_FACULT_EX']);
    FieldView[6]:=VarArrayOf(['NAME_OTDEL_EX']);    

{    sql_master:='SELECT EMIT_FACULT,CN_TMP_REPORT_STUD.NAME_FACULT,CN_TMP_REPORT_STUD.NAME_FACULT as NAME_FACULT_EX,NAME_FORM_STUD,sum(P.summa) as sum_pay,ID_SESSION,OT.NAME_OTDEL,OT.NAME_OTDEL as NAME_OTDEL_EX';
    sql_master:=sql_master+' FROM CN_TMP_REPORT_PAY_DOC_PROV P,CN_TMP_REPORT_STUD S,CN_SP_FACUL,CN_SP_OTDEL OT,CN_SP_FORM_STUD WHERE P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION);
    sql_master:=sql_master+' and CN_TMP_REPORT_STUD.id_fak=CN_SP_FACUL.id_facul and CN_SP_OTDEL.id_otdel=CN_SP_FORM_STUD.id_otdel ';
    sql_master:=sql_master+' and CN_TMP_REPORT_STUD.id_form_stud=CN_SP_FORM_STUD.id_form_stud ';
    sql_master:=sql_master+' and ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog_arhiv+cn_type_dog;
    sql_master:=sql_master+' GROUP BY OT.NAME_OTDEL,EMIT_FACULT,NAME_FACULT,NAME_FORM_STUD,ID_SESSION ';
    sql_master:=sql_master+' ORDER BY OT.NAME_OTDEL,EMIT_FACULT,NAME_FACULT,NAME_FORM_STUD,ID_SESSION';}

    query:='SELECT EMIT_FACULT, S.NAME_FACULT, S.NAME_FACULT as NAME_FACULT_EX, NAME_FORM_STUD, sum(P.summa) as sum_pay, P.ID_SESSION, OT.NAME_OTDEL, OT.NAME_OTDEL as NAME_OTDEL_EX';
    query:=query+' FROM CN_TMP_REPORT_PAY_DOC_PROV P, CN_TMP_REPORT_STUD S, CN_SP_FACUL F, CN_SP_OTDEL OT, CN_SP_FORM_STUD FS WHERE P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION);
    query:=query+' and S.id_fak=F.id_facul and OT.id_otdel=FS.id_otdel ';
    query:=query+' and S.id_form_stud=FS.id_form_stud ';
    query:=query+' and P.ID_SESSION='+IntToStr(ID_SESSION);
    query:=query+' GROUP BY OT.NAME_OTDEL, EMIT_FACULT, NAME_FACULT, NAME_FORM_STUD, P.ID_SESSION ';
    query:=query+' ORDER BY OT.NAME_OTDEL, EMIT_FACULT, NAME_FACULT, NAME_FORM_STUD, P.ID_SESSION';

    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    AParameter.Formstyle:=fsMDIChild;
    AParameter.WaitPakageOwner:=self;
    AParameter.Sql_Master:=query;
    AParameter.Sql_Detail:=query;
    AParameter.FieldView:=FieldView;
    AParameter.NotFieldView:=null;
    AParameter.FieldNameReport:=null;
    AParameter.Type_Report:=1;
    AParameter.LastIgnor:=3;
    AParameter.Report_Name:='SVPayDay_DONGUET';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.is_debug := isdebug;
    
    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;    
  end;

end;

procedure TfrmReportsAnalyzSmeta.ActionParamExecute(Sender: TObject);
begin
  cxButtonFilterClick(self);
end;

procedure TfrmReportsAnalyzSmeta.ActionRunExecute(Sender: TObject);
begin
  cxButtonRun.SetFocus;
  cxButtonRunClick(self);
end;

procedure TfrmReportsAnalyzSmeta.ActionViewExecute(Sender: TObject);
begin
if cxButtonView.Enabled=true then
  begin
    cxButtonViewClick(self);
  end;
end;

procedure TfrmReportsAnalyzSmeta.cxButtonDOCClick(Sender: TObject);
var
  date_beg_sch,date_end_sch,date_doc_reg:TDateTime;
  ID: integer;
  T: TfmGetID;
begin
{
  if IS_DEBUG_MODE then
  begin
   T:=TfmGetID.Create(self);
   T.ShowModal;
   if TryStrToInt(T.cxID.Text, ID) then
    ID_SESSION:=ID;
   T.Free;
   Application.ProcessMessages
  end;
}
  pFIBDataSetToDoc.Active:=False;
  pFIBDataSetToDoc.SQLs.SelectSQL.Text:='select * from CN_TMP_REPORT_DOC_TO_DBF(:ID_SESSION)';
  pFIBDataSetToDoc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
  pFIBDataSetToDoc.Active:=True;

  pFIBDataSetToDoc.FetchAll;
  //начинаем обработку документов
  if pFIBDataSetToDoc.RecordCount>0 then
    begin
      //документ добавляется впервые?
      if VarIsNull(pFIBDataSetToDoc.FieldbyName('OUT_ID_DOC').AsVariant) then
      begin
        Save_doc();
      end
      else
      begin
          if Del_doc(pFIBDataSetToDoc.FieldbyName('OUT_ID_DOC').AsVariant)=1 then
          begin
            Save_doc();
          end
          else
          begin
            showmessage(Cn_uReportsConst.cn_RepStudDOC_Message_Err_del[PLanguageIndex]);
          end
        //проверяем нужно ли сторнировать документ
//        date_doc_reg:=pFIBDataSetToDoc.FieldbyName('OUT_DATE_REG_DOC').AsDateTime;
//        date_beg_sch:=pFIBDataSetToDoc.FieldbyName('OUT_DATE_BEG_SCH').AsDateTime;
//        date_end_sch:=pFIBDataSetToDoc.FieldbyName('OUT_DATE_END_SCH').AsDateTime;
//        if ((date_beg_sch<=date_doc_reg) and (date_end_sch>=date_doc_reg)) then
//          begin
              //сторнировать не нужно
//            if Del_doc(pFIBDataSetToDoc.FieldbyName('OUT_ID_DOC').AsVariant)=1 then
//              begin
//                 Save_doc();
//              end
//              else
//              begin
 //               showmessage(Cn_uReportsConst.cn_RepStudDOC_Message_Err_del[PLanguageIndex]);
//              end
//          end
//          else
//          begin
//            //сторнировать документ
 //         end;
      end
    end
end;

procedure TfrmReportsAnalyzSmeta.Save_doc();
var STRU:KERNEL_MODE_STRUCTURE;
   DoResult:Boolean;
   KEY_SESSION,ID_USER,id_doc:Int64;
   ErrorList:TStringList;
   i:Integer;
   Date_doc_reg:TDateTime;
   err:TfrmErrorDocProv;
begin
/////
           With StoredProc do
              begin
              try
              StoredProcName:='CN_TMP_REPORT_DOC_TO_DBF_SAVE';
              Database:=Database;
              Transaction:=Transaction;
              Transaction.StartTransaction;
              Prepare;
              ParamByName('ID_SESSION').Asint64:=ID_SESSION;

              ExecProc;
              KEY_SESSION:=FieldByName('ID_SESSION_KERNEL').AsInt64;
              id_doc:=FieldByName('ID_DOC').AsInt64;
              Date_doc_reg:=FieldByName('DATE_REG').AsDateTime;
              Transaction.Commit;
            except
              Transaction.Rollback;
              raise;
            end;
            end;



           WriteTransaction.StartTransaction;
           {Список обязательных параметров для выполеннеия добавления документа}
           STRU.KEY_SESSION  := KEY_SESSION;
           STRU.WORKDATE     := Date;
           STRU.DBHANDLE     := DB.Handle;
           STRU.TRHANDLE     := WriteTransaction.Handle;
           STRU.KERNEL_ACTION:= 1;
           STRU.ID_USER      := ID_USER;

           try
               DoResult:=Kernel.KernelDo(@STRU);
           except on E:Exception do
               ShowMessage('Ошибка ядра '+E.Message);
           end;

           if not DoResult
           then begin
                  {Пример получения списка ошибок}
//                ErrorList:=Kernel.GetDocErrorsList(@STRU);
//                if ErrorList<>nil then
//                for i:=0 to  ErrorList.Count-1 do
//                  cxMemoError.Lines.Insert(0,ErrorList.Strings[i]);
                  WriteTransaction.Commit;
                  err:=TfrmErrorDocProv.Create(Self,DB.Handle,KEY_SESSION);
                  err.ShowModal;
                  err.free;                  
           end
           else
           begin
             cxButtonDOC.Enabled:=False;
             showmessage(Cn_uReportsConst.cn_RepStudDOC_Message[PLanguageIndex]);
             //запись реквизитов о документе
             WriteTransaction.Commit;
             With StoredProc do
                begin
                try
                StoredProcName:='CN_TMP_REPORT_DOC_TO_DBF_SAVE_F';
                Database:=Database;
                Transaction:=Transaction;
                Transaction.StartTransaction;
                Prepare;
                ParamByName('DATE_REG_DOC').AsDate:=Date_doc_reg;
                ParamByName('ID_DOC').AsInt64:=id_doc;
                ExecProc;
                Transaction.Commit;
              except
                Transaction.Rollback;
                raise;
              end;
              end;
           end;
/////

end;

function TfrmReportsAnalyzSmeta.Del_doc(id_doc_del:Int64):Integer;
var STRU:KERNEL_MODE_STRUCTURE;
   DoResult:Boolean;
   KEY_SESSION,id_doc,ID_USER:Int64;
   ErrorList:TStringList;
   err:TfrmErrorDocProv;
   i: Integer;
begin
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], 'Видалити попередній документ?', mtConfirmation, [mbYes, mbNo]);

  if i<>6 then
  begin
    Del_doc:=1;
    Exit;
  end;

  {
  With StoredProc do
  begin
      try
      StoredProcName:='CN_TMP_REPORT_DOC_TO_DBF_SAVE';
      Database:=Database;
      Transaction:=Transaction;
      Transaction.StartTransaction;
      Prepare;
      ParamByName('ID_SESSION').Asint64:=ID_SESSION;

      ExecProc;
      KEY_SESSION:=FieldByName('ID_SESSION_KERNEL').AsInt64;
      id_doc:=FieldByName('ID_DOC').AsInt64;
      Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
  end;
  }
   KEY_SESSION := DB.GEN_ID('KERNEL_GEN_ID_SESSION', 1);
   
   Del_doc:=0;
   WriteTransaction.StartTransaction;

   {Обязательно необходимо получить идентификатор сеанса ядра}

   {Список обязательных параметров для выполеннеия добавления документа}
   STRU.KEY_SESSION  := KEY_SESSION;
   STRU.WORKDATE     := Date;
   STRU.DBHANDLE     := DB.Handle;
   STRU.TRHANDLE     := WriteTransaction.Handle;
   STRU.KERNEL_ACTION:= 2;
   STRU.PK_ID        := id_doc_del;
   STRU.ID_USER      := ID_USER;


   try
       DoResult:=Kernel.KernelDo(@STRU);
   except on E:Exception do
       ShowMessage('Ошибка ядра '+E.Message);
   end;

   if not DoResult
   then begin
          {Пример получения списка ошибок}
//          ErrorList:=Kernel.GetDocErrorsList(@STRU);
        WriteTransaction.Commit;
        err:=TfrmErrorDocProv.Create(Self,DB.Handle,KEY_SESSION);
        err.ShowModal;
        err.free;
   end
   else
   begin
     Del_doc:=1;
     WriteTransaction.Commit;
     cxButtonDOC.Enabled:=False;
//     showmessage(Cn_uReportsConst.cn_RepStudDOC_Message[PLanguageIndex]);
   end;


end;

procedure TfrmReportsAnalyzSmeta.ActionDebugExecute(Sender: TObject);
begin
 IS_DEBUG_MODE:=true;
 cxButtonDOC.Enabled:=true;
end;

procedure TfrmReportsAnalyzSmeta.isDebug_actExecute(Sender: TObject);
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
