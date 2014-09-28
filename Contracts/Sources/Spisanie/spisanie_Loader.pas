//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника национальностей
// Чернявский А.Э. 2005г.
//******************************************************************************
unit spisanie_Loader;

interface
uses Classes, cn_spisanie_unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowDTSpisanie(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowDTSpisanie;

implementation

function ShowDTSpisanie(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmSpisanie;
begin
 if IsMDIChildFormShow(TfrmSpisanie) then exit;
 ViewForm := TfrmSpisanie.Create(AParameter.Owner, AParameter.Db_Handle);
 ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
   else begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
Result:=ViewForm.res;
end;

  end.
