Unit UpBonusOrderForm;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFormControl, ComCtrls, DB, FIBDataSet, pFIBDataSet, RxMemDS,
    FIBDatabase, pFIBDatabase, ActnList, StdCtrls, Buttons, uFControl,
    uInvisControl, uLabeledFControl, uSpravControl, uCommonSP, uCharControl,
    uDateControl, uFloatControl, ExtCtrls, cxControls, cxSplitter,
    qFTools, uSelectForm, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
    cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uLogicCheck,
    uSimpleCheck, uBoolControl, GlobalSPR, uShtatUtils,
    Math, Ibase, cxLookAndFeelPainters, cxButtons, cxMemo, cxDBEdit,
    cxContainer, cxTextEdit, AppStruClasses, pFibStoredProc, Placemnt, Menus,
    AppEvnts, cxCheckBox, cxMaskEdit, cxDropDownEdit, cxCalendar,
    cxPropertiesStore;

Type
    TfmBonusOrder = Class(TForm)
        KeyList: TActionList;
        WorkDatabase: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        CancelAction: TAction;
        BottomPanel: TPanel;
        OkButton: TBitBtn;
        GetRaiseCalcType: TpFIBDataSet;
        GetRaiseCalcTypeID_CALC_TYPE: TFIBIntegerField;
        GetRaiseCalcTypeCALC_TYPE_NAME: TFIBStringField;
        GetDefaultPercent: TpFIBDataSet;
        GetDefaultPercentRAISE_DEFAULT: TFIBFloatField;
        SelectCurBonus: TpFIBDataSet;
        SelectCurBonusRAISE_FULL_NAME: TFIBStringField;
        SelectCurBonusDATE_BEG: TFIBDateField;
        SelectCurBonusDATE_END: TFIBDateField;
        SelectCurBonusPERCENT: TFIBFloatField;
        SelectCurBonusSUMMA: TFIBFloatField;
        SelectCurBonusID_MAN_BONUS: TFIBIntegerField;
        SelectSovmOklad: TpFIBDataSet;
        Reform_Smet: TAction;
        MainOrderDataSet: TpFIBDataSet;
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
        SmetsDataSet: TpFIBDataSet;
        SmetsDataSource: TDataSource;
        MainOrderDataSource: TDataSource;
        ContentError: TcxStyle;
        FormStorage1: TFormStorage;
        FormPlacement1: TFormPlacement;
        CancelButton: TBitBtn;
        DelPopupMenu: TPopupMenu;
        N1: TMenuItem;
        N2: TMenuItem;
        Panel1: TPanel;
        Panel5: TPanel;
        Panel6: TPanel;
        Panel4: TPanel;
        Panel7: TPanel;
        Panel8: TPanel;
        SmAddButton: TcxButton;
        SmDelButton: TcxButton;
        cxGrid1: TcxGrid;
        SmView: TcxGridDBTableView;
        cxGridDBColumn1: TcxGridDBColumn;
        cxGridDBColumn2: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
        Panel9: TPanel;
        ItemsGrid: TcxGrid;
        ReportDataView: TcxGridDBTableView;
        ReportDataViewDBColumn1: TcxGridDBColumn;
        ReportDataViewDBColumn2: TcxGridDBColumn;
        ReportDataViewDBColumn6: TcxGridDBColumn;
        ReportDataViewDBColumn3: TcxGridDBColumn;
        ReportDataViewDBColumn4: TcxGridDBColumn;
        ReportDataViewDBColumn5: TcxGridDBColumn;
        cxGridLevel5: TcxGridLevel;
        Panel10: TPanel;
        AddPositionButton: TcxButton;
        DelPositionButton: TcxButton;
        EditPositionButton: TcxButton;
        ExtInfoButton: TcxButton;
        ReasonButton: TcxButton;
        ERrorButton: TcxButton;
        IsPercentBox: TGroupBox;
        Panel2: TPanel;
        IdRaise: TqFSpravControl;
        ApplicationEvents1: TApplicationEvents;
        Panel3: TPanel;
        cxSplitter3: TcxSplitter;
        cxGrid2: TcxGrid;
        SalaryView: TcxGridDBTableView;
        cxGridDBColumn3: TcxGridDBColumn;
        cxGridDBColumn4: TcxGridDBColumn;
        cxGridDBColumn5: TcxGridDBColumn;
        cxGridLevel2: TcxGridLevel;
        SalarySmDataSet: TpFIBDataSet;
        SalaryFinanceDataSource: TDataSource;
        SmViewDBColumn1: TcxGridDBColumn;
        SalaryViewDBColumn1: TcxGridDBColumn;
        PageControl1: TPageControl;
        TabSheet1: TTabSheet;
        TabSheet2: TTabSheet;
        Label5: TLabel;
        cxDBTextEdit1: TcxDBTextEdit;
        Label6: TLabel;
        cxDBMemo1: TcxDBMemo;
        Label4: TLabel;
        cxDBTextEdit4: TcxDBTextEdit;
        Label7: TLabel;
        cxDBTextEdit5: TcxDBTextEdit;
        Label8: TLabel;
        cxDBTextEdit6: TcxDBTextEdit;
        Label9: TLabel;
        cxDBTextEdit7: TcxDBTextEdit;
        Panel11: TPanel;
        CurBonusButton: TcxButton;
        Splitter1: TSplitter;
        Splitter2: TSplitter;
        pm1: TPopupMenu;
        N3: TMenuItem;
        SmEditButton: TcxButton;
        PageControl2: TPageControl;
        TabSheet3: TTabSheet;
        TabSheet4: TTabSheet;
        RadioButton1: TRadioButton;
        Percent: TqFFloatControl;
        RadioButton2: TRadioButton;
        Label1: TLabel;
        RaiseCalcType: TLabel;
        cxCheckBox1: TcxCheckBox;
        Label2: TLabel;
        DefaultDateBeg: TcxDateEdit;
        Label3: TLabel;
        DefaultDateEnd: TcxDateEdit;
        BitBtn1: TBitBtn;
        Show_Info: TAction;
        cxClone_Bonus: TcxButton;
        AddPopupMenu: TPopupMenu;
        N4: TMenuItem;
        N5: TMenuItem;
        ReportDataViewDBColumn7: TcxGridDBColumn;
        ReportDataViewDBColumn8: TcxGridDBColumn;
        Label10: TLabel;
        DefaultReason: TcxTextEdit;
        cxPropertiesStore1: TcxPropertiesStore;
        GetReason: TpFIBDataSet;
    ReportDataViewDBColumn9: TcxGridDBColumn;
        Procedure CancelActionExecute(Sender: TObject);
        Procedure IdRaiseOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure IdRaiseChange(Sender: TObject);
        Procedure AddPositionButtonClick(Sender: TObject);
        Procedure ShowBuPanelButtonClick(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure FormDestroy(Sender: TObject);
        Procedure SmAddButtonClick(Sender: TObject);
        Procedure ExtInfoButtonClick(Sender: TObject);
        Procedure OkButtonClick(Sender: TObject);
        Procedure ExtInfoButtonGetDrawParams(Sender: TcxCustomButton;
            AState: TcxButtonState; Var AColor: TColor; AFont: TFont);
        Procedure ReasonButtonClick(Sender: TObject);
        Procedure SmDelButtonClick(Sender: TObject);
        Procedure EditPositionButtonClick(Sender: TObject);
        Procedure RadioButton1Click(Sender: TObject);
        Procedure RadioButton2Click(Sender: TObject);
        Procedure ERrorButtonGetDrawParams(Sender: TcxCustomButton;
            AState: TcxButtonState; Var AColor: TColor; AFont: TFont);
        Procedure ERrorButtonClick(Sender: TObject);
        Procedure DelPositionButtonClick(Sender: TObject);
        Procedure CancelButtonClick(Sender: TObject);
        Procedure N1Click(Sender: TObject);
        Procedure N2Click(Sender: TObject);
        Procedure InsertActionExecute(Sender: TObject);
        Procedure DeleteActionExecute(Sender: TObject);
        Procedure UpdateActionExecute(Sender: TObject);
        Procedure CommitActionExecute(Sender: TObject);
        Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
        Procedure cxCheckBox1PropertiesChange(Sender: TObject);
        Procedure PercentChange(Sender: TObject);
        Procedure OkActionExecute(Sender: TObject);
        Procedure CurBonusButtonClick(Sender: TObject);
        Procedure N3Click(Sender: TObject);
        Procedure ReportDataViewDblClick(Sender: TObject);
        Procedure SmEditButtonClick(Sender: TObject);
        Procedure BitBtn1Click(Sender: TObject);
        Procedure Show_InfoExecute(Sender: TObject);
        Procedure ReportDataViewKeyDown(Sender: TObject; Var Key: Word;
            Shift: TShiftState);
        Procedure cxClone_BonusClick(Sender: TObject);
        Procedure N4Click(Sender: TObject);
        Procedure N5Click(Sender: TObject);
        Procedure ReportDataViewCustomDrawCell(Sender: TcxCustomGridTableView;
            ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
            Var ADone: Boolean);
        Procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    private
        { Private declarations }
        ErrorForm: TForm;
        only_save_in_buff: Integer;
        ItemLinkTo: Integer;
        EditMode: Integer;
        EditIdOrderItem: Int64;
        LocalasFrame: Boolean;
        DefaultReasonStr: String;
        Procedure LoadDataFromFilter;
        Procedure LoadDataFromFilterStaj;
        Procedure GetData;
        Procedure CreateBuffInfoByIdItem;
        Function CheckData: Boolean;
        Function SaveData: Boolean;
        Function AddNewItem(id_item: int64): Boolean;
        Procedure ShowErrors;
        Procedure GetErrorTexts(id_item: int64);
        Procedure SetControls(Enable: Boolean);

    public
        PC: TFMASAppModule;
        Key_session: int64;
        id_user: Integer;
        Id_Calc_Type: Integer; // Тип расчета разбивки надбавок
        dmShtatUtils: TdmShtatUtils;
        DateOrder: TDate;
        IdManBonus, SpType: Integer;
        IdOrder: Int64;
        id_order_type: Integer;
        base_num_item: Integer;
        base_num_sub_item: Integer;
        outer_hwnd: HWND;
        update_raise_info: boolean;
        //
        err_id_order_item: int64;
        Constructor Create(AOwner: TComponent;
            Db_Handle: TISC_DB_HANDLE;
            id_order: int64;
            id_order_type: Integer;
            num_item: Integer;
            num_sub_item: Integer;
            only_save_in_buff: Variant;
            ItemLinkTo: Variant;
            id_order_item: Variant;
            mode: integer;
            ViewKeySession: Variant;
            asFrame: Boolean;
            outer_hwnd: Variant); reintroduce;
        Procedure BonusBuffUpdRaise;
    End;

Implementation

Uses BaseTypes, AccMgmt, UpBonusOrderFormEditSm, UBonusOrderEditExtInfo, FIBQuery,
    UpBonusOrderReasonForm, UpBonusOrderEditPeriod, UpKernelUnit, UBonusOrderShowErrors,
    UBonByMovig, DateUtils;

{$R *.dfm}

Procedure TfmBonusOrder.BonusBuffUpdRaise;
Var
    UpdateRaise: TpFibStoredProc;
Begin
    If MainOrderDataSet.Active And (EditMode In [0, 1]) And (Percent.Value <> 0) Then
    Begin
        If MainOrderDataSet.RecordCount > 0 Then
        Begin
            If update_raise_info Then
            Begin
                UpdateRaise := TpFibStoredProc.Create(self);
                UpdateRaise.Database := WorkDatabase;
                UpdateRaise.Transaction := WriteTransaction;
                WriteTransaction.StartTransaction;
                StartHistory(WriteTransaction);
                UpdateRaise.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_UPD_RAISE';
                UpdateRaise.Prepare;
                UpdateRaise.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
                If RadioButton1.Checked Then
                    UpdateRaise.ParamByName('PERCENT').Value := Percent.Value
                Else
                    UpdateRaise.ParamByName('PERCENT').Value := NULL;
                UpdateRaise.ParamByName('ID_RAISE').Value := IdRaise.Value;
                If (MainOrderDataSet.RecordCount > 0) Then
                    UpdateRaise.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FBN('ID_ORDER_ITEM').AsString)
                Else
                    UpdateRaise.ParamByName('ID_ORDER_ITEM').Value := null;
                UpdateRaise.ExecProc;
                UpdateRaise.Close;
                WriteTransaction.Commit;
                //SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);
                UpdateRaise.Free;
            End;
        End;
        GetData;
    End;
End;

Procedure TfmBonusOrder.CancelActionExecute(Sender: TObject);
Begin
    If Not LocalasFrame
        Then
        Close;
End;

Procedure TfmBonusOrder.IdRaiseOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    sp: TSprav;
Begin
    // создать справочник
    sp := GetSprav('ASUP\SpRaise');
    If sp <> Nil Then
    Begin
        // заполнить входные параметры
        With sp.Input Do
        Begin
            Append;
            FieldValues['DBHandle'] := Integer(WorkDatabase.Handle);
            // модальный показ
            FieldValues['ShowStyle'] := 0;
            // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Raise_Select_Kind'] := 2;
            FieldValues['Actual_Date'] := Date;
            Post;
        End;

        sp.Show;
        If (sp.Output <> Nil) And Not sp.Output.IsEmpty Then
        Begin
            Value := sp.Output['Id_Raise'];
            DisplayText := sp.Output['Name'];
            AddPositionButton.Enabled := true;
            cxClone_Bonus.Enabled := true;
            Try
                GetDefaultPercent.Close;
                GetDefaultPercent.SQLs.SelectSQL.Text := 'select distinct * from SP_RAISE_DEF_PERCENT_S(:ID_RAISE)';
                GetDefaultPercent.ParamByName('ID_RAISE').AsInteger := Value;
                GetDefaultPercent.Open;
                Percent.Value := GetDefaultPercent['RAISE_DEFAULT'];
            Except
            End;
        End;
        sp.Free;
    End;
End;

Procedure TfmBonusOrder.IdRaiseChange(Sender: TObject);
Var
    UpdateRaise: TpFibStoredProc;
Begin
    If varIsNull(IdRaise.Value) Then
        exit;

    GetRaiseCalcType.Close;
    GetRaiseCalcType.ParamByName('ID_RAISE').AsInteger := IdRaise.Value;
    GetRaiseCalcType.ParamByName('CUR_DATE').AsDate := Date;
    GetRaiseCalcType.Open;

    If Not GetRaiseCalcType.IsEmpty
        Then
    Begin
        RaiseCalcType.Caption := GetRaiseCalcTypeCALC_TYPE_NAME.Value;
        Id_Calc_Type := GetRaiseCalcTypeID_CALC_TYPE.Value;
    End
    Else
    Begin
        RaiseCalcType.Caption := 'УВАГА! У довіднику типів надбавок та доплат не вибрано тип розбивки за кошторисом!';
        Id_Calc_Type := 0;
    End;
    GetRaiseCalcType.Close;

    {1 = Надбавка (доплата) без привязки к окладу - можна делать ее сумовой, процентной}
    If (Id_Calc_Type = 1)
        Then
    Begin
        If update_raise_info
            Then
        Begin
            RadioButton1.Checked := false;
            RadioButton2.Checked := true;
        End;

        RadioButton1.Visible := true;
        RadioButton2.Visible := true;


        SmAddButton.Enabled := true;
        SmDelButton.Enabled := true;
        SmEditButton.Enabled := true;
    End;

    {2 = Надбавка с привязкой к окладу (жесткая)  - тольо процентная можно менять размер процента}
    If (Id_Calc_Type = 2)
        Then
    Begin
        If update_raise_info
            Then
        Begin
            RadioButton1.Checked := true;
            RadioButton2.Checked := false;
        End;

        RadioButton1.Visible := true;
        RadioButton2.Visible := false;

        SmAddButton.Enabled := false;
        SmDelButton.Enabled := false;
        SmEditButton.Enabled := false;
    End;

    {3 = Надбавка с привязкой к окладу (гибкая) - может быть процентная, можно менять процент и смету}
    If (Id_Calc_Type = 3)
        Then
    Begin
        If update_raise_info
            Then
        Begin
            RadioButton1.Checked := true;
            RadioButton2.Checked := false;
        End;

        RadioButton1.Visible := true;
        RadioButton2.Visible := false;

        SmAddButton.Enabled := true;
        SmDelButton.Enabled := true;
        SmEditButton.Enabled := true;
    End;

    {4 = расчитывается как процент от посади}
    If (Id_Calc_Type = 4)
        Then
    Begin
        If update_raise_info
            Then
        Begin
            RadioButton1.Checked := true;
            RadioButton2.Checked := false;

        End;

        RadioButton1.Visible := true;
        RadioButton2.Visible := false;

        SmAddButton.Enabled := true;
        SmDelButton.Enabled := true;
        SmEditButton.Enabled := true;

        ExtInfoButton.Enabled := true;
        TabSheet2.TabVisible := true;
    End;

    {5 = расчитывается как процент от оклада}
    If (Id_Calc_Type = 5)
        Then
    Begin
        If update_raise_info
            Then
        Begin
            RadioButton1.Checked := true;
            RadioButton2.Checked := false;

        End;

        RadioButton1.Visible := true;
        RadioButton2.Visible := false;

        SmAddButton.Enabled := true;
        SmDelButton.Enabled := true;
        SmEditButton.Enabled := true;

        ExtInfoButton.Enabled := true;
        TabSheet2.TabVisible := true;
    End;


    {6 = Надбавка % от должности - может быть только процентная, можно менять процент и смету}
    If (Id_Calc_Type = 6)
        Then
    Begin
        If update_raise_info
            Then
        Begin
            RadioButton1.Checked := true;
            RadioButton2.Checked := false;
        End;

        RadioButton1.Visible := true;
        RadioButton2.Visible := false;

        SmAddButton.Enabled := true;
        SmDelButton.Enabled := true;
        SmEditButton.Enabled := true;
    End;

    If update_raise_info
        Then
    Begin
        UpdateRaise := TpFibStoredProc.Create(self);
        UpdateRaise.Database := WorkDatabase;
        UpdateRaise.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        StartHistory(WriteTransaction);
        UpdateRaise.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_UPD_RAISE';
        UpdateRaise.Prepare;
        UpdateRaise.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;

        If RadioButton1.Checked
            Then
        Begin
            UpdateRaise.ParamByName('PERCENT').Value := Percent.Value;
        End
        Else
        Begin
            UpdateRaise.ParamByName('PERCENT').Value := NULL;
        End;
        UpdateRaise.ParamByName('ID_RAISE').Value := IdRaise.Value;

        If (MainOrderDataSet.RecordCount > 0)
            Then
            UpdateRaise.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FBN('ID_ORDER_ITEM').AsString)
        Else
            UpdateRaise.ParamByName('ID_ORDER_ITEM').Value := null;

        UpdateRaise.ExecProc;
        UpdateRaise.Close;
        WriteTransaction.Commit;

        UpdateRaise.Free;
    End
    Else
        update_raise_info := true;

End;

Constructor TfmBonusOrder.Create(AOwner: TComponent; Db_Handle: TISC_DB_HANDLE; id_order: int64;
    id_order_type: integer; num_item: Integer; num_sub_item: Integer;
    only_save_in_buff: Variant; ItemLinkTo: Variant;
    id_order_item: Variant; mode: integer; ViewKeySession: Variant;
    asFrame: Boolean; outer_hwnd: Variant);

Var
    SysInfo: TpFibDataSet;
Begin
    If asFrame
        Then
        Inherited Create(AOwner)
    Else
        Inherited Create(AOwner);
    update_raise_info := false;
    DefaultDateBeg.EditValue := Date;
    DefaultDateEnd.EditValue := MaxDateTime;

    self.LocalasFrame := asFrame;
    self.outer_hwnd := outer_hwnd;
    //Если показываем форму как фрейм
    If self.LocalasFrame
        Then
    Begin
        self.BorderStyle := bsNone;
        ///self.Align      :=alClient;
        self.BorderIcons := [];
        self.Visible := true;
    End;

    WorkDatabase.Handle := Db_Handle;
    ReadTransaction.StartTransaction;
    StartHistory(ReadTransaction);


    SysInfo := TpFibDataSet.Create(self);
    SysInfo.Database := WorkDatabase;
    SysInfo.Transaction := ReadTransaction;
    SysInfo.SelectSQL.Text := 'SELECT * FROM UP_SYS_INI_CONSTS';
    SysInfo.Open;
    SysInfo.FetchAll;
    If (SysInfo.RecordCount > 0)
        Then
    Begin
        If (SysInfo.FieldByName('USE_RAISE_ABSORB').Value <> null)
            Then
        Begin
            If (SysInfo.FieldByName('USE_RAISE_ABSORB').Value = 1)
                Then
                ReportDataViewDBColumn5.Visible := True;
        End;
    End;
    SysInfo.Close;

    SysInfo.SQLs.SelectSQL.Text := 'SELECT DEFAULT_REASON FROM UP_DT_ORDER_TYPE WHERE ID_TYPE = '+VarToStr(Id_Order_Type);
    SysInfo.Open;
    If ((SysInfo.FieldByName('DEFAULT_REASON').Value <> null) and
        (Trim(SysInfo.FieldByName('DEFAULT_REASON').AsString)<>''))
    Then DefaultReasonStr := SysInfo.FieldByName('DEFAULT_REASON').AsString
    Else DefaultReasonStr := '';
    SysInfo.Close;
    SysInfo.Free;


    self.id_order_type := id_order_type;
    self.base_num_item := num_item;
    self.base_num_sub_item := num_sub_item;
    self.idorder := id_order;
    self.only_save_in_buff := 0;

    self.EditMode := Mode;

    If (EditMode <> 3)
        Then
        Key_session := WorkDatabase.Gen_Id('GEN_UP_ID_SESSION', 1)
    Else
    Begin
        If (only_save_in_buff <> null)
            Then
            self.only_save_in_buff := only_save_in_buff;

        If (ItemLinkTo <> null)
            Then
            self.ItemLinkTo := VarAsType(ItemLinkTo, varInt64);

        If (ViewKeySession <> null)
            Then
            self.Key_session := VarAsType(ViewKeySession, varInt64);

        If (id_order_item <> null)
            Then
            self.EditIdOrderItem := VarAsType(id_order_item, varInt64);
    End;

    If (self.EditMode In [1, 2]) //Необходимо сгенерить информацию в буффера
    Then
    Begin
        self.EditIdOrderItem := VarAsType(id_order_item, varInt64);
        CreateBuffInfoByIdItem;
    End;

    If self.EditMode = 2
        Then
    Begin
        BottomPanel.Visible := false;
        Panel10.Visible := false;
        Panel8.Visible := false;
        DefaultDateBeg.Visible := false;
    End;

    //Отображение информации о надбавках в приказе

    GetData;


    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        SetControls(true);

        If (Id_Calc_Type = 4)
            Then
        Begin
            ExtInfoButton.Enabled := true;
            TabSheet2.TabVisible := true;
        End;

    End;

    If (self.EditMode In [1, 2, 3])
        Then
    Begin
        AddPositionButton.Enabled := false;
        DelPositionButton.Enabled := false;
    End;

    If OkButton.HandleAllocated
        Then
        SendMessage(self.outer_hwnd, FMAS_MESS_GET_BUTTON_OK, OkButton.Handle, OkButton.Handle);

    If CancelButton.HandleAllocated
        Then
        SendMessage(self.outer_hwnd, FMAS_MESS_GET_BUTTON_OK, CancelButton.Handle, CancelButton.Handle);
End;

Procedure TfmBonusOrder.AddPositionButtonClick(Sender: TObject);
Var
    P: TParamsContainer;
    CPC: Variant;
    PCV: Variant;
    PAD: Variant;
Begin
    If Percent.Value = null
        Then
    Begin
        agShowMessage('Треба ввести процент надбавки!');
        Exit;
    End;

    //Запускаем фильтр для работы
    Screen.Cursor := crHourGlass;

    Panel11.Visible := true;
    self.Update;
    Application.ProcessMessages;


    PC.InParams.Items['AOwner'] := @self;
    PC.InParams.Items['DbHandle'] := PInteger(@WorkDatabase.Handle);
    PC.InParams.Items['Id_User'] := PInteger(@id_user);
    PC.InParams.Items['Id_order_type'] := PInteger(@id_order_type);
    PC.InParams.Items['KEY_SESSION'] := PInt64(@Key_session);

    //Проверка блока связанного с предустановками фильтра
    //P:=TParamsContainer.Create(true);
    //CPC:=1; PCV:=1; PAD:=StrToDate('01.01.2009');
    //P.Items['CHECK_ID_WORK_REASON']:=PVariant(@CPC);
    //P.Items['ID_WORK_REASON']      :=PVariant(@PCV);
    //P.Items['CHECK_MMDATE_VALUE']  :=PVariant(@CPC);
    //P.Items['MMDATE_VALUE']        :=PVariant(@PAD);
    //(PC as IFMASFilterControl).SetFilterParams(P);

    (PC As IFMASTemporaryDataStorage).ClearTmpData;

    (PC As IFMASModule).Run;

    If (PInteger(PC.OutParams.Items['Count'])^) = 0
        Then
    Begin
        agMessageDlg('Увага!', 'За встановленими настройками фільтра не знайдено жодної позиції! Спробуйте ще раз?', mtInformation, [mbOk]);
    End;

    If (PInteger(PC.OutParams.Items['Count'])^) > 0
        Then
    Begin
        //Загружаем данные из результатов работы фильтра
        LoadDataFromFilter;

        GetData;

        If (MainOrderDataSet.RecordCount > 0)
            Then
        Begin
            SetControls(true);


            If (Id_Calc_Type = 4)
                Then
            Begin
                ExtInfoButton.Enabled := true;
                TabSheet2.TabVisible := true;
            End;

        End;
    End;
    BitBtn1.Click;
    Screen.Cursor := crDefault;
    Panel11.Visible := False;
    Application.ProcessMessages;
End;

Procedure TfmBonusOrder.ShowBuPanelButtonClick(Sender: TObject);
Begin
    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        Panel4.Width := 200;
        Splitter1.Left := Panel4.Left - 1;
    End;
End;

Procedure TfmBonusOrder.FormCreate(Sender: TObject);
Begin
    ErrorForm := TfrmGetErrors.Create(self);

    id_user := AccMgmt.GetUserId;
    With TFMASAppModuleCreator.Create Do
    Begin
        PC := CreateFMASModule(ExtractFilePath(Application.ExeName) + 'up\', 'up_filter');
        If (PC = Nil)
            Then
            agMessageDlg('Увага!', 'Помилка при роботі з модулем up_filter.bpl', mtError, [mbOk]);
    End;
    Panel4.Width := 0;
End;

Procedure TfmBonusOrder.FormDestroy(Sender: TObject);
Var
    ClearSP: TpFibStoredProc;
Begin
    If (self.EditMode <> 3)
        Then
    Begin
        ClearSP := TpFibStoredProc.Create(Nil);
        ClearSP.Database := WorkDatabase;
        ClearSP.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        StartHistory(WriteTransaction);
        ClearSP.StoredProcName := 'UP_KER_CLEAR_TMP_EX';
        ClearSP.Prepare;
        ClearSP.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
        ClearSP.ExecProc;
        WriteTransaction.Commit;
        ClearSP.Close;
        ClearSP.Free;
    End;

    If Assigned(PC) Then
        PC.Free;
    If Assigned(ErrorForm) Then
        ErrorForm.Free;
End;

Procedure TfmBonusOrder.SmAddButtonClick(Sender: TObject);
Var
    InsertSP: TpFibStoredProc;
    id_rec: int64;
    i: Integer;
    id_locate: int64;
Begin
    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        With TfmChangeSmeta.Create(self) Do
        Begin
            ForAll.Visible := True;

            If RadioButton1.Checked
                Then
            Begin
                Summa.Visible := false;
                SummaPPS.Visible := false;
            End;

            If ShowModal = mrOk
                Then
            Begin
                ReportDataView.BeginUpdate;


                If ForAll.Checked
                    Then
                Begin
                    MainOrderDataSet.FetchAll;
                    MainOrderDataSet.First;

                    InsertSP := TpFibStoredProc.Create(self);
                    InsertSP.Database := WorkDatabase;
                    InsertSP.Transaction := WriteTransaction;
                    WriteTransaction.StartTransaction;
                    StartHistory(WriteTransaction);
                    InsertSP.StoredProcName := 'UP_DT_MAN_BONUS_SMET_BUFF_INS';

                    For i := 0 To MainOrderDataSet.RecordCount - 1 Do
                    Begin
                        InsertSP.Prepare;
                        InsertSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
                        InsertSP.ParamByName('ID_SMET').Value := Smeta.Value;
                        InsertSP.ParamByName('ID_SMET_PPS').Value := SmetaPps.Value;
                        InsertSP.ParamByName('SUMMA').Value := Summa.Value;
                        InsertSP.ParamByName('SUMMA_PPS').Value := SummaPPS.Value;
                        InsertSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                        InsertSP.ParamByName('UPDATE_HSUM').Value := 1;
                        InsertSP.ParamByName('CALC').Value := Integer(RadioButton1.Checked);
                        InsertSP.ExecProc;

                        MainOrderDataSet.Next;
                    End;

                    InsertSP.Close;
                    InsertSP.Free;
                    WriteTransaction.Commit;

                    GetData;
                End
                Else
                Begin
                    id_locate := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                    InsertSP := TpFibStoredProc.Create(self);
                    InsertSP.Database := WorkDatabase;
                    InsertSP.Transaction := WriteTransaction;
                    WriteTransaction.StartTransaction;
                    StartHistory(WriteTransaction);
                    InsertSP.StoredProcName := 'UP_DT_MAN_BONUS_SMET_BUFF_INS';
                    InsertSP.Prepare;
                    InsertSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
                    InsertSP.ParamByName('ID_SMET').Value := Smeta.Value;
                    InsertSP.ParamByName('ID_SMET_PPS').Value := SmetaPps.Value;
                    InsertSP.ParamByName('SUMMA').Value := Summa.Value;
                    InsertSP.ParamByName('SUMMA_PPS').Value := SummaPPS.Value;
                    InsertSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                    InsertSP.ParamByName('UPDATE_HSUM').Value := 1;
                    InsertSP.ParamByName('CALC').Value := Integer(RadioButton1.Checked);
                    InsertSP.ExecProc;
                    id_rec := InsertSP.ParamByName('ID_REC').AsInt64;

                    InsertSP.Close;
                    InsertSP.Free;
                    WriteTransaction.Commit;

                    GetData;

                    SmetsDataSet.Locate('ID_REC', id_rec, []);
                End;

                ReportDataView.EndUpdate;
            End;
            Free;
        End;
        SmView.ViewData.Expand(True);
        MainOrderDataSet.Locate('ID_ORDER_ITEM', id_locate, []);
    End;
End;

Procedure TfmBonusOrder.ExtInfoButtonClick(Sender: TObject);
Var
    InsertSP, UpdBuff: TpFibStoredProc;
Begin
    If (Id_Calc_Type = 4) And (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        With TfrmGetExtInfo.Create(self, MainOrderDataSet['Id_Order_Item'], DefaultDateBeg.Date) Do
        Begin
            Department.Value := MainOrderDataSet.FBN('SOVM_ID_DEPARTMENT').Value;
            Department.DisplayText := MainOrderDataSet.FBN('SOVM_DEPARTMENT_NAME').Value;

            If MainOrderDataSet.FBN('SOVM_ID_DEPARTMENT').Value <> null
                Then
                PostSalary.blocked := false;

            PostSalary.Value := MainOrderDataSet.FBN('SOVM_ID_POST_SALARY').Value;
            PostSalary.DisplayText := MainOrderDataSet.FBN('SOVM_NAME_POST').Value;

            If MainOrderDataSet.FBN('SOVM_ID_DEPARTMENT').Value <> null
                Then
                PostSalaryShtat.blocked := false;

            PostSalaryShtat.Value := MainOrderDataSet.FBN('SOVM_ID_POST_SALARY_SHTAT').Value;
            PostSalaryShtat.DisplayText := MainOrderDataSet.FBN('SOVM_NAME_POST_SHTAT').Value;

            If MainOrderDataSet.FBN('SOVM_ID_POST_SALARY').Value <> null
                Then
                TypePost.blocked := false;

            TypePost.Value := MainOrderDataSet.FBN('SOVM_ID_TYPE_POST').Value;
            TypePost.DisplayText := MainOrderDataSet.FBN('TYPE_POST_NAME').Value;

            If MainOrderDataSet.FBN('SOVM_KOEFF_PPS').Value <> null
                Then
                SovmKoeff.Value := MainOrderDataSet.FBN('SOVM_KOEFF_PPS').Value
            Else
                SovmKoeff.Value := 0;

            qFSC_SovmestFIO.Value := MainOrderDataSet.FBN('SOVM_ID_PCARD').Value;
            qFSC_SovmestFIO.DisplayText := MainOrderDataSet.FBN('SOVMEST_FIO').Value;

            ACT_DATE := MainOrderDataSet.FBN('DATE_BEG').AsDateTime;
            If ShowModal = mrOk
                Then
            Begin
                InsertSP := TpFibStoredProc.Create(self);
                InsertSP.Database := WorkDatabase;
                InsertSP.Transaction := WriteTransaction;
                UpdBuff := TpFIBStoredProc.Create(Self);
                UpdBuff.Database := WorkDatabase;
                UpdBuff.Transaction := WriteTransaction;
                WriteTransaction.StartTransaction;
                StartHistory(WriteTransaction);
                try
                InsertSP.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_UPD_SOVM';
                InsertSP.Prepare;
                InsertSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
                InsertSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);

                InsertSP.ParamByName('SOVM_ID_DEPARTMENT').Value := Department.Value;
                InsertSP.ParamByName('SOVM_ID_POST_SALARY').Value := PostSalary.Value;
                InsertSP.ParamByName('SOVM_ID_POST_SALARY_SHTAT').Value := PostSalaryShtat.Value;
                InsertSP.ParamByName('SOVM_ID_TYPE_POST').Value := TypePost.Value;
                InsertSP.ParamByName('SOVM_KOEFF_PPS').Value := SovmKoeff.Value;
                if VarIsNull(qFSC_SovmestFIO.Value) then
                    InsertSP.ParamByName('SOVM_ID_PCARD').Value := Null
                else
                    InsertSP.ParamByName('SOVM_ID_PCARD').Value := qFSC_SovmestFIO.Value;
                InsertSP.ExecProc;
                InsertSP.Close;
                InsertSP.Free;

                UpdBuff.StoredProcName := 'UP_MAN_BONUS_BUFF_RAISE_UPD';
                UpdBuff.Prepare;
                UpdBuff.ParamByName('KEY_SESSION').asInt64 := Self.Key_session;
                UpdBuff.ParamByName('PERCENT').Value := Percent.Value;
                UpdBuff.ParamByName('ID_RAISE').AsInteger := Self.IdRaise.Value;
                UpdBuff.ParamByName('ID_ORDER_ITEM').asInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                UpdBuff.ParamByName('ID_SH_R').Value := ShrId.Value;
                UpdBuff.ExecProc;
                UpdBuff.Close;
                UpdBuff.Free;

                except on E: Exception do ShowMessage(E.Message);
                end;
                WriteTransaction.Commit;

                SendMessage(outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);

                Panel11.Visible := true;
                Application.ProcessMessages;

                GetData;

                Panel11.Visible := false;
                Application.ProcessMessages;

            End;
            Free;
        End;
    End;
    //BitBtn1.Click;
End;

Procedure TfmBonusOrder.LoadDataFromFilter;
Var
    GetFilterDS: TpFibDataSet;
    InsertBuffer: TpFibStoredProc;
    GetId_order_itemSP: TpFibStoredProc;
    i: Integer;
    id_order_item: Int64;
    fam, im, otch: String[20];
    s, s1: String;
Begin
    Try
        GetReason.Close;
        GetReason.SelectSQL.Clear;
        GetReason.SQLs.SelectSQL.Text := 'select reason' +
            '  from sp_raise' +
            ' where current_date between use_date_beg and use_date_end' +
            '   and id_raise=' + IntToStr(IdRaise.Value);
        GetReason.Open;
        GetFilterDS := TpFibDataSet.Create(Nil);
        GetFilterDS.Database := WorkDatabase;
        GetFilterDS.Transaction := ReadTransaction;
        GetFilterDS.SelectSQL.Text := 'SELECT * FROM UP_KER_GET_FILTER_DATA_EX(' + IntToStr(self.Key_session) + ')';
        GetFilterDS.Open;
        GetFilterDS.FetchAll;
        GetFilterDS.First;

        //Если есть данные по фильтру
        If (GetFilterDS.RecordCount > 0)
            Then
        Begin
            InsertBuffer := TpFibStoredProc.Create(Nil);
            InsertBuffer.Database := WorkDatabase;
            InsertBuffer.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            InsertBuffer.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_INS_EX';

            GetId_order_itemSP := TpFibStoredProc.Create(Nil);
            GetId_order_itemSP.Database := WorkDatabase;
            GetId_order_itemSP.Transaction := WriteTransaction;
            GetId_order_itemSP.StoredProcName := 'UP_KER_GET_NEW_ID_ORDER_ITEM';

            For i := 0 To GetFilterDS.RecordCount - 1 Do
            Begin
                //Добавляем данные в буфферные таблицы по шапке
                GetId_order_itemSP.Prepare;
                GetId_order_itemSP.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
                GetId_order_itemSP.ParamByName('NOTE').Value := NULL;
                GetId_order_itemSP.ParamByName('NUM_ITEM').Value := self.base_num_item;
                GetId_order_itemSP.ParamByName('NUM_SUB_ITEM').Value := self.base_num_sub_item;
                GetId_order_itemSP.ParamByName('ID_ORDER').AsInt64 := self.IdOrder;
                GetId_order_itemSP.ParamByName('ID_ORDER_TYPE').Value := self.id_order_type;

                fam := GetFilterDS.FieldByName('FAMILIA').AsString;
                im := GetFilterDS.FieldByName('IMYA').AsString;
                otch := GetFilterDS.FieldByName('OTCHESTVO').AsString;

                If (DefaultReason.Text = '') Then
                Begin
                    If (Not VarIsNull(GetReason.FieldByName('Reason').Value)) And (GetReason['Reason'] <> '') Then
                        GetId_order_itemSP.ParamByName('REASON').Value := GetReason['Reason']
                    Else
                    begin
                        S := fam + ' ' + im[1] + '.' + otch[1] + '.';
                        S1 := DefaultReasonStr;
                        if DefaultReasonStr = ''
                        then
                            GetId_order_itemSP.ParamByName('REASON').Value := 'заява '+ S
                        else
                            GetId_order_itemSP.ParamByName('REASON').Value := StringReplace(S1,'%FIO%',S,[rfReplaceAll]);
                    end
                End
                Else
                    GetId_order_itemSP.ParamByName('REASON').Value := DefaultReason.Text;

                If (self.only_save_in_buff = 1)
                    Then
                    GetId_order_itemSP.ParamByName('LINKTO').Value := Self.ItemLinkTo
                Else
                    GetId_order_itemSP.ParamByName('LINKTO').Value := NULL;

                GetId_order_itemSP.ExecProc;

                id_order_item := GetId_order_itemSP.FieldByName('ID_ITEM').AsInt64;

                //Нарашиваем информацию по номеру подпункта
                self.base_num_sub_item := self.base_num_sub_item + 1;

                //Добавляем данные в буфферные таблицы по основыным данным
                InsertBuffer.Prepare;
                InsertBuffer.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
                InsertBuffer.ParamByName('DATE_BEG').Value := DefaultDateBeg.EditValue;
                InsertBuffer.ParamByName('DATE_END_in').Value := DefaultDateEnd.EditValue;
                InsertBuffer.ParamByName('ID_MAN_MOVING').AsInt64 := StrToInt64(GetFilterDS.FieldByName('ID_MAN_MOVING').AsString);
                InsertBuffer.ParamByName('NUM_ITEM').Value := self.base_num_item;
                InsertBuffer.ParamByName('NUM_SUB_ITEM').Value := self.base_num_sub_item;
                InsertBuffer.ParamByName('PERCENT').Value := Percent.Value;
                InsertBuffer.ParamByName('ID_ORDER_ITEM').asInt64 := id_order_item;
                InsertBuffer.ParamByName('ID_ORDER').AsInt64 := self.IdOrder;
                InsertBuffer.ParamByName('ID_RAISE').Value := IdRaise.Value;
                InsertBuffer.ParamByName('ID_ORDER_TYPE').Value := self.id_order_type;
                InsertBuffer.ParamByName('SOVM_ID_DEPARTMENT').Value := NULL;
                InsertBuffer.ParamByName('SOVM_ID_POST_SALARY').Value := NULL;
                InsertBuffer.ParamByName('SOVM_ID_TYPE_POST').Value := NULL;
                InsertBuffer.ParamByName('SOVM_KOEFF_PPS').Value := NULL;
                InsertBuffer.ParamByName('SOVM_ID_PCARD').Value := NULL;
                InsertBuffer.ParamByName('ID_CALC_TYPE').Value := Id_Calc_Type;
                InsertBuffer.ParamByName('IS_PERCENT').Value := Integer(RadioButton1.checked);
                InsertBuffer.ExecProc;

                GetFilterDS.Next;
            End;

            WriteTransaction.Commit;

            SendMessage(outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);

            GetId_order_itemSP.Close;
            GetId_order_itemSP.Free;

            InsertBuffer.Close;
            InsertBuffer.Free;
        End;
        GetFilterDS.Close;
        GetFilterDS.Free;
    Except On e: exception
        Do
            showmessage(e.message);
    End;
End;


Procedure TfmBonusOrder.GetData;
Begin
    If SmetsDataSet.Active Then
        SmetsDataSet.Close;

    If MainOrderDataSet.Active
        Then
    Begin
        MainOrderDataSet.Close;
    End;

    If (self.EditMode = 0) //Добавление
    Then
    Begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_MAN_BONUS_BUFF_SEL(' + IntToStr(self.Key_session) + ',-1)';
    End;

    If (self.EditMode = 1) //Редактирование
    Then
    Begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_MAN_BONUS_BUFF_SEL(' + IntToStr(self.Key_session) + ',-1)';
    End;

    If (self.EditMode = 2) //Только просмотр
    Then
    Begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_MAN_BONUS_BUFF_SEL(' + IntToStr(self.Key_session) + ',-1)';
    End;

    If (self.EditMode = 3) //Редактирование на основании id_item и key_session
    Then
    Begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_MAN_BONUS_BUFF_SEL(' + IntToStr(self.Key_session) + ',' + IntToStr(self.EditIdOrderItem) + ')';
    End;

    MainOrderDataSet.Open;

    MainOrderDataSet.Last;


    SmetsDataSet.SelectSQL.Text := 'SELECT * FROM  UP_DT_MAN_BONUS_SMET_BUFF_SEL(?ID_ORDER_ITEM,' + IntToStr(self.Key_session) + ')';
    SmetsDataSet.Open;

    SalarySmDataSet.SelectSQL.Text := 'SELECT distinct * FROM UP_DT_MAN_BONUS_BUFF_SM_SEL(?ID_ORDER_ITEM,' + IntToStr(self.Key_session) + ')';
    SalarySmDataSet.Open;

    SmView.ViewData.Expand(true);

    SalaryView.ViewData.Expand(true);
End;
                                               
Procedure TfmBonusOrder.CreateBuffInfoByIdItem;
Var
    StoredProc: TpFibStoredProc;
Begin
    //Создаем новый пункт приказа в буфферной таблице
    StoredProc := TpFibStoredProc.Create(Nil);
    StoredProc.Database := WorkDatabase;
    StoredProc.Transaction := WriteTransaction;
    WriteTransaction.StartTransaction;
    StartHistory(WriteTransaction);
    StoredProc.StoredProcName := 'UP_KER_GET_NEW_ID_ORDER_ITEM_EX';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
    StoredProc.ParamByName('OLD_ID_ORDER_ITEM').AsInt64 := self.EditIdOrderItem;
    StoredProc.ExecProc;
    StoredProc.Close;

    StoredProc.StoredProcName := 'UP_DT_MAN_BONUS_CREATE_INFO';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
    StoredProc.ParamByName('OLD_ID_ORDER_ITEM').AsInt64 := self.EditIdOrderItem;
    StoredProc.ExecProc;

    //ShowMessage(StoredProc.ParamByName('SM_COUNT').AsString);

    WriteTransaction.Commit;

    If (StoredProc.ParamByName('PERCENTOUT').Value = null)
        Then
    Begin
        RadioButton2.Checked := true;
        Percent.Value := null;
    End
    Else
    Begin
        RadioButton1.Checked := true;
        Percent.Value := StoredProc.ParamByName('PERCENTOUT').Value;
    End;

    IdRaise.Value := StoredProc.ParamByName('ID_RAISEOUT').Value;
    IdRaise.DisplayText := StoredProc.ParamByName('RASE_NAME').ASString;

    ID_CALC_TYPE := StoredProc.ParamByName('ID_CALC_TYPE').Value;

    StoredProc.Close;
    StoredProc.Free;
End;

Procedure TfmBonusOrder.OkButtonClick(Sender: TObject);
Begin
    If self.EditMode In [0, 1]
        Then
    Begin
        ERrorButton.Visible := false;
        If CheckData
            Then
        Begin
            If SaveData
                Then
            Begin
                agShowMessage('Інформація по наказу успішно збережена!');
                If Not LocalasFrame
                    Then
                    ModalResult := mrOk
                Else
                    SendMessage(outer_hwnd, FMAS_MESS_SAVE_ITEM_OK, 0, 0);
            End
            Else
            Begin
                agShowMessage('Знайдені помилки під час проведення наказу через ядро системи!');
                ShowErrors;
                GetData;
                MainOrderDataSet.Locate('ID_ORDER_ITEM', err_id_order_item, []);
            End
        End
        Else
            agShowMessage('Знайдені помилки в інформації по наказу!');
    End
    Else
        ModalResult := mrOk;
End;

Function TfmBonusOrder.CheckData: Boolean;
Begin
    //Необходимо проверить на корректность данные в буфферах
    Result := true;
End;

Procedure TfmBonusOrder.ExtInfoButtonGetDrawParams(Sender: TcxCustomButton;
    AState: TcxButtonState; Var AColor: TColor; AFont: TFont);
Begin
    AFont.Size := 6;
End;

Procedure TfmBonusOrder.ReasonButtonClick(Sender: TObject);
Var
    UpdateSP: TpFibStoredProc;
    i: Integer;
Begin
    With TfrmReasonForm.Create(self) Do
    Begin
        Reason.Text := MainOrderDataSet.FieldByName('REASON').AsString;
        Note.Lines.Text := MainOrderDataSet.FieldByName('NOTE').AsString;
        If ShowModal = mrOk
            Then
        Begin
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            If EditForAll.Checked
                Then
            Begin
                MainOrderDataSet.First;
                UpdateSP := TpFibStoredProc.Create(self);
                UpdateSP.Database := WorkDatabase;
                UpdateSP.Transaction := WriteTransaction;

                For i := 0 To MainOrderDataSet.RecordCount - 1 Do
                Begin
                    UpdateSP.StoredProcName := 'UP_DT_ORDER_ITEMS_BUFF_UPD_EINF';
                    UpdateSP.Prepare;
                    UpdateSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
                    UpdateSP.ParamByName('NOTE').Value := Note.Text;
                    UpdateSP.ParamByName('REASON').Value := Reason.Text;
                    UpdateSP.ParamByName('ID_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                    UpdateSP.ExecProc;
                    MainOrderDataSet.Next;
                End;
                UpdateSP.Close;
                UpdateSP.Free;
            End
            Else
            Begin
                UpdateSP := TpFibStoredProc.Create(self);
                UpdateSP.Database := WorkDatabase;
                UpdateSP.Transaction := WriteTransaction;
                UpdateSP.StoredProcName := 'UP_DT_ORDER_ITEMS_BUFF_UPD_EINF';
                UpdateSP.Prepare;
                UpdateSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
                UpdateSP.ParamByName('NOTE').Value := Note.Text;
                UpdateSP.ParamByName('REASON').Value := Reason.Text;
                UpdateSP.ParamByName('ID_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                UpdateSP.ExecProc;
                UpdateSP.Close;
                UpdateSP.Free;
            End;
            WriteTransaction.Commit;

            SendMessage(outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);

            GetData;
        End;
        Free;
    End;
End;

Procedure TfmBonusOrder.SmDelButtonClick(Sender: TObject);
Var
    DeleteSP: TpFibStoredProc;
    IdLocate: Integer;
Begin
    If (SmetsDataSet.RecordCount > 0)
        Then
    Begin
        IdLocate := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
        If (agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes)
            Then
        Begin
            DeleteSP := TpFibStoredProc.Create(self);
            DeleteSP.Database := WorkDatabase;
            DeleteSP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            DeleteSP.StoredProcName := 'UP_DT_MAN_BONUS_SMET_BUFF_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('ID_REC').asInt64 := StrToInt64(SmetsDataSet.FieldByName('ID_REC').AsString);
            DeleteSP.ExecProc;
            DeleteSP.Close;
            DeleteSP.Free;
            WriteTransaction.Commit;
            GetData;
        End;
        SmView.ViewData.Expand(True);
        MainOrderDataSet.Locate('ID_ORDER_ITEM', IdLocate, []);
    End;
End;

Procedure TfmBonusOrder.EditPositionButtonClick(Sender: TObject);
Var
    InsertBuffer, UpdateSP, BufferSP: TpFibStoredProc;
    GetId_order_itemSP, DeleteSP: TpFibStoredProc;
    id_order_item: Int64;
    I: Integer;
Begin
    With TfrmEditPeriod.Create(self) Do
    Begin
        DateBeg.Date := MainOrderDataSet.FieldByName('DATE_BEG').Value;
        DateEnd.Date := MainOrderDataSet.FieldByName('DATE_END').Value;

        If ShowModal = mrOk
            Then
        Begin
            ReportDataView.BeginUpdate;


            If (MainOrderDataSet.RecordCount > 0)
                Then
            Begin
                If ForAll.Checked
                    Then
                Begin
                    MainOrderDataSet.FetchAll;
                    MainOrderDataSet.First;
                    //Удаляем старую информацию
                    WriteTransaction.StartTransaction;
                    StartHistory(WriteTransaction);

                    For i := 0 To MainOrderDataSet.RecordCount - 1 Do
                    Begin
                        //Добавляем новую информацию с новым периодом
                        InsertBuffer := TpFibStoredProc.Create(Nil);
                        InsertBuffer.Database := WorkDatabase;
                        InsertBuffer.Transaction := WriteTransaction;
                        InsertBuffer.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_INS_EX';

                        GetId_order_itemSP := TpFibStoredProc.Create(Nil);
                        GetId_order_itemSP.Database := WorkDatabase;
                        GetId_order_itemSP.Transaction := WriteTransaction;
                        GetId_order_itemSP.StoredProcName := 'UP_KER_GET_NEW_ID_ORDER_ITEM';

                        GetId_order_itemSP.Prepare;
                        GetId_order_itemSP.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
                        GetId_order_itemSP.ParamByName('NOTE').Value := MainOrderDataSet.FieldByName('NOTE').Value;
                        GetId_order_itemSP.ParamByName('NUM_ITEM').Value := MainOrderDataSet.FieldByName('NUM_ITEM').Value;
                        GetId_order_itemSP.ParamByName('NUM_SUB_ITEM').Value := MainOrderDataSet.FieldByName('NUM_SUB_ITEM').Value;
                        GetId_order_itemSP.ParamByName('ID_ORDER').AsInt64 := self.IdOrder;
                        GetId_order_itemSP.ParamByName('ID_ORDER_TYPE').Value := self.id_order_type;
                        GetId_order_itemSP.ParamByName('REASON').Value := MainOrderDataSet.FieldByName('REASON').Value;
                        GetId_order_itemSP.ParamByName('LINKTO').Value := NULL;
                        GetId_order_itemSP.ExecProc;

                        id_order_item := GetId_order_itemSP.FieldByName('ID_ITEM').AsInt64;

                        //Нарашиваем информацию по номеру подпункта
                        self.base_num_sub_item := self.base_num_sub_item + 1;

                        //Добавляем данные в буфферные таблицы по основыным данным
                        InsertBuffer.Prepare;
                        InsertBuffer.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
                        InsertBuffer.ParamByName('DATE_BEG').Value := DateBeg.Date;
                        InsertBuffer.ParamByName('DATE_END_in').Value := DateEnd.Date;
                        InsertBuffer.ParamByName('ID_MAN_MOVING').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_MAN_MOVING').AsString);
                        InsertBuffer.ParamByName('GET_SM_DETAILS_FROM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                        InsertBuffer.ParamByName('NUM_ITEM').Value := MainOrderDataSet.FieldByName('NUM_ITEM').Value;
                        InsertBuffer.ParamByName('NUM_SUB_ITEM').Value := MainOrderDataSet.FieldByName('NUM_SUB_ITEM').Value;
                        InsertBuffer.ParamByName('PERCENT').Value := Percent.Value;
                        InsertBuffer.ParamByName('ID_ORDER_ITEM').asInt64 := id_order_item;
                        InsertBuffer.ParamByName('ID_ORDER').AsInt64 := self.IdOrder;
                        InsertBuffer.ParamByName('ID_RAISE').Value := IdRaise.Value;
                        InsertBuffer.ParamByName('ID_ORDER_TYPE').Value := self.id_order_type;
                        InsertBuffer.ParamByName('SOVM_ID_DEPARTMENT').Value := MainOrderDataSet.FieldByName('SOVM_ID_DEPARTMENT').Value;
                        InsertBuffer.ParamByName('SOVM_ID_POST_SALARY').Value := MainOrderDataSet.FieldByName('SOVM_ID_POST_SALARY').Value;
                        InsertBuffer.ParamByName('SOVM_ID_TYPE_POST').Value := MainOrderDataSet.FieldByName('SOVM_ID_TYPE_POST').Value;
                        InsertBuffer.ParamByName('SOVM_KOEFF_PPS').Value := MainOrderDataSet.FieldByName('SOVM_KOEFF_PPS').Value;
                        InsertBuffer.ParamByName('SOVM_ID_PCARD').Value := MainOrderDataSet.FieldByName('SOVM_ID_PCARD').Value;
                        InsertBuffer.ParamByName('ID_CALC_TYPE').Value := Id_Calc_Type;
                        InsertBuffer.ParamByName('IS_PERCENT').Value := Integer(RadioButton1.checked);
                        InsertBuffer.ExecProc;
                        InsertBuffer.Close;
                        InsertBuffer.Free;
                        GetId_order_itemSP.Close;
                        GetId_order_itemSP.Free;

                        DeleteSP := TpFibStoredProc.Create(self);
                        DeleteSP.Database := WorkDatabase;
                        DeleteSP.Transaction := WriteTransaction;
                        DeleteSP.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_ITEM_DEL';
                        DeleteSP.Prepare;
                        DeleteSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
                        DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                        DeleteSP.ExecProc;
                        DeleteSP.Close;
                        DeleteSP.Free;

                        If Self.EditMode > 0
                            Then
                        Begin
                            BufferSP := TpFibStoredproc.Create(self);
                            BufferSP.Database := WorkDatabase;
                            BufferSP.Transaction := WriteTransaction;
                            WriteTransaction.StartTransaction;
                            BufferSP.StoredProcName := 'UP_KER_SAVE_DROP_ITEM';
                            BufferSP.Prepare;
                            BufferSP.ParamByName('ID_CANCEL_ORDER_ITEM').asInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                            BufferSP.ParamByName('DO_RENUM').Value := 0;
                            BufferSP.ExecProc;
                        End;


                        MainOrderDataSet.Next;
                    End;
                    WriteTransaction.Commit;
                    SendMessage(outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);
                    GetData;
                End
                Else
                Begin
                    //Удаляем старую информацию
                    WriteTransaction.StartTransaction;
                    StartHistory(WriteTransaction);

                    //Добавляем новую информацию с новым периодом
                    InsertBuffer := TpFibStoredProc.Create(Nil);
                    InsertBuffer.Database := WorkDatabase;
                    InsertBuffer.Transaction := WriteTransaction;
                    InsertBuffer.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_INS_EX';

                    GetId_order_itemSP := TpFibStoredProc.Create(Nil);
                    GetId_order_itemSP.Database := WorkDatabase;
                    GetId_order_itemSP.Transaction := WriteTransaction;
                    GetId_order_itemSP.StoredProcName := 'UP_KER_GET_NEW_ID_ORDER_ITEM';

                    GetId_order_itemSP.Prepare;
                    GetId_order_itemSP.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
                    GetId_order_itemSP.ParamByName('NOTE').Value := MainOrderDataSet.FieldByName('NOTE').Value;
                    GetId_order_itemSP.ParamByName('NUM_ITEM').Value := MainOrderDataSet.FieldByName('NUM_ITEM').Value;
                    GetId_order_itemSP.ParamByName('NUM_SUB_ITEM').Value := MainOrderDataSet.FieldByName('NUM_SUB_ITEM').Value;
                    GetId_order_itemSP.ParamByName('ID_ORDER').AsInt64 := self.IdOrder;
                    GetId_order_itemSP.ParamByName('ID_ORDER_TYPE').Value := self.id_order_type;
                    GetId_order_itemSP.ParamByName('REASON').Value := MainOrderDataSet.FieldByName('REASON').Value;
                    GetId_order_itemSP.ParamByName('LINKTO').Value := NULL;
                    GetId_order_itemSP.ExecProc;

                    id_order_item := GetId_order_itemSP.FieldByName('ID_ITEM').AsInt64;

                    WriteTransaction.CommitRetaining;

                    //Нарашиваем информацию по номеру подпункта
                    self.base_num_sub_item := self.base_num_sub_item + 1;

                    //Добавляем данные в буфферные таблицы по основыным данным
                    InsertBuffer.Prepare;
                    InsertBuffer.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
                    InsertBuffer.ParamByName('DATE_BEG').Value := DateBeg.Date;
                    InsertBuffer.ParamByName('DATE_END_in').Value := DateEnd.Date;
                    InsertBuffer.ParamByName('ID_MAN_MOVING').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_MAN_MOVING').AsString);
                    InsertBuffer.ParamByName('GET_SM_DETAILS_FROM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                    InsertBuffer.ParamByName('NUM_ITEM').Value := MainOrderDataSet.FieldByName('NUM_ITEM').Value;
                    InsertBuffer.ParamByName('NUM_SUB_ITEM').Value := MainOrderDataSet.FieldByName('NUM_SUB_ITEM').Value;
                    InsertBuffer.ParamByName('PERCENT').Value := Percent.Value;
                    InsertBuffer.ParamByName('ID_ORDER_ITEM').asInt64 := id_order_item;
                    InsertBuffer.ParamByName('ID_ORDER').AsInt64 := self.IdOrder;
                    InsertBuffer.ParamByName('ID_RAISE').Value := IdRaise.Value;
                    InsertBuffer.ParamByName('ID_ORDER_TYPE').Value := self.id_order_type;
                    InsertBuffer.ParamByName('SOVM_ID_DEPARTMENT').Value := MainOrderDataSet.FieldByName('SOVM_ID_DEPARTMENT').Value;
                    InsertBuffer.ParamByName('SOVM_ID_POST_SALARY').Value := MainOrderDataSet.FieldByName('SOVM_ID_POST_SALARY').Value;
                    InsertBuffer.ParamByName('SOVM_ID_TYPE_POST').Value := MainOrderDataSet.FieldByName('SOVM_ID_TYPE_POST').Value;
                    InsertBuffer.ParamByName('SOVM_KOEFF_PPS').Value := MainOrderDataSet.FieldByName('SOVM_KOEFF_PPS').Value;
                    InsertBuffer.ParamByName('SOVM_ID_PCARD').Value := MainOrderDataSet.FieldByName('SOVM_ID_PCARD').Value;
                    InsertBuffer.ParamByName('ID_CALC_TYPE').Value := Id_Calc_Type;
                    InsertBuffer.ParamByName('IS_PERCENT').Value := Integer(RadioButton1.checked);
                    InsertBuffer.ExecProc;

                    DeleteSP := TpFibStoredProc.Create(self);
                    DeleteSP.Database := WorkDatabase;
                    DeleteSP.Transaction := WriteTransaction;
                    DeleteSP.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_ITEM_DEL';
                    DeleteSP.Prepare;
                    DeleteSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
                    DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                    DeleteSP.ExecProc;
                    DeleteSP.Close;
                    DeleteSP.Free;

                    If Self.EditMode > 0
                        Then
                    Begin
                        BufferSP := TpFibStoredproc.Create(self);
                        BufferSP.Database := WorkDatabase;
                        BufferSP.Transaction := WriteTransaction;
                        WriteTransaction.StartTransaction;
                        BufferSP.StoredProcName := 'UP_KER_SAVE_DROP_ITEM';
                        BufferSP.Prepare;
                        BufferSP.ParamByName('ID_CANCEL_ORDER_ITEM').asInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                        BufferSP.ParamByName('DO_RENUM').Value := 0;
                        BufferSP.ExecProc;
                    End;

                    WriteTransaction.Commit;

                    InsertBuffer.Close;
                    InsertBuffer.Free;
                    GetId_order_itemSP.Close;
                    GetId_order_itemSP.Free;

                    SendMessage(outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);

                    GetData;
                End;
            End;

            {if ForAll.Checked
            then begin
                      MainOrderDataSet.FetchAll;
                      MainOrderDataSet.First;
                      for i:=0 to MainOrderDataSet.RecordCount-1 do
                      begin
                            UpdateSP:=TpFibStoredProc.Create(self);
                            UpdateSP.Database    :=WorkDatabase;
                            UpdateSP.Transaction :=WriteTransaction;
                            WriteTransaction.StartTransaction;
                            StartHistory(WriteTransaction);
                            UpdateSP.StoredProcName:='UP_DT_MAN_BONUS_BUFF_UPD_DATES';
                            UpdateSP.Prepare;
                            UpdateSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                            UpdateSP.ParamByName('DATE_BEG').Value       :=DateBeg.Date;
                            UpdateSP.ParamByName('DATE_END').Value       :=DateEnd.Date;
                            UpdateSP.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                            UpdateSP.ExecProc;
                            UpdateSP.Close;
                            UpdateSP.Free;
                            WriteTransaction.Commit;
                            MainOrderDataSet.Next;
                      end;

                      SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);

                      GetData;
            end
            else begin
                      UpdateSP:=TpFibStoredProc.Create(self);
                      UpdateSP.Database    :=WorkDatabase;
                      UpdateSP.Transaction :=WriteTransaction;
                      WriteTransaction.StartTransaction;
                      StartHistory(WriteTransaction);
                      UpdateSP.StoredProcName:='UP_DT_MAN_BONUS_BUFF_UPD_DATES';
                      UpdateSP.Prepare;
                      UpdateSP.ParamByName('KEY_SESSION').asInt64  :=self.Key_session;
                      UpdateSP.ParamByName('DATE_BEG').Value       :=DateBeg.Date;
                      UpdateSP.ParamByName('DATE_END').Value       :=DateEnd.Date;
                      UpdateSP.ParamByName('ID_ORDER_ITEM').AsInt64:=StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                      UpdateSP.ExecProc;
                      UpdateSP.Close;
                      UpdateSP.Free;
                      WriteTransaction.Commit;

                      SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);

                      GetData;
            end;}

            ReportDataView.EndUpdate;
        End;
        Free;
    End;
    bitbtn1.Click;
End;

Function TfmBonusOrder.SaveData: Boolean;
Var
    i, j: Integer;
    ExistErrors: Boolean;
    GetShadowItems: TpFibDataSet;
    ExistsShadowErorrs: Boolean;
Begin
    ExistErrors := false;
    ExistsShadowErorrs := false;
    err_id_order_item := -9999;
    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        WriteTransaction.StartTransaction;
        StartHistory(WriteTransaction);
        MainOrderDataSet.First;

        For i := 0 To MainOrderDataSet.RecordCount - 1 Do
        Begin
            If AddNewItem(VarAsType(MainOrderDataSet['ID_ORDER_ITEM'], varInt64)) //Сохраняем информацию по пункту
            Then
            Begin
                //Добавляем теневые пункты
                GetShadowItems := TpFibDataSet.Create(self);
                GetShadowItems.Database := WorkDatabase;
                GetShadowItems.Transaction := ReadTransaction;
                GetShadowItems.SelectSQL.Text := 'SELECT ID_ITEM FROM UP_DT_ORDER_ITEMS_BUFF WHERE LINKTO=' + MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString;
                GetShadowItems.Open;
                GetShadowItems.FetchAll;
                GetShadowItems.First;
                For j := 0 To GetShadowItems.RecordCount - 1 Do
                Begin
                    If AddNewItem(StrToInt64(GetShadowItems.FieldByName('ID_ITEM').asString)) //Сохраняем информацию по пункту
                    Then
                    Begin

                    End
                    Else
                    Begin
                        //Выводим сообщения об ошибках
                        err_id_order_item := StrToInt64(GetShadowItems.FieldByName('ID_ITEM').asString);
                        GetErrorTexts(StrToInt64(GetShadowItems.FieldByName('ID_ITEM').asString));
                        ExistsShadowErorrs := true;
                        Break;
                    End;
                    GetShadowItems.Next;
                End;

                If ExistsShadowErorrs
                    Then
                Begin
                    ExistErrors := true;
                    break;
                End;
            End
            Else
            Begin
                //Выводим сообщения об ошибках
                err_id_order_item := VarAsType(MainOrderDataSet['ID_ORDER_ITEM'], varInt64);
                GetErrorTexts(VarAsType(MainOrderDataSet['ID_ORDER_ITEM'], varInt64));
                ExistErrors := true;
                Break;
            End;
            MainOrderDataSet.Next;
        End;


        If ExistErrors
            Then
            WriteTransaction.Rollback
        Else
        Begin
            WriteTransaction.Commit;
            If self.EditMode = 0 Then
                self.EditMode := 1;
        End;
    End;

    Result := Not ExistErrors;
End;

Function TfmBonusOrder.AddNewItem(id_item: Int64): Boolean;
Var
    AddStru: UP_KERNEL_MODE_STRUCTURE;
Begin
    AddStru.AOWNER := self;
    AddStru.ID_ORDER := self.IdOrder;
    AddStru.ID_ORDER_ITEM_IN := id_item;
    AddStru.KEY_SESSION := self.Key_session;
    AddStru.DBHANDLE := WorkDatabase.Handle;
    AddStru.TRHANDLE := WriteTransaction.Handle;
    Result := UpKernelDo(@AddStru);
End;

Procedure TfmBonusOrder.ShowErrors;
Begin
    ERrorButton.Visible := true;

    If Not Assigned(ErrorForm)
        Then
    Begin
        ErrorForm := TfrmGetErrors.Create(self);
    End;
    //Показываем ошибки по пункту
    ErrorForm.ShowModal;
End;

Procedure TfmBonusOrder.RadioButton1Click(Sender: TObject);
Begin
    BonusBuffUpdRaise;
End;

Procedure TfmBonusOrder.RadioButton2Click(Sender: TObject);
Begin
    BonusBuffUpdRaise;
End;

Procedure TfmBonusOrder.ERrorButtonGetDrawParams(Sender: TcxCustomButton;
    AState: TcxButtonState; Var AColor: TColor; AFont: TFont);
Begin
    AFont.Color := clRed;
    AFont.Style := [fsBold];
End;

Procedure TfmBonusOrder.GetErrorTexts(id_item: int64);
Var
    GetErrorTextsDS: TpFibDataSet;
Begin
    GetErrorTextsDS := TpFibDataSet.Create(self);
    GetErrorTextsDS.Database := WorkDatabase;
    GetErrorTextsDS.Transaction := ReadTransaction;
    GetErrorTextsDS.SelectSQL.Text := ' SELECT * FROM UP_KER_UTILS_GET_ORDER_ERRORS('
        + IntToStr(self.Key_session) + ',' + IntToStr(Id_item) + ') ';


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

Procedure TfmBonusOrder.ERrorButtonClick(Sender: TObject);
Begin
    If Assigned(ErrorForm) Then
        ErrorForm.ShowModal;
End;

Procedure TfmBonusOrder.DelPositionButtonClick(Sender: TObject);
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
            DeleteSP.Database := WorkDatabase;
            DeleteSP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            DeleteSP.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_ITEM_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
            DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
            DeleteSP.ExecProc;
            DeleteSP.Close;
            DeleteSP.Free;
            WriteTransaction.Commit;
            GetData;

            If (MainOrderDataSet.RecordCount = 0)
                Then
            Begin
                SetControls(false);
            End;
        End;
    End;
End;

Procedure TfmBonusOrder.SetControls(Enable: Boolean);
Begin
    OkButton.Enabled := Enable;
    DelPositionButton.Enabled := Enable;
    EditPositionButton.Enabled := Enable;
    ReasonButton.Enabled := Enable;
    CurBonusButton.Enabled := Enable;
End;

Procedure TfmBonusOrder.CancelButtonClick(Sender: TObject);
Begin
    If LocalasFrame
        Then
        SendMessage(outer_hwnd, FMAS_MESS_CLOSE_FRAME, 0, 0)
    Else
        Close;
End;

Procedure TfmBonusOrder.N1Click(Sender: TObject);
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
            DeleteSP.Database := WorkDatabase;
            DeleteSP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            DeleteSP.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_ITEM_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
            DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
            DeleteSP.ExecProc;
            DeleteSP.Close;
            DeleteSP.Free;
            WriteTransaction.Commit;
            GetData;

            If (MainOrderDataSet.RecordCount = 0)
                Then
            Begin
                SetControls(false);
            End;
        End;
    End;
End;

Procedure TfmBonusOrder.N2Click(Sender: TObject);
Var
    DeleteSP: TpFibStoredProc;
    I: Integer;
Begin
    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        If (agMessageDlg('Увага!', 'Ви хочете видалити всі записи?', mtConfirmation, [mbYes, mbNo]) = mrYes)
            Then
        Begin
            MainOrderDataSet.First;
            For i := 0 To MainOrderDataSet.RecordCount - 1 Do
            Begin
                DeleteSP := TpFibStoredProc.Create(self);
                DeleteSP.Database := WorkDatabase;
                DeleteSP.Transaction := WriteTransaction;
                WriteTransaction.StartTransaction;
                StartHistory(WriteTransaction);
                DeleteSP.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_ITEM_DEL';
                DeleteSP.Prepare;
                DeleteSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
                DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                DeleteSP.ExecProc;
                DeleteSP.Close;
                DeleteSP.Free;
                WriteTransaction.Commit;
                MainOrderDataSet.Next;
            End;

            GetData;

            If (MainOrderDataSet.RecordCount = 0)
                Then
            Begin
                SetControls(false);
            End;
        End;
    End;
End;

Procedure TfmBonusOrder.InsertActionExecute(Sender: TObject);
Begin
    If AddPositionButton.Enabled
        Then
        AddPositionButton.OnClick(self);
End;

Procedure TfmBonusOrder.DeleteActionExecute(Sender: TObject);
Begin
    If DelPositionButton.Enabled
        Then
        DelPositionButton.OnClick(self);
End;

Procedure TfmBonusOrder.UpdateActionExecute(Sender: TObject);
Begin
    If EditPositionButton.Enabled
        Then
        EditPositionButton.OnClick(self);
End;

Procedure TfmBonusOrder.CommitActionExecute(Sender: TObject);
Begin
    If OkButton.Enabled
        Then
        OkButton.OnClick(self);
End;

Procedure TfmBonusOrder.FormClose(Sender: TObject;
    Var Action: TCloseAction);
Begin
    If Assigned(PC)
        Then
        (PC As IFMASTemporaryDataStorage).ClearTmpData;

    Action := caFree;
End;

Procedure TfmBonusOrder.cxCheckBox1PropertiesChange(Sender: TObject);
Begin
    Panel3.Visible := cxCheckBox1.Checked;
    cxSplitter3.Visible := cxCheckBox1.Checked;

    If Panel3.Visible
        Then
        cxSplitter3.Top := Panel3.Top - 1;

    KYVSaveIntoRegistry('BonusOrderShowBudget', IntToStr(Integer(cxCheckBox1.Checked)), GetUserId);
End;

Procedure TfmBonusOrder.PercentChange(Sender: TObject);
Begin
    BonusBuffUpdRaise;
End;

Procedure TfmBonusOrder.OkActionExecute(Sender: TObject);
Var
    S: String;
    Res: Variant;
Begin
    IdRaise.OnOpenSprav(IdRaise, Res, S);
    IdRaise.Value := Res;
    IdRaise.DisplayText := S;
End;

Procedure TfmBonusOrder.CurBonusButtonClick(Sender: TObject);
Begin
    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        With TfrmMovingBonuses.Create(self, StrToInt64(MainOrderDataSet.FieldByName('ID_MAN_MOVING').AsString), 1, 0, 0) Do
        Begin
            ShowModal;
            Free;
        End;
    End;
End;

Procedure TfmBonusOrder.N3Click(Sender: TObject);
Begin
    If MainOrderDataSet.FieldByName('ABSORBE').AsString = 'Так'
        Then
    Begin
        If (MainOrderDataSet.RecordCount > 0)
            Then
        Begin
            With TfrmMovingBonuses.Create(self, 0, 2, StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString), self.Key_session) Do
            Begin
                ShowModal;
                Free;
                GetData;
            End;
        End;
    End
    Else
        ShowMessage('Ця інструкція не поглинає інші внадбавки/доплати!');
End;

Procedure TfmBonusOrder.ReportDataViewDblClick(Sender: TObject);
Begin
    If MainOrderDataSet.FieldByName('ABSORBE').AsString = 'Так'
        Then
    Begin
        If (MainOrderDataSet.RecordCount > 0)
            Then
        Begin
            With TfrmMovingBonuses.Create(self, 0, 2, StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString), self.Key_session) Do
            Begin
                ShowModal;
                Free;
                GetData;
            End;
        End;
    End;
End;

Procedure TfmBonusOrder.SmEditButtonClick(Sender: TObject);
Var
    DeleteSP, InsertSP: TpFibStoredProc;
    id_rec: int64;
    Id_Locate: Integer;
Begin
    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        If (SmetsDataSet.RecordCount > 0)
            Then
        Begin
            With TfmChangeSmeta.Create(self) Do
            Begin
                If RadioButton1.Checked
                    Then
                Begin
                    Summa.Visible := false;
                End;

                NumSm.Value := SmetsDataSet.FieldByName('SM_KOD').Value;
                Smeta.Value := SmetsDataSet.FieldByName('ID_SMET').Value;
                Smeta.DisplayText := SmetsDataSet.FieldByName('SM_TITLE').Value;

                NumSmPps.Value := SmetsDataSet.FieldByName('SM_PPS').Value;
                SmetaPps.Value := SmetsDataSet.FieldByName('ID_SMET_PPS').Value;
                SmetaPps.DisplayText := SmetsDataSet.FieldByName('SM_PPS_TITLE').Value;
                Summa.Value := SmetsDataSet.FieldByName('SUMMA').Value;
                SummaPPS.Value := SmetsDataSet.FieldByName('SUMMA_PPS').Value;
                Id_Locate := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                If ShowModal = mrOk
                    Then
                Begin
                    DeleteSP := TpFibStoredProc.Create(self);
                    DeleteSP.Database := WorkDatabase;
                    DeleteSP.Transaction := WriteTransaction;
                    WriteTransaction.StartTransaction;
                    StartHistory(WriteTransaction);
                    DeleteSP.StoredProcName := 'UP_DT_MAN_BONUS_SMET_BUFF_DEL';
                    DeleteSP.Prepare;
                    DeleteSP.ParamByName('ID_REC').asInt64 := StrToInt64(SmetsDataSet.FieldByName('ID_REC').AsString);
                    DeleteSP.ExecProc;
                    DeleteSP.Close;
                    DeleteSP.Free;

                    InsertSP := TpFibStoredProc.Create(self);
                    InsertSP.Database := WorkDatabase;
                    InsertSP.Transaction := WriteTransaction;
                    InsertSP.StoredProcName := 'UP_DT_MAN_BONUS_SMET_BUFF_INS';
                    InsertSP.Prepare;
                    InsertSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
                    InsertSP.ParamByName('ID_SMET').Value := Smeta.Value;
                    InsertSP.ParamByName('ID_SMET_PPS').Value := SmetaPps.Value;
                    InsertSP.ParamByName('SUMMA').Value := Summa.Value;
                    InsertSP.ParamByName('SUMMA_PPS').Value := SummaPPS.Value;
                    InsertSP.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                    InsertSP.ParamByName('UPDATE_HSUM').Value := 1;
                    InsertSP.ParamByName('CALC').Value := Integer(RadioButton1.Checked);
                    InsertSP.ExecProc;
                    id_rec := InsertSP.ParamByName('ID_REC').AsInt64;

                    InsertSP.Close;
                    InsertSP.Free;
                    WriteTransaction.Commit;

                    GetData;

                    SmetsDataSet.Locate('ID_REC', id_rec, []);
                End;
                Free;
            End;
        End;
        SmView.ViewData.Expand(True);
        MainOrderDataSet.Locate('ID_ORDER_ITEM', Id_Locate, []);
    End;
End;

Procedure TfmBonusOrder.BitBtn1Click(Sender: TObject);
Begin
    BonusBuffUpdRaise;
End;

Procedure TfmBonusOrder.Show_InfoExecute(Sender: TObject);
Begin
    ShowInfo(MainOrderDataSet);
End;

Procedure TfmBonusOrder.ReportDataViewKeyDown(Sender: TObject;
    Var Key: Word; Shift: TShiftState);
Begin
    If ReportDataView.ItemCount > 0 Then
        If ((Key = VK_F12) And (ssShift In Shift))
            Then
        Begin
            ShowMessage('Id_Session = ' + IntToStr(self.Key_session));
            ShowInfo(MainOrderDataSet);

        End;
End;

Procedure TfmBonusOrder.cxClone_BonusClick(Sender: TObject);
Var
    id_order_old: int64;
    StoredProc: TpFibStoredProc;
    // y, m, d: Word;
    mes: String;
Begin
    // Panel12.Visible := true;
    Screen.Cursor := crHourGlass;
    self.Update;
    Application.ProcessMessages;

    id_order_old := UpKernelUnit.GetOrderByRegInfo(self, WorkDatabase.Handle);
    If id_order_old <> -1 Then
    Begin
        //Создаем новый пункт приказа в буфферной таблице
        StoredProc := TpFibStoredProc.Create(Nil);
        StoredProc.Database := WorkDatabase;
        StoredProc.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        StartHistory(WriteTransaction);
        StoredProc.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_CLONE';
        StoredProc.Prepare;
        StoredProc.ParamByName('OLD_ID_ORDER').AsInt64 := id_order_old;
        StoredProc.ParamByName('ID_RAISE').AsInt64 := IdRaise.Value;
        StoredProc.ParamByName('ID_ORDER_TYPE').AsInt64 := self.id_order_type;
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
        StoredProc.ParamByName('NEW_ID_ORDER').AsInt64 := self.IdOrder;

        {DecodeDate(Date, y, m, d);
        StoredProc.ParamByName('DATE_BEG_NEW').Value := EncodeDate(y, m, 1);
        d := DaysInAMonth(y, m);
        StoredProc.ParamByName('DATE_END_NEW').Value := EncodeDate(y, m, d);
        }
        StoredProc.ParamByName('DATE_BEG_NEW').Value := DefaultDateBeg.Date;
        StoredProc.ParamByName('DATE_END_NEW').Value := DefaultDateEnd.Date;

        StoredProc.ExecProc;

        WriteTransaction.Commit;

        If (Not VarIsNull(StoredProc.ParamByName('ID_ITEM').Value))
            Then
        Begin
            If (StoredProc.ParamByName('PERCENTOUT').Value = null)
                Then
            Begin
                RadioButton2.Checked := true;
                //Percent.Value := null;
            End
            Else
            Begin
                RadioButton1.Checked := true;
                Percent.Value := StoredProc.ParamByName('PERCENTOUT').Value;
            End;

            //IdType.ItemIndex := StoredProc.ParamByName('ID_TYPE').Value - 1;
            IdRaise.Value := StoredProc.ParamByName('ID_RAISEOUT').Value;
            IdRaise.DisplayText := StoredProc.ParamByName('RASE_NAME').ASString;

            {If IdType.ItemIndex = 1 Then IsPercentBox.Visible := False
            Else IsPercentBox.Visible := True;
                                              }
            ID_CALC_TYPE := StoredProc.ParamByName('ID_CALC_TYPE').Value;
            mes := StoredProc.ParamByName('RESULTS').Value;
            If (mes <> '') Then
                ShowMessage(mes);
        End
        Else
        Begin
            If (Not (VarIsNull(StoredProc.ParamByName('ERR_STRING').Value)) And
                (StoredProc.ParamByName('ERR_STRING').Value <> '')) Then
                agShowMessage(StoredProc.ParamByName('ERR_STRING').Value)
            Else
                agShowMessage('По введеним атрибутам не знайдено жодного пункту для клонування!');
            // agMessageDlg('Увага!', 'По введеним атрибутам не знайдено жодного пункту для клонування!', mtInformation, [mbOk]);
        End;

        StoredProc.Close;
        StoredProc.Free;

        GetData;
        If (MainOrderDataSet.RecordCount > 0)
            Then
        Begin
            SetControls(true);

            If (Id_Calc_Type = 4)
                Then
            Begin
                ExtInfoButton.Enabled := true;
                TabSheet2.TabVisible := true;
            End;
            If (Id_Calc_Type <> 2)
                Then
            Begin
                SmAddButton.Enabled := true;
                SmEditButton.Enabled := true;
                SmDelButton.Enabled := true;
            End;
        End;

    End;

    BitBtn1.Click;
    Screen.Cursor := crDefault;
    Panel11.Visible := False;
    Application.ProcessMessages;
End;

Procedure TfmBonusOrder.N4Click(Sender: TObject);
Begin
    If Percent.Value = null
        Then
    Begin
        agShowMessage('Треба ввести процент надбавки!');
        Exit;
    End;

    //Запускаем фильтр для работы
    Screen.Cursor := crHourGlass;

    Panel11.Visible := true;
    self.Update;
    Application.ProcessMessages;


    PC.InParams.Items['AOwner'] := @self;
    PC.InParams.Items['DbHandle'] := PInteger(@WorkDatabase.Handle);
    PC.InParams.Items['Id_User'] := PInteger(@id_user);
    PC.InParams.Items['Id_order_type'] := PInteger(@id_order_type);
    PC.InParams.Items['KEY_SESSION'] := PInt64(@Key_session);

    (PC As IFMASTemporaryDataStorage).ClearTmpData;

    (PC As IFMASModule).Run;

    If (PInteger(PC.OutParams.Items['Count'])^) = 0
        Then
    Begin
        agMessageDlg('Увага!', 'За встановленими настройками фільтра не знайдено жодної позиції! Спробуйте ще раз?', mtInformation, [mbOk]);
    End;

    If (PInteger(PC.OutParams.Items['Count'])^) > 0
        Then
    Begin
        //Загружаем данные из результатов работы фильтра
        LoadDataFromFilter;

        GetData;

        If (MainOrderDataSet.RecordCount > 0)
            Then
        Begin
            SetControls(true);


            If (Id_Calc_Type = 4)
                Then
            Begin
                ExtInfoButton.Enabled := true;
                TabSheet2.TabVisible := true;
            End;

        End;
    End;
    BitBtn1.Click;
    Screen.Cursor := crDefault;
    Panel11.Visible := False;
    Application.ProcessMessages;

End;

Procedure TfmBonusOrder.N5Click(Sender: TObject);
Var
    CheckSP: TpFIBStoredProc;
    Res: Integer;
    ResStr: String;
Begin
    If Percent.Value = null
        Then
    Begin
        agShowMessage('Треба ввести процент надбавки!');
        Exit;
    End;

    //Осуществляем дополнительные проверки
    If DayOf(DefaultDateBeg.Date) <> 1
        Then
    Begin
        agShowMessage('Дата початку призначення надбавки повинна бути з початку місяця!');
        Exit;
    End;

    CheckSP := TpFIBStoredProc.Create(self);
    CheckSP.Database := WorkDatabase;
    CheckSP.Transaction := ReadTransaction;
    CheckSP.StoredProcName := 'UP_CHECK_STAJ_RAISE_PARAMS';
    CheckSP.Prepare;
    CheckSP.ParamByName('ID_RAISE').Value := IdRaise.Value;
    CheckSP.ParamByName('PERCENT').Value := Percent.Value;
    CheckSP.ParamByName('ACTUAL_DATE').Value := DefaultDateBeg.Date;
    CheckSP.ExecProc;
    RES := CheckSP.ParamByName('RESULT').Value;
    ResStr := CheckSP.ParamByName('RESULT_MESSAGE').Value;
    CheckSP.Close;
    CheckSP.Free;
    If Res <> 1
        Then
    Begin
        agShowMessage(ResStr);
        Exit;
    End;

    //Запускаем фильтр для работы
    Screen.Cursor := crHourGlass;

    Panel11.Visible := true;
    self.Update;
    Application.ProcessMessages;

    //Загружаем данные из результатов работы фильтра
    LoadDataFromFilterStaj;

    GetData;

    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        SetControls(true);


        If (Id_Calc_Type = 4)
            Then
        Begin
            ExtInfoButton.Enabled := true;
            TabSheet2.TabVisible := true;
        End;

    End;

    BitBtn1.Click;
    Screen.Cursor := crDefault;
    Panel11.Visible := False;
    Application.ProcessMessages;
End;


Procedure TfmBonusOrder.LoadDataFromFilterStaj;
Var
    GetFilterDS: TpFibDataSet;
    InsertBuffer: TpFibStoredProc;
    GetId_order_itemSP: TpFibStoredProc;
    i: Integer;
    id_order_item: Int64;
    fam, im, otch: String[20];
Begin

    GetFilterDS := TpFibDataSet.Create(Nil);
    GetFilterDS.Database := WorkDatabase;
    GetFilterDS.Transaction := ReadTransaction;
    GetFilterDS.SelectSQL.Text := 'SELECT * FROM UP_KER_CHECK_STAJ_VALUE_EX2(' + '''' + DateToStr(DefaultDateBeg.EditValue) + '''' + ',' +
        IntToStr(Self.IdRaise.Value) + ',' +
        FloatToStr(self.Percent.Value) + ')';
    GetFilterDS.Open;
    GetFilterDS.FetchAll;
    GetFilterDS.First;

    //Если есть данные по фильтру
    If (GetFilterDS.RecordCount > 0)
        Then
    Begin
        InsertBuffer := TpFibStoredProc.Create(Nil);
        InsertBuffer.Database := WorkDatabase;
        InsertBuffer.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        StartHistory(WriteTransaction);
        InsertBuffer.StoredProcName := 'UP_DT_MAN_BONUS_BUFF_INS_EX';

        GetId_order_itemSP := TpFibStoredProc.Create(Nil);
        GetId_order_itemSP.Database := WorkDatabase;
        GetId_order_itemSP.Transaction := WriteTransaction;
        GetId_order_itemSP.StoredProcName := 'UP_KER_GET_NEW_ID_ORDER_ITEM';

        For i := 0 To GetFilterDS.RecordCount - 1 Do
        Begin
            //Добавляем данные в буфферные таблицы по шапке
            GetId_order_itemSP.Prepare;
            GetId_order_itemSP.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
            GetId_order_itemSP.ParamByName('NOTE').Value := NULL;
            GetId_order_itemSP.ParamByName('NUM_ITEM').Value := self.base_num_item;
            GetId_order_itemSP.ParamByName('NUM_SUB_ITEM').Value := self.base_num_sub_item;
            GetId_order_itemSP.ParamByName('ID_ORDER').AsInt64 := self.IdOrder;
            GetId_order_itemSP.ParamByName('ID_ORDER_TYPE').Value := self.id_order_type;

            fam := GetFilterDS.FieldByName('FAMILIA').AsString;
            im := GetFilterDS.FieldByName('IMYA').AsString;
            otch := GetFilterDS.FieldByName('OTCHESTVO').AsString;

            GetId_order_itemSP.ParamByName('REASON').Value := ' Заява ' + fam + ' ' + im[1] + '.' + otch[1] + '.';

            If (self.only_save_in_buff = 1)
                Then
                GetId_order_itemSP.ParamByName('LINKTO').Value := Self.ItemLinkTo
            Else
                GetId_order_itemSP.ParamByName('LINKTO').Value := NULL;

            GetId_order_itemSP.ExecProc;

            id_order_item := GetId_order_itemSP.FieldByName('ID_ITEM').AsInt64;

            //Нарашиваем информацию по номеру подпункта
            self.base_num_sub_item := self.base_num_sub_item + 1;

            //Добавляем данные в буфферные таблицы по основыным данным
            InsertBuffer.Prepare;
            InsertBuffer.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
            InsertBuffer.ParamByName('DATE_BEG').Value := DefaultDateBeg.EditValue;
            InsertBuffer.ParamByName('DATE_END_in').Value := DefaultDateEnd.EditValue;
            InsertBuffer.ParamByName('ID_MAN_MOVING').AsInt64 := StrToInt64(GetFilterDS.FieldByName('ID_MAN_MOVING').AsString);
            InsertBuffer.ParamByName('NUM_ITEM').Value := self.base_num_item;
            InsertBuffer.ParamByName('NUM_SUB_ITEM').Value := self.base_num_sub_item;
            InsertBuffer.ParamByName('PERCENT').Value := Percent.Value;
            InsertBuffer.ParamByName('ID_ORDER_ITEM').asInt64 := id_order_item;
            InsertBuffer.ParamByName('ID_ORDER').AsInt64 := self.IdOrder;
            InsertBuffer.ParamByName('ID_RAISE').Value := IdRaise.Value;
            InsertBuffer.ParamByName('ID_ORDER_TYPE').Value := self.id_order_type;
            InsertBuffer.ParamByName('SOVM_ID_DEPARTMENT').Value := NULL;
            InsertBuffer.ParamByName('SOVM_ID_POST_SALARY').Value := NULL;
            InsertBuffer.ParamByName('SOVM_ID_TYPE_POST').Value := NULL;
            InsertBuffer.ParamByName('SOVM_KOEFF_PPS').Value := NULL;
            InsertBuffer.ParamByName('SOVM_ID_PCARD').Value := NULL;
            InsertBuffer.ParamByName('ID_CALC_TYPE').Value := Id_Calc_Type;
            InsertBuffer.ParamByName('IS_PERCENT').Value := Integer(RadioButton1.checked);
            InsertBuffer.ExecProc;

            GetFilterDS.Next;
        End;

        WriteTransaction.Commit;

        SendMessage(outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);

        GetId_order_itemSP.Close;
        GetId_order_itemSP.Free;

        InsertBuffer.Close;
        InsertBuffer.Free;
    End;
    GetFilterDS.Close;
    GetFilterDS.Free;
End;


Procedure TfmBonusOrder.ReportDataViewCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; Var ADone: Boolean);
Begin
    If AViewInfo.GridRecord.Values[ReportDataViewDBColumn8.Index] = err_id_order_item Then
    Begin
        ACAnvas.Brush.Color := clRed;
    End;
End;

Procedure TfmBonusOrder.FormShow(Sender: TObject);
Var
    tv: String;
Begin
    tv := '';
    tv := KYVLoadFromRegistry('BonusOrderShowBudget', GetUserId);
    If (tv = '0') Or (tv = '1')
        Then
    Begin
        cxCheckBox1.Checked := Boolean(StrToInt(tv));
        cxCheckBox1.Properties.OnChange(Self);
    End;
End;

procedure TfmBonusOrder.FormResize(Sender: TObject);
var pos_ok : integer;
begin
    pos_ok := (round(Width/2))-OkButton.Width;
    OkButton.Left := pos_ok;
    CancelButton.Left := (round(Width/2))+5;
end;

End.

