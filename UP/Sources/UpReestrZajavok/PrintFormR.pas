unit PrintFormR;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, cxRadioGroup, cxLookAndFeelPainters, cxButtons,
    ActnList, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
    cxButtonEdit, AllPeopleUnit, pFIBDatabase, FIBDatabase, IBASE, Basetypes,
    DB, FIBDataSet, pFIBDataSet, frxClass, frxDBSet, cxDropDownEdit,
    cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, frxExportHTML,
    frxExportXLS, frxExportRTF;

type
    TfrmPrintR = class(TForm)
        RBMan: TcxRadioButton;
        RBStaj: TcxRadioButton;
        cxBOk: TcxButton;
        cxBCancel: TcxButton;
        ActionList1: TActionList;
        ActOk: TAction;
        ActCancel: TAction;
        cxBManEdit: TcxButtonEdit;
        ReportDsetData: TfrxDBDataset;
        ReportDataSet: TpFIBDataSet;
        RBAll: TcxRadioButton;
        cxBStagEdit: TcxLookupComboBox;
        DSStaj: TDataSource;
        StajSet: TpFIBDataSet;
        LevelSet: TpFIBDataSet;
        Report: TfrxReport;
        procedure RBManClick(Sender: TObject);
        procedure RBStajClick(Sender: TObject);
        procedure ActCancelExecute(Sender: TObject);
        procedure cxBManEditPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure RBAllClick(Sender: TObject);
        procedure ActOkExecute(Sender: TObject);
    private
        IdPersonDocument: Integer;
        IdMan: Integer;
        IdTypeStaj: Integer;
        DBHandle: TISC_DB_HANDLE;
    { Private declarations }
    public
        procedure SetParams(IdPersDoc, IdM, IdTpSt: Integer; Handl: TISC_DB_HANDLE);
        function GetHandle: TISC_DB_HANDLE;
    { Public declarations }
    end;

var
    frmPrintR: TfrmPrintR;

implementation

uses uReestrZajavok;

{$R *.dfm}

procedure TfrmPrintR.SetParams(IdPersDoc, IdM, IdTpSt: Integer; Handl: TISC_DB_HANDLE);
begin
    Self.IdPersonDocument := IdPersDoc;
    Self.IdMan := IdM;
    Self.IdTypeStaj := IdTpSt;
    Self.DBHandle := Handl;
end;

function TfrmPrintR.GetHandle: TISC_DB_HANDLE;
begin
    Result := Self.DBHandle;
end;

procedure TfrmPrintR.RBManClick(Sender: TObject);
begin
    if RBMan.Checked then
    begin
        cxBManEdit.Enabled := True;
        cxBStagEdit.Enabled := False;
    end;
end;

procedure TfrmPrintR.RBStajClick(Sender: TObject);
begin
    if RBStaj.Checked then
    begin
        cxBManEdit.Enabled := False;
        cxBStagEdit.Enabled := True;
        StajSet.Close;
        StajSet.SQLs.SelectSQL.Text := 'select distinct ID_TYPE_STAG, NAME_STAJ ' +
            'from PERSON_STAJ_INFO_SELECT(:ID_PERSON_DOCUMENT) ' +
            'order by id_type_stag asc';
        StajSet.ParamByName('ID_PERSON_DOCUMENT').AsInt64 := Self.IdPersonDocument;
        try
            StajSet.Open;
        except on e: exception
            do begin
                agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
            end;
        end;
    end;
end;

procedure TfrmPrintR.ActCancelExecute(Sender: TObject);
begin
    Close;
end;

procedure TfrmPrintR.cxBManEditPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
var result: Variant;
begin
    try
        result := AllPeopleUnit.GetMan(Self, GetHandle, False, False);
        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
            not (VarArrayDimCount(result) = 0) then
        begin
            Self.IdMan := result[0];
            cxBManEdit.Text := result[1];
        end;
    except on e: exception
        do begin
            agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
        end;
    end;
end;

procedure TfrmPrintR.RBAllClick(Sender: TObject);
begin
    if RBAll.Checked then
    begin
        cxBManEdit.Enabled := False;
        cxBStagEdit.Enabled := False;
    end;
end;

procedure TfrmPrintR.ActOkExecute(Sender: TObject);
var ID: Integer;
    lev: Integer;
begin
    try
        ID := Self.IdPersonDocument;

        LevelSet.Close;
        LevelSet.SQLs.SelectSQL.Text := 'select distinct id_level ' +
            'from UP_PERSON_DOCUMENTS ' +
            'where ID_PERSON_DOCUMENT=:ID_PERSON_DOCUMENT';
        LevelSet.ParamByName('ID_PERSON_DOCUMENT').AsInteger := ID;
        LevelSet.Open;
        if varIsNull(LevelSet['ID_LEVEL']) then lev := 1 else lev := 0;

        ReportDataSet.Close;
        ReportDataSet.SelectSQL.Text := 'SELECT * ' +
            'FROM UP_REPORT_PERSON_STAJ_PEOPLE(:ID_PERSON_DOCUMENT, :ID_MAN_IN, :TP_STAJ) ' +
            'order by fio collate win1251_ua';
        if RBMan.Checked then
        begin
            ReportDataSet.ParamByName('ID_PERSON_DOCUMENT').AsInteger := ID;
            ReportDataSet.ParamByName('ID_MAN_IN').AsInteger := Self.IdMan;
            ReportDataSet.ParamByName('TP_STAJ').AsInteger := -1;
        end;
        if RBStaj.Checked then
        begin
            ReportDataSet.ParamByName('ID_PERSON_DOCUMENT').AsInteger := ID;
            ReportDataSet.ParamByName('ID_MAN_IN').AsInteger := -1;
            ReportDataSet.ParamByName('TP_STAJ').AsInteger := cxBStagEdit.EditValue;
        end;
        if RBAll.Checked then
        begin
            ReportDataSet.ParamByName('ID_PERSON_DOCUMENT').AsInteger := ID;
            ReportDataSet.ParamByName('ID_MAN_IN').AsInteger := -1;
            ReportDataSet.ParamByName('TP_STAJ').AsInteger := -1;
        end;
        ReportDataSet.Open;
        if ReportDataSet.IsEmpty then
        begin
            agMessageDlg('Увага!', 'Обраний документ не сформований!', mtInformation, [mbOK]);
            exit;
        end;
        Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Up\' + 'UpPersonStajPeople.fr3', True);
        Report.Variables['chernetka'] := quotedStr(IntToStr(Lev));
        Report.ShowReport(true);
    except on e: exception
        do begin
            agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
        end;
    end;
end;

end.
