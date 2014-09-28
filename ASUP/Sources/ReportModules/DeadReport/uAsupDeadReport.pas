{*******************************************************************************
* uAsupDeadReport                                                              *
*                                                                              *
* Главный модуль отчета по работникам, выбывшим по причине смерти              *
* Copyright © 2006, Пашенко Г.В.                                               *
* Донецкий Национальный Университет                                            *
*******************************************************************************}
unit uAsupDeadReport;

interface
uses Classes, IBase, dmAsupDeadReport, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,Asup_LoaderPrintDocs_Types, fmAsupDeadReport,
     uCommonSp, DB;

type
    TAsupDeadReport =class(TSprav)
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
    Result := TAsupDeadReport.Create;
end;

constructor TAsupDeadReport.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    PrepareMemoryDatasets;
end;

destructor TAsupDeadReport.Destroy;
begin
    inherited Destroy;
end;

procedure TAsupDeadReport.Show;
var
    FilterForm:TFormOptions;
    AParameter:TSimpleParam;
    hnd:integer;
begin
    AParameter := TSimpleParam.Create;
    AParameter.Owner := Application.MainForm;
    hnd := Input.FieldValues['DBHandle'];
    DM := TDM.Create(nil);
    DM.DB.Handle := TISC_DB_HANDLE(hnd);

    FilterForm:=TFormOptions.Create(AParameter as TSimpleParam);
    FilterForm.DesignRep:=Input['DesignReport'];

    if FilterForm.ShowModal<>mrYes then
    begin
        FilterForm.Free;
        Exit;
    end;
    with DM do
    begin
        DateFormBeg := FilterForm.DateEditBeg.Date;
        DateFormEnd := FilterForm.DateEditEnd.Date;
        Id_Department := FilterForm.Id_Department;
        WithChild := FilterForm.CheckBoxWithChild.Checked;
        FontNames := FilterForm.FontNames;
        FontSizes := FilterForm.FontSizes;
        FontColors := FilterForm.FontColors;
        FontStyles:= FilterForm.FontStyles;
        DesignRep:=Input['DesignReport'];
        FilterForm.Free;
        PrintSpr(AParameter as TSimpleParam);
        Free;
    end;

    AParameter.Destroy;
end;

end.
