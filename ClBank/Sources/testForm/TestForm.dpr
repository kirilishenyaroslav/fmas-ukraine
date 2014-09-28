program TestForm;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Система "Клиент-Банк"';
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.Run;
end.
