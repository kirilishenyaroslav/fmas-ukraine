unit uSp_Class_Kat_Loader;

interface
uses Classes, st_Common_Types, Forms, st_Common_Funcs, uSp_Class_Kat_Main;

function ShowSPClass_Kat(AParameter:TstSimpleParams):Variant;stdcall;
exports  ShowSPClass_Kat;

implementation

function ShowSPClass_Kat(AParameter:TstSimpleParams):Variant;stdcall;
var
 ViewForm : TfrmClass_Kat;
begin
  if IsMDIChildFormShow(TfrmClass_Kat) then exit;
  ViewForm := TfrmClass_Kat.Create(AParameter);
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


