unit uSelectAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxRadioGroup, cxLookAndFeelPainters, cxButtons, jpeg,
  cxControls, cxContainer, cxEdit, cxImage;

type
  TSelectActionForm = class(TForm)
    lbl1: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    lbl2: TLabel;
    cxButton3: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    go_on:Integer;
  end;

var
  SelectActionForm: TSelectActionForm;

implementation

{$R *.dfm}

procedure TSelectActionForm.cxButton1Click(Sender: TObject);
begin
go_on:=1;
ModalResult:=mrOk;
end;

procedure TSelectActionForm.cxButton2Click(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TSelectActionForm.cxButton3Click(Sender: TObject);
begin
go_on:=0;
ModalResult:=mrOK;
end;

end.
