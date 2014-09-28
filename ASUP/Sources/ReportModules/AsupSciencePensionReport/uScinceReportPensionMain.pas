{*******************************************************************************
* uLessAgeReportMain                                                           *
*                                                                              *
*Главный модуль отчета по работникам уволенных на пенсию научного работника    *
* Copyright © 2004-2005,Данил Н. Збуривский, Донецкий Национальный Университет *
*******************************************************************************}

unit uScinceReportPensionMain;

interface

uses    uCommonSp,dmScience,uScincePensionReportForm,IBase,Forms,DB;

type
    TSciencePensionReport=class(TSprav)
    private
        DataModule: TScienceDM;
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
    Result := TSciencePensionReport.Create;
end;

constructor TSciencePensionReport.Create;
begin
    inherited Create;


     DataModule:=TScienceDM.Create(Application.MainForm);

     Input.FieldDefs.Add('DesignReport', ftBoolean);
     PrepareMemoryDatasets;
end;

destructor TSciencePensionReport.Destroy;
begin

    inherited Destroy;
    DataModule.Free;

end;

procedure TSciencePensionReport.Show;
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
