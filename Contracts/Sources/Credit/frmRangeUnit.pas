unit frmRangeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxCurrencyEdit, cxButtons, cn_Common_Funcs,
  cxRadioGroup;

type
  TfrmRange = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    RBegEdit: TcxCurrencyEdit;
    REndEdit: TcxCurrencyEdit;
    lbl1: TLabel;
    Label1: TLabel;
    radAll: TcxRadioButton;
    radChet: TcxRadioButton;
    radNechet: TcxRadioButton;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure RBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure REndEditKeyPress(Sender: TObject; var Key: Char);
  private

  public
   PLanguageIndex :byte;
  end;


implementation

{$R *.dfm}

procedure TfrmRange.OKButtonClick(Sender: TObject);
begin
if CheckControls(self, PLanguageIndex) then exit;
ModalResult:= mrOk;
end;

procedure TfrmRange.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmRange.RBegEditKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmRange.REndEditKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

end.
