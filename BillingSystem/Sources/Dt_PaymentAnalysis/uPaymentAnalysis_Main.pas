//******************************************************************************
// Проект ""
// Форма анализа оплаты
// 
//******************************************************************************

unit uPaymentAnalysis_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  uPaymentAnalysis_DM, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  uCommon_Funcs, uConsts, cxCurrencyEdit, cxCalendar,
  cxLookAndFeelPainters, FIBDataSet, pFIBDataSet, cxGroupBox, StdCtrls,
  cxButtons, uCommon_Types, uCommon_Loader;

type
  TfrmPaymentAnalysis_Main = class(TForm)
    FIO_Label: TLabel;
    FIOCOMBO_Label: TLabel;
    Comment_Label: TLabel;
    Grid_Nach: TcxGrid;
    calcTable: TcxGridDBTableView;
    Beg_Date: TcxGridDBColumn;
    End_Date: TcxGridDBColumn;
    Pay_Sum: TcxGridDBColumn;
    SummaLg: TcxGridDBColumn;
    Persent: TcxGridDBColumn;
    clBorgNa4alo: TcxGridDBColumn;
    Summa: TcxGridDBColumn;
    NumYearColumn: TcxGridDBColumn;
    clSummaNadiyshla: TcxGridDBColumn;
    clBorgKinez: TcxGridDBColumn;
    Grid_NachLevel1: TcxGridLevel;
    CancelButton: TcxButton;
    Grid_pay: TcxGrid;
    DocTable: TcxGridDBTableView;
    Doc_num: TcxGridDBColumn;
    Doc_date: TcxGridDBColumn;
    Doc_summa: TcxGridDBColumn;
    Note: TcxGridDBColumn;
    id_doc: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Zadolg_Label: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    zadolg_grn_Label: TLabel;
    InsOstLabel: TLabel;
    Label2: TLabel;
    Lgota_Label: TLabel;
    Label3: TLabel;
    cn_SNeed_Edit: TcxCurrencyEdit;
    cn_UplSum_Edit: TcxCurrencyEdit;
    Zadolgnost_Edit: TcxCurrencyEdit;
    InsOst_Edit: TcxCurrencyEdit;
    Lgota_Edit: TcxCurrencyEdit;
    Calc_CountButton: TcxButton;
    Pay_CountButton: TcxButton;
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
    PopupImageList: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure Calc_CountButtonClick(Sender: TObject);
    procedure Pay_CountButtonClick(Sender: TObject);
    procedure DocTableDblClick(Sender: TObject);
    procedure DocTableKeyPress(Sender: TObject; var Key: Char);
    procedure calcTableCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure DocTableCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    PLanguageIndex: byte;
    DM :TfrmPaymentAnalysis_DM;
    DM2:TfrmPaymentAnalysis_DM;
    id_session_pay  : int64;
    id_session_calc : int64;
    ID_TRANSACTION  : int64;
    ID_STUD         : int64;
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(Aparameter:TbsSimpleParamsEx);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmPaymentAnalysis_Main.Create(Aparameter:TbsSimpleParamsEx);
var
  i:Integer;
  lgot, npay, pay, entry_rest, result : Double;
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(Aparameter.Owner);

  DM := TfrmPaymentAnalysis_DM.Create(self);
  DM.DB.Handle := Aparameter.Db_Handle;
  DM.DB.Connected := True;
  DM.ReadTransaction.StartTransaction;

  FormIniLanguage();

  FIO_Label.Caption := FIO_Label.Caption + ' '+Aparameter.bsParamsToPakage.FIO;

  lgot:=0;
  npay:=0;
  pay:=0;
  entry_rest:=0;

  DM.pFIBDataSet1.Close;
  DM.pFIBDataSet1.SQLs.SelectSQL.Text := 'Select Summa from bs_DT_DOG_ENTRYREST_SEL(:id_dog)';
  DM.pFIBDataSet1.ParamByName('ID_DOG').AsInt64 := Aparameter.bsParamsToPakage.ID_DOG;
  DM.pFIBDataSet1.Open;
  DM.pFIBDataSet1.FetchAll;
  DM.pFIBDataSet1.First;
  For i := 0 to DM.pFIBDataSet1.RecordCount-1 do
   begin
    if DM.pFIBDataSet1['Summa'] <> null
     then entry_rest := entry_rest + DM.pFIBDataSet1['Summa'];
    DM.pFIBDataSet1.Next;
   end;
  InsOst_Edit.EditValue := entry_rest; 

  calcTable.DataController.DataSource := DM.DataSource1;
  DM.ReadDataSet.Close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'Select * from bs_dt_pay_sel(:id_dog)';
  DM.ReadDataSet.ParamByName('Id_dog').AsInt64 := Aparameter.bsParamsToPakage.ID_DOG;
  DM.ReadDataSet.Open;
  DM.ReadDataSet.FetchAll;
  DM.ReadDataSet.First;
  For i:=0 to DM.ReadDataSet.RecordCount-1 do
   Begin
    if DM.ReadDataSet['SLGOT'] <> null then lgot := lgot + DM.ReadDataSet['SLGOT'];
    if DM.ReadDataSet['Summa'] <> null then npay := npay + DM.ReadDataSet['Summa'];
    DM.ReadDataSet.Next;
   end;

  Lgota_Edit.EditValue := Lgot;
  cn_SNeed_Edit.EditValue := npay;

  DocTable.DataController.DataSource := DM.DataSource;
  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'Select * from bs_TMP_OPL_SEL(:id_dog)';
  DM.DataSet.ParamByName('Id_dog').AsInt64 := Aparameter.bsParamsToPakage.ID_DOG;
  DM.DataSet.Open;
  DM.DataSet.FetchAll;
  DM.DataSet.First;
  For i:=0 to DM.DataSet.RecordCount-1 do
   Begin
    if DM.DataSet['Summa']<> null
     then pay := pay + DM.DataSet['Summa'];
    DM.DataSet.Next;
   end;

  cn_UplSum_Edit.EditValue := pay;

  result := npay - pay - lgot + entry_rest;

  if result<0 then
   Begin
    Zadolg_Label.Caption := 'Переплата:';
    Zadolgnost_Edit.style.font.Color := clGreen;
   End;
  if result=0 then
   Begin
    Zadolg_Label.Caption := 'Точна сплата:';
    Zadolgnost_Edit.style.font.Color := clInfoText;
   End;

  Zadolgnost_Edit.EditValue := Abs(result);

  If DM.DataSet['Note'] <> null then Comment_Label.Caption := DM.DataSet['Note'];

  Screen.Cursor:=crDefault;
end;

procedure TfrmPaymentAnalysis_Main.FormIniLanguage;
begin
  PLanguageIndex:=           uCommon_Funcs.bsLanguageIndex();

  //кэпшн формы
  Caption:=                      uConsts.bs_PaymentAnalysis[PLanguageIndex];

  //названия кнопок
  CancelButton.Caption := uConsts.bs_Exit[PLanguageIndex];
  FIO_Label.Caption    := uConsts.bs_grid_FIO_Column[PLanguageIndex];

  //Grid
  Beg_Date.Caption := uConsts.bs_Beg_Opl[PLanguageIndex];
  End_Date.Caption := uConsts.bs_End_Opl[PLanguageIndex];
  Pay_Sum.Caption  := 'Вартість послуги, грн';
  SummaLg.Caption  := uConsts.bs_SummaLg_Opl[PLanguageIndex];
  Persent.Caption  := uConsts.bs_PercentLg_Opl[PLanguageIndex];
  Summa.Caption    := uConsts.bs_SummFinal_Opl[PLanguageIndex];

  cxGroupBox1.Caption := uConsts.bs_Itogo_Pay[PLanguageIndex];

  Label4.Caption        := uConsts.bs_Need_Pay[PLanguageIndex];
  Label5.Caption        := uConsts.bs_Was_Pay[PLanguageIndex];
  Zadolg_Label.Caption  := uConsts.bs_Zadolg_Pay[PLanguageIndex];
  Comment_Label.Caption := uConsts.bs_Hint_Pay[PLanguageIndex];

  Doc_num.Caption   := uConsts.bs_NumDoc_Pay[PLanguageIndex];
  Doc_date.Caption  := uConsts.bs_DateDoc_Pay[PLanguageIndex];
  Doc_summa.Caption := uConsts.bs_Summa_Pay[PLanguageIndex];

  Calc_CountButton.Caption := uConsts.bs_DSetRecordCount[PLanguageIndex];
  Pay_CountButton.Caption  := uConsts.bs_DSetRecordCount[PLanguageIndex];
  InsOstLabel.Caption      := uConsts.bs_EntryRest_Caption[PLanguageIndex];


  clBorgNa4alo.Caption     := uConsts.fr_Reports_CALC_DolgBeg[PLanguageIndex];
  clSummaNadiyshla.Caption := uConsts.fr_Reports_CALC_SumPay[PLanguageIndex];
  clBorgKinez.Caption      := uConsts.fr_Reports_CALC_DolgEnd[PLanguageIndex];

  NumYearColumn.Caption   := uConsts.bs_AcademYear[PLanguageIndex];

  Lgota_Label.Caption := uConsts.bs_Lgota[PLanguageIndex];
end;

procedure TfrmPaymentAnalysis_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild
   then Action := caFree
   else
    begin
     DM.Free;
     DM2.Free;
    End; 
end;

procedure TfrmPaymentAnalysis_Main.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPaymentAnalysis_Main.Calc_CountButtonClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Calc_CountButton.Caption :=                uConsts.bs_DSetRecordCount[PLanguageIndex];
  Calc_CountButton.Caption := Calc_CountButton.Caption + inttostr(DM2.DataSet.RecordCount);
  Screen.Cursor := crDefault;
end;

procedure TfrmPaymentAnalysis_Main.Pay_CountButtonClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Pay_CountButton.Caption :=                uConsts.bs_DSetRecordCount[PLanguageIndex];
  Pay_CountButton.Caption := Pay_CountButton.Caption + inttostr(DM.DataSet.RecordCount);
  Screen.Cursor := crDefault;
end;

procedure TfrmPaymentAnalysis_Main.DocTableDblClick(Sender: TObject);
{var
 AParameter : TbsSimpleParamsEx;}
begin
{if DocTable.DataController.RecordCount = 0 then exit;
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DM.DB.Handle;
 AParameter.Formstyle:=fsNormal;
// AParameter.cnParamsToPakage.ID_DOC := strtoint(DM.Dataset.FieldByName('ID_DOC_VARCHAR').AsVariant);
 AParameter.cnParamsToPakage.ID_DOC := StrToInt64(DM.Dataset['ID_DOC_VARCHAR']);
 AParameter.WaitPakageOwner:= self;
 RunFunctionFromPackage(AParameter, 'Contracts\cn_inf_DocsProv_DB_KR_Info.bpl','ShowDocProvInfo');
 AParameter.Free;
 Screen.Cursor := crDefault;}
end;


procedure TfrmPaymentAnalysis_Main.DocTableKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then DocTableDblClick(Sender);
end;

procedure TfrmPaymentAnalysis_Main.calcTableCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
 Arect:TRect;
begin
  if ((AViewInfo.GridRecord.Values[7]= -1) and (not AViewInfo.GridRecord.Focused ))
  then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:= clMoneyGreen;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[7]= -1) and (AViewInfo.GridRecord.Focused ))
  then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$0089BE89;
      ACanvas.Canvas.FillRect(Arect);
   end;
 
end;

procedure TfrmPaymentAnalysis_Main.DocTableCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  Comment_Label.Caption := DM.DataSet['Note'];
end;

end.
