Unit UEditFactValues;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ExtCtrls, cxClasses, cxStyles,
    cxGridTableView, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
    cxGridCustomTableView, cxGridDBTableView, cxControls, cxGridCustomView,
    cxGrid, cxLookAndFeelPainters, cxButtons, FIBDataSet, pFIBDataSet,
    cxGridBandedTableView, cxGridDBBandedTableView, pFibStoredProc,
    cxContainer, cxDBEdit, cxCheckBox;

Type
    TfrmEditFactValues = Class(TForm)
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
        stContentStrike: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        Panel1: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Panel2: TPanel;
        Panel3: TPanel;
        Panel4: TPanel;
        Panel6: TPanel;
        Panel7: TPanel;
        cxButton1: TcxButton;
        cxGrid2: TcxGrid;
        OrderInfoView: TcxGridDBTableView;
        cxGridDBColumn11: TcxGridDBColumn;
        cxGridDBColumn12: TcxGridDBColumn;
        cxGridDBColumn13: TcxGridDBColumn;
        cxGridDBColumn14: TcxGridDBColumn;
        cxGridLevel2: TcxGridLevel;
        PlanDataSet: TpFIBDataSet;
        PlanDataSource: TDataSource;
        cxGrid1Level1: TcxGridLevel;
        cxGrid1: TcxGrid;
        DataView: TcxGridDBBandedTableView;
        DataViewDBBandedColumn1: TcxGridDBBandedColumn;
        DataViewDBBandedColumn2: TcxGridDBBandedColumn;
        DataViewDBBandedColumn3: TcxGridDBBandedColumn;
        DataViewDBBandedColumn4: TcxGridDBBandedColumn;
        DataViewDBBandedColumn5: TcxGridDBBandedColumn;
        Panel5: TPanel;
        cxDBTextEdit1: TcxDBTextEdit;
        Label1: TLabel;
        OrderInfoDataSet: TpFIBDataSet;
        dsOrderInfo: TDataSource;
        Procedure OkButtonClick(Sender: TObject);
        Procedure CancelButtonClick(Sender: TObject);
        Procedure cxButton3Click(Sender: TObject);
        Procedure cxButton1Click(Sender: TObject);
        Procedure OrderInfoViewDblClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
        id_pcard: int64;
        id_item: int64;
        date_start: TDateTime;
        end_date: TdateTime;
        loc_id_work_dog_moving: variant;
        loc_id_post: variant;
        loc_is_post_main: variant;
        loc_id_holiday_period: variant;
        loc_date_count: integer;
        Constructor Create(AOwner: TComponent;
            id_order_item: int64;
            key_session: int64;
            id_pcard: int64;
            id_type_holiday: Variant;
            DateStart: TDateTime;
            DateEnd: TDateTime;
            id_work_dog_moving: variant;
            id_post: variant;
            is_post_main: variant;
            id_holiday_period: variant;
            date_count: integer); reintroduce;
    End;


Implementation

Uses UpGetHolidayForm, UNewHolidayParams, BaseTypes, AppStruClasses, UpKernelUnit;

{$R *.dfm}

Procedure TfrmEditFactValues.OkButtonClick(Sender: TObject);
Begin
    ModalResult := mrYes;
End;

Procedure TfrmEditFactValues.CancelButtonClick(Sender: TObject);
Begin
    ModalResult := mrNo;
End;

Constructor TfrmEditFactValues.Create(AOwner: TComponent;
    id_order_item: int64;
    key_session: int64;
    id_pcard: int64;
    id_type_holiday: Variant;
    DateStart: TDateTime;
    DateEnd: TDateTime;
    id_work_dog_moving: Variant;
    id_post: variant;
    is_post_main: variant;
    id_holiday_period: Variant;
    date_count: integer);
Begin
    Inherited Create(AOwner);
    self.id_pcard := id_pcard;
    self.id_item := id_order_item;
    self.date_start := DateStart;
    self.loc_id_work_dog_moving := id_work_dog_moving;
    self.loc_id_post := id_post;
    self.loc_is_post_main := is_post_main;
    self.loc_id_holiday_period := id_holiday_period;
    self.loc_date_count := date_count;
    self.end_date := DateEnd;

    PlanDataSet.Database := TfmGetHolidayOrder(Owner).WorkDatabase;
    PlanDataSet.Transaction := TfmGetHolidayOrder(Owner).ReadTransaction;
    PlanDataSet.SelectSQL.Text := 'SELECT * FROM UP_KER_GET_HOL_BY_WORK_DOG(' + IntToStr(id_order_item) + ',' +
        IntToStr(key_session) + ',' + IntToStr(id_pcard) + ',' + VarToStr(self.loc_id_work_dog_moving) + ')';
    PlanDataSet.Open;

    OrderInfoDataSet.Database := TfmGetHolidayOrder(Owner).WorkDatabase;
    OrderInfoDataSet.Transaction := TfmGetHolidayOrder(Owner).ReadTransaction;
    OrderInfoDataSet.SelectSQL.Text := 'SELECT * FROM  HL_DT_MAN_HOLIDAY_FACT_BUFF_DET(' + IntToStr(ID_WORK_DOG_MOVING)
        + ',' + IntToStr(key_session) + ',' + IntToStr(ID_POST) + ',' + IntToStr(IS_POST_MAIN) + ') WHERE ID_ORDER_ITEM ='
        + IntToStr(id_order_item);
    OrderInfoDataSet.Open;

    DataView.ViewData.Expand(true);

    If (id_type_holiday <> null)
        Then
    Begin
        PlanDataSet.Locate('ID_TYPE_HOLIDAY', id_type_holiday, []);
    End;

    OrderInfoView.DataController.DataSource := dsOrderInfo;
    cxDBTextEdit1.DataBinding.DataSource := dsOrderInfo;
    OrderInfoView.ViewData.Expand(true);
End;

Procedure TfrmEditFactValues.cxButton3Click(Sender: TObject);
Begin
    TfmGetHolidayOrder(Owner).DelPositionButtonClick(self);
End;

Procedure TfrmEditFactValues.cxButton1Click(Sender: TObject);
Var
    Params: TfrmNewHolidayParams;
    DeleteSP, UpdateSP: TpFibStoredProc;
    Is_added: Integer;
Begin
    If (PlanDataSet.RecordCount > 0)
        Then
    Begin
        If PlanDataSet.FieldByName('id_holiday_period').Value <> null
            Then
            loc_id_holiday_period := TFIBBCDField(PlanDataSet.FieldByName('id_holiday_period')).AsInt64;


        Params := TfrmNewHolidayParams.Create(self,
            TfmGetHolidayOrder(Owner).WorkDatabase.Handle,
            PlanDataSet.FieldByName('ID_TYPE_HOLIDAY').Value,
            loc_id_holiday_period,
            self.date_start,
            self.end_date,
            loc_date_count,
            id_pcard,
            True,
            -1,
            loc_id_work_dog_moving,
            loc_id_post,
            loc_is_post_main,
            false);

        If Params.ShowModal = mrYes
            Then
        Begin
            //Предварительно удаляем старый пункт
            DeleteSP := TpFibStoredProc.Create(self);
            DeleteSP.Database := TfmGetHolidayOrder(Owner).WorkDatabase;
            DeleteSP.Transaction := TfmGetHolidayOrder(Owner).WriteTransaction;
            TfmGetHolidayOrder(Owner).WriteTransaction.StartTransaction;
            StartHistory(TfmGetHolidayOrder(Owner).WriteTransaction);
            DeleteSP.StoredProcName := 'HL_DT_MAN_HOLIDAY_FACT_BUFF_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('KEY_SESSION').asInt64 := TfmGetHolidayOrder(Owner).Key_session;
            DeleteSP.ParamByName('ID_ORDER_ITEM').AsInt64 := id_item;
            DeleteSP.ExecProc;
            DeleteSP.Close;
            DeleteSP.Free;

            //Добавляем новый с новыми параметрами
            UpdateSP := TpFibStoredProc.Create(self);
            UpdateSP.Database := TfmGetHolidayOrder(Owner).WorkDatabase;
            UpdateSP.Transaction := TfmGetHolidayOrder(Owner).WriteTransaction;
            UpdateSP.StoredProcName := 'HL_UPDATE_BUFFER_HOLIDAY';
            UpdateSP.Prepare;
            UpdateSP.ParamByName('KEY_SESSION').AsInt64 := TfmGetHolidayOrder(Owner).Key_session;
            UpdateSP.ParamByName('ID_ORDER_ITEM').AsInt64 := id_item;
            UpdateSP.ParamByName('IN_HOLIDAY_PERIOD').AsInt64 := Params.HolidayPeriod.Value;
            UpdateSP.ParamByName('ID_TYPE_HOLIDAY').Value := Params.HolidayType.Value;
            UpdateSP.ParamByName('ID_WORK_DOG_MOVING').asInt64 := Params.out_id_work_dog_moving;
            UpdateSP.ParamByName('ID_POST').Value := Params.id_post;
            UpdateSP.ParamByName('IS_POST_MAIN').Value := Params.is_post_main;
            UpdateSP.ParamByName('HOLIDAY_BEG').Value := Params.StartDate.Date;
            UpdateSP.ParamByName('CNT').Value := Params.DayCount.EditValue;

            UpdateSP.ExecProc;
            Is_added := UpdateSP.ParamByName('IS_ADDED').Value;
            TfmGetHolidayOrder(Owner).WriteTransaction.Commit;

            TfmGetHolidayOrder(Owner).MainOrderDataSet.CloseOpen(true);
            TfmGetHolidayOrder(Owner).PeopleView.ViewData.Expand(true);
            If TfmGetHolidayOrder(Owner).MainOrderDataSet.Locate('ID_ORDER_ITEM_OUT', id_item, [])
                Then
            Begin
                TfmGetHolidayOrder(Owner).DetailDataSet.CloseOpen(true);
                OrderInfoView.ViewData.Expand(true);
            End;
            PlanDataSet.CloseOpen(true);
            DataView.ViewData.Expand(true);

            UpdateSP.Free;
            If Is_added = 0
                Then
            Begin
                agMessageDlg('Увага!', 'Не знайдено не відгуляних днів за вибраними параметрами для надання відпустки!',
                    mtConfirmation, [mbOk]);

            End
            Else
                SendMessage(TfmGetHolidayOrder(Owner).outer_hwnd, FMAS_MESS_ITEM_INFO_CHANGED, 0, 0);
        End;

        OrderInfoDataSet.CloseOpen(true);

        Params.Free;
    End;
End;

Procedure TfrmEditFactValues.OrderInfoViewDblClick(Sender: TObject);
Begin
    cxButton1Click(self);
End;

End.

