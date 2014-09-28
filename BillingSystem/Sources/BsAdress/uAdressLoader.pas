unit uAdressLoader;

interface
uses Classes, BsAdressMain, uCommon_Types, Forms, uCommon_Funcs;

function ShowBsAdress(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowBsAdress;

implementation

function ShowBsAdress(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmAdress;
  ResAdr : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmAdress) then exit;

  ViewForm := TfrmAdress.Create(AParameter);
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
      ResAdr := ViewForm.ResAdres;
      ViewForm.free;
     end;
    end;
  Result := ResAdr;
end;

end.
