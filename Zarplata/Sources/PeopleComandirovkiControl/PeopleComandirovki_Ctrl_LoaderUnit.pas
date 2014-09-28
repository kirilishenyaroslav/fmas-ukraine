unit PeopleComandirovki_Ctrl_LoaderUnit;

interface

uses Classes, ZTypes, IBase, PeopleComandirovki_Ctrl_MainForm, Variants;

function View_FZPeopleComandirovkiControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameters:TZPeopleComandirovParameters;Is_Grant: TZChildSystems):Variant;stdcall;
 exports View_FZPeopleComandirovkiControl;

implementation

function View_FZPeopleComandirovkiControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameters:TZPeopleComandirovParameters;Is_Grant: TZChildSystems):Variant;stdcall;
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
     View_FZPeopleComandirovkiControl:=Res;
end;

end.
