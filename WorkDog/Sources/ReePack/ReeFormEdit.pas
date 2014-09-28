unit ReeFormEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons;

type
  TEditNumDateRee = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    cxTextEdit1: TcxTextEdit;
    Label2: TLabel;
    cxDateEdit1: TcxDateEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditNumDateRee: TEditNumDateRee;

implementation

{$R *.dfm}

procedure TEditNumDateRee.cxButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TEditNumDateRee.cxButton2Click(Sender: TObject);
begin
  Close;
end;

end.
