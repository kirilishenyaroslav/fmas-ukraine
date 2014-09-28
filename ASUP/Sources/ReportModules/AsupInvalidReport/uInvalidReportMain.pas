{*******************************************************************************
* uInvalidReportMain                                                           *
*                                                                              *
*Главный модуль отчета по инвалидам                                            *
* Copyright © 2004-2005,Татаринов Е.,Збуривский Д.Н.                           *
* Донецкий Национальный Университет                                            *
*******************************************************************************}

unit uInvalidReportMain;

interface
uses    uCommonSp,dmInvalidMain,uInvalidReportForm,IBase,Forms,DB;

type
    TInvalidReport=class(TSprav)
    private
        DataModule: TMainDM;
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
    Result := TInvalidReport.Create;
end;

constructor TInvalidReport.Create;
begin
    inherited Create;
    DataModule:=TMainDM.Create(Application.MainForm);

    Input.FieldDefs.Add('DesignReport', ftBoolean);
    PrepareMemoryDatasets;
end;

destructor TInvalidReport.Destroy;
begin

    inherited Destroy;
    DataModule.Free;

end;

procedure TInvalidReport.Show;
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
