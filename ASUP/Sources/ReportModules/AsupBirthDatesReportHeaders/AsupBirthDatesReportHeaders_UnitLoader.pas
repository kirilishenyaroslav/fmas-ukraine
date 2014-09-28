{*******************************************************************************
* AsupBirthDatesReport_UnitLoader                                              *
*                                                                              *
* Главный модуль отчета по дням рождения руководящего состава                  *
* Copyright © 2005-2006, Пашенко Г.В.                                          *
* Донецкий Национальный Университет                                            *
*******************************************************************************}
unit AsupBirthDatesReportHeaders_UnitLoader;

interface
uses Classes, IBase, AsupBirthDatesReportHeaders_PrintDM, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,Asup_LoaderPrintDocs_Types, AsupBirthDatesReportHeaders_FilterForm,
     uCommonSp, DB;

type
    TAsupBirthDatesReportHeaders=class(TSprav)
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
    Result := TAsupBirthDatesReportHeaders.Create;
end;

constructor TAsupBirthDatesReportHeaders.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    PrepareMemoryDatasets;
end;

destructor TAsupBirthDatesReportHeaders.Destroy;
begin
    inherited Destroy;
end;

procedure TAsupBirthDatesReportHeaders.Show;
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
  FilterForm.DesignRep:=Input['DesignReport'];
  if FilterForm.ShowModal<>mrYes then
   begin
    FilterForm.Free;
    Exit;
   end;
  ReportDM := TDM.Create((AParameter as TSimpleParam).Owner);
  ReportDM.DateForm := Date;
  ReportDM.ID_Work_Reason := FilterForm.WorkComboBox.ItemIndex;
  ReportDM.ID_Month := FilterForm.MonthComboBox.ItemIndex+1;
  ReportDM.MonthText := FilterForm.MonthComboBox.Text;
//  ReportDM.IdReason := FilterForm.ComboWorkReason.EditValue;
//  ReportDM.WorkReasonText := FilterForm.ComboWorkReason.Text;
  ReportDM.DateForm:=FilterForm.DateEdit.Date;
  ReportDM.DesignRep:=Input['DesignReport'];
  FilterForm.Free;
  ReportDM.PrintSpr(AParameter as TSimpleParam);
  ReportDM.Free;
  AParameter.Destroy;
end;

end.
