{*******************************************************************************
* uLessAgeReportMain                                                           *
*                                                                              *
*Главный модуль отчета по работникам не достигшим определнного возраста        *
* Copyright © 2004-2005,Данил Н. Збуривский, Донецкий Национальный Университет *
*******************************************************************************}

unit uLessAgeReportMain;

interface

uses    uCommonSp,dmMain,uReportForm,IBase,Forms,DB;

type
    TLessAgeReport=class(TSprav)
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
    Result := TLessAgeReport.Create;
end;

constructor TLessAgeReport.Create;
begin
    inherited Create;


     DataModule:=TMainDM.Create(Application.MainForm);
     Input.FieldDefs.Add('DesignReport', ftBoolean);
     PrepareMemoryDatasets;
end;

destructor TLessAgeReport.Destroy;
begin

    inherited Destroy;
    DataModule.Free;

end;

procedure TLessAgeReport.Show;
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
    end;

    form:=TReportMainForm.Create(Application.MainForm);
    form.DesignReport:=Input['DesignReport'];
    form.DataModule:=DataModule;
    form.ShowModal;
end;

end.
