program Obmen_Project;

uses
  Forms,
  SysUtils,
  Windows,
  Controls,
  MainU in 'MainU.pas' {Obmen_Form},
  datamodule in 'datamodule.pas' {dm: TDataModule},
  SYS_OPTIONS in 'sys_options.pas',
  BaseTypes in 'BaseTypes.pas',
  Splash in 'Splash.pas' {SplashForm},
  SetInitOptions in 'SetInitOptions.pas' {SetInitOptions_Form};

{$R *.res}

var
 i : integer;
begin
 Application.Initialize;
 Application.Title := 'Система обміну даними';
 ShortDateFormat := 'dd.MM.yyyy';
 DecimalSeparator := '.';

 for i := 1 to ParamCount do	begin
  if ParamStr(i) = 'iddqd'  then ADMIN_MODE   := True;
  if ParamStr(i) = 'idclip' then NO_PASS_MODE := True;
 end;

 with TSplashForm.Create(nil) do begin
  Height := 134;
  Show;
  Update;

  Application.CreateForm(Tdm, dm);
  APP_PATH := ExtractFileDir(Application.ExeName) + '\';

  if not ReadIniFile then begin
   ShowMessage('Файл конфігурації [' + INI_FILENAME + '] не знайдено або відсутні необхідні інструкції у ньому!');
   dm.Free;
   Free;
   Exit;
  end;

  ConnectLabel.Visible := False;
  Timer.Enabled := True;
  Hide;

  if ShowModal <> mrOk then begin
   dm.Free;
   Exit;
  end;

  UserNameEdit.Enabled := False;
  PasswordEdit.Enabled := False;

  try DM.DataBase.Handle := AccessResult.Connection;
      DM.ReadTransaction.StartTransaction;
  except
   begin
    ShowMessage('Неможна з''єднатися з базою даних!');
    dm.Free;
    Exit;
   end
  end;

  try sys_ReadOptions(DM.ReadTransaction);
  except
   begin
    ShowMessage('Не знайдена системна інформація!');
    dm.Free;
    Exit;
   end
  end;

  Application.CreateForm(TObmen_Form, Obmen_Form);

  Application.Run;
 end;
end.
