unit AvgHolPayment_Loader;

interface
uses Classes,IBase, AvgHolPayment_MainForm, Variants, Controls;

function View_HolAvg(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;IdHol:Integer):Variant; stdcall;
exports View_HolAvg;

function View_Avg(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;Rmoving:Integer;Kod_setup_B:integer):Variant; stdcall;
exports View_Avg;

implementation

uses ZProc;

function View_HolAvg(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE; IdHol:Integer):Variant; stdcall;
var ViewForm:TfmHolAvg;
begin
  ViewForm:=TfmHolAvg.Create(AOwner);
  ViewForm.PrepareHolAvg(ADB_Handle,IdHol);
  Result:=ViewForm.ShowModal;
  ViewForm.Free;
end;

function View_Avg(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;Rmoving:Integer;Kod_setup_B:integer):Variant; stdcall;
var ViewForm:TfmHolAvg;
begin
  ViewForm:=TfmHolAvg.Create(AOwner);
  ViewForm.PrepareAvg(ADB_Handle,Rmoving,Kod_setup_B);
  Result:=ViewForm.ShowModal;
  ViewForm.Free;
end;

end.
