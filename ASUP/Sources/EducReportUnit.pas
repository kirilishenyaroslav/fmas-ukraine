
{ -$Id: EducReportUnit.pas,v 1.9 2007/08/20 11:53:01 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Отчет по сотрудника, продолжающим обучение".   }
{    Формирование отчета по сотрудникам, продолжающим обучение                 }
{    Ответственный:Данил Збуривский                                            }

unit EducReportUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    FR_DSet, FR_DBSet, FR_Class, Db, IBCustomDataSet, IBQuery, StdCtrls,
    PersonalCommon, Buttons, ComCtrls, frxClass, frxDesgn, frxDBSet,
    SpComboBox;

type
    TEducReportForm = class(TForm)
        EducReportQuery: TIBQuery;
        EducReport: TfrReport;
        EducDataSet: TfrDBDataSet;
        CancelButton: TBitBtn;
        OkButton: TBitBtn;
        ExportButton: TBitBtn;
        Label1: TLabel;
        Label2: TLabel;
        Edit1: TEdit;
        DateBegPicker: TDateTimePicker;
        Button1: TButton;
        frxDesigner1: TfrxDesigner;
        EducDS: TfrxDBDataset;
        EducBox: TSpComboBox;
        IsEduc: TCheckBox;
    EducReport3: TfrxReport;
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure Button1Click(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure IsEducClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
    { Private declarations }
    public
        ID_DEPARTMENT: Integer;
        SHOW_ALL: Integer;
    end;

var
    EducReportForm: TEducReportForm;

implementation

uses DepartmentsViewUnit, uExportReport;

{$R *.DFM}

procedure TEducReportForm.FormCreate(Sender: TObject);
begin
    EducReportQuery.Transaction := PersonalCommon.ReadTransaction;

    Id_Department := -1;
    DateBegPicker.Date := Date;

    EducBox.LoadFromRegistry;
end;

procedure TEducReportForm.OkButtonClick(Sender: TObject);
begin
    if (ID_DEPARTMENT = -1) then begin
        MessageDlg('Треба вибрати підрозділ.', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    EducReportQuery.Close;
    EducReportQuery.Params.ParamValues['Id_Department'] := Id_DEpartment;
    EducReportQuery.Params.ParamValues['Report_Date'] := DateToStr(DateBegPicker.Date);
    EducReportQuery.Params.ParamValues['SHOW_ALL'] := SHOW_ALL;

    if IsEduc.Checked then
        EducReportQuery.Params.ParamValues['id_educ'] := EducBox.GetId
    else
        EducReportQuery.Params.ParamValues['id_educ'] := -1;

    EducReportQuery.Open;

    if SHOW_ALL = 1 then
        EducReport3.LoadFromFile(ProgramPath + 'Reports\ASUP\educ_Report_Students.fr3')
    else
        EducReport3.LoadFromFile(ProgramPath + 'Reports\ASUP\educ_Report_01.fr3');

    EducReport3.Variables['Report_Date'] := QuotedStr(DateToStr(DateBegPicker.Date));
    EducReport3.Variables['Show_All'] := SHOW_ALL;

    if Sender = ExportButton then
        ExportReportTo(EducReport3)
    else
        if sDesignReport then EducReport3.DesignReport
        else EducReport3.ShowReport;
{
    begin
     EducReport.LoadFromFile(ProgramPath + 'Reports\ASUP\educ_Report_01.frf');
        frVariables['Report_Date'] := DateToStr(DateBegPicker.Date);
        frVariables['Show_All'] := SHOW_ALL;
     if Sender = ExportButton then
      ExportReportTo(EducReport)
     else
     if sDesignReport then EducReport.DesignReport
     else EducReport.ShowReport;
    end;}
end;

procedure TEducReportForm.Button1Click(Sender: TObject);
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

procedure TEducReportForm.FormShow(Sender: TObject);
begin
    if Show_All = -1 then
        Caption := 'Звіт по освіті';
end;

procedure TEducReportForm.IsEducClick(Sender: TObject);
begin
    EducBox.Enabled := IsEduc.Checked;
end;

procedure TEducReportForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    EducBox.SaveIntoRegistry;
end;

end.
