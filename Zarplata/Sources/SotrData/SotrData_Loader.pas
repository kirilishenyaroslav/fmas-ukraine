unit SotrData_Loader;

interface
uses Classes,IBase, SotrData_MainForm, Variants, SotrData_FilterForm;

function View_SotrData(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):Variant; stdcall;
exports View_SotrData;

implementation

uses ZProc;

function View_SotrData(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):Variant;
var ViewForm:TfmSotrData;
    FilterParams: TSotrFilter;
begin
  if IsMDIChildFormShow(TfmSotrData) then Exit;
  FilterParams.is_filtered := False;
  if ShowFilter(AOwner,ADB_Handle,FilterParams) then
     ViewForm:=TfmSotrData.Create(AOwner,ADB_Handle,FilterParams);
end;

end.
