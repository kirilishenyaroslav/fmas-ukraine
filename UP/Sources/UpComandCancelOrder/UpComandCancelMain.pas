unit UpComandCancelMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, dxBarExtItems, ExtCtrls,
  ImgList, cxGridTableView, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, Buttons, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxTextEdit, RxMemDs,ibase,pFibStoredProc, AppEvnts, AppStruClasses, UpKernelUnit,
  UpComandCancelEdit, FIBQuery, pFIBQuery, BaseTypes, cxContainer, cxLabel,
  cxDBLabel;

type
  TFormComandCancelMain = class(TForm)
    GridMain: TcxGrid;
    GridMainTableView: TcxGridDBTableView;
    colNum_Item: TcxGridDBColumn;
    colNum_Sub_Item: TcxGridDBColumn;
    colTN: TcxGridDBColumn;
    colFIO: TcxGridDBColumn;
    colName_Post: TcxGridDBColumn;
    colCity: TcxGridDBColumn;
    colSmet: TcxGridDBColumn;
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
    dxBarDockControl1: TdxBarDockControl;
    IL_OrdAcc: TImageList;
    Panel1: TPanel;
    dxBarManager1: TdxBarManager;
    btnAddItem: TdxBarLargeButton;
    btnModifyItem: TdxBarLargeButton;
    btnDeleteItem: TdxBarLargeButton;
    btnInfoItem: TdxBarLargeButton;
    Panel2: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Database: TpFIBDatabase;
    ReadTr: TpFIBTransaction;
    MainDSource: TDataSource;
    MainOrderDataSet: TpFIBDataSet;
    WriteTr: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    StorProc: TpFIBStoredProc;
    ReasonPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cxDBLblNote: TcxDBLabel;
    cxDBLblReason: TcxDBLabel;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure btnAddItemClick(Sender: TObject);
    procedure btnModifyItemClick(Sender: TObject);
    procedure btnInfoItemClick(Sender: TObject);
    procedure btnDeleteItemClick(Sender: TObject);
  private
        ErrorForm : TForm;
        ModeEdit: Integer;
        Edit_Id_Order_Item: Int64;
        Local_As_Frame: Boolean;
        err_id_order_item: Int64;
        Procedure ShowErrors;
        Procedure GetErrorTexts(id_item: int64);
        Procedure CreateBuffInfoByIdItem;
        Procedure GetData;
        Procedure SetControls(bEnable: Boolean);
        Procedure ShowData(Id_Mode: Integer);
        Function CheckData: Boolean;
        Function SaveData: Boolean;
        Function AddNewItem(id_item: Int64): Boolean;
  public
        Session_Key: Int64;
        IdUser: Integer;
        Id_Order: Int64;
        Id_OrderType: Integer;
        Base_NumItem: Integer;
        Base_NumSubItem: Integer;
        OuterHWND: HWND;
    Constructor Create(AOwner: TComponent;
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
    End;

var
  FormComandCancelMain: TFormComandCancelMain;

implementation

uses UpComandCancelShowErrors;

{$R *.dfm}

Constructor TFormComandCancelMain.Create(AOwner: TComponent; Db_Handle: TISC_DB_HANDLE;
    id_order: int64; Id_OrderType: Integer; num_item: Integer;
    num_sub_item: Integer; id_order_item: Variant; mode: integer;
    {ViewKeySession: Variant; }asFrame: Boolean; OuterHWND: Variant);
Begin
    Try
        If asFrame
            Then
            Inherited Create(AOwner)
        Else
            Inherited Create(AOwner);

        Self.OuterHWND := OuterHWND;

        Local_As_Frame := asFrame;

        //если показываем форму как фрейм
        If Self.Local_As_Frame
            Then
        Begin
            Self.BorderStyle := bsNone;
            Self.BorderIcons := [];
            Self.Visible := True;
        End;

        SetControls(False);

        Database.Handle := Db_Handle;
        Database.Open;

        ReadTr.StartTransaction;
        StartHistory(ReadTr);

        Self.Id_OrderType := Id_OrderType;
        Self.Base_NumItem := Num_Item;
        Self.Base_NumSubItem := Num_Sub_Item;
        Self.Id_Order := Id_Order;
        //Self.Only_Save_In_Buff:=0;
        Self.ModeEdit := Mode;

        If (Self.ModeEdit <> 3)
            Then
            Session_Key := Database.Gen_Id('GEN_UP_ID_SESSION', 1)
        Else
        Begin
            {if (only_save_in_buff<>null)
            then Self.only_save_in_buff:=only_save_in_buff;}

            {If (ViewKeySession <> Null)
            Then
                Self.Session_Key := VarAsType(ViewKeySession, varInt64);
             }

            Self.Session_Key := Database.Gen_Id('GEN_UP_ID_SESSION', 1);

            If (Id_Order_Item <> Null)
                Then
                Self.Edit_Id_Order_Item := VarAsType(Id_Order_Item, varInt64);
        End;

        If (Self.ModeEdit In [1, 2]) //Необходимо сгенерить информацию в буфера
        Then
        Begin
            btnAddItem.Enabled := false;
            Self.Edit_Id_Order_Item := VarAsType(Id_Order_Item, varInt64);
            CreateBuffInfoByIdItem;
        End;

        ErrorForm := TfrmGetErrors.Create(self);

        // отображение информации в приказах
        GetData;

        If (MainOrderDataSet.RecordCount > 0)
            Then
        Begin
            SetControls(true);
        End;

        If self.ModeEdit = 2 //then OkButton.Visible:=false;
        Then
        Begin
            SetControls(false);
            btnInfoItem.Enabled := True;
        End;


    Except On E: Exception Do
            Showmessage(E.Message);
    End;

    If OkButton.HandleAllocated
        Then
        SendMessage(OuterHWND, FMAS_MESS_GET_BUTTON_OK, OkButton.Handle, OkButton.Handle);

    If CancelButton.HandleAllocated
        Then
        SendMessage(OuterHWND, FMAS_MESS_GET_BUTTON_OK, CancelButton.Handle, CancelButton.Handle);

End;


Procedure TFormComandCancelMain.SetControls(bEnable: Boolean);
begin
    OkButton.Enabled := bEnable;
    btnModifyItem.Enabled := bEnable;
    btnInfoItem.Enabled := bEnable;
    If (ModeEdit = 1) //редактирование
    Then
        btnDeleteItem.Enabled := False
    Else
        btnDeleteItem.Enabled := bEnable;
end;

Procedure TFormComandCancelMain.CreateBuffInfoByIdItem;
Var
    StoredProc: TpFibStoredProc;
Begin
    //Создаем новый пункт приказа в буфферной таблице
    StoredProc := TpFibStoredProc.Create(Nil);
    StoredProc.Database := Database;
    StoredProc.Transaction := WriteTr;
    WriteTr.StartTransaction;
    StartHistory(WriteTr);
    StoredProc.StoredProcName := 'UP_KER_GET_NEW_ID_ORDER_ITEM_EX';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := Self.Session_Key;
    StoredProc.ParamByName('OLD_ID_ORDER_ITEM').AsInt64 := Self.Edit_Id_Order_Item;
    StoredProc.ExecProc;
    StoredProc.Close;

    Try
        StoredProc.StoredProcName := 'UP_DT_COMAND_PLAN_CREATE_INFO';
        StoredProc.Prepare;
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := Self.Session_Key;
        StoredProc.ParamByName('OLD_ID_ORDER_ITEM').AsInt64 := Self.Edit_Id_Order_Item;
        StoredProc.ExecProc;
    Except On E: Exception Do
        Begin
            Showmessage(E.Message);
            Exit;
        End;
    End;
    WriteTr.Commit;

    SetControls(True);

    StoredProc.Close;
    StoredProc.Free;
End;

Procedure TFormComandCancelMain.GetData;
Var
    IdOrderItem: Int64;
Begin
    IdOrderItem := -1;

    If MainOrderDataSet.Active
        Then
    Begin
        If MainOrderDataSet.RecordCount > 0 Then
            IdOrderItem := StrToInt64(MainOrderDataSet.FieldByName('Id_Order_Item').AsString);
        MainOrderDataSet.Close;
    End
    Else
        IdOrderItem := -1;


    If (self.ModeEdit = 0) //Добавление
    Then
    Begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL(' + IntToStr(self.Session_Key) + ',-1)';
    End;

    If (self.ModeEdit = 1) //Редактирование
    Then
    Begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL(' + IntToStr(self.Session_Key) + ',-1)';
    End;

    If (self.ModeEdit = 2) //Только просмотр
    Then
    Begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL(' + IntToStr(self.Session_Key) + ',-1)';
    End;

    If (self.ModeEdit = 3) //Редактирование на основании id_item и Session_Key
    Then
    Begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL(' + IntToStr(self.Session_Key) + ',' + IntToStr(self.Edit_Id_Order_Item) + ')';
    End;

    MainOrderDataSet.Open;
    MainOrderDataSet.FetchAll;

    MainOrderDataSet.Locate('Id_order_item', IdOrderItem, []);

End;

procedure TFormComandCancelMain.OkButtonClick(Sender: TObject);
Begin
    If Self.ModeEdit In [0, 1]
        Then
    Begin
        If CheckData
            Then
        Begin
            If SaveData
                Then
            Begin
                ShowMessage('Інформація по наказу успішно збережена!');
                If Not Local_As_Frame
                    Then
                    ModalResult := mrOk
                Else
                    SendMessage(OuterHWND, FMAS_MESS_SAVE_ITEM_OK, 0, 0);
            End
            Else
            Begin
                ShowMessage('Знайдені помилки під час проведення наказу через ядро системи!');
                ShowErrors;
                GetData;
                MainOrderDataSet.Locate('ID_ORDER_ITEM', err_id_order_item, []);
            End
        End
        Else
            ShowMessage('Знайдені помилки в інформації по наказу!');
    End
    Else
    Begin
        ModalResult := mrOk;
    End;
End;

Function TFormComandCancelMain.CheckData: Boolean;
begin
    //Необходимо проверить на корректность данные в буфферах
    Result := true;
end;

Function TFormComandCancelMain.SaveData: Boolean;
Var
    i: Integer;
    ExistErrors: Boolean;
Begin
    ExistErrors := false;
    err_id_order_item:= -9999;
    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        WriteTr.StartTransaction;
        StartHistory(WriteTr);
        MainOrderDataSet.First;

        For i := 0 To MainOrderDataSet.RecordCount - 1 Do
        Begin
            If AddNewItem(VarAsType(MainOrderDataSet['ID_ORDER_ITEM'], varInt64)) //Сохраняем информацию по пункту
            Then
            Else
            Begin
                err_id_order_item := VarAsType(MainOrderDataSet['ID_ORDER_ITEM'], varInt64);
                GetErrorTexts(VarAsType(MainOrderDataSet['ID_ORDER_ITEM'],varInt64));
                ExistErrors := true;
                Break;
            End;
            MainOrderDataSet.Next;
        End;

        If ExistErrors Then
            WriteTr.Rollback
        Else
        Begin
            WriteTr.Commit;
            If Self.ModeEdit = 0 Then
                Self.ModeEdit := 1;
        End;
    End;

    Result := Not ExistErrors;
End;

Procedure TFormComandCancelMain.ShowErrors;
Begin

    If Not Assigned(ErrorForm)
        Then
    Begin
        ErrorForm := TfrmGetErrors.Create(self);
    End;
    //Показываем ошибки по пункту
    ErrorForm.ShowModal;
End;

Function TFormComandCancelMain.AddNewItem(id_item: Int64): Boolean;
Var
    AddStru: UP_KERNEL_MODE_STRUCTURE;
Begin
    AddStru.AOWNER := self;
    AddStru.ID_ORDER := self.Id_Order;
    AddStru.ID_ORDER_ITEM_IN := id_item;
    AddStru.KEY_SESSION := self.Session_Key;
    AddStru.DBHANDLE := Database.Handle;
    AddStru.TRHANDLE := WriteTr.Handle;
    Result := UpKernelDo(@AddStru);
End;

Procedure TFormComandCancelMain.GetErrorTexts(id_item: int64);
Var
    GetErrorTextsDS: TpFibDataSet;
Begin
    GetErrorTextsDS := TpFibDataSet.Create(self);
    GetErrorTextsDS.Database := Database;
    GetErrorTextsDS.Transaction := ReadTr;
    GetErrorTextsDS.SelectSQL.Text := ' SELECT * FROM UP_KER_UTILS_GET_ORDER_ERRORS('
        + IntToStr(self.Session_Key) + ',' + IntToStr(Id_item) + ') ';

    GetErrorTextsDS.Open;
    GetErrorTextsDS.FetchAll;

    If (GetErrorTextsDS.RecordCount > 0)
        Then
    Begin
        If Assigned(ErrorForm)
            Then
        Begin
            If TfrmGetErrors(ErrorForm).ErrorTextsMemoryData.Active
                Then
                TfrmGetErrors(ErrorForm).ErrorTextsMemoryData.Close;

            TfrmGetErrors(ErrorForm).ErrorTextsMemoryData.CopyStructure(GetErrorTextsDS);
            TfrmGetErrors(ErrorForm).ErrorTextsMemoryData.LoadFromDataSet(GetErrorTextsDS, GetErrorTextsDS.RecordCount, lmCopy);
        End;
    End;
    GetErrorTextsDS.Close;
    GetErrorTextsDS.Free;
End;

procedure TFormComandCancelMain.CancelButtonClick(Sender: TObject);
Begin
    If Local_As_Frame Then
        SendMessage(OuterHWND, FMAS_MESS_CLOSE_FRAME, 0, 0)
    Else
        Close;
end;

procedure TFormComandCancelMain.btnAddItemClick(Sender: TObject);
Var
    GetId_order_itemSP,InsertPost, InsertCity, InsertSmet: TpFibStoredProc;
    id_order_item: Integer;
    i: Integer;
    f: TfmUpComandCanceledit;
Begin
    f := TfmUpComandCanceledit.Create(Self);
    f.DBHandle := DataBase.Handle;
    f.DB.Handle := DataBase.Handle;
    f.ReadTr.Active := True;

    If f.ShowModal = mrOk Then
    Begin
        WriteTr.StartTransaction;
        GetId_order_itemSP := TpFibStoredProc.Create(Nil);
        GetId_order_itemSP.Database := Database;
        GetId_order_itemSP.Transaction := WriteTr;
        GetId_order_itemSP.StoredProcName := 'UP_KER_GET_NEW_ID_ORDER_ITEM';
        GetId_order_itemSP.Prepare;
        GetId_order_itemSP.ParamByName('KEY_SESSION').AsInt64 := Session_Key;
        GetId_order_itemSP.ParamByName('NOTE').Value := f.cxTextEditNote.Text;
        GetId_order_itemSP.ParamByName('NUM_ITEM').Value := Base_NumItem;
        GetId_order_itemSP.ParamByName('NUM_SUB_ITEM').Value := Base_NumSubItem;
        GetId_order_itemSP.ParamByName('ID_ORDER').AsInt64 := self.Id_Order;
        GetId_order_itemSP.ParamByName('ID_ORDER_TYPE').Value := self.Id_OrderType;
        GetId_order_itemSP.ParamByName('REASON').Value := f.cxTextEditReason.Text;//NULL;

        Try
            GetId_order_itemSP.ExecProc;
        Except On E: Exception Do
            Begin
                ShowMessage(E.Message);
                exit;
            End;
        End;

        id_order_item := GetId_order_itemSP.FieldByName('ID_ITEM').AsInt64;
        self.Base_NumSubItem := self.Base_NumSubItem + 1;
        StorProc.Close;
        StorProc.Transaction.StartTransaction;
        StorProc.StoredProcName := 'UP_DT_COMAND_PLAN_CANCEL_BUFF_I';
        StorProc.Prepare;
        StorProc.ParamByName('KEY_SESSION').AsInt64        := Session_Key;
        StorProc.ParamByName('ID_ORDER_ITEM').AsInt64      := id_order_item;
        StorProc.ParamByName('ID_COMAND_PLAN').asVariant   := f.DSetSelect['ID_COMAND_PLAN'];
        Try
            StorProc.ExecProc;
        Except
            StorProc.Transaction.Rollback;
            exit;
        End;



        WriteTr.Commit;


        GetData;

        If (MainOrderDataSet.RecordCount > 0)
            Then
        Begin
            SetControls(true);

        End;
    End;
    f.free;
End;

procedure TFormComandCancelMain.btnModifyItemClick(Sender: TObject);
begin
    ShowData(1);
end;

Procedure TFormComandCancelMain.ShowData(Id_Mode: Integer);
Var
    f: TfmUpComandCanceledit;
    idx: Integer;
    DeleteSmet, InsertSmet: TpFIBStoredProc;
    i: Integer;
Begin
    f := TfmUpComandCanceledit.Create(Self);
    f.DBHandle := DataBase.Handle;
    f.DB.Handle := DataBase.Handle;
    f.ReadTr.Active := True;
    f.Id_mode := id_mode;
    Try
        {проверить названия полей}
        f.ManEdit.Value := MainOrderDataSet.FieldByName('ID_MAN').AsVariant;
        f.ManEdit.DisplayText := MainOrderDataSet.FieldByName('FIO').AsVariant;
        f.Id_Comand_Plan := MainOrderDataSet.FieldByName('ID_COMAND_PLAN').AsVariant;

       // if(id_mode
        f.DSetSelect.Close;
        f.DSetSelect.SQLs.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_SEL(:ID_COMAND_PLAN_IN)';
        f.DSetSelect.ParamByName('ID_COMAND_PLAN_IN').AsVariant := VarToStr(f.Id_Comand_Plan);
        f.DSetSelect.Open;


        If f.DSetSelect.RecordCount <> 0 Then
        Begin
            f.ComandEdit.Value := f.Id_Comand_Plan;
            f.ComandEdit.DisplayText := '№ ' + f.DSetSelect.fbn('NUM_ORDER').AsString + ' від ' +
                DateToStr(f.DSetSelect.fbn('DATE_ORDER').AsDateTime) + '. Відрядження: ' +
                DateToStr(f.DSetSelect['DATE_BEG']) + ' - ' + DateToStr(f.DSetSelect['DATE_END']) +
                ' на ' + IntToStr(f.DSetSelect['DAYS_COUNT']) + ' днів до ' + f.DSetSelect.fbn('NAME_ORG_FULL').asString;
        End;

        f.cxTextEditReason.Text := MainOrderDataSet.FieldByName('REASON').AsString;
        f.cxTextEditNote.Text := MainOrderDataSet.FieldByName('NOTE').AsString;
    Except On E: Exception Do
        Begin
            ShowMessage(E.Message);
            exit;
        End;
    End;

    If Id_Mode = 1 Then
    begin
        f.OkButton.Enabled := True;
    end;

    If Id_Mode = 2 Then
    begin
        f.OkButton.Enabled := false;
    end;

    If f.ShowModal = mrOk Then
    Begin
        If Id_Mode = 1 Then
        Begin
            StorProc.Close;
            StorProc.Transaction.StartTransaction;
            StorProc.StoredProcName := 'UP_DT_COMAND_PLAN_CANCEL_BUFF_U';
            StorProc.Prepare;
            StorProc.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('Id_order_item').AsString);
            StorProc.ParamByName('KEY_SESSION').AsInt64 := Session_Key;
            StorProc.ParamByName('ID_COMAND_PLAN').AsVariant := f.DSetSelect['ID_COMAND_PLAN'];
            StorProc.ParamByName('REASON').AsString := f.cxTextEditReason.Text;
            StorProc.ParamByName('NOTE').AsString := f.cxTextEditNote.Text;
            Try
                StorProc.ExecProc;

                //id_order_item := StoredProc['ID_ORDER_ITEM'].AsInt64;
            Except On E: Exception Do
                Begin
                    ShowMessage(E.Message);
                    StorProc.Transaction.Rollback;
                    exit;
                End;
            End;


            WriteTr.Commit;

            GetData;

            If (MainOrderDataSet.RecordCount > 0)
                Then
            Begin
                SetControls(true);

            End;
        End;
    End;
    f.Free;
End;

procedure TFormComandCancelMain.btnInfoItemClick(Sender: TObject);
begin
    ShowData(2);
end;

procedure TFormComandCancelMain.btnDeleteItemClick(Sender: TObject);
Var
    DeleteSP: TpFibStoredProc;
Begin
    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        If (agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes)
            Then
        Begin
            DeleteSP := TpFibStoredProc.Create(self);
            DeleteSP.Database := Database;
            DeleteSP.Transaction := WriteTr;
            WriteTr.StartTransaction;
            StartHistory(WriteTr);
            DeleteSP.StoredProcName := 'UP_DT_COMAND_PLAN_BUFF_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('KEY_SESSION').asInt64 := Session_Key;
            DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
            DeleteSP.ExecProc;
            DeleteSP.Close;
            DeleteSP.Free;
            WriteTr.Commit;

            MainOrderDataSet.CacheDelete;
            //CP_GetData;

            If (MainOrderDataSet.RecordCount = 0)
                Then
            Begin
                //CP_SetControls(false);

                OkButton.Enabled := False;
                btnAddItem.Enabled := True;
                btnDeleteItem.Enabled := False;
                btnModifyItem.Enabled := False;
            End;
        End;
    End;
End;

end.
