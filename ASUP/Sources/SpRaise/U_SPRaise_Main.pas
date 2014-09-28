{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2005               }
{******************************************************************************}

{                      Пакет "Справочник надбавок"                             }
{                 Главный модуль                                               }
{                                               ответственный: Тимофеев Антон  }


unit U_SPRaise_Main;

interface

uses uCommonSp, DB, Forms, Dialogs, Controls, U_SP_Raise,
    U_SPRaise_DataModule, IBase;

type
    TSPRaiseSprav = class(TSprav)
    private
        DataModule: TDMSPRaise;
        IsConnected: Boolean;
        procedure PrepareConnect;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;
        procedure GetInfo; override;
        function Exists: boolean; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TSPRaiseSprav.Create;
end;

constructor TSPRaiseSprav.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Actual_Date', ftDate);
        // тип отображения надбавок: 0 для справочника, 1 для штатного, 2 только надбавки + доплаты, 3-только мат помощи и премии
    Input.FieldDefs.Add('Raise_Select_Kind', ftDate);

    Output.FieldDefs.Add('Id_raise', ftInteger);
    Output.FieldDefs.Add('Name', ftString, 50);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor TSPRaiseSprav.Destroy;
begin
    if IsConnected then
    begin
        DataModule.FIBReadTransaction.Active := False;
        DataModule.FIBWriteTransaction.Active := False;
        if DataModule <> nil then DataModule.Free;
    end;

    inherited Destroy;
end;


procedure TSPRaiseSprav.PrepareConnect;
var
    hnd: Integer;
begin
    DataModule := TDMSPRaise.Create(Application.MainForm);

    with DataModule do
    begin
        if FIBDatabase.Connected then
            FIBDatabase.Connected := False;
        hnd := Input['DBHandle'];
        FIBDatabase.Handle := TISC_DB_HANDLE(hnd);
    end;
    IsConnected := True;
end;

procedure TSPRaiseSprav.Show;
var
    form: TSP_Raise;
begin
    if not IsConnected then PrepareConnect;

    form := TSP_Raise.Create(Application.MainForm, DataModule, Input, Output);
    form.Visible := false;
    if (Input['ShowStyle'] = 0) or (Input['Select'] > 0) then
    begin
        form.DP_Date.Date := Input['Actual_Date'];
        form.ShowModal;
        form.Free;
    end
    else
        form.FormStyle := fsMDIChild;
end;

function TSPRaiseSprav.Exists: boolean;
begin
    if not IsConnected then PrepareConnect;
    Result := True;
end;

procedure TSPRaiseSprav.GetInfo;
begin
    if not IsConnected then PrepareConnect;
end;

end.

