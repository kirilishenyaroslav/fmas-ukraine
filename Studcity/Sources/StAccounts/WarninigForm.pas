unit WarninigForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TfrmWarnFrm = class(TForm)
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
  frmWarnFrm: TfrmWarnFrm;

implementation

{$R *.dfm}

procedure TfrmWarnFrm.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmWarnFrm.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrYesToAll;
end;

procedure TfrmWarnFrm.cxButton3Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmWarnFrm.cxButton4Click(Sender: TObject);
begin
     ModalResult:=mrNoToAll;
end;

end.
