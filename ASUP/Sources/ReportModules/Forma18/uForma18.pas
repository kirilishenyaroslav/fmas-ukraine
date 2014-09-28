{*******************************************************************************
* uForma18                                                                     *
*                                                                              *
* Форма №18                                                                    *
* Copyright © 2006, Пашенко Г.В.                                               *
* Донецкий Национальный Университет                                            *
*******************************************************************************}
unit uForma18;

interface
uses Classes, IBase, dmForma18, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,Asup_LoaderPrintDocs_Types, fmForma18,
     uCommonSp, DB;

type
    TForma18 =class(TSprav)
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
    Result := TForma18.Create;
end;

constructor TForma18.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    PrepareMemoryDatasets;
end;

destructor TForma18.Destroy;
begin
    inherited Destroy;
end;

procedure TForma18.Show;
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
