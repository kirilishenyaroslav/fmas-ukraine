unit uPochas;

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
    cxGridDBCardView, qFTools;

type
    TfrmPochasOrder = class(TForm)
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
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        cxGrid1DBTableView1ID_POCHAS_PLAN: TcxGridDBColumn;
        cxGrid1DBTableView1DATE_BEG: TcxGridDBColumn;
        cxGrid1DBTableView1DATE_END: TcxGridDBColumn;
        cxGrid1DBTableView1ID_MAN: TcxGridDBColumn;
        cxGrid1DBTableView1ID_PCARD: TcxGridDBColumn;
        cxGrid1DBTableView1ID_POCHAS_TARIF: TcxGridDBColumn;
        cxGrid1DBTableView1ID_POCHAS_TYPE: TcxGridDBColumn;
        cxGrid1DBTableView1ID_POCHAS_SMETA: TcxGridDBColumn;
        cxGrid1DBTableView1ID_ORDER_ITEM: TcxGridDBColumn;
        cxGrid1DBTableView1ID_DEPARTMENT: TcxGridDBColumn;
        cxGrid1DBTableView1ID_STATUS: TcxGridDBColumn;
        cxGrid1DBTableView1FIO: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_DEPARTMENT: TcxGridDBColumn;
        SelDataSet: TpFIBDataSet;
        cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
        btnAdd2: TdxBarLargeButton;
        SelDataSet2: TpFIBDataSet;
        cxGrid1DBTableView1NAME_POST: TcxGridDBColumn;
        dxBarLargeButton1: TdxBarLargeButton;
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
        procedure dxBarLargeButton1Click(Sender: TObject);
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

    TUP_PochasOrder = class(TSprav)
    public
        frm: TfrmPochasOrder;
        constructor Create;
        procedure Show; override;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation
uses uPochasAdd, uPochasDates;
{$R *.dfm}

function CreateSprav: TSprav;
begin
    Result := TUP_PochasOrder.Create;
end;

constructor TUP_PochasOrder.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('id_order', ftInteger);
    Input.FieldDefs.Add('id_order_type', ftInteger);
    Input.FieldDefs.Add('id_item', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('outer_hwnd', ftInteger);
  //0-добавление, 1-редактирование, 3-просмотр
    Input.FieldDefs.Add('mode', ftInteger);
    Input.FieldDefs.Add('num_item', ftInteger);
    Input.FieldDefs.Add('num_sub_item', ftInteger);
    PrepareMemoryDatasets;
end;

function TUP_PochasOrder.GetFrame: TFrame;
begin
    frm := TfrmPochasOrder.Create(Application.MainForm, Input, TISC_DB_HANDLE(integer(Input['DBHandle'])), true);
    Result := TFrame(frm);
end;

procedure TUP_PochasOrder.Show;
begin
    frm := TfrmPochasOrder.Create(Application.MainForm, Input, TISC_DB_HANDLE(integer(Input['DBHandle'])), false);
    frm.ShowModal;
    frm.Free;
end;

function TfrmPochasOrder.ShowFilter(id_session, id_order_type: int64): boolean;
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

procedure TfrmPochasOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    WriteDataSet.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'UP_KER_CLEAR_TMP_EX';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
    StoredProc.ExecProc;
    WriteDataSet.Transaction.Commit;
end;

procedure TfrmPochasOrder.SelectAll;
begin
    ReadDataSet.Close;
    ReadDataSet.ParamByName('ID_SESSION').AsInt64 := id_session;
    ReadDataSet.Open;
end;

procedure TfrmPochasOrder.btnAddClick(Sender: TObject);
var
    frm: TfrmPochasOrderAdd;
    id_order_item: integer;
    id_pcard: Variant;
    useFilter: boolean;
    Sel_Pcard: TpFIBDataSet;

    procedure Add;
    var
        i: integer;
    begin
        Sel_Pcard := TpFIBDataSet.Create(Self);
        Sel_Pcard.Database := Database;
        Sel_Pcard.Transaction := ReadTransaction;
        Sel_Pcard.Close;
        Sel_Pcard.SQLs.SelectSQL.Text := 'Select Distinct Id_Pcard From Private_Cards Where Id_Man=:Id_Man';
        Sel_Pcard.ParamByName('Id_Man').AsInteger := frm.ManEdit.Value;
        Sel_Pcard.Open;
        if VarIsNull(id_pcard) then id_pcard := Sel_Pcard['Id_Pcard'];
        StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_BUFF_I';
        StoredProc.Prepare;
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
        StoredProc.ParamByName('ID_ORDER').AsInt64 := input['id_order'];
        StoredProc.ParamByName('ID_ORDER_TYPE').AsInt64 := input['id_order_type'];
        StoredProc.ParamByName('DATE_BEG').AsDate := frm.DateBEgEdit.Value;
        StoredProc.ParamByName('DATE_END').AsDate := frm.DateEndEdit.Value;
        StoredProc.ParamByName('ID_MAN').AsVariant := frm.ManEdit.Value;
        StoredProc.ParamByName('ID_PCARD').AsVariant := id_pcard;
        StoredProc.ParamByName('ID_POCHAS_TARIF').AsVariant := frm.TarifEdit.Value;
        StoredProc.ParamByName('ID_POCHAS_TYPE').AsVariant := frm.TypePochasEdit.Value;
        StoredProc.ParamByName('ID_DEPARTMENT').AsVariant := frm.DepEdit.Value;
        StoredProc.ParamByName('ID_STATUS').AsVariant := null;
        StoredProc.ParamByName('FROM_FILTER').AsVariant := 0;
        StoredProc.ParamByName('REASON').AsVariant := frm.ReasonEdit.Value;
        StoredProc.ParamByName('NOTE').AsVariant := frm.NoteEdit.Value;
        StoredProc.ParamByName('NUM_ITEM').AsInteger := input['num_item'];
        StoredProc.ParamByName('NUM_SUBITEM').AsInteger := input['num_sub_item'];
        StoredProc.ParamByName('ID_POST').AsVariant := frm.PostEdit.Value;
        StoredProc.ParamByName('ID_POCHAS_PLAN_OLD').AsVariant := null;
        id_order_item := -1;
        try
            StoredProc.ExecProc;
            id_order_item := StoredProc['ID_ORDER_ITEM'].AsInt64;
        except
            StoredProc.Transaction.Rollback;
            exit;
        end;
        for i := 0 to frm.cxGrid1TableView1.DataController.Recordcount - 1 do
        begin
            StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_SMET_BUFF_I';
            StoredProc.Prepare;
            StoredProc.ParamByName('ID_SM').AsInt64 := frm.cxGrid1TableView1.DataController.Values[i, 0];
            StoredProc.ParamByName('HOURS').AsVariant := frm.cxGrid1TableView1.DataController.Values[i, 3];
            StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
            StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
            StoredProc.ParamByName('DO_ALL').AsInteger := 0;
            try
                StoredProc.ExecProc;
            except
                StoredProc.Transaction.Rollback;
                break;
            end;
        end;
        
        StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_TARIF_BUFF_I';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_POCHAS_TARIF').AsVariant := frm.TarifEdit.Value;
        StoredProc.ParamByName('DATE_BEG').AsDate := frm.DateBegEdit.Value;
        StoredProc.ParamByName('DATE_END').AsDate := frm.DateEndEdit.Value;
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
        StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
        StoredProc.ParamByName('DO_ALL').AsInteger := 0;
        try
            StoredProc.ExecProc;
        except
            StoredProc.Transaction.Rollback;
            exit;
        end;

{    StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_BUFF_CALC_SUM';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
    StoredProc.ParamByName('DO_ALL').AsInteger := 0;
    try
      StoredProc.ExecProc;
    except
      StoredProc.Transaction.Rollback;
    end;}
    end;

begin
    useFilter := Sender = btnAdd;
    id_pcard := null;

    if useFilter then if not ShowFilter(id_session, input['id_order_type']) then
        begin
            ShowMessage('Не відобрано записів');
            exit;
        end;
    frm := TfrmPochasOrderAdd.Create(Self);
    frm.Caption := 'Додати - ' + frm.Caption;
    frm.cbAll2.Blocked := ReadDataSet.RecordCount = 0;
    if not useFilter then frm.cbAll2.Value := False;
    if usefilter then frm.ManEdit.Blocked := true else
    begin
        frm.ManEdit.Required := true;
        frm.ManEdit.Asterisk := true;
    end;

    if frm.ShowModal = mrOK then
    begin
        StoredProc.Close;
        StoredProc.Transaction.StartTransaction;
        if not useFilter then
            Add
        else
        begin
            SelDataSet.ParamByName('KEY_SESSION').AsInt64 := id_session;
            SelDataSet.Open;
            while not SelDataSet.Eof do
            begin
                id_pcard := SelDataSet['ID_PCARD'];
                frm.ManEdit.Value := SelDataSet['ID_MAN'];
                Add;
                SelDataSet.Next;
            end;
            SelDataSet.Close;
        end;
        StoredProc.Close;
        StoredProc.Transaction.Commit;
        SelectAll;
    end;
    frm.Free;
end;

procedure TfrmPochasOrder.btnDeleteClick(Sender: TObject);
begin
    if ReadDataSet.RecordCount = 0 then exit;
    WriteTransaction.StartTransaction;
    StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_BUFF_DEL';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
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

procedure TfrmPochasOrder.btnOkClick(Sender: TObject);
var
    st: UP_KERNEL_MODE_STRUCTURE;
    doCommit: boolean;
begin
    err_id_order_item := -9999;
    if Mode = 2 then btnCancelClick(Sender);
    if ReadDataSet.RecordCount <> 0 then
    begin
        WriteTransaction.StartTransaction;
        doCommit := true;
        ReadDataSet.First;
        while not ReadDataSet.Eof do
        begin
            st.AOWNER := self;
            st.ID_ORDER := input['ID_ORDER'];
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
                Selectall;
                exit;
            end;
            ReadDataSet.Next;
        end;
        if doCommit then WriteTransaction.Commit;
    end;
    SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_OK, 0, 0);
end;

constructor TfrmPochasOrder.Create(AOwner: TComponent; inp: TRxMemoryData; hnd: TISC_DB_HANDLE; in_isFrame: boolean);
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
        StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_BUFF_FILL';
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
        btnAdd2.Enabled := false;
        btnEdit.Enabled := false;
        btnDelete.Enabled := false;
        btnOk.Enabled := false;
    end;
end;

procedure TfrmPochasOrder.btnEditClick(Sender: TObject);
var
    frm: TfrmPochasOrderAdd;
    id: int64;
    idx: integer;
    i: integer;
begin
    if ReadDataSet.RecordCount = 0 then exit;
    id := ReadDataSet['ID_ORDER_ITEM'];
    frm := TfrmPochasOrderAdd.Create(Self);
    frm.Caption := 'Змінити - ' + frm.Caption;
    frm.ManEdit.Blocked := true;
    frm.cbAll2.Value := False;
    if Mode = 2 then
    begin
        frm.btnAdd.Enabled := false;
        frm.btnEdit.Enabled := false;
        frm.btnDelete.Enabled := false;
        qFBlock(true, frm);
    end;

    frm.DateBegEdit.Value := ReadDataSet['DATE_BEG'];
    frm.DateEndEdit.Value := ReadDataSet['DATE_END'];
    frm.TarifEdit.Value := ReadDataSet['ID_POCHAS_TARIF'];
    frm.TarifEdit.DisplayText := ReadDataSet['TARIF'];
    frm.TypePochasEdit.Value := ReadDataSet['ID_POCHAS_TYPE'];
    frm.TypePochasEdit.DisplayText := ReadDataSet['POCHAS_TYPE'];
    frm.ManEdit.DisplayText := ReadDataSet['FIO'];
    frm.ManEdit.Blocked := true;
    frm.DepEdit.Value := ReadDataSet['ID_DEPARTMENT'];
    frm.DepEdit.DisplayText := ReadDataSet['NAME_DEPARTMENT'];
    frm.ReasonEdit.Value := ReadDataSet['REASON'];
    frm.NoteEdit.Value := ReadDataSet['NOTE'];
    frm.PostEdit.Value := ReadDataSet['ID_POST'];
    frm.PostEdit.DisplayText := ReadDataSet['NAME_POST'];

    SelDataSet2.ParamByName('KEY_SESSION').AsInt64 := id_session;
    SelDataSet2.ParamByName('ID_ORDER_ITEM').AsInt64 := id;
    SelDataSet2.Open;
    while not SelDataSet2.Eof do
    begin
        frm.cxGrid1TableView1.DataController.RecordCount := frm.cxGrid1TableView1.DataController.RecordCount + 1;
        idx := frm.cxGrid1TableView1.DataController.RecordCount - 1;
        frm.cxGrid1TableView1.DataController.Values[idx, 0] := SelDataSet2['ID_SM'];
        frm.cxGrid1TableView1.DataController.Values[idx, 1] := SelDataSet2['KOD'];
        frm.cxGrid1TableView1.DataController.Values[idx, 2] := SelDataSet2['NAME_SMET'];
        frm.cxGrid1TableView1.DataController.Values[idx, 3] := SelDataSet2['HOURS'];
        SelDataSet2.Next;
    end;
    SelDataSet2.Close;
    if (frm.ShowModal = mrOK) and (Mode <> 2) then
    begin
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_BUFF_U';
        StoredProc.Prepare;
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
        StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id;
        if frm.cbAll2.Value then StoredProc.ParamByName('UPDATE_ALL').AsInteger := 1 else StoredProc.ParamByName('UPDATE_ALL').AsInteger := 0;
        StoredProc.ParamByName('DATE_BEG').AsDate := frm.DateBegEdit.Value;
        StoredProc.ParamByName('DATE_END').AsDate := frm.DateEndEdit.Value;
        StoredProc.ParamByName('ID_POCHAS_TARIF').AsVariant := frm.TarifEdit.Value;
        StoredProc.ParamByName('ID_POCHAS_TYPE').AsVariant := frm.TypePochasEdit.Value;
        StoredProc.ParamByName('ID_DEPARTMENT').AsVariant := frm.DepEdit.Value;
        StoredProc.ParamByName('NOTE').AsVariant := frm.NoteEdit.Value;
        StoredProc.ParamByName('ID_POST').AsVariant := frm.PostEdit.Value;
        StoredProc.ParamByName('REASON').AsVariant := frm.ReasonEdit.value;
        StoredProc.ParamByName('ID_POCHAS_PLAN_OLD').AsVariant := null;
        try
            StoredProc.ExecProc;
        except
            StoredProc.Transaction.Rollback;
        end;

        StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_SMET_BUFF_D';
        StoredProc.Prepare;
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
        StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id;
        if frm.cbAll2.Value then StoredProc.ParamByName('DO_ALL').AsInteger := 1 else StoredProc.ParamByName('DO_ALL').AsInteger := 0;
        try
            StoredProc.ExecProc;
        except
            StoredProc.Transaction.Rollback;
        end;

        for i := 0 to frm.cxGrid1TableView1.DataController.Recordcount - 1 do
        begin
            StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_SMET_BUFF_I';
            StoredProc.Prepare;
            StoredProc.ParamByName('ID_SM').AsInt64 := frm.cxGrid1TableView1.DataController.Values[i, 0];
            StoredProc.ParamByName('HOURS').AsVariant := frm.cxGrid1TableView1.DataController.Values[i, 3];
            StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
            StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id;
            if frm.cbAll2.Value then StoredProc.ParamByName('DO_ALL').AsInteger := 1 else StoredProc.ParamByName('DO_ALL').AsInteger := 0;
            try
                StoredProc.ExecProc;
            except
                StoredProc.Transaction.Rollback;
                break;
            end;
        end;

        StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_TARIF_BUFF_D';
        StoredProc.Prepare;
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
        StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id;
        if frm.cbAll2.Value then StoredProc.ParamByName('DO_ALL').AsInteger := 1 else StoredProc.ParamByName('DO_ALL').AsInteger := 0;
        try
            StoredProc.ExecProc;
        except
            StoredProc.Transaction.Rollback;
        end;

        StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_TARIF_BUFF_I';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_POCHAS_TARIF').AsVariant := frm.TarifEdit.Value;
        StoredProc.ParamByName('DATE_BEG').AsDate := frm.DateBegEdit.Value;
        StoredProc.ParamByName('DATE_END').AsDate := frm.DateEndEdit.Value;
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
        StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id;
        if frm.cbAll2.Value then StoredProc.ParamByName('DO_ALL').AsInteger := 1 else StoredProc.ParamByName('DO_ALL').AsInteger := 0;
        try
            StoredProc.ExecProc;
        except
            StoredProc.Transaction.Rollback;
            exit;
        end;

        StoredProc.Transaction.Commit;
        SelectAll;
        ReadDataSet.Locate('ID_ORDER_ITEM', id, []);
    end;
    frm.Free;
end;

procedure TfrmPochasOrder.btnCancelClick(Sender: TObject);
begin
    if isFrame then SendMessage(input['outer_hwnd'], FMAS_MESS_CLOSE_FRAME, 0, 0) else Close;
end;

procedure TfrmPochasOrder.btnViewClick(Sender: TObject);
var
    md: integer;
begin
    md := Mode;
    Mode := 2;
    btnEditClick(Sender);
    Mode := md;
end;

procedure TfrmPochasOrder.cxGrid1DBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if key = VK_insert then btnAddClick(Self);
    if key = VK_DELETE then btnDeleteClick(Self);
    if key = VK_F2 then btnEditClick(Self);
    if ((Key = VK_F12) and (ssShift in Shift))
        then
    begin
        ShowInfo(ReadDataSet);
    end;
end;

procedure TfrmPochasOrder.FormShow(Sender: TObject);
begin
    cxGrid1.SetFocus;
end;

procedure TfrmPochasOrder.cxGrid1DBTableView1CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if AViewInfo.GridRecord.Values[cxGrid1DBTableView1ID_ORDER_ITEM.Index] = err_id_order_item then
    begin
        ACAnvas.Brush.Color := clRed;
    end;
end;

procedure TfrmPochasOrder.dxBarLargeButton1Click(Sender: TObject);
var
    id_order_old: int64;
    frm: TfrmPochasDates;
begin
    frm := TfrmPochasDates.Create(Self);
    if frm.ShowModal = mrOk then
    begin
        id_order_old := UpKernelUnit.GetOrderByRegInfo(self, Database.Handle);
        if id_order_old <> -1 then
        begin
            StoredProc.Transaction.StartTransaction;
            StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_BUFF_CLONE';
            StoredProc.Prepare;
            StoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
            StoredProc.ParamByName('ID_ORDER_OLD').AsInt64 := id_order_old;
            StoredProc.ParamByName('ID_ORDER_NEW').AsInt64 := input['id_order'];
            StoredProc.ParamByName('DATE_BEG').AsDate := frm.DateBegEdit.Date;
            StoredProc.ParamByName('DATE_END').AsDate := frm.DateEndEdit.Date;
            StoredProc.ExecProc;
            StoredProc.Transaction.Commit;
            SelectAll;
        end;
    end;
    frm.Free;
end;

end.

