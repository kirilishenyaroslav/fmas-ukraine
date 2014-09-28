unit TITaxInvoicesEdit_EditTax;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxCurrencyEdit, StdCtrls, cxButtons, TiMessages, IBase;

type
  TTaxInvoicesEditTaxForm = class(TForm)
    Label1: TLabel;
    TaxLabel: TLabel;
    YesButton: TcxButton;
    CancelButton: TcxButton;
    TaxCurrencyEdit: TcxCurrencyEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure YesButtonClick(Sender: TObject);
  private
    PDb_Handle : TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

var
  TaxInvoicesEditTaxForm: TTaxInvoicesEditTaxForm;

implementation

{$R *.dfm}
constructor TTaxInvoicesEditTaxForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
end;

procedure TTaxInvoicesEditTaxForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TTaxInvoicesEditTaxForm.YesButtonClick(Sender: TObject);
begin
  if (TaxCurrencyEdit.Text='') then
  begin
    TiShowMessage('Увага!','Заповніть суму ПДВ!',mtWarning,[mbOK]);
    TaxCurrencyEdit.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

end.
