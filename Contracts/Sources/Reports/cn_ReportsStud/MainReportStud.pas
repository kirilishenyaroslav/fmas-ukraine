unit MainReportStud;

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
  cn_Common_Messages, cnConsts_Messages, ShellAPI;

type
  TfrmMainReportStud = class(TForm)
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
    cxButtonCancel: TcxButton;
    pFIBDataSetInitDate: TpFIBDataSet;
    isDebug_act: TAction;
    Act_help: TAction;
    DataSet_help: TpFIBDataSet;
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
    procedure Act_helpExecute(Sender: TObject);
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

function ShowReportStud(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowReportStud;

var
  frmMainReportStud: TfrmMainReportStud;
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

  bar.MaxValue:=3;
  SP:=TpFIBStoredProc.Create(nil);
  SP.Transaction:=Transaction;
  SP.Database:=DataBase;
  Transaction.StartTransaction;
  pos:=0;
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
  pos:=2;
  Synchronize(UpdateBar);
//Активация кнопок
  if not Terminated then
    begin
      BOK.Enabled:=true;
      BCANCEL.Enabled:=false;
      BVIEW.Enabled:=true;
    end;
  pos:=3;
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



function ShowReportStud(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmMainReportStud;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmMainReportStud) then exit;
 ViewForm := TfrmMainReportStud.Create(AParameter.Owner, AParameter.Db_Handle);
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

constructor TfrmMainReportStud.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DB.Handle:=DB_Handle;
Screen.Cursor:=crDefault;
end;


procedure TfrmMainReportStud.FormCreate(Sender: TObject);
begin
  PLanguageIndex:=                      cn_Common_Funcs.cnLanguageIndex();
  caption:=                             Cn_uReportsConst.cn_RepStudFT[PLanguageIndex];
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

  cxRadioGrouptypeRep.Properties.Items[0].Caption := Cn_uReportsConst.cn_RepRestr[PLanguageIndex];
  cxRadioGrouptypeRep.Properties.Items[1].Caption := Cn_uReportsConst.cn_RepSV[PLanguageIndex];
  cxRadioGrouptypeRep.Properties.Items[2].Caption := 'Реєстр з пільгами';

  InitForm();
end;


procedure TfrmMainReportStud.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMainReportStud.cxButtonQuitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMainReportStud.cxButtonFilterClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  Gauge1.Progress:=0;
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

procedure TfrmMainReportStud.InitForm();
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

procedure TfrmMainReportStud.cxButtonRunClick(Sender: TObject);
var
  ReportOptions:Variant;
begin
{  if VarArrayDimCount(res)=0 then
   begin
    ShowMessage(cnConsts.cn_FilterParams_Need[PLanguageIndex]);
    Exit;
   End
  Else
   if res[0][0]<>1 then
    Begin
     ShowMessage(cnConsts.cn_FilterParams_Need[PLanguageIndex]);
     Exit;
    End;}

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
 report:=ReportTHerited.Create(DB,WriteTransaction,
          Gauge1,ID_SESSION,cxButtonRun,cxButtonCancel,cxButtonView,ReportOptions);
end;

procedure TfrmMainReportStud.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='Час формування звіту: '+TimeToStr(Now-TimeStart);
  if cxButtonView.Enabled=true then
    begin
      Timer1.Enabled:=false;
      cxButtonFilter.Enabled:=true;
    end;
end;

procedure TfrmMainReportStud.FormDestroy(Sender: TObject);
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

procedure TfrmMainReportStud.cxButtonViewClick(Sender: TObject);
var
  query,order,sql_master:String;
  i,j,nj:integer;
  Doc_R,Doc_Sv:Integer;
  FieldView,NFieldView,FieldGroup,FieldNameReport:Variant;
  AParameter:TcnSimpleParams;
begin
  if cxRadioGrouptypeRep.ItemIndex = 1 then
   begin
    Doc_SV:=1;
    Doc_R:=0;
   end;
  if cxRadioGrouptypeRep.ItemIndex = 0 then
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


//составление шапки отчета
FieldNameReport:=VarArrayCreate([0,1],varVariant);
FieldNameReport[0]:=VarArrayOf([cxDateEditPeriodBegin.Date]);
FieldNameReport[1]:=VarArrayOf([cxDateEditPeriodEnd.Date]);

//Реестр с льготами
if cxRadioGrouptypeRep.ItemIndex = 2 then
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
        sql_master:='select distinct ISMAINDOG, '+sql_master + 'ID_SESSION from CN_TMP_REPORT_STUD where ID_SESSION='+IntToStr(ID_SESSION)+' order by ISMAINDOG,'+sql_master+' ID_SESSION';
      end
      else
      begin
        sql_master:='select distinct ISMAINDOG,ID_SESSION from CN_TMP_REPORT_STUD where ID_SESSION='+IntToStr(ID_SESSION)+' order by ISMAINDOG';
      end;


    query:='select * from CN_TMP_REPORT_STUD where  ID_SESSION='+IntToStr(ID_SESSION)+' and ISMAINDOG=:ISMAINDOG';

    query:=query+' and '+order+' ID_SESSION=:ID_SESSION';
    query:=query+' ORDER BY FIO collate win1251_ua';

    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    //AParameter.Formstyle:=fsMDIChild;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.Sql_Master:=Sql_Master;
    AParameter.Sql_Detail:=query;
    AParameter.FieldView:=FieldGroup;
    AParameter.NotFieldView:=NFieldView;
    AParameter.FieldNameReport:=FieldNameReport;
    AParameter.Type_Report:=0;
    AParameter.LastIgnor:=0;
    AParameter.Report_Name:='RCNTDOGL';
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;
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
        sql_master:='select distinct ISMAINDOG, '+sql_master + 'ID_SESSION from CN_TMP_REPORT_STUD where ID_SESSION='+IntToStr(ID_SESSION)+' order by ISMAINDOG,'+sql_master+' ID_SESSION';
      end
      else
      begin
        sql_master:='select distinct ISMAINDOG,ID_SESSION from CN_TMP_REPORT_STUD where ID_SESSION='+IntToStr(ID_SESSION)+' order by ISMAINDOG';
      end;


    query:='select * from CN_TMP_REPORT_STUD where  ID_SESSION='+IntToStr(ID_SESSION)+' and ISMAINDOG=:ISMAINDOG';

    query:=query+' and '+order+' ID_SESSION=:ID_SESSION';
    query:=query+' ORDER BY FIO collate win1251_ua';

    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    //AParameter.Formstyle:=fsMDIChild;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.Sql_Master:=Sql_Master;
    AParameter.Sql_Detail:=query;
    AParameter.FieldView:=FieldGroup;
    AParameter.NotFieldView:=NFieldView;
    AParameter.FieldNameReport:=FieldNameReport;
    AParameter.Type_Report:=0;
    AParameter.LastIgnor:=0;
    AParameter.Report_Name:='RCNTDOG';
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

    FieldView:=VarArrayCreate([0,j+2],varVariant);
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

    FieldView[j]:=VarArrayOf(['CNT','Кількість',50]);
    FieldView[j+1]:=VarArrayOf(['SUM_NEED','План',120]);  //с льготой
    FieldView[j+2]:=VarArrayOf(['summa_n_nach','План',120]); //без льготы

    query:='select '+sql_master+' count (CN_TMP_REPORT_STUD.ID_DOG_ROOT) as CNT, sum(CN_TMP_REPORT_STUD.SUMM_N_NEED) as SUM_NEED, sum(CN_TMP_REPORT_STUD.SUMM_LGOT) as summa_n_nach, ID_SESSION from CN_TMP_REPORT_STUD where ID_SESSION='+IntToStr(ID_SESSION);

    query:=query+' group by '+sql_master+' ID_SESSION';
    query:=query+ ' order by '+sql_master+' ID_SESSION';

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
    AParameter.Report_Name:='SVCNTDOG';
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
    FieldView[4]:=VarArrayOf(['CNT']);
    FieldView[5]:=VarArrayOf(['NAME_FACULT_EX']);
    FieldView[6]:=VarArrayOf(['NAME_OTDEL_EX']);    

    query:='SELECT EMIT_FACULT, S.NAME_FACULT, S.NAME_FACULT as NAME_FACULT_EX, NAME_FORM_STUD, COUNT (S.ID_DOG_ROOT) AS CNT,ID_SESSION, OT.NAME_OTDEL, OT.NAME_OTDEL as NAME_OTDEL_EX ';
    query:=query+' FROM CN_TMP_REPORT_STUD S ';
    query:=query+'left join CN_SP_FACUL F ';
    query:=query+'  on S.id_fak = F.id_facul ';
    query:=query+'left join CN_SP_FORM_STUD FS ';
    query:=query+'  on S.id_form_stud = FS.id_form_stud ';
    query:=query+'left join CN_SP_OTDEL OT ';
    query:=query+'  on OT.id_otdel=FS.id_otdel ';
    query:=query+' WHERE ID_SESSION='+IntToStr(ID_SESSION);
    query:=query+' GROUP BY OT.NAME_OTDEL, EMIT_FACULT, NAME_FACULT, NAME_FORM_STUD, ID_SESSION ';
    query:=query+' ORDER BY OT.NAME_OTDEL, EMIT_FACULT, NAME_FACULT, NAME_FORM_STUD, ID_SESSION';

    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    AParameter.Formstyle:=fsNormal;
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
  end;
end;

procedure TfrmMainReportStud.ActionParamExecute(Sender: TObject);
begin
  cxButtonFilterClick(self);
end;

procedure TfrmMainReportStud.ActionRunExecute(Sender: TObject);
begin
  cxButtonRun.SetFocus;
  cxButtonRunClick(self);
end;

procedure TfrmMainReportStud.ActionViewExecute(Sender: TObject);
begin
if cxButtonView.Enabled=true then
  begin
    cxButtonViewClick(self);
  end;  
end;

procedure TfrmMainReportStud.isDebug_actExecute(Sender: TObject);
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

procedure TfrmMainReportStud.Act_helpExecute(Sender: TObject);
var
  FileName : String;
  FullName : PAnsiChar;
begin
  DataSet_help.Close;
  DataSet_help.SQLs.SelectSQL.Text := 'select * from pub_sp_help where name_object = :object and name_system = :system';
  DataSet_help.ParamByName('object').AsString := 'report_stud';
  DataSet_help.ParamByName('system').AsString := 'contracts';
  DataSet_help.Open;


  If DataSet_help.RecordCount = 0 then
   begin
    cnShowMessage('Help not found',
                  'Help not Found' + #13 + cnConsts_Messages.cn_GoToAdmin[PLanguageIndex],
                   mtError,
                   [mbOK]);
    Exit;
   end;

  FileName := DataSet_help.FieldByName('NAME_FILE').AsString;
  FullName := PChar(ExtractFilePath(Application.ExeName) + 'Help\Contracts\' + FileName);
  if not FileExists(FullName) then
   Begin
    cnShowMessage('File not found',
                   FullName + #13 + cnConsts_Messages.cn_GoToAdmin[PLanguageIndex],
                   mtError,
                   [mbOK]);
    Exit;
   end;

  ShellExecute(Handle, 'open', FullName, nil, nil, SW_SHOWNORMAL);
end;

end.
