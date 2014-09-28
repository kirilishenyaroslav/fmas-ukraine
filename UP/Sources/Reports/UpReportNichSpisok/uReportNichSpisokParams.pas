unit uReportNichSpisokParams;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uDateControl, StdCtrls, Buttons,
    IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, frxClass,
    frxDBSet, frxExportRTF, frxExportPDF, frxExportHTML, frxExportXLS,
    uSpravControl, RxMemDS, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxControls,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, cxClasses, ExtCtrls, FIBQuery, pFIBQuery,
    uCommonSp;

type
    TfmReportNichSpisokForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        CurDate: TqFDateControl;
        DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        Report: TfrxReport;
        frxXLSExport1: TfrxXLSExport;
        frxHTMLExport1: TfrxHTMLExport;
        frxPDFExport1: TfrxPDFExport;
        frxRTFExport1: TfrxRTFExport;
        Department: TqFSpravControl;
        frxData: TfrxDBDataset;
        ReportData: TpFIBDataSet;
        Label1: TLabel;
        Level: TqFSpravControl;
        LevelsSelect: TpFIBDataSet;
        LevelsSelectID_LEVEL: TFIBBCDField;
        LevelsSelectLEVEL_ORDER: TFIBIntegerField;
        LevelsSelectLEVEL_NAME: TFIBStringField;
        WriteTransaction: TpFIBTransaction;
    DLabel: TLabel;
    FilterPanel: TPanel;
    GetIdSession: TpFIBDataSet;
    FirmName: TpFIBDataSet;
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure LevelOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormDestroy(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
        sp: TSprav;
        Id_Session: Int64;
    public
        DesignReport: Boolean;

        constructor Create(AOwner: TComponent; Handle: Integer); reintroduce;
    end;

var
    fmReportNichSpisokForm: TfmReportNichSpisokForm;

implementation

{$R *.dfm}

uses NagScreenUnit, uSelectForm, qFTools;

procedure TfmReportNichSpisokForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

constructor TfmReportNichSpisokForm.Create(AOwner: TComponent; Handle: Integer);
var
    frame: TFrame;

begin
    inherited Create(AOwner);
    DB.Handle := TISC_DB_HANDLE(Handle);
    CurDate.Value := Date;

    GetIdSession.Transaction.StartTransaction;
    GetIdSession.Open;
    Id_Session := GetIdSession['Ret_Value'];

    sp := GetSprav('UP\UpSmetaFilter');
    with sp.Input do
    begin
        Append;
        FieldValues['DBHandle'] := Handle;
        FieldValues['DB_Id_Session'] := Id_Session;
        Post;
    end;
    if sp <> nil then
    begin
        frame := sp.GetFrame;

        if not (frame = nil) then
        begin
            frame.Parent := FilterPanel;
            frame.Align := alClient;
        end;
    end;
end;

procedure TfmReportNichSpisokForm.OkButtonClick(Sender: TObject);
var
    NagScreen: TNagScreen;
begin
    if not qFCheckAll(Self) then Exit;

    NagScreen := TNagScreen.Create(Application.MainForm);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримуються дані для звіту...');

    FirmName.Close;
    FirmName.Open;

    ReportData.Close;
    ReportData.ParamByName('Id_Session').AsInt64 := Id_Session;
    ReportData.ParamByName('Filter_Id_Department').AsInt64 := Department.Value;
    ReportData.ParamByName('Act_Date').AsDate := CurDate.Value;
    ReportData.ParamByName('Id_Level').AsInt64 := Level.Value;
    ReportData.Open;

    NagScreen.Free;

    Report.LoadFromFile('Reports\UP\UpReportNichSpisok.fr3');

    Report.Variables['FirmName'] := QuotedStr(FirmName['Name']);
    if DesignReport then Report.DesignReport
    else Report.ShowReport;
end;

procedure TfmReportNichSpisokForm.DepartmentOpenSprav(Sender: TObject;
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
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['Actual_Date'] := CurDate.Value;
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

procedure TfmReportNichSpisokForm.LevelOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if qSelect(LevelsSelect) then
    begin
        Value := LevelsSelect['Id_Level'];
        DisplayText := IntToStr(LevelsSelect['Level_Order']) + '. ' +
            LevelsSelect['Level_Name'];
    end;
end;

procedure TfmReportNichSpisokForm.FormDestroy(Sender: TObject);
begin
    qFAutoSaveIntoRegistry(Self);
end;

procedure TfmReportNichSpisokForm.FormCreate(Sender: TObject);
begin
    qFAutoLoadFromRegistry(Self);
    DesignReport := False;
end;

procedure TfmReportNichSpisokForm.FormKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    begin
        DesignReport := not DesignReport;
        if DesignReport then DLabel.Caption := 'Design'
        else DLabel.Caption := '';
    end;
end;

end.

