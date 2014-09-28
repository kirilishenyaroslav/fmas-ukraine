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
    TRemindForm = class(TSprav)
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uReminderForm;

function CreateSprav: TSprav;
begin
    Result := TRemindForm.Create;
end;

constructor TRemindForm.Create;
begin
    inherited Create;
        // подготовить параметры
    PrepareMemoryDatasets;
end;

procedure TRemindForm.Show;
var
    form: TReminderForm;
begin
    form:=TReminderForm.Create(Application.MainForm);
    form.ShowModal;
    form.Free;
end;

end.
