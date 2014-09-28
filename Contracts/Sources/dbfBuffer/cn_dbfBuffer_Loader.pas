//******************************************************************************
// Проект "Контракты"
// dbf-buffer loader
// Чернявский А.Э. 2006г.
//******************************************************************************
unit cn_dbfBuffer_Loader;

interface
uses Classes, cn_dbfBuffer_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowDbfBuffer(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowDbfBuffer;

implementation

function ShowDbfBuffer(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmBuffer;
begin
 if IsMDIChildFormShow(TfrmBuffer) then exit;
 ViewForm := TfrmBuffer.Create(AParameter.Owner, AParameter.Db_Handle);
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
