unit jo9_question;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, jpeg, cxControls,
  cxContainer, cxEdit, cxImage;

type
  TQustionForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OkBut: TcxButton;
    CancelBut: TcxButton;
    cxImage1: TcxImage;
    procedure CancelButClick(Sender: TObject);
    procedure OkButClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QustionForm: TQustionForm;

implementation

{$R *.dfm}

procedure TQustionForm.CancelButClick(Sender: TObject);
begin
close;
end;

procedure TQustionForm.OkButClick(Sender: TObject);
begin
ModalResult:=mrOK;
end;

end.
