unit ImportCurrentPremiya_Loader;

interface

uses Classes, iBase, ImportCurrentPremiya_MainForm, Variants, ImportCurrentPremiya_AddForm, ImportCurrentPremiya_Filter, ImportCurrentPremiya_DM,
 Windows, Messages, SysUtils,  Graphics, Controls, Forms,Dialogs;


function View_ImportCurrentPremiya(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE):Variant; stdcall;
exports View_ImportCurrentPremiya;

implementation

uses ZProc;

function View_ImportCurrentPremiya(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE):Variant;
var ViewForm:TfmImportCurrentPremiya;
    FilterParams: TimportFilter;
begin
  ViewForm:=TfmImportCurrentPremiya.Create(AOwner,Db_Handle,FilterParams);
  ViewForm.FormStyle:=fsNormal;
  case ViewForm.FormStyle of
   fsMDIChild : Viewform.Show;
  else
   Begin
    ViewForm.ShowModal;
    Result:=ViewForm.Res;
    ViewForm.free;
   end;
  end;
 end;

end.
