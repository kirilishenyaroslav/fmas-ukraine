unit uStudLoader;

interface
uses Classes, uStud_Main, AArray, Forms, uCS_Loader,uCs_types, Dialogs, dxBar;


function ShowCsStud(AParameter:TcsParamPacks):Variant;stdcall;
exports  ShowCsStud;

implementation

function ShowCsStud(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmStudMain;
begin

  ViewForm := TfmStudMain.Create(AParameter);

  ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop :
   begin
     ViewForm.ActionSel.Visible := true;
     ViewForm.ActionCheckAll.Visible := true;
     ViewForm.ActionUncheckAll.Visible := true;
     ViewForm.ShowModal;
   end;
    fsMDIChild	          :
    begin
         ViewForm.cxGridDBTableViewCheck.Visible := false;
         ViewForm.Show;
    end;
   else
    begin
     ViewForm.ShowModal;

     ViewForm.free;
    end;
   end;
   Result:=ViewForm.res;
end;


end.
