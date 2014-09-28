unit AvgPayment_Loader;

interface
uses Classes,IBase, AvgPayment_MainForm, Variants;

function View_AvgPayment(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;ID_HOSP:Integer):Variant; stdcall;
exports View_AvgPayment;

implementation

uses ZProc;

function View_AvgPayment(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;ID_HOSP:Integer):Variant; stdcall;
var ViewForm:TfmAvgPayment;
begin
  if IsMDIChildFormShow(TfmAvgPayment) then Exit;
  ViewForm:=TfmAvgPayment.Create(AOwner,ADB_Handle,ID_HOSP);
  Result:=ViewForm.ShowModal;
  ViewForm.Free;
end;

end.
