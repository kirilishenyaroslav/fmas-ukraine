unit sp_ist_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxCheckBox,
  cxLookAndFeelPainters, cxButtons, ExtCtrls;

type
  TFsp_ist_form_add = class(TForm)
    Label1: TLabel;
    FullNameEdit: TcxTextEdit;
    OkButton2: TcxButton;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Bevel1: TBevel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OkButton2Click(Sender: TObject);
    procedure FullNameEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation
uses BaseTypes;
{$R *.DFM}

procedure TFsp_ist_form_add.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFsp_ist_form_add.OKButtonClick(Sender: TObject);
begin
 if FullNameEdit.Text = '' then begin
  agShowMessage('Необхідно ввести назву.');
  exit
 end;
 ModalResult := mrOK;
end;

procedure TFsp_ist_form_add.FormShow(Sender: TObject);
begin
 FullNameEdit.SetFocus;
end;

procedure TFsp_ist_form_add.OkButton2Click(Sender: TObject);
begin
 if FullNameEdit.Text = '' then begin
  agShowMessage('Необхідно ввести назву.');
  exit
 end;
 ModalResult := mrYes;
end;

procedure TFsp_ist_form_add.FullNameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then OKButton.SetFocus;
end;

end.
