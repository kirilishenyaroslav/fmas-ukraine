//******************************************************************************
// Проект "Контракты"
// Форма анализа оплаты
// Чернявский А.Э. 2005 - 2007 гг.
// Перчак А.Л. 2011 -
//******************************************************************************

unit PaymentAnalysis_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxLookAndFeelPainters,
  ActnList, ImgList, dxBar, cxGridTableView, cxContainer, cxCurrencyEdit,
  cxGroupBox, StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  DM_PaymentAnalysis, cn_Common_Types;

type
  TfrmPayment = class(TForm)
    FIO_Label: TLabel;
    Fac_Label: TLabel;
    Kurs_Label: TLabel;
    DataRog_Label: TLabel;
    FIOCOMBO_Label: TLabel;
    Comment_Label: TLabel;
    cxGrid1: TcxGrid;
    calcTable: TcxGridDBTableView;
    Beg_Date: TcxGridDBColumn;
    End_Date: TcxGridDBColumn;
    Pay_Sum: TcxGridDBColumn;
    Persent: TcxGridDBColumn;
    SummaLg: TcxGridDBColumn;
    Summa: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    CancelButton: TcxButton;
    cxGrid2: TcxGrid;
    DocTable: TcxGridDBTableView;
    Doc_num: TcxGridDBColumn;
    Doc_date: TcxGridDBColumn;
    Doc_summa: TcxGridDBColumn;
    Note: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Zadolg_Label: TLabel;
    DateOpl_Label: TLabel;
    Label8: TLabel;
    cn_SNeed_Edit: TcxCurrencyEdit;
    cn_UplSum_Edit: TcxCurrencyEdit;
    Zadolgnost_Edit: TcxCurrencyEdit;
    Today_Opl_Edit: TcxCurrencyEdit;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    Calc_CountButton: TcxButton;
    Pay_CountButton: TcxButton;
    id_doc: TcxGridDBColumn;
    InsOstLabel: TLabel;
    InsOst_Edit: TcxCurrencyEdit;
    NumYearColumn: TcxGridDBColumn;
    dxBarDockControl1: TdxBarDockControl;
    dxBarManager1: TdxBarManager;
    IsSortingBtn: TdxBarButton;
    TreeFullOpenBtn: TdxBarButton;
    TreeFullCloseBtn: TdxBarButton;
    TreeBranchOpenBtn: TdxBarButton;
    TreeBranchCloseBtn: TdxBarButton;
    PopupImageList: TImageList;
    Lgota_Label: TLabel;
    Lgota_Edit: TcxCurrencyEdit;
    clBorgNa4alo: TcxGridDBColumn;
    clSummaNadiyshla: TcxGridDBColumn;
    clBorgKinez: TcxGridDBColumn;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Button_calc: TcxButton;
    ActionList1: TActionList;
    act_help: TAction;
    Comment_DB_Label: TLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure Calc_CountButtonClick(Sender: TObject);
    procedure Pay_CountButtonClick(Sender: TObject);
    procedure DocTableDblClick(Sender: TObject);
    procedure DocTableKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure TreeFullOpenBtnClick(Sender: TObject);
    procedure TreeFullCloseBtnClick(Sender: TObject);
    procedure TreeBranchOpenBtnClick(Sender: TObject);
    procedure TreeBranchCloseBtnClick(Sender: TObject);
    procedure IsSortingBtnClick(Sender: TObject);
    procedure act_helpExecute(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM :TDM_Pay;
    DM2:TDM_Pay;
    id_session_pay  : int64;
    id_session_calc : int64;
    ID_TRANSACTION  : int64;
    ID_STUD         : int64;
    ID_DOG_ROOT     : Int64;
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(Aparameter:TcnSimpleParamsEx);reintroduce;
    procedure    DataSetAfterScroll(DataSet: TDataSet);
    procedure    DataSet_CalcAfterScroll(DataSet: TDataSet);
  end;


implementation


uses cn_Common_Loader, cn_Common_Messages, cnConsts_Messages, ShellAPI, IBase,
     cn_Common_Funcs, cnConsts;

{$R *.dfm}

procedure    TfrmPayment.DataSetAfterScroll(DataSet: TDataSet);
begin
  if DataSet['NOTE'] <> null
   then Comment_Label.Caption:= vartostr(DataSet['NOTE'])
   else Comment_Label.Caption:= '...';
end;

constructor TfrmPayment.Create(Aparameter:TcnSimpleParamsEx);
var
  cnUplSum, cnSumDoc, cnSNeed, SegodnyaOpl : Currency;
  cnDATEOPL : TDate;
  Cur_date  : TDate;
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(Aparameter.Owner);

  Self.ID_STUD := AParameter.cnParamsToPakage.ID_STUD;
  Self.ID_DOG_ROOT := AParameter.cnParamsToPakage.ID_DOG_ROOT;

  FormIniLanguage();

  DocTable.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
  DocTable.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
  DocTable.Items[2].DataBinding.ValueTypeClass := TcxCurrencyValueType;
  DocTable.Items[3].DataBinding.ValueTypeClass := TcxStringValueType;

  calcTable.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
  calcTable.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
  calcTable.Items[2].DataBinding.ValueTypeClass := TcxCurrencyValueType;
  calcTable.Items[3].DataBinding.ValueTypeClass := TcxCurrencyValueType;
  calcTable.Items[4].DataBinding.ValueTypeClass := TcxCurrencyValueType;
  calcTable.Items[5].DataBinding.ValueTypeClass := TcxCurrencyValueType;
  calcTable.Items[6].DataBinding.ValueTypeClass := TcxCurrencyValueType;
  calcTable.Items[7].DataBinding.ValueTypeClass := TcxCurrencyValueType;
  calcTable.Items[8].DataBinding.ValueTypeClass := TcxCurrencyValueType;


  DM:=TDM_Pay.Create(Self);
  DM.DB.Handle:=Aparameter.Db_Handle;

  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text:= 'select * from CN_DT_STUDINFO_CALC_SELECT(:ID_STUD)' ;
  DM.ReadDataSet.ParamByName('ID_STUD').AsInt64 := ID_STUD;
  DM.ReadDataSet.Open;

  If DM.ReadDataSet['FIO_PEOPLE'] <> null
   then FIO_Label.Caption := FIO_Label.Caption  + ': '+ vartostr(DM.ReadDataSet['FIO_PEOPLE']);

  If DM.ReadDataSet['NAME_FACUL'] <> null
   then Fac_Label.Caption := Fac_Label.Caption  + ': '+ vartostr(DM.ReadDataSet['NAME_FACUL']);

  If DM.ReadDataSet['NAME_SMET'] <> null
   then Fac_Label.Caption := Fac_Label.Caption  + ' '+ vartostr(DM.ReadDataSet['NAME_SMET']);


  If DM.ReadDataSet['KURS'] <> null
   then Kurs_Label.Caption :=Kurs_Label.Caption + ': '+ vartostr(DM.ReadDataSet['KURS']);

  DM.ReadDataSet.close;

  DM.ReadDataSet.close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from CN_SUM_ENTRYREST_SELECT(:ID_STUD, :ID_DOG_ROOT)';
  DM.ReadDataSet.ParamByName('ID_STUD').AsInt64 := ID_STUD;
  DM.ReadDataSet.ParamByName('ID_DOG_ROOT').AsInt64 := ID_DOG_ROOT;
  DM.ReadDataSet.open;

  if DM.ReadDataSet['SUM_ENTRY_REST'] <> null
   then InsOst_Edit.Value := DM.ReadDataSet['SUM_ENTRY_REST']
   else InsOst_Edit.Value := 0;

  DM.ReadDataSet.Close;

  // формирование корректных счетов и операций на сегодня
  With DM.StProc do
   begin
    StoredProcName:='CN_DATE_PROV_SYS_DATA_CHECK_UPT';
    Transaction.StartTransaction;
    Prepare;
    ExecProc;
    try
     Transaction.Commit;
     Close;
     except
      Transaction.Rollback;
      ShowMessage('Произошла ошибка при выполнении процедуры CN_DATE_PROV_SYS_DATA_CHECK_UPT!'+ #13+'Сбой в работе системы.');
      raise;
    end;
   end;

  With DM.StProc do
  begin
   StoredProcName := 'CN_PAY';
   Transaction.StartTransaction;
   Prepare;
   ParamByName('ID_STUD').AsInt64         := ID_STUD;
   ParamByName('DATE_PROV_CHECK').AsShort := 1;
   ParamByName('IS_DOC_GEN').AsShort      := 1;
   ParamByName('IS_PROV_GEN').AsShort     := 1;
   ParamByName('IS_SMET_GEN').AsShort     := 1;
   ParamByName('NOFPROV').AsShort         := 1;
   ParamByName('DIGNORDOCID').AsShort     := 1;
   ExecProc;
   try
    // --------------запуск процедуры st_pay------------------------------
    // расчет уже уплаченной суммы
    cnUplSum       := ParamByName('CNUPLSUM').AsCurrency;
    cnSumDoc       := ParamByName('SUMMA_ALL').AsCurrency;
    id_session_pay := ParamByName('ID_SESSION').AsInt64;

    Transaction.Commit;
    Close;
    except
     Transaction.Rollback;
     showmessage('Произошла ошибка при выполнении процедуры CN_PAY!'+ #13+'Сбой в работе системы.');
     raise;
   end;

    if cnUplSum > cnSumDoc
     then cn_UplSum_Edit.Value:= cnUplSum
     else cn_UplSum_Edit.Value:= cnSumDoc;

   // --------------запуск процедуры cn_calc------------------------------
   //
   StoredProcName := 'CN_CALC';
   Transaction.StartTransaction;
   Prepare;
   ParamByName('ID_STUD').AsInt64 := ID_STUD;
   if cnUplSum > cnSumDoc
    then  ParamByName('CNUPLSUM').AsCurrency := cnUplSum
    else  ParamByName('CNUPLSUM').AsCurrency := cnSumDoc; // это уже с уплаченной суммой

   ExecProc;

   try
    cn_SNeed_Edit.Value   := ParamByName('CN_SNEED').AsCurrency;
    cnSNeed               := ParamByName('CN_SNEED').AsCurrency;      //  сумма, необходимая для уплаты за весь период
    cnDATEOPL             := ParamByName('CNDATEOPL').AsDateTime;   // дата, по которую оплачено
    Lgota_Edit.Value      := ParamByName('LGOTA').AsCurrency;
    id_session_calc       := ParamByName('ID_SESSION').AsInt64;
    DateOpl_Label.Caption := DateOpl_Label.Caption + '  '+ datetostr(cnDATEOPL);

    Transaction.Commit;
    Close;
    except
     Transaction.Rollback;
     showmessage('Произошла ошибка при выполнении процедуры CN_CALC!'+ #13+'Сбой в работе системы.');
     raise;
   end;

   if cnUplSum > cnSumDoc
    then Zadolgnost_Edit.Value:= cnSNeed - cnUplSum
    else Zadolgnost_Edit.Value:= cnSNeed - cnSumDoc;

   StoredProcName := 'CN_CALC_TMP_CLEAR';
   Transaction.StartTransaction;
   Prepare;
   ParamByName('ID_SESSION').AsInt64 := id_session_calc;
   ExecProc;
   try
    Transaction.Commit;
    Close;
    except
     Transaction.Rollback;
     showmessage('Произошла ошибка при выполнении процедуры CN_CALC_TMP_CLEAR!'+ #13+'Сбой в работе системы.');
     raise;
   end;

   // --------------запуск процедуры cn_calc------------------------------
   DM.ReadDataSet.Close;
   DM.ReadDataSet.SelectSQL.Clear;
   DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_SYS_CURRENT_DATE';
   DM.ReadDataSet.Open;

   if  DM.ReadDataSet['CURRENTDATE'] <> null
    then Cur_date:= DM.ReadDataSet['CURRENTDATE'];

   DM.ReadDataSet.Close;

   //
   if (cnDATEOPL <= Cur_date) then
    begin
     StoredProcName := 'CN_CALC';
     Transaction.StartTransaction;
     Prepare;
     ParamByName('ID_STUD').AsInt64     := ID_STUD;
     ParamByName('BEG_CHECK').AsVariant := cnDATEOPL;
     ParamByName('CNUPLSUM').AsVariant  := null;
     ParamByName('END_CHECK').AsDate    := Cur_date;

     ExecProc;
     try
      SegodnyaOpl:=ParamByName('cn_SNEED').AsCurrency;
      id_session_calc:= ParamByName('ID_SESSION').AsInt64;
      Transaction.Commit;
      Close;
      except
       Transaction.Rollback;
       showmessage('Произошла ошибка при выполнении процедуры CN_CALC!'+ #13+'Сбой в работе системы.');
       raise;
     end;
    end
   else SegodnyaOpl:=0;

   Today_Opl_Edit.Value:= SegodnyaOpl;

   if SegodnyaOpl > Zadolgnost_Edit.Value
    then Today_Opl_Edit.Value:= Zadolgnost_Edit.Value ;

   if ((Zadolgnost_Edit.Value = 0) or
       (Zadolgnost_Edit.Value<0)) then Today_Opl_Edit.Value:= 0;

   StoredProcName := 'CN_CALC_TMP_CLEAR';
   Transaction.StartTransaction;
   Prepare;
   ParamByName('ID_SESSION').AsInt64 := id_session_calc;
   ExecProc;
   try
    Transaction.Commit;
    Close;
    except
     Transaction.Rollback;
     showmessage('Произошла ошибка при выполнении процедуры CN_CALC_TMP_CLEAR!'+ #13+'Сбой в работе системы.');
     raise;
   end;

   // новый способ вызова
   StoredProcName:='CN_FR_GET_ID_SESSION';
   Transaction.StartTransaction;
   Prepare;
   ExecProc;
   try
    ID_TRANSACTION:= FieldByName('ID_SESSION').AsInt64;
    Transaction.Commit;
    Close;
    except
     Transaction.Rollback;
     showmessage('Произошла ошибка при выполнении процедуры CN_FR_GET_ID_SESSION!'+ #13+'Сбой в работе системы.');
     raise;
   end;

   //отбор данных из базы
   StoredProcName:='CN_PRINT_CN_CALC';
   Transaction.StartTransaction;
   Prepare;
   ParamByName('ID_STUD').AsInt64:=Aparameter.cnParamsToPakage.ID_STUD;
   ParamByName('end_check').AsDate:=now;
   ParamByName('ID_SESSION').AsInt64:=ID_TRANSACTION;

   ExecProc;
   try
    Transaction.Commit;
    Close;
    except
     Transaction.Rollback;
     showmessage('Произошла ошибка при выполнении процедуры CN_PRINT_CN_CALC!'+ #13+'Сбой в работе системы.');
     raise;
   end;

   DM.DataSet.SelectSQL.Clear;
   DM.DataSet.SelectSQL.text:= 'select * from CN_TMP_DOC_SELECT(:id_session_pay)';
   DM.DataSet.ParamByName('id_session_pay').AsInt64 := id_session_pay;
   //DocTable.DataController.DataSource := DM.DataSource;

   DM.DataSet.AfterScroll := DataSetAfterScroll;
   DM.DataSet.open;

   DM2:=TDM_Pay.Create(Self);
   DM2.DB.Handle:=Aparameter.Db_Handle;
   DM2.DataSet.SelectSQL.Clear;
   DM2.DataSet.SelectSQL.text:= 'select * from cn_tmp_print_cn_calc where id_session =:ID_TRANSACTION';
   DM2.DataSet.ParamByName('ID_TRANSACTION').AsInt64 := ID_TRANSACTION;
   calcTable.DataController.DataSource := DM2.DataSource;
   DM2.DataSet.closeopen(true);

   If Zadolgnost_Edit.Value = 0 then
    begin
     Zadolgnost_Edit.Visible  := false;

     // сплачено повністю
     Zadolg_Label.Caption    := cnConsts.cn_FullPay[PLanguageIndex];
     Zadolg_Label.Left       := Zadolg_Label.Left + 100;
     Zadolg_Label.Font.Color := $00A00000;
     Zadolg_Label.Font.Style := Zadolg_Label.Font.Style + [fsBold];
    end;

   if Zadolgnost_Edit.Value < 0 then
    begin
     // переплата
     Zadolg_Label.Caption := cnConsts.cn_Pereplata[PLanguageIndex];
     Zadolgnost_Edit.Value := abs(Zadolgnost_Edit.Value);
    end;

   //Выбор всех начислений
   DM.DataSet_calc.Close;
   DM.DataSet_calc.SQLs.SelectSQL.Text := 'select * from CN_GET_DB_FROM_PROV(:id_stud)';
   DM.DataSet_calc.ParamByName('ID_STUD').AsInt64 := ID_STUD;
   DM.DataSet_calc.Open;
   DM.DataSet_calc.AfterScroll := DataSet_CalcAfterScroll;

   Calc_CountButton.Caption := cnConsts.cn_DSetRecordCount[PLanguageIndex];
   Calc_CountButton.Caption := Calc_CountButton.Caption + inttostr(DM2.DataSet.RecordCount);
   Pay_CountButton.Caption  := cnConsts.cn_DSetRecordCount[PLanguageIndex];
   Pay_CountButton.Caption  := Pay_CountButton.Caption + inttostr(DM.DataSet.RecordCount);
   Button_calc.Caption      := cnConsts.cn_DSetRecordCount[PLanguageIndex];
   Button_calc.Caption      := Button_calc.Caption + inttostr(DM.DataSet_calc.RecordCount);
  end;

  Screen.Cursor:=crDefault;
end;

procedure TfrmPayment.FormIniLanguage;
begin
  PLanguageIndex := cn_Common_Funcs.cnLanguageIndex();

  //кэпшн формы
  Caption := cnConsts.cn_PaymentAnalysis[PLanguageIndex];

  //названия кнопок
  CancelButton.Caption  := cnConsts.cn_Exit[PLanguageIndex];
  FIO_Label.Caption     := cnConsts.cn_grid_FIO_Column[PLanguageIndex];
  Fac_Label.Caption     := cnConsts.cn_footer_Faculty[PLanguageIndex];
  Kurs_Label.Caption    := cnConsts.cn_footer_Kurs[PLanguageIndex];
  DataRog_Label.Caption := cnConsts.cn_DateBorn[PLanguageIndex];

  Beg_Date.Caption := cnConsts.cn_Beg_Opl[PLanguageIndex];
  End_Date.Caption := cnConsts.cn_End_Opl[PLanguageIndex];
  Pay_Sum.Caption  := cnConsts.cn_Summa_Opl[PLanguageIndex];
  SummaLg.Caption  := cnConsts.cn_SummaLg_Opl[PLanguageIndex];
  Persent.Caption  := cnConsts.cn_PercentLg_Opl[PLanguageIndex];
  Summa.Caption    := cnConsts.cn_SummFinal_Opl[PLanguageIndex];

  cxGroupBox1.Caption := cnConsts.cn_Itogo_Pay[PLanguageIndex];

  Label4.Caption           := cnConsts.cn_Need_Pay[PLanguageIndex];
  Label5.Caption           := cnConsts.cn_Was_Pay[PLanguageIndex];
  Zadolg_Label.Caption     := cnConsts.cn_Zadolg_Pay[PLanguageIndex];
  DateOpl_Label.Caption    := cnConsts.cn_PayPo_Pay[PLanguageIndex];
  Label8.Caption           := cnConsts.cn_Now_Pay[PLanguageIndex];
  Comment_Label.Caption    := cnConsts.cn_Hint_Pay[PLanguageIndex];
  Comment_DB_Label.Caption := cnConsts.cn_Hint_calc[PLanguageIndex];

  Doc_num.Caption   := cnConsts.cn_NumDoc_Pay[PLanguageIndex];
  Doc_date.Caption  := cnConsts.cn_DateDoc_Pay[PLanguageIndex];
  Doc_summa.Caption := cnConsts.cn_Summa_Pay[PLanguageIndex];

  Calc_CountButton.Caption := cnConsts.cn_DSetRecordCount[PLanguageIndex];
  Pay_CountButton.Caption  := cnConsts.cn_DSetRecordCount[PLanguageIndex];
  Button_calc.Caption  := cnConsts.cn_DSetRecordCount[PLanguageIndex];
  InsOstLabel.Caption      := cnConsts.cn_EntryRest_Caption[PLanguageIndex];

  clBorgNa4alo.Caption     := cnConsts.fr_Reports_CALC_DolgBeg[PLanguageIndex];
  clSummaNadiyshla.Caption := cnConsts.fr_Reports_CALC_SumPay[PLanguageIndex];
  clBorgKinez.Caption      := cnConsts.fr_Reports_CALC_DolgEnd[PLanguageIndex];

  TreeBranchOpenBtn.Hint  := cnConsts.cn_tree_BranchOpen[PLanguageIndex];
  TreeBranchCloseBtn.Hint := cnConsts.cn_tree_BranchClose[PLanguageIndex];
  TreeFullOpenBtn.Hint    := cnConsts.cn_tree_FullOpen[PLanguageIndex];
  TreeFullCloseBtn.Hint   := cnConsts.cn_tree_FullClose[PLanguageIndex];
  NumYearColumn.Caption   := cnConsts.cn_AcademYear[PLanguageIndex];
  IsSortingBtn.Caption    := cnConsts.cn_AcademYear[PLanguageIndex];

  Lgota_Label.Caption := cnConsts.cn_Lgota[PLanguageIndex];
end;

procedure TfrmPayment.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPayment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  With DM.StProc do
   begin
    StoredProcName := 'CN_PAY_TMP_CLEAR';
    Transaction.StartTransaction;
    Prepare;
    ParamByName('ID_SESSION').AsInt64 := id_session_pay;
    ExecProc;

    Transaction.Commit;
    Close;

    StoredProcName := 'CN_CALC_TMP_CLEAR';
    Transaction.StartTransaction;
    Prepare;
    ParamByName('ID_SESSION').AsInt64 := id_session_calc;
    ExecProc;

    Transaction.Commit;
    Close;

    StoredProcName := 'CN_TMP_PRINT_CN_CALC_DELETE';
    Transaction.StartTransaction;
    Prepare;
    ParamByName('ID_SESSION').AsInt64:=ID_TRANSACTION;
    ExecProc;

    Transaction.Commit;
    Close;
  end;

  if FormStyle = fsMDIChild
   then action := caFree
   else
    begin
     DM.Free;
     DM2.Free;
    end;
end;

procedure TfrmPayment.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPayment.Calc_CountButtonClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  Calc_CountButton.Caption := cnConsts.cn_DSetRecordCount[PLanguageIndex];
  Calc_CountButton.Caption := Calc_CountButton.Caption + inttostr(DM2.DataSet.RecordCount);

  Screen.Cursor := crDefault;
end;

procedure TfrmPayment.Pay_CountButtonClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  Pay_CountButton.Caption := cnConsts.cn_DSetRecordCount[PLanguageIndex];
  Pay_CountButton.Caption := Pay_CountButton.Caption + inttostr(DM.DataSet.RecordCount);

  Screen.Cursor := crDefault;
end;

procedure TfrmPayment.DocTableDblClick(Sender: TObject);
var
  AParameter : TcnSimpleParamsEx;
begin
  if DocTable.DataController.RecordCount = 0 then exit;

  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.cnParamsToPakage.ID_DOC := StrToInt64(DM.Dataset['ID_DOC_VARCHAR']);
  AParameter.WaitPakageOwner:= self;

  RunFunctionFromPackage(AParameter, 'Contracts\cn_inf_DocsProv_DB_KR_Info.bpl','ShowDocProvInfo');

  AParameter.Free;

  Screen.Cursor := crDefault;
end;


procedure TfrmPayment.DocTableKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then DocTableDblClick(Sender);
end;

procedure TfrmPayment.Button1Click(Sender: TObject);
begin
  NumYearColumn.GroupIndex := -1;
end;

procedure TfrmPayment.TreeFullOpenBtnClick(Sender: TObject);
begin
  if calcTable.DataController.RecordCount = 0 then exit;

  calcTable.ViewData.Expand(True);
end;

procedure TfrmPayment.TreeFullCloseBtnClick(Sender: TObject);
begin
  if calcTable.DataController.RecordCount = 0 then exit;

  calcTable.ViewData.Collapse(True);
end;

procedure TfrmPayment.TreeBranchOpenBtnClick(Sender: TObject);
begin
  if calcTable.DataController.RecordCount = 0 then exit;

  calcTable.Controller.FocusedRecord.Expand(true);
end;

procedure TfrmPayment.TreeBranchCloseBtnClick(Sender: TObject);
begin
  if calcTable.DataController.RecordCount = 0 then exit;

  calcTable.Controller.FocusedRecord.Collapse(true);
end;

procedure TfrmPayment.IsSortingBtnClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  With DM.StProc do
   begin
    StoredProcName := 'CN_TMP_PRINT_CN_CALC_DELETE';
    Transaction.StartTransaction;
    Prepare;
    ParamByName('ID_SESSION').AsInt64:=ID_TRANSACTION;
    ExecProc;

    Transaction.Commit;
    Close;

    StoredProcName:='CN_FR_GET_ID_SESSION';
    Transaction.StartTransaction;
    Prepare;
    ExecProc;

    ID_TRANSACTION:= FieldByName('ID_SESSION').AsInt64;

    Transaction.Commit;
    Close;

    //отбор данных из базы
    if IsSortingBtn.Down
     then StoredProcName:='CN_PRINT_CN_CALC_BY_ACADEMIC'
     else StoredProcName:='CN_PRINT_CN_CALC';

    Transaction.StartTransaction;
    Prepare;
    ParamByName('ID_STUD').AsInt64:= ID_STUD;
    ParamByName('end_check').AsDate:=now;
    ParamByName('ID_SESSION').AsInt64:=ID_TRANSACTION;

    ExecProc;

    Transaction.Commit;
    Close;
   end;

  DM2.DataSet.Close;
  DM2.DataSet.SelectSQL.Clear;
  DM2.DataSet.SelectSQL.text:= 'select * from cn_tmp_print_cn_calc where id_session =:ID_TRANSACTION';
  DM2.DataSet.ParamByName('ID_TRANSACTION').AsInt64 := ID_TRANSACTION;
  calcTable.DataController.DataSource := DM2.DataSource;
  DM2.DataSet.closeopen(true);

  Screen.Cursor := crDefault;
end;

procedure TfrmPayment.act_helpExecute(Sender: TObject);
var
  FileName : String;
  FullName : PAnsiChar;
begin
  DM.DataSet_help.Close;
  DM.DataSet_help.SQLs.SelectSQL.Text := 'select * from pub_sp_help where name_object = :object and name_system = :system';
  DM.DataSet_help.ParamByName('object').AsString := 'inf_pay_analys';
  DM.DataSet_help.ParamByName('system').AsString := 'contracts';
  DM.DataSet_help.Open;


  If DM.DataSet_help.RecordCount = 0 then
   begin
    cnShowMessage('Help not found',
                  'Help not Found' + #13 + cnConsts_Messages.cn_GoToAdmin[PLanguageIndex],
                   mtError,
                   [mbOK]);
    Exit;
   end;

  FileName := DM.DataSet_help.FieldByName('NAME_FILE').AsString;
  FullName := PChar(ExtractFilePath(Application.ExeName) + 'Help\Contracts\' + FileName);
  if not FileExists(FullName) then
   Begin
    cnShowMessage('File not found',
                   FullName + #13 + cnConsts_Messages.cn_GoToAdmin[PLanguageIndex],
                   mtError,
                   [mbOK]);
    Exit;
   end;

  ShellExecute(Handle, 'open', FullName, nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmPayment.DataSet_CalcAfterScroll(DataSet: TDataSet);
begin
  if DM.DataSet_calc['NOTE'] <> null
   then Comment_DB_Label.Caption:= vartostr(DM.DataSet_calc['NOTE'])
   else Comment_DB_Label.Caption:= '...';
end;

procedure TfrmPayment.cxGridDBTableView1DblClick(Sender: TObject);
var
  AParameter : TcnSimpleParamsEx;
begin
  if DocTable.DataController.RecordCount = 0 then exit;

  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.cnParamsToPakage.ID_DOC := DM.DataSet_calc['ID_DOC'];
  AParameter.WaitPakageOwner:= self;

  RunFunctionFromPackage(AParameter, 'Contracts\cn_inf_DocsProv_DB_KR_Info.bpl','ShowDocProvInfo');

  AParameter.Free;

  Screen.Cursor := crDefault;
end;

end.
