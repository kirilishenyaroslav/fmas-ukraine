{*******************************************************************************
* uDeadReportMain                                                              *                                                                              *
* Главный модуль отчета по работникам выбывшим по причине смерти               *
* Copyright © 2004-2005,Татаринов Е.,                                          *
*  Данил Н. Збуривский, Донецкий Национальный Университет                      *
*******************************************************************************}

unit uDeadReportMain;

interface

uses    uCommonSp,dmDeadMain,uDeadReportForm,IBase,Forms,DB;

type
    TDeadReportMain=class(TSprav)
    private
        DataModule: TDeadMainDM;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;

function CreateSprav:TSprav;stdcall;
exports CreateSprav;

implementation

uses SysUtils;

function CreateSprav: TSprav;
begin
    Result := TDeadReportMain.Create;
end;

constructor TDeadReportMain.Create;
begin
    inherited Create;


     DataModule:=TDeadMainDM.Create(Application.MainForm);
     Input.FieldDefs.Add('DesignReport', ftBoolean);
     PrepareMemoryDatasets;
end;

destructor TDeadReportMain.Destroy;
begin

    inherited Destroy;
    DataModule.Free;

end;

procedure TDeadReportMain.Show;
var
    hnd: Integer;
    form:TReportForm;
begin

    with DataModule do
    begin
        if Database.Connected then
            Database.Connected:=False;
        hnd:=Input['DBHandle'];
        Database.Handle:=TISC_DB_HANDLE(hnd);
        Database.Connected:=True;
    end;

    form:=TReportForm.Create(Application.MainForm);
    form.DesignReport:=Input['DesignReport'];
    form.DataModule:=DataModule;
    form.ShowModal;
end;

end.
