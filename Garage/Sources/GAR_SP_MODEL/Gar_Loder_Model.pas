unit Gar_Loder_Model;

interface

uses gr_uCommonLoader, Gar_MainModel, ZProc;

function View_MainModel(Param:TgrSimpleParam):Variant;stdcall;
exports View_MainModel;

implementation

function View_MainModel(Param:TgrSimpleParam):Variant;
begin
  if IsMDIChildFormShow(TFMainModel) then Exit;
  FMainModel:=TFMainModel.create(Param);
end;



end.
 