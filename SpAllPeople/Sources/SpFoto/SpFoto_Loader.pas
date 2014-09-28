unit SpFoto_Loader;

interface
uses Classes,IBase, Variants, Controls, SpFoto_AddForm;

function AddFoto(AOwner:TComponent;MDB_HANDLE, ADB_HANDLE:TISC_DB_HANDLE;AIdMan:Integer=-1):Variant;stdcall;

exports AddFoto;

implementation

function AddFoto(AOwner:TComponent;MDB_HANDLE, ADB_HANDLE:TISC_DB_HANDLE;AIdMan:Integer=-1):Variant;
var ViewForm:TfmAddFoto;
begin
  ViewForm:=TfmAddFoto.Create(AOwner,MDB_HANDLE, ADB_HANDLE,AIdMan);
  ViewForm.ShowModal;
  ViewForm.Release;
end;

end.
