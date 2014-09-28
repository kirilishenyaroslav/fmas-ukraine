unit PensiaReportUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, DepartmentsViewUnit,
    PersonalCommon, FR_DSet, FR_DBSet, FR_Class, ComCtrls;

type
    TPensiaReportForm = class(TForm)
        DepartmentButton: TBitBtn;
        DepartmentEdit: TEdit;
        Label1: TLabel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ReportQuery: TIBQuery;
        ReportQueryFAMILIA: TIBStringField;
        ReportQueryIMYA: TIBStringField;
        ReportQueryOTCHESTVO: TIBStringField;
        ReportQueryPOST_NAME: TIBStringField;
        ReportQueryDEP_NAME: TIBStringField;
        ReportQueryAGE_YEAR: TIntegerField;
        ReportQueryAGE_MONTH: TIntegerField;
        ReportQueryABOVE_YEAR: TIntegerField;
        ReportQueryABOVE_MONTH: TIntegerField;
        ReportQueryB_DATE: TDateField;
        Label2: TLabel;
        ReportDatePicker: TDateTimePicker;
        Report: TfrReport;
        ReportDataSet: TfrDBDataSet;
        ExportButton: TBitBtn;
        ReportQueryCOMMENT: TIBStringField;
        SexBox: TCheckBox;
        procedure DepartmentButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
    private
    { Private declarations }
    public
        ReportType: string; // '' - по пенсионерам, '2' - по достигшим пенс. возраста
    end;

var
    PensiaReportForm: TPensiaReportForm;
    Id_Filter_Department: integer;
implementation

{$R *.dfm}

uses uExportReport;

procedure TPensiaReportForm.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;

begin
    form := TDepartmentsViewForm.Create(Self);
    form.Buhg := False;
    form.Prepare(True, ReportDatePicker.Date);
    form.CanSelectRoot := True;
    if form.ShowModal = mrOk then
        with form do
        begin
            Id_Filter_Department := Selected_Id;
            if Id_Filter_Department = -1 then
                DepartmentEdit.Text := Consts_Query['Firm_Name']
            else DepartmentEdit.Text := ResultQuery['Name_Full'];
        end;
    form.Free;

end;

procedure TPensiaReportForm.FormCreate(Sender: TObject);
begin
    ReportQuery.Transaction := PersonalCommon.ReadTransaction;
    ReportDatePicker.Date := Date;
end;

procedure TPensiaReportForm.OkButtonClick(Sender: TObject);
var
    ReportDate: TDate;
    sex_Str: string;
begin

    if SexBox.Checked then
        Sex_Str := '2'
    else
        Sex_Str := 'null';

    ReportQuery.SQL.Text := 'SELECT * FROM PENSIA_REPORT' + ReportType + '(:ID_DEP,:REPORT_DATE,' + Sex_Str + ')';

    if (DepartmentEdit.Text = '') then begin
        MessageDlg('Не вибран підрозділ!', mtError, [mbOk], 0);
    end else
    begin
        ReportDate := ReportDatePicker.Date;
        ReportQuery.Params.ParamValues['ID_DEP'] := Id_filter_Department;
        ReportQuery.Params.ParamValues['REPORT_DATE'] := dateToStr(ReportDate);

        frVariables['R_DATE'] := DateToStr(ReportDate);
        frVariables['PODR_NAME'] := DepartmentEdit.Text;

        ReportQuery.Open;

        Report.LoadFromFile(ProgramPath + 'Reports\ASUP\PensiaReport' + ReportType + '.frf');

        if (Sender as TButton).Name = 'OkButton'
            then
            if sDesignReport
                then Report.DesignReport
            else Report.ShowReport;

        if (Sender as TButton).Name = 'ExportButton' then ExportReportTo(Report);
    end;

end;

procedure TPensiaReportForm.FormShow(Sender: TObject);
begin
    if ReportType = '2' then Caption := 'Відомість співробітників, які досягли пенсійного віку';
end;

end.
