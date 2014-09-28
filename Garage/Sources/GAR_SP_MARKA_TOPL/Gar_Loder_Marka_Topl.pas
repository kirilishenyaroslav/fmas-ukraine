unit Gar_Loder_Marka_Topl;

interface

uses gr_uCommonLoader, Gar_MainMarka_Topl, ZProc;

function View_Marka_Topl(Param:TgrSimpleParam):Variant;stdcall;
exports View_Marka_Topl;

implementation

function View_Marka_Topl(Param:TgrSimpleParam):Variant;
begin
  if IsMDIChildFormShow(TFMainMarkaTopl) then Exit;
  FMainMarkaTopl:=TFMainMarkaTopl.create(Param);
end;



end.
 