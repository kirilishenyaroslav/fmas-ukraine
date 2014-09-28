unit Gar_Loder_Ved ;

interface

uses gar_Types, Gar_Ved_MainForm, ZProc;

function View_Ved_MainForm(Param:TgarSimpleParam):Variant;stdcall;
exports View_Ved_MainForm;

implementation

function View_Ved_MainForm(Param:TgarSimpleParam):Variant;
begin
  if IsMDIChildFormShow(TFMainVed) then Exit;
  FMainVed := TFMainVed.create(Param);
end;



end.
 