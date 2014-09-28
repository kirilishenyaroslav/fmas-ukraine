program VC_ImExpProject;

uses
  Forms,
  inifiles,
  SysUtils,
  Windows,
  Messages,
  Dialogs,
  VC_ImExp in 'VC_ImExp.pas' {MainForm},
  DM in 'DM.pas' {DM_IE: TDataModule},
  Access_Unit in 'Access_Unit.pas' {frmAccess},
  vc_SpBonus in 'vc_SpBonus.pas' {frmBonus};

{$R *.res}
var
APP_PATH,DB_PATH,DB_SERVER,DB_USER,INI_FILENAME :string;
AccessResult: TAccessResult;

procedure ReadIniFile;
  var
   IniFile : TIniFile;
  begin
    INI_FILENAME:='config.ini';
    APP_PATH := ExtractFileDir(Application.ExeName) + '\';

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
                 // DB_PASSWORD      := 'masterkey'; //PwdDeCrypt(IniFile.ReadString('CONNECTION', 'Password_Crypted', DB_PASSWORD));
                  MainForm.config_path:=APP_PATH + INI_FILENAME;
                  MainForm.DB_PATH := DB_SERVER+':'+DB_PATH; //fibGetCurrentDBPath;
                  MainForm.ConnectionString := IniFile.ReadString('MSSERVER', 'ConnectionString', '');
                  IniFile.Free;


    with DM_IE.DB do
     begin
      if Connected then Close;
    // DatabaseName :=DB_SERVER+ ':'+DB_PATH;
    // DBParams.Values['USER_NAME']:=DB_USER;
    // DBparams.Values['PASSWORD'] :=DB_PASSWORD  ;
       Handle := AccessResult.DB_Handle;
    end;
   try
    DM_IE.DB.open;
   except
    MessageBox(Application.Handle,'Невідоме програмне виключення','Помилка', MB_OK +MB_ICONERROR);
   end;
  end;
end;


begin
  Application.Initialize;
  Application.Title := 'ВЦ Иморт-Экспорт';
  Application.CreateForm(TfrmAccess, frmAccess);
  frmAccess.ShowModal;
  AccessResult:= frmAccess.AccessResult;
  frmAccess.Free;
  if AccessResult.ID_User <> 0 then begin
     Application.CreateForm(TMainForm, MainForm);
     Application.CreateForm(TDM_IE, DM_IE);
     ReadIniFile;
     Application.Run;
   end
   else
     Application.Terminate;
end.
