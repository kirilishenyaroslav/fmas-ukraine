{*******************************************************************************
* upcPochasPage                                                               *
*                                                                              *
* Почасовка в личной карточке                                                     *
* Copyright ©  2005, Тимофеев Антон, Донецкий Национальный Университет         *
*******************************************************************************}


unit uPochasPage;

interface

uses     uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TpcPochasPage = class(TSprav)
    public
        constructor Create;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uPochasFrame, uPochasDataModule;

function CreateSprav: TSprav;
begin
    Result := TpcPochasPage.Create;
end;

constructor TpcPochasPage.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Id_PCard', ftInteger);
    Input.FieldDefs.Add('Modify', ftInteger);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

function TpcPochasPage.GetFrame: TFrame;
var
    DM: TdmPochas;
    hnd: Integer;
begin
    DM := TdmPochas.Create(Application.MainForm);
    hnd := Input['DBHandle'];
    DM.DB.Handle := TISC_DB_Handle(hnd);
    Result := TfmPCardPochasPage.Create(Application.MainForm, DM, Input['Id_PCard'], Input['modify']);
end;

end.
