unit TnAccess_Loader;

interface

Uses Classes, IBase, zTypes, Variants, TnAccess_MainForm, Controls;

function View_FTnAccessCtrl(AOwner:TComponent;DB:TISC_DB_HANDLE;AId_Man:integer):Variant; stdcall;
 exports View_FTnAccessCtrl;

implementation

function View_FTnAccessCtrl(AOwner : TComponent;DB:TISC_DB_HANDLE;AId_Man:integer):Variant; stdcall;
var ViewForm:TFTnAccessControl;
begin
ViewForm := TFTnAccessControl.Create(AOwner,DB,AId_Man);
ViewForm.ShowModal;
ViewForm.Destroy;
end;


end.
