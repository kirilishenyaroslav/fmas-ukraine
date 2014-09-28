unit PeoplePriv_Loader;

interface

uses Classes, IBase, PeoplePriv_MainForm, ZProc,
     Controls;

function View_FZPeoplePriv(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_FZPeoplePriv;

implementation

function View_FZPeoplePriv(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZPeoplePriv;
begin
if IsMDIChildFormShow(TFZPeoplePriv) then Exit;
ViewForm  :=  TFZPeoplePriv.Create(AOwner, DB);
end;

end.

