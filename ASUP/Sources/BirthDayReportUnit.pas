unit BirthDayReportUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, IBCustomDataSet, IBQuery, FR_Class, FR_DSet, FR_DBSet, PersonalCommon,
    StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, CheckEditUnit, DepartmentsViewUnit;

type
    TBirthDayReportForm = class(TForm)
        ReportDataset: TfrDBDataSet;
        Report: TfrReport;
        ReportQuery: TIBQuery;
        Label1: TLabel;
        DepartmentButton: TBitBtn;
        DepartmentEdit: TEdit;
        ParamRadioGroup: TRadioGroup;
        MonthRadio: TRadioButton;
        PeriodRadio: TRadioButton;
        Panel1: TPanel;
        Label2: TLabel;
        DateBegPicker: TDateTimePicker;
        Label3: TLabel;
        DateEndPicker: TDateTimePicker;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        RadioButton1: TRadioButton;
        ReportQueryFAMILIA: TIBStringField;
        ReportQueryIMYA: TIBStringField;
        ReportQueryOTCHESTVO: TIBStringField;
        ReportQueryBIRTH_DATE: TDateField;
        ReportQueryDEP_NAME: TIBStringField;
        ReportQueryPOST_NAME: TIBStringField;
        ExportButton: TBitBtn;
        ReportQueryFIRM_NAME: TIBStringField;
        ReportQueryNAME_FULL: TIBStringField;
        GroupBox1: TGroupBox;
        FioSort: TRadioButton;
        BirthSort: TRadioButton;
        DepatmentSort: TRadioButton;
        SexBox: TCheckBox;
        MonthBox: TComboBox;
        procedure FormCreate(Sender: TObject);
        procedure DepartmentButtonClick(Sender: TObject);
        procedure PeriodRadioClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    public
        Id_Filter_Department: integer;
    end;

var
    BirthDayReportForm: TBirthDayReportForm;
    old_sort_field: string;

implementation

{$R *.dfm}

uses uExportReport;

procedure TBirthDayReportForm.FormCreate(Sender: TObject);
begin
    ReportQuery.Transaction := PersonalCommon.ReadTransaction;
    Panel1.Visible := False;

    DepartmentEdit.Text := DepNameQuery['Name_Full'];
    Id_Filter_Department := Consts_Query['Local_Department'];
end;

procedure TBirthDayReportForm.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Self);
    form.Buhg := False;
    form.Prepare(True, Date);
    form.CanSelectRoot := True;
    if form.ShowModal = mrOk then
        with form do
        begin
            Id_Filter_Department := Selected_Id;
            if Id_Filter_Department = -1 then
                DepartmentEdit.Text := Consts_Query['Firm_Name']
            else
                DepartmentEdit.Text := ResultQuery['Name_Full'];
        end;
    form.Free;
end;

procedure TBirthDayReportForm.PeriodRadioClick(Sender: TObject);
begin
    MonthBox.Visible := MonthRadio.Checked;
    Panel1.Visible := PeriodRadio.Checked;
end;


procedure TBirthDayReportForm.OkButtonClick(Sender: TObject);
var
    s: string;
    sort_field: string;
begin
    ReportQuery.Close;
    if (DepartmentEdit.Text = '') then
    begin
        MessageDlg('Не вибран підрозділ!',
            mtError, [mbOk], 0);
    end
    else

    begin

        ReportQuery.Params.ParamValues['Report_date'] := Date();
        ReportQuery.Params.ParamValues['Id_Dep'] := Id_Filter_Department;

        //Hunter commiting// ShowMessage(IntToStr(Id_Filter_Department)+','+DateToStr(DateBegPicker.Date)+','+DateToStr(DateEndPicker.Date));

        if SexBox.Checked then
            ReportQuery.Params.ParamValues['ID_SEX'] := '2'
        else
            ReportQuery.Params.ParamValues['ID_SEX'] := null;

        frVariables['Department'] := DepartmentEdit.Text;

        frVariables['T'] := 'усі дати народження';

        if MonthRadio.Checked then
        begin
            ReportQuery.Params.ParamValues['Month'] := MonthBox.ItemIndex + 1;
            frVariables['T'] := 'за ' + Copy(MonthBox.Text, 6, Length(MonthBox.Text))
                + ' місяць';
        end;

        if PeriodRadio.Checked then
        begin
            ReportQuery.Params.ParamValues['Date_Beg'] := DateBegPicker.Date;
            ReportQuery.Params.ParamValues['Date_End'] := DateEndPicker.Date;

            s := 'за період ' + DateToStr(DateBegPicker.Date) + '-' + DateToStr(DateEndPicker.Date);
            frVariables['T'] := s;
        end;

    // Учитываем сортировку
        if FioSort.Checked then sort_field := 'FAMILIA';

        if BirthSort.Checked then sort_field := 'BIRTH_DATE';

        if DepatmentSort.Checked then sort_field := 'DEP_NAME';

        if (old_Sort_field = '') then
            ReportQuery.SQL.Add('ORDER BY ' + sort_field)
        else
            ReportQuery.SQL.Text := StringReplace(ReportQuery.SQL.Text, 'ORDER BY ' + old_sort_field, 'ORDER BY ' + sort_field, []);

        old_sort_field := sort_field;

        ReportQuery.Open;
        Report.LoadFromFile(ProgramPath + 'Reports\ASUP\BirthDayReport.frf');

        if Sender = ExportButton then
            ExportReportTo(Report)
        else if sDesignReport then
            Report.DesignReport
        else
            Report.ShowReport;
    end;

end;

procedure TBirthDayReportForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

end.
