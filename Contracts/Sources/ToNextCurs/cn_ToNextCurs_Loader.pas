//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2006г.
//******************************************************************************
unit cn_ToNextCurs_Loader;

interface
uses Classes, cn_ToNextCurs_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowToNextCurs(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowToNextCurs;

implementation

function ShowToNextCurs(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmToNextCurs;
begin
 if IsMDIChildFormShow(TfrmToNextCurs) then exit;
 ViewForm := TfrmToNextCurs.Create(AParameter.Owner, AParameter.Db_Handle);
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
