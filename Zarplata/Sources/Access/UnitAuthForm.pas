unit UnitAuthForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit;

type
  TfrmAUsers = class(TForm)
    LoginEditOld: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    LoginEditNew: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmAUsers.cxButton1Click(Sender: TObject);
begin
      ModalResult:=mrYes;
end;

procedure TfrmAUsers.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

end.
