unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TForm4 = class(TForm)
    EditDate: TcxDateEdit;
    Label1: TLabel;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label2: TLabel;
    EditNum: TcxTextEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.cxButton2Click(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TForm4.cxButton1Click(Sender: TObject);
begin
ModalResult:=mrOk;
end;


end.
