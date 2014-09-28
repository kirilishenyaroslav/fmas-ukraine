unit uVopros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TVoprosForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
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
  VoprosForm: TVoprosForm;

implementation

{$R *.dfm}

procedure TVoprosForm.cxButton1Click(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TVoprosForm.cxButton2Click(Sender: TObject);
begin
Close;
end;

end.
