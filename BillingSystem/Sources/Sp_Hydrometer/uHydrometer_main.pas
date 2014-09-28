//******************************************************************************
// Проект "Горводоканал"
// Справочник водомеров
//******************************************************************************

unit uHydrometer_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  uCommon_Funcs, uConsts, uHydrometer_DM, uCommon_Messages, uConsts_Messages,
  Menus, uCommon_Types, Placemnt, cxCheckBox, AccMGMT, cxCalendar,
  cxGroupBox, cxLabel, cxCheckComboBox, cxDBCheckComboBox,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCurrencyEdit, ActnList, cxGridBandedTableView,
  cxGridDBBandedTableView, ExtCtrls, cxDBExtLookupComboBox, cxMRUEdit,
  cxBlobEdit, cxLookAndFeelPainters, StdCtrls, cxButtons, RxMemDS,
  uCommon_Loader, FIBDataSet, pFIBDataSet, IBCustomDataSet, IBQuery, BsUnivSPrav;

type
  frmButton = (fbAdd, fbEditHydr, fbEditStatus, fbEditLink, fbDelete, fbSelect, fbExit, fbFilter, fbClear, fbRedo, fbUndo, fbHydrLog);
  frmButtons = set of frmButton;

  TfrmHydrometer_Main = class(TForm)
    BarManager: TdxBarManager;
    Button_add: TdxBarLargeButton;
    Button_edit: TdxBarLargeButton;
    Button_delete: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    StatusBar: TdxStatusBar;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    Button_select: TdxBarLargeButton;
    bsFormStorage: TFormStorage;
    cxGroupBox2: TcxGroupBox;
    Box_Filter_Grid: TcxGroupBox;
    Box_Filter_hydrometer: TcxGroupBox;
    Box_hydrometer: TcxGroupBox;
    dxBarDockControl1: TdxBarDockControl;
    Button_Filter: TdxBarLargeButton;
    Button_clear: TdxBarLargeButton;
    Button_Step_up: TdxBarLargeButton;
    ActionList1: TActionList;
    Action_active_filter: TAction;
    Grid_hydrometer: TcxGrid;
    Grid_hydrometerDBView: TcxGridDBTableView;
    Grid_hydrometerLevel: TcxGridLevel;
    BarEdit_n_var_filter: TdxBarEdit;
    Button_step_down: TdxBarLargeButton;
    TimerEnter: TTimer;
    Action_back_up: TAction;
    Action_back_down: TAction;
    Action_clear: TAction;
    box_accept: TcxGroupBox;
    Button_Ok: TcxButton;
    Button_Cancel: TcxButton;
    Label_delete: TcxLabel;
    lblInput: TcxLabel;
    KodInputBox: TcxLookupComboBox;
    HydrTypeBox: TcxLookupComboBox;
    Label_type: TcxLabel;
    lblSignHydrVid: TcxLabel;
    HydrVidBox: TcxLookupComboBox;
    Label_vid: TcxLabel;
    lblSignSealed: TcxLabel;
    InvNumberBox: TcxLookupComboBox;
    lblInvNumber: TcxLabel;
    lblInitStatement: TcxLabel;
    lblSignRevision: TcxLabel;
    lblRevision: TcxLabel;
    lblWound: TcxLabel;
    lblSignWhoSet: TcxLabel;
    CustomerSetBox: TcxLookupComboBox;
    lblWhoSet: TcxLabel;
    lblDateSet: TcxLabel;
    NomerTUBox: TcxLookupComboBox;
    lblNomerSpecif: TcxLabel;
    Label_date: TcxLabel;
    lblLastStatement: TcxLabel;
    lblSignDateLastState: TcxLabel;
    lblDateLastState: TcxLabel;
    lblSignState: TcxLabel;
    StateBox: TcxLookupComboBox;
    lblState: TcxLabel;
    lblLocation: TcxLabel;
    GroupBox_Organization: TcxGroupBox;
    lblCustServ: TcxLabel;
    lblTypeCustServ: TcxLabel;
    TypeCustServBox: TcxLookupComboBox;
    CustServBox: TcxLookupComboBox;
    lblSignCustServ: TcxLabel;
    lblSignTypeCustServ: TcxLabel;
    CheckBox_existence_accounts: TcxCheckBox;
    OwnerBox: TcxLookupComboBox;
    lblOwner: TcxLabel;
    lblSignOwner: TcxLabel;
    lblSealed: TcxLabel;
    lblSignType: TcxLabel;
    lblSignWound: TcxLabel;
    lblSignDateSet: TcxLabel;
    lblDateSpecif: TcxLabel;
    LocationBox: TcxLookupComboBox;
    Act_add: TAction;
    PopupMenu_sign: TPopupMenu;
    pm_Equally: TMenuItem;
    pm_Less_Equal: TMenuItem;
    pm_Less: TMenuItem;
    pm_More: TMenuItem;
    pm_More_Equal: TMenuItem;
    pm_Not_Equal: TMenuItem;
    lblCustomerService: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    lblRegion: TcxLabel;
    RegionBox: TcxLookupComboBox;
    lblStreet: TcxLabel;
    TypeStreetBox: TcxLookupComboBox;
    StreetBox: TcxLookupComboBox;
    lblHouse: TcxLabel;
    lblKorpus: TcxLabel;
    lblFlat: TcxLabel;
    CityAreaBox: TcxLookupComboBox;
    lblCityArea: TcxLabel;
    lblDOM: TcxLabel;
    Button_meter_log: TdxBarLargeButton;
    ColumnInput: TcxGridDBColumn;
    ColumnHydrVid: TcxGridDBColumn;
    ColumnDatePlomb: TcxGridDBColumn;
    ColumnNumInvent: TcxGridDBColumn;
    ColumnMeterBeg: TcxGridDBColumn;
    ColumnDateRev: TcxGridDBColumn;
    ColumnDateAdd: TcxGridDBColumn;
    ColumnCustomerSet: TcxGridDBColumn;
    ColumnDateSet: TcxGridDBColumn;
    ColumnNumTU: TcxGridDBColumn;
    ColumnDateTU: TcxGridDBColumn;
    ColumnMeterEnd: TcxGridDBColumn;
    ColumnMeterDate: TcxGridDBColumn;
    ColumnHydrStatus: TcxGridDBColumn;
    ColumnPlace: TcxGridDBColumn;
    ColumnRegion: TcxGridDBColumn;
    ColumnCityArea: TcxGridDBColumn;
    ColumnTypeStreet: TcxGridDBColumn;
    ColumnStreet: TcxGridDBColumn;
    ColumnHouse: TcxGridDBColumn;
    ColumnKorpus: TcxGridDBColumn;
    ColumnOwner: TcxGridDBColumn;
    ColumnHydrType: TcxGridDBColumn;
    DatePlomb: TcxDateEdit;
    DateRevision: TcxDateEdit;
    DateSet: TcxDateEdit;
    DateTU: TcxDateEdit;
    MeterDate: TcxDateEdit;
    HouseEdit: TcxTextEdit;
    KorpusEdit: TcxTextEdit;
    FlatEdit: TcxTextEdit;
    lblSignKodCustServ: TcxLabel;
    KodCustServBox: TcxLookupComboBox;
    lblKodCustServ: TcxLabel;
    DateAdd: TcxDateEdit;
    EditMenu: TdxBarPopupMenu;
    btnEditHydrometer: TdxBarLargeButton;
    btnEditLinkHydrometer: TdxBarLargeButton;
    btnEditStatus: TdxBarLargeButton;
    FilterSet: TpFIBDataSet;
    FilterDS: TDataSource;
    ColumnDateBeg: TcxGridDBColumn;
    ColumnDateEnd: TcxGridDBColumn;
    btnMode: TdxBarLargeButton;
    MeterBeg: TcxTextEdit;
    MeterEnd: TcxTextEdit;
    btnHistory: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_selectClick(Sender: TObject);
    procedure Button_addClick(Sender: TObject);
    procedure Button_deleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action_active_filterExecute(Sender: TObject);
    Procedure Load_filter_param(number : byte);
    procedure Clear_filter_param;
    procedure TimerEnterTimer(Sender: TObject);
    procedure Action_back_upExecute(Sender: TObject);
    procedure Action_back_downExecute(Sender: TObject);
    procedure Action_clearExecute(Sender: TObject);
    procedure Button_CancelClick(Sender: TObject);
    procedure Button_OkClick(Sender: TObject);
    procedure lblInputClick(Sender: TObject);
    procedure Label_typeClick(Sender: TObject);
    procedure Label_vidClick(Sender: TObject);
    procedure pm_EquallyClick(Sender: TObject);
    procedure pm_Less_EqualClick(Sender: TObject);
    procedure pm_LessClick(Sender: TObject);
    procedure pm_MoreClick(Sender: TObject);
    procedure pm_More_EqualClick(Sender: TObject);
    procedure pm_Not_EqualClick(Sender: TObject);
    procedure lblCustomerServiceClick(Sender: TObject);
    procedure lblDOMClick(Sender: TObject);
    procedure lblRegionClick(Sender: TObject);
    procedure lblCityAreaClick(Sender: TObject);
    procedure lblStreetClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure Button_meter_logClick(Sender: TObject);
    procedure InputBoxPropertiesInitPopup(Sender: TObject);
    procedure HydrTypeBoxPropertiesInitPopup(Sender: TObject);
    procedure HydrVidBoxPropertiesInitPopup(Sender: TObject);
    procedure StateBoxPropertiesInitPopup(Sender: TObject);
    procedure LocationBoxPropertiesInitPopup(Sender: TObject);
    procedure CustServBoxPropertiesInitPopup(Sender: TObject);
    procedure KodCustServBoxPropertiesInitPopup(Sender: TObject);
    procedure RegionBoxPropertiesInitPopup(Sender: TObject);
    procedure CityAreaBoxPropertiesInitPopup(Sender: TObject);
    procedure StreetBoxPropertiesInitPopup(Sender: TObject);
    procedure StreetBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StreetBoxExit(Sender: TObject);
    procedure StreetBoxEnter(Sender: TObject);
    procedure StreetBoxClick(Sender: TObject);
    procedure RegionBoxClick(Sender: TObject);
    procedure RegionBoxEnter(Sender: TObject);
    procedure RegionBoxExit(Sender: TObject);
    procedure CityAreaBoxClick(Sender: TObject);
    procedure CityAreaBoxEnter(Sender: TObject);
    procedure CityAreaBoxExit(Sender: TObject);
    procedure TypeStreetBoxClick(Sender: TObject);
    procedure TypeStreetBoxEnter(Sender: TObject);
    procedure TypeStreetBoxExit(Sender: TObject);
    procedure KodInputBoxClick(Sender: TObject);
    procedure KodInputBoxEnter(Sender: TObject);
    procedure KodInputBoxExit(Sender: TObject);
    procedure HydrTypeBoxClick(Sender: TObject);
    procedure HydrTypeBoxEnter(Sender: TObject);
    procedure HydrTypeBoxExit(Sender: TObject);
    procedure HydrVidBoxClick(Sender: TObject);
    procedure HydrVidBoxEnter(Sender: TObject);
    procedure HydrVidBoxExit(Sender: TObject);
    procedure ServiceBoxClick(Sender: TObject);
    procedure ServiceBoxEnter(Sender: TObject);
    procedure ServiceBoxExit(Sender: TObject);
    procedure StateBoxClick(Sender: TObject);
    procedure StateBoxEnter(Sender: TObject);
    procedure StateBoxExit(Sender: TObject);
    procedure LocationBoxClick(Sender: TObject);
    procedure LocationBoxEnter(Sender: TObject);
    procedure LocationBoxExit(Sender: TObject);
    procedure TypeCustServBoxClick(Sender: TObject);
    procedure TypeCustServBoxEnter(Sender: TObject);
    procedure TypeCustServBoxExit(Sender: TObject);
    procedure CustServBoxClick(Sender: TObject);
    procedure CustServBoxEnter(Sender: TObject);
    procedure CustServBoxExit(Sender: TObject);
    procedure KodCustServBoxClick(Sender: TObject);
    procedure KodCustServBoxEnter(Sender: TObject);
    procedure KodCustServBoxExit(Sender: TObject);
    procedure HydrVidBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TypeStreetBoxPropertiesInitPopup(Sender: TObject);
    procedure TypeStreetBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RegionBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CityAreaBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KodInputBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HydrTypeBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StateBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LocationBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CustServBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KodCustServBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure WhoSetBoxPropertiesInitPopup(Sender: TObject);
    procedure CustomerSetBoxClick(Sender: TObject);
    procedure CustomerSetBoxEnter(Sender: TObject);
    procedure CustomerSetBoxExit(Sender: TObject);
    procedure CustomerSetBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InvNumberBoxPropertiesInitPopup(Sender: TObject);
    procedure NomerSpecifBoxPropertiesInitPopup(Sender: TObject);
    procedure InvNumberBoxClick(Sender: TObject);
    procedure InvNumberBoxEnter(Sender: TObject);
    procedure InvNumberBoxExit(Sender: TObject);
    procedure NomerTUBoxClick(Sender: TObject);
    procedure NomerTUBoxEnter(Sender: TObject);
    procedure NomerTUBoxExit(Sender: TObject);
    procedure InvNumberBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NomerTUBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FilterSetEndScroll(DataSet: TDataSet);
    procedure btnEditHydrometerClick(Sender: TObject);
    procedure btnEditLinkHydrometerClick(Sender: TObject);
    procedure btnEditStatusClick(Sender: TObject);
    procedure MeterBegKeyPress(Sender: TObject; var Key: Char);
    procedure MeterEndKeyPress(Sender: TObject; var Key: Char);
    procedure btnHistoryClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM : TdmHydrometer_DM;
    ContextInputType : Byte;
    IdHydrometerInput, IdHydrometer: Integer;
    aShortCut : TbsShortCut;
    id_User : Int64;
    Name_User, FilterCaption : String;
    ID_GR_LIST_REGION_ROOT, ID_GR_LIST_CUST_SERV_ROOT, ID_GR_LIST_CHIEF_ENGINEER_ROOT : int64;
    format : TFormatSettings;
    procedure FormIniLanguage;
    function KodInputDSetCloseOpen:Boolean;
    function HydrTypeDSetCloseOpen:Boolean;
    function HydrVidDSetCloseOpen:Boolean;
    function StateDSetCloseOpen:Boolean;
    function LocationDSetCloseOpen:Boolean;
    function CustServDSetCloseOpen:Boolean;
    function KodCustServDSetCloseOpen:Boolean;
    function RegionDSetCloseOpen:Boolean;
    function CityAreaDSetCloseOpen:Boolean;
    function StreetDSetCloseOpen:Boolean;
    function TypeStreetDSetCloseOpen:Boolean;
    function WhoSetDSetCloseOpen:Boolean;
    function InvNumberDSetCloseOpen:Boolean;
    function NomerTuDSetCloseOpen:Boolean;
    function CheckData:Boolean;
    function HydrometerIns:Variant;
    function HydrometerUpd:Variant;
    procedure HydrometerInputLinkUpd;
    function HydrometerStatusUpd:Variant;
    procedure btnEnabled(btnSet:frmButtons);
  public
    res : Variant;
    is_Admin : Boolean;
    constructor Create(AParameter:TbsSimpleParams);reintroduce;
  end;

const
  size_form_h = 510;
  size_form_w = 711;
  Size_AE_h   = size_form_h + 40;
  Size_grid_h = size_form_h + 145;

implementation

uses FIBQuery, uMeter_log, pFIBStoredProc;

{$R *.dfm}

constructor TfrmHydrometer_Main.Create(AParameter:TbsSimpleParams);
begin
   Screen.Cursor:=crHourGlass;
   inherited Create(AParameter.Owner);

   is_Admin := AParameter.is_Admin;
   id_User  := AParameter.ID_User;
   Name_User := AParameter.User_Name;

   DM := TdmHydrometer_DM.Create(Self);

   DM.DB.Handle := AParameter.Db_Handle;
   DM.DB.Connected := True;
   DM.ReadTransaction.StartTransaction;

   DM.ReadDataSet.Close;
   DM.ReadDataSet.SQLs.SelectSQL.Text := 'Select ID_GR_LIST_REGION_ROOT, ID_GR_LIST_CUST_SERV_ROOT, ID_GR_LIST_CHIEF_ENGINEER_ROOT'+
                                     ' from BS_CONSTS';
   DM.ReadDataSet.Open;

   if DM.ReadDataSet['ID_GR_LIST_REGION_ROOT'] <> null
    then ID_GR_LIST_REGION_ROOT := DM.ReadDataSet['ID_GR_LIST_REGION_ROOT']
    else ID_GR_LIST_REGION_ROOT := -1;

   if DM.ReadDataSet['ID_GR_LIST_CUST_SERV_ROOT'] <> null
    then ID_GR_LIST_CUST_SERV_ROOT := DM.ReadDataSet['ID_GR_LIST_CUST_SERV_ROOT']
    else ID_GR_LIST_CUST_SERV_ROOT := -1;

   if DM.ReadDataSet['ID_GR_LIST_CHIEF_ENGINEER_ROOT'] <> null
    then ID_GR_LIST_CHIEF_ENGINEER_ROOT := DM.ReadDataSet['ID_GR_LIST_CHIEF_ENGINEER_ROOT']
    else ID_GR_LIST_CHIEF_ENGINEER_ROOT := -1;

   with DM do
   begin
      if OwnerDSet.Active then OwnerDSet.Close;
      OwnerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_OWNER';
      OwnerDSet.Open;
   end;

   if AParameter.Formstyle = fsMDIChild then Button_select.Visible := ivNever;

   //Grid_hydrometerDBView.DataController.DataSource := DM.DataSource;

   FormIniLanguage();
   Screen.Cursor := crDefault;
   bsFormStorage.RestoreFormPlacement;
   FilterCaption:=Button_Filter.Caption;
end;

procedure TfrmHydrometer_Main.btnEnabled(btnSet:frmButtons);
begin
    Button_add.Enabled:=fbAdd in btnSet;
    Act_add.Enabled:=Button_add.Enabled;
    Button_edit.Enabled:=((fbEditHydr in btnSet) or (fbEditStatus in btnSet) or (fbEditLink in btnSet));
    btnEditHydrometer.Enabled:=fbEditHydr in btnSet;
    btnEditStatus.Enabled:=fbEditStatus in btnSet;
    btnEditLinkHydrometer.Enabled:=fbEditLink in btnSet;
    Button_delete.Enabled:=fbDelete in btnSet;
    Button_Filter.Enabled:=fbFilter in btnSet;
    Action_active_filter.Enabled:=Button_Filter.Enabled;
    Button_clear.Enabled:=fbClear in btnSet;
    Action_clear.Enabled:=Button_clear.Enabled;
    Button_step_down.Enabled:=fbRedo in btnSet;
    Action_back_down.Enabled:=Button_step_down.Enabled;
    Button_Step_up.Enabled:=fbUndo in btnSet;
    Action_back_up.Enabled:=Button_Step_up.Enabled;
    Button_meter_log.Enabled:=fbHydrLog in btnSet;

    KodInputBox.Enabled:=((Button_add.Enabled) or (btnEditLinkHydrometer.Enabled));
    HydrTypeBox.Enabled:=((Button_add.Enabled) or (btnEditHydrometer.Enabled));
    HydrVidBox.Enabled:=((Button_add.Enabled) or (btnEditHydrometer.Enabled));
    DatePlomb.Enabled:=Button_add.Enabled;
    InvNumberBox.Enabled:=((Button_add.Enabled) or (btnEditHydrometer.Enabled));
    MeterBeg.Enabled:=Button_add.Enabled;
    DateRevision.Enabled:=((Button_add.Enabled) or (btnEditHydrometer.Enabled));
    DateAdd.Enabled:=Button_add.Enabled;
    CustomerSetBox.Enabled:=Button_add.Enabled;
    //DateSet.Enabled:=((Button_add.Enabled) or (btnEditHydrometer.Enabled));
    NomerTUBox.Enabled:=Button_add.Enabled;
    DateTU.Enabled:=Button_add.Enabled;
    StateBox.Enabled:=((Button_add.Enabled) or (btnEditStatus.Enabled));
    LocationBox.Enabled:=((Button_add.Enabled) or (btnEditHydrometer.Enabled));
    OwnerBox.Enabled:=((Button_add.Enabled) or (btnEditHydrometer.Enabled));

    MeterDate.Enabled:=Button_Filter.Enabled;
    MeterEnd.Enabled:=Button_Filter.Enabled;
    TypeCustServBox.Enabled:=Button_Filter.Enabled;
    CustServBox.Enabled:=Button_Filter.Enabled;
    KodCustServBox.Enabled:=Button_Filter.Enabled;
    RegionBox.Enabled:=Button_Filter.Enabled;
    CityAreaBox.Enabled:=Button_Filter.Enabled;
    TypeStreetBox.Enabled:=Button_Filter.Enabled;
    StreetBox.Enabled:=Button_Filter.Enabled;
    HouseEdit.Enabled:=Button_Filter.Enabled;
    KorpusEdit.Enabled:=Button_Filter.Enabled;
    FlatEdit.Enabled:=Button_Filter.Enabled;
    Grid_hydrometer.Enabled:=Button_add.Enabled;
    if (not Button_Filter.Enabled) then
    begin
       box_accept.Visible:=True;
       ClientHeight := Size_AE_h;
    end
    else
    begin
       box_accept.Visible:=False;
       ClientHeight := size_form_h;
    end;
    Button_Ok.Visible:=box_accept.Visible;
    Button_Cancel.Visible:=box_accept.Visible;
end;

function TfrmHydrometer_Main.HydrometerIns:Variant;
var ErMsg:String;
begin
   with DM.StProc do
   Begin
      Transaction.StartTransaction;
      StoredProcName := 'BS_HYDROMETER_INS';
      Prepare;
      ParamByName('NUM_INVENT').asString := InvNumberBox.EditText;
      ParamByName('ID_HYDROMETER_TYPE').AsInteger := HydrTypeBox.EditValue;
      ParamByName('ID_HYDROMETER_VID').AsShort := HydrVidBox.EditValue;
      ParamByName('ID_HYDROMETER_STATUS').AsInteger := StateBox.EditValue; ////2;
      ParamByName('ID_SOURCE').AsInteger := 0;
      ParamByName('ID_INPUT').AsInteger:= KodInputBox.EditValue;
      ParamByName('DATA_PLOMB').AsDate := DatePlomb.Date;
      ParamByName('READOUT_BEG').AsFloat := StrToFloat(MeterBeg.Text);
      ParamByName('DATE_VER').AsDate := DateRevision.Date;
      ParamByName('DATE_SET').AsDate := DateSet.Date;
      ParamByName('ID_CUSTOMER_SET').AsInteger := CustomerSetBox.EditValue;
      ParamByName('NUM_TU').AsString := NomerTUBox.EditText;
      ParamByName('DATE_TU').AsDate := DateTU.Date;
      ParamByName('ID_HYDROMETER_PLACE').AsInteger := LocationBox.EditValue;
      ParamByName('OWNER').AsShort := OwnerBox.EditValue;
      ParamByName('DATE_ADD').AsDate:=DateAdd.Date;
      ParamByName('ID_HYDROMETER').Value:=Null;
      ExecProc;
      ErMsg:= FieldByName('ER_MSG').AsString;
      Result := FieldByName('ID_HYDROMETER_INPUT').AsVariant;
      try
        if ErMsg='' then
        begin
           Transaction.Commit;
           bsShowMessage(Application.Title, 'Збереження виконано без помилок!!!', mtInformation, [mbOK]);
        end
        else
        begin
           Transaction.Rollback;
           bsShowMessage(Application.Title, ErMsg, mtInformation, [mbOK]);
        end;
      except on E:Exception do
            begin
               bsShowMessage('Помилка!', e.Message, mtError, [mbOK]);
               Transaction.Rollback;
               raise;
            end;
      end;
  end;
end;

function tfrmhydrometer_main.HydrometerUpd:Variant;
var ErMsg:string;
begin
    with DM.StProc do
    Begin
       Transaction.StartTransaction;
       StoredProcName := 'BS_HYDROMETER_UPD';
       Prepare;
       ParamByName('NUM_INVENT').asString := InvNumberBox.EditText;
       ParamByName('ID_HYDROMETER').AsInteger:=IdHydrometer;
       ParamByName('ID_HYDROMETER_TYPE').AsInteger := HydrTypeBox.EditValue;
       ParamByName('ID_HYDROMETER_VID').AsShort := HydrVidBox.EditValue;
       ParamByName('ID_HYDROMETER_STATUS').AsInteger := StateBox.EditValue; ////2;
       ParamByName('ID_SOURCE').AsInteger := 0;
       ParamByName('DATA_PLOMB').AsDate := DatePlomb.Date;
       ParamByName('READOUT_BEG').AsFloat := StrToFloat(MeterBeg.Text);
       ParamByName('DATE_VER').AsDate := DateRevision.Date;
       ParamByName('DATE_SET').AsDate := DateSet.Date;
       ParamByName('ID_CUSTOMER_SET').AsInteger := CustomerSetBox.EditValue;
       ParamByName('NUM_TU').AsString := NomerTUBox.EditText;
       ParamByName('DATE_TU').AsDate := DateTU.Date;
       ParamByName('ID_HYDROMETER_PLACE').AsInteger := LocationBox.EditValue;
       ParamByName('OWNER').AsShort := OwnerBox.EditValue;
       ParamByName('DATE_ADD').AsDate:=DateAdd.Date;
       ParamByName('ID_INPUT').AsInteger:=KodInputBox.EditValue;
       ExecProc;
       ErMsg:= FieldByName('ER_MSG').AsString;
       Result:= FieldByName('ID_HYDROMETER_INPUT').AsVariant;
       try
          if ErMsg='' then
          begin
             Transaction.Commit;
             bsShowMessage(Application.Title, 'Збереження виконано без помилок!!!', mtInformation, [mbOK]);
          end
          else
          begin
             Transaction.Rollback;
             bsShowMessage(Application.Title, ErMsg, mtInformation, [mbOK]);
          end;
       except on E:Exception do
              begin
                 bsShowMessage('Помилка!', e.Message, mtError, [mbOK]);
                 Transaction.Rollback;
                 raise;
              end;
       end;
    end;
end;

procedure TfrmHydrometer_Main.HydrometerInputLinkUpd;
var ErMsg:string;
begin
    with DM.StProc do
    Begin
       Transaction.StartTransaction;
       StoredProcName := 'BS_HYDROMETER_INPUT_LINK_UPD';
       Prepare;
       ParamByName('ID_INPUT').AsInteger:= KodInputBox.EditValue;
       ParamByName('ID_HYDROMETER').AsInteger := IdHydrometer;
       ParamByName('DATE_BEG').AsDate := DateSet.Date;;
       ExecProc;
       try
          ErMsg:=FieldByName('Er_Msg').AsString;
          if ErMsg='' then
          begin
             Transaction.Commit;
             bsShowMessage(Application.Title, 'Виконано без помилок!', mtInformation, [mbOK]);
          end
          else
          begin
             Transaction.Rollback;
             bsShowMessage(Application.Title, ErMsg, mtInformation, [mbOK]);
          end;
       except on E:Exception do
              begin
                 bsShowMessage('Помилка!', e.Message, mtError, [mbOK]);
                 Transaction.Rollback;
                 raise;
              end;
       end;
    end;
end;

function TfrmHydrometer_Main.HydrometerStatusUpd:Variant;
var ErMsg:string;
begin
    with DM.StProc do
    Begin
       Transaction.StartTransaction;
       StoredProcName := 'BS_HYDROMETER_STATUS_UPD';
       Prepare;
       ParamByName('ID_HYDROMETER').AsInteger:= IdHydrometerInput;
       ParamByName('ID_INPUT').AsInteger := IdHydrometer;
       ParamByName('DATE_SET').AsDate := DateSet.Date;
       ParamByName('ID_HYDROMETER_STATUS').AsInteger := StateBox.EditValue;
       ExecProc;
       try
          ErMsg:=FieldByName('ER_MSG').AsString;
          Result:=IdHydrometer;
          if ErMsg='' then
          begin
             Transaction.Commit;
             bsShowMessage(Application.Title, 'Збереження виконано без помилок!!!', mtInformation, [mbOK]);
          end
          else
          begin
             Transaction.Rollback;
             bsShowMessage(Application.Title, ErMsg, mtInformation, [mbOK]);
          end;
       except on E:Exception do
              begin
                 bsShowMessage('Помилка!', e.Message, mtError, [mbOK]);
                 Transaction.Rollback;
                 raise;
              end;
       end;
    end;
end;

function TfrmHydrometer_Main.CheckData:Boolean;
begin
   Result:=True;
   KodInputBox.Style.Color:=clWindow;
   DatePlomb.Style.Color:=clWindow;
   CustomerSetBox.Style.Color:=clWindow;
   NomerTUBox.Style.Color:=clWindow;
   DateTU.Style.Color:=clWindow;
   HydrTypeBox.Style.Color:=clWindow;
   HydrVidBox.Style.Color:=clWindow;
   InvNumberBox.Style.Color:=clWindow;
   MeterBeg.Style.Color:=clWindow;
   DateRevision.Style.Color:=clWindow;
   DateSet.Style.Color:=clWindow;
   StateBox.Style.Color:=clWindow;
   LocationBox.Style.Color:=clWindow;
   OwnerBox.Style.Color:=clWindow;

   if Button_add.Enabled then
   begin
      if KodInputBox.EditText='' then
      begin
         Result:=False;
         //bsShowMessage(Application.Title, 'Ви не обрали ввод!', mtInformation, [mbOK]);
         //KodInputBox.SetFocus;
         KodInputBox.Style.Color:=uconsts.BsClFieldIsEmpty;
      end;

      if DatePlomb.Text='' then
      begin
         Result:=False;
         //bsShowMessage(Application.Title, 'Ви не обрали дату опломбування!', mtInformation, [mbOK]);
         //DatePlomb.SetFocus;
         DatePlomb.Style.Color:=uconsts.BsClFieldIsEmpty;
      end;

      if CustomerSetBox.EditText='' then
      begin
         Result:=False;
         //bsShowMessage(Application.Title, 'Ви не обрали ким був встановлен водомір!', mtInformation, [mbOK]);
         //CustomerSetBox.SetFocus;
         CustomerSetBox.Style.Color:=uconsts.BsClFieldIsEmpty;
      end;

      if NomerTUBox.EditText='' then
      begin
         Result:=False;
         //bsShowMessage(Application.Title, 'Ви не обрали № техн. умов!', mtInformation, [mbOK]);
         //NomerTUBox.SetFocus;
         NomerTUBox.Style.Color:=uconsts.BsClFieldIsEmpty;
      end;

      if DateTU.Text='' then
      begin
         Result:=False;
         //bsShowMessage(Application.Title, 'Ви не обрали дату ТУ!', mtInformation, [mbOK]);
         //DateTU.SetFocus;
         DateTU.Style.Color:=uconsts.BsClFieldIsEmpty;
      end;
   end;

   if HydrTypeBox.EditText='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не обрали тип водоміру!', mtInformation, [mbOK]);
      //HydrTypeBox.SetFocus;
      HydrTypeBox.Style.Color:=uconsts.BsClFieldIsEmpty;
   end;

   if HydrVidBox.EditText='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не обрали вид водоміру!', mtInformation, [mbOK]);
      //HydrVidBox.SetFocus;
      HydrVidBox.Style.Color:=uconsts.BsClFieldIsEmpty;
   end;

   if InvNumberBox.EditText='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не обрали інвентирізаційний номер!', mtInformation, [mbOK]);
      //InvNumberBox.SetFocus;
      InvNumberBox.Style.Color:=uconsts.BsClFieldIsEmpty;
   end;

   if MeterBeg.Text='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не заповнили початкові показники!', mtInformation, [mbOK]);
      //MeterBeg.SetFocus;
      MeterBeg.Style.Color:=uconsts.BsClFieldIsEmpty;
   end;

   if DateRevision.Text='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не обрали дату повірки!', mtInformation, [mbOK]);
      //DateRevision.SetFocus;
      DateRevision.Style.Color:=uconsts.BsClFieldIsEmpty;
   end;

   if DateSet.Text='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не обрали дату встановлення!', mtInformation, [mbOK]);
      //DateSet.SetFocus;
      DateSet.Style.Color:=uconsts.BsClFieldIsEmpty;
   end;

   if StateBox.EditText='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не обрали стан!', mtInformation, [mbOK]);
      //StateBox.SetFocus;
      StateBox.Style.Color:=uconsts.BsClFieldIsEmpty;
   end;

   if LocationBox.EditText='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не обрали місцерозташування!', mtInformation, [mbOK]);
      //LocationBox.SetFocus;
      LocationBox.Style.Color:=uconsts.BsClFieldIsEmpty;
   end;

   if OwnerBox.EditText='' then
   begin
      Result:=False;
      //bsShowMessage(Application.Title, 'Ви не обрали володаря!', mtInformation, [mbOK]);
      //OwnerBox.SetFocus;
      OwnerBox.Style.Color:=uconsts.BsClFieldIsEmpty;
   end;
end;

function TfrmHydrometer_Main.KodInputDSetCloseOpen:Boolean;
begin
   with DM do
   begin
      if KodInputDSet.Active then KodInputDSet.Close;
      KodInputDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_INPUT_INFO_BY_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      KodInputDSet.ParamByName('FILTER_STR').AsString:=KodInputBox.EditText;
      KodInputDSet.ParamByName('RADIO_BTN').AsShort:=1;
      KodInputDSet.ParamByName('IS_ADD').AsShort:=0;
      KodInputDSet.Open;
      Result:=not KodInputDSet.isEmpty;
   end;
end;

function TfrmHydrometer_Main.HydrTypeDSetCloseOpen:Boolean;
begin
   with DM do
   begin
      if HydrTypeDSet.Active then HydrTypeDSet.Close;
      HydrTypeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_HYDROMETER_TYPE_FILTER(:FILTER_STR)';
      HydrTypeDSet.ParamByName('FILTER_STR').AsString:=HydrTypeBox.EditText;
      HydrTypeDSet.Open;
      Result:=not HydrTypeDSet.IsEmpty;
   end;
end;

function TfrmHydrometer_Main.HydrVidDSetCloseOpen:Boolean;
begin
   with DM do
   begin
      if HydrVidDSet.Active then HydrVidDSet.Close;
      HydrVidDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_HYDROMETER_VID_FILTER(:FILTER_STR)';
      HydrVidDSet.ParamByName('FILTER_STR').AsString:=HydrVidBox.EditText;
      HydrVidDSet.Open;
      Result:=not HydrVidDSet.IsEmpty;
   end;
end;

function TfrmHydrometer_Main.StateDSetCloseOpen:Boolean;
begin
   with DM do
   begin
      if StateDSet.Active then StateDSet.Close;
      StateDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_HYDROMETER_STATUS_FILTER(:FILTER_STR)';
      StateDSet.ParamByName('FILTER_STR').AsString:=StateBox.EditText;
      StateDSet.Open;
      Result:=not StateDSet.IsEmpty;
   end;
end;

function TfrmHydrometer_Main.LocationDSetCloseOpen:Boolean;
begin
   with DM do
   begin
      if LocationDSet.Active then LocationDSet.Close;
      LocationDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_HYDROMETER_PLACE_FILTER(:FILTER_STR)';
      LocationDSet.ParamByName('FILTER_STR').AsString:=LocationBox.EditText;
      LocationDSet.Open;
      Result:=not LocationDSet.IsEmpty;
   end;
end;

function TfrmHydrometer_Main.CustServDSetCloseOpen:Boolean;
begin
   with DM do
   begin
       if CustServDSet.Active then CustServDSet.Close;
       CustServDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR, :ID_ROOT, :RADIO_BTN)';
       CustServDSet.ParamByName('FILTER_STR').AsString:=CustServBox.EditText;
       CustServDSet.ParamByName('ID_ROOT').AsInteger:=ID_GR_LIST_CUST_SERV_ROOT;
       CustServDSet.ParamByName('RADIO_BTN').AsShort:=0;
       CustServDSet.Open;
       Result:=not CustServDSet.IsEmpty;
   end;
end;

function TfrmHydrometer_Main.KodCustServDSetCloseOpen:Boolean;
begin
   with DM do
   begin
      if KodCustServDSet.Active then KodCustServDSet.Close;
      KodCustServDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR, :ID_ROOT, :RADIO_BTN)';
      KodCustServDSet.ParamByName('FILTER_STR').AsString:=KodCustServBox.EditText;
      KodCustServDSet.ParamByName('ID_ROOT').AsInteger:=ID_GR_LIST_CUST_SERV_ROOT;
      KodCustServDSet.ParamByName('RADIO_BTN').AsShort:=2;
      KodCustServDSet.Open;
      Result:=not KodCustServDSet.IsEmpty;
   end;
end;

function TfrmHydrometer_Main.RegionDSetCloseOpen:Boolean;
begin
   with DM do
   begin
       if RegionDSet.Active then RegionDSet.Close;
       RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_REGION_FILTER(:FILTER_STR)';
       RegionDSet.ParamByName('FILTER_STR').AsString:=RegionBox.EditText;
       RegionDSet.Open;
       Result:=not RegionDSet.IsEmpty;
   end;
end;

function TfrmHydrometer_Main.CityAreaDSetCloseOpen:Boolean;
begin
   with DM do
   begin
       if CityAreaDSet.Active then CityAreaDSet.Close;
       CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CITY_AREA_FILTER(:FILTER_STR)';
       CityAreaDSet.ParamByName('FILTER_STR').AsString:=CityAreaBox.EditText;
       CityAreaDSet.Open;
       Result:=not CityAreaDSet.IsEmpty;
   end;
end;

function TfrmHydrometer_Main.StreetDSetCloseOpen:Boolean;
begin
   with DM do
   begin
      if StreetDSet.Active then StreetDSet.Close;
      StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_STREET_FILTER(:FILTER_STR)';
      StreetDSet.ParamByName('FILTER_STR').AsString:=StreetBox.EditText;
      StreetDSet.Open;
      Result:=not StreetDSet.IsEmpty;
   end;
end;

function TfrmHydrometer_Main.TypeStreetDSetCloseOpen:Boolean;
begin
   with DM do
   begin
      if TypeStreetDSet.Active then TypeStreetDSet.Close;
      TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_TYPE_STREET_FILTER(:FILTER_STR, :RADIO_BTN)';
      TypeStreetDSet.ParamByName('FILTER_STR').AsString:=TypeStreetBox.EditText;
      TypeStreetDSet.ParamByName('RADIO_BTN').AsShort:=1;
      TypeStreetDSet.Open;
      Result:=not TypeStreetDSet.IsEmpty;
   end;
end;


function TfrmHydrometer_Main.WhoSetDSetCloseOpen:Boolean;
begin
   with DM do
   begin
      if CustomerSetDSet.Active then CustomerSetDSet.Close;
      CustomerSetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR, :ID_ROOT, :RADIO_BTN)';
      CustomerSetDSet.ParamByName('FILTER_STR').AsString:=CustomerSetBox.EditText;
      CustomerSetDSet.ParamByName('ID_ROOT').AsInteger:=ID_GR_LIST_CUST_SERV_ROOT;
      CustomerSetDSet.ParamByName('RADIO_BTN').AsShort:=0;
      CustomerSetDSet.Open;
      Result:=not CustomerSetDSet.IsEmpty;
   end;
end;

function TfrmHydrometer_Main.InvNumberDSetCloseOpen:Boolean;
begin
  with DM do
  begin
     if InvNumberDSet.Active then InvNumberDSet.Close;
     InvNumberDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_HYDRMETER_INFO_BY_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
     InvNumberDSet.ParamByName('FILTER_STR').AsString:=InvNumberBox.EditText;
     InvNumberDSet.ParamByName('RADIO_BTN').AsShort:=0;
     InvNumberDSet.ParamByName('IS_ADD').AsShort:=Integer((not Button_Filter.Enabled));
     InvNumberDSet.Open;
     Result:=not InvNumberDSet.IsEmpty;
  end;
end;

function TfrmHydrometer_Main.NomerTuDSetCloseOpen:Boolean;
begin
   with DM do
   begin
      if NomerTUDSet.Active then NomerTUDSet.Close;
      NomerTUDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_HYDRMETER_INFO_BY_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      NomerTUDSet.ParamByName('FILTER_STR').AsString:=NomerTUBox.EditText;
      NomerTUDSet.ParamByName('RADIO_BTN').AsShort:=1;
      NomerTUDSet.ParamByName('IS_ADD').AsShort:=Integer((not Button_Filter.Enabled));
      NomerTUDSet.Open;
      Result:=not NomerTUDSet.IsEmpty;
   end;
end;

procedure TfrmHydrometer_Main.FormIniLanguage;
begin
  PLanguageIndex := uCommon_Funcs.bsLanguageIndex();

  //кэпшн формы
  Caption := uConsts.bs_sp_hydrometer[PLanguageIndex];

  //названия кнопок
  //Button_add.Caption     := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  //Button_edit.Caption    := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  Button_delete.Caption  := uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption  := uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  Button_select.Caption   := uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption     := uConsts.bs_ExitBtn_Caption[PLanguageIndex];
  Button_Cancel.Caption  := uConsts.bs_Cancel[PLanguageIndex];
  Button_Ok.Caption      := uConsts.bs_Accept[PLanguageIndex];

  //грид
//  name.Caption           := uConsts.bs_Name_Column[PLanguageIndex];

  
  //Статусбар
  StatusBar.Panels[0].Text := uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text := uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text := uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  StatusBar.Panels[3].Text := uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[4].Text := uConsts.bs_EnterBtn_ShortCut[PLanguageIndex]   + uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  StatusBar.Panels[5].Text := uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //Бокс
  //Box_Input.Caption := uConsts.bs_Name_Column[PLanguageIndex];

  aShortCut := LoadShortCut(DM.DB.Handle, self);
  Act_add.ShortCut := aShortCut.Add;
end;

procedure TfrmHydrometer_Main.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmHydrometer_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  bsFormStorage.SaveFormPlacement;
  
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmHydrometer_Main.Button_selectClick(Sender: TObject);
var
  id_Input: int64;
begin
  If Grid_hydrometerDBView.DataController.RecordCount = 0 then
   begin
    bsShowMessage('Информация', 'Необходимо выбрать водомер!', mtInformation, [mbOK]);
    Exit;
   end;

  Res := VarArrayCreate([0,5],varVariant);

  id_Input := DM.DataSet['ID_INPUT'];
  Res[0]  := id_Input;
  Res[1]  := DM.DataSet['NAME_INPUT'];

  ModalResult := mrOk;
end;

procedure TfrmHydrometer_Main.Button_addClick(Sender: TObject);
begin
   if not is_Admin then
      if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/Hydrometer','Add') <> 0 then
      begin
         messagebox(handle,
                    pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
                    +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
                    pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
         exit;
      end;
    btnEnabled([fbAdd, fbExit]);
    btnMode.LargeImageIndex:=0;
    btnMode.Hint:=Button_add.Caption;
    btnMode.Visible:=ivAlways;
    Button_Filter.Visible:=ivNever;
end;

procedure TfrmHydrometer_Main.Button_deleteClick(Sender: TObject);
var ErMsg:String;
    DateOut:TDate;
    RetId:Integer;
begin
   If Grid_hydrometerDBView.DataController.RecordCount = 0 then
   begin
      bsShowMessage('Информация', 'Необходимо выбрать водомер!', mtInformation, [mbOK]);
      Exit;
   end;

   if not is_Admin then
      if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/Hydrometer','Del') <> 0 then
      begin
         messagebox(handle,
                    pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
                    +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
                    pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
         exit;
      end;

   if bsShowMessage('Увага!', 'Ви дійсно бажаєте вилучити цей період?', mtConfirmation, [mbYes, mbNo])=mrNo then Exit;
   with DM do
   begin
      StProc.StoredProcName:='BS_HYDROMETER_DEL';
      StProc.Transaction.StartTransaction;
      StProc.Prepare;
      StProc.ParamByName('ID_HYDROMETER_INPUT').AsInteger:=IdHydrometerInput;
      try
         StProc.ExecProc;
         ErMsg:=StProc.FieldByName('ER_MSG').AsString;
         RetId:=StProc.FieldByName('ID_HYDROMETER').AsInteger;
         DateOut:=StProc.FieldByName('DATE_BEG').AsDate;
         if ErMsg='' then
         begin
            StProc.Transaction.Commit;
            bsShowMessage(Application.Title, 'Дія виконана успішно!', mtInformation, [mbOK]);
            Action_clearExecute(Sender);
            Action_active_filterExecute(Sender);
            FilterSet.Locate('ID_HYDROMETER;DATE_BEG', VarArrayOf([RetId, DateOut]), [])
         end
         else
         begin
            StProc.Transaction.Rollback;
            bsShowMessage(Application.Title, ErMsg, mtInformation, [mbOK]);
         end;

      except on E:Exception do
             begin
                bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
                StProc.Transaction.Rollback;
             end;
      end;
   end;
end;

procedure TfrmHydrometer_Main.FormCreate(Sender: TObject);
begin
  ClientHeight := size_form_h;
  ClientWidth  := size_form_w;
  format.DecimalSeparator := '.';
end;

procedure TfrmHydrometer_Main.Action_active_filterExecute(Sender: TObject);
var strFilter:string;
begin
  try
     strFilter:='';
     {Ввод}
     if KodInputBox.EditText='' then strFilter:='Null,'
     else strFilter:=IntToStr(KodInputBox.EditValue)+',';

     {Тип водомера}
     if HydrTypeBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(HydrTypeBox.EditValue)+',';
     strFilter:=strFilter+''''+lblSignType.Caption+''',';

     {Вид водомера}
     if HydrVidBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(HydrVidBox.EditValue)+',';
     strFilter:=strFilter+''''+lblSignHydrVid.Caption+''',';

     strFilter:=strFilter+'Null,';

     {Дата опломбирования}
     if DatePlomb.Text='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+DateToStr(DatePlomb.Date)+''',';
     strFilter:=strFilter+''''+lblSignSealed.Caption+''',';

     {Инвентарный номер}
     if InvNumberBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+InvNumberBox.EditValue+''',';

     {Начальные показания}
     if MeterBeg.Text='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+MeterBeg.Text+''',';

     {Дата поверки}
     if DateRevision.Text='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+DateToStr(DateRevision.Date)+''',';
     strFilter:=strFilter+''''+lblSignRevision.Caption+''',';

     {Дата заведения}
     if DateAdd.Text='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+DateToStr(DateAdd.Date)+''',';
     strFilter:=strFilter+''''+lblSignWound.Caption+''',';

     {Кем установлен}
     if CustomerSetBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(CustomerSetBox.EditValue)+',';
     strFilter:=strFilter+''''+lblSignWhoSet.Caption+''',';

     {Дата установки}
     if DateSet.Text='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+DateToStr(DateSet.Date)+''',';
     strFilter:=strFilter+''''+lblSignDateSet.Caption+''',';

     {Номер ТУ}
     if NomerTUBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+NomerTUBox.EditValue+''',';

     {Дата ТУ}
     if DateTU.Text='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+DateToStr(DateTU.Date)+''',';
     strFilter:=strFilter+''''+lblDateSpecif.Caption+''',';

     {Последние показания}
     if MeterEnd.Text='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+MeterEnd.Text+''',';

     {Дата снятия}
     if MeterDate.Text='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+DateToStr(MeterDate.Date)+''',';
     strFilter:=strFilter+''''+lblSignDateLastState.Caption+''',';

     {Состояние}
     if StateBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(StateBox.EditValue)+',';
     strFilter:=strFilter+''''+lblSignState.Caption+''',';

     {Месторасположение}
     if LocationBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(LocationBox.EditValue)+',';

     {Тип организации}
     if TypeCustServBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(TypeCustServBox.EditValue)+',';
     strFilter:=strFilter+''''+lblSignTypeCustServ.Caption+''',';

     {Организация}
     if CustServBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(CustServBox.EditValue)+',';
     strFilter:=strFilter+''''+lblSignCustServ.Caption+''',';

     {Код организации}
     if KodCustServBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(KodCustServBox.EditValue)+',';
     strFilter:=strFilter+''''+lblSignKodCustServ.Caption+''',';

     {Регион}
     if RegionBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(RegionBox.EditValue)+',';

     {Район}
     if CityAreaBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(CityAreaBox.EditValue)+',';

     {Тип улицы}
     if TypeStreetBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(TypeStreetBox.EditValue)+',';

     {Улица}
     if StreetBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(StreetBox.EditValue)+',';

     {Дом}
     if HouseEdit.Text='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+HouseEdit.Text+''',';

     {Корпус}
     if KorpusEdit.Text='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+KorpusEdit.Text+''',';

     {Квартира}
     if FlatEdit.Text='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+FlatEdit.Text+''',';

     {Владелец}
     if OwnerBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(OwnerBox.EditValue)+',';
     strFilter:=strFilter+''''+lblSignOwner.Caption+''',';

     {Признак - с учетом открытых лицевых счетов}
     strFilter:=strFilter+IntToStr(Integer(CheckBox_existence_accounts.Checked));

    // ShowMessage(strFilter);

     if FilterSet.Active then FilterSet.Close;
     FilterSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_HYDROMETER_FILTER('+strFilter+')';
     FilterSet.Open;
     if not FilterSet.IsEmpty then
     begin
        ClientHeight := Size_grid_h;
        Box_hydrometer.Visible := true;
     end
     else
     begin
        bsShowMessage('Увага!','За встановленними параметрами не знайдено жодного запису!', mtInformation, [mbOK]);
        if Box_hydrometer.Visible then
        begin
           ClientHeight:=size_form_h;
           Box_hydrometer.Visible:=False;
        end;
     end;
  except on E:Exception do
         begin
            bsShowMessage('Error', 'В ході виконання пошуку виникла помилка!'+ #13#10 + e.Message, mtError, [mbOK]);
            raise;
         end;
  end;
end;

procedure TfrmHydrometer_Main.Load_filter_param(number: byte);
begin
  {TextEdit_kod_input.Text         := filter_param[number].N_input;
  TextEdit_parent_input.Text      := filter_param[number].Parent_Input;
  TextEdit_diam.Text              := filter_param[number].Diam;
  TextEdit_percent_pay.Text       := filter_param[number].Percent_pay;
  TextEdit_FIO_engineer.Text      := filter_param[number].Fio_engineer;
  TextEdit_employee_code.Text := filter_param[number].Employee_code;
  TextEdit_type.Text              := filter_param[number].Type_org;
  TextEdit_name.Text              := filter_param[number].Name_org;
  TextEdit_kod.Text           := filter_param[number].Kod_Org;
  TextEdit_Region.Text            := filter_param[number].Region;
  TextEdit_District.Text          := filter_param[number].District;
  TextEdit_name_place.Text        := filter_param[number].Name_place;
  TextEdit_street.Text            := filter_param[number].Street;
  TextEdit_home.Text          := filter_param[number].Home;}
end;

procedure TfrmHydrometer_Main.Clear_filter_param;
begin
  with DM do
  begin
    if KodInputDSet.Active then KodInputDSet.Close;
    KodInputBox.EditValue:=(null);
    if HydrTypeDSet.Active then HydrTypeDSet.Close;
    HydrTypeBox.EditValue:=(null);
    if HydrVidDSet.Active then HydrVidDSet.Close;
    HydrVidBox.EditValue:=(null);
    DatePlomb.EditValue:=(null);
    if InvNumberDSet.Active then InvNumberDSet.Close;
    InvNumberBox.EditValue:=(null);
    MeterBeg.EditValue:=(null);
    DateRevision.EditValue:=(null);
    if CustomerSetDSet.Active then CustomerSetDSet.Close;
    CustomerSetBox.EditValue:=(null);
    DateSet.EditValue:=(null);
    if NomerTUDSet.Active then NomerTUDSet.Close;
    NomerTUBox.EditValue:=(null);
    MeterEnd.EditValue:=(null);
    MeterDate.EditValue:=(null);
    if StateDSet.Active then StateDSet.Close;
    StateBox.EditValue:=(null);
    if KodCustServDSet.Active then KodCustServDSet.Close;
    KodCustServBox.EditValue:=(null);
    if CustServDSet.Active then CustServDSet.Close;
    CustServBox.EditValue:=(null);
    OwnerBox.EditValue:=(null);
    DateTU.EditValue:=(null);
    DateAdd.EditValue:=(null);
    if LocationDSet.Active then LocationDSet.Close;
    LocationBox.EditValue:=(null);
    if RegionDSet.Active then RegionDSet.Close;
    RegionBox.EditValue:=(null);
    if TypeStreetDSet.Active then TypeStreetDSet.Close;
    TypeStreetBox.EditValue:=(null);
    if StreetDSet.Active then StreetDSet.Close;
    StreetBox.EditValue:=(null);
    if CityAreaDSet.Active then CityAreaDSet.Close;
    CityAreaBox.EditValue:=(null);
    HouseEdit.Text:='';
    FlatEdit.Text:='';
    KorpusEdit.Text:='';
  end;
end;

procedure TfrmHydrometer_Main.TimerEnterTimer(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
   case ContextInputType of
       0:  begin
              KodInputBox.DroppedDown:=KodInputDSetCloseOpen;
           end;
       1:  begin
              HydrTypeBox.DroppedDown:=HydrTypeDSetCloseOpen;
           end;
       2:  begin
              HydrVidBox.DroppedDown:=HydrVidDSetCloseOpen;
           end;
       3:  begin
              StateBox.DroppedDown:=StateDSetCloseOpen;
           end;
       4:  begin
              LocationBox.DroppedDown:=LocationDSetCloseOpen;
           end;
       5:  begin
              CustServBox.DroppedDown:=CustServDSetCloseOpen;
           end;
       6:  begin
              KodCustServBox.DroppedDown:=KodCustServDSetCloseOpen;
           end;
       7:  begin
              StreetBox.DroppedDown:=StreetDSetCloseOpen;
           end;
       8:  begin
              TypeStreetBox.DroppedDown:=TypeStreetDSetCloseOpen;
           end;
       9:  begin
              RegionBox.DroppedDown:=RegionDSetCloseOpen;
           end;
      10:  begin
              CityAreaBox.DroppedDown:=CityAreaDSetCloseOpen;
           end;
      11:  begin
              CustomerSetBox.DroppedDown:=WhoSetDSetCloseOpen;
           end;
      12:  begin
              InvNumberBox.DroppedDown:=InvNumberDSetCloseOpen;
           end;
      13:  begin
              NomerTUBox.DroppedDown:=NomerTuDSetCloseOpen;
           end;
   end;
end;

procedure TfrmHydrometer_Main.Action_back_upExecute(Sender: TObject);
var
  NFP : Byte;
begin
  NFP := StrToInt(Trim(BarEdit_n_var_filter.Text));
  if NFP = 1 then Exit;

  NFP := NFP - 1;
  BarEdit_n_var_filter.Text := '   ' + IntToStr(NFP);
  Load_filter_param(NFP);
end;

procedure TfrmHydrometer_Main.Action_back_downExecute(Sender: TObject);
var
  NFP : Byte;
begin
  NFP := StrToInt(Trim(BarEdit_n_var_filter.Text));


  NFP := NFP + 1;
  BarEdit_n_var_filter.Text := '   ' + IntToStr(NFP);
  Load_filter_param(NFP);
end;

procedure TfrmHydrometer_Main.Action_clearExecute(Sender: TObject);
begin
   Clear_filter_param;
end;

procedure TfrmHydrometer_Main.Button_CancelClick(Sender: TObject);
begin
  //Clear_filter_param
   btnEnabled([fbAdd, fbEditHydr, fbEditStatus, fbEditLink, fbDelete, fbSelect, fbFilter, fbClear, fbRedo, fbUndo, fbExit, fbHydrLog]);
   btnMode.Visible:=ivNever;
   Button_Filter.Visible:=ivAlways;
   KodInputBox.Style.Color:=clWindow;
   DatePlomb.Style.Color:=clWindow;
   CustomerSetBox.Style.Color:=clWindow;
   NomerTUBox.Style.Color:=clWindow;
   DateTU.Style.Color:=clWindow;
   HydrTypeBox.Style.Color:=clWindow;
   HydrVidBox.Style.Color:=clWindow;
   InvNumberBox.Style.Color:=clWindow;
   MeterBeg.Style.Color:=clWindow;
   DateRevision.Style.Color:=clWindow;
   DateSet.Style.Color:=clWindow;
   StateBox.Style.Color:=clWindow;
   LocationBox.Style.Color:=clWindow;
   OwnerBox.Style.Color:=clWindow;
end;

procedure TfrmHydrometer_Main.Button_OkClick(Sender: TObject);
var Id:Variant;
    d:TDate;
    flag:Boolean;
begin
   flag:=False;
   Id:=0;
   d:=DateSet.Date;
   if not CheckData then
   begin
      bsShowMessage(Application.Title, 'Ви не заповнили усі необхідні поля!', mtInformation, [mbOK]);
      Exit;
   end;
   Id:=IdHydrometer;
   if Button_add.Enabled then
   begin
      Id:=HydrometerIns;
      flag:=True;
   end
   else if btnEditHydrometer.Enabled then
        begin
           HydrometerUpd;
        end
        else if btnEditLinkHydrometer.Enabled then
             begin
                HydrometerInputLinkUpd;
             end
             else if btnEditStatus.Enabled then
                  begin
                     HydrometerStatusUpd;
                  end;
   btnEnabled([fbAdd, fbEditHydr, fbEditStatus, fbEditLink, fbDelete, fbSelect, fbFilter, fbClear, fbRedo, fbUndo, fbExit, fbHydrLog]);
   Action_clearExecute(Sender);
   Action_active_filterExecute(Sender);
   if flag then FilterSet.Locate('ID_HYDROMETER_INPUT', Id, [])
   else FilterSet.Locate('ID_HYDROMETER;DATE_BEG', VarArrayOf([Id, d]), []);
   btnMode.Visible:=ivNever;
   Button_Filter.Visible:=ivAlways;
   KodInputBox.Style.Color:=clWindow;
   DatePlomb.Style.Color:=clWindow;
   CustomerSetBox.Style.Color:=clWindow;
   NomerTUBox.Style.Color:=clWindow;
   DateTU.Style.Color:=clWindow;
   HydrTypeBox.Style.Color:=clWindow;
   HydrVidBox.Style.Color:=clWindow;
   InvNumberBox.Style.Color:=clWindow;
   MeterBeg.Style.Color:=clWindow;
   DateRevision.Style.Color:=clWindow;
   DateSet.Style.Color:=clWindow;
   StateBox.Style.Color:=clWindow;
   LocationBox.Style.Color:=clWindow;
   OwnerBox.Style.Color:=clWindow;   
end;

procedure TfrmHydrometer_Main.lblInputClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  {Last change Perchak 16/08/11}
  AParameter                 := TbsSimpleParams.Create;
  AParameter.Owner           := Self;
  AParameter.Db_Handle       := DM.DB.Handle;
  AParameter.ID_User         := id_user;
  AParameter.User_Name       := Name_user;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin        := is_admin;

  Res := RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_Inputs.bpl','ShowSPInputs');
  AParameter.Free;

  if VarArrayDimCount(Res)>0 then
  begin
     with DM do
     begin
         if KodInputDSet.Active then KodInputDSet.Close;
         KodInputDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_INPUT_GET_INFO_BY_ID(:ID_INPUT, NULL, NULL)';
         KodInputDSet.ParamByName('ID_INPUT').AsInteger:=Res[0];
         KodInputDSet.Open;
         KodInputBox.EditValue:=Res[0];
     end;
  end;
end;

procedure TfrmHydrometer_Main.Label_typeClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  {Last change Perchak 16/08/11}
  AParameter                 := TbsSimpleParams.Create;
  AParameter.Owner           := Self;
  AParameter.Db_Handle       := DM.DB.Handle;
  AParameter.ID_User         := id_user;
  AParameter.User_Name       := Name_user;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin        := is_admin;

  Res := RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_HydrType.bpl','ShowSPHydrometerType');
  AParameter.Free;

  if VarArrayDimCount(Res)>0 then
  begin
     with DM do
     begin
        if HydrTypeDSet.Active then HydrTypeDSet.Close;
        HydrTypeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_HYDROMETER_TYPE_SEL_BY_ID(:ID_HYDROMETER_TYPE)';
        HydrTypeDSet.ParamByName('ID_HYDROMETER_TYPE').AsInteger:=Res[0];
        HydrTypeDSet.Open;
        HydrTypeBox.EditValue:=Res[0];
     end;
  end;
end;

procedure TfrmHydrometer_Main.Label_vidClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  {Last change Perchak 16/08/11}
  AParameter                 := TbsSimpleParams.Create;
  AParameter.Owner           := Self;
  AParameter.Db_Handle       := DM.DB.Handle;
  AParameter.ID_User         := id_user;
  AParameter.User_Name       := Name_user;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin        := is_admin;

  Res := RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_HydrVid.bpl','ShowSPHydrometerVid');
  AParameter.Free;

  if VarArrayDimCount(Res)>0 then
  begin
     with DM do
     begin
        if HydrVidDSet.Active then HydrVidDSet.Close;
        HydrVidDSet.SQLs.SelectSQL.Text:='Select Distinct * From BS_HYDROMETER_VID_SEL_BY_ID(:Id_Hydrometer_Vid)';
        HydrVidDSet.ParamByName('Id_Hydrometer_Vid').AsInteger:=Res[0];
        HydrVidDSet.Open;
        HydrVidBox.EditValue:=Res[0];
     end;
  end;
end;

procedure TfrmHydrometer_Main.pm_EquallyClick(Sender: TObject);
begin
  (FindComponent(PopupMenu_sign.PopupComponent.Name) as TcxLabel).Caption := pm_Equally.Caption;
end;

procedure TfrmHydrometer_Main.pm_Less_EqualClick(Sender: TObject);
begin
  (FindComponent(PopupMenu_sign.PopupComponent.Name) as TcxLabel).Caption := pm_Less_Equal.Caption;
end;

procedure TfrmHydrometer_Main.pm_LessClick(Sender: TObject);
begin
  (FindComponent(PopupMenu_sign.PopupComponent.Name) as TcxLabel).Caption := pm_Less.Caption;
end;

procedure TfrmHydrometer_Main.pm_MoreClick(Sender: TObject);
begin
  (FindComponent(PopupMenu_sign.PopupComponent.Name) as TcxLabel).Caption := pm_More.Caption;
end;

procedure TfrmHydrometer_Main.pm_More_EqualClick(Sender: TObject);
begin
  (FindComponent(PopupMenu_sign.PopupComponent.Name) as TcxLabel).Caption := pm_More_Equal.Caption;
end;

procedure TfrmHydrometer_Main.pm_Not_EqualClick(Sender: TObject);
begin
  (FindComponent(PopupMenu_sign.PopupComponent.Name) as TcxLabel).Caption := pm_Not_Equal.Caption;
end;

procedure TfrmHydrometer_Main.lblCustomerServiceClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  AParameter                 := TbsSimpleParams.Create;
  AParameter.Owner           := Self;
  AParameter.Db_Handle       := DM.DB.Handle;
  AParameter.ID_User         := id_user;
  AParameter.User_Name       := Name_user;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin        := is_admin;
  AParameter.ID_Locate       := ID_GR_LIST_CUST_SERV_ROOT;

  Res := RunFunctionFromPackage(AParameter, 'BillingSystem\BsGroupObjects.bpl','ShowObjectsGroup');
  AParameter.Free;

  if VarArrayDimCount(Res)>0 then
  begin
     with DM do
     begin
        if CustServDSet.Active then CustServDSet.Close;
        CustServDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
        CustServDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=Res[0];
        CustServDSet.Open;
        CustServBox.EditValue:=Res[0];
        if KodCustServDSet.Active then KodCustServDSet.Close;
        KodCustServDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
        KodCustServDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=Res[0];
        KodCustServDSet.Open;
        KodCustServBox.EditValue:=CustServDSet['KOD_OBJ'];
     end;
  end;
end;

procedure TfrmHydrometer_Main.lblDOMClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  {last change Perchak A 16/08/2011}
  AParameter                 := TbsSimpleParams.Create;
  AParameter.Owner           := Self;
  AParameter.Db_Handle       := DM.DB.Handle;
  AParameter.ID_User         := id_user;
  AParameter.User_Name       := Name_user;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin        := is_admin;

  Res := RunFunctionFromPackage(AParameter, 'BillingSystem\BsDiscountObjects.bpl','ShowDiscountObjects');
  AParameter.Free;

  if VarArrayDimCount(Res)>0 then
  begin
      with Dm do
      begin
         if RegionDSet.Active then RegionDSet.Close;
         RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR)';
         RegionDSet.ParamByName('ID_GR').AsInteger:=Res[2];
         RegionDSet.Open;
         RegionBox.EditValue:=Res[2];

         if CityAreaDSet.Active then CityAreaDSet.Close;
         CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CITY_AREA_SEL_BY_ID(:ID_CITY_AREA)';
         CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=Res[4];
         CityAreaDSet.Open;
         CityAreaBox.EditValue:=Res[4];

         if StreetDSet.Active then StreetDSet.Close;
         StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_STREET_SEL_BY_ID(:ID_STREET)';
         StreetDSet.ParamByName('ID_STREET').AsInteger:=Res[6];
         StreetDSet.Open;
         StreetBox.EditValue:=Res[6];

         if TypeStreetDSet.Active then TypeStreetDSet.Close;
         TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
         TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=Res[10];
         TypeStreetDSet.Open;
         TypeStreetBox.EditValue:=Res[10];

         if not VarIsNull(Res[8]) then HouseEdit.Text:=Res[8];
         if not VarIsNull(Res[9]) then KorpusEdit.Text:=Res[9];
      end;

  end;
end;

procedure TfrmHydrometer_Main.lblRegionClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  {last change Perchak A 16/08/2011}
  AParameter                 := TbsSimpleParams.Create;
  AParameter.Owner           := Self;
  AParameter.Db_Handle       := DM.DB.Handle;
  AParameter.ID_User         := id_user;
  AParameter.User_Name       := Name_user;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin        := is_admin;
  AParameter.ID_Locate       := 1;    //взять из констов


  Res := RunFunctionFromPackage(AParameter, 'BillingSystem\BsGroupObjects.bpl','ShowObjectsGroup');
  AParameter.Free;

  if VarArrayDimCount(Res)>0 then
  begin
     with DM do
     begin
         if RegionDSet.Active then RegionDSet.Close;
         RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR)';
         RegionDSet.ParamByName('ID_GR').AsInteger:=Res[0];
         RegionDSet.Open;
         RegionBox.EditValue:=Res[0];
     end;
  end;
end;

procedure TfrmHydrometer_Main.lblCityAreaClick(Sender: TObject);
var
  AParameter : TbsSimpleParams;
  res : Variant;
begin
  {last change Perchak A 16/08/2011}
  AParameter                 := TbsSimpleParams.Create;
  AParameter.Owner           := Self;
  AParameter.Db_Handle       := DM.DB.Handle;
  AParameter.ID_User         := id_user;
  AParameter.User_Name       := Name_user;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin        := is_admin;
  AParameter.ID_Locate       := 1;

  res := RunFunctionFromPackage(AParameter, 'BillingSystem\BsAdress.bpl', 'ShowBsAdress');
  AParameter.Free;

  if VarArrayDimCount(res) <> 0 then
  Begin
     with DM do
     begin
        if res[0]<>-1 then
        begin
           if StreetDSet.Active then StreetDSet.Close;
           StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_STREET_SEL_BY_ID(:ID_STREET)';
           StreetDSet.ParamByName('ID_STREET').AsInteger:=Res[0];
           StreetDSet.Open;
           StreetBox.EditValue:=Res[0];
        end;

        if res[2]<>-1 then
        begin
           if CityAreaDSet.Active then CityAreaDSet.Close;
           CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CITY_AREA_SEL_BY_ID(:ID_CITY_AREA)';
           CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=Res[2];
           CityAreaDSet.Open;
           CityAreaBox.EditValue:=Res[2];
        end;
     end;
  end;
end;

procedure TfrmHydrometer_Main.lblStreetClick(Sender: TObject);
var
  AParameter : TbsSimpleParams;
  res : Variant;
begin
  {last change Perchak A 16/08/2011}
  AParameter                 := TbsSimpleParams.Create;
  AParameter.Owner           := Self;
  AParameter.Db_Handle       := DM.DB.Handle;
  AParameter.ID_User         := id_user;
  AParameter.User_Name       := Name_user;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin        := is_admin;
  AParameter.ID_Locate       := 2;

  res := RunFunctionFromPackage(AParameter, 'BillingSystem\BsAdress.bpl', 'ShowBsAdress');
  AParameter.Free;

  if VarArrayDimCount(res) <> 0 then
   Begin

   end;
end;

procedure TfrmHydrometer_Main.dxBarLargeButton3Click(Sender: TObject);
begin
  ShowMessage('Кол-во записей '+ IntToStr(DM.DataSet.RecordCount));
end;

procedure TfrmHydrometer_Main.Button_meter_logClick(Sender: TObject);
var
  ViewForm : TfrmMeter_log;
begin
   if Grid_hydrometerDBView.DataController.RecordCount=0 then
   begin
      bsShowMessage('Увага!', 'Необхідно обрати водомір!', mtInformation, [mbOK]);
      exit;
   end;

   ViewForm := TfrmMeter_log.Create(self, KodInputBox.EditValue, IdHydrometer, FilterSet['Date_Beg'], FilterSet['Date_End'], DM);
   ViewForm.id_user   := id_User;
   ViewForm.Name_user := Name_User;
   ViewForm.Is_admin  := is_Admin;
   ViewForm.ShowModal;
   ViewForm.Free;
end;

procedure TfrmHydrometer_Main.InputBoxPropertiesInitPopup(Sender: TObject);
begin
   KodInputDSetCloseOpen;
end;

procedure TfrmHydrometer_Main.HydrTypeBoxPropertiesInitPopup(
  Sender: TObject);
begin
   HydrTypeDSetCloseOpen;
end;

procedure TfrmHydrometer_Main.HydrVidBoxPropertiesInitPopup(
  Sender: TObject);
begin
   HydrVidDSetCloseOpen
end;

procedure TfrmHydrometer_Main.StateBoxPropertiesInitPopup(Sender: TObject);
begin
   StateDSetCloseOpen;
end;

procedure TfrmHydrometer_Main.LocationBoxPropertiesInitPopup(
  Sender: TObject);
begin
   LocationDSetCloseOpen;
end;

procedure TfrmHydrometer_Main.CustServBoxPropertiesInitPopup(
  Sender: TObject);
begin
   CustServDSetCloseOpen;
end;

procedure TfrmHydrometer_Main.KodCustServBoxPropertiesInitPopup(
  Sender: TObject);
begin
   KodCustServDSetCloseOpen;
end;

procedure TfrmHydrometer_Main.RegionBoxPropertiesInitPopup(
  Sender: TObject);
begin
   RegionDSetCloseOpen;
end;

procedure TfrmHydrometer_Main.CityAreaBoxPropertiesInitPopup(
  Sender: TObject);
begin
   CityAreaDSetCloseOpen;
end;

procedure TfrmHydrometer_Main.StreetBoxPropertiesInitPopup(
  Sender: TObject);
begin
   StreetDSetCloseOpen;
end;

procedure TfrmHydrometer_Main.StreetBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=7;
   if StreetBox.EditText='' then
      if DM.StreetDSet.Active then DM.StreetDSet.Close;
   TimerEnter.Enabled:=not ((StreetBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.StreetBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.StreetBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.StreetBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.RegionBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.RegionBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.RegionBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.CityAreaBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.CityAreaBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.CityAreaBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.TypeStreetBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.TypeStreetBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.TypeStreetBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.KodInputBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.KodInputBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.KodInputBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.HydrTypeBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.HydrTypeBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.HydrTypeBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.HydrVidBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.HydrVidBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.HydrVidBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.ServiceBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.ServiceBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.ServiceBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.StateBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.StateBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.StateBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.LocationBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.LocationBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.LocationBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.TypeCustServBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.TypeCustServBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.TypeCustServBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.CustServBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.CustServBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.CustServBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.KodCustServBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.KodCustServBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.KodCustServBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.HydrVidBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=2;
   if HydrVidBox.EditText='' then
      if DM.HydrVidDSet.Active then DM.HydrVidDSet.Close;
   TimerEnter.Enabled:=not ((HydrVidBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.TypeStreetBoxPropertiesInitPopup(
  Sender: TObject);
begin
   TypeStreetDSetCloseOpen;
end;

procedure TfrmHydrometer_Main.TypeStreetBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=8;
   if TypeStreetBox.EditText='' then
      if DM.TypeStreetDSet.Active then DM.TypeStreetDSet.Close;
   TimerEnter.Enabled:=not ((TypeStreetBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.RegionBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=9;
   if RegionBox.EditText='' then
      if DM.RegionDSet.Active then DM.RegionDSet.Close;
   TimerEnter.Enabled:=not ((RegionBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.CityAreaBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=10;
   if CityAreaBox.EditText='' then
      if DM.CityAreaDSet.Active then DM.CityAreaDSet.Close;
   TimerEnter.Enabled:=not ((CityAreaBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.KodInputBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=0;
   if KodInputBox.EditText='' then
      if DM.KodInputDSet.Active then DM.KodInputDSet.Close;
   TimerEnter.Enabled:=not ((KodInputBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.HydrTypeBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=1;
   if HydrTypeBox.EditText='' then
      if DM.HydrTypeDSet.Active then DM.HydrTypeDSet.Close;
   TimerEnter.Enabled:=not ((HydrTypeBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.StateBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   ContextInputType:=3;
   if StateBox.EditText='' then
      if DM.StateDSet.Active then DM.StateDSet.Close;
   TimerEnter.Enabled:=not ((StateBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.LocationBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=4;
   if LocationBox.EditText='' then
      if DM.LocationDSet.Active then DM.LocationDSet.Close;
   TimerEnter.Enabled:=not ((LocationBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.CustServBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=5;
   if CustServBox.EditText='' then
      if DM.CustServDSet.Active then DM.CustServDSet.Close;
   TimerEnter.Enabled:=not ((CustServBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.KodCustServBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=6;
   if KodCustServBox.EditText='' then
      if DM.KodCustServDSet.Active then DM.KodCustServDSet.Close;
   TimerEnter.Enabled:=not ((KodCustServBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.WhoSetBoxPropertiesInitPopup(
  Sender: TObject);
begin
   WhoSetDSetCloseOpen
end;

procedure TfrmHydrometer_Main.CustomerSetBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.CustomerSetBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.CustomerSetBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.CustomerSetBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=11;
   if CustomerSetBox.EditText='' then
      if DM.CustomerSetDSet.Active then DM.CustomerSetDSet.Close;
   TimerEnter.Enabled:=not ((CustomerSetBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.InvNumberBoxPropertiesInitPopup(
  Sender: TObject);
begin
   InvNumberDSetCloseOpen
end;

procedure TfrmHydrometer_Main.NomerSpecifBoxPropertiesInitPopup(
  Sender: TObject);
begin
   NomerTuDSetCloseOpen
end;

procedure TfrmHydrometer_Main.InvNumberBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.InvNumberBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.InvNumberBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.NomerTUBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.NomerTUBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.NomerTUBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmHydrometer_Main.InvNumberBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=12;
   if InvNumberBox.EditText='' then
      if DM.InvNumberDSet.Active then DM.InvNumberDSet.Close;
   TimerEnter.Enabled:=not ((InvNumberBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.NomerTUBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=13;
   if NomerTUBox.EditText='' then
      if DM.NomerTUDSet.Active then DM.NomerTUDSet.Close;
   TimerEnter.Enabled:=not ((NomerTUBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmHydrometer_Main.FilterSetEndScroll(DataSet: TDataSet);
begin
   try
      if FilterSet.IsEmpty then Exit;
      IdHydrometer:=FilterSet['ID_HYDROMETER'];
      IdHydrometerInput:=FilterSet['ID_HYDROMETER_INPUT'];
      with DM do
      begin
         if KodInputDSet.Active then KodInputDSet.Close;
         KodInputDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_INPUT_GET_INFO_BY_ID(:ID_INPUT, NULL, NULL)';
         KodInputDSet.ParamByName('ID_INPUT').AsInteger:=FilterSet['Id_Input'];
         KodInputDSet.Open;
         KodInputBox.EditValue:=FilterSet['Id_Input'];

         if HydrTypeDSet.Active then HydrTypeDSet.Close;
         HydrTypeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_HYDROMETER_TYPE_SEL_BY_ID(:ID_HYDROMETER_TYPE)';
         HydrTypeDSet.ParamByName('ID_HYDROMETER_TYPE').AsInteger:=FilterSet['ID_HYDROMETER_TYPE'];
         HydrTypeDSet.Open;
         HydrTypeBox.EditValue:=FilterSet['ID_HYDROMETER_TYPE'];

         if HydrVidDSet.Active then HydrVidDSet.Close;
         HydrVidDSet.SQLs.SelectSQL.Text:='Select Distinct * From BS_HYDROMETER_VID_SEL_BY_ID(:Id_Hydrometer_Vid)';
         HydrVidDSet.ParamByName('Id_Hydrometer_Vid').AsInteger:=FilterSet['Id_Hydrometer_Vid'];
         HydrVidDSet.Open;
         HydrVidBox.EditValue:=FilterSet['Id_Hydrometer_Vid'];

         if CustomerSetDSet.Active then CustomerSetDSet.Close;
         CustomerSetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
         CustomerSetDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=FilterSet['Id_Customer_Set'];
         CustomerSetDSet.Open;
         CustomerSetBox.EditValue:=FilterSet['Id_Customer_Set'];

         if StateDSet.Active then StateDSet.Close;
         StateDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_HYDROMETER_STATUS_SEL_BY_ID(:ID_HYDROMETER_STATUS)';
         StateDSet.ParamByName('ID_HYDROMETER_STATUS').AsInteger:=FilterSet['ID_HYDROMETER_STATUS'];
         StateDSet.Open;
         StateBox.EditValue:=FilterSet['ID_HYDROMETER_STATUS'];

         if LocationDSet.Active then LocationDSet.Close;
         LocationDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_HYDROMETER_PLACE_SEL_BY_ID(:ID_HYDROMETER_PLACE)';
         LocationDSet.ParamByName('ID_HYDROMETER_PLACE').AsInteger:=FilterSet['ID_HYDROMETER_PLACE'];
         LocationDSet.Open;
         LocationBox.EditValue:=FilterSet['ID_HYDROMETER_PLACE'];

         if RegionDSet.Active then RegionDSet.Close;
         RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
         RegionDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=FilterSet['ID_REGION'];
         RegionDSet.Open;
         RegionBox.EditValue:=FilterSet['ID_REGION'];

         if CityAreaDSet.Active then CityAreaDSet.Close;
         CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
         CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=FilterSet['ID_CITY_AREA'];
         CityAreaDSet.Open;
         CityAreaBox.EditValue:=FilterSet['ID_CITY_AREA'];

         if TypeStreetDSet.Active then TypeStreetDSet.Close;
         TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
         TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=FilterSet['ID_TYPE_STREET'];
         TypeStreetDSet.Open;
         TypeStreetBox.EditValue:=FilterSet['ID_TYPE_STREET'];

         if StreetDSet.Active then StreetDSet.Close;
         StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_STREET_SEL_BY_ID(:ID_STREET)';
         StreetDSet.ParamByName('ID_STREET').AsInteger:=FilterSet['ID_STREET'];
         StreetDSet.Open;
         StreetBox.EditValue:=FilterSet['ID_STREET'];

         if NomerTUDSet.Active then NomerTUDSet.Close;
         NomerTUDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_HYDROMETER_INFO_BY_ID(:ID_HYDR_INPUT)';
         NomerTUDSet.ParamByName('ID_HYDR_INPUT').AsInteger:=FilterSet['ID_HYDROMETER_INPUT'];
         NomerTUDSet.Open;
         NomerTUBox.EditValue:=FilterSet['Num_Tu'];

         if InvNumberDSet.Active then InvNumberDSet.Close;
         InvNumberDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_HYDROMETER_INFO_BY_ID(:ID_HYDR_INPUT)';
         InvNumberDSet.ParamByName('ID_HYDR_INPUT').AsInteger:=FilterSet['ID_HYDROMETER_INPUT'];
         InvNumberDSet.Open;
         InvNumberBox.EditValue:=FilterSet['Num_Invent'];

         if not VarIsNull(FilterSet['HOUSE']) then HouseEdit.Text:=FilterSet['HOUSE'];
         if not VarIsNull(FilterSet['KORPUS']) then KorpusEdit.Text:=FilterSet['KORPUS'];
         if not VarIsNull(FilterSet['Data_Plomb']) then DatePlomb.Date:=FilterSet['Data_Plomb'];
         if not VarIsNull(FilterSet['Readout_Beg']) then MeterBeg.Text:=IntToStr(FilterSet['Readout_Beg']);
         if not VarIsNull(FilterSet['Date_Ver']) then DateRevision.Date:=FilterSet['Date_Ver'];
         if not VarIsNull(FilterSet['DATE_SET']) then DateSet.Date:=FilterSet['DATE_SET'];
         if not VarIsNull(FilterSet['DATE_TU']) then DateTU.Date:=FilterSet['DATE_TU'];
         if not VarIsNull(FilterSet['Meter_End']) then MeterEnd.Text:=IntToStr(FilterSet['Meter_End']);
         if not VarIsNull(FilterSet['Meter_Date']) then MeterDate.Date:=FilterSet['Meter_Date'];
         if not VarIsNull(FilterSet['DATE_ADD']) then DateAdd.Date:=FilterSet['DATE_ADD'];
         OwnerBox.EditValue:=FilterSet['OWNER'];

      end
   except on E:Exception do
          begin
             bsShowMessage(Application.Title, E.Message, mtInformation, [mbOK]);
          end;
   end;
end;

procedure TfrmHydrometer_Main.btnEditHydrometerClick(Sender: TObject);
begin
   if Grid_hydrometerDBView.DataController.RecordCount=0 then Exit;
   if not is_Admin then
      if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/Hydrometer','Add') <> 0 then
      begin
         messagebox(handle,
                    pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
                    +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
                    pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
         exit;
      end;
   btnEnabled([fbEditHydr, fbExit]);
   btnMode.LargeImageIndex:=1;
   btnMode.Hint:=btnEditHydrometer.Caption;
   btnMode.Visible:=ivAlways;
   Button_Filter.Visible:=ivNever;
end;

procedure TfrmHydrometer_Main.btnEditLinkHydrometerClick(Sender: TObject);
begin
   if not is_Admin then
      if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/Hydrometer','Add') <> 0 then
      begin
         messagebox(handle,
                    pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
                    +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
                    pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
         exit;
      end;

   btnEnabled([fbEditLink, fbExit]);
   btnMode.LargeImageIndex:=1;
   btnMode.Hint:=btnEditLinkHydrometer.Caption;
   btnMode.Visible:=ivAlways;
   Button_Filter.Visible:=ivNever;
end;

procedure TfrmHydrometer_Main.btnEditStatusClick(Sender: TObject);
begin
   if not is_Admin then
      if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/Hydrometer','Add') <> 0 then
      begin
         messagebox(handle,
                    pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
                    +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
                    pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
         exit;
      end;

   btnEnabled([fbEditStatus, fbExit]);
   btnMode.LargeImageIndex:=1;
   btnMode.Hint:=btnEditStatus.Caption;
   btnMode.Visible:=ivAlways;
   Button_Filter.Visible:=ivNever;
end;

procedure TfrmHydrometer_Main.MeterBegKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ((Key=#8) or (key in ['0'..'9'])) then MeterBeg.Properties.ReadOnly:=False
   else MeterBeg.Properties.ReadOnly:=True;
end;

procedure TfrmHydrometer_Main.MeterEndKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ((Key=#8) or (key in ['0'..'9'])) then MeterEnd.Properties.ReadOnly:=False
   else MeterEnd.Properties.ReadOnly:=True;
end;

procedure TfrmHydrometer_Main.btnHistoryClick(Sender: TObject);
var frm:TfrmSprav;
    sParam:TSpravParams;
begin
    if FilterSet.IsEmpty then Exit;
    sParam.FormCaption := 'Ісорія змін';
    sParam.SelectText := 'SELECT DISTINCT * FROM BS_HYDROMETER_HST_SEL('+IntToStr(IdHydrometer)+')';
    sParam.NameFields := 'User_Fio_Hst,Date_Time_Hst,Action_Hst,Name_Hydrometer_Type,'+
                         'Name_Hydrometer_Vid,Num_Invent,Data_Plomb,'+
                         'Readout_Beg,Date_Add,Date_Set,Date_Ver,Name_Customer_Set,Num_Tu,'+
                         'Date_Tu,Name_Hydrometer_Place,Name_Owner,Id_Hst';
    sParam.FieldsCaption := 'Користувач#Дата та час зміни#Дія#Тип водоміру#'+
                            'Вид водоміру#Інвентарний номер#Дата опломбування#'+
                            'Поч. показання#Заведений#Встановлен#Дата повірки#Ким встановлено#'+
                            'Номер ТУ#Дата ТУ#Розташування#Володар';
    sParam.KeyField := 'Id_Hst';
    sParam.ReturnFields := 'Id_Hst';
    sParam.FilterFields:= 'User_Fio_Hst,Date_Time_Hst,Action_Hst,Name_Hydrometer_Type,'+
                          'Name_Hydrometer_Vid,Num_Invent,Data_Plomb,'+
                          'Readout_Beg,Date_Add,Date_Set,Date_Ver,Name_Customer_Set,Num_Tu,'+
                          'Date_Tu,Name_Hydrometer_Place,Name_Owner';
    sParam.FilterCaptions:='Користувач,Дата та час зміни,Дія,Тип водоміру,'+
                           'Вид водоміру,Інвентарний номер,Дата опломбування,'+
                           'Поч. показання,Заведений,Встановлен,Дата повірки,Ким встановлено,'+
                           'Номер ТУ,Дата ТУ,Розташування,Володар';
    sParam.DbHandle:=DM.DB.Handle;
    sParam.frmButtons:=[BsUnivSprav.fbExit];
    sParam.IsMultiSelect:=False;
    frm:=TfrmSprav.Create(Self, sParam);
    frm.ShowModal;
    frm.Free;
end;

end.


