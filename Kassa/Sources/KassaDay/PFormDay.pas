unit PFormDay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup,
  ExtCtrls, Un_R_file_Alex, FR_Class, cxControls, KassaDayForm, FR_DSet,
  FR_DBSet, DB, FIBDataSet, pFIBDataSet, cxContainer, cxEdit, cxCheckBox,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxSpinEdit, cxLabel, frxClass,
  frxDBSet, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  cxCalendar, frxExportXLS, frxExportXML,DateUtils, frxDesgn;

type
  TPrint = (prihod, rashod);

  TfmPrintFormDay = class(TForm)
    cxButtonPrint: TcxButton;
    cxButtonClose: TcxButton;
    Report: TfrReport;
    DataSetList: TpFIBDataSet;
    frDBDataSet1: TfrDBDataSet;
    cxCheckBoxEdit: TcxCheckBox;
    cxCheckBoxShow: TcxCheckBox;
    Bevel1: TBevel;
    cxCheckBoxPrihod_List: TcxCheckBox;
    cxCheckBoxRashod_List: TcxCheckBox;
    cxCheckBoxBuh_Otchet: TcxCheckBox;
    cxCheckBoxOtchet_Sch: TcxCheckBox;
    DataSetBuh: TpFIBDataSet;
    frDBDataSet2: TfrDBDataSet;
    Report1: TfrReport;
    cxSpinEditRihodList: TcxSpinEdit;
    cxSpinEditRashodList: TcxSpinEdit;
    cxSpinEditBuhOtchet: TcxSpinEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxSpinEdit1: TcxSpinEdit;
    cxSpinEdit2: TcxSpinEdit;
    cxSpinEdit3: TcxSpinEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxLabel10: TcxLabel;
    cxSpinEdit4: TcxSpinEdit;
    cxLabel11: TcxLabel;
    cxSpinEdit5: TcxSpinEdit;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxSpinEdit6: TcxSpinEdit;
    cxLabel14: TcxLabel;
    cxSpinEdit7: TcxSpinEdit;
    cxLabel15: TcxLabel;
    DataSetBuhNUMBER: TFIBStringField;
    DataSetBuhFIO: TFIBStringField;
    DataSetBuhPRIHOD: TFIBBCDField;
    DataSetBuhRASHOD: TFIBBCDField;
    DataSetBuhOSNOVANIE: TFIBStringField;
    DataSetBuhTITLE_SCH: TFIBStringField;
    DataSetBuhSUM_PRIHOD: TFIBBCDField;
    DataSetBuhSUM_RASHOD: TFIBBCDField;
    cxCheckBox3: TcxCheckBox;
    cxLabel16: TcxLabel;
    cxSpinEdit8: TcxSpinEdit;
    cxLabel17: TcxLabel;
    cxSpinEdit9: TcxSpinEdit;
    cxLabel18: TcxLabel;
    DataSetOtchetRasschifrovka: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    DataSetOtchetRasschifrovkaNUMBER_DOC: TFIBStringField;
    DataSetOtchetRasschifrovkaFIO: TFIBStringField;
    DataSetOtchetRasschifrovkaPRIHOD: TFIBBCDField;
    DataSetOtchetRasschifrovkaRASHOD: TFIBBCDField;
    DataSetOtchetRasschifrovkaOSNOVANIE: TFIBStringField;
    DataSetOtchetRasschifrovkaSUM_PRIH: TFIBBCDField;
    DataSetOtchetRasschifrovkaSUM_RASH: TFIBBCDField;
    DataSetOtchetRasschifrovkaSCH_KOD: TFIBStringField;
    DataSetOtchetRasschifrovkaSMETA_KOD: TFIBIntegerField;
    DataSetOtchetRasschifrovkaRAZD_KOD: TFIBIntegerField;
    DataSetOtchetRasschifrovkaSTATE_KOD: TFIBIntegerField;
    DataSetOtchetRasschifrovkaKEKV_KOD: TFIBIntegerField;
    DataSetOtchetRasschifrovkaNAME_PREDPR: TFIBStringField;
    cxCheckBoxDel: TcxCheckBox;
    cxLabel19: TcxLabel;
    cxSpinEdit10: TcxSpinEdit;
    DataSetDel: TpFIBDataSet;
    DBDatasetDel: TfrxDBDataset;
    DataSetPage: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    TransactionWr: TpFIBTransaction;
    DataSetBuhID: TFIBBCDField;
    DBDataseOtchet: TfrxDBDataset;
    DataSetBuhNAME_PREDPR: TFIBStringField;
    cxCheckBoxBookPrih: TcxCheckBox;
    DBDatasetBookPrih: TfrxDBDataset;
    DataSetBookPrih: TpFIBDataSet;
    DataSetBookPrihPRIHOD: TFIBStringField;
    DataSetBookPrihR_NAME_PREDPR: TFIBStringField;
    DataSetBookPrihNUMBER: TFIBStringField;
    DataSetBookPrihFIO: TFIBStringField;
    DataSetBookPrihOSNOVANIE: TFIBStringField;
    DataSetBookPrihSUMMA: TFIBBCDField;
    DataSetBookPrihDATE_DOC: TFIBDateField;
    DataSetDelID_DT_DOC: TFIBBCDField;
    DataSetDelKASSA_DAY: TFIBDateField;
    DataSetDelNOTE: TFIBStringField;
    DataSetDelNUMBER: TFIBStringField;
    DataSetDelSUMMA_PRIH: TFIBBCDField;
    DataSetDelSUMMA_RASH: TFIBBCDField;
    DataSetDelPRIHOD: TFIBIntegerField;
    DataSetDelUSE_END: TFIBDateTimeField;
    DataSetDelID_USER: TFIBBCDField;
    DataSetDelFIO_DEL: TFIBStringField;
    DataSetDelFIO: TFIBStringField;
    cxCheckBoxSch: TcxCheckBox;
    cxLabel26: TcxLabel;
    cxSpinEdit13: TcxSpinEdit;
    cxLabel27: TcxLabel;
    cxSpinEdit14: TcxSpinEdit;
    cxLabel28: TcxLabel;
    DataSetSch: TpFIBDataSet;
    DBDatasetSch: TfrxDBDataset;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DataSetSchR_NAME_SCH: TFIBStringField;
    DataSetSchR_KOD: TFIBStringField;
    DataSetSchR_NAME_PREDPR: TFIBStringField;
    DataSetSchR_SUMM_DEBET: TFIBBCDField;
    DataSetSchR_SALDO_BEGIN: TFIBBCDField;
    DataSetSchR_SALDO_END: TFIBBCDField;
    DataSetSchR_SUMM_KREDIT: TFIBBCDField;
    DataSetSchR_ID_SCH_KASSA: TFIBBCDField;
    DataSetSchR_NUM_KASSA: TFIBStringField;
    DataSetSchR_TITLE_KASSA: TFIBStringField;
    DataSetSchR_LISTIK: TFIBIntegerField;
    frxDBDatasetList: TfrxDBDataset;
    DataSetBuhNN: TFIBStringField;
    DataSetOtchetRasschifrovkaNN: TFIBStringField;
    DataSetDelNAME_PREDPR: TFIBStringField;
    cxCheckBox4: TcxCheckBox;
    cxLabel29: TcxLabel;
    cxLabel30: TcxLabel;
    cxSpinEdit15: TcxSpinEdit;
    cxSpinEdit16: TcxSpinEdit;
    cxLabel31: TcxLabel;
    DataSet_Smeta: TpFIBDataSet;
    frxDBDatasetSmeta: TfrxDBDataset;
    DataSet_SmetaR_ID_SMETA: TFIBBCDField;
    DataSet_SmetaR_ID_SCH: TFIBBCDField;
    DataSet_SmetaR_ID_RAZD: TFIBBCDField;
    DataSet_SmetaR_ID_STATE: TFIBBCDField;
    DataSet_SmetaR_ID_KEKV: TFIBBCDField;
    DataSet_SmetaR_SUMMA: TFIBBCDField;
    DataSet_SmetaR_OBOROT_D: TFIBBCDField;
    DataSet_SmetaR_OBOROT_K: TFIBBCDField;
    DataSet_SmetaR_OST: TFIBBCDField;
    DataSet_SmetaR_SMETA_KOD: TFIBIntegerField;
    DataSet_SmetaR_SMETA_TYTLE: TFIBStringField;
    DataSet_SmetaR_RAZD_KOD: TFIBIntegerField;
    DataSet_SmetaR_RAZD_TYTLE: TFIBStringField;
    DataSet_SmetaR_STATE_KOD: TFIBIntegerField;
    DataSet_SmetaR_STATE_TYTLE: TFIBStringField;
    DataSet_SmetaR_KEKV_KOD: TFIBIntegerField;
    DataSet_SmetaR_KEKV_TYTLE: TFIBStringField;
    DataSet_SmetaR_SCH_KOD: TFIBStringField;
    DataSet_SmetaR_SCH_TYTLE: TFIBStringField;
    DataSet_SmetaR_IS_SPRAVKA: TFIBIntegerField;
    DataSet_SmetaR_NAME_PRED: TFIBStringField;
    DataSet_SmetaR_NAME: TFIBStringField;
    DataSet_SmetaR_ALL_V: TFIBBCDField;
    DataSet_SmetaR_ALL_O_D: TFIBBCDField;
    DataSet_SmetaR_ALL_O_K: TFIBBCDField;
    DataSet_SmetaR_ALL_VIH: TFIBBCDField;
    DataSet_SmetaR_LEVEL: TFIBIntegerField;
    DataSet_SmetaR_A_V: TFIBBCDField;
    DataSet_SmetaR_A_VIH: TFIBBCDField;
    DataSet_SmetaR_O_D: TFIBBCDField;
    DataSet_SmetaR_O_K: TFIBBCDField;
    DataSet_SmetaR_SALDO_BEGIN: TFIBBCDField;
    DataSet_SmetaR_SALDO_END: TFIBBCDField;
    DataSet_SmetaR_SUM_DEBET: TFIBBCDField;
    DataSet_SmetaR_SUM_KREDIT: TFIBBCDField;
    DataSet: TpFIBDataSet;
    DataSetBuhSALDO_BEGIN: TFIBBCDField;
    DataSetBuhSALDO_END: TFIBBCDField;
    ReportDel: TfrxReport;
    ReportBookPrih: TfrxReport;
    ReportSch: TfrxReport;
    frxReport_Smeta: TfrxReport;
    DatasetVar2: TfrxDBDataset;
    StoredProcVar2: TpFIBStoredProc;
    frxXMLExport1: TfrxXMLExport;
    pFIBDataSet_ini: TpFIBDataSet;
    ReportVar2: TfrxReport;
    cxCheckBox5: TcxCheckBox;
    cxLabel20: TcxLabel;
    cxSpinEdit11: TcxSpinEdit;
    cxLabel21: TcxLabel;
    cxSpinEdit12: TcxSpinEdit;
    cxLabel22: TcxLabel;
    cxCheckBoxLastP: TcxCheckBox;
    cxCheckBoxNote: TcxCheckBox;
    cxCheckBoxFirstPage: TcxCheckBox;
    cxSpinEdit17: TcxSpinEdit;
    cxLabel23: TcxLabel;
    DataSetBuhKOD_EDRPOU: TFIBStringField;
    frxReport1: TfrxReport;
    DataSetListNUMBER: TFIBStringField;
    DataSetListOSNOVANIE: TFIBStringField;
    DataSetListR_NAME_PREDPR: TFIBStringField;
    DataSetListSUMMA_ZP: TFIBBCDField;
    DataSetListSUMMA_KOM: TFIBBCDField;
    DataSetListSUMMA_OTHER: TFIBBCDField;
    DataSetListKOD_EDRPOU: TFIBStringField;
    DataSetListDAY_KASSA: TFIBDateField;
    DataSetListSALDO_BEGIN: TFIBBCDField;
    DataSetListSALDO_END: TFIBBCDField;
    frxDesigner1: TfrxDesigner;
    ReportOtchet: TfrxReport;
    frxReportList: TfrxReport;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
    procedure cxCheckBoxShowClick(Sender: TObject);
    procedure cxCheckBoxPrihod_ListClick(Sender: TObject);
    procedure cxCheckBoxRashod_ListClick(Sender: TObject);
    procedure cxCheckBoxBuh_OtchetClick(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure cxSpinEditRihodListClick(Sender: TObject);
    procedure cxSpinEdit1Click(Sender: TObject);
    procedure cxSpinEditRashodListClick(Sender: TObject);
    procedure cxSpinEdit2Click(Sender: TObject);
    procedure cxSpinEditBuhOtchetClick(Sender: TObject);
    procedure cxSpinEdit3Click(Sender: TObject);
    procedure cxSpinEdit4Click(Sender: TObject);
    procedure cxSpinEdit5Click(Sender: TObject);
    procedure cxSpinEdit6Click(Sender: TObject);
    procedure cxSpinEdit7Click(Sender: TObject);
    procedure cxSpinEdit8Click(Sender: TObject);
    procedure cxSpinEdit9Click(Sender: TObject);
    procedure cxSpinEdit10Click(Sender: TObject);
    procedure cxSpinEdit13Click(Sender: TObject);
    procedure cxSpinEdit14Click(Sender: TObject);
    procedure cxSpinEdit15Click(Sender: TObject);
    procedure cxSpinEdit16Click(Sender: TObject);
    procedure cxCheckBoxBookPrihClick(Sender: TObject);
    procedure cxCheckBox5Click(Sender: TObject);
    procedure cxSpinEdit11Click(Sender: TObject);
    procedure cxSpinEdit12Click(Sender: TObject);
  private
    myform : TfmKassaDayForm;
    count_page, count_page_var2,count_page_kas_book, count_page_list_pr,count_page_list_ras,otch_kas2_st : integer;
    ll, llvar2, llkas_book, llList_ras, llList_pr : integer;
    symbol_empty : string;
  public
    current_day : Tdate;
    id_user_cur : int64;
    id_kas_cur : string;
    constructor Create(mform : TfmKassaDayForm{; m : TPrint}); reintroduce; overload;
  end;

implementation

uses cxGridDBTableView, cxDBData, cxGridTableView, cxGridCustomTableView,
  cxGridCustomView, cxCustomData, GlobalSPR, Un_Progress_form, Un_func_file_Alex, KassaFiltrReport;

{$R *.dfm}

constructor TfmPrintFormDay.Create(mform: TfmKassaDayForm{; m : TPrint});
begin
    inherited Create(nil);
    myform := mform;

    cxButtonPrint.Caption  := Un_R_file_Alex.MY_BUTTON_PRINT;
    cxButtonClose.Caption  := Un_R_file_Alex.N_AUTOKOD_FORM_CANCLE;

    Caption                                  := Un_R_file_Alex.KASSA_PRINT_CAPTION;
    cxCheckBoxPrihod_List.Properties.Caption := Un_R_file_Alex.KASSA_PRINT_PRIHOD_LIST;
    cxCheckBoxRashod_List.Properties.Caption := Un_R_file_Alex.KASSA_PRINT_RASHOD_LIST;
    cxCheckBoxBuh_Otchet.Properties.Caption  := Un_R_file_Alex.KASSA_PRINT_OTCHET_KASIRA;
    cxCheckBoxOtchet_Sch.Properties.Caption  := Un_R_file_Alex.KASSA_PRINT_OTCHET_PROV;
    cxCheckBoxShow.Properties.Caption        := Un_R_file_Alex.KASSA_PRINT_SHOW_OTCHET;
    cxCheckBox1.Properties.Caption           := Un_R_file_Alex.KASSA_PRINT_DOC_OT_2;
    cxCheckBox2.Properties.Caption           := Un_R_file_Alex.KASSA_PRINT_DOC_OT_3;
    cxCheckBox3.Properties.Caption           := Un_R_file_Alex.KASSA_PRINT_DOC_OT_4;
    cxCheckBoxDel.Properties.Caption         := Un_R_file_Alex.KASSA_PRINT_DOC_OT_5;
    cxCheckBox4.Properties.Caption           := Un_R_file_Alex.KASSA_RASSHIFROVKA_PO_SMETAM;
    cxCheckBox5.Properties.Caption           := Un_R_file_Alex.KASSA_BOOK_PRINT;
    cxCheckBoxLastP.Properties.Caption       := Un_R_file_Alex.KASSA_BOOK_PRINT_LAST_PAGE;
    cxCheckBoxNote.Properties.Caption        := Un_R_file_Alex.KASSA_BOOK_PRINT_NOTE;
    cxCheckBoxFirstPage.Properties.Caption   := Un_R_file_Alex.KASSA_BOOK_PRINT_FIRST_PAGE;

   cxCheckBoxBookPrih.Properties.Caption    := Un_R_file_Alex.KASSA_PRINT_FILTR_WIDE;
   // cxCheckBoxBookRash.Properties.Caption    := Un_R_file_Alex.KASSA_PRINT_BOOK_RASH;
    cxCheckBoxSch.Properties.Caption         := Un_R_file_Alex.KASSA_PRINT_OTC_SCH;

    cxLabel7.CAPTION                         := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel8.CAPTION                         := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel9.CAPTION                         := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel10.CAPTION                        := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel13.CAPTION                        := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel20.CAPTION                        := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel1.CAPTION                         := Un_R_file_Alex.KASSA_PRINT_FROM;
    cxLabel2.CAPTION                         := Un_R_file_Alex.KASSA_PRINT_FROM;
    cxLabel3.CAPTION                         := Un_R_file_Alex.KASSA_PRINT_FROM;
    cxLabel11.CAPTION                        := Un_R_file_Alex.KASSA_PRINT_FROM;
    CxLabel14.CAPTION                        := Un_R_file_Alex.KASSA_PRINT_FROM;
    cxLabel17.CAPTION                        := Un_R_file_Alex.KASSA_PRINT_FROM;
    //cxLabel20.CAPTION                        := Un_R_file_Alex.KASSA_PRINT_FROM;
    //cxLabel21.CAPTION                        := Un_R_file_Alex.KASSA_PRINT_FROM;
    cxLabel27.CAPTION                        := Un_R_file_Alex.KASSA_PRINT_FROM;
    cxLabel30.CAPTION                        := Un_R_file_Alex.KASSA_PRINT_FROM;
    cxLabel4.CAPTION                         := Un_R_file_Alex.KASSA_PAGE;
    cxLabel5.CAPTION                         := Un_R_file_Alex.KASSA_PAGE;
    cxLabel6.CAPTION                         := Un_R_file_Alex.KASSA_PAGE;
    cxLabel12.CAPTION                        := Un_R_file_Alex.KASSA_PAGE;
    cxLabel15.CAPTION                        := Un_R_file_Alex.KASSA_PAGE;
    cxLabel18.CAPTION                        := Un_R_file_Alex.KASSA_PAGE;
    //cxLabel25.CAPTION                        := Un_R_file_Alex.KASSA_PAGE;
    //cxLabel24.CAPTION                        := Un_R_file_Alex.KASSA_PAGE;
    cxLabel28.CAPTION                        := Un_R_file_Alex.KASSA_PAGE;
    cxLabel31.CAPTION                        := Un_R_file_Alex.KASSA_PAGE;
    cxLabel22.CAPTION                        := Un_R_file_Alex.KASSA_PAGE;
    //cxLabel22.CAPTION                        := Un_R_file_Alex.KASSA_FIND_CAP_3;
    //cxLabel23.CAPTION                        := Un_R_file_Alex.KASSA_FIND_CAP_3;
    cxLabel16.CAPTION                        := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel19.CAPTION                        := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel26.CAPTION                        := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel29.CAPTION                        := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel21.CAPTION                        := Un_R_file_Alex.KASSA_PRINT_FROM;

    Database := myform.Database;
    Transaction.DefaultDatabase := Database;

    DataSetList.Database    := Database;
    DataSetList.Transaction := Transaction;

    DataSetOtchetRasschifrovka.Database    := Database;
    DataSetOtchetRasschifrovka.Transaction := Transaction;

    DataSetBuh.Database    := Database;
    DataSetBuh.Transaction := Transaction;

    DataSetDel.Database    := Database;
    DataSetDel.Transaction := Transaction;

    //DataSetBookPrih.Database    := Database;
    //DataSetBookPrih.Transaction := Transaction;

    //DataSetBookRash.Database    := Database;
    //DataSetBookRash.Transaction := Transaction;

    DataSetSch.Database    := Database;
    DataSetSch.Transaction := Transaction;

    DataSetPage.Database    := Database;
    DataSetPage.Transaction := Transaction;

    DataSet_Smeta.Database    := Database;
    DataSet_Smeta.Transaction := Transaction;

    DataSet.Database          := Database;
    DataSet.Transaction       := Transaction;

    pFIBDataSet_ini.Database          := Database;
    pFIBDataSet_ini.Transaction       := Transaction;

    StoredProc.Database           := Database;
    TransactionWr.DefaultDatabase := Database;
    StoredProc.Transaction        := TransactionWr;

    StoredProcVar2.Database           := Database;
    StoredProcVar2.Transaction        := TransactionWr;

    Transaction.StartTransaction;

    DataSetPage.SQLs.SelectSQL.Text := 'SELECT * from KASSA_SELECT_LAST_PRINT_DAY('''+myform.DataSetDay.fieldByName('DAY_KASSA').AsString+''', '+IntToStr(myform.id_kassa)+')';
    DataSetPage.Open;

    pFIBDataSet_ini.Close;
    pFIBDataSet_ini.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_INI';
    pFIBDataSet_ini.Open;

    otch_kas2_st       := pFIBDataSet_ini.fieldByName('otch_kas2_st').AsInteger;
    current_day        := myform.DataSetDay.fieldByName('DAY_KASSA').AsDateTime;
    ll                 := DataSetPage.fieldByName('LAST_PAGE').AsInteger;
    llvar2             := DataSetPage.fieldByName('LAST_PAGE_VAR2').AsInteger;
    llkas_book         := DataSetPage.fieldByName('LAST_PAGE_KAS_BOOK').AsInteger;
    lllist_pr          := DataSetPage.fieldByName('LAST_PAGE_LIST_PR').AsInteger;
    llList_ras         := DataSetPage.fieldByName('LAST_PAGE_LIST_RAS').AsInteger;
    symbol_empty       := pFIBDataSet_ini.fieldByName('symbol_empty').AsString;
    cxSpinEdit3.Value  := 1+ ll;
    cxSpinEdit5.Value  := 1+ llvar2;
    cxSpinEdit12.Value := 1+ llkas_book;
    cxSpinEdit1.Value  := 1+ lllist_pr;
    cxSpinEdit2.Value  := 1+ llList_ras;
    count_page         := DataSetPage.fieldByName('COUNT_PAGE').AsInteger;
    count_page_var2    := DataSetPage.fieldByName('COUNT_PAGE_VAR2').AsInteger;
    count_page_kas_book    := DataSetPage.fieldByName('COUNT_PAGE_KASS_BOOK').AsInteger;
    count_page_list_pr     := DataSetPage.fieldByName('COUNT_PAGE_LIST_PR').AsInteger;
    count_page_list_ras    := DataSetPage.fieldByName('COUNT_PAGE_LIST_RAS').AsInteger;
    DataSetPage.Close;
    id_user_cur        := myform.myclass.id_user;
    id_kas_cur         := myform.DataSetDay.FieldByName('ID_SP_KASS').AsString;
    cxSpinEdit17.value := yearof(date);
end;


procedure TfmPrintFormDay.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfmPrintFormDay.cxButtonPrintClick(Sender: TObject);
var
    l, m, day, id_sp_kass : string;
    i, j : variant;
    ss : string;
    T : TfmUn_Progress_form;
    month, day_, year : integer;
    year_l, month_l, day_l, mon : string;
    //Tfm : TfmKassaFiltrReport;
begin
    if cxCheckBoxPrihod_List.Checked then
    begin
        DataSetList.Close;
        DataSetList.SQLs.SelectSQL.Text := 'select * from KASSA_GET_REG_LIST('''+myform.DataSetDay.FieldByName('ID_DT_DAY').AsString+''', '+IntToStr(1)+')';
        DataSetList.Open;
        DataSetList.FetchAll;
        l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
        year := YearOf(myform.DataSetDay['DAY_KASSA']);
        year := year mod 100;
        frxReportList.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10012.fr3');
        frxReportList.Variables['day_all']     := QuotedStr(l);
        frxReportList.Variables['prihod']      := 1;
        if year<=9 then
             frxReportList.Variables['year_of']   := QuotedStr('0'+IntToStr(year))
        else
             frxReportList.Variables['year_of']                   := QuotedStr(IntToStr(year));
        frxReportList.Variables['count_page']  := cxSpinEdit1.value;
        frxReportList.Variables['comp']        := QuotedStr(GetComputerNetName);
        frxReportList.Variables['id_user']     := QuotedStr(IntToStr(myform.myclass.id_user));
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                  frxReportList.Print;
            end
            else frxReportList.ShowReport(true);
        end else
        frxReportList.DesignReport;

            i := frxReportList.Engine.TotalPages;

        begin
            T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_UPDATE_DATA);
            T.Show;
            T.UpDate;
            TransactionWr.StartTransaction;
            StoredProc.StoredProcName:='KASSA_UPDATE_PRINT_DAY_LIST_PR';
            StoredProc.Prepare;
            StoredProc.ParamByName('D_ID_USER').AsInt64      := myform.myclass.id_user;
            StoredProc.ParamByName('D_DAY').AsDate           := myform.DataSetDay.FieldByname('DAY_KASSA').AsDateTime;
            StoredProc.ParamByName('D_SP_KASSA').AsInt64     := myform.id_kassa;
            StoredProc.ParamByName('D_COUNT_PAGE').AsVariant := i;
            StoredProc.ParamByName('D_LAST_PAGE').AsInteger  := cxSpinEdit1.Value + i - 1;
            StoredProc.ExecProc;
            TransactionWr.Commit;
            T.Free;
        end;

    end;

    if cxCheckBoxRashod_List.Checked then
    begin
        DataSetList.Close;
        DataSetList.SQLs.SelectSQL.Text := 'select * from KASSA_GET_REG_LIST('''+myform.DataSetDay.FieldByName('ID_DT_DAY').AsString+''', '+IntToStr(0)+')';
        DataSetList.Open;
        year := YearOf(myform.DataSetDay['DAY_KASSA']);
        year := year mod 100;
        l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
        frxReportList.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10012.fr3');
        frxReportList.Variables['day_all']     := QuotedStr(l);
        frxReportList.Variables['prihod']      := QuotedStr(inttostr(0));
        if year<=9 then
             frxReportList.Variables['year_of']   := QuotedStr('0'+IntToStr(year))
        else
             frxReportList.Variables['year_of']                   := QuotedStr(IntToStr(year));
        frxReportList.Variables['count_page']  := cxSpinEdit2.value;
        frxReportList.Variables['comp']        := QuotedStr(GetComputerNetName);
        frxReportList.Variables['id_user']     := QuotedStr(IntToStr(myform.myclass.id_user));
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                  frxReportList.Print;
            end
            else frxReportList.ShowReport(true);
        end else
        frxReportList.DesignReport;

        i := frxReportList.Engine.TotalPages;

        begin
            T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_UPDATE_DATA);
            T.Show;
            T.UpDate;
            TransactionWr.StartTransaction;
            StoredProc.StoredProcName:='KASSA_UPDATE_PRINT_DAY_LIST_RAS';
            StoredProc.Prepare;
            StoredProc.ParamByName('D_ID_USER').AsInt64      := myform.myclass.id_user;
            StoredProc.ParamByName('D_DAY').AsDate           := myform.DataSetDay.FieldByname('DAY_KASSA').AsDateTime;
            StoredProc.ParamByName('D_SP_KASSA').AsInt64     := myform.id_kassa;
            StoredProc.ParamByName('D_COUNT_PAGE').AsVariant := i;
            StoredProc.ParamByName('D_LAST_PAGE').AsInteger  := cxSpinEdit2.Value + i - 1;
            StoredProc.ExecProc;
            TransactionWr.Commit;
            T.Free;
        end;
    end;

    if cxCheckBoxBuh_Otchet.Checked then
    begin
        day        := myform.DataSetDay.FieldByName('DAY_KASSA').AsString;
        id_sp_kass := myform.DataSetDay.FieldByName('ID_SP_KASS').AsString;
        DataSetBuh.Close;
        DataSetBuh.SQLs.SelectSQL.Text := 'select * from KASSA_GET_OTCHET_KASSIRA(''' + day +''', '''+id_sp_kass+''') order by NN';
        DataSetBuh.Open;
        DataSetBuh.FetchAll;


        l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;

        DataSet.Close;
        DataSet.Sqls.SelectSQL.Text := 'SELECT * FROM PUB_SYS_DATA';
        DataSet.Open;
        if DataSet.FieldByName('ID_SERVER').AsString = '97'
            then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10014.fr3')
            else frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10008.fr3');
        DataSet.Close;
        frxReport1.Variables['day_all']     := QuotedStr(l);
        frxReport1.Variables['count_page']  := cxSpinEdit3.value;
        frxReport1.Variables['comp']        := QuotedStr(GetComputerNetName);

        frxReport1.Variables['count_prih']  := QuotedStr(perevod(myform.DataSetDay.FieldByName('COL_PRIHOD').AsString));
        frxReport1.Variables['count_rash']  := QuotedStr(perevod(myform.DataSetDay.FieldByName('COL_RASHOD').AsString));


        frxReport1.Variables['saldo_begin'] := QuotedStr(myform.DataSetDay.fieldByName('SALDO_BEGIN').AsString);
        frxReport1.Variables['saldo_end']   := QuotedStr(myform.DataSetDay.fieldByName('SALDO_END').AsString);
        frxReport1.Variables['id_user']     := QuotedStr(IntToStr(myform.myclass.id_user));
        frxReport1.PrepareReport(true);


            if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                    frxReport1.Print;
                end
                else frxReport1.ShowReport(true);
            end;
        i := frxReport1.Engine.TotalPages;
        
//        if (i <> count_page) or (cxSpinEdit3.Value <> ll + 1) then
        begin
            T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_UPDATE_DATA);
            T.Show;
            T.UpDate;
            TransactionWr.StartTransaction;
            StoredProc.StoredProcName:='KASSA_UPDATE_PRINT_DAY';
            StoredProc.Prepare;
            StoredProc.ParamByName('D_ID_USER').AsInt64      := myform.myclass.id_user;
            StoredProc.ParamByName('D_DAY').AsDate           := myform.DataSetDay.FieldByname('DAY_KASSA').AsDateTime;
            StoredProc.ParamByName('D_SP_KASSA').AsInt64     := myform.id_kassa;
            StoredProc.ParamByName('D_COUNT_PAGE').AsVariant := i;
            StoredProc.ParamByName('D_LAST_PAGE').AsInteger  := cxSpinEdit3.Value + i - 1;
            StoredProc.ExecProc;
            TransactionWr.Commit;
            T.Free;
        end;

    end;

    if cxCheckBox1.Checked then
    begin
        day        := myform.DataSetDay.FieldByName('DAY_KASSA').AsString;
        id_sp_kass := myform.DataSetDay.FieldByName('ID_SP_KASS').AsString;
        DataSetBuh.Close;
        DataSetBuh.SQLs.SelectSQL.Text := 'select * from KASSA_GET_OTCHET_KASSIRA(''' + day +''', '''+id_sp_kass+''') order by NN';
        DataSetBuh.Open;
        DataSetBuh.FetchAll;

        l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;

        if otch_kas2_st=1 then
           ReportVar2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Otchetkassira_var2_n.fr3')
        else
           ReportVar2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Otchetkassira_var2.fr3');
        ReportVar2.Variables['saldo_begin'] := QuotedStr(myform.DataSetDay.fieldByName('SALDO_BEGIN').AsString);
        ReportVar2.Variables['day_all']     := QuotedStr(l);
        ReportVar2.Variables['count_page']  := cxSpinEdit5.value;

        ReportVar2.Variables['count_prih']  := QuotedStr(perevod(myform.DataSetDay.FieldByName('COL_PRIHOD').AsString));
        ReportVar2.Variables['count_rash']  := QuotedStr(perevod(myform.DataSetDay.FieldByName('COL_RASHOD').AsString));

        ReportVar2.PrepareReport(true);

          j := ReportVar2.Engine.TotalPages;

           if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                    ReportVar2.Print;
                end
                else
                begin
                    ReportVar2.ShowReport(true);
                end;
            end;


        begin
            T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_UPDATE_DATA);
            T.Show;
            T.UpDate;
            TransactionWr.StartTransaction;
            StoredProcVar2.StoredProcName:='KASSA_UPDATE_PRINT_DAY_VAR2';
            StoredProcVar2.Prepare;
            StoredProcVar2.ParamByName('D_ID_USER_VAR2').AsInt64      := myform.myclass.id_user;
            StoredProcVar2.ParamByName('D_DAY').AsDate                := myform.DataSetDay.FieldByname('DAY_KASSA').AsDateTime;
            StoredProcVar2.ParamByName('D_SP_KASSA').AsInt64          := myform.id_kassa;
            StoredProcVar2.ParamByName('D_COUNT_PAGE_VAR2').AsVariant := j;
            StoredProcVar2.ParamByName('D_LAST_PAGE_VAR2').AsInteger  := cxSpinEdit5.Value + j - 1;
            StoredProcVar2.ExecProc;
            TransactionWr.Commit;
            T.Free;
        end;
    end;

    if cxCheckBox2.Checked then
    begin
        day        := myform.DataSetDay.FieldByName('DAY_KASSA').AsString;
        id_sp_kass := myform.DataSetDay.FieldByName('ID_SP_KASS').AsString;

        DataSetBuh.Close;
        DataSetBuh.SQLs.SelectSQL.Text := 'select * from KASSA_GET_OTCHET_KASSIRA(''' + day +''', '''+id_sp_kass+''') order by NN';
        DataSetBuh.Open;
        DataSetBuh.FetchAll;

        l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
        frVariables['saldo_begin'] := myform.DataSetDay.FieldByName('SALDO_BEGIN').AsFloat;
        frVariables['day']         := QuotedStr(l);
        frVariables['count_page']  := cxSpinEdit7.value;

        frVariables['сount_prih']  := perevod(myform.DataSetDay.FieldByName('COL_PRIHOD').AsString);
        frVariables['count_rash']  := perevod(myform.DataSetDay.FieldByName('COL_RASHOD').AsString);

        Report1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Otchetkassira_var3.frf');
        Report1.PrepareReport;
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
               begin
                        Report1.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                                   cxSpinEdit6.Value,
                                                   true,
                                                   frAll);
               end
            else Report1.ShowReport
        end else
        Report1.DesignReport;
    end;

    if cxCheckBox3.Checked then
    begin
            DataSetOtchetRasschifrovka.Close;
            DataSetOtchetRasschifrovka.SQLs.SelectSQL.Text := 'select * from KASSA_GET_OTCHET_KASSIRA_RASSCH('''+myform.DataSetDay.FieldByName('DAY_KASSA').AsString+''') order by NN';
            DataSetOtchetRasschifrovka.Open;
//            DataSetOtchetRasschifrovka.FetchAll;
            l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10005.fr3');
            frxReport1.Variables['day_all']     := QuotedStr(l);

            frxReport1.Variables['count_page']  := cxSpinEdit9.value;
            frxReport1.Variables['comp']        := QuotedStr(GetComputerNetName);
            frxReport1.Variables['saldo_begin'] := QuotedStr(myform.DataSetDay.fieldByName('SALDO_BEGIN').AsString);
            frxReport1.Variables['saldo_end']   := QuotedStr(myform.DataSetDay.fieldByName('SALDO_END').AsString);
            frxReport1.Variables['id_user']     := QuotedStr(IntToStr(myform.myclass.id_user));
            if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                      frxReport1.Print;
                end
                else frxReport1.ShowReport(true);
            end else
            frxReport1.DesignReport;
    end;

    if cxCheckBoxDel.Checked then {удаленные}
    begin
            l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
            DataSetDel.Close;
            DataSetDel.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_DELETED_DOC('''+l+''','''+l+''', '''+'-99999999999999'+''', '''+'99999999999999'+''', '''+''+''', '''+''+''', '+IntToStr(1)+', '+IntToStr(1)+')';
            DataSetDel.Open;
//            DataSetOtchetRasschifrovka.FetchAll;
            ReportDel.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10007.fr3');
            ReportDel.Variables['date_beg']   := QuotedStr(l);
//            ReportDel.Variables['date_end']   := QuotedStr(l);
//            ReportDel.Variables['count_page'] := cxSpinEdit9.value;
            ReportDel.Variables['comp']       := QuotedStr(GetComputerNetName);
            ReportDel.Variables['id_user']    := QuotedStr(IntToStr(myform.myclass.id_user));
            if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                      ReportDel.Print;
                end
                else ReportDel.ShowReport(true);
            end else
            ReportDel.DesignReport;
    end;



    if cxCheckBoxSch.Checked then
    begin
        day := myform.DataSetDay.FieldByName('DAY_KASSA').AsString;
        DataSetSch.Close;
        DataSetSch.SQLs.SelectSQL.Text := 'select * from KASSA_GET_OTCHET_PO_SCH('+IntToStr(myform.id_kassa)+', ''' + day +''', ''' + day +''')';
        DataSetSch.Open;
        DataSetSch.FetchAll;
        l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10011.fr3');
        frxReport1.Variables['day']     := QuotedStr(l);
        frxReport1.Variables['comp']    := QuotedStr(GetComputerNetName);
//        frxReport1.Variables['saldo_begin'] := QuotedStr(myform.DataSetDay.fieldByName('SALDO_BEGIN').AsString);
//        frxReport1.Variables['saldo_end']   := QuotedStr(myform.DataSetDay.fieldByName('SALDO_END').AsString);
        frxReport1.Variables['id_user'] := QuotedStr(IntToStr(myform.myclass.id_user));
        frxReport1.PrepareReport(true);
            if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                    frxReport1.Print;
                end
                else frxReport1.ShowReport(true);
            end;
    end;

    if cxCheckBox4.Checked then
    begin
        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_UPDATE_DATA);
        T.Show;
        T.UpDate;
        l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
        DataSet_Smeta.Close;
        DataSet_Smeta.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_OST_PO_KASSE(''' + l +''', '+IntToStr(myform.id_kassa)+')'; { order by R_SMETA_KOD, R_RAZD_KOD, R_STATE_KOD, R_KEKV_KOD, R_IS_SPRAVKA}
        DataSet_Smeta.Open;
        frxReport_Smeta.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10013.fr3');
        frxReport_Smeta.Variables['day']         := QuotedStr(l);
        frxReport_Smeta.Variables['count_page']  := cxSpinEdit16.value;
        frxReport_Smeta.Variables['comp']        := QuotedStr(GetComputerNetName);
//        frxReport_Smeta.Variables['saldo_begin'] := QuotedStr(myform.DataSetDay.fieldByName('SALDO_BEGIN').AsString);
//        frxReport_Smeta.Variables['saldo_end']   := QuotedStr(myform.DataSetDay.fieldByName('SALDO_END').AsString);
//        frxReport_Smeta.Variables['oborot_d']    := QuotedStr(myform.DataSetDay.fieldByName('SUM_DEBET').AsString);
//        frxReport_Smeta.Variables['oborot_k']    := QuotedStr(myform.DataSetDay.fieldByName('SUM_KREDIT').AsString);
        frxReport_Smeta.Variables['id_user']     := QuotedStr(IntToStr(myform.myclass.id_user));
        T.Free;
        frxReport_Smeta.PrepareReport(true);
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                frxReport_Smeta.Print;
            end
            else frxReport_Smeta.ShowReport(true);
        end;
    end;
    if cxCheckBox5.Checked then
    begin

        day        := myform.DataSetDay.FieldByName('DAY_KASSA').AsString;
        id_sp_kass := myform.DataSetDay.FieldByName('ID_SP_KASS').AsString;
        DataSetBuh.Close;
        DataSetBuh.SQLs.SelectSQL.Text := 'select * from KASSA_GET_OTCHET_KASSIRA(''' + day +''', '''+id_sp_kass+''') order by NN';
        DataSetBuh.Open;
        DataSetBuh.FetchAll;

        l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
        year := YearOf(myform.DataSetDay['DAY_KASSA']);
        frxReport1.Variables['year_r']  := year;
        year := year mod 100;
        year_l := IntToStr(year);
        if length(year_l) = 1 then year_l := '0' + year_l;

        month := MonthOf(myform.DataSetDay['DAY_KASSA']);
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

        day_   := DayOf(myform.DataSetDay['DAY_KASSA']);
        day_l := IntToStr(day_);
        if length(day_l) = 1 then day_l := '0' + day_l;

        if cxCheckBoxLastP.Checked then
              begin
                  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_kas_book_2011_last_page.fr3')
              end
              else
              begin
                  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_kas_book_2011.fr3')
              end ;


        if cxCheckBoxNote.Checked then
        begin
             frxReport1.Variables['pr_note']                := QuotedStr(inttostr(1)); //priznac togo chto otchet budet pechatatsya c osnovaniem
        end
        else
        begin
              frxReport1.Variables['pr_note']                := QuotedStr(inttostr(0)); //priznac togo chto otchet budet pechatatsya bez osnovaniya
        end;

        frxReport1.Variables['day_']                := QuotedStr(day_l);
        frxReport1.Variables['month_']              := QuotedStr(month_l);
        frxReport1.Variables['mon']                 := QuotedStr(mon);
        frxReport1.Variables['year_']               := QuotedStr(year_l);
        if year<=9 then frxReport1.Variables['y']   := QuotedStr('0'+IntToStr(year))
        else
        frxReport1.Variables['y']                   := QuotedStr(IntToStr(year));
        frxReport1.Variables['saldo_begin']         := QuotedStr(myform.DataSetDay.fieldByName('SALDO_BEGIN').AsString);
        frxReport1.Variables['kas_book_count_p']    := QuotedStr(inttostr(myform.kas_book_count_page));
        frxReport1.Variables['day_all']             := QuotedStr(l);
        frxReport1.Variables['count_page']          := cxSpinEdit12.value;

        frxReport1.Variables['count_prih']          := QuotedStr(perevod_ukr(myform.DataSetDay.FieldByName('COL_PRIHOD').AsString, false));
        frxReport1.Variables['count_rash']          := QuotedStr(perevod_ukr(myform.DataSetDay.FieldByName('COL_RASHOD').AsString, false));
        frxReport1.Variables['symbol_empty']        := QuotedStr(symbol_empty);
        frxReport1.PrepareReport(true);

          j := frxReport1.Engine.TotalPages;

           if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                    frxReport1.Print;
                end
                else
                begin
                    frxReport1.ShowReport(true);
                end;
            end;


        begin
            T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_UPDATE_DATA);
            T.Show;
            T.UpDate;
            TransactionWr.StartTransaction;
            StoredProcVar2.StoredProcName:='KASSA_UPDATE_PRINT_DAY_KAS_BOOK';
            StoredProcVar2.Prepare;
            StoredProcVar2.ParamByName('D_ID_USER_KAS_BOOK').AsInt64  := myform.myclass.id_user;
            StoredProcVar2.ParamByName('D_DAY').AsDate                := myform.DataSetDay.FieldByname('DAY_KASSA').AsDateTime;
            StoredProcVar2.ParamByName('D_SP_KASSA').AsInt64          := myform.id_kassa;
            StoredProcVar2.ParamByName('D_COUNT_PAGE_KAS_BOOK').AsVariant := j;
            StoredProcVar2.ParamByName('D_LAST_PAGE_KAS_BOOK').AsInteger  := cxSpinEdit12.Value + j - 1;
            StoredProcVar2.ExecProc;
            TransactionWr.Commit;
            T.Free;
        end;
    end;
    if cxCheckBoxFirstPage.checked then
    begin
        day        := myform.DataSetDay.FieldByName('DAY_KASSA').AsString;
        id_sp_kass := myform.DataSetDay.FieldByName('ID_SP_KASS').AsString;
        DataSetBuh.Close;
        DataSetBuh.SQLs.SelectSQL.Text := 'select * from KASSA_GET_OTCHET_KASSIRA(''' + day +''', '''+id_sp_kass+''') order by NN';
        DataSetBuh.Open;
        DataSetBuh.FetchAll;

        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_kas_book_2011_first_page.fr3');
        frxReport1.Variables['year_kas_book']  := cxSpinEdit17.value;

        frxReport1.PrepareReport(true);

           if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                    frxReport1.Print;
                end
                else
                begin
                    frxReport1.ShowReport(true);
                end;
            end;
    end;

end;


procedure TfmPrintFormDay.cxCheckBoxShowClick(Sender: TObject);
begin

    if (cxCheckBoxPrihod_List.Checked) and (cxCheckBoxShow.Checked)
    then begin
        cxSpinEditRihodList.Enabled := false
    end
    else cxSpinEditRihodList.Enabled := true;

    if (cxCheckBoxRashod_List.Checked) and (cxCheckBoxShow.Checked)
    then begin
        cxSpinEditRashodList.Enabled := false
    end
    else cxSpinEditRashodList.Enabled := true;

    if (cxCheckBoxBuh_Otchet.Checked) and (cxCheckBoxShow.Checked)
    then begin
        cxSpinEditBuhOtchet.Enabled := false
    end
    else cxSpinEditBuhOtchet.Enabled := true;

    if (cxCheckBox1.Checked) and (cxCheckBoxShow.Checked)
    then begin
        cxSpinEdit4.Enabled := false
    end
    else cxSpinEdit4.Enabled := true;

    if (cxCheckBox2.Checked) and (cxCheckBoxShow.Checked)
    then begin
        cxSpinEdit6.Enabled := false
    end
    else cxSpinEdit6.Enabled := true;

    if (cxCheckBox5.Checked) and (cxCheckBoxShow.Checked)
    then begin
        cxSpinEdit11.Enabled := false
    end
    else cxSpinEdit11.Enabled := true;

end;

procedure TfmPrintFormDay.cxCheckBoxPrihod_ListClick(Sender: TObject);
begin
    if cxCheckBoxShow.Checked then
    if cxCheckBoxPrihod_List.Checked
    then begin
        cxSpinEditRihodList.Enabled := false
    end
    else cxSpinEditRihodList.Enabled := true;
end;

procedure TfmPrintFormDay.cxCheckBoxRashod_ListClick(Sender: TObject);
begin
    if cxCheckBoxShow.Checked then
    if cxCheckBoxRashod_List.Checked
    then begin
        cxSpinEditRashodList.Enabled := false
    end
    else cxSpinEditRashodList.Enabled := true;
end;

procedure TfmPrintFormDay.cxCheckBoxBuh_OtchetClick(Sender: TObject);
begin
    if cxCheckBoxShow.Checked then
    if cxCheckBoxBuh_Otchet.Checked
    then begin
        cxSpinEditBuhOtchet.Enabled := false
    end
    else cxSpinEditBuhOtchet.Enabled := true;
end;

procedure TfmPrintFormDay.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBoxShow.Checked then
    if cxCheckBox1.Checked
    then begin
        cxSpinEdit4.Enabled := false
    end
    else cxSpinEdit4.Enabled := true;
end;

procedure TfmPrintFormDay.cxCheckBox2Click(Sender: TObject);
begin
    if cxCheckBoxShow.Checked then
    if cxCheckBox2.Checked
    then begin
        cxSpinEdit6.Enabled := false
    end
    else cxSpinEdit6.Enabled := true;
end;

procedure TfmPrintFormDay.cxSpinEditRihodListClick(Sender: TObject);
begin
    cxSpinEditRihodList.Value := cxSpinEditRihodList.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit1Click(Sender: TObject);
begin
    cxSpinEdit1.Value := cxSpinEdit1.Text;
end;

procedure TfmPrintFormDay.cxSpinEditRashodListClick(Sender: TObject);
begin
    cxSpinEditRashodList.Value := cxSpinEditRashodList.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit2Click(Sender: TObject);
begin
    cxSpinEdit2.Value := cxSpinEdit2.Text;
end;

procedure TfmPrintFormDay.cxSpinEditBuhOtchetClick(Sender: TObject);
begin
    cxSpinEditBuhOtchet.Value := cxSpinEditBuhOtchet.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit3Click(Sender: TObject);
begin
    cxSpinEdit3.Value := cxSpinEdit3.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit4Click(Sender: TObject);
begin
    cxSpinEdit4.Value := cxSpinEdit4.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit5Click(Sender: TObject);
begin
    cxSpinEdit5.Value := cxSpinEdit5.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit6Click(Sender: TObject);
begin
    cxSpinEdit6.Value := cxSpinEdit6.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit7Click(Sender: TObject);
begin
    cxSpinEdit7.Value := cxSpinEdit7.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit8Click(Sender: TObject);
begin
    cxSpinEdit8.Value := cxSpinEdit8.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit9Click(Sender: TObject);
begin
    cxSpinEdit9.Value := cxSpinEdit9.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit10Click(Sender: TObject);
begin
    cxSpinEdit10.Value := cxSpinEdit10.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit13Click(Sender: TObject);
begin
    cxSpinEdit13.Value := cxSpinEdit13.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit14Click(Sender: TObject);
begin
    cxSpinEdit14.Value := cxSpinEdit14.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit15Click(Sender: TObject);
begin
    cxSpinEdit15.Value := cxSpinEdit15.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit16Click(Sender: TObject);
begin
    cxSpinEdit16.Value := cxSpinEdit16.Text;
end;



procedure TfmPrintFormDay.cxCheckBoxBookPrihClick(Sender: TObject);
var
    Tfm : TfmKassaFiltrReport;
begin
     Tfm := TfmKassaFiltrReport.Create(self,Database,self);
     Tfm.ShowModal;
     Tfm.Free;
end;

procedure TfmPrintFormDay.cxCheckBox5Click(Sender: TObject);
begin
    if cxCheckBoxShow.Checked then
    if cxCheckBox5.Checked
    then begin
        cxSpinEdit11.Enabled := false
    end
    else cxSpinEdit11.Enabled := true;
end;

procedure TfmPrintFormDay.cxSpinEdit11Click(Sender: TObject);
begin
    cxSpinEdit11.Value := cxSpinEdit11.Text;
end;

procedure TfmPrintFormDay.cxSpinEdit12Click(Sender: TObject);
begin
    cxSpinEdit12.Value := cxSpinEdit12.Text;
end;

end.
