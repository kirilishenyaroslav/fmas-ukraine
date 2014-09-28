
{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                                Отчет по вакансиям (3-ПН)                     }
{                                                                              }
{                                                                              }
{                                              ответственный: Тимофеев Антон   }
{ version groundhog }

unit Date_Form;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, StdCtrls, Buttons, FR_DSet, FR_DBSet, FIBDatabase,
    pFIBDatabase, DB, FIBDataSet, pFIBDataSet, FR_Class, PersonalCommon, SpCommon,
    GoodFunctionsUnit, IBCustomDataSet, IBQuery, SpComboBox;

type
    TReportVakantForm = class(TForm)
        frGet_Free_Place: TfrReport;
        pFIBDataSet: TpFIBDataSet;
        BBOk: TBitBtn;
        BBExp: TBitBtn;
        BBCancel: TBitBtn;
        DTPActDate: TDateTimePicker;
        Label1: TLabel;
        frDBDataSet1: TfrDBDataSet;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        Label2: TLabel;
        Get_Sign: TIBQuery;
        Get_SignFIO: TIBStringField;
        Get_SignPOST_NAME: TIBStringField;
        SRBox: TSpComboBox;
        SRLabel1: TLabel;
        SrQuery: TIBQuery;
        SrQueryID_SR: TIntegerField;
        SrQueryDATE_BEG: TDateField;
        SrQueryDATE_END: TDateField;
        procedure BBOkClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure DepartmentButtonClick(Sender: TObject);
        procedure DTPActDateChange(Sender: TObject);
    private
    { Private declarations }
    public
        Id_Department: Integer;
    end;

var
    ReportVakantForm: TReportVakantForm;

implementation

uses DepartmentsViewUnit, NagScreenUnit, uExportReport, DateUtils;

{$R *.dfm}

procedure TReportVakantForm.BBOkClick(Sender: TObject);
begin
    if ID_Department = -1 then begin
        ErrMsg('Треба вибрати підрозділ!');
        exit;
    end;

    if SrBox.GetId = -1 then begin
        ErrMsg('Треба вибрати штатний розклад!');
        exit;
    end;

    frVariables['DEPNAME'] := DepartmentEdit.Text;

    Get_Sign.Close;
    Get_Sign.Params.ParamValues['Id_Shtat_Prop'] := 1214;
    Get_Sign.Params.ParamValues['CUR_DATE'] := DTPActDate.DATE;
    Get_Sign.Open;

    frVariables['PN3_SIGN_POST'] := Get_SignPOST_NAME.Value;
    frVariables['PN3_SIGN_FIO'] := Get_SignFIO.Value;

    Get_Sign.Close;

    pFIBDataSet.Close;
    pFIBDataSet.SelectSQL.Clear;
    pFIBDataSet.SelectSQL.Text := 'select distinct * from get_free_place_info(' + QuotedStr(DateToStr(DTPActDate.Date)) + ','
        + IntToStr(Id_Department) + ',' +
        IntToStr(SrBox.GetId) + ')';
    pFIBDataSet.Open;

    case MonthOf(DTPActDate.Date) of
        1: frVariables['Month_Name'] := 'січень';
        2: frVariables['Month_Name'] := 'лютий';
        3: frVariables['Month_Name'] := 'березень';
        4: frVariables['Month_Name'] := 'квітень';
        5: frVariables['Month_Name'] := 'травень';
        6: frVariables['Month_Name'] := 'червень';
        7: frVariables['Month_Name'] := 'липень';
        8: frVariables['Month_Name'] := 'серпень';
        9: frVariables['Month_Name'] := 'вересень';
        10: frVariables['Month_Name'] := 'жовтень';
        11: frVariables['Month_Name'] := 'листопад';
        12: frVariables['Month_Name'] := 'грудень';
    end;

    frVariables['Report_Year'] := YearOf(DTPActDate.Date);

    frGet_Free_Place.LoadFromFile(ProgramPath + 'Reports\ASUP\Get_Free_Place_Form.frf');

    if Sender = BBExp
        then
        ExportReportTo(frGet_Free_Place)
    else
        if sDesignReport
            then
            frGet_Free_Place.DesignReport
        else
            frGet_Free_Place.ShowReport;
end;

procedure TReportVakantForm.FormCreate(Sender: TObject);
begin
    DTPActDate.Date := Date();

    pFibDataSet.Transaction := PersonalCommon.FIBReadTransaction;
    Get_Sign.Transaction := PersonalCommon.ReadTransaction;
    SrQuery.Transaction := PersonalCommon.ReadTransaction;

    Id_Department := PersonalCommon.Consts_Query['LOCAL_DEPARTMENT'];
    DepartmentEdit.Text := PersonalCommon.DepNameQuery['NAME_FULL'];

    DTPActDateChange(Self);
end;

procedure TReportVakantForm.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin

    form := TDepartmentsViewForm.Create(Self);

    form.Buhg := False;
    form.Prepare(True, DTPActDate.Date);
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

procedure TReportVakantForm.DTPActDateChange(Sender: TObject);
begin
    SrQuery.Close;
    SrQuery.Params.ParamValues['REPORT_DATE'] := DateToStr(DTPActDate.Date);
    SrQuery.Open;

    if not SrQuery.IsEmpty
        then
        SRBox.Prepare(SrQueryID_SR.Value)
    else
        SRBox.Prepare(-1, '');
end;

end.
