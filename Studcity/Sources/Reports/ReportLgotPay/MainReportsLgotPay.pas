unit MainReportsLgotPay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,LoadPackegeStudCity,StudcityConst,IBase, ComCtrls, StdCtrls,
  Buttons, Gauges, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, cxClasses, RxMemDS, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, cxContainer,St_ser_function;

type
  TfrmMainReportsLgotPay = class(TForm)
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
    procedure BitBtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure ButtonMainParamClick(Sender: TObject);
    procedure ButtonViewClick(Sender: TObject);
    procedure cxCheckBoxDateSubsClick(Sender: TObject);
  private
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
      Constructor Create (InParametrs:Variant;InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;InReadTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL:TBitBtn;InBVIEW:TButton;InDate,INDateEnd:TDate);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
    end;

function ReportsLgotPayDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports ReportsLgotPayDPK;
var
  frmMainReportsLgotPay: TfrmMainReportsLgotPay;
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
  SP:TpFIBStoredProc;
  i:Integer;
  selectAll:TpFIBDataSet;
begin
//  bar.MaxValue:=100;
  SP:=TpFIBStoredProc.Create(nil);
  SP.Transaction:=Transaction;
  SP.Database:=DataBase;

//  pos:=2;
//  Synchronize(UpdateBar);
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
//  pos:=2;
//  Synchronize(UpdateBar);
//начинаем рассчет сумм, блин как же это долго
  selectAll:=TpFIBDataSet.create(nil);
  selectAll.Database:=DataBase;
  selectAll.Transaction:=ReadTransaction;
  selectAll.SQLs.SelectSQL.Add('select *  from ST_DT_REPORT_PAY where ID_TRANSACTION=:param_transaction');
  selectAll.ParamByName('param_transaction').AsVariant:=ID_TRANSACTION;
  selectAll.Active:=true;
  selectAll.FetchAll;
  selectAll.First;
  bar.MaxValue:=selectAll.RecordCount;
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
//Активация кнопок
  if not Terminated then
    begin
      BOK.Enabled:=true;
      BCANCEL.Enabled:=false;
      BVIEW.Enabled:=true;
    end;
  selectAll.Destroy;
end;

procedure ReportTHerited.UpdateBar;
begin
  bar.Progress:=pos;
end;


destructor ReportTHerited.Destroy;
begin
  Inherited destroy;
end;


function ReportsLgotPayDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  Reports:TfrmMainReportsLgotPay;
begin
  Reports:=TfrmMainReportsLgotPay.Create(AOwner, DB);
//  Reports.ShowModal;
//  Reports.Free;
end;


constructor TfrmMainReportsLgotPay.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
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
//  RadioGroupTypePrint.Items.Add(StudcityConst.Studcity_ReportsPrintSV);
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


procedure TfrmMainReportsLgotPay.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMainReportsLgotPay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  if report<>nil then
    begin
      report.Terminate;
    end;
if ID_TRANSACTION<>0 then
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
end;

procedure TfrmMainReportsLgotPay.BitBtnCancelClick(Sender: TObject);
begin
  report.Terminate;
  BitBtnOK.Enabled:=true;
  BitBtnCancel.Enabled:=false;
  DateTimePickerBegin.Enabled:=true;
  DateTimePickerEnd.Enabled:=true;
end;

procedure TfrmMainReportsLgotPay.BitBtnOKClick(Sender: TObject);
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

procedure TfrmMainReportsLgotPay.ButtonMainParamClick(Sender: TObject);
begin
LoadPackegeStudCity.LoadReportsFilter(self,Database.Handle,ID_TRANSACTION);
ButtonView.Enabled:=false;
Gauge1.Progress:=0;
end;

procedure TfrmMainReportsLgotPay.ButtonViewClick(Sender: TObject);
var
  query,sql_master,order,text_sum_select,text_sum_where:String;
  i,j,nj,SumC:integer;
  FieldView,NFieldView,FieldGroup,FieldSum,FieldNameReport:Variant;
  type_report,propi,DateSubs:String;

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
        sql_master:='select distinct '+sql_master + 'ID_TRANSACTION from ST_DT_REPORT_PAY where (SUBS_SUMMA<>0 or DATE_SUBS>'''+DateToStr(DateTimePickerBegin.Date)+''') and ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+' order by '+sql_master+' ID_TRANSACTION';
      end
      else
      begin
        sql_master:='select distinct ID_TRANSACTION from ST_DT_REPORT_PAY where ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
      end;

    query:='select familia||'''+' '+'''||imya||'''+' '+'''||otchestvo as FIO,ST_DT_REPORT_PAY.* from ST_DT_REPORT_PAY where (SUBS_SUMMA<>0 or DATE_SUBS>'''+DateToStr(DateTimePickerBegin.Date)+''') and ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+propi+DateSubs;
    query:=query+' and '+order+' ID_TRANSACTION=:ID_TRANSACTION';
    query:=query+' ORDER BY '+'FAMILIA,IMYA,OTCHESTVO';

    FieldNameReport:=VarArrayCreate([0,2],varVariant);
    FieldNameReport[0]:=VarArrayOf([DateTimePickerBegin.DateTime]);
    FieldNameReport[0]:=VarArrayOf([DateTimePickerEnd.DateTime]);

    LoadPackegeStudCity.LoadReportsView(self,Database.Handle,0,sql_master,query,FieldGroup,NFieldView,FieldNameReport,'RPaySubs',0);
end;

procedure TfrmMainReportsLgotPay.cxCheckBoxDateSubsClick(Sender: TObject);
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

end.
