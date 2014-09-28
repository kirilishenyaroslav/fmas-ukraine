unit uHolidayPage;

interface

uses     uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TpcHolidayPage = class(TSprav)
    public
        constructor Create;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, HolidayDM, uHolidayFrame;

function CreateSprav: TSprav;
begin
    Result := TpcHolidayPage.Create;
end;

constructor TpcHolidayPage.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Id_PCard', ftInteger);
    Input.FieldDefs.Add('Modify', ftInteger);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

function TpcHolidayPage.GetFrame: TFrame;
var
    hnd: Integer;
begin
    DM := TdmHoliday.Create(Application.MainForm);
    hnd := Input['DBHandle'];
    DM.DB.Handle := TISC_DB_Handle(hnd);
    Result := THolidayFrame.Create(Application.MainForm, DM, Input['Id_PCard'], Input['modify']);
end;

end.
