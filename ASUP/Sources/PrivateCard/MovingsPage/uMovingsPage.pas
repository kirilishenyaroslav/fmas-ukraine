{*******************************************************************************
* upcMovingsPage                                                               *
*                                                                              *
* Перемещения (карьера) личной карточки                                        *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uMovingsPage;

interface

uses     uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TpcMovingsPage = class(TSprav)
    public
        constructor Create;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uMovingsFrame, uMovingsDataModule;

function CreateSprav: TSprav;
begin
    Result := TpcMovingsPage.Create;
end;

constructor TpcMovingsPage.Create;
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

function TpcMovingsPage.GetFrame: TFrame;
var
    DM: TdmMovings;
    hnd: Integer;
begin

    DM := TdmMovings.Create(Application.MainForm);
    hnd := Input['DBHandle'];
    DM.DB.Handle := TISC_DB_Handle(hnd);
    Result := TfmPCardMovingsPage.Create(Application.MainForm, DM,
         Input['Id_PCard'], Input['Actual_Date'],0);

    ActualDate := Input['Actual_Date'];
  end;
end.
