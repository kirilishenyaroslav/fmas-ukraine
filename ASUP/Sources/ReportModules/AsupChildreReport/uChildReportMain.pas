{*******************************************************************************
* uChildReportMain                                                             *
*                                                                              *
* Главный модуль отчета по детям сотрудников                                   *
* Copyright © 2004-2005,Татаринов Е.,Збуривский Д.Н.                           *
* Донецкий Национальный Университет                                            *
*******************************************************************************}

unit uChildReportMain;

interface

uses    uCommonSp,dmChild,uChildReportForm,IBase,Forms,DB;

type
    TChildReport=class(TSprav)
    private
        DataModule: TChildDM;
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
    Result := TChildReport.Create;
end;

constructor TChildReport.Create;
begin
    inherited Create;
    DataModule:=TChildDM.Create(Application.MainForm);
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    PrepareMemoryDatasets;
end;

destructor TChildReport.Destroy;
begin

    inherited Destroy;
    DataModule.Free;

end;

procedure TChildReport.Show;
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
