unit FnzbChooseRee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit;

type
  TfrmChooseRee = class(TForm)
    NumEdit: TcxTextEdit;
    Label2: TLabel;
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
  frmChooseRee: TfrmChooseRee;

implementation

{$R *.dfm}

procedure TfrmChooseRee.cxButton1Click(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfrmChooseRee.cxButton2Click(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

end.
