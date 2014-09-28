unit ZSpGroupSmetUnitLoader;

interface
uses Classes, IBase, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants, gr_uCommonLoader,
     ZSpGroupSmetMainForm, ZTypes;

function View_SpGroupSmet(Parameter:TZSpGroupSm):variant;stdcall;
exports View_SpGroupSmet;

implementation

uses Math;

function View_SpGroupSmet(Parameter:TZSpGroupSm):variant;stdcall;
var Main:TFZGroupSmetForm;
    res:variant;
begin
  Main:=TFZGroupSmetForm.Create(Parameter);
  if(Main.ShowModal=mrYes)then
    res:=Main.Result;
  View_SpGroupSmet:=res;
end;

end.
