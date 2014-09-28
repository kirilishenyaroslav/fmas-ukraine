unit uSp_effective_area_Loader;

interface
uses Classes, st_Common_Types, Forms, st_Common_Funcs, uSp_effective_area_Main;

function ShowSpEffectiveArea(AParameter:TstSimpleParams):Variant;stdcall;
exports  ShowSpEffectiveArea;

implementation

function ShowSpEffectiveArea(AParameter:TstSimpleParams):Variant;stdcall;
var
 ViewForm : Tfrmeffective_area_main;
begin
  if IsMDIChildFormShow(Tfrmeffective_area_main) then exit;
  ViewForm := Tfrmeffective_area_main.Create(AParameter);
  ViewForm.FormStyle := AParameter.Formstyle;

  case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
  else
   begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
  Result := ViewForm.res;
end;

end.


