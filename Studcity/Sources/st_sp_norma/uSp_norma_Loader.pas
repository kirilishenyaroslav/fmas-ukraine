unit uSp_norma_Loader;

interface
uses Classes, st_Common_Types, Forms, st_Common_Funcs, uSp_norma_Main;

function ShowSpNorma(AParameter:TstSimpleParams):Variant;stdcall;
exports  ShowSpNorma;

implementation

function ShowSpNorma(AParameter:TstSimpleParams):Variant;stdcall;
var
 ViewForm : Tfrm_norma_main;
begin
  if IsMDIChildFormShow(Tfrm_norma_main) then exit;
  ViewForm := Tfrm_norma_main.Create(AParameter);
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


