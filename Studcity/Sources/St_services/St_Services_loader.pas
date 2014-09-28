unit St_Services_loader;

interface

uses Classes, St_Common_Types, Forms, Controls, St_Common_Funcs, St_Services_Main,
     Variants;

function getServices(AParameter:TstSimpleParams):Variant;stdcall;
exports getServices;

implementation

function getServices(AParameter:TstSimpleParams):Variant;stdcall;
var
  ViewForm : TfrmService_Main;
begin
  if IsMDIChildFormShow(TfrmService_Main) then exit;

  ViewForm := TfrmService_Main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

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
