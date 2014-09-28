//******************************************************************************
// Проект "Контракты"
// Справочник для выписки счетов оплаты юр лицам 
// Чернявский А.Э. 2005г.
//******************************************************************************

unit cn_Sch_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_Sch, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cxButtonEdit, StdCtrls, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxMemo, cxGroupBox, cxLookAndFeelPainters,
  cxButtons, cxCurrencyEdit, cn_Common_Types, zProc, frxClass, frxDesgn,
  ActnList, frxDBSet, frxExportImage, frxExportHTML, frxExportXLS,
  frxExportRTF, cn_Common_Loader, cxLabel, Registry;

type
  TfrmSchToPay = class(TForm)
    Memo: TcxMemo;
    Osnovanie_Label: TLabel;
    cxGroupBox1: TcxGroupBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    SummaSch_Edit: TcxCurrencyEdit;
    NDS_Edit: TcxCurrencyEdit;
    Itogo_Edit: TcxCurrencyEdit;
    Summa_Sch_Label: TLabel;
    NDS_Label: TLabel;
    Itogo_Label: TLabel;
    cxGroupBox2: TcxGroupBox;
    Payre_Label: TLabel;
    RasShet_Label: TLabel;
    SchToPay_Label: TLabel;
    Num_Dog_Label: TLabel;
    Vid_Label: TLabel;
    id_payer_ComboBox: TcxComboBox;
    SchNumberSprav_Edit: TcxTextEdit;
    Num_Dog_Edit: TcxTextEdit;
    DateEdit: TcxDateEdit;
    RS_Edit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    frxDesigner1: TfrxDesigner;
    ActionList1: TActionList;
    Action1: TAction;
    Grid_payers: TcxGrid;
    Grid_payersTableView: TcxGridTableView;
    payer: TcxGridColumn;
    period: TcxGridColumn;
    persent: TcxGridColumn;
    type_payer: TcxGridColumn;
    id_type_stage: TcxGridColumn;
    isPercent: TcxGridColumn;
    id_payer: TcxGridColumn;
    id_rate_account: TcxGridColumn;
    mfo: TcxGridColumn;
    rate: TcxGridColumn;
    Grid_payersLevel: TcxGridLevel;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxReport: TfrxReport;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxCurrencyEdit2: TcxCurrencyEdit;
    cxCurrencyEdit3: TcxCurrencyEdit;
    ProgressBar: TcxProgressBar;
    frxJPEGExport1: TfrxJPEGExport;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    frxHTMLExport1: TfrxHTMLExport;
    Accounts: TcxButtonEdit;
    Account_Label: TLabel;
    ComboBox_Shablon: TcxComboBox;
    cxLabel1: TcxLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Itogo_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Itogo_EditKeyPress(Sender: TObject; var Key: Char);
    procedure SchNumberSprav_EditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure Num_Dog_EditKeyPress(Sender: TObject; var Key: Char);
    procedure RS_EditKeyPress(Sender: TObject; var Key: Char);
    procedure id_payer_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure MemoKeyPress(Sender: TObject; var Key: Char);
    procedure SummaSch_EditKeyPress(Sender: TObject; var Key: Char);
    procedure NDS_EditKeyPress(Sender: TObject; var Key: Char);
    procedure frxReportPrintReport(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure id_payer_ComboBoxPropertiesCloseUp(Sender: TObject);
    procedure id_payer_ComboBoxPropertiesChange(Sender: TObject);
    procedure AccountsPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ComboBox_ShablonKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex: byte;
    DM:TDM_Sch;
    NDS_Percent : Currency;
    count_print : byte;
    designer_rep:Integer;
    ID_RATE_ACCOUNT_int : int64;
    id_rate_acc_payer : int64;
    ID_DOG_ROOT: int64;
    ID_DOG : int64;
    ID_STUD: int64;
    DATE_DOG : TDateTime;
    Name_report : array of string;
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(AParameter:TcnSimpleParamsEx);reintroduce;
  end;


implementation

uses FIBQuery;

{$R *.dfm}

constructor TfrmSchToPay.Create(AParameter:TcnSimpleParamsEx);
var cnAcademicYear :TcnAcademicYear;
    i: integer;
    ID_RATE_ACCOUNT_Convert: int64;
    cnUplSum: Currency;
    cnSumDoc:Currency;
    cnSNeed:Currency;
    id_session_pay, id_session_calc : int64;
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AParameter.Owner);

  Grid_payersTableView.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
  Grid_payersTableView.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
  Grid_payersTableView.Items[2].DataBinding.ValueTypeClass := TcxFloatValueType;
  Grid_payersTableView.Items[3].DataBinding.ValueTypeClass := TcxFloatValueType;
  Grid_payersTableView.Items[4].DataBinding.ValueTypeClass := TcxLargeIntValueType;
  Grid_payersTableView.Items[5].DataBinding.ValueTypeClass := TcxIntegerValueType;
  Grid_payersTableView.Items[6].DataBinding.ValueTypeClass := TcxLargeIntValueType;
  Grid_payersTableView.Items[7].DataBinding.ValueTypeClass := TcxLargeIntValueType;
  Grid_payersTableView.Items[8].DataBinding.ValueTypeClass := TcxStringValueType;
  Grid_payersTableView.Items[9].DataBinding.ValueTypeClass := TcxStringValueType;

  count_print  := 0;
  designer_rep :=0;

  DM:=TDM_Sch.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;


  Num_Dog_Edit.Text := AParameter.cnParamsToPakage.Num_Doc;
  ID_RATE_ACCOUNT_int := AParameter.cnParamsToPakage.ID_RATE_ACCOUNT;
  ID_DOG_ROOT :=         AParameter.cnParamsToPakage.ID_DOG_ROOT;
  ID_DOG :=              AParameter.cnParamsToPakage.ID_DOG;
  ID_STUD :=             AParameter.cnParamsToPakage.ID_STUD;
  DATE_DOG :=            AParameter.cnParamsToPakage.DATE_DOG;


  // информация по плательщикам
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_PAYER_STAGE_SELECT(' + IntToStr(AParameter.cnParamsToPakage.ID_DOG_ROOT)
                                   + ',' + IntToStr(AParameter.cnParamsToPakage.ID_DOG) + ')';
  DM.ReadDataSet.Open;
  DM.ReadDataSet.FetchAll;
  DM.ReadDataSet.First;
  for i:=0 to DM.ReadDataSet.RecordCount-1 do
   begin
    Grid_payersTableView.DataController.RecordCount := Grid_payersTableView.DataController.RecordCount + 1;
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['FIO_PAYER'];
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['NAME_STAGE'];
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['ID_TYPE_PAYER'];
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['ID_TYPE_STAGE'];
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ISPERCENT'];
    if DM.ReadDataSet['ISPERCENT'] =1 then
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['PERSENT']
    else
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['SUMMA'];
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['ID_PAYER'];
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 7]  := DM.ReadDataSet['ID_RATE_ACCOUNT'];
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 8]  := DM.ReadDataSet['MFO'];
    Grid_payersTableView.DataController.Values[Grid_payersTableView.DataController.RecordCount - 1, 9]  := DM.ReadDataSet['RATE_ACCOUNT'];
    DM.ReadDataSet.Next;
   end;
  DM.ReadDataSet.Close;

 // заполняю комбобокс
  // плательщик
  for i:= 0 to Grid_payersTableView.DataController.RecordCount -1 do
   begin
    id_payer_ComboBox.Properties.Items.Add
    (Grid_payersTableView.DataController.Values[i, 0]);
   end;

  id_payer_ComboBox.ItemIndex:=0; id_payer_ComboBoxPropertiesCloseUp(Self);

// получаю ндс
DM.DataSet.SelectSQL.Text := 'Select * from CN_FR_SCH_CHECK_NDS(' +
                             inttostr(AParameter.cnParamsToPakage.ID_DOG_ROOT ) + ',' +
                             inttostr(AParameter.cnParamsToPakage.ID_DOG ) + ')';
DM.DataSet.Open;
  if DM.DataSet['IS_NDS'] = 1
   then
    NDS_Percent := DM.DataSet['PERSENT'];
DM.DataSet.Close;

// получаю основание
cnAcademicYear := AcademicYear(now);
Memo.Text := ExtractNumYear(cnAcademicYear.Date_Beg, cnAcademicYear.Date_End, '/') + ' навч. рік';

// получаю номер справки
   With DM.StProc do
    begin
     try
      StoredProcName:='CN_DT_NUMBER_SPARV_SELECT';
      Transaction.StartTransaction;
      Prepare;
      ExecProc;
      SchNumberSprav_Edit.Text :=FieldByName('NUMBER_SPRAV').AsString;
      Transaction.Commit;
     except
      Transaction.Rollback;
      raise;
     end;
   end;

    // rate_account по-умолчанию
 DM.ReadDataSet.Close;
 DM.ReadDataSet.SelectSQL.Clear;
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_DEF_ID_INT_ACCOUNT';
 DM.ReadDataSet.Open;
 if DM.ReadDataSet['ID_INT_ACCOUNT']<> null then
 begin
   ID_RATE_ACCOUNT_Convert := DM.ReadDataSet['ID_INT_ACCOUNT'];
   DM.ReadDataSet.Close;
   DM.ReadDataSet.SelectSQL.Clear;
   DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_RATEACC_BY_ID(' + IntToStr(ID_RATE_ACCOUNT_Convert) + ')';
   DM.ReadDataSet.Open;
   Accounts.Text  := DM.ReadDataSet['RATE_ACCOUNT'];
   //ID_INT_Account := ID_RATE_ACCOUNT_Convert;
   Account_Label.Caption :=DM.ReadDataSet['NAME_MFO'];
   DM.ReadDataSet.Close;
 end
 else DM.ReadDataSet.Close;

 // определяю сумму оплаты по-умолчанию
 With DM.StProc do
  begin
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
    id_session_pay:= ParamByName('ID_SESSION').AsInt64;
  Transaction.Commit;
  Close;
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
    cnSNeed:= ParamByName('CN_SNEED').AsCurrency;      //  сумма, необходимая для уплаты за весь период
    id_session_calc:= ParamByName('ID_SESSION').AsInt64;
  Transaction.Commit;
  Close;

  if cnUplSum > cnSumDoc then
  Itogo_Edit.Value:= cnSNeed - cnUplSum
  else
  Itogo_Edit.Value:= cnSNeed - cnSumDoc;

  StoredProcName := 'CN_CALC_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  ExecProc;
  Transaction.Commit;
  Close;

  StoredProcName := 'CN_PAY_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_pay;
  ExecProc;
  Transaction.Commit;
  Close;

 end;

FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmSchToPay.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();
 Caption :=  cnConsts.cn_RaxynokNaSplatyCaption[PLanguageIndex];

 SchToPay_Label.Caption    := cnConsts.cn_RaxynokNaSplaty[PLanguageIndex];
 Num_Dog_Label.Caption     := cnConsts.cn_Num_Dog_Label[PLanguageIndex];
 RasShet_Label.Caption     := cnConsts.cn_RaschetSchet_Title[PLanguageIndex];
 Payre_Label.Caption       := cnConsts.cn_Payers_GroupBox[PLanguageIndex];
 Osnovanie_Label.Caption   := cnConsts.cn_Osnovanie[PLanguageIndex];
 Summa_Sch_Label.Caption   := cnConsts.cn_SymaPaxynky[PLanguageIndex];
 NDS_Label.Caption         := cnConsts.cn_NDS[PLanguageIndex];
 Itogo_Label.Caption       := cnConsts.cn_PazomZNDS[PLanguageIndex];
 Vid_Label.Caption         := cnConsts.cn_Vid[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];

end;

procedure TfrmSchToPay.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmSchToPay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmSchToPay.SelectButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TfrmSchToPay.CancelButtonClick(Sender: TObject);
begin
if DM.DataSet.Active then DM.DataSet.Close;
if DM.ReadDataSet.Active then DM.ReadDataSet.Close;
close;
end;

procedure TfrmSchToPay.OkButtonClick(Sender: TObject);
var
  reg : TRegistry;
begin
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\Contracts\SchToPay_Shablon\', True)
    then reg.WriteString('index', IntToStr(ComboBox_Shablon.ItemIndex));
   finally
    reg.Free;
  end;

  Screen.Cursor := crHourGlass;
  ProgressBar.Position := 0;
  ProgressBar.Update;

  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\'+name_report[ComboBox_Shablon.itemindex]);
  frxReport.Variables.Clear;

  frxReport.Variables['NUMBER_SPRAV']  := ''''+  SchNumberSprav_Edit.Text       +'''';
  frxReport.Variables['NUM_DOG']       := ''''+  Num_Dog_Edit.Text       +'''';
  frxReport.Variables['RAS_SCH']       := ''''+  RS_Edit.Text            +'''';
  frxReport.Variables['Osnovanie']     := ''''+  Memo.Text               +'''';
  frxReport.Variables['Platnik']       := ''''+  StringPrepareToQueryText(id_payer_ComboBox.Text)  +'''';
  frxReport.Variables['DATE_DOG']      := ''''+  DateToStr(DATE_DOG)     +'''';
  frxReport.Variables['DATE_REG']      := ''''+  DateToStr(DateEdit.Date)     +'''';


  ProgressBar.Position := 10;
  ProgressBar.Update;

  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_ALL_CUSTOMER_INFO('
                                + inttostr(ID_RATE_ACCOUNT_int) + ')';
  DM.ReadDataSet.open;
  if DM.ReadDataSet['NAME_CUSTOMER'] <> null then
  frxReport.Variables['NAME_CUSTOMER']  := ''''+  StringPrepareToQueryText(DM.ReadDataSet['NAME_CUSTOMER'])  +''''
  else frxReport.Variables['NAME_CUSTOMER']  := ''''+ '' + '''';
  if DM.ReadDataSet['KOD_EDRPOU'] <> null then
  frxReport.Variables['KOD_EDRPOU']     := ''''+  DM.ReadDataSet['KOD_EDRPOU']  +''''
  else frxReport.Variables['KOD_EDRPOU']  := ''''+ '' + '''';
  if DM.ReadDataSet['RATE_ACCOUNT'] <> null then
  frxReport.Variables['RATE_ACCOUNT']   := ''''+  DM.ReadDataSet['RATE_ACCOUNT']  +''''
  else frxReport.Variables['RATE_ACCOUNT']  := ''''+ '' + '''';
  if DM.ReadDataSet['MFO'] <> null then
  frxReport.Variables['MFO']            := ''''+  DM.ReadDataSet['MFO']  +''''
  else frxReport.Variables['MFO']  := ''''+ '' + '''';
  if DM.ReadDataSet['NAME_MFO'] <> null then
  frxReport.Variables['NAME_MFO']       := ''''+  DM.ReadDataSet['NAME_MFO']  +''''
  else frxReport.Variables['NAME_MFO']  := ''''+ '' + '''';
  if DM.ReadDataSet['ADRESS_CUST'] <> null then
  frxReport.Variables['ADRESS_CUST']    := ''''+  DM.ReadDataSet['ADRESS_CUST']  +''''
    else frxReport.Variables['ADRESS_CUST']  := ''''+ '' + '''';
  DM.ReadDataSet.Close;

  ProgressBar.Position := 20;
  ProgressBar.Update;

  DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_ALL_CUSTOMER_INFO('
                                + inttostr(id_rate_acc_payer) + ')';
  DM.ReadDataSet.open;
  if DM.ReadDataSet['MFO'] <> null
   then frxReport.Variables['MFO_payer']            := ''''+  DM.ReadDataSet['MFO']  +''''
   else frxReport.Variables['MFO_payer']  := ''''+ '' + '''';
  if DM.ReadDataSet['NAME_MFO'] <> null
   then frxReport.Variables['NAME_MFO_payer']       := ''''+  StringPrepareToQueryText(DM.ReadDataSet['NAME_MFO'])  +''''
   else frxReport.Variables['NAME_MFO_payer']  := ''''+ '' + '''';

  DM.ReadDataSet.Close;

  ProgressBar.Position := 30;
  ProgressBar.Update;


  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := 'select * from CN_FR_SCH_STUDINFO_SELECT('
                                + inttostr(ID_DOG_ROOT) + ','+ inttostr(ID_DOG)+')';
  DM.ReadDataSet.open;
  DM.ReadDataSet.FetchAll;

  frxReport.Variables['SUMMA_PROPISU'] := ''''+ StringPrepareToQueryText(SumToString(DM.ReadDataSet.RecordCount*Itogo_Edit.Value)) +'''';

  ProgressBar.Position := 40;
  ProgressBar.Update;

  cxCurrencyEdit1.Value := DM.ReadDataSet.RecordCount*SummaSch_Edit.Value;
  cxCurrencyEdit2.Value:=  DM.ReadDataSet.RecordCount*Itogo_Edit.Value;
  cxCurrencyEdit3.Value := DM.ReadDataSet.RecordCount*NDS_Edit.Value;

  ProgressBar.Position := 50;
  ProgressBar.Update;

  frxReport.Variables['SummaSch_footer']      := ''''+  cxCurrencyEdit1.Text     +'''';
  frxReport.Variables['Itogo_footer']         := ''''+  cxCurrencyEdit2.Text   +'''';
  frxReport.Variables['NDS_footer']           := ''''+  cxCurrencyEdit3.Text    +'''';

  ProgressBar.Position := 60;
  ProgressBar.Update;

  frxReport.Variables['SummaSch']      := ''''+  SummaSch_Edit.Text     +'''';
  frxReport.Variables['NDS']           := ''''+  NDS_Edit.Text          +'''';
  frxReport.Variables['Itogo']         := ''''+  Itogo_Edit.Text        +'''';

  ProgressBar.Position := 70;
  ProgressBar.Update;

  if NDS_Percent <> 0
   then frxReport.Variables['NDS_Percent']   := ''''+ CurrToStr(NDS_Percent) + '%' + ''''
   else frxReport.Variables['NDS_Percent']   := ''''+ '' + '''';

  ProgressBar.Position := 80;
  ProgressBar.Update;

  DM.DataSet.Close;
  DM.DataSet.SelectSQL.Clear;
  DM.DataSet.SelectSQL.Text := 'select * from CN_FR_SCH_PODPIS_SELECT';
  DM.DataSet.open;

  ProgressBar.Position := 90;
  ProgressBar.Update;

  frxDBDataset1.DataSet := DM.DataSet;
  frxDBDataset2.DataSet := DM.ReadDataSet;

  frxReport.PrepareReport(true);

  ProgressBar.Position := 100;
  ProgressBar.Update;
  Screen.Cursor := crDefault;

  frxReport.ShowReport;

  if designer_rep=1 then
    begin
      frxReport.DesignReport;
    end;

end;

procedure TfrmSchToPay.FormShow(Sender: TObject);
var
  i : Integer;
  name_report_combo : string;
  Reg : TRegistry;
  IndexReg : Integer;
begin
  Itogo_Edit.SetFocus;
  DateEdit.Date := now;
  NDS_Label.Caption := NDS_Label.Caption +' '+
                       vartostr(NDS_Percent)+ ' %';

  DM.ReadDataSet.Close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'SELECT * FROM CN_INI_REPORT_TMPL WHERE REP_GROUP = :REP_GROUP and is_use = 1';
  DM.ReadDataSet.ParamByName('REP_GROUP').AsString := 'BILL';
  DM.ReadDataSet.Open;
  DM.ReadDataSet.FetchAll;
  DM.ReadDataSet.First;

  setLength(Name_report,DM.ReadDataSet.RecordCount);

  ComboBox_Shablon.Clear;
  For i := 0 to Dm.ReadDataSet.RecordCount-1 do
   begin
    name_report_combo := '';
    if DM.ReadDataSet['name_report'] <> null then name_report_combo := DM.ReadDataSet['name_report'];
    ComboBox_Shablon.Properties.Items.Add(name_report_combo);
    Name_report[i] := DM.ReadDataSet['name_file'];
    DM.ReadDataSet.Next;
   end;

  IndexReg := 0;
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\Contracts\SchToPay_Shablon\',False)
    then indexReg := StrToInt(reg.ReadString('index'));
   finally
    reg.Free;
  end;

  if indexReg > DM.ReadDataSet.RecordCount
   then ComboBox_Shablon.ItemIndex := 0
   else ComboBox_Shablon.ItemIndex := IndexReg;

  //ComboBox_Shablon.Properties.ReadOnly := True; 
end;

procedure TfrmSchToPay.Itogo_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
  NDS_Edit.Value := Itogo_Edit.Value * NDS_Percent/100;
  SummaSch_Edit.Value := Itogo_Edit.Value - NDS_Edit.Value;
end;

procedure TfrmSchToPay.Itogo_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure TfrmSchToPay.SchNumberSprav_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then DateEdit.SetFocus;
end;

procedure TfrmSchToPay.DateEditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then Num_Dog_Edit.SetFocus;
end;

procedure TfrmSchToPay.Num_Dog_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then RS_Edit.SetFocus;
end;

procedure TfrmSchToPay.RS_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then id_payer_ComboBox.SetFocus;
end;

procedure TfrmSchToPay.id_payer_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Memo.SetFocus;
end;

procedure TfrmSchToPay.MemoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then SummaSch_Edit.SetFocus;
end;

procedure TfrmSchToPay.SummaSch_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then NDS_Edit.SetFocus;
end;

procedure TfrmSchToPay.NDS_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then Itogo_Edit.SetFocus;
end;

procedure TfrmSchToPay.frxReportPrintReport(Sender: TObject);
var
  numberDoc:String;
begin
if count_print=0 then
  begin
    With DM.StProc do
      begin
      try
      StoredProcName:='CN_DT_NUMBER_SPARV_UPDATE';
      Transaction.StartTransaction;
      Prepare;
      ExecProc;
      numberDoc:=FieldByName('NUMBER_SPRAV').AsString;
      Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
    end;
    frxReport.Variables['NUMBER_SPRAV']:= ''''+'№'+numberDoc+'''';
    frxReport.PrepareReport;
    inc(count_print);
  end;
end;


procedure TfrmSchToPay.Action1Execute(Sender: TObject);
begin
if designer_rep=0 then
  begin
    designer_rep:=1;
    Osnovanie_Label.Caption:='Режим отладки отчетов';
  end
  else
  begin
    designer_rep:=0;
    Osnovanie_Label.Caption:='';
  end;
end;

procedure TfrmSchToPay.id_payer_ComboBoxPropertiesCloseUp(Sender: TObject);
var i: integer;
begin
  for i:= 0 to Grid_payersTableView.DataController.RecordCount -1 do
   begin
    if id_payer_ComboBox.Text = Grid_payersTableView.DataController.Values[i, 0]
    then
     begin
      RS_Edit.Text := Grid_payersTableView.DataController.Values[i, 9];
      id_rate_acc_payer := Grid_payersTableView.DataController.Values[i, 7];
      break;
     end;
   end;
end;

procedure TfrmSchToPay.id_payer_ComboBoxPropertiesChange(Sender: TObject);
begin
id_payer_ComboBoxPropertiesCloseUp(Sender);
end;

procedure TfrmSchToPay.AccountsPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_DefaultAccounts.bpl','ShowDefaultAccounts');
  AParameter.Free;
  if VarArrayDimCount(res)>0 then
   begin
   // ID_INT_Account := res[0];
    ID_RATE_ACCOUNT_int := res[0];
    Accounts.Text  := vartostr(res[1]);
    Account_Label.Caption:= vartostr(res[2]);
   end;
 end;

procedure TfrmSchToPay.ComboBox_ShablonKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := #0;
end;

end.
