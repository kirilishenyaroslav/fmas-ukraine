{*******************************************************************************
* uDismissedReporttMain                                                        *
*                                                                              *
*Главный модуль отчета по работникам уволеным за определенный период           *
* Copyright © 2004-2005,Данил Н. Збуривский, Донецкий Национальный Университет *
*******************************************************************************}

unit uDismissedReportMain;

interface
    uses    uCommonSp,dmDismissedMain,uDismissedReportForm,IBase,Forms,DB;
type
    TDismissedReport=class(TSprav)
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
    Result := TDismissedReport.Create;
end;

constructor TDismissedReport.Create;
begin
    inherited Create;


     DataModule:=TMainDM.Create(Application.MainForm);
     Input.FieldDefs.Add('DesignReport', ftBoolean);
     PrepareMemoryDatasets;
end;

destructor TDismissedReport.Destroy;
begin

    inherited Destroy;
    DataModule.Free;

end;

procedure TDismissedReport.Show;
var
    hnd: Integer;
    form:TReportMainForm;
begin



    with DataModule do
    begin
        if Database.Connected then
            Database.Connected:=False;
        hnd:=Input['DBHandle'];
        Database.Handle:=TISC_DB_HANDLE(hnd);
        Database.Connected:=True;
    end;

    form:=TReportMainForm.Create(Application.MainForm);
    form.DesignReport:=Input['DesignReport'];
    form.DataModule:=DataModule;
    form.ShowModal;
end;


end.
