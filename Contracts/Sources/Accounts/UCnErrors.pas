unit UCnErrors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, StdCtrls, cxButtons, ExtCtrls;

type
  TfrmGetErrors = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxMemo1: TcxMemo;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmGetErrors.cxButton1Click(Sender: TObject);
begin
      ModalResult:=mrYes;
end;

end.
