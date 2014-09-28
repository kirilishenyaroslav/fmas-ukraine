{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2005               }
{******************************************************************************}

{                      Пакет "Справочник регалий"                              }
{                 Главный модуль                                               }
{                                               ответственный: Тимофеев Антон  }


unit U_SPRegards_Main;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, U_SPRegards,
        U_SPRegardsDM, IBase;

type
    TSPRegardsSprav = class(TSprav)
    private
        DataModule: TDMSPRegards;
        IsConnected: Boolean;
        procedure PrepareConnect;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
        procedure   GetInfo;override;
        function    Exists: boolean;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TSPRegardsSprav.Create;
end;

constructor TSPRegardsSprav.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('id_group', ftVariant);

    Output.FieldDefs.Add('Id_regard', ftInteger);
    Output.FieldDefs.Add('Full_Name', ftString, 50);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor TSPRegardsSprav.Destroy;
begin
    inherited Destroy;

    if IsConnected then
    begin
        DataModule.FIBReadTransaction.Active := False;
        DataModule.FIBWriteTransaction.Active := False;
    end;

    DataModule.Free;
end;

        // подготовить соединение с базой
procedure TSPRegardsSprav.PrepareConnect;
var
    hnd: Integer;
begin
    DataModule := TDMSPRegards.Create(Application.MainForm);

    with DataModule do
    begin
        if FIBDatabase.Connected then
            FIBDatabase.Connected := False;
        hnd := Input['DBHandle'];
        FIBDatabase.Handle := TISC_DB_HANDLE(hnd);
        FibDataSetFull.ParamByName('Id_group').AsVariant:=Input['id_group'];
    end;
    IsConnected := True;
end;

procedure TSPRegardsSprav.Show;
var
    form: TForm_SPRegards;
begin
    if not IsConnected then PrepareConnect;

    form := TForm_SPRegards.Create(Application.MainForm, DataModule, Input, Output);
    form.Visible:=false;
    if ( Input['ShowStyle'] = 0 ) or ( Input['Select'] > 0 ) then
    begin
        form.ShowModal;
        form.Free;
    end
    else
        form.FormStyle := fsMDIChild;
end;

function    TSPRegardsSprav.Exists: boolean;
begin
    if not IsConnected then PrepareConnect;
    Result := True;
end;

procedure   TSPRegardsSprav.GetInfo;
begin
    if not IsConnected then PrepareConnect;
end;

end.
