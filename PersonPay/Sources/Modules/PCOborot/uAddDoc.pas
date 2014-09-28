unit uAddDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup;

type
  TAddDocForm = class(TForm)
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
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
  AddDocForm: TAddDocForm;

implementation

{$R *.dfm}

procedure TAddDocForm.cxButton1Click(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TAddDocForm.cxButton2Click(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

end.
