unit uDelNN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, uMainNN;

type
  TDelNNForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    cxButtonAdd: TcxButton;
    cxButtonDelete: TcxButton;
    procedure cxButtonDeleteClick(Sender: TObject);
    procedure cxButtonAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DelNNForm: TDelNNForm;

implementation

{$R *.dfm}

procedure TDelNNForm.cxButtonDeleteClick(Sender: TObject);
begin
Close;
end;

procedure TDelNNForm.cxButtonAddClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

end.
