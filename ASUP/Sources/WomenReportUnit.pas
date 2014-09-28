
{ -$Id: WomenReportUnit.pas,v 1.5 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{              Модуль "Формирование отчета по всем сотрудницам предприятия"    }
{         Формирует отчет по всем сотрудницам предприятия                      }
{         Ответственный: Данил Збуривский                                      }

unit WomenReportUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    FR_DSet, FR_DBSet, FR_Class, Db, IBCustomDataSet, IBQuery, StdCtrls,
    Buttons, PersonalCommon, ComCtrls, frxClass, frxDBSet;

type
    TWomenReportForm = class(TForm)
        ReportQuery: TIBQuery;
        Report: TfrReport;
        DataSet: TfrDBDataSet;
        Label1: TLabel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ExportButton: TBitBtn;
        DateBegPicker: TDateTimePicker;
        Edit1: TEdit;
        Button1: TButton;
        Label2: TLabel;
        ReportQueryFAMILIA: TIBStringField;
        ReportQueryIMYA: TIBStringField;
        ReportQueryOTCHESTVO: TIBStringField;
        ReportQueryBIRTH_DATE: TDateField;
        ReportQueryNAME_DEP: TIBStringField;
        ReportQueryID_DEPARTMENT: TIntegerField;
        Report3: TfrxReport;
        frxDBDataset1: TfrxDBDataset;
        procedure FormCreate(Sender: TObject); virtual;
        procedure OkButtonClick(Sender: TObject); virtual;
        procedure Button1Click(Sender: TObject);
    private
    { Private declarations }
    public
        Id_DEpartment: Integer;
    end;

var
    WomenReportForm: TWomenReportForm;

implementation

uses DepartmentsViewUnit, uExportReport;
{$R *.DFM}

procedure TWomenReportForm.FormCreate(Sender: TObject);
begin
    ReportQuery.Transaction := PersonalCommon.ReadTransaction;
    DateBegPicker.Date := Date;
    Id_Department := -1;
end;

procedure TWomenReportForm.OkButtonClick(Sender: TObject);
begin
    if (ID_DEPARTMENT = -1) then begin
        MessageDlg('Треба вибрати підрозділ.', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    ReportQuery.Close;
    ReportQuery.Params.ParamValues['report_date'] := DateToStr(DateBegPicker.Date);
    ReportQuery.Params.ParamValues['id_department'] := id_department;
    ReportQuery.Open;
{
 frVariables['ReportDate'] := DateBegPicker.Date;

 Report.LoadFromFile(ProgramPath + 'Reports\ASUP\women_Report.frf');

    if (Sender as TButton).Name = 'OkButton' then
        if sDesignReport then
            Report.DesignReport
        else
            Report.ShowReport;

    if (Sender as TButton).Name = 'ExportButton' then ExportReportTo(Report);}



    Report3.LoadFromFile(ProgramPath + 'Reports\ASUP\women_Report.fr3');
    Report3.Variables['ReportDate'] := QuotedStr(DateToStr(DateBegPicker.Date));

    if (Sender as TButton).Name = 'OkButton' then
        if sDesignReport then
            Report3.DesignReport
        else
            Report3.ShowReport;

    if (Sender as TButton).Name = 'ExportButton' then ExportReportTo(Report3);
end;

procedure TWomenReportForm.Button1Click(Sender: TObject);
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


end.
