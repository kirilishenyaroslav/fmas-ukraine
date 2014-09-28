
unit UP_HP_Full;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ImgList, ActnList, dxBar, dxBarExtItems, UP_HP_DM, uCommonSp,
    RXMemDS, IBase, DB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxControls,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, cxClasses, cxContainer, cxCheckBox, StdCtrls,
    ExtCtrls, Placemnt, cxTextEdit, cxMemo, cxDBEdit, uFControl,
    uLabeledFControl, uDateControl, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
    cxDBLookupEdit, AccMgmt, cxDBLookupComboBox, pFibStoredProc, uSpravControl, cxLabel, Buttons, qFTools,
    cxSplitter, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, UP_HP_HIST_Period;

const
    GenPeriodsP = 'execute procedure HL_KER_PERIODS_GENERATE(:id_key,:act_year,:id_level);';
    GenPeriodsA = 'execute procedure HL_KER_PERIODS_GENERATE_EXT(:id_key,:act_year,:id_level);';

type
    THP_Main = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

type
    THP_FullForm = class(TForm)
        cxStyleRepository1: TcxStyleRepository;
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
        cxG_HP_Main: TcxGrid;
        HP_View: TcxGridDBTableView;
        cxG_HP_MainLevel1: TcxGridLevel;
        Panel2: TPanel;
        ImageList1: TImageList;
        dxBarManager1: TdxBarManager;
        dxBLB_Add: TdxBarLargeButton;
        dxBLB_Modif: TdxBarLargeButton;
        dxBLB_Del: TdxBarLargeButton;
        dxBLB_Cancel: TdxBarLargeButton;
        dxBLB_Refresh: TdxBarLargeButton;
        dxBLB_Ok: TdxBarLargeButton;
        dxBarContainerItem1: TdxBarContainerItem;
        dxBarDockControl1: TdxBarDockControl;
        ActionList1: TActionList;
        AddA: TAction;
        ModifA: TAction;
        DelA: TAction;
        OkA: TAction;
        CancelA: TAction;
        FilterA: TAction;
        RefreshA: TAction;
        FormStorage1: TFormStorage;
        DS_HP_full: TDataSource;
        HP_ViewDBColumn1: TcxGridDBColumn;
        HP_ViewDBColumn2: TcxGridDBColumn;
        HP_ViewDBColumn3: TcxGridDBColumn;
        HP_ViewDBColumn4: TcxGridDBColumn;
        HP_ViewDBColumn5: TcxGridDBColumn;
        HP_ViewDBColumn6: TcxGridDBColumn;
        Panel3: TPanel;
        cxDBM_Note: TcxDBMemo;
        Panel4: TPanel;
        qFDC_ActDate: TqFDateControl;
        dxBLB_Form: TdxBarLargeButton;
        FormA: TAction;
        dxBPM_Form: TdxBarPopupMenu;
        dxBB_FormAll: TdxBarButton;
        dxBB_Form: TdxBarButton;
        FormOneA: TAction;
        FormAllA: TAction;
        qFSC_PrivateCard: TqFSpravControl;
        FilterLabel: TcxLabel;
        SpeedButton1: TSpeedButton;
        dxBPM_Add: TdxBarPopupMenu;
        dxBB_Add: TdxBarButton;
        dxBB_AddPeriod: TdxBarButton;
        AddPeriodA: TAction;
        HP_ViewDBColumn7: TcxGridDBColumn;
        HP_ViewDBColumn8: TcxGridDBColumn;
        PrintA: TAction;
        dxBLB_Print: TdxBarLargeButton;
        Action1: TAction;
        Edt_can: TAction;
        dxBPM_Modify: TdxBarPopupMenu;
        dxBPM_Del: TdxBarPopupMenu;
        dxBarSubItem1: TdxBarSubItem;
        dxBLB_Modif_Hol: TdxBarButton;
        dxBarSubItem2: TdxBarSubItem;
        dxBLB_Modif_Per: TdxBarButton;
        dxBLB_Del_Hol: TdxBarButton;
        dxBLB_Del_Per: TdxBarButton;
        CheckOnlyValid: TcxCheckBox;
        cxSplitter1: TcxSplitter;
        Panel1: TPanel;
        Label1: TLabel;
        SearchEdit: TEdit;
        cxCheckBox1: TcxCheckBox;
        cxCheckBox2: TcxCheckBox;
        cxCB_FilterEdit: TcxComboBox;
        cxCheckBox3: TcxCheckBox;
        Label2: TLabel;
        CheckGroupDog: TcxCheckBox;
        UserSet: TpFIBDataSet;
        UserLabel: TcxLabel;
        DateTimeLabel: TcxLabel;
        cxStyle13: TcxStyle;
        cxStyle14: TcxStyle;
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
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        Panel5: TPanel;
        Panel6: TPanel;
        cxDBTextEdit1: TcxDBTextEdit;
        cxLabel1: TcxLabel;
        HP_ViewDBColumn10: TcxGridDBColumn;
        HP_ViewDBColumn11: TcxGridDBColumn;
        HP_ViewDBColumn12: TcxGridDBColumn;
        btnHistMenu: TdxBarLargeButton;
        StorProc: TpFIBStoredProc;
        NewPeriods: TpFIBDataSet;
        HistMenu: TdxBarPopupMenu;
        btnHistPeriods: TdxBarButton;
        btnHistHoliday: TdxBarButton;
        ActHistPeriods: TAction;
        ActHistHolidays: TAction;
        HP_ViewDBColumn9: TcxGridDBColumn;
        constructor Create(aOwner: TComponent; DM: THP_Dm); reintroduce;
        procedure SearchEditChange(Sender: TObject);
        procedure cxCheckBox1PropertiesChange(Sender: TObject);
        procedure cxCheckBox2PropertiesChange(Sender: TObject);
        procedure AddAExecute(Sender: TObject);
        procedure ModifAExecute(Sender: TObject);
        procedure DelAExecute(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure RefreshAExecute(Sender: TObject);
        procedure CancelAExecute(Sender: TObject);
        procedure qFDC_ActDateChange(Sender: TObject);
        procedure FormAExecute(Sender: TObject);
        procedure FormOneAExecute(Sender: TObject);
        procedure qFSC_PrivateCardOpenSprav(Sender: TObject;
            var Value: Variant; var DisplayText: string);
        procedure AddPeriodAExecute(Sender: TObject);
        procedure PrintAExecute(Sender: TObject);
        procedure Action1Execute(Sender: TObject);
        procedure Edt_canExecute(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure dxBLB_Modif_PerClick(Sender: TObject);
        procedure dxBLB_Del_PerClick(Sender: TObject);
        procedure CheckOnlyValidPropertiesChange(Sender: TObject);
        procedure HP_ViewCellClick(Sender: TcxCustomGridTableView;
            ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
            AShift: TShiftState; var AHandled: Boolean);
        procedure ActHistHolidaysExecute(Sender: TObject);
        procedure ActHistPeriodsExecute(Sender: TObject);
    private
        DModule: THP_Dm;
        can_edit: Integer;
        can_add_hol: Integer;
        procedure HolidayGenerate(key_session: int64; Interval, Level: Int64);
        procedure ShowReport(key_session: Int64);
        { Private declarations }
    public
        id_pcard: Variant;

        { Public declarations }
    end;

implementation

{$R *.dfm}

uses UP_HP_AddPHoliday, uFormControl, UP_HP_AddPeriod, UP_HP_SelPeople,
    UP_HP_RecalcAll, NagScreenUnit, UpKernelUnit, uUnivSprav, UP_HP_HIST,
    BaseTypes;

function CreateSprav: TSprav;
begin
    Result := THP_Main.Create;
end;

constructor THP_Main.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('ShowMod', ftInteger);
    Input.FieldDefs.Add('IdPcard', ftVariant);
    Input.FieldDefs.Add('IdManHolPlan', ftVariant);
    OutPut.FieldDefs.Add('IdManHolPlan', ftVariant);

    PrepareMemoryDatasets;
end;

procedure THP_Main.Show;
var
    DM: THP_DM;
    hnd: integer;
    HP_FullForm: THP_FullForm;
    HP_AddPHol: THP_AddPlanHol;
begin
    DM := THP_Dm.Create(Application.MainForm);
    hnd := Input['DBHandle'];
    DM.pFIBD_HP.Handle := TISC_DB_Handle(hnd);
    if VarIsNull(Input['ShowMod']) or (Input['ShowMod'] = 0) then
    begin
        HP_FullForm := THP_FullForm.Create(Application.MainForm, DM);
        if not VarIsNull(Input['IdPcard']) then
        begin
            HP_FullForm.DModule.pFIBDS_HP_Full.ParamByName('id_pcard').AsInteger := Input['IdPcard'];
            HP_FullForm.id_pcard := Input['IdPcard'];
            DM.pFIBDS_FIO.ParamByName('id_pcard').AsInteger := Input['IdPcard'];
            DM.pFIBDS_FIO.Open;
            HP_FullForm.qFSC_PrivateCard.Value := Input['IdPcard'];
            HP_FullForm.qFSC_PrivateCard.DisplayText := DM.pFIBDS_FIO['FIO_TN'];
            DM.pFIBDS_FIO.Close;
            HP_FullForm.RefreshA.Execute;
        end;
        HP_FullForm.qFDC_ActDate.Value := Date;
        HP_FullForm.FormStyle := fsMDIChild;
        HP_FullForm.Show;
        HP_FullForm.WindowState := wsMaximized;
    end
    else
    begin
        if (Input['ShowMod'] = 1) or (VarIsNull(Input['IdManHolPlan'])) then
        begin
            HP_AddPHol := THP_AddPlanHol.Create(Application.MainForm, DM, fmAdd, Null);
            if not VarIsNull(Input['IdPcard']) then
            begin
                DM.pFIBDS_FIO.ParamByName('id_pcard').AsInteger := Input['IdPcard'];
                DM.pFIBDS_FIO.Open;
                HP_AddPHol.qFSC_People.Value := Input['IdPcard'];
                HP_AddPHol.qFSC_People.DisplayText := DM.pFIBDS_FIO['FIO_TN'];
                DM.pFIBDS_FIO.Close;
                HP_AddPHol.qFSC_People.Blocked := True;
            end;
            HP_AddPHol.ShowModal;
        end
        else if (Input['ShowMod'] = 2) then
        begin
            HP_AddPHol := THP_AddPlanHol.Create(Application.MainForm, DM, fmModify, Input['IdManHolPlan']);
            if not VarIsNull(Input['IdPcard']) then
            begin
                HP_AddPHol.qFSC_People.Blocked := True;
            end
        end;
    end;
end;

constructor THP_FullForm.Create(aOwner: TComponent; DM: THP_Dm);
var
    i, nit: integer;
begin
    inherited Create(aOwner);
    id_pcard := null;
    DModule := DM;
    DModule.pFIB_CAN_ADD.Open;
    can_add_hol := DModule.pFIB_CAN_ADDCAN_ADD_HOL_PROP.AsInteger;
    DS_HP_full.DataSet := DModule.pFIBDS_HP_Full;
    cxCB_FilterEdit.Properties.Items.Clear;
    nit := HP_View.ColumnCount;

    Dmodule.pFIBDS_Consts.Close;
    Dmodule.pFIBDS_Consts.Open;
    for i := 0 to nit - 1 do
        cxCB_FilterEdit.Properties.Items.Add(HP_View.Columns[i].Caption);

    cxCB_FilterEdit.ItemIndex := 0;

    cxSplitter1.CloseSplitter;

    if (Dmodule.pFIBDS_Consts['USE_GROUP_HOLIDAY'] = 1) then
        HP_ViewDBColumn9.Visible := True
    else
        HP_ViewDBColumn9.Visible := False;

end;

procedure THP_FullForm.SearchEditChange(Sender: TObject);
begin
    if (SearchEdit.Text = '') or (VarIsNull(SearchEdit.Text)) then
    begin
        HP_View.DataController.DataSet.Filtered := False;
    end
    else
    begin
        try
            HP_View.DataController.DataSet.Filtered := False;
            HP_View.DataController.DataSet.Filter := 'UPPER(' +
                HP_View.Columns[cxCB_FilterEdit.ItemIndex].DataBinding.FieldName +
                ') LIKE ''%' + AnsiUpperCase(SearchEdit.Text) + '%'' and ' +
                HP_View.Columns[cxCB_FilterEdit.ItemIndex].DataBinding.FieldName + ' is not null';
            HP_View.DataController.DataSet.Filtered := True;
            HP_View.ViewData.Expand(False);
        except
        end;
    end;
end;

procedure THP_FullForm.cxCheckBox1PropertiesChange(Sender: TObject);
var
    i: Integer;
begin
    for i := 0 to HP_View.ColumnCount - 1 do
    begin
        HP_View.Columns[i].Options.Filtering := cxCheckBox1.Checked;
    end;
end;

procedure THP_FullForm.cxCheckBox2PropertiesChange(Sender: TObject);
begin
    HP_View.OptionsView.GroupByBox := cxCheckBox2.Checked;
end;

procedure THP_FullForm.AddAExecute(Sender: TObject);
var
    HP_AddPHol: THP_AddPlanHol;
    error: integer;
    SP, check: TpFibStoredProc;
    IdholPeriod: Integer;
begin
    error := fibCheckPermission('/ROOT/UpHolidayPlan', 'Add');
    if error <> 0 then
    begin
        agMessageDlg('Увага', 'Ви не маєте прав виконати цю дію!', mtInformation, [mbOK]);
        exit;
    end;
    try
        UserSet.Close;
        UserSet.SQLs.SelectSQL.Text := 'select full_name from users where id_user=:id_user';
        UserSet.ParamByName('id_user').AsInteger := GetUserId;
        UserSet.Open;
        if VarIsNull(DModule.pFIBDS_HP_Full['ID_HOLIDAY_PERIOD']) then
        begin
            agMessageDlg('Увага', 'Спочатку необхідно додати плановий період!', mtInformation, [mbOK]);
            exit;
        end
        else
            HP_AddPHol := THP_AddPlanHol.Create(Application.MainForm, DModule, fmAdd, Null);
        HP_AddPHol.can_add_hol := can_add_hol;
        HP_AddPHol.Id_Holiday_Period := DModule.pFIBDS_HP_Full['ID_HOLIDAY_PERIOD'];
        IdholPeriod := DModule.pFIBDS_HP_Full['ID_HOLIDAY_PERIOD'];

        HP_AddPHol.qFIC_Fact.Blocked := True;

        if VarIsNull(Id_Pcard) then
        begin
            agMessageDlg('Увага', 'Треба спочатку вибрати працівника!', mtInformation, [mbOK]);
            qFSC_PrivateCard.OpenSprav;
            exit;
        end;

        if not VarIsNull(Id_Pcard) then
        begin
            DModule.pFIBDS_FIO.ParamByName('id_pcard').AsInteger := Id_Pcard;
            DModule.pFIBDS_FIO.Open;
            HP_AddPHol.qFSC_People.Value := Id_Pcard;
            HP_AddPHol.qFSC_People.DisplayText := DModule.pFIBDS_FIO['FIO_TN'];
            DModule.pFIBDS_FIO.Close;
            HP_AddPHol.ActDate := qFDC_ActDate.Value;
            HP_AddPHol.CheckVal := Integer(CheckOnlyValid.Checked);
            with HP_AddPHol do
            begin
                qFSC_People.Blocked := True;
                qFSC_Period.Value := DModule.pFIBDS_HP_Full['ID_HOLIDAY_PERIOD'];
                qFSC_Period.DisplayText := DModule.pFIBDS_HP_Full['PERIOD_STR'];
                qFDC_DBeg.Value := DModule.pFIBDS_HP_Full['plan_PERIOD_BEG'];
                qFDC_DEnd.Value := DModule.pFIBDS_HP_Full['REAL_DATE_END'];
                qFIC_PPBeg.Value := DModule.pFIBDS_HP_Full['plan_PERIOD_BEG'];
                qFIC_PPEnd.Value := DModule.pFIBDS_HP_Full['REAL_DATE_END'];
                qFIC_Group.Value := DModule.pFIBDS_HP_Full['ID_GROUP_HOLIDAY'];
                qFIC_Days.Value := 0;
                qFIC_Fact.Value := 0;
                VisibleDays := True;
                VisibleDates := True;
            end;
        end;

        if (HP_AddPHol.ShowModal = mrOk) then
        begin
            check := TpFibStoredProc.Create(self);
            check.Database := DModule.pFIBD_HP;
            check.Transaction := DModule.pFIBT_Write;
            check.Transaction.StartTransaction;

            check.StoredProcName := 'HL_DT_CHECK_PERIOD';
            check.Prepare;
            check.ParamByName('PERIOD_END').Value := HP_AddPHol.qFDC_DEnd.Value;
            check.ParamByName('ID_HOLIDAY_PERIOD').AsInt64 := HP_AddPHol.qFSC_Period.Value;
            check.ExecProc;
            check.Transaction.Commit;
            if (check.ParamByName('CAN_EXEC').Value = 0) then
            begin
                agMessageDlg('Увага', 'Період відпустки не може виходити за період трудового договору!', mtInformation,
                    [mbOK]);
                exit;
            end;
            check.Close;
            check.Free;
            SP := TpFibStoredProc.Create(self);
            SP.Database := DModule.pFIBD_HP;
            SP.Transaction := DModule.pFIBT_Write;
            SP.Transaction.StartTransaction;

            SP.StoredProcName := 'HL_DT_MAN_HOLIDAY_PLAN_INS_EXT';
            SP.Prepare;

            SP.ParamByName('ID_TYPE_HOLIDAY').Value := HP_AddPHol.qFSC_HType.Value;
            SP.ParamByName('ID_HOLIDAY_PERIOD').AsInt64 := HP_AddPHol.qFSC_Period.Value;
            SP.ParamByName('period_beg').AsDate := HP_AddPHol.qFDC_DBeg.Value;
            SP.ParamByName('period_end').AsDate := HP_AddPHol.qFDC_DEnd.Value;
            SP.ParamByName('days_count').Value := HP_AddPHol.qFIC_Days.Value;
            SP.ParamByName('note').Value := HP_AddPHol.cxM_Note.Text;
            SP.ParamByName('used_days').Value := HP_AddPHol.qFIC_Fact.Value;
            SP.ExecProc;
            SP.Transaction.Commit;
            SP.Close;
            SP.Free;

            DModule.pFIBDS_HP_Full.Close;
            DModule.pFIBDS_HP_Full.Open;

            HP_View.ViewData.Expand(true);

            DModule.pFIBDS_HP_Full.Locate('ID_HOLIDAY_PERIOD', IdholPeriod, []);
        end
        else
        begin
            RefreshAExecute(Self);
            DModule.pFIBDS_HP_Full.Locate('ID_HOLIDAY_PERIOD', IdholPeriod, []);
        end;
        HP_AddPHol.Free;

    except on E: Exception do
        begin
            qFErrorDialog('Неможливо додати відпустку!' + #10 + #13 + E.Message);
            Exit;
        end;
    end;

end;

procedure THP_FullForm.ModifAExecute(Sender: TObject);
var
    HP_AddPHol: THP_AddPlanHol;
    error, id: integer;
    SP: TpFibStoredProc;
    UserStr, DateTimeStr: string;
begin
    error := fibCheckPermission('/ROOT/UpHolidayPlan', 'Edit');
    if error <> 0 then
    begin
        agMessageDlg('Увага', 'Ви не маєте прав виконати цю дію!', mtInformation, [mbOK]);
        exit;
    end;
    try
        if VarIsNull(DModule.pFIBDS_HP_Full['ID_MAN_HOLIDAY_PLAN']) then
        begin
            qFErrorDialog('Немає записів для внесення змін!');
            Exit;
        end;
        can_edit := 0;
        HP_AddPHol := THP_AddPlanHol.Create(Self, DModule, fmModify, DModule.pFIBDS_HP_Full['ID_MAN_HOLIDAY_PLAN']);
        HP_AddPHol.can_add_hol := can_add_hol;

        HP_AddPHol.qFIC_Fact.Blocked := True;
        UserStr := '';
        DateTimeStr := ' ';

        if varIsNull(DModule.pFIBDS_HP_Full.FieldValues['USER_FIO_HST']) then
            UserStr := ' '
        else
            UserStr := DModule.pFIBDS_HP_Full.FieldValues['USER_FIO_HST'];

        if UserStr = 'Unknown' then
            UserStr := 'Не визначений користувач';
        HP_AddPHol.UserLabel.Width := 300;
        HP_AddPHol.UserLabel.Caption := HP_AddPHol.UserLabel.Caption + UserStr;

        if VarIsNull(DModule.pFIBDS_HP_Full.FieldValues['DATE_TIME_HST']) then
            DateTimeStr := ' '
        else
            DateTimeStr := DateTimeToStr(DModule.pFIBDS_HP_Full.FieldValues['DATE_TIME_HST']);
        HP_AddPHol.DateTimeLabel.Width := 300;
        HP_AddPHol.DateTimeLabel.Caption := HP_AddPHol.DateTimeLabel.Caption + DateTimeStr;
        HP_AddPHol.qFIC_PPBeg.Value := DModule.pFIBDS_HP_Full['PLAN_PERIOD_BEG'];
        HP_AddPHol.qFIC_PPEnd.Value := DModule.pFIBDS_HP_Full['REAL_DATE_END'];
        HP_AddPHol.qFIC_Group.Value := DModule.pFIBDS_HP_Full['ID_GROUP_HOLIDAY'];
        HP_AddPHol.VisibleDays := True;
        HP_AddPHol.VisibleDates := True;

        if not VarIsNull(Id_Pcard) then
        begin
            HP_AddPHol.qFSC_People.Blocked := True;
        end;

        if VarIsNull(DModule.pFIBDS_HP_Full.FieldValues['NOTE']) then
        begin
            HP_AddPHol.cxM_Note.Lines.Clear;
            HP_AddPHol.cxM_Note.Lines.Add('');
        end
        else
        begin
            HP_AddPHol.cxM_Note.Lines.Clear;
            HP_AddPHol.cxM_Note.Lines.Add(DModule.pFIBDS_HP_Full.FieldValues['NOTE']);
        end;

        id := DModule.pFIBDS_HP_Full.FieldValues['id_man_holiday_plan'];

        if (HP_AddPHol.ShowModal = mrOk) then
        begin
            SP := TpFibStoredProc.Create(self);
            SP.Database := DModule.pFIBD_HP;
            SP.Transaction := DModule.pFIBT_Write;
            DModule.pFIBT_Write.StartTransaction;
            StartHistory(DModule.pFIBT_Write);
            SP.StoredProcName := 'HL_DT_MAN_HOLIDAY_PLAN_INS_EXT';
            SP.Prepare;
            SP.ParamByName('id_man_holiday_plan_in').AsInt64 :=
                DModule.pFIBDS_HP_Full.FieldValues['id_man_holiday_plan'];
            SP.ParamByName('id_type_holiday').AsInt64 := HP_AddPHol.qFSC_HType.Value;
            SP.ParamByName('id_holiday_period').AsInt64 := HP_AddPHol.qFSC_Period.Value;
            SP.ParamByName('period_beg').AsDate := HP_AddPHol.qFDC_DBeg.Value;
            SP.ParamByName('period_end').AsDate := HP_AddPHol.qFDC_DEnd.Value;
            SP.ParamByName('days_count').Value := HP_AddPHol.qFIC_Days.Value;
            SP.ParamByName('note').Value := HP_AddPHol.cxM_Note.Text;
            SP.ParamByName('used_days').Value := HP_AddPHol.qFIC_Fact.Value;

            SP.ExecProc;
            SP.Close;
            SP.Free;
            DModule.pFIBT_Write.Commit;

            DModule.pFIBDS_HP_Full.Close;
            DModule.pFIBDS_HP_Full.Open;
            RefreshAExecute(sender);
            HP_View.ViewData.Expand(true);
            DModule.pFIBDS_HP_Full.Locate('ID_MAN_HOLIDAY_PLAN', id, []);
        end
        else
        begin
            RefreshAExecute(Self);
            DModule.pFIBDS_HP_Full.Locate('ID_MAN_HOLIDAY_PLAN', id, []);
        end;
        HP_AddPHol.Free;

    except on E: Exception do
        begin
            showmessage('ff' + E.Message);
            Exit;
        end;
    end;

end;

procedure THP_FullForm.DelAExecute(Sender: TObject);
var
    error: integer;
    SP: TpFibStoredProc;
begin
    error := fibCheckPermission('/ROOT/UpHolidayPlan', 'Del');

    if error <> 0 then
    begin
        agMessageDlg('Увага', 'Ви не маєте прав виконати цю дію!', mtInformation, [mbOK]);
        exit;
    end;

    try
        if qFConfirm('Ви дійсно бажаєте видалити запис:' + #10#13 +
            VarToStr(DModule.pFIBDS_HP_Full['WORK_POST_STR']) + '-' +
            DModule.pFIBDS_HP_Full['PERIOD_STR'] + #10#13 +
            DModule.pFIBDS_HP_Full['HOL_NAME']) then
        begin

            if VarIsNull(DModule.pFIBDS_HP_Full['ID_MAN_HOLIDAY_PLAN']) then
            begin
                qFErrorDialog('Немає записів для вилучення!');
                Exit;
            end;

            if DModule.pFIBDS_HP_Full['can_delete'] = 0 then
            begin
                qFErrorDialog('Цей запис вже не можна вилучити!');
                Exit;
            end;
            with DModule do
            try
                SP := TpFibStoredProc.Create(self);
                SP.Database := DModule.pFIBD_HP;
                SP.Transaction := DModule.pFIBT_Write;
                DModule.pFIBT_Write.StartTransaction;
                StartHistory(DModule.pFIBT_Write);
                SP.StoredProcName := 'HL_DT_MAN_HOLIDAY_PLAN_DEL';
                SP.Prepare;
                SP.ParamByName('id_man_holiday_plan').Value := pFIBDS_HP_Full['ID_MAN_HOLIDAY_PLAN'];
                SP.ExecProc;
                SP.Close;
                SP.Free;
                pFIBT_Write.Commit;
            except on e: Exception do
                begin
                    qFErrorDialog('Не вдалося вилучити цей запис:' + #10 + #13 + e.Message);
                    pFIBT_Write.Rollback;
                end;
            end;
            RefreshAExecute(Sender);
            HP_View.ViewData.Expand(true);
        end;
    except on E: Exception do
        begin
            Exit;
        end;
    end;

end;

procedure THP_FullForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if (FormStyle = fsMDIChild) then
        Action := caFree;
end;

procedure THP_FullForm.RefreshAExecute(Sender: TObject);
begin
    if VarIsNull(qFSC_PrivateCard.Value) then
    begin
        Exit;
    end;
    DModule.pFIBDS_HP_Full.Close;
    DModule.pFIBDS_HP_Full.ParamByName('ActDate').AsDate := qFDC_ActDate.Value;
    DModule.pFIBDS_HP_Full.ParamByName('only_valid').value := CheckOnlyValid.Checked;
    DModule.pFIBDS_HP_Full.ParamByName('id_pcard').AsVariant := qFSC_PrivateCard.Value;
    id_pcard := qFSC_PrivateCard.Value;
    DModule.pFIBDS_HP_Full.Open;
    FilterLabel.Visible := False;
    HP_View.ViewData.Expand(true);
end;

procedure THP_FullForm.CancelAExecute(Sender: TObject);
begin
    Close;
end;

procedure THP_FullForm.qFDC_ActDateChange(Sender: TObject);
begin
    DModule.pFIBDS_HP_Full.Close;
    FilterLabel.Visible := True;
end;

procedure THP_FullForm.FormAExecute(Sender: TObject);
var
    HP_RecalcForm: THP_RecalcForm;
    key_session: Int64;
    error: integer;
begin
    error := fibCheckPermission('/ROOT/UpHolidayPlan', 'CONFIGURE');
    if error <> 0 then
    begin
        agMessageDlg('Увага', 'Ви не маєте прав виконати цю дію!', mtInformation, [mbOK]);
        exit;
    end;

    HP_RecalcForm := THP_RecalcForm.Create(Self, DModule);

    if (HP_RecalcForm.ShowModal = mrOk) then
    begin
        key_session := HP_RecalcForm.key_session;
        DModule.pFIBQ_GeneratePeriods.SQL.Text := GenPeriodsA;
        HolidayGenerate(key_session, HP_RecalcForm.qFEC_Interval.Value, HP_RecalcForm.qFEC_Level.Value);
    end;
    HP_RecalcForm.Free;
end;

procedure THP_FullForm.FormOneAExecute(Sender: TObject);
var
    HP_SelectPeople: THP_SelectPeople;
    key_session: Int64;
    error: integer;
begin
    error := fibCheckPermission('/ROOT/UpHolidayPlan', 'CONFIGURE');
    if error <> 0 then
    begin
        agMessageDlg('Увага', 'Ви не маєте прав виконати цю дію!', mtInformation, [mbOK]);
        exit;
    end;

    HP_SelectPeople := THP_SelectPeople.Create(Self, DModule);

    if (HP_SelectPeople.ShowModal = mrOk) then
    begin
        key_session := HP_SelectPeople.key_session;
        DModule.pFIBQ_GeneratePeriods.SQL.Text := GenPeriodsP;
        HolidayGenerate(key_session, HP_SelectPeople.qFEC_Interval.Value, HP_SelectPeople.qFEC_Level.Value);
    end;

    HP_SelectPeople.Free;
    DModule.pFIBDS_HP_Full.Close;
    DModule.pFIBDS_HP_Full.Open;
    HP_View.ViewData.Expand(True);
end;

procedure THP_FullForm.HolidayGenerate(key_session: int64; Interval, Level: Int64);
var
    sp: TSprav;
    NagScreen: TNagScreen;
begin
    NagScreen := TNagScreen.Create(nil);
    NagScreen.Show;
    NagScreen.SetStatusText('Формуються планові відпустки...');

    with DModule do
    try
        pFIBT_Write.StartTransaction;

        pFIBQ_GeneratePeriods.ParamByName('id_key').AsInt64 := key_session;
        pFIBQ_GeneratePeriods.ParamByName('act_year').AsInteger := Interval;
        pFIBQ_GeneratePeriods.ParamByName('id_level').AsInteger := Level;

        pFIBQ_GeneratePeriods.ExecProc;

        pFIBDS_GetPeriods.ParamByName('id_key').AsInt64 := key_session;
        pFIBDS_GetPeriods.ParamByName('ACT_YEAR').AsInt64 := Interval;
        pFIBDS_GetPeriods.ParamByName('ID_LEVEL').AsInt64 := Level;
        pFIBDS_GetPeriods.Open;
        pFIBDS_GetPeriods.First;

        if pFIBDS_GetPeriods.IsEmpty then
        begin
            NagScreen.Free;
            qFErrorDialog('Не було сформовано жодного періоду!');
            pFIBT_Write.Rollback;
            Exit;
        end;

        while (not pFIBDS_GetPeriods.Eof) do

        begin
            pFIBDS_GetActBpl.Close;
            pFIBDS_GetActBpl.ParamByName('act_date').AsDate := pFIBDS_GetPeriods['period_beg'];
            pFIBDS_GetActBpl.Open;

            if pFIBDS_GetActBpl.IsEmpty then
            begin
                NagScreen.Free;
                qFErrorDialog('Помилка розрахунку планових відпусток: немає модуля!');
                pFIBT_Write.Rollback;
                Exit;
            end
            else
            begin
                sp := GetSprav('up\' + pFIBDS_GetActBpl['bpl_name']);

                if sp <> nil then
                begin
                    with sp.Input do
                    begin
                        Append;
                        FieldValues['DBHandle'] := Integer(pFIBD_HP.Handle);
                        FieldValues['period_beg'] := pFIBDS_GetPeriods['period_beg'];
                        FieldValues['period_end'] := pFIBDS_GetPeriods['period_end'];
                        FieldValues['id_work_dog_moving'] := pFIBDS_GetPeriods['id_work_dog_moving'];
                        Post;
                    end;

                    sp.Show;

                    if (sp.Output <> nil) and (not sp.Output.IsEmpty) then
                    begin
                        sp.OutPut.First;
                        while (not sp.OutPut.Eof) do
                        begin
                            Pfibds_Addholiday.ParamByName('Id_Type_Holiday').AsInt64 := Sp.Output['Id_Type_Holiday'];
                            Pfibds_Addholiday.ParamByName('Id_Holiday_Period').AsInt64 :=
                                pFIBDS_GetPeriods['Id_Holiday_Period'];
                            Pfibds_Addholiday.ParamByName('Id_Work_Dog_Moving').AsInt64 :=
                                pFIBDS_GetPeriods['Id_Work_Dog_Moving'];
                            Pfibds_Addholiday.ParamByName('Period_Beg').AsDate := Sp.Output['Period_Beg'];
                            Pfibds_Addholiday.ParamByName('Period_End').AsDate := Sp.Output['Period_End'];
                            Pfibds_Addholiday.ParamByName('Days_Count').Asinteger := Sp.Output['Days_Count'];
                            Pfibds_Addholiday.ParamByName('Used_Days_Count').Value := 0;
                            Pfibds_Addholiday.ParamByName('Can_Delete').AsInteger := 1;
                            Pfibds_Addholiday.ParamByName('Note').Asstring := Sp.Output['Note'];
                            Pfibds_Addholiday.ParamByName('Real_Period_End').AsDate := Sp.Output['Period_End'];
                            Pfibds_Addholiday.ParamByName('Real_Days_Count').Asinteger := Sp.Output['Days_Count'];
                            sp.OutPut.Next;

                            pFIBDS_AddHoliday.Open;

                            if (not (VarIsNull(pFIBDS_AddHoliday['ID_MAN_HOLIDAY_PLAN_OUT']))) then
                            begin
                                pFIBQ_AddForBuff.ParamByName('id_key').AsInt64 := key_session;
                                pFIBQ_AddForBuff.ParamByName('id_mh').AsInt64 :=
                                    pFIBDS_AddHoliday['ID_MAN_HOLIDAY_PLAN_OUT'];

                                pFIBQ_AddForBuff.ExecProc;
                            end;

                            pFIBDS_AddHoliday.Close;

                        end;
                    end;
                end;
                sp.Free;
            end;
            pFIBDS_GetPeriods.Next;
        end;

        pFIBT_Write.Commit;
        NagScreen.Free;
        ShowReport(key_session);
    except on e: exception do
        begin
            NagScreen.Free;
            pFIBT_Write.Rollback;
            qFErrorDialog('Помилка розрахунку планових відпусток:' + #10 + #13 + e.Message);
        end;
    end;
end;

procedure THP_FullForm.ShowReport(key_session: Int64);
var
    sp: TSprav;
begin
    if (qFConfirm('Формування планових відпусток завершено!' + #10#13 + 'Бажаєте надрукувати звіт?')) then
    begin
        sp := GetSprav('up\HL_FilterPrtPlanFact70');
        if sp <> nil then
        begin
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(DModule.pFIBD_HP.Handle);
                FieldValues['mode'] := 0;
                FieldValues['key_session'] := key_session;
                Post;
            end;
            sp.Show;
        end;
        sp.Free;
    end;
end;

procedure THP_FullForm.qFSC_PrivateCardOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    sp := GetSprav('asup\PCardsList');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DModule.pFIBD_HP.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['AdminMode'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['ShowStyle'] := 0;
            FieldValues['NewVersion'] := 1;
            Post;
        end;
        sp.Show;

        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];

            if VarIsNull(Value) then
            begin
                Exit;
            end;
            DModule.pFIBDS_HP_Full.Close;
            DModule.pFIBDS_HP_Full.ParamByName('ActDate').AsDate := qFDC_ActDate.Value;
            DModule.pFIBDS_HP_Full.ParamByName('only_valid').value := CheckOnlyValid.Checked;
            DModule.pFIBDS_HP_Full.ParamByName('id_pcard').AsVariant := Value;
            id_pcard := qFSC_PrivateCard.Value;
            DModule.pFIBDS_HP_Full.Open;
            FilterLabel.Visible := False;
            HP_View.ViewData.Expand(true);
        end;
    end;
end;

procedure THP_FullForm.AddPeriodAExecute(Sender: TObject);
var
    HP_AddPeriod: THP_AddPeriod;
    error: Integer;
begin
    error := fibCheckPermission('/ROOT/UpHolidayPlan', 'Add');

    if error <> 0 then
    begin
        ShowMessage('Ви не маєте прав виконати цю дію!');
        Exit;
    end;

    if (VarIsNull(id_pcard)) then
    begin
        qFErrorDialog('Спочатку оберіть людину для фільтрації!');
        Exit;
    end;

//    DModule.DSetGroupHoliday.CloseOpen(true);

    HP_AddPeriod := THP_AddPeriod.Create(Self, DModule, fmAdd, Null);

    HP_AddPeriod.can_add_hol := can_add_hol;

    with HP_AddPeriod do
    begin
        AddParametrs := TRxMemoryData.Create(Self);

        AddParametrs.FieldDefs.Add('ID_PCARD', ftVariant);
        AddParametrs.Open;
        AddParametrs.Append;
        AddParametrs['ID_PCARD'] := id_pcard;
        AddParametrs.Post;

        qFSC_Moving.DisplayText := DModule.pFIBDS_HP_Full['WORK_POST_STR'];
        qFSC_Moving.Value := DModule.pFIBDS_HP_Full['ID_WORK_DOG_MOVING'];
        qFIC_MBeg.SetValue(DModule.pFIBDS_HP_Full['WORK_BEG']);
        qFIC_MEnd.SetValue(DModule.pFIBDS_HP_Full['WORK_END']);
        WorkEnd := EncodeDate(9999, 12, 31);

        DModule.DSetGroupHoliday.CloseOpen(true);

        if not DModule.pFIBDS_HP_Full.IsEmpty then
        begin
            NewPeriods.Close;
            NewPeriods.SQLs.SelectSQL.Text :=
                'select date_beg, date_end, is_end from  HL_CALC_NEW_PERIODS(:id_work_dog_moving, :id_group_holiday)';
            NewPeriods.ParamByName('id_work_dog_moving').AsInteger := DModule.pFIBDS_HP_Full['ID_WORK_DOG_MOVING'];
            NewPeriods.ParamByName('id_group_holiday').AsVariant := DModule.pFIBDS_HP_Full['ID_GROUP_HOLIDAY'];
            NewPeriods.Open;

            qFDC_PBeg.Value := NewPeriods['date_beg'];
            qFDC_PEnd.Value := NewPeriods['date_end'];
            WorkEnd := DModule.pFIBDS_HP_Full['WORK_end'];

            DModule.DSetGroupHoliday.CloseOpen(true);

            if (DModule.pFIBDS_Consts['USE_GROUP_HOLIDAY'] = 1) then
            begin
                GroupComboBox.Visible := True;
                lblGroup.Visible := True;
                GroupComboBox.EditValue := DModule.pFIBDS_HP_Full['ID_GROUP_HOLIDAY'];
            end
            else
            begin
                GroupComboBox.Visible := False;
                lblGroup.Visible := False;
                GroupComboBox.EditValue := DModule.pFIBDS_Consts['ID_GROUP_ANNUAL_HOLIDAY'];
            end;

        end
        else
        begin
            if (DModule.pFIBDS_Consts['USE_GROUP_HOLIDAY'] = 1) then
            begin
                GroupComboBox.Visible := True;
                lblGroup.Visible := True;
            end
            else
            begin
                GroupComboBox.Visible := False;
                lblGroup.Visible := False;
            end;
            GroupComboBox.EditValue := DModule.pFIBDS_Consts['ID_GROUP_ANNUAL_HOLIDAY'];
        end;

    end;

    if (HP_AddPeriod.ShowModal = mrOk) then
    begin
        DModule.pFIBDS_HP_Full.Close;
        DModule.pFIBDS_HP_Full.Open;
        HP_View.ViewData.Expand(true);
        DModule.pFIBDS_HP_Full.Locate('ID_HOLIDAY_PERIOD', HP_AddPeriod.qFFormControl1.LastId, []);
    end
    else
    begin
        RefreshAExecute(Self);
    end;
    
    HP_AddPeriod.Free;
end;

procedure THP_FullForm.PrintAExecute(Sender: TObject);
var
    sp: TSprav;
    error: integer;
begin
    error := fibCheckPermission('/ROOT/UpHolidayPlan', 'Print');
    if error <> 0 then
    begin
        ShowMessage('Помилка безпеки! Ви не маєте прав!');
        exit;
    end;
    sp := GetSprav('up\HL_FilterPrtPlanFact70');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DModule.pFIBD_HP.Handle);
            FieldValues['mode'] := 1;
            Post;
        end;
        sp.Show;
    end;
    sp.Free;
end;

procedure THP_FullForm.Action1Execute(Sender: TObject);
begin
    ShowInfo(DModule.pFIBDS_HP_Full);
end;

procedure THP_FullForm.Edt_canExecute(Sender: TObject);
begin
    can_edit := 1;
end;

procedure THP_FullForm.FormCreate(Sender: TObject);
var
    tv: string;
begin
    can_edit := 0;
    tv := '';
    tv := KYVLoadFromRegistry('THP_FullForm_CheckGroupDog', GetUserId);
    if (tv = '0') or (tv = '1') then
    begin
        CheckGroupDog.Checked := Boolean(StrToInt(tv));
        CheckGroupDog.Properties.OnChange(Self);
    end;
end;

procedure THP_FullForm.dxBLB_Modif_PerClick(Sender: TObject);
var
    HP_AddPeriod: THP_AddPeriod;
    error: integer;
    IdHolidayPeriod: Integer;
begin
    error := fibCheckPermission('/ROOT/UpHolidayPlan', 'Edit');

    if error <> 0 then
    begin
        ShowMessage('Ви не маєте прав виконати цю дію!');
        exit;
    end;

    try
        if not VarIsNull(DModule.pFIBDS_HP_Full['ID_HOLIDAY_PERIOD']) then
        begin
            IdHolidayPeriod := DModule.pFIBDS_HP_Full['ID_HOLIDAY_PERIOD'];
            HP_AddPeriod := THP_AddPeriod.Create(Self, DModule, fmModify, DModule.pFIBDS_HP_Full['ID_HOLIDAY_PERIOD']);

            DModule.DSetGroupHoliday.Close;
            DModule.DSetGroupHoliday.Open;

            HP_AddPeriod.can_add_hol := can_add_hol;
            with HP_AddPeriod do
            begin
                AddParametrs := TRxMemoryData.Create(Self);

                AddParametrs.FieldDefs.Add('id_pcard', ftVariant);
                AddParametrs.Open;
                AddParametrs.Append;
                AddParametrs['id_pcard'] := id_pcard;
                AddParametrs.Post;
                if not VarIsNull(DModule.pFIBDS_HP_Full['WORK_end']) then
                    WorkEnd := DModule.pFIBDS_HP_Full['WORK_end'];
                if (DModule.pFIBDS_Consts['USE_GROUP_HOLIDAY'] = 1) then
                begin
                    lblGroup.Visible := True;
                    GroupComboBox.Visible := True
                end
                else
                begin
                    lblGroup.Visible := False;
                    GroupComboBox.Visible := False;
                end;

                if not (VarIsNull(DModule.pFIBDS_HP_Full['ID_MAN_HOLIDAY_PLAN'])) then
                    GroupComboBox.Enabled := False;
            end;

            if (HP_AddPeriod.ShowModal = mrOk) then
            begin
                DModule.pFIBDS_HP_Full.Close;
                DModule.pFIBDS_HP_Full.Open;
                HP_View.ViewData.Expand(true);
                DModule.pFIBDS_HP_Full.Locate('ID_HOLIDAY_PERIOD', IdHolidayPeriod, []);
            end;

            HP_AddPeriod.Free;
        end;

    except on E: Exception do
        begin
            showmessage('ff' + E.Message);
            Exit;
        end;
    end;

end;

procedure THP_FullForm.dxBLB_Del_PerClick(Sender: TObject);
var
    error: integer;
    SP: TpFibStoredProc;
    post_per: string;
begin
    error := fibCheckPermission('/ROOT/UpHolidayPlan', 'Del');
    if error <> 0 then
    begin
        ShowMessage('Ви не маєте прав виконати цю дію!');
        exit;
    end;

    try
        if VarIsNull(DModule.pFIBDS_HP_Full['WORK_POST_STR']) then
            post_per := ''
        else
            post_per := DModule.pFIBDS_HP_Full['WORK_POST_STR'];

        if VarIsNull(DModule.pFIBDS_HP_Full['PERIOD_STR']) then
        begin
            if VarIsNull(DModule.pFIBDS_HP_Full['WORK_POST_STR']) then
                post_per := '-' + ''
            else
                post_per := post_per + '-' + '';
        end
        else
        begin
            if VarIsNull(DModule.pFIBDS_HP_Full['WORK_POST_STR']) then
                post_per := post_per + DModule.pFIBDS_HP_Full['PERIOD_STR']
            else
                post_per := post_per + '-' + DModule.pFIBDS_HP_Full['PERIOD_STR'];
        end;

        if qFConfirm('Ви дійсно бажаєте видалити цей період:' + #10#13 +
            post_per) then
        begin
            if VarIsNull(DModule.pFIBDS_HP_Full['ID_HOLIDAY_PERIOD']) then
            begin
                qFErrorDialog('Немає записів для вилучення!');
                Exit;
            end;

            with DModule do
            try
                SP := TpFibStoredProc.Create(self);
                SP.Database := DModule.pFIBD_HP;
                SP.Transaction := DModule.pFIBT_Write;
                DModule.pFIBT_Write.StartTransaction;
                StartHistory(DModule.pFIBT_Write);
                SP.StoredProcName := 'HL_DT_HOLIDAY_PERIODS_DEL';
                SP.Prepare;
                SP.ParamByName('ID_HOLIDAY_PERIOD').Value := pFIBDS_HP_Full['ID_HOLIDAY_PERIOD'];
                SP.ExecProc;
                SP.Close;
                SP.Free;
                pFIBT_Write.Commit;

            except on e: Exception do
                begin
                    qFErrorDialog('Не вдалося вилучити цей запис:' + #10 + #13 + e.Message);
                    pFIBT_Write.Rollback;
                end;
            end;
            RefreshAExecute(Sender);
            HP_View.ViewData.Expand(true);
        end;
    except on E: Exception do
        begin
            qFErrorDialog('Неможливо видалити період!' + #10 + #13 + E.Message);
            Exit;
        end;
    end;

end;

procedure THP_FullForm.CheckOnlyValidPropertiesChange(Sender: TObject);
begin
    if VarIsNull(qFSC_PrivateCard.Value) then
    begin
        Exit;
    end;
    DModule.pFIBDS_HP_Full.Close;
    DModule.pFIBDS_HP_Full.ParamByName('ActDate').AsDate := qFDC_ActDate.Value;
    DModule.pFIBDS_HP_Full.ParamByName('only_valid').value := CheckOnlyValid.Checked;
    DModule.pFIBDS_HP_Full.ParamByName('id_pcard').AsVariant := qFSC_PrivateCard.Value;
    id_pcard := qFSC_PrivateCard.Value;
    DModule.pFIBDS_HP_Full.Open;
    FilterLabel.Visible := False;
    HP_View.ViewData.Expand(true);

end;

procedure THP_FullForm.HP_ViewCellClick(Sender: TcxCustomGridTableView;
    ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
    AShift: TShiftState; var AHandled: Boolean);
var
    UserStr, DateTimeStr: string;
begin
    UserStr := '';
    DateTimeStr := '';
    UserLabel.Caption := '';
    DateTimeLabel.Caption := '';
    if varIsNull(DModule.pFIBDS_HP_Full.FieldValues['USER_FIO_HST']) then
        UserStr := ' '
    else
        UserStr := DModule.pFIBDS_HP_Full.FieldValues['USER_FIO_HST'];
    if UserStr = 'Unknown' then
        UserStr := 'Не визначений користувач';
    UserLabel.Width := 300;
    UserLabel.Caption := 'Редагував: ' + UserStr;
    if VarIsNull(DModule.pFIBDS_HP_Full.FieldValues['DATE_TIME_HST']) then
        DateTimeStr := ' '
    else
        DateTimeStr := DateTimeToStr(DModule.pFIBDS_HP_Full.FieldValues['DATE_TIME_HST']);
    DateTimeLabel.Width := 300;
    DateTimeLabel.Caption := 'Дата та час зміни: ' + DateTimeStr;
end;

procedure THP_FullForm.ActHistHolidaysExecute(Sender: TObject);
var
    frm: TfrmHistHol;
begin
    if VarIsNull(DModule.pFIBDS_HP_Full.FieldValues['id_man_holiday_plan']) then
    begin
        MessageDlg('Не вибрано запис!', mtInformation, [mbOK], 0);
        exit;
    end
    else
    begin
        frm := TfrmHistHol.Create(Self, DModule.pFIBDS_HP_Full.FieldValues['id_man_holiday_plan']);
        frm.ShowModal;
        frm.Free;
    end;
end;

procedure THP_FullForm.ActHistPeriodsExecute(Sender: TObject);
var
    frm: TfrmHistPeriods;
begin
    if VarIsNull(DModule.pFIBDS_HP_Full.FieldValues['id_holiday_period']) then
    begin
        MessageDlg('Не вибрано запис!', mtInformation, [mbOK], 0);
        exit;
    end
    else
    begin
        frm := TfrmHistPeriods.Create(Self, DModule.pFIBDS_HP_Full.FieldValues['id_holiday_period']);
        frm.ShowModal;
        frm.Free;
    end;
end;

end.

