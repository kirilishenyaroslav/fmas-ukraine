//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2006г.
//******************************************************************************
unit cn_DogType_Loader;

interface
uses Classes, cn_DogType_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPTypeDog(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPTypeDog;

implementation

function ShowSPTypeDog(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmTypeDog;
begin
 if IsMDIChildFormShow(TfrmTypeDog) then exit;
 ViewForm := TfrmTypeDog.Create(AParameter);
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
