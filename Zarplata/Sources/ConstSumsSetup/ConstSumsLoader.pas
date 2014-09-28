unit ConstSumsLoader;

interface

uses Classes, IBase, uConstsSumsSetupForm, ZProc,
     Controls;

function View_ConstSumsSetup(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_ConstSumsSetup;

implementation

function View_ConstSumsSetup(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TConstSumsSetupForm;
begin
if IsMDIChildFormShow(TConstSumsSetupForm) then Exit;
ViewForm :=  TConstSumsSetupForm.Create(AOwner, DB);
end;

end.
