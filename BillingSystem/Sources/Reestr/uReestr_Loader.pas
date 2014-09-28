//******************************************************************************
//* Проект "Горводоканал"                                                      *
//* Загрузчик реестра контрактов                                               *
//* Выполнил Перчак А.Л. 2010г.                                                *
//******************************************************************************
unit uReestr_Loader;

interface
uses Classes, uReestr_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowReestr(AParameter:TbsSimpleParams):Variant;stdcall;
 exports ShowReestr;

implementation

function ShowReestr(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmReestr_main;
begin
  if IsMDIChildFormShow(TfrmReestr_main) then exit;

  ViewForm := TfrmReestr_Main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  case ViewForm.FormStyle of
    fsMDIChild	          : ViewForm.Show;
   else
    begin
     ViewForm.ShowModal;
     Result:=ViewForm.res;
     ViewForm.free;
    end;
  end;
end;

end.
