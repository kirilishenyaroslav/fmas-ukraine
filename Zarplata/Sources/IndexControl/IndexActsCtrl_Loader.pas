unit IndexActsCtrl_Loader;

interface

uses Classes, IBase, IndexActsCtrl_MainForm, zTypes, Variants, ZMessages,
    Unit_Sp_VidOpl_Consts, zProc, Dialogs, Controls;

function View_FZIndexActsControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameters:TZIndexParameters):Variant;stdcall;
 exports View_FZIndexActsControl;

implementation

function View_FZIndexActsControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameters:TZIndexParameters):Variant;stdcall;
var ViewForm:TFIndexActsControl;
    Res:Variant;
begin

      if AParameters.ControlFormStyle<>zcfsDelete
      then begin
                ViewForm:=TFIndexActsControl.Create(AOwner,DB_HANDLE,AParameters);
                ViewForm.ShowModal;
                Res:=VarArrayCreate([0,0],varVariant);
                Res[0]:=ViewForm.Parameter.ID;
                ViewForm.Free;
      end
      else begin
        if ZShowMessage(DeleteRecord_Caption,DeleteRecord_Text,mtConfirmation,[mbYes, mbNo])=mrYes then
          begin
                ViewForm:=TFIndexActsControl.Create(AOwner,DB_HANDLE,AParameters);
                ViewForm.Free;
                Res:=VarArrayCreate([0,0],varVariant);
                Res[0]:=0;
          end;
      end;

      View_FZIndexActsControl:=Res;
end;


end.
