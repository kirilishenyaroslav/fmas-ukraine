unit uBsOplata_loader;


interface
uses Classes,  uMainOplata, uCommon_Types, Forms, uCommon_Funcs;

function ShowBsOplata(AParameter:TBsSimpleParams):Variant;stdcall;
exports  ShowBsOplata;

implementation

function ShowBsOplata(AParameter:TBsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmMainOplata;
  Res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmMainOplata) then exit;

  ViewForm := TfrmMainOplata.Create(AParameter);
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
      res := ViewForm.res;
      ViewForm.free;
     end;
    end;
  Result := Res;
end;

end.
