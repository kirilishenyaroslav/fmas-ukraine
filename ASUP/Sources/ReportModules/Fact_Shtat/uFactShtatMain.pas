{*******************************************************************************
* uFactShtatMain                                                               *
*                                                                              *
* Главный модуль отчета по фактическому штатному                               *
* Copyright © 2006 Волков Олег Геннадиевич                                     *
* Донецкий Национальный Университет                                            *
*******************************************************************************}

unit uFactShtatMain;

interface
uses    uCommonSp, uFactShtatData,IBase,Forms,DB;

type
    TFactShtat=class(TSprav)
    private
        DataModule: TdmFactShtatData;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;

function CreateSprav:TSprav;stdcall;
exports CreateSprav;

implementation

uses SysUtils, uFactShjtat;


function CreateSprav: TSprav;
begin
    Result := TFactShtat.Create;
end;

constructor TFactShtat.Create;
begin
    inherited Create;
    DataModule:= TdmFactShtatData.Create(Application.MainForm);

    Input.FieldDefs.Add('DesignReport', ftBoolean);
    PrepareMemoryDatasets;
end;

destructor TFactShtat.Destroy;
begin
    inherited Destroy;
    DataModule.Free;
end;

procedure TFactShtat.Show;
var
    hnd: Integer;
    form: TfmFactShtat;
begin
    with DataModule do
    begin
        if Database.Connected then
            Database.Connected:=False;
        hnd:=Input['DBHandle'];
        Database.Handle:=TISC_DB_HANDLE(hnd);
        Database.Connected:=True;
    end;

    form := TfmFactShtat.Create(Application.MainForm);
    form.Design:=Input['DesignReport'];
    form.DataModule:=DataModule;
    form.ShowModal;
    form.Free;
end;
end.

