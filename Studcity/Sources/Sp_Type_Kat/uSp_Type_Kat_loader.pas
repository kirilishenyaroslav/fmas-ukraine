unit uSp_Type_Kat_loader;

interface
uses Classes, st_Common_Types, Forms, st_Common_Funcs, uSp_Type_Kat_Main;

function ShowSPType_Kat(AParameter:TstSimpleParams):Variant;stdcall;
exports  ShowSPType_Kat;

implementation

function ShowSPType_Kat(AParameter:TstSimpleParams):Variant;stdcall;
var
 ViewForm : TfrmType_Kat;
begin
  if IsMDIChildFormShow(TfrmType_Kat) then exit;

  ViewForm := TfrmType_Kat.Create(AParameter);
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
