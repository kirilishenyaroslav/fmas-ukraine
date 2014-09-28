unit NonSpisokControl_Loader;

interface

uses PackageLoad, ZTypes, NonSpisokControl_MainForm, NonSpisokControl_DataModule,
     Controls, Variants;

function View_NonSpisokControl(AParameter:TNonSpisokControlParameter):Variant;stdcall;
 exports View_NonSpisokControl;

implementation


function View_NonSpisokControl(AParameter:TNonSpisokControlParameter):Variant;
var ViewForm:TFZ_NonSpisok_Control;
    Res:variant;
begin
 Res:=NULL;
 ViewForm:=TFZ_NonSpisok_Control.Create(AParameter);
 if AParameter.ControlFormStyle<>zcfsDelete then
  begin
   if ViewForm.ShowModal=mrYes then
     res:=ViewForm.Res;
  end
 else res:=ViewForm.Res;
 ViewForm.free;
 Result:=Res;
end;

end.
