unit UDocEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TfrmDocInfo = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Panel2: TPanel;
    docComment: TcxMemo;
    Label1: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmDocInfo.cxButton1Click(Sender: TObject);
begin
      ModalResult:=mrYes;
end;

procedure TfrmDocInfo.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

end.
