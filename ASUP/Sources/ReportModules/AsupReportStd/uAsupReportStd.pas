{*******************************************************************************
* uAsupReportStd                                                               *
*                                                                              *
* Главный модуль отчета по периодам избрания                                   *
* Copyright © 2006, Пашенко Г.В.                                               *
* Донецкий Национальный Университет                                            *
*******************************************************************************}
unit uAsupReportStd;

interface
uses Classes, IBase, dmAsupReportStd, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,Asup_LoaderPrintDocs_Types, fmAsupReportStd,
     uCommonSp, DB;

type
    TAsupReportStd =class(TSprav)
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
    Result := TAsupReportStd.Create;
end;

constructor TAsupReportStd.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    PrepareMemoryDatasets;
end;

destructor TAsupReportStd.Destroy;
begin
    inherited Destroy;
end;

procedure TAsupReportStd.Show;
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
    FilterForm.DesignRep:=Input['DesignReport'];
    if FilterForm.ShowModal<>mrYes then
    begin
        FilterForm.Free;
        Exit;
    end;
    ReportDM := TDM.Create((AParameter as TSimpleParam).Owner);
    ReportDM.DateForm := FilterForm.DateEdit.Date;
    ReportDM.DateWork := FilterForm.WorkEdit.Date;
    ReportDM.DateStd := FilterForm.StdEdit.Date;
    ReportDM.Id_Department := FilterForm.Id_Department;
    ReportDM.WithChild := FilterForm.CheckBoxWithChild.Checked;
    ReportDM.DesignRep:=Input['DesignReport'];
    FilterForm.Free;
    ReportDM.PrintSpr(AParameter as TSimpleParam);
    ReportDM.Free;
    AParameter.Destroy;
end;

end.
