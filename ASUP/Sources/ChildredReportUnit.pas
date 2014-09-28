unit ChildredReportUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, IBCustomDataSet, IBQuery, FR_Class, FR_DSet, FR_DBSet,
    ComCtrls, ExtCtrls, Mask, CheckEditUnit, PersonalCommon, StdCtrls, Buttons, DepartmentsViewUnit,
    frxClass, frxDBSet;


type
    TChildrenReportForm = class(TForm)
        Label1: TLabel;
        DepartmentButton: TBitBtn;
        DepartmentEdit: TEdit;
        ParamRadioGroup: TRadioGroup;
        MonthRadio: TRadioButton;
        PeriodRadio: TRadioButton;
        Panel1: TPanel;
        Label2: TLabel;
        Label3: TLabel;
        DateBegPicker: TDateTimePicker;
        DateEndPicker: TDateTimePicker;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        RadioButton1: TRadioButton;
        ReportDataset: TfrDBDataSet;
        Report: TfrReport;
        ReportQuery: TIBQuery;
        ReportQueryFIO: TIBStringField;
        ReportQueryC_FIO: TIBStringField;
        ReportQueryC_BIRTH: TDateField;
        ReportQueryNAME: TIBStringField;
        ExportButton: TBitBtn;
        Report3: TfrxReport;
        frxDBDataset1: TfrxDBDataset;
        MonthBox: TComboBox;
        procedure DepartmentButtonClick(Sender: TObject);
        procedure MonthRadioClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure PeriodRadioClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure RadioButton1Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    ChildrenReportForm: TChildrenReportForm;
    Id_Filter_Department: Integer;
implementation

{$R *.dfm}

uses uExportReport, DateUtils;

procedure TChildrenReportForm.DepartmentButtonClick(Sender: TObject);
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
            else DepartmentEdit.Text := ResultQuery['Name_Full'];
        end;
    form.Free;

end;

procedure TChildrenReportForm.MonthRadioClick(Sender: TObject);
begin
    MonthBox.Enabled := True;
    Panel1.Enabled := False;
end;

procedure TChildrenReportForm.FormCreate(Sender: TObject);
begin
    ReportQuery.Transaction := PersonalCommon.ReadTransaction;
    Panel1.Enabled := False;

    DateBegPicker.DateTime := Date;
    DateEndPicker.DateTime := Date;

    MonthRadio.Checked := True;
    MonthBox.ItemIndex := MonthOf(Date)-1;

    Id_Filter_Department := Consts_Query['Local_Department'];
    DepartmentEdit.Text := DepNameQuery['NAME_FULL'];
end;

procedure TChildrenReportForm.PeriodRadioClick(Sender: TObject);
begin
    MonthBox.Enabled := False;
    Panel1.Enabled := True;
end;

procedure TChildrenReportForm.OkButtonClick(Sender: TObject);
var
    s: string;
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
        if MonthRadio.Checked then
            ReportQuery.Params.ParamValues['Month'] := MonthBox.ItemIndex + 1;
        if PeriodRadio.Checked then
        begin
            ReportQuery.Params.ParamValues['Date_Beg'] := DateBegPicker.Date;
            ReportQuery.Params.ParamValues['Date_End'] := DateEndPicker.Date;
        end;


        Report3.LoadFromFile(ProgramPath + 'Reports\ASUP\ChildrenReport.fr3');
        ReportQuery.Open;

        Report3.Variables['T'] := QuotedStr('звіт за усіма датами народження');
        Report3.Variables['DEP_NAME'] := QuotedStr(DepartmentEdit.Text);
        if MonthRadio.Checked then
        begin
            Report3.Variables['T'] := QuotedStr('дати народження за ' +
                Copy(MonthBox.Text, 6, Length(MonthBox.Text)) + ' місяць');
        end;

        if PeriodRadio.Checked then
        begin
            s := 'дати народження за період ' + DateToStr(DateBegPicker.Date) + '-' +
                DateToStr(DateEndPicker.Date);
            Report3.Variables['T'] := QuotedStr(s);
        end;



        if Sender = ExportButton then
            ExportReportTo(Report3)
        else
            if sDesignReport then Report3.DesignReport
            else Report3.ShowReport;
    end;
end;

procedure TChildrenReportForm.RadioButton1Click(Sender: TObject);
begin
    MonthBox.Enabled := False;
    Panel1.Enabled := False;
end;

end.
