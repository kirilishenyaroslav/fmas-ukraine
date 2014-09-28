{*******************************************************************************
* upcRegardsPage                                                               *
*                                                                              *
* Регалии в личной карточке                                                     *
* Copyright ©  2005, Тимофеев Антон, Донецкий Национальный Университет         *
*******************************************************************************}


unit uRegardsPage;

interface

uses     uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TpcRegardsPage = class(TSprav)
    public
        constructor Create;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uRegardsFrame, uRegardsDataModule;

function CreateSprav: TSprav;
begin
    Result := TpcRegardsPage.Create;
end;

constructor TpcRegardsPage.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Id_PCard', ftInteger);
    Input.FieldDefs.Add('Modify', ftInteger);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

function TpcRegardsPage.GetFrame: TFrame;
var
    DM: TdmRegards;
    hnd: Integer;
begin
    DM := TdmRegards.Create(Application.MainForm);
    hnd := Input['DBHandle'];
    DM.DB.Handle := TISC_DB_Handle(hnd);
    Result := TfmPCardRegardsPage.Create(Application.MainForm, Dm, Input['Id_PCard'], Input['modify'], hnd);
end;

end.
