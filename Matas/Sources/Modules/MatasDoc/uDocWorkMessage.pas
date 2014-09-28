unit uDocWorkMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TMessageForm = class(TForm)
    cxMemo1: TcxMemo;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MessageForm: TMessageForm;

implementation

{$R *.dfm}

procedure TMessageForm.cxButton1Click(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TMessageForm.cxButton2Click(Sender: TObject);
begin
Close;
end;

end.
