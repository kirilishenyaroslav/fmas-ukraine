unit cn_MainFormDocProv;

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
  cn_Common_Loader, Cn_uReportsConst, ActnList,ClipBrd, cnConsts;

type
  TfrmMainFormDocProv = class(TForm)
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
    cxGroupBox1: TcxGroupBox;
    cxCheckBoxSm: TcxCheckBox;
    cxCheckBoxSch: TcxCheckBox;
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
    cxCheckBoxNotExistsProvGet: TcxCheckBox;
    ActionDebug: TAction;
    isDebug_act: TAction;
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
    procedure ActionDebugExecute(Sender: TObject);
    procedure isDebug_actExecute(Sender: TObject);
  private
    { Private declarations }
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


function ShowReportDocProv(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowReportDocProv;

var
  frmMainFormDocProv: TfrmMainFormDocProv;
  PLanguageIndex: Integer;
  res:Variant;
  report:ReportTHerited;
  ID_SESSION:Int64;
  TimeStart:TTime;
  IS_DONGUET:Integer;
  cn_date_start:TDate;
  cn_end_month:Integer;  
implementation
uses
  MainSmeta;
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
  GenNotProv:Integer;
begin

  pos:=0;
  Synchronize(UpdateBar);

  GenNotProv:=ReportOptions[2][0];

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

  bar.MaxValue:=selectAll.RecordCount;
  for i:=0 to selectAll.RecordCount-1 do
    begin
       pos:=i;
       Synchronize(UpdateBar);
       With SP do
          begin
          try
          StoredProcName:='CN_TMP_REPORT_DOC_PROV_GEN';
          Database:=Database;
          Transaction:=Transaction;
          Transaction.StartTransaction;
          Prepare;
          ParamByName('ID_STUD').Asint64:=SelectAll.FieldByName('ID_STUD').AsVariant;
          ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
          ParamByName('DATE_BEG').AsDate:=VarToDateTime(ReportOptions[0][0]);
          ParamByName('DATE_END').AsDate:=VarToDateTime(ReportOptions[1][0]);
          ExecProc;
          Transaction.Commit;
        except
          MessageBox(Application.MainForm.Handle,PChar('Ошибка расчета при формирование отчета!'+#13+' Прцедура CN_TMP_REPORT_DOC_PROV_GEN'+#13+SelectAll.FieldByName('FIO').AsString),'Внимание!',MB_ICONWARNING or MB_OK);
          Clipboard.AsText:=SelectAll.FieldByName('ID_STUD').AsVariant;

          Transaction.Rollback;
          raise;
        end;
        end;
      selectAll.Next;
    end;
  if GenNotProv=1 then
    begin
       With SP do
          begin
          try
          StoredProcName:='CN_TMP_REPORT_GET_NOT_PROV';
          Database:=Database;
          Transaction:=Transaction;
          Transaction.StartTransaction;
          Prepare;
          ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
          ParamByName('DATE_BEG').AsDate:=VarToDateTime(ReportOptions[0][0]);
          ParamByName('DATE_END').AsDate:=VarToDateTime(ReportOptions[1][0]);
          ExecProc;
          Transaction.Commit;
        except
          MessageBox(Application.MainForm.Handle,'Ошибка расчета при формирование доп. отчета!','Внимание!',MB_ICONWARNING or MB_OK);
          Transaction.Rollback;
          raise;
        end;
      end;
    end;
  pos:=bar.MaxValue;
  Synchronize(UpdateBar);

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

function ShowReportDocProv(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmMainFormDocProv;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmMainFormDocProv) then exit;
 ViewForm := TfrmMainFormDocProv.Create(AParameter.Owner, AParameter.Db_Handle);
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


procedure TfrmMainFormDocProv.FormCreate(Sender: TObject);
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
  NameField.Caption:=                   Cn_uReportsConst.cn_RepStudSelFiled[PLanguageIndex];
  SelectField.Caption:=                 '';

  cxCheckBoxSch.Properties.Caption :=     Cn_uReportsConst.cn_RepDocProvSch[PLanguageIndex];
  cxCheckBoxSm.Properties.Caption :=      Cn_uReportsConst.cn_RepDocProvSm[PLanguageIndex];

  cxRadioGrouptypeRep.Properties.Items[0].Caption:=Cn_uReportsConst.cn_RepRestr[PLanguageIndex];
  cxRadioGrouptypeRep.Properties.Items[1].Caption:=Cn_uReportsConst.cn_RepSV[PLanguageIndex];
  cxRadioGrouptypeRep.Properties.Items[2].Caption:=Cn_uReportsConst.cn_RepDocPrintProvSm[PLanguageIndex];
  cxRadioGrouptypeRep.Properties.Items[3].Caption:=Cn_uReportsConst.cn_RepSVDPDocShort[PLanguageIndex];

  cxCheckBoxNotExistsProvGet.Properties.Caption := Cn_uReportsConst.cn_RepFormFilterSmNotProvGet[PLanguageIndex];

  InitForm();
end;


constructor TfrmMainFormDocProv.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DB.Handle:=DB_Handle;
Screen.Cursor:=crDefault;
end;

procedure TfrmMainFormDocProv.cxButtonFilterClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:=DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  AParameter.ID_SESSION:=ID_SESSION;
  Res := RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsFilter.bpl','ShowReportFilter');
  AParameter.Free;
  cxButtonView.Enabled:=false;
end;

procedure TfrmMainFormDocProv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMainFormDocProv.cxButtonQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainFormDocProv.cxButtonRunClick(Sender: TObject);
var
  ReportOptions:Variant;
begin
{  If VarArrayDimCount(res)=0 then
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
 cxButtonView.Enabled:=false;
 cxButtonFilter.Enabled:=false;

 TimeStart:=Now;
 Timer1.Enabled:=true;
 ReportOptions:=VarArrayCreate([0,2],varVariant);
 ReportOptions[0]:=VarArrayOf([cxDateEditPeriodBegin.Date]);
 ReportOptions[1]:=VarArrayOf([cxDateEditPeriodEnd.Date]);
 if cxCheckBoxNotExistsProvGet.Checked=true then
   begin
     ReportOptions[2]:=VarArrayOf([1]);
   end
   else
   begin
     ReportOptions[2]:=VarArrayOf([0]);
   end;

 report:=ReportTHerited.Create(DB,WriteTransaction,ReadTransaction,
          Gauge1,ID_SESSION,cxButtonRun,cxButtonCancel,cxButtonView,ReportOptions);
end;


procedure TfrmMainFormDocProv.InitForm();
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
    end;}
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

procedure TfrmMainFormDocProv.FormDestroy(Sender: TObject);
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

procedure TfrmMainFormDocProv.cxButtonViewClick(Sender: TObject);
var
  query,sql_master,sql_master_add,order,text_sum_select,text_sum_where,sql_smeta:String;
  i,j,nj,SumC:integer;
  Doc_R,Doc_Sv,Doc_SvSM,Doc_SvCNT:Integer;
  FieldView,NFieldView,FieldGroup,FieldSum,FieldNameReport:Variant;
  type_report:String;
  AParameter:TcnSimpleParams;
  Smeta:TfrmMainViewReportsSmeta;
begin
  //showmessage(IntToStr(cxRadioGrouptypeRep.ItemIndex));
  if cxRadioGrouptypeRep.ItemIndex=0 then
   begin
    Doc_SV:=0;
    Doc_R:=1;
    Doc_SvSM:=0;
    Doc_SvCNT:=0;
   end;
  if cxRadioGrouptypeRep.ItemIndex=1 then
   begin
    Doc_SV:=1;
    Doc_R:=0;
    Doc_SvSM:=0;
    Doc_SvCNT:=0;
   end;
  if cxRadioGrouptypeRep.ItemIndex=2 then
   begin
    Doc_SV:=0;
    Doc_R:=0;
    Doc_SvSM:=1;
    Doc_SvCNT:=0;
   end;
  if cxRadioGrouptypeRep.ItemIndex=3 then
   begin
    Doc_SV:=0;
    Doc_R:=0;
    Doc_SvSM:=0;
    Doc_SvCNT:=1;
   end;

  j := 0;
  RxMemoryDataPrintSetup.First;
  order := '';
  sql_master := '';
  for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
   begin
    if RxMemoryDataPrintSetup.FieldByName('RxSelectField').AsInteger = 1 then
     begin
      if RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString <> '' then
       begin
        inc(j);
        sql_master := sql_master + RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString + ',';
        order      := order + RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString + '=:' + RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString + ' and ';
       end;
     end;
    RxMemoryDataPrintSetup.Next;
   end;

  if (cxCheckBoxSm.Checked=true) and (Doc_R=1) then
   begin
    sql_master:='SMETA_KOD,RAZD_KOD,ST_KOD,KEKV_KOD,'+sql_master;
    order:=' SMETA_KOD=:SMETA_KOD and RAZD_KOD=:RAZD_KOD and ST_KOD=:ST_KOD and KEKV_KOD=:KEKV_KOD and '+order;
    inc(j);
   end;

  if (cxCheckBoxSch.Checked=true) and (Doc_R=1) then
   begin
    sql_master:='SCH_NUMBER_DB,SCH_NUMBER_KD,'+sql_master;
    order:=' SCH_NUMBER_DB=:SCH_NUMBER_DB and SCH_NUMBER_KD=:SCH_NUMBER_KD and '+order;
    inc(j);
   end;

//------------------------------------------------------------------------------
//реестр
  if Doc_R=1 then
   begin
    RxMemoryDataPrintSetup.First;
    if j>=0 then
     begin
      FieldGroup:=VarArrayCreate([0,j-1],varVariant);
      NFieldView:=VarArrayCreate([0,RxMemoryDataPrintSetup.RecordCount-j+1],varVariant);
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
    if cxCheckBoxSm.Checked=true then
      begin
        FieldGroup[j]:=VarArrayOf(['SMETA','',1]);
        inc(j);
      end
      else
      begin
        NFieldView[nj]:=VarArrayOf(['SMETA','',1]);
        inc(nj);
      end;
    if cxCheckBoxSch.Checked=true then
      begin
        FieldGroup[j]:=VarArrayOf(['SCH','',1]);
        inc(j);
      end
      else
      begin
        NFieldView[nj]:=VarArrayOf(['SCH','',1]);
        inc(nj);
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
//    query:=query+ ' FIO collate win1251_ua,DOC_DATE';

    FieldNameReport:=VarArrayCreate([0,1],varVariant);
    FieldNameReport[0]:=VarArrayOf([sql_master_add]);

    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    AParameter.Formstyle:=fsNormal;
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
  
//------------------------------------------------------------------------------
//накопительный отчет
  if (Doc_SvCNT=1) then
   begin
    query:='select P.doc_date,COUNT(*),SUM(P.summa) from   cn_tmp_report_pay_doc_prov P where  P.id_session='+IntToStr(ID_SESSION)+'group by P.doc_date order by P.doc_date';

    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.Sql_Master:=query;
    AParameter.Sql_Detail:=query;
    AParameter.FieldView:=FieldGroup;
    AParameter.NotFieldView:=NFieldView;
    AParameter.FieldNameReport:=FieldNameReport;
    AParameter.FieldNameReport:= FieldNameReport;
    AParameter.Type_Report:=2;
    AParameter.LastIgnor:=0;
    AParameter.Report_Name:='RDOCPROVCNT';
    AParameter.ID_SESSION := ID_SESSION;
    AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
    AParameter.Date_end:= cxDateEditPeriodEnd.Date;
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
  end;
//------------------------------------------------------------------------------
  //сводная не для ДонГУЭТ
  if (Doc_Sv=1) and (IS_DONGUET =0 )then
   begin
    if (order='') and (Doc_Sv=1) then
      begin
       messageBox(Handle,PChar(Cn_uReportsConst.Studcity_MESSAGE_NO_CHOOSE_SUMMA[PLanguageIndex]),
                  PChar(Cn_uReportsConst.Studcity_MESSAGE_WARNING_CONST[PLanguageIndex]),MB_ICONWARNING or MB_OK);
       Exit;
      end;

    FieldView := VarArrayCreate([0, (j+1)],varVariant);
    nj := RxMemoryDataPrintSetup.RecordCount - j;
    if nj >= 0 then
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
    FieldView[j]:=VarArrayOf(['SUM_PAY','Сумма поступлений',70]);
    FieldView[j+1]:=VarArrayOf(['CNT','Кількість',50]);

    Smeta:=TfrmMainViewReportsSmeta.Create(Self,DB.Handle,ID_SESSION);
    sql_smeta:=Smeta.SelectBU;
    if sql_smeta<>'' then
      begin
        query:='select '+sql_master+' sum(P.summa) as sum_pay, S.ID_SESSION, COUNT(*) as CNT ';
        query:=query+' from CN_TMP_REPORT_PAY_DOC_PROV P join CN_TMP_REPORT_STUD S on P.id_session = S.id_session and P.id_stud = S.id_stud ';
        query:=query+' where S.ID_SESSION='+IntToStr(ID_SESSION)+sql_smeta;
        query:=query+' group by '+sql_master+' S.ID_SESSION';
        query:=query+ ' order by '+sql_master+' S.ID_SESSION';

        AParameter:= TcnSimpleParams.Create;
        AParameter.Owner:=self;
        AParameter.Db_Handle:=DB.Handle;
        AParameter.Formstyle:=fsNormal;
        AParameter.WaitPakageOwner:=self;
        AParameter.Sql_Master:=query;
        AParameter.Sql_Detail:=query;
        AParameter.FieldView:=FieldView;
        AParameter.NotFieldView:=NFieldView;
        AParameter.FieldNameReport:=FieldNameReport;
        AParameter.Type_Report := 1;
        AParameter.LastIgnor := j-1+1;
        AParameter.Report_Name := 'SVPayDay';
        AParameter.Date_beg := cxDateEditPeriodBegin.Date;
        AParameter.Date_end := cxDateEditPeriodEnd.Date;
        AParameter.is_debug := isdebug;

        RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    end;
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

    Smeta:=TfrmMainViewReportsSmeta.Create(Self,DB.Handle,ID_SESSION);
    sql_smeta:=Smeta.SelectBU;
    if sql_smeta<>'' then
      begin
        sql_master:='smeta_kod||'''+'.'+'''||smeta_title as smeta_kod,razd_kod||'''+'.'+'''||st_kod||'''+'.'+'''||KEKV_KOD as RZST,sch_number_db,sch_number_kd';

        query:='select '+sql_master+' ,sum(summa) as sum_pay,ID_SESSION from CN_TMP_REPORT_PAY_DOC_PROV P ';
        query:=query+' where ID_SESSION='+IntToStr(ID_SESSION)+sql_smeta;
        query:=query+' group by smeta_kod,smeta_title,razd_kod,st_kod,KEKV_KOD,sch_number_db,sch_number_kd,ID_SESSION';
        query:=query+ ' order by  smeta_kod,smeta_title,razd_kod,st_kod,KEKV_KOD,sch_number_db,sch_number_kd,ID_SESSION';

        AParameter:= TcnSimpleParams.Create;
        AParameter.Owner:=self;
        AParameter.Db_Handle:=DB.Handle;
        AParameter.Formstyle:=fsNormal;
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

    Smeta:=TfrmMainViewReportsSmeta.Create(Self,DB.Handle,ID_SESSION);
    sql_smeta:=Smeta.SelectBU;
    if sql_smeta<>'' then
      begin
        query:='SELECT EMIT_FACULT, S.NAME_FACULT, S.NAME_FACULT as NAME_FACULT_EX, NAME_FORM_STUD, sum(P.summa) as sum_pay, P.ID_SESSION, OT.NAME_OTDEL, OT.NAME_OTDEL as NAME_OTDEL_EX';
        query:=query+' FROM CN_TMP_REPORT_PAY_DOC_PROV P, CN_TMP_REPORT_STUD S, CN_SP_FACUL F, CN_SP_OTDEL OT, CN_SP_FORM_STUD FS WHERE P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION);
        query:=query+' and S.id_fak=F.id_facul and OT.id_otdel= FS.id_otdel ';
        query:=query+' and S.id_form_stud=FS.id_form_stud ';
        query:=query+' and P.ID_SESSION='+IntToStr(ID_SESSION)+sql_smeta;
        query:=query+' GROUP BY OT.NAME_OTDEL, EMIT_FACULT, NAME_FACULT, NAME_FORM_STUD, P.ID_SESSION ';
        query:=query+' ORDER BY OT.NAME_OTDEL, EMIT_FACULT, NAME_FACULT, NAME_FORM_STUD, P.ID_SESSION';

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
        AParameter.Report_Name:='SVPayDay_DONGUET';
        AParameter.Date_beg:= cxDateEditPeriodBegin.Date;
        AParameter.Date_end:= cxDateEditPeriodEnd.Date;
        AParameter.is_debug := isdebug;

        RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
        AParameter.Free;
      end;
  end;

end;

procedure TfrmMainFormDocProv.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='Час формування звіту: '+TimeToStr(Now-TimeStart);
  if cxButtonView.Enabled=true then
    begin
      Timer1.Enabled:=false;
       cxButtonFilter.Enabled:=true;
    end;
end;

procedure TfrmMainFormDocProv.ActionParamExecute(Sender: TObject);
begin
  cxButtonFilterClick(self);
end;

procedure TfrmMainFormDocProv.ActionRunExecute(Sender: TObject);
begin
  cxButtonRun.SetFocus;
  cxButtonRunClick(self);
end;

procedure TfrmMainFormDocProv.ActionViewExecute(Sender: TObject);
begin
if cxButtonView.Enabled=true then
  begin
    cxButtonViewClick(self);
  end;
end;

procedure TfrmMainFormDocProv.ActionDebugExecute(Sender: TObject);
begin
 cxButtonView.Enabled:=true;
end;

procedure TfrmMainFormDocProv.isDebug_actExecute(Sender: TObject);
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
