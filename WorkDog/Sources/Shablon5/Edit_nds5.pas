unit Edit_nds5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, Mask, ToolEdit, CurrEdit,
  cxButtons, ExtCtrls;

type
  TFormEditNds = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    CurrencyEdit1: TCurrencyEdit;
    Label1: TLabel;
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
  FormEditNds: TFormEditNds;
  sum_d: Currency;

implementation

{$R *.dfm}

procedure TFormEditNds.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormEditNds.cxButton1Click(Sender: TObject);
begin
  if CurrencyEdit1.Value > sum_d then
  begin
    ShowMessage('ПДВ не може перевищувати суму документа!');
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TFormEditNds.Sum_doc(summa_docum: Currency);
begin
  sum_d := summa_docum;
end;


procedure TFormEditNds.FormShow(Sender: TObject);
begin
  CurrencyEdit1.SetFocus;
end;

end.
