unit BsClient;

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
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalendar,
  uCommon_Funcs, Menus, UConsts, ShellAPI, cxCheckBox, BsMemoFilter;

const
   pnlGridHeight=160;
   frmTop=180;


type
  frmButton = (fbAdd, fbModif, fbDelete, fbSelect, fbExit, fbFilter, fbClear, fbRedo, fbUndo);
  frmButtons = set of frmButton;

  TfrmClientAccount = class(TForm)
    ClientDB: TpFIBDatabase;
    ClientTransRead: TpFIBTransaction;
    ClientTransWrite: TpFIBTransaction;
    ActionList1: TActionList;
    ClientAcStyleRepository: TcxStyleRepository;
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
    ImageList: TImageList;
    StoredProc: TpFIBStoredProc;
    lblStatusClient: TcxLabel;
    pnlGrid: TPanel;
    pnlMain: TPanel;
    BarManager: TdxBarManager;
    btn: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    btnSprav: TdxBarLargeButton;
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
    DomBox: TcxLookupComboBox;
    DomDS: TDataSource;
    DomDSet: TpFIBDataSet;
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
    pnlClient: TPanel;
    FIlterGridDBViewDBColumn10: TcxGridDBColumn;
    FamDSet: TpFIBDataSet;
    lblStreet: TcxLabel;
    lblFIO: TcxLabel;
    lblFlat: TcxLabel;
    FlatEdit: TcxTextEdit;
    FamiliyaBox: TcxLookupComboBox;
    ImyaBox: TcxLookupComboBox;
    PatronomycBox: TcxLookupComboBox;
    lblMchineKod: TcxLabel;
    lblInput: TcxLabel;
    lblClientAccount: TcxLabel;
    MachineKodEdit: TcxTextEdit;
    InputEdit: TcxTextEdit;
    ClientAccountEdit: TcxTextEdit;
    lblTenants: TcxLabel;
    TenantsEdit: TcxTextEdit;
    lblTenantsE: TcxLabel;
    lblLastPayment: TcxLabel;
    lblPayE: TcxLabel;
    WaterEdit: TcxTextEdit;
    ProcGroupBox: TGroupBox;
    btnProcKod: TcxButton;
    lblProcKodEqual: TcxLabel;
    ProcKodEdit: TcxTextEdit;
    lblPeople: TcxLabel;
    CntPeopleEdit: TcxTextEdit;
    lblStatusFlat: TcxLabel;
    lblOrganization: TcxLabel;
    lblImprovement: TcxLabel;
    lblPhone: TcxLabel;
    CustomServiceBox: TcxLookupComboBox;
    lblFlatE: TcxLabel;
    lblOrganiztionEqual: TcxLabel;
    NormIntakeBox: TcxLookupComboBox;
    PhoneEdit: TcxTextEdit;
    lblNormIntakeE: TcxLabel;
    lblAvto: TcxLabel;
    lblGreenHouse: TcxLabel;
    lblWatering: TcxLabel;
    GreenHouseEdit: TcxTextEdit;
    WateringEdit: TcxTextEdit;
    AvtoEdit: TcxTextEdit;
    LastPaymentDate: TcxDateEdit;
    btnWater: TcxButton;
    FamSource: TDataSource;
    ImyaSource: TDataSource;
    PatrSource: TDataSource;
    ImyaDSet: TpFIBDataSet;
    PatrDSet: TpFIBDataSet;
    MenusSign: TPopupMenu;
    msEqual: TMenuItem;
    msLessEqual: TMenuItem;
    msLess: TMenuItem;
    msMore: TMenuItem;
    msEqualMore: TMenuItem;
    msNotEqual: TMenuItem;
    lblWaterEqual: TcxLabel;
    lblStatusCLientEqual: TcxLabel;
    lblAvtoEqual: TcxLabel;
    lblGreenHouseEqual: TcxLabel;
    lblWateringEqual: TcxLabel;
    lblPeopleEqual: TcxLabel;
    InginerDSet: TpFIBDataSet;
    CustomServiceDSet: TpFIBDataSet;
    InginerDS: TDataSource;
    CustomServiceDS: TDataSource;
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
    ClientAccountGridStyle: TcxGridTableViewStyleSheet;
    BsConstDSet: TpFIBDataSet;
    btnPredesign: TdxBarLargeButton;
    StatusClientBox: TcxLookupComboBox;
    StatusFlatBox: TcxLookupComboBox;
    FlatStatusDSet: TpFIBDataSet;
    ClientStatusDSet: TpFIBDataSet;
    ClientStatusDS: TDataSource;
    FlatStatusDS: TDataSource;
    btnSum: TdxBarLargeButton;
    btnCnt: TdxBarLargeButton;
    btnCalculator: TdxBarLargeButton;
    MenuEditClient: TdxBarPopupMenu;
    btnLgot: TdxBarLargeButton;
    lblInginer: TcxLabel;
    lblInginerEqual: TcxLabel;
    InginerBox: TcxLookupComboBox;
    btnEditClient: TdxBarLargeButton;
    btnTempEditClient: TdxBarLargeButton;
    btnTempEditService: TdxBarLargeButton;
    FIlterGridDBViewDBColumn11: TcxGridDBColumn;
    FIlterGridDBViewDBColumn12: TcxGridDBColumn;
    TypeStreetBox: TcxLookupComboBox;
    TypeStreetDSet: TpFIBDataSet;
    TypeStreetDS: TDataSource;
    FIlterGridDBViewDBColumn13: TcxGridDBColumn;
    FIlterGridDBViewDBColumn14: TcxGridDBColumn;
    FIlterGridDBViewDBColumn15: TcxGridDBColumn;
    NormIntakeDS: TDataSource;
    NormIntakeDSet: TpFIBDataSet;
    FIlterGridDBViewDBColumn16: TcxGridDBColumn;
    btnEditService: TdxBarLargeButton;
    btnVodomer: TdxBarLargeButton;
    MenuSprav: TdxBarPopupMenu;
    btnNachislSprav: TdxBarLargeButton;
    btnSelect: TdxBarLargeButton;
    btnClientComment: TdxBarLargeButton;
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
    procedure DomBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActEditExecute(Sender: TObject);
    procedure FilterSetEndScroll(DataSet: TDataSet);
    procedure ActDelExecute(Sender: TObject);
    procedure DomBoxEnter(Sender: TObject);
    procedure BsRegionBoxExit(Sender: TObject);
    procedure CityAreaBoxExit(Sender: TObject);
    procedure DomBoxExit(Sender: TObject);
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
    procedure DomBoxClick(Sender: TObject);
    procedure ActRedoExecute(Sender: TObject);
    procedure lblStreetClick(Sender: TObject);
    procedure lblStreetMouseEnter(Sender: TObject);
    procedure lblStreetMouseLeave(Sender: TObject);
    procedure btnProcKodClick(Sender: TObject);
    procedure msEqualClick(Sender: TObject);
    procedure msLessEqualClick(Sender: TObject);
    procedure msLessClick(Sender: TObject);
    procedure msMoreClick(Sender: TObject);
    procedure msEqualMoreClick(Sender: TObject);
    procedure msNotEqualClick(Sender: TObject);
    procedure FamiliyaBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FamiliyaBoxEnter(Sender: TObject);
    procedure FamiliyaBoxExit(Sender: TObject);
    procedure ImyaBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PatronomycBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PatronomycBoxExit(Sender: TObject);
    procedure PatronomycBoxEnter(Sender: TObject);
    procedure CustomServiceBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CustomServiceBoxExit(Sender: TObject);
    procedure CustomServiceBoxEnter(Sender: TObject);
    procedure lblInputClick(Sender: TObject);
    procedure lblInputMouseEnter(Sender: TObject);
    procedure lblInputMouseLeave(Sender: TObject);
    procedure InputEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblOrganizationClick(Sender: TObject);
    procedure lblOrganizationMouseEnter(Sender: TObject);
    procedure lblOrganizationMouseLeave(Sender: TObject);
    procedure btnPredesignClick(Sender: TObject);
    procedure btnWaterClick(Sender: TObject);
    procedure btnSumClick(Sender: TObject);
    procedure btnCntClick(Sender: TObject);
    procedure btnCalculatorClick(Sender: TObject);
    procedure btnLgotClick(Sender: TObject);
    procedure DomBoxPropertiesInitPopup(Sender: TObject);
    procedure CityAreaBoxPropertiesInitPopup(Sender: TObject);
    procedure BsRegionBoxPropertiesInitPopup(Sender: TObject);
    procedure FamiliyaBoxPropertiesInitPopup(Sender: TObject);
    procedure ImyaBoxPropertiesInitPopup(Sender: TObject);
    procedure PatronomycBoxPropertiesInitPopup(Sender: TObject);
    procedure CustomServiceBoxPropertiesInitPopup(Sender: TObject);
    procedure InginerBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InginerBoxExit(Sender: TObject);
    procedure InginerBoxEnter(Sender: TObject);
    procedure InginerBoxClick(Sender: TObject);
    procedure CustomServiceBoxClick(Sender: TObject);
    procedure FamiliyaBoxClick(Sender: TObject);
    procedure ImyaBoxClick(Sender: TObject);
    procedure PatronomycBoxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NormIntakeBoxPropertiesInitPopup(Sender: TObject);
    procedure btnEditClientClick(Sender: TObject);
    procedure btnTempEditClientClick(Sender: TObject);
    procedure btnTempEditServiceClick(Sender: TObject);
    procedure btnEditServiceClick(Sender: TObject);
    procedure ImyaBoxEnter(Sender: TObject);
    procedure ImyaBoxExit(Sender: TObject);
    procedure NormIntakeBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NormIntakeBoxClick(Sender: TObject);
    procedure NormIntakeBoxEnter(Sender: TObject);
    procedure NormIntakeBoxExit(Sender: TObject);
    procedure TypeStreetBoxPropertiesInitPopup(Sender: TObject);
    procedure TypeStreetBoxClick(Sender: TObject);
    procedure TypeStreetBoxEnter(Sender: TObject);
    procedure TypeStreetBoxExit(Sender: TObject);
    procedure TypeStreetBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FIlterGridDBViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNachislSpravClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnClientCommentClick(Sender: TObject);
    procedure BsRegionBoxPropertiesChange(Sender: TObject);
    procedure CityAreaBoxPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    IdClientAccount, KodMachine:Variant;
    frmHeight:Integer;
    CurFilterIndex, TypeObject:SmallInt;
    ContextInputType:Integer;
    isBlockInsUpd:boolean;
    HtKey:TbsShortCut;
    IdCustServiceRoot, IdRegionRoot, IdInginerRoot:Integer;
    BIniLanguage:Byte;
    IsAdmin:Boolean;
    ClientFilter:TBsMemoFilter;
    procedure EditClientAccount(ModeEdit:SmallInt);
    procedure UpdateAllDataSet;
  public
    { Public declarations }
    ResAcClient : Variant;
    constructor  Create(AParameter:TBsSimpleParams);reintroduce;
    procedure CloseConnect;
    function CheckData:Boolean;
    procedure BtnEnabled(btnSet:frmButtons);
    procedure SetEditMode(isOn:Boolean);
  end;

var
  frmClientAccount: TfrmClientAccount;

implementation

{$R *.dfm}

uses BsClientSum, BsClientEdit, BsLgotClient;

constructor TfrmClientAccount.Create(AParameter:TBsSimpleParams);
begin
   inherited Create(AParameter.Owner);
   if AParameter.Formstyle=fsMDIChild then btnSelect.Visible:=ivNever;
   IsAdmin:=AParameter.is_admin;
   HtKey:=LoadShortCut(AParameter.Db_Handle, AParameter.Owner);
   ActIns.ShortCut:=HtKey.Add;
   ActEdit.ShortCut:=HtKey.Edit;
   ActDel.ShortCut:=HtKey.Del;
   ActSelect.ShortCut:=HtKey.Choice;
   ActFilter.ShortCut:=HtKey.Search;
   ActClear.ShortCut:=HtKey.Clear;
   IdClientAccount:=-1;
   ClientDB.Handle:=AParameter.Db_Handle;
   pnlGrid.Visible:=False;
   frmHeight:=Self.Height-pnlGridHeight;
   Self.Height:=frmHeight;
   Self.Top:=frmTop;
   CurFilterIndex:=0;
   isBlockInsUpd:=False;
   if BsConstDSet.Active then BsConstDSet.Close;
   BsConstDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_TYPE_OBJECT_BY_KEY(:KEY_FIELD)';
   BsConstDSet.ParamByName('KEY_FIELD').AsString:='KOD_MACHINE';
   BsConstDSet.Open;
   TypeObject:=BsConstDSet['ID_TYPE_OBJECT'];

   if BsConstDSet.Active then BsConstDSet.Close;
   BsConstDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CONSTS';
   BsConstDSet.Open;
   IdCustServiceRoot:=BsConstDSet['ID_GR_LIST_CUST_SERV_ROOT'];
   IdRegionRoot:=BsConstDSet['ID_GR_LIST_REGION_ROOT'];
   IdInginerRoot:=BsConstDSet['ID_GR_LIST_CHIEF_ENGINEER_ROOT'];
   ClientStatusDSet.Close;
   ClientStatusDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CLIENT_ACCOUNT_STATUS_SEL';
   ClientStatusDSet.Open;
   StatusClientBox.EditValue:=1;
   FlatStatusDSet.Close;
   FlatStatusDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FLAT_STATUS_SEL';
   FlatStatusDSet.Open;
   BIniLanguage:=uCommon_Funcs.bsLanguageIndex();
   BsSetKeyBoardLanguage('U');
   //ActIns.Caption:=uConsts.bs_InsertBtn_Caption[BIniLanguage];
   ActEdit.Caption:=uConsts.bs_EditBtn_Caption[BIniLanguage];
   ActDel.Caption:=uConsts.bs_DeleteBtn_Caption[BIniLanguage];
   ActSelect.Caption:=uConsts.bs_SelectBtn_Caption[BIniLanguage];
   ActClose.Caption:=uConsts.bs_ExitBtn_Caption[BIniLanguage];
   ActCancel.Caption:=uConsts.bs_Cancel[BIniLanguage];
   ActOk.Caption:=uConsts.bs_Accept[BIniLanguage];
   ClientFilter:=TBsMemoFilter.Create('BsRegionBox;CityAreaBox;FamiliyaBox;ImyaBox;PatronomycBox;'+
                                      'MachineKodEdit;InputEdit;ClientAccountEdit;TypeStreetBox;'+
                                      'DomBox;HouseEdit;KorpusEdit;FlatEdit;TenantsEdit;'+
                                      'StatusClientBox;InginerBox;StatusFlatBox;CustomServiceBox;'+
                                      'NormIntakeBox;PhoneEdit;StatusClientBox;LastPaymentDate', Self);
end;

procedure TfrmClientAccount.SetEditMode(isOn:Boolean);
begin
  BsRegionBox.Enabled:=isOn;
  lblRegion.Enabled:=isOn;
  CityAreaBox.Enabled:=isOn;
  lblCItyArea.Enabled:=isOn;
  lblPayE.Enabled:=isOn;
  LastPaymentDate.Enabled:=isOn;
  lblWaterEqual.Enabled:=isOn;
  btnWater.Enabled:=isOn;
  WaterEdit.Enabled:=isOn;
  HouseEdit.Enabled:=isOn;
  KorpusEdit.Enabled:=isOn;
  btnProcKod.Enabled:=isOn;
  lblProcKodEqual.Enabled:=isOn;
  ProcKodEdit.Enabled:=isOn;
  lblPeopleEqual.Enabled:=isOn;
  CntPeopleEdit.Enabled:=isOn;
end;

procedure TfrmClientAccount.BtnEnabled(btnSet:frmButtons);
begin
    btnAdd.Enabled:=fbAdd in btnSet;
    ActIns.Enabled:=btnAdd.Enabled;
    btnEdit.Enabled:=fbModif in btnSet;
    ActEdit.Enabled:=btnEdit.Enabled;
    btnDel.Enabled:=fbDelete in btnSet;
    ActDel.Enabled:=btnDel.Enabled;
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
end;

function TfrmClientAccount.CheckData:Boolean;
begin
   Result:=True;

   if VarIsNull(DomBox.EditValue) then
   begin
      DomBox.Style.Color:=clRed;
      bsShowMessage('Увага!', 'Ви не обрали адрес!', mtInformation, [mbOK]);
      Result:=False;
   end;
end;

procedure TfrmClientAccount.CloseConnect;
var i:Integer;
begin
   for i:=0 to ClientDB.TransactionCount-1 do
   begin
      if ClientDB.Transactions[i].Active then ClientDB.Transactions[i].Rollback;
   end;
   ClientDB.Close;
end;



procedure TfrmClientAccount.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CloseConnect;
   if FormStyle = fsMDIChild then action:=caFree;
end;

procedure TfrmClientAccount.ActCancelExecute(Sender: TObject);
begin
   btnOk.Visible:=False;
   btnCancel.Visible:=False;
   pnlAction.Visible:=False;
   FIlterGrid.Enabled:=True;
   BtnEnabled([fbAdd, fbModif, fbDelete, fbSelect, fbExit, fbFilter, fbClear, fbRedo, fbUndo]);
   isBlockInsUpd:=False;
end;

procedure TfrmClientAccount.lblAdresClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  AdrRes:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= ClientDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.ID_Locate:=2;
    AdrRes:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsAdress.bpl','ShowBsAdress');
    AParameter.Free;

    if VarArrayDimCount(AdrRes)>0 then
    begin
       if AdrRes[1]<>-1 then
       begin
          if CityAreaDSet.Active then CityAreaDSet.Close;
          CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
          CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=AdrRes[1];
          CityAreaDSet.Open;
          CityAreaBox.EditValue:=CityAreaDSet['ID_CITY_AREA_OUT']
       end;
    end;
  except on E:exception
         do bsShowMessage('Увага!', e.message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmClientAccount.lblAdresMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmClientAccount.lblAdresMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmClientAccount.ActCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmClientAccount.ActFilterExecute(Sender: TObject);
var strFilter:string;
    FDate:TDate;
begin
   strFilter:='';
   {Регион}
   if VarIsNull(BsRegionBox.EditValue) then strFilter:='Null,'
   else strFilter:=strFilter+IntToStr(BsRegionBox.EditValue)+',';
   {Район}
   if VarIsNull(CityAreaBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(CityAreaBox.EditValue)+',';
   {Дома}
   if VarIsNull(DomBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(DomBox.EditValue)+',';
   {Фамилия}
   if FamiliyaBox.EditText='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+FamiliyaBox.EditText+''',';
   {Имя}
   if ImyaBox.EditText='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+ImyaBox.EditText+''',';
   {Отчество}
   if PatronomycBox.EditText='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+PatronomycBox.EditText+''',';
   {Код машины}
   if MachineKodEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+MachineKodEdit.Text+',';
   {Код лицевого счета}
   if ClientAccountEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+ClientAccountEdit.Text+',';
   {Дата последней оплаты}
   if LastPaymentDate.Text='' then strFilter:=strFilter+'Null,'
   else
   begin
      try
         FDate:=LastPaymentDate.Date;
      except
          bsShowMessage('Увага!', 'Не вірний формат дати!', mtInformation, [mbOK]);
          Exit;
      end;
      strFilter:=strFilter+''''+DateToStr(FDate)+''',';
   end;
   strFilter:=strFilter+''''+lblPayE.Caption+''',';
   {Дом}
   if HouseEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+HouseEdit.Text+',';
   {Корпус}
   if KorpusEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+KorpusEdit.Text+''',';
   {Квартира}
   if FlatEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+FlatEdit.Text+''',';
   {Количество жильцов}
   if TenantsEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+TenantsEdit.Text+',';
   strFilter:=strFilter+''''+lblTenantsE.Caption+''',';
   {Статус лицевого счета}
   if VarIsNull(StatusClientBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(StatusClientBox.EditValue)+',';
   strFilter:=strFilter+''''+lblStatusCLientEqual.Caption+''',';
   {Инжинер}
   if VarIsNull(InginerBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(InginerBox.EditValue)+',';
   strFilter:=strFilter+''''+lblInginerEqual.Caption+''',';
   {Облсуживающая организация}
   if VarIsNull(CustomServiceBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(CustomServiceBox.EditValue)+',';
   strFilter:=strFilter+''''+lblOrganiztionEqual.Caption+''',';
   {Номер телефона}
   if PhoneEdit.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+PhoneEdit.Text+''',';
   {Тип улицы}
   if VarIsNull(TypeStreetBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(TypeStreetBox.EditValue)+',';
   {Статус квартиры}
   if VarIsNull(StatusFlatBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(StatusFlatBox.EditValue)+',';
   strFilter:=strFilter+''''+lblFlatE.Caption+''',';
   {Благоустройство}
   if VarIsNull(NormIntakeBox.EditValue) then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(NormIntakeBox.EditValue)+',';
   strFilter:=strFilter+''''+lblNormIntakeE.Caption+'''';
   //Showmessage('Last: '+strFilter);

   if FilterSet.Active then FilterSet.Close;
   FilterSet.SQLs.SelectSQL.Text:='select distinct * from BS_CLIENT_ACCOUNT_FILTER('+strFilter+')';
   FilterSet.Open;
   if (not FilterSet.IsEmpty) then
   begin
      Self.Height:=frmHeight+pnlGridHeight;
      if not pnlGrid.Visible then pnlGrid.Visible:=True;
   end
   else
   begin
      bsShowMessage('Увага!', 'За найстроками фільтру не було знайдено записів!', mtInformation, [mbOK]);
   end;
   ClientFilter.SetParams;
   btnUndo.Enabled:=True;
   btnRedo.Enabled:=False;
end;

procedure TfrmClientAccount.UpdateAllDataSet;
begin
   if not VarIsNull(ClientFilter.GetValueByNameComponentEx('BsRegionBox')) then
   begin
      if RegionDSet.Active then RegionDSet.Close;
      RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
      RegionDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=ClientFilter.GetValueByNameComponentEx('BsRegionBox');
      RegionDSet.Open;
   end;
   if not VarIsNull(ClientFilter.GetValueByNameComponentEx('DomBox')) then
   begin
      if DomDSet.Active then DomDSet.Close;
      DomDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DISCOUNT_OBJECT_SEL(:ID_DISCOUNT_OBJECT)';
      DomDSet.ParamByName('ID_DISCOUNT_OBJECT').AsInteger:=ClientFilter.GetValueByNameComponentEx('DomBox');
      DomDSet.Open;
   end;
   if not VarIsNull(ClientFilter.GetValueByNameComponentEx('CityAreaBox')) then
   begin
      if CityAreaDSet.Active then CityAreaDSet.Close;
      CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
      CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=ClientFilter.GetValueByNameComponentEx('CityAreaBox');
      CityAreaDSet.Open;
   end;
   if not VarIsNull(ClientFilter.GetValueByNameComponentEx('InginerBox')) then
   begin
      if InginerDSet.Active then InginerDSet.Close;
      InginerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
      InginerDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=ClientFilter.GetValueByNameComponentEx('InginerBox');
      InginerDSet.Open;
   end;
   if not VarIsNull(ClientFilter.GetValueByNameComponentEx('TypeStreetBox')) then
   begin
      if TypeStreetDSet.Active then TypeStreetDSet.Close;
      TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
      TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=ClientFilter.GetValueByNameComponentEx('TypeStreetBox');
      TypeStreetDSet.Open;
   end;
   if not VarIsNull(ClientFilter.GetValueByNameComponentEx('FamiliyaBox')) then
   begin
      if FamDSet.Active then FamDSet.Close;
      FamDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      FamDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=ClientFilter.GetValueByNameComponentEx('FamiliyaBox');
      FamDSet.ParamByName('RADIO_BTN').AsShort:=0;
      FamDSet.ParamByName('IS_ADD').AsShort:=0;
      FamDSet.Open;
   end;
   if not VarIsNull(ClientFilter.GetValueByNameComponentEx('ImyaBox')) then
   begin
      if ImyaDSet.Active then ImyaDSet.Close;
      ImyaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      ImyaDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=ClientFilter.GetValueByNameComponentEx('ImyaBox');
      ImyaDSet.ParamByName('RADIO_BTN').AsShort:=1;
      ImyaDSet.ParamByName('IS_ADD').AsShort:=0;
      ImyaDSet.Open;
   end;
   if not VarIsNull(ClientFilter.GetValueByNameComponentEx('PatronomycBox')) then
   begin
      if PatrDSet.Active then PatrDSet.Close;
      PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      PatrDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=ClientFilter.GetValueByNameComponentEx('PatronomycBox');
      PatrDSet.ParamByName('RADIO_BTN').AsShort:=2;
      PatrDSet.ParamByName('IS_ADD').AsShort:=0;
      PatrDSet.Open;
   end; 
   if not VarIsNull(ClientFilter.GetValueByNameComponentEx('CustomServiceBox')) then
   begin
      if CustomServiceDSet.Active then CustomServiceDSet.Close;
      CustomServiceDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
      CustomServiceDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=ClientFilter.GetValueByNameComponentEx('CustomServiceBox');
      CustomServiceDSet.Open;
   end;
   if not VarIsNull(ClientFilter.GetValueByNameComponentEx('NormIntakeBox')) then
   begin
      if NormIntakeDSet.Active then NormIntakeDSet.Close;
      NormIntakeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NORM_INTAKE_SEL_BY_ID(:ID_NORM_INTAKE)';
      NormIntakeDSet.ParamByName('ID_NORM_INTAKE').AsInteger:=ClientFilter.GetValueByNameComponentEx('NormIntakeBox');
      NormIntakeDSet.Open;
   end;
   ClientFilter.FillComponents;
   btnUndo.Enabled:=ClientFilter.EnableBtn(True);
   btnRedo.Enabled:=ClientFilter.EnableBtn(False);
end;

procedure TfrmClientAccount.ActClearExecute(Sender: TObject);
begin
   if RegionDSet.Active then RegionDSet.Close;
   if CityAreaDSet.Active then CityAreaDSet.Close;
   if DomDSet.Active then DomDSet.Close;
   if FamDSet.Active then FamDSet.Close;
   if ImyaDSet.Active then ImyaDSet.Close;
   if TypeStreetDSet.Active then TypeStreetDSet.Close;
   if CustomServiceDSet.Active then CustomServiceDSet.Close;
   if InginerDSet.Active then InginerDSet.Close;
   if NormIntakeDSet.Active then NormIntakeDSet.Close;
   BsRegionBox.EditValue:=null;
   CityAreaBox.EditValue:=null;
   DomBox.EditValue:=null;
   FamiliyaBox.EditValue:=null;
   ImyaBox.EditValue:=null;
   PatronomycBox.EditValue:=null;
   StatusFlatBox.EditValue:=null;
   NormIntakeBox.EditValue:=null;
   InginerBox.EditValue:=null;
   TypeStreetBox.EditValue:=null;
   CustomServiceBox.EditValue:=null;
   MachineKodEdit.Text:='';
   InputEdit.Text:='';
   ClientAccountEdit.Text:='';
   HouseEdit.Text:='';
   KorpusEdit.Text:='';
   FlatEdit.Text:='';
   TenantsEdit.Text:='';
   PhoneEdit.Text:='';
   LastPaymentDate.EditValue:=(null);
   WaterEdit.Text:='';
   ProcKodEdit.Text:='';
   CntPeopleEdit.Text:='';
end;

procedure TfrmClientAccount.ActUndoExecute(Sender: TObject);
begin
   if ClientFilter.FilterArrayIsNil then Exit;
   ActClearExecute(Sender);
   ClientFilter.FilterUndo;
   UpdateAllDataSet;
end;

procedure TfrmClientAccount.TimeEnterTimer(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
   case ContextInputType of
      0:
      begin
         DomDSet.Close;
         DomDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_STREET_FILTER(:FILTER_STR)';
         DomDSet.ParamByName('FILTER_STR').AsString:=DomBox.EditText;
         DomDSet.Open;
         if not DomDSet.IsEmpty then
         begin
            DomBox.DroppedDown:=True;
         end;
      end;
      1:
      begin
         CityAreaDSet.Close;
         CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CITY_AREA_FILTER(:FILTER_STR)';
         CityAreaDSet.ParamByName('FILTER_STR').AsString:=CityAreaBox.EditText;
         CityAreaDSet.Open;
         if not CityAreaDSet.IsEmpty then
         begin
            CityAreaBox.DroppedDown:=True;
         end;
      end;
      2:
      begin
         RegionDSet.Close;
         RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_REGION_FILTER(:FILTER_STR)';
         RegionDSet.ParamByName('FILTER_STR').AsString:=BsRegionBox.EditText;
         RegionDSet.Open;
         if not RegionDSet.IsEmpty then
         begin
            BsRegionBox.DroppedDown:=True;
         end;
      end;
      3:
      begin
         FamDSet.Close;
         FamDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
         FamDSet.ParamByName('FILTER_STR').AsString:=FamiliyaBox.EditText;
         FamDSet.ParamByName('RADIO_BTN').AsShort:=0;
         FamDSet.ParamByName('IS_ADD').AsShort:=0;
         FamDSet.Open;
         if not FamDSet.IsEmpty then
         begin
            FamiliyaBox.DroppedDown:=True;
         end;
      end;
      4:
      begin
         ImyaDSet.Close;
         ImyaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
         ImyaDSet.ParamByName('FILTER_STR').AsString:=ImyaBox.EditText;
         ImyaDSet.ParamByName('RADIO_BTN').AsShort:=1;
         ImyaDSet.ParamByName('IS_ADD').AsShort:=0;
         ImyaDSet.Open;
         if not ImyaDSet.IsEmpty then
         begin
            ImyaBox.DroppedDown:=True;
         end;
      end;
      5:
      begin
         PatrDSet.Close;
         PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
         PatrDSet.ParamByName('FILTER_STR').AsString:=PatronomycBox.EditText;
         PatrDSet.ParamByName('RADIO_BTN').AsShort:=2;
         PatrDSet.ParamByName('IS_ADD').AsShort:=0;
         PatrDSet.Open;
         if not PatrDSet.IsEmpty then
         begin
            PatronomycBox.DroppedDown:=True;
         end;
      end;
      6:
      begin
         CustomServiceDSet.Close;
         CustomServiceDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_CUSTOM_SERVICE_FILTER(:FILTER_STR)';
         CustomServiceDSet.ParamByName('FILTER_STR').AsString:=CustomServiceBox.EditText;
         CustomServiceDSet.Open;
         if not CustomServiceDSet.IsEmpty then
         begin
            CustomServiceBox.DroppedDown:=True;
         end;
      end;
      7:
      begin
         InginerDSet.Close;
         InginerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_INGINER_FILTER(:FILTER_STR)';
         InginerDSet.ParamByName('FILTER_STR').AsString:=InginerBox.EditText;
         InginerDSet.Open;
         if not InginerDSet.IsEmpty then
         begin
            InginerBox.DroppedDown:=True;
         end;
      end;
      8:
      begin
         NormIntakeDSet.Close;
         NormIntakeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NORM_INTAKE_FILTER(:KOD_NORM)';
         NormIntakeDSet.ParamByName('KOD_NORM').AsString:=NormIntakeBox.EditText;
         NormIntakeDSet.Open;
         if not NormIntakeDSet.IsEmpty then
         begin
            NormIntakeBox.DroppedDown:=True;
         end;
      end;
      9:
      begin
         TypeStreetDSet.Close;
         TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_TYPE_STREET_FILTER(:FILTER_STR, :RADIO_BTN)';
         TypeStreetDSet.ParamByName('FILTER_STR').AsString:=TypeStreetBox.EditText;
         TypeStreetDSet.ParamByName('RADIO_BTN').AsInteger:=0;
         TypeStreetDSet.Open;
         if not TypeStreetDSet.IsEmpty then
         begin
            TypeStreetBox.DroppedDown:=True;
         end;
      end;
   end;
end;

procedure TfrmClientAccount.ActInsExecute(Sender: TObject);
var frm:TfrmClientEdit;
    InFilter:Variant;
    //Res:Variant;
   // AParameter:TbsSimpleParams;
begin
   InFilter:=VarArrayCreate([0, 1], varVariant);
   InFilter[0]:=IdRegionRoot;
   InFilter[1]:=IdCustServiceRoot;
   frm:=TfrmClientEdit.Create(Self, ClientDB.Handle, InFilter, 0, -1, IsAdmin);
   frm.Caption:='Створення нового особового рахунку';
   if frm.ShowModal=mrOk then
   begin
      if frm.ClientEditResult=-1 then Exit;
      {AParameter:= TBsSimpleParams.Create;
      AParameter.Owner:=self;
      AParameter.Db_Handle:= ClientDB.Handle;
      AParameter.Formstyle:=fsNormal;
      AParameter.WaitPakageOwner:=self;
      AParameter.is_admin:=IsAdmin;
      Res:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsDocuments.bpl','ShowDocuments');
      AParameter.Free;
      if not VarIsNull(Res) then
      begin
          StoredProc.StoredProcName:='BS_DOCUMENT_JN_OBJECT_INS';
          StoredProc.Transaction.StartTransaction;
          StoredProc.Prepare;
          StoredProc.ParamByName('ID_OBJECT').AsInteger:=frm.ClientEditResult;
          StoredProc.ParamByName('TYPE_OBJECT').AsShort:=5;
          StoredProc.ParamByName('ID_DOCUMENT').AsInt64:=Res;
          StoredProc.ExecProc;
          StoredProc.Transaction.Commit;
      end;  }
   end;
   frm.Free;
end;

procedure TfrmClientAccount.EditClientAccount(ModeEdit:SmallInt);
var frm:TfrmClientEdit;
    InFilter:Variant;
    //TypeObject:SmallInt;
    //AParameter:TbsSimpleParams;
begin
   if FilterSet.IsEmpty then
   begin
      bsShowMessage('Увага!', 'Треба спочатку обрати особовий рахунок!', mtInformation, [mbOK]);
      Exit;
   end;
   InFilter:=VarArrayCreate([0, 1], varVariant);
   InFilter[0]:=IdRegionRoot;
   InFilter[1]:=IdCustServiceRoot;
   frm:=TfrmClientEdit.Create(Self, ClientDB.Handle, InFilter, ModeEdit, FilterSet['Id_Client_Account'], IsAdmin);
   case ModeEdit of
      1: frm.Caption:='Постійні зміни реквізитів особового рахунку';
      2: frm.Caption:='Тимчасові зміни реквізитів особового рахунку';
      3: frm.Caption:='Постійні зміни послуг особового рахунку';
      4: frm.Caption:='Тимчасові зміни послуг особового рахунку';
   end;

   if ModeEdit in [1, 2] then TypeObject:=5
   else TypeObject:=6;

   if frm.ShowModal=mrOk then
   begin
      if frm.ClientEditResult=-1 then Exit;
      {AParameter:= TBsSimpleParams.Create;
      AParameter.Owner:=self;
      AParameter.Db_Handle:= ClientDB.Handle;
      AParameter.Formstyle:=fsNormal;
      AParameter.WaitPakageOwner:=self;
      AParameter.is_admin:=IsAdmin;
      Res:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsDocuments.bpl','ShowDocuments');
      AParameter.Free;
      if not VarIsNull(Res) then
      begin

          StoredProc.StoredProcName:='BS_DOCUMENT_JN_OBJECT_INS';
          StoredProc.Transaction.StartTransaction;
          StoredProc.Prepare;
          StoredProc.ParamByName('ID_OBJECT').AsInteger:=frm.ClientEditResult;
          StoredProc.ParamByName('TYPE_OBJECT').AsShort:=TypeObject;
          StoredProc.ParamByName('ID_DOCUMENT').AsInt64:=Res;
          StoredProc.ExecProc;
          StoredProc.Transaction.Commit;
      end; }
   end;
   frm.Free;
end;

procedure TfrmClientAccount.DomBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Ord(Key)=VK_RETURN) and (ssCtrl in Shift)) then lblAdresClick(Sender)
   else
   begin
      ContextInputType:=0;
      if DomBox.EditText='' then
         if DomDSet.Active then DomDSet.Close;
      TimeEnter.Enabled:=not ((DomBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
   end;
end;

procedure TfrmClientAccount.ActEditExecute(Sender: TObject);
begin
   if FilterSet.IsEmpty then Exit;
   if not isBlockInsUpd then
   begin
     if VarIsNull(IdClientAccount) then
     begin
        bsShowMessage('Увага!', 'Ви не обрали запис для зміни!', mtInformation, [mbOK]);
        Exit;
     end;
     if btnOk.Visible=True then Exit;
     BtnEnabled([fbModif, fbClear]);
     FIlterGrid.Enabled:=False;
     pnlAction.Visible:=True;
     btnOk.Visible:=True;
     btnCancel.Visible:=True;
   end;
   isBlockInsUpd:=True;
end;

procedure TfrmClientAccount.FilterSetEndScroll(DataSet: TDataSet);
begin
   if FilterSet.IsEmpty then
   begin
      IdClientAccount:=Null;
      KodMachine:=Null;
      Exit;
   end;
   IdClientAccount:=FilterSet['Id_Client_Account'];
   KodMachine:=FilterSet['KOD_MACHINE'];
   MachineKodEdit.Text:=IntToStr(KodMachine);
   if not VarIsNull(FilterSet['CLIENT_ACCOUNT']) then ClientAccountEdit.Text:=IntToStr(FilterSet['CLIENT_ACCOUNT']);
   if not VarIsNull(FilterSet['ID_STATUS_CLIENT_ACCOUNT']) then StatusClientBox.EditValue:=FilterSet['ID_STATUS_CLIENT_ACCOUNT'];
   if not VarIsNull(FilterSet['HOUSE']) then HouseEdit.Text:=IntToStr(FilterSet['HOUSE']);
   if ((not VarIsNull(FilterSet['KORPUS'])) and (FilterSet['KORPUS']<>'')) then
      KorpusEdit.Text:=FilterSet['KORPUS'];
   if not VarIsNull(FilterSet['NUM_FLAT']) then FlatEdit.Text:=FilterSet['NUM_FLAT'];
   if RegionDSet.Active then RegionDSet.Close;
   RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
   RegionDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=FilterSet['ID_REGION'];
   RegionDSet.Open;
   BsRegionBox.EditValue:=FilterSet['ID_REGION'];
   if DomDSet.Active then DomDSet.Close;
   DomDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DISCOUNT_OBJECT_SEL(:ID_DISCOUNT_OBJECT)';
   DomDSet.ParamByName('ID_DISCOUNT_OBJECT').AsInteger:=FilterSet['ID_DISCOUNT_OBJECT'];
   DomDSet.Open;
   DomBox.EditValue:=FilterSet['ID_DISCOUNT_OBJECT'];
   if CityAreaDSet.Active then CityAreaDSet.Close;
   CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
   CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=FilterSet['ID_CITY_AREA'];
   CityAreaDSet.Open;
   CityAreaBox.EditValue:=FilterSet['ID_CITY_AREA'];
   if InginerDSet.Active then InginerDSet.Close;
   InginerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
   InginerDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=FilterSet['ID_INGINER'];
   InginerDSet.Open;
   InginerBox.EditValue:=FilterSet['ID_INGINER'];
   if TypeStreetDSet.Active then TypeStreetDSet.Close;
   TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
   TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=FilterSet['ID_TYPE_STREET'];
   TypeStreetDSet.Open;
   TypeStreetBox.EditValue:=FilterSet['ID_TYPE_STREET'];
   if FamDSet.Active then FamDSet.Close;
   FamDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FIO_BY_ID(:ID_CLIENT_ACCOUNT, :RADIO_BTN)';
   FamDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=FilterSet['ID_CLIENT_ACCOUNT'];
   FamDSet.ParamByName('RADIO_BTN').AsShort:=0;
   FamDSet.Open;
   FamiliyaBox.EditValue:=FamDSet['Out_Str'];
   if ImyaDSet.Active then ImyaDSet.Close;
   ImyaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FIO_BY_ID(:ID_CLIENT_ACCOUNT, :RADIO_BTN)';
   ImyaDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=FilterSet['ID_CLIENT_ACCOUNT'];
   ImyaDSet.ParamByName('RADIO_BTN').AsShort:=1;
   ImyaDSet.Open;
   ImyaBox.EditValue:=ImyaDSet['Out_Str'];
   if PatrDSet.Active then PatrDSet.Close;
   PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FIO_BY_ID(:ID_CLIENT_ACCOUNT, :RADIO_BTN)';
   PatrDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=FilterSet['ID_CLIENT_ACCOUNT'];
   PatrDSet.ParamByName('RADIO_BTN').AsShort:=2;
   PatrDSet.Open;
   PatronomycBox.EditValue:=PatrDSet['Out_Str'];
   if CustomServiceDSet.Active then CustomServiceDSet.Close;
   CustomServiceDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
   CustomServiceDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=FilterSet['ID_CUSTOMER_SERVICE'];
   CustomServiceDSet.Open;
   CustomServiceBox.EditValue:=FilterSet['ID_CUSTOMER_SERVICE'];
   StatusClientBox.EditValue:=FilterSet['ID_STATUS_CLIENT_ACCOUNT'];
   if not VarIsNull(FilterSet['CLIENT_PHONE']) then PhoneEdit.Text:=FilterSet['CLIENT_PHONE'];
   if not VarIsNull(FilterSet['NUM_TENANTS']) then TenantsEdit.Text:=IntToStr(FilterSet['NUM_TENANTS']);
   if not VarIsNull(FilterSet['KOD_INPUT']) then InputEdit.Text:=FilterSet['KOD_INPUT'];
   StatusFlatBox.EditValue:=FilterSet['Id_Flat_Status'];
   if NormIntakeDSet.Active then NormIntakeDSet.Close;
   NormIntakeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NORM_INTAKE_SEL_BY_ID(:ID_NORM_INTAKE)';
   NormIntakeDSet.ParamByName('ID_NORM_INTAKE').AsInteger:=FilterSet['ID_NORM_INTAKE'];
   NormIntakeDSet.Open;
   NormIntakeBox.EditValue:=FilterSet['ID_NORM_INTAKE'];
   if not VarIsNull(FilterSet['ID_HYDROMETER_STATUS']) then
   begin
      case FilterSet['ID_HYDROMETER_STATUS'] of
         1: begin
               btnVodomer.LargeImageIndex:=28;
               btnVodomer.Caption:='KV';
               btnVodomer.Hint:='Квартирний водомір';
            end;
         2: begin
               btnVodomer.LargeImageIndex:=29;
               btnVodomer.Caption:='V';
               btnVodomer.Hint:='Квартирно-домовий водомір';
            end;
         3: begin
               btnVodomer.LargeImageIndex:=31;
               btnVodomer.Caption:='N';
               btnVodomer.Hint:='Розрахунок по нормі';
            end;
         4: begin
               btnVodomer.LargeImageIndex:=30;
               btnVodomer.Caption:='E';
               btnVodomer.Hint:='Водомір знято';
            end;
      end;
   end
   else
   begin
      btnVodomer.LargeImageIndex:=34;
      btnVodomer.Caption:='U';
      btnVodomer.Hint:='Не визначено';
   end;
end;

procedure TfrmClientAccount.ActDelExecute(Sender: TObject);
var AParameter:TBsSimpleParams;
    Res:Variant;
begin
   try
      if FilterSet.IsEmpty then Exit;
      if bsShowMessage('Увага!', 'Ви дійсно бажаєте закрити особовий рахунок № '+IntToStr(FilterSet['CLIENT_ACCOUNT'])+' ?', mtConfirmation, [mbYes, mbNo])=mrNo then Exit;
      ClientTransWrite.StartTransaction;
      AParameter:= TBsSimpleParams.Create;
      AParameter.Owner:=self;
      AParameter.Db_Handle:= ClientDB.Handle;
      AParameter.Formstyle:=fsNormal;
      AParameter.WaitPakageOwner:=self;
      AParameter.is_admin:=IsAdmin;
      Res:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsDocuments.bpl','ShowDocuments');
      AParameter.Free;
      if not VarIsNull(Res) then
      begin
          StoredProc.StoredProcName:='BS_DOCUMENT_JN_OBJECT_INS';
          StoredProc.Prepare;
          StoredProc.ParamByName('ID_OBJECT').AsInteger:=FilterSet['ID_CLIENT_ACCOUNT'];
          StoredProc.ParamByName('TYPE_OBJECT').AsShort:=5;
          StoredProc.ParamByName('ID_DOCUMENT').AsInt64:=Res;
          StoredProc.ExecProc;
      end;
      StoredProc.StoredProcName:='BS_CLIENT_ACCOUNT_CLOSE';
      StoredProc.Prepare;
      StoredProc.ParamByName('KOD_MACHINE').AsInteger:=FilterSet['KOD_MACHINE'];
      StoredProc.ExecProc;
      ClientTransWrite.Commit;
      ActClearExecute(Sender);
      ActFilterExecute(Sender);
   except on E:Exception
          do begin
               bsShowMessage('Увага', E.Message, mtInformation, [mbOK]);
               StoredProc.Transaction.Rollback;
          end;
   end;  
end;

procedure TfrmClientAccount.DomBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.BsRegionBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.CityAreaBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.DomBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.lblRegionClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= ClientDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.ID_Locate:=IdRegionRoot;
    AParameter.WaitPakageOwner:=self;
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
  except on E:Exception
         do bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmClientAccount.lblCItyAreaClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  AdrRes:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= ClientDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.ID_Locate:=1;
    AdrRes:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsAdress.bpl','ShowBsAdress');
    AParameter.Free;
    if VarArrayDimCount(AdrRes)>0 then
    begin
       if AdrRes[2]<>-1 then
       begin
          if CityAreaDSet.Active then CityAreaDSet.Close;
          CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
          CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=AdrRes[2];
          CityAreaDSet.Open;
          CityAreaBox.EditValue:=CityAreaDSet['ID_CITY_AREA_OUT']
       end;
    end;
  except on E:exception
         do bsShowMessage('Увага!', e.message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmClientAccount.BsRegionBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblRegionClick(Sender)
   else
   begin
      ContextInputType:=2;
      if BsRegionBox.EditText='' then
         if RegionDSet.Active then RegionDSet.Close;
      TimeEnter.Enabled:=not ((BsRegionBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
   end;
end;

procedure TfrmClientAccount.CityAreaBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblCItyAreaClick(Sender)
   else
   begin
      ContextInputType:=1;
      if CityAreaBox.EditText='' then
         if CityAreaDSet.Active then CityAreaDSet.Close;
      TimeEnter.Enabled:=not ((CityAreaBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
   end;   
end;

procedure TfrmClientAccount.BsRegionBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.BsRegionBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.CityAreaBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.CityAreaBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.DomBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.ActRedoExecute(Sender: TObject);
begin
   if ClientFilter.FilterArrayIsNil then Exit;
   ActClearExecute(Sender);
   ClientFilter.FilterRedo;
   UpdateAllDataSet;
end;

procedure TfrmClientAccount.lblStreetClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  DisObject:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= ClientDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    DisObject:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsDiscountObjects.bpl','ShowDiscountObjects');
    AParameter.Free;
    if VarArrayDimCount(DisObject)>0 then
    begin
        if DomDSet.Active then DomDSet.Close;
        DomDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DISCOUNT_OBJECT_SEL(:ID_DISCOUNT_OBJECT)';
        DomDSet.ParamByName('ID_DISCOUNT_OBJECT').AsInteger:=DisObject[0];
        DomDSet.Open;
        DomBox.EditValue:=DisObject[0];
    end;
  except on E:exception
         do bsShowMessage('Увага!', e.message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmClientAccount.lblStreetMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmClientAccount.lblStreetMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmClientAccount.btnProcKodClick(Sender: TObject);
begin
   if btnProcKod.Caption='%' then
   begin
      btnProcKod.Caption:='Код';
   end
   else
   begin
      btnProcKod.Caption:='%';
   end;
end;

procedure TfrmClientAccount.msEqualClick(Sender: TObject);
begin
   (FindComponent(MenusSign.PopupComponent.Name) as TcxLabel).Caption:=msEqual.Caption;
end;

procedure TfrmClientAccount.msLessEqualClick(Sender: TObject);
begin
   (FindComponent(MenusSign.PopupComponent.Name) as TcxLabel).Caption:=msLessEqual.Caption;
end;

procedure TfrmClientAccount.msLessClick(Sender: TObject);
begin
   (FindComponent(MenusSign.PopupComponent.Name) as TcxLabel).Caption:=msLess.Caption;
end;

procedure TfrmClientAccount.msMoreClick(Sender: TObject);
begin
   (FindComponent(MenusSign.PopupComponent.Name) as TcxLabel).Caption:=msMore.Caption;
end;

procedure TfrmClientAccount.msEqualMoreClick(Sender: TObject);
begin
   (FindComponent(MenusSign.PopupComponent.Name) as TcxLabel).Caption:=msEqualMore.Caption;
end;

procedure TfrmClientAccount.msNotEqualClick(Sender: TObject);
begin
   (FindComponent(MenusSign.PopupComponent.Name) as TcxLabel).Caption:=msNotEqual.Caption;
end;

procedure TfrmClientAccount.FamiliyaBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=3;
   if FamiliyaBox.EditText='' then
      if FamDSet.Active then FamDSet.Close;
   TimeEnter.Enabled:=not ((FamiliyaBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmClientAccount.FamiliyaBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.FamiliyaBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.ImyaBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   ContextInputType:=4;
   if ImyaBox.EditText='' then
      if ImyaDSet.Active then ImyaDSet.Close;
   TimeEnter.Enabled:=not ((ImyaBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmClientAccount.PatronomycBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=5;
   if PatronomycBox.EditText='' then
      if PatrDSet.Active then PatrDSet.Close;
   TimeEnter.Enabled:=not ((PatronomycBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmClientAccount.PatronomycBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.PatronomycBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.CustomServiceBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=6;
   if CustomServiceBox.EditText='' then
      if CustomServiceDSet.Active then CustomServiceDSet.Close;
   TimeEnter.Enabled:=not ((CustomServiceBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmClientAccount.CustomServiceBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.CustomServiceBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.lblInputClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  InPutRes:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= ClientDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    InPutRes:=RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_inputs.bpl','ShowSPInputs');
    AParameter.Free;
    if VarArrayDimCount(InPutRes)>0 then
    begin
       InputEdit.Text:=IntToStr(InPutRes[0]);
    end;
  except on E:exception
         do bsShowMessage('Увага!', e.message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmClientAccount.lblInputMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmClientAccount.lblInputMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmClientAccount.InputEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblInputClick(Sender)
end;

procedure TfrmClientAccount.lblOrganizationClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= ClientDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.ID_Locate:=IdInginerRoot;
    AParameter.WaitPakageOwner:=self;
    Res:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsGroupObjects.bpl','ShowObjectsGroup');
    AParameter.Free;

    if VarArrayDimCount(Res)>0 then
    begin
       if InginerDSet.Active then InginerDSet.Close;
       InginerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
       InginerDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=Res[0];
       InginerDSet.Open;
       InginerBox.EditValue:=Res[0];
    end;
  except on E:Exception
         do bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmClientAccount.lblOrganizationMouseEnter(Sender: TObject);
begin
    Screen.Cursor:=crHandPoint;
end;

procedure TfrmClientAccount.lblOrganizationMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmClientAccount.btnPredesignClick(Sender: TObject);
begin
   //ShellExecute(Self.Handle, nil, 'calc', nil, nil, SW_SHOW);
end;

procedure TfrmClientAccount.btnWaterClick(Sender: TObject);
begin
   if btnWater.Caption='Вода' then btnWater.Caption:='Канализация'
   else if btnWater.Caption='Канализация' then btnWater.Caption:='% оплати'
        else if btnWater.Caption='% оплати' then btnWater.Caption:='Долг'
             else if btnWater.Caption='Долг' then btnWater.Caption:='Вода';
end;

procedure TfrmClientAccount.btnSumClick(Sender: TObject);
var frm:TfrmClientSum;
    str:string;
begin
   frm:=TfrmClientSum.Create(Self);
   if frm.ShowModal=mrOk then
   begin
      str:='11111';
      bsShowMessage('Підрахунок', str, mtInformation, [mbYes]);
   end;
   frm.Free;
end;

procedure TfrmClientAccount.btnCntClick(Sender: TObject);
begin
   if FilterSet.IsEmpty then Exit;
   FilterSet.FetchAll;
   bsShowMessage('Підрахунок', 'Загальна кількість записів='+IntToStr(FilterSet.RecordCount), mtInformation, [mbOK]);
end;

procedure TfrmClientAccount.btnCalculatorClick(Sender: TObject);
begin
   ShellExecute(Self.Handle, nil, 'calc', nil, nil, SW_SHOW);
end;

procedure TfrmClientAccount.btnLgotClick(Sender: TObject);
var frm:TfrmLgotClient;
begin
    if FilterSet.isEmpty then Exit;
    frm:=TfrmLgotClient.Create(Self, ClientDB.Handle, FilterSet['KOD_MACHINE']);
    frm.ShowModal;
    frm.Free;
end;

procedure TfrmClientAccount.DomBoxPropertiesInitPopup(Sender: TObject);
begin
   if DomBox.EditText='' then
   begin
      DomDSet.Close;
      DomDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_STREET_FILTER(:FILTER_STR)';
      DomDSet.ParamByName('FILTER_STR').AsString:=DomBox.EditText;
      DomDSet.Open;
   end;
end;

procedure TfrmClientAccount.CityAreaBoxPropertiesInitPopup(
  Sender: TObject);
begin
   if CityAreaBox.EditText='' then
   begin
      CityAreaDSet.Close;
      CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CITY_AREA_FILTER(:FILTER_STR)';
      CityAreaDSet.ParamByName('FILTER_STR').AsString:=CityAreaBox.EditText;
      CityAreaDSet.Open;
   end;
end;

procedure TfrmClientAccount.BsRegionBoxPropertiesInitPopup(
  Sender: TObject);
begin
   if BsRegionBox.EditText='' then
   begin
      RegionDSet.Close;
      RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_REGION_FILTER(:FILTER_STR)';
      RegionDSet.ParamByName('FILTER_STR').AsString:=BsRegionBox.EditText;
      RegionDSet.Open;
   end;
end;

procedure TfrmClientAccount.FamiliyaBoxPropertiesInitPopup(
  Sender: TObject);
begin
   if FamiliyaBox.EditText='' then
   begin
      FamDSet.Close;
      FamDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      FamDSet.ParamByName('FILTER_STR').AsString:=FamiliyaBox.EditText;
      FamDSet.ParamByName('RADIO_BTN').AsShort:=0;
      FamDSet.ParamByName('IS_ADD').AsShort:=0;
      FamDSet.Open;
   end;
end;

procedure TfrmClientAccount.ImyaBoxPropertiesInitPopup(Sender: TObject);
begin
   if ImyaBox.EditText='' then
   begin
      ImyaDSet.Close;
      ImyaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      ImyaDSet.ParamByName('FILTER_STR').AsString:=ImyaBox.EditText;
      ImyaDSet.ParamByName('RADIO_BTN').AsShort:=1;
      ImyaDSet.ParamByName('IS_ADD').AsShort:=0;
      ImyaDSet.Open;
   end;
end;

procedure TfrmClientAccount.PatronomycBoxPropertiesInitPopup(
  Sender: TObject);
begin
   if PatronomycBox.EditText='' then
   begin
      PatrDSet.Close;
      PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      PatrDSet.ParamByName('FILTER_STR').AsString:=PatronomycBox.EditText;
      PatrDSet.ParamByName('RADIO_BTN').AsShort:=2;
      PatrDSet.ParamByName('IS_ADD').AsShort:=0;
      PatrDSet.Open;
   end;
end;

procedure TfrmClientAccount.CustomServiceBoxPropertiesInitPopup(
  Sender: TObject);
begin
   if CustomServiceBox.EditText='' then
   begin
      CustomServiceDSet.Close;
      CustomServiceDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_CUSTOM_SERVICE_FILTER(:FILTER_STR)';
      CustomServiceDSet.ParamByName('FILTER_STR').AsString:=CustomServiceBox.EditText;
      CustomServiceDSet.Open;
   end;
end;

procedure TfrmClientAccount.InginerBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   ContextInputType:=7;
   if InginerBox.EditText='' then
      if InginerDSet.Active then InginerDSet.Close;
   TimeEnter.Enabled:=not ((InginerBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmClientAccount.InginerBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.InginerBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.InginerBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.CustomServiceBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.FamiliyaBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.ImyaBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.PatronomycBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.FormShow(Sender: TObject);
begin
   Self.Width:=650;
   Self.Height:=500;
   Self.Top:=Round(Application.MainForm.Height/2)-350;
   Self.Left:=Round(Application.MainForm.Width/2)-Round(Self.Width/2);
end;

procedure TfrmClientAccount.NormIntakeBoxPropertiesInitPopup(
  Sender: TObject);
begin
   if NormIntakeBox.EditText='' then
   begin
      NormIntakeDSet.Close;
      NormIntakeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NORM_INTAKE_FILTER(:KOD_NORM)';
      NormIntakeDSet.ParamByName('KOD_NORM').AsString:=NormIntakeBox.EditText;
      NormIntakeDSet.Open;
   end;
end;

procedure TfrmClientAccount.btnEditClientClick(Sender: TObject);
begin
   EditClientAccount(1);
end;

procedure TfrmClientAccount.btnTempEditClientClick(Sender: TObject);
begin
   EditClientAccount(2);
end;

procedure TfrmClientAccount.btnTempEditServiceClick(Sender: TObject);
begin
   EditClientAccount(4);
end;

procedure TfrmClientAccount.btnEditServiceClick(Sender: TObject);
begin
   EditClientAccount(3);
end;

procedure TfrmClientAccount.ImyaBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.ImyaBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.NormIntakeBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=8;
   if NormIntakeBox.EditText='' then
      if NormIntakeDSet.Active then NormIntakeDSet.Close;
   TimeEnter.Enabled:=not ((NormIntakeBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmClientAccount.NormIntakeBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.NormIntakeBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.NormIntakeBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.TypeStreetBoxPropertiesInitPopup(
  Sender: TObject);
begin
   if TypeStreetBox.EditText='' then
   begin
      TypeStreetDSet.Close;
      TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET';
      TypeStreetDSet.Open;
   end;
end;

procedure TfrmClientAccount.TypeStreetBoxClick(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.TypeStreetBoxEnter(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.TypeStreetBoxExit(Sender: TObject);
begin
   TimeEnter.Enabled:=False;
end;

procedure TfrmClientAccount.TypeStreetBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=9;
   if TypeStreetBox.EditText='' then
      if TypeStreetDSet.Active then TypeStreetDSet.Close;
   TimeEnter.Enabled:=not ((TypeStreetBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmClientAccount.FIlterGridDBViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if ((ssShift in Shift) and (Key=VK_F12)) then
   begin
      ShowDataSetInfo(FilterSet);
   end;
end;

procedure TfrmClientAccount.btnNachislSpravClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
begin
    if FilterSet.IsEmpty then Exit;
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= ClientDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.ID_Locate:=FilterSet['KOD_MACHINE'];
    RunFunctionFromPackage(AParameter, 'BillingSystem\bs_view_pers_acc_inf.bpl','ShowViewNachisl');
    AParameter.Free;
end;

procedure TfrmClientAccount.btnSelectClick(Sender: TObject);
begin
   if not FilterSet.IsEmpty then
   begin
      ResAcClient:=KodMachine;
      ModalResult:=mrOk;
   end;
end;

procedure TfrmClientAccount.btnClientCommentClick(Sender: TObject);
var AParameter:TBsSimpleParams;
begin
    if FilterSet.IsEmpty then Exit;
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= ClientDB.Handle;
    AParameter.Formstyle:=fsNormal;
    AParameter.ID_Locate:=KodMachine;
    AParameter.ID_Locate_1:=TypeObject;
    AParameter.WaitPakageOwner:=self;
    AParameter.is_admin:=IsAdmin;
    RunFunctionFromPackage(AParameter, 'BillingSystem\BsObjectComment.bpl','ShowObjectComment');
    AParameter.Free;
end;

procedure TfrmClientAccount.BsRegionBoxPropertiesChange(Sender: TObject);
begin
   if BsRegionBox.EditText='' then BsRegionBox.EditValue:=(null);
end;

procedure TfrmClientAccount.CityAreaBoxPropertiesChange(Sender: TObject);
begin
   if CityAreaBox.EditText='' then CityAreaBox.EditValue:=(null);
end;

initialization RegisterClass(TfrmClientAccount);

end.
