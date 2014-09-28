unit Gar_Loder_People;

interface

uses  Gar_MainPeople, Gar_Types, Forms, Dialogs, ZProc;

function View_MainPeople(Param:TgarSimpleParamMode):Variant;stdcall;
exports View_MainPeople;

implementation

function View_MainPeople(Param:TgarSimpleParamMode):Variant;
begin
  if IsMDIChildFormShow(TFMainPeople) then Exit;
  FMainPeople:=TFMainPeople.create(Param);
  case Param.fs of
    garfsSelect:
                begin
                  FMainPeople.FormStyle:=fsNormal;
                  FMainPeople.Visible:=False;
                  FMainPeople.ShowModal;
                end;
    garfsEdit:
                begin
                  FMainPeople.FormStyle:=fsMDIChild;
                  FMainPeople.Show;
                end
  end;
  View_MainPeople:=FMainPeople.Res;
end;



end.
 