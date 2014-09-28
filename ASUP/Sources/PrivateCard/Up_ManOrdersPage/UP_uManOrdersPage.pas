unit UP_uManOrdersPage;

interface

uses     uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TpcManOrdersPage = class(TSprav)
    public
        constructor Create;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, UP_uManOrdersFrame;

function CreateSprav: TSprav;
begin
    Result := TpcManOrdersPage.Create;
end;

constructor TpcManOrdersPage.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_PCard', ftInteger);
    Input.FieldDefs.Add('Modify', ftInteger);
    Input.FieldDefs.Add('Actual_Date', ftDate);

    // подготовить параметры
    PrepareMemoryDatasets;
end;

function TpcManOrdersPage.GetFrame: TFrame;
begin
    Result := TfmManOrdersPage.Create(Application.MainForm,
                                       TISC_DB_HANDLE(Integer(Input['DBHandle'])),
                                       Input['Id_PCard'],
                                       Input['modify'],
                                       Input['Actual_Date']);
end;

end.
