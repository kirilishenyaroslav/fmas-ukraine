program DosImportProcess;

uses
  Forms,
  IniFiles,
  SysUtils,
  Windows,
  MainImport in 'MainImport.pas' {frmImportMain},
  UImportThread in 'UImportThread.pas';

{$R *.res}

var
   IniFile : TIniFile;
   APP_PATH: String;
   DB_PATH : String;
   DB_SERVER:String;
   DB_USER  :String;
   DB_PASSWORD:String;
begin
  Application.Initialize;
  IniFile:=nil;
  APP_PATH := ExtractFileDir(Application.ExeName) + '\';
  if not FileExists(APP_PATH + 'config.ini')
  then begin
            MessageBox(Application.Handle,PChar('Ini file not found'),PChar('Error'),MB_OK and MB_ICONERROR);
            Application.Terminate;

  end
  else begin
              try
                  IniFile        := TIniFile.Create(APP_PATH + 'config.ini');
                  DB_PATH        := IniFile.ReadString('CONNECTION', 'Path', DB_PATH);
                  DB_SERVER      := IniFile.ReadString('CONNECTION', 'Server', DB_SERVER);
                  DB_USER        := IniFile.ReadString('CONNECTION', 'User', DB_USER);
                  DB_PASSWORD    := IniFile.ReadString('CONNECTION', 'Password', DB_PASSWORD);
              finally
                  IniFile.Free;
              end;
  end;
  Application.CreateForm(TfrmImportMain, frmImportMain);
  frmImportMain.ConnectionString:=DB_SERVER+':'+DB_PATH;
  frmImportMain.ConnectionUser  := DB_USER;
  frmImportMain.ConnectionPsswrd:=DB_PASSWORD;
  Application.Run;
end.
