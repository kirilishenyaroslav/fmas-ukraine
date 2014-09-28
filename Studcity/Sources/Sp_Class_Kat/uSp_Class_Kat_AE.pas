unit uSp_Class_Kat_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxLabel, cxControls,
  cxContainer, cxEdit, cxGroupBox, StdCtrls, cxButtons, st_ConstUnit,
  st_common_funcs, cxCurrencyEdit;

type
  TfrmClass_Kat_AE = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    PeopleLabel: TcxLabel;
    PlaceLabel: TcxLabel;
    PeopleEdit: TcxCurrencyEdit;
    PlaceEdit: TcxCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure PeopleEditKeyPress(Sender: TObject; var Key: Char);
    procedure PlaceEditKeyPress(Sender: TObject; var Key: Char);
  private
   procedure FormIniLanguage();
  public
    PLanguageIndex :byte;
  end;

var
  frmClass_Kat_AE: TfrmClass_Kat_AE;

implementation

{$R *.dfm}

procedure TfrmClass_Kat_AE.FormIniLanguage();
begin
 //названия кнопок
 OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];

 NameLabel.Caption :=        st_ConstUnit.st_NameLable[PLanguageIndex];
 PeopleLabel.Caption :=      st_ConstUnit.st_KolvoLudey[PLanguageIndex];
 PlaceLabel.Caption :=       st_ConstUnit.st_KolvoMest[PLanguageIndex];
end;

procedure TfrmClass_Kat_AE.FormShow(Sender: TObject);
begin
  FormIniLanguage();
  NameEdit.SetFocus;
end;

procedure TfrmClass_Kat_AE.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmClass_Kat_AE.OKButtonClick(Sender: TObject);
begin
  if NameEdit.Text = '' then
   begin
    ShowMessage(PChar(st_ConstUnit.st_mess_FullName_need[PLanguageIndex]));
    NameEdit.SetFocus;
    exit;
   end;

  if not IntegerCheck(PeopleEdit.Text) then
   begin
    ShowMessage(PChar(st_ConstUnit.st_CountNotValid[PLanguageIndex]));
    PeopleEdit.SetFocus;
    exit;
   end;

  if not FloatCheck(PlaceEdit.Text) then
   begin
    ShowMessage(PChar(st_ConstUnit.st_MestNotValid[PLanguageIndex]));
    PlaceEdit.Setfocus;
    exit;
   end;

  ModalResult := mrOK;
end;

procedure TfrmClass_Kat_AE.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then  PeopleEdit.SetFocus;
end;

procedure TfrmClass_Kat_AE.PeopleEditKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then  PlaceEdit.SetFocus;
end;

procedure TfrmClass_Kat_AE.PlaceEditKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then  OkButton.SetFocus;
end;

end.
