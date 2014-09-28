unit uSp_Lgota_Loader;

interface
uses Classes, st_Common_Types, Forms, st_Common_Funcs, uSp_Lgota_Main;

function ShowSpLgota(AParameter:TstSimpleParams):Variant;stdcall;
exports  ShowSpLgota;

implementation

function ShowSpLgota(AParameter:TstSimpleParams):Variant;stdcall;
var
 ViewForm : TfrmLgota_main;
begin
  if IsMDIChildFormShow(TfrmLgota_main) then exit;
  ViewForm := TfrmLgota_main.Create(AParameter);
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


