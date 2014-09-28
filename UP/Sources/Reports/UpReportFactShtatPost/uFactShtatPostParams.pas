unit uFactShtatPostParams;

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
    uCommonSp, uFormControl, frxDesgn, uBoolControl, frxExportXML;

type
    TfmFactShtatReport2 = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        CurDate: TqFDateControl;
        DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        frxXLSExport1: TfrxXLSExport;
        frxHTMLExport1: TfrxHTMLExport;
        frxPDFExport1: TfrxPDFExport;
        frxRTFExport1: TfrxRTFExport;
        Department: TqFSpravControl;
        frxData: TfrxDBDataset;
        ReportData: TpFIBDataSet;
        Label1: TLabel;
        Level: TqFSpravControl;
        WriteTransaction: TpFIBTransaction;
        GetIdSession: TpFIBDataSet;
        DLabel: TLabel;
        LevelsSelect: TpFIBDataSet;
        LevelsSelectID_LEVEL: TFIBBCDField;
        LevelsSelectLEVEL_ORDER: TFIBIntegerField;
        LevelsSelectLEVEL_NAME: TFIBStringField;
        FilterPanel: TPanel;
        SR: TqFSpravControl;
        SelectTypePost: TpFIBDataSet;
        SelectTypePostID_TYPE_POST: TFIBIntegerField;
        SelectTypePostNAME_TYPE_POST: TFIBStringField;
        Type_Post: TqFSpravControl;
        FormControl: TqFFormControl;
        frxDesigner1: TfrxDesigner;
        UseColumn5: TqFBoolControl;
        ShowRaise: TqFBoolControl;
        ShowOnlyOverflow: TqFBoolControl;
        PostTotals: TqFBoolControl;
        DepartmentTotals: TqFBoolControl;
        SmetaTotals: TqFBoolControl;
    XMLExp: TfrxXMLExport;
    Report: TfrxReport;
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
        procedure SROpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure Type_PostOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
    private
        sp: TSprav;
        Id_Session: Int64;
    public
        DesignReport: Boolean;

        constructor Create(AOwner: TComponent; Handle: Integer); reintroduce;
    end;

var
    fmFactShtatReport2: TfmFactShtatReport2;

implementation

{$R *.dfm}

uses NagScreenUnit, GlobalSPR, uSelectForm, qFTools;

procedure TfmFactShtatReport2.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

constructor TfmFactShtatReport2.Create(AOwner: TComponent; Handle: Integer);
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

procedure TfmFactShtatReport2.OkButtonClick(Sender: TObject);
var
    NagScreen: TNagScreen;
begin
    if not FormControl.Check then Exit;

    try
        NagScreen := TNagScreen.Create(Application.MainForm);
        NagScreen.Show;
        NagScreen.SetStatusText('Отримуються дані для звіту...');

        ReportData.Close;
        ReportData.ParamByName('Id_SR').AsInteger := SR.Value;
        ReportData.ParamByName('Filter_Id_Department').AsInteger := Department.Value;
        ReportData.ParamByName('Id_Sm_Session').AsInteger := Id_Session;
        ReportData.ParamByName('Act_Date').AsDate := CurDate.Value;
        ReportData.ParamByName('Filter_Id_Type_Post').AsVariant := Type_Post.Value;
        ReportData.ParamByName('Id_Level').AsInteger := Level.Value;
        if ShowRaise.Value then ReportData.ParamByName('Show_Raise').AsInteger := 1
        else ReportData.ParamByName('Show_Raise').AsInteger := 0;
        if ShowOnlyOverflow.Value then ReportData.ParamByName('Show_Only_Overflow').AsInteger := 1
        else ReportData.ParamByName('Show_Only_Overflow').AsInteger := 0;
        ReportData.StartTransaction;
        ReportData.Open;

        NagScreen.Free;
        NagScreen := nil;

        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\UP\UpReportShtatExecPost.fr3');

        Report.Variables['UseColumn5'] := Coalesce(UseColumn5.Value, False);
        Report.Variables['Act_Date'] := QuotedStr(DateToStr(CurDate.Value));
        Report.Variables['PostTotals'] := Coalesce(PostTotals.Value, False);
        Report.Variables['DepartmentTotals'] := Coalesce(DepartmentTotals.Value, False);
        Report.Variables['SmetaTotals'] := Coalesce(SmetaTotals.Value, False);

        if DesignReport then Report.DesignReport
        else Report.ShowReport;

    finally
        if NagScreen <> nil then NagScreen.Free;
        if ReportData.Transaction.InTransaction then
            ReportData.Transaction.Rollback;
    end;
end;

procedure TfmFactShtatReport2.DepartmentOpenSprav(Sender: TObject;
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

procedure TfmFactShtatReport2.LevelOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if qSelect(LevelsSelect) then
    begin
        Value := LevelsSelect['Id_Level'];
        DisplayText := IntToStr(LevelsSelect['Level_Order']) + '. ' +
            LevelsSelect['Level_Name'];
    end;
end;

procedure TfmFactShtatReport2.FormDestroy(Sender: TObject);
begin
    qFAutoSaveIntoRegistry(Self);
    sp.Free;
end;

procedure TfmFactShtatReport2.FormCreate(Sender: TObject);
begin
    qFAutoLoadFromRegistry(Self);
    DesignReport := False;
    ReportData.Close;
    ReportData.Sqls.SelectSql.Text := 'SELECT distinct * FROM UP_SHTAT_REPORT_EXEC_PEOPLE(:Id_SR, :Filter_Id_Department, :Id_Sm_Session, '+
':Act_Date, :Filter_Id_Type_Post, :Id_Level, :Show_Raise, :Show_Only_Overflow)'+
' Order By Id_smet, id_type_post, id_department, id_post_salary, kol_stavok_people desc' ;
end;

procedure TfmFactShtatReport2.FormKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    begin
        DesignReport := not DesignReport;
        if DesignReport then DLabel.Caption := 'Design'
        else DLabel.Caption := '';
    end;
end;

procedure TfmFactShtatReport2.SROpenSprav(Sender: TObject;
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

        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_SR'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

procedure TfmFactShtatReport2.Type_PostOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if qSelect(SelectTypePost) then
    begin
        Value := SelectTypePost['Id_Type_Post'];
        DisplayText := SelectTypePost['Name_Type_Post'];
    end;
end;

end.

