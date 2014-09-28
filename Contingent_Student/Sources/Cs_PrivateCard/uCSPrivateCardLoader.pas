unit uCSPrivateCardLoader;

interface
uses Classes, uCSPrivateCardMain, AArray, ucs_types, Forms, uCS_Loader, Dialogs;

function ShowCsStudPrivateCard(AParameter:TcsParamPacks):Variant;stdcall;
exports  ShowCsStudPrivateCard;

implementation

function ShowCsStudPrivateCard(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmStudPrivateCard;
begin

  ViewForm := TfmStudPrivateCard.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;


   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
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
