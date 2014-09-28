unit uShtatExecFIOParams;

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
    uCommonSp, uFormControl, frxExportXML;

type
    TfmShtatReportFIOParams = class(TForm)
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
        StyleRepository: TcxStyleRepository;
        stBackground: TcxStyle;
        stContent: TcxStyle;
        stContentEven: TcxStyle;
        stContentOdd: TcxStyle;
        stFilterBox: TcxStyle;
        stFooter: TcxStyle;
        stGroup: TcxStyle;
        stGroupByBox: TcxStyle;
        stHeader: TcxStyle;
        stInactive: TcxStyle;
        stIncSearch: TcxStyle;
        stIndicator: TcxStyle;
        stPreview: TcxStyle;
        stSelection: TcxStyle;
        stHotTrack: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        frxData: TfrxDBDataset;
        ReportData: TpFIBDataSet;
        Label1: TLabel;
        Level: TqFSpravControl;
        LevelsSelect: TpFIBDataSet;
        LevelsSelectID_LEVEL: TFIBBCDField;
        LevelsSelectLEVEL_ORDER: TFIBIntegerField;
        LevelsSelectLEVEL_NAME: TFIBStringField;
        SmetaGroups: TRxMemoryData;
        SmetaGroupsSource: TDataSource;
        SmetaGroupsId_Group: TIntegerField;
        SmetaGroupsGroup_Kod: TIntegerField;
        SmetaGroupsGroup_Title: TStringField;
        AddSmeta: TpFIBDataSet;
        WriteTransaction: TpFIBTransaction;
        GetIdSession: TpFIBDataSet;
        AddSmetQuery: TpFIBQuery;
        DLabel: TLabel;
    SR: TqFSpravControl;
        FilterPanel: TPanel;
    FormControl: TqFFormControl;
    Type_Post: TqFSpravControl;
    SelectTypePost: TpFIBDataSet;
    XMLExp: TfrxXMLExport;
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure LevelOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure AddButtonClick(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure FormKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SROpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
    procedure Type_PostOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    private
        sp: TSprav;
        Id_Session: Int64;
    public
        DesignReport: Boolean;

        constructor Create(AOwner: TComponent; Handle: Integer); reintroduce;
    end;

var
    fmShtatReportFIOParams: TfmShtatReportFIOParams;

implementation

{$R *.dfm}

uses NagScreenUnit, GlobalSPR, uSelectForm, qFTools;

procedure TfmShtatReportFIOParams.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

constructor TfmShtatReportFIOParams.Create(AOwner: TComponent; Handle: Integer);
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

procedure TfmShtatReportFIOParams.OkButtonClick(Sender: TObject);
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
        ReportData.ParamByName('Id_Session').AsInteger := Id_Session;
        ReportData.ParamByName('Filter_Id_Type_Post').AsVariant := Type_Post.Value;
        ReportData.ParamByName('Act_Date').AsDate := CurDate.Value;
        ReportData.ParamByName('Id_Level').AsInteger := Level.Value;
        ReportData.StartTransaction;
        ReportData.Open;

        NagScreen.Free;
        NagScreen := nil;

        Report.LoadFromFile('Reports\UP\UpShtatExecFIO.fr3');

        Report.Variables['Act_Date'] := QuotedStr(DateToStr(CurDate.Value));

        if DesignReport then Report.DesignReport
        else Report.ShowReport;

    finally
        if NagScreen <> nil then NagScreen.Free;
        if ReportData.Transaction.InTransaction then
            ReportData.Transaction.Rollback;
    end;
end;

procedure TfmShtatReportFIOParams.DepartmentOpenSprav(Sender: TObject;
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

procedure TfmShtatReportFIOParams.LevelOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if qSelect(LevelsSelect) then
    begin
        Value := LevelsSelect['Id_Level'];
        DisplayText := IntToStr(LevelsSelect['Level_Order']) + '. ' +
            LevelsSelect['Level_Name'];
    end;
end;

procedure TfmShtatReportFIOParams.AddButtonClick(Sender: TObject);
var
    sp: TSprav;
begin
       // создать справочник
    sp := GetSprav('UP\UpSmetaGroup');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['Period_Beg'] := CurDate.Value;
            FieldValues['Period_End'] := StrToDate('01.01.2150');
            Post;
        end;

                // показать справочник и проанализировать результат
        sp.Show;
        sp.Output.First;
        while not sp.Output.Eof do
        begin
            if not SmetaGroups.Active then SmetaGroups.Open;
            SmetaGroups.Append;
            SmetaGroups['Id_Group'] := sp.Output['Id_Group'];
            SmetaGroups['Group_Kod'] := sp.Output['Group_Kod'];
            SmetaGroups['Group_Title'] := sp.Output['Group_Title'];
            SmetaGroups.Post;

            sp.Output.Next;
        end;
        sp.Free;
    end;
end;

procedure TfmShtatReportFIOParams.FormDestroy(Sender: TObject);
begin
    qFAutoSaveIntoRegistry(Self);
    sp.Free;
end;

procedure TfmShtatReportFIOParams.FormCreate(Sender: TObject);
begin
    qFAutoLoadFromRegistry(Self);
    DesignReport := False;

end;

procedure TfmShtatReportFIOParams.DeleteButtonClick(Sender: TObject);
begin
    SmetaGroups.Delete;
end;

procedure TfmShtatReportFIOParams.FormKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    begin
        DesignReport := not DesignReport;
        if DesignReport then DLabel.Caption := 'Design'
        else DLabel.Caption := '';
    end;
end;

procedure TfmShtatReportFIOParams.SROpenSprav(Sender: TObject;
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

procedure TfmShtatReportFIOParams.Type_PostOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if qSelect(SelectTypePost) then
    begin
        Value := SelectTypePost['Id_Type_Post'];
        DisplayText := SelectTypePost['Name_Type_Post'];
    end;
end;

end.

