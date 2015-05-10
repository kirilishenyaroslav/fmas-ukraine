unit BankDocMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, ComCtrls, ToolWin, ActnList, ImgList, ExtCtrls, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit, BankDocClass, Un_R_file_Alex,
  cxLabel, BankInputSumma, dxBar, dxBarExtItems, cxCurrencyEdit,
  cxGridBandedTableView, cxGridDBBandedTableView, StdCtrls, cxImage,
  dxStatusBar, cxCheckBox, frxClass, frxDBSet, Placemnt, cxMemo, Menus,
  dxsbar, cxGridCustomPopupMenu, cxGridPopupMenu, FIBQuery, pFIBQuery,
  pFIBStoredProc, Gauges, cxSplitter;

type
  TSchK = record
      id : int64;
      number : string;
  end;
  TResSchK = record
      TT : array of TSchK;
  end;
  TfmModeShowDoc = (Show, Edit);

  TDog = record
   NumSmeta  : integer;
   NumRazd   : integer;
   NumStat   : integer;
   IdSmeta   : Int64;
   IdRazd    : Int64;
   IdState   : Int64;
   IdDog     : Int64;
   kodDog    : integer;
   nameSmeta : string;
   nameRazd  : string;
   nameState : string;
   Summa     : Currency;
   NSumma    : Currency;
  end;

  TfmBankDocMainForm = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Database: TpFIBDatabase;
    DataSetMain: TpFIBDataSet;
    Transaction: TpFIBTransaction;
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
    DataSource: TDataSource;
    ActionPrint: TAction;
    ActionPrintMonitor: TAction;
    PrintDialog1: TPrintDialog;
    pFIBDataSet_ini: TpFIBDataSet;
    DataSetKorSch: TpFIBDataSet;
    TransactionWr: TpFIBTransaction;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    Panel1: TPanel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    Panel2: TPanel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    cxLabel6: TcxLabel;
    cxLabel7: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxLabel9: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxTextEdit;
    cxLabel10: TcxTextEdit;
    dxStatusBar1: TdxStatusBar;
    cxCheckBox: TcxCheckBox;
    frxDBDataset1: TfrxDBDataset;
    DataSetPrint: TpFIBDataSet;
    ActionShow: TAction;
    ActionShowDoc: TAction;
    cxLabel24: TcxMemo;
    cxTextEdit1: TcxTextEdit;
    cxLabel25: TcxLabel;
    ActionCWiclyFind: TAction;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    dxSideBarPopupMenu1: TdxSideBarPopupMenu;
    n1: TMenuItem;
    n2: TMenuItem;
    ActionDelete1: TMenuItem;
    ActionPrint1: TMenuItem;
    ActionRefresh1: TMenuItem;
    ActionShow1: TMenuItem;
    ActionExit1: TMenuItem;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    ActionOtvDoc: TAction;
    StoredProc: TpFIBStoredProc;
    ActionProverkaOtv: TAction;
    ActionProverkaOtv1: TMenuItem;
    cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    DataSeLang: TpFIBDataSet;
    frxDBDataset2: TfrxDBDataset;
    DataSetPrintReestr: TpFIBDataSet;
    DataSetPrintReestrNUMBER_DOC: TFIBStringField;
    DataSetPrintReestrFIO: TFIBStringField;
    DataSetPrintReestrPRIHOD: TFIBBCDField;
    DataSetPrintReestrRASHOD: TFIBBCDField;
    DataSetPrintReestrOSNOVANIE: TFIBStringField;
    DataSetPrintReestrSUM_PRIH: TFIBBCDField;
    DataSetPrintReestrSUM_RASH: TFIBBCDField;
    DataSetPrintReestrSCH_KOD: TFIBStringField;
    DataSetPrintReestrSMETA_KOD: TFIBIntegerField;
    DataSetPrintReestrRAZD_KOD: TFIBIntegerField;
    DataSetPrintReestrSTATE_KOD: TFIBIntegerField;
    DataSetPrintReestrKEKV_KOD: TFIBIntegerField;
    DataSetPrintReestrNAME_PREDPR: TFIBStringField;
    DataSetPrintReestrSALDO_BEGIN: TFIBBCDField;
    DataSetPrintReestrSALDO_END: TFIBBCDField;
    DataSetPrintReestrSUM_DOC: TFIBBCDField;
    DataSetPrintReestrID_DOC: TFIBStringField;
    DataSetPrintReestrNAME_CUST: TFIBStringField;
    DataSetPrintReestrMFO: TFIBStringField;
    DataSetPrintReestrOKPO: TFIBStringField;
    DataSetPrintReestrNAME_RAS_CUST: TFIBStringField;
    DataSetPrintReestrDATE_DOC: TFIBDateField;
    frxDBDatasetSCH: TfrxDBDataset;
    DataSetSCH: TpFIBDataSet;
    DataSetSCHR_NAME_SCH: TFIBStringField;
    DataSetSCHR_KOD: TFIBStringField;
    DataSetSCHR_NAME_PREDPR: TFIBStringField;
    DataSetSCHR_SUMM_DEBET: TFIBBCDField;
    DataSetSCHR_SALDO_BEGIN: TFIBBCDField;
    DataSetSCHR_SALDO_END: TFIBBCDField;
    DataSetSCHR_SUMM_KREDIT: TFIBBCDField;
    DataSetSCHR_ID_SCH: TFIBBCDField;
    DataSetSCHR_NUM_SCH: TFIBStringField;
    DataSetSCHR_TITLE_SCH: TFIBStringField;
    DataSetSCHR_LISTIK: TFIBIntegerField;
    DataSetPrintReestrFIO_OBUCH: TFIBStringField;
    DataSetPrintReestrDATE_DOG: TFIBDateField;
    DataSetPrintReestrDOG_NAME_CUST: TFIBStringField;
    DataSetPrintReestrREG_DOG: TFIBStringField;
    DataSetPrintReestrDOG_RATE_ACC: TFIBStringField;
    DataSetPrintReestrNUM_DOG: TFIBStringField;
    frxReport1: TfrxReport;
    frxReportSCH: TfrxReport;
    frxReport2: TfrxReport;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    ActionAddAll: TAction;
    DataSetSelectDocNe: TpFIBDataSet;
    dxBarPopupMenu2: TdxBarPopupMenu;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    ActionDeleteAll: TAction;
    Panel3: TPanel;
    ProgressBar: TGauge;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    cxLabel29: TcxLabel;
    DataSetBlock: TpFIBDataSet;
    cxMemo1: TcxMemo;
    dxBarLargeButton11: TdxBarLargeButton;
    Panel4: TPanel;
    cxSplitter1: TcxSplitter;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    DataSetProv: TpFIBDataSet;
    DataSourceProv: TDataSource;
    Panel5: TPanel;
    cxCheckBox1: TcxCheckBox;
    dxBarLargeButton12: TdxBarLargeButton;
    ActionClon: TAction;
    cxGrid1DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn10: TcxGridDBBandedColumn;
    Label1: TLabel;
    Label2: TLabel;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
//    function SelectDogovor : boolean;
    procedure DataSetMainAfterScroll(DataSet: TDataSet);
    procedure cxCheckBoxClick(Sender: TObject);
    procedure ActionShowExecute(Sender: TObject);
    procedure ActionShowDocExecute(Sender: TObject);
    procedure cxGrid1DBBandedTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ActionCWiclyFindExecute(Sender: TObject);
    procedure cxTextEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1DBBandedColumn7CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ActionOtvDocExecute(Sender: TObject);
    procedure ActionProverkaOtvExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionAddAllExecute(Sender: TObject);
    procedure ActionDeleteAllExecute(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionClonExecute(Sender: TObject);
    //procedure ActionFindExecute(Sender: TObject);
  private
  //Ind : array of Int64;
  public
    ResSch : TResSchK;
    Ind1 : array [1..5] of array of Variant;
    IndDay : array of Int64;
    id_operation, id_sch, id_smeta, id_stat, id_razdel, id_kekv_oper, id_customer, id_us : int64;
    {prihod, }flag_prih, flag_ras, flag_def_f, flag_sys, flag_vis, kodShab : smallint;
    id_ras, id_day : int64;
    myclass : TMainDocClass;
    flag : TfmModeShowDoc;
    predv_prov : smallint;
    id_DOC, ID_ALL_DOC, id_account_customer : int64;
    date_vip, date_doc : TDate;
    is_add_CL_buff, id_key : int64;
    num_doc, sum_doc, note, id_currency, summa_valuta, name_cust, mfo_cust, name_bank, ras_cust, num_doc_kazn, numer_lena : string;
    name_z : string;
    DogParam : Array of TDog;
    Priznac_komis, kazna, pos, kod_shablon : integer;
    select_osnov : integer;
    id_valuta : Integer;
    name_valuta : string;
    constructor Create(AOwner: TComponent; mclass: TMainDocClass; m : TfmModeShowDoc; is_valuta : Integer; id_valuta_in: Integer; name_valuta_in : string); reintroduce; overload;
end;

implementation
uses BankSelectShablon,
     BankOrder,
     DateUtils,
     Un_lo_file_Alex,
     BankAddSelectDoc,
     BankTypeKassa,
     Accmgmt,
     DogLoaderUnit,
     GlobalSpr,
     Un_Progress_form,
     BankSelectPrintVip,
     BankSelectKassa;

{$R *.dfm}

constructor TfmBankDocMainForm.Create(AOwner: TComponent; mclass: TMainDocClass; m : TfmModeShowDoc; is_valuta : Integer; id_valuta_in: Integer; name_valuta_in : string);
var
    //i, j : int64;
    i : integer;
    date_beg : string;
    date_end : TDate;
    error: integer;
begin
    inherited Create (nil{AOwner});
    myclass                     := mclass;
    Database                    := myclass.Class_Database;
    Transaction.DefaultDatabase := Database;
    Database.DefaultTransaction := Transaction;
    TransactionWr.DefaultDatabase := Database;

    Transaction.StartTransaction;

    select_osnov := 1;
    error := Accmgmt.fibCheckPermission('/ROOT/Bank','Belong');
    if error <> 0 then
    begin
         cxCheckBox.Visible := false;
    end;
    Caption                        := Un_R_file_Alex.BANK_DOC_CAPTION + myclass.bank_day + ' ' +Un_R_file_Alex.J4_MAIN_FORM_TO_1 + ' ' +Un_R_file_Alex.BANK_R_S + ' ' + myclass.name_ras_sch;
    ActionAdd.Caption              := Un_R_file_Alex.MY_BUTTON_ADD;
    ActionExit.Caption             := Un_R_file_Alex.MY_BUTTON_CLOSE;
    ActionChange.Caption           := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionDelete.Caption           := Un_R_file_Alex.MY_BUTTON_DELETE;
    ActionRefresh.Caption          := Un_R_file_Alex.MY_BUTTON_REFRESH;
    ActionCancel.Caption           := Un_R_file_Alex.N_AUTOKOD_FORM_CANCLE;
    ActionPrint.Caption            := Un_R_file_Alex.MY_BUTTON_PRINT;
    ActionProverkaOtv.Caption      := Un_R_file_Alex.BANK_OTV_DOC;
    ActionAddAll.Caption           := Un_R_file_Alex.BANK_ADD_ALL_TRANZ;
    ActionDeleteAll.Caption        := Un_R_file_Alex.BANK_DEL_ALL;
    ActionClon.Caption             := Un_R_file_Alex.BANK_CLON;

    cxLabel25.Caption              := Un_R_file_Alex.BANK_COMMENT_PROV;
    cxLabel1.Caption               := Un_R_file_Alex.BANK_R_S;
    cxLabel2.Text                  := myclass.name_ras_sch;
    cxLabel3.Caption               := Un_R_file_Alex.BANK_MFO;
    cxLabel4.Text                  := myclass.mfo;
    cxLabel5.Caption               := Un_R_file_Alex.BANK_BANK;
    cxLabel10.Text                 := myclass.bank;
    cxLabel6.Caption               := Un_R_file_Alex.BANK_DAY_SHOW_SCH_BALL;
    cxLabel7.Text                  := myclass.name_osn_sch;
    cxLabel8.Caption               := Un_R_file_Alex.BANK_DAY_SHOW_SCH_NAME_BALL;
    cxLabel9.Text                  := myclass.title_osn_sch;
    cxLabel11.Caption              := Un_R_file_Alex.BANK_DATE_VIP;
    cxLabel12.Caption              := myclass.bank_day;

    GroupBox1.Caption              := Un_R_file_Alex.BANK_RECVIZ_BALL_SCH;
    GroupBox2.Caption              := Un_R_file_Alex.BANK_RECVIZ;

    cxCheckBox.Properties.Caption := Un_R_file_Alex.BANK_SHOW_KOM;

    cxGrid1DBBandedTableView1.Bands.Items[0].Caption  := Un_R_file_Alex.BANK_REK_DOCUMENT;
    cxGrid1DBBandedTableView1.Bands.Items[1].Caption  := Un_R_file_Alex.KASSA_SUMMA;
    cxGrid1DBBandedTableView1DBBandedColumn1.Caption  := Un_R_file_Alex.BANK_NUM_DOCUMENT;
    cxGrid1DBBandedTableView1DBBandedColumn2.Caption  := Un_R_file_Alex.BANK_DATE_DOCUMENT;
    cxGrid1DBBandedTableView1DBBandedColumn3.Caption  := Un_R_file_Alex.BANK_NAME_CUSTMERA;
    cxGrid1DBBandedTableView1DBBandedColumn4.Caption  := Un_R_file_Alex.KASSA_DOC_PRIHOD;
    cxGrid1DBBandedTableView1DBBandedColumn5.Caption  := Un_R_file_Alex.KASSA_DOC_RASHOD;

    cxGrid2DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_SCH_KOR_SHORT;
    cxGrid2DBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_SMETA;
    cxGrid2DBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_RAZD;
    cxGrid2DBTableView1DBColumn5.Caption := Un_R_file_Alex.KASSA_STAT;
    cxGrid2DBTableView1DBColumn6.Caption := Un_R_file_Alex.KASSA_KEKV;
    cxGrid2DBTableView1DBColumn7.Caption := Un_R_file_Alex.KASSA_SUMMA;

    cxLabel13.Caption              := Un_R_file_Alex.bank_rekv_cust;
    cxLabel15.Caption              := Un_R_file_Alex.BANK_NAZVANIE;
    cxLabel17.Caption              := Un_R_file_Alex.BANK_R_S;
    cxLabel19.Caption              := Un_R_file_Alex.BANK_MFO;
    cxLabel21.Caption              := Un_R_file_Alex.BANK_BANK;
    cxLabel23.Caption              := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    dxStatusBar1.Panels[0].Text                  := 'Ins - ' + Un_R_file_Alex.MY_BUTTON_ADD ;
    dxStatusBar1.Panels[1].Text                  := 'F2 - '  + Un_R_file_Alex.MY_BUTTON_EDIT;
    dxStatusBar1.Panels[2].Text                  := 'Del - ' + Un_R_file_Alex.MY_BUTTON_DELETE ;
    dxStatusBar1.Panels[4].Text                  := 'F5 - '  + Un_R_file_Alex.MY_BUTTON_REFRESH;
    dxStatusBar1.Panels[7].Text                  := 'Esc - ' + Un_R_file_Alex.MY_BUTTON_CLOSE;
    dxStatusBar1.Panels[5].Text                  := 'Ctrl+P - ' + Un_R_file_Alex.MY_ACTION_PRINT_CONST;
    dxStatusBar1.Panels[6].Text                  := 'Ctrl+F - ' + Un_R_file_Alex.BANK_Q_F;
    dxStatusBar1.Panels[3].Text                  := 'F3 - ' + Un_R_file_Alex.MY_ACTION_SHOW;

    if MonthOf(Date) < 10
        then date_beg := '01.'+'0'+ IntToStr(MonthOf(Date)) + '.'+ IntToStr(YearOf(Date))
        else date_beg := '01.'+ IntToStr(MonthOf(Date)) + '.' + IntToStr(YearOf(Date));
    date_end := IncMonth(StrToDate(date_beg),1);
    date_end := IncDay(date_end,-1);


    id_ras  := myclass.id_ras_sch_pris;

    DataSetMain.Database     := Database;
    DataSetMain.Transaction  := Transaction;
    DataSeLang.Database      := Database;
    DataSeLang.Transaction   := Transaction;

    DataSetPrint.Database          := Database;
    DataSetPrint.Transaction       := Transaction;

    DataSetPrintReestr.Database    := Database;
    DataSetPrintReestr.Transaction := Transaction;

    DataSetSCH.Database            := Database;
    DataSetSCH.Transaction         := Transaction;

    pFIBDataSet_ini.Database       := Database;
    pFIBDataSet_ini.Transaction    := Transaction;

    DataSetKorSch.Database         := Database;
    DataSetKorSch.Transaction      := Transaction;

    DataSetProv.Database           := Database;
    DataSetProv.Transaction         := Transaction;

    DataSetSelectDocNe.Database    := Database;
    DataSetSelectDocNe.Transaction := Transaction;

    DataSetMain.Transaction.StartTransaction;


    pFIBDataSet_ini.Close;
    pFIBDataSet_ini.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SP_SCH where ID_RAS_SCH='+IntToStr(myclass.id_ras_sch_pris)+' and ID_SCH='+IntToStr(myclass.id_osn_sch)+'';
    pFIBDataSet_ini.Open;
    if pFIBDataSet_ini.FieldByName('FLAG_KOMISSII').AsInteger<>null
        then Priznac_komis := pFIBDataSet_ini.FieldByName('FLAG_KOMISSII').AsInteger
        else Priznac_komis := 0;
    if Priznac_komis = 0 then
    begin
        cxCheckBox.Visible        := false;
        ActionProverkaOtv.Visible := false;
    end;
    pFIBDataSet_ini.Close;
    DataSetMain.Close;
    DataSetMain.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_ALL_DOC_FROM_DAY('''+myclass.bank_day+''', '+IntToStr(myclass.id_ras_sch_pris)+', '+IntToStr(select_osnov)+')';
    DataSetMain.Open;
    if myclass.id_doc_pris > 0 then
    begin
        DataSetMain.Locate('ID_DOC', myclass.id_doc_pris, []);
        cxGrid1DBTableView1DblClick(Self);
    end;

    id_us := myclass.id_user;
    DataSetKorSch.Close;
    DataSetKorSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCHS_FOR_BANK';
    DataSetKorSch.Open;

    SetLength(ResSch.TT, DataSetKorSch.RecordCount);

    For i := 0 to DataSetKorSch.RecordCount-1 do
    begin
       ResSch.TT[i].id     := TFIBBCDField(DataSetKorSch.fieldByName('ID_SCH')).AsInt64;
       ResSch.TT[i].Number := DataSetKorSch.FieldByName('SCH_NUM').AsString;
       DataSetKorSch.next;
    end;

    num_doc_kazn := '';
    cxSplitter1.CloseSplitter;

    //------валюта-----------------------------------------------
    id_valuta   := id_valuta_in;
    name_valuta := name_valuta_in;
    
    if (is_valuta = 1 )then
    begin
      cxGrid1DBBandedTableView1DBBandedColumn9.Visible  := True;
      cxGrid1DBBandedTableView1DBBandedColumn10.Visible := True;
      cxTextEdit2.Text := 'валютний';
      cxTextEdit3.Text := name_valuta;
    end
    else
    begin
      cxGrid1DBBandedTableView1DBBandedColumn9.Visible  := False;
      cxGrid1DBBandedTableView1DBBandedColumn10.Visible := False;
      cxTextEdit2.Text := 'не валютний';
      cxTextEdit3.Text := name_valuta;
    end;
    //-------------------------------------------------------------
end;

procedure TfmBankDocMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    StoredProc.Database           := Database;
    StoredProc.Transaction        := TransactionWr;
    TransactionWr.StartTransaction;
    try
        StoredProc.StoredProcName:='BANK_PERESCHET_SALDO_BAL_SCH';
        StoredProc.Prepare;
        StoredProc.ParamByName('DATE_BEG').AsDate    := strtodate(myclass.bank_day);
        StoredProc.ParamByName('DATE_END').AsDate    := IncDay(strtodate(myclass.bank_day),1);;
        StoredProc.ParamByName('ID_SCH').AsInt64     := myclass.id_osn_sch;
        StoredProc.ExecProc;

        TransactionWr.Commit;
       // showmessage(Un_R_file_Alex.BANK_PERESCHET_OK);
    except
        TransactionWr.Rollback;
      //  showmessage(Un_R_file_Alex.BANK_PERESCHET_NOT);
    end;
    if FormStyle = fsMDIChild then
    begin
        Action := caFree;
        myclass.Free;
    end;
   // FormStorage1.SaveFormPlacement;
end;

procedure TfmBankDocMainForm.ActionExitExecute(Sender: TObject);
{var
    i, j : integer;}
begin
{    i := 0;
    i := Database.ActiveTransactionCount;
    for j := 0 to i do
    begin
        try
            if Database.Transactions[j].Active then
            begin
                Database.Transactions[j].Active := false;
            end;
        finally
        end;
    end;  }
    Close;
end;

procedure TfmBankDocMainForm.ActionRefreshExecute(Sender: TObject);
var
    iiii : int64;
begin
    DecimalSeparator := ',';
    if cxCheckBox.Checked then
    begin
        select_osnov := 0;
    end else
    begin
        select_osnov := 1;
    end;
    try
        iiii := StrToint64(DataSetMain.FBN('ID_DOC').AsString);
    except
        iiii := -1;
    end;
    DataSetMain.Close;
    DataSetMain.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_ALL_DOC_FROM_DAY('''+myclass.bank_day+''', '+IntToStr(myclass.id_ras_sch_pris)+', '+IntToStr(select_osnov)+')';
    DataSetMain.Open;
    DataSetMain.Locate('ID_DOC', iiii, []);
end;

procedure TfmBankDocMainForm.ActionAddExecute(Sender: TObject);
var
    T : TfmBankOrder;
    prih, id_user,k,i : Integer;
    f_pri, f_ra, f_def_f_z, f_sys_z, f_vis_z, kod_z, type_oper,  kod_oper : integer;
    id_oper_z, id_sc_z, id_sm_z, id_st_z, id_razd_z, id_kekv_z : int64;
    summa_dog : double;

    f_id_DOC, f_ID_ALL_DOC, f_id_account_customer, f_id_cust : int64;
    f_date_vip, f_date_doc : TDate;
    f_num_doc, f_sum_doc, f_note, f_id_currency, f_summa_valuta, f_name_cust : string;
    s : boolean;
    n : integer;
    error, error_nich : integer;
    j : integer;
    Res : variant;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_document','Add');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;

    if (myclass.block_sal=1) then
    begin
         showmessage(Un_R_file_Alex.BANK_DOC_BLOCK_SAL);
         exit;
    end;
    begin
        f_id_DOC              := 0;
        f_ID_ALL_DOC          := 0;
        f_id_account_customer := 0;
        f_date_vip            := date;
        f_date_doc            := date;
        f_num_doc             := '';
        f_sum_doc             := '';
        f_note                := '';
        f_id_currency         := '';
        f_summa_valuta        := '';
        prih                  := -2;
        f_id_cust             := 0;
        mfo_cust              := '';
        name_bank             := '';
        ras_cust              := '';
        id_key                := 0;

        if Show_Select_Doc(self, Database, Transaction, myclass.id_ras_sch_pris, myclass.id_day_pris, prih, f_id_DOC, f_ID_ALL_DOC, f_id_account_customer, f_date_vip, f_date_doc, f_num_doc, f_sum_doc, f_note, f_id_currency, f_summa_valuta, f_name_cust, mfo_cust, name_bank, ras_cust, f_id_cust, is_add_CL_buff, num_doc_kazn, kazna, myclass.IS_VALUTA,myclass.id_valuta,myclass.name_valuta) then
        begin
            decimalseparator := ',';
            id_DOC              := f_id_DOC;
            //showmessage('id_doc '+inttostr(id_doc));
            ID_ALL_DOC          := f_ID_ALL_DOC;
            id_account_customer := f_id_account_customer;
            date_vip            := f_date_vip;
            date_doc            := f_date_doc;
            num_doc             := f_num_doc;
            sum_doc             := f_sum_doc;
            note                := f_note;
            id_currency         := f_id_currency;
            summa_valuta        := f_summa_valuta;
            name_cust           := f_name_cust;
            id_customer         := f_id_cust;
//           numer_lena          := num_doc;
            numer_lena          := '';


            if ((myclass.block_deb=1)and (prih=1))  then
            begin
                showmessage(Un_R_file_Alex.BANK_DOC_BLOCK_DEB);
                exit;
            end;
            if ((myclass.block_kred=1)and (prih=0)) then
            begin
                showmessage(Un_R_file_Alex.BANK_DOC_BLOCK_KR);
                exit;
            end;
            {выбор платёжки типа : Касса-Банк}
            if Show_Kassa_Bank(Database, Transaction,prih, num_doc, sum_doc, note, dateToStr(date_doc), type_oper, kod_oper, StrToFloat(summa_valuta),id_valuta,name_valuta) then
            begin

                decimalseparator := ',';
                if type_oper = 1 then   {Движение наличных : Касса-Банк}
                begin
                    //id_user := myclass.id_user;
                    //DataSetKorSch.Close;
                    //DataSetKorSch.Sqls.selectSql.Text := 'select * from KASSA_SELECT_ALL_SCHS('+IntToStr(id_user)+')';
                    //DataSetKorSch.Open;
                    ///id_sch := StrToInt64(DataSetKorSch.FieldByName('ID_SCH').AsString);//9699;//900;

                    if DataSetKorSch.RecordCount>1 then
                    begin
                        if ShowSchKassa(self, self, Res) then
                        begin
                            j := VarArrayHighBound(res, 1)-VarArrayLowBound(res, 1);
                            if j > 0 then
                            begin
                                SetLength(ResSch.TT, 1);
                                for i := 0 to j do
                                if (Res[i][0]<>null) and (Res[i][3]<>null) then
                                begin
                                    SetLength(ResSch.TT, length(ResSch.TT)+1);
                                    ResSch.TT[i].id     := Res[i][0];
                                    ResSch.TT[i].Number := Res[i][1];
                                end;
                            end;
                            if j = 0 then
                            begin
                                SetLength(ResSch.TT, 1);
                                for i := 0 to j do
                                if (Res[i][0]<>null) then
                                begin
                                    SetLength(ResSch.TT, length(ResSch.TT)+1);
                                    ResSch.TT[i].id     := Res[i][0];
                                    ResSch.TT[i].Number := Res[i][1];
                                    id_sch := Res[i][0];
                                end;
                            end;
                        end;
                   end else
                   id_sch := StrToInt64(DataSetKorSch.FieldByName('ID_SCH').AsString);


                   // DataSetKorSch.Close;

//                    if (id_sch = 9699{900}) then

                    begin
                        if (false) then {bank dont create or kassa dont create document}
                        begin
                            ShowMessage('Плохи дела');
                            Exit;
                        end;
                        if (false) then {bank  create prov, kassa dont create prov}
                        begin
                            T := TfmBankOrder.Create(self, myclass, AddOrder, self, NoDog, prih,id_valuta, name_valuta);
                            //if numer_lena = '' then numer_lena := num_doc;
                            T.ShowModal;
                            T.Free;
                            exit;
                        end;
                        if (true) then {bank dont create, kassa create prov}
                        begin
                            T := TfmBankOrder.Create(self, myclass, AddOrder, self, Kassa_Bank, prih,id_valuta, name_valuta);
                            //if numer_lena = '' then numer_lena := num_doc;
                            T.ShowModal;
                            T.Free;
                            exit;
                        end;
                    end
                end;
                if type_oper = 3 then   {Движение наличных : Договора за обучение}
                begin
{                    T := TfmBankOrder.Create(self, myclass, AddOrder, self, Dog_trities);
                    T.ShowModal;
                    T.Free;
                    exit;}
                    {decimalseparator := ',';
                    T := TfmBankOrder.Create(self, myclass, AddOrder, self, Dog_trities, prih);
                    T.Show;
                    T.Enabled := false;
                    if not T.SelectDogovorTritNew then
                    begin
                        T.flag := ShowOrder;
                        T.Free;//Close;
                        exit;
                    end;
                    T.Enabled := true;
                    T.Visible := false;
                    T.ShowModal;
                    T.Free;}
                    exit;
                end;
                if type_oper = 4 then   {Движение наличных : студгородок}
                begin
                    decimalseparator := ',';
                    T := TfmBankOrder.Create(self, myclass, AddOrder, self, Stud_city, prih,id_valuta, name_valuta);
                    T.Show;
                    T.Enabled := false;
                    if not T.SelectStudCity(true) then
                    begin
                        T.flag := ShowOrder;
                        T.Free;//Close;
                        exit;
                    end;
                    //if numer_lena = '' then numer_lena := num_doc;
                    T.Enabled := true;
                    T.Visible := false;
                    T.ShowModal;
                    T.Free;
                    exit;
                end;

                if type_oper = 5 then   {Движение наличных : Договора за обучение new}
                begin
                    decimalseparator := ',';
                    T := TfmBankOrder.Create(self, myclass, AddOrder, self, Dog_Trit_New, prih,id_valuta, name_valuta);
                    T.Show;
                    T.Enabled := false;
                    if not T.SelectDogovorTritNew(note, true) then
                    begin
                        T.flag := ShowOrder;
                        T.Free;//Close;
                        exit;
                    end;
                    //if numer_lena = '' then numer_lena := num_doc;
                    T.Enabled := true;
                    T.Visible := false;
                    T.ShowModal;
                    T.Free;
                    exit;
                end;

                if type_oper = 6 then   {tranzit}
                begin
                    pFIBDataSet_ini.Close;
                    pFIBDataSet_ini.SQLs.SelectSQL.Text := 'select * from BANK_SELECT_SHABLON_TRANZ WHERE ID_ACC_A='+IntTOStr(myclass.id_ras_sch_pris)+' and ID_ACC_B='+IntToStr(id_account_customer);
                    pFIBDataSet_ini.Open;
                    decimalseparator := ',';

                    if  pFIBDataSet_ini.IsEmpty then
                    begin
                       showmessage(Un_R_file_Alex.BANK_NO_SHABLON);
                       exit;
                    end
                    else
                    begin
                        T := TfmBankOrder.Create(self, myclass, AddOrder, self, Tranzit, prih,id_valuta, name_valuta);
                        T.Show;
                        T.Enabled := false;
                        //if numer_lena = '' then numer_lena := num_doc;
                        T.Enabled := true;
                        T.Visible := false;
                        T.ShowModal;
                        T.Free;
                        exit;
                    end;
                end;

                if type_oper = 7 then   {shablon }
                begin
                        kod_shablon := kod_oper;
                        T := TfmBankOrder.Create(self, myclass, AddOrder, self, Shablon, prih,id_valuta, name_valuta);
                        T.Show;
                        T.Enabled := false;
                        T.Enabled := true;
                        T.Visible := false;
                        T.ShowModal;
                        T.Free;
                        exit;
                end;

                if type_oper = 8 then   {Договора по НИЧ}
                begin
                    error_nich := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_document/BANK_VIEW_SHABLON','Belong');
                    if (error_nich <> 0) then
                    begin
                      ShowMessage('У Вас не вистачає прав для користування шаблоном НІЧ! Зверніться до адміністратора!');
                      Exit;
                     end;
                    decimalseparator := ',';
                    T := TfmBankOrder.Create(self, myclass, AddOrder, self, ShablonNich, prih,id_valuta, name_valuta);
                    T.Show;
                    T.Enabled:=False;
                    if not T.SelectShablonNich(true, self, Database, f_id_doc, f_date_doc, f_num_doc, f_sum_doc, f_note, myclass.id_user, name_cust, mfo_cust, name_bank, ras_cust, prih) then
                    begin
                        T.flag:=ShowOrder;
                        T.Free;//Close;
                        exit;
                    end;
                    T.Enabled:=true;
                    T.Visible:=false;
                    T.ShowModal;
                    T.Free;
                    exit;
                end;
            end;

            s := true;
            try n := strToINt(num_doc) except s := false; end;
            if ((prih = 0) and (s)) or ((prih = 0) and (kazna=1)) then  {Расходная платежка. Разбивка по Лене}
            begin

                decimalseparator := ',';
                if(is_add_CL_buff = 2) then
                begin
                    id_key := id_doc;
                    T := TfmBankOrder.Create(self, myclass, AddOrder, self, Rashod_pl, prih,id_valuta, name_valuta);
                    T.ShowModal;
                    T.Free;
                    exit;
                end;
                if Bank_Show_Shablon_bank(Database, Transaction, self, id_key, numer_lena) then
                begin
                    T := TfmBankOrder.Create(self, myclass, AddOrder, self, Rashod_pl, prih,id_valuta, name_valuta);
                    T.ShowModal;
                    T.Free;
                    exit;
                end;
            end;
            {р/с-р/с}
            begin

                decimalseparator := ',';
                pFIBDataSet_ini.Close;
                pFIBDataSet_ini.SQLs.SelectSQL.Text := 'select * from BANK_SELECT_SCH_PO_RAS('+IntTOStr(id_account_customer)+', '''+DateToStr(date_vip)+''')';
                pFIBDataSet_ini.Open;
                if (pFIBDataSet_ini.RecordCount = 1) and (prih = 1) then
                begin  
                    id_sch := TFIBBCDField(pFIBDataSet_ini.FieldByName('R_ID_SCH')).AsInt64;
                    T := TfmBankOrder.Create(self, myclass, AddOrder, self, RS_RS, prih,id_valuta, name_valuta);
                    T.ShowModal;
                    T.Free;
                    exit;
                end;
            end;
            begin
                decimalseparator := ',';

                T := TfmBankOrder.Create(self, myclass, AddOrder, self, NoDog, prih,id_valuta, name_valuta);
                T.Show;
                T.Enabled := false;
                if T.flag_show_sum_dog then
                begin
                    if not T.SelectDogovor(StrToFloat(T.cxTextEditSumma.Text), StrToFloat(T.ValutaTextEdit.Text), id_valuta, name_valuta) then
                    begin
                        T.flag := ShowOrder;
                        T.Free;//Close;
                        exit;
                    end;
                    if numer_lena = '' then numer_lena := num_doc;
                    T.flag_show_sum_dog := false;
                    T.Enabled := true;
                    T.Visible := false;
                    T.ShowModal;
                end;
                T.Free;
            end;
        end;
    end;
end;

procedure TfmBankDocMainForm.ActionChangeExecute(Sender: TObject);
var
    T : TfmBankOrder;
    idd_ : int64;
    error, prih : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_document','Edit');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;

   if ((myclass.block_deb=1)and (DatasetMain['PRIHOD_RASHOD']=1))  then
    begin
        showmessage(Un_R_file_Alex.BANK_DOC_BLOCK_DEB);
        exit;
    end;
    if ((myclass.block_kred=1)and (DatasetMain['PRIHOD_RASHOD']=0)) then
    begin
        showmessage(Un_R_file_Alex.BANK_DOC_BLOCK_KR);
        exit;
    end;
    if (myclass.block_sal=1) then
    begin
         showmessage(Un_R_file_Alex.BANK_DOC_BLOCK_SAL);
         exit;
    end;

  if not DataSetMain.IsEmpty then
  begin
    if DataSetMain.FieldByName('FLAG_ALL_DOC').AsInteger = 0 then
    begin
        showmessage(Un_R_file_Alex.BANK_DOC_DONT_EDIT);
        exit;
    end;
    try idd_ := StrToInt64(DataSetMain.FieldByName('ID_KOM_DOC').AsString); except idd_ := -11; end;

    if (DataSetMain.FieldByName('FLAG_OSNOVNOY_DOC').AsInteger = 0) and (idd_ > 0) then
    begin
        showmessage(Un_R_file_Alex.BANK_DOC_DONT_EDIT_KOM);
        exit;
    end;
    if DataSetMain['ID_KEY_LOCAL'] <> null
        then id_key     := DataSetMain['ID_KEY_LOCAL']
        else id_key     := 0;
    id_DOC              := DataSetMain['ID_DOC'];
    ID_ALL_DOC          := StrToInt64(DataSetMain.FieldByName('ID_ALL_DOC').AsString);
    id_account_customer := DataSetMain['ID_ACCOUNT_CUSTOMER'];
    date_vip            := DataSetMain['DATE_VIP'];
    date_doc            := DataSetMain['DATE_DOC'];
    num_doc             := DataSetMain['NUMBER_DOC'];
    sum_doc             := DataSetMain['SUMMA_DOC'];
    summa_valuta        := DataSetMain['SUMMA_VALUTA'];
    note                := DataSetMain['OSNOVANIE'];
    if DataSetMain['ID_CURRENCY'] > null then
        id_currency         := DataSetMain['ID_CURRENCY'];
    if DataSetMain['ID_CUSTOMER'] then
        id_customer         := DataSetMain['ID_CUSTOMER'];
    prih := DataSetMain['PRIHOD_RASHOD'];

    if (id_valuta = null) then
    begin
      id_valuta := 0;
    end;


    T := TfmBankOrder.Create(self, myclass, ChangeOrder, self, NoDog, prih,id_valuta, name_valuta);
    T.ShowModal;
    T.Free;
  end;
end;

procedure TfmBankDocMainForm.ActionPrintExecute(Sender: TObject);
var
    month, day, year, vipis, rasshifr, vip : integer;
    year_l, month_l, day_l, mon : string;
    T : TfmUn_Progress_form;
    error, id_lang, groupby : integer;
    id_ras_id_sch : int64;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_document','Print');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    vipis := 0;
    if not ShowSelectPrintBankVipiska(self, vipis, rasshifr, vip, groupby) then exit;
    if (vipis = 1) and (vip = 1) then
    begin
        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_OTBOR_D);
        T.Show;
            DataSeLang.Close;
            DataSeLang.sqls.SelectSql.Text := 'select * from PUB_SYS_DATA';
            DataSeLang.Open;
            id_lang := DataSeLang.FieldByName('ID_LANGUAGE').AsInteger;
            DataSeLang.Close;
            DataSetPrint.Close;
            DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_GET_VIPISKA('''+cxLabel12.Caption+''', '+IntToStr(id_ras)+', '+IntToStr(groupby)+')';
            DataSetPrint.Open;
            DataSetPrint.FetchAll;

            if ((id_valuta = 0) or (id_valuta = null)) then
            begin
              if id_lang=1 then
                frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2003.fr3');
              if id_lang=0 then
                frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2003_ukr.fr3');
            end
            else
            begin
              frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_Vipiska_Valuta.fr3');
            end;    

        T.Free;
            frxReport1.Variables['day_vip']     := QuotedStr(cxLabel12.Caption);
            frxReport1.Variables['sch_num']     := QuotedStr(cxLabel7.Text);
            frxReport1.Variables['sch_tit']     := QuotedStr(cxLabel9.Text);
            frxReport1.Variables['name_buh']    := QuotedStr(GetUserFIO);
            frxReport1.Variables['mfo']         := QuotedStr(cxLabel4.Text);
            frxReport1.Variables['name_valuta'] := QuotedStr(name_valuta);
            frxReport1.Variables['ras_sch']     := cxLabel2.Text;
            frxReport1.Variables['comp']        := QuotedStr(GetComputerNetName);
            frxReport1.Variables['id_user']     := QuotedStr(IntToStr(myclass.id_user));
            //frxReport1.DesignReport;
            frxReport1.PrepareReport(true);
            frxReport1.ShowReport(true);
    end;

    if (vipis = 2) and (vip = 1) then
    begin
        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_OTBOR_D);
        T.Show;
            DataSeLang.Close;
            DataSeLang.sqls.SelectSql.Text := 'select * from PUB_SYS_DATA';
            DataSeLang.Open;
            id_lang := DataSeLang.FieldByName('ID_LANGUAGE').AsInteger;
            DataSeLang.Close;
            DataSetPrintReestr.Close;
            DataSetPrintReestr.SQLs.SelectSQL.Text := 'select * from BANK_GET_VIPISKA('''+cxLabel12.Caption+''', '+IntToStr(id_ras)+', '+IntToStr(groupby)+')';
            DataSetPrintReestr.Open;
            DataSetPrintReestr.Fetchall;
            if groupby = 1 then
            begin
                if id_lang=1
                    then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_20010.fr3');
                if id_lang=0
                    then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_20010_ukr.fr3');
            end else
            begin
                if id_lang=1
                    then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_20014.fr3');
                if id_lang=0
                    then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_20014_ukr.fr3');
            end;
        T.Free;
            frxReport1.Variables['day_vip']     := QuotedStr(cxLabel12.Caption);
            frxReport1.Variables['sch_num']     := QuotedStr(cxLabel7.Text);
            frxReport1.Variables['sch_tit']     := QuotedStr(cxLabel9.Text);
            frxReport1.Variables['name_buh']    := QuotedStr(GetUserFIO);
            frxReport1.Variables['mfo']         := QuotedStr(cxLabel4.Text);
            frxReport1.Variables['ras_sch']     := cxLabel2.Text;
            frxReport1.Variables['comp']        := QuotedStr(GetComputerNetName);
            frxReport1.Variables['id_user']     := QuotedStr(IntToStr(myclass.id_user));
            frxReport1.PrepareReport(true);
            frxReport1.ShowReport(true);
    end;
    if rasshifr = 1 then
    begin
        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_OTBOR_D);
        T.Show;
            DataSeLang.Close;
            DataSeLang.sqls.SelectSql.Text := 'select * from PUB_SYS_DATA';
            DataSeLang.Open;
            id_lang := DataSeLang.FieldByName('ID_LANGUAGE').AsInteger;
            DataSeLang.Close;

            DataSeLang.sqls.SelectSql.Text := 'select ID_BANK_SP_SCH from BANK_SP_SCH where BANK_SP_SCH.ID_RAS_SCH=' + IntToStr(myclass.id_ras_sch_pris) + ' and BANK_SP_SCH.ID_SCH=' + IntToStr(myclass.id_osn_sch) + ' ';
            DataSeLang.Open;
            id_ras_id_sch := StrToInt64(DataSeLang.FieldByName('ID_BANK_SP_SCH').AsString);
            DataSeLang.Close;

            DataSetSCH.Close;
            DataSetSCH.SQLs.SelectSQL.Text := 'select * from BANK_GET_OTCHET_PO_SCH('+IntToStr(id_ras_id_sch)+', ''' + cxLabel12.Caption +''', ''' + cxLabel12.Caption +''')';
            DataSetSCH.Open;
            DataSetSCH.fetchall;
        T.Free;
            if id_lang=1
                then frxReportSCH.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_20012.fr3');
            if id_lang=0
                then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_20012_ukr.fr3');
            frxReportSCH.Variables['day']     := QuotedStr(cxLabel12.Caption);
            frxReportSCH.Variables['comp']    := QuotedStr(GetComputerNetName);
            frxReportSCH.Variables['id_user'] := QuotedStr(IntToStr(myclass.id_user));
            frxReportSCH.PrepareReport(true);
            frxReportSCH.ShowReport(true);
    end;

end;

procedure TfmBankDocMainForm.ActionDeleteExecute(Sender: TObject);
var
    id_del, id_all_del, id_prev, id_kk, id_key_1 : int64;
    error, prrr : integer;
    T : TfmUn_Progress_form;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_document','Del');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    if ((myclass.block_deb=1)and (DatasetMain['PRIHOD_RASHOD']=1))  then
    begin
        showmessage(Un_R_file_Alex.BANK_DOC_BLOCK_DEB);
        exit;
    end;
    if ((myclass.block_kred=1)and (DatasetMain['PRIHOD_RASHOD']=0)) then
    begin
        showmessage(Un_R_file_Alex.BANK_DOC_BLOCK_KR);
        exit;
    end;
    if (myclass.block_sal=1) then
    begin
         showmessage(Un_R_file_Alex.BANK_DOC_BLOCK_SAL);
         exit;
    end;
    if not DataSetMain.IsEmpty then
    begin
        if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_DELETE_ALL_DOC +' № '+datasetmain.FieldByName('NAME_CUST').AsString), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
        begin
            id_key_1       := id_key;
            try id_del     := StrToInt64(datasetmain.FieldByName('ID_DOC').AsString);          except id_del     := -11; end;
            try id_all_del := StrToInt64(datasetmain.FieldByName('ID_ALL_DOC').AsString);      except id_all_del := -11; end;
            try id_kk      := StrToInt64(datasetmain.FieldByName('ID_ALL_DOC_KOMIS').AsString) except id_kk      := -11; end;
            cxGrid1DBBandedTableView1.Controller.GoToPrev(false);
            id_prev        := StrToInt64(datasetmain.FieldByName('ID_DOC').AsString);
            datasetmain.Locate('ID_DOC', id_del, []);
            if datasetmain.FieldByName('FLAG_ALL_DOC').AsInteger = 0 then
            begin
                id_kk    := -102;
                id_key_1 := -103;
            end;


            if myclass.DeleteDoc(id_del, id_all_del, DatasetMain.FieldByName('SUMMA_DOC').AsFloat, StrToDate(myclass.bank_day), DatasetMain.FieldByName('PRIHOD_RASHOD').AsInteger, id_key_1, id_kk, DatasetMain.FieldByName('IS_ADD_CLBANK').AsInteger) =1 then
            begin
                ActionRefreshExecute(Sender);
                datasetmain.Locate('ID_DOC', id_prev, []);
            end else
            begin
                ActionRefreshExecute(Sender);
                datasetmain.Locate('ID_DOC', id_del, []);
            end;

        end;
    end;

end;

procedure TfmBankDocMainForm.cxGrid1DBTableView1DblClick(Sender: TObject);
var
    T : TfmbankOrder;
    prih : smallint;
begin
    if not DataSetMain.isEmpty then
    begin
        prih := DataSetMain['PRIHOD_RASHOD'];
        if (name_valuta = null) then
        begin
          name_valuta := '';
        end;

        if (id_valuta = null) then
        begin
          id_valuta := 0;
        end;

        T := TfmbankOrder.Create(self, myclass, ShowOrder, self, NoDog, prih, id_valuta, name_valuta);
        T.ShowModal;
        T.Free;
        if myclass.id_doc_pris > 0 then close;
    end;
end;

{function TfmBankDocMainForm.SelectDogovor;
var
    summa_dog : double;
    inputDog : TDogInput;
    res   : TDogResult;
    i, j : integer;
    TT : TDog;
begin
    summa_dog := 0;
    if Show_Summa_Bank(summa_dog, name_z) then
    begin
        SelectDogovor := true;
        TransactionWr.StartTransaction;
        decimalseparator := ',';
        inputDog             := SYS_DEFAULT_DOG_INPUT;
        inputDog.DBHandle    := Database.Handle;
        inputDog.WriteTrans  := TransactionWr.Handle;
        inputDog.ReadTrans   := Transaction.Handle;
        inputDog.FormStyle   := fsNormal;
        inputDog.Summa       := summa_dog;
        if prihod = 1
            then inputDog.id_Group_add := 61799//1499
            else inputDog.id_Group_add := 61799;//1599;
        inputDog.id_Group     := 61699;//699;
        inputDog.filter.bShowFilterForm := true;
        SYS_ID_USER          := myclass.id_user;
        inputDog.isZayav     := false;
        inputDog.arndGetPay  := 1;
        inputDog.shablon_data.bUse     := true;
        inputDog.shablon_data.num      := num_doc;
        inputDog.shablon_data.date_dog := date_vip;
        inputDog.shablon_data.note     := note;
        inputDog.shablon_data.summa    := StrToCurr(sum_doc);
        inputDog.shablon_data.id_rate_account    := id_account_customer;
        inputDog.shablon_data.id_rate_acc_native := id_ras;
        inputDog.filter.SummaFrom      := StrToCurr(sum_doc);
        inputDog.filter.SummaTo        := StrToCurr(sum_doc);
        inputDog.filter.bSumma         := true;
        inputDog.filter.NameCust       := name_cust;
        inputDog.filter.bNameCust      := true;
        inputDog.filter.id_cust        := id_customer;
        inputDog.filter.bID_Cust       := true;
        //        inputDog.id_doc      := mm.id_all_doc;
        res := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
            i := length(res.Smets);
            SetLength(DogParam, i);
            for j := 0 to i-1 do
            begin
//                TT := New(^TDog);
                TT.NumSmeta  := res.Smets[j].NumSmeta;
                TT.NumRazd   := res.Smets[j].NumRazd;
                TT.NumStat   := res.Smets[j].NumStat;
                TT.IdSmeta   := 0;
                TT.IdRazd    := 0;
                TT.IdState   := 0;
                TT.nameSmeta := '';
                TT.nameRazd  := '';
                TT.nameState := '';
                TT.Summa     := res.Smets[j].Summa;
                if res.Smets[j].NSumma = 0
                    then TT.NSumma    := summa_dog
                    else TT.NSumma    := res.Smets[j].NSumma;
                DogParam[j]  := TT;
            end;
        end;
    end else
    begin
        SelectDogovor := false;
    end;
end;}

procedure TfmBankDocMainForm.DataSetMainAfterScroll(DataSet: TDataSet);
var pr_type: integer;
    id_doc_cur: string;
begin
    if DataSetMain['OKPO_CUST'] <> null      then cxLabel14.Caption :=DataSetMain['OKPO_CUST']      else cxLabel14.Caption := '';
    if DataSetMain['FULL_NAME_CUST'] <> null then cxLabel16.Caption :=DataSetMain['FULL_NAME_CUST'] else cxLabel16.Caption := '';
    if DataSetMain['NAME_RAS_CUST'] <> null  then cxLabel18.Caption :=DataSetMain['NAME_RAS_CUST']  else cxLabel18.Caption := '';
    if DataSetMain['MFO_CUST'] <> null       then cxLabel20.Caption :=DataSetMain['MFO_CUST']       else cxLabel20.Caption := '';
    if DataSetMain['NAME_MFO_CUST'] <> null  then cxLabel22.Caption :=DataSetMain['NAME_MFO_CUST']  else cxLabel22.Caption := '';
    if DataSetMain['OSNOVANIE'] <> null      then cxLabel24.Text    :=DataSetMain['OSNOVANIE']      else cxLabel24.Text := '';
    if DataSetMain['COMMENT_PROV_ALL'] <> null      then cxMemo1.Text    :=DataSetMain['COMMENT_PROV_ALL']      else cxMemo1.Text := '';
    if DataSetMain['PRIHOD_RASHOD'] <> null  then pr_type           := DataSetMain['PRIHOD_RASHOD'];
    if DataSetMain['ID_ALL_DOC'] <> null     then id_doc_cur           := DataSetMain['ID_ALL_DOC'];
    if (cxCheckBox1.Checked = true)then
    begin
        DataSetProv.Close;
        DataSetProv.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_ALL_PROV('''+id_doc_cur+''', '+inttostr(pr_type)+')';
        DataSetProv.Open;
    end;
end;

procedure TfmBankDocMainForm.cxCheckBoxClick(Sender: TObject);
begin
    ActionRefreshExecute(Sender);
end;

procedure TfmBankDocMainForm.ActionShowExecute(Sender: TObject);
begin
    showmessage('id_doc - ' + DataSetMain.FieldByName('ID_DOC').AsString+#13+
                'id_all_doc - ' + DataSetMain.FieldByName('ID_ALL_DOC').AsString+#13+
                'id_komis - ' + DataSetMain.FieldByName('ID_KOM_DOC').AsString+#13+
                'id_all_komis - '+ DataSetMain.FieldByName('ID_ALL_DOC_KOMIS').AsString);
end;

procedure TfmBankDocMainForm.ActionShowDocExecute(Sender: TObject);
begin
    cxGrid1DBTableView1DblClick(Sender);
end;

procedure TfmBankDocMainForm.cxGrid1DBBandedTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key = VK_RETURN) or (key = VK_SPACE) then cxGrid1DBTableView1DblClick(Sender);
end;

procedure TfmBankDocMainForm.ActionCWiclyFindExecute(Sender: TObject);
begin
  //  cxTextEdit1.SetFocus;
end;

procedure TfmBankDocMainForm.cxTextEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
    s: string;
begin
  {  if Key = VK_RETURN then
    begin
        if not DataSetMain.Locate('NAME_CUST', cxTextEdit1.Text, [loPartialKey]) then
        begin
            s := AnsiUpperCase(cxTextEdit1.Text);
            if DataSetMain.Locate('NAME_CUST', s, [loPartialKey]) then cxGrid1.setFocus;
        end else cxGrid1.setFocus;
    end; }
end;

procedure TfmBankDocMainForm.cxGrid1DBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
//cxGrid1DBBandedTableView1DBBandedColumn6
  if (AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1DBBandedColumn6.Index] = 0) and (not AViewInfo.GridRecord.Focused) then
    begin
      ACanvas.Canvas.Font.Color := clRed;//RGB(150,50,50);
      ACanvas.Canvas.FillRect(Arect);
      exit;
    end;
  if (AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1DBBandedColumn8.Index] = 0) and (not AViewInfo.GridRecord.Focused) then
    begin
      ACanvas.Canvas.Font.Color := clBlue;//RGB(150,50,50);
      ACanvas.Canvas.FillRect(Arect);
      exit;
    end;
  if (not AViewInfo.GridRecord.Focused) then
    begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.FillRect(Arect);
    end;

end;

procedure TfmBankDocMainForm.cxGrid1DBBandedTableView1DBBandedColumn7CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if (AviewInfo.GridRecord.Values[cxGrid1DBBandedTableView1DBBandedColumn6.Index] = 0) then begin
            ACanvas.FillRect(AViewInfo.Bounds);
            ACanvas.DrawImage(ImageList, AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                                AviewInfo.Bounds.Top, 0);
            ADone := True;
            exit;
    end;
    if (AviewInfo.GridRecord.Values[cxGrid1DBBandedTableView1DBBandedColumn8.Index] = 0) then begin
            ACanvas.FillRect(AViewInfo.Bounds);
            ACanvas.DrawImage(ImageList, AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                                AviewInfo.Bounds.Top, 13);
            ADone := True;
            exit;
    end;
    begin
            ACanvas.FillRect(AViewInfo.Bounds);
            ACanvas.DrawImage(ImageList, AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                                AviewInfo.Bounds.Top, 1);
            ADone := True;
    end;
end;

procedure TfmBankDocMainForm.ActionOtvDocExecute(Sender: TObject);
var
    id : int64;
    T : TfmUn_Progress_form;
begin
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.BANK_OTV_DOC_PROCESS);
    T.Show;
    T.Update;
    StoredProc.Database    := Database;
    StoredProc.Transaction := TransactionWr;
    TransactionWr.StartTransaction;
    StoredProc.StoredProcName:='BANK_OTV_KOM';
    StoredProc.Prepare;
    try id := StrToInt64(DataSetMain.FieldByName('ID_DOC').asString); except id := -103; end;
    StoredProc.ParamByName('FLAG_DOC').AsInteger := 1;
    StoredProc.ParamByName('ID_DOC').AsInt64     := id;
    StoredProc.ParamByName('DATE_BEG').AsDate    := strToDate('01.01.2000');
    StoredProc.ParamByName('DATE_END').AsDate    := strToDate('01.01.2000');
    StoredProc.ExecProc;
    TransactionWr.Commit;
    ActionRefreshExecute(Sender);
    T.Free;
end;

procedure TfmBankDocMainForm.ActionProverkaOtvExecute(Sender: TObject);
begin
    if Priznac_komis = 0 then
    begin
        showmessage(Un_R_file_Alex.BANK_R_S_DONT_KOM);
        exit;
    end;
    if DataSetMain.FieldByName('FLAG_ALL_DOC').AsInteger = 0 then
    begin
        showmessage(Un_R_file_Alex.BANK_NARUSCH_CELOST);
        exit;
    end;
    if DataSetMain.FieldByName('PRIHOD_RASHOD').AsInteger = 1 then
    begin
        showmessage(Un_R_file_Alex.BANK_PRIH_DOC_KOM);
        exit;
    end;
    if DataSetMain.FieldByName('FLAG_OSNOVNOY_DOC').AsInteger = 0 then
    begin
        showmessage(Un_R_file_Alex.BANK_KOM_DOC_DONT_OTV);
        exit;
    end;
    if MessageBox(Handle, Pchar(Un_R_file_Alex.BANKVOPROS_OTV_DOC), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
    ActionOtvDocExecute(Sender);
end;

procedure TfmBankDocMainForm.ActionCancelExecute(Sender: TObject);
begin
//
end;

procedure TfmBankDocMainForm.ActionAddAllExecute(Sender: TObject);
var
    T : TfmBankOrder;
    prih, id_user,k,i : Integer;
    f_pri, f_ra, f_def_f_z, f_sys_z, f_vis_z, kod_z, type_oper : integer;
    id_oper_z, id_sc_z, id_sm_z, id_st_z, id_razd_z, id_kekv_z : int64;
    summa_dog : double;

    f_id_DOC, f_ID_ALL_DOC, f_id_account_customer, f_id_cust : int64;
    f_date_vip, f_date_doc : TDate;
    f_num_doc, f_sum_doc, f_note, f_id_currency, f_summa_c, f_name_cust : string;
    s : boolean;
    n : integer;
    error : integer;
    j : integer;
    Res : variant;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_document','Add');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    begin
        f_id_DOC              := 0;
        f_ID_ALL_DOC          := 0;
        f_id_account_customer := 0;
        f_date_vip            := date;
        f_date_doc            := date;
        f_num_doc             := '';
        f_sum_doc             := '';
        f_note                := '';
        f_id_currency         := '';
        f_summa_c             := '';
        prih                  := -2;
        f_id_cust             := 0;
        mfo_cust              := '';
        name_bank             := '';
        ras_cust              := '';
        id_key                := 0;
        DataSetSelectDocNe.Close;
        DataSetSelectDocNe.SQLs.SelectSQL.Text := 'SELECT DISTINCT * FROM BANK_SELECT_ALL_DOC_FROM_DAY_NE('''+cxLabel12.Caption+''', '+IntToStr(myclass.id_ras_sch_pris)+', '+IntToStr(1)+', '+IntToStr(0)+')';
        DataSetSelectDocNe.Open;
        DataSetSelectDocNe.FetchAll;

        if not DataSetSelectDocNe.IsEmpty then
        begin
            DataSetSelectDocNe.First;

            ProgressBar.MaxValue:=DataSetSelectDocNe.RecordCount;
            pos:=0;
            cxLabel29.Caption :=inttostr(DataSetSelectDocNe.RecordCount);
            cxLabel26.Caption := Un_R_file_Alex.BANK_OROB_PL;
            cxLabel28.Caption := Un_R_file_Alex.BANK_FROM;
            Panel3.Update;
            Panel3.Visible:=true;
            j :=0;
            while not DataSetSelectDocNe.eof do
            begin
                j := j+1;
                cxLabel27.Caption :=inttostr(j);
                Panel3.Update;
                cxLabel27.Update;
                decimalseparator := ',';
                is_add_CL_buff      := DataSetSelectDocNe['ADD_HAND'];
                id_DOC              := DataSetSelectDocNe['ID_DOC'];
                ID_ALL_DOC          := 0;
                id_account_customer := DataSetSelectDocNe['ID_ACCOUNT_CUSTOMER'];
                date_vip            := DataSetSelectDocNe['DATE_VIP'];
                date_doc            := DataSetSelectDocNe['DATE_DOC'];
                num_doc             := DataSetSelectDocNe['NUMBER_DOC'];
                sum_doc             := DataSetSelectDocNe['SUMMA_DOC'];
                note                := DataSetSelectDocNe['OSNOVANIE'];
                id_currency         := '';
                summa_valuta        := '';
                name_cust           := DataSetSelectDocNe['NAME_CUST'];
                id_customer         := DataSetSelectDocNe['ID_CUSTOMER'];
                numer_lena          := '';
                mfo_cust            := DataSetSelectDocNe['MFO_CUST'];
                name_bank           := DataSetSelectDocNe['NAME_MFO_CUST'];
                ras_cust            := DataSetSelectDocNe['NAME_RAS_CUST'];
                num_doc_kazn        := DataSetSelectDocNe.fbn('NUM_DOC_KAZN').AsString;
                kazna               := DataSetSelectDocNe.fbn('KAZNACH').Asinteger;
                if DataSetSelectDocNe['TYPE_DOC'] = 1 then prih := 1
                else prih := 0;

                decimalseparator := ',';
                pFIBDataSet_ini.Close;
                pFIBDataSet_ini.SQLs.SelectSQL.Text := 'select * from BANK_SELECT_SHABLON_TRANZ WHERE ID_ACC_A='+IntTOStr(myclass.id_ras_sch_pris)+' and ID_ACC_B='+IntToStr(id_account_customer);
                pFIBDataSet_ini.Open;

                if  pFIBDataSet_ini.IsEmpty then DataSetSelectDocNe.Next
                else
                begin
                    decimalseparator := ',';
                    T := TfmBankOrder.Create(self, myclass, AddOrder, self, Tranzit, prih,id_valuta, name_valuta);
                    T.Enabled := false;
                    T.Enabled := true;
                    T.Visible := false;
                    T.ActionSaveAll.Execute;
                    T.Free;
                          //exit;

                    DataSetSelectDocNe.Next;
                    f_id_DOC              := 0;
                    f_ID_ALL_DOC          := 0;
                    f_id_account_customer := 0;
                    f_date_vip            := date;
                    f_date_doc            := date;
                    f_num_doc             := '';
                    f_sum_doc             := '';
                    f_note                := '';
                    f_id_currency         := '';
                    f_summa_c             := '';
                    prih                  := -2;
                    f_id_cust             := 0;
                    mfo_cust              := '';
                    name_bank             := '';
                    ras_cust              := '';
                    id_key                := 0;
                end;
                pos:=j;
                ProgressBar.Progress:=pos;
            end;
            Panel3.Visible:=false;
        end;
    end;
    pos:=0;
    Panel3.Update;
    ProgressBar.Progress:=0;
end;

procedure TfmBankDocMainForm.ActionDeleteAllExecute(Sender: TObject);
var
    id_del, id_all_del, id_prev, id_kk, id_key_1 : int64;
    error, prrr : integer;
    j : integer;
    T : TfmUn_Progress_form;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_document','Del');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    //if not DataSetMain.IsEmpty then
   // begin
       // if MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_DELETE_ALL_DOC +' № '+datasetmain.FieldByName('NAME_CUST').AsString), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
       // begin

       DataSetMain.Close;
       DataSetMain.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_ALL_DOC_FROM_DAY('''+myclass.bank_day+''', '+IntToStr(myclass.id_ras_sch_pris)+', '+IntToStr(select_osnov)+')';
       DataSetMain.Open;
       datasetmain.fetchall;
       if not DataSetMain.IsEmpty then
       begin
           if MessageBox(Handle, Pchar(Un_R_file_Alex.BANK_ZA+' '+myclass.bank_day+' '+Un_R_file_Alex.BANK_OBROB_BUH+' '+inttostr(datasetmain.RecordCount)+' ' +Un_R_file_Alex.BANK_DOCS+'. '+Un_R_file_Alex.BANK_DEL_ALL_OBROB), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
           begin
           datasetmain.first;
           j :=0;

           ProgressBar.MaxValue:=datasetmain.RecordCount;
           pos:=0;
           cxLabel29.Caption :=inttostr(datasetmain.RecordCount);
           cxLabel26.Caption := Un_R_file_Alex.BANK_DEL_PL;
           cxLabel28.Caption := Un_R_file_Alex.BANK_FROM;
           Panel3.Update;
           cxLabel29.Update;
           Panel3.Visible:=true;

           while  not DatasetMain.eof do
           begin
                j := j+1;
                cxLabel27.Caption :=inttostr(j);
                Panel3.Update;
                id_key_1       := id_key;
                try id_del     := StrToInt64(datasetmain.FieldByName('ID_DOC').AsString);          except id_del     := -11; end;
                try id_all_del := StrToInt64(datasetmain.FieldByName('ID_ALL_DOC').AsString);      except id_all_del := -11; end;
                try id_kk      := StrToInt64(datasetmain.FieldByName('ID_ALL_DOC_KOMIS').AsString) except id_kk      := -11; end;

                if datasetmain.FieldByName('FLAG_ALL_DOC').AsInteger = 0 then
                begin
                    id_kk    := -102;
                    id_key_1 := -103;
                end;


                if myclass.DeleteDoc(id_del, id_all_del, DatasetMain.FieldByName('SUMMA_DOC').AsFloat, StrToDate(myclass.bank_day), DatasetMain.FieldByName('PRIHOD_RASHOD').AsInteger, id_key_1, id_kk, DatasetMain.FieldByName('IS_ADD_CLBANK').AsInteger) =1 then
                begin
                    //ActionRefreshExecute(Sender);
                    datasetmain.Locate('ID_DOC', id_prev, []);
                end else
                begin
                    //ActionRefreshExecute(Sender);
                    datasetmain.Locate('ID_DOC', id_del, []);
                end;
                datasetmain.next;
                pos:=j;
                ProgressBar.Progress:=pos;
              end;
          end;
        end;
        ActionRefreshExecute(Sender);
        pos:=0;
        Panel3.Update;
        Panel3.Visible:=false;
        ProgressBar.Progress:=0;
end;

{procedure TfmBankDocMainForm.ActionFindExecute(Sender: TObject);
var
    s: string;
begin
    if not DataSetMain.Locate('NAME_CUST', cxTextEdit1.Text, [loPartialKey]) then
    begin
        s := AnsiUpperCase(cxTextEdit1.Text);
        if DataSetMain.Locate('NAME_CUST', s, [loPartialKey]) then cxGrid1.setFocus;
    end else cxGrid1.setFocus;

end;}

procedure TfmBankDocMainForm.cxCheckBox1Click(Sender: TObject);
var
    id_ddd : string;
    prihod_n : integer;
begin
    if cxCheckBox1.Checked then
    begin
        cxSplitter1.OpenSplitter;
        DataSetProv.Close;
        id_ddd   := DataSetMain.FieldByName('ID_ALL_DOC').AsString;
        prihod_n := DataSetMain.FieldByName('PRIHOD_RASHOD').AsInteger;
        DataSetProv.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_ALL_PROV('''+id_ddd+''', '+IntToStr(prihod_n)+')';
        DataSetProv.Open;
    end
    else cxSplitter1.CloseSplitter;
end;

procedure TfmBankDocMainForm.FormCreate(Sender: TObject);
begin
   // FormStorage1.RestoreFormPlacement;
end;

procedure TfmBankDocMainForm.ActionClonExecute(Sender: TObject);
var
    T : TfmBankOrder;
    idd_ : int64;
    error, prih : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_document/Bank_doc_clon','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
            
   if ((myclass.block_deb=1)and (DatasetMain['PRIHOD_RASHOD']=1))  then
    begin
        showmessage(Un_R_file_Alex.BANK_DOC_BLOCK_DEB);
        exit;
    end;
    if ((myclass.block_kred=1)and (DatasetMain['PRIHOD_RASHOD']=0)) then
    begin
        showmessage(Un_R_file_Alex.BANK_DOC_BLOCK_KR);
        exit;
    end;
    if (myclass.block_sal=1) then
    begin
         showmessage(Un_R_file_Alex.BANK_DOC_BLOCK_SAL);
         exit;
    end;

  if not DataSetMain.IsEmpty then
  begin
    if DataSetMain.FieldByName('FLAG_ALL_DOC').AsInteger = 0 then
    begin
        showmessage(Un_R_file_Alex.BANK_DOC_DONT_EDIT);
        exit;
    end;
    try idd_ := StrToInt64(DataSetMain.FieldByName('ID_KOM_DOC').AsString); except idd_ := -11; end;

    if (DataSetMain.FieldByName('FLAG_OSNOVNOY_DOC').AsInteger = 0) and (idd_ > 0) then
    begin
        showmessage(Un_R_file_Alex.BANK_DOC_DONT_EDIT_KOM);
        exit;
    end;
    if DataSetMain['ID_KEY_LOCAL'] <> null
        then id_key     := DataSetMain['ID_KEY_LOCAL']
        else id_key     := 0;
    id_DOC              := DataSetMain['ID_DOC'];
    ID_ALL_DOC          := StrToInt64(DataSetMain.FieldByName('ID_ALL_DOC').AsString);   
    id_account_customer := DataSetMain['ID_ACCOUNT_CUSTOMER'];
    date_vip            := DataSetMain['DATE_VIP'];
    date_doc            := DataSetMain['DATE_DOC'];
    num_doc             := DataSetMain['NUMBER_DOC'];
    sum_doc             := DataSetMain['SUMMA_DOC'];
    note                := DataSetMain['OSNOVANIE'];
    if DataSetMain['ID_CURRENCY'] > null then
        id_currency         := DataSetMain['ID_CURRENCY'];
    if DataSetMain['SUMMA_VALUTA'] <> null then
        summa_valuta             := DataSetMain['SUMMA_VALUTA'];
    if DataSetMain['ID_CUSTOMER'] then
        id_customer         := DataSetMain['ID_CUSTOMER'];
    prih := DataSetMain['PRIHOD_RASHOD'];

    T := TfmBankOrder.Create(self, myclass, ClonOrder, self, NoDog, prih,id_valuta, name_valuta);
    T.ShowModal;
    T.Free;
  end;
end;

end.
