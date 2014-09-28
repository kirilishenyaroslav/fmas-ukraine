{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Главный модуль                                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
program Matas;

uses
  Forms,
  IniFiles,
  SysUtils,
  Dialogs,
  Windows,
  Controls,
  ibase,
  uPwdDeCrypt,
  uResources,
  uMatasUtils,
  uMatasVars,
  dmMain,
  MainForm in 'MainProg\MainForm\MainForm.pas' {MatasMainForm},
  fmAbout in 'MainProg\AboutForm\fmAbout.pas' {AboutForm},
  fmExit in 'MainProg\ExitForm\fmExit.pas' {ExitForm},
  fmLogin in 'MainProg\LoginForm\fmLogin.pas' {LoginForm},
  fmNextPeriod in 'MainProg\NextPeriodForm\fmNextPeriod.pas' {frmNextPeriod},
  fmPeriod in 'MainProg\PeriodForm\fmPeriod.pas' {frmPeriod},
  fmSetup in 'MainProg\SetupForm\fmSetup.pas' {frmSetup},
  fmSplash in 'MainProg\SplashForm\fmSplash.pas' {Splash},
  uMDIFormsBar in 'MainProg\MainForm\uMDIFormsBar.pas';

{$R *.res}

procedure LoadLibraries(AppPath:string; t: TSplash);
var
 Res: WIN32_FIND_DATA;
 ResFile: THandle;
 name, path:string;
begin
 t.PBar.Position:=t.PBar.Position+5;
 t.Update;
 path:=AppPath+'Matas*.bpl';
 ResFile:=FindFirstFile(PChar(path),res);
 name:=String(res.cFileName);
 t.lbProcess.Caption:=MAT_SPLASH_LOAD_BPL+' '+name;
 t.Update;
 LoadPackage(name);
 while FindNextFile(ResFile,res) do
 begin
  name:=String(res.cFileName);
  t.lbProcess.Caption:=MAT_SPLASH_LOAD_BPL+' '+name;
  t.PBar.Position:=t.PBar.Position+20;
  t.Update;
  LoadPackage(name);
 end;
 Windows.FindClose(ResFile);
 t.PBar.Position:=100;
 t.Update;
end;

var
 Splash: TSplash;
 LoginForm: TLoginForm;
begin
  Application.Initialize;
  uMatasUtils.InitCommonVars;
  LoginForm:=TLoginForm.Create(Application);
  if LoginForm.ShowModal=mrCancel then
   Application.Terminate
  else
  begin
   MAIN_DB_HANDLE:=LoginForm.LResult.DBHandle;
   Splash:=TSplash.Create(Application);
   Splash.lbTitle.Caption:=MAT_SYSTEM_FULL_NAME;
   Splash.lbProcess.Caption:=MAT_SPLASH_INIT;
   Splash.Show;
   Splash.Update;
   LoadLibraries(ExtractFilePath(Application.ExeName), Splash);
   Splash.lbProcess.Caption:=MAT_SPLASH_CONNECT;
   Splash.Update;
   Application.Title := 'Облік ТМЦ';
   Application.CreateForm(TMatasMainForm, MatasMainForm);
  dmMatas:=TdmMatas.Create(Application);
   try
    dmMatas.fdbMatas.Close;
    dmMatas.fdbMatas.Handle:=MAIN_DB_HANDLE;
    dmMatas.fdbMatas.Open;
   except on E : Exception
    do begin
     ShowMessage(MAT_STR_CONNECT_ERROR+chr(13)+chr(10)+E.Message);
     Application.Terminate;
    end;
   end;
   _CURRENT_USER_ID:=LoginForm.USER_ID;
   _CURRENT_USER_NAME:=LoginForm.USER_NAME;
   _CURRENT_USER_ID_PCARD:=LoginForm.USER_ID_PCARD;
   _CURRENT_USER_FIO:=LoginForm.USER_FIO;
   Splash.Free;
  end;
  LoginForm.Free;
  Application.Run;
end.



