unit ReportVedomostPrinatihUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FR_DSet, FR_DBSet, FR_Class, DB,
  IBCustomDataSet, IBQuery, frxClass, frxDBSet, SpComboBox, ExtCtrls;

type
  TReportVedomostPrinatihForm = class(TForm)
    ResultQuery: TIBQuery;
    ResultReport: TfrReport;
    ResultDataSet: TfrDBDataSet;
    ResultQuery2: TIBQuery;
    ResultDataSet2: TfrDBDataSet;
    ResultQuery3: TIBQuery;
    ResultDataSet3: TfrDBDataSet;
    ResultQueryID_DEPARTMENT: TIntegerField;
    ResultQueryFIO_SMALL: TIBStringField;
    ResultQueryDATE_BEGIN: TDateField;
    ResultQueryNUM_ORDER: TIBStringField;
    ResultQueryNAME_POST: TIBStringField;
    ResultQueryDEPARTMENT_NAME: TIBStringField;
    ResultQueryPERIOD_BEG: TDateField;
    ResultQueryPERIOD_END: TDateField;
    ResultQuery2ID_DEPARTMENT: TIntegerField;
    ResultQuery2FIO_SMALL: TIBStringField;
    ResultQuery2DATE_DISMISSION: TDateField;
    ResultQuery2NAME_POST: TIBStringField;
    ResultQuery2DEPARTMENT_NAME: TIBStringField;
    ResultQuery2PERIOD_BEG: TDateField;
    ResultQuery2PERIOD_END: TDateField;
    ResultQuery2NAME_DISMISSION: TIBStringField;
    ResultQuery2DISMISSION_REASON: TIBStringField;
    ResultQuery2TN: TIntegerField;
    ResultQuery2COMPENS_STR: TIBStringField;
    ResultQuery2PIDSTAVA: TIBStringField;
    ResultQuery2NOMER: TIntegerField;
    ResultQueryTN: TIntegerField;
    ResultQueryOKL_STR: TIBStringField;
    ResultQueryNOMER: TIntegerField;
    FRDataSet: TfrxDBDataset;
    Panel1: TPanel;
    Label1: TLabel;
    DateEndPicker: TDateTimePicker;
    DateBegPicker: TDateTimePicker;
    Edit1: TEdit;
    SexBox: TCheckBox;
    Label4: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    ExportButton: TBitBtn;
    GroupBox1: TGroupBox;
    ShowDekr: TCheckBox;
    IsHoliday: TCheckBox;
    HolidayBox: TSpComboBox;
    ShowOnlyDekr: TCheckBox;
    ResultQueryADDR: TIBStringField;
    ResultQuery3ID_DEPARTMENT: TIntegerField;
    ResultQuery3FIO_SMALL: TIBStringField;
    ResultQuery3NAME_POST: TIBStringField;
    ResultQuery3NAME_DEPARTMENT: TIBStringField;
    ResultQuery3NAME_HOLIDAY: TIBStringField;
    ResultQuery3PERIOD_BEG: TDateField;
    ResultQuery3PERIOD_END: TDateField;
    ResultQuery3DATE_BEG: TDateField;
    ResultQuery3DATE_END: TDateField;
    ResultQuery3REPORT_PERIOD_BEG: TDateField;
    ResultQuery3REPORT_PERIOD_END: TDateField;
    ResultQuery3H_TERM: TIntegerField;
    Report3: TfrxReport;
    ResultQuery3NUM_LINE: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IsHolidayClick(Sender: TObject);
    procedure ShowOnlyDekrClick(Sender: TObject);
  private
    { Private declarations }
  public
    ID_DEPARTMENT : Integer;
    ID_REPORT_TYPE : Integer; // 1 - Отчет по принятым за период, 2 - отчет по уволеным за период
  end;

var
  ReportVedomostPrinatihForm: TReportVedomostPrinatihForm;

implementation

uses PersonalCommon, DepartmentsViewUnit, PrintOrderUnit, uExportReport;
{$R *.dfm}

procedure TReportVedomostPrinatihForm.FormCreate(Sender: TObject);
begin
    DateBegPicker.Date := IncMonth(Date, -1);
    DateEndPicker.Date := Date;
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    ResultQuery2.Transaction := PersonalCommon.ReadTransaction;
    ResultQuery3.Transaction := PersonalCommon.ReadTransaction;
    ID_DEPARTMENT := Consts_Query['LOCAL_DEPARTMENT'];
    Edit1.Text := DepNameQuery['NAME_FULL'];
end;

procedure TReportVedomostPrinatihForm.Button1Click(Sender: TObject);
var
	form: TDepartmentsViewForm;
begin
	form := TDepartmentsViewForm.Create(Self);
	form.Prepare(True, DateBegPicker.Date);
	form.CanSelectRoot := True;
	if form.ShowModal = mrOk then
	with form do
	begin
		Id_Department := Selected_Id;
		Edit1.Text := ResultQuery['Name_Short'];
	end;
	form.Free;
end;

procedure TReportVedomostPrinatihForm.OkButtonClick(Sender: TObject);
var
  sex_Str : String;
  Show_Dekr : Char;
  Id_Holiday : Integer;
begin

    if SexBox.Checked then
        Sex_Str := '2'
    else
        Sex_Str := 'null';

        if (ID_DEPARTMENT = -1)
        then begin
                MessageDlg('Треба вибрати підрозділ.',mtError,[mbOk],0);
                ModalResult := mrNone;
                exit;
        end;

        if ID_REPORT_TYPE = 1
        then begin
                ResultQuery.Close;
                ResultQuery.SQL.Text := 'SELECT * FROM REPORT_PRINATIH(' + IntToStr(ID_DEPARTMENT) + ','
                                                                         + QuotedStr(DateToStr(DateBegPicker.Date)) + ','
                                                                         + QuotedStr(DateToStr(DateEndPicker.Date)) + ','
                                                                         + Sex_Str + ')';
                ResultQuery.Open;

                if not ResultQuery.IsEmpty
                then begin

                        FRDataSet.DataSet := ResultQuery;
                        FRDataSet.UserName := 'ResultQuery';
                        Report3.Clear;
                        Report3.LoadFromFile(ProgramPath + 'Reports\Asup\Report_Prinatih.fr3');
                        if (Sender as TButton).Name = 'OkButton'
                            then
                                if sDesignReport
                                    then
                                        Report3.DesignReport
                                    else
                                        Report3.ShowReport;

                        if (Sender as TButton).Name = 'ExportButton' then ExportReportTo(Report3);
                end
                else begin
                        MessageDlg('За період з "' + DateToStr(DateBegPicker.Date) + '" по "' + DateToStr(DateEndPicker.Date) + '" у підрозділ "' + Edit1.Text + '" не було прийнято жодного робітника.',mtInformation,[mbOk],0);
                        ModalResult := mrNone;
                end;
        end
        else
        if ID_REPORT_TYPE = 2
        then begin
                ResultQuery2.Close;
                ResultQuery2.SQL.Text := 'SELECT * FROM REPORT_DISMISSED(' + IntToStr(ID_DEPARTMENT) + ','
                                                          + QuotedStr(DateToStr(DateBegPicker.Date)) + ','
                                                          + QuotedStr(DateToStr(DateEndPicker.Date)) + ','
                                                          + Sex_Str + ')';
                ResultQuery2.Open;

                if not ResultQuery2.IsEmpty
                then begin
                        Report3.Clear;
                        Report3.LoadFromFile(ProgramPath + 'Reports\ASUP\Report_Dismissed.fr3');
                        FRDataSet.DataSet := ResultQuery2;
                        FRDataSet.UserName := 'ResultQuery2';

                        if (Sender as TButton).Name = 'OkButton'
                            then
                                if sDesignReport
                                    then
                                        Report3.DesignReport
                                    else
                                        Report3.ShowReport;

                        if (Sender as TButton).Name = 'ExportButton' then ExportReportTo(Report3);
                end
                else begin
                        MessageDlg('За період з "' + DateToStr(DateBegPicker.Date) + '" по "' + DateToStr(DateEndPicker.Date) + '" у підрозділ "' + Edit1.Text + '" не було звільнено жодного робітника.',mtInformation,[mbOk],0);
                        ModalResult := mrNone;
                end;
        end
        else
        if ID_REPORT_TYPE = 3
        then begin

                if ShowDekr.Checked then
                    Show_Dekr := 'T'
                else
                    Show_Dekr := 'F';

                if IsHoliday.Checked then
                    Id_Holiday := HolidayBox.GetId
                else
                    Id_Holiday := -1;

                if ShowOnlyDekr.Checked then begin
                    Id_Holiday := -2;
                    Show_Dekr := 'T'
                end;

                ResultQuery3.Close;
                ResultQuery3.SQL.Text := 'SELECT * FROM REPORT_HOLIDAYS(' + IntToStr(ID_DEPARTMENT) + ',''' +
                                                                            DateToStr(DateBegPicker.Date) + ''',''' +
                                                                            DateToStr(DateEndPicker.Date) + ''',' +
                                                                            IntToStr(Id_Holiday) + ',' +
                                                                            QuotedStr(Show_Dekr) + ',' +
                                                                            Sex_Str + ')';
                ResultQuery3.Open;

                if not ResultQuery3.IsEmpty then
                begin
                    FRDataSet.DataSet := ResultQuery3;
                    FRDataSet.UserName := 'ResultQuery3';
                    Report3.Clear;
                    Report3.LoadFromFile(ProgramPath + 'Reports\ASUP\Report_Holidays.fr3');

                    if (Sender as TButton).Name = 'OkButton' then
                        if sDesignReport then
                            Report3.DesignReport
                        else Report3.ShowReport;

                    if (Sender as TButton).Name = 'ExportButton' then ExportReportTo(Report3);
                end
                else
                begin
                    MessageDlg('У підрозділі "' + Edit1.Text + '" не було надано жодної відпустки.',mtInformation,[mbOk],0);
                    ModalResult := mrNone;
                end;
        end;
end;

procedure TReportVedomostPrinatihForm.FormShow(Sender: TObject);
begin
        if ID_REPORT_TYPE = 1
        then begin
                caption := 'Відомість співробітників прийнятих за період';
        end
        else
        if ID_REPORT_TYPE = 2
        then begin
                caption := 'Відомість співробітників звільнених за період';
        end
        else
        if ID_REPORT_TYPE = 3
        then begin
                caption := 'Відомість відпусток';
        end;

        Panel2.Visible := (ID_REPORT_TYPE = 3);
end;

procedure TReportVedomostPrinatihForm.IsHolidayClick(Sender: TObject);
begin
    HolidayBox.Enabled := IsHoliday.Checked;
end;

procedure TReportVedomostPrinatihForm.ShowOnlyDekrClick(Sender: TObject);
begin
    IsHoliday.Enabled := not (ShowOnlyDekr.Checked);
    ShowDekr.Enabled := not (ShowOnlyDekr.Checked);
    HolidayBox.Enabled := not (ShowOnlyDekr.Checked);
end;

end.
