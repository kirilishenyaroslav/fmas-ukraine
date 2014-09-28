program Planning;

{%ToDo 'Planning.todo'}

uses
  Forms,
  SysUtils,
  Windows,
  Controls,
  tagBaseTypes,
  tagSYS_Options,
  dt_Plan_Add in '..\dt_Plan\dt_Plan_Add.pas' {Добавление планов},
  dt_Plan_Form in '..\dt_Plan\dt_Plan_Form.pas' {Справочник планов},
  PlanEditor in '..\Plan_Editor\PlanEditor.pas' {Редактор планов},
  dt_Doc_Form_Add in '..\dt_Plan_Doc\dt_Doc_Form_Add.pas' {Добавление документа плана},
  dt_Stage_Add in '..\dt_Stage\dt_Stage_Add.pas' {Добавление периода документа плана},
  New_Stages in '..\dt_Stage\New_Stages.pas' {Редактор периодов},
  datamodule in 'datamodule.pas' {dm: Дата модуль},
  MainU in 'MainU.pas' {Главная форма},
  Add_Product in '..\Plan_Editor\Add_Product.pas' {Выбор продукции для добавления},
  Splash in 'Splash.pas' {Поплавок},
  AddProduct in '..\Plan_Editor\AddProduct.pas' {Добавление продукции в документ плана},
  EditNameDoc in '..\dt_Plan_Doc\EditNameDoc.pas' {Изменение наименования документа},
  View_Dogs_Data in '..\Plan_Editor\View_Dogs_Data.pas' {View_Dogs_DataForm},
  dt_IntMoving_Plan_Editor in '..\dt_Int_Moving_Plan\dt_IntMoving_Plan_Editor.pas' {dt_IntMoving_Plan_EditorForm};

{$R *.RES}
var
 i : integer;
// tagMutex   : THandle;
begin
 Application.Initialize;

 Application.Title := 'Формування планів основного виробництва';
 ShortDateFormat   := 'dd.MM.yyyy';
 DecimalSeparator  := ',';

 for i := 1 to ParamCount do	begin
  if ParamStr(i) = 'iddqd'  then ADMIN_MODE   := True;
  if ParamStr(i) = 'idclip' then NO_PASS_MODE := True;
 end;

 with TSplashForm.Create(nil) do begin
  Height := 134;
  Show;
  Update;

//    tagMutex := CreateMutex(nil, False, 'Planning');
//    if WaitForSingleObject(tagMutex, 0) <> Wait_TimeOut then begin
  Application.CreateForm(Tdm, dm);
  APP_PATH := ExtractFileDir(Application.ExeName) + '\';

  if not ReadIniFile then begin
   ShowMessage('Файл конфігурації ' + INI_FILENAME + ' не знайдено або відсутні необхідні інструкції у ньому!');
   dm.Free;
   Free;
   Exit;
  end;

  DM.DataBase.DBName                 := DB_PATH;
  DM.DataBase.ConnectParams.UserName := DB_USER;
  DM.DataBase.ConnectParams.Password := DB_PASSWORD;

  try DM.DataBase.Connected := True;
      DM.ReadTransaction.StartTransaction;
  except
   begin
    ShowMessage('Неможна з''єднатися з базою даних!');
    dm.Free;
    Free;
    Exit;
   end
  end;

  ConnectLabel.Visible := False;
  Timer.Enabled := True;
  Hide;

  if ShowModal <> mrOk then begin
   dm.Free;
   Exit;
  end;

  ConnectLabel.Visible := True;
  ConnectLabel.Caption := 'Оброблювання системної інформації';

  Height := 134;
  Show;
  Update;  

  UserNameEdit.Enabled := False;
  PasswordEdit.Enabled := False;

  LoadKeyboardLayout('00000422', KLF_ACTIVATE or KLF_SUBSTITUTE_OK);

  if not sys_ReadOptions(DM.ReadTransaction) then begin
   ShowMessage('Неможу вибрати системну інформацію з БД!');
   dm.Free;
   Free;
   Exit;
  end;

  Application.CreateForm(TMainForm, MainForm);

  Free;
  Application.Run;
{    end
 else begin
  Free;
  ShowMessage('Ви не можете запустити двох програм одночасно!');
 end;}
end;
end.
