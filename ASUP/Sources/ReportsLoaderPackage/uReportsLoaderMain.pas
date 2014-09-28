{*******************************************************************************
* uReportsLoaderMain                                                           *
*                                                                              *
*Главный модуль загрузчика отчетов                                             *
* Copyright © 2004-2005,Данил Н. Збуривский, Донецкий Национальный Университет *
*******************************************************************************}

unit uReportsLoaderMain;

interface

uses    uCommonSp,dmLoaderMain,uMainForm,IBase,Forms,DB;

type
    TReportsLoader=class(TSprav)
    private
        DataModule: TMainDM;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;

function CreateSprav:TSprav;stdcall;
exports  CreateSprav;

implementation
uses SysUtils;

function CreateSprav: TSprav;
begin
    Result := TReportsLoader.Create;
end;

constructor TReportsLoader.Create;
begin
    inherited Create;


     DataModule:=TMainDM.Create(Application.MainForm);



     Input.FieldDefs.Add('DesignReport', ftBoolean);
     PrepareMemoryDatasets;
end;

destructor TReportsLoader.Destroy;
begin

    inherited Destroy;
    DataModule.Free;

end;

procedure TReportsLoader.Show;
var
    hnd: Integer;
    form:TMainForm;
begin



    with DataModule do
    begin
        if Database.Connected then
            Database.Connected:=False;
        hnd:=Input['DBHandle'];
        Database.Handle:=TISC_DB_HANDLE(hnd);
        Database.Connected:=True;
    end;

    form:=TMainForm.Create(Application.MainForm);
    form.DesignReport:=Input['DesignReport'];
    form.DataModule:=DataModule;
    form.ShowModal;
end;


end.
