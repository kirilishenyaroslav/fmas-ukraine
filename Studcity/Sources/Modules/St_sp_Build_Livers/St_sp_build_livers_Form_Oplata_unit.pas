unit St_sp_build_livers_Form_Oplata_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxButtons,
  cxCurrencyEdit, cxRadioGroup, cxGroupBox,St_sp_BUILD_LIVERS, DB,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, ImgList, dxBar, dxBarExtItems, ActnList,
  cxGraphics, dxStatusBar,LoadPackegeStudCity, IBase,
  St_sp_build_livers_calculation_oplata, cxCheckBox, cxSplitter, ExtCtrls,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, RxMemDS;

type
  TSt_sp_build_livers_Form_Oplata = class(TForm)
    HotKey_StatusBar: TdxStatusBar;
    dxStatusBar1: TdxStatusBar;
    GroupBox_services: TcxGroupBox;
    Panel1: TPanel;
    T_Label: TLabel;
    Label1: TLabel;
    FIO_Edit: TcxTextEdit;
    DateEndEdit: TcxDateEdit;
    cxLabel2: TcxLabel;
    DateBegEdit: TcxDateEdit;
    OkButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Summa_RadioButton: TcxRadioButton;
    cxRadioButton1: TcxRadioButton;
    CheckBox_service: TcxCheckBox;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    St_SNeed_Edit: TcxCurrencyEdit;
    cxLabel6: TcxLabel;
    St_UplSum_Edit: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    St_SumDopl_Edit: TcxCurrencyEdit;
    cxLabel8: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DateEndEdit_Oplata: TcxDateEdit;
    cxLabel1: TcxLabel;
    DateBegEdit_Oplata: TcxDateEdit;
    cxLabel3: TcxLabel;
    SummaEdit: TcxCurrencyEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    ReadDataSet: TpFIBDataSet;
    WriteProc: TpFIBStoredProc;
    pFIBTransaction1: TpFIBTransaction;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    ImageList1: TImageList;
    pFIBStoredProc1: TpFIBStoredProc;
    ActionList1: TActionList;
    CloseApplyAction: TAction;
    ModeChangeAction: TAction;
    ServiceDataSet: TpFIBDataSet;
    ServiceDataSource: TDataSource;
    PopupImageList: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    Cash_Style: TcxStyle;
    ImageList2: TImageList;
    ImageListOfCategory: TImageList;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    SERVICE_TITLE: TcxGridDBColumn;
    SERVICE_check: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    MemoryData_service: TRxMemoryData;
    Button_select: TcxButton;
    Button_unselect: TcxButton;
    Button_convert: TcxButton;
    SERVICE_SUMMA: TcxGridDBColumn;
    Button_recalc: TcxButton;
    procedure OkButtonClick(Sender: TObject);
    procedure cxRadioButton1Click(Sender: TObject);
    procedure Summa_RadioButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateEndEdit_OplataKeyPress(Sender: TObject; var Key: Char);
    procedure SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure CloseApplyActionExecute(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure ModeChangeActionExecute(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure DateEndEdit_OplataPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox_servicePropertiesChange(Sender: TObject);
    procedure Button_selectClick(Sender: TObject);
    procedure Button_unselectClick(Sender: TObject);
    procedure Button_convertClick(Sender: TObject);
    procedure SummaEditExit(Sender: TObject);
    procedure Button_recalcClick(Sender: TObject);
  private
    FirstDateProg : TDate;
    FirstLoad: Smallint;
    procedure ReCalcSumService;
  public
   KeyField: Int64;
   stInsOst: Currency; // сумма входящего остатка
   PeriodCheck: Smallint;
   Facultet: string;
   Kurs: smallint;

   id_session_pay,
   id_session_calc: int64;

   SheglovHandle: TISC_DB_HANDLE;
   SheglovItem_id: Int64;
  end;

var
  St_sp_build_livers_Form_Oplata: TSt_sp_build_livers_Form_Oplata;

implementation

uses st_sp_buils_livers_docs, St_sp_Build_livers_registration_view;

{$R *.dfm}


procedure TSt_sp_build_livers_Form_Oplata.OkButtonClick(Sender: TObject);
var
  i : Integer;
  error : Boolean;
  sum : Double;
begin
  if SummaEdit.Text <> ''
   then SummaEdit.Value := StrToCurr(SummaEdit.Text) ;

  if DateEndEdit_Oplata.Date < DateBegEdit_Oplata.date then
   begin
    ShowMessage('Дата начала не может быть больше даты окончания!');
    if DateEndEdit_Oplata.enabled
     then DateEndEdit_Oplata.SetFocus;
    exit;
   end;

  if ((SummaEdit.Value = 0) or (SummaEdit.Text = '')) then
   begin
    ShowMessage('Сумма не может быть нулевой!');
    if SummaEdit.enabled
     then SummaEdit.SetFocus;
    exit;
   end;

  MemoryData_service.First;
  i := 0;
  error := true;
  while ((i<MemoryData_service.RecordCount) and (error)) do
   Begin
    If MemoryData_service.FieldByName('md_check').AsVariant = 1 then error := False;

    i := i + 1;
    MemoryData_service.Next;
   end;

  If error then
   Begin
    ShowMessage('Необхідно обрати хоча б одну послугу!');
    cxGrid1.SetFocus;
    exit;
   end;

  MemoryData_service.First;
  sum := 0;
  For i := 0 to MemoryData_service.RecordCount - 1 do
   Begin
    if MemoryData_service.FieldByName('md_check').AsInteger = 1
     then sum := sum + MemoryData_service.FieldByName('md_sum').AsFloat;
    MemoryData_service.Next;
   end;

  If Abs(sum - SummaEdit.EditValue) > 0.0001 then
   Begin
    ShowMessage('Сума по послугам не співпадає з загальною сумою!');
    SummaEdit.SetFocus;
    Exit;
   end;

  ModalResult := mrOk;
end;

procedure TSt_sp_build_livers_Form_Oplata.cxRadioButton1Click(
  Sender: TObject);
  var enter : char;
  begin
 SummaEdit.Properties.ReadOnly:= true;
 SummaEdit.Style.Color:= clBtnFace;
// SummaEdit.Clear;
 cxLabel4.Enabled:=false;
 DateEndEdit_Oplata.Enabled:=True;
 DateEndEdit_Oplata.Properties.ReadOnly:= false;
 DateEndEdit_Oplata.Style.Color:= clInfoBk;

 DateBegEdit_Oplata.Enabled:=True;
 DateEndEdit_Oplata.SetFocus;
 Label2.Enabled:=true;
 cxLabel3.Enabled:=true;
 cxLabel1.Enabled:=true;
end;

procedure TSt_sp_build_livers_Form_Oplata.Summa_RadioButtonClick(
  Sender: TObject);
begin
 SummaEdit.Enabled:=true;
 SummaEdit.Properties.ReadOnly:= false;
 SummaEdit.Style.Color:= clInfoBk;
{ if St_SumDopl_Edit.Visible then
 SummaEdit.Value:= St_SumDopl_Edit.Value
 else SummaEdit.Value:=0;}
 SummaEdit.SetFocus;
 Label3.Enabled:=true;
 cxLabel4.Enabled:=true;
 DateEndEdit_Oplata.Properties.ReadOnly:= true;
 DateEndEdit_Oplata.Style.Color:= clBtnFace;

 DateBegEdit_Oplata.Enabled:=false;
 DateEndEdit_Oplata.Clear;
 DateBegEdit_Oplata.Clear;
 cxLabel1.Enabled:=false;
end;

procedure TSt_sp_build_livers_Form_Oplata.FormShow(Sender: TObject);
var
  enter: char;
  i : Integer;
begin
 FirstLoad:=1;

 if PeriodCheck = 1 then
  begin
   cxRadioButton1.Checked:=true;
   DateBegEdit_Oplata.Enabled:=true;
   SummaEdit.Properties.ReadOnly:= true;
   SummaEdit.Style.Color:= clBtnFace;
   DateEndEdit_Oplata.Enabled:=true;
   cxLabel1.Enabled:=true;
   cxLabel3.Enabled:=true;
   cxLabel4.Enabled:=false;
   Label2.Enabled:=true;
   DateEndEdit_Oplata.SetFocus;
  end;

 if PeriodCheck = 0 then
  begin
   Summa_RadioButton.Checked:=true;
   DateBegEdit_Oplata.Properties.ReadOnly:= true;
   DateBegEdit_Oplata.Style.Color:= clBtnFace;
   SummaEdit.Enabled:= true;
   DateEndEdit_Oplata.Enabled:=false;
   cxLabel1.Enabled:=false;
   cxLabel3.Enabled:=false;
   cxLabel4.Enabled:=true;
   Label2.Enabled:=false;
   SummaEdit.SetFocus;
  end;

  FirstDateProg :=DateEndEdit_Oplata.Date;

enter:=#13;
St_sp_build_livers_Form_Oplata.DateEndEdit_OplataKeyPress
(
DateEndEdit_Oplata,enter
);

  ServiceDataSet.Close;
  ServiceDataSet.SQLs.SelectSQL.Text := 'select * from ST_GET_SERVICE(:id_kod) order by service_name desc';
  ServiceDataSet.ParamByName('id_kod').AsInt64 := KeyField;
  ServiceDataSet.Open;
  ServiceDataSet.FetchAll;
  ServiceDataSet.First;

  for i := 1 to ServiceDataSet.RecordCount do
   Begin
     MemoryData_service.OPen;
     MemoryData_service.Insert;
     MemoryData_service.FieldByName('md_name').Value    := ServiceDataSet['service_name'];
     MemoryData_service.FieldByName('md_id_sm').Value   := ServiceDataSet['id_sm'];
     MemoryData_service.FieldByName('md_id_rz').Value   := ServiceDataSet['id_rz'];
     MemoryData_service.FieldByName('md_id_st').Value   := ServiceDataSet['id_st'];
     MemoryData_service.FieldByName('md_id_kekv').Value := ServiceDataSet['id_kekv'];
     MemoryData_service.FieldByName('md_check').Value   := 1;
     MemoryData_service.FieldByName('md_procent').Value := ServiceDataSet['procent'];
     MemoryData_service.FieldByName('md_sum').Value     := SummaEdit.EditValue * ServiceDataSet['procent'] / 100;
     MemoryData_service.Post;

     ServiceDataSet.next;
   end;
end;

procedure TSt_sp_build_livers_Form_Oplata.DateEndEdit_OplataKeyPress(
  Sender: TObject; var Key: Char);
begin
if key=#13 then begin
if DateBegEdit_Oplata.Date>DateEndEdit_Oplata.Date then begin
ShowMessage('Дата начала не может быть больше даты окончания!');
DateEndEdit_Oplata.SetFocus;
exit;
end;

if  DateEndEdit_Oplata.Date > FirstDateProg then begin
ShowMessage('Дата окончания вышла за период проживания!');
DateEndEdit_Oplata.SetFocus;
exit;
end;
Screen.Cursor:=crHourGlass;
  if WriteProc.Open then  WriteProc.close;

  WriteProc.StoredProcName := 'ST_CALC_TMP_CLEAR';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  WriteProc.ExecProc;
  WriteProc.Transaction.Commit;
  WriteProc.Close;

{
  WriteProc.StoredProcName := 'ST_CALC';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_KOD').AsInt64 := KeyField ;
  WriteProc.ParamByName('BEG_CHECK').AsDate :=DateBegEdit_Oplata.Date;
  WriteProc.ParamByName('END_CHECK').AsDate :=DateEndEdit_Oplata.Date;
}

  WriteProc.StoredProcName := 'ST_CALC';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_KOD').AsInt64 := KeyField ;
  WriteProc.ParamByName('BEG_CHECK').AsDate :=DateBegEdit.Date;
  WriteProc.ParamByName('END_CHECK').AsDate :=DateEndEdit_Oplata.Date;
  WriteProc.ExecProc;

  SummaEdit.Value:= St_SumDopl_Edit.Value - (St_SNeed_Edit.Value - WriteProc.ParamByName('ST_SNEED').AsCurrency);
  if SummaEdit.Value > St_SumDopl_Edit.Value then SummaEdit.Value := St_SumDopl_Edit.Value;
  if SummaEdit.Value < 0 then SummaEdit.Value := 0;

 if St_SumDopl_Edit.Value <0 then  SummaEdit.value:= -1*St_SumDopl_Edit.Value;

  id_session_calc:= WriteProc.ParamByName('ID_SESSION').AsInt64;
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  Screen.Cursor:=crDefault;
//  OkButton.SetFocus;
end;
end;

procedure TSt_sp_build_livers_Form_Oplata.SummaEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key=#13 then
if SummaEdit.Value > 1000000 then
begin
SummaEdit.Value:=StrToCurr(SummaEdit.text);
showmessage('Значение суммы слишком велико и превышает допустимое.'+ #13+ 'Подумайте, есть ли в этом смысл, вводить сумму, больше миллиона ???');
SummaEdit.SetFocus;
exit;
end;

if key=#13 then begin
Screen.Cursor:=crHourGlass;
  if WriteProc.Open then  WriteProc.close;

  WriteProc.StoredProcName := 'ST_CALC_TMP_CLEAR';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  WriteProc.ExecProc;
  WriteProc.Transaction.Commit;
  WriteProc.Close;

  WriteProc.StoredProcName := 'ST_CALC';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_KOD').AsInt64 := KeyField ;
  WriteProc.ParamByName('BEG_CHECK').AsDate:=strtodate('01.01.1900');
  WriteProc.ParamByName('END_CHECK').AsDate:=strtodate('01.01.2050');
  WriteProc.ParamByName('STUPLSUM').AsCurrency :=St_UplSum_Edit.Value+ SummaEdit.Value;
  WriteProc.ExecProc;
  DateEndEdit_Oplata.Date:= WriteProc.ParamByName('STDATEOPL').AsDate;
  datetostr(WriteProc.ParamByName('STDATEOPL').AsDate);
  id_session_calc:= WriteProc.ParamByName('ID_SESSION').AsInt64;
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  Screen.Cursor:=crDefault;
//  OkButton.SetFocus;
  end;
end;

procedure TSt_sp_build_livers_Form_Oplata.dxBarLargeButton1Click(
  Sender: TObject);
begin
Screen.Cursor:=crHourGlass;
  DocsOpl_Form:= TDocsOpl_Form.Create(Self);

  DocsOpl_Form.SheglovHandle:= self.SheglovHandle;
  DocsOpl_Form.SheglovItem_id:=self.SheglovItem_id;

  DocsOpl_Form.Fio_Label.Caption:=FIO_Edit.Text;
  DocsOpl_Form.DateBeg_Label.Caption:=DateBegEdit.Text;
  DocsOpl_Form.DateEnd_Label.Caption:=DateEndEdit.Text;

  With pFIBStoredProc1 do
  begin
   try
      // --------------запуск процедуры st_pay------------------------------
      // расчет уже уплаченной суммы

  StoredProcName := 'ST_PAY_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_pay;
  ExecProc;
  Transaction.Commit;
  Close;

      StoredProcName := 'ST_PAY';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('ID_DOG_STUD').AsInt64 := KeyField;
      ParamByName('DATE_PROV_CHECK').AsShort := 1;
      ParamByName('IS_DOC_GEN').AsShort := 1;
      ParamByName('IS_PROV_GEN').AsShort := 0;
      ParamByName('IS_SMET_GEN').AsShort := 0;
      ExecProc;

      id_session_pay:= ParamByName('ID_SESSION').AsInt64;
      Transaction.Commit;
      Close;
   except
      showmessage('Непредвиденная ошибка обработки документов оплаты. Обратитесь к администратору.');
      Transaction.Rollback;
      raise;
  end;
  end;

 DocsOpl_Form.ReadDataSet.SelectSQL.Clear;
 DocsOpl_Form.ReadDataSet.SelectSQL.text:= 'select * from ST_TMP_DOC_SELECT('+ IntToStr(id_session_pay)+')';

  DocsOpl_Form.ReadDataSet.CloseOpen(true);
 if  DocsOpl_Form.ShowModal = mrok then begin

  pFIBStoredProc1.StoredProcName := 'ST_PAY_TMP_CLEAR';
  pFIBStoredProc1.Transaction.StartTransaction;
  pFIBStoredProc1.Prepare;
  pFIBStoredProc1.ParamByName('ID_SESSION').AsInt64 := id_session_pay;
  pFIBStoredProc1.ExecProc;
  pFIBStoredProc1.Transaction.Commit;
  pFIBStoredProc1.Close;
  end;
  Screen.Cursor:=crDefault;
end;

procedure TSt_sp_build_livers_Form_Oplata.dxBarLargeButton3Click(
  Sender: TObject);
var stUplSum, stSumDoc, stSNeed, SegodnyaOpl : Currency;
    STDATEOPL: TDate;
    Cur_date:string;
    edititem: int64;
begin
OplataSprav_Form:= TOplataSprav_Form.Create(Self);
OplataSprav_Form.Fac_Label.Caption:=OplataSprav_Form.Fac_Label.Caption+ ': '+Facultet;
OplataSprav_Form.Kurs_Label.Caption:=OplataSprav_Form.Kurs_Label.Caption+ ': '+inttostr(Kurs);

ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
edititem:= KeyField;
ReadDataSet.SelectSQL.Text:='select Date_birn from ST_PFIO_BIRN_DATE('+ inttostr(edititem)+')' ;
ReadDataSet.Open;
OplataSprav_Form.DataRog_Label.Caption:=OplataSprav_Form.DataRog_Label.Caption+ ': '+ datetostr(ReadDataSet['Date_Birn']);
ReadDataSet.Close;
  With WriteProc do
  begin
  try
  // ---чистка-----------------------------------
 { StoredProcName := 'ST_TOTAL_TEMP_ANNIGILATION';
  Transaction.StartTransaction;
  Prepare;
  ExecProc;
  Transaction.Commit;
  close;}

  // --------------запуск процедуры st_pay------------------------------
  // расчет уже уплаченной суммы

  StoredProcName := 'ST_PAY_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_pay;
  ExecProc;
  Transaction.Commit;
  Close;


  StoredProcName := 'ST_PAY';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_DOG_STUD').AsInt64 := KeyField;
  ParamByName('DATE_PROV_CHECK').AsShort := 1;
  ParamByName('IS_DOC_GEN').AsShort := 1;
  ParamByName('IS_PROV_GEN').AsShort := 1;
  ParamByName('IS_SMET_GEN').AsShort := 1;
  ExecProc;
  stUplSum:=ParamByName('STUPLSUM').AsCurrency;
  stSumDoc:=ParamByName('SUMMA_ALL').AsCurrency;

    id_session_pay:= ParamByName('ID_SESSION').AsInt64;

  Transaction.Commit;
  Close;
  if stUplSum > stSumDoc then
  OplataSprav_Form.St_UplSum_Edit.Value:= stUplSum
  else OplataSprav_Form.St_UplSum_Edit.Value:= stSumDoc;

  // --------------запуск процедуры st_calc------------------------------
  //

  WriteProc.StoredProcName := 'ST_CALC_TMP_CLEAR';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  WriteProc.ExecProc;
  WriteProc.Transaction.Commit;
  WriteProc.Close;

  StoredProcName := 'ST_CALC';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_KOD').AsInt64 := KeyField;
  if stUplSum > stSumDoc then  ParamByName('STUPLSUM').AsCurrency := stUplSum
  else
  ParamByName('STUPLSUM').AsCurrency := stSumDoc; // это уже с уплаченной суммой
  ExecProc;

  OplataSprav_Form.St_SNeed_Edit.Value:= ParamByName('ST_SNEED').AsCurrency;
  stSNeed:= ParamByName('ST_SNEED').AsCurrency;      //  сумма, необходимая для уплаты за весь период
  STDATEOPL:= ParamByName('STDATEOPL').AsDateTime;   // дата, по которую оплачено
  OplataSprav_Form.DateOpl_Label.Caption:= OplataSprav_Form.DateOpl_Label.Caption + '  '+ datetostr(STDATEOPL);

    id_session_calc:= ParamByName('ID_SESSION').AsInt64;

  Transaction.Commit;
  Close;
  if stUplSum > stSumDoc then
  OplataSprav_Form.Zadolgnost_Edit.Value:= stSNeed - stUplSum
  else OplataSprav_Form.Zadolgnost_Edit.Value:= stSNeed - stSumDoc;


  StoredProcName := 'ST_CALC_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  ExecProc;
  Transaction.Commit;
  Close;


  // --------------запуск процедуры st_calc------------------------------
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
ReadDataSet.Open;
Cur_date:= ReadDataSet['CUR_DATE'];
ReadDataSet.Close;

  //

 if (STDATEOPL <= strtodate(Cur_date)) then begin
  StoredProcName := 'ST_CALC';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_KOD').AsInt64 := KeyField;
  ParamByName('BEG_CHECK').AsVariant := STDATEOPL;
  ParamByName('STUPLSUM').AsVariant := null;
  ParamByName('END_CHECK').AsDate := strtodate(Cur_date);
  ExecProc;
  SegodnyaOpl:=ParamByName('ST_SNEED').AsCurrency;

    id_session_calc:= ParamByName('ID_SESSION').AsInt64;

  Transaction.Commit;
  Close;
  end
  else
  SegodnyaOpl:=0;

  OplataSprav_Form.Today_Opl_Edit.Value:= SegodnyaOpl;
   if SegodnyaOpl > OplataSprav_Form.Zadolgnost_Edit.Value then
   OplataSprav_Form.Today_Opl_Edit.Value:= OplataSprav_Form.Zadolgnost_Edit.Value ;

  if ((OplataSprav_Form.Zadolgnost_Edit.Value = 0) or (OplataSprav_Form.Zadolgnost_Edit.Value<0)) then
      OplataSprav_Form.Today_Opl_Edit.Value:= 0;


  StoredProcName := 'ST_CALC_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  ExecProc;
  Transaction.Commit;
  Close;

  StoredProcName := 'ST_CALC';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_KOD').AsInt64 := edititem;
  ParamByName('BEG_CHECK').AsVariant := null;
  ParamByName('STUPLSUM').AsVariant := null;
  ParamByName('END_CHECK').AsVariant := null;

  ExecProc;
    id_session_calc:= ParamByName('ID_SESSION').AsInt64;
  Transaction.Commit;
  Close;

  except
  Transaction.Rollback;
  raise;
end;
end;
OplataSprav_Form.FIOCOMBO_Label.Caption:= FIO_Edit.Text;
Screen.Cursor:= crDefault;
  OplataSprav_Form.id_session_calc:= id_session_calc;
  OplataSprav_Form.id_session_pay:= id_session_pay;

if OplataSprav_Form.ShowModal = mrOK then
begin
  WriteProc.StoredProcName := 'ST_CALC_TMP_CLEAR';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  WriteProc.ExecProc;
  WriteProc.Transaction.Commit;
  WriteProc.Close;

  WriteProc.StoredProcName := 'ST_PAY_TMP_CLEAR';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_pay;
  WriteProc.ExecProc;
  WriteProc.Transaction.Commit;
  WriteProc.Close;
end;

end;

procedure TSt_sp_build_livers_Form_Oplata.CloseApplyActionExecute(
  Sender: TObject);
begin
St_sp_build_livers_Form_Oplata.OkButtonClick(Sender);
end;

procedure TSt_sp_build_livers_Form_Oplata.dxBarLargeButton4Click(
  Sender: TObject);
var
  enter : char;
begin
  if Summa_RadioButton.Checked then
   begin
    enter:=#13;
    SummaEdit.Value := StrToCurr(SummaEdit.text);
    St_sp_build_livers_Form_Oplata.SummaEditKeyPress(SummaEdit, enter);
   end;

  St_sp_build_livers_Form_Oplata.OkButtonClick(Sender);
end;

procedure TSt_sp_build_livers_Form_Oplata.dxBarLargeButton5Click(
  Sender: TObject);
begin
close;
end;

procedure TSt_sp_build_livers_Form_Oplata.ModeChangeActionExecute(
  Sender: TObject);
begin
 if St_sp_build_livers_Form_Oplata.Summa_RadioButton.Checked = true then begin
 St_sp_build_livers_Form_Oplata.Summa_RadioButton.Checked:=false;
 St_sp_build_livers_Form_Oplata.cxRadioButton1.Checked:=true;
 St_sp_build_livers_Form_Oplata.cxRadioButton1Click(Sender);
 exit;
 end;
 if St_sp_build_livers_Form_Oplata.cxRadioButton1.Checked = true then begin
 St_sp_build_livers_Form_Oplata.cxRadioButton1.Checked:=false;
 St_sp_build_livers_Form_Oplata.Summa_RadioButton.Checked:=true;
 St_sp_build_livers_Form_Oplata.Summa_RadioButtonClick(Sender);
 exit;
 end;
end;

procedure TSt_sp_build_livers_Form_Oplata.dxBarLargeButton6Click(
  Sender: TObject);
var
 ActionStr, ActionKeyStr      : string;
 i             : integer;
 edit_item_id: int64;
 begin
 Screen.Cursor:=crHourGlass;
edit_item_id:= KeyField;
 ActionStr := 'Просмотр регистрации проживающего';
 ActionKeyStr:='Принять';
 Registration_Form := TRegistration_Form.Create(Self);
 Registration_Form.Caption := ActionStr ;
 Registration_Form.FIO_Label.Caption:= FIO_Edit.Text;
 Registration_Form.Fac_Label.Visible:=false;
 Registration_Form.DataRog_Label.Visible:=false;
 Registration_Form.Kurs_Label.Visible:=false;
  // проверяю в sys_options - показывать ли вкладку Входящего остатка
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text:='select Show_ost from ST_INSOST_SHOW_CHECK';
 ReadDataSet.Open;
 if ReadDataSet['Show_ost']=0 then Registration_Form.cxPageControl1.Controls[5].Destroy
 else begin
 // выбираем историю по входящему остатку (если есть)
 ReadDataSet.close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text:='select * from ST_RELSM_SELECT('+ inttostr(edit_item_id)+')';
 ReadDataSet.Open;
 ReadDataSet.FetchAll;
 if ReadDataSet.RecordCount <> 0 then begin
  Registration_Form.cxGrid1TableView1.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do begin
  Registration_Form.cxGrid1TableView1.DataController.Values[i, 0] := inttostr(ReadDataSet['Number_sm'])+'.'+inttostr(ReadDataSet['Number_razd'])+'.'+inttostr(ReadDataSet['Number_st'])+'.'+inttostr(ReadDataSet['Number_kekv']);
  Registration_Form.cxGrid1TableView1.DataController.Values[i, 1] := ReadDataSet['SUMMA'];
  Registration_Form.cxGrid1TableView1.DataController.Values[i, 2]:=ReadDataSet['KOD_SM'];
  Registration_Form.cxGrid1TableView1.DataController.Values[i, 3]:=ReadDataSet['KOD_RAZD'];
  Registration_Form.cxGrid1TableView1.DataController.Values[i, 4]:=ReadDataSet['KOD_ST'];
  Registration_Form.cxGrid1TableView1.DataController.Values[i, 5]:=ReadDataSet['KOD_KEKV'];
  ReadDataSet.Next;
 end;
 ReadDataSet.close;
 ReadDataSet.SelectSQL.Clear;
 Registration_Form.Sum_Result.Value:=0;

  for i:=0 to  Registration_Form.cxGrid1TableView1.DataController.RecordCount-1 do begin
  Registration_Form.Sum_Result.Value:= Registration_Form.Sum_Result.Value + Registration_Form.cxGrid1TableView1.DataController.Values[i, 1];
  end; 
 end
 else begin
 ReadDataSet.close;
 ReadDataSet.SelectSQL.Clear;
 end;
 end;

 ReadDataSet.close;
 ReadDataSet.SelectSQL.Clear;

  // Выбираем историю категорий проживания
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFKAT_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form.cxGridTableView1.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form.cxGridTableView1.DataController.Values[i, 0] := ReadDataSet['NUM_KATEGORIYA'];
    Registration_Form.cxGridTableView1.DataController.Values[i, 1] := ReadDataSet['BEG_DATE'];
    Registration_Form.cxGridTableView1.DataController.Values[i, 2] := ReadDataSet['END_DATE'];
    Registration_Form.cxGridTableView1.DataController.Values[i, 3] := ReadDataSet['KATEGORIYA'];
    Registration_Form.cxGridTableView1.DataController.Values[i, 4] := ReadDataSet['SHORT_NAME_CATEGORY'];
    Registration_Form.cxGridTableView1.DataController.Values[i, 6] := ReadDataSet['PAY_SUM'];
    ReadDataSet.Next;
   end;
  ReadDataSet.Close;
  Registration_Form.SortGridData;

 // Выбираем историю проживания
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_HROOM_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form.cxGridTableView_of_Live.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do begin
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 0] := ReadDataSet['NUM_BUILD'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 1] := ReadDataSet['Room_Combo'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 2] := ReadDataSet['BEG_DATE'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 3] := ReadDataSet['END_DATE'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 4] := ReadDataSet['Kod_Build'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 5] := ReadDataSet['N_Room'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 6] := ReadDataSet['Type_Room'];
  Registration_Form.cxGridTableView_of_Live.DataController.Values[i, 7] := ReadDataSet['SHORT_NAME'];
  ReadDataSet.Next;
 end;
 ReadDataSet.Close;
 Registration_Form.SortGridData_Live;

 // выбираем историю субсидий
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFSUB_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form.cxGridTableView2.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do begin
  Registration_Form.cxGridTableView2.DataController.Values[i, 0] := ReadDataSet['BEG_DATE'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 1] := ReadDataSet['END_DATE'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 2] := ReadDataSet['SUMMA'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 3] := ReadDataSet['CNT_MONTH'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 4] := ReadDataSet['NAME_STATE'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 5] := ReadDataSet['ID_SUBSIDY'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 6] := ReadDataSet['ID_STATE'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 7] := ReadDataSet['COMMENT'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 8] := ReadDataSet['FULL_NAME'];
  Registration_Form.cxGridTableView2.DataController.Values[i, 9] := ReadDataSet['SHORT_NAME'];
  ReadDataSet.Next;
 end;
 ReadDataSet.Close;
// Registration_Form.SortGridData_Subsidy;
 // выбираем историю льгот
 ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_PFLGOT_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form.cxGridTableView3.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do begin
  Registration_Form.cxGridTableView3.DataController.Values[i, 0] := ReadDataSet['Num_Lg'];
  Registration_Form.cxGridTableView3.DataController.Values[i, 1] := ReadDataSet['BEG_DATE'];
  Registration_Form.cxGridTableView3.DataController.Values[i, 2] := ReadDataSet['END_DATE'];
  Registration_Form.cxGridTableView3.DataController.Values[i, 3] := ReadDataSet['ID_LG'];
  Registration_Form.cxGridTableView3.DataController.Values[i, 4] := ReadDataSet['NAME_LG'];
  ReadDataSet.Next;
 end;
 ReadDataSet.Close;
 Registration_Form.SortGridData_Lg;

 Registration_Form.cxGridTableView_of_Live.DataController.FocusedRowIndex := 0;

  if Registration_Form.cxGridTableView1.DataController.RecordCount >0 then
  begin
  Registration_Form.cxGridTableView1.DataController.FocusedRowIndex := 0;
  end;

  if Registration_Form.cxGridTableView_of_Live.DataController.RecordCount >0 then
  begin
  Registration_Form.cxGridTableView_of_Live.DataController.FocusedRowIndex := 0;
  end;

  if Registration_Form.cxGridTableView2.DataController.RecordCount >0 then
  begin
  Registration_Form.cxGridTableView2.DataController.FocusedRowIndex := 0;
  end;

  if Registration_Form.cxGridTableView3.DataController.RecordCount >0 then
  begin
  Registration_Form.cxGridTableView3.DataController.FocusedRowIndex := 0;
  end;
Registration_Form.ShowModal;
  Screen.Cursor:=crDefault;

end;

procedure TSt_sp_build_livers_Form_Oplata.DateEndEdit_OplataPropertiesChange(
  Sender: TObject);
var TryDate : TDateTime;
    enter: char;
begin
if Summa_RadioButton.Checked then exit;
    if FirstLoad=0 then exit;
    enter :=#13;
    if Length(DateEndEdit_Oplata.Text)= 10 then
    begin
     DateEndEdit_Oplata.Date:=strtodate(DateEndEdit_Oplata.text);
     SummaEdit.text:='';
     St_sp_build_livers_Form_Oplata.DateEndEdit_OplataKeyPress(
     DateEndEdit_Oplata,enter );
    end;
end;

procedure TSt_sp_build_livers_Form_Oplata.FormCreate(Sender: TObject);
begin
  FirstLoad := 0;

  MemoryData_service.Open;
end;

procedure TSt_sp_build_livers_Form_Oplata.dxBarLargeButton2Click(
  Sender: TObject);
begin
  LoadPackegeStudCity.LoadViewPrintPropi(self,SheglovHandle, SheglovItem_id, 0,'ST_PAY_CALC');
end;

procedure TSt_sp_build_livers_Form_Oplata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteProc.StoredProcName := 'ST_PAY_TMP_CLEAR';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_pay;
  WriteProc.ExecProc;
  WriteProc.Transaction.Commit;
  WriteProc.Close;

  WriteProc.StoredProcName := 'ST_CALC_TMP_CLEAR';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  WriteProc.ExecProc;
  WriteProc.Transaction.Commit;
  WriteProc.Close;
end;

procedure TSt_sp_build_livers_Form_Oplata.CheckBox_servicePropertiesChange(
  Sender: TObject);
begin
  if CheckBox_service.Checked
   then St_sp_build_livers_Form_Oplata.Width := St_sp_build_livers_Form_Oplata.Width + 464
   else St_sp_build_livers_Form_Oplata.Width := St_sp_build_livers_Form_Oplata.Width - 464;
end;

procedure TSt_sp_build_livers_Form_Oplata.Button_selectClick(
  Sender: TObject);
var
  i : Integer;
begin
  MemoryData_service.First;
  For i := 0 to MemoryData_service.RecordCount - 1 do
   Begin
    MemoryData_service.Edit;
    MemoryData_service.FieldByName('md_check').AsVariant := 1;
    MemoryData_service.post;
    MemoryData_service.Next;
   end;
end;

procedure TSt_sp_build_livers_Form_Oplata.Button_unselectClick(
  Sender: TObject);
var
  i : Integer;
begin
  MemoryData_service.First;
  For i := 0 to MemoryData_service.RecordCount - 1 do
   Begin
    MemoryData_service.Edit;
    MemoryData_service.FieldByName('md_check').AsVariant := 0;
    MemoryData_service.post;
    MemoryData_service.Next;
   end;
end;

procedure TSt_sp_build_livers_Form_Oplata.Button_convertClick(
  Sender: TObject);
var
  i : Integer;
begin
  MemoryData_service.First;
  For i := 0 to MemoryData_service.RecordCount - 1 do
   Begin
    MemoryData_service.Edit;
    MemoryData_service.FieldByName('md_check').AsVariant := 1 - MemoryData_service.FieldByName('md_check').AsVariant;
    MemoryData_service.post;
    MemoryData_service.Next;
   end;
end;

procedure TSt_sp_build_livers_Form_Oplata.ReCalcSumService;
var
  i : Integer;
  all_procent : double;
  delta, summa : Double;
begin
  MemoryData_service.First;
  all_procent := 0;
  For i := 0 to MemoryData_service.RecordCount - 1 do
   Begin
    if MemoryData_service.FieldByName('md_check').AsVariant = 1 then all_procent := all_procent + MemoryData_service.FieldByName('md_procent').AsFloat;
    MemoryData_service.Next;
   end;

  delta := 0;
  MemoryData_service.First;
  For i := 0 to MemoryData_service.RecordCount - 1 do
   Begin
    MemoryData_service.Edit;
    if MemoryData_service.FieldByName('md_check').AsVariant = 1 then
     Begin
      //ShowMessage('md= '+FloatToStr(MemoryData_service['md_procent']));
      summa := round(((SummaEdit.EditValue * MemoryData_service['md_procent'] / all_procent) + delta) * 100) / 100;
      //ShowMessage('sum= '+FloatToStr(summa));
      delta := ((SummaEdit.EditValue * MemoryData_service['md_procent'] / all_procent) + delta) - summa;
      //ShowMessage('delta= '+FloatToStr(delta));
      MemoryData_service.FieldByName('md_sum').AsFloat := summa;
     End 
     else MemoryData_service.FieldByName('md_sum').AsFloat := 0;
    MemoryData_service.Post;
    MemoryData_service.Next;
   end;
end;

procedure TSt_sp_build_livers_Form_Oplata.SummaEditExit(Sender: TObject);
begin
  ReCalcSumService;
end;

procedure TSt_sp_build_livers_Form_Oplata.Button_recalcClick(
  Sender: TObject);
begin
  ReCalcSumService;
end;

end.
