program Test_Departments;

uses
  Forms,
  TestMain in 'TestMain.pas' {TestForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTestForm, TestForm);
  Application.Run;
end.
