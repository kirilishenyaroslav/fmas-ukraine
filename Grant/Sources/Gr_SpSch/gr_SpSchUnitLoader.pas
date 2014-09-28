unit gr_SpSchUnitLoader;

interface
uses Classes, IBase, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants, gr_uCommonLoader,
     gr_SpSchMainForm;

function View_SpSch(Param: TgrSimpleParam;SchProp:integer):variant;stdcall;
exports View_SpSch;

implementation

uses Math;

function View_SpSch(Param:TgrSimpleParam;SchProp:integer):variant;stdcall;
var Main:TFGr_SchForm;
    res:variant;
begin
  Main:=TFGr_SchForm.Create(Param.Owner,Param.DB_Handle, Param.KodCur, SchProp);
  if(Main.ShowModal=mrYes)then
    res:=Main.Result;
  View_SpSch:=res;
end;

end.
