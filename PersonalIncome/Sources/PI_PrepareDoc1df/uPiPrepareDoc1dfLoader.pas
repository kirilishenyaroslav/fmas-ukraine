unit uPiPrepareDoc1dfLoader;

interface
uses Classes, uPiPrepareDoc1dfMain, upi_resources, Forms, upi_Loader, dxBar;

function ShowPiPrepareDoc1df(AParameter:TpiParamPacks):Variant;stdcall;
exports  ShowPiPrepareDoc1df;

implementation

function ShowPiPrepareDoc1df(AParameter:TpiParamPacks):Variant;stdcall;
var
  ViewForm:TfmPrepareDocMain;
begin
  ViewForm := TfmPrepareDocMain.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop :
    begin
        ViewForm.ShowModal;
        //ViewForm.free;
    end;
    fsMDIChild	          :
    begin
        ViewForm.GridDBView.OptionsSelection.CellSelect := false;
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
