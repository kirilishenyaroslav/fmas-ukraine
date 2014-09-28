unit uCnPrintOborot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxLookAndFeelPainters, StdCtrls, cxButtons,FIBQuery,
  pFIBQuery, pFIBStoredProc, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxCheckBox, cxGridTableView,
  RxMemDS, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Gauges, cxContainer,
  cxRadioGroup, frxClass, ExtCtrls, ComCtrls, cxGroupBox,
  cn_Common_Funcs,cn_Common_Types,cn_Common_Loader,Cn_uReportsConst,
  ActnList, cn_Common_Messages;

type
  TfrmPrintOborot = class(TForm)
    Gauge1: TGauge;
    cxButtonRun: TcxButton;
    cxButtonCancel: TcxButton;
    cxButtonQuit: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxCheckBoxMainDog: TcxCheckBox;
    cxCheckBoxDopDog: TcxCheckBox;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    SelectField: TcxGridDBColumn;
    NameField: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    StatusBar1: TStatusBar;
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
    pFIBDataSetSetup: TpFIBDataSet;
    ActionList1: TActionList;
    isDebug_act: TAction;
    cxCheckBoxArhiv: TcxCheckBox;
    cxCheckBoxNotArhiv: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonExitClick(Sender: TObject);
    procedure cxButtonViewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InitForm();
    procedure cxButtonQuitClick(Sender: TObject);
    procedure cxButtonRunClick(Sender: TObject);
    procedure isDebug_actExecute(Sender: TObject);
  private
    //
  public
    isDebug : Boolean;
    constructor Create(Aonwe:Tcomponent;DBH:TISC_DB_HANDLE;ID_ACCOUNT:Int64;Date_beg,Date_end:TDateTime);
    { Public declarations }
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
var
  frmPrintOborot: TfrmPrintOborot;
  PLanguageIndex: Integer;
  res:Variant;
  report:ReportTHerited;
  ID_SESSION, ID_ACC : Int64;
  TimeStart:TTime;
  DATE_BEG_ACC,DATE_END_ACC:TDate;
  IS_DONGUET:Integer;
implementation

{$R *.dfm}
constructor TfrmPrintOborot.Create(Aonwe:Tcomponent;DBH:TISC_DB_HANDLE; ID_ACCOUNT : Int64 ;Date_beg,Date_end:TDateTime);
begin
 Screen.Cursor := crHourGlass;
 inherited Create(Aonwe);
 DB.Handle := DBH;
 Screen.Cursor := crDefault;
 ID_ACC := ID_ACCOUNT;
 DATE_BEG_ACC := Date_beg;
 DATE_END_ACC := Date_end;
end;

Constructor ReportTHerited.Create(InDataBase:TpFIBDatabase;InTransaction,InReadTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL,InBVIEW:TcxButton;InReportOptions:Variant);
begin
  inherited Create(False);
  DataBase := InDataBase;
  Transaction := InTransaction;
  ReadTransaction := InReadTransaction;
  bar := prog;
  ID_SESSION := ID_TRAN;
  BOK := InBOK;
  BCANCEL := InBCANCEL;
  BVIEW := InBVIEW;
  ReportOptions := InReportOptions;
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

  //start_sql_monitor;

  Transaction.StartTransaction;
  SP.StoredProcName:='CN_TMP_REPORT_STUD_SEL_ACCOUNT';
  SP.Prepare;
  SP.ParamByName('ID_SESSION').asInt64 := ID_SESSION;
  SP.ParamByName('ID_ACCOUNT').asInt64 := ID_ACC;
  SP.ExecProc;
  try
   Transaction.Commit;
  except
   on E:Exception do
    begin
     Transaction.Rollback;
     messageBox(0,PChar('Ошибка при выполнении процедуры CN_TMP_REPORT_STUD_SEL_ACCOUNT'),'Ошибка!!!',MB_OK);
     //Send_mail(e.Message);
    end;
  end;


  //начинаем рассчет сумм, блин как же это долго
  selectAll:=TpFIBDataSet.create(nil);
  selectAll.Database:=DataBase;
  selectAll.Transaction:=ReadTransaction;
  selectAll.SQLs.SelectSQL.Add('select ID_STUD  from CN_TMP_REPORT_STUD where id_session = :pid_session');
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
          StoredProcName:='CN_ACCOUNTS_GET_OBOR_VED_DATA';
          Database:=Database;
          Transaction:=Transaction;
          Transaction.StartTransaction;
          Prepare;
          ParamByName('ID_STUD').Asint64:=SelectAll.FieldByName('ID_STUD').AsVariant;
          ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
          ParamByName('ID_ACCOUNT').AsInt64:=ReportOptions[0][0];
          ExecProc;
          Transaction.Commit;
        except
          on E:Exception do
           begin
            MessageBox(Application.MainForm.Handle,'Ошибка расчета при формирование отчета!','Внимание!',MB_ICONWARNING or MB_OK);
            Transaction.Rollback;
            //Send_mail(e.Message);
           End;
        end;
       end;
      selectAll.Next;
    end;

 //stop_sql_monitor;

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

procedure TfrmPrintOborot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if report<>nil then
    begin
      report.Terminate;
    end;
if ID_SESSION<>0 then
  begin
    WriteTransaction.StartTransaction;
    //start_sql_monitor;
    StoredProc.StoredProcName:='CN_TMP_REPORT_DELETE';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_SESSION').asInt64:=ID_SESSION;
    StoredProc.ExecProc;
    try
      WriteTransaction.Commit;
    except
      on E:Exception do
       begin
        cnShowMessage('Error in CN_TMP_REPORT_DELETE',e.Message,mtError,[mbOK]);
        WriteTransaction.Rollback;
        //Send_mail(e.Message);
       end;
    end;
    //stop_sql_monitor;
  end;
Action:=caFree;
end;

procedure TfrmPrintOborot.cxButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrintOborot.cxButtonViewClick(Sender: TObject);
var
  query,order,sql_master,text_sum_select,text_sum_where,type_report:String;
  i,j,nj,SumC:integer;
  Doc_R,Doc_Sv:Integer;
  FieldView,NFieldView,FieldGroup,FieldNameReport:Variant;
  cn_type_dog,cn_type_dog_arhiv:String;
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

cn_type_dog:='';

if (cxCheckBoxMainDog.Checked=true  and cxCheckBoxDopDog.Checked=true) then
  begin
    cn_type_dog:=' and (ISMAINDOG=1 or ISMAINDOG=0) '
  end
  else
  begin
    if cxCheckBoxMainDog.Checked=true then
      begin
        cn_type_dog:=' and ISMAINDOG=1';
      end;
    if cxCheckBoxDopDog.Checked=true then
      begin
        cn_type_dog:=' and ISMAINDOG=0';
      end;
  end;

if (cxCheckBoxNotArhiv.Checked=true  and cxCheckBoxArhiv.Checked=true) then
  begin
    cn_type_dog_arhiv:=' and (ISDISSDOG=1 or ISDISSDOG=0) '
  end
  else
  begin
    if cxCheckBoxArhiv.Checked=true then
      begin
        cn_type_dog_arhiv:=' and ISDISSDOG=1';
      end;
    if cxCheckBoxNotArhiv.Checked=true then
      begin
        cn_type_dog_arhiv:=' and ISDISSDOG=0';
      end;
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
        sql_master:='select distinct ISMAINDOG, '+sql_master + 'S.ID_SESSION from CN_ACCOUNT_OLAP_OBOR_DATA P,CN_TMP_REPORT_STUD S where P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog+cn_type_dog_arhiv+' order by ISMAINDOG,'+sql_master+' S.ID_SESSION';
      end
      else
      begin
        sql_master:='select distinct ISMAINDOG,S.ID_SESSION from CN_ACCOUNT_OLAP_OBOR_DATA P,CN_TMP_REPORT_STUD S where P.id_session=S.id_session and P.id_stud=S.id_stud S.ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog+cn_type_dog_arhiv+' order by ISMAINDOG';
      end;


    query:='select * from CN_ACCOUNT_OLAP_OBOR_DATA P,CN_TMP_REPORT_STUD S where ';
    query:=query+'P.id_session=S.id_session and P.id_stud=S.id_stud and  S.ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog+cn_type_dog_arhiv+' and ISMAINDOG=:ISMAINDOG';

    query:=query+' and '+order+' S.ID_SESSION=:ID_SESSION';
    query:=query+' ORDER BY FIO';

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
    if cxRadioGrouptypeRep.ItemIndex = 0
     then AParameter.Report_Name:='RACCOUNT_NACH'
     else AParameter.Report_Name:='RACCOUNT';
    AParameter.Date_beg:=  DATE_BEG_ACC;
    AParameter.Date_end:=  DATE_END_ACC;
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
    FieldView[j]:=VarArrayOf(['CUR_NACH','CUR_NACH',70]);
    FieldView[j+1]:=VarArrayOf(['CUR_PAY','CUR_PAY',70]);
    FieldView[j+2]:=VarArrayOf(['IN_NACH_DOLG','IN_NACH_DOLG',70]);
    FieldView[j+3]:=VarArrayOf(['IN_NACH_PERE','IN_NACH_PERE',70]);
    FieldView[j+4]:=VarArrayOf(['OUT_NACH_DOLG','OUT_NACH_DOLG',70]);
    FieldView[j+5]:=VarArrayOf(['OUT_NACH_PERE','OUT_NACH_PERE',70]);

    //для переплаты -1

    query_pere:='select '+sql_master+'sum(CUR_NACH) as CUR_NACH,sum(CUR_PAY) as CUR_PAY,sum(IN_NACH_DOLG) as IN_NACH_DOLG,';
    query_pere:=query_pere+' sum(IN_NACH_PERE) as IN_NACH_PERE,sum(OUT_NACH) as OUT_NACH,';
    query_pere:=query_pere+' sum(OUT_NACH_DOLG) as OUT_NACH_DOLG,sum(OUT_NACH_PERE) as OUT_NACH_PERE,S.id_session from CN_ACCOUNT_OLAP_OBOR_DATA P,CN_TMP_REPORT_STUD S where ';
    query_pere:=query_pere+'P.id_session=S.id_session and P.id_stud=S.id_stud and S.ID_SESSION='+IntToStr(ID_SESSION)+cn_type_dog+cn_type_dog_arhiv;
    query_pere:=query_pere+' group by '+sql_master+'S.ID_SESSION';
    query_pere:=query_pere+ ' order by '+sql_master+'S.ID_SESSION';


    AParameter:= TcnSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:=DB.Handle;
    AParameter.Formstyle:=fsMDIChild;
    AParameter.WaitPakageOwner:=self;
    AParameter.Sql_Master:=query_pere;
    AParameter.Sql_Detail:=query_zad;
    AParameter.FieldView:=FieldView;
    AParameter.NotFieldView:=NFieldView;
    AParameter.FieldNameReport:=FieldNameReport;
    AParameter.Type_Report:=1;
    AParameter.LastIgnor:=j-1;
    AParameter.Report_Name:='SVACCOUNT';
    AParameter.Date_beg:=  DATE_BEG_ACC;
    AParameter.Date_end:=  DATE_END_ACC;
    AParameter.ID_SESSION:=ID_SESSION;
    AParameter.is_debug := isdebug;

    RunFunctionFromPackage(AParameter, 'Contracts\cn_ViewReports.bpl','ReportsView');
    AParameter.Free;
  end;
end;

procedure TfrmPrintOborot.FormCreate(Sender: TObject);
begin
  PLanguageIndex := cn_Common_Funcs.cnLanguageIndex();

  caption                               := Cn_uReportsConst.cn_RepStudFT[PLanguageIndex];
  cxButtonRun.Caption                   := Cn_uReportsConst.cn_RepStudRun[PLanguageIndex];
  cxButtonCancel.Caption                := Cn_uReportsConst.cn_RepStudCancel[PLanguageIndex];
  cxButtonQuit.Caption                  := Cn_uReportsConst.cn_RepStudQuit[PLanguageIndex];
  cxCheckBoxMainDog.Properties.Caption  := Cn_uReportsConst.cn_RepStudMainDog[PLanguageIndex];
  cxCheckBoxDopDog.Properties.Caption   := Cn_uReportsConst.cn_RepStudDopDog[PLanguageIndex];
  cxCheckBoxNotArhiv.Properties.Caption := Cn_uReportsConst.cn_RepDogNotArhiv[PLanguageIndex];
  cxCheckBoxArhiv.Properties.Caption    := Cn_uReportsConst.cn_RepDogArhiv[PLanguageIndex];

  cxButtonView.Caption := Cn_uReportsConst.cn_RepStudView[PLanguageIndex];
  NameField.Caption    := Cn_uReportsConst.cn_RepStudSelFiled[PLanguageIndex];
  SelectField.Caption  :=  '';

  cxRadioGrouptypeRep.Properties.Items[0].Caption := 'Реєстр нарахувань';
  cxRadioGrouptypeRep.Properties.Items[1].Caption := Cn_uReportsConst.cn_RepSV[PLanguageIndex];
  cxRadioGrouptypeRep.Properties.Items[2].Caption := Cn_uReportsConst.cn_RepRestr[PLanguageIndex];

  InitForm();
  cxButtonView.Enabled := False; 
end;

procedure TfrmPrintOborot.InitForm();
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
  StoredProc.ExecProc;
  try
   WriteTransaction.Commit;
   except
    on E:Exception do
     begin
      cnShowMessage('Error in CN_DT_REPORTS_SESSION',e.Message,mtError,[mbOK]);
      WriteTransaction.Rollback;
      //Send_mail(e.Message);
     end;
  end;
  //stop_sql_monitor;
  
  ID_SESSION:= StoredProc.FieldByName('ID_SESSION').AsVariant;
  WriteTransaction.Commit;
end;

procedure TfrmPrintOborot.cxButtonQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrintOborot.cxButtonRunClick(Sender: TObject);
var
  ReportOptions:Variant;
begin
  cxButtonRun.Enabled := false;
  cxButtonCancel.Enabled := true;
  cxButtonView.Enabled := false;
  TimeStart := Now;
  Timer1.Enabled := true;
  ReportOptions := VarArrayCreate([0,1],varVariant);
  ReportOptions[0] := VarArrayOf([ID_ACC]);
  report := ReportTHerited.Create(DB,WriteTransaction,ReadTransaction,Gauge1,ID_SESSION,cxButtonRun,cxButtonCancel,cxButtonView,ReportOptions);
end;

procedure TfrmPrintOborot.isDebug_actExecute(Sender: TObject);
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
