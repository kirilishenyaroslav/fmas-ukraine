{*******************************************************************************
* uBirthDatesReportMain                                                        *
*                                                                              *
* Главный модуль отчета по датам рождения                                      *
* Copyright © 2004-2005,Татаринов Е.,Збуривский Д.Н.                           *
* Донецкий Национальный Университет                                            *
*******************************************************************************}

unit uBirthDatesReportMain;

interface
uses    uCommonSp,dmBirthDates,uBirthDatesForm,IBase,Forms,DB;

type
    TBirthDatesReport=class(TSprav)
    private
        DataModule: TBirthDatesDM;
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
    Result := TBirthDatesReport.Create;
end;

constructor TBirthDatesReport.Create;
begin
    inherited Create;
    DataModule:=TBirthDatesDM.Create(Application.MainForm);
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    PrepareMemoryDatasets;
end;

destructor TBirthDatesReport.Destroy;
begin

    inherited Destroy;
    DataModule.Free;

end;

procedure TBirthDatesReport.Show;
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
