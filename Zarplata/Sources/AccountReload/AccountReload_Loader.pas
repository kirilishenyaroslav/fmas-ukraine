unit AccountReload_Loader;

interface

uses Classes, iBase, AccountReload_MainForm, Variants, AccountReload_DM, Windows,
     Messages, SysUtils,  Graphics, Controls, Forms,Dialogs;

function View_AccountReload(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;f:string):Variant; stdcall;
exports View_AccountReload;

implementation

function View_AccountReload(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;f:string):Variant;
var ViewForm:TfmAccountReload;
begin
  ViewForm           := TfmAccountReload.Create(AOwner,Db_Handle,f);
  ViewForm.FormStyle := fsNormal;

  case ViewForm.FormStyle of
   fsMDIChild : Viewform.Show;
  else
   Begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
 end;

end.
