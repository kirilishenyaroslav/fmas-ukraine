unit ReestrMainUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
    cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
    cxGridDBTableView, cxGrid, IBCustomDataSet, IBQuery, Buttons,
    PersonalCommon, EditReestrUnit, SpCommon, ReestrFillFormUnit, cxButtonEdit, Buffer, AllBuffersUnit,
    FR_DSet, FR_DBSet, FR_Class, IBDatabase;



type
    TReestrMainForm = class(TForm)
        ToolPanel: TPanel;
        ReestrGridDBTV: TcxGridDBTableView;
        ReestrGridLevel1: TcxGridLevel;
        ReestrGrid: TcxGrid;
        RepositoryReestr: TcxStyleRepository;
        cxStyle1: TcxStyle;
        cxStyle2: TcxStyle;
        cxStyle3: TcxStyle;
        cxStyle4: TcxStyle;
        cxStyle5: TcxStyle;
        cxStyle6: TcxStyle;
        cxStyle7: TcxStyle;
        cxStyle8: TcxStyle;
        cxStyle9: TcxStyle;
        cxStyle10: TcxStyle;
        cxStyle11: TcxStyle;
        cxStyle12: TcxStyle;
        cxStyle13: TcxStyle;
        cxStyle14: TcxStyle;
        ReestrDataSource: TDataSource;
        ReestrMainQuery: TIBQuery;
        ReestrMainQueryNUM_REESTR: TIBStringField;
        ReestrMainQueryDATE_REESTR: TDateField;
        NumReestrColumn: TcxGridDBColumn;
        DateReestrColumn: TcxGridDBColumn;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        FormReestrButton: TSpeedButton;
        ReestrMainQueryID_REESTR: TIntegerField;
        GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
        cxStyle15: TcxStyle;
        cxStyle16: TcxStyle;
        cxStyle17: TcxStyle;
        cxStyle18: TcxStyle;
        cxStyle19: TcxStyle;
        cxStyle20: TcxStyle;
        cxStyle21: TcxStyle;
        cxStyle22: TcxStyle;
        cxStyle23: TcxStyle;
        cxStyle24: TcxStyle;
        cxStyle25: TcxStyle;
        cxStyle26: TcxStyle;
        cxStyle27: TcxStyle;
        cxStyle28: TcxStyle;
        WorkQuery: TIBQuery;
        ReestrMainQueryDATE_END: TDateField;
        DateEndColumn: TcxGridDBColumn;
        WriteBufferQuery: TIBQuery;
        PrintButton: TSpeedButton;
        ReestrReportQuery: TIBQuery;
        ReestrReportQueryFIO: TIBStringField;
        ReestrReportQuerySERIA_NUM: TIBStringField;
        ReestrReportQueryPERCENT: TIBBCDField;
        ReestrReportQueryDATE_BEG: TDateField;
        ReestrReportQueryDATE_END: TDateField;
        ReestrReportQueryCALENDAR_DAYS: TIntegerField;
        ReestrReportQueryWORK_DAYS: TIntegerField;
        ReestrReportQueryWORK_DAYS_IN_5_DAYS: TIntegerField;
        ReestrReportQueryTN: TIntegerField;
        ReportDataSource: TDataSource;
        ReestrReport: TfrReport;
        FrDataSet: TfrDBDataSet;
        VoplSumQuery: TIBQuery;
        VoplSumQuerySUM_CAL: TLargeintField;
        VoplSumQuerySUM_WORK_DAYS: TLargeintField;
        VoplSumQuerySUM_WORK_DAYS_IN_5_DAYS: TLargeintField;
        VoplSumQueryNAME_VIDOPL: TIBStringField;
        ReportSummary: TfrDBDataSet;
        VoplSumQuerySOC: TLargeintField;
        VoplSumQueryCOUNT: TIntegerField;
        ReestrReportQueryVIH_DAYS: TIntegerField;
        VoplSumQueryVIH: TLargeintField;
        ReestrReportQueryIS_MAIN: TIntegerField;
        ReestrReportQueryILL_TYPE: TIntegerField;
        ReestrReportQueryRES: TIntegerField;
        ReestrReportQueryKOD_VIDOPL: TIntegerField;
        ReestrReportQueryNAME_DEP: TIBStringField;
        ReestrReportQueryNAME_PARENT_DEP: TIBStringField;
    PrintExportButton: TSpeedButton;
        procedure FormCreate(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure DeleteButtonClick(Sender: TObject);
        procedure FormReestrButtonClick(Sender: TObject);
        procedure ExportButtonClick(Sender: TObject);
        procedure PrintButtonClick(Sender: TObject);
    procedure PrintExportButtonClick(Sender: TObject);
    private
        function PrepareReport: Boolean;
    public
    { Public declarations }
    end;

var
    ReestrMainForm: TReestrMainForm;

implementation

{$R *.dfm}

uses uExportReport;

procedure TReestrMainForm.FormCreate(Sender: TObject);
begin
    ReestrReportQuery.Transaction := PersonalCommon.ReadTransaction;
    ReestrMainQuery.Transaction := PersonalCommon.ReadTransaction;
    WriteBufferQuery.Transaction := BufferTransaction;
    WorkQuery.Transaction := PersonalCommon.WriteTransaction;
    VoplSumQuery.Transaction := PersonalCommon.ReadTransaction;
    ReestrMainQuery.Open;

end;

procedure TReestrMainForm.AddButtonClick(Sender: TObject);
var
    form: TEditReestrForm;
begin
    form := TEditReestrForm.Create(Self);
    form.Prepare(emNew, -1);
    if form.ShowModal = mrOk then
    begin
        ReestrMainQuery.Close;
        ReestrMainQuery.Open;

    end;

end;

procedure TReestrMainForm.ModifyButtonClick(Sender: TObject);
var
    form: TEditReestrForm;
    id: Integer;
begin
    form := TEditReestrForm.Create(Self);
    id := ReestrMainQuery['ID_REESTR'];
    form.Prepare(emModify, id);
    if form.ShowModal = mrOk then
    begin
        ReestrMainQuery.Close;
        ReestrMainQuery.Open;
    end;

end;

procedure TReestrMainForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    Action := caFree;

end;

procedure TReestrMainForm.DeleteButtonClick(Sender: TObject);
begin
    if
        MessageDlg
        ('Чи ви справді бажаєте вилучити запис?', mtconfirmation, [mbYes, MbNo], 0) = mrYes
        then
    begin
        WorkQuery.Close;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_HOSP_REESTR_DELETE(' + IntToStr(ReestrMainQueryID_REESTR.Value) + ');';
        ExecQuery(WorkQuery);
        QueryRefresh(ReestrMainQuery);
    end;
end;

procedure TReestrMainForm.FormReestrButtonClick(Sender: TObject);
var
    form: TReestrFillForm;
begin
    form := TReestrFillForm.Create(self);
    form.Prepare(ReestrMainQuery['Id_Reestr']);
    form.FormStyle := fsMDIChild;
    form.Show;
end;

procedure TReestrMainForm.ExportButtonClick(Sender: TObject);
var
    IDPBKEY: Integer;
    Fakeform: TAllBuffersForm;
begin
    FakeForm := TAllBuffersForm.Create(Self);

    BufTran.Start;
    try
        IDPBKEY := BufTran.AddRecord('NReestr', 'BUFF_REESTR');
        WriteBufferQuery.ParamByName('ID_PBKEY').Value := IDPBKEY;
        WriteBufferQuery.ParamByName('ID_REESTR').Value := ReestrMainQuery['ID_REESTR'];
        WriteBufferQuery.ParamByName('NUM_REESTR').Value := ReestrMainQuery['NUM_REESTR'];
        WriteBufferQuery.ParamByName('DATE_BEG').Value := ReestrMainQuery['DATE_REESTR'];
        WriteBufferQuery.ParamByName('DATE_END').Value := ReestrMainQuery['DATE_END'];

        ExecQuery(WriteBufferQuery);

        WriteToDbf('NReestr', 'BUFF_REESTR', IDPBKEY);
    except on E: Exception do
        begin
            MessageDlg('Виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
            BufTran.Rollback;
            Exit;
        end;
    end;
    BufTran.Commit;

    FakeForm.Hospital.Checked := True;
    FakeForm.ID_REESTR := ReestrMainQuery['ID_REESTR'];
    FakeForm.OkButtonClick(Self);
    FakeForm.Free;


end;

procedure TReestrMainForm.PrintButtonClick(Sender: TObject);
begin
    PrepareReport;
    if sDesignReport then ReestrReport.DesignReport
    else ReestrReport.ShowReport;
end;

procedure TReestrMainForm.PrintExportButtonClick(Sender: TObject);
begin
    if PrepareReport = True then
    ExportReportTo(ReestrReport);
end;

function TReestrMainForm.PrepareReport:Boolean;
begin
    PrepareReport := false;
    ReestrReportQuery.Close;
    VoplSumQuery.Close;

    ReestrReportQuery.ParamByName('ID_REESTR').Value :=
        ReestrMainQuery['ID_REESTR'];
    try
        ReestrReportQuery.Open;
    except on E: Exception do
        begin
            MessageDlg('Виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
            Exit;
        end;
    end;
    VoplSumQuery.ParamByName('ID_REESTR').Value :=
        ReestrMainQuery['ID_REESTR'];

    try
    VoplSumQuery.Open;
    except on E: Exception do
        begin
            MessageDlg('Виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
            Exit;
        end;
    end;

    if (PersonalCommon.NewOrders = True) then
        ReestrReport.LoadFromFile(ProgramPath +
            'Reports\ASUP\HospReestrReportUniver.frf')
    else
        ReestrReport.LoadFromFile(ProgramPath +
            'Reports\ASUP\HospReestrReport.frf');

    frVariables['IS_UNIVER'] := PersonalCommon.NewOrders;
    PrepareReport := True;
end;

end.
