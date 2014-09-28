unit MainReportPayAnalyz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,cn_Common_Funcs,cn_Common_Types,IBase, FIBDatabase,
  pFIBDatabase, cxControls, cxGroupBox, cxContainer, cxEdit, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxCheckBox, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, ComCtrls, cxRadioGroup,
  cn_Common_Loader, ExtCtrls, RxMemDS, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, Gauges,Cn_uReportsConst, ActnList,
  Clipbrd;

type
  TfrmMainReportPayAnalyz = class(TForm)
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
    cxButtonCancel: TcxButton;
    cxButtonQuit: TcxButton;
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
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    StatusBar1: TStatusBar;
    cxRadioGrouptypeRep: TcxRadioGroup;
    cxButtonView: TcxButton;
    pFIBDataSetPrintSetup: TpFIBDataSet;
    RxMemoryDataPrintSetup: TRxMemoryData;
    DataSourcePrintSetup: TDataSource;
    Timer1: TTimer;
    SelectField: TcxGridDBColumn;
    NameField: TcxGridDBColumn;
    StoredProc: TpFIBStoredProc;
    Gauge1: TGauge;
    pFIBDataSetSetup: TpFIBDataSet;
    ActionList1: TActionList;
    ActionRun: TAction;
    ActionView: TAction;
    ActionParam: TAction;
    pFIBDataSetInitDate: TpFIBDataSet;
    cxCheckBoxNull: TcxCheckBox;
    cxCheckBoxAnalyz: TcxCheckBox;
    cxRadioGroupRepanalyz: TcxRadioGroup;
    ActionDebug: TAction;
    isDebug_act: TAction;
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
    procedure ActionDebugExecute(Sender: TObject);
    procedure isDebug_actExecute(Sender: TObject);
  private
    { Private declarations }
  public
    IS_DEBUG_MODE: Boolean;
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

function ShowReportPayAnalyz(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowReportPayAnalyz;

var
  frmMainReportPayAnalyz: TfrmMainReportPayAnalyz;
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
uses cn_Form_Get_ID_PayAnalyz;

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

  if selectAll.RecordCount<>0 then
    begin
      bar.MaxValue:=selectAll.RecordCount-1;
    end
    else
    begin
      bar.MaxValue:=0;
    end;

  for i:=0 to selectAll.RecordCount-1 do
    begin
       pos:=i;
       Synchronize(UpdateBar);
       With SP do
          begin
          try
//          StoredProcName:='CN_TMP_REPORT_PAY_ANLZ_DOG_INS';
          StoredProcName:=ReportOptions[2][0];
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
var ViewForm:TfrmMainReportPayAnalyz;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmMainReportPayAnalyz) then exit;
 ViewForm := TfrmMainReportPayAnalyz.Create(AParameter.Owner, AParameter.Db_Handle);
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

constructor TfrmMainReportPayAnalyz.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DB.Handle:=DB_Handle;
Screen.Cursor:=crDefault;
end;


procedure TfrmMainReportPayAnalyz.FormCreate(Sender: TObject);
begin
  PLanguageIndex:=                      cn_Common_Funcs.cnLanguageIndex();
  caption:=                             Cn_uReportsConst.cn_RepStudFT[PLanguageIndex];
  caption:=                             'Аналітичний звіт, виконання договорів за навчання';  
  cxGroupBoxPeriodStud.Caption:=        Cn_uReportsConst.cn_RepStudPeriod[PLanguageIndex];
  cxLabelPriodBegin.Caption:=           Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex];
  cxLabelPeriodEnd.Caption:=            Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex];
  cxButtonFilter.Caption:=              Cn_uReportsConst.cn_RepStudFilter[PLanguageIndex];
  cxButtonRun.Caption:=                 Cn_uReportsConst.cn_RepStudRun[PLanguageIndex];
  cxButtonCancel.Caption:=              Cn_uReportsConst.cn_RepStudCancel[PLanguageIndex];
  cxButtonQuit.Caption:=                Cn_uReportsConst.cn_RepStudQuit[PLanguageIndex];

  cxButtonView.Caption:=                Cn_uReportsConst.cn_RepStudView[PLanguageIndex];
  NameField.Caption:=                   Cn_uReportsConst.cn_RepStudSelFiled[PLanguageIndex];
  SelectField.Caption:=                 '';

  cxRadioGrouptypeRep.Properties.Items[0].Caption:='Оборотна відомість';
  cxRadioGrouptypeRep.Properties.Items[1].Caption:='Меморіальній журнал';
  cxRadioGroupRepanalyz.Properties.Items[0].Caption:='Аналітичний звіт (Форма - А3)';
//  cxRadioGrouptypeRep.Properties.Items[0].Caption:=Cn_uReportsConst.cn_RepSV[PLanguageIndex];
//  cxRadioGrouptypeRep.Properties.Items[1].Caption:='Розширений звіт';

  InitForm();
end;


procedure TfrmMainReportPayAnalyz.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMainReportPayAnalyz.cxButtonQuitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMainReportPayAnalyz.cxButtonFilterClick(Sender: TObject);
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

procedure TfrmMainReportPayAnalyz.InitForm();
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


{  DecodeDate(Now,yyyy,mm,dd);
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
    end; }

  DecodeDate(Now,yyyy,mm,dd);
  cxDateEditPeriodBegin.Date:=      EncodeDate(yyyy,mm,01);
  cxDateEditPeriodEnd.Date:=        Date;
  if cn_end_month=1 then
    begin
      cxDateEditPeriodEnd.Date:=    Date-1;
    end;    
  cxButtonView.Enabled:=      false;
  cxButtonCancel.Enabled:=    false;

  pFIBDataSetSetup.Active:=false;
  pFIBDataSetSetup.Active:=true;
  IS_DONGUET:=pFIBDataSetSetup.FieldByName('IS_DONGUET').AsInteger;
end;

procedure TfrmMainReportPayAnalyz.cxButtonRunClick(Sender: TObject);
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
  
  TimeStart:=Now;
  Timer1.Enabled:=true;
  ReportOptions:=VarArrayCreate([0,2],varVariant);
  ReportOptions[0]:=VarArrayOf([cxDateEditPeriodBegin.Date]);
  ReportOptions[1]:=VarArrayOf([cxDateEditPeriodEnd.Date]);

  if cxCheckBoxAnalyz.Checked=true then
    begin
      cxRadioGrouptypeRep.Enabled:=false;
      cxRadioGroupRepanalyz.Enabled:=true;
      ReportOptions[2]:=VarArrayOf(['CN_TMP_REPORT_PAY_ANLZ_DOG_INS'])
    end
    else
    begin
      cxRadioGrouptypeRep.Enabled:=true;
      cxRadioGroupRepanalyz.Enabled:=false;
      ReportOptions[2]:=VarArrayOf(['CN_TMP_REPORT_PAY_MEMORIAL'])
    end;
  report:=ReportTHerited.Create(DB,WriteTransaction,ReadTransaction,
           Gauge1,ID_SESSION,cxButtonRun,cxButtonCancel,cxButtonView,ReportOptions);
end;

procedure TfrmMainReportPayAnalyz.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='Час формування звіту: '+TimeToStr(Now-TimeStart);
  if cxButtonView.Enabled=true then
    begin
      Timer1.Enabled:=false;
      cxButtonFilter.Enabled:=true;
    end;
end;

procedure TfrmMainReportPayAnalyz.FormDestroy(Sender: TObject);
begin
  if report<>nil then
    begin
      report.Terminate;
    end;
  if IS_DEBUG_MODE then exit;
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

procedure TfrmMainReportPayAnalyz.cxButtonViewClick(Sender: TObject);
var
  query,order,sql_master:String;
  i,j,nj:integer;
  Doc_R,Doc_Sv,Doc_Sv_EXT:Integer;
  FieldView,NFieldView,FieldGroup,FieldNameReport:Variant;
  AParameter:TcnSimpleParams;
  cn_type_dog:String;
  ID: integer;
  T: TfmGetID_payAnalyz;
begin
  if IS_DEBUG_MODE then
  begin
   T:=TfmGetID_payAnalyz.Create(self);
   T.ShowModal;
   if TryStrToInt(T.cxID.Text, ID) then ID_SESSION:=ID;
   T.Free;
   cxRadioGrouptypeRep.Enabled:=false;
   cxRadioGroupRepanalyz.Enabled:=true;
   Application.ProcessMessages
  end;

 if cxRadioGrouptypeRep.Enabled=true then
  begin
    if cxRadioGrouptypeRep.ItemIndex=1 then
      begin
        Doc_Sv_EXT:=0;
        Doc_SV:=1;
        Doc_R:=0;
      end
      else
      begin
        Doc_Sv_EXT:=0;
        Doc_SV:=0;
        Doc_R:=1;
      end;
  end
  else
  begin
    Doc_Sv_EXT:=1;
    Doc_SV:=0;
    Doc_R:=0;
  end;

  cn_type_dog:='';
  if cxCheckBoxNull.Checked=false then
  begin
    cn_type_dog:=cn_type_dog+' and ((CN_SUM_P_DOLG<>0) or (CN_SUM_P_PERE<>0) or (CN_SUM_P<>0)';
    cn_type_dog:=cn_type_dog+' or (:CN_SUM_N_PAY<>0)  or (:CN_SUM_N_POG_DOLG<>0) or (:CN_SUM_N_PAY_REPORT<>0)';
    cn_type_dog:=cn_type_dog+' or (:CN_SUM_N_PAY_F<>0)or (:CN_SUM_N_NEEDL<>0)or (:CN_SUM_N_NEED<>0)';
    cn_type_dog:=cn_type_dog+' or (:CN_SUM_P_N_PAY<>0)or (:CN_SUM_F_DOLG<>0) or (:CN_SUM_F_PERE<>0)';
    cn_type_dog:=cn_type_dog+' or (:CN_SUM_F_ZAD<>0))';
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



//составление шапки отчета
FieldNameReport:=VarArrayCreate([0,2],varVariant);
FieldNameReport[0]:=VarArrayOf([cxDateEditPeriodBegin.Date]);
FieldNameReport[1]:=VarArrayOf([cxDateEditPeriodEnd.Date]);

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
        sql_master:='select distinct ISMAINDOG, '+sql_master + 'S.ID_SESSION from CN_TMP_REPORT_PAY P,CN_TMP_REPORT_STUD S where P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog+' order by ISMAINDOG,'+sql_master+' S.ID_SESSION';
      end
      else
      begin
        sql_master:='select distinct ISMAINDOG,S.ID_SESSION from CN_TMP_REPORT_PAY P,CN_TMP_REPORT_STUD S where P.id_session=S.id_session and P.id_stud=S.id_stud S.ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog+' order by ISMAINDOG';
      end;


    query:='select * from CN_TMP_REPORT_PAY P,CN_TMP_REPORT_STUD S where ';
    query:=query+'P.id_session=S.id_session and P.id_stud=S.id_stud and  S.ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog+' and ISMAINDOG=:ISMAINDOG';

    query:=query+' and '+order+' S.ID_SESSION=:ID_SESSION ';
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
    AParameter.Report_Name:='RPAYANALYZ';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;
  end;

//сводная не для ДонГУЭТ расширенная
if (Doc_Sv_EXT=1) {and (IS_DONGUET =0 )}then
  begin
    if (order='') and (Doc_Sv_EXT=1) then
      begin
        messageBox(Handle,'Не виран жоден з параметрів групування',
             'Увага',MB_ICONWARNING or MB_OK);
        Exit;
      end;

    FieldView:=VarArrayCreate([0,j+12],varVariant);
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
    FieldView[j]:=VarArrayOf(['CN_SUM_P_DOLG']);
    FieldView[j+1]:=VarArrayOf(['CN_SUM_P_PERE']);
    FieldView[j+2]:=VarArrayOf(['CN_SUM_P']);
    FieldView[j+3]:=VarArrayOf(['CN_SUM_N_PAY']);
    FieldView[j+4]:=VarArrayOf(['CN_SUM_N_POG_DOLG']);
    FieldView[j+5]:=VarArrayOf(['CN_SUM_N_PAY_REPORT']);
    FieldView[j+6]:=VarArrayOf(['CN_SUM_N_PAY_F']);
    FieldView[j+7]:=VarArrayOf(['CN_SUM_N_NEEDL']);
    FieldView[j+8]:=VarArrayOf(['CN_SUM_N_NEED']);
    FieldView[j+9]:=VarArrayOf(['CN_SUM_P_N_PAY']);
    FieldView[j+10]:=VarArrayOf(['CN_SUM_F_DOLG']);
    FieldView[j+11]:=VarArrayOf(['CN_SUM_F_PERE']);
    FieldView[j+12]:=VarArrayOf(['CN_SUM_F_ZAD']);

    query:='select '+sql_master+'sum(P.CN_SUM_P_DOLG) as CN_SUM_P_DOLG,sum(P.CN_SUM_P_PERE) as CN_SUM_P_PERE,';
    query:=query+' sum(P.CN_SUM_P) as CN_SUM_P,sum(P.CN_SUM_N_PAY) as CN_SUM_N_PAY,';
    query:=query+' sum(P.CN_SUM_N_POG_DOLG) as CN_SUM_N_POG_DOLG,sum(P.CN_SUM_N_PAY_REPORT) as CN_SUM_N_PAY_REPORT,';
    query:=query+' sum(P.CN_SUM_N_PAY_F) as CN_SUM_N_PAY_F,sum(P.CN_SUM_N_NEEDL) as CN_SUM_N_NEEDL,';
    query:=query+' sum(P.CN_SUM_N_NEED) as CN_SUM_N_NEED,sum(P.CN_SUM_P_N_PAY) as CN_SUM_P_N_PAY,';
    query:=query+' sum(P.CN_SUM_F_DOLG) as CN_SUM_F_DOLG,sum(P.CN_SUM_F_PERE) as CN_SUM_F_PERE,';
    query:=query+' sum(P.CN_SUM_F_ZAD) as CN_SUM_F_ZAD, S.id_session';
    query:=query+' from CN_TMP_REPORT_PAY P,CN_TMP_REPORT_STUD S where ';
    query:=query+' P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog;
    query:=query+' group by '+sql_master+' S.ID_SESSION';
    query:=query+' order by '+sql_master+' S.ID_SESSION';

    {Расширенный отчет}
    FieldNameReport[2]:=VarArrayOf(['0']);


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
    AParameter.Report_Name:='SVPAYANALYZ';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;
  end;

//сводная не для ДонГУЭТ короткая
if (Doc_Sv=1) {and (IS_DONGUET =0 )}then
  begin
    if (order='') and (Doc_Sv=1) then
      begin
        messageBox(Handle,'Не виран жоден з параметрів групування',
             'Увага',MB_ICONWARNING or MB_OK);
        Exit;
      end;

    FieldView:=VarArrayCreate([0,j+5],varVariant);
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
{    FieldView[j]:=VarArrayOf(['CN_SUM_P_DOLG']);
    FieldView[j+1]:=VarArrayOf(['CN_SUM_P_PERE']);
    FieldView[j+2]:=VarArrayOf(['CN_SUM_P']);
    FieldView[j+3]:=VarArrayOf(['CN_SUM_N_PAY']);
    FieldView[j+4]:=VarArrayOf(['CN_SUM_N_POG_DOLG']);
    FieldView[j+5]:=VarArrayOf(['CN_SUM_N_PAY_REPORT']);
    FieldView[j+6]:=VarArrayOf(['CN_SUM_N_PAY_F']);
    FieldView[j+7]:=VarArrayOf(['CN_SUM_N_NEEDL']);
    FieldView[j+8]:=VarArrayOf(['CN_SUM_N_NEED']);
    FieldView[j+9]:=VarArrayOf(['CN_SUM_P_N_PAY']);
    FieldView[j+10]:=VarArrayOf(['CN_SUM_F_DOLG']);
    FieldView[j+11]:=VarArrayOf(['CN_SUM_F_PERE']);
    FieldView[j+12]:=VarArrayOf(['CN_SUM_F_ZAD']);}


    FieldView[j]:=VarArrayOf(['CN_SUM_P_DOLG']);
    FieldView[j+1]:=VarArrayOf(['CN_SUM_P_PERE']);
    FieldView[j+2]:=VarArrayOf(['CN_SUM_N_NEED']);
    FieldView[j+3]:=VarArrayOf(['CN_SUM_N_PAY']);
    FieldView[j+4]:=VarArrayOf(['CN_SUM_F_DOLG']);
    FieldView[j+5]:=VarArrayOf(['CN_SUM_F_PERE']);

    query:='select '+sql_master+'sum(P.CN_SUM_P_DOLG) as CN_SUM_P_DOLG,sum(P.CN_SUM_P_PERE) as CN_SUM_P_PERE,';
    query:=query+' sum(P.CN_SUM_P) as CN_SUM_P,sum(P.CN_SUM_N_PAY) as CN_SUM_N_PAY,';
    query:=query+' sum(P.CN_SUM_N_POG_DOLG) as CN_SUM_N_POG_DOLG,sum(P.CN_SUM_N_PAY_REPORT) as CN_SUM_N_PAY_REPORT,';
    query:=query+' sum(P.CN_SUM_N_PAY_F) as CN_SUM_N_PAY_F,sum(P.CN_SUM_N_NEEDL) as CN_SUM_N_NEEDL,';
    query:=query+' sum(P.CN_SUM_N_NEED) as CN_SUM_N_NEED,sum(P.CN_SUM_P_N_PAY) as CN_SUM_P_N_PAY,';
    query:=query+' sum(P.CN_SUM_F_DOLG) as CN_SUM_F_DOLG,sum(P.CN_SUM_F_PERE) as CN_SUM_F_PERE,';
    query:=query+' sum(P.CN_SUM_F_ZAD) as CN_SUM_F_ZAD, S.id_session';
    query:=query+' from CN_TMP_REPORT_PAY P,CN_TMP_REPORT_STUD S where ';
    query:=query+' P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog;
    query:=query+' group by '+sql_master+' S.ID_SESSION';
    query:=query+' order by '+sql_master+' S.ID_SESSION';

    {короткий отчет}
    FieldNameReport[2]:=VarArrayOf(['1']);

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
    AParameter.Report_Name:='SVPAYANALYZ';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;
  end;
//сводная для ДонГУЭТ
{if (Doc_Sv=1) and (IS_DONGUET =1)then
  begin

    FieldView:=VarArrayCreate([0,6],varVariant);
    FieldView[0]:=VarArrayOf(['NAME_OTDEL']);
    FieldView[1]:=VarArrayOf(['NAME_FACULT']);
    FieldView[2]:=VarArrayOf(['NAME_FORM_STUD']);
    FieldView[3]:=VarArrayOf(['EMIT_FACULT']);
    FieldView[4]:=VarArrayOf(['CNT']);
    FieldView[5]:=VarArrayOf(['NAME_FACULT_EX']);
    FieldView[6]:=VarArrayOf(['NAME_OTDEL_EX']);    

    query:='SELECT EMIT_FACULT,CN_TMP_REPORT_STUD.NAME_FACULT,CN_TMP_REPORT_STUD.NAME_FACULT as NAME_FACULT_EX,NAME_FORM_STUD,COUNT (CN_TMP_REPORT_STUD.ID_DOG_ROOT) AS CNT,ID_SESSION,OT.NAME_OTDEL,OT.NAME_OTDEL as NAME_OTDEL_EX';
    query:=query+' FROM CN_TMP_REPORT_STUD,CN_SP_FACUL,CN_SP_OTDEL OT,CN_SP_FORM_STUD WHERE ';
    query:=query+' CN_TMP_REPORT_STUD.id_fak=CN_SP_FACUL.id_facul and CN_SP_OTDEL.id_otdel=CN_SP_FORM_STUD.id_otdel ';
    query:=query+' and CN_TMP_REPORT_STUD.id_form_stud=CN_SP_FORM_STUD.id_form_stud ';
    query:=query+' and ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog_arhiv+cn_type_dog;
    query:=query+' GROUP BY OT.NAME_OTDEL,EMIT_FACULT,NAME_FACULT,NAME_FORM_STUD,ID_SESSION ';
    query:=query+' ORDER BY OT.NAME_OTDEL,EMIT_FACULT,NAME_FACULT,NAME_FORM_STUD,ID_SESSION';

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
    AParameter.Report_Name:='SVCNTDOG_DONGUET';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.is_debug := isdebug;
    
    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;
  end;  }
end;

procedure TfrmMainReportPayAnalyz.ActionParamExecute(Sender: TObject);
begin
  cxButtonFilterClick(self);
end;

procedure TfrmMainReportPayAnalyz.ActionRunExecute(Sender: TObject);
begin
  cxButtonRun.SetFocus;
  cxButtonRunClick(self);
end;

procedure TfrmMainReportPayAnalyz.ActionViewExecute(Sender: TObject);
begin
if cxButtonView.Enabled=true then
  begin
    cxButtonViewClick(self);
  end;
end;

procedure TfrmMainReportPayAnalyz.ActionDebugExecute(Sender: TObject);
begin
 IS_DEBUG_MODE:=true;
 cxButtonView.Enabled:=true;
end;

procedure TfrmMainReportPayAnalyz.isDebug_actExecute(Sender: TObject);
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
