unit uGroupObjectLoader;

interface
uses Classes, BsGroupObj, uCommon_Types, Forms, uCommon_Funcs;

function ShowObjectsGroup(AParameter:TBsSimpleParams):Variant;stdcall;
exports  ShowObjectsGroup;

implementation

function ShowObjectsGroup(AParameter:TBsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmGroupObject;
  Res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmGroupObject) then exit;

  ViewForm := TfrmGroupObject.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  //if  AParameter.SMode = MultiSelect then ViewForm.GridDBView.OptionsSelection.MultiSelect:=true;

   case ViewForm.FormStyle of fsMDIChild:
     begin
       ViewForm.Show;
       ViewForm.WindowState:=wsMaximized;
      end
      else
     begin
      ViewForm.ShowModal;
      res := ViewForm.res;
      ViewForm.free;
     end;
    end;
  Result := res;
end;

end.
