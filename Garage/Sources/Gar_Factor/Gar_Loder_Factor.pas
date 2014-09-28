unit Gar_Loder_Factor;

interface

uses gar_Types, gar_SP_FACTOR, ZProc, Forms;

function View_FACTOR_MainForm(Param:TgarSimpleParamMode):Variant;stdcall;
exports View_FACTOR_MainForm;

implementation

function View_FACTOR_MainForm(Param:TgarSimpleParamMode):Variant;
begin
  if IsMDIChildFormShow(TFFactor) then Exit;
  FFactor := TFFactor.create(Param);
  case Param.fs of
    garfsSelect:
                begin
                  FFactor.FormStyle:=fsNormal;
                  FFactor.Visible:=False;
                  FFactor.ShowModal;
                  View_FACTOR_MainForm:=FFactor.Res;
                end;
    garfsInsert:
                begin
                  FFactor.FormStyle:=fsMDIChild;
                  FFactor.Show;
                end
  end;
end;

end.
