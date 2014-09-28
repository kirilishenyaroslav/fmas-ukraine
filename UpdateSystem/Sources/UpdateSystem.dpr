program UpdateSystem;

uses
  Forms,
  Dialogs,
  Controls,
  Windows,
  SysUtils,
  IniFiles,
  MainUnit in 'MainUnit.pas' {MainForm},
  DMUnit in 'DMUnit.pas' {DM: TDataModule},
  Consts in 'Consts.pas',
  ProcessUnit in 'CryptSystem\ProcessUnit.pas' {ProcessForm},
  Splash in 'Splash.pas';

{$R *.res}

function ReadIniFile : boolean;
var
 IniFile  : TIniFile;
begin
 Result := False;

 try
  DM.ProgramPath := ExtractFilePath(Application.ExeName);

  IniFile := TIniFile.Create(DM.ProgramPath + 'update.ini');

  DM.DBPath := IniFile.ReadString('Database', 'Path', '');
  DM.DontKillLog := (IniFile.ReadString('Params','DontKillLog','F') = 'T');

  DM.AllOkWhileStartup := True;

  IniFile.Free;
 except
  ShowMessage('Файл конфигурации [' + DM.ProgramPath + 'update.ini] не найден либо содержит некорректные данные!');
  Exit;
 end;

 Result := True;
end;


begin
 Application.Initialize;

 Application.Title := 'Система применения обновлений';
 ShortDateFormat   := 'dd.MM.yyyy';
 DecimalSeparator  := ',';

 with TSplashForm.Create(nil) do begin
  Height := 134;
  Show;
  Update;

  Application.CreateForm(TDM, DM);
  if not ReadIniFile then begin
   DM.Free;
   Free;
   Exit;
  end;

  ConnectLabel.Visible := False;
  Timer.Enabled := True;
  Hide;
  Hide;

  if ShowModal <> mrOk then begin
   dm.Free;
   Exit;
  end;

  Application.CreateForm(TMainForm, MainForm);
  Application.Run;

    //LoginForm.ShowModal;
 end;
end.
