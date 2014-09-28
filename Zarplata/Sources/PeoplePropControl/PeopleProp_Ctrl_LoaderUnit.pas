unit PeopleProp_Ctrl_LoaderUnit;

interface

uses Classes, ZTypes, IBase, PeopleProp_Ctrl_MainForm, Variants;

function View_FZPeoplePropControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameters:TZPeoplePropParameters;Is_Grant: TZChildSystems):Variant;stdcall;
 exports View_FZPeoplePropControl;

implementation

function View_FZPeoplePropControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameters:TZPeoplePropParameters;Is_Grant: TZChildSystems):Variant;stdcall;
var ViewForm:TFSp_People_Prop_Control;
    Res:Variant;
begin
ViewForm:=TFSp_People_Prop_Control.Create(AOwner,DB_HANDLE,AParameters,Is_grant);
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
View_FZPeoplePropControl:=Res;
end;

end.
