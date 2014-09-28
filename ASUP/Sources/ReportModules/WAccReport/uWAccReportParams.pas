unit uWAccReportParams;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uWAccDM, uCharControl, uIntControl, uFControl, uLabeledFControl,
    uSpravControl, StdCtrls, Buttons, uCommonSp;

type
    TfmWAccReportParams = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Department: TqFSpravControl;
        PCard: TqFSpravControl;
        From_Year: TqFIntControl;
        From_Month: TqFIntControl;
        To_Year: TqFIntControl;
        To_Month: TqFIntControl;
        Label1: TLabel;
        Label2: TLabel;
        procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PCardOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
        DM: TdmWAccReport;
        DesignReport: Boolean;
    public
        constructor Create(AOwner: TComponent; DM: TdmWAccReport; DesignReport: Boolean);
            reintroduce;
    end;

var
    fmWAccReportParams: TfmWAccReportParams;

implementation

uses DateUtils, qFTools;

{$R *.dfm}

constructor TfmWAccReportParams.Create(AOwner: TComponent; DM: TdmWAccReport;
    DesignReport: Boolean);
begin
    inherited Create(AOwner);

    Self.DM := DM;
    Self.DesignReport := DesignReport;

    DM.AsupParamsDS.Close;
    DM.AsupParamsDS.Open;

    try
        qFAutoLoadFromRegistry(Self);
    except
    end;

    if VarIsNull(Department.Value) then
    begin
        Department.Value := DM.AsupParamsDS['Local_Department'];
        Department.DisplayText := DM.AsupParamsDS['Local_Department_Name'];
    end;

    if VarIsNull(From_Year.Value) then From_Year.Value := YearOf(Date);
    if VarIsNull(From_Month.Value) then From_Month.Value := MonthOf(Date);
    if VarIsNull(To_Year.Value) then To_Year.Value := YearOf(Date);
    if VarIsNull(To_Month.Value) then To_Month.Value := MonthOf(Date);
end;

procedure TfmWAccReportParams.DepartmentOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
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
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

procedure TfmWAccReportParams.PCardOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    // создать справочник
    sp := GetSprav('asup\PCardsList');
    if sp <> nil then
    begin

        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DM.Database.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := True;
            FieldValues['CanRemoveFilter'] := True;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];
        end;
        sp.Free;
    end;
end;

procedure TfmWAccReportParams.OkButtonClick(Sender: TObject);
begin
    with DM.ReportDS do
    begin
        Close;
        ParamByName('Filter_Department').AsVariant := Department.Value;
        ParamByName('Filter_PCard').AsVariant := PCard.Value;
        ParamByName('From_Year').AsInteger := From_Year.Value;
        ParamByName('From_Month').AsInteger := From_Month.Value;
        ParamByName('To_Year').AsInteger := To_Year.Value;
        ParamByName('To_Month').AsInteger := To_Month.Value;
        Open;

        with DM.TotalsDS do
        begin
            Close;
            ParamByName('Filter_Department').AsVariant := Department.Value;
            ParamByName('Filter_PCard').AsVariant := PCard.Value;
            ParamByName('From_Year').AsInteger := From_Year.Value;
            ParamByName('From_Month').AsInteger := From_Month.Value;
            ParamByName('To_Year').AsInteger := To_Year.Value;
            ParamByName('To_Month').AsInteger := To_Month.Value;
            Open;
        end;


        DM.frxReport.LoadFromFile('Reports\Asup\AsupWAccReport.fr3');

        if VarIsNull(PCard.Value) then
          DM.frxReport.Variables['Show_Totals'] := 1
        else DM.frxReport.Variables['Show_Totals'] := 0;
        DM.frxReport.Variables['Filter_Department'] := Department.Value;
        DM.frxReport.Variables['Filter_Department_Name'] := QuotedStr(Department.DisplayText);
        DM.frxReport.Variables['Filter_PCard'] := PCard.Value;
        DM.frxReport.Variables['Filter_PCard_Name'] := QuotedStr(PCard.DisplayText);
        DM.frxReport.Variables['From_Year'] := From_Year.Value;
        DM.frxReport.Variables['From_Month'] := From_Month.Value;
        DM.frxReport.Variables['To_Year'] := From_Year.Value;
        DM.frxReport.Variables['To_Month'] := From_Month.Value;

                DM.frxReport.Variables['Id_PCard'] := PCard.Value;
        DM.frxReport.Variables['Id_PCard'] := PCard.Value;

        if DesignReport then
            DM.frxReport.DesignReport
        else
            DM.frxReport.ShowReport;
    end;
end;

procedure TfmWAccReportParams.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmWAccReportParams.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    try
        qFAutoSaveIntoRegistry(Self);
    except
    end;
end;

end.

