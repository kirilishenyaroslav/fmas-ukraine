program IBUpdateBuilder;

uses
  Forms,
  Main in '..\Main\Main.pas' {fmMain},
  uUtils in '..\Utils\uUtils.pas',
  uTypes in '..\Types\uTypes.pas',
  uLib in '..\Lib\uLib.pas',
  uSearch in '..\fmSearch\uSearch.pas' {fmSearch};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Конструктор обновлеий';
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
