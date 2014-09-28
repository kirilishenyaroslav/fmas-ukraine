unit MainReportLivers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, ExtCtrls, StdCtrls,
  RxMemDS, FIBDataSet, pFIBDataSet, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Buttons, Gauges,Ibase, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase,StudcityConst,LoadPackegeStudCity,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,St_ser_function;

type
  TfrmMainFormReportsLivers = class(TForm)
    StatusBar1: TStatusBar;
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
    pFIBDataSetPrintSetup: TpFIBDataSet;
    RxMemoryDataPrintSetup: TRxMemoryData;
    DataSourcePrintSetup: TDataSource;
    GroupBox4: TGroupBox;
    ButtonView: TButton;
    RadioGroupTypePrint: TRadioGroup;
    GroupBox3: TGroupBox;
    Gauge1: TGauge;
    GroupBoxButton: TGroupBox;
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    BitBtnClose: TBitBtn;
    GroupBoxMainParam: TGroupBox;
    ButtonMainParam: TButton;
    GroupBox1: TGroupBox;
    CheckBoxUkr: TCheckBox;
    CheckBoxInostr: TCheckBox;
    GroupBox2: TGroupBox;
    GroupBox5: TGroupBox;
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    ReadTransaction: TpFIBTransaction;
    DateTimePickerDateRojEnd: TDateTimePicker;
    DateTimePickerDateRegEnd: TDateTimePicker;
    DateTimePickerDatePropEnd: TDateTimePicker;
    DateTimePickerDateRojBeg: TDateTimePicker;
    DateTimePickerDateRegBeg: TDateTimePicker;
    DateTimePickerDatePropBeg: TDateTimePicker;
    LabelRojBeg: TLabel;
    LabelRegBeg: TLabel;
    LabelPropBeg: TLabel;
    LabelPropEnd: TLabel;
    LabelRegEnd: TLabel;
    LabelRojEnd: TLabel;
    ComboBoxStatus: TComboBox;
    cxCheckBoxDateRog: TcxCheckBox;
    cxCheckBoxDateReg: TcxCheckBox;
    cxCheckBoxDateProp: TcxCheckBox;
    Timer1: TTimer;
    cxCheckBoxStatus: TcxCheckBox;
    cxCheckBoxDateRogNo: TcxCheckBox;
    cxCheckBoxDateRegNo: TcxCheckBox;
    cxCheckBoxDatePropNo: TcxCheckBox;
    GroupBox6: TGroupBox;
    cxCheckBoxOrder: TcxCheckBox;
    cxCheckBoxPrintUkrName: TcxCheckBox;
    cxCheckBoxDateRegHist: TcxCheckBox;
    LabelDateRegBeg: TLabel;
    DateTimePickerDateRegHistBeg: TDateTimePicker;
    LabelDateRegEnd: TLabel;
    DateTimePickerDateRegHistEnd: TDateTimePicker;
    CheckBox_date_reside: TcxCheckBox;
    Label1: TLabel;
    DateTimePicker_beg_reside: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker_end_reside: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure ButtonMainParamClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure ButtonViewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxCheckBoxStatusClick(Sender: TObject);
    procedure cxCheckBoxDateRogClick(Sender: TObject);
    procedure cxCheckBoxDateRegClick(Sender: TObject);
    procedure cxCheckBoxDatePropClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
  public
    { Public declarations }
  end;
    ReportTHerited = class (TThread)
      Parametrs:Variant;
      DataBase:TpFIBDatabase;
      Transaction:TpFIBTransaction;
      bar:TGauge;
      pos:Integer;
      ID_TRANSACTION:Variant;
      BOK,BCANCEL:TBitBtn;
      BVIEW:TButton;
      Constructor Create (InParametrs:Variant;InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL:TBitBtn;InBVIEW:TButton);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
    end;

function ReportsLiversDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports ReportsLiversDPK;

var
  frmMainFormReportsLivers: TfrmMainFormReportsLivers;
  ParamReport:Variant;
  ID_TRANSACTION:Variant;
  report:ReportTHerited;
  TimeStart:TTime;
  Lang:Integer;
implementation

uses Math;

{$R *.dfm}

Constructor ReportTHerited.Create(InParametrs:Variant;InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                                  prog:TGauge;ID_TRAN:Variant;InBOK,InBCANCEL:TBitBtn;InBVIEW:TButton);
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
begin

  bar.MaxValue:=3;
  SP:=TpFIBStoredProc.Create(nil);
  SP.Transaction:=Transaction;
  SP.Database:=DataBase;

  Transaction.StartTransaction;
  pos:=1;
  Synchronize(UpdateBar);
  //отбираем всех проживающих по типу прож/архив
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
  pos:=2;
  Synchronize(UpdateBar);
//јктиваци€ кнопок
  if not Terminated then
    begin
      BOK.Enabled:=true;
      BCANCEL.Enabled:=false;
      BVIEW.Enabled:=true;
    end;
  pos:=3;
  Synchronize(UpdateBar);
end;

procedure ReportTHerited.UpdateBar;
begin
  bar.Progress:=pos;
end;


destructor ReportTHerited.Destroy;
begin
  Inherited destroy;
end;

function ReportsLiversDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  Reports:TfrmMainFormReportsLivers;
begin
  Reports:=TfrmMainFormReportsLivers.Create(AOwner, DB);
end;

constructor TfrmMainFormReportsLivers.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
var
  i:Integer;
  dd,mm,yyyy:Word;
begin
  inherited Create (AOwner);
  Database.Handle:=DB;

  Lang:=ST_serLanguageIndex(Database.Handle);

  Caption:=StudcityConst.Studcity_ReportsNameLivers;

  ComboBoxStatus.ItemIndex:=0;

  cxCheckBoxStatus.Properties.Caption:=StudcityConst.Studcity_ReportsLiversStatus_EX[lang];
  CheckBoxUkr.Caption:=StudcityConst.Studcity_ReportsLiversUkr_EX[lang];
  CheckBoxInostr.Caption:=StudcityConst.Studcity_ReportsLiversInostr_EX[lang];

  cxCheckBoxDateRog.Properties.Caption:=StudcityConst.Studcity_ReportsLiversOgDateRoj_EX[lang];
  cxCheckBoxDateReg.Properties.Caption:=StudcityConst.Studcity_ReportsLiversOgDateReg_EX[lang];
  cxCheckBoxDateProp.Properties.Caption:=StudcityConst.Studcity_ReportsLiversOgDateProp_EX[lang];
  cxCheckBoxDateRogNo.Properties.Caption:=StudcityConst.Studcity_ReportsLiversDateNo_EX[lang];
  cxCheckBoxDateRegNo.Properties.Caption:=StudcityConst.Studcity_ReportsLiversDateNo_EX[lang];
  cxCheckBoxDatePropNo.Properties.Caption:=StudcityConst.Studcity_ReportsLiversDateNo_EX[lang];
  cxCheckBoxOrder.Properties.Caption:=StudcityConst.ST_OrderOtPrint_EX[lang];
  cxCheckBoxPrintUkrName.Properties.Caption:=StudcityConst.ST_PrintUkrName[lang];

  cxCheckBoxDateRegHist.Properties.Caption := StudcityConst.Studcity_ReportsLiversOgDateRegHist_EX[lang];
  CheckBox_date_reside.Properties.Caption  := StudcityConst.Studcity_ReportsLiversReSide[lang];
  //'ѕо дат≥ рееЇстрац≥њ';

  LabelRojBeg.Caption:=StudcityConst.Studcity_ReportsBegin_EX[lang];
  LabelRegBeg.Caption:=StudcityConst.Studcity_ReportsBegin_EX[lang];
  LabelPropBeg.Caption:=StudcityConst.Studcity_ReportsBegin_EX[lang];
  LabelPropEnd.Caption:=StudcityConst.Studcity_ReportsEnd_EX[lang];
  LabelRegEnd.Caption:=StudcityConst.Studcity_ReportsEnd_EX[lang];
  LabelRojEnd.Caption:=StudcityConst.Studcity_ReportsEnd_EX[lang];
  LabelDateRegBeg.Caption:=StudcityConst.Studcity_ReportsBegin_EX[lang];
  LabelDateRegEnd.Caption:=StudcityConst.Studcity_ReportsEnd_EX[lang];
  Label1.Caption := StudcityConst.Studcity_ReportsBegin_EX[lang];
  Label2.Caption := StudcityConst.Studcity_ReportsEnd_EX[lang];
  
  ButtonMainParam.Caption:=StudcityConst.Studcity_ReportsMainParametrs_EX[lang];

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
 //загружаем даты по умолчанию
 //дата рождени€
  DateTimePickerDateRojBeg.DateTime:=StrToDate('01.01.1900');
  DateTimePickerDateRojEnd.DateTime:=StrToDate('01.01.2050');
 //дата регистрации
  DecodeDate(Now,yyyy,mm,dd);
  if mm>=09 then
    begin
      DateTimePickerDateRegBeg.DateTime:=EncodeDate(yyyy,09,01);
      DateTimePickerDateRegEnd.DateTime:=EncodeDate(yyyy+1,07,01);      
    end
    else
    begin
      DateTimePickerDateRegBeg.DateTime:=EncodeDate(yyyy-1,09,01);
      DateTimePickerDateRegEnd.DateTime:=EncodeDate(yyyy,07,01);
    end;

  DateTimePicker_beg_reside.date := DateTimePickerDateRegBeg.date;
  DateTimePicker_end_reside.date := DateTimePickerDateRegEnd.date;

  //прописка
  DateTimePickerDatePropBeg.DateTime:=Now;
  DateTimePickerDatePropEnd.DateTime:=Now;

  DateTimePickerDateRegHistBeg.DateTime:=Now;
  DateTimePickerDateRegHistEnd.DateTime:=Now;

end;


procedure TfrmMainFormReportsLivers.FormClose(Sender: TObject;
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

procedure TfrmMainFormReportsLivers.BitBtnCancelClick(Sender: TObject);
begin
  report.Terminate;
  BitBtnOK.Enabled:=true;
  BitBtnCancel.Enabled:=false;
  Timer1.Enabled:=false;
end;

procedure TfrmMainFormReportsLivers.ButtonMainParamClick(Sender: TObject);
begin
LoadPackegeStudCity.LoadReportsFilter(self,Database.Handle,ID_TRANSACTION);
ButtonView.Enabled:=false;
Gauge1.Progress:=0;
end;

procedure TfrmMainFormReportsLivers.BitBtnOKClick(Sender: TObject);
begin
 BitBtnOK.Enabled:=false;
 BitBtnCancel.Enabled:=true;
 ParamReport:=VarArrayCreate([0,1],varVariant);
 ParamReport[0]:=1;
 TimeStart:=Now;
 Timer1.Enabled:=true;
 report:=ReportTHerited.Create(ParamReport,Database,WriteTransaction,
          Gauge1,ID_TRANSACTION,BitBtnOK,BitBtnCancel,ButtonView);
end;

procedure TfrmMainFormReportsLivers.BitBtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainFormReportsLivers.ButtonViewClick(Sender: TObject);
var
  query,order,sql_master,sql_date_r,sql_date_prop,sql_date_reg,sql_date_reg_hist, sql_date_reside : String;
  i,j,nj,rj,SumC:integer;
  Doc_R,Doc_Sv:Integer;
  FieldView,NFieldView,FieldGroup,FieldNameReport:Variant;
  type_report,st_order:String;
begin
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

if cxCheckBoxOrder.Checked=true then
  begin
    st_order:=' and  ST_ORDER_OT=1';
  end
  else
  begin
    st_order:=' '
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
                sql_master:=sql_master+'rl.'+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+',';
                order:=order +'rl.'+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+'=:'+RxMemoryDataPrintSetup.FieldByName('RxNameVariant').AsString+' and ';
              end;
          end;
        RxMemoryDataPrintSetup.Next;
      end;

    SumC:=0;
    if CheckBoxUkr.Checked=true then
      begin
        Inc(SumC);
      end;
    if CheckBoxInostr.Checked=true then
      begin
        Inc(SumC);
      end;
    if SumC=0 then
      begin
        messageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_NO_LIVERS),
             PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_ICONWARNING or MB_OK);
        Exit;
      end;
rj:=0;
//работа с периодами, составление ограничений на дату рождени€, период регистрации и прописки
sql_date_r:='';
if cxCheckBoxDateRog.Checked=true then
  begin
    if cxCheckBoxDateRogNo.Checked=false then
      begin
        sql_date_r:=sql_date_r+' and DATE_ROJ>='''+DateToStr(DateTimePickerDateRojBeg.Date)+''' and DATE_ROJ<='''+DateToStr(DateTimePickerDateRojEnd.Date)+'''';
      end
      else
      begin
        sql_date_r:=sql_date_r+' and ( not ( DATE_ROJ<='''+DateToStr(DateTimePickerDateRojBeg.Date)+''' and DATE_ROJ>='''+DateToStr(DateTimePickerDateRojEnd.Date)+'''))';
      end;
    inc(rj);
  end
  else
  begin
    inc(rj);
  end;
//ограничени€ на период прописки
sql_date_prop:='';
if cxCheckBoxDateProp.Checked=true then
  begin
    if cxCheckBoxDatePropNo.Checked=false then
      begin
//        sql_date_prop:=sql_date_prop+' and (not (BEG_PROPI>'''+DateToStr(DateTimePickerDatePropEnd.Date)+''' or END_PROPI<'''+DateToStr(DateTimePickerDatePropBeg.Date)+'''))';
        sql_date_prop:=sql_date_prop+' and (BEG_PROPI BETWEEN '''+DateToStr(DateTimePickerDatePropBeg.Date)+''' and'+ ''''+DateToStr(DateTimePickerDatePropEnd.Date)+''')';
        sql_date_prop:=sql_date_prop+' and (END_PROPI BETWEEN '''+DateToStr(DateTimePickerDatePropBeg.Date)+''' and'+ ''''+DateToStr(DateTimePickerDatePropEnd.Date)+''')';
      end
      else
      begin
        sql_date_prop:=sql_date_prop+' and (BEG_PROPI>'''+DateToStr(DateTimePickerDatePropEnd.Date)+''' or END_PROPI<'''+DateToStr(DateTimePickerDatePropBeg.Date)+''')'
      end;
    inc(rj);
  end
  else
  begin
    inc(rj);
  end;
//ограничени€ на период регистрации
sql_date_reg:='';
if cxCheckBoxDateReg.Checked=true then
  begin
    if cxCheckBoxDateRegNo.Checked=false then
      begin
        sql_date_reg:=sql_date_prop+' and (not (BEG_REG>'''+DateToStr(DateTimePickerDateRegEnd.Date)+''' or END_REG<'''+DateToStr(DateTimePickerDateRegBeg.Date)+'''))';
      end
      else
      begin
        sql_date_reg:=sql_date_prop+' and (BEG_REG>'''+DateToStr(DateTimePickerDateRegEnd.Date)+''' or END_REG<'''+DateToStr(DateTimePickerDateRegBeg.Date)+''')';
      end;
    Inc(rj);
  end
  else
  begin
    inc(rj);
  end;
sql_date_reg_hist:='';
if cxCheckBoxDateRegHist.Checked=true then
  begin
    sql_date_reg_hist:=sql_date_reg_hist+' and rl.DATE_REG>='''+DateToStr(DateTimePickerDateRegHistBeg.Date)+''' and rl.DATE_REG<='''+DateToStr(DateTimePickerDateRegHistEnd.Date)+'''';
    inc(rj);
  end
  else
  begin
    inc(rj);
  end;

//ограничение на период проживани€
  sql_date_reside:='';
  if CheckBox_date_reside.Checked=true
   then sql_date_reside := sql_date_reside + ' and (('''+DateToStr(DateTimePicker_beg_reside.Date)+''' BETWEEN BEG_RESIDE and END_RESIDE - 1) or ('''+DateToStr(DateTimePicker_end_reside.Date)+''' BETWEEN BEG_RESIDE + 1 and END_RESIDE))';

//составление шапки отчета
FieldNameReport:=VarArrayCreate([0,rj+1],varVariant);
if rj>0 then
  begin
    rj:=0;
    if cxCheckBoxStatus.Checked=true then
      begin
        FieldNameReport[rj]:=VarArrayOf([1,'STATUS',StudcityConst.Studcity_ReportsLiversStatus_EX[lang]+':'+ComboBoxStatus.Text]);
        inc(rj);
      end
      else
      begin
        FieldNameReport[rj]:=VarArrayOf([0,'STATUS']);
        inc(rj);
      end;
    //работа с периодами, составление ограничений на дату рождени€, период регистрации и прописки
    if cxCheckBoxDateRog.Checked=true then
      begin
        if cxCheckBoxDateRogNo.Checked=false then
          begin
            FieldNameReport[rj]:=VarArrayOf([1,'DATEROG',StudcityConst.Studcity_ReportsLiversOgDateRoj_EX[lang]+':'+StudcityConst.Studcity_ReportsBegin_EX[lang]+' '+DateToStr(DateTimePickerDateRojBeg.Date)+' '+StudcityConst.Studcity_ReportsEnd_EX[lang]+' '+DateToStr(DateTimePickerDateRojEnd.Date)]);
          end
          else
          begin
            FieldNameReport[rj]:=VarArrayOf([1,'DATEROG',StudcityConst.Studcity_ReportsLiversOgDateRoj_EX[lang]+': не '+StudcityConst.Studcity_ReportsBegin_EX[lang]+' '+DateToStr(DateTimePickerDateRojBeg.Date)+' '+StudcityConst.Studcity_ReportsEnd_EX[lang]+' '+DateToStr(DateTimePickerDateRojEnd.Date)]);
          end;  
        inc(rj);
      end
      else
      begin
        FieldNameReport[rj]:=VarArrayOf([0,'DATEROG']);
        inc(rj);
      end;
    //ограничени€ на период прописки
    if cxCheckBoxDateProp.Checked=true then
      begin
        if cxCheckBoxDatePropNo.Checked=false then
          begin
            FieldNameReport[rj]:=VarArrayOf([1,'DATEPROP',StudcityConst.Studcity_ReportsLiversOgDateProp_EX[lang]+':'+StudcityConst.Studcity_ReportsBegin_EX[lang]+' '+DateToStr(DateTimePickerDatePropBeg.Date)+' '+StudcityConst.Studcity_ReportsEnd_EX[lang]+' '+DateToStr(DateTimePickerDatePropEnd.Date)]);
          end
          else
          begin
            FieldNameReport[rj]:=VarArrayOf([1,'DATEPROP',StudcityConst.Studcity_ReportsLiversOgDateProp_EX[lang]+': не '+StudcityConst.Studcity_ReportsBegin_EX[lang]+' '+DateToStr(DateTimePickerDatePropBeg.Date)+' '+StudcityConst.Studcity_ReportsEnd_EX[lang]+' '+DateToStr(DateTimePickerDatePropEnd.Date)]);
          end;
        inc(rj);
      end
      else
      begin
        FieldNameReport[rj]:=VarArrayOf([0,'DATEPROP']);
        inc(rj);
      end;
    //ограничени€ на период регистрации
    if cxCheckBoxDateReg.Checked=true then
      begin
        if cxCheckBoxDateRegNo.Checked=false then
          begin
            FieldNameReport[rj]:=VarArrayOf([1,'DATEREG',StudcityConst.Studcity_ReportsLiversOgDateReg_EX[lang]+':'+StudcityConst.Studcity_ReportsBegin_EX[lang]+' '+DateToStr(DateTimePickerDateRegBeg.Date)+' '+StudcityConst.Studcity_ReportsEnd_EX[lang]+' '+DateToStr(DateTimePickerDateRegEnd.Date)]);
          end
          else
          begin
            FieldNameReport[rj]:=VarArrayOf([1,'DATEREG',StudcityConst.Studcity_ReportsLiversOgDateReg_EX[lang]+': не '+StudcityConst.Studcity_ReportsBegin_EX[lang]+' '+DateToStr(DateTimePickerDateRegBeg.Date)+' '+StudcityConst.Studcity_ReportsEnd_EX[lang]+' '+DateToStr(DateTimePickerDateRegEnd.Date)]);
          end;
        inc(rj)
      end
      else
      begin
        FieldNameReport[rj]:=VarArrayOf([0,'DATEREG']);
        inc(rj);
      end;
    //ограничени€ на период регистрации
    if cxCheckBoxDateRegHist.Checked=true then
      begin
        FieldNameReport[rj]:=VarArrayOf([1,'DATEREGHIST',StudcityConst.Studcity_ReportsLiversOgDateRegHist_EX[lang]+':'+StudcityConst.Studcity_ReportsBegin_EX[lang]+' '+DateToStr(DateTimePickerDateRegHistBeg.Date)+' '+StudcityConst.Studcity_ReportsEnd_EX[lang]+' '+DateToStr(DateTimePickerDateRegHistEnd.Date)]);
        inc(rj)
      end
      else
      begin
        FieldNameReport[rj]:=VarArrayOf([0,'DATEREGHIST']);
        inc(rj);
      end;
    //ограничени€ на приказы об отчислении
    if cxCheckBoxOrder.Checked=true then
      begin
        FieldNameReport[rj]:=VarArrayOf([1,'ST_ORDER',StudcityConst.ST_OrderOtPrint_EX[lang]]);
      end
      else
      begin
        FieldNameReport[rj]:=VarArrayOf([0,'ST_ORDER']);
        inc(rj);
      end;
  end;


//реестр
if Doc_R=1 then
  begin
    type_report:='';
    if CheckBoxUkr.Checked=true then
      begin
        type_report:=type_report+' ( INOSTRANEC=0';
      end;
    if CheckBoxInostr.Checked=true then
      begin
        if (type_report='') then
          begin
            type_report:='( ';
          end
          else
          begin
            type_report:=type_report+' or ';
          end;
        type_report:=type_report+'INOSTRANEC=1';
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
        sql_master:='select distinct '+sql_master + 'ID_TRANSACTION from ST_DT_REPORT_LIVER rl where ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+st_order+ ' order by '+sql_master+' ID_TRANSACTION';
      end
      else
      begin
        sql_master:='select distinct ID_TRANSACTION from ST_DT_REPORT_LIVER r where ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+st_order;
      end;

    if cxCheckBoxPrintUkrName.Checked then
         query:='select familia_UA||'' ''||imya_UA||'' ''||otchestvo_UA as FIO, ST_DT_PFIO.NUM_DOG, rl.*  from ST_DT_REPORT_LIVER rl,ST_DT_PFIO where ST_DT_PFIO.ID_KOD = rl.ID_PEOPLE and '+type_report+' and ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+st_order
    else query:='select rl.familia||'' ''||rl.imya||'' ''||rl.otchestvo as FIO,ST_DT_PFIO.NUM_DOG,rl.* from ST_DT_REPORT_LIVER rl,ST_DT_PFIO where ST_DT_PFIO.ID_KOD = rl.ID_PEOPLE and '+type_report+' and ID_TRANSACTION='+IntToStr(ID_TRANSACTION)+st_order;

    if cxCheckBoxStatus.Checked=true then
     begin
       query:=query+' and TYPESTATUS='+IntToStr(ComboBoxStatus.ItemIndex+1);
     end;

    query:=query+' and '+order+' ID_TRANSACTION=:ID_TRANSACTION';
    query:=query+sql_date_r;
    query:=query+sql_date_prop;
    query:=query+sql_date_reg;
    query:=query+sql_date_reg_hist;
    query:=query + sql_date_reside;
    //query:=StringReplace(query,'r','r1',[rfReplaceAll, rfIgnoreCase]);
    if cxCheckBoxPrintUkrName.Checked then
         query:=query+' ORDER BY FAMILIA_UA,IMYA_UA,OTCHESTVO_UA'
    else query:=query+' ORDER BY rl.FAMILIA,rl.IMYA,rl.OTCHESTVO';
    LoadPackegeStudCity.LoadReportsView(self,Database.Handle,0,sql_master,query,FieldGroup,NFieldView,FieldNameReport,'RLivers',0);

  end;
//сводна€
if Doc_Sv=1 then
  begin
    if (order='') and (Doc_Sv=1) then
      begin
        messageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_PRINT_SV_CONST),
             PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_ICONWARNING or MB_OK);
        Exit;
      end;
    type_report:='';
    if CheckBoxUkr.Checked=true then
      begin
        type_report:=type_report+' ( INOSTRANEC=0';
      end;
    if CheckBoxInostr.Checked=true then
      begin
        if (type_report='') then
          begin
            type_report:='( ';
          end
          else
          begin
            type_report:=type_report+' or ';
          end;
        type_report:=type_report+'INOSTRANEC=1';
      end;
    type_report:=type_report+')';

    FieldView:=VarArrayCreate([0,j],varVariant);
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
    FieldView[j]:=VarArrayOf(['CNT',StudcityConst.Studcity_ReportsPrintCNT,70]);

    query:='select '+sql_master+' count (rl.id_people) as CNT,ID_TRANSACTION from st_dt_report_liver rl where ID_TRANSACTION='+IntToStr(ID_TRANSACTION);
    if cxCheckBoxStatus.Checked=true then
      begin
        query:=query+' and TYPESTATUS='+IntToStr(ComboBoxStatus.ItemIndex+1);
      end;
    query:=query+' and '+type_report;
    query:=query+sql_date_r;
    query:=query+sql_date_prop;
    query:=query+sql_date_reg;
    query:=query+sql_date_reg_hist;
    query:=query+sql_date_reside;
    query:=query+' group by '+sql_master+' ID_TRANSACTION';
    query:=query+ ' order by '+sql_master+' ID_TRANSACTION';
    LoadPackegeStudCity.LoadReportsView(self,Database.Handle,1,query,query,FieldView,NFieldView,FieldNameReport,'SVLivers',j-1);
  end;
end;

procedure TfrmMainFormReportsLivers.FormDestroy(Sender: TObject);
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

procedure TfrmMainFormReportsLivers.cxCheckBoxStatusClick(Sender: TObject);
begin
if cxCheckBoxStatus.Checked=true then
  begin
    ComboBoxStatus.Visible:=true;
  end
  else
  begin
    ComboBoxStatus.Visible:=false;
  end;
end;

procedure TfrmMainFormReportsLivers.cxCheckBoxDateRogClick(
  Sender: TObject);
begin
if cxCheckBoxDateRog.Checked=true then
  begin
    LabelRojBeg.Visible:=true;
    DateTimePickerDateRojBeg.Visible:=true;
    LabelRojEnd.Visible:=true;
    DateTimePickerDateRojEnd.Visible:=true;
    cxCheckBoxDateRogNo.Visible:=true;
  end
  else
  begin
    LabelRojBeg.Visible:=false;
    DateTimePickerDateRojBeg.Visible:=false;
    LabelRojEnd.Visible:=false;
    DateTimePickerDateRojEnd.Visible:=false;
    cxCheckBoxDateRogNo.Visible:=false;
  end;
end;

procedure TfrmMainFormReportsLivers.cxCheckBoxDateRegClick(
  Sender: TObject);
begin
if cxCheckBoxDateReg.Checked=true then
  begin
    LabelRegBeg.Visible:=true;
    DateTimePickerDateRegBeg.Visible:=true;
    LabelRegEnd.Visible:=true;
    DateTimePickerDateRegEnd.Visible:=true;
    cxCheckBoxDateRegNo.Visible:=true;
  end
  else
  begin
    LabelRegBeg.Visible:=false;
    DateTimePickerDateRegBeg.Visible:=false;
    LabelRegEnd.Visible:=false;
    DateTimePickerDateRegEnd.Visible:=false;
    cxCheckBoxDateRegNo.Visible:=false;
  end;
end;

procedure TfrmMainFormReportsLivers.cxCheckBoxDatePropClick(
  Sender: TObject);
begin
if cxCheckBoxDateProp.Checked=true then
  begin
    LabelPropBeg.Visible:=true;
    DateTimePickerDatePropBeg.Visible:=true;
    LabelPropEnd.Visible:=true;
    DateTimePickerDatePropEnd.Visible:=true;
//    cxCheckBoxDatePropNo.Visible:=true;
  end
  else
  begin
    LabelPropBeg.Visible:=false;
    DateTimePickerDatePropBeg.Visible:=false;
    LabelPropEnd.Visible:=false;
    DateTimePickerDatePropEnd.Visible:=false;
//    cxCheckBoxDatePropNo.Visible:=false;
  end;
end;

procedure TfrmMainFormReportsLivers.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='¬рем€ формировани€ отчета: '+TimeToStr(Now-TimeStart);
  if ButtonView.Enabled=true then
    begin
      Timer1.Enabled:=false;
    end;
end;

end.
