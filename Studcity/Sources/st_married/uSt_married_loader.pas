unit uSt_married_loader;

interface
uses Classes, st_Common_Types, Forms, st_Common_Funcs, uSt_married_main;

function st_married(AParameter:TstSimpleParams):Variant;stdcall;
exports  st_married;

implementation

function st_married(AParameter:TstSimpleParams):Variant;stdcall;
var
 ViewForm : TfrmMarried;
begin
  if IsMDIChildFormShow(TfrmMarried) then exit;
  ViewForm := TfrmMarried.Create(AParameter.Owner);
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
