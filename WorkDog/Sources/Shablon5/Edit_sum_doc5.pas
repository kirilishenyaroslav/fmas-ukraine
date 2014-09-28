unit Edit_sum_doc5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, Mask, ToolEdit, CurrEdit,
  cxButtons, ExtCtrls;

type
  TForm_edit_sum = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  procedure Sum_doc(summa_docum: Currency);
    { Public declarations }
  end;

var
  Form_edit_sum: TForm_edit_sum;
  sum_d: Variant;//сумма не должна быть меньше чем была!

implementation

{$R *.dfm}

procedure TForm_edit_sum.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_edit_sum.cxButton1Click(Sender: TObject);
begin
 if CurrencyEdit1.Text = '' then
 begin
  ShowMessage('¬вед≥ть суму!');
  exit;
 end;
 if CurrencyEdit1.Text < sum_d then
 begin
   ShowMessage('—ума не може бути менше н≥ж була!');
   exit;
 end;
 ModalResult := mrOk;
end;

procedure TForm_edit_sum.Sum_doc(summa_docum: Currency);
begin
  sum_d := summa_docum;
end;

procedure TForm_edit_sum.FormShow(Sender: TObject);
begin
  CurrencyEdit1.SetFocus;
end;

end.
