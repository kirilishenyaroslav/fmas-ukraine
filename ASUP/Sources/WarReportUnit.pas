{-$Id: WarReportUnit.pas,v 1.7 2007/06/16 12:52:46 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                             Модуль "Отчет по воинскому учету".               }
{                 Формирует отчет по воинскому учету на текущую дату.          }
{                                             ответственный: Збуривский Данил  }

unit WarReportUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    WomenReportUnit, FR_DSet, FR_DBSet, FR_Class, Db, IBCustomDataSet,
    IBQuery, StdCtrls, Buttons, PersonalCommon, ComCtrls, frxClass, frxDBSet,
    DepartmentsViewUnit, GoodFunctionsUnit, Spin, uExportReport;

type
    TWarReportForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label1: TLabel;
        ReportQuery: TIBQuery;
        Report: TfrReport;
        DataSet: TfrDBDataSet;
        ExportButton: TBitBtn;
        ReportDate: TDateTimePicker;
        GroupBox1: TGroupBox;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        ReportQuery2: TIBQuery;
        frxDBDataset1: TfrxDBDataset;
        Label3: TLabel;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        ReportQuery2FIO: TIBStringField;
        ReportQuery2BIRTH_DATE: TDateField;
        ReportQuery2NAME_WARPOST: TIBStringField;
        ReportQuery2NAME_WARPOSTGR: TIBStringField;
        ReportQuery2NAME_POST: TIBStringField;
        ReportQuery2STREET: TIBStringField;
        ReportQuery2KORPUS: TIBStringField;
        ReportQuery2HOUSE: TIBStringField;
        ReportQuery2FLAT: TIBStringField;
        ReportQuery2DATE_BEG: TDateField;
        ReportQuery2DATE_END: TDateField;
        ReportQuery2NAME_COUNTRY: TIBStringField;
        ReportQuery2NAME_TYPE_STREET: TIBStringField;
        ReportQuery2NAME_DISTRICT: TIBStringField;
        ReportQuery2NAME_PLACE: TIBStringField;
        ReportQuery2NAME_REGION: TIBStringField;
        ReportQuery2STREET_COMPARED: TIBStringField;
        ReportQuery2PLACE: TIBStringField;
        ReportQuery2ZIP: TIBStringField;
        ReportQuery2NAME_TYPE_PLACE: TIBStringField;
        ReportQuery2NAME_TYPE_REGION: TIBStringField;
        ReportQuery2REGION: TIBStringField;
        ReportQueryID_PCARD: TIntegerField;
        ReportQueryID_MAN: TIntegerField;
        ReportQueryFAMILIA: TIBStringField;
        ReportQueryIMYA: TIBStringField;
        ReportQueryOTCHESTVO: TIBStringField;
        ReportQueryID_WARPOST: TIntegerField;
        ReportQueryID_CATEGORY: TIntegerField;
        ReportQueryNAME_WARPOST: TIBStringField;
        ReportQueryID_WARSOSTAV: TIntegerField;
        ReportQueryNAME_WARSOSTAV: TIBStringField;
        ReportQueryID_WARPOSTGR: TIntegerField;
        ReportQueryNAME_WARPOSTGR: TIBStringField;
        ReportQuery2ACCEPT_DATE: TDateField;
        ReportQuery2VOENKOMAT: TIBStringField;
        ReportQuery2ID_CATEGORY: TIntegerField;
        ReportQuery2WAR_SOSTAV: TIBStringField;
        Report2: TfrxReport;
        GroupBox2: TGroupBox;
        Label2: TLabel;
        SizeEdit: TSpinEdit;
        Label4: TLabel;
        BronFilterBox: TComboBox;
        procedure OkButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure DepartmentButtonClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
    private
    { Private declarations }
    public
        Id_Department: Integer;
    end;

var
    WarReportForm: TWarReportForm;

implementation

{$R *.DFM}

procedure TWarReportForm.OkButtonClick(Sender: TObject);
begin

    if (ID_Department = -1) then begin
        ErrMsg('Потрібно вибрати підрозділ!');
        exit;
    end;

    if RadioButton1.Checked then begin
        Report2.LoadFromFile(ProgramPath + 'Reports\ASUP\war_report2.fr3');

        Report2.Variables['ReportDate'] := QuotedStr(DateToStr(ReportDate.Date));
        Report2.Variables['DepartmentName'] := QuotedStr(DepartmentEdit.Text);
        Report2.Variables['FontSize'] := SizeEdit.Value;

        ReportQuery2.Close;
        ReportQuery2.Params.ParamValues['GOOD_DATE'] := ReportDate.Date;
        ReportQuery2.Params.ParamValues['ID_DEPARTMENT'] := Id_Department;
        ReportQuery2.Params.ParamValues['BRON_FILTER'] := BronFilterBox.ItemIndex + 1;
        ReportQuery2.Open;

        if (Sender as TButton).Name = 'OkButton' then
            if sDesignReport then
                Report2.DesignReport
            else
                Report2.ShowReport;

         if (Sender as TButton).Name = 'ExportButton' then ExportReportTo(Report2);
    end;

    if RadioButton2.Checked then begin
        Report.LoadFromFile(ProgramPath + 'Reports\ASUP\war_Report.frf');

        frVariables['ReportDate'] := ReportDate.Date;
        frVariables['FontSize'] := SizeEdit.Value;
        frVariables['DepartmentName'] := DepartmentEdit.Text;

        ReportQuery.Close;
        ReportQuery.Params.ParamValues['ID_DEPARTMENT'] := Id_Department;
        ReportQuery.Params.ParamValues['Report_DATE'] := ReportDate.Date;
        ReportQuery.Params.ParamValues['BRON_FILTER'] := BronFilterBox.ItemIndex + 1;
        ReportQuery.Open;

        if (Sender as TButton).Name = 'OkButton' then
            if sDesignReport then
                Report.DesignReport
            else
                Report.ShowReport;

        if (Sender as TButton).Name = 'ExportButton' then ExportReportTo(Report);
    end;
end;

procedure TWarReportForm.FormCreate(Sender: TObject);
begin
    ReportQuery.Transaction := PersonalCommon.ReadTransaction;
    ReportQuery2.Transaction := PersonalCommon.ReadTransaction;
    Id_Department := -1;
end;

procedure TWarReportForm.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Self);

    form.Buhg := False;
    form.Prepare(True, ReportDate.Date);
    form.CanSelectRoot := True;

    if form.ShowModal = mrOk then
        with form do
        begin
            Id_Department := Selected_Id;

            if Id_Department = -1
                then DepartmentEdit.Text := Consts_Query['Firm_Name']
            else DepartmentEdit.Text := ResultQuery['Name_FULL'];
        end;

    form.Free;
end;

procedure TWarReportForm.FormShow(Sender: TObject);
begin
    ReportDate.Date := Date;
end;

end.
