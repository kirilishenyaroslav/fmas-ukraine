Unit UpGetHolidayForm;

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
    uSimpleCheck, uBoolControl, GlobalSPR, Math, Ibase, cxLookAndFeelPainters,
    cxButtons, cxMemo, cxDBEdit, cxContainer, cxTextEdit, AppStruClasses, pFibStoredProc,
    Placemnt, Menus, AppEvnts, cxCheckBox, FIBQuery, pFIBQuery;

Type
    TfmGetHolidayOrder = Class(TForm)
        KeyList: TActionList;
        WorkDatabase: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        CancelAction: TAction;
        BottomPanel: TPanel;
        OkButton: TBitBtn;
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
        DetailDataSet: TpFIBDataSet;
        DetailDataSource: TDataSource;
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
        Label5: TLabel;
        Label6: TLabel;
        cxDBTextEdit1: TcxDBTextEdit;
        cxDBMemo1: TcxDBMemo;
        Panel4: TPanel;
        Panel7: TPanel;
        Panel8: TPanel;
        SmAddButton: TcxButton;
        cxGrid1: TcxGrid;
        PeriodsView: TcxGridDBTableView;
        cxGridDBColumn1: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
        Panel9: TPanel;
        ItemsGrid: TcxGrid;
        PeopleView: TcxGridDBTableView;
        PeopleViewDBColumn1: TcxGridDBColumn;
        PeopleViewDBColumn2: TcxGridDBColumn;
        cxGridLevel5: TcxGridLevel;
        Panel10: TPanel;
        AddPositionButton: TcxButton;
        DelPositionButton: TcxButton;
        ReasonButton: TcxButton;
        ERrorButton: TcxButton;
        ApplicationEvents1: TApplicationEvents;
        PeopleViewDBColumn3: TcxGridDBColumn;
        PeriodsViewDBColumn1: TcxGridDBColumn;
        PeriodsViewDBColumn2: TcxGridDBColumn;
        PeriodsViewDBColumn3: TcxGridDBColumn;
        PeopleViewDBColumn4: TcxGridDBColumn;
        PeopleViewDBColumn5: TcxGridDBColumn;
        cxButton1: TcxButton;
        Splitter1: TSplitter;
        Splitter2: TSplitter;
        Panel2: TPanel;
        Label1: TLabel;
        cxDBTextEdit2: TcxDBTextEdit;
    DataSetReason: TpFIBDataSet;
        Procedure CancelActionExecute(Sender: TObject);
        Procedure AddPositionButtonClick(Sender: TObject);
        Procedure ShowBuPanelButtonClick(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure FormDestroy(Sender: TObject);
        Procedure OkButtonClick(Sender: TObject);
        Procedure ExtInfoButtonGetDrawParams(Sender: TcxCustomButton;
            AState: TcxButtonState; Var AColor: TColor; AFont: TFont);
        Procedure ReasonButtonClick(Sender: TObject);
        Procedure ERrorButtonGetDrawParams(Sender: TcxCustomButton;
            AState: TcxButtonState; Var AColor: TColor; AFont: TFont);
        Procedure ERrorButtonClick(Sender: TObject);
        Procedure DelPositionButtonClick(Sender: TObject);
        Procedure CancelButtonClick(Sender: TObject);
        Procedure N1Click(Sender: TObject);
        Procedure N2Click(Sender: TObject);
        Procedure InsertActionExecute(Sender: TObject);
        Procedure DeleteActionExecute(Sender: TObject);
        Procedure CommitActionExecute(Sender: TObject);
        Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
        Procedure DetailDataSetAfterOpen(DataSet: TDataSet);
        Procedure SmAddButtonClick(Sender: TObject);
        Procedure cxButton1Click(Sender: TObject);
        Procedure PeriodsViewDblClick(Sender: TObject);
    private
        { Private declarations }
        ErrorForm: TForm;
        only_save_in_buff: Integer;
        ItemLinkTo: Integer;
        EditMode: Integer;
        EditIdOrderItem: Int64;
        LocalasFrame: Boolean;
        WithSovm: Boolean;
        Procedure LoadDataFromFilter;
        Procedure GetData;
        Procedure CreateBuffInfoByIdItem;
        Function CheckData: Boolean;
        Function SaveData: Boolean;
        Function AddNewItem(id_item: Int64): Boolean;
        Procedure SetControls(Enable: Boolean);
        Procedure GetErrorTexts(id_item: int64);
    public
        PC: TFMASAppModule;
        Key_session: int64;
        id_user: Integer;
        DateOrder: TDate;
        IdOrder: Int64;
        id_order_type: Integer;
        base_num_item: Integer;
        base_num_sub_item: Integer;
        outer_hwnd: HWND;
        ID_TYPE:String;
        Constructor Create(AOwner: TComponent;
            Db_Handle: TISC_DB_HANDLE;
            id_order: int64;
            id_order_type: Integer;
            num_item: Integer;
            num_sub_item: Integer;
            id_order_item: Variant;
            mode: integer;
            asFrame: Boolean;
            outer_hwnd: Variant); reintroduce;
    End;

Implementation

Uses BaseTypes, AccMgmt,
    UpKernelUnit, UNewHolidayParams, UpGetHolidayOrderReasonForm,
    UHolidayOrderShowErrors, UEditFactValues;

{$R *.dfm}



Procedure TfmGetHolidayOrder.CancelActionExecute(Sender: TObject);
Begin
    If Not LocalasFrame
        Then
        Close;
End;

Constructor TfmGetHolidayOrder.Create(AOwner: TComponent; Db_Handle: TISC_DB_HANDLE; id_order: int64;
    id_order_type: integer; num_item: Integer; num_sub_item: Integer;
    id_order_item: Variant; mode: integer; asFrame: Boolean; outer_hwnd: Variant);
Begin
    If asFrame
        Then
        Inherited Create(AOwner)
    Else
        Inherited Create(AOwner);

    self.LocalasFrame := asFrame;
    self.outer_hwnd := outer_hwnd;
    //Если показываем форму как фрейм
    If self.LocalasFrame
        Then
    Begin
        self.BorderStyle := bsNone;
        self.BorderIcons := [];
        self.Visible := true;
    End;

    WorkDatabase.Handle := Db_Handle;
    ReadTransaction.StartTransaction;
    StartHistory(ReadTransaction);
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
    End;

    //Отображение информации о надбавках в приказе

    GetData;


    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        SetControls(true);
    End;

    If (self.EditMode In [1, 2, 3])
        Then
    Begin
        AddPositionButton.Enabled := false;
        DelPositionButton.Enabled := false;
        cxButton1.Enabled := false;
    End;

    If OkButton.HandleAllocated
        Then
        SendMessage(self.outer_hwnd, FMAS_MESS_GET_BUTTON_OK, OkButton.Handle, OkButton.Handle);

    If CancelButton.HandleAllocated
        Then
        SendMessage(self.outer_hwnd, FMAS_MESS_GET_BUTTON_OK, CancelButton.Handle, CancelButton.Handle);
End;

Procedure TfmGetHolidayOrder.AddPositionButtonClick(Sender: TObject);
Begin
    //Запускаем фильтр для работы
    PC.InParams.Items['AOwner'] := @self;
    PC.InParams.Items['DbHandle'] := PInteger(@WorkDatabase.Handle);
    PC.InParams.Items['Id_User'] := PInteger(@id_user);
    PC.InParams.Items['Id_order_type'] := PInteger(@id_order_type);
    PC.InParams.Items['KEY_SESSION'] := PInt64(@Key_session);

    (PC As IFMASModule).Run;

    If (PInteger(PC.OutParams.Items['Count'])^) = 0
        Then
    Begin
        agMessageDlg('Увага!', 'За встановленими настройками фільтра не знайдено жодної позиції! Спробуйте ще раз?',
            mtInformation, [mbOk]);
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
        End;
    End;
End;

Procedure TfmGetHolidayOrder.ShowBuPanelButtonClick(Sender: TObject);
Begin
    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        Panel4.Width := 200;
        Splitter1.Left := Panel4.Left - 1;
    End;
End;

Procedure TfmGetHolidayOrder.FormCreate(Sender: TObject);
Begin
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

Procedure TfmGetHolidayOrder.FormDestroy(Sender: TObject);
Var
    ClearSP: TpFibStoredProc;
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

    If Assigned(PC) Then
        PC.Free;
    If Assigned(ErrorForm) Then
        ErrorForm.Free;
End;

Procedure TfmGetHolidayOrder.LoadDataFromFilter;
Var
    GetFilterDS: TpFibDataSet;
    InsertBuffer: TpFibStoredProc;
    i, Is_added: Integer;
    Params: TfrmNewHolidayParams;
    fam, im, otch: String[20];
Begin
    //Забираем данные из фильтра
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
        WithSovm := False;
        Params := TfrmNewHolidayParams.Create(self,
            WorkDatabase.Handle,
            -1,
            -1,
            Date,
            Date,
            1,
            GetFilterDS.FieldByName('Id_pcard').value,
            False,
            -1,
            null,
            null,
            null,
            true,
            true);
        If Params.ShowModal = mrYes
            Then
        Begin
            If Not Params.FixedTypeHoliday.Checked
                Then
            Begin
                GetFilterDS.Close;
                GetFilterDS.Transaction := ReadTransaction;
                GetFilterDS.SelectSQL.Text := 'SELECT * FROM UP_KER_GET_FILTER_DATA_EX2(' + IntToStr(self.Key_session) +
                    ',' + '''' + DateToStr(Params.StartDate.Date) + '''' + ')';
                GetFilterDS.Open;
                GetFilterDS.FetchAll;
                GetFilterDS.First;
            End;

            ID_TYPE:='';
            DataSetReason.close;
            DataSetReason.SelectSQL.Text := ' SELECT DEFAULT_REASON FROM UP_DT_ORDER_TYPE where ID_TYPE='+intToStr(13);
            DataSetReason.open;

            if (not DataSetReason.isEmpty) then
            ID_TYPE:= varToStrDef(DataSetReason['DEFAULT_REASON'],'');
            

            InsertBuffer := TpFibStoredProc.Create(Nil);
            InsertBuffer.Database := WorkDatabase;
            InsertBuffer.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            //Процедура которая заполняет информацией по отпускам
            InsertBuffer.StoredProcName := 'HL_INSERT_BUFFER_HOLIDAY';

            For i := 0 To GetFilterDS.RecordCount - 1 Do
            Begin
                //Добавляем данные в буфферные таблицы по основыным данным

                If Params.PeriodsDataSet.Active
                    Then
                Begin
                    Params.PeriodsDataSet.SortOnFields('Date_Beg', True, False);
                    Params.PeriodsDataSet.First;
                    While Not Params.PeriodsDataSet.Eof Do
                    Begin
                        InsertBuffer.Prepare;
                        InsertBuffer.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
                        InsertBuffer.ParamByName('ID_TYPE_HOLIDAY').Value := Params.HolidayType.value;
                        InsertBuffer.ParamByName('HOLIDAY_BEG').Value :=
                            Params.PeriodsDataSet.FieldByName('date_beg').Value;
                        InsertBuffer.ParamByName('ID_MAN_MOVING').AsInt64 :=
                            StrToInt64(GetFilterDS.FieldByName('ID_MAN_MOVING').AsString);

                        fam := GetFilterDS.FieldByName('FAMILIA').AsString;
                        im := GetFilterDS.FieldByName('IMYA').AsString;
                        otch := GetFilterDS.FieldByName('OTCHESTVO').AsString;

                        if ID_TYPE='' then
                          InsertBuffer.ParamByName('NOTE').value := ' Заява ' + fam + ' ' + im[1] + '.' + otch[1] + '.'
                        else
                          InsertBuffer.ParamByName('NOTE').value := StringReplace(ID_TYPE,'%FIO%',fam + ' ' + im[1] + '.' + otch[1] + '.',[rfReplaceAll]);

                        InsertBuffer.ParamByName('CNT').Value :=
                            Params.PeriodsDataSet.FieldByName('order_count').Value;
                        InsertBuffer.ParamByName('BASE_NUM_ITEM').Value := self.base_num_item;
                        InsertBuffer.ParamByName('BASE_NUM_SUB_ITEM_IN').Value := self.base_num_sub_item;
                        InsertBuffer.ParamByName('ID_ORDER').asInt64 := self.IdOrder;
                        InsertBuffer.ParamByName('ID_ORDER_TYPE').Value := self.id_order_type;

                        If Not Params.FixedTypeHoliday.Checked
                            Then
                            InsertBuffer.ParamByName('FILL_PERIOD_MODE').Value := 1
                        Else
                            InsertBuffer.ParamByName('FILL_PERIOD_MODE').Value := 0;

                        InsertBuffer.ExecProc;
                        Is_added := InsertBuffer.ParamByName('IS_ADDED').Value;
                        self.base_num_sub_item := InsertBuffer.ParamByName('BASE_NUM_SUB_ITEM_OUT').Value;

                        If Is_added = 0
                            Then
                        Begin
                        End
                        Else
                        Begin
                            SendMessage(outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);
                        End;

                        Params.PeriodsDataSet.Next;
                    End;
                End
                Else
                Begin
                    InsertBuffer.Prepare;
                    InsertBuffer.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
                    InsertBuffer.ParamByName('ID_TYPE_HOLIDAY').Value := Params.HolidayType.value;
                    InsertBuffer.ParamByName('HOLIDAY_BEG').Value := Params.StartDate.Date;
                    InsertBuffer.ParamByName('ID_MAN_MOVING').AsInt64 :=
                        StrToInt64(GetFilterDS.FieldByName('ID_MAN_MOVING').AsString);

                    fam := GetFilterDS.FieldByName('FAMILIA').AsString;
                    im := GetFilterDS.FieldByName('IMYA').AsString;
                    otch := GetFilterDS.FieldByName('OTCHESTVO').AsString;

                    if ID_TYPE='' then
                          InsertBuffer.ParamByName('NOTE').value := ' Заява ' + fam + ' ' + im[1] + '.' + otch[1] + '.'
                    else
                          InsertBuffer.ParamByName('NOTE').value := StringReplace(ID_TYPE,'%FIO%',fam + ' ' + im[1] + '.' + otch[1] + '.',[rfReplaceAll]);

                    InsertBuffer.ParamByName('CNT').Value := Params.DayCount.EditValue;
                    InsertBuffer.ParamByName('BASE_NUM_ITEM').Value := self.base_num_item;
                    InsertBuffer.ParamByName('BASE_NUM_SUB_ITEM_IN').Value := self.base_num_sub_item;
                    InsertBuffer.ParamByName('ID_ORDER').asInt64 := self.IdOrder;
                    InsertBuffer.ParamByName('ID_ORDER_TYPE').Value := self.id_order_type;

                    If Not Params.FixedTypeHoliday.Checked
                        Then
                        InsertBuffer.ParamByName('FILL_PERIOD_MODE').Value := 1
                    Else
                        InsertBuffer.ParamByName('FILL_PERIOD_MODE').Value := 0;

                    InsertBuffer.ExecProc;
                    Is_added := InsertBuffer.ParamByName('IS_ADDED').Value;
                    self.base_num_sub_item := InsertBuffer.ParamByName('BASE_NUM_SUB_ITEM_OUT').Value;

                    If Is_added = 0
                        Then
                    Begin
                    End
                    Else
                    Begin
                        SendMessage(outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);
                        //Нарашиваем информацию по номеру подпункта
                        self.base_num_sub_item := self.base_num_sub_item + 1;
                    End;
                End;

                GetFilterDS.Next;
            End;

            WriteTransaction.Commit;

            InsertBuffer.Close;
            InsertBuffer.Free;
        End;
        Params.Free;
    End;
    GetFilterDS.Close;
    GetFilterDS.Free;
End;


Procedure TfmGetHolidayOrder.GetData;
Var
    id_work_dog_moving: Int64;
    id_post: int64;
    is_post_main: Variant;
    id_pcard: Int64;
Begin
    If DetailDataSet.Active
        Then
    Begin
        DetailDataSet.Close;
    End;

    id_work_dog_moving := -1;
    id_post := -1;
    is_post_main := -1;
    id_pcard := -1;

    If MainOrderDataSet.Active
        Then
    Begin
        If (MainOrderDataSet.RecordCount > 0)
            Then
        Begin
            id_work_dog_moving := StrToInt64(MainOrderDataSet.FieldByName('ID_WORK_DOG_MOVING').asString);
            id_post := StrToInt64(MainOrderDataSet.FieldByName('ID_POST').asString);
            is_post_main := MainOrderDataSet.FieldByName('IS_POST_MAIN').Value;
            id_pcard := StrToInt64(MainOrderDataSet.FieldByName('ID_PCARD').asString);
        End;

        MainOrderDataSet.Close;
    End;

    If (self.EditMode = 0) //Добавление
    Then
    Begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM HL_DT_MAN_HOLIDAY_FACT_BUFF_SEL(' + IntToStr(self.Key_session)
            + ',-1)';
    End;

    If (self.EditMode = 1) //Редактирование
    Then
    Begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM HL_DT_MAN_HOLIDAY_FACT_BUFF_SEL(' + IntToStr(self.Key_session)
            + ',-1)';
    End;

    If (self.EditMode = 2) //Только просмотр
    Then
    Begin
        MainOrderDataSet.SelectSQL.Text := 'SELECT * FROM HL_DT_MAN_HOLIDAY_FACT_BUFF_SEL(' + IntToStr(self.Key_session)
            + ',-1)';
    End;

    MainOrderDataSet.Open;
    MainOrderDataSet.FetchAll;

    If (MainOrderDataSet.RecordCount > 0)
        Then
    Begin
        MainOrderDataSet.Locate('ID_WORK_DOG_MOVING;ID_POST;IS_POST_MAIN;ID_PCARD', VarArrayOf([id_work_dog_moving,
            id_post, is_post_main, id_pcard]), []);
    End;

    DetailDataSet.SelectSQL.Text := ' SELECT * FROM  HL_DT_MAN_HOLIDAY_FACT_BUFF_DET(?ID_WORK_DOG_MOVING,' +
        IntToStr(self.Key_session) + ',?ID_POST,?IS_POST_MAIN) ';

    DetailDataSet.Open;
    

    PeriodsView.ViewData.Expand(true);
End;

Procedure TfmGetHolidayOrder.CreateBuffInfoByIdItem;
Var
    ClearSP: TpFibStoredProc;
Begin
    //По инструкциям воссоздаем информацию в буфферах
    ClearSP := TpFibStoredProc.Create(Nil);
    ClearSP.Database := WorkDatabase;
    ClearSP.Transaction := WriteTransaction;
    WriteTransaction.StartTransaction;
    StartHistory(WriteTransaction);
    ClearSP.StoredProcName := 'HL_CREATE_BUFF_INFO_BY_ITEM';
    ClearSP.Prepare;
    ClearSP.ParamByName('KEY_SESSION').AsInt64 := self.Key_session;
    ClearSP.ParamByName('ID_ORDER_ITEM').AsInt64 := self.EditIdOrderItem;
    ClearSP.ExecProc;
    WriteTransaction.Commit;
    ClearSP.Close;
    ClearSP.Free;
End;

Procedure TfmGetHolidayOrder.OkButtonClick(Sender: TObject);
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
                GetData;
            End
        End
        Else
            agShowMessage('Знайдені помилки в інформації по наказу!');
    End
    Else
        ModalResult := mrOk;
End;

Function TfmGetHolidayOrder.CheckData: Boolean;
Begin
    //Необходимо проверить на корректность данные в буфферах
    Result := true;
End;

Procedure TfmGetHolidayOrder.ExtInfoButtonGetDrawParams(Sender: TcxCustomButton;
    AState: TcxButtonState; Var AColor: TColor; AFont: TFont);
Begin
    AFont.Size := 6;
End;

Procedure TfmGetHolidayOrder.ReasonButtonClick(Sender: TObject);
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
                    UpdateSP.StoredProcName := 'UP_DT_ORDER_ITEMS_HL_BUFF_UPD';
                    UpdateSP.Prepare;
                    UpdateSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
                    UpdateSP.ParamByName('NOTE').Value := Note.Text;
                    UpdateSP.ParamByName('REASON').Value := Reason.Text;
                    UpdateSP.ParamByName('ID_WORK_DOG_MOVING').AsInt64 :=
                        StrToInt64(MainOrderDataSet.FieldByName('ID_WORK_DOG_MOVING').AsString);
                    UpdateSP.ParamByName('ID_POST').AsInt64 :=
                        StrToInt64(MainOrderDataSet.FieldByName('ID_POST').AsString);
                    UpdateSP.ParamByName('IS_POST_MAIN').Value := MainOrderDataSet.FieldByName('IS_POST_MAIN').Value;

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
                UpdateSP.StoredProcName := 'UP_DT_ORDER_ITEMS_HL_BUFF_UPD';
                UpdateSP.Prepare;
                UpdateSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
                UpdateSP.ParamByName('NOTE').Value := Note.Text;
                UpdateSP.ParamByName('REASON').Value := Reason.Text;
                UpdateSP.ParamByName('ID_WORK_DOG_MOVING').AsInt64 :=
                    StrToInt64(MainOrderDataSet.FieldByName('ID_WORK_DOG_MOVING').AsString);
                UpdateSP.ParamByName('ID_POST').AsInt64 :=
                    StrToInt64(MainOrderDataSet.FieldByName('ID_POST').AsString);
                UpdateSP.ParamByName('IS_POST_MAIN').Value := MainOrderDataSet.FieldByName('IS_POST_MAIN').Value;
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

Function TfmGetHolidayOrder.SaveData: Boolean;
Var
    i, j: Integer;
    ExistErrors: Boolean;
    GetShadowItems: TpFibDataSet;
    GetMainItems: TpFibDataSet;
    ExistsShadowErorrs: Boolean;
Begin
    ExistErrors := false;
    ExistsShadowErorrs := false;

    GetMainItems := TpFibDataSet.Create(self);
    GetMainItems.Database := WorkDatabase;
    GetMainItems.Transaction := ReadTransaction;
    GetMainItems.SelectSQL.Text := ' SELECT * ' +
        '   FROM UP_DT_ORDER_ITEMS_BUFF ' +
        '  WHERE ID_ORDER=' + IntToStr(IdOrder) +
        '    AND LINKTO IS NULL ' +
        '    AND KEY_SESSION =' + IntToStr(self.Key_session) +
        '  ORDER BY NUM_ITEM, NUM_SUB_ITEM ASC';
    GetMainItems.Open;
    GetMainItems.FetchAll;

    If (GetMainItems.RecordCount > 0)
        Then
    Begin
        WriteTransaction.StartTransaction;
        StartHistory(WriteTransaction);
        GetMainItems.First;

        For i := 0 To GetMainItems.RecordCount - 1 Do
        Begin
            If AddNewItem(StrToInt64(GetMainItems.FieldByName('ID_ITEM').AsString)) //Сохраняем информацию по пункту
            Then
            Begin
                //Добавляем теневые пункты
                GetShadowItems := TpFibDataSet.Create(self);
                GetShadowItems.Database := WorkDatabase;
                GetShadowItems.Transaction := ReadTransaction;
                GetShadowItems.SelectSQL.Text := 'SELECT ID_ITEM FROM UP_DT_ORDER_ITEMS_BUFF where LINKTO=' +
                    GetMainItems.FieldByName('ID_ITEM').AsString;
                GetShadowItems.Open;
                GetShadowItems.FetchAll;
                GetShadowItems.First;
                For j := 0 To GetShadowItems.RecordCount - 1 Do
                Begin
                    If AddNewItem(StrToInt64(GetShadowItems.FieldByName('ID_ITEM').AsString))
                        //Сохраняем информацию по пункту
                    Then
                    Begin
                    End
                    Else
                    Begin
                        //Выводим сообщения об ошибках
                        GetErrorTexts(StrToInt64(GetShadowItems.FieldByName('ID_ITEM').AsString));
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
                GetErrorTexts(StrTOint64(GetMainItems.FieldByName('ID_ITEM').AsString));
                ExistErrors := true;
                Break;
            End;
            GetMainItems.Next;
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

Function TfmGetHolidayOrder.AddNewItem(id_item: int64): Boolean;
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


Procedure TfmGetHolidayOrder.ERrorButtonGetDrawParams(Sender: TcxCustomButton;
    AState: TcxButtonState; Var AColor: TColor; AFont: TFont);
Begin
    AFont.Color := clRed;
    AFont.Style := [fsBold];
End;

Procedure TfmGetHolidayOrder.GetErrorTexts(id_item: int64);
Begin
    UpKernelUnit.GetUpSessionErrors(Self, WorkDatabase.Handle, Self.Key_session, id_item);
End;

Procedure TfmGetHolidayOrder.ERrorButtonClick(Sender: TObject);
Begin
    If Assigned(ErrorForm) Then
        ErrorForm.ShowModal;
End;

Procedure TfmGetHolidayOrder.DelPositionButtonClick(Sender: TObject);
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
            DeleteSP.StoredProcName := 'HL_DT_MAN_HOLIDAY_FACT_BUFF_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
            DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 :=
                StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM_OUT').AsString);
            DeleteSP.ParamByName('WITH_HEADERS').Value := 1;
            DeleteSP.ExecProc;
            DeleteSP.Close;
            DeleteSP.Free;
            WriteTransaction.Commit;
            SendMessage(outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);

            GetData;

            If (MainOrderDataSet.RecordCount = 0)
                Then
            Begin
                SetControls(false);
            End;
        End;
    End;
End;

Procedure TfmGetHolidayOrder.SetControls(Enable: Boolean);
Begin
    OkButton.Enabled := Enable;
    DelPositionButton.Enabled := Enable;
    ReasonButton.Enabled := Enable;
    cxButton1.Enabled := Enable;
End;

Procedure TfmGetHolidayOrder.CancelButtonClick(Sender: TObject);
Begin
    If LocalasFrame
        Then
        SendMessage(outer_hwnd, FMAS_MESS_CLOSE_FRAME, 0, 0)
    Else
        Close;
End;

Procedure TfmGetHolidayOrder.N1Click(Sender: TObject);
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
            DeleteSP.StoredProcName := 'HL_DT_MAN_HOLIDAY_FACT_BUFF_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
            DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 :=
                StrToInt64(MainOrderDataSet.FieldByName('ID_ORDER_ITEM_OUT').AsString);
            DeleteSP.ParamByName('WITH_HEADERS').Value := 1;
            DeleteSP.ExecProc;
            DeleteSP.Close;
            DeleteSP.Free;
            WriteTransaction.Commit;
            SendMessage(outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);
            GetData;

            If (MainOrderDataSet.RecordCount = 0)
                Then
            Begin
                SetControls(false);
            End;
        End;
    End;
End;

Procedure TfmGetHolidayOrder.N2Click(Sender: TObject);
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
            DetailDataSet.First;

            For i := 0 To DetailDataSet.RecordCount - 1 Do
            Begin
                DeleteSP := TpFibStoredProc.Create(self);
                DeleteSP.Database := WorkDatabase;
                DeleteSP.Transaction := WriteTransaction;
                WriteTransaction.StartTransaction;
                StartHistory(WriteTransaction);
                DeleteSP.StoredProcName := 'HL_DT_MAN_HOLIDAY_FACT_BUFF_DEL';
                DeleteSP.Prepare;
                DeleteSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
                DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 :=
                    StrToInt64(DetailDataSet.FieldByName('ID_ORDER_ITEM').AsString);
                DeleteSP.ParamByName('WITH_HEADERS').Value := 1;
                DeleteSP.ExecProc;
                DeleteSP.Close;
                DeleteSP.Free;

                WriteTransaction.Commit;

                DetailDataSet.Next;
            End;

            SendMessage(outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);

            GetData;

            If (MainOrderDataSet.RecordCount = 0)
                Then
            Begin
                SetControls(false);
            End;
        End;
    End;
End;

Procedure TfmGetHolidayOrder.InsertActionExecute(Sender: TObject);
Begin
    If AddPositionButton.Enabled
        Then
        AddPositionButton.OnClick(self);
End;

Procedure TfmGetHolidayOrder.DeleteActionExecute(Sender: TObject);
Begin
    If DelPositionButton.Enabled
        Then
        DelPositionButton.OnClick(self);
End;

Procedure TfmGetHolidayOrder.CommitActionExecute(Sender: TObject);
Begin
    If OkButton.Enabled
        Then
        OkButton.OnClick(self);
End;

Procedure TfmGetHolidayOrder.FormClose(Sender: TObject;
    Var Action: TCloseAction);
Begin
    Action := caFree;
End;

Procedure TfmGetHolidayOrder.DetailDataSetAfterOpen(DataSet: TDataSet);
Begin
    PeriodsView.ViewData.Expand(true);
End;


Procedure TfmGetHolidayOrder.SmAddButtonClick(Sender: TObject);
Var
    T: TfrmEditFactValues;
Begin
    If (DetailDataSet.RecordCount > 0)
        Then
    Begin
        If MainOrderDataSet.FieldByName('AUTO_FLAG').Value = Null
            Then
        Begin
            T := TfrmEditFactValues.Create(self,
                StrToInt64(DetailDataSet.FieldByName('ID_ORDER_ITEM').asString),
                self.Key_session,
                StrToInt64(MainOrderDataSet.FieldByName('ID_PCARD').asString),
                DetailDataSet.FieldByName('ID_TYPE_HOLIDAY').Value,
                DetailDataSet.FieldByName('HOLIDAY_BEG').Value,
                DetailDataSet.FieldByName('HOLIDAY_END').Value,
                MainOrderDataSet.FieldByName('ID_WORK_DOG_MOVING').Value,
                MainOrderDataSet.FieldByName('ID_POST').Value,
                MainOrderDataSet.FieldByName('IS_POST_MAIN').Value,
                DetailDataSet.FieldByName('ID_HOLIDAY_PERIOD').Value,
                DetailDataSet.FieldByName('DAYS_COUNT').Value);
            If T.ShowModal = mrYes
                Then
            Begin
                SendMessage(outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);
            End;

            GetData;

            T.Free;
        End
        Else
            agShowMessage('Не можна змінювати автоматично сгенерований пункт!');
    End;
End;

Procedure TfmGetHolidayOrder.cxButton1Click(Sender: TObject);
Var
    DeleteSP: TpFibStoredproc;
Begin
    If (DetailDataSet.RecordCount > 0)
        Then
    Begin
        If agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes
            Then
        Begin
            DeleteSP := TpFibStoredproc.Create(self);
            DeleteSP.Database := WorkDatabase;
            DeleteSP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            DeleteSP.StoredProcName := 'HL_DT_MAN_HOLIDAY_FACT_BUFF_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('KEY_SESSION').asInt64 := self.Key_session;
            DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 :=
                StrToInt64(DetailDataSet.FieldByName('ID_ORDER_ITEM').AsString);
            DeleteSP.ParamByName('WITH_HEADERS').Value := 1;
            DeleteSP.ExecProc;
            DeleteSP.Close;
            DeleteSP.Free;
            WriteTransaction.Commit;
            DetailDataSet.CacheDelete;
        End;
    End;
End;

Procedure TfmGetHolidayOrder.PeriodsViewDblClick(Sender: TObject);
Begin
    SmAddButtonClick(self);
End;

End.

