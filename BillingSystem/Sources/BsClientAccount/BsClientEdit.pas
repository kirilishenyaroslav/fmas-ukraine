unit BsClientEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxDropDownEdit, cxCalendar,
  StdCtrls, cxButtons, cxTextEdit, cxLabel, cxControls, cxContainer,
  cxEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  uConsts, uCommon_Funcs, DB, FIBDataSet, pFIBDataSet, uCommon_Messages,
  uCommon_Types, iBase, uCommon_Loader, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridDBTableView,
  cxGrid, dxBar, dxBarExtItems, cxCheckBox, RxMemDS, cxDBEdit, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc;

const FilterHeight=143;
      NormIntakeWidth=346;

type
  TfrmClientEdit = class(TForm)
    lblRegion: TcxLabel;
    lblCItyArea: TcxLabel;
    lblFIO: TcxLabel;
    FamiliyaBox: TcxLookupComboBox;
    ImyaBox: TcxLookupComboBox;
    PatronomycBox: TcxLookupComboBox;
    FlatEdit: TcxTextEdit;
    lblStreet: TcxLabel;
    DomBox: TcxLookupComboBox;
    lblHouse: TcxLabel;
    HouseEdit: TcxTextEdit;
    lblKorpus: TcxLabel;
    KorpusEdit: TcxTextEdit;
    lblFlat: TcxLabel;
    CustomServiceBox: TcxLookupComboBox;
    lblOrganization: TcxLabel;
    PhoneEdit: TcxTextEdit;
    lblPhone: TcxLabel;
    lblTenants: TcxLabel;
    lblTenantsE: TcxLabel;
    TenantsEdit: TcxTextEdit;
    lblClientBirthDate: TcxLabel;
    BirthDate: TcxDateEdit;
    lblDateBeg: TcxLabel;
    DateBeg: TcxDateEdit;
    lblClientAccount: TcxLabel;
    MainPanel: TPanel;
    btnPanel: TPanel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    lblStatusFlat: TcxLabel;
    StatusFlatBox: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    FamDSet: TpFIBDataSet;
    FamSource: TDataSource;
    ImyaDSet: TpFIBDataSet;
    ImyaSource: TDataSource;
    PatrDSet: TpFIBDataSet;
    PatrSource: TDataSource;
    ClientStatusDSet: TpFIBDataSet;
    ClientStatusDS: TDataSource;
    CustomServiceDSet: TpFIBDataSet;
    CustomServiceDS: TDataSource;
    FlatStatusDS: TDataSource;
    FlatStatusDSet: TpFIBDataSet;
    DomDSet: TpFIBDataSet;
    DomDS: TDataSource;
    TimerEdit: TTimer;
    LblInn: TcxLabel;
    InnEdit: TcxTextEdit;
    pnlNormIntake: TPanel;
    pnlComponent: TPanel;
    NormIntakeGridLevel: TcxGridLevel;
    NormIntakeGrid: TcxGrid;
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
    pnlTool: TPanel;
    btnAddInput: TcxButton;
    KodNormDSet: TpFIBDataSet;
    NormIntakeData: TRxMemoryData;
    NormIntakeGridView: TcxGridDBTableView;
    ColumnInput: TcxGridDBColumn;
    ColumnCheck: TcxGridDBColumn;
    ColumnNameService: TcxGridDBColumn;
    ColumnCountService: TcxGridDBColumn;
    ColumnKodNorm: TcxGridDBColumn;
    ColumnNameNorm: TcxGridDBColumn;
    NormIntakeDS: TDataSource;
    NormIntakeDataKOD_INPUT: TIntegerField;
    NormIntakeDataIS_CHECK: TSmallintField;
    NormIntakeDataNAME_SERVICE: TStringField;
    NormIntakeDataCOUNT_SERVICE: TSmallintField;
    NormIntakeDataNAME_NORM: TStringField;
    btnDelInput: TcxButton;
    NormIntakeDataid_service: TIntegerField;
    NormIntakeDataID_NORM: TIntegerField;
    NormIntakeDataKOD_NORM: TStringField;
    ServiceDSet: TpFIBDataSet;
    ColumnUnitMeasure: TcxGridDBColumn;
    pnlAddInfo: TPanel;
    lblWaterInput: TcxLabel;
    lblWaterOutput: TcxLabel;
    WaterInputEdit: TcxDBTextEdit;
    WaterOutputEdit: TcxDBTextEdit;
    NormIntakeDataWater_Input: TFloatField;
    NormIntakeDataWATER_OUTPUT: TFloatField;
    NormIntakeDataUNIT_MEASURE: TStringField;
    GetNameNormByKod: TpFIBDataSet;
    NormIntakeDataDISPLAY_ORDER: TSmallintField;
    ColumnDisplayOrder: TcxGridDBColumn;
    ClientEditProc: TpFIBStoredProc;
    ClientEditWriteTrans: TpFIBTransaction;
    NormIntakeDataID_INPUT: TIntegerField;
    RegionEdit: TcxTextEdit;
    CityAreaEdit: TcxTextEdit;
    NormInakeEdit: TcxDBTextEdit;
    lblNameNorm: TcxLabel;
    lblPeiodBeg: TcxLabel;
    PeriodBeg: TcxDateEdit;
    PeriodEnd: TcxDateEdit;
    lblPeriodEnd: TcxLabel;
    GetClientAccountInfo: TpFIBDataSet;
    NormIntakeDSet: TpFIBDataSet;
    DateEnd: TcxDateEdit;
    lblDateEnd: TcxLabel;
    ClientAccountEdit: TcxComboBox;
    GetNumClient: TpFIBDataSet;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure TimerEditTimer(Sender: TObject);
    procedure FamiliyaBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FamiliyaBoxEnter(Sender: TObject);
    procedure FamiliyaBoxExit(Sender: TObject);
    procedure ImyaBoxEnter(Sender: TObject);
    procedure ImyaBoxExit(Sender: TObject);
    procedure ImyaBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PatronomycBoxEnter(Sender: TObject);
    procedure PatronomycBoxExit(Sender: TObject);
    procedure PatronomycBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RegionBoxEnter(Sender: TObject);
    procedure RegionBoxExit(Sender: TObject);
    procedure CityAreaBoxEnter(Sender: TObject);
    procedure CityAreaBoxExit(Sender: TObject);
    procedure DomBoxEnter(Sender: TObject);
    procedure DomBoxExit(Sender: TObject);
    procedure DomBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblStreetClick(Sender: TObject);
    procedure lblOrganizationClick(Sender: TObject);
    procedure lblInputMouseEnter(Sender: TObject);
    procedure lblInputMouseLeave(Sender: TObject);
    procedure lblStreetMouseLeave(Sender: TObject);
    procedure lblStreetMouseEnter(Sender: TObject);
    procedure lblOrganizationMouseEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddInputClick(Sender: TObject);
    procedure NormIntakeGridViewDblClick(Sender: TObject);
    procedure ColumnKodNormPropertiesPopup(Sender: TObject);
    procedure NormIntakeGridViewEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure ColumnKodNormPropertiesChange(Sender: TObject);
    procedure btnDelInputClick(Sender: TObject);
    function NewClientAccount:Integer;
    function EditClientNormIntake(TypeChange:SmallInt):Integer;
    procedure ClientAccountEditKeyPress(Sender: TObject; var Key: Char);
    procedure TenantsEditKeyPress(Sender: TObject; var Key: Char);
    procedure DomBoxPropertiesChange(Sender: TObject);
    procedure CustomServiceBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CustomServiceBoxClick(Sender: TObject);
    procedure CustomServiceBoxEnter(Sender: TObject);
    procedure CustomServiceBoxExit(Sender: TObject);
    procedure DomBoxPropertiesInitPopup(Sender: TObject);
    procedure CustomServiceBoxPropertiesInitPopup(Sender: TObject);
    procedure FamiliyaBoxPropertiesInitPopup(Sender: TObject);
    procedure ImyaBoxPropertiesInitPopup(Sender: TObject);
    procedure PatronomycBoxPropertiesInitPopup(Sender: TObject);
    procedure NormIntakeGridViewKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblOrganizationMouseLeave(Sender: TObject);
    procedure ImyaBoxClick(Sender: TObject);
    procedure FamiliyaBoxClick(Sender: TObject);
    procedure PatronomycBoxClick(Sender: TObject);
    procedure DomBoxClick(Sender: TObject);
    procedure NormIntakeGridViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ClientAccountEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ClientAccountEditClick(Sender: TObject);
    procedure ClientAccountEditEnter(Sender: TObject);
    procedure ClientAccountEditExit(Sender: TObject);
  private
    { Private declarations }
    ContextInputType:SmallInt;
    IdRootRegion, IdCustServ:Integer;
    MainDbHandle:TISC_DB_HANDLE;
    ClientModeEdit:Smallint; {0 - добавление, 1 - постоянные изменения, 2 - временные изменения, 3 - постоянные изменения услуг, 4 - временные изменения услуг}
    KodMachine, IdClientAccount:Integer;
    KeySession:Integer;
    IsAdmin:boolean;
    function CheckData:boolean;
    function EditClientAccount(TypeChange:SmallInt):Integer;
    procedure NormIntakeNewrecord(IdInput, KodInput:Integer);
  public
    { Public declarations }
    ClientEditResult:Variant;
    constructor Create(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; InputFilter:Variant; ModeEdit:Smallint; IdClientIn:Integer; IsAdm:boolean);reintroduce;
  end;

var
  frmClientEdit: TfrmClientEdit;

implementation

{$R *.dfm}

uses BsClient, BsGetInput;

constructor TfrmClientEdit.Create(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; InputFilter:Variant; ModeEdit:Smallint; IdClientIn:Integer; IsAdm:boolean);
var BIniLanguage:Byte;
    i:SmallInt;
begin
  try
    inherited Create(AOwner);
    Self.IsAdmin:=IsAdm;
    //if not NormIntakeData.Active then NormIntakeData.Open;
    BIniLanguage:=uCommon_Funcs.bsLanguageIndex();
    btnCancel.Caption:=uConsts.bs_Cancel[BIniLanguage];
    btnOk.Caption:=uConsts.bs_Accept[BIniLanguage];
    ClientStatusDSet.Close;
    ClientStatusDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CLIENT_ACCOUNT_STATUS_SEL';
    ClientStatusDSet.Open;
    FlatStatusDSet.Close;
    FlatStatusDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FLAT_STATUS_SEL';
    FlatStatusDSet.Open;
    if VarArrayDimCount(InputFilter)>0 then
    begin
       IdRootRegion:=InputFilter[0];
       IdCustServ:=InputFilter[1];
    end;
    MainDbHandle:=DbHandle;
    WaterInputEdit.Text:='';
    WaterOutputEdit.Text:='';
    NormInakeEdit.Text:='';
    ClientModeEdit:=ModeEdit;
    IdClientAccount:=IdClientIn;
    ClientEditWriteTrans.StartTransaction;
    ClientEditProc.StoredProcName:='PUB_GET_ID_BY_GEN';
    ClientEditProc.Prepare;
    ClientEditProc.ParamByName('GENERATOR_NAME').AsString:='GEN_BS_NUM_SERVICE_BUFF_ID';
    ClientEditProc.ParamByName('STEP').AsShort:=1;
    ClientEditProc.ExecProc;
    KeySession:=ClientEditProc.FieldByName('RET_VALUE').AsInteger;
    ClientEditWriteTrans.Commit;
    DateEnd.Date:=EncodeDate(9999, 12, 31);
    if ClientModeEdit<>0 then
    begin
       if GetClientAccountInfo.Active then GetClientAccountInfo.Close;
       GetClientAccountInfo.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CLIENT_ACCOUNT_SEL_BY_ID(:ID_CLIENT_ACCOUNT)';
       GetClientAccountInfo.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=IdClientIn;
       GetClientAccountInfo.Open;
       if FamDSet.Active then FamDSet.Close;
       FamDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FIO_BY_ID(:ID_CLIENT_ACCOUNT, :RADIO_BTN)';
       FamDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=IdClientIn;
       FamDSet.ParamByName('RADIO_BTN').AsShort:=0;
       FamDSet.Open;
       FamiliyaBox.EditValue:=FamDSet['OUT_STR'];
       if ImyaDSet.Active then ImyaDSet.Close;
       ImyaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FIO_BY_ID(:ID_CLIENT_ACCOUNT, :RADIO_BTN)';
       ImyaDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=IdClientIn;
       ImyaDSet.ParamByName('RADIO_BTN').AsShort:=1;
       ImyaDSet.Open;
       ImyaBox.EditValue:=ImyaDSet['OUT_STR'];
       if PatrDSet.Active then PatrDSet.Close;
       PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FIO_BY_ID(:ID_CLIENT_ACCOUNT, :RADIO_BTN)';
       PatrDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=IdClientIn;
       PatrDSet.ParamByName('RADIO_BTN').AsShort:=2;
       PatrDSet.Open;
       PatronomycBox.EditValue:=PatrDSet['OUT_STR'];
       if DomDSet.Active then DomDSet.Close;
       DomDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DISCOUNT_OBJECT_SEL(:ID_DISCOUNT_OBJECT)';
       DomDSet.ParamByName('ID_DISCOUNT_OBJECT').AsInteger:=GetClientAccountInfo['ID_DISCOUNT_OBJECT'];
       DomDSet.Open;
       DomBox.EditValue:=GetClientAccountInfo['ID_DISCOUNT_OBJECT'];
       if not VarIsNull(GetClientAccountInfo['NUM_FLAT']) then FlatEdit.Text:=GetClientAccountInfo['NUM_FLAT'];
       ClientAccountEdit.Text:=GetClientAccountInfo['CLIENT_ACCOUNT'];
       KodMachine:=GetClientAccountInfo['KOD_MACHINE'];
       if not VarIsNull(GetClientAccountInfo['DATE_BIRTH']) then BirthDate.Date:=GetClientAccountInfo['DATE_BIRTH'];
       if not VarIsNull(GetClientAccountInfo['TIN_CLIENT']) then InnEdit.Text:=GetClientAccountInfo['TIN_CLIENT'];
       if not VarIsNull(GetClientAccountInfo['CLIENT_PHONE']) then PhoneEdit.Text:=GetClientAccountInfo['CLIENT_PHONE'];
       if not VarIsNull(GetClientAccountInfo['DATE_BEG']) then DateBeg.Date:=GetClientAccountInfo['DATE_BEG'];
       if not VarIsNull(GetClientAccountInfo['DATE_END']) then DateEnd.Date:=GetClientAccountInfo['DATE_END'];
       if not VarIsNull(GetClientAccountInfo['NUM_TENANTS']) then TenantsEdit.Text:=IntToStr(GetClientAccountInfo['NUM_TENANTS']);
       StatusFlatBox.EditValue:=GetClientAccountInfo['ID_FLAT_STATUS'];
       if CustomServiceDSet.Active then CustomServiceDSet.Close;
       CustomServiceDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
       CustomServiceDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=GetClientAccountInfo['ID_CUSTOMER_SERVICE'];
       CustomServiceDSet.Open;
       CustomServiceBox.EditValue:=GetClientAccountInfo['ID_CUSTOMER_SERVICE'];
       if ServiceDSet.Active then ServiceDSet.Close;
       ServiceDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_SERVICE_BY_ACCOUNT(:KOD_MACHINE, :ACT_DATE)';
       ServiceDSet.ParamByName('KOD_MACHINE').AsInteger:=KodMachine;
       ServiceDSet.ParamByName('ACT_DATE').AsDate:=Date;
       ServiceDSet.Open;
       ServiceDSet.FetchAll;
       ServiceDSet.First;
       if not VarIsNull(ServiceDSet['DATE_BEG']) then PeriodBeg.Date:=ServiceDSet['DATE_BEG'];
       if not VarIsNull(ServiceDSet['DATE_END']) then PeriodEnd.Date:=ServiceDSet['DATE_END'];
       for i:=0 to ServiceDSet.RecordCount-1 do
       begin
          NormIntakeData.Insert;
          NormIntakeData.FieldByName('KOD_INPUT').AsInteger:=StrToInt(ServiceDSet['KOD_INPUT']);
          NormIntakeData.FieldByName('IS_CHECK').AsInteger:=1;
          NormIntakeData.FieldByName('NAME_SERVICE').AsString:=ServiceDSet['NAME_SERVICE'];
          NormIntakeData.FieldByName('COUNT_SERVICE').AsInteger:=ServiceDSet['NUM_SERVICE'];
          NormIntakeData.FieldByName('KOD_NORM').AsString:=ServiceDSet['KOD_NORM_INTAKE'];
          NormIntakeData.FieldByName('NAME_NORM').AsString:=ServiceDSet['NAME_NORM_INTAKE'];
          NormIntakeData.FieldByName('ID_SERVICE').AsInteger:=ServiceDSet['ID_SERVICE'];
          NormIntakeData.FieldByName('ID_NORM').AsInteger:=ServiceDSet['ID_NORM_INTAKE'];
          NormIntakeData.FieldByName('WATER_INPUT').AsFloat:=ServiceDSet['NORN_WATER_INPUT'];
          NormIntakeData.FieldByName('WATER_OUTPUT').AsFloat:=ServiceDSet['NORN_WATER_OUT'];
          NormIntakeData.FieldByName('UNIT_MEASURE').AsString:=ServiceDSet['UNIT_MEASURE'];
          NormIntakeData.FieldByName('DISPLAY_ORDER').AsInteger:=ServiceDSet['DISPLAY_ORDER'];
          NormIntakeData.FieldByName('ID_INPUT').AsInteger:=ServiceDSet['ID_INPUT'];
          NormIntakeData.Post;
          ServiceDSet.Next;
       end;
       if ModeEdit in [1, 2] then
       begin
          btnAddInput.Enabled:=False;
          btnDelInput.Enabled:=False;
          NormIntakeGridView.OptionsData.Editing:=False;
          if ModeEdit=2 then
          begin
             pnlComponent.Height:=225;
             lblDateEnd.Top:=28;
             lblDateBeg.Top:=5;
             lblDateEnd.Visible:=True;
             DateBeg.Top:=5;
             DateEnd.Top:=28;
             DateEnd.Visible:=True;
             btnOk.Top:=16;
             btnCancel.Top:=16;
          end;
       end
       else
       begin
          FamiliyaBox.Enabled:=False;
          ImyaBox.Enabled:=False;
          PatronomycBox.Enabled:=False;
          ClientAccountEdit.Enabled:=False;
          PhoneEdit.Enabled:=False;
          BirthDate.Enabled:=False;
          InnEdit.Enabled:=False;
          DomBox.Enabled:=False;
          FlatEdit.Enabled:=False;
          TenantsEdit.Enabled:=False;
          StatusFlatBox.Enabled:=False;
          CustomServiceBox.Enabled:=False;
          DateBeg.Enabled:=False;
          PeriodBeg.Visible:=True;
          lblPeiodBeg.Visible:=True;
          PeriodEnd.Visible:=not (ModeEdit=3);
          lblPeriodEnd.Visible:=PeriodEnd.Visible;
       end;
    end;
  except on E:Exception
         do bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
  end;
end;

function TfrmClientEdit.CheckData:Boolean;
begin
   Result:=True;
   if FamiliyaBox.EditText='' then
   begin
      Result:=False;
      FamiliyaBox.Style.Color:=$00DDBBFF;
      FamiliyaBox.SetFocus;
      bsShowMessage('Увага!', 'Ви не заповнили поле "Прізвище"!', mtInformation, [mbOK]);
   end;

   if ImyaBox.EditText='' then
   begin
      Result:=False;
      ImyaBox.Style.Color:=$00DDBBFF;
      ImyaBox.SetFocus;
      bsShowMessage('Увага!', 'Ви не заповнили поле "Ім''я"!', mtInformation, [mbOK]);
   end;

   if PatronomycBox.EditText='' then
   begin
      Result:=False;
      PatronomycBox.Style.Color:=$00DDBBFF;
      PatronomycBox.SetFocus;
      bsShowMessage('Увага!', 'Ви не заповнили поле "По батькові"!', mtInformation, [mbOK]);
   end;

   if ClientAccountEdit.Text='' then
   begin
      Result:=False;
      ClientAccountEdit.Style.Color:=$00DDBBFF;
      ClientAccountEdit.SetFocus;
      bsShowMessage('Увага!', 'Ви не заповнили поле "Особовий рахунок"!', mtInformation, [mbOK]);
   end;

   if VarIsNull(DomBox.EditValue) then
   begin
      Result:=False;
      DomBox.Style.Color:=$00DDBBFF;
      DomBox.SetFocus;
      bsShowMessage('Увага!', 'Ви не обрали обліковий об''єкт "Дом"!', mtInformation, [mbOK]);
   end;

   {if FlatEdit.Text='' then
   begin
      Result:=False;
      FlatEdit.Style.Color:=$00DDBBFF;
      FlatEdit.SetFocus;
      bsShowMessage('Увага!', 'Ви не заповнили поле "Квартира"!', mtInformation, [mbOK]);
   end; }

   if TenantsEdit.Text='' then
   begin
      Result:=False;
      TenantsEdit.Style.Color:=$00DDBBFF;
      TenantsEdit.SetFocus;
      bsShowMessage('Увага!', 'Ви не заповнили поле "Мешканці"!', mtInformation, [mbOK]);
   end;

   if VarIsNull(StatusFlatBox.EditValue) then
   begin
      Result:=False;
      StatusFlatBox.Style.Color:=$00DDBBFF;
      StatusFlatBox.SetFocus;
      bsShowMessage('Увага!', 'Ви не обрали "Статус квартири"!', mtInformation, [mbOK]);
   end;

   if VarIsNull(CustomServiceBox.EditValue) then
   begin
      Result:=False;
      CustomServiceBox.Style.Color:=$00DDBBFF;
      CustomServiceBox.SetFocus;
      bsShowMessage('Увага!', 'Ви не обрали "Обслуговуючу організацію"!', mtInformation, [mbOK]);
   end;

   if DateBeg.Text='' then
   begin
      Result:=False;
      DateBeg.Style.Color:=$00DDBBFF;
      DateBeg.SetFocus;
      bsShowMessage('Увага!', 'Ви не заповнили поле "Діє з"!', mtInformation, [mbOK]);
   end;

   if NormIntakeData.IsEmpty then
   begin
      Result:=False;
      bsShowMessage('Увага!', 'Ви не сформували список послуг!', mtInformation, [mbOK]);
   end;

   if Result then
   begin
      Result:=False;
      while not NormIntakeData.Eof do
      begin
         if NormIntakeData.FieldByName('IS_CHECK').AsInteger=1 then
         begin
            Result:=True;
            break;
         end
         else NormIntakeData.Next;
      end;
      
      if not Result then
      begin
         if bsShowMessage('Увага!', 'Ви не обрали для особового рахунку жодної послуги! Продовжити збереження?', mtInformation, [mbYes, mbNo])=mrNo then Exit
         else Result:=True;
      end;
   end;

   if ClientModeEdit=2 then
   begin
      if DateBeg.Date>DateEnd.Date then
      begin
         Result:=False;
         bsShowMessage('Увага!', 'Дата початку не може бути більше дати кінця!', mtInformation, [mbOK]);
      end;
   end
   else if ClientModeEdit=4 then
        begin
           if PeriodBeg.Date>PeriodEnd.Date then
           begin
              Result:=False;
              bsShowMessage('Увага!', 'Дата початку не може бути більше дати кінця!', mtInformation, [mbOK]);
           end;
        end;
end;

procedure TfrmClientEdit.btnCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

function TfrmClientEdit.NewClientAccount:Integer;
var MachineKod:Integer;
    i:Smallint;
begin
    ClientEditWriteTrans.StartTransaction;
    ClientEditProc.StoredProcName:='BS_CLIENT_ACCOUNT_INS';
    ClientEditProc.Prepare;
    if ClientAccountEdit.Text='' then ClientEditProc.ParamByName('CLIENT_ACCOUNT').Value:=null
    else ClientEditProc.ParamByName('CLIENT_ACCOUNT').AsInteger:=StrToInt(ClientAccountEdit.Text);
    ClientEditProc.ParamByName('SURNAME_CLIENT').AsString:=FamiliyaBox.EditText;
    ClientEditProc.ParamByName('FIRSTNAME_CLIENT').AsString:=ImyaBox.EditText;
    ClientEditProc.ParamByName('SECONDNAME_CLIENT').AsString:=PatronomycBox.EditText;
    ClientEditProc.ParamByName('TIN_CLIENT').AsString:=InnEdit.Text;
    ClientEditProc.ParamByName('ID_DISCOUNT_OBJECT').AsInteger:=DomBox.EditValue;
    ClientEditProc.ParamByName('NUM_FLAT').AsString:=FlatEdit.Text;
    ClientEditProc.ParamByName('NUM_TENANTS').AsInteger:=StrToInt(TenantsEdit.Text);
    ClientEditProc.ParamByName('ID_STATUS_CLIENT_ACCOUNT').AsInteger:=1;
    ClientEditProc.ParamByName('ID_CUSTOMER_SERVICE').AsInteger:=CustomServiceBox.EditValue;
    ClientEditProc.ParamByName('DATE_BEG').AsDate:=DateBeg.Date;
    ClientEditProc.ParamByName('DATE_END').AsDate:=DateEnd.Date;
    ClientEditProc.ParamByName('TYPE_CHANGE').AsShort:=0;
    ClientEditProc.ParamByName('FLAG_CH_NUM_TENANTS').AsShort:=0;
    ClientEditProc.ParamByName('FLAG_CH_SERVICE').AsShort:=0;
    if BirthDate.Text='' then ClientEditProc.ParamByName('DATE_BIRTH').Value:=null
    else ClientEditProc.ParamByName('DATE_BIRTH').AsDate:=BirthDate.Date;
    ClientEditProc.ParamByName('CLIENT_PHONE').AsString:=PhoneEdit.Text;
    ClientEditProc.ParamByName('ID_FLAT_STATUS').AsShort:=StatusFlatBox.EditValue;
    ClientEditProc.ParamByName('KOD_MACHINE_IN').Value:=null;
    try
       ClientEditProc.ExecProc;
       Result:=ClientEditProc.FieldByName('ID_CLIENT_ACCOUNT').AsInteger;
       MachineKod:=ClientEditProc.FieldByName('KOD_MACHINE').AsInteger;
       NormIntakeData.First;
       for i:=0 to NormIntakeData.RecordCount-1 do
       begin
          if NormIntakeData.FieldByName('IS_CHECK').AsInteger=0 then
          begin
             NormIntakeData.Next;
          end
          else
          begin
              ClientEditProc.StoredProcName:='BS_NUM_SERVICE_BUFF_FILL';
              ClientEditProc.Prepare;
              ClientEditProc.ParamByName('KEY_SESSION').AsInteger:=KeySession;
              ClientEditProc.ParamByName('ID_INPUT').AsInteger:=NormIntakeData['ID_INPUT'];
              ClientEditProc.ParamByName('ID_NORM_INTAKE').AsInteger:=NormIntakeData['ID_NORM'];
              ClientEditProc.ParamByName('NUM_SERVICE').AsShort:=NormIntakeData['COUNT_SERVICE'];
              ClientEditProc.ExecProc;
              NormIntakeData.Next;
          end;
       end;
       ClientEditProc.StoredProcName:='BS_GROUP_SERVICE_ACCOUNT_FILL';
       ClientEditProc.Prepare;
       ClientEditProc.ParamByName('KEY_SESSION').AsInteger:=KeySession;
       ClientEditProc.ParamByName('KOD_MACHINE').AsInteger:=MachineKod;
       ClientEditProc.ParamByName('DATE_BEG').AsDate:=DateBeg.Date;
       ClientEditProc.ParamByName('DATE_END').AsDate:=DateEnd.Date;
       ClientEditProc.ParamByName('TYPE_CHANGE').AsShort:=0;
       ClientEditProc.ExecProc;
       ClientEditWriteTrans.Commit;
    except On E:Exception
           do begin
                 bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
                 Result:=-1;
                 ClientEditWriteTrans.Rollback;
           end;
    end;
end;

function TfrmClientEdit.EditClientAccount(TypeChange:SmallInt):Integer;
begin
    ClientEditWriteTrans.StartTransaction;
    ClientEditProc.StoredProcName:='BS_CLIENT_ACCOUNT_UPD';
    ClientEditProc.Prepare;
    //Showmessage(inttostr(IdClientAccount));
    ClientEditProc.ParamByName('ID_CLIENT_ACCOUNT').asInteger:=IdClientAccount;
    ClientEditProc.ParamByName('KOD_MACHINE').AsInteger:=KodMachine;
    if ClientAccountEdit.Text='' then ClientEditProc.ParamByName('CLIENT_ACCOUNT').Value:=null
    else ClientEditProc.ParamByName('CLIENT_ACCOUNT').AsInteger:=StrToInt(ClientAccountEdit.Text);
    ClientEditProc.ParamByName('SURNAME_CLIENT').AsString:=FamiliyaBox.EditText;
    ClientEditProc.ParamByName('FIRSTNAME_CLIENT').AsString:=ImyaBox.EditText;
    ClientEditProc.ParamByName('SECONDNAME_CLIENT').AsString:=PatronomycBox.EditText;
    ClientEditProc.ParamByName('TIN_CLIENT').AsString:=InnEdit.Text;
    ClientEditProc.ParamByName('ID_DISCOUNT_OBJECT').AsInteger:=DomBox.EditValue;
    ClientEditProc.ParamByName('NUM_FLAT').AsString:=FlatEdit.Text;
    ClientEditProc.ParamByName('NUM_TENANTS').AsInteger:=StrToInt(TenantsEdit.Text);
    ClientEditProc.ParamByName('ID_STATUS_CLIENT_ACCOUNT').AsInteger:=1;
    ClientEditProc.ParamByName('ID_CUSTOMER_SERVICE').AsInteger:=CustomServiceBox.EditValue;
    ClientEditProc.ParamByName('DATE_BEG').AsDate:=DateBeg.Date;
    ClientEditProc.ParamByName('DATE_END').AsDate:=DateEnd.Date;
    ClientEditProc.ParamByName('TYPE_CHANGE').AsShort:=TypeChange;
    ClientEditProc.ParamByName('FLAG_CH_NUM_TENANTS').AsShort:=0;
    ClientEditProc.ParamByName('FLAG_CH_SERVICE').AsShort:=0;
    if BirthDate.Text='' then ClientEditProc.ParamByName('DATE_BIRTH').Value:=null
    else ClientEditProc.ParamByName('DATE_BIRTH').AsDate:=BirthDate.Date;
    ClientEditProc.ParamByName('CLIENT_PHONE').AsString:=PhoneEdit.Text;
    ClientEditProc.ParamByName('ID_FLAT_STATUS').AsShort:=StatusFlatBox.EditValue;
    try
       ClientEditProc.ExecProc;
       Result:=ClientEditProc.FieldByName('RET_VALUE').AsInteger;
       ClientEditWriteTrans.Commit;
    except On E:Exception
           do begin
                 bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
                 Result:=-1;
                 ClientEditWriteTrans.Rollback;
           end;
    end;
end;

function TfrmClientEdit.EditClientNormIntake(TypeChange:SmallInt):Integer;
var i:Integer;
begin
  try
     ClientEditWriteTrans.StartTransaction;
     NormIntakeData.First;
     for i:=0 to NormIntakeData.RecordCount-1 do
     begin
        if NormIntakeData.FieldByName('IS_CHECK').AsInteger=0 then
        begin
           NormIntakeData.Next;
        end
        else
        begin
            ClientEditProc.StoredProcName:='BS_NUM_SERVICE_BUFF_FILL';
            ClientEditProc.Prepare;
            ClientEditProc.ParamByName('KEY_SESSION').AsInteger:=KeySession;
            ClientEditProc.ParamByName('ID_INPUT').AsInteger:=NormIntakeData['ID_INPUT'];
            ClientEditProc.ParamByName('ID_NORM_INTAKE').AsInteger:=NormIntakeData['ID_NORM'];
            ClientEditProc.ParamByName('NUM_SERVICE').AsShort:=NormIntakeData['COUNT_SERVICE'];
            ClientEditProc.ExecProc;
            NormIntakeData.Next;
        end;
     end;
     ClientEditProc.StoredProcName:='BS_GROUP_SERVICE_ACCOUNT_EDIT';
     ClientEditProc.Prepare;
     ClientEditProc.ParamByName('KEY_SESSION').AsInteger:=KeySession;
     ClientEditProc.ParamByName('KOD_MACHINE').AsInteger:=KodMachine;
     ClientEditProc.ParamByName('DATE_BEG').AsDate:=PeriodBeg.Date;
     ClientEditProc.ParamByName('DATE_END').AsDate:=PeriodEnd.Date;
     ClientEditProc.ParamByName('TYPE_CHANGE').AsShort:=TypeChange;
     ClientEditProc.ExecProc;
     ClientEditWriteTrans.Commit;
     Result:=IdClientAccount;
  except on E:Exception
         do begin
               bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
               Result:=-1;
               ClientEditWriteTrans.Rollback;
         end;
  end;
end;

procedure TfrmClientEdit.btnOkClick(Sender: TObject);
begin
    if not CheckData then Exit;
    case ClientModeEdit of
       0: ClientEditResult:=NewClientAccount;
       1: ClientEditResult:=EditClientAccount(0);
       2: ClientEditResult:=EditClientAccount(1);
       3: ClientEditResult:=EditClientNormIntake(0);
       4: ClientEditResult:=EditClientNormIntake(1);
    end;
    ModalResult:=mrOk;
end;

procedure TfrmClientEdit.TimerEditTimer(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
   case ContextInputType of
      0:
      begin
         FamDSet.Close;
         FamDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
         FamDSet.ParamByName('FILTER_STR').AsString:=FamiliyaBox.EditText;
         FamDSet.ParamByName('RADIO_BTN').AsShort:=0;
         FamDSet.ParamByName('IS_ADD').AsShort:=1;
         FamDSet.Open;
         if not FamDSet.IsEmpty then
         begin
            FamiliyaBox.DroppedDown:=True;
         end;
      end;
      1:
      begin
         ImyaDSet.Close;
         ImyaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
         ImyaDSet.ParamByName('FILTER_STR').AsString:=ImyaBox.EditText;
         ImyaDSet.ParamByName('RADIO_BTN').AsShort:=1;
         ImyaDSet.ParamByName('IS_ADD').AsShort:=1;
         ImyaDSet.Open;
         if not ImyaDSet.IsEmpty then
         begin
            ImyaBox.DroppedDown:=True;
         end;
      end;
      2:
      begin
         PatrDSet.Close;
         PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
         PatrDSet.ParamByName('FILTER_STR').AsString:=PatronomycBox.EditText;
         PatrDSet.ParamByName('RADIO_BTN').AsShort:=2;
         PatrDSet.ParamByName('IS_ADD').AsShort:=1;
         PatrDSet.Open;
         if not PatrDSet.IsEmpty then
         begin
            PatronomycBox.DroppedDown:=True;
         end;
      end;
      3:
      begin
         DomDSet.Close;
         DomDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_DIS_OBJECT_BY_STREET(:FILTER_STR)';
         DomDSet.ParamByName('FILTER_STR').AsString:=DomBox.EditText;
         DomDSet.Open;
         if not DomDSet.IsEmpty then
         begin
            DomBox.DroppedDown:=True;
         end;
      end;
      4:
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
      5:
      begin
         if GetNumClient.Active then GetNumClient.Close;
         GetNumClient.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FREE_NUM_CLIENT_ACCOUNT(:NUM_IN, :ACT_DATE)';
         GetNumClient.ParamByName('NUM_IN').AsInteger:=StrToInt(ClientAccountEdit.EditText);
         GetNumClient.ParamByName('ACT_DATE').AsDate:=Date;
         GetNumClient.Open;
         if not GetNumClient.IsEmpty then
         begin
            GetNumClient.FetchAll;
            GetNumClient.First;
            ClientAccountEdit.Properties.Items.Clear;
            while not GetNumClient.Eof do
            begin
               ClientAccountEdit.Properties.Items.Add(IntToStr(GetNumClient['CLIENT_ACCOUNT']));
               GetNumClient.Next;
            end;
            if GetNumClient['IS_USED']=1 then
            begin
               ClientAccountEdit.Text:=ClientAccountEdit.Properties.Items.Strings[0];
            end;
            ClientAccountEdit.DroppedDown:=True;
         end;
      end;
   end;
end;

procedure TfrmClientEdit.FamiliyaBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ContextInputType:=0;
    if FamiliyaBox.EditText='' then
       if FamDSet.Active then FamDSet.Close;
    TimerEdit.Enabled:=not ((FamiliyaBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmClientEdit.FamiliyaBoxEnter(Sender: TObject);
begin
   TimerEdit.Interval:=500;
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.FamiliyaBoxExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.ImyaBoxEnter(Sender: TObject);
begin
   TimerEdit.Interval:=500;
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.ImyaBoxExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.ImyaBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ContextInputType:=1;
    if ImyaBox.EditText='' then
       if ImyaDSet.Active then ImyaDSet.Close;
    TimerEdit.Enabled:=not ((ImyaBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmClientEdit.PatronomycBoxEnter(Sender: TObject);
begin
   TimerEdit.Interval:=1000;
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.PatronomycBoxExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.PatronomycBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ContextInputType:=2;
    if PatronomycBox.EditText='' then
       if PatrDSet.Active then PatrDSet.Close;
    TimerEdit.Enabled:=not ((PatronomycBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmClientEdit.RegionBoxEnter(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.RegionBoxExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.CityAreaBoxEnter(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.CityAreaBoxExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.DomBoxEnter(Sender: TObject);
begin
   TimerEdit.Interval:=2000;
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.DomBoxExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.DomBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblStreetClick(Sender)
   else
   begin
      ContextInputType:=3;
      if DomBox.EditText='' then
         if DomDSet.Active then DomDSet.Close;
      TimerEdit.Enabled:=not ((DomBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
   end;
end;

procedure TfrmClientEdit.lblStreetClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  DisObject:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= MainDbHandle;
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
        HouseEdit.Text:=DisObject[8];
        KorpusEdit.Text:=DisObject[9];
    end;
  except on E:exception
         do bsShowMessage('Увага!', e.message, mtInformation, [mbOK]);
  end;
end;

procedure TfrmClientEdit.lblOrganizationClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= MainDbHandle;
    AParameter.Formstyle:=fsNormal;
    AParameter.ID_Locate:=IdCustServ;
    AParameter.WaitPakageOwner:=self;
    Res:=RunFunctionFromPackage(AParameter, 'BillingSystem\BsGroupObjects.bpl','ShowObjectsGroup');
    AParameter.Free;

    if VarArrayDimCount(Res)>0 then
    begin
       if CustomServiceDSet.Active then CustomServiceDSet.Close;
       CustomServiceDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
       CustomServiceDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=Res[0];
       CustomServiceDSet.Open;
       CustomServiceBox.EditValue:=Res[0];
    end;
  except on E:Exception
         do bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
  end;

end;

procedure TfrmClientEdit.lblInputMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmClientEdit.lblInputMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmClientEdit.lblStreetMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmClientEdit.lblStreetMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmClientEdit.lblOrganizationMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmClientEdit.FormShow(Sender: TObject);
begin
   Self.Top:=Round(Application.MainForm.Height/2)-Round(Self.Height/2);
   Self.Left:=Round(Application.MainForm.Width/2)-Round(Self.Width/2);
end;

procedure TfrmClientEdit.NormIntakeNewrecord(IdInput, KodInput:Integer);
begin
   NormIntakeData.Insert;
   NormIntakeData.FieldByName('KOD_INPUT').AsInteger:=KodInput;
   NormIntakeData.FieldByName('IS_CHECK').AsInteger:=0;
   NormIntakeData.FieldByName('NAME_SERVICE').AsString:=ServiceDSet['Name_Service'];
   NormIntakeData.FieldByName('COUNT_SERVICE').AsInteger:=0;
   NormIntakeData.FieldByName('KOD_NORM').AsString:=ServiceDSet['Kod_Norm'];
   NormIntakeData.FieldByName('NAME_NORM').AsString:=ServiceDSet['Name_Norm'];
   NormIntakeData.FieldByName('ID_SERVICE').AsInteger:=ServiceDSet['ID_SERVICE'];
   NormIntakeData.FieldByName('ID_NORM').AsInteger:=ServiceDSet['Id_Norm_Intake'];
   NormIntakeData.FieldByName('WATER_INPUT').AsFloat:=ServiceDSet['Water_Input'];
   NormIntakeData.FieldByName('WATER_OUTPUT').AsFloat:=ServiceDSet['Water_Output'];
   NormIntakeData.FieldByName('UNIT_MEASURE').AsString:=ServiceDSet['Unit_Measure'];
   NormIntakeData.FieldByName('DISPLAY_ORDER').AsInteger:=ServiceDSet['Display_Order'];
   NormIntakeData.FieldByName('ID_INPUT').AsInteger:=IdInput;
   NormIntakeData.Post;
end;

procedure TfrmClientEdit.btnAddInputClick(Sender: TObject);
var i:SmallInt;
    frm:TfrmGetInput;
begin
   frm:=TfrmGetInput.Create(Self, IsAdmin);
   frm.DbHandle:=MainDbHandle;
   frm.IdDisObject:=DomBox.EditValue;
   if frm.ShowModal=mrOk then
   begin
      //if not NormIntakeData.Active then NormIntakeData.Open;
      if ServiceDSet.Active then ServiceDSet.Close;
      ServiceDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SERVICE_SEL';
      ServiceDSet.Open;
      ServiceDSet.FetchAll;
      ServiceDSet.First;
      if ClientModeEdit=0 then
      begin
          if ((NormIntakeData.Locate('KOD_INPUT', StrToInt(frm.InputBox.EditText), []))) then
          begin
             bsShowMessage('Увага!', 'Ввод з кодом "'+frm.InputBox.EditText+'" вжє додан!', mtInformation, [mbOK]);
             NormIntakeData.Locate('KOD_INPUT', StrToInt(frm.InputBox.EditText), []);
          end
          else
          begin
              for i:=0 to ServiceDSet.RecordCount-1 do
              begin
                 NormIntakeNewrecord(frm.InputBox.EditValue, StrToInt(frm.InputBox.EditText));
                 ServiceDSet.Next;
              end;
          end;
      end
      else
      begin
          for i:=0 to ServiceDSet.RecordCount-1 do
          begin
             if (NormIntakeData.Locate('ID_INPUT;ID_SERVICE', VarArrayOf([frm.InputBox.EditValue,ServiceDSet['ID_SERVICE']]), []))
             then ServiceDSet.Next
             else
             begin
                NormIntakeNewrecord(frm.InputBox.EditValue, StrToInt(frm.InputBox.EditText));
                ServiceDSet.Next;
             end;
          end;
      end;
   end;
   frm.Free;
end;

procedure TfrmClientEdit.NormIntakeGridViewDblClick(Sender: TObject);
begin
  if ClientModeEdit in [1, 2] then Exit;
  //if not NormIntakeData.Active then NormIntakeData.Open;
  NormIntakeData.Edit;
  NormIntakeData.FieldByName('IS_CHECK').AsInteger:=1-NormIntakeData.FieldByName('IS_CHECK').AsInteger;
  NormIntakeData.Post;
end;

procedure TfrmClientEdit.ColumnKodNormPropertiesPopup(Sender: TObject);
begin
   if not KodNormDSet.IsEmpty then
   begin
      TcxComboBoxProperties(ColumnKodNorm.Properties).ImmediateDropDown:=True;
   end;
end;

procedure TfrmClientEdit.NormIntakeGridViewEditing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
var i:Smallint;
begin
   if NormIntakeGridView.Controller.FocusedColumn.Index=5 then
   begin
      TcxComboBoxProperties(ColumnKodNorm.Properties).Items.Clear;
      if KodNormDSet.Active then KodNormDSet.Close;
      KodNormDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_NORM_BY_SERVICE(:ID_SERVICE)';
      KodNormDSet.ParamByName('ID_SERVICE').AsInteger:=NormIntakeData['ID_SERVICE'];
      KodNormDSet.Open;
      KodNormDSet.FetchAll;
      KodNormDSet.First;
      for i:=0 to KodNormDSet.RecordCount-1 do
      begin
         TcxComboBoxProperties(ColumnKodNorm.Properties).Items.Append(KodNormDSet['Kod_Norm_Intake']);
         KodNormDSet.Next;
      end;
   end;
end;

procedure TfrmClientEdit.ColumnKodNormPropertiesChange(Sender: TObject);
begin
   if GetNameNormByKod.Active then GetNameNormByKod.Close;
   GetNameNormByKod.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_NORM_INTAKE NI WHERE NI.KOD_NORM_INTAKE=:KOD_NORM';
   GetNameNormByKod.ParamByName('KOD_NORM').AsString:=NormIntakeData['KOD_NORM'];
   GetNameNormByKod.Open;
   if not GetNameNormByKod.IsEmpty then
   begin
      if not VarIsNull(GetNameNormByKod['NAME_NORM_INTAKE']) then
      NormIntakeData.FieldByName('NAME_NORM').AsString:=GetNameNormByKod['NAME_NORM_INTAKE'];
      if not VarIsNull(GetNameNormByKod['NORN_WATER_INPUT']) then
      NormIntakeData.FieldByName('WATER_INPUT').AsFloat:=GetNameNormByKod['NORN_WATER_INPUT'];
      if not VarIsNull(GetNameNormByKod['NORN_WATER_OUT']) then
      NormIntakeData.FieldByName('WATER_OUTPUT').AsFloat:=GetNameNormByKod['NORN_WATER_OUT'];
      if not VarIsNull(GetNameNormByKod['ID_NORM_INTAKE']) then
      NormIntakeData.FieldByName('ID_NORM').AsFloat:=GetNameNormByKod['ID_NORM_INTAKE'];
   end;
end;

procedure TfrmClientEdit.btnDelInputClick(Sender: TObject);
var KodInput:Integer;
begin
   KodInput:=NormIntakeData['KOD_INPUT'];
   if NormIntakeData.IsEmpty then Exit;
   if bsShowMessage('Увага!', 'Ви дійсно бажаєте видалити ввод "'+IntToStr(KodInput)+'" ?', mtConfirmation, [mbYes, mbNo])=mrNo then Exit;
   while NormIntakeData.Locate('KOD_INPUT', KodInput, []) do
   begin
      NormIntakeData.Delete;
   end;
end;

procedure TfrmClientEdit.ClientAccountEditKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ((Key in ['0'..'9']) or (Key=#8)) then ClientAccountEdit.Properties.ReadOnly:=false
   else ClientAccountEdit.Properties.ReadOnly:=True;
end;

procedure TfrmClientEdit.TenantsEditKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Key in ['0'..'9']) or (Key=#8)) then TenantsEdit.Properties.ReadOnly:=False
    else TenantsEdit.Properties.ReadOnly:=True;
end;

procedure TfrmClientEdit.DomBoxPropertiesChange(Sender: TObject);
begin
   HouseEdit.Text:=IntToStr(DomBox.Properties.ListColumns.Items[3].Field.AsInteger);
   KorpusEdit.Text:=DomBox.Properties.ListColumns.Items[4].Field.AsString;
   RegionEdit.Text:=DomBox.Properties.ListColumns.Items[1].Field.AsString;
   CityAreaEdit.Text:=DomBox.Properties.ListColumns.Items[2].Field.AsString;
   btnAddInput.Enabled:=not (DomBox.EditText='');
   btnDelInput.Enabled:=not (DomBox.EditText='');
end;

procedure TfrmClientEdit.CustomServiceBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblOrganizationClick(Sender)
   else
   begin
      ContextInputType:=4;
      if CustomServiceBox.EditText='' then
         if CustomServiceDSet.Active then CustomServiceDSet.Close;
      TimerEdit.Enabled:=not ((CustomServiceBox.EditText='') or (Key=VK_RETURN) or
                         (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
   end;
end;

procedure TfrmClientEdit.CustomServiceBoxClick(Sender: TObject);
begin
   TimerEdit.Interval:=2000;
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.CustomServiceBoxEnter(Sender: TObject);
begin
   TimerEdit.Interval:=2000;
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.CustomServiceBoxExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.DomBoxPropertiesInitPopup(Sender: TObject);
begin
   DomDSet.Close;
   DomDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_DIS_OBJECT_BY_STREET(:NAME_STREET_IN)';
   DomDSet.ParamByName('NAME_STREET_IN').AsString:=DomBox.EditText;
   DomDSet.Open;
end;

procedure TfrmClientEdit.CustomServiceBoxPropertiesInitPopup(
  Sender: TObject);
begin
   CustomServiceDSet.Close;
   CustomServiceDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_CUSTOM_SERVICE_FILTER(:FILTER_STR)';
   CustomServiceDSet.ParamByName('FILTER_STR').AsString:=CustomServiceBox.EditText;
   CustomServiceDSet.Open;
end;

procedure TfrmClientEdit.FamiliyaBoxPropertiesInitPopup(Sender: TObject);
begin
   if FamiliyaBox.EditText='' then
   begin
      FamDSet.Close;
      FamDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      FamDSet.ParamByName('FILTER_STR').AsString:=FamiliyaBox.EditText;
      FamDSet.ParamByName('RADIO_BTN').AsShort:=0;
      FamDSet.ParamByName('IS_ADD').AsShort:=1;
      FamDSet.Open;
   end;
end;

procedure TfrmClientEdit.ImyaBoxPropertiesInitPopup(Sender: TObject);
begin
   if ImyaBox.EditText='' then
   begin
      ImyaDSet.Close;
      ImyaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      ImyaDSet.ParamByName('FILTER_STR').AsString:=ImyaBox.EditText;
      ImyaDSet.ParamByName('RADIO_BTN').AsShort:=1;
      ImyaDSet.ParamByName('IS_ADD').AsShort:=1;
      ImyaDSet.Open;
   end;
end;

procedure TfrmClientEdit.PatronomycBoxPropertiesInitPopup(Sender: TObject);
begin
   if PatronomycBox.EditText='' then
   begin
      PatrDSet.Close;
      PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      PatrDSet.ParamByName('FILTER_STR').AsString:=PatronomycBox.EditText;
      PatrDSet.ParamByName('RADIO_BTN').AsShort:=2;
      PatrDSet.ParamByName('IS_ADD').AsShort:=1;
      PatrDSet.Open;
   end;
end;

procedure TfrmClientEdit.NormIntakeGridViewKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if ClientModeEdit in [1, 2] then Exit;
   if Key=VK_SPACE then NormIntakeGridViewDblClick(Sender);
end;

procedure TfrmClientEdit.lblOrganizationMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmClientEdit.ImyaBoxClick(Sender: TObject);
begin
   TimerEdit.Interval:=500;
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.FamiliyaBoxClick(Sender: TObject);
begin
   TimerEdit.Interval:=500;
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.PatronomycBoxClick(Sender: TObject);
begin
   TimerEdit.Interval:=500;
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.DomBoxClick(Sender: TObject);
begin
   TimerEdit.Interval:=2000;
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.NormIntakeGridViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if ((ssShift in Shift) and (Key=VK_F12)) then
   begin
      ShowDataSetInfo(NormIntakeData);
   end;
end;

procedure TfrmClientEdit.ClientAccountEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    ContextInputType:=5;
    if ClientAccountEdit.EditText='' then
       if GetNumClient.Active then GetNumClient.Close;
    TimerEdit.Enabled:=not ((ClientAccountEdit.EditText='') or (Key=VK_RETURN)
                            or (Key=Vk_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));  
end;

procedure TfrmClientEdit.ClientAccountEditClick(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.ClientAccountEditEnter(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

procedure TfrmClientEdit.ClientAccountEditExit(Sender: TObject);
begin
   TimerEdit.Enabled:=False;
end;

end.
