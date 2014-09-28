unit gar_Loader_Comulative_HelpList;

interface

uses gar_Dm_Comulative_HelpList, ibase, Controls,
Classes, PackageLoad, gar_Types, gar_Filter_Comulative_HelpList;


function View_Comulative_HelpList(Param:TgarSimpleParam):Variant;stdcall;
  exports View_Comulative_HelpList;

implementation

function View_Comulative_HelpList(Param:TgarSimpleParam):Variant;
var
  Form:TFFilterComulativeList_FIO;
  Param_Loc:Tgar_ComulativeList_Period;
begin
  Param_Loc:=Tgar_ComulativeList_Period.Create;
  Param_Loc.DB_Handle:=Param.DB_Handle;
  Param_Loc.Owner:=Param.Owner;
  Form:=TFFilterComulativeList_FIO.Create(Param_Loc);
  if Form.ShowModal=mrYes then
    begin
      DM:=TDM.Create(Param_Loc);
      DM.Destroy;
    end
  else
    Result:=False;
  Form.Free;
end;



end.
