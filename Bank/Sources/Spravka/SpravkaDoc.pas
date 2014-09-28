unit SpravkaDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar, cxButtonEdit, cxMemo,
  StdCtrls, cxMRUEdit, Un_R_file_Alex, dxBar, dxBarExtItems, MainSpravka,
  ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxSplitter, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLookAndFeelPainters, cxButtons, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, RxMemDS, Kernel, FIBQuery,
  pFIBQuery, pFIBStoredProc, pFIBErrorHandler, fib, cxCurrencyEdit,
  cxCheckBox, Placemnt,  BankNichSprav;

type
  TfmSpravMode = (AddSprav, ChangeSprav, ShowSprav);

  TOsnovSch = record
      id : int64;
      number : string;
      title  : string;
  end;
  TResSch = record
      TT : array of TOsnovSch;
  end;

  TfmSpravkaDoc = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxMemoComent: TcxMemo;
    cxLabel5: TcxLabel;
    cxTextEditNum: TcxTextEdit;
    cxLabel6: TcxLabel;
    DateTimePicker1: TDateTimePicker;
    cxLabel13: TcxLabel;
    cxLabel7: TcxLabel;
    cxDateEdit2: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxMRUEditFio: TcxMRUEdit;
    cxLabel10: TcxLabel;
    cxMemo1: TcxMemo;
    cxLabel14: TcxLabel;
    cxTextEditSumma: TcxTextEdit;
    GroupBox2: TGroupBox;
    cxLabel11: TcxLabel;
    cxTextEdit3: TcxTextEdit;
    cxLabel12: TcxLabel;
    cxLabel15: TcxLabel;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxSplitter1: TcxSplitter;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    DataSet1: TpFIBDataSet;
    TransactionRead: TpFIBTransaction;
    Class_Transaction_Wr: TpFIBTransaction;
    Database: TpFIBDatabase;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    cxSplitter2: TcxSplitter;
    cxMemo2: TcxMemo;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxDateEdit3: TcxDateEdit;
    RxMemoryDataSaveAll: TRxMemoryData;
    RxMemoryDataShow: TRxMemoryData;
    DataSourceShow: TDataSource;
    DataSourceSaveAll: TDataSource;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxGrid3DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn2: TcxGridDBColumn;
    cxTextEdit2: TcxTextEdit;
    cxLabel18: TcxLabel;
    cxTextEdit6: TcxTextEdit;
    cxTextEdit7: TcxTextEdit;
    cxTextEdit8: TcxTextEdit;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    ActionClose: TAction;
    ActionShowAllInfo: TAction;
    ActionSaveAll: TAction;
    Class_DataSet: TpFIBDataSet;
    Class_StoredProc: TpFIBStoredProc;
    ErrorProvsDataSet: TpFIBDataSet;
    DataSourceError: TDataSource;
    RxError: TRxMemoryData;
    pFibErrorHandler1: TpFibErrorHandler;
    cxLabelDate: TcxLabel;
    DataSet2: TpFIBDataSet;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn6: TcxGridDBColumn;
    DS: TpFIBDataSet;
    cxButton3: TcxButton;
    DSet: TpFIBDataSet;
    cxCheckBox1: TcxCheckBox;
    cxGrid2DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    AShowCountProv: TAction;
    cxTextEdit1: TcxTextEdit;
    cxButtonEditAuthor: TcxButtonEdit;
    cxTextEditSumCom: TcxTextEdit;
    cxLabel22: TcxLabel;
    Panel3: TPanel;
    FormStorage1: TFormStorage;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn8: TcxGridDBColumn;
    DataSetExpertSys: TpFIBDataSet;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarEdit1: TdxBarEdit;
    dxBarButton1: TdxBarButton;
    dxBarDellAll: TdxBarButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxButtonEditAuthorPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionShowAllInfoExecute(Sender: TObject);
    procedure ActionSaveAllExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    function  FindSpravInLastPeriod : boolean;
    procedure cxGrid2DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid2DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid2DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxButton3Click(Sender: TObject);
    procedure StudCity;
    procedure Sinhronizac;
    procedure cxGrid3DBTableView1DblClick(Sender: TObject);
    procedure DogTritiesNew;
    function DogNich(AOwner: TComponent; DBHANDLE : TpFIBDatabase; date_doc: TDate; num_doc, sum_doc, note: string; id_user : Integer; name_cust : string; prih : Integer) : boolean;
    procedure AShowCountProvExecute(Sender: TObject);
    procedure cxTextEditSumComKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Get_Info_dog(id_dog_in, kod_dog_in :int64; var ffio_out, n_cust_out,d_d_out,n_dog_out,reg_n_out,type_d_out : string; var dog_type_Out : integer);
    procedure dxBarDellAllClick(Sender: TObject);
  private
    id_man, id_session : int64;
    flag_aftoscroll : boolean;
    count_error : integer;
//    id_all_doc : int64;
    close_form, active_form, showafterAdd : boolean;
    use_expert_sys : integer;
    procedure ShowInfoDog(upGridP : integer);
  public
    id_rate, id_rate_n, id_customer : int64;
    buh_prov : integer;
    regimm : TfmSpravMode;
    myform : TfmMainSpravka;
    id_type_dog : integer;
    Prih : integer;
    add_prov : integer;
    id_dog_last, kod_dog_last : int64;
    num_doc_nich, sum_doc_nich, note_nich, fio_nich : string;
    date_nich : TDate;
    id_user_nich : Integer;
    constructor Create(AOwner: TComponent; m : TfmMainSpravka; tt : TfmSpravMode); reintroduce; overload;
  end;

implementation

uses DateUtils,
     Un_lo_file_Alex,
     DogLoaderUnit,
     Math,
     SpravkaAddChangeProv,
     Un_Progress_form,
     Un_func_file_Alex,
     AccMgmt,
     SpravkaUnitCaption,
     SpravkaInputSumma,
     SpravkaSelectDog,
     {uTreatiesDM
     ujbApplication,
     ujbTypes,
     ujbKernel,}
     ST_Loader_Unit,
     cn_Common_Loader,
     cn_Common_Types;

{$R *.dfm}

procedure TfmSpravkaDoc.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if close_form then
        CanClose := MessageBox(Handle,Pchar(SpravkaUnitCaption.DOC_CLOSE_DONT_SAVE), Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_OK), mb_YesNO)=mrYes;
end;

constructor TfmSpravkaDoc.Create(AOwner: TComponent; m: TfmMainSpravka; tt: TfmSpravMode);
var
    dd : TDate;
    id_ses, id_provvvv : int64;
    id_dog_s, kod_dog_s : int64;
    pr : integer;
    ffio_r, n_cust_r, d_d_r, n_dog_r, reg_n_r, type_d_r : string;
    dog_type_r : integer;
    id_sch_tmp     : int64;
    itt : integer;
    sch_name_tmp, sch_title_tmp : string;
begin
    inherited Create (AOwner);

    PageControl1.ActivePage := TabSheet1;
    showafterAdd := false;
    close_form := true;
    myform                               := m;
    flag_aftoscroll                      := false;
    regimm                               := tt;
    Database                             := m.Database;
    TransactionRead.DefaultDatabase      := Database;
    Database.DefaultTransaction          := TransactionRead;
    Class_Transaction_Wr.DefaultDatabase := Database;
    DataSet1.Database                    := Database;
    DataSet1.Transaction                 := TransactionRead;
    DataSet2.Database                    := Database;
    DataSet2.Transaction                 := TransactionRead;
    DSet.Database                        := Database;
    DSet.Transaction                     := TransactionRead;
    DataSetExpertSys.Database             := Database;
    DataSetExpertSys.Transaction          := TransactionRead;
    count_error                          := 0;
    TransactionRead.StartTransaction;
    cxSplitter1.CloseSplitter;
    cxSplitter2.CloseSplitter;
    sum_doc_nich := myform.sum_doc;

    DSet.Close;
    DSet.SQLs.SelectSQL.Text := 'select * from BANK_INI';
    DSet.Open;

    if(DSet['USE_EXPERT_SYSTEM']<>null) then
    use_expert_sys     := DSet.FieldByName('USE_EXPERT_SYSTEM').AsInteger else
    use_expert_sys     := 0;

    cxCheckBox1.Properties.Caption   := SpravkaUnitCaption.DOC_SPRAVKA_SHOW_PROV;
    if myform.kod_s = 2 then CAPTION := Un_R_file_Alex.BANK_ORDER;
    if myform.kod_s = 1 then CAPTION := SpravkaUnitCaption.DOC_SPRAVKA_NA_DOC;
    if myform.prih_doc = 1 then
    begin
        cxLabel1.Caption := SpravkaUnitCaption.DOC_ISP_DOC_D;
        if myform.kod_s = 2 then
        begin
            cxLabel9.Caption := Un_R_file_Alex.BANK_PRINYATO_OT;
            cxLabel5.Caption := Un_R_file_Alex.BANK_DOC_ORDER_PRIH_KAS_ORD;
        end;
        if myform.kod_s = 1 then
        begin
            cxLabel9.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_PRINYATO;
            cxLabel5.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_PRIH_KAS_ORD;
            GroupBox2.visible := false;
        end;
        cxGrid2DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_DEBET;
        cxGrid2DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_SCH_KORESPOND;
        cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_DEBET;
        cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_SCH_KORESPOND;
    end else
    begin
        cxLabel1.Caption := SpravkaUnitCaption.DOC_ISP_DOC_K;
        if myform.kod_s = 2 then
        begin
            cxLabel9.Caption := Un_R_file_Alex.BANK_PRINYATO_OT;
            cxLabel5.Caption := Un_R_file_Alex.BANK_DOC_ORDER_PRIH_KAS_ORD;
        end;
        if myform.kod_s = 1 then
        begin
            cxLabel9.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_PRINYATO;
            cxLabel5.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_PRIH_KAS_ORD;
        end;
        cxGrid2DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_KREDIT;
        cxGrid2DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_SCH_KORESPOND;
        cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_KREDIT;
        cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_SCH_KORESPOND;
    end;
    cxGrid2DBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_KOD_S_R_S_K;
    cxGrid2DBTableView1DBColumn4.Caption := Un_R_file_Alex.J4_NAME_SMETA;
    cxGrid2DBTableView1DBColumn5.Caption := Un_R_file_Alex.KASSA_SUMMA;
    cxGrid1DBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_KOD_S_R_S_K;
    cxGrid1DBTableView1DBColumn4.Caption := Un_R_file_Alex.J4_NAME_SMETA;
    cxGrid1DBTableView1DBColumn5.Caption := Un_R_file_Alex.KASSA_SUMMA;

    cxGrid1DBTableView1DBColumn7.Caption := SpravkaUnitCaption.STORNO;
    cxGrid2DBTableView1DBColumn7.Caption := SpravkaUnitCaption.STORNO;

    cxGrid1DBTableView1DBColumn8.Caption := SpravkaUnitCaption.DOC_N_DOG;
    cxGrid2DBTableView1DBColumn8.Caption := SpravkaUnitCaption.DOC_N_DOG;

    cxGrid3DBTableView1DBColumn1.Caption := Un_R_file_Alex.KOD_ERROR;
    cxGrid3DBTableView1DBColumn2.Caption := Un_R_file_Alex.KOD_WARNING;
    cxButton3.caption                    := Un_R_file_Alex.BANK_DOGOVOR;

    cxLabel2.Caption  := SpravkaUnitCaption.DOC_ZA;
    cxLabel3.Caption  := SpravkaUnitCaption.DOC_AUTHOR_SP;
    cxLabel4.Caption  := SpravkaUnitCaption.DOC_KOMENT_DOC;
    cxLabel16.Caption := SpravkaUnitCaption.DOC_TAB_NUM;
    TabSheet1.Caption := SpravkaUnitCaption.DOC_DATA_SP;
    TabSheet2.Caption := SpravkaUnitCaption.DOC_DATA_DOC;
    TabSheet3.Caption := SpravkaUnitCaption.DOC_INFO_PROV;
    TabSheet4.Caption := SpravkaUnitCaption.DOC_ERROR_DOC;
    TabSheet5.Caption := SpravkaUnitCaption.DOC_ERROR_PROV;
    cxLabel18.Caption := SpravkaUnitCaption.DOC_INFO_DOG;
    cxLabel19.Caption := Un_R_file_Alex.KASSA_RAZD;
    cxLabel20.Caption := Un_R_file_Alex.KASSA_STAT;
    cxLabel21.Caption := {SpravkaUnitCaption.KASSA_KEKV}'КЕКВ';
    cxLabel10.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxLabel14.Caption := Un_R_file_Alex.KASSA_SUMMA;
    GroupBox2.Caption := Un_R_file_Alex.BANK_P_S_NAME_CUSTOMER;
    cxLabel11.Caption := Un_R_file_Alex.BANK_R_S;
    cxLabel12.Caption := Un_R_file_Alex.BANK_MFO;
    cxLabel15.Caption := Un_R_file_Alex.BANK_BANK;
    cxLabel6.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    cxLabel13.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    ActionAdd.Caption := Un_R_file_Alex.MY_ACTION_ADD_CONST;
    ActionChange.Caption  := Un_R_file_Alex.MY_ACTION_UPDATE_CONST;
    ActionDelete.Caption  := Un_R_file_Alex.MY_ACTION_DELETE_CONST;
    ActionClose.Caption   := Un_R_file_Alex.MY_OK;
    ActionSaveAll.Caption := SpravkaUnitCaption.DOC_SAVE_SP;

        if myform.cxComboBox1.ItemIndex = 0  then cxLabelDate.Caption  := Un_R_file_Alex.MY_JANUARY;
        if myform.cxComboBox1.ItemIndex = 1  then cxLabelDate.Caption  := Un_R_file_Alex.MY_FEBRIARY;
        if myform.cxComboBox1.ItemIndex = 2  then cxLabelDate.Caption  := Un_R_file_Alex.MY_MARCH;
        if myform.cxComboBox1.ItemIndex = 3  then cxLabelDate.Caption  := Un_R_file_Alex.MY_APRILE;
        if myform.cxComboBox1.ItemIndex = 4  then cxLabelDate.Caption  := Un_R_file_Alex.MY_MAY;
        if myform.cxComboBox1.ItemIndex = 5  then cxLabelDate.Caption  := Un_R_file_Alex.MY_JUNE;
        if myform.cxComboBox1.ItemIndex = 6  then cxLabelDate.Caption  := Un_R_file_Alex.MY_JULY;
        if myform.cxComboBox1.ItemIndex = 7  then cxLabelDate.Caption  := Un_R_file_Alex.MY_AUGUST;
        if myform.cxComboBox1.ItemIndex = 8  then cxLabelDate.Caption  := Un_R_file_Alex.MY_SEPTEMBER;
        if myform.cxComboBox1.ItemIndex = 9  then cxLabelDate.Caption  := Un_R_file_Alex.MY_OCTOBER;
        if myform.cxComboBox1.ItemIndex = 10 then cxLabelDate.Caption  := Un_R_file_Alex.MY_NOVEMBER;
        if myform.cxComboBox1.ItemIndex = 11 then cxLabelDate.Caption  := Un_R_file_Alex.MY_DESEMBER;
        cxLabelDate.Caption  := cxLabelDate.Caption + ' ' + IntToStr(YearOf(myform.d)) + SpravkaUnitCaption.DOC_YEAR_SHORT;
        dd                   := StrToDate(myform.date_doc);
        DateTimePicker1.Date := dd;
        cxDateEdit2.Date     := dd;
        cxDateEdit3.Date     := myform.d;

    if regimm = AddSprav then
    begin
        add_prov :=1;
        cxTextEdit1.Text     := IntToStr(Database.Gen_Id('GEN_NUMBER_SPRAVKA', 1));

        cxButtonEditAuthor.Text := GetUserFio;
        id_man                  := GetUserIdMan;

        cxTextEditNum.Text   := myform.num_doc;
        cxMRUEditFio.Text    := myform.fio;
        cxMemo1.Text         := myform.note;
        cxTextEdit3.Text     := myform.name_r_s;
        cxTextEditSumma.Text := StringReplace(myform.sum_doc, '.', ',', [rfReplaceAll]);
        pr := 1;
        cxTextEditSumma.Text := AddNol(cxTextEditSumma.Text, pr);
        cxMemoComent.Text    := SpravkaUnitCaption.DOC_ISP_SP_PO_DOC + myform.num_doc + ' ' + Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' + myform.date_doc;
        cxTextEditSumCom.Text :=   cxTextEditSumma.Text;
        id_ses := Database.Gen_Id('KERNEL_GEN_ID', 1);

        DataSet1.Close;
        DataSet1.Sqls.selectSql.Text := 'select * from PUB_SPRAVKA_SELECT_STORNO_PROVS('+IntToStr(myform.pk)+', '+IntToStr(id_ses)+', '+IntToStr(myform.prih_doc)+')';
        DataSet1.Open;
        DataSet1.First;
        while not DataSet1.Eof do
        begin
            RxMemoryDataSaveAll.Open;
            RxMemoryDataSaveAll.Insert;
            if DataSet1['R_CHANGE'] = 1 then
            begin
                RxMemoryDataSaveAll.FieldByName('Change').Value                      := 1;
                RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value              := DataSet1['R_SUMMA'];
                id_provvvv                                                           := StrToInt64(DataSet1.FieldByName('R_ID_PROV').AsString);
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := id_provvvv;
            end else
            begin
                RxMemoryDataSaveAll.FieldByName('Change').Value                      := 0;
                RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value              := (-1)*DataSet1['R_SUMMA'];
                id_provvvv                                                           := Database.Gen_Id('KERNEL_GEN_ID', 1);
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := id_provvvv;
            end;
            if (DataSet1['R_STORNO'] = 1) and (DataSet1['R_CHANGE'] = 1) then
            begin
                RxMemoryDataSaveAll.FieldByName('Storno').Value                          := 1;
                RxMemoryDataSaveAll.FieldByName('Storno_monitor').Value                  := '!';
            end else
            begin
                RxMemoryDataSaveAll.FieldByName('Storno').Value                          := 0;
                RxMemoryDataSaveAll.FieldByName('Storno_monitor').Value                  := '';
            end;

            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                   := DataSet1['R_ID_SM'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                 := DataSet1['R_ID_RZ'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                   := DataSet1['R_ID_ST'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                 := DataSet1['R_ID_KEKV'];
            if DataSet1['R_ID_DOG'] <> null
                then RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value         := StrToInt64(DataSet1.fbn('R_ID_DOG').AsString)
                else RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value         := 0;
            if DataSet1['R_KOD_DOG'] <> null
                then RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value        := StrToInt64(DataSet1.fbn('R_KOD_DOG').AsString)
                else RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value        := 0;

            if (RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value>0)and(RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value>0) then
            begin
                 id_dog_s                := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                 kod_dog_s               := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                 id_dog_last             := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                 kod_dog_last            := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                 Get_Info_dog(id_dog_s, kod_dog_s, ffio_r, n_cust_r, d_d_r, n_dog_r, reg_n_r, type_d_r, dog_type_r);
                 if dog_type_r = 0 then   {другие}
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := '';
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := type_d_r;
                 end;
                 if (dog_type_r = 1) or (dog_type_r = 2) then
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := ffio_r;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := n_dog_r;
                 end;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value         := n_cust_r;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value          := strtodate(d_d_r);
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value           := reg_n_r;
           end;

            RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                  := DataSet1['R_ID_MAN'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                  := DataSet1['R_ID_SCH'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value  := DataSet1['R_ID_PAYER'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                 := DataSet1['R_NUM_SCH'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value     := DataSet1['R_TITLE_SCH'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value  := DataSet1['R_NUM_SCH_KOR'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                := DataSet1['R_TITLE_ST'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                := DataSet1['R_TITLE_RZ'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value               := DataSet1['R_TITLE_SM'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                := DataSet1['R_TITLE_KEKV'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := DataSet1['R_ID_KOR_SCH'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := DataSet1['R_NUM_SCH_KOR'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value     := DataSet1['R_NUM_SM'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := DataSet1['R_NUM_RZ'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := DataSet1['R_NUM_ST'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value      := DataSet1['R_NUM_KEKV'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := DataSet1.FieldByName('R_NUM_SM').AsString +'\'+ DataSet1.FieldByName('R_NUM_RZ').AsString +'\'+ DataSet1.FieldByName('R_NUM_ST').AsString +'\'+ DataSet1.FieldByName('R_NUM_KEKV').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldProvNote').Value    := DataSet1['R_NOTE_PROV'];
            RxMemoryDataSaveAll.Post;

            RxMemoryDataShow.Open;
            RxMemoryDataShow.Insert;
            RxMemoryDataShow.FieldByName('RxMemDat_summa').Value                     := DataSet1['R_SUMMA'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value        := StrToInt64(DataSet1.FieldByName('R_ID_PROV').AsString);
            RxMemoryDataShow.FieldByName('Change').Value                             := DataSet1['R_CHANGE'];
            RxMemoryDataShow.FieldByName('Storno').Value                             := 1;//DataSet1.FieldByName('R_STORNO').AsInteger;
            RxMemoryDataShow.FieldByName('Storno_monitor').Value                     := '!';
            RxMemoryDataShow.FieldByName('RxMemDatid_sm').Value                      := DataSet1['R_ID_SM'];
            RxMemoryDataShow.FieldByName('RxMemDatid_razd').Value                    := DataSet1['R_ID_RZ'];
            RxMemoryDataShow.FieldByName('RxMemDatid_st').Value                      := DataSet1['R_ID_ST'];
            RxMemoryDataShow.FieldByName('RxMemDatid_kekv').Value                    := DataSet1['R_ID_KEKV'];
            if not DataSet1.fbn('R_ID_DOG').IsNull
                then RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value            := StrToInt64(DataSet1.fbn('R_ID_DOG').AsString)
                else RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value            := 0;
            if not DataSet1.fbn('R_KOD_DOG').IsNull
                then RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Value           := StrToInt64(DataSet1.fbn('R_KOD_DOG').AsString)
                else RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Value           := 0;

            if (RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value>0)and(RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Value>0) then
            begin
                 id_dog_s             := RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value;
                 kod_dog_s            := RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Value;
                 Get_Info_dog(id_dog_s, kod_dog_s, ffio_r, n_cust_r, d_d_r, n_dog_r, reg_n_r, type_d_r, dog_type_r);
                 if dog_type_r = 0 then   {другие}
                 begin
                     RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := '';
                     RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := type_d_r;
                 end;
                 if (dog_type_r = 1) or (dog_type_r = 2) then
                 begin
                     RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := ffio_r;
                     RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := n_dog_r;
                 end;
                 RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value         := n_cust_r;
                 RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value          := strtodate(d_d_r);
                 RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value           := reg_n_r;
           end;
            RxMemoryDataShow.FieldByName('RxMemDatid_man').Value                     := DataSet1['R_ID_MAN'];
            RxMemoryDataShow.FieldByName('RxMemDatid_sch').Value                     := DataSet1['R_ID_SCH'];
            RxMemoryDataShow.FieldByName('RxMemDatNameSch').Value                    := DataSet1['R_NUM_SCH'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleSch').Value        := DataSet1['R_TITLE_SCH'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value     := DataSet1['R_NUM_SCH_KOR'];
            RxMemoryDataShow.FieldByName('RxMemDatNameStat').Value                   := DataSet1['R_TITLE_ST'];
            RxMemoryDataShow.FieldByName('RxMemDatNameRazd').Value                   := DataSet1['R_TITLE_RZ'];
            RxMemoryDataShow.FieldByName('RxMemDatNameSmeta').Value                  := DataSet1['R_TITLE_SM'];
            RxMemoryDataShow.FieldByName('RxMemDatNameKekv').Value                   := DataSet1['R_TITLE_KEKV'];
            RxMemoryDataShow.FieldByName('RxMemDatID_SCH_KORESPOND').Value           := DataSet1['R_ID_KOR_SCH'];
            RxMemoryDataShow.FieldByName('RxMemDatname_korespond').Value             := DataSet1['R_NUM_SCH_KOR'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodSmeta').Value        := DataSet1['R_NUM_SM'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodRazd').Value         := DataSet1['R_NUM_RZ'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodState').Value        := DataSet1['R_NUM_ST'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodKekv').Value         := DataSet1['R_NUM_KEKV'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value     := DataSet1.FieldByName('R_NUM_SM').AsString +'\'+ DataSet1.FieldByName('R_NUM_RZ').AsString +'\'+ DataSet1.FieldByName('R_NUM_ST').AsString +'\'+ DataSet1.FieldByName('R_NUM_KEKV').AsString;
            RxMemoryDataShow.FieldByName('priznak_niza').Value                       := 0;

            RxMemoryDataShow.Post;

            RxMemoryDataShow.Open;
            RxMemoryDataShow.Insert;
            RxMemoryDataShow.FieldByName('priznak_niza').Value                       := 1;
            RxMemoryDataShow.FieldByName('RxMemDat_summa').Value                     := (-1)*DataSet1['R_SUMMA'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value        := id_provvvv;
            RxMemoryDataShow.FieldByName('Change').Value                             := DataSet1['R_CHANGE'];
            RxMemoryDataShow.FieldByName('Storno').Value                             := 0;//DataSet1['R_STORNO'];
            RxMemoryDataShow.FieldByName('Storno_monitor').Value                     := '';
            RxMemoryDataShow.FieldByName('RxMemDatid_sm').Value                      := DataSet1['R_ID_SM'];
            RxMemoryDataShow.FieldByName('RxMemDatid_razd').Value                    := DataSet1['R_ID_RZ'];
            RxMemoryDataShow.FieldByName('RxMemDatid_st').Value                      := DataSet1['R_ID_ST'];
            RxMemoryDataShow.FieldByName('RxMemDatid_kekv').Value                    := DataSet1['R_ID_KEKV'];
            if not DataSet1.fbn('R_ID_DOG').IsNull
                then RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value            := StrToInt64(DataSet1.fbn('R_ID_DOG').AsString)
                else RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value            := 0;
            if not DataSet1.fbn('R_KOD_DOG').IsNull
                then RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Value           := StrToInt64(DataSet1.fbn('R_KOD_DOG').AsString)
                else RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Value           := 0;
            RxMemoryDataShow.FieldByName('RxMemDatid_man').Value                     := DataSet1['R_ID_MAN'];
            RxMemoryDataShow.FieldByName('RxMemDatid_sch').Value                     := DataSet1['R_ID_SCH'];
            RxMemoryDataShow.FieldByName('RxMemDatNameSch').Value                    := DataSet1['R_NUM_SCH'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleSch').Value        := DataSet1['R_TITLE_SCH'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value     := DataSet1['R_NUM_SCH_KOR'];
            RxMemoryDataShow.FieldByName('RxMemDatNameStat').Value                   := DataSet1['R_TITLE_ST'];
            RxMemoryDataShow.FieldByName('RxMemDatNameRazd').Value                   := DataSet1['R_TITLE_RZ'];
            RxMemoryDataShow.FieldByName('RxMemDatNameSmeta').Value                  := DataSet1['R_TITLE_SM'];
            RxMemoryDataShow.FieldByName('RxMemDatNameKekv').Value                   := DataSet1['R_TITLE_KEKV'];
            RxMemoryDataShow.FieldByName('RxMemDatID_SCH_KORESPOND').Value           := DataSet1['R_ID_KOR_SCH'];
            RxMemoryDataShow.FieldByName('RxMemDatname_korespond').Value             := DataSet1['R_NUM_SCH_KOR'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodSmeta').Value        := DataSet1['R_NUM_SM'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodRazd').Value         := DataSet1['R_NUM_RZ'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodState').Value        := DataSet1['R_NUM_ST'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodKekv').Value         := DataSet1['R_NUM_KEKV'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value     := DataSet1.FieldByName('R_NUM_SM').AsString +'\'+ DataSet1.FieldByName('R_NUM_RZ').AsString +'\'+ DataSet1.FieldByName('R_NUM_ST').AsString +'\'+ DataSet1.FieldByName('R_NUM_KEKV').AsString;
            RxMemoryDataShow.Post;
            DataSet1.Next;
        end;
    end;
    if (regimm = ChangeSprav) or (regimm = ShowSprav) then
    begin
        if (regimm = ChangeSprav) then add_prov :=1;
        cxTextEdit1.Text         := myform.MainDataSetSpravka.FieldByName('R_NUM_SPRAV').AsString;
        cxButtonEditAuthor.Text  := myform.MainDataSetSpravka.FieldByName('R_FIO').AsString;
        id_man                   := StrToInt64(myform.MainDataSetSpravka.FieldByName('R_ID_MAN').AsString);
        cxLabel17.Caption        := myform.MainDataSetSpravka.FieldByName('R_TN').AsString;   ;
        cxMemoComent.Text        := myform.MainDataSetSpravka.FieldByName('R_COMENT').AsString;
        cxTextEditNum.Text       := myform.MainDataSetSpravka.FieldByName('R_N_DOC').AsString;
        cxMRUEditFio.Text        := myform.MainDataSetSpravka.FieldByName('R_FIO_DOC').AsString;
        if myform.MainDataSetSpravka.FieldByName('R_PRIHOD').AsInteger = 1
            then cxTextEditSumma.Text       := myform.MainDataSetSpravka.FieldByName('R_SUM_DOC_PRIH').AsString
            else cxTextEditSumma.Text       := myform.MainDataSetSpravka.FieldByName('R_SUM_DOC_RAS').AsString;

        cxMemo1.Text       := myform.MainDataSetSpravka.FieldByName('R_NOTE_DOC').AsString;
        DataSet1.Close;
        DataSet1.Sqls.selectSql.Text := 'select * from KASSA_SELECT_ALL_PROV('''+myform.MainDataSetSpravkaR_ID_DOC.AsString+''', '+IntToStr(myform.prih_doc)+')';
        DataSet1.Open;
        DataSet1.First;
        itt := 1;
        while not DataSet1.Eof do
        begin
          if DataSet1.FieldByNAme('STORNO').AsInteger <> 1 then
          begin

           if DataSet1.FieldByName('RATE_ACC_NATIVE').AsVariant <> null
                then id_rate_n   := StrToInt64(DataSet1.FieldByName('RATE_ACC_NATIVE').AsString)
                else id_rate_n   := 0;

            if DataSet1.FieldByName('RATE_ACC').AsVariant <> null
                then id_rate     := StrToInt64(DataSet1.FieldByName('RATE_ACC').AsString)
                else id_rate     := 0;

            if DataSet1.FieldByName('ID_CUSTOMER').AsVariant <> null
                then id_customer := StrToInt64(DataSet1.FieldByName('ID_CUSTOMER').AsString)
                else id_customer := 0;
            RxMemoryDataSaveAll.Open;
            RxMemoryDataSaveAll.Insert;
            RxMemoryDataSaveAll.FieldByName('Change').Value                          := 0;
            RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value                  := DataSet1['SUMMA'];
            RxMemoryDataSaveAll.FieldByName('Storno').Value                          := 0;
            RxMemoryDataSaveAll.FieldByName('Storno_monitor').Value                  := '';
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value     := StrToInt64(DataSet1.FieldByName('ID_ALL_PROV').AsString);
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                   := DataSet1['ID_SM'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value                 := DataSet1['ID_RAZD'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                   := DataSet1['ID_ST'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value                 := DataSet1['ID_KEKV'];

            if DataSet1.fbn('ID_DOG').AsVariant<>null
            then
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                  := StrToInt64(DataSet1.fbn('ID_DOG').AsString)
            else
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value                 := 0;
            if DataSet1.fbn('KOD_DOG').AsVariant<>null
            then
                RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                 := StrToInt64(DataSet1.fbn('KOD_DOG').AsString)
            else
                RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value                 := 0;

            if (RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value>0)and(RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value>0) then
            begin
                 id_dog_s             := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                 kod_dog_s            := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                 id_dog_last             := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                 kod_dog_last            := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                 Get_Info_dog(id_dog_s, kod_dog_s, ffio_r, n_cust_r, d_d_r, n_dog_r, reg_n_r, type_d_r, dog_type_r);
                 if dog_type_r = 0 then   {другие}
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := '';
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := type_d_r;
                 end;
                 if (dog_type_r = 1) or (dog_type_r = 2) then
                 begin
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := ffio_r;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := n_dog_r;
                 end;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value         := n_cust_r;
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value          := strtodate(d_d_r);
                 RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value           := reg_n_r;
           end;



            RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value                  := DataSet1['ID_MAN'];

            RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value                  := DataSet1['ID_SCH'];

            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value                 := DataSet1['SCH_NUMBER'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value     := DataSet1['TITLE_SCH'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value  := DataSet1['TITLE_KOR_SCH'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                := DataSet1['TITLE_ST'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                := DataSet1['TITLE_RZ'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value               := DataSet1['TITLE_SM'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                := DataSet1['TITLE_KEKV'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value        := DataSet1['ID_KASS_SH'];
            RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value          := DataSet1['SCH_KASS_NUMBER'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value     := DataSet1['SMETA_KOD'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := DataSet1['RAZD_NUM'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := DataSet1['STAT_KOD'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value      := DataSet1['KEKV_KOD'];
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := DataSet1.FieldByName('SMETA_KOD').AsString +'\'+ DataSet1.FieldByName('RAZD_NUM').AsString +'\'+ DataSet1.FieldByName('STAT_KOD').AsString +'\'+ DataSet1.FieldByName('KEKV_KOD').AsString;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value  := DataSet1['ID_PAYER'];
            RxMemoryDataSaveAll.FieldByName('id').Value                              := itt;
            RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldProvNote').Value    := DataSet1['NOTE_PROV'];
            inc(itt);
            RxMemoryDataSaveAll.Post;
          end;
            RxMemoryDataShow.Open;
            RxMemoryDataShow.Insert;
            if DataSet1.FieldByNAme('STORNO').AsInteger = 1 then
            begin
                RxMemoryDataShow.FieldByName('priznak_niza').Value                   := 0;
                RxMemoryDataShow.FieldByName('Storno_monitor').Value                 := '!'
            end else
            begin
                RxMemoryDataShow.FieldByName('Storno_monitor').Value                 := '';
                RxMemoryDataShow.FieldByName('priznak_niza').Value                   := 1;
            end;
            RxMemoryDataShow.FieldByName('RxMemDat_summa').Value                     := DataSet1['SUMMA'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value        := StrToInt64(DataSet1.FieldByName('ID_ALL_PROV').AsString);
            RxMemoryDataShow.FieldByName('Change').Value                             := 0;
            RxMemoryDataShow.FieldByName('Storno').Value                             := DataSet1.fieldByName('STORNO').Asinteger;
            RxMemoryDataShow.FieldByName('RxMemDatid_sm').Value                      := DataSet1['ID_SM'];
            RxMemoryDataShow.FieldByName('RxMemDatid_razd').Value                    := DataSet1['ID_RAZD'];
            RxMemoryDataShow.FieldByName('RxMemDatid_st').Value                      := DataSet1['ID_ST'];
            RxMemoryDataShow.FieldByName('RxMemDatid_kekv').Value                    := DataSet1['ID_KEKV'];
            if DataSet1.fbn('ID_DOG').AsVariant<>null
            then
                RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value                  := StrToInt64(DataSet1.fbn('ID_DOG').AsString)
            else
                RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value                  := 0;
            if DataSet1.fbn('KOD_DOG').AsVariant<>null
            then
                RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Value                 := StrToInt64(DataSet1.fbn('KOD_DOG').AsString)
            else
                RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Value                 := 0;

            if (RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value>0)and(RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Value>0) then
            begin
                 id_dog_s             := RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value;
                 kod_dog_s            := RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Value;
             
                 Get_Info_dog(id_dog_s, kod_dog_s, ffio_r, n_cust_r, d_d_r, n_dog_r, reg_n_r, type_d_r, dog_type_r);
                 if dog_type_r = 0 then   {другие}
                 begin
                     RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := '';
                     RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := type_d_r;
                 end;
                 if (dog_type_r = 1) or (dog_type_r = 2) then
                 begin
                     RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := ffio_r;
                     RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := n_dog_r;
                 end;
                 RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value         := n_cust_r;
                 RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value          := strtodate(d_d_r);
                 RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value           := reg_n_r;
           end;


            RxMemoryDataShow.FieldByName('RxMemDatid_man').Value                     := DataSet1['ID_MAN'];
            RxMemoryDataShow.FieldByName('RxMemDatid_sch').Value                     := DataSet1['ID_SCH'];
            RxMemoryDataShow.FieldByName('RxMemDatNameSch').Value                    := DataSet1['SCH_NUMBER'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleSch').Value        := DataSet1['TITLE_SCH'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value     := DataSet1['TITLE_KOR_SCH'];
            RxMemoryDataShow.FieldByName('RxMemDatNameStat').Value                   := DataSet1['TITLE_ST'];
            RxMemoryDataShow.FieldByName('RxMemDatNameRazd').Value                   := DataSet1['TITLE_RZ'];
            RxMemoryDataShow.FieldByName('RxMemDatNameSmeta').Value                  := DataSet1['TITLE_SM'];
            RxMemoryDataShow.FieldByName('RxMemDatNameKekv').Value                   := DataSet1['TITLE_KEKV'];
            RxMemoryDataShow.FieldByName('RxMemDatID_SCH_KORESPOND').Value           := DataSet1['ID_KASS_SH'];
            RxMemoryDataShow.FieldByName('RxMemDatname_korespond').Value             := DataSet1['SCH_KASS_NUMBER'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodSmeta').Value        := DataSet1['SMETA_KOD'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodRazd').Value         := DataSet1['RAZD_NUM'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodState').Value        := DataSet1['STAT_KOD'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodKekv').Value         := DataSet1['KEKV_KOD'];
            RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value     := DataSet1.FieldByName('SMETA_KOD').AsString +'\'+ DataSet1.FieldByName('RAZD_NUM').AsString +'\'+ DataSet1.FieldByName('STAT_KOD').AsString +'\'+ DataSet1.FieldByName('KEKV_KOD').AsString;
            RxMemoryDataShow.Post;
            DataSet1.Next;
        end;

    end;
    if (regimm = ShowSprav) then
    begin
        Color             := clMoneyGreen;
        cxButton2.Enabled := false;
        Caption           := SpravkaUnitCaption.DOC_REG_SHOW;
        close_form        := false;
    end;
    flag_aftoscroll := true;
    active_form     := true;
    showafterAdd    := true;
end;


procedure TfmSpravkaDoc.Get_Info_dog(id_dog_in, kod_dog_in :int64; var ffio_out, n_cust_out,d_d_out,n_dog_out,reg_n_out,type_d_out : string; var dog_type_Out : integer);
var
     y, o : TSpravParams;
begin
     y                    := TSpravParams.Create;
     o                    := TSpravParams.Create;
     y['DataBase']        := Integer(Database.Handle);
     y['ReadTransaction'] := Integer(TransactionRead.Handle);
     y['ID_DOG']          := id_dog_in;
     y['KOD_DOG']         := kod_dog_in;
     GetDogovorInfo(Self, @y, @o);
     try ffio_out := o['FIO_COMBO']       except ffio_out     := ''; end;
     try n_cust_out := o['NAME_CUSTOMER'] except n_cust_out   := ''; end;
     try d_d_out := DateToStr(o['D_DOG']) except d_d_out      := ''; end;
     try n_dog_out := o['NUM_DOG']         except n_dog_out     := ''; end;
     try reg_n_out  := o['REGEST_NUM']    except reg_n_out    := ''; end;
     try type_d_out := o['N_DOG']         except type_d_out   := ''; end;
     try dog_type_Out   := o['DOG_TYPE']  except dog_type_Out := -1; end;
     y.Free;
     o.Free;
end;

procedure TfmSpravkaDoc.cxButtonEditAuthorPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
Var
    res : Variant;
begin
    res := Un_lo_file_Alex.mY_getManEx(self, database.Handle, False, false, -1);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null){ and (res[1]<>null) }then
        begin
            if id_man <> res[0] then
            begin
                id_man            := res[0];
                cxLabel17.Caption := '';
{                if myform.lang = 0 then
                begin
                    cxButtonEditAuthor.Text := res[1];//укр
                    fio_man           := res[1];
                end else
                begin
 }                   cxButtonEditAuthor.Text := res[5]+' '+res[6]+' '+res[7];//рус
//                    fio_man           := res[5]+' '+res[6]+' '+res[7];
//                end;
//                cxLabel8.Visible  := true;
                if res[9] <> null
                    then cxLabel17.Caption := res[9]
                    else cxLabel17.Caption := '';
                cxLabel17.Visible := true;
                cxLabel16.Visible := true;
{                if res[8] <> null
                    then cxLabel11.Caption := res[8]
                    else cxLabel11.Caption := '';
                cxLabel11.Visible := true;
                cxLabel12.Visible := true;
                cxLabel12.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_FROM_SP;
                cxLabel9.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_BIRTHDAY;
                cxLabel8.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_TIN;
 }
            end;
        end;
    end;
end;

procedure TfmSpravkaDoc.ActionAddExecute(Sender: TObject);
var
    OsnSch : TResSch;
    i : integer;
    id_smeta, id_stat, id_r, id_k, id_sch, id_man_prov, id_kor_sch, kod_dog, id_dog : int64;
    name_smeta, name_stat, name_r, name_k, name_sch, name_fio, name_kor_sch, date_dog, num_dog, name_cust, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, reg_dog, type_dog, note_prov : string;
    summa : double;
    summa_doc : double;
    id_prov, id_ras_nat, id_ras_cust, id_cust : int64;
    dd : TDateTime;
begin
    if regimm <> ShowSprav then
    begin
        add_prov := add_prov+1;
        showafterAdd := false;
        SetLength(OsnSch.tt, RxMemoryDataShow.RecordCount);
        i := 0;
        RxMemoryDataShow.First;
        while not RxMemoryDataShow.Eof do
        begin
            OsnSch.TT[i].id     := RxMemoryDataShow.fieldByName('RxMemDatid_sch').AsVariant;
            OsnSch.TT[i].Number := RxMemoryDataShow.FieldByName('RxMemDatNameSch').AsString;
            OsnSch.TT[i].title  := RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleSch').AsString;
            RxMemoryDataShow.Next;
        end;
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
        name_fio   := '';
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
        summa      := RoundTo(0 - summa_doc, -2);
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
        note_prov := '';
        if Show_Provodka_spravka(self, 0, Database, TransactionRead, AddProv, id_kor_sch, id_man_prov, id_sch, id_smeta, id_stat, id_r, id_k, summa, name_fio, name_sch, name_smeta, name_stat, name_r, name_k, name_kor_sch, id_dog, kod_dog, date_dog, num_dog, name_cust, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, type_dog, reg_dog, id_prov, id_ras_nat, id_ras_cust, id_cust, OsnSch, note_prov) then
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
             id_dog_last  := id_dog;
             kod_dog_last := kod_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value   := name_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value    := name_r;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value   := name_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value    := name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value                   := name_fio;
             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value      := id_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value        := name_kor_sch;
             if id_prov > 0
                then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := id_prov
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := Database.Gen_Id('KERNEL_GEN_ID', 1);
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value             := title_sm;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value              := title_rz;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value              := title_st;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value              := title_kekv;
             if date_dog <> ''
                then begin
                    if TryStrToDate(date_dog, dd)
                         then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value := StrToDate(date_dog)
                         else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value := null
                    end
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value      := null;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value        := num_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value           := title_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value        := title_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := name_cust;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value        := name_smeta + '\' + name_r + '\' + name_stat + '\' + name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value        := reg_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value       := type_dog;
             RxMemoryDataSaveAll.FieldByName('Storno').Value                                := 0;
             RxMemoryDataSaveAll.FieldByName('Change').Value                                := 0;
             RxMemoryDataSaveAll.Post;
        end;
        showafterAdd := true;
        Sinhronizac;
    end;
end;

procedure TfmSpravkaDoc.ActionDeleteExecute(Sender: TObject);
var
    id_prov : int64;
    RowSelected : integer;
begin
    if regimm <> ShowSprav then
    begin
      if (not RxMemoryDataSaveAll.IsEmpty) then
        if (MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_DELETE_PROV +' '+ RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').AsString), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes)  then
        begin
            if RxMemoryDataSaveAll.FieldByName('Storno').Value <> 1
                then
                begin
                    {id_prov := StrToInt64(RxMemoryDataSaveAll.FieldByNAme('RxMemoryDataSaveAll_ID_PROV').Asstring);
                    RxMemoryDataSaveAll.Delete;
                    RxMemoryDataShow.Locate('RxMemoryDataSaveAll_ID_PROV', id_prov, []);
                    RxMemoryDataShow.Delete;     }
                    id_prov := StrToInt64(RxMemoryDataSaveAll.FieldByNAme('RxMemoryDataSaveAll_ID_PROV').Asstring);
                    RowSelected := cxGrid1DBTableView1.DataController.FocusedRowIndex-1;
                    RxMemoryDataSaveAll.Delete;
                    RxMemoryDataShow.Locate('RxMemoryDataSaveAll_ID_PROV', id_prov, []);
                    //cxGrid1DBTableView1.DataController.FocusedRowIndex := RowSelected;
                    RxMemoryDataShow.Delete;

                end
                else Showmessage(SpravkaUnitCaption.DOC_STORNO_PROV);
        end;
    end;

end;


procedure TfmSpravkaDoc.ActionChangeExecute(Sender: TObject);
var
    id_kor_sch, id_man_prov, id_smeta, id_stat, id_r, id_k, id_sch, id_dog, kod_dog : int64;
    name_kor_sch, name_fio, name_smeta, name_stat, name_r, name_k, name_sch, date_dog, num_dog, name_cust, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, reg_dog, type_dog, note_prov : string;
    summa{, summa_doc} : double;
    id_prov, id_ras_nat, id_ras_cust, id_cust : int64;
    dd : TDateTime;
    OsnSch : TResSch;
    i : integer;
begin
    if not RxMemoryDataSaveAll.IsEmpty then
    begin
        SetLength(OsnSch.tt, RxMemoryDataShow.RecordCount);
        i := 0;
        RxMemoryDataShow.First;
        while not RxMemoryDataShow.Eof do
        begin
            OsnSch.TT[i].id     := RxMemoryDataShow.fieldByName('RxMemDatid_sch').AsVariant;
            OsnSch.TT[i].Number := RxMemoryDataShow.FieldByName('RxMemDatNameSch').AsString;
            OsnSch.TT[i].title  := RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleSch').AsString;
            RxMemoryDataShow.Next;
        end;
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
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value <> null
            then name_smeta := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value
            else name_smeta := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value <> null
            then name_stat  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value
            else name_stat  := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value <> null
            then name_r     := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value
            else name_r     := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value <> null
            then name_k     := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value
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
        if RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value <> null
            then title_sm := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value
            else title_sm := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value <> null
            then title_rz := RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value
            else title_rz := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value <> null
            then title_st := RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value
            else title_st := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value <> null
            then title_kekv := RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value
            else title_kekv := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value <> null
            then title_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value
            else title_sch := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value <> null
            then title_kor_sch := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value
            else title_kor_sch := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value <> null
            then date_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value
            else date_dog := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value <> null
            then num_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value
            else num_dog := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value <> null
            then name_cust := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value
            else name_cust := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value <> null
            then reg_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value
            else reg_dog := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value <> null
            then type_dog := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value
            else type_dog := '';
        if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldProvNote').Value <> null
            then note_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldProvNote').Value
            else note_prov := '';
        id_prov := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;

{        if RxMemoryDataSaveAll.FieldByName('id_ras_native').Value <> null
            then id_ras_nat := RxMemoryDataSaveAll.FieldByName('id_ras_native').Value
            else} id_ras_nat := 0;
{        if RxMemoryDataSaveAll.FieldByName('id_ras_customer').Value <> null
            then id_ras_cust := RxMemoryDataSaveAll.FieldByName('id_ras_customer').Value
            else} id_ras_cust := 0;
{        if RxMemoryDataSaveAll.FieldByName('id_customer').Value <> null
            then id_cust := RxMemoryDataSaveAll.FieldByName('id_customer').Value
            else} id_cust := 0;
        buh_prov := 1;
        if Show_Provodka_spravka(self, 0, Database, TransactionRead, ChangeProv, id_kor_sch, id_man_prov, id_sch, id_smeta, id_stat, id_r, id_k, summa, name_fio, name_sch, name_smeta, name_stat, name_r, name_k, name_kor_sch, id_dog, kod_dog, date_dog, num_dog, name_cust, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, type_dog, reg_dog, id_prov, id_ras_nat, id_ras_cust, id_cust, OsnSch, note_prov) then
        begin
             RxMemoryDataSaveAll.Open;
             RxMemoryDataSaveAll.Edit;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value      := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := summa;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := id_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := id_r;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := id_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := id_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := id_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := kod_dog;
             id_dog_last  := id_dog;
             kod_dog_last := kod_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value   := name_stat;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value    := name_r;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value   := name_smeta;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value    := name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := id_man_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value         := name_fio;
             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value              := id_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value                := name_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value           := id_prov;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value                     := title_sm;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value                      := title_rz;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value                      := title_st;
             RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value                      := title_kekv;
//             RxMemoryDataSaveAll.FieldByName('id_ras_native').Value                         := id_ras_nat;
//             RxMemoryDataSaveAll.FieldByName('id_ras_customer').Value                       := id_ras_cust;
//             RxMemoryDataSaveAll.FieldByName('id_customer').Value                           := id_cust;
             if date_dog <> ''
                then begin
                    if TryStrToDate(date_dog, dd)
                         then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value := StrToDate(date_dog)
                         else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value := null
                    end
                else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value      := null;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value        := num_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value           := title_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value        := title_kor_sch;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value      := name_cust;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value        := name_smeta + '\' + name_r + '\' + name_stat + '\' + name_k;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value        := reg_dog;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value       := type_dog;
//             RxMemoryDataSaveAll.FieldByName('Storno').Value                                := 0;
             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldProvNote').Value := note_prov;
             RxMemoryDataSaveAll.Post;
        end;
        Sinhronizac;
    end;
end;

procedure TfmSpravkaDoc.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmSpravkaDoc.ActionShowAllInfoExecute(Sender: TObject);
begin
  if cxGrid1DBTableView1.Focused then
  begin
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
                    'id_rate - ' + IntToStr(myform.id_rate_acc)+#13+
                    'id_rate_n - ' +IntToStr(myform.id_rate_acc_native)+#13+
                    'id_customer - ' +IntToStr(myform.id_costomer)+#13+
                    'Storno - ' + RxMemoryDataSaveAll.FieldByName('Storno').Asstring+#13+
                    'Change - ' + RxMemoryDataSaveAll.FieldByName('Change').Asstring+#13+
                    'Автор - ' +IntToStr(id_man));
        RxMemoryDataSaveAll.Next;
    end;
//    exit;
  end;
  if cxGrid2DBTableView1.Focused then
  begin
    RxMemoryDataShow.First;
    while not RxMemoryDataShow.Eof do
    begin
        showmessage('summa - ' + RxMemoryDataShow.FieldByName('RxMemDat_summa').Asstring+#13+
                    'id_sm - ' + RxMemoryDataShow.FieldByName('RxMemDatid_sm').Asstring+#13+
                    'id_razd - ' + RxMemoryDataShow.FieldByName('RxMemDatid_razd').Asstring+#13+
                    'id_st - ' + RxMemoryDataShow.FieldByName('RxMemDatid_st').Asstring+#13+
                    'id_kekv - ' + RxMemoryDataShow.FieldByName('RxMemDatid_kekv').Asstring+#13+
                    'id_dog - ' + RxMemoryDataShow.FieldByName('RxMemDatid_dog').Asstring+#13+
                    'kod_dog - ' + RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Asstring+#13+
                    'id_sch - ' + RxMemoryDataShow.FieldByName('RxMemDatid_sch').Asstring+#13+
                    'id_kor_sch - ' + RxMemoryDataShow.FieldByName('RxMemDatID_SCH_KORESPOND').Asstring+#13+
                    'id_man - ' + RxMemoryDataShow.FieldByName('RxMemDatid_man').Asstring+#13+
                    'id_rate - ' + IntToStr(myform.id_rate_acc)+#13+
                    'id_rate_n - ' +IntToStr(myform.id_rate_acc_native)+#13+
                    'id_customer - ' +IntToStr(myform.id_costomer)+#13+
                    'Storno - ' + RxMemoryDataShow.FieldByName('Storno').Asstring+#13+
                    'Change - ' + RxMemoryDataShow.FieldByName('Change').Asstring
                    );
        RxMemoryDataShow.Next;
    end;
  end;

end;

procedure TfmSpravkaDoc.ActionSaveAllExecute(Sender: TObject);
var
    mes, str1, note_d, date_dd, note : string;
    flag_mes : boolean;
    s1, S2, s3 : double;
//    ADD_NUMBER_DOC : INTEGER;
    I, l, ttt : integer;
    {j,} id_all, id_doc_old, id, kod : int64;
    STRU : kernel_mode_structure;
    errorList : TstringList;
    DoResult : boolean;
    T : TfmUn_Progress_form;
    date_document : TDate;
begin

if regimm <> ShowSprav then
begin
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.MY_SVERKA_DANNIH);
    T.Show;
    T.Update;
    mes := '';
    flag_mes := false;
    //проверка на корректность данных
    if cxButtonEditAuthor.Text = '' then
    begin
//        ShowMessage('Введите фамилию. Невозможно добавить документ!');
        mes := Un_R_file_Alex.J4_ADD_WARNING_FIO;
        cxButtonEditAuthor.SetFocus;
        cxButtonEditAuthor.style.Color := clred;
        FLAG_mes := TRUE;
    end ELSE
        cxButtonEditAuthor.style.Color := $00FFFBF0;

    if cxMemoComent.Text = '' then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.J4_ADD_WARNING_NOTE;
            cxMemoComent.SetFocus;
        end else
            MES := mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_NOTE;
        cxMemoComent.style.Color := clred;
        FLAG_mes := TRUE;
    end else
        cxMemoComent.style.Color := $00FFFBF0;

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

    if RxMemoryDataSaveAll.IsEmpty then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.KASSA_ERROR_ADD_PROV_;
        end else
            MES := mes + ' ' + Un_R_file_Alex.KASSA_ERROR_ADD_PROV_;
        FLAG_mes := TRUE;
    end;

        //проверка на суммы
   s2 := 0;
   s1 := 0;
   s3 := 0;

    if not RxMemoryDataShow.isEmpty then
    begin
        RxMemoryDataShow.First;
        while not RxMemoryDataShow.Eof do
        begin
            if RxMemoryDataShow.FieldByName('RxMemDat_summa').Value > 0 then
            s1 := s1 + RxMemoryDataShow.FieldByName('RxMemDat_summa').Value else
            s3 := s3 + RxMemoryDataShow.FieldByName('RxMemDat_summa').Value;
            s2 := s2 + RxMemoryDataShow.FieldByName('RxMemDat_summa').Value;
            RxMemoryDataShow.next;
        end;
    end;
    if abs(s2) >= 0.01 then
    begin
        if not flag_mes then
        begin
            //MES := Un_R_file_Alex.KASSA_DOC_ADD_SUMM_NOT_NOL;
            //Mes := Mes + ' (0 <> ' + FloatTostr(abs(s2))+' )';
            Mes := Mes + 'Сума проводок ' + CurrTostr(abs(s3)) + ' не збігається з сумою документа '+CurrTostr(abs(s1));//+cxTextEditSumma.Text;
        end else
            mes := mes + ' ' + Un_R_file_Alex.KASSA_DOC_ADD_SUMM_NOT_NOL;
        flag_mes := true;
    end;


    str1 := cxMemoComent.Text;

    cxMemoComent.Text := StringReplace(cxMemoComent.Text, '''', '''''', [rfReplaceAll]);
    cxButtonEditAuthor.Text := StringReplace(cxButtonEditAuthor.Text, '''', '''''', [rfReplaceAll]);

    if flag_mes then
    begin
        T.Free;
        showmessage(mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_DONT_CREATE);
        cxmemo2.text := mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_DONT_CREATE;
        PageControl2.ActivePage := TabSheet4;
        cxSplitter2.OpenSplitter;
        exit;
    end;
    id_session := Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

    //добавление
    if regimm = AddSprav then
    begin
        Class_StoredProc.Database    := Database;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Class_DataSet.Database       := Database;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        DS.Database                  := Database;
        DS.Transaction               := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;
        Class_DataSet.Close;
        Class_DataSet.Sqls.SelectSQL.Text := 'Select * from PUB_SPRAVKA_SELECT_MAX_DATE('''+cxDateEdit3.Text+''', '+IntToStr(myform.kod_s)+', '''+RxMemoryDataShow.FieldByNAme('RxMemDatid_sch').AsString+''')';
        Class_DataSet.Open;
        if Class_DataSet.FieldByNAme('R_RESULT').AsInteger = 0 then
        begin
            T.Free;
            Class_Transaction_Wr.Rollback;
            if myform.kod_s = 1
                then Showmessage(SpravkaUnitCaption.DOC_CLOSE_NOT_DATE_KASSA_1 + cxLabelDate.caption + SpravkaUnitCaption.DOC_CLOSE_NOT_DATE_KASSA_2);
            if myform.kod_s = 2
                then Showmessage(SpravkaUnitCaption.DOC_CLOSE_NOT_DATE_BANK_1 + cxLabelDate.caption + SpravkaUnitCaption.DOC_CLOSE_NOT_DATE_BANK_2);
            Exit;
        end else
            Date_Document := Class_DataSet.FieldByNAme('R_DATE').AsDateTime;
        Class_DataSet.Close;

        note_d       := cxMemo1.text;
        cxMemo1.Text := SpravkaUnitCaption.DOC_ISP_SP_SHORT+ cxLabel1.Caption + ' ' + cxTextEdit1.Text + ' ' + cxLabel2.caption + ' ' + cxLabelDate.Caption + SpravkaUnitCaption.DOC_NOTE_DOC_SP + note_d;
        note_d       := cxMemo1.text;
        note_d       := StringReplace(note_d, '''', '''''', [rfReplaceAll]);
        if length(note_d) > 255 then note_d := copy(note_d, 1, 255);
        cxMemo1.text := note_d;
        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'select id_doc from pub_dt_all_doc where pk_id='+intToStr(myform.pk)+'';
        Class_DataSet.OPen;
        id_doc_old    := StrToInt64(Class_DataSet.FieldByName('ID_DOC').AsString);
        Class_DataSet.Close;
        if id_customer=0 then id_customer := myform.id_costomer;
        if id_rate=0 then id_rate := myform.id_rate_acc;
        if id_rate_n=0 then id_rate_n := myform.id_rate_acc_native;
        DS.Close;
        if myform.kod_s = 2
            then DS.SQLs.SelectSQL.Text := 'SELECT R_ID FROM PUB_SPRAV_INSERT_DOC_BUFFER('''+DateToStr(Date_Document)+''', '+IntToStr(myform.prih_doc)+', '''+cxTextEditNum.text+''', :FIO, :OSNOVANIE,  ''' + INtToStr(0)+{StringReplace(cxTextEditSumma.Text,',','.',[]) +} ''', '+intToStr(myform.id_user)+', '+IntTostr(id_session)+', '+IntTostr(myform.id_rate_acc)+', '+IntTostr(myform.id_rate_acc_native)+', '+IntTostr(myform.id_costomer)+', '+IntTostr(1)+', '+IntTostr(id_doc_old)+', '''+GetCompName+''', '+IntToStr(2002)+', '''+cxDateEdit2.Text+''')';
            //then DS.SQLs.SelectSQL.Text := 'SELECT R_ID FROM PUB_SPRAV_INSERT_DOC_BUFFER('''+DateToStr(Date_Document)+''', '+IntToStr(myform.prih_doc)+', '''+cxTextEditNum.text+''', :FIO, :OSNOVANIE,  ''' + INtToStr(0)+{StringReplace(cxTextEditSumma.Text,',','.',[]) +} ''', '+intToStr(myform.id_user)+', '+IntTostr(id_session)+', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntTostr(1)+', '+IntTostr(id_doc_old)+', '''+GetCompName+''', '+IntToStr(2002)+', '''+cxDateEdit2.Text+''')';
        if myform.kod_s = 1
            //then DS.SQLs.SelectSQL.Text := 'SELECT R_ID FROM PUB_SPRAV_INSERT_DOC_BUFFER('''+DateToStr(Date_Document)+''', '+IntToStr(myform.prih_doc)+', '''+cxTextEditNum.text+''', :FIO, :OSNOVANIE,  ''' + IntToStr(0)+{StringReplace(cxTextEditSumma.Text,',','.',[]) +} ''', '+intToStr(myform.id_user)+', '+IntTostr(id_session)+', '+IntTostr(myform.id_rate_acc)+', '+IntTostr(myform.id_rate_acc_native)+', '+IntTostr(myform.id_costomer)+', '+IntTostr(1)+', '+IntTostr(id_doc_old)+', '''+GetCompName+''', '+IntToStr(1002)+', '''+cxDateEdit2.Text+''')';
              then DS.SQLs.SelectSQL.Text := 'SELECT R_ID FROM PUB_SPRAV_INSERT_DOC_BUFFER('''+DateToStr(Date_Document)+''', '+IntToStr(myform.prih_doc)+', '''+cxTextEditNum.text+''', :FIO, :OSNOVANIE,  ''' + IntToStr(0)+{StringReplace(cxTextEditSumma.Text,',','.',[]) +} ''', '+intToStr(myform.id_user)+', '+IntTostr(id_session)+', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntTostr(1)+', '+IntTostr(id_doc_old)+', '''+GetCompName+''', '+IntToStr(1002)+', '''+cxDateEdit2.Text+''')';
        DS.ParamByName('FIO').AsString       := cxMRUEditFio.Text;
        DS.ParamByName('OSNOVANIE').AsString := cxMemo1.Text;
        DS.Open;
        try id_all := StrToINt64(DS.FieldByName('R_ID').AsString); except id_all := -1; end;
     try
        RxMemoryDataSaveAll.First;
        While not RxMemoryDataSaveAll.Eof do
        begin
            Class_StoredProc.StoredProcName:='PUB_SPRAV_INSERT_PROV_BUFFER';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session;
            Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
            Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
            Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
            Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
            Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
            Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
            if not RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').IsNull
                then Class_StoredProc.ParamByName('D_ID_MAN').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value
                else Class_StoredProc.ParamByName('D_ID_MAN').AsInt64       := -1;
            Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
//              Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value;
//              Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value;
            Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
            Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myform.id_user;
            Class_StoredProc.ParamByName('D_ID_ALL_DOC').AsInt64   := id_doc_old;
            Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
            Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
            if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value = null
                then Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := 0
                else Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value;
            Class_StoredProc.ParamByName('D_PRIHOD').AsInteger     := myform.prih_doc;
            Class_StoredProc.ParamByName('D_DAY').AsDateTime       := cxDateEdit3.Date;
            Class_StoredProc.ParamByName('D_IS_MAIN').AsInteger    := 1;

            Class_StoredProc.ParamByName('D_STORNO').AsInteger     := RxMemoryDataSaveAll.FieldByName('Storno').Value;
            Class_StoredProc.ExecProc;
            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_MAIN_SCH_INFO('''+cxDateEdit3.Text+''', '''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''')';
            Class_DataSet.Open;
            ttt        := TFIBBCDField(Class_DataSet.FieldByName('ID_SYSTEM')).AsInteger;
            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_SYSTEM where ID_SYSTEM='+IntToStr(ttt)+'';
            Class_DataSet.Open;
            if (RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').IsNull) and (Class_DataSet.FieldByName('CHECK_ID_MEN').AsInteger =1) then
            begin
                T.Free;
                showmessage(Un_R_file_Alex.ERROR_MAN_PROV);
                exit;
            end else
            if (Class_DataSet.FieldByName('CHECK_ID_MEN').AsInteger =1) and (RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <=0) then
            begin
                T.Free;
                showmessage(Un_R_file_Alex.ERROR_MAN_PROV);
                exit;
            end;
            if ((RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').isNull) or (RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').isNull)) and (Class_DataSet.FieldByName('CHECK_DOG').AsInteger =1) then
            begin
                T.Free;
                showmessage(Un_R_file_Alex.ERROR_DOG_PROV);
                exit;
            end else
            begin
            id  := StrToInt64(RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsString);
            kod := StrToInt64(RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').AsString);
            if (Class_DataSet.FieldByName('CHECK_DOG').AsInteger =1) and ((id <= 0) or (kod <= 0))then
            begin
                T.Free;
                showmessage(Un_R_file_Alex.ERROR_DOG_PROV);
                exit;
            end;
            end;
            Class_DataSet.Close;
            RxMemoryDataSaveAll.Next;
        end;
        Class_Transaction_Wr.Commit;

        Class_StoredProc.Database     := Database;
        Class_StoredProc.Transaction  := Class_Transaction_Wr;
        Class_DataSet.Database        := Database;
        Class_DataSet.Transaction     := Class_Transaction_Wr;
        ErrorProvsDataSet.Transaction := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;

            // ДОБАВЛЕНИЕ ДОКУМЕНТА

            STRU.DBHANDLE      := Database.Handle;
            STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
            STRU.KERNEL_ACTION := 3;
            STRU.KEY_SESSION   := id_session;
            STRU.PK_ID         := myform.pk;
            STRU.WORKDATE      := cxDateEdit3.Date;
            STRU.ID_USER       := myform.id_user;
            try
                DoResult := Kernel.KernelDo(@STRU);
            except on E:Exception do
            begin
                T.Free;
                Class_Transaction_Wr.Rollback;
                ShowMessage(Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_KERNEL+E.Message);
                exit;
            end;
            end;
            if not DoResult then
            begin
                T.Free;
                cxSplitter2.OpenSplitter;
                PageControl1.ActivePage := TabSheet4;
                cxMemo2.Lines.Clear;
                cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_DOC);
                ErrorList := Kernel.GetDocErrorsList(@STRU);
                if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ERROR+ErrorList.Strings[i]);
                ErrorProvsDataSet.Close;
//                ErrorProvsDataSet.SelectSQL.Text :=' SELECT * FROM KERNEL_PROVS_ERRORS WHERE ID_PROV='+IntToStr(TFIBBCDField(RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV')).AsInt64)+'';
//                ErrorProvsDataSet.SelectSQL.Add('AND KEY_SESSION='+IntToStr(id_session)+'');
                ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                ErrorProvsDataSet.Open;
                ErrorProvsDataSet.First;
                RxError.EmptyTable;
                while not ErrorProvsDataSet.Eof do
                begin
                    RxError.Open;
                    RxError.Insert;
                    RxError.FieldByName('RxKod').Value   := ErrorProvsDataSet.fbn('ID_ERROR').AsString;
                    RxError.FieldByName('RxName').Value  := ErrorProvsDataSet.fbn('ERROR_MESSAGE').AsString;
                    RxError.FieldByName('id_prov').Value := StrToInt64(ErrorProvsDataSet.fbn('ID_PROV').AsString);
                    RxError.Post;
                    ErrorProvsDataSet.Next;
                end;
                Class_Transaction_Wr.Rollback;
                DecimalSeparator := ',';
                exit;
            end;
            Class_StoredProc.StoredProcName:='PUB_SPRAVKA_DT_INSERT';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('NUMBER').AsInt64         := StrToInt64(cxTextEdit1.Text);
            Class_StoredProc.ParamByName('AUTHOR_SPRAVKI').AsInt64 := id_man;
            Class_StoredProc.ParamByName('ID_DOC').AsInt64         := STRU.PK_ID;
            Class_StoredProc.ParamByName('COMENT').AsString        := cxMemoComent.Text;
            if myform.kod_s = 2
                then Class_StoredProc.ParamByName('ID_TYPE_DOC').AsInteger  := 2002;
            if myform.kod_s = 1
                then Class_StoredProc.ParamByName('ID_TYPE_DOC').AsInteger  := 1002;
            Class_StoredProc.ParamByName('PRIHOD').AsInteger       := myform.prih_doc;
            Class_StoredProc.ParamByName('DATE_REG').AsDateTime    := cxDateEdit3.Date;
            Class_StoredProc.ExecProc;

            Class_StoredProc.StoredProcName:='KERNEL_CLEAR_TMP'; //удаление
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('KEY_SESSION').AsInt64  := id_session;
            Class_StoredProc.ExecProc;

            Class_Transaction_Wr.Commit;
            DecimalSeparator := ',';
            myform.ActionRefreshExecute(self);
            myform.MainDataSetSpravka.Locate('R_NUM_SPRAV', StrToInt64(cxTextEdit1.Text), []);
            T.Free;
            close_form := false;
            close;
        except on E:EFibError do begin
            T.Free;
            DecimalSeparator := ',';
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
                ActionSaveAllExecute(sender);
            end
            else
                ShowMessage(E.Message);
            exit;
        end
        end;
    end;

//изменение
    if (regimm = ChangeSprav)  then
    begin
        Class_StoredProc.Database    := Database;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Class_DataSet.Database       := Database;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        DS.Database                  := Database;
        DS.Transaction               := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;

        Class_DataSet.Close;
        Class_DataSet.SQLs.SelectSQL.Text := 'select * from pub_dt_all_doc where pk_id='''+myform.MainDataSetSpravkaR_ID_DOC.AsString+'''';
        Class_DataSet.OPen;

        date_dd       := Class_DataSet.FieldByName('DATE_PROV').AsString;
        id_doc_old    := StrToInt64(Class_DataSet.FieldByName('ID_DOC').AsString);

        note          := Class_DataSet.FieldByName('NOTE').AsString;
        if length(note) > 255 then note := copy(note, 1, 255);


        if id_customer =0 then
        begin
             if(Class_DataSet.FieldByName('ID_CUSTOMER').AsVariant <> null) then
                 id_customer := StrToInt64(Class_DataSet.FieldByName('ID_CUSTOMER').AsString)
             else
                 id_customer :=0;
        end;

        if id_rate_n =0 then
        begin
             if(Class_DataSet.FieldByName('ID_RATE_ACC_NATIVE').AsVariant <> null) then
                 id_rate_n := StrToInt64(Class_DataSet.FieldByName('ID_RATE_ACC_NATIVE').AsString)
             else
                 id_rate_n :=0;
        end;

        if id_rate =0 then
        begin
             if(Class_DataSet.FieldByName('ID_RATE_ACC').AsVariant <> null) then
                 id_rate := StrToInt64(Class_DataSet.FieldByName('ID_RATE_ACC').AsString)
             else
                 id_rate :=0;
        end;


        DS.Close;
        if myform.kod_s = 2
            //then DS.SQLs.SelectSQL.Text:='select * from PUB_SPRAV_INSERT_DOC_BUFFER('''+date_dd+''', '+IntToStr(myform.prih_doc)+', '''+cxTextEditNum.text+''', :FIO, :OSNOVANIE, ''' + IntToStr(0) + ''', '+intToStr(myform.id_user)+', '+IntTostr(id_session)+', '+ IntToStr(myform.MainDataSetSpravkaR_ID_RATE.AsInteger) +', '+ IntToStr(myform.MainDataSetSpravkaR_ID_RATE_NATIVE.AsInteger) +', '''+myform.MainDataSetSpravkaR_ID_CUSTOMER.AsString+''', '+IntTostr(1)+', '''+IntToStr(id_doc_old)+''', '''+GetCompName+''', '+IntToStr(2002)+', '''+cxDateEdit2.Text+''')';
            then DS.SQLs.SelectSQL.Text:='select * from PUB_SPRAV_INSERT_DOC_BUFFER('''+date_dd+''', '+IntToStr(myform.prih_doc)+', '''+cxTextEditNum.text+''', :FIO, :OSNOVANIE, ''' + IntToStr(0) + ''', '+intToStr(myform.id_user)+', '+IntTostr(id_session)+', '+ IntToStr(id_rate) +', '+ IntToStr(id_rate_n) +', '+IntToStr(id_customer)+', '+IntTostr(1)+', '''+IntToStr(id_doc_old)+''', '''+GetCompName+''', '+IntToStr(2002)+', '''+cxDateEdit2.Text+''')';
        if myform.kod_s = 1
            //then DS.SQLs.SelectSQL.Text:='select * from PUB_SPRAV_INSERT_DOC_BUFFER('''+date_dd+''', '+IntToStr(myform.prih_doc)+', '''+cxTextEditNum.text+''', :FIO, :OSNOVANIE, ''' + IntToStr(0) + {StringReplace(cxTextEditSumma.Text,',','.',[]) + }''', '+intToStr(myform.id_user)+', '+IntTostr(id_session)+', '''+myform.MainDataSetSpravkaR_ID_RATE.AsString+''', '''+myform.MainDataSetSpravkaR_ID_RATE_NATIVE.AsString+''', '''+myform.MainDataSetSpravkaR_ID_CUSTOMER.AsString+''', '+IntTostr(1)+', '''+myform.MainDataSetSpravkaR_ID_DOC.AsString+''', '''+GetCompName+''', '+IntToStr(1002)+', '''+cxDateEdit2.Text+''')';
            then DS.SQLs.SelectSQL.Text:='select * from PUB_SPRAV_INSERT_DOC_BUFFER('''+date_dd+''', '+IntToStr(myform.prih_doc)+', '''+cxTextEditNum.text+''', :FIO, :OSNOVANIE, ''' + IntToStr(0) + {StringReplace(cxTextEditSumma.Text,',','.',[]) + }''', '+intToStr(myform.id_user)+', '+IntTostr(id_session)+', '+ IntToStr(id_rate) +', '+ IntToStr(id_rate_n) +', '+IntToStr(id_customer)+', '+IntTostr(1)+', '''+myform.MainDataSetSpravkaR_ID_DOC.AsString+''', '''+GetCompName+''', '+IntToStr(1002)+', '''+cxDateEdit2.Text+''')';

        DS.ParamByName('FIO').AsString       := cxMRUEditFio.Text;
        DS.ParamByName('OSNOVANIE').AsString := note;
        DS.Open;
        id_all        := TFIBBCDField(DS.FieldByName('R_ID')).AsInt64;
        DS.Close;
     try
        RxMemoryDataSaveAll.First;
        While not RxMemoryDataSaveAll.Eof do
        begin
            Class_StoredProc.StoredProcName:='PUB_SPRAV_INSERT_PROV_BUFFER';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session;
            Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
            Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
            Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
            Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
            Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
            Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
            if RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <> null
                then Class_StoredProc.ParamByName('D_ID_MAN').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value
                else Class_StoredProc.ParamByName('D_ID_MAN').AsInt64       := -1;
            Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
//              Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value;
//              Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value;
            Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
            Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myform.id_user;
            Class_StoredProc.ParamByName('D_ID_ALL_DOC').AsInt64   := id_doc_old;
            Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
            Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
            if RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value = null
                then Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := 0
                else Class_StoredProc.ParamByName('D_ID_PAYER').AsInt64     := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value;
            Class_StoredProc.ParamByName('D_PRIHOD').AsInteger     := myform.prih_doc;
            Class_StoredProc.ParamByName('D_DAY').AsDateTime       := StrToDate(date_dd);
            Class_StoredProc.ParamByName('D_IS_MAIN').AsInteger    := 1;
            Class_StoredProc.ParamByName('D_STORNO').AsInteger     := RxMemoryDataSaveAll.FieldByName('Storno').Value;
            Class_StoredProc.ExecProc;

            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_MAIN_SCH_INFO('''+cxDateEdit3.Text+''', '''+RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').AsString+''')';
            Class_DataSet.Open;
            ttt        := TFIBBCDField(Class_DataSet.FieldByName('ID_SYSTEM')).AsInteger;
            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text:='select * from PUB_SP_SYSTEM where ID_SYSTEM='+IntToStr(ttt)+'';
            Class_DataSet.Open;
            if (Class_DataSet.FieldByName('CHECK_ID_MEN').AsInteger =1) and (RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value <=0) then
            begin
                T.Free;
                showmessage(Un_R_file_Alex.ERROR_MAN_PROV);
                exit;
            end;
            if (Class_DataSet.FieldByName('CHECK_DOG').AsInteger =1) and ((RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value <=0) or (RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value <= 0))then
            begin
                T.Free;
                showmessage(Un_R_file_Alex.ERROR_DOG_PROV);
                exit;
            end;
            Class_DataSet.Close;
            RxMemoryDataSaveAll.Next;
        end;

        Class_Transaction_Wr.Commit;

        Class_StoredProc.Database    := Database;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Class_DataSet.Database       := Database;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        ErrorProvsDataSet.Transaction := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;

            STRU.DBHANDLE      := Database.Handle;
            STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
            STRU.KERNEL_ACTION := 3;
            STRU.KEY_SESSION   := id_session;
            STRU.PK_ID         := myform.MainDataSetSpravkaR_ID_DOC.AsInt64;
            STRU.WORKDATE      := StrToDate(cxDateEdit3.Text);
            STRU.ID_USER       := myform.id_user;
            try
                DoResult:=Kernel.KernelDo(@STRU);
            except on E:Exception do
            begin
                T.Free;
                Class_Transaction_Wr.Rollback;
//                Class_Transaction_Wr.Commit;
                ShowMessage(Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_KERNEL+E.Message);
                exit;
            end;
            end;
            if not DoResult then
            begin
                T.Free;
                cxSplitter2.OpenSplitter;
                PageControl1.ActivePage := TabSheet4;
                cxMemo2.Lines.Clear;
                cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ORDER_ERROR_ADD_DOC);
                ErrorList:=Kernel.GetDocErrorsList(@STRU);
                if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.KASSA_ERROR+ErrorList.Strings[i]);
                ErrorProvsDataSet.Close;
//                ErrorProvsDataSet.SelectSQL.Text :=' SELECT * FROM KERNEL_PROVS_ERRORS WHERE ID_PROV='+IntToStr(TFIBBCDField(RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV')).AsInt64)+'';
//                ErrorProvsDataSet.SelectSQL.Add('AND KEY_SESSION='+IntToStr(id_session)+'');
                ErrorProvsDataSet.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                ErrorProvsDataSet.Open;
                ErrorProvsDataSet.First;
                RxError.EmptyTable;
                while not ErrorProvsDataSet.Eof do
                begin
                    RxError.Open;
                    RxError.Insert;
                    RxError.FieldByName('RxKod').Value   := ErrorProvsDataSet['ID_ERROR'];
                    RxError.FieldByName('RxName').Value  := ErrorProvsDataSet['ERROR_MESSAGE'];
                    RxError.FieldByName('id_prov').Value := ErrorProvsDataSet['ID_PROV'];
                    RxError.Post;
                    ErrorProvsDataSet.Next;
                end;
                Class_Transaction_Wr.Rollback;
//                Class_Transaction_Wr.Commit;
                DecimalSeparator := ',';
                exit;
            end;
            Class_StoredProc.StoredProcName:='PUB_SPRAVKA_DT_UPDATE';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('NUMBER').AsInt64         := StrToInt64(cxTextEdit1.Text);
            Class_StoredProc.ParamByName('AUTHOR_SPRAVKI').AsInt64 := id_man;
            Class_StoredProc.ParamByName('ID_DOC').AsInt64         := STRU.PK_ID;//STRU.PK_ID;
            Class_StoredProc.ParamByName('COMENT').AsString        := cxMemoComent.Text;
            if myform.kod_s = 2
                then Class_StoredProc.ParamByName('ID_TYPE_DOC').AsInteger  := 2002;
            if myform.kod_s = 1
                then Class_StoredProc.ParamByName('ID_TYPE_DOC').AsInteger  := 1002;
//            Class_StoredProc.ParamByName('PRIHOD').AsInteger       := myform.prih_doc;
//            Class_StoredProc.ParamByName('DATE_REG').AsDateTime    := cxDateEdit3.Date;
            Class_StoredProc.ExecProc;

            Class_StoredProc.StoredProcName:='KERNEL_CLEAR_TMP'; //удаление
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('KEY_SESSION').AsInt64  := id_session;
            Class_StoredProc.ExecProc;

            Class_Transaction_Wr.Commit;
            DecimalSeparator := ',';
            myform.ActionRefreshExecute(self);
            myform.MainDataSetSpravka.Locate('R_NUM_SPRAV', StrToInt64(cxTextEdit1.Text), []);
            T.Free;
            close_form := false;
            close;
        except on E:EFibError do begin
            T.Free;
            DecimalSeparator := ',';
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
                ActionSaveAllExecute(sender);
            end
            else
                ShowMessage(E.Message);
            exit;
        end;
        end;
        end;
    end;
end;

procedure TfmSpravkaDoc.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ActionChangeExecute(Sender);
end;

function TfmSpravkaDoc.FindSpravInLastPeriod : boolean;
var
    s : string;
begin
    if active_form then
    begin
        result := true;
        active_form := false;
        DataSet2.Close;
        DataSet2.Sqls.selectSql.Text := 'select * from PUB_SPRAVKA_FIND_ALL_SPRAV('+IntToStr(myform.pk)+', '''+cxDateEdit3.Text+''')';
        DataSet2.Open;
        if DataSet2.FieldByName('EXIT_SPRAV').AsInteger = 1 then
        begin
            try s := DataSet1.FieldByName('NUM_SPRAV').AsString; except s := ''; end;
            Showmessage(SpravkaUnitCaption.DOC_MESSAGA_EXISTS_SP_DOC +  s);
            result := false;
            close_form := false;
            Close;
            exit;
        end;
        if DataSet2.FieldByName('IS_BLOCK_SCH').AsInteger = 1 then
        begin
            Showmessage(SpravkaUnitCaption.DOC_SCH_BLOCK);
            result := false;
            close_form := false;
            Close;
            exit;
        end;
        if DataSet2.FieldByName('OPEN_SCH').AsInteger = 1 then
        begin
            Showmessage(SpravkaUnitCaption.DOC_SCH_CLOSE);
            result := false;
            close_form := false;
            Close;
            exit;
        end;
    end;
end;

procedure TfmSpravkaDoc.cxGrid2DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
  if showafterAdd then
  begin
  Arect:=AViewInfo.Bounds;
  if ({DayOf(VarToDateTime(}AViewInfo.GridRecord.Values[5]{))} = 1) and (not AViewInfo.GridRecord.Focused) then
  begin //storno
      ACanvas.Canvas.Font.Color := clRed;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end; //закрытый месяц
{  if (AViewInfo.GridRecord.Values[9] = 1) and (not AViewInfo.GridRecord.Focused) then
  begin //
      ACanvas.Canvas.Font.Color := RGB(192,192,192);//светло-серый;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;}
  if (not AViewInfo.GridRecord.Focused) then
  begin   // остальные
      ACanvas.Canvas.Font.Color := clBlack;//черный;
      ACanvas.Canvas.FillRect(Arect);
  end;
  end;
end;

procedure TfmSpravkaDoc.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
 if showafterAdd then
 begin
  Arect:=AViewInfo.Bounds;
  if (DayOf(VarToDateTime(AViewInfo.GridRecord.Values[5])) = 1) and (not AViewInfo.GridRecord.Focused) then
  begin //storno
      ACanvas.Canvas.Font.Color := clRed;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  if (not AViewInfo.GridRecord.Focused) then
  begin // остальные
      ACanvas.Canvas.Font.Color := clBlack;//черный;
      ACanvas.Canvas.FillRect(Arect);
  end;
 end;
end;

procedure TfmSpravkaDoc.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if showafterAdd then
    ShowInfoDog(2);
end;

procedure TfmSpravkaDoc.ShowInfoDog(upGridP: integer);
var
    y, o : TSpravParams;
    ffio, n_cust, n_do, reg_n, d_d, type_d : string;
    dog_type : integer;
    id_dog_s, kod_dog_s : int64;
begin
    id_dog_s  := 0;
    kod_dog_s := 0;
  if (upGridP = 1) and showafterAdd then
  begin
     cxTextEdit2.Text := '';
     if (RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value<>null) then
     if (RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value>0) then
     begin
         y                    := TSpravParams.Create;
         o                    := TSpravParams.Create;
         y['DataBase']        := Integer(Database.Handle);
         y['ReadTransaction'] := Integer(TransactionRead.Handle);
         id_dog_s  := RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value;
         kod_dog_s := RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Value;
         y['ID_DOG']          := id_dog_s;
         y['KOD_DOG']         := kod_dog_s;
         GetDogovorInfo(Self, @y, @o);
         try ffio := o['FIO_COMBO']       except ffio     := ''; end;
         try n_cust := o['NAME_CUSTOMER'] except n_cust   := ''; end;
         try d_d := DateToStr(o['D_DOG']) except d_d      := ''; end;
         try n_do := o['NUM_DOG']         except n_do     := ''; end;
         try reg_n  := o['REGEST_NUM']    except reg_n    := ''; end;
         try type_d := o['N_DOG']         except type_d   := ''; end;
         try dog_type   := o['DOG_TYPE']  except dog_type := -1; end;
         if o['DOG_TYPE'] = 0 then   {другие}
         begin
             cxTextEdit2.text := SpravkaUnitCaption.DOC_REG_NUM+ reg_n + SpravkaUnitCaption.DOC_N_DOG + type_d + SpravkaUnitCaption.DOC_DATE_DOG + d_d + SpravkaUnitCaption.DOC_NAME_CUST + n_cust + SpravkaUnitCaption.DOC_TYPE_DOG + type_d;
         end;
         if o['DOG_TYPE'] = 1 then  {студгородок}
             cxTextEdit2.Text := SpravkaUnitCaption.DOC_FIO_PROJ + ffio + SpravkaUnitCaption.DOC_REG_N+reg_n + SpravkaUnitCaption.DOC_FROM + d_d + SpravkaUnitCaption.DOC_NAME_CUST_2 + n_cust;
         if o['DOG_TYPE'] = 2 then   {обучение}
             cxTextEdit2.Text := SpravkaUnitCaption.DOC_FIO_OBUCH + ffio + SpravkaUnitCaption.DOC_NUMER_DOG+ '' + n_do+' ) '  + SpravkaUnitCaption.DOC_REG_N+reg_n + SpravkaUnitCaption.DOC_FROM + d_d + SpravkaUnitCaption.DOC_NAME_CUST_2 + n_cust;
         y.Free;
         o.Free;
     end;
     cxTextEdit6.Text := RxMemoryDataShow.FieldByName('RxMemDatNameRazd').AsString;
     cxTextEdit7.Text := RxMemoryDataShow.FieldByName('RxMemDatNameStat').AsString;
     cxTextEdit8.Text := RxMemoryDataShow.FieldByName('RxMemDatNameKekv').AsString;
  end;
  if (upGridP = 2) and showafterAdd then
  begin
     cxTextEdit2.Text := '';
     if (RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value<>null) then
     if (RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value>0) then
     begin
         y                    := TSpravParams.Create;
         o                    := TSpravParams.Create;
         id_dog_s             := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
         kod_dog_s            := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
         y['DataBase']        := Integer(Database.Handle);
         y['ReadTransaction'] := Integer(TransactionRead.Handle);
         y['ID_DOG']          := id_dog_s;
         y['KOD_DOG']         := kod_dog_s;
         GetDogovorInfo(Self, @y, @o);
         try ffio := o['FIO_COMBO']       except ffio     := ''; end;
         try n_cust := o['NAME_CUSTOMER'] except n_cust   := ''; end;
         try d_d := DateToStr(o['D_DOG']) except d_d      := '01.01.1900'; end;
         try n_do := o['NUM_DOG']         except n_do     := ''; end;
         try reg_n  := o['REGEST_NUM']    except reg_n    := ''; end;
         try type_d := o['N_DOG']         except type_d   := ''; end;
         try dog_type   := o['DOG_TYPE']  except dog_type := -1; end;
         if o['DOG_TYPE'] = 0 then   {другие}
         begin
             cxTextEdit2.text := SpravkaUnitCaption.DOC_REG_NUM+ reg_n + SpravkaUnitCaption.DOC_N_DOG + type_d + SpravkaUnitCaption.DOC_DATE_DOG + d_d + SpravkaUnitCaption.DOC_NAME_CUST + n_cust + SpravkaUnitCaption.DOC_TYPE_DOG + type_d;
         end;
         if o['DOG_TYPE'] = 1 then  {студгородок}
             cxTextEdit2.Text := SpravkaUnitCaption.DOC_FIO_PROJ + ffio + SpravkaUnitCaption.DOC_REG_N+reg_n + SpravkaUnitCaption.DOC_FROM + d_d + SpravkaUnitCaption.DOC_NAME_CUST_2 + n_cust;
         if o['DOG_TYPE'] = 2 then   {обучение}
             cxTextEdit2.Text := SpravkaUnitCaption.DOC_FIO_OBUCH + ffio + SpravkaUnitCaption.DOC_NUMER_DOG+ '' + n_do+' ) '  + SpravkaUnitCaption.DOC_REG_N+reg_n + SpravkaUnitCaption.DOC_FROM + d_d + SpravkaUnitCaption.DOC_NAME_CUST_2 + n_cust;
         y.Free;
         o.Free;
     end;
     cxTextEdit6.Text := RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').AsString;
     cxTextEdit7.Text := RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').AsString;
     cxTextEdit8.Text := RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').AsString;
  end;
end;

procedure TfmSpravkaDoc.cxGrid1DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_UP) or (Key = VK_DOWN) then ShowInfoDog(2);
    if (Key = VK_DELETE) then ActionDeleteExecute(self);
end;

procedure TfmSpravkaDoc.cxGrid2DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_UP) or (Key = VK_DOWN) then ShowInfoDog(1);
end;

procedure TfmSpravkaDoc.cxGrid2DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if showafterAdd then
    ShowInfoDog(1);
end;

procedure TfmSpravkaDoc.cxButton3Click(Sender: TObject);
var
    summa_dog : double;
    i, j, iddddd : integer;
    flag_na_exists_dog, flag_na_exists_sm : boolean;
    input_1 : TDogInput;
    res   : TDogResult;
    id_ss : int64;
    innnn, o : TSpravParams;
    id_sch_tmp : int64;
    sch_name_tmp, sch_title_tmp : string;
    sch_exist, itt : integer;
begin
  showafterAdd := false;
  if Show_Select_Type_Dog(iddddd, Database, TransactionRead, myform.prih_doc) then
  begin
  if iddddd = 2 then
  begin
    decimalseparator     := ',';
    summa_dog := 0;
    if Show_Summa_Sprav(summa_dog, '') then
    begin
        LoadSysData(TransactionRead);
        Class_DataSet.Database       := Database;
        Class_DataSet.Transaction    := TransactionRead;
        SYS_ID_USER                  := myform.id_user;
        decimalseparator             := ',';
        input_1                      := SYS_DEFAULT_DOG_INPUT;
        input_1.Owner                := Self;
        input_1.DBHandle             := Database.Handle;
        input_1.ReadTrans            := TransactionRead.Handle;
        input_1.WriteTrans           := Class_Transaction_Wr.Handle;
        input_1.FormStyle            := fsNormal;

        if myform.kod_s = 2 then
        begin
            DSet.Close;
            DSet.SQLs.SelectSQL.Text := 'select * from BANK_INI';
            DSet.Open;
            if prih = 1
                then input_1.id_Group_add := DSet.FieldByName('ID_GROUP_ADD_PR').AsInteger//61799//1499
                else input_1.id_Group_add := DSet.FieldByName('ID_GROUP_ADD_RAS').AsInteger;//61799;//1599;
            input_1.id_Group              := DSet.FieldByName('ID_GROUP').AsInteger;//61699;//699;
            DSet.Close;
        end;
        if myform.kod_s = 1 then
        begin
            input_1.id_Group     := 1399;
            input_1.id_group_add := 2599;
        end;

        input_1.Summa        := summa_dog;
        input_1.filter.bShowFilterForm := true;
        input_1.isZayav     := false;
        input_1.arndGetPay  := 1;
        res := ShowDogMain(input_1);
        if res.ModalResult = 1 then
        begin
            i := length(res.Smets);
            for j := 0 to i-1 do
            begin
                DSet.Close;
                DSet.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_INFO_SRSTSCH('+IntToStr(res.id_bl_account)+', '+IntToStr(res.Smets[j].NumSmeta)+', '+IntToStr(res.Smets[j].NumRazd)+', '+IntToStr(res.Smets[j].NumStat)+', '+IntToStr(res.Smets[j].NumKekv)+')';
                DSet.Open;
                flag_na_exists_sm := false;
                RxMemoryDataSaveAll.First;
                id_ss := Database.Gen_Id('KERNEL_GEN_ID', 1);
                itt :=1;
                while not RxMemoryDataSaveAll.Eof do
                begin
                    if (RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').AsVariant   = DSet['ID_SMETA']) and
                       (RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').AsVariant = DSet['ID_RAZD'])  and
                       (RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').AsVariant   = DSet['ID_STATE']) and
                       (RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').AsVariant = DSet['ID_KEKV'])  and
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
                     RxMemoryDataSaveAll.Open;
                     RxMemoryDataSaveAll.Insert;
                     if res.Smets[j].NSumma = 0
                         then RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := summa_dog
                         else RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := res.Smets[j].NSumma;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := DSet['ID_SMETA'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := DSet['ID_RAZD'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := DSet['ID_STATE'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := DSet['ID_KEKV'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := res.id_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := res.kod_dog;
                     id_dog_last      := res.id_dog;
                     kod_dog_last     := res.kod_dog;

                     if DSet.FieldByName('SM_KOD').AsInteger > 0 then
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value     := DSet.FieldByName('SM_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := DSet.FieldByName('RAZ_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := DSet.FieldByName('ST_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := DSet.FieldByName('SM_KOD').AsString +'\'+ DSet.FieldByName('RAZ_KOD').AsString +'\'+ DSet.FieldByName('ST_KOD').AsString +'\'+ DSet.FieldByName('KEKV_KOD').AsString;
                     end else
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value     := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := '';
                     end;
                     if DSet.FieldByName('KEKV_KOD').AsInteger >= 0
                         then RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := DSet.FieldByName('KEKV_KOD').AsInteger
                         else RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := null;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := DSet.FieldByName('ST_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := DSet.FieldByName('RAZ_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := DSet.FieldByName('SM_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := DSet.FieldByName('KEKV_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := RxMemoryDataShow.fieldByName('RxMemDatid_sch').AsVariant;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := RxMemoryDataShow.FieldByName('RxMemDatNameSch').AsString;
                  //   RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := res.n_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := id_ss;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value      := RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleSch').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := res.name_customer;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := res.d_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := res.name_tip_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := res.regest_num;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := res.n_dog;
                     RxMemoryDataSaveAll.FieldByName('Storno').Value                           := 0;
                     RxMemoryDataSaveAll.FieldByName('Change').Value                           := 0;
                     RxMemoryDataSaveAll.FieldByName('id').Value                               := itt+1;
                     inc(itt);
                    // RxMemoryDataSaveAll.Post;
                  //   RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := id_ss;
                     id_type_dog :=      res.id_tip_dog;
                     if (use_expert_sys=1) then
                     begin ////////////////////////////////////////////////
                          DataSetExpertSys.Close;
                          DataSetExpertSys.SQLs.SelectSQL.Text        := 'Select * from PUB_GET_KORR_SCH_FOR_BANKKASSA(:NATIVEBANKKASSASCH, :NATIVESCHINDB,:IDTYPEDOG,:IDSM,:ACTUALDATE,:CHECK_KORR_SCH_BY_REG, :IDRZ, :IDST)';
                          DataSetExpertSys.ParamByName('NATIVEBANKKASSASCH').AsInteger    := DataSet1['R_ID_SCH'];
                          DataSetExpertSys.ParamByName('NATIVESCHINDB').AsInteger         := prih;
                          DataSetExpertSys.ParamByName('IDTYPEDOG').AsInteger             := id_type_dog;
                          DataSetExpertSys.ParamByName('IDSM').AsInteger                  := DSet['ID_SMETA'];
                          DataSetExpertSys.ParamByName('ACTUALDATE').Asdate               := cxDateEdit3.Date;
                          DataSetExpertSys.ParamByName('CHECK_KORR_SCH_BY_REG').AsInteger := 1;
                          DataSetExpertSys.ParamByName('IDRZ').AsInteger                  := DSet['ID_RAZD'];
                          DataSetExpertSys.ParamByName('IDST').AsInteger                  := DSet['ID_STATE'];
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
                                //if ShowExpertSch(self, self, ResSch) then
                                 begin
                                     //RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := ResSch[2];
                                    // RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := ResSch[1];
                                    // RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := ResSch[0];
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
                                     //if ShowExpertSch(self, self, ResSch) then
                                     begin
                                         //RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := ResSch[2];
                                         //RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := ResSch[1];
                                         //RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := ResSch[0];
                                         id_sch_tmp     := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                                         sch_name_tmp   := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value;
                                         sch_title_tmp  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value;
                                     end;
                                 end;
                             end;
                          end;
                     end else
                     begin
                         if DSet['ID_SCH'] > 0 then
                         begin
                             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := DSet['ID_SCH'];
                             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DSet.FieldByName('KOD_SCH').AsString;
                             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DSet.FieldByName('TITLE_SCH').AsString;
                         end else
                         begin
                             Class_DataSet.close;
                             Class_DataSet.Sqls.selectSQL.Text := 'select * from PUB_SP_TIP_DOG_BELONG_GROUP('+VarToStr(res.id_tip_dog)+', '+IntToStr(6)+')';//студгородок
                             Class_DataSet.Open;
                             if Class_DataSet['RESULT'] = 1 then
                             begin
                                 Class_DataSet.Close;
                                 Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+DSet.FieldByName('ID_SMETA').AsString+''', '''+DSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit3.Text+''')';
                                 Class_DataSet.Open;
                                 if Class_DataSet['RESULT'] = 1 then
                                 begin
                                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := Class_DataSet['FOND_TITLE'];
                                     RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := Class_DataSet['ID_FOND'];
                                     RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := Class_DataSet['FOND_NUM'];
                                 end else
                                 begin
                                     Showmessage(Class_DataSet['RESULT_MESSAGE']);
                                 end;
                             end;
                             Class_DataSet.close;
                             Class_DataSet.Sqls.selectSQL.Text := 'select * from PUB_SP_TIP_DOG_BELONG_GROUP('+VarToStr(res.id_tip_dog)+', '+IntToStr(7)+')';//договора за обучение
                             Class_DataSet.Open;
                             if Class_DataSet['RESULT'] = 1 then
                             begin
                                 Class_DataSet.Close;
                                 Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+DSet.FieldByName('ID_SMETA').AsString+''', '''+DSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit3.Text+''')';
                                 Class_DataSet.Open;
                                 if Class_DataSet['RESULT'] = 1 then
                                 begin
                                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := Class_DataSet['FOND_TITLE'];
                                     RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := Class_DataSet['ID_FOND'];
                                     RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := Class_DataSet['FOND_NUM'];
                                 end else
                                 begin
                                     Showmessage(Class_DataSet['RESULT_MESSAGE']);
                                 end;
                             end;
                         end;
                         {RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := id_ss;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value      := RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleSch').AsString;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := res.name_customer;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := res.d_dog;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := res.name_tip_dog;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := res.regest_num;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := res.n_dog;
                         RxMemoryDataSaveAll.FieldByName('Storno').Value                           := 0;
                         RxMemoryDataSaveAll.FieldByName('Change').Value                           := 0;   }
                     end;
                     RxMemoryDataSaveAll.Post;
                 end;
                DSet.Close;
            end;
        end;
    end;
    Class_DataSet.Close;
    DSet.Close;
  end;
  if iddddd = 3 then {obuch}
  begin
    ShowMessage('Більше не підтримується!');
  end;
  if iddddd = 4 then {studcity}
  begin
      StudCity;
  end;
  if iddddd = 5 then {new obuch}
  begin
      DogTritiesNew;
  end;
  if iddddd = 6 then {nich}
  begin
     DogNich(self, Database, myform.d, myform.num_doc, sum_doc_nich, myform.note, myform.id_user, myform.fio, 1);
  end;
  end;
  Sinhronizac;
  showafterAdd := true;
end;

procedure TfmSpravkaDoc.StudCity;
var
    summa_dog : double;
    i, j, l : integer;
    flag_na_exists_dog, flag_na_exists_sm : boolean;
    id_ss : int64;
    //Current: IjbSendData;
    SmetID, RazdID, StatID: int64;
    StudDogID: int64;
    res : variant;
    y, o : TSpravParams;
    ffio, n_cust, n_do, reg_n, d_d : string;
begin
  showafterAdd := false;
     Res := Load_st_BuildLivers(self, Database.Handle, true, '', cxMemo1.Text);
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
          Class_DataSet.Database       := Database;
          Class_DataSet.Transaction    := TransactionRead;
          l := Res[0][9]+1;
          for i := 1 to l-1 do
          begin
              Class_DataSet.Close;
              Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('''+VarToStr(Res[i][0])+''', '''+VarToStr(Res[i][1])+''', '''+VarToStr(Res[i][2])+''', '''+VarToStr(Res[i][3])+''')';
              Class_DataSet.Open;
              flag_na_exists_sm := false;
              id_ss := Database.Gen_Id('KERNEL_GEN_ID', 1);
                 if not flag_na_exists_sm then
                 begin
                     RxMemoryDataSaveAll.Open;
                     RxMemoryDataSaveAll.Insert;
                     RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value               := Res[i][4];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                := Class_DataSet['ID_SMETA'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value              := Class_DataSet['ID_RAZD'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                := Class_DataSet['ID_STATE'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value              := Class_DataSet['ID_KEKV'];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value               := Res[0][0];
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value              := Res[0][11];
                     id_dog_last      := Res[0][0];
                     kod_dog_last     := Res[0][11];
                     
                     if Class_DataSet.FieldByName('SM_KOD').AsInteger > 0 then
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKoDSmeta').Value     := Class_DataSet.FieldByName('SM_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := Class_DataSet.FieldByName('RAZ_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKoDState').Value     := Class_DataSet.FieldByName('ST_KOD').AsInteger;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := Class_DataSet.FieldByName('SM_KOD').AsString +'\'+ Class_DataSet.FieldByName('RAZ_KOD').AsString +'\'+ Class_DataSet.FieldByName('ST_KOD').AsString +'\'+ Class_DataSet.FieldByName('KEKV_KOD').AsString;
                     end else
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKoDSmeta').Value     := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := null;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := null;
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
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := StrToInt64(RxMemoryDataShow.fieldByName('RxMemDatid_sch').AsString);
                     RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := RxMemoryDataShow.fieldByName('RxMemDatNameSch').AsString;
                     y := TSpravParams.Create;
                     o := TSpravParams.Create;
                     y['DataBase']        := Integer(Database.Handle);
                     y['ReadTransaction'] := Integer(TransactionRead.Handle);
                     y['ID_DOG']          := Res[0][0];
                     y['KOD_DOG']         := Res[0][11];
                     id_dog_last      := Res[0][0];
                     kod_dog_last     := Res[0][11];
                     GetDogovorInfo(Self, @y, @o);
                     try ffio   := o['FIO_COMBO']        except ffio   := ''; end;
                     try n_cust := o['NAME_CUSTOMER']    except n_cust := ''; end;
                     try d_d    := DateToStr(o['D_DOG']) except d_d    := '01.01.1900'; end;
                     try n_do   := o['NUM_DOG']          except n_do   := ''; end;
                     try reg_n  := o['REGEST_NUM']       except reg_n  := ''; end;
                     try
                         RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := o['ID_BL_ACCOUNT'];
                         DSet.Close;
                         DSet.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SP_MAIN_SCH_INFO('''+DateToStr(cxDateEdit3.Date)+''', '+VarToStr(o['ID_BL_ACCOUNT'])+')';
                         DSet.Open;
                         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DSet['SCH_TITLE'];
                         RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DSet['SCH_NUMBER'];
                         DSet.Close;
                     except
                     begin
                         RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := -1;
                     end;
                     end;
                     if RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value <= 0 then
                     begin
                         DSet.Close;
                         DSet.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit3.Text+''')';
                         DSet.Open;
                         if DSet['RESULT'] = 1 then
                         begin
                             RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DSet['FOND_TITLE'];
                             RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := DSet['ID_FOND'];
                             RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DSet['FOND_NUM'];
                         end else
                         begin
                             Showmessage(DSet['RESULT_MESSAGE']);
                         end;
                         DSet.Close;
                     end;
                     RxMemoryDataSaveAll.FieldByName('fio_stud').Value                         := ffio;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := n_cust;
                     try RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := StrToDate(d_d); except RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := StrToDate('01.01.1900'); {showmessage('2222');} end;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := '';
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := reg_n;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := n_do;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := id_ss;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value      := RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleSch').AsString;
                     RxMemoryDataSaveAll.FieldByName('Storno').Value                           := 0;
                     RxMemoryDataSaveAll.FieldByName('Change').Value                           := 0;
                     y.Free;
                     o.Free;
                     RxMemoryDataSaveAll.Post;
                 end;
           end;
        Class_DataSet.Close;
    end;
  showafterAdd := true;
end;


procedure TfmSpravkaDoc.Sinhronizac;
var
    id_pozic : int64;
begin
    showafterAdd := false;
    RxMemoryDataShow.First;
    while not RxMemoryDataShow.Eof do
    begin
        if RxMemoryDataShow.FieldByName('priznak_niza').AsInteger = 1 then
            RxMemoryDataShow.Delete
        else RxMemoryDataShow.Next;
    end;
    id_pozic := StrToInt64(RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').AsString);
    RxMemoryDataSaveAll.First;
    while not RxMemoryDataSaveAll.Eof do
    begin
         RxMemoryDataShow.Open;
         RxMemoryDataShow.Insert;
         RxMemoryDataShow.FieldByName('RxMemDatId_doc_prov').Value                 := RxMemoryDataSaveAll.FieldByName('RxMemDatId_doc_prov').Value;
         RxMemoryDataShow.FieldByName('RxMemDatid_doc').Value                      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_doc').Value;
         RxMemoryDataShow.FieldByName('RxMemDat_summa').Value                      := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
         RxMemoryDataShow.FieldByName('RxMemDatid_sm').Value                       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
         RxMemoryDataShow.FieldByName('RxMemDatid_razd').Value                     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
         RxMemoryDataShow.FieldByName('RxMemDatid_st').Value                       := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
         RxMemoryDataShow.FieldByName('RxMemDatid_kekv').Value                     := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
         RxMemoryDataShow.FieldByName('RxMemDatid_dog').Value                      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
         RxMemoryDataShow.FieldByName('RxMemDatkod_dog').Value                     := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
         RxMemoryDataShow.FieldByName('RxMemDatid_man').Value                      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value;
         RxMemoryDataShow.FieldByName('RxMemDatid_sch').Value                      := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
         RxMemoryDataShow.FieldByName('RxMemDatsumma_value').Value                 := RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value;
         RxMemoryDataShow.FieldByName('RxMemDatid_value').Value                    := RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value;
         RxMemoryDataShow.FieldByName('RxMemDatNameSch').Value                     := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodState').Value         := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodRazd').Value          := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodSmeta').Value         := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllKodKekv').Value          := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value;
         RxMemoryDataShow.FieldByName('RxMemDatFio').Value                         := RxMemoryDataSaveAll.FieldByName('RxMemDatFio').Value;
         RxMemoryDataShow.FieldByName('RxMemDatID_SCH_KORESPOND').Value            := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
         RxMemoryDataShow.FieldByName('RxMemDatname_korespond').Value              := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value         := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
         RxMemoryDataShow.FieldByName('RxMemDatNameSmeta').Value                   := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value;
         RxMemoryDataShow.FieldByName('RxMemDatNameRazd').Value                    := RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value;
         RxMemoryDataShow.FieldByName('RxMemDatNameStat').Value                    := RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value;
         RxMemoryDataShow.FieldByName('RxMemDatNameKekv').Value                    := RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value     := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value      := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleSch').Value         := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value      := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value    := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value      := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value      := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value;
         RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value     := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value;
         RxMemoryDataShow.FieldByName('Storno').Value                              := 0;
         RxMemoryDataShow.FieldByName('Storno_monitor').Value                      := '';
         RxMemoryDataShow.FieldByName('Change').Value                              := RxMemoryDataSaveAll.FieldByName('Change').Value;
         RxMemoryDataShow.FieldByName('priznak_niza').Value                        := 1;
         RxMemoryDataShow.Post;
         RxMemoryDataSaveAll.Next;
    end;
    RxMemoryDataSaveAll.Locate('RxMemoryDataSaveAll_ID_PROV', id_pozic, []);
    showafterAdd := true;
end;

procedure TfmSpravkaDoc.cxGrid3DBTableView1DblClick(Sender: TObject);
begin
    cxSplitter1.OpenSplitter;
    try
        RxMemoryDataSaveAll.Locate('RxMemoryDataSaveAll_ID_PROV', RxError.FieldByName('id_prov').AsVariant, []);
//        showmessage()
    finally
    end;
end;

procedure TfmSpravkaDoc.DogTritiesNew;
var
    flag_na_exists_dog, flag_na_exists_sm : boolean;
    id_ss : int64;
    SmetID, RazdID, StatID, KekvID : int64;
    y, o : TSpravParams;
    ffio, n_cust, n_do, reg_n, d_d, type_d : string;
    dog_type : integer;

    AParameter : TcnSimpleParamsEx;
    ResOpl     : Variant;
    i, l, j : integer;
    d : TpFIBDatabase;
    t : tpFibTransaction;

begin
    showafterAdd := false;
    Class_DataSet.Database       := Database;
    Class_DataSet.Transaction    := TransactionRead;

    AParameter                              := TcnSimpleParamsEx.Create;
    AParameter.Owner                        := self;
    AParameter.Db_Handle                    := Database.Handle;
    AParameter.Formstyle                    := fsNormal;
    AParameter.cnParamsToPakage.Note        := cxMemo1.text;
    AParameter.WaitPakageOwner              := self;
    AParameter.cnParamsToPakage.IsWithSumma := false;
    AParameter.cnParamsToPakage.Summa       := -1;
    AParameter.cnParamsToPakage.BarCode     := '';

    ResOpl:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');
    if VarArrayDimCount(ResOpl)>0
    then begin
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
            id_ss := Database.Gen_Id('KERNEL_GEN_ID', 1);
            if not flag_na_exists_sm then
            begin
                RxMemoryDataSaveAll.Open;
                RxMemoryDataSaveAll.Insert;
                RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value               := ResOpl[i][4];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value                := Class_DataSet['ID_SMETA'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value              := Class_DataSet['ID_RAZD'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value                := Class_DataSet['ID_STATE'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value              := Class_DataSet['ID_KEKV'];
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value               := ResOpl[0][2];
                RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value              := ResOpl[0][12];
                id_dog_last      := ResOpl[0][2];
                kod_dog_last     := ResOpl[0][12];
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value := ResOpl[0][5];
                if Class_DataSet.FieldByName('SM_KOD').AsInteger > 0 then
                begin
                    RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value     := Class_DataSet.FieldByName('SM_KOD').AsInteger;
                    RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := Class_DataSet.FieldByName('RAZ_KOD').AsInteger;
                    RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := Class_DataSet.FieldByName('ST_KOD').AsInteger;
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
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := StrToInt64(RxMemoryDataShow.fieldByName('RxMemDatid_sch').AsString);
                RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
                RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
                RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := RxMemoryDataShow.fieldByName('RxMemDatNameSch').AsString;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := id_ss;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value := RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleSch').AsString;
                y := TSpravParams.Create;
                o := TSpravParams.Create;
                y['DataBase']        := Integer(Database.Handle);
                y['ReadTransaction'] := Integer(TransactionRead.Handle);
                y['ID_DOG']          := ResOpl[0][2];
                y['KOD_DOG']         := ResOpl[0][12];
               // id_dog_s             := ResOpl[0][2];
              //  kod_dog_s            := ResOpl[0][12];
                id_dog_last          := ResOpl[0][2];
                kod_dog_last         := ResOpl[0][12];
                GetDogovorInfo(Self, @y, @o);
                try ffio   := o['FIO_COMBO']        except ffio   := ''; end;
                try n_cust := o['NAME_CUSTOMER']    except n_cust := ''; end;
                try d_d    := DateToStr(o['D_DOG']) except d_d    := ''; end;
                try n_do   := o['NUM_DOG']          except n_do   := ''; end;
                try reg_n  := o['REGEST_NUM']       except reg_n  := ''; end;
                try dog_type   := o['DOG_TYPE']  except dog_type := -1; end;
                try type_d := o['N_DOG']         except type_d   := ''; end;
                try
                    RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := o['ID_BL_ACCOUNT'];
                    DSet.Close;
                    DSet.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SP_MAIN_SCH_INFO('''+DateToStr(cxDateEdit3.Date)+''', '+VarToStr(o['ID_BL_ACCOUNT'])+')';
                    DSet.Open;
                    RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DSet['SCH_TITLE'];
                    RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DSet['SCH_NUMBER'];
                    DSet.Close;
                except
                begin
                    RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := -1;
                end;
                end;
                if RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value <= 0 then
                begin
                    DSet.Close;
                    DSet.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit2.Text+''')';
                    DSet.Open;
                    if DSet['RESULT'] = 1 then
                    begin
                        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DSet['FOND_TITLE'];
                        RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := DSet['ID_FOND'];
                        RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DSet['FOND_NUM'];
                    end else
                    begin
                        Showmessage(DSet['RESULT_MESSAGE']);
                    end;
                end;
                RxMemoryDataSaveAll.FieldByName('fio_stud').Value                         := ffio;//res.name_customer;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := n_cust;//res.name_customer;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := StrToDate(d_d);//res.d_dog;
                RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := reg_n;//res.regest_num;
                if dog_type = 0 then   {другие}
                begin
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := '';
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := type_d;
                end;
                if (dog_type = 1) or (dog_type = 2) then
                begin
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := ffio;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := n_do;
                end;
                RxMemoryDataSaveAll.FieldByName('Storno').Value                           := 0;
                RxMemoryDataSaveAll.FieldByName('Change').Value                           := 0;
                RxMemoryDataSaveAll.Post;
                y.Free;
                o.Free;
            end;
         end;
     end;
     Class_DataSet.Close;
     showafterAdd := true;
end;

procedure TfmSpravkaDoc.AShowCountProvExecute(Sender: TObject);
begin
    showmessage(IntToStr(RxMemoryDataSaveAll.RecordCount));
end;

procedure TfmSpravkaDoc.cxTextEditSumComKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmSpravkaDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FormStorage1.SaveFormPlacement;
end;

procedure TfmSpravkaDoc.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;
end;

function TfmSpravkaDoc.DogNich(AOwner: TComponent; DBHANDLE : TpFIBDatabase; date_doc: TDate; num_doc, sum_doc, note: string; id_user : Integer; name_cust : string; prih : Integer) : boolean;
var
    flag_na_exists_dog, flag_na_exists_sm : boolean;
    id_ss : int64;
    SmetID, RazdID, StatID, KekvID : int64;
    y, o : TSpravParams;
    ffio, n_cust, n_do, reg_n, d_d, type_d : string;
    dog_type : integer;
    i, l, j : integer;
    d : TpFIBDatabase;
    t : tpFibTransaction;
    fltForm1 : TfmBankNichSprav;
begin
  showafterAdd := false;
  Class_DataSet.Database := Database;
  Class_DataSet.Transaction := TransactionRead;
  fltForm1:= TfmBankNichSprav.Create(AOwner, DBHANDLE, DateTimePicker1.Date, cxTextEditNum.Text, cxTextEditSumma.Text, cxMemo1.Text, id_user, cxMRUEditFio.Text, prih);
  fltForm1.ShowModal;
  if fltForm1.ModalResult <> mrOk then
    begin
      exit;
    end
  else begin
  for j:=0 to fltForm1.cxParamGridTableView1.DataController.RecordCount - 1 do
  begin
    fltForm1.cxParamGridTableView1.DataController.FocusedRecordIndex:=j;
    for i:=0 to fltForm1.cxResultGridDBTableView1.DataController.RecordCount - 1 do
    begin
      SmetID := fltForm1.cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 5];
      RazdID := fltForm1.cxResultGridDBTableView1DBColumn2.DataBinding.DataController.Values[i, 1];
      StatID := fltForm1.cxResultGridDBTableView1DBColumn7.DataBinding.DataController.Values[i, 6];
      KekvID := fltForm1.cxResultGridDBTableView1DBColumn11.DataBinding.DataController.Values[i, 10];

      Class_DataSet.Close;
      Class_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SM_RA_ST_KEKV('+IntToStr(SmetID)+', '+IntToStr(RazdID)+', '+IntToStr(StatID)+', '+IntToStr(KekvID)+')';
      Class_DataSet.Open;
      flag_na_exists_sm := false;
      id_ss := Database.Gen_Id('KERNEL_GEN_ID', 1);

      RxMemoryDataSaveAll.Open;
      RxMemoryDataSaveAll.Insert;
      RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value := fltForm1.cxResultGridDBTableView1DBColumn4.DataBinding.DataController.Values[i, 3];
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value := Class_DataSet['ID_SMETA'];
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value := Class_DataSet['ID_RAZD'];
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value := Class_DataSet['ID_STATE'];
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value := Class_DataSet['ID_KEKV'];
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value := fltForm1.id_dog;
      RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value := fltForm1.id_dog;
      id_dog_last := fltForm1.id_dog;
      kod_dog_last := fltForm1.id_dog;
      //RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldId_Payer').Value := ResOpl[0][5];
      if Class_DataSet.FieldByName('SM_KOD').AsInteger > 0 then
      begin
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value     := Class_DataSet.FieldByName('SM_KOD').AsInteger;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value      := Class_DataSet.FieldByName('RAZ_KOD').AsInteger;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value     := Class_DataSet.FieldByName('ST_KOD').AsInteger;
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
      RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value := Class_DataSet.FieldByName('ST_TITLE').AsString;
      RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
      RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value := Class_DataSet.FieldByName('SM_TITLE').AsString;
      RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value := 0;
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value := StrToInt64(RxMemoryDataShow.fieldByName('RxMemDatid_sch').AsString);
      RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
      RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value := 0;
      RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value := RxMemoryDataShow.fieldByName('RxMemDatNameSch').AsString;
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := id_ss;
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value := RxMemoryDataShow.FieldByName('RxMemoryDataSaveAllTitleSch').AsString;
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldProvNote').Value := fltForm1.cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[j, 0] + ' ' + fltForm1.cxParamGridTableView1ColumnYear.DataBinding.DataController.Values[j, 1] + 'p. Група бюджета:' + fltForm1.cxParamGridTableView1ColumnSmt.DataBinding.DataController.Values[j, 2] + ' Розділ:' + fltForm1.cxParamGridTableView1ColumnRazd.DataBinding.DataController.Values[j, 3] + ' Сума:' + VarToStr(fltForm1.cxParamGridTableView1ColumnSum.DataBinding.DataController.Values[j, 4]) + 'грн.';
      y := TSpravParams.Create;
      o := TSpravParams.Create;
      y['DataBase']        := Integer(Database.Handle);
      y['ReadTransaction'] := Integer(TransactionRead.Handle);
      y['ID_DOG']          := fltForm1.id_dog;
      y['KOD_DOG']         := fltForm1.id_dog;
      id_dog_last          := fltForm1.id_dog;
      kod_dog_last         := fltForm1.id_dog;
      GetDogovorInfo(Self, @y, @o);
      try ffio   := o['FIO_COMBO']        except ffio   := ''; end;
      try n_cust := o['NAME_CUSTOMER']    except n_cust := ''; end;
      try d_d    := DateToStr(o['D_DOG']) except d_d    := ''; end;
      try n_do   := o['NUM_DOG']          except n_do   := ''; end;
      try reg_n  := o['REGEST_NUM']       except reg_n  := ''; end;
      try dog_type   := o['DOG_TYPE']  except dog_type := -1; end;
      try type_d := o['N_DOG']         except type_d   := ''; end;
      try
        RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := o['ID_BL_ACCOUNT'];
        DSet.Close;
        DSet.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SP_MAIN_SCH_INFO('''+DateToStr(cxDateEdit3.Date)+''', '+VarToStr(o['ID_BL_ACCOUNT'])+')';
        DSet.Open;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DSet['SCH_TITLE'];
        RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DSet['SCH_NUMBER'];
        DSet.Close;
      except
      begin
        RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := -1;
      end;
      end;
      if RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value <= 0 then
      begin
        DSet.Close;
        DSet.SQLs.SelectSQL.Text := 'SELECT * FROM BU_GET_FOND('''+Class_DataSet.FieldByName('ID_SMETA').AsString+''', '''+Class_DataSet.FieldByName('ID_RAZD').AsString+''', '''+cxDateEdit2.Text+''')';
        DSet.Open;
        if DSet['RESULT'] = 1 then
        begin
         RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := DSet['FOND_TITLE'];
         RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := DSet['ID_FOND'];
         RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value         := DSet['FOND_NUM'];
        end else
        begin
         Showmessage(DSet['RESULT_MESSAGE']);
        end;
      end;
      RxMemoryDataSaveAll.FieldByName('fio_stud').Value                         := ffio;
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := n_cust;
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := StrToDate(d_d);
      RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := reg_n;
      if dog_type = 0 then
      begin
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := '';
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := type_d;
      end;
      if (dog_type = 1) or (dog_type = 2) then
      begin
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value          := ffio;
        RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value           := n_do;
      end;
      RxMemoryDataSaveAll.FieldByName('Storno').Value                           := 0;
      RxMemoryDataSaveAll.FieldByName('Change').Value                           := 0;
      RxMemoryDataSaveAll.Post;
      y.Free;
      o.Free;
    end;
  end;
    DogNich:=true;
    Class_DataSet.Close;
    showafterAdd := true;
  end;
end;

procedure TfmSpravkaDoc.dxBarDellAllClick(Sender: TObject);
begin
  if regimm <> ShowSprav then
  begin
    if ((not RxMemoryDataSaveAll.IsEmpty) and (MessageBox(Handle, Pchar('Ви дійсно бажаєте видалити всі записи?'), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes)) then
    begin
      RxMemoryDataSaveAll.first;
      while  not RxMemoryDataSaveAll.eof do
      begin
        RxMemoryDataSaveAll.Delete;
      end;
      RxMemoryDataSaveAll.next;
    end;
  end;
end;

end.
