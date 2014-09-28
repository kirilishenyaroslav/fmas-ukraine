unit uSp_tarif_Loader;

interface
uses Classes, st_Common_Types, Forms, st_Common_Funcs, uSp_tarif_Main;

function ShowSpTarif(AParameter:TstSimpleParams):Variant;stdcall;
exports  ShowSpTarif;

implementation

function ShowSpTarif(AParameter:TstSimpleParams):Variant;stdcall;
var
 ViewForm : Tfrm_tarif_main;
begin
  if IsMDIChildFormShow(Tfrm_tarif_main) then exit;
  ViewForm := Tfrm_tarif_main.Create(AParameter);
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


