unit uShtatReport2Params;

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
    uCommonSp, CheckLst, uCharControl, frxDesgn, frxExportXML;

type
    TfmShtatReport2Params = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        CurDate: TqFDateControl;
        DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        Report: TfrxReport;
        frxXLSExport1: TfrxXLSExport;
        frxHTMLExport1: TfrxHTMLExport;
    PDFExp: TfrxPDFExport;
        frxRTFExport1: TfrxRTFExport;
        Department: TqFSpravControl;
        frxData: TfrxDBDataset;
        ReportData: TpFIBDataSet;
        WriteTransaction: TpFIBTransaction;
        DLabel: TLabel;
        GetIdSession: TpFIBDataSet;
        SR: TqFSpravControl;
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
        TypePostListBox: TCheckListBox;
        Label1: TLabel;
        TypePostSelect: TpFIBDataSet;
        UnMarkAll: TButton;
        MarkAllButton: TButton;
        TPQuery: TpFIBQuery;
        RektorFIO: TqFCharControl;
        SignPost: TqFCharControl;
        Label2: TLabel;
        SignFIO: TqFCharControl;
        frxDesigner1: TfrxDesigner;

    ConstsQuery: TpFIBDataSet;
    XMLExp: TfrxXMLExport;
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormDestroy(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SROpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure UnMarkAllClick(Sender: TObject);
        procedure MarkAllButtonClick(Sender: TObject);
    public
        DesignReport: Boolean;

        constructor Create(AOwner: TComponent; Handle: Integer); reintroduce;
    end;

var
    fmShtatReport2Params: TfmShtatReport2Params;

implementation

{$R *.dfm}

uses NagScreenUnit, uSelectForm, qFTools;

procedure TfmShtatReport2Params.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

constructor TfmShtatReport2Params.Create(AOwner: TComponent; Handle: Integer);
var
    i: Integer;
begin
    inherited Create(AOwner);
    DB.Handle := TISC_DB_HANDLE(Handle);
    CurDate.Value := Date;

    TypePostSelect.Close;
    TypePostSelect.Open;
    TypePostSelect.First;
    while not TypePostSelect.Eof do
    begin
        TypePostListBox.AddItem(TypePostSelect['Name_Type_Post'], nil);
        TypePostSelect.Next;
    end;
    for i := 0 to TypePostListBox.Items.Count - 1 do
        TypePostListBox.Checked[i] := True;
end;

procedure TfmShtatReport2Params.OkButtonClick(Sender: TObject);
var
    NagScreen: TNagScreen;
    i: Integer;
begin
    NagScreen := TNagScreen.Create(Application.MainForm);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримуються дані для звіту...');

    TPQuery.Transaction.StartTransaction;
    TPQuery.SQL.Text := 'DELETE FROM PUB_SP_TYPE_POST_TEMP';
    TPQuery.ExecQuery;

    for i := 0 to TypePostListBox.Items.Count - 1 do
        if TypePostListBox.Checked[i] then
        begin
            TypePostSelect.First;
            TypePostSelect.Locate('Name_Type_Post', TypePostListBox.Items[i], []);
            TPQuery.SQL.Text := 'INSERT INTO Pub_Sp_Type_Post_Temp(Id_Type_Post) VALUES(' +
                IntToStr(TypePostSelect['Id_Type_Post']) + ')';
            TPQuery.ExecQuery;
        end;

    TPQuery.Transaction.Commit;

    ReportData.Close;
    ReportData.ParamByName('Root_Department').AsInt64 := Department.Value;
    ReportData.ParamByName('Id_SR').AsInt64 := SR.Value;
    ReportData.ParamByName('Act_Date').AsDate := CurDate.Value;
    ReportData.Open;

    NagScreen.Free;

    ConstsQuery.Close;
    ConstsQuery.Open;

    Report.Clear;
    Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Up\UpShtatReport2.fr3', true);    {дети, прописывайте полностью путь к отчету}

    Report.Variables['Rektor_FIO'] := QuotedStr(RektorFIO.Value);
    Report.Variables['Sign_Post'] := QuotedStr(SignPost.Value);
    Report.Variables['Sign_FIO'] := QuotedStr(SignFIO.Value);
    Report.Variables['Firm_Name'] := QuotedStr(ConstsQuery['Name']);
    Report.Variables['SRName'] := QuotedStr(SR.DisplayText);   {SRNAME}


    if DesignReport then Report.DesignReport
    else Report.ShowReport;
end;

procedure TfmShtatReport2Params.DepartmentOpenSprav(Sender: TObject;
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

procedure TfmShtatReport2Params.FormDestroy(Sender: TObject);
begin
    qFAutoSaveIntoRegistry(Self);
end;

procedure TfmShtatReport2Params.FormCreate(Sender: TObject);
begin
    qFAutoLoadFromRegistry(Self);
    DesignReport := False;
end;

procedure TfmShtatReport2Params.FormKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    begin
        DesignReport := not DesignReport;
        if DesignReport then DLabel.Caption := 'Design'
        else DLabel.Caption := '';
    end;
end;

procedure TfmShtatReport2Params.SROpenSprav(Sender: TObject;
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

procedure TfmShtatReport2Params.UnMarkAllClick(Sender: TObject);
var
    i: Integer;
begin
    for i := 0 to TypePostListBox.Items.Count - 1 do
        TypePostListBox.Checked[i] := False;
end;

procedure TfmShtatReport2Params.MarkAllButtonClick(Sender: TObject);
var
    i: Integer;
begin
    for i := 0 to TypePostListBox.Items.Count - 1 do
        TypePostListBox.Checked[i] := True;
end;

end.

