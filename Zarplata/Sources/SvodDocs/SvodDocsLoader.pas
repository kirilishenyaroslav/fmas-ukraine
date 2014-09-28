unit SvodDocsLoader;

interface

uses SvodDocsMain, ZSvodTypesUnit, Classes, IBase, ZProc;

function ViewSvodOptions(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE):variant;stdcall;
exports ViewSvodOptions;

implementation

function ViewSvodOptions(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE):variant;stdcall;
var FormOptions:TFOptionsSvod;
begin
 if IsMDIChildFormShow(TFOptionsSvod) then Exit;
 FormOptions := TFOptionsSvod.Create(AOwner,ADb_Handle);
end;

end.
