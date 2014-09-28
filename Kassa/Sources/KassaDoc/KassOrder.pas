unit KassOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls, cxMemo,
  cxDropDownEdit, cxMRUEdit, cxMaskEdit, cxCalendar, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, Buttons, ExtCtrls, ActnList, KassaDocMainForm,
  DB, FIBDataSet, pFIBDataSet, KassaDocClass, GlobalSPR, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RxMemDS, Un_R_file_Alex,
  ImgList, cxSplitter, kernel, cxImage, Un_func_file_Alex, cxCurrencyEdit,
  pFIBErrorHandler, fib, ClipBrd, AccMgmt, KassaNich;

type
  TfmOrderMode = (AddOrder, ChangeOrder, ShowOrder);
  TfmOrderAddDog = (SDog, MulitDog, NoDog, DogRJ, OPL_OB, Kv_Pl, Komm, Stud, other_shablon, vedomost, Sdacha_deneg, DogTritiesNew, Sdacha_deneg_new, Sdacha_deneg_new_pkv_fin, Nich);

  TfmKassOrder = class(TForm)
    cxLabel1: TcxLabel;
    cxTextEditNum: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxTextEditAddNum: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxDateEdit2: TcxDateEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxMRUEditFio: TcxMRUEdit;
    cxMemo1: TcxMemo;
    cxLabel7: TcxLabel;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    cxButtonSave: TcxButton;
    cxButtonSaveAll: TcxButton;
    cxButtonClose: TcxButton;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    ActionList1: TActionList;
    Panel2: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    DataSetNumber: TpFIBDataSet;
    DateTimePicker1: TDateTimePicker;
    cxLabel13: TcxLabel;
    cxTextEditSumma: TcxTextEdit;
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
    DataSourceSave: TDataSource;
    DataSourceSaveAll: TDataSource;
    cxGridSaveAllDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridSaveAllDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridSaveAllDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridSaveAllDBTableView1DBColumn6: TcxGridDBColumn;
    cxLabel14: TcxLabel;
    ActionSAVE: TAction;
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
    RxError: TRxMemoryData;
    TabSheet5: TTabSheet;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    DataSetNDS: TpFIBDataSet;
    DataSetFond: TpFIBDataSet;
    ActionShowAll: TAction;
    pFibErrorHandler1: TpFibErrorHandler;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    DataSetForAll: TpFIBDataSet;
    DSet: TpFIBDataSet;
    ActionShowDocPeople: TAction;
    cxButton1: TcxButton;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit6: TcxTextEdit;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    procedure cxTextEditAddNumKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditNumKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure cxMRUEditFioPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditFioExit(Sender: TObject);
    procedure cxGridSaveAllDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure cxGridSaveDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MySave;
    procedure ActionSAVEExecute(Sender: TObject);
    procedure ActionSaveAllExecute(Sender: TObject);
    procedure cxGridSaveAllDBTableView1DblClick(Sender: TObject);
    procedure cxGridSaveDBTableView1DblClick(Sender: TObject);
    procedure RxMemoryDataSaveAllAfterScroll(DataSet: TDataSet);
    function SelectNDS(sum : double; who : integer) : double;
    procedure cxTextEditSummaEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionShowAllExecute(Sender: TObject);
    procedure cxGridSaveAllDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView2DblClick(Sender: TObject);
    procedure ActionShowDocPeopleExecute(Sender: TObject);
  private
    myclass: TMainDocClass;
    flag_close : boolean;
    id_session, id_dog_last, kod_dog_last : int64;
    date_provodka : Tdate;
    SaveAll : boolean;
    NDS : double;
    count_error : integer;
    flag_afterscroll : boolean;
  public
    id_rate, id_rate_n, id_customer : int64;
    myform : TfmKassaDocMainForm;
    flag : TfmOrderMode;
    id_man, id : int64;
    fio_man : string;
    prih : integer;
    buh_prov : integer;
    id_all_doc, id_dog_izvne, kod_dog_izvne, id_payer_izvne, id_doc_add : int64;
    flag_all_doc_change_ok : boolean;
    Owner: TComponent;
    constructor Create(AOwner: TComponent; mclass: TMainDocClass; m : TfmOrderMode; mform : TfmKassaDocMainForm; dog : TfmOrderAddDog); {reintroduce; }overload;
  end;


implementation
uses
//    uTreatiesDM,
    ujbApplication,
    ujbTypes,
    ujbKernel,
    AddChangeProv,
    Un_lo_file_Alex,
    DogLoaderUnit,
    ST_Loader_Unit,
    Math,
    Un_Progress_form,
    DateUtils,
    Un_form_info_doc;

{$R *.dfm}

constructor TfmKassOrder.Create(AOwner: TComponent; mclass: TMainDocClass;
  m: TfmOrderMode; mform: TfmKassaDocMainForm; dog : TfmOrderAddDog);
var
    day, kod_my_sc, {kod_my_kor_sc, kod_my_kekv,} title_my_sc : string;
    {id_al,} id_my_sc{, id_my_kor_sc, id_my_kekv} : int64;
    k, l, itt, i, mont, yea, c, j : integer;
    Current: IjbSendData;
    SmetID, RazdID, StatID, KekvID: int64;
//    StudDogID: int64;
    sum  : double;
    s : currency;
    Res : Variant;
    T : TfmUn_Progress_form;
    y, o : TSpravParams;
    id_type_dog_gos, id_type_dog_kom : int64;
    flag_kom : boolean;
    fltForm1 : TfmKassaNich;
begin
    inherited Create (AOwner);
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.MY_SVERKA_DANNIH);
    T.Show;
    T.Repaint;
    flag_all_doc_change_ok := true;
    Owner            := AOwner;
    flag_afterscroll := false;
    DecimalSeparator := ',';
    myclass          := mclass;
    myform           := mform;
    flag_close       := false;
    id_man           := 0;
    count_error      := 0;
    fio_man          := '';
    flag             := m;
    prih             := myform.prihod;
    id_dog_izvne     := 0;
    kod_dog_izvne    := 0;
    id_payer_izvne   := 0;
    cxSplitter2.CloseSplitter;
    id_dog_last  := 0;
    kod_dog_last := 0;
    if myform.predv_prov = 0 then
    begin
        cxButtonSave.Visible := false;
        ActionSAVE.Enabled   := false;
        ActionSAVE.ShortCut  := VK_F9;
        ActionSaveAll.ShortCut := VK_F10;
        ActionSAVE.Caption     := 'F9 - ' + Un_R_file_Alex.KASSA_DOC_ORDER_SAVE_PRED_PROV;
        ActionSaveAll.Caption  := 'F10 - ' + Un_R_file_Alex.KASSA_DOC_ORDER_SAVE_ALL_PROV;
    end else
    begin
        ActionSAVE.Caption     := 'F10 - ' + Un_R_file_Alex.KASSA_DOC_ORDER_SAVE_PRED_PROV;
        ActionSaveAll.Caption  := 'F9 - ' + Un_R_file_Alex.KASSA_DOC_ORDER_SAVE_ALL_PROV;
        ActionSAVE.ShortCut    := VK_F10;
        ActionSaveAll.ShortCut := VK_F9;
        i                      := 1;
        i := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Ko/Buhg_prov','Belong');
        if (i <> 0) and (flag = AddOrder)  then
        begin
            ActionSaveAll.Enabled   := false;
        end;
    end;

    Class_Database := myclass.Class_Database;
    Class_Transaction_Wr := myclass.Class_Transaction_Wr;

    Class_Transaction_Wr.DefaultDatabase  := Class_Database;
    Class_Database.DefaultTransaction     := myclass.Class_Transaction_R;
    Class_StoredProc.Database             := Class_Database;
    Class_DataSet.Database                := Class_Database;
    Class_DataSet.Transaction             := myclass.Class_Transaction_R;
    DataSetNDS.Database                   := Class_Database;
    DataSetNDS.Transaction                := myclass.Class_Transaction_R;
    ErrorProvsDataSet.Database            := Class_Database;
    DataSetFond.Database                  := Class_Database;
    DataSetFond.Transaction               := myclass.Class_Transaction_R;
    DataSetForAll.Database                := Class_Database;
    DataSetForAll.Transaction             := myclass.Class_Transaction_R;
    DSet.Database                         := Class_Database;
    DSet.Transaction                      := myclass.Class_Transaction_R;

    DataSetNumber.Database                := Class_Database;
    DataSetNumber.Transaction             := myclass.Class_Transaction_R;
//    DataSetNumber.Transaction.StartTransaction;

    DateTimePicker1.DateTime  := StrToDate(myform.cxComboBoxDay.Text);//    DataSetDay.FieldbyName('DAY_KASSA').AsDateTime;
    cxDateEdit2.Date          := StrToDate(myform.cxComboBoxDay.Text); //myform.DataSetDay.FieldbyName('DAY_KASSA').AsDateTime;

    if myform.prihod = 1 then
    begin
        cxGridSaveAllDBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_DEBET;
        cxGridSaveAllDBTableView1DBColumn7.Caption := Un_R_file_Alex.KASSA_SCH_KORESPOND;
        cxLabel1.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_PRIH_KAS_ORD;
        cxLabel6.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_PRINYATO;
    end;
    if myform.prihod = 0 then
    begin
        cxGridSaveAllDBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_KREDIT;
        cxGridSaveAllDBTableView1DBColumn7.Caption := Un_R_file_Alex.KASSA_SCH_KORESPOND;
        cxLabel1.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_RASH_KAS_ORD;
        cxLabel6.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_VIDANO;
    end;
    CAPTION           := Un_R_file_Alex.KASSA_ORDER;
    cxLabel3.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    cxLabel13.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    cxLabel7.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxLabel14.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_SUMMA_ALL;

    cxLabel15.Caption := Un_R_file_Alex.BANK_DOGOVOR;
    cxLabel16.Caption := Un_R_file_Alex.KASSA_RAZD;
    cxLabel17.Caption := Un_R_file_Alex.KASSA_STAT;
    cxLabel18.Caption := Un_R_file_Alex.KASSA_KEKV;

    ActionShowDocPeople.Caption   := 'F12 - ' + Un_R_file_Alex.MY_BUTTON_INFO;
    PageControl1.Pages[0].Caption := Un_R_file_Alex.KASSA_DOC_ORDER_BUHG_PROVODKI;
    PageControl2.Pages[0].Caption := Un_R_file_Alex.KASSA_PROV_SHOW_PROV;

    ActionAdd.Caption    := Un_R_file_Alex.MY_BUTTON_ADD;
    ActionChange.Caption := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionDelete.Caption := Un_R_file_Alex.MY_BUTTON_DELETE;

    cxGridSaveAllDBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_KOD_S_R_S_K;
    cxGridSaveAllDBTableView1DBColumn3.Caption := Un_R_file_Alex.J4_NAME_SMETA;
    cxGridSaveAllDBTableView1DBColumn6.Caption := Un_R_file_Alex.KASSA_SUMMA;
    ActionClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;

    if m = AddOrder then
    begin
        cxLabel12.Visible := false;
        cxLabel12.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_FROM_KLAVA;
        ID_MAN := 0;
        cxLabel8.Visible  := false;
        cxLabel10.Visible := false;
        cxLabel9.Visible  := false;
        cxLabel11.Visible := false;
        day                       := myform.DataSetDay['DAY_KASSA'];
        DataSetNumber.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_GET_NUMBER_KASSA_ORDER('+ IntToStr(myform.id_kassa) +', '+ IntToStr(myform.id_day) +', '''+myform.cxComboBoxDay.Text+''', '+IntToStr(myform.prihod)+')';
        DataSetNumber.Open;
        IF (DataSetNumber['VIXOD_NUM'] = 0) and (DataSetNumber['VIXOD_ADD_NUM'] = 0) then
        begin
            MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_ERROR_ADD_NUMBER), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), 16);
            close;
        end;
        cxTextEditNum.Text    := DataSetNumber['VIXOD_NUM'];
        if DataSetNumber['VIXOD_ADD_NUM'] = 0
            then cxTextEditAddNum.Text :=''
            else cxTextEditAddNum.Text := DataSetNumber['VIXOD_ADD_NUM'];

    end;

    if (m = ChangeOrder) or (m = ShowOrder) then
    begin
      
        id_all_doc := StrToInt64(myform.DataSetMain.FieldByName('ID_ALL_DOC').AsString);
        if id_all_doc <= 0 then
        begin
            ActionSaveAll.Enabled   := false;
        end;

        if id_all_doc > 0 then
        begin
            ActionSAVE.Enabled   := false;
        end;
        PageControl1.ActivePage := TabSheet2;

        fio_man := myform.DataSetMain['FIO'];

        cxTextEditNum.Text    := myform.DataSetMain['NUMBER_DOC'];
        if myform.DataSetMain['ADD_NUMBER_DOC'] = 0
            then cxTextEditAddNum.Text := ''
            else cxTextEditAddNum.Text := myform.DataSetMain['ADD_NUMBER_DOC'];
        cxMRUEditFio.Text     := myform.DataSetMain['FIO'];
        if myform.DataSetMain['ID_MAN'] > 0 then
        begin
             id_man := myform.DataSetMain['ID_MAN'];
             cxLabel12.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_FROM_SP;
             cxLabel8.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_TIN;
             if myform.DataSetMain['FIO_TIN'] <> null
                then cxLabel10.Caption := myform.DataSetMain['FIO_TIN']
                else cxLabel10.Caption := '';
             cxLabel9.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_BIRTHDAY;
             if myform.DataSetMain['FIO_BIRTHDAY'] <> null
                then cxLabel11.Caption := myform.DataSetMain['FIO_BIRTHDAY']
                else cxLabel11.Caption := '';
             try cxLabel20.Caption := myform.DataSetMain.FieldByName('TN').AsString; except cxLabel20.Caption := ''; end;
        end else
        begin
            cxLabel12.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_FROM_KLAVA;
            cxLabel8.Visible  := false;
            cxLabel10.Visible := false;
            cxLabel9.Visible  := false;
            cxLabel11.Visible := false;
            cxLabel20.Visible := false;
        end;
        cxTextEditSumma.Text := myform.DataSetMain['SUMMA_DOC'];
        
        cxMemo1.Text := myform.DataSetMain['OSNOVANIE'];

        DataSetChangeProv.Database    := Class_Database;
        DataSetChangeProv.Transaction := myclass.Class_Transaction_R;
        DataSetChangeProv.Transaction.StartTransaction;
        DataSetChangeProv.close;

        id := StrToInt64(myform.DataSetMain.FieldByName('ID_DT_DOC').AsString);

        DataSetChangeProv.Close;
        DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_DT_DOC where ID_DT_DOC='+IntToStr(id);
        DataSetChangeProv.Open;

        cxTextEdit5.Text      := DataSetChangeProv.fbn('SERIYA').AsString;
        cxTextEdit6.Text      := DataSetChangeProv.fbn('NOMER_SERII').AsString;

        DataSetChangeProv.Close;
        DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_PROV('+IntToStr(id_all_doc)+', '+IntToStr(myform.prihod)+')';
        DataSetChangeProv.Open;
        DataSetChangeProv.First;
        itt := 1;
        while not DataSetChangeProv.Eof do
        begin
            if DataSetChangeProv.FieldByName('RATE_ACC_NATIVE').AsVariant <> null
                then id_rate_n   := StrToInt64(DataSetChangeProv.FieldByName('RATE_ACC_NATIVE').AsString)
                else id_rate_n   := 0;
            if DataSetChangeProv.FieldByName('RATE_ACC').AsVariant <> null
                then id_rate     := StrToInt64(DataSetChangeProv.FieldByName('RATE_ACC').AsString)
                else id_rate     := 0;
            if DataSetChangeProv.FieldByName('ID_CUSTOMER').AsVariant <> null
                then id_customer := StrToInt64(DataSetChangeProv.FieldByName('ID_CUSTOMER').AsString)
                else id_customer := 0;
            RxMemoryDataSaveAll.Open;
            RxMemoryDataSaveAll.Insert;
//            RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
//            RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DT_DOC'];
            RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := DataSetChangeProv['SUMMA'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := DataSetChangeProv['ID_SM'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := DataSetChangeProv['ID_RAZD'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := DataSetChangeProv['ID_ST'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := DataSetChangeProv['ID_KEKV'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := DataSetChangeProv['ID_DOG'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := DataSetChangeProv['KOD_DOG'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := DataSetChangeProv['ID_MAN'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := DataSetChangeProv['ID_SCH'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := DataSetChangeProv['SUMMA_VALUE'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := DataSetChangeProv['ID_VALUE'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := DataSetChangeProv['SCH_NUMBER'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := DataSetChangeProv['STAT_KOD'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := DataSetChangeProv['RAZD_NUM'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := DataSetChangeProv['SMETA_KOD'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := DataSetChangeProv['KEKV_KOD'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := DataSetChangeProv['ID_KASS_SH'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := DataSetChangeProv['SCH_KASS_NUMBER'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value   := StrToInt64(DataSetChangeProv.fieldByName('ID_ALL_PROV').AsString);
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := DataSetChangeProv.FieldByName('TITLE_SM').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := DataSetChangeProv.FieldByName('TITLE_RZ').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := DataSetChangeProv.FieldByName('TITLE_ST').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := DataSetChangeProv.FieldByName('TITLE_KEKV').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := DataSetChangeProv.FieldByName('date_dog').AsDateTime;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := DataSetChangeProv.FieldByName('NUM_DOG').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := DataSetChangeProv.FieldByName('title_sch').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetChangeProv.FieldByName('title_kor_sch').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := DataSetChangeProv.FieldByName('NAME_CUST').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := DataSetChangeProv.FieldByName('SMETA_KOD').AsString + '\' + DataSetChangeProv.FieldByName('RAZD_NUM').AsString + '\' + DataSetChangeProv.FieldByName('STAT_KOD').AsString + '\' + DataSetChangeProv.FieldByName('KEKV_KOD').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldType_Dog').Value      := DataSetChangeProv.FieldByName('TYPE_DOG').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldReg_Dog').Value       := DataSetChangeProv.FieldByName('REG_DOG').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value      := StrToInt64(DataSetChangeProv.FieldByName('ID_PAYER').AsString);
            RxMemoryDataSaveAll.FieldByName('id').Value                                    := itt;
            inc(itt);
            RxMemoryDataSaveAll.Post;
            DataSetChangeProv.Next;
        end;
        if DataSetChangeProv.RecordCount = 0 then
        begin
            DataSetChangeProv.Close;
            DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_MY_PROV('+IntToStr(id)+')';
            DataSetChangeProv.Open;
            itt := 1;
            while not DataSetChangeProv.Eof do
            begin
                RxMemoryDataSaveAll.Open;
                RxMemoryDataSaveAll.Insert;
//            RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
//            RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DT_DOC'];
                RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := DataSetChangeProv['SUMMA'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := DataSetChangeProv['ID_SM'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := DataSetChangeProv['ID_RAZD'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := DataSetChangeProv['ID_ST'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := DataSetChangeProv['ID_KEKV'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := DataSetChangeProv['ID_DOG'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := DataSetChangeProv['KOD_DOG'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := DataSetChangeProv['ID_MAN'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := DataSetChangeProv['ID_SCH'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := DataSetChangeProv['SUMMA_VALUE'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := DataSetChangeProv['ID_VALUE'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := DataSetChangeProv['SCH_NUMBER'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := DataSetChangeProv['STAT_KOD'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := DataSetChangeProv['RAZD_NUM'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := DataSetChangeProv['SMETA_KOD'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := DataSetChangeProv['KEKV_KOD'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := DataSetChangeProv['ID_KASS_SH'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := DataSetChangeProv['SCH_KASS_NUMBER'];
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := DataSetChangeProv.FieldByName('TITLE_SM').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := DataSetChangeProv.FieldByName('TITLE_RZ').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := DataSetChangeProv.FieldByName('TITLE_ST').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := DataSetChangeProv.FieldByName('TITLE_KEKV').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := DataSetChangeProv.FieldByName('date_dog').AsDateTime;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := DataSetChangeProv.FieldByName('NUM_DOG').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := DataSetChangeProv.FieldByName('title_sch').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetChangeProv.FieldByName('title_kor_sch').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := DataSetChangeProv.FieldByName('NAME_CUST').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := DataSetChangeProv.FieldByName('SMETA_KOD').AsString + '\' + DataSetChangeProv.FieldByName('RAZD_NUM').AsString + '\' + DataSetChangeProv.FieldByName('STAT_KOD').AsString + '\' + DataSetChangeProv.FieldByName('KEKV_KOD').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldType_Dog').Value      := DataSetChangeProv.FieldByName('TYPE_DOG').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldReg_Dog').Value       := DataSetChangeProv.FieldByName('REG_NUM').AsString;
                RxMemoryDataSaveAll.FieldByName('id').Value                                    := itt;
                inc(itt);
                RxMemoryDataSaveAll.Post;
                DataSetChangeProv.Next;
            end;
        end;
        DataSetChangeProv.Close;
    end;

    if m = ShowOrder then
    begin
         cxButtonSave.Enabled     := false;
         cxButtonSaveAll.Enabled  := false;
         cxTextEditNum.Enabled    := false;
         cxTextEditAddNum.Enabled := false;
         DateTimePicker1.Enabled  := false;
         cxMRUEditFio.Enabled     := false;
         cxMemo1.Enabled          := false;
         cxTextEditSumma.Enabled  := false;
    end;

    // договора
    if dog = SDog then
    begin
      id_my_sc := -1;
      RxMemoryDataSaveAll.EmptyTable;
      Class_DataSet.Close;
      Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(myform.id_kassa)+') ';
      Class_DataSet.Open;
      Class_DataSet.First;
      while not Class_DataSet.Eof do
      begin
          if Class_DataSet['FLAG_DEFAULT'] = 1 then
          begin
                  id_my_sc    := Class_DataSet['ID_SCH'];
                  kod_my_sc   := Class_DataSet['SCH_NUM'];
                  title_my_sc := Class_DataSet['SCH_TITLE'];
          end;
          Class_DataSet.Next;
      end;
      l := Length(myform.dogparam.Smets);
      cxMRUEditFio.Text := myform.dogparam.name_customer;
      cxMemo1.Text := Un_R_file_Alex.KASSA_SOGL_DOG + ' ' + vARtOsTR(myform.dogparam.n_dog) + ' ' + Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' + vARtOsTR(myform.dogparam.d_dog) + ' (' + Un_R_file_Alex.KASSA_REG_NUM + ' ' + vARtOsTR(myform.dogparam.regest_num) +')';

      id_dog_last  := myform.dogparam.id_dog;
      kod_dog_last := myform.dogparam.kod_dog;

      for k := 0 to l-1 do
      begin
        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('+IntToStr(myform.dogparam.smets[k].NumSmeta)+', '+IntToStr(myform.dogparam.smets[k].NumRazd)+', '+IntToStr(myform.dogparam.smets[k].NumStat)+', '+IntToStr(myform.dogparam.smets[k].NumKekv)+')';
        Class_DataSet.Open;

        RxMemoryDataSaveAll.Open;
        RxMemoryDataSaveAll.Insert;
//        RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
//        RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DT_DOC'];
        RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := myform.dogparam.Smets[k].NSumma;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_SMETA')).AsInt64;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_RAZD')).AsInt64;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_STATE')).AsInt64;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_KEKV')).AsInt64;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := myform.dogparam.id_dog;
        RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := myform.dogparam.kod_dog;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := Class_DataSet.FieldByName('SM_TITLE').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := Class_DataSet.FieldByName('ST_TITLE').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := myform.dogparam.d_dog;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := myform.dogparam.n_dog;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_my_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := myform.dogparam.name_customer;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := Class_DataSet.FieldByName('SM_KOD').AsString + '\' + Class_DataSet.FieldByName('RAZ_KOD').AsString + '\' + Class_DataSet.FieldByName('ST_KOD').AsString + '\' + Class_DataSet.FieldByName('KEKV_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
        RxMemoryDataSaveAll.FieldByName('id').Value                  := k+1;
        try id_rate     := myform.dogparam.id_rate_acc     except id_rate     := 0; end;
        try id_rate_n   := myform.dogparam.id_rate_acc_nat except id_rate_n   := 0; end;
        try id_customer := myform.dogparam.id_customer     except id_customer := 0; end;

        try RxMemoryDataSaveAll.FieldByName('id_ras_native').Value       := myform.dogparam.id_rate_acc_nat except RxMemoryDataSaveAll.FieldByName('id_ras_native').Value   := 0; end;
        try RxMemoryDataSaveAll.FieldByName('id_ras_customer').Value     := myform.dogparam.id_rate_acc     except RxMemoryDataSaveAll.FieldByName('id_ras_customer').Value := 0; end;
        try RxMemoryDataSaveAll.FieldByName('id_customer').Value         := myform.dogparam.id_customer     except RxMemoryDataSaveAll.FieldByName('id_customer').Value     := 0; end;
        if (myform.dogparam.id_bl_account > 0) then
        begin
            DataSetForAll.Close;
            DataSetForAll.SQLs.SelectSQL.Text := 'SELECT * from PUB_SP_MAIN_SCH_INFO('''+cxDateEdit2.Text+''', '+VarToStr(myform.dogparam.id_bl_account)+')';
            DataSetForAll.Open;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetForAll.FieldByName('SCH_TITLE').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := myform.dogparam.id_bl_account;
            RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := DataSetForAll.FieldByName('SCH_NUMBER').AsString;
            DataSetForAll.Close;
        end else
        begin
            if mform.flag_def_f = 1 then
            begin
                 DataSetFond.Close;
                 DataSetFond.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit2.Text+''')';
                 DataSetFond.Open;
                 if DataSetFond['RESULT'] = 1 then
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetFond['FOND_TITLE'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := DataSetFond['ID_FOND'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := DataSetFond['FOND_NUM'];
                 end else
                 begin
                     if mform.id_sch > 0 then
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                         RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                         RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
                     end else
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                         RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                         RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := '';
                     end;
                end;
                DataSetFond.Close;
            end else
            begin
                if mform.id_sch > 0 then
                begin
                    RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                    RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                    RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
                end else
                begin
                    RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                    RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                    RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := '';
                end;
            end;
        end;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_my_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := kod_my_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
        RxMemoryDataSaveAll.Post;
        Class_DataSet.Close;
      end;
    end;
    //T.Free;

    if Dog = Nich then
    begin
      id_my_sc := -1;
      RxMemoryDataSaveAll.EmptyTable;
      Class_DataSet.Close;
      Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(myform.id_kassa)+') ';
      Class_DataSet.Open;
      Class_DataSet.First;
      while not Class_DataSet.Eof do
      begin
          if Class_DataSet['FLAG_DEFAULT'] = 1 then
          begin
                  id_my_sc    := Class_DataSet['ID_SCH'];
                  kod_my_sc   := Class_DataSet['SCH_NUM'];
                  title_my_sc := Class_DataSet['SCH_TITLE'];
          end;
          Class_DataSet.Next;
      end;
      //l := Length(myform.dogparam.Smets);

      id_dog_last  := myform.dogparam.id_dog;
      kod_dog_last := myform.dogparam.kod_dog;
      fltForm1:= TfmKassaNich.Create(AOwner, Class_Database, CurrToStr(s), prih, myclass.id_user, cxDateEdit2.date);
      fltForm1.ShowModal;
      for j:=0 to fltForm1.cxParamGridTableView1.DataController.RecordCount - 1 do begin
        fltForm1.cxParamGridTableView1.DataController.FocusedRecordIndex:=j;
        for i:=0 to fltForm1.cxResultGridDBTableView1.DataController.RecordCount - 1 do
        begin
          RxMemoryDataSaveAll.Open;
          RxMemoryDataSaveAll.Insert;
          // RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
          // RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DT_DOC'];
          RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := fltForm1.cxResultGridDBTableView1DBColumn4.DataBinding.DataController.Values[i, 3];
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 5];
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 1];
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 6];
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 10];
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := fltForm1.id_dog;
          RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := fltForm1.id_dog;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := fltForm1.cxResultGridDBTableView1DBColumn5.DataBinding.DataController.Values[i, 4];
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := fltForm1.cxResultGridDBTableView1DBColumn5.DataBinding.DataController.Values[i, 9];
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := fltForm1.cxResultGridDBTableView1DBColumn5.DataBinding.DataController.Values[i, 7];
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := fltForm1.cxResultGridDBTableView1DBColumn5.DataBinding.DataController.Values[i, 12];
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := StrToDate(fltForm1.d_dog);
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := fltForm1.n_dog;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := fltForm1.name_cust;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := fltForm1.cxResultGridDBTableView1DBColumn1.DataBinding.DataController.Values[i, 0] +'\'+ fltForm1.cxResultGridDBTableView1DBColumn9.DataBinding.DataController.Values[i, 8] +'\'+ fltForm1.cxResultGridDBTableView1DBColumn3.DataBinding.DataController.Values[i, 2] +'\'+fltForm1.cxResultGridDBTableView1DBColumn12.DataBinding.DataController.Values[i, 11];
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
          RxMemoryDataSaveAll.FieldByName('id').Value                  := k+1;
          try id_rate     := myform.dogparam.id_rate_acc     except id_rate     := 0; end;
          try id_rate_n   := myform.dogparam.id_rate_acc_nat except id_rate_n   := 0; end;
          try id_customer := myform.dogparam.id_customer     except id_customer := 0; end;

          try RxMemoryDataSaveAll.FieldByName('id_ras_native').Value       := myform.dogparam.id_rate_acc_nat except RxMemoryDataSaveAll.FieldByName('id_ras_native').Value   := 0; end;
          try RxMemoryDataSaveAll.FieldByName('id_ras_customer').Value     := myform.dogparam.id_rate_acc     except RxMemoryDataSaveAll.FieldByName('id_ras_customer').Value := 0; end;
          try RxMemoryDataSaveAll.FieldByName('id_customer').Value         := myform.dogparam.id_customer     except RxMemoryDataSaveAll.FieldByName('id_customer').Value     := 0; end;
          if (myform.dogparam.id_bl_account > 0) then
          begin
              DataSetForAll.Close;
              DataSetForAll.SQLs.SelectSQL.Text := 'SELECT * from PUB_SP_MAIN_SCH_INFO('''+cxDateEdit2.Text+''', '+VarToStr(myform.dogparam.id_bl_account)+')';
              DataSetForAll.Open;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetForAll.FieldByName('SCH_TITLE').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := myform.dogparam.id_bl_account;
              RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := DataSetForAll.FieldByName('SCH_NUMBER').AsString;
              DataSetForAll.Close;
          end else
          begin
              if mform.flag_def_f = 1 then
              begin
                   DataSetFond.Close;
                   DataSetFond.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+VarToStr(fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 5])+''', '''+VarToStr(fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 1])+''', '''+cxDateEdit2.Text+''')';
                   DataSetFond.Open;
                   if DataSetFond['RESULT'] = 1 then
                   begin
                       RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetFond['FOND_TITLE'];
                       RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := DataSetFond['ID_FOND'];
                       RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := DataSetFond['FOND_NUM'];
                   end else
                   begin
                       if mform.id_sch > 0 then
                       begin
                           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                           RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                           RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
                       end else
                       begin
                           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                           RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                           RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := '';
                       end;
                  end;
                  DataSetFond.Close;
              end else
              begin
                  if mform.id_sch > 0 then
                  begin
                      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                      RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                      RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
                  end else
                  begin
                      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                      RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                      RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := '';
                  end;
              end;
          end;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := kod_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := VarToStr(fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 2]);
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := VarToStr(fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 8]);
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := VarToStr(fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 0]);
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := VarToStr(fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 11]);
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
          RxMemoryDataSaveAll.Post;
          Class_DataSet.Close;
          {id_ss := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
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
          RxMemoryDataDog.Post; }
      end;
     end;
      //fltForm1.Close;
      cxMRUEditFio.Text := fltForm1.name_cust;
      cxMemo1.Text := Un_R_file_Alex.KASSA_SOGL_DOG + vARtOsTR(fltForm1.n_dog) + ' ' + Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' + vARtOsTR(fltForm1.d_dog) + ' (' + Un_R_file_Alex.KASSA_REG_NUM + vARtOsTR(fltForm1.reg_dog) +')';
      cxTextEditSumma.Text := FloatToStr(fltForm1.s);
    end;
    //T.Free;

    if Dog = DogRJ then
    begin
        RxMemoryDataSaveAll.EmptyTable;
         //Инициализируем коннект к базе
        LoadJiBiApplication(Class_Database.Handle);
        //Загружаем реестр
        if (JiBiKernel.Load('DFSRegisrty.bpl', TjbLoadData.Create(Self, retSingle)) <> nil)
        then begin
//          JiBiKernel.LoadFullResult.ShowDump;
          WITH JiBiKernel.LoadFullResult.Dims['DOG_INFO'] DO
          BEGIN
              cxMemo1.Text := 'За обуч. ' + Values['FACULTY_SHORT_NAME'] + ' ' + Values['FORM_STUDY_SHORT_NAME'] + ' (№ дог. ' + Values['NUM_DOG'] + ' от ' + Values['DATE_DOG'] +') ' + Values['STUD_FIO'];
              cxMRUEditFio.Text := Values['PAYER_NAME'];
          END;
      Class_DataSet.Close;
      Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(myform.id_kassa)+') ';
      Class_DataSet.Open;
      Class_DataSet.First;
      while not Class_DataSet.Eof do
      begin
          if Class_DataSet['FLAG_DEFAULT'] = 1 then
          begin
                  id_my_sc    := Class_DataSet['ID_SCH'];
                  kod_my_sc   := Class_DataSet['SCH_NUM'];
                  title_my_sc := Class_DataSet['SCH_TITLE'];
          end;
          Class_DataSet.Next;
      end;
          i := 0;
          sum := 0;    
          //JiBiApp.LoadFullResult - содержит результат
          //Проходимся по всему множеству источников финансирования и забираем данные
          id_dog_last  := JiBiKernel.LoadFullResult.Dims['DOG_INFO'].Values['ID_STUD_DOG'];
          kod_dog_last := JiBiKernel.LoadFullResult.Dims['DOG_INFO'].Values['KOD_DOG'];
          while JiBiKernel.LoadFullResult.Has(i) do
          begin
              Current := JiBiKernel.LoadFullResult.Dims[i];
              SmetID := Current.Values['ID_SMET'];
              RazdID := Current.Values['ID_RAZD'];
              StatID := Current.Values['ID_STAT'];
              Class_DataSet.Close;
              Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_INI';
              Class_DataSet.Open;
              KekvID := StrToInt64(Class_DataSet.FBN('ID_KEKV_FOR_OLD_TRIT').AsString);//Current.Values['ID_KEKV'];
              sum := sum + Current.Values['SUMMA'];
              Class_DataSet.Close;
              Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('+IntToStr(SmetID)+', '+IntToStr(RazdID)+', '+IntToStr(StatID)+', '+IntToStr(KekvID)+')';
              Class_DataSet.Open;
              cxTextEditSumma.Text := FloatToStr(myform.dogparam.Summa);

              RxMemoryDataSaveAll.Open;
              RxMemoryDataSaveAll.Insert;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value      := JiBiKernel.LoadFullResult.Dims['DOG_INFO'].Values['ID_PAYER'];
              RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := Current.Values['SUMMA'];
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_SMETA')).AsInt64;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_RAZD')).AsInt64;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_STATE')).AsInt64;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_KEKV')).AsInt64;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := JiBiKernel.LoadFullResult.Dims['DOG_INFO'].Values['ID_STUD_DOG'];
              RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := JiBiKernel.LoadFullResult.Dims['DOG_INFO'].Values['KOD_DOG'];
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := Class_DataSet.FieldByName('SM_TITLE').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := Class_DataSet.FieldByName('ST_TITLE').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := null;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := null;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_my_sc;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := null;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := Class_DataSet.FieldByName('SM_KOD').AsString + '\' + Class_DataSet.FieldByName('RAZ_KOD').AsString + '\' + Class_DataSet.FieldByName('ST_KOD').AsString + '\' + Class_DataSet.FieldByName('KEKV_KOD').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
              RxMemoryDataSaveAll.FieldByName('id').Value                  := i+1;
              if mform.flag_def_f = 1 then
              begin
                   DataSetFond.Close;
                   DataSetFond.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit2.Text+''')';
                   DataSetFond.Open;
                   if DataSetFond['RESULT'] = 1 then
                   begin
                       RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetFond['FOND_TITLE'];
                       RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := DataSetFond['ID_FOND'];
                       RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := DataSetFond['FOND_NUM'];
                   end else
                   begin
                       if mform.id_sch > 0 then
                           begin
                               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                               RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                               RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
                           end else
                           begin
                               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                               RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                               RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := '';
                           end;
                   DataSetFond.Close;
                   end
              end else
                  if mform.id_sch > 0 then
                  begin
                      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                      RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                      RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
                  end else
                  begin
                      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                      RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                      RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := '';
                  end;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_my_sc;
              RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
              RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := kod_my_sc;
              RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_KOD').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_KOD').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_KOD').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_KOD').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
              RxMemoryDataSaveAll.Post;
              Class_DataSet.Close;
              inc(i);
           end;
           if i = 0 then
           begin
               Class_DataSet.Close;
               Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_INI';
               Class_DataSet.Open;
               KekvID := StrToInt64(Class_DataSet.FBN('ID_KEKV_FOR_OLD_TRIT').AsString);//Current.Values['ID_KEKV'];
               Class_DataSet.Close;
               Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('+IntToStr(SmetID)+', '+IntToStr(RazdID)+', '+IntToStr(StatID)+', '+IntToStr(KekvID)+')';
               Class_DataSet.Open;
               cxTextEditSumma.Text := FloatToStr(myform.dogparam.Summa);

               RxMemoryDataSaveAll.Open;
               RxMemoryDataSaveAll.Insert;
               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value      := JiBiKernel.LoadFullResult.Dims['DOG_INFO'].Values['ID_PAYER'];
               RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := myform.dogparam.Summa;
//               RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_SMETA')).AsInt64;
//               RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_RAZD')).AsInt64;
//               RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_STATE')).AsInt64;
               RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_KEKV')).AsInt64;
               RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := JiBiKernel.LoadFullResult.Dims['DOG_INFO'].Values['ID_STUD_DOG'];
               RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := JiBiKernel.LoadFullResult.Dims['DOG_INFO'].Values['KOD_DOG'];
//               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := Class_DataSet.FieldByName('SM_TITLE').AsString;
//               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
//               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := Class_DataSet.FieldByName('ST_TITLE').AsString;
               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := null;
               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := null;
               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_my_sc;
               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := null;
               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := '0\0\0\' + Class_DataSet.FieldByName('KEKV_KOD').AsString;
               RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
               RxMemoryDataSaveAll.FieldByName('id').Value                  := i+1;
               if mform.id_sch > 0 then
               begin
                   RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                   RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                   RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
               end else
               begin
                   RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                   RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                   RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := '';
               end;
               RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_my_sc;
               RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
               RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
               RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := kod_my_sc;
//               RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_KOD').AsString;
//               RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_KOD').AsString;
//               RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_KOD').AsString;
               RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_KOD').AsString;
               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
               RxMemoryDataSaveAll.Post;
               Class_DataSet.Close;
           end;
           cxTextEditSumma.Text := FloatToStr(sum);
       end;
       Class_DataSet.Close;
    end;

    if Dog = OPL_OB then
    begin
        RxMemoryDataSaveAll.EmptyTable;
        cxMRUEditFioPropertiesButtonClick(Self);
        cxMemo1.Text := Un_R_file_Alex.KASSA_OSNOVANIE_ZA_REGISTR;
        Class_DataSet.Close;
        Class_DataSet.Sqls.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
        Class_DataSet.Open;
        NDS := Class_DataSet.FieldByname('NDS').AsFloat;
        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(myform.id_kassa)+') ';
        Class_DataSet.Open;
        Class_DataSet.First;
        while not Class_DataSet.Eof do
        begin
            if Class_DataSet['FLAG_DEFAULT'] = 1 then
            begin
                id_my_sc    := Class_DataSet['ID_SCH'];
                kod_my_sc   := Class_DataSet['SCH_NUM'];
                title_my_sc := Class_DataSet['SCH_TITLE'];
            end;
            Class_DataSet.Next;
        end;
        DataSetNumber.Close;
        DataSetNumber.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SP_OPERATION WHERE KASSA_SP_OPERATION.KOD_OPERATION='+IntToStr(myform.kodShab)+'';
        DataSetNumber.Open;
        DataSetNumber.FetchAll;
        l := DataSetNumber.RecordCount;
        for k := 0 to l-1 do
        begin
          Class_DataSet.Close;
          Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('''+DataSetNumber.FieldByName('ID_SM').AsString+''', '''+DataSetNumber.FieldByName('ID_RAZD').AsString+''', '''+DataSetNumber.FieldByName('ID_ST').AsString+''', '''+DataSetNumber.FieldByName('ID_KEKV').AsString+''')';
          Class_DataSet.Open;
          cxTextEditSumma.Text := FloatToStr(myform.dogparam.Summa);

          RxMemoryDataSaveAll.Open;
          RxMemoryDataSaveAll.Insert;
//          RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
//         RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DT_DOC'];
          RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := SelectNDS(myform.dogparam.Summa,k+1);
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_SMETA')).AsInt64;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_RAZD')).AsInt64;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_STATE')).AsInt64;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_KEKV')).AsInt64;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := null;
          RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := null;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := Class_DataSet.FieldByName('SM_TITLE').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := Class_DataSet.FieldByName('ST_TITLE').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := null;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := null;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := null;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := Class_DataSet.FieldByName('SM_KOD').AsString + '\' + Class_DataSet.FieldByName('RAZ_KOD').AsString + '\' + Class_DataSet.FieldByName('ST_KOD').AsString + '\' + Class_DataSet.FieldByName('KEKV_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
          RxMemoryDataSaveAll.FieldByName('id').Value                  := k+1;
          if mform.flag_def_f = 1 then
          begin
               DataSetFond.Close;
               DataSetFond.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit2.Text+''')';
               DataSetFond.Open;
               if DataSetFond['RESULT'] = 1 then
               begin
                   RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetFond['FOND_TITLE'];
                   RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := DataSetFond['ID_FOND'];
                   RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := DataSetFond['FOND_NUM'];
               end else
               begin
                   if mform.id_sch > 0 then
                       begin
                           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                           RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                           RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
                       end else
                       begin
                           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                           RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                           RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := '';
                       end;
               DataSetFond.Close;
              end
          end else
              if mform.id_sch > 0 then
              begin
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
              end else
              begin
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                  RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := '';
              end;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := kod_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
          RxMemoryDataSaveAll.Post;
          Class_DataSet.Close;
          DataSetNumber.Next;
        end;
     end;

     if Dog = Kv_Pl then
     begin
//        cxMRUEditFioPropertiesButtonClick(Self);
        RxMemoryDataSaveAll.EmptyTable;
        cxMemo1.Text := Un_R_file_Alex.KASSA_OSNOVANIE_KVARTPLATA;
        Class_DataSet.Close;
        Class_DataSet.Sqls.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
        Class_DataSet.Open;
        NDS := Class_DataSet.FieldByname('NDS').AsFloat;
        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(myform.id_kassa)+') ';
        Class_DataSet.Open;
        Class_DataSet.First;
        while not Class_DataSet.Eof do
        begin
            if Class_DataSet['FLAG_DEFAULT'] = 1 then
            begin
                id_my_sc    := Class_DataSet['ID_SCH'];
                kod_my_sc   := Class_DataSet['SCH_NUM'];
                title_my_sc := Class_DataSet['SCH_TITLE'];
            end;
            Class_DataSet.Next;
        end;
        DataSetNumber.Close;
        DataSetNumber.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SP_OPERATION WHERE KASSA_SP_OPERATION.KOD_OPERATION='+IntToStr(myform.kodShab)+'';
        DataSetNumber.Open;
        DataSetNumber.FetchAll;
        l := DataSetNumber.RecordCount;
        for k := 0 to l-1 do
        begin
           Class_DataSet.Close;
           Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('''+DataSetNumber.FieldByName('ID_SM').AsString+''', '''+DataSetNumber.FieldByName('ID_RAZD').AsString+''', '''+DataSetNumber.FieldByName('ID_ST').AsString+''', '''+DataSetNumber.FieldByName('ID_KEKV').AsString+''')';
           Class_DataSet.Open;
           cxTextEditSumma.Text := FloatToStr(myform.dogparam.Summa);

          RxMemoryDataSaveAll.Open;
          RxMemoryDataSaveAll.Insert;
//          RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
//         RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DT_DOC'];
          RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := SelectNDS(myform.dogparam.Summa,k+1);
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_SMETA')).AsInt64;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_RAZD')).AsInt64;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_STATE')).AsInt64;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_KEKV')).AsInt64;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := null;
          RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := null;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := Class_DataSet.FieldByName('SM_TITLE').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := Class_DataSet.FieldByName('ST_TITLE').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := null;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := null;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := null;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := Class_DataSet.FieldByName('SM_KOD').AsString + '\' + Class_DataSet.FieldByName('RAZ_KOD').AsString + '\' + Class_DataSet.FieldByName('ST_KOD').AsString + '\' + Class_DataSet.FieldByName('KEKV_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
          RxMemoryDataSaveAll.FieldByName('id').Value                  := k+1;
          if mform.flag_def_f = 1 then
          begin
               DataSetFond.Close;
               DataSetFond.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit2.Text+''')';
               DataSetFond.Open;
               if DataSetFond['RESULT'] = 1 then
               begin
                   RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetFond['FOND_TITLE'];
                   RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := DataSetFond['ID_FOND'];
                   RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := DataSetFond['FOND_NUM'];
               end else
               begin
                   if mform.id_sch > 0 then
                       begin
                           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                           RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                           RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
                       end else
                       begin
                           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                           RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                           RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := '';
                       end;
               DataSetFond.Close;
              end
          end else
              if mform.id_sch > 0 then
              begin
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
              end else
              begin
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                  RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := '';
              end;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := kod_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
          RxMemoryDataSaveAll.Post;
          Class_DataSet.Close;
          DataSetNumber.Next;
        end;
     end;

     if Dog = Komm then {коммандировка}
     begin
      RxMemoryDataSaveAll.EmptyTable;
      Class_DataSet.Close;
      Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(myform.id_kassa)+') ';
      Class_DataSet.Open;
      Class_DataSet.First;
      while not Class_DataSet.Eof do
      begin
          if Class_DataSet['FLAG_DEFAULT'] = 1 then
          begin
                  id_my_sc    := Class_DataSet['ID_SCH'];
                  kod_my_sc   := Class_DataSet['SCH_NUM'];
                  title_my_sc := Class_DataSet['SCH_TITLE'];
          end;
          Class_DataSet.Next;
      end;
      l := Length(myform.dogparam.Smets);
//      showmessage(vartostr(myform.dogparam.sum_today));
      Class_DataSet.Close;
      Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_MAN_INFO('+VarToStr(myform.dogparam.sum_today{myform.dogparam.smets[0].id_people})+', '''+DateToStr(date)+''')';
      Class_DataSet.Open;
      cxMRUEditFio.Text := Class_DataSet.FieldByName('UKR_FAMILIA').AsString + ' ' + Class_DataSet.FieldByName('UKR_IMYA').AsString + ' ' + Class_DataSet.FieldByName('UKR_OTCHESTVO').AsString;
      fio_man           := cxMRUEditFio.Text;
      cxLabel10.Caption := Class_DataSet.FieldByName('TIN').AsString;
      cxLabel11.Caption := Class_DataSet.FieldByName('BIRTH_DATE').AsString;
//      cxMemo1.Text := Un_R_file_Alex.KASSA_SOGL_DOG + ' ' + vARtOsTR(myform.dogparam.n_dog) + ' ' + Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' + vARtOsTR(myform.dogparam.d_dog) + ' (' + Un_R_file_Alex.KASSA_REG_NUM + ' ' + vARtOsTR(myform.dogparam.regest_num) +')';
      cxMemo1.Text := myform.DogParam.dog_note;
      for k := 0 to l-1 do
      begin
        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('+IntToStr(myform.dogparam.smets[k].NumSmeta)+', '+IntToStr(myform.dogparam.smets[k].NumRazd)+', '+IntToStr(myform.dogparam.smets[k].NumStat)+', '+IntToStr(myform.dogparam.smets[k].NumKekv)+')';
        Class_DataSet.Open;
        RxMemoryDataSaveAll.Open;
        RxMemoryDataSaveAll.Insert;
//        RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
//        RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DT_DOC'];
        RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := myform.dogparam.Smets[k].NSumma;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_SMETA')).AsInt64;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_RAZD')).AsInt64;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_STATE')).AsInt64;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_KEKV')).AsInt64;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := myform.dogparam.id_dog;
        RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := myform.dogparam.kod_dog;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := Class_DataSet.FieldByName('SM_TITLE').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := Class_DataSet.FieldByName('ST_TITLE').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := myform.dogparam.d_dog;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := myform.dogparam.n_dog;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_my_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := myform.dogparam.name_customer;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := Class_DataSet.FieldByName('SM_KOD').AsString + '\' + Class_DataSet.FieldByName('RAZ_KOD').AsString + '\' + Class_DataSet.FieldByName('ST_KOD').AsString + '\' + Class_DataSet.FieldByName('KEKV_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := myform.dogparam.sum_today;//myform.dogparam.Smets[0].id_people;
        RxMemoryDataSaveAll.FieldByName('id').Value                  := k+1;
        if mform.flag_def_f = 1 then
        begin
             DataSetFond.Close;
             DataSetFond.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit2.Text+''')';
             DataSetFond.Open;
             if DataSetFond['RESULT'] = 1 then
             begin
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetFond['FOND_TITLE'];
                 RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := DataSetFond['ID_FOND'];
                 RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := DataSetFond['FOND_NUM'];
             end else
             begin
                 if mform.id_sch > 0 then
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                         RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                         RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
                     end else
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                         RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                         RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := '';
                      end;
             DataSetFond.Close;
            end
        end else
            if mform.id_sch > 0 then
            begin
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
            end else
            begin
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := '';
            end;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_my_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
        RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := kod_my_sc;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_KOD').AsString;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
        RxMemoryDataSaveAll.Post;
        Class_DataSet.Close;
      end;
     end;

     if Dog = Stud then {студгородок}
     begin
         RxMemoryDataSaveAll.EmptyTable;
         Res := Load_st_BuildLivers(self, Class_Database.Handle, true, myform.barstr);
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
        cxMemo1.Text := Un_R_file_Alex.KASSA_PRINT_STUD_OSNOV + ' ' + VarToStr(Res[0][6]) + ' ' +  Un_R_file_Alex.KASSA_FIND_CAP_3 + ' ' + VarToStr(Res[0][7]);        cxTextEditSumma.text := VarToStr(Res[0][2]);
        cxMRUEditFio.Text    := VarToStr(Res[0][10]);
//        showmessage(VarToStr(res[1][4]));
//        showmessage(VarToStr(res[2][4]));
//        showmessage(VarToStr(res[1][0]));
//        showmessage(VarToStr(res[1][1]));
//        showmessage(VarToStr(res[1][2]));
//        showmessage(VarToStr(res[1][3]));
        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(myform.id_kassa)+') ';
        Class_DataSet.Open;
        Class_DataSet.First;
        while not Class_DataSet.Eof do
        begin
            if Class_DataSet['FLAG_DEFAULT'] = 1 then
            begin
                id_my_sc    := Class_DataSet['ID_SCH'];
                kod_my_sc   := Class_DataSet['SCH_NUM'];
                title_my_sc := Class_DataSet['SCH_TITLE'];
            end;
            Class_DataSet.Next;
        end;

        l := Res[0][9]+1;

        id_dog_last  := Res[0][0];
        kod_dog_last := Res[0][11];

        for k := 1 to l-1 do
        begin
           Class_DataSet.Close;
           Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('''+VarToStr(Res[k][0])+''', '''+VarToStr(Res[k][1])+''', '''+VarToStr(Res[k][2])+''', '''+VarToStr(Res[k][3])+''')';
           Class_DataSet.Open;
           cxTextEditSumma.Text := FloatToStr(myform.dogparam.Summa);

           RxMemoryDataSaveAll.Open;
           RxMemoryDataSaveAll.Insert;
//          RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
//         RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DT_DOC'];
           RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := Res[k][4];
           RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_SMETA')).AsInt64;
           RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_RAZD')).AsInt64;
           RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_STATE')).AsInt64;
           RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_KEKV')).AsInt64;
           RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := Res[0][0];
           RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := Res[0][11];
           RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value         := VarToStr(Res[0][10]);
           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := Class_DataSet.FieldByName('SM_TITLE').AsString;
           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := Class_DataSet.FieldByName('ST_TITLE').AsString;
           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := null;
           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := null;
           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_my_sc;
           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := null;
           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := Class_DataSet.FieldByName('SM_KOD').AsString + '\' + Class_DataSet.FieldByName('RAZ_KOD').AsString + '\' + Class_DataSet.FieldByName('ST_KOD').AsString + '\' + Class_DataSet.FieldByName('KEKV_KOD').AsString;
           RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
           RxMemoryDataSaveAll.FieldByName('id').Value                  := k+1;
           y := TSpravParams.Create;
           o := TSpravParams.Create;
           y['DataBase']        := Integer(Class_Database.Handle);
           y['ReadTransaction'] := Integer(Class_Database.DefaultTransaction.Handle);
           y['ID_DOG']  := Res[0][0];
           y['KOD_DOG'] := Res[0][11];
           GetDogovorInfo(Self, @y, @o);

           try
              RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := o['ID_BL_ACCOUNT'];
              c := o['ID_BL_ACCOUNT'];
              DSet.Close;
              DSet.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SP_MAIN_SCH_INFO('''+cxDateEdit2.Text+''', '+VarToStr(o['ID_BL_ACCOUNT'])+')';
              DSet.Open;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DSet['SCH_TITLE'];
              RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := DSet['SCH_NUMBER'];
              DSet.Close;
           except
               c := -1;
           end;
           if c <= 0 then
           begin
           if mform.flag_def_f = 1 then
           begin
               DataSetFond.Close;
               DataSetFond.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit2.Text+''')';
               DataSetFond.Open;
               if DataSetFond['RESULT'] = 1 then
               begin
                   RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetFond['FOND_TITLE'];
                   RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := DataSetFond['ID_FOND'];
                   RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := DataSetFond['FOND_NUM'];
               end else
               begin
                   if mform.id_sch > 0 then
                       begin
                           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                           RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                           RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
                       end else
                       begin
                           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                           RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                           RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := '';
                       end;
               DataSetFond.Close;
              end
          end else
              if mform.id_sch > 0 then
              begin
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
              end else
              begin
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                  RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := '';
              end;
          end;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := kod_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
          RxMemoryDataSaveAll.Post;
          Class_DataSet.Close;
          DSet.Close;
          y.Free;
          o.Free;
//          DataSetNumber.Next;
        end;
        if l = 0 then
        begin
            cxTextEditSumma.Text := FloatToStr(myform.dogparam.Summa);

            RxMemoryDataSaveAll.Open;
            RxMemoryDataSaveAll.Insert;
//          RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
//         RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DT_DOC'];
            RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := myform.dogparam.Summa;
//            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_SMETA')).AsInt64;
//            RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_RAZD')).AsInt64;
//           RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_STATE')).AsInt64;
//           RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_KEKV')).AsInt64;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := Res[0][0];
            RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := Res[0][11];
            RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value         := VarToStr(Res[0][10]);
//            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := Class_DataSet.FieldByName('SM_TITLE').AsString;
//            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
//           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := Class_DataSet.FieldByName('ST_TITLE').AsString;
//           RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := null;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := null;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_my_sc;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := null;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := '0\0\0\0';
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
            RxMemoryDataSaveAll.FieldByName('id').Value                  := 1;
            y := TSpravParams.Create;
            o := TSpravParams.Create;
            y['DataBase']        := Integer(Class_Database.Handle);
            y['ReadTransaction'] := Integer(Class_Database.DefaultTransaction.Handle);
            y['ID_DOG']  := Res[0][0];
            y['KOD_DOG'] := Res[0][11];
            GetDogovorInfo(Self, @y, @o);

            try
               RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := o['ID_BL_ACCOUNT'];
               c := 1;
               DSet.Close;
               DSet.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SP_MAIN_SCH_INFO('''+cxDateEdit2.Text+''', '+VarToStr(o['ID_BL_ACCOUNT'])+')';
               DSet.Open;
               RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DSet['SCH_TITLE'];
               RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := DSet['SCH_NUMBER'];
               DSet.Close;
            except
               c := -1;
            end;
            if c < 0 then
            begin
               if mform.id_sch > 0 then
               begin
                   RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                   RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := mform.id_sch;
                   RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := mform.KOD_SCH_DEFAULT;
               end else
               begin
                   RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                   RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                   RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := '';
               end;
            end;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_my_sc;
            RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := kod_my_sc;
//           RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_KOD').AsString;
//           RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_KOD').AsString;
//           RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_KOD').AsString;
//           RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_KOD').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
            RxMemoryDataSaveAll.Post;
            Class_DataSet.Close;
            DSet.Close;
            y.Free;
            o.Free;

         end;
     end;

     end;

     if Dog = other_shablon then {другие шаблоны}
     begin
        RxMemoryDataSaveAll.EmptyTable;
        cxMemo1.Text := myform.Note;
        cxTextEditSumma.Text := FloatToStr(myform.Sum);
        Class_DataSet.Close;
        Class_DataSet.Sqls.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
        Class_DataSet.Open;
        NDS := Class_DataSet.FieldByname('NDS').AsFloat;
        DataSetNumber.Close;
        DataSetNumber.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SP_OPERATION WHERE KASSA_SP_OPERATION.KOD_OPERATION='+IntToStr(myform.kodShab)+'';
        DataSetNumber.Open;
        DataSetNumber.first;
        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(myform.id_kassa)+') ';
        Class_DataSet.Open;
        Class_DataSet.First;
        while not Class_DataSet.Eof do
        begin
            if Class_DataSet['FLAG_DEFAULT'] = 1 then
            begin
                id_my_sc    := Class_DataSet['ID_SCH'];
                kod_my_sc   := Class_DataSet['SCH_NUM'];
                title_my_sc := Class_DataSet['SCH_TITLE'];
            end;
            Class_DataSet.Next;
        end;
        itt := 1;
        while not DataSetNumber.Eof do
        begin
           Class_DataSet.Close;
           Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('''+DataSetNumber.FieldByName('ID_SM').AsString+''', '''+DataSetNumber.FieldByName('ID_RAZD').AsString+''', '''+DataSetNumber.FieldByName('ID_ST').AsString+''', '''+DataSetNumber.FieldByName('ID_KEKV').AsString+''')';
           Class_DataSet.Open;
           RxMemoryDataSaveAll.Open;
           RxMemoryDataSaveAll.Insert;
//          RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := DataSetChangeProv['ID_DT_DOC_PROV'];
//         RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := DataSetChangeProv['ID_DT_DOC'];

           if myform.nds = 1 then
           begin
               if DataSetNumber.FieldByName('NDS').AsInteger = 1
                    then RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := RoundTo(SelectNDS(myform.Sum, 1), -2)
                    else RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := myform.sum-RoundTo(SelectNDS(myform.Sum, 1), -2);
           end
               else RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := myform.Sum;

           if myform.nds_ask_s = 1 then
           begin
               if DataSetNumber.FieldByName('NDS').AsInteger = 1
                    then RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := RoundTo(SelectNDS(myform.sum, 1), -2)
                    else RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := myform.sum-RoundTo(SelectNDS(myform.sum, 1), -2);
           end;

           RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_SMETA')).AsInt64;
           RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_RAZD')).AsInt64;
           RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := TFIBBCDField(Class_DataSet.FieldByName('ID_STATE')).AsInt64;
           RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := TFIBBCDField(Class_DataSet.FieldByName('ID_KEKV')).AsInt64;
           if myform.id_dog_umol > 0 then
              begin
                  RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := myform.id_dog_umol;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := myform.kod_dog_umol;
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := null;
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := null;
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := null;
              end
              else
              begin
                  RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := 0;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := 0;
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := null;
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := null;
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := null;
              end;

          RxMemoryDataSaveAll.FieldByName('id').Value                  := itt;
          inc(itt);

          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := Class_DataSet.FieldByName('SM_TITLE').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := Class_DataSet.FieldByName('ST_TITLE').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := Class_DataSet.FieldByName('SM_KOD').AsString + '\' + Class_DataSet.FieldByName('RAZ_KOD').AsString + '\' + Class_DataSet.FieldByName('ST_KOD').AsString + '\' + Class_DataSet.FieldByName('KEKV_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
          if mform.flag_def_f = 1 then
          begin
              DataSetFond.Close;
              DataSetFond.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit2.Text+''')';
              DataSetFond.Open;
              if DataSetFond['RESULT'] = 1 then
              begin
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetFond['FOND_TITLE'];
                  RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := DataSetFond['ID_FOND'];
                  RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := DataSetFond['FOND_NUM'];
              end else
              begin
                  if mform.id_sch > 0 then
                      begin
                          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                          RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := mform.id_sch;
                          RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := mform.KOD_SCH_DEFAULT;
                      end else
                      begin
                          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value    := '';
                          RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value                 := 0;
                          RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                   := '';
                      end;
                  DataSetFond.Close;
              end
          end else
              if mform.id_sch > 0 then
              begin
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value    := mform.TITLE_SCH_DEFAULT;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value                 := mform.id_sch;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                   := mform.KOD_SCH_DEFAULT;
              end else
              begin
                  RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                  RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := 0;
                  RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := '';
              end;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
          RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := kod_my_sc;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_KOD').AsString;
          RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
          RxMemoryDataSaveAll.Post;
          Class_DataSet.Close;
          DataSetNumber.Next;
        end;
     end;

     if dog = Sdacha_deneg then
     begin
         if m = AddOrder then
         begin
             RxMemoryDataSaveAll.EmptyTable;
             cxMemo1.Text := myform.Note;
             cxMRUEditFio.Text := myform.Note;

             DataSetNumber.Close;
             DataSetNumber.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_OST_PO_KASSE('''+myform.cxComboBoxDay.Text+''', '+IntToStr(myform.id_kassa)+') where r_level='+IntToStr(4)+' and R_OST <> '+IntToStr(0)+'';
             DataSetNumber.Open;
             DataSetNumber.first;
             itt := 1;
             while not DataSetNumber.Eof do
             begin

                 RxMemoryDataSaveAll.Open;
                 RxMemoryDataSaveAll.Insert;
                 RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                      := DataSetNumber.FieldByName('R_OST').AsFloat;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                       := TFIBBCDField(DataSetNumber.FieldByName('R_ID_SMETA')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                     := TFIBBCDField(DataSetNumber.FieldByName('R_ID_RAZD')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                       := TFIBBCDField(DataSetNumber.FieldByName('R_ID_STATE')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                     := TFIBBCDField(DataSetNumber.FieldByName('R_ID_KEKV')).AsInt64;
                 if myform.id_dog_umol > 0 then
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := myform.id_dog_umol;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := myform.kod_dog_umol;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := null;
                 end else
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := null;
                 end;

                 RxMemoryDataSaveAll.FieldByName('id').Value                  := itt;
                
                 inc(itt);

                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := DataSetNumber.FieldByName('R_SMETA_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := DataSetNumber.FieldByName('R_RAZD_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := DataSetNumber.FieldByName('R_STATE_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := DataSetNumber.FieldByName('R_KEKV_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := DataSetNumber.FieldByName('R_SCH_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := DataSetNumber.FieldByName('R_SMETA_KOD').AsString + '\' + DataSetNumber.FieldByName('R_RAZD_KOD').AsString + '\' + DataSetNumber.FieldByName('R_STATE_KOD').AsString + '\' + DataSetNumber.FieldByName('R_KEKV_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                        := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.tytle_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := mform.id_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := mform.kod_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                        := TFIBBCDField(DataSetNumber.FieldByNAme('R_ID_SCH')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value                   := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                      := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                       := DataSetNumber.FieldByName('R_SCH_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                      := DataSetNumber.FieldByName('R_STATE_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                      := DataSetNumber.FieldByName('R_RAZD_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                     := DataSetNumber.FieldByName('R_SMETA_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                      := DataSetNumber.FieldByName('R_KEKV_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value           := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                 RxMemoryDataSaveAll.Post;
                 DataSetNumber.Next;
              end;
              s := 0;
              RxMemoryDataSaveAll.First;
              while not RxMemoryDataSaveAll.Eof do
              begin
                  s := s + RoundTo(RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsCurrency, -2);
                  RxMemoryDataSaveAll.Next;
              end;
              cxTextEditSumma.Text := FloatToStr(s);
         end else
         begin      {переввод}
             RxMemoryDataSaveAll.EmptyTable;
//             cxMemo1.Text      := myform.Note;
//             cxMRUEditFio.Text := myform.Note;

             DataSetNumber.Close;
             DataSetNumber.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_OST_PO_KASSE_EXT('''+myform.cxComboBoxDay.Text+''', '+IntToStr(myform.id_kassa)+', '+IntToStr(id_all_doc)+') where r_level='+IntToStr(4)+' and R_OST <> '+IntToStr(0)+'';
             DataSetNumber.Open;
             DataSetNumber.first;
             itt := 1;
             while not DataSetNumber.Eof do
             begin

                 RxMemoryDataSaveAll.Open;
                 RxMemoryDataSaveAll.Insert;
                 RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                      := DataSetNumber.FieldByName('R_OST').AsFloat;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                       := TFIBBCDField(DataSetNumber.FieldByName('R_ID_SMETA')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                     := TFIBBCDField(DataSetNumber.FieldByName('R_ID_RAZD')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                       := TFIBBCDField(DataSetNumber.FieldByName('R_ID_STATE')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                     := TFIBBCDField(DataSetNumber.FieldByName('R_ID_KEKV')).AsInt64;
                 if myform.id_dog_umol > 0 then
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := myform.id_dog_umol;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := myform.kod_dog_umol;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := null;
                 end else
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := null;
                 end;

                 RxMemoryDataSaveAll.FieldByName('id').Value                  := itt;
                 inc(itt);

                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := DataSetNumber.FieldByName('R_SMETA_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := DataSetNumber.FieldByName('R_RAZD_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := DataSetNumber.FieldByName('R_STATE_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := DataSetNumber.FieldByName('R_KEKV_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := DataSetNumber.FieldByName('R_SCH_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := DataSetNumber.FieldByName('R_SMETA_KOD').AsString + '\' + DataSetNumber.FieldByName('R_RAZD_KOD').AsString + '\' + DataSetNumber.FieldByName('R_STATE_KOD').AsString + '\' + DataSetNumber.FieldByName('R_KEKV_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                        := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.tytle_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := mform.id_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := mform.kod_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                        := TFIBBCDField(DataSetNumber.FieldByNAme('R_ID_SCH')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value                   := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                      := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                       := DataSetNumber.FieldByName('R_SCH_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                      := DataSetNumber.FieldByName('R_STATE_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                      := DataSetNumber.FieldByName('R_RAZD_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                     := DataSetNumber.FieldByName('R_SMETA_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                      := DataSetNumber.FieldByName('R_KEKV_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value           := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                 RxMemoryDataSaveAll.Post;
                 DataSetNumber.Next;
              end;
              s := 0;
              RxMemoryDataSaveAll.First;
              while not RxMemoryDataSaveAll.Eof do
              begin
                  s := s + RoundTo(RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsCurrency, -2);
                  RxMemoryDataSaveAll.Next;
              end;
              cxTextEditSumma.Text := FloatToStr(s);

         end;
     end;

     if Dog = vedomost then {ведомости из четверки}
     begin
        RxMemoryDataSaveAll.EmptyTable;

        cxMRUEditFio.Text := Un_R_file_Alex.KASSA_VEDOMOST;

        DataSetNumber.Close;
        DataSetNumber.SQLs.SelectSQL.Text := 'select * from KASSA_INI_INSTALL';
        DataSetNumber.Open;
        id_type_dog_gos := StrToInt64(DataSetNumber.FieldByName('ID_TYPE_DOG_HOS').AsString);
        id_type_dog_kom := StrToInt64(DataSetNumber.FieldByName('ID_TYPE_DOG_KOMANDIR').AsString);
        mont := MonthOf(myform.RecProv.prov[0].date_zavod);
        yea  := YearOf(myform.RecProv.prov[0].date_zavod);
        DataSetNumber.Close;
        y                    := TSpravParams.Create;
        o                    := TSpravParams.Create;
        y['DataBase']        := Integer(Class_Database.Handle);
        y['ReadTransaction'] := Integer(Class_Database.DefaultTransaction.Handle);
        y['ID_DOG']          := myform.RecProv.prov[0].id_dog;
        y['KOD_DOG']         := myform.RecProv.prov[0].kod_dog;
        GetDogovorInfo(Self, @y, @o);
        if o['ID_TIP_DOG'] = id_type_dog_gos then
        begin
            flag_kom          := false;
            cxMemo1.Text      := Un_R_file_Alex.KASSA_VIDSHKODUVANNYA_GOSP + ' ' + Un_func_file_Alex.MonthFromChislo(mont) + ' ' + IntToStr(yea);
        end else
        begin
            flag_kom          := true;
            cxMemo1.Text      := Un_R_file_Alex.KASSA_VIDSHKODUVANNYA_VIDR + ' ' + Un_func_file_Alex.MonthFromChislo(mont) + ' ' + IntToStr(yea);
        end;
        y.Free;
        o.Free;

        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(myform.id_kassa)+') ';
        Class_DataSet.Open;
        Class_DataSet.First;
        while not Class_DataSet.Eof do
        begin
            if Class_DataSet['FLAG_DEFAULT'] = 1 then
            begin
                id_my_sc    := Class_DataSet['ID_SCH'];
                kod_my_sc   := Class_DataSet['SCH_NUM'];
                title_my_sc := Class_DataSet['SCH_TITLE'];
            end;
            Class_DataSet.Next;
        end;
        Class_DataSet.Close;
        l := Length(myform.RecProv.prov);
        itt := 1;
        for i := 0 to l-1 do
        begin
            y                    := TSpravParams.Create;
            o                    := TSpravParams.Create;
            y['DataBase']        := Integer(Class_Database.Handle);
            y['ReadTransaction'] := Integer(Class_Database.DefaultTransaction.Handle);
            y['ID_DOG']          := myform.RecProv.prov[i].id_dog;
            y['KOD_DOG']         := myform.RecProv.prov[i].kod_dog;
            GetDogovorInfo(Self, @y, @o);
            if flag_kom then
            begin
                if o['ID_TIP_DOG'] <> id_type_dog_kom then
                begin
                    showmessage(Un_R_file_Alex.KASSA_DOG_NOT_KOM);
                end;
            end else
            begin
                if o['ID_TIP_DOG'] <> id_type_dog_gos then
                begin
                    showmessage(Un_R_file_Alex.KASSA_DOG_NOT_GOS);
                end;
            end;
            y.Free;
            o.Free;

            RxMemoryDataSaveAll.Open;
            RxMemoryDataSaveAll.Insert;
            RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                      := myform.RecProv.prov[i].summa_prov;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                       := myform.RecProv.prov[i].id_smeta;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                     := myform.RecProv.prov[i].id_razd;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                       := myform.RecProv.prov[i].id_state;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                     := myform.RecProv.prov[i].id_kekv;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                      := myform.RecProv.prov[i].id_dog;
            RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                     := myform.RecProv.prov[i].kod_dog;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value    := myform.RecProv.prov[i].date_dog;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value     := myform.RecProv.prov[i].num_dog;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value    := myform.RecProv.prov[i].name_cust;

            RxMemoryDataSaveAll.FieldByName('id').Value                  := itt;
            inc(itt);

            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := myform.RecProv.prov[i].tytle_smeta;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := myform.RecProv.prov[i].tytle_razd;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := myform.RecProv.prov[i].tytle_state;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := myform.RecProv.prov[i].tytle_kekv;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_my_sc;//myform.RecProv.prov[i].tytle_sch_ocnov;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := myform.RecProv.prov[i].kod_smeta + '\' + myform.RecProv.prov[i].kod_razd + '\' + myform.RecProv.prov[i].kod_state + '\' + myform.RecProv.prov[i].kod_kekv;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                        := myform.RecProv.prov[i].id_man;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := myform.RecProv.prov[i].tytle_sch_kor;
            RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := myform.RecProv.prov[i].id_sch_kor;
            RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := myform.RecProv.prov[i].kod_sch_kor;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                        := id_my_sc;//myform.RecProv.prov[i].id_sch_osnov;
            RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value                   := 0;
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                      := 0;
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                       := kod_my_sc;//myform.RecProv.prov[i].kod_sch_osnov;
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                      := myform.RecProv.prov[i].kod_state;
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                      := myform.RecProv.prov[i].kod_razd;
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                     := myform.RecProv.prov[i].kod_smeta;
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                      := myform.RecProv.prov[i].kod_kekv;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value           := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
            RxMemoryDataSaveAll.Post;
            cxTextEditSumma.Text := CurrToStr(myform.RecProv.prov[i].summa_all);
        end;
     end;


     if Dog = DogTritiesNew then {новые договора за обучение}
     begin
         RxMemoryDataSaveAll.EmptyTable;
         Class_DataSet.Close;
         Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(myform.id_kassa)+') ';
         Class_DataSet.Open;
         Class_DataSet.First;
         while not Class_DataSet.Eof do
         begin
             if Class_DataSet['FLAG_DEFAULT'] = 1 then
             begin
                 id_my_sc    := Class_DataSet['ID_SCH'];
                 kod_my_sc   := Class_DataSet['SCH_NUM'];
                 title_my_sc := Class_DataSet['SCH_TITLE'];
             end;
             Class_DataSet.Next;
         end;

//          cxMemo1.Text := 'За обуч. ' + Values['FACULTY_SHORT_NAME'] + ' ' + Values['FORM_STUDY_SHORT_NAME'] + ' (№ дог. ' + Values['NUM_DOG'] + ' от ' + Values['DATE_DOG'] +') ' + Values['STUD_FIO'];
          cxMemo1.Text := myform.note_obuch;

          cxMRUEditFio.Text := myform.RecProv.prov[0].name_fio;
          l := Length(myform.RecProv.prov);
          for i := 0 to l-1 do
          begin
              SmetID           := myform.RecProv.prov[i].id_smeta;
              RazdID           := myform.RecProv.prov[i].id_razd;
              StatID           := myform.RecProv.prov[i].id_state;
              KekvID           := myform.RecProv.prov[i].id_kekv;
              id_dog_izvne     := myform.RecProv.prov[i].id_dog;
              kod_dog_izvne    := myform.RecProv.prov[i].kod_dog;
              id_payer_izvne   := myform.RecProv.prov[i].id_payer;
              Class_DataSet.Close;
              Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('+IntToStr(SmetID)+', '+IntToStr(RazdID)+', '+IntToStr(StatID)+', '+IntToStr(KekvID)+')';
              Class_DataSet.Open;
              cxTextEditSumma.Text := FloatToStr(myform.RecProv.prov[i].summa_all);

              RxMemoryDataSaveAll.Open;
              RxMemoryDataSaveAll.Insert;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value      := myform.RecProv.prov[i].id_payer;
              RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                        := myform.RecProv.prov[i].summa_prov;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                         := TFIBBCDField(Class_DataSet.FieldByName('ID_SMETA')).AsInt64;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                       := TFIBBCDField(Class_DataSet.FieldByName('ID_RAZD')).AsInt64;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                         := TFIBBCDField(Class_DataSet.FieldByName('ID_STATE')).AsInt64;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                       := TFIBBCDField(Class_DataSet.FieldByName('ID_KEKV')).AsInt64;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                        := myform.RecProv.prov[i].id_dog;
              RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                       := myform.RecProv.prov[i].kod_dog;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := Class_DataSet.FieldByName('SM_TITLE').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := Class_DataSet.FieldByName('ST_TITLE').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := myform.RecProv.prov[i].date_dog;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := myform.RecProv.prov[i].num_dog;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_my_sc;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := myform.RecProv.prov[i].name_cust;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := Class_DataSet.FieldByName('SM_KOD').AsString + '\' + Class_DataSet.FieldByName('RAZ_KOD').AsString + '\' + Class_DataSet.FieldByName('ST_KOD').AsString + '\' + Class_DataSet.FieldByName('KEKV_KOD').AsString;
              RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                        := 0;//myform.RecProv.prov[i].id_man;
              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value      := myform.RecProv.prov[i].id_payer;
              RxMemoryDataSaveAll.FieldByName('id').Value                                    := i+1;
          
              if mform.flag_def_f = 1 then
              begin
                  DataSetFond.Close;
                  DataSetFond.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit2.Text+''')';
                  DataSetFond.Open;
                  if DataSetFond['RESULT'] = 1 then
                  begin
                      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := DataSetFond['FOND_TITLE'];
                      RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := DataSetFond['ID_FOND'];
                      RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := DataSetFond['FOND_NUM'];
                  end else
                  begin
                      if mform.id_sch > 0 then
                          begin
                              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                              RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := mform.id_sch;
                              RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := mform.KOD_SCH_DEFAULT;
                          end else
                          begin
                              RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                              RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := 0;
                              RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := '';
                          end;
                  DataSetFond.Close;
                  end
             end else
                 if mform.id_sch > 0 then
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.TITLE_SCH_DEFAULT;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := mform.id_sch;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := mform.KOD_SCH_DEFAULT;
                 end else
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := '';
                     RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := '';
                 end;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value              := id_my_sc;
             RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value         := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value            := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value             := kod_my_sc;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value            := Class_DataSet.FieldByName('ST_KOD').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value            := Class_DataSet.FieldByName('RAZ_KOD').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value           := Class_DataSet.FieldByName('SM_KOD').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value            := Class_DataSet.FieldByName('KEKV_KOD').AsString;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
             RxMemoryDataSaveAll.Post;
//          end;
       end;
       Class_DataSet.Close;
     end;

     if dog = Sdacha_deneg_new then
     begin
         if m = AddOrder then
         begin
             RxMemoryDataSaveAll.EmptyTable;
             cxMemo1.Text := myform.Note;
             cxMRUEditFio.Text := myform.Note;

             DataSetNumber.Close;
             DataSetNumber.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_OST_PO_KASSE_N('''+myform.cxComboBoxDay.Text+''', '+IntToStr(myform.id_kassa)+', '+IntToStr(mform.id_sch_kor_sdacha)+') where r_level='+IntToStr(4)+' and R_OST <> '+IntToStr(0)+'';
             DataSetNumber.Open;
             DataSetNumber.first;
             itt := 1;
             while not DataSetNumber.Eof do
             begin

                 RxMemoryDataSaveAll.Open;
                 RxMemoryDataSaveAll.Insert;
                 RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                      := DataSetNumber.FieldByName('R_OST').AsFloat;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                       := TFIBBCDField(DataSetNumber.FieldByName('R_ID_SMETA')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                     := TFIBBCDField(DataSetNumber.FieldByName('R_ID_RAZD')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                       := TFIBBCDField(DataSetNumber.FieldByName('R_ID_STATE')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                     := TFIBBCDField(DataSetNumber.FieldByName('R_ID_KEKV')).AsInt64;
                 if myform.id_dog_umol > 0 then
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := myform.id_dog_umol;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := myform.kod_dog_umol;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := null;
                 end else
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := null;
                 end;

                 RxMemoryDataSaveAll.FieldByName('id').Value                  := itt;
                 inc(itt);

                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := DataSetNumber.FieldByName('R_SMETA_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := DataSetNumber.FieldByName('R_RAZD_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := DataSetNumber.FieldByName('R_STATE_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := DataSetNumber.FieldByName('R_KEKV_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := DataSetNumber.FieldByName('R_SCH_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := DataSetNumber.FieldByName('R_SMETA_KOD').AsString + '\' + DataSetNumber.FieldByName('R_RAZD_KOD').AsString + '\' + DataSetNumber.FieldByName('R_STATE_KOD').AsString + '\' + DataSetNumber.FieldByName('R_KEKV_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                        := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.tytle_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := mform.id_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := mform.kod_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                        := TFIBBCDField(DataSetNumber.FieldByNAme('R_ID_SCH')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value                   := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                      := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                       := DataSetNumber.FieldByName('R_SCH_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                      := DataSetNumber.FieldByName('R_STATE_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                      := DataSetNumber.FieldByName('R_RAZD_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                     := DataSetNumber.FieldByName('R_SMETA_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                      := DataSetNumber.FieldByName('R_KEKV_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value           := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                 RxMemoryDataSaveAll.Post;
                 DataSetNumber.Next;
              end;
              s := 0;
              RxMemoryDataSaveAll.First;
              while not RxMemoryDataSaveAll.Eof do
              begin
                  s := s + RoundTo(RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsCurrency, -2);
                  RxMemoryDataSaveAll.Next;
              end;
              cxTextEditSumma.Text := FloatToStr(s);
         end else
         begin      {переввод}
             RxMemoryDataSaveAll.EmptyTable;
//             cxMemo1.Text      := myform.Note;
//             cxMRUEditFio.Text := myform.Note;

             DataSetNumber.Close;
             DataSetNumber.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_OST_PO_KASSE_EXT_N('''+myform.cxComboBoxDay.Text+''', '+IntToStr(myform.id_kassa)+', '+IntToStr(id_all_doc)+', '+IntToStr(mform.id_sch_kor_sdacha)+') where r_level='+IntToStr(4)+' and R_OST <> '+IntToStr(0)+'';
             DataSetNumber.Open;
             DataSetNumber.first;
             itt := 1;
             while not DataSetNumber.Eof do
             begin

                 RxMemoryDataSaveAll.Open;
                 RxMemoryDataSaveAll.Insert;
                 RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                      := DataSetNumber.FieldByName('R_OST').AsFloat;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                       := TFIBBCDField(DataSetNumber.FieldByName('R_ID_SMETA')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                     := TFIBBCDField(DataSetNumber.FieldByName('R_ID_RAZD')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                       := TFIBBCDField(DataSetNumber.FieldByName('R_ID_STATE')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                     := TFIBBCDField(DataSetNumber.FieldByName('R_ID_KEKV')).AsInt64;
                 if myform.id_dog_umol > 0 then
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := myform.id_dog_umol;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := myform.kod_dog_umol;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := null;
                 end else
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := null;
                 end;

                 RxMemoryDataSaveAll.FieldByName('id').Value                  := itt;
                 inc(itt);

                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := DataSetNumber.FieldByName('R_SMETA_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := DataSetNumber.FieldByName('R_RAZD_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := DataSetNumber.FieldByName('R_STATE_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := DataSetNumber.FieldByName('R_KEKV_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := DataSetNumber.FieldByName('R_SCH_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := DataSetNumber.FieldByName('R_SMETA_KOD').AsString + '\' + DataSetNumber.FieldByName('R_RAZD_KOD').AsString + '\' + DataSetNumber.FieldByName('R_STATE_KOD').AsString + '\' + DataSetNumber.FieldByName('R_KEKV_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                        := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.tytle_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := mform.id_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := mform.kod_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                        := TFIBBCDField(DataSetNumber.FieldByNAme('R_ID_SCH')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value                   := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                      := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                       := DataSetNumber.FieldByName('R_SCH_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                      := DataSetNumber.FieldByName('R_STATE_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                      := DataSetNumber.FieldByName('R_RAZD_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                     := DataSetNumber.FieldByName('R_SMETA_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                      := DataSetNumber.FieldByName('R_KEKV_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value           := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                 RxMemoryDataSaveAll.Post;
                 DataSetNumber.Next;
              end;
              s := 0;
              RxMemoryDataSaveAll.First;
              while not RxMemoryDataSaveAll.Eof do
              begin
                  s := s + RoundTo(RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsCurrency, -2);
                  RxMemoryDataSaveAll.Next;
              end;
              cxTextEditSumma.Text := FloatToStr(s);
         end;
     end;


     if dog = Sdacha_deneg_new_pkv_fin then
     begin
         if m = AddOrder then
         begin
             RxMemoryDataSaveAll.EmptyTable;
             cxMemo1.Text := myform.Note;
             cxMRUEditFio.Text := myform.Note;
             DataSetNumber.Close;
             DataSetNumber.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_OST_PO_KASSE_PKV('''+myform.cxComboBoxDay.Text+''', '+IntToStr(myform.id_kassa)+', '+IntToStr(mform.id_pkv)+', '+IntToStr(mform.id_tpfin)+') where r_level='+IntToStr(4)+' and R_OST <> '+IntToStr(0)+'';
             DataSetNumber.Open;
             DataSetNumber.first;
             itt := 1;
             while not DataSetNumber.Eof do
             begin

                 RxMemoryDataSaveAll.Open;
                 RxMemoryDataSaveAll.Insert;
                 RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                      := DataSetNumber.FieldByName('R_OST').AsFloat;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                       := TFIBBCDField(DataSetNumber.FieldByName('R_ID_SMETA')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                     := TFIBBCDField(DataSetNumber.FieldByName('R_ID_RAZD')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                       := TFIBBCDField(DataSetNumber.FieldByName('R_ID_STATE')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                     := TFIBBCDField(DataSetNumber.FieldByName('R_ID_KEKV')).AsInt64;
                 if myform.id_dog_umol > 0 then
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := myform.id_dog_umol;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := myform.kod_dog_umol;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := null;
                 end else
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := null;
                 end;

                 RxMemoryDataSaveAll.FieldByName('id').Value                  := itt;
                 inc(itt);

                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := DataSetNumber.FieldByName('R_SMETA_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := DataSetNumber.FieldByName('R_RAZD_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := DataSetNumber.FieldByName('R_STATE_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := DataSetNumber.FieldByName('R_KEKV_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := DataSetNumber.FieldByName('R_SCH_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := DataSetNumber.FieldByName('R_SMETA_KOD').AsString + '\' + DataSetNumber.FieldByName('R_RAZD_KOD').AsString + '\' + DataSetNumber.FieldByName('R_STATE_KOD').AsString + '\' + DataSetNumber.FieldByName('R_KEKV_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                        := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.tytle_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := mform.id_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := mform.kod_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                        := TFIBBCDField(DataSetNumber.FieldByNAme('R_ID_SCH')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value                   := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                      := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                       := DataSetNumber.FieldByName('R_SCH_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                      := DataSetNumber.FieldByName('R_STATE_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                      := DataSetNumber.FieldByName('R_RAZD_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                     := DataSetNumber.FieldByName('R_SMETA_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                      := DataSetNumber.FieldByName('R_KEKV_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value           := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                 RxMemoryDataSaveAll.Post;
                 DataSetNumber.Next;
              end;
              s := 0;
              RxMemoryDataSaveAll.First;
              while not RxMemoryDataSaveAll.Eof do
              begin
                  s := s + RoundTo(RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsCurrency, -2);
                  RxMemoryDataSaveAll.Next;
              end;
              cxTextEditSumma.Text := FloatToStr(s);
         end else
         begin      {переввод}
             //RxMemoryDataSaveAll.EmptyTable;
//             cxMemo1.Text      := myform.Note;
//             cxMRUEditFio.Text := myform.Note;
             DataSetNumber.Close;
             DataSetNumber.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_OST_PO_KAS_EXT_PKV('''+myform.cxComboBoxDay.Text+''', '+IntToStr(myform.id_kassa)+', '+IntToStr(id_all_doc)+', '+IntToStr(mform.id_pkv)+', '+IntToStr(mform.id_tpfin)+') where r_level='+IntToStr(4)+' and R_OST <> '+IntToStr(0)+'';
             DataSetNumber.Open;
             DataSetNumber.first;
             itt := 1;
             while not DataSetNumber.Eof do
             begin

                 RxMemoryDataSaveAll.Open;
                 RxMemoryDataSaveAll.Insert;
                 RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                      := DataSetNumber.FieldByName('R_OST').AsFloat;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                       := TFIBBCDField(DataSetNumber.FieldByName('R_ID_SMETA')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                     := TFIBBCDField(DataSetNumber.FieldByName('R_ID_RAZD')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                       := TFIBBCDField(DataSetNumber.FieldByName('R_ID_STATE')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                     := TFIBBCDField(DataSetNumber.FieldByName('R_ID_KEKV')).AsInt64;
                 if myform.id_dog_umol > 0 then
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := myform.id_dog_umol;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := myform.kod_dog_umol;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := null;
                 end else
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                   := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                  := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := null;
                 end;

                 RxMemoryDataSaveAll.FieldByName('id').Value                  := itt;
                 inc(itt);

                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := DataSetNumber.FieldByName('R_SMETA_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := DataSetNumber.FieldByName('R_RAZD_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := DataSetNumber.FieldByName('R_STATE_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := DataSetNumber.FieldByName('R_KEKV_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := DataSetNumber.FieldByName('R_SCH_TYTLE').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := DataSetNumber.FieldByName('R_SMETA_KOD').AsString + '\' + DataSetNumber.FieldByName('R_RAZD_KOD').AsString + '\' + DataSetNumber.FieldByName('R_STATE_KOD').AsString + '\' + DataSetNumber.FieldByName('R_KEKV_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                        := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := mform.tytle_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := mform.id_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := mform.kod_sch_kor_sdacha;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                        := TFIBBCDField(DataSetNumber.FieldByNAme('R_ID_SCH')).AsInt64;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value                   := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value                      := 0;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                       := DataSetNumber.FieldByName('R_SCH_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                      := DataSetNumber.FieldByName('R_STATE_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                      := DataSetNumber.FieldByName('R_RAZD_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                     := DataSetNumber.FieldByName('R_SMETA_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                      := DataSetNumber.FieldByName('R_KEKV_KOD').AsString;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value           := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                 RxMemoryDataSaveAll.Post;
                 DataSetNumber.Next;
              end;
              s := 0;
              RxMemoryDataSaveAll.First;
              while not RxMemoryDataSaveAll.Eof do
              begin
                  s := s + RoundTo(RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsCurrency, -2);
                  RxMemoryDataSaveAll.Next;
              end;
              cxTextEditSumma.Text := FloatToStr(s);
         end;
     end;

     cxTextEditSummaEnter(Self);
     flag_afterscroll := true; 
end;

procedure TfmKassOrder.cxTextEditAddNumKeyPress(Sender: TObject;
  var Key: Char);
begin
    {if (key > '9') or (key < '0') then key := Chr(0);  }
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Ord(Key) <> VK_ESCAPE)
    then
        Key := Chr(0)
end;

procedure TfmKassOrder.cxTextEditNumKeyPress(Sender: TObject;
  var Key: Char);
begin
    {if (key > '9') or (key < '0') then key := Chr(0);}
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Ord(Key) <> VK_ESCAPE)
    then
        Key := Chr(0)
end;

procedure TfmKassOrder.ActionCloseExecute(Sender: TObject);
begin
    if flag <> ShowOrder then
    begin
        if MessageBox(Handle, PChar(Un_R_file_Alex.KASSA_EXIT_ERROR), PChar(Un_R_file_Alex.KASSA_LOOK_FOR), mb_YesNO)=mrYes then Close
    end
    else close;
end;

procedure TfmKassOrder.ActionAddExecute(Sender: TObject);
var
    id_smeta, id_stat, id_r, id_k, id_sch, id_man_prov, id_kor_sch, kod_dog, id_dog : int64;
    name_smeta, name_stat, name_r, name_k, name_sch, name_fio, name_kor_sch, date_dog, num_dog, name_cust, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, reg_dog, type_dog : string;
    summa : double;
    summa_doc : double;
    id_prov, id_ras_nat, id_ras_cust, id_cust : int64;
    dd : TDateTime;
    itt : integer;
begin

flag_afterscroll := false;
if flag <> ShowOrder then
begin
        id_smeta := 0;
        id_stat  := 0;
        id_r     := 0;
        id_k     := 0;
        id_sch   := 0;
        id_kor_sch := 0;
        id_ras_nat  := 0;
        id_ras_cust := 0;
        id_cust     := 0;
        id_man_prov :=id_man;
        name_fio   := cxMRUEditFio.Text;
        name_kor_sch := '';
        name_smeta := '';
        name_stat  := '';
        name_r     := '';
        name_k     := '';
        name_sch   := '';
        RxMemoryDataSaveAll.First;
        summa_doc := 0;
        while not RxMemoryDataSaveAll.Eof do
        begin
            summa_doc := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
            RxMemoryDataSaveAll.next;
        end;
        summa      := StrToFloat(cxTextEditSumma.Text);
        summa      := RoundTo(summa - summa_doc, -2);
        buh_prov   := 1;
        kod_dog    := kod_dog_last;
        id_dog     := id_dog_last;
        date_dog   := '';
        num_dog    := '';
        name_cust  := '';
        title_sm   := '';
        title_rz   := '';
        title_st   := '';
        title_kekv := '';
        title_kor_sch := '';
        title_sch  := '';
        type_dog   := '';
        reg_dog    := '';
        id_prov    := 0;
        itt := 0;
        RxMemoryDataSaveAll.First;
        while not RxMemoryDataSaveAll.Eof do
        begin
            if RxMemoryDataSaveAll.FieldByName('id').AsInteger > itt then itt := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
            RxMemoryDataSaveAll.Next;
        end;

        if Show_Provodka(self, myform.id_kassa, Class_Database, myclass.Class_Transaction_R, AddProv, id_kor_sch, id_man_prov, id_sch, id_smeta, id_stat, id_r, id_k, summa, name_fio, name_sch, name_smeta, name_stat, name_r, name_k, name_kor_sch, id_dog, kod_dog, date_dog, num_dog, name_cust, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, type_dog, reg_dog, id_prov, id_ras_nat, id_ras_cust, id_cust) then
        begin
             RxMemoryDataSaveAll.Open;
             RxMemoryDataSaveAll.Insert;
             RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := summa;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := id_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := id_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := id_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := id_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := id_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := kod_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value :=  0;
             RxMemoryDataSaveAll.FieldByName('id').Value                  := itt+1;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := name_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := name_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := name_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value         := name_fio;
             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value            := id_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value              := name_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value    := id_payer_izvne;
             if id_prov > 0
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := id_prov
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := title_sm;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := title_rz;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := title_st;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := title_kekv;
             if date_dog <> ''
                then begin
                    if TryStrToDate(date_dog, dd)
                         then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := StrToDate(date_dog)
                         else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null
                    end
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := null;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := num_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := title_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := name_cust;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := name_smeta + '\' + name_r + '\' + name_stat + '\' + name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldReg_Dog').Value       := reg_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldType_Dog').Value      := type_dog;
             RxMemoryDataSaveAll.Post;

//        if myform.predv_prov = 1 then
        begin
             RxMemoryDataSaveAll.First;
             summa_doc := 0;
             while not RxMemoryDataSaveAll.Eof do
             begin
                 summa_doc := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                 RxMemoryDataSaveAll.next;
             end;
             cxTextEditSumma.Text := FloatToStr(RoundTo(summa_doc, -2));
        end;
        end;
        try RxMemoryDataSaveAll.Locate('id', itt+1, []); finally end;
end;
flag_afterscroll := true;

end;

procedure TfmKassOrder.ActionDeleteExecute(Sender: TObject);
var
    summa_doc : double;
    i, j : integer;
begin
flag_afterscroll := false;
if flag <> ShowOrder then
begin
    if PageControl1.ActivePage = TabSheet2 then
    begin
        if (MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_DELETE_PROV +' '+ RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO + MB_DEFBUTTON2)=mrYes) and (not RxMemoryDataSaveAll.IsEmpty) then
        begin
            j := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
            cxGridSaveAllDBTableView1.Controller.GoToPrev(false);
            i := RxMemoryDataSaveAll.FieldByName('id').AsInteger;
            RxMemoryDataSaveAll.Locate('id', j, [] );

            RxMemoryDataSaveAll.Delete;
            RxMemoryDataSaveAll.First;
            summa_doc := 0;
            while not RxMemoryDataSaveAll.Eof do
            begin
                summa_doc := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                RxMemoryDataSaveAll.next;
            end;
            cxTextEditSumma.Text := FloatToStr(RoundTo(summa_doc, -2));
            RxMemoryDataSaveAll.Locate('id', i, [] );
        end;
    end;
end;
flag_afterscroll := true;
end;

procedure TfmKassOrder.ActionChangeExecute(Sender: TObject);
var
    id_kor_sch, id_man_prov, id_smeta, id_stat, id_r, id_k, id_sch, id_dog, kod_dog : int64;
    name_kor_sch, name_fio, name_smeta, name_stat, name_r, name_k, name_sch, date_dog, num_dog, name_cust, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, reg_dog, type_dog : string;
    summa, summa_doc : double;
    id_prov, id_ras_nat, id_ras_cust, id_cust : int64;
    dd : TDateTime;
    itt : integer;
begin
flag_afterscroll := false;
//if flag <> ShowOrder then
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
            then id_kor_sch := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value
            else id_kor_sch := 0;
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
        if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value <> null
            then id_dog := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value
            else id_dog := 0;
        if RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <> null
            then kod_dog := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value
            else kod_dog := 0;
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value <> null
            then title_sm := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value
            else title_sm := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value <> null
            then title_rz := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value
            else title_rz := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value <> null
            then title_st := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value
            else title_st := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value <> null
            then title_kekv := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value
            else title_kekv := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value <> null
            then title_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value
            else title_sch := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value <> null
            then title_kor_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value
            else title_kor_sch := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value <> null
            then date_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value
            else date_dog := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value <> null
            then num_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value
            else num_dog := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value <> null
            then name_cust := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value
            else name_cust := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldReg_Dog').Value <> null
            then reg_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldReg_Dog').Value
            else reg_dog := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldType_Dog').Value <> null
            then type_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldType_Dog').Value
            else type_dog := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value <> null
            then id_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value
            else id_prov := 0;
        if RxMemoryDataSaveAll.FieldByName('id_ras_native').Value <> null
            then id_ras_nat := RxMemoryDataSaveAll.FieldByName('id_ras_native').Value
            else id_ras_nat := 0;
        if RxMemoryDataSaveAll.FieldByName('id_ras_customer').Value <> null
            then id_ras_cust := RxMemoryDataSaveAll.FieldByName('id_ras_customer').Value
            else id_ras_cust := 0;
        if RxMemoryDataSaveAll.FieldByName('id_customer').Value <> null
            then id_cust := RxMemoryDataSaveAll.FieldByName('id_customer').Value
            else id_cust := 0;
        buh_prov := 1;
        if Show_Provodka(self, myform.id_kassa, Class_Database, myclass.Class_Transaction_R, ChangeProv, id_kor_sch, id_man_prov, id_sch, id_smeta, id_stat, id_r, id_k, summa, name_fio, name_sch, name_smeta, name_stat, name_r, name_k, name_kor_sch, id_dog, kod_dog, date_dog, num_dog, name_cust, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, type_dog, reg_dog, id_prov, id_ras_nat, id_ras_cust, id_cust) then
        begin
             RxMemoryDataSaveAll.Open;
             RxMemoryDataSaveAll.Edit;
//             RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := summa;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := id_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := id_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := id_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := id_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := id_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := kod_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    :=  0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := name_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := name_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := name_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value         := name_fio;
             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := id_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := name_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value           := id_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sm').Value      := title_sm;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').Value     := title_rz;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').Value      := title_st;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').Value    := title_kekv;
             RxMemoryDataSaveAll.FieldByName('id_ras_native').Value       := id_ras_nat;
             RxMemoryDataSaveAll.FieldByName('id_ras_customer').Value     := id_ras_cust;
             RxMemoryDataSaveAll.FieldByName('id_customer').Value         := id_cust;
             if date_dog <> ''
                then begin
                    if TryStrToDate(date_dog, dd)
                         then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := StrToDate(date_dog)
                         else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value := null
                    end
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').Value      := null;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').Value       := num_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_sch').Value     := title_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kor_sch').Value := title_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := name_cust;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').Value       := name_smeta + '\' + name_r + '\' + name_stat + '\' + name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldReg_Dog').Value       := reg_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldType_Dog').Value      := type_dog;
             RxMemoryDataSaveAll.Post;
        end;
        RxMemoryDataSaveAll.First;
        summa_doc := 0;
        while not RxMemoryDataSaveAll.Eof do
        begin
            summa_doc := summa_doc + RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
            RxMemoryDataSaveAll.next;
        end;
        cxTextEditSumma.Text := FloatToStr(summa_doc);
        RxMemoryDataSaveAll.Locate('id', itt, []);

        end;
    end;
end;
flag_afterscroll := true;
end;

procedure TfmKassOrder.cxMRUEditFioPropertiesButtonClick(Sender: TObject);
var
    res : Variant;
begin
    flag_afterscroll := false;
    res := Un_lo_file_Alex.mY_getManEx(self,class_database.Handle, False, True, id_man);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null){ and (res[1]<>null) }then
        begin
            if id_man <> res[0] then
            begin
                id_man            := res[0];
                if myform.lang = 0 then
                begin
                    cxMRUEditFio.Text := res[1];//укр
                    fio_man           := res[1];
                end else
                begin
                    cxMRUEditFio.Text := res[5]+' '+res[6]+' '+res[7];//рус
                    fio_man           := res[5]+' '+res[6]+' '+res[7];
                end;
                cxLabel8.Visible  := true;
                cxLabel10.Visible := true;
                cxLabel9.Visible  := true;
                try cxLabel10.Caption := res[9]  except cxLabel10.Caption := ''; end;
                try cxLabel11.Caption := res[8]  except cxLabel11.Caption := ''; end;
                try cxLabel20.Caption := res[10] except cxLabel20.Caption := ''; end;

                cxLabel11.Visible := true;
                cxLabel12.Visible := true;
                cxLabel12.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_FROM_SP;
                cxLabel9.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_BIRTHDAY;
                cxLabel8.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_TIN;



                if not RxMemoryDataSaveAll.IsEmpty then
                begin
                    RxMemoryDataSaveAll.First;
                    while not RxMemoryDataSaveAll.eof do
                    begin
                        RxMemoryDataSaveAll.Open;
                        RxMemoryDataSaveAll.Edit;
                        RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value := res[0];
                        if myform.lang = 0 then
                        begin
                            RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value := res[1];
                        end else
                        begin
                            RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value := res[5]+' '+res[6]+' '+res[7];
                        end;
                        RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value := res[0];
                        RxMemoryDataSaveAll.Post;
                        RxMemoryDataSaveAll.Next;
                    end;
                end;
            end;
        end;
    end;
    flag_afterscroll := true;
end;

procedure TfmKassOrder.cxMRUEditFioExit(Sender: TObject);
begin
    flag_afterscroll := false;
    if id_man > 0 then
    begin
        if (fio_man <> cxMRUEditFio.Text) and (fio_man <> '') then
        begin
            MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_ERROR_NAME_FIO), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), 16);
            id_man := 0;

            if not RxMemoryDataSaveAll.IsEmpty then
            begin
                RxMemoryDataSaveAll.First;
                while not RxMemoryDataSaveAll.Eof do
                begin
                    RxMemoryDataSaveAll.Open;
                    RxMemoryDataSaveAll.Edit;
                    RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value := 0;
                    RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value := '';
                    RxMemoryDataSaveAll.Post;
                    RxMemoryDataSaveAll.Next;
                end;
            end;
            cxLabel8.Visible  := false;
            cxLabel10.Visible := false;
            cxLabel9.Visible  := false;
            cxLabel11.Visible := false;
            cxLabel12.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_FROM_KLAVA;
            exit;
        end;
   end;
 flag_afterscroll := true;
end;

procedure TfmKassOrder.cxGridSaveAllDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_DELETE then ActionDeleteExecute(sender);
end;

procedure TfmKassOrder.cxGridSaveDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_DELETE then ActionDeleteExecute(sender);
end;

procedure TfmKassOrder.MySave;
var
    mes, str1, name_prov, ssum : string;
    flag_mes : boolean;
    s1, S2 : currency;
    ADD_NUMBER_DOC : INTEGER;
    I, l, ttt, nal_dog : integer;
    j, id_all, id_custom, kod_dog_d, kod_dog_n, d_kod_dog, d_id_dog : int64;
    STRU : kernel_mode_structure;
    errorList : TstringList;
    DoResult, kod_dd, kod_dddddd : boolean;
    T : TfmUn_Progress_form;
    G, o : TSpravParams;
begin
flag_afterscroll := false;
if flag <> ShowOrder then
begin
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.MY_SVERKA_DANNIH);
    T.Show;
    T.Repaint;
    flag_all_doc_change_ok := true;
    mes := '';
    flag_mes := false;
    //проверка на корректность данных

    if cxMRUEditFio.Text = '' then
    begin
        mes := Un_R_file_Alex.J4_ADD_WARNING_FIO;
        cxMRUEditFio.SetFocus;
        cxMRUEditFio.style.Color := clred;
        FLAG_mes := TRUE;
    end ELSE
        cxMRUEditFio.style.Color := $00FFFBF0;

    if cxMemo1.Text = '' then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.J4_ADD_WARNING_NOTE;
            cxMemo1.SetFocus;
        end else
            MES := mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_NOTE;
        cxMemo1.style.Color := clred;
        FLAG_mes := TRUE;
    end else
        cxMemo1.style.Color := $00FFFBF0;

    if cxTextEditNum.Text ='' then
    begin
        if not flag_mes then
        begin
            mes := Un_R_file_Alex.J4_ADD_WARNING_NUMBER;
            cxTextEditNum.SetFocus;
        end else
            mes := mes + Un_R_file_Alex.J4_ADD_WARNING_NUMBER;
        flag_mes := true;
        cxTextEditNum.style.Color := clred;
    end else
        cxTextEditNum.style.Color := $00E7FFFF;

        //проверка на суммы

    s2 := 0;
    if not RxMemoryDataSaveAll.isEmpty then
    begin
        RxMemoryDataSaveAll.First;
        while not RxMemoryDataSaveAll.Eof do
        begin
            s2 := s2 + Roundto(RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsCurrency, -2);
            RxMemoryDataSaveAll.next;
        end;
    end;

    cxTextEditSumma.text := FloatToStr(RoundTo(s2, -2));

    if (s2 < 0) then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.J4_ADD_WARNING_PROV;
            cxTextEditSumma.SetFocus;
        end else
            mes := mes + Un_R_file_Alex.J4_ADD_WARNING_PROV;
        cxTextEditSumma.style.Color := clred;
        flag_mes := true;
    end else
        cxTextEditSumma.style.Color := $00FFFBF0;

    if (s2 = 0) then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.KASSA_DOC_ADD_SUMM_NOT_NOL;
            cxTextEditSumma.SetFocus;
        end else
            mes := mes + Un_R_file_Alex.KASSA_DOC_ADD_SUMM_NOT_NOL;
        cxTextEditSumma.style.Color := clred;
        flag_mes := true;
    end else
        cxTextEditSumma.style.Color := $00FFFBF0;

    if (flag = ChangeOrder) and (id_all_doc > 0) and (myform.predv_prov = 1) then
    begin
        if abs(s2 - myform.DataSetMain.FBN('SUMMA_DOC').AsCurrency) >= 0.01 then
        begin
            MES := Un_R_file_Alex.KASSA_WARNING_SUM_CHANGE_ORDER + myform.DataSetMain.FBN('SUMMA_DOC').AsString;
            cxTextEditSumma.SetFocus;
            cxTextEditSumma.style.Color := clred;
            flag_mes := true;
        end;
    end else
        cxTextEditSumma.style.Color := $00FFFBF0;

    str1 := cxMemo1.Text;
    cxMemo1.Text := StringReplace(cxMemo1.Text, '''', '''''', [rfReplaceAll]);
    cxMRUEditFio.Text := StringReplace(cxMRUEditFio.Text, '''', '''''', [rfReplaceAll]);
    DataSetChangeProv.Database       := Class_Database;
    DataSetChangeProv.Transaction    := myclass.Class_Transaction_R;

    {s1 := myform.DataSetMain.FieldByName('SUMMA_DOC').AsFloat;
    showmessage(floattostr(s1));
    DataSetChangeProv.Close;
    DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SP_KASS WHERE ID_SP_KASS='+IntToStr(myclass.id_kas)+'';
    DataSetChangeProv.Open;
    if (DataSetChangeProv.FieldByName('BLOCK_SALDO_END').AsInteger = 1) and (DataSetChangeProv.FieldByName('DATE_BLOK_SALDO_END').AsdateTime >= cxDateEdit2.date) and (s1 <> s2) then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.KASSA_ERROR_DAY_SALDO_END + DataSetChangeProv.FieldByName('DATE_BLOK_SALDO_END').AsString + #13;
        end else
            mes := mes + Un_R_file_Alex.KASSA_ERROR_DAY_SALDO_END + DataSetChangeProv.FieldByName('DATE_BLOK_SALDO_END').AsString + #13;
        flag_mes := true;
    end; }
    if flag = AddOrder then
    begin
        DataSetChangeProv.Close;
        DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SP_KASS WHERE ID_SP_KASS='+IntToStr(myclass.id_kas)+'';
        DataSetChangeProv.Open;
        if (DataSetChangeProv.FieldByName('BLOCK_SALDO_END').AsInteger = 1) and (DataSetChangeProv.FieldByName('DATE_BLOK_SALDO_END').AsdateTime >= cxDateEdit2.date) then
        begin
            if not flag_mes then
            begin
                MES := Un_R_file_Alex.KASSA_ERROR_DAY_SALDO_END + DataSetChangeProv.FieldByName('DATE_BLOK_SALDO_END').AsString + #13;
            end else
                mes := mes + Un_R_file_Alex.KASSA_ERROR_DAY_SALDO_END + DataSetChangeProv.FieldByName('DATE_BLOK_SALDO_END').AsString + #13;
            flag_mes := true;
        end;

        DataSetChangeProv.Close;
        DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_DT_DAY WHERE ID_DT_DAY='+IntToStr(myclass.id_d)+'';
        DataSetChangeProv.Open;

        if (DataSetChangeProv.FieldByName('BLOK_DEBET').AsInteger = 1) then
        begin
            if not flag_mes then
            begin
                MES := Un_R_file_Alex.KASSA_ERROR_DAY_ADD_OBOROT_DEB + #13;
            end else
                mes := mes + Un_R_file_Alex.KASSA_ERROR_DAY_ADD_OBOROT_DEB + #13;
            flag_mes := true;
        end;
        if (DataSetChangeProv.FieldByName('BLOK_KREDIT').AsInteger = 1) then
        begin
            if not flag_mes then
            begin
                MES := Un_R_file_Alex.KASSA_ERROR_DAY_ADD_OBOROT_KRED + #13;
            end else
                mes := mes + Un_R_file_Alex.KASSA_ERROR_DAY_ADD_OBOROT_KRED + #13;
            flag_mes := true;
        end;
    end;
    if flag = ChangeOrder then
    begin
        s1 := myform.DataSetMain.FieldByName('SUMMA_DOC').AsFloat;
        DataSetChangeProv.Close;
        DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SP_KASS WHERE ID_SP_KASS='+IntToStr(myclass.id_kas)+'';
        DataSetChangeProv.Open;
        if (DataSetChangeProv.FieldByName('BLOCK_SALDO_END').AsInteger = 1) and (DataSetChangeProv.FieldByName('DATE_BLOK_SALDO_END').AsdateTime >= cxDateEdit2.date) and (s1 <> s2) then
        begin
            if not flag_mes then
            begin
                MES := Un_R_file_Alex.KASSA_ERROR_DAY_SALDO_END + DataSetChangeProv.FieldByName('DATE_BLOK_SALDO_END').AsString + #13;
            end else
                mes := mes + Un_R_file_Alex.KASSA_ERROR_DAY_SALDO_END + DataSetChangeProv.FieldByName('DATE_BLOK_SALDO_END').AsString + #13;
            flag_mes := true;
        end;
        DataSetChangeProv.Close;
        DataSetChangeProv.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_DT_DAY WHERE ID_DT_DAY='+IntToStr(myclass.id_d)+'';
        DataSetChangeProv.Open;
        if (DataSetChangeProv.FieldByName('BLOK_DEBET').AsInteger = 1) and (s1 <> s2) then
        begin
            if not flag_mes then
            begin
                MES := Un_R_file_Alex.KASSA_ERROR_DAY_CHANGE_OBOROT_DEB + #13;
            end else
                mes := mes + Un_R_file_Alex.KASSA_ERROR_DAY_CHANGE_OBOROT_DEB + #13;
            flag_mes := true;
        end;
        if (DataSetChangeProv.FieldByName('BLOK_KREDIT').AsInteger = 1) and (s1 <> s2) then
        begin
            if not flag_mes then
            begin
                MES := Un_R_file_Alex.KASSA_ERROR_DAY_CHANGE_OBOROT_KRED + #13;
            end else
                mes := mes + Un_R_file_Alex.KASSA_ERROR_DAY_CHANGE_OBOROT_KRED + #13;
            flag_mes := true;
        end;
    end;

    if flag_mes then
    begin
        T.Free;
        showmessage(mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_DONT_CREATE);
        cxmemo2.text := mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_DONT_CREATE;
        PageControl2.ActivePage := TabSheet3;
        cxSplitter2.OpenSplitter;
        flag_all_doc_change_ok := false;
        exit;
    end;

    id_session := Class_Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
    if cxTextEditAddNum.Text = ''
        then ADD_NUMBER_DOC := 0
        else ADD_NUMBER_DOC := StrToInt(cxTextEditAddNum.Text);
    //добавление
    if flag = AddOrder then
    begin   
        Class_StoredProc.Database    := Class_Database;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Class_DataSet.Database       := Class_Database;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;
        kod_dd     := false;
        kod_dddddd := false;
        try kod_dog_d := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value; except kod_dog_d := -1; end;
        RxMemoryDataSaveAll.First;
        while not RxMemoryDataSaveAll.Eof do
        begin
            try
            begin
                kod_dog_n  := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                kod_dddddd := true;
                d_kod_dog  := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                d_id_dog   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
            end;
            except kod_dog_n := -1; end;
            if kod_dog_d <> kod_dog_n then kod_dd := true;
            RxMemoryDataSaveAll.Next;
        end;
        if kod_dd then
        begin
            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SYS_DATA';
            Class_DataSet.Open;
            try id_customer := TFIBBCDField(Class_DataSet.FieldByName('UNKNOWN_ID_CUST')).AsInt64; except id_customer := -1; end;
            Class_DataSet.Close;
        end else
            if kod_dddddd then
            begin
                d_kod_dog  := -1;
                d_id_dog   := -1;
                try
                begin
                    kod_dog_n  := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                    kod_dddddd := true;
                    d_kod_dog  := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                    d_id_dog   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                end;
                except
                    begin
                        d_kod_dog  := -1;
                        d_id_dog   := -1;
                    end;

                end;
                if (d_kod_dog >0) and (d_id_dog > 0) then
                begin

                    g                    := TSpravParams.Create;
                    o                    := TSpravParams.Create;
                    g['DataBase']        := Integer(Class_Database.Handle);
                    g['ReadTransaction'] := Integer(Class_Transaction_Wr.Handle);
                    g['ID_DOG']          := d_id_dog;
                    g['KOD_DOG']         := d_kod_dog;
                    GetDogovorInfo(Self, @g, @o);
                    try id_customer := o['ID_CUSTOMER']; except id_customer := -1; end;
                    g.Free;
                    o.Free;
                end;
                if id_customer = -1 then
                begin
                    Class_DataSet.Close;
                    Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SYS_DATA';
                    Class_DataSet.Open;
                    try id_customer := TFIBBCDField(Class_DataSet.FieldByName('UNKNOWN_ID_CUST')).AsInt64; except id_customer := -1; end;
                    Class_DataSet.Close;
                end;
            end;
        if (saveAll) or (myform.flag_proverka_to_buff = 1) then
        begin
            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text := 'select * from KASSA_ALL_DOC_INSERT('+IntToStr(myform.id_day)+', '+IntToStr(myform.prihod)+', '''+cxTextEditNum.text+''', '+IntToStr(ADD_NUMBER_DOC)+', '''+cxMRUEditFio.Text+''', '''+cxMemo1.Text+''', '+IntToStr(myform.id_operation)+', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+Inttostr(j)+', '+ IntTostr(id_man) + ', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntTostr(0)+', '+IntTostr(0)+', '''+GetCompName+''')';
            Class_DataSet.Open;
            id_all        := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
            //id_doc_add    := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
            date_provodka := Class_DataSet.FieldByName('TODAY').AsDateTime;
            Class_DataSet.Close;

            RxMemoryDataSaveAll.First;
            for i:=1 to RxMemoryDataSaveAll.RecordCount do
            begin
                Class_StoredProc.StoredProcName:='KASSA_DOC_ALL_PROV_INSERT';
                Class_StoredProc.Prepare;
                Class_StoredProc.ParamByName('D_ID_DT_DOC').AsInt64    := j;
                Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session;
                Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
                Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
                Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
                Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
                Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                Class_StoredProc.ParamByName('D_ID_MAN').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value;
                Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
//              Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value;
//              Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value;
                Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myclass.id_user;
                Class_StoredProc.ParamByName('D_ID_ALL_DOC').AsInt64   := id_all;
                Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
                Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
                if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value = null
                    then Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := 0
                    else Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value;
                Class_StoredProc.ParamByName('D_PRIHOD').AsInteger     := myform.prihod;
                Class_StoredProc.ParamByName('D_DAY').AsDate           := cxDateEdit2.Date;
                Class_StoredProc.ExecProc;

                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_MAIN_SCH_INFO('''+DateToStr(date_provodka)+''', '''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''')';
                Class_DataSet.Open;
                ttt        := TFIBBCDField(Class_DataSet.FieldByName('ID_SYSTEM')).AsInteger;
                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_SYSTEM where ID_SYSTEM='+IntToStr(ttt)+'';
                Class_DataSet.Open;
                if (Class_DataSet.FieldByName('CHECK_ID_MEN').AsInteger =1) and (RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <=0) then
                begin
                    T.Free;
                    showmessage(RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString + ': ' + Un_R_file_Alex.ERROR_MAN_PROV);
                    flag_all_doc_change_ok := false;
                    exit;
                end;
                if (Class_DataSet.FieldByName('CHECK_DOG').AsInteger =1) and ((RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value <=0) or (RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <= 0))then
                begin
                    T.Free;
                    showmessage(RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString + ': ' + Un_R_file_Alex.ERROR_DOG_PROV);
                    flag_all_doc_change_ok := false;
                    exit;
                end;
                if prih = 1 then
                begin
                    Class_DataSet.Close;
                    Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_CHECK_PROP_BY_OBJ('+IntToStr(19)+', '''+cxDateEdit2.Text+''', '''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''')';
                    Class_DataSet.Open;
                    if (Class_DataSet.FieldByName('RESULT_VALUE').AsInteger =1) and (RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <=0) then
                    begin
                        T.Free;
                        showmessage(RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString + ': ' + Un_R_file_Alex.ERROR_MAN_PROV);
                        flag_all_doc_change_ok := false;
                        exit;
                    end;
                    Class_DataSet.Close;
                end;
                if prih = 0 then
                begin
                    Class_DataSet.Close;
                    Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_CHECK_PROP_BY_OBJ('+IntToStr(20)+', '''+cxDateEdit2.Text+''', '''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''')';
                    Class_DataSet.Open;
                    if (Class_DataSet.FieldByName('RESULT_VALUE').AsInteger =1) and (RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <=0) then
                    begin
                        T.Free;
                        showmessage(RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString + ': ' + Un_R_file_Alex.ERROR_MAN_PROV);
                        flag_all_doc_change_ok := false;
                        exit;
                    end;
                    Class_DataSet.Close;
                end;
                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text:='select * from KASSA_PROVERKA_DOG_IN_ORDER('+IntToStr(myform.id_operation)+')';
                Class_DataSet.Open;
                try nal_dog := Class_DataSet.FBN('NAL_DOG').AsInteger except nal_dog := -1; end;
                if nal_dog = 1 then
                begin
                    if RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <> StrToInt64(Class_DataSet.FBN('KOD_DOG').AsString) then
                    begin
                        T.Free;
                        if StrToInt64(Class_DataSet.FBN('KOD').AsString) = 50 then ShowMessage(RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString + ': ' + Un_R_file_Alex.KASSA_PROV_NALICHEE_DOG_OBUCH);
                        if StrToInt64(Class_DataSet.FBN('KOD').AsString) = 70 then ShowMessage(RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString + ': ' + Un_R_file_Alex.KASSA_PROV_NALICHEE_DOG_STUD);
                        flag_all_doc_change_ok := false;
                        Exit;
                    end;
                end;
                Class_DataSet.Close;
                RxMemoryDataSaveAll.Next;
            end;
        end;
        Class_Transaction_Wr.Commit;

        j := 0;

        Class_StoredProc.Database    := Class_Database;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Class_DataSet.Database       := Class_Database;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        ErrorProvsDataSet.Transaction := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;
        Class_DataSet.Close;
        try
            // добавление шапки
//            DecimalSeparator := '.';
            Class_DataSet.SQLs.SelectSQL.Text := 'select * from KASSA_DOC_INSERT('+IntToStr(myform.id_day)+', '+IntToStr(myform.prihod)+', '''+cxTextEditNum.Text+''', '+IntToStr(ADD_NUMBER_DOC)+', '''+cxMRUEditFio.Text+''', '''+copy(cxMemo1.Text, 1, 149)+''', '+IntToStr(myform.id_operation)+', '''+StringReplace(cxTextEditSumma.Text,',','.',[])+''', '+Inttostr(id_all)+', '+ IntTostr(id_man) + ', '+intToStr(myclass.id_user)+', '''+cxTextEdit5.Text+''', '''+cxTextEdit6.Text+''')';
            Class_DataSet.Open;
            j := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
            cxTextEditNum.Text    := Class_DataSet.FieldByName('VIH_NUM').AsString;
            cxTextEditAddNum.Text := Class_DataSet.FieldByName('VIH_ADD_NUM').AsString;
            Class_DataSet.Close;
            id_doc_add:=j;
            // добавление моих проводок
            if j > 0 then
            begin
                if (not RxMemoryDataSaveAll.IsEmpty) then
                begin
                    RxMemoryDataSaveAll.First;
                    for i:=1 to RxMemoryDataSaveAll.RecordCount do
                    begin
                        Class_StoredProc.StoredProcName:='KASSA_DOC_PROV_INSERT';
                        Class_StoredProc.Prepare;
                        Class_StoredProc.ParamByName('D_ID_DT_DOC').AsInt64    := j;
                        Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                        Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
                        Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
                        Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
                        Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
                        Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                        Class_StoredProc.ParamByName('D_ID_MAN').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value;
                        Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                        Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := 0;//RxMemoryDataSave.FieldByName('RxMemDatsumma_value').Value;
                        Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := 0;//RxMemoryDataSave.FieldByName('RxMemDatid_value').Value;
                        Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                        Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myclass.id_user;
                        Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
                        Class_StoredProc.ExecProc;
                        RxMemoryDataSaveAll.Next;
                    end;
                end;
            end else
            begin
                T.Free;
                Class_Transaction_Wr.Rollback;
                flag_all_doc_change_ok := false;
                exit;
            end;
        if (myform.flag_proverka_to_buff=1) and (not SaveAll) then
        begin

          //проверка у Ярика
            STRU.DBHANDLE      := Class_Database.Handle;
            STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
            STRU.KERNEL_ACTION := 1;
            STRU.KEY_SESSION   := id_session;
            STRU.WORKDATE      := date_provodka;
            STRU.ID_USER       := myclass.id_user;
            STRU.DO_FLAG       := 0;
            try
                DoResult:=Kernel.KernelDoEx(@STRU);
            except on E:Exception do
                begin
                    T.Free;
                    Class_Transaction_Wr.Rollback;
                    ShowMessage(Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_KERNEL + ' ' + E.Message);
                    flag_all_doc_change_ok := false;
                    exit;
                end;
            end;
            if not DoResult then
            begin
                T.Free;
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
                    if (RxMemoryDataSaveAll.Locate('RxMemoryDataSaveAll_ID_PROV', StrToint64(ErrorProvsDataSet.fbn('ID_PROV').AsString), [])) then
                    begin
                        name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString;
                        ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                    end else
                    begin
                        name_prov := '';
                        ssum      := '';
                    end;
                    RxError.Open;
                    RxError.Insert;
                    RxError.FieldByName('RxKod').Value    := ErrorProvsDataSet.fbn('ID_ERROR').AsString;
                    RxError.FieldByName('ID_PROV').Value  := StrToint64(ErrorProvsDataSet.fbn('ID_PROV').AsString);
                    RxError.FieldByName('RxName').Value   := ErrorProvsDataSet.fbn('ERROR_MESSAGE').AsString + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                    RxError.Post;
                    ErrorProvsDataSet.Next;
                end;
                Class_Transaction_Wr.Rollback;
                DecimalSeparator := ',';
                flag_all_doc_change_ok := false;
                exit;
            end;
        end;

            // ДОБАВЛЕНИЕ ДОКУМЕНТА
        if SaveAll then
        begin
            Class_StoredProc.StoredProcName:='KASSA_UPDATE_NUM_DOC';
            Class_StoredProc.Prepare;
            if (cxTextEditAddNum.Text = '') or (cxTextEditAddNum.Text = '0')
                then Class_StoredProc.ParamByName('D_NUM_DOC').AsString    := cxTextEditNum.Text
                else Class_StoredProc.ParamByName('D_NUM_DOC').AsString    := cxTextEditNum.Text + '/' + cxTextEditAddNum.Text;
            Class_StoredProc.ParamByName('D_ID_SESSION').AsInt64  := id_session;
            Class_StoredProc.ExecProc;

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
                    T.Free;
                    Class_Transaction_Wr.Rollback;
                    ShowMessage(Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_KERNEL + ' ' + E.Message);
                    flag_all_doc_change_ok := false;
                    exit;
                end;
            end;
            if not DoResult then
            begin
                T.Free;
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
                    if (RxMemoryDataSaveAll.Locate('RxMemoryDataSaveAll_ID_PROV', StrToint64(ErrorProvsDataSet.fbn('ID_PROV').AsString), [])) then
                    begin
                        name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString;
                        ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                    end else
                    begin

                    end;
                    RxError.Open;
                    RxError.Insert;
                    RxError.FieldByName('RxKod').Value    := ErrorProvsDataSet.fbn('ID_ERROR').AsString;
                    RxError.FieldByName('ID_PROV').Value  := StrToint64(ErrorProvsDataSet.fbn('ID_PROV').AsString);
                    RxError.FieldByName('RxName').Value   := ErrorProvsDataSet.fbn('ERROR_MESSAGE').AsString + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                    RxError.Post;
                    ErrorProvsDataSet.Next;
                end;
                Class_Transaction_Wr.Rollback;
                DecimalSeparator := ',';
                flag_all_doc_change_ok := false;
                exit;
            end;
        end;
            T.Free;
            Class_StoredProc.StoredProcName:='KERNEL_CLEAR_TMP'; //удаление
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('KEY_SESSION').AsInt64  := id_session;
            Class_StoredProc.ExecProc;

            Class_Transaction_Wr.Commit;
            DecimalSeparator := ',';
            myform.ActionRefreshExecute(self);
            Myform.DataSetMain.Locate('ID_DT_DOC', j, []);
            close;
        except on E:EFibError do
            begin
                T.Free;
                DecimalSeparator := ',';
                Class_Transaction_Wr.Rollback;
                if (E.IBErrorCode = 335544345) and (count_error > 5) then
                begin
                    MessageBox(Handle, PChar(Un_R_file_Alex.MY_ERROR_DEADLOCK_TRANSACTION), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
                    exit;
                end;
                if E.IBErrorCode = 335544345 then
                begin
                    count_error := count_error + 1;
                    MySave;
                end
                else
                    ShowMessage(E.Message);
                flag_all_doc_change_ok := false;
                exit;
            end
        end;
    end;

//изменение
    if (flag = ChangeOrder)  then
    begin
        Class_StoredProc.Database    := Class_Database;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Class_DataSet.Database       := Class_Database;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;
        kod_dd     := false;
        kod_dddddd := false;
        try kod_dog_d := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value; except kod_dog_d := -1; end;
        RxMemoryDataSaveAll.First;
        while not RxMemoryDataSaveAll.Eof do
        begin
            try
            begin
                kod_dog_n  := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                kod_dddddd := true;
                d_kod_dog  := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                d_id_dog   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
            end;
            except kod_dog_n := -1; end;
            if kod_dog_d <> kod_dog_n then kod_dd := true;
            RxMemoryDataSaveAll.Next;
        end;
        if kod_dd then
        begin
            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SYS_DATA';
            Class_DataSet.Open;
            id_customer := TFIBBCDField(Class_DataSet.FieldByName('UNKNOWN_ID_CUST')).AsInt64;
            Class_DataSet.Close;
        end else
            if kod_dddddd then
            begin
                d_kod_dog  := -1;
                d_id_dog   := -1;
                try
                begin
                    kod_dog_n  := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                    kod_dddddd := true;
                    d_kod_dog  := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                    d_id_dog   := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                end;
                except
                begin
                    d_kod_dog  := -1;
                    d_id_dog   := -1;
                end;
                end;
                if (d_kod_dog >0) and (d_id_dog > 0) then
                begin
                    g                    := TSpravParams.Create;
                    o                    := TSpravParams.Create;
                    g['DataBase']        := Integer(Class_Database.Handle);
                    g['ReadTransaction'] := Integer(Class_Transaction_Wr.Handle);
                    g['ID_DOG']          := d_id_dog;
                    g['KOD_DOG']         := d_kod_dog;
                    GetDogovorInfo(Self, @g, @o);
                    try id_customer := o['ID_CUSTOMER']; except id_customer := -1; end;
                    g.Free;
                    o.Free;
                end;
                if id_customer = -1 then
                begin
                    Class_DataSet.Close;
                    Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SYS_DATA';
                    Class_DataSet.Open;
                    try id_customer := TFIBBCDField(Class_DataSet.FieldByName('UNKNOWN_ID_CUST')).AsInt64; except id_customer := -1; end;
                    Class_DataSet.Close;
                end;

            end;
        if (saveAll) or (myform.flag_proverka_to_buff = 1) then
        begin
            Class_DataSet.Close;
            Class_DataSet.Sqls.SelectSQL.Text := 'Select * from KASSA_SELECT_ALL_DOC('''+myform.DataSetMain.FBN('ID_DT_DOC').AsString+''')';
            Class_DataSet.Open;
            try id_all_doc := StrToInt64(Class_DataSet.FBN('R_ID_ALL_DOC').AsString) except id_all_doc := 0; end; 
            Class_DataSet.Close;
            if id_all_doc > 0
                then Class_DataSet.SQLs.SelectSQL.Text := 'select * from KASSA_ALL_DOC_INSERT('+IntToStr(myform.id_day)+', '+IntToStr(myform.prihod)+', '''+cxTextEditNum.text+''', '+IntToStr(ADD_NUMBER_DOC)+', '''+cxMRUEditFio.Text+''', '''+cxMemo1.Text+''', '+IntToStr(myform.id_operation)+', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+Inttostr(j)+', '+ IntTostr(id_man) + ', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntTostr(1)+', '+IntTostr(id_all_doc)+', '''+GetCompName+''')'
                else Class_DataSet.SQLs.SelectSQL.Text := 'select * from KASSA_ALL_DOC_INSERT('+IntToStr(myform.id_day)+', '+IntToStr(myform.prihod)+', '''+cxTextEditNum.text+''', '+IntToStr(ADD_NUMBER_DOC)+', '''+cxMRUEditFio.Text+''', '''+cxMemo1.Text+''', '+IntToStr(myform.id_operation)+', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+Inttostr(j)+', '+ IntTostr(id_man) + ', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntTostr(0)+', '+IntTostr(0)+', '''+GetCompName+''')';
            Class_DataSet.Open;
            if id_all_doc > 0
                then id_all := id_all_doc
                else id_all := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
            date_provodka := Class_DataSet.FieldByName('TODAY').AsDateTime;
            Class_DataSet.Close;
            j := myform.DataSetMain['ID_DT_DOC'];
            RxMemoryDataSaveAll.First;
            while not RxMemoryDataSaveAll.eof do
            begin
                Class_StoredProc.StoredProcName := 'KASSA_DOC_ALL_PROV_INSERT';
                Class_StoredProc.Prepare;
                Class_StoredProc.ParamByName('D_ID_DT_DOC').AsInt64             := j;
                Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64           := id_session;
                Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble            := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                Class_StoredProc.ParamByName('D_ID_SM').AsInt64                 := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
                Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64               := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
                Class_StoredProc.ParamByName('D_ID_ST').AsInt64                 := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
                Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64               := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
                if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value <> null
                    then Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value
                    else Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := 0;
                Class_StoredProc.ParamByName('D_ID_MAN').AsInt64                := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value;
                Class_StoredProc.ParamByName('D_ID_SCH').AsInt64                := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
//                  Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value;
//                  Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value;
                if RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <> null
                    then Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value
                    else Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := 0;
                Class_StoredProc.ParamByName('D_ID_USER').AsInt64               := myclass.id_user;
                Class_StoredProc.ParamByName('D_ID_ALL_DOC').AsInt64            := id_all;
                Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64          := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
                if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value <> null
                    then Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value
                    else Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := Class_Database.Gen_Id('KERNEL_GEN_ID', 1);
                if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value = null
                    then Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := 0
                    else Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value;
                Class_StoredProc.ParamByName('D_PRIHOD').AsInteger              := myform.prihod;
                Class_StoredProc.ParamByName('D_DAY').AsDate                    := cxDateEdit2.Date;
                Class_StoredProc.ExecProc;

                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_MAIN_SCH_INFO('''+DateToStr(date_provodka)+''', '''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''')';
                Class_DataSet.Open;
                ttt        := Class_DataSet.FieldByName('ID_SYSTEM').AsInteger;
                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_SYSTEM where ID_SYSTEM='+IntToStr(ttt)+'';
                Class_DataSet.Open;
                if (Class_DataSet.FieldByName('CHECK_ID_MEN').AsInteger =1) and (RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <=0) then
                begin
                    T.Free;
                    showmessage(RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString + ': ' + Un_R_file_Alex.ERROR_MAN_PROV);
                    flag_all_doc_change_ok := false;
                    exit;
                end;
                if (Class_DataSet.FieldByName('CHECK_DOG').AsInteger =1) and ((RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value <=0) or (RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <= 0))then
                begin
                    T.Free;
                    showmessage(RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString + ': ' + Un_R_file_Alex.ERROR_DOG_PROV);
                    flag_all_doc_change_ok := false;
                    exit;
                end;
                Class_DataSet.Close;
                if prih = 1 then
                begin
                    Class_DataSet.Close;
                    Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_CHECK_PROP_BY_OBJ('+IntToStr(19)+', '''+cxDateEdit2.Text+''', '''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''')';
                    Class_DataSet.Open;
                    if (Class_DataSet.FieldByName('RESULT_VALUE').AsInteger =1) and (RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <=0) then
                    begin
                        T.Free;
                        showmessage(RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString + ': ' + Un_R_file_Alex.ERROR_MAN_PROV);
                        flag_all_doc_change_ok := false;
                        exit;
                    end;
                    Class_DataSet.Close;
                end;
                if prih = 0 then
                begin
                    Class_DataSet.Close;
                    Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_CHECK_PROP_BY_OBJ('+IntToStr(20)+', '''+cxDateEdit2.Text+''', '''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''')';
                    Class_DataSet.Open;
                    if (Class_DataSet.FieldByName('RESULT_VALUE').AsInteger =1) and (RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <=0) then
                    begin
                        T.Free;
                        showmessage(RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString + ': ' + Un_R_file_Alex.ERROR_MAN_PROV);
                        flag_all_doc_change_ok := false;
                        exit;
                    end;
                    Class_DataSet.Close;
                end;
                Class_DataSet.Close;
                Class_DataSet.SQLs.SelectSQL.Text:='select * from KASSA_PROVERKA_DOG_IN_ORDER('+IntToStr(myform.id_operation)+')';
                Class_DataSet.Open;
                try nal_dog := Class_DataSet.FBN('NAL_DOG').AsInteger except nal_dog := -1; end;
                if nal_dog = 1 then
                begin
                    if RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <> StrToInt64(Class_DataSet.FBN('KOD_DOG').AsString) then
                    begin
                        T.Free;
                        if StrToInt64(Class_DataSet.FBN('KOD').AsString) = 50 then ShowMessage(RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString + ': ' + Un_R_file_Alex.KASSA_PROV_NALICHEE_DOG_OBUCH);
                        if StrToInt64(Class_DataSet.FBN('KOD').AsString) = 70 then ShowMessage(RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString + ': ' + Un_R_file_Alex.KASSA_PROV_NALICHEE_DOG_STUD);
                        flag_all_doc_change_ok := false;
                        Exit;
                    end;
                end;
                Class_DataSet.Close;
                RxMemoryDataSaveAll.Next;
            end;
        end;
        Class_Transaction_Wr.Commit;

        Class_StoredProc.Database     := Class_Database;
        Class_StoredProc.Transaction  := Class_Transaction_Wr;
        Class_DataSet.Database        := Class_Database;
        Class_DataSet.Transaction     := Class_Transaction_Wr;
        ErrorProvsDataSet.Transaction := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;
        Class_DataSet.Close;
        Class_DataSet.Sqls.SelectSQL.Text := 'Select * from KASSA_SELECT_ALL_DOC('''+myform.DataSetMain.FBN('ID_DT_DOC').AsString+''')';
        Class_DataSet.Open;
        try id_all_doc := StrToInt64(Class_DataSet.FBN('R_ID_ALL_DOC').AsString) except id_all_doc := 0; end;
        if (id_all_doc>0) and (StrToInt64(myform.DataSetMain.FBN('ID_ALL_DOC').AsString)=0) then
        begin
            T.Free;
            Class_Transaction_Wr.Rollback;
            DecimalSeparator := ',';
            myform.ActionRefreshExecute(self);
            Myform.DataSetMain.Locate('ID_DT_DOC', j, []);
            close;
            exit;
        end;

        try
            DecimalSeparator := '.';
//            if cxTextEditAddNum.Text <> ''
//                then ADD_NUMBER_DOC := StrToInt(cxTextEditAddNum.Text)
//                else ADD_NUMBER_DOC := 0;
            //изменение шапки
//            IF (myform.DataSetMain.FieldByName('OSNOVANIE').AsString           <> cxMemo1.Text) or
//               (TFIBBCDField(myform.DataSetMain.FieldByName('ID_MAN')).AsInt64 <> id_man ) or
//               (cxMRUEditFio.Text <> myform.DataSetMain.FieldByName('FIO').AsString) or
//               (myform.DataSetMain.FieldByName('NUMBER_DOC').AsString          <> cxTextEditNum.Text) or
//               (myform.DataSetMain.FieldByName('ADD_NUMBER_DOC').AsInteger     <> ADD_NUMBER_DOC) or
//               (myform.DataSetMain.FieldByName('SUMMA_DOC').AsString           <> StringReplace(cxTextEditSumma.Text,',','.',[]))
//            then
//            begin
                Class_DataSet.Close;
                if cxTextEditAddNum.Text <> ''
                    then Class_DataSet.SQLs.SelectSQL.Text := 'select * from KASSA_DOC_UPDATE('+IntToStr(j)+', '''+myform.DataSetMain.fbn('ID_DT_DAY').AsString+''', '''+myform.DataSetMain.fbn('PRIHOD_RASHOD').AsString+''', '''+cxTextEditNum.Text+''', '''+cxTextEditAddNum.Text+''', '''+cxMRUEditFio.Text+''', '''+copy(cxMemo1.Text, 1, 149)+''', '''+myform.DataSetMain.fbn('ID_OPERATION').AsString+''', '''+StringReplace(cxTextEditSumma.Text,',','.',[])+''', '+IntToStr(id_all)+', '+IntToStr(id_man)+', '+IntToStr(myclass.id_user)+', '''+cxTextEdit5.Text+''', '''+cxTextEdit6.Text+''')'
                    else Class_DataSet.SQLs.SelectSQL.Text := 'select * from KASSA_DOC_UPDATE('+IntToStr(j)+', '''+myform.DataSetMain.fbn('ID_DT_DAY').AsString+''', '''+myform.DataSetMain.fbn('PRIHOD_RASHOD').AsString+''', '''+cxTextEditNum.Text+''', '+IntToStr(0)+', '''+cxMRUEditFio.Text+''', '''+copy(cxMemo1.Text, 1, 149)+''', '''+myform.DataSetMain.fbn('ID_OPERATION').AsString+''', '''+StringReplace(cxTextEditSumma.Text,',','.',[])+''', '+IntToStr(id_all)+', '+IntToStr(id_man)+', '+IntToStr(myclass.id_user)+', '''+cxTextEdit5.Text+''', '''+cxTextEdit6.Text+''')';
                Class_DataSet.Open;
//            end;
            Class_StoredProc.StoredProcName := 'KASSA_PROV_DELETE';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('D_ID_DT_DOC').AsInt64        := myform.DataSetMain['ID_DT_DOC'];
            Class_StoredProc.ParamByName('D_ID_ALL_DOC').AsInt64       := ID_ALL_DOC;
            Class_StoredProc.ExecProc;
            RxMemoryDataSaveAll.First;
            for i:=1 to RxMemoryDataSaveAll.RecordCount do
            begin
                Class_StoredProc.StoredProcName := 'KASSA_DOC_PROV_INSERT';
                Class_StoredProc.Prepare;
                Class_StoredProc.ParamByName('D_ID_DT_DOC').AsInt64              := j;
                Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble             := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                Class_StoredProc.ParamByName('D_ID_SM').AsInt64                  := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
                Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64                := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
                Class_StoredProc.ParamByName('D_ID_ST').AsInt64                  := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
                Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64                := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
                if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value <> null
                    then Class_StoredProc.ParamByName('D_ID_DOG').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value
                    else Class_StoredProc.ParamByName('D_ID_DOG').AsInt64        := 0;
                Class_StoredProc.ParamByName('D_ID_MAN').AsInt64                 := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value;
                Class_StoredProc.ParamByName('D_ID_SCH').AsInt64                 := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                if RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value <> null
                    then Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsVariant := RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value
                    else Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsVariant := 0;
                if RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value <> null
                    then Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value
                    else Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64      := 0;
                if RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <> null
                    then Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value
                    else Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64       := 0;
                Class_StoredProc.ParamByName('D_ID_USER').AsInt64                := myclass.id_user;
                Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64           := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
                Class_StoredProc.ExecProc;
                RxMemoryDataSaveAll.Next;
            end;
            //изменение документа
            if SaveAll then
            begin
            // апдайт данных в ал_прове
                STRU.DBHANDLE := Class_Database.Handle;
                STRU.TRHANDLE := Class_Transaction_Wr.Handle;
                STRU.WORKDATE := date_provodka;
                IF id_all_doc > 0
                    then STRU.KERNEL_ACTION := 3
                    else STRU.KERNEL_ACTION := 1;
                STRU.KEY_SESSION   := id_session;
                STRU.PK_ID         := id_all;
                STRU.ID_USER       := myclass.id_user;
                if (myform.flag_proverka_to_buff=1) and (not SaveAll) then
                begin
                    STRU.DO_FLAG   := 0;
                end;
                try
                    if (myform.flag_proverka_to_buff=1) and (not SaveAll) then
                    begin
                        DoResult := Kernel.KernelDoEx(@STRU);
                    end else
                        DoResult := Kernel.KernelDo(@STRU);
                except on E:Exception do
                begin
                    T.Free;
                    Class_Transaction_Wr.Rollback;
                    ShowMessage(Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_KERNEL+E.Message);
                    DecimalSeparator := ',';
                    flag_all_doc_change_ok := false;
                    exit;
                end;
                end;
                if not DoResult then
                begin
                    cxSplitter2.OpenSplitter;
                    PageControl1.ActivePage := TabSheet3;
                    cxMemo2.Lines.Clear;
                    cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_DOC);
                    ErrorList:=Kernel.GetDocErrorsList(@STRU);
                    if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ERROR+ErrorList.Strings[i]);
                    ErrorProvsDataSet.Close;
                    ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                    ErrorProvsDataSet.Open;
                    ErrorProvsDataSet.FetchAll;
                    ErrorProvsDataSet.First;
                    RxError.EmptyTable;
                    while not ErrorProvsDataSet.Eof do
                    begin
                        if (RxMemoryDataSaveAll.Locate('RxMemoryDataSaveAll_ID_PROV', StrToint64(ErrorProvsDataSet.fbn('ID_PROV').AsString), [])) then
                        begin
                            name_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldSmRzStK').AsString;
                            ssum      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString;
                        end else
                        begin
                            name_prov := '';
                            ssum      := '';
                        end;
                        RxError.Open;
                        RxError.Insert;
                        RxError.FieldByName('RxKod').Value    := ErrorProvsDataSet.fbn('ID_ERROR').AsString;
                        RxError.FieldByName('ID_PROV').Value  := StrToint64(ErrorProvsDataSet.fbn('ID_PROV').AsString);
                        RxError.FieldByName('RxName').Value   := ErrorProvsDataSet.fbn('ERROR_MESSAGE').AsString + ' (' + name_prov + ' ' + Un_R_file_Alex.MY_NA_SUMMU + ' ' + ssum + '  )';
                        RxError.Post;
                        ErrorProvsDataSet.Next;
                    end;

                    ErrorProvsDataSet.Close;
                    ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION_ex)+')';
                    ErrorProvsDataSet.Open;
                    ErrorProvsDataSet.First;
                    while not ErrorProvsDataSet.Eof do
                    begin
                        RxError.Open;
                        RxError.Insert;
                        RxError.FieldByName('RxKod').Value    := ErrorProvsDataSet.FieldByName('ID_ERROR').AsString;
                        RxError.FieldByName('ID_PROV').Value  := StrToint64(ErrorProvsDataSet.fbn('ID_PROV').AsString);
                        RxError.FieldByName('RxName').Value   := ErrorProvsDataSet.FieldByName('ERROR_MESSAGE').AsString;
                        RxError.Post;
                        ErrorProvsDataSet.Next;
                    end;
                    Class_Transaction_Wr.Rollback;
                    T.Free;
                    flag_all_doc_change_ok := false;
                    DecimalSeparator := ',';
                    exit;
                end;
                Class_StoredProc.StoredProcName:='KERNEL_CLEAR_TMP'; //удаление
                Class_StoredProc.Prepare;
                Class_StoredProc.ParamByName('KEY_SESSION').AsInt64  := id_session;
                Class_StoredProc.ExecProc;
                T.Free;
                Class_Transaction_Wr.Commit;
                DecimalSeparator := ',';
                myform.ActionRefreshExecute(self);
                Myform.DataSetMain.Locate('ID_DT_DOC', j, []);
                close;
                exit;
            end;
            Class_StoredProc.StoredProcName:='KERNEL_CLEAR_TMP'; //удаление
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('KEY_SESSION').AsInt64  := id_session;
            Class_StoredProc.ExecProc;
            T.Free;
            Class_Transaction_Wr.Commit;
            myform.ActionRefreshExecute(self);
            Myform.DataSetMain.Locate('ID_DT_DOC', j, []);
            DecimalSeparator := ',';
            close;
            exit;
        except on E:EFibError do begin
            T.Free;
            DecimalSeparator := ',';
            flag_all_doc_change_ok := false;
            Class_Transaction_Wr.Rollback;
//            Class_Transaction_Wr.Commit;
            if (E.IBErrorCode = 335544345) and (count_error > 5) then
            begin
                MessageBox(Handle, PChar(Un_R_file_Alex.MY_ERROR_DEADLOCK_TRANSACTION), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
                exit;
            end;
            if E.IBErrorCode = 335544345 then
            begin
                count_error := count_error + 1;
                MySave;
            end
            else
                ShowMessage(E.Message);
            exit;
        end
        end;
    end;
end;
    flag_afterscroll := true;
end;

procedure TfmKassOrder.ActionSAVEExecute(Sender: TObject);
begin
    SaveAll := false;
    MySave;
end;

procedure TfmKassOrder.ActionSaveAllExecute(Sender: TObject);
begin
    SaveAll := true;
    MySave;
    try
        Class_StoredProc.Database := Class_Database;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Class_StoredProc.Transaction.StartTransaction;
        Class_StoredProc.StoredProcName := 'KASSA_UPD_ID_USER_BUHG';
        Class_StoredProc.Prepare;
        if (id>0) then
           Class_StoredProc.ParamByName('d_id_all_doc').AsInt64        := id
        else
           Class_StoredProc.ParamByName('d_id_all_doc').AsInt64        := id_doc_add;
        Class_StoredProc.ParamByName('d_id_user_po_buhg').AsInt64   := myclass.id_user;
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
      except on E:Exception do
      begin
          showmessage(E.Message);
          Class_Transaction_Wr.Rollback;
          exit;
      end;
     end;
end;

procedure TfmKassOrder.cxGridSaveAllDBTableView1DblClick(Sender: TObject);
begin
    ActionChangeExecute(Sender);
end;

procedure TfmKassOrder.cxGridSaveDBTableView1DblClick(Sender: TObject);
begin
    ActionChangeExecute(Sender);
end;

procedure TfmKassOrder.RxMemoryDataSaveAllAfterScroll(DataSet: TDataSet);
var
   i, o : TSpravParams;
begin
    if flag_afterscroll then
    begin
    if not RxMemoryDataSaveAll.IsEmpty then
    begin
        cxTextEdit1.Text := '';
        cxTextEdit2.Text := '';
        cxTextEdit3.Text := '';
        cxTextEdit4.Text := '';
        cxTextEdit1.Text := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').AsString;
        cxTextEdit2.Text := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').AsString;
        cxTextEdit3.Text := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').AsString;
        if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant > 0 then
        begin
            try cxTextEdit4.Text := Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldType_Dog').AsString + '; №  '+RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').AsString + ' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').AsString + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldReg_Dog').AsString+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').AsString; except cxTextEdit4.Text := ''; end;
          try
            i := TSpravParams.Create;
            o := TSpravParams.Create;
            i['DataBase'] := Integer(Class_Database.Handle);
            i['ReadTransaction'] := Integer(Class_Database.DefaultTransaction.Handle);
            i['ID_DOG']  := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant;
            i['KOD_DOG'] := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').AsVariant;
            GetDogovorInfo(Self, @i, @o);
                if o['DOG_TYPE'] = 1 then  {студгородок}
                    cxTextEdit4.Text := Un_R_file_Alex.KASSA_FIO_PROJIV + o['FIO_COMBO'] + Un_R_file_Alex.KASSA_REG_N+o['REGEST_NUM'] + Un_R_file_Alex.KASSA_OT_D + DateToStr(o['D_DOG']) + Un_R_file_Alex.KASSA_NAME_CUS + o['NAME_CUSTOMER'];
                if o['DOG_TYPE'] = 2 then   {обучение}
                    cxTextEdit4.Text := Un_R_file_Alex.KASSA_FIO_OBUCH + o['FIO_COMBO'] + Un_R_file_Alex.KASSA_DOG_N+ '' + o['NUM_DOG']+' ) '  + Un_R_file_Alex.KASSA_REG_N+o['REGEST_NUM'] + Un_R_file_Alex.KASSA_OT_D + DateToStr(o['D_DOG']) + Un_R_file_Alex.KASSA_NAME_CUS + o['NAME_CUSTOMER'];
            i.Free;
            o.Free;
          except
            i.Free;
            o.Free;
          end;
        end;
    end;
    end;
end;

function TfmKassOrder.SelectNDS(sum: double; who: integer): double;
var
    s : double;
begin
    s := (sum*NDS/(100+NDS));
    if who = 1 then
    begin
        result := sum - s;
    end;
    if who = 2 then
    begin
        result := s;
    end;
end;


procedure TfmKassOrder.cxTextEditSummaEnter(Sender: TObject);
var
    pr : integer;
begin
    pr := 0;
    cxTextEditSumma.Text := AddNol(cxTextEditSumma.Text, pr);
end;

procedure TfmKassOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DecimalSeparator := ',';
end;

procedure TfmKassOrder.ActionShowAllExecute(Sender: TObject);
begin
    flag_afterscroll := false;
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
                    'id_rate - ' + IntToStr(id_rate)+#13+
                    'id_rate_n - ' +IntToStr(id_rate_n)+#13+
                    'id_customer - ' +IntToStr(id_customer)+#13+
                    'id - ' + RxMemoryDataSaveAll.FieldByName('id').Asstring+#13+
                    'type_dog - ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldType_Dog').AsString +#13+
                    'num_dog - ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').AsString  +#13+
                    'date_dog - ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').AsString +#13+
                    'reg_dog - ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldReg_Dog').AsString  +#13+
                    'name_cust - ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').AsString
                    );
        RxMemoryDataSaveAll.Next;
    end;
    flag_afterscroll := true;
end;

procedure TfmKassOrder.cxGridSaveAllDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
   i, o : TSpravParams;
begin
    if (flag_afterscroll) and (RxMemoryDataSaveAll.RecordCount = 1) then
    begin
    if not RxMemoryDataSaveAll.IsEmpty then
    begin
        cxTextEdit1.Text := '';
        cxTextEdit2.Text := '';
        cxTextEdit3.Text := '';
        cxTextEdit4.Text := '';
        cxTextEdit1.Text := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_raz').AsString;
        cxTextEdit2.Text := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_st').AsString;
        cxTextEdit3.Text := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTitle_kekv').AsString;

        if RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant > 0 then
        begin
            try cxTextEdit4.Text := Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldType_Dog').AsString + '; №  '+RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNum_dog').AsString + ' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDate_dog').AsString + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldReg_Dog').AsString+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').AsString; except cxTextEdit4.Text := ''; end;
          try
            i := TSpravParams.Create;
            o := TSpravParams.Create;
            i['DataBase'] := Integer(Class_Database.Handle);
            i['ReadTransaction'] := Integer(Class_Database.DefaultTransaction.Handle);
            i['ID_DOG']  := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant;
            i['KOD_DOG'] := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').AsVariant;
            GetDogovorInfo(Self, @i, @o);
                if o['DOG_TYPE'] = 1 then  {студгородок}
                    cxTextEdit4.Text := Un_R_file_Alex.KASSA_FIO_PROJIV + o['FIO_COMBO'] + Un_R_file_Alex.KASSA_REG_N+o['REGEST_NUM'] + Un_R_file_Alex.KASSA_OT_D + DateToStr(o['D_DOG']) + Un_R_file_Alex.KASSA_NAME_CUS + o['NAME_CUSTOMER'];
                if o['DOG_TYPE'] = 2 then   {обучение}
                    cxTextEdit4.Text := Un_R_file_Alex.KASSA_FIO_OBUCH + o['FIO_COMBO'] + Un_R_file_Alex.KASSA_DOG_N+ '' + o['NUM_DOG']+' ) '  + Un_R_file_Alex.KASSA_REG_N+o['REGEST_NUM'] + Un_R_file_Alex.KASSA_OT_D + DateToStr(o['D_DOG']) + Un_R_file_Alex.KASSA_NAME_CUS + o['NAME_CUSTOMER'];
            i.Free;
            o.Free;
          except
            i.Free;
            o.Free;
          end;
        end;
    end;
    end;
end;

procedure TfmKassOrder.cxGridDBTableView2DblClick(Sender: TObject);
begin
    try
        RxMemoryDataSaveAll.Locate('RxMemoryDataSaveAll_ID_PROV', RxError.FieldByName('ID_PROV').AsVariant, []);
    finally
    end;
end;

procedure TfmKassOrder.ActionShowDocPeopleExecute(Sender: TObject);
var
    res : integer;
begin
    if (flag <> AddOrder) then
    //Info_doc_show(self, Class_Database, StrToInt64(myform.DataSetMain.FieldByName('ID_ALL_DOC').AsString));
        res := Un_lo_file_Alex.LHistoryInfoShow(self, myclass.id_user, Class_Database, id);

end;

end.




