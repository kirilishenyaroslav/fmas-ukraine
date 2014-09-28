unit BsDiscountObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, DB, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, dxBar, dxBarExtItems, ActnList, cxMaskEdit, ImgList,
  cxClasses, cxGridTableView,  uCommon_Types, FIBQuery,
  pFIBQuery, pFIBStoredProc, ExtCtrls, DateUtils, cxTextEdit, cxDBEdit,
  cxContainer, cxEdit, cxLabel, uCommon_Messages, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, cxButtonEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit, uCommon_Loader,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Menus,
  uCommon_Funcs, uConsts, cxCheckBox, BsMemoFilter, BsUnivSprav;

const
   pnlGridHeight=200;
   frmTop=180;


type
  frmButton = (fbAdd, fbModif, fbDelete, fbSelect, fbExit, fbFilter, fbClear, fbRedo, fbUndo, fbPrint);
  frmButtons = set of frmButton;

  TfrmDiscountObj = class(TForm)
    DisObjDB: TpFIBDatabase;
    ObjectTransRead: TpFIBTransaction;
    ObjectTransWrite: TpFIBTransaction;
    ActionList1: TActionList;
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
    ContentError: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    ImageList: TImageList;
    StoredProc: TpFIBStoredProc;
    lblAdres: TcxLabel;
    lblNumPorch: TcxLabel;
    NumPorchEdit: TcxTextEdit;
    NumFloorEdit: TcxTextEdit;
    NumFlatObjEdit: TcxTextEdit;
    lblNumFloor: TcxLabel;
    lblNumFlatObj: TcxLabel;
    lblNumFlatFloor: TcxLabel;
    NumFlatFloorEdit: TcxTextEdit;
    pnlGrid: TPanel;
    pnlMain: TPanel;
    BarManager: TdxBarManager;
    btn: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    btnSelect: TdxBarLargeButton;
    btnClose: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    btnFliter: TdxBarLargeButton;
    btnClear: TdxBarLargeButton;
    ActIns: TAction;
    ActEdit: TAction;
    ActDel: TAction;
    ActSelect: TAction;
    ActClose: TAction;
    ActFilter: TAction;
    ActClear: TAction;
    FIlterGridDBView: TcxGridDBTableView;
    FIlterGridLevel: TcxGridLevel;
    FIlterGrid: TcxGrid;
    StreetBox: TcxLookupComboBox;
    StreetDS: TDataSource;
    StreetDSet: TpFIBDataSet;
    btnRedo: TdxBarLargeButton;
    btnUndo: TdxBarLargeButton;
    ActRedo: TAction;
    ActUndo: TAction;
    TimeEnter: TTimer;
    FilterSet: TpFIBDataSet;
    FilterDS: TDataSource;
    pnlAction: TPanel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    ActOk: TAction;
    ActCancel: TAction;
    FIlterGridDBViewDBColumn1: TcxGridDBColumn;
    FIlterGridDBViewDBColumn2: TcxGridDBColumn;
    FIlterGridDBViewDBColumn3: TcxGridDBColumn;
    FIlterGridDBViewDBColumn4: TcxGridDBColumn;
    FIlterGridDBViewDBColumn5: TcxGridDBColumn;
    lblHouse: TcxLabel;
    HouseEdit: TcxTextEdit;
    KorpusEdit: TcxTextEdit;
    lblKorpus: TcxLabel;
    BsRegionBox: TcxLookupComboBox;
    lblRegion: TcxLabel;
    pnlAdr: TPanel;
    lblCItyArea: TcxLabel;
    CityAreaBox: TcxLookupComboBox;
    CityAreaDS: TDataSource;
    CityAreaDSet: TpFIBDataSet;
    RegionDSet: TpFIBDataSet;
    RegionDS: TDataSource;
    FIlterGridDBViewDBColumn6: TcxGridDBColumn;
    FIlterGridDBViewDBColumn7: TcxGridDBColumn;
    FIlterGridDBViewDBColumn8: TcxGridDBColumn;
    FIlterGridDBViewDBColumn9: TcxGridDBColumn;
    Panel1: TPanel;
    lblZipCode: TcxLabel;
    ZipCodeEdit: TcxTextEdit;
    FIlterGridDBViewDBColumn10: TcxGridDBColumn;
    CheckZipCode: TpFIBDataSet;
    lblZipCode2: TcxLabel;
    lblZipCodeEqual: TcxLabel;
    lblProcPayment: TcxLabel;
    ProcPaymentEdit: TcxTextEdit;
    lblProcPayEqual: TcxLabel;
    lblNumPorchEqual: TcxLabel;
    lblNumFloorEqual: TcxLabel;
    lblNumFlatObjEqual: TcxLabel;
    lblNumFlatFloorEqual: TcxLabel;
    MenuSigns: TPopupMenu;
    msMoreEqual: TMenuItem;
    msLessEqual: TMenuItem;
    msEqual: TMenuItem;
    msMore: TMenuItem;
    msLess: TMenuItem;
    msNotEqual: TMenuItem;
    DisObjStyleRepository: TcxStyleRepository;
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
    DisObjectGridStyle: TcxGridTableViewStyleSheet;
    BsConstDset: TpFIBDataSet;
    btnCnt: TdxBarLargeButton;
    TypeStreetBox: TcxLookupComboBox;
    TypeStreetDSet: TpFIBDataSet;
    TypeStreetDS: TDataSource;
    btnPrint: TdxBarLargeButton;
    PrintMenu: TdxBarPopupMenu;
    btnQuittance: TdxBarLargeButton;
    btnExampleFill: TdxBarLargeButton;
    cntInput: TcxTextEdit;
    lblInput: TcxLabel;
    lblInputEqual: TcxLabel;
    ExistClientAccount: TcxCheckBox;
    EngineerBox: TcxLookupComboBox;
    lblInginer: TcxLabel;
    EngineerDSet: TpFIBDataSet;
    InginerDS: TDataSource;
    btnMode: TdxBarLargeButton;
    btnHistory: TdxBarLargeButton;
    procedure ActOkExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActCancelExecute(Sender: TObject);
    procedure lblAdresClick(Sender: TObject);
    procedure lblAdresMouseEnter(Sender: TObject);
    procedure lblAdresMouseLeave(Sender: TObject);
    procedure ActCloseExecute(Sender: TObject);
    procedure ActFilterExecute(Sender: TObject);
    procedure ActClearExecute(Sender: TObject);
    procedure ActUndoExecute(Sender: TObject);
    procedure TimeEnterTimer(Sender: TObject);
    procedure ActInsExecute(Sender: TObject);
    procedure StreetBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActEditExecute(Sender: TObject);
    procedure FilterSetEndScroll(DataSet: TDataSet);
    procedure ActDelExecute(Sender: TObject);
    procedure ActSelectExecute(Sender: TObject);
    procedure StreetBoxEnter(Sender: TObject);
    procedure BsRegionBoxExit(Sender: TObject);
    procedure CityAreaBoxExit(Sender: TObject);
    procedure StreetBoxExit(Sender: TObject);
    procedure lblRegionClick(Sender: TObject);
    procedure lblCItyAreaClick(Sender: TObject);
    procedure BsRegionBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CityAreaBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BsRegionBoxEnter(Sender: TObject);
    procedure BsRegionBoxClick(Sender: TObject);
    procedure CityAreaBoxEnter(Sender: TObject);
    procedure CityAreaBoxClick(Sender: TObject);
    procedure StreetBoxClick(Sender: TObject);
    procedure ActRedoExecute(Sender: TObject);
    procedure HouseEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MenuSignsChange(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure msEqualClick(Sender: TObject);
    procedure msLessEqualClick(Sender: TObject);
    procedure msLessClick(Sender: TObject);
    procedure msMoreClick(Sender: TObject);
    procedure msMoreEqualClick(Sender: TObject);
    procedure msNotEqualClick(Sender: TObject);
    procedure btnCntClick(Sender: TObject);
    procedure TypeStreetBoxEnter(Sender: TObject);
    procedure TypeStreetBoxExit(Sender: TObject);
    procedure TypeStreetBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblInginerMouseEnter(Sender: TObject);
    procedure lblInginerMouseLeave(Sender: TObject);
    procedure EngineerBoxClick(Sender: TObject);
    procedure EngineerBoxEnter(Sender: TObject);
    procedure EngineerBoxExit(Sender: TObject);
    procedure EngineerBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblInginerClick(Sender: TObject);
    procedure BsRegionBoxPropertiesInitPopup(Sender: TObject);
    procedure CityAreaBoxPropertiesInitPopup(Sender: TObject);
    procedure StreetBoxPropertiesInitPopup(Sender: TObject);
    procedure TypeStreetBoxPropertiesInitPopup(Sender: TObject);
    procedure InginerBoxPropertiesInitPopup(Sender: TObject);
    procedure TypeStreetBoxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StreetBoxPropertiesChange(Sender: TObject);
    procedure btnHistoryClick(Sender: TObject);
    procedure BsRegionBoxPropertiesChange(Sender: TObject);
    procedure CityAreaBoxPropertiesChange(Sender: TObject);
    procedure TypeStreetBoxPropertiesChange(Sender: TObject);
    procedure InginerBoxPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    IdDisObject:Variant;
    frmHeight:Integer;
    CurFilterIndex:SmallInt;
    ContextInputType:Integer;
    isBlockInsUpd:boolean;
    IdRegionRoot, IdInginerRoot:Integer;
    HtKey:TbsShortCut;
    BIniLanguage:Byte;
    frmFilter:TBsMemoFilter;
    isAdd:Boolean;
    function RegionDSetCloseOpen:Boolean;
    function CityAreaDSetCloseOpen:Boolean;
    function StreetDSetCloseOpen:Boolean;
    function EngineerDSetCloseOpen:Boolean;
    function TypeStreetDSetCloseOpen:Boolean;
  public
    { Public declarations }
    ResObject : Variant;
    constructor  Create(AParameter:TBsSimpleParams);reintroduce;
    procedure CloseConnect;
    function CheckData:Boolean;
    procedure BtnEnabled(btnSet:frmButtons);
  end;

var
  frmDiscountObj: TfrmDiscountObj;

implementation

{$R *.dfm}

constructor TfrmDiscountObj.Create(AParameter:TBsSimpleParams);
begin
   inherited Create(AParameter.Owner);
   IdDisObject:=Null;
   isAdd:=True;
   DisObjDB.Handle:=AParameter.Db_Handle;
   //ObjectDSetCloseOpen;
   pnlGrid.Visible:=False;
   //FIlterGrid.Visible:=False;
   frmHeight:=Self.Height-pnlGridHeight;
   Self.Height:=frmHeight;
   Self.Top:=frmTop;
   CurFilterIndex:=0;
   isBlockInsUpd:=False;
   if AParameter.FormStyle=fsMDIChild then btnSelect.Visible:=ivNever;
   BsConstDset.Close;
   BsConstDset.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CONSTS';
   BsConstDset.Open;
   IdRegionRoot:=BsConstDset['ID_GR_LIST_REGION_ROOT'];
   IdInginerRoot:=BsConstDset['ID_GR_LIST_CHIEF_ENGINEER_ROOT'];
   HtKey:=LoadShortCut(DisObjDB.Handle, Self);
   ActIns.ShortCut:=HtKey.Add;
   ActEdit.ShortCut:=HtKey.Edit;
   ActDel.ShortCut:=HtKey.Del;
   ActSelect.ShortCut:=HtKey.Choice;
   ActFilter.ShortCut:=HtKey.Search;
   ActClear.ShortCut:=HtKey.Clear;
   ActClose.ShortCut:=HtKey.Close;
   BIniLanguage:=uCommon_Funcs.bsLanguageIndex();
   ActIns.Caption:=uConsts.bs_InsertBtn_Caption[BIniLanguage];
   ActEdit.Caption:=uConsts.bs_EditBtn_Caption[BIniLanguage];
   ActDel.Caption:=uConsts.bs_DeleteBtn_Caption[BIniLanguage];
   ActSelect.Caption:=uConsts.bs_SelectBtn_Caption[BIniLanguage];
   ActClose.Caption:=uConsts.bs_ExitBtn_Caption[BIniLanguage];
   ActCancel.Caption:=uConsts.bs_Cancel[BIniLanguage];
   ActOk.Caption:=uConsts.bs_Accept[BIniLanguage];
   BsSetKeyBoardLanguage('U');
   frmFilter:=TBsMemoFilter.Create('BsRegionBox;CityAreaBox;TypeStreetBox;'+
                                   'StreetBox;HouseEdit;KopusEdit;NumFloorEdit;'+
                                   'NumFlatobjEdit;NumFlatFloorEdit;cntInput;'+
                                   'ZipCodeEdit;InginerBox;NumPorchEdit', Self);
end;

procedure TfrmDiscountObj.ActOkExecute(Sender: TObject);
var in_range:Boolean;
begin
   if bsShowMessage('Увага!', 'Ви дійсно бажаєте зберегти інформацію?', mtInformation, [mbYes, mbNo])=mrNo then Exit;
   if CheckData then
   begin
      if ZipCodeEdit.Text<>'' then
      begin
          CheckZipCode.Close;
          CheckZipCode.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CHCK_ZIP_STRT_EXSTIN_PLACE(:ID_STREET, :ZIP_CODE)';
          CheckZipCode.ParamByName('ID_STREET').AsInteger:=StreetBox.EditValue;
          CheckZipCode.ParamByName('ZIP_CODE').AsInteger:=StrToInt(ZipCodeEdit.Text);
          CheckZipCode.Open;
          if CheckZipCode.IsEmpty then in_range:=False
          else in_range:=Boolean(CheckZipCode['ZIP_IN_RANGE']);
          if not in_range then
             if bsShowMessage('Увага!', 'Поштовий індекс не належить діапозону міста '+CheckZipCode['NAME_PLACE']+' ! Продовжити збереження?', mtInformation, [mbYes, mbNo])=mrNo then Exit;
      end;
      StoredProc.StoredProcName:='BS_DISCOUNT_OBJECT_INS_UPD';
      StoredProc.Transaction.StartTransaction;
      StoredProc.Prepare;
      if isAdd then StoredProc.ParamByName('Id_Discount_Object').value:=null
      else StoredProc.ParamByName('Id_Discount_Object').AsInteger:=IdDisObject;
      {If VarisNull(IdDisObject) then StoredProc.ParamByName('Id_Discount_Object').value:=null
      else StoredProc.ParamByName('Id_Discount_Object').AsInteger:=IdDisObject;}
      StoredProc.ParamByName('ID_STREET').AsInteger:=StreetBox.EditValue;
      if NumPorchEdit.Text<>'' then
         StoredProc.ParamByName('NUM_PORCH').AsInteger:=StrToInt(NumPorchEdit.Text);
      if NumFloorEdit.Text<>'' then
         StoredProc.ParamByName('NUM_FLOOR').AsInteger:=StrToInt(NumFloorEdit.Text);
      if NumFlatObjEdit.Text<>'' then
         StoredProc.ParamByName('NUM_FLAT_OBJECT').AsInteger:=StrToInt(NumFlatObjEdit.Text);
      if NumFlatFloorEdit.Text<>'' then
         StoredProc.ParamByName('NUM_FLAT_FLOOR').AsInteger:=StrToInt(NumFlatFloorEdit.Text);
      StoredProc.ParamByName('ID_STATUS_OBJECT').AsInteger:=1;
      StoredProc.ParamByName('ID_CITY_AREA').AsInteger:=CityAreaBox.EditValue;
      StoredProc.ParamByName('HOUSE').AsString:=HouseEdit.Text;
      StoredProc.ParamByName('KORPUS').AsString:=KorpusEdit.Text;
      StoredProc.ParamByName('ID_REGION').AsInteger:=BsRegionBox.EditValue;
      if ZipCodeEdit.Text='' then StoredProc.ParamByName('ZIP_CODE').Value:=null
      else StoredProc.ParamByName('ZIP_CODE').AsInteger:=StrToInt(ZipCodeEdit.Text);
      StoredProc.ParamByName('ID_INGINER').AsInteger:=EngineerBox.EditValue;
      try
        StoredProc.ExecProc;
        IdDisObject:=StoredProc.FieldByName('RET_VALUE').AsInteger;
        StoredProc.Transaction.Commit;
        btnOk.Visible:=False;
        btnCancel.Visible:=False;
        FIlterGrid.Enabled:=True;
        ActFilterExecute(Self);
        FilterSet.Locate('Id_Discount_Object', IdDisObject, []);
        BtnEnabled([fbAdd, fbModif, fbDelete, fbSelect, fbExit, fbFilter, fbClear, fbRedo, fbUndo, fbPrint]);
        isBlockInsUpd:=False;
        ProcPaymentEdit.Enabled:=True;
        cntInput.Enabled:=True;
        TypeStreetBox.Enabled:=True;
        btnMode.Visible:=ivNever;
        btnFliter.Visible:=ivAlways;
        BsRegionBox.Style.Color:=clWindow;
        CityAreaBox.Style.Color:=clWindow;
        HouseEdit.Style.Color:=clWindow;
        EngineerBox.Style.Color:=clWindow;
        StreetBox.Style.Color:=clWindow;
      except on E:Exception
             do begin
                  bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
                  StoredProc.Transaction.Rollback;
             end;
      end;
   end;
end;

procedure TfrmDiscountObj.BtnEnabled(btnSet:frmButtons);
begin
    btnAdd.Enabled:=fbAdd in btnSet;
    ActIns.Enabled:=btnAdd.Enabled;
    btnEdit.Enabled:=fbModif in btnSet;
    ActEdit.Enabled:=btnEdit.Enabled;
    btnDel.Enabled:=fbDelete in btnSet;
    ActDel.Enabled:=btnDel.Enabled;
    btnSelect.Enabled:=fbSelect in btnSet;
    ActSelect.Enabled:=btnRefresh.Enabled;
    btnClose.Enabled:=fbExit in btnSet;
    ActClose.Enabled:=btnClose.Enabled;
    btnFliter.Enabled:=fbFilter in btnSet;
    ActFilter.Enabled:=btnFliter.Enabled;
    btnClear.Enabled:=fbClear in btnSet;
    ActClear.Enabled:=btnClear.Enabled;
    btnRedo.Enabled:=fbRedo in btnSet;
    ActRedo.Enabled:=btnRedo.Enabled;
    btnUndo.Enabled:=fbUndo in btnSet;
    ActUndo.Enabled:=btnUndo.Enabled;
    btnPrint.Enabled:=fbPrint in btnSet;
end;

function TfrmDiscountObj.CheckData:Boolean;
begin
   Result:=True;
   BsRegionBox.Style.Color:=clWindow;
   CityAreaBox.Style.Color:=clWindow;
   HouseEdit.Style.Color:=clWindow;
   EngineerBox.Style.Color:=clWindow;
   StreetBox.Style.Color:=clWindow;

   if VarIsNull(BsRegionBox.EditValue) then
   begin
      BsRegionBox.Style.Color:=uConsts.BsClFieldIsEmpty;
      Result:=False;
   end;

   if VarIsNull(CityAreaBox.EditValue) then
   begin
      CityAreaBox.Style.Color:=uConsts.BsClFieldIsEmpty;
      Result:=False;
   end;

   if VarIsNull(StreetBox.EditValue) then
   begin
      StreetBox.Style.Color:=uConsts.BsClFieldIsEmpty;
      Result:=False;
   end;

   if HouseEdit.Text='' then
   begin
      HouseEdit.Style.Color:=uConsts.BsClFieldIsEmpty;
      Result:=False;
   end;

   if VarIsNull(EngineerBox.EditValue) then
   begin
      EngineerBox.Style.Color:=uConsts.BsClFieldIsEmpty;
      Result:=False;
   end;

   if not Result then bsShowMessage(Application.Title, 'Ви не заповнили усі необхідні поля!', mtInformation, [mbOK]);
end;

procedure TfrmDiscountObj.CloseConnect;
var i:Integer;
begin
   for i:=0 to DisObjDB.TransactionCount-1 do
   begin
      if DisObjDB.Transactions[i].Active then DisObjDB.Transactions[i].Rollback;
   end;
   DisObjDB.Close;
end;


procedure TfrmDiscountObj.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CloseConnect;
   if FormStyle = fsMDIChild then action:=caFree;
end;

procedure TfrmDiscountObj.ActCancelExecute(Sender: TObject);
begin
   btnOk.Visible:=False;
   btnCancel.Visible:=False;
   pnlAction.Visible:=False;
   FIlterGrid.Enabled:=True;
   BtnEnabled([fbAdd, fbModif, fbDelete, fbSelect, fbExit, fbFilter, fbClear, fbRedo, fbUndo, fbPrint]);
   isBlockInsUpd:=False;
   ProcPaymentEdit.Enabled:=True;
   cntInput.Enabled:=True;
   TypeStreetBox.Enabled:=True;
   btnMode.Visible:=ivNever;
   btnFliter.Visible:=ivAlways;
   BsRegionBox.Style.Color:=clWindow;
   CityAreaBox.Style.Color:=clWindow;
   HouseEdit.Style.Color:=clWindow;
   EngineerBox.Style.Color:=clWindow;
   StreetBox.Style.Color:=clWindow;
end;

function TfrmDiscountObj.RegionDSetCloseOpen:Boolean;
begin
   if RegionDSet.Active then RegionDSet.Close;
   RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR, :ID_ROOT_NODE, :RADIO_BTN)';
   RegionDSet.ParamByName('FILTER_STR').AsString:=BsRegionBox.EditText;
   RegionDSet.ParamByName('ID_ROOT_NODE').AsInteger:=IdRegionRoot;
   RegionDSet.ParamByName('RADIO_BTN').AsShort:=0;
   RegionDSet.Open;
   Result:=not RegionDSet.IsEmpty;
end;

function TfrmDiscountObj.CityAreaDSetCloseOpen:Boolean;
begin
   if CityAreaDSet.Active then CityAreaDSet.Close;
   CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CITY_AREA_FILTER(:FILTER_STR)';
   CityAreaDSet.ParamByName('FILTER_STR').AsString:=CityAreaBox.EditText;
   CityAreaDSet.Open;
   Result:=not CityAreaDSet.IsEmpty;
end;

function TfrmDiscountObj.StreetDSetCloseOpen:Boolean;
begin
   if StreetDSet.Active then StreetDSet.Close;
   StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_STREET_FILTER(:FILTER_STR)';
   StreetDSet.ParamByName('FILTER_STR').AsString:=StreetBox.EditText;
   StreetDSet.Open;
   Result:=not StreetDSet.IsEmpty;
end;

function TfrmDiscountObj.EngineerDSetCloseOpen:Boolean;
begin
   if EngineerDSet.Active then EngineerDSet.Close;
   EngineerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR, :ID_ROOT_NODE, :RADIO_BTN)';
   EngineerDSet.ParamByName('FILTER_STR').AsString:=EngineerBox.EditText;
   EngineerDSet.ParamByName('ID_ROOT_NODE').AsInteger:=IdInginerRoot;
   EngineerDSet.ParamByName('RADIO_BTN').AsShort:=0;
   EngineerDSet.Open;
   Result:=not EngineerDSet.IsEmpty;
end;

function TfrmDiscountObj.TypeStreetDSetCloseOpen:Boolean;
begin
   if TypeStreetDSet.Active then TypeStreetDSet.Close;
   TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_TYPE_STREET_FILTER(:FILTER_STR, :RADIO_BTN)';
   TypeStreetDSet.ParamByName('FILTER_STR').AsString:=TypeStreetBox.EditText;
   TypeStreetDSet.ParamByName('RADIO_BTN').AsShort:=1;
   TypeStreetDSet.Open;
   Result:=not TypeStreetDSet.IsEmpty;
end;

procedure TfrmDiscountObj.lblAdresClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  AdrRes:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= DisObjDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.ID_Locate:=2;
    AdrRes:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsAdress.bpl','ShowBsAdress');
    AParameter.Free;

    if VarArrayDimCount(AdrRes)>0 then
    begin
       if AdrRes[0]<>-1 then
       begin
          if StreetDSet.Active then StreetDSet.Close;
          StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_STREET_BY_ID(:ID_STREET)';
          StreetDSet.ParamByName('ID_STREET').AsInteger:=AdrRes[0];
          StreetDSet.Open;
          StreetBox.EditValue:=AdrRes[0];
          if TypeStreetDSet.Active then TypeStreetDSet.Close;
          TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
          TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=StreetDSet['ID_TYPE_STREET'];
          TypeStreetDSet.Open;
          TypeStreetBox.EditValue:=StreetDSet['ID_TYPE_STREET'];
       end;
       if AdrRes[2]<>-1 then
       begin
          if CityAreaDSet.Active then CityAreaDSet.Close;
          CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
          CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=AdrRes[2];
          CityAreaDSet.Open;
          CityAreaBox.EditValue:=AdrRes[2];
       end;
    end;
  except on E:exception
         do bsShowMessage('Увага!', e.message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmDiscountObj.lblAdresMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmDiscountObj.lblAdresMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmDiscountObj.ActCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmDiscountObj.ActFilterExecute(Sender: TObject);
var strFilter:string;
begin
   strFilter:='';
   if VarIsNull(StreetBox.EditValue) then strFilter:='Null,'
   else strFilter:=IntToStr(StreetBox.EditValue)+',';
   if NumPorchEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+NumPorchEdit.text+',';
   strFilter:=strFilter+''''+lblNumPorchEqual.Caption+''',';
   if NumFloorEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+NumFloorEdit.Text+',';
   strFilter:=strFilter+''''+lblNumFloorEqual.Caption+''',';
   if NumFlatObjEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+NumFlatObjEdit.Text+',';
   strFilter:=strFilter+''''+lblNumFlatObjEqual.Caption+''',';
   if NumFlatFloorEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+NumFlatFloorEdit.Text+',';
   strFilter:=strFilter+''''+lblNumFlatFloorEqual.Caption+''',';
   strFilter:=strFilter+IntToStr(Integer(Boolean(ExistClientAccount.Checked)))+',';
   if VarIsNull(CityAreaBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(CityAreaBox.EditValue)+',';
   if VarIsNull(BsRegionBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(BsRegionBox.EditValue)+',';
   if HouseEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+HouseEdit.Text+''',';
   if KorpusEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+KorpusEdit.Text+''',';
   If ZipCodeEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+ZipCodeEdit.Text+''',';
   strFilter:=strFilter+''''+lblZipCodeEqual.Caption+''',';
   if VarIsNull(TypeStreetBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(TypeStreetBox.EditValue)+',';
   if VarIsNull(EngineerBox.EditValue) then strFilter:=strFilter+'Null'
   else strFilter:=strFilter+IntToStr(EngineerBox.EditValue);
   //Showmessage(strFilter);
   if FilterSet.Active then FilterSet.Close;
   FilterSet.SQLs.SelectSQL.Text:='select distinct * from BS_DISCOUNT_OBJECT_FILTER('+strFilter+')';
   FilterSet.Open;
   if not FilterSet.IsEmpty then
   begin
      StreetBox.Properties.GridMode:=False;
      Self.Height:=frmHeight+pnlGridHeight;
      if not pnlGrid.Visible then pnlGrid.Visible:=True;
   end
   else
   begin
      if pnlGrid.Visible then pnlGrid.Visible:=False;
      Self.Height:=frmHeight;
      bsShowMessage('Увага!', 'За найстроками фільтру не було знайдено записів!', mtInformation, [mbOK]);
   end;
   frmFilter.SetParams;
   btnUndo.Enabled:=True;
   btnRedo.Enabled:=False;
end;

procedure TfrmDiscountObj.ActClearExecute(Sender: TObject);
begin
   if RegionDSet.Active then RegionDSet.Close;
   if CityAreaDSet.Active then CityAreaDSet.Close;
   if StreetDSet.Active then StreetDSet.Close;
   if TypeStreetDSet.Active then TypeStreetDSet.Close;
   if EngineerDSet.Active then EngineerDSet.Close;
   BsRegionBox.EditValue:=(null);
   CityAreaBox.EditValue:=(null);
   StreetBox.EditValue:=(null);
   TypeStreetBox.EditValue:=(null);
   EngineerBox.EditValue:=(null);
   HouseEdit.Text:='';
   KorpusEdit.Text:='';
   NumPorchEdit.Text:='';
   NumFloorEdit.Text:='';
   NumFlatObjEdit.Text:='';
   NumFlatFloorEdit.Text:='';
   ZipCodeEdit.Text:='';
   btnUndo.Enabled:=True;
   btnRedo.Enabled:=False;
end;

procedure TfrmDiscountObj.ActUndoExecute(Sender: TObject);
begin
   if frmFilter.FilterArrayIsNil then Exit;
   ActClearExecute(Sender);
   frmFilter.FilterUndo;
   if not VarIsNull(frmFilter.GetValueByNameComponentEx('BsRegionBox')) then
   begin
      if RegionDSet.Active then RegionDSet.Close;
      RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
      RegionDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=frmFilter.GetValueByNameComponentEx('BsRegionBox');
      RegionDSet.Open;
      BsRegionBox.EditValue:=frmFilter.GetValueByNameComponentEx('BsRegionBox');
   end;
   if not VarIsNull(frmFilter.GetValueByNameComponentEx('CityAreaBox')) then
   begin
      if CityAreaDSet.Active then CityAreaDSet.Close;
      CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
      CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=frmFilter.GetValueByNameComponentEx('CityAreaBox');
      CityAreaDSet.Open;
      CityAreaBox.EditValue:=frmFilter.GetValueByNameComponentEx('CityAreaBox');
   end;
   if not VarIsNull(frmFilter.GetValueByNameComponentEx('StreetBox')) then
   begin
      if StreetDSet.Active then StreetDSet.Close;
      StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_STREET_BY_ID(:ID_STREET)';
      StreetDSet.ParamByName('ID_STREET').AsInteger:=frmFilter.GetValueByNameComponentEx('StreetBox');
      StreetDSet.Open;
      StreetBox.EditValue:=frmFilter.GetValueByNameComponentEx('StreetBox');
   end;
   if not VarIsNull(frmFilter.GetValueByNameComponentEx('TypeStreetBox')) then
   begin
      if TypeStreetDSet.Active then TypeStreetDSet.Close;
      TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
      TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=frmFilter.GetValueByNameComponentEx('TypeStreetBox');
      TypeStreetDSet.Open;
      TypeStreetBox.EditValue:=frmFilter.GetValueByNameComponentEx('TypeStreetBox');
   end;
   if not VarIsNull(frmFilter.GetValueByNameComponentEx('InginerBox')) then
   begin
      if EngineerDSet.Active then EngineerDSet.Close;
      EngineerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
      EngineerDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=frmFilter.GetValueByNameComponentEx('InginerBox');
      EngineerDSet.Open;
      EngineerBox.EditValue:=frmFilter.GetValueByNameComponentEx('InginerBox');
   end;
   frmFilter.FillComponents;
   btnUndo.Enabled:=frmFilter.EnableBtn(True);
   btnRedo.Enabled:=frmFilter.EnableBtn(False);
end;

procedure TfrmDiscountObj.TimeEnterTimer(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
   case ContextInputType of
      0:
      begin
         StreetBox.DroppedDown:=StreetDSetCloseOpen;
         StreetBox.Properties.GridMode:=True;
      end;
      1:
      begin
         CityAreaBox.DroppedDown:=CityAreaDSetCloseOpen;
      end;
      2:
      begin
         BsRegionBox.DroppedDown:=RegionDSetCloseOpen;
      end;
      3:
      begin
         TypeStreetBox.DroppedDown:=TypeStreetDSetCloseOpen;
      end;
      4:
      begin
         EngineerBox.DroppedDown:=EngineerDSetCloseOpen;
      end;
   end;
end;

procedure TfrmDiscountObj.ActInsExecute(Sender: TObject);
begin
   if not isBlockInsUpd then
   begin
     if btnOk.Visible=True then Exit;
     cntInput.Enabled:=False;
     btnOk.Visible:=True;
     btnCancel.Visible:=True;
     pnlAction.Visible:=True;
     FIlterGrid.Enabled:=False;
     ProcPaymentEdit.Enabled:=False;
     TypeStreetBox.Enabled:=False;
     BtnEnabled([fbExit]);
     isAdd:=True;
     btnMode.Hint:=ActIns.Caption;
     btnMode.LargeImageIndex:=0;
     btnMode.Visible:=ivAlways;
     btnFliter.Visible:=ivNever;
   end;
   isBlockInsUpd:=True;
end;

procedure TfrmDiscountObj.StreetBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_RETURN) and (ssCtrl in Shift)) then lblAdresClick(Sender)
   else
   begin
      ContextInputType:=0;
      if StreetBox.EditText='' then
         if StreetDSet.Active then StreetDSet.Close;
      TimeEnter.Enabled:=not ((StreetBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
   end;
end;

procedure TfrmDiscountObj.ActEditExecute(Sender: TObject);
begin
   if FilterSet.IsEmpty then Exit;
   if not isBlockInsUpd then
   begin
     if VarIsNull(IdDisObject) then
     begin
        bsShowMessage('Увага!', 'Ви не обрали запис для зміни!', mtInformation, [mbOK]);
        Exit;
     end;
     if btnOk.Visible=True then Exit;
     cntInput.Enabled:=False;
     TypeStreetBox.Enabled:=False;
     BtnEnabled([fbExit]);
     FIlterGrid.Enabled:=False;
     pnlAction.Visible:=True;
     btnOk.Visible:=True;
     btnCancel.Visible:=True;
     ProcPaymentEdit.Enabled:=False;
     isAdd:=False;
     btnMode.Hint:=ActEdit.Caption;
     btnMode.LargeImageIndex:=1;
     btnMode.Visible:=ivAlways;
     btnFliter.Visible:=ivNever;
   end;
   isBlockInsUpd:=True;
end;

procedure TfrmDiscountObj.FilterSetEndScroll(DataSet: TDataSet);
begin
   if FilterSet.IsEmpty then
   begin
      IdDisObject:=Null;
      Exit;
   end;
   IdDisObject:=FilterSet['Id_Discount_Object'];
   if not VarIsNull(FilterSet['NUM_PORCH']) then NumPorchEdit.Text:=IntToStr(FilterSet['NUM_PORCH']);
   if not VarIsNull(FilterSet['NUM_FLOOR']) then NumFloorEdit.Text:=IntToStr(FilterSet['NUM_FLOOR']);
   if not VarIsNull(FilterSet['NUM_FLAT_OBJECT']) then NumFlatObjEdit.Text:=IntToStr(FilterSet['NUM_FLAT_OBJECT']);
   if not VarIsNull(FilterSet['NUM_FLAT_FLOOR']) then NumFlatFloorEdit.Text:=IntToStr(FilterSet['NUM_FLAT_FLOOR']);
   if not VarIsNull(FilterSet['HOUSE']) then HouseEdit.Text:=FilterSet['HOUSE'];
   KorpusEdit.Enabled:=not (HouseEdit.Text='');
   if ((not VarIsNull(FilterSet['KORPUS'])) and (FilterSet['KORPUS']<>'')) then
      KorpusEdit.Text:=FilterSet['KORPUS'];
   if not VarIsNull(FilterSet['ZIP_CODE']) then ZipCodeEdit.Text:=IntToStr(FilterSet['ZIP_CODE'])
   else ZipCodeEdit.Text:='';
   if RegionDSet.Active then RegionDSet.Close;
   RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
   RegionDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=FilterSet['ID_REGION'];
   RegionDSet.Open;
   BsRegionBox.EditValue:=FilterSet['ID_REGION'];
   if StreetDSet.Active then StreetDSet.Close;
   StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_STREET_BY_ID(:ID_STREET)';
   StreetDSet.ParamByName('ID_STREET').AsInteger:=FilterSet['ID_STREET'];
   StreetDSet.Open;
   StreetBox.EditValue:=FilterSet['ID_STREET'];
   if CityAreaDSet.Active then CityAreaDSet.Close;
   CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
   CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=FilterSet['ID_CITY_AREA'];
   CityAreaDSet.Open;
   CityAreaBox.EditValue:=CityAreaDSet['ID_CITY_AREA_OUT'];
   if TypeStreetDSet.Active then TypeStreetDSet.Close;
   TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
   TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=FilterSet['ID_TYPE_STREET'];
   TypeStreetDSet.Open;
   TypeStreetBox.EditValue:=FilterSet['ID_TYPE_STREET'];
   if EngineerDSet.Active then EngineerDSet.Close;
   EngineerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
   EngineerDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=FilterSet['ID_INGINER'];
   EngineerDSet.Open;
   EngineerBox.EditValue:=FilterSet['ID_INGINER'];
end;

procedure TfrmDiscountObj.ActDelExecute(Sender: TObject);
begin
   try
      if FilterSet.IsEmpty then Exit;
      if bsShowMessage('Увага!', 'Ви дійсно бажаєте видалити цей запис?', mtConfirmation, [mbYes, mbNo])=mrNo then Exit;
      StoredProc.StoredProcName:='BS_DISCOUNT_OBJECT_DEL';
      StoredProc.Transaction.StartTransaction;
      StoredProc.Prepare;
      StoredProc.ParamByName('Id_Discount_Object').AsInteger:=FilterSet['Id_Discount_Object'];
      StoredProc.ExecProc;
      StoredProc.Transaction.Commit;
   except on E:Exception
          do begin
               bsShowMessage('Увага', E.Message, mtInformation, [mbOK]);
               StoredProc.Transaction.Rollback;
          end;
   end;
   ActClearExecute(Sender);
   ActFilterExecute(Sender);
end;

procedure TfrmDiscountObj.ActSelectExecute(Sender: TObject);
begin
   if not VarIsNull(IdDisObject) then
   begin
      ResObject:=VarArrayCreate([0, 11], varVariant);
      ResObject[0]:=IdDisObject;
      ResObject[1]:='1';
      ResObject[2]:=BsRegionBox.EditValue;
      ResObject[3]:=BsRegionBox.EditText;
      ResObject[4]:=CityAreaBox.EditValue;
      ResObject[5]:=CityAreaBox.EditText;
      ResObject[6]:=StreetBox.EditValue;
      ResObject[7]:=StreetBox.EditText;
      ResObject[8]:=HouseEdit.Text;
      ResObject[9]:=KorpusEdit.Text;
      ResObject[10]:=TypeStreetBox.EditValue;
      ResObject[11]:=TypeStreetBox.EditText;
      ModalResult:=mrOk;
   end;
end;

procedure TfrmDiscountObj.StreetBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.BsRegionBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.CityAreaBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.StreetBoxExit(Sender: TObject);
begin
   StreetBox.Properties.GridMode:=False;
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.lblRegionClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= DisObjDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.ID_Locate:=IdRegionRoot;
    Res:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsGroupObjects.bpl','ShowObjectsGroup');
    AParameter.Free;

    if VarArrayDimCount(Res)>0 then
    begin
       if RegionDSet.Active then RegionDSet.Close;
       RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
       RegionDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=Res[0];
       RegionDSet.Open;
       BsRegionBox.EditValue:=RegionDSet['ID_GR_LIST_OBJ_OUT'];
    end;
  except on E:exception
         do showmessage(e.message);
  end;
end;

procedure TfrmDiscountObj.lblCItyAreaClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  AdrRes:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= DisObjDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.ID_Locate:=1;
    AdrRes:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsAdress.bpl','ShowBsAdress');
    AParameter.Free;
    if VarArrayDimCount(AdrRes)>0 then
    begin
       if AdrRes[0]<>-1 then
       begin
          if StreetDSet.Active then StreetDSet.Close;
          StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_STREET_BY_ID(:ID_STREET)';
          StreetDSet.ParamByName('ID_STREET').AsInteger:=AdrRes[0];
          StreetDSet.Open;
          StreetBox.EditValue:=AdrRes[0];
          if TypeStreetDSet.Active then TypeStreetDSet.Close;
          TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
          TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=StreetDSet['ID_TYPE_STREET'];
          TypeStreetDSet.Open;
          TypeStreetBox.EditValue:=StreetDSet['ID_TYPE_STREET'];
       end;
       if AdrRes[2]<>-1 then
       begin
          if CityAreaDSet.Active then CityAreaDSet.Close;
          CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
          CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=AdrRes[2];
          CityAreaDSet.Open;
          CityAreaBox.EditValue:=AdrRes[2];
       end;
    end;
  except on E:exception
         do bsShowMessage('Увага!', e.message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmDiscountObj.BsRegionBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblRegionClick(Self)
   else
   begin
      ContextInputType:=2;
      if BsRegionBox.EditText='' then
         if RegionDSet.Active then RegionDSet.Close;
      TimeEnter.Enabled:=not ((BsRegionBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
   end;
end;

procedure TfrmDiscountObj.CityAreaBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblCItyAreaClick(Self)
   else
   begin
      ContextInputType:=1;
      if CityAreaBox.EditText='' then
         if CityAreaDSet.Active then CityAreaDSet.Close;
      TimeEnter.Enabled:=not ((CityAreaBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
   end;
end;

procedure TfrmDiscountObj.BsRegionBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.BsRegionBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.CityAreaBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.CityAreaBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.StreetBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.ActRedoExecute(Sender: TObject);
begin
   if frmFilter.FilterArrayIsNil then Exit;
   frmFilter.FilterRedo;
   ActClearExecute(Sender);
   if not VarIsNull(frmFilter.GetValueByNameComponentEx('BsRegionBox')) then
   begin
      if RegionDSet.Active then RegionDSet.Close;
      RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
      RegionDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=frmFilter.GetValueByNameComponentEx('BsRegionBox');
      RegionDSet.Open;
      BsRegionBox.EditValue:=frmFilter.GetValueByNameComponentEx('BsRegionBox');
   end;
   if not VarIsNull(frmFilter.GetValueByNameComponentEx('CityAreaBox')) then
   begin
      if CityAreaDSet.Active then CityAreaDSet.Close;
      CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
      CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=frmFilter.GetValueByNameComponentEx('CityAreaBox');
      CityAreaDSet.Open;
      CityAreaBox.EditValue:=frmFilter.GetValueByNameComponentEx('CityAreaBox');
   end;
   if not VarIsNull(frmFilter.GetValueByNameComponentEx('StreetBox')) then
   begin
      if StreetDSet.Active then StreetDSet.Close;
      StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_STREET_BY_ID(:ID_STREET)';
      StreetDSet.ParamByName('ID_STREET').AsInteger:=frmFilter.GetValueByNameComponentEx('StreetBox');
      StreetDSet.Open;
      StreetBox.EditValue:=frmFilter.GetValueByNameComponentEx('StreetBox');
   end;
   if not VarIsNull(frmFilter.GetValueByNameComponentEx('TypeStreetBox')) then
   begin
      if TypeStreetDSet.Active then TypeStreetDSet.Close;
      TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
      TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=frmFilter.GetValueByNameComponentEx('TypeStreetBox');
      TypeStreetDSet.Open;
      TypeStreetBox.EditValue:=frmFilter.GetValueByNameComponentEx('TypeStreetBox');
   end;
   if not VarIsNull(frmFilter.GetValueByNameComponentEx('InginerBox')) then
   begin
      if EngineerDSet.Active then EngineerDSet.Close;
      EngineerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
      EngineerDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=frmFilter.GetValueByNameComponentEx('InginerBox');
      EngineerDSet.Open;
      EngineerBox.EditValue:=frmFilter.GetValueByNameComponentEx('InginerBox');
   end;
   frmFilter.FillComponents;
   btnRedo.Enabled:=frmFilter.EnableBtn(False);
   btnUndo.Enabled:=frmFilter.EnableBtn(True);
end;

procedure TfrmDiscountObj.HouseEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if HouseEdit.Text='' then
   begin
      KorpusEdit.Enabled:=False;
      KorpusEdit.Text:='';
   end
   else KorpusEdit.Enabled:=True;
end;

procedure TfrmDiscountObj.MenuSignsChange(Sender: TObject;
  Source: TMenuItem; Rebuild: Boolean);
begin
   //if lblNumFloorEqual.PopupMenu.
end;

procedure TfrmDiscountObj.msEqualClick(Sender: TObject);
begin
   (FindComponent(MenuSigns.PopupComponent.Name) as TcxLabel).Caption:=msEqual.Caption;
end;

procedure TfrmDiscountObj.msLessEqualClick(Sender: TObject);
begin
   (FindComponent(MenuSigns.PopupComponent.Name) as TcxLabel).Caption:=msLessEqual.Caption;
end;

procedure TfrmDiscountObj.msLessClick(Sender: TObject);
begin
   (FindComponent(MenuSigns.PopupComponent.Name) as TcxLabel).Caption:=msLess.Caption;
end;

procedure TfrmDiscountObj.msMoreClick(Sender: TObject);
begin
   (FindComponent(MenuSigns.PopupComponent.Name) as TcxLabel).Caption:=msMore.Caption;
end;

procedure TfrmDiscountObj.msMoreEqualClick(Sender: TObject);
begin
   (FindComponent(MenuSigns.PopupComponent.Name) as TcxLabel).Caption:=msMoreEqual.Caption;
end;

procedure TfrmDiscountObj.msNotEqualClick(Sender: TObject);
begin
   (FindComponent(MenuSigns.PopupComponent.Name) as TcxLabel).Caption:=msNotEqual.Caption;
end;

procedure TfrmDiscountObj.btnCntClick(Sender: TObject);
begin
   if FilterSet.IsEmpty then Exit;
   FilterSet.FetchAll;
   bsShowMessage('Підрахунок!', 'Загальна кількість записів дорівнює '+IntToStr(FilterSet.RecordCount), mtInformation, [mbOK]);
end;

procedure TfrmDiscountObj.TypeStreetBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.TypeStreetBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.TypeStreetBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    ContextInputType:=3;
    if TypeStreetBox.EditText='' then
       if TypeStreetDSet.Active then TypeStreetDSet.Close;
    TimeEnter.Enabled:=not (TypeStreetBox.EditText='');
end;

procedure TfrmDiscountObj.lblInginerMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmDiscountObj.lblInginerMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmDiscountObj.EngineerBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.EngineerBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.EngineerBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.EngineerBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblInginerClick(Self)
   else
   begin
      ContextInputType:=4;
      if EngineerBox.EditText='' then
         if EngineerDSet.Active then EngineerDSet.Close;
      TimeEnter.Enabled:=not ((EngineerBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
   end;
end;

procedure TfrmDiscountObj.lblInginerClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= DisObjDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.ID_Locate:=IdInginerRoot;
    Res:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsGroupObjects.bpl','ShowObjectsGroup');
    AParameter.Free;

    if VarArrayDimCount(Res)>0 then
    begin
       if EngineerDSet.Active then EngineerDSet.Close;
       EngineerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
       EngineerDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=Res[0];
       EngineerDSet.Open;
       EngineerBox.EditValue:=Res[0];
    end;
  except on E:exception
         do showmessage(e.message);
  end;
end;

procedure TfrmDiscountObj.BsRegionBoxPropertiesInitPopup(Sender: TObject);
begin
   RegionDSetCloseOpen;
end;

procedure TfrmDiscountObj.CityAreaBoxPropertiesInitPopup(Sender: TObject);
begin
   CityAreaDSetCloseOpen
end;

procedure TfrmDiscountObj.StreetBoxPropertiesInitPopup(Sender: TObject);
begin
   StreetDSetCloseOpen;
   StreetBox.Properties.GridMode:=True;
end;

procedure TfrmDiscountObj.TypeStreetBoxPropertiesInitPopup(
  Sender: TObject);
begin
   TypeStreetDSetCloseOpen
end;

procedure TfrmDiscountObj.InginerBoxPropertiesInitPopup(Sender: TObject);
begin
   EngineerDSetCloseOpen;
end;

procedure TfrmDiscountObj.TypeStreetBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmDiscountObj.FormShow(Sender: TObject);
begin
   Self.Top:=Round(Application.MainForm.Height/5);
end;

procedure TfrmDiscountObj.StreetBoxPropertiesChange(Sender: TObject);
begin
   if StreetBox.EditText<>'' then
   begin
      if TypeStreetDSet.Active then TypeStreetDSet.Close;
      TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
      TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=StreetDSet['ID_TYPE_STREET'];
      TypeStreetDSet.Open;
      TypeStreetBox.EditValue:=StreetDSet['ID_TYPE_STREET'];
   end
   else
   begin
      if TypeStreetDSet.Active then TypeStreetDSet.Close;
      TypeStreetBox.EditValue:=(null);
   end;
end;

procedure TfrmDiscountObj.btnHistoryClick(Sender: TObject);
var frm:TfrmSprav;
    sParam:TSpravParams;
begin
    if FilterSet.IsEmpty then Exit;
    sParam.FormCaption := 'Історія змін';
    sParam.SelectText := 'SELECT DISTINCT * FROM BS_DISCOUNT_OBJECT_HST_SEL('+IntToStr(IdDisObject)+')';
    sParam.NameFields := 'User_Fio_Hst,Date_Time_Hst,Action_Hst,Num_Porch,Num_Floor,'+
                          'Num_Flat_Object,Num_Flat_Floor,House,Korpus,Zip_Code,'+
                          'Name_Street,Name_City_Area,Name_Region,Name_Ingineer,Id_Hst';
    sParam.FieldsCaption := 'Користувач#Дата та час зміни#Дія#Кіл-сть під''їздів#'+
                            'Кіл-сть поверхів#Кіл-сть квартир#Кіл-сть квартир на поверху#'+
                            'Будинок#Корпус#Поштовий індекс#Вулиця#Район#Регіон#Інжинер';
    sParam.KeyField := 'Id_Hst';
    sParam.ReturnFields := 'ID_REPORT_FILTER,NAME_REPORT_FILTER';
    sParam.FilterFields:= 'User_Fio_Hst,Date_Time_Hst,Action_Hst,Num_Porch,'+
                          'Num_Floor,Num_Flat_Object,Num_Flat_Floor,'+
                          'House,Korpus,Zip_Code,Name_Street,Name_City_Area,'+
                          'Name_Region,Name_Ingineer';
    sParam.FilterCaptions:='Користувач,Дата та час зміни,Дія,Кіл-сть під''їздів,'+
                           'Кіл-сть поверхів,Кіл-сть квартир,Кіл-сть квартир на поверху,'+
                           'Будинок,Корпус,Поштовий індекс,Вулиця,Район,Регіон,Інжинер';
    sParam.DbHandle:=DisObjDB.Handle;
    sParam.frmButtons:=[BsUnivSprav.fbExit];
    sParam.IsMultiSelect:=False;
    frm:=TfrmSprav.Create(Self, sParam);
    frm.ShowModal;
    frm.Free;
end;

procedure TfrmDiscountObj.BsRegionBoxPropertiesChange(Sender: TObject);
begin
   if BsRegionBox.EditText='' then BsRegionBox.EditValue:=(null);
end;

procedure TfrmDiscountObj.CityAreaBoxPropertiesChange(Sender: TObject);
begin
   if CityAreaBox.EditText='' then CityAreaBox.EditValue:=(null);
end;

procedure TfrmDiscountObj.TypeStreetBoxPropertiesChange(Sender: TObject);
begin
  if TypeStreetBox.EditText='' then TypeStreetBox.EditValue:=(null);
end;

procedure TfrmDiscountObj.InginerBoxPropertiesChange(Sender: TObject);
begin
   if EngineerBox.EditText='' then EngineerBox.EditValue:=(null);
end;

initialization
       RegisterClass(TfrmDiscountObj);

end.
