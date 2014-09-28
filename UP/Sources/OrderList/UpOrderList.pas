unit UpOrderList;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Menus, IBDatabase, DB, IBCustomDataSet, IBQuery, StdCtrls, ComCtrls,
    Buttons, DBCtrls, ExtCtrls, Grids, DBGrids, ActnList,
    FIBDataSet, pFIBDataSet, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGrid, Clipbrd, ShellApi, Mask, ToolEdit, IBase, uCommonSp,
    dxBar, ImgList, dxBarExtItems, cxSplitter, uFormControl, cxContainer,
    cxLabel, Placemnt, cxTextEdit, cxCalc, ToolWin, pFibStoredProc, AppStruClasses,
    FIBDatabase, pFIBDatabase, RxMemDS, Accmgmt, cxMaskEdit, cxDropDownEdit,
    cxCalendar, cxCheckBox, cxButtonEdit, cxDBEdit, cxLookAndFeelPainters,
    cxButtons, cxTimeEdit, FIBQuery, pFIBQuery;

type
    TUPOrderList = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
        destructor Destroy; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

const Fields: array[0..2] of string = ('NUM_PROJECT', 'NUM_ORDER', 'NOTE');

type
    TUpOrderListForm = class(TForm)
        FilterPanel: TPanel;
        FilterBox: TGroupBox;
        ActionList: TActionList;
        AddOrder: TAction;
        ModifyOrder: TAction;
        DeleteOrder: TAction;
        PrintOrder: TAction;
        CloseForm: TAction;
        RefreshList: TAction;
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
        RefreshFilterAction: TAction;
        dxBDC_Order: TdxBarDockControl;
        dxBM_Order: TdxBarManager;
        IL_Orders: TImageList;
        dxBLB_Add: TdxBarLargeButton;
        dxBLB_Modify: TdxBarLargeButton;
        dxBLB_Delete: TdxBarLargeButton;
        dxBLB_Refresh: TdxBarLargeButton;
        dxBLB_Print: TdxBarLargeButton;
        dxBLB_NotAccept: TdxBarLargeButton;
        dxBLB_Accept: TdxBarLargeButton;
        dxBLB_Select: TdxBarLargeButton;
        dxBLB_Close: TdxBarLargeButton;
        dxBCCI_Space: TdxBarControlContainerItem;
        AcceptOrder: TAction;
        NotAccept: TAction;
        SelectOrder: TAction;
        cxS_Filter: TcxSplitter;
        DS_OrderList: TDataSource;
        DS_OrderItems: TDataSource;
        dxBarButton1: TdxBarButton;
        dxBarButton2: TdxBarButton;
        dxBarLargeButton1: TdxBarLargeButton;
        PopupMenu1: TPopupMenu;
        N1: TMenuItem;
        N2: TMenuItem;
        DetailItemsDataSource: TDataSource;
        LevelsObjectPathDataSource: TDataSource;
        LevelsObjectPathDataSet: TpFIBDataSet;
        TypesObjectDataSource: TDataSource;
        TypesObjectPathDataSet: TpFIBDataSet;
        dxBarLargeButton2: TdxBarLargeButton;
        dxBarLargeButton3: TdxBarLargeButton;
        LevelsDataSet: TpFIBDataSet;
        LevelsDataSource: TDataSource;
        cxLabel1: TcxLabel;
        StopOrderButton: TdxBarLargeButton;
        OrderViewObjectDataSet: TDataSource;
        OrderViewObject: TpFIBDataSet;
        DateBeg: TcxDateEdit;
        DateEnd: TcxDateEdit;
        OrderGrid: TcxGrid;
        MainOrderView: TcxGridDBTableView;
        MainOrderViewDBColumn1: TcxGridDBColumn;
        MainOrderViewDBColumn6: TcxGridDBColumn;
        MainOrderViewDBColumn7: TcxGridDBColumn;
        MainOrderViewDBColumn16: TcxGridDBColumn;
        MainOrderViewDBColumn3: TcxGridDBColumn;
        MainOrderViewDBColumn4: TcxGridDBColumn;
        MainOrderViewDBColumn5: TcxGridDBColumn;
        MainOrderViewDBColumn8: TcxGridDBColumn;
        MainOrderViewDBColumn9: TcxGridDBColumn;
        MainOrderViewDBColumn10: TcxGridDBColumn;
        MainOrderViewDBColumn11: TcxGridDBColumn;
        MainOrderViewDBColumn12: TcxGridDBColumn;
        MainOrderViewDBColumn13: TcxGridDBColumn;
        IS_STOP: TcxGridDBColumn;
        MainOrderViewDBColumn15: TcxGridDBColumn;
        MainOrderViewDBColumn17: TcxGridDBColumn;
        OrderGridLevel1: TcxGridLevel;
        CheckBox1: TcxCheckBox;
        FilterDateBeg: TcxCheckBox;
        FilterDateEnd: TcxCheckBox;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        WorkDatabase: TpFIBDatabase;
        OrderListDataSource: TDataSource;
        OrderList: TpFIBDataSet;
        ViewAction: TAction;
        TypesDataSource: TDataSource;
        TypesDataSet: TpFIBDataSet;
        cxCheckBox2: TcxCheckBox;
        FIO: TcxButtonEdit;
        Panel1: TPanel;
        cxDBTextEdit1: TcxDBTextEdit;
        Label1: TLabel;
        cxSplitter1: TcxSplitter;
        MainOrderViewDBColumn18: TcxGridDBColumn;
        ImageList1: TImageList;
        PlanBplDataSet: TpFIBDataSet;
        PlanBplDataSource: TDataSource;
        dxBarLargeButton4: TdxBarLargeButton;
        ExtRepDataSet: TpFIBDataSet;
        ExtRepDataSource: TDataSource;
        Label2: TLabel;
        CheckReestrAttrDataSet: TpFIBDataSet;
        CheckReestrAttrDataSource: TDataSource;
        Label3: TLabel;
        SearchEdit: TEdit;
        cxCB_FieldName: TcxComboBox;
        dxbrbtn1: TdxBarButton;
        dxbrbtn2: TdxBarButton;
        dxBarLargeButton5: TdxBarLargeButton;
        SpecModulesDataSet: TpFIBDataSet;
        dsSpecModuleDataSource: TDataSource;
        cxSortByFieldInfo: TcxComboBox;
        Label4: TLabel;
        SpeedButton1: TSpeedButton;
        cxCheckProj: TcxCheckBox;
        cxProj: TcxTextEdit;
        MainOrderViewDBColumn2: TcxGridDBColumn;
        MainOrderViewDBColumn14: TcxGridDBColumn;
        ExtFunctions: TPopupMenu;
        N3: TMenuItem;
        ShowPremiaSum: TMenuItem;
        ProcessPanel: TPanel;
        lbl1: TLabel;
        ItemsProgressBar: TProgressBar;
        cxDTime: TcxTextEdit;
        DSSelShablon: TpFIBDataSet;
        DSItems: TpFIBDataSet;
        StorProc: TpFIBStoredProc;
        ReformTrans: TpFIBTransaction;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CloseFormExecute(Sender: TObject);
        procedure PrintOrderExecute(Sender: TObject);
        procedure AddOrderExecute(Sender: TObject);
        procedure ModifyOrderExecute(Sender: TObject);
        procedure RefreshListExecute(Sender: TObject);
        procedure DateBegChange(Sender: TObject);
        procedure CheckBox1Click(Sender: TObject);
        procedure dxBarLargeButton1Click(Sender: TObject);
        procedure dxBarLargeButton2Click(Sender: TObject);
        procedure dxBarLargeButton3Click(Sender: TObject);
        procedure MainOrderViewStylesGetContentStyle(
            Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
            AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
        procedure dxBLB_AcceptClick(Sender: TObject);
        procedure MainOrderViewFocusedRecordChanged(
            Sender: TcxCustomGridTableView; APrevFocusedRecord,
            AFocusedRecord: TcxCustomGridRecord;
            ANewItemRecordFocusingChanged: Boolean);
        procedure dxBLB_NotAcceptClick(Sender: TObject);
        procedure MainOrderViewDblClick(Sender: TObject);
        procedure StopOrderButtonClick(Sender: TObject);
        procedure DeleteOrderExecute(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure AcceptFilterButtonClick(Sender: TObject);
        procedure FilterDateBegPropertiesChange(Sender: TObject);
        procedure cxCheckBox1PropertiesChange(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure MainOrderViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure IS_STOPCustomDrawCell(Sender: TcxCustomGridTableView;
            ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
            var ADone: Boolean);
        procedure dxBarLargeButton4Click(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure dxBarLargeButton5Click(Sender: TObject);
        procedure cxButton1Click(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure N3Click(Sender: TObject);
        procedure ShowPremiaSumClick(Sender: TObject);
        procedure cxProjKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure MainOrderViewCellClick(Sender: TcxCustomGridTableView;
            ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
            AShift: TShiftState; var AHandled: Boolean);
        procedure MainOrderViewKeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
        CurridOrderForUpdate: Int64;
        CurrIdPCard: Int64;
        procedure OnUpdateData(var Msg: TMessage); message FMAS_MESS_UPDATE_DATA;
        procedure UpdateData(id_: int64 = -1);
        procedure SaveOrderOnMinLevel(id_: Int64);
        procedure SaveOrderOnUpperLevel(id_: Int64);
        procedure RemoveOrderOnDownLevel(id_: Int64);
        procedure SaveOrderOnDownLevel(id_: Int64);
        procedure ReformBodyItems(IdOrder: int64);
        function CheckActionByIdUser(ACTION: string): Boolean;
        function CheckSignActionByIdUser(ACTION: string; TO_UP_LEVEL: Integer): Boolean;
        function CheckVacByIdUser: Boolean;
        function CheckIdOrder: Boolean;
        constructor Create(aOwner: TComponent; DbHandle: Tisc_db_handle); reintroduce;
    public

    end;

type
    btn_state_rec = record
        BLB_Add: Boolean;
        BLB_Modify: Boolean;
        BarLargeButton3: Boolean;
        BarLargeButton2: Boolean;
        BLB_Accept: Boolean;
        BLB_NotAccept: Boolean;
        StopOrderBut: Boolean;
        BLB_Print: Boolean;
        BarLargeButton4: Boolean;
        BarLargeButton5: Boolean;
        BarLargeButton1: Boolean;
    end;

implementation

uses UpOrderListSettings, cxDBLookupComboBox, UpKernelUnit, BaseTypes, mATH, UDependOrders, UpOrderEdit,
    Types, UPathHistory, {ZcxLocateBar,} Kernel, USpecModules, WindowThread, UShowSaveErrors, UShowMaxRate,
    UShowFirstCheck, UProgressForm, UPremiaSum;

{$R *.dfm}

function CreateSprav: TSprav;
begin
    Result := TUPOrderList.Create;
end;

constructor TUPOrderList.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('ShowMod', ftInteger);
    OutPut.FieldDefs.Add('Id_order', ftLargeint);

    PrepareMemoryDatasets;
end;

destructor TUPOrderList.Destroy;
begin
    inherited;
end;

procedure TUPOrderList.Show;
var OrderListForm: TUpOrderListForm;
begin

    OrderListForm := TUpOrderListForm.Create(Application.MainForm,
        TISC_DB_HANDLE(Integer(Input['DBHandle'])));
    if (not VarIsNull(Input['ShowStyle']))
        then begin
        if (Input['ShowStyle'] = 0)
            then begin
            if OrderListForm.ShowModal = mrOk
                then begin
                                //Забираем идентификатор выбранного приказа
            end;
            OrderListForm.Free;
        end
        else begin
            OrderListForm.FormStyle := fsMDIChild;
            OrderListForm.Show;
        end;
    end
    else begin
        if OrderListForm.ShowModal = mrOk
            then begin
                       //Забираем идентификатор выбранного приказа
        end;
    end;
end;

constructor TUpOrderListForm.Create(aOwner: TComponent; DBHandle: TISC_DB_HANDLE);
var GetDataConsts: TpFibDataSet;
    D, M, Y, Hour, Min, Sec, MSec: Word;
begin
    inherited Create(nil);

    CurridOrderForUpdate := -1;
    cxCB_FieldName.ItemIndex := 0;
    cxSortByFieldInfo.ItemIndex := 0;

    try
        DecodeDate(Date, Y, M, D);
        DecodeTime(Time, Hour, Min, Sec, MSec);
        self.Name := self.Name + IntToStr(Y) + IntToStr(M) + IntToStr(D) + IntToStr(Hour) + IntToStr(Min) + IntToStr(Sec);
    except on Exception do begin end;

    end;
    WorkDatabase.Handle := DbHandle;
    ReadTransaction.StartTransaction;

    PlanBplDataSet.SelectSQL.Text := 'SELECT * FROM HL_SYS_BPL_SEL';
    PlanBplDataSet.Open;


    GetDataConsts := TpFibDataSet.Create(self);
    GetDataConsts.Database := WorkDatabase;
    GetDataConsts.Transaction := ReadTransaction;
    GetDataConsts.SelectSQL.Text := 'select * from UP_SYS_INI_CONSTS_SEL';
    GetDataConsts.Open;
    if (GetDataConsts.RecordCount > 0)
        then begin
        if (GetDataConsts.FieldByName('RETURN_DAY_COUNT').Value <> null)
            then DateBeg.Date := Date() - GetDataConsts.FieldByName('RETURN_DAY_COUNT').AsInteger
        else DateBeg.Date := Date();
        DateEnd.Date := Date;
    end
    else begin
        DateBeg.Date := Date;
        DateEnd.Date := Date;
    end;

    GetDataConsts.Close;
    GetDataConsts.Free;


    UpdateData;

    LevelsObjectPathDataSet.Database := WorkDatabase;
    TypesObjectPathDataSet.Database := WorkDatabase;
    LevelsObjectPathDataSet.Transaction := ReadTransaction;
    TypesObjectPathDataSet.Transaction := ReadTransaction;
    OrderViewObject.Database := WorkDatabase;
    OrderViewObject.Transaction := ReadTransaction;
    CheckReestrAttrDataSet.Database := WorkDatabase;
    CheckReestrAttrDataSet.Transaction := ReadTransaction;



    ExtRepDataSet.Open;

    LevelsObjectPathDataSet.Open;
    TypesObjectPathDataSet.Open;
    OrderViewObject.Open;
    CheckReestrAttrDataSet.Open;

    LevelsDataSet.Database := WorkDatabase;
    LevelsDataSet.Transaction := ReadTransaction;
    LevelsDataSet.SelectSQL.Text := 'SELECT * FROM UP_SYS_LEVEL_COLORS_SEL(-1)';
    LevelsDataSet.Open;

    TypesDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_ORDER_TYPE WHERE ID_TYPE>0';
    TypesDataSet.Open;

    SpecModulesDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_SPECIAL_EDIT_MODULES_SEL';
    SpecModulesDataSet.Open;

    SendMessage(handle, WM_SIZE, SIZE_MAXIMIZED, 0);
end;

procedure TUpOrderListForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TUpOrderListForm.CloseFormExecute(Sender: TObject);
begin
    Close;
end;

procedure TUpOrderListForm.ReformBodyItems(IdOrder: int64);
var
    id_ses, id_item: int64;
    s, shablon: string;
    HandlePack: HModule;
    func: function(hConnection: TISC_DB_HANDLE; id_session, id_item: Int64): string; stdcall;
begin
    DSItems.Close;
    DSItems.SQLs.SelectSQL.Text := 'select * from UP_DT_ORDER_PRINT_SEL_TYPE_PR(' + IntToStr(IdOrder) + ')';
    DSItems.Open;
    DSItems.First;
    while not DSItems.Eof do
    begin
        DSSelShablon.Close;
        DSSelShablon.SQLs.SelectSQL.Text := 'Select * from UP_DT_ORDER_PRINT_SEL_PARAM(:ID_ITEM)';
        DSSelShablon.ParamByName('ID_ITEM').AsInt64 := DSItems['ID_ITEM'];
        DSSelShablon.Open;
        id_ses := StrToInt64(DSSelShablon.fbn('R_ID_SESSION').AsString);
        id_item := StrToInt64(DSItems.fbn('ID_ITEM').AsString);
        if (DSSelShablon.fbn('R_BPL_NAME').isNull) then shablon := ''
        else shablon := DSSelShablon.fbn('R_BPL_NAME').AsString;
        DSSelShablon.Transaction.Commit;
        DSSelShablon.Close;
        if (shablon <> '') then
        begin
            HandlePack := GetModuleHandle(PCHar(shablon));
            if HandlePack < 32 then
            begin
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + '\UP\' + shablon);
            end;
            if HandlePack > 0 then
            begin
                @func := GetProcAddress(HandlePack, PChar('GetTemplateString'));
                if @func <> nil
                    then
                    try
                    s := func(WorkDatabase.Handle, id_ses, id_item)
                    except on E: Exception do
                        ShowMessage(E.Message);
                    end
                else begin
                    MessageBox(Handle, PChar('Помилка - ' + shablon), PChar('Error'), MB_OK and MB_ICONWARNING);
                    EXIT;
                end;
            end;
            try
                StorProc.Transaction.StartTransaction;
                StorProc.StoredProcName := 'UP_DT_ORDER_PRINT_UPDATE_ITEM_B';
                StorProc.Prepare;
                StorProc.ParamByName('D_BODY').Value := s;
                StorProc.ParamByName('D_ID_ITEMS').AsInt64 := id_item;
                StorProc.ExecProc;
                StorProc.Transaction.Commit;

                StorProc.Transaction.StartTransaction;
                StorProc.StoredProcName := 'UP_DT_ORDER_ITEM_BODY_DELETE';
                StorProc.Prepare;
                StorProc.ParamByName('D_ID_SESSION').AsInt64 := id_ses;
                StorProc.ExecProc;
                StorProc.Transaction.Commit;
            except on E: Exception do
                begin
                    StorProc.Transaction.Rollback;
                    ShowMessage(E.Message);
                end;
            end;
        end;
        DSItems.Next;
    end;
end;

procedure TUpOrderListForm.PrintOrderExecute(Sender: TObject);
var
    sp: TSprav;
begin
    if (OrderList.RecordCount > 0)
        then begin
        if CheckActionByIdUser('PRINT')
            then begin
            try
                            // создать справочник
                sp := GetSprav('up\UP_OrderPrint');
                if sp <> nil
                    then begin
                               // заполнить входные параметры
                    with sp.Input do
                    begin
                        Append;
                        FieldValues['DBHandle'] := Integer(WorkDatabase.Handle);
                        FieldValues['id_order'] := OrderList['id_order'];
                        Post;
                    end;
                               // показать справочник и проанализировать результат (выбор одного подр.)
                    sp.Show;
                    sp.Free;
                end
                else ShowMessage('Ця частина ще знаходиться в розробці!');
            except on e: Exception do
                    MessageDlg('Помилка: ' + e.Message, mtError, [mbOk], 0);
            end;
        end
        else agShowMessage('Ви не маєте права виконати цю дію!');
    end;
end;

procedure TUpOrderListForm.AddOrderExecute(Sender: TObject);
begin
    TUpEditOrder.Create(Self, fmAdd, -1, WorkDatabase.Handle);
end;

procedure TUpOrderListForm.ModifyOrderExecute(Sender: TObject);
var i: Integer;
    f: Boolean;
begin
    f := true;
    for i := 0 to Application.MainForm.MDIChildCount - 1 do
    begin
        if Application.MainForm.MDIChildren[i] is TUpEditOrder
            then begin
            if (Application.MainForm.MDIChildren[i] as TUpEditOrder).Id_Order = StrToInt64(OrderList.FieldByName('id_order').AsString)
                then begin
                f := false;
                Application.MainForm.MDIChildren[i].BringToFront;
            end;
        end;
    end;
    if f then
        if OrderList.FieldByName('ID_LEVEL').Value = null
            then begin
            if (MainOrderView.Controller.FocusedRecord.Values[16] = GetUserId)
                or CheckActionByIdUser('EDIT')
                then
                TUpEditOrder.Create(Self, fmModify, OrderList['id_order'], WorkDatabase.Handle)
            else TUpEditOrder.Create(Self, fmClone, OrderList['id_order'], WorkDatabase.Handle)
        end
        else TUpEditOrder.Create(Self, fmInfo, OrderList['id_order'], WorkDatabase.Handle);

end;

procedure TUpOrderListForm.RefreshListExecute(Sender: TObject);
begin
    cxLabel1.Visible := false;
    if (OrderList.RecordCount > 0)
        then UpdateData(StrToInt64(OrderList.FieldByName('ID_ORDER').AsString))
    else UpdateData;
end;

procedure TUpOrderListForm.DateBegChange(Sender: TObject);
begin
    {OrderList.Close;
    cxLabel1.Visible:=True;   }
end;

procedure TUpOrderListForm.CheckBox1Click(Sender: TObject);
var I: Integer;
begin
    for i := 0 to MainOrderView.ColumnCount - 1 do
    begin
        MainOrderView.Columns[i].Options.Filtering := CheckBox1.Checked;
    end;
end;

procedure TUpOrderListForm.dxBarLargeButton1Click(Sender: TObject);
var T: TfrmGetSettings;
    IUStoredProc: TpFibStoredProc;
    GetDataConsts: TpFibDataSet;
begin
    if CheckActionByIdUser('CONFIGURE')
        then begin
        T := TfrmGetSettings.Create(self);
        GetDataConsts := TpFibDataSet.Create(self);
        GetDataConsts.Database := WorkDatabase;
        GetDataConsts.Transaction := ReadTransaction;
        GetDataConsts.SelectSQL.Text := 'select * from UP_SYS_INI_CONSTS_SEL';
        GetDataConsts.Open;
        if (GetDataConsts.RecordCount > 0)
            then begin
            if GetDataConsts.FieldByName('USE_CHECK_MAX_RATE_COUNT').Value <> null
                then T.UseMaxRateCount.Checked := Boolean(GetDataConsts.FieldByName('USE_CHECK_MAX_RATE_COUNT').asInteger);

            if GetDataConsts.FieldByName('MAX_RATE_COUNT').Value <> null
                then T.MaxRateCount.Value := GetDataConsts.FieldByName('MAX_RATE_COUNT').Value;

            if GetDataConsts.FieldByName('MAY_WORK_WITH_DISMISS').Value <> null
                then T.cxchckbxMAY_WORK_WITH_DISMISS.Checked := Boolean(GetDataConsts.FieldByName('MAY_WORK_WITH_DISMISS').AsInteger);

            if GetDataConsts.FieldByName('ACCESS_ROOT_OBJECT').Value <> null
                then T.LevelsObject.EditValue := GetDataConsts.FieldByName('ACCESS_ROOT_OBJECT').Value;

            if GetDataConsts.FieldByName('ACCESS_ROOT_OBJECT_TYPES').Value <> null
                then T.TypesObject.EditValue := GetDataConsts.FieldByName('ACCESS_ROOT_OBJECT_TYPES').Value;

            if GetDataConsts.FieldByName('ACCESS_CHECK_VIEW_OBJECT').Value <> null
                then T.ReestrObject.EditValue := GetDataConsts.FieldByName('ACCESS_CHECK_VIEW_OBJECT').Value;

            if GetDataConsts.FieldByName('ACCESS_REGEST_ATRIBUTE').Value <> null
                then T.CheckReestrAttr.EditValue := GetDataConsts.FieldByName('ACCESS_REGEST_ATRIBUTE').Value;

            if GetDataConsts.FieldByName('USE_ACCESS_SYSTEM').Value <> null
                then T.UseAccessInfo.Checked := Boolean(GetDataConsts.FieldByName('USE_ACCESS_SYSTEM').AsInteger);

            if GetDataConsts.FieldByName('RETURN_DAY_COUNT').Value <> null
                then T.RETURN_DAY_COUNT.Text := GetDataConsts.FieldByName('RETURN_DAY_COUNT').Value;

            if GetDataConsts.FieldByName('USE_CHECK_MAX_POCHAS_COUNT').Value <> null
                then T.USE_CHECK_MAX_POCHAS_COUNT.Checked := Boolean(GetDataConsts.FieldByName('USE_CHECK_MAX_POCHAS_COUNT').AsInteger);

            if GetDataConsts.FieldByName('USE_RAISE_ABSORB').Value <> null
                then T.USE_RAISE_ABSORB.Checked := Boolean(GetDataConsts.FieldByName('USE_RAISE_ABSORB').AsInteger);

            if GetDataConsts.FieldByName('MAX_POCHAS_COUNT').Value <> null
                then T.MAX_POCHAS_COUNT.Value := GetDataConsts.FieldByName('MAX_POCHAS_COUNT').Value;

            if GetDataConsts.FieldByName('USE_AUTO_HOLIDAY_FOR_SOVMEST').Value <> null
                then T.USE_AUTO_HOLIDAY_FOR_SOVMEST.Checked := Boolean(GetDataConsts.FieldByName('USE_AUTO_HOLIDAY_FOR_SOVMEST').AsInteger);


            if GetDataConsts.FieldByName('ENABLE_EDIT_PROJECT_NUM').Value <> null
                then T.ENABLE_EDIT_PROJECT_NUM.Checked := Boolean(GetDataConsts.FieldByName('ENABLE_EDIT_PROJECT_NUM').AsInteger);


            if GetDataConsts.FieldByName('PERMIT_NOT_UNIQ_ORDER_NUM').Value <> null
                then T.PERMIT_NOT_UNIQ_ORDER_NUM.Checked := Boolean(GetDataConsts.FieldByName('PERMIT_NOT_UNIQ_ORDER_NUM').AsInteger);


            if (GetDataConsts.FieldByName('ID_TYPE_HOLIDAY_FREE').Value <> null)
                then begin
                T.ID_TYPE_HOLIDAY := GetDataConsts.FieldByName('ID_TYPE_HOLIDAY_FREE').Value;
                T.HOLIDAY_FOR_SOVMEST_FULL_NAME.Text := GetDataConsts.FieldByName('HOLIDAY_FOR_SOVMEST_FULL_NAME').AsString;
            end;

            if (GetDataConsts.FieldByName('ACCEPT_SHADOW_ID_TYPE').Value <> null)
                then begin
                T.ACCEPT_SHADOW_ID_TYPE := GetDataConsts.FieldByName('ACCEPT_SHADOW_ID_TYPE').Value;
                T.ACCEPT_SHADOW_ID_TYPE_TEXT.Text := GetDataConsts.FieldByName('ACCEPT_SHADOW_NAME').AsString;
            end;

            if (GetDataConsts.FieldByName('SET_BONUS_SHADOW_ID_TYPE').Value <> null)
                then begin
                T.SET_BONUS_SHADOW_ID_TYPE := GetDataConsts.FieldByName('SET_BONUS_SHADOW_ID_TYPE').Value;
                T.SET_BONUS_SHADOW_ID_TYPE_TEXT.Text := GetDataConsts.FieldByName('SET_BONUS_SHADOW_NAME').AsString;
            end;

            if (GetDataConsts.FieldByName('SET_COMPENSS_SHADOW_ID_TYPE').Value <> null)
                then begin
                T.SET_COMPENSS_SHADOW_ID_TYPE := GetDataConsts.FieldByName('SET_COMPENSS_SHADOW_ID_TYPE').Value;
                T.SET_COMPENSS_SHADOW_ID_TYPE_TEXT.Text := GetDataConsts.FieldByName('SET_COMPENSS_SHADOW_NAME').AsString;
            end;

            if (GetDataConsts.FieldByName('SET_HOLIDAY_SHADOW_ID_TYPE').Value <> null)
                then begin
                T.SET_HOLIDAY_SHADOW_ID_TYPE := GetDataConsts.FieldByName('SET_HOLIDAY_SHADOW_ID_TYPE').Value;
                T.SET_HOLIDAY_SHADOW_ID_TYPE_TEXT.Text := GetDataConsts.FieldByName('SET_HOLIDAY_SHADOW_NAME').AsString;
            end;

            if (GetDataConsts.FieldByName('SET_AWAY_HOLIDAY_SHADOW_ID_TYPE').Value <> null)
                then begin
                T.SET_AWAY_HOLIDAY_SHADOW_ID_TYPE := GetDataConsts.FieldByName('SET_AWAY_HOLIDAY_SHADOW_ID_TYPE').Value;
                T.SET_AWAY_HOLIDAY_SHADOW_TEXT.Text := GetDataConsts.FieldByName('SET_AWAY_HOLIDAY_SHADOW_NAME').AsString;
            end;

            if (GetDataConsts.FieldByName('MOVE_SHADOW_ID_TYPE').Value <> null)
                then begin
                T.MOVE_SHADOW_ID_TYPE := GetDataConsts.FieldByName('MOVE_SHADOW_ID_TYPE').Value;
                T.MOVE_SHADOW_NAME.Text := GetDataConsts.FieldByName('MOVE_SHADOW_NAME').AsString;
            end;

            if (GetDataConsts.FieldByName('REMOVE_BONUS_SHADOW_ID_TYPE').Value <> null)
                then begin
                T.REMOVE_BONUS_SHADOW_ID_TYPE := GetDataConsts.FieldByName('REMOVE_BONUS_SHADOW_ID_TYPE').Value;
                T.REMOVE_BONUS_SHADOW_NAME.Text := GetDataConsts.FieldByName('REMOVE_BONUS_SHADOW_NAME').AsString;
            end;

            if (GetDataConsts.FieldByName('SET_FULL_AWAY_INST').Value <> null)
                then begin
                T.SET_FULL_AWAY_INST := GetDataConsts.FieldByName('SET_FULL_AWAY_INST').Value;
                T.SET_FULL_AWAY_INST_NAME.Text := GetDataConsts.FieldByName('SET_FULL_AWAY_INST_NAME').AsString;
            end;

            if (GetDataConsts.FieldByName('DEFAULT_WORK_LEVEL').Value <> null)
                then begin
                T.DEFAULT_WORK_LEVEL := GetDataConsts.FieldByName('DEFAULT_WORK_LEVEL').Value;
                T.DEFAULT_WORK_LEVEL_TEXT.Text := GetDataConsts.FieldByName('DEFAULT_WORK_LEVEL_NAME').AsString;
            end;

            if (GetDataConsts.FieldByName('CUR_PROJECT_NUM').Value <> null)
                then begin
                T.CUR_PROJECT_NUM.EditValue := GetDataConsts.FieldByName('CUR_PROJECT_NUM').Value;
            end;


        end;
        GetDataConsts.Close;
        GetDataConsts.Free;
        if T.ShowModal = mrYes
            then begin
            IUStoredProc := TpFibStoredProc.Create(self);
            IUStoredProc.Database := WorkDatabase;
            IUStoredProc.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            IUStoredProc.StoredProcName := 'UP_SYS_INI_CONSTS_IU';
            IUStoredProc.Prepare;
            IUStoredProc.ParamByName('USE_CHECK_MAX_RATE_COUNT').Value := Integer(T.UseMaxRateCount.Checked);
            IUStoredProc.ParamByName('MAX_RATE_COUNT').Value := T.MaxRateCount.Value;
            IUStoredProc.ParamByName('ACCESS_ROOT_OBJECT').Value := T.LevelsObject.EditValue;
            IUStoredProc.ParamByName('ACCESS_ROOT_OBJECT_TYPES').Value := T.TypesObject.EditValue;
            IUStoredProc.ParamByName('ACCESS_CHECK_VIEW_OBJECT').Value := T.ReestrObject.EditValue;
            IUStoredProc.ParamByName('ACCESS_REGEST_ATRIBUTE').Value := T.CheckReestrAttr.EditValue;
            IUStoredProc.ParamByName('USE_ACCESS_SYSTEM').Value := Integer(T.UseAccessInfo.Checked);
            IUStoredProc.ParamByName('ENABLE_EDIT_PROJECT_NUM').Value := Integer(T.ENABLE_EDIT_PROJECT_NUM.Checked);
            IUStoredProc.ParamByName('RETURN_DAY_COUNT').Value := T.RETURN_DAY_COUNT.Text;
            IUStoredProc.ParamByName('MAX_POCHAS_COUNT').Value := T.MAX_POCHAS_COUNT.Value;
            IUStoredProc.ParamByName('USE_RAISE_ABSORB').Value := Integer(T.USE_RAISE_ABSORB.Checked);
            IUStoredProc.ParamByName('USE_CHECK_MAX_POCHAS_COUNT').Value := Integer(T.USE_CHECK_MAX_POCHAS_COUNT.Checked);
            IUStoredProc.ParamByName('USE_AUTO_HOLIDAY_FOR_SOVMEST').Value := Integer(T.USE_AUTO_HOLIDAY_FOR_SOVMEST.Checked);
            IUStoredProc.ParamByName('ID_TYPE_HOLIDAY_FREE').Value := T.ID_TYPE_HOLIDAY;
            IUStoredProc.ParamByName('ACCEPT_SHADOW_ID_TYPE').Value := T.ACCEPT_SHADOW_ID_TYPE;
            IUStoredProc.ParamByName('SET_BONUS_SHADOW_ID_TYPE').Value := T.SET_BONUS_SHADOW_ID_TYPE;
            IUStoredProc.ParamByName('SET_COMPENSS_SHADOW_ID_TYPE').Value := T.SET_COMPENSS_SHADOW_ID_TYPE;
            IUStoredProc.ParamByName('SET_HOLIDAY_SHADOW_ID_TYPE').Value := T.SET_HOLIDAY_SHADOW_ID_TYPE;
            IUStoredProc.ParamByName('SET_AWAY_HOLIDAY_SHADOW_ID_TYPE').Value := T.SET_AWAY_HOLIDAY_SHADOW_ID_TYPE;
            IUStoredProc.ParamByName('DEFAULT_WORK_LEVEL').Value := T.DEFAULT_WORK_LEVEL;
            IUStoredProc.ParamByName('PERMIT_NOT_UNIQ_ORDER_NUM').Value := Integer(T.PERMIT_NOT_UNIQ_ORDER_NUM.Checked);
            IUStoredProc.ParamByName('SET_FULL_AWAY_INST').Value := T.SET_FULL_AWAY_INST;
            IUStoredProc.ParamByName('CUR_PROJECT_NUM').Value := T.CUR_PROJECT_NUM.EditValue;
            IUStoredProc.ParamByName('MOVE_SHADOW_ID_TYPE').Value := T.MOVE_SHADOW_ID_TYPE;
            IUStoredProc.ParamByName('REMOVE_BONUS_SHADOW_ID_TYPE').Value := T.REMOVE_BONUS_SHADOW_ID_TYPE;
            IUStoredProc.ParamByName('MAY_WORK_WITH_DISMISS').Value := Integer(T.cxchckbxMAY_WORK_WITH_DISMISS.Checked);
            IUStoredProc.ExecProc;
            WriteTransaction.Commit;
            IUStoredProc.Close;
            IUStoredProc.Free;
        end;
        T.Free;
    end
    else agShowMessage('Ви не маєте права виконати цю дію!');
end;

procedure TUpOrderListForm.dxBarLargeButton2Click(Sender: TObject);
begin
    cxLabel1.Visible := false;
    UpdateData;
end;

procedure TUpOrderListForm.dxBarLargeButton3Click(Sender: TObject);
var BufferSP: TpFibStoredproc;
    id_focus_index: Integer;
begin
    if (OrderList.RecordCount > 0)
        then begin
        if (OrderList.FieldByName('ID_LEVEL').Value = null)
            then begin
            if (MainOrderView.Controller.FocusedRecord.Values[16] = GetUserId)
                or CheckActionByIdUser('DEL')
                then begin
                if (agMessageDlg('Увага!', 'Ви хочете видалити наказ?', mtConfirmation, [mbYes, mbNo]) = mrYes)
                    then begin
                    try
                        WriteTransaction.StartTransaction;
                        BufferSP := TpFibStoredproc.Create(self);
                        BufferSP.Database := WorkDatabase;
                        BufferSP.Transaction := WriteTransaction;
                        BufferSP.StoredProcName := 'UP_DT_ORDERS_DEL';
                        BufferSP.Prepare;
                        BufferSP.ParamByName('ID_ORDER').asInt64 := StrToInt64(OrderList.FieldByName('ID_ORDER').AsString);
                        BufferSP.ExecProc;
                        BufferSP.Close;
                        BufferSP.Free;
                        id_focus_index := MainOrderView.Controller.FocusedRowIndex;
                        OrderList.CacheDelete;
                        MainOrderView.Controller.FocusedRowIndex := id_focus_index;


                        if WriteTransaction.InTransaction then WriteTransaction.Commit;
                    except on E: Exception do
                            agShowMessage('Зараз неможна видалити цей наказ!!');
                    end;
                end;
            end
            else agShowMessage('Ви не маєте права виконати цю дію!');
        end
        else agMessageDlg('Увага!', 'Наказ сформавано и підписано! ВИДАЛЕННЯ НЕМОЖЛИВЕ!', mtConfirmation, [mbOk]);
    end;
end;

procedure TUpOrderListForm.OnUpdateData(var Msg: TMessage);
begin
    if self.Active
        then UpdateData(Msg.WParam)
    else CurridOrderForUpdate := Msg.WParam;
end;

procedure TUpOrderListForm.UpdateData(id_: int64);
var CurrProj: string;
begin

    CurrProj := cxProj.Text;

    MainOrderView.Controller.BeginUpdate;
    try

        if OrderList.Active then OrderList.Close;

        OrderList.SelectSQL.Text := 'select * from UP_DT_ORDERS_SEL(' + '''' + DateToStr(DateBeg.Date) + '''' + ',' + '''' + DateToStr(DateEnd.Date) + '''' + ',' + IntToStr(CurrIdPCard) + ',' + '''' + CurrProj + '''' + ',' + IntToStr(GetUserId) + ',' + IntToStr(Integer(FilterDateBeg.Checked)) + ',' + IntToStr(Integer(FilterDateEnd.Checked)) + ',' + IntToStr(Integer(cxCheckBox2.Checked)) + ',' + IntToStr(Integer(cxCheckProj.Checked)) + ')';

        OrderList.Open;

{         If cxSortByFieldInfo.ItemIndex = 1 Then OrderList.DoSort(['NUM_PROJECT'], [true]);
        If cxSortByFieldInfo.ItemIndex = 2 Then OrderList.DoSort(['DATE_PROJECT'], [true]);
        If cxSortByFieldInfo.ItemIndex = 3 Then OrderList.DoSort(['NUM_ORDER_NUMERIC'], [true]);
        If cxSortByFieldInfo.ItemIndex = 4 Then OrderList.DoSort(['DATE_ORDER'], [true]);
        If cxSortByFieldInfo.ItemIndex = 5 Then OrderList.DoSort(['ID_LEVEL'], [true]);
        If cxSortByFieldInfo.ItemIndex = 6 Then OrderList.DoSort(['NOTE'], [true]);}

       //OrderList.DoSort(['SIGN_ORDER'], [true]);
        if cxSortByFieldInfo.ItemIndex = 0 then OrderList.DoSort(['SIGN_ORDER'], [true]);
        if cxSortByFieldInfo.ItemIndex = 1 then OrderList.DoSort(['NUM_PROJECT'], [true]);
        if cxSortByFieldInfo.ItemIndex = 2 then OrderList.DoSort(['DATE_PROJECT'], [true]);
        if cxSortByFieldInfo.ItemIndex = 3 then OrderList.DoSort(['NUM_ORDER_NUMERIC'], [true]);
        if cxSortByFieldInfo.ItemIndex = 4 then OrderList.DoSort(['DATE_ORDER'], [true]);
        if cxSortByFieldInfo.ItemIndex = 5 then OrderList.DoSort(['ID_LEVEL'], [true]);
        if cxSortByFieldInfo.ItemIndex = 6 then OrderList.DoSort(['NOTE'], [true]);

    except on Exception do begin end

    end;

    try
        OrderList.Locate('id_order', id_, []);
        if OrderList.RecordCount > 0 then
            cxDTime.Text := OrderList.FieldByName('DATETIME').Value
        else cxDTime.Text := '';

    except on Exception do begin end

    end;
    MainOrderView.Controller.EndUpdate;
end;

procedure TUpOrderListForm.MainOrderViewStylesGetContentStyle(
    Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
    AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var LocStyle: TcxStyle;
begin
    if (OrderList.RecordCount > 0)
        then begin
        if (ARecord.Values[10] <> null and ARecord.Values[9] <> null)
            then begin
            LocStyle := TcxStyle.Create(self);

            if ARecord.Values[10] <> null
                then LocStyle.Color := ARecord.Values[10];

            if ARecord.Values[9] <> null
                then LocStyle.TextColor := ARecord.Values[9];

            AStyle := LocStyle;
        end;
    end;
end;

procedure TUpOrderListForm.dxBLB_AcceptClick(Sender: TObject);
var ORDER_RECORD: RECORD_INFO_STRUCTURE;
    BlockResult: RESULT_STRUCTURE;
    btn_state: btn_state_rec;
begin
    with btn_state
        do
    begin
        BLB_Add := dxBLB_Add.Enabled;
        BLB_Modify := dxBLB_Modify.Enabled;
        BarLargeButton3 := dxBarLargeButton3.Enabled;
        BarLargeButton2 := dxBarLargeButton2.Enabled;
        BLB_NotAccept := dxBLB_NotAccept.Enabled;
        StopOrderBut := StopOrderButton.Enabled;
        BLB_Print := dxBLB_Print.Enabled;
        BarLargeButton4 := dxBarLargeButton4.Enabled;
        BarLargeButton5 := dxBarLargeButton5.Enabled;
        BarLargeButton1 := dxBarLargeButton1.Enabled;
    end;
    dxBLB_Add.Enabled := False;
    dxBLB_Modify.Enabled := False;
    dxBarLargeButton3.Enabled := False;
    dxBarLargeButton2.Enabled := False;
    dxBLB_NotAccept.Enabled := False;
    StopOrderButton.Enabled := False;
    dxBLB_Print.Enabled := False;
    dxBarLargeButton4.Enabled := False;
    dxBarLargeButton5.Enabled := False;
    dxBarLargeButton1.Enabled := False;

    dxBLB_Accept.Enabled := False;

    if (OrderList.RecordCount > 0)
        then begin
        UpdateData(StrToInt64(OrderList.FieldByName('ID_ORDER').AsString));

        if CheckIdOrder
            then begin
            if CheckSignActionByIdUser('SIGN', 1)
                then begin
                if (OrderList.FieldByName('ID_LEVEL').Value = null)
                    then begin
                    WriteTransaction.StartTransaction;

                    ORDER_RECORD.DBHANDLE := WorkDatabase.Handle;
                    ORDER_RECORD.TRHANDLE := WriteTransaction.Handle;
                    ORDER_RECORD.ID_RECORD := VarArrayOf([StrToInt64(OrderList.FieldByName('ID_ORDER').AsString)]);
                    ORDER_RECORD.TABLE_NAME := 'UP_DT_ORDERS';
                    ORDER_RECORD.PK_FIELD_NAME := VarArrayOf(['ID_ORDER']);
                    ORDER_RECORD.RAISE_FLAG := false;

                    BlockResult := Kernel.LockRecord(@ORDER_RECORD);

                    if (BlockResult.RESULT_CODE <> 1)
                        then begin
                        agMessageDlg('Увага!', 'Наказ заблокований або відкритий для роботи!!', mtWarning, [mbOk]);
                        if WriteTransaction.InTransaction then WriteTransaction.Rollback;
                        with btn_state
                            do
                        begin
                            dxBLB_Add.Enabled := BLB_Add;
                            dxBLB_Modify.Enabled := BLB_Modify;
                            dxBarLargeButton3.Enabled := BarLargeButton3;
                            dxBarLargeButton2.Enabled := BarLargeButton2;
                            dxBLB_NotAccept.Enabled := BLB_NotAccept;
                            StopOrderButton.Enabled := StopOrderBut;
                            dxBLB_Print.Enabled := BLB_Print;
                            dxBarLargeButton4.Enabled := BarLargeButton4;
                            dxBarLargeButton5.Enabled := BarLargeButton5;
                            dxBarLargeButton1.Enabled := BarLargeButton1;
                        end;

                        dxBLB_Accept.Enabled := True;

                        if OrderList.RecordCount > 0
                            then UpdateData(StrToInt64(OrderList.FieldByName('ID_ORDER').AsString));
                        Exit;
                    end;
                    if WriteTransaction.InTransaction then WriteTransaction.Rollback;

                    SaveOrderOnMinLevel(StrToInt64(OrderList.FieldByName('ID_ORDER').AsString))
                end
                else begin
                    SaveOrderOnUpperLevel(StrToInt64(OrderList.FieldByName('ID_ORDER').AsString));
                end;
            end
            else agShowMessage('Ви не маєте права виконати цю дію!');
        end
        else agShowMessage('Рівень наказу змінився! Спробуйте підписати наказ ще раз!');
    end;

    with btn_state
        do
    begin
        dxBLB_Add.Enabled := BLB_Add;
        dxBLB_Modify.Enabled := BLB_Modify;
        dxBarLargeButton3.Enabled := BarLargeButton3;
        dxBarLargeButton2.Enabled := BarLargeButton2;
        dxBLB_NotAccept.Enabled := BLB_NotAccept;
        StopOrderButton.Enabled := StopOrderBut;
        dxBLB_Print.Enabled := BLB_Print;
        dxBarLargeButton4.Enabled := BarLargeButton4;
        dxBarLargeButton5.Enabled := BarLargeButton5;
        dxBarLargeButton1.Enabled := BarLargeButton1;
    end;

    dxBLB_Accept.Enabled := True;

    if OrderList.RecordCount > 0
        then UpdateData(StrToInt64(OrderList.FieldByName('ID_ORDER').AsString));
end;

procedure TUpOrderListForm.MainOrderViewFocusedRecordChanged(
    Sender: TcxCustomGridTableView; APrevFocusedRecord,
    AFocusedRecord: TcxCustomGridRecord;
    ANewItemRecordFocusingChanged: Boolean);
begin
    if (OrderList.RecordCount > 0)
        then begin
        if AFocusedRecord <> nil
            then begin
            if (AFocusedRecord.Values[8] = Null) //если текущий уровень черновик
                then begin
                                    //Проверяем является ли пользователь владельцем приказа или нет
                if (AFocusedRecord.Values[16] = GetUserId)
                    or CheckActionByIdUser('EDIT')
                    then begin
                    dxBLB_Modify.Caption := 'Змінити';
                    dxBarLargeButton5.Enabled := True;
                    dxBarLargeButton3.Enabled := true;
                    //dxBLB_NotAccept.Enabled := false;
                    dxBLB_NotAccept.Enabled := true;
                    dxBLB_Accept.Enabled := true;
                    StopOrderButton.Enabled := false;
                end
                else begin
                    dxBLB_Modify.Caption := 'Перегляд';
                    dxBarLargeButton3.Enabled := false;
                    dxBarLargeButton5.Enabled := false;
                    //dxBLB_NotAccept.Enabled := false;
                    dxBLB_NotAccept.Enabled := true;
                    dxBLB_Accept.Enabled := true;
                    StopOrderButton.Enabled := false;
                end;
            end
            else begin //если текущий уровень не черновик
                dxBLB_Modify.Caption := 'Перегляд';
                dxBarLargeButton3.Enabled := false;
                dxBarLargeButton5.Enabled := false;

                if (AFocusedRecord.Values[13] = null) and (AFocusedRecord.Values[13] <> null)
                    then begin
                    dxBLB_Accept.Enabled := false;
                    StopOrderButton.Enabled := true;
                    dxBLB_NotAccept.Enabled := true;
                end;
                if (AFocusedRecord.Values[13] <> null) and (AFocusedRecord.Values[14] = null)
                    then begin
                    dxBLB_Accept.Enabled := true;
                    StopOrderButton.Enabled := true;
                    dxBLB_NotAccept.Enabled := true;
                end;
                if (AFocusedRecord.Values[13] <> null) and (AFocusedRecord.Values[14] <> null)
                    then begin
                    dxBLB_Accept.Enabled := true;
                    dxBLB_NotAccept.Enabled := true;
                    StopOrderButton.Enabled := true;
                end;

                if (AFocusedRecord.Values[IS_STOP.Index] = '!')
                    then StopOrderButton.Caption := 'Зн. відх.'
                else StopOrderButton.Caption := 'Відхилити';


            end;

        end;
    end;
end;

procedure TUpOrderListForm.RemoveOrderOnDownLevel(id_: Int64);
var I: Integer;
    KernelSP, UpdateSP: TpFibStoredProc;
    existsError: Boolean;
    CheckStoredProc: TpFibDataSet;
    DependError: Boolean;
    T: TfrmDependOList;
    GetItems: TpFibDataSet;
    Result_kod: Integer;
    ProgressForm: TfrmProcessPanel;
begin
    Screen.Cursor := crHourGlass;
    existsError := false;
    WriteTransaction.StartTransaction;

    ProcessPanel.Visible := True;
    self.Update;
    Application.ProcessMessages;

     //Проверяем есть ли приказы которые блокируют перевод приказа на уровень вверх
    DependError := false;
    CheckStoredProc := TpFibDataSet.Create(self);
    CheckStoredProc.SelectSQL.Text := '  SELECT distinct * FROM UP_KER_GET_ORDER_DEPEND(' +
        OrderList.FieldByName('ID_ORDER').AsString + ',NULL,' +
        OrderList.FieldByName('ID_LEVEL').AsString + ')';
    CheckStoredProc.Database := WorkDatabase;
    CheckStoredProc.Transaction := ReadTransaction;
    //WriteTransaction.StartTransaction;
    CheckStoredProc.Open;
    CheckStoredProc.FetchAll;
    if (CheckStoredProc.RecordCount > 0)
        then begin
        DependError := true;
        if agMessageDlg('Увага!', 'Не можна перевести наказ на рівень нище, бо є накази які блокують переведення!' + #13 +
            'Показати список наказів, які блокують перведення?', mtError, [mbYes, mbNo]) = mrYes
            then begin
            T := TfrmDependOList.Create(self);
            T.DependTextsMemoryData.CopyStructure(CheckStoredProc);
            T.DependTextsMemoryData.LoadFromDataSet(CheckStoredProc, CheckStoredProc.RecordCount, lmCopy);
            T.ShowModal;
            T.Free;
        end;
    end;
    CheckStoredProc.Close;
    CheckStoredProc.Free;

    if not DependError
        then begin
        KernelSP := TpFibStoredProc.Create(self);
        KernelSP.Database := WorkDatabase;
        KernelSP.Transaction := WriteTransaction;
        KernelSP.StoredProcName := 'UP_KER_UNDO_ORDER_DATA';

        GetItems := TpFibDataSet.Create(self);
        GetItems.Database := WorkDatabase;
        GetItems.Transaction := ReadTransaction;
        GetItems.SelectSQL.Text := ' SELECT * FROM UP_KER_GET_ITEMS_DEL_TREE(' + IntToStr(id_) + ',NULL)';
        GetItems.Open;
        GetItems.FetchAll;
        GetItems.First;

        ItemsProgressBar.Max := GetItems.RecordCount;
        ItemsProgressBar.Min := 0;
        ItemsProgressBar.Step := 1;

        if (GetItems.RecordCount > 0)
            then begin
            for i := 0 to GetItems.RecordCount - 1 do
            begin
                KernelSP.Prepare;

                Result_kod := 0;

                KernelSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(GetItems.FieldByName('id_item').AsString);

                try

                    KernelSP.ExecProc;
                    Result_kod := KernelSP.ParamByName('RESULT_KOD').Value;

                    ItemsProgressBar.StepIt;
                    Application.ProcessMessages;

                except on E: Exception do
                    begin
                        Result_kod := 0;
                        agShowMessage('Увага виникла помилка: ' + E.Message);
                    end;
                end;


                if (Result_kod = 0)
                    then begin
                    existsError := true;
                    agShowMessage('Увага! Не можна видалити наказ. Інформація по ньому вже змінено!');
                    Break;
                end;
                GetItems.Next;
            end;
            KernelSP.Close;
            KernelSP.Free;

            if existsError
                then WriteTransaction.Rollback;
            Screen.Cursor := crDefault;

            if WriteTransaction.InTransaction
                then begin
                UpdateSP := TpFibStoredProc.Create(self);
                UpdateSP.Database := WorkDatabase;
                UpdateSP.Transaction := WriteTransaction;
                UpdateSP.StoredProcName := 'UP_DT_ORDER_PATH_INS';
                UpdateSP.Prepare;
                UpdateSP.ParamByName('ID_ORDER').AsInt64 := StrToInt64(OrderList.FieldByName('ID_ORDER').AsString);
                UpdateSP.ParamByName('ID_LEVEL').Value := OrderList.FieldByName('ID_LEVEL').Value;
                UpdateSP.ParamByName('ID_USER').Value := GetUserId;
                UpdateSP.ParamByName('TYPE_MOVE').Value := 0;
                UpdateSP.ExecProc;
                UpdateSP.Close;
                UpdateSP.Free;

                WriteTransaction.Commit;
                agShowMessage('Наказ було відхилено без помилок!');
                            //UpdateData(id_);
            end;
        end;
        GetItems.Close;
        GetItems.Free;
    end;

    ProcessPanel.Visible := False;
    ItemsProgressBar.Position := ItemsProgressBar.Max;
    ItemsProgressBar.Update;
    Application.ProcessMessages;

    Screen.Cursor := crDefault;
end;

procedure TUpOrderListForm.SaveOrderOnMinLevel(id_: Int64);
var I: Integer;
    Key_session: Int64;
    existsError, dostup: Boolean;
    Stru: UP_KERNEL_MODE_STRUCTURE;
    GetItems: TpFibDataSet;
    Result_kod: Integer;
    UpdateOrderLevelProc: TpFibStoredProc;
    Vacancies, People, Rates, FirstCheck: TpFIBDataSet;
    order_false: boolean;
    BufferSP: TpFibStoredproc;
    IgnError: Boolean;
    isReformPrint: boolean;
begin
    IgnError := False;
    isReformPrint := False;
    //Процедура сохранения приказа на первом уровне
    //с измененим инф.пространства
    for i := 0 to Application.MainForm.MDIChildCount - 1 do
    begin
        if Application.MainForm.MDIChildren[i].Handle <> self.Handle
            then Application.MainForm.MDIChildren[i].Enabled := False;
    end;

    ProcessPanel.Visible := True;
    self.Update;
    Application.ProcessMessages;

    Screen.Cursor := crHourGlass;
    existsError := false;

    //Предобработка приказа
    FirstCheck := TpFIBDataSet.Create(self);
    FirstCheck.Database := WorkDatabase;
    FirstCheck.Transaction := WriteTransaction;
    FirstCheck.SelectSQL.Text := 'SELECT * FROM UP_KER_FIRST_CHECK(' + IntToStr(id_) + ')';
    FirstCheck.Transaction.StartTransaction;
    FirstCheck.Open;

    if (FirstCheck.RecordCount > 0)
        then begin
        with TfrmFirstCheck.Create(self, FirstCheck, id_) do
        begin

            if ShowModal = mrOk then
            begin
                isReformPrint := True;
                FirstCheck.Transaction.commit;
                Free;
            end
            else
            begin
                isReformPrint := False;
                FirstCheck.Transaction.Rollback;
                Free;
            end;
        end
    end
    else
    begin
        WriteTransaction.Rollback;
    end;
    FirstCheck.Close;
    FirstCheck.Free;

    //Проверяем дубляж пунктов
    FirstCheck := TpFIBDataSet.Create(self);
    FirstCheck.Database := WorkDatabase;
    FirstCheck.Transaction := WriteTransaction;
    FirstCheck.SelectSQL.Text := 'SELECT * FROM UP_KER_CHECK_ITEMS_DUPLICATES(' + IntToStr(id_) + ')';
    FirstCheck.Transaction.StartTransaction;
    FirstCheck.Open;
    if (FirstCheck.RecordCount > 0)
        then begin
        ShowMessage('Увага! В наказі номера пунктів дублюються і будуть перенумеровані автоматично!');
        BufferSP := TpFibStoredproc.Create(self);
        BufferSP.Database := WorkDatabase;
        BufferSP.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        BufferSP.StoredProcName := 'UP_KER_DO_RENUMERATION';
        BufferSP.Prepare;
        BufferSP.ParamByName('ID_ORDER').asInt64 := Id_;
        BufferSP.ExecProc;
        WriteTransaction.Commit;
    end;
    if WriteTransaction.InTransaction then WriteTransaction.Rollback;
    FirstCheck.Close;
    FirstCheck.Free;

    //Проверяем приказ на повышение окладов
    FirstCheck := TpFIBDataSet.Create(self);
    FirstCheck.Database := WorkDatabase;
    FirstCheck.Transaction := WriteTransaction;
    FirstCheck.SelectSQL.Text := 'SELECT * FROM UP_KER_NEW_OKLAD_ORDER(' + IntToStr(id_) + ', :ID_USER)';
    FirstCheck.ParamByName('ID_USER').Value := GetUserId;
    FirstCheck.Transaction.StartTransaction;
    FirstCheck.Open;
    if (FirstCheck.RecordCount > 0)
        then begin
             { error := fibCheckPermission('/ROOT/UpHolidayPlan', 'Add');
              if error <> 0 then
              begin
                  ShowMessage('Ви не маєте прав виконати цю дію!');
                  exit;
              end;
              }
        if (agMessageDlg('Увага!', 'Ігнорувати помилки?', mtConfirmation, [mbYes, mbNo]) = mrYes) then
            IgnError := True;
    end;
    if WriteTransaction.InTransaction then WriteTransaction.Rollback;
    FirstCheck.Close;
    FirstCheck.Free;

    WriteTransaction.StartTransaction;
    Key_session := WorkDatabase.Gen_Id('GEN_UP_ID_SESSION', 1);

    //UP_KER_GET_ITEMS_TREE
    //Делаем забор всех пунктов даже скрытых
    GetItems := TpFibDataSet.Create(self);
    GetItems.Database := WorkDatabase;
    GetItems.Transaction := ReadTransaction;
    GetItems.SelectSQL.Text := 'SELECT * FROM UP_KER_GET_ITEMS_TREE(' + IntToStr(id_) + ',NULL)';
    GetItems.Open;
    GetItems.FetchAll;

    ItemsProgressBar.Max := GetItems.RecordCount;
    ItemsProgressBar.Min := 0;
    ItemsProgressBar.Step := 1;

    if (GetItems.RecordCount > 0)
        then begin
        GetItems.First;
        for i := 0 to GetItems.RecordCount - 1 do
        begin
            Result_kod := 0;

            Stru.ID_ORDER := id_;
            Stru.ID_ORDER_ITEM_IN := StrToInt64(GetItems.FieldByName('id_item').AsString);
            Stru.KEY_SESSION := Key_session;
            if IgnError then
            {Если игнорируем ошибки, то все равно проверяем записи на актуальность
             информации, поэтому ставим CHECK_DATA = 2}  {a 2 не прокатывает :( }
            begin
                Stru.CHECK_DATA := 0;
            end
            else {Если не игнорируем ошибки, то проверяем все полностью как обычно}
                Stru.CHECK_DATA := 1;
            Stru.DBHANDLE := WorkDatabase.Handle;
            Stru.TRHANDLE := WriteTransaction.Handle;

            try

                Result_kod := Integer(UpKernelUnit.UpKernelDoEx(@Stru));

                ItemsProgressBar.StepIt;
                Application.ProcessMessages;


            except on E: Exception do
                begin
                    agMessageDlg('Увага!', 'Під час підписання наказу (' + GetItems.FieldByName('id_item').AsString + ') виникла помилка: ' + E.Message, mtError, [mbOk]);
                    Result_kod := 0;
                end
            end;

            if (Result_kod = 0)
                then begin
                existsError := true;
                if agMessageDlg('Увага!', 'Під час сформування наказа виникли помилки!' + #13 + 'Показати список помилок?', mtError, [mbYes, mbNo]) = mrYes
                    then begin
                    UpKernelUnit.GetUpSessionErrors(Self, WorkDatabase.Handle, Key_session, StrToInt64(GetItems.FieldByName('id_item').AsString));
                end;
                Break;
            end;
            GetItems.Next;
        end;

        if not existsError
            then begin
            UpdateOrderLevelProc := TpFibStoredProc.Create(self);
            UpdateOrderLevelProc.Database := WorkDatabase;
            UpdateOrderLevelProc.Transaction := WriteTransaction;
            UpdateOrderLevelProc.StoredProcName := 'UP_DT_ORDERS_UPD_LEVEL';
            UpdateOrderLevelProc.Prepare;
            UpdateOrderLevelProc.ParamByName('ID_ORDER').AsInt64 := id_;
            UpdateOrderLevelProc.ExecProc;
            UpdateOrderLevelProc.Close;

            order_false := false;
                           //Проверяем ставки в целом по приказу
            Rates := TpFIBDataSet.Create(self);
            Rates.Database := WorkDatabase;
            Rates.Transaction := WriteTransaction;
            Rates.SelectSQL.Text := 'SELECT DISTINCT * FROM UP_KER_CHECK_RATES_BY_PCARD_EX(' + IntToStr(id_) + ',' + OrderList.FieldBYName('MIN_LEVEL').AsString + ') ORDER BY FIO COLLATE WIN1251_UA';
            Rates.Open;

            if (Rates.RecordCount > 0)
                then begin
                with TfrmMaxRate.Create(self, Rates,
                    id_, OrderList['MIN_LEVEL']) do
                begin
                    ShowModal;
                    Free;
                end;
                order_false := true;
                WriteTransaction.Rollback;
            end;
            Rates.Close;
            Rates.Free;
                         {--------------------------------}
            if not order_false then
            begin
                               //Проверяем вакансии в целом по приказу
                Vacancies := TpFIBDataSet.Create(self);
                Vacancies.Database := WorkDatabase;
                Vacancies.Transaction := WriteTransaction;
                Vacancies.SelectSQL.Text := 'SELECT * FROM UP_CHECK_VACANCIES_BY_ORDER_EX(' + IntToStr(id_) + ',' + OrderList.FieldBYName('MIN_LEVEL').AsString + ')';
                Vacancies.Open;

                People := TpFIBDataSet.Create(self);
                People.Database := WorkDatabase;
                People.Transaction := WriteTransaction;
                People.SelectSQL.Text := 'SELECT * FROM UP_SHTAT_PEOPLE_2(' +
                    ':Id_Department, :Id_Smeta, :Id_Post_Salary, :Id_Smeta_Pps,' +
                    ':Koeff, :Id_Type_Post, :Filter_Id_PCard_Away, :Act_Date, :Id_Level) ORDER BY FIO COLLATE WIN1251_UA';

                if (Vacancies.RecordCount > 0)
                    then begin
                    dostup := False;
                    if CheckVacByIdUser then
                        dostup := True
                    else
                        dostup := False;

                    with TfrmGetErrors.Create(self, Vacancies,
                        People, id_, OrderList['MIN_LEVEL'], dostup) do
                    begin
                        ShowModal;
                        Free;
                    end;
                    order_false := true;
                    WriteTransaction.Rollback;
                end;
                Vacancies.Close;
                Vacancies.Free;

                People.Close;
                People.Free;
            end;

            if not order_false then
            begin
                UpdateOrderLevelProc.StoredProcName := 'UP_DT_ORDER_PATH_INS';
                UpdateOrderLevelProc.Prepare;
                UpdateOrderLevelProc.ParamByName('ID_ORDER').AsInt64 := id_;
                UpdateOrderLevelProc.ParamByName('ID_LEVEL').Value := OrderList.FieldBYName('MIN_LEVEL').Value;
                UpdateOrderLevelProc.ParamByName('ID_USER').Value := GetUserId;
                UpdateOrderLevelProc.ParamByName('TYPE_MOVE').Value := 1;
                UpdateOrderLevelProc.ExecProc;
            end;

            UpdateOrderLevelProc.Close;
            UpdateOrderLevelProc.Free;
        end
        else WriteTransaction.Rollback;

        Screen.Cursor := crDefault;

        if WriteTransaction.InTransaction
            then begin
            WriteTransaction.Commit;
            if isReformPrint then ReformBodyItems(id_);
            agShowMessage('Наказ було сформовано без помилок!');
                   // UpdateData(id_);
        end
    end
    else agShowMessage('Не можна підписувати пустий наказ!');
    GetItems.Close;
    GetItems.Free;

    ProcessPanel.Visible := False;
    ItemsProgressBar.Position := ItemsProgressBar.Max;
    ItemsProgressBar.Update;
    Application.ProcessMessages;

    for i := 0 to Application.MainForm.MDIChildCount - 1 do
    begin
        if Application.MainForm.MDIChildren[i].Handle <> self.Handle
            then Application.MainForm.MDIChildren[i].Enabled := true;
    end;


    Screen.Cursor := crDefault;
end;

procedure TUpOrderListForm.SaveOrderOnUpperLevel(id_: Int64);
var CheckStoredProc: TpFibDataSet;
    UpdateSP: TpFibStoredProc;
    ExistError: Boolean;
    T: TfrmDependOList;
    F: TThreadWindow;
begin
    if (OrderList.RecordCount > 0)
        then begin
        if (OrderList.FieldByName('ID_LEVEL').Value <> null)
            and (OrderList.FieldByName('NEXT_UP_LEVEL').Value <> null)
            then begin
                         //Проверяем есть ли приказы которые блокируют перевод приказа на уровень вверх
            F := TThreadWindow.Show;
            F.Message := 'Йде аналіз блокуючих наказів!';
            F.Percent := 10;
            ExistError := false;
            CheckStoredProc := TpFibDataSet.Create(self);
            CheckStoredProc.SelectSQL.Text := '  SELECT distinct * FROM UP_KER_GET_ORDER_DEPEND(' +
                OrderList.FieldByName('ID_ORDER').AsString + ',' +
                OrderList.FieldByName('NEXT_UP_LEVEL').AsString + ',' +
                OrderList.FieldByName('ID_LEVEL').AsString + ')';
            CheckStoredProc.Database := WorkDatabase;
            CheckStoredProc.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            CheckStoredProc.Open;
            CheckStoredProc.FetchAll;
            F.Message := 'Йде аналіз блокуючих наказів!';
            F.Percent := 20;
            if (CheckStoredProc.RecordCount > 0)
                then begin
                ExistError := true;
                if agMessageDlg('Увага!', 'Не можна перевести наказ на рівень вище, бо є накази, які блокують переведення!' + #13 +
                    'Показати список наказів, які блокують переведення?', mtError, [mbYes, mbNo]) = mrYes
                    then begin
                    T := TfrmDependOList.Create(self);
                    T.DependTextsMemoryData.CopyStructure(CheckStoredProc);
                    T.DependTextsMemoryData.LoadFromDataSet(CheckStoredProc, CheckStoredProc.RecordCount, lmCopy);
                    T.ShowModal;
                    T.Free;
                end;
            end;
            CheckStoredProc.Close;
            CheckStoredProc.Free;

                         //Переводим приказ на уровень вверх
            F.Message := 'Наказ переводиться на інший рівень!';
            F.Percent := 50;


            if not ExistError
                then begin

                UpdateSP := TpFibStoredProc.Create(self);
                UpdateSP.Database := WorkDatabase;
                UpdateSP.Transaction := WriteTransaction;
                UpdateSP.StoredProcName := 'UP_DT_ORDERS_UPD_LEVEL';
                UpdateSP.Prepare;
                UpdateSP.ParamByName('ID_ORDER').AsInt64 := StrToInt64(OrderList.FieldByName('ID_ORDER').AsString);
                UpdateSP.ParamByName('ID_LEVEL').Value := OrderList.FieldByName('NEXT_UP_LEVEL').Value;
                UpdateSP.ExecProc;
                UpdateSP.Close;

                UpdateSP.StoredProcName := 'UP_DT_ORDER_PATH_INS';
                UpdateSP.Prepare;
                UpdateSP.ParamByName('ID_ORDER').AsInt64 := StrToInt64(OrderList.FieldByName('ID_ORDER').AsString);
                UpdateSP.ParamByName('ID_LEVEL').Value := OrderList.FieldByName('NEXT_UP_LEVEL').Value;
                UpdateSP.ParamByName('ID_USER').Value := GetUserId;
                UpdateSP.ParamByName('TYPE_MOVE').Value := 1;
                UpdateSP.ExecProc;
                UpdateSP.Close;
                UpdateSP.Free;

                WriteTransaction.Commit;
                            //UpdateData(id_);
            end
            else WriteTransaction.Commit;
            F.Message := 'Наказ переводиться на інший рівень!';
            F.Percent := 100;

            FreeAndNil(F);
        end;
    end;
end;

procedure TUpOrderListForm.dxBLB_NotAcceptClick(Sender: TObject);
var ORDER_RECORD: RECORD_INFO_STRUCTURE;
    BlockResult: RESULT_STRUCTURE;
    btn_state: btn_state_rec;
begin
    with btn_state
        do
    begin
        BLB_Add := dxBLB_Add.Enabled;
        BLB_Modify := dxBLB_Modify.Enabled;
        BarLargeButton3 := dxBarLargeButton3.Enabled;
        BarLargeButton2 := dxBarLargeButton2.Enabled;
        BLB_Accept := dxBLB_Accept.Enabled;
        StopOrderBut := StopOrderButton.Enabled;
        BLB_Print := dxBLB_Print.Enabled;
        BarLargeButton4 := dxBarLargeButton4.Enabled;
        BarLargeButton5 := dxBarLargeButton5.Enabled;
        BarLargeButton1 := dxBarLargeButton1.Enabled;
    end;

    dxBLB_Add.Enabled := False;
    dxBLB_Modify.Enabled := False;
    dxBarLargeButton3.Enabled := False;
    dxBarLargeButton2.Enabled := False;
    dxBLB_Accept.Enabled := False;
    StopOrderButton.Enabled := False;
    dxBLB_Print.Enabled := False;
    dxBarLargeButton4.Enabled := False;
    dxBarLargeButton5.Enabled := False;
    dxBarLargeButton1.Enabled := False;

    dxBLB_NotAccept.Enabled := False;

    if (OrderList.RecordCount > 0)
        then begin
        UpdateData(StrToInt64(OrderList.FieldByName('ID_ORDER').AsString));

        if CheckIdOrder
            then begin
            if CheckSignActionByIdUser('UNSIGN', 0)
                then begin
                if OrderList.FieldByName('ID_LEVEL').Value <> null
                    then begin
                    if OrderList.FieldByName('ID_LEVEL').Value = OrderList.FieldByName('MIN_LEVEL').Value
                        then begin
                        WriteTransaction.StartTransaction;

                        ORDER_RECORD.DBHANDLE := WorkDatabase.Handle;
                        ORDER_RECORD.TRHANDLE := WriteTransaction.Handle;
                        ORDER_RECORD.ID_RECORD := VarArrayOf([StrToInt64(OrderList.FieldByName('ID_ORDER').AsString)]);
                        ORDER_RECORD.TABLE_NAME := 'UP_DT_ORDERS';
                        ORDER_RECORD.PK_FIELD_NAME := VarArrayOf(['ID_ORDER']);
                        ORDER_RECORD.RAISE_FLAG := false;

                        BlockResult := Kernel.LockRecord(@ORDER_RECORD);

                        if (BlockResult.RESULT_CODE <> 1)
                            then begin
                            agMessageDlg('Увага!', 'Наказ заблокований або відкритий для роботи!!', mtWarning, [mbOk]);
                            if WriteTransaction.InTransaction then WriteTransaction.Rollback;
                            with btn_state
                                do
                            begin
                                dxBLB_Add.Enabled := BLB_Add;
                                dxBLB_Modify.Enabled := BLB_Modify;
                                dxBarLargeButton3.Enabled := BarLargeButton3;
                                dxBarLargeButton2.Enabled := BarLargeButton2;
                                dxBLB_Accept.Enabled := BLB_Accept;
                                StopOrderButton.Enabled := StopOrderBut;
                                dxBLB_Print.Enabled := BLB_Print;
                                dxBarLargeButton4.Enabled := BarLargeButton4;
                                dxBarLargeButton5.Enabled := BarLargeButton5;
                                dxBarLargeButton1.Enabled := BarLargeButton1;
                            end;

                            dxBLB_NotAccept.Enabled := True;

                            if OrderList.RecordCount > 0
                                then UpdateData(StrToInt64(OrderList.FieldByName('ID_ORDER').AsString));

                            Exit;
                        end;
                        if WriteTransaction.InTransaction then WriteTransaction.Rollback;

                                                 //Откатываем информационное пространство
                        RemoveOrderOnDownLevel(StrToInt64(OrderList.FieldByName('ID_ORDER').asString));
                    end
                    else begin
                                                 //Откатываем приказа на один уровень вниз
                        SaveOrderOnDownLevel(StrToInt64(OrderList.FieldByName('ID_ORDER').asString));
                    end;
                end;
            end
            else agShowMessage('Ви не маєте права виконати цю дію!');
        end
        else agShowMessage('Рівень наказу змінився! Спробуйте зняти підпис з наказу ще раз!');
    end;

    with btn_state
        do
    begin
        dxBLB_Add.Enabled := BLB_Add;
        dxBLB_Modify.Enabled := BLB_Modify;
        dxBarLargeButton3.Enabled := BarLargeButton3;
        dxBarLargeButton2.Enabled := BarLargeButton2;
        dxBLB_Accept.Enabled := BLB_Accept;
        StopOrderButton.Enabled := StopOrderBut;
        dxBLB_Print.Enabled := BLB_Print;
        dxBarLargeButton4.Enabled := BarLargeButton4;
        dxBarLargeButton5.Enabled := BarLargeButton5;
        dxBarLargeButton1.Enabled := BarLargeButton1;
    end;

    dxBLB_NotAccept.Enabled := True;

    if OrderList.RecordCount > 0
        then UpdateData(StrToInt64(OrderList.FieldByName('ID_ORDER').AsString));
end;

procedure TUpOrderListForm.MainOrderViewDblClick(Sender: TObject);
begin
    if (OrderList.RecordCount > 0) then
        dxBLB_Modify.OnClick(self);
end;

procedure TUpOrderListForm.SaveOrderOnDownLevel(id_: Int64);
var CheckStoredProc: TpFibDataSet;
    UpdateSP: TpFibStoredProc;
    ExistError: Boolean;
    T: TfrmDependOList;
    F: TThreadWindow;
begin
    if (OrderList.RecordCount > 0)
        then begin
        if (OrderList.FieldByName('ID_LEVEL').Value <> null)
            and (OrderList.FieldByName('NEXT_DOWN_LEVEL').Value <> null)
            then begin
                         //Проверяем есть ли приказы которые блокируют перевод приказа на уровень вверх
            F := TThreadWindow.Show;
            F.Message := 'Йде аналіз блокучих наказів!';
            F.Percent := 10;

            ExistError := false;
            CheckStoredProc := TpFibDataSet.Create(self);
            CheckStoredProc.SelectSQL.Text := '  SELECT distinct * FROM UP_KER_GET_ORDER_DEPEND(' +
                OrderList.FieldByName('ID_ORDER').AsString + ',' +
                OrderList.FieldByName('NEXT_DOWN_LEVEL').AsString + ',' +
                OrderList.FieldByName('ID_LEVEL').AsString + ')';
            CheckStoredProc.Database := WorkDatabase;
            CheckStoredProc.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            CheckStoredProc.Open;
            CheckStoredProc.FetchAll;
            if (CheckStoredProc.RecordCount > 0)
                then begin
                ExistError := true;
                if agMessageDlg('Увага!', 'Не можна перевести наказ на рівень нище, бо є накази які блокують переведення!' + #13 +
                    'Показати список наказів, які блокують перведення?', mtError, [mbYes, mbNo]) = mrYes
                    then begin
                    T := TfrmDependOList.Create(self);
                    T.DependTextsMemoryData.CopyStructure(CheckStoredProc);
                    T.DependTextsMemoryData.LoadFromDataSet(CheckStoredProc, CheckStoredProc.RecordCount, lmCopy);
                    T.ShowModal;
                    T.Free;
                end;
            end;
            CheckStoredProc.Close;
            CheckStoredProc.Free;

            F.Message := 'Переведення наказу на інший рівень!';
            F.Percent := 50;

                         //Переводим приказ на уровень вверх
            if not ExistError
                then begin
                UpdateSP := TpFibStoredProc.Create(self);
                UpdateSP.Database := WorkDatabase;
                UpdateSP.Transaction := WriteTransaction;
                WriteTransaction.StartTransaction;
                UpdateSP.StoredProcName := 'UP_DT_ORDERS_UPD_LEVEL';
                UpdateSP.Prepare;
                UpdateSP.ParamByName('ID_ORDER').AsInt64 := StrToInt64(OrderList.FieldByName('ID_ORDER').AsString);
                UpdateSP.ParamByName('ID_LEVEL').Value := OrderList.FieldByName('NEXT_DOWN_LEVEL').Value;
                UpdateSP.ExecProc;
                UpdateSP.Close;

                UpdateSP.StoredProcName := 'UP_DT_ORDER_PATH_INS';
                UpdateSP.Prepare;
                UpdateSP.ParamByName('ID_ORDER').AsInt64 := StrToInt64(OrderList.FieldByName('ID_ORDER').AsString);
                UpdateSP.ParamByName('ID_LEVEL').Value := OrderList.FieldByName('ID_LEVEL').Value;
                UpdateSP.ParamByName('ID_USER').Value := GetUserId;
                UpdateSP.ParamByName('TYPE_MOVE').Value := 0;
                UpdateSP.ExecProc;
                UpdateSP.Close;
                UpdateSP.Free;
                WriteTransaction.Commit;
                            //UpdateData(id_);
            end
            else WriteTransaction.Commit;
            F.Percent := 50;
            FreeAndNil(F);
        end;
    end;
end;

procedure TUpOrderListForm.StopOrderButtonClick(Sender: TObject);
var id_: Int64;
    UpdateSP: TpFibStoredProc;
begin
    if OrderList.RecordCount > 0
        then begin
        if CheckSignActionByIdUser('REJECTION', 2)
            then begin
            id_ := StrToInt64(OrderList.FieldByName('ID_ORDER').AsString);

            UpdateSP := TpFibStoredProc.Create(self);
            UpdateSP.Database := WorkDatabase;
            UpdateSP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            UpdateSP.StoredProcName := 'UP_DT_ORDERS_UPD_STOP';
            UpdateSP.Prepare;
            UpdateSP.ParamByName('ID_ORDER').AsInt64 := StrToInt64(OrderList.FieldByName('ID_ORDER').AsString);
            UpdateSP.ExecProc;
            UpdateSP.Close;
            UpdateSP.Free;
            WriteTransaction.Commit;
            UpdateData(id_);
        end
        else agShowMessage('Ви не маєте права виконати цю дію!');

    end;
end;

function TUpOrderListForm.CheckActionByIdUser(ACTION: string): Boolean;
var IUStoredProc: TpFibStoredProc;
    Res: Integer;
begin
    IUStoredProc := TpFibStoredProc.Create(self);
    IUStoredProc.Database := WorkDatabase;
    IUStoredProc.Transaction := WriteTransaction;
    WriteTransaction.StartTransaction;
    IUStoredProc.StoredProcName := 'UP_KER_CHECK_SUPER_USER_ACTION';
    IUStoredProc.Prepare;
    IUStoredProc.ParamByName('ID_USER').AsInt64 := GetUserId;
    IUStoredProc.ParamByName('ACTION_NAME').Value := Action;
    IUStoredProc.ExecProc;
    Res := IUStoredProc.ParamByName('RESULT').Value;
    WriteTransaction.Commit;
    IUStoredProc.Close;
    IUStoredProc.Free;

    if (Res = 1)
        then Result := true
    else Result := false;
end;

function TUpOrderListForm.CheckVacByIdUser: Boolean;
var IUStoredProc: TpFibStoredProc;
    Res: Integer;
begin
    IUStoredProc := TpFibStoredProc.Create(self);
    IUStoredProc.Database := WorkDatabase;
    IUStoredProc.Transaction := WriteTransaction;
  //  WriteTransaction.StartTransaction;
    IUStoredProc.StoredProcName := 'UP_KER_CHECK_VACANCIES';
    IUStoredProc.Prepare;
    IUStoredProc.ParamByName('ID_USER').AsInt64 := GetUserId;
    IUStoredProc.ExecProc;
    Res := IUStoredProc.ParamByName('RESULT').Value;
  //  WriteTransaction.Commit;
    IUStoredProc.Close;
    IUStoredProc.Free;

    if (Res = 1)
        then Result := true
    else Result := false;
end;


function TUpOrderListForm.CheckSignActionByIdUser(ACTION: string; TO_UP_LEVEL: Integer): Boolean;
var IUStoredProc: TpFibStoredProc;
    Res: Integer;
begin
    IUStoredProc := TpFibStoredProc.Create(self);
    IUStoredProc.Database := WorkDatabase;
    IUStoredProc.Transaction := WriteTransaction;
    WriteTransaction.StartTransaction;
    IUStoredProc.StoredProcName := 'UP_KER_CHECK_SUPER_USER_SIGN';
    IUStoredProc.Prepare;
    IUStoredProc.ParamByName('ID_USER').AsInt64 := GetUserId;
    IUStoredProc.ParamByName('CUR_ID_LEVEL').Value := OrderList.FieldByName('ID_LEVEL').Value;
    IUStoredProc.ParamByName('TO_UP_LEVEL').Value := TO_UP_LEVEL;
    IUStoredProc.ExecProc;
    Res := IUStoredProc.ParamByName('RESULT').Value;
    WriteTransaction.Commit;
    IUStoredProc.Close;
    IUStoredProc.Free;

    if (Res = 1)
        then Result := true
    else Result := false;
end;

function TUpOrderListForm.CheckIdOrder: Boolean;
var IUStoredProc: TpFibStoredProc;
    Res: Integer;
begin
    IUStoredProc := TpFibStoredProc.Create(self);
    IUStoredProc.Database := WorkDatabase;
    IUStoredProc.Transaction := WriteTransaction;
    WriteTransaction.StartTransaction;
    IUStoredProc.StoredProcName := 'UP_KER_CHECK_ID_LEVEL';
    IUStoredProc.Prepare;
    IUStoredProc.ParamByName('ID_ORDER').AsInt64 := OrderList.FieldByName('ID_ORDER').Value;
    IUStoredProc.ParamByName('ID_LEVEL').Value := OrderList.FieldByName('ID_LEVEL').Value;
    IUStoredProc.ExecProc;
    Res := IUStoredProc.ParamByName('RESULT').Value;
    WriteTransaction.Commit;
    IUStoredProc.Close;
    IUStoredProc.Free;

    if (Res = 1)
        then Result := true
    else Result := false;
end;

procedure TUpOrderListForm.DeleteOrderExecute(Sender: TObject);
begin
    if MainOrderView.IsControlFocused
        then dxBarLargeButton3Click(self)
    else SendMessage(self.ActiveControl.Handle, WM_SYSKEYDOWN, VK_DELETE, 0);
end;

procedure TUpOrderListForm.FormCreate(Sender: TObject);
//var PBarLocate:TZBarLocate;
begin
    CurridOrderForUpdate := -1;

     {PBarLocate:=TZBarLocate.Create(dxBM_Order);

     PBarLocate.DataSet := OrderList;
     PBarLocate.BorderStyle := bbsNone;
     PBarLocate.AddLocateItem('NUM_PROJECT',
                               'Номер проекта',
                               [loCaseInsensitive,loPartialKey]);
     PBarLocate.AddLocateItem('NUM_ORDER',
                               'Номер наказа',
                               [loCaseInsensitive,loPartialKey]);}
     //PBarLocate.DockControl  := BarDockLocate;
end;

procedure TUpOrderListForm.AcceptFilterButtonClick(Sender: TObject);
begin
    cxLabel1.Visible := false;
    UpdateData;
end;

procedure TUpOrderListForm.FilterDateBegPropertiesChange(Sender: TObject);
begin
    OrderList.Close;
    DateBeg.Enabled := FilterDateBeg.Checked;
    DateEnd.Enabled := FilterDateEnd.Checked;
    cxLabel1.Visible := true;
end;

procedure TUpOrderListForm.cxCheckBox1PropertiesChange(Sender: TObject);
begin
    FIO.Enabled := cxCheckBox2.Checked;
    cxProj.Enabled := cxCheckProj.Checked;
    DateBeg.Enabled := FilterDateBeg.Checked;
    DateEnd.Enabled := FilterDateEnd.Checked;
    OrderList.Close;
    cxLabel1.Visible := true;
end;

procedure TUpOrderListForm.FormActivate(Sender: TObject);
begin
    try
        if (CurridOrderForUpdate <> -1)
            then UpdateData(CurridOrderForUpdate)
        else begin
            if OrderList.RecordCount > 0
                then UpdateData(StrToInt64(OrderList.FieldByName('ID_ORDER').asString))
            else UpdateData;
        end;
    except on Exception do begin end;
    end;
end;

procedure TUpOrderListForm.MainOrderViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if OrderList.RecordCount > 0
        then begin
        if ((Key = VK_F2) and (dxBLB_Modify.Caption = 'Змінити'))
            then begin
            dxBLB_Modify.OnClick(self);
        end;

        if ((Key = VK_F3) and (dxBLB_Modify.Caption = 'Перегляд'))
            then begin
            dxBLB_Modify.OnClick(self);
        end;

    end;

    if ((Key = VK_F12) and (ssShift in Shift))
        then begin
        ShowInfo(OrderList);
    end;

    if OrderList.RecordCount > 0 then
        cxDTime.Text := OrderList.FieldByName('DATETIME').Value
    else cxDTime.Text := '';
end;

procedure TUpOrderListForm.cxButtonEdit1PropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    sp: TSprav;
begin
    sp := GetSprav('asup\PCardsList');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(workDatabase.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['AdminMode'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['ShowStyle'] := 0;

            if FindField('NewVersion') <> nil
                then begin
                FieldValues['NewVersion'] := 1;
            end;
            Post;
        end;
        sp.Show;

        if (sp.Output <> nil) and not sp.Output.IsEmpty
            then begin
            CurrIdPCard := sp.Output['ID_PCARD'];
            FIo.Text := sp.Output['FIO'];
        end;
    end;
end;

procedure TUpOrderListForm.IS_STOPCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if AViewInfo.GridRecord.Values[IS_STOP.Index] = '!'
        then begin
        ACanvas.FillRect(AViewInfo.Bounds);
        ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 6, AViewInfo.Bounds.Top, 0);
        ADone := true;
    end;

end;

procedure TUpOrderListForm.dxBarLargeButton4Click(Sender: TObject);
var T: TfrmPathHistory;
begin
    if OrderList.RecordCount > 0
        then begin
        T := TfrmPathHistory.Create(self);
        T.ShowModal;
        T.Free;
    end;
end;

procedure TUpOrderListForm.FormResize(Sender: TObject);
begin
    ProcessPanel.Top := (self.ClientHeight div 2) - (ProcessPanel.Height div 2);
    ProcessPanel.Left := (self.ClientWidth div 2) - (ProcessPanel.Width div 2);
end;

procedure TUpOrderListForm.dxBarLargeButton5Click(Sender: TObject);
var
    SpecSp: TSprav;
begin
    if (OrderList.RecordCount > 0)
        then begin
        with TfrmSpecModulesSelect.Create(self, StrToInt64(OrderList.FieldByName('ID_ORDER').AsString), WorkDatabase.Handle) do
        begin
            if ShowModal = mrYes
                then begin
                try
                    SpecSp := GetSprav('UP\' + SelectBplName);
                    with SpecSp.Input do
                    begin
                        Append;
                        FieldValues['DBHandle'] := Integer(WorkDatabase.Handle);
                        FieldValues['Id_order'] := StrToInt64(OrderList.FieldByName('ID_ORDER').AsString);
                        Post;
                    end;
                    SpecSp.Show;
                    SpecSp.Free;
                except on E: Exception do
                    begin
                        Screen.Cursor := crDefault;
                    end;
                end;
            end;
            Free;
        end;
    end;
end;

procedure TUpOrderListForm.cxButton1Click(Sender: TObject);
begin
    cxLabel1.Visible := false;
    UpdateData;
end;

procedure TUpOrderListForm.SpeedButton1Click(Sender: TObject);
begin
    cxLabel1.Visible := false;
    UpdateData;
end;

procedure TUpOrderListForm.SearchEditChange(Sender: TObject);
var FltStr: string;
begin
    if (SearchEdit.Text = '') or (VarIsNull(SearchEdit.Text)) then
    begin
        MainOrderView.DataController.DataSet.Filtered := False;
    end
    else
    begin
        try
            MainOrderView.DataController.DataSet.Filtered := False;
            FltStr := 'UPPER(' +
                AnsiUpperCase(Fields[cxCB_FieldName.ItemIndex]) + ') LIKE ''' +
                '%' + AnsiUpperCase(SearchEdit.Text) + '%'' and ' + Fields[0] + ' is not null';

            if (AnsiUpperCase(Fields[cxCB_FieldName.ItemIndex]) = AnsiUpperCase(Fields[1])) then
                FltStr := AnsiUpperCase(Fields[1]) + ' LIKE ''' +
                    '%' + (SearchEdit.Text) + '%'' and ' + Fields[0] + ' is not null ' +
                    'and ' + Fields[1] + ' is not null';
            MainOrderView.DataController.DataSet.Filter := FltStr;
            MainOrderView.DataController.DataSet.Filtered := True;
            MainOrderView.ViewData.Expand(False);
            MainOrderView.DataController.SelectRows(0, 0);
//       ShowMessage(cxG_MainDBTableView1.DataController.DataSet.Filter);
        except
//       ShowMessage(cxG_MainDBTableView1.DataController.DataSet.Filter);
//       ShowInfo(cxG_MainDBTableView1.DataController.DataSet);
        end;
    end;


{if (SearchEdit.Text = '')or(VarIsNull(SearchEdit.Text)) then
   begin
     MainOrderView.DataController.DataSet.Filtered := False;
   end
  else
   begin
     try
       MainOrderView.DataController.DataSet.Filtered := False;
       MainOrderView.DataController.DataSet.Filter := 'UPPER('+
            AnsiUpperCase(Fields[cxCB_FieldName.ItemIndex])+') LIKE ''' +
            '%'+AnsiUpperCase(SearchEdit.Text) + '%'' and '+Fields[0]+' is not null';
       MainOrderView.DataController.DataSet.Filtered := True;
       MainOrderView.ViewData.Expand(True)
     except
     end;
    end; }
end;

procedure TUpOrderListForm.N3Click(Sender: TObject);
var GetInfoDS: TPFibDataSet;
begin
    if (OrderList.RecordCount > 0)
        then begin
        GetInfoDS := TPFibDataSet.Create(Self);
        GetInfoDS.Database := WorkDatabase;
        GetInfoDS.Transaction := ReadTransaction;
        GetInfoDS.SelectSQL.Text := 'SELECT * FROM UP_KER_GET_BONUS_SUM(' + OrderList.FieldByName('ID_ORDER').AsString + ')';
        GetInfoDS.Open;
        if (GetInfoDS.RecordCount > 0)
            then begin
            agMessageDlg('Увага!', 'Сума надбавок за наказом=' + GetInfoDS.FieldByName('SUMA').AsString, mtInformation, [mbOk]);
        end;
        GetInfoDS.Close;
        GetInfoDS.Free;
    end;
end;

procedure TUpOrderListForm.ShowPremiaSumClick(Sender: TObject);
var frm: TfrmPremiaSum;
begin
    if (OrderList.RecordCount > 0)
    then begin
        frm := TfrmPremiaSum.Create(Self);
        if frm.DSetPremiaSum.RecordCount > 0 then frm.ShowModal;
        frm.Free;
    end;
end;


procedure TUpOrderListForm.cxProjKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
    begin
        cxLabel1.Visible := false;
        UpdateData;
    end;
end;



procedure TUpOrderListForm.MainOrderViewCellClick(
    Sender: TcxCustomGridTableView;
    ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
    AShift: TShiftState; var AHandled: Boolean);
begin
    cxDTime.Text := OrderList.FieldByName('DATETIME').Value;
end;

procedure TUpOrderListForm.MainOrderViewKeyUp(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if OrderList.RecordCount > 0 then
        cxDTime.Text := OrderList.FieldByName('DATETIME').Value
    else cxDTime.Text := '';
end;

end.

