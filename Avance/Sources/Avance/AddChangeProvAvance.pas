unit AddChangeProvAvance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxMRUEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, ActnList, cxLabel, FR_Class, pFIBDatabase,
  DB, FIBDataSet, pFIBDataSet, FIBDatabase, GlobalSPR, AddChangeAvance, Un_R_file_Alex,
  cxCheckBox, AvanceInputSumma, Un_lo_file_Alex, kernel, Buttons, cxMemo,
  cxGraphics, dxStatusBar, cxCalendar, Un_func_file_Alex, cxButtonEdit, Math, mainAvanceOtchet;

type
  TfmModeProv = (AddProvAvance, ChangeProvAvance, DontMainProvAvance);

  TfmAddChangeProv = class(TForm)
    cxMRUEditFio: TcxMRUEdit;
    cxMRUEditKorSch: TcxMRUEdit;
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
    DataSetSch: TpFIBDataSet;
    Class_Database: TpFIBDatabase;
    Class_Transaction_R: TpFIBTransaction;
    cxComboBoxSch: TcxComboBox;
    DataSetSmRazdSt: TpFIBDataSet;
    cxLabel9: TcxLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Class_Transaction_Wr: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    cxMRUEditSm: TcxMRUEdit;
    cxMRUEditRz: TcxMRUEdit;
    cxLabel10: TcxLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxLabel2: TcxTextEdit;
    cxLabel7: TcxTextEdit;
    cxLabel1: TcxTextEdit;
    Label3: TcxTextEdit;
    Label4: TcxTextEdit;
    cxLabel8: TcxTextEdit;
    cxMemoDog: TcxMemo;
    SpeedButton1: TSpeedButton;
    dxStatusBar1: TdxStatusBar;
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
    Label6: TLabel;
    cxLabel11: TcxLabel;
    Image1: TImage;
    ActionShow: TAction;
    cxCheckBox1: TcxCheckBox;
    cxButtonEdit1: TcxButtonEdit;
    DataSetKeyInput: TpFIBDataSet;
    procedure ActionAddExecute(Sender: TObject);
    procedure ActioncloseExecute(Sender: TObject);
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    procedure cxMRUEditFioPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditRazdPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditStPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditKekvPropertiesButtonClick(Sender: TObject);
    procedure cxComboBoxSchFocusChanged(Sender: TObject);
    function SelectDogovor(all_summa : double) : boolean;
    procedure SelectAll(a: integer; k_sch, sm, rz, st, kv : int64; mode_ : integer; add : integer);
    procedure cxMRUEditSmPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditRzPropertiesButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EnableVstrechProv(s : boolean);
    procedure ActionShowExecute(Sender: TObject);
    procedure cxComboBoxSchClick(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxMRUEditKorSchExit(Sender: TObject);
    procedure cxMRUEditSmExit(Sender: TObject);
    procedure cxMRUEditRzExit(Sender: TObject);
    procedure cxMRUEditStExit(Sender: TObject);
    procedure cxMRUEditKekvExit(Sender: TObject);
  private
    Ind : array of Int64;
    Ind1 : array of string;
    id_man, id_smeta, id_stat, id_r, id_k, id_sch, id_kor_sch, id_dog_add, kod_dog_add, id_c, id_dog_gr,id_dog_gr_pr,id_dog_gr_rash : int64;
    {name_fio, name_smeta, name_stat, name_r, name_k,} name_sch, name_kor_sch, r_dog, t_dog, name_cust, date_dog, num_dog : string;
    flag : TfmModeProv;
    PR : SMALLINT;
    mm : TfmAddChangeAvance;
    id_doc, id_prov : int64;
    flag_dog : boolean;
    STRU : WIZARD_GET_PROV_INFO;
    main_prov : integer;
    kod_neosnov_prov : integer;
    sm_str, raz_str, st_str, kekv_str, sch_str : string;
    procedure LoadCaptions;
  public
  id_system : int64;
  date_ao   : Tdate;
  end;

function Show_Provodka(n : TfmAddChangeAvance; PRIHODN : SMALLINT; ID_KAS : INT64; db : TpFIBDatabase; Tr : TpFIBTransaction; m : TfmModeProv; var id_sc, id_m, id_korespond_sch, id_sm, id_st, id_razd, id_kekv, id_cust : int64; var sum : double; var name_fio, name_kor_sch, name_smeta, name_stat, name_r, name_k, name_sch : string; var id_dog, kod_dog : int64; var date_d, num_d, name_c, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, reg_dog, type_dog, tin, birthday : string; var id_pr : int64; is_main : integer; var kod_neos : integer;var  id_dog_group,id_dog_group_pr,id_dog_group_rash : int64):boolean;

implementation
uses AvanceSelectSch, DogLoaderUnit;
{$R *.dfm}

function Show_Provodka(n : TfmAddChangeAvance; PRIHODN : SMALLINT; ID_KAS : INT64; db : TpFIBDatabase; Tr : TpFIBTransaction; m : TfmModeProv; var id_sc, id_m, id_korespond_sch, id_sm, id_st, id_razd, id_kekv, id_cust : int64; var sum : double; var name_fio, name_kor_sch, name_smeta, name_stat, name_r, name_k, name_sch : string; var id_dog, kod_dog : int64; var date_d, num_d, name_c, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, reg_dog, type_dog, tin, birthday : string; var id_pr : int64; is_main : integer; var kod_neos : integer;var  id_dog_group,id_dog_group_pr,id_dog_group_rash : int64):boolean;
var
    T : TfmAddChangeProv;
    i : integer;
    s1, s2, s3 : string;
    res : variant;
begin
    T := TfmAddChangeProv.Create(nil);
    T.Image1.ViSible        := false;
    T.cxCheckBox1.Visible   := false;
    T.cxButtonEdit1.Visible := false;
    T.mm := n;
    T.Class_Database                       := DB;
    T.Class_Transaction_R.DefaultDatabase  := T.Class_Database;
    T.Class_Database.DefaultTransaction    := T.Class_Transaction_R;
//    T.Class_Transaction_R                  := Tr;
    T.Class_Transaction_Wr.DefaultDatabase := T.Class_Database;
    T.pFIBDataSet1.Database                := T.Class_Database;
    T.pFIBDataSet1.Transaction             := T.Class_Transaction_R;
    T.main_prov                            := is_main;
    T.pFIBDataSet1.Database                := T.Class_Database;
    T.pFIBDataSet1.Transaction             := T.Class_Transaction_R;

    T.DataSetSch.Database                  := T.Class_Database;
    T.DataSetSch.Transaction               := T.Class_Transaction_R;

    T.DataSetKeyInput.Database             := T.Class_Database;
    T.DataSetKeyInput.Transaction          := T.Class_Transaction_R;

    T.Class_Transaction_R.StartTransaction;

    if (T.mm.myform.show_neosn_prov = 1) and (is_main = 1) then
        T.cxCheckBox1.Visible := true;

    T.PR := PRIHODN;
    T.flag := m;
    T.LoadCaptions;
    T.id_k        := id_kekv;
    T.id_kor_sch  := id_korespond_sch;
    T.id_smeta    := id_sm;
    T.id_r        := id_razd;
    T.id_stat     := id_st;
    T.id_man      := id_m;
    T.id_sch      := id_sc;
    T.id_dog_add  := id_dog;
    T.id_c        := id_cust;
    T.kod_dog_add := kod_dog;
    T.flag_dog    := false;
    T.name_cust := name_c;
    T.date_dog  := date_d;
    T.num_dog   := num_d;
    T.r_dog     := reg_dog;
    T.t_dog     := type_dog;
    T.cxMemoDog.Text := Un_R_file_Alex.BANK_DOG_NUM+' : ' + type_dog+'; № '+num_d+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +date_d + '( '+ Un_R_file_Alex.KASSA_REG_NUM + reg_dog+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + name_c;
    T.cxMemoDog.Visible := true;
    T.cxMRUEditKorSch.Text := name_kor_sch;
    T.cxMRUEditKekv.Text   := name_k;
    T.cxLabel2.Text        := name_sch;
    T.Label8.Caption       := tin;
    T.Label7.Caption       := birthday;
    T.cxMRUEditFio.Text    := name_fio;
    T.cxLabel1.Text        := title_sm;
    T.Label3.Text          := title_rz;
    T.Label4.Text          := title_st;
    T.cxLabel8.text        := title_kekv;
    T.cxLabel2.Text        := title_sch;
    T.cxLabel7.Text        := title_kor_sch;
    T.cxMRUEditKorSch.Text := name_kor_sch;
    T.cxMRUEditSm.Text     := name_smeta;
    T.cxMRUEditRz.Text     := name_r;
    T.cxMRUEditSt.Text     := name_stat;
    T.cxMRUEditKekv.Text   := name_k;
    T.id_man               := id_m;
    T.id_dog_gr            := id_dog_group;
    T.id_dog_gr_pr           := id_dog_group_pr;
    T.id_dog_gr_rash         := id_dog_group_rash;

    T.cxTextEditSumma.Text := FloatToStr(RoundTo(sum, -2));

    T.DataSetSch.Close;
    T.DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM MBOOK_INI_DATA';
    T.DataSetSch.Open;
    T.DataSetSch.First;
    if T.DataSetSch.FieldByName('USE_DEFAULT_VALUES').AsInteger = 1 then
    begin
         T.cxMRUEditSm.Enabled   := false;
         T.cxMRUEditRz.Enabled   := false;
         T.cxMRUEditSt.Enabled   := false;
    end;
    if T.DataSetSch.FieldByName('DEFAULT_KEKV').AsInteger = 1 then
    begin
         T.cxMRUEditKekv.Enabled := false;
    end;

    T.id_system :=  ID_KAS;
    T.date_ao   :=  T.mm.cxDateEditAo.Date;

    T.DataSetSch.Close;
    T.DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_ALL_SCH_N('+IntToStr(ID_KAS)+', '''+dateToStr(T.mm.cxDateEditAo.Date)+''') ';
    T.DataSetSch.Open;
    if (is_main = 1) then
    if(T.mm.use_expert_system<>1) then
    begin
    if (not T.DataSetSch.IsEmpty) then
    begin
        T.DataSetSch.FetchAll;
        SetLength(T.Ind, T.DataSetSch.RecordCount);
        SetLength(T.Ind1, T.DataSetSch.RecordCount);
        T.DataSetSch.First;

        T.cxComboBoxSch.Properties.Items.Clear;
        i := 0;
        while not T.DataSetSch.Eof do
        begin
            T.Ind[T.DataSetSch.RecNo - 1]  := T.DataSetSch['ID_SCH'];
            T.Ind1[T.DataSetSch.RecNo - 1] := T.DataSetSch['SCH_TITLE'];
            if T.DataSetSch['ID_SCH'] = id_sc then
            begin
                i := T.DataSetSch.RecNo - 1;
                T.id_sch        := id_sc;//T.DataSetSch['ID_SCH'];
                T.name_sch      := T.DataSetSch['SCH_NUM'];
                T.cxLabel2.Text := T.DataSetSch['SCH_TITLE'];
            end;
            if id_sc = 0 then
            begin
                i := T.DataSetSch.RecNo - 1;
                T.id_sch := T.DataSetSch['ID_SCH'];
                T.name_sch := T.DataSetSch['SCH_NUM'];
                T.cxLabel2.Text := T.DataSetSch['SCH_TITLE'];
            end;
            T.cxComboBoxSch.Properties.Items.Insert(T.DataSetSch.RecNo - 1, T.DataSetSch['SCH_NUM']);
            T.DataSetSch.Next;
        end;

        T.cxComboBoxSch.ItemIndex := i;
    end else
    begin
        ShowMessage(Un_R_file_Alex.KASSA_ERROR_SCH);
        T.cxButtonClose.Click;
        result := false;
        exit
    end;
   end else
   begin
        T.DataSetSch.FetchAll;
        SetLength(T.Ind, 1);
        SetLength(T.Ind1, 1);
        T.DataSetSch.First;

        T.cxComboBoxSch.Properties.Items.Clear;
        i := 0;
        while not T.DataSetSch.Eof do
        begin
            if T.DataSetSch['ID_SCH'] = id_sc then
            begin
                T.id_sch        := id_sc;
                T.name_sch      := T.DataSetSch['SCH_NUM'];
                T.cxLabel2.Text := T.DataSetSch['SCH_TITLE'];
                T.cxComboBoxSch.Properties.Items.Insert(0, T.DataSetSch['SCH_NUM']);
                T.Ind[0]  := T.DataSetSch['ID_SCH'];
                T.Ind1[0] := T.DataSetSch['SCH_TITLE'];
                T.cxComboBoxSch.ItemIndex := 0;
            end;
            T.DataSetSch.Next;
        end;

    end ;
    if m = AddProvAvance then
    begin
        T.SelectAll(1,0,0,0,0,0,11, 1);
        if T.mm.flag_new_alg then
        if id_dog <= 0 then
            T.SelectDogovor(sum);
    end;

    if m = DontMainProvAvance then
    begin
        T.cxComboBoxSch.Properties.Items.Clear;
        //res := GlobalSPR.GetSch(nil, T.Class_Database.Handle, fsNormal, T.mm.cxDateEditAo.Date, 1, 0, 0);
        if VarArrayDimCount(res) > 0 then
        begin
            if (res[0][1]<>null) and (res[0][0]<>null) then
            begin
                SetLength(T.Ind, 1);
                T.Ind[0]             := res[0][0];
                T.id_sch             := res[0][0];
                T.cxComboBoxSch.Properties.Items.Insert(0, res[0][3]);
                T.cxComboBoxSch.ItemIndex := 0;
                T.cxLabel2.Text      := res[0][1];
            end;
        end;
        T.SelectAll(1, -1, -1, -1, -1, -1, 21, 0);
    end;

    if m = ChangeProvAvance then
    begin
        if id_pr > 0 then {если встречная}
        begin
            T.EnableVstrechProv(true);
            T.pFIBDataSet1.Close;
            T.pFIBDataSet1.SQLs.SelectSQL.Text := 'Select * from KASSA_SELECT_ALL_DOC_PO_ID_PROV('+IntToStr(id_pr)+', ' + IntToStr(T.mm.prihod) + ')';
            T.pFIBDataSet1.Open;
            if T.pFIBDataSet1['NUM_DOC'] <> null
                then T.cxTextEditNumber.Text := T.pFIBDataSet1['NUM_DOC'];
            if T.pFIBDataSet1['DATE_DOC'] <> null
                then T.cxDateEditDateDoc.Date := T.pFIBDataSet1['DATE_DOC'];
            if T.pFIBDataSet1['TYPE_DOC'] <> null
                then T.cxTextEditTypeDoc.Text := T.pFIBDataSet1['TYPE_DOC'];
            if T.pFIBDataSet1['SUMMA'] <> null
                then T.cxTextEditFio.Text := T.pFIBDataSet1['SUMMA'];
            if T.pFIBDataSet1['NOTE'] <> null
                then T.cxTextEditNote.Text := T.pFIBDataSet1['NOTE'];
        end;
        if is_main = 0 then
        begin
            T.Image1.ViSible    := true;
            T.cxLabel11.Caption := Un_R_file_Alex.KASSA_DOC_ADD_PROV_NEOS_PROV;
            T.cxComboBoxSch.Properties.Items.Clear;
            T.pFIBDataSet1.Close;
            T.pFIBDataSet1.SQLs.SelectSQL.Text := 'Select * from PUB_SP_MAIN_SCH WHERE ID_SCH = '+iNTtOsTR(id_sc)+' AND DATE_BEG<='''+dATEtOsTR(DATE)+''' AND DATE_END>'''+dATEtOsTR(DATE)+''' ';
            T.pFIBDataSet1.Open;
            T.id_sch             := id_sc;
            SetLength(T.Ind, 1);
            T.Ind[0] := id_sc;
            T.cxComboBoxSch.Properties.Items.Insert(0, T.pFIBDataSet1.FieldByName('SCH_NUMBER').asString);
            T.cxComboBoxSch.ItemIndex := 0;
            T.cxLabel2.Text           := T.pFIBDataSet1.FieldByName('SCH_TITLE').asString;
            T.pFIBDataSet1.Close;
        end;
    end;

    if T.ShowModal=mrOk then
    begin
        id_sm   := T.id_smeta;
        id_st   := T.id_stat;
        id_razd := T.id_r;
        id_kekv := T.id_k;
        id_korespond_sch := T.id_kor_sch;
        name_kor_sch     := T.cxMRUEditKorSch.Text;
        id_sc   := T.id_sch;
        id_m    := T.id_man;
        sum     := StrToFloat(T.cxTextEditSumma.Text);
        name_fio   := T.cxMRUEditFio.Text;
        name_smeta := T.cxMRUEditSm.Text;
        name_r     := T.cxMRUEditRz.text;
        name_stat  := T.cxMRUEditSt.Text;
        name_k     := T.cxMRUEditKekv.Text;
        name_sch   := T.cxComboBoxSch.Text;
        title_sm   := T.cxLabel1.text;
        title_rz   := T.Label3.Text;
        title_st   := T.Label4.Text;
        title_kekv := T.cxLabel8.text;
        title_sch  := T.cxLabel2.Text;
        title_kor_sch := T.cxLabel7.text;
        tin        := T.Label8.Caption;
        birthday   := T.Label7.Caption;
        id_dog     := T.id_dog_add;
        kod_dog    := T.kod_dog_add;
        date_d     := T.date_dog;
        num_d      := T.num_dog;
        name_c     := T.name_cust;
        reg_dog    := T.r_dog;
        type_dog   := T.t_dog;
        kod_neos   := T.kod_neosnov_prov;
        id_dog_group      := T.id_dog_gr;
        id_dog_group_pr   := T.id_dog_gr_pr;
        id_dog_group_rash := T.id_dog_gr_rash;
        Result  := true;
    end
    else
        Result  := false;
    T.Free
end;

procedure TfmAddChangeProv.cxMRUEditKekvPropertiesButtonClick(
  Sender: TObject);
begin
{    res := uPublicBookInterfaces.GetKEKVSpr(self,Class_Database.Handle,fsNormal, mm.cxDateEdit2.Date, 1);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][0]<>null) and (res[0][1]<>null) then
        begin
            id_k := res[0][0];
            cxMRUEditKekv.Text := res[0][2];
            cxLabel8.Caption   := res[0][1];
        end;
    end;}
{
    id_k := 990000002;
    cxMRUEditKekv.Text := '1';
    cxLabel8.Caption   := 'Код єкономічної класіфікації';}
    SelectAll(0, id_kor_sch, id_smeta, id_r, id_stat, 0, 11, 1)
end;


procedure TfmAddChangeProv.LoadCaptions;
begin
    cxlabelfio.Caption := Un_R_file_Alex.KASSA_DOC_FIO;
    cxLabel4.Caption   := Un_R_file_Alex.KASSA_SMETA_RAZD_ST;
    cxLabel6.Caption   := Un_R_file_Alex.KASSA_ADD_PROVODKA_SUMMA_PROV;
    cxLabel5.Caption   := Un_R_file_Alex.KASSA_KEKV;
    cxLabel3.Caption   := Un_R_file_Alex.KASSA_SCH_KASSA;
    cxButton1.Caption  := 'F10 - ' + Un_R_file_Alex.MY_BUTTON_ADD;
    cxButtonClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;
    cxLabelSch.Caption := Un_R_file_Alex.KASSA_SCH_KORESPOND;
    Label2.Caption     := Un_R_file_Alex.KASSA_RAZD;
    cxLabel10.Caption  := Un_R_file_Alex.KASSA_STAT;
    Label5.Caption     := Un_R_file_Alex.BANK_DOG_NUM;
    Label8.Caption     := Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    Label6.Caption     := Un_R_file_Alex.J4_PRIKAZ;
    Label5.Caption     := Un_R_file_Alex.KASSA_DOC_ORDER_TIN;
    Label1.Caption     := Un_R_file_Alex.KASSA_DOC_ORDER_BIRTHDAY;
    dxStatusBar1.Panels[0].Text                  := Un_R_file_Alex.MY_ACTION_ADD_CONST + ' - F10';
    dxStatusBar1.Panels[1].Text                  := Un_R_file_Alex.J4_MAIN_OTMENA      + ' - Esc';
    if (flag = AddProvAvance) then
    begin
        caption := Un_R_file_Alex.KASSA_ADD_PROV;
    end;
    if (flag = DontMainProvAvance) then
    begin
        caption := Un_R_file_Alex.KASSA_ADD_PROV_DONT_MAIN;
    end;
    if flag = ChangeProvAvance then
    begin
        caption := Un_R_file_Alex.KASSA_CHANGE_PROV;
    end;
    GroupBox1.Caption  := Un_R_file_Alex.KASSA_INFO_VSTRECH;
    cxLabel12.Caption  := Un_R_file_Alex.J4_FIND_DOC_NUM;
    cxLabel13.Caption  := Un_R_file_Alex.KASSA_FIND_DATE_DOC;
    cxLabel14.Caption  := Un_R_file_Alex.J4_TYPE_DOC;
    cxLabel15.Caption  := Un_R_file_Alex.KASSA_SUMMA;
    cxLabel20.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;

    cxCheckBox1.Properties.Caption := Un_R_file_Alex.J4_ADD_PROV_PO_NEOSNOVNIM;
end;

procedure TfmAddChangeProv.ActionAddExecute(Sender: TObject);
{var
    pr : integer; }
begin
     if StrToFloat(cxTextEditSumma.Text) = 0 then
     begin
         ShowMessage(Un_R_file_Alex.KASSA_ORDER_ADD_PROV_SUMMA_ERROR);
         exit;
     end;
     if (StrToFloat(cxTextEditSumma.text)<>0) and (id_kor_sch>0) then ModalResult := mrOK;
end;

procedure TfmAddChangeProv.ActioncloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAddChangeProv.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
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
var
    res : Variant;
begin
    res := Un_lo_file_Alex.MY_GetManExAo(self, Class_Database.Handle,mm.date_beg_ao, mm.date_end_ao, false, false, id_man);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            if id_man <> res[0] then
            begin
                id_man := res[0];
                cxMRUEditFio.Text := res[1];
                Label8.Caption    := res[9];
                Label7.Caption    := res[8];
            end;
        end;
    end;
end;

procedure TfmAddChangeProv.cxMRUEditRazdPropertiesButtonClick(
  Sender: TObject);
begin
    SelectAll(0, -1, id_smeta, id_r, id_stat, id_k, 11, 0);
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
            cxLabel2.Text := Ind1[i];
        end;
end;

function TfmAddChangeProv.SelectDogovor(all_summa : double) : boolean;
var
    summa_dog : double;
    inputDog : TDogInput;
    res   : TDogResult;
begin
    summa_dog := all_summa;
    begin
        Class_Transaction_Wr.DefaultDatabase := Class_Database;
        LoadSysData(Class_Transaction_R);
        inputDog.Owner                  := self;
        inputDog.DBHandle               := Class_Database.Handle; //mm.database.Handle;
        inputDog.WriteTrans             := Class_Transaction_Wr.Handle; // mm.Class_Transaction_Wr.Handle;
        inputDog.ReadTrans              := Class_Transaction_R.Handle; //mm.pFIBTransactionRead.Handle;
        inputDog.FormStyle              := fsNormal;
        inputDog.Summa                  := summa_dog;
        inputDog.id_Group               := id_dog_gr;
        if (pr =1) then
             inputDog.id_Group_add           := id_dog_gr_pr
        else
             inputDog.id_Group_add           := id_dog_gr_rash;
//        inputDog                        := SYS_DEFAULT_DOG_INPUT;
        inputDog.filter.bShowFilterForm := true;
        inputDog.isZayav                := false;
        inputDog.arndGetPay             := 1;
        inputDog.shablon_data.bUse      := true;
        inputDog.shablon_data.num       := Un_R_file_Alex.MY_B_N;
        inputDog.shablon_data.date_dog  := mm.cxDateEditAo.Date;
        inputDog.shablon_data.note      := '';
        inputDog.shablon_data.summa     := summa_dog;
        inputDog.shablon_data.id_rate_account    := 0;
        inputDog.shablon_data.id_rate_acc_native := 0;
        //inputDog.filter.NameCust       := mm.myform.name_cust;
        SYS_ID_USER                     := mm.myclass.id_user;
        SYS_CURRENT_DATE                := mm.cxDateEditAo.Date;

        res := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
            SelectDogovor  := true;
            id_dog_add     := res.id_dog;
            kod_dog_add    := res.kod_dog;
            name_cust      := VarToStr(res.name_customer);
            date_dog       := VarToStr(res.d_dog);
            num_dog        := VarToStr(res.n_dog);
            mm.id_customer := res.id_customer;
            mm.id_rate     := res.id_rate_acc;
            mm.id_rate_n   := res.id_rate_acc_nat;
            id_c           := res.id_customer;
            r_dog          := VarToStr(res.regest_num);
            t_dog          := VarToStr(res.name_tip_dog);
            cxMemoDog.Text := VarToStr(res.name_tip_dog)+'; №  '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
        end else
        begin
            SelectDogovor := false;
        end;
    end;
end;

procedure TfmAddChangeProv.SelectAll(a: integer; k_sch, sm, rz, st, kv : int64; mode_ : integer; add : integer);
var
    id_sss : int64;
    i, k : integer;
    pr : integer;
    num_out, title_out : string;
begin
    id_sss := 0;
    //if length(Ind) = 1
    //    then
    id_sss := id_sch;
    if (length(Ind) > 1) and (a=1) then
    begin
         if  (mm.use_expert_system<>1)  then
         begin
            if not ShowSelectSch(Class_Database,Class_Transaction_R,id_system,sm ,rz ,st,mm.id_oper_act,mm.prihod, mm.use_expert_system, mm.id_form_uch, mm.cxDateEditAo.Date, id_sss, num_out, title_out) then
            begin
                exit;
            end;
            k := length(Ind);
            for i:=0 to k-1 do
            if id_sss = Ind[i] then
            begin
                cxComboBoxSch.ItemIndex := i;
                id_sch := id_sss;
                cxLabel2.Text := Ind1[i];
            end;
        end;
    end;
    if (a=0) then
    begin
        id_sss := id_sch;
    end;

        STRU.AOWNER         := self;
        STRU.DBHANDLE       := Class_Database.Handle;
        STRU.MODE           := mode_;//1
        STRU.CR_BY_DT       := mm.prihod;
        STRU.SCH_SET_FLAG   := mm.prihod;
        STRU.NOT_DIF_BDG_FG := false;
        STRU.ID_LANGUAGE    := 2;
        if mode_ = 1 then
        begin
            if mm.prihod = 1 then
            begin
                STRU.ID_SCH_IN      := id_sss;
                stru.DB_ID_SMETA    := sm;
                stru.DB_ID_RAZD     := rz;
                stru.DB_ID_STAT     := st;
                stru.DB_ID_KEKV     := kv;
                stru.KR_ID_SCH      := k_sch;
            end else
            begin
                STRU.ID_SCH_IN      := id_sss;
                stru.KR_ID_SMETA    := sm;
                stru.KR_ID_RAZD     := rz;
                stru.KR_ID_STAT     := st;
                stru.KR_ID_KEKV     := kv;
                stru.DB_ID_SCH      := k_sch;
            end;
        end;
        if mode_ = 11 then
        begin
            if mm.prihod = 1 then
            begin
                STRU.DB_ID_SCH      := id_sss;
                stru.DB_ID_SMETA    := sm;
                stru.DB_ID_RAZD     := rz;
                stru.DB_ID_STAT     := st;
                stru.DB_ID_KEKV     := kv;
                stru.KR_ID_SCH      := k_sch;
                stru.KR_ID_SMETA    := sm;
                stru.KR_ID_RAZD     := rz;
                stru.KR_ID_STAT     := st;
                stru.KR_ID_KEKV     := kv;
            end else
            begin
                STRU.KR_ID_SCH      := id_sss;
                stru.KR_ID_SMETA    := sm;
                stru.KR_ID_RAZD     := rz;
                stru.KR_ID_STAT     := st;
                stru.KR_ID_KEKV     := kv;
                stru.DB_ID_SCH      := k_sch;
                stru.DB_ID_SMETA    := sm;
                stru.DB_ID_RAZD     := rz;
                stru.DB_ID_STAT     := st;
                stru.DB_ID_KEKV     := kv;
            end;
        end;

        STRU.ACTUAL_DATE    := mm.cxDateEditAo.Date;
        STRU.WIZARD_FORM_SH := false;//true;
        STRU.INFO_PANEL_SH  := true;
        STRU.NOT_DIF_BDG_FG := true;

        if main_prov = 0 then
            stru.ID_FORM_UCH    := 1;
        if Kernel.WizardGetProvInfo(@STRU) then
        begin
            cxMRUEditSm.text := IntToStr(Stru.DB_KOD_SMETA);
            cxLabel1.Text     := stru.DB_TITLE_SMETA;//   copy(ostatok, 3, length(ostatok)-3);

            cxMRUEditRz.text := IntToStr(stru.DB_KOD_RAZD);
            Label3.Text       := stru.DB_TITLE_RAZD;//copy(ostatok, 3, length(ostatok)-3);

            cxMRUEditSt.text := IntToStr(stru.DB_KOD_STAT);
            Label4.Text       := stru.DB_TITLE_STAT;//copy(ostatok, 3, length(ostatok)-3);

            cxMRUEditKekv.text := IntToStr(stru.DB_KOD_KEKV);
            cxLabel8.Text       := stru.DB_KEKV_TITLE;//copy(ostatok, 3, length(ostatok)-3);

            if MM.prihod = 1
            then
                begin
                    id_kor_sch           := stru.KR_ID_SCH;
                    cxMRUEditKorSch.Text := stru.KR_ID_SCH_KOD;
                    name_kor_sch         := stru.KR_ID_SCH_KOD;
                    cxLabel7.text        := stru.KR_ID_SCH_TIT;
                    if main_prov = 0 then
                    begin
                        SetLength(Ind, 1);
                        Ind[0]               := stru.DB_ID_SCH;
                        id_sch               := stru.DB_ID_SCH;
                        cxComboBoxSch.Properties.Items.Insert(0, stru.DB_ID_SCH_KOD);
                        cxComboBoxSch.ItemIndex := 0;
                        cxLabel2.Text        := stru.DB_ID_SCH_TIT;
                    end;
                end
            else
                begin
                    id_kor_sch           := stru.DB_ID_SCH;
                    cxMRUEditKorSch.Text := stru.DB_ID_SCH_KOD;
                    name_kor_sch         := stru.DB_ID_SCH_KOD;
                    cxLabel7.Text        := stru.DB_ID_SCH_TIT;
                    if main_prov = 0 then
                    begin
                        SetLength(Ind, 1);
                        Ind[0]               := stru.KR_ID_SCH;
                        id_sch               := stru.KR_ID_SCH;
                        cxComboBoxSch.Properties.Items.Insert(0, stru.KR_ID_SCH_KOD);
                        cxComboBoxSch.ItemIndex := 0;
                        cxLabel2.Text        := stru.KR_ID_SCH_TIT;
                    end;
                end;
            id_smeta             := stru.DB_ID_SMETA;
            id_r                 := stru.DB_ID_RAZD;
            id_stat              := stru.DB_ID_STAT;
            id_k                 := stru.DB_ID_KEKV;
            if STRU.FACED_FLAG then {если встречная}
            begin
                EnableVstrechProv(true);
                id_prov := stru.FACED_ID_PROV;
                id_doc  := stru.FACED_ID_DOC;
//                cr_dt   := stru.FACED_CR_BY_DT;
                id_man  := stru.FACED_ID_MAN;
                kod_dog_add := stru.FACED_KOD_DOG;
                id_dog_add  := stru.FACED_ID_DOG;
                cxTextEditSumma.Text := FloatToStr(RoundTo(stru.FACED_PROV_SUMMA, -2));

                pFIBDataSet1.Close;
                pFIBDataSet1.SQLs.SelectSQL.Text := 'Select * from KASSA_SELECT_ALL_DOC_PO_ID('+IntToStr(id_doc)+')';
                pFIBDataSet1.Open;
                if pFIBDataSet1['NUM_DOC'] <> null
                    then cxTextEditNumber.Text := pFIBDataSet1['NUM_DOC'];
                if pFIBDataSet1['DATE_DOC'] <> null
                    then cxDateEditDateDoc.Date := pFIBDataSet1['DATE_DOC'];
                if pFIBDataSet1['TYPE_DOC'] <> null
                    then cxTextEditTypeDoc.Text := pFIBDataSet1['TYPE_DOC'];
                pr := 0;
                if pFIBDataSet1['SUMMA'] <> null
                    then cxTextEditFio.Text := AddNol(pFIBDataSet1.FieldByName('SUMMA').AsString, pr);
                if pFIBDataSet1['NOTE'] <> null
                    then cxTextEditNote.Text := pFIBDataSet1['NOTE'];
            end


        end;
end;


procedure TfmAddChangeProv.cxMRUEditSmPropertiesButtonClick(
  Sender: TObject);
begin
    SelectAll(0, id_kor_sch, -1, id_r, id_stat, id_k, 11, 0);
end;

procedure TfmAddChangeProv.cxMRUEditRzPropertiesButtonClick(
  Sender: TObject);
begin
    SelectAll(0, id_kor_sch, id_smeta, -1, id_stat, id_k, 11, 0);
end;

procedure TfmAddChangeProv.SpeedButton1Click(Sender: TObject);
begin
    SelectDogovor(0);
end;

procedure TfmAddChangeProv.EnableVstrechProv(s: boolean);
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

procedure TfmAddChangeProv.ActionShowExecute(Sender: TObject);
begin
  ShowMessage('id_sm - '            + IntToStr(id_smeta)    + #13 +
              'id_st - '            + IntToStr(id_stat)     + #13 +
              'id_razd - '          + IntToStr(id_r)        + #13 +
              'id_kekv - '          + IntToStr(id_k)        + #13 +
              'id_korespond_sch - ' + IntToStr(id_kor_sch)  + #13 +
              'name_kor_sch - '     + cxMRUEditKorSch.Text  + #13 +
              'id_sc - '            + IntToStr(id_sch)      + #13 +
              'id_m - '             + IntToStr(id_man)      + #13 +
              'sum - '              + cxTextEditSumma.Text  + #13 +
              'id_dog - '           + IntToStr(id_dog_add)  + #13 +
              'kod_dog - '          + IntToStr(kod_dog_add) + #13 +
              'date_d - '           + date_dog              + #13 +
              'num_d - '            + num_dog               + #13 +
              'name_c - '           + name_cust             + #13 +
              'reg_dog - '          + r_dog                 + #13 +
              'type_dog - '         + t_dog);
end;

procedure TfmAddChangeProv.cxComboBoxSchClick(Sender: TObject);
VAR
    I : INTEGER;
begin
       i := cxComboBoxSch.ItemIndex;
        if id_sch <> Ind[i] then
        begin
            id_sch := Ind[i];
            name_sch := cxComboBoxSch.Text;
            cxLabel2.Text := Ind1[i];
        end;
end;

procedure TfmAddChangeProv.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.checked then
    begin
        cxButtonEdit1.Visible := true;
        cxButtonEdit1PropertiesButtonClick(self, 0);
    end else
    begin
        cxButtonEdit1.Visible := false;
    end;
end;

procedure TfmAddChangeProv.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    r : variant;
begin
    r := Un_lo_file_Alex.LShow_Neosnov(self, Class_Database, fsNormal, mm.cxDateEditAo.Date);
    if varArrayDimcount(R) > 0 then
    begin
        cxButtonEdit1.Text := r[1];
        kod_neosnov_prov   := r[0];
    end else
        cxCheckBox1.Checked := false;
end;

procedure TfmAddChangeProv.cxMRUEditKorSchExit(Sender: TObject);
begin
    sch_str :=  cxMRUEditKorSch.Text;
    if(sch_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SP_MAIN_SCH m where  m.sch_number=:sch_str and m.date_beg<=:date_beg_str and m.date_end>=:date_beg_str';
        DataSetKeyInput.Prepare;
        DataSetKeyInput.ParamByName('sch_str').AsString     := sch_str;
        DataSetKeyInput.ParamByName('date_beg_str').AsDate  := mm.cxDateEditAo.Date;
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
//showmessage(sm_str);
    sm_str  := cxMRUEditSm.Text;
    if(sm_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_NAME_BUDG_BY_KOD(:NUM_OBJECT,:ACTUAL_DATE, :TYPE_OBJECT)';
        DataSetKeyInput.ParamByName('NUM_OBJECT').AsString     := sm_str;
        DataSetKeyInput.ParamByName('ACTUAL_DATE').AsDate      := mm.cxDateEditAo.Date;
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

procedure TfmAddChangeProv.cxMRUEditRzExit(Sender: TObject);
begin
    raz_str :=  cxMRUEditRz.Text;
    if(raz_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_NAME_BUDG_BY_KOD(:NUM_OBJECT,:ACTUAL_DATE, :TYPE_OBJECT)';
        DataSetKeyInput.ParamByName('NUM_OBJECT').AsString     := raz_str;
        DataSetKeyInput.ParamByName('ACTUAL_DATE').AsDate      := mm.cxDateEditAo.Date;
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
        DataSetKeyInput.ParamByName('num_razd').AsString     := cxMRUEditRz.Text;
        DataSetKeyInput.ParamByName('num_st').AsString       := st_str;
        DataSetKeyInput.ParamByName('actual_date').AsDate    := mm.cxDateEditAo.Date;
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
        DataSetKeyInput.ParamByName('ACTUAL_DATE').AsDate    := mm.cxDateEditAo.Date;
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
