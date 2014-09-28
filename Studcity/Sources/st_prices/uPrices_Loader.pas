unit uPrices_Loader;

interface
uses Classes, st_Common_Types, Forms, st_Common_Funcs, uPrices_Main;

function ShowSPPrices(AParameter:TstSimpleParams):Variant;stdcall;
exports  ShowSPPrices;

implementation

function ShowSPPrices(AParameter:TstSimpleParams):Variant;stdcall;
var
 ViewForm:TfrmPrice_Main;
begin
  if IsMDIChildFormShow(TfrmPrice_Main) then exit;
  ViewForm := TfrmPrice_Main.Create(AParameter);
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
