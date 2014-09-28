unit uPrintOborot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxLookAndFeelPainters, StdCtrls, cxButtons,LoadPackegeStudCity, FIBQuery,
  pFIBQuery, pFIBStoredProc, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxCheckBox, cxGridTableView,
  RxMemDS, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Gauges, cxContainer,
  cxRadioGroup, frxClass, ActnList;

type
  TfrmPrintOborot = class(TForm)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    GroupBoxPrintFilter: TGroupBox;
    cxGridPrintGroup: TcxGrid;
    cxGridPrintGroupDBTableView1: TcxGridDBTableView;
    CxSelectField: TcxGridDBColumn;
    CxNameField: TcxGridDBColumn;
    cxGridPrintGroupLevel1: TcxGridLevel;
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
    GroupBox3: TGroupBox;
    Gauge1: TGauge;
    GroupBox1: TGroupBox;
    cxButtonFILTER: TcxButton;
    cxButtonStart: TcxButton;
    cxButtonCancel: TcxButton;
    cxButtonExit: TcxButton;
    cxButtonView: TcxButton;
    cxRadioGroupTypeDoc: TcxRadioGroup;
    frxReport1: TfrxReport;
    ActionList1: TActionList;
    act_debug: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonExitClick(Sender: TObject);
    procedure cxButtonStartClick(Sender: TObject);
    procedure cxButtonFILTERClick(Sender: TObject);
    procedure cxButtonViewClick(Sender: TObject);
    procedure act_debugExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    is_debug : Boolean;
  public
    constructor Create(Aonwe:Tcomponent;DBH:TISC_DB_HANDLE;ID_ACCOUNT:Int64;Date_beg,Date_end:TDateTime);
    { Public declarations }
  end;
    ReportTHerited = class (TThread)
      Parametrs:Variant;
      DataBase:TpFIBDatabase;
      Transaction:TpFIBTransaction;
      bar:TGauge;
      pos:Integer;
      ID_TRANSACTION:Variant;
      BOK,BCANCEL:TcxButton;
      BVIEW:TButton;
      Constructor Create (InParametrs:Variant;InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL:TcxButton;InBVIEW:TcxButton);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
    end;
var
  frmPrintOborot: TfrmPrintOborot;
  ID_ACC:Int64;
  PDate_beg,PDate_end:TDateTime;
  ID_TRANSACTION:Variant;
  report:ReportTHerited;
  ParamReport:Variant;
implementation

{$R *.dfm}
constructor TfrmPrintOborot.Create(Aonwe:Tcomponent;DBH:TISC_DB_HANDLE;ID_ACCOUNT:Int64;Date_beg,Date_end:TDateTime);
var
  i:Integer;
begin
  inherited Create(Aonwe);
  DB.Handle:=DBH;

  pDate_beg:=Date_beg;
  pDate_end:=Date_end;
  ID_ACC:=ID_ACCOUNT;
  
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

end;

Constructor ReportTHerited.Create(InParametrs:Variant;InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                                  prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL:TcxButton;InBVIEW:TcxButton);
begin
  inherited Create(False);
  Parametrs:=InParametrs;
  DataBase:=InDataBase;
  Transaction:=InTransaction;
  bar:=prog;
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

  bar.MaxValue:=3;
  SP:=TpFIBStoredProc.Create(nil);
  SP.Transaction:=Transaction;
  SP.Database:=DataBase;

  selectAll:=TpFIBDataSet.Create(nil);
  selectAll.Transaction:=Transaction;
  selectAll.Database:=DataBase;

  selectAll.SelectSQL.Text:='select * from ST_ACCOUNTS_GET_OBOR_VED_FIRST(:IN_TR)';
  selectAll.ParamByName('IN_TR').AsVariant:=ID_TRANSACTION;
  selectAll.Active:=true;

  selectAll.FetchAll;
  bar.MaxValue:=selectAll.RecordCount-1;

  Transaction.StartTransaction;

  for i:=0 to selectAll.RecordCount-1 do
   begin
     pos:=i;
     Synchronize(UpdateBar);
      SP.StoredProcName:='ST_ACCOUNTS_GET_OBOR_VED_DATA_A';
      SP.Prepare;
      SP.ParamByName('ID_TRANSACTION').AsInt64:=ID_TRANSACTION;
      SP.ParamByName('ID_ACCOUNT').AsInt64:=Parametrs[0];
      SP.ParamByName('ID_KOD').AsInt64:=StrToInt64(selectAll.FBN('ID_PEOPLE').asString);
      try
        SP.ExecProc;
      except
        begin
          MessageBox(Application.MainForm.Handle,PChar('Ошибка при расчете печатной формы'+selectAll.FBN('ID_PEOPLE').asString),'Ошибка',MB_ICONERROR and MB_OK);
          Transaction.Rollback;
          Exit;
        end;
      end;
      selectAll.Next;
    end;
  Transaction.Commit;
//Активация кнопок
  if not Terminated then
    begin
      BOK.Enabled:=true;
      BCANCEL.Enabled:=false;
      BVIEW.Enabled:=true;
    end;
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
  Action:=caFree;
  if report<>nil then
    begin
      report.Terminate;
    end;
if ID_TRANSACTION<>0 then
  begin
    WriteTransaction.StartTransaction;
    StoredProc.StoredProcName:='ST_ACCOUNT_OLAP_OBOR_DATA_DEL';
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

procedure TfrmPrintOborot.cxButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrintOborot.cxButtonStartClick(Sender: TObject);
begin
 cxButtonStart.Enabled:=false;
 cxButtonCancel.Enabled:=true;
 cxButtonView.Enabled:=false;
 ParamReport:=VarArrayCreate([0,1],varVariant);
 ParamReport[0]:=ID_ACC;
 report:=ReportTHerited.Create(ParamReport,DB,WriteTransaction,
          Gauge1,ID_TRANSACTION,cxButtonStart,cxButtonCancel,cxButtonView);
end;

procedure TfrmPrintOborot.cxButtonFILTERClick(Sender: TObject);
begin
LoadPackegeStudCity.LoadReportsFilter(self,DB.Handle,ID_TRANSACTION);
cxButtonView.Enabled:=false;
Gauge1.Progress:=0;
end;

procedure TfrmPrintOborot.cxButtonViewClick(Sender: TObject);
var
  query,sql_master,order,text_sum_select,text_sum_where:String;
  i,j,nj,SumC:integer;
  Doc_R:Integer;
  FieldView,NFieldView,FieldGroup,FieldSum,FieldNameReport:Variant;
  type_report:String;
begin
   Doc_R:=cxRadioGroupTypeDoc.ItemIndex;

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

if Doc_R=0 then
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
        sql_master:='select distinct '+sql_master +'ID_TRANSACTION from ST_ACCOUNT_OLAP_OBOR_DATA where ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+ ' order by '+sql_master+'ID_TRANSACTION';
      end
      else
      begin
        sql_master:='select distinct ID_TRANSACTION from ST_ACCOUNT_OLAP_OBOR_DATA where ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
      end;

    query:='select * from ST_ACCOUNT_OLAP_OBOR_DATA where ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
    query:=query+' and '+order+' ID_TRANSACTION=:ID_TRANSACTION';
    query:=query+' ORDER BY FIO';

    FieldNameReport:=VarArrayCreate([0,2],varVariant);
    FieldNameReport[0]:=VarArrayOf([PDate_beg]);
    FieldNameReport[1]:=VarArrayOf([PDate_end]);
    LoadPackegeStudCity.LoadReportsView(self,DB.Handle,0,sql_master,query,FieldGroup,NFieldView,FieldNameReport,'ACC_OBOR',0);
  end;
//сводная
if Doc_R=1 then
  begin
    if (order='') and (Doc_R=1) then
      begin
        messageBox(Handle,PChar('Не вибран жоден з параметрів групування'),
             PChar('Увага!'),MB_ICONWARNING or MB_OK);
        Exit;
      end;

    FieldView:=VarArrayCreate([0,j+6],varVariant);
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
    FieldView[j]:=VarArrayOf(['CUR_NACH','CUR_NACH',70]);
    FieldView[j+1]:=VarArrayOf(['CUR_PAY','CUR_PAY',70]);
    FieldView[j+2]:=VarArrayOf(['SB_SUB','SB_SUB',70]);
    FieldView[j+3]:=VarArrayOf(['IN_NACH_DOLG','IN_NACH_DOLG',70]);
    FieldView[j+4]:=VarArrayOf(['IN_NACH_PERE','IN_NACH_PERE',70]);
    FieldView[j+5]:=VarArrayOf(['OUT_NACH_DOLG','OUT_NACH_DOLG',70]);
    FieldView[j+6]:=VarArrayOf(['OUT_NACH_PERE','OUT_NACH_PERE',70]);

    query:='select '+sql_master+' sum(CUR_NACH) as CUR_NACH,sum(CUR_PAY) as CUR_PAY,sum(IN_NACH_DOLG) as IN_NACH_DOLG,';
    query:=query+' sum(IN_NACH_PERE) as IN_NACH_PERE,sum(OUT_NACH) as OUT_NACH,SUM(SB_SUB) as SB_SUB,';
    query:=query+' sum(OUT_NACH_DOLG) as OUT_NACH_DOLG,sum(OUT_NACH_PERE) as OUT_NACH_PERE,ID_TRANSACTION from ST_ACCOUNT_OLAP_OBOR_DATA where ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
    query:=query+' group by '+sql_master+' ID_TRANSACTION';
    query:=query+ ' order by '+sql_master+' ID_TRANSACTION';

    FieldNameReport:=VarArrayCreate([0,2],varVariant);
    FieldNameReport[0]:=VarArrayOf([PDate_beg]);
    FieldNameReport[1]:=VarArrayOf([PDate_end]);
    LoadPackegeStudCity.LoadReportsView(self,DB.Handle,1,query,query,FieldView,NFieldView,FieldNameReport,'SVACC_OBOR',j-1);
  end;
end;

procedure TfrmPrintOborot.act_debugExecute(Sender: TObject);
begin
  if is_debug then
   Begin
    Caption := 'Підготовка оборотної відомості до друку';
    is_debug := false;
   end
  else
   begin
    Caption := 'Підготовка оборотної відомості до друку *debug';
    is_debug := True;
   end;
end;

procedure TfrmPrintOborot.FormShow(Sender: TObject);
begin
  is_debug := false;
end;

end.
