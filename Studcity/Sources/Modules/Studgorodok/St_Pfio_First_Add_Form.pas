//***********************************************************************
//* Проект "Студгородок"                                                *
//* Форма регистрации проживающих - добавление проживающего             *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_Pfio_First_Add_Form;

interface

uses                           
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, DB, FIBDataSet, pFIBDataSet,
  cxButtonEdit, StdCtrls, cxButtons, cxDropDownEdit, cxCheckBox,
  cxRadioGroup, cxMaskEdit, cxCalendar, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxGroupBox, St_Loader_Unit, uCommonSp, ActnList, St_Proc,
  st_ConstUnit, AllPeopleUnit, Buttons, st_common_types, st_common_loader,
  cxCurrencyEdit, st_Common_Messages, iBase, DataModule1_Unit, Unit_of_Utilits;

type
  TRegistration_Form_First_Add = class(TForm)
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Name_Edit: TcxTextEdit;
    Otch_Edit: TcxTextEdit;
    Inostranez_CheckBox: TcxCheckBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    TypeEdit: TcxButtonEdit;
    Nomer_Komnat_Edit: TcxTextEdit;
    cxGroupBox4: TcxGroupBox;
    Label22: TLabel;
    Full_Cat_Label: TLabel;
    Category_ButtonEdit: TcxButtonEdit;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    Label13: TLabel;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    Nomer_Dogovora: TcxTextEdit;
    Tabel_Edit: TcxTextEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    cxGroupBox6: TcxGroupBox;
    KursLabel: TLabel;
    Label10: TLabel;
    GroupLabel: TLabel;
    ShortName_Build_Label: TLabel;
    cxGroupBox7: TcxGroupBox;
    Propiska_CheckBox: TcxCheckBox;
    Propusk_CheckBox: TcxCheckBox;
    Pol_ComboBox: TcxComboBox;
    Type_Room_ComboBox: TcxComboBox;
    Kurs_ComboBox: TcxComboBox;
    DateBorn_Edit: TcxDateEdit;
    Build_Beg_DateEdit: TcxDateEdit;
    Build_End_DateEdit: TcxDateEdit;
    Faculty_ButtonEdit: TcxButtonEdit;
    Podrazdel_Label: TLabel;
    SpecLabel: TLabel;
    Spec_ComboBox: TcxComboBox;
    Group_ComboBox: TcxComboBox;
    ActionList1: TActionList;
    ApplyAction: TAction;
    Apostrof: TAction;
    Familia_Edit: TcxButtonEdit;
    EditFizLizo_Btn: TSpeedButton;
    ClearButton: TSpeedButton;
    Nalog_Edit: TcxCurrencyEdit;
    Dogovor_DateEdit: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OkButtonClick(Sender: TObject);
    procedure Familia_Edit_OLDExit(Sender: TObject);
    procedure Name_EditExit(Sender: TObject);
    procedure Otch_EditExit(Sender: TObject);
    procedure TypeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Category_ButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Otch_EditKeyPress(Sender: TObject; var Key: Char);
    procedure DateBorn_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Kurs_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Dogovor_DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure Nomer_DogovoraKeyPress(Sender: TObject; var Key: Char);
    procedure Tabel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Nalog_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Build_Beg_DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure Build_End_DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure Pol_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Nomer_Komnat_EditKeyPress(Sender: TObject; var Key: Char);
    procedure TypeEditKeyPress(Sender: TObject; var Key: Char);
    procedure Category_ButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure Type_Room_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure TypeEditExit(Sender: TObject);
    procedure Category_ButtonEditExit(Sender: TObject);
    procedure Nomer_Komnat_EditExit(Sender: TObject);
    procedure Faculty_ButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Faculty_ButtonEditExit(Sender: TObject);
    procedure GroupVisible (Mode : boolean);
    procedure Faculty_ButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure Group_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Spec_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Inostranez_CheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Propiska_CheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Propusk_CheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure ApplyActionExecute(Sender: TObject);
    procedure ApostrofExecute(Sender: TObject);
    procedure Familia_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Familia_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditFizLizo_BtnClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure Kurs_ComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Group_ComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Spec_ComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    PLanguageIndex: byte;
    DM : TDataModule1;
    procedure FormIniLanguage();
    procedure DisableControls(Disable: boolean);
    procedure AcademicYear;
  public
    ID_Type_Room_Select: integer;
    ID_Build: integer;
    ID_Category: integer;
    ComboRoom: string;
    Id_department, id_group, id_spec : int64;
    ID_MAN : int64;
    is_admin : Boolean;
    Fam_ukr, name_ukr, Otch_ukr : String;
    constructor Create(aOwner : TComponent; aHandle : TISC_DB_HANDLE); reintroduce;
  end;

var
  Registration_Form_First_Add: TRegistration_Form_First_Add;

implementation
//uses st_Registration_Date_Add;//, St_sp_Hostel_Form, St_sp_Hostel_Add_Room;
{$R *.dfm}

constructor TRegistration_Form_First_Add.Create(aOwner: TComponent;
  aHandle: TISC_DB_HANDLE);
begin
  inherited Create(aOwner);

  DM := TDataModule1.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := true;
  DM.ReadTransaction.StartTransaction;

  DM.ReadTimestampDataSet.SelectSQL.Clear;
  DM.ReadTimestampDataSet.SelectSQL.Text := 'select CUR_TIMESTAMP from ST_GET_CURRENT_TIMESTAMP';
  DM.ReadTimestampDataSet.Open;
  DM.CURRENT_TIMESTAMP := DM.ReadTimestampDataSet['CUR_TIMESTAMP'];
  DM.ReadTimestampDataSet.close;
end;

procedure TRegistration_Form_First_Add.DisableControls(Disable: boolean);
begin
  Familia_Edit.Properties.ReadOnly := Disable;
  Name_Edit.Properties.ReadOnly := Disable;
  Otch_Edit.Properties.ReadOnly := Disable;
  DateBorn_Edit.Properties.ReadOnly := Disable;
  Nalog_Edit.Properties.ReadOnly := Disable;
end;

function StringPrepareToQueryText(AText:string):string;
var I:integer;
    TStr:string;
begin
 i:=1;
 While i<>Length(AText)+1 do
  begin
   if copy(Atext,i,1)='''' then
    begin
     TStr:=copy(Atext,i+1,Length(Atext)-i);
     delete(Atext,i+1,Length(Atext)-i);
     AText:=AText+''''+TStr;
     inc(i);
    end;
    inc(i);
  end;
 result:=Atext;
end;

procedure TRegistration_Form_First_Add.AcademicYear;
var
  NowDate : TDateTime;
  Now_Year, Now_Month, Now_Day : Word;
  End_Year, End_Month, End_Day : Word;
begin
  NowDate := DM.CURRENT_TIMESTAMP;
  DecodeDate(NowDate,Now_Year,Now_Month,Now_Day);
  if Now_Month >=7 then
   begin
    Now_Day:=1;
    Now_Month:=9;
    End_Day:=1;
    End_Month:=7;
    End_Year := Now_Year+1;
    if End_Year = 2012
     then End_Month:=6; //в 2012 году проведение олимпиады проживание до 01/06/2012
    Build_Beg_DateEdit.Date := EncodeDate(Now_Year,Now_Month,Now_Day);
    Build_End_DateEdit.Date := EncodeDate(End_Year,End_Month,End_Day);
   end
  else
   begin
    Now_Day:=1;
    Now_Month:=9;
    End_Day:=1;
    End_Month:=7;
    End_Year := Now_Year;
    if End_Year = 2012
     then End_Month:=6; //в 2012 году проведение олимпиады проживание до 01/06/2012
    Build_Beg_DateEdit.Date := EncodeDate(Now_Year-1,Now_Month,Now_Day);
    Build_End_DateEdit.Date := EncodeDate(End_Year,End_Month,End_Day);
   end;
end;

procedure TRegistration_Form_First_Add.GroupVisible (Mode : boolean);
begin
     if Mode then begin
      KursLabel.Visible:=true;
      Kurs_ComboBox.Visible:=true;
      GroupLabel.Visible:=true;
      Group_ComboBox.Visible:=true;
      SpecLabel.Visible:=true;
      Spec_ComboBox.Visible:=true;
     end
     else begin
      KursLabel.Visible:=false;
      Kurs_ComboBox.Visible:=false;
      GroupLabel.Visible:=false;
      Group_ComboBox.Visible:=false;
      SpecLabel.Visible:=false;
      Spec_ComboBox.Visible:=false;

      id_group:=-1;
      id_spec:=-1;
     end;
     end;

procedure TRegistration_Form_First_Add.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 Caption:=                       st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 OkButton.Caption :=             st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=         st_ConstUnit.st_Cancel[PLanguageIndex];

 cxGroupBox2.Caption :=         st_ConstUnit.st_FIOUser[PLanguageIndex];
 cxGroupBox3.Caption :=         st_ConstUnit.st_Dog[PLanguageIndex];

 Label1.Caption:=               st_ConstUnit.st_Fam[PLanguageIndex];
 Label2.Caption:=               st_ConstUnit.st_Name[PLanguageIndex];
 Label3.Caption:=               st_ConstUnit.st_Otch[PLanguageIndex];
 Label4.Caption:=               st_ConstUnit.st_DateBorn[PLanguageIndex];
 Label13.Caption:=              st_ConstUnit.st_Sex[PLanguageIndex];
 Inostranez_CheckBox.Properties.Caption:=  st_ConstUnit.st_Inostr[PLanguageIndex];
 Propiska_CheckBox.Properties.Caption:=    st_ConstUnit.st_WithPropi[PLanguageIndex];
 Propusk_CheckBox.Properties.Caption:=     st_ConstUnit.st_PropPrint[PLanguageIndex];
 Label6.Caption:=               st_ConstUnit.st_DogNomer[PLanguageIndex];
 Label7.Caption:=               st_ConstUnit.st_DogDate[PLanguageIndex];

 cxGroupBox1.Caption:=          st_ConstUnit.st_Live[PLanguageIndex];
 Label16.Caption:=              st_ConstUnit.st_Nomer[PLanguageIndex];
 Label18.Caption:=              st_ConstUnit.st_Room[PLanguageIndex];
 Label19.Caption:=              st_ConstUnit.st_Type[PLanguageIndex];

 cxGroupBox5.Caption:=          st_ConstUnit.st_Identify[PLanguageIndex];
 Label8.Caption:=               st_ConstUnit.st_TabNomer[PLanguageIndex];
 Label9.Caption:=               st_ConstUnit.st_NalogNomer[PLanguageIndex];

 cxGroupBox6.Caption:=          st_ConstUnit.st_Study[PLanguageIndex];
 Label10.Caption:=              st_ConstUnit.st_Pidrozdil[PLanguageIndex];
 KursLabel.Caption:=            st_ConstUnit.st_footer_Kurs[PLanguageIndex];
 GroupLabel.Caption:=           st_ConstUnit.st_footer_Group[PLanguageIndex];
 SpecLabel.Caption:=            st_ConstUnit.st_footer_Spec[PLanguageIndex];

 cxGroupBox4.Caption:=          st_ConstUnit.st_Category[PLanguageIndex];
 Label20.Caption:=              st_ConstUnit.st_Z[PLanguageIndex];
 Label21.Caption:=              st_ConstUnit.st_Po[PLanguageIndex];
end;


procedure TRegistration_Form_First_Add.FormShow(Sender: TObject);
var
  i : Integer;
begin
  Screen.Cursor := crHourGlass;
  DM.DataSet_read.SelectSQL.Text := 'select * from ST_DT_PFIO_ADD_TYPE_ROOM_SELECT';
  DM.DataSet_read.Open;
  DM.DataSet_read.FetchAll;
  Type_Room_ComboBox.Clear;
  for i:=0 to DM.DataSet_read.RecordCount-1 do
   begin
    Type_Room_ComboBox.Properties.Items.Add(DM.DataSet_read['NAME_TYPE_ROOM'] );
    DM.DataSet_read.Next;
   end;
  Type_Room_ComboBox.ItemIndex:=0;
  DM.DataSet_read.Close;

  DM.DataSet_read.Close;
  DM.DataSet_read.SelectSQL.Text := 'SELECT * from ST_GET_DEFAULT_DATES_TO_ADD';
  DM.DataSet_read.Open;
  If DM.DataSet_read['ST_DEFAULT_DATES_TO_ADD'] = 0
   then AcademicYear;

  If DM.DataSet_read['ST_DEFAULT_DATES_TO_ADD'] = 1 then
   begin
    Build_Beg_DateEdit.Date := DM.DataSet_read['DATE_BEG'];
    Build_End_DateEdit.Date := DM.DataSet_read['DATE_END'];
   end;
  DM.DataSet_read.Close;

  Screen.Cursor := crDefault;

  Pol_ComboBox.ItemIndex:=0;
  ShortName_Build_Label.Caption:='';
  Full_Cat_Label.Caption:='';
  Familia_edit.SetFocus;
end;

procedure TRegistration_Form_First_Add.CancelButtonClick(Sender: TObject);
begin
if DM.DataSet_read.Active then close;
close;
end;

procedure TRegistration_Form_First_Add.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.Free;
end;

procedure TRegistration_Form_First_Add.OkButtonClick(Sender: TObject);
var
  kav : string;
  AllowDateCategoryBeg, AllowDateCategoryEnd : Boolean;
  i   : Integer;
begin
  //Основные данные   - стандартные проверки на заполнение и совпадение типов данных
  if Familia_Edit.Text ='' then
   begin
    ShowMessage('Необходимо ввести фамилию!');
    Familia_Edit.SetFocus;
    exit;
   end;

  if Name_Edit.Text ='' then
   begin
    ShowMessage('Необходимо ввести имя!');
    Name_Edit.SetFocus;
    exit;
   end;

  if Otch_Edit.Text ='' then
   begin
    ShowMessage('Необходимо ввести отчество!');
    Otch_Edit.SetFocus;
    exit;
   end;

  if DateBorn_Edit.Text = '' then
   begin
    ShowMessage('Необходимо ввести дату рождения!');
    DateBorn_Edit.SetFocus;
    exit;
   end;

  if Nomer_Dogovora.Text ='' then
   begin
    ShowMessage('Необходимо ввести номер договора!');
    Nomer_Dogovora.SetFocus;
    exit;
   end;

  if Dogovor_DateEdit.Text = '' then
   begin
    ShowMessage('Необходимо ввести дату договора!');
    Dogovor_DateEdit.SetFocus;
    exit;
   end;

  if ((Faculty_ButtonEdit.Text = '' ) and (Id_department = -1))  then
   begin
    ShowMessage('Необходимо ввести подразделение!');
    Faculty_ButtonEdit.SetFocus;
    exit;
   end;

  If Nalog_Edit.Text = '' then
   begin
    i := st_Common_Messages.stShowMessage(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex], 'ИНН не введен! Продолжить сохранение?', mtConfirmation, [mbYes, mbNo]);
    if ((i = 7) or (i= 2)) then exit;
    Nalog_Edit.Text := '-1';
   end;

  if ((Nalog_Edit.Text <> '') and (Nalog_Edit.Text <> '-1')) then
   if IntegerCheck(Nalog_Edit.Text) = false then
    begin
     ShowMessage('Идентификационный налоговый номер введен неверно!' + #13#10 + 'ИНН не целое число!');
     Nalog_Edit.SetFocus;
     exit;
    end;

  // проверка налогового номера - первых 5-ти цифр
  if DateBorn_Edit.Date <> StrToDate('01.01.1900') then
  if ((Nalog_Edit.Text <> '') and (Nalog_Edit.Text <> '-1')) then
  if NalogNomerChecker( Nalog_Edit.Text, DateBorn_Edit.Date)= false then
   begin
    ShowMessage('Идентификационный налоговый номер введен неверно!' + #13#10 + 'Не соответствие с датой рождения!');
    Nalog_Edit.SetFocus;
    exit;
   end;

  // проверка налогового номера на дублируемость в базе данных
  // если есть совпадения - месседж с номером и фамилией
  if  ((Nalog_Edit.Text <> '') and (Nalog_Edit.Text <> '-1')) then
   begin
    DM.DataSet_read.Close;
    DM.DataSet_read.SelectSQL.Clear;
    DM.DataSet_read.SelectSQL.Text:='select * from ID_NALOG_CAN_DO(:NUMBER, :id_kod)';
    DM.DataSet_read.ParamByName('number').AsString := Nalog_Edit.Text;
    DM.DataSet_read.ParamByName('id_kod').AsInt64 := -1;
    DM.DataSet_read.Open;
    if DM.DataSet_read['Can']=0 then
     begin
      ShowMessage('Обнаружено совпадение. Данный налоговый номер уже используется: '+ DM.DataSet_read['FIO_COMBO']+ ' - '+ Nalog_Edit.Text);
      DM.DataSet_read.Close;
      Nalog_Edit.SetFocus;
      exit;
     end;
   end;
  DM.DataSet_read.Close;
  if  Nalog_Edit.Text = '-1' then Nalog_Edit.Text := '';

  // Вкладка проживания
  if TypeEdit.Text='' then
   begin
    ShowMessage('Необходимо ввести тип здания!');
    TypeEdit.SetFocus;
    exit;
   end;

  if Nomer_Komnat_Edit.Text = '' then
   begin
    ShowMessage('Необходимо ввести номер комнаты!');
    Nomer_Komnat_Edit.SetFocus;
    exit;
   end;

  if Build_Beg_DateEdit.Text = '' then
   begin
    ShowMessage('Необходимо ввести дату начала!');
    Build_Beg_DateEdit.SetFocus;
    exit;
   end;

  if Build_End_DateEdit.Text = '' then
   begin
    ShowMessage('Необходимо ввести дату конца!');
    Build_End_DateEdit.SetFocus;
    exit;
   end;

  if Build_Beg_DateEdit.Date >= Build_End_DateEdit.Date then
   begin
    ShowMessage('Дата начала должна быть меньше даты окончания.');
    Build_End_DateEdit.setfocus;
    exit;
   end;

  if IntegerCheck(TypeEdit.Text)=false then
   begin
    ShowMessage('Номер здания введен неверно!');
    TypeEdit.SetFocus;
    exit;
   end;

  // глобальная проверка вкладки проживания на предмет совпадения введенных данных
  //с записями в базе данных посредством хранимой процедуры
  kav:=''''; // это кавычки
  DM.DataSet_read.Close;
  DM.DataSet_read.SQLs.SelectSQL.Clear;
  DM.DataSet_read.SQLs.SelectSQL.Text:='select * from ST_DT_PFIO_BUILDS_CONTROL (:build, :room, :type)';
  DM.DataSet_read.ParamByName('build').AsInteger := StrToInt(TypeEdit.Text);
  DM.DataSet_read.ParamByName('room').AsString := Nomer_Komnat_Edit.Text;
  DM.DataSet_read.ParamByName('type').AsString := Type_Room_ComboBox.Text;
  DM.DataSet_read.Open;

  if DM.DataSet_read['N_BUILD_CORRECT'] = 0 then
   begin
    ShowMessage('Номер здания введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером здания не существует.');
    TypeEdit.SetFocus;
    DM.DataSet_read.Close;
    exit;
   end;
  If DM.DataSet_read['ROOM_CORRECT'] = 0 then
   begin
    ShowMessage('Номер комнаты введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером комнаты не существует.');
    Nomer_Komnat_Edit.SetFocus;
    DM.DataSet_read.Close;
    exit;
   end;
  if DM.DataSet_read['ROOM_TYPEROOM_CORRECT'] = 0 then
   begin
    ShowMessage('Номер комнаты не соответствует типу комнаты, т.к. записи в базе данных "Студгородок" с указанным номером и соответствующим ему типом комнаты не существует.');
    Nomer_Komnat_Edit.SetFocus;
    DM.DataSet_read.Close;
    exit;
   end;
  if DM.DataSet_read['BUILD_ROOM_TYPE_CORRECT']=0 then
   begin
    ShowMessage('В данном здании не существует комнаты с заданным номером и типом !');
    Nomer_Komnat_Edit.SetFocus;
    DM.DataSet_read.Close;
    exit;
   end;

  ID_Type_Room_Select:= DM.DataSet_read['ID_TYPE_ROOM'] ;
  ID_Build:= DM.DataSet_read['ID_BUILD'] ;
  DM.DataSet_read.Close;

// Вкладка категорий
  if Category_ButtonEdit.Text='' then begin
  ShowMessage('Необходимо ввести категорию');
  Category_ButtonEdit.SetFocus;
  exit;
  end;
if IntegerCheck(Category_ButtonEdit.Text)=false then
begin
ShowMessage('Код категории введен неверно!');
Category_ButtonEdit.SetFocus;
exit;
end;
// глобальная проверка вкладки категорий на предмет совпадения введенных данных
//с записями в базе данных посредством хранимой процедуры
DM.DataSet_read.Close;
DM.DataSet_read.SelectSQL.Clear;
DM.DataSet_read.SelectSQL.Text:='select * from ST_DT_PFIO_CATEGORY_CONTROL ( '+Category_ButtonEdit.Text+ ')';
DM.DataSet_read.Open;
if  DM.DataSet_read['NOMER_CORRECT']=0 then  begin
ShowMessage('Номер категории введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером категории не существует.');
Category_ButtonEdit.SetFocus;
DM.DataSet_read.Close;
exit;
end;
ID_Category:= DM.DataSet_read['ID_KATEGORIYA'] ;
DM.DataSet_read.Close;

// проверка категории на предмет вхождения дат по-умлчанию в даты по категориям
AllowDateCategoryBeg:=false;
AllowDateCategoryEnd := false;
DM.DataSet_read.SelectSQL.Text := 'select * from ST_SP_KAT_SUM_SELECT(' + IntToStr(ID_Category) + ') order by BEG_DATE';
DM.DataSet_read.Open;
DM.DataSet_read.FetchAll;
if DM.DataSet_read.RecordCount <> 0 then
    begin
          DM.DataSet_read.First;
          if (Build_Beg_DateEdit.Date >= DM.DataSet_read['BEG_DATE']) then AllowDateCategoryBeg:=true;
          DM.DataSet_read.Last;
          if (Build_End_DateEdit.Date <= DM.DataSet_read['END_DATE']) then AllowDateCategoryEnd:=true;
    end;
  DM.DataSet_read.Close;
if (not AllowDateCategoryBeg) or (not AllowDateCategoryEnd ) then begin
ShowMessage('Ошибка! Срок действия данной категории не совпадает с введенными датами начала и окончания категории.');
Category_ButtonEdit.SetFocus;
exit;
end;

// заполнение идентификаторов факультета, группы, специальности :
if ((Group_ComboBox.Visible) and (Group_ComboBox.ItemIndex <>-1))then begin

DM.DataSet_read.SelectSQL.Clear;
DM.DataSet_read.SelectSQL.Text:= 'select ID_GROUP from ST_GET_ID_GROUP_BY_NAME('+ IntToStr(Id_department) +
                                           ','+ kav + Group_ComboBox.Text + kav + ')';
DM.DataSet_read.Open;
id_group:=DM.DataSet_read['ID_GROUP'];
DM.DataSet_read.Close;
end
else
id_group:=-1;

if ((Spec_ComboBox.Visible) and (Spec_ComboBox.ItemIndex <>-1))then begin
DM.DataSet_read.SelectSQL.Clear;
DM.DataSet_read.SelectSQL.Text:= 'select ID_SPECIALNOST from ST_GET_ID_SPEC_BY_NAME('+ kav + Spec_ComboBox.Text + kav + ')';
DM.DataSet_read.Open;
id_spec:=DM.DataSet_read['ID_SPECIALNOST'];
DM.DataSet_read.Close;
end
else
id_spec:=-1;

  // ПРОВЕРКА НА СОВПАДЕНИЕ УЖЕ ВВЕДЕННЫХ В РЕЕСТР ЛЮДЕЙ (ФИО + ДАТА РОЖДЕНИЯ)
  DM.DataSet_read.SelectSQL.Clear;
  DM.DataSet_read.SelectSQL.Text:=
'select * from ST_DT_PFIO_EX_FIO_CHECK('+kav+
                                        StringPrepareToQueryText(Familia_Edit.Text)
                                        +kav+','
                                        +kav+
                                        StringPrepareToQueryText(Name_Edit.Text)
                                        +kav+','
                                        +kav+
                                        StringPrepareToQueryText(Otch_Edit.Text)
                                        +kav+','
                                        +kav+datetostr(DateBorn_Edit.Date)+kav
                                        +')';
  DM.DataSet_read.Open;

  if DM.DataSet_read['EXISTED'] = 1 then
   begin
    DM.DataSet_read.Close;
    if MessageBox(Handle,PChar('Человек с аналогичным ФИО уже зарегистрирован. Все равно сохранить?'),'Внимание! Найдено совпадение!',MB_YESNO or MB_ICONQUESTION)= mrNo then
     begin
      Familia_Edit.SetFocus;
      exit;
     end;
   end;

  DM.DataSet_read.Close;
  ModalResult:=mrOk;
end;

procedure TRegistration_Form_First_Add.Familia_Edit_OLDExit(Sender: TObject);
begin
//Familia_Ukr.Text:=Familia_Edit.Text;
end;

procedure TRegistration_Form_First_Add.Name_EditExit(Sender: TObject);
begin
//Name_Ukr.Text:=Name_Edit.Text;
end;

procedure TRegistration_Form_First_Add.Otch_EditExit(Sender: TObject);
begin
//Otch_Ukr.Text:=Otch_Edit.Text;
 if Otch_Edit.Text<>'' then
  begin
  if SurNameChecker(Otch_Edit.Text)=true then Pol_ComboBox.ItemIndex:=1
  else Pol_ComboBox.ItemIndex:=0;
  end;
end;



procedure TRegistration_Form_First_Add.TypeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  BuildInfo     : TBuildsInfo;
  i             : integer;
  kav           : string;
  ROOM_COMPARED : string;
  ResOpl        : Variant;
begin
  ShortName_Build_Label.Caption := '';
  if TypeEdit.Text<>'' then
   begin
    if IntegerCheck(TypeEdit.Text)=false then
     begin
      ShowMessage('Номер здания введен неверно!');
      TypeEdit.SetFocus;
      exit;
     end;
     DM.DataSet_read.Close;
     DM.DataSet_read.SQLs.SelectSQL.Clear;
     DM.DataSet_read.SQLs.SelectSQL.Text:='select * from ST_DT_PFIO_NBUILD_EXITCONTROL(:build)';
     DM.DataSet_read.ParamByName('build').AsInteger := StrToInt(TypeEdit.Text);
     DM.DataSet_read.Open;
    if  DM.DataSet_read['N_BUILD_CORRECT']=0 then
     begin
      ShowMessage('Номер здания введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером здания не существует.');
      TypeEdit.SetFocus;
      DM.DataSet_read.Close;
      exit;
     end;
   end;

  If Nomer_Komnat_Edit.Text<>'' then
   begin
    DM.DataSet_read.Close;
    DM.DataSet_read.SQLs.SelectSQL.Clear;
    DM.DataSet_read.SQLs.SelectSQL.Text:='select * from ST_DT_PFIO_NROOM_CONTROL_ONEXIT (:number)';
    DM.DataSet_read.ParamByName('number').AsString := Nomer_Komnat_Edit.Text;
    DM.DataSet_read.Open;
    If DM.DataSet_read['ROOM_CORRECT']=0 then
     begin
      ShowMessage('Номер комнаты введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером комнаты не существует.');
      Nomer_Komnat_Edit.SetFocus;
      DM.DataSet_read.Close;
      exit;
     end;
   end;

  if (TypeEdit.Text<>'') and (Nomer_Komnat_Edit.Text<>'') then
   begin
    kav:=''''; // это кавычки
    DM.DataSet_read.Close;
    DM.DataSet_read.SQLs.SelectSQL.Clear;
    DM.DataSet_read.SQLs.SelectSQL.Text:='select * from ST_DT_PFIO_BUILDS_CONTROL(:build, :room, :type)';
    DM.DataSet_read.ParamByName('build').AsInteger := StrToInt(TypeEdit.Text);
    DM.DataSet_read.ParamByName('room').AsString   := Nomer_Komnat_Edit.Text;
    DM.DataSet_read.ParamByName('type').AsString   := Type_Room_ComboBox.Text;
    DM.DataSet_read.Open;
    if  DM.DataSet_read['N_BUILD_CORRECT']=0 then
     begin
      ShowMessage('Номер здания введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером здания не существует.');
      TypeEdit.SetFocus;
      DM.DataSet_read.Close;
      exit;
     end;
    if DM.DataSet_read['ROOM_CORRECT']=0 then
     begin
      ShowMessage('Номер комнаты введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером комнаты не существует.');
      Nomer_Komnat_Edit.SetFocus;
      DM.DataSet_read.Close;
      exit;
     end;
    if  DM.DataSet_read['ROOM_TYPEROOM_CORRECT']=0 then
     begin
      ShowMessage('Номер комнаты не соответствует типу комнаты, т.к. записи в базе данных "Студгородок" с указанным номером и соответствующим ему типом комнаты не существует.');
      Nomer_Komnat_Edit.SetFocus;
      DM.DataSet_read.Close;
      exit;
     end;
    if DM.DataSet_read['BUILD_ROOM_TYPE_CORRECT']=0 then
     begin
      ShowMessage('В данном здании не существует комнаты с заданным номером и типом !');
      Nomer_Komnat_Edit.SetFocus;
      DM.DataSet_read.Close;
      exit;
     end;

    ShortName_Build_Label.Caption:= DM.DataSet_read['Short_name'] ;
    ID_Type_Room_Select:= DM.DataSet_read['ID_TYPE_ROOM'] ;
    ID_Build:= DM.DataSet_read['ID_BUILD'] ;
    DM.DataSet_read.Close;
    DM.DataSet_read.SQLs.SelectSQL.Clear;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'select SHORT_NAME from ST_INI_TYPE_ROOM where id_type_room = :type';
    DM.DataSet_read.ParamByName('type').AsInt64 := ID_Type_Room_Select;
    DM.DataSet_read.Open;
    ROOM_COMPARED:='';
    ROOM_COMPARED:= DM.DataSet_read['SHORT_NAME'];
    ROOM_COMPARED:=Nomer_Komnat_Edit.Text + ROOM_COMPARED ;
    DM.DataSet_read.Close;
   end;

  BuildInfo.id_build:= Id_Build;
  BuildInfo.N_Room:=ROOM_COMPARED;
  ResOpl:= Load_st_Builds(self,DM.DB.Handle,true,true,BuildInfo);
  if VarArrayDimCount(ResOpl)>0 then
   begin
    id_build:= ResOpl[0];
    TypeEdit.Text := ResOpl[1];
    ShortName_Build_Label.Caption:= ResOpl[2];
    Nomer_Komnat_Edit.Text:=ResOpl[4];
    ID_Type_Room_Select:= ResOpl[5];
    DM.DataSet_read.Close;
    DM.DataSet_read.SelectSQL.Text := 'select * from ST_DT_PFIO_TYPE_ROOM_SELECT(' + VarToStr(ResOpl[5]) + ')';
    DM.DataSet_read.Open;
    ComboRoom:=vartostr(ResOpl[4])+' '+ DM.DataSet_read['SHORT_NAME'];
    DM.DataSet_read.Close;
    DM.DataSet_read.SelectSQL.Clear;
    DM.DataSet_read.SelectSQL.Text := 'select * from ST_DT_PFIO_TYPE_ROOM_SELECT(' + IntToStr(ID_Type_Room_Select) + ')';
    DM.DataSet_read.Open;
    for i:=0 to Type_Room_ComboBox.Properties.Items.Count-1 do
     begin
      if Type_Room_ComboBox.Properties.Items[i]= DM.DataSet_read['NAME_TYPE_ROOM']
       then Type_Room_ComboBox.ItemIndex:=i;
     end;
    DM.DataSet_read.Close;
   end;
end;

procedure TRegistration_Form_First_Add.Category_ButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  aParameter : TstSimpleParams;
  res : Variant;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DM.DB.Handle;
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

procedure TRegistration_Form_First_Add.Otch_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then DateBorn_Edit.SetFocus;
end;

procedure TRegistration_Form_First_Add.DateBorn_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Pol_ComboBox.SetFocus;
end;

procedure TRegistration_Form_First_Add.Kurs_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Group_ComboBox.SetFocus;
end;

procedure TRegistration_Form_First_Add.Dogovor_DateEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Tabel_Edit.SetFocus;
end;

procedure TRegistration_Form_First_Add.Nomer_DogovoraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Dogovor_DateEdit.SetFocus;
end;

procedure TRegistration_Form_First_Add.Tabel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Nalog_Edit.SetFocus;
end;

procedure TRegistration_Form_First_Add.Nalog_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Faculty_ButtonEdit.SetFocus;
end;

procedure TRegistration_Form_First_Add.Name_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Otch_Edit.SetFocus;
end;

procedure TRegistration_Form_First_Add.Build_Beg_DateEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if Key = #13 then Build_End_DateEdit.SetFocus;
end;

procedure TRegistration_Form_First_Add.Build_End_DateEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if Key = #13 then OkButton.SetFocus;
end;

procedure TRegistration_Form_First_Add.Pol_ComboBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if Key = #13 then Inostranez_CheckBox.SetFocus;
end;

procedure TRegistration_Form_First_Add.FormCreate(Sender: TObject);
begin
  FormIniLanguage();

  id_group:=-1;
  id_spec:=-1;
  Id_department:=-1;

  ID_MAN:= -1;
  Fam_ukr  := '';
  name_ukr := '';
  Otch_ukr := '';
end;

procedure TRegistration_Form_First_Add.Nomer_Komnat_EditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then Type_Room_ComboBox.SetFocus;
end;

procedure TRegistration_Form_First_Add.TypeEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Nomer_Komnat_Edit.SetFocus;
end;

procedure TRegistration_Form_First_Add.Category_ButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if Key = #13 then Build_Beg_DateEdit.SetFocus;
end;

procedure TRegistration_Form_First_Add.Type_Room_ComboBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if Key = #13 then Category_ButtonEdit.SetFocus;
end;

procedure TRegistration_Form_First_Add.TypeEditExit(Sender: TObject);
begin
  ShortName_Build_Label.Caption := '';

  if TypeEdit.Text = '' then exit;

  if IntegerCheck(TypeEdit.Text) = false then
   begin
    ShowMessage('Номер здания введен неверно!');
    TypeEdit.SetFocus;
    exit;
   end;

  DM.DataSet_read.Close;
  DM.DataSet_read.SQLs.SelectSQL.Clear;
  DM.DataSet_read.SQLs.SelectSQL.Text:='select * from ST_DT_PFIO_NBUILD_EXITCONTROL(:build)';
  DM.DataSet_read.ParamByName('build').AsInteger := StrToInt(TypeEdit.Text);
  DM.DataSet_read.Open;
  if DM.DataSet_read['N_BUILD_CORRECT']=0 then
   begin
    ShowMessage('Номер здания введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером здания не существует.');
    TypeEdit.SetFocus;
    DM.DataSet_read.Close;
    exit;
   end
  else ShortName_Build_Label.Caption:= DM.DataSet_read['Short_name'] ;
  DM.DataSet_read.Close;

  If ((TypeEdit.Text = '3') or (TypeEdit.Text = '4'))
   then Type_Room_ComboBox.ItemIndex:=2;
end;

procedure TRegistration_Form_First_Add.Category_ButtonEditExit(
  Sender: TObject);
begin
  Full_Cat_Label.Caption:='';

  if Category_ButtonEdit.Text  = '' then exit;

  If IntegerCheck(Category_ButtonEdit.Text)=false then
   begin
    ShowMessage('Код категорії введено невірно!');
    Category_ButtonEdit.SetFocus;
    exit;
   end;

  DM.DataSet_read.Close;
  DM.DataSet_read.SelectSQL.Clear;
  DM.DataSet_read.SelectSQL.Text:='select * from ST_DT_PFIO_CATEGORY_CONTROL ( '+ Category_ButtonEdit.Text+ ')';
  DM.DataSet_read.Open;
  if  DM.DataSet_read['NOMER_CORRECT']=0 then
   begin
    ShowMessage('Код категорії введено невірно - запису у базі даних зі вказаним кодом не існує');
    Category_ButtonEdit.SetFocus;
    DM.DataSet_read.Close;
    exit;
   end
  else Full_Cat_Label.Caption:= DM.DataSet_read['Short_name'] ;
  DM.DataSet_read.Close;
end;


procedure TRegistration_Form_First_Add.Nomer_Komnat_EditExit(
  Sender: TObject);
begin
  if Nomer_Komnat_Edit.Text<> '' then
   begin
    DM.DataSet_read.Close;
    DM.DataSet_read.SQLs.SelectSQL.Clear;
    DM.DataSet_read.SQLs.SelectSQL.Text:='select * from ST_DT_PFIO_NROOM_CONTROL_ONEXIT (:number)';
    DM.DataSet_read.ParamByName('number').AsString := Nomer_Komnat_Edit.Text;
    DM.DataSet_read.Open;
    if DM.DataSet_read['ROOM_CORRECT']=0 then
     begin
      ShowMessage('Номер кімнати введено невірно - запису у базі даних зі вказаним номером не існує');
      Nomer_Komnat_Edit.SetFocus;
      DM.DataSet_read.Close;
     end;
   end;
end;

procedure TRegistration_Form_First_Add.Faculty_ButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    sp: TSprav;
    i: integer;

begin
  // создать справочник
  sp :=  GetSprav('SpDepartment');
  if sp <> nil then
   begin
    // заполнить входные параметры
    with sp.Input do
     begin
      Append;
      FieldValues['DBHandle'] := Integer(DM.DB.Handle);
      // модальный показ
      FieldValues['ShowStyle'] := 1;
                // единичная выборка
            FieldValues['Select'] := 1;
            Post;
     end;
   end;

  // показать справочник и проанализировать результат (выбор одного подр.)
   sp.Show;

  if sp.Output = nil
   then ShowMessage('BUG: Output is NIL!!!')
   else
    if not sp.Output.IsEmpty then
     begin
      // выбираем код факультета

      Id_department:= sp.Output['Id_Department'];

      DM.DataSet_read.Close;
      DM.DataSet_read.SQLs.SelectSQL.Clear;
      DM.DataSet_read.SQLs.SelectSQL.Text:='select DEPARTMENT_CODE from ST_GET_DEPARTMENT_CODE('+ inttostr(sp.Output['Id_Department'])+')';
      DM.DataSet_read.Open;
      Faculty_ButtonEdit.Text := DM.DataSet_read['DEPARTMENT_CODE'];

      Podrazdel_Label.Caption:=sp.Output['Name_Full'];

      Screen.Cursor:= crHourGlass;
      //проверяем парент на 199
      DM.DataSet_read.Close;
      DM.DataSet_read.SelectSQL.Clear;
      DM.DataSet_read.SelectSQL.Text:='select FLAG from ST_IS_IT_FACULTY('+ inttostr(sp.Output['Id_Department'])+')';
      DM.DataSet_read.Open;

      if DM.DataSet_read['FLAG']=1 then
       begin
        // выбираем группы и специальности, если парент =199

        DM.DataSet_read.Close;
        DM.DataSet_read.SelectSQL.Clear;
        DM.DataSet_read.SelectSQL.Text:='select ID_GROUP, GROUP_FULL_NAME from ST_GET_GROUP('+ inttostr(sp.Output['Id_Department'])+')';
        DM.DataSet_read.Open;
        DM.DataSet_read.FetchAll;
        Group_ComboBox.Clear;
        for i:=0 to DM.DataSet_read.RecordCount-1 do
         begin
          Group_ComboBox.Properties.Items.Add(DM.DataSet_read['GROUP_FULL_NAME'] );
          DM.DataSet_read.Next;
         end;
        Group_ComboBox.ItemIndex:=-1;

        DM.DataSet_read.Close;
        DM.DataSet_read.SelectSQL.Clear;
        DM.DataSet_read.SelectSQL.Text:='select ID_SPECIALNOST, NAME_SPEC, kod_spec from ST_GET_SPEC('+ inttostr(sp.Output['Id_Department'])+')';
        DM.DataSet_read.Open;
        DM.DataSet_read.FetchAll;
        Spec_ComboBox.Clear;
        for i:=0 to DM.DataSet_read.RecordCount-1 do
         begin
          Spec_ComboBox.Properties.Items.Add(DM.DataSet_read['NAME_SPEC']+'('+ DM.DataSet_read['KOD_SPEC']+')' );
          DM.DataSet_read.Next;
         end;
        Spec_ComboBox.ItemIndex:=-1;
        DM.DataSet_read.Close;
        sp.Free;
        GroupVisible(true);
       end
       else
        begin
         sp.Free;
         GroupVisible(false);
         DM.DataSet_read.Close;
        end;
      Screen.Cursor:=crDefault;
     end  // если справочник вернул
     else sp.Free;
  DM.DataSet_read.Close;
end;


procedure TRegistration_Form_First_Add.Faculty_ButtonEditExit(
  Sender: TObject);
var
  i: integer;
begin
  Podrazdel_Label.Caption := '';
  if Faculty_ButtonEdit.Text = '' then
   begin
    if DM.DataSet_read.Active
     then DM.DataSet_read.close;
    exit;
   end;

  if IntegerCheck(Faculty_ButtonEdit.Text)=false then
   begin
    ShowMessage('Номер подразделения введен неверно!');
    Faculty_ButtonEdit.SetFocus;
    exit;
   end;

  DM.DataSet_read.Close;
  DM.DataSet_read.SQLs.SelectSQL.Clear;
  DM.DataSet_read.SQLs.SelectSQL.Text:='select * from ST_FACULTY_EXITCONTROL ( '+ Faculty_ButtonEdit.Text+ ')';
  DM.DataSet_read.Open;

  if  DM.DataSet_read['CODE_CORRECT']=0 then
   begin
    ShowMessage('Номер подразделения введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером не существует.');
    Faculty_ButtonEdit.SetFocus;
    DM.DataSet_read.Close;
    exit;
   end
  else
   begin
    Podrazdel_Label.Caption:= DM.DataSet_read['NAME_FULL'] ;
    id_department:= DM.DataSet_read['id_department'];
   end;
  DM.DataSet_read.Close;

  Screen.Cursor:= crHourGlass;

  //проверяем парент на 199
  DM.DataSet_read.SelectSQL.Clear;
  DM.DataSet_read.SelectSQL.Text:='select FLAG from ST_IS_IT_FACULTY('+ inttostr(id_department)+')';
  DM.DataSet_read.Open;

  if DM.DataSet_read['FLAG']=1 then
   begin
    // выбираем группы и специальности, если парент =199
    DM.DataSet_read.Close;
    DM.DataSet_read.SelectSQL.Clear;
    DM.DataSet_read.SelectSQL.Text:='select ID_GROUP, GROUP_FULL_NAME from ST_GET_GROUP('+ inttostr(id_department)+')';
    DM.DataSet_read.Open;
    DM.DataSet_read.FetchAll;
    Group_ComboBox.Properties.Items.Clear;;
    for i:=0 to DM.DataSet_read.RecordCount-1 do
     begin
      Group_ComboBox.Properties.Items.Add(DM.DataSet_read['GROUP_FULL_NAME'] );
      DM.DataSet_read.Next;
     end;
    Group_ComboBox.ItemIndex:=-1;
    DM.DataSet_read.Close;

    DM.DataSet_read.SelectSQL.Clear;
    DM.DataSet_read.SelectSQL.Text:='select ID_SPECIALNOST, NAME_SPEC from ST_GET_SPEC('+ inttostr(id_department)+')';
    DM.DataSet_read.Open;
    DM.DataSet_read.FetchAll;
    Spec_ComboBox.Properties.Items.Clear;
    for i:=0 to DM.DataSet_read.RecordCount-1 do
     begin
      Spec_ComboBox.Properties.Items.Add(DM.DataSet_read['NAME_SPEC'] );
      DM.DataSet_read.Next;
     end;

    Spec_ComboBox.ItemIndex:=-1;
    DM.DataSet_read.Close;

    GroupVisible(true);
   end
  else GroupVisible(false);

  Screen.Cursor:=crDefault;
  DM.DataSet_read.Close;

  if Kurs_ComboBox.Visible
   then Kurs_ComboBox.SetFocus
   else TypeEdit.SetFocus;

  // ставим умолчания общежитий
  DM.DataSet_read.Close;
  DM.DataSet_read.SelectSQL.Clear;
  DM.DataSet_read.SelectSQL.Text:='select NUM_BUILD from ST_GET_BUILD_BY_FACULTY('+ inttostr(id_department)+')';
  DM.DataSet_read.Open;
  if DM.DataSet_read['NUM_BUILD']<>null then
   begin
    TypeEdit.Text:= DM.DataSet_read['NUM_BUILD'];
    ShortName_Build_Label.Caption:='';
   end;
  DM.DataSet_read.close;
end;

procedure TRegistration_Form_First_Add.Faculty_ButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
   if Kurs_ComboBox.Visible
    then Kurs_ComboBox.SetFocus
    else TypeEdit.SetFocus;
end;

procedure TRegistration_Form_First_Add.Group_ComboBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then Spec_ComboBox.SetFocus;
end;

procedure TRegistration_Form_First_Add.Spec_ComboBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then TypeEdit.SetFocus;
end;

procedure TRegistration_Form_First_Add.Inostranez_CheckBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then Propiska_CheckBox.SetFocus;
end;

procedure TRegistration_Form_First_Add.Propiska_CheckBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then Propusk_CheckBox.SetFocus;
end;

procedure TRegistration_Form_First_Add.Propusk_CheckBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then Nomer_Dogovora.SetFocus;
end;

procedure TRegistration_Form_First_Add.ApplyActionExecute(Sender: TObject);
begin
  OkButtonClick(Sender);
end;

procedure TRegistration_Form_First_Add.ApostrofExecute(Sender: TObject);
begin
if Familia_Edit.Focused then
 begin
   Familia_Edit.Text:= Familia_Edit.Text + '''';
   keybd_event(VK_END, 0, 0, GetMessageExtraInfo);
 end;

if Name_Edit.Focused then
 begin
   Name_Edit.Text:= Name_Edit.Text + '''';
   keybd_event(VK_END, 0, 0, GetMessageExtraInfo);
 end;

 if Otch_Edit.Focused then
 begin
   Otch_Edit.Text:= Otch_Edit.Text + '''';
   keybd_event(VK_END, 0, 0, GetMessageExtraInfo);
 end;
end;

procedure TRegistration_Form_First_Add.Familia_EditKeyPress(
  Sender: TObject; var Key: Char);
begin
if Key = #13 then Name_Edit.SetFocus;
end;

procedure TRegistration_Form_First_Add.Familia_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Massiv: Variant;
begin
  Massiv := AllPeopleUnit.GetManForASUP(Self, DM.DB.Handle, False, True, ID_MAN);

  If VarArrayDimCount(Massiv)>0 then
   begin
    ID_MAN := -1; // обнуление

    ID_MAN := Massiv[0]; //Первичный ключ

    DisableControls(False);

    Fam_ukr  := Massiv[2];
    name_ukr := Massiv[3];
    Otch_ukr := Massiv[4];

    Familia_Edit.Text   := Massiv[5]; //Фамилия на рус.
    Name_Edit.Text      := Massiv[6]; //Имя на рус.
    Otch_Edit.Text      := Massiv[7]; //Отчество на рус.

    If Massiv[8] <> null
     then DateBorn_Edit.Date  := Massiv[8]  //Дата рождения
     else DateBorn_Edit.Date  := StrToDate('01.01.1900');

    DM.DataSet_read.Close;
    DM.DataSet_read.SelectSQL.Clear;
    DM.DataSet_read.SelectSQL.Text := 'SELECT * FROM ST_GET_SEX_PEOPLE_BY_ID(' + inttostr(ID_MAN)+ ')' ;
    DM.DataSet_read.Open;

    if DM.DataSet_read['ID_SEX'] = 1
     then Pol_ComboBox.ItemIndex := 0;

    if DM.DataSet_read['ID_SEX'] = 2
     then Pol_ComboBox.ItemIndex := 1;

    DM.DataSet_read.Close;

    if Massiv[9] > 0
     then Nalog_Edit.text  := Massiv[9] //ИНН
     else Nalog_Edit.text  := '';

    Otch_EditExit(Sender);
    DisableControls(False);
   end;
end;

procedure TRegistration_Form_First_Add.EditFizLizo_BtnClick(
  Sender: TObject);
begin
  if ID_MAN <> -1 then ShowManEditForm(Self,  DM.DB.Handle , ID_MAN,  True);
end;

procedure TRegistration_Form_First_Add.ClearButtonClick(Sender: TObject);
begin
  Group_ComboBox.ItemIndex:= -1;
  Spec_ComboBox.ItemIndex := -1;
  Kurs_ComboBox.ItemIndex := -1;
end;

procedure TRegistration_Form_First_Add.Kurs_ComboBoxKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key= vk_delete
  then Kurs_ComboBox.ItemIndex := -1;
end;

procedure TRegistration_Form_First_Add.Group_ComboBoxKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key= vk_delete
  then Group_ComboBox.ItemIndex := -1;
end;

procedure TRegistration_Form_First_Add.Spec_ComboBoxKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key= vk_delete
  then Spec_ComboBox.ItemIndex := -1;
end;
end.
