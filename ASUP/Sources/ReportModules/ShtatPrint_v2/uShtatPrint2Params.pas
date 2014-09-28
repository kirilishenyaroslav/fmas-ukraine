
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2006               }
{******************************************************************************}

{                Модуль "Печать отчета по штатному расписанию"                 }
{             Выбор параметров и печать отчета по штатному расписанию          }
{                                                  ответственный: Олег Волков  }

unit uShtatPrint2Params;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, FR_Desgn, FR_DSet, FR_DBSet, FR_Class, Db,
    IBCustomDataSet, IBQuery, ComCtrls, SpCommon,
    SpComboBox, DateUtils, uShtat2DM, uCommonSP, uExportReport, uFControl,
    uLabeledFControl, uCharControl, qFTools, frxExportRTF, frxExportHTML,
    frxExportTXT, frxClass, frxExportXLS;

type
    TfmShtatPrint2Params = class(TReportForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label2: TLabel;
        CurTime: TDateTimePicker;
        VacanciesBox: TCheckBox;
        Label3: TLabel;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        WorkersBox: TCheckBox;
        PlanBox: TCheckBox;
        ExportButton: TBitBtn;
        SRLabel1: TLabel;
        SRBox: TSpComboBox;
        ReportTypeBox: TComboBox;
        CalcVacLabel: TLabel;
        CalcVacancies: TComboBox;
        ReportTypeLabel: TLabel;
        Chief_FIO: TqFCharControl;
        Label4: TLabel;
        Chief_Post: TqFCharControl;
        Label5: TLabel;
        Kadr_FIO: TqFCharControl;
        Kadr_Post: TqFCharControl;
        Label6: TLabel;
        Exec_FIO: TqFCharControl;
        Exec_Post: TqFCharControl;
        Label7: TLabel;
        frxXLSExport1: TfrxXLSExport;
        frxTXTExport2: TfrxTXTExport;
        frxHTMLExport1: TfrxHTMLExport;
        frxRTFExport1: TfrxRTFExport;
        frxRTFExport2: TfrxRTFExport;
        ITRBox: TCheckBox;
        Label1: TLabel;
        ReportTypeBoxITR: TComboBox;
        procedure FormCreate(Sender: TObject);
        procedure DepartmentButtonClick(Sender: TObject);
        procedure SetDept(dep: Integer);
        procedure ExportButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure WorkersBoxClick(Sender: TObject);
        procedure VacanciesBoxClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure ITRBoxClick(Sender: TObject);
    private
        Id_Department: Integer;
        Id_SR: Integer;

        DetailedMFund: Boolean;

        DM: TdmShtat2Report;

        DesignReport: Boolean;

        AllStavok, AllFund: Double;

        procedure PrepareReport;
        procedure PrepareFR3;
    public
        constructor Create(AOwner: TComponent; DM: TdmShtat2Report; DesignReport: Boolean); reintroduce;
        procedure SetSR(Id_SR: Integer);
        procedure Prepare(TheDate, Date_Beg, Date_End: TDate); override;
        property Department: Integer read Id_Department write SetDept;
    end;

const
    UseFR3 = True;

var
    fmShtatPrint2Params: TfmShtatPrint2Params;

implementation

{$R *.DFM}

constructor TfmShtatPrint2Params.Create(AOwner: TComponent; DM: TdmShtat2Report; DesignReport: Boolean);
begin
    inherited Create(AOwner);

    Self.DM := DM;
    Self.DesignReport := DesignReport;
end;

procedure TfmShtatPrint2Params.SetSR(Id_SR: Integer);
begin
    Self.Id_SR := Id_SR;
    SRBox.Prepare(Id_SR);
end;

procedure TfmShtatPrint2Params.Prepare(TheDate, Date_Beg, Date_End: TDate);
begin
    CurTime.DateTime := TheDate;
    CurTime.Repaint;
end;

procedure TfmShtatPrint2Params.SetDept(dep: Integer);
begin
    Id_Department := dep;

    with DM do
        if Id_Department = -1 then
            DepartmentEdit.Text := Consts_Query['Firm_Name']
        else
        begin
            DeptQuery.Close;
            DeptQuery.Params.ParamValues['Cur_Time'] := CurTime.DateTime;
            DeptQuery.Params.ParamValues['Id_Department'] := Id_Department;
            DeptQuery.Open;
            DepartmentEdit.Text := DeptQuery['Name_Full'];
        end;
end;

procedure TfmShtatPrint2Params.FormCreate(Sender: TObject);
var
    cur_dep: Integer;
begin
    CurTime.Date := Date;

    cur_dep := DM.Consts_Query['Current_Department'];
    DM.DeptQuery.Params.ParamValues['Root'] := cur_dep;

    if Id_SR <= 0 then Id_SR := 1;

    if Id_Department = 0 then Id_Department := cur_dep;
    if (Id_Department = -1) and (cur_dep <> -1) then
        Id_Department := cur_dep;

    SetDept(Id_Department);

    qFAutoLoadFromRegistry(Self, nil);
end;

procedure TfmShtatPrint2Params.DepartmentButtonClick(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DM.Database.Handle);
            FieldValues['Actual_Date'] := Date;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Id_Department := sp.Output['Id_Department'];
            DepartmentEdit.Text := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

procedure TfmShtatPrint2Params.PrepareReport;
var
    i, month: Integer;
    normDs: TDataSet;
begin
    if WorkersBox.Checked then
    begin
    {блок по рабочим}
        if ReportTypeBox.ItemIndex = 3 then
        //звіт з детальним місячним фондом
            DM.ReportQuery.SQL.Text :=
                'SELECT * FROM ShtatRas_Report_Workers_MFund(:Id_Department,1,:MaxNest'
                + ' ,:Cur_Time,:Vacancies, :Id_SR)'
        else
        begin
            if (ReportTypeBox.ItemIndex = 1) or (ReportTypeBox.ItemIndex = 2) then
            //скорочений звіт, скорочений звіт з місячним фондом
                DM.ReportQuery.SQL.Text :=
                    'SELECT * FROM ShtatRas_Report_Workers_s(:Id_Department'
                    + ' ,:Cur_Time,:Vacancies, :Id_SR)'
            else //детальний звіт
                DM.ReportQuery.SQL.Text :=
                    'SELECT * FROM ShtatRas_Report_Workers(:Id_Department,1,:MaxNest'
                    + ' ,:Cur_Time,:Vacancies, :Id_SR)'
        end
    {блок по рабочим}
    end
    else
    begin
        if ITRBox.Checked then
        begin
        {блок по ИТР}
            if ReportTypeBoxITR.ItemIndex = 3 then
            //звіт з детальним місячним фондом
                DM.ReportQuery.SQL.Text :=
                    'SELECT * FROM ShtatRas_Report_ITR_MFund(:Id_Department,1,:MaxNest'
                    + ' ,:Cur_Time,:Vacancies, :Id_SR)'
            else
            begin
                if (ReportTypeBoxITR.ItemIndex = 1) or (ReportTypeBoxITR.ItemIndex = 2) then
                // скорочений звіт, скорочений звіт з місячним фондом
                    DM.ReportQuery.SQL.Text :=
                        'SELECT * FROM ShtatRas_Report_ITR_s(:Id_Department'
                        + ' ,:Cur_Time,:Vacancies, :Id_SR)'
                else //детальний звіт
                    DM.ReportQuery.SQL.Text :=
                        'SELECT * FROM ShtatRas_Report_ITR(:Id_Department,1,:MaxNest'
                        + ' ,:Cur_Time,:Vacancies, :Id_SR)'
            end
        {блок по ИТР}
        end
        else
            if PlanBox.Checked then //проект штатного розпису
                DM.ReportQuery.SQL.Text :=
                    'SELECT * FROM ShtatRas_Plan_Report(:Id_Department,1,:MaxNest'
                    + ' ,:Cur_Time, :Id_SR)'
            else //видимо общий случай
                DM.ReportQuery.SQL.Text :=
                    'SELECT * FROM ShtatRas_Report(:Id_Department,1,:MaxNest'
                    + ' ,:Cur_Time,:Vacancies, :Id_SR)';
    end;

    Id_SR := SRBox.GetId;

    DM.Get_SR_Date.Close;
    DM.Get_SR_Date.Params.ParamValues['Id_SR'] := Id_SR;
    DM.Get_SR_Date.Open;

    with DM.ReportQuery.Params do
    begin
        ParamValues['Id_SR'] := Id_SR;
        ParamValues['Id_Department'] := Id_Department;
        if not WorkersBox.Checked then
            if not ITRBox.Checked then ParamValues['MaxNest'] := -1;
        ParamValues['Cur_Time'] := CurTime.DateTime;

        frVariables['RepDate'] := CurTime.DateTime;

{        if VacanciesBox.Checked then
            ParamValues['Calc_Vacancies'] := 1
        else ParamValues['Calc_Vacancies'] := 0;}

        if not PlanBox.Checked then
        begin
            if VacanciesBox.Checked then
                ParamValues['Vacancies'] := 1
            else
                ParamValues['Vacancies'] := 0;
            frVariables['Vacanices'] := ParamValues['Vacancies'];
        end;
    end;

    if PlanBox.Checked then
        frVariables['Date_Beg'] := CurTime.Date;

    if Id_Department = DM.Consts_Query['Current_Department'] then
        frVariables['Dept_Name'] := ''
    else
        if WorkersBox.Checked then
            frVariables['Dept_Name'] := 'підрозділу «' +
                UpperCase(DepartmentEdit.Text) + '»'
        else
            frVariables['Dept_Name'] := UpperCase(DepartmentEdit.Text);

    frVariables['Firm_Name'] := UpperCase(DM.Consts_Query['Firm_Name']);

    frVariables['Date_Beg'] := DM.Get_SR_Date['Date_Beg'];

    frVariables['Chief_Post'] := Chief_Post.Value;
    frVariables['Chief_FIO'] := Chief_FIO.Value;
    frVariables['Kadr_Post'] := Kadr_Post.Value;
    frVariables['Kadr_FIO'] := Kadr_FIO.Value;
    frVariables['Exec_Post'] := Exec_Post.Value;
    frVariables['Exec_FIO'] := Exec_FIO.Value;

    AlLStavok := 0;
    AllFund := 0;

    with DM do
        if not PlanBox.Checked then
        begin
            ReportQuery.Open;
            ReportQuery.First;
            while not ReportQuery.Eof do
            begin
                if ReportQuery['Id_Post'] <> -1 then
                begin
                    AllStavok := AllStavok + ReportQuery['Kol_Stavok'];
                    if WorkersBox.Checked then
                        AllFund := AllFund + ReportQuery['MFund']
                    else
                        AllFund := AllFund + ReportQuery['Oklad'] * ReportQuery['Kol_Stavok'];
                end;
                ReportQuery.Next;
            end;
            ReportQuery.First;
        end;

    frVariables['Version'] := Version;
    frVariables['AllStavok'] := AllStavok;
    frVariables['AllFund'] := AllFund;

    with DM.ShtatReport do
    begin
        if WorkersBox.Checked then
        begin
        {начало блока по рабочим}
            if Version = 1 then
                LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatReportWorkers.frf')
            else  //Version = 2
            begin
                if ReportTypeBox.ItemIndex = 0 then
                // Детальний звіт
                    LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatReportWorkers2.frf');

                if ReportTypeBox.ItemIndex = 1 then
                begin
                //Скорочений звіт
                    if UseFR3 then
                    begin
                        DM.frxReport.LoadFromFile(ProgramPath +
                            'Reports\ASUP\ShtatReportWorkersD3.fr3');
                        PrepareFR3;
                    end
                    else
                        LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatReportWorkers3.frf')
                end;

                if ReportTypeBox.ItemIndex = 2 then
                //Скорочений звіт з місячним фондом
                    LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatReportWorkers5.frf');

                if ReportTypeBox.ItemIndex = 3 then
                begin
                //Звіт з детальним місячним фондом
                    DetailedMFund := True;

                    DM.WorkTimeQuery.Close;
                    DM.WorkTimeQuery.ParamByName('WtYear').AsInteger := YearOf(CurTime.Date);
                    DM.WorkTimeQuery.Open;

                    while not DM.WorkTimeQuery.Eof do
                    begin
                        month := DM.WorkTimeQuery['WtMonth'];
                        DM.WorkTimeQuery.Next;
                    end;

                    LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatReportWorkers4.frf');
                end;
            end;
        {конец блока по рабочим}
        end
        else
            if ITRBox.Checked then
            begin
            {начало блока по ИТР}
                if Version = 1 then
                    LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatReportITR.frf')
                else
                begin //Version = 2
                    if ReportTypeBoxITR.ItemIndex = 0 then
                    //Детальний звіт (А4 ландшафт)
                        LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatReportITR2.frf');

                    if ReportTypeBoxITR.ItemIndex = 1 then
                    begin
                    //Скорочений звіт (А4 портрет)
                        if UseFR3 then
                        begin
                            DM.frxReport.LoadFromFile(ProgramPath +
                                'Reports\ASUP\ShtatReportITRD3.fr3');
                            PrepareFR3;
                        end
                        else
                            LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatReportITR3.frf');
                    end;

                    if ReportTypeBoxITR.ItemIndex = 2 then
                    //Скорочений звіт з місячним фондом
                        LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatReportITR5.frf');

                    if ReportTypeBoxITR.ItemIndex = 3 then
                    begin
                    //Звіт з детальним місячним фондом
                        DetailedMFund := True;

                        DM.WorkTimeQuery.Close;
                        DM.WorkTimeQuery.ParamByName('WtYear').AsInteger := YearOf(CurTime.Date);
                        DM.WorkTimeQuery.Open;

                        while not DM.WorkTimeQuery.Eof do
                        begin
                            month := DM.WorkTimeQuery['WtMonth'];
                            DM.WorkTimeQuery.Next;
                        end;

                        LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatReportITR4.frf');
                    end
                end
            {конец блока по ИТР}
            end
            else
                if PlanBox.Checked then
                    LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatPlanReport.frf')
                else
{		if not Test then}
                    LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatReport.frf')
{	else	LoadFromFile(ProgramPath + 'Reports\ASUP\ShtatReport2.frf');}
    end;
end;

procedure TfmShtatPrint2Params.ExportButtonClick(Sender: TObject);
var
    IsReportFr3: Boolean; //является ли экспортируемый отчет файлом fr3
begin
    PrepareReport;
    IsReportFr3 := False;

    {смотрим какие отчеты экспортируются, если fr3, то IsReportFr3 ставим в True}
    if (WorkersBox.Checked and (ReportTypeBox.ItemIndex = 1)) then
        IsReportFr3 := True;
    if (ITRBox.Checked and (ReportTypeBoxITR.ItemIndex = 1)) then
        IsReportFr3 := True;

    if (UseFR3 and IsReportFr3) then
        ExportReportTo(DM.frxReport)
    else ExportReportTo(DM.ShtatReport);
end;

procedure TfmShtatPrint2Params.OkButtonClick(Sender: TObject);
var
    IsReportFr3: Boolean; //является ли печатаемый отчет файлом fr3
begin
    PrepareReport;
    IsReportFr3 := False;

    {смотрим какие отчеты печатаются, если fr3, то IsReportFr3 ставим в True}
    if (WorkersBox.Checked and (ReportTypeBox.ItemIndex = 1)) then
        IsReportFr3 := True;
    if (ITRBox.Checked and (ReportTypeBoxITR.ItemIndex = 1)) then
        IsReportFr3 := True;

    if (UseFR3 and IsReportFr3) then
    //fr3 отчеты
        if DesignReport then
            DM.frxReport.DesignReport
        else
            DM.frxReport.ShowReport
    else //frf отчеты
        if DesignReport then
            DM.ShtatReport.DesignReport
        else
            DM.ShtatReport.ShowReport;
end;

procedure TfmShtatPrint2Params.WorkersBoxClick(Sender: TObject);
begin
    if (Version = 2) and WorkersBox.Checked then
    begin
        ReportTypeBox.Visible := True;
        ReportTypeLabel.Visible := True;
        ReportTypeLabel.Visible := True;

        //сбросим чекер по ИТР, чтоб наверняка
        ITRBox.Checked := False;
    end;

    if not WorkersBox.Checked then
    begin
        ReportTypeBox.Visible := False;
        ReportTypeBox.Visible := False;
        ReportTypeLabel.Visible := False;
    end;
end;

procedure TfmShtatPrint2Params.VacanciesBoxClick(Sender: TObject);
begin
{    CalcVacancies.Visible := VacanciesBox.Checked and (Version = 2);
    CalcVacLabel.Visible :=  VacanciesBox.Checked and (Version = 2);}
end;

procedure TfmShtatPrint2Params.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    qFAutoSaveIntoRegistry(Self, nil);
end;

procedure TfmShtatPrint2Params.PrepareFR3;
begin
    with DM.frxReport do
    begin
        Variables['RepDate'] := QuotedStr(DateToStr(CurTime.DateTime));
        if VacanciesBox.Checked then Variables['Vacanices'] := 1
        else Variables['Vacanices'] := 0;

        if PlanBox.Checked then
            Variables['Date_Beg'] := CurTime.Date;

        if Id_Department = DM.Consts_Query['Current_Department'] then
            Variables['Dept_Name'] := QuotedStr('')
        else
            if WorkersBox.Checked then
                Variables['Dept_Name'] := QuotedStr('підрозділу «' +
                    UpperCase(DepartmentEdit.Text) + '»')
            else
                if ITRBox.Checked then
                    Variables['Dept_Name'] := QuotedStr('підрозділу «' +
                        UpperCase(DepartmentEdit.Text) + '»')
                else
                    Variables['Dept_Name'] := QuotedStr(UpperCase(DepartmentEdit.Text));

        Variables['Firm_Name'] := QuotedStr(UpperCase(DM.Consts_Query['Firm_Name']));

        Variables['Date_Beg'] := QuotedStr(DateToStr(DM.Get_SR_Date['Date_Beg']));

        Variables['Chief_Post'] := QuotedStr(Chief_Post.Value);
        Variables['Chief_FIO'] := QuotedStr(Chief_FIO.Value);
        Variables['Kadr_Post'] := QuotedStr(Kadr_Post.Value);
        Variables['Kadr_FIO'] := QuotedStr(Kadr_FIO.Value);
        Variables['Exec_Post'] := QuotedStr(Exec_Post.Value);
        Variables['Exec_FIO'] := QuotedStr(Exec_FIO.Value);
        Variables['Version'] := Version;
        Variables['AllStavok'] := AllStavok;
        Variables['AllFund'] := AllFund;
    end;
end;

procedure TfmShtatPrint2Params.ITRBoxClick(Sender: TObject);
begin
    if (Version = 2) and ITRBox.Checked then
    begin
        ReportTypeBoxITR.Visible := True;
        Label1.Visible := True;
        Label1.Visible := True;

        //сбросим чекер по рабочим, чтоб наверняка
        WorkersBox.Checked := False;
    end;

    if not ITRBox.Checked then
    begin
        ReportTypeBoxITR.Visible := False;
        ReportTypeBoxITR.Visible := False;
        Label1.Visible := False;
    end;
end;

initialization
    RegisterClass(TfmShtatPrint2Params);

end.

