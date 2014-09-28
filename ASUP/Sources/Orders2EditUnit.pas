unit Orders2EditUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uSpravControl, uFControl, uLabeledFControl, uCharControl,
    uFormControl, ComCtrls, uDateControl, StdCtrls, Buttons, uMemoControl,
    PersonalCommon, SpCommon, Accmgmt, ActnList, cxStyles, cxCustomData,
    cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
    cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
    cxClasses, cxControls, cxGridCustomView, cxGrid, IBCustomDataSet,
    IBQuery, ExtCtrls, DBCtrls, uActionControl, cxSplitter, Clipbrd;

type
    TOrders2EditForm = class(TForm)
        HeaderFormControl: TqFFormControl;
        EditPageControl: TPageControl;
        ItemsSheet: TTabSheet;
        HeaderSheet: TTabSheet;
        NumOrderKadr: TqFCharControl;
        DateOrderKadr: TqFDateControl;
        qFCharControl1: TqFCharControl;
        PrintName: TqFCharControl;
        SpeedButton1: TSpeedButton;
        Intro: TqFMemoControl;
        Maker: TqFCharControl;
        SpeedButton2: TSpeedButton;
        SpeedButton3: TSpeedButton;
        PrintSignerSheet: TTabSheet;
        DigitSignersSheet: TTabSheet;
        VizaSheet: TTabSheet;
        KnowSheet: TTabSheet;
        AgreeSheet: TTabSheet;
        OwnerUserControl: TqFSpravControl;
        ActionList1: TActionList;
        Cancel: TAction;
        Panel5: TPanel;
        AddVizaButton: TSpeedButton;
        DeleteVizaButton: TSpeedButton;
        PaperSignersQuery: TIBQuery;
        PaperSignersQueryFIO: TIBStringField;
        PaperSignersQueryPOST: TIBStringField;
        PaperSignersQueryID_ORDER: TIntegerField;
        PaperSignersDataSource: TDataSource;
        VizaQuery: TIBQuery;
        VizaQueryID_ORDER_VIZA: TIntegerField;
        VizaQueryFIO: TIBStringField;
        VizaDataSource: TDataSource;
        KnowQuery: TIBQuery;
        KnowQueryID_ORDER_KNOW: TIntegerField;
        KnowQueryFIO: TIBStringField;
        KnowDataSource: TDataSource;
        AgreeQuery: TIBQuery;
        AgreeQueryID_ORDER_AGREE: TIntegerField;
        AgreeQueryFIO: TIBStringField;
        AgreeDataSource: TDataSource;
        VizaGrid: TcxGrid;
        VizaGridDBTableView1: TcxGridDBTableView;
        VizaGridDBTableView1DBColumn1: TcxGridDBColumn;
        VizaGridLevel1: TcxGridLevel;
        OutputQuery: TIBQuery;
        Panel4: TPanel;
        AddKnowButton: TSpeedButton;
        DeleteKnowButton: TSpeedButton;
        KnowGrid: TcxGrid;
        cxGridDBTableView1: TcxGridDBTableView;
        cxGridDBColumn1: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
        Panel7: TPanel;
        AddAgreeButton: TSpeedButton;
        DeleteAgreeButton: TSpeedButton;
        AgreeGrid: TcxGrid;
        cxGridDBTableView2: TcxGridDBTableView;
        cxGridDBColumn2: TcxGridDBColumn;
        cxGridLevel2: TcxGridLevel;
        Panel2: TPanel;
        AddPaperSignerButton: TSpeedButton;
        DeletePaperSignerButton: TSpeedButton;
        PrintSignersGrid: TcxGrid;
        cxGridDBTableView3: TcxGridDBTableView;
        cxGridDBColumn3: TcxGridDBColumn;
        cxGridDBTableView3DBColumn1: TcxGridDBColumn;
        cxGridLevel3: TcxGridLevel;
        Panel1: TPanel;
        AddSignButton: TSpeedButton;
        ModifySignButton: TSpeedButton;
        DeleteSignButton: TSpeedButton;
        Panel6: TPanel;
        Label6: TLabel;
        NAME_STATUS_LABEL: TDBText;
        SignersGrid: TcxGrid;
        cxGridDBTableView4: TcxGridDBTableView;
        cxGridDBColumn4: TcxGridDBColumn;
        cxGridLevel4: TcxGridLevel;
        InputQuerySign: TIBQuery;
        InputQuerySignID_ORDER: TIntegerField;
        InputQuerySignID_PCARD: TIntegerField;
        InputQuerySignID_STATUS: TIntegerField;
        InputQuerySignNAME_STATUS: TStringField;
        InputQuerySignCARD_NUMBER: TIntegerField;
        InputQuerySignID_MAN: TIntegerField;
        InputQuerySignTN: TIntegerField;
        InputQuerySignFAMILIA: TStringField;
        InputQuerySignIMYA: TStringField;
        InputQuerySignOTCHESTVO: TStringField;
        SignDataSource: TDataSource;
        cxGridDBTableView4DBColumn1: TcxGridDBColumn;
        cxGridDBTableView4DBColumn2: TcxGridDBColumn;
        Panel3: TPanel;
        AddItemButton: TSpeedButton;
        ModifyItemButton: TSpeedButton;
        DeleteItemButton: TSpeedButton;
        ItemsQuery: TIBQuery;
        ItemsDataSource: TDataSource;
        ItemsQueryID_ORDER: TIntegerField;
        ItemsQueryID_ORDER_TYPE: TIntegerField;
        ItemsQueryNAME_TYPE: TIBStringField;
        ItemsQueryGROUP_NUM_ITEM: TIntegerField;
        Ok: TAction;
        InfoButton: TSpeedButton;
        VizaQueryPOST: TIBStringField;
        AgreeQueryPOST: TIBStringField;
        KnowQueryPOST: TIBStringField;
        cxGridDBTableView2DBColumn1: TcxGridDBColumn;
        cxGridDBTableView1DBColumn1: TcxGridDBColumn;
        VizaGridDBTableView1DBColumn2: TcxGridDBColumn;
        ItemsQueryGROUP_SUB_NUM_ITEM: TIntegerField;
        ItemsQueryINTRO: TIBStringField;
        Panel8: TPanel;
        ItemsGrid: TcxGrid;
        cxGridDBTableView6: TcxGridDBTableView;
        cxGridDBColumn5: TcxGridDBColumn;
        cxGridDBColumn6: TcxGridDBColumn;
        cxGridDBColumn7: TcxGridDBColumn;
        cxGridLevel6: TcxGridLevel;
        PeopleSplitter: TcxSplitter;
        BottomPanel: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        PeopleQuery: TIBQuery;
        PeopleDataSource: TDataSource;
        PeopleQueryTN: TIntegerField;
        PeopleQueryFIO: TIBStringField;
        PeoplePanel: TPanel;
        PeopleGrid: TcxGrid;
        cxGridDBTableView5: TcxGridDBTableView;
        cxGridDBTableView5DBColumn1: TcxGridDBColumn;
        cxGridDBTableView5DBColumn2: TcxGridDBColumn;
        cxGridLevel5: TcxGridLevel;
        SearchPanel: TPanel;
        Label11: TLabel;
        Label12: TLabel;
        RecCountLabel: TLabel;
        SearchEdit: TEdit;
        NumOrder: TqFCharControl;
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
        DateOrder: TqFDateControl;
        IntNumberQuery: TIBQuery;
        IntNumberQueryINT_NUM: TIBStringField;
        IspolnitelPost: TqFCharControl;
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure CancelExecute(Sender: TObject);
        procedure HeaderFormControlNewRecordAfterPrepare(Sender: TObject);
        procedure HeaderFormControlAfterRecordAdded(Sender: TObject);
        procedure TabVisible(TabVisible: boolean);
        procedure PrepareQuerys;
        procedure HeaderFormControlModifyRecordAfterPrepare(Sender: TObject);
        procedure DeleteVizaButtonClick(Sender: TObject);
        procedure AddExistVizaClick(Sender: TObject);
        procedure DeleteKnowButtonClick(Sender: TObject);
        procedure AddExistKnowClick(Sender: TObject);
        procedure DeleteAgreeButtonClick(Sender: TObject);
        procedure AddExistAgreeClick(Sender: TObject);
        procedure AddPaperSignerButtonClick(Sender: TObject);
        procedure DeletePaperSignerButtonClick(Sender: TObject);
        procedure AddSignButtonClick(Sender: TObject);
        procedure ModifySignButtonClick(Sender: TObject);
        procedure DeleteSignButtonClick(Sender: TObject);
        procedure ModifyItemButtonClick(Sender: TObject);
        procedure DeleteItemButtonClick(Sender: TObject);
        procedure AddItemButtonClick(Sender: TObject);
        procedure OkExecute(Sender: TObject);
        procedure InfoButtonClick(Sender: TObject);
        procedure cxGridDBTableView5KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure HeaderFormControlInfoRecordAfterPrepare(Sender: TObject);
        procedure OwnerUserControlOpenSprav(Sender: TObject;
            var Value: Variant; var DisplayText: string);
        procedure SpeedButton3Click(Sender: TObject);
        procedure SpeedButton2Click(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        procedure EditPageControlChange(Sender: TObject);
        procedure ItemsQueryAfterScroll(DataSet: TDataSet);
        procedure PeopleQueryAfterOpen(DataSet: TDataSet);
        procedure SearchEditChange(Sender: TObject);
        procedure cxGridDBTableView5KeyPress(Sender: TObject; var Key: Char);
        procedure DateOrderKadrChange(Sender: TObject);
    private
    { Private declarations }
    public
        Id_Order: Integer;
    end;

var
    Orders2EditForm: TOrders2EditForm;

implementation

uses TextShablonsUnit, PCardsViewUnit, GoodFunctionsUnit, AddItemUnit, AddTextShablonUnit,
    SpFormUnit;

{$R *.dfm}

procedure TOrders2EditForm.PrepareQuerys;
begin
    KnowQuery.Close;
    KnowQuery.Params.ParamValues['ID_ORDER'] := Id_Order;
    KnowQuery.Open;

    AgreeQuery.Close;
    AgreeQuery.Params.ParamValues['ID_ORDER'] := Id_Order;
    AgreeQuery.Open;

    VizaQuery.Close;
    VizaQuery.Params.ParamValues['ID_ORDER'] := Id_Order;
    VizaQuery.Open;

    PaperSignersQuery.Close;
    PaperSignersQuery.Params.ParamValues['ID_ORDER'] := Id_Order;
    PaperSignersQuery.Open;

    InputQuerySign.Close;
    InputQuerySign.Params.ParamValues['ID_ORDER'] := Id_Order;
    InputQuerySign.Open;

    ItemsQuery.Close;
    ItemsQuery.Params.ParamValues['ID_ORDER_GROUP'] := Id_Order;
    ItemsQuery.Open;
end;

procedure TOrders2EditForm.TabVisible(TabVisible: boolean);
begin
    ItemsSheet.TabVisible := TabVisible;
    PrintSignerSheet.TabVisible := TabVisible;
    AgreeSheet.TabVisible := TabVisible;
    VizaSheet.TabVisible := TabVisible;
    KnowSheet.TabVisible := TabVisible;
    DigitSignersSheet.TabVisible := TabVisible;
end;

procedure TOrders2EditForm.FormCreate(Sender: TObject);
begin
    EditPageControl.ActivePageIndex := 0;

    OutputQuery.Transaction := WriteTransaction;
    VizaQuery.Transaction := ReadTransaction;
    KnowQuery.Transaction := ReadTransaction;
    AgreeQuery.Transaction := ReadTransaction;
    PaperSignersQuery.Transaction := ReadTransaction;
    InputQuerySign.Transaction := ReadTransaction;
    ItemsQuery.Transaction := ReadTransaction;
    IntNumberQuery.Transaction := ReadTransaction;
    PeopleQuery.Transaction := ReadTransaction;
end;

procedure TOrders2EditForm.OkButtonClick(Sender: TObject);
var
    OldMode: TFormMode;
    res: Boolean;
begin
    OldMode := HeaderFormControl.Mode;

    res := HeaderFormControl.Ok;

    if (HeaderFormControl.Mode = fmModify) and (OldMode = HeaderFormControl.Mode) then begin
        HeaderFormControl.LastId := Id_Order;
        if Res then begin
            HeaderFormControl.Mode := fmAdd;
            ModalResult := mrOk;
        end;
    end;
end;

procedure TOrders2EditForm.CancelExecute(Sender: TObject);
begin
    CancelButton.Click;
end;

procedure TOrders2EditForm.HeaderFormControlNewRecordAfterPrepare(
    Sender: TObject);
begin
    OwnerUserControl.Value := GetUserId;
    OwnerUserControl.DisplayText := GetUserFio;
    DateOrderKadr.Value := Date;

    // Генерируем автоматически номер приказа
    IntNumberQuery.Close;
    IntNumberQuery.Open;
    NumOrderKadr.Value := IntNumberQueryINT_NUM.Value;
    IntNumberQuery.Close;

    TabVisible(False);
end;

procedure TOrders2EditForm.HeaderFormControlAfterRecordAdded(
    Sender: TObject);
begin
    ModalResult := mrNone;
    HeaderFormControl.Mode := fmModify;
    Caption := HeaderFormControl.ModifyCaption;

    TabVisible(True);
    Id_Order := HeaderFormControl.LastId;
    PrepareQuerys;
end;

procedure TOrders2EditForm.HeaderFormControlModifyRecordAfterPrepare(
    Sender: TObject);
begin
    PrepareQuerys;
end;

procedure TOrders2EditForm.DeleteVizaButtonClick(Sender: TObject);
begin
    if VizaQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end else
        if (MessageDlg('Чи ви справді бажаєте вилучити цю особу?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_VIZA_DELETE(' + IntToStr(VizaQueryID_ORDER_VIZA.Value) + ')';
            ExecQuery(OutputQuery);

            VizaQuery.Close;
            VizaQuery.Open;
        end;
end;

procedure TOrders2EditForm.AddExistVizaClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(13);

    //if OutputQuery.Transaction.Active then
    //    OutputQuery.Transaction.Rollback;

    //OutputQuery.Transaction.StartTransaction;

    if Form.ShowModal = mrOk
        then begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_ORDER_VIZA_INSERT(' + QuotedStr(Form.ResultQueryTEXT1.Value) + ',' +
            QuotedStr(Form.ResultQueryTEXT2.Value) + ',' +
            IntToStr(Id_Order) + ')';
        ExecQuery(OutputQuery);

        VizaQuery.Close;
        VizaQuery.Open;
    end;

    //OutputQuery.Transaction.Commit;

    form.Free;
end;

procedure TOrders2EditForm.DeleteKnowButtonClick(Sender: TObject);
begin
    if KnowQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end else
        if (MessageDlg('Чи ви справді бажаєте вилучити цю особу?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_Know_DELETE(' + IntToStr(KnowQueryID_ORDER_Know.Value) + ')';
            ExecQuery(OutputQuery);

            KnowQuery.Close;
            KnowQuery.Open;
        end;
end;

procedure TOrders2EditForm.AddExistKnowClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(14);

    if Form.ShowModal = mrOk
        then begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_ORDER_KNOW_INSERT(' + QuotedStr(Form.ResultQueryText1.Value) + ',' +
            QuotedStr(Form.ResultQueryTEXT2.Value) + ',' +
            IntToStr(ID_ORDER) + ')';
        ExecQuery(OutputQuery);

        KnowQuery.Close;
        KnowQuery.Open;
    end;

    form.Free;
end;

procedure TOrders2EditForm.DeleteAgreeButtonClick(Sender: TObject);
begin
    if AgreeQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end else
        if (MessageDlg('Чи ви справді бажаєте вилучити цю особу?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_Agree_DELETE(' + IntToStr(AgreeQueryID_ORDER_Agree.Value) + ')';
            ExecQuery(OutputQuery);

            AgreeQuery.Close;
            AgreeQuery.Open;
        end;
end;

procedure TOrders2EditForm.AddExistAgreeClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(15);

    if Form.ShowModal = mrOk
        then begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_ORDER_AGREE_INSERT(' + QuotedStr(Form.ResultQueryTEXT1.Value) + ',' +
            QuotedStr(Form.ResultQueryTEXT2.Value) + ',' +
            IntToStr(ID_ORDER) + ')';
        ExecQuery(OutputQuery);

        AgreeQuery.Close;
        AgreeQuery.Open;
    end;

    form.Free;
end;

procedure TOrders2EditForm.AddPaperSignerButtonClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(6);

    if Form.ShowModal = mrOk
        then begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'INSERT INTO ORDER_PAPER_SIGNERS(ID_ORDER, FIO, POST)' +
            ' VALUES(' + IntToStr(ID_ORDER) + ',' +
            QuotedStr(Form.ResultQueryText1.Value) + ',' +
            QuotedStr(Form.ResultQueryText2.Value) + ')';
        ExecQuery(OutputQuery);

        PaperSignersQuery.Close;
        PaperSignersQuery.Open;
    end;

    Form.Free;
end;

procedure TOrders2EditForm.DeletePaperSignerButtonClick(Sender: TObject);
begin
    if PaperSignersQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end else
        if (MessageDlg('Чи ви справді бажаєте вилучити цю особу?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'DELETE FROM ORDER_PAPER_SIGNERS where ID_ORDER = ' + IntToStr(PaperSignersQueryID_ORDER.Value) +
                ' AND FIO = ' + QuotedStr(PaperSignersQueryFIO.Value) +
                ' AND POST = ' + QuotedStr(PaperSignersQueryPOST.Value);

            ExecQuery(OutputQuery);

            PaperSignersQuery.Close;
            PaperSignersQuery.Open;
        end;
end;

procedure TOrders2EditForm.AddSignButtonClick(Sender: TObject);
var
    TEMP: TPCardsViewForm;
    i: integer;
    IsExist: Boolean;
begin
    TEMP := TPCardsViewForm.Create(Self, False, True);
    TEMP.Select := true;
    TEMP.ShowModal;

    // после закрытия формы личных карточек
    if (Temp.ModalResult = mrOk)
        then begin

        {Проверяем, чтобы такого человека небыло уже среди подписующих}
        IsExist := False;
        InputQuerySign.FetchAll;

        if (InputQuerySign.RecordCount > 0)
            then
            for i := 1 to InputQuerySign.RecordCount
                do begin
                InputQuerySign.RecNo := i;
                if (InputQuerySign['ID_PCARD'] = Temp.ResultQuery['ID_PCARD'])
                    then IsExist := True;
            end;
        if (IsExist) then MessageDlg('Ця людина вже підписує наказ!', mtError, [mbOk], 0)
        else begin
            {добавляем выбранного подписывающего}
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE INSERT_ORDER_SIGN(' + IntToStr(ID_ORDER) + ',' + IntToStr(Temp.ResultQuery['ID_PCARD']) + ',' + IntToStr(2) + ');';
            ExecQuery(OutputQuery);
            InputQuerySign.Close;
            InputQuerySign.Open;
        end;
    end;

    Temp.Free;
end;

procedure TOrders2EditForm.ModifySignButtonClick(Sender: TObject);
var
    TEMP: TPCardsViewForm;
    i, OldRecNo: integer;
    IsExist: Boolean;
begin
    if InputQuerySign.IsEmpty then
    begin
        MessageDlg('Немає Підписуючих для змінення!', mtError, [mbOk], 0);
        exit;
    end
    else begin
        TEMP := TPCardsViewForm.Create(Self, False, True);
        TEMP.Select := true;
        TEMP.ShowModal;

        if (Temp.ModalResult = mrOk)
            then begin

            {Проверяем, чтобы такого человека небыло уже среди подписующих}
            IsExist := False;
            OldRecNo := InputQuerySign.RecNo;
            if (InputQuerySign.RecordCount > 0)
                then
                for i := 1 to InputQuerySign.RecordCount do begin
                    InputQuerySign.RecNo := i;

                    if (InputQuerySign['ID_PCARD'] = Temp.ResultQuery['ID_PCARD']) then
                        IsExist := True;
                end;

            InputQuerySign.RecNo := OldRecNo;

            if (IsExist) then
                MessageDlg('Ця людина вже підписує наказ!', mtError, [mbOk], 0)
            else begin
                {добавляем выбранного подписывающего}
                OutputQuery.Close;
                OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER_SIGN(' + IntToStr(ID_ORDER) + ',' + IntToStr(InputQuerySign['ID_PCARD']) + ',' + IntToStr(Temp.ResultQuery['ID_PCARD']) + ',' + IntToStr(2) + ');';
                ExecQuery(OutputQuery);
                InputQuerySign.Close;
                InputQuerySign.Open;
            end;
        end;
        Temp.Free;
    end;
end;

procedure TOrders2EditForm.DeleteSignButtonClick(Sender: TObject);
begin
    if InputQuerySign.IsEmpty then
    begin
        MessageDlg('Немає осіб для вилучення!', mtError, [mbOk], 0);
        exit;
    end else
        if (MessageDlg('Чи ви справді бажаєте вилучити цю особу?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
        {Удаляем Подписующего из приказа с таким ID_ORDER и ID_PCARD}
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DELETE_ORDER_SIGN(' + IntToStr(InputQuerySIGN['ID_ORDER']) + ',' + IntToStr(InputQuerySign['ID_PCARD']) + ');';
            ExecQuery(OutputQuery);
            InputQuerySign.Close;
            InputQuerySign.Open;
        end;
end;

procedure TOrders2EditForm.ModifyItemButtonClick(Sender: TObject);
var
    Form: TAddItemForm;
begin
    if not CheckQueryForModify(ItemsQuery) then
        exit;

    Form := TAddItemForm.Create(Self, emModify, Id_Order, ItemsQueryID_ORDER.Value, ItemsQueryGROUP_NUM_ITEM.Value, ItemsQueryID_ORDER_TYPE.Value, ItemsQueryNAME_TYPE.Value, ItemsQueryGROUP_SUB_NUM_ITEM.Value, ItemsQueryINTRO.Value);
    Form.Date_Order := DateOrder.Value;

    if Form.ShowModal = mrOk then begin
        ItemsQuery.Close;
        ItemsQuery.Open;

        ItemsQuery.Locate('GROUP_NUM_ITEM', StrToInt(Form.NumItem.Text), []);
    end;

    Form.Free;
end;

procedure TOrders2EditForm.DeleteItemButtonClick(Sender: TObject);
begin
    if not CheckQueryForDel(ItemsQuery) then
        exit;

    OutputQuery.Close;
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DELETE_ORDER(' + ItemsQueryID_ORDER.AsString + ',0)';
    ExecQuery(OutputQuery);

    ItemsQuery.Close;
    ItemsQuery.Open;
end;

procedure TOrders2EditForm.AddItemButtonClick(Sender: TObject);
var
    Form: TAddItemForm;
begin
    Form := TAddItemForm.Create(Self, emNew, Id_ORder, -1, -1, -1, '', -1, '');
    Form.Date_Order := DateOrder.Value;

    if Form.ShowModal = mrOk then begin
        ItemsQuery.Close;
        ItemsQuery.Open;

        ItemsQuery.Locate('GROUP_NUM_ITEM', StrToInt(Form.NumItem.Text), []);
    end;

    Form.Free;
end;

procedure TOrders2EditForm.OkExecute(Sender: TObject);
begin
    OkButton.Click;
end;

procedure TOrders2EditForm.InfoButtonClick(Sender: TObject);
var
    aId_order: Integer;
    FMode: TEditMode;
begin
    if not CheckQueryForModify(ItemsQuery) then exit;

    aId_Order := ItemsQueryID_ORDER.Value;

    if HeaderFormControl.Mode = fmModify then
        FMode := emModify
    else
        FMode := emView;

    ShowOrder(ItemsQueryID_ORDER.Value,
        ItemsQueryID_ORDER_TYPE.Value,
        1,
        FMode,
        OutputQuery,
        Self,
        DateOrder.Value,
        aId_order, '', '', -1, Id_Order);
end;

procedure TOrders2EditForm.cxGridDBTableView5KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Order: ' + IntToStr(ItemsQueryId_Order.Value));
        Clipboard.AsText := IntToStr(ItemsQueryId_Order.Value);
    except
    end;

    if Key = VK_BACK then SearchEdit.Text := '';
end;

procedure TOrders2EditForm.HeaderFormControlInfoRecordAfterPrepare(
    Sender: TObject);
begin
    HeaderFormControlModifyRecordAfterPrepare(Self);

    AddVizaButton.Enabled := False;
    DeleteVizaButton.Enabled := False;

    AddKnowButton.Enabled := False;
    DeleteKnowButton.Enabled := False;

    AddAgreeButton.Enabled := False;
    DeleteAgreeButton.Enabled := False;

    AddPaperSignerButton.Enabled := False;
    DeletePaperSignerButton.Enabled := False;
    AddSignButton.Enabled := False;
    ModifySignButton.Enabled := False;
    DeleteSignButton.Enabled := False;
    ModifyItemButton.Enabled := False;
    DeleteItemButton.Enabled := False;
    AddItemButton.Enabled := False;
end;

procedure TOrders2EditForm.OwnerUserControlOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Form: TSpForm;
    Params: TSpParams;
begin
    Form := TSpForm.Create(Self);
    Params := TSpParams.Create;

    Params.Table := 'USERS';
    Params.SpFields := 'FULL_NAME';
    Params.Title := 'Користувачі системи, які можуть бути власниками наказу';
    Params.ColumnNames := 'Повне ім`я користувача';
    Params.ReadOnly := True;
    Params.IdField := 'ID_USER';
    Params.ComboField := 'FULL_NAME';
    Params.SpMode := spmSelect;
    Params.DontHideFirstColumn := False;

    Form.Init(Params);

    if Form.ShowModal = mrOk then begin
        Value := Form.ResultQuery['ID_USER'];
        DisplayText := Form.ResultQuery['FULL_NAME'];
    end;

    Form.Free;
    Params.Free;
end;

procedure TOrders2EditForm.SpeedButton3Click(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(8);

    if Form.ShowModal = mrOk
        then begin
        Intro.Value := Form.ResultQueryTEXT1.Value;
    end;

    form.Free;
end;

procedure TOrders2EditForm.SpeedButton2Click(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    Form := TTextShablonsForm.Create(Self);

    form.Prepare(9);

    if Form.ShowModal = mrOk then
        Maker.Value := Form.ResultQueryTEXT1.Value;
    IspolnitelPost.Value := Form.ResultQueryTEXT2.Value;
    form.Free;
end;

procedure TOrders2EditForm.SpeedButton1Click(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(7);

    if Form.ShowModal = mrOk
        then begin
        PrintName.Value := Form.ResultQueryTEXT1.Value;
    end;

    form.Free;
end;

procedure TOrders2EditForm.EditPageControlChange(Sender: TObject);
begin
    if (EditPageControl.ActivePageIndex = 0) and (Self.WindowState = wsMaximized) then
        Self.WindowState := wsNormal;
end;

procedure TOrders2EditForm.ItemsQueryAfterScroll(DataSet: TDataSet);
begin
    if ItemsQuery.IsEmpty then begin
        PeopleQuery.Close;
        exit;
    end;

    PeopleQuery.Close;
    PeopleQuery.Params.ParamValues['ID_ORDER'] := ItemsQueryID_ORDER.Value;
    PeopleQuery.Open;
end;

procedure TOrders2EditForm.PeopleQueryAfterOpen(DataSet: TDataSet);
begin
    PeopleQuery.FetchAll;
    RecCountLabel.Caption := 'Кіл-ть: ' + IntToStr(PeopleQuery.RecordCount);
end;

procedure TOrders2EditForm.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    if PeopleQuery.IsEmpty then
        exit;

    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        PeopleQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        PeopleQuery.Locate('FIO', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TOrders2EditForm.cxGridDBTableView5KeyPress(Sender: TObject;
    var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TOrders2EditForm.DateOrderKadrChange(Sender: TObject);
begin
    DateOrder.Value := DateOrderKadr.Value;
end;

initialization

    RegisterClass(TOrders2EditForm);

end.
