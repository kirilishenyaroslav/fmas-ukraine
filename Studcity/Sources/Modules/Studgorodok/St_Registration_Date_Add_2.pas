//***********************************************************************
//* Проект "Студгородок"                                                *
//* Форма регистрации проживающих - изменение данных по категориям      *
//* оплаты за проживание                                                *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_Registration_Date_Add_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, StdCtrls, cxLookAndFeelPainters, cxButtons, cxLabel,
  cxDropDownEdit, cxCalendar, cxGroupBox, DB, FIBDataSet, pFIBDataSet,
  St_Proc, st_ConstUnit, st_common_types, st_common_loader;

type
  TRegistration_Date_Add_Form_2 = class(TForm)
  
    Label22: TLabel;
    Full_Cat_Label: TLabel;
    cxGroupBox1: TcxGroupBox;
    DateBegEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    DateEndEdit: TcxDateEdit;
    cxLabel2: TcxLabel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    TypeRoom_Selecter_DataSet: TpFIBDataSet;
    Category_ButtonEdit: TcxButtonEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Category_ButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Category_ButtonEdit2Exit(Sender: TObject);
    procedure Category_ButtonEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    ID_Category: integer;
    Short_Name_Category: string;
    is_admin : Boolean;
  end;

var
  Registration_Date_Add_Form_2: TRegistration_Date_Add_Form_2;

implementation
uses Unit_of_Utilits, St_Pfio_Add_Form, DataModule1_Unit;
{$R *.dfm}

procedure TRegistration_Date_Add_Form_2.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 OkButton.Caption :=             st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=         st_ConstUnit.st_Cancel[PLanguageIndex];
 // Код категории
 Label22.Caption :=             st_ConstUnit.st_CategoryCode[PLanguageIndex];
 //С
 cxLabel1.Caption :=             st_ConstUnit.st_Z[PLanguageIndex];
 //По
 cxLabel2.Caption :=             st_ConstUnit.st_Po[PLanguageIndex];
end;

procedure TRegistration_Date_Add_Form_2.OkButtonClick(Sender: TObject);
var AllowDateCategoryBeg, AllowDateCategoryEnd : boolean;
    i: integer;
begin
if Category_ButtonEdit.Text='' then begin
ShowMessage('Необходимо ввести категорию');
  Category_ButtonEdit.setfocus;
  exit;
end;
if DateBegEdit.Text='' then
begin
ShowMessage('Необходимо ввести дату начала');
  DateBegEdit.setfocus;
  exit;
end;
if DateEndEdit.Text='' then
begin
ShowMessage('Необходимо ввести дату окончания');
  DateEndEdit.setfocus;
  exit;
end;
if DateBegEdit.Date >= DateEndEdit.Date then begin
  ShowMessage('Дата начала должна быть меньше даты окончания.');
  DateEndEdit.setfocus;
  exit;
 end;

if IntegerCheck(Category_ButtonEdit.Text)=false then
begin
ShowMessage('Код категории введен неверно!');
Category_ButtonEdit.SetFocus;
exit;
end;
// глобальная проверка предмет совпадения введенных данных
//с записями в базе данных посредством хранимой процедуры
TypeRoom_Selecter_DataSet.Close;
TypeRoom_Selecter_DataSet.SelectSQL.Clear;
TypeRoom_Selecter_DataSet.SelectSQL.Text:='select * from ST_DT_PFIO_CATEGORY_CONTROL ( '+Category_ButtonEdit.Text+ ')';
TypeRoom_Selecter_DataSet.Open;
if  TypeRoom_Selecter_DataSet['NOMER_CORRECT']=0 then  begin
ShowMessage('Номер категории введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером категории не существует.');
Category_ButtonEdit.SetFocus;
TypeRoom_Selecter_DataSet.Close;
exit;
end;
ID_Category:= TypeRoom_Selecter_DataSet['ID_KATEGORIYA'] ;
Short_Name_Category:=TypeRoom_Selecter_DataSet['SHORT_NAME'] ;
TypeRoom_Selecter_DataSet.Close;

// проверка категории на предмет вхождения дат по-умлчанию в даты по категориям
AllowDateCategoryBeg:=false;
AllowDateCategoryEnd := false;
TypeRoom_Selecter_DataSet.SelectSQL.Text := 'select * from ST_SP_KAT_SUM_SELECT(' + IntToStr(ID_Category) + ')';
TypeRoom_Selecter_DataSet.Open;
TypeRoom_Selecter_DataSet.FetchAll;
if TypeRoom_Selecter_DataSet.RecordCount <> 0 then
 for i := 0 to TypeRoom_Selecter_DataSet.RecordCount-1 do begin
  if (DateBegEdit.Date >= TypeRoom_Selecter_DataSet['BEG_DATE']) then AllowDateCategoryBeg:=true;
  if (DateEndEdit.Date <= TypeRoom_Selecter_DataSet['END_DATE']) then AllowDateCategoryEnd:=true;
  TypeRoom_Selecter_DataSet.Next;
  end;
  TypeRoom_Selecter_DataSet.Close;
if ((AllowDateCategoryBeg=false) or (AllowDateCategoryEnd=false )) then begin
ShowMessage('Ошибка! Срок действия данной категории не совпадает с введенными датами начала и окончания категории.');
Category_ButtonEdit.SetFocus;
TypeRoom_Selecter_DataSet.Close;
exit;
end;

//Registration_Form_Add.Redact:=true;
Registration_Form_Add.Redact_Category:=true;

ModalResult:=mrOk;
end;

procedure TRegistration_Date_Add_Form_2.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TRegistration_Date_Add_Form_2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TRegistration_Date_Add_Form_2.Category_ButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  aParameter : TstSimpleParams;
  res : Variant;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  res := RunFunctionFromPackage(aParameter, 'Studcity\st_sp_kat_pay.bpl', 'ShowSPKat_Pay');

  If VarArrayDimCount(res) <> 0 then
   begin
    ID_Category := res[0];
    Category_ButtonEdit.Text := res[1];
    Full_Cat_Label.Caption := res[2];
   end;

  aParameter.Free;
end;

procedure TRegistration_Date_Add_Form_2.Category_ButtonEdit2Exit(
  Sender: TObject);
begin
Full_Cat_Label.Caption:='';
if Category_ButtonEdit.Text  = '' then exit;
with Registration_Date_Add_Form_2 do begin
if IntegerCheck(Category_ButtonEdit.Text)=false then
begin
ShowMessage('Код категории введен неверно!');
Category_ButtonEdit.SetFocus;
exit;
end;
TypeRoom_Selecter_DataSet.Close;
TypeRoom_Selecter_DataSet.SelectSQL.Clear;
TypeRoom_Selecter_DataSet.SelectSQL.Text:='select * from ST_DT_PFIO_CATEGORY_CONTROL ( '+ Category_ButtonEdit.Text+ ')';
TypeRoom_Selecter_DataSet.Open;
if  TypeRoom_Selecter_DataSet['NOMER_CORRECT']=0 then  begin
ShowMessage('Код категории введен неверно, т.к. записи в базе данных "Студгородок" с указанным кодом категории не существует.');
Category_ButtonEdit.SetFocus;
TypeRoom_Selecter_DataSet.Close;
exit;
end
else Full_Cat_Label.Caption:= TypeRoom_Selecter_DataSet['Short_name'] ;
TypeRoom_Selecter_DataSet.Close;
end;
end;

procedure TRegistration_Date_Add_Form_2.Category_ButtonEdit2KeyPress(
  Sender: TObject; var Key: Char);
begin
  if key=#13 then DateBegEdit.SetFocus;
end;

procedure TRegistration_Date_Add_Form_2.DateBegEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key=#13 then DateEndEdit.SetFocus;
end;

procedure TRegistration_Date_Add_Form_2.DateEndEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key=#13 then OkButton.SetFocus;
end;

procedure TRegistration_Date_Add_Form_2.FormCreate(Sender: TObject);
begin
FormIniLanguage();
end;

end.
