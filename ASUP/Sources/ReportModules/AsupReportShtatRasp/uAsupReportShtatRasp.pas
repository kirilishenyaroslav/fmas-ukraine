{*******************************************************************************
* uAsupReportShtatRasp                                                         *
*                                                                              *
* Выполнение штатного расписания                                               *
* Copyright © 2006, Пашенко Г.В.                                               *
* Донецкий Национальный Университет                                            *
*******************************************************************************}
unit uAsupReportShtatRasp;

interface
uses Classes, IBase, dmAsupReportShtatRasp, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,Asup_LoaderPrintDocs_Types, fmAsupReportShtatRasp,
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
    DM := TDM.Create(nil);
    DM.DB.Handle := TISC_DB_HANDLE(hnd);

    FilterForm:=TFormOptions.Create(AParameter as TSimpleParam);
    FilterForm.DesignRep:=Input['DesignReport'];

    if FilterForm.ShowModal<>mrYes then
    begin
        FilterForm.Free;
        Exit;
    end;
    //ReportDM := TDM.Create((AParameter as TSimpleParam).Owner);
    with DM do
    begin
        DateForm := FilterForm.DateEdit.Date;
        Id_Department := FilterForm.Id_Department;
        Id_SR := FilterForm.Id_SR;
        WithChild := FilterForm.CheckBoxWithChild.Checked;
        TypePost:= FilterForm.TypePost;
        KodSM:= FilterForm.KodSm;
        NameTypePost:= FilterForm.ComboTypePost.Text;
        DesignRep:=Input['DesignReport'];
       FilterForm.Free;
       PrintSpr(AParameter as TSimpleParam);
       Free;
    end;

    AParameter.Destroy;
end;

end.
