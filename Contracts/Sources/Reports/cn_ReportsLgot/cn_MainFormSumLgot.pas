unit cn_MainFormSumLgot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxCheckBox, Buttons, StdCtrls,
  Gauges, ComCtrls, cxLookAndFeelPainters, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGroupBox, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  FIBQuery, pFIBQuery, pFIBStoredProc, ExtCtrls, RxMemDS, FIBDataSet,
  pFIBDataSet, cxGridTableView, FIBDatabase, pFIBDatabase, cxRadioGroup,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cn_Common_Funcs,cn_Common_Types, IBase,
  cn_Common_Loader, Cn_uReportsConst, ActnList,clipBrd, cnConsts;

type
  TfrmMainFormSumLgot = class(TForm)
    cxGroupBoxPeriodStud: TcxGroupBox;
    cxLabelPriodBegin: TcxLabel;
    cxLabelPeriodEnd: TcxLabel;
    cxDateEditPeriodBegin: TcxDateEdit;
    cxDateEditPeriodEnd: TcxDateEdit;
    cxButtonFilter: TcxButton;
    Gauge1: TGauge;
    cxButtonQuit: TcxButton;
    cxButtonCancel: TcxButton;
    cxButtonRun: TcxButton;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    SelectField: TcxGridDBColumn;
    NameField: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    cxRadioGrouptypeRep: TcxRadioGroup;
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
    StatusBar1: TStatusBar;
    pFIBDataSetSetup: TpFIBDataSet;
    ActionList1: TActionList;
    ActionRun: TAction;
    ActionView: TAction;
    ActionParam: TAction;
    pFIBDataSetInitDate: TpFIBDataSet;
    cxGroupBox2: TcxGroupBox;
    CheckBoxProcent: TCheckBox;
    CheckBoxSum: TCheckBox;
    procedure cxButtonFilterClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonQuitClick(Sender: TObject);
    procedure cxButtonRunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InitForm();
    procedure FormDestroy(Sender: TObject);
    procedure cxButtonViewClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ActionParamExecute(Sender: TObject);
    procedure ActionRunExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure isDebug_actExecute(Sender: TObject);
    procedure cxDateEditPeriodBeginPropertiesChange(Sender: TObject);
    procedure cxDateEditPeriodEndPropertiesChange(Sender: TObject);
  private
    cn_max_date_end : TDate;
  public
    { Public declarations }
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


function ShowReportSumLgot(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowReportSumLgot;

var
  frmMainFormSumLgot: TfrmMainFormSumLgot;
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

  pos:=0;
  Synchronize(UpdateBar);

  SP:=TpFIBStoredProc.Create(nil);
  SP.Transaction:=Transaction;
  SP.Database:=DataBase;
  Transaction.StartTransaction;
  SP.StoredProcName:='CN_TMP_REPORT_STUD_SELECT';
  SP.Prepare;
  SP.ParamByName('ID_SESSION').asInt64     := ID_SESSION;
  SP.ParamByName('IN_DATE_BEG').AsDateTime := StrToDate('01.01.1900'); //VarToDateTime(ReportOptions[0][0]);
  SP.ParamByName('IN_DATE_END').AsDateTime := StrToDate('31.12.9999'); //VarToDateTime(ReportOptions[1][0]);
  SP.ExecProc;
  try
   Transaction.Commit;
  except
    begin
      Transaction.Rollback;
      messageBox(0,PChar('Ошибка при выполнении процедуры CN_TMP_REPORT_STUD_SELECT'),'Ошибка!!!',MB_OK);
      Exit;
    end;
  end;
//начинаем рассчет сумм, блин как же это долго
  selectAll:=TpFIBDataSet.create(nil);
  selectAll.Database:=DataBase;
  selectAll.Transaction:=ReadTransaction;
  selectAll.SQLs.SelectSQL.Add('select ID_STUD  from CN_TMP_REPORT_STUD where id_session=:pid_session');
  selectAll.ParamByName('pid_session').AsInt64 := ID_SESSION;
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
          StoredProcName:='CN_TMP_REPORT_LGOT';
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
          MessageBox(Application.MainForm.Handle,PChar('Ошибка расчета при формирование отчета!'+#13+' Прцедура CN_TMP_REPORT_LGOT'+#13+SelectAll.FieldByName('FIO').AsString),'Внимание!',MB_ICONWARNING or MB_OK);
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

function ShowReportSumLgot(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmMainFormSumLgot;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmMainFormSumLgot) then exit;
 ViewForm := TfrmMainFormSumLgot.Create(AParameter.Owner, AParameter.Db_Handle);
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


procedure TfrmMainFormSumLgot.FormCreate(Sender: TObject);
begin
  PLanguageIndex := cn_Common_Funcs.cnLanguageIndex();

  caption                      := Cn_uReportsConst.cn_RepDocProv[PLanguageIndex];
  cxGroupBoxPeriodStud.Caption := Cn_uReportsConst.cn_RepDatePayNeed[PLanguageIndex];
  cxLabelPriodBegin.Caption    := Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex];
  cxLabelPeriodEnd.Caption     := Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex];
  cxButtonFilter.Caption       := Cn_uReportsConst.cn_RepStudFilter[PLanguageIndex];
  cxButtonRun.Caption          := Cn_uReportsConst.cn_RepStudRun[PLanguageIndex];
  cxButtonCancel.Caption       := Cn_uReportsConst.cn_RepStudCancel[PLanguageIndex];
  cxButtonQuit.Caption         := Cn_uReportsConst.cn_RepStudQuit[PLanguageIndex];
  cxButtonView.Caption         := Cn_uReportsConst.cn_RepStudView[PLanguageIndex];
  NameField.Caption            := Cn_uReportsConst.cn_RepStudSelFiled[PLanguageIndex];
  SelectField.Caption          := '';
  CheckBoxProcent.Caption      := cn_Persent_Column[PLanguageIndex];
  CheckBoxSum.Caption          := cn_Summa_Column[PLanguageIndex];

  cxRadioGrouptypeRep.Properties.Items[0].Caption:=Cn_uReportsConst.cn_RepRestr[PLanguageIndex];
  cxRadioGrouptypeRep.Properties.Items[1].Caption:=Cn_uReportsConst.cn_RepSV[PLanguageIndex];

  InitForm();
end;


constructor TfrmMainFormSumLgot.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DB.Handle:=DB_Handle;
Screen.Cursor:=crDefault;
end;

procedure TfrmMainFormSumLgot.cxButtonFilterClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  cxButtonView.Enabled := False;
  Gauge1.Progress := 0; 
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

procedure TfrmMainFormSumLgot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMainFormSumLgot.cxButtonQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainFormSumLgot.cxButtonRunClick(Sender: TObject);
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


procedure TfrmMainFormSumLgot.InitForm();
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
 cn_date_start   := pFIBDataSetInitDate.FieldByName('cn_date_start').AsDateTime;
 cn_end_month    := pFIBDataSetInitDate.FieldByName('cn_end_month').AsInteger;
 if pFIBDataSetInitDate.FieldByName('cn_max_sys_timestamp').AsDateTime <> null
  then cn_max_date_end := pFIBDataSetInitDate.FieldByName('cn_max_sys_timestamp').AsDateTime
  else cn_max_date_end := StrToDate('01.01.3050');


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

procedure TfrmMainFormSumLgot.FormDestroy(Sender: TObject);
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

procedure TfrmMainFormSumLgot.cxButtonViewClick(Sender: TObject);
var
  query,sql_master,sql_master_add,order,text_sum_select,text_sum_where:String;
  i,j,nj,SumC:integer;
  Doc_R,Doc_Sv,Doc_R_Order:Integer;
  FieldView,NFieldView,FieldGroup,FieldSum,FieldNameReport:Variant;
  type_report:String;
  AParameter:TcnSimpleParams;
  CheckSumProcSQL : string;
begin
  CheckSumProcSQL := '';
  if ((not CheckBoxProcent.Checked) and (not CheckBoxSum.Checked)) then
   begin
    CheckBoxProcent.Checked := True;
    CheckBoxSum.Checked     := True;
   end;

  if cxRadioGrouptypeRep.ItemIndex=0 then
   begin
    Doc_SV:=0;
    Doc_R:=1;
    Doc_R_Order:=0;
   end;
  if cxRadioGrouptypeRep.ItemIndex=1 then
   begin
    Doc_SV:=1;
    Doc_R:=0;
    Doc_R_Order:=0;
   end;
  if cxRadioGrouptypeRep.ItemIndex=2 then
   begin
    Doc_SV:=0;
    Doc_R:=0;
    Doc_R_Order:=1;
   end;

   j:=0;
   RxMemoryDataPrintSetup.First;
   order:='';
   sql_master_add:='';
   for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
    begin
     if RxMemoryDataPrintSetup.FieldByName('RxSelectField').AsInteger=1 then
       begin
        if RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString<>'' then
         begin
          inc(j);
          sql_master_add:=sql_master_add+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+',';
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

    if ((not CheckBoxProcent.Checked) or (not CheckBoxSum.Checked)) then
     if CheckBoxProcent.Checked
      then CheckSumProcSQL := ' and l.persent <> 0'
      else CheckSumProcSQL := ' and l.summa <> 0';

    //создаем мастер запрос
    if j>0
     then sql_master:='select distinct ISMAINDOG,' + sql_master_add + 'S.ID_SESSION '
     else sql_master:='select distinct ISMAINDOG, S.ID_SESSION ';

    sql_master:= sql_master + 'from CN_TMP_REPORT_PAY P join CN_TMP_REPORT_STUD S on P.id_stud = S.id_stud join CN_DT_LGOT L on L.id_stud = p.id_stud ';
    sql_master:= sql_master + 'where P.id_session = '+IntToStr(ID_SESSION) +' and S.ID_SESSION='+IntToStr(ID_SESSION);
    //sql_master:= sql_master +' and ((l.date_beg between '''+ DateToStr(cxDateEditPeriodBegin.EditValue) + ''' and ''' + DateToStr(cxDateEditPeriodEnd.EditValue) + ''')';
    //sql_master:= sql_master +'  or (l.date_end between '''+ DateToStr(cxDateEditPeriodBegin.EditValue) + ''' and ''' + DateToStr(cxDateEditPeriodEnd.EditValue) + '''))';
    sql_master:= sql_master +' and l.use_end = ''' + DateToStr(cn_max_date_end) + '''';
    sql_master:= sql_master + CheckSumProcSQL;

    if j>0 then sql_master:= sql_master +' order by '+sql_master_add+' S.ID_SESSION';


    //query := 'select * from CN_TMP_REPORT_STUD S';
    query := 'select distinct * from CN_TMP_REPORT_PAY P join CN_TMP_REPORT_STUD S on P.id_stud = S.id_stud join CN_DT_LGOT L on L.id_stud = p.id_stud ';
    query := query + 'where P.id_session = '+IntToStr(ID_SESSION) +' and S.ID_SESSION='+IntToStr(ID_SESSION);
    query := query + ' and ((l.date_beg between '''+ DateToStr(cxDateEditPeriodBegin.EditValue) + ''' and ''' + DateToStr(cxDateEditPeriodEnd.EditValue) + ''')';
    query := query + '  or (l.date_end between '''+ DateToStr(cxDateEditPeriodBegin.EditValue) + ''' and ''' + DateToStr(cxDateEditPeriodEnd.EditValue) + '''))';
    query := query + 'and l.use_end = ''' + DateToStr(cn_max_date_end) + ''' and ' + order + ' S.ID_SESSION=:ID_SESSION ';
    query := query + CheckSumProcSQL;
    query := query + ' ORDER BY FIO collate win1251_ua';

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
    AParameter.Report_Name:='RSUMLGOT';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.ID_SESSION:=ID_SESSION;
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

    FieldView:=VarArrayCreate([0,j+1],varVariant);
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
    FieldView[j]:=VarArrayOf(['CNT']);
    FieldView[j+1]:=VarArrayOf(['SUM_LGOT']);


    //для переплаты -1
    query:='select '+sql_master_add+'sum(P.sum_lgot) as sum_lgot,count(S.ID_STUD) as CNT,S.id_session from CN_TMP_REPORT_PAY P,CN_TMP_REPORT_STUD S where ';
    query:=query+' P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION);
    query:=query+' group by '+sql_master_add+'S.ID_SESSION';
    query:=query+ ' order by '+sql_master_add+'S.ID_SESSION';

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
    AParameter.Type_Report:=1;
    AParameter.LastIgnor:=j-1;
    AParameter.Report_Name:='SVSUMLGOT';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.ID_SESSION:=ID_SESSION;
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;
   end;

end;

procedure TfrmMainFormSumLgot.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='Час формування звіту: '+TimeToStr(Now-TimeStart);
  if cxButtonView.Enabled=true then
    begin
      Timer1.Enabled:=false;
      cxButtonFilter.Enabled:=true;
    end;
end;

procedure TfrmMainFormSumLgot.ActionParamExecute(Sender: TObject);
begin
  cxButtonFilterClick(self);
end;

procedure TfrmMainFormSumLgot.ActionRunExecute(Sender: TObject);
begin
  cxButtonRun.SetFocus;
  cxButtonRunClick(self);
end;

procedure TfrmMainFormSumLgot.ActionViewExecute(Sender: TObject);
begin
if cxButtonView.Enabled=true then
  begin
    cxButtonViewClick(self);
  end;
end;

procedure TfrmMainFormSumLgot.isDebug_actExecute(Sender: TObject);
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

procedure TfrmMainFormSumLgot.cxDateEditPeriodBeginPropertiesChange(
  Sender: TObject);
begin
  cxButtonView.Enabled := False;
  Gauge1.Progress := 0;
end;

procedure TfrmMainFormSumLgot.cxDateEditPeriodEndPropertiesChange(
  Sender: TObject);
begin
  cxButtonView.Enabled := False;
  Gauge1.Progress := 0;
end;

end.
