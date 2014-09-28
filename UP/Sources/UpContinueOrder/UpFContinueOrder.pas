unit UpFContinueOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCommonSp, DB, FIBDatabase, pFIBDatabase, iBase,
  cxLookAndFeelPainters, StdCtrls, cxButtons, FIBQuery, pFIBQuery,
  pFIBStoredProc, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, uEnumControl, uCharControl,
  uBoolControl, uDateControl, uFControl, uLabeledFControl, uSpravControl,
  uLogicCheck, dxBar, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxDockPanel, dxDockControl, ExtCtrls, dxBarExtItems, FIBDataSet,
  pFIBDataSet, ComCtrls, cxGridCardView, cxGridDBCardView, cxButtonEdit,
  cxTextEdit, cxCalendar, cxCheckBox, uIntControl, cxGroupBox,
  cxGridBandedTableView, cxGridDBBandedTableView, uActionControl,
  uFormControl, UpFEditSmeta, UpFBonusEdit, ActnList, cxContainer,
  upStyleContainer, Menus, cxGridCustomPopupMenu, cxGridPopupMenu;


type
  TUPContinueOrder = class(TSprav)
  private
    function DoShow(AsFrame: Boolean): TFrame;
  public
    constructor Create;
    procedure Show; override;
    function GetFrame: TFrame; override;
  end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

type
  TFContinueOrder = class(TForm)
    DBase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Panel1: TPanel;
    OkButton: TcxButton;
    CancleBtn: TcxButton;
    dxBM_OrdAcc: TdxBarManager;
    AddBtn: TdxBarLargeButton;
    DelBtn: TdxBarLargeButton;
    DSetFilter: TpFIBDataSet;
    DSourceFilter: TDataSource;
    cxGridPeople: TcxGrid;
    cxGridPeopleDBTableView1: TcxGridDBTableView;
    GridFilterClNumSubItem: TcxGridDBColumn;
    GridFilterClTn: TcxGridDBColumn;
    GridFilterClFIO: TcxGridDBColumn;
    GridFilterClDateBeg: TcxGridDBColumn;
    GridFilterClDateEnd: TcxGridDBColumn;
    GridFilterClWorkReason: TcxGridDBColumn;
    cxGridPeopleDBCardView2: TcxGridDBCardView;
    GridFilterCardsClTN: TcxGridDBCardViewRow;
    GridFilterCardsClFIO: TcxGridDBCardViewRow;
    GridFilterCardsClWorkReason: TcxGridDBCardViewRow;
    GridFilterCardsClNameDepartment: TcxGridDBCardViewRow;
    GridFilterCardsClNameTypePost: TcxGridDBCardViewRow;
    GridFilterCardsClDateBeg: TcxGridDBCardViewRow;
    GridFilterCardsClDateEnd: TcxGridDBCardViewRow;
    GridFilterCardsClIsMainPost: TcxGridDBCardViewRow;
    cxGridPeopleLevel1: TcxGridLevel;
    cxGridPeopleLevel3: TcxGridLevel;
    cxGridPeopleLevel2: TcxGridLevel;
    cxGridPeopleDBBandedTableView1: TcxGridDBBandedTableView;
    dxBarDockControl1: TdxBarDockControl;
    ExitBtn: TdxBarLargeButton;
    DSetSmets: TpFIBDataSet;
    DSourceSmets: TDataSource;
    GridSmetsClRateCount: TcxGridDBBandedColumn;
    GridSmetsClKoeffPPS: TcxGridDBBandedColumn;
    GridSmetsClKodSmet: TcxGridDBBandedColumn;
    GridSmetsClNameSmet: TcxGridDBBandedColumn;
    GridSmetsClKodSmetPPS: TcxGridDBBandedColumn;
    GridSmetsClNameSmetPPS: TcxGridDBBandedColumn;
    GridSmetsClOkladBae: TcxGridDBBandedColumn;
    GridSmetsClOkladPPS: TcxGridDBBandedColumn;
    AddSmetBtn: TdxBarLargeButton;
    EditSmetBtn: TdxBarLargeButton;
    DelSmetBtn: TdxBarLargeButton;
    GridFilterClId: TcxGridDBColumn;
    GridFilterCardsClPostSalary: TcxGridDBCardViewRow;
    GridFilterCardsClPostSalaryReal: TcxGridDBCardViewRow;
    GridFilterCardsClWorkCond: TcxGridDBCardViewRow;
    GridFilterCardsClPayForm: TcxGridDBCardViewRow;
    GridFilterCardsClReason: TcxGridDBCardViewRow;
    GridFilterCardsClAcceptCond: TcxGridDBCardViewRow;
    GridFilterCardsClAcceptBeg: TcxGridDBCardViewRow;
    GridFilterCardsClAcceptEnd: TcxGridDBCardViewRow;
    GridFilterCardsClHospital: TcxGridDBCardViewRow;
    GridFilterCardsClHoliday: TcxGridDBCardViewRow;
    GridFilterCardsClTerm: TcxGridDBCardViewRow;
    GridFilterCardsClAcceptTerm: TcxGridDBCardViewRow;
    dxBarStatic1: TdxBarStatic;
    dxBarStatic2: TdxBarStatic;
    dxBarStatic3: TdxBarStatic;
    DateEditBar: TdxBarDateCombo;
    ContinueBtn: TdxBarLargeButton;
    GridFilterCardsClTermNew: TcxGridDBCardViewRow;
    qFActionControlSmets: TqFActionControl;
    ActionList: TActionList;
    ActionAddSmet: TAction;
    ActionEditSmet: TAction;
    ActionDelSmet: TAction;
    ActionRefreshSmet: TAction;
    ActionInfoSmet: TAction;
    RefreshBtn: TdxBarLargeButton;
    WriteTransaction: TpFIBTransaction;
    CheckValidOkladDSet: TpFIBDataSet;
    BarEditFoundation: TdxBarEdit;
    dxBarStatic4: TdxBarStatic;
    dxBarStatic5: TdxBarStatic;
    ActionSystem: TAction;
    GridFilterClIdMoving: TcxGridDBColumn;
    GridSmetsClPeriod: TcxGridDBBandedColumn;
    cxGridPeopleLevel4: TcxGridLevel;
    GridBonusView: TcxGridDBBandedTableView;
    GridBonusClRaiseName: TcxGridDBBandedColumn;
    GridBonusClPercent: TcxGridDBBandedColumn;
    GridBonusClSumma: TcxGridDBBandedColumn;
    GridBonusClSmetaKod: TcxGridDBBandedColumn;
    GridBonusClSmetaName: TcxGridDBBandedColumn;
    GridBonusClSmetaPPSKod: TcxGridDBBandedColumn;
    GridBonusClSmetaPPSName: TcxGridDBBandedColumn;
    GridBonusClSummaPPS: TcxGridDBBandedColumn;
    AddBonusBtn: TdxBarLargeButton;
    EditBonusBtn: TdxBarLargeButton;
    DelBonusBtn: TdxBarLargeButton;
    qFActionControlBonus: TqFActionControl;
    DSetBonus: TpFIBDataSet;
    DSourceBonus: TDataSource;
    ActionAddBonus: TAction;
    ActionEditBonus: TAction;
    ActionDelBonus: TAction;
    ActionInfoBonus: TAction;
    ActionRefreshBonus: TAction;
    GridBonusClPeriod: TcxGridDBBandedColumn;
    GridBonusClBonusBeg: TcxGridDBBandedColumn;
    GridBonusClBonusEnd: TcxGridDBBandedColumn;
    PanelBonuses: TPanel;
    CheckBoxAddBonuses: TcxCheckBox;
    CheckBoxReSetBonuses: TcxCheckBox;
    cxGridPopupMenu1: TcxGridPopupMenu;
    PopupMenuGridPeopleView: TPopupMenu;
    GridPeopleFiltering: TMenuItem;
    GridPeopleGroupping: TMenuItem;
    N1: TMenuItem;
    GridPeopleExit: TMenuItem;
    GridPeopleSorting: TMenuItem;
    procedure AddBtnClick(Sender: TObject);
    procedure CancleBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure cxGridPeopleActiveTabChanged(Sender: TcxCustomGrid;
      ALevel: TcxGridLevel);
    procedure cxGridPeopleResize(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure GridFilterCardsClIsMainPostGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ContinueBtnClick(Sender: TObject);
    procedure qFActionControlSmetsBeforePrepare(Sender: TObject; Form: TForm);
    procedure RefreshBtnClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure ActionSystemExecute(Sender: TObject);
    procedure DSetSmetsAfterOpen(DataSet: TDataSet);
    procedure qFActionControlBonusBeforePrepare(Sender: TObject;
      Form: TForm);
    procedure DSetBonusAfterOpen(DataSet: TDataSet);
    procedure qFActionControlSmetsAfterRefresh(Sender: TObject;
      Value: Variant);
    procedure qFActionControlBonusAfterRefresh(Sender: TObject;
      Value: Variant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridPeopleFilteringClick(Sender: TObject);
    procedure GridPeopleGrouppingClick(Sender: TObject);
    procedure GridPeopleExitClick(Sender: TObject);
    procedure GridPeopleSortingClick(Sender: TObject);
  private
    pIdSession: Int64;
    pIdOrder: Int64;
    pIdOrderType: Integer;
    pIdOrderItem: Variant;
    pIdLevel: Int64;
    pNumOrderItem: integer;
    pNumOrderSubItem: integer;
    pMode: integer;
    pOuterHWND: Variant;
    pStyleDM: TStyleContainer;
  public
    constructor Create(aOwner: TComponent; DB_Handle: integer;
      Id_Order_Item: Variant; AsFrame: Boolean; Mode: integer;
      Num_Item, Num_Sub_Item, Id_Order, Id_Order_Type: Variant;
      Outer_HWND: Variant); reintroduce;
  end;

implementation

uses RxMemDS, UpKernelUnit, uUnivSprav, qFTools,
     AppStruClasses, AccMGMT, Math, StrUtils;

{$R *.dfm}

function GetIdSession(DB_Handle:TISC_DB_HANDLE):variant;
var StPr:TpFIBStoredProc;
begin
  StPr := TpFIBStoredProc.Create(nil);
  with StPr do
  begin
    Database := TpFIBDatabase.Create(nil);
    Database.SQLDialect := 3;
    Transaction := TpFIBTransaction.Create(nil);
    Transaction.DefaultDatabase := Database;
    Database.DefaultUpdateTransaction := Transaction;
    Database.Handle := DB_Handle;

    try
      StoredProcName := 'UP_GET_ID_SESSION';
      Transaction.StartTransaction;
      Prepare;
      ExecProc;
      Result := ParamByName('ID_SESSION').AsVariant;
      Transaction.Commit;
    except
      on E:exception do
        begin
         qFErrorDialog(e.Message);
         Transaction.Rollback;
        end;
    end;

    StPr.Destroy;
  end;
end;


function CheckData(DB_Handle:TISC_DB_HANDLE;KEY_SESSION:int64):boolean;
var StPr:TpFIBStoredProc;
begin
  Result:=True;

  StPr := TpFIBStoredProc.Create(nil);
  with StPr do
  begin
    Database := TpFIBDatabase.Create(nil);
    Database.SQLDialect := 3;
    Transaction := TpFIBTransaction.Create(nil);
    Transaction.DefaultDatabase := Database;
    Database.DefaultUpdateTransaction := Transaction;
    Database.Handle := DB_Handle;

    try
      StoredProcName := 'UP_ORDER_CONT_CHECK';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('KEY_SESSION').AsInt64 := key_Session;
      ExecProc;
      Transaction.Commit;
    except
      on E:exception do
        begin
         qFErrorDialog(e.Message);
         Transaction.Rollback;
         Result := False;
        end;
    end;

    StPr.Destroy;
  end;
end;

function GetMinLevel(DB_Handle:TISC_DB_HANDLE):variant;
var StPr:TpFIBStoredProc;
begin
  StPr := TpFIBStoredProc.Create(nil);
  with StPr do
  begin
    Database := TpFIBDatabase.Create(nil);
    Database.SQLDialect := 3;
    Transaction := TpFIBTransaction.Create(nil);
    Transaction.DefaultDatabase := Database;
    Database.DefaultUpdateTransaction := Transaction;
    Database.Handle := DB_Handle;

    try
      StoredProcName := 'UP_KER_GET_MIN_LEVEL';
      Transaction.StartTransaction;
      Prepare;
      ExecProc;
      Result := ParamByName('ID_LEVEL').AsVariant;
      Transaction.Commit;
    except
      on E:exception do
        begin
         qFErrorDialog(e.Message);
         Transaction.Rollback;
        end;
    end;

    StPr.Destroy;
  end;
end;

function GetOneItemData(DB_Handle:TISC_DB_HANDLE;KeySession:Int64;IdOrderItem:Int64):boolean;
var StPr:TpFIBStoredProc;
begin
  Result := True;
  StPr := TpFIBStoredProc.Create(nil);
  with StPr do
  begin
    Database := TpFIBDatabase.Create(nil);
    Database.SQLDialect := 3;
    Transaction := TpFIBTransaction.Create(nil);
    Transaction.DefaultDatabase := Database;
    Database.DefaultUpdateTransaction := Transaction;
    Database.Handle := DB_Handle;

    try
      StoredProcName := 'UP_ORDER_COPY_ITEM_DATA_TO_BUFF';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('ID_ORDER_ITEM').AsInt64 := IdOrderItem;
      ParamByName('KEY_SESSION').AsInt64 := KeySession;
      ExecProc;
      Transaction.Commit;
    except
      on E:exception do
        begin
         qFErrorDialog(e.Message);
         Transaction.Rollback;
         Result := False;
        end;
    end;

    StPr.Destroy;
  end;
end;

function CreateSprav: TSprav;
begin
  Result := TUPContinueOrder.Create;
end;

constructor TUPContinueOrder.Create;
begin
  inherited Create;
 // создание входных/выходных полей
  Input.FieldDefs.Add('mode', ftInteger);
  Input.FieldDefs.Add('Id_order', ftVariant);
  Input.FieldDefs.Add('Id_Item', ftVariant);
  Input.FieldDefs.Add('Id_order_type', ftVariant);
  Input.FieldDefs.Add('num_item', ftVariant);
  Input.FieldDefs.Add('num_sub_item', ftVariant);
  Input.FieldDefs.Add('outer_hwnd', ftInteger);

  OutPut.FieldDefs.Add('Id_item', ftLargeint);
  PrepareMemoryDatasets;
end;


function TUPContinueOrder.DoShow(AsFrame: Boolean): TFrame;
var
  pMode : integer;
  UPForm: TFContinueOrder;
begin

  if (VarIsNull(Input['Mode'])) then pMode := 0
                                else pMode := Input['Mode'];

  UPForm := TFContinueOrder.Create(Application.MainForm, Input['DBHandle'], Input['Id_Item'],
    AsFrame, pMode, Input['Num_Item'], Input['Num_Sub_Item'], Input['Id_Order'],
    Input['Id_Order_Type'], Input['Outer_HWND']);

  if AsFrame then Result := TFrame(UPForm)
  else
    with UPForm do
    begin
      if ShowModal = mrOk then
      begin
           //Забираем идентификатор выбранного приказа
      end;
      Free;
      Result := nil;
    end;
end;

function TUPContinueOrder.GetFrame: TFrame;
begin
  Result := DoShow(True);
end;

procedure TUPContinueOrder.Show;
begin
  DoShow(False);
end;


constructor TFContinueOrder.Create(aOwner: TComponent; DB_Handle: integer;
      Id_Order_Item: Variant; AsFrame: Boolean; Mode: integer;
      Num_Item, Num_Sub_Item, Id_Order, Id_Order_Type: Variant;
      Outer_HWND: Variant);
begin
 inherited Create(aOwner);
 pMode := Mode;
 DBase.Handle := TISC_DB_Handle(db_handle);
 WindowState := wsMaximized;

 pIdOrder := id_order;
 pIdOrderItem := Id_Order_Item;
 pIdOrderType := id_order_type;
 pNumOrderItem := Num_Item;
 pNumOrderSubItem := Num_Sub_Item;
 pOuterHWND := Outer_HWND;
 qFActionControlBonus.SelectDataSet := DSetBonus;

 pIdSession := GetIdSession(DBase.Handle);
 pIdLevel := GetMinLevel(DBase.Handle);

 if (pMode=1) then
    begin
        GetOneItemData(DBase.Handle,pIdSession,pIdOrderItem);
        AddBtn.Visible := ivNever;
        DelBtn.Visible := ivNever;
    end;


 DSetFilter.SQLs.SelectSQL.Text := 'SELECT * FROM UP_ORDER_MOVE_GET_FILTER_DATA('+
                                    IntToStr(pIdSession)+')';
 DSetSmets.SQLs.SelectSQL.Text  := 'SELECT * FROM UP_ORDER_MOVE_GET_SMETS('+
                                    IntToStr(pIdSession)+',?ID_ORDER_ITEM)';
 DSetBonus.SQLs.SelectSQL.Text  := 'SELECT * FROM UP_ORDER_MOVE_GET_BONUSES('+
                                    IntToStr(pIdSession)+',?ID_ORDER_ITEM)';

 CheckValidOkladDSet.SQLs.SelectSQL.Text := 'SELECT * FROM UP_CHECK_VALID_OKLAD_ALL('+IntToStr(pIdSession)+')';

 DSetFilter.Open;
 DSetSmets.Open;
 DSetBonus.Open;

 qFActionControlSmets.Database       := DBase;
 qFActionControlSmets.SelectDataSet  := DSetSmets;

 qFActionControlBonus.Database       := DBase;
 qFActionControlBonus.SelectDataSet  := DSetBonus;

 if AsFrame then
    begin
        self.BorderStyle := bsNone;
        self.BorderIcons := [];
        self.Visible := true;
    end;


 cxGridPeopleActiveTabChanged(cxGridPeople,cxGridPeopleLevel1);

 //Стили
 pStyleDM := TStyleContainer.Create(self);
 cxGridPeopleDBTableView1.Styles.StyleSheet       := pStyleDM.TableViewSheet;
 cxGridPeopleDBCardView2.Styles.StyleSheet        := pStyleDM.CardViewSheet;
 cxGridPeopleDBBandedTableView1.Styles.StyleSheet := pStyleDM.BandedTableViewSheet;
 GridBonusView.Styles.StyleSheet                  := pStyleDM.BandedTableViewSheet;
 
 SendMessage(outer_hwnd, FMAS_MESS_GET_BUTTON_OK, OkButton.Handle, OkButton.Handle);
 SendMessage(outer_hwnd, FMAS_MESS_GET_BUTTON_CANCEL, OkButton.Handle, CancleBtn.Handle);
end;

procedure TFContinueOrder.AddBtnClick(Sender: TObject);
var   PC: TFMASAppModule;
      Count:Integer;
      StPr:TpFIBStoredProc;
begin
      with TFMASAppModuleCreator.Create do
      begin
              PC :=CreateFMASModule(ExtractFilePath(Application.ExeName)+'up\','up_filter');
              if (PC<>nil)
              then begin
                        //Инициализация входящих параметров
                        PC.InParams.Items['AOwner']        :=@self;
                        PC.InParams.Items['DbHandle']      :=PInteger(@DBase.Handle);
                        PC.InParams.Items['Id_User']       :=PInteger(@GetUserId);
                        PC.InParams.Items['Id_order_type'] :=PInteger(@pIdOrderType);
                        PC.InParams.Items['KEY_SESSION']   :=PInt64(@pIdSession);

                        //Запуск фильтра
                        (PC as IFMASModule).Run;

                        //Получение количества записей которые вернул фильтр
                        Count:=PInteger(PC.OutParams.Items['Count'])^;
                        if (Count<>-1) then
                          begin
                            StPr := TpFIBStoredProc.Create(nil);
                            with StPr do
                            try
                              Database := TpFIBDatabase.Create(nil);
                              Database.SQLDialect := 3;
                              Transaction := TpFIBTransaction.Create(nil);
                              Transaction.DefaultDatabase := Database;
                              Database.DefaultUpdateTransaction := Transaction;
                              Database.Handle := DBase.Handle;

                              try
                                StoredProcName := 'UP_ORDER_MOVE_COPY_FILTER_DATA';
                                Transaction.StartTransaction;
                                Prepare;
                                ParamByName('KEY_SESSION').AsInt64   := pIdSession;
                                ParamByName('ID_ORDER').AsInt64      := pIdOrder;
                                ParamByName('ID_ORDER_TYPE').AsInt64 := pIdOrderType;
                                ParamByName('NUM_ITEM').AsInteger    := pNumOrderItem;
                                ExecProc;
                                Transaction.Commit;
                                DSetFilter.CloseOpen(True);
                                DSetSmets.CloseOpen(True);
                                DSetBonus.CloseOpen(True);
                              except
                              on E:exception do
                                begin
                                   qFErrorDialog(e.Message);
                                   if Transaction.InTransaction then Transaction.Rollback;
                                end;
                              end;
                            finally
                              StPr.Destroy;
                            end;
                          end;
              end
              else MessageDlg('Помилка при використанні модуля up_filter.bpl',mtError,[mbOk],0);
      end;
end;

procedure TFContinueOrder.CancleBtnClick(Sender: TObject);
begin
 SendMessage(pOuterHWND, FMAS_MESS_CLOSE_FRAME, 0, 0);
end;

procedure TFContinueOrder.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFContinueOrder.cxGridPeopleActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
 if ALevel=cxGridPeopleLevel1 then
    begin
      AddSmetBtn.Visible  := ivNever;
      EditSmetBtn.Visible := ivNever;
      DelSmetBtn.Visible  := ivNever;

      AddBonusBtn.Visible := ivNever;
      EditBonusBtn.Visible:= ivNever;
      DelBonusBtn.Visible := ivNever;

      AddBtn.Visible      := ivAlways;
      DelBtn.Visible      := ivAlways;
      DateEditBar.Visible := ivAlways;
      BarEditFoundation.Visible := ivAlways;
      ContinueBtn.Visible := ivAlways;
      PanelBonuses.Visible:= True;

    end;
 if ALevel=cxGridPeopleLevel2 then
    begin
      AddSmetBtn.Visible  := ivAlways;
      EditSmetBtn.Visible := ivAlways;
      DelSmetBtn.Visible  := ivAlways;

      AddBonusBtn.Visible := ivNever;
      EditBonusBtn.Visible:= ivNever;
      DelBonusBtn.Visible := ivNever;

      AddBtn.Visible      := ivNever;
      DelBtn.Visible      := ivNever;
      DateEditBar.Visible := ivNever;
      BarEditFoundation.Visible := ivNever;
      ContinueBtn.Visible := ivNever;

      PanelBonuses.Visible:= False;
    end;
 if ALevel=cxGridPeopleLevel4 then
    begin
      AddSmetBtn.Visible  := ivNever;
      EditSmetBtn.Visible := ivNever;
      DelSmetBtn.Visible  := ivNever;

      AddBonusBtn.Visible := ivAlways;
      EditBonusBtn.Visible:= ivAlways;
      DelBonusBtn.Visible := ivAlways;

      AddBtn.Visible      := ivNever;
      DelBtn.Visible      := ivNever;
      DateEditBar.Visible := ivNever;
      BarEditFoundation.Visible := ivNever;      
      ContinueBtn.Visible := ivNever;

      PanelBonuses.Visible:= False;
    end;

  if DSetFilter['DATE_END']=DSetFilter['OLD_DATE_END'] then
     begin
      AddSmetBtn.Enabled  := False;
      EditSmetBtn.Enabled := False;
      DelSmetBtn.Enabled  := False;

      AddBonusBtn.Enabled  := False;
      EditBonusBtn.Enabled := False;
      DelBonusBtn.Enabled  := False;
     end
  else
     begin
      AddSmetBtn.Enabled  := True;
      EditSmetBtn.Enabled := True;
      DelSmetBtn.Enabled  := True;

      AddBonusBtn.Enabled  := True;
      EditBonusBtn.Enabled := True;
      DelBonusBtn.Enabled  := True;

     end;
end;

procedure TFContinueOrder.cxGridPeopleResize(Sender: TObject);
begin
 cxGridPeopleDBCardView2.OptionsView.CardWidth := TcxGrid(Sender).Width - 100;
end;

procedure TFContinueOrder.Panel1Resize(Sender: TObject);
begin
 OkButton.Left := TPanel(Sender).Width - 200;
 CancleBtn.Left := OkButton.Left+OkButton.Width+10;
end;

procedure TFContinueOrder.DelBtnClick(Sender: TObject);
var StPr:TpFIBStoredProc;
    i:integer;
begin
  if cxGridPeopleDBTableView1.Controller.FocusedRecord<>nil then
  begin
    StPr := TpFIBStoredProc.Create(nil);
    with StPr do
    begin
      Database := TpFIBDatabase.Create(nil);
      Database.SQLDialect := 3;
      Transaction := TpFIBTransaction.Create(nil);
      Transaction.DefaultDatabase := Database;
      Database.DefaultUpdateTransaction := Transaction;
      Database.Handle := DBase.Handle;

      try
        StoredProcName := 'UP_ORDER_MOVE_DEL_FILTER_DATA';
        Transaction.StartTransaction;
        Prepare;
        ParamByName('KEY_SESSION').AsInt64 := pIdSession;

        for i:=0 to cxGridPeopleDBTableView1.Controller.SelectedRecordCount-1 do
          begin
            ParamByName('ID_ORDER_ITEM').AsVariant := cxGridPeopleDBTableView1.Controller.SelectedRecords[i].Values[GridFilterClId.Index];
            ExecProc;
          end;

        StoredProcName := 'UP_ORDER_RECOUNT_SUBITEMS';
        Prepare;
        ParamByName('KEY_SESSION').AsInt64 := pIdSession;
        ParamByName('ID_ORDER').AsInt64 := pIdOrder;
        ExecProc;

        Transaction.Commit;
        DSetFilter.CloseOpen(True);
        DSetSmets.CloseOpen(True);
        DSetBonus.CloseOpen(True);
      except
        on E:exception do
          begin
           qFErrorDialog(e.Message);
           Transaction.Rollback;
          end;
      end;

      StPr.Destroy;
    end;
  end;
end;

procedure TFContinueOrder.GridFilterCardsClIsMainPostGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText='1' then AText:='Так'
             else AText:='Ні';
end;

procedure TFContinueOrder.ContinueBtnClick(Sender: TObject);
var StPr:TpFIBStoredProc;
    i,j:integer;
    id:variant;
    str:string;
    FoundationText:string;
    PosSystem: integer;
    NameColumn:string;
begin
//  ActionSystemExecute(sender);

  if  (cxGridPeople.ActiveView=cxGridPeopleDBTableView1) and
      (cxGridPeopleDBTableView1.Controller.FocusedRecord<>nil) and
      (cxGridPeopleDBTableView1.Controller.SelectedRecordCount>0) then
  begin
    id := cxGridPeopleDBTableView1.Controller.FocusedRecord.Values[GridFilterClId.Index];

    StPr := TpFIBStoredProc.Create(nil);
    with StPr do
    begin
      Database := TpFIBDatabase.Create(nil);
      Database.SQLDialect := 3;
      Transaction := TpFIBTransaction.Create(nil);
      Transaction.DefaultDatabase := Database;
      Database.DefaultUpdateTransaction := Transaction;
      Database.Handle := DBase.Handle;

      try
        StoredProcName := 'UP_ORDER_CONT_SET_TERM';
        Transaction.StartTransaction;
        Prepare;
        ParamByName('KEY_SESSION').AsInt64      := pIdSession;
        ParamByName('DATE_END').AsDate          := DateEditBar.Date;
        ParamByName('ADD_BONUSES').AsString     := ifThen(CheckBoxAddBonuses.Checked,'T','F');
        ParamByName('RE_SET_BONUSES').AsString  := IfThen(CheckBoxReSetBonuses.Checked,'T','F');

        for i:=0 to cxGridPeopleDBTableView1.Controller.SelectedRecordCount-1 do
          begin

            str := Trim(BarEditFoundation.Text)+' % ';
            FoundationText := '';
            while str<>'' do
            begin
               PosSystem := pos('%',str);
               if PosSystem=0 then FoundationText := Trim(FoundationText)+' '+str
               else
                  begin
                    FoundationText := Trim(FoundationText) + ' '+copy(str,1,PosSystem-1);
                    delete(str,1,PosSystem);
                    PosSystem := pos(' ',str);
                    NameColumn := copy(str,1,PosSystem-1);
                    delete(str,1,PosSystem);
                    for j:=0 to cxGridPeopleDBTableView1.ColumnCount-1 do
                      if AnsiUpperCase(cxGridPeopleDBTableView1.Columns[j].Caption) = AnsiUpperCase(NameColumn) then
                         FoundationText:=Trim(Trim(FoundationText)+' '+
                            VarToStrDef(cxGridPeopleDBTableView1.Controller.SelectedRecords[i].Values[cxGridPeopleDBTableView1.Columns[j].Index],''));
              end;
            end;

            ParamByName('ID_MOVING').AsVariant := cxGridPeopleDBTableView1.Controller.SelectedRecords[i].Values[GridFilterClIdMoving.Index];
            ParamByName('ID_ORDER_ITEM').AsVariant := cxGridPeopleDBTableView1.Controller.SelectedRecords[i].Values[GridFilterClId.Index];
            ParamByName('REASON').AsString := FoundationText;
            ExecProc;


          end;

        Transaction.Commit;

        DSetFilter.CloseOpen(True);
        DSetSmets.CloseOpen(True);
        DSetBonus.CloseOpen(True);
        cxGridPeopleDBTableView1.DataController.LocateByKey(id);
      except
        on E:exception do
          begin
           qFErrorDialog(e.Message);
           Transaction.Rollback;
          end;
      end;

      StPr.Destroy;
    end;
  end
  else
   if cxGridPeopleDBTableView1.Controller.SelectedRecordCount=0 then
      qFErrorDialog('Необхідно обрати переміщення для продовження!!!');

end;

procedure TFContinueOrder.qFActionControlSmetsBeforePrepare(Sender: TObject;
  Form: TForm);
var
    ID_Post_salary:variant;
begin
//  ActionSystemExecute(self);

  if not VarIsNULL(DSetFilter['ID_POST_SALARY_REAL'])
  then id_post_salary := DSetFilter['ID_POST_SALARY_REAL']
  else id_post_salary := DSetFilter['ID_POST_SALARY'];

  if Form is TUpEditSmeta then
      with Form as TUpEditSmeta do
           Prepare(DBase.Handle, pIdSession, DSetFilter['ID_ORDER_ITEM'], id_post_salary,
                   DSetFilter['ID_DEPARTMENT'],DSetFilter['ID_TYPE_POST'],
                   pIdLevel,
                   DSetFilter['DATE_BEG'],DSetSmets['DATE_END'],
                   False, DSetFilter['ID_PCARD']);
end;

procedure TFContinueOrder.RefreshBtnClick(Sender: TObject);
begin
DSetSmets.Close;
DSetBonus.Close;
DSetFilter.CloseOpen(True);
DSetSmets.Open;
DSetBonus.Open;
end;

procedure TFContinueOrder.OkButtonClick(Sender: TObject);
var IsOk:boolean;
    param: UP_KERNEL_MODE_STRUCTURE;
begin
  if not CheckData(DBase.Handle,pIdSession) then exit;
  
  IsOk := True;
  DSetFilter.First;

  while (not DSetFilter.Eof) and IsOk do
   begin
      CheckValidOkladDSet.Close;
      CheckValidOkladDSet.Open;

      if (CheckValidOkladDSet.IsEmpty) then
        begin
          qFErrorDialog('Невірно встановлені оклади!');
          IsOk := False;
        end;

      DSetFilter.Next;
   end;

   if IsOk then
    begin
      DSetFilter.First;

      WriteTransaction.StartTransaction;

      param.AOWNER := self;
      param.ID_ORDER := pIdOrder;
      param.KEY_SESSION := pIdSession;
      param.DBHANDLE := DBase.Handle;
      param.TRHANDLE := WriteTransaction.Handle;

      while (not DSetFilter.Eof) and (IsOk) do
       begin
          param.ID_ORDER_ITEM_IN := DSetFilter['ID_ORDER_ITEM'];
          IsOk := UpKernelDo(@param);
          DSetFilter.Next;
       end;
    end;

    if IsOk then
      begin
        If WriteTransaction.InTransaction then WriteTransaction.Commit;
        SendMessage(pOuterHWND, FMAS_MESS_SAVE_ITEM_OK, 0, 0);
      end
    else
      GetUpSessionErrors( Self, DBase.Handle, pIdSession, param.ID_ORDER_ITEM_IN);
end;

procedure TFContinueOrder.ActionSystemExecute(Sender: TObject);
var i:integer;
    textMSG: string;
begin
 textMSG := 'KEY_SESSION = '+IntToStr(pIdSession)+#13;
 for i:=0 to DSetFilter.Fields.Count-1 do
   textMSG := textMSG + DSetFilter.Fields.Fields[i].FieldName +' = '+
              VarToStrDef(DSetFilter.Fields.Fields[i].Value,'NULL')+#13;

 ShowMessage(textMSG);
end;

procedure TFContinueOrder.DSetSmetsAfterOpen(DataSet: TDataSet);
begin
 cxGridPeopleDBBandedTableView1.ViewData.Expand(True);
end;

procedure TFContinueOrder.qFActionControlBonusBeforePrepare(
  Sender: TObject; Form: TForm);
begin
  if Form is TfmBonusEdit then
      with Form as TfmBonusEdit do
       begin
           Prepare(DBase.Handle, pIdSession, DSetFilter['ID_ORDER_ITEM'], DSetFilter['DATE_BEG']);
       end;
end;

procedure TFContinueOrder.DSetBonusAfterOpen(DataSet: TDataSet);
begin
 GridBonusView.ViewData.Expand(True);
end;

procedure TFContinueOrder.qFActionControlSmetsAfterRefresh(Sender: TObject;
  Value: Variant);
begin
RefreshBtnClick(sender);
end;

procedure TFContinueOrder.qFActionControlBonusAfterRefresh(Sender: TObject;
  Value: Variant);
begin
RefreshBtnClick(Sender);
end;

procedure TFContinueOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
var StPr:TpFIBStoredProc;
begin
//  if qFConfirm('Відмінити формування пункту наказу?') then
  begin
      StPr := TpFIBStoredProc.Create(nil);
      with StPr do
      begin
        Database := TpFIBDatabase.Create(nil);
        Database.SQLDialect := 3;
        Transaction := TpFIBTransaction.Create(nil);
        Transaction.DefaultDatabase := Database;
        Database.DefaultUpdateTransaction := Transaction;
        Database.Handle := DBase.Handle;

        try
          StoredProcName := 'UP_ORDER_MOVE_CLEAR_BUFF_DATA';
          Transaction.StartTransaction;
          Prepare;
          ParamByName('KEY_SESSION').AsInt64 := pIdSession;
          ExecProc;
          Transaction.Commit;
        except
          on E:exception do
            begin
             qFErrorDialog(e.Message);
             Transaction.Rollback;
            end;
        end;

        StPr.Destroy;
      end;
  end;
end;

procedure TFContinueOrder.GridPeopleFilteringClick(Sender: TObject);
begin
 GridPeopleFiltering.Checked := not GridPeopleFiltering.Checked;
 cxGridPeopleDBTableView1.OptionsCustomize.ColumnFiltering := GridPeopleFiltering.Checked;
end;

procedure TFContinueOrder.GridPeopleGrouppingClick(Sender: TObject);
begin
 GridPeopleGroupping.Checked := not GridPeopleGroupping.Checked;
 cxGridPeopleDBTableView1.OptionsView.GroupByBox := GridPeopleGroupping.Checked;
 cxGridPeopleDBTableView1.OptionsCustomize.ColumnGrouping := GridPeopleGroupping.Checked;
end;

procedure TFContinueOrder.GridPeopleExitClick(Sender: TObject);
begin
  CancleBtnClick(sender);
end;

procedure TFContinueOrder.GridPeopleSortingClick(Sender: TObject);
begin
 GridPeopleSorting.Checked := not GridPeopleSorting.Checked;
 cxGridPeopleDBTableView1.OptionsCustomize.ColumnSorting := GridPeopleSorting.Checked;
end;

end.
