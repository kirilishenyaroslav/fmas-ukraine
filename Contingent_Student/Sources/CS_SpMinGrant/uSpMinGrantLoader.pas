unit uSpMinGrantLoader;

interface
uses Classes, uSpMinGrantMain, ucs_types, Forms, ucs_loader,dxBar;

function ShowSpGrantMin(AParameter:TcsParamPacks):Variant;stdcall;
exports  ShowSpGrantMin;

implementation

function ShowSpGrantMin(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmSpMinGrantMain;
begin
  ViewForm := TfmSpMinGrantMain.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop :
   begin
    ViewForm.SelButton.Visible := ivAlways;
     ViewForm.ShowModal;
   end;
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
