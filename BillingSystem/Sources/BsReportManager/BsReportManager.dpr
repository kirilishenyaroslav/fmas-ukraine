program BsReportManager;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uOptions in 'uOptions.pas' {frmOptions},
  uConnectionParams in 'uConnectionParams.pas' {frmConnectionParams},
  uSys in 'uSys.pas',
  uReportDesigner in 'uReportDesigner.pas' {frmReportDesigner},
  uGroupEdit in 'uGroupEdit.pas' {frmGroupEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Менеджер отчетов';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmConnectionParams, frmConnectionParams);
  Application.CreateForm(TfrmReportDesigner, frmReportDesigner);
  Application.CreateForm(TfrmGroupEdit, frmGroupEdit);
  Application.Run;
end.
