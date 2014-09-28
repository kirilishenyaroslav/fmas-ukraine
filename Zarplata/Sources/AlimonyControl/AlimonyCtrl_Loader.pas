unit AlimonyCtrl_Loader;

interface

uses Classes, IBase, AlimonyCtrl_MainForm, zTypes, Variants;

function View_FZAlimonyControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameters:TZAlimonyParameters):Variant;stdcall;
 exports View_FZAlimonyControl;

implementation

function View_FZAlimonyControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameters:TZAlimonyParameters):Variant;stdcall;
var ViewForm:TFAlimonyControl;
    Res:Variant;
begin
ViewForm:=TFAlimonyControl.Create(AOwner,DB_HANDLE,AParameters);
if ViewForm.Parameter.ID>=0 then
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
View_FZAlimonyControl:=Res;
end;


end.
