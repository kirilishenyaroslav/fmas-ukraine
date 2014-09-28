unit ini_type_region_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxLookAndFeelPainters, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, ExtCtrls;

type
  TFini_type_region_form_add = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    FullNameEdit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    ShortNameEdit: TcxTextEdit;
    Bevel1: TBevel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FullNameEditKeyPress(Sender: TObject; var Key: Char);
    procedure ShortNameEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

Uses BaseTypes;
{$R *.DFM}

procedure TFini_type_region_form_add.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFini_type_region_form_add.OKButtonClick(Sender: TObject);
begin
 if FullNameEdit.Text = '' then begin
  agShowMessage('Необходимо ввести полное название');
  exit;
 end;
 if ShortNameEdit.Text = '' then begin
  agShowMessage('Необходимо ввести сокращение');
  exit;
 end;
 ModalResult := mrOK;
end;

procedure TFini_type_region_form_add.FormShow(Sender: TObject);
begin
 FullNameEdit.SetFocus;
end;

procedure TFini_type_region_form_add.FullNameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key  = #13 then ShortNameEdit.SetFocus;
end;

procedure TFini_type_region_form_add.ShortNameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key  = #13 then OKButton.SetFocus;
end;

end.
