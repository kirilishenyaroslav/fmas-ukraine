unit UpPochasChangeMain;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet,
    FIBDatabase, pFIBDatabase, ActnList, ImgList, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
    cxGridCustomView, cxGrid, cxClasses, ExtCtrls, dxBar, dxBarExtItems,
    StdCtrls, Buttons, iBase, UpKernelUnit, AppEvnts, AppStruClasses, pFibStoredProc,
    UpPochasChangeErrors, cxTextEdit, RxMemDs, cxMemo, FIBQuery, pFIBQuery,
    cxGridBandedTableView, cxGridCardView, cxGridDBCardView, cxPC, cxSplitter;

type
    TFormPochasChangeMain = class(TForm)
        dxBarManager1: TdxBarManager;
        dxAddButton: TdxBarLargeButton;
        dxModifyButton: TdxBarLargeButton;
        dxDeleteButton: TdxBarLargeButton;
        dxShowButton: TdxBarLargeButton;
        Panel1: TPanel;
        cxGridPochasMain: TcxGrid;
        cxGridPochasMainDBTableView: TcxGridDBTableView;
        cxGridPochasMainDBTableViewID_POCHAS_PLAN: TcxGridDBColumn;
        cxGridPochasMainDBTableViewFIO: TcxGridDBColumn;
        cxGridPochasMainDBTableViewNAME_POST: TcxGridDBColumn;
        cxGridPochasMainDBTableViewNAME_DEPARTMENT: TcxGridDBColumn;
        cxGridPochasMainDBTableViewDBColumn1: TcxGridDBColumn;
        cxGridPochasMainDBTableViewDATE_BEG: TcxGridDBColumn;
        cxGridPochasMainDBTableViewDATE_END: TcxGridDBColumn;
        cxGridPochasMainDBTableViewID_MAN: TcxGridDBColumn;
        cxGridPochasMainDBTableViewID_PCARD: TcxGridDBColumn;
        cxGridPochasMainDBTableViewID_POCHAS_TARIF: TcxGridDBColumn;
        cxGridPochasMainDBTableViewID_POCHAS_TYPE: TcxGridDBColumn;
        cxGridPochasMainDBTableViewID_POCHAS_SMETA: TcxGridDBColumn;
        cxGridPochasMainDBTableViewID_ORDER_ITEM: TcxGridDBColumn;
        cxGridPochasMainDBTableViewID_DEPARTMENT: TcxGridDBColumn;
        cxGridPochasMainDBTableViewID_STATUS: TcxGridDBColumn;
        cxGridPochasMainLevel: TcxGridLevel;
        IL_OrdAcc: TImageList;
        ActionList1: TActionList;
        AddAction: TAction;
        ModifyAction: TAction;
        DeleteAction: TAction;
        ShowAction: TAction;
        DB: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        MainDataSet: TpFIBDataSet;
        MainDataSource: TDataSource;
        CancelButton: TBitBtn;
        OkButton: TBitBtn;
        cxGridPochasMainDBTableViewTYPE_POCHAS: TcxGridDBColumn;
        StorProc: TpFIBStoredProc;
        PanelDetail: TPanel;
        cxSplitter1: TcxSplitter;
        cxPageControl1: TcxPageControl;
        cxTabSheet1: TcxTabSheet;
        cxTabSheet2: TcxTabSheet;
        cxGrid1Level1: TcxGridLevel;
        cxGrid1: TcxGrid;
        cxGrid1DBCardView1: TcxGridDBCardView;
        cxGrid1DBCardView1DBCardViewRow1: TcxGridDBCardViewRow;
        cxGrid1DBCardView1DBCardViewRow2: TcxGridDBCardViewRow;
        cxGrid1DBCardView1DBCardViewRow3: TcxGridDBCardViewRow;
        cxGrid1DBCardView1DBCardViewRow4: TcxGridDBCardViewRow;
        cxGrid1DBCardView1DBCardViewRow5: TcxGridDBCardViewRow;
        cxGrid1DBCardView1DBCardViewRow6: TcxGridDBCardViewRow;
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
        cxStyle29: TcxStyle;
        cxStyle30: TcxStyle;
        cxStyle31: TcxStyle;
        cxStyle32: TcxStyle;
        cxStyle33: TcxStyle;
        cxStyle34: TcxStyle;
        cxStyle35: TcxStyle;
        cxStyle36: TcxStyle;
        cxStyle37: TcxStyle;
        cxStyle38: TcxStyle;
        cxStyle39: TcxStyle;
        cxStyle40: TcxStyle;
        cxStyle41: TcxStyle;
        cxStyle42: TcxStyle;
        cxStyle43: TcxStyle;
        cxStyle44: TcxStyle;
        cxStyle45: TcxStyle;
        cxStyle46: TcxStyle;
        cxStyle47: TcxStyle;
        cxStyle48: TcxStyle;
        cxStyle49: TcxStyle;
        cxStyle50: TcxStyle;
        cxStyle51: TcxStyle;
        cxStyle52: TcxStyle;
        cxStyle53: TcxStyle;
        cxStyle54: TcxStyle;
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
        GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
        cxGrid1DBCardView1DBCardViewRow7: TcxGridDBCardViewRow;
        DataSetInfo: TpFIBDataSet;
        DataSourceInfo: TDataSource;
        cxGridSmetNewLevel1: TcxGridLevel;
        cxGridSmetNew: TcxGrid;
        cxGridSmetNewDBTableView1: TcxGridDBTableView;
        colSmeta: TcxGridDBColumn;
        colHours: TcxGridDBColumn;
        colTarif: TcxGridDBColumn;
        colDate_Beg: TcxGridDBColumn;
        colDate_End: TcxGridDBColumn;
        cxGridSmetOld: TcxGrid;
        cxGridDBTableView1: TcxGridDBTableView;
        colSmetaOld: TcxGridDBColumn;
        colHoursOld: TcxGridDBColumn;
        colTarifOld: TcxGridDBColumn;
        colDateBegOld: TcxGridDBColumn;
        colDateEndOld: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
        DSetSmetOld: TpFIBDataSet;
        DSetSmetNew: TpFIBDataSet;
        DSSmetOld: TDataSource;
        DSSmetNew: TDataSource;
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure AddActionExecute(Sender: TObject);
        procedure ShowActionExecute(Sender: TObject);
        procedure ModifyActionExecute(Sender: TObject);
        procedure cxGridPochasMainDBTableViewKeyDown(Sender: TObject;
            var Key: Word; Shift: TShiftState);
        procedure cxTabSheet2Resize(Sender: TObject);
        procedure DeleteActionExecute(Sender: TObject);
        procedure cxGrid1Resize(Sender: TObject);
        procedure cxGridPochasMainDBTableViewDblClick(Sender: TObject);
    private
        ErrorForm: TForm;
        EditMode: Integer;
        EditIdOrderItem: Int64;
        LocalAsFrame: Boolean;
        NumOrd: Integer;
        ErrIdOrderItem: Int64;
        procedure CreateBuffInfoByIdItem;
        procedure GetData;
        procedure GetErrorTexts(id_item: int64);
        procedure SetControls(bEnable: Boolean);
        procedure ShowData(Id_mode: Integer);
        procedure ShowErrors;
        function AddNewItem(id_item: Int64): Boolean;
        function CheckData: Boolean;
        function SaveData: Boolean;
        procedure SelectAll(IdPochasPlan: Integer);
    public
    { Public declarations }
        KeySession: Int64;
        IdUser: Integer;
        IdOrder: Int64;
        IdOrderType: Integer;
        BaseNumItem: Integer;
        BaseNumSubItem: Integer;
        OuterHWND: HWND;
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
    FormPochasChangeMain: TFormPochasChangeMain;

implementation

uses UpPochasChangeManInfo, UpPochasChangeEdit, cxCalendar;

{$R *.dfm}

constructor TFormPochasChangeMain.Create(AOwner: TComponent;
    Db_Handle: TISC_DB_HANDLE;
    id_order: int64;
    id_order_type: Integer;
    num_item: Integer;
    num_sub_item: Integer;
    id_order_item: Variant;
    mode: integer;
            {ViewKeySession: Variant;}
    asFrame: Boolean;
    Outer_HWND: Variant);
begin
    if asFrame
        then
        inherited Create(AOwner)
    else
        inherited Create(AOwner);

    OuterHWND := Outer_HWND;

    LocalAsFrame := asFrame;

    //если показываем форму как фрейм
    if LocalAsFrame
        then
    begin
        Self.BorderStyle := bsNone;
        Self.BorderIcons := [];
        Self.Visible := True;
    end;

    SetControls(False);

    DB.Handle := Db_Handle;
    DB.Open;

    ReadTransaction.StartTransaction;
    StartHistory(ReadTransaction);

    IdOrderType := Id_Order_Type;
    BaseNumItem := Num_Item;
    BaseNumSubItem := Num_Sub_Item;
    IdOrder := Id_Order;
    //Self.Only_Save_In_Buff:=0;
    EditMode := Mode;

    if (EditMode <> 3)
        then
        KeySession := DB.Gen_Id('GEN_UP_ID_SESSION', 1)
    else
    begin
        KeySession := DB.Gen_Id('GEN_UP_ID_SESSION', 1);

        if (Id_Order_Item <> Null)
            then
            EditIdOrderItem := VarAsType(Id_Order_Item, varInt64);
    end;

    if (EditMode in [1, 2]) //Необходимо сгенерить информацию в буфера
        then
    begin
        EditIdOrderItem := VarAsType(Id_Order_Item, varInt64);

        CreateBuffInfoByIdItem;
    end;

    ErrorForm := TfrmGetErrors.Create(self);

    // отображение информации в приказах
    GetData;

    if (MainDataSet.RecordCount > 0)
        then
    begin
        SetControls(true);
    end;

    if EditMode = 0
        then
    begin
        SetControls(false);
        dxAddButton.Enabled := True;
    end;

    if EditMode = 2 //then OkButton.Visible:=false;
        then
    begin
        SetControls(false);
        dxShowButton.Enabled := True;
    end;

    if OkButton.HandleAllocated
        then
        SendMessage(OuterHWND, FMAS_MESS_GET_BUTTON_OK, OkButton.Handle, OkButton.Handle);

    if CancelButton.HandleAllocated
        then
        SendMessage(OuterHWND, FMAS_MESS_GET_BUTTON_OK, CancelButton.Handle, CancelButton.Handle);
end;

procedure TFormPochasChangeMain.CreateBuffInfoByIdItem;
var
    StoredProc: TpFibStoredProc;
begin
    //Создаем новый пункт приказа в буфферной таблице
    StoredProc := TpFibStoredProc.Create(nil);
    StoredProc.Database := DB;
    StoredProc.Transaction := WriteTransaction;
    WriteTransaction.StartTransaction;
    // StartHistory(WriteTransaction);

    StoredProc.StoredProcName := 'UP_KER_GET_NEW_ID_ORDER_ITEM_EX';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := Self.KeySession;
    StoredProc.ParamByName('OLD_ID_ORDER_ITEM').AsInt64 := Self.EditIdOrderItem;
    StoredProc.ExecProc;
    StoredProc.Close;

    try
       {// нужна процедура}StoredProc.StoredProcName := 'UP_DT_POCHAS_PLAN_CREATE_INFO';
        StoredProc.Prepare;
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := Self.KeySession;
        StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := Self.EditIdOrderItem;
        StoredProc.ExecProc;
    except on E: EXCEPTION do
        begin
            SHOWMESSAGE(E.Message);
            EXIT;
        end;
    end;
    WriteTransaction.Commit;

    StoredProc.Close;
    StoredProc.Free;
end;

procedure TFormPochasChangeMain.GetData;
var
    IdOrderItem: Int64;
begin
    IdOrderItem := -1;

    if MainDataSet.Active
        then
    begin
        if MainDataSet.RecordCount > 0 then
            IdOrderItem := StrToInt64(MainDataSet.FieldByName('Id_order_item').AsString);
        MainDataSet.Close;
    end
    else
        IdOrderItem := -1;

    if (self.EditMode = 0) //Добавление
        then
    begin
        MainDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_POCHAS_PLAN_BUFF_SEL(' + IntToStr(self.KeySession) + ',-1)';
    end;

    if (self.EditMode = 1) //Редактирование
        then
    begin
        MainDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_POCHAS_PLAN_BUFF_SEL(' + IntToStr(self.KeySession) + ',-1)';
    end;

    if (self.EditMode = 2) //Только просмотр
        then
    begin
        MainDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_POCHAS_PLAN_BUFF_SEL(' + IntToStr(self.KeySession) + ',-1)';
    end;

    if (self.EditMode = 3) //Редактирование на основании id_item и Key_Session
        then
    begin
        MainDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_POCHAS_PLAN_BUFF_SEL(' + IntToStr(self.KeySession) + ',' + IntToStr(self.EditIdOrderItem) + ')';
    end;

    try
        MainDataSet.Open;
        MainDataSet.FetchAll;

        MainDataSet.Locate('Id_order_item', IdOrderItem, []);

        DSetSmetOld.Close;
        DSetSmetNew.Close;
        DataSetInfo.Close;
        DSetSmetOld.ParamByName('ID_SESSION').AsInt64 := KeySession;
        DSetSmetNew.ParamByName('ID_SESSION').AsInt64 := KeySession;
        DataSetInfo.ParamByName('ID_SESSION').AsInt64 := KeySession;
        DSetSmetOld.Open;
        DSetSmetNew.Open;
        DataSetInfo.Open;
    except
        on E: Exception do
        begin
            ShowMessage(E.Message);
            exit;
        end;
    end;
end;

procedure TFormPochasChangeMain.GetErrorTexts(id_item: int64);
var
    GetErrorTextsDS: TpFibDataSet;
begin
    GetErrorTextsDS := TpFibDataSet.Create(self);
    GetErrorTextsDS.Database := DB;
    GetErrorTextsDS.Transaction := ReadTransaction;
    GetErrorTextsDS.SelectSQL.Text := ' SELECT * FROM UP_KER_UTILS_GET_ORDER_ERRORS('
        + IntToStr(self.KeySession) + ',' + IntToStr(Id_item) + ') ';

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

procedure TFormPochasChangeMain.SetControls(bEnable: Boolean);
begin
    OkButton.Enabled := bEnable;
    dxAddButton.Enabled := bEnable;
    dxModifyButton.Enabled := bEnable;
    if (EditMode = 1) //редактирование
        then
        dxDeleteButton.Enabled := False
    else
        dxDeleteButton.Enabled := bEnable;
    dxShowButton.Enabled := bEnable;

end;

procedure TFormPochasChangeMain.ShowErrors;
begin
    if not Assigned(ErrorForm)
        then
    begin
        ErrorForm := TfrmGetErrors.Create(self);
    end;
    //Показываем ошибки по пункту
    ErrorForm.ShowModal;
end;

function TFormPochasChangeMain.AddNewItem(id_item: Int64): Boolean;
var
    AddStru: UP_KERNEL_MODE_STRUCTURE;
begin
    AddStru.AOWNER := self;
    AddStru.ID_ORDER := self.IdOrder;
    AddStru.ID_ORDER_ITEM_IN := id_item;
    //StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
    AddStru.KEY_SESSION := self.KeySession;
    AddStru.DBHANDLE := DB.Handle;
    AddStru.TRHANDLE := WriteTransaction.Handle;
    Result := UpKernelDo(@AddStru);
end;

function TFormPochasChangeMain.CheckData: Boolean;
begin
    // Может потом пригодится
    Result := True;
end;

function TFormPochasChangeMain.SaveData: Boolean;
var
    i: Integer;
    ExistErrors: Boolean;
begin
    try
        ExistErrors := false;
        ErrIdOrderItem := -9999;

        if (MainDataSet.RecordCount > 0)
            then
        begin
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            MainDataSet.First;

            for i := 0 to MainDataSet.RecordCount - 1 do
            begin
                if AddNewItem(VarAsType(MainDataSet['ID_ORDER_ITEM'], varInt64)) //Сохраняем информацию по пункту
                    then
                else
                begin
                    ErrIdOrderItem := VarAsType(MainDataSet['ID_ORDER_ITEM'], varInt64);
                    GetErrorTexts(VarAsType(MainDataSet['ID_ORDER_ITEM'], varInt64));
                    ExistErrors := true;
                    Break;
                end;
                MainDataSet.Next;
            end;

            if ExistErrors
                then
                WriteTransaction.Rollback
            else
            begin
                WriteTransaction.Commit;
                if self.EditMode = 0 then
                    self.EditMode := 1;
            end;
        end;

    except on E: Exception do
            showmessage(E.Message);
    end;
    Result := not ExistErrors;
end;

procedure TFormPochasChangeMain.OkButtonClick(Sender: TObject);
begin
    if EditMode in [0, 1]
        then
    begin
        if CheckData
            then
        begin
            if SaveData
                then
            begin
                ShowMessage('Інформація по наказу успішно збережена!');
                if not LocalAsFrame
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
                MainDataSet.Locate('ID_ORDER_ITEM', ErrIdOrderItem, []);
            end
        end
        else
            ShowMessage('Знайдені помилки в інформації по наказу!');
    end
    else
        ModalResult := mrOk;
end;

procedure TFormPochasChangeMain.CancelButtonClick(Sender: TObject);
begin
    if LocalAsFrame then
        SendMessage(OuterHWND, FMAS_MESS_CLOSE_FRAME, 0, 0)
    else
        Close;
end;

procedure TFormPochasChangeMain.ShowData(Id_mode: Integer);
var
    frm: TFormPochasChangeEdit;
    id, i: Integer;
begin
    frm := TFormPochasChangeEdit.Create(Self);

    with frm do
    begin
        try
            ManEdit.Value := MainDataSet['ID_MAN'];
            ManEdit.DisplayText := MainDataSet['FIO'];
            DepEdit.Value := MainDataSet['ID_DEPARTMENT'];
            DepEdit.DisplayText := MainDataSet.FieldByName('DEPARTMENT_NAME').AsString;
            PostEdit.Value := MainDataSet['ID_POST'];
            PostEdit.DisplayText := MainDataSet.FieldByName('NAME_POST').AsString;
            TypePochasEdit.Value := MainDataSet['ID_POCHAS_TYPE'];
            TypePochasEdit.DisplayText := MainDataSet.FieldByName('POCHAS_TYPE').AsString;
            //TarifEdit.Value := MainDataSet['ID_TARIF_TYPE'];
            TarifEdit.Value := MainDataSet['ID_POCHAS_TARIF']; //Lukashov
            TarifEdit.DisplayText := MainDataSet.FieldByName('TARIF_TYPE_NAME').AsString;

            cxDateBegEdit.Date := MainDataSet.fbn('DATE_BEG').AsDateTime;
            cxDateEndEdit.Date := MainDataSet.fbn('DATE_END').AsDateTime;
            cxDateChange.Date := MainDataSet.fbn('DATE_CHANGE').AsDateTime;

            DateBegOld := MainDataSet.fbn('DATE_BEG_OLD').AsDateTime;
            DateEndOld := MainDataSet.fbn('DATE_END_OLD').AsDateTime;

            PochasEdit.Value := MainDataSet['ID_POCHAS_PLAN_OLD'];
            PochasEdit.DisplayText := MainDataSet.fbn('STR').AsString;

            ReasonEdit.Value := MainDataSet['REASON'];
            NoteEdit.Value := MainDataSet['NOTE'];

            id_pcard := MainDataSet['ID_PCARD'];
            id_pochas_plan_old := MainDataSet['ID_POCHAS_PLAN_OLD'];
            id := MainDataSet.fbn('ID_ORDER_ITEM').AsInteger;
            ClearSmets;
            SelSmetsByItem(KeySession, Id);
            if (Id_Mode = 2) then ViewMode;
        except on E: Exception do
                Showmessage(E.Message);
        end;
    end;

    if (Id_Mode = 1) then //Изменение
        frm.Caption := 'Змінити ' + frm.Caption
    else frm.Caption := 'Перегляд: ' + frm.Caption;
    frm.ShowModal;

    if frm.ModalResult = mrOk then
    begin
        if (Id_Mode = 1) then //Изменение
        begin
            StorProc.Transaction.StartTransaction;
            StorProc.StoredProcName := 'UP_DT_POCHAS_PLAN_BUFF_U';
            StorProc.Prepare;
            StorProc.ParamByName('KEY_SESSION').AsInt64 := KeySession;
            StorProc.ParamByName('ID_ORDER_ITEM').AsInt64 := Id;
            StorProc.ParamByName('UPDATE_ALL').AsInteger := 0;
            StorProc.ParamByName('DATE_BEG').AsDate := frm.cxDateBegEdit.Date;
            StorProc.ParamByName('DATE_END').AsDate := frm.cxDateEndEdit.Date;
            StorProc.ParamByName('ID_POCHAS_TARIF').AsVariant := frm.TarifEdit.Value;
            StorProc.ParamByName('ID_POCHAS_TYPE').AsVariant := frm.TypePochasEdit.Value;
            StorProc.ParamByName('ID_DEPARTMENT').AsVariant := frm.DepEdit.Value;
            StorProc.ParamByName('NOTE').AsVariant := frm.NoteEdit.Value;
            StorProc.ParamByName('ID_POST').AsVariant := frm.PostEdit.Value;
            StorProc.ParamByName('REASON').AsVariant := frm.ReasonEdit.value;
            StorProc.ParamByName('ID_POCHAS_PLAN_OLD').AsVariant := frm.id_pochas_plan_old;
            StorProc.ParamByName('DATE_CHANGE').AsDate := frm.cxDateChange.Date;
            try
                StorProc.ExecProc;
            except
                StorProc.Transaction.Rollback;
            end;

            StorProc.StoredProcName := 'UP_DT_POCHAS_PLAN_SMET_BUFF_D';
            StorProc.Prepare;
            StorProc.ParamByName('KEY_SESSION').AsInt64 := KeySession;
            StorProc.ParamByName('ID_ORDER_ITEM').AsInt64 := Id;
            StorProc.ParamByName('DO_ALL').AsInteger := 0;
            try
                StorProc.ExecProc;
            except
                StorProc.Transaction.Rollback;
            end;

            for i := 0 to frm.cxGridSmetTableView.DataController.RecordCount - 1 do
            begin
                StorProc.StoredProcName := 'UP_DT_POCHAS_PLAN_SMET_BUFF_I';
                StorProc.Prepare;
                StorProc.ParamByName('ID_SM').AsInt64 := frm.cxGridSmetTableView.DataController.Values[i, 0];
                StorProc.ParamByName('HOURS').AsVariant := frm.cxGridSmetTableView.DataController.Values[i, 5];
                StorProc.ParamByName('KEY_SESSION').AsInt64 := KeySession;
                StorProc.ParamByName('ID_ORDER_ITEM').AsInt64 := Id;
                StorProc.ParamByName('DO_ALL').AsInteger := 0;
                try
                    StorProc.ExecProc;
                except
                    StorProc.Transaction.Rollback;
                    break;
                end;
            end;

            StorProc.StoredProcName := 'UP_DT_POCHAS_PLAN_TARIF_BUFF_D';
            StorProc.Prepare;
            StorProc.ParamByName('KEY_SESSION').AsInt64 := KeySession;
            StorProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id;
            StorProc.ParamByName('DO_ALL').AsInteger := 0;
            try
                StorProc.ExecProc;
            except
                StorProc.Transaction.Rollback;
            end;

            StorProc.StoredProcName := 'UP_DT_POCHAS_PLAN_TARIF_BUFF_I';
            StorProc.Prepare;
            StorProc.ParamByName('ID_POCHAS_TARIF').AsVariant := frm.TarifEdit.Value;
            StorProc.ParamByName('DATE_BEG').AsDate := frm.cxDateBegEdit.Date;
            StorProc.ParamByName('DATE_END').AsDate := frm.cxDateEndEdit.Date;
            StorProc.ParamByName('KEY_SESSION').AsInt64 := KeySession;
            StorProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id;
            StorProc.ParamByName('DO_ALL').AsInteger := 0;
            try
                StorProc.ExecProc;
            except
                StorProc.Transaction.Rollback;
                exit;
            end;

            StorProc.Transaction.Commit;
            MainDataSet.Close;
            MainDataset.Open;
            MainDataset.Locate('ID_ORDER_ITEM', Id, []);
        end;

    end;
    frm.Free;
    GetData;
end;

procedure TFormPochasChangeMain.AddActionExecute(Sender: TObject);
var
    frm: TFormPochasChangeEdit;
    GetId_order_itemSP: TpFibStoredProc;
    InsertSmet: TpFibStoredProc;
    id_order_item: Integer;
    i: Integer;
    Present: TDateTime;
    Year, Month, Day: Word;
begin
    frm := TFormPochasChangeEdit.Create(Self);
    frm.Caption := 'Додати ' + frm.Caption;
    frm.PochasEdit.Blocked := True;
    frm.DepEdit.Blocked := True;
    frm.PostEdit.Blocked := True;
    frm.TypePochasEdit.Blocked := True;
    frm.TarifEdit.Blocked := True;
    frm.btnAddSmet.Enabled := False;
    frm.btnEditSmet.Enabled := False;
    frm.btnDelSmet.Enabled := False;
    {ставим даты - текущий учебный год}
    Present := Now;
    DecodeDate(Present, Year, Month, Day);
    if Month <= 8 then Year := Year - 1;
    frm.cxDateBegEdit.EditValue := EncodeDate(Year, 9, 1);
    frm.cxDateEndEdit.EditValue := EncodeDate(Year + 1, 8, 31);
    frm.cxDateChange.EditValue := Present;
    frm.ShowModal;

    if (frm.ModalResult = mrOk) then
    begin

        StorProc.Close;
        StorProc.Transaction.StartTransaction;

        StorProc.StoredProcName := 'UP_DT_POCHAS_PLAN_BUFF_I';
        StorProc.Prepare;
        StorProc.ParamByName('KEY_SESSION').AsInt64 := KeySession;
        StorProc.ParamByName('DATE_BEG').AsDate := frm.cxDateBegEdit.Date;
        StorProc.ParamByName('DATE_END').AsDate := frm.cxDateEndEdit.Date;
        StorProc.ParamByName('ID_MAN').AsVariant := frm.ManEdit.Value;
        StorProc.ParamByName('ID_PCARD').AsVariant := frm.Id_Pcard;
        StorProc.ParamByName('ID_POCHAS_TARIF').AsVariant := frm.TarifEdit.Value;
        StorProc.ParamByName('ID_POCHAS_TYPE').AsVariant := frm.TypePochasEdit.Value;
        StorProc.ParamByName('ID_DEPARTMENT').AsVariant := frm.DepEdit.Value;
        StorProc.ParamByName('ID_STATUS').AsVariant := null;
        StorProc.ParamByName('FROM_FILTER').AsVariant := 0;
        StorProc.ParamByName('REASON').AsVariant := frm.ReasonEdit.Value;
        StorProc.ParamByName('NOTE').AsVariant := frm.NoteEdit.Value;
        StorProc.ParamByName('ID_ORDER').AsInt64 := IdOrder;
        StorProc.ParamByName('ID_ORDER_TYPE').AsInt64 := IdOrderType;
        StorProc.ParamByName('NUM_ITEM').AsInteger := BaseNumItem;
        StorProc.ParamByName('NUM_SUBITEM').AsInteger := BaseNumSubItem;
        StorProc.ParamByName('ID_POST').AsVariant := frm.PostEdit.Value;
        StorProc.ParamByName('ID_POCHAS_PLAN_OLD').AsVariant := frm.id_pochas_plan_old;
        StorProc.ParamByName('DATE_CHANGE').AsDate := frm.cxDateChange.Date;
        Id_order_item := -1;

        try
            StorProc.ExecProc;
            Id_order_item := StorProc.FieldByName('ID_ORDER_ITEM').AsInt64;
            BaseNumSubItem := BaseNumSubItem + 1;
        except
            on E: Exception do
            begin
                ShowMessage(E.Message);
                StorProc.Transaction.Rollback;
                exit;
            end;
        end;

        InsertSmet := TpFibStoredProc.Create(nil);
        InsertSmet.Database := DB;
        InsertSmet.Transaction := WriteTransaction;

        for i := 0 to frm.cxGridSmetTableView.DataController.Recordcount - 1 do
        begin
            InsertSmet.StoredProcName := 'UP_DT_POCHAS_PLAN_SMET_BUFF_I';
            InsertSmet.Prepare;
            InsertSmet.ParamByName('ID_SM').AsInt64 := frm.cxGridSmetTableView.DataController.Values[i, 0];
            InsertSmet.ParamByName('HOURS').AsVariant := frm.cxGridSmetTableView.DataController.Values[i, 5];
            InsertSmet.ParamByName('KEY_SESSION').AsInt64 := KeySession;
            InsertSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := Id_Order_Item;
            InsertSmet.ParamByName('DO_ALL').AsInteger := 0;
            try
                InsertSmet.ExecProc;
            except
                on E: Exception do
                begin
                    ShowMessage(E.Message);
                    InsertSmet.Transaction.Rollback;
                    break;
                end;
            end;
        end;

        InsertSmet.StoredProcName := 'UP_DT_POCHAS_PLAN_TARIF_BUFF_I';
        InsertSmet.Prepare;
        InsertSmet.ParamByName('ID_POCHAS_TARIF').AsVariant := frm.TarifEdit.Value;
        InsertSmet.ParamByName('DATE_BEG').AsDate := frm.cxDateBegEdit.Date;
        InsertSmet.ParamByName('DATE_END').AsDate := frm.cxDateEndEdit.Date;
        InsertSmet.ParamByName('KEY_SESSION').AsInt64 := KeySession;
        InsertSmet.ParamByName('ID_ORDER_ITEM').AsInt64 := id_order_item;
        InsertSmet.ParamByName('DO_ALL').AsInteger := 0;
        try
            InsertSmet.ExecProc;
        except
            on E: Exception do
            begin
                ShowMessage(E.Message);
                InsertSmet.Transaction.Rollback;
                exit;
            end;
        end;

        WriteTransaction.Commit;
    end;
    InsertSmet.Free;

    GetData;
    //SelectAll(-1);
    if MainDataSet.RecordCount > 0 then
        SetControls(True);
end;

procedure TFormPochasChangeMain.ShowActionExecute(Sender: TObject);
var
    id_pochas_plan: int64;
begin
    ShowData(2);
end;

procedure TFormPochasChangeMain.ModifyActionExecute(Sender: TObject);
var
    id_pochas_plan: int64;
begin
    ShowData(1);
end;

procedure TFormPochasChangeMain.cxGridPochasMainDBTableViewKeyDown(
    Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then
    begin
        ShowInfo(MainDataSet);
    end;
end;

procedure TFormPochasChangeMain.cxTabSheet2Resize(Sender: TObject);
begin
    cxGridSmetOld.Width := cxTabSheet2.Width div 2;
end;

procedure TFormPochasChangeMain.SelectAll(IdPochasPlan: Integer);
begin

end;

procedure TFormPochasChangeMain.DeleteActionExecute(Sender: TObject);
begin
    if MainDataSet.RecordCount = 0 then exit;
    StorProc.StoredProcName := 'Up_Dt_Pochas_Plan_Buff_Del';
    StorProc.Transaction.StartTransaction;
    StorProc.Prepare;
    StorProc.ParamByName('ID_ORDER_ITEM').AsInt64 := MainDataSet.fbn('ID_ORDER_ITEM').AsInteger;
    StorProc.ParamByName('KEY_SESSION').AsInt64 := KeySession;
    try
        StorProc.ExecProc;
    except
        StorProc.Transaction.Rollback;
        exit;
    end;
    StorProc.Transaction.Commit;
    GetData;
end;

procedure TFormPochasChangeMain.cxGrid1Resize(Sender: TObject);
begin
    cxGrid1DBCardView1.OptionsView.CardWidth := cxGrid1.ClientWidth div 2 - 16;
end;

procedure TFormPochasChangeMain.cxGridPochasMainDBTableViewDblClick(
    Sender: TObject);
begin
    if EditMode = 2 then
        ShowData(2)
    else ShowData(1);
end;

end.

