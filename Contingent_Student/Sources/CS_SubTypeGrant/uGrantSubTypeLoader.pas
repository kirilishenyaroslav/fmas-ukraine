unit uGrantSubTypeLoader;

interface
uses Classes, uGrantSubTypeMain, ucs_types, Forms, uCS_loader,dxBar;

function ShowGrantSubType(AParameter:TcsParamPacks):Variant;stdcall;
exports  ShowGrantSubType;

implementation

function ShowGrantSubType(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmGrantSubType;
begin

  ViewForm := TfmGrantSubType.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
   fsNormal, fsStayOnTop :
   begin
     ViewForm.SelButton.Visible := ivAlways;
     ViewForm.ShowModal;
   end;
    fsMDIChild	          : ViewForm.Show;
   else
    begin
     ViewForm.ShowModal;
     ViewForm.free;
    end;
   end;
     Result:=ViewForm.res;
end;

end.
