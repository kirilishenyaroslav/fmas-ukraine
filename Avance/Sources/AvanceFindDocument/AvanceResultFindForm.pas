unit AvanceResultFindForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSplitter, ExtCtrls, cxContainer, cxTextEdit,
  cxMemo, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, AvanceFindForm, ProgressFormAvance,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, Un_R_file_Alex, cxLabel,
  FR_Class, FR_DSet, FR_DBSet, Un_lo_file_Alex, StdCtrls, cxCurrencyEdit,
  dxBar, dxBarExtItems, ImgList, cxCheckBox, frxClass, frxDBSet, frxDesgn,
  frxExportXLS, frxExportXML;

type
  TfmAvanceResultFindForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
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
    cxLabel1: TcxLabel;
    ActionPrint: TAction;
    cxLabel2: TcxLabel;
    LabelNote: TLabel;
    ActionDoc: TAction;
    pFIBDataSet1ID_DOC: TFIBBCDField;
    pFIBDataSet1NUMBER_DOC: TFIBStringField;
    pFIBDataSet1SUMMA_PRIH: TFIBBCDField;
    pFIBDataSet1NOTE_DOC: TFIBStringField;
    pFIBDataSet1FIO_DOC: TFIBStringField;
    pFIBDataSet1PRIHOD: TFIBIntegerField;
    pFIBDataSet1DATE_DOC: TFIBDateField;
    pFIBDataSet1SUMMA_RASH: TFIBBCDField;
    pFIBDataSet1SHORT_NAME_DOC: TFIBStringField;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    DataSetLang: TpFIBDataSet;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ImageList1: TImageList;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton4: TdxBarLargeButton;
    cxSplitter2: TcxSplitter;
    Panel3: TPanel;
    Panel2: TPanel;
    cxTextEdit1: TcxTextEdit;
    cxGrid3: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    cxCheckBox1: TcxCheckBox;
    DataSetProv: TpFIBDataSet;
    DataSetProvSUMMA: TFIBBCDField;
    DataSetProvID_SM: TFIBBCDField;
    DataSetProvID_RAZD: TFIBBCDField;
    DataSetProvID_ST: TFIBBCDField;
    DataSetProvID_KEKV: TFIBBCDField;
    DataSetProvID_DOG: TFIBBCDField;
    DataSetProvKOD_DOG: TFIBBCDField;
    DataSetProvID_MAN: TFIBBCDField;
    DataSetProvID_SCH: TFIBBCDField;
    DataSetProvSUMMA_VALUE: TFIBBCDField;
    DataSetProvID_VALUE: TFIBBCDField;
    DataSetProvSMETA_KOD: TFIBIntegerField;
    DataSetProvRAZD_NUM: TFIBIntegerField;
    DataSetProvKEKV_KOD: TFIBIntegerField;
    DataSetProvFIO_MAN: TFIBStringField;
    DataSetProvSCH_NUMBER: TFIBStringField;
    DataSetProvSTAT_KOD: TFIBIntegerField;
    DataSetProvID_KASS_SH: TFIBBCDField;
    DataSetProvSCH_KASS_NUMBER: TFIBStringField;
    DataSetProvID_ALL_PROV: TFIBBCDField;
    DataSetProvTITLE_SMETA: TFIBStringField;
    DataSetProvTITLE_RAZD: TFIBStringField;
    DataSetProvTITLE_STATE: TFIBStringField;
    DataSetProvTITLE_KEKV: TFIBStringField;
    DataSetProvDATE_DOG: TFIBDateField;
    DataSetProvNAME_CUST: TFIBStringField;
    DataSetProvTITLE_SCH: TFIBStringField;
    DataSetProvTITLE_KOR_SCH: TFIBStringField;
    DataSetProvTYPE_DOG: TFIBStringField;
    DataSetProvREG_DOG: TFIBStringField;
    DataSetProvNUM_DOG: TFIBStringField;
    DataSetProvTIN: TFIBStringField;
    DataSetProvBIRTHDAY: TFIBDateField;
    DataSourceProv: TDataSource;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    frxDBDataset1: TfrxDBDataset;
    pFIBDataSet1TIN: TFIBStringField;
    frxDesigner1: TfrxDesigner;
    pFIBDataSet1ID_MEN_: TFIBStringField;
    frxXMLExport1: TfrxXMLExport;
    pFIBDataSet1KOM_DATE_BEG: TFIBDateField;
    pFIBDataSet1KOM_DATE_END: TFIBDateField;
    DataSetRazd: TpFIBDataSet;
    DataSetRazdFIO_DOC: TFIBStringField;
    DataSetRazdTIN: TFIBStringField;
    DataSetRazdSUM_RZ: TFIBBCDField;
    DataSetRazdRAZD_NUM: TFIBIntegerField;
    frxDBDataset2: TfrxDBDataset;
    DataSetRazdSUM_MEN: TFIBBCDField;
    DataSetRazdID_MEN_: TFIBStringField;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pFIBDataSet1AfterScroll(DataSet: TDataSet);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure ActionDocExecute(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure DataSetProvAfterScroll(DataSet: TDataSet);
  private
    mainform : TfmAvanceFindForm;
    flag_na_dataset : boolean;
  public
    id_session : int64;
    constructor Create(AOwner: TComponent; mform: TfmAvanceFindForm); reintroduce; overload;
  end;

implementation
uses AvanceShowP, DogLoaderUnit;
{$R *.dfm}

constructor TfmAvanceResultFindForm.Create(AOwner: TComponent;
  mform: TfmAvanceFindForm);
var
    T : TfmProgressFormAvance;
    i : integer;
begin
    inherited Create(AOwner);

    T := TfmProgressFormAvance.Create(self, wait_, Un_R_file_Alex.KASSA_FIND_WARNING_CAPTION);
    T.show;
    mainform                         := mform;
    pFIBDatabase1                    := mform.d;
    pFIBStoredProc1.database         := pFIBDatabase1;
    DataSet.database                 := pFIBDatabase1;
    Query.Database                   := pFIBDatabase1;
    pFIBDataSet1.Database            := pFIBDatabase1;
    DataSetLang.Database             := pFIBDatabase1;
    DataSetProv.Database             := pFIBDatabase1;
    DataSetRazd.Database             := pFIBDatabase1;

    flag_na_dataset                  := false;
    cxSplitter2.CloseSplitter;

//    pFIBTransaction1.Commit;
    pFIBTransaction1.DefaultDatabase := pFIBDatabase1;
    TransactionWrite.DefaultDatabase := pFIBDatabase1;
//    pFIBDataSet1.Transaction         := pFIBTransaction1;
    DataSet.Transaction              := pFIBTransaction1;
    DataSetLang.Transaction          := pFIBTransaction1;
    DataSetProv.Transaction          := pFIBTransaction1;
    DataSetRazd.Transaction          := pFIBTransaction1;
    Query.Transaction                := TransactionWrite;
    Query.Transaction.StartTransaction;
//    pFIBTransaction1.StartTransaction;

    id_session := pFIBDatabase1.Gen_Id('GEN_J4_SESSION_FIND', 1);

    for i := 0 to length(mainform.ResSch.TT)-1  do
    begin
        Query.Close;
        Query.SQL.Text := 'INSERT INTO J4_TEMP_FIND_OSN_SCH values (' + IntToStr(mainform.ResSch.TT[i].id) + ', '+IntToStr(id_session)+')';
        Query.ExecQuery;
//        DataSet.close;
//        DataSet.SQLs.InsertSQL.Text := 'INSERT INTO J4_TEMP_FIND_OSN_SCH values (' + VarToWideStr(mainform.ResSch[i][0]) + ', '+IntToStr(id_session)+')';
//        DataSet.
    end;
    for i := 0 to length(mainform.ResKorSch.TT)-1  do
    begin
        Query.SQL.Clear;
        Query.close;
        Query.SQL.Text := 'INSERT INTO J4_TEMP_KORRESPOND_SCH values(' + IntToStr(mainform.ResKorSch.TT[i].id) + ', '+IntToStr(id_session)+')';
        Query.ExecQuery;
    end;
    if (mainform.cxRadioButtonPrihod.Checked) or (mainform.cxRadioButtonAll.Checked) then
    begin
        Query.close;
        Query.SQL.Clear;
        Query.SQL.Text := 'INSERT INTO J4_TEMP_FIND (ID_PROV, ID_SESSION, PRIHOD, ID_DOC)';
        Query.SQL.Add('select pub_dt_all_prov.ID_PROV as ID_PROV, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(1)+' AS PRIHOD, pub_dt_all_doc.PK_ID AS ID_DOC');
        Query.SQL.Add('from  pub_dt_all_prov, pub_sp_main_oper, pub_dt_all_doc, J4_TEMP_FIND_OSN_SCH');
        if mainform.cxCheckBox1.Checked then
            Query.SQL.Add(', J4_TEMP_KORRESPOND_SCH');
        Query.SQL.Add('where pub_dt_all_prov.id_oper=pub_sp_main_oper.id_oper');
        Query.SQL.Add('AND pub_sp_main_oper.oper_db_id_sch=J4_TEMP_FIND_OSN_SCH.ID_SCH and J4_TEMP_FIND_OSN_SCH.ID_SESSION='+IntToStr(id_session)+' ');
        if mainform.cxCheckBox1.Checked then
            Query.SQL.Add('and pub_sp_main_oper.oper_kr_id_sch=J4_TEMP_KORRESPOND_SCH.ID_KOR_SCH and J4_TEMP_KORRESPOND_SCH.ID_SESSION='+IntToStr(id_session)+' ');
        Query.SQL.Add('AND pub_dt_all_prov.db_pk_id=pub_dt_all_doc.pk_id');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC >='''+mainform.cxDateEditFrom.Text+'''');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC <='''+mainform.cxDateEditTo.Text+'''');
        if mainform.cxCheckBoxSumma.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.summa >='+StringReplace(mainform.cxTextEditFrom.Text, ',', '.', [rfReplaceAll])+'');
            Query.SQL.Add('AND pub_dt_all_doc.summa <='+StringReplace(mainform.cxTextEditTo.Text, ',', '.', [rfReplaceAll])+'');
        end;
        if mainform.cxCheckBoxKom.Checked then
        begin
            Query.SQL.Add('AND (exists (select * from j4_dt_ao where j4_dt_ao.ID_DT_DOC=pub_dt_all_doc.pk_id and j4_dt_ao.KOM_ON=1 and j4_dt_ao.KOM_DATE_END>='''+mainform.cxDateKomFrom.Text+''' and j4_dt_ao.KOM_DATE_BEG <='''+mainform.cxDateKomTo.Text+'''))');
        end;
        if mainform.cxCheckBoxNumber.Checked then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.num_doc) like '''+'%' + mainform.cxTextEditNumber.Text + '%'+'''');
        end;
        Query.SQL.Add('AND pub_dt_all_doc.prihod=1');
        if (mainform.cxCheckBoxFio.Checked) and (mainform.cxRadioButton4.Checked) then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.fio) like '''+'%' + mainform.cxTextEditFio.Text + '%'+'''');
        end;
        if (mainform.cxCheckBoxFio.Checked) and (mainform.cxRadioButton2.Checked) then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.ID_MEN=' +IntToStr(mainform.id_man)+ ' ');
        end;
        if (mainform.cxCheckBoxNote.Checked) and (mainform.cxRadioButton4.Checked) then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.note) like '''+'%' + mainform.cxTextEditNote.Text + '%'+'''');
        end;
        if mainform.cxCheckBox3.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.db_id_sm=' + IntToStr(mainform.id_smeta)+'');
        end;
        if (mainform.cxCheckBox4.Checked) and (mainform.cxCheckbox9.checked) then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.db_id_rz=' + IntToStr(mainform.id_razd)+'');
        end;
        if (mainform.cxCheckBox5.Checked) and (mainform.cxCheckbox9.checked) then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.db_id_st=' + IntToStr(mainform.id_state)+'');
        end;
        if mainform.cxCheckBox6.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.db_id_kekv=' + IntToStr(mainform.id_kekv)+'');
        end;

        Query.SQL.Add('group by pub_dt_all_prov.ID_PROV, pub_dt_all_doc.pk_id');
        Query.ExecQuery;
    end;
    if (mainform.cxRadioButton3.Checked) or (mainform.cxRadioButtonAll.Checked) then
    begin
        Query.close;
        Query.SQL.Text := 'INSERT INTO J4_TEMP_FIND (ID_PROV, ID_SESSION, PRIHOD, ID_DOC)';
        Query.SQL.Add('select pub_dt_all_prov.ID_PROV as ID_PROV, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(0)+' AS PRIHOD, pub_dt_all_doc.PK_ID AS ID_DOC');
        Query.SQL.Add('from  pub_dt_all_prov, pub_sp_main_oper, pub_dt_all_doc, J4_TEMP_FIND_OSN_SCH');
        if mainform.cxCheckBox1.Checked then
            Query.SQL.Add(', J4_TEMP_KORRESPOND_SCH');
        Query.SQL.Add('where pub_dt_all_prov.id_oper=pub_sp_main_oper.id_oper');
        Query.SQL.Add('AND pub_sp_main_oper.oper_kr_id_sch=J4_TEMP_FIND_OSN_SCH.ID_SCH and J4_TEMP_FIND_OSN_SCH.ID_SESSION='+IntToStr(id_session)+' ');
        if mainform.cxCheckBox1.Checked then
            Query.SQL.Add('AND pub_sp_main_oper.oper_db_id_sch=J4_TEMP_KORRESPOND_SCH.ID_KOR_SCH and J4_TEMP_KORRESPOND_SCH.ID_SESSION='+IntToStr(id_session)+' ');
        Query.SQL.Add('AND pub_dt_all_prov.kr_pk_id=pub_dt_all_doc.pk_id');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC >='''+mainform.cxDateEditFrom.Text+'''');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC <='''+mainform.cxDateEditTo.Text+'''');
        if mainform.cxCheckBoxSumma.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.summa >='+StringReplace(mainform.cxTextEditFrom.Text, ',', '.', [rfReplaceAll])+'');
            Query.SQL.Add('AND pub_dt_all_doc.summa <='+StringReplace(mainform.cxTextEditTo.Text, ',', '.', [rfReplaceAll])+'');
        end;
        if mainform.cxCheckBoxKom.Checked then
        begin
            Query.SQL.Add('AND (exists (select * from j4_dt_ao where j4_dt_ao.ID_DT_DOC=pub_dt_all_doc.pk_id and j4_dt_ao.KOM_ON=1 and j4_dt_ao.KOM_DATE_END>='''+mainform.cxDateKomFrom.Text+''' and j4_dt_ao.KOM_DATE_BEG <='''+mainform.cxDateKomTo.Text+'''))');
        end;
        if mainform.cxCheckBoxNumber.Checked then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.num_doc) like '''+'%' + mainform.cxTextEditNumber.Text + '%'+'''');
        end;
        if (mainform.cxCheckBoxFio.Checked) and (mainform.cxRadioButton4.Checked) then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.fio) like '''+'%' + mainform.cxTextEditFio.Text + '%'+'''');
        end;
        if (mainform.cxCheckBoxFio.Checked) and (mainform.cxRadioButton2.Checked) then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.ID_MEN=' +IntToStr(mainform.id_man)+ ' ');
        end;
        if mainform.cxCheckBoxNote.Checked then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.note) like '''+'%'+mainform.cxTextEditNote.Text+'%'+'''');
        end;
        if mainform.cxCheckBox3.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.kr_id_sm=' + IntToStr(mainform.id_smeta)+'');
        end;
        if (mainform.cxCheckBox4.Checked) and (mainform.cxCheckbox9.checked) then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.kr_id_rz=' + IntToStr(mainform.id_razd)+'');
        end;
        if (mainform.cxCheckBox5.Checked) and (mainform.cxCheckbox9.checked) then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.kr_id_st=' + IntToStr(mainform.id_state)+'');
        end;
        if mainform.cxCheckBox6.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_prov.kr_id_kekv=' + IntToStr(mainform.id_kekv)+'');
        end;
        Query.SQL.Add('AND pub_dt_all_doc.prihod=0');
        Query.SQL.Add('group by pub_dt_all_prov.ID_PROV, pub_dt_all_doc.pk_id');
        Query.ExecQuery;
    end;
    Query.Transaction.Commit;
//    pFIBDataSet1.Transaction.StartTransaction;
    pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_FIND_ALL('+ IntToStr(id_session) +') order by FIO_DOC, NUMBER_DOC';

    pFIBDataSet1.Open;
    pFIBDataSet1.FetchAll;

    {Query.Transaction := TransactionWrite;
    Query.Transaction.StartTransaction;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM J4_TEMP_FIND WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM J4_TEMP_FIND_OSN_SCH WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    QUERY.Transaction.Commit;}
    cxLabel2.Caption := Un_R_file_Alex.BANK_COUNT_PAGE + IntToStr(pFIBDataSet1.RecordCount);
    Caption                              := Un_R_file_Alex.KASSA_FIND_RESULT_CAPTION;
    cxLabel1.Caption                     := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxGridDBColumn1.Caption              := Un_R_file_Alex.J4_FIND_DOC_NUM;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.J4_FIND_DOC_NUM;
    cxGrid1DBTableView1DBColumn6.Caption := Un_R_file_Alex.J4_FIND_DOC_SHORT_NAME;
    cxGridDBColumn2.Caption              := Un_R_file_Alex.KASSA_FIND_DATE_DOC;
    cxGrid1DBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_DOC_FIO;
    cxGridDBColumn3.Caption              := Un_R_file_Alex.KASSA_DOC_FIO;
    cxGrid1DBTableView1DBColumn4.Caption := Un_R_file_Alex.J4_MAIN_FORM_DEBET;
    cxGridDBColumn4.Caption              := Un_R_file_Alex.J4_MAIN_FORM_DEBET;
    cxGrid1DBTableView1DBColumn5.Caption := Un_R_file_Alex.J4_MAIN_FORM_KREDIT;
    cxGridDBColumn5.Caption              := Un_R_file_Alex.J4_MAIN_FORM_KREDIT;

    ActionPrint.Caption                  := Un_R_file_Alex.MY_ACTION_PRINT_CONST;
    ActionClose.Caption                  := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    

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

procedure TfmAvanceResultFindForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Query.Transaction := TransactionWrite;
    Query.Transaction.StartTransaction;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM J4_TEMP_FIND WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM J4_TEMP_FIND_OSN_SCH WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    QUERY.Transaction.Commit;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmAvanceResultFindForm.pFIBDataSet1AfterScroll(
  DataSet: TDataSet);
begin
    if flag_na_dataset then
    begin
        LabelNote.Caption := pFIBDataSet1.FieldByName('NOTE_DOC').AsString;
    end;
    if cxCheckBox1.Checked then
    begin
        DataSetProv.Close;
        DataSetProv.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_ALL_PROV('''+pFIBDataSet1.FieldByName('ID_DOC').AsString+''', '''+pFIBDataSet1.FieldByName('PRIHOD').AsString+''')';
        DataSetProv.Open;
    end;
end;

procedure TfmAvanceResultFindForm.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAvanceResultFindForm.ActionPrintExecute(Sender: TObject);
var
    Res : Variant;
    id_lang : integer;
begin
    DataSetLang.Close;
    DataSetLang.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SYS_DATA';
    DataSetLang.Open;
    id_lang := DataSetLang.FBN('ID_LANGUAGE').AsInteger;
    DataSetLang.Close;


    if ShowPrForm(Self, Self, Res) then
    begin
        DataSource1.Enabled := false;
        if VarArrayDimCount(Res) > 0 then
        begin
            if res[0][0] = 1 then
            begin
                frxReport1.Variables['not'] := Quotedstr(Un_R_file_Alex.KASSA_FIND_NOT_RECORD);
                if pFIBDataSet1.RecordCount = 0
                    then frxReport1.Variables['pr'] := '0'
                    else frxReport1.Variables['pr'] := '1';
                if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_find_all_ukr.fr3');
                if mainform.cxCheckBox2.Checked
                    then frxReport1.Variables['OS_SCH']   := Quotedstr(mainform.cxButtonEdit1.Text)
                    else frxReport1.Variables['OS_SCH']   := Quotedstr(mainform.cxLabel1.Caption);
                if mainform.cxCheckBox1.Checked
                    then frxReport1.Variables['KOR_SCH']   := Quotedstr(mainform.cxButtonEdit2.Text)
                    else frxReport1.Variables['KOR_SCH']   := Quotedstr(mainform.cxLabel9.Caption);
                frxReport1.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditFrom.Text);
                frxReport1.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditTo.Text);
                if mainform.cxCheckBoxSumma.Checked
                    then frxReport1.Variables['SUMMA']     := Quotedstr(mainform.cxLabel7.Caption + ' ' + mainform.cxTextEditFrom.Text + ' ' + mainform.cxLabel8.Caption + ' ' + mainform.cxTextEditTo.Text)
                    else frxReport1.Variables['SUMMA']     := Quotedstr(mainform.cxLabel4.Caption);
                if mainform.cxCheckBoxFio.Checked
                    then frxReport1.Variables['FIO']       := Quotedstr(mainform.cxTextEditFio.Text)
                    else frxReport1.Variables['FIO']       := Quotedstr(mainform.cxLabel5.Caption);
                if mainform.cxCheckBoxNote.Checked
                    then frxReport1.Variables['NOTE']      := Quotedstr(mainform.cxTextEditNote.Text)
                    else frxReport1.Variables['NOTE']      := Quotedstr(mainform.cxLabel6.Caption);
                if mainform.cxRadioButtonAll.Checked
                    then frxReport1.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonAll.Caption);
                if mainform.cxRadioButton3.Checked
                    then frxReport1.Variables['RRR']       := Quotedstr(mainform.cxRadioButton3.Caption);
                if mainform.cxRadioButtonPrihod.Checked
                    then frxReport1.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonPrihod.Caption);
                frxReport1.PrepareReport(true);

                if res[0][2] = 0 then
                begin
                     frxReport1.Print;

                end
                else frxReport1.ShowReport(true);

            end;
            if res[1][0] = 1 then
            begin
                frxReport1.Variables['not'] := Quotedstr(Un_R_file_Alex.KASSA_FIND_NOT_RECORD);

                if pFIBDataSet1.RecordCount = 0
                    then frxReport1.Variables['pr'] := '0'
                    else frxReport1.Variables['pr'] := '1';

                if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_find_all_note_ukr.fr3');
                if mainform.cxCheckBox2.Checked
                    then frxReport1.Variables['OS_SCH']   := Quotedstr(mainform.cxButtonEdit1.Text)
                    else frxReport1.Variables['OS_SCH']   := Quotedstr(mainform.cxLabel1.Caption);
                if mainform.cxCheckBox1.Checked
                    then frxReport1.Variables['KOR_SCH']   := Quotedstr(mainform.cxButtonEdit2.Text)
                    else frxReport1.Variables['KOR_SCH']   := Quotedstr(mainform.cxLabel9.Caption);
                frxReport1.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditFrom.Text);
                frxReport1.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditTo.Text);
                if mainform.cxCheckBoxSumma.Checked
                    then frxReport1.Variables['SUMMA']     := Quotedstr(mainform.cxLabel7.Caption + ' ' + mainform.cxTextEditFrom.Text + ' ' + mainform.cxLabel8.Caption + ' ' + mainform.cxTextEditTo.Text)
                    else frxReport1.Variables['SUMMA']     := Quotedstr(mainform.cxLabel4.Caption);
                if mainform.cxCheckBoxFio.Checked
                    then frxReport1.Variables['FIO']       := Quotedstr(mainform.cxTextEditFio.Text)
                    else frxReport1.Variables['FIO']       := Quotedstr(mainform.cxLabel5.Caption);
                if mainform.cxCheckBoxNote.Checked
                    then frxReport1.Variables['NOTE']      := Quotedstr(mainform.cxTextEditNote.Text)
                    else frxReport1.Variables['NOTE']      := Quotedstr(mainform.cxLabel6.Caption);
                if mainform.cxRadioButtonAll.Checked
                    then frxReport1.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonAll.Caption);
                if mainform.cxRadioButton3.Checked
                    then frxReport1.Variables['RRR']       := Quotedstr(mainform.cxRadioButton3.Caption);
                if mainform.cxRadioButtonPrihod.Checked
                    then frxReport1.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonPrihod.Caption);
                frxReport1.PrepareReport(true);
                if res[1][2] = 0 then
                begin
                      frxReport1.Print;
                end
                else frxReport1.ShowReport(True);
                
            end;
            if res[2][0] = 1 then
            begin
                frxReport1.Variables['not'] := Quotedstr(Un_R_file_Alex.KASSA_FIND_NOT_RECORD);

                if pFIBDataSet1.RecordCount = 0
                    then frxReport1.Variables['pr'] := '0'
                    else frxReport1.Variables['pr'] := '1';

                if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_find_all_note_group_ukr.fr3');
                if mainform.cxCheckBox2.Checked
                    then frxReport1.Variables['OS_SCH']   := Quotedstr(mainform.cxButtonEdit1.Text)
                    else frxReport1.Variables['OS_SCH']   := Quotedstr(mainform.cxLabel1.Caption);
                if mainform.cxCheckBox1.Checked
                    then frxReport1.Variables['KOR_SCH']   := Quotedstr(mainform.cxButtonEdit2.Text)
                    else frxReport1.Variables['KOR_SCH']   := Quotedstr(mainform.cxLabel9.Caption);
                frxReport1.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditFrom.Text);
                frxReport1.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditTo.Text);
                if mainform.cxCheckBoxSumma.Checked
                    then frxReport1.Variables['SUMMA']     := Quotedstr(mainform.cxLabel7.Caption + ' ' + mainform.cxTextEditFrom.Text + ' ' + mainform.cxLabel8.Caption + ' ' + mainform.cxTextEditTo.Text)
                    else frxReport1.Variables['SUMMA']     := Quotedstr(mainform.cxLabel4.Caption);
                if mainform.cxCheckBoxFio.Checked
                    then frxReport1.Variables['FIO']       := Quotedstr(mainform.cxTextEditFio.Text)
                    else frxReport1.Variables['FIO']       := Quotedstr(mainform.cxLabel5.Caption);
                if mainform.cxCheckBoxNote.Checked
                    then frxReport1.Variables['NOTE']      := Quotedstr(mainform.cxTextEditNote.Text)
                    else frxReport1.Variables['NOTE']      := Quotedstr(mainform.cxLabel6.Caption);
                if mainform.cxRadioButtonAll.Checked
                    then frxReport1.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonAll.Caption);
                if mainform.cxRadioButton3.Checked
                    then frxReport1.Variables['RRR']       := Quotedstr(mainform.cxRadioButton3.Caption);
                if mainform.cxRadioButtonPrihod.Checked
                    then frxReport1.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonPrihod.Caption);
                frxReport1.PrepareReport(true);
                if res[2][2] = 0 then
                begin
                      frxReport1.Print;
                end
                else frxReport1.ShowReport(true);
                //frxReport1.designreport;
            end;
            if res[3][0] = 1 then
            begin
                DataSetRazd.Close;
                DataSetRazd.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_FIND_ALL_GROUP_RAZD('+ IntToStr(id_session) +') order by FIO_DOC';

                DataSetRazd.Open;
                DataSetRazd.FetchAll;
                frxReport1.Variables['not'] := Quotedstr(Un_R_file_Alex.KASSA_FIND_NOT_RECORD);

                if DataSetRazd.RecordCount = 0
                    then frxReport1.Variables['pr'] := '0'
                    else frxReport1.Variables['pr'] := '1';

                if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_find_all_razd_group_ukr.fr3');
                if mainform.cxCheckBox2.Checked
                    then frxReport1.Variables['OS_SCH']   := Quotedstr(mainform.cxButtonEdit1.Text)
                    else frxReport1.Variables['OS_SCH']   := Quotedstr(mainform.cxLabel1.Caption);
                if mainform.cxCheckBox1.Checked
                    then frxReport1.Variables['KOR_SCH']   := Quotedstr(mainform.cxButtonEdit2.Text)
                    else frxReport1.Variables['KOR_SCH']   := Quotedstr(mainform.cxLabel9.Caption);
                frxReport1.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditFrom.Text);
                frxReport1.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditTo.Text);
                if mainform.cxCheckBoxSumma.Checked
                    then frxReport1.Variables['SUMMA']     := Quotedstr(mainform.cxLabel7.Caption + ' ' + mainform.cxTextEditFrom.Text + ' ' + mainform.cxLabel8.Caption + ' ' + mainform.cxTextEditTo.Text)
                    else frxReport1.Variables['SUMMA']     := Quotedstr(mainform.cxLabel4.Caption);
                if mainform.cxCheckBoxFio.Checked
                    then frxReport1.Variables['FIO']       := Quotedstr(mainform.cxTextEditFio.Text)
                    else frxReport1.Variables['FIO']       := Quotedstr(mainform.cxLabel5.Caption);
                if mainform.cxCheckBoxNote.Checked
                    then frxReport1.Variables['NOTE']      := Quotedstr(mainform.cxTextEditNote.Text)
                    else frxReport1.Variables['NOTE']      := Quotedstr(mainform.cxLabel6.Caption);
                if mainform.cxRadioButtonAll.Checked
                    then frxReport1.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonAll.Caption);
                if mainform.cxRadioButton3.Checked
                    then frxReport1.Variables['RRR']       := Quotedstr(mainform.cxRadioButton3.Caption);
                if mainform.cxRadioButtonPrihod.Checked
                    then frxReport1.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonPrihod.Caption);
                frxReport1.PrepareReport(true);
                if res[3][2] = 0 then
                begin
                      frxReport1.Print;
                end
                else frxReport1.ShowReport(true);
                //frxReport1.designreport;
            end;
        end;

        DataSource1.Enabled := true;
    end;
end;

procedure TfmAvanceResultFindForm.cxGrid1DBTableView1DblClick(
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

procedure TfmAvanceResultFindForm.ActionDocExecute(Sender: TObject);
begin
    cxGrid1DBTableView1DblClick(Self);
end;

procedure TfmAvanceResultFindForm.cxCheckBox1Click(Sender: TObject);
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

procedure TfmAvanceResultFindForm.DataSetProvAfterScroll(
  DataSet: TDataSet);
var
    ffio, n_cust, n_do, reg_n, d_d : string;
    y, o : TSpravParams;
    dog_type : integer;
begin
    cxTextEdit1.Text := '';
    if (not DataSetProv.FieldByName('ID_DOG').IsNull) and (not DataSetProv.FieldByName('KOD_DOG').ISNull) then
    begin
        y                    := TSpravParams.Create;
        o                    := TSpravParams.Create;
        y['DataBase']        := Integer(pFIBDatabase1.Handle);
        y['ReadTransaction'] := Integer(pFIBDatabase1.DefaultTransaction.Handle);
        y['ID_DOG']          := strtoint64(DataSetProv.FieldByName('ID_DOG').AsString);
        y['KOD_DOG']         := strtoint64(DataSetProv.FieldByName('KOD_DOG').AsString);
        GetDogovorInfo(Self, @y, @o);

        try ffio     := o['FIO_COMBO']        except ffio    := ''; end;
        try n_cust   := o['NAME_CUSTOMER']    except n_cust  := ''; end;
        try d_d      := DateToStr(o['D_DOG']) except d_d     := ''; end;
        try reg_n    := o['REGEST_NUM']       except reg_n   := ''; end;
        try dog_type := o['DOG_TYPE']         except dog_type := -1 end;
        if dog_type = 0 then
        begin
            try n_do   := o['N_DOG']   except n_do := ''; end;
        end;
        if (dog_type = 1) or (dog_type = 2) then
        begin
            try n_do   := o['NUM_DOG'] except n_do := ''; end;
        end;
        cxTextEdit1.Text := ffio + ' ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' ' + n_cust + ' ' + n_do + Un_R_file_Alex.BANK_REG_NUM + reg_n + ' от - ' + d_d;
        y.Free;
        o.Free;
    end;
end;

end.
