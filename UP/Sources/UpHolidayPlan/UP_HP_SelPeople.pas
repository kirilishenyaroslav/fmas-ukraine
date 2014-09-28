unit UP_HP_SelPeople;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, UP_HP_DM,
    cxDataStorage, cxEdit, DB, cxDBData, ActnList, dxBar, dxBarExtItems,
    cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
    cxControls, cxGridCustomView, cxGrid, cxClasses, Placemnt, ImgList,
    uFControl, uLabeledFControl, uEnumControl, ExtCtrls, FIBQuery, pFIBQuery,
    FIBDataSet, pFIBDataSet, qFTools, UpKernelUnit;

type
    THP_SelectPeople = class(TForm)
        ImageList1: TImageList;
        FormStorage1: TFormStorage;
        DS_HP_full: TDataSource;
        cxG_HP_All: TcxGrid;
        People_View: TcxGridDBTableView;
        People_ViewDBColumn5: TcxGridDBColumn;
        People_ViewDBColumn4: TcxGridDBColumn;
        People_ViewDBColumn1: TcxGridDBColumn;
        People_ViewDBColumn6: TcxGridDBColumn;
        cxG_HP_AllLevel1: TcxGridLevel;
        dxBarManager1: TdxBarManager;
        dxBLB_Add: TdxBarLargeButton;
        dxBLB_Del: TdxBarLargeButton;
        dxBarDockControl1: TdxBarDockControl;
        ActionList1: TActionList;
        AddA: TAction;
        DelA: TAction;
        OkA: TAction;
        CancelA: TAction;
        Panel1: TPanel;
        qFEC_Interval: TqFEnumControl;
        dxBarLargeButton1: TdxBarLargeButton;
        dxBarLargeButton2: TdxBarLargeButton;
        qFEC_Level: TqFEnumControl;
        pFIBDS_FillPeriod: TpFIBDataSet;
        pFIBDS_FillLevel: TpFIBDataSet;
        pFIBQ_FillList: TpFIBQuery;
        Action1: TAction;
        cxStyleRepository1: TcxStyleRepository;
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
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        constructor Create(aOwner: TComponent; DM: THP_Dm); reintroduce;
        procedure AddAExecute(Sender: TObject);
        procedure DelAExecute(Sender: TObject);
        procedure OkAExecute(Sender: TObject);
        procedure CancelAExecute(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure Action1Execute(Sender: TObject);
    private
        DModule: THP_Dm;
        def_level, def_year: int64;
        { Private declarations }
    public
        key_session: int64;
        { Public declarations }
    end;

implementation

uses AppStruClasses, AccMgmt;

{$R *.dfm}

constructor THP_SelectPeople.Create(aOwner: TComponent; DM: THP_Dm);
var
    i: integer;
    VString: string;
begin
    inherited Create(aOwner);

    DModule := DM;

    with DModule do
    begin
        pFIBT_Write.StartTransaction;
        pFIBDS_GetIdSession.Open;
        key_session := pFIBDS_GetIdSession['id_session'];
        pFIBDS_GetIdSession.Close;
        pFIBT_Write.Commit;
    end;

    VString := '';

    pFIBDS_FillPeriod.Database := DModule.pFIBD_HP;
    pFIBDS_FillPeriod.Transaction := DModule.pFIBT_Read;
    pFIBDS_FillPeriod.Open;
    pFIBDS_FillPeriod.First;

    for i := pFIBDS_FillPeriod['ACT_PERIOD'] - 5 to pFIBDS_FillPeriod['ACT_PERIOD'] + 5 do
    begin
        VString := VString + IntToStr(i);
        qFEC_Interval.Items.Add(IntToStr(i));
        if (i <> pFIBDS_FillPeriod['ACT_PERIOD'] + 5) then
            VString := VString + ',';
    end;

    qFEC_Interval.ValuesString := VString;
    VString := '';

    def_year := pFIBDS_FillPeriod['ACT_PERIOD'];

    pFIBDS_FillPeriod.Close;
    ;

    pFIBDS_FillLevel.Database := DModule.pFIBD_HP;
    pFIBDS_FillLevel.Transaction := DModule.pFIBT_Read;
    pFIBDS_FillLevel.Open;
    pFIBDS_FillLevel.First;

    while not pFIBDS_FillLevel.Eof do
    begin
        qFEC_Level.Items.Add(pFIBDS_FillLevel['level_name']);
        VString := VString + IntToStr(pFIBDS_FillLevel['id_level']);

        pFIBDS_FillLevel.Next;
        if (not pFIBDS_FillLevel.Eof) then
            VString := VString + ',';
    end;

    qFEC_Level.ValuesString := VString;

    def_level := pFIBDS_FillLevel['id_def'];

    pFIBDS_FillLevel.Close;

    pFIBQ_FillList.Database := DModule.pFIBD_HP;
    pFIBQ_FillList.Transaction := DModule.pFIBT_Write;
    pFIBQ_FillList.ParamByName('id_key').AsInt64 := key_session;

    DModule.pFIBDS_SelectPeople.Close;
    DModule.pFIBDS_SelectPeople.ParamByName('id_key').AsInt64 := key_session;
    DS_HP_full.DataSet := DModule.pFIBDS_SelectPeople;
end;

procedure THP_SelectPeople.AddAExecute(Sender: TObject);
var
    PC: TFMASAppModule;
    Count, id_user, id_order_type: Integer;
begin
    id_user := AccMgmt.GetUserId;
    id_order_type := -1;
    with TFMASAppModuleCreator.Create do
    begin
        PC := CreateFMASModule(ExtractFilePath(Application.ExeName) + 'up\', 'up_filter');
        if (PC <> nil) then
        begin
            //Инициализация входящих параметров
            PC.InParams.Items['AOwner'] := @self;
            PC.InParams.Items['DbHandle'] := PInteger(@DModule.pFIBD_HP.Handle);
            PC.InParams.Items['Id_User'] := PInteger(@id_user);
            PC.InParams.Items['Id_order_type'] := PInteger(@id_order_type);
            PC.InParams.Items['KEY_SESSION'] := PInt64(@Key_session);

            //Запуск фильтра
            (PC as IFMASModule).Run;

            //Получение количества записей которые вернул фильтр
            Count := PInteger(PC.OutParams.Items['Count'])^;
            if (Count > 0) then
            begin
                DModule.pFIBT_Write.StartTransaction;
                pFIBQ_FillList.ExecProc;
                DModule.pFIBT_Write.Commit;
                DModule.pFIBDS_SelectPeople.CloseOpen(True);
            end;
        end
        else
            qFErrorDialog('Помилка при використанні модуля up_filter.bpl');
        //MessageDlg('Помилка при використанні модуля up_filter.bpl',mtError,[mbOk],-1);
    end;
end;

procedure THP_SelectPeople.DelAExecute(Sender: TObject);
begin
    with DModule do
    begin
        if (pFIBDS_SelectPeople.IsEmpty) then
            Exit;

        try
            pFIBT_Write.StartTransaction;
            pFIBQ_DeletePeople.ParamByName('id_rec').AsInt64 := pFIBDS_SelectPeople['id_record'];
            pFIBQ_DeletePeople.ExecProc;
            pFIBT_Write.Commit;
        except on e: Exception do
            begin
                pFIBT_Write.Rollback;
                qFErrorDialog('Не вдалося вилучити: ' + e.Message);
                //MessageDlg('Не вдалося вилучити: '+e.Message,mtError,[mbOk],-1);
            end;
        end;
    end;
end;

procedure THP_SelectPeople.OkAExecute(Sender: TObject);
begin
    try
        if (DModule.pFIBDS_SelectPeople.IsEmpty) then
            ModalResult := mrCancel
        else
            ModalResult := mrOk;
        DModule.pFIBDS_SelectPeople.Close;
    except on E: Exception do
        begin
            exit;
        end;
    end;
end;

procedure THP_SelectPeople.CancelAExecute(Sender: TObject);
begin
    Close;
end;

procedure THP_SelectPeople.FormShow(Sender: TObject);
begin
    qFEC_Level.Value := def_level;
    qFEC_Interval.Value := def_year;
end;

procedure THP_SelectPeople.Action1Execute(Sender: TObject);
begin
    ShowInfo(DModule.pFIBDS_HP_Full);
end;

end.
