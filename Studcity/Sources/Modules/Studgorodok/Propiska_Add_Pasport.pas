unit Propiska_Add_Pasport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit,
  cxMaskEdit, cxCalendar, cxContainer, cxEdit, cxTextEdit, cxControls,
  cxGroupBox, Unit_of_Utilits;

type
  Tprp_frm_Pass_Add = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Fam_Label: TLabel;
    Name_Label: TLabel;
    Otch_Label: TLabel;
    Kogda_Label: TLabel;
    Type_Label: TLabel;
    prp_FamiliaPasp_Edit: TcxTextEdit;
    prp_NamePasp_Edit: TcxTextEdit;
    prp_OtchPasp_Edit: TcxTextEdit;
    prp_DateVidan: TcxDateEdit;
    prp_TypeUdost_ComboBox: TcxComboBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    prp_Vidan_Edit: TcxTextEdit;
    Kem_Label: TLabel;
    Seriya_Label: TLabel;
    prp_Seriya_Edit: TcxTextEdit;
    Nomer_Label: TLabel;
    prp_Nomer_Edit: TcxTextEdit;
    Osnovanie_Label: TLabel;
    prp_Osnovanie_Edit: TcxTextEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure prp_TypeUdost_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure prp_FamiliaPasp_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_NamePasp_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_OtchPasp_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_Seriya_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_Nomer_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_Vidan_EditKeyPress(Sender: TObject; var Key: Char);
    procedure prp_DateVidanKeyPress(Sender: TObject; var Key: Char);
    procedure prp_Osnovanie_EditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  prp_frm_Pass_Add: Tprp_frm_Pass_Add;

implementation

{$R *.dfm}

procedure Tprp_frm_Pass_Add.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure Tprp_frm_Pass_Add.OkButtonClick(Sender: TObject);
begin
//Основные данные   - стандартные проверки на заполнение и совпадение типов данных

if prp_FamiliaPasp_Edit.Text ='' then
begin
ShowMessage('Необходимо ввести фамилию!');
prp_FamiliaPasp_Edit.SetFocus;
exit;
end;
if prp_NamePasp_Edit.Text ='' then
begin
ShowMessage('Необходимо ввести имя!');
prp_NamePasp_Edit.SetFocus;
exit;
end;
if prp_OtchPasp_Edit.Text ='' then
begin
ShowMessage('Необходимо ввести отчество!');
prp_OtchPasp_Edit.SetFocus;
exit;
end;

if prp_Seriya_Edit.Text = '' then begin
  ShowMessage('Необходимо ввести серию удостоверения !');
  prp_Seriya_Edit.SetFocus;
  exit;
 end;
 if prp_Nomer_Edit.Text = '' then begin
  ShowMessage('Необходимо ввести номер удостоверения !');
  prp_Nomer_Edit.SetFocus;
  exit;
 end;

if IntegerCheck(prp_Nomer_Edit.Text) = false
then
begin
  ShowMessage('Номер удостоверения введен неверно!');
  prp_Nomer_Edit.SetFocus;
  exit;
end;

if prp_DateVidan.Text = '' then begin
  ShowMessage('Необходимо ввести дату выдачи!');
  prp_DateVidan.SetFocus;
  exit;
 end;

ModalResult:=mrOk;
end;

procedure Tprp_frm_Pass_Add.FormShow(Sender: TObject);
begin
prp_FamiliaPasp_Edit.SetFocus;
end;

procedure Tprp_frm_Pass_Add.prp_TypeUdost_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if  key = #13 then prp_FamiliaPasp_Edit.SetFocus;
end;

procedure Tprp_frm_Pass_Add.prp_FamiliaPasp_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if  key = #13 then prp_NamePasp_Edit.SetFocus;
end;

procedure Tprp_frm_Pass_Add.prp_NamePasp_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if  key = #13 then prp_OtchPasp_Edit.SetFocus;
end;

procedure Tprp_frm_Pass_Add.prp_OtchPasp_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if  key = #13 then prp_Seriya_Edit.SetFocus;
end;

procedure Tprp_frm_Pass_Add.prp_Seriya_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if  key = #13 then prp_Nomer_Edit.SetFocus;
end;

procedure Tprp_frm_Pass_Add.prp_Nomer_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if  key = #13 then prp_Vidan_Edit.SetFocus;
end;

procedure Tprp_frm_Pass_Add.prp_Vidan_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if  key = #13 then prp_DateVidan.SetFocus;
end;

procedure Tprp_frm_Pass_Add.prp_DateVidanKeyPress(Sender: TObject;
  var Key: Char);
begin
if  key = #13 then prp_Osnovanie_Edit.SetFocus;
end;

procedure Tprp_frm_Pass_Add.prp_Osnovanie_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if  key = #13 then OkButton.SetFocus;
end;

end.
