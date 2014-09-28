//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника национальностей
// Чернявский А.Э. 2005г.
//******************************************************************************
unit cn_fr_Mode_Loader;

interface
uses Classes, cn_fr_ModeUnit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function frChooseReport(AParameter:TcnSimpleParamsEx):Variant;stdcall;
exports  frChooseReport;

implementation

function frChooseReport(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var ViewForm:TfrmChooseReport;
begin
 if IsMDIChildFormShow(TfrmChooseReport) then exit;
 ViewForm := TfrmChooseReport.Create(AParameter);
 ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
   else begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
//Result:=ViewForm.res;
end;

  end.
