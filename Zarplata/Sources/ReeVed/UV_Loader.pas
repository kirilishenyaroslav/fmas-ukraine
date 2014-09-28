unit UV_Loader;

interface

Uses Classes, IBase, ZProc, Sp_ReeVed_UV, Variants, ZTypes, Dialogs;

function View_FUV_ReeVed_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE;AId_1df:Integer;System:boolean):Variant; stdcall;
 exports  View_FUV_ReeVed_Sp;

implementation

function View_FUV_Reeved_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE;AId_1df:Integer;System:boolean):Variant;
var ViewForm: TFUV_REE_VED;
begin
     if AId_1df>0
     then begin
               ViewForm  :=  TFUV_REE_VED.Create(AOwner, DB, AId_1df, System);
               ViewForm.ShowModal;
               Result := ViewForm.MR;
               ViewForm.Free;
      end
     else begin
               if not IsMDIChildFormShow(TFUV_REE_VED) then
               ViewForm  :=  TFUV_REE_VED.Create(AOwner, DB, AId_1df, System);
               Result:=NULL;
      end;
end;

end.
