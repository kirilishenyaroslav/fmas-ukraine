unit uPiTypeDocLoader;

interface
uses Classes, uPiTypeDocMain, upi_resources, Forms, upi_Loader, dxBar;

function ShowPiTypeDoc(AParameter:TpiParamPacks):Variant;stdcall;
exports  ShowPiTypeDoc;

implementation

function ShowPiTypeDoc(AParameter:TpiParamPacks):Variant;stdcall;
var
  ViewForm:TfmTypeDocMain;
begin
  ViewForm := TfmTypeDocMain.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop :
    begin
        ViewForm.dxBarLargeButton4.Visible := ivAlways;
        ViewForm.is_choose := 1;
        ViewForm.ShowModal;
    end;
    fsMDIChild	          :
    begin
        ViewForm.dxBarLargeButton4.Visible := ivNever;
        ViewForm.is_choose := 0;
        ViewForm.Show;
    end;
   else
    begin
     ViewForm.ShowModal;
     ViewForm.free;
    end;
   end;
   Result:=ViewForm.res;
end;


end.
 