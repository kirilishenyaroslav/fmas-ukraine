unit uGrantTypeLoader;

interface
uses Classes, uGrantTypeMain, ucs_types, Forms, ucs_Loader;

function ShowGrantType(AParameter:TcsParamPacks):Variant;stdcall;
exports  ShowGrantType;

implementation

function ShowGrantType(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmGrantTypeMain;
begin
  ViewForm := TfmGrantTypeMain.Create(AParameter);
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
