unit uSt_married_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, st_common_types, st_common_funcs, StdCtrls,
  frxDesgn, cxLookAndFeelPainters, cxButtons, ComCtrls, ActnList, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCheckBox, ExtCtrls, RxMemDS, FIBDataSet, pFIBDataSet,
  cxGridTableView, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Gauges, cxContainer,
  Buttons, ibase,StudcityConst,LoadPackegeStudCity,St_ser_function;

type
  TfrmMarried = class(TForm)
    StatusBar1: TStatusBar;
    GroupBoxDate: TGroupBox;
    LabelDateRun: TLabel;
    LabelDateEnd: TLabel;
    DateTimePickerRun: TDateTimePicker;
    DateTimePickerEnd: TDateTimePicker;
    GroupBoxMainParam: TGroupBox;
    ButtonMainParam: TButton;
    GroupBoxButton: TGroupBox;
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    BitBtnClose: TBitBtn;
    cxCheckBoxPrintUkrName: TcxCheckBox;
    GroupBox3: TGroupBox;
    Gauge1: TGauge;
    GroupBoxPrintFilter: TGroupBox;
    cxGridPrintGroup: TcxGrid;
    cxGridPrintGroupDBTableView1: TcxGridDBTableView;
    CxSelectField: TcxGridDBColumn;
    CxNameField: TcxGridDBColumn;
    cxGridPrintGroupLevel1: TcxGridLevel;
    GroupBox4: TGroupBox;
    ButtonView: TButton;
    RadioGroupTypePrint: TRadioGroup;
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
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
    Timer1: TTimer;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure ButtonMainParamClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure DateTimePickerRunChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ButtonViewClick(Sender: TObject);
  private
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
  public
    res : Variant;
  end;
      ReportTHerited = class (TThread)
      Parametrs:Variant;
      DataBase:TpFIBDatabase;
      ReadTransaction:TpFIBTransaction;
      Transaction:TpFIBTransaction;
      bar:TGauge;
      pos:Integer;
      stat:TStatusBar;
      DateR,DateE:TDate;
      ID_TRANSACTION:Variant;
      BOK,BCANCEL:TBitBtn;
      BVIEW:TButton;
      Constructor Create (InParametrs:Variant;InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;InReadTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL:TBitBtn;InBVIEW:TButton;InDate,InDateE:TDate;InStat:TStatusBar);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;

  end;

function st_married(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports st_married;

var
  frmMarried: TfrmMarried;
  ParamReport:Variant;
  ID_TRANSACTION:Variant;
  report:ReportTHerited;
  lng:integer;
  TimeStart:TTime;
implementation


{$R *.dfm}



Constructor ReportTHerited.Create(InParametrs:Variant;InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;InReadTransaction:TpFIBTransaction;
                                  prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL:TBitBtn;InBVIEW:TButton;InDate,InDateE:TDate;InStat:TStatusBar);
begin
  inherited Create(False);
  Parametrs:=InParametrs;
  DataBase:=InDataBase;
  Transaction:=InTransaction;
  ReadTransaction:=InReadTransaction;
  bar:=prog;
  stat:=InStat;
  DateR:=InDate;
  DateE:=InDateE;
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
    bar.MaxValue:=100;
    SP:=TpFIBStoredProc.Create(nil);
    SP.Transaction:=Transaction;
    SP.Database:=DataBase;

    pos:=0;
    Synchronize(UpdateBar);
    //отбираем всех проживающих по типу прож/архив
    Transaction.StartTransaction;
    SP.StoredProcName:='ST_DT_REPORT_LIVERS_WORK';
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
    pos:=0;
    Synchronize(UpdateBar);

    selectAll:=TpFIBDataSet.create(nil);
    selectAll.Database:=DataBase;
    selectAll.Transaction:=ReadTransaction;
    selectAll.SQLs.SelectSQL.Add('select distinct id_people  from ST_DT_REPORT_LIVER where ID_TRANSACTION=:param_transaction');
    selectAll.ParamByName('param_transaction').AsVariant:=ID_TRANSACTION;
    selectAll.Active:=true;
    selectAll.FetchAll;
    selectAll.First;

    bar.MaxValue:=selectAll.RecordCount-8;
    for i:=0 to selectAll.RecordCount-1 do
      begin
         pos:=10+i;
         Synchronize(UpdateBar);
         With SP do
            begin
            try
            StoredProcName:='ST_DT_REPORT_LIVER_MARRIED_ADD';
            Database:=Database;
            Transaction:=Transaction;
            Transaction.StartTransaction;
            Prepare;
            ParamByName('ID_PEOPLE').Asint64:=SelectAll.FieldByName('id_people').AsVariant;
            ParamByName('ID_SESSION').AsInt64:=ID_TRANSACTION;
            ParamByName('DATE_BEG').AsDate:=DateR;
            ParamByName('DATE_END').AsDate:=DateE;
            ExecProc;
            Transaction.Commit;
          except
            Transaction.Rollback;
            MessageBox(Application.MainForm.Handle,'Ошибка расчета при формирование отчета!','Внимание!',MB_ICONWARNING or MB_OK);
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

function st_married(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  Reports :TfrmMarried;
begin
  Reports:=TfrmMarried.Create(AOwner, DB);
end;

constructor TfrmMarried.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
var
  i:Integer;
  dd,mm,yyyy:Word;
begin
  inherited Create (AOwner);
  Database.Handle:=DB;
  lng:=ST_serLanguageIndex(DB);

  DateTimePickerRun.DateTime:=Now;

 // Caption:=StudcityConst.ST_NarushReport[lng];

  LabelDateRun.Caption:=StudcityConst.ST_DATE_REPORTS_EX[lng]+'  '+StudcityConst.ST_BEGIN_EX[lng];
  LabelDateEnd.Caption:=StudcityConst.ST_END_EX[lng];

  ButtonMainParam.Caption:=StudcityConst.Studcity_ReportsMainParametrs_EX[lng];

  GroupBoxPrintFilter.Caption:=StudcityConst.Studcity_ReportsPrFilter_EX[lng];

  CxSelectField.Caption:=StudcityConst.Studcity_ReportsPrintSelChoose_EX[lng];

  CxNameField.Caption:=StudcityConst.Studcity_ReportsPrintSelect_EX[lng];

  BitBtnOK.Caption:=StudcityConst.Studcity_ACTION_OK_CONST_EX[lng];
  BitBtnCancel.Caption:=StudcityConst.Studcity_ACTION_CANCEL_CONST_EX[lng];
  BitBtnClose.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lng];
  ButtonView.Caption:=StudcityConst.Studcity_ACTION_VIEW_CONST_EX[lng];
  cxCheckBoxPrintUkrName.Properties.Caption:=StudcityConst.ST_PrintUkrName[lng];

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

  RadioGroupTypePrint.Items.Add(StudcityConst.Studcity_ReportsPrintR_EX[lng]);
  RadioGroupTypePrint.ItemIndex:=0;

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

  //Выставление дат
  DecodeDate(Date,yyyy,mm,dd);
  DateTimePickerRun.date:=EncodeDate(yyyy,mm,1);
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

procedure TfrmMarried.BitBtnCancelClick(Sender: TObject);
begin
    report.Terminate;
    BitBtnOK.Enabled:=true;
    BitBtnCancel.Enabled:=false;
end;

procedure TfrmMarried.BitBtnCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfrmMarried.ButtonMainParamClick(Sender: TObject);
var
  Style:Variant;
begin
  LoadPackegeStudCity.LoadReportsFilter(self,Database.Handle,ID_TRANSACTION);
  ButtonView.Enabled:=false;
  Gauge1.Progress:=0;
end;

procedure TfrmMarried.BitBtnOKClick(Sender: TObject);
begin
    BitBtnOK.Enabled:=false;
    BitBtnCancel.Enabled:=true;
    TimeStart:=Now;
    Timer1.Enabled:=true;
    report:=ReportTHerited.Create(ParamReport,Database,WriteTransaction,ReadTransaction,
            Gauge1,ID_TRANSACTION,BitBtnOK,BitBtnCancel,ButtonView,DateTimePickerRun.Date,
            DateTimePickerEnd.Date,StatusBar1);
end;

procedure TfrmMarried.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action:=caFree;
    if report<>nil then
      begin
        report.Terminate;
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
end;

procedure TfrmMarried.FormDestroy(Sender: TObject);
begin
    if report<>nil then
      begin
        report.Terminate;
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
end;

procedure TfrmMarried.DateTimePickerRunChange(Sender: TObject);
begin
    ButtonView.Enabled:=false;
end;

procedure TfrmMarried.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels[0].Text:='Время формирования отчета: '+TimeToStr(Now-TimeStart);
    if ButtonView.Enabled=true then
    begin
        Timer1.Enabled:=false;
    end;
end;

procedure TfrmMarried.ButtonViewClick(Sender: TObject);
var
  query,order,sql_master,sql_date_r,sql_date_prop,sql_date_reg:String;
  i,j,nj,rj,SumC, cn :integer;
  Doc_R,Doc_Sv:Integer;
  FieldView,NFieldView,FieldGroup,FieldNameReport:Variant;
  type_report,st_order:String;
begin
    Doc_R:=1;
    j:=0;
    RxMemoryDataPrintSetup.First;
    sql_master:='';


    cn :=0;

     for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
      begin
        if RxMemoryDataPrintSetup.FieldByName('RxSelectField').AsInteger=1 then
          begin
            if RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString<>'' then
              begin
                inc(cn);
              end;
          end;
        RxMemoryDataPrintSetup.Next;
      end;

    if cn>0 then
        order:='(('
    else
        order:='';

     RxMemoryDataPrintSetup.First;

    for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
      begin
        if RxMemoryDataPrintSetup.FieldByName('RxSelectField').AsInteger=1 then
          begin
            if RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString<>'' then
              begin
                inc(j);
                sql_master:=sql_master+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+',';
                if(j<>cn)  then
                    order:=order +RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+'=:'+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString +' and '
                else
                    order:=order +RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+'=:'+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString +' ';
              end;
          end;
        RxMemoryDataPrintSetup.Next;
      end;

    if cn>0 then
        order:=order+ ') or (';
    j:=0;
    sql_master:= '';

    RxMemoryDataPrintSetup.First;
    for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
      begin
        if RxMemoryDataPrintSetup.FieldByName('RxSelectField').AsInteger=1 then
          begin
            if RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString<>'' then
              begin
                inc(j);
                sql_master:=sql_master+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+',';
                if(j<>cn)  then
                     order:=order +RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+'_supr'+'=:'+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString +' and '
                else
                     order:=order +RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+'_supr'+'=:'+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString +' ';

              end;
          end;
        RxMemoryDataPrintSetup.Next;
      end;

    if cn>0 then
        order:=order+ '))';
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
            sql_master:='select distinct '+sql_master + 'ID_TRANSACTION from ST_DT_REPORT_LIVER where ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+st_order+ ' order by '+sql_master+' ID_TRANSACTION';
          end
          else
          begin
            sql_master:='select distinct ID_TRANSACTION from ST_DT_REPORT_LIVER where ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+st_order;
          end;


        query:='select familia||'''+' '+'''||imya||'''+' '+'''||otchestvo as FIO, familia_supr||'''+' '+'''||imya_supr||'''+' '+'''||otchestvo_supr as FIO_SUPR,ST_DT_REPORT_LIVER.*,st_dt_report_liver_married.* from st_dt_report_liver,st_dt_report_liver_married where ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
        query:= query+' and st_dt_report_liver.id_transaction=st_dt_report_liver_married.id_session and st_dt_report_liver.id_people=st_dt_report_liver_married.id_people'+ st_order;
        query := query + ' and (('''+DateToStr(DateTimePickerRun.Date)+''' BETWEEN BEG_RESIDE and END_RESIDE - 1) or ('''+DateToStr(DateTimePickerEnd.Date)+''' BETWEEN BEG_RESIDE + 1 and END_RESIDE))';
        query:=query+' and '+order+' and '+' ID_TRANSACTION=:ID_TRANSACTION';
        query:=query+' ORDER BY FAMILIA,IMYA,OTCHESTVO';


        FieldNameReport:=VarArrayCreate([0,1],varVariant);
        FieldNameReport[0]:=VarArrayOf([DateTimePickerRun.DateTime]);
        FieldNameReport[1]:=VarArrayOf([DateTimePickerEnd.DateTime]);

        LoadPackegeStudCity.LoadReportsView(self,Database.Handle,0,sql_master,query,FieldGroup,NFieldView,FieldNameReport,'MarriedSt',0);

      end;
end;

end.
