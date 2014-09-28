unit uDischarge;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uSpravControl, uFControl, uLabeledFControl, uDateControl, uCommonSp,
    DB, FIBDatabase, pFIBDatabase, Ibase, uFormControl, uLogicCheck,
    uCharControl, uIntControl, RxMemDS, StdCtrls, Buttons, FIBDataSet,
    pFIBDataSet, cxLookAndFeelPainters, cxButtons, AppStruClasses, AccMgmt,
    FIBQuery, pFIBQuery, pFIBStoredProc, cxStyles, cxCustomData,
    cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
    cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
    ExtCtrls, cxLabel, cxContainer, cxTextEdit, cxDBEdit, Mask, DBCtrls,
    UpKernelUnit, cxCurrencyEdit, dxBar, dxBarExtItems, cxGridCardView,
    cxGridDBCardView, ImgList, cxImage, cxCheckBox, NagScreenUnit;

type
    TfrmDischargeOrder = class(TForm)
        Database: TpFIBDatabase;
        WriteTransaction: TpFIBTransaction;
        WriteDataSet: TpFIBDataSet;
        ReadTransaction: TpFIBTransaction;
        ReadDataSet: TpFIBDataSet;
        StoredProc: TpFIBStoredProc;
        cxGrid1DBTableView1: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        cxGrid1: TcxGrid;
        DataSource1: TDataSource;
        Query: TpFIBQuery;
        cxGrid1DBTableView1ID_DISMISSION: TcxGridDBColumn;
        cxGrid1DBTableView1DATE_DISMISSION: TcxGridDBColumn;
        cxGrid1DBTableView1DISMISSION_REASON: TcxGridDBColumn;
        cxGrid1DBTableView1ID_MAN_MOVING: TcxGridDBColumn;
        cxGrid1DBTableView1ID_ORDER_ITEM: TcxGridDBColumn;
        cxGrid1DBTableView1PROFKOM_NOTE: TcxGridDBColumn;
        cxGrid1DBTableView1NOT_USED_HOLIDAY_COUNT: TcxGridDBColumn;
        cxGrid1DBTableView1NOT_WORKED_HOLIDAY_COUNT: TcxGridDBColumn;
        cxGrid1DBTableView1FIO: TcxGridDBColumn;
        Panel2: TPanel;
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
        cxStyle27: TcxStyle;
        cxStyle28: TcxStyle;
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        DataSourceErrors: TDataSource;
        Bevel1: TBevel;
        cxGrid1DBTableView1NAME_POST: TcxGridDBColumn;
        cxGrid1DBTableView1RATE_COUNT: TcxGridDBColumn;
        dxBarManager1: TdxBarManager;
        btnAdd: TdxBarLargeButton;
        btnEdit: TdxBarLargeButton;
        btnDelete: TdxBarLargeButton;
        Panel1: TPanel;
        btnView: TdxBarLargeButton;
        cxGrid1DBTableView1WORK_REASON: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_DEPARTMENT: TcxGridDBColumn;
        ReasonDismiss: TcxDBTextEdit;
        cxLabel1: TcxLabel;
        cxLabel2: TcxLabel;
        ProfkomEdit: TcxDBTextEdit;
        cxLabel3: TcxLabel;
        ReasonEdit: TcxDBTextEdit;
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        cxGrid1DBTableView1IS_SHADOW: TcxGridDBColumn;
        ImageList1: TImageList;
        ReadDataSet2: TpFIBDataSet;
        cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
        dxBarLargeButton1: TdxBarLargeButton;
        cxGrid1DBTableView1DBNAME_AWAY: TcxGridDBColumn;
        cxGrid1DBTableView1DBNUM_SUB_ITEM: TcxGridDBColumn;
        NoteEdit: TcxDBTextEdit;
        cxLabel4: TcxLabel;
        cxGrid1DBTableView1RATE_COUNT_STR: TcxGridDBColumn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure btnAddClick(Sender: TObject);
        procedure btnDeleteClick(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
        procedure btnEditClick(Sender: TObject);
        procedure btnCancelClick(Sender: TObject);
        procedure btnViewClick(Sender: TObject);

        procedure cxGrid1DBTableView1CustomDrawCell(
            Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
            AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
        procedure cxGrid1DBTableView1IS_SHADOWCustomDrawCell(
            Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
            AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
        procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FormShow(Sender: TObject);
        procedure cxGrid1DBTableView1DblClick(Sender: TObject);
   { procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1IS_SHADOWCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    }procedure dxBarLargeButton1Click(Sender: TObject);
    private
        isFrame: boolean;
        PC: TFMASAppModule;
        DefaultReason: string;
        function ShowFilter(id_session, id_order_type: int64): boolean;
        procedure SelectAll;
    public
        Input: TrxMemoryData;
        Mode: integer;
        id_session: int64;
        err_id_order_item: int64;
        num_sub_item: integer;
        constructor Create(AOwner: TComponent; inp: TRxMemoryData; hnd: TISC_DB_HANDLE; in_isFrame: boolean); reintroduce;
        destructor Destroy; reintroduce;
    end;

    TUP_DischargeOrder = class(TSprav)
    public
        frm: TfrmDischargeOrder;
        constructor Create;
        procedure Show; override;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation
uses uDischargeAdd, qFTools, uDischargeHolidayView, uDischargeHolidayCheck, BaseTypes;
{$R *.dfm}

function CreateSprav: TSprav;
begin
    Result := TUP_DischargeOrder.Create;
end;

constructor TUP_DischargeOrder.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('id_order', ftInteger);
    Input.FieldDefs.Add('id_order_type', ftInteger);
    Input.FieldDefs.Add('id_item', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('outer_hwnd', ftInteger);
    Input.FieldDefs.Add('mode', ftInteger);
    Input.FieldDefs.Add('num_item', ftInteger);
    Input.FieldDefs.Add('num_sub_item', ftInteger);
    PrepareMemoryDatasets;
end;

function TUP_DischargeOrder.GetFrame: TFrame;
begin
    frm := TfrmDischargeOrder.Create(Application.MainForm, Input, TISC_DB_HANDLE(integer(Input['DBHandle'])), true);
    frm.num_sub_item := input['num_sub_item'];
    Result := TFrame(frm);
end;

procedure TUP_DischargeOrder.Show;
begin
    frm := TfrmDischargeOrder.Create(Application.MainForm, Input, TISC_DB_HANDLE(integer(Input['DBHandle'])), false);
    frm.num_sub_item := input['num_sub_item'];
    frm.ShowModal;
    frm.Free;
end;

function TfrmDischargeOrder.ShowFilter(id_session, id_order_type: int64): boolean;
var
    Count: Integer;
    id_user: integer;
begin
    Result := false;
    id_user := AccMgmt.GetUserId;
    if (PC <> nil)
        then begin
                        //Инициализация входящих параметров
        PC.InParams.Items['AOwner'] := @self;
        PC.InParams.Items['DbHandle'] := PInteger(@Database.Handle);
        PC.InParams.Items['Id_User'] := PInteger(@id_user);
        PC.InParams.Items['Id_order_type'] := PInteger(@id_order_type);
        PC.InParams.Items['KEY_SESSION'] := PInt64(@id_session);

                        //Запуск фильтра
        (PC as IFMASModule).Run;

                        //Получение количества записей которые вернул фильтр
        Count := PInteger(PC.OutParams.Items['Count'])^;
        Result := Count > 0;
    end
    else MessageDlg('Помилка при використанні модуля up_filter.bpl', mtError, [mbOk], 0);
end;

procedure TfrmDischargeOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    WriteDataSet.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'UP_KER_CLEAR_TMP_EX';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
    StoredProc.ExecProc;
    WriteDataSet.Transaction.Commit;
end;

procedure TfrmDischargeOrder.SelectAll;
begin
    ReadDataSet.Close;
    ReadDataSet.ParamByName('ID_SESSION').AsInt64 := id_session;
    ReadDataSet.Open;
end;

procedure TfrmDischargeOrder.btnAddClick(Sender: TObject);
var
    frm: TfrmAddDischarge;
    frmCheck: TfrmHolidayCheck;
    id_pcard: int64;
    Reason_S: string;
begin
    if not ShowFilter(id_session, input['id_order_type']) then
    begin
        ShowMessage('Не відобрано записів');
        exit;
    end;

    frm := TfrmAddDischarge.Create(Self);
    frm.Caption := 'Додати - ' + frm.Caption;

    ReadDataSet2.Close;
    ReadDataSet2.SelectSQL.Text := 'select mm.id_pcard, count(mm.id_pcard) from UP_DT_KERNELL_MOVINGS km, up_dt_man_moving mm ' +
        'where ' +
        'km.key_session = :id_session and ' +
        'mm.id_man_moving = km.id_man_moving ' +
        'group by mm.id_pcard';
    ReadDataSet2.ParamByName('id_session').AsInt64 := id_session;
    ReadDataSet2.Open;
    ReadDataSet2.FetchAll;
    if ReadDataSet2.RecordCount = 1 then
    begin
        id_pcard := TFIBBCDField(ReadDataSet2.FBN('ID_PCARD')).AsInt64;
        ReadDataSet2.Close;
        ReadDataSet2.SelectSQL.Text := 'select gm.FIO_SMALL from get_man_fio(:id_pcard) gm';
        ReadDataSet2.ParamByName('id_pcard').AsInt64 := id_pcard;
        ReadDataSet2.Open;
        Reason_s := DefaultReason;
        if DefaultReason = ''
            then
            frm.DismissionReason.Value := 'заява ' + ReadDataSet2['FIO_SMALL']
        else
            frm.DismissionReason.Value := StringReplace(Reason_s, '%FIO%', ReadDataSet2['FIO_SMALL'], [rfReplaceAll]);
    end;
    ReadDataSet2.Close;

    frm.cbAll.Blocked := true;
    frm.cbAll.Visible := false;
    if frm.ShowModal = mrOK then
    begin
(*--- uDischarge.pas*)
   {
    //Проверка есть ли люди из фильтра в отпусках. если есть то увольнять нельзя
        frmCheck := TfrmHolidayCheck.Create(Self);
        frmCheck.DataSet.Database := Database;
        frmCheck.DataSet.Transaction := ReadTransaction;
        frmCheck.DataSet.ParamByName('ID_SESSION').AsInt64 := id_session;
        frmCheck.DataSet.ParamByName('DATE_DISMISSION').AsDate := frm.DateDismission.Value;
        frmCheck.DataSet.Open;
        if frmCheck.DataSet.RecordCount <> 0 then
        begin
//      ShowMessage('Нельзя уволить т.к. человек находиться в отпуске');
            frmCheck.ShowModal;
//      frmCheck.DataSet.Close;
//      frmCheck.Free;
//      frm.Free;
//      exit;
        end;
        frmCheck.DataSet.Close;
        frmCheck.Free;
     }
(*=======*)

    //Проверка есть ли люди из фильтра в отпусках. если есть то увольнять нельзя
        frmCheck := TfrmHolidayCheck.Create(Self);
        frmCheck.DataSet.Database := Database;
        frmCheck.DataSet.Transaction := ReadTransaction;
        frmCheck.DataSet.ParamByName('ID_SESSION').AsInt64 := id_session;
        frmCheck.DataSet.ParamByName('DATE_DISMISSION').AsDate := frm.DateDismission.Value;
        frmCheck.DataSet.Open;
        if frmCheck.DataSet.RecordCount <> 0 then
        begin
            frmCheck.ShowModal;
        end;
        frmCheck.DataSet.Close;
        frmCheck.Free;

 (*>>>>>>> 1.9*)
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName := 'UP_DT_MAN_DISMISSION_BUFF_ADD';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
        StoredProc.ParamByName('ID_DISMISSION').AsVariant := frm.NameDismission.Value;
        StoredProc.ParamByName('NOTE').AsVariant := frm.NoteEdit.Value;
        StoredProc.ParamByName('NUM_ITEM').AsVariant := input['num_item'];
        StoredProc.ParamByName('NUM_SUB_ITEM').AsVariant := num_sub_item {input['num_sub_item']};
        StoredProc.ParamByName('ID_ORDER').AsInt64 := input['id_order'];
        StoredProc.ParamByName('ID_ORDER_TYPE').AsInt64 := input['id_order_type'];
        StoredProc.ParamByName('REASON').AsVariant := frm.DismissionReason.Value;
        StoredProc.ParamByName('LINKTO').AsVariant := Null;
        StoredProc.ParamByName('DATE_DISMISSION').AsDate := frm.DateDismission.Value;
        StoredProc.ParamByName('NOT_UESD_HOLIDAY_CNT').AsVariant := frm.NotUsedEdit.Value;
        StoredProc.ParamByName('NOT_WORKED_HOLIDAY_CNT').AsVariant := frm.notWorkedEdit.Value;
        StoredProc.ParamByName('NOTE_PROFKOM').AsVariant := frm.ProfkomNote.Value;
        StoredProc.ExecProc;
        if StoredProc.FieldByName('ERR').AsInteger = 1 then
        begin
            StoredProc.Transaction.Rollback;
            frm.Free;
            ShowMessage('Нельзя уволить т.к. человек находиться в отпуске');
            exit;
        end;
        if StoredProc.FieldByName('ERR').asInteger = 2 then
        begin
            StoredProc.Transaction.Rollback;
            frm.Free;
            ShowMessage('Внутрений сбой в приказе! Попытка на перенос по больничному в увольнении!');
            exit;
        end;
        num_sub_item := StoredProc.FieldByName('NUM_SUB').AsInteger;
        StoredProc.Close;
        StoredProc.Transaction.Commit;
        SelectAll;
    end;
    frm.Free;
end;

procedure TfrmDischargeOrder.btnDeleteClick(Sender: TObject);
begin
    if ReadDataSet.RecordCount = 0 then exit;
    WriteTransaction.StartTransaction;
    StoredProc.StoredProcName := 'UP_DT_MAN_DISMISSION_BUFF_D';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
    StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := ReadDataSet['ID_ORDER_ITEM'];
    try
        StoredProc.ExecProc;
    except
        WriteTransaction.Rollback;
        exit;
    end;
    WriteTransaction.Commit;
    ReadDataSet.CacheDelete;
end;

procedure TfrmDischargeOrder.btnOkClick(Sender: TObject);
var
    st: UP_KERNEL_MODE_STRUCTURE;
    doCommit: boolean;
    NagScreen: TNagScreen;
begin
    err_id_order_item := -9999;
    if Mode = 3 then btnCancelClick(Sender);
    if ReadDataSet.RecordCount <> 0 then
    begin
        WriteTransaction.StartTransaction;
        doCommit := true;

        ReadDataSet.First;

        NagScreen := TNagScreen.Create(Application.MainForm);
        NagScreen.SetStatusText('Чекайте... Йде звільнення');
        NagScreen.Show;
        Application.ProcessMessages;

        while not ReadDataSet.Eof do
        begin
            st.AOWNER := self;
            st.ID_ORDER := ReadDataSet['ID_ORDER'];
            st.ID_ORDER_ITEM_IN := ReadDataSet['ID_ORDER_ITEM'];
            st.KEY_SESSION := id_session;
            st.DBHANDLE := Database.Handle;
            st.TRHANDLE := WriteTransaction.Handle;
            doCommit := UpKernelDo(@st);
            if doCommit = false then
            begin
{       DataSetErrors.Close;
       DataSetErrors.ParamByName('KEY_SESSION').AsInt64 := id_session;
       DataSetErrors.ParamByName('ID_ORDER_ITEM').AsInt64 := ReadDataSet['ID_ORDER_ITEM'];
       DataSetErrors.Open;
       cxGrid2.Visible := true;}
                err_id_order_item := ReadDataSet['ID_ORDER_ITEM'];
                GetUpSessionErrors(self, Database.Handle, id_session, ReadDataSet['ID_ORDER_ITEM']);
                SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_ERR, 0, 0);
                NagScreen.Close;
                NagScreen.Free;
                SelectAll;
                exit;
            end;

            ReadDataSet2.Close;
            ReadDataSet2.SelectSQL.Text := 'select ID_ITEM from UP_DT_ORDER_ITEMS_BUFF where linkto = ' + IntToStr(ReadDataSet['ID_ORDER_ITEM']);
            ReadDataSet2.Open;
            if ReadDataSet2.RecordCount <> 0 then
            begin
                while not ReadDataSet2.Eof do
                begin
                    st.AOWNER := self;
                    st.ID_ORDER := ReadDataSet['ID_ORDER'];
                    st.ID_ORDER_ITEM_IN := ReadDataSet2['ID_ITEM'];
                    st.KEY_SESSION := id_session;
                    st.DBHANDLE := Database.Handle;
                    st.TRHANDLE := WriteTransaction.Handle;
                    doCommit := UpKernelDo(@st);
                    if doCommit = false then
                    begin
                        GetUpSessionErrors(self, Database.Handle, id_session, ReadDataSet2['ID_ITEM']);
                        ReadDataSet2.Close;
                        ReadDataSet.Close;
                        SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_ERR, 0, 0);
                        NagScreen.Close;
                        NagScreen.Free;
                        SelectAll;
                        exit;
                    end;
                    ReadDataSet2.Next;
                end;
            end;
            ReadDataSet2.Close;

            ReadDataSet.Next;
        end;
        if doCommit then WriteTransaction.Commit;
    end;
    NagScreen.Close;
    NagScreen.Free;
    SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_OK, 0, 0);
    SelectAll;
end;

constructor TfrmDischargeOrder.Create(AOwner: TComponent; inp: TRxMemoryData; hnd: TISC_DB_HANDLE; in_isFrame: boolean);
begin
    inherited Create(AOwner);
    err_id_order_item := -9999;
    Self.isFrame := in_isFrame;
    Input := inp;
    Mode := Input['mode'];
    if isFrame then
    begin
        BorderStyle := bsNone;
        BorderIcons := [];
        Visible := true;
        SendMessage(input['outer_hwnd'], FMAS_MESS_GET_BUTTON_OK, btnOk.Handle, btnOk.Handle);
        SendMessage(input['outer_hwnd'], FMAS_MESS_GET_BUTTON_CANCEL, btnCancel.Handle, btnCancel.Handle);
        if isFrame then
    end;
    Database.Handle := hnd;
    if Mode = 0 then
    begin
        WriteDataSet.Transaction.StartTransaction;
    //Получаем идентификатор сессиии
        WriteDataSet.SelectSQL.Text := 'select gen_id(GEN_UP_ID_SESSION, 1) from ini_asup_consts';
        WriteDataSet.Open;
        id_session := WriteDataSet.Fields[0].Value;
        WriteDataSet.Close;
        WriteDataSet.Transaction.Commit;
    end;
    if (Mode = 1) or (Mode = 2) then
    begin
        btnDelete.Enabled := false;
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName := 'UP_DT_MAN_DISMISSION_BUFF_FILL';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_ORDER').AsInt64 := Input['ID_ORDER'];
        StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := Input['ID_ITEM'];
        StoredProc.ExecProc;
        id_session := StoredProc['KEY_SESSION'].AsInt64;
        StoredProc.Transaction.Commit;
        SelectAll;
    end;
    if Mode = 2 then
    begin
        btnAdd.Enabled := false;
        btnEdit.Enabled := false;
        btnDelete.Enabled := false;
        btnOk.Enabled := false;
    end;

    WriteDataSet.Transaction.StartTransaction;
    //Получаем стандартное основание приказа
    WriteDataSet.SelectSQL.Text := 'select default_reason from up_dt_order_type where id_type = ' + VarToStr(input['ID_ORDER_TYPE']);
    WriteDataSet.Open;
    if ((WriteDataSet.FieldByName('DEFAULT_REASON').Value <> null) and
        (Trim(WriteDataSet.FieldByName('DEFAULT_REASON').AsString) <> ''))
        then DefaultReason := WriteDataSet.FieldByName('DEFAULT_REASON').AsString
    else DefaultReason := '';
    WriteDataSet.Close;
    WriteDataSet.Transaction.Commit;

    with TFMASAppModuleCreator.Create do
    begin
        PC := CreateFMASModule(ExtractFilePath(Application.ExeName) + 'up\', 'up_filter');
        if (PC = nil)
            then agMessageDlg('Увага!', 'Помилка при роботі з модулем up_filter.bpl', mtError, [mbOk]);
    end;
end;

procedure TfrmDischargeOrder.btnEditClick(Sender: TObject);
var
    frm: TfrmAddDischarge;
    id: int64;
begin
    if ReadDataSet.RecordCount = 0 then exit;
    id := ReadDataSet['ID_ORDER_ITEM'];
    frm := TfrmAddDischarge.Create(Self);
    frm.Caption := 'Змінити - ' + frm.Caption;
    frm.DateDismission.Value := ReadDataSet['DATE_DISMISSION'];
    frm.DismissionReason.Value := ReadDataSet['DISMISSION_REASON'];
    frm.NameDismission.Value := ReadDataSet['ID_DISMISSION'];
    frm.NameDismission.DisplayText := ReadDataSet['NAME_DISMISSION'];
    frm.ProfkomNote.Value := ReadDataSet['PROFKOM_NOTE'];
    frm.notWorkedEdit.Value := ReadDataSet['NOT_WORKED_HOLIDAY_COUNT'];
    frm.NotUsedEdit.Value := ReadDataSet['NOT_USED_HOLIDAY_COUNT'];
    frm.NoteEdit.Value := ReadDataSet['NOTE'];
    if Mode = 2 then qFBlock(true, frm);
    if (frm.ShowModal = mrOK) and (Mode <> 2) then
    begin
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName := 'UP_DT_MAN_DISMISSION_BUFF_U';
        StoredProc.Prepare;
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
        StoredProc.ParamByName('ID_DISMISSION').AsVariant := frm.NameDismission.Value;
        StoredProc.ParamByName('DATE_DISMISSION').AsDate := frm.DateDismission.Value;
        StoredProc.ParamByName('DISMISSION_REASON').AsVariant := frm.DismissionReason.Value;
        StoredProc.ParamByName('PROFKOM_NOTE').AsVariant := frm.ProfkomNote.Value;
        StoredProc.ParamByName('NOT_USED_HOLIDAY_COUNT').AsVariant := frm.NotUsedEdit.Value;
        StoredProc.ParamByName('NOT_WORKED_HOLIDAY_COUNT').AsVariant := frm.notWorkedEdit.Value;
        StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id;
        if frm.cbAll.Value then StoredProc.ParamByName('DO_ALL').AsInteger := 1
        else StoredProc.ParamByName('DO_ALL').AsInteger := 0;
        StoredProc.ParamByName('NOTE').AsVariant := frm.NoteEdit.Value;
        try
            StoredProc.ExecProc;
        except
            StoredProc.Transaction.Rollback;
        end;
        StoredProc.Transaction.Commit;
        SelectAll;
        ReadDataSet.Locate('ID_ORDER_ITEM', id, []);
    end;
    frm.Free;
end;

procedure TfrmDischargeOrder.btnCancelClick(Sender: TObject);
begin
    if isFrame then SendMessage(input['outer_hwnd'], FMAS_MESS_CLOSE_FRAME, 0, 0) else Close;
end;

procedure TfrmDischargeOrder.btnViewClick(Sender: TObject);
var
    md: integer;
begin
    md := Mode;
    Mode := 2;
    btnEditClick(Sender);
    Mode := md;
end;

(*-- uDischarge.pas*)

procedure TfrmDischargeOrder.cxGrid1DBTableView1CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if AViewInfo.GridRecord.Values[cxGrid1DBTableView1ID_ORDER_ITEM.Index] = err_id_order_item then
    begin
        ACAnvas.Brush.Color := clRed;
    end;

{  if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1IS_SHADOW.Index] = 1) then
  begin
    ACanvas.Font.Color := clBlue;
    ACanvas.Font.Style := [fsUnderline];
  end; }
end;

procedure TfrmDischargeOrder.cxGrid1DBTableView1IS_SHADOWCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if AViewInfo.GridRecord.Values[cxGrid1DBTableView1IS_SHADOW.Index] = 1 then begin
        ACanvas.FillRect(AViewInfo.Bounds);
        ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 0);
        ADone := true;
    end;
end;

procedure TfrmDischargeOrder.cxGrid1DBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
var
    i: integer;
begin
    if key = VK_insert then btnAddClick(Self);
    if key = VK_DELETE then btnDeleteClick(Self);
    if key = VK_F2 then btnEditClick(Self);
    if ((Key = VK_F12) and (ssShift in Shift))
        then ShowInfo(ReadDataSet);
    if key = VK_RETURN then cxGrid1DBTableView1DblClick(Self);
    if (key = ord('z')) and (ssShift in Shift) and (ssCtrl in Shift) then
    begin
        for i := 0 to cxGrid1DBTableView1.ColumnCount - 1 do cxGrid1DBTableView1.Columns[i].Visible := true;
    end;
end;

procedure TfrmDischargeOrder.FormShow(Sender: TObject);
begin
    cxGrid1.SetFocus;

end;

procedure TfrmDischargeOrder.cxGrid1DBTableView1DblClick(Sender: TObject);
var
    frm: TfrmHolidayView;
begin
    if ReadDataSet.RecordCount = 0 then exit;
    if ReadDataSet['IS_SHADOW'] <> 1 then exit;
{ frm := TfrmHolidayView.Create(Self);
 frm.DataSet.Database := Database;
 frm.DataSet.Transaction := ReadTransaction;
 frm.DataSet.ParamByName('KEY_SESSION').AsInt64 := id_session;
 frm.DataSet.ParamByName('ID_ORDER_ITEM').AsInt64 := TFIBBCDField(ReadDataSet.fbn('ID_ORDER_ITEM')).AsInt64;
 frm.DataSet.Open;
 frm.ShowModal;
 frm.DataSet.Close;
 frm.Free;    }
end;

(*=======*)
{procedure TfrmDischargeOrder.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[cxGrid1DBTableView1ID_ORDER_ITEM.Index] = err_id_order_item then
  begin
   ACAnvas.Brush.Color := clRed;
  end;

  if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1IS_SHADOW.Index] = 1) then
  begin
    ACanvas.Font.Color := clBlue;
    ACanvas.Font.Style := [fsUnderline];
  end;
end;   }

{procedure TfrmDischargeOrder.cxGrid1DBTableView1IS_SHADOWCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
     if AViewInfo.GridRecord.Values[cxGrid1DBTableView1IS_SHADOW.Index] = 1
     then begin
               ACanvas.FillRect(AViewInfo.Bounds);
               ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 0);
               ADone := true;
     end;
end;

procedure TfrmDischargeOrder.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var i : integer;
begin
     if key = VK_insert then btnAddClick(Self);
     if key = VK_DELETE then btnDeleteClick(Self);
     if key = VK_F2 then btnEditClick(Self);
     if (key = ord('z')) and (ssShift in Shift) and (ssCtrl in Shift) then
     begin
          for i := 0 to cxGrid1DBTableView1.ColumnCount - 1 do cxGrid1DBTableView1.Columns[i].Visible := true;
     end;
end;

procedure TfrmDischargeOrder.FormShow(Sender: TObject);
begin
     cxGrid1.SetFocus;
end;     }

procedure TfrmDischargeOrder.dxBarLargeButton1Click(Sender: TObject);
var
    frm: TfrmHolidayView;
begin
    if ReadDataSet.RecordCount = 0
        then exit;

  { if ReadDataSet['IS_SHADOW'] <> 1
     then exit;   }

    frm := TfrmHolidayView.Create(Self);
    frm.DataSet.Database := Database;
    frm.DataSet.Transaction := ReadTransaction;
    frm.DataSet.ParamByName('ID_MAN_MOVING').AsInt64 := TFIBBCDField(ReadDataSet.fbn('ID_MAN_MOVING')).AsInt64;
    frm.DataSet.Open;
    frm.ShowModal;
    frm.DataSet.Close;
    frm.Free;
end;

destructor TfrmDischargeOrder.Destroy;
begin
    if Assigned(PC) then FreeAndNil(PC);

    inherited Destroy;
end;

end.

