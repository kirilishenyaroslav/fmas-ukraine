unit uHolidayForm;

interface

uses     uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TpcHolidayForm = class(TSprav)
    public
        constructor Create;

    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, HolidayDM, Holiday_Form;

function CreateSprav: TSprav;
begin
    Result := TpcHolidayForm.Create;
end;

constructor TpcHolidayForm.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Id_PCard', ftInteger);
    Input.FieldDefs.Add('Modify', ftInteger);

        // подготовить параметры
    PrepareMemoryDatasets;
end;


end.
