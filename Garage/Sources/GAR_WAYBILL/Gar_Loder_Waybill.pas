unit Gar_Loder_Waybill ;

interface

uses gar_Types,
Gar_Waybilll_Filter,
ZProc, Gar_Waybill_MainForm, gar_Waybill_DM,Messages,Dialogs;

function View_WayBill_MainForm(Param:TgarSimpleParamMode):Variant;stdcall;
exports View_WayBill_MainForm;

implementation

function View_WayBill_MainForm(Param:TgarSimpleParamMode):Variant;
begin
  if IsMDIChildFormShow(TFMainWayBill) then Exit;
  ParamWaybillFilter:=TgarParamWaybillFilter.create;
  ParamWaybillFilter.Owner:=Param.Owner;
  ParamWaybillFilter.DB_Handle:=Param.DB_Handle;
  ParamWaybillFilter.fs:=garfsShow;

  if  View_FFilter(ParamWaybillFilter) then
  FMainWayBill := TFMainWayBill.create(ParamWaybillFilter);

end;



end.
