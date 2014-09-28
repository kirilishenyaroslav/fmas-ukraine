unit BankOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls, cxMemo,
  cxDropDownEdit, cxMRUEdit, cxMaskEdit, cxCalendar, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, Buttons, ExtCtrls, ActnList, BankDocMainForm,
  DB, FIBDataSet, pFIBDataSet, BankDocClass, GlobalSPR, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxCurrencyEdit,
  cxImage, Placemnt, ImgList, RxMemDS, cxGridTableView, pFIBDatabase,
  cxCheckBox, dxStatusBar, cxSplitter, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,           Un_R_file_Alex,
   kernel,   frxCross,
    Un_Progress_form,  BankNich;

type
  TfmOrderMode = (AddOrder, ChangeOrder, ShowOrder, ClonOrder);
  TfmOrderAddDog = (SingleDog, MulitDog, NoDog, Rashod_pl, Kassa_Bank, RS_RS, Dog_trities, Stud_city, Dog_Trit_New, Tranzit, Shablon, ShablonNich);
  TDoc_komis=record
    id_doc       : int64;
    summa_doc    : double;
    summa_valuta : double;
    id_cust      : int64;
    id_rate_acc  : int64;
    name_cust    : string;
    note         : string;
    error        : integer;
    date_vip     : TDate;
  end;

  TfmBankOrder = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    cxButtonSaveAll: TcxButton;
    cxButtonClose: TcxButton;
    ActionList1: TActionList;
    Panel2: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    DataSetNumber: TpFIBDataSet;
    Class_Database: TpFIBDatabase;
    Class_Transaction_Wr: TpFIBTransaction;
    Class_StoredProc: TpFIBStoredProc;
    cxGridSaveAllDBTableView1: TcxGridDBTableView;
    cxGridSaveAllLevel1: TcxGridLevel;
    cxGridSaveAll: TcxGrid;
    StyleRepository: TcxStyleRepository;
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
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    ActionClose: TAction;
    RxMemoryDataSaveAll: TRxMemoryData;
    DataSourceSaveAll: TDataSource;
    cxGridSaveAllDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridSaveAllDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridSaveAllDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridSaveAllDBTableView1DBColumn6: TcxGridDBColumn;
    DataSetChangeProv: TpFIBDataSet;
    cxGridSaveAllDBTableView1DBColumn7: TcxGridDBColumn;
    ActionSaveAll: TAction;
    ImageList1: TImageList;
    Class_DataSet: TpFIBDataSet;
    cxSplitter2: TcxSplitter;
    Panel4: TPanel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    cxMemo2: TcxMemo;
    ErrorProvsDataSet: TpFIBDataSet;
    ErrorProvsDataSource: TDataSource;
    cxGrid4: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    cxGridDBTableView2DBColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    SpeedButton7: TSpeedButton;
    ActionChangeDog: TAction;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    cxSplitter1: TcxSplitter;
    DataSourceDog: TDataSource;
    RxMemoryDataDog: TRxMemoryData;
    RxMemoryDataPodDog: TRxMemoryData;
    DataSourcePodDog: TDataSource;
    Panel3: TPanel;
    cxGridDog: TcxGrid;
    cxGridDogDBTableView1: TcxGridDBTableView;
    cxGridDogDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDogDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDogDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDogLevel1: TcxGridLevel;
    cxGridDogDBTableView1DBColumn4: TcxGridDBColumn;
    Panel5: TPanel;
    Panel6: TPanel;
    cxGridPodDog: TcxGrid;
    cxGridPodDogDBTableView1: TcxGridDBTableView;
    cxGridPodDogDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridPodDogDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridPodDogDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridPodDogLevel1: TcxGridLevel;
    Panel7: TPanel;
    cxGridPodDogDBTableView1DBColumn4: TcxGridDBColumn;
    cxTextEditComent: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    Class_Transaction_R: TpFIBTransaction;
    RxError: TRxMemoryData;
    DataSourceError: TDataSource;
    cxButton1: TcxButton;
    DataSetKomis: TpFIBDataSet;
    RxKomis: TRxMemoryData;
    ActionShowKom: TAction;
    GroupBox2: TGroupBox;
    cxLabel10: TcxLabel;
    cxTextEdit3: TcxTextEdit;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    dxStatusBar1: TdxStatusBar;
    ActionShowAllId: TAction;
    DataSet: TpFIBDataSet;
    cxCheckBox1: TcxCheckBox;
    ActionShowInfo: TAction;
    ActionSaveOnlyBuff: TAction;
    TabSheet5: TTabSheet;
    cxTextEdit6: TcxTextEdit;
    cxTextEdit7: TcxTextEdit;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxMemo3: TcxMemo;
    Panel8: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    ActionAddProv: TAction;
    ActionChangeProv: TAction;
    ActionDeleteProv: TAction;
    SpeedButton11: TSpeedButton;
    ActionClon: TAction;
    SpeedButton12: TSpeedButton;
    ActionClonProv: TAction;
    Panel9: TPanel;
    Panel10: TPanel;
    ActionShow: TAction;
    SpeedButton13: TSpeedButton;
    Panel11: TPanel;
    DataSetAccordance: TpFIBDataSet;
    DataSetIni: TpFIBDataSet;
    DataSetExpertSys: TpFIBDataSet;
    DataSetShablons: TpFIBDataSet;
    ActionMoveVip: TAction;
    StoredProcDay: TpFIBStoredProc;
    DataSetOpen: TpFIBDataSet;
    FormStorage1: TFormStorage;
    grp1: TGroupBox;
    cxLabel1: TcxLabel;
    cxTextEditNum: TcxTextEdit;
    cxLabel3: TcxLabel;
    DateTimePicker1: TDateTimePicker;
    cxLabel4: TcxLabel;
    cxLabel13: TcxLabel;
    cxDateEdit2: TcxDateEdit;
    cxCheckBox2: TcxCheckBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxMRUEditFio: TcxMRUEdit;
    cxLabel17: TcxLabel;
    DateTimePicker2: TDateTimePicker;
    cxLabel7: TcxLabel;
    cxMemo1: TcxMemo;
    cxLabel14: TcxLabel;
    cxTextEditSumma: TcxTextEdit;
    cxButton2: TcxButton;
    Label1: TLabel;
    ValutaTextEdit: TcxTextEdit;
    Label2: TLabel;
    ValutaLabel: TLabel;
    cxGridSaveAllDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridPodDogDBTableView1DBColumn5: TcxGridDBColumn;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure cxGridSaveAllDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure cxGridSaveDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MySave;
    procedure ActionSaveAllExecute(Sender: TObject);
    procedure ActionChangeDogExecute(Sender: TObject);
    procedure cxGridSaveAllDBTableView1DblClick(Sender: TObject);
    function SelectDogovor(all_summa : double; summa_valuta : double; id_valuta : Integer; name_valuta : string) : boolean;
    function SelectChangeDogovor(all_summa : double; summa_valuta : Double; id_valuta : Integer; name_valuta : string) : boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function SelectOneDocKomis(vizov : integer):TDoc_komis;
    function ZapisSowKOmis(zap : integer) : boolean;
    function MaxSum : double;
    procedure RaschetKomissii;
    function RaschetSum(sum_d, max_sum : double):double;
    procedure ActionShowKomExecute(Sender: TObject);
    procedure ActionShowAllIdExecute(Sender: TObject);
    //function SelectDogovorTrit : boolean;
    function SelectStudCity(f : boolean) : boolean;
    procedure cxCheckBox1Click(Sender: TObject);
    procedure ActionShowInfoExecute(Sender: TObject);
    procedure cxGridDogDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDogDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ShowPProvPodDog;
    function SelectDogovorTritNew(a : string; f : boolean) : boolean;
    function SelectShablonNich(f : boolean; AOwner: TComponent; DBHANDLE : TpFIBDatabase; id_doc: Int64; date_doc: TDate; num_doc, sum_doc, note: string; id_user : Integer; name_cust, mfo_cust, name_bank, ras_cust: string; prih : Integer) : boolean;
    procedure ActionSaveOnlyBuffExecute(Sender: TObject);
    procedure H_d_k(a: smallint; pk_id : int64);
    procedure H_p_k(a : smallint; pk_i : int64);
    procedure H_d(a: smallint; pk_id : int64);
    procedure H_p(a: smallint; pk_i : int64);
    procedure cxGridSaveAllDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridSaveAllDBTableView1KeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure showSplInfo;
    procedure RxMemoryDataPodDogAfterScroll(DataSet: TDataSet);
    procedure RxMemoryDataSaveAllAfterScroll(DataSet: TDataSet);
    procedure ActionAddProvExecute(Sender: TObject);
    procedure ActionChangeProvExecute(Sender: TObject);
    procedure ActionDeleteProvExecute(Sender: TObject);
    procedure ActionClonExecute(Sender: TObject);
    procedure ActionClonProvExecute(Sender: TObject);
    procedure ActionShowExecute(Sender: TObject);
    procedure ActionMoveVipExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    flag_close : boolean;
//    j : int64;
    id_session, id_session_kom : int64;
    date_provodka : Tdate;
    SaveAll, flag_show_dog, flag_rs_rs : boolean;
    cr_dt : integer;
    {id_deb_sch, id_kred_sch,}
    {name_deb_sch, name_kred_sch,} name_osnov_sch, title_sch : string;
    use_expert_sys : integer;
    flag_add_dog_here : boolean; {вызов договоров на кнопку add}
    TProgresOnSave : TfmUn_Progress_form;
  public
    id_osnov_sch : int64;
    myform : TfmBankDocMainForm;
    myclass: TMainDocClass;
    TRec : TDoc_komis;
    flag : TfmOrderMode;
    dog_dd : TfmOrderAddDog;
    id, id_dog_komis, kod_dog_komis : int64;
    prih : integer;
    buh_prov : integer;
    date_act : Tdate;
    flag_show_sum_dog, flag_find_komis : boolean;
    flag_edit_kom_find : boolean; {если изменение и была комиссия = тру}
    id_all_dok_komis_edit : int64;
    id_type_dog : integer;
    id_ras_cur  : int64;
    date_open :tdate;
    flag_move_date : integer;
    use_move_db_kr : integer;

    BANK_ID_DOG_KOMIS  : Int64;
    BANK_KOD_DOG_KOMIS : Int64;

    id_valuta   : Integer;
    name_valuta : string;
    constructor Create(AOwner: TComponent; mclass: TMainDocClass; m : TfmOrderMode; mform : TfmBankDocMainForm; dog : TfmOrderAddDog; pri : smallint; id_valuta_in : Integer; name_valuta_in : string); reintroduce; overload;
  end;


implementation
uses BankAddChangeProv,
     Un_lo_file_Alex,
     BankInputSumma,
     DogLoaderUnit,
     BankSelectDocProvVstrech,
     Un_func_file_Alex,
     BankSelectKomisDoc,
     BankKomOrder,
     Math,
     {uTreatiesDM,
     ujbApplication,
     ujbTypes,
     ujbKernel,}
     BankTypeKassa,
     ST_Loader_Unit,
     Un_form_info_doc,
     cn_Common_Loader,
     cn_Common_Types,
     BankExpertSysSch,
     BankMoveToDay,
     dateutils;

{$R *.dfm}

constructor TfmBankOrder.Create(AOwner: TComponent; mclass: TMainDocClass;
  m: TfmOrderMode; mform: TfmBankDocMainForm; dog : TfmOrderAddDog; pri : smallint; id_valuta_in : Integer; name_valuta_in : string);
var
    kod_my_sc, kod_my_kor_sc : string;
    id_ss, id_al, id_my_sc, id_my_kor_sc, id_dogg, id_al_for_clon : int64;
    k, l, count, pr, itt : integer;
//    inppp, resul_dog : TDRes;
    flag_na_exi_dog : boolean;
    tip_multy : TSelectVstrech;
    T : TfmUn_Progress_form;
    y, o : TSpravParams;
    ffio, n_cust, n_do, reg_n, d_d, type_d : string;
    dog_type : integer;
    id_sch_tmp     : int64;
    sch_name_tmp, sch_title_tmp : string;
    ResSch : variant;
    sch_exist : integer;
begin
    inherited Create (AOwner);
    flag_show_dog     := false;
    myclass           := mclass;
    myform            := mform;
    flag_close        := false;
    flag_add_dog_here := false;
    flag              := m;
    prih              := pri;
    flag_move_date    := 0;
    cxSplitter2.CloseSplitter;
    PageControl1.ActivePageIndex := 0;
    Class_Database                        := myclass.Class_Database;
    Class_Transaction_Wr.DefaultDatabase  := Class_Database;
    Class_Database.DefaultTransaction     := Class_Transaction_R;
    Class_StoredProc.Database             := Class_Database;
    Class_DataSet.Database                := Class_Database;
    Class_DataSet.Transaction             := Class_Transaction_R;
    ErrorProvsDataSet.Database            := Class_Database;
    ErrorProvsDataSet.Transaction         := Class_Transaction_Wr;
    DataSetChangeProv.Database            := Class_Database;
    DataSetChangeProv.Transaction         := Class_Transaction_R;
    DataSetKomis.Database                 := Class_Database;
    DataSetKomis.Transaction              := Class_Transaction_R;
    DataSet.Database                      := Class_Database;
    DataSet.Transaction                   := Class_Transaction_R;
    DataSetAccordance.Database            := Class_Database;
    DataSetAccordance.Transaction         := Class_Transaction_R;

    StoredProcDay.Database                := Class_Database;
    StoredProcDay.Transaction             := Class_Transaction_R;

    DataSetIni.Database                   := Class_Database;
    DataSetIni.Transaction                := Class_Transaction_R;

    DataSetShablons.Database              := Class_Database;
    DataSetShablons.Transaction           := Class_Transaction_R;
                      
    DataSetExpertSys.Database             := Class_Database;
    DataSetExpertSys.Transaction          := Class_Transaction_R;

    DataSetOpen.Database                  := Class_Database;
    DataSetOpen.Transaction               := Class_Transaction_R;

    Class_Transaction_R.StartTransaction;
    cxCheckBox1.Checked                   := false;
    cxButton1.enabled                     := false;

    DataSetIni.Close;
    DataSetIni.SQLs.SelectSQL.Text        := 'Select * from BANK_INI';
    DataSetIni.Open;


    if(DataSetIni['USE_EXPERT_SYSTEM']<>null) then
    use_expert_sys     := DataSetIni.FieldByName('USE_EXPERT_SYSTEM').AsInteger else
    use_expert_sys     := 0;

    if(DataSetIni['USE_MOVE_ORDER_DEB_KR']<>null) then
    use_move_db_kr     := DataSetIni.FieldByName('USE_MOVE_ORDER_DEB_KR').AsInteger else
    use_move_db_kr     := 0;


    if (myform.Priznac_komis <> 1) or (prih = 1) then cxButton1.Visible := false;
    if prih = 1 then
    begin
        cxGridSaveAllDBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_DEBET;
        cxGridSaveAllDBTableView1DBColumn7.Caption := Un_R_file_Alex.KASSA_SCH_KORESPOND;
        cxLabel1.Caption  := Un_R_file_Alex.BANK_DOC_ORDER_PRIH_KAS_ORD;
        id_osnov_sch      := myclass.id_osn_sch;
        name_osnov_sch    := myclass.name_osn_sch;
        title_sch         := myclass.title_osn_sch;
    end;
    if prih = 0 then
    begin
        title_sch         := myclass.title_osn_sch;
        id_osnov_sch      := myclass.id_osn_sch;
        name_osnov_sch    := myclass.name_osn_sch;
        cxGridSaveAllDBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_KREDIT;
        cxGridSaveAllDBTableView1DBColumn7.Caption := Un_R_file_Alex.KASSA_SCH_KORESPOND;
        cxLabel1.Caption  := Un_R_file_Alex.BANK_DOC_ORDER_RASH_KAS_ORD;
//        cxLabel12.Caption := Un_R_file_Alex.;
    end;

    CAPTION           := Un_R_file_Alex.BANK_ORDER;
    cxLabel3.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    cxLabel13.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    cxLabel7.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxLabel14.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_SUMMA_ALL;
    cxLabel6.Caption  := Un_R_file_Alex.BANK_PRINYATO_OT;

    cxLabel15.Caption := Un_R_file_Alex.BANK_DOC_INFO_DOG[1];
    TabSheet5.Caption := Un_R_file_Alex.BANK_DOC_INFO[1];

    ActionSaveAll.Caption         := Un_R_file_Alex.KASSA_DOC_ORDER_SAVE_ALL_PROV;
    PageControl1.Pages[0].Caption := Un_R_file_Alex.KASSA_DOC_ORDER_BUHG_PROVODKI;
    PageControl1.Pages[1].Caption := Un_R_file_Alex.BANK_RAZB_PO_DOG;
    ActionAdd.Caption             := Un_R_file_Alex.MY_BUTTON_ADD;
    ActionChange.Caption          := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionDelete.Caption          := Un_R_file_Alex.MY_BUTTON_DELETE;
    ActionAddProv.Caption         := Un_R_file_Alex.MY_BUTTON_ADD;
    ActionChangeProv.Caption      := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionDeleteProv.Caption      := Un_R_file_Alex.MY_BUTTON_DELETE;
    ActionClon.Caption            := Un_R_file_Alex.BANK_CLON;
    ActionClonProv.Caption        := Un_R_file_Alex.BANK_CLON;
    ActionShow.Caption            := Un_R_file_Alex.MY_ACTION_SHOW;
    ActionShowKom.Caption         := Un_R_file_Alex.BANK_KOMIS;
    
    cxGridSaveAllDBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_KOD_S_R_S_K;
//    cxGridSaveAllDBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_RAZD;
//    cxGridSaveAllDBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_STAT;
    cxGridSaveAllDBTableView1DBColumn5.Caption := Un_R_file_Alex.J4_NAME_SMETA;
    cxGridSaveAllDBTableView1DBColumn6.Caption := Un_R_file_Alex.KASSA_SUMMA;
    cxGridDogDBTableView1DBColumn1.Caption     := Un_R_file_Alex.BANK_DOGOVOR;
    cxGridDogDBTableView1DBColumn2.Caption     := Un_R_file_Alex.BANK_NAME_CUSTMERA;
    cxGridDogDBTableView1DBColumn3.Caption     := Un_R_file_Alex.BANK_DATE_DOG;
    cxGridDogDBTableView1DBColumn4.Caption     := Un_R_file_Alex.KASSA_SUMMA;
    cxGridPodDogDBTableView1DBColumn1.Caption  := Un_R_file_Alex.KASSA_KOD_S_R_S_K;
    cxGridPodDogDBTableView1DBColumn2.Caption  := Un_R_file_Alex.KASSA_DEBET;
    cxGridPodDogDBTableView1DBColumn4.Caption  := Un_R_file_Alex.KASSA_SCH_KORESPOND;
    cxGridPodDogDBTableView1DBColumn3.Caption  := Un_R_file_Alex.KASSA_SUMMA;

    cxGridDBTableView2DBColumn1.Caption  := Un_R_file_Alex.KOD_ERROR;
    cxGridDBTableView2DBColumn2.Caption  := Un_R_file_Alex.KOD_WARNING;


    GroupBox2.Caption               := Un_R_file_Alex.BANK_P_S_NAME_CUSTOMER;
    cxLabel10.Caption               := Un_R_file_Alex.BANK_R_S;
    cxLabel11.Caption               := Un_R_file_Alex.BANK_MFO;
    cxLabel12.Caption               := Un_R_file_Alex.BANK_BANK;

    ActionClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;
    cxLabel2.Caption    := Un_R_file_Alex.BANK_COMMENT_PROV;
    cxLabel8.Caption    := Un_R_file_Alex.BANK_TYPE_DOGOVOR;
    cxLabel9.Caption    := Un_R_file_Alex.KASSA_REG_NUM;

    cxCheckBox1.Properties.Caption               := Un_R_file_Alex.BANK_PRIV_KOM;

    dxStatusBar1.Panels[0].Text                  := 'Ins - ' + Un_R_file_Alex.MY_BUTTON_ADD ;
    dxStatusBar1.Panels[1].Text                  := 'F2 - '  + Un_R_file_Alex.MY_BUTTON_EDIT;
    dxStatusBar1.Panels[2].Text                  := 'Del - ' + Un_R_file_Alex.MY_BUTTON_DELETE ;
    dxStatusBar1.Panels[3].Text                  := 'F10 - ' + Un_R_file_Alex.J4_MAIN_PRINAT;
    dxStatusBar1.Panels[4].Text                  := 'Tab - ' + Un_R_file_Alex.J4_BAR_TAB_SELECT;
    dxStatusBar1.Panels[5].Text                  := 'Esc - ' + Un_R_file_Alex.MY_BUTTON_CLOSE;

    if use_move_db_kr=1 then
    begin
        cxGridSaveAllDBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_DEBET;
        cxGridSaveAllDBTableView1DBColumn7.Caption := Un_R_file_Alex.KASSA_KREDIT;
        if prih= 1 then
        begin
             cxGridSaveAllDBTableView1DBColumn1.DataBinding.FieldName :=  'RxMemDatNameSch';
             cxGridSaveAllDBTableView1DBColumn7.DataBinding.FieldName :=  'RxMemDatname_korespond';
        end else
        begin
             cxGridSaveAllDBTableView1DBColumn1.DataBinding.FieldName :=  'RxMemDatname_korespond';
             cxGridSaveAllDBTableView1DBColumn7.DataBinding.FieldName :=  'RxMemDatNameSch';
        end;
    end else
    if use_move_db_kr=2 then
    begin
        cxGridSaveAllDBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_KREDIT;
        cxGridSaveAllDBTableView1DBColumn7.Caption := Un_R_file_Alex.KASSA_DEBET;
        if prih= 1 then
        begin
             cxGridSaveAllDBTableView1DBColumn1.DataBinding.FieldName :=  'RxMemDatname_korespond';
             cxGridSaveAllDBTableView1DBColumn7.DataBinding.FieldName :=  'RxMemDatNameSch';
        end else
        begin
             cxGridSaveAllDBTableView1DBColumn1.DataBinding.FieldName :=  'RxMemDatNameSch';
             cxGridSaveAllDBTableView1DBColumn7.DataBinding.FieldName :=  'RxMemDatname_korespond';
        end;
    end;

    SpeedButton7.Visible := false;
    ActionChangeDog.Enabled := false;;

    DateTimePicker1.DateTime  := myform.date_doc;
    DateTimePicker2.DateTime  := myform.date_vip;

    cxDateEdit2.Date          := myform.date_doc;
    date_act                  := myform.date_vip;
    id_ss := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
    id_ras_cur  := myform.id_ras;
    if m = AddOrder then
    begin
        cxMemo1.Text         := myform.note;
        pr                   := 0;
        cxTextEditSumma.Text := AddNol(myform.sum_doc, pr);
        ValutaTextEdit.Text  := AddNol(myform.summa_valuta, pr);
        cxTextEditNum.Text   := myform.num_doc;//numer_lena;
        cxMRUEditFio.Text    := myform.NAME_CUST;
        flag_show_sum_dog    := true;
        cxTextEdit3.text     := myform.ras_cust;
        cxTextEdit4.text     := myform.mfo_cust;
        cxTextEdit5.text     := myform.name_bank;
        cxCheckBox1.Checked  := true;
        cxButton2.Enabled    := false;
        
    end;

    if (m = ChangeOrder) or (m = ShowOrder) then
    begin
        flag_edit_kom_find    := false;
        flag_find_komis       := false;
        id_all_dok_komis_edit := 0;
        if (myform.DataSetMain['PRIHOD_RASHOD'] = 0) then
        begin
            try Trec.id_doc := StrToInt64(myform.DataSetMain.FieldByName('ID_KOM_DOC').AsString) except Trec.id_doc := -1; end;
            cxCheckBox1.Checked   := false;
            cxButton1.enabled     := false;
            DataSetChangeProv.Close;
            DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_KOMIS_DOC('+InttoStr(Trec.id_doc)+')';
            DataSetChangeProv.Open;
            DataSetChangeProv.FetchAll;
            if (DataSetChangeProv.RecordCount > 0) and (Trec.id_doc > 0) then
            begin
                cxCheckBox1.Checked   := true;
                cxButton1.enabled     := true;
                flag_edit_kom_find    := true;
                flag_find_komis       := true;
                try id_all_dok_komis_edit := StrToInt64(DataSetChangeProv.FieldByName('ID_ALL_DOC').AsString);          except begin id_all_dok_komis_edit  := -1; flag_edit_kom_find := false end; end;
                try TRec.summa_doc        := DataSetChangeProv.FieldByName('SUMMA_DOC').AsFloat;                        except TRec.summa_doc         := 0;  end;
                try TRec.id_cust          := StrToInt64(DataSetChangeProv.FieldByName('ID_CUSTOMER').AsString);         except TRec.id_cust           := -1; end;
                try TRec.id_rate_acc      := StrToInt64(DataSetChangeProv.FieldByName('ID_ACCOUNT_CUSTOMER').AsString); except TRec.id_rate_acc       := -1; end;
                try TRec.name_cust        := DataSetChangeProv.FieldByName('NAME_CUST').AsString;                       except TRec.name_cust         := ''; end;
                try TRec.note             := DataSetChangeProv.FieldByName('OSNOVANIE').AsString;                       except TRec.note              := ''; end;
                TRec.error                := 0;
                try TRec.date_vip         := myform.date_vip; {DataSetChangeProv.FieldByName('DATE_VIP').AsDateTime;}                      except TRec.date_vip          := StrToDate('01.01.1900'); end;
            end;
        end;
        cxTextEditNum.Text        := myform.DataSetMain['NUMBER_DOC'];
        cxMRUEditFio.Text         := myform.DataSetMain['NAME_CUST'];
        pr                        := 0;

        cxTextEditSumma.Text      := AddNol(myform.DataSetMain['SUMMA_DOC'], pr);
        ValutaTextEdit.Text       := AddNol(myform.DataSetMain['SUMMA_VALUTA'], pr);
        cxMemo1.Text              := myform.DataSetMain['OSNOVANIE'];
        DateTimePicker2.DateTime  := myform.DataSetMain['DATE_VIP'];
        DateTimePicker1.DateTime  := myform.DataSetMain['DATE_DOC'];
        cxDateEdit2.Date          := myform.DataSetMain['DATE_DOC'];
        cxTextEdit3.text          := myform.cxLabel18.Caption;
        cxTextEdit4.text          := myform.cxLabel20.Caption;
        cxTextEdit5.text          := myform.cxLabel16.Caption;
        DataSetChangeProv.close;
//        id := StrToInt64(myform.DataSetMain.FieldByName('ID_DOC').AsString);


        id_al := StrToInt64(myform.DataSetMain.FieldByname('ID_ALL_DOC').AsString);

        DataSetChangeProv.Close;
        DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_ALL_PROV('+IntToStr(id_al)+', '+IntToStr(prih)+')';
        DataSetChangeProv.Open;


        DataSetChangeProv.First;
        itt := 1;
        while not DataSetChangeProv.Eof do
        begin
            RxMemoryDataSaveAll.Open;
            RxMemoryDataSaveAll.Insert;

//            RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
//            RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DOC'];
            RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := DataSetChangeProv['SUMMA'];
            RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value := DataSetChangeProv['SUMMA_VALUTA'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := DataSetChangeProv['ID_SM'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := DataSetChangeProv['ID_RAZD'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := DataSetChangeProv['ID_ST'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := DataSetChangeProv['ID_KEKV'];
            try RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value  := strtoint64(DataSetChangeProv.FieldByName('ID_DOG').AsString)  except RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value := -1;  end;
            try RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value := strtoint64(DataSetChangeProv.FieldByName('KOD_DOG').AsString) except RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value := -1; end;
            try RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value  := DataSetChangeProv['ID_MAN']; except RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value  := -1; end;
            try RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value     := DataSetChangeProv['FIO_MAN']; except RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value  := null; end;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := DataSetChangeProv['ID_SCH'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := DataSetChangeProv['SUMMA_VALUTA'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := DataSetChangeProv['ID_VALUTA'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := DataSetChangeProv['SCH_NUMBER'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := DataSetChangeProv['TITLE_STATE'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := DataSetChangeProv['TITLE_RAZD'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := DataSetChangeProv['TITLE_SMETA'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := DataSetChangeProv['TITLE_KEKV'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value         := DataSetChangeProv['ID_KASS_SH'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value           := DataSetChangeProv['SCH_KASS_NUMBER'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := StrToInt64(DataSetChangeProv.FieldByName('ID_ALL_PROV').AsString);
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value      := DataSetChangeProv['SMETA_KOD'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value       := DataSetChangeProv['RAZD_NUM'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value      := DataSetChangeProv['STAT_KOD'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value       := DataSetChangeProv['KEKV_KOD'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := DataSetChangeProv.FieldByName('SMETA_KOD').AsString +'\'+ DataSetChangeProv.FieldByName('RAZD_NUM').AsString +'\'+ DataSetChangeProv.FieldByName('STAT_KOD').AsString +'\'+ DataSetChangeProv.FieldByName('KEKV_KOD').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value      := DataSetChangeProv['TITLE_SCH'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value   := DataSetChangeProv['TITLE_KOR_SCH'];

            if DataSetChangeProv['NOTE_PROV'] <> null
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value := DataSetChangeProv['NOTE_PROV']
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value := '';

            RxMemoryDataSaveAll.FieldByName('id').Value                               := itt;
            inc(itt);
            y                    := TSpravParams.Create;
            o                    := TSpravParams.Create;
            y['DataBase']        := Integer(Class_Database.Handle);
            y['ReadTransaction'] := Integer(Class_Database.DefaultTransaction.Handle);
            try y['ID_DOG']      := strtoint64(DataSetChangeProv.FieldByName('ID_DOG').AsString);  except y['ID_DOG']  := -1; end;
            try y['KOD_DOG']     := strtoint64(DataSetChangeProv.FieldByName('KOD_DOG').AsString); except y['KOD_DOG'] := -1; end;
            GetDogovorInfo(Self, @y, @o);
//            ShowSpravParams(Self, o);
            try ffio := o['FIO_COMBO']       except ffio    := ''; end;
            try n_cust := o['NAME_CUSTOMER'] except n_cust  := ''; end;
            try d_d := DateToStr(o['D_DOG']) except d_d     := ''; end;
            try n_do := o['NUM_DOG']         except n_do    := ''; end;
            try reg_n  := o['REGEST_NUM']    except reg_n   := ''; end;
            try type_d := o['N_DOG']         except type_d  := ''; end;
            try dog_type   := o['DOG_TYPE']  except dog_type := -1 end;
            if dog_type = 0 then   {другие}
            begin
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value := type_d;
            end;
            if (dog_type = 1) or (dog_type = 2) then
            begin
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := n_do;
            end;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := '';
            RxMemoryDataSaveAll.FieldByName('fio_stud').Value                         := ffio;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := n_cust;
            try RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := StrToDate(d_d) except RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := null; end;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := reg_n;
            RxMemoryDataSaveAll.Post;
            y.Free;
            o.Free;
            id_osnov_sch      := DataSetChangeProv['ID_SCH'];
            name_osnov_sch    := DataSetChangeProv['SCH_NUMBER'];
                 //занос в договора
                 flag_na_exi_dog := false;
                 RxMemoryDataDog.First;
                 While not RxMemoryDataDog.Eof do
                 begin
                     if (RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsString = DataSetChangeProv.FieldByName('ID_DOG').AsString) and
                        (RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString = DataSetChangeProv.FieldByName('KOD_DOG').AsString)
                         then begin
                             flag_na_exi_dog := true;
                             RxMemoryDataDog.Open;
                             RxMemoryDataDog.Edit;
                             RxMemoryDataDog.FieldByName('RxMemDat_summa').Value := RxMemoryDataDog.FieldByName('RxMemDat_summa').Value + DataSetChangeProv['SUMMA'];
                             RxMemoryDataDog.Post;
                         end;
                     RxMemoryDataDog.Next;
                 end;
                 if not flag_na_exi_dog then
                 begin
                     RxMemoryDataDog.Open;
                     RxMemoryDataDog.Insert;
                     RxMemoryDataDog.FieldByName('RxMemDat_summa').Value               := DataSetChangeProv['SUMMA'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value                := DataSetChangeProv['ID_SM'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value              := DataSetChangeProv['ID_RAZD'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_st').Value                := DataSetChangeProv['ID_ST'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value              := DataSetChangeProv['ID_KEKV'];
                     try RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value           := StrToInt64(DataSetChangeProv.FieldByName('ID_DOG').AsString)  except RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value  := -1; end;
                     try RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value          := StrToInt64(DataSetChangeProv.FieldByName('KOD_DOG').AsString) except RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value := -1; end;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value  := DataSetChangeProv['SMETA_KOD'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value   := DataSetChangeProv['RAZD_NUM'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value  := DataSetChangeProv['STAT_KOD'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value   := DataSetChangeProv['KEKV_KOD'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := DataSetChangeProv.FieldByName('SMETA_KOD').AsString +'\'+ DataSetChangeProv.FieldByName('RAZD_NUM').AsString +'\'+ DataSetChangeProv.FieldByName('STAT_KOD').AsString +'\'+ DataSetChangeProv.FieldByName('KEKV_KOD').AsString;
                     try RxMemoryDataDog.FieldByName('RxMemDatid_man').Value           := DataSetChangeProv['ID_MAN']; except RxMemoryDataDog.FieldByName('RxMemDatid_man').Value := -1; end;
                     RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value               := DataSetChangeProv['ID_SCH'];
                     RxMemoryDataDog.FieldByName('RxMemorySummaValuta').Value          := DataSetChangeProv['SUMMA_VALUTA'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_value').Value             := DataSetChangeProv['ID_VALUTA'];
                     RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value              := DataSetChangeProv['SCH_NUMBER'];
                     RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value             := DataSetChangeProv['TITLE_STATE'];
                     RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value             := DataSetChangeProv['TITLE_RAZD'];
                     RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value            := DataSetChangeProv['TITLE_SMETA'];
                     RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value             := DataSetChangeProv['TITLE_KEKV'];
                     RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := DataSetChangeProv['ID_KASS_SH'];
                     RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value       := DataSetChangeProv['SCH_KASS_NUMBER'];

                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := StrToInt64(DataSetChangeProv.FieldByName('ID_ALL_PROV').AsString);
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := DataSetChangeProv['TITLE_SCH'];
                      
                     if DataSetChangeProv['NOTE_PROV'] <> null
                      then RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNote_prov').Value := DataSetChangeProv['NOTE_PROV']
                      else RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNote_prov').Value := '';

                     if dog_type = 0 then   {другие}
                     begin
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value := type_d;
                     end;
                     if (dog_type = 1) or (dog_type = 2) then
                     begin
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value := n_do;
                     end;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  := '';
                     RxMemoryDataDog.FieldByName('fio_stud').Value                     := ffio;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := n_cust;
                     if ((ffio<>'') or(ffio<>null)) then
                     RxMemoryDataDog.FieldByName('fio_cust').Value                     := ffio+' '+n_cust
                     else RxMemoryDataDog.FieldByName('fio_cust').Value                := n_cust;
                     try RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := StrToDate(d_d) except RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value := null; end;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := reg_n;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTin').Value      := DataSetChangeProv['TIN'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldBirthDay').Value := DataSetChangeProv['BIRTHDAY'];
                     RxMemoryDataDog.Post;

                 end;
            DataSetChangeProv.Next;
        end;
        DataSetChangeProv.Close;
    end;

    if (m = ClonOrder) then
    begin

        cxTextEditNum.Properties.ReadOnly   := false;
        cxMemo1.Properties.ReadOnly         := false;
        cxTextEditSumma.Properties.ReadOnly := false;
        DateTimePicker1.Enabled             := true;
        Caption                             :=   Un_R_file_Alex.J4_CLON_DOC;

        cxTextEditNum.Style.Color           := $00FFF8E6;
        cxMRUEditFio.Style.Color            := $00FFF8E6;
        DateTimePicker1.Color               := $00FFF8E6;
        DateTimePicker2.Color               := $00FFF8E6;
        cxMemo1.Style.Color                 := $00FFF8E6;
        cxTextEditSumma.Style.Color         := $00FFF8E6;
        cxGridSaveAllDBTableView1.Styles.Content.color  := $00FFF8E6;

        flag_edit_kom_find    := false;
        flag_find_komis       := false;
        id_all_dok_komis_edit := 0;

        if (myform.DataSetMain['PRIHOD_RASHOD'] = 0) then
        begin
            try Trec.id_doc := StrToInt64(myform.DataSetMain.FieldByName('ID_KOM_DOC').AsString) except Trec.id_doc := -1; end;
            cxCheckBox1.Checked   := false;
            cxButton1.enabled     := false;
            DataSetChangeProv.Close;
            DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_KOMIS_DOC('+InttoStr(Trec.id_doc)+')';
            DataSetChangeProv.Open;
            DataSetChangeProv.FetchAll;
            if (DataSetChangeProv.RecordCount > 0) and (Trec.id_doc > 0) then
            begin
                cxCheckBox1.Checked   := true;
                cxButton1.enabled     := true;
                flag_edit_kom_find    := true;
                flag_find_komis       := true;
               // try id_all_dok_komis_edit := StrToInt64(DataSetChangeProv.FieldByName('ID_ALL_DOC').AsString);          except begin id_all_dok_komis_edit  := -1; flag_edit_kom_find := false end; end;
                try TRec.summa_doc        := DataSetChangeProv.FieldByName('SUMMA_DOC').AsFloat;                        except TRec.summa_doc         := 0;  end;
                try TRec.id_cust          := StrToInt64(DataSetChangeProv.FieldByName('ID_CUSTOMER').AsString);         except TRec.id_cust           := -1; end;
                try TRec.id_rate_acc      := StrToInt64(DataSetChangeProv.FieldByName('ID_ACCOUNT_CUSTOMER').AsString); except TRec.id_rate_acc       := -1; end;
                try TRec.name_cust        := DataSetChangeProv.FieldByName('NAME_CUST').AsString;                       except TRec.name_cust         := ''; end;
                try TRec.note             := DataSetChangeProv.FieldByName('OSNOVANIE').AsString;                       except TRec.note              := ''; end;
                TRec.error                := 0;
                try TRec.date_vip         := myform.date_vip; {DataSetChangeProv.FieldByName('DATE_VIP').AsDateTime;}                      except TRec.date_vip          := StrToDate('01.01.1900'); end;
            end;
        end;
        cxTextEditNum.Text        := myform.DataSetMain['NUMBER_DOC'];
        cxMRUEditFio.Text         := myform.DataSetMain['NAME_CUST'];
        pr                        := 0;
        cxTextEditSumma.Text      := AddNol(myform.DataSetMain['SUMMA_DOC'], pr);
        ValutaTextEdit.Text       := AddNol(myform.DataSetMain['SUMMA_VALUTA'], pr);
        cxMemo1.Text              := myform.DataSetMain['OSNOVANIE'];
        DateTimePicker2.DateTime  := myform.DataSetMain['DATE_VIP'];
        DateTimePicker1.DateTime  := myform.DataSetMain['DATE_DOC'];
        cxDateEdit2.Date          := myform.DataSetMain['DATE_DOC'];
        cxTextEdit3.text          := myform.cxLabel18.Caption;
        cxTextEdit4.text          := myform.cxLabel20.Caption;
        cxTextEdit5.text          := myform.cxLabel16.Caption;
        DataSetChangeProv.close;
//        id := StrToInt64(myform.DataSetMain.FieldByName('ID_DOC').AsString);
        id_al_for_clon := StrToInt64(myform.DataSetMain.FieldByname('ID_ALL_DOC').AsString);
        DataSetChangeProv.Close;
        DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_ALL_PROV('+IntToStr(id_al_for_clon)+', '+IntToStr(prih)+')';
        DataSetChangeProv.Open;
        DataSetChangeProv.First;
        itt := 1;
        while not DataSetChangeProv.Eof do
        begin
            RxMemoryDataSaveAll.Open;
            RxMemoryDataSaveAll.Insert;
            RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := DataSetChangeProv['SUMMA'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := DataSetChangeProv['ID_SM'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := DataSetChangeProv['ID_RAZD'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := DataSetChangeProv['ID_ST'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := DataSetChangeProv['ID_KEKV'];
            try RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value  := strtoint64(DataSetChangeProv.FieldByName('ID_DOG').AsString)  except RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value := -1;  end;
            try RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value := strtoint64(DataSetChangeProv.FieldByName('KOD_DOG').AsString) except RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value := -1; end;
            try RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value  := DataSetChangeProv['ID_MAN']; except RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value  := -1; end;
            try RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value     := DataSetChangeProv['FIO_MAN']; except RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value  := null; end;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := DataSetChangeProv['ID_SCH'];
            RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value := DataSetChangeProv['SUMMA_VALUTA'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := DataSetChangeProv['ID_VALUTA'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := DataSetChangeProv['SCH_NUMBER'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := DataSetChangeProv['TITLE_STATE'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := DataSetChangeProv['TITLE_RAZD'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := DataSetChangeProv['TITLE_SMETA'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := DataSetChangeProv['TITLE_KEKV'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value         := DataSetChangeProv['ID_KASS_SH'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value           := DataSetChangeProv['SCH_KASS_NUMBER'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := 0;//StrToInt64(DataSetChangeProv.FieldByName('ID_ALL_PROV').AsString);
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value      := DataSetChangeProv['SMETA_KOD'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value       := DataSetChangeProv['RAZD_NUM'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value      := DataSetChangeProv['STAT_KOD'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value       := DataSetChangeProv['KEKV_KOD'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := DataSetChangeProv.FieldByName('SMETA_KOD').AsString +'\'+ DataSetChangeProv.FieldByName('RAZD_NUM').AsString +'\'+ DataSetChangeProv.FieldByName('STAT_KOD').AsString +'\'+ DataSetChangeProv.FieldByName('KEKV_KOD').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value      := DataSetChangeProv['TITLE_SCH'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value   := DataSetChangeProv['TITLE_KOR_SCH'];

            if DataSetChangeProv['NOTE_PROV'] <> null
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value := DataSetChangeProv['NOTE_PROV']
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value := '';

            RxMemoryDataSaveAll.FieldByName('id').Value                               := itt;
            inc(itt);
            y                    := TSpravParams.Create;
            o                    := TSpravParams.Create;
            y['DataBase']        := Integer(Class_Database.Handle);
            y['ReadTransaction'] := Integer(Class_Database.DefaultTransaction.Handle);
            try y['ID_DOG']      := strtoint64(DataSetChangeProv.FieldByName('ID_DOG').AsString);  except y['ID_DOG']  := -1; end;
            try y['KOD_DOG']     := strtoint64(DataSetChangeProv.FieldByName('KOD_DOG').AsString); except y['KOD_DOG'] := -1; end;
            GetDogovorInfo(Self, @y, @o);
//            ShowSpravParams(Self, o);
            try ffio := o['FIO_COMBO']       except ffio    := ''; end;
            try n_cust := o['NAME_CUSTOMER'] except n_cust  := ''; end;
            try d_d := DateToStr(o['D_DOG']) except d_d     := ''; end;
            try n_do := o['NUM_DOG']         except n_do    := ''; end;
            try reg_n  := o['REGEST_NUM']    except reg_n   := ''; end;
            try type_d := o['N_DOG']         except type_d  := ''; end;
            try dog_type   := o['DOG_TYPE']  except dog_type := -1 end;
            if dog_type = 0 then   {другие}
            begin
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value := type_d;
            end;
            if (dog_type = 1) or (dog_type = 2) then
            begin
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := n_do;
            end;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := '';
            RxMemoryDataSaveAll.FieldByName('fio_stud').Value                         := ffio;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := n_cust;
            try RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := StrToDate(d_d) except RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := null; end;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := reg_n;
            RxMemoryDataSaveAll.Post;
            y.Free;
            o.Free;
            id_osnov_sch      := DataSetChangeProv['ID_SCH'];
            name_osnov_sch    := DataSetChangeProv['SCH_NUMBER'];
                 //занос в договора
                 flag_na_exi_dog := false;
                 RxMemoryDataDog.First;
                 While not RxMemoryDataDog.Eof do
                 begin
                     if (RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsString = DataSetChangeProv.FieldByName('ID_DOG').AsString) and
                        (RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString = DataSetChangeProv.FieldByName('KOD_DOG').AsString)
                         then begin
                             flag_na_exi_dog := true;
                             RxMemoryDataDog.Open;
                             RxMemoryDataDog.Edit;
                             RxMemoryDataDog.FieldByName('RxMemDat_summa').Value := RxMemoryDataDog.FieldByName('RxMemDat_summa').Value + DataSetChangeProv['SUMMA'];
                             RxMemoryDataDog.Post;
                         end;
                     RxMemoryDataDog.Next;
                 end;
                 if not flag_na_exi_dog then
                 begin
                     RxMemoryDataDog.Open;
                     RxMemoryDataDog.Insert;
                     RxMemoryDataDog.FieldByName('RxMemDat_summa').Value               := DataSetChangeProv['SUMMA'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value                := DataSetChangeProv['ID_SM'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value              := DataSetChangeProv['ID_RAZD'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_st').Value                := DataSetChangeProv['ID_ST'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value              := DataSetChangeProv['ID_KEKV'];
                     try RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value           := StrToInt64(DataSetChangeProv.FieldByName('ID_DOG').AsString)  except RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value  := -1; end;
                     try RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value          := StrToInt64(DataSetChangeProv.FieldByName('KOD_DOG').AsString) except RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value := -1; end;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value  := DataSetChangeProv['SMETA_KOD'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value   := DataSetChangeProv['RAZD_NUM'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value  := DataSetChangeProv['STAT_KOD'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value   := DataSetChangeProv['KEKV_KOD'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := DataSetChangeProv.FieldByName('SMETA_KOD').AsString +'\'+ DataSetChangeProv.FieldByName('RAZD_NUM').AsString +'\'+ DataSetChangeProv.FieldByName('STAT_KOD').AsString +'\'+ DataSetChangeProv.FieldByName('KEKV_KOD').AsString;
                     try RxMemoryDataDog.FieldByName('RxMemDatid_man').Value           := DataSetChangeProv['ID_MAN']; except RxMemoryDataDog.FieldByName('RxMemDatid_man').Value := -1; end;
                     RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value               := DataSetChangeProv['ID_SCH'];

                     if (DataSetChangeProv['SUMMA_VALUTA'] = null) then
                       RxMemoryDataDog.FieldByName('RxMemorySummaValuta').Value := 0
                     else
                       RxMemoryDataDog.FieldByName('RxMemorySummaValuta').Value        := DataSetChangeProv['SUMMA_VALUTA'];

                     if (DataSetChangeProv['ID_VALUTA'] = null) then
                       RxMemoryDataDog.FieldByName('RxMemDatid_value').Value := 0
                     else
                       RxMemoryDataDog.FieldByName('RxMemDatid_value').Value           := DataSetChangeProv['ID_VALUTA'];

                     RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value              := DataSetChangeProv['SCH_NUMBER'];
                     RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value             := DataSetChangeProv['TITLE_STATE'];
                     RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value             := DataSetChangeProv['TITLE_RAZD'];
                     RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value            := DataSetChangeProv['TITLE_SMETA'];
                     RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value             := DataSetChangeProv['TITLE_KEKV'];
                     RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := DataSetChangeProv['ID_KASS_SH'];
                     RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value       := DataSetChangeProv['SCH_KASS_NUMBER'];

                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := 0;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := DataSetChangeProv['TITLE_SCH'];
                      
                     if DataSetChangeProv['NOTE_PROV'] <> null
                      then RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNote_prov').Value := DataSetChangeProv['NOTE_PROV']
                      else RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNote_prov').Value := '';

                    

                     if dog_type = 0 then   {другие}
                     begin
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value := type_d;
                     end;
                     if (dog_type = 1) or (dog_type = 2) then
                     begin
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value := n_do;
                     end;



                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  := '';
                     RxMemoryDataDog.FieldByName('fio_stud').Value                     := ffio;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := n_cust;
                     if ((ffio<>'') or(ffio<>null)) then
                     RxMemoryDataDog.FieldByName('fio_cust').Value                     := ffio+' '+n_cust
                     else RxMemoryDataDog.FieldByName('fio_cust').Value                := n_cust;
                     try RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := StrToDate(d_d) except RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value := null; end;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := reg_n;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTin').Value      := DataSetChangeProv['TIN'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldBirthDay').Value := DataSetChangeProv['BIRTHDAY'];
                     RxMemoryDataDog.Post;

                 end;
            DataSetChangeProv.Next;
        end;
        DataSetChangeProv.Close;
    end;

    if m = ShowOrder then
    begin
      
        SpeedButton1.enabled := false;
        SpeedButton2.enabled := false;
        SpeedButton3.enabled := false;
        SpeedButton4.enabled := false;
        SpeedButton5.enabled := false;
        SpeedButton6.enabled := false;
        SpeedButton7.enabled := false;
        SpeedButton8.enabled := false;
        SpeedButton9.enabled := false;
        SpeedButton10.enabled := false;
        SpeedButton11.enabled := false;
        SpeedButton12.enabled := false;
        cxTextEdit3.text         := myform.cxLabel18.Caption;
        cxTextEdit4.text         := myform.cxLabel20.Caption;
        cxTextEdit5.text         := myform.cxLabel16.Caption;
        cxButtonSaveAll.Enabled  := false;
        cxTextEditNum.Enabled    := false;
        DateTimePicker1.Enabled  := false;
        cxMRUEditFio.Enabled     := false;
        cxMemo1.Enabled          := false;
        cxTextEditSumma.Enabled  := false;
        cxButton2.Enabled  := false;
    end;

    DataSetOpen.Close;
    DataSetOpen.SQLs.SelectSQL.Text        := 'Select max(open_sch) as open_sch from  pub_sp_main_sch where id_sch='+inttostr(id_osnov_sch);
    DataSetOpen.Open;

    date_open       := DataSetOpen.FieldByName('open_sch').AsDateTime;

    if(myform.date_vip<date_open) then cxButton2.Enabled := false;

    if dog = Rashod_pl then {Забор данных от Лены}
    begin
        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM DOG_DT_PL_INFO_RAZBIVKA('+IntToStr(myform.id_key)+') ';
        Class_DataSet.Open;
        Class_DataSet.First;

        cxTextEditSumma.Text := myform.sum_doc;
        itt := 1;
        while not Class_DataSet.Eof do
        begin
             if (use_expert_sys=1) then
             begin ////////////////////////////////////////////////


                  DataSetExpertSys.Close;
                  DataSetExpertSys.SQLs.SelectSQL.Text        := 'Select * from PUB_GET_KORR_SCH_FOR_BANKKASSA(:NATIVEBANKKASSASCH, :NATIVESCHINDB,:IDTYPEDOG,:IDSM,:ACTUALDATE,:CHECK_KORR_SCH_BY_REG, :IDRZ, :IDST)';
                  DataSetExpertSys.ParamByName('NATIVEBANKKASSASCH').AsInteger    := id_osnov_sch;
                  DataSetExpertSys.ParamByName('NATIVESCHINDB').AsInteger         := prih;
                  if(Class_DataSet['ID_TIP_DOG']<>null)  then
                      DataSetExpertSys.ParamByName('IDTYPEDOG').AsInteger         := Class_DataSet['ID_TIP_DOG']
                  else
                      DataSetExpertSys.ParamByName('IDTYPEDOG').AsInteger         := 0;
                  if(Class_DataSet['ID_SMETA']<>null)  then
                      DataSetExpertSys.ParamByName('IDSM').AsInteger              := Class_DataSet['ID_SMETA']
                  else
                      DataSetExpertSys.ParamByName('IDSM').AsInteger       := 0;

                  DataSetExpertSys.ParamByName('ACTUALDATE').Asdate               := myform.date_vip;
                  DataSetExpertSys.ParamByName('CHECK_KORR_SCH_BY_REG').AsInteger := 1;

                  if(Class_DataSet['ID_RAZDEL']<>null)  then
                      DataSetExpertSys.ParamByName('IDRZ').AsInteger              := Class_DataSet['ID_RAZDEL']
                  else
                      DataSetExpertSys.ParamByName('IDRZ').AsInteger              := 0;

                  if(Class_DataSet['ID_STAT']<>null)  then
                       DataSetExpertSys.ParamByName('IDST').AsInteger             := Class_DataSet['ID_STAT']
                  else
                       DataSetExpertSys.ParamByName('IDST').AsInteger              := 0;
                  DataSetExpertSys.Open;
                  DataSetExpertSys.FetchAll;
                  if(DataSetExpertSys.RecordCount<1)or(DataSetExpertSys.IsEmpty) then
                  begin
                     id_sch_tmp := 0;
                     sch_name_tmp   := '';
                     sch_title_tmp := '';
                  end;
                  if(DataSetExpertSys.RecordCount=1) then
                  begin
                     if(DataSetExpertSys['KORRSCH']<>null) then
                           id_sch_tmp     := DataSetExpertSys['KORRSCH']
                     else id_sch_tmp      := 0;
                     if(DataSetExpertSys['SCH_NUMBER']<>null) then
                           sch_name_tmp   := DataSetExpertSys.FieldByName('SCH_NUMBER').AsString
                     else
                           sch_name_tmp   := '';
                     if(DataSetExpertSys['SCH_TITLE']<>null) then
                           sch_title_tmp  := DataSetExpertSys.FieldByName('SCH_TITLE').AsString
                     else
                          sch_title_tmp := '';
                  end;
                  if(DataSetExpertSys.RecordCount>1) then
                  begin
                     if((id_sch_tmp=null)or(id_sch_tmp=0)) then
                     begin
                         if ShowExpertSch(self, self, ResSch) then
                         begin
                             id_sch_tmp     := ResSch[0];
                             sch_name_tmp   := ResSch[1];
                             sch_title_tmp  := ResSch[2];
                         end;
                     end else
                     begin
                         DataSetExpertSys.First;
                         while not DataSetExpertSys.Eof do
                         begin
                             if(id_sch_tmp=DataSetExpertSys['KORRSCH']) then sch_exist :=1;
                             DataSetExpertSys.Next;
                         end;
                         if(sch_exist =1) then
                         begin
                             sch_exist :=0;
                         end else
                         begin
                             if ShowExpertSch(self, self, ResSch) then
                             begin
                                 id_sch_tmp     := ResSch[0];
                                 sch_name_tmp   := ResSch[1];
                                 sch_title_tmp  := ResSch[2];
                             end;
                         end;
                      end;
                  end;

             end else
             begin
                  if(Class_DataSet['ID_BL_ACCOUNT']<> null)and (Class_DataSet['ID_BL_ACCOUNT']<> 0) then
                  begin
                     id_sch_tmp     := Class_DataSet['ID_BL_ACCOUNT'];
                     sch_name_tmp   := Class_DataSet['KOD_BL_ACCOUNT'];
                     sch_title_tmp  := Class_DataSet['NAME_BL_ACCOUNT'];
                  end
                  else
                  begin
                      id_sch_tmp     := 0;
                     sch_name_tmp   := '';
                     sch_title_tmp  := '';
                  end;

             end;
            RxMemoryDataSaveAll.Open;
            RxMemoryDataSaveAll.Insert;
            RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                   := Class_DataSet['SUMMA_SMET'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                    := Class_DataSet['ID_SMETA'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                  := Class_DataSet['ID_RAZDEL'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                    := Class_DataSet['ID_STAT'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                  := Class_DataSet['ID_KEKV'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := Class_DataSet['ID_DOG'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := Class_DataSet['KOD_DOG'];
            try RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value               := StrToInt64(Class_DataSet.fbn('ID_MAN').AsString);  except RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value := 0;  end;
            try RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value                  := Class_DataSet.fbn('FIO').AsString;                 except RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value    := ''; end;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                   := id_osnov_sch;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value      := title_sch;
            RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value              := null;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                 := null;
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                  := name_osnov_sch;
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                 := Class_DataSet['TITLE_STAT'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                 := Class_DataSet['TITLE_RAZDEL'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                := Class_DataSet['TITLE_SMETA'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                 := Class_DataSet['TITLE_KEKV'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value         := id_sch_tmp;
            RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value           := sch_name_tmp;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value   := sch_title_tmp;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value      := Class_DataSet['NUM_SMETA'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value       := Class_DataSet['NUM_RAZDEL'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value      := Class_DataSet['NUM_STAT'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value       := Class_DataSet['NUM_KEKV'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := Class_DataSet.FieldByName('NUM_SMETA').AsString +'\'+ Class_DataSet.FieldByName('NUM_RAZDEL').AsString +'\'+ Class_DataSet.FieldByName('NUM_STAT').AsString +'\'+ Class_DataSet.FieldByName('NUM_KEKV').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := Class_DataSet['SHORT_NAME_TIP_DOG'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := Class_DataSet['REG_DOG'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value  := Class_DataSet['DATE_DOG'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := Class_DataSet['N_DOG'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := Class_DataSet['SHORT_NAME_CUST'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value      := null;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := null;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value := '';
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
            RxMemoryDataSaveAll.FieldByName('id').Value                               := itt;
            inc(itt);
            RxMemoryDataSaveAll.Post;
                 //занос в договора
                 flag_na_exi_dog := false;
                 RxMemoryDataDog.First;
                 While not RxMemoryDataDog.Eof do
                 begin
                     if (RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = Class_DataSet['ID_DOG']) and
                        (RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString = Class_DataSet['KOD_DOG'])
                         then begin
                             RxMemoryDataDog.Open;
                             RxMemoryDataDog.Edit;
                             RxMemoryDataDog.FieldByName('RxMemDat_summa').Value := RxMemoryDataDog.FieldByName('RxMemDat_summa').Value + Class_DataSet['SUMMA_SMET'];
                             RxMemoryDataDog.Post;
                             flag_na_exi_dog := true;
                         end;
                     RxMemoryDataDog.Next;
                 end;
                 if not flag_na_exi_dog then
                 begin
                     RxMemoryDataDog.Open;
                     RxMemoryDataDog.Insert;
                     RxMemoryDataDog.FieldByName('RxMemDat_summa').Value               := Class_DataSet['SUMMA_SMET'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value                := Class_DataSet['ID_SMETA'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value              := Class_DataSet['ID_RAZDEL'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_st').Value                := Class_DataSet['ID_STAT'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value              := Class_DataSet['ID_KEKV'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value               := Class_DataSet['ID_DOG'];
                     RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value              := Class_DataSet['KOD_DOG'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value  := Class_DataSet['NUM_SMETA'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value   := Class_DataSet['NUM_RAZDEL'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value  := Class_DataSet['NUM_STAT'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value   := Class_DataSet['NUM_KEKV'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := Class_DataSet.FieldByName('NUM_SMETA').AsString +'\'+ Class_DataSet.FieldByName('NUM_RAZDEL').AsString +'\'+ Class_DataSet.FieldByName('NUM_STAT').AsString +'\'+ Class_DataSet.FieldByName('NUM_KEKV').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatid_man').Value               := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value               := id_osnov_sch;
                     RxMemoryDataDog.FieldByName('RxMemDatsumma_value').Value          := null;
                     RxMemoryDataDog.FieldByName('RxMemDatid_value').Value             := null;
                     RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value              := name_osnov_sch;
                     RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value             := Class_DataSet['TITLE_STAT'];
                     RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value             := Class_DataSet['TITLE_RAZDEL'];
                     RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value            := Class_DataSet['TITLE_SMETA'];
                     RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value             := Class_DataSet['TITLE_KEKV'];
                     RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := id_sch_tmp;
                     RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value       := sch_name_tmp;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := sch_title_tmp;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := id_ss;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := title_sch;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := Class_DataSet['SHORT_NAME_CUST'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := Class_DataSet['DATE_DOG'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := Class_DataSet['REG_DOG'];
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  := Class_DataSet['SHORT_NAME_TIP_DOG'];
                     RxMemoryDataDog.Post;
                 end;
            Class_DataSet.Next;
        end;
        Class_DataSet.Close;
    end;

    // договора
    if dog = SingleDog then
    begin
      Class_DataSet.Close;
      Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(myform.id_ras)+') ';
      Class_DataSet.Open;
      Class_DataSet.First;
      while not Class_DataSet.Eof do
      begin
          if Class_DataSet['FLAG_DEFAULT'] = 1 then
          begin
              if prih = 1 then
              begin
                  id_my_sc := Class_DataSet['ID_SCH'];
                  id_my_kor_sc := 0;
                  kod_my_sc := Class_DataSet['SCH_NUM'];
                  kod_my_kor_sc := '';
              end else
              begin
                  id_my_sc := 0;
                  id_my_kor_sc := Class_DataSet['ID_SCH'];
                  kod_my_sc := '';
                  kod_my_kor_sc := Class_DataSet['SCH_NUM'];
              end;
          end;
          Class_DataSet.Next;
      end;
      l := Length(myform.dogparam);
      for k := 0 to l-1 do
      begin
        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('+IntToStr(myform.dogparam[k].NumSmeta)+', '+IntToStr(myform.dogparam[k].NumRazd)+', '+IntToStr(myform.dogparam[k].NumStat)+', '+IntToStr(0)+')';
        Class_DataSet.Open;
        RxMemoryDataSaveAll.Open;
        RxMemoryDataSaveAll.Insert;
//        RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
//        RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DT_DOC'];
        RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                   := myform.dogparam[k].Summa;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                    := Class_DataSet.FieldByName('ID_SMETA').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                  := Class_DataSet.FieldByName('ID_RAZD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                    := Class_DataSet.FieldByName('ID_STATE').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                  := Class_DataSet.FieldByName('ID_KEKV').Asvariant;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := myform.dogparam[k].IdDog;
        RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := myform.dogparam[k].KodDog;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                   := 0;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                   := id_my_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value              := 0;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                 := 0;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                  := kod_my_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                 := Class_DataSet.FieldByName('ST_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                 := Class_DataSet.FieldByName('RAZ_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                := Class_DataSet.FieldByName('SM_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                 := Class_DataSet.FieldByName('KEKV_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value         := id_my_kor_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value           := kod_my_kor_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
        RxMemoryDataSaveAll.FieldByName('id').Value                               := k+1;
        RxMemoryDataSaveAll.Post;
        Class_DataSet.Close;
      end;
    end;

    // договора за обучение
    if dog = SingleDog then
    begin
      Class_DataSet.Close;
      Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(myform.id_ras)+') ';
      Class_DataSet.Open;
      Class_DataSet.First;
      while not Class_DataSet.Eof do
      begin
          if Class_DataSet['FLAG_DEFAULT'] = 1 then
          begin
              if prih = 1 then
              begin
                  id_my_sc := Class_DataSet['ID_SCH'];
                  id_my_kor_sc := 0;
                  kod_my_sc := Class_DataSet['SCH_NUM'];
                  kod_my_kor_sc := '';
              end else
              begin
                  id_my_sc := 0;
                  id_my_kor_sc := Class_DataSet['ID_SCH'];
                  kod_my_sc := '';
                  kod_my_kor_sc := Class_DataSet['SCH_NUM'];
              end;
          end;
          Class_DataSet.Next;
      end;
      l := Length(myform.dogparam);
      for k := 0 to l-1 do
      begin
        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('+IntToStr(myform.dogparam[k].NumSmeta)+', '+IntToStr(myform.dogparam[k].NumRazd)+', '+IntToStr(myform.dogparam[k].NumStat)+', '+IntToStr(0)+')';
        Class_DataSet.Open;
        RxMemoryDataSaveAll.Open;
        RxMemoryDataSaveAll.Insert;
//        RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
//        RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DT_DOC'];
        RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                 := myform.dogparam[k].Summa;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                  := Class_DataSet.FieldByName('ID_SMETA').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                := Class_DataSet.FieldByName('ID_RAZD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                  := Class_DataSet.FieldByName('ID_STATE').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                := Class_DataSet.FieldByName('ID_KEKV').Asvariant;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                 := myform.dogparam[k].IdDog;
        RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                := myform.dogparam[k].KodDog;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                 := 0;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                 := id_my_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value            := 0;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value               := 0;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                := kod_my_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value               := Class_DataSet.FieldByName('ST_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value               := Class_DataSet.FieldByName('RAZ_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value              := Class_DataSet.FieldByName('SM_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value               := Class_DataSet.FieldByName('KEKV_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := id_my_kor_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := kod_my_kor_sc;
        RxMemoryDataSaveAll.FieldByName('id').Value                             := k+1;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value    := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
        RxMemoryDataSaveAll.Post;
        Class_DataSet.Close;
      end;
    end;

    if dog = tranzit then
    begin
        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('+IntToStr(myform.pFIBDataSet_ini.FieldByName('ID_SM').AsInteger)+', '+IntToStr(myform.pFIBDataSet_ini.FieldByName('ID_RAZD').AsInteger)+', '+IntToStr(myform.pFIBDataSet_ini.FieldByName('ID_STAT').AsInteger)+', '+IntToStr(myform.pFIBDataSet_ini.FieldByName('ID_KEKV').AsInteger)+')';
        Class_DataSet.Open;

         RxMemoryDataSaveAll.Open;
         RxMemoryDataSaveAll.Insert;
         RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value               := myform.sum_doc;
         RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                := Class_DataSet.FieldByName('ID_SMETA').AsString;
         RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value              := Class_DataSet.FieldByName('ID_RAZD').AsString;
         RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                := Class_DataSet.FieldByName('ID_STATE').AsString;
         RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value              := Class_DataSet.FieldByName('ID_KEKV').Asvariant;
         RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value               := myform.pFIBDataSet_ini.FieldByName('ID_DOG').Asvariant;
         RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value              := myform.pFIBDataSet_ini.FieldByName('KOD_DOG').Asvariant;
         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value  := Class_DataSet.FieldByName('ST_KOD').AsString;
         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value   := Class_DataSet.FieldByName('RAZ_KOD').AsString;
         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value  := Class_DataSet.FieldByName('SM_KOD').AsString;
         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value   := Class_DataSet.FieldByName('KEKV_KOD').AsString;
         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := Class_DataSet.FieldByName('SM_KOD').AsString +'\'+Class_DataSet.FieldByName('RAZ_KOD').AsString +'\'+ Class_DataSet.FieldByName('ST_KOD').AsString +'\'+ Class_DataSet.FieldByName('KEKV_KOD').AsString;
         RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value               := 0;
         RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value               := id_osnov_sch;
         RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value          := null;
         RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value             := null;
         RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value              := name_osnov_sch;
         RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value             := Class_DataSet.FieldByName('ST_TITLE').AsString;
         RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value             := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
         RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value            := Class_DataSet.FieldByName('SM_TITLE').AsString;
         RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value             := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
         RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := myform.pFIBDataSet_ini.FieldByName('ID_SCH_B').Asvariant;
         RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value       := myform.pFIBDataSet_ini.FieldByName('kod_sch_default').AsSTring;
         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
         //RxMemoryDataSaveAll.FieldByName('id').Value                           := 1;

         RxMemoryDataSaveAll.Post;

        flag_na_exi_dog := false;
            RxMemoryDataDog.First;
                     While not RxMemoryDataDog.Eof do
                     begin
                         if ((RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = myform.pFIBDataSet_ini.FieldByName('ID_DOG').Asvariant) and
                            (RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString = myform.pFIBDataSet_ini.FieldByName('KOD_DOG').AsString))
                             then begin
                                 RxMemoryDataDog.Open;
                                 RxMemoryDataDog.Edit;
                                 RxMemoryDataDog.FieldByName('RxMemDat_summa').Value := RxMemoryDataDog.FieldByName('RxMemDat_summa').Value + myform.sum_doc;
                                 flag_na_exi_dog := true;
                                 RxMemoryDataDog.Post;
                             end;
                         RxMemoryDataDog.Next;
                     end;
                     if not flag_na_exi_dog then
                     begin
                         RxMemoryDataDog.Open;
                         RxMemoryDataDog.Insert;
                         RxMemoryDataDog.FieldByName('RxMemDat_summa').Value               := myform.sum_doc;
                         RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value                := Class_DataSet.FieldByName('ID_SMETA').AsString;
                         RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value              := Class_DataSet.FieldByName('ID_RAZD').AsString;
                         RxMemoryDataDog.FieldByName('RxMemDatid_st').Value                := Class_DataSet.FieldByName('ID_STATE').AsString;
                         RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value              := Class_DataSet.FieldByName('ID_KEKV').Asvariant;
                         RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value               := myform.pFIBDataSet_ini.FieldByName('ID_DOG').Asvariant;
                         RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value              := myform.pFIBDataSet_ini.FieldByName('KOD_DOG').Asvariant;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value  := Class_DataSet.FieldByName('ST_KOD').AsString;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value   := Class_DataSet.FieldByName('RAZ_KOD').AsString;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value  := Class_DataSet.FieldByName('SM_KOD').AsString;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value   := Class_DataSet.FieldByName('KEKV_KOD').AsString;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := Class_DataSet.FieldByName('ST_KOD').AsString +'\'+Class_DataSet.FieldByName('RAZ_KOD').AsString +'\'+ Class_DataSet.FieldByName('SM_KOD').AsString +'\'+ Class_DataSet.FieldByName('KEKV_KOD').AsString;
                         RxMemoryDataDog.FieldByName('RxMemDatid_man').Value               := 0;
                         RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value               := id_osnov_sch;
                         RxMemoryDataDog.FieldByName('RxMemDatsumma_value').Value          := null;
                         RxMemoryDataDog.FieldByName('RxMemDatid_value').Value             := null;
                         RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value              := name_osnov_sch;
                         RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value             := Class_DataSet.FieldByName('ST_TITLE').AsString;
                         RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value             := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
                         RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value            := Class_DataSet.FieldByName('SM_TITLE').AsString;
                         RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value             := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
                         RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := Class_DataSet.FieldByName('SM_TITLE').AsString;
                         RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value       := myform.pFIBDataSet_ini.FieldByName('ID_SCH_B').Asvariant;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := myform.pFIBDataSet_ini.FieldByName('title_sch_default').Asvariant;

                         //RxMemoryDataDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := id_ss;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := title_sch;
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := myform.pFIBDataSet_ini.FieldByName('D_NAME_CUSTOMER_K').Asvariant;
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := myform.pFIBDataSet_ini.FieldByName('d_dog_sh2').Asvariant;
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := myform.pFIBDataSet_ini.FieldByName('reg_num_sh2').Asvariant; ;
                         //RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  :='';
                         RxMemoryDataDog.Post;
                     end;
            //end;
            Class_DataSet.Close;

    end;

    if dog = Shablon then
    begin
        DataSetShablons.Close;
        DataSetShablons.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_SHABLON('+IntToStr(prih)+') where kod_operation='+IntToStr(myform.kod_shablon)+'';
        DataSetShablons.Open;
        DataSetShablons.FetchAll;

        DataSetShablons.First;

        while not DataSetShablons.Eof do
        begin

             RxMemoryDataSaveAll.Open;
             RxMemoryDataSaveAll.Insert;
             RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value               := myform.sum_doc;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                := DataSetShablons.FieldByName('ID_SM').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value              := DataSetShablons.FieldByName('ID_RAZD').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                := DataSetShablons.FieldByName('ID_ST').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value              := DataSetShablons.FieldByName('ID_KEKV').Asvariant;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value               := DataSetShablons.FieldByName('ID_DOG').Asvariant;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value              := DataSetShablons.FieldByName('KOD_DOG').Asvariant;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value  := DataSetShablons.FieldByName('KOD_SMETA').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value   := DataSetShablons.FieldByName('KOD_RAZD').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value  := DataSetShablons.FieldByName('KOD_STATE').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value   := DataSetShablons.FieldByName('KOD_KEKV').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := DataSetShablons.FieldByName('KOD_SMETA').AsString +'\'+DataSetShablons.FieldByName('KOD_RAZD').AsString +'\'+ DataSetShablons.FieldByName('KOD_STATE').AsString +'\'+ DataSetShablons.FieldByName('KOD_KEKV').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value               := 0;

             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value               := id_osnov_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value          := null;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value             := null;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value              := name_osnov_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value             := DataSetShablons.FieldByName('ST_TITLE').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value             := DataSetShablons.FieldByName('RAZ_TITLE').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value            := DataSetShablons.FieldByName('SM_TITLE').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value             := DataSetShablons.FieldByName('KEKV_TITLE').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := DataSetShablons.FieldByName('ID_SCH_DEFAULT').Asvariant;
             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value       := DataSetShablons.FieldByName('KOD_SCH_DEFAULT').AsSTring;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
             //RxMemoryDataSaveAll.FieldByName('id').Value                           := 1;




             RxMemoryDataSaveAll.Post;


            flag_na_exi_dog := false;
                RxMemoryDataDog.First;
                         While not RxMemoryDataDog.Eof do
                         begin
                             if ((RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = DataSetShablons.FieldByName('ID_DOG').Asvariant) and
                                (RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString = DataSetShablons.FieldByName('KOD_DOG').AsString))
                                 then begin
                                     RxMemoryDataDog.Open;
                                     RxMemoryDataDog.Edit;
                                     RxMemoryDataDog.FieldByName('RxMemDat_summa').Value := RxMemoryDataDog.FieldByName('RxMemDat_summa').Value + myform.sum_doc;
                                     flag_na_exi_dog := true;
                                     RxMemoryDataDog.Post;
                                 end;
                             RxMemoryDataDog.Next;
                         end;
                         if not flag_na_exi_dog then
                         begin

                             RxMemoryDataDog.Open;
                             RxMemoryDataDog.Insert;
                             RxMemoryDataDog.FieldByName('RxMemDat_summa').Value               := myform.sum_doc;
                             RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value                := DataSetShablons.FieldByName('ID_SM').AsString;
                             RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value              := DataSetShablons.FieldByName('ID_RAZD').AsString;
                             RxMemoryDataDog.FieldByName('RxMemDatid_st').Value                := DataSetShablons.FieldByName('ID_ST').AsString;
                             RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value              := DataSetShablons.FieldByName('ID_KEKV').Asvariant;
                             RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value               := DataSetShablons.FieldByName('ID_DOG').Asvariant;
                             RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value              := DataSetShablons.FieldByName('KOD_DOG').Asvariant;
                             RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value  := DataSetShablons.FieldByName('KOD_SMETA').AsString;
                             RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value   := DataSetShablons.FieldByName('KOD_RAZD').AsString;
                             RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value  := DataSetShablons.FieldByName('KOD_STATE').AsString;
                             RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value   := DataSetShablons.FieldByName('KOD_KEKV').AsString;
                             RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := DataSetShablons.FieldByName('KOD_SMETA').AsString +'\'+DataSetShablons.FieldByName('KOD_RAZD').AsString +'\'+ DataSetShablons.FieldByName('KOD_STATE').AsString +'\'+ DataSetShablons.FieldByName('KOD_KEKV').AsString;
                             RxMemoryDataDog.FieldByName('RxMemDatid_man').Value               := 0;
                             RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value               := id_osnov_sch;
                             RxMemoryDataDog.FieldByName('RxMemDatsumma_value').Value          := null;
                             RxMemoryDataDog.FieldByName('RxMemDatid_value').Value             := null;
                             RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value              := name_osnov_sch;
                             RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value             := DataSetShablons.FieldByName('ST_TITLE').AsString;
                             RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value             := DataSetShablons.FieldByName('RAZ_TITLE').AsString;
                             RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value            := DataSetShablons.FieldByName('SM_TITLE').AsString;
                             RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value             := DataSetShablons.FieldByName('KEKV_TITLE').AsString;
                             RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := DataSetShablons.FieldByName('ID_SCH_DEFAULT').AsString;
                             RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value       := DataSetShablons.FieldByName('KOD_SCH_DEFAULT').Asvariant;
                             RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value :=DataSetShablons.FieldByName('title_sch_default').Asvariant;;

                             RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := title_sch;
                             RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := DataSetShablons.FieldByName('NAME_CUST').Asvariant;
                             RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := DataSetShablons.FieldByName('DATE_DOG').Asvariant;
                             RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := DataSetShablons.FieldByName('REG_DOG').Asvariant; ;
                             //RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  :='';
                             RxMemoryDataDog.Post;
                         end;
                         DataSetShablons.Next;
                end;
    end;

    if (Dog = Kassa_Bank) then {операция типа Касса-Банк}
    begin
        tip_multy := Show_select_vstrech(id_osnov_sch, myform.id_sch, self, dateToStr(myform.date_vip));
        if tip_multy.ModalResult = 1 then
        begin
            T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_FIND_WARNING_CAPTION);
            T.Show;
            T.UpDate;
            count := length(tip_multy.res);
            for k:=0 to count-1 do
            begin
                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM DOG_DT_DOCUMENT_INFO('+IntToStr(tip_multy.res[k].id_dog)+') ';
                Class_DataSet.Open;
                RxMemoryDataSaveAll.Open;
                RxMemoryDataSaveAll.Insert;
                RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                   := tip_multy.res[k].summa_prov;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                    := tip_multy.res[k].IDSmeta;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                  := tip_multy.res[k].IDRazd;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                    := tip_multy.res[k].IDStat;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                  := tip_multy.res[k].id_Kekv;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := tip_multy.res[k].id_dog;
                RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := tip_multy.res[k].kod_dog;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                   := 0;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                   := id_osnov_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value      := title_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value              := tip_multy.res[k].summa_valute;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                 := tip_multy.res[k].id_valute;
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                  := name_osnov_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                 := tip_multy.res[k].nameState;
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                 := tip_multy.res[k].nameRazd;
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                := tip_multy.res[k].nameSmeta;
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                 := tip_multy.res[k].nameKekv;
                RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value         := tip_multy.res[k].id_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value           := tip_multy.res[k].kod_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value   := tip_multy.res[k].title_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := tip_multy.res[k].id_prov;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value      := tip_multy.res[k].kodSmeta;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value       := tip_multy.res[k].kodRazd;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value      := tip_multy.res[k].kodState;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value       := tip_multy.res[k].kodKekv;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := IntToStr(tip_multy.res[k].kodSmeta) +'\'+IntToStr(tip_multy.res[k].kodRazd) +'\'+ IntToStr(tip_multy.res[k].kodState) +'\'+ IntToStr(tip_multy.res[k].kodKekv);
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := Class_DataSet.FieldByName('SHORT_NAME').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := Class_DataSet.FieldByName('D_REGEST_NUM').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value  := Class_DataSet.FieldByName('D_D_DOG').AsDateTime;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := Class_DataSet.FieldByName('D_N_DOG').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := Class_DataSet.FieldByName('D_NAME_CUSTOMER_K').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value      := null;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := null;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value := '';
                RxMemoryDataSaveAll.FieldByName('id').Value                               := k+1;
                RxMemoryDataSaveAll.FieldByName('Vstrech').Value                          := 1;
                RxMemoryDataSaveAll.Post;
                     //занос в договора
                     flag_na_exi_dog := false;
                     RxMemoryDataDog.First;
                     While not RxMemoryDataDog.Eof do
                     begin
                         if ((RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = tip_multy.res[k].id_dog) and
                            (RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString = IntToStr(tip_multy.res[k].kod_dog)))
                             then begin
                                 RxMemoryDataDog.Open;
                                 RxMemoryDataDog.Edit;
                                 RxMemoryDataDog.FieldByName('RxMemDat_summa').Value := RxMemoryDataDog.FieldByName('RxMemDat_summa').Value + tip_multy.res[k].summa_prov;
                                 flag_na_exi_dog := true;
                                 RxMemoryDataDog.Post;
                             end;
                         RxMemoryDataDog.Next;
                     end;
                     if not flag_na_exi_dog then
                     begin
                         RxMemoryDataDog.Open;
                         RxMemoryDataDog.Insert;
                         RxMemoryDataDog.FieldByName('RxMemDat_summa').Value               := tip_multy.res[k].summa_prov;
                         RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value                := tip_multy.res[k].IDSmeta;
                         RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value              := tip_multy.res[k].IDRazd;
                         RxMemoryDataDog.FieldByName('RxMemDatid_st').Value                := tip_multy.res[k].IDStat;
                         RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value              := tip_multy.res[k].id_Kekv;
                         RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value               := tip_multy.res[k].id_dog;
                         RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value              := tip_multy.res[k].kod_dog;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value  := tip_multy.res[k].kodSmeta;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value   := tip_multy.res[k].kodRazd;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value  := tip_multy.res[k].kodState;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value   := tip_multy.res[k].kodKekv;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := IntToStr(tip_multy.res[k].kodSmeta) +'\'+IntToStr(tip_multy.res[k].kodRazd) +'\'+ IntToStr(tip_multy.res[k].kodState) +'\'+ IntToStr(tip_multy.res[k].kodKekv);
                         RxMemoryDataDog.FieldByName('RxMemDatid_man').Value               := 0;
                         RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value               := id_osnov_sch;
                         RxMemoryDataDog.FieldByName('RxMemDatsumma_value').Value          := null;
                         RxMemoryDataDog.FieldByName('RxMemDatid_value').Value             := null;
                         RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value              := name_osnov_sch;
                         RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value             := tip_multy.res[k].nameState;
                         RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value             := tip_multy.res[k].nameRazd;
                         RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value            := tip_multy.res[k].nameSmeta;
                         RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value             := tip_multy.res[k].nameKekv;
                         RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := tip_multy.res[k].id_sch;
                         RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value       := tip_multy.res[k].kod_sch;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := tip_multy.res[k].title_sch;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := id_ss;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := title_sch;
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := Class_DataSet.FieldByName('D_NAME_CUSTOMER_K').AsString;
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := Class_DataSet.FieldByName('D_D_DOG').AsDateTime;
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := Class_DataSet.FieldByName('D_REGEST_NUM').AsString;
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  := Class_DataSet.FieldByName('SHORT_NAME').AsString;
                         RxMemoryDataDog.Post;
                     end;
            end;
            Class_DataSet.Close;
            T.Free;
        end;
    end;

    {операция типа р/с-р/с}
    if (Dog = RS_RS) then
    begin
        flag_rs_rs := true;
        tip_multy := Show_select_vstrech(id_osnov_sch, myform.id_sch, self, dateToStr(myform.date_vip));
        if tip_multy.ModalResult = 1 then
        begin
//            Class_DataSet.First;
//            cxTextEditSumma.Text := Class_DataSet['SUMMA'];
            count := length(tip_multy.res);
            for k:=0 to count-1 do
            begin
                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM DOG_DT_DOCUMENT_INFO('+IntToStr(tip_multy.res[k].id_dog)+') ';
                Class_DataSet.Open;
                RxMemoryDataSaveAll.Open;
                RxMemoryDataSaveAll.Insert;
                RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                   := tip_multy.res[k].summa_prov;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                    := tip_multy.res[k].IDSmeta;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                  := tip_multy.res[k].IDRazd;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                    := tip_multy.res[k].IDStat;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                  := tip_multy.res[k].id_Kekv;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := tip_multy.res[k].id_dog;
                RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := tip_multy.res[k].kod_dog;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                   := 0;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                   := id_osnov_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value      := title_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value              := tip_multy.res[k].summa_valute;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                 := tip_multy.res[k].id_valute;
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                  := name_osnov_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                 := tip_multy.res[k].nameState;
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                 := tip_multy.res[k].nameRazd;
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                := tip_multy.res[k].nameSmeta;
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                 := tip_multy.res[k].nameKekv;
                RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value         := myform.id_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value           := tip_multy.res[k].kod_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value   := tip_multy.res[k].title_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := tip_multy.res[k].id_prov;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value      := tip_multy.res[k].kodSmeta;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value       := tip_multy.res[k].kodRazd;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value      := tip_multy.res[k].kodState;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value       := tip_multy.res[k].kodKekv;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := IntToStr(tip_multy.res[k].kodSmeta) +'\'+IntToStr(tip_multy.res[k].kodRazd) +'\'+ IntToStr(tip_multy.res[k].kodState) +'\'+ IntToStr(tip_multy.res[k].kodKekv);
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := Class_DataSet.FieldByName('SHORT_NAME').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := Class_DataSet.FieldByName('D_REGEST_NUM').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value  := Class_DataSet.FieldByName('D_D_DOG').AsDateTime;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := Class_DataSet.FieldByName('D_N_DOG').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := Class_DataSet.FieldByName('D_NAME_CUSTOMER_K').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value      := null;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := null;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_Prov').Value := '';
                RxMemoryDataSaveAll.FieldByName('id').Value                               := k+1;
                RxMemoryDataSaveAll.Post;
                     //занос в договора
                     flag_na_exi_dog := false;
                     RxMemoryDataDog.First;
                     While not RxMemoryDataDog.Eof do
                     begin
                         if ((RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = tip_multy.res[k].id_dog) and
                            (RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString = IntToStr(tip_multy.res[k].kod_dog)))
                             then begin
                                 RxMemoryDataDog.Open;
                                 RxMemoryDataDog.Edit;
                                 RxMemoryDataDog.FieldByName('RxMemDat_summa').Value := RxMemoryDataDog.FieldByName('RxMemDat_summa').Value + tip_multy.res[k].summa_prov;
                                 flag_na_exi_dog := true;
                                 RxMemoryDataDog.Post;
                             end;
                         RxMemoryDataDog.Next;
                     end;
                     if not flag_na_exi_dog then
                     begin
                         RxMemoryDataDog.Open;
                         RxMemoryDataDog.Insert;
                         RxMemoryDataDog.FieldByName('RxMemDat_summa').Value               := tip_multy.res[k].summa_prov;
                         RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value                := tip_multy.res[k].IDSmeta;
                         RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value              := tip_multy.res[k].IDRazd;
                         RxMemoryDataDog.FieldByName('RxMemDatid_st').Value                := tip_multy.res[k].IDStat;
                         RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value              := tip_multy.res[k].id_Kekv;
                         RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value               := tip_multy.res[k].id_dog;
                         RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value              := tip_multy.res[k].kod_dog;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value  := tip_multy.res[k].kodSmeta;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value   := tip_multy.res[k].kodRazd;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value  := tip_multy.res[k].kodState;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value   := tip_multy.res[k].kodKekv;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := IntToStr(tip_multy.res[k].kodSmeta) +'\'+IntToStr(tip_multy.res[k].kodRazd) +'\'+ IntToStr(tip_multy.res[k].kodState) +'\'+ IntToStr(tip_multy.res[k].kodKekv);
                         RxMemoryDataDog.FieldByName('RxMemDatid_man').Value               := 0;
                         RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value               := id_osnov_sch;
                         RxMemoryDataDog.FieldByName('RxMemDatsumma_value').Value          := null;
                         RxMemoryDataDog.FieldByName('RxMemDatid_value').Value             := null;
                         RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value              := name_osnov_sch;
                         RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value             := tip_multy.res[k].nameState;
                         RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value             := tip_multy.res[k].nameRazd;
                         RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value            := tip_multy.res[k].nameSmeta;
                         RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value             := tip_multy.res[k].nameKekv;
                         RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := myform.id_sch;
                         RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value       := tip_multy.res[k].kod_sch;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := tip_multy.res[k].title_sch;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := id_ss;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := title_sch;
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := Class_DataSet.FieldByName('D_NAME_CUSTOMER_K').AsString;
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := Class_DataSet.FieldByName('D_D_DOG').AsDateTime;
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := Class_DataSet.FieldByName('D_REGEST_NUM').AsString;
                         RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  := Class_DataSet.FieldByName('SHORT_NAME').AsString;
                         RxMemoryDataDog.Post;
                     end;
            end;
            Class_DataSet.Close;
        end;
    end;

    id_valuta   := id_valuta_in;
    name_valuta := name_valuta_in;

    if ((id_valuta = 0) or (id_valuta = null)) then
    begin
      id_valuta := 0;
      label1.Visible         := false;
      label2.Visible         := false;
      ValutaTextEdit.Visible := false;
      ValutaLabel.Visible    := False;
      cxGridSaveAllDBTableView1DBColumn3.Visible := false;
      cxGridPodDogDBTableView1DBColumn5.Visible  := false;
    end
    else
    begin
      label1.Visible         := true;
      label2.Visible         := true;
      ValutaTextEdit.Visible := true;
      ValutaLabel.Visible    := true;
      ValutaLabel.Caption    := name_valuta;
      cxGridSaveAllDBTableView1DBColumn3.Visible := True;
      cxGridPodDogDBTableView1DBColumn5.Visible  := True;
    end;

    flag_show_dog := true;
end;

procedure TfmBankOrder.ActionCloseExecute(Sender: TObject);
begin
    if flag <> ShowOrder then
    begin
        if MessageBox(Handle, PChar(Un_R_file_Alex.KASSA_EXIT_ERROR), PChar(Un_R_file_Alex.KASSA_LOOK_FOR), mb_YesNO)=mrYes then Close
    end
    else close;
end;

procedure TfmBankOrder.ActionAddExecute(Sender: TObject);
var
    id_smeta, id_stat, id_r, id_k, id_sch, id_man_prov, id_kor_sch : int64;
    name_smeta, name_stat, name_r, name_k, name_sch, name_fio, name_kor_sch, t_sch, t_kor_sch, kod_sm, kod_rz, kod_st, kod_kekv : string;
    summa : double;
    summa_doc : double;
    summa_valuta : double;
    summa_valuta_doc : double;
    date_dog, num_dog, name_cust, type_dog, reg_dog, tin, birthday, note_prov : string;
    id_dog, kod_dog, id_prov : int64;
    cr_by_dt, type_schablon, itt, kod_oper : integer;
begin
flag_show_dog := false;
decimalseparator := ',';
if flag <> ShowOrder then
begin
    if PageControl1.ActivePage = TabSheet2 then
    begin
        RxMemoryDataSaveAll.First;
        summa_doc := 0;
        summa_valuta_doc := 0;
        while not RxMemoryDataSaveAll.Eof do
        begin
            summa_doc        := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
            summa_valuta_doc := summa_valuta_doc + RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value;
            RxMemoryDataSaveAll.next;
        end;
        summa    := StrToFloat(cxTextEditSumma.Text) - summa_doc;
        id_smeta := 0;
        id_stat  := 0;
        id_r     := 0;
        id_k     := 0;
        id_sch   := id_osnov_sch;
        id_kor_sch := 0;
        name_fio   := cxMRUEditFio.Text;
        name_kor_sch := '';
        name_smeta := '';
        name_stat  := '';
        name_r     := '';
        name_k     := '';
        name_sch   := name_osnov_sch;
        buh_prov   := 1;
        kod_sm     := '';
        kod_rz     := '';
        kod_st     := '';
        kod_kekv   := '';
        t_sch      := title_sch;
        t_kor_sch  := '';
        date_dog   := '';
        num_dog    := '';
        name_cust  := '';
        type_dog   := '';
        reg_dog    := '';
        id_dog     := 0;
        kod_dog    := 0;
        tin        := '';
        birthday   := '';
        id_prov    := 0;
        cr_by_dt   := prih;
        note_prov  := '';
        itt := 0;
        RxMemoryDataSaveAll.First;
        while not RxMemoryDataSaveAll.Eof do
        begin
            if RxMemoryDataSaveAll.FieldByName('id').AsInteger > itt then itt := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
            RxMemoryDataSaveAll.Next;
        end;
        if Show_Provodka(self, myform.id_ras, Class_Database, myclass.Class_Transaction_R, AddProv, id_kor_sch, id_man_prov, id_sch, id_smeta, id_stat, id_r, id_k, summa, name_fio, name_sch, kod_sm, kod_st, kod_rz, kod_kekv,  name_smeta, name_stat, name_r, name_k, name_kor_sch, t_sch, t_kor_sch, date_dog, num_dog, name_cust, type_dog, reg_dog, id_dog, kod_dog, tin, birthday, id_prov, cr_by_dt, note_prov,id_valuta, name_valuta, summa_valuta) then
        begin
             cr_dt := cr_by_dt;
             RxMemoryDataSaveAll.Open;
             RxMemoryDataSaveAll.Insert;
             RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := summa;
             RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value := summa_valuta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := id_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := id_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := id_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := id_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := kod_st;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := kod_rz;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value     := kod_sm;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value      := kod_kekv;
             RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value                     := name_fio;
             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := id_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value     := t_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value  := t_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := name_kor_sch;
             if id_prov > 0
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := id_prov
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                := name_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                := name_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value               := name_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                := name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := kod_sm + '\'+ kod_rz + '\' + kod_st +'\'+ kod_kekv;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value  := StrToDate(date_dog);
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := num_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := name_cust;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := type_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := reg_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := id_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := kod_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value      := tin;
             if birthday = ''
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := null
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := birthday;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value      := Note_prov;
             RxMemoryDataSaveAll.FieldByName('id').AsInteger                                 := itt+1;
             RxMemoryDataSaveAll.Post;
        end;
        RxMemoryDataSaveAll.First;
        summa_doc := 0;
        summa_valuta_doc := 0;
        while not RxMemoryDataSaveAll.Eof do
        begin
            summa_doc        := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
            summa_valuta_doc := summa_valuta_doc + RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value;
            RxMemoryDataSaveAll.next;
        end;
        RxMemoryDataSaveAll.Locate('id', itt+1, []);
    end;
    if PageControl1.ActivePage = TabSheet1 then
    begin
        if Show_Kassa_Bank(Class_Database, myclass.Class_Transaction_R, prih,cxTextEditNum.Text, cxTextEditSumma.Text, cxMemo1.Text, datetostr(date_act), type_schablon, kod_oper, summa_valuta,id_valuta,name_valuta) then
        begin
            if type_schablon = 2 then
            begin
                RxMemoryDataSaveAll.First;
                summa_doc := 0;
                summa_valuta := 0;
                while not RxMemoryDataSaveAll.Eof do
                begin
                    summa_doc := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                    summa_valuta_doc := summa_valuta_doc + RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value;
                    RxMemoryDataSaveAll.next;
                end;
                SelectDogovor(StrToFloat(cxTextEditSumma.Text)-summa_doc,summa_valuta,id_valuta,name_valuta);
            end;
            if type_schablon = 3 then
            begin
                flag_add_dog_here := true;
                ShowMessage('Більше не підтримується!');
                //SelectDogovorTrit;
            end;
            if type_schablon = 4 then
            begin
                flag_add_dog_here := true;
                SelectStudCity(false);
            end;
            if type_schablon = 5 then
            begin
                flag_add_dog_here := true;
                SelectDogovorTritNew(cxMemo1.Text, false);
            end;
            if type_schablon = 8 then
            begin
                flag_add_dog_here := true;
                SelectShablonNich(false, self, Class_Database, myform.id_DOC, myform.date_doc, myform.num_doc, myform.sum_doc, myform.note, myform.id_us, myform.name_cust, myform.mfo_cust, myform.name_bank, myform.ras_cust, 1);
            end;
        end;
    end;
end;
flag_show_dog := true;
end;

procedure TfmBankOrder.ActionDeleteExecute(Sender: TObject);
var
    summa_doc,summa_valuta_doc : double;
    id_dog, id_sme, id_sta, id_kek, id_ra : int64;
    flag_del : boolean;
    i, j : integer;
begin
flag_show_dog := false;
    if flag <> ShowOrder then
    begin
        if PageControl1.ActivePage = TabSheet2 then
        begin
            if not RxMemoryDataSaveAll.IsEmpty then
            begin
              if MessageBox(Handle, PChar(Un_R_file_Alex.J4_MESSAGE_DEL + Un_R_file_Alex.BANK_PROV + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString + Un_R_file_Alex.BANK_WITH_SUMMA + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString + ' ?'), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
              begin

                j := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
                cxGridSaveAllDBTableView1.Controller.GoToPrev(false);
                i := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
                RxMemoryDataSaveAll.Locate('id', j, [] );
                id_dog := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant;
                RxMemoryDataSaveAll.Delete;

                flag_del := false;
                RxMemoryDataSaveAll.First;
                while not RxMemoryDataSaveAll.Eof do
                begin
                    if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant = id_dog then flag_del := true;
                    RxMemoryDataSaveAll.Next;
                end;
                if not flag_del then
                begin
                    RxMemoryDataDog.First;
                    while not RxMemoryDataDog.Eof do
                    begin
                        if RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = id_dog then
                            RxMemoryDataDog.Delete
                        else
                           RxMemoryDataDog.Next;
                    end;
                end;
                RxMemoryDataSaveAll.Locate('id', i, [] );
              end;
            end;
        end;
        if PageControl1.ActivePage = TabSheet1 then
        begin
            if cxGridDog.IsFocused then
            begin
              if MessageBox(Handle, PChar(Un_R_file_Alex.J4_MESSAGE_DEL + Un_R_file_Alex.BANK_DOG_NUM + RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString +'  ' + RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').AsString+'?'), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
              begin
                id_dog := RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant;
                RxMemoryDataDog.First;
                while not RxMemoryDataDog.Eof do
                begin
                    if RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = id_dog then
                        RxMemoryDataDog.Delete
                    else
                        RxMemoryDataDog.Next;
                end;
                RxMemoryDataSaveAll.First;
                while not RxMemoryDataSaveAll.Eof do
                begin
                    if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant = id_dog then
                        RxMemoryDataSaveAll.Delete
                    else
                        RxMemoryDataSaveAll.Next;
                end;
                RxMemoryDataPodDog.First;
                while not RxMemoryDataPodDog.Eof do
                begin
                    if RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').AsVariant = id_dog then
                        RxMemoryDataPodDog.Delete
                    else
                        RxMemoryDataPodDog.Next;
                end;
              end;
            end;

            if cxGridPodDog.IsFocused then
            begin
              if MessageBox(Handle, PChar(Un_R_file_Alex.J4_MESSAGE_DEL + Un_R_file_Alex.BANK_PROV + RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString + Un_R_file_Alex.BANK_WITH_SUMMA + RxMemoryDataPodDog.FieldByName('RxMemDat_summa').AsString + ' ?'), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
              begin
                id_sme := RxMemoryDataPodDog.FieldByName('RxMemDatid_sm').AsVariant;
                id_ra  := RxMemoryDataPodDog.FieldByName('RxMemDatid_razd').AsVariant;
                id_sta := RxMemoryDataPodDog.FieldByName('RxMemDatid_st').AsVariant;
                id_kek := RxMemoryDataPodDog.FieldByName('RxMemDatid_kekv').AsVariant;
                id_dog := RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').AsVariant;
                summa_doc := RxMemoryDataPodDog.FieldByName('RxMemDat_summa').AsFloat;
                summa_valuta_doc := RxMemoryDataPodDog.FieldByName('RxMemorySummaValuta').AsFloat;
                RxMemoryDataPodDog.Delete;
                RxMemoryDataDog.First;
                while not RxMemoryDataDog.Eof do
                begin
                    if (RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant  = id_dog) and
                       (RxMemoryDataDog.FieldByName('RxMemDatid_kekv').AsVariant = id_kek) and
                       (RxMemoryDataDog.FieldByName('RxMemDatid_st').AsVariant   = id_sta) and
                       (RxMemoryDataDog.FieldByName('RxMemDatid_razd').AsVariant = id_ra) and
                       (RxMemoryDataDog.FieldByName('RxMemDatid_sm').AsVariant   = id_sme) and
                       (RxMemoryDataDog.FieldByName('RxMemDat_summa').AsVariant  = summa_doc) and
                       (RxMemoryDataDog.FieldByName('RxMemorySummaValuta').AsVariant  = summa_valuta_doc)
                    then
                        RxMemoryDataDog.Delete
                    else
                        RxMemoryDataDog.Next;
                end;
                RxMemoryDataSaveAll.First;
                while not RxMemoryDataSaveAll.Eof do
                begin
                    if (RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant  = id_dog) and
                       (RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').AsVariant = id_kek) and
                       (RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').AsVariant   = id_sta) and
                       (RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').AsVariant = id_ra) and
                       (RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').AsVariant   = id_sme) and
                       (RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsFloat    = summa_doc) and
                       (RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').AsFloat = summa_valuta_doc)
                    then
                        RxMemoryDataSaveAll.Delete
                    else
                        RxMemoryDataSaveAll.Next;
                end;
              end;
            end;
        end;
    end;
    flag_show_dog := true;
end;

procedure TfmBankOrder.ActionChangeExecute(Sender: TObject);
var
    id_kor_sch, id_man_prov, id_smeta, id_stat, id_r, id_k, id_sch : int64;
    name_kor_sch, kod_sm, kod_st, kod_rz, kod_kekv, name_fio, name_smeta, name_stat, name_r, name_k, name_sch, t_sch, t_kor_sch : string;
    summa, summa_doc, summa_valuta, summa_valuta_doc : double;
    date_dog, num_dog, name_cust, type_dog, reg_dog, tin, birthday, note_prov : string;
    id_dog, kod_dog, id_prov : int64;
    cr_by_dt, itt : integer;
    fff : TDateTime;
begin
flag_show_dog := false;
decimalseparator := ',';
if (flag <> ShowOrder) and (RxMemoryDataSaveAll.FieldByName('Vstrech').AsInteger <> 1) then
begin
    if PageControl1.ActivePage = TabSheet2 then
    begin
    if not RxMemoryDataSaveAll.IsEmpty then
    begin
      itt := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value <> null
        then id_smeta := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value
        else id_smeta := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value <> null
        then id_stat  := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value
        else id_stat  := 0;

      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value <> null
        then id_r     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value
        else id_r     := 0;

      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value <> null
        then id_k     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value
        else id_k     := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value <> null
        then id_kor_sch   := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value
        else id_kor_sch   := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <> null
        then id_man_prov   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value
        else id_man_prov   := 0;

      if RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value <> null
        then name_fio := RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value
        else name_fio := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value <> null
        then name_smeta := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value
        else name_smeta := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value <> null
        then name_stat  := RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value
        else name_stat  := '';

      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value <> null
        then name_r     := RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value
        else name_r     := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value <> null
        then name_k     := RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value
        else name_k     := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value <> null
        then name_kor_sch   := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value
        else name_kor_sch   := '';

      if RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value <> null
        then summa_valuta   := RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value
        else summa_valuta   := 0;

      if RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value <> null
        then summa      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value
        else summa      := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value <> null
        then id_sch := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value
        else id_sch := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value <> null
        then name_sch := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value
        else name_sch := '';

      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value <> null
        then t_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value
        else t_sch := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value <> null
        then t_kor_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value
        else t_kor_sch := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value <> null
        then kod_sm := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value
        else kod_sm := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value <> null
        then kod_st := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value
        else kod_st := '';

      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value <> null
        then kod_rz := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value
        else kod_rz := '';

      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value <> null
        then kod_kekv := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value
        else kod_kekv := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value <> null
        then date_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value
        else date_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value <> null
        then num_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value
        else num_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value <> null
        then name_cust := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value
        else name_cust := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value <> null
        then type_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value
        else type_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value <> null
        then reg_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value
        else reg_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value <> null
        then id_dog := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value
        else id_dog := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <> null
        then kod_dog := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value
        else kod_dog := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value <> null
        then tin := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value
        else tin := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value <> null
        then note_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value
        else note_prov := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value <> null
        then birthday := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value
        else birthday := '';
      id_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
      cr_by_dt   := prih;
        buh_prov := 1;
        if Show_Provodka(self, myform.id_ras, Class_Database, myclass.Class_Transaction_R, ChangeProv, id_kor_sch, id_man_prov, id_sch, id_smeta, id_stat, id_r, id_k, summa, name_fio, name_sch, kod_sm, kod_st, kod_rz, kod_kekv, name_smeta, name_stat, name_r, name_k, name_kor_sch, t_sch, t_kor_sch, date_dog, num_dog, name_cust, type_dog, reg_dog, id_dog, kod_dog, tin, birthday, id_prov, cr_by_dt, note_prov, id_valuta, name_valuta, summa_valuta) then
        begin
             cr_dt := cr_by_dt;
             RxMemoryDataSaveAll.Open;
             RxMemoryDataSaveAll.Edit;
//             RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value                           := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                           := summa;
             RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value                      := summa_valuta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                            := id_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                          := id_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                            := id_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                          := id_k;
//             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := 0;
//             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                           := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                           := id_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value                      :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                         :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                          := name_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value              := kod_st;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value               := kod_rz;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value              := kod_sm;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value               := kod_kekv;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                         := name_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                         := name_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                        := name_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                         := name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                           := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value                              := name_fio;
             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value                 := id_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value              := t_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value           := t_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                   := name_kor_sch;
             if id_prov > 0
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := id_prov
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
             if TryStrToDate(date_dog, fff)
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value  := StrToDate(date_dog)
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value  := null;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := num_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value         := name_cust;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := type_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value           := reg_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value           := kod_sm + '\'+ kod_rz + '\' + kod_st +'\'+ kod_kekv;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                           := id_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                          := kod_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value              := tin;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value        := Note_prov;
             if birthday = ''
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := null
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := birthday;
             RxMemoryDataSaveAll.Post;
        end;
            RxMemoryDataSaveAll.First;
            summa_doc := 0;
            summa_valuta_doc := 0;
            while not RxMemoryDataSaveAll.Eof do
            begin
                summa_doc        := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                summa_valuta_doc := summa_valuta_doc + RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value;
                RxMemoryDataSaveAll.next;
            end;
            RxMemoryDataSaveAll.Locate('id', itt, []);
        end;
    end;

    if PageControl1.ActivePage = TabSheet1 then
    begin
        if cxGridDog.IsFocused then
        begin
            summa_doc := 0;
            summa_valuta_doc := 0;
            while not RxMemoryDataPodDog.Eof do
            begin
                summa_doc := summa_doc + RxMemoryDataPodDog.FieldByName('RxMemDat_summa').Value;
                summa_valuta_doc := summa_valuta_doc + RxMemoryDataPodDog.FieldByName('RxMemorySummaValuta').Value;
                RxMemoryDataPodDog.next;
            end;
            SelectChangeDogovor(summa_doc, StrToFloat(ValutaTextEdit.Text), id_valuta, name_valuta);
        end;
    end;
end else
  if (flag = ShowOrder) then
  begin
    if not RxMemoryDataSaveAll.IsEmpty then
    begin
      itt := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value <> null
        then id_smeta := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value
        else id_smeta := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value <> null
        then id_stat  := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value
        else id_stat  := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value <> null
        then id_r     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value
        else id_r     := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value <> null
        then id_k     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value
        else id_k     := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value <> null
        then id_kor_sch   := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value
        else id_kor_sch   := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <> null
        then id_man_prov   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value
        else id_man_prov   := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value <> null
        then name_fio := RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value
        else name_fio := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value <> null
        then name_smeta := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value
        else name_smeta := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value <> null
        then name_stat  := RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value
        else name_stat  := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value <> null
        then name_r     := RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value
        else name_r     := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value <> null
        then name_k     := RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value
        else name_k     := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value <> null
        then name_kor_sch   := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value
        else name_kor_sch   := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value <> null
        then summa      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value
        else summa      := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value <> null
        then summa_valuta := RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value
        else summa_valuta := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value <> null
        then id_sch := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value
        else id_sch := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value <> null
        then name_sch := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value
        else name_sch := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value <> null
        then t_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value
        else t_sch := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value <> null
        then t_kor_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value
        else t_kor_sch := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value <> null
        then kod_sm := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value
        else kod_sm := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value <> null
        then kod_st := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value
        else kod_st := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value <> null
        then kod_rz := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value
        else kod_rz := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value <> null
        then kod_kekv := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value
        else kod_kekv := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value <> null
        then date_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value
        else date_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value <> null
        then num_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value
        else num_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value <> null
        then name_cust := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value
        else name_cust := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value <> null
        then type_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value
        else type_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value <> null
        then reg_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value
        else reg_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value <> null
        then id_dog := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value
        else id_dog := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <> null
        then kod_dog := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value
        else kod_dog := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value <> null
        then tin := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value
        else tin := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value <> null
        then note_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value
        else note_prov := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value <> null
        then birthday := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value
        else birthday := '';
      id_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
      cr_by_dt   := prih;
        buh_prov := 1;
      if Show_Provodka(self, myform.id_ras, Class_Database, myclass.Class_Transaction_R, ShowProv, id_kor_sch, id_man_prov, id_sch, id_smeta, id_stat, id_r, id_k, summa, name_fio, name_sch, kod_sm, kod_st, kod_rz, kod_kekv, name_smeta, name_stat, name_r, name_k, name_kor_sch, t_sch, t_kor_sch, date_dog, num_dog, name_cust, type_dog, reg_dog, id_dog, kod_dog, tin, birthday, id_prov, cr_by_dt, note_prov, id_valuta, name_valuta, summa_valuta) then
      begin
      end;
    end;
  end;
flag_show_dog := true;
end;


procedure TfmBankOrder.cxGridSaveAllDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_DELETE then ActionDeleteExecute(sender);
end;

procedure TfmBankOrder.cxGridSaveDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_DELETE then ActionDeleteExecute(sender);
end;

procedure TfmBankOrder.MySave;
var
    mes, name_prov, ssum,s : string;
    flag_mes : boolean;
    s2, s1 : double;
    I, k, ttt : integer;
    j, id_all, id_ddd, id_all_kom, r_id_m : int64;
    STRU : kernel_mode_structure;
    errorList : TstringList;
    DoResult : boolean;
    way_doc_add : integer;
    id_doc_return : int64;

begin
// ia_add_clbank 0-вручную через систему, 1-импорт,2- платежка из договоров

    TProgresOnSave := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.MY_SVERKA_DANNIH);
    TProgresOnSave.Show;
    TProgresOnSave.Repaint;
if flag <> ShowOrder then
begin
    mes := '';
    flag_mes := false;
    DecimalSeparator := ',';
    //проверка на корректность данных

    if cxMemo1.Text = '' then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.J4_ADD_WARNING_NOTE;
        end else
            MES := mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_NOTE;
        cxMemo1.style.Color := clred;
        FLAG_mes := TRUE;
    end else
        cxMemo1.style.Color := $00FFFBF0;

    if cxTextEditNum.Text ='' then
    begin
//    ShowMessage('Введите номер документа. Невозможно добавить документ!');
        if not flag_mes then
        begin
            mes := Un_R_file_Alex.J4_ADD_WARNING_NUMBER;
        end else
            mes := mes + Un_R_file_Alex.J4_ADD_WARNING_NUMBER;
        flag_mes := true;
        cxTextEditNum.style.Color := clred;
    end else
        cxTextEditNum.style.Color := $00E7FFFF;

        //проверка корресп. счета
    RxMemoryDataSaveAll.First;
    while not RxMemoryDataSaveAll.Eof do
    begin
        if RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsVariant = null then
        begin
            mes := mes + Un_R_file_Alex.BANK_ERROR_PROVE_KOR_SCH;
            flag_mes := true;
            break;
        end;
        RxMemoryDataSaveAll.Next;
    end;

    //проверка на договор
    RxMemoryDataSaveAll.First;
    while not RxMemoryDataSaveAll.Eof do
    begin
        if (RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant = null)
        or (RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant <= 0)
        or (RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').AsVariant = null)
        or (RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').AsVariant <= 0) then
        begin
            mes := mes + Un_R_file_Alex.BANK_ERROR_PROVE_DOG;
            flag_mes := true;
            break;
        end;
        RxMemoryDataSaveAll.Next;
    end;

    //проверка на суммы
    s2 := 0;
    if not RxMemoryDataSaveAll.isEmpty then
    begin
        RxMemoryDataSaveAll.First;
        while not RxMemoryDataSaveAll.Eof do
        begin
            s2 := s2 + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
            RxMemoryDataSaveAll.next;
        end;
    end;
    s1 := StrToFloat(cxTextEditSumma.Text);

    if abs(s1 - s2) >= 0.01 then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.J4_ADD_WARNING_PROV;
        end else
            mes := mes + Un_R_file_Alex.J4_ADD_WARNING_PROV;
        flag_mes := true;
    end;

   { if flag_mes then
    begin
        TProgresOnSave.Free;
        showmessage(mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_DONT_CREATE);
        cxmemo2.text := mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_DONT_CREATE;
        PageControl1.ActivePageIndex :=0;
        cxSplitter2.OpenSplitter;
        exit;
    end;   }

    //проверка на суммы валюта
    if (ValutaTextEdit.Visible = true) then
    begin
      s2 := 0;
      if not RxMemoryDataSaveAll.isEmpty then
      begin
          RxMemoryDataSaveAll.First;
          while not RxMemoryDataSaveAll.Eof do
          begin
              s2 := s2 + RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value;
              RxMemoryDataSaveAll.next;
          end;
      end;
      s1 := StrToFloat(ValutaTextEdit.Text);

      if abs(s1 - s2) >= 0.01 then
      begin
          if not flag_mes then
          begin
              MES := 'Сума валюти в проводках і документі не збігаються.';
          end else
              mes := mes + 'Сума валюти в проводках і документі не збігаються.';
          flag_mes := true;
      end;
    end;

    if (ValutaTextEdit.Visible = False) then
    begin
      id_valuta := 0;
      ValutaTextEdit.Text := '0,00';
    end;

    if flag_mes then
    begin
        TProgresOnSave.Free;
        showmessage(mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_DONT_CREATE);
        cxmemo2.text := mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_DONT_CREATE;
        PageControl1.ActivePageIndex :=0;
        cxSplitter2.OpenSplitter;
        exit;
    end;

    id_session := Class_Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

    cxMemo1.Text := StringReplace(cxMemo1.Text, '''', '''''', [rfReplaceAll]);
    cxMRUEditFio.Text := StringReplace(cxMRUEditFio.Text, '''', '''''', [rfReplaceAll]);
    if length(cxMRUEditFio.Text) > 100 then cxMRUEditFio.Text := copy(cxMRUEditFio.Text, 1, 100);  //obrezka nazvaniya kontragenta v sluchae previsheniya 100 simvolov

    //добавление
    if flag = AddOrder then
    begin

        Class_StoredProc.Database    := Class_Database;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Class_DataSet.Close;
        Class_DataSet.Database       := Class_Database;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        DataSetNumber.Database       := Class_Database;
        DataSetNumber.Transaction    := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;

        if myform.is_add_CL_buff <> 2 then
        begin
            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text := 'Select * from CLBANK_BUFF where ID_DOC = '+IntToStr(myform.id_doc)+'';
            Class_DataSet.Open;
            if Class_DataSet.FieldByName('OBRABOTAN').AsInteger = 1 then
            begin
                Class_Transaction_Wr.Rollback;
                TProgresOnSave.Free;
                showmessage(Un_R_file_Alex.BANK_DOC_OBRABOTAN);
                exit;
            end;
        end else
        begin
            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text := 'select R_RESULT from BANK_SELECT_INFO_PO_OBROB_DOC(:NUM, '''+ DateToStr(myform.date_doc)+''', '''+ myclass.bank_day+''', ''' + StringReplace(cxTextEditSumma.Text,',','.', [rfReplaceAll]) + ''', :Osnovanie, '+IntToStr(myform.id_ras)+', '+IntToStr(myform.id_customer)+', '+IntToStr(myform.id_account_customer)+', '+IntToStr(prih)+')';
            if myform.kazna = 1
                then {Class_DataSet.ParamByName('NUM').AsString       := ''
                else }Class_DataSet.ParamByName('NUM').AsString       := cxTextEditNum.text;
            Class_DataSet.ParamByName('OSNOVANIE').AsString          := cxMemo1.Text;
            Class_DataSet.Open;
            if Class_DataSet.FieldByName('R_RESULT').AsInteger = 1 then
            begin
                Class_Transaction_Wr.Rollback;
                TProgresOnSave.Free;
                showmessage(Un_R_file_Alex.BANK_DOC_OBRABOTAN);
                exit;
            end;
        end;

        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'Select * from BANK_INI';
        Class_DataSet.Open;
        if (TFIBBCDField(Class_DataSet.FieldByName('BANK_ID_DOG_KOMIS')).AsInt64=null) or
           (TFIBBCDField(Class_DataSet.FieldByName('BANK_KOD_DOG_KOMIS')).AsInt64=null) then
        begin
            TProgresOnSave.Free;
            showmessage(Un_R_file_Alex.BANK_ERROR_PROVE_DOG);
            exit;
        end;

        BANK_ID_DOG_KOMIS  := TFIBBCDField(Class_DataSet.FieldByName('BANK_ID_DOG_KOMIS')).AsInt64;
        BANK_KOD_DOG_KOMIS := TFIBBCDField(Class_DataSet.FieldByName('BANK_KOD_DOG_KOMIS')).AsInt64;

        Class_DataSet.Close;

        try
            // ДОБАВЛЕНИЕ ДОКУМЕНТА
        if SaveAll then
        begin
            if (myform.Priznac_komis = 1) and (prih = 0) and (cxCheckBox1.Checked) then
            begin
                //запись комиссии
                ZapisSowKOmis(1);
                if flag_find_komis then
                begin
                    id_session_kom := Class_Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
                    Trec.name_cust := StringReplace(Trec.name_cust, '''', '''''', [rfReplaceAll]);
                    Trec.note      := StringReplace(Trec.note, '''', '''''', [rfReplaceAll]);

                    s2 := 0;
                    if not RxKomis.isEmpty then
                    begin
                        RxKomis.First;
                        while not RxKomis.Eof do
                        begin
                            s2 := s2 + RxKomis.FieldByName('RxMemDat_summa').Value;
                            RxKomis.next;
                        end;
                    end;

                    if abs(s2-TRec.summa_doc) >= 0.01 then
                    begin
                        Class_Transaction_Wr.Rollback;
                        TProgresOnSave.Free;
                        showmessage(Un_R_file_Alex.BANK_PROVERKA_SUMM);
                        DecimalSeparator := ',';
                        exit;
                    end;
                    DecimalSeparator := '.';
                    Class_DataSet.Close;
                    if (prih=0) and (myform.kazna=1) then
                    begin
                        Class_DataSet.SQLs.SelectSQL.Text:='select * from BANK_INSERT_ALL_DOC('+IntToStr(prih)
                        +', :FIO, '''+Trec.name_cust+''', :OSNOVANIE, ''' + StringReplace(FloatToStr(TRec.summa_doc),',','.',[])
                        + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session_kom)+', '''+ DateToStr(Trec.date_vip)
                        +''', '''+ DateToStr(myform.date_doc)+''', '+IntToStr(Trec.id_cust)+', '+IntToStr(Trec.id_rate_acc)
                        +', '+IntToStr(myform.id_ras)+', '''+GetComputerNetName+''', '+IntToStr(0)+', '+IntToStr(0)
                        + StringReplace(FloatToStr(TRec.summa_valuta),',','.',[])
                        + ''', '+intToStr(id_valuta)
                        +')';

                        if myform.numer_lena = cxTextEditNum.Text
                            then Class_DataSet.ParamByName('FIO').AsString       := cxTextEditNum.Text
                            else Class_DataSet.ParamByName('FIO').AsString       := myform.numer_lena + ' (казнач.№ ' + cxTextEditNum.Text + ')';
                        Class_DataSet.ParamByName('OSNOVANIE').AsString := Trec.note;
                    end else
                    begin

                        Class_DataSet.SQLs.SelectSQL.Text:='select * from BANK_INSERT_ALL_DOC('+IntToStr(prih)
                        +', :FIO, '''+Trec.name_cust+''', :OSNOVANIE, ''' + StringReplace(FloatToStr(TRec.summa_doc),',','.',[])
                        + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session_kom)+', '''+ DateToStr(Trec.date_vip)
                        +''', '''+ DateToStr(myform.date_doc)+''', '+IntToStr(Trec.id_cust)+', '+IntToStr(Trec.id_rate_acc)
                        +', '+IntToStr(myform.id_ras)+', '''+GetComputerNetName+''', '+IntToStr(0)+', '+IntToStr(0)
                        + StringReplace(FloatToStr(TRec.summa_valuta),',','.',[])
                        + ''', '+intToStr(id_valuta)
                        +')';
                        Class_DataSet.ParamByName('FIO').AsString       := cxTextEditNum.text;
                        Class_DataSet.ParamByName('OSNOVANIE').AsString := Trec.note;
                    end;
                    Class_DataSet.Open;
                    id_all_kom    := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
                    date_provodka := myform.date_vip;
                    //H_d_k(1, id_all_kom);
                    RxKomis.First;
                    for i:=1 to RxKomis.RecordCount do
                    begin
                        Class_StoredProc.StoredProcName:='BANK_INSERT_ALL_PROV';
                        Class_StoredProc.Prepare;
                        Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session_kom;
                        Class_StoredProc.ParamByName('D_DATE_PROV').AsDate     := date_provodka;
                        Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := 0;
                        Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxKomis.FieldByName('RxMemDat_summa').Value;
                        Class_StoredProc.ParamByName('SUMMA_VALUTA').AsDouble   := RxKomis.FieldByName('RxMemorySummaValuta').Value;
                        Class_StoredProc.ParamByName('ID_VALUTA').AsDouble      := id_valuta;
                        Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxKomis.FieldByName('RxMemDatid_sm').Value;
                        Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxKomis.FieldByName('RxMemDatid_razd').Value;
                        Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxKomis.FieldByName('RxMemDatid_st').Value;
                        Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxKomis.FieldByName('RxMemDatid_kekv').Value;
                        Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := BANK_ID_DOG_KOMIS;//RxKomis.FieldByName('RxMemDatid_dog').Value;
                        try Class_StoredProc.ParamByName('D_ID_MAN').AsInt64   := RxKomis.FieldByName('RxMemDatid_man').Value; except Class_StoredProc.ParamByName('D_ID_MAN').AsInt64 := -1; end;
                        Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxKomis.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
//                        Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxKomis.FieldByName('RxMemDatsumma_value').Value;
//                        Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxKomis.FieldByName('RxMemDatid_value').Value;
                        Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := BANK_KOD_DOG_KOMIS;//RxKomis.FieldByName('RxMemDatkod_dog').Value;
                        Class_StoredProc.ParamByName('D_ID_DOG_D').AsInt64     := BANK_ID_DOG_KOMIS;
                        Class_StoredProc.ParamByName('D_KOD_DOG_D').AsInt64    := BANK_KOD_DOG_KOMIS;
                        Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myclass.id_user;
                        Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxKomis.FieldByName('RxMemDatid_sch').Value;
                        Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := RxKomis.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
                        Class_StoredProc.ParamByName('D_CR_BY_DT').AsInteger   := prih;
                        Class_StoredProc.ParamByName('D_PRIHOD').AsInteger     := prih;
                        Class_StoredProc.ExecProc;
                        RxKomis.Next;
                    end;
                    //H_p_k(1, id_all_kom);
                end;
            end;

            DecimalSeparator := '.';
            cxMemo1.Text := StringReplace(cxMemo1.Text, '''', '''''', [rfReplaceAll]);
            DataSetNumber.Close;
            DataSetNumber.SQLs.SelectSQL.Clear;

            if (ValutaTextEdit.Visible = False) then
              begin
                ValutaTextEdit.Text := '0,00';
              end;

            if (prih=0) and (myform.kazna=1) then
            begin
                DataSetNumber.SQLs.SelectSQL.Text := 'select R_ID from BANK_INSERT_ALL_DOC('+IntToStr(prih)+
                ', :FIO, '''+StringReplace(cxMRUEditFio.Text,'''', '''''', [rfReplaceAll])
                +''', :Osnovanie, ''' + StringReplace(cxTextEditSumma.Text,',','.', [rfReplaceAll])
                + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+ myclass.bank_day
                +''', '''+ DateToStr(myform.date_doc)+''', '+IntToStr(myform.id_customer)+', '
                +IntToStr(myform.id_account_customer)+', '+IntToStr(myform.id_ras)+', '''+GetComputerNetName
                +''', '+IntToStr(0)+', '+IntToStr(0)+', '''
                + StringReplace(ValutaTextEdit.Text,',','.', [rfReplaceAll])
                + ''', '+intToStr(myclass.id_valuta)
                +')';

                if myform.numer_lena = cxTextEditNum.Text
                    then DataSetNumber.ParamByName('FIO').AsString       := cxTextEditNum.Text
                    else DataSetNumber.ParamByName('FIO').AsString       := myform.numer_lena + ' (казнач.№ ' + cxTextEditNum.Text + ')';
                DataSetNumber.ParamByName('OSNOVANIE').AsString := cxMemo1.Text;

            end else
            begin
                DataSetNumber.SQLs.SelectSQL.Text := 'select R_ID from BANK_INSERT_ALL_DOC('+IntToStr(prih)
                +', :FIO, '''+StringReplace(cxMRUEditFio.Text,'''', '''''', [rfReplaceAll])+''', :Osnovanie, '''
                + StringReplace(cxTextEditSumma.Text,',','.', [rfReplaceAll]) + ''', '+intToStr(myclass.id_user)
                +', '+IntTostr(id_session)+', '''+ myclass.bank_day+''', '''+ DateToStr(myform.date_doc)+''', '
                +IntToStr(myform.id_customer)+', '+IntToStr(myform.id_account_customer)+', '+IntToStr(myform.id_ras)
                +', '''+GetComputerNetName+''', '+IntToStr(0)+', '+IntToStr(0)+ ', '''
                + StringReplace(ValutaTextEdit.Text,',','.', [rfReplaceAll]) + ''', '+intToStr(myclass.id_valuta)
                +')';

                DataSetNumber.ParamByName('FIO').AsString       := cxTextEditNum.text;
                DataSetNumber.ParamByName('OSNOVANIE').AsString := cxMemo1.Text;
            end;

            DataSetNumber.Open;
            id_all     := StrToInt64(DataSetNumber.FieldByName('R_ID').asString);
            date_provodka := myform.date_vip;
            //H_d(1, id_all);
            DataSetNumber.Close;

            RxMemoryDataSaveAll.First;
            for i:=1 to RxMemoryDataSaveAll.RecordCount do
            begin
                Class_StoredProc.StoredProcName:='BANK_INSERT_ALL_PROV';
                Class_StoredProc.Prepare;
                Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session;
                Class_StoredProc.ParamByName('D_DATE_PROV').AsDate     := date_provodka;
                if RxMemoryDataSaveAll.FieldByName('id_payer').Value <> null
                    then Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := RxMemoryDataSaveAll.FieldByName('id_payer').Value
                    else Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := 0;
                Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;

                if (RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value = null) then
                begin
                  Class_StoredProc.ParamByName('SUMMA_VALUTA').AsDouble   := 0;
                end
                else
                begin
                  Class_StoredProc.ParamByName('SUMMA_VALUTA').AsDouble   := RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value;
                end;

                Class_StoredProc.ParamByName('ID_VALUTA').AsDouble     := id_valuta;
                Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
                Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
                Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
                Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
                Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                try Class_StoredProc.ParamByName('D_ID_MAN').AsInt64   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value; except Class_StoredProc.ParamByName('D_ID_MAN').AsInt64 := -1; end;
                Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
//                Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value;
//                Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value;
                Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                Class_StoredProc.ParamByName('D_NOTE_PROV').AsVariant  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value;

                DataSetNumber.Close;
                DataSetNumber.Sqls.SelectSQL.Text := 'select * from BANK_PROVERKA_NA_VSTRECH('''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''', '''+datetostr(date_act)+''')';
                DataSetNumber.Open;
                if DataSetNumber.FBN('R_RES').AsInteger = 1 then flag_rs_rs := true else flag_rs_rs := false;
                if (flag_rs_rs) and (prih=0) then
                begin
                    DataSetNumber.Close;
                    DataSetNumber.Sqls.SelectSQL.Text := 'SELECT * FROM BANK_INI';
                    DataSetNumber.Open;
                    try
                        Class_StoredProc.ParamByName('D_ID_DOG_D').AsInt64 := StrToInt64(DataSetNumber.FieldByNAme('ID_DOG_RS_RS_DEBET').AsString)
                    except begin
                        TProgresOnSave.Free; Class_Transaction_Wr.Rollback;
                        Showmessage(Un_R_file_Alex.BANK_DONT_FIND_DOG_NA_RS_RS);
                        Exit;
                    end; end;;
                    Class_StoredProc.ParamByName('D_KOD_DOG_D').AsInt64    := StrToInt64(DataSetNumber.FieldByNAme('KOD_DOG_RS_RS_DEBET').AsString);
                    DataSetNumber.Close;
                end else
                begin
                    Class_StoredProc.ParamByName('D_ID_DOG_D').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                    Class_StoredProc.ParamByName('D_KOD_DOG_D').AsInt64    := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                end;
                Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myclass.id_user;
                Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
                if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value > 0
                    then Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value
                    else Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                Class_StoredProc.ParamByName('D_CR_BY_DT').AsInteger   := prih;
                Class_StoredProc.ParamByName('D_PRIHOD').AsInteger     := prih;


                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_MAIN_SCH_INFO('''+DateToStr(date_provodka)+''', '''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''')';
                Class_DataSet.Open;
                ttt        := TFIBBCDField(Class_DataSet.FieldByName('ID_SYSTEM')).AsInteger;
                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_SYSTEM where ID_SYSTEM='+IntToStr(ttt)+'';
                Class_DataSet.Open;
                try r_id_m := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value except r_id_m := -1; end;
                if (Class_DataSet.FieldByName('CHECK_ID_MEN').AsInteger =1) and (r_id_m <=0) then
                begin
                    TProgresOnSave.Free;
                    showmessage(Un_R_file_Alex.ERROR_MAN_PROV);
                    exit;
                end;
{                if (Class_DataSet.FieldByName('CHECK_DOG').AsInteger =1) and ((RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value <=0) or (RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <= 0))then
                begin
                    T.Free;
                    showmessage(Un_R_file_Alex.ERROR_DOG_PROV);
                    exit;
                end;
 }               Class_DataSet.Close;

                Class_StoredProc.ExecProc;
                RxMemoryDataSaveAll.Next;
            end;

           // Class_Transaction_Wr.Commit;
            // Class_Transaction_Wr.StartTransaction;
{            if (myform.id_key > 0) and (myform.prihod = 0) then
            begin
                Class_StoredProc.StoredProcName:='BANK_UPDATE_PL';
                Class_StoredProc.Prepare;
                Class_StoredProc.ParamByName('ID_KEY').AsInt64    := myform.id_key;
                Class_StoredProc.ParamByName('PARAM').AsInt64     := 1;
                Class_StoredProc.ParamByName('ID_ALL').AsInt64    := 1;
                Class_StoredProc.ExecProc;
            end;
}
           // H_p(1, id_all);
            if cxCheckBox2.Checked then
            begin
                Class_Transaction_Wr.Commit;
                TProgresOnSave.Free;
                exit;
            end;

            STRU.DBHANDLE      := Class_Database.Handle;
            STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
            STRU.KERNEL_ACTION := 1;
            STRU.KEY_SESSION   := id_session;
            STRU.WORKDATE      := date_provodka;
            STRU.ID_USER       := myclass.id_user;
            try
                DoResult:=Kernel.KernelDo(@STRU);
            except on E:Exception do
            begin
                TProgresOnSave.Free;
                ShowMessage(Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_KERNEL+E.Message);
                Class_Transaction_Wr.Rollback;
                DecimalSeparator := ',';
//                Class_Transaction_Wr.Commit;
                exit;
            end;
            end;
            if not DoResult then
            begin

                TProgresOnSave.Free;
                cxSplitter2.OpenSplitter;
                PageControl1.ActivePage := TabSheet3;
                cxMemo2.Lines.Clear;
                cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_DOC);
                ErrorList:=Kernel.GetDocErrorsList(@STRU);
                if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ERROR+ErrorList.Strings[i]);
                ErrorProvsDataSet.Close;
                ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                ErrorProvsDataSet.Open;
                ErrorProvsDataSet.First;
                RxError.EmptyTable;
                while not ErrorProvsDataSet.Eof do
                begin

                    name_prov := '';
                    ssum      := '';
                    RxMemoryDataSaveAll.First;
                    while Not RxMemoryDataSaveAll.Eof do
                    begin
                        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value = ErrorProvsDataSet.FBN('ID_PROV').AsVariant then
                        begin
                            name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString;
                            ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                        end;
                        RxMemoryDataSaveAll.Next;
                    end;
                    RxError.Open;
                    RxError.Insert;
                    RxError.FieldByName('RxKod').Value  := ErrorProvsDataSet['ID_ERROR'];
                    RxError.FieldByName('RxName').Value := ErrorProvsDataSet['ERROR_MESSAGE'] + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                    RxError.Post;
                    ErrorProvsDataSet.Next;
                end;
                ErrorProvsDataSet.Close;
                ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION_EX)+')';
                ErrorProvsDataSet.Open;
                ErrorProvsDataSet.First;
                while not ErrorProvsDataSet.Eof do
                begin
                    name_prov := '';
                    ssum      := '';
                    RxMemoryDataSaveAll.First;
                    while Not RxMemoryDataSaveAll.Eof do
                    begin
                        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value = ErrorProvsDataSet.FBN('ID_PROV').AsVariant then
                        begin
                            name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString;
                            ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                        end;
                        RxMemoryDataSaveAll.Next;
                    end;
                    RxError.Open;
                    RxError.Insert;
                    RxError.FieldByName('RxKod').Value  := ErrorProvsDataSet['ID_ERROR'];
                    RxError.FieldByName('RxName').Value := ErrorProvsDataSet['ERROR_MESSAGE'] + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                    RxError.Post;
                    ErrorProvsDataSet.Next;
                end;
                Class_Transaction_Wr.Rollback;
                DecimalSeparator := ',';
                exit;
            end ELSE
            begin
                if (myform.Priznac_komis = 1) and (flag_find_komis) and (prih = 0) and (cxCheckBox1.Checked) then
                begin
                    //запись комиссии
                    STRU.DBHANDLE      := Class_Database.Handle;
                    STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
                    STRU.KERNEL_ACTION := 1;
                    STRU.KEY_SESSION   := id_session_kom;
                    STRU.WORKDATE      := date_provodka;
                    STRU.ID_USER       := myclass.id_user;
                    try
                        DoResult:=Kernel.KernelDo(@STRU);
                    except on E:Exception do
                    begin
                        TProgresOnSave.Free;
                        ShowMessage(Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_KERNEL+E.Message);
                        Class_Transaction_Wr.Rollback;
                        DecimalSeparator := ',';
//                        Class_Transaction_Wr.Commit;
                        exit;
                    end;
                    end;
                    if not DoResult then
                    begin
                        TProgresOnSave.Free;
                        cxSplitter2.OpenSplitter;
                        PageControl1.ActivePage := TabSheet3;
//                        cxMemo2.Lines.Clear;
                        cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_DOC);
                        ErrorList:=Kernel.GetDocErrorsList(@STRU);
                        if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ERROR+ErrorList.Strings[i]);
                        ErrorProvsDataSet.Close;
                        ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(id_session_kom)+')';
                        ErrorProvsDataSet.Open;
                        ErrorProvsDataSet.First;
//                        RxError.EmptyTable;
                        while not ErrorProvsDataSet.Eof do
                        begin
                            name_prov := '';
                            ssum      := '';
                            RxMemoryDataSaveAll.First;
                            while Not RxMemoryDataSaveAll.Eof do
                            begin
                                if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value = ErrorProvsDataSet.FBN('ID_PROV').AsVariant then
                                begin
                                    name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString;
                                    ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                                end;
                                RxMemoryDataSaveAll.Next;
                            end;
                            RxError.Open;
                            RxError.Insert;
                            RxError.FieldByName('RxKod').Value  := ErrorProvsDataSet['ID_ERROR'];
                            RxError.FieldByName('RxName').Value := ErrorProvsDataSet['ERROR_MESSAGE'] + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                            RxError.Post;
                            ErrorProvsDataSet.Next;
                        end;
                        ErrorProvsDataSet.Close;
                        ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION_EX)+')';
                        ErrorProvsDataSet.Open;
                        ErrorProvsDataSet.First;
                        while not ErrorProvsDataSet.Eof do
                        begin
                            name_prov := '';
                            ssum      := '';
                            RxMemoryDataSaveAll.First;
                            while Not RxMemoryDataSaveAll.Eof do
                            begin
                                if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value = ErrorProvsDataSet.FBN('ID_PROV').AsVariant then
                                begin
                                    name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString;
                                    ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                                end;
                                RxMemoryDataSaveAll.Next;
                            end;
                            RxError.Open;
                            RxError.Insert;
                            RxError.FieldByName('RxKod').Value  := ErrorProvsDataSet['ID_ERROR'];
                            RxError.FieldByName('RxName').Value := ErrorProvsDataSet['ERROR_MESSAGE'] + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                            RxError.Post;
                            ErrorProvsDataSet.Next;
                        end;
                        Class_Transaction_Wr.Rollback;
                        DecimalSeparator := ',';
                        exit;
                    end;
                end;
                // изменение clbank_buff
                if myform.is_add_CL_buff = 2 then
                begin
                    Class_StoredProc.StoredProcName:='BANK_UPDATE_PL';
                    Class_StoredProc.Prepare;
                    Class_StoredProc.ParamByName('ID_KEY').AsInt64    := myform.id_DOC;
                    Class_StoredProc.ParamByName('PARAM').AsInt64     := 1;
                    Class_StoredProc.ParamByName('ID_ALL').AsInt64    := id_all;
                    Class_StoredProc.ExecProc;

                    //Запись в Банк-буфер от Лены

                    Class_StoredProc.StoredProcName:='CLBANK_BUFF_INSERT';
                    Class_StoredProc.Prepare;
                    Class_StoredProc.ParamByName('DATE_VIP').AsDate               := strtodate(myclass.bank_day);
                    Class_StoredProc.ParamByName('ID_ACCOUNT_NATIVE').AsInt64     := myform.id_ras;
                    Class_StoredProc.ParamByName('ID_ACCOUNT_CUSTOMER').AsInt64   := myform.id_account_customer;
                    Class_StoredProc.ParamByName('NUM_DOC').AsString              := cxTextEditNum.text;
                    Class_StoredProc.ParamByName('DATE_DOC').AsDate               := myform.date_doc;
                    Class_StoredProc.ParamByName('SUM_DOC').Value                 := strtofloat(StringReplace(cxTextEditSumma.Text,',','.',[]));
                    Class_StoredProc.ParamByName('SUMMA_VALUTA').Value            := strtofloat(StringReplace(ValutaTextEdit.Text,',','.',[]));
                    Class_StoredProc.ParamByName('ID_VALUTA').Value               := id_valuta;
                    Class_StoredProc.ParamByName('TYPE_DOC').AsInteger            := -1;
                    Class_StoredProc.ParamByName('NOTE').AsString                 := StringReplace(cxMemo1.Text, ':', ' ', [rfReplaceAll]);
                    Class_StoredProc.ParamByName('ID_CURRENCY').AsInteger         := 0;
                    Class_StoredProc.ParamByName('SUMMA_VALUTA').AsFloat               := 0;
                    Class_StoredProc.ParamByName('ID_KEY_BANK').AsInteger         := 0;
                    Class_StoredProc.ParamByName('ID_KEY_LOCAL').AsInteger        := 0;
                    Class_StoredProc.ParamByName('IS_ADD_CLBANK').AsInteger       := 2;
                    Class_StoredProc.ParamByName('ID_ALL_DOC').AsInt64            := id_all;
                    Class_StoredProc.ParamByName('OBRABOTAN').AsInteger           := 1;
                    Class_StoredProc.ParamByName('ID_BANK').AsVariant             := null;
                    Class_StoredProc.ParamByName('IN_SAVE').AsVariant             := null;
                    Class_StoredProc.ExecProc;



                    id_ddd := Class_StoredProc.ParamByName('ID_DOC_RETURN').Value;

//                    Изменение В банк-буфере Лены (выставление признака обработанности)
                    Class_StoredProc.StoredProcName:='BANK_UPDATE_CLBANK_BUFF';
                    Class_StoredProc.Prepare;
                    Class_StoredProc.ParamByName('D_ID_DOC').AsInt64      := id_ddd;
                    Class_StoredProc.ParamByName('D_ALL_DOC').AsInt64     := id_all;
                    Class_StoredProc.ParamByName('D_OBRABOTAN').AsInteger := 1;
                    Class_StoredProc.ParamByName('D_ID_PLAT').AsInteger   := myform.id_key;
                    Class_StoredProc.ExecProc;
                    //DataSetPl.Close;
                end else
                begin
                    if myform.id_key > 0 then
                    begin
                        Class_StoredProc.StoredProcName:='BANK_UPDATE_PL';
                        Class_StoredProc.Prepare;
                        Class_StoredProc.ParamByName('ID_KEY').AsInt64    := myform.id_key;
                        Class_StoredProc.ParamByName('PARAM').AsInt64     := 1;
                        Class_StoredProc.ParamByName('ID_ALL').AsInt64    := id_all;
                        Class_StoredProc.ExecProc;
                    end;
                    if (myform.Priznac_komis = 1) and (flag_find_komis) and (prih = 0) and (cxCheckBox1.Checked) then
                    begin
                        Class_StoredProc.StoredProcName:='BANK_UPDATE_CLBANK_BUFF_KOMIS';
                        Class_StoredProc.Prepare;
                        Class_StoredProc.ParamByName('D_ID_DOC').AsInt64      := myform.id_DOC;
                        Class_StoredProc.ParamByName('D_ALL_DOC').AsInt64     := id_all;
                        Class_StoredProc.ParamByName('D_ID_DOC_KOM').AsInt64  := Trec.id_doc;
                        Class_StoredProc.ParamByName('D_ALL_DOC_KOM').AsInt64 := id_all_kom;
                        Class_StoredProc.ParamByName('D_ID_PLAT').AsInt64     := myform.id_key;
                        Class_StoredProc.ExecProc;

                        {Class_StoredProc.StoredProcName:='KERNEL_CLEAR_TMP'; //удаление
                        Class_StoredProc.Prepare;
                        Class_StoredProc.ParamByName('KEY_SESSION').AsInt64  := id_session_kom;
                        Class_StoredProc.ExecProc; }

                        if myform.kazna=1 then
                        begin
                            Class_StoredProc.StoredProcName:='BANK_UPDATE_CL_BANKBUFF_NUM_DOC';
                            Class_StoredProc.Prepare;
                            Class_StoredProc.ParamByName('D_ID_DOC').AsInt64      := Trec.id_doc;
                            Class_StoredProc.ParamByName('D_NUM_DOC').AsString    := copy(myform.numer_lena, 1, 10);
                            Class_StoredProc.ExecProc;
                        end;

                    end else
                    begin
                        Class_StoredProc.StoredProcName:='BANK_UPDATE_CLBANK_BUFF';
                        Class_StoredProc.Prepare;
                        Class_StoredProc.ParamByName('D_ID_DOC').AsInt64      := myform.id_DOC;
                        Class_StoredProc.ParamByName('D_ALL_DOC').AsInt64     := id_all;
                        Class_StoredProc.ParamByName('D_OBRABOTAN').AsInteger := 1;
                        Class_StoredProc.ParamByName('D_ID_PLAT').AsInt64     := myform.id_key;
                        Class_StoredProc.ExecProc;

                        if ((myform.kazna=1) and ((prih = 1))) then
                        begin
                            Class_StoredProc.StoredProcName:='BANK_UPDATE_CL_BANKBUFF_NUM_DOC';
                            Class_StoredProc.Prepare;
                            Class_StoredProc.ParamByName('D_ID_DOC').AsInt64      := myform.id_DOC;
                            Class_StoredProc.ParamByName('D_NUM_DOC').AsString    := copy(cxTextEditNum.Text, 1, 10);
                            Class_StoredProc.ExecProc;
                        end;
                        if ((myform.kazna=1) and ((prih = 0))) then
                        begin
                            Class_StoredProc.StoredProcName:='BANK_UPDATE_CL_BANKBUFF_NUM_DOC';
                            Class_StoredProc.Prepare;
                            Class_StoredProc.ParamByName('D_ID_DOC').AsInt64      := myform.id_DOC;
                            if (myform.numer_lena='') then
                                Class_StoredProc.ParamByName('D_NUM_DOC').AsString    := copy(cxTextEditNum.Text, 1, 10)
                            else
                                Class_StoredProc.ParamByName('D_NUM_DOC').AsString    := copy(myform.numer_lena, 1, 10);
                            Class_StoredProc.ExecProc;
                        end;
                    end;
                end;
            end;
            {Class_StoredProc.StoredProcName:='KERNEL_CLEAR_TMP'; //удаление
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('KEY_SESSION').AsInt64  := id_session;
            Class_StoredProc.ExecProc; }
            Class_Transaction_Wr.Commit;
            TProgresOnSave.Free;
            DecimalSeparator := ',';
            myform.ActionRefreshExecute(nil);
            if myform.is_add_CL_buff = 2 then
            begin
                Myform.DataSetMain.Locate('ID_DOC', id_ddd, []);
            end else
            begin
                Myform.DataSetMain.Locate('ID_DOC', myform.id_DOC, []);
            end;
            DecimalSeparator := ',';
            close;
            exit;
        end;
        except on E:Exception do begin
            TProgresOnSave.Free;
            Class_Transaction_Wr.Rollback;
            DecimalSeparator := ',';
            ShowMessage(E.Message);
            exit;
        end
        end;
    end;

    //klonirovanie
    if flag = ClonOrder then
    begin

        Class_StoredProc.Database    := Class_Database;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Class_DataSet.Close;
        Class_DataSet.Database       := Class_Database;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        DataSetNumber.Database       := Class_Database;
        DataSetNumber.Transaction    := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;


        Class_StoredProc.StoredProcName:='CLBANK_BUFF_INSERT';
        Class_StoredProc.Prepare;
        Class_StoredProc.ParamByName('DATE_VIP').AsDate             := DateTimePicker2.Date;
        Class_StoredProc.ParamByName('ID_ACCOUNT_NATIVE').AsInt64   := myform.id_ras;
        Class_StoredProc.ParamByName('ID_ACCOUNT_CUSTOMER').AsInt64 := myform.id_account_customer;
        Class_StoredProc.ParamByName('NUM_DOC').AsString            := cxTextEditNum.Text;
        Class_StoredProc.ParamByName('DATE_DOC').AsDate             := DateTimePicker1.Date;
        Class_StoredProc.ParamByName('SUM_DOC').AsDouble            := StrToFloat(cxTextEditSumma.Text);
        Class_StoredProc.ParamByName('SUMMA_VALUTA').AsDouble       := StrToFloat(ValutaTextEdit.Text);
        Class_StoredProc.ParamByName('ID_VALUTA').AsDouble          := id_valuta;
        Class_StoredProc.ParamByName('IS_ADD_CLBANK').AsInteger     :=0;

        if prih=1 then
        begin
          Class_StoredProc.ParamByName('TYPE_DOC').AsInteger:=1;
        end
        else
        begin
          Class_StoredProc.ParamByName('TYPE_DOC').AsInt64:=-1;
        end;
        Class_StoredProc.ParamByName('NOTE').AsString:=cxMemo1.Text;
        try
          Class_StoredProc.ExecProc;
        Except
          begin
            Class_Transaction_Wr.Rollback;
            ShowMessage('Помилка при доданні документу.');
            Exit;
          end;
        end;

        if Class_StoredProc.FieldByName('ERROR').AsVariant=2 then
        begin
            TProgresOnSave.Free;
            Class_Transaction_Wr.Rollback;
            ShowMessage('Документ з такими данними існує.');
            exit;
        end else
        begin
            id_doc_return := Class_StoredProc.FieldByName('ID_DOC_RETURN').AsVariant;
        end;


        try
            // ДОБАВЛЕНИЕ ДОКУМЕНТА
        if SaveAll then
        begin
            DecimalSeparator := '.';
            cxMemo1.Text := StringReplace(cxMemo1.Text, '''', '''''', [rfReplaceAll]);
            DataSetNumber.Close;
            DataSetNumber.SQLs.SelectSQL.Clear;

            DataSetNumber.SQLs.SelectSQL.Text := 'select R_ID from BANK_INSERT_ALL_DOC('+IntToStr(prih)+', :FIO, '''+StringReplace(cxMRUEditFio.Text,'''', '''''', [rfReplaceAll])+''', :Osnovanie, '''
            + StringReplace(cxTextEditSumma.Text,',','.', [rfReplaceAll]) + ''', '+intToStr(myclass.id_user)+', '
            +IntTostr(id_session)+', '''+ myclass.bank_day+''', '''+ DateToStr(DateTimePicker1.Date)+''', '
            +IntToStr(myform.id_customer)+', '+IntToStr(myform.id_account_customer)+', '+IntToStr(myform.id_ras)+', '''
            +GetComputerNetName+''', '+IntToStr(0)+', '+IntToStr(0)+', '''
            + StringReplace(ValutaTextEdit.Text,',','.', [rfReplaceAll]) + ''', '
            + IntToStr(id_valuta)
            +')';

            DataSetNumber.ParamByName('FIO').AsString       := cxTextEditNum.text;
            DataSetNumber.ParamByName('OSNOVANIE').AsString := cxMemo1.Text;
            DataSetNumber.Open;

            id_all     := StrToInt64(DataSetNumber.FieldByName('R_ID').asString);
            date_provodka := myform.date_vip;
            DataSetNumber.Close;

            RxMemoryDataSaveAll.First;
            for i:=1 to RxMemoryDataSaveAll.RecordCount do
            begin
                Class_StoredProc.StoredProcName:='BANK_INSERT_ALL_PROV';
                Class_StoredProc.Prepare;
                Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session;
                Class_StoredProc.ParamByName('D_DATE_PROV').AsDate     := date_provodka;
                if RxMemoryDataSaveAll.FieldByName('id_payer').Value <> null
                    then Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := RxMemoryDataSaveAll.FieldByName('id_payer').Value
                    else Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := 0;
                Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
                Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
                Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
                Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
                Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                try Class_StoredProc.ParamByName('D_ID_MAN').AsInt64   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value; except Class_StoredProc.ParamByName('D_ID_MAN').AsInt64 := -1; end;
                Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                Class_StoredProc.ParamByName('D_NOTE_PROV').AsVariant  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value;
                Class_StoredProc.ParamByName('SUMMA_VALUTA').AsDouble  := RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value;
                Class_StoredProc.ParamByName('ID_VALUTA').AsDouble     := id_valuta;

                DataSetNumber.Close;
                DataSetNumber.Sqls.SelectSQL.Text := 'select * from BANK_PROVERKA_NA_VSTRECH('''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''', '''+datetostr(date_act)+''')';
                DataSetNumber.Open;
                if DataSetNumber.FBN('R_RES').AsInteger = 1 then flag_rs_rs := true else flag_rs_rs := false;
                if (flag_rs_rs) and (prih=0) then
                begin
                    DataSetNumber.Close;
                    DataSetNumber.Sqls.SelectSQL.Text := 'SELECT * FROM BANK_INI';
                    DataSetNumber.Open;
                    try
                        Class_StoredProc.ParamByName('D_ID_DOG_D').AsInt64 := StrToInt64(DataSetNumber.FieldByNAme('ID_DOG_RS_RS_DEBET').AsString)
                    except begin
                        TProgresOnSave.Free; Class_Transaction_Wr.Rollback;
                        Showmessage(Un_R_file_Alex.BANK_DONT_FIND_DOG_NA_RS_RS);
                        Exit;
                    end; end;;
                    Class_StoredProc.ParamByName('D_KOD_DOG_D').AsInt64    := StrToInt64(DataSetNumber.FieldByNAme('KOD_DOG_RS_RS_DEBET').AsString);
                    DataSetNumber.Close;
                end else
                begin
                    Class_StoredProc.ParamByName('D_ID_DOG_D').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                    Class_StoredProc.ParamByName('D_KOD_DOG_D').AsInt64    := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                end;
                Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myclass.id_user;
                Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
                Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                Class_StoredProc.ParamByName('D_CR_BY_DT').AsInteger   := prih;
                Class_StoredProc.ParamByName('D_PRIHOD').AsInteger     := prih;


                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_MAIN_SCH_INFO('''+DateToStr(date_provodka)+''', '''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''')';
                Class_DataSet.Open;
                ttt        := TFIBBCDField(Class_DataSet.FieldByName('ID_SYSTEM')).AsInteger;
                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_SYSTEM where ID_SYSTEM='+IntToStr(ttt)+'';
                Class_DataSet.Open;
                try r_id_m := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value except r_id_m := -1; end;
                if (Class_DataSet.FieldByName('CHECK_ID_MEN').AsInteger =1) and (r_id_m <=0) then
                begin
                    TProgresOnSave.Free;
                    showmessage(Un_R_file_Alex.ERROR_MAN_PROV);
                    exit;
                end;
               Class_DataSet.Close;

                Class_StoredProc.ExecProc;
                RxMemoryDataSaveAll.Next;
            end;


            if cxCheckBox2.Checked then
            begin

                Class_Transaction_Wr.Commit;
                TProgresOnSave.Free;
                exit;
            end;

            STRU.DBHANDLE      := Class_Database.Handle;
            STRU.TRHANDLE      := Class_Transaction_Wr.Handle;

            STRU.KERNEL_ACTION := 1;
            STRU.KEY_SESSION   := id_session;
            STRU.WORKDATE      := date_provodka;
            STRU.ID_USER       := myclass.id_user;
            try
                DoResult:=Kernel.KernelDo(@STRU);
            except on E:Exception do
            begin
                TProgresOnSave.Free;
                ShowMessage(Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_KERNEL+E.Message);
                Class_Transaction_Wr.Rollback;
                DecimalSeparator := ',';
                exit;
            end;
            end;
            if not DoResult then
            begin
                TProgresOnSave.Free;
                cxSplitter2.OpenSplitter;
                PageControl1.ActivePage := TabSheet3;
                cxMemo2.Lines.Clear;
                cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_DOC);
                ErrorList:=Kernel.GetDocErrorsList(@STRU);
                if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ERROR+ErrorList.Strings[i]);
                ErrorProvsDataSet.Close;
                ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                ErrorProvsDataSet.Open;
                ErrorProvsDataSet.First;
                RxError.EmptyTable;
                while not ErrorProvsDataSet.Eof do
                begin
                    name_prov := '';
                    ssum      := '';
                    RxMemoryDataSaveAll.First;
                    while Not RxMemoryDataSaveAll.Eof do
                    begin
                        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value = ErrorProvsDataSet.FBN('ID_PROV').AsVariant then
                        begin
                            name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString;
                            ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                        end;
                        RxMemoryDataSaveAll.Next;
                    end;
                    RxError.Open;
                    RxError.Insert;
                    RxError.FieldByName('RxKod').Value  := ErrorProvsDataSet['ID_ERROR'];
                    RxError.FieldByName('RxName').Value := ErrorProvsDataSet['ERROR_MESSAGE'] + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                    RxError.Post;
                    ErrorProvsDataSet.Next;
                end;
                ErrorProvsDataSet.Close;
                ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION_EX)+')';
                ErrorProvsDataSet.Open;
                ErrorProvsDataSet.First;
                while not ErrorProvsDataSet.Eof do
                begin
                    name_prov := '';
                    ssum      := '';
                    RxMemoryDataSaveAll.First;
                    while Not RxMemoryDataSaveAll.Eof do
                    begin
                        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value = ErrorProvsDataSet.FBN('ID_PROV').AsVariant then
                        begin
                            name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString;
                            ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                        end;
                        RxMemoryDataSaveAll.Next;
                    end;
                    RxError.Open;
                    RxError.Insert;
                    RxError.FieldByName('RxKod').Value  := ErrorProvsDataSet['ID_ERROR'];
                    RxError.FieldByName('RxName').Value := ErrorProvsDataSet['ERROR_MESSAGE'] + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                    RxError.Post;
                    ErrorProvsDataSet.Next;
                end;
                Class_Transaction_Wr.Rollback;
                DecimalSeparator := ',';
                exit;
            end ELSE
            begin
                begin
                    begin
                        Class_StoredProc.StoredProcName:='BANK_UPDATE_CLBANK_BUFF';
                        Class_StoredProc.Prepare;
                        Class_StoredProc.ParamByName('D_ID_DOC').AsInt64      := id_doc_return;
                        Class_StoredProc.ParamByName('D_ALL_DOC').AsInt64     := id_all;
                        Class_StoredProc.ParamByName('D_OBRABOTAN').AsInteger := 1;
                        Class_StoredProc.ParamByName('D_ID_PLAT').AsInt64     := 0;//myform.id_key;
                        Class_StoredProc.ExecProc;


                        Class_StoredProc.StoredProcName:='BANK_UPDATE_CL_BANKBUFF_NUM_DOC';
                        Class_StoredProc.Prepare;
                        Class_StoredProc.ParamByName('D_ID_DOC').AsInt64      := id_doc_return;
                        Class_StoredProc.ParamByName('D_NUM_DOC').AsString    := copy(cxTextEditNum.Text, 1, 10) ;
                        Class_StoredProc.ExecProc;

                    end;
                end;
            end;
            {Class_StoredProc.StoredProcName:='KERNEL_CLEAR_TMP'; //удаление
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('KEY_SESSION').AsInt64  := id_session;
            Class_StoredProc.ExecProc;}
            Class_Transaction_Wr.Commit;
            TProgresOnSave.Free;
            DecimalSeparator := ',';
            myform.ActionRefreshExecute(nil);

            Myform.DataSetMain.Locate('ID_DOC', id_doc_return, []);
            DecimalSeparator := ',';
            close;
            exit;
        end;
        except on E:Exception do begin
            TProgresOnSave.Free;
            Class_Transaction_Wr.Rollback;
            DecimalSeparator := ',';
            ShowMessage(E.Message);
            exit;
        end
        end;
    end;

//изменение
    if (flag = ChangeOrder)  then
    begin
        Class_StoredProc.Database    := Class_Database;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Class_DataSet.Close;
        Class_DataSet.Database       := Class_Database;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        DataSetNumber.Database       := Class_Database;
        DataSetNumber.Transaction    := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;
        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'Select * from BANK_INI';
        Class_DataSet.Open;
        if (TFIBBCDField(Class_DataSet.FieldByName('BANK_ID_DOG_KOMIS')).AsInt64=null) or
           (TFIBBCDField(Class_DataSet.FieldByName('BANK_KOD_DOG_KOMIS')).AsInt64=null) then
        begin
            TProgresOnSave.Free;
            showmessage(Un_R_file_Alex.BANK_ERROR_PROVE_DOG);
            exit;
        end;
        BANK_ID_DOG_KOMIS  := TFIBBCDField(Class_DataSet.FieldByName('BANK_ID_DOG_KOMIS')).AsInt64;
        BANK_KOD_DOG_KOMIS := TFIBBCDField(Class_DataSet.FieldByName('BANK_KOD_DOG_KOMIS')).AsInt64;
        Class_DataSet.Close;
        j := myform.DataSetMain['ID_DOC'];
        try
            //изменение документа
            IF myform.DataSetMain['ID_ALL_DOC'] > 0 then
            begin
                if (myform.Priznac_komis = 1) and (prih = 0) and (cxCheckBox1.Checked) then
                begin

                    //запись комиссии
                    if not flag_find_komis
                        then ZapisSowKOmis(1)
                        else ZapisSowKOmis(0);  {?????}
                    if flag_find_komis then
                    begin
                        if (flag_move_date=1) then
                        begin
                              date_provodka := date_act;
                              Trec.date_vip := date_act;
                        end
                        else
                        if (flag_move_date=0) then
                        begin
                              date_provodka := myform.date_vip;
                        end;
                        id_session_kom := Class_Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
                        Trec.name_cust := StringReplace(Trec.name_cust, '''', '''''', [rfReplaceAll]);
                        Trec.note      := StringReplace(Trec.note, '''', '''''', [rfReplaceAll]);

                        DecimalSeparator := '.';
                        Class_DataSet.Close;

                        if flag_edit_kom_find then
                        begin
                            Class_DataSet.SQLs.SelectSQL.Text:='select * from BANK_INSERT_ALL_DOC('+IntToStr(prih)
                            + ', :FIO, '''+Trec.name_cust+''', :OSNOVANIE, ''' + StringReplace(FloatToStr(TRec.summa_doc),',','.',[])
                            + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session_kom)+', '''+ DateToStr(Trec.date_vip)
                            +''', '''+ DateToStr(myform.date_doc)+''', '+IntToStr(Trec.id_cust)+', '+IntToStr(Trec.id_rate_acc)
                            +', '+IntToStr(myform.id_ras)+', '''+GetComputerNetName+''', '
                            +IntToStr(1)+', '+IntToStr(id_all_dok_komis_edit)+''', '
                            + StringReplace(FloatToStr(TRec.summa_valuta),',','.', [rfReplaceAll]) + ''', '
                            + IntToStr(myclass.id_valuta)
                            +')';
                        end
                        else
                            Class_DataSet.SQLs.SelectSQL.Text:='select * from BANK_INSERT_ALL_DOC('+IntToStr(prih)
                            +', :FIO, '''+Trec.name_cust+''', :OSNOVANIE, ''' + StringReplace(FloatToStr(TRec.summa_doc),',','.',[])
                            + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session_kom)+', '''+ DateToStr(Trec.date_vip)
                            +''', '''+ DateToStr(myform.date_doc)+''', '+IntToStr(Trec.id_cust)+', '+IntToStr(Trec.id_rate_acc)
                            +', '+IntToStr(myform.id_ras)+', '''+GetComputerNetName+''', '+IntToStr(0)+', '+IntToStr(0)+''', '
                            + StringReplace(FloatToStr(TRec.summa_valuta),',','.', [rfReplaceAll]) + ''', '
                            + IntToStr(myclass.id_valuta)
                            +')';

                        Class_DataSet.ParamByName('OSNOVANIE').AsString := Trec.note;
                        Class_DataSet.ParamByName('FIO').AsString       := cxTextEditNum.text;
                        Class_DataSet.Open;
                        id_all_dok_komis_edit    := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;


                       // H_d_k(2, id_all_dok_komis_edit);

                        RxKomis.First;
                        for i:=1 to RxKomis.RecordCount do
                        begin
                            Class_StoredProc.StoredProcName:='BANK_INSERT_ALL_PROV';
                            Class_StoredProc.Prepare;
                            Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session_kom;
                            Class_StoredProc.ParamByName('D_DATE_PROV').AsDate     := date_provodka;
                            Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := 0;
                            Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxKomis.FieldByName('RxMemDat_summa').Value;
                            Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxKomis.FieldByName('RxMemDatid_sm').Value;
                            Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxKomis.FieldByName('RxMemDatid_razd').Value;
                            Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxKomis.FieldByName('RxMemDatid_st').Value;
                            Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxKomis.FieldByName('RxMemDatid_kekv').Value;
                            Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := BANK_ID_DOG_KOMIS;//RxKomis.FieldByName('RxMemDatid_dog').Value;

                            try Class_StoredProc.ParamByName('D_ID_MAN').AsInt64   := RxKomis.FieldByName('RxMemDatid_man').Value; except Class_StoredProc.ParamByName('D_ID_MAN').AsInt64 := -1; end;
                            Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxKomis.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
//                            Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxKomis.FieldByName('RxMemDatsumma_value').Value;
//                            Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxKomis.FieldByName('RxMemDatid_value').Value;
                            Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := BANK_KOD_DOG_KOMIS;//RxKomis.FieldByName('RxMemDatkod_dog').Value;
                            Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myclass.id_user;
                            Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxKomis.FieldByName('RxMemDatid_sch').Value;
                            if RxKomis.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value > 0
                                then Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := RxKomis.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value
                                else Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                            Class_StoredProc.ParamByName('D_CR_BY_DT').AsInteger   := prih;
                            Class_StoredProc.ParamByName('D_PRIHOD').AsInteger     := prih;
                            Class_StoredProc.ParamByName('D_ID_DOG_D').AsInt64     := BANK_ID_DOG_KOMIS;
                            Class_StoredProc.ParamByName('D_KOD_DOG_D').AsInt64    := BANK_KOD_DOG_KOMIS;
                            Class_StoredProc.ExecProc;
                            RxKomis.Next;
                        end;
                        //H_p_k(2, id_all_dok_komis_edit);
                    end;
                end;
                DecimalSeparator := '.';
            // апдайт данных в ал_прове
                if (flag_move_date=1) then
                begin
                    date_provodka := date_act;
                end
                else
                if (flag_move_date=0) then
                begin

                    date_provodka := myform.date_vip;
                    date_act      := strtodate(myclass.bank_day);
                end;
                id_all  := myform.DataSetMain['ID_ALL_DOC'];
                Class_DataSet.Close;

                Class_DataSet.SQLs.SelectSQL.Text := 'select * from BANK_INSERT_ALL_DOC('+IntToStr(prih)
                +', :FIO, '''+cxMRUEditFio.Text+''', :OSNOVANIE, ''' + StringReplace(cxTextEditSumma.Text,',','.',[])
                + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+ datetostr(date_act)+''', '''
                + DateToStr(myform.date_doc)+''', '+IntToStr(myform.id_customer)+', '
                +IntToStr(myform.id_account_customer)+', '+IntToStr(myform.id_ras)+', '''
                +GetComputerNetName+''', '+IntToStr(1)+', '+IntToStr(id_all)+', '''
                + StringReplace(ValutaTextEdit.Text,',','.', [rfReplaceAll]) + ''', '
                + IntToStr(myclass.id_valuta)
                +')';

                Class_DataSet.ParamByName('OSNOVANIE').AsString := cxMemo1.Text;
                Class_DataSet.ParamByName('FIO').AsString       := cxTextEditNum.text;
                Class_DataSet.Open;

                //date_provodka := StrToDate(myclass.bank_day);
                //H_d(2, id_all);
                Class_DataSet.Close;
                RxMemoryDataSaveAll.First;
                for i:=1 to RxMemoryDataSaveAll.RecordCount do
                begin
                    Class_StoredProc.StoredProcName:='BANK_INSERT_ALL_PROV';
                    Class_StoredProc.Prepare;
                    Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session;
                    Class_StoredProc.ParamByName('D_DATE_PROV').AsDate     := date_provodka;
                    if RxMemoryDataSaveAll.FieldByName('id_payer').Value <> null
                        then Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := RxMemoryDataSaveAll.FieldByName('id_payer').Value
                        else Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := 0;
                    Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                    if (RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value = null)then
                      Class_StoredProc.ParamByName('SUMMA_VALUTA').AsDouble  := 0
                    else
                      Class_StoredProc.ParamByName('SUMMA_VALUTA').AsDouble  := RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value;
                    Class_StoredProc.ParamByName('ID_VALUTA').AsDouble     := id_valuta;
                    Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
                    Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
                    Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
                    Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
                    Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                    try Class_StoredProc.ParamByName('D_ID_MAN').AsInt64   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value; except Class_StoredProc.ParamByName('D_ID_MAN').AsInt64 := -1; end;
                    Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
//                Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value;
//                Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value;
                    Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                    Class_StoredProc.ParamByName('D_NOTE_PROV').AsVariant      := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value;

                    DataSetNumber.Close;                                                                                                                                              //cxDateEdit2.Text
                    DataSetNumber.Sqls.SelectSQL.Text := 'select * from BANK_PROVERKA_NA_VSTRECH('''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''', '''+datetostr(date_act)+''')';
                    DataSetNumber.Open;
                    if DataSetNumber.FBN('R_RES').AsInteger = 1 then flag_rs_rs := true else flag_rs_rs := false;
                    if (flag_rs_rs) and (prih=0) then
                    begin
                        DataSetNumber.Close;
                        DataSetNumber.Sqls.SelectSQL.Text := 'SELECT * FROM BANK_INI';
                        DataSetNumber.Open;
                        try Class_StoredProc.ParamByName('D_ID_DOG_D').AsInt64 := StrToInt64(DataSetNumber.FieldByNAme('ID_DOG_RS_RS_DEBET').AsString) except begin TProgresOnSave.Free; Class_Transaction_Wr.Rollback; Showmessage(Un_R_file_Alex.BANK_DONT_FIND_DOG_NA_RS_RS); Exit; end; end;;
                        Class_StoredProc.ParamByName('D_KOD_DOG_D').AsInt64    := StrToInt64(DataSetNumber.FieldByNAme('KOD_DOG_RS_RS_DEBET').AsString);
                        DataSetNumber.Close;
                    end else
                    begin
                        Class_StoredProc.ParamByName('D_ID_DOG_D').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                        Class_StoredProc.ParamByName('D_KOD_DOG_D').AsInt64    := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                    end;
                    Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myclass.id_user;
//                    Class_StoredProc.ParamByName('D_ID_ALL_DOC').AsInt64   := id_all;
                    Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
                    Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
                    Class_StoredProc.ParamByName('D_CR_BY_DT').AsInteger   := prih;
                    Class_StoredProc.ParamByName('D_PRIHOD').AsInteger     := prih;
                    Class_DataSet.Close;
                    Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_MAIN_SCH_INFO('''+DateToStr(date_provodka)+''', '''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''')';
                    Class_DataSet.Open;
                    ttt        := TFIBBCDField(Class_DataSet.FieldByName('ID_SYSTEM')).AsInteger;
                    Class_DataSet.Close;
                    Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_SYSTEM where ID_SYSTEM='+IntToStr(ttt)+'';
                    Class_DataSet.Open;
                    try r_id_m := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value except r_id_m := -1; end;
                    if (Class_DataSet.FieldByName('CHECK_ID_MEN').AsInteger =1) and (r_id_m <=0) then
                    begin
                        TProgresOnSave.Free;
                        showmessage(Un_R_file_Alex.ERROR_MAN_PROV);
                        exit;
                    end;

                    Class_DataSet.Close;
                    Class_StoredProc.ExecProc;
                    RxMemoryDataSaveAll.Next;
                end;


               // H_p(2, id_all);


                STRU.DBHANDLE := Class_Database.Handle;
                STRU.TRHANDLE := Class_Transaction_Wr.Handle;
                STRU.WORKDATE := date_provodka;
                STRU.KERNEL_ACTION := 3;
                STRU.KEY_SESSION   := id_session;
                STRU.PK_ID         := id_all;
                STRU.ID_USER       := myclass.id_user;
                try
                    DoResult:=Kernel.KernelDo(@STRU);
                except on E:Exception do
                begin
                    TProgresOnSave.Free;
                    ShowMessage(Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_KERNEL+E.Message);
                    Class_Transaction_Wr.Rollback;
                    exit;
                end;
                end;
                if not DoResult then
                begin
                    TProgresOnSave.Free;
                    cxSplitter2.OpenSplitter;
                    PageControl1.ActivePage := TabSheet3;
                    cxMemo2.Lines.Clear;
                    cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_DOC);
                    ErrorList:=Kernel.GetDocErrorsList(@STRU);
                    if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ERROR+ErrorList.Strings[i]);

                    cxMemo2.Text := cxMemo2.Text + IntToStr(STRU.KEY_SESSION);
                    cxMemo2.Text := cxMemo2.Text + IntToStr(STRU.KEY_SESSION_EX);
                    ErrorProvsDataSet.Close;
                    ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                    ErrorProvsDataSet.Open;
                    ErrorProvsDataSet.First;
                    RxError.EmptyTable;
                    while not ErrorProvsDataSet.Eof do
                    begin
                        name_prov := '';
                        ssum      := '';
                        RxMemoryDataSaveAll.First;
                        while Not RxMemoryDataSaveAll.Eof do
                        begin
                            if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value = ErrorProvsDataSet.FBN('ID_PROV').AsVariant then
                            begin
                                name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString;
                                ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                            end;
                            RxMemoryDataSaveAll.Next;
                        end;
                        RxError.Open;
                        RxError.Insert;
                        RxError.FieldByName('RxKod').Value  := ErrorProvsDataSet['ID_ERROR'];
                        RxError.FieldByName('RxName').Value := ErrorProvsDataSet['ERROR_MESSAGE'] + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                        RxError.Post;
                        ErrorProvsDataSet.Next;
                    end;
                    ErrorProvsDataSet.Close;
                    ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION_EX)+')';
                    ErrorProvsDataSet.Open;
                    ErrorProvsDataSet.First;
                    while not ErrorProvsDataSet.Eof do
                    begin
                        name_prov := '';
                        ssum      := '';
                        RxMemoryDataSaveAll.First;
                        while Not RxMemoryDataSaveAll.Eof do
                        begin
                            if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value = ErrorProvsDataSet.FBN('ID_PROV').AsVariant then
                            begin
                                name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString;
                                ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                            end;
                            RxMemoryDataSaveAll.Next;
                        end;
                        RxError.Open;
                        RxError.Insert;
                        RxError.FieldByName('RxKod').Value  := ErrorProvsDataSet['ID_ERROR'];
                        RxError.FieldByName('RxName').Value := ErrorProvsDataSet['ERROR_MESSAGE'] + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                        RxError.Post;
                        ErrorProvsDataSet.Next;
                    end;
                    Class_Transaction_Wr.Rollback;
                    DecimalSeparator := ',';
                    exit;
                end;

                if (myform.Priznac_komis = 1) and (flag_find_komis) and (prih = 0) and (cxCheckBox1.Checked) then
                begin
                    //запись комиссии
                    STRU.DBHANDLE      := Class_Database.Handle;
                    STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
                    STRU.KEY_SESSION   := id_session_kom;
                    STRU.WORKDATE      := date_provodka;
                    STRU.ID_USER       := myclass.id_user;
                    if flag_edit_kom_find then
                    begin
                        STRU.KERNEL_ACTION := 3;
                        STRU.PK_ID         := id_all_dok_komis_edit;
                    end else
                        STRU.KERNEL_ACTION := 1;
                    try
                        DoResult:=Kernel.KernelDo(@STRU);
                    except on E:Exception do
                    begin
                        TProgresOnSave.Free;
                        ShowMessage(Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_KERNEL+E.Message);
                        Class_Transaction_Wr.Rollback;
                        DecimalSeparator := ',';
                        exit;
                    end;
                    end;
                    if not DoResult then
                    begin
                        TProgresOnSave.Free;
                        cxSplitter2.OpenSplitter;
                        PageControl1.ActivePage := TabSheet3;
//                        cxMemo2.Lines.Clear;
                        cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_DOC);
                        ErrorList:=Kernel.GetDocErrorsList(@STRU);
                        if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ERROR+ErrorList.Strings[i]);
                        ErrorProvsDataSet.Close;
                        ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                        ErrorProvsDataSet.Open;
                        ErrorProvsDataSet.First;
                        cxMemo2.Text := cxMemo2.Text + IntToStr(STRU.KEY_SESSION);
                        cxMemo2.Text := cxMemo2.Text + IntToStr(STRU.KEY_SESSION_EX);
//                        RxError.EmptyTable;
                        while not ErrorProvsDataSet.Eof do
                        begin
                            name_prov := '';
                            ssum      := '';
                            RxMemoryDataSaveAll.First;
                            while Not RxMemoryDataSaveAll.Eof do
                            begin
                                if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value = ErrorProvsDataSet.FBN('ID_PROV').AsVariant then
                                begin
                                    name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString;
                                    ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                                end;
                                RxMemoryDataSaveAll.Next;
                            end;
                            RxError.Open;
                            RxError.Insert;
                            RxError.FieldByName('RxKod').Value  := ErrorProvsDataSet['ID_ERROR'];
                            RxError.FieldByName('RxName').Value := ErrorProvsDataSet['ERROR_MESSAGE'] + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                            RxError.Post;
                            ErrorProvsDataSet.Next;
                        end;
//                        RxError.EmptyTable;
                        ErrorProvsDataSet.Close;
                        ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION_EX)+')';
                        ErrorProvsDataSet.Open;
                        ErrorProvsDataSet.First;
                        while not ErrorProvsDataSet.Eof do
                        begin
                            name_prov := '';
                            ssum      := '';
                            RxMemoryDataSaveAll.First;
                            while Not RxMemoryDataSaveAll.Eof do
                            begin
                                if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value = ErrorProvsDataSet.FBN('ID_PROV').AsVariant then
                                begin
                                    name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString;
                                    ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                                end;
                                RxMemoryDataSaveAll.Next;
                            end;
                            RxError.Open;
                            RxError.Insert;
                            RxError.FieldByName('RxKod').Value  := ErrorProvsDataSet['ID_ERROR'];
                            RxError.FieldByName('RxName').Value := ErrorProvsDataSet['ERROR_MESSAGE'] + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                            RxError.Post;
                            ErrorProvsDataSet.Next;
                        end;
                        Class_Transaction_Wr.Rollback;
                        DecimalSeparator := ',';
                        exit;
                    end;
                end;

                // изменение clbank_buff
                if (myform.Priznac_komis = 1) and (flag_find_komis) and (prih = 0) and (cxCheckBox1.Checked) then
                begin
                    Class_StoredProc.StoredProcName:='BANK_UPDATE_CLBANK_BUFF_KOMIS';
                    Class_StoredProc.Prepare;
                    Class_StoredProc.ParamByName('D_ID_DOC').AsInt64      := myform.id_DOC;
                    Class_StoredProc.ParamByName('D_ALL_DOC').AsInt64     := id_all;
                    Class_StoredProc.ParamByName('D_ID_DOC_KOM').AsInt64  := Trec.id_doc;
                    Class_StoredProc.ParamByName('D_ALL_DOC_KOM').AsInt64 := id_all_dok_komis_edit;
                    Class_StoredProc.ParamByName('D_ID_PLAT').AsInt64     := myform.id_key;
                    Class_StoredProc.ExecProc;

                    {Class_StoredProc.StoredProcName:='KERNEL_CLEAR_TMP'; //удаление
                    Class_StoredProc.Prepare;
                    Class_StoredProc.ParamByName('KEY_SESSION').AsInt64  := id_session_kom;
                    Class_StoredProc.ExecProc;}
                end else
                begin
                    Class_StoredProc.StoredProcName:='BANK_UPDATE_CLBANK_BUFF';
                    Class_StoredProc.Prepare;
                    Class_StoredProc.ParamByName('D_ID_DOC').AsInt64      := myform.id_DOC;
                    Class_StoredProc.ParamByName('D_ALL_DOC').AsInt64     := id_all;
                    Class_StoredProc.ParamByName('D_OBRABOTAN').AsInteger := 1;
                    Class_StoredProc.ParamByName('D_ID_PLAT').AsInt64     := myform.id_key;
                    Class_StoredProc.ExecProc;
                end;

                if myform.is_add_CL_buff = 2 then
                begin
{                    Class_StoredProc.StoredProcName:='BANK_UPDATE_PL';
                    Class_StoredProc.Prepare;
                    Class_StoredProc.ParamByName('ID_KEY').AsInt64    := myform.id_key;
                    Class_StoredProc.ParamByName('PARAM').AsInt64     := 1;
                    Class_StoredProc.ExecProc;
                    //Запись в Банк-буфер от Лены
                    Class_DataSet.Close;
                    Class_DataSet.SQLs.SelectSQL.Text:='select * from CLBANK_BUFF_INSERT('''+ myclass.bank_day+''', '+IntToStr(myform.id_ras)+', '+IntToStr(myform.id_account_customer)+', '''+cxTextEditNum.text+''', '''+ DateToStr(myform.date_doc)+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+IntToStr(-1)+', '''+cxMemo1.Text+''', '''+IntToStr(0)+''', '''+'0'+''', '+IntToStr(0)+', '+IntToStr(0)+', '+IntToStr(2)+')';
                    Class_DataSet.Open;
//                    Изменение В банк-буфере Лены (выставление признака обработанности)
                    Class_StoredProc.StoredProcName:='BANK_UPDATE_CLBANK_BUFF';
                    Class_StoredProc.Prepare;
                    Class_StoredProc.ParamByName('D_ID_DOC').AsInt64      := TFIBBCDField(Class_DataSet.FieldByName('ID_DOC_RETURN')).AsInt64;
                    Class_StoredProc.ParamByName('D_ALL_DOC').AsInt64     := id_all;
                    Class_StoredProc.ParamByName('D_OBRABOTAN').AsInteger := 1;
                    Class_StoredProc.ParamByName('D_ID_PLAT').AsInt64     := myform.id_key;
                    Class_StoredProc.ExecProc;
                    Class_DataSet.Close;
}                end;
                if myform.id_key > 0 then
                begin
                    Class_StoredProc.StoredProcName:='BANK_UPDATE_PL';
                    Class_StoredProc.Prepare;
                    Class_StoredProc.ParamByName('ID_KEY').AsInt64    := myform.id_key;
                    Class_StoredProc.ParamByName('PARAM').AsInt64     := 1;
                    Class_StoredProc.ParamByName('ID_ALL').AsInt64    := id_all;
                    Class_StoredProc.ExecProc;
                end;

                if(flag_move_date=1) then
                begin

                 {Class_StoredProc.StoredProcName := 'BANK_MOVE_DAY_UPDATES';
                 Class_StoredProc.Prepare;
                 Class_StoredProc.ParamByName('ID_ALL_DOC_IN').AsInt64     := myform.DataSetMain['ID_ALL_DOC'];
                 Class_StoredProc.ParamByName('DATE_VIP_IN').AsDate        := date_act;  }

                 Class_StoredProc.ExecProc;
                 if(date_act>=myform.date_vip) then
                 begin
                     Class_StoredProc.StoredProcName:='BANK_PERESCHET_SALDO_BAL_SCH';
                     Class_StoredProc.Prepare;
                     Class_StoredProc.ParamByName('DATE_BEG').AsDate    := myform.date_vip;
                     Class_StoredProc.ParamByName('DATE_END').AsDate    := date_act;
                     Class_StoredProc.ParamByName('ID_SCH').AsInt64     := id_osnov_sch;
                     Class_StoredProc.ExecProc;
                 end else
                 begin
                     Class_StoredProc.StoredProcName:='BANK_PERESCHET_SALDO_BAL_SCH';
                     Class_StoredProc.Prepare;
                     Class_StoredProc.ParamByName('DATE_BEG').AsDate    := date_act;
                     Class_StoredProc.ParamByName('DATE_END').AsDate    := myform.date_vip;
                     Class_StoredProc.ParamByName('ID_SCH').AsInt64     := id_osnov_sch;
                     Class_StoredProc.ExecProc;
                 end;

                 myform.ActionRefreshExecute(self);
                end;

                {Class_StoredProc.StoredProcName:='KERNEL_CLEAR_TMP'; //удаление
                Class_StoredProc.Prepare;
                Class_StoredProc.ParamByName('KEY_SESSION').AsInt64  := id_session;
                Class_StoredProc.ExecProc; }

                TProgresOnSave.Free;
                Class_Transaction_Wr.Commit;
                myform.ActionRefreshExecute(self);
                Myform.DataSetMain.Locate('ID_DOC', j, []);
                DecimalSeparator := ',';
                close;
                exit;
            end;
        except on E:Exception do
        begin
            TProgresOnSave.Free;
            Class_Transaction_Wr.Rollback;
            ShowMessage(E.Message);
            DecimalSeparator := ',';
            exit;
        end;
        end;
    end;
    DecimalSeparator := ',';
end;

end;




procedure TfmBankOrder.ActionSaveAllExecute(Sender: TObject);
begin
    SaveAll := true;
    MySave;
end;

procedure TfmBankOrder.ActionChangeDogExecute(Sender: TObject);
var
    inppp, resul_dog : TDRes;
    k : integer;
//  kod_my_sc, kod_my_kor_sc : string;
begin
    flag_show_dog := false;
        inppp.ModalResult        := 1;
        SetLength(inppp.res, RxMemoryDataSaveAll.RecordCount);
        RxMemoryDataSaveAll.First;
        k := 0;
        while not RxMemoryDataSaveAll.Eof do
        begin
            inppp.res[k].kod_dog   := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').AsVariant;
            inppp.res[k].id_dog    := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant;
            inppp.res[k].IDSmeta   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').AsVariant;
            inppp.res[k].IDRazd    := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').AsVariant;
            inppp.res[k].IDStat    := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').AsVariant;
            inppp.res[k].id_Kekv   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').AsVariant;
            inppp.res[k].Summa     := 0;
            inppp.res[k].NSumma    := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsFloat;
            inppp.res[k].nameSmeta := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').AsString;
            inppp.res[k].nameRazd  := RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').AsString;
            inppp.res[k].nameState := RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').AsString;
            inppp.res[k].nameKekv  := RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').AsString;
            inppp.res[k].kodSmeta  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').AsInteger;
            inppp.res[k].kodRazd   := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').AsInteger;
            inppp.res[k].kodState  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').AsInteger;
            inppp.res[k].kodKekv   := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').AsInteger;
            inppp.res[k].id_tip_dog :=0;
            inppp.res[k].name_tip_dog := '';
            inppp.res[k].n_dog        := 0;
            inppp.res[k].d_dog        := 0;
            inppp.res[k].nomn_dog     := 0;
            inppp.res[k].nomd_dog     := 0;
            inppp.res[k].id_customer  := 0;
            inppp.res[k].name_customer := '';
            inppp.res[k].id_rate_acc   := 0;
            inppp.res[k].rate_acc      := '';
            inppp.res[k].mfo           := '';
            inppp.res[k].bank          := '';
            inppp.res[k].id_rate_acc_nat := 0;
            inppp.res[k].id_kor_sch    := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsVariant;
            inppp.res[k].kod_kor_sch   := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString;
            inppp.res[k].title_kor_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').AsString;
            RxMemoryDataSaveAll.Next;
            k := k + 1;
        end;
        resul_dog := Un_lo_file_Alex.LSelectMyltyDog(self, myclass.id_user, myclass.Class_Database, MultyDog, inppp, StrToFloat(myform.sum_doc));
        if resul_dog.ModalResult = 1 then
        begin
             ActionChangeDog.Caption := Un_R_file_Alex.BANK_DOC_ORDER_CHANGE_DOG;
             SpeedButton7.Visible := true;
             if prih = 1 then
             begin
                 id_osnov_sch    := myclass.id_osn_sch;
                 name_osnov_sch  := myclass.name_osn_sch;
                 title_sch       := myclass.title_osn_sch;
             end;
             if prih = 0 then
             begin
                 title_sch       := myclass.title_osn_sch;
                 id_osnov_sch    := myclass.id_osn_sch;
                 name_osnov_sch  := myclass.name_osn_sch;
             end;
             ActionChangeDog.Enabled := true;
             RxMemoryDataSaveAll.EmptyTable;
             for k:=0 to Length(resul_dog.res)-1  do
             begin
                 RxMemoryDataSaveAll.Open;
                 RxMemoryDataSaveAll.Insert;
                 RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := resul_dog.res[k].NSumma;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := resul_dog.res[k].IDSmeta;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := resul_dog.res[k].IDRazd;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := resul_dog.res[k].IDStat;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := resul_dog.res[k].id_Kekv;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := resul_dog.res[k].id_dog;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := resul_dog.res[k].kod_dog;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value := resul_dog.res[k].kodSmeta;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value  := resul_dog.res[k].kodRazd;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value := resul_dog.res[k].kodState;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := resul_dog.res[k].kodKekv;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := VarToStr(resul_dog.res[k].kodSmeta) +'\'+ VarToStr(resul_dog.res[k].kodRazd) +'\'+ VarToStr(resul_dog.res[k].kodState) +'\'+ VarToStr(resul_dog.res[k].kodKekv);
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_osnov_sch;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_osnov_sch;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value := title_sch;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := resul_dog.res[k].nameState;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := resul_dog.res[k].nameRazd;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := resul_dog.res[k].nameSmeta;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := resul_dog.res[k].nameKekv;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := '';
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value   := resul_dog.res[k].name_tip_dog;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value    := '';
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value    := resul_dog.res[k].n_dog;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := resul_dog.res[k].id_kor_sch;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := resul_dog.res[k].kod_kor_sch;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value   := '';
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := resul_dog.res[k].title_kor_sch;
                 RxMemoryDataSaveAll.Post;
            end;
        end;
    flag_show_dog := true;
end;

procedure TfmBankOrder.cxGridSaveAllDBTableView1DblClick(Sender: TObject);
begin
    ActionChangeExecute(Sender);
end;

function TfmBankOrder.SelectDogovor(all_summa : double; summa_valuta : double; id_valuta : Integer; name_valuta : string) : boolean;
var
    summa_dog : double;
    i, j, itt : integer;
    flag_na_exists_dog, flag_na_exists_sm : boolean;
    input_1 : TDogInput;
    res   : TDogResult;
    innnn, o : TSpravParams;
    ResSch : variant;
    id_sch_tmp : int64;
    sch_name_tmp, sch_title_tmp : string;
    sch_exist : integer;
begin
    sch_exist     := 0;
    flag_show_dog := false;
    summa_dog := all_summa;
    id_sch_tmp    :=0;
    if Show_Summa_Bank(summa_dog, '',summa_valuta, id_valuta, name_valuta) then
    begin
        SelectDogovor        := true;
        LoadSysData(Class_Transaction_R);
        SYS_ID_USER          := myclass.id_user;
        decimalseparator     := ',';
        input_1              := SYS_DEFAULT_DOG_INPUT;
        input_1.Owner        := Self;
        input_1.DBHandle     := Class_Database.Handle;
        input_1.ReadTrans    := Class_Database.DefaultTransaction.Handle;
        input_1.WriteTrans   := Class_Transaction_Wr.Handle;
        input_1.FormStyle    := fsNormal;
        DataSet.Close;
        DataSet.SQLs.SelectSQL.Text := 'select * from BANK_INI';
        DataSet.Open;
        if prih = 1
            then input_1.id_Group_add := DataSet.FieldByName('ID_GROUP_ADD_PR').AsInteger//61799//1499
            else input_1.id_Group_add := DataSet.FieldByName('ID_GROUP_ADD_RAS').AsInteger;//61799;//1599;
        input_1.id_Group     := DataSet.FieldByName('ID_GROUP').AsInteger;//61699;//699;
        DataSet.Close;
        input_1.Summa        := summa_dog;
        input_1.filter.bShowFilterForm := true;
        input_1.isZayav     := false;
        input_1.arndGetPay  := 1;
        input_1.shablon_data.bUse     := true;
        input_1.shablon_data.num      := cxTextEditNum.Text;
        input_1.shablon_data.date_dog := date_act;
        input_1.shablon_data.note     := cxMemo1.Text;
        input_1.shablon_data.summa    := StrToCurr(cxTextEditSumma.Text);
        input_1.shablon_data.id_rate_account    := myform.id_account_customer;
        input_1.shablon_data.id_rate_acc_native := myform.id_ras;
        input_1.filter.SummaFrom      := StrToCurr(cxTextEditSumma.Text);
        input_1.filter.SummaTo        := StrToCurr(cxTextEditSumma.Text);
        input_1.filter.bSumma         := true;
        input_1.filter.NameCust       := myform.name_cust;
        input_1.filter.bNameCust      := true;
        input_1.filter.id_cust        := myform.id_customer;
        input_1.filter.bID_Cust       := true;
        input_1.DateSys               := date_act;
        input_1.DateDoc               := date_act;
        SYS_CURRENT_DATE      := date_act;
        //***********************************************
        res := ShowDogMain(input_1);
        if res.ModalResult = 1 then
        begin
            i := length(res.Smets);
            for j := 0 to i-1 do
            begin
                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_INFO_SRSTSCH('+IntToStr(res.id_bl_account)+', '+IntToStr(res.Smets[j].NumSmeta)+', '+IntToStr(res.Smets[j].NumRazd)+', '+IntToStr(res.Smets[j].NumStat)+', '+IntToStr(res.Smets[j].NumKekv)+')';
                Class_DataSet.Open;
                flag_na_exists_sm := false;

                 if not flag_na_exists_sm then
                 begin
                     RxMemoryDataSaveAll.First;
                     itt := 0;
                     while not RxMemoryDataSaveAll.Eof do
                     begin
                         if RxMemoryDataSaveAll.FieldByName('id').AsInteger > itt then
                             itt := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
                         RxMemoryDataSaveAll.Next;
                     end;
                     RxMemoryDataSaveAll.Open;
                     RxMemoryDataSaveAll.Insert;
                     if res.Smets[j].NSumma = 0
                         then RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := summa_dog
                         else RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := res.Smets[j].NSumma;

                     RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value := summa_valuta;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := Class_DataSet['ID_SMETA'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := Class_DataSet['ID_RAZD'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := Class_DataSet['ID_STATE'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := Class_DataSet['ID_KEKV'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := res.id_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := res.kod_dog;
                     RxMemoryDataSaveAll.FieldByName('id_payer').Value            := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value      := title_sch;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := res.name_customer;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := res.d_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := res.name_tip_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := res.regest_num;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := res.n_dog;

                     if Class_DataSet.FieldByName('SM_KOD').AsInteger > 0 then
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value := Class_DataSet.FieldByName('SM_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value  := Class_DataSet.FieldByName('RAZ_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value := Class_DataSet.FieldByName('ST_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := Class_DataSet.FieldByName('SM_KOD').AsString +'\'+ Class_DataSet.FieldByName('RAZ_KOD').AsString +'\'+ Class_DataSet.FieldByName('ST_KOD').AsString +'\'+ Class_DataSet.FieldByName('KEKV_KOD').AsString;
                     end else
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value  := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := '';
                     end;
                     if Class_DataSet.FieldByName('KEKV_KOD').AsInteger >= 0
                         then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := Class_DataSet.FieldByName('KEKV_KOD').AsInteger
                         else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_osnov_sch;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_osnov_sch;
                     id_type_dog :=      res.id_tip_dog;
                     if (use_expert_sys=1) then
                     begin ////////////////////////////////////////////////

                          DataSetExpertSys.Close;
                          DataSetExpertSys.SQLs.SelectSQL.Text        := 'Select * from PUB_GET_KORR_SCH_FOR_BANKKASSA(:NATIVEBANKKASSASCH, :NATIVESCHINDB,:IDTYPEDOG,:IDSM,:ACTUALDATE,:CHECK_KORR_SCH_BY_REG, :IDRZ, :IDST)';
                          DataSetExpertSys.ParamByName('NATIVEBANKKASSASCH').AsInteger    := id_osnov_sch;
                          DataSetExpertSys.ParamByName('NATIVESCHINDB').AsInteger         := prih;
                          DataSetExpertSys.ParamByName('IDTYPEDOG').AsInteger             := id_type_dog;
                          DataSetExpertSys.ParamByName('IDSM').AsInteger                  := Class_DataSet['ID_SMETA'];
                          DataSetExpertSys.ParamByName('ACTUALDATE').Asdate               := myform.date_vip;
                          DataSetExpertSys.ParamByName('CHECK_KORR_SCH_BY_REG').AsInteger := 1;
                          DataSetExpertSys.ParamByName('IDRZ').AsInteger                  := Class_DataSet['ID_RAZD'];
                          DataSetExpertSys.ParamByName('IDST').AsInteger                  := Class_DataSet['ID_STATE'];
                          DataSetExpertSys.Open;
                          DataSetExpertSys.FetchAll;

                          if(DataSetExpertSys.RecordCount<1) or(DataSetExpertSys.IsEmpty) then
                          begin

                             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := 0;
                             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := '';
                             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := '';
                          end;
                          if(DataSetExpertSys.RecordCount=1) then
                          begin
                             if(DataSetExpertSys['KORRSCH']<>null) then
                                  RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := DataSetExpertSys['KORRSCH']
                             else
                                  RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := 0;
                             if(DataSetExpertSys['SCH_NUMBER']<>null) then
                                  RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := DataSetExpertSys.FieldByName('SCH_NUMBER').AsString
                             else
                                  RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := '';
                             if(DataSetExpertSys['SCH_TITLE']<>null) then
                                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DataSetExpertSys.FieldByName('SCH_TITLE').AsString
                             else
                                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := '';
                             id_sch_tmp     := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                             sch_name_tmp   := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString;
                            sch_title_tmp  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').AsString;
                          end;

                          if(DataSetExpertSys.RecordCount>1) then
                          begin
                             if((id_sch_tmp=null)or(id_sch_tmp=0)) then
                             begin
                                 if ShowExpertSch(self, self, ResSch) then
                                 begin
                                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := ResSch[2];
                                     RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := ResSch[1];
                                     RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := ResSch[0];
                                     id_sch_tmp     := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                                     sch_name_tmp   := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value;
                                     sch_title_tmp  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value;
                                 end;
                             end else
                             begin
                                 DataSetExpertSys.First;
                                 while not DataSetExpertSys.Eof do
                                 begin
                                     if(id_sch_tmp=DataSetExpertSys['KORRSCH']) then sch_exist :=1;
                                     DataSetExpertSys.Next;
                                 end;
                                 if(sch_exist =1) then
                                 begin
                                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := sch_title_tmp;
                                     RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := sch_name_tmp;
                                     RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := id_sch_tmp;
                                     sch_exist :=0;
                                 end else
                                 begin
                                     if ShowExpertSch(self, self, ResSch) then
                                     begin
                                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := ResSch[2];
                                         RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := ResSch[1];
                                         RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := ResSch[0];
                                         id_sch_tmp     := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                                         sch_name_tmp   := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value;
                                         sch_title_tmp  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value;
                                     end;
                                 end;
                             end;
                          end;

                     end else
                     begin
                         if Class_DataSet['ID_SCH'] > 0 then
                         begin
                             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := Class_DataSet['ID_SCH'];
                             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := Class_DataSet.FieldByName('KOD_SCH').AsString;
                             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := Class_DataSet.FieldByName('TITLE_SCH').AsString;
                         end else
                         begin
                             DataSetChangeProv.close;
                             DataSetChangeProv.Sqls.selectSQL.Text := 'select * from PUB_SP_TIP_DOG_BELONG_GROUP('+VarToStr(res.id_tip_dog)+', '+IntToStr(6)+')';//студгородок
                             DataSetChangeProv.Open;
                             if DataSetChangeProv['RESULT'] = 1 then
                             begin
                                 DataSetChangeProv.Close;
                                 DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+datetostr(date_act)+''')';
                                 DataSetChangeProv.Open;
                                 if DataSetChangeProv['RESULT'] = 1 then
                                 begin
                                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DataSetChangeProv['FOND_TITLE'];
                                     RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := DataSetChangeProv['ID_FOND'];
                                     RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DataSetChangeProv['FOND_NUM'];
                                 end else
                                 begin
                                     Showmessage(DataSetChangeProv['RESULT_MESSAGE']);
                                 end;
                             end;
                             DataSetChangeProv.close;
                             DataSetChangeProv.Sqls.selectSQL.Text := 'select * from PUB_SP_TIP_DOG_BELONG_GROUP('+VarToStr(res.id_tip_dog)+', '+IntToStr(7)+')';//договора за обучение
                             DataSetChangeProv.Open;
                             if DataSetChangeProv['RESULT'] = 1 then
                             begin
                                 DataSetChangeProv.Close;
                                 DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+datetostr(date_act)+''')';
                                 DataSetChangeProv.Open;
                                 if DataSetChangeProv['RESULT'] = 1 then
                                 begin
                                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DataSetChangeProv['FOND_TITLE'];
                                     RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := DataSetChangeProv['ID_FOND'];
                                     RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DataSetChangeProv['FOND_NUM'];
                                 end else
                                 begin
                                     Showmessage(DataSetChangeProv['RESULT_MESSAGE']);
                                 end;
                             end;
                         end;
                     end;
                     RxMemoryDataSaveAll.FieldByName('id').Value                               := itt+1;
                     RxMemoryDataSaveAll.Post;
                 end;
                 //занос в договора
                 flag_na_exists_dog := false;
                 RxMemoryDataDog.First;
                 While not RxMemoryDataDog.Eof do
                 begin
                     if (RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = res.id_dog) and
                        (RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString = res.kod_dog)
                         then flag_na_exists_dog := true;
                     RxMemoryDataDog.Next;
                 end;
                 if not flag_na_exists_dog then
                 begin
                     RxMemoryDataDog.Open;
                     RxMemoryDataDog.Insert;
                     RxMemoryDataDog.FieldByName('RxMemDat_summa').Value      := res.Smets[j].NSumma;
                     RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value       := Class_DataSet['ID_SMETA'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value     := Class_DataSet['ID_RAZD'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_st').Value       := Class_DataSet['ID_STATE'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value     := Class_DataSet['ID_KEKV'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value      := res.id_dog;
                     RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value     := res.kod_dog;
                     if Class_DataSet.FieldByName('SM_KOD').AsInteger > 0 then
                     begin
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value    := Class_DataSet.FieldByName('SM_KOD').AsInteger;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value     := Class_DataSet.FieldByName('RAZ_KOD').AsInteger;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value    := Class_DataSet.FieldByName('ST_KOD').AsInteger;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value := Class_DataSet.FieldByName('SM_KOD').AsString +'\'+ Class_DataSet.FieldByName('RAZ_KOD').AsString +'\'+ Class_DataSet.FieldByName('ST_KOD').AsString +'\'+ Class_DataSet.FieldByName('KEKV_KOD').AsString;
                     end else
                     begin
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value    := null;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value     := null;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value    := null;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value := '';
                     end;
                     if Class_DataSet.FieldByName('KEKV_KOD').AsInteger >= 0
                         then RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := Class_DataSet.FieldByName('KEKV_KOD').AsInteger
                         else RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := null;
                     RxMemoryDataDog.FieldByName('RxMemDatid_man').Value      := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value      := id_osnov_sch;
                     RxMemoryDataDog.FieldByName('RxMemDatsumma_value').Value := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatid_value').Value    := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value     := name_osnov_sch;
                     RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value;
                     RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                     RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value       := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := title_sch;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := res.name_customer;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := res.d_dog;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  := res.name_tip_dog;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := res.regest_num;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value   := res.n_dog;
                     RxMemoryDataDog.FieldByName('fio_cust').Value                := res.name_customer;
                     RxMemoryDataDog.Post;

                 end;
           end;
        end else
        begin
            SelectDogovor := false;
        end;
        Class_DataSet.Close;
    end else
    begin
        SelectDogovor := false;
    end;
    flag_show_dog := true;
end;

function TfmBankOrder.SelectChangeDogovor(all_summa: double; summa_valuta : Double; id_valuta : Integer; name_valuta : string): boolean;
var
    summa_dog : double;
    inputDog : TDogInput;
    res   : TDogResult;
    i, j, itt : integer;
    id_dog : int64;
    flag_na_exists_dog, flag_na_exists_sm : boolean;
    TT : TD;
begin
    flag_show_dog := false;
    summa_dog := all_summa;
    if Show_Summa_Bank(summa_dog, '', summa_valuta, id_valuta,name_valuta) then
    begin
        SelectChangeDogovor := true;
        SYS_ID_USER          := myclass.id_user;
        LoadSysData(Class_Transaction_R);
        decimalseparator     := ',';
        inputDog              := SYS_DEFAULT_DOG_INPUT;
        inputDog.Owner        := Self;
        inputDog.DBHandle     := Class_Database.Handle;
        inputDog.ReadTrans    := Class_Database.DefaultTransaction.Handle;
        inputDog.WriteTrans   := Class_Transaction_Wr.Handle;
        inputDog.FormStyle    := fsNormal;
        DataSet.Close;
        DataSet.SQLs.SelectSQL.Text := 'select * from BANK_INI';
        DataSet.Open;
        if prih = 1
            then inputDog.id_Group_add := DataSet.FieldByName('ID_GROUP_ADD_PR').AsInteger//61799//1499
            else inputDog.id_Group_add := DataSet.FieldByName('ID_GROUP_ADD_RAS').AsInteger;//61799;//1599;
        inputDog.id_Group     := DataSet.FieldByName('ID_GROUP').AsInteger;//61699;//699;
        DataSet.Close;
        inputDog.Summa        := summa_dog;
        inputDog.filter.bShowFilterForm := true;
        inputDog.isZayav     := false;
        inputDog.arndGetPay  := 1;
        inputDog.shablon_data.bUse     := true;
        inputDog.shablon_data.num      := cxTextEditNum.Text;
        inputDog.shablon_data.date_dog := date_act;
        inputDog.shablon_data.note     := cxMemo1.Text;
        inputDog.shablon_data.summa    := StrToCurr(cxTextEditSumma.Text);
        inputDog.shablon_data.id_rate_account    := myform.id_account_customer;
        inputDog.shablon_data.id_rate_acc_native := myform.id_ras;
        inputDog.filter.SummaFrom      := StrToCurr(cxTextEditSumma.Text);
        inputDog.filter.SummaTo        := StrToCurr(cxTextEditSumma.Text);
        inputDog.filter.bSumma         := true;
        inputDog.filter.NameCust       := myform.name_cust;
        inputDog.filter.bNameCust      := true;
        inputDog.filter.id_cust        := myform.id_customer;
        inputDog.filter.bID_Cust       := true;
        inputDog.DateSys               := date_act;
        inputDog.DateDoc               := date_act;
        res := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
            id_dog := RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant;
            RxMemoryDataDog.First;
            while not RxMemoryDataDog.Eof do
            begin
                if RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = id_dog then
                    RxMemoryDataDog.Delete;
                RxMemoryDataDog.Next;
            end;
            RxMemoryDataSaveAll.First;
            while not RxMemoryDataSaveAll.Eof do
            begin
                if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant = id_dog then
                    RxMemoryDataSaveAll.Delete;
                RxMemoryDataSaveAll.Next;
                end;
            RxMemoryDataPodDog.First;
            while not RxMemoryDataPodDog.Eof do
            begin
                if RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').AsVariant = id_dog then
                    RxMemoryDataPodDog.Delete;
                RxMemoryDataPodDog.Next;
            end;
            i := length(res.Smets);
            for j := 0 to i-1 do
            begin
                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_INFO_SRSTSCH('+IntToStr(res.id_bl_account)+', '+IntToStr(res.Smets[j].NumSmeta)+', '+IntToStr(res.Smets[j].NumRazd)+', '+IntToStr(res.Smets[j].NumStat)+', '+IntToStr(res.Smets[j].NumKekv)+')';
                Class_DataSet.Open;
                flag_na_exists_sm := false;
                RxMemoryDataSaveAll.First;
                while not RxMemoryDataSaveAll.Eof do
                begin
                    if (RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').AsVariant   = Class_DataSet['ID_SMETA']) and
                       (RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').AsVariant = Class_DataSet['ID_RAZD']) and
                       (RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').AsVariant   = Class_DataSet['ID_STATE']) and
                       (RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').AsVariant = Class_DataSet['ID_KEKV']) and
                       (RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant  = res.id_dog)
                    then
                    begin
                        flag_na_exists_sm := true;
                        RxMemoryDataSaveAll.Open;
                        RxMemoryDataSaveAll.Edit;
                        RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value + res.Smets[j].NSumma;
                        RxMemoryDataSaveAll.Post;
                    end;
                    RxMemoryDataSaveAll.Next;
                end;
                 if not flag_na_exists_sm then
                 begin
                     RxMemoryDataSaveAll.First;
                     itt := 0;
                     while not RxMemoryDataSaveAll.Eof do
                     begin
                         if RxMemoryDataSaveAll.FieldByName('id').AsInteger > itt then
                             itt := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
                         RxMemoryDataSaveAll.Next;
                     end;
                     RxMemoryDataSaveAll.Open;
                     RxMemoryDataSaveAll.Insert;
                     RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := res.Smets[j].NSumma;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := Class_DataSet['ID_SMETA'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := Class_DataSet['ID_RAZD'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := Class_DataSet['ID_STATE'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := Class_DataSet['ID_KEKV'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := res.id_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := res.kod_dog;
                     RxMemoryDataSaveAll.FieldByName('id_payer').Value            := 0;
                     if Class_DataSet.FieldByName('SM_KOD').AsInteger > 0 then
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value := Class_DataSet.FieldByName('SM_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value  := Class_DataSet.FieldByName('RAZ_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value := Class_DataSet.FieldByName('ST_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := Class_DataSet.FieldByName('SM_KOD').AsString +'\'+ Class_DataSet.FieldByName('RAZ_KOD').AsString +'\'+ Class_DataSet.FieldByName('ST_KOD').AsString +'\'+ Class_DataSet.FieldByName('KEKV_KOD').AsString;
                     end else
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value  := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := '';
                     end;
                     if Class_DataSet.FieldByName('KEKV_KOD').AsInteger >= 0
                         then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := Class_DataSet.FieldByName('KEKV_KOD').AsInteger
                         else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_osnov_sch;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_osnov_sch;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := Class_DataSet['ID_SCH'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := Class_DataSet.FieldByName('KOD_SCH').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := Class_DataSet.FieldByName('TITLE_SCH').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value := title_sch;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := res.name_customer;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := res.d_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := res.name_tip_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := res.regest_num;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := res.n_dog;
                     RxMemoryDataSaveAll.FieldByName('id').Value                               := itt+1;
                     RxMemoryDataSaveAll.Post;
                 end;
                 //занос в договора
                 flag_na_exists_dog := false;
                 RxMemoryDataDog.First;
                 While not RxMemoryDataDog.Eof do
                 begin
                     if (RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = res.id_dog) and
                        (RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString = res.kod_dog)
                         then flag_na_exists_dog := true;
                     RxMemoryDataDog.Next;
                 end;
                 if not flag_na_exists_dog then
                 begin
                     RxMemoryDataDog.Open;
                     RxMemoryDataDog.Insert;
                     RxMemoryDataDog.FieldByName('RxMemDat_summa').Value      := res.Smets[j].NSumma;
                     RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value       := Class_DataSet['ID_SMETA'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value     := Class_DataSet['ID_RAZD'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_st').Value       := Class_DataSet['ID_STATE'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value     := Class_DataSet['ID_KEKV'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value      := res.id_dog;
                     RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value     := res.kod_dog;
                     if Class_DataSet.FieldByName('SM_KOD').AsInteger > 0 then
                     begin
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value    := Class_DataSet.FieldByName('SM_KOD').AsInteger;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value     := Class_DataSet.FieldByName('RAZ_KOD').AsInteger;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value    := Class_DataSet.FieldByName('ST_KOD').AsInteger;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value := Class_DataSet.FieldByName('SM_KOD').AsString +'\'+ Class_DataSet.FieldByName('RAZ_KOD').AsString +'\'+ Class_DataSet.FieldByName('ST_KOD').AsString +'\'+ Class_DataSet.FieldByName('KEKV_KOD').AsString;
                     end else
                     begin
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value    := null;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value     := null;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value    := null;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value := '';
                     end;
                     if Class_DataSet.FieldByName('KEKV_KOD').AsInteger >= 0
                         then RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := Class_DataSet.FieldByName('KEKV_KOD').AsInteger
                         else RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := null;
                     RxMemoryDataDog.FieldByName('RxMemDatid_man').Value      := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value      := id_osnov_sch;
                     RxMemoryDataDog.FieldByName('RxMemDatsumma_value').Value := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatid_value').Value    := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value     := name_osnov_sch;
                     RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := Class_DataSet.FieldByName('TITLE_SCH').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := Class_DataSet['ID_SCH'];
                     RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value       := Class_DataSet.FieldByName('KOD_SCH').AsString;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := title_sch;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := res.name_customer;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := res.d_dog;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  := res.name_tip_dog;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := res.regest_num;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value   := res.n_dog;
                     RxMemoryDataDog.Post;
                 end;
           end;
        end else
        begin
            SelectChangeDogovor := false;
        end;
        Class_DataSet.Close;
    end else
    begin
        SelectChangeDogovor := false;
    end;
    flag_show_dog := true;
end;

procedure TfmBankOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if Class_Transaction_Wr.Active then Class_Transaction_Wr.Rollback;
//    if Class_Transaction_Wr.Active then Class_Transaction_Wr.Rollback;
    if Class_Database.DefaultTransaction.Active then
    Class_Database.DefaultTransaction.Rollback;
    FormStorage1.SaveFormPlacement;
end;

function TfmBankOrder.SelectOneDocKomis(vizov : integer): TDoc_komis;
begin
    if Trec.id_doc > 0 then exit;
    DataSetKomis.Close;
    DataSetKomis.sqls.SelectSQL.Text := ' SELECT * FROM BANK_FIND_KOMIS_DOC('''+ DateToStr(myform.date_doc)+''', '+IntToStr(myclass.id_ras_sch_pris)+', '''+cxTextEditNum.text+''', '+IntToStr(myform.id_doc)+')';
    DataSetKomis.Open;
    DataSetKomis.FetchAll;
    flag_find_komis := false;
    if DataSetKomis.RecordCount = 0 then
    begin
        flag_find_komis    := false;
        Result.error := 1;
        exit;
    end;
    if (DataSetKomis.RecordCount = 1) and (DataSetKomis.FieldByName('R_FLAG_FIND_DOC').AsInteger = 1) then
    begin
        Result.error       := 0;
        Result.id_doc      := TFIBBCDField(DataSetKomis.FieldByName('R_ID_DOC')).AsInt64;
        Result.summa_doc   := DataSetKomis.FieldByName('R_SUMMA').AsFloat;
        Result.note        := DataSetKomis.FieldByName('R_NOTE').AsString;
        Result.id_cust     := TFIBBCDField(DataSetKomis.FieldByName('R_ID_CUSTOMER')).AsInt64;
        Result.id_rate_acc := TFIBBCDField(DataSetKomis.FieldByName('R_ID_RATE')).AsInt64;
        Result.name_cust   := DataSetKomis.FieldByName('R_NAME_CUST').AsString;
        Result.date_vip    := DataSetKomis.FieldByName('R_DATE_VIP').AsDateTime;
        flag_find_komis    := true;
        exit;
    end;
    if (DataSetKomis.FieldByName('R_FLAG_FIND_DOC').AsInteger = 0) and (vizov = 1) then
    begin
        if ShowMultyKomisDoc(self) then
        begin
            Result.id_doc      := TFIBBCDField(DataSetKomis.FieldByName('R_ID_DOC')).AsInt64;
            Result.summa_doc   := DataSetKomis.FieldByName('R_SUMMA').AsFloat;
            Result.note        := DataSetKomis.FieldByName('R_NOTE').AsString;
            Result.id_cust     := TFIBBCDField(DataSetKomis.FieldByName('R_ID_CUSTOMER')).AsInt64;
            Result.id_rate_acc := TFIBBCDField(DataSetKomis.FieldByName('R_ID_RATE')).AsInt64;
            Result.name_cust   := DataSetKomis.FieldByName('R_NAME_CUST').AsString;
            Result.date_vip    := DataSetKomis.FieldByName('R_DATE_VIP').AsDateTime;
            flag_find_komis    := true;
        end else
        begin
            flag_find_komis    := false;
            Result.error := 2;
        end;
        exit;
    end;
    if (DataSetKomis.RecordCount > 1) and (vizov = 0) then
    begin
        flag_find_komis := false;
        Result.error    := 3;
        exit;
    end
end;

function TfmBankOrder.ZapisSowKOmis(zap: integer) : boolean;
var
    T : TfmUn_Progress_form;
begin
    if myform.Priznac_komis <> 1 then exit;
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_FIND_WARNING_CAPTION);
    T.Show;
    T.Repaint;
    if zap = 1 then
    begin
        if Trec.id_doc <=0 then
            Trec := SelectOneDocKomis(1);
        if TRec.error = 1 then
        begin
            T.Free;
            TProgresOnSave.Free;
            if MessageBox(Handle, PChar(Un_R_file_Alex.BANK_NO_DOC_KOMIS), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 4)=mrYes then
            begin
                flag_find_komis := false;
                result := false;
            end;
            TProgresOnSave := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_FIND_WARNING_CAPTION);
            TProgresOnSave.Show;
            TProgresOnSave.Repaint;
            exit;
        end;
        if TRec.error = 2 then
        begin
            flag_find_komis := false;
            T.Free;
            result := false;
            exit;
        end;
    end;
    if zap = 0 then
    begin
        if Trec.id_doc <=0 then
            Trec := SelectOneDocKomis(1);
        if TRec.error = 1 then
        begin
            flag_find_komis := false;
            T.Free;
            TProgresOnSave.Free;
            if MessageBox(Handle, PChar(Un_R_file_Alex.BANK_NO_DOC_KOMIS), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 4)=mrYes then
            begin
                result := false;
            end;
            TProgresOnSave := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_FIND_WARNING_CAPTION);
            TProgresOnSave.Show;
            TProgresOnSave.Repaint;
            exit;
        end;
        if TRec.error = 2 then
        begin
            flag_find_komis := false;
            T.Free;
            exit;
            result := false;
        end;
    end;
    RaschetKomissii;
    T.Free;
    result := true;
end;

function TfmBankOrder.MaxSum: double;
var
    s : double;
begin
    RxKomis.First;
    if RxKomis.IsEmpty then begin result := 0; exit; end;
    s := RxKomis.FieldByName('RxMemDat_summa').Value;
    while not RxKomis.Eof do
    begin
        if s < RxKomis.FieldByName('RxMemDat_summa').Value then
            s := RxKomis.FieldByName('RxMemDat_summa').Value;
        RxKomis.Next;
    end;
    RxKomis.First;
    result := s;
end;

procedure TfmBankOrder.RaschetKomissii;
var
    max_s, sum_komissii : double;
    flag_first_sum, flag_find_smeta : boolean;
    i{, j} : integer;
    {sssu,} sss : double;
begin
    flag_show_dog := false;
    flag_first_sum := true;
    sum_komissii   := StrToFloat(cxTextEditSumma.Text);
    i              := RxMemoryDataSaveAll.RecordCount;
    RxKomis.EmptyTable;
    RxMemoryDataSaveAll.First;
    while not RxMemoryDataSaveAll.Eof do     {групировка по сметам + суммы}
    begin
        DataSetKomis.Close;
        DataSetKomis.sqls.SelectSQL.Text := ' SELECT * FROM BANK_SELECT_FOR_KOMIS('''+RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').AsString+''', '''+DateToStr(date_act)+''')';
        DataSetKomis.Open;

        flag_find_smeta := false;
        RxKomis.First;
        while not RxKomis.Eof do
        begin                        {проверка по сметам}
            if (RxKomis.FieldByName('RxMemDatid_sm').Value = TFIBBCDField(DataSetKomis.FieldByName('R_ID_SM')).AsInt64) then
            begin
                RxKomis.Open;
                RxKomis.Edit;
                RxKomis.FieldbyName('RxMemDat_summa').Value := RxKomis.FieldbyName('RxMemDat_summa').Value + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                RxKomis.Post;
                flag_find_smeta := true;
                break;
            end;
            RxKomis.Next;
        end;
        if not flag_find_smeta then
        begin
            RxKomis.Open;
            RxKomis.Insert;
            RxKomis.FieldByName('RxMemDatid_sm').Value                  := TFIBBCDField(DataSetKomis.FieldByName('R_ID_SM')).AsInt64;
            RxKomis.FieldByName('RxMemDatid_razd').Value                := TFIBBCDField(DataSetKomis.FieldByName('R_ID_RAZD')).AsInt64;
            RxKomis.FieldByName('RxMemDatid_st').Value                  := TFIBBCDField(DataSetKomis.FieldByName('R_ID_STATE')).AsInt64;
            if DataSetKomis.FieldByName('R_RES_KEKV').asinteger = 0 then
            begin
                flag_find_komis := false;
                TProgresOnSave.Free;
                showmessage(DataSetKomis.FieldByName('R_RES_MES_KEKV').AsString);
                exit;
            end;
            RxKomis.FieldByName('RxMemDatid_kekv').Value                := TFIBBCDField(DataSetKomis.FieldByName('R_ID_KEKV')).AsInt64;
            RxKomis.FieldByName('RxMemDatid_dog').Value                 := BANK_ID_DOG_KOMIS;
            RxKomis.FieldByName('RxMemDatkod_dog').Value                := BANK_KOD_DOG_KOMIS;
            RxKomis.FieldByName('RxMemoryDataSaveAllKodSmeta').Value    := DataSetKomis.FieldByName('R_KOD_SM').Value;
            RxKomis.FieldByName('RxMemoryDataSaveAllKodRazd').Value     := DataSetKomis.FieldByName('R_RAZD_NUM').AsString;
            RxKomis.FieldByName('RxMemoryDataSaveAllKodState').Value    := DataSetKomis.FieldByName('R_STETE_NUM').AsString;
            RxKomis.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value := DataSetKomis.FieldByName('R_KOD_SM').AsString +'/'+DataSetKomis.FieldByName('R_RAZD_NUM').AsString +'/'+ DataSetKomis.FieldByName('R_STETE_NUM').AsString+'/'+DataSetKomis.FieldByName('R_NAME_KEKV').AsString;
            RxKomis.FieldByName('RxMemoryDataSaveAllKodKekv').Value     := DataSetKomis.FieldByName('R_NAME_KEKV').AsString;
            RxKomis.FieldByName('RxMemDatid_man').Value                 := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value;
            RxKomis.FieldByName('RxMemDatid_sch').Value                 := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
           // RxKomis.FieldByName('RxMemDatsumma_value').Value            := RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value;
            RxKomis.FieldByName('RxMemDatid_value').Value               := RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value;
            RxKomis.FieldByName('RxMemDatNameSch').Value                := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value;
            RxKomis.FieldByName('RxMemDatNameStat').Value               := DataSetKomis.FieldByName('R_TITLE_STATE').AsString;
            RxKomis.FieldByName('RxMemDatNameRazd').Value               := DataSetKomis.FieldByName('R_TITLE_RAZD').AsString;
            RxKomis.FieldByName('RxMemDatNameSmeta').Value              := DataSetKomis.FieldByName('R_TITLE_SM').Value;
            RxKomis.FieldByName('RxMemDatNameKekv').Value               := DataSetKomis.FieldByName('R_TITLE_KEKV').Value;
            RxKomis.FieldByName('RxMemDat_summa').Value                 := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
            RxKomis.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DataSetKomis['R_TITLE_SCH'];
            RxKomis.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := DataSetKomis['R_ID_SCH'];
            RxKomis.FieldByName('RxMemDatname_korespond').Value         := DataSetKomis['R_NAME_SCH'];
            if DataSetKomis['R_RESULT'] = 0 then
            begin
                TProgresOnSave.Free;
                Showmessage(DataSetKomis['R_RESULT_MESSAGE']);
                flag_find_komis := false;
            end;
            RxKomis.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value    := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
            RxKomis.FieldByName('RxMemoryDataSaveAllTitleSch').Value    := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value;
            RxKomis.FieldByName('RxMemoryDataDogFieldNameCust').Value   := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value;
            RxKomis.FieldByName('RxMemoryDataDogFieldDateDog').Value    := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value;
            RxKomis.FieldByName('RxMemoryDataDogFieldTypeDog').Value    := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value;
            RxKomis.FieldByName('RxMemoryDataDogFieldRegDog').Value     := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value;
            RxKomis.FieldByName('RxMemoryDataDogFieldNumDog').Value     := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value;
            RxKomis.Post;
        end;
        RxMemoryDataSaveAll.Next;
    end;

    if (i = 1) then
    begin
        RxKomis.Open;
        RxKomis.Edit;
        RxKomis.FieldByName('RxMemDat_summa').Value := TRec.summa_doc;
        RxKomis.Post;
    end
    else begin
        max_s          := MaxSum;
//        sssu           := RaschetSum(TRec.summa_doc, max_s);

        RxKomis.First;
        flag_first_sum := true;
        while not RxKomis.Eof do
        begin
             if (RxKomis.FieldByName('RxMemDat_summa').Value=max_s) and (flag_first_sum) then
             begin
                 RxKomis.Open;
                 RxKomis.Edit;
                 RxKomis.FieldByName('RxMemDat_summa').Value                 := max_s;//sssu;
                 RxKomis.Post;
                 flag_first_sum := false;
             end else
             begin
                 sss := (RxKomis.FieldByName('RxMemDat_summa').Value*TRec.summa_doc)/StrToFloat(cxTextEditSumma.Text);
                 RxKomis.Open;
                 RxKomis.Edit;
                 RxKomis.FieldByName('RxMemDat_summa').Value := RoundTo(sss, -2);
                 RxKomis.Post;
             end;
             RxKomis.Next;
        end;
        sss := 0;
        RxKomis.First;
        while not RxKomis.Eof do
        begin
             sss := sss + RxKomis.FieldByName('RxMemDat_summa').Value;
             RxKomis.Next;
        end;

        RxKomis.First;
        while not RxKomis.Eof do
        begin
             if RxKomis.FieldByName('RxMemDat_summa').Value=max_s then
             begin
                 RxKomis.Open;
                 RxKomis.Edit;
                 RxKomis.FieldByName('RxMemDat_summa').Value := TRec.summa_doc - sss + max_s;
                 RxKomis.Post;
             end;
             RxKomis.Next;
        end;
    end;
    flag_show_dog := true;
end;

function TfmBankOrder.RaschetSum(sum_d, max_sum: double): double;
var
    f : boolean;
    ss : double;
begin
    f := true;
    RxKomis.First;
    ss := 0;
    while not RxKomis.Eof do
    begin
        if (max_sum = RxKomis.FieldByName('RxMemDat_summa').Value) and (f) then
        begin
            f :=false;
        end else
            ss := ss + RxKomis.FieldByName('RxMemDat_summa').Value;
        RxKomis.Next;
    end;
    result := sum_d - ss;
end;

procedure TfmBankOrder.ActionShowKomExecute(Sender: TObject);
begin
    if myform.Priznac_komis = 1 then
    begin
        if ZapisSowKOmis(0) then
            ShowKomOrder(self);
    end;
end;

procedure TfmBankOrder.ActionShowAllIdExecute(Sender: TObject);
begin
    flag_show_dog := false;
    RxMemoryDataSaveAll.First;
    while not RxMemoryDataSaveAll.Eof do
    begin
        showmessage('summa - ' + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Asstring+#13+
                    'id_sm - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Asstring+#13+
                    'id_razd - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Asstring+#13+
                    'id_st - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Asstring+#13+
                    'id_kekv - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Asstring+#13+
                    'id_dog - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Asstring+#13+
                    'kod_dog - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Asstring+#13+
                    'id_sch - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Asstring+#13+
                    'id_kor_sch - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Asstring+#13+
                    'id_man - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Asstring+#13+
                    'id_prov - ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Asstring+#13+
                    'id_kod_doc - ' + IntToStr(TREc.id_doc));
        RxMemoryDataSaveAll.Next;
    end;
    flag_show_dog := true;
end;


function TfmBankOrder.SelectStudCity(f : boolean) : boolean;
var
    i, {j,} l, itt : integer;
    flag_na_exists_dog, flag_na_exists_sm : boolean;
    id_ss : int64;
    res : variant;
    y, o : TSpravParams;
    ffio, n_cust, n_do, reg_n, d_d : string;
begin
    flag_show_dog := false;
    SelectStudCity := true;

    Res := Load_st_BuildLivers(self, Class_Database.Handle, true, '', cxMemo1.Text);

    if VarArrayDimCount(Res)>0 then
    begin
{ResOpl[0][0] - ид.код проживающего
ResOpl[0][1] - дата проживания С
ResOpl[0][2] - дата проживания По
ResOpl[0][3] - сумма, которую нужно уплатить
ResOpl[0][4] - уже уплаченная сумма
ResOpl[0][5] - задолженность
ResOpl[0][6] - дата оплаты за период С
ResOpl[0][7] - дата оплаты за период По
ResOpl[0][8] - вносимая сумма
// первая часть суммы
ResOpl[1][0] - код сметы
ResOpl[1][1] - код раздела
ResOpl[1][2] - код статьи
ResOpl[1][3] - код КЕКВ
ResOpl[1][4] - первая часть суммы
// вторая часть суммы
ResOpl[2][0] - код сметы
ResOpl[2][1] - код раздела
ResOpl[2][2] - код статьи
ResOpl[2][3] - код КЕКВ
ResOpl[2][4] - вторая часть суммы
}
          l := Res[0][9]+1;
          for i := 1 to l-1 do
          begin
              Class_DataSet.Close;
              Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('''+VarToStr(Res[i][0])+''', '''+VarToStr(Res[i][1])+''', '''+VarToStr(Res[i][2])+''', '''+VarToStr(Res[i][3])+''')';
              Class_DataSet.Open;
              flag_na_exists_sm := false;
              id_ss := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);

                 if not flag_na_exists_sm then
                 begin
                     RxMemoryDataSaveAll.First;
                     itt := 0;
                     while not RxMemoryDataSaveAll.Eof do
                     begin
                         if RxMemoryDataSaveAll.FieldByName('id').AsInteger > itt then
                             itt := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
                         RxMemoryDataSaveAll.Next;
                     end;

                     RxMemoryDataSaveAll.Open;
                     RxMemoryDataSaveAll.Insert;
                     RxMemoryDataSaveAll.FieldByName('id').Value                           := itt+1; 
                     RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value               := Res[i][4];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                := Class_DataSet['ID_SMETA'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value              := Class_DataSet['ID_RAZD'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                := Class_DataSet['ID_STATE'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value              := Class_DataSet['ID_KEKV'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value               := Res[0][0];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value              := Res[0][11];
                     RxMemoryDataSaveAll.FieldByName('id_payer').Value                     := 0;
                     if Class_DataSet.FieldByName('SM_KOD').AsInteger > 0 then
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value := Class_DataSet.FieldByName('SM_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value  := Class_DataSet.FieldByName('RAZ_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value := Class_DataSet.FieldByName('ST_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := Class_DataSet.FieldByName('SM_KOD').AsString +'\'+ Class_DataSet.FieldByName('RAZ_KOD').AsString +'\'+ Class_DataSet.FieldByName('ST_KOD').AsString +'\'+ Class_DataSet.FieldByName('KEKV_KOD').AsString;
                     end else
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value  := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := '';
                     end;
                     if Class_DataSet.FieldByName('KEKV_KOD').AsInteger >= 0
                         then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := Class_DataSet.FieldByName('KEKV_KOD').AsInteger
                         else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_osnov_sch;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_osnov_sch;
                     y := TSpravParams.Create;
                     o := TSpravParams.Create;
                     y['DataBase']          := Integer(Class_Database.Handle);
                     y['ReadTransaction']   := Integer(Class_Database.DefaultTransaction.Handle);
                     y['ID_DOG']            := Res[0][0];
                     y['KOD_DOG']           := Res[0][11];
                     GetDogovorInfo(Self, @y, @o);
                     try ffio   := o['FIO_COMBO']        except ffio   := '';           end;
                     try n_cust := o['NAME_CUSTOMER']    except n_cust := '';           end;
                     try d_d    := DateToStr(o['D_DOG']) except d_d    := '01.01.1900'; end;
                     try n_do   := o['NUM_DOG']          except n_do   := '';           end;
                     try reg_n  := o['REGEST_NUM']       except reg_n  := '';           end;
                     try
                         begin
                             DataSetAccordance.Close;
                             DataSetAccordance.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_ACCORDANCE_SM_AND_SCH('+VarToStr(o['ID_BL_ACCOUNT'])+', '''+Class_DataSet.FieldByName('ID_SMETA').AsString+''')';
                             DataSetAccordance.Open;

                             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := DataSetAccordance['ID_SCH_KOR'];

                             DataSetChangeProv.Close;
                             DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SP_MAIN_SCH_INFO('''+DateToStr(date_act)+''', '''+DataSetAccordance.FieldByName('ID_SCH_KOR').AsString+''')';
                             DataSetChangeProv.Open;
                             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DataSetChangeProv['SCH_TITLE'];
                             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DataSetChangeProv['SCH_NUMBER'];
                             DataSetChangeProv.Close;
                         end
                     except
                         begin
                             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := -1;
                         end;
                     end;
                     if RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value <= 0 then
                     begin
                         DataSetChangeProv.Close;
                         DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+datetostr(date_act)+''')';
                         DataSetChangeProv.Open;
                         if DataSetChangeProv['RESULT'] = 1 then
                         begin
                             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DataSetChangeProv['FOND_TITLE'];
                             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := DataSetChangeProv['ID_FOND'];
                             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DataSetChangeProv['FOND_NUM'];
                         end else
                         begin
                             Showmessage(DataSetChangeProv['RESULT_MESSAGE']);
                         end;
                     end;

                     RxMemoryDataSaveAll.FieldByName('fio_stud').Value                         := ffio;//res.name_customer;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := n_cust;//res.name_customer;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := StrToDate(d_d);//res.d_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := null;//res.name_tip_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := reg_n;//res.regest_num;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := n_do;//res.n_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := id_ss;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value      := title_sch;
                     RxMemoryDataSaveAll.Post;
                 end;
                 //занос в договора
                 flag_na_exists_dog := false;
                 RxMemoryDataDog.First;
                 While not RxMemoryDataDog.Eof do
                 begin
                     if (RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = Res[0][0]) and
                        (RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString = Res[0][11])
                         then flag_na_exists_dog := true;
                     RxMemoryDataDog.Next;
                 end;
                 if not flag_na_exists_dog then
                 begin
                     RxMemoryDataDog.Open;
                     RxMemoryDataDog.Insert;
                     RxMemoryDataDog.FieldByName('RxMemDat_summa').Value      := Res[i][4];
                     RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value       := Class_DataSet['ID_SMETA'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value     := Class_DataSet['ID_RAZD'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_st').Value       := Class_DataSet['ID_STATE'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value     := Class_DataSet['ID_KEKV'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value      := Res[0][0];
                     RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value     := Res[0][11];
                     if Class_DataSet.FieldByName('SM_KOD').AsInteger > 0 then
                     begin
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value      := Class_DataSet.FieldByName('SM_KOD').AsInteger;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value       := Class_DataSet.FieldByName('RAZ_KOD').AsInteger;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value      := Class_DataSet.FieldByName('ST_KOD').AsInteger;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := Class_DataSet.FieldByName('SM_KOD').AsString +'\'+ Class_DataSet.FieldByName('RAZ_KOD').AsString +'\'+ Class_DataSet.FieldByName('ST_KOD').AsString +'\'+ Class_DataSet.FieldByName('KEKV_KOD').AsString;
                     end else
                     begin
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value      := null;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value       := null;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value      := null;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := '';
                     end;
                     if Class_DataSet.FieldByName('KEKV_KOD').AsInteger >= 0
                         then RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := Class_DataSet.FieldByName('KEKV_KOD').AsInteger
                         else RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := null;
                     RxMemoryDataDog.FieldByName('RxMemDatid_man').Value                       := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value                       := id_osnov_sch;
                     RxMemoryDataDog.FieldByName('RxMemDatsumma_value').Value                  := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatid_value').Value                     := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value                      := name_osnov_sch;
                     RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value                     := Class_DataSet.FieldByName('ST_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value                     := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value                    := Class_DataSet.FieldByName('SM_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value                     := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value       := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value;
                     RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value             := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                     RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value               := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value          := id_ss;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value          := title_sch;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := n_cust;//res.name_customer;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := StrToDate(d_d);//res.d_dog;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  := null;//res.name_tip_dog;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := reg_n;//res.regest_num;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value   := n_do;//res.n_dog;
                     RxMemoryDataDog.FieldByName('fio_stud').Value                     := ffio;//res.name_customer;
                     if ((ffio<>'') and(ffio<>null)) then
                          RxMemoryDataDog.FieldByName('fio_cust').Value                     := ffio+' '+n_cust
                     else RxMemoryDataDog.FieldByName('fio_cust').Value                := n_cust;
                     RxMemoryDataDog.Post;
                 end;
           end;
        end else
        begin
            SelectStudCity := false;
        end;
        Class_DataSet.Close;
    flag_show_dog := true;
end;

procedure TfmBankOrder.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked
        then cxButton1.Enabled := true
        else cxButton1.Enabled := false;
end;

procedure TfmBankOrder.ActionShowInfoExecute(Sender: TObject);
begin
    if (flag <> AddOrder) then
        Info_doc_show(self, Class_Database, StrToInt64(myform.DataSetMain.FieldByname('ID_ALL_DOC').AsString));
end;

procedure TfmBankOrder.cxGridDogDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
    ShowPProvPodDog;
end;

procedure TfmBankOrder.cxGridDogDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_UP) or (Key = VK_DOWN) then ShowPProvPodDog;
end;

procedure TfmBankOrder.ShowPProvPodDog;
var
    ffio, n_cust, n_do, reg_n, d_d : string;
begin
    cxTextEdit1.Text := '';
    cxTextEdit2.Text := '';
    try ffio   := RxMemoryDataDog.FieldByName('fio_stud').AsString                       except ffio   := ''; end;
    try n_cust := RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').AsString   except n_cust := ''; end;
    try d_d    := RxMemoryDataDog.FieldByName('RxMemoryDataDogFielddateDog').AsString    except d_d    := ''; end;
    try n_do   := RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').AsString     except n_do   := ''; end;
    try reg_n  := RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').AsString except reg_n  := ''; end;
    cxTextEdit1.Text := ffio + ' ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' ' + n_cust;
    cxTextEdit2.Text := n_do + Un_R_file_Alex.BANK_REG_NUM + reg_n + ' от - ' + d_d;

    RxMemoryDataPodDog.EmptyTable;
    if not RxMemoryDataDog.isEmpty then
    begin
        RxMemoryDataSaveAll.First;
        while not RxMemoryDataSaveAll.eof do
        begin
            if (RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant = RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant) and
               (RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').asString = RxMemoryDataDog.FieldByName('RxMemDatkod_dog').asString) then
            begin
                RxMemoryDataPodDog.Open;
                RxMemoryDataPodDog.Insert;
                RxMemoryDataPodDog.FieldByName('RxMemDat_summa').Value               := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                RxMemoryDataPodDog.FieldByName('RxMemorySummaValuta').Value          := RxMemoryDataSaveAll.FieldByName('RxMemorySummaValuta').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_sm').Value                := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_razd').Value              := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_st').Value                := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_kekv').Value              := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').Value               := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatkod_dog').Value              := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value   := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodState').Value  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value   := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_man').Value               := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatFio').Value                  := RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_sch').Value               := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatsumma_value').Value          := RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_value').Value             := RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatNameSch').Value              := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatNameStat').Value             := RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatNameRazd').Value             := RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatNameSmeta').Value            := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatNameKekv').Value             := RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatname_korespond').Value       := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataPodDogNote_prov').Value := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value;
                RxMemoryDataPodDog.FieldByName('id').Value := RxMemoryDataSaveAll.FieldByName('id').Value;
                RxMemoryDataPodDog.Post;
            end;
            RxMemoryDataSaveAll.Next;
        end;
    end
end;

function TfmBankOrder.SelectDogovorTritNew(a : string; f : boolean): boolean;
var
    flag_na_exists_dog, flag_na_exists_sm : boolean;
    id_ss : int64;
    SmetID, RazdID, StatID, KekvID : int64;
    y, o : TSpravParams;
    ffio, n_cust, n_do, reg_n, d_d : string;
    AParameter : TcnSimpleParamsEx;
    ResOpl     : Variant;
    i, l, itt{, j} : integer;
    //    d : TpFIBDatabase;
    //    t : tpFibTransaction;
begin
    flag_show_dog := false;
    AParameter                              := TcnSimpleParamsEx.Create;
    AParameter.Owner                        := self;
    AParameter.Db_Handle                    := Class_Database.Handle;
    AParameter.Formstyle                    := fsNormal;
    AParameter.cnParamsToPakage.Note        := a;
    AParameter.WaitPakageOwner              := self;
    AParameter.cnParamsToPakage.BarCode     := '';
    if f then
    begin
        if (flag = AddOrder)
            then AParameter.cnParamsToPakage.Summa := StrToCurr(myform.sum_doc)
            else AParameter.cnParamsToPakage.Summa := StrToCurr(cxTextEditSumma.Text);
        AParameter.cnParamsToPakage.IsWithSumma    := true;
    end else
    begin
        AParameter.cnParamsToPakage.IsWithSumma := false;
        AParameter.cnParamsToPakage.Summa       := -1;
    end;

    ResOpl:= RunFunctionFromPackageForBank(AParameter, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');
    if VarArrayDimCount(ResOpl)>0
    then begin
        SelectDogovorTritNew := true;
        l := ResOpl[0][11];
        for i := 1 to l do
        begin
            SmetID := StrToInt64(ResOpl[i][0]);
            RazdID := StrToInt64(ResOpl[i][1]);
            StatID := ResOpl[i][2];
            KekvID := ResOpl[i][3];
            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('+IntToStr(SmetID)+', '+IntToStr(RazdID)+', '+IntToStr(StatID)+', '+IntToStr(KekvID)+')';
            Class_DataSet.Open;
            flag_na_exists_sm := false;
            id_ss := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
            if not flag_na_exists_sm then
            begin
                RxMemoryDataSaveAll.First;
                itt := 0;
                 while not RxMemoryDataSaveAll.Eof do
                 begin
                     if RxMemoryDataSaveAll.FieldByName('id').AsInteger > itt then
                         itt := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
                     RxMemoryDataSaveAll.Next;
                 end;
                RxMemoryDataSaveAll.Open;
                RxMemoryDataSaveAll.Insert;
                RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := ResOpl[i][4];
                //RxMemoryDataSaveAll.FieldByName('id').Value                  := i+1;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := Class_DataSet['ID_SMETA'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := Class_DataSet['ID_RAZD'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := Class_DataSet['ID_STATE'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := Class_DataSet['ID_KEKV'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := ResOpl[0][2];
                RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := ResOpl[0][12];
                RxMemoryDataSaveAll.FieldByName('id_payer').Value            := ResOpl[0][5];
                     if Class_DataSet.FieldByName('SM_KOD').AsInteger > 0 then
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value     := Class_DataSet.FieldByName('SM_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := Class_DataSet.FieldByName('RAZ_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := Class_DataSet.FieldByName('ST_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := Class_DataSet.FieldByName('SM_KOD').AsString +'\'+ Class_DataSet.FieldByName('RAZ_KOD').AsString +'\'+ Class_DataSet.FieldByName('ST_KOD').AsString +'\'+ Class_DataSet.FieldByName('KEKV_KOD').AsString;
                     end else
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value     := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := '';
                     end;
                     if Class_DataSet.FieldByName('KEKV_KOD').AsInteger >= 0
                         then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value := Class_DataSet.FieldByName('KEKV_KOD').AsInteger
                         else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                    := Class_DataSet.FieldByName('ST_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                    := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                   := Class_DataSet.FieldByName('SM_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                      := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                      := id_osnov_sch;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value                 := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                    := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                     := name_osnov_sch;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value         := id_ss;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value         := title_sch;



                     y := TSpravParams.Create;
                     o := TSpravParams.Create;
                     y['DataBase'] := Integer(Class_Database.Handle);
                     y['ReadTransaction'] := Integer(Class_Database.DefaultTransaction.Handle);
                     y['ID_DOG']  := ResOpl[0][2];
                     y['KOD_DOG'] := ResOpl[0][12];
                     GetDogovorInfo(Self, @y, @o);
                     try ffio := o['FIO_COMBO']       except ffio := '';   end;
                     try n_cust := o['NAME_CUSTOMER'] except n_cust := ''; end;
                     try d_d := DateToStr(o['D_DOG']) except d_d := '01.01.1900'; end;
                     try n_do := o['NUM_DOG']         except n_do := '';   end;
                     try reg_n := o['REGEST_NUM']     except reg_n := '';  end;
                     try
                         begin
                             //RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := o['ID_BL_ACCOUNT'];
                             DataSetAccordance.Close;
                             DataSetAccordance.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_ACCORDANCE_SM_AND_SCH('+VarToStr(o['ID_BL_ACCOUNT'])+', '''+Class_DataSet.FieldByName('ID_SMETA').AsString+''')';
                             DataSetAccordance.Open;

                             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := DataSetAccordance['ID_SCH_KOR'];

                             DataSetChangeProv.Close;
                             DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SP_MAIN_SCH_INFO('''+DateToStr(date_act)+''', '''+DataSetAccordance.FieldByName('ID_SCH_KOR').AsString+''')';
                             DataSetChangeProv.Open;
                             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DataSetChangeProv['SCH_TITLE'];
                             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DataSetChangeProv['SCH_NUMBER'];
                             DataSetChangeProv.Close;
                         end
                     except
                         begin
                             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := -1;
                         end;
                     end;
                     if RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value <= 0 then
                     begin
                         DataSetChangeProv.Close;
                         DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+datetostr(date_act)+''')';
                         DataSetChangeProv.Open;
                         if DataSetChangeProv['RESULT'] = 1 then
                         begin
                             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DataSetChangeProv['FOND_TITLE'];
                             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := DataSetChangeProv['ID_FOND'];
                             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DataSetChangeProv['FOND_NUM'];
                         end else
                         begin
                             Showmessage(DataSetChangeProv['RESULT_MESSAGE']);
                         end;
                     end;





{                    DataSetChangeProv.Close;
                     DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit2.Text+''')';
                     DataSetChangeProv.Open;
                     if DataSetChangeProv['RESULT'] = 1 then
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DataSetChangeProv['FOND_TITLE'];
                         RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := DataSetChangeProv['ID_FOND'];
                         RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DataSetChangeProv['FOND_NUM'];
                     end else
                     begin
                         Showmessage(DataSetChangeProv['RESULT_MESSAGE']);
                     end;

                     y := TSpravParams.Create;
                     o := TSpravParams.Create;
                     y['DataBase'] := Integer(Class_Database.Handle);
                     y['ReadTransaction'] := Integer(Class_Database.DefaultTransaction.Handle);
                     y['ID_DOG']  := ResOpl[0][2];
                     y['KOD_DOG'] := ResOpl[0][12];
                     GetDogovorInfo(Self, @y, @o);
                     try ffio := o['FIO_COMBO']       except ffio := ''; end;
                     try n_cust := o['NAME_CUSTOMER'] except n_cust := ''; end;
                     try d_d := DateToStr(o['D_DOG']) except d_d := '01.01.1900'; end;
                     try n_do := o['NUM_DOG']         except n_do := ''; end;
                     try reg_n := o['REGEST_NUM']     except reg_n := ''; end;
                    } RxMemoryDataSaveAll.FieldByName('fio_stud').Value                         := ffio;//res.name_customer;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := n_cust;//res.name_customer;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := StrToDate(d_d);//res.d_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := null;//res.name_tip_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := reg_n;//res.regest_num;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := n_do;//res.n_dog;
                     RxMemoryDataSaveAll.FieldByName('id').Value                               := itt+1;
                     RxMemoryDataSaveAll.Post;
                     y.Free;
                     o.Free;
                 end;
                 //занос в договора
                 flag_na_exists_dog := false;
                 RxMemoryDataDog.First;
                 While not RxMemoryDataDog.Eof do
                 begin
                     if (RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = ResOpl[0][2]) and
                        (RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString = ResOpl[0][12])
                         then
                         begin
                             flag_na_exists_dog := true;
                             RxMemoryDataDog.Open;
                             RxMemoryDataDog.Edit;
                             RxMemoryDataDog.FieldByName('RxMemDat_summa').Value := RxMemoryDataDog.FieldByName('RxMemDat_summa').Value + ResOpl[i][4];
                             RxMemoryDataDog.Post;
                         end;
                     RxMemoryDataDog.Next;
                 end;
                 if not flag_na_exists_dog then
                 begin
                     RxMemoryDataDog.Open;
                     RxMemoryDataDog.Insert;
                     RxMemoryDataDog.FieldByName('RxMemDat_summa').Value      := ResOpl[i][4];
                     RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value       := Class_DataSet['ID_SMETA'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value     := Class_DataSet['ID_RAZD'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_st').Value       := Class_DataSet['ID_STATE'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value     := Class_DataSet['ID_KEKV'];
                     RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value      := ResOpl[0][2];
                     RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value     := ResOpl[0][12];
                     if Class_DataSet.FieldByName('SM_KOD').AsInteger > 0 then
                     begin
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value    := Class_DataSet.FieldByName('SM_KOD').AsInteger;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value     := Class_DataSet.FieldByName('RAZ_KOD').AsInteger;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value    := Class_DataSet.FieldByName('ST_KOD').AsInteger;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value := Class_DataSet.FieldByName('SM_KOD').AsString +'\'+ Class_DataSet.FieldByName('RAZ_KOD').AsString +'\'+ Class_DataSet.FieldByName('ST_KOD').AsString +'\'+ Class_DataSet.FieldByName('KEKV_KOD').AsString;
                     end else
                     begin
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value    := null;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value     := null;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value    := null;
                         RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value := '';
                     end;
                     if Class_DataSet.FieldByName('KEKV_KOD').AsInteger >= 0
                         then RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := Class_DataSet.FieldByName('KEKV_KOD').AsInteger
                         else RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := null;
                     RxMemoryDataDog.FieldByName('RxMemDatid_man').Value      := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value      := id_osnov_sch;
                     RxMemoryDataDog.FieldByName('RxMemDatsumma_value').Value := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatid_value').Value    := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value     := name_osnov_sch;
                     RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value;
                     RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                     RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value       := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := id_ss;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := title_sch;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := n_cust;//res.name_customer;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := StrToDate(d_d);//res.d_dog;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  := null;//res.name_tip_dog;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := reg_n;//res.regest_num;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value   := n_do;//res.n_dog;
                     RxMemoryDataDog.FieldByName('fio_stud').Value                     := ffio;//res.name_customer;
                     if ((ffio<>'') and(ffio<>null)) then
                          RxMemoryDataDog.FieldByName('fio_cust').Value                := ffio+' '+n_cust
                     else RxMemoryDataDog.FieldByName('fio_cust').Value                := n_cust;
                     RxMemoryDataDog.Post;

                     RxMemoryDataDog.Locate('RxMemDatid_dog', ResOpl[0][2], []);
                     ShowPProvPodDog;
                 end;
           end;
        end else
        begin
            SelectDogovorTritNew := false;
        end;
        Class_DataSet.Close;
    flag_show_dog := true;
end;

procedure TfmBankOrder.ActionSaveOnlyBuffExecute(Sender: TObject);
begin
    cxCheckBox2.Visible := not cxCheckBox2.Visible;
end;

procedure TfmBankOrder.H_d_k(a: smallint; pk_id : int64);
begin
    Class_StoredProc.StoredProcName := 'J4_DT_D_H_INSERT';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('PK_ID').AsInt64              := pk_id;
    Class_StoredProc.ParamByName('DATETIME').AsDateTime        := date;
    Class_StoredProc.ParamByName('DATE_REG').AsDateTime        := date_act;
    Class_StoredProc.ParamByName('DATE_PROV').AsDateTime       := Trec.date_vip;
    Class_StoredProc.ParamByName('DATE_DOC').AsDateTime        := myform.date_doc;
    Class_StoredProc.ParamByName('ID_TYPE_DOC').AsInt64        := 2;
    Class_StoredProc.ParamByName('NUM_DOC').AsString           := cxTextEditNum.Text;
    Class_StoredProc.ParamByName('SUMMA').AsCurrency           := StrToCurr(StringReplace(FloatToStr(TRec.summa_doc),',','.',[]));
    Class_StoredProc.ParamByName('ID_CUSTOMER').AsInt64        := Trec.id_cust;
    Class_StoredProc.ParamByName('NOTE').AsString              := Trec.note;
//                        Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxKomis.FieldByName('RxMemDatsumma_value').Value;
//                        Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxKomis.FieldByName('RxMemDatid_value').Value;
    Class_StoredProc.ParamByName('FIO').AsString               := Trec.name_cust;
    Class_StoredProc.ParamByName('ID_RATE_ACC').AsInt64        := Trec.id_rate_acc;
    Class_StoredProc.ParamByName('ID_RATE_ACC_NATIVE').AsInt64 := myform.id_ras;
    Class_StoredProc.ParamByName('PRIHOD').AsInteger           := prih;
    Class_StoredProc.ParamByName('ID_USER').AsInt64            := myclass.id_user;
    Class_StoredProc.ParamByName('ID_SERVER').AsInt64          := -1;
    Class_StoredProc.ParamByName('COMPUTER').AsString          := GetComputerNetName;
    Class_StoredProc.ParamByName('PR').AsInteger               := a;
    Class_StoredProc.ExecProc;
end;

procedure TfmBankOrder.H_p_k(a: smallint; pk_i : int64);
var
    i : integer;
begin
    RxKomis.First;
    for i:=1 to RxKomis.RecordCount do
    begin
        Class_StoredProc.StoredProcName := 'J4_DT_P_H_INSERT';
        Class_StoredProc.Prepare;
        Class_StoredProc.ParamByName('ID_PROV').AsInt64         := RxKomis.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
        Class_StoredProc.ParamByName('DATE_REG').AsDate         := date_act;
        Class_StoredProc.ParamByName('DATETIME').AsDateTime     := date;
        Class_StoredProc.ParamByName('STORNO').AsInteger        := 0;
        Class_StoredProc.ParamByName('DB_ID_SM').AsInt64        := RxKomis.FieldByName('RxMemDatid_sm').Value;
        Class_StoredProc.ParamByName('DB_ID_RZ').AsInt64        := RxKomis.FieldByName('RxMemDatid_razd').Value;
        Class_StoredProc.ParamByName('DB_ID_ST').AsInt64        := RxKomis.FieldByName('RxMemDatid_st').Value;
        Class_StoredProc.ParamByName('DB_ID_KEKV').AsInt64      := RxKomis.FieldByName('RxMemDatid_kekv').Value;
        Class_StoredProc.ParamByName('DB_DT_PROV').AsDateTime   := Trec.date_vip;
        Class_StoredProc.ParamByName('DB_ID_DOG').AsInt64       := BANK_ID_DOG_KOMIS;
        Class_StoredProc.ParamByName('DB_KOD_DOG').AsInt64      := BANK_KOD_DOG_KOMIS;
        Class_StoredProc.ParamByName('KR_ID_SM').AsInt64        := RxKomis.FieldByName('RxMemDatid_sm').Value;
        Class_StoredProc.ParamByName('KR_ID_RZ').AsInt64        := RxKomis.FieldByName('RxMemDatid_razd').Value;
        Class_StoredProc.ParamByName('KR_ID_ST').AsInt64        := RxKomis.FieldByName('RxMemDatid_st').Value;
        Class_StoredProc.ParamByName('KR_ID_KEKV').AsInt64      := RxKomis.FieldByName('RxMemDatid_kekv').Value;
        Class_StoredProc.ParamByName('KR_DT_PROV').AsDateTime   := Trec.date_vip;
        Class_StoredProc.ParamByName('KR_ID_DOG').AsInt64       := BANK_ID_DOG_KOMIS;
        Class_StoredProc.ParamByName('KR_KOD_DOG').AsInt64      := BANK_KOD_DOG_KOMIS;
        if prih = 1 then
        begin
            Class_StoredProc.ParamByName('DB_ID_SCH').AsInt64   := RxKomis.FieldByName('RxMemDatid_sch').Value;
            Class_StoredProc.ParamByName('KR_ID_SCH').AsInt64   := RxKomis.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
        end else
        begin
            Class_StoredProc.ParamByName('DB_ID_SCH').AsInt64   := RxKomis.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
            Class_StoredProc.ParamByName('KR_ID_SCH').AsInt64   := RxKomis.FieldByName('RxMemDatid_sch').Value;
        end;
        Class_StoredProc.ParamByName('SUMMA').AsCurrency        := RxKomis.FieldByName('RxMemDat_summa').Value;
        try Class_StoredProc.ParamByName('ID_MEN').AsInt64      := RxKomis.FieldByName('RxMemDatid_man').Value; except Class_StoredProc.ParamByName('ID_MEN').AsInt64 := -1; end;
        Class_StoredProc.ParamByName('ID_PAYER').AsInt64        := 0;
        Class_StoredProc.ParamByName('ID_SERVER').AsInt64       := -1;
        Class_StoredProc.ParamByName('SUMMA_VALUTE').AsCurrency := 0;
        Class_StoredProc.ParamByName('ID_VALUTE').AsInt64       := 0;
        Class_StoredProc.ParamByName('IS_MAIN').AsInteger       := 1;
        Class_StoredProc.ParamByName('DB_PK_ID').AsInt64        := pk_i;
        Class_StoredProc.ParamByName('KR_PK_ID').AsInt64        := pk_i;
        Class_StoredProc.ParamByName('LINKTO').AsInt64          := -1;
        Class_StoredProc.ParamByName('PR').AsInteger            := a;
        Class_StoredProc.ExecProc;
        RxKomis.Next;
    end;
end;

procedure TfmBankOrder.H_d(a: smallint; pk_id : int64);
begin
    Class_StoredProc.StoredProcName := 'J4_DT_D_H_INSERT';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('PK_ID').AsInt64              := pk_id;
    Class_StoredProc.ParamByName('DATETIME').AsDateTime        := date;
    Class_StoredProc.ParamByName('DATE_REG').AsDateTime        := date_act;
    Class_StoredProc.ParamByName('DATE_PROV').AsDateTime       := date_act;
    Class_StoredProc.ParamByName('DATE_DOC').AsDateTime        := myform.date_doc;
    Class_StoredProc.ParamByName('ID_TYPE_DOC').AsInt64        := 2;
    Class_StoredProc.ParamByName('NUM_DOC').AsString           := cxTextEditNum.Text;
    Class_StoredProc.ParamByName('SUMMA').AsCurrency           := StrToCurr(StringReplace(cxTextEditSumma.Text,',','.',[]));
    Class_StoredProc.ParamByName('ID_CUSTOMER').AsInt64        := myform.id_customer;
    Class_StoredProc.ParamByName('NOTE').AsString              := cxMemo1.Text;
//                        Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxKomis.FieldByName('RxMemDatsumma_value').Value;
//                        Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxKomis.FieldByName('RxMemDatid_value').Value;
    Class_StoredProc.ParamByName('FIO').AsString               := cxMRUEditFio.Text;
    Class_StoredProc.ParamByName('ID_RATE_ACC').AsInt64        := myform.id_account_customer;
    Class_StoredProc.ParamByName('ID_RATE_ACC_NATIVE').AsInt64 := myform.id_ras;
    Class_StoredProc.ParamByName('PRIHOD').AsInteger           := prih;
    Class_StoredProc.ParamByName('ID_USER').AsInt64            := myclass.id_user;
    Class_StoredProc.ParamByName('ID_SERVER').AsInt64          := -1;
    Class_StoredProc.ParamByName('COMPUTER').AsString          := GetComputerNetName;
    Class_StoredProc.ParamByName('PR').AsInteger               := a;
    Class_StoredProc.ExecProc;
end;

procedure TfmBankOrder.H_p(a: smallint; pk_i : int64);
begin
    RxMemoryDataSaveAll.First;
    while not RxMemoryDataSaveAll.Eof do
    begin
        Class_StoredProc.StoredProcName := 'J4_DT_P_H_INSERT';
        Class_StoredProc.Prepare;
        Class_StoredProc.ParamByName('ID_PROV').AsInt64         := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
        Class_StoredProc.ParamByName('DATE_REG').AsDate         := date_act;
        Class_StoredProc.ParamByName('DATETIME').AsDateTime     := date;
        Class_StoredProc.ParamByName('STORNO').AsInteger        := 0;
        Class_StoredProc.ParamByName('DB_ID_SM').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
        Class_StoredProc.ParamByName('DB_ID_RZ').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
        Class_StoredProc.ParamByName('DB_ID_ST').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
        Class_StoredProc.ParamByName('DB_ID_KEKV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
        Class_StoredProc.ParamByName('DB_DT_PROV').AsDateTime   := Trec.date_vip;
        Class_StoredProc.ParamByName('DB_ID_DOG').AsInt64       := BANK_ID_DOG_KOMIS;
        Class_StoredProc.ParamByName('DB_KOD_DOG').AsInt64      := BANK_KOD_DOG_KOMIS;
        Class_StoredProc.ParamByName('KR_ID_SM').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
        Class_StoredProc.ParamByName('KR_ID_RZ').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
        Class_StoredProc.ParamByName('KR_ID_ST').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
        Class_StoredProc.ParamByName('KR_ID_KEKV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
        Class_StoredProc.ParamByName('KR_DT_PROV').AsDateTime   := Trec.date_vip;
        Class_StoredProc.ParamByName('KR_ID_DOG').AsInt64       := BANK_ID_DOG_KOMIS;
        Class_StoredProc.ParamByName('KR_KOD_DOG').AsInt64      := BANK_KOD_DOG_KOMIS;
        if prih = 1 then
        begin
            Class_StoredProc.ParamByName('DB_ID_SCH').AsInt64   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
            Class_StoredProc.ParamByName('KR_ID_SCH').AsInt64   := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
        end else
        begin
            Class_StoredProc.ParamByName('DB_ID_SCH').AsInt64   := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
            Class_StoredProc.ParamByName('KR_ID_SCH').AsInt64   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
        end;
        Class_StoredProc.ParamByName('SUMMA').AsCurrency        := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
        try Class_StoredProc.ParamByName('ID_MEN').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value; except Class_StoredProc.ParamByName('ID_MEN').AsInt64 := -1; end;
        Class_StoredProc.ParamByName('ID_PAYER').AsInt64        := -1;
        Class_StoredProc.ParamByName('ID_SERVER').AsInt64       := -1;
        Class_StoredProc.ParamByName('SUMMA_VALUTE').AsCurrency := 0;
        Class_StoredProc.ParamByName('ID_VALUTE').AsInt64       := 0;
        Class_StoredProc.ParamByName('IS_MAIN').AsInteger       := 1;
        Class_StoredProc.ParamByName('DB_PK_ID').AsInt64        := pk_i;
        Class_StoredProc.ParamByName('KR_PK_ID').AsInt64        := pk_i;
        Class_StoredProc.ParamByName('LINKTO').AsInt64          := -1;
        Class_StoredProc.ParamByName('PR').AsInteger            := a;
        Class_StoredProc.ExecProc;
        RxMemoryDataSaveAll.Next;
    end;
end;

procedure TfmBankOrder.cxGridSaveAllDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
    showSplInfo;
end;

procedure TfmBankOrder.cxGridSaveAllDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_UP) or (Key = VK_DOWN) then showSplInfo;
end;

procedure TfmBankOrder.showSplInfo;
var
    ffio, n_cust, d_d, n_do, reg_n : string;
begin
    cxTextEdit6.Text := '';
    try ffio         := RxMemoryDataSaveAll.FieldByName('fio_stud').AsString                           except ffio   := ''; end;
    try n_cust       := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').AsString   except n_cust := ''; end;
    try d_d          := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').AsString    except d_d    := ''; end;
    try n_do         := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').AsString     except n_do   := ''; end;
    try reg_n        := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').AsString     except reg_n  := ''; end;
    cxTextEdit6.Text := ffio + ' ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' ' + n_cust;
    cxTextEdit7.Text := n_do + Un_R_file_Alex.BANK_REG_NUM + reg_n + ' от - ' + d_d;


end;

procedure TfmBankOrder.RxMemoryDataPodDogAfterScroll(DataSet: TDataSet);
begin
    if RxMemoryDataPodDog.FieldByName('RxMemoryDataPodDogNote_prov').Value <> null then
        cxTextEditComent.Text := RxMemoryDataPodDog.FieldByName('RxMemoryDataPodDogNote_prov').Value else
        cxTextEditComent.Text := '';
end;

procedure TfmBankOrder.RxMemoryDataSaveAllAfterScroll(DataSet: TDataSet);
begin
    if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value <> null then
        cxMemo3.Text := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value else
        cxMemo3.Text := '';
end;

procedure TfmBankOrder.ActionAddProvExecute(Sender: TObject);
var
    id_smeta, id_stat, id_r, id_k, id_sch, id_man_prov, id_kor_sch : int64;
    name_smeta, name_stat, name_r, name_k, name_sch, name_fio, name_kor_sch, t_sch, t_kor_sch, kod_sm, kod_rz, kod_st, kod_kekv : string;
    summa : double;
    summa_doc : double;
    summa_valuta : double;
    summa_valuta_doc : double;
    date_dog, num_dog, name_cust, type_dog, reg_dog, tin, birthday, note_prov : string;
    id_dog, kod_dog, id_prov : int64;
    cr_by_dt, type_schablon, itt : integer;
    flag_na_exists_dog : boolean;
begin
     flag_show_dog := false;
     decimalseparator := ',';

if flag <> ShowOrder then
begin
     RxMemoryDataSaveAll.First;
     summa_doc := 0;
     while not RxMemoryDataSaveAll.Eof do
        begin
            summa_doc := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
            RxMemoryDataSaveAll.next;
        end;
        summa    := StrToFloat(cxTextEditSumma.Text) - summa_doc;
        id_smeta := 0;
        id_stat  := 0;
        id_r     := 0;
        id_k     := 0;
        id_sch   := id_osnov_sch;
        id_kor_sch := 0;
        name_fio   := cxMRUEditFio.Text;
        name_kor_sch := '';
        name_smeta := '';
        name_stat  := '';
        name_r     := '';
        name_k     := '';
        name_sch   := name_osnov_sch;
        buh_prov   := 1;
        kod_sm     := '';
        kod_rz     := '';
        kod_st     := '';
        kod_kekv   := '';
        t_sch      := title_sch;
        t_kor_sch  := '';
        date_dog   := '';
        num_dog    := '';
        name_cust  := '';
        type_dog   := '';
        reg_dog    := '';
        id_dog     := 0;
        kod_dog    := 0;
        tin        := '';
        birthday   := '';
        id_prov    := 0;
        cr_by_dt   := prih;
        note_prov  := '';
        itt := 0;
        RxMemoryDataSaveAll.First;
        while not RxMemoryDataSaveAll.Eof do
        begin
            if RxMemoryDataSaveAll.FieldByName('id').AsInteger > itt then itt := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
            RxMemoryDataSaveAll.Next;
        end;
        if Show_Provodka(self, myform.id_ras, Class_Database, myclass.Class_Transaction_R, AddProv, id_kor_sch, id_man_prov, id_sch, id_smeta, id_stat, id_r, id_k, summa, name_fio, name_sch, kod_sm, kod_st, kod_rz, kod_kekv,  name_smeta, name_stat, name_r, name_k, name_kor_sch, t_sch, t_kor_sch, date_dog, num_dog, name_cust, type_dog, reg_dog, id_dog, kod_dog, tin, birthday, id_prov, cr_by_dt, note_prov, id_valuta, name_valuta, summa_valuta) then
        begin
             cr_dt := cr_by_dt;
             RxMemoryDataSaveAll.Open;
             RxMemoryDataSaveAll.Insert;
             RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := summa;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := id_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := id_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := id_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := id_k;
             //RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := 0;
             //RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := kod_st;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := kod_rz;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value     := kod_sm;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value      := kod_kekv;
             RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value                     := name_fio;
             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := id_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value     := t_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value  := t_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := name_kor_sch;
             if id_prov > 0
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := id_prov
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                := name_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                := name_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value               := name_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                := name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := kod_sm + '\'+ kod_rz + '\' + kod_st +'\'+ kod_kekv;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value  := StrToDate(date_dog);
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := num_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := name_cust;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := type_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := reg_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := id_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := kod_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value      := tin;
             if birthday = ''
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := null
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := birthday;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value      := Note_prov;
             RxMemoryDataSaveAll.FieldByName('id').AsInteger                                 := itt+1;
             RxMemoryDataSaveAll.Post;

             RxMemoryDataSaveAll.Locate('id', id, []);


             flag_na_exists_dog := false;
             RxMemoryDataDog.First;
             While not RxMemoryDataDog.Eof do
             begin
                 if (RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = id_dog) and
                    (RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsVariant = kod_dog)
                     then flag_na_exists_dog := true;
                 RxMemoryDataDog.Next;
             end;
             if not flag_na_exists_dog then
             begin
                     RxMemoryDataDog.Open;
                     RxMemoryDataDog.Insert;
                     RxMemoryDataDog.FieldByName('RxMemDat_summa').Value      := summa;
                     RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value       := id_smeta;
                     RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value     := id_r;
                     RxMemoryDataDog.FieldByName('RxMemDatid_st').Value       := id_stat;
                     RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value     := id_k;
                     RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value      := id_dog;
                     RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value     := kod_dog;

                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value    := kod_sm;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value     := kod_rz;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value    := kod_st;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value := kod_sm +'\'+ kod_rz +'\'+ kod_st +'\'+ kod_kekv;

                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := kod_kekv;

                     RxMemoryDataDog.FieldByName('RxMemDatid_man').Value      := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value      := id_osnov_sch;
                     RxMemoryDataDog.FieldByName('RxMemDatsumma_value').Value := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatid_value').Value    := 0;
                     RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value     := name_osnov_sch;
                     RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value    := name_stat;
                     RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value    := name_r;
                     RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value   := name_smeta;
                     RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value    := name_k;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value;
                     RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                     RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value       := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value;
                     RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := title_sch;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := name_cust;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := StrToDate(date_dog);
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  := type_dog;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := reg_dog;
                     RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value   := num_dog;
                     RxMemoryDataDog.FieldByName('fio_cust').Value                := name_cust;
                     RxMemoryDataDog.Post;

             end;

             RxMemoryDataPodDog.Open;
             RxMemoryDataPodDog.Insert;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_doc').Value                           := 0;
             RxMemoryDataPodDog.FieldByName('RxMemDat_summa').Value                           := summa;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_sm').Value                            := id_smeta;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_razd').Value                          := id_r;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_st').Value                            := id_stat;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_kekv').Value                          := id_k;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_man').Value                           := id_man_prov;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_sch').Value                           := id_sch;
             RxMemoryDataPodDog.FieldByName('RxMemDatsumma_value').Value                      :=  0;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_value').Value                         :=  0;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameSch').Value                          := name_sch;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodState').Value              := kod_st;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value               := kod_rz;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value              := kod_sm;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value               := kod_kekv;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameStat').Value                         := name_stat;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameRazd').Value                         := name_r;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameSmeta').Value                        := name_smeta;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameKekv').Value                         := name_k;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_man').Value                           := id_man_prov;
             RxMemoryDataPodDog.FieldByName('RxMemDatFio').Value                              := name_fio;
             RxMemoryDataPodDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value                 := id_kor_sch;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value              := t_sch;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value           := t_kor_sch;
             RxMemoryDataPodDog.FieldByName('RxMemDatname_korespond').Value                   := name_kor_sch;
             if id_prov > 0
                then RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := id_prov
                else RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);

             RxMemoryDataPodDog.FieldByName('RxMemoryDataDogFieldNameCust').Value             := name_cust;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value           := kod_sm + '\'+ kod_rz + '\' + kod_st +'\'+ kod_kekv;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').Value                           := id_dog;
             RxMemoryDataPodDog.FieldByName('RxMemDatkod_dog').Value                          := kod_dog;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataPodDogNote_prov').Value              := Note_prov;
             RxMemoryDataPodDog.FieldByName('id').AsInteger                                   := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
             RxMemoryDataPodDog.Post;
             RxMemoryDataPodDog.Locate('id', id, []);
        end;
        RxMemoryDataSaveAll.First;
        summa_doc := 0;
        while not RxMemoryDataSaveAll.Eof do
        begin
            summa_doc := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
            RxMemoryDataSaveAll.next;
        end;
        RxMemoryDataSaveAll.Locate('id', itt+1, []);
end;
end;

procedure TfmBankOrder.ActionChangeProvExecute(Sender: TObject);
var
    id_kor_sch, id_man_prov, id_smeta, id_stat, id_r, id_k, id_sch : int64;
    name_kor_sch, kod_sm, kod_st, kod_rz, kod_kekv, name_fio, name_smeta, name_stat, name_r, name_k, name_sch, t_sch, t_kor_sch : string;
    summa, summa_doc, summa_valuta, summa_valuta_doc : double;
    date_dog, num_dog, name_cust, type_dog, reg_dog, tin, birthday, note_prov : string;
    id_dog, kod_dog, id_prov : int64;
    cr_by_dt, itt, id : integer;
    fff : TDateTime;
begin
flag_show_dog := false;
decimalseparator := ',';
if (flag <> ShowOrder) and (RxMemoryDataSaveAll.FieldByName('Vstrech').AsInteger <> 1)
then
begin
    if (not RxMemoryDataPodDog.IsEmpty) {and (not RxMemoryDataSaveAll.IsEmpty)} then
    begin
     begin
      ///try ffio   := RxMemoryDataDog.FieldByName('fio_stud').AsString                       except ffio   := ''; end;
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_sm').Value <> null
        then id_smeta := RxMemoryDataPodDog.FieldByName('RxMemDatid_sm').Value
        else id_smeta := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_st').Value <> null
        then id_stat  := RxMemoryDataPodDog.FieldByName('RxMemDatid_st').Value
        else id_stat  := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_razd').Value <> null
        then id_r     := RxMemoryDataPodDog.FieldByName('RxMemDatid_razd').Value
        else id_r     := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_kekv').Value <> null
        then id_k     := RxMemoryDataPodDog.FieldByName('RxMemDatid_kekv').Value
        else id_k     := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value <> null
        then id_kor_sch   := RxMemoryDataPodDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value
        else id_kor_sch   := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_man').Value <> null
        then id_man_prov   := RxMemoryDataPodDog.FieldByName('RxMemDatid_man').Value
        else id_man_prov   := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatFio').Value <> null
        then name_fio := RxMemoryDataPodDog.FieldByName('RxMemDatFio').Value
        else name_fio := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDatNameSmeta').Value <> null
        then name_smeta := RxMemoryDataPodDog.FieldByName('RxMemDatNameSmeta').Value
        else name_smeta := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDatNameStat').Value <> null
        then name_stat  := RxMemoryDataPodDog.FieldByName('RxMemDatNameStat').Value
        else name_stat  := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDatNameRazd').Value <> null
        then name_r     := RxMemoryDataPodDog.FieldByName('RxMemDatNameRazd').Value
        else name_r     := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDatNameKekv').Value <> null
        then name_k     := RxMemoryDataPodDog.FieldByName('RxMemDatNameKekv').Value
        else name_k     := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDatname_korespond').Value <> null
        then name_kor_sch   := RxMemoryDataPodDog.FieldByName('RxMemDatname_korespond').Value
        else name_kor_sch   := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDat_summa').Value <> null
        then summa      := RxMemoryDataPodDog.FieldByName('RxMemDat_summa').Value
        else summa      := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_sch').Value <> null
        then id_sch := RxMemoryDataPodDog.FieldByName('RxMemDatid_sch').Value
        else id_sch := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatNameSch').Value <> null
        then name_sch := RxMemoryDataPodDog.FieldByName('RxMemDatNameSch').Value
        else name_sch := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value <> null
        then t_sch := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value
        else t_sch := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value <> null
        then t_kor_sch := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value
        else t_kor_sch := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value <> null
        then kod_sm := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value
        else kod_sm := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodState').Value <> null
        then kod_st := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodState').Value
        else kod_st := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value <> null
        then kod_rz := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value
        else kod_rz := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value <> null
        then kod_kekv := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value
        else kod_kekv := '';
      if RxMemoryDataDog.FieldByName('RxMemoryDataDogFielddateDog').Value <> null
        then date_dog := RxMemoryDataDog.FieldByName('RxMemoryDataDogFielddateDog').Value
        else date_dog := '';
      if RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value <> null
        then num_dog := RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value
        else num_dog := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataDogFieldNameCust').Value <> null
        then name_cust := RxMemoryDataPodDog.FieldByName('RxMemoryDataDogFieldNameCust').Value
        else name_cust := '';
      if RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value <> null
        then type_dog := RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value
        else type_dog := '';
      if RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value <> null
        then reg_dog := RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value
        else reg_dog := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').Value <> null
        then id_dog := RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').Value
        else id_dog := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatkod_dog').Value <> null
        then kod_dog := RxMemoryDataPodDog.FieldByName('RxMemDatkod_dog').Value
        else kod_dog := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataPodDogNote_prov').Value <> null
        then note_prov := RxMemoryDataPodDog.FieldByName('RxMemoryDataPodDogNote_prov').Value
        else note_prov := '';
     if RxMemoryDataPodDog.FieldByName('id').Value <> null
        then id := RxMemoryDataPodDog.FieldByName('id').Value
        else id := 0;

      id_prov := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
      RxMemoryDataPodDog.Locate('id', id, []);
      RxMemoryDataSaveAll.Locate('id', id, []);

      cr_by_dt   := prih;
        buh_prov := 1;
        if Show_Provodka(self, myform.id_ras, Class_Database, myclass.Class_Transaction_R, ChangeProv, id_kor_sch, id_man_prov, id_sch, id_smeta, id_stat, id_r, id_k, summa, name_fio, name_sch, kod_sm, kod_st, kod_rz, kod_kekv, name_smeta, name_stat, name_r, name_k, name_kor_sch, t_sch, t_kor_sch, date_dog, num_dog, name_cust, type_dog, reg_dog, id_dog, kod_dog, tin, birthday, id_prov, cr_by_dt, note_prov, id_valuta, name_valuta, summa_valuta) then
        begin
             cr_dt := cr_by_dt;
             RxMemoryDataSaveAll.Open;
             RxMemoryDataSaveAll.Edit;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value                           := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                           := summa;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                            := id_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                          := id_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                            := id_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                          := id_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                           := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                           := id_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value                      :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                         :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                          := name_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value              := kod_st;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value               := kod_rz;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value              := kod_sm;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value               := kod_kekv;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                         := name_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                         := name_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                        := name_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                         := name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                           := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value                              := name_fio;
             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value                 := id_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value              := t_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value           := t_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                   := name_kor_sch;
             if id_prov > 0
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := id_prov
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value         := name_cust;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value           := kod_sm + '\'+ kod_rz + '\' + kod_st +'\'+ kod_kekv;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                           := id_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                          := kod_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value              := tin;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value        := Note_prov;
             if birthday = ''
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := null
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := birthday;
             RxMemoryDataSaveAll.Post;

             RxMemoryDataPodDog.Open;
             RxMemoryDataPodDog.Edit;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_doc').Value                           := 0;
             RxMemoryDataPodDog.FieldByName('RxMemDat_summa').Value                           := summa;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_sm').Value                            := id_smeta;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_razd').Value                          := id_r;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_st').Value                            := id_stat;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_kekv').Value                          := id_k;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_man').Value                           := id_man_prov;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_sch').Value                           := id_sch;
             RxMemoryDataPodDog.FieldByName('RxMemDatsumma_value').Value                      :=  0;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_value').Value                         :=  0;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameSch').Value                          := name_sch;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodState').Value              := kod_st;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value               := kod_rz;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value              := kod_sm;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value               := kod_kekv;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameStat').Value                         := name_stat;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameRazd').Value                         := name_r;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameSmeta').Value                        := name_smeta;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameKekv').Value                         := name_k;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_man').Value                           := id_man_prov;
             RxMemoryDataPodDog.FieldByName('RxMemDatFio').Value                              := name_fio;
             RxMemoryDataPodDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value                 := id_kor_sch;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value              := t_sch;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value           := t_kor_sch;
             RxMemoryDataPodDog.FieldByName('RxMemDatname_korespond').Value                   := name_kor_sch;
             if id_prov > 0
                then RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := id_prov
                else RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);

             RxMemoryDataPodDog.FieldByName('RxMemoryDataDogFieldNameCust').Value         := name_cust;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value           := kod_sm + '\'+ kod_rz + '\' + kod_st +'\'+ kod_kekv;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').Value                           := id_dog;
             RxMemoryDataPodDog.FieldByName('RxMemDatkod_dog').Value                          := kod_dog;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataPodDogNote_prov').Value        := Note_prov;
             RxMemoryDataPodDog.Post;
        end;
            RxMemoryDataSaveAll.First;
            summa_doc := 0;
            while not RxMemoryDataSaveAll.Eof do
            begin
                summa_doc := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                RxMemoryDataSaveAll.next;
            end;
            RxMemoryDataSaveAll.Locate('id', itt, []);
           end;
      end;
 end;

end;

procedure TfmBankOrder.ActionDeleteProvExecute(Sender: TObject);
var
    summa_doc : double;
    id_dog, id_sme, id_sta, id_kek, id_ra : int64;
    flag_del : boolean;
    i, j, id : integer;
begin
flag_show_dog := false;
    if flag <> ShowOrder then
    begin
        if not RxMemoryDataPodDog.IsEmpty then
        begin
          if MessageBox(Handle, PChar(Un_R_file_Alex.J4_MESSAGE_DEL + Un_R_file_Alex.BANK_PROV + RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').AsString + Un_R_file_Alex.BANK_WITH_SUMMA + RxMemoryDataPodDog.FieldByName('RxMemDat_summa').AsString + ' ?'), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
          begin
            if RxMemoryDataPodDog.FieldByName('id').Value <> null
            then id := RxMemoryDataPodDog.FieldByName('id').Value
             else id := 0;
            j := RxMemoryDataPodDog.FieldByName('id').AsInteger;
            cxGridPodDogDBTableView1.Controller.GoToPrev(false);
            i := RxMemoryDataPodDog.FieldByName('id').AsInteger;
            RxMemoryDataPodDog.Locate('id', j, [] );
            id_dog := RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').AsVariant;
            RxMemoryDataPodDog.Delete;

            flag_del := false;
            RxMemoryDataPodDog.First;
            while not RxMemoryDataPodDog.Eof do
            begin
                if RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').AsVariant = id_dog then flag_del := true;
                RxMemoryDataPodDog.Next;
            end;
            if not flag_del then
            begin
                RxMemoryDataDog.First;
                while not RxMemoryDataDog.Eof do
                begin
                    if RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = id_dog then
                        RxMemoryDataDog.Delete
                    else
                       RxMemoryDataDog.Next;
                end;
            end;
            RxMemoryDataPodDog.Locate('id', j, [] );

           // RxMemoryDataSaveAll.Locate('id', id, [] );

            j := RxMemoryDataPodDog.FieldByName('id').AsInteger;
            cxGridSaveAllDBTableView1.Controller.GoToPrev(false);
            i := RxMemoryDataPodDog.FieldByName('id').AsInteger;
            RxMemoryDataSaveAll.Locate('id', id, [] );
            id_dog := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant;
            RxMemoryDataSaveAll.Delete;

            flag_del := false;
            RxMemoryDataSaveAll.First;
            while not RxMemoryDataSaveAll.Eof do
            begin
                if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant = id_dog then flag_del := true;
                RxMemoryDataSaveAll.Next;
            end;
            if not flag_del then
            begin
                RxMemoryDataDog.First;
                while not RxMemoryDataDog.Eof do
                begin
                    if RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = id_dog then
                        RxMemoryDataDog.Delete
                    else
                       RxMemoryDataDog.Next;
                end;
            end;
            RxMemoryDataSaveAll.Locate('id', i, [] );
          end;
       end;
    end;

end;

procedure TfmBankOrder.ActionClonExecute(Sender: TObject);
var
    id_kor_sch, id_man_prov, id_smeta, id_stat, id_r, id_k, id_sch : int64;
    name_kor_sch, kod_sm, kod_st, kod_rz, kod_kekv, name_fio, name_smeta, name_stat, name_r, name_k, name_sch, t_sch, t_kor_sch : string;
    summa, summa_doc, summa_valuta, summa_valuta_doc : double;
    date_dog, num_dog, name_cust, type_dog, reg_dog, tin, birthday, note_prov : string;
    id_dog, kod_dog, id_prov : int64;
    cr_by_dt, itt : integer;
    fff : TDateTime;
begin
flag_show_dog := false;
decimalseparator := ',';
if (flag <> ShowOrder) and (RxMemoryDataSaveAll.FieldByName('Vstrech').AsInteger <> 1) then
begin
    //if PageControl1.ActivePage = TabSheet2 then
    //begin
    if not RxMemoryDataSaveAll.IsEmpty then
    begin
      itt := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value <> null
        then id_smeta := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value
        else id_smeta := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value <> null
        then id_stat  := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value
        else id_stat  := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value <> null
        then id_r     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value
        else id_r     := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value <> null
        then id_k     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value
        else id_k     := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value <> null
        then id_kor_sch   := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value
        else id_kor_sch   := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <> null
        then id_man_prov   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value
        else id_man_prov   := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value <> null
        then name_fio := RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value
        else name_fio := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value <> null
        then name_smeta := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value
        else name_smeta := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value <> null
        then name_stat  := RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value
        else name_stat  := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value <> null
        then name_r     := RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value
        else name_r     := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value <> null
        then name_k     := RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value
        else name_k     := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value <> null
        then name_kor_sch   := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value
        else name_kor_sch   := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value <> null
        then summa      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value
        else summa      := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value <> null
        then id_sch := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value
        else id_sch := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value <> null
        then name_sch := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value
        else name_sch := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value <> null
        then t_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value
        else t_sch := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value <> null
        then t_kor_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value
        else t_kor_sch := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value <> null
        then kod_sm := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value
        else kod_sm := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value <> null
        then kod_st := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value
        else kod_st := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value <> null
        then kod_rz := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value
        else kod_rz := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value <> null
        then kod_kekv := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value
        else kod_kekv := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value <> null
        then date_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value
        else date_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value <> null
        then num_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value
        else num_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value <> null
        then name_cust := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value
        else name_cust := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value <> null
        then type_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value
        else type_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value <> null
        then reg_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value
        else reg_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value <> null
        then id_dog := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value
        else id_dog := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <> null
        then kod_dog := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value
        else kod_dog := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value <> null
        then tin := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value
        else tin := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value <> null
        then note_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value
        else note_prov := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value <> null
        then birthday := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value
        else birthday := '';
      id_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
      cr_by_dt   := prih;
        buh_prov := 1;
        if Show_Provodka(self, myform.id_ras, Class_Database, myclass.Class_Transaction_R, ClonProv, id_kor_sch, id_man_prov, id_sch, id_smeta, id_stat, id_r, id_k, summa, name_fio, name_sch, kod_sm, kod_st, kod_rz, kod_kekv, name_smeta, name_stat, name_r, name_k, name_kor_sch, t_sch, t_kor_sch, date_dog, num_dog, name_cust, type_dog, reg_dog, id_dog, kod_dog, tin, birthday, id_prov, cr_by_dt, note_prov, id_valuta, name_valuta, summa_valuta) then
        begin
             cr_dt := cr_by_dt;
             RxMemoryDataSaveAll.Open;
             RxMemoryDataSaveAll.Insert;
             RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := summa;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := id_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := id_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := id_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := id_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := kod_st;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := kod_rz;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value     := kod_sm;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value      := kod_kekv;
             RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value                     := name_fio;
             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := id_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value     := t_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value  := t_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := name_kor_sch;
             if id_prov > 0
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := id_prov
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                := name_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                := name_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value               := name_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                := name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := kod_sm + '\'+ kod_rz + '\' + kod_st +'\'+ kod_kekv;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value  := StrToDate(date_dog);
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := num_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := name_cust;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := type_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := reg_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := id_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := kod_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value      := tin;
             if birthday = ''
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := null
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := birthday;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value      := Note_prov;
             RxMemoryDataSaveAll.FieldByName('id').AsInteger                                 := itt+1;
             RxMemoryDataSaveAll.Post;
        end;
            RxMemoryDataSaveAll.First;
            summa_doc := 0;
            while not RxMemoryDataSaveAll.Eof do
            begin
                summa_doc := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                RxMemoryDataSaveAll.next;
            end;
            RxMemoryDataSaveAll.Locate('id', itt, []);
        end;
    end;
end;

procedure TfmBankOrder.ActionClonProvExecute(Sender: TObject);
var
    id_kor_sch, id_man_prov, id_smeta, id_stat, id_r, id_k, id_sch : int64;
    name_kor_sch, kod_sm, kod_st, kod_rz, kod_kekv, name_fio, name_smeta, name_stat, name_r, name_k, name_sch, t_sch, t_kor_sch : string;
    summa, summa_doc, summa_valuta, summa_valuta_doc : double;
    date_dog, num_dog, name_cust, type_dog, reg_dog, tin, birthday, note_prov : string;
    id_dog, kod_dog, id_prov : int64;
    cr_by_dt, itt, id : integer;
    fff : TDateTime;
begin
flag_show_dog := false;
decimalseparator := ',';
if (flag <> ShowOrder) and (RxMemoryDataSaveAll.FieldByName('Vstrech').AsInteger <> 1)
then
begin
    if (not RxMemoryDataPodDog.IsEmpty) {and (not RxMemoryDataSaveAll.IsEmpty)} then
    begin
     begin
      ///try ffio   := RxMemoryDataDog.FieldByName('fio_stud').AsString                       except ffio   := ''; end;
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_sm').Value <> null
        then id_smeta := RxMemoryDataPodDog.FieldByName('RxMemDatid_sm').Value
        else id_smeta := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_st').Value <> null
        then id_stat  := RxMemoryDataPodDog.FieldByName('RxMemDatid_st').Value
        else id_stat  := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_razd').Value <> null
        then id_r     := RxMemoryDataPodDog.FieldByName('RxMemDatid_razd').Value
        else id_r     := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_kekv').Value <> null
        then id_k     := RxMemoryDataPodDog.FieldByName('RxMemDatid_kekv').Value
        else id_k     := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value <> null
        then id_kor_sch   := RxMemoryDataPodDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value
        else id_kor_sch   := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_man').Value <> null
        then id_man_prov   := RxMemoryDataPodDog.FieldByName('RxMemDatid_man').Value
        else id_man_prov   := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatFio').Value <> null
        then name_fio := RxMemoryDataPodDog.FieldByName('RxMemDatFio').Value
        else name_fio := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDatNameSmeta').Value <> null
        then name_smeta := RxMemoryDataPodDog.FieldByName('RxMemDatNameSmeta').Value
        else name_smeta := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDatNameStat').Value <> null
        then name_stat  := RxMemoryDataPodDog.FieldByName('RxMemDatNameStat').Value
        else name_stat  := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDatNameRazd').Value <> null
        then name_r     := RxMemoryDataPodDog.FieldByName('RxMemDatNameRazd').Value
        else name_r     := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDatNameKekv').Value <> null
        then name_k     := RxMemoryDataPodDog.FieldByName('RxMemDatNameKekv').Value
        else name_k     := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDatname_korespond').Value <> null
        then name_kor_sch   := RxMemoryDataPodDog.FieldByName('RxMemDatname_korespond').Value
        else name_kor_sch   := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDat_summa').Value <> null
        then summa      := RxMemoryDataPodDog.FieldByName('RxMemDat_summa').Value
        else summa      := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_sch').Value <> null
        then id_sch := RxMemoryDataPodDog.FieldByName('RxMemDatid_sch').Value
        else id_sch := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatNameSch').Value <> null
        then name_sch := RxMemoryDataPodDog.FieldByName('RxMemDatNameSch').Value
        else name_sch := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value <> null
        then t_sch := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value
        else t_sch := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value <> null
        then t_kor_sch := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value
        else t_kor_sch := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value <> null
        then kod_sm := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value
        else kod_sm := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodState').Value <> null
        then kod_st := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodState').Value
        else kod_st := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value <> null
        then kod_rz := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value
        else kod_rz := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value <> null
        then kod_kekv := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value
        else kod_kekv := '';
      if RxMemoryDataDog.FieldByName('RxMemoryDataDogFielddateDog').Value <> null
        then date_dog := RxMemoryDataDog.FieldByName('RxMemoryDataDogFielddateDog').Value
        else date_dog := '';
      if RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value <> null
        then num_dog := RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value
        else num_dog := '';
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataDogFieldNameCust').Value <> null
        then name_cust := RxMemoryDataPodDog.FieldByName('RxMemoryDataDogFieldNameCust').Value
        else name_cust := '';
      if RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value <> null
        then type_dog := RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value
        else type_dog := '';
      if RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value <> null
        then reg_dog := RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value
        else reg_dog := '';
      if RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').Value <> null
        then id_dog := RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').Value
        else id_dog := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemDatkod_dog').Value <> null
        then kod_dog := RxMemoryDataPodDog.FieldByName('RxMemDatkod_dog').Value
        else kod_dog := 0;
      if RxMemoryDataPodDog.FieldByName('RxMemoryDataPodDogNote_prov').Value <> null
        then note_prov := RxMemoryDataPodDog.FieldByName('RxMemoryDataPodDogNote_prov').Value
        else note_prov := '';
     if RxMemoryDataPodDog.FieldByName('id').Value <> null
        then id := RxMemoryDataPodDog.FieldByName('id').Value
        else id := 0;

      id_prov := RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
      RxMemoryDataPodDog.Locate('id', id, []);
      RxMemoryDataSaveAll.Locate('id', id, []);

      cr_by_dt   := prih;
        buh_prov := 1;
        if Show_Provodka(self, myform.id_ras, Class_Database, myclass.Class_Transaction_R, ClonProv, id_kor_sch, id_man_prov, id_sch, id_smeta, id_stat, id_r, id_k, summa, name_fio, name_sch, kod_sm, kod_st, kod_rz, kod_kekv, name_smeta, name_stat, name_r, name_k, name_kor_sch, t_sch, t_kor_sch, date_dog, num_dog, name_cust, type_dog, reg_dog, id_dog, kod_dog, tin, birthday, id_prov, cr_by_dt, note_prov, id_valuta, name_valuta,summa_valuta) then
        begin
             cr_dt := cr_by_dt;
             RxMemoryDataSaveAll.Open;
             RxMemoryDataSaveAll.Insert;
             RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := summa;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := id_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := id_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := id_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := id_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := kod_st;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := kod_rz;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value     := kod_sm;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value      := kod_kekv;
             RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value                     := name_fio;
             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := id_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value     := t_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value  := t_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := name_kor_sch;
             if id_prov > 0
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := id_prov
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                := name_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                := name_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value               := name_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                := name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := kod_sm + '\'+ kod_rz + '\' + kod_st +'\'+ kod_kekv;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value  := StrToDate(date_dog);
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := num_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := name_cust;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := type_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := reg_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := id_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := kod_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value      := tin;
             if birthday = ''
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := null
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value := birthday;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value      := Note_prov;
             RxMemoryDataSaveAll.FieldByName('id').AsInteger                                 := itt+1;
             RxMemoryDataSaveAll.Post;

             RxMemoryDataSaveAll.Locate('id', id, []);

             RxMemoryDataPodDog.Open;
             RxMemoryDataPodDog.Insert;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_doc').Value                           := 0;
             RxMemoryDataPodDog.FieldByName('RxMemDat_summa').Value                           := summa;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_sm').Value                            := id_smeta;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_razd').Value                          := id_r;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_st').Value                            := id_stat;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_kekv').Value                          := id_k;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_man').Value                           := id_man_prov;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_sch').Value                           := id_sch;
             RxMemoryDataPodDog.FieldByName('RxMemDatsumma_value').Value                      :=  0;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_value').Value                         :=  0;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameSch').Value                          := name_sch;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodState').Value              := kod_st;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value               := kod_rz;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value              := kod_sm;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value               := kod_kekv;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameStat').Value                         := name_stat;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameRazd').Value                         := name_r;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameSmeta').Value                        := name_smeta;
             RxMemoryDataPodDog.FieldByName('RxMemDatNameKekv').Value                         := name_k;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_man').Value                           := id_man_prov;
             RxMemoryDataPodDog.FieldByName('RxMemDatFio').Value                              := name_fio;
             RxMemoryDataPodDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value                 := id_kor_sch;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value              := t_sch;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value           := t_kor_sch;
             RxMemoryDataPodDog.FieldByName('RxMemDatname_korespond').Value                   := name_kor_sch;
             if id_prov > 0
                then RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := id_prov
                else RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);

             RxMemoryDataPodDog.FieldByName('RxMemoryDataDogFieldNameCust').Value         := name_cust;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value           := kod_sm + '\'+ kod_rz + '\' + kod_st +'\'+ kod_kekv;
             RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').Value                           := id_dog;
             RxMemoryDataPodDog.FieldByName('RxMemDatkod_dog').Value                          := kod_dog;
             RxMemoryDataPodDog.FieldByName('RxMemoryDataPodDogNote_prov').Value        := Note_prov;
             RxMemoryDataPodDog.FieldByName('id').AsInteger                                 := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
             RxMemoryDataPodDog.Post;
             RxMemoryDataPodDog.Locate('id', id, []);
        end;
            RxMemoryDataSaveAll.First;
            summa_doc := 0;
            while not RxMemoryDataSaveAll.Eof do
            begin
                summa_doc := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                RxMemoryDataSaveAll.next;
            end;
            RxMemoryDataSaveAll.Locate('id', itt, []);
           end;
      end;
 end;

end;

procedure TfmBankOrder.ActionShowExecute(Sender: TObject);
var
    id_kor_sch, id_man_prov, id_smeta, id_stat, id_r, id_k, id_sch : int64;
    name_kor_sch, kod_sm, kod_st, kod_rz, kod_kekv, name_fio, name_smeta, name_stat, name_r, name_k, name_sch, t_sch, t_kor_sch : string;
    summa, summa_doc, summa_valuta, summa_valuta_doc : double;
    date_dog, num_dog, name_cust, type_dog, reg_dog, tin, birthday, note_prov : string;
    id_dog, kod_dog, id_prov : int64;
    cr_by_dt, itt : integer;
    fff : TDateTime;
begin
   flag_show_dog := false;
   decimalseparator := ',';
    if not RxMemoryDataSaveAll.IsEmpty then
    begin
      itt := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value <> null
        then id_smeta := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value
        else id_smeta := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value <> null
        then id_stat  := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value
        else id_stat  := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value <> null
        then id_r     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value
        else id_r     := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value <> null
        then id_k     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value
        else id_k     := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value <> null
        then id_kor_sch   := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value
        else id_kor_sch   := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <> null
        then id_man_prov   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value
        else id_man_prov   := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value <> null
        then name_fio := RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value
        else name_fio := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value <> null
        then name_smeta := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value
        else name_smeta := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value <> null
        then name_stat  := RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value
        else name_stat  := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value <> null
        then name_r     := RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value
        else name_r     := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value <> null
        then name_k     := RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value
        else name_k     := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value <> null
        then name_kor_sch   := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value
        else name_kor_sch   := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value <> null
        then summa      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value
        else summa      := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value <> null
        then id_sch := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value
        else id_sch := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value <> null
        then name_sch := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value
        else name_sch := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value <> null
        then t_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value
        else t_sch := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value <> null
        then t_kor_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value
        else t_kor_sch := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value <> null
        then kod_sm := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value
        else kod_sm := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value <> null
        then kod_st := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value
        else kod_st := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value <> null
        then kod_rz := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value
        else kod_rz := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value <> null
        then kod_kekv := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value
        else kod_kekv := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value <> null
        then date_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value
        else date_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value <> null
        then num_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value
        else num_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value <> null
        then name_cust := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value
        else name_cust := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value <> null
        then type_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value
        else type_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value <> null
        then reg_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value
        else reg_dog := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value <> null
        then id_dog := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value
        else id_dog := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <> null
        then kod_dog := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value
        else kod_dog := 0;
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value <> null
        then tin := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTin').Value
        else tin := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value <> null
        then note_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value
        else note_prov := '';
      if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value <> null
        then birthday := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldBirthDay').Value
        else birthday := '';
      id_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
      cr_by_dt   := prih;
        buh_prov := 1;
        if Show_Provodka(self, myform.id_ras, Class_Database, myclass.Class_Transaction_R, ShowProv, id_kor_sch, id_man_prov, id_sch, id_smeta, id_stat, id_r, id_k, summa, name_fio, name_sch, kod_sm, kod_st, kod_rz, kod_kekv, name_smeta, name_stat, name_r, name_k, name_kor_sch, t_sch, t_kor_sch, date_dog, num_dog, name_cust, type_dog, reg_dog, id_dog, kod_dog, tin, birthday, id_prov, cr_by_dt, note_prov, id_valuta, name_valuta,summa_valuta) then
        begin

        end;
    end;

end;


procedure TfmBankOrder.ActionMoveVipExecute(Sender: TObject);
var
    ResDate : variant;
    day_move : tdate;
    id_dt_day_move : int64;
    date_beg_m : string;
    date_end_m : tdate;
    month_m, year_m :integer;
begin
    if Show_Days(Self, Self, ResDate) then
    begin
       flag_move_date :=1;
       id_dt_day_move := ResDate[0];
       day_move := ResDate[1];
       month_m := monthof(myform.date_vip);
       year_m  := yearof(myform.date_vip);
       if month_m < 9
            then date_beg_m := '01.'+'0'+ IntToStr(month_m) + '.'+ IntToStr(year_m)
            else date_beg_m := '01.'+ IntToStr(month_m) + '.' + IntToStr(year_m);
       date_end_m := IncMonth(StrToDate(date_beg_m),1);

       if(myform.date_doc>day_move) then
       begin
           showmessage(Un_R_file_Alex.BANK_NO_MOVE_DAY);
           exit;
       end;
       if((date_end_m<=day_move)or(day_move<strtodate(date_beg_m))) then
       begin
           showmessage(Un_R_file_Alex.BANK_MOVE_PERIOD_NO);
           exit;
       end;
       DateTimePicker2.DateTime := day_move;
       date_act := day_move;
    end;
end;

procedure TfmBankOrder.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;
    ShowPProvPodDog;
end;

function TfmBankOrder.SelectShablonNich(f : boolean; AOwner: TComponent; DBHANDLE : TpFIBDatabase; id_doc: Int64; date_doc: TDate; num_doc, sum_doc, note: string; id_user : Integer; name_cust, mfo_cust, name_bank, ras_cust: string; prih : Integer): boolean;
var
    flag_na_exists_dog, flag_na_exists_sm : boolean;
    id_ss : int64;
    SmetID, RazdID, StatID, KekvID : int64;
    y, o : TSpravParams;
    ffio, n_cust, n_do, reg_n, d_d : string;
    AParameter : TcnSimpleParamsEx;
    ResOpl     : Variant;
    j, i: integer;
    fltForm1 : TfmBankNich;
begin
  fltForm1:= TfmBankNich.Create(AOwner, DBHANDLE, id_doc, date_doc, num_doc, sum_doc, note, id_user, name_cust, mfo_cust, name_bank, ras_cust, prih);
  fltForm1.ShowModal;
  if fltForm1.ModalResult <> mrOk then
    begin
      exit;
    end
  else begin
  for j:=0 to fltForm1.cxParamGridTableView1.DataController.RecordCount - 1 do begin
    fltForm1.cxParamGridTableView1.DataController.FocusedRecordIndex:=j;
    for i:=0 to fltForm1.cxResultGridDBTableView1.DataController.RecordCount - 1 do
    begin
      id_ss := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
      RxMemoryDataDog.First;
      RxMemoryDataDog.Open;
      RxMemoryDataDog.Insert;
      RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value      := fltForm1.id_dog;
      RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value     := fltForm1.id_dog;
      RxMemoryDataDog.FieldByName('RxMemDat_summa').Value:=fltForm1.cxResultGridDBTableView1DBColumn4.DataBinding.DataController.Values[i, 3];
      RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value:=fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 5];
      RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value:=fltForm1.cxResultGridDBTableView1DBColumn2.DataBinding.DataController.Values[i, 1];
      RxMemoryDataDog.FieldByName('RxMemDatid_st').Value:=fltForm1.cxResultGridDBTableView1DBColumn7.DataBinding.DataController.Values[i, 6];
      RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value:=fltForm1.cxResultGridDBTableView1DBColumn11.DataBinding.DataController.Values[i, 10];
      RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value:=fltForm1.cxResultGridDBTableView1DBColumn1.DataBinding.DataController.Values[i, 0];
      RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value:=fltForm1.cxResultGridDBTableView1DBColumn9.DataBinding.DataController.Values[i, 8];
      RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value:=fltForm1.cxResultGridDBTableView1DBColumn3.DataBinding.DataController.Values[i, 2];
      RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value:=fltForm1.cxResultGridDBTableView1DBColumn1.DataBinding.DataController.Values[i, 0] +'\'+ fltForm1.cxResultGridDBTableView1DBColumn9.DataBinding.DataController.Values[i, 8] +'\'+ fltForm1.cxResultGridDBTableView1DBColumn3.DataBinding.DataController.Values[i, 2] +'\'+fltForm1.cxResultGridDBTableView1DBColumn12.DataBinding.DataController.Values[i, 11];
      RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value:=fltForm1.cxResultGridDBTableView1DBColumn12.DataBinding.DataController.Values[i, 11];
      RxMemoryDataDog.FieldByName('RxMemDatid_man').Value      := 0;
      RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value      := id_osnov_sch;
      RxMemoryDataDog.FieldByName('RxMemDatsumma_value').Value := 0;
      RxMemoryDataDog.FieldByName('RxMemDatid_value').Value    := 0;
      RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value     := name_osnov_sch;
      RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := title_sch;
      RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value    := fltForm1.cxResultGridDBTableView1DBColumn8.DataBinding.DataController.Values[i, 7];
      RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value    := fltForm1.cxResultGridDBTableView1DBColumn10.DataBinding.DataController.Values[i, 9];
      RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value   := fltForm1.cxResultGridDBTableView1DBColumn5.DataBinding.DataController.Values[i, 4];
      RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value    := fltForm1.cxResultGridDBTableView1DBColumn13.DataBinding.DataController.Values[i, 12];
      RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := fltForm1.cxResultGridDBTableView1DBColumn16.DataBinding.DataController.Values[i, 15];
      RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := fltForm1.cxResultGridDBTableView1DBColumn14.DataBinding.DataController.Values[i, 13];
      RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value       := fltForm1.cxResultGridDBTableView1DBColumn15.DataBinding.DataController.Values[i, 14];
      RxMemoryDataDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := id_ss;
      //RxMemoryDataDog.FieldByName('fio_stud').Value            := ffio;//res.name_customer;
      RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := fltForm1.name_cust;
      RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value  := StrToDate(fltForm1.d_dog);
      RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value  := null;
      RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value   := fltForm1.reg_dog;
      RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value   := fltForm1.n_dog;
      RxMemoryDataDog.FieldByName('fio_cust').Value                     := fltForm1.name_cust;

      RxMemoryDataDog.Post;



      RxMemoryDataSaveAll.First;
      RxMemoryDataSaveAll.Open;
      RxMemoryDataSaveAll.Insert;
      RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := fltForm1.cxResultGridDBTableView1DBColumn4.DataBinding.DataController.Values[i, 3];
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 5];
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := fltForm1.cxResultGridDBTableView1DBColumn2.DataBinding.DataController.Values[i, 1];
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := fltForm1.cxResultGridDBTableView1DBColumn7.DataBinding.DataController.Values[i, 6];
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := fltForm1.cxResultGridDBTableView1DBColumn11.DataBinding.DataController.Values[i, 10];
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := fltForm1.id_dog;
      RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := fltForm1.id_dog;
      //RxMemoryDataSaveAll.FieldByName('id_payer').Value            := ResOpl[0][5];
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value      := fltForm1.cxResultGridDBTableView1DBColumn1.DataBinding.DataController.Values[i, 0];
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value       := fltForm1.cxResultGridDBTableView1DBColumn9.DataBinding.DataController.Values[i, 8];
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value      := fltForm1.cxResultGridDBTableView1DBColumn3.DataBinding.DataController.Values[i, 2];
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value       := fltForm1.cxResultGridDBTableView1DBColumn12.DataBinding.DataController.Values[i, 11];
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value   := fltForm1.cxResultGridDBTableView1DBColumn1.DataBinding.DataController.Values[i, 0] +'\'+ fltForm1.cxResultGridDBTableView1DBColumn9.DataBinding.DataController.Values[i, 8] +'\'+ fltForm1.cxResultGridDBTableView1DBColumn3.DataBinding.DataController.Values[i, 2] +'\'+fltForm1.cxResultGridDBTableView1DBColumn12.DataBinding.DataController.Values[i, 11];
      RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                 := fltForm1.cxResultGridDBTableView1DBColumn8.DataBinding.DataController.Values[i, 7];
      RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                 := fltForm1.cxResultGridDBTableView1DBColumn10.DataBinding.DataController.Values[i, 9];
      RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                := fltForm1.cxResultGridDBTableView1DBColumn5.DataBinding.DataController.Values[i, 4];
      RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                 := fltForm1.cxResultGridDBTableView1DBColumn13.DataBinding.DataController.Values[i, 12];
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                   := 0;
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                   := id_osnov_sch;
      RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value              := 0;
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                 := 0;
      RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                  := name_osnov_sch;
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := id_ss;
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value      := title_sch;
      RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value         := fltForm1.cxResultGridDBTableView1DBColumn14.DataBinding.DataController.Values[i, 13];
      RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value           := fltForm1.cxResultGridDBTableView1DBColumn15.DataBinding.DataController.Values[i, 14];
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value   := fltForm1.cxResultGridDBTableView1DBColumn16.DataBinding.DataController.Values[i, 15];
      RxMemoryDataSaveAll.FieldByName('fio_stud').Value                         := fltForm1.name_cust;
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value :=fltForm1.name_cust;
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := StrToDate(fltForm1.d_dog);
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := null;//res.name_tip_dog;
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := fltForm1.reg_dog;
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := fltForm1.n_dog;
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNote_prov').Value:= fltForm1.cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[j, 0] + ' ' + fltForm1.cxParamGridTableView1ColumnYear.DataBinding.DataController.Values[j, 1] + 'p. Група бюджета:' + fltForm1.cxParamGridTableView1ColumnSmt.DataBinding.DataController.Values[j, 2] + ' Розділ:' + fltForm1.cxParamGridTableView1ColumnRazd.DataBinding.DataController.Values[j, 3] + ' Сума:' + VarToStr(fltForm1.cxParamGridTableView1ColumnSum.DataBinding.DataController.Values[j, 4]) + 'грн.';
      RxMemoryDataSaveAll.Post;
      //ShowMessage(VarToStr(fltForm1.id_dog));
    end;

  end;
    SelectShablonNich:=true;
    flag_show_dog := true;
  end;
end;

end.


