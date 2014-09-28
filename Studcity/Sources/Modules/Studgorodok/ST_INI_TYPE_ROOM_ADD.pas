//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник типов комнат - добавление типа комнаты                   *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit ST_INI_TYPE_ROOM_ADD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxLabel, cxControls,
  cxContainer, cxEdit, cxGroupBox, StdCtrls, cxButtons, St_Proc, st_ConstUnit,
  cxCurrencyEdit;

type
  TST_INI_TYPE_ROOM_ADD_Form = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    PeopleLabel: TcxLabel;
    PeopleEdit: TcxTextEdit;
    PlaceLabel: TcxLabel;
    Short_NameEdit: TcxTextEdit;
    ShortLabel: TcxLabel;
    PlaceEdit: TcxCurrencyEdit;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure Short_NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure PeopleEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
  end;

var
  ST_INI_TYPE_ROOM_ADD_Form: TST_INI_TYPE_ROOM_ADD_Form;

implementation
uses Unit_of_Utilits;
{$R *.dfm}

procedure TST_INI_TYPE_ROOM_ADD_Form.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex       :=    St_Proc.cnLanguageIndex;
 NameLabel.Caption    :=    st_ConstUnit.st_NameLable[PLanguageIndex];
 ShortLabel.Caption   :=    st_ConstUnit.st_Short[PLanguageIndex];
 PeopleLabel.Caption  :=    st_ConstUnit.st_MaxCountLivers[PLanguageIndex];
 PlaceLabel.Caption   :=    st_ConstUnit.st_SquareM2[PLanguageIndex];

 //названия кнопок
 OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];
end;

procedure TST_INI_TYPE_ROOM_ADD_Form.OKButtonClick(Sender: TObject);
begin
  if NameEdit.Text='' then
   begin
    showmessage(pchar(st_ConstUnit.st_NeedNameRoom[PLanguageIndex]));      //'Необходимо ввести наименование типа комнаты'
    NameEdit.SetFocus;
    exit;
   end;

  if PeopleEdit.Text='' then
   begin
    showmessage(pchar(st_ConstUnit.st_NeedMaxCount[PLanguageIndex])); //'Необходимо ввести максимальное количество жителей'
    PeopleEdit.SetFocus;
    exit;
   end;

  if PlaceEdit.Text='' then
   begin
    showmessage(pchar(st_ConstUnit.st_NeedSquare[PLanguageIndex]));  // 'Необходимо ввести площадь комнаты'
    PlaceEdit.SetFocus;
    exit;
   end;

  if IntegerCheck(PeopleEdit.Text)=false then
   begin
    showmessage(pchar(st_ConstUnit.st_CountNotValid[PLanguageIndex]));   // 'Количество жителей введено неверно'
    PeopleEdit.SetFocus;
    exit;
   end;

  ModalResult := mrOk;
end;

procedure TST_INI_TYPE_ROOM_ADD_Form.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TST_INI_TYPE_ROOM_ADD_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TST_INI_TYPE_ROOM_ADD_Form.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Short_NameEdit.SetFocus;
end;

procedure TST_INI_TYPE_ROOM_ADD_Form.Short_NameEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then PeopleEdit.SetFocus;
end;

procedure TST_INI_TYPE_ROOM_ADD_Form.PeopleEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then PlaceEdit.SetFocus;
end;

procedure TST_INI_TYPE_ROOM_ADD_Form.FormShow(Sender: TObject);
begin
NameEdit.SetFocus;
end;

procedure TST_INI_TYPE_ROOM_ADD_Form.FormCreate(Sender: TObject);
begin
FormIniLanguage();
end;

end.
