unit uSp_post_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, cxLabel, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxGroupBox, StdCtrls, cxButtons, st_ConstUnit;

type
  TfrmPost_AE = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure ShortEditKeyPress(Sender: TObject; var Key: Char);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
   procedure FormIniLanguage();
  public
    PLanguageIndex :byte;
  end;

var
  frmPost_AE: TfrmPost_AE;

implementation

{$R *.dfm}

procedure TfrmPost_AE.FormIniLanguage();
begin
  //названия кнопок
  OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
  CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];

  NameLabel.Caption :=        st_ConstUnit.st_NameLable[PLanguageIndex];

end;

procedure TfrmPost_AE.FormShow(Sender: TObject);
begin
  FormIniLanguage();
  NameEdit.SetFocus;
end;

procedure TfrmPost_AE.ShortEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then OkButton.SetFocus;
end;

procedure TfrmPost_AE.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPost_AE.OKButtonClick(Sender: TObject);
begin
  if NameEdit.Text = '' then
   begin
    ShowMessage(PChar(st_ConstUnit.st_mess_FullName_need[PLanguageIndex]));
    NameEdit.SetFocus;
    exit;
   end;


  ModalResult := mrOK;
end;

end.
