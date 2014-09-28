//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника контрактов экспортный
// Чернявский А.Э. 2005г.
//******************************************************************************
unit cn_ContractsList_Loader;

interface
uses Classes, cn_ContractsList_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs, Dialogs;

function ShowSPContractsList(AParameter:TcnSimpleParamsEx):Variant;stdcall;
exports  ShowSPContractsList;

implementation

function ShowSPContractsList(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var ViewForm:TfrmContractsList;
begin
 if IsMDIChildFormShow(TfrmContractsList) then exit;
 ViewForm := TfrmContractsList.Create(AParameter);
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
  //Result := ____________________________________________________________________________________________________________________________________________________I;
  Result := res;
end;

end.
