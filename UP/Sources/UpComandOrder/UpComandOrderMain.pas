unit UpComandOrderMain;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
    ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel, cxDBLabel, ImgList,
    dxBar, dxBarExtItems, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, DB, cxDBData, cxTextEdit, cxMaskEdit,
    cxDropDownEdit, cxGridLevel, cxClasses, cxGridCustomView,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
    ActnList, Menus, RxMemDS, uUnivSprav, FIBDatabase, pFIBDatabase, iBase,
    pFibStoredProc, FIBDataSet, pFIBDataSet, AppEvnts, AppStruClasses,
    cxCheckBox, FIBQuery, pFIBQuery, UpComandOrderShowErrors;

type
    TFormComandMain = class(TForm)
        BottomPanel: TPanel;
        Panel3: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        TopPanel: TPanel;
        PanelTypeComand: TPanel;
        PanelReason: TPanel;
        Label1: TLabel;
        Label2: TLabel;
        cxCPLblNote: TcxDBLabel;
        cxCPLblReason: TcxDBLabel;
        PanelBar: TPanel;
        dxCPBarManager: TdxBarManager;
        dxBarDockControl1: TdxBarDockControl;
        dxBarPopupMenu1: TdxBarPopupMenu;
        dxAddButton: TdxBarLargeButton;
        dxModifyButton: TdxBarLargeButton;
        dxDeleteButton: TdxBarLargeButton;
        IL_OrdAcc: TImageList;
        cxCPGridMainTableView: TcxGridDBTableView;
        cxCPGridMainLevel: TcxGridLevel;
        cxCPGridMain: TcxGrid;
        ActionList1: TActionList;
        Add: TAction;
        Modify: TAction;
        ComandEdit: TqFSpravControl;
        Database: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        MainCPOrderDataSet: TpFIBDataSet;
        MainDS: TDataSource;
        cxCPLblTarget: TcxDBLabel;
        Label3: TLabel;
        colNum_Item: TcxGridDBColumn;
        colNum_Sub_Item: TcxGridDBColumn;
        colTN: TcxGridDBColumn;
        colFIO: TcxGridDBColumn;
        colName_Post: TcxGridDBColumn;
        colDate_Beg: TcxGridDBColumn;
        colDate_End: TcxGridDBColumn;
        colDays_Count: TcxGridDBColumn;
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
        StorProc: TpFIBStoredProc;
        DSetSelect: TpFIBDataSet;
        dxViewButton: TdxBarLargeButton;
        cxName_Org_Full: TcxGridDBColumn;
        cxName_Smet_Full: TcxGridDBColumn;
        cxNum_Cert: TcxGridDBColumn;
        cxDate_Cert: TcxGridDBColumn;
        procedure ComandEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure CancelButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure dxAddButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure dxDeleteButtonClick(Sender: TObject);
        procedure dxModifyButtonClick(Sender: TObject);
        procedure dxViewButtonClick(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure cxCPGridMainTableViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure ComandEditChange(Sender: TObject);
    private
        ErrorForm: TForm;
        CP_EditMode: Integer;
        CP_EditIdOrderItem: Int64;
        CP_LocalAsFrame: Boolean;
        CP_Num_Ord: Integer;
        err_id_order_item: Int64;
        CheckFinance: Boolean;
        procedure CP_ShowErrors;
        procedure CP_GetErrorTexts(id_item: int64);
        procedure CP_CreateBuffInfoByIdItem;
        procedure CP_GetData;
        procedure CP_SetControls(bEnable: Boolean);
        function CP_CheckData: Boolean;
        function CP_SaveData: Boolean;
        function CP_AddNewItem(id_item: Int64): Boolean;
        procedure CP_ShowData(Id_mode: Integer);
    public
        CP_Key_Session: Int64;
        CP_Id_User: Integer;
        CP_Id_Order: Int64;
        CP_Id_Order_Type: Integer;
        CP_Base_Num_Item: Integer;
        CP_Base_Num_Sub_Item: Integer;
        CP_Outer_HWND: HWND;
        constructor Create(AOwner: TComponent;
            Db_Handle: TISC_DB_HANDLE;
            id_order: int64;
            id_order_type: Integer;
            num_item: Integer;
            num_sub_item: Integer;
            id_order_item: Variant;
            mode: integer;
            {ViewKeySession: Variant;}
            asFrame: Boolean;
            Outer_HWND: Variant); reintroduce;
    end;

var
    FormComandMain: TFormComandMain;

implementation

uses BaseTypes, UpKernelUnit, UpComandOrderEdit, cxCalendar,
    cxDBLookupComboBox;

{$R *.dfm}

procedure TFormComandMain.ComandEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів відряджень';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_DT_COMAND_TYPE';
    Params.Fields := 'TYPE_NAME,ID_COMAND_TYPE,IS_PAY';
    Params.FieldsName := 'Назва ';
    Params.KeyField := 'ID_COMAND_TYPE';
    Params.ReturnFields := 'TYPE_NAME,ID_COMAND_TYPE,IS_PAY';
    Params.DBHandle := Integer(Database.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut) then
    begin
        value := output['ID_COMAND_TYPE'];
        DisplayText := VarToStr(output['TYPE_NAME']);
        dxAddButton.Enabled := True;
        if VarIsNull(output['IS_PAY']) then CheckFinance := True;
        CheckFinance := (output['IS_PAY'] = 1);
        //        CP_SetControls(True); //делаем доступными кнопки
    end;
end;

constructor TFormComandMain.Create(AOwner: TComponent; Db_Handle: TISC_DB_HANDLE;
    id_order: int64; id_order_type: Integer; num_item: Integer;
    num_sub_item: Integer; id_order_item: Variant; mode: integer;
    asFrame: Boolean; Outer_HWND: Variant);
begin
    if asFrame
        then
        inherited Create(AOwner)
    else
        inherited Create(AOwner);

    Self.CP_Outer_HWND := Outer_HWND;

    CP_LocalAsFrame := asFrame;

  //если показываем форму как фрейм
    if Self.CP_LocalAsFrame
        then
    begin
        Self.BorderStyle := bsNone;
        Self.BorderIcons := [];
        Self.Visible := True;
    end;

    CP_SetControls(False);

    Database.Handle := Db_Handle;
    Database.Open;

    ReadTransaction.StartTransaction;
    StartHistory(ReadTransaction);

    Self.CP_Id_Order_Type := Id_Order_Type;
    Self.CP_Base_Num_Item := Num_Item;
    Self.CP_Base_Num_Sub_Item := Num_Sub_Item;
    Self.CP_Id_Order := Id_Order;
    Self.CP_EditMode := Mode;

    CheckFinance := True;

    if (Self.CP_EditMode <> 3)
        then
        CP_Key_Session := Database.Gen_Id('GEN_UP_ID_SESSION', 1)
    else
    begin
        Self.CP_Key_Session := Database.Gen_Id('GEN_UP_ID_SESSION', 1);

        if (Id_Order_Item <> Null)
            then
            Self.CP_EditIdOrderItem := VarAsType(Id_Order_Item, varInt64);
    end;

    if (Self.CP_EditMode in [1, 2]) //Необходимо сгенерить информацию в буфера
        then
    begin
        Self.CP_EditIdOrderItem := VarAsType(Id_Order_Item, varInt64);
        CP_CreateBuffInfoByIdItem;
    end;

    ErrorForm := TfrmGetErrors.Create(self);

  // отображение информации в приказах
    CP_GetData;

    if (MainCPOrderDataSet.RecordCount > 0)
        then
    begin
        CP_SetControls(true);
    end;

    if self.CP_EditMode = 2 //then OkButton.Visible:=false;
        then
    begin
        CP_SetControls(false);
        dxViewButton.Enabled := True;
    end;

    
    if (mode=2) then
      begin
        ComandEdit.Enabled:=False;
        ComandEdit.Blocked:=True;
      end;

    if OkButton.HandleAllocated
        then
        SendMessage(Self.CP_Outer_HWND, FMAS_MESS_GET_BUTTON_OK, OkButton.Handle, OkButton.Handle);

    if CancelButton.HandleAllocated
        then
        SendMessage(Self.CP_Outer_HWND, FMAS_MESS_GET_BUTTON_OK, CancelButton.Handle, CancelButton.Handle);
end;



procedure TFormComandMain.CP_CreateBuffInfoByIdItem;
var
    StoredProc: TpFibStoredProc;
begin
    //Создаем новый пункт приказа в буфферной таблице
    StoredProc := TpFibStoredProc.Create(nil);
    StoredProc.Database := Database;
    StoredProc.Transaction := WriteTransaction;
    WriteTransaction.StartTransaction;
    // StartHistory(WriteTransaction);

    StoredProc.StoredProcName := 'UP_KER_GET_NEW_ID_ORDER_ITEM_EX';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := Self.CP_Key_Session;
    StoredProc.ParamByName('OLD_ID_ORDER_ITEM').AsInt64 := Self.CP_EditIdOrderItem;
    StoredProc.ExecProc;
    StoredProc.Close;

    try
        StoredProc.StoredProcName := 'UP_DT_COMAND_PLAN_CREATE_INFO';
        StoredProc.Prepare;
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := Self.CP_Key_Session;
        StoredProc.ParamByName('OLD_ID_ORDER_ITEM').AsInt64 := Self.CP_EditIdOrderItem;
        StoredProc.ExecProc;
    except on E: EXCEPTION do
        begin
            SHOWMESSAGE(E.Message);
            EXIT;
        end;
    end;
    WriteTransaction.Commit;
    {ПРОВЕРИТЬ ПАРАМЕТРЫ СТОРЕДПРОЦА}
    ComandEdit.Value := StoredProc.ParamByName('ID_COMAND_TYPE').Value;
    ComandEdit.DisplayText := StoredProc.ParamByName('TYPE_NAME').ASString;

    if VarIsNull(ComandEdit.Value) then
        CP_SetControls(False)
    else
        CP_SetControls(True);

    StoredProc.Close;
    StoredProc.Free;
end;

procedure TFormComandMain.CP_GetData;
var
    IdOrderItem: Int64;
begin
    IdOrderItem := -1;

    if MainCPOrderDataSet.Active
        then
    begin
        if MainCPOrderDataSet.RecordCount > 0 then
            IdOrderItem := StrToInt64(MainCPOrderDataSet.FieldByName('Id_order_item').AsString);
        MainCPOrderDataSet.Close;
    end
    else
        IdOrderItem := -1;

    {НУЖНА СВОЯ ПРОЦЕДУРА}

    if (self.CP_EditMode = 0) //Добавление
        then
    begin
        MainCPOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL(' + IntToStr(self.CP_Key_Session) + ',-1)';
    end;

    if (self.CP_EditMode = 1) //Редактирование
        then
    begin
        MainCPOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL(' + IntToStr(self.CP_Key_Session) + ',-1)';
    end;

    if (self.CP_EditMode = 2) //Только просмотр
        then
    begin
        MainCPOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL(' + IntToStr(self.CP_Key_Session) + ',-1)';
    end;

    if (self.CP_EditMode = 3) //Редактирование на основании id_item и CP_Key_Session
        then
    begin
        MainCPOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL(' + IntToStr(self.CP_Key_Session) + ',' + IntToStr(self.CP_EditIdOrderItem) + ')';
    end;

    MainCPOrderDataSet.Open;
    MainCPOrderDataSet.FetchAll;

    MainCPOrderDataSet.Locate('Id_order_item', IdOrderItem, []);

end;

procedure TFormComandMain.CP_SetControls(bEnable: Boolean);
begin
    OkButton.Enabled := bEnable;
    dxAddButton.Enabled := bEnable;
    dxModifyButton.Enabled := bEnable;
    if (CP_EditMode = 1) //редактирование
        then
        dxDeleteButton.Enabled := False
    else
        dxDeleteButton.Enabled := bEnable;
    dxViewButton.Enabled := bEnable;
end;

procedure TFormComandMain.CancelButtonClick(Sender: TObject);
begin
    if CP_LocalAsFrame then
        SendMessage(CP_Outer_HWND, FMAS_MESS_CLOSE_FRAME, 0, 0)
    else
        Close;
end;

procedure TFormComandMain.FormClose(Sender: TObject;
    var Action: TCloseAction);
var
    ClearSP: TpFibStoredProc;
begin
    if (self.CP_EditMode <> 4)
        then
    begin
        ClearSP := TpFibStoredProc.Create(nil);

        ClearSP.Database := Database;
        ClearSP.Transaction := WriteTransaction;

        WriteTransaction.StartTransaction;
        StartHistory(WriteTransaction);

        ClearSP.StoredProcName := 'UP_KER_CLEAR_TMP_EX';
        ClearSP.Prepare;
        ClearSP.ParamByName('KEY_SESSION').AsInt64 := self.CP_Key_Session;

        ClearSP.ExecProc;
        WriteTransaction.Commit;

        ClearSP.Close;
        ClearSP.Free;
    end;
end;

procedure TFormComandMain.dxAddButtonClick(Sender: TObject);
var
    frm: TFormComandOrderEdit;
    GetId_order_itemSP: TpFibStoredProc;
    InsertPost, InsertCity, InsertSmet: TpFibStoredProc;
    id_order_item: Integer;
    i: Integer;
    s: string;
begin
    frm := TFormComandOrderEdit.Create(Self, Database.Handle,
        0, -1, CP_Id_Order_Type);
    frm.Caption := 'Додати ' + frm.Caption;
    frm.CheckFinance := CheckFinance;
    try
        DSetSelect.Close;
        DSetSelect.SQLs.SelectSQL.Text := 'SELECT * FROM UP_GET_REG_COMAND_NUM';
        DSetSelect.Open;

        CP_Num_Ord := DSetSelect.FieldByName('NUM_ORD').AsInteger;
        frm.cxNumCertText.EditingText := DSetSelect.FieldByName('NUM_CERT').AsString;
        frm.cxTextEdit1.EditingText := DSetSelect.FieldByName('NUM_ORD').AsString;
        //frm.cxTextEdit1.Properties.ReadOnly:=True;
        frm.cxTextEdit2.EditingText := DSetSelect.FieldByName('NUM_DOP').AsString;
        frm.cxTextEdit2.Properties.ReadOnly := True;
    except
        on E: Exception do
            Showmessage(E.Message);
    end;
    if frm.ShowModal = mrOk then
    begin

        WriteTransaction.StartTransaction;
        GetId_order_itemSP := TpFibStoredProc.Create(nil);
        GetId_order_itemSP.Database := Database;
        GetId_order_itemSP.Transaction := WriteTransaction;
        GetId_order_itemSP.StoredProcName := 'UP_KER_GET_NEW_ID_ORDER_ITEM';

        GetId_order_itemSP.Prepare;
        GetId_order_itemSP.ParamByName('KEY_SESSION').AsInt64 := CP_Key_Session;
        GetId_order_itemSP.ParamByName('NOTE').Value := frm.cxTextEditNote.Text;
        GetId_order_itemSP.ParamByName('NUM_ITEM').Value := CP_Base_Num_Item;
        GetId_order_itemSP.ParamByName('NUM_SUB_ITEM').Value := CP_Base_Num_Sub_Item;
        GetId_order_itemSP.ParamByName('ID_ORDER').AsInt64 := self.CP_Id_Order;
        GetId_order_itemSP.ParamByName('ID_ORDER_TYPE').Value := self.CP_Id_Order_Type;
        GetId_order_itemSP.ParamByName('REASON').Value := frm.cxTextEditReason.Text; //NULL;

        try
            GetId_order_itemSP.ExecProc;
        except on E: Exception do
            begin
                ShowMessage(E.Message);
                exit;
            end;
        end;

        Id_Order_Item := GetId_order_itemSP.FieldByName('ID_ITEM').AsInt64;

        Self.CP_Base_Num_Sub_Item := Self.CP_Base_Num_Sub_Item + 1;

        StorProc.Close;
        StorProc.Transaction.StartTransaction;

        StorProc.StoredProcName := 'UP_DT_COMAND_PLAN_BUFF_INS';
        StorProc.Prepare;
        StorProc.ParamByName('KEY_SESSION').AsInt64 := CP_Key_Session;
        StorProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
        StorProc.ParamByName('ID_PCARD').AsVariant := frm.Id_Pcard;
        StorProc.ParamByName('ID_MAN').AsVariant := frm.ManEdit.Value;
        StorProc.ParamByName('DATE_BEG').AsDate := frm.cxDate_Beg.Date;
        StorProc.ParamByName('DATE_END').AsDate := frm.cxDate_End.Date;
        StorProc.ParamByName('DAYS_COUNT').AsInteger := frm.Days_Count;
        StorProc.ParamByName('TARGET').AsString := frm.CBTarget.Text;
        StorProc.ParamByName('ID_COMAND_TYPE').AsVariant := ComandEdit.Value;
        StorProc.ParamByName('MAN_POST').AsString := frm.Man_Post;

        s := frm.cxTextEdit1.Text + '/' + frm.cxTextEdit2.Text;
        delete(s, 39, length(s));
        StorProc.ParamByName('NUM_CERT').AsString := s;
        StorProc.ParamByName('NUM_ORD').AsInteger := VarAsType(frm.cxTextEdit1.EditValue, varInteger);
        StorProc.ParamByName('NUM_DOP').AsString := frm.cxTextEdit2.Text;

        StorProc.ParamByName('DATE_CERT').AsDate := frm.cxDateCertEdit.Date;
        //StorProc.ParamByName('NUM_ORD').AsInteger := CP_Num_Ord;
        StorProc.ParamByName('ID_COMAND_TARGET').asVariant := frm.CBTarget.EditValue;
        StorProc.ParamByName('IS_CANCEL').AsInteger := 0;

        try
            StorProc.ExecProc;

            //id_order_item := StoredProc['ID_ORDER_ITEM'].AsInt64;
        except
            StorProc.Transaction.Rollback;
            exit;
        end;


        InsertPost := TpFibStoredProc.Create(nil);
        InsertPost.Database := Database;
        InsertPost.Transaction := WriteTransaction;
        if frm.Is_Working then
        begin
            for i := 0 to frm.cxGridPostTableView.DataController.RecordCount - 1 do
            begin
                InsertPost.StoredProcName := 'UP_DT_COMAND_PLAN_WORK_BUFF_INS';
                InsertPost.Prepare;
                InsertPost.ParamByName('KEY_SESSION').AsInt64 := CP_Key_Session;
                InsertPost.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
                InsertPost.ParamByName('ID_WORK_DOG_MOVING').AsInt64 := frm.cxGridPostTableView.DataController.Values[i, 0];
                try
                    InsertPost.ExecProc;
                except
                    InsertPost.Transaction.Rollback;
                    break;
                end;
            end;
        end;
        InsertCity := TpFibStoredProc.Create(nil);
        InsertCity.Database := Database;
        InsertCity.Transaction := WriteTransaction;

        for i := 0 to frm.cxGridCityTableView.DataController.RecordCount - 1 do
        begin
            InsertCity.StoredProcName := 'UP_DT_COMAND_PLAN_ORG_BUFF_INS';
            InsertCity.Prepare;
            InsertCity.ParamByName('KEY_SESSION').AsInt64 := CP_Key_Session;
            InsertCity.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
            InsertCity.ParamByName('ID_COMAND_ORG').AsInt64 := frm.cxGridCityTableView.DataController.Values[i, 0];
            InsertCity.ParamByName('ID_PLACE').AsInt64 := frm.cxGridCityTableView.DataController.Values[i, 3];
            try
                InsertCity.ExecProc;
            except
                InsertCity.Transaction.Rollback;
                break;
            end;
        end;

        InsertSmet := TpFibStoredProc.Create(nil);
        InsertSmet.Database := Database;
        InsertSmet.Transaction := WriteTransaction;

        for i := 0 to frm.cxGridSmetTableView.DataController.Recordcount - 1 do
        begin
            InsertSmet.StoredProcName := 'UP_DT_COMAND_PLAN_SMET_BUFF_INS';
            InsertSmet.Prepare;
            InsertSmet.ParamByName('KEY_SESSION').AsInt64 := CP_Key_Session;
            InsertSmet.ParamByName('ID_SMET').AsInt64 := frm.cxGridSmetTableView.DataController.Values[i, 0];
            InsertSmet.ParamByName('PERCENT').AsInt64 := frm.cxGridSmetTableView.DataController.Values[i, 3];
            InsertSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
            try
                InsertSmet.ExecProc;
            except
                InsertSmet.Transaction.Rollback;
                break;
            end;
        end;
        WriteTransaction.Commit;

        InsertPost.Free;
        InsertCity.Free;
        InsertSmet.Free;

        CP_GetData;

        if (MainCPOrderDataSet.RecordCount > 0)
            then
        begin
            CP_SetControls(true);

        end;


    end;
    frm.Free;
end;

procedure TFormComandMain.OkButtonClick(Sender: TObject);
begin

    if self.CP_EditMode in [0, 1]
        then
    begin
        if CP_CheckData
            then
        begin
            if CP_SaveData
                then
            begin
                ShowMessage('Інформація по наказу успішно збережена!');
                if not CP_LocalAsFrame
                    then
                begin
                    if (ComandEdit.DisplayText <> '') then
                        ModalResult := mrOk;
                end
                else
                    SendMessage(CP_Outer_HWND, FMAS_MESS_SAVE_ITEM_OK, 0, 0);
            end
            else
            begin
                ShowMessage('Знайдені помилки під час проведення наказу через ядро системи!');
                CP_ShowErrors;
                CP_GetData;
                MainCPOrderDataSet.Locate('ID_ORDER_ITEM', err_id_order_item, []);
            end
        end
        else
            ShowMessage('Знайдені помилки в інформації по наказу!');
    end
    else
    begin
        if (ComandEdit.DisplayText <> '') then
            ModalResult := mrOk;
    end;
end;

function TFormComandMain.CP_CheckData: Boolean;
begin
    //Необходимо проверить на корректность данные в буфферах
    if VarIsNull(ComandEdit.Value) then
    begin
        agMessageDlg('Увага!', 'Для збереження інформації необхідно обрати тип відрядження!', mtConfirmation, [mbYes, mbNo]);
        Result := False;
    end
    else
        Result := true;
end;

function TFormComandMain.CP_SaveData: Boolean;
var
    i: Integer;
    ExistErrors: Boolean;
begin
    ExistErrors := false;
    err_id_order_item := -9999;

    if (MainCPOrderDataSet.RecordCount > 0)
        then
    begin
        WriteTransaction.StartTransaction;
        StartHistory(WriteTransaction);
        MainCPOrderDataSet.First;

        for i := 0 to MainCPOrderDataSet.RecordCount - 1 do
        begin
            if CP_AddNewItem(VarAsType(MainCPOrderDataSet['ID_ORDER_ITEM'], varInt64)) //Сохраняем информацию по пункту
                then
            else
            begin
                err_id_order_item := VarAsType(MainCPOrderDataSet['ID_ORDER_ITEM'], varInt64);
                CP_GetErrorTexts(VarAsType(MainCPOrderDataSet['ID_ORDER_ITEM'], varInt64));
                ExistErrors := true;
                Break;
            end;
            MainCPOrderDataSet.Next;
        end;

        if ExistErrors
            then
            WriteTransaction.Rollback
        else
        begin
            WriteTransaction.Commit;
            if self.CP_EditMode = 0 then
                self.CP_EditMode := 1;
        end;
    end;

    Result := not ExistErrors;
end;

function TFormComandMain.CP_AddNewItem(id_item: Int64): Boolean;
var
    AddStru: UP_KERNEL_MODE_STRUCTURE;
begin
    AddStru.AOWNER := self;
    AddStru.ID_ORDER := self.CP_Id_Order;
    AddStru.ID_ORDER_ITEM_IN := id_item;
    //StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
    AddStru.KEY_SESSION := self.CP_Key_Session;
    AddStru.DBHANDLE := Database.Handle;
    AddStru.TRHANDLE := WriteTransaction.Handle;
    Result := UpKernelDo(@AddStru);
end;

procedure TFormComandMain.dxDeleteButtonClick(Sender: TObject);
var
    DeleteSP: TpFibStoredProc;
begin
    if (MainCPOrderDataSet.RecordCount > 0)
        then
    begin
        if (agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes)
            then
        begin
            DeleteSP := TpFibStoredProc.Create(self);
            DeleteSP.Database := Database;
            DeleteSP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            DeleteSP.StoredProcName := 'UP_DT_COMAND_PLAN_BUFF_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('KEY_SESSION').asInt64 := self.CP_Key_Session;
            DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainCPOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
            DeleteSP.ExecProc;
            DeleteSP.Close;
            DeleteSP.Free;
            WriteTransaction.Commit;

            MainCPOrderDataSet.CacheDelete;
            //CP_GetData;

            if (MainCPOrderDataSet.RecordCount = 0)
                then
            begin
                //CP_SetControls(false);

                OkButton.Enabled := False;
                dxAddButton.Enabled := True;
                dxDeleteButton.Enabled := False;
                dxModifyButton.Enabled := False;
            end;
        end;
    end;
end;

procedure TFormComandMain.dxModifyButtonClick(Sender: TObject);
begin
    CP_ShowData(1);
end;

procedure TFormComandMain.dxViewButtonClick(Sender: TObject);
begin
    CP_ShowData(2);
end;


procedure TFormComandMain.CP_ShowData(Id_Mode: Integer);
var
    frm: TFormComandOrderEdit;
    idx, i: Integer;
    Id_Order_Item: Int64;
    DeleteProc, InsertPost, InsertCity, InsertSmet: TpFIBStoredProc;
    s: string;
begin
    frm := TFormComandOrderEdit.Create(FormComandMain, Database.Handle,
        Id_mode, CP_EditIdOrderItem, CP_Id_Order_Type);
    try
        frm.cxDate_Beg.EditValue := MainCPOrderDataSet.FieldByName('DATE_BEG').AsVariant;
        frm.cxDate_End.EditValue := MainCPOrderDataSet.FieldByName('DATE_END').AsVariant;
        frm.Days_Count := MainCPOrderDataSet.FieldByName('DAYS_COUNT').AsInteger;
        frm.ManEdit.Value := MainCPOrderDataSet.FieldByName('ID_MAN').AsVariant;
        frm.ManEdit.DisplayText := MainCPOrderDataSet.FieldByName('FIO').AsString;
        frm.cxNumCertText.Text := MainCPOrderDataSet.FieldByName('NUM_CERT').AsString;

        frm.cxTextEdit1.Text := MainCPOrderDataSet.FieldByName('NUM_ORD').AsString;
        //frm.cxTextEdit1.Properties.ReadOnly:=True;
        frm.cxTextEdit2.Text := MainCPOrderDataSet.FieldByName('NUM_DOP').AsString;
        frm.cxTextEdit2.Properties.ReadOnly := True;

        frm.cxDateCertEdit.EditValue := MainCPOrderDataSet.FieldByName('DATE_CERT').AsVariant;
        frm.cxMEditDaysCount.EditValue := MainCPOrderDataSet.FieldByName('DAYS_COUNT').AsVariant;
        if VarIsNull(MainCPOrderDataSet.FieldByName('ID_PCARD').AsVariant)
            then
        begin
            frm.EnablePosts(False);
            frm.cxMemoPost.Text := MainCPOrderDataSet.FieldByName('NAME_POST_FULL').AsString;
            frm.Man_Post := MainCPOrderDataSet.FieldByName('NAME_POST_FULL').AsString;
            frm.Is_Working := False;
        end
        else
        begin
            frm.EnablePosts(True);
            frm.Is_Working := True;
            DSetSelect.Close;
            DSetSelect.Sqls.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_WORK_BUFF_SEL(' +
                MainCPOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString + ', ' + IntToStr(CP_Key_Session) + ')';
            DSetSelect.Open;

            frm.Man_Post := '';

            DSetSelect.First;
            while not DSetSelect.Eof do
            begin
                if frm.Man_Post <> '' then
                    frm.Man_Post := frm.Man_Post + ', ';
                frm.cxGridPostTableView.DataController.RecordCount := frm.cxGridPostTableView.DataController.RecordCount + 1;
                idx := frm.cxGridPostTableView.DataController.RecordCount - 1;

                frm.cxGridPostTableView.DataController.Values[idx, 0] := DSetSelect.FieldByName('ID_WORK_DOG_MOVING').AsInteger;
                frm.cxGridPostTableView.DataController.Values[idx, 1] := DSetSelect.FieldByName('DEPARTMENT_NAME').AsString;
                frm.cxGridPostTableView.DataController.Values[idx, 2] := DSetSelect.FieldByName('NAME_POST').AsString;
                frm.cxGridPostTableView.DataController.Values[idx, 3] := (DSetSelect.FieldByName('IS_POST_MAIN').AsInteger = 1);
                frm.cxGridPostTableView.DataController.Values[idx, 4] := DSetSelect.FieldByName('NAME_WORK_REASON').AsString;
                frm.cxGridPostTableView.DataController.Values[idx, 5] := DSetSelect.FieldByName('RATE_COUNT').AsFloat;

                frm.cxGridPostTableView.DataController.FocusedRecordIndex := idx;

                frm.Man_Post := frm.Man_Post + DSetSelect.FieldByName('NAME_POST').AsString;
                DSetSelect.Next;
            end;
        end;
        frm.Id_Pcard := MainCPOrderDataSet.FieldByName('ID_PCARD').AsVariant;

        DSetSelect.Close;
        DSetSelect.Sqls.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_ORG_BUFF_SEL(' +
            MainCPOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString + ', ' + IntToStr(CP_Key_Session) + ')';
        DSetSelect.Open;

        DSetSelect.First;
        while not DSetSelect.Eof do
        begin
            frm.cxGridCityTableView.DataController.RecordCount := frm.cxGridCityTableView.DataController.RecordCount + 1;
            idx := frm.cxGridCityTableView.DataController.RecordCount - 1;

            frm.cxGridCityTableView.DataController.Values[idx, 0] := DSetSelect.FieldByName('ID_COMAND_ORG').AsInteger;
            frm.cxGridCityTableView.DataController.Values[idx, 1] := DSetSelect.FieldByName('NAME_CITY').AsString;
            frm.cxGridCityTableView.DataController.Values[idx, 2] := DSetSelect.FieldByName('NAME_ORG').AsString;
            frm.cxGridCityTableView.DataController.Values[idx, 3] := DSetSelect.FieldByName('ID_PLACE').AsInteger;
            frm.cxGridCityTableView.DataController.FocusedRecordIndex := idx;

            DSetSelect.Next;
        end;

        DSetSelect.Close;
        DSetSelect.Sqls.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_SM_BUFF_SEL(' +
            MainCPOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString + ', ' + IntToStr(CP_Key_Session) + ')';
        DSetSelect.Open;

        DSetSelect.First;
        while not DSetSelect.Eof do
        begin
            frm.cxGridSmetTableView.DataController.RecordCount := frm.cxGridSmetTableView.DataController.RecordCount + 1;
            idx := frm.cxGridSmetTableView.DataController.RecordCount - 1;

            frm.cxGridSmetTableView.DataController.Values[idx, 0] := DSetSelect.FieldByName('ID_SMET').AsString;
            frm.cxGridSmetTableView.DataController.Values[idx, 1] := DSetSelect.FieldByName('SM_KOD').AsString;
            frm.cxGridSmetTableView.DataController.Values[idx, 2] := DSetSelect.FieldByName('SM_TITLE').AsString;
            frm.cxGridSmetTableView.DataController.Values[idx, 3] := DSetSelect.FieldByName('PERCENT').AsString;
            frm.cxGridSmetTableView.DataController.FocusedRecordIndex := idx;

            DSetSelect.Next;
        end;

        frm.cxTextEditReason.Text := MainCPOrderDataSet.FieldByName('REASON').AsString;
        frm.CBTarget.EditValue := MainCPOrderDataSet.FieldByName('ID_COMAND_TARGET').AsVariant;
        frm.CBTarget.Text := MainCPOrderDataSet.FieldByName('TARGET').AsString;
        frm.cxTextEditNote.Text := MainCPOrderDataSet.FieldByName('NOTE').AsString;

    except on E: Exception do
        begin
            ShowMessage(E.Message);
            exit;
        end;
    end;

    if frm.ShowModal = mrOk then
    begin
        if Id_Mode = 1 then
        begin
            Id_Order_Item := StrToInt64(MainCPOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);

            //оченьмногабукав :(
            StorProc.Close;
            StorProc.Transaction.StartTransaction;

            StorProc.StoredProcName := 'UP_DT_COMAND_PLAN_BUFF_UPD';
            StorProc.Prepare;
            StorProc.ParamByName('KEY_SESSION').AsInt64 := CP_Key_Session;
            StorProc.ParamByName('ID_ORDER_ITEM').AsInt64 := Id_Order_Item;
            StorProc.ParamByName('ID_PCARD').AsVariant := frm.Id_Pcard;
            StorProc.ParamByName('ID_MAN').AsVariant := FRM.ManEdit.Value;
            StorProc.ParamByName('DATE_BEG').AsDate := frm.cxDate_Beg.Date;
            StorProc.ParamByName('DATE_END').AsDate := frm.cxDate_End.Date;
            StorProc.ParamByName('DAYS_COUNT').AsInteger := frm.Days_Count;
            StorProc.ParamByName('TARGET').AsString := frm.CBTarget.Text;
            StorProc.ParamByName('ID_COMAND_TYPE').AsVariant := ComandEdit.Value;
            StorProc.ParamByName('MAN_POST').AsString := frm.Man_Post;
            s := frm.cxTextEdit1.Text + '/' + frm.cxTextEdit2.Text;
            delete(s, 39, length(s));
            StorProc.ParamByName('NUM_CERT').AsString := s; // frm.cxTextEdit1.Text+'/'+frm.cxTextEdit2.Text;//frm.cxNumCertText.Text;

            StorProc.ParamByName('NUM_ORD').AsString := frm.cxTextEdit1.Text;
            StorProc.ParamByName('NUM_DOP').AsString := frm.cxTextEdit2.Text;

            StorProc.ParamByName('DATE_CERT').AsDate := frm.cxDateCertEdit.Date;
            StorProc.ParamByName('REASON').AsString := frm.cxTextEditReason.Text;
            StorProc.ParamByName('NOTE').AsString := frm.cxTextEditNote.Text;
            StorProc.ParamByName('ID_COMAND_TARGET').AsVariant := frm.CBTarget.EditValue;
            try
                StorProc.ExecProc;

                //id_order_item := StoredProc['ID_ORDER_ITEM'].AsInt64;
            except
                StorProc.Transaction.Rollback;
                exit;
            end;

            DeleteProc := TpFIBStoredProc.Create(nil);
            DeleteProc.Database := Database;
            DeleteProc.Transaction := WriteTransaction;
            DeleteProc.StoredProcName := 'UP_DT_COMAND_PLAN_BUFF_TBL_DEL';
            DeleteProc.Prepare;
            DeleteProc.ParamByName('KEY_SESSION').AsInt64 := CP_Key_Session;
            DeleteProc.ParamByName('ID_ORDER_ITEM').AsInt64 := Id_Order_Item;
            try
                DeleteProc.ExecProc;
            except
                DeleteProc.Transaction.Rollback;
                exit;
            end;

            InsertPost := TpFibStoredProc.Create(nil);
            InsertPost.Database := Database;
            InsertPost.Transaction := WriteTransaction;
            if frm.Is_Working then
            begin
                for i := 0 to frm.cxGridPostTableView.DataController.Recordcount - 1 do
                begin
                    InsertPost.StoredProcName := 'UP_DT_COMAND_PLAN_WORK_BUFF_INS';
                    InsertPost.Prepare;
                    InsertPost.ParamByName('KEY_SESSION').AsInt64 := CP_Key_Session;
                    InsertPost.ParamByName('ID_ORDER_ITEM').AsInt64 := Id_Order_Item;
                    InsertPost.ParamByName('ID_WORK_DOG_MOVING').AsInt64 := frm.cxGridPostTableView.DataController.Values[i, 0];
                    try
                        InsertPost.ExecProc;
                    except
                        InsertPost.Transaction.Rollback;
                        break;
                    end;
                end;
            end;
            InsertCity := TpFibStoredProc.Create(nil);
            InsertCity.Database := Database;
            InsertCity.Transaction := WriteTransaction;

            for i := 0 to frm.cxGridCityTableView.DataController.Recordcount - 1 do
            begin
                InsertCity.StoredProcName := 'UP_DT_COMAND_PLAN_ORG_BUFF_INS';
                InsertCity.Prepare;
                InsertCity.ParamByName('KEY_SESSION').AsInt64 := CP_Key_Session;
                InsertCity.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
                InsertCity.ParamByName('ID_COMAND_ORG').AsInt64 := frm.cxGridCityTableView.DataController.Values[i, 0];
                InsertCity.ParamByName('ID_PLACE').AsInt64 := frm.cxGridCityTableView.DataController.Values[i, 3];
                try
                    InsertCity.ExecProc;
                except
                    InsertCity.Transaction.Rollback;
                    break;
                end;
            end;

            InsertSmet := TpFibStoredProc.Create(nil);
            InsertSmet.Database := Database;
            InsertSmet.Transaction := WriteTransaction;

            for i := 0 to frm.cxGridSmetTableView.DataController.Recordcount - 1 do
            begin
                InsertSmet.StoredProcName := 'UP_DT_COMAND_PLAN_SMET_BUFF_INS';
                InsertSmet.Prepare;
                InsertSmet.ParamByName('KEY_SESSION').AsInt64 := CP_Key_Session;
                InsertSmet.ParamByName('ID_SMET').AsInt64 := frm.cxGridSmetTableView.DataController.Values[i, 0];
                InsertSmet.ParamByName('PERCENT').AsInt64 := frm.cxGridSmetTableView.DataController.Values[i, 3];
                InsertSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
                try
                    InsertSmet.ExecProc;
                except
                    InsertSmet.Transaction.Rollback;
                    break;
                end;
            end;
            WriteTransaction.Commit;

            DeleteProc.Free;
            InsertPost.Free;
            InsertCity.Free;
            InsertSmet.Free;

            CP_GetData;

            if (MainCPOrderDataSet.RecordCount > 0)
                then
            begin
                CP_SetControls(true);

            end;
        end;
    end;
    frm.Free;
end;

procedure TFormComandMain.FormDestroy(Sender: TObject);
var
    ClearSP: TpFibStoredProc;
begin
    if (self.CP_EditMode <> 3)
        then
    begin
        ClearSP := TpFibStoredProc.Create(nil);
        ClearSP.Database := Database;
        ClearSP.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        StartHistory(WriteTransaction);
        ClearSP.StoredProcName := 'UP_KER_CLEAR_TMP_EX';
        ClearSP.Prepare;
        ClearSP.ParamByName('KEY_SESSION').AsInt64 := self.CP_Key_Session;
        ClearSP.ExecProc;
        WriteTransaction.Commit;
        ClearSP.Close;
        ClearSP.Free;
    end;

    {if Assigned(PC) then PC.Free;
    if Assigned(ErrorForm) then ErrorForm.Free;}
end;

procedure TFormComandMain.cxCPGridMainTableViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then
    begin
        ShowInfo(MainCPOrderDataSet);
    end;
end;

procedure TFormComandMain.ComandEditChange(Sender: TObject);
begin
    if VarIsNull(ComandEdit.Value) then
        dxAddButton.Enabled := False;
end;

procedure TFormComandMain.CP_GetErrorTexts(id_item: int64);
var
    GetErrorTextsDS: TpFibDataSet;
begin
    GetErrorTextsDS := TpFibDataSet.Create(self);
    GetErrorTextsDS.Database := Database;
    GetErrorTextsDS.Transaction := ReadTransaction;
    GetErrorTextsDS.SelectSQL.Text := ' SELECT * FROM UP_KER_UTILS_GET_ORDER_ERRORS('
        + IntToStr(self.CP_Key_Session) + ',' + IntToStr(Id_item) + ') ';


    GetErrorTextsDS.Open;
    GetErrorTextsDS.FetchAll;

    if (GetErrorTextsDS.RecordCount > 0)
        then
    begin

        if Assigned(ErrorForm)
            then
        begin
            if TfrmGetErrors(ErrorForm).ErrorTextsMemoryData.Active
                then
                TfrmGetErrors(ErrorForm).ErrorTextsMemoryData.Close;

            TfrmGetErrors(ErrorForm).ErrorTextsMemoryData.CopyStructure(GetErrorTextsDS);
            TfrmGetErrors(ErrorForm).ErrorTextsMemoryData.LoadFromDataSet(GetErrorTextsDS, GetErrorTextsDS.RecordCount, lmCopy);
        end;
    end;
    GetErrorTextsDS.Close;
    GetErrorTextsDS.Free;
end;

procedure TFormComandMain.CP_ShowErrors;
begin

    if not Assigned(ErrorForm)
        then
    begin
        ErrorForm := TfrmGetErrors.Create(self);
    end;
    //Показываем ошибки по пункту
    ErrorForm.ShowModal;
end;

end.

