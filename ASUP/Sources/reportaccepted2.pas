unit ReportAccepted2;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ComCtrls, Buttons, FR_DSet, FR_DBSet, FR_Class, DB,
    IBCustomDataSet, IBQuery, PersonalCommon, GoodFunctionsUnit;

type
    TReportAccepted2Form = class(TForm)
        DateBeg: TDateTimePicker;
        DateEnd: TDateTimePicker;
        Label1: TLabel;
        Label2: TLabel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ExportButton: TBitBtn;
        ReportQuery: TIBQuery;
        Report: TfrReport;
        ReportDataSet: TfrDBDataSet;
        ReportQueryIMYA: TIBStringField;
        ReportQueryFAMILIA: TIBStringField;
        ReportQueryOTCHESTVO: TIBStringField;
        ReportQueryNAME_POST: TIBStringField;
        ReportQueryPOST_CODE: TIBStringField;
        ReportQueryNUM_ORDER: TIBStringField;
        ReportQueryDATE_ORDER: TDateField;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        Label3: TLabel;
        Get_Sign: TIBQuery;
        Get_SignFIO: TIBStringField;
        Get_SignPOST_NAME: TIBStringField;
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure DepartmentButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        Id_Department: Integer;
    end;

var
    ReportAccepted2Form: TReportAccepted2Form;

implementation

uses DepartmentsViewUnit, NagScreenUnit, uExportReport;

{$R *.dfm}

procedure TReportAccepted2Form.FormCreate(Sender: TObject);
begin
    ReportQuery.Transaction := ReadTransaction;
    Get_Sign.Transaction := ReadTransaction;

    DateBeg.Date := Date - 10;
    DateEnd.Date := Date;

    Id_Department := PersonalCommon.Consts_Query['LOCAL_DEPARTMENT'];
    DepartmentEdit.Text := PersonalCommon.DepNameQuery['NAME_FULL'];
end;

procedure TReportAccepted2Form.OkButtonClick(Sender: TObject);
begin
    if ID_Department = -1 then begin
        ErrMsg('Треба вибрати підрозділ!');
        exit;
    end;

    frVariables['DEPNAME'] := DepartmentEdit.Text;
    frVariables['PERIODBEG'] := DateToStr(DateBeg.Date);
    frVariables['PERIODEND'] := DateToStr(DateEnd.Date);

    ReportQuery.Close;
    ReportQuery.Params.ParamValues['DATE_BEG'] := DateToStr(DateBeg.Date);
    ReportQuery.Params.ParamValues['DATE_END'] := DateToStr(DateEnd.Date);
    ReportQuery.Params.ParamValues['ID_DEPARTMENT'] := ID_DEPARTMENT;
    ReportQuery.Open;

    Get_Sign.Close;
    Get_Sign.Params.ParamValues['Id_Shtat_Prop'] := 1213;
    Get_Sign.Params.ParamValues['CUR_DATE'] := DateEnd.DATE;
    Get_Sign.Open;

    frVariables['PN1_SIGN_POST'] := Get_SignPOST_NAME.Value;
    frVariables['PN1_SIGN_FIO'] := Get_SignFIO.Value;

    Get_Sign.Close;

    Report.LoadFromFile(ProgramPath + 'Reports\Asup\ReportAccepted2.frf');


    if (Sender as TButton).Name = 'OkButton' then begin
        if sDesignReport then
            Report.DesignReport
        else
            Report.ShowReport;
    end;

    if (Sender as TButton).Name = 'ExportButton' then
        ExportReportTo(Report);
end;

procedure TReportAccepted2Form.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin

    form := TDepartmentsViewForm.Create(Self);

    form.Buhg := False;
    form.Prepare(True, DateBeg.Date);
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

end.
