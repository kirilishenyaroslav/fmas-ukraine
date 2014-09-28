program CS;

uses
  Forms,
  uCs in 'uCs.pas' {FormCS},
  uOptionInterfase in 'OptionInterfase\uOptionInterfase.pas' {FormOptionInterfase},
  uOptionWork in 'OptionWork\uOptionWork.pas' {FormOptionWork},
  uLoginCS in 'Login\uLoginCS.pas' {FormLoginCS};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Контингент студентів';
  Application.CreateForm(TFormCS, FormCS);
  Application.CreateForm(TFormOptionWork, FormOptionWork);
  Application.CreateForm(TFormLoginCS, FormLoginCS);
  Application.Run;
end.
