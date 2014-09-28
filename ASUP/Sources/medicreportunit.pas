unit MedicReportUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, FR_DSet, FR_DBSet,
    FR_Class, DB, IBCustomDataSet, IBQuery, PersonalCommon, uFControl,
  uLabeledFControl, uSpravControl;

type
    TMedicReportForm = class(TForm)
        ReportDatePicker: TDateTimePicker;
        Label1: TLabel;
        RadioGroup1: TRadioGroup;
        AllMedicReportBtn: TRadioButton;
        HarmfullRadioButton: TRadioButton;
        PrikazRadioButton: TRadioButton;
        OkBtn: TBitBtn;
        CancelBtn: TBitBtn;
        DetailsQuery: TIBQuery;
        MedicReport: TfrReport;
        MedicReportDataSet: TfrDBDataSet;
        ChiefQuery: TIBQuery;
        ChiefQueryCHIEF_FIO: TIBStringField;
        ChiefQueryCHIEF_POST_NAME: TIBStringField;
        DriversRadioButton: TRadioButton;
        OrdinaryRadioButton: TRadioButton;
        SexBox: TCheckBox;
        PensionerRadioButton: TRadioButton;
        ExportButton: TBitBtn;
    Department: TqFSpravControl;
        procedure OkBtnClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    private
        PPath: string;
    end;

var
    MedicReportForm: TMedicReportForm;

implementation

uses uExportReport, qFTools, uCommonSp;

{$R *.dfm}

procedure TMedicReportForm.OkBtnClick(Sender: TObject);
var
    Year, Month, Day: Word;
    Report_type, pos1, pos2: Integer;
    ReportName: string;
    Filter_Prop: Integer;
    tmp: String;
begin
    tmp := Department.Check;
    if tmp <> '' then
    begin
        qFErrorDialog(tmp);
        Exit;
    end;

    ReportName := 'Reports\ASUP\MedicReport.frf';

    if (AllMedicReportBtn.Checked) then
    begin
        frVariables['TitlePart'] := 'осіб';
        Filter_Prop := -2;
        Report_Type := 1;
        ReportName := 'Reports\ASUP\MedicReportAll.frf'; 
    end;

    if (HarmfullRadioButton.Checked) then
    begin
        frVariables['TitlePart'] := 'осіб,працюючих з шкідливими умовами';
        Report_Type := 1;
        Filter_Prop := 100;
    end;

    if (PrikazRadioButton.Checked) then
    begin
        frVariables['TitlePart'] := 'осіб,згідно наказу №280';
        Filter_Prop := 200;
        Report_Type := 1;
    end;

    if (DriversRadioButton.Checked) then
    begin
        frVariables['TitlePart'] := 'водіїв';
        Filter_Prop := 300;
        Report_Type := 1;
    end;

    if (OrdinaryRadioButton.Checked) then
    begin
        frVariables['TitlePart'] := 'осіб,працюючих з загальними умовами';
        Filter_Prop := -1;
        Report_Type := 1;
    end;

    if (PensionerRadioButton.Checked) then
    begin
        frVariables['TitlePart'] := 'пенсіонерів';
        Report_Type := 2;
    end;

    DetailsQuery.Close;
    DetailsQuery.ParamByName('Id_Department').AsInteger := Department.Value;
    DetailsQuery.ParamByName('Date_Beg').AsDate := ReportDatePicker.Date;
    DetailsQuery.ParamByName('Report_Type').AsInteger := Report_Type;
    DetailsQuery.ParamByName('Id_Property').AsInteger := Filter_Prop;
    if SexBox.Checked then
        DetailsQuery.ParamByName('Only_Women').AsInteger := 1
    else DetailsQuery.ParamByName('Only_Women').AsInteger := 0;
    DetailsQuery.Open;

    DecodeDate(ReportDatePicker.DateTime, Year, Month, Day);
    ChiefQuery.Params.ParamByName('REPORT_DATE').Value := DateToStr(ReportDatePicker.DateTime);
    ChiefQuery.Open;

    frVariables['ChiefName'] := ChiefQueryCHIEF_FIO.Value;
    frVariables['Firm_Name'] := Consts_Query['FIRM_NAME'];

    MedicReport.LoadFromFile(PPath + ReportName);

    if (Sender as TButton).Name = 'OkBtn' then begin
        if sDesignReport then
            MedicReport.DesignReport
        else MedicReport.ShowReport;
    end;

    if (Sender as TButton).Name = 'ExportButton' then ExportReportTo(MedicReport);

    DetailsQuery.Close;
    ChiefQuery.Close;

end;

procedure TMedicReportForm.FormCreate(Sender: TObject);
begin
    ReportDatePicker.DateTime := Date();
    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    ChiefQuery.Transaction := PersonalCommon.ReadTransaction;
    Department.Value := Consts_Query['Local_Department'];
    Department.DisplayText := DepNameQuery['Name_Full'];
end;

procedure TMedicReportForm.DepartmentOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
            FieldValues['Actual_Date'] := ReportDatePicker.Date;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;


end.

