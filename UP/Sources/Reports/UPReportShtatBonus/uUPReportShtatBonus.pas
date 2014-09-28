{*******************************************************************************
* uAsupReportShtatBon                                                          *
*                                                                              *
* Выполнение штатного расписания                                               *
* Copyright © 2006, щеглов С.С.                                                *
* Донецкий Национальный Университет                                            *
*******************************************************************************}
unit uUPReportShtatBonus;

interface
uses Classes, IBase, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,Asup_LoaderPrintDocs_Types, fmUPReportShtatBonusMain,
     uCommonSp, DB;

type
    TAsupReportShtatRasp =class(TSprav)
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
    Result := TAsupReportShtatRasp.Create;
end;

constructor TAsupReportShtatRasp.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);
    PrepareMemoryDatasets;
end;

destructor TAsupReportShtatRasp.Destroy;
begin
    inherited Destroy;
end;

procedure TAsupReportShtatRasp.Show;
var //ReportDM:TDM;
    FilterForm:TFormOptions;
    AParameter:TSimpleParam;
    hnd:integer;
begin
    AParameter := TSimpleParam.Create;
    AParameter.Owner := Application.MainForm;
    hnd := Input.FieldValues['DBHandle'];
    
    AParameter.DB_Handle:= TISC_DB_HANDLE(hnd);

    FilterForm:=TFormOptions.Create(AParameter as TSimpleParam);

    if FilterForm.ShowModal<>mrYes then
    begin
        FilterForm.Free;
        Exit;
    end;

{    with DM do
    begin
        DateForm := FilterForm.DateEdit.Date;
        Id_Department := FilterForm.Id_Department;
        Id_SR := FilterForm.Id_SR;
        TypePost:= FilterForm.TypePost;
        KodSM:= FilterForm.KodSm;
        NameSM:=FilterForm.NameSm;
        NameDep:=FilterForm.NameDep;
        DesignRep:=Input['DesignReport'];
       FilterForm.Free;
       PrintSpr(AParameter as TSimpleParam);
       Free;
    end;}

    AParameter.Destroy;
end;

end.
