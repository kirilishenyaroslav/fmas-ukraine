program Contracts;

uses
  Forms,
  Windows,
  inifiles,
  SysUtils,                   
  Messages,
  Dialogs,
  cnConsts,
  cn_Common_Funcs,
  cn_Common_Types,
  cn_Common_Loader,
  Main_DM in 'Exe\Main_DM.pas' {MainDM: TDataModule},
  Main_Form in 'Exe\Main_Form.pas' {MainForm},
  Splash_Unit in 'Exe\Splash_Unit.pas' {frmSplash},
  uPwdDecrypt,
  cn_Preferences in 'Exe\cn_Preferences.pas' {frmOptions},
  uMDIFormsBar in 'Exe\uMDIFormsBar.pas';

{$R *.res}
var
APP_PATH,DB_PATH,DB_SERVER,DB_USER,DB_PASSWORD,INI_FILENAME :string;
AccessResult: TcnAccessResult;

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

function FullFileInfo(CurrentFileInfo: string): string;
var
w:PAnsiChar;
FileInfo: string;
i, p: integer;
begin
    w:=pchar(CurrentFileInfo);
    i:=StrLen(w);
    FileInfo:='';
    for p:= 0 to i-1 do
    FileInfo:=FileInfo+ w[p];

    MainForm.CurrentFileInfo:=FileInfo;

    FullFileInfo:= cnConsts.cn_FileVersion[cn_Common_Funcs.cnLanguageIndex]+
                   ': '+
                   FileInfo + ' '+cnConsts.cn_AssemblingVersion[cn_Common_Funcs.cnLanguageIndex]
                   +': '+
                   DateToStr(FileDateToDateTime(FileAge(Application.ExeName)));
end;

procedure ReadIniFile;
  var
   IniFile : TIniFile;
  begin
    INI_FILENAME:='config.ini';
    APP_PATH := ExtractFileDir(Application.ExeName) + '\';

    frmSplash.Update;
    if not FileExists(APP_PATH + INI_FILENAME)
    then begin
            MessageBox(Application.Handle,'INI-файл не знайдено!','Помилка',MB_OK +MB_ICONERROR);
            Application.Terminate;
            exit;
            end
     else begin
                  IniFile          := TIniFile.Create(APP_PATH + INI_FILENAME);
                  DB_PATH          := IniFile.ReadString('CONNECTION', 'Path', DB_PATH);
                  DB_SERVER        := IniFile.ReadString('CONNECTION', 'Server', DB_SERVER);
                  DB_USER          := IniFile.ReadString('CONNECTION', 'User', DB_USER);
                  DB_PASSWORD      := PwdDeCrypt(IniFile.ReadString('CONNECTION', 'Password_Crypted', DB_PASSWORD));
                  MainForm.config_path:=APP_PATH + INI_FILENAME;
                  MainForm.DB_PATH := DB_SERVER+':'+DB_PATH; //fibGetCurrentDBPath;
                  IniFile.Free;


    frmSplash.Update;

    with Main_DM.MainDM do
     begin
      if Main_DB.Connected then Main_DB.Close;
 //    DatabaseName :=DB_SERVER+ ':'+DB_PATH;
 //    DBParams.Values['USER_NAME']:=DB_USER;
 //    DBparams.Values['PASSWORD'] :=DB_PASSWORD  ;
       Main_DB.Handle := AccessResult.DB_Handle;
        ReadTimestampDataSet.SelectSQL.Clear;
        ReadTimestampDataSet.SelectSQL.Text:='select CUR_TIMESTAMP from ST_GET_CURRENT_TIMESTAMP';
        ReadTimestampDataSet.Open;
        CURRENT_TIMESTAMP:= ReadTimestampDataSet['CUR_TIMESTAMP'];
        ReadTimestampDataSet.close;
        ReadTransaction.Commit;
    end;
try
    //Main_DM.MainDM.Main_DB.open;
except

    MessageBox(Application.Handle,'Невідоме програмне виключення','Помилка', MB_OK +MB_ICONERROR);
end;

     frmSplash.Update;
end;
end;


begin
  Application.Initialize;
  Application.Title := 'Вхід до системи';
  LanguageSwitch;
  AccessResult:=Load_cnAccess(Application);
  if AccessResult.ID_User <> 0 then
   begin
    frmSplash:= TfrmSplash.Create(application);
    frmSplash.Show;
    frmSplash.cxProgressBar1.Position := 5;
    Application.CreateForm(TMainDM, MainDM);
    frmSplash.cxProgressBar1.Position := 50;
    Application.CreateForm(TMainForm, MainForm);
    frmSplash.cxProgressBar1.Position := 60;
    MainForm.AccessResult:= AccessResult;
    frmSplash.cxProgressBar1.Position := 70;
    ReadIniFile;
    frmSplash.cxProgressBar1.Position := 80;
    MainForm.StatusBar.Hint:= FullFileInfo(CurrentFileInfo(Application.ExeName));
    frmSplash.cxProgressBar1.Position := 85;
    MainForm.ID_USER:=AccessResult.ID_User;
    Application.Run;
   end
  else
   Begin
    Application.Terminate;
   end; 
end.
