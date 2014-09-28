//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника
// Чернявский А.Э. 2006г.
//******************************************************************************
unit cn_sp_SpecLoader;

interface
uses Classes, cn_sp_SpecUnit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPSpec(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPSpec;

implementation

function ShowSPSpec(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmSpSpec;
begin
 if IsMDIChildFormShow(TfrmSpSpec) then exit;
 ViewForm := TfrmSpSpec.Create(AParameter);
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
