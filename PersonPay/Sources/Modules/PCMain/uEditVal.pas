unit uEditVal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TEditValForm = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditValForm: TEditValForm;

implementation

{$R *.dfm}

procedure TEditValForm.cxButton1Click(Sender: TObject);
begin
Modalresult:=mrOk;
end;

procedure TEditValForm.cxButton2Click(Sender: TObject);
begin
Close;
end;

end.
