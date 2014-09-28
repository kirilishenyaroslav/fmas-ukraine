unit uSpTextOrderLoader;

interface
uses Classes, uSpTextOrder, ucs_types, Forms, ucs_Loader;

function ShowSpTextOrder(AParameter:TcsParamPacks):Variant;stdcall;
exports  ShowSpTextOrder;

implementation

function ShowSpTextOrder(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmSpTextOrderMain;
begin
  ViewForm := TfmSpTextOrderMain.Create(AParameter);
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
