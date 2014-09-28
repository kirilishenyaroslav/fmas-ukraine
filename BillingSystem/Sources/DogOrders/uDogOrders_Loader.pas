unit uDogOrders_Loader;

interface
uses Classes, uDogOrders_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowDogOrders(AParameter:TbsSimpleParamsEx):Variant;stdcall;
exports  ShowDogOrders;

implementation

function ShowDogOrders(AParameter:TbsSimpleParamsEx):Variant;stdcall;
var
  ViewForm:TfrmDogOrders;
begin
  if IsMDIChildFormShow(TfrmDogOrders) then exit;

  ViewForm := TfrmDogOrders.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
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
