unit UImportInterface;

interface

uses UImportConfigure, UImportSettings, Ibase, Classes;

procedure ZDocImportAppRun(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:int64; id_system:Integer);stdcall;
procedure ZDocImportConfigure(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:int64);stdcall;
  exports ZDocImportAppRun,
          ZDocImportConfigure;

implementation

procedure ZDocImportAppRun(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:int64; id_system : Integer);
begin
     TfrmImportConfigure.Create(AOwner,DbHandle,id_user, id_system);
end;

procedure ZDocImportConfigure(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:int64);
begin
     with TfrmImportSettings.Create(AOwner,DbHandle,id_user) do
     begin
          ShowModal;
          Free;
     end;
end;


end.
