unit cn_ContractsList_Oplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxButtons,
  cxCurrencyEdit, cxRadioGroup, cxGroupBox, DB,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, ImgList, dxBar, dxBarExtItems, ActnList,
  cxGraphics, dxStatusBar,IBase, cn_Common_Types, cn_Common_Loader, cnConsts,
  cnConsts_Messages, cn_ContractsList_Look, cn_Common_WaitForm;

type TReportNeed = record
     ID_DOG_LAST : int64;
     ID_STUD : int64;
     FIO : string;
     NUM_DOG : string;
end;
type
  TfrmContractsList_Oplata = class(TForm)
    FIO_Edit: TcxTextEdit;
    FIO_Label: TLabel;
    DatesActionDog_Label: TLabel;
    DateEndEdit: TcxDateEdit;
    Po1_Label: TcxLabel;
    DateBegEdit: TcxDateEdit;
    OkButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Summa_RadioButton: TcxRadioButton;
    Period_RadioButton: TcxRadioButton;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    PeriodPay_Label: TLabel;
    DateEndEdit_Oplata: TcxDateEdit;
    Po2_Label: TcxLabel;
    DateBegEdit_Oplata: TcxDateEdit;
    S2_Label: TcxLabel;
    SummaEdit: TcxCurrencyEdit;
    EnterSum_Label: TLabel;
    cxLabel4: TcxLabel;
    S1_Label: TcxLabel;
    NeedPay_Label: TLabel;
    cn_SNeed_Edit: TcxCurrencyEdit;
    cxLabel6: TcxLabel;
    WhosPay_Label: TLabel;
    cn_UplSum_Edit: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    Borg_Label: TLabel;
    Zadolgnost_Edit: TcxCurrencyEdit;
    cxLabel8: TcxLabel;
    ReadDataSet: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    pFIBTransaction1: TpFIBTransaction;
    dxBarManager1: TdxBarManager;
    DocsButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    CalcButton: TdxBarLargeButton;
    ImageList1: TImageList;
    pFIBStoredProc1: TpFIBStoredProc;
    ActionList1: TActionList;
    CloseApplyAction: TAction;
    HotKey_StatusBar: TdxStatusBar;
    dxStatusBar1: TdxStatusBar;
    GoButton: TdxBarLargeButton;
    CancelButton: TdxBarLargeButton;
    ModeChangeAction: TAction;
    ViewButton: TdxBarLargeButton;
    DB: TpFIBDatabase;
    procedure OkButtonClick(Sender: TObject);
    procedure Period_RadioButtonClick(Sender: TObject);
    procedure Summa_RadioButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateEndEdit_OplataKeyPress(Sender: TObject; var Key: Char);
    procedure SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure DocsButtonClick(Sender: TObject);
    procedure CalcButtonClick(Sender: TObject);
    procedure CloseApplyActionExecute(Sender: TObject);
    procedure GoButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ModeChangeActionExecute(Sender: TObject);
    procedure DateEndEdit_OplataPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PrintButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
  private
    ID_STUD: int64;
    PLanguageIndex : byte;
    FirstDateProg : TDate;
    FirstLoad: Smallint;
    aOwner : Tcomponent;
    BarCode    : int64;
    wf : TForm;
  procedure FormIniLanguage;
  public
   KeyField: Int64;
   stInsOst: Currency; // сумма входящего остатка
   PeriodCheck: Smallint;
   Facultet: string;
   Kurs: smallint;
   ReportNeed :  TReportNeed;
   id_session_pay,
   id_session_calc: int64;

   SheglovHandle: TISC_DB_HANDLE;
   SheglovItem_id: Int64;

   constructor  Create(aOwner : TComponent; InCurrentConnect : TCurrentConnect; InID_STUD: int64);reintroduce;
  end;


implementation

uses cn_ContractsList_Unit;


{$R *.dfm}

constructor TfrmContractsList_Oplata.Create(aOwner : TComponent; InCurrentConnect : TCurrentConnect; InID_STUD: int64);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(aOwner);
  Self.aOwner := aOwner;
  DB.Handle := InCurrentConnect.Db_Handle;
  PLanguageIndex:= InCurrentConnect.PLanguageIndex;
  ID_STUD :=InID_STUD;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
end;

procedure TfrmContractsList_Oplata.FormIniLanguage;
begin
 // индекс языка (1-укр, 2 - рус)

 //кэпшн формы
 Caption:=                      cnConsts.cn_OplataCaption[PLanguageIndex];
 //названия кнопок
 FIO_Label.Caption:=            cnConsts.cn_grid_FIO_Column[PLanguageIndex];

 DatesActionDog_Label.Caption:= cnConsts.cn_ActionDates[PLanguageIndex];
 S1_Label.Caption:=             cnConsts.cn_Z[PLanguageIndex];
 Po1_Label.Caption:=            cnConsts.cn_Po[PLanguageIndex];
 Period_RadioButton.Caption:=   cnConsts.cn_PayPeriod[PLanguageIndex];
 Summa_RadioButton.Caption:=    cnConsts.cn_SumCheck[PLanguageIndex];
 NeedPay_Label.Caption:=        cnConsts.cn_NeedPay[PLanguageIndex];
 WhosPay_Label.Caption:=        cnConsts.cn_WhosPay[PLanguageIndex];
 Borg_Label.Caption:=           cnConsts.cn_Borg[PLanguageIndex];
 PeriodPay_Label.Caption:=      cnConsts.cn_PayPeriod[PLanguageIndex];
 S2_Label.Caption:=             cnConsts.cn_Z[PLanguageIndex];
 Po2_Label.Caption:=            cnConsts.cn_Po[PLanguageIndex];
 EnterSum_Label.Caption:=       cnConsts.cn_EnterSum[PLanguageIndex];

 ViewButton.Caption:=           cnConsts.cn_View[PLanguageIndex];
 CalcButton.Caption:=           cnConsts.cn_Pay[PLanguageIndex];
 CalcButton.Hint:=              cnConsts.cn_Pay[PLanguageIndex];
 PrintButton.Caption:=          cnConsts.cn_Print_Caption[PLanguageIndex];
 GoButton.Caption:=             cnConsts.cn_Accept[PLanguageIndex];
 CancelButton.Caption:=         cnConsts.cn_Cancel[PLanguageIndex];

 HotKey_StatusBar.Panels[0].Text:=  cnConsts.cn_F3Btn_ShortCut[PLanguageIndex]  + cnConsts.cn_ViewShort_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[1].Text:=  cnConsts.cn_PaymentBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_Pay[PLanguageIndex];
 HotKey_StatusBar.Panels[2].Text:=  cnConsts.cn_PrintBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_PrintShort_Caption[PLanguageIndex];
 dxStatusBar1.Panels[0].Text:=      cnConsts.cn_ModeBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_ModeBtn_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text:=      cnConsts.cn_F10Btn_ShortCut[PLanguageIndex]  + cnConsts.cn_Accept[PLanguageIndex];
 dxStatusBar1.Panels[2].Text:=      cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_Cancel[PLanguageIndex];

 HotKey_StatusBar.Hint:=        cnConsts.cn_HotKeys[PLanguageIndex];
 dxStatusBar1.Hint:=            cnConsts.cn_HotKeys[PLanguageIndex];
end;

procedure TfrmContractsList_Oplata.OkButtonClick(Sender: TObject);
begin
  if SummaEdit.Text <> ''
   then SummaEdit.Value := StrToCurr(SummaEdit.Text) ;


  if ((SummaEdit.Value = 0) or (SummaEdit.Text='')) then
   begin
    ShowMessage(pchar(cnConsts_Messages.cn_SummaNotNul_Prohibition[PLanguageIndex]));
    if SummaEdit.enabled
     then SummaEdit.SetFocus;
   exit;
   end;
   
  ModalResult := mrOk;
end;

procedure TfrmContractsList_Oplata.Period_RadioButtonClick(
  Sender: TObject);
  begin
 SummaEdit.Properties.ReadOnly:= true;
 SummaEdit.Style.Color:= clBtnFace;


 cxLabel4.Enabled:=false;
 DateEndEdit_Oplata.Enabled:=True;
 DateEndEdit_Oplata.Properties.ReadOnly:= false;
 DateEndEdit_Oplata.Style.Color:= clInfoBk;

 DateBegEdit_Oplata.Enabled:=True;
 DateEndEdit_Oplata.SetFocus;
 PeriodPay_Label.Enabled:=true;
 S2_Label.Enabled:=true;
 Po2_Label.Enabled:=true;
end;

procedure TfrmContractsList_Oplata.Summa_RadioButtonClick(
  Sender: TObject);
begin
 SummaEdit.Enabled:=true;
 SummaEdit.Properties.ReadOnly:= false;
 SummaEdit.Style.Color:= clInfoBk;
{ if St_SumDopl_Edit.Visible then
 SummaEdit.Value:= St_SumDopl_Edit.Value
 else SummaEdit.Value:=0;}
 SummaEdit.SetFocus;
 EnterSum_Label.Enabled:=true;
 cxLabel4.Enabled:=true;
 DateEndEdit_Oplata.Properties.ReadOnly:= true;
 DateEndEdit_Oplata.Style.Color:= clBtnFace;

 DateBegEdit_Oplata.Enabled:=false;
 DateEndEdit_Oplata.Clear;
 DateBegEdit_Oplata.Clear;
 Po2_Label.Enabled:=false;
end;

procedure TfrmContractsList_Oplata.FormShow(Sender: TObject);
var enter: char;
begin
FirstLoad:=1;
 if PeriodCheck=1 then begin
 Period_RadioButton.Checked:=true;
 DateBegEdit_Oplata.Enabled:=true;
 SummaEdit.Properties.ReadOnly:= true;
 SummaEdit.Style.Color:= clBtnFace;
 DateEndEdit_Oplata.Enabled:=true;
 Po2_Label.Enabled:=true;
 S2_Label.Enabled:=true;
 cxLabel4.Enabled:=false;
  PeriodPay_Label.Enabled:=true;
 DateEndEdit_Oplata.SetFocus;
 end;

 if PeriodCheck=0 then begin
 Summa_RadioButton.Checked:=true;
 DateBegEdit_Oplata.Properties.ReadOnly:= true;
 DateBegEdit_Oplata.Style.Color:= clBtnFace;
 SummaEdit.Enabled:= true;
 DateEndEdit_Oplata.Enabled:=false;
 Po2_Label.Enabled:=false;
 S2_Label.Enabled:=false;
 cxLabel4.Enabled:=true;
  PeriodPay_Label.Enabled:=false;
 SummaEdit.SetFocus;
 SummaEdit.SetSelection(0, Length(SummaEdit.Text));
 end;

FirstDateProg :=DateEndEdit_Oplata.Date;

enter:=#13;
DateEndEdit_OplataKeyPress
(
DateEndEdit_Oplata,enter
);

end;

procedure TfrmContractsList_Oplata.DateEndEdit_OplataKeyPress(
  Sender: TObject; var Key: Char);
begin
if key=#13 then begin
if DateBegEdit_Oplata.Date>DateEndEdit_Oplata.Date then begin
ShowMessage(pchar(cnConsts_Messages.cn_Dates_Prohibition[PLanguageIndex]));  //Дата початку не може бути більш, ніж дата закінчення!
DateEndEdit_Oplata.SetFocus;
exit;
end;

if  DateEndEdit_Oplata.Date > FirstDateProg then begin
ShowMessage(pchar(cnConsts_Messages.cn_Period_Prohibition[PLanguageIndex])); //Дата закінчення вийшла за період дії контракту!
DateEndEdit_Oplata.SetFocus;
exit;
end;

Screen.Cursor:=crHourGlass;
  if StProc.Open then  StProc.close;

  StProc.StoredProcName := 'CN_CALC_TMP_CLEAR';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  StProc.ExecProc;
  StProc.Transaction.Commit;
  StProc.Close;

  StProc.StoredProcName := 'CN_CALC';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID_STUD').AsInt64 := ID_STUD ;
  StProc.ParamByName('BEG_CHECK').AsDate :=DateBegEdit_Oplata.Date;
  StProc.ParamByName('END_CHECK').AsDate :=DateEndEdit_Oplata.Date;
  StProc.ExecProc;

  if Zadolgnost_Edit.Value >= StProc.ParamByName('CN_SNEED').AsCurrency then
  SummaEdit.Value:= StProc.ParamByName('CN_SNEED').AsCurrency
  else SummaEdit.Value:= Zadolgnost_Edit.Value;

 SummaEdit.SetSelection(0, Length(SummaEdit.Text));
 
 if Zadolgnost_Edit.Value <0 then  SummaEdit.value:= -1*Zadolgnost_Edit.Value;

  id_session_calc:= StProc.ParamByName('ID_SESSION').AsInt64;
  StProc.Transaction.Commit;
  StProc.Close;
  Screen.Cursor:=crDefault;


  StProc.StoredProcName := 'CN_CALC_TMP_CLEAR';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  StProc.ExecProc;
  StProc.Transaction.Commit;
  StProc.Close;

end;
end;

procedure TfrmContractsList_Oplata.SummaEditKeyPress(
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
  if StProc.Open then  StProc.close;

  StProc.StoredProcName := 'CN_CALC_TMP_CLEAR';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  StProc.ExecProc;
  StProc.Transaction.Commit;
  StProc.Close;

  StProc.StoredProcName := 'CN_CALC';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID_STUD').AsInt64 := ID_STUD ;
  StProc.ParamByName('BEG_CHECK').AsDate:=strtodate('01.01.1900');
  StProc.ParamByName('END_CHECK').AsDate:=strtodate('01.01.3050');
  StProc.ParamByName('CNUPLSUM').AsCurrency :=cn_UplSum_Edit.Value+ SummaEdit.Value;
  StProc.ExecProc;
  DateEndEdit_Oplata.Date:= StProc.ParamByName('CNDATEOPL').AsDate;
  datetostr(StProc.ParamByName('CNDATEOPL').AsDate);
  id_session_calc:= StProc.ParamByName('ID_SESSION').AsInt64;
  StProc.Transaction.Commit;
  StProc.Close;
  Screen.Cursor:=crDefault;

  StProc.StoredProcName := 'CN_CALC_TMP_CLEAR';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  StProc.ExecProc;
  StProc.Transaction.Commit;
  StProc.Close;

  end;
end;

procedure TfrmContractsList_Oplata.DocsButtonClick(
  Sender: TObject);
begin
Screen.Cursor:=crHourGlass;
{  DocsOpl_Form:= TDocsOpl_Form.Create(Self);

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
  end;                       }
  Screen.Cursor:=crDefault;
end;

procedure TfrmContractsList_Oplata.CalcButtonClick(
  Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DB.Handle;
 AParameter.Formstyle:=fsNormal;
 AParameter.WaitPakageOwner:= self;
 AParameter.cnParamsToPakage.ID_STUD:=ID_STUD;
 RunFunctionFromPackage(AParameter, 'Contracts\cn_inf_PaymentAnalysis.bpl','ShowPayment');
 end;

procedure TfrmContractsList_Oplata.CloseApplyActionExecute(
  Sender: TObject);
begin
OkButtonClick(Sender);
end;

procedure TfrmContractsList_Oplata.GoButtonClick(
  Sender: TObject);
  var enter : char;
begin
  if SummaEdit.Value > 1000000 then
   begin
    showmessage('Значение суммы слишком велико и превышает допустимое.'+ #13+ 'Подумайте, есть ли в этом смысл, вводить сумму, больше миллиона ?');
    SummaEdit.SetFocus;
    exit;
   end;
  if Summa_RadioButton.Checked then
   begin
    enter:=#13;
    SummaEditKeyPress(SummaEdit, enter);
   end;

  OkButtonClick(Sender);
end;

procedure TfrmContractsList_Oplata.CancelButtonClick(
  Sender: TObject);
begin
close;
end;

procedure TfrmContractsList_Oplata.ModeChangeActionExecute(
  Sender: TObject);
begin
 if Summa_RadioButton.Checked = true then begin
 Summa_RadioButton.Checked:=false;
 Period_RadioButton.Checked:=true;
 Period_RadioButtonClick(Sender);
 exit;
 end;
 if Period_RadioButton.Checked = true then begin
 Period_RadioButton.Checked:=false;
 Summa_RadioButton.Checked:=true;
 Summa_RadioButtonClick(Sender);
 exit;
 end;
end;

procedure TfrmContractsList_Oplata.DateEndEdit_OplataPropertiesChange(
  Sender: TObject);
var
enter: char;
begin
if Summa_RadioButton.Checked then exit;
    if FirstLoad=0 then exit;
    enter :=#13;
    if Length(DateEndEdit_Oplata.Text)= 10 then
    begin
     DateEndEdit_Oplata.Date:=strtodate(DateEndEdit_Oplata.text);
     SummaEdit.text:='';
     DateEndEdit_OplataKeyPress(
     DateEndEdit_Oplata,enter );
    end;
end;

procedure TfrmContractsList_Oplata.FormCreate(Sender: TObject);
var cnUplSum, cnSumDoc, cnSNeed, SegodnyaOpl : Currency;
    cnDATEOPL: TDate;
    Cur_date:TDate;
    id_session_pay_cr: int64;
    id_session_calc_cr: int64;
    absDifference, Difference : Currency;
    k: Smallint;
    cnSumDopl: Currency;
begin
 FirstLoad:=0;
    // формирование корректных счетов и операций на сегодня
  With  StProc do
              begin
              try
              StoredProcName:='CN_DATE_PROV_SYS_DATA_CHECK_UPT';
              Transaction.StartTransaction;
              Prepare;
              ExecProc;
              Transaction.Commit;
              Close;
              except
              Transaction.Rollback;
              ShowMessage('Виникла помилка при виконанні процедури CN_DATE_PROV_SYS_DATA_CHECK_UPT!'+ #13+'Сбой в работе системы.');
              raise;
            end;
   end;



  With StProc do
  begin
  try
  // --------------запуск процедуры cn_pay------------------------------
  // расчет уже уплаченной суммы

  StoredProcName := 'CN_PAY';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_STUD').AsInt64 := ID_STUD;
  ParamByName('DATE_PROV_CHECK').AsShort := 1;
  ParamByName('IS_DOC_GEN').AsShort := 0;
  ParamByName('IS_PROV_GEN').AsShort := 0;
  ParamByName('IS_SMET_GEN').AsShort := 0;
  ParamByName('NOFPROV').AsShort := 1;
  ParamByName('DIGNORDOCID').AsShort := 1;
  ExecProc;


  cnUplSum:=ParamByName('CNUPLSUM').AsCurrency;
  cnSumDoc:=ParamByName('SUMMA_ALL').AsCurrency;

  id_session_pay_cr:= ParamByName('ID_SESSION').AsInt64;

  Transaction.Commit;
  Close;

  if cnUplSum > cnSumDoc then
  cn_UplSum_Edit.Value:= cnUplSum
  else
  cn_UplSum_Edit.Value:= cnSumDoc;

  // --------------запуск процедуры cn_calc------------------------------
  //
  StoredProcName := 'CN_CALC';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_STUD').AsInt64 := ID_STUD;
  if cnUplSum > cnSumDoc then  ParamByName('CNUPLSUM').AsCurrency := cnUplSum
  else
  ParamByName('CNUPLSUM').AsCurrency := cnSumDoc; // это уже с уплаченной суммой
  ExecProc;

  cn_SNeed_Edit.Value:= ParamByName('CN_SNEED').AsCurrency;
  cnSNeed:= ParamByName('CN_SNEED').AsCurrency;      //  сумма, необходимая для уплаты за весь период
  cnDATEOPL:= ParamByName('CNDATEOPL').AsDateTime;   // дата, по которую оплачено
  id_session_calc_cr:= ParamByName('ID_SESSION').AsInt64;
  DateBegEdit_Oplata.Date:= cnDATEOPL;

  Transaction.Commit;
  Close;


  if cnUplSum > cnSumDoc then
  Zadolgnost_Edit.Value:= cnSNeed - cnUplSum
  else
  Zadolgnost_Edit.Value:= cnSNeed - cnSumDoc;


  StoredProcName := 'CN_CALC_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_calc_cr;
  ExecProc;
  Transaction.Commit;
  Close;

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:= 'select Date_End from CN_GET_PAYPERIOD_ENDDATE(' + inttostr(ID_STUD)
                                + ',' + ''''+datetostr(cnDATEOPL)+''''+')' ;
  ReadDataSet.Open;
  DateEndEdit_Oplata.Date := ReadDataSet['DATE_END'];
  ReadDataSet.Close;


              cnSumDopl:= cnSNeed-cnUplSum; // это и есть разница, которую нужно уплатить !!!
{///////
            //=============================
            // для проверки - этап разработки
              StoredProcName := 'CN_CALC';
              Transaction.StartTransaction;
              Prepare;
              ParamByName('ID_STUD').AsInt64 := ID_STUD;
              ParamByName('BEG_CHECK').AsDateTime := DateBegEdit.Date;
              ParamByName('END_CHECK').AsDateTime := CNDATEOPL;
              ExecProc;
                 id_session_calc_cr:= ParamByName('ID_SESSION').AsInt64;

              cnOstSum:= cnUplSum - ParamByName('CN_SNEED').AsCurrency;
              Transaction.Commit;
              close;

                StoredProcName := 'CN_CALC_TMP_CLEAR';
                Transaction.StartTransaction;
                Prepare;
                ParamByName('ID_SESSION').AsInt64 := id_session_calc_cr;
                ExecProc;
                Transaction.Commit;
                Close;
            // для проверки - этап разработки
            //=============================
}
              absDifference:= abs(cnSumDopl);
              Difference:= cnSumDopl;
              if absDifference >=0.00001 then
               begin
                if Difference>=0 then
                 begin
                  Zadolgnost_Edit.Value:= Difference;
                 end
                  else
                 begin
                  if Difference<0 then
                   begin
                    k:=-1;
                    Borg_Label.Caption:= cnConsts.cn_Pereplata[PLanguageIndex]
                   end
                    else
                   begin
                    k:=1;
                    Borg_Label.Caption:= cnConsts.cn_Zaborgov[PLanguageIndex];
                   end;
                  Zadolgnost_Edit.Value:= Difference*k;
                 end;
               end
                else
               begin
                Zadolgnost_Edit.Visible:=false;
                cxLabel8.Visible:=false;
                Borg_Label.Font.Style:=[fsBold];
                Borg_Label.Caption:= cnConsts.cn_FullPay[PLanguageIndex];
                Borg_Label.Left :=  Borg_Label.Left + 80; 
                SummaEdit.Value:=0;
               end;

  // --------------запуск процедуры cn_calc------------------------------
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
ReadDataSet.Open;
Cur_date:= ReadDataSet['CUR_DATE'];
ReadDataSet.Close;

  //
 if (cnDATEOPL <= Cur_date) then begin
  StoredProcName := 'CN_CALC';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_STUD').AsInt64 := ID_STUD;
  ParamByName('BEG_CHECK').AsVariant := cnDATEOPL;
  ParamByName('CNUPLSUM').AsVariant := null;
  ParamByName('END_CHECK').AsDate := Cur_date;

  ExecProc;
  SegodnyaOpl:=ParamByName('cn_SNEED').AsCurrency;
  id_session_calc_cr:= ParamByName('ID_SESSION').AsInt64;
  Transaction.Commit;
  Close;
  end
  else
  SegodnyaOpl:=0;

   SummaEdit.Value:= SegodnyaOpl;
   if SegodnyaOpl > Zadolgnost_Edit.Value then
   SummaEdit.Value:= Zadolgnost_Edit.Value ;

  if ((Zadolgnost_Edit.Value = 0) or (Zadolgnost_Edit.Value<0)) then
      SummaEdit.Value:= 0;

  StoredProcName := 'CN_CALC_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_calc_cr;
  ExecProc;
  Transaction.Commit;
  Close;

  StoredProcName := 'CN_PAY_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_pay_cr;
  ExecProc;
  Transaction.Commit;
  Close;

except
  Transaction.Rollback;
  showmessage('Непередбачена помилка! Зверніться до Адміністратора.');
  raise;
end;
end;
end;

procedure TfrmContractsList_Oplata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{  StProc.StoredProcName := 'CN_PAY_TMP_CLEAR';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID_SESSION').AsInt64 := id_session_pay;
  StProc.ExecProc;
  StProc.Transaction.Commit;
  StProc.Close;

  StProc.StoredProcName := 'CN_CALC_TMP_CLEAR';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  StProc.ExecProc;
  StProc.Transaction.Commit;
  StProc.Close;
 }
end;

procedure TfrmContractsList_Oplata.PrintButtonClick(Sender: TObject);
var InParameter : TcnSimpleParamsEx;
begin
 InParameter:= TcnSimpleParamsEx.Create;
 InParameter.Owner:=self;
 InParameter.Db_Handle:= DB.Handle;
 InParameter.Formstyle:=fsNormal;
 InParameter.cnParamsToPakage.ID_DOG      := ReportNeed.ID_DOG_LAST;
 InParameter.cnParamsToPakage.ID_STUD     := ReportNeed.ID_STUD;
 InParameter.cnParamsToPakage.FIO         := ReportNeed.FIO;
 InParameter.cnParamsToPakage.Num_Doc     := ReportNeed.NUM_DOG;
 InParameter.WaitPakageOwner:= self;
 RunFunctionFromPackage(InParameter, 'Contracts\cn_fr_PaymentAnalysis.bpl','frChooseReport');
 InParameter.Free;
 Screen.Cursor := crDefault;
end;

procedure TfrmContractsList_Oplata.ViewButtonClick(Sender: TObject);
var
 ViewForm:Tfrm_ContractsList_look;
 i, j, k, w, flag: integer;
 ID_DOG_ROOT : int64;
 ID_DOG      : int64;
 ID_STUD     : int64;

 ID_DOG_Convert : int64;
 ID_DOG_ROOT_Convert : int64;
 ID_RATE_ACCOUNT_Convert : int64;

 StudersCounter: byte;
 Man_Fio:array of TStudBasicInfo;

 year,month,day:Word;
 Date_beg_price, Date_End_price: TDate;
 EnableEditTipDog: boolean;
begin
  with ReadDataSet do
  begin
    Close;
    SelectSQL.Clear;
    SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
    Open;
  end;

  if ReadDataSet.FieldByName('CN_ENABLE_EDIT_TIP_DOG').AsInteger = 1 then EnableEditTipDog:=True
  else EnableEditTipDog:=false;

  if ReadDataSet['ISCOLLECT'] = 1 then   wf := ShowWaitForm(self,wfLoadPackage);

  ViewForm:= Tfrm_ContractsList_look.create(self, PLanguageIndex, DB.Handle, ReadDataSet['ISCOLLECT'], true );
  ViewForm.Caption:= cnConsts.cn_EditBtn_Caption[PLanguageIndex];

  ViewForm.TypeDogEdit.Enabled:=EnableEditTipDog;

  ViewForm.ID_DOG_ROOT                  := ReadDataSet['ID_DOG_ROOT'];
  ViewForm.ID_DOG                       := ReadDataSet['ID_DOG_LAST'];
  ViewForm.id_dog_status                := ReadDataSet['Id_dog_status'];
  If ReadDataSet['BARCODE'] <> null
   then
    Begin
     BarCode := ReadDataSet['BARCODE'];
     ViewForm.BarCode_Edit.EditValue := BarCode;
     If BarCode = -1 then ViewForm.BarCode_Edit.Text := '';
    End
   else
    Begin
     BarCode := -1;
     ViewForm.BarCode_Edit.Text := '';
    End;

  ViewForm.ID_VALUTE := -1;
  ViewForm.ButtonEdit_valute.Text := '';
  if ReadDataSet['id_valute'] <> null then
   Begin
    ViewForm.ID_VALUTE := ReadDataSet['id_valute'];
    ViewForm.ButtonEdit_valute.Text := ReadDataSet['NAME_VALUTE'];
   end;

  ViewForm.ID_STUD_in                   := ReadDataSet['ID_STUD'];
  ViewForm.Num_Dog_Edit.Text            :=  ReadDataSet['NUM_DOG'];
  ViewForm.Date_Zakl_DateEdit.Date      :=  strtodate(ReadDataSet['DATE_DOG']);
  if ReadDataSet['DATE_BEG'] <> null
   then ViewForm.Date_Beg_DateEdit.Date :=  strtodate(ReadDataSet['DATE_BEG']);
  if ReadDataSet['DATE_END'] <> null
   then ViewForm.Date_End_DateEdit.Date :=  strtodate(ReadDataSet['DATE_END']);
  if ReadDataSet['ID_TYPE_ACTION'] <> null
   then ViewForm.ID_TYPE_ACTION         :=ReadDataSet['ID_TYPE_ACTION'];

  if ReadDataSet['ISMAINDOG'] = 1
   then ViewForm.Base_Dog_RadioButton.Checked  := true
   else ViewForm.Addit_Dog_RadioButton.Checked :=  true;


 ViewForm.ID_TYPE_DOG := ReadDataSet['ID_TYPE_DOG'];

 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text := 'select * from CN_GET_TYPEDOG_PARAMS_BY_ID(' + IntToStr(ReadDataSet['ID_TYPE_DOG']) + ')';
 ReadDataSet.Open;
 if ReadDataSet['CODENAME'] <> null then
   ViewForm.TypeDogEdit.Text := ReadDataSet['CODENAME'];
 //if ReadDataSet['NAME'] <> null then
 //  ViewForm.NameTypeDogLabel.Caption := ReadDataSet['NAME'];
 ReadDataSet.Close;



// работает ReadDataSet - забиваем гриды информацией
// информация по студенту
 ReadDataSet.SelectSQL.Clear;
 ID_DOG_ROOT_Convert := ReadDataSet['ID_DOG_ROOT'];
 ID_DOG_Convert      := ReadDataSet['ID_DOG_LAST'];
 ReadDataSet.SelectSQL.Text := 'select * from CN_DT_ALL_STUDINFO_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 ReadDataSet.Open;
 ReadDataSet.FetchAll;
 ReadDataSet.First;
 for i:=0 to ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_fioTableView.DataController.RecordCount := ViewForm.Grid_fioTableView.DataController.RecordCount + 1;
   ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 0]  := ReadDataSet['FIO_PEOPLE'];
{ид_ман}
   ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 17] := ReadDataSet['ID_MAN'];
   if ReadDataSet['ID_MAN_PARENT'] <> null then
    begin
     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 20] := ReadDataSet['ID_MAN_PARENT'];
     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 21]  := ReadDataSet['FIO_PORUCHITEL'];
    end;
{дата_начала}        ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 1] :=  ReadDataSet['DATE_BEG'];
{дата_конца}         ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 2] :=  ReadDataSet['DATE_END'];
{факультет}          ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 3] :=  ReadDataSet['NAME_FACUL'];
{специальность}      ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 4] :=  ReadDataSet['NAME_SPEC'];
{группа}             ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 5] :=  ReadDataSet['NAME_GROUP'];
{форма_обучения}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 6] :=  ReadDataSet['NAME_FORM_STUD'];
{категория_обучения} ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 7] :=  ReadDataSet['NAME_KAT_STUD'];
{национальность}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 8] :=  ReadDataSet['NAME_NAZIONAL'];
{курс}               ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 9] :=  ReadDataSet['KURS'];
{сумма}              ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 10] := ReadDataSet['SUMMA_INF'];

{ид_факультета}      ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 11] := ReadDataSet['ID_FACUL'];
{ид_спец}            ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 12] := ReadDataSet['ID_SPEC'];
{ид_группы}          ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 13] := ReadDataSet['ID_GROUP'];
{ид_формыобуч}       ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 14] := ReadDataSet['ID_FORM_STUD'];
{ид_категоробуч}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 15] := ReadDataSet['ID_KAT_STUD'];
{ид_национал}        ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 16] := ReadDataSet['ID_NATIONAL'];
{ид_студ}            ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 18] := ReadDataSet['ID_STUD'];
{SUM_ENTRY_REST}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 19] := ReadDataSet['SUM_ENTRY_REST'];
  ReadDataSet.Next;
  end;
 ReadDataSet.Close;

    //------------------------------------------------------------------------------
    ReadDataSet.close;
    ReadDataSet.SQLs.SelectSQL.Clear;
    ReadDataSet.SQLs.SelectSQL.Add('SELECT * FROM CN_GET_SUMM_FROM_STAGE_OPL(:id_dog,:id_dog_root)');
    ReadDataSet.ParamByName('ID_DOG').AsInt64:= ID_DOG_Convert;
    ReadDataSet.ParamByName('ID_DOG_ROOT').AsInt64:=ID_DOG_ROOT_Convert;
    readDataSet.open;

    If ReadDataSet['Summ1'] <> null then ViewForm.Summ1:=ReadDataSet['summ1'] else ViewForm.summ1:=0;
    If ReadDataSet['Summ2'] <> null then ViewForm.Summ2:=ReadDataSet['summ2'] else ViewForm.summ2:=0;
    If ReadDataSet['Summ3'] <> null then ViewForm.Summ3:=ReadDataSet['summ3'] else ViewForm.summ3:=0;
    If ReadDataSet['Summ4'] <> null then ViewForm.Summ4:=ReadDataSet['summ4'] else ViewForm.summ4:=0;
    If ReadDataSet['Summ5'] <> null then ViewForm.Summ5:=ReadDataSet['summ5'] else ViewForm.summ5:=0;
    If ReadDataSet['Summ6'] <> null then ViewForm.Summ6:=ReadDataSet['summ6'] else ViewForm.summ6:=0;
    If ReadDataSet['Summ7'] <> null then ViewForm.Summ7:=ReadDataSet['summ7'] else ViewForm.summ7:=0;
    If ReadDataSet['Summ8'] <> null then ViewForm.Summ8:=ReadDataSet['summ8'] else ViewForm.summ8:=0;

    If ReadDataSet['term1'] <> null then ViewForm.term_stud1:=ReadDataSet['term1'] else ViewForm.term_stud1:=0;
    If ReadDataSet['term2'] <> null then ViewForm.term_stud2:=ReadDataSet['term2'] else ViewForm.term_stud2:=0;
    If ReadDataSet['term3'] <> null then ViewForm.term_stud3:=ReadDataSet['term3'] else ViewForm.term_stud3:=0;
    If ReadDataSet['term4'] <> null then ViewForm.term_stud4:=ReadDataSet['term4'] else ViewForm.term_stud4:=0;
    If ReadDataSet['term5'] <> null then ViewForm.term_stud5:=ReadDataSet['term5'] else ViewForm.term_stud5:=0;
    If ReadDataSet['term6'] <> null then ViewForm.term_stud6:=ReadDataSet['term6'] else ViewForm.term_stud6:=0;
    If ReadDataSet['term7'] <> null then ViewForm.term_stud7:=ReadDataSet['term7'] else ViewForm.term_stud7:=0;
    If ReadDataSet['term8'] <> null then ViewForm.term_stud8:=ReadDataSet['term8'] else ViewForm.term_stud8:=0;

    If ReadDataSet['Date_beg1'] <> null then  ViewForm.Date_beg_stud1 := ReadDataSet['Date_beg1'];
    If ReadDataSet['Date_end1'] <> null then  ViewForm.Date_end_stud1 := ReadDataSet['Date_end1'];
    If ReadDataSet['Date_beg2'] <> null then  ViewForm.Date_beg_stud2 := ReadDataSet['Date_beg2'];
    If ReadDataSet['Date_end2'] <> null then  ViewForm.Date_end_stud2 := ReadDataSet['Date_end2'];
    If ReadDataSet['Date_beg3'] <> null then  ViewForm.Date_beg_stud3 := ReadDataSet['Date_beg3'];
    If ReadDataSet['Date_end3'] <> null then  ViewForm.Date_end_stud3 := ReadDataSet['Date_end3'];
    If ReadDataSet['Date_beg4'] <> null then  ViewForm.Date_beg_stud4 := ReadDataSet['Date_beg4'];
    If ReadDataSet['Date_end4'] <> null then  ViewForm.Date_end_stud4 := ReadDataSet['Date_end4'];
    If ReadDataSet['Date_beg5'] <> null then  ViewForm.Date_beg_stud5 := ReadDataSet['Date_beg5'];
    If ReadDataSet['Date_end5'] <> null then  ViewForm.Date_end_stud5 := ReadDataSet['Date_end5'];

    readDataSet.Close;
//   End;

 // rate_account
 if ReadDataSet['ID_INT_ACCOUNT']<> null then
 begin
  ReadDataSet.SelectSQL.Clear;
  ID_RATE_ACCOUNT_Convert := ReadDataSet['ID_INT_ACCOUNT'];
  ReadDataSet.SelectSQL.Text := 'select * from CN_GET_RATEACC_BY_ID(' + IntToStr(ID_RATE_ACCOUNT_Convert) + ')';
  ReadDataSet.Open;
  ViewForm.Accounts.Text  := ReadDataSet['RATE_ACCOUNT'];
  ViewForm.ID_INT_Account := ReadDataSet['ID_INT_ACCOUNT'];
  //ViewForm.Account_Label.Caption :=ReadDataSet['NAME_MFO'];
  ReadDataSet.Close;
 end;

 // информация по плательщикам
 ReadDataSet.SelectSQL.Clear;
 ID_DOG_ROOT_Convert := ReadDataSet['ID_DOG_ROOT'];
 ID_DOG_Convert      := ReadDataSet['ID_DOG_LAST'];
 ReadDataSet.SelectSQL.Text := 'select * from CN_DT_PAYER_STAGE_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 ReadDataSet.Open;
 ReadDataSet.FetchAll;
 ReadDataSet.First;
 for i:=0 to ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_payersTableView.DataController.RecordCount := ViewForm.Grid_payersTableView.DataController.RecordCount + 1;
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 0]  := ReadDataSet['FIO_PAYER'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 1]  := ReadDataSet['NAME_STAGE'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 3]  := ReadDataSet['ID_TYPE_PAYER'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 4]  := ReadDataSet['ID_TYPE_STAGE'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 5]  := ReadDataSet['ISPERCENT'];
   if ReadDataSet['ISPERCENT'] =1 then
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 2]  := ReadDataSet['PERSENT']
   else
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 2]  := ReadDataSet['SUMMA'];
   if ReadDataSet['ID_PAYER'] <> null then
    ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 6]  := ReadDataSet['ID_PAYER'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 7]  := ReadDataSet['ID_RATE_ACCOUNT'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 8]  := ReadDataSet['MFO'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 9]  := ReadDataSet['RATE_ACCOUNT'];
   if ReadDataSet['ID_CUST_MEN']<> null then
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 10]  := ReadDataSet['ID_CUST_MEN'];
   ReadDataSet.Next;
  end;
 ReadDataSet.Close;

 // информация по сметам
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text := 'select * from CN_DT_DOG_SMET_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 ReadDataSet.Open;
 ReadDataSet.FetchAll;
 ReadDataSet.First;
 for i:=0 to ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_istochnikiTableView.DataController.RecordCount := ViewForm.Grid_istochnikiTableView.DataController.RecordCount + 1;
   if ReadDataSet['KOD_SM'] <> null then
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 0]  := ReadDataSet['KOD_SM'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 1]  := ReadDataSet['KOD_RAZD'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 2]  := ReadDataSet['KOD_ST'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 3]  := ReadDataSet['KOD_KEKV'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 4]  := ReadDataSet['PERSENT'];
   if ReadDataSet['ID_SMET'] <> null then
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 5]  := ReadDataSet['ID_SMET'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 6]  := ReadDataSet['ID_RAZD'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 7]  := ReadDataSet['ID_STAT'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 8]  := ReadDataSet['ID_KEKV'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 9]  := ReadDataSet['ID_MAN'];
   ReadDataSet.Next;
  end;
 ReadDataSet.Close;

 // информация по периодам оплат
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text := 'select * from CN_DT_STAGE_OPL_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ') order by DATE_BEG';
 ReadDataSet.Open;
 ReadDataSet.FetchAll;
 ReadDataSet.First;
 for i:=0 to ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_payTableView.DataController.RecordCount := ViewForm.Grid_payTableView.DataController.RecordCount + 1;
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 0]  := ReadDataSet['DATE_BEG'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 1]  := ReadDataSet['DATE_END'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 2]  := ReadDataSet['DATE_PAY'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 3]  := ReadDataSet['SUMMA'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 4]  := ReadDataSet['ID_PAYER'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 5]  := ReadDataSet['ID_MAN'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 6]  := ReadDataSet['NUM_YEAR'];
   ReadDataSet.Next;
  end;
  ReadDataSet.Close;

  if ReadDataSet['ISCOLLECT'] = 1 then CloseWaitForm(wf);

  ViewForm.ShowModal;

  ViewForm.Free;
end;

end.
