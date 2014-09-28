unit St_sp_Category_Type_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, cxLabel, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxGroupBox, StdCtrls, cxButtons, st_ConstUnit;

type
  TTypeCategoryFormAdd = class(TForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
  private
   procedure FormIniLanguage();
  public
    PLanguageIndex :byte;
  end;

var
  TypeCategoryFormAdd: TTypeCategoryFormAdd;

implementation

{$R *.dfm}

procedure TTypeCategoryFormAdd.FormIniLanguage();
begin
 //названия кнопок
 OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];

 NameLabel.Caption :=        st_ConstUnit.st_NameLable[PLanguageIndex];

 ShortNameLabel.Caption :=            st_ConstUnit.st_ShortLable[PLanguageIndex];
 MonthOplCheck.Properties.Caption :=  st_ConstUnit.st_ByMonth[PLanguageIndex];
end;

procedure TTypeCategoryFormAdd.FormShow(Sender: TObject);
begin
FormIniLanguage();
NameEdit.SetFocus;
end;

procedure TTypeCategoryFormAdd.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then ShortEdit.SetFocus;
end;

procedure TTypeCategoryFormAdd.ShortEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then OkButton.SetFocus;
end;

procedure TTypeCategoryFormAdd.CancelButtonClick(Sender: TObject);
begin
Close;
end;

procedure TTypeCategoryFormAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TTypeCategoryFormAdd.OKButtonClick(Sender: TObject);
begin
 if NameEdit.Text = '' then begin
  ShowMessage(PChar(st_ConstUnit.st_mess_FullName_need[PLanguageIndex]));
  NameEdit.SetFocus;
  exit;
 end;
 ModalResult := mrOK;
 if ShortEdit.Text = '' then begin
   ShowMessage(PChar(st_ConstUnit.st_mess_ShortName_need[PLanguageIndex]));
  ShortEdit.SetFocus;
  exit;
 end;
end;

end.
