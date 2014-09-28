unit Gar_Loder_Avto;

interface

uses gar_Types, Gar_MainAvto, Forms, ZProc;

function View_MainAvto(Param:TgarSimpleParamMode):Variant;stdcall;
exports View_MainAvto;

implementation

function View_MainAvto(Param:TgarSimpleParamMode):Variant;
begin
  if IsMDIChildFormShow(TFMainAvto) then Exit;
  FMainAvto:=TFMainAvto.create(Param);
  case Param.fs of
    garfsSelect:
                begin
                  FMainAvto.FormStyle:=fsNormal;
                  FMainAvto.Visible:=False;
                  FMainAvto.ShowModal;
                end;
    garfsEdit:
                begin
                  FMainAvto.FormStyle:=fsMDIChild;
                  FMainAvto.Show;
                end
  end;
  View_MainAvto:=FMainAvto.Res;
end;



end.
 