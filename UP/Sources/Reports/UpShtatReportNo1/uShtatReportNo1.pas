{*******************************************************************************
* uShtatReportNo1                                                              *
*                                                                              *
* Отчет по штатному №1                                                         *
* Copyright © 2007 О.Г. Волков                                                 *
* Донецкий Национальный Университет                                            *
*******************************************************************************}

unit uShtatReportNo1;

interface
uses    uCommonSp, IBase,Forms,DB;

type
    TShtatReportNo1=class(TSprav)
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav:TSprav;stdcall;
exports CreateSprav;

implementation

uses SysUtils, uShtatReportNo1Form;


function CreateSprav: TSprav;
begin
    Result := TShtatReportNo1.Create;
end;

constructor TShtatReportNo1.Create;
begin
    inherited Create;

    PrepareMemoryDatasets;
end;

procedure TShtatReportNo1.Show;
var
    hnd: Integer;
    form: TfmShtatReportNo1;
begin
    form := TfmShtatReportNo1.Create(Application.MainForm);
    hnd := Input['DBHandle'];
    form.DB.Handle := TISC_DB_HANDLE(hnd);
    form.ShowModal;
    form.Free;
end;
end.


