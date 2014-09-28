program BillingSystem;

uses
  Forms,
  Windows,
  inifiles,
  SysUtils,
  Messages,
  Dialogs,
  uConsts,
  uCommon_Funcs,
  uCommon_Types,
  uCommon_Loader,
  uPwdDecrypt,
  AccMGMT,
  uMain_DM in 'Exe\uMain_DM.pas' {frmMainDM: TDataModule},
  uMain_Form in 'Exe\uMain_Form.pas' {MainForm},
  uMDIFormsBar in 'Exe\uMDIFormsBar.pas',
  uPreferences in 'Exe\uPreferences.pas' {frmOptions},
  uSplash_Unit in 'Exe\uSplash_Unit.pas' {frmSplash},
  uRep_Spr_list in 'Exe\uRep_Spr_list.pas' {frmRep_Spr_list};

{$R *.res}
var
  APP_PATH, DB_PATH, DB_SERVER, DB_USER, DB_PASSWORD, INI_FILENAME : string;
  AccessResult : TbsAccessResult;

// процедура чтения версии файла
function CurrentFileInfo(NameApp : string) : string;
var
  dump : DWORD;
  size : integer;
  buffer : PChar;
  VersionPointer, TransBuffer : PChar;
  Temp : integer;
  CalcLangCharSet : string;
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

function FullFileInfo(CurrentFileInfo: string): string;
var
  w : PAnsiChar;
  FileInfo : string;
  i, p : integer;
begin
  w:=pchar(CurrentFileInfo);
  i:=StrLen(w);
  FileInfo:='';
  For p:= 0 to i-1 do FileInfo:=FileInfo+ w[p];

  MainForm.CurrentFileInfo:=FileInfo;

  FullFileInfo := uConsts.bs_FileVersion[uCommon_Funcs.bsLanguageIndex]+
                   ': '+
                   FileInfo + ' '+uConsts.bs_AssemblingVersion[uCommon_Funcs.bsLanguageIndex]
                   +': '+
                   DateToStr(FileDateToDateTime(FileAge(Application.ExeName)));
end;

procedure ReadIniFile;
var
  IniFile : TIniFile;
//  ResultInfo : TResultInfo;
begin
  INI_FILENAME:='config.ini';
  APP_PATH := ExtractFileDir(Application.ExeName) + '\';

  //frmSplash.Update;
  if not FileExists(APP_PATH + INI_FILENAME) then
   begin
    MessageBox(Application.Handle,'INI-файл не знайдено!','Помилка',MB_OK +MB_ICONERROR);
    Application.Terminate;
    exit;
   end
  else
   begin
    IniFile          := TIniFile.Create(APP_PATH + INI_FILENAME);
    DB_PATH          := IniFile.ReadString('CONNECTION', 'Path', DB_PATH);
    DB_SERVER        := IniFile.ReadString('CONNECTION', 'Server', DB_SERVER);
    DB_USER          := IniFile.ReadString('CONNECTION', 'User', DB_USER);
    DB_PASSWORD      := PwdDeCrypt(IniFile.ReadString('CONNECTION', 'Password_Crypted', DB_PASSWORD));

    MainForm.config_path:=APP_PATH + INI_FILENAME;
    MainForm.DB_PATH := DB_SERVER+':'+DB_PATH;

    IniFile.Free;

    //frmSplash.Update;

    with uMain_DM.frmMainDM do
     begin
      if Main_DB.Connected then Main_DB.Close;
       Main_DB.Handle := AccessResult.DB_Handle;
       ReadTimestampDataSet.SelectSQL.Clear;
       ReadTimestampDataSet.SelectSQL.Text:='select * from BS_GET_SYS_CURRENT_DATE';
       ReadTimestampDataSet.Open;
       CURRENT_TIMESTAMP:= ReadTimestampDataSet['currenttimestamp'];
       ReadTimestampDataSet.close;
       ReadTransaction.Commit;
     end;
    try
     //Main_DM.MainDM.Main_DB.open;
    except
      MessageBox(Application.Handle,'Невідоме програмне виключення','Помилка', MB_OK +MB_ICONERROR);
    end;
    //frmSplash.Update;
   end;
end;

begin
  Application.Initialize;
  Application.Title := 'Вхід до системи';
  Application.CreateForm(TfrmMainDM, frmMainDM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmRep_Spr_list, frmRep_Spr_list);
  //Application.CreateForm(TfrmSplash, frmSplash);
  LanguageSwitch;
  AccessResult := Load_bsAccess(Application);
  if AccessResult.ID_User <> 0 then
   begin
    //frmSplash:= TfrmSplash.Create(application);
    //frmSplash.Show;
    //frmSplash.cxProgressBar1.Position := 5;
    //frmSplash.cxProgressBar1.Position := 50;
    //frmSplash.cxProgressBar1.Position := 60;
    MainForm.AccessResult:= AccessResult;
    //frmSplash.cxProgressBar1.Position := 70;
    ReadIniFile;
    //frmSplash.cxProgressBar1.Position := 80;
    MainForm.StatusBar.Hint:= FullFileInfo(CurrentFileInfo(Application.ExeName));
    //frmSplash.cxProgressBar1.Position := 85;
    MainForm.ID_USER   := AccessResult.ID_User;
    MainForm.is_admin  := AccessResult.is_admin;
    MainForm.Name_user := AccessResult.Name_user;
    MainForm.id_system := AccessResult.id_system;
    Application.Run;
   end
  else Application.Terminate;
end.
