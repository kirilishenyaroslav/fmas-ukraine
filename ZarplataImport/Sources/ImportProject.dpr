program ImportProject;

uses
  Forms,
  uMain in 'uMain.pas' {ImportForm},
  uImportDm in 'uImportDm.pas' {ImportDm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TImportForm, ImportForm);
  Application.Run;
end.
