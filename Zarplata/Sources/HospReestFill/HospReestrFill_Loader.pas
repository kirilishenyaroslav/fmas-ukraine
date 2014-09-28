unit HospReestrFill_Loader;

interface
uses Classes,IBase, HospReestrFill_MainForm, Variants;

function View_HospReestrFill(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;IdReestr:Integer):Variant; stdcall;
exports View_HospReestrFill;

implementation

uses ZProc;

function View_HospReestrFill(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;IdReestr:Integer):Variant; stdcall;
var ViewForm:TfHospReestrFill;
begin
  if IsMDIChildFormShow(TfHospReestrFill) then Exit;
  ViewForm:=TfHospReestrFill.Create(AOwner,ADB_Handle,IdReestr);
//  Result:=ViewForm.ShowModal;
//  ViewForm.Free;
end;

end.
