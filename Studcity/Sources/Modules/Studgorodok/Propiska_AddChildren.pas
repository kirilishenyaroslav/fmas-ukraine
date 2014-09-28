unit Propiska_AddChildren;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit,
  cxMaskEdit, cxCalendar, cxContainer, cxEdit, cxTextEdit, cxControls,
  cxGroupBox;

type
  Tfrm_Propiska_AddChildren = class(TForm)
    cxGroupBox1: TcxGroupBox;
    fam_Label: TLabel;
    prp_FamiliaChild_Edit: TcxTextEdit;
    Name_Label: TLabel;
    prp_NameChild_Edit: TcxTextEdit;
    Otch_Label: TLabel;
    prp_OtchChild_Edit: TcxTextEdit;
    prp_ChildBorn_Date: TcxDateEdit;
    DateBorn_Label: TLabel;
    Sex_Label: TLabel;
    prp_PolChild_ComboBox: TcxComboBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure prp_FamiliaChild_EditKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_NameChild_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_OtchChild_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_ChildBorn_DateKeyPress(Sender: TObject; var Key: Char);
    procedure prp_PolChild_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Propiska_AddChildren: Tfrm_Propiska_AddChildren;

implementation

{$R *.dfm}

procedure Tfrm_Propiska_AddChildren.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_Propiska_AddChildren.prp_FamiliaChild_EditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key=#13 then prp_NameChild_Edit.SetFocus;
end;

procedure Tfrm_Propiska_AddChildren.prp_NameChild_EditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key=#13 then prp_OtchChild_Edit.SetFocus;
end;

procedure Tfrm_Propiska_AddChildren.prp_OtchChild_EditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key=#13 then prp_ChildBorn_Date.SetFocus;
end;

procedure Tfrm_Propiska_AddChildren.prp_ChildBorn_DateKeyPress(
  Sender: TObject; var Key: Char);
begin
if key=#13 then prp_PolChild_ComboBox.SetFocus;
end;

procedure Tfrm_Propiska_AddChildren.prp_PolChild_ComboBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key=#13 then OkButton.SetFocus;
end;

procedure Tfrm_Propiska_AddChildren.FormShow(Sender: TObject);
begin
prp_FamiliaChild_Edit.SetFocus;
end;

procedure Tfrm_Propiska_AddChildren.OkButtonClick(Sender: TObject);
begin
//Основные данные   - стандартные проверки на заполнение и совпадение типов данных

if prp_FamiliaChild_Edit.Text ='' then
begin
ShowMessage('Необходимо ввести фамилию!');
prp_FamiliaChild_Edit.SetFocus;
exit;
end;
if prp_NameChild_Edit.Text ='' then
begin
ShowMessage('Необходимо ввести имя!');
prp_NameChild_Edit.SetFocus;
exit;
end;
if prp_OtchChild_Edit.Text ='' then
begin
ShowMessage('Необходимо ввести отчество!');
prp_OtchChild_Edit.SetFocus;
exit;
end;
if prp_ChildBorn_Date.Text = '' then begin
  ShowMessage('Необходимо ввести дату рождения!');
  prp_ChildBorn_Date.SetFocus;
  exit;
 end;

 ModalResult:=mrOk;
end;

end.
