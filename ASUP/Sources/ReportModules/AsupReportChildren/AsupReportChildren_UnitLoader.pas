{*******************************************************************************
* AsupReportChildren                                                           *
*                                                                              *
* Главный модуль отчета по детям сотрудников                                   *
* Copyright © 2004-2005, Татаринов Е.,Збуривский Д.Н.                          *
* Copyright © 2005-2006, Пашенко Г.В.                                          *
* Донецкий Национальный Университет                                            *
*******************************************************************************}
unit AsupReportChildren_UnitLoader;

interface
uses Classes, IBase, AsupReportChildren_PrintDM, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,Asup_LoaderPrintDocs_Types, AsupReportChildren_FilterForm,
     uCommonSp, DB;

type
    TAsupReportChildren=class(TSprav)
    private
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;

function CreateSprav:TSprav;stdcall;
exports CreateSprav;

implementation

uses Math;

function CreateSprav: TSprav;
begin
    Result := TAsupReportChildren.Create;
end;

constructor TAsupReportChildren.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    PrepareMemoryDatasets;
end;

destructor TAsupReportChildren.Destroy;
begin
    inherited Destroy;
end;

procedure TAsupReportChildren.Show;
var ReportDM:TDM;
    FilterForm:TFormOptions;
    AParameter:TSimpleParam;
    hnd:integer;
begin
  AParameter := TSimpleParam.Create;
  AParameter.Owner := Application.MainForm;
  hnd := Input.FieldValues['DBHandle'];
  AParameter.DB_Handle := TISC_DB_HANDLE(hnd);

  FilterForm:=TFormOptions.Create(AParameter as TSimpleParam);
  if FilterForm.ShowModal<>mrYes then
   begin
    FilterForm.Free;
    Exit;
   end;
  ReportDM := TDM.Create((AParameter as TSimpleParam).Owner);
  ReportDM.DateForm := FilterForm.DateEdit.Date;
  FilterForm.Free;
  ReportDM.PrintSpr(AParameter as TSimpleParam);
  ReportDM.Free;

  AParameter.Destroy;
end;

end.
