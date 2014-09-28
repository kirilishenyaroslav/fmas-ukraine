unit ShowAddDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MainSpravka, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, pFIBStoredProc, FIBQuery, pFIBQuery, ActnList,
  cxTextEdit, cxCalendar, cxCurrencyEdit, dxBarExtItems, dxBar, ImgList,
  dxStatusBar, ExtCtrls, cxContainer, cxMemo, cxLabel, Placemnt;

type
  TSch = record
      id : int64;
      number : string;
  end;
  TResSch = record
      TT : array of TSch;
  end;

  TfmShowAddDoc = class(TForm)
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    DatabaseMain: TpFIBDatabase;
    Query: TpFIBQuery;
    pFIBStoredProc1: TpFIBStoredProc;
    TransactionWrite: TpFIBTransaction;
    DataSetMain: TpFIBDataSet;
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
    ActionList1: TActionList;
    ActionClose: TAction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarLargeButton1: TdxBarLargeButton;
    ImageList: TImageList;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    ActionFilter: TAction;
    ActionTake: TAction;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    DataSetMainID_DOC: TFIBBCDField;
    DataSetMainNUMBER_DOC: TFIBStringField;
    DataSetMainSUMMA_PRIH: TFIBBCDField;
    DataSetMainNOTE_DOC: TFIBStringField;
    DataSetMainFIO_DOC: TFIBStringField;
    DataSetMainPRIHOD: TFIBIntegerField;
    DataSetMainDATE_DOC: TFIBDateField;
    DataSetMainSUMMA_RASH: TFIBBCDField;
    DataSetMainNUM_RAS_NATIVE: TFIBStringField;
    DataSetMainNUM_RAS_CUST: TFIBStringField;
    DataSetMainNAME_CUST: TFIBStringField;
    DataSetMainID_RAS_NATIVE: TFIBBCDField;
    DataSetMainID_RAS_CUST: TFIBBCDField;
    DataSetMainID_CUST: TFIBBCDField;
    Panel1: TPanel;
    cxMemo1: TcxMemo;
    cxLabel1: TcxLabel;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    DataSetMainDATE_PROV: TFIBDateField;
    FormStorage1: TFormStorage;
    procedure Bank_select;
    procedure Kassa_select;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionFilterExecute(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure Loadcaption;
    procedure DataSetMainAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    dateTo, DateFrom : Tdate;
    sum_from, sumTo : double;
    number, osnovanie, fio_, kontr_name_, name_sch_box_, name_kor_sch_box_, name_kontr_box_, name_ras_box_ : string;
    prihod, rashod : smallint;
    id_ras_acc_, id_acc_, id_customer : int64;
    ResSch : TResSch;
    ResKorSch : TResSch;
    myform : TfmMainSpravka;
    max_date : TDate;
    flag_sch, flag_kor_sch, flag_num, flag_sum, flag_note, flag_fio, flag_kontr, flag_kontr_sp, flag_rs, flag_name_konrt : boolean;
  public
  end;

function ShowSpravkaAdd(AOwner : TComponent; m : TfmMainSpravka; Var pk_id_doc : int64; var num_doc, date_doc, sum_doc, note, fio, name_rs : string; var prih : integer; var iid_cust, id_rate, id_rate_nat : int64) : boolean;

implementation
uses FilterSpravka, Un_Progress_form, DateUtils, SpravkaUnitCaption, Un_R_file_Alex;
{$R *.dfm}

function ShowSpravkaAdd(AOwner : TComponent; m : TfmMainSpravka; Var pk_id_doc : int64; var num_doc, date_doc, sum_doc, note, fio, name_rs : string; var prih : integer; var iid_cust, id_rate, id_rate_nat : int64) : boolean;
var
    T : TfmShowAddDoc;
    i : integer;
begin
    T := TfmShowAddDoc.create(AOwner);
    T.myform            := m;
    if m.cxComboBox1.ItemIndex > 8
         then T.dateTo  := IncDay(StrToDate('01.'+IntToStr(m.cxComboBox1.ItemIndex+1)+'.'+IntToStr(m.cxSpinEdit1.Value)), -1)
         else T.dateTo  := IncDay(StrToDate('01.0'+IntToStr(m.cxComboBox1.ItemIndex+1)+'.'+IntToStr(m.cxSpinEdit1.Value)), -1);
    if m.cxComboBox1.ItemIndex > 8
         then T.DateFrom := IncMonth(StrToDate('01.'+IntToStr(m.cxComboBox1.ItemIndex+1)+'.'+IntToStr(m.cxSpinEdit1.Value)), -1)
         else T.DateFrom := IncMonth(StrToDate('01.0'+IntToStr(m.cxComboBox1.ItemIndex+1)+'.'+IntToStr(m.cxSpinEdit1.Value)), -1);
    T.max_date          := T.dateTo;
    T.sum_from          := 0;
    T.sumTo             := 1000000000;
    T.number            := '';
    T.osnovanie         := '';
    T.fio_              := '';
    T.kontr_name_       := '';
    T.name_sch_box_     := '';
    T.name_kor_sch_box_ := '';
    T.name_kontr_box_   := '';
    T.name_ras_box_     := '';
    T.prihod            := 1;
    T.rashod            := 1;
    T.id_ras_acc_       := 0;
    T.id_acc_           := 0;
    T.id_customer       := 0;
    T.flag_sch          := false;
    T.flag_kor_sch      := false;
    T.flag_num          := false;
    T.flag_sum          := false;
    T.flag_note         := false;
    T.flag_fio          := false;
    T.flag_kontr        := false;
    T.flag_kontr_sp     := true;
    T.flag_rs           := false;
    T.flag_name_konrt   := false;

    T.Loadcaption;

    T.DatabaseMain                     := T.myform.Database;
    T.pFIBTransaction1.DefaultDatabase := T.DatabaseMain;
    T.pFIBDataSet1.Database            := T.DatabaseMain;
    T.DataSetMain.Database             := T.DatabaseMain;
    T.DataSetMain.Transaction          := T.pFIBTransaction1;
    T.pFIBDataSet1.Transaction         := T.pFIBTransaction1;

    T.TransactionWrite.DefaultDatabase := T.DatabaseMain;
    T.pFIBStoredProc1.database         := T.DatabaseMain;

//    T.DataSet.database                 := T.DatabaseMain;
    T.Query.Database                   := T.DatabaseMain;
//    T.pFIBDataSet1.Database            := T.DatabaseMain;
//    T.DataSetProv.Database             := T.DatabaseMain;
    T.pFIBStoredProc1.Transaction      := T.TransactionWrite;
    T.Query.Transaction                := T.TransactionWrite;

    T.pFIBTransaction1.StartTransaction;

    T.pFIBDataSet1.Close;
    if m.kod_s = 2 then
    begin
        T.pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_BALLANCE_SCH';
        T.cxGrid1DBTableView1DBColumn7.Visible := false;
    end;
    if m.kod_s = 1 then
    begin
        T.pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCHS('+IntToStr(m.id_user)+')';
        T.cxGrid1DBTableView1DBColumn5.Visible := false;
        T.cxGrid1DBTableView1DBColumn6.Visible := false;
        T.cxGrid1DBTableView1DBColumn8.Visible := false;
    end;
    T.pFIBDataSet1.Open;
    T.pFIBDataSet1.FetchAll;
    T.pFIBDataSet1.First;

    SetLength(T.ResSch.TT, T.pFIBDataSet1.RecordCount);

    For i := 0 to T.pFIBDataSet1.RecordCount-1 do
    begin
       T.ResSch.TT[i].id     := T.pFIBDataSet1.fieldByName('ID_SCH').AsVariant;
       T.ResSch.TT[i].Number := T.pFIBDataSet1.FieldByName('SCH_NUM').AsString;
       T.pFIBDataSet1.next;
    end;

    if not ShowFilterSpravka(nil, m.id_user, M.Database, T.resSch, T.ResKorSch, T.sum_from, T.sumTo, T.number, T.osnovanie, T.fio_, T.kontr_name_, T.name_sch_box_, T.name_kor_sch_box_, T.name_kontr_box_, T.name_ras_box_, T.prihod, T.rashod, T.id_ras_acc_, T.id_acc_, T.id_customer, T.dateTo, T.DateFrom, T.flag_sch, T.flag_kor_sch, T.flag_num, T.flag_sum, T.flag_note, T.flag_fio, T.flag_kontr, T.flag_kontr_sp, T.flag_rs, T.flag_name_konrt, m.kod_s, T.max_date) then
    begin
        T.Free;
        result := false;
        exit;
    end;

    if m.kod_s = 2 then T.Bank_select;
    if m.kod_s = 1 then T.Kassa_select;

    if T.showmodal = mrOk then
    begin
        pk_id_doc := TFibBcdField(T.DataSetMainID_DOC).AsInt64;
        num_doc   := TFibBcdField(T.DataSetMainNUMBER_DOC).AsString;
        date_doc  := TFibBcdField(T.DataSetMainDATE_DOC).AsString;
        if TFibBcdField(T.DataSetMainPRIHOD).AsInteger = 1
            then sum_doc   := TFibBcdField(T.DataSetMainSUMMA_PRIH).AsString
            else sum_doc   := TFibBcdField(T.DataSetMainSUMMA_RASH).AsString;
        note      := TFibBcdField(T.DataSetMainNOTE_DOC).AsString;
        if m.kod_s = 1 then
        begin
            fio     := TFibBcdField(T.DataSetMainFIO_DOC).AsString;
            name_rs := TFibBcdField(T.DataSetMainFIO_DOC).AsString;
        end;
        if m.kod_s = 2 then
        begin
            fio     := TFibBcdField(T.DataSetMainNAME_CUST).AsString;
            name_rs := '';
        end;
        prih        := TFibBcdField(T.DataSetMainPRIHOD).AsInteger;
        iid_cust    := TFibBcdField(T.DataSetMainID_CUST).AsInt64;
        id_rate     := TFibBcdField(T.DataSetMainID_RAS_CUST).AsInt64;
        id_rate_nat := TFibBcdField(T.DataSetMainID_RAS_NATIVE).AsInt64;

        result    := true;
    end else
    begin
        result    := false;
    end;
end;

{ TfmShowAddDoc }

procedure TfmShowAddDoc.Bank_select;
var
    id_session : int64;
    i : integer;
    T : TfmUn_Progress_form;
begin
    T := TfmUn_Progress_form.Create(self, find_, SpravkaUnitCaption.SHOW_FIND_DOC);
    T.Show;
    T.Update;
    T.RxGIFAnimator1.Animate := true;
    T.Update;
    TransactionWrite.StartTransaction;
    id_session := DatabaseMain.Gen_Id('GEN_BANK_SESSION_FIND', 1);

    for i := 0 to length(ResSch.TT)-1 do
    begin
        Query.Close;
        Query.SQL.Text := 'INSERT INTO BANK_TEMP_FIND_OSN_SCH values (' + IntToStr(ResSch.TT[i].id) + ', '+IntToStr(id_session)+')';
        Query.ExecQuery;
    end;
    for i := 0 to length(ResKorSch.TT)-1  do
    begin
        Query.SQL.Clear;
        Query.close;
        Query.SQL.Text := 'INSERT INTO BANK_TEMP_KORRESPOND_SCH values(' + IntToStr(ResKorSch.TT[i].id) + ', '+IntToStr(id_session)+')';
        Query.ExecQuery;
    end;
    
   if (prihod =1) {or ((prihod=1) and (rashod = 1))} then
   begin
        Query.close;
        Query.SQL.Clear;
        Query.SQL.Text := 'INSERT INTO BANK_TEMP_FIND (ID_PROV, ID_SESSION, PRIHOD, ID_DOC)';
        Query.SQL.Add('select pub_dt_all_prov.ID_PROV as ID_PROV, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(1)+' AS PRIHOD, pub_dt_all_doc.pk_id AS ID_DOC');
        Query.SQL.Add('from  pub_dt_all_prov, pub_sp_main_oper, pub_dt_all_doc');
        if (flag_kontr) and (flag_name_konrt) then
        begin
            Query.SQL.Add(', PUB_SP_CUSTOMER');
        end;
        Query.SQL.Add('where pub_dt_all_prov.id_oper=pub_sp_main_oper.id_oper');
        if (flag_kontr) and (flag_name_konrt) then
        begin
            Query.SQL.Add('and pub_dt_all_doc.id_customer=PUB_SP_CUSTOMER.ID_CUSTOMER');
            Query.SQL.Add('and upper(PUB_SP_CUSTOMER.NAME_CUSTOMER) like '''+'%' + kontr_name_ + '%'+'''');
        end;
        Query.SQL.Add('AND (exists (select * from BANK_TEMP_FIND_OSN_SCH where pub_sp_main_oper.oper_db_id_sch=BANK_TEMP_FIND_OSN_SCH.ID_SCH and BANK_TEMP_FIND_OSN_SCH.ID_SESSION='+IntToStr(id_session)+' ))');
        if flag_kor_sch then
            Query.SQL.Add('AND (exists (select * from BANK_TEMP_KORRESPOND_SCH where pub_sp_main_oper.oper_kr_id_sch=BANK_TEMP_KORRESPOND_SCH.ID_KOR_SCH and BANK_TEMP_KORRESPOND_SCH.ID_SESSION='+IntToStr(id_session)+' ))');
        Query.SQL.Add('AND pub_dt_all_prov.db_pk_id=pub_dt_all_doc.pk_id');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC >='''+DateToStr(DateFrom)+'''');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC <='''+DateToStr(dateTo)+'''');
        if flag_sum then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.summa >='+StringReplace(FloatToStr(sum_from), ',', '.', [rfReplaceAll])+'');
            Query.SQL.Add('AND pub_dt_all_doc.summa <='+StringReplace(FloatToStr(sumTo), ',', '.', [rfReplaceAll])+'');
        end;
        if flag_kontr then
        begin
            if flag_kontr then Query.SQL.Add('AND pub_dt_all_doc.id_customer='+IntToStr(id_customer)+' ');
            if flag_kontr_sp then Query.SQL.Add('AND pub_dt_all_doc.ID_RATE_ACC='+IntToStr(id_ras_acc_)+' ');
        end;
{        if flag_ then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.ID_RATE_ACC_NATIVE='+IntToStr(mainform.id_ras_native)+' ');
        end;}
        if flag_note then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.note like '''+'%' + osnovanie + '%'+'''');
        end;
        if flag_num then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.NUM_DOC like '''+'%' + number + '%'+'''');
        end;
        Query.SQL.Add('AND pub_dt_all_doc.PRIHOD ='+IntToStr(1)+'');

        Query.SQL.Add('group by pub_dt_all_prov.ID_PROV, pub_dt_all_doc.pk_id');
        Query.ExecQuery;
    end;

    if (rashod = 1) {or ((prihod = 1) and(rashod = 1))} then
    begin
        Query.close;
        Query.SQL.Text := 'INSERT INTO BANK_TEMP_FIND (ID_PROV, ID_SESSION, PRIHOD, ID_DOC)';
        Query.SQL.Add('select pub_dt_all_prov.ID_PROV as ID_PROV, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(0)+' AS PRIHOD, pub_dt_all_doc.pk_id AS ID_DOC');
        Query.SQL.Add('from  pub_dt_all_prov, pub_sp_main_oper, pub_dt_all_doc');
        if (flag_kontr) and (flag_name_konrt) then
        begin
            Query.SQL.Add(', PUB_SP_CUSTOMER');
        end;
        Query.SQL.Add('where pub_dt_all_prov.id_oper=pub_sp_main_oper.id_oper');
        if (flag_kontr) and (flag_name_konrt) then
        begin
            Query.SQL.Add('and pub_dt_all_doc.id_customer=PUB_SP_CUSTOMER.ID_CUSTOMER');
            Query.SQL.Add('and upper(PUB_SP_CUSTOMER.NAME_CUSTOMER) like '''+'%' + kontr_name_ + '%'+'''');
        end;
        Query.SQL.Add('AND (exists (select * from BANK_TEMP_FIND_OSN_SCH where pub_sp_main_oper.oper_kr_id_sch=BANK_TEMP_FIND_OSN_SCH.ID_SCH and BANK_TEMP_FIND_OSN_SCH.ID_SESSION='+IntToStr(id_session)+' ))');
        if flag_kor_sch then
            Query.SQL.Add('AND (exists (select * from BANK_TEMP_KORRESPOND_SCH where pub_sp_main_oper.oper_db_id_sch=BANK_TEMP_KORRESPOND_SCH.ID_KOR_SCH and BANK_TEMP_KORRESPOND_SCH.ID_SESSION='+IntToStr(id_session)+' ))');
        Query.SQL.Add('AND pub_dt_all_prov.kr_pk_id=pub_dt_all_doc.pk_id');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC >='''+dateToStr(DateFrom)+'''');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC <='''+dateToStr(DateTo)+'''');
        if flag_sum then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.summa >='+StringReplace(FloatToStr(sum_from), ',', '.', [rfReplaceAll])+'');
            Query.SQL.Add('AND pub_dt_all_doc.summa <='+StringReplace(FloatToStr(sumTo), ',', '.', [rfReplaceAll])+'');
        end;
        if flag_kontr then
        begin
            if flag_kontr_sp then Query.SQL.Add('AND pub_dt_all_doc.id_customer='+IntToStr(id_customer)+' ');
            if flag_rs then Query.SQL.Add('AND pub_dt_all_doc.ID_RATE_ACC='+IntToStr(id_ras_acc_)+' ');
        end;
{        if mainform.cxCheckBox3.Checked then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.ID_RATE_ACC_NATIVE='+IntToStr(mainform.id_ras_native)+' ');
        end;}
        if flag_note then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.note like '''+'%'+osnovanie+'%'+'''');
        end;
        if flag_num then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.NUM_DOC like '''+'%' + number + '%'+'''');
        end;
        Query.SQL.Add('AND pub_dt_all_doc.PRIHOD ='+IntToStr(0)+'');
        Query.SQL.Add('group by pub_dt_all_prov.ID_PROV, pub_dt_all_doc.pk_id');
        Query.ExecQuery;
    end;
    TransactionWrite.Commit;

    DataSetMain.Close;
    DataSetMain.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SPARAVKA_FIND_DOC('+ IntToStr(id_session) +', '+IntToStr(myform.kod_s)+')';
    DataSetMain.Open;
    DataSetMain.FetchAll;

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
    T.Free;
end;

procedure TfmShowAddDoc.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmShowAddDoc.ActionFilterExecute(Sender: TObject);
begin
    if ShowFilterSpravka(self, myform.id_user, myform.Database, resSch, ResKorSch, sum_from, sumTo, number, osnovanie, fio_, kontr_name_, name_sch_box_, name_kor_sch_box_, name_kontr_box_, name_ras_box_, prihod, rashod, id_ras_acc_, id_acc_, id_customer, dateTo, DateFrom, flag_sch, flag_kor_sch, flag_num, flag_sum, flag_note, flag_fio, flag_kontr, flag_kontr_sp, flag_rs, flag_name_konrt, myform.kod_s, max_date) then
    begin
        if myform.kod_s = 2 then Bank_select;
        if myform.kod_s = 1 then Kassa_select;
    end;
end;

procedure TfmShowAddDoc.ActionTakeExecute(Sender: TObject);
begin
    if not DataSetMain.IsEmpty then ModalResult := mrOk;
end;

procedure TfmShowAddDoc.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ActionTakeExecute(sender);
end;

procedure TfmShowAddDoc.Loadcaption;
begin
    CAption                              := SpravkaUnitCaption.WINDOW_CHANGE;
    ActionClose.Caption                  := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    ActionFilter.Caption                 := Un_R_file_Alex.MY_ACTION_FILTER_CONST;
    ActionTake.Caption                   := Un_R_file_Alex.MY_ACTION_CHOOSE_CONST;
    cxGrid1DBTableView1DBColumn1.Caption := SpravkaUnitCaption.MAIN_FORM_NOMER;
    cxGrid1DBTableView1DBColumn2.Caption := SpravkaUnitCaption.MAIN_FORM_DATE;
    cxGrid1DBTableView1DBColumn3.Caption := SpravkaUnitCaption.SUMMA_PRIH;
    cxGrid1DBTableView1DBColumn4.Caption := SpravkaUnitCaption.SUMMA_RAS;
    cxGrid1DBTableView1DBColumn5.Caption := SpravkaUnitCaption.R_S;
    cxGrid1DBTableView1DBColumn6.Caption := SpravkaUnitCaption.R_S_CUST;
    cxGrid1DBTableView1DBColumn7.Caption := SpravkaUnitCaption.MAIN_FORM_FIO;
    cxGrid1DBTableView1DBColumn8.Caption := SpravkaUnitCaption.NAME_CUST;
    cxGrid1DBTableView1DBColumn9.Caption := Un_R_file_Alex.BANK_DATE_VIP;
    cxLabel1.Caption                     := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;


end;

procedure TfmShowAddDoc.DataSetMainAfterScroll(DataSet: TDataSet);
begin
    cxMemo1.text := DataSetMainNOTE_DOC.AsString;
end;

procedure TfmShowAddDoc.Kassa_select;
var
    id_session : int64;
    i : integer;
    T : TfmUn_Progress_form;
begin
    T := TfmUn_Progress_form.Create(self, find_, SpravkaUnitCaption.SHOW_FIND_DOC);
    T.Show;
    T.Update;
    T.RxGIFAnimator1.Animate := true;
    T.Update;
    TransactionWrite.StartTransaction;
    id_session := DatabaseMain.Gen_Id('GEN_KASSA_SESSION_FIND', 1);

    for i := 0 to length(ResSch.TT)-1 do
    begin
        Query.Close;
        Query.SQL.Text := 'INSERT INTO KASSA_TEMP_FIND_OSN_SCH values (' + IntToStr(ResSch.TT[i].id) + ', '+IntToStr(id_session)+')';
        Query.ExecQuery;
    end;
    for i := 0 to length(ResKorSch.TT)-1  do
    begin
        Query.SQL.Clear;
        Query.close;
        Query.SQL.Text := 'INSERT INTO KASSA_TEMP_KORRESPOND_SCH values(' + IntToStr(ResKorSch.TT[i].id) + ', '+IntToStr(id_session)+')';
        Query.ExecQuery;
    end;

    if (prihod =1) then
    begin
        Query.close;
        Query.SQL.Clear;
        Query.SQL.Text := 'INSERT INTO KASSA_TEMP_FIND (ID_PROV, ID_SESSION, PRIHOD, ID_DOC)';
        Query.SQL.Add('select pub_dt_all_prov.ID_PROV as ID_PROV, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(1)+' AS PRIHOD, pub_dt_all_doc.pk_id AS ID_DOC');
        Query.SQL.Add('from  pub_dt_all_prov, pub_sp_main_oper, pub_dt_all_doc');
        Query.SQL.Add('where pub_dt_all_prov.id_oper=pub_sp_main_oper.id_oper');
        Query.SQL.Add('AND (exists (select * from KASSA_TEMP_FIND_OSN_SCH where pub_sp_main_oper.oper_db_id_sch=ID_SCH and ID_SESSION='+IntToStr(id_session)+' ))');
        if flag_kor_sch then
            Query.SQL.Add('AND (exists (select * from KASSA_TEMP_KORRESPOND_SCH where pub_sp_main_oper.oper_kr_id_sch=ID_KOR_SCH and ID_SESSION='+IntToStr(id_session)+' ))');
        Query.SQL.Add('AND pub_dt_all_prov.db_pk_id=pub_dt_all_doc.pk_id');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC >='''+DateToStr(DateFrom)+'''');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC <='''+DateToStr(dateTo)+'''');
        if flag_sum then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.summa >='+StringReplace(FloatToStr(sum_from), ',', '.', [rfReplaceAll])+'');
            Query.SQL.Add('AND pub_dt_all_doc.summa <='+StringReplace(FloatToStr(sumTo), ',', '.', [rfReplaceAll])+'');
        end;
        if flag_note then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.note like '''+'%' + osnovanie + '%'+'''');
        end;
        if flag_num then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.NUM_DOC like '''+'%' + number + '%'+'''');
        end;
        if flag_fio then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.FIO like '''+'%' + fio_ + '%'+'''');
        end;

        Query.SQL.Add('group by pub_dt_all_prov.ID_PROV, pub_dt_all_doc.pk_id');
        Query.ExecQuery;
    end;


    if (rashod = 1) then
    begin
        Query.close;
        Query.SQL.Text := 'INSERT INTO KASSA_TEMP_FIND (ID_PROV, ID_SESSION, PRIHOD, ID_DOC)';
        Query.SQL.Add('select pub_dt_all_prov.ID_PROV as ID_PROV, '+IntToStr(id_session)+' as ID_SESSION, '+IntToStr(0)+' AS PRIHOD, pub_dt_all_doc.pk_id AS ID_DOC');
        Query.SQL.Add('from  pub_dt_all_prov, pub_sp_main_oper, pub_dt_all_doc');
        Query.SQL.Add('where pub_dt_all_prov.id_oper=pub_sp_main_oper.id_oper');
        Query.SQL.Add('AND (exists (select * from KASSA_TEMP_FIND_OSN_SCH where pub_sp_main_oper.oper_kr_id_sch=ID_SCH and ID_SESSION='+IntToStr(id_session)+' ))');
        if flag_kor_sch then
            Query.SQL.Add('AND (exists (select * from KASSA_TEMP_KORRESPOND_SCH where pub_sp_main_oper.oper_db_id_sch=ID_KOR_SCH and ID_SESSION='+IntToStr(id_session)+' ))');
        Query.SQL.Add('AND pub_dt_all_prov.kr_pk_id=pub_dt_all_doc.pk_id');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC >='''+dateToStr(DateFrom)+'''');
        Query.SQL.Add('AND pub_dt_all_doc.DATE_DOC <='''+dateToStr(DateTo)+'''');
        if flag_sum then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.summa >='+StringReplace(FloatToStr(sum_from), ',', '.', [rfReplaceAll])+'');
            Query.SQL.Add('AND pub_dt_all_doc.summa <='+StringReplace(FloatToStr(sumTo), ',', '.', [rfReplaceAll])+'');
        end;
        if flag_note then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.note like '''+'%'+osnovanie+'%'+'''');
        end;
        if flag_num then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.NUM_DOC like '''+'%' + number + '%'+'''');
        end;
        if flag_fio then
        begin
            Query.SQL.Add('AND pub_dt_all_doc.FIO like '''+'%' + fio_ + '%'+'''');
        end;
        Query.SQL.Add('group by pub_dt_all_prov.ID_PROV, pub_dt_all_doc.pk_id');
        Query.ExecQuery;
    end;
    TransactionWrite.Commit;

    DataSetMain.Close;
    DataSetMain.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SPARAVKA_FIND_DOC('+ IntToStr(id_session) +', '+IntToStr(myform.kod_s)+')';
    DataSetMain.Open;
    DataSetMain.FetchAll;

    Query.Transaction := TransactionWrite;
    TransactionWrite.StartTransaction;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM KASSA_TEMP_FIND WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM KASSA_TEMP_FIND_OSN_SCH WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM KASSA_TEMP_KORRESPOND_SCH WHERE ID_SESSION='+IntToStr(id_session)+'');
    Query.ExecQuery;
    TransactionWrite.Commit;
    T.Free;
end;

procedure TfmShowAddDoc.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;
end;

procedure TfmShowAddDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FormStorage1.SaveFormPlacement;
end;

end.
