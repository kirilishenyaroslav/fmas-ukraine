unit ZPeoplePrivCtrl_Loader;

interface

Uses Classes, IBase, zTypes, Variants, ZPeoplePrivCtrl_MainForm, Controls;

function View_FZPeoplePrivControl(AOwner:TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters):Variant; stdcall;
 exports View_FZPeoplePrivControl;

implementation

function View_FZPeoplePrivControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters):Variant; stdcall;
var ViewForm:TFZPeoplePrivControl;
    Res:variant;
begin
ViewForm := TFZPeoplePrivControl.Create(AOwner,DB,AParameter);
if ViewForm.ModalResult=mrNone then
   ViewForm.ShowModal;
If AParameter.ControlFormStyle=zcfsInsert then
 begin
  Res:=VarArrayCreate([0,1],varVariant);
  Res[1]:=ViewForm.Resault;
 end
else
 Res:=VarArrayCreate([0,0],varVariant);
res[0]:=ViewForm.ModalResult;
ViewForm.Free;
View_FZPeoplePrivControl:=Res;
end;


end.
