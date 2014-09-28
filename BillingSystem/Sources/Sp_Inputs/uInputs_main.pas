//******************************************************************************
// Проект "Биллинговая система"
// Справочник вводов
//******************************************************************************

unit uInputs_main;

interface

uses                      
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  uCommon_Funcs, uConsts, uInputs_DM, uInputs_AE, uCommon_Messages, uConsts_Messages,
  Menus, uCommon_Types, Placemnt, cxCheckBox, AccMGMT, cxCalendar,
  cxGroupBox, cxSplitter, cxLabel, cxCheckComboBox, cxDBCheckComboBox,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCurrencyEdit, ActnList, cxGridBandedTableView,
  cxGridDBBandedTableView, ExtCtrls, cxDBExtLookupComboBox, cxMRUEdit,
  cxBlobEdit, cxLookAndFeelPainters, StdCtrls, cxButtons, RxMemDS, uCommon_Loader,
  cxTL, cxInplaceContainer, cxDBTL, cxTLData, BsMemoFilter, FIBDataSet,
  pFIBDataSet, BsUnivSprav;


type
  TfrmInputs_Main = class(TForm)
    BarManager: TdxBarManager;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
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
    PopupMenu: TPopupMenu;
    AddPop: TMenuItem;
    EditPop: TMenuItem;
    DeletePop: TMenuItem;
    RefreshPop: TMenuItem;
    ExitPop: TMenuItem;
    bsFormStorage: TFormStorage;
    cxGroupBox2: TcxGroupBox;
    Box_Filter_Grid: TcxGroupBox;
    Box_Filter_Input: TcxGroupBox;
    Label_kod_input: TcxLabel;
    Label_parent_input: TcxLabel;
    Label_diam: TcxLabel;
    Label_percent_pay: TcxLabel;
    Label_engineer: TcxLabel;
    Label_employee_code: TcxLabel;
    GroupBox_Organization: TcxGroupBox;
    Label_kod: TcxLabel;
    Label_refine_location: TcxLabel;
    InputLocation: TcxTextEdit;
    Box_Input: TcxGroupBox;
    Splitter_Dom: TcxSplitter;
    Box_Dom: TcxGroupBox;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarDockControl1: TdxBarDockControl;
    Button_Filter: TdxBarLargeButton;
    Button_clear: TdxBarLargeButton;
    btnRedo: TdxBarLargeButton;
    ActionList1: TActionList;
    Action_active_filter: TAction;
    Grid_input: TcxGrid;
    Grid_inputDBView: TcxGridDBTableView;
    Grid_inputLevel: TcxGridLevel;
    BarEdit_n_var_filter: TdxBarEdit;
    btnUndo: TdxBarLargeButton;
    CheckBox_existence_accounts: TcxCheckBox;
    CheckBox_excess: TcxCheckBox;
    TimerEnter: TTimer;
    ActionUndo: TAction;
    Action_clear: TAction;
    KodInputBox: TcxLookupComboBox;
    ParentInputBox: TcxLookupComboBox;
    PercentPayBox: TcxLookupComboBox;
    TnEngineerBox: TcxLookupComboBox;
    KodCustServBox: TcxLookupComboBox;
    CustServBox: TcxLookupComboBox;
    Grid_inputColumn_kod_input: TcxGridDBColumn;
    Grid_inputColumn_diam: TcxGridDBColumn;
    Grid_inputColumn_loc_place: TcxGridDBColumn;
    box_accept: TcxGroupBox;
    Button_Ok: TcxButton;
    Button_Cancel: TcxButton;
    Grid_inputColumn_kod_parent: TcxGridDBColumn;
    Grid_inputColumn_date_close: TcxGridDBColumn;
    Label_delete: TcxLabel;
    PopupMenu_sign: TPopupMenu;
    pm_Equally: TMenuItem;
    pm_Less_Equal: TMenuItem;
    pm_Less: TMenuItem;
    pm_More: TMenuItem;
    pm_More_Equal: TMenuItem;
    pm_Not_Equal: TMenuItem;
    Label_sign_input: TcxLabel;
    Label_sign_diam: TcxLabel;
    Label_sign_pay: TcxLabel;
    Label_sign_name_org: TcxLabel;
    Label_sign_kod_org: TcxLabel;
    MenuAdd: TdxBarPopupMenu;
    btnAddParentInput: TdxBarButton;
    btnAddInput: TdxBarButton;
    Action_add_parent: TAction;
    Action_Edit: TAction;
    Action_Del: TAction;
    Action_select: TAction;
    Action_exit: TAction;
    Action_add_radicand: TAction;
    cxGroupBox1: TcxGroupBox;
    lblRegion: TcxLabel;
    RegionBox: TcxLookupComboBox;
    lblStreet: TcxLabel;
    TypeStreetBox: TcxLookupComboBox;
    StreetBox: TcxLookupComboBox;
    Label_home: TcxLabel;
    Label_flat: TcxLabel;
    KorpusEdit: TcxTextEdit;
    CityAreaBox: TcxLookupComboBox;
    lblCityArea: TcxLabel;
    Label_name: TcxLabel;
    lblCustomerService: TcxLabel;
    lblDom: TcxLabel;
    FioEngineerBox: TcxTextEdit;
    btnAddLink: TdxBarButton;
    TreeList_Inputs: TcxDBTreeList;
    TreeList_Inputs_kod: TcxDBTreeListColumn;
    Grid_inputColumn_percent_pay: TcxGridDBColumn;
    Grid_inputColumn_FIO_engineer: TcxGridDBColumn;
    Grid_inputColumn_employee_code: TcxGridDBColumn;
    Grid_inputColumn_kod_org: TcxGridDBColumn;
    Grid_inputColumn_name_org: TcxGridDBColumn;
    Grid_inputColumn_Region: TcxGridDBColumn;
    Grid_inputColumn_District: TcxGridDBColumn;
    Grid_inputColumn_type_street: TcxGridDBColumn;
    Grid_inputColumn_street: TcxGridDBColumn;
    Grid_inputColumn_House: TcxGridDBColumn;
    Grid_inputColumn_korpus: TcxGridDBColumn;
    Grid_inputColumn_date_beg: TcxGridDBColumn;
    Grid_inputColumn_Date_end: TcxGridDBColumn;
    MenuEdit: TdxBarPopupMenu;
    btnEditInput: TdxBarLargeButton;
    btnEditInputObject: TdxBarLargeButton;
    lblSingTypeCust: TcxLabel;
    TypeCustServBox: TcxLookupComboBox;
    cxLabel2: TcxLabel;
    HouseEdit: TcxTextEdit;
    DiameterEdit: TcxCurrencyEdit;
    btnMode: TdxBarLargeButton;
    FilterDS: TDataSource;
    FilterSet: TpFIBDataSet;
    btnHistory: TdxBarLargeButton;
    HistoryMenu: TdxBarPopupMenu;
    btnHistInput: TdxBarLargeButton;
    btnHistObject: TdxBarLargeButton;
    ActionRedo: TAction;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_selectClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure cxSplitter1AfterClose(Sender: TObject);
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Splitter_DomBeforeOpen(Sender: TObject;
      var AllowOpen: Boolean);
    procedure Splitter_DomBeforeClose(Sender: TObject;
      var AllowClose: Boolean);
    procedure Action_active_filterExecute(Sender: TObject);
    procedure Clear_filter_param;
    procedure Action_clearExecute(Sender: TObject);
    procedure Button_CancelClick(Sender: TObject);
    procedure Button_OkClick(Sender: TObject);
    procedure pm_EquallyClick(Sender: TObject);
    procedure pm_Less_EqualClick(Sender: TObject);
    procedure pm_LessClick(Sender: TObject);
    procedure pm_MoreClick(Sender: TObject);
    procedure pm_More_EqualClick(Sender: TObject);
    procedure pm_Not_EqualClick(Sender: TObject);
    procedure lblRegionClick(Sender: TObject);
    procedure lblCityAreaClick(Sender: TObject);
    procedure lblStreetClick(Sender: TObject);
    procedure lblDomClick(Sender: TObject);
    procedure Label_engineerClick(Sender: TObject);
    procedure lblCustomerServiceClick(Sender: TObject);
    procedure btnAddLinkClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure PM_Del_linkClick(Sender: TObject);
    procedure TreeList_InputsDblClick(Sender: TObject);
    procedure btnEditInputClick(Sender: TObject);
    procedure btnEditInputObjectClick(Sender: TObject);
    procedure KodInputBoxClick(Sender: TObject);
    procedure TimerEnterTimer(Sender: TObject);
    procedure RegionBoxClick(Sender: TObject);
    procedure RegionBoxEnter(Sender: TObject);
    procedure RegionBoxExit(Sender: TObject);
    procedure RegionBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RegionBoxPropertiesInitPopup(Sender: TObject);
    procedure CityAreaBoxPropertiesInitPopup(Sender: TObject);
    procedure CityAreaBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CityAreaBoxClick(Sender: TObject);
    procedure CityAreaBoxEnter(Sender: TObject);
    procedure CityAreaBoxExit(Sender: TObject);
    procedure TypeStreetBoxPropertiesInitPopup(Sender: TObject);
    procedure TypeStreetBoxClick(Sender: TObject);
    procedure TypeStreetBoxEnter(Sender: TObject);
    procedure TypeStreetBoxExit(Sender: TObject);
    procedure TypeStreetBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KodInputBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KodInputBoxEnter(Sender: TObject);
    procedure KodInputBoxExit(Sender: TObject);
    procedure KodInputBoxPropertiesInitPopup(Sender: TObject);
    procedure KodInputBoxPropertiesChange(Sender: TObject);
    procedure ParentInputBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ParentInputBoxClick(Sender: TObject);
    procedure ParentInputBoxEnter(Sender: TObject);
    procedure ParentInputBoxExit(Sender: TObject);
    procedure KodCustServBoxPropertiesInitPopup(Sender: TObject);
    procedure CustServBoxPropertiesInitPopup(Sender: TObject);
    procedure CustServBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KodCustServBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ParentInputBoxPropertiesInitPopup(Sender: TObject);
    procedure StreetBoxPropertiesInitPopup(Sender: TObject);
    procedure StreetBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StreetBoxClick(Sender: TObject);
    procedure StreetBoxEnter(Sender: TObject);
    procedure StreetBoxExit(Sender: TObject);
    procedure CustServBoxClick(Sender: TObject);
    procedure CustServBoxEnter(Sender: TObject);
    procedure CustServBoxExit(Sender: TObject);
    procedure KodCustServBoxExit(Sender: TObject);
    procedure KodCustServBoxEnter(Sender: TObject);
    procedure KodCustServBoxClick(Sender: TObject);
    procedure TnEngineerBoxClick(Sender: TObject);
    procedure TnEngineerBoxEnter(Sender: TObject);
    procedure TnEngineerBoxExit(Sender: TObject);
    procedure TnEngineerBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TnEngineerBoxPropertiesInitPopup(Sender: TObject);
    procedure StreetBoxPropertiesChange(Sender: TObject);
    procedure btnAddParentInputClick(Sender: TObject);
    procedure btnAddInputClick(Sender: TObject);
    procedure ParentInputBoxPropertiesChange(Sender: TObject);
    procedure Grid_inputDBViewDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure FilterSetEndScroll(DataSet: TDataSet);
    procedure btnHistInputClick(Sender: TObject);
    procedure btnHistObjectClick(Sender: TObject);
    procedure ActionUndoExecute(Sender: TObject);
    procedure ActionRedoExecute(Sender: TObject);
    procedure CustServBoxPropertiesChange(Sender: TObject);
    procedure KodCustServBoxPropertiesChange(Sender: TObject);
    procedure RegionBoxPropertiesChange(Sender: TObject);
    procedure CityAreaBoxPropertiesChange(Sender: TObject);
    procedure TypeStreetBoxPropertiesChange(Sender: TObject);
    procedure TnEngineerBoxPropertiesChange(Sender: TObject);
  private
    PLanguageIndex, ContextInputType: byte;
    DM : TInputs_DM;
    Kol_Filter_var : Integer;
    id_input, id_pinput, id_discount_obj: Variant;
    ID_GR_LIST_REGION_ROOT, ID_GR_LIST_CUST_SERV_ROOT, ID_GR_LIST_CHIEF_ENGINEER_ROOT : int64;
    id_user : Int64;
    is_Admin : Boolean;
    AddParentInput, AddInput, AddLink, UpdInput, UpdLink, IsBlockSprav, isSave: Boolean;
    Name_user : string;
    format : TFormatSettings;
    frmFilter : TBsMemoFilter;
    procedure FormIniLanguage;
    procedure TrueFalse(param : Boolean);
    procedure KodInputDSetCloseOpen;
    procedure ParentInputDSetCloseOpen;
    procedure CustServDSetCloseOpen;
    procedure KodCustServDSetCloseOpen;
    procedure RegionDSetCloseOpen;
    procedure CityAreaDSetCloseOpen;
    procedure StreetDSetCloseOpen;
    procedure TypeStreetDSetCloseOpen;
    procedure TnEngineerDSetCloseOpen;
    procedure ChangeStreetBoxProp(SwitchToDom:Boolean);
    function CheckData:Boolean;
    procedure AddNewLink;
    procedure AddNewInput;
    procedure EditInput;
    procedure EditLink;
    procedure FillLookUpCombobox;
  public
    res : Variant;
    constructor  Create(AParameter:TbsSimpleParams);reintroduce;
    procedure SetParams(R:Variant);
  end;

const
  size_form_h = 360;
  size_form_w = 685;
  Size_AE_h   = size_form_h + 40;
  Size_grid_h = size_form_h + 145;

implementation

uses FIBQuery,  Math, cxLookupDBGrid;

{$R *.dfm}

constructor TfrmInputs_Main.Create(AParameter:TbsSimpleParams);
begin
   Screen.Cursor:=crHourGlass;
   inherited Create(AParameter.Owner);

   is_Admin  := AParameter.is_Admin;
   id_user   := AParameter.ID_User;
   name_user := AParameter.User_Name;

   DM := TInputs_DM.Create(Self);

   DM.DB.Handle := AParameter.Db_Handle;
   DM.DB.Connected := True;
   DM.ReadTransaction.StartTransaction;

   DM.ReadDataSet.Close;
   DM.ReadDataSet.SQLs.SelectSQL.Text := 'Select Distinct * From BS_CONSTS';
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

   if AParameter.Formstyle = fsMDIChild then Button_select.Visible := ivNever;

   //Grid_inputDBView.DataController.DataSource := DM.DataSource;

   Kol_Filter_var := 1;

   frmFilter := TBsMemoFilter.Create('KodInputBox;ParentInputBox;DiameterEdit;'+
                'TnEngineerBox;CustServBox;KodCustServBox;RegionBox;CityAreaBox;'+
                'TypeStreetBox;StreetBox;HouseEdit;KorpusEdit;InputLocation;'+
                'CheckBox_existence_accounts;CheckBox_excess', Self);

   FormIniLanguage();
   Screen.Cursor := crDefault;
   bsFormStorage.RestoreFormPlacement;
   BsSetKeyBoardLanguage('U');
   IsBlockSprav:=False;
   ChangeStreetBoxProp(False);
   id_input:=null;
   id_pinput:=null;
   id_discount_obj:=null;
end;

procedure TfrmInputs_Main.SetParams(R:Variant);
begin
   id_input:=R;
end;

procedure Tfrminputs_main.AddNewLink;
var MsgStr:string;
begin
   with DM.StProc do
   Begin
      Transaction.StartTransaction;
      StoredProcName := 'BS_INPUT_OBJECT_INS';
      Prepare;
      ParamByName('ID_INPUT').AsInt64:=id_input;
      ParamByName('ID_DISCOUNT_OBJECT').AsInt64:=id_discount_obj;
      try
        ExecProc;
        MsgStr:=FieldByName('Er_Msg').AsString;
        if MsgStr='' then
        begin
           Transaction.Commit;
           ShowMessage('Сохранение связи Ввод-Дом прошло успешно!');
           isSave:=True;
        end
        else
        begin
           bsShowMessage('Увага!', MsgStr, mtInformation, [mbOK]);
           Transaction.Rollback;
        end;
      except on E:Exception do
             begin
                bsShowMessage('Error', e.Message, mtError, [mbOK]);
                Transaction.Rollback;
                raise;
             end;
      end;
   End
end;

procedure Tfrminputs_main.AddNewInput;
var MsgStr:string;
begin
  with DM.StProc do
  Begin
     Transaction.StartTransaction;
     //--------------------------------------------------------------------
     StoredProcName := 'BS_SP_INPUT_INS';
     Prepare;
     if AddParentInput then ParamByName('ID_PINPUT').Value:=null
     else ParamByName('ID_PINPUT').AsInt64:= id_pinput;
     ParamByName('DIAMETER').AsFloat:= StrToFloat(DiameterEdit.Text);
     ParamByName('LOC_PLACE').AsString:= InputLocation.Text;
     ParamByName('ID_TYPE_WATER').AsShort:=0;
     //ParamByName('KOD_INPUT').AsInteger:=KodInputBox.EditValue;
     try
        ExecProc;
        id_input := FieldByName('ID_INPUT').AsInt64;
        MsgStr:= FieldByName('Er_Msg').AsString;
        if MsgStr<>'' then
        begin
           Transaction.Rollback;
           bsShowMessage(Application.Title, MsgStr, mtInformation, [mbOK]);
           Exit;
        end;
        StoredProcName := 'BS_INPUT_OBJECT_INS';
        Prepare;
        ParamByName('ID_INPUT').AsInt64           := id_input;
        ParamByName('ID_DISCOUNT_OBJECT').AsInt64 := StreetBox.EditValue;
        ExecProc;
        MsgStr:=FieldByName('Er_Msg').AsString;
        if MsgStr='' then
        begin
           Transaction.Commit;
           ShowMessage('Сохранение ввода прошло успешно!');
           isSave:=True;
        end
        else
        begin
           bsShowMessage('Увага!', MsgStr, mtInformation, [mbOK]);
           Transaction.Rollback;
        end;
     except on E:Exception do
            begin
               bsShowMessage('Error', e.Message, mtError, [mbOK]);
               Transaction.Rollback;
               raise;
            end;
     end;
  End;
end;

procedure TfrmInputs_Main.EditInput;
begin
   with DM.StProc do
   begin
      Transaction.StartTransaction;
      StoredProcName := 'BS_SP_INPUT_UPD';
      Prepare;
      ParamByName('ID_INPUT').AsInt64        := id_input;
      ParamByName('DIAMETER').AsFloat        := DiameterEdit.Value;
      ParamByName('LOC_PLACE').AsString      := InputLocation.Text;
      ParamByName('ID_TYPE_WATER').AsInt64   := 0;
      try
         ExecProc;
         Transaction.Commit;
         isSave:=True;
      except on E:Exception do
             begin
                bsShowMessage('Error', e.Message, mtError, [mbOK]);
                Transaction.Rollback;
                raise;
             end;
      end;
   end;
end;

procedure TfrmInputs_Main.EditLink;
var MsgStr:string;
begin
    with dm.StProc do
    begin
      Transaction.StartTransaction;
      StoredProcName := 'BS_INPUT_OBJECT_UPD';
      Prepare;
      ParamByName('ID_INPUT').AsInt64        := id_input;
      ParamByName('ID_DISCOUNT_OBJECT').AsInt64 := StreetBox.EditValue;
      try
         ExecProc;
         MsgStr:=FieldByName('ER_MSG').AsString;
         if MsgStr='' then
         begin
            Transaction.Commit;
            isSave:=True;
         end
         else
         begin
            bsShowMessage('Увага!', MsgStr, mtInformation, [mbOK]);
            Transaction.Rollback;
         end;
      except on E:Exception do
             begin
                bsShowMessage('Error', e.Message, mtError, [mbOK]);
                Transaction.Rollback;
                raise;
             end;
      end;
    end;
end;

function TfrmInputs_Main.CheckData:Boolean;
begin
   Result:=True;

   DiameterEdit.Style.Color:=clWindow;
   StreetBox.Style.Color:=clWindow;
   ParentInputBox.Style.Color:=clWindow;
   KodInputBox.Style.Color:=clWindow;


   if not UpdLink then
      if DiameterEdit.Text='' then
      begin
         //bsShowMessage('Увага!', 'Ви не обрали діаметр вводу!', mtInformation, [mbOK]);
         DiameterEdit.Style.Color:=uConsts.BsClFieldIsEmpty;
         Result:=False;
      end;

   if not UpdInput then
      if StreetBox.EditText='' then
      begin
         StreetBox.Style.Color:=uConsts.BsClFieldIsEmpty;
         Result:=False;
      end;

   if AddInput then
      if ParentInputBox.EditText='' then
      begin
         ParentInputBox.Style.Color:=uConsts.BsClFieldIsEmpty;
         Result:=False;
      end;

   if ((UpdInput) or (UpdLink)) then
   begin
      if KodInputBox.EditText='' then
      begin
         KodInputBox.Style.Color:=uConsts.BsClFieldIsEmpty;
         Result:=False;
      end;
   end;

   if not Result then bsShowMessage(Application.Title, 'Не були заповнені усі необхідні поля!', mtInformation, [mbOK]);
end;

procedure TfrmInputs_Main.KodInputDSetCloseOpen;
begin
   with DM do
   begin
      if KodInputDSet.Active then KodInputDSet.Close;
      KodInputDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_INPUT_INFO_BY_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      KodInputDSet.ParamByName('FILTER_STR').AsString:=KodInputBox.EditText;
      KodInputDSet.ParamByName('RADIO_BTN').AsShort:=0;
      KodInputDSet.ParamByName('IS_ADD').AsShort:=Integer(Boolean((AddInput) or (AddParentInput) or (UpdInput)));
      KodInputDSet.Open;
   end;
end;

procedure TfrmInputs_Main.ParentInputDSetCloseOpen;
begin
   with DM do
   begin
      if InputParentDSet.Active then InputParentDSet.Close;
      InputParentDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_INPUT_INFO_BY_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      InputParentDSet.ParamByName('FILTER_STR').AsString:=ParentInputBox.EditText;
      InputParentDSet.ParamByName('RADIO_BTN').AsShort:=0;
      InputParentDSet.ParamByName('IS_ADD').AsShort:=0;
      InputParentDSet.Open;
   end;
end;

procedure TfrmInputs_Main.CustServDSetCloseOpen;
begin
   with DM do
   begin
       if CustServDSet.Active then CustServDSet.Close;
       CustServDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR, :ID_ROOT, :RADIO_BTN)';
       CustServDSet.ParamByName('FILTER_STR').AsString:=CustServBox.EditText;
       CustServDSet.ParamByName('ID_ROOT').AsInteger:=ID_GR_LIST_CUST_SERV_ROOT;
       CustServDSet.ParamByName('RADIO_BTN').AsShort:=0;
       CustServDSet.Open;
   end;
end;

procedure TfrmInputs_Main.KodCustServDSetCloseOpen;
begin
   with DM do
   begin
      if KodCustServDSet.Active then KodCustServDSet.Close;
      KodCustServDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR, :ID_ROOT, :RADIO_BTN)';
      KodCustServDSet.ParamByName('FILTER_STR').AsString:=KodCustServBox.EditText;
      KodCustServDSet.ParamByName('ID_ROOT').AsInteger:=ID_GR_LIST_CUST_SERV_ROOT;
      KodCustServDSet.ParamByName('RADIO_BTN').AsShort:=2;
      KodCustServDSet.Open;
   end;
end;

procedure TfrmInputs_Main.RegionDSetCloseOpen;
begin
   with DM do
   begin
       if RegionDSet.Active then RegionDSet.Close;
       RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_REGION_FILTER(:FILTER_STR)';
       RegionDSet.ParamByName('FILTER_STR').AsString:=RegionBox.EditText;
       RegionDSet.Open;
   end;
end;

procedure TfrmInputs_Main.CityAreaDSetCloseOpen;
begin
   with DM do
   begin
       if CityAreaDSet.Active then CityAreaDSet.Close;
       CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CITY_AREA_FILTER(:FILTER_STR)';
       CityAreaDSet.ParamByName('FILTER_STR').AsString:=CityAreaBox.EditText;
       CityAreaDSet.Open;
   end;
end;

procedure TfrmInputs_Main.ChangeStreetBoxProp(SwitchToDom:Boolean);
begin
  if Dm.StreetDSet.Active then DM.StreetDSet.Close;
  StreetBox.EditValue:=(null);
  StreetBox.Properties.ListColumns.Clear;
  if SwitchToDom then
  begin
      StreetBox.Properties.KeyFieldNames:='Id_Discount_Object';
      StreetBox.Properties.ListColumns.Add.FieldName:='Name_Street';
      StreetBox.Properties.ListColumns.ColumnByFieldName('Name_Street').MinWidth:=0;
      StreetBox.Properties.ListColumns.ColumnByFieldName('Name_Street').Width:=0;
      StreetBox.Properties.ListColumns.Add.FieldName:='Name_Type_Street';
      StreetBox.Properties.ListColumns.Add.FieldName:='Id_Region';
      StreetBox.Properties.ListColumns.ColumnByFieldName('Id_Region').MinWidth:=0;
      StreetBox.Properties.ListColumns.ColumnByFieldName('Id_Region').Width:=0;
      StreetBox.Properties.ListColumns.Add.FieldName:='Id_City_Area';
      StreetBox.Properties.ListColumns.ColumnByFieldName('Id_City_Area').MinWidth:=0;
      StreetBox.Properties.ListColumns.ColumnByFieldName('Id_City_Area').Width:=0;
      StreetBox.Properties.ListColumns.Add.FieldName:='Name_Region';
      StreetBox.Properties.ListColumns.Add.FieldName:='Name_City_Area';
      StreetBox.Properties.ListColumns.Add.FieldName:='House';
      StreetBox.Properties.ListColumns.Add.FieldName:='Korpus';
      StreetBox.Properties.ListColumns.Add.FieldName:='Id_Type_Street';
      StreetBox.Properties.ListColumns.ColumnByFieldName('Id_Type_Street').MinWidth:=0;
      StreetBox.Properties.ListColumns.ColumnByFieldName('Id_Type_Street').Width:=0;
      StreetBox.Properties.GridMode:=True;
  end
  else
  begin
      StreetBox.Properties.KeyFieldNames:='ID_STREET';
      StreetBox.Properties.ListFieldNames:='NAME_STREET';
      StreetBox.Properties.GridMode:=False;
  end;
end;

procedure TfrmInputs_Main.StreetDSetCloseOpen;
begin
   if Dm.StreetDSet.Active then DM.StreetDSet.Close;
   if ((AddParentInput) or (AddInput) or (AddLink) or
       (UpdLink)) then DM.StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_DIS_OBJECT_BY_STREET(:FILTER_STR)'
   else DM.StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_STREET_FILTER(:FILTER_STR)';
   Dm.StreetDSet.ParamByName('FILTER_STR').AsString:=StreetBox.EditText;
   Dm.StreetDSet.Open;
end;

procedure TfrmInputs_Main.TypeStreetDSetCloseOpen;
begin
   with Dm do
   begin
       if TypeStreetDSet.Active then TypeStreetDSet.Close;
       TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_TYPE_STREET_FILTER(:FILTER_STR, :RADIO_BTN)';
       TypeStreetDSet.ParamByName('FILTER_STR').AsString:=TypeStreetBox.EditText;
       TypeStreetDSet.ParamByName('RADIO_BTN').AsShort:=1;
       TypeStreetDSet.Open;
   end;
end;

procedure TfrmInputs_Main.TnEngineerDSetCloseOpen;
begin
   with DM do
   begin
      if TnEngineerDSet.Active then TnEngineerDSet.Close;
      TnEngineerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR, :ID_ROOT, :RADIO_BTN)';
      TnEngineerDSet.ParamByName('FILTER_STR').AsString:=TnEngineerBox.EditText;
      TnEngineerDSet.ParamByName('ID_ROOT').AsInteger:=ID_GR_LIST_CHIEF_ENGINEER_ROOT;
      TnEngineerDSet.ParamByName('RADIO_BTN').AsShort:=2;
      TnEngineerDSet.Open;
   end;
end;

procedure TfrmInputs_Main.FormIniLanguage;
begin
  PLanguageIndex := uCommon_Funcs.bsLanguageIndex();

  //кэпшн формы
  Caption := uConsts.bs_SP_Input[PLanguageIndex];

  //названия кнопок
  btnAdd.Caption     := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  btnEdit.Caption    := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  //btnDel.Caption  := uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption  := uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  Button_select.Caption  := uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption     := uConsts.bs_ExitBtn_Caption[PLanguageIndex];
  Button_Cancel.Caption  := uConsts.bs_Cancel[PLanguageIndex];
  Button_Ok.Caption      := uConsts.bs_Accept[PLanguageIndex];

  // попап
  AddPop.Caption     := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  EditPop.Caption    := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  DeletePop.Caption  := uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshPop.Caption := uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  ExitPop.Caption    := uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //Статусбар
  StatusBar.Panels[0].Text := uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text := uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text := uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  StatusBar.Panels[3].Text := uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[4].Text := uConsts.bs_EnterBtn_ShortCut[PLanguageIndex]   + uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  StatusBar.Panels[5].Text := uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmInputs_Main.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmInputs_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  bsFormStorage.SaveFormPlacement;
  
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmInputs_Main.Button_selectClick(Sender: TObject);
var
  id_Input: int64;
begin
  if Grid_inputDBView.DataController.RecordCount = 0 then exit;

  Res := VarArrayCreate([0,5],varVariant);

  id_Input := FilterSet['ID_INPUT'];
  Res[0]   := id_Input;
  Res[1]   := FilterSet['KOD_INPUT'];
  //res[2]   := DM.DataSet['DATE_END'];

  ModalResult := mrOk;
end;

procedure TfrmInputs_Main.btnEditClick(Sender: TObject);
begin
  if not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/Inputs','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  If Grid_InputDBView.DataController.RecordCount = 0 then
   Begin
    bsShowMessage('Информация', 'Необходимо выбрать ввод!', mtInformation, [mbOK]);
    Exit;
   end;
  TrueFalse(False);
  btnEdit.Enabled := True;
end;

procedure TfrmInputs_Main.btnDelClick(Sender: TObject);
var MsgStr:string;
    InputDate:TcxDateEdit;
    frm:TForm;
    btnOk, btnCancel:TcxButton;
    inLabel:TcxLabel;
begin
   frm:=TForm.Create(Application);
   frm.BorderStyle:=bsDialog;
   frm.Position:=poMainFormCenter;
   frm.Height:=100;
   frm.Width:=200;
   frm.Caption:='Оберіть дату закриття';
   inLabel:=TcxLabel.Create(frm);
   inLabel.Parent:=frm;
   inLabel.Top:=10;
   inLabel.Left:=10;
   inLabel.Caption:='Дата';
   inLabel.Width:=30;
   InputDate:=TcxDateEdit.Create(frm);
   InputDate.Parent:=frm;
   InputDate.Top:=10;
   InputDate.Left:=inLabel.Width+20;
   InputDate.Date:=Date;
   btnOk:=TcxButton.Create(frm);
   btnOk.Parent:=frm;
   btnOk.ModalResult:=mrOk;
   btnOk.Top:=InputDate.Height+20;
   btnOk.Left:=20;
   btnOk.Caption:='Прийняти';
   btnOk.Height:=23;
   btnOk.Width:=70;
   btnCancel:=TcxButton.Create(frm);
   btnCancel.Parent:=frm;
   btnCancel.ModalResult:=mrCancel;
   btnCancel.Top:=btnOk.Top;
   btnCancel.Left:=btnOk.Width+35;
   btnCancel.Caption:='Відміна';
   btnCancel.Height:=23;
   btnCancel.Width:=70;
  if not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/Inputs','Del') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  If Grid_InputDBView.DataController.RecordCount = 0 then
  Begin
      bsShowMessage('Информация', 'Необходимо выбрать ввод!', mtInformation, [mbOK]);
      Exit;
  end;

  if frm.ShowModal=mrOk then
  begin
      with Dm do
      begin
         StProc.StoredProcName:='BS_SP_INPUT_DEL';
         StProc.Transaction.StartTransaction;
         StProc.Prepare;
         StProc.ParamByName('ID_INPUT').AsInteger:=id_input;
         StProc.ParamByName('DATE_END').AsDate:=InputDate.Date;
         try
            StProc.ExecProc;
            MsgStr:=StProc.FieldByName('Er_Msg').AsString;
            if MsgStr='F' then
            begin
               StProc.Transaction.Commit;
               Action_clearExecute(Sender);
               Action_active_filterExecute(Sender);
            end
            else
            begin
               bsShowMessage('Увага!', MsgStr, mtInformation, [mbOK]);
               StProc.Transaction.Rollback;
            end;
         except on E:Exception do
                begin
                   bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
                   StProc.Transaction.Rollback;
                end;
         end;
      end;
  end;
  frm.free;
end;

procedure TfrmInputs_Main.cxSplitter1AfterClose(Sender: TObject);
begin
  ClientWidth := ClientWidth + 100;
end;

procedure TfrmInputs_Main.cxSplitter1AfterOpen(Sender: TObject);
begin
  ClientWidth := ClientWidth - 100;
end;

procedure TfrmInputs_Main.FormCreate(Sender: TObject);
begin
  ClientHeight := size_form_h;
  ClientWidth  := size_form_w;
  Box_Dom.Visible := False;

  Kol_Filter_var := 0;

  Clear_filter_param;
  format.DecimalSeparator := '.';
end;

procedure TfrmInputs_Main.Splitter_DomBeforeOpen(Sender: TObject;
  var AllowOpen: Boolean);
begin
  ClientWidth  := size_form_w;
  Box_Dom.Visible := False;
end;

procedure TfrmInputs_Main.Splitter_DomBeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  Box_Dom.Visible := True;
  ClientWidth  := size_form_w + 215;


  DM.DataSet_TreeList.Close;
  DM.DataSet_TreeList.SQLs.SelectSQL.Text := 'Select * from BS_INPUT';
  DM.DataSet_TreeList.Open;

  DM.DataSet_TreeList.Locate('ID_INPUT', id_input, []);
end;

procedure TfrmInputs_Main.Action_active_filterExecute(Sender: TObject);
var strFilter:String;
begin
  try
     {Код ввода}
     strFilter:=''''+KodInputBox.EditText+''',';
     strFilter:=strFilter+''''+Label_sign_input.Caption+''',';
     {Коренной ввод}
     if ParentInputBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+IntToStr(id_pinput)+''',';
     {Диамерт ввода}
     if DiameterEdit.Text='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+FloatToStr(DiameterEdit.Value,Format)+''',';
     strFilter:=strFilter+''''+Label_sign_diam.Caption+''',';
     {Улица}
     if StreetBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+IntToStr(StreetBox.EditValue)+''',';
     {Регион}
     if RegionBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(RegionBox.EditValue)+',';
     {Район}
     if CityAreaBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+IntToStr(CityAreaBox.EditValue)+''',';
     {Тип улицы}
     if TypeStreetBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+IntToStr(TypeStreetBox.EditValue)+''',';
     {Дом}
     strFilter:=strFilter+''''+HouseEdit.Text+''',';
     {Корпус}
     strFilter:=strFilter+''''+KorpusEdit.Text+''',';
     {Процент оплаты}
     strFilter:=strFilter+''''+PercentPayBox.Text+''',';
     strFilter:=strFilter+''''+Label_sign_pay.Caption+''',';
     {Табельный номер инжинера}
     if TnEngineerBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+IntToStr(TnEngineerBox.EditValue)+',';
     {Обслуживающая организация}
     if CustServBox.EditText='' then strFilter:=strFilter+'Null,'
     else strFilter:=strFilter+''''+IntToStr(CustServBox.EditValue)+''',';
     strFilter:=strFilter+''''+Label_sign_name_org.Caption+''',';

    if KodCustServBox.EditText='' then strFilter:=strFilter+'Null,'
    else strFilter:=strFilter+''''+IntToStr(KodCustServBox.EditValue)+''',';
    strFilter:=strFilter+''''+Label_sign_kod_org.Caption+''',';

    strFilter:=strFilter+IntToStr(Integer(Boolean(CheckBox_existence_accounts.Checked)))+',';

    strFilter:=strFilter+IntToStr(Integer(Boolean(CheckBox_excess.Checked)));

    if FilterSet.Active then FilterSet.Close;
    FilterSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_INPUT_FILTER('+strFilter+')';
    FilterSet.Open;

   if FilterSet.RecordCount <> 0 then
   Begin
       ClientHeight := Size_grid_h;
       if Box_Input.Visible=False then Box_Input.Visible := True;
   End
   else
   begin
      ClientHeight:=size_form_h;
      if Box_Input.Visible then Box_Input.Visible:=False;
      bsShowMessage('Увага!','За встановленними параметрами не знайдено жодного запису!', mtInformation, [mbOK]);
   end;
   frmFilter.SetParams;
   btnUndo.Enabled:=True;
   btnRedo.Enabled:=False;
  except on E:Exception do
          begin
            bsShowMessage('Error', 'В ході виконання пошуку виникла помилка!'+ #13#10 + e.Message, mtError, [mbOK]);
            raise;
          end;
  end;
end;

procedure TfrmInputs_Main.Clear_filter_param;
begin
  With DM do
  begin
     if KodInputDSet.Active then KodInputDSet.Close;
     KodInputBox.EditValue:=(null);
     if InputParentDSet.Active then InputParentDSet.Close;
     ParentInputBox.EditValue:=(null);
     DiameterEdit.Text:='';
     if PercentPayDSet.Active then PercentPayDSet.Close;
     PercentPayBox.EditValue:=(null);
     FioEngineerBox.Text:='';
     if TnEngineerDSet.Active then TnEngineerDSet.Close;
     TnEngineerBox.EditValue:=(null);
     if TypeCustServDSet.Active then TypeCustServDSet.Close;
     TypeCustServBox.EditValue:=(null);
     if CustServDSet.Active then CustServDSet.Close;
     CustServBox.EditValue:=(null);
     if KodCustServDSet.Active then KodCustServDSet.Close;
     KodCustServBox.EditValue:=(null);
     if RegionDSet.Active then RegionDSet.Close;
     RegionBox.EditValue:=(null);
     if CityAreaDSet.Active then CityAreaDSet.Close;
     CityAreaBox.EditValue:=(null);
     if TypeStreetDSet.Active then TypeStreetDSet.Close;
     TypeStreetBox.EditValue:=(null);
     if StreetDSet.Active then StreetDSet.Close;
     StreetBox.EditValue:=(null);
     HouseEdit.Text:='';
     KorpusEdit.Text:='';
     InputLocation.Text:='';
     id_input:=null;
     id_pinput:=null;
     id_discount_obj:=null;
  end;
end;

procedure TfrmInputs_Main.Action_clearExecute(Sender: TObject);
begin
  Clear_filter_param;
end;

procedure TfrmInputs_Main.TrueFalse(param: Boolean);
begin
  btnAdd.Enabled := param;
  btnAddParentInput.Enabled := param;
  btnAddInput.Enabled := param;
  btnAddLink.Enabled := param;
  btnEdit.Enabled := param;
  btnEditInput.Enabled := param;
  btnEditInputObject.Enabled := param;
  btnDel.Enabled := param;
  Button_Filter.Enabled := param;
  Button_clear.Enabled:=param;
  btnRedo.Enabled:=param;
  btnUndo.Enabled:=param;

  KodInputBox.Enabled := param;
  ParentInputBox.Enabled := param;
  FioEngineerBox.Enabled := param;
  TnEngineerBox.Enabled := param;
  CustServBox.Enabled := param;
  KodCustServBox.Enabled := param;
  DiameterEdit.Enabled := param;
  RegionBox.Enabled := param;
  CityAreaBox.Enabled := param;
  TypeStreetBox.Enabled := param;
  TypeCustServBox.Enabled := param;
  PercentPayBox.Enabled := param;
  HouseEdit.Enabled:=param;
  KorpusEdit.Enabled := param;
  InputLocation.Enabled := param;

  AddParentInput:= False;
  AddInput:=False ;
  AddLink:=False;
  UpdInput:=False;
  UpdLink:=False;

  CheckBox_existence_accounts.Enabled := param;
  CheckBox_excess.Enabled             := param;

  box_accept.Visible := not param;

  if param=False then ClientHeight:=Size_AE_h;

 { if param
   then ClientHeight := size_form_h
   else ClientHeight := Size_AE_h;}

end;

procedure TfrmInputs_Main.Button_CancelClick(Sender: TObject);
begin
  TrueFalse(True);
  IsBlockSprav:=False;
  ChangeStreetBoxProp(False);
  btnMode.Visible:=ivNever;
  Button_Filter.Visible:=ivAlways;
  DiameterEdit.Style.Color:=clWindow;
  StreetBox.Style.Color:=clWindow;
  ParentInputBox.Style.Color:=clWindow;
  KodInputBox.Style.Color:=clWindow;
  StreetBox.Enabled:=True;
end;

procedure TfrmInputs_Main.Button_OkClick(Sender: TObject);
var Id:Integer;
begin
  If not CheckData then Exit;
  isSave:=False;
  if AddLink then
  begin
      AddNewLink;
  End
  Else if ((AddInput) or (AddParentInput)) then
       Begin
          AddNewInput;
       end
       else
       if UpdInput then
       begin
          EditInput;
       end
       else if UpdLink then
            begin
               EditLink;
            end;
  if isSave then
  begin
     Id:=id_input;
     Action_clearExecute(Sender);
     Action_active_filterExecute(Sender);
     FilterSet.Locate('ID_INPUT', Id, []);
  end;
  isSave:=False;
  TrueFalse(True);
  IsBlockSprav:=False;
  ChangeStreetBoxProp(False);
  btnMode.Visible:=ivNever;
  Button_Filter.Visible:=ivAlways;
  StreetBox.Enabled:=True;
  DiameterEdit.Style.Color:=clWindow;
  StreetBox.Style.Color:=clWindow;
  ParentInputBox.Style.Color:=clWindow;
  KodInputBox.Style.Color:=clWindow;
end;

procedure TfrmInputs_Main.pm_EquallyClick(Sender: TObject);
begin
  (FindComponent(PopupMenu_sign.PopupComponent.Name) as TcxLabel).Caption := pm_Equally.Caption;
end;

procedure TfrmInputs_Main.pm_Less_EqualClick(Sender: TObject);
begin
  (FindComponent(PopupMenu_sign.PopupComponent.Name) as TcxLabel).Caption := pm_Less_Equal.Caption;
end;

procedure TfrmInputs_Main.pm_LessClick(Sender: TObject);
begin
  (FindComponent(PopupMenu_sign.PopupComponent.Name) as TcxLabel).Caption := pm_Less.Caption;
end;

procedure TfrmInputs_Main.pm_MoreClick(Sender: TObject);
begin
  (FindComponent(PopupMenu_sign.PopupComponent.Name) as TcxLabel).Caption := pm_More.Caption;
end;

procedure TfrmInputs_Main.pm_More_EqualClick(Sender: TObject);
begin
  (FindComponent(PopupMenu_sign.PopupComponent.Name) as TcxLabel).Caption := pm_More_Equal.Caption;
end;

procedure TfrmInputs_Main.pm_Not_EqualClick(Sender: TObject);
begin
  (FindComponent(PopupMenu_sign.PopupComponent.Name) as TcxLabel).Caption := pm_Not_Equal.Caption;
end;

procedure TfrmInputs_Main.lblRegionClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  if IsBlockSprav then Exit;
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
       //
   end;
end;

procedure TfrmInputs_Main.lblCityAreaClick(Sender: TObject);
var
  AParameter : TbsSimpleParams;
  res : Variant;
begin
  if IsBlockSprav then Exit;
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
     ///
   end;
end;

procedure TfrmInputs_Main.lblStreetClick(Sender: TObject);
var
  AParameter : TbsSimpleParams;
  res : Variant;
begin
  if IsBlockSprav then Exit;
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
      ///
   end;
end;

procedure TfrmInputs_Main.lblDomClick(Sender: TObject);
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

  Res := RunFunctionFromPackage(AParameter, 'BillingSystem\BsDiscountObjects.bpl','ShowDiscountObjects');
  AParameter.Free;

  if VarArrayDimCount(Res)>0 then
   begin
      with DM do
      begin
         if TempDSet.Active then TempDSet.Close;
         TempDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DISCOUNT_OBJECT_SEL(:ID)';
         TempDSet.ParamByName('ID').AsInteger:=Res[0];
         TempDSet.Open;
         if not TempDSet.IsEmpty then
         begin
            RegionDSetCloseOpen;
            RegionBox.EditValue:=TempDSet['Id_Gr_List_Obj'];
            CityAreaDSetCloseOpen;
            CityAreaBox.EditValue:=TempDSet['Id_City_Area'];
            TypeStreetDSetCloseOpen;
            TypeStreetBox.EditValue:=TempDSet['Id_Type_Street'];
            if ((AddParentInput) or (AddInput) or (AddLink) or
                (UpdLink)) then
            begin
               ChangeStreetBoxProp(True);
               StreetDSetCloseOpen;
               StreetBox.EditValue:=TempDSet['Id_Discount_Object'];
            end
            else
            begin
               ChangeStreetBoxProp(False);
               StreetDSetCloseOpen;
               StreetBox.EditValue:=TempDSet['Id_Street'];
            end;


            HouseEdit.Text:=TempDSet['House'];
            if not VarIsNull(TempDSet['Korpus']) then KorpusEdit.Text:=TempDSet['Korpus'];
         end;
      end;
   end;
end;

procedure TfrmInputs_Main.Label_engineerClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  if IsBlockSprav then Exit;
  AParameter                 := TbsSimpleParams.Create;
  AParameter.Owner           := Self;
  AParameter.Db_Handle       := DM.DB.Handle;
  AParameter.ID_User         := id_user;
  AParameter.User_Name       := Name_user;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin        := is_admin;
  AParameter.ID_Locate       := ID_GR_LIST_CHIEF_ENGINEER_ROOT;    //взять из констов


  Res := RunFunctionFromPackage(AParameter, 'BillingSystem\BsGroupObjects.bpl','ShowObjectsGroup');
  AParameter.Free;

  if VarArrayDimCount(Res)>0 then
   begin
       with DM do
       begin
           if TempDSet.Active then TempDSet.Close;
           TempDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
           TempDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=Res[0];
           TempDSet.Open;
           if not TempDSet.IsEmpty then
           begin
              FioEngineerBox.Text:=TempDSet['Name_Gr_List_Obj'];
              TnEngineerDSetCloseOpen;
              TnEngineerBox.EditValue:=TempDSet['KOD_OBJ'];
           end;
       end;
   end;
end;

procedure TfrmInputs_Main.lblCustomerServiceClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  Res:Variant;
begin
  if IsBlockSprav then Exit;
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
         if TempDSet.Active then TempDSet.Close;
         TempDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
         TempDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=Res[0];
         TempDSet.Open;
         if not TempDSet.IsEmpty then
         begin
            CustServDSetCloseOpen;
            CustServBox.EditValue:=TempDSet['Id_Gr_List_Obj_Out'];
            KodCustServDSetCloseOpen;
            KodCustServBox.EditValue:=TempDSet['Kod_Obj'];
         end;
      end;
   end;
end;

procedure TfrmInputs_Main.btnAddLinkClick(Sender: TObject);
begin
  if not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/Inputs','Add') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;
  TrueFalse(false);
  IsBlockSprav:=True;
  ChangeStreetBoxProp(True);
  KodInputBox.Enabled := True;
  AddLink:=True;
  btnMode.Hint:=btnAddLink.Caption;
  btnMode.LargeImageIndex:=0;
  btnMode.Visible:=ivAlways;
  Button_Filter.Visible:=ivNever;
end;

procedure TfrmInputs_Main.dxBarLargeButton3Click(Sender: TObject);
begin
  ShowMessage('Кол-во записей '+ IntToStr(DM.DataSet.RecordCount));
end;

procedure TfrmInputs_Main.PM_Del_linkClick(Sender: TObject);
begin
  if not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/Inputs','Del') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  If Grid_InputDBView.DataController.RecordCount = 0 then
   Begin
    bsShowMessage('Информация', 'Необходимо выбрать ввод!', mtInformation, [mbOK]);
    Exit;
   end;

  Label_delete.Caption := uConsts_Messages.bs_warning_Delete[PLanguageIndex];

  TrueFalse(False);
end;

procedure TfrmInputs_Main.TreeList_InputsDblClick(Sender: TObject);
begin
  Action_clearExecute(self);

  KodInputBox.Text := DM.DataSet_TreeList['Kod_input'];

  CheckBox_existence_accounts.Checked := False;
  Action_active_filterExecute(Self);
end;


//initialization RegisterClass(TfrmInputs_Main);


procedure TfrmInputs_Main.btnEditInputClick(Sender: TObject);
begin
  TrueFalse(False);
  IsBlockSprav:=True;
  DiameterEdit.Enabled:=True;
  InputLocation.Enabled:=True;
  StreetBox.Enabled:=False;
  UpdInput:=True;
  btnMode.Hint:=btnEditInput.Caption;
  btnMode.LargeImageIndex:=1;
  btnMode.Visible:=ivAlways;
  Button_Filter.Visible:=ivNever;
end;

procedure TfrmInputs_Main.btnEditInputObjectClick(Sender: TObject);
begin
  IsBlockSprav:=True;
  ChangeStreetBoxProp(True);
  TrueFalse(False);
  btnEdit.Enabled:=True;
  btnEditInputObject.Enabled:=True;
  KodInputBox.Enabled:=True;
  StreetBox.Enabled:=True;
  UpdLink:=True;
  btnMode.Hint:=btnEditInputObject.Caption;
  btnMode.LargeImageIndex:=1;
  btnMode.Visible:=ivAlways;
  Button_Filter.Visible:=ivNever;
end;

procedure TfrmInputs_Main.KodInputBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.TimerEnterTimer(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
   with DM do
   begin
     case ContextInputType of
        0:
        begin
           StreetDSetCloseOpen;
           if not StreetDSet.IsEmpty then
           begin
              StreetBox.DroppedDown:=True;
           end;
           //StreetBox.Properties.GridMode:=True;
        end;
        1:
        begin
           CityAreaDSetCloseOpen;
           if not CityAreaDSet.IsEmpty then
           begin
              CityAreaBox.DroppedDown:=True;
           end;
        end;
        2:
        begin
           RegionDSetCloseOpen;
           if not RegionDSet.IsEmpty then
           begin
              RegionBox.DroppedDown:=True;
           end;   
        end;
        3:
        begin
           TypeStreetDSetCloseOpen;
           if not TypeStreetDSet.IsEmpty then
           begin
              TypeStreetBox.DroppedDown:=True;
           end;
        end;
        4:
        begin
           {IngineerDSet.Close;
           IngineerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_INGINER_FILTER(:FILTER_STR)';
           IngineerDSet.ParamByName('FILTER_STR').AsString:=InginerBox.EditText;
           IngineerDSet.Open;
           if not IngineerDSet.IsEmpty then
           begin
              InginerBox.DroppedDown:=True;
           end; }
        end;
        5:
        begin
           KodInputDSetCloseOpen;
           if not KodInputDSet.IsEmpty then
           begin
              KodInputBox.DroppedDown:=True;
           end;
        end;
        6:
        begin
           ParentInputDSetCloseOpen;
           if not InputParentDSet.IsEmpty then
           begin
              ParentInputBox.DroppedDown:=True;
           end;
        end;
        7:
        begin
           CustServDSetCloseOpen;
           if not CustServDSet.IsEmpty then
           begin
              CustServBox.DroppedDown:=True;
           end;
        end;
        8:
        begin
           KodCustServDSetCloseOpen;
           if not KodCustServDSet.IsEmpty then
           begin
              KodCustServBox.DroppedDown:=True;
           end;
        end;
     end;
   end;
end;

procedure TfrmInputs_Main.RegionBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.RegionBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.RegionBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.RegionBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblRegionClick(Sender)
   else
   begin
      ContextInputType:=2;
      if RegionBox.EditText='' then
         if DM.RegionDSet.Active then DM.RegionDSet.Close;
      TimerEnter.Enabled:=not ((RegionBox.EditText='') or (Key=VK_RETURN) or
                          (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
   end;
end;

procedure TfrmInputs_Main.RegionBoxPropertiesInitPopup(Sender: TObject);
begin
   RegionDSetCloseOpen;
end;

procedure TfrmInputs_Main.CityAreaBoxPropertiesInitPopup(Sender: TObject);
begin
   CityAreaDSetCloseOpen;
end;

procedure TfrmInputs_Main.CityAreaBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblCityAreaClick(Sender)
   else
   begin
      ContextInputType:=1;
      if CityAreaBox.EditText='' then
         if DM.CityAreaDSet.Active then DM.CityAreaDSet.Close;
      TimerEnter.Enabled:=not ((CityAreaBox.EditText='') or (Key=VK_RETURN) or
                          (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
   end;
end;

procedure TfrmInputs_Main.CityAreaBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.CityAreaBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.CityAreaBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.TypeStreetBoxPropertiesInitPopup(
  Sender: TObject);
begin
   TypeStreetDSetCloseOpen;
end;

procedure TfrmInputs_Main.TypeStreetBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.TypeStreetBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.TypeStreetBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.TypeStreetBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=3;
   if TypeStreetBox.EditText='' then
      if DM.TypeStreetDSet.Active then DM.TypeStreetDSet.Close;
   TimerEnter.Enabled:=not ((TypeStreetBox.EditText='') or (Key=VK_RETURN) or
                       (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT)); 
end;

procedure TfrmInputs_Main.KodInputBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ContextInputType:=5;
    if KodInputBox.EditText='' then
       if DM.KodInputDSet.Active then DM.KodInputDSet.Close;
    TimerEnter.Enabled:=not ((KodInputBox.EditText='') or (Key=VK_RETURN) or
                        (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmInputs_Main.KodInputBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.KodInputBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.KodInputBoxPropertiesInitPopup(Sender: TObject);
begin
   KodInputDSetCloseOpen;
end;

procedure TfrmInputs_Main.KodInputBoxPropertiesChange(Sender: TObject);
begin
   if KodInputBox.EditText<>'' then
      id_input:=KodInputBox.Properties.ListColumns.Items[1].Field.Value
   else KodInputBox.EditValue:=(null);
end;

procedure TfrmInputs_Main.ParentInputBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    ContextInputType:=6;
    if KodInputBox.EditText='' then
       if DM.InputParentDSet.Active then DM.InputParentDSet.Close;
    TimerEnter.Enabled:=not ((ParentInputBox.EditText='') or (Key=VK_RETURN) or
                        (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmInputs_Main.ParentInputBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.ParentInputBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.ParentInputBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.KodCustServBoxPropertiesInitPopup(
  Sender: TObject);
begin
   KodCustServDSetCloseOpen;
end;

procedure TfrmInputs_Main.CustServBoxPropertiesInitPopup(Sender: TObject);
begin
   CustServDSetCloseOpen;
end;

procedure TfrmInputs_Main.CustServBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ContextInputType:=7;
    if CustServBox.EditText='' then
       if DM.CustServDSet.Active then DM.CustServDSet.Close;
    TimerEnter.Enabled:=not ((CustServBox.EditText='') or (Key=VK_RETURN) or
                        (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmInputs_Main.KodCustServBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    ContextInputType:=8;
    if TypeCustServBox.EditText='' then
       if DM.TypeCustServDSet.Active then DM.TypeCustServDSet.Close;
    TimerEnter.Enabled:=not ((TypeCustServBox.EditText='') or (Key=VK_RETURN) or
                        (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT));
end;

procedure TfrmInputs_Main.ParentInputBoxPropertiesInitPopup(
  Sender: TObject);
begin
   ParentInputDSetCloseOpen;
end;

procedure TfrmInputs_Main.StreetBoxPropertiesInitPopup(Sender: TObject);
begin
   StreetDSetCloseOpen;
end;

procedure TfrmInputs_Main.StreetBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblStreetClick(Sender)
   else
   begin
      ContextInputType:=0;
      if StreetBox.EditText='' then
         if DM.StreetDSet.Active then DM.StreetDSet.Close;
      TimerEnter.Enabled:=not ((StreetBox.EditText='') or (Key=VK_RETURN)
                               or (Key=VK_UP) or (Key=VK_DOWN)
                               or (Key=VK_LEFT) or (Key=VK_RIGHT));
   end;
end;

procedure TfrmInputs_Main.StreetBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.StreetBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.StreetBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.CustServBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.CustServBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.CustServBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.KodCustServBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.KodCustServBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.KodCustServBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.TnEngineerBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.TnEngineerBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.TnEngineerBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmInputs_Main.TnEngineerBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    ContextInputType:=4;
    if TnEngineerBox.EditText='' then
       if DM.TnEngineerDSet.Active then DM.TnEngineerDSet.Close;
    TimerEnter.Enabled:=not ((TnEngineerBox.EditText='') or (Key=VK_RETURN));
end;

procedure TfrmInputs_Main.TnEngineerBoxPropertiesInitPopup(
  Sender: TObject);
begin
   TnEngineerDSetCloseOpen;
end;

procedure TfrmInputs_Main.StreetBoxPropertiesChange(Sender: TObject);
begin
   if ((AddParentInput) or (AddInput) or (AddLink) or
       (UpdLink)) then
   begin
      try
        if StreetBox.EditText='' then Exit;
        id_discount_obj:=StreetBox.EditValue;
        if not DM.StreetDSet.IsEmpty then
        begin
            with DM do
            begin
                RegionBox.EditValue:=(null);
                if RegionDSet.Active then RegionDSet.Close;
                RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
                RegionDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=StreetBox.Properties.ListColumns.ColumnByFieldName('Id_Region').Field.Value;
                RegionDSet.Open;
                RegionBox.EditValue:=StreetBox.Properties.ListColumns.ColumnByFieldName('Id_Region').Field.Value;
                CityAreaBox.EditValue:=(null);
                if CityAreaDSet.Active then CityAreaDSet.Close;
                CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
                CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=StreetBox.Properties.ListColumns.ColumnByFieldName('Id_City_Area').Field.Value;
                CityAreaDSet.Open;
                CityAreaBox.EditValue:=StreetBox.Properties.ListColumns.ColumnByFieldName('Id_City_Area').Field.Value;
                HouseEdit.Text:='';
                if not VarIsNull(StreetBox.Properties.ListColumns.ColumnByFieldName('House').Field.Value) then
                   HouseEdit.Text:=StreetBox.Properties.ListColumns.ColumnByFieldName('House').Field.Value;
                KorpusEdit.Text:='';
                if not VarIsNull(StreetBox.Properties.ListColumns.ColumnByFieldName('Korpus').Field.Value) then
                   KorpusEdit.Text:=StreetBox.Properties.ListColumns.ColumnByFieldName('Korpus').Field.Value;
                TypeStreetBox.EditValue:=(null);   
                if TypeStreetDSet.Active then TypeStreetDSet.Close;
                TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
                TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=StreetBox.Properties.ListColumns.ColumnByFieldName('Id_Type_Street').Field.Value;
                TypeStreetDSet.Open;
                TypeStreetBox.EditValue:=StreetBox.Properties.ListColumns.ColumnByFieldName('Id_Type_Street').Field.Value;
            end;
        end;
      except on E:Exception
             do begin
                   bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
                   Exit;
                end;  
      end;
   end
   else if StreetBox.EditText='' then StreetBox.EditValue:=(null);
end;

procedure TfrmInputs_Main.btnAddParentInputClick(Sender: TObject);
begin
  if not is_Admin then
     if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/Inputs','Add') <> 0 then
     begin
        messagebox(handle,
                   pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
                   +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
                   pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
     end;

  TrueFalse(false);
  IsBlockSprav:=True;
  ChangeStreetBoxProp(True);
  InputLocation.Enabled := True;
  DiameterEdit.Enabled:=True;
  AddParentInput:=True;
  btnMode.Hint:=btnAddParentInput.Caption;
  btnMode.LargeImageIndex:=0;
  btnMode.Visible:=ivAlways;
  Button_Filter.Visible:=ivNever;

end;

procedure TfrmInputs_Main.btnAddInputClick(Sender: TObject);
begin
  if not is_Admin then
     if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/Inputs','Add') <> 0 then
     begin
        messagebox(handle,
                   pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
                   +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
                   pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
     end;

  TrueFalse(false);
  IsBlockSprav:=True;
  ChangeStreetBoxProp(True);
  ParentInputBox.Enabled := True;
  InputLocation.Enabled := True;
  DiameterEdit.Enabled:=True;
  AddInput:=True;
  btnMode.Hint:=btnAddInput.Caption;
  btnMode.LargeImageIndex:=0;
  btnMode.Visible:=ivAlways;
  Button_Filter.Visible:=ivNever;
end;

procedure TfrmInputs_Main.ParentInputBoxPropertiesChange(Sender: TObject);
begin
   if ParentInputBox.EditText<>'' then
      id_pinput:=ParentInputBox.Properties.ListColumns.Items[1].Field.Value
   else ParentInputBox.EditValue:=(null);   
end;

procedure TfrmInputs_Main.Grid_inputDBViewDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex,
  AItemIndex: Integer);
begin
  {if DM.DataSet['KOD_INPUT'] <> null
   then KodInputBox.EditValue := DM.DataSet['KOD_INPUT']; }
end;

procedure TfrmInputs_Main.FilterSetEndScroll(DataSet: TDataSet);
begin
   with Dm do
   begin
      if FilterSet.IsEmpty then Exit;
      id_input:=FilterSet['ID_INPUT'];
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

      if TnEngineerDSet.Active then TnEngineerDSet.Close;
      TnEngineerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
      TnEngineerDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=FilterSet['Id_Engineer'];
      TnEngineerDSet.Open;
      TnEngineerBox.EditValue:=TnEngineerDSet['KOD_OBJ'];

      if KodInputDSet.Active then KodInputDSet.Close;
      KodInputDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_INFO_INPUT_BY_ID(:ID_INPUT)';
      KodInputDSet.ParamByName('ID_INPUT').AsInteger:=FilterSet['Id_Input'];
      KodInputDSet.Open;
      KodInputBox.EditValue:=FilterSet['Kod_Input'];

      if InputParentDSet.Active then InputParentDSet.Close;
      InputParentDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_INFO_INPUT_BY_ID(:ID_INPUT)';
      InputParentDSet.ParamByName('ID_INPUT').AsInteger:=FilterSet['Id_Input'];
      InputParentDSet.Open;
      ParentInputBox.EditValue:=FilterSet['Kod_Input'];

      if StreetDSet.Active then StreetDSet.Close;
      StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_STREET_SEL_BY_ID(:ID_STREET)';
      StreetDSet.ParamByName('ID_STREET').AsInteger:=FilterSet['ID_STREET'];
      StreetDSet.Open;
      StreetBox.EditValue:=FilterSet['ID_STREET']; 

      FioEngineerBox.Text:=FilterSet['Fio_Engineer'];
      DiameterEdit.Text:=FloatToStr(FilterSet['Diameter']);
      HouseEdit.Text:=FilterSet['House'];
      if VarIsNull(FilterSet['Korpus']) then KorpusEdit.Text:=''
      else KorpusEdit.Text:=FilterSet['Korpus'];
      if VarIsNull(FilterSet['Loc_Place']) then InputLocation.Text:=''
      else InputLocation.Text:=FilterSet['Loc_Place'];
   end;
end;

procedure TfrmInputs_Main.btnHistInputClick(Sender: TObject);
var frm:TfrmSprav;
    sParam:TSpravParams;
begin
    if FilterSet.IsEmpty then Exit;
    sParam.FormCaption := 'Історія змін';
    sParam.SelectText := 'SELECT DISTINCT * FROM BS_INPUT_HST_SEL('+IntToStr(id_input)+')';
    sParam.NameFields := 'User_Fio_Hst,Date_Time_Hst,Action_Hst,Kod_Input,Kod_Pinput,'+
                          'Diameter,Loc_Place,Id_Hst';
    sParam.FieldsCaption := 'Користувач#Дата та час зміни#Дія#Код вводу#'+
                            'Код кореневого вводу#Діаметр#Розташування';
    sParam.KeyField := 'Id_Hst';
    sParam.ReturnFields := 'Id_Hst';
    sParam.FilterFields:= 'User_Fio_Hst,Date_Time_Hst,Action_Hst,Kod_Input,Kod_Pinput,'+
                          'Diameter,Loc_Place';
    sParam.FilterCaptions:='Користувач,Дата та час зміни,Дія,Код вводу,'+
                            'Код кореневого вводу,Діаметр,Розташування';
    sParam.DbHandle:=DM.DB.Handle;
    sParam.frmButtons:=[BsUnivSprav.fbExit];
    sParam.IsMultiSelect:=False;
    frm:=TfrmSprav.Create(Self, sParam);
    frm.ShowModal;
    frm.Free;
end;

procedure TfrmInputs_Main.btnHistObjectClick(Sender: TObject);
var frm:TfrmSprav;
    sParam:TSpravParams;
begin
    if FilterSet.IsEmpty then Exit;
    sParam.FormCaption := 'Історія змін';
    sParam.SelectText := 'SELECT DISTINCT * FROM BS_INPUT_OBJECT_HST_SEL('+IntToStr(id_input)+')';
    sParam.NameFields := 'User_Fio_Hst,Date_Time_Hst,Action_Hst,Kod_Input,Name_Region,'+
                          'Name_City_Area,Name_Street,House,Korpus,Id_Hst';
    sParam.FieldsCaption := 'Користувач#Дата та час зміни#Дія#Код вводу#'+
                            'Регіон#Район#Вулиця#Будинок#Корпус';
    sParam.KeyField := 'Id_Hst';
    sParam.ReturnFields := 'Id_Hst';
    sParam.FilterFields:= 'User_Fio_Hst,Date_Time_Hst,Action_Hst,Kod_Input,Name_Region,'+
                          'Name_City_Area,Name_Street,House,Korpus';
    sParam.FilterCaptions:='Користувач#Дата та час зміни#Дія#Код вводу#'+
                            'Регіон#Район#Вулиця#Будинок#Корпус';
    sParam.DbHandle:=DM.DB.Handle;
    sParam.frmButtons:=[BsUnivSprav.fbExit];
    sParam.IsMultiSelect:=False;
    frm:=TfrmSprav.Create(Self, sParam);
    frm.ShowModal;
    frm.Free;
end;

procedure TfrmInputs_Main.FillLookUpCombobox;
begin
   with DM do
   begin
       {Заполняем поле регион}
       if not VarIsNull(frmFilter.GetValueByNameComponentEx('RegionBox')) then
       begin
          if RegionDSet.Active then RegionDSet.Close;
          RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
          RegionDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=frmFilter.GetValueByNameComponentEx('RegionBox');
          RegionDSet.Open;
          RegionBox.EditValue:=frmFilter.GetValueByNameComponentEx('BsRegionBox');
       end;
       {Заполняем поле район}
       if not VarIsNull(frmFilter.GetValueByNameComponentEx('CityAreaBox')) then
       begin
          if CityAreaDSet.Active then CityAreaDSet.Close;
          CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
          CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=frmFilter.GetValueByNameComponentEx('CityAreaBox');
          CityAreaDSet.Open;
          CityAreaBox.EditValue:=frmFilter.GetValueByNameComponentEx('CityAreaBox');
       end;
       {Заполняем поле улица}
       if not VarIsNull(frmFilter.GetValueByNameComponentEx('StreetBox')) then
       begin
          if StreetDSet.Active then StreetDSet.Close;
          StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_STREET_BY_ID(:ID_STREET)';
          StreetDSet.ParamByName('ID_STREET').AsInteger:=frmFilter.GetValueByNameComponentEx('StreetBox');
          StreetDSet.Open;
          StreetBox.EditValue:=frmFilter.GetValueByNameComponentEx('StreetBox');
       end;
       {Заполняем поле тип улицы}
       if not VarIsNull(frmFilter.GetValueByNameComponentEx('TypeStreetBox')) then
       begin
          if TypeStreetDSet.Active then TypeStreetDSet.Close;
          TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
          TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=frmFilter.GetValueByNameComponentEx('TypeStreetBox');
          TypeStreetDSet.Open;
          TypeStreetBox.EditValue:=frmFilter.GetValueByNameComponentEx('TypeStreetBox');
       end;
       {Заполняем поле Инжинер}
       if not VarIsNull(frmFilter.GetValueByNameComponentEx('TnEngineerBox')) then
       begin
          if TnEngineerDSet.Active then TnEngineerDSet.Close;
          TnEngineerDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR, :ID_ROOT, :RADIO_BTN)';
          TnEngineerDSet.ParamByName('FILTER_STR').AsString:=frmFilter.GetValueByNameComponentEx('TnEngineerBox');
          TnEngineerDSet.ParamByName('ID_ROOT').AsInteger:=ID_GR_LIST_CHIEF_ENGINEER_ROOT;
          TnEngineerDSet.ParamByName('RADIO_BTN').AsShort:=2;
          TnEngineerDSet.Open;
          TnEngineerBox.EditValue:=frmFilter.GetValueByNameComponentEx('TnEngineerBox');
       end;
       {Заполняем поле код ввода}
       if not VarIsNull(frmFilter.GetValueByNameComponentEx('KodInputBox')) then
       begin
          if KodInputDSet.Active then KodInputDSet.Close;
          KodInputDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_INPUT_INFO_BY_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
          KodInputDSet.ParamByName('FILTER_STR').AsString:=frmFilter.GetValueByNameComponentEx('KodInputBox');
          KodInputDSet.ParamByName('RADIO_BTN').AsShort:=0;
          KodInputDSet.ParamByName('IS_ADD').AsShort:=Integer(Boolean((AddInput) or (AddParentInput) or (UpdInput)));
          KodInputDSet.Open;
          KodInputBox.EditValue:=frmFilter.GetValueByNameComponentEx('KodInputBox');
       end;
       {Заполняем поле код коренного ввода}
       if not VarIsNull(frmFilter.GetValueByNameComponentEx('ParentInputBox')) then
       begin
          if InputParentDSet.Active then InputParentDSet.Close;
          InputParentDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_INPUT_INFO_BY_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
          InputParentDSet.ParamByName('FILTER_STR').AsString:=frmFilter.GetValueByNameComponentEx('ParentInputBox');
          InputParentDSet.ParamByName('RADIO_BTN').AsShort:=0;
          InputParentDSet.ParamByName('IS_ADD').AsShort:=0;
          InputParentDSet.Open;
          ParentInputBox.EditValue:=frmFilter.GetValueByNameComponentEx('ParentInputBox');
       end;
       {Заполняем поле обслуживающая организация}
       if not VarIsNull(frmFilter.GetValueByNameComponentEx('CustServBox')) then
       begin
          if CustServDSet.Active then CustServDSet.Close;
          CustServDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
          CustServDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=frmFilter.GetValueByNameComponentEx('CustServBox');
          CustServDSet.Open;
          CustServBox.EditValue:=frmFilter.GetValueByNameComponentEx('CustServBox');
       end;
       {Заполняем поле код обслуживающей организации}
       if not VarIsNull(frmFilter.GetValueByNameComponentEx('KodCustServBox')) then
       begin
          if KodCustServDSet.Active then KodCustServDSet.Close;
          KodCustServDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR, :ID_ROOT, :RADIO_BTN)';
          KodCustServDSet.ParamByName('FILTER_STR').AsString:=frmFilter.GetValueByNameComponentEx('KodCustServBox');
          KodCustServDSet.ParamByName('ID_ROOT').AsInteger:=ID_GR_LIST_CUST_SERV_ROOT;
          KodCustServDSet.ParamByName('RADIO_BTN').AsShort:=2;
          KodCustServDSet.Open;
          KodCustServBox.EditValue:=frmFilter.GetValueByNameComponentEx('KodCustServBox');
       end;
   end;
   frmFilter.FillComponents;
   btnUndo.Enabled:=frmFilter.EnableBtn(True);
   btnRedo.Enabled:=frmFilter.EnableBtn(False);
   if DiameterEdit.Value=0 then DiameterEdit.Text:='';
end;

procedure TfrmInputs_Main.ActionUndoExecute(Sender: TObject);
begin
   if frmFilter.FilterArrayIsNil then Exit;
   Action_clearExecute(Sender);
   frmFilter.FilterUndo;
   FillLookUpCombobox;
end;


procedure TfrmInputs_Main.ActionRedoExecute(Sender: TObject);
begin
   if frmFilter.FilterArrayIsNil then Exit;
   Action_clearExecute(Sender);
   frmFilter.FilterRedo;
   FillLookUpCombobox;
end;

procedure TfrmInputs_Main.CustServBoxPropertiesChange(Sender: TObject);
begin
   if CustServBox.EditText='' then CustServBox.EditValue:=(null);
end;

procedure TfrmInputs_Main.KodCustServBoxPropertiesChange(Sender: TObject);
begin
   if KodCustServBox.EditText='' then KodCustServBox.EditValue:=(null);
end;

procedure TfrmInputs_Main.RegionBoxPropertiesChange(Sender: TObject);
begin
   if RegionBox.EditText='' then RegionBox.EditValue:=(null);
end;

procedure TfrmInputs_Main.CityAreaBoxPropertiesChange(Sender: TObject);
begin
   if CityAreaBox.EditText='' then CityAreaBox.EditValue:=(null);
end;

procedure TfrmInputs_Main.TypeStreetBoxPropertiesChange(Sender: TObject);
begin
   if TypeStreetBox.EditText='' then TypeStreetBox.EditValue:=(null);
end;

procedure TfrmInputs_Main.TnEngineerBoxPropertiesChange(Sender: TObject);
begin
   if TnEngineerBox.EditText='' then TnEngineerBox.EditValue:=(null);
end;

end.


