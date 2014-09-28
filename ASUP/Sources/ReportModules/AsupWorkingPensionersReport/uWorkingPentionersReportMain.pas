{*******************************************************************************
* uWorking35ReporttMain                                                        *
*                                                                              *
*Главный модуль отчета по работникам уволеным за определенный период           *
* Copyright © 2004-2005,Данил Н. Збуривский, Донецкий Национальный Университет *
*******************************************************************************}

unit uWorkingPentionersReportMain;

interface
    uses    uCommonSP,dmWorkingPentionersMain,uWorkingPentionersReportForm,IBase,Forms,DB;
type
    TPentionersReport=class(TSprav)
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
    Result := TPentionersReport.Create;
end;

constructor TPentionersReport.Create;
begin
    inherited Create;


     DataModule:=TMainDM.Create(Application.MainForm);
     Input.FieldDefs.Add('DesignReport', ftBoolean);
     PrepareMemoryDatasets;
end;

destructor TPentionersReport.Destroy;
begin

    inherited Destroy;
    DataModule.Free;

end;

procedure TPentionersReport.Show;
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
