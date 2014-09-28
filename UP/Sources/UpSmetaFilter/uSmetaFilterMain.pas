{*******************************************************************************
* uSmetaFilterMain                                                             *
*                                                                              *
* Фильтр смет                                                                  *
* Copyright ©  2008, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uSmetaFilterMain;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TSmetaFilter = class(TSprav)
    private
    public
        constructor Create;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uSmetaFilter;

function CreateSprav: TSprav;
begin
    Result := TSmetaFilter.Create;    
end;

constructor TSmetaFilter.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DB_Id_Session', ftInteger);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

function TSmetaFilter.GetFrame: TFrame;
var
    hnd: Integer;
begin
    hnd := Input['DBHandle'];
    Result := TfrmSmetaFilter.Create(Application.MainForm, TISC_DB_HANDLE(hnd), Input['DB_Id_Session']);
end;

end.


