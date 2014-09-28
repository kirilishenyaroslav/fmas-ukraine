unit AvgHospPayment_Loader;

interface
uses Classes,IBase, AvgHospPayment_MainForm, Variants;

function View_AvgPayment(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;ID_HOSP:Integer; rmoving : integer):Variant; stdcall;
exports View_AvgPayment;

implementation

uses ZProc;

function View_AvgPayment(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;ID_HOSP:Integer;rmoving : integer):Variant; stdcall;
var ViewForm:TfmAvgPayment;
begin
  if IsMDIChildFormShow(TfmAvgPayment) then Exit;
  ViewForm:=TfmAvgPayment.Create(AOwner,ADB_Handle,ID_HOSP, rmoving);
  Result:=ViewForm.ShowModal;
  ViewForm.Free;
end;

end.
