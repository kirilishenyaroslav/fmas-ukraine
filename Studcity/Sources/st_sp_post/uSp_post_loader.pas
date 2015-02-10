unit uSp_post_loader;

interface
uses Classes, st_Common_Types, Forms, st_Common_Funcs, uSp_post_Main, Dialogs;

function ShowSPPost(AParameter:TstSimpleParams):Variant;stdcall;
exports  ShowSPPost;

implementation

function ShowSPPost(AParameter:TstSimpleParams):Variant;stdcall;
var
 ViewForm : TfrmPost;
begin
  if IsMDIChildFormShow(TfrmPost) then exit;
  ViewForm := TfrmPost.Create(AParameter);
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
