unit ReportsPayersFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,Ibase, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, StdCtrls, Buttons, LoadPackegeStudCity,StudcityConst,
  Gauges, FIBQuery, pFIBQuery, pFIBStoredProc, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  RxMemDS, cxCheckBox, ExtCtrls,St_ser_function;

type
  TfrmReportsPayersFilter = class(TForm)
    StatusBar1: TStatusBar;
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    GroupBoxDate: TGroupBox;
    LabelDateRun: TLabel;
    DateTimePickerRun: TDateTimePicker;
    GroupBoxMainParam: TGroupBox;
    GroupBoxButton: TGroupBox;
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    ButtonMainParam: TButton;
    GroupBox3: TGroupBox;
    Gauge1: TGauge;
    StoredProc: TpFIBStoredProc;
    GroupBoxPrintFilter: TGroupBox;
    cxGridPrintGroupDBTableView1: TcxGridDBTableView;
    cxGridPrintGroupLevel1: TcxGridLevel;
    cxGridPrintGroup: TcxGrid;
    GroupBox4: TGroupBox;
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
    pFIBDataSetPrintSetup: TpFIBDataSet;
    RxMemoryDataPrintSetup: TRxMemoryData;
    DataSourcePrintSetup: TDataSource;
    CxSelectField: TcxGridDBColumn;
    CxNameField: TcxGridDBColumn;
    ButtonView: TButton;
    BitBtnClose: TBitBtn;
    RadioGroupTypePrint: TRadioGroup;
    GroupBox1: TGroupBox;
    CheckBoxZad: TCheckBox;
    CheckBoxPay: TCheckBox;
    CheckBoxOverPay: TCheckBox;
    Timer1: TTimer;
    Label1: TLabel;
    CheckBoxDateDoc: TCheckBox;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonMainParamClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure ButtonViewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DateTimePickerRunChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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
      stat:TStatusBar;
      DateR:TDate;
      ID_TRANSACTION:Variant;
      BOK,BCANCEL:TBitBtn;
      BVIEW:TButton;
      Constructor Create (InParametrs:Variant;InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;InReadTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL:TBitBtn;InBVIEW:TButton;InDate:TDate;InStat:TStatusBar);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
    end;
function ReportsPayersDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports ReportsPayersDPK;

var
  frmReportsPayersFilter: TfrmReportsPayersFilter;
  ParamReport:Variant;
  ID_TRANSACTION:Variant;
  ID_TRANS:Int64;
  report:ReportTHerited;
  TimeStart:TTime;
  Lang:Integer;
implementation

uses Math;
{$R *.dfm}

Constructor ReportTHerited.Create(InParametrs:Variant;InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;InReadTransaction:TpFIBTransaction;
                                  prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL:TBitBtn;InBVIEW:TButton;InDate:TDate;InStat:TStatusBar);
begin
  inherited Create(False);
  Parametrs:=InParametrs;
  DataBase:=InDataBase;
  Transaction:=InTransaction;
  ReadTransaction:=InReadTransaction;
  bar:=prog;
  stat:=InStat;
  DateR:=InDate;
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
  param_date_doc:Integer;
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
      MessageBox(Application.MainForm.Handle,'Ошибка при первичном отборе!','Внимание!',MB_ICONWARNING or MB_OK);
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
          StoredProcName:='ST_DT_REPORT_PAY_SUM';
          Database:=Database;
          Transaction:=Transaction;
          Transaction.StartTransaction;
          Prepare;
          ParamByName('ID_PEOPLE').Asint64:=SelectAll.FieldByName('id_people').AsVariant;
          ParamByName('IN_ID_TRANSACTION').AsInt64:=ID_TRANSACTION;
          ParamByName('IN_DATE').AsDate:=DateR;
          ParamByName('IN_FLAG_DATE_DOC').AsInteger:=Parametrs[1];
          ExecProc;
          Transaction.Commit;
        except
         on E:Exception do
          begin
           MessageBox(Application.MainForm.Handle,'Ошибка расчета при формирование отчета!','Внимание!',MB_ICONWARNING or MB_OK);
           ShowMessage('id_people = ' + vartostr(SelectAll.FieldByName('id_people').AsVariant));
           ShowMessage('in_date = ' + datetostr(DateR));
           ShowMessage(E.Message);
           Transaction.Rollback;
           raise;
          End; 
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

function ReportsPayersDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  Reports:TfrmReportsPayersFilter;
begin
  Reports:=TfrmReportsPayersFilter.Create(AOwner, DB);
end;

constructor TfrmReportsPayersFilter.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
var
  i:Integer;
begin
  inherited Create (AOwner);
  Database.Handle:=DB;
  DateTimePickerRun.DateTime:=Now;

  Lang:=ST_serLanguageIndex(Database.Handle);

  Caption:=StudcityConst.Studcity_ReportsNamePAY;

  LabelDateRun.Caption:=StudcityConst.Studcity_ReportsPayersDateRun_EX[lang];
  CheckBoxZad.Caption:=StudcityConst.Studcity_ReportsPayersZad_EX[lang];
  CheckBoxPay.Caption:=StudcityConst.Studcity_ReportsPayersPay_EX[lang];
  CheckBoxOverPay.Caption:=StudcityConst.Studcity_ReportsPayersOverPay_EX[lang];
  ButtonMainParam.Caption:=StudcityConst.Studcity_ReportsMainParametrs_EX[lang];

  GroupBoxPrintFilter.Caption:=StudcityConst.Studcity_ReportsPrintFilter_EX[lang];

  CheckBoxDateDoc.Caption:=StudcityConst.ST_PAY_CURDATE_EX[lang];

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
  RadioGroupTypePrint.Items.Add(StudcityConst.Studcity_ReportsPrintSV_EX[lang]);
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


end;

procedure TfrmReportsPayersFilter.BitBtnCancelClick(Sender: TObject);
begin
  report.Terminate;
  BitBtnOK.Enabled:=true;
  BitBtnCancel.Enabled:=false;
end;

procedure TfrmReportsPayersFilter.FormClose(Sender: TObject;
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

procedure TfrmReportsPayersFilter.ButtonMainParamClick(Sender: TObject);
begin
LoadPackegeStudCity.LoadReportsFilter(self,Database.Handle,ID_TRANS);
ButtonView.Enabled:=false;
Gauge1.Progress:=0;
end;

procedure TfrmReportsPayersFilter.BitBtnOKClick(Sender: TObject);
begin
  BitBtnOK.Enabled:=false;
  BitBtnCancel.Enabled:=true;
  ParamReport:=VarArrayCreate([0,2],varVariant);
  TimeStart:=Now;
  Timer1.Enabled:=true;
  ParamReport[0]:=1;
  if CheckBoxDateDoc.Checked=true then
    begin
      ParamReport[1]:=1;
    end
    else
    begin
      ParamReport[1]:=0;
    end;

  report:=ReportTHerited.Create(ParamReport,Database,WriteTransaction,ReadTransaction,
          Gauge1,ID_TRANSACTION,BitBtnOK,BitBtnCancel,ButtonView,DateTimePickerRun.Date,StatusBar1);
end;

procedure TfrmReportsPayersFilter.BitBtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReportsPayersFilter.ButtonViewClick(Sender: TObject);
var
  query,sql_master,order,text_sum_select,text_sum_where:String;
  i,j,nj,SumC:integer;
  Doc_R,Doc_Sv:Integer;
  FieldView,NFieldView,FieldGroup,FieldSum,FieldNameReport:Variant;
  type_report:String;
begin
//ID_TRANSACTION:=530;
if RadioGroupTypePrint.ItemIndex=0 then
  begin
    Doc_SV:=1;
    Doc_R:=0;
  end
  else
  begin
    Doc_SV:=0;
    Doc_R:=1;
  end;

if (Doc_R=0) and (Doc_Sv=0) then
  begin
    messageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_PRINT_SV_R_CONST),
         PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_ICONWARNING or MB_OK);
    Exit;
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
    if SumC=0 then
      begin
        messageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_NO_CHOOSE_SUMMA),
             PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_ICONWARNING or MB_OK);
        Exit;
      end;



if Doc_R=1 then
  begin
    type_report:='';
    text_sum_select:='';
    text_sum_where:='';
    text_sum_select:='TYPESUM';
    text_sum_where:='TYPESUM=:TYPESUM';

    if CheckBoxZad.Checked=true then
      begin
        type_report:=type_report+' ( SUMMA_OVERPAY>0';
      end;
    if CheckBoxPay.Checked=true then
      begin
        if (type_report='') then
          begin
            type_report:='( ';
          end
          else
          begin
            type_report:=type_report+' or ';
          end;
        type_report:=type_report+'SUMMA_OVERPAY=0';
      end;
    if CheckBoxOverPay.Checked=true then
      begin
        if (type_report='') then
          begin
            type_report:=type_report+'(  ';
          end
          else
          begin
            type_report:=type_report+' or ';
          end;
        type_report:=type_report+'SUMMA_OVERPAY<0';
      end;
    type_report:=type_report+')';


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
        sql_master:='select distinct '+text_sum_select+','+sql_master +'ID_TRANSACTION from ST_DT_REPORT_PAY where ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+ ' order by '+text_sum_select+','+sql_master+'ID_TRANSACTION';
      end
      else
      begin
        sql_master:='select distinct ID_TRANSACTION,'+text_sum_select+' from ST_DT_REPORT_PAY where ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+' order by '+text_sum_select;
      end;

    query:='select familia||'''+' '+'''||imya||'''+' '+'''||otchestvo as FIO,ST_DT_REPORT_PAY.* from ST_DT_REPORT_PAY where '+type_report+' and ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
    query:=query+' and '+order+' ID_TRANSACTION=:ID_TRANSACTION';
    query:=query+' and '+text_sum_where;
    query:=query+' ORDER BY '+text_sum_select+',FAMILIA,IMYA,OTCHESTVO';

    FieldNameReport:=VarArrayCreate([0,1],varVariant);
    FieldNameReport[0]:=VarArrayOf([DateTimePickerRun.DateTime]);

    LoadPackegeStudCity.LoadReportsView(self,Database.Handle,0,sql_master,query,FieldGroup,NFieldView,FieldNameReport,'RPayer',0);
  end;
//сводная
if Doc_Sv=1 then
  begin
    if (order='') and (Doc_Sv=1) then
      begin
        messageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_PRINT_SV_CONST),
             PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_ICONWARNING or MB_OK);
        Exit;
      end;
    type_report:='';
    if CheckBoxZad.Checked=true then
      begin
        type_report:=type_report+' ( SUMMA_OVERPAY>0';
      end;
    if CheckBoxPay.Checked=true then
      begin
        if (type_report='') then
          begin
            type_report:=type_report+'( ';
          end
          else
          begin
            type_report:=type_report+' or ';
          end;
        type_report:=type_report+'SUMMA_OVERPAY=0';
      end;
    if CheckBoxOverPay.Checked=true then
      begin
        if (type_report='') then
          begin
            type_report:='(  ';
          end
          else
          begin
            type_report:=type_report+' or ';
          end;
        type_report:=type_report+'SUMMA_OVERPAY<0';
      end;
    type_report:=type_report+')';

    FieldView:=VarArrayCreate([0,j+2],varVariant);
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
    FieldView[j]:=VarArrayOf(['SUMMA_PAYDATE',StudcityConst.Studcity_ReportsPrintPAYDATE,70]);
    FieldView[j+1]:=VarArrayOf(['SUMMA_PAY',StudcityConst.Studcity_ReportsPrintPAY,70]);
    FieldView[j+2]:=VarArrayOf(['SUMMA_OVERPAY',StudcityConst.Studcity_ReportsPrintOVERPAY,70]);

    query:='select '+sql_master+' sum(st_dt_report_pay.summa_paydate) as summa_paydate,sum(st_dt_report_pay.summa_pay) as summa_pay,sum(st_dt_report_pay.summa_overpay) as summa_overpay,ID_TRANSACTION from st_dt_report_pay where ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
    query:=query+' and '+type_report;
    query:=query+' group by '+sql_master+' ID_TRANSACTION';
    query:=query+ ' order by '+sql_master+' ID_TRANSACTION';

    FieldNameReport:=VarArrayCreate([0,1],varVariant);
    FieldNameReport[0]:=VarArrayOf([DateTimePickerRun.DateTime]);
    LoadPackegeStudCity.LoadReportsView(self,Database.Handle,1,query,query,FieldView,NFieldView,FieldNameReport,'SVPayer',j-1);
  end;
end;

procedure TfrmReportsPayersFilter.FormDestroy(Sender: TObject);
begin
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

procedure TfrmReportsPayersFilter.DateTimePickerRunChange(Sender: TObject);
begin
ButtonView.Enabled:=false;
end;

procedure TfrmReportsPayersFilter.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='Время формирования отчета: '+TimeToStr(Now-TimeStart);
  if ButtonView.Enabled=true then
    begin
      Timer1.Enabled:=false;
    end;
end;

end.
