unit TaxLiabilities_SummaEnableOtrNakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, cxContainer, cxEdit, cxLabel,
  cxDBLabel, StdCtrls, cxButtons, cxControls, Ibase,cxGroupBox,TaxLiabilities_DM,
  cxTextEdit, cxDBEdit;

type
  TTaxLiabilitiesSummaEnableOtrNaklForm = class(TForm)
    NameTaxLiabilitiesGroupBox: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    YesButton: TcxButton;
    CancelButton: TcxButton;
    summa_20_0_not_pdvCheckBox: TcxCheckBox;
    summa_20_0_pdvCheckBox: TcxCheckBox;
    summa_exempt_not_pdvCheckBox: TcxCheckBox;
    summa_exempt_pdvCheckBox: TcxCheckBox;
    summa_econ_activ_not_pdvCheckBox: TcxCheckBox;
    SummaEnableDBTextEdit: TcxDBTextEdit;
    summa_econ_activ_pdvCheckBox: TcxCheckBox;
    summa_delivery_not_pdvCheckBox: TcxCheckBox;
    summa_delivery_pdvCheckBox: TcxCheckBox;
    procedure CancelButtonClick(Sender: TObject);
    procedure YesButtonClick(Sender: TObject);
  private
    PDb_Handle : TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

var
  TaxLiabilitiesSummaEnableOtrNaklForm: TTaxLiabilitiesSummaEnableOtrNaklForm;

implementation

{$R *.dfm}

constructor TTaxLiabilitiesSummaEnableOtrNaklForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
end;

procedure TTaxLiabilitiesSummaEnableOtrNaklForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTaxLiabilitiesSummaEnableOtrNaklForm.YesButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
