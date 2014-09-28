unit ReportsPayOnDayMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Gauges, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox,
  ExtCtrls, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc,
  RxMemDS, FIBDataSet, pFIBDataSet, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid,IBase,StudcityConst,LoadPackegeStudCity,
  ComCtrls, cxContainer,St_ser_function;

type
  TfrmReportsPayOnDayMain = class(TForm)
    GroupBox3: TGroupBox;
    Gauge1: TGauge;
    GroupBoxMainParam: TGroupBox;
    ButtonMainParam: TButton;
    GroupBoxButton: TGroupBox;
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    BitBtnClose: TBitBtn;
    GroupBoxPrintFilter: TGroupBox;
    cxGridPrintGroup: TcxGrid;
    cxGridPrintGroupDBTableView1: TcxGridDBTableView;
    CxSelectField: TcxGridDBColumn;
    CxNameField: TcxGridDBColumn;
    cxGridPrintGroupLevel1: TcxGridLevel;
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
    DataSourcePrintSetup: TDataSource;
    pFIBDataSetPrintSetup: TpFIBDataSet;
    RxMemoryDataPrintSetup: TRxMemoryData;
    ReadTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    Timer1: TTimer;
    GroupBox4: TGroupBox;
    ButtonView: TButton;
    RadioGroupTypePrint: TRadioGroup;
    GroupBoxDate: TGroupBox;
    LabelDateRun: TLabel;
    DateTimePickerBegin: TDateTimePicker;
    DateTimePickerEnd: TDateTimePicker;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    cxCheckBoxSm: TcxCheckBox;
    cxCheckBoxSch: TcxCheckBox;
    Label1: TLabel;
    procedure ButtonMainParamClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure ButtonViewClick(Sender: TObject);
    procedure DateTimePickerBeginChange(Sender: TObject);
    procedure DateTimePickerEndChange(Sender: TObject);
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

function ReportsPayOnDayDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports ReportsPayOnDayDPK;

var
  frmReportsPayOnDayMain: TfrmReportsPayOnDayMain;
  ParamReport:Variant;
  ID_TRANSACTION:Variant;
  report:ReportTHerited;
  TimeStart:TTime;
  Lang:Integer;

implementation

uses DateUtils;

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
///  bar.MaxValue:=100;
  SP:=TpFIBStoredProc.Create(nil);
  SP.Transaction:=Transaction;
  SP.Database:=DataBase;

//  pos:=2;
//  Synchronize(UpdateBar);
  //отбираем всех проживающих по типу прож/архив
  Transaction.StartTransaction;
  SP.StoredProcName:='ST_DT_REPORT_PAY_ON_DATE_WORK';
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
  selectAll.SQLs.SelectSQL.Add('select *  from ST_DT_REPORT_PAY_ON_DATE where ID_TRANSACTION=:param_transaction');
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
          StoredProcName:='ST_DT_REPORT_PAY_DOC_PROV_GEN';
          Database:=Database;
          Transaction:=Transaction;
          Transaction.StartTransaction;
          Prepare;
          ParamByName('ID_PEOPLE').Asint64:=SelectAll.FieldByName('id_people').AsVariant;
          ParamByName('ID_SESSION').AsInt64:=ID_TRANSACTION;
          ParamByName('DATE_BEG').AsDate:=DateR;
          ParamByName('DATE_END').AsDate:=DateEnd;

          ExecProc;
          Transaction.Commit;
        except
          Transaction.Rollback;
          messageBox(0,PChar('Ошибка при выполнении процедуры'+#13+'ST_DT_REPORT_PAY_DOC_PROV_GEN'+#13+'ID_KOD='+VarToStr(SelectAll.FieldByName('id_people').AsVariant)),'Ошибка!!!',MB_OK);
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

function ReportsPayOnDayDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  Reports:TfrmReportsPayOnDayMain;
begin
  Reports:=TfrmReportsPayOnDayMain.Create(AOwner, DB);
end;

constructor TfrmReportsPayOnDayMain.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
var
  i:Integer;
  dd,mm,yyyy:Word;
begin
  inherited Create (AOwner);
  Database.Handle:=DB;

  Lang:=ST_serLanguageIndex(DB);

{  Caption:=StudcityConst.Studcity_ReportsNameLivers;

  ComboBoxStatus.ItemIndex:=0;

  cxCheckBoxStatus.Properties.Caption:=StudcityConst.Studcity_ReportsLiversStatus;
  CheckBoxUkr.Caption:=StudcityConst.Studcity_ReportsLiversUkr;
  CheckBoxInostr.Caption:=StudcityConst.Studcity_ReportsLiversInostr;

  cxCheckBoxDateRog.Properties.Caption:=StudcityConst.Studcity_ReportsLiversOgDateRoj;
  cxCheckBoxDateReg.Properties.Caption:=StudcityConst.Studcity_ReportsLiversOgDateReg;
  cxCheckBoxDateProp.Properties.Caption:=StudcityConst.Studcity_ReportsLiversOgDateProp;
  cxCheckBoxDateRogNo.Properties.Caption:=StudcityConst.Studcity_ReportsLiversDateNo;
  cxCheckBoxDateRegNo.Properties.Caption:=StudcityConst.Studcity_ReportsLiversDateNo;
  cxCheckBoxDatePropNo.Properties.Caption:=StudcityConst.Studcity_ReportsLiversDateNo;

  LabelRojBeg.Caption:=StudcityConst.Studcity_ReportsBegin;
  LabelRegBeg.Caption:=StudcityConst.Studcity_ReportsBegin;
  LabelPropBeg.Caption:=StudcityConst.Studcity_ReportsBegin;
  LabelPropEnd.Caption:=StudcityConst.Studcity_ReportsEnd;
  LabelRegEnd.Caption:=StudcityConst.Studcity_ReportsEnd;
  LabelRojEnd.Caption:=StudcityConst.Studcity_ReportsEnd;
}
  ButtonMainParam.Caption:=StudcityConst.Studcity_ReportsMainParametrs;

  GroupBoxPrintFilter.Caption:=StudcityConst.Studcity_ReportsPrintFilter_EX[lang];

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
  RadioGroupTypePrint.Items.Add(Studcity_ReportsPrintSVPAYSM_EX[lang]);
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

 DecodeDate(Date,yyyy,mm,dd);

 DateTimePickerBegin.DateTime:=EncodeDate(yyyy,mm,1);
 DateTimePickerEnd.DateTime:=Date;
end;

procedure TfrmReportsPayOnDayMain.ButtonMainParamClick(Sender: TObject);
begin
LoadPackegeStudCity.LoadReportsFilter(self,Database.Handle,ID_TRANSACTION);
ButtonView.Enabled:=false;
Gauge1.Progress:=0;
end;

procedure TfrmReportsPayOnDayMain.FormClose(Sender: TObject;
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
    StoredProc.StoredProcName:='ST_DT_REPORT_PAY_ON_DAY_DELETE';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_session').Value:=ID_TRANSACTION;
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

procedure TfrmReportsPayOnDayMain.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmReportsPayOnDayMain.BitBtnCancelClick(Sender: TObject);
begin
  report.Terminate;
  BitBtnOK.Enabled:=true;
  BitBtnCancel.Enabled:=false;
  DateTimePickerBegin.Enabled:=true;
  DateTimePickerEnd.Enabled:=true;
end;

procedure TfrmReportsPayOnDayMain.BitBtnOKClick(Sender: TObject);
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

procedure TfrmReportsPayOnDayMain.ButtonViewClick(Sender: TObject);
var
  query,sql_master,sql_master_add,order,text_sum_select,text_sum_where:String;
  i,j,nj,SumC:integer;
  Doc_R,Doc_Sv,Doc_SvSM:Integer;
  FieldView,NFieldView,FieldGroup,FieldSum,FieldNameReport:Variant;
  type_report:String;
begin
if RadioGroupTypePrint.ItemIndex=0 then
  begin
    Doc_SV:=1;
    Doc_R:=0;
    Doc_SvSM:=0;
  end;
if RadioGroupTypePrint.ItemIndex=1 then
  begin
    Doc_SV:=0;
    Doc_R:=1;
    Doc_SvSM:=0;
  end;
if RadioGroupTypePrint.ItemIndex=2 then
  begin
    Doc_SV:=0;
    Doc_R:=0;
    Doc_SvSM:=1;
  end;

if (Doc_R=0) and (Doc_Sv=0) and  (Doc_SvSM=0) then
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
if cxCheckBoxSm.Checked=true then
  begin
    sql_master:='SMETA_KOD,RAZD_KOD,ST_KOD,KEKV_KOD,'+sql_master;
    order:=' SMETA_KOD=:SMETA_KOD and RAZD_KOD=:RAZD_KOD and ST_KOD=:ST_KOD and KEKV_KOD=:KEKV_KOD and '+order;
    inc(j);
  end;
if cxCheckBoxSch.Checked=true then
  begin
    sql_master:='SCH_NUMBER_DB,SCH_NUMBER_KD,'+sql_master;
    order:=' SCH_NUMBER_DB=:SCH_NUMBER_DB and SCH_NUMBER_KD=:SCH_NUMBER_KD and'+order;
    inc(j);
  end;
if Doc_R=1 then
  begin
    RxMemoryDataPrintSetup.First;
    if j>=0 then
      begin
        FieldGroup:=VarArrayCreate([0,j-1],varVariant);
        NFieldView:=VarArrayCreate([0,RxMemoryDataPrintSetup.RecordCount+2-j-1],varVariant);
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
        sql_master_add:=' order by '+sql_master+'ID_TRANSACTION';
        sql_master:='select distinct '+sql_master +'ID_TRANSACTION from st_dt_report_pay_doc_prov,st_dt_report_pay_on_date where st_dt_report_pay_doc_prov.id_session=st_dt_report_pay_on_date.id_transaction and st_dt_report_pay_doc_prov.id_people=st_dt_report_pay_on_date.id_people and ID_TRANSACTION='+IntToStr(ID_TRANSACTION);

      end
      else
      begin
        sql_master:='select distinct ID_TRANSACTION from st_dt_report_pay_doc_prov,st_dt_report_pay_on_date where st_dt_report_pay_doc_prov.id_session=st_dt_report_pay_on_date.id_transaction and ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
        sql_master_add:='';
      end;

    query:='select familia||'''+' '+'''||imya||'''+' '+'''||otchestvo as FIO,st_dt_report_pay_doc_prov.*,st_dt_report_pay_on_date.* from st_dt_report_pay_doc_prov,st_dt_report_pay_on_date ';
    query:=query+'where st_dt_report_pay_doc_prov.id_people=st_dt_report_pay_on_date.id_people and st_dt_report_pay_doc_prov.id_session=st_dt_report_pay_on_date.id_transaction and  ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
    query:=query+' and '+order+' ID_TRANSACTION=:ID_TRANSACTION';

    FieldNameReport:=VarArrayCreate([0,3],varVariant);
    FieldNameReport[0]:=VarArrayOf([DateTimePickerBegin.DateTime]);
    FieldNameReport[1]:=VarArrayOf([DateTimePickerEnd.DateTime]);
    FieldNameReport[2]:=VarArrayOf([ID_TRANSACTION]);    

    LoadPackegeStudCity.LoadReportsViewPayOnDay(self,Database.Handle,0,sql_master,sql_master_add,query,FieldGroup,NFieldView,FieldNameReport,'RPayer',0);
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

    FieldView:=VarArrayCreate([0,j],varVariant);
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
    FieldView[j]:=VarArrayOf(['SUMMA_PAY','Сумма поступлений',70]);
    FieldNameReport:=VarArrayCreate([0,2],varVariant);
    FieldNameReport[0]:=VarArrayOf([DateTimePickerBegin.DateTime]);
    FieldNameReport[1]:=VarArrayOf([DateTimePickerEnd.DateTime]);

    query:='select '+sql_master+' sum(ST_DT_REPORT_PAY_DOC_PROV.summa) as summa_pay,ID_TRANSACTION from st_dt_report_pay_doc_prov,st_dt_report_pay_on_date ';
    query:=query+' where st_dt_report_pay_doc_prov.id_people=st_dt_report_pay_on_date.id_people and st_dt_report_pay_doc_prov.id_session=st_dt_report_pay_on_date.id_transaction ';
    query:=query+' and ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
    query:=query+' group by '+sql_master+' ID_TRANSACTION';
    query:=query+ ' order by '+sql_master+' ID_TRANSACTION';

    LoadPackegeStudCity.LoadReportsView(self,Database.Handle,1,query,query,FieldView,NFieldView,FieldNameReport,'SVPayDay',j-1);
  end;

//сводная по ист. финансирования
if Doc_SvSM=1 then
  begin
    FieldView:=VarArrayCreate([0,4],varVariant);
    FieldView[0]:=VarArrayOf(['SMETA_KOD','',1]);
    FieldView[1]:=VarArrayOf(['RZST','',1]);
    FieldView[2]:=VarArrayOf(['SCH_NUMBER_DB','',1]);
    FieldView[3]:=VarArrayOf(['SCH_NUMBER_KD','',1]);
    FieldView[4]:=VarArrayOf(['SUMMA_PAY','Сумма поступлений',70]);

    sql_master:='smeta_kod||'''+'.'+'''||smeta_title as smeta_kod,razd_kod||'''+'.'+'''||st_kod||'''+'.'+'''||KEKV_KOD as RZST,sch_number_db,sch_number_kd';


    FieldNameReport:=VarArrayCreate([0,2],varVariant);
    FieldNameReport[0]:=VarArrayOf([DateTimePickerBegin.DateTime]);
    FieldNameReport[1]:=VarArrayOf([DateTimePickerEnd.DateTime]);

    query:='select '+sql_master+' ,sum(summa) as summa_pay,ID_TRANSACTION from st_dt_report_pay_doc_prov,st_dt_report_pay_on_date ';
    query:=query+' where st_dt_report_pay_doc_prov.id_people=st_dt_report_pay_on_date.id_people and st_dt_report_pay_doc_prov.id_session=st_dt_report_pay_on_date.id_transaction ';
    query:=query+' and ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
    query:=query+' group by smeta_kod,smeta_title,razd_kod,st_kod,KEKV_KOD,sch_number_db,sch_number_kd,ID_TRANSACTION';
    query:=query+ ' order by  smeta_kod,smeta_title,razd_kod,st_kod,KEKV_KOD,sch_number_db,sch_number_kd,ID_TRANSACTION';

//    Memo1.Lines.add(query);
    LoadPackegeStudCity.LoadReportsView(self,Database.Handle,1,query,query,FieldView,null,FieldNameReport,'SVPayDaySM',j-1);
  end;



end;

procedure TfrmReportsPayOnDayMain.DateTimePickerBeginChange(
  Sender: TObject);
begin
  ButtonView.Enabled:=false;
  Gauge1.Progress:=0;
end;

procedure TfrmReportsPayOnDayMain.DateTimePickerEndChange(Sender: TObject);
begin
  ButtonView.Enabled:=false;
  Gauge1.Progress:=0;
end;

procedure TfrmReportsPayOnDayMain.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='Время формирования отчета: '+TimeToStr(Now-TimeStart);
  if ButtonView.Enabled=true then
    begin
      Timer1.Enabled:=false;
      DateTimePickerBegin.Enabled:=true;
      DateTimePickerEnd.Enabled:=true;
      report.Destroy;
    end;
end;

end.
