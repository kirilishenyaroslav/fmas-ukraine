unit Orders2ViewUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Menus, IBDatabase, DB, IBCustomDataSet, IBQuery, StdCtrls,
    SpComboBox, ComCtrls, Buttons, DBCtrls, ExtCtrls, Grids, DBGrids, SpCommon, PersonalCommon,
    GoodFunctionsUnit, uActionControl, ActnList, FIBDataSet, pFIBDataSet,
    cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
    cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGrid, AccMgmt, NagScreenUnit, uCommonSP, Clipbrd, ShellApi, Mask,
    ToolEdit, uFControl, uLabeledFControl, uSpravControl, uBoolControl,
    uInvisControl;

type
    TOrders2ViewForm = class(TForm)
        Panel1: TPanel;
        SearchPanel: TPanel;
        SearchLabel: TLabel;
        Label5: TLabel;
        SearchNextButton: TSpeedButton;
        AllLabel: TLabel;
        SearchEdit: TEdit;
        ButtonsPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        SpeedButton2: TSpeedButton;
        SignButton: TSpeedButton;
        StopButton: TSpeedButton;
        DoButton: TSpeedButton;
        FormButton: TSpeedButton;
        CancelButton: TSpeedButton;
        UnFormButton: TSpeedButton;
        SelectButton: TSpeedButton;
        FilterBox: TGroupBox;
        FilterDateEnd: TCheckBox;
        FilterDateBeg: TCheckBox;
        SortMenu: TPopupMenu;
        N1: TMenuItem;
        Nomer: TMenuItem;
        Typ: TMenuItem;
        DateSort: TMenuItem;
        DateSort2: TMenuItem;
        N3: TMenuItem;
        ActionList: TActionList;
        AddOrder: TAction;
        OrdersActionControl: TqFActionControl;
        ModifyOrder: TAction;
        DeleteOrder: TAction;
        ViewOrder: TAction;
        PrintOrder: TAction;
        CloseForm: TAction;
        RefreshList: TAction;
        InputQuery: TpFIBDataSet;
        InputQueryID_ORDER: TFIBIntegerField;
        InputQueryNUM_ORDER: TFIBStringField;
        InputQueryDATE_ORDER: TFIBDateField;
        InputQueryNOTE: TFIBStringField;
        InputQueryID_STATUS: TFIBIntegerField;
        InputQueryEXEC_DATETIME: TFIBDateTimeField;
        InputQueryPRINT_NAME: TFIBStringField;
        InputQueryINTRO: TFIBStringField;
        InputQueryISPOLNITEL: TFIBStringField;
        InputQueryOWNER_ID_USER: TFIBIntegerField;
        InputQueryNUM_ORDER_INTERNAL: TFIBStringField;
        OrderGrid: TcxGrid;
        OrderGridDBTableView1: TcxGridDBTableView;
        OrderGridLevel1: TcxGridLevel;
        OrderGridDBTableView1DBColumn1: TcxGridDBColumn;
        OrderGridDBTableView1DBColumn2: TcxGridDBColumn;
        Source: TDataSource;
        OrderGridDBTableView1DBColumn3: TcxGridDBColumn;
        OrderGridDBTableView1DBColumn4: TcxGridDBColumn;
        Label1: TLabel;
        StatusText: TDBText;
        InputQueryNAME_STATUS: TFIBStringField;
        DoneQuery: TpFIBDataSet;
        DoneQueryID_ORDER: TFIBIntegerField;
        DoneQueryID_ORDER_TYPE: TFIBIntegerField;
        DoneQueryID_STATUS: TFIBIntegerField;
        DoneQueryNUM_ORDER: TFIBStringField;
        DoneQueryDATE_ORDER: TFIBDateField;
        DoneQueryNOTE: TFIBStringField;
        OutputQuery: TIBQuery;
        InfoButton: TSpeedButton;
        AcceptFilterButton: TSpeedButton;
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
        OrderGridDBTableView1DBColumn5: TcxGridDBColumn;
        RefreshFilterAction: TAction;
        OrderGridDBTableView1DBColumn6: TcxGridDBColumn;
        InputQueryNUM_ORDER_KADR: TFIBStringField;
        InputQueryDATE_ORDER_KADR: TFIBDateField;
        OrderGridDBTableView1DBColumn7: TcxGridDBColumn;
        Label2: TLabel;
        PrintName: TDBText;
        DateBeg: TDateEdit;
        DateEnd: TDateEdit;
        Fio: TqFSpravControl;
        FilterFio: TCheckBox;
        FilterShowDeleted: TqFBoolControl;
        IdUser: TqFInvisControl;
        procedure FormResize(Sender: TObject);
        constructor Create(aOwner: TComponent); reintroduce;
        procedure FilterAccept;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CloseFormExecute(Sender: TObject);
        procedure OrdersActionControlBeforePrepare(Sender: TObject;
            Form: TForm);
        procedure DoButtonClick(Sender: TObject);
        procedure OrderGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure InputQueryAfterScroll(DataSet: TDataSet);
        procedure UnFormButtonClick(Sender: TObject);
        procedure FormButtonClick(Sender: TObject);
        procedure PrintOrderExecute(Sender: TObject);
        procedure InputQueryAfterOpen(DataSet: TDataSet);
        procedure SearchEditChange(Sender: TObject);
        procedure SearchNextButtonClick(Sender: TObject);
        procedure AllLabelClick(Sender: TObject);
        procedure OrderGridDBTableView1CustomDrawCell(
            Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
            AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
        procedure RefreshFilterActionExecute(Sender: TObject);
        procedure FioOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FilterFioClick(Sender: TObject);
    private
        id_server, Id_PCard: Integer;

    public
    { Public declarations }
    end;

var
    Orders2ViewForm: TOrders2ViewForm;

implementation

uses Orders2EditUnit, SpFormUnit;

{$R *.dfm}

constructor TOrders2ViewForm.Create(aOwner: TComponent);
begin
    inherited Create(aOwner);

    InputQuery.Transaction := PersonalCommon.FIBReadTransaction;
    DoneQuery.Transaction := PersonalCommon.FIBReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;

    OrdersActionControl.SelectDataSet := InputQuery;

    //Фильтр на день
    DateBeg.Date := Date;
    DateEnd.Date := Date;

    id_pcard := -1;

    OrdersActionCOntrol.DeleteSQL.Text := 'EXECUTE PROCEDURE ASUP_ORDERS_DELETE(:where, ' +
        IntToStr(GetUserId) + ')';

    FilterShowDeleted.Visible := AdminMode;

    FilterAccept;
end;

procedure TOrders2ViewForm.FilterAccept;
begin

    InputQuery.Close;

    if FilterFio.Checked then begin
        if not VarIsNull(Fio.Value)
            then
            InputQuery.ParamByName('ID_PCARD').AsInteger := Fio.Value
        else
            InputQuery.ParamByName('ID_PCARD').AsVariant := null;
    end
    else
        InputQuery.ParamByName('ID_PCARD').AsVariant := null;

    if FilterDateBeg.Checked
        then
        InputQuery.ParamByName('FILTER_DATE_BEG').AsDate := DateBeg.Date
    else
        InputQuery.ParamByName('FILTER_DATE_BEG').AsVariant := null;

    if FilterDateEnd.Checked
        then
        InputQuery.ParamByName('FILTER_DATE_END').AsDate := DateEnd.Date
    else
        InputQuery.ParamByName('FILTER_DATE_END').AsVariant := null;

    if FilterShowDeleted.Value then
        InputQuery.ParamByName('FILTER_SHOW_DELETED').AsString := 'T'
    else
        InputQuery.ParamByName('FILTER_SHOW_DELETED').AsString := 'F';

    NAgScreen := TNagScreen.Create(Self);
    NagScreen.Show;
    NagScreen.SetStatusText('відбір даних...');

    InputQuery.Open;

    NagScreen.Free;
end;

procedure TOrders2ViewForm.FormResize(Sender: TObject);
begin
    FilterBox.Width := ButtonsPanel.Width - 5;
end;

procedure TOrders2ViewForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TOrders2ViewForm.CloseFormExecute(Sender: TObject);
begin
    Close;
end;

procedure TOrders2ViewForm.OrdersActionControlBeforePrepare(
    Sender: TObject; Form: TForm);
begin
    (Form as TOrders2EditForm).Id_Order := InputQueryID_ORDER.value;
end;

procedure TOrders2ViewForm.DoButtonClick(Sender: TObject);
var
    OLD_ID_ORDER, i: Integer;
    Form: TSpForm;
    Params: TSpParams;
    Nag: TNagScreen;
begin
    if InputQuery.IsEmpty then begin
        MessageDlg('Немає наказів!', mtError, [mbOK], 0);
        exit;
    end;

    if (InputQueryID_STATUS.Value = 5)
        then begin
        MessageDlg('Неможливо виконати цей наказ, бо він вже виконаний!', mtError, [mbOk], 0);
        Exit;
    end;

    //Если приказ ещё не сформирован, то не даем его выполнить

    if (InputQueryID_STATUS.Value = 1) and (not AdminMode) and (Version <> 2)
        then begin
        MessageDlg('Неможна виконати наказ, який ще не сформований!', mtError, [mbOk], 0);
        Exit;
    end;

{    if (GetUserId <> GetOrderOwner(InputQueryID_ORDER.Value, True)) AND (GetOrderOwner(InputQueryID_ORDER.Value, True) <> 0) and
            (not AdminMode)
    then begin
        ErrMsg('Ви не можете виконати цей наказ, його може виконати тільки власник. Власника можна змінити, для цього треба зайти під його паролем, відкрити наказ для редагування та змінити власника.');
        exit;
    end;}

    if CheckAccess('/ROOT/Orders', 'DONE', True) <> 0 then
        exit;

    if MessageDlg('Ви справді бажаєте виконати цей наказ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

    DoneQuery.Close;
    DoneQuery.ParamByName('ID_ORDER_GROUP').AsInt64 := InputQueryID_ORDER.Value;
    DoneQuery.Open;

    if DoneQuery.IsEmpty then begin
        MessageDlg('У цього наказу немає пунктів!', mtError, [mbOK], 0);
        exit;
    end;

    DoneQuery.First;

    if BufTran.InTransaction then BufTran.Rollback;

    BufTran.Start;

    Nag := TNagScreen.Create(self);
    Nag.SetStatusText('виконання наказу...');
    Nag.Show;

    while not DoneQuery.Eof do begin

        // Проверяем, а можно ли выполнять приказ

        Form := TSpForm.Create(self);
        Params := TSpPArams.Create;

        Params.SelectProcName := 'ORDER_CHECK_FOR_FORM(' + DoneQueryID_ORDER.AsString + ')';
        Params.SpFields := 'BAD_STRING';
        PArams.Title := 'Підстави чому неможливе разформування цього наказу';
        Params.ColumnNames := 'Підстава чому неможливе разформування цього наказу';
        Params.ReadOnly := True;
        Params.IdField := 'BAD_STRING';
        Params.ComboField := 'BAD_STRING';
        Params.SpMode := spmNormal;
        Params.DontHideFirstColumn := True;

        Form.Init(Params);

        if (not Form.ResultQuery.IsEmpty) then begin
            Nag.Close;
            Nag.free;

            Form.ShowModal;

            Params.Free;
            Form.Free;

            exit;
        end;

        Params.Free;
        Form.Free;

        //Здесь выполняется приказ

        try

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER(' + IntToStr(DoneQueryID_ORDER.Value) +
                ',' + IntToStr(DoneQueryID_ORDER_TYPE.Value) + ',' +
                QuotedStr(DoneQueryNUM_ORDER.value) + ',''' +
                DoneQueryDATE_ORDER.AsString + ''',' +
                QuotedStr(DoneQueryNOTE.value) + ',5);';
            ExecQuery(OutputQuery);

         //  Ставим Всем подписывающим статус "подписанный", но только если работаем в режиме Бога

            if AdminMode then begin
                OutputQuery.Close;
                OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER_SIGN_2(' + IntToStr(DoneQueryID_ORDER.Value) + ',3);';
                ExecQuery(OutputQuery);
            end;

            //
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER_EXECTIME_NOW(' + IntToStr(DoneQueryID_ORDER.Value) + ');';
            ExecQuery(OutputQuery);

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_UPDATE_MOVING_INFO(' + IntToStr(DoneQueryID_ORDER.Value) + ',5)';
            ExecQuery(OutputQuery);

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_ORDERS_UPDATE_STATUS(' + InputQueryID_ORDER.AsString + ',5)';
            ExecQuery(OutputQuery);

            // Write to Buffer

            // ******* Пишем Буфера *********

            //if PersonalCommon.Version = 1 then WriteOrderToDbf(1);
            //if PersonalCommon.Version = 2 then WriteOrderToDbf2(1);


        except on E: Exception
            do begin
                Nag.Close;
                Nag.free;
                MessageDlg('Виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
                BufTran.Rollback;
                exit;
            end;
        end;


        DoneQuery.Next;
    end;

    BufTran.Commit;

    Nag.Close;
    Nag.free;

        // Становимся на ту же запись в списке
    OLD_ID_ORDER := InputQueryID_ORDER.Value;
    InputQuery.Close;
    InputQuery.Open;
    InputQuery.Locate('ID_ORDER', OLD_ID_ORDER, []);
end;

procedure TOrders2ViewForm.OrderGridDBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Order_Group: ' + IntToStr(InputQueryId_Order.Value) +
            ' Exec_DateTime: ' + DateTimeToStr(InputQueryExec_DateTime.Value));

        Clipboard.AsText := IntToStr(InputQueryId_Order.Value);

        ShowMessage('id_user: ' + IntToStr(GetUserId) + '  id_owner: ' + IntToStr(InputQueryOWNER_ID_USER.Value) + '  ' + BoolToStr(AdminMode, True));
    except
    end;
end;

procedure TOrders2ViewForm.InputQueryAfterScroll(DataSet: TDataSet);
var Modif, Info: Boolean;

begin
    try
        if InputQuery.IsEmpty then begin
            ViewOrder.Visible := False;
            ModifyOrder.Visible := True;
            ViewOrder.Enabled := False;
            ModifyOrder.Enabled := True;
            exit;
        end;

        if InputQueryID_STATUS.Value <> 5 then begin
            Info := False;
            Modif := True;
        end
        else begin
            Info := True;
            Modif := False;
        end;

        if InputQueryID_STATUS.Value = 6 then
            UnFormButton.Caption := 'Відновити'
        else
            UnFormButton.Caption := 'Розформувати';

        if (InputQueryOWNER_ID_USER.Value = GetUserId) or (AdminMode) then begin
            ViewOrder.Visible := Info;
            ModifyOrder.Visible := Modif;
            ViewOrder.Enabled := Info;
            ModifyOrder.Enabled := Modif;
        end
        else begin
            DeleteOrder.Visible := False;
            ViewOrder.Visible := True;
            ModifyOrder.Visible := False;
            DeleteOrder.Enabled := False;
            ViewOrder.Enabled := True;
            ModifyOrder.Enabled := False;
        end;
    except
    end;
end;

procedure TOrders2ViewForm.UnFormButtonClick(Sender: TObject);
var
    OLD_ID_ORDER, i, old_id_status: Integer;
    Form: TSpForm;
    Params: TSpParams;
begin
    if InputQuery.IsEmpty then begin
        MessageDlg('Немає наказів!', mtError, [mbOK], 0);
        exit;
    end;

    if (InputQueryID_STATUS.Value = 1)
        then begin
        MessageDlg('Неможливо расформувати цей наказ, бо він несформований!', mtError, [mbOk], 0);
        Exit;
    end;

{    if (GetUserId <> GetOrderOwner(InputQueryID_ORDER.Value, True)) AND (GetOrderOwner(InputQueryID_ORDER.Value, True) <> 0) and
            (not AdminMode)
    then begin
        ErrMsg('Ви не можете расформувати цей наказ, його може расформувати тільки власник. Власника можна змінити, для цього треба зайти під його паролем, відкрити наказ для редагування та змінити власника.');
        exit;
    end;}

    if CheckAccess('/ROOT/Orders', 'UNDONE', True) <> 0 then
        exit;

    if MessageDlg('Ви справді бажаєте расформувати цей наказ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

    old_id_status := InputQuery['ID_STATUS'];

    DoneQuery.Close;
    DoneQuery.ParamByName('ID_ORDER_GROUP').AsInt64 := InputQueryID_ORDER.Value;
    DoneQuery.Open;

    if DoneQuery.IsEmpty then begin
        MessageDlg('У цього наказу немає пунктів!', mtError, [mbOK], 0);
        exit;
    end;

    DoneQuery.First;

    if BufTran.InTransaction then BufTran.Rollback;

    BufTran.Start;

    while not DoneQuery.Eof do begin

        // Проверяем, а можно ли выполнять приказ

        Form := TSpForm.Create(self);
        Params := TSpPArams.Create;

        Params.SelectProcName := 'ORDER_CHECK_FOR_UNFORM(' + DoneQueryID_ORDER.AsString + ')';
        Params.SpFields := 'BAD_STRING';
        PArams.Title := 'Підстави чому неможливе расформування цього наказу';
        Params.ColumnNames := 'Підстава чому неможливе расформування цього наказу';
        Params.ReadOnly := True;
        Params.IdField := 'BAD_STRING';
        Params.ComboField := 'BAD_STRING';
        Params.SpMode := spmNormal;
        Params.DontHideFirstColumn := True;

        Form.Init(Params);

        if (not Form.ResultQuery.IsEmpty) then begin
            Form.ShowModal;

            Params.Free;
            Form.Free;

            exit;
        end;

        Params.Free;
        Form.Free;

        //Здесь расформировывается приказ

        NagScreen := TNagScreen.Create(self);
        NagScreen.Show;
        NagScreen.SetStatusText('расформування наказу...');

        try

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER(' + IntToStr(DoneQueryID_ORDER.Value) +
                ',' + IntToStr(DoneQueryID_ORDER_TYPE.Value) + ',' +
                QuotedStr(DoneQueryNUM_ORDER.value) + ',''' +
                DoneQueryDATE_ORDER.AsString + ''',' +
                QuotedStr(DoneQueryNOTE.value) + ',1);';
            ExecQuery(OutputQuery);

         //  Ставим Всем подписывающим статус "подписанный", но только если работаем в режиме Бога

            if AdminMode then begin
                OutputQuery.Close;
                OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER_SIGN_2(' + IntToStr(DoneQueryID_ORDER.Value) + ',2);';
                ExecQuery(OutputQuery);
            end;

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_UPDATE_MOVING_INFO(' + IntToStr(DoneQueryID_ORDER.Value) + ',1)';
            ExecQuery(OutputQuery);

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_ORDERS_UPDATE_STATUS(' + InputQueryID_ORDER.AsString + ',1)';
            ExecQuery(OutputQuery);

            // Write to Buffer


            //Buffers
            if old_id_status = 5
                then begin
                //if PersonalCommon.Version = 1 then WriteOrderToDbf(2);
                //if PersonalCommon.Version = 2 then WriteOrderToDbf2(3);
            end;


        except on E: Exception
            do begin
                NagScreen.Close;
                NagScreen.free;
                MessageDlg('Виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
                BufTran.Rollback;
                exit;
            end;
        end;

        DoneQuery.Next;
    end;

    BufTran.Commit;

    NagScreen.Close;
    NagScreen.free;

        // Становимся на ту же запись в списке
    OLD_ID_ORDER := InputQueryID_ORDER.Value;
    InputQuery.Close;
    InputQuery.Open;
    InputQuery.Locate('ID_ORDER', OLD_ID_ORDER, []);
end;

procedure TOrders2ViewForm.FormButtonClick(Sender: TObject);
var
    OLD_ID_ORDER: integer;
begin
    if (not InputQuery.IsEmpty) and (InputQuery['ID_STATUS'] = 1)
        then begin

{        if (GetUserId <> GetOrderOwner(InputQueryID_ORDER.Value, True)) AND (GetOrderOwner(InputQueryID_ORDER.Value, True) <> 0) and
           (not AdminMode)
        then begin
            ErrMsg('Ви не можете сформувати цей наказ, його може сформувати тільки власник. Власника можна змінити, для цього треба зайти під його паролем, відкрити наказ для редагування та змінити власника.');
            exit;
        end;
}
        if MessageDlg('Ви справді бажаєте сформувати цей наказ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

        PersonalCommon.WriteTransaction.StartTransaction;

        try
            //  Ставим Всем подписывающим статус "Неподписанный"

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER_SIGN_2(' + IntToStr(InputQuery['ID_ORDER']) + ', 2);';
            ExecQuery(OutputQuery);

            //  Меняем Статус приказа

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_ORDERS_UPDATE_STATUS(' + InputQueryID_ORDER.AsString + ', 2)';
            ExecQuery(OutputQuery);

        except on E: Exception do begin
                MessageDlg('Виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
                PersonalCommon.WriteTransaction.Rollback;
                exit;
            end;
        end;

        PersonalCommon.WriteTransaction.Commit;

        OLD_ID_ORDER := InputQueryID_ORDER.Value;
        InputQuery.Close;
        InputQuery.Open; InputQuery.Locate('ID_ORDER', OLD_ID_ORDER, []);
    end else
        MessageDlg('Немає наказів, які треба сформувати або цей наказ вже сформований!', mtError, [mbOk], 0);
end;

procedure TOrders2ViewForm.PrintOrderExecute(Sender: TObject);
var
    sp: TSprav;
    Params: string;

    // Exe
    Rlst: LongBool;
    StartUpInfo: TStartUpInfo;
    ProcessInfo: TProcessInformation;
    ExitCode: Cardinal;
begin
    if InputQuery.IsEmpty then begin
        ErrMsg('Немає наказів!');
        exit;
    end;

    { Неправильаня печать (через EXE) }

    Params := IntToStr(InputQueryID_ORDER.Value) + ' ' +
        'T' + ' ';

    if PersonalCommon.sDesignReport then
        Params := Params + 'T'
    else
        Params := Params + 'F';

    FillChar(StartUpInfo, SizeOf(TStartUpInfo), 0);

    with StartUpInfo do
    begin
        cb := SizeOf(TStartUpInfo);
        dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
        wShowWindow := SW_SHOWNORMAL;
    end;

    Rlst := CreateProcess(PAnsiChar(ExtractFilePath(Application.ExeName) + 'PrintOrderEx.exe'),
        PAnsiChar(Params),
        nil,
        nil,
        false,
        NORMAL_PRIORITY_CLASS,
        nil,
        nil,
        StartUpInfo,
        ProcessInfo);

    if Rlst then
        with ProcessInfo do begin
            WaitForInputIdle(hProcess, INFINITE); // ждем завершения инициализации
            WaitforSingleObject(ProcessInfo.hProcess, INFINITE); // ждем завершения процесса
            GetExitCodeProcess(ProcessInfo.hProcess, ExitCode); // получаем код завершения
            CloseHandle(hThread); // закрываем дескриптор процесса
            CloseHandle(hProcess); //
        end;

    { Правильаня печать (через BPL) }
    {
        // создать справочник
    sp :=  GetSprav('asup\PrintOrder');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(PersonalCommon.FIBDatabase.Handle);
            FieldValues['Id_Order_Group'] := InputQueryID_ORDER.Value;
            FieldValues['Show_Form'] := True;
            FieldValues['Design_Report'] := PersonalCommon.sDesignReport;
            Post;
        end;

        sp.Show;
        sp.Free;
    end;
    }
end;

procedure TOrders2ViewForm.InputQueryAfterOpen(DataSet: TDataSet);
begin
    if InputQuery.IsEmpty then begin
        InfoButton.Visible := False;
        ModifyButton.Visible := True;
        exit;
    end;
end;

procedure TOrders2ViewForm.SearchEditChange(Sender: TObject);
begin
    InputQuery.Locate('NUM_ORDER_KADR', SearchEdit.Text, []);
end;

procedure TOrders2ViewForm.SearchNextButtonClick(Sender: TObject);
begin
    InputQuery.LocateNext('NUM_ORDER_KADR', SearchEdit.Text, []);
end;

procedure TOrders2ViewForm.AllLabelClick(Sender: TObject);
begin
    InputQuery.FetchAll;
    AllLabel.Caption := 'Кіл-ть записів: ' + IntToStr(InputQuery.RecordCount);
end;

procedure TOrders2ViewForm.OrderGridDBTableView1CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin

    if AViewInfo.Selected then
    begin
        ACanvas.Brush.Color := clBlue;
        ACanvas.Font.Color := clWhite
    end
    else
        case AViewInfo.GridRecord.Values[OrderGridDBTableView1DBColumn5.Index] of
            1: ACanvas.Brush.Color := RGB(157, 244, 162);
            2: ACanvas.Brush.Color := RGB(151, 167, 255);
            3: ACanvas.Brush.Color := RGB(138, 215, 255);
            4: ACanvas.Brush.Color := RGB(250, 163, 177);
            5: ACanvas.Brush.Color := clWhite;
        end;

end;

procedure TOrders2ViewForm.RefreshFilterActionExecute(Sender: TObject);
begin
    FilterAccept;
end;

procedure TOrders2ViewForm.FioOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    // создать справочник
    sp := GetSprav('asup\PCardsList');
    if sp <> nil then
    begin
        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(FibDatabase.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := True;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := AdminMode;
            Post;
        end;
        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];
        end;
        sp.Free;
    end;
end;

procedure TOrders2ViewForm.FilterFioClick(Sender: TObject);
begin
    if not FilterFio.Checked then begin
        Fio.Blocked := True;
        Fio.Value := null;
        Fio.DisplayText := '';
    end
    else begin
        Fio.Blocked := False;
        Fio.OpenSprav;
    end;
end;

end.
