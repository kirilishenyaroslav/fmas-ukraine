//***********************************************************************
//* Проект "Студгородок"                                                *
//* Главный модуль приложения- инициализация, чтение ини-файла ...      *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
program Studgorodok;



uses
  Forms,
  Windows,
  inifiles,
  SysUtils,
  fib,
  IB_Externals,
  ibase,
  Messages,
  Dialogs,
  MAIN in 'MAIN.PAS' {MainForm},
  about in 'about.pas' {AboutBox},
  DataModule1_Unit in 'DataModule1_Unit.pas' {DataModule1: TDataModule},
  Unit_of_Utilits in 'Unit_of_Utilits.pas',
  St_Ptio_Registration in 'St_Ptio_Registration.pas' {Registration_Form},
  St_Pfio_Add_Form in 'St_Pfio_Add_Form.pas' {Registration_Form_Add},
  st_Registration_Date_Add in 'st_Registration_Date_Add.pas' {Registration_Date_Add_Form},
  St_Pfio_First_Add_Form in 'St_Pfio_First_Add_Form.pas' {Registration_Form_First_Add},
  St_Registration_Date_Add_2 in 'St_Registration_Date_Add_2.pas' {Registration_Date_Add_Form_2},
  st_sp_Subsidy in 'st_sp_Subsidy.pas' {Subsidy_Form},
  St_sp_Substate in 'St_sp_Substate.pas' {Substate_Form},
  St_sp_Substate_Add in 'St_sp_Substate_Add.pas' {Substate_Add_Form},
  St_Pfsub_Add_Form in 'St_Pfsub_Add_Form.pas' {PfSub_Add_Form},
  ST_INI_TYPE_ROOM in 'ST_INI_TYPE_ROOM.pas' {Ini_Type_Room_Form},
  ST_INI_TYPE_ROOM_ADD in 'ST_INI_TYPE_ROOM_ADD.pas' {ST_INI_TYPE_ROOM_ADD_Form},
  st_sp_Subsidy_Add in 'st_sp_Subsidy_Add.pas' {Subsidy_Add_Form},
  St_PfLg_Add_Form in 'St_PfLg_Add_Form.pas' {PfLg_Add_Form},
  Splash_Unit in 'Splash_Unit.pas' {SplashForm},
  ST_DT_SQL_WaitForm in 'ST_DT_SQL_WaitForm.pas' {SQL_Wait_Form},
  st_sys_Pfio_SelectThread in 'st_sys_Pfio_SelectThread.pas',
  St_pfio_OplataSprav_Form_Unit in 'St_pfio_OplataSprav_Form_Unit.pas' {St_pfio_OplataSprav_Form},
  St_InsOst_Add_Istoch_Form in 'St_InsOst_Add_Istoch_Form.pas' {St_InsOst_Form},
  Propiska in 'Propiska.pas' {frmPropiska},
  Propiska_AddChildren in 'Propiska_AddChildren.pas' {frm_Propiska_AddChildren},
  Propiska_Add_Pasport in 'Propiska_Add_Pasport.pas' {prp_frm_Pass_Add},
  Propiska_History in 'Propiska_History.pas' {frm_prp_History},
  Propiska_Add_Fam_Relations in 'Propiska_Add_Fam_Relations.pas' {frm_FIO_Family},
  Propiska_Add_Fam in 'Propiska_Add_Fam.pas' {frm_FIO_Add},
  Propiska_Builds in 'Propiska_Builds.pas' {frm_AdresaPropiski},
  Propiska_Builds_Add in 'Propiska_Builds_Add.pas' {BuildsFormAdd_Propi},
  St_Loader_Unit,
  st_ConstUnit,
  St_Proc,
  uPwdDecrypt,
  st_Sprav in 'st_Sprav.pas' {frmSprav},
  st_ReportShow in 'st_ReportShow.pas' {frmReportShow},
  st_SpravReportSettings in 'st_SpravReportSettings.pas' {frmSpravReportSettings},
  cn_ExtraFilter_Unit in 'cn_ExtraFilter_Unit.pas' {frmExtraFilter},
  st_PaspData in 'st_PaspData.pas' {frmPaspData},
  uPost_choose in 'uPost_choose.pas' {frmPost_choose};

// процедура чтения ини-файла



{$R *.RES}


var
APP_PATH,DB_PATH,DB_SERVER,DB_USER,DB_PASSWORD,INI_FILENAME :string ; // понятно :)
//UniqueMapping : THandle; // хэндл страницы памяти
//FirstWindow : THandle; // хэндл родительского окна
PLanguageIndex: byte;

// процедура чтения версии файла
function CurrentFileInfo(NameApp : string) : string;
var dump: DWORD;
    size: integer;
    buffer: PChar;
    VersionPointer, TransBuffer: PChar;
    Temp: integer;
    CalcLangCharSet: string;
begin
  size := GetFileVersionInfoSize(PChar(NameApp), dump);
  buffer := StrAlloc(size+1);
  try
   GetFileVersionInfo(PChar(NameApp), 0, size, buffer);

   VerQueryValue(buffer, '\VarFileInfo\Translation', pointer(TransBuffer),
dump);
   if dump >= 4 then
    begin
     temp:=0;
     StrLCopy(@temp, TransBuffer, 2);
     CalcLangCharSet:=IntToHex(temp, 4);
     StrLCopy(@temp, TransBuffer+2, 2);
     CalcLangCharSet := CalcLangCharSet+IntToHex(temp, 4);
    end;

   VerQueryValue(buffer, pchar('\StringFileInfo\'+CalcLangCharSet+
             '\'+'FileVersion'), pointer(VersionPointer), dump);
   if (dump > 1) then
    begin
     SetLength(Result, dump);
     StrLCopy(Pchar(Result), VersionPointer, dump);
    end
   else Result := '0.0.0.0';
  finally
    StrDispose(Buffer);
  end;
end;




procedure ReadIniFile; // процедура чтения ини-файла
  var
   sqlcode: LongInt;
  local_buffer: array[0..FIBHugeLocalBufferLength - 1] of char;
  vIBMessage:string;
  vSQLMessage:string;
  status_vector: PISC_STATUS;
  IBErrorMessages: TIBErrorMessages;
   tmpStr  :string;
   IniFile : TIniFile;
begin
    INI_FILENAME:='config.ini';
    APP_PATH := ExtractFileDir(Application.ExeName) + '\';
    SplashForm.Load_Label.Left:=100;
    SplashForm.Load_Label.Caption:= st_ConstUnit.st_ReadIni[PLanguageIndex];
    SplashForm.Update;
    if not FileExists(APP_PATH + INI_FILENAME)
    then begin
            MessageBox(Application.Handle,'Ошибка чтения INI-файла. В каталоге программы INI-файл не найден. Проверьте размешение файла. ','Ошибка размещения',MB_OK +MB_ICONERROR);
            Application.Terminate;
            exit;
            end
     else begin
                  IniFile          := TIniFile.Create(APP_PATH + INI_FILENAME);
                  DB_PATH          := IniFile.ReadString('CONNECTION', 'Path', DB_PATH);
                  DB_SERVER        := IniFile.ReadString('CONNECTION', 'Server', DB_SERVER);
                  DB_USER          := IniFile.ReadString('CONNECTION', 'User', DB_USER);
                  DB_PASSWORD:= PwdDeCrypt(IniFile.ReadString('CONNECTION', 'Password_Crypted', DB_PASSWORD));
                  MainForm.DB_PATH := DB_SERVER+':'+DB_PATH;//fibGetCurrentDBPath
                  IniFile.Free;

    SplashForm.Load_Label.Left:=90;
    SplashForm.Load_Label.Caption:=st_ConstUnit.st_ReadDB[PLanguageIndex];
    SplashForm.Update;
    with datamodule1.DB do begin
    if Connected then Close;
   { DatabaseName :=DB_SERVER+ ':'+DB_PATH;
    DBParams.Values['USER_NAME']:=DB_USER;
    DBparams.Values['PASSWORD'] :=DB_PASSWORD  ;}
    Handle := AccessResult.DB_Handle;
      DataModule1.ReadTimestampDataSet.SelectSQL.Clear;
      DataModule1.ReadTimestampDataSet.SelectSQL.Text:='select CUR_TIMESTAMP from ST_GET_CURRENT_TIMESTAMP';
      DataModule1.ReadTimestampDataSet.Open;
      DataModule1.CURRENT_TIMESTAMP:= DataModule1.ReadTimestampDataSet['CUR_TIMESTAMP'];
      DataModule1.ReadTimestampDataSet.close;
      //DataModule1.FirstConnectToDatabase:=false;
    // обработка всех видов ошибок
try
    //Open;
except
on EFIBInterBaseError do begin

  status_vector := StatusVector;
  IBErrorMessages := GetIBErrorMessages;
  sqlcode := ClientLibrary.isc_sqlcode(status_vector);
  vIBMessage:='';
  vSQLMessage:='';

  if (ShowSQLMessage in IBErrorMessages) then
  begin
    ClientLibrary.isc_sql_interprete(sqlcode, local_buffer, FIBLocalBufferLength);
    vSQLMessage:=string(local_buffer);
    if Length(vSQLMessage)>0 then
    if (vSQLMessage[Length(vSQLMessage)] <> '.') then
      vSQLMessage := vSQLMessage + '.';

  end;
  if (ShowIBMessage in IBErrorMessages) then
  begin
    vIBMessage:='';
    while (ClientLibrary.isc_interprete(local_buffer, @status_vector) > 0) do
    begin
      tmpStr  :=String(local_buffer);
      if Length(tmpStr)>0 then
      begin
        vIBMessage:=vIBMessage+tmpStr;
        if (vIBMessage[Length(vIBMessage)] <> '.') then
          vIBMessage := vIBMessage + '.';
        vIBMessage := vIBMessage ;
      end;
    end;
  end;
    if tmpStr ='unassigned code' then
    tmpStr:='--Несоответствие версии базы данных. ';
    if tmpStr = 'Your user name and password are not defined. Ask your database administrator to set up a Firebird login.' then
       tmpStr:= 'Имя Пользователя и Пароль не приняты. ';
    tmpStr:=tmpStr+'Обратитесь к администратору.';
    MessageBox(Application.Handle,pchar(tmpStr),'Помилка!', MB_OK +MB_ICONERROR);
    Application.Terminate;
    exit;
    end
    else
    begin
    MessageBox(Application.Handle,'Неизвестное программное исключение. Программа будет закрыта. Обратитесь к разработчикам.','Ошибка!',MB_OK +MB_ICONERROR);
    if CallTerminateProcs then   PostQuitMessage(0);
    //Application.Terminate;
    exit;
    end;
    end;
    end;
    with  datamodule1 do
    begin
     WriteTransaction.Active:=true;
     ReadTransaction.Active:=true;
    end;
     end;
     SplashForm.Load_Label.Left:=144;
     SplashForm.Load_Label.Caption:=st_ConstUnit.st_GoodLoad[PLanguageIndex];
     SplashForm.Update;
end;


begin
  // создаю уникальную страницу памяти
{ UniqueMapping:=CreateFileMapping($ffffffff, nil, PAGE_READONLY, 0, 32, 'Only1Map');
 if UniqueMapping = 0 then
  begin
  Showmessage(SysErrorMessage(GetLastError));
  Halt;
  end
  else if GetLastError = ERROR_ALREADY_EXISTS then
  begin
  FirstWindow:=FindWindowEx(0,0,'TMainForm', nil);
   if FirstWindow <> 0 then
  // если свернуто - восстановим !
  // if IsIconic(FirstWindow) then begin
  // Application.MainForm.WindowState := wsNormal;
   ShowWindow(FirstWindow, sw_restore);
  //  end;
   SetForegroundWindow(FirstWindow);    // если есть копия - поверх всех , блин
   Halt;
   end;
// убивание других копий программы закончено
// теперь, собственно, пошла работа самого приложения}
  Application.Initialize;
  Application.Title := 'Вхід до системи';
  St_Proc.LanguageSwitch();
  PLanguageIndex:=               St_Proc.cnLanguageIndex;
  AccessResult:= Load_St_Access(Application);
  if AccessResult.ID_User <> 0 then begin
  SplashForm := TSplashForm.Create(Application);    // делаю сплеш
  SplashForm.Load_Label.Caption:=st_ConstUnit.st_Load_Splash[PLanguageIndex];
  SplashForm.Studsity_Label.Caption := st_ConstUnit.st_Application[PLanguageIndex];
  SplashForm.Show;
  SplashForm.Update;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmPost_choose, frmPost_choose);
  // Application.CreateForm(TfrmExtraFilter, frmExtraFilter);
 // Application.CreateForm(TfrmPrint, frmPrint);
  // криейт главной формы
 // Application.Title := st_ConstUnit.st_Application_Caption[St_Proc.cnLanguageIndex()];
  MainForm.FileInfo:=CurrentFileInfo(Application.ExeName);
  Application.CreateForm(TDataModule1, DataModule1);
  ReadIniFile;
  SplashForm.Load_Label.Caption:=st_ConstUnit.st_AllMostOver[PLanguageIndex];
  SplashForm.Update;
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;    // поехали...
  end
  else
  Application.Terminate;
end.
