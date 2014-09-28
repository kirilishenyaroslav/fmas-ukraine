unit KassaResultFindForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSplitter, ExtCtrls, cxContainer, cxTextEdit,
  cxMemo, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, KassaFindForm,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, Un_R_file_Alex, cxLabel,
  FR_Class, FR_DSet, FR_DBSet, Un_lo_file_Alex, StdCtrls, dxStatusBar,
  ImgList, dxBar, dxBarExtItems, cxCheckBox, cxCurrencyEdit;

type
  TfmKassaResultFindForm = class(TForm)
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
    Report: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    cxLabel2: TcxLabel;
    pFIBDataSet1ID_DOC: TFIBBCDField;
    pFIBDataSet1NUMBER_DOC: TFIBStringField;
    pFIBDataSet1SUMMA_PRIH: TFIBBCDField;
    pFIBDataSet1NOTE_DOC: TFIBStringField;
    pFIBDataSet1FIO_DOC: TFIBStringField;
    pFIBDataSet1PRIHOD: TFIBIntegerField;
    pFIBDataSet1DATE_DOC: TFIBDateField;
    pFIBDataSet1SUMMA_RASH: TFIBBCDField;
    LabelNote: TLabel;
    ActionDoc: TAction;
    dxStatusBar1: TdxStatusBar;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    ImageList1: TImageList;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton4: TdxBarLargeButton;
    ActionFilter: TAction;
    Timer1: TTimer;
    cxCheckBox1: TcxCheckBox;
    cxSplitter2: TcxSplitter;
    Panel2: TPanel;
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
    cxTextEdit1: TcxTextEdit;
    DataSourceProv: TDataSource;
    DataSetProv: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pFIBDataSet1AfterScroll(DataSet: TDataSet);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure ActionDocExecute(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSetProvAfterScroll(DataSet: TDataSet);
  private
    mainform : TfmKassaFindForm;
  //  myform:TfmMainForm;
    flag_na_dataset : boolean;
  public
    id_session : int64;
     id_user : int64;
    constructor Create(AOwner: TComponent; mform: TfmKassaFindForm); reintroduce; overload;
  end;

implementation
uses KassaShowP, Un_Progress_form, Un_func_file_Alex, GlobalSPR, MainFormKassa, DogLoaderUnit;
{$R *.dfm}

constructor TfmKassaResultFindForm.Create(AOwner: TComponent;
  mform: TfmKassaFindForm);
var
    T : TfmUn_Progress_form;
    i : integer;
begin
    inherited Create(AOwner);

    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_FIND_WARNING_CAPTION);
    T.show;
    T.Repaint;
    mainform                         := mform;
    pFIBDatabase1                    := mform.d;
    pFIBStoredProc1.database         := pFIBDatabase1;
    DataSet.database                 := pFIBDatabase1;
    Query.Database                   := pFIBDatabase1;
    pFIBDataSet1.Database            := pFIBDatabase1;
    DataSetProv.Database             := pFIBDatabase1;
    DataSetProv.Transaction              := pFIBTransaction1;

    flag_na_dataset                  := false;

    pFIBTransaction1.DefaultDatabase := pFIBDatabase1;
    TransactionWrite.DefaultDatabase := pFIBDatabase1;
    DataSet.Transaction              := pFIBTransaction1;
    Query.Transaction                := TransactionWrite;
    Query.Transaction.StartTransaction;

    id_session := pFIBDatabase1.Gen_Id('GEN_KASSA_SESSION_FIND', 1);

    for i := 0 to length(mainform.ResSch.TT)-1  do
    begin
        Query.Close;
        Query.SQL.Text := 'INSERT INTO KASSA_TEMP_FIND_OSN_SCH values (' + IntToStr(mainform.ResSch.TT[i].id) + ', '+IntToStr(id_session)+')';
        Query.ExecQuery;
//        DataSet.close;
//        DataSet.SQLs.InsertSQL.Text := 'INSERT INTO KASSA_TEMP_FIND_OSN_SCH values (' + VarToWideStr(mainform.ResSch[i][0]) + ', '+IntToStr(id_session)+')';
//        DataSet.
    end;
    for i := 0 to length(mainform.ResKorSch.TT)-1  do
    begin
        Query.SQL.Clear;
        Query.close;
        Query.SQL.Text := 'INSERT INTO KASSA_TEMP_KORRESPOND_SCH values(' + IntToStr(mainform.ResKorSch.TT[i].id) + ', '+IntToStr(id_session)+')';
        Query.ExecQuery;
    end;
    if (mainform.cxRadioButtonPrihod.Checked) or (mainform.cxRadioButtonAll.Checked) then  {приходные или все}
    begin
        Query.close;
        Query.SQL.Clear;
        Query.SQL.Text := 'INSERT INTO KASSA_TEMP_FIND (ID_PROV, ID_SESSION, PRIHOD, ID_DOC)';
        Query.SQL.Add('select pub_dt_all_prov.ID_PROV as ID_PROV, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(1)+' AS PRIHOD, pub_dt_all_doc.pk_id AS ID_DOC');
        Query.SQL.Add('from  pub_dt_all_prov, pub_sp_main_oper, pub_dt_all_doc, KASSA_TEMP_FIND_OSN_SCH');
        if mainform.cxCheckBox1.Checked then
        begin
            Query.SQL.Add(', KASSA_TEMP_KORRESPOND_SCH');
        end;

        Query.SQL.Add('where pub_dt_all_prov.id_oper=pub_sp_main_oper.id_oper');

        Query.SQL.Add('AND pub_sp_main_oper.oper_db_id_sch=KASSA_TEMP_FIND_OSN_SCH.ID_SCH and KASSA_TEMP_FIND_OSN_SCH.ID_SESSION='+IntToStr(id_session)+' ');

        if mainform.cxCheckBox1.Checked then
            Query.SQL.Add('AND pub_sp_main_oper.oper_kr_id_sch=KASSA_TEMP_KORRESPOND_SCH.ID_KOR_SCH and KASSA_TEMP_KORRESPOND_SCH.ID_SESSION='+IntToStr(id_session)+' ');


        Query.SQL.Add('AND pub_dt_all_prov.db_pk_id=pub_dt_all_doc.pk_id');
        if mainform.cxRadiobutton1.checked then
        begin
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC >='''+mainform.cxDateEditFrom.Text+'''');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC <='''+mainform.cxDateEditTo.Text+'''');
        end else
        begin
        Query.SQL.Add('AND pub_dt_all_doc.DATE_prov >='''+mainform.cxDateEditFrom.Text+'''');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_prov <='''+mainform.cxDateEditTo.Text+'''');
        end;
        if mainform.cxCheckBoxSumma.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.summa >='+StringReplace(mainform.cxTextEditFrom.Text, ',', '.', [rfReplaceAll])+'');
            Query.SQL.Add('AND pub_dt_all_doc.summa <='+StringReplace(mainform.cxTextEditTo.Text, ',', '.', [rfReplaceAll])+'');
        end;

         if mainform.cxCheckBoxFio.Checked then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.fio) like '''+'%' + mainform.cxTextEditFio.Text + '%'+'''');
        end;
        if mainform.cxCheckBox8.Checked then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.num_doc) like '''+'%' + mainform.cxTextEdit_num.Text + '%'+'''');
        end;
        if mainform.cxCheckBoxNote.Checked then
        begin
            Query.SQL.Add('AND upper(pub_dt_all_doc.note) like '''+'%' + mainform.cxTextEditNote.Text + '%'+'''');
        end;
        Query.SQL.Add('AND pub_dt_all_doc.prihod=1');
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
         if mainform.cxCheckBox7.Checked then   //********************************************************
        begin
            Query.SQL.Add('AND pub_dt_all_prov.db_id_dog =' + IntToStr(mainform.id_dog)+'');
        end;
         if mainform.cxRadiobutton4.checked then
        begin
           Query.SQL.Add('AND pub_dt_all_doc.id_type_doc = '+IntToStr(1)+'');
        end;
          if mainform.cxRadiobutton5.checked then
        begin
           Query.SQL.Add('AND PUB_DT_ALL_DOC.ID_TYPE_DOC<>'+IntToStr(1)+'');
        end;
        Query.SQL.Add('group by pub_dt_all_prov.ID_PROV, pub_dt_all_doc.pk_id');
     //    showmessage(Query.SQL.Text);
        Query.ExecQuery;
    end;

    if (mainform.cxRadioButton3.Checked) or (mainform.cxRadioButtonAll.Checked) then                 {расходные или все}
    begin
        Query.close;
        Query.SQL.Text := 'INSERT INTO KASSA_TEMP_FIND (ID_PROV, ID_SESSION, PRIHOD, ID_DOC)';
        Query.SQL.Add('select pub_dt_all_prov.ID_PROV as ID_PROV, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(0)+' AS PRIHOD, pub_dt_all_doc.pk_id AS ID_DOC');
        Query.SQL.Add('from  pub_dt_all_prov, pub_sp_main_oper, pub_dt_all_doc, KASSA_TEMP_FIND_OSN_SCH');
        if mainform.cxCheckBox1.Checked then
        begin
            Query.SQL.Add(', KASSA_TEMP_KORRESPOND_SCH');
        end;

        Query.SQL.Add('where pub_dt_all_prov.id_oper=pub_sp_main_oper.id_oper');

        Query.SQL.Add('AND pub_sp_main_oper.oper_kr_id_sch=KASSA_TEMP_FIND_OSN_SCH.ID_SCH and KASSA_TEMP_FIND_OSN_SCH.ID_SESSION='+IntToStr(id_session)+' ');
        if mainform.cxCheckBox1.Checked then
            Query.SQL.Add('AND pub_sp_main_oper.oper_db_id_sch=KASSA_TEMP_KORRESPOND_SCH.ID_KOR_SCH and KASSA_TEMP_KORRESPOND_SCH.ID_SESSION='+IntToStr(id_session)+' ');

        Query.SQL.Add('AND pub_dt_all_prov.kr_id_doc=pub_dt_all_doc.id_doc');
        if mainform.cxRadiobutton1.checked then
        begin
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC >='''+mainform.cxDateEditFrom.Text+'''');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC <='''+mainform.cxDateEditTo.Text+'''');
        end else
        begin
        Query.SQL.Add('AND pub_dt_all_doc.DATE_prov >='''+mainform.cxDateEditFrom.Text+'''');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_prov <='''+mainform.cxDateEditTo.Text+'''');
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
            Query.SQL.Add('AND upper(pub_dt_all_doc.fio) like '''+'%' + mainform.cxTextEditFio.Text + '%'+'''');
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
          if mainform.cxCheckBox7.Checked then   //********************************************************
        begin
             Query.SQL.Add('AND pub_dt_all_prov.kr_id_dog =' + IntToStr(mainform.id_dog)+'');
        end;
        if mainform.cxRadiobutton4.checked then
        begin
           Query.SQL.Add('AND pub_dt_all_doc.id_type_doc = 1');
        end;
          if mainform.cxRadiobutton5.checked then
        begin
           Query.SQL.Add('AND pub_dt_all_doc.id_type_doc <> 1');
        end;
            Query.SQL.Add('AND pub_dt_all_doc.prihod=0');
        Query.SQL.Add('group by pub_dt_all_prov.ID_PROV, pub_dt_all_doc.pk_id');
        Query.ExecQuery;
    end;
     flag_na_dataset := true;
    Query.Transaction.Commit;

//    pFIBDataSet1.Transaction.StartTransaction;
    pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_FIND_ALL('+ IntToStr(id_session) +')';
    pFIBDataSet1.Open;
    pFIBDataSet1.FetchAll;

    Query.Transaction := TransactionWrite;
    Query.Transaction.StartTransaction;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM KASSA_TEMP_FIND WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM KASSA_TEMP_FIND_OSN_SCH WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    QUERY.Transaction.Commit;

    cxLabel2.Caption := Un_R_file_Alex.KASSA_COUNT_PAGE + IntToStr(pFIBDataSet1.RecordCount);

    Caption                              := Un_R_file_Alex.KASSA_FIND_RESULT_CAPTION;
    cxLabel1.Caption                     := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_FIND_NUM_DOC;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_FIND_DATE_DOC;
    cxGrid1DBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_DOC_FIO;
    cxGrid1DBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_DOC_PRIHOD;
    cxGrid1DBTableView1DBColumn5.Caption := Un_R_file_Alex.KASSA_DOC_RASHOD;

    dxStatusBar1.Panels[0].Text := Un_R_file_Alex.MY_ACTION_PRINT_CONST + ' - Ctrl+P';
    dxStatusBar1.Panels[1].Text := Un_R_file_Alex.MY_ACTION_CLOSE_VIH   + ' - Esc';
    dxStatusBar1.Panels[2].Text := Un_R_file_Alex.MY_ENTER_KASSA_DOC    + ' - Enter';
    ActionPrint.Caption         := Un_R_file_Alex.MY_ACTION_PRINT_CONST;
    ActionClose.Caption         := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    ActionDoc.Caption           := Un_R_file_Alex.MY_BUTTON_CHOOSE_CONST; 

    cxGrid2DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_SCH_KASSA;
    cxGrid2DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_SCH_KOR_SHORT;
    cxGrid2DBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_SMETA;
    cxGrid2DBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_RAZD;
    cxGrid2DBTableView1DBColumn5.Caption := Un_R_file_Alex.KASSA_STAT;
    cxGrid2DBTableView1DBColumn6.Caption := Un_R_file_Alex.KASSA_KEKV;
    cxGrid2DBTableView1DBColumn7.Caption := Un_R_file_Alex.KASSA_SUMMA;
    cxCheckBox1.Properties.Caption       := Un_R_file_Alex.BANK_FIND_SHOW_PROV;



    T.Free;
    //flag_na_dataset := true;
end;

procedure TfmKassaResultFindForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
    close;
end;

procedure TfmKassaResultFindForm.pFIBDataSet1AfterScroll(
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

procedure TfmKassaResultFindForm.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmKassaResultFindForm.ActionPrintExecute(Sender: TObject);
var
    Res : Variant;
begin
    if ShowPrForm(Self, Self, Res) then
    begin
        if VarArrayDimCount(Res) > 0 then
        begin
            if res[0][0] = 1 then
            begin
    if mainform.cxCheckBox2.Checked
        then frVariables['OS_SCH']    := mainform.cxButtonEdit1.Text
        else frVariables['OS_SCH']    := mainform.cxLabel1.Caption;
    if mainform.cxCheckBox1.Checked
        then frVariables['KOR_SCH']   := mainform.cxButtonEdit2.Text
        else frVariables['KOR_SCH']   := mainform.cxLabel9.Caption;
    frVariables['DATE_BEGIN']:= mainform.cxDateEditFrom.Text;
    frVariables['DATE_END']  := mainform.cxDateEditTo.Text;
    if mainform.cxCheckBoxSumma.Checked
        then frVariables['SUMMA']     := mainform.cxLabel7.Caption + ' ' + mainform.cxTextEditFrom.Text + ' ' + mainform.cxLabel8.Caption + ' ' + mainform.cxTextEditTo.Text
        else frVariables['SUMMA']     := mainform.cxLabel4.Caption;
    if mainform.cxCheckBoxFio.Checked
        then frVariables['FIO']       := mainform.cxTextEditFio.Text
        else frVariables['FIO']       := mainform.cxLabel5.Caption;
    if mainform.cxCheckBoxNote.Checked
        then frVariables['NOTE']      := mainform.cxTextEditNote.Text
        else frVariables['NOTE']      := mainform.cxLabel6.Caption;
    if mainform.cxRadioButtonAll.Checked
        then frVariables['RRR']       := mainform.cxRadioButtonAll.Caption;
    if mainform.cxRadioButton3.Checked
        then frVariables['RRR']       := mainform.cxRadioButton3.Caption;
    if mainform.cxRadioButtonPrihod.Checked
        then frVariables['RRR']       := mainform.cxRadioButtonPrihod.Caption;
                frVariables['not'] := Un_R_file_Alex.KASSA_FIND_NOT_RECORD;
                if pFIBDataSet1.RecordCount = 0
                    then frVariables['pr'] := '0'
                    else frVariables['pr'] := '1';
                Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_find_all.frf');
                Report.PrepareReport;
//        if not cxCheckBoxEdit.Checked then
//        begin
                if res[0][2] = 0 then
                begin
                        Report.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                                   Res[0][1],
                                                   true,
                                                   frAll);

                end
                else Report.ShowReport;

//        end else
//        Report.DesignReport;
            end;
            if res[1][0] = 1 then
            begin
    if mainform.cxCheckBox2.Checked
        then frVariables['OS_SCH']    := mainform.cxButtonEdit1.Text
        else frVariables['OS_SCH']    := mainform.cxLabel1.Caption;
    if mainform.cxCheckBox1.Checked
        then frVariables['KOR_SCH']   := mainform.cxButtonEdit2.Text
        else frVariables['KOR_SCH']   := mainform.cxLabel9.Caption;
    frVariables['DATE_BEGIN']:= mainform.cxDateEditFrom.Text;
    frVariables['DATE_END']  := mainform.cxDateEditTo.Text;
    if mainform.cxCheckBoxSumma.Checked
        then frVariables['SUMMA']     := mainform.cxLabel7.Caption + ' ' + mainform.cxTextEditFrom.Text + ' ' + mainform.cxLabel8.Caption + ' ' + mainform.cxTextEditTo.Text
        else frVariables['SUMMA']     := mainform.cxLabel4.Caption;
    if mainform.cxCheckBoxFio.Checked
        then frVariables['FIO']       := mainform.cxTextEditFio.Text
        else frVariables['FIO']       := mainform.cxLabel5.Caption;
    if mainform.cxCheckBoxNote.Checked
        then frVariables['NOTE']      := mainform.cxTextEditNote.Text
        else frVariables['NOTE']      := mainform.cxLabel6.Caption;
    if mainform.cxRadioButtonAll.Checked
        then frVariables['RRR']       := mainform.cxRadioButtonAll.Caption;
    if mainform.cxRadioButton3.Checked
        then frVariables['RRR']       := mainform.cxRadioButton3.Caption;
    if mainform.cxRadioButtonPrihod.Checked
        then frVariables['RRR']       := mainform.cxRadioButtonPrihod.Caption;
                frVariables['not'] := Un_R_file_Alex.KASSA_FIND_NOT_RECORD;
                if pFIBDataSet1.RecordCount = 0
                    then frVariables['pr'] := '0'
                    else frVariables['pr'] := '1';
                Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_find_all_note.frf');
                Report.PrepareReport;
                if res[1][2] = 0 then
                begin
                        Report.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                                   Res[1][1],
                                                   true,
                                                   frAll);
                end
                else Report.ShowReport;
            end;
            if res[2][0] = 1 then
            begin
                if not pFIBDataSet1.IsEmpty then
                begin
                    if pFIBDataSet1.FieldByName('PRIHOD').AsInteger = 1 then
                    begin
                        frVariables['id_user']   := QuotedStr(IntToStr(mainform.id_user));
                        frVariables['sum_prop']  := Un_func_file_Alex.AllChislo(pFIBDataSet1.FieldByName('SUMMA_PRIH').AsString);
                        frVariables['comp']      := QuotedStr(GetComputerNetName);

                        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10012.frf');
                        Report.PrepareReport;
                        if res[1][2] = 0 then
                        begin
                                Report.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                                           1,
                                                           true,
                                                           frAll);
                        end
                        else Report.ShowReport;
                    end else// showmessage(Un_R_file_Alex.MY_FORM_KASSA_FIND_RAZ);
                end
                else //Showmessage(Un_R_file_Alex.MY_DOC_NO);
            end;
        end;
    end;
end;

procedure TfmKassaResultFindForm.cxGrid1DBTableView1DblClick(
  Sender: TObject);
var
    id_doc_all, id_1, id_2, id_3 : int64;
begin
   id_doc_all := TFIBBCDField(pFIBDataSet1.FieldByName('ID_DOC')).AsInt64;
   DataSet.close;
   DataSet.Sqls.SelectSql.Text :=  'SELECT * FROM KASSA_SELECT_ALL_PO_ALL_DOC('+IntToStr(id_doc_all)+')';
   DataSet.Open;
   if not DataSet.IsEmpty then
   begin
       id_1 := TFIBBCDField(DataSet.FieldByName('R_ID_KASSA')).AsInt64;
       id_2 := TFIBBCDField(DataSet.FieldByName('R_ID_DAY')).AsInt64;
       id_3 := TFIBBCDField(DataSet.FieldByName('R_ID_DOC')).AsInt64;
       Un_lo_file_Alex.LKassaDocShow(self, mainform.id_user, pFIBDatabase1, id_1, id_2 , id_3);
   end;
end;

procedure TfmKassaResultFindForm.ActionDocExecute(Sender: TObject);
begin
    cxGrid1DBTableView1DblClick(Self);
end;

procedure TfmKassaResultFindForm.dxBarLargeButton4Click(Sender: TObject);

begin

 //mainform.formstyle:=fsStayOnTop;
 if mainform.visible=false then mainform.show;
 timer1.enabled:=true;
 hide;
end;

procedure TfmKassaResultFindForm.Timer1Timer(Sender: TObject);
begin
if mainform.flag=2 then
begin
mainform.flag:=1;
close;
end;
end;

procedure TfmKassaResultFindForm.cxCheckBox1Click(Sender: TObject);
 var
    id_ddd : string;
    prihod_n : integer;
begin
    if cxCheckBox1.Checked then
    begin
        cxSplitter2.OpenSplitter;
//         DataSet.close;
//         DataSet.open;
        DataSetProv.Close;
        id_ddd   := pFIBDataSet1.FieldByName('ID_DOC').AsString;
        prihod_n := pFIBDataSet1.FieldByName('PRIHOD').AsInteger;
        DataSetProv.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_ALL_PROV('''+id_ddd+''', '+IntToStr(prihod_n)+')';
        DataSetProv.Open;
    end
    else cxSplitter2.CloseSplitter;
end;

procedure TfmKassaResultFindForm.FormCreate(Sender: TObject);
begin
 cxSplitter2.CloseSplitter;
end;

procedure TfmKassaResultFindForm.DataSetProvAfterScroll(DataSet: TDataSet);
var
    ffio, n_cust, n_do, reg_n, d_d : string;
    y, o : TSpravParams;
    dog_type : integer;
begin
    cxTextEdit1.Text := '';
    try
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
        if dog_type = 0 then   {другие}
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
    except
    end;
end;

end.
