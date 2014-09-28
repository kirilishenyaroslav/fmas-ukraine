unit uExperPage;

interface

uses     uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TpcExperPage = class(TSprav)
    public
        constructor Create;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uExperFrame, uExperDataModule;

function CreateSprav: TSprav;
begin
    Result := TpcExperPage.Create;
end;

constructor TpcExperPage.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Id_PCard', ftInteger);
    Input.FieldDefs.Add('Modify', ftInteger);
    Input.FieldDefs.Add('Actual_Date', ftDate);


        // подготовить параметры
    PrepareMemoryDatasets;
end;

function TpcExperPage.GetFrame: TFrame;
var
    DM: TdmExper;
    hnd: Integer;
begin
    DM := TdmExper.Create(Application.MainForm);
    hnd := Input['DBHandle'];
    DM.DB.Handle := TISC_DB_Handle(hnd);
    Result := TfmPCardExperPage.Create(Application.MainForm, DM, Input['Id_PCard'], Input['modify'], Input['actual_date']);
end;

end.
