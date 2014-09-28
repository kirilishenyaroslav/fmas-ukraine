unit uUpReportHoliday;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uCommonSp, DB, FIBDatabase, pFIBDatabase, IBase, ComCtrls,
    cxLookAndFeelPainters, StdCtrls, cxButtons, Gauges, pFIBStoredProc,
    FIBQuery, pFIBQuery, frxDesgn, frxClass, frxDBSet, frxExportXLS,
    FIBDataSet, pFIBDataSet, frxExportHTML, frxExportRTF, ActnList,
    cxControls, cxContainer, cxEdit, cxCheckBox, cxTextEdit, cxMaskEdit,
    cxDropDownEdit, cxCalendar, cxLabel;

type
    TUP_RegardsCommonReport = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
        destructor Destroy; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

type
    TfmMain = class(TForm)
        StatusBar1: TStatusBar;
        cxButtonFilter: TcxButton;
        cxButtonPrint: TcxButton;
        ActionList1: TActionList;
        FilterAction: TAction;
        PrintAction: TAction;
        DesAction: TAction;
        cxButtonClose: TcxButton;
        cxButtonDraft: TcxButton;
        FontAction: TAction;
        FontDialogs: TFontDialog;
        cxDecret: TcxCheckBox;
        LabelDateForm: TcxLabel;
        cxLabel1: TcxLabel;
        cxDateBeg: TcxDateEdit;
        cxLabel2: TcxLabel;
        cxDateEnd: TcxDateEdit;
        cxShowDekr: TcxCheckBox;
        constructor Create(aOwner: TComponent; HandleDb: Integer); reintroduce;
        procedure cxButtonCloseClick(Sender: TObject);
        procedure FilterActionExecute(Sender: TObject);
        procedure PrintActionExecute(Sender: TObject);
        procedure FontActionExecute(Sender: TObject);
        procedure FormCreate(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;
    ReportTHerited = class(TThread)
        DataBase: TpFIBDatabase;
        Transaction: TpFIBTransaction;
        bar: TGauge;
        pos: Integer;
        ID_SESSION: Variant;
        ReportParam: Variant;
        constructor Create(InDataBase: TpFIBDatabase; InTransaction: TpFIBTransaction;
            prog: TGauge; ID_TRAN: Variant; RepParam: Variant);
        procedure Execute; override;
        destructor Destroy; override;
        procedure UpdateBar;
    end;

var
    fmMain: TfmMain;
    id_sp_report, id_session: Int64;
    IsDesign: Boolean;
    report: ReportTHerited;
    PFontNames: string;
    PFontSizes: integer;
    PFontColors: TColor;
    PFontStyles: TFontStyles;
    PDecret: integer;

implementation

uses dmReportHoliday, NagScreenUnit;

{$R *.dfm}

constructor ReportTHerited.Create(InDataBase: TpFIBDatabase; InTransaction: TpFIBTransaction;
    prog: TGauge; ID_TRAN: Variant; RepParam: Variant);
begin
{  inherited Create(False);
  DataBase:=InDataBase;
  Transaction:=InTransaction;
  bar:=prog;
  ID_SESSION:=ID_TRAN;
  ReportParam:=RepParam;
 }
end;

destructor TUP_RegardsCommonReport.Destroy;
begin
    inherited Destroy;
end;

procedure ReportTHerited.Execute;
begin
end;

procedure ReportTHerited.UpdateBar;
begin

end;

destructor ReportTHerited.Destroy;
begin
end;

function CreateSprav: TSprav; stdcall;
begin
    Result := TUP_RegardsCommonReport.Create;
end;

constructor TUP_RegardsCommonReport.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);
    Input.FieldDefs.Add('DesignReport', ftBoolean);

    PrepareMemoryDatasets;
end;

procedure TUP_RegardsCommonReport.Show;
var
    hnd: Integer;
    Print: TfmMain;
begin
    hnd := Input['DBHandle'];
    id_sp_report := Input['id_sp_report'];
    IsDesign := Input['DesignReport'];

    PFontNames := 'Times New Roman';
    PFontSizes := 9;
    PFontColors := clDefault;

    DM := TDM.Create(nil);
    DM.DB.Handle := TISC_DB_HANDLE(hnd);
    Print := TfmMain.Create(Application.MainForm, hnd);
    Print.ShowModal;
    Print.Free;
    Dm.Free;
end;

constructor TfmMain.Create(aOwner: TComponent; HandleDb: Integer);
begin
    inherited Create(aOwner);
    Dm.DSet.SelectSQL.Text := 'select distinct NAME_REPORT from UP_DT_REPORT_SP_REPORT Where ID_SP_REPORT=' + IntToStr(id_sp_report) + '';
    Dm.DSet.Active := True;
    self.Caption := Dm.DSet.FieldValues['NAME_REPORT'];
    Dm.DSet.Active := False;
    //получаем идентификатор транзакции
    Dm.WriteTransaction.StartTransaction;
    Dm.StoredProc.StoredProcName := 'UP_DT_REPORT_SESSION';
    Dm.StoredProc.Prepare;
    try
        Dm.StoredProc.ExecProc;
    except
        begin
            Dm.WriteTransaction.Rollback;
            Exit;
        end;
    end;
    ID_SESSION := Dm.StoredProc.FieldByName('OUT_ID_REPORT_SESSION').AsVariant;
    Dm.WriteTransaction.Commit;
end;

procedure TfmMain.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfmMain.FilterActionExecute(Sender: TObject);
var
    sp: TSprav;
begin
    try
        sp := GetSprav('UP\UpReportFilter');
        if sp <> nil
            then
        begin
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(Dm.DB.Handle);
                FieldValues['id_session'] := id_session;
                FieldValues['id_sp_report'] := id_sp_report;
                Post;
            end;
            sp.Show;
            if sp.Output['CorrFilter'] = 1 then
                PrintAction.Enabled := true;
            sp.Free;
        end
        else ShowMessage('');
    except on e: Exception do
            MessageDlg(e.Message, mtError, [mbOk], 0);
    end;
end;

procedure TfmMain.PrintActionExecute(Sender: TObject);
var
    ReportOptions: Variant;
    NameReport: TpFIBDataSet;
    m: TfrxMasterData;
    NagScreen: TNagScreen;
    ShowDecret: integer;
begin
    if (varIsNull(cxDateBeg.EditValue)) then
    begin
        messageBox(0, PChar('Треба обрати дату початку!'), 'Помилка!', MB_OK);
        Exit;
    end;

    if (varIsNull(cxDateEnd.EditValue)) then
    begin
        messageBox(0, PChar('Треба обрати дату кінця!'), 'Помилка!', MB_OK);
        Exit;
    end;

    NagScreen := TNagScreen.Create(Application.MainForm);
    NagScreen.Show;
    NagScreen.SetStatusText('Чекайте! Йде формування звіту!');
    Screen.Cursor := crHourGlass;
    NameReport := TpFIBDataSet.Create(Self);
    NameReport.Database := Dm.DB;
    NameReport.Transaction := Dm.ReadTransaction;
    Dm.ReadTransaction.StartTransaction;
    NameReport.SelectSQL.Text := 'select R.name_fr3 from up_dt_report_sp_report  R where R.id_sp_report=:id_sp_report';
    NameReport.ParamByName('id_sp_report').AsInt64 := id_sp_report;
    NameReport.Active := true;

    ReportOptions := VarArrayCreate([0, 1], varVariant);
    ReportOptions[0] := VarArrayOf([NameReport.FieldByName('name_fr3').AsString]);
    ReportOptions[1] := VarArrayOf([IsDesign]);
    if cxDecret.Checked then PDecret := 1
    else PDecret := 0;

    if cxShowDekr.Checked then ShowDecret := 1
    else ShowDecret := 0;

    with Dm do
    begin
        DSetData.Active := False;
        DSetData.SQLs.SelectSQL.Text := 'SELECT distinct * FROM HL_PRT_GET_PLAN_FACT_HOLIDAY_3 (' + IntToStr(Id_Session) + ',''' +
                                        DateToStr(cxDateBeg.Date) + ''',''' + DateToStr(cxDateEnd.Date) + ''',' + IntToStr(PDecret) +
                                        ',' + IntToStr(ShowDecret) + ') Order By Out_Id_Type_Post,OUT_DEPARTMENT_NAME_UPPER Collate Win1251_Ua, ';
      //  DSetData.SQLs.SelectSQL.Text :='SELECT distinct * FROM HL_PRT_GET_PLAN_FACT_HOLIDAY_3 Order By Out_Id_Type_Post,OUT_DEPARTMENT_NAME_UPPER Collate Win1251_Ua, ';
        DSetData.SQLs.SelectSQL.Text := DSetData.SQLs.SelectSQL.Text + 'OUT_DEPARTMENT_NAME Collate Win1251_Ua, Out_Fio_Ua Collate Win1251_Ua, Id_Pcard_Out, Out_Is_Main, Id_Work_Reason,Plan_Period_Beg,Real_Date_End, Id_Type_Holiday';

        try
           // DSetData.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
            DSetData.Active := True;
        except
            on E: Exception do
            begin
                messageBox(0, PChar('Помилка при підготовці звіту!'), 'Помилка!', MB_OK);
                Screen.Cursor := crDefault;
                NagScreen.Free;
                Exit;
            end;
        end;

        if DSetData.IsEmpty then
        begin
            messageBox(0, PChar('За такими данними співробітників не знайдено'), 'Увага!', MB_OK);
            Screen.Cursor := crDefault;
            NagScreen.Free;
            Exit;
        end;

        Report.Clear;
        Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Up\' + ReportOptions[0][0] + '.fr3', True);
        //Report.Variables['CUR_DATE']:=QuotedStr(DSetData['CUR_DATE']);
        Report.Variables['FIRM_NAME'] := 'ДОНЕЦЬКИЙ НАЦІОНАЛЬНИЙ УНІВЕРСИТЕТ'; //QuotedStr(DSetData['FIRM_NAME']);
        Report.Variables['DATE_BEG'] := QuotedStr(DateToStr(cxDateBeg.Date));
        Report.Variables['DATE_END'] := QuotedStr(DateToStr(cxDateEnd.Date));
        m := TfrxMasterData(Report.FindObject('MasterData1'));
        if m <> nil then
        begin
            m.Font.Name := PFontNames;
            m.Font.Size := PFontSizes;
            m.Font.Color := PFontColors;
            m.Font.Style := PFontStyles;
        end;
        Screen.Cursor := crDefault;
        NagScreen.Free;
        if ReportOptions[1][0] = true then
        begin
            Report.DesignReport;
        end
        else
        begin
            Report.ShowReport;
        end;
        DSetData.Transaction.Commit;
    end;

end;

procedure TfmMain.FontActionExecute(Sender: TObject);
begin
    if FontDialogs.Execute
        then
    begin
        PFontNames := FontDialogs.Font.Name;
        PFontSizes := FontDialogs.Font.Size;
        PFontColors := FontDialogs.Font.Color;
        PFontStyles := FontDialogs.Font.Style;
    end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
    cxDateBeg.Date := StrToDate('01.01.1900');
    cxDateEnd.Date := StrToDate('31.12.9999');
end;

end.

