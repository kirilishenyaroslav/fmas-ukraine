{*******************************************************************************
* uAsupReportCandZaslProf                                                      *
*                                                                              *
* Главный модуль отчета по списку кандидатов в засл. профессора                *
* Copyright © 2006, Пашенко Г.В.                                               *
* Донецкий Национальный Университет                                            *
*******************************************************************************}
unit uAsupReportCandZaslProf;

interface
uses Classes, IBase, dmAsupReportCandZaslProf, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,Asup_LoaderPrintDocs_Types, fmAsupReportCandZaslProf,
     uCommonSp, DB;

type
    TAsupReportCandZaslProf=class(TSprav)
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
    Result := TAsupReportCandZaslProf.Create;
end;

constructor TAsupReportCandZaslProf.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    PrepareMemoryDatasets;
end;

destructor TAsupReportCandZaslProf.Destroy;
begin
    inherited Destroy;
end;

procedure TAsupReportCandZaslProf.Show;
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
        DateForm := FilterForm.DateFormEdit.Date;
        DesignRep:=Input['DesignReport'];
        FontNames := FilterForm.FontNames;
        FontSizes := FilterForm.FontSizes;
        FontColors := FilterForm.FontColors;
        FontStyles:= FilterForm.FontStyles;
        FilterForm.Free;
        PrintSpr(AParameter as TSimpleParam);
        Free;
    end;
    AParameter.Destroy;
end;

end.
