unit CryptDo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TfmCryptDo = class(TForm)
    cxMemo1: TcxMemo;
    cxMemo2: TcxMemo;
    ButtonCrypt: TcxButton;
    ButtonUnCrypt: TcxButton;
    cxButton1: TcxButton;
    procedure ButtonCryptClick(Sender: TObject);
    procedure ButtonUnCryptClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent);
  end;

var
  fmCryptDo: TfmCryptDo;

implementation
uses MainCrypt;

{$R *.dfm}

constructor TfmCryptDo.Create(AOwner: TComponent);
begin
    inherited Create (AOwner);
    Caption := '';
    cxMemo1.Text :='';
    cxMemo2.Text :='';
end;

procedure TfmCryptDo.ButtonCryptClick(Sender: TObject);
begin
    CxMemo2.Text := GetCrypted(CxMemo1.Text);
end;

procedure TfmCryptDo.ButtonUnCryptClick(Sender: TObject);
begin
    CxMemo2.Text := GetUnCrypted(CxMemo1.Text);
end;

procedure TfmCryptDo.cxButton1Click(Sender: TObject);
begin
    close;
end;

end.
