unit gr_Stud_Group_Loader;

interface

uses Classes, IBase, gr_MainGG, ZProc,
     Controls, gr_uCommonLoader,gr_uCommonTypes,gr_uCommonProc,Dates,variants,
     dxBar, Dialogs, gr_Filter_Stud_Group;

function View_GroupGrant(AParameter:TgrSimpleParam):Variant;stdcall;
exports View_GroupGrant;

implementation

function View_GroupGrant(AParameter:TgrSimpleParam):Variant;
var
  FGroupGrant: TFGroupGrant;
begin
  if ((IsMDIChildFormShow(TClass(TFGroupGrant))) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  FGroupGrant:=TFGroupGrant.Create(AParameter.Owner,AParameter.DB_Handle);
end;

end.

