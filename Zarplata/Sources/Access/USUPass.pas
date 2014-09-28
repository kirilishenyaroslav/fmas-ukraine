unit USUPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxButtons;

type
  TfrmSuperUserPass = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    PassEdit: TcxTextEdit;
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

procedure TfrmSuperUserPass.cxButton1Click(Sender: TObject);
begin
      ModalResult:=mrYes;
end;

procedure TfrmSuperUserPass.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

end.
