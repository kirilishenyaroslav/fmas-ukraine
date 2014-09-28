unit uImportPersAcc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxPC, cxControls, cxSplitter, ExtCtrls,
  ImgList, cxClasses, cxStyles, cxGridTableView, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ActnList,
  cxGridCustomTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView,
  cxGrid, uMainOplata, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxContainer, cxTextEdit,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ComCtrls, ToolWin, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit, DateUtils, cxCurrencyEdit,uCommon_Funcs, uConsts,
  uCommon_Messages, uConsts_Messages,uCommon_Types;

type
  TfmAddMode = (Add , Change, View);
  TfrmImportPersAcc = class(TForm)
    PageControl: TcxPageControl;
    TabSheetPack: TcxTabSheet;
    TabSheetPersAcc: TcxTabSheet;
    TabSheetErr: TcxTabSheet;
    BarManager: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    Panel1: TPanel;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    Panel3: TPanel;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    ImageList: TImageList;
    GridAcc: TcxGrid;
    GridAccDBView: TcxGridDBTableView;
    GridAccLevel: TcxGridLevel;
    GridAccDBViewDBColumn1: TcxGridDBColumn;
    GridAccDBViewDBColumn2: TcxGridDBColumn;
    GridAccDBViewDBColumn3: TcxGridDBColumn;
    GridBalance: TcxGrid;
    GridBalanceDBTableView: TcxGridDBTableView;
    GridBalanceLevel: TcxGridLevel;
    ActionListPersAcc: TActionList;
    ActionNext: TAction;
    ActionBack: TAction;
    ActionClose: TAction;
    Db: TpFIBDatabase;
    DataSetPersAcc: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    DataSourcePersAcc: TDataSource;
    TextEditNumb: TcxTextEdit;
    LabelNumb: TcxLabel;
    LabelNameFile: TcxLabel;
    LabelCount_records: TcxLabel;
    LabelSum: TcxLabel;
    Labeldate: TcxLabel;
    TextEditNameFile: TcxTextEdit;
    TextEditCountRec: TcxTextEdit;
    TextEditSum: TcxTextEdit;
    DateEdit: TcxDateEdit;
    DataSetSelNumb: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    GridAccDBViewDBColumn4: TcxGridDBColumn;
    DataSourceBalances: TDataSource;
    DataSetBalances: TpFIBDataSet;
    ToolBar1: TToolBar;
    ToolButtonadd: TToolButton;
    ToolButtonEdit: TToolButton;
    ToolButtonDel: TToolButton;
    ActionAddPersAcc: TAction;
    ActionEditPersAcc: TAction;
    ActionDelPersAcc: TAction;
    PopupImageList: TImageList;
    PanelButtons: TPanel;
    ButtonSave: TcxButton;
    cxButton2: TcxButton;
    ActionSave: TAction;
    ActionCancel: TAction;
    LabelPersAcc: TcxLabel;
    LabelTypeCash: TcxLabel;
    LabelNameKasApp: TcxLabel;
    LabelKodKasApp: TcxLabel;
    BsPersAccBox: TcxLookupComboBox;
    BoxTypeCash: TcxLookupComboBox;
    BoxKasKod: TcxLookupComboBox;
    BoxKassApp: TcxLookupComboBox;
    LabelSumAcc: TcxLabel;
    LabelPeriodBeg: TcxLabel;
    LabelPeriodEnd: TcxLabel;
    DateEditBegPeriod: TcxDateEdit;
    DateEditEndPeriod: TcxDateEdit;
    DataSetBalancesID_PAYMENT_CURRENT: TFIBIntegerField;
    DataSetBalancesKOD_PERIOD_FOR_ACC: TFIBSmallIntField;
    DataSetBalancesSUMMA_PAY: TFIBBCDField;
    DataSetBalancesID_TYPE_GROUP_BALANCE: TFIBSmallIntField;
    DataSetBalancesNAME_TYPE_GROUP_BALANCE: TFIBStringField;
    GridBalanceDBTableViewDBColumn1: TcxGridDBColumn;
    GridBalanceDBTableViewDBColumn2: TcxGridDBColumn;
    ToolButtonBalan: TToolButton;
    ActionBalance: TAction;
    dxBarLargeButton4: TdxBarLargeButton;
    ActionRefresh: TAction;
    GridAccDBViewDBColumn5: TcxGridDBColumn;
    ToolBarPack: TToolBar;
    ToolButtonSign: TToolButton;
    ToolButtonUnSign: TToolButton;
    ActionListPack: TActionList;
    ActionSign: TAction;
    ActionUnsign: TAction;
    cxComboBoxMonth: TcxComboBox;
    LabelPeriod: TcxLabel;
    cxSpinEditYear: TcxSpinEdit;
    TimerEnter: TTimer;
    ClientDS: TDataSource;
    ClientDSet: TpFIBDataSet;
    btnFilter: TdxBarButton;
    BsRegionBox: TcxLookupComboBox;
    lblRegion: TcxLabel;
    CityAreaBox: TcxLookupComboBox;
    lblCItyArea: TcxLabel;
    pnlAdr: TPanel;
    StreetBox: TcxLookupComboBox;
    HouseEdit: TcxTextEdit;
    lblHouse: TcxLabel;
    lblKorpus: TcxLabel;
    KorpusEdit: TcxTextEdit;
    lblAdres: TcxLabel;
    TypeStreetBox: TcxLookupComboBox;
    GridAccDBViewDBColumn6: TcxGridDBColumn;
    TypeStreetDSet: TpFIBDataSet;
    TypeStreetDS: TDataSource;
    RegionDSet: TpFIBDataSet;
    RegionDS: TDataSource;
    StreetDSet: TpFIBDataSet;
    StreetDS: TDataSource;
    CityAreaDSet: TpFIBDataSet;
    CityAreaDS: TDataSource;
    lblFamiliya: TcxLabel;
    FamiliyaBox: TcxLookupComboBox;
    ImyaBox: TcxLookupComboBox;
    PatronomycBox: TcxLookupComboBox;
    lblOtch: TcxLabel;
    lblImya: TcxLabel;
    LabelFlat: TcxLabel;
    TextEditFlat: TcxTextEdit;
    FamSource: TDataSource;
    FamDSet: TpFIBDataSet;
    ImyaDSet: TpFIBDataSet;
    ImyaSource: TDataSource;
    PatrDSet: TpFIBDataSet;
    PatrSource: TDataSource;
    CashTypeDSet: TpFIBDataSet;
    CashTypeDS: TDataSource;
    KodKassaAppDSet: TpFIBDataSet;
    KassaAppDSet: TpFIBDataSet;
    KodKassaAppDS: TDataSource;
    KassaAppDS: TDataSource;
    LabelSign: TcxLabel;
    ComboBoxProp: TcxComboBox;
    LabelProp: TcxLabel;
    DataSetPersAccID_DT_ALLOC_PERS_AC: TFIBBCDField;
    DataSetPersAccID_PERSONAL_ACCOUNT: TFIBBCDField;
    DataSetPersAccSUM_OPL: TFIBBCDField;
    DataSetPersAccDATE_OPL: TFIBDateField;
    DataSetPersAccDATE_OBR: TFIBDateField;
    DataSetPersAccID_REC_BUFF: TFIBBCDField;
    DataSetPersAccDATE_BEG_PERIOD_FOR_ACC: TFIBDateField;
    DataSetPersAccDATE_END_PERIOD_FOR_ACC: TFIBDateField;
    DataSetPersAccCLIENT_ACCOUNT: TFIBBCDField;
    DataSetPersAccNAME_CASH_TYPE: TFIBStringField;
    DataSetPersAccNOTE_CASH_TYPE: TFIBStringField;
    DataSetPersAccNAME_KASSA_APP: TFIBStringField;
    DataSetPersAccNOTE_KASSA_APP: TFIBStringField;
    DataSetPersAccFLAG_ALLOC_ER: TFIBSmallIntField;
    DataSetPersAccFIO: TFIBStringField;
    DataSetPersAccFULL_ADRESS: TFIBStringField;
    DataSetPersAccNUM_FLAT: TFIBStringField;
    DataSetPersAccHOUSE: TFIBStringField;
    DataSetPersAccKORPUS: TFIBStringField;
    DataSetPersAccID_CITY_AREA: TFIBIntegerField;
    DataSetPersAccID_REGION: TFIBIntegerField;
    DataSetPersAccID_TYPE_STREET: TFIBSmallIntField;
    DataSetPersAccID_STREET: TFIBIntegerField;
    DataSetPersAccID_DISCOUNT_OBJECT: TFIBIntegerField;
    DataSetPersAccNAME_REGION: TFIBStringField;
    DataSetPersAccFAMILIYA: TFIBStringField;
    DataSetPersAccIMYA: TFIBStringField;
    DataSetPersAccOTCH: TFIBStringField;
    DataSetPersAccNAME_CITY_AREA: TFIBStringField;
    DataSetPersAccNAME_STREET: TFIBStringField;
    DataSetPersAccNAME_TYPE_STREET: TFIBStringField;
    DataSetPersAccID_KASSA_APP: TFIBIntegerField;
    DataSetPersAccID_CASH_TYPE_ROOT: TFIBIntegerField;
    DataSetPersAccID_KASSA_APP_ROOT: TFIBIntegerField;
    DataSetPersAccID_CASH_TYPE: TFIBIntegerField;
    DataSetGrRoot: TpFIBDataSet;
    DataSetPersAccID_CLIENT_ACCOUNT: TFIBIntegerField;
    ActionCheck: TAction;
    ToolBarError: TToolBar;
    ToolButton1: TToolButton;
    DataSourceCheckError: TDataSource;
    DataSetCheckErr: TpFIBDataSet;
    DataSetCheckErrERROR_MESSAGE: TFIBStringField;
    DataSetCheckErrID_DT_ALLOC_PERS_AC: TFIBBCDField;
    DataSetCheckErrSUM_OPL: TFIBBCDField;
    DataSetCheckErrSUM_ALLOC_ALL: TFIBBCDField;
    DataSetCheckErrFLAG_ALLOC_ER: TFIBIntegerField;
    DataSetCheckErrCLIENT_ACCOUNT: TFIBBCDField;
    DataSetCheckErrFIO: TFIBStringField;
    DataSetCheckErrMONTH_SYS: TFIBIntegerField;
    DataSetCheckErrYEAR_SYS: TFIBIntegerField;
    DataSetCheckErrKOD_ERROR: TFIBIntegerField;
    DataSetCheckErrNAME_ERROR: TFIBStringField;
    GridPack: TcxGrid;
    GridPackDBView: TcxGridDBTableView;
    GridPackLevel: TcxGridLevel;
    GridPackDBViewDBColumn1: TcxGridDBColumn;
    GridPackDBViewDBColumn2: TcxGridDBColumn;
    GridPackDBViewDBColumn3: TcxGridDBColumn;
    DataSetCheckErrDATE_BEG_PERIOD_FOR_ACC: TFIBDateField;
    DataSetCheckErrDATE_END_PERIOD_FOR_ACC: TFIBDateField;
    DataSetCheckErrID_DOC_PROP: TFIBIntegerField;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    ActionFilter: TAction;
    ActionClear: TAction;
    TextEditSumAcc: TcxTextEdit;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    procedure ActionCloseExecute(Sender: TObject);
    procedure TextEditNameFileKeyPress(Sender: TObject; var Key: Char);
    procedure ActionNextExecute(Sender: TObject);
    procedure ActionBackExecute(Sender: TObject);
    procedure TextEditNumbKeyPress(Sender: TObject; var Key: Char);
    procedure SavePack;
    procedure TextEditNumbPropertiesChange(Sender: TObject);
    procedure DateEditPropertiesChange(Sender: TObject);
    procedure TextEditNameFilePropertiesChange(Sender: TObject);
    procedure TabSheetPackHide(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure PackInfoAnnul(flag_add :TfmAddMode);
    procedure ActionAddPersAccExecute(Sender: TObject);
    procedure ActionEditPersAccExecute(Sender: TObject);
    procedure ActionDelPersAccExecute(Sender: TObject);
    procedure ActionBalanceExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure GridAccDBViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TimerEnterTimer(Sender: TObject);
    procedure BsPersAccBoxClick(Sender: TObject);
    procedure BsPersAccBoxEnter(Sender: TObject);
    procedure BsPersAccBoxExit(Sender: TObject);
    procedure BsPersAccBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BsPersAccBoxPropertiesInitPopup(Sender: TObject);
    procedure DataSetPersAccEndScroll(DataSet: TDataSet);
    procedure FamiliyaBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ImyaBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PatronomycBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BoxTypeCashKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BoxKasKodKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BoxKassAppKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BsRegionBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CityAreaBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TypeStreetBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StreetBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FamiliyaBoxClick(Sender: TObject);
    procedure FamiliyaBoxEnter(Sender: TObject);
    procedure FamiliyaBoxExit(Sender: TObject);
    procedure FamiliyaBoxPropertiesInitPopup(Sender: TObject);
    procedure ImyaBoxPropertiesInitPopup(Sender: TObject);
    procedure PatronomycBoxPropertiesInitPopup(Sender: TObject);
    procedure BoxTypeCashPropertiesInitPopup(Sender: TObject);
    procedure BoxKasKodPropertiesInitPopup(Sender: TObject);
    procedure BoxKassAppPropertiesInitPopup(Sender: TObject);
    procedure BsRegionBoxPropertiesInitPopup(Sender: TObject);
    procedure CityAreaBoxPropertiesInitPopup(Sender: TObject);
    procedure TypeStreetBoxPropertiesInitPopup(Sender: TObject);
    procedure StreetBoxPropertiesInitPopup(Sender: TObject);
    procedure BoxTypeCashExit(Sender: TObject);
    procedure BsRegionBoxExit(Sender: TObject);
    procedure CityAreaBoxExit(Sender: TObject);
    procedure TypeStreetBoxExit(Sender: TObject);
    procedure StreetBoxExit(Sender: TObject);
    procedure BoxKassAppExit(Sender: TObject);
    procedure BoxKasKodExit(Sender: TObject);
    procedure ImyaBoxExit(Sender: TObject);
    procedure PatronomycBoxExit(Sender: TObject);
    procedure BoxTypeCashEnter(Sender: TObject);
    procedure ActionSignExecute(Sender: TObject);
    procedure ActionUnsignExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure ComboBoxPropExit(Sender: TObject);
    procedure ComboBoxPropPropertiesChange(Sender: TObject);
    procedure cxComboBoxMonthPropertiesChange(Sender: TObject);
    procedure cxSpinEditYearPropertiesChange(Sender: TObject);
    procedure TextEditCountRecPropertiesChange(Sender: TObject);
    procedure TextEditSumPropertiesChange(Sender: TObject);
    procedure GridPackDBViewDblClick(Sender: TObject);
    procedure cxComboBoxMonthKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxPropPropertiesInitPopup(Sender: TObject);
    procedure ActionCheckExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionFilterExecute(Sender: TObject);
    procedure ActionClearExecute(Sender: TObject);
  private
      myform        : TfrmMainOplata;
      flag          : TfmAddMode;
      numb_pack     : integer;
      id_cash_type_root : integer;
      id_kassa_app_root : integer;
      type_doc : integer;
      flag_numb,flag_name_file,flag_date, flag_add_change, flag_button,Add_by_hand_pack, id_rec_buff : integer;
      id_dt_pack    : int64;
      id_pers_acc, flag_add_change_acc : integer;
      ContextInputType:SHORT;
      PLanguageIndex: byte;
      is_signed : integer;
      flag_name_Prop,flag_name_month,flag_name_year,flag_count_rec,flag_count_sum :integer;
      procedure ClientDSetCloseOpen;
      procedure EditEnabledFalse;
      procedure EditEnabledTrue;
      Procedure ClearAllEdits;
      procedure PackSign;
      procedure PackUnSign;
      procedure FlagAnnul;

  public
      constructor Create(AOwner: TComponent; dbase : TpFIBDatabase; mform : TfrmMainOplata; m : TfmAddMode);reintroduce;
  end;

{var
  frmImportPersAcc: TfrmImportPersAcc; }

implementation
uses uBsGrBalances;

{$R *.dfm}
constructor TfrmImportPersAcc.Create(AOwner: TComponent; dbase : TpFIBDatabase; mform : TfrmMainOplata; m : TfmAddMode);

begin
    inherited Create (AOwner);

    myform                                 := mform;
    flag                                   := m;
    Db                                     := DBase;

    Transaction.DefaultDatabase            := DB;
    DB.DefaultTransaction                  := Transaction;

    DataSetPersAcc.Database                := DB;
    DataSetPersAcc.Transaction             := Transaction;

    DataSetSelNumb.Database                := DB;
    DataSetSelNumb.Transaction             := Transaction;

    DataSetBalances.Database               := DB;
    DataSetBalances.Transaction            := Transaction;

    StoredProc.Database                    := DB;
    StoredProc.Transaction                 := Transaction;

    ClientDSet.Database                    := DB;
    ClientDSet.Transaction                 := Transaction;

    TypeStreetDSet.Database                := DB;
    TypeStreetDSet.Transaction             := Transaction;

    RegionDSet.Database                    := DB;
    RegionDSet.Transaction                 := Transaction;

    StreetDSet.Database                    := DB;
    StreetDSet.Transaction                 := Transaction;

    CityAreaDSet.Database                  := DB;
    CityAreaDSet.Transaction               := Transaction;

    FamDSet.Database                       := DB;
    FamDSet.Transaction                    := Transaction;

    ImyaDSet.Database                      := DB;
    ImyaDSet.Transaction                   := Transaction;

    PatrDSet.Database                      := DB;
    PatrDSet.Transaction                   := Transaction;

    CashTypeDSet.Database                  := DB;
    CashTypeDSet.Transaction               := Transaction;

    KodKassaAppDSet.Database               := DB;
    KodKassaAppDSet.Transaction            := Transaction;

    KassaAppDSet.Database                  := DB;
    KassaAppDSet.Transaction               := Transaction;

    DataSetGrRoot.Database                 := DB;
    DataSetGrRoot.Transaction              := Transaction;

    DataSetCheckErr.Database               := DB;
    DataSetCheckErr.Transaction            := Transaction;

    Transaction.StartTransaction;

    DataSetGrRoot.Close;
    DataSetGrRoot.SQLs.SelectSQL.Text := 'select id_gr_list_cash_type_root,id_gr_list_kassa_app_root  from bs_consts';
    DataSetGrRoot.Open;

    id_cash_type_root              :=  DataSetGrRoot.FBN('id_gr_list_cash_type_root').AsInteger;
    id_kassa_app_root              :=  DataSetGrRoot.FBN('id_gr_list_kassa_app_root').AsInteger;

    if m = Add then
    begin
        ///TabSheetpack
        Caption                    := '';
        DateEdit.Date              := date;

        Add_by_hand_pack           := myform.add_by_hand;

        if(myform.add_by_hand=1) then
        begin
             TextEditNameFile.Text      := 'Пачка додана вручну';
             id_dt_pack                 := db.gen_id('GEN_BS_ID_DT_PACK',1);
             cxComboBoxMonth.ItemIndex  := monthOf(date)-1;
             cxSpinEditYear.Value       := YearOf(date);
             ComboBoxProp.ItemIndex     := 0;
             type_doc                   := 2;
        end else
        begin

            id_dt_pack                  := myform.id_dt_pack;
            TextEditNumb.Text           := myform.DataSetPack.fbn('numb_pack').AsString;
            TextEditNameFile.Text       := myform.DataSetPack.fbn('name_file_import').AsString;
            DateEdit.Date               := myform.DataSetPack.fbn('date_current').AsDateTime;
            TextEditCountRec.Text       := myform.DataSetPack.fbn('all_count_rec_pack').AsString;
            TextEditSum.Text            := myform.DataSetPack.fbn('all_sum_opl_pack').AsString;
            
            cxComboBoxMonth.ItemIndex   := myform.DataSetPack.fbn('month_int').AsInteger-1;
            cxSpinEditYear.Value        := myform.DataSetPack.fbn('year_int').AsInteger;
            type_doc                    := myform.DataSetPack.fbn('id_doc_prop').AsInteger;
            if(type_doc=2) then
                 ComboBoxProp.ItemIndex     := 0
            else
            if(type_doc=4) then
                 ComboBoxProp.ItemIndex     := 1;
        end;

        DataSetSelNumb.Close;
        DataSetSelNumb.SQLs.SelectSQL.Text := 'select max(numb_pack) as numb_pack from bs_dt_pack';
        DataSetSelNumb.Open;
        try numb_pack              := DataSetSelNumb.FBN('numb_pack').AsInteger; except numb_pack:= 0 end;
        TextEditNumb.Text          := IntToStr(numb_pack+1);


        DateEditBegPeriod.date     := date;
        DateEditEndPeriod.date     := date;
        PackUnsign;
    end;
    if ((m = change) or (m=view)) then
    begin
        Caption                    := '';
        ///TabSheetpack
        id_dt_pack                 := strtoint64(myform.DataSetPack.fbn('id_dt_pack').AsString);
        TextEditNumb.Text          := myform.DataSetPack.fbn('numb_pack').AsString;
        TextEditNameFile.Text      := myform.DataSetPack.fbn('name_file_import').AsString;
        DateEdit.Date              := myform.DataSetPack.fbn('date_current').AsDateTime;
        TextEditCountRec.Text      := myform.DataSetPack.fbn('all_count_rec_pack').AsString;
        TextEditSum.Text           := myform.DataSetPack.fbn('all_sum_opl_pack').AsString;
        Add_by_hand_pack           := myform.DataSetPack.fbn('add_by_hand').AsInteger;
        cxComboBoxMonth.ItemIndex  := myform.DataSetPack.fbn('month_int').AsInteger-1;
        cxSpinEditYear.Value       := myform.DataSetPack.fbn('year_int').AsInteger;
        type_doc                   := myform.DataSetPack.fbn('id_doc_prop').AsInteger;
        if(type_doc=2) then
             ComboBoxProp.ItemIndex     := 0
        else
        if(type_doc=4) then
             ComboBoxProp.ItemIndex     := 1;

        if (myform.DataSetPack.fbn('is_signed').AsInteger=1) then
        begin
             PackSign;
        end
        else
        if ((myform.DataSetPack.fbn('is_signed').AsInteger=0)and(m = change)) then
        begin
             PackUnSign;
        end
        else
        if ((myform.DataSetPack.fbn('is_signed').AsInteger=0)and(m = view)) then
        begin
             PackSign;
        end;

    end;

    DataSetPersAcc.Close;
    DataSetPersAcc.SQLs.SelectSQL.Text := 'select * from BS_ALLOCATION_ACCOUNT_FILTER('''+inttostr(ID_DT_PACK)+''',null'+',null'+',null'+',null'+',null'+',null'+',null'+',null'+',null'+',null'+',null'+',null'+',null'+',null'+',null'+',null'+',null'+')';
    DataSetPersAcc.Open;


    DataSetBalances.Close;
    DataSetBalances.SQLs.SelectSQL.Text := 'select * from BS_PAYMENT_CURRENT_SEL(?ID_DT_ALLOC_PERS_AC)';;
    DataSetBalances.Open;

    if (myform.flag_visible_er=1) then
    begin
        PageControl.ActivePage                                  := TabSheetErr;
        DataSetCheckErr.Close;
        DataSetCheckErr.SQLs.SelectSQL.Text                     := 'select * from BS_SELECT_ERRORS_PACK_SIGN(:IN_ID_DT_PACK)';
        DataSetCheckErr.ParamByName('IN_ID_DT_PACK').AsInt64    := id_dt_pack;
        DataSetCheckErr.Open;
    end
    else
    begin
        TabSheetErr.TabVisible := false
    end;

    FlagAnnul;
   // Format.DecimalSeparator:='.';
    BarManager.BarByName('FilterPanel').Visible:=(PageControl.ActivePage=TabSheetPersAcc);
    
end;

procedure TfrmImportPersAcc.PackSign;
begin
    LabelSign.caption          := 'Пачка підписана';
    LabelSign.Style.Font.Color := clGreen;
    ToolButtonSign.Enabled     := false;
    ToolButtonUnSign.Enabled   := true;
    ToolButtonadd.Enabled      := false;
    ToolButtonEdit.Enabled     := false;
    ToolButtonDel.Enabled      := false;
    ToolButtonBalan.Enabled    := false;
    is_signed                  := 1;

end;

procedure TfrmImportPersAcc.PackUnSign;
begin
    LabelSign.caption          := 'Пачка не підписана';
    LabelSign.Style.Font.Color := clBlack;
    ToolButtonSign.Enabled     := true;
    ToolButtonUnSign.Enabled   := false;
    ToolButtonadd.Enabled      := true;
    ToolButtonEdit.Enabled     := true;
    ToolButtonDel.Enabled      := true;
    ToolButtonBalan.Enabled    := true;
    is_signed                  := 0;
end;

procedure TfrmImportPersAcc.FlagAnnul;
begin
      flag_numb              := 0;
      flag_name_file         := 0;
      flag_date              := 0;
      flag_name_Prop         := 0;
      flag_name_month        := 0;
      flag_name_year         := 0;
      flag_count_rec         := 0;
      flag_count_sum         := 0;
end;

procedure TfrmImportPersAcc.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfrmImportPersAcc.ClientDSetCloseOpen;
begin
   if ClientDSet.Active then ClientDSet.Close;
   ClientDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CLIENT_ACC_FILTER(:FILTER_STR)';
   ClientDSet.ParamByName('FILTER_STR').AsString:=BsPersAccBox.EditText;
   ClientDSet.Open;
end;


procedure TfrmImportPersAcc.TextEditNameFileKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Add_by_hand_pack=0)or(flag=view)) then
     key := chr(0);
end;

procedure TfrmImportPersAcc.SavePack;
var
    mes      : string;
    flag_mes : boolean;
begin
    if(is_signed=1) then exit;

    mes := '';
    flag_mes := false;

    if (ComboBoxProp.ItemIndex=0) then type_doc :=2;
    if (ComboBoxProp.ItemIndex=1) then type_doc :=4;

    //проверка на корректность данных
    if TextEditNumb.Text = '' then
    begin
        if not flag_mes then
        begin
            MES := 'Введіть номер пачки ';
        end else
            MES := mes + ' ' + 'Введіть номер пачки  ';
        TextEditNumb.style.Color := clred;
        FLAG_mes := TRUE;
    end else
        TextEditNumb.style.Color := $00FFFBF0;

   if flag_mes then
    begin
        showmessage(mes);
        exit;
    end;

   if ((Flag = Add) and (flag_add_change=0)) then
   begin
       Transaction.StartTransaction;
       try
            StoredProc.StoredProcName := 'BS_DT_PACK_INS';

            StoredProc.Prepare;
            StoredProc.ParamByName('ID_DT_PACK').AsInt64                := id_dt_pack;
            StoredProc.ParamByName('NAME_FILE_IMPORT').AsString         := TextEditNameFile.Text;
            StoredProc.ParamByName('DATE_CURRENT').AsDate               := dateEdit.Date;
            if(TextEditCountRec.Text='')  then
                StoredProc.ParamByName('ALL_COUNT_REC_PACK').AsVariant  := null
            else
                StoredProc.ParamByName('ALL_COUNT_REC_PACK').AsVariant  := strtoint(TextEditCountRec.Text);
            if(TextEditSum.Text='')  then
                 StoredProc.ParamByName('all_sum_opl_pack').AsVariant   := null
            else
                 StoredProc.ParamByName('all_sum_opl_pack').AsVariant   := strtofloat(TextEditSum.Text);
            StoredProc.ParamByName('NUMB_PACK').AsInt64                 := StrToInt64(TextEditNumb.Text);
            StoredProc.ParamByName('ADD_BY_HAND').AsInteger             := 1;
            StoredProc.ParamByName('MONTH_IN').AsInteger                := cxComboBoxMonth.ItemIndex+1;
            StoredProc.ParamByName('YEAR_IN').AsInteger                 := cxSpinEditYear.Value;
            StoredProc.ParamByName('ID_DOC_PROP').AsInteger             := type_doc;
            StoredProc.ExecProc;

            Transaction.Commit;
            myform.ActionRefreshExecute(myform);
            myform.DataSetPack.Locate('ID_DT_PACK', id_dt_pack, []);
            except
            begin
                Transaction.Rollback;
                Showmessage('При додаванні виникла помилка');
                exit;
            end;
        end;
   end;
   if ((Flag = Change) or(flag_add_change=1)) then
   begin
       Transaction.StartTransaction;
       try
            StoredProc.StoredProcName := 'BS_DT_PACK_UPD';

            StoredProc.Prepare;
            StoredProc.ParamByName('ID_DT_PACK').AsInt64                := id_dt_pack;
            StoredProc.ParamByName('NUMB_PACK').AsInt64                 := StrToInt64(TextEditNumb.Text);
            StoredProc.ParamByName('NAME_FILE_IMPORT').AsString         := TextEditNameFile.Text;
            StoredProc.ParamByName('DATE_CURRENT').AsDate               := dateEdit.Date;
            if(TextEditCountRec.Text='')  then
                StoredProc.ParamByName('ALL_COUNT_REC_PACK').AsVariant  := null
            else
                StoredProc.ParamByName('ALL_COUNT_REC_PACK').AsVariant  := strtoint(TextEditCountRec.Text);
            if(TextEditSum.Text='')  then
                 StoredProc.ParamByName('all_sum_opl_pack').AsVariant   := null
            else
                 StoredProc.ParamByName('all_sum_opl_pack').AsVariant   := strtofloat(TextEditSum.Text);
            StoredProc.ParamByName('IS_SIGNED').AsInteger               := 0;
            StoredProc.ParamByName('MONTH_IN').AsInteger                := cxComboBoxMonth.ItemIndex+1;
            StoredProc.ParamByName('YEAR_IN').AsInteger                 := cxSpinEditYear.Value;
            StoredProc.ParamByName('ID_DOC_PROP').AsInteger             := type_doc;

            StoredProc.ExecProc;
            Transaction.Commit;
            //myform.Action1Execute(Sender);
            myform.DataSetPack.Locate('id_dt_pack', id_dt_pack, []);
       except
            begin
                Transaction.Rollback;
                Showmessage('При редагуванні виникла помилка');
                exit;
            end;
       end;
   end;

end;

procedure TfrmImportPersAcc.ActionNextExecute(Sender: TObject);
var
    AnswId : Integer;
begin
    flag_button :=1;
    if PageControl.ActivePage = TabSheetPack then
    begin
        if((flag_numb=1) or(flag_name_file = 1)or (flag_date = 1)or (flag_name_Prop = 1)or (flag_name_month = 1)or (flag_name_year = 1)or (flag_count_rec = 1)or (flag_count_sum = 1)or((flag = add)or (flag = change)and(flag_add_change<>1))and(is_signed=0)) then
        begin
            AnswId :=MessageBox(Handle, Pchar('Зберігти зміни у пачці?'), Pchar('Увага!'), MB_YESNOCANCEL);
            if AnswId = ID_Yes  then
            begin
                SavePack;
                flag_add_change        := 1;
                FlagAnnul;
                PageControl.ActivePage := TabSheetPersAcc;
            end else
            if AnswId = ID_No  then
            begin
                PackInfoAnnul(flag);
                PageControl.ActivePage := TabSheetPersAcc;
            end;
        end else
        begin
            PageControl.ActivePage := TabSheetPersAcc;

        end;
    end else
    if PageControl.ActivePage = TabSheetPersAcc then
    begin
        if(TabSheetErr.TabVisible=true) then
             PageControl.ActivePage := TabSheetErr
        else
        if(TabSheetErr.TabVisible=false) then
             PageControl.ActivePage := TabSheetPack
    end else
    if PageControl.ActivePage = TabSheetErr then
    begin
        PageControl.ActivePage := TabSheetPack
    end;
    flag_button :=0;
end;

procedure TfrmImportPersAcc.ActionBackExecute(Sender: TObject);
var
    AnswId : Integer;
begin
    if PageControl.ActivePage = TabSheetPack then
    begin
        if(TabSheetErr.TabVisible=true) then
        begin
            if((flag_numb=1) or(flag_name_file = 1)or (flag_date = 1)or (flag_name_Prop = 1)or (flag_name_month = 1)or (flag_name_year = 1)or (flag_count_rec = 1)or (flag_count_sum = 1)or(((flag = add)or(flag = change))and(flag_add_change<>1)and(myform.add_by_hand<>0))and(is_signed=0)) then
            begin
                AnswId :=MessageBox(Handle, Pchar('Зберігти зміни у даних про пачку?'), Pchar('Увага!'), MB_YESNOCANCEL);
                if AnswId = ID_Yes  then
                begin
                    SavePack;
                    flag_add_change :=1;
                    FlagAnnul;
                    PageControl.ActivePage := TabSheetErr;
                end else
                if AnswId = ID_No  then
                begin
                    PackInfoAnnul(flag);
                    PageControl.ActivePage := TabSheetErr;
                end;
            end else
            begin
                PageControl.ActivePage := TabSheetErr;
            end
        end
        else
        if(TabSheetErr.TabVisible=false) then
        begin
            if((flag_numb=1) or(flag_name_file = 1)or (flag_date = 1)or (flag_name_Prop = 1)or (flag_name_month = 1)or (flag_name_year = 1)or (flag_count_rec = 1)or (flag_count_sum = 1)or(flag = add)and(is_signed<>1)) then
            begin
                AnswId :=MessageBox(Handle, Pchar('Зберігти зміни у даних про пачку?'), Pchar('Увага!'), MB_YESNOCANCEL);
                if AnswId = ID_Yes  then
                begin
                    SavePack;
                    PageControl.ActivePage := TabSheetPersAcc;
                end else
                if AnswId = ID_No  then
                begin
                     PackInfoAnnul(flag);
                     PageControl.ActivePage := TabSheetPersAcc;
                end;
            end else
            begin
                PageControl.ActivePage := TabSheetPersAcc;
            end;
        end;
    end else
    if PageControl.ActivePage = TabSheetErr then
    begin
        PageControl.ActivePage := TabSheetPersAcc
    end else
    if PageControl.ActivePage = TabSheetPersAcc then
    begin
        PageControl.ActivePage := TabSheetPack
    end;
end;

procedure TfrmImportPersAcc.TextEditNumbKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Ord(Key) <> VK_ESCAPE)
    then
        Key := Chr(0)
end;

procedure TfrmImportPersAcc.TextEditNumbPropertiesChange(Sender: TObject);
begin
   flag_numb :=1;
end;

procedure TfrmImportPersAcc.DateEditPropertiesChange(Sender: TObject);
begin
    flag_date := 1;
end;

procedure TfrmImportPersAcc.TextEditNameFilePropertiesChange(
  Sender: TObject);
begin
    flag_name_file := 1;
end;

procedure TfrmImportPersAcc.TabSheetPackHide(Sender: TObject);
var  AnswId : integer;
begin
    if(flag_button=0) then
    begin
        if((flag_numb=1) or(flag_name_file = 1)or (flag_date = 1)or (flag_name_Prop = 1)or (flag_name_month = 1)or (flag_name_year = 1)or (flag_count_rec = 1)or (flag_count_sum = 1)or(((flag = add)or(flag = change))and(flag_add_change<>1)and(myform.add_by_hand<>0))and(is_signed=0)) then
        begin
            AnswId :=MessageBox(Handle, Pchar('Зберігти зміни у даних про пачку?'), Pchar('Увага!'), MB_YESNOCANCEL);
            if AnswId = ID_Yes  then
            begin
                SavePack;
                flag_add_change        := 1;
                FlagAnnul;
            end else
            begin
                PackInfoAnnul(flag);
            end;
        end;
    end;
end;

procedure TfrmImportPersAcc.PackInfoAnnul(flag_add :TfmAddMode);
begin
    if ((flag = Add)and(Add_by_hand_pack<>0)and(flag_add_change<>1)) then
    begin
        DateEdit.Date                   := date;

        Add_by_hand_pack                := myform.add_by_hand;

        if(myform.add_by_hand=1) then
        begin
             TextEditNameFile.Text      := 'Пачка додана вручну';
             TextEditCountRec.Text      := '';
             TextEditSum.Text           := '';
             cxComboBoxMonth.ItemIndex  := monthOf(date)-1;
             cxSpinEditYear.Value       := YearOf(date);;
             type_doc                   := 2;
             ComboBoxProp.ItemIndex     := 0
        end else
        begin

        end;

        DataSetSelNumb.Close;
        DataSetSelNumb.SQLs.SelectSQL.Text := 'select max(numb_pack) as numb_pack from bs_dt_pack';
        DataSetSelNumb.Open;
        try numb_pack := DataSetSelNumb.FBN('numb_pack').AsInteger; except numb_pack:= 0 end;
        TextEditNumb.Text := IntToStr(numb_pack+1);
    end;
    if ((flag = change)or(Add_by_hand_pack=0)or(flag_add_change=1)) then
    begin
        id_dt_pack                    := strtoint64(myform.DataSetPack.fbn('id_dt_pack').AsString);
        TextEditNumb.Text             := myform.DataSetPack.fbn('numb_pack').AsString;
        TextEditNameFile.Text         := myform.DataSetPack.fbn('name_file_import').AsString;
        DateEdit.Date                 := myform.DataSetPack.fbn('date_current').AsDateTime;
        TextEditCountRec.Text         := myform.DataSetPack.fbn('all_count_rec_pack').AsString;
        TextEditSum.Text              := myform.DataSetPack.fbn('all_sum_opl_pack').AsString;
        Add_by_hand_pack              := myform.DataSetPack.fbn('add_by_hand').AsInteger;
        cxComboBoxMonth.ItemIndex     := myform.DataSetPack.fbn('month_int').AsInteger-1;
        cxSpinEditYear.Value          := myform.DataSetPack.fbn('year_int').AsInteger;
        type_doc                      := myform.DataSetPack.fbn('id_doc_prop').AsInteger;

        if(type_doc=2) then
             ComboBoxProp.ItemIndex   := 0
        else
        if(type_doc=4) then
             ComboBoxProp.ItemIndex   := 1;

        if (myform.DataSetPack.fbn('is_signed').AsInteger=1) then
        begin
             PackSign;
        end
        else
        begin
             PackUnSign;
        end;

    end;
    FlagAnnul;
end;

procedure TfrmImportPersAcc.ActionSaveExecute(Sender: TObject);
var
    Id_dt_acc_loc : int64;
begin
    if (flag_add_change_acc=1) then
    begin
         Transaction.StartTransaction;
         try
              StoredProc.StoredProcName := 'BS_DT_ALLOCATION_ACCOUNTS_INS';
              StoredProc.Prepare;

              StoredProc.ParamByName('ID_PERSONAL_ACCOUNT').AsInteger   := id_pers_acc;
              StoredProc.ParamByName('SUM_OPL').AsCurrency              := TextEditSumAcc.EditValue;
              StoredProc.ParamByName('DATE_OPL').AsDate                 := date;
              StoredProc.ParamByName('DATE_OBR').AsDate                 := date;
              StoredProc.ParamByName('ID_CASH_TYPE').AsInteger          := BoxTypeCash.EditValue;
              StoredProc.ParamByName('ID_KASSA_APP').AsInteger          := BoxKassApp.EditValue;
              StoredProc.ParamByName('ID_REC_BUFF').AsVariant           := 0;
              StoredProc.ParamByName('ID_DT_PACK').AsInteger            := id_dt_pack;
              StoredProc.ParamByName('DATE_BEG_PERIOD_FOR_ACC').AsDate  := DateEditBegPeriod.Date;
              StoredProc.ParamByName('DATE_END_PERIOD_FOR_ACC').AsDate  := DateEditEndPeriod.Date;
              StoredProc.ExecProc;

              Transaction.Commit;

              myform.ActionRefreshExecute(Sender);
              ActionRefreshExecute(Sender);
              DataSetPersAcc.Locate('ID_DT_ALLOC_PERS_AC', DataSetPersAcc['ID_DT_ALLOC_PERS_AC'], []);

         except
             begin
                 Transaction.Rollback;
                 Showmessage('При додаванні виникла помилка');
                 exit;
             end;
         end;
    end else
    if (flag_add_change_acc=2) then
    begin
         StoredProc.Database                             := DB;
         StoredProc.Transaction                          := Transaction;
         Transaction.StartTransaction;
         try
              StoredProc.StoredProcName := 'BS_DT_ALLOCATION_ACCOUNTS_UPD';
              StoredProc.Prepare;

              StoredProc.ParamByName('ID_DT_ALLOC_PERS_AC').AsInteger   := DataSetPersAcc['ID_DT_ALLOC_PERS_AC'];
              StoredProc.ParamByName('ID_PERSONAL_ACCOUNT').AsInteger   := id_pers_acc;
              StoredProc.ParamByName('SUM_OPL').AsCurrency              := StrToCurr(TextEditSumAcc.Text);
              StoredProc.ParamByName('DATE_OPL').AsDate                 := date;
              StoredProc.ParamByName('DATE_OBR').AsDate                 := date;
              StoredProc.ParamByName('ID_CASH_TYPE').AsInteger          := BoxTypeCash.EditValue;
              StoredProc.ParamByName('ID_KASSA_APP').AsInteger          := BoxKassApp.EditValue;
              StoredProc.ParamByName('ID_REC_BUFF').AsInteger           := DataSetPersAcc['ID_REC_BUFF'];
              StoredProc.ParamByName('ID_DT_PACK').AsInteger            := id_dt_pack;;
              StoredProc.ParamByName('DATE_BEG_PERIOD_FOR_ACC').AsDate  := DateEditBegPeriod.Date;
              StoredProc.ParamByName('DATE_END_PERIOD_FOR_ACC').AsDate  := DateEditEndPeriod.Date;

              StoredProc.ExecProc;
              Id_dt_acc_loc  := DataSetPersAcc['ID_DT_ALLOC_PERS_AC'];
              Transaction.Commit;

              ActionRefreshExecute(Sender);
              DataSetPersAcc.Locate('ID_DT_ALLOC_PERS_AC', Id_dt_acc_loc, []);
              myform.ActionRefreshExecute(Sender);

         except
             begin
                 Transaction.Rollback;
                 Showmessage('При редагуванні виникла помилка');
                 exit;
             end;
         end;
    end;
    EditEnabledtrue;
end;

procedure TfrmImportPersAcc.ActionCancelExecute(Sender: TObject);
begin
   EditEnabledtrue;

end;

procedure TfrmImportPersAcc.ActionAddPersAccExecute(Sender: TObject);
begin
    ToolButtonEdit.Enabled   := false;
    ToolButtonDel.Enabled    := false;
    DateEditBegPeriod.Date   := date;
    DateEditEndPeriod.Date   := date;
    ClearAllEdits;
    EditEnabledFalse;
    flag_add_change_acc      := 1;
end;

procedure TfrmImportPersAcc.EditEnabledFalse;
begin
    PanelButtons.Visible     := true;
    ToolButtonBalan.Enabled  := false;
    FamiliyaBox.Enabled      := false;
    ImyaBox.Enabled          := false;
    PatronomycBox.Enabled    := false;
    BsRegionBox.Enabled      := false;
    CityAreaBox.Enabled      := false;
    TypeStreetBox.Enabled    := false;
    StreetBox.Enabled        := false;
    HouseEdit.Enabled        := false;
    KorpusEdit.Enabled       := false;
    TextEditFlat.Enabled     := false;
    BoxKasKod.Enabled        := false;
end;

procedure TfrmImportPersAcc.EditEnabledtrue;
begin
    PanelButtons.Visible     := false;
    ToolButtonAdd.Enabled    := true;
    ToolButtonEdit.Enabled   := true;
    ToolButtonDel.Enabled    := true;
    ToolButtonBalan.Enabled  := true;
    FamiliyaBox.Enabled      := true;
    ImyaBox.Enabled          := true;
    PatronomycBox.Enabled    := true;
    BsRegionBox.Enabled      := true;
    CityAreaBox.Enabled      := true;
    TypeStreetBox.Enabled    := true;
    StreetBox.Enabled        := true;
    HouseEdit.Enabled        := true;
    KorpusEdit.Enabled       := true;
    TextEditFlat.Enabled     := true;
    BoxKasKod.Enabled        := true;
end;

procedure TfrmImportPersAcc.ActionEditPersAccExecute(Sender: TObject);
begin
    ToolButtonAdd.Enabled    := false;
    ToolButtonDel.Enabled    := false;
    DateEditBegPeriod.Date   := date;
    DateEditEndPeriod.Date   := date;
    EditEnabledFalse;
    flag_add_change_acc      := 2;
    {id_rec_buff              := DataSetPersAcc['ID_REC_BUFF'];
    FamiliyaBox.EditText     := DataSetPersAcc['FAMILIYA'];
    ImyaBox.EditText         := DataSetPersAcc['IMYA'];
    PatronomycBox.EditText   := DataSetPersAcc['OTCH'];
    TextEditSumAcc.Text      := DataSetPersAcc['SUM_OPL'];
    BsPersAccBox.EditText    := DataSetPersAcc['CLIENT_ACCOUNT'];
    BoxTypeCash.EditText     := DataSetPersAcc['NAME_CASH_TYPE'];
    DateEditBegPeriod.Date   := DataSetPersAcc['DATE_BEG_PERIOD_FOR_ACC'];
    DateEditEndPeriod.Date   := DataSetPersAcc['DATE_END_PERIOD_FOR_ACC'];
    BoxKasKod.EditText       := DataSetPersAcc['NOTE_KASSA_APP'];
    BoxKassApp.EditText      := DataSetPersAcc['NAME_KASSA_APP'];
  //BsRegionBox.EditText   := DataSetPersAcc['NAME_REGION'];
    CityAreaBox.EditText     := DataSetPersAcc['NAME_CITY_AREA'];
    TypeStreetBox.EditText   := DataSetPersAcc['NAME_TYPE_STREET'];
    StreetBox.EditText       := DataSetPersAcc['NAME_STREET'];
    HouseEdit.Text           := DataSetPersAcc['HOUSE'];
    KorpusEdit.Text          := DataSetPersAcc['KORPUS'];
    TextEditFlat.Text        := DataSetPersAcc['NUM_FLAT'];}

end;
procedure TfrmImportPersAcc.ClearAllEdits;
begin

    DateEditBegPeriod.date   := strtodate('01.01.1899');
    DateEditEndPeriod.date   := strtodate('01.01.1899');
    //EditEnabledFalse;
    id_rec_buff              := 0;
    id_pers_acc              := 0;
    BoxKassApp.EditValue     := null;
    BoxKasKod.EditValue      := null;
    BoxTypeCash.EditValue    := null;
    BsPersAccBox.EditValue   := null;
    BsRegionBox.EditValue    := null;
    CityAreaBox.EditValue    := null;
    FamiliyaBox.EditValue    := null;
    ImyaBox.EditValue        := null;
    PatronomycBox.EditValue  := null;
    TypeStreetBox.EditValue  := null;
    StreetBox.EditValue      := null;
    if RegionDSet.Active then RegionDSet.Close;
    if CityAreaDSet.Active then CityAreaDSet.Close;
    if FamDSet.Active then FamDSet.Close;
    if ImyaDSet.Active then ImyaDSet.Close;
    if ClientDSet.Active then ClientDSet.Close;
    if TypeStreetDSet.Active then TypeStreetDSet.Close;
    if StreetDSet.Active then StreetDSet.Close;
    if CashTypeDSet.Active then CashTypeDSet.Close;
    if KassaAppDSet.Active then KassaAppDSet.Close;
    if KodKassaAppDSet.Active then KodKassaAppDSet.Close;
    TextEditSumAcc.Text      := '';
    HouseEdit.Text           := '';
    KorpusEdit.Text          := '';
    TextEditFlat.Text        := '';

end;

procedure TfrmImportPersAcc.ActionDelPersAccExecute(Sender: TObject);
var
     i : byte;
begin
     i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], 'Ви дійсно бажаєте видалити '+' '+'?', mtConfirmation, [mbYes, mbNo]);
     if ((i = 7) or (i= 2)) then exit;
     Transaction.StartTransaction;
     try
          StoredProc.StoredProcName := 'BS_DT_ALLOCATION_ACCOUNTS_DEL';
          StoredProc.Prepare;

          StoredProc.ParamByName('id_dt_alloc_pers_ac').AsInteger    := DataSetPersAcc['ID_DT_ALLOC_PERS_AC'];
          StoredProc.ExecProc;

          Transaction.Commit;
          myform.ActionRefreshExecute(Sender);
          ActionRefreshExecute(Sender);
     except
         begin
             Transaction.Rollback;
             Showmessage('При видаленні виникла помилка');
             exit;
         end;
     end;
end;

procedure TfrmImportPersAcc.ActionBalanceExecute(Sender: TObject);
var
    T : TfrmGrBalances;
begin
    T := TfrmGrBalances.Create(Self, DB, Self);
    T.Show;
end;

procedure TfrmImportPersAcc.ActionRefreshExecute(Sender: TObject);
begin
     DataSetPersAcc.CloseOpen(true);
     DataSetBalances.CloseOpen(true);
end;

procedure TfrmImportPersAcc.GridAccDBViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if (AViewInfo.GridRecord.Values[5]=1) {and (not AViewInfo.GridRecord.Focused)} then
  begin //подписанные пачки
      ACanvas.Canvas.Font.color := RGB(250,0,0);//zelenii
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
end;

procedure TfrmImportPersAcc.TimerEnterTimer(Sender: TObject);
begin
    TimerEnter.Enabled:=False;
    case ContextInputType of
    0:
         begin
              ClientDSetCloseOpen;
              if not ClientDSet.IsEmpty then BsPersAccBox.DroppedDown:=True;
         end;
    1:
         begin
              FamDSet.Close;
              FamDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
              FamDSet.ParamByName('FILTER_STR').AsString             :=FamiliyaBox.EditText;
              FamDSet.ParamByName('RADIO_BTN').AsShort               :=0;
              FamDSet.ParamByName('IS_ADD').AsShort                  :=0;
              FamDSet.Open;
              if not FamDSet.IsEmpty then
              begin
                  FamiliyaBox.DroppedDown      := True;
              end;
          end;
      2:
          begin
              ImyaDSet.Close;
              ImyaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
              ImyaDSet.ParamByName('FILTER_STR').AsString            :=ImyaBox.EditText;
              ImyaDSet.ParamByName('RADIO_BTN').AsShort              :=1;
              ImyaDSet.ParamByName('IS_ADD').AsShort                 :=0;
              ImyaDSet.Open;
              if not ImyaDSet.IsEmpty then
              begin
                  ImyaBox.DroppedDown          :=True;
              end;
          end;
      3:
          begin
              PatrDSet.Close;
              PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
              PatrDSet.ParamByName('FILTER_STR').AsString            := PatronomycBox.EditText;
              PatrDSet.ParamByName('RADIO_BTN').AsShort              := 2;
              PatrDSet.ParamByName('IS_ADD').AsShort                 := 0;
              PatrDSet.Open;
              if not PatrDSet.IsEmpty then
              begin
                  PatronomycBox.DroppedDown    := True;
              end;
          end;
      4:
          begin
              CashTypeDSet.Close;
              CashTypeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR,:ID_ROOT_NODE,:RADIO_BTN)';
              CashTypeDSet.ParamByName('FILTER_STR').AsString        := BoxTypeCash.EditText;
              CashTypeDSet.ParamByName('ID_ROOT_NODE').AsInteger     := id_cash_type_root;
              CashTypeDSet.ParamByName('RADIO_BTN').AsInteger        := 0;
              CashTypeDSet.Open;
              if not CashTypeDSet.IsEmpty then
              begin
                  BoxTypeCash.DroppedDown     := True;
              end;
          end;
      5:
          begin
              KodKassaAppDSet.Close;
              KodKassaAppDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR,:ID_ROOT_NODE,:RADIO_BTN)';
              KodKassaAppDSet.ParamByName('FILTER_STR').AsString     := BoxKasKod.EditText;
              KodKassaAppDSet.ParamByName('ID_ROOT_NODE').AsInteger  := id_kassa_app_root;
              KodKassaAppDSet.ParamByName('RADIO_BTN').AsInteger     := 1;
              KodKassaAppDSet.Open;
              if not KodKassaAppDSet.IsEmpty then
              begin
                  BoxKasKod.DroppedDown  := True;
              end;
          end;
      6:
          begin
              KassaAppDSet.Close;
              KassaAppDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR,:ID_ROOT_NODE,:RADIO_BTN)';
              KassaAppDSet.ParamByName('FILTER_STR').AsString        := BoxKassApp.EditText;
              KassaAppDSet.ParamByName('ID_ROOT_NODE').AsInteger     := id_kassa_app_root;
              KassaAppDSet.ParamByName('RADIO_BTN').AsInteger        := 0;
              KassaAppDSet.Open;
              if not KassaAppDSet.IsEmpty then
              begin
                  BoxKassApp.DroppedDown    := True;
              end;

          end;
      7:
          begin
              RegionDSet.Close;
              RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_REGION_FILTER(:FILTER_STR)';
              RegionDSet.ParamByName('FILTER_STR').AsString          := BsRegionBox.EditText;
              RegionDSet.Open;
              if not RegionDSet.IsEmpty then
              begin
                  BsRegionBox.DroppedDown    := True;
              end;
          end;
      8:
          begin
              CityAreaDSet.Close;
              CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CITY_AREA_FILTER(:FILTER_STR)';
              CityAreaDSet.ParamByName('FILTER_STR').AsString        := CityAreaBox.EditText;
              CityAreaDSet.Open;
              if not CityAreaDSet.IsEmpty then
              begin
                  CityAreaBox.DroppedDown:=True;
              end;
          end;

      9:
          begin
              TypeStreetDSet.Close;
              TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_TYPE_STREET_FILTER(:FILTER_STR, :RADIO_BTN)';
              TypeStreetDSet.ParamByName('FILTER_STR').AsString      := TypeStreetBox.EditText;
              TypeStreetDSet.ParamByName('RADIO_BTN').AsShort        := 1;
              TypeStreetDSet.Open;
              if not TypeStreetDSet.IsEmpty then
              begin
                  TypeStreetBox.DroppedDown := True;
              end;
          end;
      10:
          begin
              StreetDSet.Close;
              StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_STREET_FILTER(:FILTER_STR)';
              StreetDSet.ParamByName('FILTER_STR').AsString          := StreetBox.EditText;
              StreetDSet.Open;
              if not StreetDSet.IsEmpty then
              begin
                  StreetBox.DroppedDown:=True;
              end;
              StreetBox.Properties.GridMode:=True;
          end;

   end;
end;

procedure TfrmImportPersAcc.BsPersAccBoxClick(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmImportPersAcc.BsPersAccBoxEnter(Sender: TObject);
begin
   TimerEnter.Enabled:=False;
end;

procedure TfrmImportPersAcc.BsPersAccBoxExit(Sender: TObject);
begin
   TimerEnter.Enabled := False;
   id_pers_acc        := ClientDSet['KOD_MACHINE'];
end;

procedure TfrmImportPersAcc.BsPersAccBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=0;
   if BsPersAccBox.EditText='' then
      if ClientDSet.Active then ClientDSet.Close;
   TimerEnter.Enabled:=not ((BsPersAccBox.EditText='') Or (Key=VK_RETURN));
end;

procedure TfrmImportPersAcc.BsPersAccBoxPropertiesInitPopup(
  Sender: TObject);
begin
   ClientDSetCloseOpen;
   id_pers_acc := ClientDSet['kod_machine'];
end;

procedure TfrmImportPersAcc.DataSetPersAccEndScroll(DataSet: TDataSet);
begin
    if DataSetPersAcc.IsEmpty then exit;

    id_rec_buff              := DataSetPersAcc['ID_REC_BUFF'];

    if ClientDSet.Active then ClientDSet.Close;
    ClientDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CLIENT_ACCOUNT_SEL_BY_ID(:ID_CLIENT_ACCOUNT)';
    ClientDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=DataSetPersAcc['ID_CLIENT_ACCOUNT'];
    ClientDSet.Open;
    BsPersAccBox.EditValue:=DataSetPersAcc['ID_CLIENT_ACCOUNT'];

    id_pers_acc := DataSetPersAcc['ID_PERSONAL_ACCOUNT'];

    if KassaAppDSet.Active then KassaAppDSet.Close;
    KassaAppDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
    KassaAppDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=DataSetPersAcc['id_kassa_app'];
    KassaAppDSet.Open;
    BoxKassApp.EditValue :=DataSetPersAcc['id_kassa_app'];

    if KodKassaAppDSet.Active then KodKassaAppDSet.Close;
    KodKassaAppDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
    KodKassaAppDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=DataSetPersAcc['id_kassa_app'];
    KodKassaAppDSet.Open;
    BoxKasKod.EditValue  :=DataSetPersAcc['id_kassa_app'];

    if CashTypeDSet.Active then CashTypeDSet.Close;
    CashTypeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
    CashTypeDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=DataSetPersAcc['id_cash_type'];
    CashTypeDSet.Open;
    BoxTypeCash.EditValue:=DataSetPersAcc['id_cash_type'];

    if FamDSet.Active then FamDSet.Close;
    FamDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FIO_BY_ID(:ID_CLIENT_ACCOUNT, :RADIO_BTN)';
    FamDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=DataSetPersAcc['ID_CLIENT_ACCOUNT'];
    FamDSet.ParamByName('RADIO_BTN').AsShort:=0;
    FamDSet.Open;
    FamiliyaBox.EditValue:=FamDSet['Out_Str'];

    if ImyaDSet.Active then ImyaDSet.Close;
    ImyaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FIO_BY_ID(:ID_CLIENT_ACCOUNT, :RADIO_BTN)';
    ImyaDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=DataSetPersAcc['ID_CLIENT_ACCOUNT'];
    ImyaDSet.ParamByName('RADIO_BTN').AsShort:=1;
    ImyaDSet.Open;
    ImyaBox.EditValue:=ImyaDSet['Out_Str'];

    if PatrDSet.Active then PatrDSet.Close;
    PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_FIO_BY_ID(:ID_CLIENT_ACCOUNT, :RADIO_BTN)';
    PatrDSet.ParamByName('ID_CLIENT_ACCOUNT').AsInteger:=DataSetPersAcc['ID_CLIENT_ACCOUNT'];
    PatrDSet.ParamByName('RADIO_BTN').AsShort:=2;
    PatrDSet.Open;
    PatronomycBox.EditValue:=PatrDSet['Out_Str'];

    {if RegionDSet.Active then RegionDSet.Close;
    RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_GROUP_LIST_OBJ_BY_ID(:ID_GR_LIST_OBJ)';
    RegionDSet.ParamByName('ID_GR_LIST_OBJ').AsInteger:=DataSetPersAcc['ID_REGION'];
    RegionDSet.Open;
    BsRegionBox.EditValue:=DataSetPersAcc['ID_REGION'];}

    if StreetDSet.Active then StreetDSet.Close;
    StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_STREET_BY_ID(:ID_STREET)';
    StreetDSet.ParamByName('ID_STREET').AsInteger:=DataSetPersAcc['ID_STREET'];
    StreetDSet.Open;
    StreetBox.EditValue:=DataSetPersAcc['ID_STREET'];

    if CityAreaDSet.Active then CityAreaDSet.Close;
    CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CITY_AREA_BY_ID(:ID_CITY_AREA)';
    CityAreaDSet.ParamByName('ID_CITY_AREA').AsInteger:=DataSetPersAcc['ID_CITY_AREA'];
    CityAreaDSet.Open;
    CityAreaBox.EditValue:=DataSetPersAcc['ID_CITY_AREA'];

    if TypeStreetDSet.Active then TypeStreetDSet.Close;
    TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM INI_TYPE_STREET WHERE ID_TYPE_STREET=:ID_TYPE';
    TypeStreetDSet.ParamByName('ID_TYPE').AsInteger:=DataSetPersAcc['ID_TYPE_STREET'];
    TypeStreetDSet.Open;
    TypeStreetBox.EditValue:=DataSetPersAcc['ID_TYPE_STREET'];


    if (DataSetPersAcc['SUM_OPL']<>null) then TextEditSumAcc.EditValue   := DataSetPersAcc['SUM_OPL']
    else TextEditSumAcc.EditValue   := '';


    if (DataSetPersAcc['DATE_BEG_PERIOD_FOR_ACC']<>null) then DateEditBegPeriod.Date   := DataSetPersAcc['DATE_BEG_PERIOD_FOR_ACC']
    else DateEditBegPeriod.Text  := '01.01.1899';

    if (DataSetPersAcc['DATE_END_PERIOD_FOR_ACC']<>null) then DateEditEndPeriod.Date   := DataSetPersAcc['DATE_END_PERIOD_FOR_ACC']
    else DateEditEndPeriod.Text  := '01.01.1899';

    if (DataSetPersAcc['HOUSE']<>null) then HouseEdit.Text   := DataSetPersAcc['HOUSE']
    else HouseEdit.Text   := '';

    if (DataSetPersAcc['KORPUS']<>null) then KorpusEdit.Text   := DataSetPersAcc['KORPUS']
    else KorpusEdit.Text   := '';

    if (DataSetPersAcc['NUM_FLAT']<>null) then TextEditFlat.Text   := DataSetPersAcc['NUM_FLAT']
    else TextEditFlat.Text   := '';
end;

procedure TfrmImportPersAcc.FamiliyaBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=1;
   if FamiliyaBox.EditText='' then
      if FamDSet.Active then FamDSet.Close;
   TimerEnter.Enabled:=not ((FamiliyaBox.EditText='') or (Key=VK_RETURN));
end;

procedure TfrmImportPersAcc.ImyaBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   ContextInputType:=2;
   if ImyaBox.EditText='' then
      if ImyaDSet.Active then ImyaDSet.Close;
   TimerEnter.Enabled:=not ((ImyaBox.EditText='') or (Key=VK_RETURN));
end;

procedure TfrmImportPersAcc.PatronomycBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=3;
   if PatronomycBox.EditText='' then
      if PatrDSet.Active then PatrDSet.Close;
   TimerEnter.Enabled:=not ((PatronomycBox.EditText='') or (Key=VK_RETURN));
end;


procedure TfrmImportPersAcc.BoxTypeCashKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   ContextInputType:=4;
   if BoxTypeCash.EditText='' then
      if CashTypeDSet.Active then CashTypeDSet.Close;
   TimerEnter.Enabled:=not ((BoxTypeCash.EditText='') Or (Key=VK_RETURN));
end;

procedure TfrmImportPersAcc.BoxKasKodKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   ContextInputType:=5;
   if BoxKasKod.EditText='' then
      if KodKassaAppDSet.Active then KodKassaAppDSet.Close;
   TimerEnter.Enabled:=not ((BoxKasKod.EditText='') Or (Key=VK_RETURN));
end;

procedure TfrmImportPersAcc.BoxKassAppKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   ContextInputType:=6;
   if BoxKassApp.EditText='' then
      if KassaAppDSet.Active then KassaAppDSet.Close;
   TimerEnter.Enabled:=not ((BoxKassApp.EditText='') Or (Key=VK_RETURN));
end;

procedure TfrmImportPersAcc.BsRegionBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   //if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblRegionClick(Self)
   //else
   begin
      ContextInputType:=7;
      if BsRegionBox.EditText='' then
         if RegionDSet.Active then RegionDSet.Close;
      TimerEnter.Enabled:=not (BsRegionBox.EditText='');
   end;
end;

procedure TfrmImportPersAcc.CityAreaBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   //if ((Key=VK_RETURN) and (ssCtrl in Shift)) then lblCItyAreaClick(Self)
   //else
   begin
      ContextInputType:=8;
      if CityAreaBox.EditText='' then
         if CityAreaDSet.Active then CityAreaDSet.Close;
      TimerEnter.Enabled:=not (CityAreaBox.EditText='');
   end;
end;

procedure TfrmImportPersAcc.TypeStreetBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    ContextInputType:=9;
    if TypeStreetBox.EditText='' then
       if TypeStreetDSet.Active then TypeStreetDSet.Close;
    TimerEnter.Enabled:=not (TypeStreetBox.EditText='');
end;

procedure TfrmImportPersAcc.StreetBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   //if ((Ord(Key)=VK_RETURN) and (ssCtrl in Shift)) then lblAdresClick(Sender)
  // else
   begin
      ContextInputType:=10;
      if StreetBox.EditText='' then
         if StreetDSet.Active then StreetDSet.Close;
      TimerEnter.Enabled:=not (StreetBox.EditText='');
   end;
end;

procedure TfrmImportPersAcc.FamiliyaBoxClick(Sender: TObject);
begin
    TimerEnter.Enabled:=False;
end;

procedure TfrmImportPersAcc.FamiliyaBoxEnter(Sender: TObject);
begin
    TimerEnter.Enabled:=False;
end;

procedure TfrmImportPersAcc.FamiliyaBoxExit(Sender: TObject);
begin
    TimerEnter.Enabled:=False;
end;

procedure TfrmImportPersAcc.FamiliyaBoxPropertiesInitPopup(
  Sender: TObject);
begin
   //if FamiliyaBox.EditText='' then
   //begin
      FamDSet.Close;
      FamDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      FamDSet.ParamByName('FILTER_STR').AsString:=FamiliyaBox.EditText;
      FamDSet.ParamByName('RADIO_BTN').AsShort:=0;
      FamDSet.ParamByName('IS_ADD').AsShort:=0;
      FamDSet.Open;
   //end;
end;

procedure TfrmImportPersAcc.ImyaBoxPropertiesInitPopup(Sender: TObject);
begin
   //if ImyaBox.EditText='' then
   //begin
      ImyaDSet.Close;
      ImyaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      ImyaDSet.ParamByName('FILTER_STR').AsString:=ImyaBox.EditText;
      ImyaDSet.ParamByName('RADIO_BTN').AsShort:=1;
      ImyaDSet.ParamByName('IS_ADD').AsShort:=0;
      ImyaDSet.Open;
   //end;
end;

procedure TfrmImportPersAcc.PatronomycBoxPropertiesInitPopup(
  Sender: TObject);
begin
   //if PatronomycBox.EditText='' then
   //begin
      PatrDSet.Close;
      PatrDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_FIO_FILTER(:FILTER_STR, :RADIO_BTN, :IS_ADD)';
      PatrDSet.ParamByName('FILTER_STR').AsString:=PatronomycBox.EditText;
      PatrDSet.ParamByName('RADIO_BTN').AsShort:=2;
      PatrDSet.ParamByName('IS_ADD').AsShort:=0;
      PatrDSet.Open;
   //end;
end;

procedure TfrmImportPersAcc.BoxTypeCashPropertiesInitPopup(
  Sender: TObject);
begin
     //if BoxTypeCash.EditText='' then
    // begin
         CashTypeDSet.Close;
         CashTypeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR,:ID_ROOT_NODE,:RADIO_BTN)';
         CashTypeDSet.ParamByName('FILTER_STR').AsString        := BoxTypeCash.EditText;
         CashTypeDSet.ParamByName('ID_ROOT_NODE').AsInteger     := id_cash_type_root;
         CashTypeDSet.ParamByName('RADIO_BTN').AsInteger        := 0;
         CashTypeDSet.Open;
   // end;
end;

procedure TfrmImportPersAcc.BoxKasKodPropertiesInitPopup(Sender: TObject);
begin
   // if BoxKasKod.EditText='' then
    // begin
         KodKassaAppDSet.Close;
         KodKassaAppDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR,:ID_ROOT_NODE,:RADIO_BTN)';
         KodKassaAppDSet.ParamByName('FILTER_STR').AsString    := BoxKasKod.EditText;
         KodKassaAppDSet.ParamByName('ID_ROOT_NODE').AsInteger := id_kassa_app_root;
         KodKassaAppDSet.ParamByName('RADIO_BTN').AsInteger    := 1;
         KodKassaAppDSet.Open;
    //end;
end;

procedure TfrmImportPersAcc.BoxKassAppPropertiesInitPopup(Sender: TObject);
begin
    //if BoxKassApp.EditText='' then
    // begin
         KassaAppDSet.Close;
         KassaAppDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_FILTER(:FILTER_STR,:ID_ROOT_NODE,:RADIO_BTN)';
         KassaAppDSet.ParamByName('FILTER_STR').AsString       := BoxKassApp.EditText;
         KassaAppDSet.ParamByName('ID_ROOT_NODE').AsInteger    := id_kassa_app_root;
         KassaAppDSet.ParamByName('RADIO_BTN').AsInteger       := 0;
         KassaAppDSet.Open;
end;

procedure TfrmImportPersAcc.BsRegionBoxPropertiesInitPopup(
  Sender: TObject);
begin
   //if BsRegionBox.EditText='' then
   //begin
      RegionDSet.Close;
      RegionDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_NAME_REGION_FILTER(:FILTER_STR)';
      RegionDSet.ParamByName('FILTER_STR').AsString:=BsRegionBox.EditText;
      RegionDSet.Open;
   //end;
end;

procedure TfrmImportPersAcc.CityAreaBoxPropertiesInitPopup(
  Sender: TObject);
begin
   //if CityAreaBox.EditText='' then
   //begin
       CityAreaDSet.Close;
       CityAreaDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CITY_AREA_FILTER(:FILTER_STR)';
       CityAreaDSet.ParamByName('FILTER_STR').AsString:=CityAreaBox.EditText;
       CityAreaDSet.Open;
  // end;
end;

procedure TfrmImportPersAcc.TypeStreetBoxPropertiesInitPopup(
  Sender: TObject);
begin
   //if TypeStreetBox.EditText='' then
  // begin
      TypeStreetDSet.Close;
      TypeStreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_TYPE_STREET_FILTER(:FILTER_STR, :RADIO_BTN)';
      TypeStreetDSet.ParamByName('FILTER_STR').AsString:=TypeStreetBox.EditText;
      TypeStreetDSet.ParamByName('RADIO_BTN').AsShort:=1;
      TypeStreetDSet.Open;
   //end;
end;

procedure TfrmImportPersAcc.StreetBoxPropertiesInitPopup(Sender: TObject);
begin
   //if StreetBox.EditText='' then
   //begin
      StreetDSet.Close;
      StreetDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_STREET_FILTER(:FILTER_STR)';
      StreetDSet.ParamByName('FILTER_STR').AsString:=StreetBox.EditText;
      StreetDSet.Open;
   //end;
end;


procedure TfrmImportPersAcc.BoxTypeCashExit(Sender: TObject);
begin
    TimerEnter.Enabled    := False;
end;

procedure TfrmImportPersAcc.BsRegionBoxExit(Sender: TObject);
begin
    TimerEnter.Enabled    := False;
end;

procedure TfrmImportPersAcc.CityAreaBoxExit(Sender: TObject);
begin
    TimerEnter.Enabled    := False;
end;

procedure TfrmImportPersAcc.TypeStreetBoxExit(Sender: TObject);
begin
    TimerEnter.Enabled    := False;
end;

procedure TfrmImportPersAcc.StreetBoxExit(Sender: TObject);
begin
    TimerEnter.Enabled    := False;
end;

procedure TfrmImportPersAcc.BoxKassAppExit(Sender: TObject);
begin
    TimerEnter.Enabled    := False;
end;

procedure TfrmImportPersAcc.BoxKasKodExit(Sender: TObject);
begin
     TimerEnter.Enabled := False;
end;

procedure TfrmImportPersAcc.ImyaBoxExit(Sender: TObject);
begin
     TimerEnter.Enabled := False;
end;

procedure TfrmImportPersAcc.PatronomycBoxExit(Sender: TObject);
begin
    TimerEnter.Enabled := False;
end;

procedure TfrmImportPersAcc.BoxTypeCashEnter(Sender: TObject);
begin
    TimerEnter.Enabled    := False;
end;

procedure TfrmImportPersAcc.ActionSignExecute(Sender: TObject);
begin
    DataSetCheckErr.Close;
    DataSetCheckErr.SQLs.SelectSQL.Text                     := 'select * from BS_SELECT_ERRORS_PACK_SIGN(:IN_ID_DT_PACK)';
    DataSetCheckErr.ParamByName('IN_ID_DT_PACK').AsInt64    := id_dt_pack;
    DataSetCheckErr.Open;

    if(DataSetCheckErr.IsEmpty) then
    begin
        Transaction.StartTransaction;
        try
            StoredProc.StoredProcName := 'BS_DT_PACK_UPD';

            StoredProc.Prepare;
            StoredProc.ParamByName('ID_DT_PACK').AsInt64                := id_dt_pack;
            StoredProc.ParamByName('NUMB_PACK').AsInt64                 := StrToInt64(TextEditNumb.Text);
            StoredProc.ParamByName('NAME_FILE_IMPORT').AsString         := TextEditNameFile.Text;
            StoredProc.ParamByName('DATE_CURRENT').AsDate               := dateEdit.Date;
            if(TextEditCountRec.Text='')  then
                StoredProc.ParamByName('ALL_COUNT_REC_PACK').AsVariant  := null
            else
                StoredProc.ParamByName('ALL_COUNT_REC_PACK').AsVariant  := strtoint(TextEditCountRec.Text);
            if(TextEditSum.Text='')  then
                 StoredProc.ParamByName('all_sum_opl_pack').AsVariant   := null
            else
                 StoredProc.ParamByName('all_sum_opl_pack').AsVariant   := strtofloat(TextEditSum.Text);
            StoredProc.ParamByName('IS_SIGNED').AsInteger               := 1;
            StoredProc.ParamByName('MONTH_IN').AsInteger                := cxComboBoxMonth.ItemIndex+1;
            StoredProc.ParamByName('YEAR_IN').AsInteger                 := cxSpinEditYear.Value;
            StoredProc.ParamByName('ID_DOC_PROP').AsInteger             := type_doc;

            StoredProc.ExecProc;
            Transaction.Commit;

            PackSign;

            myform.ActionRefreshExecute(Sender);
            myform.DataSetPack.Locate('id_dt_pack', id_dt_pack, []);
        except
            begin
                Transaction.Rollback;
                Showmessage('При редагуванні виникла помилка');
                exit;
            end;
        end;
        end else
        begin
            TabSheetErr.TabVisible    :=true;
            PageControl.ActivePage    := TabSheetErr;

        end;

end;

procedure TfrmImportPersAcc.ActionUnsignExecute(Sender: TObject);

begin
    DataSetCheckErr.Close;
    DataSetCheckErr.SQLs.SelectSQL.Text                     := 'select * from BS_SELECT_ERRORS_PACK_SIGN(:IN_ID_DT_PACK)';
    DataSetCheckErr.ParamByName('IN_ID_DT_PACK').AsInt64    := id_dt_pack;
    DataSetCheckErr.Open;

    if(DataSetCheckErr.IsEmpty) then
    begin
        Transaction.StartTransaction;
        try
            StoredProc.StoredProcName := 'BS_DT_PACK_UPD';

            StoredProc.Prepare;
            StoredProc.ParamByName('ID_DT_PACK').AsInt64                := id_dt_pack;
            StoredProc.ParamByName('NUMB_PACK').AsInt64                 := StrToInt64(TextEditNumb.Text);
            StoredProc.ParamByName('NAME_FILE_IMPORT').AsString         := TextEditNameFile.Text;
            StoredProc.ParamByName('DATE_CURRENT').AsDate               := dateEdit.Date;
            if(TextEditCountRec.Text='')  then
                StoredProc.ParamByName('ALL_COUNT_REC_PACK').AsVariant  := null
            else
                StoredProc.ParamByName('ALL_COUNT_REC_PACK').AsVariant  := strtoint(TextEditCountRec.Text);
            if(TextEditSum.Text='')  then
                 StoredProc.ParamByName('all_sum_opl_pack').AsVariant   := null
            else
                 StoredProc.ParamByName('all_sum_opl_pack').AsVariant   := strtofloat(TextEditSum.Text);
            StoredProc.ParamByName('IS_SIGNED').AsInteger               := 0;
            StoredProc.ParamByName('MONTH_IN').AsInteger                := cxComboBoxMonth.ItemIndex+1;
            StoredProc.ParamByName('YEAR_IN').AsInteger                 := cxSpinEditYear.Value;
            StoredProc.ParamByName('ID_DOC_PROP').AsInteger             := type_doc;

            StoredProc.ExecProc;
            Transaction.Commit;

            PackUnSign;

            myform.ActionRefreshExecute(Sender);
            myform.DataSetPack.Locate('id_dt_pack', id_dt_pack, []);
        except
            begin
                Transaction.Rollback;
                Showmessage('При редагуванні виникла помилка');
                exit;
            end;
        end;

    end else
    begin
        TabSheetErr.TabVisible    :=true;
        PageControl.ActivePage    := TabSheetErr;

    end;

end;

procedure TfrmImportPersAcc.cxButton1Click(Sender: TObject);
begin
   ShowMessage(IntToStr(BoxTypeCash.EditValue));
end;

procedure TfrmImportPersAcc.PageControlChange(Sender: TObject);
begin
      BarManager.BarByName('FilterPanel').Visible:=(PageControl.ActivePage=TabSheetPersAcc);
end;

procedure TfrmImportPersAcc.ComboBoxPropExit(Sender: TObject);
begin
    if (ComboBoxProp.ItemIndex=0) then type_doc :=2;
    if (ComboBoxProp.ItemIndex=1) then type_doc :=4;
end;

procedure TfrmImportPersAcc.ComboBoxPropPropertiesChange(Sender: TObject);
begin

    flag_name_Prop := 1;
end;

procedure TfrmImportPersAcc.cxComboBoxMonthPropertiesChange(
  Sender: TObject);
begin
    flag_name_month := 1;
end;

procedure TfrmImportPersAcc.cxSpinEditYearPropertiesChange(
  Sender: TObject);
begin
    flag_name_year := 1;
end;

procedure TfrmImportPersAcc.TextEditCountRecPropertiesChange(
  Sender: TObject);
begin
   flag_count_rec := 1;
end;

procedure TfrmImportPersAcc.TextEditSumPropertiesChange(Sender: TObject);
begin
   flag_count_sum := 1;
end;

procedure TfrmImportPersAcc.GridPackDBViewDblClick(Sender: TObject);
begin

    if (DataSetCheckErr['ID_DT_ALLOC_PERS_AC']<>null) then
    begin
        PageControl.ActivePage    := TabSheetPersAcc;
        GridAcc.SetFocus;
        DataSetPersAcc.Locate('ID_DT_ALLOC_PERS_AC', DataSetCheckErr['ID_DT_ALLOC_PERS_AC'], []);
    end else exit;
end;

procedure TfrmImportPersAcc.cxComboBoxMonthKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (flag=view) then
       key := chr(0);
end;

procedure TfrmImportPersAcc.ComboBoxPropPropertiesInitPopup(
  Sender: TObject);
begin
    if ((Add_by_hand_pack=1)or(flag=view)) then
     comboboxprop.DroppedDown := false
end;

procedure TfrmImportPersAcc.ActionCheckExecute(Sender: TObject);
var
     i : byte;
     month_sys, year_sys : integer;
begin
    if(DataSetCheckErr['kod_error']='1001') then
    begin
        i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], 'Коректувати період до якого відноситься пачка актуальним періодим системи'+' '+'?', mtConfirmation, [mbYes, mbNo]);
        if ((i = 7) or (i= 2)) then exit;

        Transaction.StartTransaction;
        try
            StoredProc.StoredProcName := 'BS_DT_PACK_UPD';

            StoredProc.Prepare;
            StoredProc.ParamByName('ID_DT_PACK').AsInt64                := id_dt_pack;
            StoredProc.ParamByName('NUMB_PACK').AsInt64                 := StrToInt64(TextEditNumb.Text);
            StoredProc.ParamByName('NAME_FILE_IMPORT').AsString         := TextEditNameFile.Text;
            StoredProc.ParamByName('DATE_CURRENT').AsDate               := dateEdit.Date;
            if(TextEditCountRec.Text='')  then
                StoredProc.ParamByName('ALL_COUNT_REC_PACK').AsVariant  := null
            else
                StoredProc.ParamByName('ALL_COUNT_REC_PACK').AsVariant  := strtoint(TextEditCountRec.Text);
            if(TextEditSum.Text='')  then
                 StoredProc.ParamByName('all_sum_opl_pack').AsVariant   := null
            else
                 StoredProc.ParamByName('all_sum_opl_pack').AsVariant   := strtofloat(TextEditSum.Text);
            StoredProc.ParamByName('IS_SIGNED').AsInteger               := is_signed;
            StoredProc.ParamByName('MONTH_IN').AsInteger                := DataSetCheckErr['month_sys'];
            StoredProc.ParamByName('YEAR_IN').AsInteger                 := DataSetCheckErr['year_sys'];
            StoredProc.ParamByName('ID_DOC_PROP').AsInteger             := type_doc;

            StoredProc.ExecProc;

            month_sys                                                   := DataSetCheckErr['month_sys'];
            year_sys                                                    := DataSetCheckErr['year_sys'];

            Transaction.Commit;

            cxComboBoxMonth.ItemIndex                                   := month_sys-1;
            cxSpinEditYear.Value                                        := year_sys;
            flag_name_month                                             := 0;
            flag_name_year                                              := 0;

            DataSetCheckErr.CloseOpen(true);
            myform.ActionRefreshExecute(Sender);
            myform.DataSetPack.Locate('id_dt_pack', id_dt_pack, []);
        except
            begin
                Transaction.Rollback;
                Showmessage('При редагуванні виникла помилка');
                exit;
            end;
        end;
    end;
    if(DataSetCheckErr['kod_error']='1002') then
    begin
        i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], 'Розподілити загальну суму за типами послуг автоматом?', mtConfirmation, [mbYes, mbNo]);
        if ((i = 7) or (i= 2)) then exit;

            Transaction.StartTransaction;
        try
            StoredProc.StoredProcName := 'BS_PAYMENT_INS_AUTO';


            StoredProc.Prepare;
            StoredProc.ParamByName('ID_DT_ALLOC_ACC').AsInt64           := DataSetCheckErr['ID_DT_ALLOC_PERS_AC'];
            StoredProc.ParamByName('SUM_OPL').AsCurrency                := DataSetCheckErr['sum_opl'];
            StoredProc.ParamByName('DATE_BEG_PERIOD_FOR_ACC').AsDate    := DataSetCheckErr['date_beg_period_for_acc'];
            StoredProc.ParamByName('DATE_END_PERIOD_FOR_ACC').AsDate    := DataSetCheckErr['date_end_period_for_acc'];
            StoredProc.ParamByName('ID_DOC_PROP').AsInteger             := DataSetCheckErr['id_doc_prop'];

            StoredProc.ExecProc;


            Transaction.Commit;

            ActionRefreshExecute(sender);
            DataSetCheckErr.CloseOpen(true);
            myform.ActionRefreshExecute(Sender);
            myform.DataSetPack.Locate('id_dt_pack', id_dt_pack, []);
        except
            begin
                Transaction.Rollback;
                Showmessage('При додованні виникла помилка');
                exit;
            end;
        end;

    end else
    begin
        PageControl.ActivePage    := TabSheetPersAcc;
        GridAcc.SetFocus;
        DataSetPersAcc.Locate('ID_DT_ALLOC_PERS_AC', DataSetCheckErr['ID_DT_ALLOC_PERS_AC'], []);
    end;

end;

procedure TfrmImportPersAcc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    TabSheetPackHide(Sender);
end;

procedure TfrmImportPersAcc.ActionFilterExecute(Sender: TObject);
var
     strFilter : String;
begin

   strFilter := '';
   strFilter:=strFilter+IntToStr(id_dt_pack)+',';
   if FamiliyaBox.EditText=''
       then strFilter := strFilter+'Null,'
       else strFilter := strFilter+''''+FamiliyaBox.EditText+''',';

   if ImyaBox.EditText=''
       then strFilter := strFilter+'Null,'
       else strFilter := strFilter+''''+ImyaBox.EditText+''',';

   if PatronomycBox.EditText=''
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+''''+PatronomycBox.EditText+''',';

   if TextEditSumAcc.Text=''
         then strFilter := strFilter+'Null,'
         else strFilter := strFilter+''''+TextEditSumAcc.Text+''',';

   if BsPersAccBox.EditText=''
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+''+BsPersAccBox.EditText+',';


   if BoxTypeCash.EditText=''
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+inttostr(BoxTypeCash.EditValue)+',';

   if DateEditBegPeriod.text= '01.01.1899'
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+''''+DateEditBegPeriod.text+''',';

   if DateEditEndPeriod.text='01.01.1899'
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+''''+DateEditEndPeriod.Text+''',';


   if BoxKasKod.EditText=''
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+''''+BoxKasKod.EditText+''',';

   if BoxKassApp.EditText=''
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+''''+BoxKassApp.EditText+''',';

   if BsRegionBox.EditText=''
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+inttostr(BsRegionBox.EditValue)+',';

   if CityAreaBox.EditText=''
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+inttostr(CityAreaBox.EditValue)+',';

   if TypeStreetBox.EditText=''
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+inttostr(TypeStreetBox.EditValue)+',';

   if StreetBox.EditText=''
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+inttostr(StreetBox.EditValue)+',';

   if HouseEdit.Text=''
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+HouseEdit.Text+',';

   if KorpusEdit.Text=''
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+KorpusEdit.Text+',';

   if TextEditFlat.Text=''
        then strFilter := strFilter+'Null'
        else strFilter := strFilter+TextEditFlat.Text;

   if DataSetPersAcc.Active then
        DataSetPersAcc.Close;
   DataSetPersAcc.SQLs.SelectSQL.Text:='select distinct * from BS_ALLOCATION_ACCOUNT_FILTER('+strFilter+')';
   DataSetPersAcc.Open;

   DataSetBalances.CloseOpen(true);
end;

procedure TfrmImportPersAcc.ActionClearExecute(Sender: TObject);
begin
    ClearAllEdits;
end;

end.
