{*******************************************************************************
* uShtatReport2                                                                *
*                                                                              *
* Отчет по штатному                                                            *
* Copyright ©  2008, Олег Г. Волков, Донецкий национальный университет         *
*******************************************************************************}


unit uShtatReport2;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TShtatReport2 = class(TSprav)
    private
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uShtatReport2Params;

function CreateSprav: TSprav;
begin
    Result := TShtatReport2.Create;
end;

constructor TShtatReport2.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

procedure TShtatReport2.Show;
var
    form: TfmShtatReport2Params;
begin
    form := TfmShtatReport2Params.Create(Application.MainForm, Input['DBHandle']);
    form.ShowModal;
    form.Free;
end;

end.

