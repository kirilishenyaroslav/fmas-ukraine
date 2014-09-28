unit gar_Load_ComulativeList_by_Avto;

interface

uses classes, ibase, Controls,      variants, gar_Types,
    gar_DM_ComulativeList_By_Avto, gar_Filter_ComulativeList_By_Avto;

function View_ComulativeList_By_Avto(Param:TgarSimpleParam):Variant;stdcall;
  exports View_ComulativeList_By_Avto;

implementation

function View_ComulativeList_By_Avto(Param:TgarSimpleParam):Variant;
var
  Form:TFFilterComulativeList;
  param_loc:Tgar_ComulativeList_By_Avto;
begin
  param_loc:=Tgar_ComulativeList_By_Avto.create;
  param_loc.DB_Handle:=Param.DB_Handle;
  param_loc.Owner:=Param.Owner;
  Form:=TFFilterComulativeList.Create(param_loc);
  if Form.ShowModal=mrYes then
  begin
    DM:=TDM.Create(param_loc);
    DM.Destroy;
  end;
  param_loc.Free;
  Form.Free;
end;

end.
