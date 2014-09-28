unit uMonuMessages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxLabel;

type
  TfrmMsg = class(TForm)
    bOk: TcxButton;
    Image1: TImage;
    lbMsg: TLabel;
    bYes: TcxButton;
    bNo: TcxButton;
    procedure bOkClick(Sender: TObject);
    procedure bNoClick(Sender: TObject);
    procedure bYesClick(Sender: TObject);
  private
  public
  end;

var
  frmMsg: TfrmMsg;

implementation

{$R *.dfm}

procedure TfrmMsg.bOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMsg.bNoClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMsg.bYesClick(Sender: TObject);
begin
 ModalResult := mrYes;
end;

end.
