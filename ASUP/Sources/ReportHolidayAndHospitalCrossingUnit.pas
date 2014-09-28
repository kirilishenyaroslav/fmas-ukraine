unit ReportHolidayAndHospitalCrossingUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, PersonalCommon,
    SpCommon, GoodFunctionsUnit, FR_DSet, FR_DBSet, FR_Class, ComCtrls,
    DepartmentsViewUnit;

type
    TReportHolidayAndHospitalCrossingForm = class(TForm)
        Query: TIBQuery;
        Report: TfrReport;
        DataSet: TfrDBDataSet;
        QueryFIO: TIBStringField;
        QueryPOST: TIBStringField;
        QueryDEP: TIBStringField;
        QueryHOLIDAY_NAME: TIBStringField;
        QueryHOLIDAY_DATE_BEG: TDateField;
        QueryHOLIDAY_DATE_END: TDateField;
        QueryHOSP_BEG: TDateField;
        QueryHOSP_END: TDateField;
        QueryTN: TIntegerField;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ExportButton: TBitBtn;
        Label4: TLabel;
        Label1: TLabel;
        DateEndPicker: TDateTimePicker;
        DateBegPicker: TDateTimePicker;
        Label2: TLabel;
        Edit1: TEdit;
        Button1: TButton;
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure Button1Click(Sender: TObject);
    private
        ID_DEPARTMENT: Integer;
    public
    { Public declarations }
    end;

var
    ReportHolidayAndHospitalCrossingForm: TReportHolidayAndHospitalCrossingForm;

implementation

{$R *.dfm}

uses uExportReport;

procedure TReportHolidayAndHospitalCrossingForm.FormCreate(
    Sender: TObject);
begin
    Query.Transaction := ReadTransaction;
    DateBegPicker.Date := EncodeDate(CurrentYear, 01, 01);
    DateEndPicker.Date := EncodeDate(CurrentYear, 12, 31);
    ID_DEPARTMENT := Consts_Query['LOCAL_DEPARTMENT'];
    Edit1.Text := DepNameQuery['NAME_FULL'];
end;

procedure TReportHolidayAndHospitalCrossingForm.OkButtonClick(
    Sender: TObject);
begin
    Query.Close;
    Query.Params.ParamValues['DATE_BEG'] := DateToStr(DateBegPicker.Date);
    Query.Params.ParamValues['DATE_END'] := DateToStr(DateEndPicker.Date);
    Query.Params.ParamValues['ID_DEPARTMENT'] := ID_DEPARTMENT;
    Query.Open;

    frVariables['REPORT_DATE_BEG'] := DateToStr(DateBegPicker.Date);
    frVariables['REPORT_DATE_END'] := DateToStr(DateEndPicker.Date);

    Report.LoadFromFile(ProgramPath + 'Reports\ASUP\ReportHolidayAndHospitalIntersect.frf');

    if (Sender as TButton).Name = 'OkButton'
        then
        if sDesignReport
            then
            Report.DesignReport
        else
            Report.ShowReport;

    if (Sender as TButton).Name = 'ExportButton' then ExportReportTo(Report);
end;

procedure TReportHolidayAndHospitalCrossingForm.Button1Click(
    Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Self);
    form.Prepare(True, DateEndPicker.Date);
    form.CanSelectRoot := True;
    if form.ShowModal = mrOk then
        with form do
        begin
            Id_Department := Selected_Id;
            Edit1.Text := ResultQuery['Name_Full'];
        end;
    form.Free;
end;

end.
