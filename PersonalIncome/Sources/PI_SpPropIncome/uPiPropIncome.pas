unit uPiPropIncome;

interface
uses Classes, uPiPropIncomeMain, upi_resources, Forms, upi_Loader, dxBar;

function ShowPiPropIncome(AParameter:TpiParamPacks):Variant;stdcall;
exports  ShowPiPropIncome;

implementation

function ShowPiPropIncome(AParameter:TpiParamPacks):Variant;stdcall;
var
  ViewForm:TfmPropIncome;
begin
  ViewForm := TfmPropIncome.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop :
    begin
        ViewForm.dxBarLargeButton4.Visible := ivAlways;
        ViewForm.ShowModal;
    end;
    fsMDIChild	          :
    begin
        ViewForm.dxBarLargeButton4.Visible := ivNever;
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
