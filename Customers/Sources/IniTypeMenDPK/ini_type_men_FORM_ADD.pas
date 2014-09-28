unit ini_type_men_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxLookAndFeelPainters, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxCheckBox, Resources_unitb, ExtCtrls;

type
  TFini_type_men_ADD = class(TForm)
    LabelTitle: TLabel;
    NameEdit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    MainAccountCheck: TcxCheckBox;
    ChiefCheck: TcxCheckBox;
    Bevel1: TBevel;
    procedure CancelButtonClick(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    MResult : string;
  end;



implementation

{$R *.DFM}

procedure TFini_type_men_ADD.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TFini_type_men_ADD.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then MainAccountCheck.SetFocus;
end;

procedure TFini_type_men_ADD.OKButtonClick(Sender: TObject);
begin
 if NameEdit.Text = '' then begin

  exit;
 end;
 mResult := 'ok';
 Close;
end;

procedure TFini_type_men_ADD.FormCreate(Sender: TObject);
begin
 mResult := 'cancel';
{ LabelTitle.Caption:=CUSTOMER_TITLE;
 MainAccountCheck.Properties.Caption:=CUSTOMER_MBUHG_CONST;
 ChiefCheck.Properties.Caption:=CUSTOMER_BOSS_CONST;
 OKButton.Caption:=CUSTOMER_OK_BUT_CONST;
 CancelButton.Caption:=CUSTOMER_CANCEL_BUT_CONST;}

end;

procedure TFini_type_men_ADD.FormShow(Sender: TObject);
begin
 NameEdit.SetFocus;
end;

end.
