unit uTextOrderLoader;

interface
uses Classes, uTextOrderMain, ucs_Types, Forms, uCS_loader;

function ShowTextOrder(AParameter:TcsParamPacks):Variant;stdcall;
exports  ShowTextOrder;

implementation

function ShowTextOrder(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmTextOrderMain;
begin
  if AParameter.Formstyle = fsMDIChild then

  ViewForm := TfmTextOrderMain.Create(AParameter);
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
  Result:=ViewForm.res;
end;

end.
