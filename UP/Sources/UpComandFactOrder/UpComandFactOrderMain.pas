unit UpComandFactOrderMain;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase,
    FIBDataSet, pFIBDataSet, StdCtrls, Buttons, cxGridTableView, cxGridLevel,
    cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
    cxGridCustomView, cxGrid, ImgList, dxBar, dxBarExtItems, ExtCtrls,
    pFibStoredProc, iBase, AppEvnts, AppStruClasses, UpKernelUnit,
    FIBQuery, pFIBQuery, cxContainer, cxLabel, cxDBLabel, BaseTypes,
    UpComandFactShowErrors, cxTextEdit, RxMemDs;
type
    TFormComandFactMain = class(TForm)
        BarManager: TdxBarManager;
        DockControl: TdxBarDockControl;
        BarPanel: TPanel;
        btnAddItem: TdxBarLargeButton;
        IL_OrdAcc: TImageList;
        btnModifyItem: TdxBarLargeButton;
        btnDeleteItem: TdxBarLargeButton;
        btnInfoItem: TdxBarLargeButton;
        GridMain: TcxGrid;
        GridMainTableView: TcxGridDBTableView;
        colNum_Item: TcxGridDBColumn;
        colNum_Sub_Item: TcxGridDBColumn;
        colTN: TcxGridDBColumn;
        colFIO: TcxGridDBColumn;
        colName_Post: TcxGridDBColumn;
        colDate_Beg: TcxGridDBColumn;
        colDate_End: TcxGridDBColumn;
        colDays_Count: TcxGridDBColumn;
        GridMainLevel: TcxGridLevel;
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
        BtnPanel: TPanel;
        Panel3: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        MainOrderDataSet: TpFIBDataSet;
        MainDSource: TDataSource;
        CFDatabase: TpFIBDatabase;
        ReadTr: TpFIBTransaction;
        WriteTr: TpFIBTransaction;
        colCity: TcxGridDBColumn;
        colSmet: TcxGridDBColumn;
        StorProc: TpFIBStoredProc;
        ReasonPanel: TPanel;
        Label1: TLabel;
        Label2: TLabel;
        cxDBLblNote: TcxDBLabel;
        cxDBLblReason: TcxDBLabel;
        DataSetSelect: TpFIBDataSet;
        procedure btnAddItemClick(Sender: TObject);
        procedure btnDeleteItemClick(Sender: TObject);
        procedure btnModifyItemClick(Sender: TObject);
        procedure btnInfoItemClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
        ErrorForm: TForm;
        ModeEdit: Integer;
        Edit_Id_Order_Item: Int64;
        Local_As_Frame: Boolean;
        err_id_order_item: Int64;
        procedure ShowErrors;
        procedure GetErrorTexts(id_item: int64);
        procedure CreateBuffInfoByIdItem;
        procedure GetData;
        procedure SetControls(bEnable: Boolean);
        procedure ShowData(Id_Mode: Integer);
        function CheckData: Boolean;
        function SaveData: Boolean;
        function AddNewItem(id_item: Int64): Boolean;
    public
        { Public declarations }
        Session_Key: Int64;
        IdUser: Integer;
        Id_Order: Int64;
        Id_OrderType: Integer;
        Base_NumItem: Integer;
        Base_NumSubItem: Integer;
        OuterHWND: HWND;
        constructor Create(AOwner: TComponent;
            Db_Handle: TISC_DB_HANDLE;
            id_order: int64;
            Id_OrderType: Integer;
            num_item: Integer;
            num_sub_item: Integer;
            id_order_item: Variant;
            mode: integer;
            {ViewKeySession: Variant;}
            asFrame: Boolean;
            OuterHWND: Variant); reintroduce;
    end;

var
    FormComandFactMain: TFormComandFactMain;

implementation

uses UpComandFactEditForm, cxCalendar;

{$R *.dfm}

procedure TFormComandFactMain.btnAddItemClick(Sender: TObject);
var
    frmEdit: TFormComandFactEdit;
    GetId_order_itemSP, InsertSmet: TpFibStoredProc;
    id_order_item: Integer;
    i: Integer;
begin
    frmEdit := TFormComandFactEdit.Create(Self);
    frmEdit.DBHandle := CFDataBase.Handle;
    frmEdit.DB.Handle := CFDataBase.Handle;
    frmEdit.ReadTr.Active := True;
    if frmEdit.ShowModal = mrOk then
    begin
        WriteTr.StartTransaction;
        GetId_order_itemSP := TpFibStoredProc.Create(nil);
        GetId_order_itemSP.Database := CFDatabase;
        GetId_order_itemSP.Transaction := WriteTr;
        GetId_order_itemSP.StoredProcName := 'UP_KER_GET_NEW_ID_ORDER_ITEM';

        GetId_order_itemSP.Prepare;
        GetId_order_itemSP.ParamByName('KEY_SESSION').AsInt64 := Session_Key;
        GetId_order_itemSP.ParamByName('NOTE').Value := frmEdit.cxTextEditNote.Text;
        GetId_order_itemSP.ParamByName('NUM_ITEM').Value := Base_NumItem;
        GetId_order_itemSP.ParamByName('NUM_SUB_ITEM').Value := Base_NumSubItem;
        GetId_order_itemSP.ParamByName('ID_ORDER').AsInt64 := self.Id_Order;
        GetId_order_itemSP.ParamByName('ID_ORDER_TYPE').Value := self.Id_OrderType;
        GetId_order_itemSP.ParamByName('REASON').Value := frmEdit.cxTextEditReason.Text; //NULL;

        try
            GetId_order_itemSP.ExecProc;
        except on E: Exception do
            begin
                ShowMessage(E.Message);
                exit;
            end;
        end;

        id_order_item := GetId_order_itemSP.FieldByName('ID_ITEM').AsInt64;

        self.Base_NumSubItem := self.Base_NumSubItem + 1;

        StorProc.Close;
        StorProc.Transaction.StartTransaction;
        StorProc.StoredProcName := 'UP_DT_COMAND_PLAN_FACT_BUFF_INS';
        StorProc.Prepare;
        StorProc.ParamByName('KEY_SESSION').AsInt64 := Session_Key;
        StorProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
        StorProc.ParamByName('ID_COMAND_PLAN').AsVariant := frmEdit.Id_Comand_Plan;
        StorProc.ParamByName('FACT_DATE_BEG').AsDate := frmEdit.cxDateBeg.Date;
        StorProc.ParamByName('FACT_DATE_END').AsDate := frmEdit.cxDateEnd.Date;
        StorProc.ParamByName('FACT_DAYS_COUNT').AsVariant := frmEdit.cxMEditDaysCount.EditValue;
        try
            StorProc.ExecProc;

            //id_order_item := StoredProc['ID_ORDER_ITEM'].AsInt64;
        except
            StorProc.Transaction.Rollback;
            exit;
        end;

        InsertSmet := TpFibStoredProc.Create(nil);
        InsertSmet.Database := CFDatabase;
        InsertSmet.Transaction := WriteTr;

        for i := 0 to frmEdit.cxGridSmetTableView.DataController.RecordCount - 1 do
        begin
            InsertSmet.StoredProcName := 'UP_DT_COMAND_PLAN_SMET_BUFF_INS';
            InsertSmet.Prepare;
            InsertSmet.ParamByName('KEY_SESSION').AsInt64 := Session_Key;
            InsertSmet.ParamByName('ID_SMET').AsInt64 := frmEdit.cxGridSmetTableView.DataController.Values[i, 0];
            InsertSmet.ParamByName('PERCENT').AsInt64 := frmEdit.cxGridSmetTableView.DataController.Values[i, 3];
            InsertSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
            try
                InsertSmet.ExecProc;
            except
                InsertSmet.Transaction.Rollback;
                break;
            end;
        end;
        WriteTr.Commit;

        InsertSmet.Free;

        GetData;

        if (MainOrderDataSet.RecordCount > 0)
            then
        begin
            SetControls(true);

        end;
    end;
    frmEdit.Free;
end;

constructor TFormComandFactMain.Create(AOwner: TComponent; Db_Handle: TISC_DB_HANDLE;
    id_order: int64; Id_OrderType: Integer; num_item: Integer;
    num_sub_item: Integer; id_order_item: Variant; mode: integer;
    {ViewKeySession: Variant; }asFrame: Boolean; OuterHWND: Variant);
begin
    try
        if asFrame
            then
            inherited Create(AOwner)
        else
            inherited Create(AOwner);

        Self.OuterHWND := OuterHWND;

        Local_As_Frame := asFrame;

        //если показываем форму как фрейм
        if Self.Local_As_Frame
            then
        begin
            Self.BorderStyle := bsNone;
            Self.BorderIcons := [];
            Self.Visible := True;
        end;

        SetControls(False);

        CFDatabase.Handle := Db_Handle;
        CFDatabase.Open;

        ReadTr.StartTransaction;
        StartHistory(ReadTr);

        Self.Id_OrderType := Id_OrderType;
        Self.Base_NumItem := Num_Item;
        Self.Base_NumSubItem := Num_Sub_Item;
        Self.Id_Order := Id_Order;
        //Self.Only_Save_In_Buff:=0;
        Self.ModeEdit := Mode;

        if (Self.ModeEdit <> 3)
            then
            Session_Key := CFDatabase.Gen_Id('GEN_UP_ID_SESSION', 1)
        else
        begin
            {if (only_save_in_buff<>null)
            then Self.only_save_in_buff:=only_save_in_buff;}

            {If (ViewKeySession <> Null)
            Then
                Self.Session_Key := VarAsType(ViewKeySession, varInt64);
             }
            Self.Session_Key := CFDatabase.Gen_Id('GEN_UP_ID_SESSION', 1);

            if (Id_Order_Item <> Null)
                then
                Self.Edit_Id_Order_Item := VarAsType(Id_Order_Item, varInt64);
        end;

        if (Self.ModeEdit in [1, 2]) //Необходимо сгенерить информацию в буфера
            then
        begin
            Self.Edit_Id_Order_Item := VarAsType(Id_Order_Item, varInt64);

            CreateBuffInfoByIdItem;
        end;

        ErrorForm := TfrmGetErrors.Create(self);

        // отображение информации в приказах
        GetData;

        if (MainOrderDataSet.RecordCount > 0)
            then
        begin
            SetControls(true);
        end;

        if self.ModeEdit = 2 //then OkButton.Visible:=false;
            then
        begin
            SetControls(false);
            btnInfoItem.Enabled := True;
        end;

    except on E: Exception do
            Showmessage(E.Message);
    end;

    if OkButton.HandleAllocated
        then
        SendMessage(OuterHWND, FMAS_MESS_GET_BUTTON_OK, OkButton.Handle, OkButton.Handle);

    if CancelButton.HandleAllocated
        then
        SendMessage(OuterHWND, FMAS_MESS_GET_BUTTON_OK, CancelButton.Handle, CancelButton.Handle);

end;

procedure TFormComandFactMain.CreateBuffInfoByIdItem;
var
    StoredProc: TpFibStoredProc;
begin
    //Создаем новый пункт приказа в буфферной таблице
    StoredProc := TpFibStoredProc.Create(nil);
    StoredProc.Database := CFDatabase;
    StoredProc.Transaction := WriteTr;
    WriteTr.StartTransaction;
    StartHistory(WriteTr);

    StoredProc.StoredProcName := 'UP_KER_GET_NEW_ID_ORDER_ITEM_EX';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := Self.Session_Key;
    StoredProc.ParamByName('OLD_ID_ORDER_ITEM').AsInt64 := Self.Edit_Id_Order_Item;
    StoredProc.ExecProc;
    StoredProc.Close;

    try
        StoredProc.StoredProcName := 'UP_DT_COMAND_PLAN_CREATE_INFO';
        StoredProc.Prepare;
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := Self.Session_Key;
        StoredProc.ParamByName('OLD_ID_ORDER_ITEM').AsInt64 := Self.Edit_Id_Order_Item;
        StoredProc.ExecProc;
    except on E: EXCEPTION do
        begin
            SHOWMESSAGE(E.Message);
            EXIT;
        end;
    end;
    WriteTr.Commit;

    SetControls(True);

    StoredProc.Close;
    StoredProc.Free;
end;

procedure TFormComandFactMain.GetData;
var
    IdOrderItem: Int64;
begin
    IdOrderItem := -1;

    if MainOrderDataSet.Active
        then
    begin
        if MainOrderDataSet.RecordCount > 0 then
            IdOrderItem := StrToInt64(MainOrderDataSet.FieldByName('Id_order_item').AsString);
        MainOrderDataSet.Close;
    end
    else
        IdOrderItem := -1;

    {НУЖНА СВОЯ ПРОЦЕДУРА}

    if (self.ModeEdit = 0) //Добавление
        then
    begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL(' + IntToStr(self.Session_Key) + ',-1)';
    end;

    if (self.ModeEdit = 1) //Редактирование
        then
    begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL(' + IntToStr(self.Session_Key) + ',-1)';
    end;

    if (self.ModeEdit = 2) //Только просмотр
        then
    begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL(' + IntToStr(self.Session_Key) + ',-1)';
    end;

    if (self.ModeEdit = 3) //Редактирование на основании id_item и Session_Key
        then
    begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL(' + IntToStr(self.Session_Key) + ',' + IntToStr(self.Edit_Id_Order_Item) + ')';
    end;

    MainOrderDataSet.Open;
    MainOrderDataSet.FetchAll;

    MainOrderDataSet.Locate('Id_order_item', IdOrderItem, []);

end;

procedure TFormComandFactMain.SetControls(bEnable: Boolean);
begin
    OkButton.Enabled := bEnable;
    btnModifyItem.Enabled := bEnable;
    btnInfoItem.Enabled := bEnable;
    if (ModeEdit = 1) //редактирование
    then
        btnDeleteItem.Enabled := False
    else
        btnDeleteItem.Enabled := bEnable;
    if (ModeEdit = 2)
    then
        btnAddItem.Enabled := False;

end;

procedure TFormComandFactMain.btnDeleteItemClick(Sender: TObject);
var
    DeleteSP: TpFibStoredProc;
begin
    if (MainOrderDataSet.RecordCount > 0)
        then
    begin
        if (agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes)
            then
        begin
            DeleteSP := TpFibStoredProc.Create(self);
            DeleteSP.Database := CFDatabase;
            DeleteSP.Transaction := WriteTr;
            WriteTr.StartTransaction;
            StartHistory(WriteTr);
            DeleteSP.StoredProcName := 'UP_DT_COMAND_PLAN_BUFF_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('KEY_SESSION').asInt64 := self.Session_Key;
            DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
            DeleteSP.ExecProc;
            DeleteSP.Close;
            DeleteSP.Free;
            WriteTr.Commit;

            MainOrderDataSet.CacheDelete;
            //GetData;

            if (MainOrderDataSet.RecordCount = 0)
                then
            begin
                SetControls(false);
            end;
        end;
    end;
end;

procedure TFormComandFactMain.btnModifyItemClick(Sender: TObject);
begin
    ShowData(1);
end;

procedure TFormComandFactMain.btnInfoItemClick(Sender: TObject);
begin
    ShowData(2);
end;

procedure TFormComandFactMain.ShowData(Id_Mode: Integer);
var
    frm: TFormComandFactEdit;
    idx: Integer;
    DeleteSmet, InsertSmet: TpFIBStoredProc;
    i: Integer;
begin
    frm := TFormComandFactEdit.Create(Self);
    frm.DBHandle := CFDataBase.Handle;
    frm.DB.Handle := CFDataBase.Handle;

    try
        {проверить названия полей}
        frm.cxDateEdit1.EditValue := MainOrderDataSet.FieldByName('DATE_BEG').AsVariant;
        frm.cxDateBeg.EditValue := MainOrderDataSet.FieldByName('DATE_BEG').AsVariant;
        frm.cxDateEnd.EditValue := MainOrderDataSet.FieldByName('DATE_END').AsVariant;
        frm.cxMEditDaysCount.EditValue := MainOrderDataSet.FieldByName('DAYS_COUNT').AsVariant;
        frm.ManEdit.Value := MainOrderDataSet.FieldByName('ID_MAN').AsVariant;
        frm.ManEdit.DisplayText := MainOrderDataSet.FieldByName('FIO').AsVariant;
        frm.Id_Comand_Plan := MainOrderDataSet.FieldByName('ID_COMAND_PLAN').AsVariant;

        frm.DataSet.Close;
        if Id_Mode = 1 then
        begin
            frm.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL_EX(?F_DATE_BEG, ?ID_MAN)';
            frm.DataSet.ParamByName('F_DATE_BEG').AsVariant := MainOrderDataSet.FieldByName('DATE_BEG').AsVariant;
            frm.DataSet.ParamByName('ID_MAN').AsVariant := MainOrderDataSet.FieldByName('ID_MAN').AsVariant;
        end
        else
            frm.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_SEL(' + VarToStr(frm.Id_Comand_Plan) + ')';
        frm.DataSet.Open;

        if frm.DataSet.RecordCount <> 0 then
        begin
            frm.ComandEdit.Value := frm.Id_Comand_Plan;
            frm.ComandEdit.DisplayText := '№ ' + frm.DataSet.fbn('NUM_ORDER').AsString + ' від ' +
                DateToStr(frm.DataSet.fbn('DATE_ORDER').AsDateTime) + '. Відрядження: ' +
                DateToStr(frm.DataSet['DATE_BEG']) + ' - ' + DateToStr(frm.DataSet['DATE_END']) +
                ' на ' + IntToStr(frm.DataSet['DAYS_COUNT']) + ' днів до ' + frm.DataSet.fbn('NAME_ORG_FULL').asString;
        end;

        frm.DSetSelect.Close;
        frm.DSetSelect.Sqls.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_SM_BUFF_SEL(' +
            MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString + ', ' + IntToStr(Session_Key) + ')';
        frm.DSetSelect.Open;

        frm.DSetSelect.First;
        while not frm.DSetSelect.Eof do
        begin
            frm.cxGridSmetTableView.DataController.RecordCount := frm.cxGridSmetTableView.DataController.RecordCount + 1;
            idx := frm.cxGridSmetTableView.DataController.RecordCount - 1;

            frm.cxGridSmetTableView.DataController.Values[idx, 0] := frm.DSetSelect['ID_SMET'];
            frm.cxGridSmetTableView.DataController.Values[idx, 1] := frm.DSetSelect['SM_KOD'];
            frm.cxGridSmetTableView.DataController.Values[idx, 2] := frm.DSetSelect['SM_TITLE'];
            frm.cxGridSmetTableView.DataController.Values[idx, 3] := frm.DSetSelect['PERCENT'];
            frm.cxGridSmetTableView.DataController.FocusedRecordIndex := idx;

            frm.DSetSelect.Next;
        end;

        frm.cxTextEditReason.Text := MainOrderDataSet.FieldByName('REASON').AsString;
        frm.cxTextEditNote.Text := MainOrderDataSet.FieldByName('NOTE').AsString;
    except on E: Exception do
        begin
            ShowMessage(E.Message);
            exit;
        end;
    end;

    if Id_Mode = 1 then
        frm.OkButton.Enabled := True;

    if frm.ShowModal = mrOk then
    begin
        if Id_Mode = 1 then
        begin
            StorProc.Close;
            StorProc.Transaction.StartTransaction;
            StorProc.StoredProcName := 'UP_DT_COMAND_PLAN_FACT_BUFF_UPD';
            StorProc.Prepare;
            StorProc.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('Id_order_item').AsString);
            StorProc.ParamByName('KEY_SESSION').AsInt64 := Session_Key;
            StorProc.ParamByName('ID_COMAND_PLAN').AsVariant := frm.Id_Comand_Plan;
            StorProc.ParamByName('FACT_DATE_BEG').AsDate := frm.cxDateBeg.Date;
            StorProc.ParamByName('FACT_DATE_END').AsDate := frm.cxDateEnd.Date;
            StorProc.ParamByName('FACT_DAYS_COUNT').AsVariant := frm.cxMEditDaysCount.EditValue;
            StorProc.ParamByName('REASON').Value := frm.cxTextEditReason.Text;
            StorProc.ParamByName('NOTE').Value := frm.cxTextEditNote.Text;
            try
                StorProc.ExecProc;

                //id_order_item := StoredProc['ID_ORDER_ITEM'].AsInt64;
            except on E: Exception do
                begin
                    ShowMessage(E.Message);
                    StorProc.Transaction.Rollback;
                    exit;
                end;
            end;

            DeleteSmet := TpFibStoredProc.Create(nil);
            DeleteSmet.Database := CFDatabase;
            DeleteSmet.Transaction := WriteTr;

            DeleteSmet.StoredProcName := 'UP_DT_COMAND_PLAN_SMET_BUFF_DEL';
            DeleteSmet.Prepare;
            DeleteSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('Id_order_item').AsString);
            DeleteSmet.ParamByName('KEY_SESSION').AsInt64 := Session_Key;

            try
                DeleteSmet.ExecProc;
            except
                on E: Exception do
                begin
                    Showmessage(E.Message);
                    DeleteSmet.Transaction.Rollback;
                    exit;
                end;
            end;

            InsertSmet := TpFibStoredProc.Create(nil);
            InsertSmet.Database := CFDatabase;
            InsertSmet.Transaction := WriteTr;

            for i := 0 to frm.cxGridSmetTableView.DataController.RecordCount - 1 do
            begin
                InsertSmet.StoredProcName := 'UP_DT_COMAND_PLAN_SMET_BUFF_INS';
                InsertSmet.Prepare;
                InsertSmet.ParamByName('KEY_SESSION').AsInt64 := Session_Key;
                InsertSmet.ParamByName('ID_SMET').AsInt64 := frm.cxGridSmetTableView.DataController.Values[i, 0];
                InsertSmet.ParamByName('PERCENT').AsInt64 := frm.cxGridSmetTableView.DataController.Values[i, 3];
                InsertSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('Id_order_item').AsString);
                try
                    InsertSmet.ExecProc;
                except on E: Exception do
                    begin
                        Showmessage(E.Message);
                        InsertSmet.Transaction.Rollback;
                        break;
                    end;
                end;
            end;
            WriteTr.Commit;

            InsertSmet.Free;
            DeleteSmet.Free;

            GetData;

            if (MainOrderDataSet.RecordCount > 0)
                then
            begin
                SetControls(true);

            end;
        end;
    end;
    frm.Free;
end;

procedure TFormComandFactMain.OkButtonClick(Sender: TObject);
begin
    if Self.ModeEdit in [0, 1]
        then
    begin
        if CheckData
            then
        begin
            if SaveData
                then
            begin
                ShowMessage('Інформація по наказу успішно збережена!');
                if not Local_As_Frame
                    then
                    ModalResult := mrOk
                else
                    SendMessage(OuterHWND, FMAS_MESS_SAVE_ITEM_OK, 0, 0);
            end
            else
            begin
                ShowMessage('Знайдені помилки під час проведення наказу через ядро системи!');
                ShowErrors;
                GetData;
                MainOrderDataSet.Locate('ID_ORDER_ITEM', err_id_order_item, []);
            end
        end
        else
            ShowMessage('Знайдені помилки в інформації по наказу!');
    end
    else
    begin
        ModalResult := mrOk;
    end;
end;

function TFormComandFactMain.CheckData: Boolean;
begin
    //Необходимо проверить на корректность данные в буфферах
    Result := true;
end;

function TFormComandFactMain.SaveData: Boolean;
var
    i: Integer;
    ExistErrors: Boolean;
begin
    ExistErrors := false;
    err_id_order_item := -9999;
    if (MainOrderDataSet.RecordCount > 0)
        then
    begin
        WriteTr.StartTransaction;
        StartHistory(WriteTr);
        MainOrderDataSet.First;

        for i := 0 to MainOrderDataSet.RecordCount - 1 do
        begin
            if AddNewItem(VarAsType(MainOrderDataSet['ID_ORDER_ITEM'], varInt64)) //Сохраняем информацию по пункту
                then
            else
            begin
                err_id_order_item := VarAsType(MainOrderDataSet['ID_ORDER_ITEM'], varInt64);
                GetErrorTexts(VarAsType(MainOrderDataSet['ID_ORDER_ITEM'], varInt64));
                ExistErrors := true;
                Break;
            end;
            MainOrderDataSet.Next;
        end;

        if ExistErrors then
            WriteTr.Rollback
        else
        begin
            WriteTr.Commit;
            if Self.ModeEdit = 0 then
                Self.ModeEdit := 1;
        end;
    end;

    Result := not ExistErrors;
end;

function TFormComandFactMain.AddNewItem(id_item: Int64): Boolean;
var
    AddStru: UP_KERNEL_MODE_STRUCTURE;
begin
    AddStru.AOWNER := self;
    AddStru.ID_ORDER := self.Id_Order;
    AddStru.ID_ORDER_ITEM_IN := id_item;
    //StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
    AddStru.KEY_SESSION := self.Session_Key;
    AddStru.DBHANDLE := CFDatabase.Handle;
    AddStru.TRHANDLE := WriteTr.Handle;
    Result := UpKernelDo(@AddStru);
end;

procedure TFormComandFactMain.CancelButtonClick(Sender: TObject);
begin
    if Local_As_Frame then
        SendMessage(OuterHWND, FMAS_MESS_CLOSE_FRAME, 0, 0)
    else
        Close;

end;

procedure TFormComandFactMain.ShowErrors;
begin

    if not Assigned(ErrorForm)
        then
    begin
        ErrorForm := TfrmGetErrors.Create(self);
    end;
    //Показываем ошибки по пункту
    ErrorForm.ShowModal;
end;

procedure TFormComandFactMain.GetErrorTexts(id_item: int64);
var
    GetErrorTextsDS: TpFibDataSet;
begin
    GetErrorTextsDS := TpFibDataSet.Create(self);
    GetErrorTextsDS.Database := CFDatabase;
    GetErrorTextsDS.Transaction := ReadTr;
    GetErrorTextsDS.SelectSQL.Text := ' SELECT * FROM UP_KER_UTILS_GET_ORDER_ERRORS('
        + IntToStr(self.Session_Key) + ',' + IntToStr(Id_item) + ') ';

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

end.

