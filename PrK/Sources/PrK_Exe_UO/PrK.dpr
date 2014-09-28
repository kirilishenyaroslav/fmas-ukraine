program PrK;

uses
  Forms,
  uPrK in 'uPrK.pas' {FormPrK},
  uOptionInterfase in 'OptionInterfase\uOptionInterfase.pas' {FormOptionInterfase},
  uOptionWork in 'OptionWork\uOptionWork.pas' {FormOptionWork},
  uLoginPrK in 'Login\uLoginPrK.pas' {FormLoginPrK};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Приймальна комісія';
  Application.CreateForm(TFormPrK, FormPrK);
  Application.CreateForm(TFormOptionWork, FormOptionWork);
  Application.CreateForm(TFormLoginPrK, FormLoginPrK);
  Application.Run;
end.
