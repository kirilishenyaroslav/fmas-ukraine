//***********************************************************************
//* Проект "Студгородок"                                                *
//* Форма регистрации проживающих - изменение данных по месту и срокам  *
//* жительства                                                          *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit st_Registration_Date_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxGroupBox, cxButtonEdit, DB, FIBDataSet, pFIBDataSet, St_Loader_Unit,DataModule1_Unit,
  St_Proc, st_ConstUnit;

  type
  TRegistration_Date_Add_Form = class(TForm)
    cxGroupBox1: TcxGroupBox;
    DateBegEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    DateEndEdit: TcxDateEdit;
    cxLabel2: TcxLabel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label16: TLabel;
    TypeEdit: TcxButtonEdit;
    Label18: TLabel;
    Nomer_Komnat_Edit: TcxTextEdit;
    Label19: TLabel;
    ReadDataSet: TpFIBDataSet;
    Type_Room_ComboBox: TcxComboBox;
    ShortName_Build_Label: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OkButtonClick(Sender: TObject);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure TypeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure TypeEditExit(Sender: TObject);
    procedure Nomer_Komnat_EditExit(Sender: TObject);
    procedure TypeEditKeyPress(Sender: TObject; var Key: Char);
    procedure Nomer_Komnat_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Type_Room_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    Id_Build: integer;
    Short_Name_Build : string;
    Id_Type_Room : integer;
    ComboRoom: string;
  end;

var
  Registration_Date_Add_Form: TRegistration_Date_Add_Form;

implementation
uses St_Pfio_Add_Form, Unit_of_Utilits ;
{$R *.dfm}

procedure TRegistration_Date_Add_Form.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 OkButton.Caption :=             st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=         st_ConstUnit.st_Cancel[PLanguageIndex];
 // номер здания
 Label16.Caption :=             st_ConstUnit.st_HostelNomer[PLanguageIndex];
 //№ комнаты
 Label18.Caption :=             st_ConstUnit.st_RoomNomer[PLanguageIndex];
 //Тип комнаты
 Label19.Caption :=             st_ConstUnit.st_RoomType[PLanguageIndex];
 //С
 cxLabel1.Caption :=             st_ConstUnit.st_Z[PLanguageIndex];
 //По
 cxLabel2.Caption :=             st_ConstUnit.st_Po[PLanguageIndex];
end;

procedure TRegistration_Date_Add_Form.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TRegistration_Date_Add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TRegistration_Date_Add_Form.OkButtonClick(Sender: TObject);
var
kav:string;
begin
 if TypeEdit.Text= '' then
  begin
   ShowMessage('Необходимо ввести тип здания');
   TypeEdit.setfocus;
   exit;
  end;

  if Nomer_Komnat_Edit.Text =''then
   begin
    ShowMessage('Необходимо ввести номер комнаты!');
    Nomer_Komnat_Edit.SetFocus;
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

  if DateBegEdit.Date >= DateEndEdit.Date then
   begin
    ShowMessage('Дата начала должна быть меньше даты окончания.');
    DateEndEdit.setfocus;
    exit;
   end;

  if IntegerCheck(TypeEdit.Text)=false then
   begin
    ShowMessage('Номер здания введен неверно!');
    TypeEdit.SetFocus;
    exit;
   end;

  // глобальная проверка на предмет совпадения введенных данных
  //с записями в базе данных посредством хранимой процедуры
  kav:=''''; // это кавычки
  ReadDataSet.Close;
  ReadDataSet.SQLs.SelectSQL.Clear;
  ReadDataSet.SQLs.SelectSQL.Text:='select * from ST_DT_PFIO_BUILDS_CONTROL (:build, :room, :type)';
  ReadDataSet.ParamByName('build').AsInteger := StrToInt(TypeEdit.Text);
  ReadDataSet.ParamByName('room').AsString   := Nomer_Komnat_Edit.Text;
  ReadDataSet.ParamByName('type').AsString   := Type_Room_ComboBox.Text;
  ReadDataSet.Open;
  if ReadDataSet['N_BUILD_CORRECT']=0 then
   begin
    ShowMessage('Номер здания введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером здания не существует.');
    TypeEdit.SetFocus;
    ReadDataSet.Close;
    exit;
   end;

  if ReadDataSet['ROOM_CORRECT']=0 then
   begin
    ShowMessage('Номер комнаты введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером комнаты не существует.');
    Nomer_Komnat_Edit.SetFocus;
    ReadDataSet.Close;
    exit;
   end;

  if ReadDataSet['ROOM_TYPEROOM_CORRECT']=0 then
   begin
    ShowMessage('Номер комнаты не соответствует типу комнаты, т.к. записи в базе данных "Студгородок" с указанным номером и соответствующим ему типом комнаты не существует.');
    Nomer_Komnat_Edit.SetFocus;
    ReadDataSet.Close;
    exit;
   end;

  if  ReadDataSet['BUILD_ROOM_TYPE_CORRECT']=0 then
   begin
    ShowMessage('В данном здании не существует комнаты с заданным номером и типом !');
    Nomer_Komnat_Edit.SetFocus;
    ReadDataSet.Close;
    exit;
   end;

  ID_Type_Room:= ReadDataSet['ID_TYPE_ROOM'] ;
  ID_Build:= ReadDataSet['ID_BUILD'] ;
  Short_Name_Build:=ReadDataSet['Short_name'] ;
  ReadDataSet.Close;

  ReadDataSet.SQLs.SelectSQL.clear;
  ReadDataSet.SQLs.SelectSQL.Text := 'select * from ST_DT_PFIO_TYPE_ROOM_SELECT(:id)';
  ReadDataSet.ParamByName('id').AsInt64 := ID_Type_Room;
  ReadDataSet.Open;
  ComboRoom:=Nomer_Komnat_Edit.Text +' '+ ReadDataSet['SHORT_NAME'];
  ReadDataSet.Close;

  Registration_Form_Add.Redact_Live:=true;
  ModalResult:=mrOk;
end;

procedure TRegistration_Date_Add_Form.DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then DateEndEdit.SetFocus;
end;

procedure TRegistration_Date_Add_Form.TypeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  BuildInfo: TBuildsInfo;
  i:integer;
  kav : string;
  ROOM_COMPARED : string;
  ResOpl:Variant;
begin
  ShortName_Build_Label.Caption:='';
  with Registration_Date_Add_Form do
   begin
    if TypeEdit.Text<>'' then
     begin
      if IntegerCheck(TypeEdit.Text)=false then
       begin
        ShowMessage('Номер здания введен неверно!');
        TypeEdit.SetFocus;
        exit;
       end;
      ReadDataSet.Close;
      ReadDataSet.SQLs.SelectSQL.Clear;
      ReadDataSet.SQLs.SelectSQL.Text:='select * from ST_DT_PFIO_NBUILD_EXITCONTROL(:build)';
      ReadDataSet.ParamByName('build').AsInteger := StrToInt(TypeEdit.Text);
      ReadDataSet.Open;
      if ReadDataSet['N_BUILD_CORRECT']=0 then
       begin
        ShowMessage('Номер здания введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером здания не существует.');
        TypeEdit.SetFocus;
        ReadDataSet.Close;
        exit;
       end ;
     end;
    if Nomer_Komnat_Edit.Text<>'' then
     begin
      if IntegerCheck(Nomer_Komnat_Edit.Text)=false then
       begin
        ShowMessage('Номер комнаты введен неверно!');
        Nomer_Komnat_Edit.SetFocus;
        exit;
       end;
      ReadDataSet.Close;
      ReadDataSet.SQLs.SelectSQL.Clear;
      ReadDataSet.SQLs.SelectSQL.Text:='select * from ST_DT_PFIO_NROOM_CONTROL_ONEXIT(:room)';
      ReadDataSet.ParamByName('room').AsString := Nomer_Komnat_Edit.Text;
      ReadDataSet.Open;
      if ReadDataSet['ROOM_CORRECT'] = 0 then
       begin
        ShowMessage('Номер комнаты введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером комнаты не существует.');
        Nomer_Komnat_Edit.SetFocus;
        ReadDataSet.Close;
        exit;
       end;
     end;

    if (TypeEdit.Text<>'') and (Nomer_Komnat_Edit.Text<>'') then
     begin
      kav:=''''; // это кавычки
      ReadDataSet.Close;
      ReadDataSet.SQLs.SelectSQL.Clear;
      ReadDataSet.SQLs.SelectSQL.Text:='select * from ST_DT_PFIO_BUILDS_CONTROL(:build, :room, :type)';
      ReadDataSet.ParamByName('build').AsInteger := StrToInt(TypeEdit.Text);
      ReadDataSet.ParamByName('room').AsString   := Nomer_Komnat_Edit.Text;
      ReadDataSet.ParamByName('type').AsString   := Type_Room_ComboBox.Text;
      ReadDataSet.Open;
      if  ReadDataSet['N_BUILD_CORRECT']=0 then
       begin
        ShowMessage('Номер здания введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером здания не существует.');
        TypeEdit.SetFocus;
        ReadDataSet.Close;
        exit;
       end;

      if  ReadDataSet['ROOM_CORRECT']=0 then
       begin
        ShowMessage('Номер комнаты введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером комнаты не существует.');
        Nomer_Komnat_Edit.SetFocus;
        ReadDataSet.Close;
        exit;
       end;

      if ReadDataSet['ROOM_TYPEROOM_CORRECT']=0 then
       begin
        ShowMessage('Номер комнаты не соответствует типу комнаты, т.к. записи в базе данных "Студгородок" с указанным номером и соответствующим ему типом комнаты не существует.');
        Nomer_Komnat_Edit.SetFocus;
        ReadDataSet.Close;
        exit;
       end;

      if  ReadDataSet['BUILD_ROOM_TYPE_CORRECT'] = 0 then
       begin
        ShowMessage('В данном здании не существует комнаты с заданным номером и типом !');
        Nomer_Komnat_Edit.SetFocus;
        ReadDataSet.Close;
        exit;
       end;

      ShortName_Build_Label.Caption := ReadDataSet['Short_name'] ;
      Id_Type_Room := ReadDataSet['ID_TYPE_ROOM'] ;
      ID_Build:= ReadDataSet['ID_BUILD'] ;
      ReadDataSet.Close;
      ReadDataSet.SQLs.SelectSQL.Clear;
      ReadDataSet.SQLs.SelectSQL.Text := 'select SHORT_NAME from ST_INI_TYPE_ROOM where id_type_room = :type';
      ReadDataSet.ParamByName('type').AsInt64 := Id_Type_Room;
      ReadDataSet.Open;
      ROOM_COMPARED:='';
      ROOM_COMPARED:= ReadDataSet['SHORT_NAME'];
      ROOM_COMPARED:=Nomer_Komnat_Edit.Text + ROOM_COMPARED ;
      ReadDataSet.Close;
     end;
   end;

  BuildInfo.id_build:= Id_Build;
  BuildInfo.N_Room:=ROOM_COMPARED;
  ResOpl:= Load_st_Builds(self,DataModule1.DB.Handle,true,true,BuildInfo);
  if VarArrayDimCount(ResOpl)>0 then
   begin
    id_build:= ResOpl[0];
    TypeEdit.Text := ResOpl[1];
    ShortName_Build_Label.Caption:= ResOpl[2];
    Short_Name_Build:= ResOpl[3];
    Nomer_Komnat_Edit.Text:=ResOpl[4];
    Id_Type_Room:= ResOpl[5];
    ReadDataSet.Close;
    ReadDataSet.SQLs.SelectSQL.Text := 'select * from ST_DT_PFIO_TYPE_ROOM_SELECT(' + VarToStr(ResOpl[5]) + ')';
    ReadDataSet.Open;
    ComboRoom:=vartostr(ResOpl[4])+' '+ ReadDataSet['SHORT_NAME'];
    ReadDataSet.Close;
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFIO_TYPE_ROOM_SELECT(' + IntToStr(ID_Type_Room) + ')';
    ReadDataSet.Open;
    for i:=0 to Type_Room_ComboBox.Properties.Items.Count-1 do
     begin
      if Type_Room_ComboBox.Properties.Items[i]= ReadDataSet['NAME_TYPE_ROOM']
       then Type_Room_ComboBox.ItemIndex:=i;
     end;
    ReadDataSet.Close;
   end;
end;


procedure TRegistration_Date_Add_Form.FormCreate(Sender: TObject);
var i : integer;
begin
Id_Build:=-1;
Id_Type_Room:=-1;
Short_Name_Build:='';
ComboRoom:='';

ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFIO_ADD_TYPE_ROOM_SELECT';
ReadDataSet.Open;
ReadDataSet.FetchAll;
Type_Room_ComboBox.Clear;
for i:=0 to ReadDataSet.RecordCount-1 do begin
Type_Room_ComboBox.Properties.Items.Add(ReadDataSet['NAME_TYPE_ROOM'] );
ReadDataSet.Next;
end;
Type_Room_ComboBox.ItemIndex:=0;
ShortName_Build_Label.Caption:='';
ReadDataSet.Close;
FormIniLanguage();
end;

procedure TRegistration_Date_Add_Form.TypeEditExit(Sender: TObject);
begin
  ShortName_Build_Label.Caption := '';

  if TypeEdit.Text='' then exit;

  with Registration_Date_Add_Form do
   begin
    if IntegerCheck(TypeEdit.Text)=false then
     begin
      ShowMessage('Номер здания введен неверно!');
      TypeEdit.SetFocus;
      exit;
     end;
    ReadDataSet.Close;
    ReadDataSet.SQLs.SelectSQL.Clear;
    ReadDataSet.SQLs.SelectSQL.Text:='select * from ST_DT_PFIO_NBUILD_EXITCONTROL(:build)';
    ReadDataSet.ParamByName('build').AsInteger := StrToInt(TypeEdit.Text);
    ReadDataSet.Open;
    if ReadDataSet['N_BUILD_CORRECT'] = 0 then
     begin
      ShowMessage('Номер здания введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером здания не существует.');
      TypeEdit.SetFocus;
      ReadDataSet.Close;
      exit;
     end
    else ShortName_Build_Label.Caption:= ReadDataSet['Short_name'] ;
    ReadDataSet.Close;
   end;
end;

procedure TRegistration_Date_Add_Form.Nomer_Komnat_EditExit(
  Sender: TObject);
begin
  if Nomer_Komnat_Edit.Text <> '' then
   begin
    ReadDataSet.Close;
    ReadDataSet.SQLs.SelectSQL.Clear;
    ReadDataSet.SQLs.SelectSQL.Text:='select * from ST_DT_PFIO_NROOM_CONTROL_ONEXIT(:room)';
    ReadDataSet.ParamByName('room').AsString := Nomer_Komnat_Edit.Text;
    ReadDataSet.Open;
    if ReadDataSet['ROOM_CORRECT']=0 then
     begin
      ShowMessage('Номер комнаты введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером комнаты не существует.');
      Nomer_Komnat_Edit.SetFocus;
      ReadDataSet.Close;
     end ;
   end;
end;

procedure TRegistration_Date_Add_Form.TypeEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then Nomer_Komnat_Edit.SetFocus;
end;

procedure TRegistration_Date_Add_Form.Nomer_Komnat_EditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key=#13 then Type_Room_ComboBox.SetFocus;
end;

procedure TRegistration_Date_Add_Form.Type_Room_ComboBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key=#13 then DateBegEdit.SetFocus;
end;

procedure TRegistration_Date_Add_Form.DateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then OkButton.SetFocus;
end;

procedure TRegistration_Date_Add_Form.FormShow(Sender: TObject);
begin
 if TypeEdit.Text = '' then
 TypeEdit.SetFocus
 else
 DateBegEdit.SetFocus;
end;

end.
