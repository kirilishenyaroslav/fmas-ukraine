unit msgUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, jpeg, ExtCtrls;

type
  TmsgForm = class(TForm)
    Image1: TImage;
    CloseButton: TcxButton;
    msgEdit: TcxTextEdit;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  msgForm: TmsgForm;

implementation

{$R *.dfm}

procedure TmsgForm.CloseButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TmsgForm.FormShow(Sender: TObject);
begin
 CloseButton.SetFocus;
end;

end.
