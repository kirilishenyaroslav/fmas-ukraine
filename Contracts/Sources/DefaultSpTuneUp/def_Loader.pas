//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника национальностей
// Чернявский А.Э. 2005г.
//******************************************************************************
unit National_Loader;

interface
uses Classes, National_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPNational(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPNational;

implementation

function ShowSPNational(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmNationality;
begin
 if IsMDIChildFormShow(TfrmNationality) then exit;
 ViewForm := TfrmNationality.Create(AParameter.Owner, AParameter.Db_Handle);
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
