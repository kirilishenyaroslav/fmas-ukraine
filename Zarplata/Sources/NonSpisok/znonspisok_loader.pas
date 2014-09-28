unit ZNonSpisok_Loader;

interface

uses ZNonSpisok, ZProc, Classes, IBase;

function View_NonSpisok(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
 exports View_NonSpisok;

implementation

function View_NonSpisok(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm:TFZNonSpisok;
begin
 if not IsMDIChildFormShow(TFZNonSpisok) then
   ViewForm := TFZNonSpisok.Create(AOwner, DB);
end;

end.
