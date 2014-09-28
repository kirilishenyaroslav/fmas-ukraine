unit AddChangeProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxMRUEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, ActnList, Un_R_file_Alex, cxLabel, FR_Class, pFIBDatabase,
  DB, FIBDataSet, pFIBDataSet, FIBDatabase, GlobalSPR, KassOrder, Un_lo_file_Alex,
  cxCheckBox, KassaInputSumma, kernel, cxMemo, Buttons, FIBQuery,
  pFIBQuery, pFIBStoredProc, Un_func_file_Alex, cxCalendar;

type
  TfmModeProv = (AddProv, ChangeProv);

  TfmAddChangeProv = class(TForm)
    cxMRUEditSch: TcxMRUEdit;
    cxMRUEditSt: TcxMRUEdit;
    cxMRUEditKekv: TcxMRUEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cxButton1: TcxButton;
    cxButtonClose: TcxButton;
    cxTextEditSumma: TcxTextEdit;
    ActionList1: TActionList;
    ActionAdd: TAction;
    Actionclose: TAction;
    cxLabelfio: TcxLabel;
    cxLabelSch: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    DataSetSchKorespond: TpFIBDataSet;
    Class_Database: TpFIBDatabase;
    Class_Transaction_R: TpFIBTransaction;
    cxComboBoxSch: TcxComboBox;
    DataSetSmRazdSt: TpFIBDataSet;
    cxLabel9: TcxLabel;
    Label1: TLabel;
    cxMRUEditRazd: TcxMRUEdit;
    cxMRUEditSm: TcxMRUEdit;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxCheckBox1: TcxCheckBox;
    Class_Transaction_Wr: TpFIBTransaction;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel2: TcxTextEdit;
    cxLabel7: TcxTextEdit;
    cxLabel1: TcxTextEdit;
    Label3: TcxTextEdit;
    Label4: TcxTextEdit;
    cxLabel8: TcxTextEdit;
    cxMemoDog: TcxMemo;
    SpeedButton1: TSpeedButton;
    Class_StoredProc: TpFIBStoredProc;
    DataSetError: TpFIBDataSet;
    GroupBox1: TGroupBox;
    cxTextEditNumber: TcxTextEdit;
    cxLabel12: TcxLabel;
    cxDateEditDateDoc: TcxDateEdit;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxTextEditFio: TcxTextEdit;
    cxLabel20: TcxLabel;
    cxTextEditNote: TcxTextEdit;
    cxTextEditTypeDoc: TcxTextEdit;
    DataSetDoc: TpFIBDataSet;
    cxMRUEdit1: TcxMRUEdit;
    TransactionDOG: TpFIBTransaction;
    DataSetKeyInput: TpFIBDataSet;
    procedure ActionAddExecute(Sender: TObject);
    procedure ActioncloseExecute(Sender: TObject);
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    procedure cxMRUEditFioPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditRazdPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditStPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditKekvPropertiesButtonClick(Sender: TObject);
    procedure cxComboBoxSchFocusChanged(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    function SelectDogovor(all_summa : double) : boolean;
    procedure SelectAll(a: integer; sch_k, sm, rz, st, kv : int64; mode_ : integer; add : integer);
    procedure cxMRUEditSmPropertiesButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cxMRUEditSchPropertiesButtonClick(Sender: TObject);
    procedure cxTextEditSummaExit(Sender: TObject);
    procedure EnableVstrechProv(s : boolean);
    procedure cxMRUEdit1PropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditSchExit(Sender: TObject);
    procedure cxMRUEditSmExit(Sender: TObject);
    procedure cxMRUEditRazdExit(Sender: TObject);
    procedure cxMRUEditStExit(Sender: TObject);
    procedure cxMRUEditKekvExit(Sender: TObject);
  private
    Ind : array of Int64;
    id_man, id_smeta, id_stat, id_r, id_k, id_sch, id_kor_sch, id_dog_add, kod_dog_add : int64;
    name_fio, {name_smeta, name_stat, {name_r, name_k,} name_sch, name_kor_sch, date_dog, num_dog, name_cust, t_dog, r_dog : string;
    flag : TfmModeProv;
    mm : TfmKassOrder;
    id_doc, id_prov, id_ra, id_r_c, id_c : int64;
    flag_na_dog : boolean;
    sm_str, raz_str, st_str, kekv_str, sch_str : string;
    procedure LoadCaptions;
  public
  end;

function Show_Provodka(n : TfmKassOrder; ID_KAS : INT64; db : TpFIBDatabase; Tr : TpFIBTransaction; m : TfmModeProv; var id_korespond_sch, id_m, id_sc, id_sm, id_st, id_razd, id_kekv : int64; var sum : double; var name_fio, name_sch, name_smeta, name_stat, name_r, name_k, name_kor_sch : string; var id_dog, kod_dog : int64; var date_d, num_d, name_c, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, type_dog, reg_dog : string; var id_pr, id_ras, id_ras_cust, id_cust : int64):boolean;

implementation
uses KassaSelectSch, DogLoaderUnit, DateUtils, KassaDocMainForm;
{$R *.dfm}

function Show_Provodka(n : TfmKassOrder; ID_KAS : INT64; db : TpFIBDatabase; Tr : TpFIBTransaction; m : TfmModeProv; var id_korespond_sch, id_m, id_sc, id_sm, id_st, id_razd, id_kekv : int64; var sum : double; var name_fio, name_sch, name_smeta, name_stat, name_r, name_k, name_kor_sch : string; var id_dog, kod_dog : int64; var date_d, num_d, name_c, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, type_dog, reg_dog : string; var id_pr, id_ras, id_ras_cust, id_cust : int64):boolean;
var
    T : TfmAddChangeProv;
    i : integer;
    kod, ostatok : string;
    k, pr : integer;
    y, o : TSpravParams;
begin
    DecimalSeparator := ',';
    T := TfmAddChangeProv.Create(nil);
    T.mm := n;
    T.date_dog  := date_d;
    T.num_dog   := num_d;
    T.name_cust := name_c;
    T.id_ra      := id_ras;
    T.id_r_c    := id_ras_cust;
    T.id_c      := id_cust;
    T.cxLabel1.Text  := title_sm;
    T.Label3.Text    := title_rz;
    T.Label4.Text    := title_st;
    T.cxLabel8.Text  := title_kekv;
    T.cxLabel2.Text  := title_sch;
    T.cxLabel7.Text  := title_kor_sch;
    T.id_k       := id_kekv;
    T.id_smeta   := id_sm;
    T.id_r       := id_razd;
    T.id_stat    := id_st;
    T.id_kor_sch := id_korespond_sch;
    T.cxMRUEditSch.Text    := name_kor_sch;
    T.cxMRUEditSm.Text     := name_smeta;
    T.cxMRUEditRazd.Text   := name_r;
    T.cxMRUEditSt.Text     := name_stat;
    T.cxMRUEditKekv.Text   := name_k;
    T.id_man               := id_m;
    T.name_fio             := name_fio;
    T.EnableVstrechProv(false);
    if sum <> 0 then T.cxTextEditSumma.Text := FloatToStr(sum);
    T.Label1.Caption       := name_fio;
    //        T.cxMRUEditFio.Text    := name_fio;
    T.cxMRUEditKekv.Text   := name_k;
    T.name_kor_sch         := name_kor_sch;
    T.id_sch               := id_sc;
    T.name_sch             := name_sch;
    if name_fio <> '' then
    begin
        T.cxLabel17.Caption    := n.cxLabel10.Caption;
        T.cxLabel19.Caption    := n.cxLabel11.Caption;
    end;

    T.Class_Database                       := DB;
    T.Class_Transaction_R.DefaultDatabase  := T.Class_Database;
    T.Class_Database.DefaultTransaction    := T.Class_Transaction_R;
    T.Class_Transaction_R.StartTransaction;
    T.DataSetSchKorespond.Database         := T.Class_Database;
    T.DataSetSchKorespond.Transaction      := T.Class_Database.DefaultTransaction;
    T.Class_Transaction_Wr.DefaultDatabase := T.Class_Database;
    T.TransactionDOG.DefaultDatabase       := T.Class_Database;
    T.DataSetDoc.Database                  := T.Class_Database;
    T.DataSetDoc.Transaction               := T.Class_Database.DefaultTransaction;
    T.DataSetKeyInput.Database             := T.Class_Database;
    T.DataSetKeyInput.Transaction          := T.Class_Database.DefaultTransaction;
    T.DataSetSchKorespond.Transaction.StartTransaction;
    T.DataSetSchKorespond.Close;
    T.DataSetSchKorespond.SQLs.SelectSQL.Text := 'SELECT * FROM MBOOK_INI_DATA';
    T.DataSetSchKorespond.Open;
    if T.DataSetSchKorespond.FieldByName('USE_DEFAULT_VALUES').AsInteger = 1 then
    begin
        T.cxMRUEditSm.Enabled   := false;
        T.cxMRUEditRazd.Enabled := false;
        T.cxMRUEditSt.Enabled   := false;
    end;
    if T.DataSetSchKorespond.FieldByName('USE_DEFAULT_KEKV').AsInteger = 1 then
    begin
        T.cxMRUEditKekv.Enabled := false;
    end;
    T.DataSetSchKorespond.Close;
    T.DataSetSchKorespond.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(ID_KAS)+') ';
    T.DataSetSchKorespond.Open;
    T.DataSetSchKorespond.FetchAll;
    if T.DataSetSchKorespond.RecordCount = 1 then T.cxComboBoxSch.Enabled := false;
    T.id_dog_add := id_dog;
    T.kod_dog_add := kod_dog;
    T.flag_na_dog := false;
    if id_dog > 0 then
    begin
        T.name_cust := name_c;
        T.date_dog  := date_d;
        T.num_dog   := num_d;
        T.r_dog     := reg_dog;
        T.t_dog     := type_dog;
        T.cxMemoDog.Text := Un_R_file_Alex.BANK_DOG_NUM+' : ' + type_dog+'; № '+num_d+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +date_d + '( '+ Un_R_file_Alex.KASSA_REG_NUM + reg_dog+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + name_c;

        try
            y := TSpravParams.Create;
            o := TSpravParams.Create;
            y['DataBase'] := Integer(T.Class_Database.Handle);
            y['ReadTransaction'] := Integer(T.Class_Database.DefaultTransaction.Handle);
            y['ID_DOG']  := id_dog;
            y['KOD_DOG'] := kod_dog;
            GetDogovorInfo(nil, @y, @o);
                if o['DOG_TYPE'] = 1 then  {студгородок}
                    T.cxMemoDog.Text := Un_R_file_Alex.KASSA_FIO_PROJIV + o['FIO_COMBO'] + Un_R_file_Alex.KASSA_REG_N+o['REGEST_NUM'] + Un_R_file_Alex.KASSA_OT_D + DateToStr(o['D_DOG']) + Un_R_file_Alex.KASSA_NAME_CUS + o['NAME_CUSTOMER'];
                if o['DOG_TYPE'] = 2 then   {обучение}
                    T.cxMemoDog.Text := Un_R_file_Alex.KASSA_FIO_OBUCH + o['FIO_COMBO'] + Un_R_file_Alex.KASSA_DOG_N+ '' + o['NUM_DOG']+' ) '  + Un_R_file_Alex.KASSA_REG_N+o['REGEST_NUM'] + Un_R_file_Alex.KASSA_OT_D + DateToStr(o['D_DOG']) + Un_R_file_Alex.KASSA_NAME_CUS + o['NAME_CUSTOMER'];
            y.Free;
            o.Free;
        except
            y.Free;
            o.Free;
        end;
        T.cxMemoDog.Visible := true;
//        T.cxMRUEditFio.Text := name_c;
        T.cxCheckBox1.Checked := true;
    end else
    begin
        T.cxCheckBox1.Checked := false;

    end;

    if m = AddProv then
    begin
        if not T.DataSetSchKorespond.IsEmpty then
        begin
            T.DataSetSchKorespond.FetchAll;
            SetLength(T.Ind, T.DataSetSchKorespond.RecordCount);
            T.DataSetSchKorespond.First;
            T.cxComboBoxSch.Properties.Items.Clear;
            i := 0;
            while not T.DataSetSchKorespond.Eof do
            begin
                T.Ind[T.DataSetSchKorespond.RecNo - 1] := T.DataSetSchKorespond['ID_SCH'];
                if T.DataSetSchKorespond['FLAG_DEFAULT'] = 1 then
                begin
                    i := T.DataSetSchKorespond.RecNo - 1;
                    T.id_sch        := T.DataSetSchKorespond['ID_SCH'];
                    T.name_sch      := T.DataSetSchKorespond['SCH_NUM'];
                    T.cxLabel2.Text := T.DataSetSchKorespond['SCH_TITLE'];
                end;
                T.cxComboBoxSch.Properties.Items.Insert(T.DataSetSchKorespond.RecNo - 1, T.DataSetSchKorespond['SCH_NUM']);
                T.DataSetSchKorespond.Next;
            end;
            T.cxComboBoxSch.ItemIndex := i;
        end
        else
        begin
            ShowMessage(Un_R_file_Alex.KASSA_ERROR_SCH);
            T.cxButtonClose.Click;
            result := false;
            exit
        end;
        T.SelectAll(1, -1, -1, -1, -1, -1, 11, 1);
        T.Visible := true;
        T.cxTextEditSumma.SetFocus;
        T.Visible := false;
    end;

    if m = ChangeProv then
    begin
        T.DataSetDoc.Close;
        T.DataSetDoc.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SP_J0_SCH WHERE ID_SCH='+iNTtOsTR(T.id_kor_sch)+'';
        T.DataSetDoc.Open;
        T.DataSetDoc.FetchAll;
        if (T.DataSetDoc.RecordCount >= 1) then
        begin
            T.cxMRUEdit1.Visible := true;
            if T.id_man > 0 then
            begin
                T.DataSetDoc.Close;
                T.DataSetDoc.SQLs.SelectSQL.Text := 'Select * from PUB_GET_MAN_INFO('+IntToStr(T.id_man)+', ''' + DateToStr(date) + ''')';
                T.DataSetDoc.Open;

                T.cxMRUEdit1.Text    := T.DataSetDoc.FieldByName('UKR_FAMILIA').Asstring + ' ' + T.DataSetDoc.FieldByName('UKR_IMYA').Asstring + ' ' + T.DataSetDoc.FieldByName('UKR_OTCHESTVO').Asstring;
                T.cxLabel17.Caption  := T.DataSetDoc.FieldByName('TIN').Asstring;
                T.cxLabel19.Caption  := T.DataSetDoc.FieldByName('BIRTH_DATE').Asstring;
                T.DataSetDoc.Close;
            end;
        end;
        if id_pr > 0 then {если встречная}
        begin
            T.EnableVstrechProv(true);
            T.DataSetDoc.Close;
            T.DataSetDoc.SQLs.SelectSQL.Text := 'Select * from KASSA_SELECT_ALL_DOC_PO_ID_PROV('+IntToStr(id_pr)+', ' + IntToStr(T.mm.prih) + ')';
            T.DataSetDoc.Open;
            if T.DataSetDoc['NUM_DOC'] <> null
                then T.cxTextEditNumber.Text := T.DataSetDoc['NUM_DOC'];
            if T.DataSetDoc['DATE_DOC'] <> null
                then T.cxDateEditDateDoc.Date := T.DataSetDoc['DATE_DOC'];
            if T.DataSetDoc['TYPE_DOC'] <> null
                then T.cxTextEditTypeDoc.Text := T.DataSetDoc['TYPE_DOC'];
            if T.DataSetDoc['SUMMA'] <> null
                then T.cxTextEditFio.Text := T.DataSetDoc['SUMMA'];
            if T.DataSetDoc['NOTE'] <> null
                then T.cxTextEditNote.Text := T.DataSetDoc['NOTE'];
        end;
        if not T.DataSetSchKorespond.IsEmpty then
        begin
            T.DataSetSchKorespond.FetchAll;
            SetLength(T.Ind, T.DataSetSchKorespond.RecordCount);
            T.DataSetSchKorespond.First;
            T.cxComboBoxSch.Properties.Items.Clear;
            i := 0;
            while not T.DataSetSchKorespond.Eof do
            begin
                T.Ind[T.DataSetSchKorespond.RecNo - 1] := T.DataSetSchKorespond['ID_SCH'];
                if T.DataSetSchKorespond['ID_SCH'] = T.id_sch then
                begin
                    i := T.DataSetSchKorespond.RecNo - 1;
                end;
                T.cxComboBoxSch.Properties.Items.Insert(T.DataSetSchKorespond.RecNo - 1, T.DataSetSchKorespond['SCH_NUM']);
                T.DataSetSchKorespond.Next;
            end;
            T.cxComboBoxSch.ItemIndex := i;
        end
        else
        begin
            ShowMessage(Un_R_file_Alex.KASSA_ERROR_SCH);
            T.cxButtonClose.Click;
            result := false;
            exit
        end;
    end;

    if n.flag = ShowOrder then
    begin
        T.ActionAdd.Enabled       := false;
        T.cxButton1.Enabled       := false;
        T.cxMRUEditSch.Enabled    := false;
        T.cxComboBoxSch.Enabled   := false;
        T.cxMRUEditSm.Enabled     := false;
        T.cxMRUEditRazd.Enabled   := false;
        T.cxMRUEditSt.Enabled     := false;
        T.cxMRUEditKekv.Enabled   := false;
        T.cxTextEditSumma.Enabled := false;
        T.cxCheckBox1.Enabled     := false;
    end;

    T.flag := m;
    T.LoadCaptions;
    T.flag_na_dog := true;
    pr := 1;
    T.cxTextEditSumma.Text := AddNol(T.cxTextEditSumma.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
    end;

    if T.ShowModal=mrOk then
    begin
        id_sm   := T.id_smeta;
        id_st   := T.id_stat;
        id_razd := T.id_r;
        id_kekv := T.id_k;
        id_korespond_sch := T.id_kor_sch;
        name_kor_sch     := T.cxMRUEditSch.Text;
        id_sc   := T.id_sch;
        id_m    := T.id_man;
        sum     := StrToFloat(T.cxTextEditSumma.Text);
        name_fio   := T.Label1.Caption;
        name_smeta := T.cxMRUEditSm.Text;
        name_r     := T.cxMRUEditRazd.text;
        name_stat  := T.cxMRUEditSt.Text;
        name_k     := T.cxMRUEditKekv.Text;
        name_sch   := T.cxComboBoxSch.Text;
        title_sm   := T.cxLabel1.Text;
        title_rz   := T.Label3.Text;
        title_st   := T.Label4.Text;
        title_kekv := T.cxLabel8.Text;
        title_sch  := T.cxLabel2.text;
        title_kor_sch := T.cxLabel7.Text;

        if T.cxCheckBox1.Checked then
        begin
            id_dog     := T.id_dog_add;
            kod_dog    := T.kod_dog_add;
            date_d     := T.date_dog;
            num_d      := T.num_dog;
            name_c     := T.name_cust;
            reg_dog    := T.r_dog;
            type_dog   := T.t_dog;
        end else
        begin
            id_dog     := 0;
            kod_dog    := 0;
            date_d     := '';
            num_d      := '';
            name_c     := '';
            reg_dog    := '';
            type_dog   := '';
        end;

        id_ras      := T.id_ra;
        id_ras_cust := T.id_r_c;
        id_cust     := T.id_c;
        Result      := true;
    end
    else
        Result  := false;
    T.Free
end;

procedure TfmAddChangeProv.cxMRUEditKekvPropertiesButtonClick(
  Sender: TObject);
//var
//    res : variant;
begin
{    res := GlobalSPR.GetKEKVSpr(self, Class_Database.Handle, fsNormal, Date, 1);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][0]<>null) and (res[0][1]<>null) then
        begin
            id_k := res[0][0];
            cxMRUEditKekv.Text := res[0][2];
            cxLabel8.Caption   := res[0][1];
        end;
    end;}
    SelectAll(0, id_kor_sch, id_smeta, id_r, id_stat, -1, 11, 0);
end;


procedure TfmAddChangeProv.LoadCaptions;
begin
    cxlabelfio.Caption := Un_R_file_Alex.KASSA_DOC_FIO;
    cxLabel4.Caption   := Un_R_file_Alex.KASSA_SMETA;
    cxLabel10.Caption  := Un_R_file_Alex.KASSA_RAZD;
    cxLabel11.Caption  := Un_R_file_Alex.KASSA_STAT;
    cxLabel6.Caption   := Un_R_file_Alex.KASSA_ADD_PROVODKA_SUMMA_PROV;
    cxLabel5.Caption   := Un_R_file_Alex.KASSA_KEKV;
    cxLabel3.Caption   := Un_R_file_Alex.KASSA_SCH_KASSA;
    cxButton1.Caption  := 'F10 - ' + Un_R_file_Alex.MY_BUTTON_ADD;
    cxButtonClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;
    cxLabelSch.Caption := Un_R_file_Alex.KASSA_SCH_KORESPOND;

    cxLabel16.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_TIN;
    cxLabel18.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_BIRTHDAY;

    GroupBox1.Caption  := Un_R_file_Alex.KASSA_INFO_VSTRECH;
    cxCheckBox1.Properties.Caption := Un_R_file_Alex.BANK_DOGOVOR;
    cxLabel12.Caption  := Un_R_file_Alex.BANK_NUM_DOCUMENT;
    cxLabel13.Caption  := Un_R_file_Alex.BANK_SUMMA_DOC;
    cxLabel14.Caption  := Un_R_file_Alex.J4_MAIN_ADD_TYPE_DOC;
    cxLabel15.Caption  := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;
    cxLabel20.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;

//    cxLabel12.Caption := Un_R_file_Alex.BANK_DOG_NUM;
//    cxLabel14.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    if flag = AddProv then
    begin
        caption := Un_R_file_Alex.KASSA_ADD_PROV;
    end;
    if flag = ChangeProv then
    begin
        caption := Un_R_file_Alex.KASSA_CHANGE_PROV;
    end;
end;

procedure TfmAddChangeProv.ActionAddExecute(Sender: TObject);
var
    id_session : int64;
    mes : string;
    pr : integer;
begin
     if StrToFloat(cxTextEditSumma.Text) = 0 then
     begin
         ShowMessage(Un_R_file_Alex.KASSA_ORDER_ADD_PROV_SUMMA_ERROR);
         exit;
     end;
     if (mm.buh_prov = 1) and (id_kor_sch <= 0) then
     begin
         ShowMessage(Un_R_file_Alex.KASSA_ERROR_ADD_PROV_KOR_SCH);
         exit;
     end;
     pr := 1;
     cxTextEditSumma.Text := AddNol(cxTextEditSumma.Text, pr);
     if pr = -1 then
     begin
         ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
         exit;
     end;
     Class_StoredProc.Database    := Class_Database;
     Class_StoredProc.Transaction := Class_Transaction_Wr;
     DataSetError.Database        := Class_Database;
     DataSetError.Transaction     := Class_Transaction_Wr;
     Class_Transaction_Wr.StartTransaction;
     id_session := mm.Class_Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

     Class_StoredProc.StoredProcName:='KASSA_DOC_ALL_PROV_INSERT';
     Class_StoredProc.Prepare;
     Class_StoredProc.ParamByName('D_ID_DT_DOC').AsInt64    := 0;
     Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session;
     Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := 0;
     Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := id_smeta;
     Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := id_r;
     Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := id_stat;
     Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := id_k;
     Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := 0;
     Class_StoredProc.ParamByName('D_ID_MAN').AsInt64       := 0;
     Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := ID_KOR_sch;//  RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
//     Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := 0;
//     Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := 0;
     Class_StoredProc.ParamByName('D_KOD_DOG').AsInteger    := 0;
     Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := 0;
     Class_StoredProc.ParamByName('D_ID_ALL_DOC').AsInt64   := 0;
     Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := id_sch; //RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
     Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := 1;
     Class_StoredProc.ExecProc;

     Class_StoredProc.StoredProcName:='PUBLIC_CHECK_PROV';
     Class_StoredProc.Prepare;
     Class_StoredProc.ParamByName('ID_PROV').AsInt64     := 1;
     Class_StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
     Class_StoredProc.ParamByName('DATE_PROV').AsDate    := mm.cxDateEdit2.Date;
     Class_StoredProc.ExecProc;

     DataSetError.Close;
     DataSetError.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_DT_ALL_PROV_BUFFER WHERE KEY_SESSION='+iNTtOsTR(id_session)+'';
     DataSetError.SQLs.SelectSQL.Add('AND ID_PROV=1');
     DataSetError.Open;
     if DataSetError['EXIST_ERROR']=1 then
     begin
        DataSetError.Close;
        DataSetError.SelectSQL.Text :=' SELECT * FROM KERNEL_PROVS_ERRORS WHERE ID_PROV='+IntToStr(1)+'';
        DataSetError.SelectSQL.Add('AND KEY_SESSION='+IntToStr(id_session)+'');
        DataSetError.Open;
        DataSetError.First;
        mes := '';
        while not DataSetError.Eof do
        begin
            mes  := mes + DataSetError['ID_ERROR']+'   ';
            mes  := mes + DataSetError['ERROR_MESSAGE']+#13;
            DataSetError.Next;
        end;
        DataSetError.Close;
        DataSetError.SelectSQL.Text :=' DELETE FROM PUB_DT_ALL_PROV_BUFFER WHERE KEY_SESSION='+iNTtOsTR(id_session)+'';
        DataSetError.Open;
        DataSetError.Close;
        Class_Transaction_Wr.Commit;
        Showmessage(mes);
        exit;
     end;
     DataSetError.Close;
     DataSetError.SelectSQL.Text :=' DELETE FROM PUB_DT_ALL_PROV_BUFFER WHERE KEY_SESSION='+iNTtOsTR(id_session)+'';
     DataSetError.Open;
     DataSetError.Close;

{     DataSetError.SelectSQL.Text :='SELECT * FROM J4_SP_J0_SCH WHERE ID_SCH='+iNTtOsTR(id_kor_sch)+'';
     DataSetError.Open;
     DataSetError.FetchAll;
     if (DataSetError.RecordCount >= 1) and ((id_dog_add <= 0) or (kod_dog_add <= 0) or (not cxCheckBox1.Checked)) then
     begin
         Showmessage(Un_R_file_Alex.ERROR_SCH_DOG);
         exit;
     end;
     DataSetError.Close;
 }
     Class_Transaction_Wr.Commit;

     ModalResult := mrOK
end;

procedure TfmAddChangeProv.ActioncloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAddChangeProv.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
//    if cxTextEditSumma.Text = '0,00' then cxTextEditSumma.Text := '';
    if Ord(Key) = VK_TAB then exit;
    if Ord(Key) <> VK_TAB then
    begin
        cxTextEditSumma.ClearSelection;
    end;
 
    if Key = '.' then Key := DecimalSeparator;

    if (Key = '-') and (Length(cxTextEditSumma.Text)>0)
    then Key := Chr(0);

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
        and (Key <> '-')
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditSumma.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSumma.Text) - Pos(DecimalSeparator, cxTextEditSumma.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSumma.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;

procedure TfmAddChangeProv.cxMRUEditFioPropertiesButtonClick(
  Sender: TObject);
//var
//    res : Variant;
begin
{    res := Un_lo_file_Alex.MY_GetManEx(self, Class_Database.Handle);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            if id_man <> res[0] then
            begin
                id_man := res[0];
                cxMRUEditFio.Text := res[1];
            end;
        end;
    end;}
    SelectDogovor(StrToFloat(cxTextEditSumma.Text));
end;

procedure TfmAddChangeProv.cxMRUEditRazdPropertiesButtonClick(
  Sender: TObject);
begin
   SelectAll(0, id_kor_sch, id_smeta, -1, id_stat, id_k, 11, 0);
end;

procedure TfmAddChangeProv.cxMRUEditStPropertiesButtonClick(
  Sender: TObject);
begin
    SelectAll(0, id_kor_sch, id_smeta, id_r, -1, id_k, 11, 0);
end;

procedure TfmAddChangeProv.cxComboBoxSchFocusChanged(Sender: TObject);
VAR
    I : INTEGER;
begin
        i := cxComboBoxSch.ItemIndex;
        if id_sch <> Ind[i] then
        begin
            id_sch := Ind[i];
            name_sch := cxComboBoxSch.Text;
        end;
end;

procedure TfmAddChangeProv.cxCheckBox1Click(Sender: TObject);
begin
    IF cxCheckBox1.Checked then
    begin
        cxMemoDog.Visible    := true;
        SpeedButton1.Visible := true;
        if flag_na_dog then
            SpeedButton1Click(Sender);
{        cxLabel12.Visible    := true;
        cxLabel13.Visible    := true;
        cxLabel14.Visible    := true;
        cxLabel15.Visible    := true;
}    end else
    begin
        cxMemoDog.Visible    := false;
        SpeedButton1.Visible := false;
{        cxMemoDog.Visible := false;
        cxLabel12.Visible    := false;
        cxLabel13.Visible    := false;
        cxLabel14.Visible    := false;
        cxLabel15.Visible    := false;
 }   end;
end;


function TfmAddChangeProv.SelectDogovor(all_summa : double) : boolean;
var
//    summa_dog : double;
    inputDog : TDogInput;
    res   : TDogResult;
//    {i,} j : integer;
//    flag_na_exists_dog, flag_na_exists_sm : boolean;
//    TT : TD;
begin
  //  summa_dog := all_summa;
  //  if Show_Summa_Kassa(summa_dog, '') then
    begin
        SelectDogovor := true;
        LoadSysData(Class_Transaction_R);
        inputDog             := SYS_DEFAULT_DOG_INPUT;
        inputDog.Owner       := self;
        inputDog.DBHandle    := Class_Database.Handle;
        inputDog.WriteTrans  := Class_Transaction_Wr.Handle;
        inputDog.ReadTrans   := Class_Transaction_R.Handle;
//        DecimalSeparator     := ',';
        inputDog.Summa       := 1;
        inputDog.FormStyle   := fsNormal;
        inputDog.id_Group    := 1399;
        inputDog.id_group_add := 2599;
        inputDog.filter.bShowFilterForm := true;
        inputDog.filter.DateBeg                  := IncDay(mm.cxDateEdit2.Date, -730);
        inputDog.filter.DateEnd                  := mm.cxDateEdit2.Date;
        inputDog.filter.bUseFilter               := true;
        inputDog.filter.bDate                    := true;
        SYS_CURRENT_DATE  := mm.cxDateEdit2.Date;

        SYS_ID_USER          := mm.myform.id_user;
        inputDog.isZayav     := false;
        inputDog.arndGetPay  := 1;
        inputDog.shablon_data.bUse     := true;
        inputDog.shablon_data.num      := 'б\н';
        inputDog.shablon_data.date_dog := mm.cxDateEdit2.Date;
        inputDog.shablon_data.note     := '';
        inputDog.shablon_data.summa    := 1;
        inputDog.shablon_data.id_rate_account    := 0;
        inputDog.shablon_data.id_rate_acc_native := 0;
//        inputDog.id_doc      := mm.id_all_doc;

        res                  := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
            DataSetDoc.Close;
            DataSetDoc.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
            DataSetDoc.Open;

            if (DataSetDoc.FieldByName('FLAG_NEW_ALGORITHM').AsInteger = 1) and (DataSetDoc.FieldByName('DATE_NEW_ALGORITHM').AsDateTime <= mm.cxDateEdit2.Date) then
            begin
                DataSetDoc.Close;
                DataSetDoc.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SP_J0_SCH WHERE ID_SCH='+iNTtOsTR(id_kor_sch)+'';
                DataSetDoc.Open;
                DataSetDoc.FetchAll;
                if (DataSetDoc.RecordCount >= 1) then
                begin
                        flag_na_dog := false;
                        cxCheckBox1.Checked := true;
//                        i := length(res.Smets);
                        id_dog_add  := res.id_dog;
                        kod_dog_add := res.kod_dog;
                        name_cust   := VarToStr(res.name_customer);
                        date_dog    := VarToStr(res.d_dog);
                        num_dog     := VarToStr(res.n_dog);
                        r_dog       := VarToStr(res.regest_num);
                        t_dog       := VarToStr(res.name_tip_dog);
                        cxMemoDog.Text := Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + VarToStr(res.name_tip_dog)+'; №  '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
                        if res.sum_today{id_customer} > 0 then
                        begin
                            id_man := res.sum_today{res.id_customer};
                            DataSetDoc.Close;
                            DataSetDoc.SQLs.SelectSQL.Text := 'Select * from PUB_GET_MAN_INFO('+IntToStr(id_man)+', ''' + DateToStr(date) + ''')';
                            DataSetDoc.Open;
                            cxMRUEdit1.Visible := true;
                            cxMRUEdit1.Text    := DataSetDoc.FieldByName('UKR_FAMILIA').Asstring + ' ' + DataSetDoc.FieldByName('UKR_IMYA').Asstring + ' ' + DataSetDoc.FieldByName('UKR_OTCHESTVO').Asstring;
                            cxLabel17.Caption  := DataSetDoc.FieldByName('TIN').Asstring;
                            cxLabel19.Caption  := DataSetDoc.FieldByName('BIRTH_DATE').Asstring;
                            DataSetDoc.Close;
                        end else
                        begin
                            cxMRUEdit1PropertiesButtonClick(Self);
                        end;
                 end else
                 begin
//                    i := length(res.Smets);
                    id_dog_add  := res.id_dog;
                    kod_dog_add := res.kod_dog;
                    name_cust   := VarToStr(res.name_customer);
                    date_dog    := VarToStr(res.d_dog);
                    num_dog     := VarToStr(res.n_dog);
                    r_dog       := VarToStr(res.regest_num);
                    t_dog       := VarToStr(res.name_tip_dog);
                    mm.id_rate  := res.id_rate_acc;
                    mm.id_rate_n   := res.id_rate_acc_nat;
                    mm.id_customer := res.id_customer;
                    id_ra       := res.id_rate_acc_nat;
                    id_r_c      := res.id_rate_acc;
                    id_c        := res.id_customer;

                    cxMemoDog.Text := Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + VarToStr(res.name_tip_dog)+'; №  '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
                    if res.sum_today{id_customer} > 0 then
                    begin
                        id_man := res.sum_today{res.id_customer};
                        DataSetDoc.Close;
                        DataSetDoc.SQLs.SelectSQL.Text := 'Select * from PUB_GET_MAN_INFO('+IntToStr(id_man)+', ''' + DateToStr(date) + ''')';
                        DataSetDoc.Open;
                        cxMRUEdit1.Visible := true;
                        cxMRUEdit1.Text    := DataSetDoc.FieldByName('UKR_FAMILIA').Asstring + ' ' + DataSetDoc.FieldByName('UKR_IMYA').Asstring + ' ' + DataSetDoc.FieldByName('UKR_OTCHESTVO').Asstring;
                        cxLabel17.Caption  := DataSetDoc.FieldByName('TIN').Asstring;
                        cxLabel19.Caption  := DataSetDoc.FieldByName('BIRTH_DATE').Asstring;
                        DataSetDoc.Close;
                    end;
                 end;
            end else
            begin
//              i := length(res.Smets);
              id_dog_add  := res.id_dog;
              kod_dog_add := res.kod_dog;
              name_cust   := VarToStr(res.name_customer);
              date_dog    := VarToStr(res.d_dog);
              num_dog     := VarToStr(res.n_dog);
              r_dog       := VarToStr(res.regest_num);
              t_dog       := VarToStr(res.name_tip_dog);
              mm.id_rate  := res.id_rate_acc;
              mm.id_rate_n   := res.id_rate_acc_nat;
              mm.id_customer := res.id_customer;
              id_ra       := res.id_rate_acc_nat;
              id_r_c      := res.id_rate_acc;
              id_c        := res.id_customer;

              cxMemoDog.Text := Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + VarToStr(res.name_tip_dog)+'; №  '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
              if res.sum_today{id_customer} > 0 then
              begin
                  id_man := res.sum_today{res.id_customer};
                  DataSetDoc.Close;
                  DataSetDoc.SQLs.SelectSQL.Text := 'Select * from PUB_GET_MAN_INFO('+IntToStr(id_man)+', ''' + DateToStr(date) + ''')';
                  DataSetDoc.Open;
                  cxMRUEdit1.Visible := true;
                  cxMRUEdit1.Text    := DataSetDoc.FieldByName('UKR_FAMILIA').Asstring + ' ' + DataSetDoc.FieldByName('UKR_IMYA').Asstring + ' ' + DataSetDoc.FieldByName('UKR_OTCHESTVO').Asstring;
                  cxLabel17.Caption  := DataSetDoc.FieldByName('TIN').Asstring;
                  cxLabel19.Caption  := DataSetDoc.FieldByName('BIRTH_DATE').Asstring;
                  DataSetDoc.Close;
              end;
            end;
            DataSetDoc.Close;
         end else
         begin
             cxCheckBox1.Checked  := false;
             cxMemoDog.Visible    := false;
             SpeedButton1.Visible := false;
             SelectDogovor        := false;
         end;
    end; {else
    begin
        SelectDogovor := false;
    end;}
    DecimalSeparator     := ',';
end;

procedure TfmAddChangeProv.SelectAll(a: integer; sch_k, sm, rz, st, kv : int64; mode_ : integer; add : integer);
var
//    ostatok, kod : string;
    id_sss   : int64;
    k, i     : integer;
    inputDog : TDogInput;
    res      : TDogResult;
    STRU     : WIZARD_GET_PROV_INFO;
begin
    if a = 1 then
    begin
        id_sss := 0;
        if length(Ind) = 1
        then id_sss := id_sch;
        if length(Ind) > 1 then
            if not ShowSelectSch_Kassa(self, id_sss) then
            begin
                exit;
            end;
        k := length(Ind);
        for i:=0 to k-1 do
        if id_sss = Ind[i] then
        begin
            cxComboBoxSch.ItemIndex := i;
        end;
    end else
    begin
        id_sss := id_sch;
    end;

        STRU.AOWNER         := self;
        STRU.DBHANDLE       := Class_Database.Handle;
        STRU.MODE           := mode_;//1
        STRU.CR_BY_DT       := mm.prih;
        STRU.SCH_SET_FLAG   := mm.prih;
        STRU.NOT_DIF_BDG_FG := false;
        if mode_ = 1 then
        begin
            if mm.prih = 1 then
            begin
                STRU.ID_SCH_IN      := id_sss;
                stru.DB_ID_SMETA    := sm;
                stru.DB_ID_RAZD     := rz;
                stru.DB_ID_STAT     := st;
                stru.DB_ID_KEKV     := kv;
                stru.KR_ID_SCH      := sch_k;
            end else
            begin
                STRU.ID_SCH_IN      := id_sss;
                stru.KR_ID_SMETA    := sm;
                stru.KR_ID_RAZD     := rz;
                stru.KR_ID_STAT     := st;
                stru.KR_ID_KEKV     := kv;
                stru.DB_ID_SCH      := sch_k;
            end;
        end;
        if mode_ = 11 then
        begin
            if mm.prih = 1 then
            begin
                STRU.DB_ID_SCH      := id_sss;
                stru.DB_ID_SMETA    := sm;
                stru.DB_ID_RAZD     := rz;
                stru.DB_ID_STAT     := st;
                stru.DB_ID_KEKV     := kv;
                stru.KR_ID_SCH      := sch_k;
                stru.KR_ID_SMETA    := sm;
                stru.KR_ID_RAZD     := rz;
                stru.KR_ID_STAT     := st;
                stru.KR_ID_KEKV     := kv;
                if st=-1 then stru.DB_KOD_STAT    := -1;
            end else
            begin
                STRU.KR_ID_SCH      := id_sss;
                stru.KR_ID_SMETA    := sm;
                stru.KR_ID_RAZD     := rz;
                stru.KR_ID_STAT     := st;
                stru.KR_ID_KEKV     := kv;
                stru.DB_ID_SCH      := sch_k;
                stru.DB_ID_SMETA    := sm;
                stru.DB_ID_RAZD     := rz;
                stru.DB_ID_STAT     := st;
                stru.DB_ID_KEKV     := kv;
                if st=-1 then stru.KR_KOD_STAT    := -1;
            end;
        end;

        if MonthOf(mm.cxDateEdit2.date) < 10
            then STRU.ACTUAL_DATE := StrToDate('15.'+'0'+ IntToStr(MonthOf(mm.cxDateEdit2.Date)) + '.'+ IntToStr(YearOf(mm.cxDateEdit2.date)))
            else STRU.ACTUAL_DATE := StrToDate('15.'+ IntToStr(MonthOf(mm.cxDateEdit2.date)) + '.' + IntToStr(YearOf(mm.cxDateEdit2.date)));

//        STRU.ACTUAL_DATE    := mm.cxDateEdit2.date;
        STRU.WIZARD_FORM_SH := false;//true;
        STRU.INFO_PANEL_SH  := true;
        STRU.NOT_DIF_BDG_FG := true;
        STRU.ID_LANGUAGE    := 1;
        if Kernel.WizardGetProvInfo(@STRU) then
        begin
{            ostatok := copy(stru.DB_TITLE_SMETA, 3, length(stru.DB_TITLE_SMETA)-2);
            kod := '';
            while copy(ostatok, 1, 1) <> ' ' do
            begin
                kod := kod + copy(ostatok, 1, 1);
                ostatok := copy(ostatok, 2, length(ostatok)-1);
            end;
}            cxMRUEditSm.text := IntToStr(Stru.DB_KOD_SMETA);
            cxLabel1.Text     := Stru.db_title_smeta{copy(ostatok, 3, length(ostatok)-3)};

{            ostatok := copy(stru.DB_TITLE_RAZD, 3, length(stru.DB_TITLE_RAZD)-2);
            kod := '';
            while copy(ostatok, 1, 1) <> ' ' do
            begin
                kod := kod + copy(ostatok, 1, 1);
                ostatok := copy(ostatok, 2, length(ostatok)-1);
            end;
}            cxMRUEditRazd.text := IntToStr(Stru.DB_KOD_RAZD);
            Label3.Text         := Stru.Db_title_razd{  copy(ostatok, 3, length(ostatok)-3)};

{            ostatok := copy(stru.DB_TITLE_STAT, 3, length(stru.DB_TITLE_STAT)-2);
            kod := '';
            while copy(ostatok, 1, 1) <> ' ' do
            begin
                kod := kod + copy(ostatok, 1, 1);
                ostatok := copy(ostatok, 2, length(ostatok)-1);
            end;
}            cxMRUEditSt.text := IntToStr(Stru.DB_KOD_STAT);
            Label4.Text       := Stru.Db_TITLE_STAT; //copy(ostatok, 3, length(ostatok)-3);

{            ostatok := copy(stru.DB_KEKV_TITLE, 3, length(stru.DB_KEKV_TITLE)-2);
            kod := '';
            while copy(ostatok, 1, 1) <> ' ' do
            begin
                kod := kod + copy(ostatok, 1, 1);
                ostatok := copy(ostatok, 2, length(ostatok)-1);
            end;
}            cxMRUEditKekv.text := IntToStr(Stru.DB_KOD_KEKV);
             cxLabel8.Text      := Stru.DB_KEKV_TITLE;//copy(ostatok, 3, length(ostatok)-3);

            cxMRUEditSch.Text    := stru.DB_ID_SCH_KOD;
            name_kor_sch         := stru.DB_ID_SCH_KOD;
            cxLabel7.Text        := stru.DB_ID_SCH_TIT;

            if MM.prih = 1 then
            begin
                id_kor_sch           := stru.KR_ID_SCH;
                cxMRUEditSch.Text    := stru.KR_ID_SCH_KOD;
                name_kor_sch         := stru.KR_ID_SCH_KOD;
                cxLabel7.Text        := stru.KR_ID_SCH_TIT;
            end else
            begin
                id_kor_sch           := stru.DB_ID_SCH;
                cxMRUEditSch.Text    := stru.DB_ID_SCH_KOD;
                name_kor_sch         := stru.DB_ID_SCH_KOD;
                cxLabel7.Text        := stru.DB_ID_SCH_TIT;
            end;
            id_smeta             := stru.DB_ID_SMETA;
            id_r                 := stru.DB_ID_RAZD;
            id_stat              := stru.DB_ID_STAT;
            id_k                 := stru.DB_ID_KEKV;

            DataSetDoc.Close;
            DataSetDoc.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
            DataSetDoc.Open;

            if (DataSetDoc.FieldByName('FLAG_NEW_ALGORITHM').AsInteger = 1) and (DataSetDoc.FieldByName('DATE_NEW_ALGORITHM').AsDateTime <= mm.cxDateEdit2.Date) then
            begin
                DataSetDoc.Close;
                DataSetDoc.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SP_J0_SCH WHERE ID_SCH='+iNTtOsTR(id_kor_sch)+'';
                DataSetDoc.Open;
                DataSetDoc.FetchAll;
                if (DataSetDoc.RecordCount >= 1) then
                begin
                    DecimalSeparator     := ',';
                    cxMRUEdit1.Visible := true;
                    Class_Transaction_Wr.DefaultDatabase := Class_Database;
//                    Class_Transaction_Wr.StartTransaction;
                          LoadSysData(Class_Transaction_R);
                          inputDog.Owner        := self;
                          inputDog.DBHandle     := Class_Database.Handle;
                          inputDog.WriteTrans   := Class_Transaction_Wr.Handle;
                          inputDog.ReadTrans    := Class_Transaction_R.Handle;
                          inputDog.FormStyle    := fsNormal;
                          inputDog.Summa        := 1;
                          inputDog.id_Group     := 61499;
                          inputDog.id_Group_add := 61599;
                          SYS_CURRENT_DATE  := StrToDate(mm.cxDateEdit2.Text);


{                    LoadSysData(Class_Transaction_R);
                    inputDog             := SYS_DEFAULT_DOG_INPUT;
                    inputDog.Owner       := self;
                    inputDog.DBHandle    := Class_Database.Handle;
                    inputDog.WriteTrans  := Class_Transaction_Wr.Handle;
                    inputDog.ReadTrans   := Class_Transaction_R.Handle;
                    inputDog.FormStyle   := fsNormal;
                    inputDog.SUmma       := 1;
                    inputDog.id_Group    := 61499;
                    inputDog.id_group_add := 61599;
                    inputDog.filter.bShowFilterForm := true;
                    inputDog.isZayav     := false;
                    inputDog.arndGetPay  := 1;
                    inputDog.shablon_data.bUse := true;
                    inputDog.shablon_data.num  := 'б\н';
                    inputDog.shablon_data.date_dog           := mm.cxDateEdit2.Date;
                    inputDog.filter.DateBeg                  := IncDay(mm.cxDateEdit2.Date, -730);
                    inputDog.filter.DateEnd                  := mm.cxDateEdit2.Date;
                    inputDog.filter.bUseFilter               := true;
                    inputDog.filter.bDate                    := true;
                    inputDog.shablon_data.note               := '';
                    inputDog.shablon_data.summa              := 1;
                    inputDog.shablon_data.id_rate_account    := 0;
                    inputDog.shablon_data.id_rate_acc_native := 0;}
                    SYS_ID_USER          := mm.myform.id_user;
//                    showmessage(IntToStr(mm.myform.id_user));
                    res := ShowDogMain(inputDog);
                    if res.ModalResult = 1 then
                    begin
                        flag_na_dog := false;
                        cxCheckBox1.Checked := true;
//                        i := length(res.Smets);
                        id_dog_add  := res.id_dog;
                        kod_dog_add := res.kod_dog;
                        name_cust   := VarToStr(res.name_customer);
                        date_dog    := VarToStr(res.d_dog);
                        num_dog     := VarToStr(res.n_dog);
                        r_dog       := VarToStr(res.regest_num);
                        t_dog       := VarToStr(res.name_tip_dog);
                        cxMemoDog.Text := Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + VarToStr(res.name_tip_dog)+'; №  '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
                        if res.sum_today{id_customer} > 0 then
                        begin
                            id_man := res.sum_today{res.id_customer};
                            DataSetDoc.Close;
                            DataSetDoc.SQLs.SelectSQL.Text := 'Select * from PUB_GET_MAN_INFO('+IntToStr(id_man)+', ''' + DateToStr(date) + ''')';
                            DataSetDoc.Open;
                            cxMRUEdit1.Visible := true;
                            cxMRUEdit1.Text    := DataSetDoc.FieldByName('UKR_FAMILIA').Asstring + ' ' + DataSetDoc.FieldByName('UKR_IMYA').Asstring + ' ' + DataSetDoc.FieldByName('UKR_OTCHESTVO').Asstring;
                            cxLabel17.Caption  := DataSetDoc.FieldByName('TIN').Asstring;
                            cxLabel19.Caption  := DataSetDoc.FieldByName('BIRTH_DATE').Asstring;
                            DataSetDoc.Close;
                        end else
                        begin
                            cxMRUEdit1PropertiesButtonClick(Self);
                        end;
                    end;
                end;
            end;

            if stru.FACED_FLAG then {если встречная}
            begin
                EnableVstrechProv(true);
                id_prov := stru.FACED_ID_PROV;
                id_doc  := stru.FACED_ID_DOC;
                DataSetDoc.Close;
                DataSetDoc.SQLs.SelectSQL.Text := 'Select * from KASSA_SELECT_ALL_DOC_PO_ID('+IntToStr(id_doc)+')';
                DataSetDoc.Open;
                if DataSetDoc['NUM_DOC'] <> null
                    then cxTextEditNumber.Text := DataSetDoc['NUM_DOC'];
                if DataSetDoc['DATE_DOC'] <> null
                    then cxDateEditDateDoc.Date := DataSetDoc['DATE_DOC'];
                if DataSetDoc['TYPE_DOC'] <> null
                    then cxTextEditTypeDoc.Text := DataSetDoc['TYPE_DOC'];
                if DataSetDoc['SUMMA'] <> null
                    then cxTextEditFio.Text := DataSetDoc['SUMMA'];
                if DataSetDoc['NOTE'] <> null
                    then cxTextEditNote.Text := DataSetDoc['NOTE'];
            end
        end;
    cxTextEditSumma.TabOrder := 0;
    cxCheckBox1.TabOrder     := 1;
    cxButton1.TabOrder       := 2;
    cxButtonClose.TabOrder   := 3;
    cxComboBoxSch.TabOrder   := 4;
    cxMRUEditSch.TabOrder    := 5;
    cxMRUEditSm.TabOrder     := 6;
    cxMRUEditRazd.TabOrder   := 7;
    cxMRUEditSt.TabOrder     := 8;
    cxMRUEditKekv.TabOrder   := 9;
end;

procedure TfmAddChangeProv.cxMRUEditSmPropertiesButtonClick(
  Sender: TObject);
begin
    SelectAll(0, id_kor_sch, -1, id_r, id_stat, id_k, 11, 0);
end;

procedure TfmAddChangeProv.SpeedButton1Click(Sender: TObject);
begin
    SelectDogovor(0);
end;

procedure TfmAddChangeProv.cxMRUEditSchPropertiesButtonClick(
  Sender: TObject);
begin
    SelectAll(0, -1, id_smeta, id_r, id_stat, id_k, 11, 0)
end;

procedure TfmAddChangeProv.cxTextEditSummaExit(Sender: TObject);
var
    pr : integer;
begin
    pr := 1;
    cxTextEditSumma.Text := AddNol(cxTextEditSumma.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
    end;
    if cxTextEditSumma.Text = '' then
        cxTextEditSumma.Text := '0,00';
end;

procedure TfmAddChangeProv.EnableVstrechProv(s : boolean);
begin
    if s then
    begin
        cxTextEditNumber.Enabled  := true;
        cxDateEditDateDoc.Enabled := true;
        cxTextEditTypeDoc.Enabled := true;
        cxTextEditFio.Enabled     := true;
        cxTextEditNote.Enabled    := true;
    end else
    begin
        cxTextEditNumber.Enabled  := false;
        cxDateEditDateDoc.Enabled := false;
        cxTextEditTypeDoc.Enabled := false;
        cxTextEditFio.Enabled     := false;
        cxTextEditNote.Enabled    := false;
    end;
end;

procedure TfmAddChangeProv.cxMRUEdit1PropertiesButtonClick(
  Sender: TObject);
var
    res : Variant;
begin
    res := Un_lo_file_Alex.MY_GetManEx(self, Class_Database.Handle, false, false, -1);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            if id_man <> res[0] then
            begin
                id_man := res[0];
                cxLabel17.Caption := res[9];
                cxLabel19.Caption := res[8];
                cxMRUEdit1.Text   := res[1];
            end;
        end;
    end;
end;

procedure TfmAddChangeProv.cxMRUEditSchExit(Sender: TObject);
begin
    sch_str :=  cxMRUEditSch.Text;
    if(sch_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SP_MAIN_SCH m where  m.sch_number=:sch_str and m.date_beg<=:date_beg_str and m.date_end>=:date_beg_str';
        DataSetKeyInput.Prepare;
        DataSetKeyInput.ParamByName('sch_str').AsString     := sch_str;
        DataSetKeyInput.ParamByName('date_beg_str').AsDate  := mm.DateTimePicker1.Date;
        DataSetKeyInput.Open;


        if(DataSetKeyInput['sch_title']<>null)  then
           cxLabel7.Text      :=  DataSetKeyInput['sch_title']
        else
           cxLabel7.Text      := '';
        if(DataSetKeyInput['ID_sch']<>null) then
           id_kor_sch             :=  DataSetKeyInput['ID_sch'];
    end;
end;

procedure TfmAddChangeProv.cxMRUEditSmExit(Sender: TObject);
begin

    sm_str  := cxMRUEditSm.Text;
    if(sm_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_NAME_BUDG_BY_KOD(:NUM_OBJECT,:ACTUAL_DATE, :TYPE_OBJECT)';
        DataSetKeyInput.ParamByName('NUM_OBJECT').AsString     := sm_str;
        DataSetKeyInput.ParamByName('ACTUAL_DATE').AsDate      := mm.DateTimePicker1.Date;
        DataSetKeyInput.ParamByName('TYPE_OBJECT').AsInteger   := 1;
        DataSetKeyInput.Open;


        if(DataSetKeyInput['TITLE_OBJECT']<>null)  then
           cxLabel1.Text    :=  DataSetKeyInput['TITLE_OBJECT']
        else
           cxLabel1.Text      := '';
        if(DataSetKeyInput['ID_OBJECT']<>null) then
           id_smeta         :=  DataSetKeyInput['ID_OBJECT'];
    end;
end;

procedure TfmAddChangeProv.cxMRUEditRazdExit(Sender: TObject);
begin
    raz_str :=  cxMRUEditRazd.Text;
    if(raz_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_NAME_BUDG_BY_KOD(:NUM_OBJECT,:ACTUAL_DATE, :TYPE_OBJECT)';
        DataSetKeyInput.ParamByName('NUM_OBJECT').AsString     := raz_str;
        DataSetKeyInput.ParamByName('ACTUAL_DATE').AsDate      := mm.DateTimePicker1.Date;
        DataSetKeyInput.ParamByName('TYPE_OBJECT').AsInteger   := 2;
        DataSetKeyInput.Open;


        if(DataSetKeyInput['TITLE_OBJECT']<>null)  then
           Label3.Text      :=  DataSetKeyInput['TITLE_OBJECT']
        else
           Label3.Text      := '';
        if(DataSetKeyInput['ID_OBJECT']<>null) then
           id_r             :=  DataSetKeyInput['ID_OBJECT'];
    end;
end;

procedure TfmAddChangeProv.cxMRUEditStExit(Sender: TObject);
begin
    st_str := cxMRUEditSt.Text;
    if(st_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_NAME_ST_BY_KOD(:num_razd,:num_st,:actual_date)';
        DataSetKeyInput.ParamByName('num_razd').AsString     := cxMRUEditRazd.Text;
        DataSetKeyInput.ParamByName('num_st').AsString       := st_str;
        DataSetKeyInput.ParamByName('actual_date').AsDate    := mm.DateTimePicker1.Date;
        DataSetKeyInput.Open;


        if(DataSetKeyInput['TITLE_ST']<>null)  then
           Label4.Text         :=  DataSetKeyInput['TITLE_ST']
        else
           Label4.Text      := '';

        if(DataSetKeyInput['ID_ST']<>null) then
           id_stat             :=  DataSetKeyInput['ID_ST'];
    end;
end;

procedure TfmAddChangeProv.cxMRUEditKekvExit(Sender: TObject);
begin
    kekv_str := cxMRUEditKekv.Text;
    if(kekv_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SPR_KEKV_INFO_EX2(:NUM_KEKV,:ACTUAL_DATE)';
        DataSetKeyInput.ParamByName('NUM_KEKV').AsString     := kekv_str;
        DataSetKeyInput.ParamByName('ACTUAL_DATE').AsDate    := mm.DateTimePicker1.Date;
        DataSetKeyInput.Open;


        if(DataSetKeyInput['KEKV_TITLE']<>null)  then
           cxLabel8.Text      :=  DataSetKeyInput['KEKV_TITLE']
        else
           cxLabel8.Text      := '';
        if(DataSetKeyInput['ID_KEKV']<>null) then
           id_k             :=  DataSetKeyInput['ID_KEKV'];
    end;
end;

end.
