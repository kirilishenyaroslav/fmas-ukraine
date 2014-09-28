unit PeopleProp_Loader;

interface

uses Classes, IBase, PeopleProp_MainForm, ZProc,
     Controls;

function View_FZPeopleProp(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_FZPeopleProp;

implementation

function View_FZPeopleProp(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZPeopleProp;
begin
if IsMDIChildFormShow(TFZPeopleProp) then Exit;
ViewForm  :=  TFZPeopleProp.Create(AOwner, DB);
end;

end.

