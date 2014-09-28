unit LoaderWorkHourse;

interface

uses FilterFormWorkHourse,DMSprWorkHours, Classes, IBase, Controls, ZTypes, SysUtils, forms, ZProc;

function View_SprWorkHours(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE):Variant;stdcall;
exports View_SprWorkHours;
function CreateSpr(Param :TZSimpleParamDate):Variant;

const PathReport='Reports\Zarplata\SprWorkHours.fr3';
var FDMSprWorkHours: TFDMSprWorkHours;
implementation
                //CreateSprSubs(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE;
function View_SprWorkHours(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE):Variant;
var Param :TZSimpleParamDate;
FFilterFormWorkHourse: TFFilterFormWorkHourse;
begin
  Param:=TZSimpleParamDate.Create;
  Param.Owner:=AOwner;
  Param.DB_Handle:=ADb_Handle;
  FFilterFormWorkHourse:=TFFilterFormWorkHourse.create(Param);
  FDMSprWorkHours:=TFDMSprWorkHours.create(Param);
  while FFilterFormWorkHourse.showmodal = mrYes do
    CreateSpr(Param);
  FDMSprWorkHours.Free;
  FFilterFormWorkHourse.Free;
end;

function CreateSpr(Param :TZSimpleParamDate):Variant;
begin
  with FDMSprWorkHours  do
  begin
  DSetWorkHours.Close;
  DSetWorkHours.SQLs.SelectSQL.Text:='Select * From Z_WORK_HOURS ('''+DateToStr(Param.Datebeg)+''','''+DateToStr(Param.DateEnd)+''') '+
  'order by FIO, NAME_POST, SMETA_KOD';
  DSetWorkHours.Open;

  Report.Clear;
  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);
  if zDesignReport then Report.DesignReport
  else Report.ShowReport;
  end;
end;

end.
