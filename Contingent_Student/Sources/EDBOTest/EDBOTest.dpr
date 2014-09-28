program EDBOTest;

uses
  Forms,
  Test in 'Test.pas' {TestUnitForm},
  EDBOGuidesToFMASService in '..\EDBOIntf\EDBOGuidesToFMASService.pas',
  EDBOPersonToFMASService in '..\EDBOIntf\EDBOPersonToFMASService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTestUnitForm, TestUnitForm);
  Application.Run;
end.
