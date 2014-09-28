unit uStudImportInfoLoader;

interface
uses Classes, uStudImportInfoMain, ucs_Types, Forms, uCS_loader;

function ShowStudImportInfo(AParameter:TcsParamPacks):Variant;stdcall;
exports  ShowStudImportInfo;

implementation

function ShowStudImportInfo(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmStudImportInfo;
begin
  if AParameter.Formstyle = fsMDIChild then

  ViewForm := TfmStudImportInfo.Create(AParameter);
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
