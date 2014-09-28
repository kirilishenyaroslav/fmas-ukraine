unit gr_PrintAnalitControl_Loader;

interface

uses gr_PrintAnalitControl_DM, gr_uCommonLoader, ibase, Controls,
gr_uCommonProc, Classes, PackageLoad, Forms, Windows,
Messages, SysUtils, Variants, Graphics,
Dialogs, ZWait;

function View_grPrintAnalitControl(AParameter:TgrAccListParam):Variant;stdcall;
  exports View_grPrintAnalitControl;

implementation

function View_grPrintAnalitControl(AParameter:TgrAccListParam):Variant;
var
  DM: TDM;
  KodSetup:integer;
  res:variant;
  wf:TForm;
begin
  DM:=TDM.Create(TgrSimpleParam(AParameter).Owner);
  KodSetup:=grKodSetup(AParameter.DB_handle);
  AParameter.AnalitControl:=True;
  res:=DoFunctionFromPackage(AParameter,Stud_FilterKodSetup);
  wf:=ShowWaitForm(Application.MainForm);
  if (res>0) then
  begin
    KodSetup:=res;
    DM.ReportCreate(TgrAccListParam(AParameter),KodSetup);
  end;
  DM.Destroy;
  CloseWaitForm(wf);
end;

end.
