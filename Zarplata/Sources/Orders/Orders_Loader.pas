unit Orders_Loader;

interface
uses Orders_MainForm, IBase, Classes, ZProc;

function View_Orders(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):Variant; stdcall;
exports View_Orders;
implementation

function View_Orders(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):Variant;
var ViewForm:TfmOrders;
begin
  if IsMDIChildFormShow(TfmOrders) then Exit;
  ViewForm:=TfmOrders.Create(AOwner,ADB_Handle);
end;  

end.
