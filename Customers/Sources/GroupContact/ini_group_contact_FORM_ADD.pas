unit ini_group_contact_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxButtons, ExtCtrls;

type
  TFini_group_contact_ADD = class(TForm)
    Label1: TLabel;
    NameEdit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Bevel1: TBevel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
  public
    MResult : string;
  end;

var
  Fini_group_contact_ADD: TFini_group_contact_ADD;

implementation
uses BaseTypes;
{$R *.DFM}

procedure TFini_group_contact_ADD.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TFini_group_contact_ADD.OKButtonClick(Sender: TObject);
begin
 if NameEdit.Text = '' then begin
  agShowMessage('Необхідно ввести назву.');
  exit;
 end;
 mResult := 'ok';
 Close;
end;

procedure TFini_group_contact_ADD.FormCreate(Sender: TObject);
begin
 mResult := 'cancel';
end;

procedure TFini_group_contact_ADD.FormShow(Sender: TObject);
begin
 NameEdit.SetFocus;
end;

procedure TFini_group_contact_ADD.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then OKButton.SetFocus;
end;

end.
