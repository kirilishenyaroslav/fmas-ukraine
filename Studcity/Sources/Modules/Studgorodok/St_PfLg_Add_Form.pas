//***********************************************************************
//* Проект "Студгородок"                                                *
//* Форма регистрации проживающих - изменение данных по льготам         *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_PfLg_Add_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, DB, FIBDataSet, pFIBDataSet, cxTextEdit,
  cxButtonEdit, StdCtrls, cxButtons, cxLabel, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxGroupBox,  St_Proc,
  st_ConstUnit, DataModule1_Unit, st_common_types, st_common_loader;

type
  TPfLg_Add_Form = class(TForm)
    Label16: TLabel;
    cxGroupBox1: TcxGroupBox;
    DateBegEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    DateEndEdit: TcxDateEdit;
    cxLabel2: TcxLabel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    TypeEdit: TcxButtonEdit;
    ReadDataSet: TpFIBDataSet;
    Full_LG_Label: TLabel;
    cxGroupBox2: TcxGroupBox;
    DataPrikaza_Edit: TcxDateEdit;
    DataPrikaza_Label: TcxLabel;
    NomerPrikaza_Label: TcxLabel;
    NomerPrikaza_Edit: TcxTextEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TypeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure TypeEditExit(Sender: TObject);
    procedure TypeEditKeyPress(Sender: TObject; var Key: Char);
    procedure DataPrikaza_EditKeyPress(Sender: TObject; var Key: Char);
    procedure NomerPrikaza_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    ID_LG: integer;
    fullname: string;
    is_admin : Boolean;
  end;

var
  PfLg_Add_Form: TPfLg_Add_Form;

implementation
uses Unit_of_Utilits, St_Pfio_Add_Form;
{$R *.dfm}
procedure TPfLg_Add_Form.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 OkButton.Caption :=            st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=        st_ConstUnit.st_Cancel[PLanguageIndex];
 //Номер льготы
 Label16.Caption :=             st_ConstUnit.st_LgNomer[PLanguageIndex];
 //Дата приказа
 DataPrikaza_Label.Caption :=   st_ConstUnit.st_PikazDate[PLanguageIndex];
 //Номер приказа
 NomerPrikaza_Label.Caption :=  st_ConstUnit.st_PrikazNomer[PLanguageIndex];
 //С
 cxLabel1.Caption :=            st_ConstUnit.st_Z[PLanguageIndex];
 //По
 cxLabel2.Caption :=            st_ConstUnit.st_Po[PLanguageIndex];
end;

procedure TPfLg_Add_Form.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TPfLg_Add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TPfLg_Add_Form.TypeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  aParameter : TstSimpleParams;
  res : Variant;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  aParameter.Formstyle       := fsNormal;
  aParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  res := RunFunctionFromPackage(aParameter, 'Studcity\st_sp_lgots.bpl', 'ShowSpLgota');

  If VarArrayDimCount(res) <> 0 then
   begin
    TypeEdit.Text := res[2];
    ID_Lg         := res[0];
    fullname      := res[1];
    Full_LG_Label.Caption := fullname ;
   end;

  aParameter.free;
end;

procedure TPfLg_Add_Form.OkButtonClick(Sender: TObject);
var
  i: integer;
  AllowDateCategoryBeg, AllowDateCategoryEnd : boolean;
begin
  if TypeEdit.Text='' then
   begin
    ShowMessage('Необходимо ввести тип льготы');
    TypeEdit.SetFocus;
    exit;
   end;

  if DateBegEdit.Text='' then
   begin
    ShowMessage('Необходимо ввести дату начала');
    DateBegEdit.SetFocus;
    exit;
   end;

  if DateEndEdit.Text='' then
   begin
    ShowMessage('Необходимо ввести дату окончания');
    DateEndEdit.SetFocus;
    exit;
   end;

   if DateBegEdit.Date > DateEndEdit.Date then
    begin
     ShowMessage('Дата начала должна быть меньше даты окончания');
     DateEndEdit.SetFocus;
     exit;
    end;

  //проверка льгот на предмет вхождения дат по-умлчанию в даты по льготам
  AllowDateCategoryBeg:=false;
  AllowDateCategoryEnd := false;

  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.sqls.SelectSQL.Text := 'select * from ST_SP_LGOT_SUM_SELECT(:id_lgot)';
  ReadDataSet.ParamByName('id_lgot').AsInt64 := ID_LG;
  ReadDataSet.Open;
  If ReadDataSet.RecordCount <> 0 then
   begin
    AllowDateCategoryBeg:=true;
    AllowDateCategoryEnd:=true;
   End; 
  ReadDataSet.Close;

  if (not AllowDateCategoryBeg) or (not AllowDateCategoryEnd ) then
   begin
    ShowMessage('Ошибка! Срок действия данной льготы не совпадает с введенными датами начала и окончания льготы.');
    TypeEdit.SetFocus;
    exit;
   end;

  //Registration_Form_Add.Redact:=true;
  Registration_Form_Add.Redact_Lgot:=true;

  ModalResult := mrOk;
end;

procedure TPfLg_Add_Form.DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then DateEndEdit.SetFocus;
end;

procedure TPfLg_Add_Form.DateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then DataPrikaza_Edit.SetFocus;
end;

procedure TPfLg_Add_Form.FormShow(Sender: TObject);
begin
TypeEdit.SetFocus;
end;

procedure TPfLg_Add_Form.TypeEditExit(Sender: TObject);
begin
  Full_LG_Label.Caption:='';

  If TypeEdit.Text='' then exit;

  with PfLg_Add_Form do
   begin
    If IntegerCheck(TypeEdit.Text) = false then
     begin
      ShowMessage('Номер льготы введен неверно!');
      TypeEdit.SetFocus;
      exit;
     end;

    ReadDataSet.Close;
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select * from ST_DT_PFIO_NLGOTA_EXITCONTROL( '+ TypeEdit.Text+ ')';
    ReadDataSet.Open;
    if ReadDataSet['N_LGOTA_CORRECT']=0 then
     begin
      ShowMessage('Номер льготы введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером льготы не существует.');
      TypeEdit.SetFocus;
      ReadDataSet.Close;
      exit;
     end
    else
     begin
      Full_LG_Label.Caption:= ReadDataSet['Short_name'] ;
      fullname:= ReadDataSet['Short_name'] ;
      ID_Lg:= ReadDataSet['KOD_LG'];
     end;
    ReadDataSet.Close;
   end;
end;

procedure TPfLg_Add_Form.TypeEditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then  DateBegEdit.SetFocus;
end;

procedure TPfLg_Add_Form.DataPrikaza_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then NomerPrikaza_Edit.SetFocus;
end;

procedure TPfLg_Add_Form.NomerPrikaza_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then OkButton.SetFocus;
end;

procedure TPfLg_Add_Form.FormCreate(Sender: TObject);
begin
FormIniLanguage();
end;

end.
