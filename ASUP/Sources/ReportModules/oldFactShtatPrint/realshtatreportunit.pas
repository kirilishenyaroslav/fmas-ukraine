unit RealShtatReportUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ComCtrls, FR_DSet, FR_DBSet, FR_Class, DB,
    IBCustomDataSet, IBQuery, Spin, SpComboBox, frxClass, frxDBSet,
  uFControl, uLabeledFControl, uSpravControl, ExtCtrls, uCharControl;

type
    TRealShtatReportForm = class(TForm)
        Label4: TLabel;
        Label2: TLabel;
        DateBegPicker: TDateTimePicker;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DepartmentEdit: TEdit;
        Button1: TButton;
        ResultQuery: TIBQuery;
        ResultReport: TfrReport;
        ResultDataSet: TfrDBDataSet;
        ExportButton: TBitBtn;
        GroupBox1: TGroupBox;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        SRLabel1: TLabel;
        SRBox: TSpComboBox;
        ResultQuery2: TIBQuery;
        ResultDataSet2: TfrDBDataSet;
        ResultReport2: TfrReport;
        SrQuery: TIBQuery;
        SrQueryID_SR: TIntegerField;
        SrQueryDATE_BEG: TDateField;
        SrQueryDATE_END: TDateField;
        GroupBox2: TGroupBox;
        Label1: TLabel;
        SizeEdit: TSpinEdit;
        Get_Sign: TIBQuery;
        Get_SignFIO: TIBStringField;
        Get_SignPOST_NAME: TIBStringField;
        ResultQuery3: TIBQuery;
        MainData: TDataSource;
        ConstsQuery: TDataSource;
        frxConsts: TfrxDBDataset;
        frxMainData: TfrxDBDataset;
        frxReport: TfrxReport;
    Label3: TLabel;
    SignPanel: TPanel;
    UTVPost: TqFCharControl;
    Label5: TLabel;
    UTVFIO: TqFCharControl;
    Label6: TLabel;
    SignFIO: TqFCharControl;
    Label7: TLabel;
    AgreePost: TqFCharControl;
    AgreeFIO: TqFCharControl;
    SignPost: TqFCharControl;
        procedure FormCreate(Sender: TObject);
        procedure Button1Click(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure RadioButton1Click(Sender: TObject);
        procedure RadioButton2Click(Sender: TObject);
        procedure DateBegPickerChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
        procedure GetSigners;
        procedure SetFRParam(ParamName: string; ParamValue: Variant);
    public
        ID_DEPARTMENT: Integer;
        Fact_SR_Utv_Post, Fact_SR_Utv_FIO, Fact_Sr_Podp_Post,
            Fact_Sr_Podp_FIO, Fact_SR_Agree_Post, Fact_SR_Agree_FIO: string;
    end;

const
    UseFR3 = True;

var
    RealShtatReportForm: TRealShtatReportForm;

implementation

uses uExportReport, uoFactShtatReport, uCommonSp, qFTools;
{$R *.dfm}

procedure TRealShtatReportForm.FormCreate(Sender: TObject);
begin
    ResultQuery.Transaction := ReadTransaction;
    ResultQuery2.Transaction := ReadTransaction;
    ResultQuery3.Transaction := ReadTransaction;

    Get_Sign.Transaction := ReadTransaction;
    SrQuery.Transaction := ReadTransaction;

    ID_DEPARTMENT := DepNameQuery['Local_Department'];
    DepartmentEdit.Text := DepNameQuery['Name_Full'];

    DateBegPicker.Date := Date;

    DateBegPickerChange(Self);

        // загрузить подписывающих
    qFAutoLoadFromRegistry(Self);

{    Get_Sign.Close;
    Get_Sign.Params.ParamValues['Id_Shtat_Prop'] := 1112;
    Get_Sign.Params.ParamValues['CUR_DATE'] := DATE;
    Get_Sign.Open;

    if VarIsNull(UTVPost.Value) then UTVPost.Value := Get_SignPOST_NAME.Value;
    if VarIsNull(UTVFIO.Value) then UTVFIO.Value := Get_SignFIO.Value;

    Get_Sign.Close;
    Get_Sign.Params.ParamValues['Id_Shtat_Prop'] := 1212;
    Get_Sign.Params.ParamValues['CUR_DATE'] := DATE;
    Get_Sign.Open;

    if VarIsNull(SignPost.Value) then SignPost.Value := Get_SignPOST_NAME.Value;
    if VarIsNull(SignFIO.Value) then SignFIO.Value := Get_SignFIO.Value;

    Get_Sign.Close;

    Get_Sign.Close;
    Get_Sign.Params.ParamValues['Id_Shtat_Prop'] := 1612;
    Get_Sign.Params.ParamValues['CUR_DATE'] := DATE;
    Get_Sign.Open;

    if VarIsNull(AgreePost.Value) then AgreePost.Value := Get_SignPOST_NAME.Value;
    if VarIsNull(AgreeFIO.Value) then AgreeFIO.Value := Get_SignFIO.Value;}
end;

procedure TRealShtatReportForm.Button1Click(Sender: TObject);
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
            FieldValues['DBHandle'] := Integer(uoFactShtatReport.DB.Handle);
            FieldValues['Actual_Date'] := DateBegPicker.Date;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Id_Department := sp.Output['Id_Department'];
            DepartmentEdit.Text := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;


procedure TRealShtatReportForm.GetSigners;
begin
    Get_Sign.Close;
    Get_Sign.Params.ParamValues['Id_Shtat_Prop'] := 1112;
    Get_Sign.Params.ParamValues['CUR_DATE'] := DATE;
    Get_Sign.Open;

    FACT_SR_UTV_POST := Get_SignPOST_NAME.Value;
    FACT_SR_UTV_FIO := Get_SignFIO.Value;

    Get_Sign.Close;
    Get_Sign.Params.ParamValues['Id_Shtat_Prop'] := 1212;
    Get_Sign.Params.ParamValues['CUR_DATE'] := DATE;
    Get_Sign.Open;

    FACT_SR_PODP_POST := Get_SignPOST_NAME.Value;
    FACT_SR_PODP_FIO := Get_SignFIO.Value;

    Get_Sign.Close;

    Get_Sign.Close;
    Get_Sign.Params.ParamValues['Id_Shtat_Prop'] := 1612;
    Get_Sign.Params.ParamValues['CUR_DATE'] := DATE;
    Get_Sign.Open;

    FACT_SR_AGREE_POST := Get_SignPOST_NAME.Value;
    FACT_SR_AGREE_FIO := Get_SignFIO.Value;
end;

procedure TRealShtatReportForm.OkButtonClick(Sender: TObject);
var
    rep: TfrReport;
begin
  //  GetSigners;
    FACT_SR_UTV_POST := UTVPost.Value;
    FACT_SR_UTV_FIO := UTVFIO.Value;

    FACT_SR_PODP_POST := SignPost.Value;
    FACT_SR_PODP_FIO := SignFIO.Value;

    FACT_SR_AGREE_POST := AgreePost.Value;
    FACT_SR_AGREE_FIO := AgreeFIO.Value;


    if (ID_DEPARTMENT = -1) then
    begin
        MessageDlg('Треба вибрати підрозділ.', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;
    if (SRBox.GetId = -1) then
    begin
        MessageDlg('Треба вибрати штатний розклад.', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if RadioButton1.Checked then
    begin
        ResultQuery.Close;
        ResultQuery.Params.ParamValues['ID_DEPARTMENT'] := ID_DEPARTMENT;
        ResultQuery.Params.ParamValues['REPORT_DATE'] := DateToStr(DateBegPicker.Date);
        ResultQuery.Params.ParamValues['ID_SR'] := SRBox.GetId;
        ResultQuery.Open;
    end;

    if RadioButton2.Checked
        then
    begin
        ResultQuery2.Close;
        ResultQuery2.Params.ParamValues['ID_DEPARTMENT'] := ID_DEPARTMENT;
        ResultQuery2.Params.ParamValues['REPORT_DATE'] := DateToStr(DateBegPicker.Date);
        ResultQuery2.Params.ParamValues['ID_SR'] := SRBox.GetId;
        ResultQuery2.Open;
    end;

    ResultQuery3.Close;
            {ResultQuery3.Params.ParamValues['ID_DEPARTMENT'] := ID_DEPARTMENT;
            ResultQuery3.Params.ParamValues['REPORT_DATE'] := DateToStr(DateBegPicker.Date);
            ResultQuery3.Params.ParamValues['ID_SR'] := SRBox.GetId
            }ResultQuery3.Open;

    if (RadioButton1.Checked and not ResultQuery.IsEmpty) or (RadioButton2.Checked and not ResultQuery2.IsEmpty)
        then
    begin
        if RadioButton1.Checked then
        begin
            if Version = 2 then
                if UseFR3 then
                    frxReport.LoadFromFile(ProgramPath + 'Reports\ASUP\RealShtatReportD0.fr3')
                else
                    ResultReport.LoadFromFile(ProgramPath + 'Reports\ASUP\RealShtatReport.frf')
            else
                ResultReport.LoadFromFile(ProgramPath + 'Reports\ASUP\RealShtatReport_chermet.frf');
        end;

        if RadioButton2.Checked then
        begin
            if Version = 2 then
                ResultReport2.LoadFromFile(ProgramPath + 'Reports\ASUP\RealShtatReportWorkers.frf')
            else
                ResultReport2.LoadFromFile(ProgramPath + 'Reports\ASUP\RealShtatReportWorkers_chermet.frf');


            if (Sender as TButton).Name = 'ExportButton' then
                ExportReportTo(ResultReport2);
        end;

        SetFRParam('Fact_SR_Utv_Post', Fact_Sr_Utv_Post);
        SetFRParam('Fact_SR_Utv_FIO', Fact_Sr_Utv_FIO);

        SetFRParam('Fact_Sr_Podp_Post', Fact_Sr_Podp_Post);
        SetFRParam('Fact_Sr_Podp_FIO', Fact_Sr_Podp_FIO);

        SetFRParam('Fact_Sr_Agree_Post', Fact_Sr_Agree_Post);
        SetFRParam('Fact_Sr_Agree_FIO', Fact_Sr_Agree_FIO);

        SetFRParam('Font_Size', SizeEdit.Value);

        if RadioButton1.Checked then
        begin
            SetFRParam('Oklad_Title', 'Окл');
            SetFRParam('TITLE', 'Фактичний штатний розклад керівників, фахівців та службовців');
        end;
        if RadioButton2.Checked then
        begin
            SetFRParam('OKLAD_TITLE', 'Т/О');
            SetFRParam('TITLE', 'Фактичний штатний розклад робітників');
        end;

        if RadioButton1.Checked then
            rep := ResultReport
        else
            rep := ResultReport2;

        if (Sender as TButton).Name = 'OkButton' then
        begin
            if RadioButton1.Checked and UseFR3 then
                if sDesignReport then
                    frxReport.DesignReport
                else
                    frxReport.ShowReport
            else
                if sDesignReport then
                    rep.DesignReport
                else
                    rep.ShowReport;
        end;

        if Sender = ExportButton then
            if UseFR3 then ExportReportTo(frxReport)
            else ExportReportTo(rep);
    end
    else
    begin
        MessageDlg('На дату "' + DateToStr(DateBegPicker.Date) + '" для підрозділу "' + DepartmentEdit.Text + '" не має жодної позиції штатного роспису.', mtInformation, [mbOk], 0);
        ModalResult := mrNone;
    end;

    qFAutoSaveIntoRegistry(Self);
end;

procedure TRealShtatReportForm.RadioButton1Click(Sender: TObject);
begin
//  ResultQuery.SQL.Text := 'SELECT * FROM REPORT_REAL_SHTATRAS(:ID_DEPARTMENT,:REPORT_DATE,:ID_SR);'
end;

procedure TRealShtatReportForm.RadioButton2Click(Sender: TObject);
begin
//  ResultQuery.SQL.Text := 'SELECT * FROM REPORT_REAL_SHTATRAS_WORKERS(:ID_DEPARTMENT,:REPORT_DATE,:ID_SR);'
end;

procedure TRealShtatReportForm.DateBegPickerChange(Sender: TObject);
begin
    SrQuery.Close;
    SrQuery.Params.ParamValues['REPORT_DATE'] := DateToStr(DateBegPicker.Date);
    SrQuery.Open;

    if not SrQuery.IsEmpty
        then
        SRBox.Prepare(SrQueryID_SR.Value)
    else
        SRBox.Prepare(-1, '');
end;

procedure TRealShtatReportForm.SetFRParam(ParamName: string; ParamValue: Variant);
begin
    //
    if RadioButton1.Checked and UseFR3 then
        if VarType(ParamValue) = varString then
            frxReport.Variables[ParamName] := QuotedStr(ParamValue)
        else
            if VarType(ParamValue) = varDate then
                frxReport.Variables[ParamName] := QuotedStr(DateToStr(ParamValue))
            else
                frxReport.Variables[ParamName] := ParamValue
        else
            frVariables[ParamName] := ParamValue;
end;

procedure TRealShtatReportForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //
    qFAutoSaveIntoRegistry(Self);
end;

end.

