{*******************************************************************************
*uScienceReportMain                                                           *
*Главный модуль ведомости ученых имеющих степень по определнным наукам        *
*Copyright © 2004-2005,Данил Н. Збуривский, Донецкий Национальный Университет *
*******************************************************************************}

unit uScienceReportMain;

interface
uses    uCommonSp,dmScienceReport,uByScienceReportForm,IBase,Forms,DB;

type
    TByScienceReport=class(TSprav)
    private
        DataModule: TScienceReportDM;
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
    Result := TByScienceReport.Create;
end;

constructor TByScienceReport.Create;
begin
    inherited Create;


     DataModule:=TScienceReportDM.Create(Application.MainForm);

     Input.FieldDefs.Add('DesignReport', ftBoolean);
     PrepareMemoryDatasets;
end;

destructor TByScienceReport.Destroy;
begin

    inherited Destroy;
    DataModule.Free;

end;

procedure TByScienceReport.Show;
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
