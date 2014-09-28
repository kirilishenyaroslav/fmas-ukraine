unit gr_SvodDocsLoader;

interface

uses gr_SvodDocsMain, Classes, IBase, ZProc;

function View_grSvodOptions(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE):variant;stdcall;
exports View_grSvodOptions;

implementation

function View_grSvodOptions(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE):variant;stdcall;
var FormOptions:TGrFOptionsSvod;
begin
 if IsMDIChildFormShow(TGrFOptionsSvod) then Exit;
 FormOptions := TGrFOptionsSvod.Create(AOwner,ADb_Handle);
end;

end.
