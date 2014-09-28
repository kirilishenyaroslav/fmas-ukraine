{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2005               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Главный модуль                                               }
{                                               ответственный: Тимофеев Антон  }


unit U_SPPost_Main;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, U_SPPost,
        U_SPPost_DataModule, IBase;

type
    TSPPostSprav = class(TSprav)
    private
        DataModule: TDMSPPost;
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

uses UpKernelUnit;

function CreateSprav: TSprav;
begin
    Result := TSPPostSprav.Create;
end;

function IsMDIChildFormShow(AClass:TClass):boolean;
var IsFormShow:boolean;
    i:integer;
begin
IsFormShow:=False;
for i:=Application.MainForm.MDIChildCount-1 downto 0 do
 if (Application.MainForm.MDIChildren[i].ClassType = AClass) then
  begin
     IsFormShow:=True;
     Application.MainForm.MDIChildren[i].BringToFront;
     break;
  end;
IsMDIChildFormShow:=IsFormShow;
end;

constructor TSPPostSprav.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Actual_Date', ftDate);

    Output.FieldDefs.Add('Id_Category', ftInteger);
    Output.FieldDefs.Add('Name_Category', ftString, 50);
    Output.FieldDefs.Add('Id_Post', ftInteger);
    Output.FieldDefs.Add('Name_Post', ftString, 50);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor TSPPostSprav.Destroy;
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
procedure TSPPostSprav.PrepareConnect;
var
    hnd: Integer;
begin
    DataModule := TDMSPPost.Create(Application.MainForm);

    with DataModule do
    begin
        if FIBDatabase.Connected then
            FIBDatabase.Connected := False;
        hnd := Input['DBHandle'];
        FIBDatabase.Handle := TISC_DB_HANDLE(hnd);
        FIBDS_SPPost.ParamByName('ActDate').AsDate := Input['Actual_Date'];
    end;
    IsConnected := True;

    StartHistory(DataModule.FIBWriteTransaction);
end;

procedure TSPPostSprav.Show;
var
    form: TSP_Post;
begin
    if IsMDIChildFormShow(TSP_Post) then Exit;

    if not IsConnected then PrepareConnect;

    form := TSP_Post.Create(Application.MainForm, DataModule, Input, Output);
    form.Visible:=false;
    if ( Input['ShowStyle'] = 0 ) or ( Input['Select'] > 0 ) then
    begin
        form.ShowModal;
        form.Free;
    end
    else
        form.FormStyle := fsMDIChild;
end;

function    TSPPostSprav.Exists: boolean;
begin
    if not IsConnected then PrepareConnect;
    Result := True;
end;

procedure   TSPPostSprav.GetInfo;
begin
    if not IsConnected then PrepareConnect;
end;

end.
