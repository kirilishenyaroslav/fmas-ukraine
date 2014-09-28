program ObmenView_Project;

uses
  Forms,
  SysUtils,
  Windows,
  MainUView in 'MainUView.pas' {MainForm},
  SYS_OPTIONS in 'sys_options.pas',
  BaseTypes in 'BaseTypes.pas',
  datamodule in 'datamodule.pas' {dm: TDataModule},
  Splash in 'Splash.pas' {SplashForm};

{$R *.res}

var
 tagMutex   : THandle;
begin
   Application.Initialize;
   Application.Title := 'Перегляд обміну даними';
  ShortDateFormat := 'dd.MM.yyyy';
   DecimalSeparator := ',';
   with TSplashForm.Create(nil) do begin
    Show;
    Update;

    tagMutex := CreateMutex(nil, False, 'ObmenView_GPP');
    if WaitForSingleObject(tagMutex, 0) <> Wait_TimeOut then begin
     Application.CreateForm(Tdm, dm);
     APP_PATH := ExtractFileDir(Application.ExeName) + '\';
     ReadIniFile;
     DM.DataBase.DBName := DB_PATH;
     DM.DataBase.ConnectParams.UserName := DB_USER;
     DM.DataBase.ConnectParams.Password := DB_PASSWORD;

     Label2.Caption := 'Підключення до БД';
     Update;
     try DM.DataBase.Connected := true;
         DM.ReadTransaction.StartTransaction;
     except
      begin
       agShowMessage('Неможна з''єднатися з базою даних!');
       dm.Free;
       Exit;
      end
     end;

     Label2.Caption := 'Вибір даних...';
     Update;

     Application.CreateForm(TMainForm, MainForm);

     Label2.Caption := 'Майже все...';
     Update;

     Free;
     Application.Run;
    end
    else begin
     SplashForm.Free;
     agShowMessage('Ви не можете запустити двох програм одночасно!');
    end;
   end;
end.
