unit PeopleWorkMode_Ctrl_LoaderUnit;

interface

uses Classes, ZTypes, IBase, PeopleWorkMode_Ctrl_MainForm, Variants;

function View_FZPeopleWorkModeControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameters:TZPeopleWorkModeParameters;Is_Grant: TZChildSystems):Variant;stdcall;
 exports View_FZPeopleWorkModeControl;

implementation

function View_FZPeopleWorkModeControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameters:TZPeopleWorkModeParameters;Is_Grant: TZChildSystems):Variant;stdcall;
var ViewForm:TFSp_People_WorkMode_Control;
    Res:Variant;
begin
     ViewForm:=TFSp_People_WorkMode_Control.Create(AOwner,DB_HANDLE,AParameters,Is_grant);

     if AParameters.ControlFormStyle<>zcfsDelete
     then ViewForm.ShowModal;

     If AParameters.ControlFormStyle=zcfsInsert
     then begin
               Res:=VarArrayCreate([0,1],varVariant);
               Res[1]:=ViewForm.Parameter.ID;
     end
     else begin
               Res:=VarArrayCreate([0,0],varVariant);
     end;

     Res[0]:=ViewForm.ModalResult;
     ViewForm.Free;
     View_FZPeopleWorkModeControl:=Res;
end;

end.
