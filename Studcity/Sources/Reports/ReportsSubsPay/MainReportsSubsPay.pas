unit MainReportsSubsPay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,LoadPackegeStudCity,StudcityConst,IBase, ComCtrls, StdCtrls,
  Buttons, Gauges, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, cxClasses, RxMemDS, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, cxContainer,St_ser_function, ActnList;

type
  TfrmMainReportsSubsPay = class(TForm)
    GroupBoxDate: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePickerBegin: TDateTimePicker;
    DateTimePickerEnd: TDateTimePicker;
    GroupBox3: TGroupBox;
    Gauge1: TGauge;
    GroupBoxMainParam: TGroupBox;
    ButtonMainParam: TButton;
    GroupBoxButton: TGroupBox;
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    BitBtnClose: TBitBtn;
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    pFIBDataSetPrintSetup: TpFIBDataSet;
    RxMemoryDataPrintSetup: TRxMemoryData;
    DataSourcePrintSetup: TDataSource;
    StyleRepository: TcxStyleRepository;
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
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    Timer1: TTimer;
    GroupBox4: TGroupBox;
    ButtonView: TButton;
    RadioGroupTypePrint: TRadioGroup;
    StatusBar1: TStatusBar;
    cxGridPrintGroup: TcxGrid;
    cxGridPrintGroupDBTableView1: TcxGridDBTableView;
    CxSelectField: TcxGridDBColumn;
    CxNameField: TcxGridDBColumn;
    cxGridPrintGroupLevel1: TcxGridLevel;
    GroupBox1: TGroupBox;
    cxCheckBoxPropi: TcxCheckBox;
    cxCheckBoxDateSubs: TcxCheckBox;
    DateTimePickerSubs: TDateTimePicker;
    ActionList1: TActionList;
    act_debug: TAction;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure ButtonMainParamClick(Sender: TObject);
    procedure ButtonViewClick(Sender: TObject);
    procedure cxCheckBoxDateSubsClick(Sender: TObject);
    procedure act_debugExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    is_debug : Boolean;
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
    { Private declarations }
  public
    { Public declarations }
  end;

    ReportTHerited = class (TThread)
      Parametrs:Variant;
      DataBase:TpFIBDatabase;
      ReadTransaction:TpFIBTransaction;
      Transaction:TpFIBTransaction;
      bar:TGauge;
      pos:Integer;
      DateR:TDate;
      DateEnd:TDate;
      ID_TRANSACTION:Variant;
      BOK,BCANCEL:TBitBtn;
      BVIEW:TButton;
    //  Doc_R_OUT : integer;
    //  Doc_Rashifr_Out :Integer;
      Constructor Create (InParametrs:Variant;InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;InReadTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL:TBitBtn;InBVIEW:TButton;InDate,INDateEnd:TDate);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
    end;

function ReportsSubsPayDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports ReportsSubsPayDPK;
var
  frmMainReportsSubsPay: TfrmMainReportsSubsPay;
  ParamReport:Variant;
  ID_TRANSACTION:Variant;
  ID_TRANS:Int64;
  report:ReportTHerited;
  TimeStart:TTime;
  lang:Integer;
implementation

{$R *.dfm}

Constructor ReportTHerited.Create(InParametrs:Variant;InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;InReadTransaction:TpFIBTransaction;
                                  prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL:TBitBtn;InBVIEW:TButton;InDate,INDateEnd:TDate);
begin
  inherited Create(False);
  Parametrs:=InParametrs;
  DataBase:=InDataBase;
  Transaction:=InTransaction;
  ReadTransaction:=InReadTransaction;
  bar:=prog;
  DateR:=InDate;
  DateEnd:=INDateEnd;
  ID_TRANSACTION:=ID_TRAN;
  BOK:=InBOK;
  BCANCEL:=InBCANCEL;
  BVIEW:=InBVIEW;
end;

procedure ReportTHerited.Execute;
var
  SP, SPRashifr:TpFIBStoredProc;
  i, tmp_pos:Integer;
  selectAll:TpFIBDataSet;
  selectAllRashifr:TpFIBDataSet;
begin
  SP:=TpFIBStoredProc.Create(nil);
  SP.Transaction:=Transaction;
  SP.Database:=DataBase;

  //отбираем всех проживающих по типу прож/архив
  Transaction.StartTransaction;
  SP.StoredProcName:='ST_DT_REPORT_PAY_WORK';
  SP.Prepare;
  SP.ParamByName('ID_TRANSACTION').Value:=ID_TRANSACTION;
  try
    SP.ExecProc;
  except
    begin
      Transaction.Rollback;
      Exit;
    end;
  end;
  Transaction.Commit;

  //начинаем рассчет сумм, блин как же это долго
  selectAll:=TpFIBDataSet.create(nil);
  selectAll.Database:=DataBase;
  selectAll.Transaction:=ReadTransaction;
  selectAll.SQLs.SelectSQL.Add('select * from ST_DT_REPORT_PAY where ID_TRANSACTION=:param_transaction');
  selectAll.ParamByName('param_transaction').AsVariant:=ID_TRANSACTION;
  selectAll.Active:=true;
  selectAll.FetchAll;
  selectAll.First;

  {selectAllRashifr:=TpFIBDataSet.create(nil);
  selectAllRashifr.Database:=DataBase;
  selectAllRashifr.Transaction:=ReadTransaction;
  selectAllRashifr.SQLs.SelectSQL.Add('select distinct id_people  from ST_DT_REPORT_LIVER where ID_TRANSACTION=:param_transaction');
  selectAllRashifr.ParamByName('param_transaction').AsVariant:=ID_TRANSACTION;
  selectAllRashifr.Active:=true;
  selectAllRashifr.FetchAll;
  selectAllRashifr.First;   }

  bar.MaxValue:=selectAll.RecordCount;{+selectAllRashifr.RecordCount;}

  for i:=0 to selectAll.RecordCount-1 do
   begin
    pos:=10+i;
    Synchronize(UpdateBar);
    With SP do
     begin
      try
       StoredProcName:='ST_DT_REPORT_PAY_SUBS';
       Database:=Database;
       Transaction:=Transaction;
       Transaction.StartTransaction;
       Prepare;
       ParamByName('ID_PEOPLE').Asint64:=SelectAll.FieldByName('id_people').AsVariant;
       ParamByName('ID_SESSION').AsInt64:=ID_TRANSACTION;
       ParamByName('BEG_CHECK').AsDate:=DateR;
       ParamByName('END_CHECK').AsDate:=DateEnd;
       ExecProc;
       Transaction.Commit;
      except
       Transaction.Rollback;
       raise;
      end;
     end;
    selectAll.Next;
   end;

  {tmp_pos := pos;
  for i:=0 to selectAllRashifr.RecordCount-1 do
   begin
    pos:=10+tmp_pos+i;
    Synchronize(UpdateBar);
    With SP do
     begin
      try
       StoredProcName:='ST_DT_REPORT_SUBS_RASHIFR';
       Database:=Database;
       Transaction:=Transaction;
       Transaction.StartTransaction;
       Prepare;
       ParamByName('ID_PEOPLE').Asint64:=selectAllRashifr.FieldByName('id_people').AsVariant;
       ParamByName('ID_SESSION').AsInt64:=ID_TRANSACTION;
       ParamByName('DATE_BEG').AsDate:=DateR;
       ParamByName('DATE_END').AsDate:=DateEnd;
       ExecProc;
       Transaction.Commit;
      except
       Transaction.Rollback;
       raise;
      end;
     end;
    selectAllRashifr.Next;
   end;  }

  //Активация кнопок
  if not Terminated then
    begin
      BOK.Enabled:=true;
      BCANCEL.Enabled:=false;
      BVIEW.Enabled:=true;
    end;

  selectAll.Destroy;
  selectAllRashifr.Destroy;
end;

procedure ReportTHerited.UpdateBar;
begin     
  bar.Progress:=pos;
end;


destructor ReportTHerited.Destroy;
begin
  Inherited destroy;
end;


function ReportsSubsPayDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  Reports:TfrmMainReportsSubsPay;
begin
  Reports:=TfrmMainReportsSubsPay.Create(AOwner, DB);
//  Reports.ShowModal;
//  Reports.Free;
end;


constructor TfrmMainReportsSubsPay.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
var
  i:Integer;
  dd,mm,yyyy:Word;
begin
  inherited Create (AOwner);
  Database.Handle:=DB;
  Lang:=ST_serLanguageIndex(DB);
//  Caption:=StudcityConst.Studcity_ReportsNamePAY;

  ButtonMainParam.Caption:=StudcityConst.Studcity_ReportsMainParametrs;

  CxSelectField.Caption:=StudcityConst.Studcity_ReportsPrintSelChoose_EX[lang];
  CxNameField.Caption:=StudcityConst.Studcity_ReportsPrintSelect_EX[lang];

  BitBtnOK.Caption:=StudcityConst.Studcity_ACTION_OK_CONST_EX[lang];
  BitBtnCancel.Caption:=StudcityConst.Studcity_ACTION_CANCEL_CONST_EX[lang];
  BitBtnClose.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lang];
  ButtonView.Caption:=StudcityConst.Studcity_ACTION_VIEW_CONST_EX[lang];

  pFIBDataSetPrintSetup.Active:=false;
  pFIBDataSetPrintSetup.Active:=true;
  pFIBDataSetPrintSetup.FetchAll;
  pFIBDataSetPrintSetup.First;
  RxMemoryDataPrintSetup.EmptyTable;
  for i:=0 to pFIBDataSetPrintSetup.RecordCount-1 do
    begin
      RxMemoryDataPrintSetup.Open;
      RxMemoryDataPrintSetup.Insert;
      RxMemoryDataPrintSetup.FieldByName('RxSelectField').Value:=pFIBDataSetPrintSetup.FieldByName('SELECT_FIELD').AsInteger;
      RxMemoryDataPrintSetup.FieldByName('RxNameField').Value:=pFIBDataSetPrintSetup.FieldByName('NAME_FIELD').AsString;
      RxMemoryDataPrintSetup.FieldByName('RxNameVariant').Value:=pFIBDataSetPrintSetup.FieldByName('VARIABLE_FILEDS').AsString;
      RxMemoryDataPrintSetup.FieldByName('RxLenghtField').Value:=pFIBDataSetPrintSetup.FieldByName('LENGHT_FIRLDS').AsInteger;
      RxMemoryDataPrintSetup.FieldByName('RxOrdFileds').Value:=pFIBDataSetPrintSetup.FieldByName('ORD_FIELD').AsInteger;
      RxMemoryDataPrintSetup.Post;
      pFIBDataSetPrintSetup.Next;
    end;
  RadioGroupTypePrint.Items.Add('Розширений реєстр');
  RadioGroupTypePrint.Items.Add(StudcityConst.Studcity_ReportsPrintR_EX[lang]);
  RadioGroupTypePrint.ItemIndex:=1;

  //получаем идентификатор транзакции
  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName:='ST_DT_REPORTS_TRANSACTION';
  StoredProc.Prepare;
  try
    StoredProc.ExecProc;
  except
    begin
      WriteTransaction.Rollback;
      Exit;
    end;
   end;
  ID_TRANSACTION:=StoredProc.FieldByName('ID_TRANSACTION').AsVariant;
  WriteTransaction.Commit;
  ID_TRANS:=ID_TRANSACTION;

  //Выставление дат
  DecodeDate(Date,yyyy,mm,dd);
  DateTimePickerBegin.date:=EncodeDate(yyyy,mm,1);
  DateTimePickerSubs.date:=EncodeDate(yyyy,mm,1);
  if mm=12 then
    begin
      mm:=1;
      inc(yyyy);
    end
    else
    begin
      inc(mm);
    end;
  DateTimePickerEnd.date:=EncodeDate(yyyy,mm,1);
end;


procedure TfrmMainReportsSubsPay.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMainReportsSubsPay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if report <> nil then
    begin
      report.Terminate;
    end;

  if ID_TRANSACTION <> 0 then
   begin
    WriteTransaction.StartTransaction;
    StoredProc.StoredProcName:='ST_DT_REPORT_PAY_DELETE';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_TRANSACTION').Value:=ID_TRANSACTION;
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

  if ID_TRANSACTION<>0 then
   begin
    WriteTransaction.StartTransaction;
    StoredProc.StoredProcName:='ST_DT_REPORT_LIVERS_DELETE';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_TRANSACTION').Value:=ID_TRANSACTION;
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
  Action := caFree;
end;

procedure TfrmMainReportsSubsPay.BitBtnCancelClick(Sender: TObject);
begin
  report.Terminate;
  BitBtnOK.Enabled:=true;
  BitBtnCancel.Enabled:=false;
  DateTimePickerBegin.Enabled:=true;
  DateTimePickerEnd.Enabled:=true;
end;

procedure TfrmMainReportsSubsPay.BitBtnOKClick(Sender: TObject);
begin
    BitBtnOK.Enabled:=false;
    BitBtnCancel.Enabled:=true;
    DateTimePickerBegin.Enabled:=false;
    DateTimePickerEnd.Enabled:=false;
    Timer1.Enabled:=true;
    TimeStart:=Now;
    ParamReport:=VarArrayCreate([0,1],varVariant);
    ParamReport[0]:=1;

    report:=ReportTHerited.Create(ParamReport,Database,WriteTransaction,ReadTransaction,
            Gauge1,ID_TRANSACTION,BitBtnOK,BitBtnCancel,ButtonView,DateTimePickerBegin.Date,DateTimePickerEnd.Date);
end;

procedure TfrmMainReportsSubsPay.ButtonMainParamClick(Sender: TObject);
begin
    LoadPackegeStudCity.LoadReportsFilter(self,Database.Handle,ID_TRANSACTION);
    ButtonView.Enabled:=false;
    Gauge1.Progress:=0;
end;

procedure TfrmMainReportsSubsPay.ButtonViewClick(Sender: TObject);
var
  query,sql_master,order,text_sum_select,text_sum_where:String;
  i,j,nj,SumC:integer;
  FieldView,NFieldView,FieldGroup,FieldSum,FieldNameReport:Variant;
  type_report,propi,DateSubs:String;
  Doc_R_Rashifr,Doc_R:Integer;
begin
      if RadioGroupTypePrint.ItemIndex=0 then
      begin
          Doc_R_Rashifr:=1;
          Doc_R:=0;
      end
      else
      begin
          Doc_R_Rashifr:=0;
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
                sql_master:=sql_master+'RP.'+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+',';
                order:=order +'RP.'+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+'=:'+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+' and ';
              end;
          end;
        RxMemoryDataPrintSetup.Next;
      end;

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
          if cxCheckBoxPropi.Checked=true then
          begin
            propi:=' and  TYPESTATUS=3 ';
          end
          else
          begin
            propi:=' ';
          end;
        if cxCheckBoxDateSubs.Checked=true then
          begin
            DateSubs:=' and DATE_SUBS='''+DateToStr(DateTimePickerSubs.Date)+''''+' ';
          end
          else
          begin
            DateSubs:=' ';
          end;

        //создаем мастер запрос
        if j>0 then
          begin
            sql_master:='select distinct '+sql_master + 'ID_TRANSACTION from ST_DT_REPORT_PAY RP where (SUBS_SUMMA<>0 or DATE_SUBS>'''+DateToStr(DateTimePickerBegin.Date)+''') and ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+' order by '+sql_master+' ID_TRANSACTION';
          end
          else
          begin
            sql_master:='select distinct ID_TRANSACTION from ST_DT_REPORT_PAY where ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
          end;

        query := 'select distinct familia||'''+' '+'''||imya||'''+' '+'''||otchestvo as FIO, PS.summa, RP.*, ps.beg_date, ps.end_date, ps.beg_date as beg_propis, ps.end_date as end_propis';
        query := query +' from ST_DT_REPORT_PAY RP join st_dt_pfsub ps on ps.id_kod = rp.id_people where (SUBS_SUMMA<>0 or DATE_SUBS>'''+DateToStr(DateTimePickerBegin.Date)+''') and ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+propi+DateSubs;
        query := query+' and '+order+' ID_TRANSACTION=:ID_TRANSACTION and id_state in (2,5) and ps.summa <> 0 and ps.use_end = '''+'01.01.2050'''+'';
        query := query + ' and ((ps.beg_date between'''+DateToStr(DateTimePickerBegin.Date)+''' and '''+DateToStr(DateTimePickerEnd.Date)+''') or (ps.end_date - 1 between'''+DateToStr(DateTimePickerBegin.Date)+''' and '''+DateToStr(DateTimePickerEnd.Date)+'''))';
        query := query+' ORDER BY '+'FAMILIA,IMYA,OTCHESTVO';

        FieldNameReport:=VarArrayCreate([0,2],varVariant);
        FieldNameReport[0]:=VarArrayOf([DateTimePickerBegin.DateTime]);
        FieldNameReport[0]:=VarArrayOf([DateTimePickerEnd.DateTime]);

        //ShowMessage('sql_master = '+ sql_master);
        //ShowMessage('query = ' + query);
        LoadPackegeStudCity.LoadReportsView(self,Database.Handle,0,sql_master,query,FieldGroup,NFieldView,FieldNameReport,'RPaySubs',0, is_debug);
        //LoadPackegeStudCity.LoadReportsView(self,Database.Handle,0,sql_master,query,FieldGroup,NFieldView,FieldNameReport,'RPaySubs',0 , is_debug);
    end;
    
    if Doc_R_Rashifr=1 then
    begin
     ShowMessage('Звіт тимчасово не працює. Приносимо свої вибачення!');
     Exit;
     
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
     {   if cxCheckBoxPropi.Checked=true then
          begin
            propi:=' and  TYPESTATUS=3 ';
          end
          else
          begin
            propi:=' ';
          end;   }
      {  if cxCheckBoxDateSubs.Checked=true then
          begin
            DateSubs:=' and DATE_END_SUBS='''+DateToStr(DateTimePickerSubs.Date)+''''+' ';
          end
          else
          begin
            DateSubs:=' ';
          end;
               }

    if cxCheckBoxPropi.Checked=true then
      begin
        propi:=' and  RP.TYPESTATUS=3 ';
      end
      else
      begin
        propi:=' ';
      end;
    if cxCheckBoxDateSubs.Checked=true then
      begin
        DateSubs:=' and RP.DATE_SUBS='''+DateToStr(DateTimePickerSubs.Date)+''''+' ';
      end
      else
      begin
        DateSubs:=' ';
      end;
    //создаем мастер запрос
    if j>0 then
      begin
        sql_master:='select distinct '+sql_master + 'RP.ID_TRANSACTION from ST_DT_REPORT_PAY RP where (RP.SUBS_SUMMA<>0 or RP.DATE_SUBS>='''+DateToStr(DateTimePickerBegin.Date)+''') and RP.ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+' order by '+sql_master+' RP.ID_TRANSACTION';
      end
      else
      begin
        sql_master:='select distinct RP.ID_TRANSACTION from ST_DT_REPORT_PAY RP where RP.ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
      end;

  //  query:='select distinct RP.familia||'''+' '+'''||RP.imya||'''+' '+'''||RP.otchestvo as FIO,RP.*, PR.BEG_PROPIS, PR.END_PROPIS,PF.BEG_DATE,PF.END_DATE from ST_DT_REPORT_PAY RP, ST_DT_PROPI PR, ST_DT_PFSUB pf where PR.ID_KOD = RP.ID_PEOPLE and PF.id_kod = RP.id_people and (RP.SUBS_SUMMA<>0 or RP.DATE_SUBS>'''+DateToStr(DateTimePickerBegin.Date)+''') and RP.ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+propi+DateSubs;
    query:='select distinct RP.familia||'''+' '+'''||RP.imya||'''+' '+'''||RP.otchestvo as FIO, RP.*, PR.BEG_PROPIS, PR.END_PROPIS, PF.SUMMA, PF.BEG_DATE, PF.END_DATE';
    query := query +' from ST_DT_REPORT_PAY RP join ST_DT_PFSUB pf on PF.id_kod = RP.id_people left join ST_DT_PROPI PR on PR.ID_KOD = RP.ID_PEOPLE where (RP.SUBS_SUMMA<>0) and RP.ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+propi+DateSubs;
    query:=query+' and pf.summa<>0 and pf.id_state = 2 and use_end = '''+datetostr(strtodate('01.01.2050'))+'''';
    query:=query+' and ((beg_date <= '''+DateToStr(DateTimePickerEnd.Date)+''') and (end_date > '''+DateToStr(DateTimePickerBegin.Date)+'''))';
    query:=query+' and '+order+' RP.ID_TRANSACTION=:ID_TRANSACTION';
    query:=query+' ORDER BY '+'RP.FAMILIA,RP.IMYA,RP.OTCHESTVO';


        query:='select distinct familia||'''+' '+'''||imya||'''+' '+'''||otchestvo as FIO, ST_DT_REPORT_LIVER.*,ST_DT_REPORT_LIVER_SUBS_RASHIFR.* from st_dt_report_liver,ST_DT_REPORT_LIVER_SUBS_RASHIFR where ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
        query:= query+' and st_dt_report_liver.id_transaction=ST_DT_REPORT_LIVER_SUBS_RASHIFR.id_session and st_dt_report_liver.id_people=ST_DT_REPORT_LIVER_SUBS_RASHIFR.id_people';
        query := query + ' and (('''+DateToStr(DateTimePickerBegin.Date)+''' BETWEEN BEG_RESIDE and END_RESIDE - 1) or ('''+DateToStr(DateTimePickerEnd.Date)+''' BETWEEN BEG_RESIDE + 1 and END_RESIDE))';
        query:=query+' and '+order+' ID_TRANSACTION=:ID_TRANSACTION';
        query:=query+' ORDER BY FAMILIA,IMYA,OTCHESTVO';

        FieldNameReport:=VarArrayCreate([0,1],varVariant);
        FieldNameReport[0]:=VarArrayOf([DateTimePickerBegin.DateTime]);
        FieldNameReport[1]:=VarArrayOf([DateTimePickerEnd.DateTime]);

        LoadPackegeStudCity.LoadReportsView(self,Database.Handle,0,sql_master,query,FieldGroup,NFieldView,FieldNameReport,'RPaySubsRashifr',0);
    end;
end;

procedure TfrmMainReportsSubsPay.cxCheckBoxDateSubsClick(Sender: TObject);
begin
if cxCheckBoxDateSubs.Checked=true then
  begin
    DateTimePickerSubs.Enabled:=true;
  end
  else
  begin
    DateTimePickerSubs.Enabled:=false;
  end;
end;

procedure TfrmMainReportsSubsPay.act_debugExecute(Sender: TObject);
begin
  if is_debug then
   Begin
    Caption := 'Реест субсидируемых';
    is_debug := False;
   end
  else
   Begin
    Caption := 'Реест субсидируемых *debug';
    is_debug := True;
   end;
end;

procedure TfrmMainReportsSubsPay.FormCreate(Sender: TObject);
begin
  is_debug := false;
end;

end.
