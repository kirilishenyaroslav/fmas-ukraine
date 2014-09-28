unit uPochasDis;

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
    cxGridDBCardView;

type
    TfrmPochasDisOrder = class(TForm)
        Database: TpFIBDatabase;
        WriteTransaction111: TpFIBTransaction;
        WriteDataSet: TpFIBDataSet;
        ReadTransaction: TpFIBTransaction;
        ReadDataSet: TpFIBDataSet;
        StoredProc: TpFIBStoredProc;
        cxGrid1DBTableView1: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        cxGrid1: TcxGrid;
        DataSource1: TDataSource;
        Query: TpFIBQuery;
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
        dxBarManager1: TdxBarManager;
        btnAdd: TdxBarLargeButton;
        btnEdit: TdxBarLargeButton;
        btnDelete: TdxBarLargeButton;
        Panel1: TPanel;
        btnView: TdxBarLargeButton;
        cxDBTextEdit1: TcxDBTextEdit;
        cxLabel1: TcxLabel;
        cxLabel3: TcxLabel;
        cxDBTextEdit3: TcxDBTextEdit;
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        cxGrid1DBTableView1ID_DISMISSION: TcxGridDBColumn;
        cxGrid1DBTableView1DATE_DISMISSION: TcxGridDBColumn;
        cxGrid1DBTableView1DISMISSION_REASON: TcxGridDBColumn;
        cxGrid1DBTableView1ID_MAN_MOVING: TcxGridDBColumn;
        cxGrid1DBTableView1ID_ORDER_ITEM: TcxGridDBColumn;
        cxGrid1DBTableView1PROFKOM_NOTE: TcxGridDBColumn;
        cxGrid1DBTableView1NOT_USED_HOLIDAY_COUNT: TcxGridDBColumn;
        cxGrid1DBTableView1NOT_WORKED_HOLIDAY_COUNT: TcxGridDBColumn;
        cxGrid1DBTableView1FIO: TcxGridDBColumn;
        cxGrid1DBTableView1NUM_ITEM: TcxGridDBColumn;
        cxGrid1DBTableView1NUM_SUB_ITEM: TcxGridDBColumn;
        cxGrid1DBTableView1ID_ORDER: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_POST: TcxGridDBColumn;
        cxGrid1DBTableView1RATE_COUNT: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_DEPARTMENT: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_DISMISSION: TcxGridDBColumn;
        cxGrid1DBTableView1WORK_REASON: TcxGridDBColumn;
        StoredProc2: TpFIBStoredProc;
        WrTransaction: TpFIBTransaction;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure btnAddClick(Sender: TObject);
        procedure btnDeleteClick(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
        procedure btnEditClick(Sender: TObject);
        procedure btnCancelClick(Sender: TObject);
        procedure btnViewClick(Sender: TObject);
        procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FormShow(Sender: TObject);
        procedure cxGrid1DBTableView1CustomDrawCell(
            Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
            AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    private
        isFrame: boolean;
        function ShowFilter(id_session, id_order_type: int64): boolean;
        procedure SelectAll;
    public
        Input: TrxMemoryData;
        Mode: integer;
        id_session: int64;
        err_id_order_item: int64;
        constructor Create(AOwner: TComponent; inp: TRxMemoryData; hnd: TISC_DB_HANDLE; in_isFrame: boolean); reintroduce;
    end;

    TUP_DischargeOrder = class(TSprav)
    public
        frm: TfrmPochasDisOrder;
        constructor Create;
        procedure Show; override;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

uses uPochasDisAdd, qFTools;

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
    frm := TfrmPochasDisOrder.Create(Application.MainForm, Input, TISC_DB_HANDLE(integer(Input['DBHandle'])), true);
    Result := TFrame(frm);
end;

procedure TUP_DischargeOrder.Show;
begin
    frm := TfrmPochasDisOrder.Create(Application.MainForm, Input, TISC_DB_HANDLE(integer(Input['DBHandle'])), false);
    frm.ShowModal;
    frm.Free;
end;

function TfrmPochasDisOrder.ShowFilter(id_session, id_order_type: int64): boolean;
var
    PC: TFMASAppModule;
    Count: Integer;
    id_user: integer;
begin
    Result := false;
    id_user := AccMgmt.GetUserId;
    with TFMASAppModuleCreator.Create do
    begin
        PC := CreateFMASModule(ExtractFilePath(Application.ExeName) + 'up\', 'up_filter');
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
end;

procedure TfrmPochasDisOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    WriteDataSet.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'UP_KER_CLEAR_TMP_EX';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
    StoredProc.ExecProc;
    WriteDataSet.Transaction.Commit;
end;

procedure TfrmPochasDisOrder.SelectAll;
begin
    ReadDataSet.Close;
    ReadDataSet.ParamByName('ID_SESSION').AsInt64 := id_session;
    ReadDataSet.Open;
end;

procedure TfrmPochasDisOrder.btnAddClick(Sender: TObject);
var
    frm: TfrmAddPochasDis;
begin
{  if not ShowFilter(id_session, input['id_order_type']) then
  begin
    ShowMessage('Не відобрано записів');
    exit;
  end;}
    frm := TfrmAddPochasDis.Create(Self);
    frm.Caption := 'Додати - ' + frm.Caption;
    frm.cbAll.Blocked := true;
    if frm.ShowModal = mrOK then
    begin
        StoredProc2.Close;
        StoredProc2.Transaction.StartTransaction;
        StoredProc2.StoredProcName := 'UP_DT_MAN_POCH_DIS_BUFF_ADD';
        StoredProc2.Prepare;
        StoredProc2.ParamByName('ID_SESSION').AsInt64 := id_session;
        StoredProc2.ParamByName('ID_ORDER').AsInt64 := input['id_order'];
        StoredProc2.ParamByName('ID_ORDER_TYPE').AsInt64 := input['id_order_type'];
        StoredProc2.ParamByName('ID_DISMISSION').AsVariant := frm.NameDismission.Value;
        StoredProc2.ParamByName('NOTE').AsVariant := frm.NoteEdit.Value;
        StoredProc2.ParamByName('REASON').AsVariant := frm.DismissionReason.Value;
        StoredProc2.ParamByName('DATE_DISMISSION').AsDate := frm.DateDismission.Value;
        StoredProc2.ParamByName('ID_POCHAS_PLAN').AsInt64 := frm.ManEdit.value;
        StoredProc2.ParamByName('NUM_ITEM').AsInteger := input['num_item'];
        StoredProc2.ParamByName('NUM_SUBITEM').AsInteger := input['num_sub_item'];
        try
            StoredProc2.ExecProc;
        except
            StoredProc2.Transaction.Rollback;
        end;
        StoredProc2.Close;
        StoredProc2.Transaction.Commit;
        SelectAll;
    end;
    frm.Free;
end;

procedure TfrmPochasDisOrder.btnDeleteClick(Sender: TObject);
begin
    if ReadDataSet.RecordCount = 0 then exit;
    WriteTransaction111.StartTransaction;
    StoredProc.StoredProcName := 'UP_DT_MAN_POCH_DIS_BUFF_D';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
    StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := ReadDataSet['ID_ORDER_ITEM'];
    try
        StoredProc.ExecProc;
    except
        WriteTransaction111.Rollback;
        exit;
    end;
    WriteTransaction111.Commit;
    ReadDataSet.CacheDelete;
end;

procedure TfrmPochasDisOrder.btnOkClick(Sender: TObject);
var
    st: UP_KERNEL_MODE_STRUCTURE;
    doCommit: boolean;
begin
    err_id_order_item := -9999;
    if Mode = 3 then btnCancelClick(Sender);
    if ReadDataSet.RecordCount <> 0 then
    begin
        WriteTransaction111.StartTransaction;
        doCommit := true;
        ReadDataSet.First;
        while not ReadDataSet.Eof do
        begin
            st.AOWNER := self;
            st.ID_ORDER := ReadDataSet['ID_ORDER'];
            st.ID_ORDER_ITEM_IN := ReadDataSet['ID_ORDER_ITEM'];
            st.KEY_SESSION := id_session;
            st.DBHANDLE := Database.Handle;
            st.TRHANDLE := WriteTransaction111.Handle;
            doCommit := UpKernelDo(@st);
            if doCommit = false then
            begin
                err_id_order_item := ReadDataSet['ID_ORDER_ITEM'];
                GetUpSessionErrors(self, Database.Handle, id_session, ReadDataSet['ID_ORDER_ITEM']);
                SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_ERR, 0, 0);
                SelectAll;
                exit;
            end;
            ReadDataSet.Next;
        end;
        if doCommit then WriteTransaction111.Commit;
    end;
    SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_OK, 0, 0);
end;

constructor TfrmPochasDisOrder.Create(AOwner: TComponent; inp: TRxMemoryData; hnd: TISC_DB_HANDLE; in_isFrame: boolean);
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
        StoredProc.StoredProcName := 'UP_DT_MAN_POCH_DIS_BUFF_FILL';
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
end;

procedure TfrmPochasDisOrder.btnEditClick(Sender: TObject);
var
    frm: TfrmAddPochasDis;
    id: int64;
begin
    if ReadDataSet.RecordCount = 0 then exit;
    id := ReadDataSet['ID_ORDER_ITEM'];
    frm := TfrmAddPochasDis.Create(Self);
    frm.Caption := 'Змінити - ' + frm.Caption;
    frm.DateDismission.Value := ReadDataSet['DATE_DISMISSION'];
    frm.DismissionReason.Value := ReadDataSet['DISMISSION_REASON'];
    frm.NameDismission.Value := ReadDataSet['ID_DISMISSION'];
    frm.NameDismission.DisplayText := ReadDataSet['NAME_DISMISSION'];
    frm.NoteEdit.Value := ReadDataSet['NOTE'];
    frm.ManEdit.Value := ReadDataSet['ID_POCHAS_PLAN'];
    frm.ManEdit.DisplayText := '-';
    frm.ManEdit.Blocked := true;
    if Mode = 2 then qFBlock(true, frm);
    if (frm.ShowModal = mrOK) and (Mode <> 2) then
    begin
        try
            StoredProc.Transaction.StartTransaction;
            StoredProc.StoredProcName := 'UP_DT_MAN_POCH_DIS_BUFF_U';
            StoredProc.Prepare;
            StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
            StoredProc.ParamByName('ID_DISMISSION').AsVariant := frm.NameDismission.Value;
            StoredProc.ParamByName('DATE_DISMISSION').AsDate := frm.DateDismission.Value;
            StoredProc.ParamByName('DISMISSION_REASON').AsVariant := frm.DismissionReason.Value;
            StoredProc.ParamByName('ID_ORDER_ITEM').AsVariant := id;
            StoredProc.ParamByName('NOTE').AsVariant := frm.NoteEdit.Value;
            StoredProc.ParamByName('DO_ALL').AsVariant := frm.cbAll.Value;
            StoredProc.ExecProc;
            StoredProc.Transaction.Commit;
            SelectAll;
            ReadDataSet.Locate('ID_ORDER_ITEM', id, []);
        except on e: exception do
            begin
                showmessage(e.message);
                StoredProc.Transaction.Rollback;
            end;
        end;
    end;
    frm.Free;
end;

procedure TfrmPochasDisOrder.btnCancelClick(Sender: TObject);
begin
    if isFrame then SendMessage(input['outer_hwnd'], FMAS_MESS_CLOSE_FRAME, 0, 0) else Close;
end;

procedure TfrmPochasDisOrder.btnViewClick(Sender: TObject);
var
    md: integer;
begin
    md := Mode;
    Mode := 2;
    btnEditClick(Sender);
    Mode := md;
end;

procedure TfrmPochasDisOrder.cxGrid1DBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if key = VK_insert then btnAddClick(Self);
    if key = VK_DELETE then btnDeleteClick(Self);
    if key = VK_F2 then btnEditClick(Self);
    if ((Key = VK_F12) and (ssShift in Shift))
        then ShowInfo(ReadDataSet);
end;

procedure TfrmPochasDisOrder.FormShow(Sender: TObject);
begin
    cxGrid1.SetFocus;
end;

procedure TfrmPochasDisOrder.cxGrid1DBTableView1CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if AViewInfo.GridRecord.Values[cxGrid1DBTableView1ID_ORDER_ITEM.Index] = err_id_order_item then
    begin
        ACAnvas.Brush.Color := clRed;
    end;
end;

end.

