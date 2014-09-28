program Dogovor;



uses
  Forms,
  Windows,
  Controls,
  dogLoaderUnit,
  SysUtils,
  DataModule in 'DataModule.pas' {Модуль данных},
  DogUnit in 'dogUnit.pas' {MainForm},
  LoadingUnit in 'LoadingUnit.pas' {LoadingForm},
  dogUtils in 'dogUtils.pas',
  adminUnit in 'adminUnit.pas' {adminForm},
  dogNewsUnit in 'dogNewsUnit.pas' {dogNewsForm};

{$R *.res}
var
 i : Integer;
 nl : Boolean;
 iddqd : Boolean;
begin
  SYS_APP_PATH := ExtractFilePath(Application.ExeName);
  ReadIniFile;
  LoadingForm := TLoadingForm.Create(Nil);
  nl := False;
  iddqd := False;
  for i := 1 to ParamCount do
  begin
    if pos('iddqd', AnsiLowerCase(ParamStr(i))) <> 0 then iddqd := True;
    if pos('nolock', AnsiLowerCase(ParamStr(i))) <> 0 then nl := True;
    if Pos('user', AnsiLowerCase(ParamStr(i))) <> 0 then if i + 1 <= ParamCount then LoadingForm.ForceUserName := ParamStr(i + 1);
    if Pos('password', AnsiLowerCase(ParamStr(i))) <> 0 then if i + 1 <= ParamCount then LoadingForm.ForceUserPass := ParamStr(i + 1);
  end;

{  if iddqd then begin
    isAdmin := true;
    LoadingForm.HideLoginControls;
  end
  else }

  begin
    if not LoadingForm.Logged then  if LoadingForm.ShowModal = mrCancel then
    begin
      LoadingForm.Free;
      exit;
    end;
  end;

  LoadingForm.Show;

  LoadingForm.Update;
  Application.CreateForm(Tdm, dm);

  Application.CreateForm(TMainForm, MainForm);

  MainForm.nolock := nl;
  LoadingForm.Close;
  LoadingForm.Free;
  Application.Run;
end.

