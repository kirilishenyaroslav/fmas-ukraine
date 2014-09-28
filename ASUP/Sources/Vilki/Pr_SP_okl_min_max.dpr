program Pr_SP_okl_min_max;

uses
  Forms,
  U_SPoklminmax in 'U_SPoklminmax.pas' {Form_SP_OKL_MIN_MAX},
  UAddVilka in 'UAddVilka.pas' {Form_Add_Vilka,},
  uSearchFrame in 'C:\Program Files\Components for Delphi\SpLib\uSearchFrame.pas' {fmSearch: TFrame},
  UChangeVGroup in 'UChangeVGroup.pas' {Form_Change_Group},
  UChangeMinMax in 'UChangeMinMax.pas' {Form_ChangeMinMax};

//  uSearchFrame in 'C:\Program Files\Borland\components\SpLib\uSearchFrame.pas' {fmSearch: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_SP_OKL_MIN_MAX, Form_SP_OKL_MIN_MAX);
  Application.Run;
end.
