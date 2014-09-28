program Monu;

uses
  Forms, uMonuLoader,
  uMain in 'uMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  MON_DB_HANDLE := ShowLoginForm(SYS_NAME);
  if MON_DB_HANDLE = Nil then
  begin
    Application.Terminate;
    exit;
  end;  

  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
