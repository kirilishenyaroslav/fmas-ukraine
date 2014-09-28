unit mainAvanceOtchet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, ToolWin, ComCtrls, cxContainer,
  cxLabel, ImgList, ActnList, Menus, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxCheckBox, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, MainClassAvance, cxLookAndFeelPainters,
  StdCtrls, cxButtons, Un_R_file_Alex, Ibase, cxSplitter, FIBQuery,
  pFIBQuery, pFIBStoredProc, kernel, Placemnt, dxStatusBar, cxImage,
  cxCurrencyEdit, AvanceShablon, SelectFromVedomost, frxClass, frxDBSet,
  AvanceSelectTypeDoc;

type
  TfmMode = (Show, Edit, Sp, SpEdit);

  TfmAvanceOtchet = class(TForm)
    CoolBar1: TCoolBar;
    Panel1: TPanel;
    Panel2: TPanel;
    cxGridMain : TcxGrid;
    cxGridMainDBTableView1: TcxGridDBTableView;
    cxGridMainLevel1: TcxGridLevel;
    Panel3: TPanel;
    Splitter2: TSplitter;
    cxGridMainDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridMainDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridMainDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridMainDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridMainDBTableView1DBColumn5: TcxGridDBColumn;
    cxLabelFIO: TcxLabel;
    cxLabelKod: TcxLabel;
    cxLabelPol: TcxLabel;
    cxLabelDay: TcxLabel;
    cxLabelPaspart: TcxLabel;
    cxLabelNumber: TcxLabel;
    cxLabelWhy: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    ToolBar1: TToolBar;
    ActionList: TActionList;
    ImageList: TImageList;
    Popup: TPopupMenu;
    Panel4: TPanel;
    cxCheckBoxTo: TcxCheckBox;
    cxDateEnd: TcxDateEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    ActionFind: TAction;
    ActionCancel: TAction;
    ActionShow: TAction;
    cxComboBoxSystem: TcxComboBox;
    cxLabel9: TcxLabel;
    cxButtonFilter: TcxButton;
    DataSourceMain: TDataSource;
    cxDateBegin: TcxDateEdit;
    cxLabelPer: TcxLabel;
    cxCheckBoxFrom: TcxCheckBox;
    DataSourceRasp: TDataSource;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ActionAdd1: TMenuItem;
    ActionChange1: TMenuItem;
    ActionDelete1: TMenuItem;
    ActionCancel1: TMenuItem;
    DataSourceProvodka: TDataSource;
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
    cxGridRasp: TcxGrid;
    cxGridRaspDBTableView1: TcxGridDBTableView;
    cxGridRaspDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridRaspDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridRaspLevel1: TcxGridLevel;
    cxGridRaznoskka: TcxGrid;
    cxGridRaznoskkaDBTableView1: TcxGridDBTableView;
    cxGridRaznoskkaDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridRaznoskkaDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridRaznoskkaDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridRaznoskkaDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridRaznoskkaDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridRaznoskkaLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    cxGridRaspDBTableView1DBColumn3: TcxGridDBColumn;
    Class_StoredProc: TpFIBStoredProc;
    cxLabel5: TcxLabel;
    DataSetSelectSystem: TpFIBDataSet;
    DataSetNastroyka: TpFIBDataSet;
    DataSetNastroykaRAZSCHIFROVKA: TFIBSmallIntField;
    DataSetNastroykaJ4_SMETA: TFIBBCDField;
    DataSetNastroykaJ4_RAZDEL: TFIBBCDField;
    DataSetNastroykaJ4_STATE: TFIBBCDField;
    DataSetNastroykaJ4_KEKV: TFIBBCDField;
    DataSetMain: TpFIBDataSet;
    DataSetProvodka: TpFIBDataSet;
    DataSetRasp: TpFIBDataSet;
    Class_Transaction_Wr: TpFIBTransaction;
    TransactionRead: TpFIBTransaction;
    DatabaseMain: TpFIBDatabase;
    DataSetRaspSUMMA: TFIBBCDField;
    DataSetRaspNUM: TFIBIntegerField;
    DataSetRaspID_SP_RASP: TFIBBCDField;
    DataSetRaspNAME: TFIBStringField;
    DataSetProvodkaSUMMA: TFIBBCDField;
    DataSetProvodkaID_SM: TFIBBCDField;
    DataSetProvodkaID_RAZD: TFIBBCDField;
    DataSetProvodkaID_ST: TFIBBCDField;
    DataSetProvodkaID_KEKV: TFIBBCDField;
    DataSetProvodkaID_DOG: TFIBBCDField;
    DataSetProvodkaKOD_DOG: TFIBBCDField;
    DataSetProvodkaID_MAN: TFIBBCDField;
    DataSetProvodkaID_SCH: TFIBBCDField;
    DataSetProvodkaSUMMA_VALUE: TFIBBCDField;
    DataSetProvodkaID_VALUE: TFIBBCDField;
    DataSetProvodkaSMETA_KOD: TFIBIntegerField;
    DataSetProvodkaRAZD_NUM: TFIBIntegerField;
    DataSetProvodkaKEKV_KOD: TFIBIntegerField;
    DataSetProvodkaFIO_MAN: TFIBStringField;
    DataSetProvodkaSCH_NUMBER: TFIBStringField;
    DataSetProvodkaSTAT_KOD: TFIBIntegerField;
    DataSetProvodkaID_KASS_SH: TFIBBCDField;
    DataSetProvodkaSCH_KASS_NUMBER: TFIBStringField;
    DataSetProvodkaDEBET: TFIBStringField;
    DataSetProvodkaKREDIT: TFIBStringField;
    DataSetProvodkaALL_KOD: TFIBStringField;
    DataSetProvodkaID_ALL_PROV: TFIBBCDField;
    Bevel1: TBevel;
    AvanceMain_FormStorage: TFormStorage;
    dxStatusBar1: TdxStatusBar;
    cxGridMainDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridMainDBTableView1DBColumn7: TcxGridDBColumn;
    cxTextEdit1: TcxTextEdit;
    ActionShowDoc: TAction;
    ToolButton4: TToolButton;
    cxGridRaznoskkaDBTableView1DBColumn6: TcxGridDBColumn;
    DataSetProvodkaTITLE_SCH: TFIBStringField;
    DataSetProvodkaTITLE_KOR_SCH: TFIBStringField;
    DataSetProvodkaTIN: TFIBStringField;
    DataSetProvodkaBIRTHDAY: TFIBDateField;
    DataSetProvodkaTYPE_DOG: TFIBStringField;
    DataSetProvodkaREG_DOG: TFIBStringField;
    DataSetProvodkaMAIN: TFIBIntegerField;
    DataSetProvodkaTITLE_SMETA: TFIBStringField;
    DataSetProvodkaTITLE_RZ: TFIBStringField;
    DataSetProvodkaTITLE_STATE: TFIBStringField;
    DataSetProvodkaTITLE_KEKV: TFIBStringField;
    DataSetProvodkaNAME_CUST: TFIBStringField;
    DataSetProvodkaNUM_DOG: TFIBStringField;
    DataSetProvodkaDATE_DOG: TFIBDateField;
    DataSetProvodkaSUMMA_NEOSN: TFIBBCDField;
    DataSetSelect: TpFIBDataSet;
    ToolButton5: TToolButton;
    ActionClon: TAction;
    ToolButton6: TToolButton;
    ActionPrintFio: TAction;
    DataSetOborotMenDoc: TpFIBDataSet;
    FIBDateField1: TFIBDateField;
    FIBStringField2: TFIBStringField;
    FIBStringField3: TFIBStringField;
    FIBBCDField7: TFIBBCDField;
    FIBBCDField8: TFIBBCDField;
    DataSetOborotMenDocPK_ID: TFIBBCDField;
    DataSetOborotMen: TpFIBDataSet;
    DataSetOborotMenSUMMA_DB: TFIBBCDField;
    DataSetOborotMenSUMMA_KR: TFIBBCDField;
    DataSetOborotMenKOD_SCH: TFIBStringField;
    DataSetOborotMenDATE_DOC: TFIBDateField;
    DataSetOborotMenNUM_DOC: TFIBStringField;
    DataSetOborotMenNAME: TFIBStringField;
    DataSetOborotMenNUM_SCH_KOR: TFIBStringField;
    DataSetOborotMenSM_KOD: TFIBIntegerField;
    DataSetOborotMenRAZ_KOD: TFIBIntegerField;
    DataSetOborotMenST_KOD: TFIBIntegerField;
    DataSetOborotMenKEKV_KOD: TFIBIntegerField;
    DataSetOborotMenVH_DEB: TFIBBCDField;
    DataSetOborotMenVH_KR: TFIBBCDField;
    DataSetOborotMenVIH_DEB: TFIBBCDField;
    DataSetOborotMenVIH_KR: TFIBBCDField;
    DataSetOborotMenS_R_S_K: TFIBStringField;
    DataSetOborotMenSUM_DOC_DB: TFIBBCDField;
    DataSetOborotMenSUM_DOC_KR: TFIBBCDField;
    DataSetOborotMenPK_ID: TFIBBCDField;
    DataSetOstatkiMenVh: TpFIBDataSet;
    DataSetOstatkiMenVhKOD_SCH: TFIBStringField;
    DataSetOstatkiMenVhDATE_DOC: TFIBDateField;
    DataSetOstatkiMenVhNAME: TFIBStringField;
    DataSetOstatkiMenVhNUM_SCH_KOR: TFIBStringField;
    DataSetOstatkiMenVhSM_KOD: TFIBIntegerField;
    DataSetOstatkiMenVhRAZ_KOD: TFIBIntegerField;
    DataSetOstatkiMenVhST_KOD: TFIBIntegerField;
    DataSetOstatkiMenVhKEKV_KOD: TFIBIntegerField;
    DataSetOstatkiMenVhVH_SUM_DB: TFIBBCDField;
    DataSetOstatkiMenVhVH_SUM_KR: TFIBBCDField;
    DataSetOstatkiMenVhVIH_SUM_DB: TFIBBCDField;
    DataSetOstatkiMenVhVIH_SUM_KR: TFIBBCDField;
    DataSetOstatkiMenVhS_R_S_K: TFIBStringField;
    DataSetOstatkiMenVhVH: TFIBIntegerField;
    DataSetOstatkiMenVih: TpFIBDataSet;
    DataSetOstatkiMenVihKOD_SCH: TFIBStringField;
    DataSetOstatkiMenVihDATE_DOC: TFIBDateField;
    DataSetOstatkiMenVihNAME: TFIBStringField;
    DataSetOstatkiMenVihNUM_SCH_KOR: TFIBStringField;
    DataSetOstatkiMenVihSM_KOD: TFIBIntegerField;
    DataSetOstatkiMenVihRAZ_KOD: TFIBIntegerField;
    DataSetOstatkiMenVihST_KOD: TFIBIntegerField;
    DataSetOstatkiMenVihKEKV_KOD: TFIBIntegerField;
    DataSetOstatkiMenVihVH_SUM_DB: TFIBBCDField;
    DataSetOstatkiMenVihVH_SUM_KR: TFIBBCDField;
    DataSetOstatkiMenVihVIH_SUM_DB: TFIBBCDField;
    DataSetOstatkiMenVihVIH_SUM_KR: TFIBBCDField;
    DataSetOstatkiMenVihS_R_S_K: TFIBStringField;
    DataSetOstatkiMenVihVH: TFIBIntegerField;
    frxReport1: TfrxReport;
    frxDBDatasetDoc: TfrxDBDataset;
    frxDBDatasetProv: TfrxDBDataset;
    frxDBDatasetOstVh: TfrxDBDataset;
    frxDBDatasetOstVih: TfrxDBDataset;
    PopupMenuPrint: TPopupMenu;
    PrintByFIO: TMenuItem;
    PrintReestr: TMenuItem;
    ActionPrintReestr: TAction;
    ActionFormReestr: TAction;
    DataSetDates: TpFIBDataSet;
    DSetIni: TpFIBDataSet;
    cxGridMainDBTableView1DBColumn8: TcxGridDBColumn;
    procedure ActionExitExecute(Sender: TObject);
    procedure cxCheckBoxFromClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxCheckBoxToClick(Sender: TObject);
    procedure ActionFindExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure DataSetMainAfterScroll(DataSet: TDataSet);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure cxDateEndEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cxButtonFilterClick(Sender: TObject);
    procedure cxComboBoxSystemClick(Sender: TObject);
    procedure cxDateBeginEditing(Sender: TObject; var CanEdit: Boolean);
    procedure ActionShowExecute(Sender: TObject);
    procedure ActionShowDocExecute(Sender: TObject);
    procedure ActionClonExecute(Sender: TObject);
    procedure ActionPrintFioExecute(Sender: TObject);
    procedure ActionPrintReestrExecute(Sender: TObject);
  private
    myclass : TMainClassAvance;
    main_m : TfmMode;
    KOD_SYSTEM : STRING;
    flag_autoscroll : boolean;
    IndSystem : array of int64;

    fl : boolean;
  public
    date_beg,date_end, date_new_alg,birthday : Tdate;
    id_system : int64;
    date_open : Tdate;
    id_user   : integer;
    prihod, sel_all : smallint;
    show_debet, ras, show_shablon, id_oper, tn : integer;
    add_new_alg, show_neosn_prov, show_date_kom : Smallint;
    id_prov_vedom, id_sm, id_st, id_razd, id_kekv, id_man, id_osn_sch, id_kor_sch : int64;
    sum_vedomost : double;
    smeta_kod, st_kod, raz_kod, kekv_kod, title_sm, title_raz, title_st, title_kod, fio_man, tin, kod_sch, title_sch, sch_osn_num, sch_osn_title : string;
    constructor Create(AOwner: TComponent; mclass: TMainClassAvance; DB:{ TISC_DB_HANDLE}TpFIBDatabase; m : TfmMode); reintroduce; overload;
    destructor Destroy; override;
  end;

implementation
uses AddChangeAvance, PrihodRashodAvance, DateUtils, Accmgmt, Un_Progress_form, PrintReestr, Un_lo_file_Alex;
{$R *.dfm}

constructor TfmAvanceOtchet.Create(AOwner: TComponent;  mclass: TMainClassAvance; DB: {TISC_DB_HANDLE}TpFIBDatabase; m: TfmMode);
var
     item_index, i : Integer;
begin
    inherited Create (AOwner);
//        ShowMessage(AOwner.Name);
    fl := false;
    myclass := mclass;
    DatabaseMain := DB;
    main_m := m;

    //AvanceMain_FormStorage.RestoreFormPlacement;
//    DatabaseMain.DefaultTransaction := TransactionRead;
    TransactionRead := myclass.Class_Transaction_R;
    TransactionRead.DefaultDatabase := DatabaseMain;

    DataSetMain.Database                 := DatabaseMain;
    DataSetSelectSystem.Database         := DatabaseMain;
    DataSetNastroyka.Database            := DatabaseMain;
    DataSetProvodka.Database             := DatabaseMain;
    DataSetRasp.Database                 := DatabaseMain;
    Class_StoredProc.Database            := DatabaseMain;
    DataSetMain.Transaction              := TransactionRead;
    DataSetSelectSystem.Transaction      := TransactionRead;
    DataSetNastroyka.Transaction         := TransactionRead;
    DataSetProvodka.Transaction          := TransactionRead;
    DataSetRasp.Transaction              := TransactionRead;
    Class_Transaction_Wr.DefaultDatabase := DatabaseMain;
    Class_StoredProc.Transaction         := Class_Transaction_Wr;

    datasetselect.Database               := DatabaseMain;
    DatasetSelect.Transaction            := TransactionRead;

    DataSetOborotMen.Database        := DatabaseMain;
    DataSetOborotMen.Transaction     := TransactionRead;

    DataSetOborotMenDoc.Database     := DatabaseMain;
    DataSetOborotMenDoc.Transaction  := TransactionRead;

    DataSetOstatkiMenVh.Database     := DatabaseMain;
    DataSetOstatkiMenVh.Transaction  := TransactionRead;

    DataSetOstatkiMenVih.Database    := DatabaseMain;
    DataSetOstatkiMenVih.Transaction := TransactionRead;

    DataSetDates.Database            := DatabaseMain;
    DataSetDates.Transaction         := TransactionRead;
    TransactionRead.StartTransaction;

    cxDateEnd.date := date;
    {загрузка журнала}
    DataSetSelect.Close;
    DataSetSelect.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
    DataSetSelect.Open;
    add_new_alg      := DataSetSelect.FieldByName('FLAG_NEW_ALGORITHM').AsInteger;
    date_new_alg     := DataSetSelect.FieldByName('DATE_NEW_ALGORITHM').AsDateTime;
    show_shablon     := DataSetSelect.FieldByName('SHOW_SHABLONS').AsInteger;
    if DataSetSelect.FieldByName('SHOW_NEOSNOV_PROV').AsInteger = null
        then show_neosn_prov := 0
        else show_neosn_prov :=  DataSetSelect.FieldByName('SHOW_NEOSNOV_PROV').AsInteger;

     if DataSetSelect.FieldByName('NO_VIS_DATE_KOM').AsInteger = null
        then show_date_kom := 1
        else show_date_kom :=  DataSetSelect.FieldByName('NO_VIS_DATE_KOM').AsInteger;


    show_debet       := DataSetSelect.FieldByName('SHOW_DEBET').AsInteger;

    
    id_user := myclass.id_user;
    DataSetSelectSystem.Close;
    DataSetSelectSystem.SQLs.SelectSQL.Text := 'SELECT * FROM J4_CHOOSE_SYS_BY_ID('+IntToStr(id_user)+')';
    DataSetSelectSystem.Open;
    DataSetSelectSystem.FetchAll;

    If DataSetSelectSystem.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.J4_WARNING_LOAD_JORNAL), PChar(Un_R_file_Alex.J4_SP_RAZDELENIE_MESSAGA), 16);
        close;
    end;  

    SetLength(IndSystem, DataSetSelectSystem.RecordCount);
    DataSetSelectSystem.First;
    i := 0;
    item_index := 0;
    cxComboBoxSystem.Properties.Items.Clear;

    While not DataSetSelectSystem.Eof do
    begin
        IndSystem[DataSetSelectSystem.RecNo - 1] := DataSetSelectSystem['ID_J4_SP_JO'];
        cxComboBoxSystem.Properties.Items.Add(DataSetSelectSystem.FieldByName('SHORT_NAME').AsString);
        IF DataSetSelectSystem.FieldByName('SYSTEM_OPEN').Asinteger = 1 THEN
        begin
            kod_system       := DataSetSelectSystem.FieldByName('KOD').AsString;
            id_system        := TFIBBCDField(DataSetSelectSystem.FieldByName('ID_J4_SP_JO')).AsInt64;
            Caption          := DataSetSelectSystem.FieldByName('FULL_NAME').AsString;
            date_open        := DataSetSelectSystem.FieldByName('data_open').AsDateTime;
            item_index       := i;
        end;
        inc(i);
        DataSetSelectSystem.Next;
    end;
    //DataSetSelectSystem.Close;
    cxComboBoxSystem.ItemIndex := item_index;

    DataSetDates.Close;
    DataSetDates.SQLs.SelectSQL.Text := 'Select min(DATE_OPEN) as date_open_min from J4_SELECT_INFO_OPEN_SCH('+IntToStr(id_user)+') where DATE_OPEN<DATE_END and id_kassa='+inttostr(id_system);
    DataSetDates.Open;
    cxDateBegin.Date := DataSetDates.FieldByName('date_open_min').AsDatetime; //IncDay(date, -DataSetSelect.FieldByName('J4_DAY_SHOW_LAST').AsInteger);
    cxDateBegin.Date := StrToDate('01'+copy(cxDateBegin.text, 3, 8));
    date_beg         := cxDateBegin.Date;
    date_end         := StrToDate('01'+copy(cxDateEnd.text, 3, 8));
    date_end         := IncMonth(date_end,1);

    {загрузка настроек}
    DataSetNastroyka.Close;
    DataSetNastroyka.Open;
    {загрузка названий}
    ActionAdd.Caption                            := Un_R_file_Alex.MY_BUTTON_ADD;
    ActionChange.Caption                         := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionDelete.Caption                         := Un_R_file_Alex.MY_BUTTON_DELETE;
    ActionFind.Caption                           := Un_R_file_Alex.MY_BUTTON_FIND;
    ActionRefresh.Caption                        := Un_R_file_Alex.MY_BUTTON_REFRESH;
    ActionExit.Caption                           := Un_R_file_Alex.MY_BUTTON_CLOSE;
    ActionShowDoc.Caption                        := Un_R_file_Alex.MY_ACTION_SHOW;
    ActionClon.Caption                           := Un_R_file_Alex.BANK_CLON;
    ActionPrintReestr.Caption                    := Un_R_file_Alex.BANK_PRINT_REESTR_PRINT;
    ToolButton6.Caption                          := Un_R_file_Alex.MY_BUTTON_PRINT;
    ActionFormReestr.Caption                     := Un_R_file_Alex.J4_REESTR;

    dxStatusBar1.Panels[0].Text                  := 'Ins - ' + Un_R_file_Alex.MY_BUTTON_ADD;
    dxStatusBar1.Panels[1].Text                  := 'F2 - '  + Un_R_file_Alex.MY_BUTTON_EDIT;
    dxStatusBar1.Panels[2].Text                  := 'Del - ' + Un_R_file_Alex.MY_BUTTON_DELETE;
    dxStatusBar1.Panels[3].Text                  := 'F5 - '  + Un_R_file_Alex.MY_BUTTON_REFRESH;
    dxStatusBar1.Panels[4].Text                  := 'Esc - ' + Un_R_file_Alex.MY_BUTTON_CLOSE;
    dxStatusBar1.Panels[5].Text                  := 'F3 - '  + Un_R_file_Alex.MY_ACTION_SHOW;


    cxLabel9.Caption                             := Un_R_file_Alex.J4_MAIN_FORM_SYSTEM;
    cxLabelPer.Caption                           := Un_R_file_Alex.J4_MAIN_FORM_PERIOD;
    cxCheckBoxFrom.Properties.Caption            := Un_R_file_Alex.J4_MAIN_FORM_FROM;
    cxCheckBoxTo.Properties.Caption              := Un_R_file_Alex.J4_MAIN_FORM_TO;
    cxButtonFilter.Caption                       := Un_R_file_Alex.J4_MAIN_FORM_FILTER;
    cxGridMainDBTableView1DBColumn1.Caption      := Un_R_file_Alex.J4_MAIN_FORM_DEBET_KREDIT;
    cxGridMainDBTableView1DBColumn2.Caption      := Un_R_file_Alex.J4_MAIN_FORM_NUMBER;
    cxGridMainDBTableView1DBColumn3.Caption      := Un_R_file_Alex.J4_MAIN_FORM_DATA;
    cxGridMainDBTableView1DBColumn4.Caption      := Un_R_file_Alex.J4_MAIN_FORM_FIO;
    cxGridMainDBTableView1DBColumn5.Caption      := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;
    cxGridMainDBTableView1DBColumn6.Caption      := Un_R_file_Alex.J4_PRIKAZ;
    cxGridMainDBTableView1DBColumn7.Caption      := Un_R_file_Alex.N_TAB_NUM;
    cxGridRaznoskkaDBTableView1DBColumn1.Caption := Un_R_file_Alex.J4_MAIN_FORM_DEBET;
    cxGridRaznoskkaDBTableView1DBColumn2.Caption := Un_R_file_Alex.J4_MAIN_FORM_KREDIT;
    cxGridRaznoskkaDBTableView1DBColumn3.Caption := Un_R_file_Alex.J4_MAIN_FORM_SMETA_RAZ_STATTA;
    cxGridRaznoskkaDBTableView1DBColumn4.Caption := Un_R_file_Alex.J4_MAIN_FORM_KEKV;
    cxGridRaznoskkaDBTableView1DBColumn5.Caption := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;
    cxGridRaznoskkaDBTableView1DBColumn6.Caption := Un_R_file_Alex.J4_MAIN_DOC_SUMMA_NEOS[1];

    cxGridRaspDBTableView1DBColumn1.Caption      := Un_R_file_Alex.J4_MAIN_FORM_RASPR;
    cxGridRaspDBTableView1DBColumn2.Caption      := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;
    cxGridRaspDBTableView1DBColumn3.Caption      := Un_R_file_Alex.J4_MAIN_FORM_NUMBER;

    cxLabelFIO.Caption                           := Un_R_file_Alex.J4_MAIN_FORM_FIO;
    cxLabelKod.Caption                           := Un_R_file_Alex.J4_MAIN_FORM_IDEN_KOD;
    cxLabelPol.Caption                           := Un_R_file_Alex.J4_MAIN_FORM_POL;
    cxLabelDay.Caption                           := Un_R_file_Alex.J4_MAIN_FORM_DATA_BORN;
    cxLabelPaspart.Caption                       := Un_R_file_Alex.J4_MAIN_FORM_PASPORT;
    cxLabelNumber.Caption                        := Un_R_file_Alex.J4_MAIN_FORM_SERIA;
    cxLabelWhy.Caption                           := Un_R_file_Alex.J4_MAIN_FORM_OSNOVA;
    if (add_new_alg = 1) and (date_new_alg <= date) then
    begin
        cxGridMainDBTableView1DBColumn6.Visible      := true;
        cxGridRaznoskkaDBTableView1DBColumn6.Visible := true;
    end else
    begin
        cxGridMainDBTableView1DBColumn6.Visible      := false;
        cxGridRaznoskkaDBTableView1DBColumn6.Visible := false;
    end;
    cxLabel1.Caption := '';
    cxLabel3.Caption := '';
    cxLabel5.Caption := '';
    cxLabel2.Caption := '';
    cxLabel4.Caption := '';
    cxLabel6.Caption := '';
    flag_autoscroll := false;
    fl := true;
    DataSetMain.Close;
    DataSetRasp.SQLs.SelectSQL.Text     := 'Select * from J4_DT_AO_RASPREDELENIE_SELECT(?ID_AO) order by "NUM" ASC';
    DataSetProvodka.SQLs.SelectSQL.Text := 'Select * from J4_SELECT_ALL_PROV(?R_ID_DT_DOC)';
    DataSetMain.SQLs.SelectSQL.Text     := 'SELECT * FROM J4_DT_AO_SELECT('''+DateToStr(cxDateBegin.Date)+''', ' + IntToStr(id_system) + ', '''+DateToStr(cxDateEnd.Date)+''') ORDER BY R_DATE_AO ASC';
    DataSetMain.Open;
    cxGridMainDBTableView1.Controller.GoToLast(false);

end;

procedure TfmAvanceOtchet.ActionExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAvanceOtchet.cxCheckBoxFromClick(Sender: TObject);
begin
    if cxCheckBoxFrom.Checked then
    begin
        cxDateBegin.Enabled := true;
    end else
    begin
        cxDateBegin.Enabled := false;
        cxDateBegin.date    := date_open;
    end;
    cxCheckBoxToClick(Sender);
end;

destructor TfmAvanceOtchet.Destroy;
begin
    DataSetNastroyka.close;
    DataSetRasp.Close;
    DataSetProvodka.Close;
    DataSetSelectSystem.Close;
    DataSetMain.Close;
//    if FormStyle = fsMDIChild then myclass.Free;
    inherited;
end;


procedure TfmAvanceOtchet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   // DataSetSelectSystem.Close;
    if FormStyle = fsMDIChild then Action := caFree;
    //AvanceMain_FormStorage.SaveFormPlacement;
end;

procedure TfmAvanceOtchet.cxCheckBoxToClick(Sender: TObject);
begin
    if cxCheckBoxTo.Checked then
    begin
        cxDateEnd.Enabled   := true;
        cxDateEnd.Date      := date;
    end else
    begin
        cxDateEnd.Enabled   := false;
        cxDateEnd.Date      := strtodate('31.12.2999');
    end;
   { if  cxCheckBoxTo.Checked then
    begin
        cxDateEnd.Properties.ReadOnly := false;
        cxDateEnd.Enabled             := true;
    end else
    begin
        cxDateEnd.Enabled             := false;
        cxDateEnd.Properties.ReadOnly := true;
    end; }
end;

procedure TfmAvanceOtchet.ActionFindExecute(Sender: TObject);
begin
//
end;

procedure TfmAvanceOtchet.ActionRefreshExecute(Sender: TObject);
var
    date1, date2 : string;
begin
    //date1 := '01.01.1900';
    //date2 := '31.12.2999';
    if cxCheckBoxFrom.Checked then
        date1 := cxDateBegin.Text
    else
        date1 := datetostr(date_open);
    if cxCheckBoxTo.Checked then
        date2 := cxDateEnd.Text
    else
        date2 := '31.12.2999';
    date_beg := StrToDate(date1);
    if(cxDateBegin.Date>cxDateEnd.Date) then
    begin
       showmessage(Un_R_file_Alex.J4_WARNING_DATE_BEG_END);
       exit;
    end;
    DataSetMain.Close;
    DataSetMain.SQLs.SelectSQL.Text := 'SELECT * FROM J4_DT_AO_SELECT('''+Date1+''', ' + IntToStr(id_system) + ', '''+Date2+''') ';
    DataSetMain.Open;
end;

procedure TfmAvanceOtchet.ActionAddExecute(Sender: TObject);
var
    T        : TfmAddChangeAvance;
    error    : integer;
    ViewForm : TfmSelectTypeDoc;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/JO4/Work_j4/Work_doc_j4/Avance_otchet','Add');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_ADD), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;

    ras := DataSetNastroyka.fieldByName('RAZSCHIFROVKA').AsInteger;
    if show_debet = 0 then
    begin
        prihod := 0;
    end else
    if not Show_fmPrihod(prihod) then
    begin
        exit;
    end;

    if (show_shablon = 1) and not (Show_j4_Shablon(id_oper))  then
    begin
        exit;
    end;

    if (id_oper = 2) and (show_shablon = 1) and not (Select_From_Vedomost(DatabaseMain, TransactionRead,prihod, id_prov_vedom,
        id_sm, id_st, id_razd, id_kekv, id_man, id_osn_sch, id_system, id_kor_sch, sum_vedomost, smeta_kod, st_kod, raz_kod, kekv_kod, title_sm,
        title_raz, title_st, title_kod, fio_man, birthday, tin, kod_sch, title_sch, sch_osn_num, sch_osn_title, tn, sel_all)) then
    begin

        exit;
    end;

  //проверка на настройки ввода ведомостей через авансовые отчеты
  DSetIni.Database := DatabaseMain;
  DSetIni.Transaction := TransactionRead;
  DSetIni.close;
  DSetIni.SelectSQL.Text := 'select * from J4_INI';
  DSetIni.open;
  //--------------------------------------------------------------

  // если настроен выбор типа документа при создании авансового отчета
  if DSetIni['J4_IS_SELECT_TYPE_DOC_AV_O'] = 1 then
  begin
    viewform                         := TfmSelectTypeDoc.Create(Self);
    viewform.Database                := DatabaseMain;
    viewform.Trans.DefaultDatabase   := viewform.Database;
    viewform.DSetTypeDoc.Transaction := viewform.Trans;
    viewform.DSetTypeDoc.Close;
    viewform.DSetTypeDoc.SelectSQL.Text := 'select * from J4_SP_TYPE_DOC_FOR_CR_AV_O_SEL';
    viewform.DSetTypeDoc.Open;
    viewform.cxGrid1DBTableView1.DataController.DataSource := ViewForm.DSourceTypeDoc;
    viewform.ShowModal;

    if (viewform.ModalResult = mrok)then
    begin
      T := TfmAddChangeAvance.Create(self, self, myclass, DatabaseMain, AddAvance, ras, kod_system, id_system, 0, 0);
      t.is_select_type_doc := 1; //тип договора был выбран
      T.id_type_doc        := StrToInt64(ViewForm.DSetTypeDoc.fbn('id_type_doc').asstring);
      T.name_type_doc      := ViewForm.DSetTypeDoc['name_type_doc_for_create_av_o'];
      t.ButtonEditTypeDoc.Text := T.name_type_doc;
      t.ButtonEditTypeDoc.Enabled := True;
      T.ShowModal;
      T.Free;
      id_oper := 0;
    end;
  end
  else //если тип документа не нужно выбирать
  begin
    T := TfmAddChangeAvance.Create(self, self, myclass, DatabaseMain, AddAvance, ras, kod_system, id_system, 0, 0);
    t.is_select_type_doc := 0;
    t.ButtonEditTypeDoc.Enabled := False;
    t.ButtonEditTypeDoc.Text := 'Авансовий звіт';
    T.ShowModal;
    T.Free;
    id_oper := 0;
  end;
end;

procedure TfmAvanceOtchet.DataSetMainAfterScroll(DataSet: TDataSet);
begin
    cxLabel1.Caption := '';
    cxLabel3.Caption := '';
    cxLabel5.Caption := '';
    cxLabel2.Caption := '';
    cxLabel4.Caption := '';
    cxLabel6.Caption := '';
    begin
        if not DataSetMain.IsEmpty then
        begin
            cxLabel1.caption := DataSetMain.FieldByName('R_MAN_FAMILIA').asString+' '+DataSetMain.FieldByName('R_MAN_NAME').asString+' '+DataSetMain.FieldByName('R_MAN_OTCHESTVO').asString;
            cxLabel3.Caption := DataSetMain.FieldByName('R_TIN').asString;
            cxLabel4.Caption := DateToStr(DataSetMain.FieldByName('R_BIRTH_DATE').asDateTime);
            cxLabel5.Caption := DataSetMain.FieldByName('R_SER_PAS').asString;
            cxLabel6.Caption := DataSetMain.FieldByName('R_NUM_PAS').asString;
            if DataSetMain.FieldByName('R_ID_SEX').AsInteger = 1
                then cxLabel2.Caption := Un_R_file_Alex.J4_POL_MAN
                else cxLabel2.Caption := Un_R_file_Alex.J4_POL_WOMAN;
            cxLabel7.Caption := DataSetMain.FieldByName('R_NOTE').asString;
            try cxTextEdit1.Text := DataSetMain.FieldByName('R_DOGOVOR').asString; except  end;
        end;
    end;
end;

procedure TfmAvanceOtchet.ActionDeleteExecute(Sender: TObject);
   var STRU:KERNEL_MODE_STRUCTURE;
       ErrorList:TStringList;
       DoResult : boolean;
       i, number_doc : integer;
       mes : string;
       id_last, id_del : int64;
       ddate : Tdate;
       error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/JO4/Work_j4/Work_doc_j4/Avance_otchet','Del');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_DEL), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    if DataSetMain.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.J4_FORM_ERROR_DEL), PChar(Un_R_file_Alex.J4_FORM_WARNING), 16);
        exit;
    end
    else begin

          //проверка на завязку ведомостей
          Class_Transaction_Wr.StartTransaction;
          Class_StoredProc.StoredProcName := 'UW_FIND_AO_INVEDOMOST';
          Class_StoredProc.ParamByName('ID_AO').AsInt64 := StrToInt64(DataSetMain.fieldbyname('ID_AO').AsString);
          Class_StoredProc.ExecProc;
          Class_Transaction_Wr.Commit;

          if (Class_StoredProc.ParamByName('out').AsInteger = 1) then
          begin
            ShowMessage('Цей авансовий звіт є у відомостях. Не можна його вилучити');
            Exit;
          end;
          //*******************************

        if (not DataSetMain.fieldByName('R_KOM_ID_REESTR').isNull) then
        begin
            number_doc := DataSetMain.FieldByName('R_NUM_AO').AsInteger;
            ddate      := DataSetMain.FieldByName('R_DATE_AO').AsDateTime;
            ShowMessage(Un_R_file_Alex.J4_MAIN_NUM_DOC_AVANCE_OF+inttostr(number_doc)+' '+Un_R_file_Alex.J4_MAIN_ADD_DATA_DOC+' '+datetostr(ddate)+' '+J4_MAIN_HAVE_PAY);
            exit;
        end else
        if MessageBox(Handle, Pchar(Un_R_file_Alex.J4_MESSAGE_DEL+' '+ Un_R_file_Alex.J4_DOCUMENT +' '+DataSetMain.FieldByName('R_NUM_AO').AsString), Pchar(Un_R_file_Alex.J4_MESSAGE_OK), mb_YesNo) = mrYes
        then
        begin


            id_del                       := DataSetMain['ID_AO'];
            cxGridMainDBTableView1.Controller.GoToPrev(false);
            id_last                      := DataSetMain['ID_AO'];
            DataSetMain.Locate('ID_AO', id_del, []);
            // Удаляем поле
            Class_StoredProc.Database    := DatabaseMain;
            Class_StoredProc.Transaction := Class_Transaction_Wr;
            Class_StoredProc.Transaction.StartTransaction;
            try
                STRU.DBHANDLE      := DatabaseMain.Handle;
                STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
                STRU.WORKDATE      := DataSetMain['R_DATE_AO'];
                STRU.KERNEL_ACTION := 2;
                STRU.KEY_SESSION   := DatabaseMain.Gen_Id('KERNEL_GEN_ID_SESSION', 1);                                 STRU.PK_ID := TFIBBCDField(DataSetMain.FieldByname('R_ID_DT_DOC')).AsInt64;
                DoResult           := Kernel.KernelDo(@STRU);
                if not DoResult then
                begin
                    ErrorList      := Kernel.GetDocErrorsList(@STRU);
                    if ErrorList<>nil
                        then for i := 0 to  ErrorList.Count-1 do
                        mes :=  mes +' '+ ErrorList.Strings[i] +#13;
                    ShowMessage(mes);
                    Class_StoredProc.Transaction.Rollback;
                    exit;
                end;
                Class_StoredProc.StoredProcName:='J4_DT_AO_DELETE';
                Class_StoredProc.Prepare;
                Class_StoredProc.ParamByName('D_ID_AO').AsInt64 := DataSetMain['ID_AO'];
                Class_StoredProc.ExecProc;
                Class_StoredProc.Transaction.Commit;
            except on E:Exception do begin
                Class_StoredProc.Transaction.Rollback;
                ShowMessage(E.Message);
            end end;
            ActionRefreshExecute(Sender);
            DataSetMain.Locate('ID_AO', id_last, []);
        end;
    end;
end;

procedure TfmAvanceOtchet.ActionChangeExecute(Sender: TObject);
var
    T : TfmAddChangeAvance;
    ras, number_doc : integer;
    id, id_people   : int64;
    ddate           : Tdate;
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/JO4/Work_j4/Work_doc_j4/Avance_otchet','Edit');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_EDIT), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    if (not DataSetMain.fieldByName('R_KOM_ID_REESTR').isNull) then
    begin
        number_doc := DataSetMain.FieldByName('R_NUM_AO').AsInteger;
        ddate      := DataSetMain.FieldByName('R_DATE_AO').AsDateTime;
        ShowMessage(Un_R_file_Alex.J4_MAIN_NUM_DOC_AVANCE_OF+inttostr(number_doc)+' '+Un_R_file_Alex.J4_MAIN_ADD_DATA_DOC+' '+datetostr(ddate)+' '+J4_MAIN_HAVE_PAY);
        exit;
    end;

    //проверка на завязку ведомостей
    Class_Transaction_Wr.StartTransaction;
    Class_StoredProc.StoredProcName := 'UW_FIND_AO_INVEDOMOST';
    Class_StoredProc.ParamByName('ID_AO').AsInt64 := StrToInt64(DataSetMain.fieldbyname('ID_AO').AsString);
    Class_StoredProc.ExecProc;
    Class_Transaction_Wr.Commit;

    if (Class_StoredProc.ParamByName('out').AsInteger = 1) then
    begin
      ShowMessage('Цей авансовий звіт є у відомостях. Не можна його редагувати');
      Exit;
    end;
    //*******************************
    prihod    := DataSetMain.fieldByName('R_PRIH_RAS').AsInteger;
    ras       := DataSetNastroyka.fieldByName('RAZSCHIFROVKA').AsInteger;
    id        := TFIBBCDField(DataSetMain.FieldByName('ID_AO')).AsInt64;
    id_people := TFIBBCDField(DataSetMain.FieldByName('R_ID_MAN')).AsInt64;

    //проверка на настройки ввода ведомостей через авансовые отчеты
    DSetIni.Database := DatabaseMain;
    DSetIni.Transaction := TransactionRead;
    DSetIni.close;
    DSetIni.SelectSQL.Text := 'select * from J4_INI';
    DSetIni.open;
    //--------------------------------------------------------------

    T := TfmAddChangeAvance.Create(self, self, myclass, DatabaseMain, ChangeAvance, ras, kod_system, id_system, id, id_people);

    if DSetIni['J4_IS_SELECT_TYPE_DOC_AV_O'] = 1 then
    begin
      t.is_select_type_doc        := 1; //тип договора был выбран
      t.ButtonEditTypeDoc.Enabled := True;
    end
    else
    begin
      t.is_select_type_doc        := 0; //тип договора был выбран
      t.ButtonEditTypeDoc.Enabled := False;
    end;  

    T.id_type_doc        := StrToInt64(DataSetMain.fbn('id_type_doc').asstring);
    T.name_type_doc      := DataSetMain['name_type_doc'];
    t.ButtonEditTypeDoc.Text := T.name_type_doc;
    T.ShowModal;
    T.Free;
end;

procedure TfmAvanceOtchet.ActionCancelExecute(Sender: TObject);
begin
//
end;

procedure TfmAvanceOtchet.cxDateEndEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
    if cxDateEnd.Date > cxDateBegin.Date then
        cxDateEnd.Date := cxDateBegin.Date;
end;

procedure TfmAvanceOtchet.cxButtonFilterClick(Sender: TObject);
begin
    ActionRefreshExecute(Sender);
end;

procedure TfmAvanceOtchet.cxComboBoxSystemClick(Sender: TObject);
var
    i : integer;
begin
    if fl then
    begin
        i := cxComboBoxSystem.ItemIndex;
        if id_system <> IndSystem[i] then
        begin
           id_system        := IndSystem[i];
            DataSetSelectSystem.Close;
            DataSetSelectSystem.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SP_JO WHERE ID_J4_SP_JO = '+ QuotedStr(IntToStr(id_system))+'';
            DataSetSelectSystem.Open;
            kod_system       := DataSetSelectSystem.FieldByName('KOD').AsString;
            Caption          := DataSetSelectSystem.FieldByName('FULL_NAME').AsString;

            DataSetSelect.Close;
            DataSetSelect.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
            DataSetSelect.Open;
            cxDateBegin.Date := IncDay(date, -DataSetSelect.FieldByName('J4_DAY_SHOW_LAST').AsInteger);
            cxDateBegin.Date := StrToDate('01'+copy(cxDateBegin.text, 3, 8));
            date_beg         := cxDateBegin.Date;
            //cxDateBegin.Date := DataSetSelectSystem.FieldByName('DATA_OPEN').AsDateTime;
            //date_beg         := DataSetSelectSystem.FieldByName('DATA_OPEN').AsDateTime;
            ActionRefreshExecute(Sender);
        end;
    end;
end;

procedure TfmAvanceOtchet.cxDateBeginEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
    if date_beg > cxDateBegin.Date then
        cxDateBegin.Date := date_beg;
end;

procedure TfmAvanceOtchet.ActionShowExecute(Sender: TObject);
var
    mes : string;
begin
    if not DataSetMain.IsEmpty then
    begin
        mes := '';
        if DataSetMain['ID_AO'] <> null then
            mes := 'ID_AO - ' + DataSetMain.FieldByName('ID_AO').AsString;
        if DataSetMain.FieldByName('R_ID_DT_DOC').AsString <> null then
            mes := mes +#13 + 'R_ID_DT_DOC - ' + DataSetMain.FieldByName('R_ID_DT_DOC').AsString;
        if DataSetMain['R_FIO'] <> null then
            mes := mes +#13 + 'R_FIO - ' + DataSetMain.FieldByName('R_FIO').AsString;
        if DataSetMain['R_BIRTH_DATE'] <> null then
            mes := mes +#13 + 'R_BIRTH_DATE - ' + DataSetMain.FieldByName('R_BIRTH_DATE').AsString;
        if DataSetMain['R_DOGOVOR'] <> null then
            mes := mes +#13 + 'dogovor - ' + DataSetMain.FieldByName('R_DOGOVOR').AsString;
        Showmessage(MES);
    end;
end;

procedure TfmAvanceOtchet.ActionShowDocExecute(Sender: TObject);
var
    T : TfmAddChangeAvance;
    ras : integer;
    id, id_people : int64;
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/JO4/Work_j4/Work_doc_j4/Avance_otchet','View');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_VIEW), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    prihod    := DataSetMain.fieldByName('R_PRIH_RAS').AsInteger;
    ras       := DataSetNastroyka.fieldByName('RAZSCHIFROVKA').AsInteger;
    id        := TFIBBCDField(DataSetMain.FieldByName('ID_AO')).AsInt64;
    id_people := TFIBBCDField(DataSetMain.FieldByName('R_ID_MAN')).AsInt64;
    T := TfmAddChangeAvance.Create(self, self, myclass, DatabaseMain, ShowAvance, ras, kod_system, id_system, id, id_people);
    T.ShowModal;
    T.Free;
end;

procedure TfmAvanceOtchet.ActionClonExecute(Sender: TObject);
var
    T : TfmAddChangeAvance;
    ras, number_doc : integer;
    id, id_people   : int64;
    ddate           : Tdate;
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/JO4/Work_j4/Work_doc_j4/Avance_otchet','Edit');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_EDIT), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    if (not DataSetMain.fieldByName('R_KOM_ID_REESTR').isNull) then
    begin
        number_doc := DataSetMain.FieldByName('R_NUM_AO').AsInteger;
        ddate      := DataSetMain.FieldByName('R_DATE_AO').AsDateTime;
        ShowMessage(Un_R_file_Alex.J4_MAIN_NUM_DOC_AVANCE_OF+inttostr(number_doc)+' '+Un_R_file_Alex.J4_MAIN_ADD_DATA_DOC+' '+datetostr(ddate)+' '+J4_MAIN_HAVE_PAY);
        exit;
    end;
    prihod    := DataSetMain.fieldByName('R_PRIH_RAS').AsInteger;
    ras       := DataSetNastroyka.fieldByName('RAZSCHIFROVKA').AsInteger;
    id        := TFIBBCDField(DataSetMain.FieldByName('ID_AO')).AsInt64;
    id_people := TFIBBCDField(DataSetMain.FieldByName('R_ID_MAN')).AsInt64;
    T := TfmAddChangeAvance.Create(self, self, myclass, DatabaseMain, ClonAvance, ras, kod_system, id_system, id, id_people);
    T.ShowModal;
    T.Free;
end;

procedure TfmAvanceOtchet.ActionPrintFioExecute(Sender: TObject);
var
    T : TfmUn_Progress_form;
    r_lev, r_id_m, r_id_s, r_id_j, r_id_d, r_kod_d : int64;
    r_date, d, d2 : TDate;
    tn : string;
    mon_beg_i, mon_end_i : integer;
    mon_beg, mon_end : string;
begin
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.J4_WAIT_DANN);
    T.Show;
    T.Update;

     if DataSetMain.FieldByName('R_ID_MAN').AsVariant <> null then r_id_m  := DataSetMain.FieldByName('R_ID_MAN').AsVariant else r_id_m  := 0;
     if DataSetMain.FieldByName('R_TN').AsVariant <> null then tn  := DataSetMain.FieldByName('R_TN').AsVariant else r_id_s  := 0;

     d  := StrToDate('01'+copy(cxDateBegin.text, 3, 8));
     d2 := date_end;
     mon_beg_i                            := monthof(cxDateBegin.date);
     case mon_beg_i of
            1 : mon_beg  :='січень';
            2 : mon_beg  :='лютий';
            3 : mon_beg  :='березень';
            4 : mon_beg  :='квітень';
            5 : mon_beg  :='травень';
            6 : mon_beg  :='червень';
            7 : mon_beg  :='липень';
            8 : mon_beg  :='серпень';
            9 : mon_beg  :='вересень';
            10 : mon_beg :='жовтень';
            11 : mon_beg :='листопад';
            12 : mon_beg :='грудень';
        end;
     mon_end_i                            := monthof(cxDateEnd.date);

     case mon_end_i of
            1 : mon_end  :='січень';
            2 : mon_end  :='лютий';
            3 : mon_end  :='березень';
            4 : mon_end  :='квітень';
            5 : mon_end  :='травень';
            6 : mon_end  :='червень';
            7 : mon_end  :='липень';
            8 : mon_end  :='серпень';
            9 : mon_end  :='вересень';
            10 : mon_end :='жовтень';
            11 : mon_end :='листопад';
            12 : mon_end :='грудень';
     end;

     Class_Transaction_Wr.StartTransaction;

     DataSetOstatkiMenVh.Close;
     DataSetOstatkiMenVh.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_OSTATKI_BUH_MEN('+IntToStr(r_id_m)+', '+IntToStr(id_system)+', '''+DateToStr(d)+''', '''+DateToStr(D2)+''', '''+inttostr(id_user)+''') where vh='+ inttostr(1)+'' ;
     DataSetOstatkiMenVh.Open;
     DataSetOstatkiMenVh.FetchAll;


     DataSetOstatkiMenVih.Close;
     DataSetOstatkiMenVih.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_OSTATKI_BUH_MEN('+IntToStr(r_id_m)+', '+IntToStr(id_system)+', '''+DateToStr(d)+''', '''+DateToStr(D2)+''', '''+inttostr(id_user)+''') where vh='+ inttostr(0)+'' ;
     DataSetOstatkiMenVih.Open;
     DataSetOstatkiMenVih.FetchAll;

     DataSetOborotMenDoc.Close;
     DataSetOborotMenDoc.SQLs.SelectSQL.Text := 'select distinct pk_id,date_doc, num_doc, sum_doc_db,sum_doc_kr,name FROM J4_SELECT_OBOROT_BUH_MEN ('+IntToStr(r_id_m)+', '+IntToStr(id_system)+', '''+DateToStr(d)+''', '''+DateToStr(D2)+''')  order by date_doc';
     DataSetOborotMenDoc.Open;
     DataSetOborotMenDoc.FetchAll;

     DataSetOborotMen.Close;
     DataSetOborotMen.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_OBOROT_BUH_MEN('+IntToStr(r_id_m)+', '+IntToStr(id_system)+', '''+DateToStr(d)+''', '''+DateToStr(D2)+''')   order by date_doc';
     DataSetOborotMen.Open;
     DataSetOborotMen.FetchAll;

     Class_Transaction_Wr.Commit;
     T.Free;
     frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_rashifr_by_fio.fr3');

     frxReport1.Variables['date_beg']     := QuotedStr(datetostr(d));
     frxReport1.Variables['date_end']     := QuotedStr(datetostr(d2));
     frxReport1.Variables['tn']           := QuotedStr(tn);//QuotedStr(cxLabel7.Text);
     frxReport1.Variables['fio']          := QuotedStr(cxLabel1.Caption);
     frxReport1.Variables['inn']          := QuotedStr(cxLabel3.Caption);
     frxReport1.Variables['mon_beg']      := QuotedStr(mon_beg);
     frxReport1.Variables['mon_end']      := QuotedStr(mon_end);
     frxReport1.Variables['year_beg']     := QuotedStr(inttostr(yearof(cxDateBegin.Date)));
     frxReport1.Variables['year_end']     := QuotedStr(inttostr(yearof(cxDateEnd.Date)));
     frxReport1.Variables['fio_b']        := QuotedStr(GetUserFIO);;


     frxReport1.PrepareReport(true);
     frxReport1.ShowReport(true);
     //frxReport1.DesignReport;
     DataSetOborotMen.Close;
     DataSetOborotMenDoc.Close;
end;

procedure TfmAvanceOtchet.ActionPrintReestrExecute(Sender: TObject);
var T :  TfrmPrintReestr;
begin
    T := TfrmPrintReestr.Create(self, self, DatabaseMain);
    T.ShowModal;
    T.Free;
end;

end.
