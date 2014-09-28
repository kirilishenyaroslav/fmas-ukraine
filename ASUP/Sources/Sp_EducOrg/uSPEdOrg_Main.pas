{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2005               }
{******************************************************************************}

{                      Пакет "Справочник ВУЗов"                           }
{                 Главный модуль                                               }
{                                               ответственный: Тимофеев Антон  }


unit uSPEdOrg_Main;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, RXMemDS, IBase, uSPEdOrgForm, U_SPEducOrgDM;

type
    TSPEdOrgSprav = class(TSprav)
    private
        DataModule: TDM_SPEducOrg;
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
    Result := TSPEdOrgSprav.Create;
end;

constructor TSPEdOrgSprav.Create;
begin
    inherited Create;

        // создание входных/выходных полей

    Output.FieldDefs.Add('Id_EducOrg', ftInteger);
    Output.FieldDefs.Add('Name_EducOrg', ftString, 255);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor TSPEdOrgSprav.Destroy;
begin
    inherited Destroy;

    if IsConnected then
    begin
        DataModule.FIBSpEducOrgRT.Active := False;
        DataModule.FIBSpEducOrgWT.Active := False;
    end;

    DataModule.Free;
end;

        // подготовить соединение с базой
procedure TSPEdOrgSprav.PrepareConnect;
var
    hnd: Integer;
begin
    DataModule := TDM_SPEducOrg.Create(Application.MainForm);

    with DataModule do
    begin
        if FIBSpEducOrgDatabase.Connected then
            FIBSpEducOrgDatabase.Connected := False;
        hnd := Input['DBHandle'];
        FIBSpEducOrgDatabase.Handle := TISC_DB_HANDLE(hnd);
    end;
    IsConnected := True;
end;

procedure TSPEdOrgSprav.Show;
var
    form: TSPEdOrgForm;
begin
    if not IsConnected then PrepareConnect;

    form := TSPEdOrgForm.Create(Application.MainForm, DataModule, Input, Output);
    form.Visible:=false;
    if ( Input['ShowStyle'] = 0 ) or ( Input['Select'] > 0 ) then
    begin
        form.ShowModal;
        form.Free;
    end
    else
        form.FormStyle := fsMDIChild;
end;

function    TSPEdOrgSprav.Exists: boolean;
begin
    if not IsConnected then PrepareConnect;
    Result := True;
end;

procedure   TSPEdOrgSprav.GetInfo;
begin
    if not IsConnected then PrepareConnect;
end;

end.

