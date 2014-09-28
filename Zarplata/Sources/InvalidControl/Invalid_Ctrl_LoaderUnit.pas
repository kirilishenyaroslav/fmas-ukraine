unit Invalid_Ctrl_LoaderUnit;

interface

uses Classes, ZTypes, IBase, Invalid_Ctrl_MainForm, Variants;

function View_FZInvalidCtrl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameters:TZCtrlWithHistoryParam):Variant;stdcall;
 exports View_FZInvalidCtrl;

implementation

function View_FZInvalidCtrl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameters:TZCtrlWithHistoryParam):Variant;stdcall;
var ViewForm:TFSp_Invalid_Control;
    Res:Variant;
begin
ViewForm:=TFSp_Invalid_Control.Create(AOwner,DB_HANDLE,AParameters);
if AParameters.ControlFormStyle<>zcfsDelete then
    ViewForm.ShowModal;
If AParameters.ControlFormStyle=zcfsInsert then
 begin
  Res:=VarArrayCreate([0,1],varVariant);
  Res[1]:=ViewForm.Parameter.ID;
 end
else
 Res:=VarArrayCreate([0,0],varVariant);
Res[0]:=ViewForm.ModalResult;
ViewForm.Free;
Result:=Res;
end;

end.
