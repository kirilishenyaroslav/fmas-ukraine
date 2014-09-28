unit UcnWarnForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TfrmCnWarnForm = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCnWarnForm: TfrmCnWarnForm;

implementation

{$R *.dfm}

procedure TfrmCnWarnForm.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmCnWarnForm.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrYesToAll;
end;

procedure TfrmCnWarnForm.cxButton3Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmCnWarnForm.cxButton4Click(Sender: TObject);
begin
     ModalResult:=mrNoToAll;
end;

end.
