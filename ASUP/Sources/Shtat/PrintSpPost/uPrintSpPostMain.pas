{*******************************************************************************
* uPrintSpPostMain                                                             *
*                                                                              *
* Печать справочника должностных окладов                                       *
* Copyright ©  2006, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uPrintSpPostMain;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, uPrintSpPostData, IBase;

type
    TPrintSpPost = class(TSprav)
    private
        DataModule: TdmPrintSpPost;
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

uses Variants, SysUtils, uPrintSpPostForm;

function CreateSprav: TSprav;
begin
    Result := TPrintSpPost.Create;
end;

constructor TPrintSpPost.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Actual_Date', ftDate);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor TPrintSpPost.Destroy;
begin
    inherited Destroy;

    if IsConnected then
    begin
        DataModule.ReadTransaction.Active := False;
    end;

    DataModule.Free;
end;

        // подготовить соединение с базой
procedure TPrintSpPost.PrepareConnect;
var
    hnd: Integer;
begin
    DataModule := TdmPrintSpPost.Create(nil);

    with DataModule do
    begin
        if Database.Connected then
            Database.Connected := False;
        hnd := Input['DBHandle'];
        Database.Handle := TISC_DB_HANDLE(hnd);
        Database.Connected := True;
    end;

    IsConnected := True;
end;


procedure TPrintSpPost.Show;
var
    form: TfmPrintSpPost;
begin
    if not IsConnected then PrepareConnect;

    form := TfmPrintSpPost.Create(Application.MainForm, DataModule);
    if ( Input['ShowStyle'] = 0 ) or ( Input['Select'] > 0 ) then
    begin
        form.ShowModal;
        form.Free;
    end
    else
    begin
        form.FormStyle := fsMDIChild;
        form.WindowState := wsMaximized;
    end;
end;

function    TPrintSpPost.Exists: boolean;
begin
    if not IsConnected then PrepareConnect;
    Result := True;
end;

procedure   TPrintSpPost.GetInfo;
begin
    if not IsConnected then PrepareConnect;
end;

end.
