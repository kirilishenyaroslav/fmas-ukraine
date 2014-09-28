unit TaxLiabilities_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  TiCommonProc,
  TaxLiabilities_SummaEnableVidNakl,
  TaxLiabilities_SummaEnableOtrNakl;

type
  TTaxLiabilitiesMainForm = class(TForm)
    TaxLiabilitiesGridDBTableView: TcxGridDBTableView;
    TaxLiabilitiesGridLevel: TcxGridLevel;
    TaxLiabilitiesGrid: TcxGrid;
    TaxLiabilitiesBarManager: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    TaxLiabilitiesGridDBTableViewDB_Kod: TcxGridDBColumn;
    TaxLiabilitiesGridDBTableViewDB_NameNotes: TcxGridDBColumn;
    SummaEnableButton: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TaxLiabilitiesGridDBTableViewDblClick(Sender: TObject);
    procedure SummaEnableButtonClick(Sender: TObject);
  private
    PRes               :Variant;
    pLanguageIndex     :Byte;
    pStylesDM          :TStyleDM;
    PDb_Handle         :TISC_DB_HANDLE;
    type_nakl_ins      :Integer;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;type_nakl:Integer);reintroduce;
    property Res:Variant read PRes;
  end;

var
  TaxLiabilitiesMainForm: TTaxLiabilitiesMainForm;

implementation

uses TaxLiabilities_DM;

{$R *.dfm}
constructor TTaxLiabilitiesMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;type_nakl:Integer);

begin
  inherited Create(AOwner);
  type_nakl_ins        := type_nakl;
  PDb_Handle           := Db_Handle;
  TaxLiabilitiesDM     := TTaxLiabilitiesDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('TaxLiabilities',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  TaxLiabilitiesGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  TaxLiabilitiesDM.TaxLiabilitiesDSet.Close;
  TaxLiabilitiesDM.TaxLiabilitiesDSet.SelectSQL.Text:='select * from TI_SP_TAXLIABILITIES';
  TaxLiabilitiesDM.TaxLiabilitiesDSet.Open;
end;

procedure TTaxLiabilitiesMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTaxLiabilitiesMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=TaxLiabilitiesDM.TaxLiabilitiesDSet['CODE'];
  PRes[1]:=TaxLiabilitiesDM.TaxLiabilitiesDSet['NAME'];
  PRes[2]:=TaxLiabilitiesDM.TaxLiabilitiesDSet['NUM'];
  ModalResult:=mrYes;
end;

procedure TTaxLiabilitiesMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   TaxLiabilitiesDM.Free;
end;

procedure TTaxLiabilitiesMainForm.TaxLiabilitiesGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

procedure TTaxLiabilitiesMainForm.SummaEnableButtonClick(Sender: TObject);
var
  ViewFormVidNakl : TTaxLiabilitiesSummaEnableVidNaklForm;
  ViewFormOtrNakl : TTaxLiabilitiesSummaEnableOtrNaklForm;
  id_taxliabilities : Integer;
begin
  if type_nakl_ins = 1 then   //выданные накладные
  begin
  ViewFormVidNakl := TTaxLiabilitiesSummaEnableVidNaklForm.Create(Self,TaxLiabilitiesDM.DB.Handle);
  if (TaxLiabilitiesDM.TaxLiabilitiesDSet['IS_SUMMA_TAXABLE_20'] = 1) then
    ViewFormVidNakl.SummaTaxable20CheckBox.Checked := True
  else
    ViewFormVidNakl.SummaTaxable20CheckBox.Checked := False;

  if (TaxLiabilitiesDM.TaxLiabilitiesDSet['IS_SUMMA_PDV_20'] = 1) then
    ViewFormVidNakl.SummaPDVCheckBox.Checked := True
  else
    ViewFormVidNakl.SummaPDVCheckBox.Checked := False;

  if (TaxLiabilitiesDM.TaxLiabilitiesDSet['IS_SUMMA_TAXABLE_0'] = 1) then
    ViewFormVidNakl.SummaTaxableCheckBox.Checked := True
  else
    ViewFormVidNakl.SummaTaxableCheckBox.Checked := False;

  if (TaxLiabilitiesDM.TaxLiabilitiesDSet['IS_SUMMA_EXEMPT'] = 1) then
    ViewFormVidNakl.SummaExemptCheckBox.Checked := True
  else
    ViewFormVidNakl.SummaExemptCheckBox.Checked := False;

  if (TaxLiabilitiesDM.TaxLiabilitiesDSet['IS_SUMMA_EXPORT'] = 1) then
    ViewFormVidNakl.SummaExportCheckBox.Checked := True
  else
    ViewFormVidNakl.SummaExportCheckBox.Checked := False;

  ViewFormVidNakl.ShowModal;

  if ViewFormVidNakl.ModalResult=mrOk then
  begin
    id_taxliabilities := TaxLiabilitiesDM.TaxLiabilitiesDSet['CODE'];
    TaxLiabilitiesDM.WriteTransaction.StartTransaction;
    TaxLiabilitiesDM.pFIBStoredProc.StoredProcName := 'TI_SP_TAXLIABILITIES_UPD';
    TaxLiabilitiesDM.pFIBStoredProc.ParamByName('type_nakl').Value := 1;// выданные накладные

    if (ViewFormVidNakl.SummaTaxable20CheckBox.Checked) then
      TaxLiabilitiesDM.pFIBStoredProc.ParamByName('IS_SUMMA_TAXABLE_20').Value := 1
    else
      TaxLiabilitiesDM.pFIBStoredProc.ParamByName('IS_SUMMA_TAXABLE_20').Value := 0;

    if (ViewFormVidNakl.SummaPDVCheckBox.Checked) then
      TaxLiabilitiesDM.pFIBStoredProc.ParamByName('IS_SUMMA_PDV_20').Value := 1
    else
      TaxLiabilitiesDM.pFIBStoredProc.ParamByName('IS_SUMMA_PDV_20').Value := 0;

    if (ViewFormVidNakl.SummaTaxableCheckBox.Checked) then
      TaxLiabilitiesDM.pFIBStoredProc.ParamByName('IS_SUMMA_TAXABLE_0').Value := 1
    else
      TaxLiabilitiesDM.pFIBStoredProc.ParamByName('IS_SUMMA_TAXABLE_0').Value := 0;

    if (ViewFormVidNakl.SummaExemptCheckBox.Checked) then
      TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_exempt').Value := 1
    else
      TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_exempt').Value := 0;

    if (ViewFormVidNakl.SummaExportCheckBox.Checked) then
      TaxLiabilitiesDM.pFIBStoredProc.ParamByName('IS_SUMMA_EXPORT').Value := 1
    else
      TaxLiabilitiesDM.pFIBStoredProc.ParamByName('IS_SUMMA_EXPORT').Value := 0;
    TaxLiabilitiesDM.pFIBStoredProc.ParamByName('code').Value := TaxLiabilitiesDM.TaxLiabilitiesDSet['CODE'];

    TaxLiabilitiesDM.pFIBStoredProc.ExecProc;
    TaxLiabilitiesDM.WriteTransaction.Commit;

    TaxLiabilitiesDM.TaxLiabilitiesDSet.Close;
    TaxLiabilitiesDM.TaxLiabilitiesDSet.Open;
    TaxLiabilitiesDM.TaxLiabilitiesDSet.Locate('code',IntToStr(id_taxliabilities),[]);
  end;
  end;

  if type_nakl_ins = 0 then //полученные накладные
  begin
    ViewFormOtrNakl := TTaxLiabilitiesSummaEnableOtrNaklForm.Create(Self,TaxLiabilitiesDM.DB.Handle);

    if (TaxLiabilitiesDM.TaxLiabilitiesDSet['is_summa_20_0_not_pdv'] = 1) then
      ViewFormOtrNakl.summa_20_0_not_pdvCheckBox.Checked := True
    else
      ViewFormOtrNakl.summa_20_0_not_pdvCheckBox.Checked := False;

    if (TaxLiabilitiesDM.TaxLiabilitiesDSet['is_summa_20_0_pdv'] = 1) then
      ViewFormOtrNakl.summa_20_0_pdvCheckBox.Checked := True
    else
      ViewFormOtrNakl.summa_20_0_pdvCheckBox.Checked := False;

    if (TaxLiabilitiesDM.TaxLiabilitiesDSet['is_summa_exempt_not_pdv'] = 1) then
      ViewFormOtrNakl.summa_exempt_not_pdvCheckBox.Checked := True
    else
      ViewFormOtrNakl.summa_exempt_not_pdvCheckBox.Checked := False;

    if (TaxLiabilitiesDM.TaxLiabilitiesDSet['is_summa_exempt_pdv'] = 1) then
      ViewFormOtrNakl.summa_exempt_pdvCheckBox.Checked := True
    else
      ViewFormOtrNakl.summa_exempt_pdvCheckBox.Checked := False;

    if (TaxLiabilitiesDM.TaxLiabilitiesDSet['is_summa_econ_activ_not_pdv'] = 1) then
      ViewFormOtrNakl.summa_econ_activ_not_pdvCheckBox.Checked := True
    else
      ViewFormOtrNakl.summa_econ_activ_not_pdvCheckBox.Checked := False;

    if (TaxLiabilitiesDM.TaxLiabilitiesDSet['is_summa_econ_activ_pdv'] = 1) then
      ViewFormOtrNakl.summa_econ_activ_pdvCheckBox.Checked := True
    else
      ViewFormOtrNakl.summa_econ_activ_pdvCheckBox.Checked := False;

    if (TaxLiabilitiesDM.TaxLiabilitiesDSet['is_summa_delivery_not_pdv'] = 1) then
      ViewFormOtrNakl.summa_delivery_not_pdvCheckBox.Checked := True
    else
      ViewFormOtrNakl.summa_delivery_not_pdvCheckBox.Checked := False;

    if (TaxLiabilitiesDM.TaxLiabilitiesDSet['is_summa_delivery_pdv'] = 1) then
      ViewFormOtrNakl.summa_delivery_pdvCheckBox.Checked := True
    else
      ViewFormOtrNakl.summa_delivery_pdvCheckBox.Checked := False;

    ViewFormOtrNakl.ShowModal;

    if ViewFormOtrNakl.ModalResult=mrOk then
    begin
      id_taxliabilities := TaxLiabilitiesDM.TaxLiabilitiesDSet['CODE'];
      TaxLiabilitiesDM.WriteTransaction.StartTransaction;
      TaxLiabilitiesDM.pFIBStoredProc.StoredProcName := 'TI_SP_TAXLIABILITIES_UPD';
      TaxLiabilitiesDM.pFIBStoredProc.ParamByName('type_nakl').Value := 0;// полученные накладные

      if (ViewFormOtrNakl.summa_20_0_not_pdvCheckBox.Checked) then
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_20_0_not_pdv').Value := 1
      else
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_20_0_not_pdv').Value := 0;

      if (ViewFormOtrNakl.summa_20_0_pdvCheckBox.Checked) then
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_20_0_pdv').Value := 1
      else
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_20_0_pdv').Value := 0;

      if (ViewFormOtrNakl.summa_exempt_not_pdvCheckBox.Checked) then
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_exempt_not_pdv').Value := 1
      else
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_exempt_not_pdv').Value := 0;

      if (ViewFormOtrNakl.summa_exempt_pdvCheckBox.Checked) then
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_exempt_pdv').Value := 1
      else
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_exempt_pdv').Value := 0;

      if (ViewFormOtrNakl.summa_econ_activ_not_pdvCheckBox.Checked) then
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_econ_activ_not_pdv').Value := 1
      else
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_econ_activ_not_pdv').Value := 0;

      if (ViewFormOtrNakl.summa_econ_activ_pdvCheckBox.Checked) then
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_econ_activ_pdv').Value := 1
      else
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_econ_activ_pdv').Value := 0;

      if (ViewFormOtrNakl.summa_delivery_not_pdvCheckBox.Checked) then
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_delivery_not_pdv').Value := 1
      else
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_delivery_not_pdv').Value := 0;

      if (ViewFormOtrNakl.summa_delivery_pdvCheckBox.Checked) then
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_delivery_pdv').Value := 1
      else
        TaxLiabilitiesDM.pFIBStoredProc.ParamByName('is_summa_delivery_pdv').Value := 0;

      TaxLiabilitiesDM.pFIBStoredProc.ParamByName('code').Value := TaxLiabilitiesDM.TaxLiabilitiesDSet['CODE'];

      TaxLiabilitiesDM.pFIBStoredProc.ExecProc;
      TaxLiabilitiesDM.WriteTransaction.Commit;

      TaxLiabilitiesDM.TaxLiabilitiesDSet.Close;
      TaxLiabilitiesDM.TaxLiabilitiesDSet.Open;
      TaxLiabilitiesDM.TaxLiabilitiesDSet.Locate('code',IntToStr(id_taxliabilities),[]);
    end;
  end;
end;

end.
