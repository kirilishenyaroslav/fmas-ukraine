unit ini_type_account_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxLookAndFeelPainters, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, ExtCtrls, cxCheckBox;

resourcestring
  TITERROR='Необхідно ввести назву';


type
  TFini_type_account_ADD = class(TForm)
    Label1: TLabel;
    NameEdit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Bevel1: TBevel;
    isBankAccCheck: TcxCheckBox;
    cbVal: TcxCheckBox;
    NoAccCheck: TcxCheckBox;
    procedure CancelButtonClick(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    MResult : string;
  end;

implementation
uses BaseTypes;
{$R *.DFM}

procedure TFini_type_account_ADD.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TFini_type_account_ADD.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then OKButton.SetFocus;
end;

procedure TFini_type_account_ADD.OKButtonClick(Sender: TObject);
begin
 if NameEdit.Text = '' then begin
  agShowMessage(TITERROR);
  exit;
 end;
 mResult := 'ok';
 Close;
end;

procedure TFini_type_account_ADD.FormCreate(Sender: TObject);
begin
 mResult := 'cancel';
end;

procedure TFini_type_account_ADD.FormShow(Sender: TObject);
begin
 NameEdit.SetFocus;
end;

end.
