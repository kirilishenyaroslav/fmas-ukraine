unit Gar_LoaderFilterWaybill;

interface

uses gr_uCommonLoader, Gar_FilterSeriesWaybill, Forms;

function View_FilterWaybill(Param:TgrSimpleParam):Variant;stdcall;
exports  View_FilterWaybill;

implementation

function View_FilterWaybill(Param:TgrSimpleParam):Variant;
var
  ViewForm : TFormFilterSeriesWaybill;
begin
  //if IsMDIChildFormShow(TFMainMarkaAvto) then Exit;
  ViewForm:=TFormFilterSeriesWaybill.create(Param);
  ViewForm.ShowModal;
  //FMainMarkaAvto.ShowModal;
  //FMainMarkaAvto.Free;
end;

end.
