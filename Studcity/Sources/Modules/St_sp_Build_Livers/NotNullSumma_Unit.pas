unit NotNullSumma_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit;

type
  TfrmNotNullSumma = class(TForm)
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxCurrencyEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotNullSumma: TfrmNotNullSumma;

implementation

{$R *.dfm}

procedure TfrmNotNullSumma.cxButton1Click(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfrmNotNullSumma.cxButton2Click(Sender: TObject);
begin
close;
end;

procedure TfrmNotNullSumma.cxCurrencyEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then cxButton1.SetFocus;
end;

end.
