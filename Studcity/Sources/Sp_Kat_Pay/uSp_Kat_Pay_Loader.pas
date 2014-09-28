unit uSp_Kat_Pay_Loader;

interface
uses Classes, st_Common_Types, Forms, st_Common_Funcs, uSp_Kat_Pay_Main;

function ShowSPKat_Pay(AParameter:TstSimpleParams):Variant;stdcall;
exports  ShowSPKat_Pay;

implementation

function ShowSPKat_Pay(AParameter:TstSimpleParams):Variant;stdcall;
var
 ViewForm:TfrmKat_Pay_Main;
begin
 if IsMDIChildFormShow(TfrmKat_Pay_Main) then exit;
 ViewForm := TfrmKat_Pay_Main.Create(AParameter);
 ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
   else begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
 Result := ViewForm.res;
end;

end.
