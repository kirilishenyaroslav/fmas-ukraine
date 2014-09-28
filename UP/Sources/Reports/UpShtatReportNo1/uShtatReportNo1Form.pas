unit uShtatReportNo1Form;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uDateControl, StdCtrls, Buttons,
    uSpravControl, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
    frxClass, frxDBSet, frxExportPDF, frxExportRTF, frxExportXLS,
    frxExportHTML, frxDesgn;

type
    TfmShtatReportNo1 = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        From_Date: TqFDateControl;
        ID_SR: TqFSpravControl;
        Id_Level: TqFSpravControl;
        DB: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        DefTransaction: TpFIBTransaction;
        LevelsSelect: TpFIBDataSet;
        LevelsSelectID_LEVEL: TFIBBCDField;
        LevelsSelectLEVEL_ORDER: TFIBIntegerField;
        LevelsSelectLEVEL_NAME: TFIBStringField;
        ReportDS: TpFIBDataSet;
        frxDBDataset1: TfrxDBDataset;
        frxXLSExport1: TfrxXLSExport;
        frxRTFExport1: TfrxRTFExport;
        frxPDFExport1: TfrxPDFExport;
        frxHTMLExport1: TfrxHTMLExport;
        Smeta: TqFSpravControl;
    frxReport: TfrxReport;
    frxDesigner1: TfrxDesigner;
        procedure Id_LevelOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure ID_SROpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormKeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure OkButtonClick(Sender: TObject);
        procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
    procedure FormCreate(Sender: TObject);
    procedure ID_SRKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    private
        DesignReport: Boolean;
    public
    end;

var
    fmShtatReportNo1: TfmShtatReportNo1;

implementation

{$R *.dfm}

uses uSelectForm, qFTools, uCommonSp, GlobalSPR;

procedure TfmShtatReportNo1.Id_LevelOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if qSelect(LevelsSelect) then
    begin
        Value := LevelsSelect['Id_Level'];
        DisplayText := IntToStr(LevelsSelect['Level_Order']) + '. ' +
            LevelsSelect['Level_Name'];
    end;
end;

procedure TfmShtatReportNo1.ID_SROpenSprav(Sender: TObject;
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
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;
            Post;
        end;

                // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_SR'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

procedure TfmShtatReportNo1.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    qfAutoSaveIntoRegistry(Self);
end;

procedure TfmShtatReportNo1.FormKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_F12 then
    begin
        ShowMessage('DesignReport enabled');
        DesignReport := True;
    end;
end;

procedure TfmShtatReportNo1.OkButtonClick(Sender: TObject);
begin
    ReportDS.Close;
    ReportDS.ParamByName('Id_SR').AsInteger := ID_SR.Value;
    ReportDS.ParamByName('Id_Level').AsInteger := ID_Level.Value;
    ReportDS.ParamByName('From_Date').AsDate := From_Date.Value;
    ReportDS.ParamByName('Filter_Smeta').AsVariant := Smeta.Value;
    ReportDS.Open;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\UP\ShtatReportNo1.fr3');
    if DesignReport then frxReport.DesignReport
    else frxReport.ShowReport;
end;

procedure TfmShtatReportNo1.SmetaOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, DB.Handle, Date, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TfmShtatReportNo1.FormCreate(Sender: TObject);
begin
    qfAutoLoadFromRegistry(Self);
end;

procedure TfmShtatReportNo1.ID_SRKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_F12 then DesignReport := True;
end;

end.

