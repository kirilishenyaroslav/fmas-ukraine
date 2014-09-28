program Personal_income;

uses
  Forms,
  Controls,
  uPersonal_income in 'uPersonal_income.pas' {FormPI},
  uPIOptionInterfase in 'OptionInterfase\uPIOptionInterfase.pas' {FormOptionInterfase},
  uPIOptionWork in 'OptionWork\uPIOptionWork.pas' {FormOptionWork},
  uLoginPI in 'Login\uLoginPI.pas' {FormLoginPI};

{$R *.res}
{$IMPLICITBUILD OFF}

begin
  Application.Initialize;
  Application.Title := 'Підсистема підготовки та формування персоніфікованої звітності в Міністерство Доходів';
  {//Application.CreateForm(TFormLoginPI, FormLoginPI);

  FormLoginPI := TFormLoginPI.Create(Application);
  If FormLoginPI.ShowModal = mrOk then
  begin
    Application.CreateForm(TFormPI, FormPI);
    Application.CreateForm(TFormOptionWork, FormOptionWork);
    Application.Run;
  end
  else
  begin
    FormLoginPI.Free;
    Application.Terminate;
  end;
   }
    Application.CreateForm(TFormPI, FormPI);
  Application.CreateForm(TFormOptionWork, FormOptionWork);
  Application.CreateForm(TFormLoginPI, FormLoginPI);
  Application.Run;


end.
