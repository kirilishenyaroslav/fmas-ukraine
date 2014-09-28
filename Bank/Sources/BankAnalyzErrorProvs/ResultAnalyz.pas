unit ResultAnalyz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, frxExportPDF,
  frxExportRTF, frxExportXML, frxClass, frxExportHTML, frxDesgn, frxDBSet,
  ImgList, dxBar, dxBarExtItems, ActnList, FIBQuery, pFIBQuery,
  pFIBStoredProc, cxGridTableView, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, cxSplitter, cxMemo, cxDBLabel, cxCheckBox, cxLabel,
  cxContainer, cxTextEdit, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,FilterAnalyzEr, Un_R_file_Alex,
  Placemnt;

type
  TfrmResultAnalyz = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel3: TPanel;
    Panel2: TPanel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
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
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxCheckBox1: TcxCheckBox;
    cxDBLabel1: TcxDBLabel;
    cxLabel5: TcxLabel;
    cxMemo1: TcxMemo;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    pFIBDataSet1: TpFIBDataSet;
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
    pFIBDataSet1NAME_CUST: TFIBStringField;
    pFIBDataSet1IS_SPRAVKA: TFIBIntegerField;
    pFIBDataSet1DATE_PROV: TFIBDateField;
    pFIBDataSet1COMMENT_PROV_ALL: TFIBStringField;
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
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionPrint: TAction;
    ActionDoc: TAction;
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
    frxReport1: TfrxReport;
    DS: TpFIBDataSet;
    DataSetLang: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
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
    pFIBDataSet1SCH_NUMBER: TFIBStringField;
    pFIBDataSet1TITLE_SCH: TFIBStringField;
    pFIBDataSet1SUMMA_P: TFIBBCDField;
    pFIBDataSet1SUMMA_R: TFIBBCDField;
    pFIBDataSet1PK_ID: TFIBBCDField;
    pFIBDataSet1PK_: TFIBStringField;
    pFIBDataSet1DATE_REG: TFIBDateField;
    Report: TfrxReport;
    FormStorage1: TFormStorage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pFIBDataSet1AfterScroll(DataSet: TDataSet);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure DataSetProvAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
  private
     mainform : TfrmFilterAnalizEr;
     flag_na_dataset : boolean;
  public
    show_print : integer;
    id_session : int64;
    constructor Create(AOwner: TComponent; mform: TfrmFilterAnalizEr); reintroduce; overload;
  end;

{var
  frmResultAnalyz: TfrmResultAnalyz;   }

implementation
uses DogLoaderUnit, Un_Progress_form, PrintOptionsAnalyz;

{$R *.dfm}

constructor TfrmResultAnalyz.Create(AOwner: TComponent;
  mform: TfrmFilterAnalizEr);
var
    T : TfmUn_Progress_form;
    i: integer;
begin
    inherited Create(AOwner);

    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_FIND_WARNING_CAPTION);
    T.show;
    T.Update;
    mainform                         := mform;
    pFIBDatabase1                    := mainform.database;

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

        if mainform.CheckBoxKorSch.Checked then
        begin
            Query.SQL.Add(', BANK_TEMP_KORRESPOND_SCH');
        end;

        Query.SQL.Add(', BANK_TEMP_FIND_OSN_SCH');

        Query.SQL.Add('where pub_dt_all_prov.id_oper=pub_sp_main_oper.id_oper');

        if mainform.CheckBoxKorSch.Checked then
        begin
            Query.SQL.Add('AND pub_sp_main_oper.oper_kr_id_sch=BANK_TEMP_KORRESPOND_SCH.ID_KOR_SCH and BANK_TEMP_KORRESPOND_SCH.ID_SESSION='+IntToStr(id_session)+' ');
        end;

        Query.SQL.Add('AND pub_sp_main_oper.oper_db_id_sch=BANK_TEMP_FIND_OSN_SCH.ID_SCH and BANK_TEMP_FIND_OSN_SCH.ID_SESSION='+IntToStr(id_session)+' ');

        Query.SQL.Add('AND pub_dt_all_prov.db_id_doc=pub_dt_all_doc.id_doc');
        if mainform.RadioButtonDateDoc.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC >='''+mainform.cxDateEditFrom.Text+'''');
            Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC <='''+mainform.cxDateEditTo.Text+'''');
        end;
        if mainform.RadioButtonDateProv.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.DATE_PROV >='''+mainform.cxDateEditProvFrom.Text+'''');
            Query.SQL.Add('AND pub_dt_all_doc.DATE_PROV <='''+mainform.cxDateEditProvTo.Text+'''');
        end;


        if mainform.CheckBoxRsNative.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.ID_RATE_ACC_NATIVE='+IntToStr(mainform.id_ras_native)+' ');
        end;

        Query.SQL.Add('AND pub_dt_all_doc.prihod=1');

        Query.SQL.Add('group by pub_dt_all_prov.ID_PROV, pub_dt_all_doc.pk_id');

        Query.ExecQuery;
    end;


    if (mainform.cxRadioButtonRashod.Checked) or (mainform.cxRadioButtonAll.Checked) then
    begin
        Query.close;
        Query.SQL.Text := 'INSERT INTO BANK_TEMP_FIND (ID_PROV, ID_SESSION, PRIHOD, ID_DOC)';
        Query.SQL.Add('select pub_dt_all_prov.ID_PROV as ID_PROV, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(0)+' AS PRIHOD, pub_dt_all_doc.pk_id AS ID_DOC');
        Query.SQL.Add('from  pub_dt_all_prov, pub_sp_main_oper, pub_dt_all_doc');

        if mainform.CheckBoxKorSch.Checked then
        begin
            Query.SQL.Add(', BANK_TEMP_KORRESPOND_SCH');
        end;

        Query.SQL.Add(', BANK_TEMP_FIND_OSN_SCH');

        Query.SQL.Add('where pub_dt_all_prov.id_oper=pub_sp_main_oper.id_oper');

        if mainform.CheckBoxKorSch.Checked then
        begin
            Query.SQL.Add('AND pub_sp_main_oper.oper_db_id_sch=BANK_TEMP_KORRESPOND_SCH.ID_KOR_SCH and BANK_TEMP_KORRESPOND_SCH.ID_SESSION='+IntToStr(id_session)+' ');
        end;

        Query.SQL.Add('AND pub_sp_main_oper.oper_kr_id_sch=BANK_TEMP_FIND_OSN_SCH.ID_SCH and BANK_TEMP_FIND_OSN_SCH.ID_SESSION='+IntToStr(id_session)+' ');


        Query.SQL.Add('AND pub_dt_all_prov.kr_id_doc=pub_dt_all_doc.id_doc');
        if mainform.RadioButtonDateDoc.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC >='''+mainform.cxDateEditFrom.Text+'''');
            Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC <='''+mainform.cxDateEditTo.Text+'''');
        end;
        if mainform.RadioButtonDateProv.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.DATE_PROV >='''+mainform.cxDateEditProvFrom.Text+'''');
            Query.SQL.Add('AND pub_dt_all_doc.DATE_PROV <='''+mainform.cxDateEditProvTo.Text+'''');
        end;

        if mainform.CheckBoxRsNative.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.ID_RATE_ACC_NATIVE='+IntToStr(mainform.id_ras_native)+' ');
        end;


        Query.SQL.Add('group by pub_dt_all_prov.ID_PROV, pub_dt_all_doc.pk_id');
         Query.ExecQuery;
    end;

    TransactionWrite.Commit;

   // pFIBDataSet1.Transaction.StartTransaction;
    pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_FIND_ALL_ERR_DOCS('+ IntToStr(id_session)+','+inttostr(0)+')';
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

procedure TfrmResultAnalyz.FormClose(Sender: TObject;
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

procedure TfrmResultAnalyz.pFIBDataSet1AfterScroll(DataSet: TDataSet);
begin
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

procedure TfrmResultAnalyz.ActionPrintExecute(Sender: TObject);
var
    Res : Variant;
    pk_i : string;
    id_lang : integer;
    T : TfmUn_Progress_form;
begin
    if ShowPrFormBank(Self, Self, Res) then
    begin
        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_FIND_WARNING_CAPTION);
        T.show;
        T.Update;
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
                pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_FIND_ALL_ERR_DOCS('+ IntToStr(id_session)+','+inttostr(0)+')';

                pFIBDataSet1.open;
                pFIBDataSet1.FetchAll;
                //if id_lang = 1 then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_find_all.fr3');
                if id_lang = 0 then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_analyz_all_ukr.fr3');
                if mainform.CheckBoxMainSch.Checked
                    then Report.Variables['OS_SCH']    := Quotedstr(mainform.ButtonEditMainSch.Text)
                    else Report.Variables['OS_SCH']    := Quotedstr(mainform.LabelMainSch.Caption);
                if mainform.CheckBoxKorSch.Checked
                    then Report.Variables['KOR_SCH']   := Quotedstr(mainform.ButtonEditKorSch.Text)
                    else Report.Variables['KOR_SCH']   := Quotedstr(mainform.LabelKorSch.Caption);
                if mainform.RadioButtonDateDoc.Checked then
                begin
                    Report.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditFrom.Text);
                    Report.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditTo.Text);
                end else
                if mainform.RadioButtonDateProv.Checked then
                begin
                    Report.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditProvFrom.Text);
                    Report.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditProvTo.Text);
                end;
                if mainform.cxRadioButtonAll.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonAll.Caption);
                if mainform.cxRadioButtonRashod.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonRashod.Caption);
                if mainform.cxRadioButtonPrihod.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonPrihod.Caption);
                Report.PrepareReport;

                if res[0][2] = 0 then
                begin
                        Report.PrintOptions.Copies:=  Res[0][1];
                        Report.Print;
                end
                else
                begin
                     T.Free;
                     Report.ShowReport;
                end;

            end;
            if res[1][0] = 1 then
            begin
                pFIBDataSet1.Close;
                pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_FIND_ALL_ERR_DOCS('+ IntToStr(id_session) +','+inttostr(0)+')';
                pFIBDataSet1.open;
                pFIBDataSet1.FetchAll;

                //if id_lang = 1 then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_find_all_note.fr3');
                if id_lang = 0 then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_analyz_all_note_ukr.fr3');
                if mainform.CheckBoxMainSch.Checked
                    then Report.Variables['OS_SCH']    := Quotedstr(mainform.ButtonEditMainSch.Text)
                    else Report.Variables['OS_SCH']    := Quotedstr(mainform.LabelMainSch.Caption);
                if mainform.CheckBoxKorSch.Checked
                    then Report.Variables['KOR_SCH']   := Quotedstr(mainform.ButtonEditKorSch.Text)
                    else Report.Variables['KOR_SCH']   := Quotedstr(mainform.LabelKorSch.Caption);
                if mainform.RadioButtonDateDoc.Checked then
                begin
                    Report.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditFrom.Text);
                    Report.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditTo.Text);
                end else
                if mainform.RadioButtonDateProv.Checked then
                begin
                    Report.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditProvFrom.Text);
                    Report.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditProvTo.Text);
                end;
                if mainform.cxRadioButtonAll.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonAll.Caption);
                if mainform.cxRadioButtonRashod.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonRashod.Caption);
                if mainform.cxRadioButtonPrihod.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonPrihod.Caption);
                Report.PrepareReport;

                if res[1][2] = 0 then
                begin
                    Report.PrintOptions.Copies:=  Res[0][1];
                    Report.Print;
                end
                else
                begin
                     T.Free;
                     Report.ShowReport;
                end;
            end;
            if res[3][3] = 1 then
            begin
                pFIBDataSet2.Close;
                pFIBDataSet2.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_FIND_ALL_ERR_DOCS('+ IntToStr(id_session) +','+inttostr(1)+')';

                pFIBDataSet2.open;
                pFIBDataSet2.FetchAll;
                //if id_lang = 1 then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_find_all_note.fr3');
                if id_lang = 0 then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_analyz_all_note_korresp_ukr.fr3');
                if mainform.CheckBoxMainSch.Checked
                    then Report.Variables['OS_SCH']    := Quotedstr(mainform.ButtonEditMainSch.Text)
                    else Report.Variables['OS_SCH']    := Quotedstr(mainform.LabelMainSch.Caption);
                if mainform.CheckBoxKorSch.Checked
                    then Report.Variables['KOR_SCH']   := Quotedstr(mainform.ButtonEditKorSch.Text)
                    else Report.Variables['KOR_SCH']   := Quotedstr(mainform.LabelKorSch.Caption);
                if mainform.RadioButtonDateDoc.Checked then
                begin
                    Report.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditFrom.Text);
                    Report.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditTo.Text);
                end else
                if mainform.RadioButtonDateProv.Checked then
                begin
                    Report.Variables['DATE_BEGIN']:= Quotedstr(mainform.cxDateEditProvFrom.Text);
                    Report.Variables['DATE_END']  := Quotedstr(mainform.cxDateEditProvTo.Text);
                end;
                if mainform.cxRadioButtonAll.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonAll.Caption);
                if mainform.cxRadioButtonRashod.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonRashod.Caption);
                if mainform.cxRadioButtonPrihod.Checked
                    then Report.Variables['RRR']       := Quotedstr(mainform.cxRadioButtonPrihod.Caption);
                Report.PrepareReport;

                if res[3][2] = 0 then
                begin
                    Report.PrintOptions.Copies:=  Res[3][1];
                    Report.Print;
                end
                else
                begin
                     T.Free;
                     Report.ShowReport;
                end;
            end;

        end;

   end;
   pFIBDataSet1.EnableControls;
end;

procedure TfrmResultAnalyz.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfrmResultAnalyz.cxCheckBox1Click(Sender: TObject);
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

procedure TfrmResultAnalyz.DataSetProvAfterScroll(DataSet: TDataSet);
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

procedure TfrmResultAnalyz.cxGrid1DBTableView1CustomDrawCell(
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
procedure TfrmResultAnalyz.FormCreate(Sender: TObject);
begin
     FormStorage1.RestoreFormPlacement;
end;

end.
