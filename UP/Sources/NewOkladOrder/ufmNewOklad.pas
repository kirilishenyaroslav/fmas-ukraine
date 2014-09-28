unit ufmNewOklad;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uDateControl, StdCtrls, Buttons,
    uFormControl, RxMemDS, FIBDatabase, pFIBDatabase, uSpravControl,
    cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
    cxEdit, DB, cxDBData, ActnList, ExtCtrls, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
    cxGridCustomView, cxGrid, cxClasses, FIBDataSet, pFIBDataSet, FIBQuery,
    pFIBQuery, uCharControl, cxGridBandedTableView, cxGridDBBandedTableView,
    Grids, DBGrids, uInvisControl, IBExtract, DSContainer, ProcessUnit,
    cxSplitter, uIntControl, AppStruClasses;

type
    TfmNewOkladOrder = class(TFrame)
        DB: TpFIBDatabase;
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
        Panel1: TPanel;
        FromDate: TqFDateControl;
        IDSR: TqFSpravControl;
        FormControl: TqFFormControl;
        Panel2: TPanel;
        AddButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        AddSmetaButton: TSpeedButton;
        Label1: TLabel;
        Panel4: TPanel;
        AddPeopleButton: TSpeedButton;
        MovingsSelect: TpFIBDataSet;
        GetOrderItem: TpFIBDataSet;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        AddSmetaGroup: TpFIBQuery;
        SelectSmeta: TpFIBDataSet;
        SmetaFilterDataSource: TDataSource;
        AddSmetaQuery: TpFIBQuery;
        DeleteSmetaFilter: TpFIBQuery;
        AddDefaultSmeta: TpFIBQuery;
        Label2: TLabel;
        Panel5: TPanel;
        Label3: TLabel;
        IdSessionDS: TpFIBDataSet;
        Reason: TqFCharControl;
        MovingsSelectID_ORDER_ITEM: TFIBBCDField;
        MovingsSelectTN: TFIBIntegerField;
        MovingsSelectFIO: TFIBStringField;
        MovingsSelectDEPARTMENT_NAME: TFIBStringField;
        MovingsSelectPOST_NAME: TFIBStringField;
        MovingsSelectRATE_COUNT: TFIBFloatField;
        MovingsSelectOKLAD_BASE: TFIBFloatField;
        MovingsSelectOKLAD_PPS: TFIBFloatField;
        MovingsSelectSMETA_TITLE: TFIBStringField;
        MovingsSelectSMETA_PPS_TITLE: TFIBStringField;
        MovingsSource: TDataSource;
        SmetaGrid: TcxGrid;
        SmetaFilterView: TcxGridDBTableView;
        SmetaFilterViewID_SMETA: TcxGridDBColumn;
        SmetaFilterViewSMETA_TITLE: TcxGridDBColumn;
        SmetaGridLevel1: TcxGridLevel;
        PeopleGrid: TcxGrid;
        MovingsView: TcxGridDBBandedTableView;
        MovingsViewID_ORDER_ITEM: TcxGridDBBandedColumn;
        MovingsViewTN: TcxGridDBBandedColumn;
        MovingsViewFIO: TcxGridDBBandedColumn;
        MovingsViewDEPARTMENT_NAME: TcxGridDBBandedColumn;
        MovingsViewPOST_NAME: TcxGridDBBandedColumn;
        MovingsViewRATE_COUNT: TcxGridDBBandedColumn;
        MovingsViewOKLAD_BASE: TcxGridDBBandedColumn;
        MovingsViewOKLAD_PPS: TcxGridDBBandedColumn;
        MovingsViewSMETA_TITLE: TcxGridDBBandedColumn;
        MovingsViewSMETA_PPS_TITLE: TcxGridDBBandedColumn;
        PeopleGridLevel1: TcxGridLevel;
        BonusGrid: TcxGrid;
        BonusView: TcxGridDBTableView;
        cxGridLevel2: TcxGridLevel;
        NewOkladsAddRecord: TpFIBQuery;
        NewOkladsCreate: TpFIBQuery;
        ActionList1: TActionList;
        AddGroup: TAction;
        RefreshSmetaFilter: TAction;
        AddSmeta: TAction;
        DeleteAction: TAction;
        AddPeople: TAction;
        RefreshMovings: TAction;
        SpeedButton2: TSpeedButton;
        MovingsSelectFIO_WITH_TN: TFIBStringField;
        MovingsViewFIO_WITH_TN: TcxGridDBBandedColumn;
        SearchEdit: TqFCharControl;
        BonusSelect: TpFIBDataSet;
        BonusSource: TDataSource;
        BonusSelectPERCENT: TFIBFloatField;
        BonusSelectRAISE_NAME: TFIBStringField;
        BonusSelectSMETA_TITLE: TFIBStringField;
        BonusSelectSMETA_TITLE_PPS: TFIBStringField;
        BonusSelectSUMMA: TFIBFloatField;
        BonusSelectSUMMA_PPS: TFIBFloatField;
        MovingsSelectID_MAN_MOVING: TFIBIntegerField;
        GetItems: TpFIBDataSet;
        BonusViewRAISE_NAME: TcxGridDBColumn;
        BonusViewPERCENT: TcxGridDBColumn;
        BonusViewSMETA_TITLE: TcxGridDBColumn;
        BonusViewSMETA_TITLE_PPS: TcxGridDBColumn;
        BonusViewSUMMA: TcxGridDBColumn;
        BonusViewSUMMA_PPS: TcxGridDBColumn;
        BonusSelectPERCENT_STR: TFIBStringField;
        SearchNextButton: TBitBtn;
        DeletePeople: TSpeedButton;
        DeleteMoving: TpFIBQuery;
        MovingsViewID_MAN_MOVING: TcxGridDBBandedColumn;
        CopyIntoBuffer: TpFIBDataSet;
        Key_Session: TqFInvisControl;
        MovingsSelectITEM_NUM: TFIBStringField;
        MovingsViewITEM_NUM: TcxGridDBBandedColumn;
        CopyIntoBufferKEY_SESSION: TFIBBCDField;
        MovingsSelectDATE_BEG: TFIBDateField;
        MovingsSelectDATE_END: TFIBDateField;
        MovingsViewDATE_BEG: TcxGridDBBandedColumn;
        MovingsViewDATE_END: TcxGridDBBandedColumn;
        BonusSelectDATE_BEG: TFIBDateField;
        BonusSelectDATE_END: TFIBDateField;
        BonusViewDATE_BEG: TcxGridDBColumn;
        BonusViewDATE_END: TcxGridDBColumn;
        MovingsSelectNUM_ITEM: TFIBIntegerField;
        MovingsSelectNUM_SUB_ITEM: TFIBIntegerField;
        BonusSelectITEM_NUM: TFIBStringField;
        BonusViewITEM_NUM: TcxGridDBColumn;
        Splitter: TcxSplitter;
        SaveOrder: TpFIBQuery;
        WarnDataset: TpFIBDataSet;
        WarnSource: TDataSource;
        Num_Item: TqFIntControl;
        updHeader: TpFIBQuery;
        procedure IDSROpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure AddGroupExecute(Sender: TObject);
        procedure RefreshSmetaFilterExecute(Sender: TObject);
        procedure AddSmetaExecute(Sender: TObject);
        procedure DeleteActionExecute(Sender: TObject);
        function Accept: Boolean;
        procedure IDSRChange(Sender: TObject);
        procedure AddPeopleExecute(Sender: TObject);
        procedure RefreshMovingsExecute(Sender: TObject);
        procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
        procedure MovingsSelectAfterScroll(DataSet: TDataSet);
        procedure MovingsViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SearchNextButtonClick(Sender: TObject);
        procedure SearchEditKeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure DeletePeopleClick(Sender: TObject);
    private
        Id_Order_Item: Variant;
        IdSessionOk: Boolean;
        Id_Session: Int64;
        Id_Order: Int64;
        Id_Order_Type: Integer;
        OpenBonus: Boolean;

        PeopleFilter: TFMASAppModule;
    public
        InForm: Boolean;

        procedure Prepare(Input: TRxMemoryData); reintroduce;
    end;

const Debug = False;
const FormNewMovings = True;

implementation

{$R *.dfm}

uses UpKernelUnit, IBase, DateUtils, uCommonSp, GlobalSPR,
    qFTools, NagScreenUnit, uNewOkladWarnings;

procedure TfmNewOkladOrder.Prepare(Input: TRxMemoryData);
var
    hnd: Integer;
    Nag: TNagScreen;
    tick1, tick2: Cardinal;
begin
    InForm := True;

    hnd := Input['DBHandle'];
    DB.Handle := TISC_DB_HANDLE(hnd);

    Id_Order := Input['Id_Order'];
    Id_Order_Type := Input['Id_Order_Type'];

    MovingsView.DataController.DataSource := MovingsSource;
    BonusView.DataController.DataSource := BonusSource;

    case Input['Mode'] of
        0:
            begin
                IdSessionOk := False;
                if not IdSessionOk then
                begin
                    IdSessionDS.Close;
                    IdSessionDS.Open;
                    Id_Session := IdSessionDS['Id_Session'];
                    IdSessionOk := True;
                end;

                FromDate.Value := StartOfAMonth(YearOf(Date), MonthOf(Date));
                GetOrderItem.Transaction.StartTransaction;
                GetOrderItem.Open;
                Id_Order_Item := GetOrderItem['Id_Order_Item'];
                GetOrderItem.Transaction.Commit;

                FormControl.Prepare(DB, fmAdd, Null, Null);

                with TFMASAppModuleCreator.Create do
                    PeopleFilter := CreateFMASModule(
                        ExtractFilePath(Application.ExeName) + 'up\', 'up_filter');
            end;
        1, 2:
            begin
                Id_Order_Item := Input['Id_Item'];

                tick1 := GetTickCount;

                Nag := TNagScreen.Create(Self);
                Nag.Show;
                Nag.SetStatusText('Отримання інформації з бази даних...');

                CopyIntoBuffer.Transaction.StartTransaction;
                CopyIntoBuffer.ParamByName('Id_Order_Item').AsVariant := Input['Id_Item'];
                CopyIntoBuffer.Open;
                Id_Session := CopyIntoBuffer['KEY_SESSION'];
                CopyIntoBuffer.Transaction.Commit;
                Nag.Free;

                Key_Session.Value := Id_Session;
                FormControl.Prepare(DB, fmInfo, Null, Null);
                Num_Item.Visible := False;
                SearchEdit.Blocked := False;
                RefreshSmetaFilter.Execute;
                RefreshMovings.Execute;
                AddPeopleButton.Visible := False;
                DeletePeople.Visible := False;
                AddButton.Visible := False;
                AddSmetaButton.Visible := False;
                DeleteButton.Visible := False;

                tick2 := GetTickCount;

                if tick2 - tick1 > 60000 then
                    qFInformDialog('Дані отримані');
            end;
    end;
end;

procedure TfmNewOkladOrder.IDSROpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\ShtatDoc');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['ShowStyle'] := 0;
            FieldValues['Select'] := 1;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_SR'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;


procedure TfmNewOkladOrder.AddGroupExecute(Sender: TObject);
var
    sp: TSprav;
begin
       // создать справочник
    sp := GetSprav('UP\UpSmetaGroup');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['Period_Beg'] := FromDate.Value;
            FieldValues['Period_End'] := EncodeDate(2150, 12, 31);
            Post;
        end;

                // показать справочник и проанализировать результат
        sp.Show;
        sp.Output.First;
        while not sp.Output.Eof do
        begin
            AddSmetaGroup.Transaction.StartTransaction;
            AddSmetaGroup.ParamByName('Id_Order_Item').AsVariant := Id_Order_Item;
            AddSmetaGroup.ParamByName('Id_Group').AsVariant := sp.Output['Id_Group'];
            AddSmetaGroup.ParamByName('Act_Date').AsDate := FromDate.Value;
            AddSmetaGroup.ParamByName('Id_Session').AsInt64 := Id_Session;
            AddSmetaGroup.ExecQuery;
            AddSmetaGroup.Transaction.Commit;
            sp.Output.Next;
        end;
        sp.Free;
        RefreshSmetaFilter.Execute;
    end;
end;

procedure TfmNewOkladOrder.RefreshSmetaFilterExecute(Sender: TObject);
begin
    SelectSmeta.Close;
    SelectSmeta.ParamByName('Id_Order_Item').AsVariant := Id_Order_Item;
    SelectSmeta.ParamByName('Id_Session').AsInt64 := Id_Session;
    SelectSmeta.Open;
end;

procedure TfmNewOkladOrder.AddSmetaExecute(Sender: TObject);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, DB.Handle, FromDate.Value, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        AddSmetaQuery.Transaction.StartTransaction;
        AddSmetaQuery.ParamByName('Id_Order_Item').AsVariant := Id_Order_Item;
        AddSmetaQuery.ParamByName('Id_Smeta').AsVariant := id[0];
        AddSmetaQuery.ParamByName('Id_Session').AsInt64 := Id_Session;
        AddSmetaQuery.ExecQuery;
        AddSmetaQuery.Transaction.Commit;
    end;
    RefreshSmetaFilter.Execute;
end;

procedure TfmNewOkladOrder.DeleteActionExecute(Sender: TObject);
var
    i: Integer;
begin
    if qFConfirm('Ви справді бажаєте вилучити ці бюджети?') then
        for i := 0 to SmetaFilterView.Controller.SelectedRowCount - 1 do
        begin
            DeleteSmetaFilter.Transaction.StartTransaction;
            DeleteSmetaFilter.ParamByName('Id_Order_Item').AsVariant := Id_Order_Item;
            DeleteSmetaFilter.ParamByName('Id_Smeta').AsVariant :=
                SmetaFilterView.Controller.SelectedRows[i].Values[SmetaFilterViewID_SMETA.Index];
            DeleteSmetaFilter.ParamByName('Id_Session').AsInt64 := Id_Session;
            DeleteSmetaFilter.ExecQuery;
            DeleteSmetaFilter.Transaction.Commit;
        end;
    RefreshSmetaFilter.Execute;
end;

function TfmNewOkladOrder.Accept: Boolean;
var
    Nag: TNagScreen;
begin
    if Debug then
    begin
        ShowMessage('Debug mode! Key_Session=' + IntToStr(Id_Session) +
            ', Id_Order=' + IntToStr(Id_Order));
        Exit;
    end;

    if FormControl.Mode <> fmAdd then
    begin
        Result := False;
        Exit;
    end;

    Nag := TNagScreen.Create(Self);
    Nag.Show;
    Nag.SetStatusText('Проведення пунктів, зачекайте...');
    try
        SaveOrder.Transaction.StartTransaction;
        SaveOrder.ParamByName('Key_Session').AsInt64 := Id_Session;
        SaveOrder.ParamByName('Id_Order').AsInt64 := Id_Order;

        SaveOrder.ExecQuery;
        SaveOrder.Transaction.Commit;
        qFInformDialog('Пункт наказу успішно занесено до бази даних');
        InForm := False;
        qFAutoSaveIntoRegistry(Panel1);
        Result := True;
    except on e: Exception do
        begin
            SaveOrder.Transaction.Rollback;
            qFErrorDialog('Виникли помилки: ' + e.Message + '!');
            Nag.Free;
            Result := False;
        end;
    end;
    Nag.Free;
end;


procedure TfmNewOkladOrder.IDSRChange(Sender: TObject);
begin
    if VarIsNUll(IDSR.Value) then Exit;

    AddDefaultSmeta.Transaction.StartTransaction;
    AddDefaultSmeta.ParamByName('Id_Order_Item').Value := Id_Order_Item;
    AddDefaultSmeta.ParamByName('Id_SR').Value := IdSR.Value;
    AddDefaultSmeta.ParamByName('Id_Session').AsInt64 := Id_Session;
    AddDefaultSmeta.ParamByName('From_Date').AsDate := FromDate.Value;
    AddDefaultSmeta.ExecQuery;
    NewOkladsAddRecord.ParamByName('Id_Order_Item').Value := Id_Order_Item;
    NewOkladsAddRecord.ParamByName('From_Date').AsDate := FromDate.Value;
    NewOkladsAddRecord.ParamByName('Id_SR').Value := IDSR.Value;
    NewOkladsAddRecord.ParamByName('Key_Session').AsInt64 := Id_Session;
    NewOkladsAddRecord.ExecQuery;
    AddDefaultSmeta.Transaction.Commit;
    RefreshSmetaFilter.Execute;
end;

procedure TfmNewOkladOrder.AddPeopleExecute(Sender: TObject);
var
    Count: Integer;
    Nag: TNagScreen;
    warnForm: TfmNewOkladsWarnings;
    ParamContainer:TParamsContainer;
    DateEndAfter, Check:Variant;
begin
                        //Инициализация входящих параметров
    PeopleFilter.InParams.Items['AOwner'] := @self;
    PeopleFilter.InParams.Items['DbHandle'] := PInteger(@DB.Handle);
    PeopleFilter.InParams.Items['Id_User'] := PInteger(@Acc_Id_User);
    PeopleFilter.InParams.Items['Id_order_type'] := PInteger(@Id_Order_Type);
    PeopleFilter.InParams.Items['KEY_SESSION'] := PInt64(@Id_session);

    Check:=1;
    DateEndAfter:=FromDate.Value;

    ParamContainer:=TParamsContainer.Create(True);
    ParamContainer.Items['CHECK_DATE_END_AFTER']:=PVariant(@Check);
    ParamContainer.Items['DATE_END_AFTER']:=PVariant(@DateEndAfter);
    (PeopleFilter as IFMASFilterControl).SetFilterParams(ParamContainer);

                        //Запуск фильтра
    (PeopleFilter as IFmasModule).Run;

                        //Получение количества записей которые вернул фильтр
    Count := PInteger(PeopleFilter.OutParams.Items['Count'])^;
        // ShowMessage('Фільтр повернув ' + IntToStr(Count));

    if FormNewMovings then
    begin
        Nag := TNagScreen.Create(Self);
        Nag.Show;
        Nag.SetStatusText('Формування нових переміщень...');

        updHeader.Transaction.StartTransaction;
        updHeader.ParamByName('Key_Session').AsInt64 := Id_Session;
        updHeader.ParamByName('From_Date').AsDate := FromDate.Value;
        updHeader.ExecQuery;
        updHeader.Transaction.Commit;

        NewOkladsCreate.Transaction.StartTransaction;
        NewOkladsCreate.ParamByName('Id_Session').AsInt64 := Id_Session;
        NewOkladsCreate.ParamByName('Id_Order').AsInt64 := Id_Order;
        NewOkladsCreate.ParamByName('Id_Order_Type').AsInt64 := Id_Order_Type;
        NewOkladsCreate.ParamByName('Reason').AsVariant := Reason.Value;
        NewOkladsCreate.ParamByName('Num_Item').AsVariant := Num_Item.Value;
        NewOkladsCreate.ExecQuery;
        NewOkladsCreate.Transaction.Commit;

        Nag.Free;

        RefreshMovings.Execute;

        WarnDataset.Close;
        WarnDataset.ParamByName('Key_Session').AsInt64 := Id_Session;
        WarnDataset.Open;

        if not WarnDataset.IsEmpty then
        begin
            warnForm := TfmNewOkladsWarnings.Create(Self);
            warnForm.WarningsView.DataController.DataSource := WarnSource;
            warnForm.ShowModal;
            warnForm.Free;
        end;
    end
    else
    begin
        ShowMessage('Key_Session=' + IntToStr(Id_Session) + ', Id_Order=' + IntToStr(Id_Order));
    end;
end;

procedure TfmNewOkladOrder.RefreshMovingsExecute(Sender: TObject);
begin
    RefreshSmetaFilter.Execute;
    OpenBonus := False;
    MovingsSelect.Close;
    MovingsSelect.ParamByName('Id_Order_Item').AsInt64 := Id_Order_Item;
    MovingsSelect.ParamByName('Id_Session').AsInt64 := Id_Session;
    MovingsSelect.Open;
    OpenBonus := True;
    BonusSelect.Close;
    MovingsSelectAfterScroll(BonusSelect);
end;

procedure TfmNewOkladOrder.Panel3MouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if (ssCtrl in Shift) and (ssAlt in Shift) and (ssShift in Shift) then
        ShowMessage('Id_Main_Item: ' + IntToStr(Id_Order_Item) +
            ' Id_Session: ' + IntToStr(Id_Session) + ' Id_Order: ' +
            IntToStr(Id_Order) + ' Id_Order_Type: ' +
            IntToStr(Id_Order_Type));
end;

procedure TfmNewOkladOrder.MovingsSelectAfterScroll(DataSet: TDataSet);
begin
    if not OpenBonus then Exit;
    if MovingsSelect.IsEmpty then Exit;

    BonusSelect.Close;
    BonusSelect.ParamByName('Id_Session').AsInt64 := Id_Session;
    BonusSelect.ParamByName('Id_Man_Moving').AsVariant := MovingsSelect['Id_Man_Moving'];
    BonusSelect.Open;
end;

procedure TfmNewOkladOrder.MovingsViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (ssCtrl in Shift) and (ssAlt in Shift) and (ssShift in Shift)
        and (Key = ord('Z')) then
        ShowMessage('Id_Man_Moving: ' +
            VarToStrDef(MovingsSelect['Id_Man_Moving'], 'NULL') +
            ' Key_Session: ' + VarToStrDef(Id_Session, 'NULL'));
end;

procedure TfmNewOkladOrder.SearchNextButtonClick(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Value);
    except
        TN := 0;
    end;

    if TN <> 0 then
        MovingsSelect.Locate('TN', SearchEdit.Value, [loPartialKey])
    else
        MovingsSelect.Locate('FIO', SearchEdit.Value, [loPartialKey,
            loCaseInsensitive]);
end;

procedure TfmNewOkladOrder.SearchEditKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_F8 then SearchNextButton.Click;
end;

procedure TfmNewOkladOrder.DeletePeopleClick(Sender: TObject);
var
    i: Integer;
begin
    if qFConfirm('Ви справді бажаєте вилучити ці переміщення?') then
        for i := 0 to MovingsView.Controller.SelectedRowCount - 1 do
        begin
            DeleteMoving.Transaction.StartTransaction;
            DeleteMoving.ParamByName('Id_Man_Moving').AsVariant :=
                MovingsView.Controller.SelectedRows[i].Values[MovingsViewID_MAN_MOVING.Index];
            DeleteMoving.ParamByName('Id_Session').AsInt64 := Id_Session;
            DeleteMoving.ExecQuery;
            DeleteMoving.Transaction.Commit;
        end;
    RefreshMovings.Execute;
end;

end.

