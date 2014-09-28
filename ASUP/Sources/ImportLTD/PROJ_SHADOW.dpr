program PROJ_SHADOW;

uses
  Forms,
  CONN_FORM in 'CONN_FORM.pas' {Form1},
  CRC32 in 'CRC32.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
