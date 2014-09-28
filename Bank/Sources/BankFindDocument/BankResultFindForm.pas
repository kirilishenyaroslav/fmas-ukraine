unit BankResultFindForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSplitter, ExtCtrls, cxContainer, cxTextEdit,
  cxMemo, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, BankFindForm,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, Un_R_file_Alex, cxLabel,
  Un_lo_file_Alex, StdCtrls, ImgList, dxBar,
  dxBarExtItems, cxCheckBox, cxCurrencyEdit, frxClass, frxDesgn, frxDBSet,
  cxDBLabel, frxDMPExport, frxExportPDF, frxExportRTF, frxExportXML,
  frxExportHTML, Placemnt;

type
  TfmBankResultFindForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDatabase1: TpFIBDatabase;
    DataSource1: TDataSource;
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
    pFIBStoredProc1: TpFIBStoredProc;
    DataSet: TpFIBDataSet;
    Query: TpFIBQuery;
    TransactionWrite: TpFIBTransaction;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionPrint: TAction;
    ActionDoc: TAction;
    pFIBDataSet1ID_DOC: TFIBBCDField;
    pFIBDataSet1NUMBER_DOC: TFIBStringField;
    pFIBDataSet1SUMMA_PRIH: TFIBBCDField;
    pFIBDataSet1NOTE_DOC: TFIBStringField;
    pFIBDataSet1FIO_DOC: TFIBStringField;
    pFIBDataSet1PRIHOD: TFIBIntegerField;
    pFIBDataSet1DATE_DOC: TFIBDateField;
    pFIBDataSet1SUMMA_RASH: TFIBBCDField;
    pFIBDataSet1NUM_RAS_NATIVE: TFIBStringField;
    pFIBDataSet1NUM_RAS_CUST: TFIBStringField;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    pFIBDataSet1NAME_CUST: TFIBStringField;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarStatic1: TdxBarStatic;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    ImageList: TImageList;
    DataSetProv: TpFIBDataSet;
    DataSourceProv: TDataSource;
    pFIBDataSet1IS_SPRAVKA: TFIBIntegerField;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    Panel3: TPanel;
    Panel2: TPanel;
    cxTextEdit1: TcxTextEdit;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxCheckBox1: TcxCheckBox;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    DS: TpFIBDataSet;
    DataSetLang: TpFIBDataSet;
    pFIBDataSet1DATE_PROV: TFIBDateField;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    cxDBLabel1: TcxDBLabel;
    frxHTMLExport1: TfrxHTMLExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    pFIBDataSet2: TpFIBDataSet;
    FIBBCDField1: TFIBBCDField;
    FIBStringField1: TFIBStringField;
    FIBBCDField2: TFIBBCDField;
    FIBStringField2: TFIBStringField;
    FIBStringField3: TFIBStringField;
    FIBIntegerField1: TFIBIntegerField;
    FIBDateField1: TFIBDateField;
    FIBBCDField3: TFIBBCDField;
    FIBStringField4: TFIBStringField;
    FIBStringField5: TFIBStringField;
    FIBStringField6: TFIBStringField;
    FIBIntegerField2: TFIBIntegerField;
    FIBDateField2: TFIBDateField;
    FIBStringField7: TFIBStringField;
    FIBStringField8: TFIBStringField;
    FIBBCDField4: TFIBBCDField;
    FIBBCDField5: TFIBBCDField;
    pFIBDataSet2PK_ID: TFIBBCDField;
    pFIBDataSet2PK_: TFIBStringField;
    pFIBDataSet2DATE_REG: TFIBDateField;
    frxDBDataset2: TfrxDBDataset;
    cxTextEdit2: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    pFIBDataSet1COMMENT_PROV_ALL: TFIBStringField;
    cxMemo1: TcxMemo;
    FormStorage1: TFormStorage;
    pFIBDataSet2SMETA_KOD: TFIBIntegerField;
    pFIBDataSet2RAZD_NUM: TFIBIntegerField;
    pFIBDataSet2STATE_NUM: TFIBIntegerField;
    pFIBDataSet2KEKV_KOD: TFIBIntegerField;
    pFIBDataSet2REG_DOG: TFIBStringField;
    frxReport1: TfrxReport;
    Report: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pFIBDataSet1AfterScroll(DataSet: TDataSet);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure ActionDocExecute(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure DataSetProvAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    mainform : TfmBankFindForm;
    flag_na_dataset : boolean;
  public
  show_print : integer;
    id_session : int64;
    constructor Create(AOwner: TComponent; mform: TfmBankFindForm); reintroduce; overload;
  end;

implementation
uses BankShowP, Un_Progress_form, DogLoaderUnit;
{$R *.dfm}

constructor TfmBankResultFindForm.Create(AOwner: TComponent;
  mform: TfmbankFindForm);
var
    T : TfmUn_Progress_form;
    i: integer;
begin
    inherited Create(AOwner);

    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_FIND_WARNING_CAPTION);
    T.show;
    T.Update;
    mainform                         := mform;
    pFIBDatabase1                    := mainform.d;

    pFIBTransaction1.DefaultDatabase := pFIBDatabase1;
    pFIBDatabase1.DefaultTransaction := pFIBTransaction1;
    TransactionWrite.DefaultDatabase := pFIBDatabase1;

    pFIBStoredProc1.database         := pFIBDatabase1;
    DataSet.database                 := pFIBDatabase1;
    DataSetLang.Database             := pFIBDatabase1;
    DS.Database                      := pFIBDatabase1;
    Query.Database                   := pFIBDatabase1;
    pFIBDataSet1.Database            := pFIBDatabase1;
    pFIBDataSet2.Database            := pFIBDatabase1;
    DataSetProv.Database             := pFIBDatabase1;

    flag_na_dataset                  := false;
    cxSplitter2.CloseSplitter;

    pFIBDataSet1.Transaction         := pFIBTransaction1;
    pFIBDataSet2.Transaction         := pFIBTransaction1;
    DataSetLang.Transaction          := pFIBTransaction1;
    DS.Transaction                   := pFIBTransaction1;
    DataSet.Transaction              := pFIBTransaction1;
    DataSetProv.Transaction          := pFIBTransaction1;
    Query.Transaction                := TransactionWrite;
    pFIBTransaction1.StartTransaction;
    TransactionWrite.StartTransaction;
//    pFIBTransaction1.StartTransaction;

    id_session := pFIBDatabase1.Gen_Id('GEN_BANK_SESSION_FIND', 1);

    for i := 0 to length(mainform.ResSch.TT)-1 do
    begin
        Query.Close;
        Query.SQL.Text := 'INSERT INTO BANK_TEMP_FIND_OSN_SCH values (' + IntToStr(mainform.ResSch.TT[i].id) + ', '+IntToStr(id_session)+')';
        Query.ExecQuery;
    end;
    for i := 0 to length(mainform.ResKorSch.TT)-1  do
    begin
        Query.SQL.Clear;
        Query.close;
        Query.SQL.Text := 'INSERT INTO BANK_TEMP_KORRESPOND_SCH values(' + IntToStr(mainform.ResKorSch.TT[i].id) + ', '+IntToStr(id_session)+')';
        Query.ExecQuery;
    end;
    if (mainform.cxRadioButtonPrihod.Checked) or (mainform.cxRadioButtonAll.Checked) then
    begin
        Query.close;
        Query.SQL.Clear;
        Query.SQL.Text := 'INSERT INTO BANK_TEMP_FIND (ID_PROV, ID_SESSION, PRIHOD, ID_DOC)';
        Query.SQL.Add('select pub_dt_all_prov.ID_PROV as ID_PROV, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(1)+' AS PRIHOD, pub_dt_all_doc.pk_id AS ID_DOC');
        Query.SQL.Add('from  pub_dt_all_prov, pub_sp_main_oper, pub_dt_all_doc');
        if (mform.cxCheckBoxFio.Checked) and (mform.RadioButton3.Checked) then
        begin
            Query.SQL.Add(', PUB_SP_CUSTOMER');
        end;

        if mainform.cxCheckBox1.Checked then
        begin
            Query.SQL.Add(', BANK_TEMP_KORRESPOND_SCH');
        end;

        if mainform.cxCheckBox10.Checked then
        begin
            Query.SQL.Add(', BU_SMET_PLUS_PERIODS');
        end;
        
        Query.SQL.Add(', BANK_TEMP_FIND_OSN_SCH');

        Query.SQL.Add('where pub_dt_all_prov.id_oper=pub_sp_main_oper.id_oper');
        if (mform.cxCheckBoxFio.Checked) and (mform.RadioButton3.Checked) then
        begin
            Query.SQL.Add('and pub_dt_all_doc.id_customer=PUB_SP_CUSTOMER.ID_CUSTOMER');
            Query.SQL.Add('and upper(PUB_SP_CUSTOMER.NAME_CUSTOMER) like '''+'%' + mainform.cxTextEdit1.Text + '%'+'''');
        end;
//        Query.SQL.Add('AND (exists (select * from BANK_TEMP_FIND_OSN_SCH where BANK_TEMP_FIND_OSN_SCH.ID_SCH=pub_sp_main_oper.oper_db_id_sch and BANK_TEMP_FIND_OSN_SCH.ID_SESSION='+IntToStr(id_session)+' ))');

        //if mainform.cxCheckBox1.Checked then   //
           // Query.SQL.Add('AND (exists (select * from BANK_TEMP_KORRESPOND_SCH where BANK_TEMP_KORRESPOND_SCH.ID_KOR_SCH=pub_sp_main_oper.oper_kr_id_sch and BANK_TEMP_KORRESPOND_SCH.ID_SESSION='+IntToStr(id_session)+' ))');
        if mainform.cxCheckBox1.Checked then
        begin
            Query.SQL.Add('AND pub_sp_main_oper.oper_kr_id_sch=BANK_TEMP_KORRESPOND_SCH.ID_KOR_SCH and BANK_TEMP_KORRESPOND_SCH.ID_SESSION='+IntToStr(id_session)+' ');
        end;

        Query.SQL.Add('AND pub_sp_main_oper.oper_db_id_sch=BANK_TEMP_FIND_OSN_SCH.ID_SCH and BANK_TEMP_FIND_OSN_SCH.ID_SESSION='+IntToStr(id_session)+' ');

        Query.SQL.Add('AND pub_dt_all_prov.db_id_doc=pub_dt_all_doc.id_doc');
        if mainform.cxRadioButton1.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC >='''+mainform.cxDateEditFrom.Text+'''');
            Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC <='''+mainform.cxDateEditTo.Text+'''');
        end;
        if mainform.cxRadioButton2.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.DATE_PROV >='''+mainform.cxDateEditProvFrom.Text+'''');
            Query.SQL.Add('AND pub_dt_all_doc.DATE_PROV <='''+mainform.cxDateEditProvTo.Text+'''');
        end;
        if mainform.cxCheckBoxSumma.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.summa >='+StringReplace(mainform.cxTextEditFrom.Text, ',', '.', [rfReplaceAll])+'');
            Query.SQL.Add('AND pub_dt_all_doc.summa <='+StringReplace(mainform.cxTextEditTo.Text, ',', '.', [rfReplaceAll])+'');
        end;
        if mainform.cxCheckBox8.Checked then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.num_doc) like '''+'%' + mainform.cxTextEdit_num.Text + '%'+'''');
        end;
        if mainform.cxCheckBoxFio.Checked then
        begin
            if mainform.RadioButton1.Checked then Query.SQL.Add('AND pub_dt_all_doc.id_customer='+IntToStr(mainform.id_customer)+' ');
            if mainform.RadioButton2.Checked then Query.SQL.Add('AND pub_dt_all_doc.ID_RATE_ACC='+IntToStr(mainform.id_ras)+' ');
        end;
        if mainform.cxCheckBox3.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.ID_RATE_ACC_NATIVE='+IntToStr(mainform.id_ras_native)+' ');
        end;
        if mainform.cxCheckBoxNote.Checked then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.note) like '''+'%'+AnsiUpperCase(mainform.cxTextEditNote.Text)+'%'+'''');
        end;
        Query.SQL.Add('AND pub_dt_all_doc.prihod=1');
        if mainform.cxCheckBox4.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.db_id_dog='+IntToStr(mainform.id_dog)+'');
            Query.SQL.Add('AND pub_dt_all_prov.db_kod_dog='+IntToStr(mainform.kod_dog)+'');
        end;
        if mainform.cxCheckBox7.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.db_id_dog='+IntToStr(mainform.id_dog)+'');
            Query.SQL.Add('AND pub_dt_all_prov.db_kod_dog='+IntToStr(mainform.kod_dog)+'');
        end;
        if mainform.cxCheckBoxComment.Checked then
        begin

            Query.SQL.Add('AND upper(pub_dt_all_prov.comments) like '''+'%'+AnsiUpperCase(mainform.cxTextEditComment.Text)+'%'+'''');
        end;
        if mainform.cxCheckBoxMen.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.id_men=' + IntToStr(mainform.id_men)+'');
        end;
        if mainform.cxCheckBox5.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.db_id_sm=' + IntToStr(mainform.id_smeta)+'');
        end;
        if (mainform.cxRadioButton4.Checked) and (mainform.cxCheckbox9.checked) then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.db_id_rz=' + IntToStr(mainform.id_razd)+'');
        end;
        if (mainform.cxRadioButton5.Checked) and (mainform.cxCheckbox9.checked) then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.db_id_st=' + IntToStr(mainform.id_state)+'');
        end;
        if mainform.cxCheckBox6.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.db_id_kekv=' + IntToStr(mainform.id_kekv)+'');
        end;
        if mainform.cxRadiobutton6.checked then
        begin
           Query.SQL.Add('AND pub_dt_all_doc.id_type_doc = '+IntToStr(2)+'');
        end;
        if mainform.cxRadiobutton7.checked then
        begin
           Query.SQL.Add('AND PUB_DT_ALL_DOC.ID_TYPE_DOC<>'+IntToStr(2)+'');
        end;
        if mainform.cxCheckBox10.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.db_id_sm = BU_SMET_PLUS_PERIODS.id_smeta AND BU_SMET_PLUS_PERIODS.date_end > ''now'' and BU_SMET_PLUS_PERIODS.id_sm_group = ' + IntToStr(mainform.id_sm_group)+'');
        end;
        Query.SQL.Add(' group by pub_dt_all_prov.ID_PROV, pub_dt_all_doc.pk_id');

        //showmessage(Query.SQL.Text);
        Query.ExecQuery;
    end;


    if (mainform.cxRadioButton3.Checked) or (mainform.cxRadioButtonAll.Checked) then
    begin
        Query.close;
        Query.SQL.Text := 'INSERT INTO BANK_TEMP_FIND (ID_PROV, ID_SESSION, PRIHOD, ID_DOC)';
        Query.SQL.Add('select pub_dt_all_prov.ID_PROV as ID_PROV, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(0)+' AS PRIHOD, pub_dt_all_doc.pk_id AS ID_DOC');
        Query.SQL.Add('from  pub_dt_all_prov, pub_sp_main_oper, pub_dt_all_doc');
        if (mform.cxCheckBoxFio.Checked) and (mform.RadioButton3.Checked) then
        begin
            Query.SQL.Add(', PUB_SP_CUSTOMER');
        end;

        if mainform.cxCheckBox1.Checked then
        begin
            Query.SQL.Add(', BANK_TEMP_KORRESPOND_SCH');
        end;

        if mainform.cxCheckBox10.Checked then
        begin
            Query.SQL.Add(', BU_SMET_PLUS_PERIODS');
        end;

        Query.SQL.Add(', BANK_TEMP_FIND_OSN_SCH');

        Query.SQL.Add('where pub_dt_all_prov.id_oper=pub_sp_main_oper.id_oper');
        if (mform.cxCheckBoxFio.Checked) and (mform.RadioButton3.Checked) then
        begin
            Query.SQL.Add('and pub_dt_all_doc.id_customer=PUB_SP_CUSTOMER.ID_CUSTOMER');
            Query.SQL.Add('and upper(PUB_SP_CUSTOMER.NAME_CUSTOMER) like '''+'%' + mainform.cxTextEdit1.Text + '%'+'''');
        end;
//        Query.SQL.Add('AND (exists (select * from BANK_TEMP_FIND_OSN_SCH where BANK_TEMP_FIND_OSN_SCH.ID_SCH=pub_sp_main_oper.oper_kr_id_sch and BANK_TEMP_FIND_OSN_SCH.ID_SESSION='+IntToStr(id_session)+' ))');

//        if mainform.cxCheckBox1.Checked then
//            Query.SQL.Add('AND (exists (select * from BANK_TEMP_KORRESPOND_SCH where BANK_TEMP_KORRESPOND_SCH.ID_KOR_SCH=pub_sp_main_oper.oper_db_id_sch and BANK_TEMP_KORRESPOND_SCH.ID_SESSION='+IntToStr(id_session)+' ))');

        if mainform.cxCheckBox1.Checked then
        begin
            Query.SQL.Add('AND pub_sp_main_oper.oper_db_id_sch=BANK_TEMP_KORRESPOND_SCH.ID_KOR_SCH and BANK_TEMP_KORRESPOND_SCH.ID_SESSION='+IntToStr(id_session)+' ');
        end;

        Query.SQL.Add('AND pub_sp_main_oper.oper_kr_id_sch=BANK_TEMP_FIND_OSN_SCH.ID_SCH and BANK_TEMP_FIND_OSN_SCH.ID_SESSION='+IntToStr(id_session)+' ');


        Query.SQL.Add('AND pub_dt_all_prov.kr_id_doc=pub_dt_all_doc.id_doc');
        if mainform.cxRadioButton1.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC >='''+mainform.cxDateEditFrom.Text+'''');
            Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC <='''+mainform.cxDateEditTo.Text+'''');
        end;
        if mainform.cxRadioButton2.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.DATE_PROV >='''+mainform.cxDateEditProvFrom.Text+'''');
            Query.SQL.Add('AND pub_dt_all_doc.DATE_PROV <='''+mainform.cxDateEditProvTo.Text+'''');
        end;
        if mainform.cxCheckBoxSumma.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.summa >='+StringReplace(mainform.cxTextEditFrom.Text, ',', '.', [rfReplaceAll])+'');
            Query.SQL.Add('AND pub_dt_all_doc.summa <='+StringReplace(mainform.cxTextEditTo.Text, ',', '.', [rfReplaceAll])+'');
        end;
        if mainform.cxCheckBoxFio.Checked then
        begin
            if mainform.RadioButton1.Checked then Query.SQL.Add('AND pub_dt_all_doc.id_customer='+IntToStr(mainform.id_customer)+' ');
            if mainform.RadioButton2.Checked then Query.SQL.Add('AND pub_dt_all_doc.ID_RATE_ACC='+IntToStr(mainform.id_ras)+' ');
        end;
        if mainform.cxCheckBox3.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.ID_RATE_ACC_NATIVE='+IntToStr(mainform.id_ras_native)+' ');
        end;
        if mainform.cxCheckBoxNote.Checked then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.note) like '''+'%'+AnsiUpperCase(mainform.cxTextEditNote.Text)+'%'+'''');
        end;
            Query.SQL.Add('AND pub_dt_all_doc.prihod=0');

        if mainform.cxCheckBox8.Checked then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.num_doc) like '''+'%' + mainform.cxTextEdit_num.Text + '%'+'''');
        end;

        if mainform.cxCheckBox4.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.kr_id_dog='+IntToStr(mainform.id_dog)+'');
            Query.SQL.Add('AND pub_dt_all_prov.kr_kod_dog='+IntToStr(mainform.kod_dog)+'');
        end;
        if mainform.cxCheckBox7.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.kr_id_dog='+IntToStr(mainform.id_dog)+'');
            Query.SQL.Add('AND pub_dt_all_prov.kr_kod_dog='+IntToStr(mainform.kod_dog)+'');
        end;
        if mainform.cxCheckBoxComment.Checked then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_prov.comments) like '''+'%'+AnsiUpperCase(mainform.cxTextEditComment.Text)+'%'+'''');
        end;
        if mainform.cxCheckBoxMen.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.id_men=' + IntToStr(mainform.id_men)+'');
        end;
        if mainform.cxCheckBox5.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.kr_id_sm=' + IntToStr(mainform.id_smeta)+'');
        end;
        if (mainform.cxRadioButton4.Checked) and (mainform.cxCheckbox9.checked) then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.kr_id_rz=' + IntToStr(mainform.id_razd)+'');
        end;
        if (mainform.cxRadioButton5.Checked) and (mainform.cxCheckbox9.checked) then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.kr_id_st=' + IntToStr(mainform.id_state)+'');
        end;
        if mainform.cxCheckBox6.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.kr_id_kekv=' + IntToStr(mainform.id_kekv)+'');
        end;
        if mainform.cxRadiobutton6.checked then
        begin
           Query.SQL.Add('AND pub_dt_all_doc.id_type_doc = '+IntToStr(2)+'');
        end;
        if mainform.cxRadiobutton7.checked then
        begin
           Query.SQL.Add('AND PUB_DT_ALL_DOC.ID_TYPE_DOC<>'+IntToStr(2)+'');
        end;
        if mainform.cxCheckBox10.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.kr_id_sm = BU_SMET_PLUS_PERIODS.id_smeta AND BU_SMET_PLUS_PERIODS.date_end > ''now'' and BU_SMET_PLUS_PERIODS.id_sm_group = ' + IntToStr(mainform.id_sm_group)+'');
        end;
        Query.SQL.Add('group by pub_dt_all_prov.ID_PROV, pub_dt_all_doc.pk_id');

        //showmessage(Query.SQL.Text);
        Query.ExecQuery;
    end;

    TransactionWrite.Commit;

   // pFIBDataSet1.Transaction.StartTransaction;
    pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_FIND_ALL('+ IntToStr(id_session)+')';
    pFIBDataSet1.Open;
    pFIBDataSet1.FetchAll;



   { Query.Transaction := TransactionWrite;
    TransactionWrite.StartTransaction;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM BANK_TEMP_FIND WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM BANK_TEMP_FIND_OSN_SCH WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM BANK_TEMP_KORRESPOND_SCH WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    TransactionWrite.Commit; }

    cxLabel2.Caption := Un_R_file_Alex.BANK_COUNT_PAGE + IntToStr(pFIBDataSet1.RecordCount);

    Caption                              := Un_R_file_Alex.KASSA_FIND_RESULT_CAPTION;
    cxLabel1.Caption                     := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxLabel5.Caption                     := Un_R_file_Alex.BANK_COMMENT_PROV;
    cxLabel3.Caption                     := Un_R_file_Alex.BANK_NAME_CUSTMERA;
    cxLabel4.Caption                     := Un_R_file_Alex.BANK_COMMENT_PROV;

    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.BANK_NUM_DOCUMENT;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_FIND_DATE_DOC;
    cxGrid1DBTableView1DBColumn3.Caption := Un_R_file_Alex.BANK_R_S;
    cxGrid1DBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_DOC_PRIHOD;
    cxGrid1DBTableView1DBColumn5.Caption := Un_R_file_Alex.KASSA_DOC_RASHOD;
    cxGrid1DBTableView1DBColumn6.Caption := Un_R_file_Alex.BANK_P_S_NAME_CUSTOMER;
    cxGrid1DBTableView1DBColumn7.Caption := Un_R_file_Alex.BANK_FULL_NAME_CUSTOMER;
    cxGrid1DBTableView1DBColumn9.Caption := Un_R_file_Alex.BANK_DATE_VIP;
    ActionPrint.Caption                  := Un_R_file_Alex.MY_ACTION_PRINT;
    ActionClose.Caption                  := Un_R_file_Alex.N_AUTOKOD_FORM_CANCLE;


    cxGrid2DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_SCH_KASSA;
    cxGrid2DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_SCH_KOR_SHORT;
    cxGrid2DBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_SMETA;
    cxGrid2DBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_RAZD;
    cxGrid2DBTableView1DBColumn5.Caption := Un_R_file_Alex.KASSA_STAT;
    cxGrid2DBTableView1DBColumn6.Caption := Un_R_file_Alex.KASSA_KEKV;
    cxGrid2DBTableView1DBColumn7.Caption := Un_R_file_Alex.KASSA_SUMMA;
    cxCheckBox1.Properties.Caption       := Un_R_file_Alex.BANK_FIND_SHOW_PROV;

    T.Free;
    flag_na_dataset := true;
end;

procedure TfmBankResultFindForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Query.Transaction := TransactionWrite;
    TransactionWrite.StartTransaction;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM BANK_TEMP_FIND WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM BANK_TEMP_FIND_OSN_SCH WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM BANK_TEMP_KORRESPOND_SCH WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    TransactionWrite.Commit; 

    if FormStyle = fsMDIChild then Action := caFree;

    FormStorage1.SaveFormPlacement;
end;

procedure TfmBankResultFindForm.pFIBDataSet1AfterScroll(
  DataSet: TDataSet);
begin
//    if flag_na_dataset then
    begin
//        LabelNote.Caption := pFIBDataSet1.FieldByName('NOTE_DOC').AsString;
    end;
    if pFIBDataSet1['COMMENT_PROV_ALL'] <> null
       then cxMemo1.Text    := pFIBDataSet1['COMMENT_PROV_ALL']
       else cxMemo1.Text    := '';

    if cxCheckBox1.Checked then
    begin
        DataSetProv.Close;
        DataSetProv.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_ALL_PROV('''+pFIBDataSet1.FieldByName('ID_DOC').AsString+''', '''+pFIBDataSet1.FieldByName('PRIHOD').AsString+''')';
        DataSetProv.Open;
    end;
end;

procedure TfmBankResultFindForm.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmBankResultFindForm.ActionPrintExecute(Sender: TObject);
var
    Res : Variant;
    pk_i : string;
    id_lang : integer;
begin
    //pFIBDataSet1.DisableControls;


    if ShowPrFormBank(Self, Self, Res) then
    begin
        DataSetLang.Close;
        DataSetLang.Sqls.SelectSql.Text := 'select * from PUB_SYS_DATA';
        DataSetLang.Open;
        id_lang := DataSetLang.FieldByName('ID_LANGUAGE').AsInteger;
        DataSetLang.Close;

        if VarArrayDimCount(Res) > 0 then
        begin
            if res[0][0] = 1 then
            begin

                pFIBDataSet1.Close;
                pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_FIND_ALL('+ IntToStr(id_session)+')';

                pFIBDataSet1.open;
                pFIBDataSet1.FetchAll;
                if id_lang = 1 then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_find_all.fr3');
                if id_lang = 0 then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_find_all_ukr.fr3');
                if mainform.cxCheckBox2.Checked
                    then Report.Variables['OS_SCH']    := Quotedstr(mainform.cxButtonEdit1.Text)
                    else Report.Variables['OS_SCH']    := Quotedstr(mainform.cxLabel1.Caption);
                if mainform.cxCheckBox1.Checked
                    then Report.Variables['KOR_SCH']   := Quotedstr(mainform.cxButtonEdit2.Text)
                    else Report.Variables['KOR_SCH']   := Quotedstr(mainform.cxLabel9.Caption);
                if mainform.cxRadioButton1.Checked then
                begin
                    Report.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditFrom.Text);
                    Report.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditTo.Text);
                end else
                if mainform.cxRadioButton2.Checked then
                begin
                    Report.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditProvFrom.Text);
                    Report.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditProvTo.Text);
                end;
                if mainform.cxCheckBoxSumma.Checked
                    then Report.Variables['SUMMA']     := Quotedstr(mainform.cxLabel7.Caption+' '+mainform.cxTextEditFrom.Text + ' ' + mainform.cxLabel8.Caption + ' ' + mainform.cxTextEditTo.Text)
                    else Report.Variables['SUMMA']     := Quotedstr(mainform.cxLabel4.Caption);
                if mainform.cxCheckBoxFio.Checked
                    then Report.Variables['FIO']       := Quotedstr(mainform.cxButtonEdit3.Text)
                    else Report.Variables['FIO']       := Quotedstr(mainform.cxLabel5.Caption);
                if mainform.cxCheckBoxNote.Checked
                    then Report.Variables['NOTE']      := Quotedstr(mainform.cxTextEditNote.Text)
                    else Report.Variables['NOTE']      := Quotedstr(mainform.cxLabel6.Caption);
                if mainform.cxRadioButtonAll.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonAll.Caption);
                if mainform.cxRadioButton3.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButton3.Caption);
                if mainform.cxRadioButtonPrihod.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonPrihod.Caption);
                Report.PrepareReport;
                //report.DesignReport;
//        if not cxCheckBoxEdit.Checked then
//        begin
                if res[0][2] = 0 then
                begin
                        Report.PrintOptions.Copies:=  Res[0][1];
                        Report.Print;
                end
                else Report.ShowReport;

//        end else
            end;
            if res[1][0] = 1 then
            begin
                pFIBDataSet1.Close;
                pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_FIND_ALL('+ IntToStr(id_session) +')';
                pFIBDataSet1.open;
                pFIBDataSet1.FetchAll;
                
                if id_lang = 1 then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_find_all_note.fr3');
                if id_lang = 0 then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_find_all_note_ukr.fr3');
                if mainform.cxCheckBox2.Checked
                    then Report.Variables['OS_SCH']    := Quotedstr(mainform.cxButtonEdit1.Text)
                    else Report.Variables['OS_SCH']    := Quotedstr(mainform.cxLabel1.Caption);
                if mainform.cxCheckBox1.Checked
                    then Report.Variables['KOR_SCH']   := Quotedstr(mainform.cxButtonEdit2.Text)
                    else Report.Variables['KOR_SCH']   := Quotedstr(mainform.cxLabel9.Caption);
                if mainform.cxRadioButton1.Checked then
                begin
                    Report.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditFrom.Text);
                    Report.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditTo.Text);
                end else
                if mainform.cxRadioButton2.Checked then
                begin
                    Report.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditProvFrom.Text);
                    Report.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditProvTo.Text);
                end;
                if mainform.cxCheckBoxSumma.Checked
                    then Report.Variables['SUMMA']     := Quotedstr(mainform.cxLabel7.Caption+' '+mainform.cxTextEditFrom.Text + ' ' + mainform.cxLabel8.Caption + ' ' + mainform.cxTextEditTo.Text)
                    else Report.Variables['SUMMA']     := Quotedstr(mainform.cxLabel4.Caption);
                if mainform.cxCheckBoxFio.Checked
                    then Report.Variables['FIO']       := Quotedstr(mainform.cxButtonEdit3.Text)
                    else Report.Variables['FIO']       := Quotedstr(mainform.cxLabel5.Caption);
                if mainform.cxCheckBoxNote.Checked
                    then Report.Variables['NOTE']      := Quotedstr(mainform.cxTextEditNote.Text)
                    else Report.Variables['NOTE']      := Quotedstr(mainform.cxLabel6.Caption);
                if mainform.cxRadioButtonAll.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonAll.Caption);
                if mainform.cxRadioButton3.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButton3.Caption);
                if mainform.cxRadioButtonPrihod.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonPrihod.Caption);
                Report.PrepareReport;
                //report.DesignReport;
                if res[1][2] = 0 then
                begin
                    Report.PrintOptions.Copies:=  Res[0][1];
                    Report.Print;
                end
                else Report.ShowReport;
            end;
            if res[3][3] = 1 then
            begin
                pFIBDataSet2.Close;
                pFIBDataSet2.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_FIND_ALL_PROV('+ IntToStr(id_session) +')';

                pFIBDataSet2.open;
                pFIBDataSet2.FetchAll;
                if id_lang = 1 then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_find_all_note.fr3');
                if id_lang = 0 then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_find_all_note_korresp_ukr.fr3');
                if mainform.cxCheckBox2.Checked
                    then Report.Variables['OS_SCH']    := Quotedstr(mainform.cxButtonEdit1.Text)
                    else Report.Variables['OS_SCH']    := Quotedstr(mainform.cxLabel1.Caption);
                if mainform.cxCheckBox1.Checked
                    then Report.Variables['KOR_SCH']   := Quotedstr(mainform.cxButtonEdit2.Text)
                    else Report.Variables['KOR_SCH']   := Quotedstr(mainform.cxLabel9.Caption);
                if mainform.cxRadioButton1.Checked then
                begin
                    Report.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditFrom.Text);
                    Report.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditTo.Text);
                end else
                if mainform.cxRadioButton2.Checked then
                begin
                    Report.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditProvFrom.Text);
                    Report.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditProvTo.Text);
                end;
                if mainform.cxCheckBoxSumma.Checked
                    then Report.Variables['SUMMA']     := Quotedstr(mainform.cxLabel7.Caption+' '+mainform.cxTextEditFrom.Text + ' ' + mainform.cxLabel8.Caption + ' ' + mainform.cxTextEditTo.Text)
                    else Report.Variables['SUMMA']     := Quotedstr(mainform.cxLabel4.Caption);
                if mainform.cxCheckBoxFio.Checked
                    then Report.Variables['FIO']       := Quotedstr(mainform.cxButtonEdit3.Text)
                    else Report.Variables['FIO']       := Quotedstr(mainform.cxLabel5.Caption);
                if mainform.cxCheckBoxNote.Checked
                    then Report.Variables['NOTE']      := Quotedstr(mainform.cxTextEditNote.Text)
                    else Report.Variables['NOTE']      := Quotedstr(mainform.cxLabel6.Caption);
                if mainform.cxRadioButtonAll.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonAll.Caption);
                if mainform.cxRadioButton3.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButton3.Caption);
                if mainform.cxRadioButtonPrihod.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonPrihod.Caption);
                Report.PrepareReport;
                //report.DesignReport;
                if res[3][2] = 0 then
                begin
                    Report.PrintOptions.Copies:=  Res[3][1];
                    Report.Print;
                end
                else Report.ShowReport;
            end;

            if res[2][0] = 1 then
            begin
                if pFIBDataSet1.FieldByName('PRIHOD').AsInteger = 1
                    then
                    begin
                        if id_lang = 1 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2007.fr3');
                        if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2007_ukr.fr3');
                    end
                    else
                    begin
                        if id_lang = 1 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2008.fr3');
                        if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2008_ukr.fr3');
                    end;

                pk_i := pFIBDataSet1.FieldByName('ID_DOC').AsString;
                DS.Close;
                DS.SQLs.SelectSQL.Text := 'select * from BANK_SELECT_INFO_FOR_SPRAV_FIND('''+pk_i+''')';
                DS.Open;
                frxReport1.Variables['sum_doc']        := Quotedstr(DS.FieldByName('SUM_DOC').AsString);
                frxReport1.Variables['date_doc']       := Quotedstr(DS.FieldByName('DATE_DOC').AsString);
                frxReport1.Variables['num_doc']        := Quotedstr(DS.FieldByName('NUM_DOC').AsString);
                frxReport1.Variables['note']           := Quotedstr(DS.FieldByName('NOTE').AsString);
                frxReport1.Variables['name_sch']       := Quotedstr(DS.FieldByName('SCH').AsString);
                frxReport1.Variables['tytle_sch']      := Quotedstr(DS.FieldByName('SCH_TITLY').AsString);
                frxReport1.Variables['name_pred']      := Quotedstr(DS.FieldByName('NAME').AsString);
                frxReport1.Variables['OKPO']           := Quotedstr(DS.FieldByName('OKPO').AsString);
                frxReport1.Variables['RS']             := Quotedstr(DS.FieldByName('RS').AsString);
                frxReport1.Variables['mfo']            := Quotedstr(DS.FieldByName('MFO').AsString);
                frxReport1.Variables['bank']           := Quotedstr(DS.FieldByName('BANK').AsString);
                frxReport1.Variables['OKPO_cust']      := Quotedstr(DS.FieldByName('OKPO_CUST').AsString);
                frxReport1.Variables['name_pred_cust'] := Quotedstr(DS.FieldByName('NAME_CUST').AsString);
                frxReport1.Variables['RS_cust']        := Quotedstr(DS.FieldByName('RS_CUST').AsString);
                frxReport1.Variables['mfo_cust']       := Quotedstr(DS.FieldByName('MFO_CUST').AsString);
                frxReport1.Variables['bank_cust']      := Quotedstr(DS.FieldByName('BANK_CUST').AsString);

                frxReport1.PrepareReport;
                if res[2][2] = 0 then
                begin
                     frxReport1.Print;
                end
                else frxReport1.ShowReport;
                DS.Close;
            end;
        end;
   end;
   pFIBDataSet1.EnableControls;
end;

procedure TfmBankResultFindForm.cxGrid1DBTableView1DblClick(
  Sender: TObject);
{var
    res : integer;
    id_doc_all, id_1, id_2, id_3 : int64;}
begin
{   id_doc_all := pFIBDataSet1['ID_DOC'];
   DataSet.close;
   DataSet.Sqls.SelectSql.Text :=  'SELECT * FROM KASSA_SELECT_ALL_PO_ALL_DOC('+IntToStr(id_doc_all)+')';
   DataSet.Open;
   if not DataSet.IsEmpty then
   begin
       id_1 := DataSet.FieldByName('R_ID_KASSA').AsVariant;
       id_2 := DataSet.FieldByName('R_ID_DAY').AsVariant;
       id_3 := DataSet.FieldByName('R_ID_DOC').AsVariant;
       res := Un_lo_file_Alex.LKassaDocShow(self, mainform.id_user, pFIBDatabase1, id_1, id_2 , id_3);
   end;}
end;

procedure TfmBankResultFindForm.ActionDocExecute(Sender: TObject);
begin
    cxGrid1DBTableView1DblClick(Self);
end;

procedure TfmBankResultFindForm.cxCheckBox1Click(Sender: TObject);
var
    id_ddd : string;
    prihod_n : integer;
begin
    if cxCheckBox1.Checked then
    begin
        cxSplitter2.OpenSplitter;
        DataSetProv.Close;
        id_ddd   := pFIBDataSet1.FieldByName('ID_DOC').AsString;
        prihod_n := pFIBDataSet1.FieldByName('PRIHOD').AsInteger;
        DataSetProv.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_ALL_PROV('''+id_ddd+''', '+IntToStr(prihod_n)+')';
        DataSetProv.Open;
    end
    else cxSplitter2.CloseSplitter;
end;

procedure TfmBankResultFindForm.DataSetProvAfterScroll(DataSet: TDataSet);
var
    ffio, n_cust, n_do, reg_n, d_d : string;
    y, o : TSpravParams;
    dog_type : integer;
begin
    cxTextEdit1.Text := '';
    y                    := TSpravParams.Create;
    o                    := TSpravParams.Create;
    y['DataBase']        := Integer(pFIBDatabase1.Handle);
    y['ReadTransaction'] := Integer(pFIBDatabase1.DefaultTransaction.Handle);
    y['ID_DOG']          := strtoint64(DataSetProv.FieldByName('ID_DOG').AsString);
    y['KOD_DOG']         := strtoint64(DataSetProv.FieldByName('KOD_DOG').AsString);
    GetDogovorInfo(Self, @y, @o);
//  ShowSpravParams(Self, o);
    try ffio     := o['FIO_COMBO']        except ffio    := ''; end;
    try n_cust   := o['NAME_CUSTOMER']    except n_cust  := ''; end;
    try d_d      := DateToStr(o['D_DOG']) except d_d     := ''; end;
    try reg_n    := o['REGEST_NUM']       except reg_n   := ''; end;
    try dog_type := o['DOG_TYPE']         except dog_type := -1 end;
    if dog_type = 0 then   {другие}
    begin
        try n_do   := o['N_DOG']   except n_do := ''; end;
    end;
    if (dog_type = 1) or (dog_type = 2) then
    begin
        try n_do   := o['NUM_DOG'] except n_do := ''; end;
    end;
    cxTextEdit1.Text := ffio + ' ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' ' + n_cust + ' ' + n_do + Un_R_file_Alex.BANK_REG_NUM + reg_n + ' от - ' + d_d;
    if DataSetProv['NOTE_PROV'] <> null      then cxTextEdit2.Text := DataSetProv['NOTE_PROV'] else cxTextEdit2.Text := '';;
    y.Free;
    o.Free;
end;

procedure TfmBankResultFindForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if ({AViewInfo.GridRecord.Values[8]}AViewInfo.GridRecord.Values[cxGrid1DBTableView1DBColumn8.Index] = 1) and (not AViewInfo.GridRecord.Focused) then
  begin //заблокированные сальдом
      ACanvas.Canvas.Font.Color := RGB(0,0,255);//синий;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  if (not AViewInfo.GridRecord.Focused) then
  begin   // остальные
      ACanvas.Canvas.Font.Color := clBlack;//RGB(51,102,0);//темно-зелёный;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmBankResultFindForm.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;
end;

end.
