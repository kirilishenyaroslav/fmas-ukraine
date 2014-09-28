//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника факультетов, специальностей и групп
// Чернявский А.Э. 2005г.
//******************************************************************************
unit FacultySpecGroup_Loader;

interface
uses Classes, FacultySpecGroup_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPFacSpecGroup(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPFacSpecGroup;

implementation

function ShowSPFacSpecGroup(AParameter:TcnSimpleParams):Variant;stdcall;
  var ViewForm:TfrmFacultySpecGruop;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmFacultySpecGruop) then exit;
 ViewForm := TfrmFacultySpecGruop.Create(AParameter);
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
