{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2006               }
{******************************************************************************}

{                      Пакет "пересчет стажа"                                  }
{                                                                              }
{                                               ответственный: Тимофеев Антон  }
unit uMainUnit;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TRecalcForm = class(TSprav)
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uStajRecalcForm;

function CreateSprav: TSprav;
begin
    Result := TRecalcForm.Create;
end;

constructor TRecalcForm.Create;
begin
    inherited Create;
        // подготовить параметры
    PrepareMemoryDatasets;
end;

procedure TRecalcForm.Show;
var
    hnd: Integer;
    form: TStajRecalcForm;
begin
    hnd := Input['DBHandle'];
    form:=TStajRecalcForm.Create(Application.MainForm, hnd);
//    form.pFIBD_FullDB.Handle:=TISC_DB_HANDLE(hnd);
    form.ShowModal;
    form.Free;
end;

end.
