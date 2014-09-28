unit UpManWorkModePage;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TpcManWorkMode = class(TSprav)
    public
        constructor Create;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, UpManWorkModeFrame;

function CreateSprav: TSprav;
begin
    Result := TpcManWorkMode.Create;
end;

constructor TpcManWorkMode.Create;
begin
    inherited Create;
    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_PCard', ftInteger);
    Input.FieldDefs.Add('Modify', ftInteger);
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('Select_Type',ftInteger);
    // подготовить параметры
    PrepareMemoryDatasets;
end;

function TpcManWorkMode.GetFrame: TFrame;
begin
     Result := TfrmManWorkMode.Create(Application.MainForm,
                                          TISC_DB_HANDLE(Integer(Input['DBHandle'])),
                                          Input['Id_PCard'],
                                          Input['Actual_Date'],
                                          0,
                                          Input['Modify']);
end;
end.
