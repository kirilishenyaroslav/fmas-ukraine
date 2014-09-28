//******************************************************************************
// Проект "Контракты"
// Загрузчик входящего остатка
// Чернявский А.Э. 2005г.
//******************************************************************************
unit EntryRest_Loader;

interface
uses Classes, EntryRest_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowEntryRest(AParameter:TcnSimpleParamsEx):Variant;stdcall;
exports  ShowEntryRest;

implementation

function ShowEntryRest(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var ViewForm:TfrmEntryRest;
begin
 if IsMDIChildFormShow(TfrmEntryRest) then exit;
 ViewForm := TfrmEntryRest.Create(AParameter);
 ViewForm.FormStyle:= fsNormal;
 ViewForm.ShowModal;
 ViewForm.free;
Result:=ViewForm.res;
end;

end.
