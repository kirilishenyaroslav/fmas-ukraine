unit sp_branch_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxButtons, ExtCtrls;

type
  TFsp_branch_ADD = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    NameEdit: TcxTextEdit;
    KodEdit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Bevel1: TBevel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure KodEditKeyPress(Sender: TObject; var Key: Char);
  public
    MResult : string;
  end;

var
  Fsp_branch_ADD: TFsp_branch_ADD;

implementation
uses BaseTypes;
{$R *.DFM}

procedure TFsp_branch_ADD.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TFsp_branch_ADD.OKButtonClick(Sender: TObject);
begin
 if (NameEdit.Text = '') then begin
  agShowMessage('Необхідно ввести назву.');
  exit
 end;
 mResult := 'ok';
 Close;
end;

procedure TFsp_branch_ADD.FormCreate(Sender: TObject);
begin
 mResult := 'cancel';
end;

procedure TFsp_branch_ADD.FormShow(Sender: TObject);
begin
 NameEdit.SetFocus;
end;

procedure TFsp_branch_ADD.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then KodEdit.SetFocus;
end;

procedure TFsp_branch_ADD.KodEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then OkButton.SetFocus;
end;

end.
