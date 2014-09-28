unit gr_SpSmetUnitLoader;

interface
uses Classes, IBase, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants, gr_uCommonLoader,
     gr_SpSmetMainForm;

function View_SpSmet(Param: TgrSimpleParam):variant;stdcall;
exports View_SpSmet;

implementation

uses Math;

function View_SpSmet(Param:TgrSimpleParam):variant;stdcall;
var Main:TFGr_SmetForm;
    res:variant;
begin
  Main:=TFGr_SmetForm.Create(Param.Owner,Param.DB_Handle);
  if(Main.ShowModal=mrYes)then
    res:=Main.Result;
  View_SpSmet:=res;
end;

end.
