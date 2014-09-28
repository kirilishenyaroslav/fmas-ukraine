program UpdateSystem;

uses
  Forms,
  Dialogs,
  Controls,
  Windows,
  SysUtils,
  MainUnit in 'MainUnit.pas' {MainForm},
  LogInFormUnit in 'LoginForm\LogInFormUnit.pas' {LogInForm},
  DMUnit in 'DMUnit.pas' {DM: TDataModule},
  Consts in 'Consts.pas',
  ProcessUnit in 'CryptSystem\ProcessUnit.pas' {ProcessForm};

{$R *.res}

begin
    Application.Initialize;

    Application.Title := 'Система применения обновлений';
  Application.CreateForm(TDM, DM);
  if not DM.AllOkWhileStartup then begin
        Dm.Free;
        exit;
    end;

    Application.CreateForm(TLogInForm, LogInForm);
    Application.CreateForm(TMainForm, MainForm);
    Application.Run;

    //LoginForm.ShowModal;
end.
