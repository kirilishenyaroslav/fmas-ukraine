unit uSp_post;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, cxLabel, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxGroupBox, StdCtrls, cxButtons, st_ConstUnit;

type
  TfrmType_Kat_AE = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    ShortEdit: TcxTextEdit;
    ShortNameLabel: TcxLabel;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    MonthOplCheck: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure ShortEditKeyPress(Sender: TObject; var Key: Char);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
   procedure FormIniLanguage();
  public
    PLanguageIndex :byte;
  end;

var
  frmType_Kat_AE: TfrmType_Kat_AE;

implementation

{$R *.dfm}

procedure TfrmType_Kat_AE.FormIniLanguage();
begin
  //названия кнопок
  OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
  CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];

  NameLabel.Caption :=        st_ConstUnit.st_NameLable[PLanguageIndex];

  ShortNameLabel.Caption :=            st_ConstUnit.st_ShortLable[PLanguageIndex];
  MonthOplCheck.Properties.Caption :=  st_ConstUnit.st_ByMonth[PLanguageIndex];
end;

procedure TfrmType_Kat_AE.FormShow(Sender: TObject);
begin
  FormIniLanguage();
  NameEdit.SetFocus;
end;

procedure TfrmType_Kat_AE.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then ShortEdit.SetFocus;
end;

procedure TfrmType_Kat_AE.ShortEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then OkButton.SetFocus;
end;

procedure TfrmType_Kat_AE.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmType_Kat_AE.OKButtonClick(Sender: TObject);
begin
  if NameEdit.Text = '' then
   begin
    ShowMessage(PChar(st_ConstUnit.st_mess_FullName_need[PLanguageIndex]));
    NameEdit.SetFocus;
    exit;
   end;

  if ShortEdit.Text = '' then
   begin
    ShowMessage(PChar(st_ConstUnit.st_mess_ShortName_need[PLanguageIndex]));
    ShortEdit.SetFocus;
    exit;
   end;

  ModalResult := mrOK;
end;

end.
