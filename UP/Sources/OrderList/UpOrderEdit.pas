unit UpOrderEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFormControl, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView,
    FIBDataSet, pFIBDataSet, IBCustomDataSet, IBQuery, DBCtrls, StdCtrls,
    cxTextEdit, cxLabel, cxContainer, cxDBLabel, cxGridLevel,
    cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
    cxGridCustomView, cxGrid, Buttons, ComCtrls, ActnList,
    ExtCtrls, AccMgmt, UpSignersFrame, Menus, ImgList, ToolWin, pFibStoredProc,
    cxSplitter, OleCtrls, SHDocVw, HTTPApp, HTTPProd, AppStruClasses,
    dxBar, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxButtonEdit,
    cxCheckBox, cxSpinEdit, cxTimeEdit, FIBDatabase, pFIBDatabase, Ibase,
    FIBQuery, pFIBQuery, AppEvnts, WinSock, Kernel, cxPropertiesStore,
    mshtml, UpShablonText;

type
    TUpEditOrder = class(TForm)
        ActionList1: TActionList;
        Cancel: TAction;
        Ok: TAction;
        EditPageControl: TPageControl;
        HeaderSheet: TTabSheet;
        ItemsSheet: TTabSheet;
        OrderItems: TpFIBDataSet;
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
        ItemsDataSource: TDataSource;
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
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        IL_Orders: TImageList;
        PopupMenu1: TPopupMenu;
        N1: TMenuItem;
        N2: TMenuItem;
        PageControl1: TPageControl;
        TabSheet1: TTabSheet;
        TabSheet2: TTabSheet;
        ToolBar1: TToolBar;
        ToolButton1: TToolButton;
        ToolButton2: TToolButton;
        ToolButton3: TToolButton;
        Panel1: TPanel;
        ItemsGrid: TcxGrid;
        ItemsView: TcxGridDBTableView;
        cxGridDBColumn5: TcxGridDBColumn;
        cxGridDBColumn6: TcxGridDBColumn;
        cxGridDBColumn7: TcxGridDBColumn;
        cxGridLevel6: TcxGridLevel;
        PeoplePanel: TPanel;
        RefreshButton: TToolButton;
        cxSplitter1: TcxSplitter;
        ItemsViewDBColumn1: TcxGridDBColumn;
        ItemsViewDBColumn2: TcxGridDBColumn;
        ToolButton4: TToolButton;
        ToolButton5: TToolButton;
        InsertAction: TAction;
        UpdateAction: TAction;
        ViewAction: TAction;
        DeleteAction: TAction;
        ShowBody: TcxCheckBox;
        CheckBox1: TcxCheckBox;
        CheckBox2: TcxCheckBox;
        WorkDatabase: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        WebBrowser1: TWebBrowser;
        PageProducer1: TPageProducer;
        SignTypes: TpFIBDataSet;
        ApplicationEvents1: TApplicationEvents;
        BlockTransaction: TpFIBTransaction;
        DO_RENUM: TcxCheckBox;
        ToolButton6: TToolButton;
        PageControl2: TPageControl;
        TabSheet4: TTabSheet;
        ReestrAttrSheet: TTabSheet;
        Label1: TLabel;
        NumOrderKadr: TcxTextEdit;
        BitBtn1: TBitBtn;
        Label2: TLabel;
        DateOrderKadr: TcxDateEdit;
        Label5: TLabel;
        NoteValue: TcxTextEdit;
        Label6: TLabel;
        PrintName: TcxTextEdit;
        Label7: TLabel;
        Maker: TcxTextEdit;
        IspolnitelPost: TcxTextEdit;
        SpeedButton1: TSpeedButton;
        SpeedButton2: TSpeedButton;
        Label8: TLabel;
        Intro: TcxMemo;
        SpeedButton3: TSpeedButton;
        Label9: TLabel;
        OwnerUserControl: TcxButtonEdit;
        OkButton: TBitBtn;
        Label3: TLabel;
        NumOrder: TcxTextEdit;
        Label4: TLabel;
        DateOrder: TcxDateEdit;
        BitBtn2: TBitBtn;
        BitBtn3: TBitBtn;
        ToolButton7: TToolButton;
        cxPropertiesStore1: TcxPropertiesStore;
        Action1: TAction;
        cxchckbx1: TcxCheckBox;
        btnErrorsButton: TToolButton;
        Panel3: TPanel;
        Label10: TLabel;
        SearchEdit: TEdit;
        cxgrdbclmnItemsViewDBColumn3: TcxGridDBColumn;
        ShowPost: TcxCheckBox;
        ItemsViewDBPost: TcxGridDBColumn;
        procedure TabVisible(TabVisible: boolean);
        procedure OwnerUserControlOpenSprav(Sender: TObject;
            var Value: Variant; var DisplayText: string);
        procedure EditPageControlChange(Sender: TObject);
        procedure SpeedButton2Click(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        procedure SpeedButton3Click(Sender: TObject);
        procedure ToolButton1Click(Sender: TObject);
        procedure ToolButton2Click(Sender: TObject);
        procedure CheckBox1Click(Sender: TObject);
        procedure CheckBox2Click(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure RefreshButtonClick(Sender: TObject);
        procedure N1Click(Sender: TObject);
        procedure PageControl1Change(Sender: TObject);
        procedure ToolButton3Click(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure ItemsViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
            APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
            ANewItemRecordFocusingChanged: Boolean);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure ToolButton4Click(Sender: TObject);
        procedure ToolButton5Click(Sender: TObject);
        procedure BitBtn1Click(Sender: TObject);
        procedure ItemsViewDblClick(Sender: TObject);
        procedure ToolBar1Resize(Sender: TObject);
        procedure ShowBodyPropertiesChange(Sender: TObject);
        procedure ItemsViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure CheckBox1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure CheckBox2KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure ApplicationEvents1ShortCut(var Msg: TWMKey;
            var Handled: Boolean);
        procedure CancelExecute(Sender: TObject);
        procedure N2Click(Sender: TObject);
        procedure ToolButton6Click(Sender: TObject);
        procedure ToolButton7Click(Sender: TObject);
        procedure OwnerUserControlPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure Action1Execute(Sender: TObject);
        procedure BitBtn3Click(Sender: TObject);
        procedure cxchckbx1PropertiesChange(Sender: TObject);
        procedure btnErrorsButtonClick(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure ItemsViewDBColumn1PropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure ShowPostPropertiesChange(Sender: TObject);
        function CheckActionIdUser(id_order_type: integer): Boolean;
        procedure TabSheet4Show(Sender: TObject);
    private
        old_DATE_ORDER: Variant;
        old_DATE_PROJECT: Variant;
        old_NUM_PROJECT: Variant;
        old_NUM_ORDER: Variant;
        old_NOTE: Variant;
        old_PRINT_NAME: Variant;
        old_PREAMBLE: Variant;
        old_PRINT_CREATOR: Variant;
        old_PRINT_CREATOR_POST: Variant;
        ask_delete_empty_order: Boolean;
        id_owner: Int64;
        tmpdir: string;
        TabsViewed: Boolean;
        Modules: array of TUP_SignersFrame;
        ModTypes: array of Int64;
        FMode: TFormMode;
        FDBHandle: TISC_DB_HANDLE;
        FNumProject: string;
    public
        ORDER_RECORD: RECORD_INFO_STRUCTURE;
        BlockResult: RESULT_STRUCTURE;
        Id_Order: Int64;
        CurFrameOkButtonHandle: THandle;
        VisibleFrame: TFrame;
        CurFrameCancelButtonHandle: THandle;
        CurItemInfoWasChanged: Boolean;
        OwnerUser: Int64;
        Is_new_order: Integer;
        procedure onFMAS_MESS_CLOSE_FRAME(var Msg: TMessage); message FMAS_MESS_CLOSE_FRAME;
        procedure onFMAS_MESS_SAVE_ITEM_OK(var Msg: TMessage); message FMAS_MESS_SAVE_ITEM_OK;
        procedure onFMAS_MESS_SAVE_ITEM_ERR(var Msg: TMessage); message FMAS_MESS_SAVE_ITEM_ERR;
        procedure onFMAS_MESS_GET_BUTTON_OK(var Msg: TMessage); message FMAS_MESS_GET_BUTTON_OK;
        procedure onFMAS_MESS_GET_BUTTON_CANCEL(var Msg: TMessage); message FMAS_MESS_GET_BUTTON_CANCEL;
        procedure onFMAS_MESS_ITEM_INFO_CHANGED(var Msg: TMessage); message FMAS_MESS_ITEM_INFO_CHANGED;
        constructor Create(aOwner: TComponent; aFMode: TFormMode; aId_Order: Int64; DbHandle: TISC_DB_HANDLE); reintroduce;
        procedure ClearTabSheet2Resources;
    end;


implementation
uses uUnivSprav, RxMemDS, Clipbrd, UpOrderAddItem, uCommonSP, uIntControl,
    BaseTypes, Math, UpKernelUnit, HSDialogs, UpItemStru, UEditBody, UpSpSigners;

{$R *.dfm}

function GetNewNumProject(DB_Handle: TISC_DB_HANDLE): string;
var StProc: TpFIBStoredProc;
begin
    Result := '';
    StProc := TpFIBStoredProc.Create(nil);
    with StProc do
    try
        Database := TpFIBDatabase.Create(nil);
        Transaction := TpFIBTransaction.Create(nil);
        Database.DefaultTransaction := Transaction;
        Database.DefaultUpdateTransaction := Transaction;
        Transaction.DefaultDatabase := Database;
        Database.SQLDialect := 3;
        Database.Handle := DB_Handle;
        Transaction.StartTransaction;
        StoredProcName := 'UP_KER_NUM_PROJECT_GENERATE';
        Prepare;
        ExecProc;
        Result := VarToStrDef(ParamByName('NUM_PROJECT').AsVariant, 'NULL');
        Transaction.Commit;
    except
        on E: Exception do
        begin
            agShowMessage(E.Message);
            if Transaction.InTransaction then Transaction.Rollback;
        end;
    end;
end;

function CreateNewOrder(DB_Handle: TISC_DB_HANDLE; NUM_PROJECT: string): int64;
var StProc: TpFIBStoredProc;
begin
    Result := -1;
    StProc := TpFIBStoredProc.Create(nil);
    with StProc do
    try


        Database := TpFIBDatabase.Create(nil);
        Transaction := TpFIBTransaction.Create(nil);
        Database.DefaultTransaction := Transaction;
        Database.DefaultUpdateTransaction := Transaction;
        Transaction.DefaultDatabase := Database;
        Database.SQLDialect := 3;
        Database.Handle := DB_Handle;
        Transaction.StartTransaction;
        StoredProcName := 'UP_DT_ORDERS_INS';
        Prepare;
        ParamByName('NUM_ORDER').Value := Null;
        ParamByName('DATE_ORDER').Value := Null;
        ParamByName('NUM_PROJECT').AsString := NUM_PROJECT;
        ParamByName('DATE_PROJECT').AsDate := Date;
        ParamByName('ID_OWNER').AsInt64 := GetUserId;
        ParamByName('NOTE').AsString := '';
        ParamByName('PRINT_NAME').AsString := '';
        ParamByName('PREAMBLE').AsString := '';
        ParamByName('PRINT_CREATOR').AsString := '';
        ParamByName('PRINT_CREATOR_POST').AsString := '';
        ExecProc;
        Result := ParamByName('ID_ORDER').AsInt64;
        Transaction.Commit;
    except
        on E: Exception do
        begin
            agShowMessage(E.Message);
            if Transaction.InTransaction then Transaction.Rollback;
        end;
    end;
end;

constructor TUpEditOrder.Create(aOwner: TComponent; aFMode: TFormMode; aId_Order: Int64; DbHandle: TISC_DB_HANDLE);
var
    InfoDS: TpFibDataSet;
    CheckSP, UpdateOrderHash: TpFibStoredProc;
    is_Blocked: Integer;
    tv: string;
begin
    inherited Create(aOwner);
    CurItemInfoWasChanged := false;
    PageControl1.ActivePageIndex := 0;
    TabsViewed := False;
    is_Blocked := 0;

    tv := '';
    tv := KYVLoadFromRegistry('TUpEditOrder_ShowPost', GetUserId);
    if (tv = '0') or (tv = '1')
        then begin
        ShowPost.Checked := Boolean(StrToInt(tv));
        ShowPost.Properties.OnChange(Self);
    end;


    FMode := aFMode;

    FDBHandle := DbHandle;
    FNumProject := GetNewNumProject(DbHandle);
    ask_delete_empty_order := false;



  //Форма открыта на добавление нового приказа
    if (aId_Order = -1)
        then begin
        ask_delete_empty_order := true;
        Is_new_order := 1;
        Id_Order := CreateNewOrder(FDBHandle, FNumProject);
        cxPropertiesStore1.Active := True;
    end
    else begin
        self.Id_Order := aId_Order;
        Is_new_order := 0;
    end;

    WorkDatabase.Handle := FDBHandle;

    if (aFMode in [fmModify])
        then
    begin
        try
            UpdateOrderHash := TpFibStoredProc.Create(self);
            UpdateOrderHash.Database := WorkDatabase;
            UpdateOrderHash.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            UpdateOrderHash.StoredProcName := 'UP_DT_ORDERS_UPD_HASH';
            UpdateOrderHash.Prepare;
            UpdateOrderHash.ParamByName('ID_ORDER').AsInt64 := Id_Order;
            UpdateOrderHash.ExecProc;
            UpdateOrderHash.Close;
            WriteTransaction.Commit;
        except on E: Exception do
        end;

    end;

    BlockTransaction.StartTransaction;

    if (aFMode in [fmInfo, fmClone])
        then begin
        aFMode := fmInfo;

        ToolButton2.Caption := 'Перегляд';
        ToolButton2.Style := tbsButton;
        ToolButton2.DropdownMenu := nil;
        ToolButton3.Visible := false;
        ToolButton5.Visible := false;
        ToolButton1.Visible := false;
        OkButton.Visible := false;
        BitBtn3.Visible := false;

        NumOrderKadr.Enabled := false;
        DateOrderKadr.Enabled := false;
        Notevalue.Enabled := false;
        PrintName.Enabled := false;
        SpeedButton1.Enabled := false;
        Maker.Enabled := false;
        SpeedButton2.Enabled := false;
        IspolnitelPost.Enabled := false;
        Intro.Enabled := false;
        SpeedButton3.Enabled := false;
        OwnerUserControl.Enabled := false;

        cxchckbx1.Visible := False;
    end
    else begin


        ORDER_RECORD.DBHANDLE := WorkDatabase.Handle;
        ORDER_RECORD.TRHANDLE := BlockTransaction.Handle;
        ORDER_RECORD.ID_RECORD := VarArrayOf([self.Id_Order]);
        ORDER_RECORD.TABLE_NAME := 'UP_DT_ORDERS';
        ORDER_RECORD.PK_FIELD_NAME := VarArrayOf(['ID_ORDER']);
        ORDER_RECORD.RAISE_FLAG := false;
        BlockResult := Kernel.LockRecord(@ORDER_RECORD);

        if (BlockResult.RESULT_CODE <> 1)
            then begin
            agMessageDlg('Увага!', 'Наказ заблокований на редагування іншим користувачем!', mtWarning, [mbOk]);
            aFMode := fmInfo;

            ToolButton2.Caption := 'Перегляд';
            ToolButton2.Style := tbsButton;
            ToolButton2.DropdownMenu := nil;
            ToolButton3.Visible := false;
            ToolButton5.Visible := false;
            ToolButton1.Visible := false;
            OkButton.Visible := false;
            BitBtn3.Visible := false;

            NumOrderKadr.Enabled := false;
            DateOrderKadr.Enabled := false;
            Notevalue.Enabled := false;
            PrintName.Enabled := false;
            SpeedButton1.Enabled := false;
            Maker.Enabled := false;
            SpeedButton2.Enabled := false;
            IspolnitelPost.Enabled := false;
            Intro.Enabled := false;
            SpeedButton3.Enabled := false;
            OwnerUserControl.Enabled := false;
            is_Blocked := 1;
        end
    end;


    InfoDS := TpFibDataSet.Create(self);
    InfoDS.Database := WorkDatabase;
    InfoDS.Transaction := ReadTransaction;
    InfoDS.SelectSQL.Text := ' select * from UP_DT_ORDERS_SEL_BY_ID(' + IntToStr(Id_Order) + ') ';
    InfoDS.Open;
    InfoDS.FetchAll;
    if (InfoDS.RecordCount > 0)
        then begin
        OwnerUser := GetUserId;
        OwnerUserControl.EditValue := InfoDS.FieldByName('FULL_NAME').Value;
        NumOrder.EditValue := InfoDS.FieldByName('NUM_ORDER').Value;
        NumOrderKadr.EditValue := InfoDS.FieldByName('NUM_PROJECT').Value;
        DateOrderKadr.EditValue := InfoDS.FieldByName('DATE_PROJECT').Value;
        DateOrder.EditValue := InfoDS.FieldByName('DATE_ORDER').Value;
        Notevalue.EditValue := InfoDS.FieldByName('NOTE').Value;
        PrintName.EditValue := InfoDS.FieldByName('PRINT_NAME').Value;
        Maker.EditValue := InfoDS.FieldByName('PRINT_CREATOR').Value;
        id_owner := InfoDS.FieldByName('ID_OWNER').Value;
        IspolnitelPost.EditValue := InfoDS.FieldByName('PRINT_CREATOR_POST').Value;
        Intro.EditValue := InfoDS.FieldByName('PREAMBLE').Value;

        CheckSP := TpFibStoredProc.Create(self);
        CheckSP.Database := WorkDatabase;
        CheckSP.Transaction := ReadTransaction;
        CheckSP.StoredProcName := 'UP_KER_CHECK_REESTR_ATTR_ACCESS';
        CheckSP.Prepare;
        CheckSP.ParamByName('ID_USER').Value := GetUserId;
        CheckSP.ExecProc;
        NumOrder.Enabled := Boolean(CheckSP.ParamByName('IS_EDIT').AsInteger);
        DateOrder.Enabled := Boolean(CheckSP.ParamByName('IS_EDIT').AsInteger);
        BitBtn3.Visible := Boolean(CheckSP.ParamByName('IS_EDIT').AsInteger);
        ReestrAttrSheet.TabVisible := Boolean(CheckSP.ParamByName('IS_VEIW').AsInteger);
        CheckSP.Close;
        CheckSP.Free;


        if (InfoDS.FieldByName('ENABLE_EDIT_PROJECT_NUM').Value = 0)
            then begin
            NumOrderKadr.Enabled := false;
        end;

        old_DATE_ORDER := InfoDS.FieldByName('DATE_ORDER').Value;
        old_DATE_PROJECT := InfoDS.FieldByName('DATE_PROJECT').Value;
        old_NUM_PROJECT := InfoDS.FieldByName('NUM_PROJECT').Value;
        old_NUM_ORDER := InfoDS.FieldByName('NUM_ORDER').Value;
        old_NOTE := InfoDS.FieldByName('NOTE').Value;
        old_PRINT_NAME := InfoDS.FieldByName('PRINT_NAME').Value;
        old_PREAMBLE := InfoDS.FieldByName('PREAMBLE').Value;
        old_PRINT_CREATOR := InfoDS.FieldByName('PRINT_CREATOR').Value;
        old_PRINT_CREATOR_POST := InfoDS.FieldByName('PRINT_CREATOR_POST').Value;

        self.Caption := 'Робота з проектом наказа № ' + old_NUM_PROJECT + ' від ' + DateToStr(TDateTime(old_DATE_PROJECT));

        if (is_Blocked = 0) and not ((aFMode in [fmInfo, fmClone]))
            then begin
            OwnerUserControl.Enabled := (InfoDS.FieldByName('ID_OWNER').Value = GetUserId);
        end;

    end;
    InfoDS.Close;
    InfoDS.Free;

    TabVisible(true);
    RefreshButtonClick(self);
    tmpdir := GetEnvironmentVariable('HOMEDRIVE') + GetEnvironmentVariable('HOMEPATH');
end;

procedure TUpEditOrder.TabVisible(TabVisible: boolean);
var
    TabSheet: TTabSheet;
begin
    ItemsSheet.TabVisible := TabVisible;
    if TabVisible
        then begin
        if (not TabsViewed)
            then begin
            SignTypes.Open;
            SignTypes.First;
            while not SignTypes.Eof do
            begin
                SetLength(Modules, Length(Modules) + 1);
                SetLength(ModTypes, Length(ModTypes) + 1);
                ModTypes[High(ModTypes)] := SignTypes['ID_SIGN_TYPE'];
                Modules[High(Modules)] := nil;
                TabSheet := TTabSheet.Create(Self);
                TabSheet.Caption := SignTypes['type_Name'];
                TabSheet.PageControl := EditPageControl;
                TabSheet.Tag := High(Modules);
                SignTypes.Next;
            end;
            SignTypes.Close;
            TabsViewed := True;
        end;
    end;
end;

procedure TUpEditOrder.OwnerUserControlOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Користувачі системи, які можуть бути власниками наказу';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'USERS';
    Params.Fields := 'FULL_NAME,id_user';
    Params.FieldsName := 'Повне ім`я користувача';
    Params.KeyField := 'ID_USER';
    Params.ReturnFields := 'FULL_NAME,ID_USER';
    Params.DBHandle := Integer(WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then
    begin
        value := output['id_user'];
        DisplayText := VarToStr(output['full_name']);
    end;
end;

procedure TUpEditOrder.EditPageControlChange(Sender: TObject);
var
    ind: Integer;
    SignFrame: TUP_SignersFrame;
begin
    if EditPageControl.ActivePage = nil then Exit;

    if EditPageControl.ActivePage.Tag = -1 then Exit;

    ind := EditPageControl.ActivePage.Tag;
    if Modules[ind] = nil
        then begin
        SignFrame := TUP_SignersFrame.Create(Self, Id_Order, ModTypes[ind], FMode, Is_new_order);
        SignFrame.Name := 'SignFrame' + IntToStr(ind);
        Modules[ind] := SignFrame;

        Modules[ind].Parent := EditPageControl.ActivePage;
        Modules[ind].Align := alClient;
    end;
end;

procedure TUpEditOrder.SpeedButton2Click(Sender: TObject);
var T: TfrmSpSigners;
begin
    T := TfrmSpSigners.Create(Self, 6, WorkDatabase.Handle);
    if T.ShowModal = mrYes
        then begin
        Maker.Text := T.signer_fio;
        IspolnitelPost.Text := T.signer_post;
    end;
    T.Free;
end;

procedure TUpEditOrder.SpeedButton1Click(Sender: TObject);
{var
  Params:TUnivParams;
  OutPut : TRxMemoryData; }
var T: TfrmShablonText;
begin
    T := TfrmShablonText.Create(Self, 7, WorkDatabase.Handle);
    T.Caption := 'Довідник друкованих назв наказу';
    if T.ShowModal = mrYes
        then begin
        PrintName.Text := T.shablon_text;
    end;
    T.Free;
 { Params.FormCaption:='Друкована назва наказу';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbExit];
  Params.TableName:='up_get_text_shablon(7)';
  Params.Fields:='text1,id_shablon';
  Params.FieldsName:='Назва';
  Params.KeyField:='ID_shablon';
  Params.ReturnFields:='text1';
  Params.DBHandle:=Integer(WorkDatabase.Handle);

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut)
   then
   begin
     PrintName.Text:=VarToStr(output['text1']);
   end; }
end;

procedure TUpEditOrder.SpeedButton3Click(Sender: TObject);
var T: TfrmShablonText;
begin
    T := TfrmShablonText.Create(Self, 8, WorkDatabase.Handle);
    T.Caption := 'Довідник вступів до наказу';
    if T.ShowModal = mrYes
        then begin
        Intro.Text := T.shablon_text;
    end;
    T.Free;
{var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Вступ до наказу';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbExit];
  Params.TableName:='up_get_text_shablon(8)';
  Params.Fields:='text1,id_shablon';
  Params.FieldsName:='Текст вступу';
  Params.KeyField:='ID_shablon';
  Params.ReturnFields:='text1';
  Params.DBHandle:=Integer(WorkDatabase.Handle);

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut)
   then
   begin
     Intro.Text:=VarToStr(output['text1']);
   end;  }
end;

procedure TUpEditOrder.ToolButton1Click(Sender: TObject);
var
    Form: TUpOrderAddItemForm;
    sp: TSprav;
begin
    //Запрашиваем тип пункта и номера пункта и подпункта
    Form := TUpOrderAddItemForm.Create(Self, fmAdd, Id_ORder);

    if Form.ShowModal = mrOk
        then begin
        if (FMode <> fmInfo)
            then begin
            if TabSheet2.TabVisible
                then begin
                if agMessageDlg('Увага!', 'Ви зараз вже працюєте з одним із пунктів наказу. Закрити його і відкрити новий?', mtConfirmation, [mbYes, mbNo]) = mrNo
                    then begin
                    PageControl1.ActivePage := TabSheet2;
                    Exit;
                end;
            end;
        end;

        if not (CheckActionIdUser(Form.ItemType.Value)) then
        begin
            agShowMessage('Ви не маєте права додавати цей тип пункту!');
            Exit;
        end;

        if ((Form.BplName.Value <> null) and (VarToStr(Form.BplName.Value) <> '')
            and CheckActionIdUser(Form.ItemType.Value))
            then begin
            sp := GetSprav(Form.BplName.Value);
            if sp <> nil
                then begin
                                    // заполнить входные параметры
                sp.Input.Append;
                sp.Input.FieldValues['DBHandle'] := Integer(WorkDatabase.Handle);
                sp.Input.FieldValues['Id_order'] := Id_order;
                sp.Input.FieldValues['mode'] := 0;
                sp.Input.FieldValues['Id_order_type'] := Form.ItemType.Value;
                sp.Input.FieldValues['Num_item'] := Form.qFIC_NumItem.Value;
                sp.Input.FieldValues['Num_sub_item'] := Form.qFIC_NumSubItem.Value;

                if sp.Input.FindField('outer_hwnd') <> nil
                    then begin
                    sp.Input.FieldValues['outer_hwnd'] := Self.Handle;
                end;

                if sp.Input.FindField('FOwner') <> nil
                    then begin
                    sp.Input.FieldValues['FOwner'] := Integer(TabSheet2);
                end;
                sp.Input.Post;

                ClearTabSheet2Resources;

                if not TabSheet2.TabVisible then TabSheet2.TabVisible := true;
                PageControl1.ActivePage := TabSheet2;

                try
                    VisibleFrame := sp.GetFrame;

                    VisibleFrame.Parent := TabSheet2;
                    VisibleFrame.Align := alClient;

                    TabSheet2.Caption := ' "' + Form.ItemType.DisplayText + '"';
                    PageControl1.ActivePage := TabSheet2;

                except on E: Exception do
                    begin
                        agShowMessage('Помилка при роботі з модулем: ' + VarToStr(Form.ItemType.Value) + #13 +
                            E.message);
                    end;
                end;
            end;
        end
        else agShowMessage('Ядро системи не сконфігуроване для роботи з цим типом наказу!');
    end;
    Form.Free;
end;

procedure TUpEditOrder.ToolButton2Click(Sender: TObject);
var
    sp: TSprav;
begin
    if (not OrderItems.IsEmpty)
        then begin
        if (FMode <> fmInfo)
            then begin
            if TabSheet2.TabVisible
                then begin
                if agMessageDlg('Увага!', 'Ви зараз вже працюєте з одним із пунктів наказу. Закрити його і відкрити новий?', mtConfirmation, [mbYes, mbNo]) = mrNo
                    then begin
                    PageControl1.ActivePage := TabSheet2;
                    Exit;
                end;
            end;
        end;


        if not (CheckActionIdUser(OrderItems['Id_order_type'])) then
        begin
            agShowMessage('Ви не маєте права змінювати цей тип пункту!');
            Exit;
        end;

        if ((OrderItems['bpl_name'] <> null) and (VarToStr(OrderItems['bpl_name']) <> '')
            and (CheckActionIdUser(OrderItems['Id_order_type'])))
            then begin
                       // создать справочник
            sp := GetSprav(OrderItems['bpl_name']);
            if sp <> nil
                then begin
                                  // заполнить входные параметры
                sp.Input.Append;
                sp.Input.FieldValues['DBHandle'] := Integer(WorkDatabase.Handle);
                sp.Input.FieldValues['Id_order'] := Id_order;
                if FMode = fmInfo
                    then sp.Input.FieldValues['mode'] := 2
                else sp.Input.FieldValues['mode'] := 1;
                sp.Input.FieldValues['Id_order_type'] := OrderItems['Id_order_type'];
                sp.Input.FieldValues['Num_item'] := OrderItems['num_item'];
                sp.Input.FieldValues['Num_sub_item'] := OrderItems['num_sub_item'];
                sp.Input.FieldValues['id_item'] := OrderItems['id_item'];

                if sp.Input.FindField('outer_hwnd') <> nil
                    then begin
                    sp.Input.FieldValues['outer_hwnd'] := Self.Handle;
                end;
                if sp.Input.FindField('FOwner') <> nil
                    then begin
                    sp.Input.FieldValues['FOwner'] := Integer(TabSheet2);
                end;
                sp.Input.Post;

                ClearTabSheet2Resources;

                if not TabSheet2.TabVisible then TabSheet2.TabVisible := true;
                PageControl1.ActivePage := TabSheet2;

                try
                    VisibleFrame := sp.GetFrame;

                    VisibleFrame.Parent := TabSheet2;
                    VisibleFrame.Align := alClient;

                    TabSheet2.Caption := 'Пункт № ' + OrderItems.fbn('NUM_ITEM').AsString +
                        '.' + OrderItems.fbn('NUM_SUB_ITEM').AsString +
                        ' "' + OrderItems.fbn('NAME_TYPE').AsString + '" ' + '(Режим редагування)';
                except on E: Exception do
                    begin
                        agShowMessage('Помилка при роботі з модулем: ' + VarToStr(OrderItems['bpl_name']) + #13 +
                            E.message);
                    end;
                end;
            end;
        end
        else agShowMessage('Ядро системи не сконфігуроване для роботи з цим типом наказу!');
    end;
end;

procedure TUpEditOrder.CheckBox1Click(Sender: TObject);
var I: Integer;
begin
    for i := 0 to ItemsView.ColumnCount - 1 do
    begin
        ItemsView.Columns[i].Options.Filtering := CheckBox1.Checked;
    end;
end;

procedure TUpEditOrder.CheckBox2Click(Sender: TObject);
begin
    ItemsView.OptionsView.GroupByBox := CheckBox2.Checked;
end;

procedure TUpEditOrder.FormClose(Sender: TObject;
    var Action: TCloseAction);
var I: Integer;
begin
    for i := 0 to Length(Modules) - 1 do
    begin
        try
            Modules[i].SaveToTmpFile;
        except on E: Exception do
            begin
            end;
        end
    end;

    if BlockTransaction.InTransaction
        then BlockTransaction.Rollback;
    if (ReadTransaction <> nil) and (ReadTransaction.InTransaction)
        then ReadTransaction.Commit;
    Action := caFree;
end;

procedure TUpEditOrder.RefreshButtonClick(Sender: TObject);
var id_order_item: int64;
begin
    try
        id_order_item := -1;

        if OrderItems.Active
            then begin
            if (OrderItems.RecordCount > 0)
                then begin
                id_order_item := StrToInt64(OrderItems.FieldByName('id_item').asString);
            end;
            OrderItems.Close;
        end;
        OrderItems.SelectSQL.Text := 'select * from UP_GET_ORDER_ITEMS(' + IntToStr(self.id_order) + ',' + IntToStr(Integer(cxchckbx1.Checked)) + ')';

        OrderItems.Open;
        if (OrderItems.RecordCount > 0)
            then begin
            OrderItems.Locate('id_item', id_order_item, []);
        end;
    except on Exception do begin end;

    end;
end;

procedure TUpEditOrder.N1Click(Sender: TObject);
var
    sp: TSprav;
begin
    if (not OrderItems.IsEmpty)
        then begin
             // создать справочник
        if (OrderItems['bpl_name'] <> null) and (VarToStr(OrderItems['bpl_name']) <> '')
            then begin
            sp := GetSprav(OrderItems['bpl_name']);
            if sp <> nil
                then begin
                                  // заполнить входные параметры
                sp.Input.Append;
                sp.Input.FieldValues['DBHandle'] := Integer(WorkDatabase.Handle);
                sp.Input.FieldValues['Id_order'] := Id_order;
                sp.Input.FieldValues['mode'] := 1;
                sp.Input.FieldValues['Id_order_type'] := OrderItems['Id_order_type'];
                sp.Input.FieldValues['Num_item'] := OrderItems['num_item'];
                sp.Input.FieldValues['Num_sub_item'] := OrderItems['num_sub_item'];
                sp.Input.FieldValues['id_item'] := OrderItems['id_item'];

                if sp.Input.FindField('outer_hwnd') <> nil
                    then begin
                    sp.Input.FieldValues['outer_hwnd'] := Self.Handle;
                end;
                if sp.Input.FindField('FOwner') <> nil
                    then begin
                    sp.Input.FieldValues['FOwner'] := Integer(TabSheet2);
                end; sp.Input.Post;

                ClearTabSheet2Resources;

                if not TabSheet2.TabVisible then TabSheet2.TabVisible := true;
                PageControl1.ActivePage := TabSheet2;

                try
                    VisibleFrame := sp.GetFrame;

                    VisibleFrame.Parent := TabSheet2;
                    VisibleFrame.Align := alClient;
                    TabSheet2.Caption := 'Пункт № ' + OrderItems.fbn('NAME_TYPE').AsString +
                        '.' + OrderItems.fbn('NAME_TYPE').AsString +
                        ' "' + OrderItems.fbn('NAME_TYPE').AsString + '" ' + '(Режим редагування)';
                except on E: Exception do
                    begin
                        agShowMessage('Помилка при роботі з модулем: ' + VarToStr(OrderItems['bpl_name']) + #13 +
                            E.message);
                    end;
                end;
            end;
        end
        else agShowMessage('Ядро системи не сконфігуроване для роботи з цим типом наказу!');
    end;
end;

procedure TUpEditOrder.PageControl1Change(Sender: TObject);
begin
    if PageControl1.ActivePage = TabSheet1
        then begin
        RefreshButton.OnClick(self);
    end;
end;

procedure TUpEditOrder.ToolButton3Click(Sender: TObject);
var BufferSP: TpFibStoredproc;
begin
     //Удаление одиночного пункта
    if (OrderItems.RecordCount > 0)
        then begin
        if agMessageDlg('Увага!', 'Ви хочете видалити пункт наказу?', mtConfirmation, [mbYes, mbNo]) = mrYes
            then begin
            BufferSP := TpFibStoredproc.Create(self);
            BufferSP.Database := WorkDatabase;
            BufferSP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            BufferSP.StoredProcName := 'UP_KER_SAVE_DROP_ITEM';
            BufferSP.Prepare;
            BufferSP.ParamByName('ID_CANCEL_ORDER_ITEM').asInt64 := StrToInt64(OrderItems.FieldByName('ID_ITEM').AsString);
            BufferSP.ParamByName('DO_RENUM').Value := Integer(DO_RENUM.Checked);
            BufferSP.ExecProc;
            WriteTransaction.Commit;
            OrderItems.CloseOpen(true);

            ItemsViewFocusedRecordChanged(ItemsView,
                ItemsView.Controller.FocusedRecord,
                ItemsView.Controller.FocusedRecord,
                true);
        end;
    end;
end;

procedure TUpEditOrder.OkButtonClick(Sender: TObject);
var UpdateOrderHeaderSP: TpFibStoredProc;
    TmpMessStr: string;
begin
    if (DateOrderKadr.EditValue = null)
        then begin
        HSDialogs.HSShowWarning('Не введено дату проекта!', DateOrderKadr, 0, 0);
        Exit;
    end;

    if BlockTransaction.InTransaction then BlockTransaction.Rollback;

    try
        UpdateOrderHeaderSP := TpFibStoredProc.Create(nil);
        UpdateOrderHeaderSP.Database := WorkDatabase;
        UpdateOrderHeaderSP.Transaction := WriteTransaction;
        UpdateOrderHeaderSP.StoredProcName := 'UP_DT_ORDERS_UPD';
        WriteTransaction.StartTransaction;
        UpdateOrderHeaderSP.Prepare;
        UpdateOrderHeaderSP.ParamByName('ID_ORDER').asInt64 := Id_Order;
        UpdateOrderHeaderSP.ParamByName('DATE_ORDER').Value := DateOrder.EditValue;
        UpdateOrderHeaderSP.ParamByName('DATE_PROJECT').AsDate := DateOrderKadr.EditValue;
        UpdateOrderHeaderSP.ParamByName('NUM_PROJECT').AsString := NumOrderKadr.EditValue;
        UpdateOrderHeaderSP.ParamByName('NUM_ORDER').Value := NumOrder.EditValue;
        UpdateOrderHeaderSP.ParamByName('ID_OWNER').asInt64 := id_owner;
        UpdateOrderHeaderSP.ParamByName('NOTE').AsString := NoteValue.EditValue;
        UpdateOrderHeaderSP.ParamByName('PRINT_NAME').AsString := PrintName.EditValue;
        UpdateOrderHeaderSP.ParamByName('PREAMBLE').AsString := Intro.EditValue;
        UpdateOrderHeaderSP.ParamByName('PRINT_CREATOR').AsString := Maker.EditValue;
        UpdateOrderHeaderSP.ParamByName('PRINT_CREATOR_POST').AsString := IspolnitelPost.EditValue;
        UpdateOrderHeaderSP.ExecProc;
        WriteTransaction.Commit;
        UpdateOrderHeaderSP.Close;
        UpdateOrderHeaderSP.Free;

        old_DATE_ORDER := DateOrder.EditValue;
        old_DATE_PROJECT := DateOrderKadr.EditValue;
        old_NUM_PROJECT := NumOrderKadr.EditValue;
        old_NUM_ORDER := NumOrder.EditValue;
        old_NOTE := NoteValue.EditValue;
        old_PRINT_NAME := PrintName.EditValue;
        old_PREAMBLE := Intro.EditValue;
        old_PRINT_CREATOR := Maker.EditValue;
        old_PRINT_CREATOR_POST := IspolnitelPost.EditValue;


        agMessageDlg('Увага!', 'Інформація по шапці наказу збережена успішно!', mtInformation, [mbOk]);
    except on E: Exception do
        begin
            TmpMessStr := E.Message;
            TmpMessStr := Copy(TmpMessStr, Pos('Н', TmpMessStr), Length(TmpMessStr) - Pos('Н', TmpMessStr));
            agShowMessage(TmpMessStr);
        end;
    end;


    BlockTransaction.StartTransaction;
    ORDER_RECORD.DBHANDLE := WorkDatabase.Handle;
    ORDER_RECORD.TRHANDLE := BlockTransaction.Handle;
    ORDER_RECORD.ID_RECORD := VarArrayOf([self.Id_Order]);
    ORDER_RECORD.TABLE_NAME := 'UP_DT_ORDERS';
    ORDER_RECORD.PK_FIELD_NAME := VarArrayOf(['ID_ORDER']);
    ORDER_RECORD.RAISE_FLAG := false;
    BlockResult := Kernel.LockRecord(@ORDER_RECORD);


end;

procedure TUpEditOrder.ItemsViewFocusedRecordChanged(
    Sender: TcxCustomGridTableView; APrevFocusedRecord,
    AFocusedRecord: TcxCustomGridRecord;
    ANewItemRecordFocusingChanged: Boolean);
begin
    if OrderItems.RecordCount > 0
        then begin
        if ShowBody.Checked
            then begin
            try
                PageProducer1.HTMLDoc.Clear;
                if (OrderItems.FieldByName('BODY').Value <> null)
                    then begin
                    PageProducer1.HTMLDoc.Add('<Body>');
                    PageProducer1.HTMLDoc.Add(OrderItems.FieldByName('BODY').AsString);
                    PageProducer1.HTMLDoc.Add('</Body>');
                end
                else begin
                    PageProducer1.HTMLDoc.Add('<Body>');
                    PageProducer1.HTMLDoc.Add('</Body>');
                end;
                if FileExists(tmpdir + '\43we27bfd87hsh.tmp')
                    then DeleteFile(tmpdir + '\43we27bfd87hsh.tmp');
                PageProducer1.HTMLDoc.SaveToFile(tmpdir + '\43we27bfd87hsh.tmp');
                WebBrowser1.Navigate(tmpdir + '\43we27bfd87hsh.tmp');
            except on E: Exception do
                begin
                    ShowBody.Checked := false;
                    ShowBody.OnClick(self);
                end;
            end;
        end;
    end
    else begin
        webBrowser1.Navigate('about:blank');
    end;
end;

procedure TUpEditOrder.onFMAS_MESS_CLOSE_FRAME(var Msg: TMessage);
begin
    ClearTabSheet2Resources;
    PageControl1.ActivePageIndex := 0;
    TabSheet2.TabVisible := false;
    RefreshButton.OnClick(self);
end;

procedure TUpEditOrder.onFMAS_MESS_GET_BUTTON_CANCEL(var Msg: TMessage);
begin
    CurFrameCancelButtonHandle := Msg.WParam;
end;

procedure TUpEditOrder.onFMAS_MESS_GET_BUTTON_OK(var Msg: TMessage);
begin
    CurFrameOkButtonHandle := Msg.WParam;

end;

procedure TUpEditOrder.onFMAS_MESS_SAVE_ITEM_ERR(var Msg: TMessage);
begin
     //
end;

procedure TUpEditOrder.onFMAS_MESS_SAVE_ITEM_OK(var Msg: TMessage);
begin
    ClearTabSheet2Resources;
    if TabSheet2.TabVisible then TabSheet2.TabVisible := false;
    if PageControl1.ActivePageIndex <> 0 then PageControl1.ActivePageIndex := 0;
    RefreshButton.OnClick(self);

    CurItemInfoWasChanged := false;
end;

procedure TUpEditOrder.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var res: TModalResult;
    UpdateOrderHeaderSP: TpFibStoredProc;
    BufferSP: TpFibStoredproc;
    TmpMessStr: string;
begin
    if (FMode <> fmInfo)
        then begin
        if (old_DATE_ORDER <> DateOrder.EditValue)
            or (old_DATE_PROJECT <> DateOrderKadr.EditValue)
            or (old_NUM_PROJECT <> NumOrderKadr.EditValue)
            or (old_NUM_ORDER <> NumOrder.EditValue)
            or (old_NOTE <> NoteValue.EditValue)
            or (old_PRINT_NAME <> PrintName.EditValue)
            or (old_PREAMBLE <> Intro.EditValue)
            or (old_PRINT_CREATOR <> Maker.EditValue)
            or (old_PRINT_CREATOR_POST <> IspolnitelPost.EditValue)
            or ask_delete_empty_order or CurItemInfoWasChanged
            then begin
            res := agMessageDlg('Увага!', 'Зберегти зміни по наказу?', mtConfirmation, [mbYes, mbNo, mbCancel]);

            if (res = mrYes)
                then begin
                                   //Сохраняем информацию если были изменения по шапке
                if (old_DATE_ORDER <> DateOrder.EditValue)
                    or (old_DATE_PROJECT <> DateOrderKadr.EditValue)
                    or (old_NUM_PROJECT <> NumOrderKadr.EditValue)
                    or (old_NUM_ORDER <> NumOrder.EditValue)
                    or (old_NOTE <> NoteValue.EditValue)
                    or (old_PRINT_NAME <> PrintName.EditValue)
                    or (old_PREAMBLE <> Intro.EditValue)
                    or (old_PRINT_CREATOR <> Maker.EditValue)
                    or (old_PRINT_CREATOR_POST <> IspolnitelPost.EditValue)
                    then begin

                    if (DateOrderKadr.EditValue = null)
                        then begin
                        HSDialogs.HSShowWarning('Не введено дату проекта!', DateOrderKadr, 0, 0);
                        CanClose := false;
                        Exit;
                    end;

                    if BlockTransaction.InTransaction then BlockTransaction.Rollback;

                    try

                        UpdateOrderHeaderSP := TpFibStoredProc.Create(nil);
                        UpdateOrderHeaderSP.Database := WorkDatabase;
                        UpdateOrderHeaderSP.Transaction := WriteTransaction;
                        UpdateOrderHeaderSP.StoredProcName := 'UP_DT_ORDERS_UPD';
                        WriteTransaction.StartTransaction;
                        UpdateOrderHeaderSP.Prepare;
                        UpdateOrderHeaderSP.ParamByName('ID_ORDER').asInt64 := Id_Order;
                        UpdateOrderHeaderSP.ParamByName('DATE_ORDER').Value := DateOrder.EditValue;
                        UpdateOrderHeaderSP.ParamByName('DATE_PROJECT').Value := DateOrderKadr.EditValue;
                        UpdateOrderHeaderSP.ParamByName('NUM_PROJECT').Value := NumOrderKadr.EditValue;
                        UpdateOrderHeaderSP.ParamByName('NUM_ORDER').Value := NumOrder.EditValue;
                        UpdateOrderHeaderSP.ParamByName('ID_OWNER').AsInt64 := id_owner;
                        UpdateOrderHeaderSP.ParamByName('NOTE').Value := NoteValue.EditValue;
                        UpdateOrderHeaderSP.ParamByName('PRINT_NAME').Value := PrintName.EditValue;
                        UpdateOrderHeaderSP.ParamByName('PREAMBLE').Value := Intro.EditValue;
                        UpdateOrderHeaderSP.ParamByName('PRINT_CREATOR').Value := Maker.EditValue;
                        UpdateOrderHeaderSP.ParamByName('PRINT_CREATOR_POST').Value := IspolnitelPost.EditValue;
                        UpdateOrderHeaderSP.ExecProc;
                        WriteTransaction.Commit;
                        UpdateOrderHeaderSP.Close;
                        UpdateOrderHeaderSP.Free;
                    except on E: Exception do
                        begin
                            TmpMessStr := E.Message;
                            TmpMessStr := Copy(TmpMessStr, Pos('Н', TmpMessStr), Length(TmpMessStr) - Pos('Н', TmpMessStr));
                            agShowMessage(TmpMessStr);
                            CanClose := false;
                        end;
                    end;
                end;

                                   //Проверяем были ли сохранена информация по пунктам
                if CurItemInfoWasChanged
                    then begin
                    if TabSheet2.TabVisible and (CurFrameOkButtonHandle <> 0)
                        then begin
                        PageControl1.ActivePage := TabSheet2;
                        agShowMessage('Треб завершити роботу з пунктами наказу!');
                    end;
                    CanClose := false;
                end
                else begin
                    ClearTabSheet2Resources;
                    PageControl1.ActivePageIndex := 0;
                    TabSheet2.TabVisible := false;
                    CanClose := true;
                end;
            end;

            if (res = mrNo)
                then begin
                CanClose := true;
                if TabSheet2.TabVisible
                    then begin
                    ClearTabSheet2Resources;
                    PageControl1.ActivePageIndex := 0;
                    TabSheet2.TabVisible := false;
                    RefreshButton.OnClick(self);
                end;

                OrderItems.CloseOpen(true);

                if ask_delete_empty_order and (OrderItems.RecordCount = 0)
                    then begin
                    if BlockTransaction.InTransaction then BlockTransaction.Rollback;
                    WriteTransaction.StartTransaction;
                    BufferSP := TpFibStoredproc.Create(self);
                    BufferSP.Database := WorkDatabase;
                    BufferSP.Transaction := WriteTransaction;
                    BufferSP.StoredProcName := 'UP_DT_ORDERS_DEL';
                    BufferSP.Prepare;
                    BufferSP.ParamByName('ID_ORDER').asInt64 := Id_Order;
                    BufferSP.ExecProc;
                    WriteTransaction.Commit;
                    BufferSP.Close;
                    BufferSP.Free;
                end;
            end;

            if (res = mrCancel)
                then begin
                CanClose := false;
            end;
        end
        else begin
        end;

        SendMessage(TForm(Owner).Handle, FMAS_MESS_UPDATE_DATA, Id_Order, Id_Order);
    end
    else SendMessage(TForm(Owner).Handle, FMAS_MESS_UPDATE_DATA, Id_Order, Id_Order);
end;

procedure TUpEditOrder.ToolButton4Click(Sender: TObject);
begin
     //ClearTabSheet2Resources;

    Close;
end;

procedure TUpEditOrder.ToolButton5Click(Sender: TObject);
var BufferSP: TpFibStoredproc;
begin
     //Удаление одиночного пункта
    if (OrderItems.RecordCount > 0)
        then begin
        if agMessageDlg('Увага!', 'Ви хочете змінити нумерацію всіх пунктів?', mtConfirmation, [mbYes, mbNo]) = mrYes
            then begin
            BufferSP := TpFibStoredproc.Create(self);
            BufferSP.Database := WorkDatabase;
            BufferSP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            BufferSP.StoredProcName := 'UP_KER_DO_RENUMERATION';
            BufferSP.Prepare;
            BufferSP.ParamByName('ID_ORDER').asInt64 := Id_Order;
            BufferSP.ExecProc;
            WriteTransaction.Commit;
            RefreshButton.OnClick(self);
        end;
    end;
end;

procedure TUpEditOrder.BitBtn1Click(Sender: TObject);
begin
    ClearTabSheet2Resources;
    PageControl1.ActivePageIndex := 0;
    TabSheet2.TabVisible := false;
    Close;
end;

procedure TUpEditOrder.ItemsViewDblClick(Sender: TObject);
begin
    ToolButton2.OnClick(self);
end;

procedure TUpEditOrder.ToolBar1Resize(Sender: TObject);
begin
     //ToolButton6.Width:=ToolBar1.Width-ToolButton5.Width*5;
end;

procedure TUpEditOrder.ShowBodyPropertiesChange(Sender: TObject);
begin
    if (OrderItems.RecordCount > 0)
        then begin
        PeoplePanel.Visible := ShowBody.Checked;
        cxSplitter1.Visible := ShowBody.Checked;

        if ShowBody.Checked
            then begin
            cxSplitter1.Top := WebBrowser1.Top - 1;
            ItemsViewFocusedRecordChanged(ItemsView,
                ItemsView.Controller.FocusedRecord,
                ItemsView.Controller.FocusedRecord,
                true);
        end;
    end;
end;

procedure TUpEditOrder.ClearTabSheet2Resources;
begin
    try
        if VisibleFrame <> nil
            then begin
            TForm(VisibleFrame).Close;
            if Assigned(VisibleFrame) then VisibleFrame := nil;
            VisibleFrame := nil;
        end

    except on E: Exception do
        begin
               //agShowMessage('Помилка під час ClearTabSheet2Resources '+E.Message);
        end;
    end;
end;

procedure TUpEditOrder.ItemsViewKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if OrderItems.RecordCount > 0
        then begin
        if ((Key = VK_F2) and (ToolButton2.Caption = 'Змінити'))
            then begin
            if ToolButton2.Visible
                then ToolButton2.OnClick(self);
        end;

        if ((Key = VK_F3) and (ToolButton2.Caption = 'Перегляд'))
            then begin
            if ToolButton2.Visible
                then ToolButton2.OnClick(self);
        end;

        if (Key = VK_INSERT)
            then begin
            if ToolButton1.Visible
                then ToolButton1.OnClick(self);
        end;

        if (Key = VK_DELETE)
            then begin
            if ToolButton3.Visible
                then ToolButton3.OnClick(self);
        end;

        if (Key = VK_F5)
            then begin
            if RefreshButton.Visible
                then RefreshButton.OnClick(self);
        end;
    end;

    if ((Key = VK_F12) and (ssShift in Shift))
        then begin
        ShowInfo(OrderItems);
    end;

end;

procedure TUpEditOrder.CheckBox1KeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if OrderItems.RecordCount > 0
        then begin
        if ((Key = VK_F2) and (ToolButton2.Caption = 'Змінити'))
            then begin
            if ToolButton2.Visible
                then ToolButton2.OnClick(self);
        end;

        if ((Key = VK_F3) and (ToolButton2.Caption = 'Перегляд'))
            then begin
            if ToolButton2.Visible
                then ToolButton2.OnClick(self);
        end;

        if (Key = VK_INSERT)
            then begin
            if ToolButton1.Visible
                then ToolButton1.OnClick(self);
        end;

        if (Key = VK_DELETE)
            then begin
            if ToolButton3.Visible
                then ToolButton3.OnClick(self);
        end;

        if (Key = VK_F5)
            then begin
            if RefreshButton.Visible
                then RefreshButton.OnClick(self);
        end;
    end;

end;

procedure TUpEditOrder.CheckBox2KeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if OrderItems.RecordCount > 0
        then begin
        if ((Key = VK_F2) and (ToolButton2.Caption = 'Змінити'))
            then begin
            if ToolButton2.Visible
                then ToolButton2.OnClick(self);
        end;

        if ((Key = VK_F3) and (ToolButton2.Caption = 'Перегляд'))
            then begin
            if ToolButton2.Visible
                then ToolButton2.OnClick(self);
        end;

        if (Key = VK_INSERT)
            then begin
            if ToolButton1.Visible
                then ToolButton1.OnClick(self);
        end;

        if (Key = VK_DELETE)
            then begin
            if ToolButton3.Visible
                then ToolButton3.OnClick(self);
        end;

        if (Key = VK_F5)
            then begin
            if RefreshButton.Visible
                then RefreshButton.OnClick(self);
        end;
    end;

end;

procedure TUpEditOrder.ApplicationEvents1ShortCut(var Msg: TWMKey;
    var Handled: Boolean);
begin
    Handled := false;

    if PageControl1.ActivePageIndex = 0
        then begin
        if (OrderItems.RecordCount > 0)
            then begin
            if (Msg.CharCode = VK_F2) and ((self.FMode = fmClone) or (self.FMode = fmAdd))
                then begin
                if ToolButton2.Visible and (Screen.ActiveForm.Name = 'UpEditOrder') and (EditPageControl.ActivePageIndex = 1)
                    then begin
                    ToolButton2.OnClick(self);
                    Handled := true;
                end;
            end;
            if (Msg.CharCode = VK_F3) and (self.FMode = fmInfo)
                then begin
                if ToolButton2.Visible and (Screen.ActiveForm.Name = 'UpEditOrder') and (EditPageControl.ActivePageIndex = 1)
                    then begin
                    ToolButton2.OnClick(self);
                    Handled := true;
                end;
            end;
            if (Msg.CharCode = VK_DELETE) and ((self.FMode = fmClone) or (self.FMode = fmAdd))
                then begin
                if ToolButton3.Visible and (Screen.ActiveForm.Name = 'UpEditOrder') and (EditPageControl.ActivePageIndex = 1)
                    then begin
                    ToolButton3.OnClick(self);
                    Handled := true;
                end;
            end;
        end;


        if ((Msg.CharCode = VK_INSERT) and (self.FMode = fmAdd))
            then begin
            if (Screen.ActiveForm.Name = 'UpEditOrder') and (EditPageControl.ActivePageIndex = 1)
                then begin
                if ToolButton1.Visible and (Screen.ActiveForm.Name = 'UpEditOrder') and (EditPageControl.ActivePageIndex = 1)
                    then begin
                    ToolButton1.OnClick(self);
                    Handled := true;
                end;
            end;
        end;
    end;
end;

procedure TUpEditOrder.onFMAS_MESS_ITEM_INFO_CHANGED(var Msg: TMessage);
begin
    CurItemInfoWasChanged := true;
end;

procedure TUpEditOrder.CancelExecute(Sender: TObject);
begin
    Close;
end;

procedure TUpEditOrder.N2Click(Sender: TObject);
var Form: TUpOrderAddItemForm;
    UpDateSP: TpFibStoredProc;
    id_: int64;
begin
    if (OrderItems.RecordCount > 0)
        then begin
        Form := TUpOrderAddItemForm.Create(Self, fmAdd, -1);
        Form.ItemType.Visible := false;
        Form.Caption := 'Зміна номеру пункта!';
        Form.BplName.Visible := false;
        Form.qFIC_NumItem.Value := OrderItems.FieldByName('NUM_ITEM').Value;
        Form.qFIC_NumSubItem.Value := OrderItems.FieldByName('NUM_SUB_ITEM').Value;
        if (Form.ShowModal = mrOk)
            then begin
            UpDateSP := TpFibStoredProc.Create(self);
            UpDateSP.Database := WorkDatabase;
            UpDateSP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            UpDateSP.StoredProcName := 'UP_DT_ORDER_ITEM_EDIT_NUM';
            UpDateSP.Prepare;
            id_ := StrToInt64(OrderItems.FieldByName('ID_ITEM').asString);
            UpDateSP.ParamByName('ID_ITEM').asInt64 := StrToInt64(OrderItems.FieldByName('ID_ITEM').asString);
            UpDateSP.ParamByName('NUM_ITEM').Value := Form.qFIC_NumItem.Value;
            UpDateSP.ParamByName('NUM_SUB_ITEM').Value := Form.qFIC_NumSubItem.Value;
            UpDateSP.ExecProc;
            WriteTransaction.Commit;
            UpDateSP.Close;
            UpDateSP.Free;
            OrderItems.CloseOpen(true);
            OrderItems.Locate('ID_ITEM', id_, []);
        end;
        Form.free;
    end;
end;

procedure TUpEditOrder.ToolButton6Click(Sender: TObject);
var
    sp: TSprav;
begin
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
                FieldValues['id_order'] := Id_Order;
                Post;
            end;
           // показать справочник и проанализировать результат (выбор одного подр.)
            sp.Show;
            sp.Free;
            OrderItems.CloseOpen(true);
        end
        else ShowMessage('Ця частина ще знаходиться в розробці!');
    except on e: Exception do
            MessageDlg('Помилка: ' + e.Message, mtError, [mbOk], 0);
    end;
end;

procedure TUpEditOrder.ToolButton7Click(Sender: TObject);
var
    T: TfrmGetItemsStru;
begin
    if (OrderItems.RecordCount > 0)
        then begin
        T := TfrmGetItemsStru.Create(self, Id_Order, StrToInt64(OrderItems.FieldByName('ID_ITEM').asString));
        T.ShowModal;
        T.Free;
    end;
end;

procedure TUpEditOrder.OwnerUserControlPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Користувачі системи';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'USERS';
    Params.Fields := 'full_name,id_user ';
    Params.FieldsName := 'П.І.Б.';
    Params.KeyField := 'ID_user';
    Params.ReturnFields := 'id_user,full_name';
    Params.DBHandle := Integer(WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        id_owner := VarAsType(output['id_user'], varInt64);
        OwnerUserControl.Text := VarToStr(output['full_name']);
    end;
end;

procedure TUpEditOrder.Action1Execute(Sender: TObject);
var T: TfrmEditBody;
    UpdateSP: TpFibStoredProc;
    iditem: Int64;
begin
    if not (self.FMode in [fmInfo, fmClone])
        then begin
        if agMessageDlg('Увага!', 'Ви хочете змінити тіло пункту для друку?', mtError, [mbYes, mbNo]) = mrYes
            then begin
            if (OrderItems.RecordCount > 0)
                then begin
                if (OrderItems.FieldByName('BODY').Value <> null)
                    then begin
                    T := TfrmEditBody.Create(self);
                    T.cxMemo1.EditValue := OrderItems.FieldByName('BODY').Value;
                    if T.ShowModal = mrYes
                        then begin
                        UpdateSP := TpFibStoredProc.Create(self);
                        UpdateSP.Database := WorkDatabase;
                        UpdateSP.Transaction := WriteTransaction;
                        WriteTransaction.StartTransaction;
                        UpdateSP.StoredProcName := 'UP_DT_ORDER_ITEMS_UPD';
                        UpdateSP.Prepare;
                        iditem := StrToInt64(OrderItems.FieldByName('ID_ITEM').asString);
                        UpdateSP.ParamByName('ID_ITEM').AsInt64 := iditem;
                        UpdateSP.ParamByName('BODY').Value := T.cxMemo1.EditValue;
                        UpdateSP.ExecProc;
                        WriteTransaction.Commit;
                        UpdateSP.Close;
                        UpdateSP.Free;
                        OrderItems.CloseOpen(true);
                        OrderItems.Locate('ID_ITEM', iditem, []);
                    end;
                    T.Free;
                end
                else agShowMessage('Тыло не було сформовано ще жодного разу!');
            end;
        end;
    end;
end;

procedure TUpEditOrder.BitBtn3Click(Sender: TObject);
var UpdateOrderHeaderSP: TpFibStoredProc;
    TmpMessStr: string;
begin
    if (DateOrderKadr.EditValue = null)
        then begin
        HSDialogs.HSShowWarning('Не введено дату проекта!', DateOrderKadr, 0, 0);
        Exit;
    end;

    if BlockTransaction.InTransaction then BlockTransaction.Rollback;

    try
        UpdateOrderHeaderSP := TpFibStoredProc.Create(nil);
        UpdateOrderHeaderSP.Database := WorkDatabase;
        UpdateOrderHeaderSP.Transaction := WriteTransaction;
        UpdateOrderHeaderSP.StoredProcName := 'UP_DT_ORDERS_UPD_REG';
        WriteTransaction.StartTransaction;
        UpdateOrderHeaderSP.Prepare;
        UpdateOrderHeaderSP.ParamByName('ID_ORDER').asInt64 := Id_Order;
        UpdateOrderHeaderSP.ParamByName('DATE_ORDER').Value := DateOrder.EditValue;
        UpdateOrderHeaderSP.ParamByName('NUM_ORDER').Value := NumOrder.EditValue;
        UpdateOrderHeaderSP.ExecProc;
        WriteTransaction.Commit;
        UpdateOrderHeaderSP.Close;
        UpdateOrderHeaderSP.Free;

        old_DATE_ORDER := DateOrder.EditValue;
        old_DATE_PROJECT := DateOrderKadr.EditValue;
        old_NUM_PROJECT := NumOrderKadr.EditValue;
        old_NUM_ORDER := NumOrder.EditValue;
        old_NOTE := NoteValue.EditValue;
        old_PRINT_NAME := PrintName.EditValue;
        old_PREAMBLE := Intro.EditValue;
        old_PRINT_CREATOR := Maker.EditValue;
        old_PRINT_CREATOR_POST := IspolnitelPost.EditValue;


        agMessageDlg('Увага!', 'Інформація по шапці наказу збережена успішно!', mtInformation, [mbOk]);
    except on E: Exception do
        begin
            TmpMessStr := E.Message;
            TmpMessStr := Copy(TmpMessStr, Pos('РЕЄСТРАЦІЙНІ', TmpMessStr), Length(TmpMessStr) - Pos('РЕЄСТРАЦІЙНІ', TmpMessStr));
            agShowMessage(TmpMessStr);
        end;
    end;


    BlockTransaction.StartTransaction;
    ORDER_RECORD.DBHANDLE := WorkDatabase.Handle;
    ORDER_RECORD.TRHANDLE := BlockTransaction.Handle;
    ORDER_RECORD.ID_RECORD := VarArrayOf([self.Id_Order]);
    ORDER_RECORD.TABLE_NAME := 'UP_DT_ORDERS';
    ORDER_RECORD.PK_FIELD_NAME := VarArrayOf(['ID_ORDER']);
    ORDER_RECORD.RAISE_FLAG := false;
    BlockResult := Kernel.LockRecord(@ORDER_RECORD);


end;

procedure TUpEditOrder.cxchckbx1PropertiesChange(Sender: TObject);
begin
    btnErrorsButton.Visible := cxchckbx1.Checked;
    ItemsViewDBColumn2.Visible := cxchckbx1.Checked;
end;

procedure TUpEditOrder.btnErrorsButtonClick(Sender: TObject);
var GetErrorStoredProc: TpFibStoredProc;
begin
    if (OrderItems.RecordCount > 0)
        then begin
        GetErrorStoredProc := TpFibStoredProc.Create(self);
        GetErrorStoredProc.Database := WorkDatabase;
        GetErrorStoredProc.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        GetErrorStoredProc.StoredProcName := 'UP_KER_DO_ORDER_DATA';
        GetErrorStoredProc.Prepare;
        GetErrorStoredProc.ParamByName('ID_ORDER').AsInt64 := Id_Order;
        GetErrorStoredProc.ParamByName('ID_ORDER_ITEM_IN').AsInt64 := StrToInt64(OrderItems.FieldByName('ID_ITEM').asString);
        GetErrorStoredProc.ParamByName('KEY_SESSION').AsInt64 := -1;
        GetErrorStoredProc.ParamByName('FILL_INST').value := 0;
        GetErrorStoredProc.ParamByName('FILL_MAIN_DATA').value := 0;
        GetErrorStoredProc.ParamByName('CHECK_DATA').value := 1;
        GetErrorStoredProc.ParamByName('USE_BUFF_TABLES').value := 0;
        GetErrorStoredProc.ExecProc;
        WriteTransaction.Commit;
        if GetErrorStoredProc.ParamByName('RESULT_KOD').Value = 0
            then begin
            UpKernelUnit.GetUpSessionErrors(self, WorkDatabase.Handle, -1, StrToInt64(OrderItems.FieldByName('ID_ITEM').asString));
        end;
        GetErrorStoredProc.Close;
        GetErrorStoredProc.Free;
    end;




end;

procedure TUpEditOrder.SearchEditChange(Sender: TObject);
begin
    if (SearchEdit.Text = '') or (VarIsNull(SearchEdit.Text)) then
    begin
        ItemsView.DataController.DataSet.Filtered := False;
    end
    else
    begin
        try
            ItemsView.DataController.DataSet.Filtered := False;
            ItemsView.DataController.DataSet.Filter := '(not FIO is null) and UPPER(FIO) LIKE ''%' +
                AnsiUpperCase(SearchEdit.Text) + '%''';
            ItemsView.DataController.DataSet.Filtered := True;
            ItemsView.ViewData.Expand(False);
            ItemsView.DataController.SelectRows(0, 0);
        except
        end;
    end;
end;

procedure TUpEditOrder.ItemsViewDBColumn1PropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    sp: TSprav;
begin
    if ItemsView.Controller.FocusedRow.Values[5] <> null
        then begin
        sp := GetSprav('asup\PrivateCard');
        if sp <> nil then
        begin
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(workDatabase.Handle);
                FieldValues['Actual_Date'] := Date;
                FieldValues['Id_PCard'] := ItemsView.Controller.FocusedRow.Values[5];
                FieldValues['CreatePCard'] := 0;
                FieldValues['Modify'] := 0;
                FieldValues['ShowStyle'] := 1;
                FieldValues['FIO'] := ItemsView.Controller.FocusedRow.Values[3];
                FieldValues['AdminMode'] := 0;

                Post;
            end;
            sp.Show;
        end;
    end;
end;

procedure TUpEditOrder.ShowPostPropertiesChange(Sender: TObject);
begin
    ItemsViewDBPost.Visible := ShowPost.Checked;
    KYVSaveIntoRegistry('TUpEditOrder_ShowPost', IntToStr(Integer(ShowPost.Checked)), GetUserId);
end;

function TUpEditOrder.CheckActionIdUser(id_order_type: integer): Boolean;
var IUStoredProc: TpFibStoredProc;
    Res: Integer;
begin
    IUStoredProc := TpFibStoredProc.Create(self);
    IUStoredProc.Database := WorkDatabase;
    IUStoredProc.Transaction := WriteTransaction;
    WriteTransaction.StartTransaction;
    IUStoredProc.StoredProcName := 'UP_KER_CHECK_SUPER_USER';
    IUStoredProc.Prepare;
    IUStoredProc.ParamByName('ID_USER').AsInt64 := GetUserId;
    IUStoredProc.ParamByName('ID_ORDER_TYPE').Value := id_order_type;
    IUStoredProc.ExecProc;
    Res := IUStoredProc.ParamByName('RESULT').Value;
    WriteTransaction.Commit;
    IUStoredProc.Close;
    IUStoredProc.Free;

    if (Res = 1)
        then Result := true
    else Result := false;
end;

procedure TUpEditOrder.TabSheet4Show(Sender: TObject);
begin
    NoteValue.SetFocus;
end;

end.

