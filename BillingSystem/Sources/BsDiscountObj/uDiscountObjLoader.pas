unit uDiscountObjLoader;

interface
uses Classes, BsDiscountObj, uCommon_Types, Forms, uCommon_Funcs;

function ShowDiscountObjects(AParameter:TBsSimpleParams):Variant;stdcall;
exports  ShowDiscountObjects;

implementation

function ShowDiscountObjects(AParameter:TBsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmDiscountObj;
  ResObj : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmDiscountObj) then exit;

  ViewForm := TfrmDiscountObj.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  //if  AParameter.SMode = MultiSelect then ViewForm.GridDBView.OptionsSelection.MultiSelect:=true;

   case ViewForm.FormStyle of fsMDIChild:
     begin
       ViewForm.Show;
       //ViewForm.WindowState:=wsMaximized;
      end
      else
     begin
      ViewForm.ShowModal;
      ResObj := ViewForm.ResObject;
      ViewForm.free;
     end;
    end;
  Result := ResObj;
end;

end.
