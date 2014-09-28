//******************************************************************************
// Проект "Контракты"
// Загрузчик реестра контрактов
// Чернявский А.Э. 2005г.
//******************************************************************************
unit Contracts_Loader;

interface
uses Classes, Contracts_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowContracts(AParameter:TcnSimpleParamsAbiturient):Variant;stdcall;
exports ShowContracts;

implementation

function ShowContracts(AParameter:TcnSimpleParamsAbiturient):Variant;stdcall;
var ViewForm:TfrmContracts;
begin
 if IsMDIChildFormShow(TfrmContracts) then exit;
 ViewForm := TfrmContracts.Create(AParameter);
 ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsMDIChild	          : ViewForm.Show;
   else begin
    ViewForm.ShowModal;
    Result:=ViewForm.res;
    ViewForm.free;
    end;
   end;

end;

  end.
