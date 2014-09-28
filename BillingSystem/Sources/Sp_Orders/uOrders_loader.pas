unit uOrders_loader;

interface
uses Classes, uOrders_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowSPOrders(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSPOrders;

implementation

function ShowSPOrders(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmOrders_main;
  res : Variant;
begin
  if IsMDIChildFormShow(TfrmOrders_main) then exit;

  ViewForm := TfrmOrders_main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  case ViewForm.FormStyle of
    fsMDIChild	          : ViewForm.Show;
   else
   begin
    ViewForm.ShowModal;
    res := ViewForm.res;
    ViewForm.free;
   end;
  end;
  Result := res;
end;

end.
