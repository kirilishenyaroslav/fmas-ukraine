unit sp_district_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxLookAndFeelPainters, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit;

type
  TFsp_district_form_add = class(TForm)
    Label1: TLabel;
    FullNameEdit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FullNameEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fsp_district_form_add: TFsp_district_form_add;

implementation
uses AGBaseTypes;

{$R *.DFM}

procedure TFsp_district_form_add.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFsp_district_form_add.OKButtonClick(Sender: TObject);
begin
 if FullNameEdit.Text = '' then begin
  agShowMessage('Необхідно ввести назву.');
  exit;
 end;
 ModalResult := mrOK;
end;

procedure TFsp_district_form_add.FormShow(Sender: TObject);
begin
 FullNameEdit.SetFocus;
end;

procedure TFsp_district_form_add.FullNameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key  = #13 then OKButton.SetFocus;
end;

end.
