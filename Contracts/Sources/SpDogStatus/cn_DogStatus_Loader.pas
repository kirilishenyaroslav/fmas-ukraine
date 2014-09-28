//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника
// Чернявский А.Э. 2006г.
// последние изменения Перчак А.Л. 29/10/2008
//******************************************************************************
unit cn_DogStatus_Loader;

interface
uses Classes, cn_DogStaus_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPDogStatus(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPDogStatus;

implementation

function ShowSPDogStatus(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmDogStatus;
begin
 if IsMDIChildFormShow(TfrmDogStatus) then exit;
 ViewForm := TfrmDogStatus.Create(AParameter.Owner, AParameter.Db_Handle, AParameter.is_admin);
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
