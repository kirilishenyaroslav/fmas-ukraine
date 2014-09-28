unit uViewAccLoader;

interface
uses Classes, uView_pers_acc_inf, uCommon_Types, Forms, uCommon_Funcs;

function ShowViewNachisl(AParameter:TBsSimpleParams):Variant;stdcall;
exports  ShowViewNachisl;

implementation

function ShowViewNachisl(AParameter:TBsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmViewNachisl;
  ResDoc : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmViewNachisl) then exit;

  ViewForm := TfrmViewNachisl.Create(AParameter);
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
      ViewForm.free;
     end;
    end;
  Result := ResDoc;
end;

end.
