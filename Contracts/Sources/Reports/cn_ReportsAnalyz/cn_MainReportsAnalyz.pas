unit cn_MainReportsAnalyz;

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
  cxCalendar, cxGroupBox, Gauges, IBase,cn_Common_Funcs,cn_Common_Types,
  Cn_uReportsConst,cn_Common_Loader, ActnList,clipBrd;

type
  TfrmMainReportsAnalyz = class(TForm)
    Gauge1: TGauge;
    cxGroupBoxPeriodStud: TcxGroupBox;
    cxDateEditPeriodBegin: TcxDateEdit;
    cxButtonFilter: TcxButton;
    cxButtonRun: TcxButton;
    cxButtonCancel: TcxButton;
    cxButtonQuit: TcxButton;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    SelectField: TcxGridDBColumn;
    NameField: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    StatusBar1: TStatusBar;
    cxRadioGrouptypeRep: TcxRadioGroup;
    cxButtonView: TcxButton;
    cxGroupBox2: TcxGroupBox;
    CheckBoxOverPay: TCheckBox;
    CheckBoxPay: TCheckBox;
    CheckBoxZad: TCheckBox;
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
    GroupBox1: TGroupBox;
    cxDateEditPeriodEnd: TcxDateEdit;
    CheckBoxAll: TCheckBox;
    ActionList1: TActionList;
    ActionRun: TAction;
    ActionView: TAction;
    ActionParam: TAction;
    pFIBDataSetInitDate: TpFIBDataSet;
    isDebug_act: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonQuitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure InitForm();
    procedure Timer1Timer(Sender: TObject);
    procedure cxButtonRunClick(Sender: TObject);
    procedure cxButtonFilterClick(Sender: TObject);
    procedure cxButtonViewClick(Sender: TObject);
    procedure CheckBoxAllClick(Sender: TObject);
    procedure ActionParamExecute(Sender: TObject);
    procedure ActionRunExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure isDebug_actExecute(Sender: TObject);
  private
     constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
    { Private declarations }
  public
    isDebug : Boolean;
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

function ShowReportPayAnalyz(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowReportPayAnalyz;

var
  frmMainReportsAnalyz: TfrmMainReportsAnalyz;
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
  str_error:String;
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
  SP.ParamByName('IN_DATE_BEG').AsDateTime:=StrToDate('01.01.1900');
  SP.ParamByName('IN_DATE_END').AsDateTime:=StrToDate('31.12.9999');
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
          StoredProcName:='CN_TMP_REPORT_PAY_ANALYZ_INSERT';
          Database:=Database;
          Transaction:=Transaction;
          Transaction.StartTransaction;
          Prepare;
          ParamByName('ID_STUD').Asint64:=SelectAll.FieldByName('ID_STUD').AsVariant;
          ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
          ParamByName('DATE_CHECK').AsDate:=VarToDateTime(ReportOptions[0][0]);
          ParamByName('END_DATE_CHECK').AsDate:=VarToDateTime(ReportOptions[1][0]);
          ExecProc;
          Transaction.Commit;
        except
          MessageBox(Application.MainForm.Handle,PChar('Ошибка расчета при формирование отчета!'+#13+' Прцедура CN_TMP_REPORT_PAY_ANALYZ_INSERT'+#13+SelectAll.FieldByName('FIO').AsString),'Внимание!',MB_ICONWARNING or MB_OK);
          Clipboard.AsText:=SelectAll.FieldByName('ID_STUD').AsVariant;
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

function ShowReportPayAnalyz(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmMainReportsAnalyz;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmMainReportsAnalyz) then exit;
 ViewForm := TfrmMainReportsAnalyz.Create(AParameter.Owner, AParameter.Db_Handle);
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

constructor TfrmMainReportsAnalyz.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DB.Handle:=DB_Handle;
Screen.Cursor:=crDefault;
end;

procedure TfrmMainReportsAnalyz.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMainReportsAnalyz.cxButtonQuitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMainReportsAnalyz.FormCreate(Sender: TObject);
begin
  PLanguageIndex:=                      cn_Common_Funcs.cnLanguageIndex();
//  caption:=                             Cn_uReportsConst.cn_RepStudPayFT[PLanguageIndex];
  caption:=                             'Реєстр\Аналітичний звіт по сплаті за навчання';
  cxGroupBoxPeriodStud.Caption:=        Cn_uReportsConst.cn_RepDatePayNeed[PLanguageIndex];
  cxButtonFilter.Caption:=              Cn_uReportsConst.cn_RepStudFilter[PLanguageIndex];
  cxButtonRun.Caption:=                 Cn_uReportsConst.cn_RepStudRun[PLanguageIndex];
  cxButtonCancel.Caption:=              Cn_uReportsConst.cn_RepStudCancel[PLanguageIndex];
  cxButtonQuit.Caption:=                Cn_uReportsConst.cn_RepStudQuit[PLanguageIndex];
  cxButtonView.Caption:=                Cn_uReportsConst.cn_RepStudView[PLanguageIndex];
  NameField.Caption:=                   Cn_uReportsConst.cn_RepStudSelFiled[PLanguageIndex];
  SelectField.Caption:=                 '';

  cxRadioGrouptypeRep.Properties.Items[0].Caption:=Cn_uReportsConst.cn_RepRestr[PLanguageIndex];
  cxRadioGrouptypeRep.Properties.Items[1].Caption:=Cn_uReportsConst.cn_RepSV[PLanguageIndex];

  CheckBoxZad.Caption := Cn_uReportsConst.cn_RepFormZad[PLanguageIndex];
  CheckBoxPay.Caption := Cn_uReportsConst.cn_RepFormToch[PLanguageIndex];
  CheckBoxOverPay.Caption := Cn_uReportsConst.cn_RepFormPere[PLanguageIndex];
  CheckBoxAll.Caption:=    Cn_uReportsConst.cn_RepRAnalyzAll[PLanguageIndex];
  InitForm();
end;

procedure TfrmMainReportsAnalyz.FormDestroy(Sender: TObject);
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

procedure TfrmMainReportsAnalyz.InitForm();
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
  cxDateEditPeriodBegin.Date:=      EncodeDate(yyyy,mm,01);
  if mm<12 then
    begin
      cxDateEditPeriodEnd.Date:=      EncodeDate(yyyy,mm+1,01);
      if cn_end_month=1 then
        begin
          cxDateEditPeriodEnd.Date:=cxDateEditPeriodEnd.Date-1;
        end;
    end
    else
    begin
      cxDateEditPeriodEnd.Date:=      EncodeDate(yyyy+1,01,01);
      if cn_end_month=1 then
        begin
          cxDateEditPeriodEnd.Date:=cxDateEditPeriodEnd.Date-1;
        end;      
    end;

  cxButtonView.Enabled:=      false;
  cxButtonCancel.Enabled:=    false;

  pFIBDataSetSetup.Active:=false;
  pFIBDataSetSetup.Active:=true;
  IS_DONGUET:=pFIBDataSetSetup.FieldByName('IS_DONGUET').AsInteger;  
end;


procedure TfrmMainReportsAnalyz.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='Час формування звіту: '+TimeToStr(Now-TimeStart);
  if cxButtonView.Enabled=true then
    begin
      Timer1.Enabled:=false;
      cxButtonFilter.Enabled:=true;
    end;
end;

procedure TfrmMainReportsAnalyz.cxButtonRunClick(Sender: TObject);
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

 TimeStart:=Now;
 Timer1.Enabled:=true;
 ReportOptions:=VarArrayCreate([0,1],varVariant);
 ReportOptions[0]:=VarArrayOf([cxDateEditPeriodBegin.Date]);
 ReportOptions[1]:=VarArrayOf([cxDateEditPeriodEnd.Date]);
 report:=ReportTHerited.Create(DB,WriteTransaction,ReadTransaction,
          Gauge1,ID_SESSION,cxButtonRun,cxButtonCancel,cxButtonView,ReportOptions);
end;

procedure TfrmMainReportsAnalyz.cxButtonFilterClick(Sender: TObject);
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

procedure TfrmMainReportsAnalyz.cxButtonViewClick(Sender: TObject);
var
  query,order,sql_master,text_sum_select,text_sum_where,type_report:String;
  i,j,nj,SumC:integer;
  Doc_R,Doc_Sv:Integer;
  FieldView,NFieldView,FieldGroup,FieldNameReport:Variant;
  AParameter:TcnSimpleParams;
  query_zad,query_pere:String;
begin
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

SumC:=0;
if CheckBoxZad.Checked=true then
  begin
    Inc(SumC);
  end;
if CheckBoxPay.Checked=true then
  begin
    Inc(SumC);
  end;
if CheckBoxOverPay.Checked=true then
  begin
    Inc(SumC);
  end;
if (SumC=0) and (CheckBoxAll.Checked=false) then
  begin
    messageBox(Handle,PChar(Cn_uReportsConst.Studcity_MESSAGE_NO_CHOOSE_SUMMA[PLanguageIndex]),
         PChar(Cn_uReportsConst.Studcity_MESSAGE_WARNING_CONST[PLanguageIndex]),MB_ICONWARNING or MB_OK);
    Exit;
  end;



type_report := '';

text_sum_select := 'TYPE_PAY';
text_sum_where := 'TYPE_PAY=:TYPE_PAY';

if CheckBoxZad.Checked=true then
  begin
    type_report := type_report+' ( SUM_OVERPAY<0';

  end;
if CheckBoxPay.Checked=true then
  begin
    if (type_report = '') then
      begin
        type_report := '( ';
      end
      else
      begin
        type_report := type_report+' or ';
      end;
    type_report := type_report+'SUM_OVERPAY=0';
  end;
if CheckBoxOverPay.Checked=true then
  begin
    if (type_report='') then
      begin
        type_report := type_report+'(  ';
      end
      else
      begin
        type_report := type_report+' or ';
      end;
    type_report := type_report+'SUM_OVERPAY>0';
  end;
type_report:=type_report+')';

if CheckBoxAll.Checked = true then
  begin
    type_report := ' ( SUM_OVERPAY<0 or  SUM_OVERPAY=0 or SUM_OVERPAY>0) ';
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
    RxMemoryDataPrintSetup.First;
    if j>=0 then
      begin
        FieldGroup:=VarArrayCreate([0,j-1],varVariant);
        NFieldView:=VarArrayCreate([0,RxMemoryDataPrintSetup.RecordCount-j-1],varVariant);
        j:=0;
        nj:=0;
        for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
          begin
          if RxMemoryDataPrintSetup.FieldByName('RxSelectField').AsInteger=1 then
              begin
                if RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString<>'' then
                  begin
                    FieldGroup[j]:=VarArrayOf([RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString,''{RxMemoryDataPrintSetup.FieldByName('RxNameField').AsString},RxMemoryDataPrintSetup.FieldByName('RxLenghtField').AsInteger]);
                    inc(j);
                  end;
              end
              else
              begin
                NFieldView[nj]:=VarArrayOf([RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString,''{RxMemoryDataPrintSetup.FieldByName('RxNameField').AsString},RxMemoryDataPrintSetup.FieldByName('RxLenghtField').AsInteger]);
                inc(nj);
              end;
            RxMemoryDataPrintSetup.Next;
          end;
      end;
    //создаем мастер запрос
    if j>0 then
      begin
        sql_master:='select distinct '+sql_master + 'S.ID_SESSION from CN_TMP_REPORT_PAY P,CN_TMP_REPORT_STUD S where P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION)+' and '+type_report+' order by ISMAINDOG,'+sql_master+' S.ID_SESSION';
      end
      else
      begin
        sql_master:='select distinct S.ID_SESSION from CN_TMP_REPORT_PAY P,CN_TMP_REPORT_STUD S where P.id_session=S.id_session and P.id_stud=S.id_stud S.ID_SESSION='+IntToStr(ID_SESSION)+' and '+type_report+' order by ISMAINDOG';
      end;


    query:='select * from CN_TMP_REPORT_PAY P,CN_TMP_REPORT_STUD S where ';
    query:=query+'P.id_session=S.id_session and P.id_stud=S.id_stud and  S.ID_SESSION='+IntToStr(ID_SESSION);
    query:=query+' and '+order+' S.ID_SESSION=:ID_SESSION and '+type_report;
    query:=query+' ORDER BY FIO collate win1251_ua';

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
    AParameter.Type_Report:=0;
    AParameter.LastIgnor:=0;
    AParameter.Report_Name:='RSUMPAY_ANALYZ';

    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;
  end;
//сводная не для ДонГУЭТ
if (Doc_Sv=1) and (IS_DONGUET =0 )then
  begin
    if (order='') and (Doc_Sv=1) then
      begin
        messageBox(Handle,'Не виран жоден з параметрів групування',
             'Увага',MB_ICONWARNING or MB_OK);
        Exit;
      end;

    FieldView:=VarArrayCreate([0,j+3],varVariant);
    nj:=RxMemoryDataPrintSetup.RecordCount-j-1;
    NFieldView:=VarArrayCreate([0,nj],varVariant);
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
    FieldView[j]:=VarArrayOf(['SUM_IN_SALDO']);
    FieldView[j+1]:=VarArrayOf(['SUM_NEED']);
    FieldView[j+2]:=VarArrayOf(['SUM_PAY']);
    FieldView[j+3]:=VarArrayOf(['SUM_OUT_SALDO']);

    //для переплаты -1

    query_pere:='select '+sql_master+'sum(P.sum_in_saldo) as sum_in_saldo,sum(P.sum_need) as sum_need,sum(P.sum_pay) as sum_pay,sum(P.sum_out_saldo) as sum_out_saldo,S.id_session from CN_TMP_REPORT_PAY P,CN_TMP_REPORT_STUD S where ';
    query_pere:=query_pere+'P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION);
    query_pere:=query_pere+' and '+type_report;
    query_pere:=query_pere+' group by '+sql_master+'S.ID_SESSION';
    query_pere:=query_pere+ ' order by '+sql_master+'S.ID_SESSION';
{    //для задолженности 1
    query_zad:='select '+sql_master+'sum(P.sum_need) as sum_need,sum(P.sum_pay) as sum_pay,sum(P.sum_overpay) as sum_overpay,S.id_session,P.TYPE_PAY from CN_TMP_REPORT_PAY P,CN_TMP_REPORT_STUD S where ';
    query_zad:=query_zad+'P.id_session=S.id_session and P.id_stud=S.id_stud and P.sum_overpay<>0 and P.TYPE_PAY=1 and S.ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog+cn_type_dog_arhiv;
    query_zad:=query_zad+' and '+type_report;
    query_zad:=query_zad+' group by P.TYPE_PAY,'+sql_master+'S.ID_SESSION';
    query_zad:=query_zad+ ' order by P.TYPE_PAY,'+sql_master+'S.ID_SESSION';}


    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    AParameter.Formstyle:=fsMDIChild;
    AParameter.WaitPakageOwner:=self;
    AParameter.Sql_Master:=query_pere;
    AParameter.Sql_Detail:=query_pere;
    AParameter.FieldView:=FieldView;
    AParameter.NotFieldView:=NFieldView;
    AParameter.FieldNameReport:=FieldNameReport;
    AParameter.Type_Report:=1;
    AParameter.LastIgnor:=j-1;
    AParameter.Report_Name:='SVSUMPAY_ANALYZ';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.ID_SESSION:=ID_SESSION;
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;
  end;
//сводная для ДонГУЭТ
if (Doc_Sv=1) and (IS_DONGUET =1)then
  begin

    FieldView:=VarArrayCreate([0,9],varVariant);
    FieldView[0]:=VarArrayOf(['NAME_OTDEL']);
    FieldView[1]:=VarArrayOf(['NAME_FACULT']);
    FieldView[2]:=VarArrayOf(['NAME_FORM_STUD']);
    FieldView[3]:=VarArrayOf(['EMIT_FACULT']);
    FieldView[4]:=VarArrayOf(['SUM_IN_SALDO']);
    FieldView[5]:=VarArrayOf(['SUM_NEED']);
    FieldView[6]:=VarArrayOf(['SUM_PAY']);
    FieldView[7]:=VarArrayOf(['SUM_OUT_SALDO']);
    FieldView[8]:=VarArrayOf(['NAME_FACULT_EX']);
    FieldView[9]:=VarArrayOf(['NAME_OTDEL_EX']);

    //для переплаты -1

    query_pere:='select EMIT_FACULT, S.NAME_FACULT, S.NAME_FACULT as NAME_FACULT_EX, NAME_FORM_STUD, OT.NAME_OTDEL, OT.NAME_OTDEL as NAME_OTDEL_EX ,';
    query_pere:=query_pere+'sum(P.sum_in_saldo) as sum_in_saldo, sum(P.sum_need) as sum_need, sum(P.sum_pay) as sum_pay, sum(P.sum_out_saldo) as sum_out_saldo, S.id_session ';
    query_pere:=query_pere+' from CN_TMP_REPORT_PAY P, CN_TMP_REPORT_STUD S, CN_SP_FACUL SF, CN_SP_OTDEL OT, CN_SP_FORM_STUD FS where ';
    query_pere:=query_pere+'P.id_session=S.id_session and P.id_stud=S.id_stud';
    query_pere:=query_pere+' and S.id_fak=SF.id_facul and OT.id_otdel=FS.id_otdel ';
    query_pere:=query_pere+' and S.id_form_stud=FS.id_form_stud ';
    query_pere:=query_pere+'and S.ID_SESSION='+IntToStr(ID_SESSION);
    query_pere:=query_pere+' and '+type_report;
    query_pere:=query_pere+' group by EMIT_FACULT, OT.NAME_OTDEL, NAME_FACULT, NAME_FORM_STUD, S.ID_SESSION';
    query_pere:=query_pere+ ' order by EMIT_FACULT, OT.NAME_OTDEL, NAME_FACULT, NAME_FORM_STUD, S.ID_SESSION';
    //для задолженности 1
{    query_zad:='select EMIT_FACULT,CN_TMP_REPORT_STUD.NAME_FACULT,CN_TMP_REPORT_STUD.NAME_FACULT as NAME_FACULT_EX,NAME_FORM_STUD,OT.NAME_OTDEL,OT.NAME_OTDEL as NAME_OTDEL_EX,';
    query_zad:=query_zad+' sum(P.sum_need) as sum_need,sum(P.sum_pay) as sum_pay,sum(P.sum_overpay) as sum_overpay,S.id_session,P.TYPE_PAY ';
    query_zad:=query_zad+' from CN_TMP_REPORT_PAY P,CN_TMP_REPORT_STUD S,CN_SP_FACUL,CN_SP_OTDEL OT,CN_SP_FORM_STUD where ';
    query_zad:=query_zad+'P.id_session=S.id_session and P.id_stud=S.id_stud and P.sum_overpay<>0 and P.TYPE_PAY=1 ';
    query_zad:=query_zad+' and CN_TMP_REPORT_STUD.id_fak=CN_SP_FACUL.id_facul and CN_SP_OTDEL.id_otdel=CN_SP_FORM_STUD.id_otdel ';
    query_zad:=query_zad+' and CN_TMP_REPORT_STUD.id_form_stud=CN_SP_FORM_STUD.id_form_stud ';
    query_zad:=query_zad+'and S.ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog+cn_type_dog_arhiv;
    query_zad:=query_zad+' and '+type_report;
    query_zad:=query_zad+' group by P.TYPE_PAY,EMIT_FACULT,OT.NAME_OTDEL,NAME_FACULT,NAME_FORM_STUD,S.ID_SESSION';
    query_zad:=query_zad+ ' order by P.TYPE_PAY,EMIT_FACULT,OT.NAME_OTDEL,NAME_FACULT,NAME_FORM_STUD,S.ID_SESSION';   }

    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    AParameter.Formstyle:=fsMDIChild;
    AParameter.WaitPakageOwner:=self;
    AParameter.Sql_Master:=query_pere;
    AParameter.Sql_Detail:=query_pere;
    AParameter.FieldView:=FieldView;
    AParameter.NotFieldView:=null;
    AParameter.FieldNameReport:=null;
    AParameter.Type_Report:=1;
    AParameter.LastIgnor:=3;
    AParameter.Report_Name:='SVSUMPAY_ANALYZ_DONGUET';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.ID_SESSION:=ID_SESSION;
    AParameter.is_debug := isdebug;
    
    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;                  
  end;
end;

procedure TfrmMainReportsAnalyz.CheckBoxAllClick(Sender: TObject);
begin
  if CheckBoxAll.Checked=false then
    begin
      CheckBoxZad.Enabled:=true;
      CheckBoxPay.Enabled:=true;
      CheckBoxOverPay.Enabled:=true;
    end
    else
    begin
      CheckBoxZad.Enabled:=false;
      CheckBoxPay.Enabled:=false;
      CheckBoxOverPay.Enabled:=false;
    end;
end;

procedure TfrmMainReportsAnalyz.ActionParamExecute(Sender: TObject);
begin
  cxButtonFilterClick(self);
end;

procedure TfrmMainReportsAnalyz.ActionRunExecute(Sender: TObject);
begin
  cxButtonRun.SetFocus;
  cxButtonRunClick(self);
end;

procedure TfrmMainReportsAnalyz.ActionViewExecute(Sender: TObject);
begin
if cxButtonView.Enabled=true then
  begin
    cxButtonViewClick(self);
  end;
end;

procedure TfrmMainReportsAnalyz.isDebug_actExecute(Sender: TObject);
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
