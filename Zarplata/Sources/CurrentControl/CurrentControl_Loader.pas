unit CurrentControl_Loader;

interface

uses Classes, IBase, ZTypes, Current_ZarControl, Variants;

function View_CurrentControl(AParameter:TZCurrentParameters):Variant;stdcall;
 exports View_CurrentControl;

implementation

function View_CurrentControl(AParameter:TZCurrentParameters):Variant;stdcall;
var ViewForm:TFZCurrentControl;
    Res:Variant;
begin
ViewForm:=TFZCurrentControl.Create(AParameter);
if AParameter.ControlFormStyle<>zcfsDelete then
    ViewForm.ShowModal;
If AParameter.ControlFormStyle=zcfsInsert then
 begin
  Res:=VarArrayCreate([0,1],varVariant);
  Res[1]:=ViewForm.resault;
 end
else
 Res:=VarArrayCreate([0,0],varVariant);
Res[0]:=ViewForm.ModalResult;
ViewForm.Free;
View_CurrentControl:=Res;
end;

end.
