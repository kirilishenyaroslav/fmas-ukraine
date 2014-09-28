unit uApp32;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uSpravControl,
    DB, FIBDataSet, pFIBDataSet, uDateControl, pFIBDatabase, frxClass,
  frxDBSet, frxDesgn, frxExportPDF, frxExportRTF, frxExportXLS,
  frxExportHTML, frxExportTXT;

type
    TfmReportStavok32 = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ShtatDoc: TqFSpravControl;
        ReportData: TpFIBDataSet;
    Period_Beg: TqFDateControl;
    Period_End: TqFDateControl;
        Level: TqFSpravControl;
    frxReportData: TfrxDBDataset;
    LevelsSelect: TpFIBDataSet;
    LevelsSelectID_LEVEL: TFIBBCDField;
    LevelsSelectLEVEL_ORDER: TFIBIntegerField;
    LevelsSelectLEVEL_NAME: TFIBStringField;
    Report: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
        procedure ShtatDocOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure LevelOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
    procedure FormDestroy(Sender: TObject);
    public
        constructor Create(AOwner: TComponent; Transaction: TpFIBTransaction); reintroduce;
    end;

var
    fmReportStavok32: TfmReportStavok32;

implementation

{$R *.dfm}

uses uCommonSp, qFTools, uSelectForm, DateUtils;

constructor TfmReportStavok32.Create(AOwner: TComponent;
    Transaction: TpFIBTransaction);
begin
    inherited Create(AOwner);
    ReportData.Transaction := Transaction;
    LevelsSelect.Transaction := Transaction;

    Period_Beg.Value := EncodeDate(YearOf(Date), 1, 1);
    Period_End.Value := EncodeDate(YearOf(Date), 12, 31);
    qFAutoLoadFromRegistry(Self);
end;

procedure TfmReportStavok32.ShtatDocOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\ShtatDoc');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(ReportData.Transaction.DefaultDatabase.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_SR'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

procedure TfmReportStavok32.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmReportStavok32.OkButtonClick(Sender: TObject);
begin
    ReportData.Close;
    ReportData.ParamByName('Id_SR').AsInteger := ShtatDoc.Value;
    ReportData.ParamByName('Period_Beg').AsDate := Period_Beg.Value;
    ReportData.ParamByName('Period_End').AsDate := Period_End.Value;
    ReportData.ParamByName('Id_Level').AsInteger := Level.Value;
    ReportData.Open;

    Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\UP\UpShtatApp32.fr3');
    Report.ShowReport;
end;

procedure TfmReportStavok32.LevelOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if qSelect(LevelsSelect) then
        begin
            Value := LevelsSelect['Id_Level'];
            DisplayText := IntToStr(LevelsSelect['Level_Order']) + '. ' +
                LevelsSelect['Level_Name'];
        end;
end;

procedure TfmReportStavok32.FormDestroy(Sender: TObject);
begin
    qFAutoSaveIntoRegistry(Self);
end;

end.

