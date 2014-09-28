unit AvgComPayment_Loader;

interface
uses Classes,IBase, AvgComPayment_MainForm, Variants;

function View_ComAvg(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;IdHol:Integer):Variant; stdcall;
exports View_ComAvg;

function View_Com(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;Rmoving:Integer;Kod_setup_B:integer):Variant; stdcall;
exports View_Com;

implementation

uses ZProc;

function View_ComAvg(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;IdHol:Integer):Variant; stdcall;
var ViewForm:TfmHolAvg;
begin
      ViewForm:=TfmHolAvg.Create(AOwner);
      ViewForm.PrepareComAvg(ADB_Handle,IdHol);
      Result:=ViewForm.ShowModal;
      ViewForm.Free;
end;

function View_Com(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;Rmoving:Integer;Kod_setup_B:integer):Variant; stdcall;
var ViewForm:TfmHolAvg;
begin
      ViewForm:=TfmHolAvg.Create(AOwner);
      ViewForm.PrepareAvg(ADB_Handle,Rmoving,Kod_setup_B);
      Result:=ViewForm.ShowModal;
      ViewForm.Free;
end;

end.
