unit BonusReportUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, SpComboBox, FR_DSet, FR_DBSet, FR_Class, DB,
    IBCustomDataSet, IBQuery, Buttons, ComCtrls, GoodFunctionsUnit, PersonalCommon, SpCommon,
    Spin, frxClass, frxDBSet;

type
    TReportBonusForm = class(TForm)
        BonusFilter: TCheckBox;
        ReportDatePicker: TDateTimePicker;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        ReportQuery: TIBQuery;
        BonusBox: TSpComboBox;
        ManFilter: TCheckBox;
        FIO: TEdit;
        SelectPersonButton: TSpeedButton;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ExportButton: TBitBtn;
        Label1: TLabel;
        SizeEdit: TSpinEdit;
        Label2: TLabel;
        Label3: TLabel;
        Report3: TfrxReport;
        frxDBDataset1: TfrxDBDataset;
        UpperDeptQuery: TIBQuery;
        procedure SelectPersonButtonClick(Sender: TObject);
        procedure ManFilterClick(Sender: TObject);
        procedure BonusFilterClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure DepartmentButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        id_pcard: integer;
        id_department: Integer;
    end;

var
    ReportBonusForm: TReportBonusForm;

implementation

uses DepartmentsViewUnit, NagScreenUnit, uExportReport;
{$R *.dfm}

procedure TReportBonusForm.SelectPersonButtonClick(Sender: TObject);
var
    new_id_pcard: integer;
begin
    new_id_pcard := getpcard(Date, False, True);

    if new_id_pcard <> -1 then
    begin
        id_pcard := new_id_pcard;

        Fio.Text := GoodFunctionsUnit.Fam + ' (ТН: ' + GoodFunctionsUnit.pcardform.ResultQueryTN.AsString + ')';
    end;

end;

procedure TReportBonusForm.ManFilterClick(Sender: TObject);
begin
    Fio.Enabled := ManFilter.Checked;
    SelecTPersonButton.Enabled := ManFilter.Checked;
end;

procedure TReportBonusForm.BonusFilterClick(Sender: TObject);
begin
    BonusBox.Enabled := BonusFilter.Checked;
end;

procedure TReportBonusForm.FormCreate(Sender: TObject);
begin
    ReportQuery.Transaction := ReadTransaction;
    UpperDeptQuery.Transaction := ReadTransaction;
    ReportDatePicker.Date := Date;
    id_department := Consts_Query['Local_Department'];
    DepartmentEdit.Text := DepNameQuery['Name_Full'];
    BonusBox.LoadFromRegistry;
end;

procedure TReportBonusForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    BonusBox.SaveIntoRegistry;
end;

procedure TReportBonusForm.DepartmentButtonClick(Sender: TObject);
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
            Id_Department := Selected_Id;

            if Id_Department = -1 then
                DepartmentEdit.Text := Consts_Query['Firm_Name']
            else
                DepartmentEdit.Text := ResultQuery['Name_Full'];
        end;

    form.Free;

end;

procedure TReportBonusForm.OkButtonClick(Sender: TObject);
var
    NagScreen: TNagScreen;
begin
    ReportQuery.Close;
    ReportQuery.Params.ParamValues['FILTER_ID_DEPARTMENT'] := Id_Department;

    if BonusFilter.Checked then
    begin
        if BonusBox.getid = -1 then
        begin
            MessageDlg('Ви вибрали фільтрацію по типу надбавки/доплати, але не вибрали її!', mtError, [mbOk], 0);
            exit;
        end;

        ReportQuery.Params.ParamValues['FILTER_ID_BONUS'] := BonusBox.GetId;
    end
    else ReportQuery.Params.ParamValues['FILTER_ID_BONUS'] := null;

    ReportQuery.Params.ParamValues['FILTER_DATE'] := ReportDatePicker.Date;

    if ManFilter.Checked then
    begin

        if Id_PCard = -1 then
        begin
            MessageDlg('Ви вибрали фільтрацію по робітнику, але не вибрали його!', mtError, [mbOk], 0);
            exit;
        end;

        ReportQuery.Params.ParamValues['FILTER_ID_PCARD'] := Id_PCard;
    end
    else
        ReportQuery.Params.ParamValues['FILTER_ID_PCARD'] := null;

    NagScreen := TNagScreen.Create(Self);
    NagScreen.Show;
    NagScreen.SetStatusText('формується звіт...');

    ReportQuery.Open;

    UpperDeptQuery.Close;
    UpperDeptQuery.Params.ParamValues['Id_Department'] := Id_Department;
    UpperDeptQuery.Open;

    NagScreen.Free;

    Report3.LoadFromFile(ProgramPath + 'Reports\ASUP\AsupBonusReport.fr3');

    Report3.Variables['REPORT_DATE'] := QuotedStr(DateToStr(ReportDatePicker.Date));
    Report3.Variables['FONT_SIZE'] := SizeEdit.Value;

    if UpperDeptQuery.IsEmpty then Report3.Variables['U_NAME'] := Null
    else
        if VarIsNull(UpperDeptQuery['Name_Full']) then
            Report3.Variables['U_NAME'] := Null
        else
            Report3.Variables['U_NAME'] := QuotedStr(UpperDeptQuery['Name_Full']);

    if (Sender as TButton).Name = 'OkButton' then
    begin
        if sDesignReport then
            Report3.DesignReport
        else
            Report3.ShowReport;
    end;

    if (Sender as TButton).Name = 'ExportButton' then
        ExportReportTo(Report3);
end;

end.
