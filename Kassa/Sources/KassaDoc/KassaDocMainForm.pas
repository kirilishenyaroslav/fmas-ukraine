unit KassaDocMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, ComCtrls, ToolWin, ActnList, ImgList, ExtCtrls, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit, KassaDocClass, Un_R_file_Alex,
  cxLabel, FR_Class, KassaInputSumma, Un_lo_file_Alex, frxClass, frxDBSet,
  cxMemo, DogLoaderUnit, cxImage, cxCurrencyEdit, dxStatusBar, GlobalSPR,
  RxMemDS, cxCheckBox, cxGridBandedTableView, cxGridDBBandedTableView,
  dxBar, dxBarExtItems, Menus, frxDesgn, Math, cxLookAndFeelPainters,
  StdCtrls, cxButtons, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfmModeShowDoc = (Show, Edit);

  TProvodkaRec = record
      summa_all       : Currency;
      summa_prov      : Currency;
      id_sch_osnov    : int64;
      id_sch_kor      : int64;
      kod_sch_osnov   : string;
      kod_sch_kor     : string;
      tytle_sch_ocnov : string;
      tytle_sch_kor   : string;
      id_smeta        : int64;
      id_razd         : int64;
      id_state        : int64;
      id_kekv         : int64;
      kod_smeta       : string;
      kod_razd        : string;
      kod_state       : string;
      kod_kekv        : string;
      tytle_smeta     : string;
      tytle_razd      : string;
      tytle_state     : string;
      tytle_kekv      : string;
      id_man          : int64;
      name_fio        : string;
      id_dog          : int64;
      kod_dog         : int64;
      num_dog         : string;
      date_dog        : TDate;
      name_cust       : string;
      type_dog        : string;
      reg_dog         : string;
      id_payer        : int64;
      id_ras_nativ    : int64;
      id_ras          : int64;
      id_cust         : int64;
      date_zavod      : TDate;
  end;

  TAllRec = record
      prov   : array of TProvodkaRec;
      result : integer;
  end;

  TfmKassaDocMainForm = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Database: TpFIBDatabase;
    DataSetMain: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolBar2: TToolBar;
    ImageList: TImageList;
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
    ActionList: TActionList;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    ActionFind: TAction;
    ActionCancel: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    DataSetKass: TpFIBDataSet;
    DataSetDay: TpFIBDataSet;
    cxComboBoxKassa: TcxComboBox;
    cxComboBoxDay: TcxComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    DataSource: TDataSource;
    ToolButton6: TToolButton;
    ActionPrint: TAction;
    ActionPrintMonitor: TAction;
    PrintDialog1: TPrintDialog;
    Report: TfrReport;
    pFIBDataSet_ini: TpFIBDataSet;
    DataSetKorSch: TpFIBDataSet;
    TransactionWr: TpFIBTransaction;
    frxDBDataset1: TfrxDBDataset;
    Panel2: TPanel;
    cxMemo1: TcxMemo;
    cxLabel3: TcxLabel;
    ImageList1: TImageList;
    dxStatusBar1: TdxStatusBar;
    ActionShow: TAction;
    ActionShowAll: TAction;
    ActionChangeAdd: TAction;
    cxTextEdit1: TcxTextEdit;
    cxLabel4: TcxLabel;
    DataSetKOdSys: TpFIBDataSet;
    ActionPtintVedomost: TAction;
    frxDBDataset2: TfrxDBDataset;
    DataSetVedom: TpFIBDataSet;
    DataSetVedomR_FIO: TFIBStringField;
    DataSetVedomR_ID_MAN: TFIBBCDField;
    DataSetVedomR_SUMMA: TFIBBCDField;
    DataSetVedomR_TAB_NUM: TFIBIntegerField;
    DataSetVedomNAME_PREDPR: TFIBStringField;
    DataSetMainID_DT_DOC: TFIBBCDField;
    DataSetMainID_DT_DAY: TFIBBCDField;
    DataSetMainPRIHOD: TFIBBCDField;
    DataSetMainNUMBER_DOC: TFIBBCDField;
    DataSetMainADD_NUMBER_DOC: TFIBSmallIntField;
    DataSetMainFIO: TFIBStringField;
    DataSetMainOSNOVANIE: TFIBStringField;
    DataSetMainID_OPERATION: TFIBBCDField;
    DataSetMainSUMMA_DOC: TFIBBCDField;
    DataSetMainID_ALL_DOC: TFIBStringField;
    DataSetMainID_MAN: TFIBBCDField;
    DataSetMainRASHOD: TFIBBCDField;
    DataSetMainALL_NUMBER: TFIBStringField;
    DataSetMainPRIHOD_RASHOD: TFIBSmallIntField;
    DataSetMainFIO_BIRTHDAY: TFIBDateField;
    DataSetMainFIO_TIN: TFIBStringField;
    DataSetMainKOR_SCH: TFIBStringField;
    DataSetMainNUMBER_PASS: TFIBStringField;
    DataSetMainSERIYA_PASS: TFIBStringField;
    DataSetMainVIDAN: TFIBStringField;
    DataSetMainDATE_VIDAN: TFIBDateField;
    DataSetMainTN: TFIBIntegerField;
    DataSetMainNAME_PREDPR: TFIBStringField;
    DataSetMainALL_NUM_SCREEN: TFIBStringField;
    ToolButton8: TToolButton;
    Class_DataSet: TpFIBDataSet;
    ActionMakeAllDoc: TAction;
    ActionVozvrat: TAction;
    ToolButton9: TToolButton;
    DataSetMainSUM_DOC_ALL_PRIH: TFIBBCDField;
    DataSetMainSUM_DOC_ALL_RAS: TFIBBCDField;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn10: TcxGridDBBandedColumn;
    Timer1: TTimer;
    cxCheckBoxRefr: TcxCheckBox;
    APrintBlankClear: TAction;
    PopupMenu1: TPopupMenu;
    ActionPrint1: TMenuItem;
    ActionPrintMonitor1: TMenuItem;
    ActionPtintVedomost1: TMenuItem;
    APrintBlankClear1: TMenuItem;
    APrintBlank: TAction;
    APrintBlank1: TMenuItem;
    DataSetMainSERIYA: TFIBStringField;
    DataSetMainN_SERII: TFIBStringField;
    DataSetMainSER_N: TFIBStringField;
    cxGrid1DBBandedTableView1DBBandedColumn11: TcxGridDBBandedColumn;
    frxDesigner1: TfrxDesigner;
    ActionPrint2009: TMenuItem;
    ActionPrint2009new1: TMenuItem;
    DataSet_ini_order: TpFIBDataSet;
    ActionPrint2009forA41: TMenuItem;
    ActionPrintVedomost2009: TMenuItem;
    DataSetVedomOKPO: TFIBStringField;
    ActionPrintNew2009: TAction;
    ActionPrintMonitor2009: TAction;
    DataSet_ini_perm: TpFIBDataSet;
    DataSetSysData: TpFIBDataSet;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    StoredProc: TpFIBStoredProc;
    ActionPrintNBU252_albom: TMenuItem;
    frxReport1: TfrxReport;
    frxReport4: TfrxReport;
    frxReport3: TfrxReport;
    frxReport2: TfrxReport;
    frxReport5: TfrxReport;
    ActionPrintDonNUETA4: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionPrintMonitorExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    function SelectDogovor : boolean;
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure DataSetMainAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBTableView1DBColumn7CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ActionShowExecute(Sender: TObject);
    procedure ActionShowAllExecute(Sender: TObject);
    procedure ActionChangeAddExecute(Sender: TObject);
    procedure ActionFindExecute(Sender: TObject);
    procedure cxTextEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function DogZaObuchNew : boolean;
    procedure ActionPtintVedomostExecute(Sender: TObject);
    procedure ActionMakeAllDocExecute(Sender: TObject);
    procedure ActionVozvratExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure APrintBlankClearExecute(Sender: TObject);
    procedure APrintBlankExecute(Sender: TObject);
    procedure PrintBlank(clear : boolean);
    function Summa_on_words(smma : string; max_len1, max_len2 : integer; var s1, s2 : string) : boolean;
    procedure ActionPrint2009Click(Sender: TObject);
    procedure ActionPrint2009new1Click(Sender: TObject);
    procedure ActionPrint2009forA41Click(Sender: TObject);
    procedure ActionPrintVedomost2009Click(Sender: TObject);
    procedure ActionPrintMonitor2009Execute(Sender: TObject);
    procedure cxGrid1DBBandedTableView1KeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure ActionPrintNBU252_albomClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ActionPrintDonNUETA4Click(Sender: TObject);
  private
    IndKassa : array of Int64;
//    IndDay : array of Int64;
  public
    id_operation, id_sch, id_smeta, id_stat, id_razdel, id_kekv_oper, id_dog_umol, kod_dog_umol : int64;
    prihod, flag_prih, flag_ras, flag_def_f, flag_sys, flag_vis, kodShab, flag_proverka_to_buff, nds_pr, nds_ask_s : smallint;
    KOD_SCH_DEFAULT, TITLE_SCH_DEFAULT, Note, kod_sch_kor_sdacha, tytle_sch_kor_sdacha, note_obuch : STRING;
    id_kassa, id_day, id_user, id_sch_kor_sdacha, id_pkv, id_tpfin : int64;
    myclass : TMainDocClass;
    flag : TfmModeShowDoc;
    predv_prov, permission, show_print : smallint;
    name_z, barstr, cn_barcode, st_barcode, id_server, shablon_barcode : string;
    d : TPfibDataBase;
    day_kassa_max : Tdate;
//    DogParam : TAlexDogResult;
    sum, sum_for_razbivka : double;
    DogParam : TDogResult;
    lang, nds, dont_delete_doc, barcode_prih, use_barcode : integer;
    flag_add_change : boolean;
    RecProv : TAllRec;
    constructor Create(AOwner: TComponent; mclass: TMainDocClass; m : TfmModeShowDoc); reintroduce; overload;
end;

implementation
uses PrihodRashod, SelectShablon, KassOrder, DateUtils, KassaInputPS, Accmgmt, Un_func_file_Alex, KassaSdachaDeneg,
     //cn_Common_Loader,
     cn_Common_Types, Un_Progress_form, Kernel, Seriya, KassaGetPkvFin;

{$R *.dfm}

{ TfmKassaDocMainForm }

constructor TfmKassaDocMainForm.Create(AOwner: TComponent; mclass: TMainDocClass; m : TfmModeShowDoc);
var
    i : int64;
    error : integer;
begin
    inherited Create (AOwner);
    myclass                        := mclass;
    DecimalSeparator               := ',';
    Database                       := myclass.Class_Database;
    Transaction.DefaultDatabase    := Database;//myclass.Class_Transaction_R;
    Database.DefaultTransaction    := Transaction;

    DataSetKOdSys.Transaction      := Transaction;
    DataSetKOdSys.Database         := Database;

    TransactionWr.DefaultDatabase    := Database;
    Caption                          := Un_R_file_Alex.KASSA_DOC_CAPTION;
    ActionAdd.Caption                := Un_R_file_Alex.MY_BUTTON_ADD;
    ActionExit.Caption               := Un_R_file_Alex.MY_BUTTON_CLOSE;
    ActionChange.Caption             := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionDelete.Caption             := Un_R_file_Alex.MY_BUTTON_DELETE;
    ActionRefresh.Caption            := Un_R_file_Alex.MY_BUTTON_REFRESH;
    ActionCancel.Caption             := Un_R_file_Alex.N_AUTOKOD_FORM_CANCLE;
    ToolButton6.Caption              := Un_R_file_Alex.MY_BUTTON_PRINT;
    ActionPrint.Caption              := Un_R_file_Alex.KASSA_PRINT_OLD_ORDER;
    ActionPtintVedomost.Caption      := Un_R_file_Alex.KASSA_PRINT_VEDOM;
    APrintBlankClear.Caption         := 'Друк бланка суворої відповідальності (тількі данні)';
    APrintBlank.Caption              := 'Друк у вигляді бланка суворої відповідальності (копія)';
    ActionPrintMonitor.Caption       := 'Друк без перегляду';
    ActionPrint2009.Caption          := 'Касовий ордер 2009р. (бланк суворої відповідальності)';
    ActionPrint2009neW1.Caption      := 'Касовий ордер 2009р. на А5 книж. (постанова НБУ №252)';
    ActionPrint2009forA41.Caption    := 'Касовий ордер 2009р. на А4 (постанова НБУ №252)';
    ActionPrintVedomost2009.Caption  := 'Друк відомості (постанова НБУ №252)';
    ActionPrintNBU252_albom.Caption  := 'Касовий ордер 2009р. на А5 альбом.(постанова НБУ №252)';
    ActionPrintDonNUETA4.Caption     := 'Касовий ордер 2014р. на А4';

    cxLabel1.Caption               := Un_R_file_Alex.KASSA_DOC_KASSA;
    cxLabel2.Caption               := Un_R_file_Alex.KASSA_DOC_DAY;
    cxLabel3.Caption               := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxLabel4.Caption               := Un_R_file_Alex.KASSA_QUECKLY_FIND_FIO;
    cxLabel5.Caption               := Un_R_file_Alex.KASSA_QUECKLY_FIND_FIO;
    cxLabel6.Caption               := Un_R_file_Alex.KASSA_INPUT_BARCODE;

    cxGrid1DBBandedTableView1.Bands.Items[0].Caption              := '';
    cxGrid1DBBandedTableView1.Bands.Items[1].Caption              := Un_R_file_Alex.KASSA_DOC_PRIHOD;
    cxGrid1DBBandedTableView1.Bands.Items[2].Caption              := Un_R_file_Alex.KASSA_DOC_RASHOD;
    cxGrid1DBBandedTableView1.Bands.Items[3].Caption              := '';

    cxGrid1DBBandedTableView1DBBandedColumn1.Caption              := Un_R_file_Alex.KASSA_DOC_NUMBER;
    cxGrid1DBBandedTableView1DBBandedColumn2.Caption              := Un_R_file_Alex.KASSA_DOC_FIO;
    cxGrid1DBBandedTableView1DBBandedColumn3.Caption              := Un_R_file_Alex.KASSA_DOC_SUM_VIP;
    cxGrid1DBBandedTableView1DBBandedColumn4.Caption              := Un_R_file_Alex.KASSA_DOC_SUM_VIP;
    cxGrid1DBBandedTableView1DBBandedColumn6.Caption              := Un_R_file_Alex.KASSA_SCH_KOR_SHORT;
    cxGrid1DBBandedTableView1DBBandedColumn9.Caption              := Un_R_file_Alex.KASSA_DOC_SUM_PROV;
    cxGrid1DBBandedTableView1DBBandedColumn10.Caption             := Un_R_file_Alex.KASSA_DOC_SUM_PROV;

    dxStatusBar1.Panels[0].Text                  := 'Ins - ' + Un_R_file_Alex.MY_BUTTON_ADD ;
    dxStatusBar1.Panels[1].Text                  := 'F2 - '  + Un_R_file_Alex.MY_BUTTON_EDIT;
    dxStatusBar1.Panels[2].Text                  := 'Del - ' + Un_R_file_Alex.MY_BUTTON_DELETE ;
    dxStatusBar1.Panels[4].Text                  := 'F5 - '  + Un_R_file_Alex.MY_BUTTON_REFRESH;
    dxStatusBar1.Panels[7].Text                  := 'Esc - ' + Un_R_file_Alex.MY_BUTTON_CLOSE;
    dxStatusBar1.Panels[5].Text                  := 'Ctrl+P - ' + Un_R_file_Alex.MY_ACTION_PRINT_CONST;
    dxStatusBar1.Panels[6].Text                  := 'Shift+P - ' + Un_R_file_Alex.MY_ACTION_PRINT_PRN;
    dxStatusBar1.Panels[3].Text                  := 'F3 - ' + Un_R_file_Alex.MY_ACTION_SHOW;
    cxCheckBoxRefr.Properties.Caption            := Un_R_file_Alex.KASSA_TAKE_REFRESH;

    ActionMakeAllDoc.Caption    := Un_R_file_Alex.KASSA_DOC_ZAPIS_V_ALL_DOC;
    ActionVozvrat.Caption       := Un_R_file_Alex.KASSA_DOC_VOZVRAT_V_BUFF;
//    DataSetUnderVetka.SQLs.SelectSQL.Text := 'select * from MAT_SP_AUTOKOD_UNDER_VETKA(?ID_VETKA)';
//    DataSetVetka.SQLs.SelectSQL.Text := 'SELECT * FROM MAT_SP_AUTOKOD_SELECT_VETKA(?ID_VETKA)';

    DataSetKass.Database    := Database;
    DataSetKass.Transaction := Transaction;

    DataSetKorSch.Database    := Database;
    DataSetKorSch.Transaction := Transaction;

    pFIBDataSet_ini.Database    := Database;
    pFIBDataSet_ini.Transaction := Transaction;

    DataSetDay.Database    := Database;
    DataSetDay.Transaction := Transaction;

    DataSetMain.Database    := Database;
    DataSetMain.Transaction := Transaction;

    DataSetKorSch.Database    := Database;
    DataSetKorSch.Transaction := Transaction;

    DataSetVedom.Database    := Database;
    DataSetVedom.Transaction := Transaction;

    DataSet_ini_order.Database    := Database;
    DataSet_ini_order.Transaction := Transaction;

    DataSet_ini_perm.Database    := Database;
    DataSet_ini_perm.Transaction := Transaction;

    DataSetSysData.Database    := Database;
    DataSetSysData.Transaction := Transaction;

    Transaction.StartTransaction;

    DataSetKass.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SP_KASS';
    DataSetKass.Open;
    DataSetKass.FetchAll;

    SetLength(IndKassa, Datasetkass.RecordCount);
    DataSetKass.First;

    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Buhg_prov','Belong');
    if error <> 0 then
    begin
        cxCheckBoxRefr.Checked := false;
    end else
        cxCheckBoxRefr.Checked := true;

    cxComboBoxKassa.Properties.Items.Clear;
    i := 0;
    while not DatasetKass.Eof do
    begin
        IndKassa[DataSetKass.RecNo - 1] := DataSetKass['ID_SP_KASS'];
        if DataSetKass['ID_SP_KASS'] = myclass.id_kas then
        BEGIN
            i        := DataSetKass.RecNo - 1;
            id_kassa := DataSetKass['ID_SP_KASS'];
        end;
        cxComboBoxKassa.Properties.Items.Insert(DataSetKass.RecNo - 1, DataSetKass['SHORT_NAME_KASS']);
        DataSetKass.Next;
    end;
    cxComboBoxKassa.ItemIndex := i;

    pFIBDataSet_ini.Close;
    pFIBDataSet_ini.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_INI';
    pFIBDataSet_ini.Open;

    DataSet_ini_order.Close;
    DataSet_ini_order.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_ORDER';
    DataSet_ini_order.Open;

    DataSetSysData.Close;
    DataSetSysData.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SYS_DATA';
    DataSetSysData.Open;

    while not DataSet_ini_order.Eof do
    begin
        if (inttostr(DataSet_ini_order.FieldByName('ID_SHABLON_ORDER').AsInteger)='1') and (inttostr(DataSet_ini_order.FieldByName('SHOW_SHABLON_ORDER').AsInteger)='0') then APrintBlankClear.Visible := false;
        if (inttostr(DataSet_ini_order.FieldByName('ID_SHABLON_ORDER').AsInteger)='2') and (inttostr(DataSet_ini_order.FieldByName('SHOW_SHABLON_ORDER').AsInteger)='0') then APrintBlank.Visible := false;
        if (inttostr(DataSet_ini_order.FieldByName('ID_SHABLON_ORDER').AsInteger)='3') and (inttostr(DataSet_ini_order.FieldByName('SHOW_SHABLON_ORDER').AsInteger)='0') then ActionPtintVedomost.Visible := false;
        if (inttostr(DataSet_ini_order.FieldByName('ID_SHABLON_ORDER').AsInteger)='4') and (inttostr(DataSet_ini_order.FieldByName('SHOW_SHABLON_ORDER').AsInteger)='0') then ActionPrint.Visible := false;
        if (inttostr(DataSet_ini_order.FieldByName('ID_SHABLON_ORDER').AsInteger)='5') and (inttostr(DataSet_ini_order.FieldByName('SHOW_SHABLON_ORDER').AsInteger)='0') then ActionPrint2009.Visible := false;
        if (inttostr(DataSet_ini_order.FieldByName('ID_SHABLON_ORDER').AsInteger)='6') and (inttostr(DataSet_ini_order.FieldByName('SHOW_SHABLON_ORDER').AsInteger)='0') then ActionPrint2009new1.Visible := false;
        if (inttostr(DataSet_ini_order.FieldByName('ID_SHABLON_ORDER').AsInteger)='7') and (inttostr(DataSet_ini_order.FieldByName('SHOW_SHABLON_ORDER').AsInteger)='0') then ActionPrint2009forA41.Visible := false;
        if (inttostr(DataSet_ini_order.FieldByName('ID_SHABLON_ORDER').AsInteger)='8') and (inttostr(DataSet_ini_order.FieldByName('SHOW_SHABLON_ORDER').AsInteger)='0') then ActionPrintVedomost2009.Visible := false;
        if (inttostr(DataSet_ini_order.FieldByName('ID_SHABLON_ORDER').AsInteger)='9') and (inttostr(DataSet_ini_order.FieldByName('SHOW_SHABLON_ORDER').AsInteger)='0') then ActionPrintNBU252_albom.Visible := false;
        DataSet_ini_order.Next;
    end;

    predv_prov            := pFIBDataSet_ini.FieldByName('PREDVARIT_PROV').AsInteger;
    lang                  := pFIBDataSet_ini.FieldByName('LANG').AsInteger;
    flag_proverka_to_buff := pFIBDataSet_ini.FieldByName('MAKE_PROVERKA').AsInteger;
    try dont_delete_doc   := pFIBDataSet_ini.FieldByName('DONT_DEL_ALL_DOC').AsInteger except dont_delete_doc := 0 end;
    id_user               := myclass.id_user;

    if  DataSetSysData.FieldByName('CN_PREFIKS_BARCODE').Value = null then
        cn_barcode := '98' else cn_barcode            := DataSetSysData.FieldByName('CN_PREFIKS_BARCODE').AsString;

    if  DataSetSysData.FieldByName('ST_PREFIKS_BARCODE').Value = null then
        st_barcode := '97' else st_barcode            := DataSetSysData.FieldByName('ST_PREFIKS_BARCODE').AsString;

        id_server            := DataSetSysData.FieldByName('ID_SERVER').AsString;

    if  pFIBDataSet_ini.FieldByName('BARCODE_PRIH').Value = null then
        barcode_prih := 2 else
        barcode_prih := pFIBDataSet_ini.FieldByName('BARCODE_PRIH').AsInteger;

    if  pFIBDataSet_ini.FieldByName('USE_BARCODE').Value = null then
        use_barcode := 0 else
        use_barcode := pFIBDataSet_ini.FieldByName('USE_BARCODE').AsInteger;

//    ActionMakeAllDoc.Caption := '';
    if predv_prov = 0 then
    begin
        ActionMakeAllDoc.Enabled := true;
        ActionMakeAllDoc.Visible := false;
        ActionVozvrat.Enabled    := true;
        ActionVozvrat.Visible    := false;
        ToolButton8.Visible      := false;
        cxGrid1DBBandedTableView1DBBandedColumn3.Visible := false;
        cxGrid1DBBandedTableView1DBBandedColumn4.Visible := false;
    end;


{    DataSetDay.Database := Database; долго выполняется пока за ненадобностью закомитил
    DataSetDay.Transaction := Database.DefaultTransaction;
    DataSetDay.Transaction.StartTransaction;
    DataSetDay.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_DAY_FOR_KASSA('+IntTostr(myclass.id_kas)+', '''+ DateToStr(IncYear(Date, -1)) +''', '''+DateToStr(Date)+''')';
    DataSetDay.open;
    DataSetDay.FetchAll;

    SetLength(IndDay, DatasetDay.RecordCount);
    DataSetDay.First;

    cxComboBoxDay.Properties.Items.Clear;
    j := 0;
    while not Datasetday.Eof do
    begin
        IndDay[DataSetDay.RecNo - 1] := DataSetDay['ID_DT_DAY'];
        if DataSetDay.FieldByName('ID_DT_DAY').AsVariant = myclass.id_d then
        begin
            j := DataSetDay.RecNo - 1;
            id_day := DataSetDay['ID_DT_DAY'];
        end;
        cxComboBoxDay.Properties.Items.Insert(DataSetDay.RecNo - 1, DataSetDay.fieldByName('DAY_KASSA').Value);
        DataSetDay.Next;
    end;

    cxComboBoxDay.ItemIndex := j;}
    id_day                 := myclass.id_d;
    DataSetDay.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_DT_DAY where ID_DT_DAY='+IntTostr(myclass.id_d)+'';
    DataSetDay.open;
    cxComboBoxDay.Properties.Items.Clear;
    cxComboBoxDay.Properties.Items.Insert(0, DataSetDay.fieldByName('DAY_KASSA').Value);
    cxComboBoxDay.ItemIndex := 0;

    DataSetMain.Close;
    DataSetMain.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_DOC_ROM_DAY('+IntToStr(myclass.id_d)+')';
    DataSetMain.Open;

    if myclass.id_doc_ > 0 then
    begin
        DataSetMain.Locate('ID_DT_DOC', myclass.id_doc_, []);
        cxGrid1DBTableView1DblClick(Self);
    end else
    begin
        DataSetMain.Last;
    end;

    pFIBDataSet_ini.Close;
    pFIBDataSet_ini.SQLs.SelectSQL.Text := 'SELECT max(DAY_KASSA) as DAY_KASSA_MAX FROM KASSA_DT_DAY WHERE ID_SP_KASS='+IntToStr(id_kassa)+'';
    pFIBDataSet_ini.Open;
    day_kassa_max := pFIBDataSet_ini.FieldByName('DAY_KASSA_MAX').AsDateTime;
    barstr          := '';
    shablon_barcode := '';
    show_print := 1;
end;

procedure TfmKassaDocMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
    begin
        Action := caFree;
        myclass.Free;
    end;
end;

procedure TfmKassaDocMainForm.ActionExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmKassaDocMainForm.ActionRefreshExecute(Sender: TObject);
begin
    DataSetMain.CloseOpen(true);
    cxGrid1DBBandedTableView1.Controller.GoToLast(false);
end;

procedure TfmKassaDocMainForm.ActionAddExecute(Sender: TObject);
var
    T : TfmKassOrder;
    prih, f_nds_ask_s : smallInt;
    f_pri, f_ra, f_def_f_z, f_sys_z, f_vis_z, kod_z : integer;
    id_oper_z, id_sc_z, id_sm_z, id_st_z, id_razd_z, id_kekv_z, k_d, i_d, id_sch_s, id_pv_s, id_tf_s : int64;
    summa_dog, summ : double;
    error,errorP, errorR, errorday : integer;
    pv_kod_s, pv_title_s, tf_kod_s, tf_title_s, kod_sch_s, tytle_sch_s : string;
    inputDog : TDogInput;
    res   : TDogResult;
    rr : Variant;
begin
    barstr := '';
    flag_add_change := false;

    errorday := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Work_in_last_day','Belong');
    if errorday = 0 then
    begin
        if(day_kassa_max<>strtodate(cxComboBoxDay.Text)) then
        begin
            showmessage(Un_R_file_Alex.KASSA_CANT_ADD_DOC);
            exit;
        end;
    end;

    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Add');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;

    errorP := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Deny_prihod','Belong');
    errorR := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Deny_rashod','Belong');
    if (errorP = 0) and (errorR = 0) then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(errorP)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end else
    begin
    if errorP = 0 then prih := 0 else
    if errorR = 0 then prih := 1 else

    if Show_fmPrihod(barstr, shablon_barcode, prih) then prihod := prih;
    end;
    begin

         i_d  := -2;
         k_d  := -2;
         if Show_Shablon(Database, Transaction , prih, id_oper_z, id_sc_z, id_sm_z, id_st_z, id_razd_z, id_kekv_z, f_pri, f_ra, f_def_f_z, f_sys_z, f_vis_z, kod_z, name_z, KOD_SCH_DEFAULT, TITLE_SCH_DEFAULT, summ, note, nds, i_d, k_d, f_nds_ask_s)=true then
         begin
              id_dog_umol  := i_d;
              //showmessage(inttostr(i_d));
              kod_dog_umol := k_d;
              prihod       := prih;
              id_operation := id_oper_z;
              id_sch       := id_sc_z;
              id_smeta     := id_sm_z;
              id_razdel    := id_razd_z;
              id_kekv_oper := id_kekv_z;
              flag_prih    := f_pri;
              flag_ras     := f_ra;
              flag_def_f   := f_def_f_z;
              flag_sys     := f_sys_z;
              flag_vis     := f_vis_z;
              kodShab      := kod_z;
              id_stat      := id_st_z;
              sum          := summ;
              nds_pr       := nds;
              nds_ask_s    := f_nds_ask_s;

              if kod_z = 90 then {ДОГОВОРА}
              begin
                  if SelectDogovor then
                  begin
                      T := TfmKassOrder.Create(self, myclass, AddOrder, self, SDog);
                      T.ShowModal;
                      T.Free;
                      exit;
                  end else
                  begin
                      exit;
                  end;
              end;
              if kod_z = 215 then
              begin
                T := TfmKassOrder.Create(self, myclass, AddOrder, self, Nich);
                T.ShowModal;
                T.Free;
                exit;
              end;
              if kod_z = 50 then {Рома Женя за обучение}
              begin
                  T := TfmKassOrder.Create(self, myclass, AddOrder, self, DogRJ);
                  T.ShowModal;
                  T.Free;
                  exit;
              end;
              if kod_z = 51 then {новые договора за обучение}
              begin
                  if DogZaObuchNew then
                  begin
                      T := TfmKassOrder.Create(self, myclass, AddOrder, self, DogTritiesNew);
                      T.ShowModal;
                      T.Free;
                  end else
                  begin
                  end;
                  exit;
              end;
              if kod_z = 70 then {студгородок}
              begin
                  T := TfmKassOrder.Create(self, myclass, AddOrder, self, Stud);
                  T.ShowModal;
                  T.Free;
                  exit;
              end;
              if kod_z = 41 then {Коммандировка}
              begin
                  DecimalSeparator     := ',';
                  summa_dog := 0;
                  nds_ask_s :=0;
                  if Show_Summa_Kassa(nds_ask_s,summa_dog, name_z) then
                  begin
                      TransactionWr.DefaultDatabase := Database;
                      LoadSysData(Transaction);
                      inputDog.Owner        := self;
                      inputDog.DBHandle     := database.Handle;
                          inputDog.WriteTrans   := TransactionWr.Handle;
                          inputDog.ReadTrans    := Transaction.Handle;
                          inputDog.FormStyle    := fsNormal;
                          inputDog.Summa        := summa_dog;
  //                          inputDog.id_Group     := 61499;
  //                          inputDog.id_Group_add := 61599;
                          SYS_ID_USER          := myclass.id_user;
                          inputDog.id_Group    := 1399;
                          inputDog.id_group_add := 2599;
                          SYS_CURRENT_DATE  := StrToDate(cxComboBoxDay.Text);


  {                          LoadSysData(Transaction);
                          inputDog             := SYS_DEFAULT_DOG_INPUT;
                          inputDog.Owner       := self;
                          inputDog.DBHandle    := Database.Handle;
                          inputDog.WriteTrans  := TransactionWr.Handle;
                          inputDog.ReadTrans   := Transaction.Handle;
                          inputDog.FormStyle   := fsNormal;
                          inputDog.SUmma       := summa_dog;
                          inputDog.id_Group    := 61499;
                          inputDog.id_group_add := 61599;
                          inputDog.filter.bShowFilterForm := true;
                          inputDog.isZayav     := false;
                          inputDog.arndGetPay  := 1;
                          inputDog.shablon_data.bUse := true;
                          inputDog.shablon_data.num  := 'б\н';
                          inputDog.shablon_data.date_dog           := StrToDate(cxComboBoxDay.Text);
                          inputDog.filter.DateBeg                  := IncDay(StrToDate(cxComboBoxDay.Text), -730);
                          inputDog.filter.DateEnd                  := StrToDate(cxComboBoxDay.Text);
                          inputDog.filter.bUseFilter               := true;
                          inputDog.filter.bDate                    := true;
                          inputDog.shablon_data.note               := '';
                          inputDog.shablon_data.summa              := summa_dog;
                          inputDog.shablon_data.id_rate_account    := 0;
                          inputDog.shablon_data.id_rate_acc_native := 0;
                          inputDog.filter.bRegNum := false;
                          inputDog.filter.bSumma  := true;
                          inputDog.filter.SummaFrom := summa_dog;
                          inputDog.filter.SummaTo   := summa_dog;
                          inputDog.filter.bNameCust := false;
                          inputDog.filter.bTipdog   := false;

                          SYS_ID_USER          := myclass.id_user;
  }                          res := ShowDogMain(inputDog);
                          if res.ModalResult = 1 then
                          begin
                              DecimalSeparator := ',';
                              DogParam := res;
                              T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, Komm);
                              T.ShowModal;
                              T.Free;
                              exit;
                          end;
                          end else
                          begin
                              exit;
                          end;
                   exit;
              end;

              if kod_z = 20 then {за регистрацию общаги}
              begin
                  summa_dog := summ;
                  if Show_Summa_K(summa_dog, name_z) then
                  begin
                      DogParam.summa := summa_dog;
                      T := TfmKassOrder.Create(self, myclass, AddOrder, self, OPL_OB);
                      T.ShowModal;
                      T.Free;
                  end;
                      exit;
              end;

              if kod_z = 22 then
              begin {Квартплата}
                  summa_dog := summ;
                  if Show_Summa_K(summa_dog, name_z) then
                  begin
                      DogParam.summa := summa_dog;
                      T := TfmKassOrder.Create(self, myclass, AddOrder, self, Kv_Pl);
                      T.ShowModal;
                      T.Free;
                  end;
                      exit;
              end;
              if kod_z = 11 then
              begin {сдача наличности в банк}
  //                  if Show_Ostatok(self, TRecProvodka, self) then
                  DataSetKOdSys.Close;
                  DataSetKOdSys.Sqls.SelectSQL.Text := 'select * from PUB_SP_SYSTEM where kod_sys='+IntToStr(2)+'';
                  DataSetKOdSys.Open;
                  rr := GlobalSpr.GetSch(self, Database.Handle, fsNormal, StrToDAte(cxComboBoxDay.Text), 1, DataSetKOdSys.FieldByName('ID_SYSTEM').AsVariant, -1);
                  if VarArrayDimCount(Rr)>0 then
                  begin
                      id_sch_kor_sdacha    := RR[0][0];
                      kod_sch_kor_sdacha   := RR[0][3];
                      tytle_sch_kor_sdacha := RR[0][1];
                      T := TfmKassOrder.Create(self, myclass, AddOrder, self, Sdacha_deneg);
                      T.ShowModal;
                      T.Free;
                  end;
                      exit;
                  DataSetKOdSys.Close;
                  exit;
              end;

              if kod_z = 12 then
              begin {сдача наличности в банк новый алгоритм}
  //                  if Show_Ostatok(self, TRecProvodka, self) then
                  DataSetKOdSys.Close;
                  DataSetKOdSys.Sqls.SelectSQL.Text := 'select * from PUB_SP_SYSTEM where kod_sys='+IntToStr(2)+'';
                  DataSetKOdSys.Open;
                  rr := GlobalSpr.GetSch(self, Database.Handle, fsNormal, StrToDAte(cxComboBoxDay.Text), 1, DataSetKOdSys.FieldByName('ID_SYSTEM').AsVariant, -1);
                  if VarArrayDimCount(Rr)>0 then
                  begin
                      id_sch_kor_sdacha    := RR[0][0];
                      kod_sch_kor_sdacha   := RR[0][3];
                      tytle_sch_kor_sdacha := RR[0][1];
                      T := TfmKassOrder.Create(self, myclass, AddOrder, self, Sdacha_deneg_new);
                      T.ShowModal;
                      T.Free;
                  end;
                      exit;
                  DataSetKOdSys.Close;
                  exit;
              end;

              if kod_z = 14 then
              begin {сдача наличности в банк новый алгоритм}
  //                  if Show_Ostatok(self, TRecProvodka, self) then
                  DataSetKOdSys.Close;
                  DataSetKOdSys.Sqls.SelectSQL.Text := 'select * from PUB_SP_SYSTEM where kod_sys='+IntToStr(2)+'';
                  DataSetKOdSys.Open;

                  if SelectPvkTypeFin(self,self, id_sch_s, id_pv_s, id_tf_s,pv_kod_s, pv_title_s, tf_kod_s, tf_title_s, kod_sch_s, tytle_sch_s) then
                  begin
                      id_sch_kor_sdacha    := id_sch_s;
                      kod_sch_kor_sdacha   := kod_sch_s;
                      tytle_sch_kor_sdacha := tytle_sch_s;
                      id_pkv               := id_pv_s;
                      id_tpfin             := id_tf_s;
                      T := TfmKassOrder.Create(self, myclass, AddOrder, self, Sdacha_deneg_new_pkv_fin);
                      T.ShowModal;
                      T.Free;
                  end;
                      exit;
                  DataSetKOdSys.Close;
                  exit;
              end;

              if kod_z = 42 then
              begin {ведомости между четверкой и кассой Днепр}
                  if Show_Ostatok(self, RecProv, self) then
                  if RecProv.result = 1 then
                  begin
                      T := TfmKassOrder.Create(self, myclass, AddOrder, self, vedomost);
                      T.ShowModal;
                      T.Free;
                  end;
                      exit;
              end;

              if kod_z = -1 then
              begin
                  T := TfmKassOrder.Create(self, myclass, AddOrder, self, NoDog);
                  T.ShowModal;
                  T.Free;
                  exit;
              end;

              if(nds_ask_s=1) then
              begin
                  summa_dog := summ;
                  if Show_Summa_Kassa(nds_ask_s, summa_dog, name_z) then
                  begin
                      sum := summa_dog;
                      T := TfmKassOrder.Create(self, myclass, AddOrder, self, other_shablon);
                      T.ShowModal;
                      T.Free;
                  end;
                  exit;
              end;

              T := TfmKassOrder.Create(self, myclass, AddOrder, self, other_shablon);
              T.ShowModal;
              T.Free;

         end;
    end;
end;

procedure TfmKassaDocMainForm.ActionChangeExecute(Sender: TObject);
var
    T : TfmKassOrder;
    error,er, errorday, erroredit : integer;
    e : boolean;
    id : int64;
begin
    errorday := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Work_in_last_day','Belong');
    if errorday = 0 then
    begin
        if(day_kassa_max<>strtodate(cxComboBoxDay.Text)) then
        begin
            showmessage(Un_R_file_Alex.KASSA_CANT_EDIT_DOC);
            exit;
        end;
    end;
    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;
    flag_add_change := false;
    if not DataSetMain.IsEmpty then
    begin
        id := StrToInt64(DataSetMain.FBN('ID_DT_DOC').AsString);

        erroredit := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Deny_edit_buhg','Belong');
        if erroredit = 0 then
        begin
             showmessage(Un_R_file_Alex.KASSA_CANT_EDIT_DOC);
             exit;
        end
        else
        begin
            er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Buhg_prov_own','Belong');
            if er = 0 then
            begin
                 pFIBDataSet_ini.Close;
                 pFIBDataSet_ini.SQLs.SelectSQL.Text := 'SELECT ID_USER_PO_BUHG as ID_USER_PO_BUHG FROM KASSA_DT_DOC WHERE ID_DT_DOC='+IntToStr(id)+'';
                 pFIBDataSet_ini.Open;

                 if(pFIBDataSet_ini.FieldByName('ID_USER_PO_BUHG').AsVariant<>null) then
                 begin
                     if(StrToInt64(pFIBDataSet_ini.FieldByName('ID_USER_PO_BUHG').AsString)<>id_user) then
                     begin
                         showmessage(Un_R_file_Alex.KASSA_CANT_EDIT_DOC);
                         exit;
                      end;
                 end;
            end;
        end;
        error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Edit');
        if error <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
            exit;
        end;
        prihod       := DataSetMain['PRIHOD_RASHOD'];
        id_operation := DataSetMainID_OPERATION.AsInt64;
        T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, NoDog);
        T.ShowModal;
        T.Free;
    end;
    if e then cxCheckBoxRefr.Checked := true;
end;

procedure TfmKassaDocMainForm.ActionPrintMonitorExecute(Sender: TObject);
var
    month, day, year : integer;
    year_l, month_l, day_l, mon, n, s, v, d : string;
    date_day : TDate;
    e : boolean;
begin
    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;

    date_day := StrToDate(cxComboBoxDay.Text);
    year := YearOf(date_day);
    frVariables['year_r']  := year;
    year := year mod 100;
    year_l := IntToStr(year);
    if length(year_l) = 1 then year_l := '0' + year_l;

    month := MonthOf(date_day);
    case month of
        1 : mon  :='січень';
        2 : mon  :='лютий';
        3 : mon  :='березень';
        4 : mon  :='квітень';
        5 : mon  :='травень';
        6 : mon  :='червень';
        7 : mon  :='липень';
        8 : mon  :='серпень';
        9 : mon  :='вересень';
        10 : mon :='жовтень';
        11 : mon :='листопад';
        12 : mon :='грудень';
    end;
    month_l := IntToStr(month);
    if length(month_l) = 1 then month_l := '0' + month_l;

    day   := DayOf(date_day);
    day_l := IntToStr(day);
    if length(day_l) = 1 then day_l := '0' + day_l;

    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetKorSch.Open;


    frVariables['day']       := day_l;
    frVariables['month']     := month_l;
    frVariables['month_l']   := mon;
    frVariables['year']      := year_l;
    frVariables['comp']      := QuotedStr(GetComputerNetName);
    frVariables['id_user']   := QuotedStr(IntToStr(myclass.id_user));
    frVariables['id_doc']    := QuotedStr(DataSetMain.FieldByName('ID_DT_DOC').AsString);
    //frVariables['okpo']      := DataSetKorSch.fieldByname('OKPO').AsString;
{    if DataSetKorSch.FieldByName('PRINT_PASPORT').AsInteger = 1 then
    begin
    if DataSetMain.FieldByName('NUMBER_PASS').AsString <> null
        then frVariables['num_pass']    := DataSetMain.FieldByName('NUMBER_PASS').AsString
        else frVariables['num_pass']    := ' ';
    if DataSetMain.FieldByName('SERIYA_PASS').AsString <> null
        then frVariables['ser_pass']    := DataSetMain.FieldByName('SERIYA_PASS').AsString
        else frVariables['ser_pass']    := ' ';
    if DataSetMain.FieldByName('VIDAN').AsString <> null
        then frVariables['vidan']    := DataSetMain.FieldByName('VIDAN').AsString
        else frVariables['vidan']    := ' ';
    if DataSetMain.FieldByName('DATE_VIDAN').AsDateTime <> null
        then frVariables['date_pass']    := DataSetMain.FieldByName('DATE_VIDAN').AsString
        else frVariables['date_pass']    := ' ';
    end;}

        frVariables['passp']    := ' ';
        if (DataSetKorSch.FieldByName('PRINT_PASPORT').AsInteger = 1) and (DataSetMain.FieldByName('ID_MAN').AsVariant > 0) and (DataSetMain['PRIHOD_RASHOD'] = 0) then
        begin
                if DataSetMain.FieldByName('NUMBER_PASS').AsString <> null
                    then n  := DataSetMain.FieldByName('NUMBER_PASS').AsString
                    else n  := ' ';
                if DataSetMain.FieldByName('SERIYA_PASS').AsString <> null
                    then s  := DataSetMain.FieldByName('SERIYA_PASS').AsString
                    else s  := ' ';
                if DataSetMain.FieldByName('VIDAN').AsString <> null
                    then v  := DataSetMain.FieldByName('VIDAN').AsString
                    else v  := ' ';
                if DataSetMain.FieldByName('DATE_VIDAN').AsDateTime <> null
                    then d  := DataSetMain.FieldByName('DATE_VIDAN').AsString
                    else d  := ' ';
            if n <> '' then
                if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_PRINT_PASS_DATA), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO and IDNO)=mrYes then
                begin
                    frVariables['passp'] := Un_R_file_Alex.KASSA_PASPORT+ s + ' № ' + n + Un_R_file_Alex.KASSA_VIDAN + v + Un_R_file_Alex.KASSA_OT + d;
                end;
        end;


    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_TO_PRINT_PRIH_RAS('''+DataSetMain.FieldByName('ID_DT_DOC').AsString+''')';
    DataSetKorSch.Open;

    IF DataSetKorSch.fieldByname('LANG').AsInteger = 1
        then frVariables['suma_prop'] := AllChislo(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat))
        else frVariables['suma_prop'] := AllChislo_ukr(DataSetMain.FieldByName('SUMMA_DOC').AsString);
    frVariables['kor_sch']   := QuotedStr(DataSetMain.FieldByName('KOR_SCH').AsString);//DataSetKorSch.fieldByname('KOD_KOR_SCH').AsString;
    frVariables['sm_rz_st_k']:= DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString;
    frVariables['okpo']      := DataSetKorSch.fieldByname('OKPO').AsString;

    if DataSetMain['PRIHOD_RASHOD'] = 1 then
    begin
        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Prihod.frf');
        Report.PrepareReport;
             //Report.DesignReport;
    end;

    if DataSetMain['PRIHOD_RASHOD'] = 0 then
    begin
        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Rashod.frf');
        Report.PrepareReport;
//             Report.DesignReport;
    end;
    Report.PrintPreparedReport('1', 1, true, frAll);
    if e then cxCheckBoxRefr.Checked := true;
end;



procedure TfmKassaDocMainForm.ActionPrintExecute(Sender: TObject);
var
    month, day, year : integer;
    year_l, month_l, day_l, mon, n, s, v, d : string;
    id : int64;
    error, er : integer;
    print_pass : integer;
    e : boolean;
    hide_b_r_s_k : integer;
begin
    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;

    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Print');
    if error <> 0 then
    begin
        er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Print_ord2008','Print');
        if er <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(er)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end;

    if DataSetMain.IsEmpty then exit;

    id := TFIBBCDField(DataSetMain.FieldByName('ID_DT_DOC')).AsInt64;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetKorSch.Open;
    print_pass := DataSetKorSch.FieldByName('PRINT_PASPORT').AsInteger;
    if(DataSetKorSch['HIDE_B_RZ_ST_KEKV']<>null) then
        hide_b_r_s_k := DataSetKorSch.FieldByName('HIDE_B_RZ_ST_KEKV').AsInteger
    else
        hide_b_r_s_k := 0;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_TO_PRINT_PRIH_RAS('''+DataSetMain.FieldByName('ID_DT_DOC').AsString+''')';
    DataSetKorSch.Open;

        DataSetDay.Locate('ID_DT_DAY', id_day, []);

        year := YearOf(DataSetDay['DAY_KASSA']);
        frVariables['year_r']  := year;
        year := year mod 100;
        year_l := IntToStr(year);
        if length(year_l) = 1 then year_l := '0' + year_l;

        month := MonthOf(DataSetDay['DAY_KASSA']);
        case month of
            1 : mon  :='січень';
            2 : mon  :='лютий';
            3 : mon  :='березень';
            4 : mon  :='квітень';
            5 : mon  :='травень';
            6 : mon  :='червень';
            7 : mon  :='липень';
            8 : mon  :='серпень';
            9 : mon  :='вересень';
            10 : mon :='жовтень';
            11 : mon :='листопад';
            12 : mon :='грудень';
        end;
        month_l := IntToStr(month);
        if length(month_l) = 1 then month_l := '0' + month_l;

        day   := DayOf(DataSetDay['DAY_KASSA']);
        day_l := IntToStr(day);
        if length(day_l) = 1 then day_l := '0' + day_l;

    if DataSetKorSch['PREDPRIYATIE'] = 0 then
    begin

        frVariables['day']       := day_l;
        frVariables['month']     := month_l;
        frVariables['month_l']   := mon;
        frVariables['year']      := year_l;
        IF DataSetKorSch.fieldByname('LANG').AsInteger = 1
            then frVariables['suma_prop'] := AllChislo(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat))
            else frVariables['suma_prop'] := AllChislo_ukr(DataSetMain.FieldByName('SUMMA_DOC').AsString);
        frVariables['kor_sch']   := QuotedStr(DataSetMain.FieldByName('KOR_SCH').AsString);//DataSetKorSch.fieldByname('KOD_KOR_SCH').AsString;
        frVariables['sm_rz_st_k']:= DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString;
        frVariables['okpo']      := DataSetKorSch.fieldByname('OKPO').AsString;
        frVariables['comp']      := QuotedStr(GetComputerNetName);
        frVariables['id_user']   := QuotedStr(IntToStr(myclass.id_user));
        frVariables['id_doc']    := QuotedStr(DataSetMain.FieldByName('ID_DT_DOC').AsString);

        frVariables['passp']    := ' ';
        if (print_pass = 1) and (DataSetMain.FieldByName('ID_MAN').AsVariant > 0) and (DataSetMain['PRIHOD_RASHOD'] = 0) then
        begin
                if DataSetMain.FieldByName('NUMBER_PASS').AsString <> null
                    then n  := DataSetMain.FieldByName('NUMBER_PASS').AsString
                    else n  := ' ';
                if DataSetMain.FieldByName('SERIYA_PASS').AsString <> null
                    then s  := DataSetMain.FieldByName('SERIYA_PASS').AsString
                    else s  := ' ';
                if DataSetMain.FieldByName('VIDAN').AsString <> null
                    then v  := DataSetMain.FieldByName('VIDAN').AsString
                    else v  := ' ';
                if DataSetMain.FieldByName('DATE_VIDAN').AsDateTime <> null
                    then d  := DataSetMain.FieldByName('DATE_VIDAN').AsString
                    else d  := ' ';
            if n <> '' then
                if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_PRINT_PASS_DATA), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO and IDNO)=mrYes then
                begin
                    frVariables['passp'] := Un_R_file_Alex.KASSA_PASPORT+ s + ' № ' + n + Un_R_file_Alex.KASSA_VIDAN + v + Un_R_file_Alex.KASSA_OT + d;
                end;
        end;
        if DataSetMain['PRIHOD_RASHOD'] = 1 then
        begin
                 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Prihod.frf');
                 Report.PrepareReport;
                 //Report.ShowReport;
                  if show_print=1 then
                  begin
                      Report.ShowPrintDialog   := true;
                      Report.ShowReport;
                  end else
                  begin
                      Report.PrintPreparedReport(IntTostr(1),1,true,frAll);
                  end;
                 
        end;

        if DataSetMain['PRIHOD_RASHOD'] = 0 then
        begin
                 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Rashod.frf');
                 Report.PrepareReport;
                 //Report.ShowReport;

                  if show_print=1 then
                  begin
                      Report.ShowPrintDialog   := true;
                      Report.ShowReport;
                  end else
                  begin
                      Report.PrintPreparedReport(IntTostr(1),1,true,frAll);
                  end;
        end;
    end;
    if DataSetKorSch['PREDPRIYATIE'] = 1 then
    begin
        if DataSetMain['PRIHOD_RASHOD'] = 1 then
        begin
            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10002.fr3');
            frxReport1.PrintOptions.Copies := 1;
        end;
        if DataSetMain['PRIHOD_RASHOD'] = 0 then
        begin
            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10001.fr3');
            frxReport1.PrintOptions.Copies := 1;
        end;
        frxReport1.Variables['day_']   := QuotedStr(day_l);
        frxReport1.Variables['month_'] := QuotedStr(month_l);
        frxReport1.Variables['mon']    := QuotedStr(mon);
        frxReport1.Variables['year_']  := QuotedStr(year_l);
        frxReport1.Variables['y']      := QuotedStr(IntToStr(year));
        frxReport1.Variables['s']      := QuotedStr(DataSetMain.FieldByName('SUMMA_DOC').AsString);
        frxReport1.Variables['n']      := QuotedStr(DataSetMain.FieldByName('NUMBER_DOC').AsString);
        frxReport1.Variables['o']      := QuotedStr(DataSetMain.FieldByName('OSNOVANIE').AsString);
        frxReport1.Variables['f']      := QuotedStr(DataSetMain.FieldByName('FIO').AsString);
        frxReport1.Variables['okpo']   := QuotedStr(DataSetKorSch.fieldByname('OKPO').AsString);
        frxReport1.Variables['comp']   := QuotedStr(GetComputerNetName);
        frxReport1.Variables['id_user']   := QuotedStr(IntToStr(myclass.id_user));
        frxReport1.Variables['hide_info'] := QuotedStr(IntToStr(hide_b_r_s_k));
        IF DataSetKorSch.FieldByName('LANG').AsInteger = 1
            then frxReport1.Variables['suma_prop'] := QuotedStr(AllChislo(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)))
            else frxReport1.Variables['suma_prop'] := QuotedStr(AllChislo_ukr(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)));
        frxReport1.Variables['name_pred']  := QuotedStr(DataSetKorSch.fieldByname('NAME_PREDPR').AsString);
        frxReport1.Variables['kor_sch']    := QuotedStr(DataSetMain.FieldByName('KOR_SCH').AsString);//QuotedStr(DataSetKorSch.fieldByname('KOD_KOR_SCH').AsString);
        frxReport1.Variables['sm_rz_st_k'] := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport1.PrintOptions.Copies := 1;
//        frxReport1.PrintOptions.
        frxReport1.PrepareReport;
        //frxReport1.ShowReport(true);
        if show_print=1 then
        begin
            frxReport1.PrintOptions.ShowDialog   := true;
            frxReport1.ShowReport(true);
        end else
        begin
            frxReport1.Print;
        end;
    end;
    if DataSetKorSch['PREDPRIYATIE'] = 2 then
    begin
        if DataSetMain['PRIHOD_RASHOD'] = 1 then
        begin
            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Prihod_ukr.fr3');
            frxReport1.PrintOptions.Copies := 1;
        end;
        if DataSetMain['PRIHOD_RASHOD'] = 0 then
        begin
            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Rashod_ukr.fr3');
            frxReport1.PrintOptions.Copies := 1;
        end;
        frxReport1.Variables['day_']   := QuotedStr(day_l);
        frxReport1.Variables['month_'] := QuotedStr(month_l);
        frxReport1.Variables['mon']    := QuotedStr(mon);
        frxReport1.Variables['year_']  := QuotedStr(year_l);
        frxReport1.Variables['y']      := QuotedStr(IntToStr(year));
        frxReport1.Variables['s']      := QuotedStr(DataSetMain.FieldByName('SUMMA_DOC').AsString);
        frxReport1.Variables['n']      := QuotedStr(DataSetMain.FieldByName('NUMBER_DOC').AsString);
        frxReport1.Variables['o']      := QuotedStr(DataSetMain.FieldByName('OSNOVANIE').AsString);
        frxReport1.Variables['f']      := QuotedStr(DataSetMain.FieldByName('FIO').AsString);
        frxReport1.Variables['okpo']   := QuotedStr(DataSetKorSch.fieldByname('OKPO').AsString);
        frxReport1.Variables['comp']   := QuotedStr(GetComputerNetName);
        frxReport1.Variables['id_user']   := QuotedStr(IntToStr(myclass.id_user));
        IF DataSetKorSch.FieldByName('LANG').AsInteger = 1
            then frxReport1.Variables['suma_prop'] := QuotedStr(AllChislo(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)))
            else frxReport1.Variables['suma_prop'] := QuotedStr(AllChislo_ukr(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)));
        frxReport1.Variables['name_pred']  := QuotedStr(DataSetKorSch.fieldByname('NAME_PREDPR').AsString);
        frxReport1.Variables['kor_sch']    := QuotedStr(DataSetMain.FieldByName('KOR_SCH').AsString);//QuotedStr(DataSetKorSch.fieldByname('KOD_KOR_SCH').AsString);
        frxReport1.Variables['sm_rz_st_k'] := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport1.PrintOptions.Copies := 1;
//        frxReport1.PrintOptions.
        frxReport1.PrepareReport;
        //frxReport1.ShowReport(true);
        if show_print=1 then
        begin
            frxReport1.PrintOptions.ShowDialog   := true;
            frxReport1.ShowReport(true);
        end else
        begin
            frxReport1.Print;
        end;
    end;
    DataSetKorSch.Close;
    DataSetMain.Locate('ID_DT_DOC', id, []);
    if e then cxCheckBoxRefr.Checked := true;
end;

procedure TfmKassaDocMainForm.ActionDeleteExecute(Sender: TObject);
var
    id_del, id_all_del, id_prev : int64;
    error, errorday : integer;
    e : boolean;
    ddd : TDate;
begin
    errorday := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Work_in_last_day','Belong');
    if errorday = 0 then
    begin
        if(day_kassa_max<>strtodate(cxComboBoxDay.Text)) then
        begin
            showmessage(Un_R_file_Alex.KASSA_CANT_DEL_DOC);
            exit;
        end;
    end;
    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;
    if not DataSetMain.IsEmpty then
    begin
        if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_DOC_DEL_NUM + datasetmain.FieldByName('NUMBER_DOC').AsString + Un_R_file_Alex.KASSA_DOC_DEL_FIO + datasetmain.FieldByName('FIO').AsString), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Del');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
            pFIBDataSet_ini.Close;
            pFIBDataSet_ini.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_DT_DAY WHERE ID_DT_DAY='+IntToStr(myclass.id_d)+'';
            pFIBDataSet_ini.Open;
            if pFIBDataSet_ini.FieldByName('BLOK_DEBET').AsInteger = 1 then
            begin
                ShowMessage(Un_R_file_Alex.KASSA_ERROR_DAY_CHANGE_OBOROT_DEB);
                exit;
            end;
            if pFIBDataSet_ini.FieldByName('BLOK_KREDIT').AsInteger = 1 then
            begin
                ShowMessage(Un_R_file_Alex.KASSA_ERROR_DAY_CHANGE_OBOROT_KRED);
                exit;
            end;
            pFIBDataSet_ini.Close;
            pFIBDataSet_ini.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SP_KASS WHERE ID_SP_KASS='+IntToStr(myclass.id_kas)+'';
            pFIBDataSet_ini.Open;
            if (pFIBDataSet_ini.FieldByName('BLOCK_SALDO_END').AsInteger = 1) and (pFIBDataSet_ini.FieldByName('DATE_BLOK_SALDO_END').AsdateTime >= StrToDate(cxComboBoxDay.Text)) then
            begin
                MessageBox(Handle, PChar(Un_R_file_Alex.KASSA_ERROR_DAY_SALDO_END + pFIBDataSet_ini.FieldByName('DATE_BLOK_SALDO_END').AsString), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
                exit;
            end;
            if (dont_delete_doc = 1) and (StrToInt64(DataSetMain.FBN('ID_ALL_DOC').AsString)>0) then
            begin
                showmessage(Un_R_file_Alex.KASSA_DONT_DEL_ALL_DOC[1]);
                exit;
            end;
            id_del     := datasetmain['ID_DT_DOC'];
            id_all_del := StrToInt64(datasetmain.FieldByName('ID_ALL_DOC').AsString);
            cxGrid1DBBandedTableView1.Controller.GoToPrev(false);
            id_prev    := datasetmain['ID_DT_DOC'];
            ddd        := StrToDate(cxComboBoxDay.Text);
            myclass.DeleteDoc(id_del, id_all_del, ddd);
            ActionRefreshExecute(Sender);
            datasetmain.Locate('ID_DT_DOC', id_prev, []);
        end;
    end;
    if e then cxCheckBoxRefr.Checked := true;
end;

procedure TfmKassaDocMainForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ActionShowExecute(Sender);
end;

function TfmKassaDocMainForm.SelectDogovor;
var
    summa_dog : double;
    inputDog : TDogInput;
    res   : TDogResult;
//    s : string;
//    res : TAlexDogResult;
//    inputDog : TAlexDogInput;
//    i, j : integer;
begin
    DecimalSeparator     := ',';
    summa_dog := 0;
    nds_ask_s :=0;
    if Show_Summa_Kassa(nds_ask_s,summa_dog, name_z) then
    begin
        SelectDogovor := true;
        TransactionWr.DefaultDatabase := Database;
        LoadSysData(Transaction);
        inputDog             := SYS_DEFAULT_DOG_INPUT;
        inputDog.Owner       := self;
        inputDog.DBHandle    := Database.Handle;
        inputDog.WriteTrans  := TransactionWr.Handle;
        inputDog.ReadTrans   := Transaction.Handle;
        inputDog.FormStyle   := fsNormal;
        inputDog.SUmma       := summa_dog;
        inputDog.id_Group    := 1399;
        inputDog.id_group_add := 2599;
        inputDog.filter.bShowFilterForm := true;
        inputDog.isZayav     := false;
        inputDog.arndGetPay  := 1;
        SYS_CURRENT_DATE  := StrToDate(cxComboBoxDay.Text);
        inputDog.shablon_data.bUse := true;
        inputDog.shablon_data.num  := 'б\н';
        inputDog.shablon_data.date_dog           := StrToDate(cxComboBoxDay.Text);
        inputDog.filter.DateBeg                  := IncDay(StrToDate(cxComboBoxDay.Text), -730);
        inputDog.filter.DateEnd                  := StrToDate(cxComboBoxDay.Text);
        inputDog.filter.bUseFilter               := true;
        inputDog.filter.bDate                    := true;
        inputDog.shablon_data.note               := '';
        inputDog.shablon_data.summa              := summa_dog;
        inputDog.shablon_data.id_rate_account    := 0;
        inputDog.shablon_data.id_rate_acc_native := 0;
        SYS_ID_USER          := myclass.id_user;
        res := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
            DecimalSeparator := ',';
            DogParam := res;
{            i := length(res.Smets);
            SetLength(DogParam, i);
            for j := 0 to i-1 do
            begin
//                TT := New(^TDog);
                DogParam := res;
            end;
}        end;
    end else
    begin
        SelectDogovor := false;
    end;
end;

procedure TfmKassaDocMainForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Pen.Color :=  clBlack;
    if (AViewInfo.GridRecord.Values[4]{AViewInfo.Value[cxGrid1DBTableView1DBColumn4.Index]} = 0) and (not AViewInfo.GridRecord.Focused) then
    begin
        ACanvas.Canvas.Font.Color := RGB(150,50,50);//clRed;
//      ACanvas.Canvas.Font.Style:=[fsStrikeOut];
        ACanvas.Canvas.FillRect(Arect);
        exit;
    end;
    if (AViewInfo.GridRecord.Values[7]{AViewInfo.Value[cxGrid1DBTableView1DBColumn7.Index]} = 0) and (not AViewInfo.GridRecord.Focused) then
    begin
        ACanvas.Canvas.Font.Color := clGreen;
//      ACanvas.Canvas.Font.Style:=[];
        ACanvas.Canvas.FillRect(Arect);
        exit;
    end;
    if (AViewInfo.GridRecord.Values[4]{AViewInfo.Value[cxGrid1DBTableView1DBColumn4.Index]} <> 0) and (not AViewInfo.GridRecord.Focused) then
    begin
        ACanvas.Canvas.Font.Color := clBlack;
//      ACanvas.Canvas.Font.Style:=[];
        ACanvas.Canvas.FillRect(Arect);
    end;
end;

procedure TfmKassaDocMainForm.DataSetMainAfterScroll(DataSet: TDataSet);
var
    iii : int64;
begin
    if DataSetMain['OSNOVANIE'] <> null then
        cxMemo1.Text := DataSetMain['OSNOVANIE'];
    try iii := StrToInt64(DataSetMain.FBN('ID_ALL_DOC').AsString) except iii := -1; end;
    if iii > 0
        then
        begin
            ActionMakeAllDoc.Enabled := false;
            ActionVozvrat.Enabled    := True;
//            ActionMakeAllDoc.Caption    := Un_R_file_Alex.KASSA_DOC_VOZVRAT_V_BUFF;
//            ActionMakeAllDoc.imageIndex := 10;
        end
        else
        begin
//            ActionMakeAllDoc.Caption := Un_R_file_Alex.KASSA_DOC_ZAPIS_V_ALL_DOC;
//            ActionMakeAllDoc.imageIndex := 11;
            ActionMakeAllDoc.Enabled := true;
            ActionVozvrat.Enabled    := false;
        end;
end;

procedure TfmKassaDocMainForm.cxGrid1DBTableView1DBColumn7CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if (AviewInfo.GridRecord.Values[4]{AViewInfo.Value[cxGrid1DBTableView1DBColumn4.Index]} = 0) then
    begin
        ACanvas.FillRect(AViewInfo.Bounds);
        ACanvas.DrawImage(ImageList1,AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                         AviewInfo.Bounds.Top, 0);
        ADone := True;
    end;
end;

procedure TfmKassaDocMainForm.ActionShowExecute(Sender: TObject);
var
    T : TfmKassOrder;
    e : boolean;
begin
    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;

    prihod := DataSetMain['PRIHOD_RASHOD'];
    T := TfmKassOrder.Create(self, myclass, ShowOrder, self, NoDog);
    T.ShowModal;
    T.Free;
    if myclass.id_doc_ > 0 then close;
    if e then cxCheckBoxRefr.Checked := true;
end;

procedure TfmKassaDocMainForm.ActionShowAllExecute(Sender: TObject);
begin
    if not DataSetMain.IsEmpty then
    begin
        showmessage('id_doc - ' + DataSetMain.FieldByName('ID_DT_DOC').Asstring+#13+
                    'id_all_doc - ' + DataSetMain.FieldByName('ID_ALL_DOC').Asstring+#13+
                    'id_dt_day - ' + DataSetMain.FieldByName('ID_DT_DAY').Asstring);
    end;
end;

procedure TfmKassaDocMainForm.ActionChangeAddExecute(Sender: TObject);
var
    T : TfmKassOrder;
    prih, f_nds_ask_s : smallInt;
    f_pri, f_ra, f_def_f_z, f_sys_z, f_vis_z, kod_z : integer;
    id_oper_z, id_sc_z, id_sm_z, id_st_z, id_razd_z, id_kekv_z,id_sch_s, id_pv_s, id_tf_s : int64;
    summa_dog, summ : double;
    error : integer;
    pv_kod_s, pv_title_s, tf_kod_s, tf_title_s, kod_sch_s, tytle_sch_s : string;
    inputDog : TDogInput;
    res   : TDogResult;
    e : boolean;
    rr : variant;
begin
    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;
    if not DataSetMain.IsEmpty then
    begin
        flag_add_change := true;
        error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Add');
        if error <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
            exit;
        end;                                         
//        if Show_fmPrihod(prih) then
        prih := DataSetMain['PRIHOD_RASHOD'];
        begin
             if Show_Shablon(Database, Transaction , prih, id_oper_z, id_sc_z, id_sm_z, id_st_z, id_razd_z, id_kekv_z, f_pri, f_ra, f_def_f_z, f_sys_z, f_vis_z, kod_z, name_z, KOD_SCH_DEFAULT, TITLE_SCH_DEFAULT, summ, note, nds, id_dog_umol, kod_dog_umol, f_nds_ask_s) then
             begin
                  prihod       := prih;
                  id_operation := id_oper_z;
                  id_sch       := id_sc_z;
                  id_smeta     := id_sm_z;
                  id_razdel    := id_razd_z;
                  id_kekv_oper := id_kekv_z;
                  flag_prih    := f_pri;
                  flag_ras     := f_ra;
                  flag_def_f   := f_def_f_z;
                  flag_sys     := f_sys_z;
                  flag_vis     := f_vis_z;
                  kodShab      := kod_z;
//          showmessage(inttostr(kod_z));
                  id_stat      := id_st_z;
                  sum          := summ;
                  nds_pr       := nds;
                  nds_ask_s    := f_nds_ask_s;
                  if kod_z = 90 then {ДОГОВОРА}
                  begin
                      if SelectDogovor then
                      begin
                          T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, SDog);
                          T.ShowModal;
                          T.Free;
                          exit;
                      end else
                      begin
                          exit;
                      end;
                  end;
                  if kod_z = 50 then {Рома Женя за обучение}
                  begin
                          T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, DogRJ);
                          T.ShowModal;
                          T.Free;
                          exit;
                  end;
                  if kod_z = 70 then {студгородок}
                  begin
                          T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, Stud);
                          T.ShowModal;
                          T.Free;
                          exit;
                  end;
                  if kod_z = 41 then {Коммандировка}
                  begin
                      DecimalSeparator     := ',';
                      summa_dog := 0;
                      nds_ask_s :=0;
                      if Show_Summa_Kassa(nds_ask_s, summa_dog, name_z) then
                      begin
                          TransactionWr.DefaultDatabase := Database;
                          LoadSysData(Transaction);
//                          inputDog             := SYS_DEFAULT_DOG_INPUT;
                          inputDog.Owner                           := self;
                          inputDog.DBHandle                        := Database.Handle;
                          inputDog.WriteTrans                      := TransactionWr.Handle;
                          inputDog.ReadTrans                       := Transaction.Handle;
                          inputDog.FormStyle                       := fsNormal;
                          inputDog.SUmma                           := summa_dog;
                          inputDog.id_Group                        := 61499;
                          inputDog.id_group_add                    := 61599;
                          inputDog.filter.bShowFilterForm          := false;
                          inputDog.isZayav                         := false;
                          inputDog.arndGetPay                      := 1;
                          SYS_CURRENT_DATE                         := StrToDate(cxComboBoxDay.Text);
                          inputDog.shablon_data.bUse               := true;
                          inputDog.shablon_data.num                := 'б\н';
                          inputDog.shablon_data.date_dog           := StrToDate(cxComboBoxDay.Text);
                          inputDog.filter.DateBeg                  := IncDay(StrToDate(cxComboBoxDay.Text), -730);
                          inputDog.filter.DateEnd                  := StrToDate(cxComboBoxDay.Text);
                          inputDog.filter.bUseFilter               := false;
                          inputDog.filter.bDate                    := true;
                          inputDog.shablon_data.note               := '';
                          inputDog.shablon_data.summa              := summa_dog;
                          inputDog.shablon_data.id_rate_account    := 0;
                          inputDog.shablon_data.id_rate_acc_native := 0;
                          inputDog.filter.bRegNum                  := false;
                          inputDog.filter.bSumma                   := true;
                          inputDog.filter.SummaFrom                := summa_dog;
                          inputDog.filter.SummaTo                  := summa_dog;
                          inputDog.filter.bNameCust                := false;
                          inputDog.filter.bTipdog                  := false;

                          SYS_ID_USER          := myclass.id_user;
                          res := ShowDogMain(inputDog);
                          if res.ModalResult = 1 then
                          begin
                              DecimalSeparator := ',';
                              DogParam := res;
                              T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, Komm);
                              T.ShowModal;
                              T.Free;
                              exit;
                          end;
                          end else
                          begin
                              exit;
                          end;
{                      if SelectDogovor then
                      begin
                          T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, Komm);
                          T.ShowModal;
                          T.Free;
                          exit;
                      end else
                      begin
                          exit;
                      end;}
                  end;

                  if kod_z = 20 then {за регистрацию общаги}
                  begin
                      summa_dog := summ;
                      if Show_Summa_K(summa_dog, name_z) then
                      begin
                          DogParam.summa := summa_dog;
                          T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, OPL_OB);
                          T.ShowModal;
                          T.Free;
                      end;
                          exit;
                  end;

                  if kod_z = 22 then
                  begin {Квартплата}
                      summa_dog := summ;
                      if Show_Summa_K(summa_dog, name_z) then
                      begin
                          DogParam.summa := summa_dog;
                          T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, Kv_Pl);
                          T.ShowModal;
                          T.Free;
                      end;
                          exit;
                  end;

                  if kod_z = 11 then
                  begin {сдача наличности в банк}
//                      if Show_Ostatok(self, TRecProvodka, self) then
                      DataSetKOdSys.Close;
                      DataSetKOdSys.Sqls.SelectSQL.Text := 'select * from PUB_SP_SYSTEM where kod_sys='+IntToStr(2)+'';
                      DataSetKOdSys.Open;
                      rr := GlobalSpr.GetSch(self, Database.Handle, fsNormal, StrToDAte(cxComboBoxDay.Text), 1, DataSetKOdSys.FieldByName('ID_SYSTEM').AsVariant, -1);
                      if VarArrayDimCount(Rr)>0 then
                      begin
                          id_sch_kor_sdacha    := RR[0][0];
                          kod_sch_kor_sdacha   := RR[0][3];
                          tytle_sch_kor_sdacha := RR[0][1];
                          T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, Sdacha_deneg);
                          T.ShowModal;
                          T.Free;
                      end;
                          exit;
                      DataSetKOdSys.Close;
                      exit;
                  end;

                  if kod_z = 12 then
                  begin {сдача наличности в банк новый алгоритм}
//                  if Show_Ostatok(self, TRecProvodka, self) then
                      DataSetKOdSys.Close;
                      DataSetKOdSys.Sqls.SelectSQL.Text := 'select * from PUB_SP_SYSTEM where kod_sys='+IntToStr(2)+'';
                      DataSetKOdSys.Open;
                      rr := GlobalSpr.GetSch(self, Database.Handle, fsNormal, StrToDAte(cxComboBoxDay.Text), 1, DataSetKOdSys.FieldByName('ID_SYSTEM').AsVariant, -1);
                      if VarArrayDimCount(Rr)>0 then
                      begin
                          id_sch_kor_sdacha    := RR[0][0];
                          kod_sch_kor_sdacha   := RR[0][3];
                          tytle_sch_kor_sdacha := RR[0][1];
                          T := TfmKassOrder.Create(self, myclass, AddOrder, self, Sdacha_deneg_new);
                          T.ShowModal;
                          T.Free;
                      end;
                      DataSetKOdSys.Close;
                      exit;
                  end;

              if kod_z = 14 then
              begin {сдача наличности в банк новый алгоритм}
//                  if Show_Ostatok(self, TRecProvodka, self) then
                  DataSetKOdSys.Close;
                  DataSetKOdSys.Sqls.SelectSQL.Text := 'select * from PUB_SP_SYSTEM where kod_sys='+IntToStr(2)+'';
                  DataSetKOdSys.Open;

                  if SelectPvkTypeFin(self,self, id_sch_s, id_pv_s, id_tf_s,pv_kod_s, pv_title_s, tf_kod_s, tf_title_s, kod_sch_s, tytle_sch_s) then
                  begin
                      id_sch_kor_sdacha    := id_sch_s;
                      kod_sch_kor_sdacha   := kod_sch_s;
                      tytle_sch_kor_sdacha := tytle_sch_s;
                      id_pkv               := id_pv_s;
                      id_tpfin             := id_tf_s;
                      T := TfmKassOrder.Create(self, myclass, AddOrder, self, Sdacha_deneg_new_pkv_fin);
                      T.ShowModal;
                      T.Free;
                  end;
                  exit;
                  DataSetKOdSys.Close;
                  exit;
              end;

                  if kod_z = -1 then
                  begin
                      T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, NoDog);
                      T.ShowModal;
                      T.Free;
                      exit;
                  end;

              if(nds_ask_s=1) then
              begin
                  summa_dog := summ;
                  if Show_Summa_Kassa(nds_ask_s, summa_dog, name_z) then
                  begin
                      sum := summa_dog;
                      T := TfmKassOrder.Create(self, myclass, AddOrder, self, other_shablon);
                      T.ShowModal;
                      T.Free;
                  end;
                  exit;
              end;

              T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, other_shablon);
              T.ShowModal;
              T.Free;

             end;
        end;
    end;
    if e then cxCheckBoxRefr.Checked := true;
end;

procedure TfmKassaDocMainForm.ActionFindExecute(Sender: TObject);
begin
    cxTextEdit1.SetFocus;
end;

procedure TfmKassaDocMainForm.cxTextEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
    t : boolean;
    s: string;
begin
    if Key = VK_RETURN then
    begin
        t := DataSetMain.Locate('FIO', cxTextEdit1.Text, [loPartialKey]);
        if not t then
        begin
            s := AnsiUpperCase(cxTextEdit1.Text);
            if DataSetMain.Locate('FIO', s, [loPartialKey]) then cxGrid1.setFocus;
        end else cxGrid1.setFocus;
    end;
end;

function TfmKassaDocMainForm.DogZaObuchNew : boolean;
var
    //AParameter : TBankSimpleParam;
    AParameter : TcnSimpleParamsExs;
    ResOpl     : Variant;
    i, l{, j} : integer;
begin
{    d := TpFibDatabase.Create(nil);
    T := tpFibTransaction.Create(nil);
    d.DatabaseName := Database.DatabaseName;
    D.DatabaseName := Database.DatabaseName;
    D.DBParams.Clear;
	D.DBParams.Add('user_name=' + Database.ConnectParams.UserName);
    D.DBParams.Add('password='  + Database.ConnectParams.Password);
    D.SQLDialect := 3;
    d.ConnectParams.CharSet := 'WIN1251';
    try
        d.Open;
    except
    begin
        showmessage('1');
        exit;
    end;
    end;
    d.DefaultTransaction := T;
    T.DefaultDatabase    := d;
    T.StartTransaction;}
    AParameter                              := TcnSimpleParamsExs.Create;
    AParameter.Owner                        := self;
    AParameter.Db_Handle                    := Database.Handle;
    AParameter.Formstyle                    := fsNormal;
    AParameter.WaitPakageOwner              := self;
    AParameter.cnParamsToPakage.Summa       := -1;
    AParameter.cnParamsToPakage.IsWithSumma := false;
    AParameter.cnParamsToPakage.BarCode     := barstr;
    ResOpl:= RunFunctionFromPackageForKassa(AParameter, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');
    if VarArrayDimCount(ResOpl)>0
    then begin
        decimalseparator := ',';
        note_obuch := 'За обуч. ' + varToStr(ResOpl[0][16]) + ' ' + VarToStr(ResOpl[0][19]) + ' (№ дог. ' + VarToStr(ResOpl[0][4]) + ' от ' + DateToStr(ResOpl[0][23]) +') ' + VarToStr(ResOpl[0][3]);
        result := true;
        l := ResOpl[0][11];
        SetLength(RecProv.prov, l);
        for i := 1 to l do
        begin
            RecProv.prov[i-1].summa_all       := ResOpl[0][15];
            RecProv.prov[i-1].summa_prov      := ResOpl[i][4];
            RecProv.prov[i-1].id_smeta        := StrToInt64(ResOpl[i][0]);
            RecProv.prov[i-1].id_razd         := StrToInt64(ResOpl[i][1]);
            RecProv.prov[i-1].id_state        := ResOpl[i][2];
            RecProv.prov[i-1].id_kekv         := ResOpl[i][3];
            RecProv.prov[i-1].id_man          := ResOpl[0][1];
            RecProv.prov[i-1].name_fio        := ResOpl[0][7];
            RecProv.prov[i-1].id_dog          := ResOpl[0][2];
            RecProv.prov[i-1].kod_dog         := ResOpl[0][12];
            RecProv.prov[i-1].num_dog         := ResOpl[0][4];
            RecProv.prov[i-1].date_dog        := ResOpl[0][9];
            RecProv.prov[i-1].name_cust       := ResOpl[0][3];
            RecProv.prov[i-1].type_dog        := ResOpl[0][6];
            RecProv.prov[i-1].id_payer        := ResOpl[0][5];
        end;
    end else
    begin
        result := false;
    end;

end;

procedure TfmKassaDocMainForm.ActionPtintVedomostExecute(Sender: TObject);
var
    pk_id : int64;
    month, error, er : integer;
    mon   : string;
    e : boolean;
begin
    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;

    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Print');
    if error <> 0 then
    begin
        er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Print_Ved','Print');
        if er <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(er)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end;

    if not DataSetMain.IsEmpty then
    begin

        pk_id := StrToInt64(DataSetMain.FieldByName('ID_ALL_DOC').AsString);
        DataSetVedom.Close;
        DataSetVedom.Sqls.SelectSQL.Text := 'select * from KASSA_CREATE_VEDOMOST('+IntToStr(pk_id)+')';
        DataSetVedom.Open;
        DataSetVedom.FetchAll;

        month := MonthOf(DataSetDay['DAY_KASSA']);
        case month of
            1 : mon  :='січень';
            2 : mon  :='лютий';
            3 : mon  :='березень';
            4 : mon  :='квітень';
            5 : mon  :='травень';
            6 : mon  :='червень';
            7 : mon  :='липень';
            8 : mon  :='серпень';
            9 : mon  :='вересень';
            10 : mon :='жовтень';
            11 : mon :='листопад';
            12 : mon :='грудень';
        end;

        frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10015.fr3');
        frxReport2.Variables['Vedom']      := QuotedStr(DataSetMain.FieldByName('FIO').AsString);//QuotedStr(DataSetKorSch.fieldByname('KOD_KOR_SCH').AsString);
        frxReport2.Variables['sum_propis'] := QuotedStr(AllChislo_ukr(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)));
        frxReport2.Variables['mon']        := QuotedStr(mon);
        frxReport2.Variables['year']       := QuotedStr(INtToStr(YearOf(DataSetDay['DAY_KASSA'])));
        frxReport2.Variables['note']       := QuotedStr(DataSetMain.FieldByName('OSNOVANIE').AsString);
//        frxReport2.Variables['sm_rz_st_k'] := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport2.PrepareReport;
        //frxReport2.ShowReport(true);

        if show_print=1 then
        begin
            frxReport2.PrintOptions.ShowDialog   := true;
            frxReport2.ShowReport(true);
        end else
        begin
            frxReport2.Print;
        end;

        DataSetVedom.Close;
    end;
    if e then cxCheckBoxRefr.Checked := true;
end;

procedure TfmKassaDocMainForm.ActionMakeAllDocExecute(Sender: TObject);
var
    T : TfmKassOrder;
    error,er : integer;
    id : int64;
    e : boolean;
begin
    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;
    
    pFIBDataSet_ini.Close;
    pFIBDataSet_ini.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_DT_DAY WHERE ID_DT_DAY='+IntToStr(myclass.id_d)+'';
    pFIBDataSet_ini.Open;
    if pFIBDataSet_ini.FieldByName('BLOK_DEBET').AsInteger = 1 then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_ERROR_DAY_CHANGE_OBOROT_DEB);
        exit;
    end;
    if pFIBDataSet_ini.FieldByName('BLOK_KREDIT').AsInteger = 1 then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_ERROR_DAY_CHANGE_OBOROT_KRED);
        exit;
    end;
    pFIBDataSet_ini.Close;
    pFIBDataSet_ini.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SP_KASS WHERE ID_SP_KASS='+IntToStr(myclass.id_kas)+'';
    pFIBDataSet_ini.Open;
    if (pFIBDataSet_ini.FieldByName('BLOCK_SALDO_END').AsInteger = 1) and (pFIBDataSet_ini.FieldByName('DATE_BLOK_SALDO_END').AsdateTime >= StrToDate(cxComboBoxDay.Text)) then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.KASSA_ERROR_DAY_SALDO_END + pFIBDataSet_ini.FieldByName('DATE_BLOK_SALDO_END').AsString), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;

  if predv_prov <> 0 then
  begin
    id := StrToInt64(DataSetMain.FBN('ID_DT_DOC').AsString);
    if StrToInt64(DataSetMain.FBN('ID_ALL_DOC').AsString) <= 0 then
    begin
        flag_add_change := false;
        if not DataSetMain.IsEmpty then
        begin
            error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Buhg_prov','Belong');
            if error <> 0 then
            begin
               er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Buhg_prov_own','Belong');
               if er <> 0 then
               begin
                  MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
                  exit;
               end;
            end;
            prihod       := DataSetMain['PRIHOD_RASHOD'];
            id_operation := DataSetMainID_OPERATION.AsInt64;
            T := TfmKassOrder.Create(self, myclass, ChangeOrder, self, NoDog);
            T.Visible    := false;
            //pFIBDataSet_ini.Close;
            //pFIBDataSet_ini.SQLs.UpdateSQL.Text := 'execute procedure KASSA_UPD_ID_USER_BUHG('+inttostr(myclass.id_user)+','+IntToStr(id)+')';
            //pFIBDataSet_ini.Edit;
            //pFIBDataSet_ini.Post;
            //pFIBDataSet_ini.Open;


            T.ActionSaveAllExecute(nil);

            try
              StoredProc.Database := Database;
              StoredProc.Transaction := TransactionWr;
              StoredProc.Transaction.StartTransaction;
              StoredProc.StoredProcName := 'KASSA_UPD_ID_USER_BUHG';
              StoredProc.Prepare;
              StoredProc.ParamByName('d_id_all_doc').AsInt64        := id;
              StoredProc.ParamByName('d_id_user_po_buhg').AsInt64   := myclass.id_user;
              StoredProc.ExecProc;
              TransactionWr.Commit;
            except on E:Exception do
            begin
                showmessage(E.Message);
                TransactionWr.Rollback;
                exit;
            end;
           end;

             //showmessage('3');
            if not T.flag_all_doc_change_ok then
            begin
//                T.Visible    := true;
                T.ShowModal;
            end;
            T.Free;
        end;
    end;
    ActionRefreshExecute(Sender);
    DatasetMain.Locate('ID_DT_DOC', id, []);
  end;
  if e then cxCheckBoxRefr.Checked := true;

end;

procedure TfmKassaDocMainForm.ActionVozvratExecute(Sender: TObject);
var
//    T : TfmKassOrder;
    error, er : integer;
    STRU : KERNEL_MODE_STRUCTURE;
    ErrorList:TStringList;
    DoResult : boolean;
    i : integer;
    mes : string;
    F : TfmUn_Progress_form;
    id : int64;
    e : boolean;
begin
    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;


    pFIBDataSet_ini.Close;
    pFIBDataSet_ini.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_DT_DAY WHERE ID_DT_DAY='+IntToStr(myclass.id_d)+'';
    pFIBDataSet_ini.Open;
    if pFIBDataSet_ini.FieldByName('BLOK_DEBET').AsInteger = 1 then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_ERROR_DAY_CHANGE_OBOROT_DEB);
        exit;
    end;
    if pFIBDataSet_ini.FieldByName('BLOK_KREDIT').AsInteger = 1 then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_ERROR_DAY_CHANGE_OBOROT_KRED);
        exit;
    end;
    pFIBDataSet_ini.Close;
    pFIBDataSet_ini.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SP_KASS WHERE ID_SP_KASS='+IntToStr(myclass.id_kas)+'';
    pFIBDataSet_ini.Open;
    if (pFIBDataSet_ini.FieldByName('BLOCK_SALDO_END').AsInteger = 1) and (pFIBDataSet_ini.FieldByName('DATE_BLOK_SALDO_END').AsdateTime >= StrToDate(cxComboBoxDay.Text)) then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.KASSA_ERROR_DAY_SALDO_END + pFIBDataSet_ini.FieldByName('DATE_BLOK_SALDO_END').AsString), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;

  if predv_prov <> 0 then
  begin
    id := StrToInt64(DataSetMain.FBN('ID_DT_DOC').AsString);

    er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Buhg_prov_own','Belong');
    if er = 0 then
    begin
         pFIBDataSet_ini.Close;
         pFIBDataSet_ini.SQLs.SelectSQL.Text := 'SELECT ID_USER_PO_BUHG as ID_USER_PO_BUHG FROM KASSA_DT_DOC WHERE ID_DT_DOC='+IntToStr(id)+'';
         pFIBDataSet_ini.Open;
         //showmessage(inttostr(pFIBDataSet_ini.FieldByName('ID_USER_PO_BUHG').AsInteger));
         //showmessage(inttostr(id_user));
         if(pFIBDataSet_ini.FieldByName('ID_USER_PO_BUHG').AsInteger<>id_user) then
         begin
             showmessage(Un_R_file_Alex.KASSA_RETURN_BUHG_DOC);
             exit;
         end;
    end;


    if StrToInt64(DataSetMain.FBN('ID_ALL_DOC').AsString) > 0 then
    begin
        error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Del');
        if error <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
      if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_DOC_VOZVRAT_VOPROS +#13+ '№ '+ datasetmain.FieldByName('NUMBER_DOC').AsString +#13+Un_R_file_Alex.KASSA_DOC_VOZVRAT_FIO +' '+ datasetmain.FieldByName('FIO').AsString+#13+Un_R_file_Alex.KASSA_Z_BUHG_OBLICU), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO + MB_DEFBUTTON2)=mrYes then
      begin
        try
        Class_DataSet.Database       := Database;
        Class_DataSet.Transaction    := TransactionWr;
        TransactionWr.StartTransaction;
        F := TfmUn_Progress_form.Create(nil, wait_, Un_R_file_Alex.WAIT_DELETE_DATA);
        F.Show;
        F.Repaint;
        STRU.DBHANDLE      := Database.Handle;
        STRU.TRHANDLE      := TransactionWr.Handle;
        STRU.WORKDATE      := StrToDate(cxComboBoxDay.Text);
        STRU.KERNEL_ACTION := 2;
        STRU.KEY_SESSION   := Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);;
        STRU.PK_ID         := StrToInt64(DataSetMain.FBN('ID_ALL_DOC').AsString);
        DoResult := Kernel.KernelDo(@STRU);
        if not DoResult
        then begin
              ErrorList:=Kernel.GetDocErrorsList(@STRU);
              mes := Un_R_file_Alex.MY_MESSAGE_ERROR + #13;
              if ErrorList<>nil
              then for i := 0 to  ErrorList.Count-1 do
                  mes :=  mes +' '+ ErrorList.Strings[i]+#13;
              Class_DataSet.Close;
              Class_DataSet.SQLs.SelectSQL.Text:='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
              Class_DataSet.Open;
              Class_DataSet.First;
              while not Class_DataSet.Eof do
              begin
                  mes := mes + Class_DataSet.FieldByName('ERROR_MESSAGE').AsString+#13;
                  Class_DataSet.Next;
              end;
              F.Free;
              ShowMessage(mes);
              TransactionWr.Rollback;
        end;
        TransactionWr.Commit;
        F.Free;
        except on E:Exception do begin
            TransactionWr.Rollback;
            F.Free;
            ShowMessage(E.Message);
        end
        end;
      end;
    end;
    ActionRefreshExecute(Sender);
    DatasetMain.Locate('ID_DT_DOC', id, []);
  end;
  if e then cxCheckBoxRefr.Checked := true;
end;

procedure TfmKassaDocMainForm.Timer1Timer(Sender: TObject);
begin
    if (predv_prov = 1) and (cxCheckBoxRefr.Checked) and (self.Active) then
        ActionRefreshExecute(Sender);
end;

procedure TfmKassaDocMainForm.APrintBlankClearExecute(Sender: TObject);
var error, er : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Print');
    if error <> 0 then
    begin
        er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Print_blank_data','Print');
        if er <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(er)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end;
    PrintBlank(true);
end;

procedure TfmKassaDocMainForm.APrintBlankExecute(Sender: TObject);
var error, er : integer;
begin
    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Print');
    if error <> 0 then
    begin
        er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Print_blank_copy','Print');
        if er <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(er)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end;
    PrintBlank(false);
end;

procedure TfmKassaDocMainForm.PrintBlank(clear: boolean);
var
    month, day, year : integer;
    year_l, month_l, day_l, mon, n, s, v, d, grivna, kop, s1, s2, seriya, n_serii, nn, dd : string;
    id : int64;
    error, prihodn, er : integer;
    print_pass : integer;
    e : boolean;
    hide_b_r_s_k : integer;
begin
    if DataSetMain.IsEmpty then exit;

    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;


    id := TFIBBCDField(DataSetMain.FieldByName('ID_DT_DOC')).AsInt64;

    if clear then
    begin
        DataSetKorSch.Close;
        DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_DT_DOC where ID_DT_DOC='+IntToStr(id);
        DataSetKorSch.Open;

        seriya       := DataSetKorSch.fbn('SERIYA').AsString;
        n_serii      := DataSetKorSch.fbn('NOMER_SERII').AsString;
        prihodn      := DataSetKorSch.fbn('PRIHOD_RASHOD').AsInteger;

        if not kassa_inst_seriya(self, Database, id, prihodn, seriya, n_serii, DataSetMain.FieldByName('NUMBER_DOC').AsString, cxComboBoxDay.Text) then
        begin
            exit;
        end;
    end;

    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetKorSch.Open;
    print_pass := DataSetKorSch.FieldByName('PRINT_PASPORT').AsInteger;
    if(DataSetKorSch['HIDE_B_RZ_ST_KEKV']<>null) then
        hide_b_r_s_k := DataSetKorSch.FieldByName('HIDE_B_RZ_ST_KEKV').AsInteger
    else
        hide_b_r_s_k := 0;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_TO_PRINT_PRIH_RAS('''+DataSetMain.FieldByName('ID_DT_DOC').AsString+''')';
    DataSetKorSch.Open;

        DataSetDay.Locate('ID_DT_DAY', id_day, []);

        year := YearOf(DataSetDay['DAY_KASSA']);
        frVariables['year_r']  := year;
        year := year mod 100;
        year_l := IntToStr(year);
        if length(year_l) = 1 then year_l := '0' + year_l;

        month := MonthOf(DataSetDay['DAY_KASSA']);
        case month of
            1 : mon  :='січень';
            2 : mon  :='лютий';
            3 : mon  :='березень';
            4 : mon  :='квітень';
            5 : mon  :='травень';
            6 : mon  :='червень';
            7 : mon  :='липень';
            8 : mon  :='серпень';
            9 : mon  :='вересень';
            10 : mon :='жовтень';
            11 : mon :='листопад';
            12 : mon :='грудень';
        end;

        month_l := IntToStr(month);
        if length(month_l) = 1 then month_l := '0' + month_l;

        day   := DayOf(DataSetDay['DAY_KASSA']);
        day_l := IntToStr(day);
        if length(day_l) = 1 then day_l := '0' + day_l;


//    if DataSetKorSch['PREDPRIYATIE'] = 0 then
//    begin
        if DataSetMain['PRIHOD_RASHOD'] = 1 then
        begin
            if clear
                then frxReport3.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10101_clear.fr3')
                else frxReport3.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10101.fr3');
        end;

        if DataSetMain['PRIHOD_RASHOD'] = 0 then
        begin
            if clear
                then frxReport3.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10102_clear.fr3')
                else frxReport3.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10102.fr3');
            frxReport3.Variables['passp']               := QuotedStr(' ');
        end;

        if (print_pass = 1) and (DataSetMain.FieldByName('ID_MAN').AsVariant > 0) and (DataSetMain['PRIHOD_RASHOD'] = 0) then
        begin
            if DataSetMain.FieldByName('NUMBER_PASS').AsString <> null
                then n  := DataSetMain.FieldByName('NUMBER_PASS').AsString
                else n  := ' ';
            if DataSetMain.FieldByName('SERIYA_PASS').AsString <> null
                then s  := DataSetMain.FieldByName('SERIYA_PASS').AsString
                else s  := ' ';
            if DataSetMain.FieldByName('VIDAN').AsString <> null
                then v  := DataSetMain.FieldByName('VIDAN').AsString
                else v  := ' ';
            if DataSetMain.FieldByName('DATE_VIDAN').AsDateTime <> null
                then d  := DataSetMain.FieldByName('DATE_VIDAN').AsString
                else d  := ' ';
            if n <> '' then
            if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_PRINT_PASS_DATA), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO and IDNO)=mrYes then
            begin
                frxReport3.Variables['passp'] := QuotedStr(Un_R_file_Alex.KASSA_PASPORT+ s + ' № ' + n + Un_R_file_Alex.KASSA_VIDAN + v + Un_R_file_Alex.KASSA_OT + d);
            end;
        end;

        if not clear then
        begin
            frxReport3.Variables['seriya']          := QuotedStr(DataSetMain.fbn('SERIYA').AsString);
            frxReport3.Variables['n_serii']         := QuotedStr(DataSetMain.fbn('N_SERII').AsString);

        end;

        frxReport3.Variables['day_']                := QuotedStr(day_l);
        frxReport3.Variables['month_']              := QuotedStr(month_l);
        frxReport3.Variables['mon']                 := QuotedStr(mon);
        frxReport3.Variables['year_']               := QuotedStr(year_l);
        if year<=9 then frxReport3.Variables['y']   := QuotedStr('0'+IntToStr(year))
        else
        frxReport3.Variables['y']                   := QuotedStr(IntToStr(year));
        frxReport3.Variables['hide_info']           := QuotedStr(IntToStr(hide_b_r_s_k));
        frxReport3.Variables['s']                   := QuotedStr(DataSetMain.FieldByName('SUMMA_DOC').AsString);
        frxReport3.Variables['n']                   := QuotedStr(DataSetMain.FieldByName('NUMBER_DOC').AsString);
        frxReport3.Variables['o']                   := QuotedStr(DataSetMain.FieldByName('OSNOVANIE').AsString);
        frxReport3.Variables['f']                   := QuotedStr(DataSetMain.FieldByName('FIO').AsString);
        frxReport3.Variables['okpo']                := QuotedStr(DataSetKorSch.fieldByname('OKPO').AsString);
        frxReport3.Variables['comp']                := QuotedStr(GetComputerNetName);
        frxReport3.Variables['id_user']             := QuotedStr(IntToStr(myclass.id_user));
        frxReport3.Variables['s_r_s_k']             := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        IF DataSetKorSch.FieldByName('LANG').AsInteger = 1 then
        begin
            SummToGrivAdnKop_rus(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat), grivna, kop);
            if DataSetMain['PRIHOD_RASHOD'] = 1 then
            begin
                if Summa_on_words(grivna, 72, 40, s1, s2) then
                begin
                    frxReport3.Variables['suma_v']    := QuotedStr(s1);
                    frxReport3.Variables['suma_n']    := QuotedStr(s2);
                end else
                begin
                    showmessage('Дліна назви суми прописов перевищує норму! Ордер не буде надруковано!');
                    exit;
                end;
                if Summa_on_words(grivna, 39, 22, s1, s2) then
                begin
                    frxReport3.Variables['suma_vr']   := QuotedStr(s1);
                    frxReport3.Variables['suma_nr']   := QuotedStr(s2);
                end else
                begin
                    showmessage('Дліна назви суми прописов перевищує норму! Ордер не буде надруковано!');
                    exit;
                end;
            end;
            if DataSetMain['PRIHOD_RASHOD'] = 0 then
            begin
                if Summa_on_words(grivna, 111, 66, s1, s2) then
                begin
                    frxReport3.Variables['suma_v']    := QuotedStr(s1);
                    frxReport3.Variables['suma_n']    := QuotedStr(s2);
                end else
                begin
                    showmessage('Дліна назви суми прописов перевищує норму! Ордер не буде надруковано!');
                    exit;
                end;
            end;
            frxReport3.Variables['suma_kop']          := QuotedStr(kop);
        end else
        begin
            SummToGrivAdnKop_ukr(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat), grivna, kop);
            if DataSetMain['PRIHOD_RASHOD'] = 1 then
            begin
                if Summa_on_words(grivna, 72, 40, s1, s2) then
                begin
                    frxReport3.Variables['suma_v']    := QuotedStr(s1);
                    frxReport3.Variables['suma_n']    := QuotedStr(s2);
                end else
                begin
                    showmessage('Дліна назви суми прописов перевищує норму! Ордер не буде надруковано!');
                    exit;
                end;
                if Summa_on_words(grivna, 39, 22, s1, s2) then
                begin
                    frxReport3.Variables['suma_vr']   := QuotedStr(s1);
                    frxReport3.Variables['suma_nr']   := QuotedStr(s2);
                end else
                begin
                    showmessage('Дліна назви суми прописов перевищує норму! Ордер не буде надруковано!');
                    exit;
                end;
            end;
            if DataSetMain['PRIHOD_RASHOD'] = 0 then
            begin
                if Summa_on_words(grivna, 111, 66, s1, s2) then
                begin
                    frxReport3.Variables['suma_v']    := QuotedStr(s1);
                    frxReport3.Variables['suma_n']    := QuotedStr(s2);
                end else
                begin
                    showmessage('Дліна назви суми прописов перевищує норму! Ордер не буде надруковано!');
                    exit;
                end;
            end;
            frxReport3.Variables['suma_kop']          := QuotedStr(kop);
        end;
        frxReport3.Variables['name_pred']           := QuotedStr(DataSetKorSch.fieldByname('NAME_PREDPR').AsString);
        frxReport3.Variables['kor_sch']             := QuotedStr(DataSetKorSch.FieldByName('SCH_ALL_KOR').AsString);
        frxReport3.Variables['sm_rz_st_k']          := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport3.PrintOptions.Copies              := 1;
//        TfrxPreviewOptions(frxReport3.Preview).Zoom        := 2;

//        frxReport1.PrintOptions.

        frxReport3.PrepareReport;
        frxReport3.ShowReport(true);
//    end;

    DataSetKorSch.Close;
    DataSetMain.Locate('ID_DT_DOC', id, []);
    if e then cxCheckBoxRefr.Checked := true;
end;

function TfmKassaDocMainForm.Summa_on_words(smma: string; max_len1,
  max_len2 : integer; var s1, s2: string): boolean;
var
    len, i : integer;
    last_word : string;
    symbol : Char;
begin
    len := length(smma);
    s1  := '';
    s2  := '';
    if len <= max_len2 then
    begin
        s1 := ' ';
        s2 := smma;
        result := true;
    end else
    begin
        last_word := '';
        for i := len downto 1 do
        begin
//            symbol[1] := '';
            symbol := copy(smma, i, i)[1];
            if symbol <> ' ' then
            begin
                last_word := symbol + last_word;
            end else
            begin
                if length(last_word + ' ' + s2) >= max_len2 then
                begin
                    if length(copy(smma, 1, i))+1+length(last_word)> max_len1 then
                    begin
                       result := false;
                       exit;
                    end else
                    begin
                        s1      := copy(smma, 1, i) + ' ' + last_word;
                        result  := true;
                        exit;
                    end;
                end else
                begin
                    s2 := last_word + ' ' + s2;
                    last_word := '';
                end;
            end;

        end;
        if length(last_word + ' ' + s2) >= max_len2 then
        begin
            if length(copy(smma, 1, i))+1+length(last_word)> max_len1 then
            begin
                result := false;
                exit;
            end else
            begin
                s1      := last_word;
                result  := true;
                exit;
            end;
        end else
        begin
            s2 := last_word + ' ' + s2;
            result  := true;
            exit;
        end;
    end;
end;

procedure TfmKassaDocMainForm.ActionPrint2009Click(Sender: TObject);
var
    month, day, year : integer;
    year_l, month_l, day_l, mon, n, s, v, d, grivna, kop, s1, s2, seriya, n_serii, nn, dd : string;
    id : int64;
    error, prihodn, er : integer;
    print_pass : integer;
    e : boolean;
    hide_b_r_s_k : integer;
begin
    if DataSetMain.IsEmpty then exit;

    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;

    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Print');
    if error <> 0 then
    begin
        er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Print_blank2009','Print');
        if er <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(er)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end;

    id := TFIBBCDField(DataSetMain.FieldByName('ID_DT_DOC')).AsInt64;

    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetKorSch.Open;
    print_pass := DataSetKorSch.FieldByName('PRINT_PASPORT').AsInteger;
    if(DataSetKorSch['HIDE_B_RZ_ST_KEKV']<>null) then
        hide_b_r_s_k := DataSetKorSch.FieldByName('HIDE_B_RZ_ST_KEKV').AsInteger
    else
        hide_b_r_s_k := 0;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_TO_PRINT_PRIH_RAS('''+DataSetMain.FieldByName('ID_DT_DOC').AsString+''')';
    DataSetKorSch.Open;

        DataSetDay.Locate('ID_DT_DAY', id_day, []);

        year := YearOf(DataSetDay['DAY_KASSA']);
        frVariables['year_r']  := year;
        year := year mod 100;
        year_l := IntToStr(year);
        if length(year_l) = 1 then year_l := '0' + year_l;

        month := MonthOf(DataSetDay['DAY_KASSA']);
        case month of
            1 : mon  :='січень';
            2 : mon  :='лютий';
            3 : mon  :='березень';
            4 : mon  :='квітень';
            5 : mon  :='травень';
            6 : mon  :='червень';
            7 : mon  :='липень';
            8 : mon  :='серпень';
            9 : mon  :='вересень';
            10 : mon :='жовтень';
            11 : mon :='листопад';
            12 : mon :='грудень';
        end;

        month_l := IntToStr(month);
        if length(month_l) = 1 then month_l := '0' + month_l;

        day   := DayOf(DataSetDay['DAY_KASSA']);
        day_l := IntToStr(day);
        if length(day_l) = 1 then day_l := '0' + day_l;


//    if DataSetKorSch['PREDPRIYATIE'] = 0 then
//    begin
        if DataSetMain['PRIHOD_RASHOD'] = 1 then
        frxReport4.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10103.fr3');

        if DataSetMain['PRIHOD_RASHOD'] = 0 then
        begin
            frxReport4.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10104.fr3');
            frxReport4.Variables['passp']               := QuotedStr(' ');
        end;

        if (print_pass = 1) and (DataSetMain.FieldByName('ID_MAN').AsVariant > 0) and (DataSetMain['PRIHOD_RASHOD'] = 0) then
        begin
            if DataSetMain.FieldByName('NUMBER_PASS').AsString <> null
                then n  := DataSetMain.FieldByName('NUMBER_PASS').AsString
                else n  := ' ';
            if DataSetMain.FieldByName('SERIYA_PASS').AsString <> null
                then s  := DataSetMain.FieldByName('SERIYA_PASS').AsString
                else s  := ' ';
            if DataSetMain.FieldByName('VIDAN').AsString <> null
                then v  := DataSetMain.FieldByName('VIDAN').AsString
                else v  := ' ';
            if DataSetMain.FieldByName('DATE_VIDAN').AsDateTime <> null
                then d  := DataSetMain.FieldByName('DATE_VIDAN').AsString
                else d  := ' ';
            if n <> '' then
            if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_PRINT_PASS_DATA), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO and IDNO)=mrYes then
            begin
                frxReport4.Variables['passp'] := QuotedStr(Un_R_file_Alex.KASSA_PASPORT+ s + ' № ' + n + Un_R_file_Alex.KASSA_VIDAN + v + Un_R_file_Alex.KASSA_OT + d);
            end;
        end;

        frxReport4.Variables['seriya']              := QuotedStr(DataSetMain.fbn('SERIYA').AsString);
        frxReport4.Variables['n_serii']             := QuotedStr(DataSetMain.fbn('N_SERII').AsString);
        frxReport4.Variables['day_']                := QuotedStr(day_l);
        frxReport4.Variables['month_']              := QuotedStr(month_l);
        frxReport4.Variables['mon']                 := QuotedStr(mon);
        frxReport4.Variables['year_']               := QuotedStr(year_l);
        if year<=9 then frxReport4.Variables['y']   := QuotedStr('0'+IntToStr(year))
        else
        frxReport4.Variables['y']                   := QuotedStr(IntToStr(year));
        frxReport4.Variables['hide_info']           := QuotedStr(IntToStr(hide_b_r_s_k));
        frxReport4.Variables['s']                   := QuotedStr(DataSetMain.FieldByName('SUMMA_DOC').AsString);
        frxReport4.Variables['n']                   := QuotedStr(DataSetMain.FieldByName('NUMBER_DOC').AsString);
        frxReport4.Variables['o']                   := QuotedStr(DataSetMain.FieldByName('OSNOVANIE').AsString);
        frxReport4.Variables['f']                   := QuotedStr(DataSetMain.FieldByName('FIO').AsString);
        frxReport4.Variables['okpo']                := QuotedStr(DataSetKorSch.fieldByname('OKPO').AsString);
        frxReport4.Variables['comp']                := QuotedStr(GetComputerNetName);
        frxReport4.Variables['id_user']             := QuotedStr(IntToStr(myclass.id_user));
        frxReport4.Variables['s_r_s_k']             := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        IF DataSetKorSch.FieldByName('LANG').AsInteger = 1 then
        begin
            SummToGrivAdnKop_rus(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat), grivna, kop);
            if DataSetMain['PRIHOD_RASHOD'] = 1 then
            begin
                if Summa_on_words(grivna, 60, 30, s1, s2) then
                begin
                    frxReport4.Variables['suma_v']    := QuotedStr(s1);
                    frxReport4.Variables['suma_n']    := QuotedStr(s2);
                end else
                begin
                    showmessage('Дліна назви суми прописов перевищує норму! Ордер не буде надруковано!');
                    exit;
                end;
                if Summa_on_words(grivna, 36, 22, s1, s2) then
                begin
                    frxReport4.Variables['suma_vr']   := QuotedStr(s1);
                    frxReport4.Variables['suma_nr']   := QuotedStr(s2);
                end else
                begin
                    showmessage('Дліна назви суми прописов перевищує норму! Ордер не буде надруковано!');
                    exit;
                end;
            end;
            if DataSetMain['PRIHOD_RASHOD'] = 0 then
            begin
                if Summa_on_words(grivna, 100, 60, s1, s2) then
                begin
                    frxReport4.Variables['suma_v']    := QuotedStr(s1);
                    frxReport4.Variables['suma_n']    := QuotedStr(s2);
                end else
                begin
                    showmessage('Дліна назви суми прописов перевищує норму! Ордер не буде надруковано!');
                    exit;
                end;
            end;
            frxReport4.Variables['suma_kop']          := QuotedStr(kop);
        end else
        begin
            SummToGrivAdnKop_ukr(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat), grivna, kop);
            if DataSetMain['PRIHOD_RASHOD'] = 1 then
            begin
                if Summa_on_words(grivna, 70, 40, s1, s2) then
                begin
                    frxReport4.Variables['suma_v']    := QuotedStr(s1);
                    frxReport4.Variables['suma_n']    := QuotedStr(s2);
                end else
                begin
                    showmessage('Дліна назви суми прописов перевищує норму! Ордер не буде надруковано!');
                    exit;
                end;
                if Summa_on_words(grivna, 36, 22, s1, s2) then
                begin
                    frxReport4.Variables['suma_vr']   := QuotedStr(s1);
                    frxReport4.Variables['suma_nr']   := QuotedStr(s2);
                end else
                begin
                    showmessage('Дліна назви суми прописов перевищує норму! Ордер не буде надруковано!');
                    exit;
                end;
            end;
            if DataSetMain['PRIHOD_RASHOD'] = 0 then
            begin
                if Summa_on_words(grivna, 100, 60, s1, s2) then
                begin
                    frxReport4.Variables['suma_v']    := QuotedStr(s1);
                    frxReport4.Variables['suma_n']    := QuotedStr(s2);
                end else
                begin
                    showmessage('Дліна назви суми прописов перевищує норму! Ордер не буде надруковано!');
                    exit;
                end;
            end;
            frxReport4.Variables['suma_kop']          := QuotedStr(kop);
        end;
        frxReport4.Variables['name_pred']           := QuotedStr(DataSetKorSch.fieldByname('NAME_PREDPR').AsString);
        frxReport4.Variables['kor_sch']             := QuotedStr(DataSetKorSch.FieldByName('SCH_ALL_KOR').AsString);
        frxReport4.Variables['sm_rz_st_k']          := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport4.PrintOptions.Copies              := 1;

        frxReport4.PrepareReport;
        //frxReport4.ShowReport(true);
        if show_print=1 then
        begin
            frxReport4.PrintOptions.ShowDialog   := true;
            frxReport4.ShowReport(true);
        end else
        begin
            frxReport4.Print;
        end;


    DataSetKorSch.Close;
    DataSetMain.Locate('ID_DT_DOC', id, []);
    if e then cxCheckBoxRefr.Checked := true;
end;

procedure TfmKassaDocMainForm.ActionPrint2009new1Click(Sender: TObject);
var
    month, day, year : integer;
    year_l, month_l, day_l, mon, n, s, v, d, grivna, kop, s1, s2, seriya, n_serii, nn, dd,sum_prop : string;
    id : int64;
    error, er, prihodn : integer;
    print_pass : integer;
    e : boolean;
    print_def : integer;
    hide_b_r_s_k : integer;
begin
   if DataSetMain.IsEmpty then exit;

    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;

    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Print');
    if error <> 0 then
    begin
        er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Print_NBU252_A5','Print');
        if er <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(er)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end;

    id := TFIBBCDField(DataSetMain.FieldByName('ID_DT_DOC')).AsInt64;

    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetKorSch.Open;
    print_pass   := DataSetKorSch.FieldByName('PRINT_PASPORT').AsInteger;
    if(DataSetKorSch['HIDE_B_RZ_ST_KEKV']<>null) then
        hide_b_r_s_k := DataSetKorSch.FieldByName('HIDE_B_RZ_ST_KEKV').AsInteger
    else
        hide_b_r_s_k := 0;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_TO_PRINT_PRIH_RAS('''+DataSetMain.FieldByName('ID_DT_DOC').AsString+''')';
    DataSetKorSch.Open;

        DataSetDay.Locate('ID_DT_DAY', id_day, []);

        year := YearOf(DataSetDay['DAY_KASSA']);
        frVariables['year_r']  := year;
        year := year mod 100;
        year_l := IntToStr(year);
        if length(year_l) = 1 then year_l := '0' + year_l;

        month := MonthOf(DataSetDay['DAY_KASSA']);
        case month of
            1 : mon  :='січень';
            2 : mon  :='лютий';
            3 : mon  :='березень';
            4 : mon  :='квітень';
            5 : mon  :='травень';
            6 : mon  :='червень';
            7 : mon  :='липень';
            8 : mon  :='серпень';
            9 : mon  :='вересень';
            10 : mon :='жовтень';
            11 : mon :='листопад';
            12 : mon :='грудень';
        end;

        month_l := IntToStr(month);
        if length(month_l) = 1 then month_l := '0' + month_l;

        day   := DayOf(DataSetDay['DAY_KASSA']);
        day_l := IntToStr(day);
        if length(day_l) = 1 then day_l := '0' + day_l;


//    if DataSetKorSch['PREDPRIYATIE'] = 0 then
//    begin
        if DataSetMain['PRIHOD_RASHOD'] = 1 then
        frxReport5.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10203.fr3');

        if DataSetMain['PRIHOD_RASHOD'] = 0 then
        begin
            frxReport5.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10204.fr3');
            frxReport5.Variables['passp']               := QuotedStr(' ');
        end;

        if (print_pass = 1) and (DataSetMain.FieldByName('ID_MAN').AsVariant > 0) and (DataSetMain['PRIHOD_RASHOD'] = 0) then
        begin
            if DataSetMain.FieldByName('NUMBER_PASS').AsString <> null
                then n  := DataSetMain.FieldByName('NUMBER_PASS').AsString
                else n  := ' ';
            if DataSetMain.FieldByName('SERIYA_PASS').AsString <> null
                then s  := DataSetMain.FieldByName('SERIYA_PASS').AsString
                else s  := ' ';
            if DataSetMain.FieldByName('VIDAN').AsString <> null
                then v  := DataSetMain.FieldByName('VIDAN').AsString
                else v  := ' ';
            if DataSetMain.FieldByName('DATE_VIDAN').AsDateTime <> null
                then d  := DataSetMain.FieldByName('DATE_VIDAN').AsString
                else d  := ' ';
            if n <> '' then
            if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_PRINT_PASS_DATA), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO and IDNO)=mrYes then
            begin
                frxReport5.Variables['passp'] := QuotedStr(Un_R_file_Alex.KASSA_PASPORT+ s + ' № ' + n + Un_R_file_Alex.KASSA_VIDAN + v + Un_R_file_Alex.KASSA_OT + d);
            end;
        end;

        frxReport5.Variables['seriya']              := QuotedStr(DataSetMain.fbn('SERIYA').AsString);
        frxReport5.Variables['n_serii']             := QuotedStr(DataSetMain.fbn('N_SERII').AsString);
        frxReport5.Variables['day_']                := QuotedStr(day_l);
        frxReport5.Variables['month_']              := QuotedStr(month_l);
        frxReport5.Variables['mon']                 := QuotedStr(mon);
        frxReport5.Variables['year_']               := QuotedStr(year_l);
        if year<=9 then frxReport5.Variables['y']   := QuotedStr('0'+IntToStr(year))
        else
        frxReport5.Variables['y']                   := QuotedStr(IntToStr(year));
        frxReport5.Variables['hide_info']           := QuotedStr(IntToStr(hide_b_r_s_k));
        frxReport5.Variables['s']                   := QuotedStr(DataSetMain.FieldByName('SUMMA_DOC').AsString);
        frxReport5.Variables['n']                   := QuotedStr(DataSetMain.FieldByName('NUMBER_DOC').AsString);
        frxReport5.Variables['o']                   := QuotedStr(DataSetMain.FieldByName('OSNOVANIE').AsString);
        frxReport5.Variables['f']                   := QuotedStr(DataSetMain.FieldByName('FIO').AsString);
        frxReport5.Variables['okpo']                := QuotedStr(DataSetKorSch.fieldByname('OKPO').AsString);
        frxReport5.Variables['comp']                := QuotedStr(GetComputerNetName);
        frxReport5.Variables['id_user']             := QuotedStr(IntToStr(myclass.id_user));
        frxReport5.Variables['s_r_s_k']             := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport5.Variables['id_doc']    := QuotedStr(DataSetMain.FieldByName('ID_DT_DOC').AsString);

        IF DataSetKorSch.FieldByName('LANG').AsInteger = 1
            then frxReport5.Variables['sum_prop'] := QuotedStr(AllChislo(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)))
            else frxReport5.Variables['sum_prop'] := QuotedStr(AllChislo_ukr(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)));


        frxReport5.Variables['suma_kop']            := QuotedStr(kop);
        frxReport5.Variables['name_pred']           := QuotedStr(DataSetKorSch.fieldByname('NAME_PREDPR').AsString);
        frxReport5.Variables['kor_sch']             := QuotedStr(DataSetKorSch.FieldByName('SCH_ALL_KOR').AsString);
        frxReport5.Variables['sm_rz_st_k']          := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport5.Variables['glbuhg']              := QuotedStr(DataSetKorSch.fieldByname('glbuhg_fio').AsString);
        frxReport5.Variables['chief']               := QuotedStr(DataSetKorSch.fieldByname('chief_fio').AsString);
        frxReport5.PrintOptions.Copies              := 1;

        frxReport5.PrepareReport;

        if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
        begin
          frxReport5.DesignReport;
          Exit;
        end;

        if show_print=1 then
        begin
            frxReport5.PrintOptions.ShowDialog   := true;
            frxReport5.ShowReport(true);
        end else
        begin
            frxReport5.Print;
        end;

    DataSetKorSch.Close;
    DataSetMain.Locate('ID_DT_DOC', id, []);
    if e then cxCheckBoxRefr.Checked := true;
end;


procedure TfmKassaDocMainForm.ActionPrint2009forA41Click(Sender: TObject);
var
    month, day, year : integer;
    year_l, month_l, day_l, mon, n, s, v, d : string;
    id : int64;
    error, er : integer;
    print_pass : integer;
    e : boolean;
    hide_b_r_s_k : integer;
begin
    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;

    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Print');
    if error <> 0 then
    begin
        er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Print_NBU252_A4','Print');
        if er <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(er)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end;

    if DataSetMain.IsEmpty then exit;

    id := TFIBBCDField(DataSetMain.FieldByName('ID_DT_DOC')).AsInt64;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetKorSch.Open;
    print_pass := DataSetKorSch.FieldByName('PRINT_PASPORT').AsInteger;
    if(DataSetKorSch['HIDE_B_RZ_ST_KEKV']<>null) then
        hide_b_r_s_k := DataSetKorSch.FieldByName('HIDE_B_RZ_ST_KEKV').AsInteger
    else
        hide_b_r_s_k := 0;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_TO_PRINT_PRIH_RAS('''+DataSetMain.FieldByName('ID_DT_DOC').AsString+''')';
    DataSetKorSch.Open;

        DataSetDay.Locate('ID_DT_DAY', id_day, []);

        year := YearOf(DataSetDay['DAY_KASSA']);
        frVariables['year_r']  := year;
        year := year mod 100;
        year_l := IntToStr(year);
        if length(year_l) = 1 then year_l := '0' + year_l;

        month := MonthOf(DataSetDay['DAY_KASSA']);
        case month of
            1 : mon  :='січень';
            2 : mon  :='лютий';
            3 : mon  :='березень';
            4 : mon  :='квітень';
            5 : mon  :='травень';
            6 : mon  :='червень';
            7 : mon  :='липень';
            8 : mon  :='серпень';
            9 : mon  :='вересень';
            10 : mon :='жовтень';
            11 : mon :='листопад';
            12 : mon :='грудень';
        end;
        month_l := IntToStr(month);
        if length(month_l) = 1 then month_l := '0' + month_l;

        day   := DayOf(DataSetDay['DAY_KASSA']);
        day_l := IntToStr(day);
        if length(day_l) = 1 then day_l := '0' + day_l;


        if DataSetMain['PRIHOD_RASHOD'] = 1 then
        begin
            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10002.fr3');
            frxReport1.PrintOptions.Copies := 1;
        end;
        if DataSetMain['PRIHOD_RASHOD'] = 0 then
        begin
            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10001.fr3');
            frxReport1.PrintOptions.Copies := 1;
            frxReport1.Variables['passp']               := QuotedStr(' ');
        end;
         if (print_pass = 1) and (DataSetMain.FieldByName('ID_MAN').AsVariant > 0) and (DataSetMain['PRIHOD_RASHOD'] = 0) then
        begin
            if DataSetMain.FieldByName('NUMBER_PASS').AsString <> null
                then n  := DataSetMain.FieldByName('NUMBER_PASS').AsString
                else n  := ' ';
            if DataSetMain.FieldByName('SERIYA_PASS').AsString <> null
                then s  := DataSetMain.FieldByName('SERIYA_PASS').AsString
                else s  := ' ';
            if DataSetMain.FieldByName('VIDAN').AsString <> null
                then v  := DataSetMain.FieldByName('VIDAN').AsString
                else v  := ' ';
            if DataSetMain.FieldByName('DATE_VIDAN').AsDateTime <> null
                then d  := DataSetMain.FieldByName('DATE_VIDAN').AsString
                else d  := ' ';
            if n <> '' then
            if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_PRINT_PASS_DATA), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO and IDNO)=mrYes then
            begin
                frxReport1.Variables['passp'] := QuotedStr(Un_R_file_Alex.KASSA_PASPORT+ s + ' № ' + n + Un_R_file_Alex.KASSA_VIDAN + v + Un_R_file_Alex.KASSA_OT + d);
            end;
        end;
        frxReport1.Variables['day_']   := QuotedStr(day_l);
        frxReport1.Variables['month_'] := QuotedStr(month_l);
        frxReport1.Variables['mon']    := QuotedStr(mon);
        frxReport1.Variables['year_']  := QuotedStr(year_l);
        if year<=9 then frxReport1.Variables['y']   := QuotedStr('0'+IntToStr(year))
        else
        frxReport1.Variables['y']                   := QuotedStr(IntToStr(year));
        frxReport1.Variables['s']      := QuotedStr(DataSetMain.FieldByName('SUMMA_DOC').AsString);
        frxReport1.Variables['n']      := QuotedStr(DataSetMain.FieldByName('NUMBER_DOC').AsString);
        frxReport1.Variables['o']      := QuotedStr(DataSetMain.FieldByName('OSNOVANIE').AsString);
        frxReport1.Variables['f']      := QuotedStr(DataSetMain.FieldByName('FIO').AsString);
        frxReport1.Variables['okpo']   := QuotedStr(DataSetKorSch.fieldByname('OKPO').AsString);
        frxReport1.Variables['comp']   := QuotedStr(GetComputerNetName);
        frxReport1.Variables['id_user']   := QuotedStr(IntToStr(myclass.id_user));
        frxReport1.Variables['hide_info']           := QuotedStr(IntToStr(hide_b_r_s_k));
        IF DataSetKorSch.FieldByName('LANG').AsInteger = 1
            then frxReport1.Variables['suma_prop'] := QuotedStr(AllChislo(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)))
            else frxReport1.Variables['suma_prop'] := QuotedStr(AllChislo_ukr(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)));
        frxReport1.Variables['name_pred']  := QuotedStr(DataSetKorSch.fieldByname('NAME_PREDPR').AsString);
        frxReport1.Variables['kor_sch']    := QuotedStr(DataSetMain.FieldByName('KOR_SCH').AsString);//QuotedStr(DataSetKorSch.fieldByname('KOD_KOR_SCH').AsString);
        frxReport1.Variables['sm_rz_st_k'] := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport1.PrintOptions.Copies := 1;

        frxReport1.PrepareReport;

        if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
        begin
          frxReport1.DesignReport;
          Exit;
        end;

        if show_print=1 then
        begin
            frxReport1.PrintOptions.ShowDialog   := true;
            frxReport1.ShowReport(true);
        end else
        begin
            frxReport1.Print;
        end;

    DataSetKorSch.Close;
    DataSetMain.Locate('ID_DT_DOC', id, []);
    if e then cxCheckBoxRefr.Checked := true;
end;

procedure TfmKassaDocMainForm.ActionPrintVedomost2009Click(
  Sender: TObject);
var
    pk_id : int64;
    month,i, error, er : integer;
    mon   : string;
    e : boolean;
begin
    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;

    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Print');
    if error <> 0 then
    begin
        er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Print_ved_NBU252','Print');
        if er <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(er)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end;

    if not DataSetMain.IsEmpty then
    begin

        pk_id := StrToInt64(DataSetMain.FieldByName('ID_ALL_DOC').AsString);
        DataSetVedom.Close;
        DataSetVedom.Sqls.SelectSQL.Text := 'select * from KASSA_CREATE_VEDOMOST('+IntToStr(pk_id)+')';
        DataSetVedom.Open;
        DataSetVedom.FetchAll; 
        month := MonthOf(DataSetDay['DAY_KASSA']);
        case month of
            1 : mon  :='січень';
            2 : mon  :='лютий';
            3 : mon  :='березень';
            4 : mon  :='квітень';
            5 : mon  :='травень';
            6 : mon  :='червень';
            7 : mon  :='липень';
            8 : mon  :='серпень';
            9 : mon  :='вересень';
            10 : mon :='жовтень';
            11 : mon :='листопад';
            12 : mon :='грудень';
        end;

        frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_vedomost2009.fr3');
        frxReport2.Variables['Vedom']      := QuotedStr(DataSetMain.FieldByName('FIO').AsString);//QuotedStr(DataSetKorSch.fieldByname('KOD_KOR_SCH').AsString);
        frxReport2.Variables['sum_propis'] := QuotedStr(AllChislo_ukr(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)));
        frxReport2.Variables['mon']        := QuotedStr(mon);
        frxReport2.Variables['year']       := QuotedStr(INtToStr(YearOf(DataSetDay['DAY_KASSA'])));
        frxReport2.Variables['note']       := QuotedStr(DataSetMain.FieldByName('OSNOVANIE').AsString);
        frxReport2.Variables['n']          := QuotedStr(DataSetMain.FieldByName('NUMBER_DOC').AsString);
        frxReport2.Variables['sum']        := QuotedStr(Chislo_grn_kop(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)));
//        frxReport2.Variables['sm_rz_st_k'] := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport2.Variables['kor_sch']    := QuotedStr(DataSetMain.FieldByName('KOR_SCH').AsString);
        frxReport2.Variables['num_ved']    := QuotedStr(Nomer(DataSetMain.FieldByName('FIO').AsString));
        frxReport2.PrepareReport;
        //frxReport2.ShowReport(true);

        if show_print=1 then
        begin
            frxReport2.PrintOptions.ShowDialog   := true;
            frxReport2.ShowReport(true);
        end else
        begin
            frxReport2.Print;
        end;

        DataSetVedom.Close;
    end;
    if e then cxCheckBoxRefr.Checked := true;
end;

procedure TfmKassaDocMainForm.ActionPrintMonitor2009Execute(
  Sender: TObject);
var
    month, day, year : integer;
    year_l, month_l, day_l, mon, n, s, v, d, grivna, kop, s1, s2, seriya, n_serii, nn, dd,sum_prop : string;
    id : int64;
    error, er, prihodn : integer;
    print_pass : integer;
    e : boolean;
    print_def : integer;
begin
    show_print := 0;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetKorSch.Open;

    print_def  := DataSetKorSch.FieldByName('PRINT_DEFAULT').AsInteger;

     if (print_def=1) then
    begin
        APrintBlankClearExecute(Self);
        show_print := 1;
    end else
    if (print_def=2) then
    begin
        APrintBlankExecute(Self);
        show_print := 1;
    end else
    if (print_def=3) then
    begin
        ActionPtintVedomostExecute(Self);
        show_print := 1;
    end else
    if (print_def=4) then
    begin
        ActionPrintExecute(Self);
        show_print := 1;
    end else
    if (print_def=5) then
    begin
        ActionPrint2009Click(Self);
        show_print := 1;
    end else
    if (print_def=6) then
    begin
        ActionPrint2009new1Click(Self);
        show_print := 1;
    end else
    if (print_def=7) then
    begin
        ActionPrint2009forA41Click(Self);
        show_print := 1;
    end else
     if (print_def=8) then
    begin
        ActionPrintVedomost2009Click(Self);
        show_print := 1;
    end else
    if (print_def=9) then
    begin
        ActionPrintNBU252_albomClick(Self);
        show_print := 1;
    end else
    begin
        showmessage(Un_R_file_Alex.KASSA_CHECK_SETUP_PRINT_ORD);
    end;


    {if DataSetMain.IsEmpty then exit;

    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;

    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Print');
    if error <> 0 then
    begin
        er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Print_NBU252_A5','Print');
        if er <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(er)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end;

    id := TFIBBCDField(DataSetMain.FieldByName('ID_DT_DOC')).AsInt64;

    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetKorSch.Open;
    print_pass := DataSetKorSch.FieldByName('PRINT_PASPORT').AsInteger;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_TO_PRINT_PRIH_RAS('''+DataSetMain.FieldByName('ID_DT_DOC').AsString+''')';
    DataSetKorSch.Open;

        DataSetDay.Locate('ID_DT_DAY', id_day, []);

        year := YearOf(DataSetDay['DAY_KASSA']);
        frVariables['year_r']  := year;
        year := year mod 100;
        year_l := IntToStr(year);
        if length(year_l) = 1 then year_l := '0' + year_l;

        month := MonthOf(DataSetDay['DAY_KASSA']);
        case month of
            1 : mon  :='січень';
            2 : mon  :='лютий';
            3 : mon  :='березень';
            4 : mon  :='квітень';
            5 : mon  :='травень';
            6 : mon  :='червень';
            7 : mon  :='липень';
            8 : mon  :='серпень';
            9 : mon  :='вересень';
            10 : mon :='жовтень';
            11 : mon :='листопад';
            12 : mon :='грудень';
        end;

        month_l := IntToStr(month);
        if length(month_l) = 1 then month_l := '0' + month_l;

        day   := DayOf(DataSetDay['DAY_KASSA']);
        day_l := IntToStr(day);
        if length(day_l) = 1 then day_l := '0' + day_l;


//    if DataSetKorSch['PREDPRIYATIE'] = 0 then
//    begin
        if DataSetMain['PRIHOD_RASHOD'] = 1 then
        frxReport5.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10203.fr3');

        if DataSetMain['PRIHOD_RASHOD'] = 0 then
        begin
            frxReport5.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10204.fr3');
            frxReport5.Variables['passp']               := QuotedStr(' ');
        end;

        if (print_pass = 1) and (DataSetMain.FieldByName('ID_MAN').AsVariant > 0) and (DataSetMain['PRIHOD_RASHOD'] = 0) then
        begin
            if DataSetMain.FieldByName('NUMBER_PASS').AsString <> null
                then n  := DataSetMain.FieldByName('NUMBER_PASS').AsString
                else n  := ' ';
            if DataSetMain.FieldByName('SERIYA_PASS').AsString <> null
                then s  := DataSetMain.FieldByName('SERIYA_PASS').AsString
                else s  := ' ';
            if DataSetMain.FieldByName('VIDAN').AsString <> null
                then v  := DataSetMain.FieldByName('VIDAN').AsString
                else v  := ' ';
            if DataSetMain.FieldByName('DATE_VIDAN').AsDateTime <> null
                then d  := DataSetMain.FieldByName('DATE_VIDAN').AsString
                else d  := ' ';
            if n <> '' then
            if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_PRINT_PASS_DATA), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO and IDNO)=mrYes then
            begin
                frxReport5.Variables['passp'] := QuotedStr(Un_R_file_Alex.KASSA_PASPORT+ s + ' № ' + n + Un_R_file_Alex.KASSA_VIDAN + v + Un_R_file_Alex.KASSA_OT + d);
            end;
        end;

        frxReport5.Variables['seriya']              := QuotedStr(DataSetMain.fbn('SERIYA').AsString);
        frxReport5.Variables['n_serii']             := QuotedStr(DataSetMain.fbn('N_SERII').AsString);
        frxReport5.Variables['day_']                := QuotedStr(day_l);
        frxReport5.Variables['month_']              := QuotedStr(month_l);
        frxReport5.Variables['mon']                 := QuotedStr(mon);
        frxReport5.Variables['year_']               := QuotedStr(year_l);
        if year<=9 then frxReport5.Variables['y']   := QuotedStr('0'+IntToStr(year))
        else
        frxReport5.Variables['y']                   := QuotedStr(IntToStr(year));
        frxReport5.Variables['s']                   := QuotedStr(DataSetMain.FieldByName('SUMMA_DOC').AsString);
        frxReport5.Variables['n']                   := QuotedStr(DataSetMain.FieldByName('NUMBER_DOC').AsString);
        frxReport5.Variables['o']                   := QuotedStr(DataSetMain.FieldByName('OSNOVANIE').AsString);
        frxReport5.Variables['f']                   := QuotedStr(DataSetMain.FieldByName('FIO').AsString);
        frxReport5.Variables['okpo']                := QuotedStr(DataSetKorSch.fieldByname('OKPO').AsString);
        frxReport5.Variables['comp']                := QuotedStr(GetComputerNetName);
        frxReport5.Variables['id_user']             := QuotedStr(IntToStr(myclass.id_user));
        frxReport5.Variables['s_r_s_k']             := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport5.Variables['id_doc']    := QuotedStr(DataSetMain.FieldByName('ID_DT_DOC').AsString);

        IF DataSetKorSch.FieldByName('LANG').AsInteger = 1
            then frxReport5.Variables['sum_prop'] := QuotedStr(AllChislo(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)))
            else frxReport5.Variables['sum_prop'] := QuotedStr(AllChislo_ukr(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)));

        frxReport5.Variables['suma_kop']            := QuotedStr(kop);
        frxReport5.Variables['name_pred']           := QuotedStr(DataSetKorSch.fieldByname('NAME_PREDPR').AsString);
        frxReport5.Variables['kor_sch']             := QuotedStr(DataSetKorSch.FieldByName('SCH_ALL_KOR').AsString);
        frxReport5.Variables['sm_rz_st_k']          := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport5.PrintOptions.Copies              := 1;

        frxReport5.PrepareReport;
        //frxReport5.PrintOptions.ShowDialog   := true;

        frxReport5.Print;

    DataSetKorSch.Close;
    DataSetMain.Locate('ID_DT_DOC', id, []);
    if e then cxCheckBoxRefr.Checked := true;  }
end;

procedure TfmKassaDocMainForm.cxGrid1DBBandedTableView1KeyPress(
  Sender: TObject; var Key: Char);
var
    T      : TfmKassOrder;
    str, str1, code10    : string;
    i, l   : integer;
    prih : smallInt;
begin
    if (use_barcode=0) then
    begin
        Key := Chr(0);
        exit;
    end;
    
    str  := '';
    str1 := '';

    if ((Ord(Key) < 48) or (Ord(Key) > 57)) and (Ord(Key) <> 13)and (Ord(Key) <> 8) then
        Key := Chr(0) else
        if (Ord(Key) <> 13) and  ((Ord(Key) > 48) or (Ord(Key) < 57)) then
        begin
            barstr:= barstr+key;
            //cxTextEdit2.Text := barstr;
        end;

    if (Ord(Key) = 13) then
    begin
        l    := length(barstr);
        str1 := copy(barstr, l-1, 2);

        if (barstr = '') then
             exit else
        if (l<10) then
        begin
             barstr := '';
             str    := '';
             cxTextEdit2.Text := '';
             exit;
        end else
        if (str1=id_server) then
        begin
            barstr := copy(barstr, l-9, 10);
            str    := copy(barstr, 1, 2);

            if  (str=cn_barcode) then shablon_barcode       := Un_R_file_Alex.BANK_DOG_OBUCH else
                if (str=st_barcode) then shablon_barcode       := Un_R_file_Alex.BANK_STUD_CITY;

                if (str=cn_barcode) or (str=st_barcode) then
                begin
                    cxTextEdit2.Text := barstr;

                    if (barcode_prih = 2) then
                    begin
                         if (str=cn_barcode)  then
                         begin
                            if Show_fmPrihod(barstr, shablon_barcode, prih) then
                            begin
                                prihod := prih;
                                flag_def_f :=1;
                                if DogZaObuchNew then
                                begin
                                    T := TfmKassOrder.Create(self, myclass, AddOrder, self, DogTritiesNew);
                                    T.ShowModal;
                                    T.Free;
                                end;
                            end;
                         end else
                         if (str=st_barcode) then
                         begin
                             flag_def_f :=1;
                             if Show_fmPrihod(barstr, shablon_barcode, prih) then
                             begin
                                 prihod := prih;
                                 T := TfmKassOrder.Create(self, myclass, AddOrder, self, Stud);
                                 T.ShowModal;
                                 T.Free;
                             end;
                         end  else
                         begin
                             //showmessage('Штрих-код '+barstr+' не визначен 3');
                             barstr := '';
                             str    := '';
                             str1 := '';
                             cxTextEdit2.Text := '';
                             exit;
                         end;
                  end else
                      begin
                          prihod :=barcode_prih;
                          if (str=cn_barcode)  then
                          begin
                              flag_def_f :=1;
                              if DogZaObuchNew then
                              begin
                                  T := TfmKassOrder.Create(self, myclass, AddOrder, self, DogTritiesNew);
                                  T.ShowModal;
                                  T.Free;
                              end;
                          end else
                          if (str=st_barcode) then
                          begin
                              flag_def_f :=1;
                              T := TfmKassOrder.Create(self, myclass, AddOrder, self, Stud);
                              T.ShowModal;
                              T.Free;
                          end else
                          begin
                              //showmessage('Штрих-код '+barstr+' не визначен 2');
                              barstr := '';
                              str    := '';
                              str1 := '';
                              cxTextEdit2.Text := '';
                              exit;
                          end;
                      end;
            end;
            barstr := '';
            str    := '';
            str1   := '';
            cxTextEdit2.Text := '';
            exit;

        end;
        barstr := '';
        str    := '';
        str1   := '';
        cxTextEdit2.Text := '';
        exit;
    end;

end;

procedure TfmKassaDocMainForm.cxButton1Click(Sender: TObject);
var
    t : boolean;
    s: string;
begin
    t := DataSetMain.Locate('FIO', cxTextEdit1.Text, [loPartialKey]);
    if not t then
    begin
        s := AnsiUpperCase(cxTextEdit1.Text);
        if DataSetMain.Locate('FIO', s, [loPartialKey]) then cxGrid1.setFocus;
    end else cxGrid1.setFocus;
end;

procedure TfmKassaDocMainForm.cxButton2Click(Sender: TObject);
var
    k : char;
begin
    k:=#13;
    cxGrid1DBBandedTableView1KeyPress(self,k);
end;

procedure TfmKassaDocMainForm.ActionPrintNBU252_albomClick(
  Sender: TObject);
var
    month, day, year : integer;
    year_l, month_l, day_l, mon, n, s, v, d, grivna, kop, s1, s2, seriya, n_serii, nn, dd,sum_prop : string;
    id : int64;
    error, er, prihodn : integer;
    print_pass : integer;
    e : boolean;
    print_def : integer;
    hide_b_r_s_k : integer;
begin
   if DataSetMain.IsEmpty then exit;

    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;

    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Print');
    if error <> 0 then
    begin
        er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Print_NBU252_A5_alb','Print');
        if er <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(er)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end;

    id := TFIBBCDField(DataSetMain.FieldByName('ID_DT_DOC')).AsInt64;

    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetKorSch.Open;
    print_pass := DataSetKorSch.FieldByName('PRINT_PASPORT').AsInteger;
    if(DataSetKorSch['HIDE_B_RZ_ST_KEKV']<>null) then
        hide_b_r_s_k := DataSetKorSch.FieldByName('HIDE_B_RZ_ST_KEKV').AsInteger
    else
        hide_b_r_s_k := 0;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_TO_PRINT_PRIH_RAS('''+DataSetMain.FieldByName('ID_DT_DOC').AsString+''')';
    DataSetKorSch.Open;

        DataSetDay.Locate('ID_DT_DAY', id_day, []);

        year := YearOf(DataSetDay['DAY_KASSA']);
        frVariables['year_r']  := year;
        year := year mod 100;
        year_l := IntToStr(year);
        if length(year_l) = 1 then year_l := '0' + year_l;

        month := MonthOf(DataSetDay['DAY_KASSA']);
        case month of
            1 : mon  :='січень';
            2 : mon  :='лютий';
            3 : mon  :='березень';
            4 : mon  :='квітень';
            5 : mon  :='травень';
            6 : mon  :='червень';
            7 : mon  :='липень';
            8 : mon  :='серпень';
            9 : mon  :='вересень';
            10 : mon :='жовтень';
            11 : mon :='листопад';
            12 : mon :='грудень';
        end;

        month_l := IntToStr(month);
        if length(month_l) = 1 then month_l := '0' + month_l;

        day   := DayOf(DataSetDay['DAY_KASSA']);
        day_l := IntToStr(day);
        if length(day_l) = 1 then day_l := '0' + day_l;


//    if DataSetKorSch['PREDPRIYATIE'] = 0 then
//    begin
        if DataSetMain['PRIHOD_RASHOD'] = 1 then
        frxReport5.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_NBU252_albom_P.fr3');

        if DataSetMain['PRIHOD_RASHOD'] = 0 then
        begin
            frxReport5.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_NBU252_albom_R.fr3');
            frxReport5.Variables['passp']               := QuotedStr(' ');
        end;

        if (print_pass = 1) and (DataSetMain.FieldByName('ID_MAN').AsVariant > 0) and (DataSetMain['PRIHOD_RASHOD'] = 0) then
        begin
            if DataSetMain.FieldByName('NUMBER_PASS').AsString <> null
                then n  := DataSetMain.FieldByName('NUMBER_PASS').AsString
                else n  := ' ';
            if DataSetMain.FieldByName('SERIYA_PASS').AsString <> null
                then s  := DataSetMain.FieldByName('SERIYA_PASS').AsString
                else s  := ' ';
            if DataSetMain.FieldByName('VIDAN').AsString <> null
                then v  := DataSetMain.FieldByName('VIDAN').AsString
                else v  := ' ';
            if DataSetMain.FieldByName('DATE_VIDAN').AsDateTime <> null
                then d  := DataSetMain.FieldByName('DATE_VIDAN').AsString
                else d  := ' ';
            if n <> '' then
            if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_PRINT_PASS_DATA), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO and IDNO)=mrYes then
            begin
                frxReport5.Variables['passp'] := QuotedStr(Un_R_file_Alex.KASSA_PASPORT+ s + ' № ' + n + Un_R_file_Alex.KASSA_VIDAN + v + Un_R_file_Alex.KASSA_OT + d);
            end;
        end;

        frxReport5.Variables['seriya']              := QuotedStr(DataSetMain.fbn('SERIYA').AsString);
        frxReport5.Variables['n_serii']             := QuotedStr(DataSetMain.fbn('N_SERII').AsString);
        frxReport5.Variables['day_']                := QuotedStr(day_l);
        frxReport5.Variables['month_']              := QuotedStr(month_l);
        frxReport5.Variables['mon']                 := QuotedStr(mon);
        frxReport5.Variables['year_']               := QuotedStr(year_l);
        if year<=9 then frxReport5.Variables['y']   := QuotedStr('0'+IntToStr(year))
        else
        frxReport5.Variables['y']                   := QuotedStr(IntToStr(year));
        frxReport5.Variables['hide_info']           := QuotedStr(IntToStr(hide_b_r_s_k));
        frxReport5.Variables['s']                   := QuotedStr(DataSetMain.FieldByName('SUMMA_DOC').AsString);
        frxReport5.Variables['n']                   := QuotedStr(DataSetMain.FieldByName('NUMBER_DOC').AsString);
        frxReport5.Variables['o']                   := QuotedStr(DataSetMain.FieldByName('OSNOVANIE').AsString);
        frxReport5.Variables['f']                   := QuotedStr(DataSetMain.FieldByName('FIO').AsString);
        frxReport5.Variables['okpo']                := QuotedStr(DataSetKorSch.fieldByname('OKPO').AsString);
        frxReport5.Variables['comp']                := QuotedStr(GetComputerNetName);
        frxReport5.Variables['id_user']             := QuotedStr(IntToStr(myclass.id_user));
        frxReport5.Variables['s_r_s_k']             := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport5.Variables['id_doc']    := QuotedStr(DataSetMain.FieldByName('ID_DT_DOC').AsString);

        IF DataSetKorSch.FieldByName('LANG').AsInteger = 1
            then frxReport5.Variables['sum_prop'] := QuotedStr(AllChislo(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)))
            else frxReport5.Variables['sum_prop'] := QuotedStr(AllChislo_ukr(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)));


        frxReport5.Variables['suma_kop']            := QuotedStr(kop);
        frxReport5.Variables['name_pred']           := QuotedStr(DataSetKorSch.fieldByname('NAME_PREDPR').AsString);
        frxReport5.Variables['kor_sch']             := QuotedStr(DataSetKorSch.FieldByName('SCH_ALL_KOR').AsString);
        frxReport5.Variables['sm_rz_st_k']          := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport5.PrintOptions.Copies              := 1;

        frxReport5.PrepareReport;

        if show_print=1 then
        begin
            frxReport5.PrintOptions.ShowDialog   := true;
            //frxReport5.DesignReport;
            frxReport5.ShowReport(true);
        end else
        begin
            frxReport5.PrintOptions.ShowDialog   := false;
            frxReport5.Print;
        end;

    DataSetKorSch.Close;
    DataSetMain.Locate('ID_DT_DOC', id, []);
    if e then cxCheckBoxRefr.Checked := true;
end;

procedure TfmKassaDocMainForm.ToolButton6Click(Sender: TObject);
var
    print_def : integer;
begin
    show_print := 1;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetKorSch.Open;

    print_def  := DataSetKorSch.FieldByName('PRINT_DEFAULT').AsInteger;

    if (print_def=1) then
    begin
        APrintBlankClearExecute(Self);
        show_print := 1;
    end else
    if (print_def=2) then
    begin
        APrintBlankExecute(Self);
        show_print := 1;
    end else
    if (print_def=3) then
    begin
        ActionPtintVedomostExecute(Self);
        show_print := 1;
    end else
    if (print_def=4) then
    begin
        ActionPrintExecute(Self);
        show_print := 1;
    end else
    if (print_def=5) then
    begin
        ActionPrint2009Click(Self);
        show_print := 1;
    end else
    if (print_def=6) then
    begin
        ActionPrint2009new1Click(Self);
        show_print := 1;
    end else
    if (print_def=7) then
    begin
        ActionPrint2009forA41Click(Self);
        show_print := 1;
    end else
     if (print_def=8) then
    begin
        ActionPrintVedomost2009Click(Self);
        show_print := 1;
    end else
    {if (print_def=9) then
    begin
        ActionPrintNBU252_albomClick(Self);
        show_print := 1;
    end else}
    begin
        showmessage(Un_R_file_Alex.KASSA_CHECK_SETUP_PRINT_ORD);
    end;
end;

procedure TfmKassaDocMainForm.ActionPrintDonNUETA4Click(Sender: TObject);
var
    month, day, year : integer;
    year_l, month_l, day_l, mon, n, s, v, d : string;
    id : int64;
    error, er : integer;
    print_pass : integer;
    e : boolean;
    hide_b_r_s_k : integer;
begin
    e := false;
    if cxCheckBoxRefr.Checked then
    begin
        cxCheckBoxRefr.Checked := false;
        e := true;
    end;

    error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko','Print');
    if error <> 0 then
    begin
        er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Print_NBU252_A4','Print');
        if er <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(er)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end;

    if DataSetMain.IsEmpty then exit;

    id := TFIBBCDField(DataSetMain.FieldByName('ID_DT_DOC')).AsInt64;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetKorSch.Open;
    print_pass := DataSetKorSch.FieldByName('PRINT_PASPORT').AsInteger;
    if(DataSetKorSch['HIDE_B_RZ_ST_KEKV']<>null) then
        hide_b_r_s_k := DataSetKorSch.FieldByName('HIDE_B_RZ_ST_KEKV').AsInteger
    else
        hide_b_r_s_k := 0;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_TO_PRINT_PRIH_RAS('''+DataSetMain.FieldByName('ID_DT_DOC').AsString+''')';
    DataSetKorSch.Open;

        DataSetDay.Locate('ID_DT_DAY', id_day, []);

        year := YearOf(DataSetDay['DAY_KASSA']);
        frVariables['year_r']  := year;
        year := year mod 100;
        year_l := IntToStr(year);
        if length(year_l) = 1 then year_l := '0' + year_l;

        month := MonthOf(DataSetDay['DAY_KASSA']);
        case month of
            1 : mon  :='січень';
            2 : mon  :='лютий';
            3 : mon  :='березень';
            4 : mon  :='квітень';
            5 : mon  :='травень';
            6 : mon  :='червень';
            7 : mon  :='липень';
            8 : mon  :='серпень';
            9 : mon  :='вересень';
            10 : mon :='жовтень';
            11 : mon :='листопад';
            12 : mon :='грудень';
        end;
        month_l := IntToStr(month);
        if length(month_l) = 1 then month_l := '0' + month_l;

        day   := DayOf(DataSetDay['DAY_KASSA']);
        day_l := IntToStr(day);
        if length(day_l) = 1 then day_l := '0' + day_l;


        if DataSetMain['PRIHOD_RASHOD'] = 1 then
        begin
            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10002_14.fr3');
            frxReport1.PrintOptions.Copies := 1;
        end;
        if DataSetMain['PRIHOD_RASHOD'] = 0 then
        begin
            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10001_14.fr3');
            frxReport1.PrintOptions.Copies := 1;
            frxReport1.Variables['passp']               := QuotedStr(' ');
        end;
         if (print_pass = 1) and (DataSetMain.FieldByName('ID_MAN').AsVariant > 0) and (DataSetMain['PRIHOD_RASHOD'] = 0) then
        begin
            if DataSetMain.FieldByName('NUMBER_PASS').AsString <> null
                then n  := DataSetMain.FieldByName('NUMBER_PASS').AsString
                else n  := ' ';
            if DataSetMain.FieldByName('SERIYA_PASS').AsString <> null
                then s  := DataSetMain.FieldByName('SERIYA_PASS').AsString
                else s  := ' ';
            if DataSetMain.FieldByName('VIDAN').AsString <> null
                then v  := DataSetMain.FieldByName('VIDAN').AsString
                else v  := ' ';
            if DataSetMain.FieldByName('DATE_VIDAN').AsDateTime <> null
                then d  := DataSetMain.FieldByName('DATE_VIDAN').AsString
                else d  := ' ';
            if n <> '' then
            if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_PRINT_PASS_DATA), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO and IDNO)=mrYes then
            begin
                frxReport1.Variables['passp'] := QuotedStr(Un_R_file_Alex.KASSA_PASPORT+ s + ' № ' + n + Un_R_file_Alex.KASSA_VIDAN + v + Un_R_file_Alex.KASSA_OT + d);
            end;
        end;
        frxReport1.Variables['day_']   := QuotedStr(day_l);
        frxReport1.Variables['month_'] := QuotedStr(month_l);
        frxReport1.Variables['mon']    := QuotedStr(mon);
        frxReport1.Variables['year_']  := QuotedStr(year_l);
        if year<=9 then frxReport1.Variables['y']   := QuotedStr('0'+IntToStr(year))
        else
        frxReport1.Variables['y']                   := QuotedStr(IntToStr(year));
        frxReport1.Variables['s']      := QuotedStr(DataSetMain.FieldByName('SUMMA_DOC').AsString);
        frxReport1.Variables['n']      := QuotedStr(DataSetMain.FieldByName('NUMBER_DOC').AsString);
        frxReport1.Variables['o']      := QuotedStr(DataSetMain.FieldByName('OSNOVANIE').AsString);
        frxReport1.Variables['f']      := QuotedStr(DataSetMain.FieldByName('FIO').AsString);
        frxReport1.Variables['okpo']   := QuotedStr(DataSetKorSch.fieldByname('OKPO').AsString);
        frxReport1.Variables['comp']   := QuotedStr(GetComputerNetName);
        frxReport1.Variables['id_user']   := QuotedStr(IntToStr(myclass.id_user));
        frxReport1.Variables['hide_info']           := QuotedStr(IntToStr(hide_b_r_s_k));
        IF DataSetKorSch.FieldByName('LANG').AsInteger = 1
            then frxReport1.Variables['suma_prop'] := QuotedStr(AllChislo(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)))
            else frxReport1.Variables['suma_prop'] := QuotedStr(AllChislo_ukr(FloatToStr(DataSetMain.FieldByName('SUMMA_DOC').AsFloat)));
        frxReport1.Variables['name_pred']  := QuotedStr(DataSetKorSch.fieldByname('NAME_PREDPR').AsString);
        frxReport1.Variables['kor_sch']    := QuotedStr(DataSetMain.FieldByName('KOR_SCH').AsString);//QuotedStr(DataSetKorSch.fieldByname('KOD_KOR_SCH').AsString);
        frxReport1.Variables['sm_rz_st_k'] := QuotedStr(DataSetKorSch.fieldByname('NAME_SM_RZ_ST').AsString);
        frxReport1.PrintOptions.Copies := 1;

        frxReport1.PrepareReport;

        if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
        begin
          frxReport1.DesignReport;
          Exit;
        end;

        if show_print=1 then
        begin
            frxReport1.PrintOptions.ShowDialog   := true;
            frxReport1.ShowReport(true);
        end else
        begin
            frxReport1.Print;
        end;

    DataSetKorSch.Close;
    DataSetMain.Locate('ID_DT_DOC', id, []);
    if e then cxCheckBoxRefr.Checked := true;
end;

end.

