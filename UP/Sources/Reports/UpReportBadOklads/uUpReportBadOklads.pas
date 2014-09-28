Unit uUpReportBadOklads;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, ActnList, ComCtrls, StdCtrls, cxButtons,
    uCommonSp, FIBDatabase, pFIBDatabase, Gauges, IBase, DB, FIBDataSet, pFIBDataSet,
    frxDesgn, frxClass, frxDBSet, frxExportXLS;

Type
    TUP_RegardsCommonReport = Class(TSprav)
    public
        Constructor Create;
        Procedure Show; override;
        Destructor Destroy; override;
    End;

Function CreateSprav: TSprav; stdcall;
Exports CreateSprav;

Type
    TfmMain = Class(TForm)
        cxButtonDraft: TcxButton;
        cxButtonFilter: TcxButton;
        cxButtonPrint: TcxButton;
        cxButtonClose: TcxButton;
        StatusBar1: TStatusBar;
        ActionList1: TActionList;
        FilterAction: TAction;
        PrintAction: TAction;
        DesAction: TAction;
        FontAction: TAction;
        FontDialogs: TFontDialog;
        Constructor Create(aOwner: TComponent; HandleDb: Integer); reintroduce;
        Procedure FontActionExecute(Sender: TObject);
        Procedure cxButtonCloseClick(Sender: TObject);
        Procedure FilterActionExecute(Sender: TObject);
        Procedure PrintActionExecute(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    End;

    ReportTHerited = Class(TThread)
        DataBase: TpFIBDatabase;
        Transaction: TpFIBTransaction;
        bar: TGauge;
        pos: Integer;
        ID_SESSION: Variant;
        ReportParam: Variant;
        Constructor Create(InDataBase: TpFIBDatabase; InTransaction: TpFIBTransaction;
            prog: TGauge; ID_TRAN: Variant; RepParam: Variant);
        Procedure Execute; override;
        Destructor Destroy; override;
        Procedure UpdateBar;
    End;

Var
    fmMain: TfmMain;
    id_sp_report, id_session: Int64;
    IsDesign: Boolean;
    report: ReportTHerited;
    PFontNames: String;
    PFontSizes: integer;
    PFontColors: TColor;
    PFontStyles: TFontStyles;

Implementation

Uses dmUpReportBadOklads;

{$R *.dfm}

Constructor ReportTHerited.Create(InDataBase: TpFIBDatabase; InTransaction: TpFIBTransaction;
    prog: TGauge; ID_TRAN: Variant; RepParam: Variant);
Begin
    {  inherited Create(False);
      DataBase:=InDataBase;
      Transaction:=InTransaction;
      bar:=prog;
      ID_SESSION:=ID_TRAN;
      ReportParam:=RepParam;
     }
End;


Destructor TUP_RegardsCommonReport.Destroy;
Begin
    Inherited Destroy;
End;


Procedure ReportTHerited.Execute;
Begin
End;

Procedure ReportTHerited.UpdateBar;
Begin

End;

Destructor ReportTHerited.Destroy;
Begin
End;

Function CreateSprav: TSprav; stdcall;
Begin
    Result := TUP_RegardsCommonReport.Create;
End;

Constructor TUP_RegardsCommonReport.Create;
Begin
    Inherited Create;
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);
    Input.FieldDefs.Add('DesignReport', ftBoolean);

    PrepareMemoryDatasets;
End;

Procedure TUP_RegardsCommonReport.Show;
Var
    hnd: Integer;
    Print: TfmMain;
Begin
    hnd := Input['DBHandle'];
    id_sp_report := Input['id_sp_report'];
    IsDesign := Input['DesignReport'];

    PFontNames := 'Times New Roman';
    PFontSizes := 10;
    PFontColors := clDefault;

    DM := TDM.Create(Nil);
    DM.DB.Handle := TISC_DB_HANDLE(hnd);
    Print := TfmMain.Create(Application.MainForm, hnd);
    Print.ShowModal;
    Print.Free;
    Dm.Free;
End;

Constructor TfmMain.Create(aOwner: TComponent; HandleDb: Integer);
Begin
    Inherited Create(aOwner);
    Dm.DSet.SelectSQL.Text := 'select distinct NAME_REPORT from UP_DT_REPORT_SP_REPORT Where ID_SP_REPORT=' + IntToStr(id_sp_report) + '';
    Dm.DSet.Active := True;
    self.Caption := Dm.DSet.FieldValues['NAME_REPORT'];
    Dm.DSet.Active := False;
    //получаем идентификатор транзакции
    Dm.WriteTransaction.StartTransaction;
    Dm.StoredProc.StoredProcName := 'UP_DT_REPORT_SESSION';
    Dm.StoredProc.Prepare;
    Try
        Dm.StoredProc.ExecProc;
    Except
        Begin
            Dm.WriteTransaction.Rollback;
            Exit;
        End;
    End;
    ID_SESSION := Dm.StoredProc.FieldByName('OUT_ID_REPORT_SESSION').AsVariant;
    Dm.WriteTransaction.Commit;
End;


Procedure TfmMain.FontActionExecute(Sender: TObject);
Begin
    If FontDialogs.Execute
        Then
    Begin
        PFontNames := FontDialogs.Font.Name;
        PFontSizes := FontDialogs.Font.Size;
        PFontColors := FontDialogs.Font.Color;
        PFontStyles := FontDialogs.Font.Style;
    End;
End;

Procedure TfmMain.cxButtonCloseClick(Sender: TObject);
Begin
    Close;
End;

Procedure TfmMain.FilterActionExecute(Sender: TObject);
Var
    sp: TSprav;
Begin
    Try
        sp := GetSprav('UP\UpReportFilter');
        If sp <> Nil
            Then
        Begin
            With sp.Input Do
            Begin
                Append;
                FieldValues['DBHandle'] := Integer(Dm.DB.Handle);
                FieldValues['id_session'] := id_session;
                FieldValues['id_sp_report'] := id_sp_report;
                Post;
            End;
            sp.Show;
            If sp.Output['CorrFilter'] = 1 Then
                PrintAction.Enabled := true;
            sp.Free;
        End
        Else
            ShowMessage('');
    Except On e: Exception Do
            MessageDlg(e.Message, mtError, [mbOk], 0);
    End;
End;

Procedure TfmMain.PrintActionExecute(Sender: TObject);
Var
    ReportOptions: Variant;
    NameReport: TpFIBDataSet;
    m: TfrxMasterData;
Begin
    NameReport := TpFIBDataSet.Create(Self);
    NameReport.Database := Dm.DB;
    NameReport.Transaction := Dm.ReadTransaction;
    NameReport.SelectSQL.Text := 'select R.name_fr3 from up_dt_report_sp_report  R where R.id_sp_report=:id_sp_report';
    NameReport.ParamByName('id_sp_report').AsInt64 := id_sp_report;
    NameReport.Active := true;

    ReportOptions := VarArrayCreate([0, 1], varVariant);
    ReportOptions[0] := VarArrayOf([NameReport.FieldByName('name_fr3').AsString]);
    ReportOptions[1] := VarArrayOf([IsDesign]);

    With Dm Do
    Begin
        DSetData.Active := False;
        DSetData.SelectSQL.Text := 'select distinct * from UP_CHECK_OKLAD_AFTER_UP(:IN_ID_REPORT_SESSION) Order By FIO, DATE_BEG';

        Try
            DSetData.ParamByName('IN_ID_REPORT_SESSION').AsInt64 := id_session;
            DSetData.Active := True;
        Except
            On E: Exception Do
            Begin
                messageBox(0, PChar('Помилка при підготовці звіту!'), 'Помилка!', MB_OK);
                Exit;
            End;
        End;

        If DSetData.IsEmpty Then
        Begin
            messageBox(0, PChar('За такими данними співробітників не знайдено'), 'Увага!', MB_OK);
            Exit;
        End;

        Report.Clear;
        Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Up\' + ReportOptions[0][0] + '.fr3', True);

        Try
            Dm.DSet.Active := False;
            Dm.DSet.SelectSQL.Text := 'select distinct Firm_Name From Ini_Asup_Consts';
            Dm.DSet.Active := True;
            Report.Variables['FIRM_NAME'] := QuotedStr(DM.DSet['FIRM_NAME']);

            Dm.DSet.Active := False;
            Dm.DSet.SelectSQL.Text := 'Select OUT_DATE_BEG, OUT_DATE_END From Up_Dt_Report_Val_Param_Start(:In_Id_Report_Session)';
            DSet.ParamByName('IN_ID_REPORT_SESSION').AsInt64 := id_session;
            Dm.DSet.Active := True;

            Report.Variables['PERIOD_BEG'] := QuotedStr(DM.DSet['OUT_DATE_BEG']);
            Report.Variables['PERIOD_END'] := QuotedStr(DM.DSet['OUT_DATE_END']);
            Dm.DSet.Active := False;

        Except On E: Exception Do
            Begin
                ShowMessage(E.Message);
                exit;
            End;
        End;
        
        m := TfrxMasterData(Report.FindObject('MasterData1'));
        If m <> Nil Then
        Begin
            m.Font.Name := PFontNames;
            m.Font.Size := PFontSizes;
            m.Font.Color := PFontColors;
            m.Font.Style := PFontStyles;
        End;

        If ReportOptions[1][0] = true Then
        Begin
            Report.DesignReport;
        End
        Else
        Begin
            Report.ShowReport;
        End;
    End;
End;

End.

