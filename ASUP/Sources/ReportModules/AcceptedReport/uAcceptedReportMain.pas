{*******************************************************************************
* uAcceptedReportMain                                                        *
*                                                                              *
*Главный модуль отчета по работникам принятым за определенный период           *
* Copyright © 2004-2005,Данил Н. Збуривский, Донецкий Национальный Университет *
*******************************************************************************}

unit uAcceptedReportMain;



interface
    uses    uCommonSp,dmAcceptedMain,uAcceptedReportForm,IBase,Forms,DB;
type
    TAcceptedReport=class(TSprav)
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
    Result := TAcceptedReport.Create;
end;

constructor TAcceptedReport.Create;
begin
    inherited Create;

    DataModule:=TMainDM.Create(Application.MainForm);
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    PrepareMemoryDatasets;
end;

destructor TAcceptedReport.Destroy;
begin

    inherited Destroy;
    DataModule.Free;

end;

procedure TAcceptedReport.Show;
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
