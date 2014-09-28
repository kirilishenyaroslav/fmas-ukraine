
{ -$Id: ShtatPrint.pas,v 1.13 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                Модуль "Печать отчета по штатному расписанию"                 }
{             Выбор параметров и печать отчета по штатному расписанию          }
{                                                  ответственный: Олег Волков  }

unit ShtatPrint;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, FR_Desgn, FR_DSet, FR_DBSet, FR_Class, Db,
    IBCustomDataSet, IBQuery, PersonalCommon, ComCtrls, SpCommon,
    DepartmentsViewUnit, SpComboBox, DateUtils, frxClass, frxDBSet, Spin;

type
    TShtatPrintForm = class(TReportForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ReportQuery: TIBQuery;
        ShtatReport: TfrReport;
        ShtatDataset: TfrDBDataSet;
        Label1: TLabel;
        NestUpDown: TUpDown;
        NestEdit: TEdit;
        Label2: TLabel;
        CurTime: TDateTimePicker;
        VacanciesBox: TCheckBox;
        Label3: TLabel;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        DeptQuery: TIBQuery;
        WorkersBox: TCheckBox;
        PlanBox: TCheckBox;
        ExportButton: TBitBtn;
        SRLabel1: TLabel;
        SRBox: TSpComboBox;
        Get_SR_Date: TIBQuery;
        ReportTypeBox: TComboBox;
        ShtatReport3: TfrxReport;
        frxDBDataset1: TfrxDBDataset;
        Label4: TLabel;
        SizeEdit: TSpinEdit;
        SignersQuery: TIBQuery;
        TopSignersQuery: TIBQuery;
        TopSigners: TfrxDBDataset;
        Signers: TfrxDBDataset;
        procedure NestUpDownChangingEx(Sender: TObject;
            var AllowChange: Boolean; NewValue: Smallint;
            Direction: TUpDownDirection);
        procedure FormCreate(Sender: TObject);
        procedure DepartmentButtonClick(Sender: TObject);
        procedure SetDept(dep: Integer);
        procedure ExportButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure WorkersBoxClick(Sender: TObject);
    private
        Id_Department: Integer;
        Id_SR: Integer;

        DetailedMFund: Boolean;

        procedure PrepareReport;
    public
        procedure SetSR(Id_SR: Integer);
        procedure Prepare(TheDate, Date_Beg, Date_End: TDate); override;
        property Department: Integer read Id_Department write SetDept;
    end;

var
    ShtatPrintForm: TShtatPrintForm;

implementation

{$R *.DFM}

uses qFTools, uExportReport, Math;

procedure TShtatPrintForm.SetSR(Id_SR: Integer);
begin
    Self.Id_SR := Id_SR;
    SRBox.Prepare(Id_SR);
end;

procedure TShtatPrintForm.Prepare(TheDate, Date_Beg, Date_End: TDate);
begin
    CurTime.DateTime := TheDate;
    CurTime.Repaint;
end;

procedure TShtatPrintForm.SetDept(dep: Integer);
begin
    Id_Department := dep;
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


procedure TShtatPrintForm.NestUpDownChangingEx(Sender: TObject;
    var AllowChange: Boolean; NewValue: Smallint;
    Direction: TUpDownDirection);
begin
    if (NewValue > NestUpDown.Max) or (NewValue < NestUpDown.Min) then
        AllowChange := False
    else
        if NewValue = NestUpDown.Max then NestEdit.Text := 'нема'
        else NestEdit.Text := IntToStr(NewValue);
end;

procedure TShtatPrintForm.FormCreate(Sender: TObject);
var
    cur_dep: Integer;
begin
    ReportQuery.Transaction := PersonalCommon.ReadTransaction;
    DeptQuery.Transaction := PersonalCommon.ReadTransaction;
    SignersQuery.Transaction := PersonalCommon.ReadTransaction;
    TopSignersQuery.Transaction := PersonalCommon.ReadTransaction;
    Get_SR_Date.Transaction := ReadTransaction;
    CurTime.Date := Date;

    cur_dep := Consts_Query['Local_Department'];
    DeptQuery.Params.ParamValues['Root'] := cur_dep;

    if Id_SR <= 0 then Id_SR := 1;

    if Id_Department = 0 then Id_Department := cur_dep;
    if (Id_Department = -1) and (cur_dep <> -1) then
        Id_Department := cur_dep;

    SetDept(Id_Department);
end;

procedure TShtatPrintForm.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Self);
    form.Prepare(True, CurTime.Date);
    form.CanSelectRoot := True;
    if form.ShowModal = mrOk then
        with form do
        begin
            Id_Department := Selected_Id;
            if Id_Department = -1 then
                DepartmentEdit.Text := Consts_Query['Firm_Name']
            else DepartmentEdit.Text := ResultQuery['Name_Full'];
        end;
    form.Free;
end;

procedure TShtatPrintForm.PrepareReport;
var
    ReportFile: string;
    AllStavok, AllFund: Double;
    Date_Beg: TDate;
    Vacancies: Integer;
    MaxNest: Integer;
    RepDate: TDate;
    Chief_FIO, Chief_Post, Kadr_FIO, Kadr_Post: string;
    Dept_Name: string;
    Firm_Name: string;
begin
        // понять, какую версию отчета подгрузить
    if WorkersBox.Checked then
        if PersonalCommon.Version = 1 then ReportFile := 'ShtatReportWorkers.fr3'
        else
            if ReportTypeBox.ItemIndex = 0 then ReportFile := 'ShtatReportWorkers2.fr3'
            else
                if ReportTypeBox.ItemIndex = 1 then ReportFile := 'ShtatReportWorkers3.fr3'
                else ReportFile := 'ShtatReportWorkers4.fr3'
            else
                if PlanBox.Checked then ReportFile := 'ShtatPlanReport.fr3'
                else ReportFile := 'ShtatReport.fr3';

                ShtatReport3.LoadFromFile(ProgramPath + 'Reports\ASUP\' + ReportFile);

        // понять, какой SQL использовать
                if WorkersBox.Checked then
                    if ReportTypeBox.ItemIndex = 2 then
                        ReportQuery.SQL.Text :=
                            'SELECT * FROM ShtatRas_Report_Workers_MFund(:Id_Department,1,:MaxNest'
                            + ' ,:Cur_Time,:Vacancies, :Id_SR)'
                    else
                        ReportQuery.SQL.Text :=
                            'SELECT * FROM ShtatRas_Report_Workers(:Id_Department,1,:MaxNest'
                            + ' ,:Cur_Time,:Vacancies, :Id_SR)'
                else
                    if PlanBox.Checked then
                        ReportQuery.SQL.Text :=
                            'SELECT * FROM ShtatRas_Plan_Report(:Id_Department,1,:MaxNest'
                            + ' ,:Cur_Time, :Id_SR)'
                    else
                        ReportQuery.SQL.Text :=
                            'SELECT * FROM ShtatRas_Report(:Id_Department,1,:MaxNest'
                            + ' ,:Cur_Time,:Vacancies, :Id_SR)';


        // получить дату начала штатного
                Id_SR := SRBox.GetId;

                Get_SR_Date.Close;
                Get_SR_Date.Params.ParamValues['Id_SR'] := Id_SR;
                Get_SR_Date.Open;
                Date_Beg := Get_SR_Date['Date_Beg'];

        // установить нужные параметры
                if WorkersBox.Checked and (ReportTypeBox.ItemIndex > 1) then
                    DetailedMFund := True;

                if VacanciesBox.Checked then Vacancies := 1
                else Vacancies := 0;

                if NestUpDown.Position = NestUpDown.Max then MaxNest := -1
                else MaxNest := NestUpDown.Position;

                RepDate := CurTime.DateTime;

                if Id_Department = Consts_Query['Current_Department'] then Dept_Name := ''
                else
                    if WorkersBox.Checked then
                        Dept_Name := 'підрозділу «' + UpperCase(DepartmentEdit.Text) + '»'
                    else Dept_Name := UpperCase(DepartmentEdit.Text);

                Firm_Name := UpperCase(Consts_Query['Firm_Name']);

        // ...в запросе
                with ReportQuery.Params do
                begin
                    ParamValues['Id_SR'] := Id_SR;
                    ParamValues['Id_Department'] := Id_Department;
                    ParamValues['MaxNest'] := MaxNest;
                    ParamValues['Cur_Time'] := CurTime.DateTime;
                    ParamValues['Vacancies'] := Vacancies;
                end;

        // получить подписывающих
                if WorkersBox.Checked then
                begin
                    TopSignersQuery.Close;
                    TopSignersQuery.ParamByName('Id_Shtat_Prop').AsInteger := 512;
                    TopSignersQuery.ParamByName('Cur_Date').AsDate := CurTime.Date;
                    TopSignersQuery.Open;

                    if not TopSignersQuery.IsEmpty then
                    begin
                        Chief_Post := TopSignersQuery['Post_Name'];
                        Chief_FIO := TopSignersQuery['FIO'];
                    end
                    else
                    begin
                        Chief_Post := '';
                        Chief_FIO := '';
                    end;

                    SignersQuery.Close;
                    SignersQuery.ParamByName('Id_Shtat_Prop').AsInteger := 712;
                    SignersQuery.ParamByName('Cur_Date').AsDate := CurTime.Date;
                    SignersQuery.Open;

                    if not SignersQuery.IsEmpty then
                    begin
                        Kadr_Post := SignersQuery['Post_Name'];
                        Kadr_FIO := SignersQuery['FIO'];
                    end
                    else
                    begin
                        Kadr_Post := '';
                        Kadr_FIO := '';
                    end
                end
                else
                begin
                    TopSignersQuery.Close;
                    TopSignersQuery.ParamByName('Id_Shtat_Prop').AsInteger := 412;
                    TopSignersQuery.ParamByName('Cur_Date').AsDate := CurTime.Date;
                    TopSignersQuery.Open;

                    if not TopSignersQuery.IsEmpty then
                    begin
                        Chief_Post := TopSignersQuery['Post_Name'];
                        Chief_FIO := TopSignersQuery['FIO'];
                    end
                    else
                    begin
                        Chief_Post := '';
                        Chief_FIO := '';
                    end;

                    SignersQuery.Close;
                    SignersQuery.ParamByName('Id_Shtat_Prop').AsInteger := 612;
                    SignersQuery.ParamByName('Cur_Date').AsDate := CurTime.Date;
                    SignersQuery.Open;

                    if not SignersQuery.IsEmpty then
                    begin
                        Kadr_Post := SignersQuery['Post_Name'];
                        Kadr_FIO := SignersQuery['FIO'];
                    end
                    else
                    begin
                        Kadr_Post := '';
                        Kadr_FIO := '';
                    end
                end;

            // подсчитать итоги вверху страницы (ставки и фонд)
                AlLStavok := 0;
                AllFund := 0;

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
                                if (Version = 1) and (ReportQuery['Id_Post'] <> 3) then
                                    AllFund := AllFund + SimpleRoundTo(ReportQuery['Oklad'] * ReportQuery['Kol_Stavok'], 0);
                        end;
                        ReportQuery.Next;
                    end;
                    ReportQuery.First;
                end;

        // передать параметры в отчет
                with ShtatReport3 do
                begin
                    Variables['Firm_Name'] := QuotedStr(Firm_Name);
                    Variables['Dept_Name'] := QuotedStr(Dept_Name);

                    Variables['RepDate'] := QuotedStr(DateToStr(CurTime.DateTime));
                    Variables['Date_Beg'] := QuotedStr(DateToStr(Date_Beg));

                    Variables['Vacanices'] := QuotedStr(IntToStr(Vacancies));

                    Variables['Version'] := QuotedStr(IntToStr(PersonalCommon.Version));
                    Variables['AllStavok'] := QuotedStr(FloatToStr(AllStavok));
                    Variables['AllFund'] := QuotedStr(FloatToStr(AllFund));

                    Variables['FONT_SIZE'] := SizeEdit.Value;

                    Variables['Chief_Post'] := QuotedStr(Chief_Post);
                    Variables['Chief_FIO'] := QuotedStr(Chief_FIO);
                    Variables['Kadr_Post'] := QuotedStr(Kadr_Post);
                    Variables['Kadr_FIO'] := QuotedStr(Kadr_FIO);
                end;
end;

procedure TShtatPrintForm.ExportButtonClick(Sender: TObject);
begin
    PrepareReport;
    ExportReportTo(ShtatReport3);
end;

procedure TShtatPrintForm.OkButtonClick(Sender: TObject);
begin
    PrepareReport;
    if sDesignReport then ShtatReport3.DesignReport
    else ShtatReport3.ShowReport;
end;

procedure TShtatPrintForm.WorkersBoxClick(Sender: TObject);
begin
    if (Version = 2) and WorkersBox.Checked then
        ReportTypeBox.Visible := True;

    if not WorkersBox.Checked then
    begin
        ReportTypeBox.Visible := False;
        SizeEdit.Value := 9;
    end
    else SizeEdit.Value := 10;
end;

initialization
    RegisterClass(TShtatPrintForm);

end.
