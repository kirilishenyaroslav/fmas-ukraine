unit St_sp_Category_Class_Form_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxLabel, cxControls,
  cxContainer, cxEdit, cxGroupBox, StdCtrls, cxButtons, st_ConstUnit;

type
  TClassCategoryFormAdd = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    PeopleLabel: TcxLabel;
    PeopleEdit: TcxTextEdit;
    PlaceLabel: TcxLabel;
    PlaceEdit: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  ClassCategoryFormAdd: TClassCategoryFormAdd;

implementation

{$R *.dfm}

procedure TClassCategoryFormAdd.FormIniLanguage();
begin
 //названия кнопок
 OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];

 NameLabel.Caption :=        st_ConstUnit.st_NameLable[PLanguageIndex];
 PeopleLabel.Caption :=      st_ConstUnit.st_KolvoLudey[PLanguageIndex];
 PlaceLabel.Caption :=       st_ConstUnit.st_KolvoMest[PLanguageIndex];
end;

function IntegerCheck(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
  if not (k in ['0'..'9',#8, #13]) then k := #0;
  if k = #0 then exit;
 end;
 Result := true;
end;

function FloatCheck(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
 if not (k in ['0'..'9',#8, #13, DecimalSeparator]) then k := #0;
  if k = #0 then exit;
 end;
 i := pos(DecimalSeparator, s);
 if i <> 0 then if Copy(s, i + 1, Length(s) - i) = '' then exit;
 if pos(DecimalSeparator, Copy(s, i + 1, Length(s) - i)) <> 0 then exit;
 Result := true;
end;

procedure TClassCategoryFormAdd.FormShow(Sender: TObject);
begin
FormIniLanguage();
NameEdit.SetFocus;
end;

procedure TClassCategoryFormAdd.CancelButtonClick(Sender: TObject);
begin
Close;
end;

procedure TClassCategoryFormAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TClassCategoryFormAdd.OKButtonClick(Sender: TObject);
begin
 if NameEdit.Text = '' then begin
  ShowMessage(PChar(st_ConstUnit.st_mess_FullName_need[PLanguageIndex]));
  NameEdit.SetFocus;
  exit;
 end;
 if not IntegerCheck(PeopleEdit.Text) then begin
  ShowMessage(PChar(st_ConstUnit.st_CountNotValid[PLanguageIndex]));
  PeopleEdit.SetFocus;
  exit;
 end;
 if not FloatCheck(PlaceEdit.Text) then begin
  ShowMessage(PChar(st_ConstUnit.st_MestNotValid[PLanguageIndex]));
  PlaceEdit.Setfocus;
  exit;
 end;
 ModalResult := mrOK;

end;

procedure TClassCategoryFormAdd.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then  PeopleEdit.SetFocus;
end;

procedure TClassCategoryFormAdd.PeopleEditKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then  PlaceEdit.SetFocus;
end;

procedure TClassCategoryFormAdd.PlaceEditKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then  OkButton.SetFocus;
end;

end.
