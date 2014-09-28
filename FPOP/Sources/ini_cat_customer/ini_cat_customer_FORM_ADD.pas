unit ini_cat_customer_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxButtons, ActnList;

type
  TFini_cat_customer_ADD = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    NameEdit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    ActionList: TActionList;
    ActionExit: TAction;
    procedure CancelButtonClick(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
  public
    MResult : string;
  end;

var
  Fini_cat_customer_ADD: TFini_cat_customer_ADD;

implementation
uses tagBaseTypes;
{$R *.DFM}

procedure TFini_cat_customer_ADD.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TFini_cat_customer_ADD.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end; 
end;

procedure TFini_cat_customer_ADD.OKButtonClick(Sender: TObject);
begin
 if NameEdit.Text = '' then begin
  MessageDlg('Помилка', EMPTY_WARNING, mtWarning, [mbOK]);
  exit;
 end;
 mResult := 'ok';
 Close;
end;

procedure TFini_cat_customer_ADD.FormCreate(Sender: TObject);
begin
 mResult := 'cancel';
end;

procedure TFini_cat_customer_ADD.FormShow(Sender: TObject);
begin
 NameEdit.SetFocus;
end;

procedure TFini_cat_customer_ADD.ActionExitExecute(Sender: TObject);
begin
 CancelButtonClick(Sender);
end;

end.
