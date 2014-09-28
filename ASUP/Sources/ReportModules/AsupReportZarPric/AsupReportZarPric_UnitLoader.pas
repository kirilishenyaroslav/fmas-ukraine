{*******************************************************************************
* AsupReportZarPric                                                            *                                                                              *
* Главный модуль отчета по зарегистрированным приказам                         *
* Copyright © 2005-2006,Пашенко Г.В.                                           *
*  Донецкий Национальный Университет                                           *
*******************************************************************************}
unit AsupReportZarPric_UnitLoader;

interface
uses Classes, IBase, AsupReportZarPric_PrintDM, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,Asup_LoaderPrintDocs_Types, AsupReportZarPric_FilterForm,
     uCommonSp, DB;

type
    TAsupReportZarPric=class(TSprav)
    private
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;

function CreateSprav:TSprav;stdcall;
exports CreateSprav;

implementation

uses Math;

function CreateSprav: TSprav;
begin
    Result := TAsupReportZarPric.Create;
end;

constructor TAsupReportZarPric.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    PrepareMemoryDatasets;
end;

destructor TAsupReportZarPric.Destroy;
begin
    inherited Destroy;
end;

procedure TAsupReportZarPric.Show;
var ReportDM:TDM;
    FilterForm:TFormOptions;
    AParameter:TSimpleParam;
    hnd:integer;
begin
  AParameter := TSimpleParam.Create;
  AParameter.Owner := Application.MainForm;
  hnd := Input.FieldValues['DBHandle'];
  AParameter.DB_Handle := TISC_DB_HANDLE(hnd);

  FilterForm:=TFormOptions.Create(AParameter as TSimpleParam);
  if FilterForm.ShowModal<>mrYes then
   begin
    FilterForm.Free;
    Exit;
   end;
  ReportDM := TDM.Create((AParameter as TSimpleParam).Owner);
  ReportDM.DateForm := FilterForm.DateEdit.Date;
  ReportDM.Exp:=FilterForm.Exp;    
  FilterForm.Free;
  ReportDM.PrintSpr(AParameter as TSimpleParam);
  ReportDM.Free;
  AParameter.Destroy;
end;

end.
