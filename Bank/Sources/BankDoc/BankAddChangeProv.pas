unit BankAddChangeProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxMRUEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, ActnList, Un_R_file_Alex, cxLabel, FR_Class, pFIBDatabase,
  DB, FIBDataSet, pFIBDataSet, FIBDatabase, GlobalSPR, BankOrder, Un_lo_file_Alex,
  cxMemo, Buttons, Kernel, cxCalendar, Un_func_file_Alex, Placemnt;

type
  TfmModeProv = (AddProv, ChangeProv, ClonProv, ShowProv);

  TfmBankAddChangeProv = class(TForm)
    cxMRUEditFio: TcxMRUEdit;
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
    DataSetSmRazdSt: TpFIBDataSet;
    cxLabel9: TcxLabel;
    Label1: TLabel;
    Label5: TLabel;
    cxMRUEditRazd: TcxMRUEdit;
    cxMRUEditSm: TcxMRUEdit;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxTextEditSch: TcxTextEdit;
    cxLabel2: TcxTextEdit;
    cxLabel7: TcxTextEdit;
    cxLabel1: TcxTextEdit;
    Label3: TcxTextEdit;
    Label4: TcxTextEdit;
    cxLabel8: TcxTextEdit;
    cxMemoDog: TcxMemo;
    SpeedButton1: TSpeedButton;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    Class_Transaction_Wr: TpFIBTransaction;
    GroupBox1: TGroupBox;
    cxTextEditNumber: TcxTextEdit;
    cxLabel15: TcxLabel;
    cxDateEditDateDoc: TcxDateEdit;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxTextEditFio: TcxTextEdit;
    cxLabel20: TcxLabel;
    cxTextEditNote: TcxTextEdit;
    cxTextEditTypeDoc: TcxTextEdit;
    DataSetDoc: TpFIBDataSet;
    ActionShow: TAction;
    cxMemoNote: TcxMemo;
    cxLabel19: TcxLabel;
    cxMemo1: TcxMemo;
    DataSetKeyInput: TpFIBDataSet;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    ValutaLabel: TcxLabel;
    ValutaTextEdit: TcxTextEdit;
    procedure ActionAddExecute(Sender: TObject);
    procedure ActioncloseExecute(Sender: TObject);
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    procedure cxMRUEditFioPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditRazdPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditStPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditKekvPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditSmPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditSchPropertiesButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SelectAll(a: integer; k_sch, sm, rz, st, kv : int64; mode_ : integer);
    function SelectDogovor(all_summa : double):boolean;
    procedure EnableVstrechProv(s : boolean);
    procedure cxTextEditSummaExit(Sender: TObject);
    procedure ActionShowExecute(Sender: TObject);
    procedure cxTextEditSchKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxMRUEditSmExit(Sender: TObject);
    procedure cxMRUEditRazdExit(Sender: TObject);
    procedure cxMRUEditStExit(Sender: TObject);
    procedure cxMRUEditKekvExit(Sender: TObject);
    procedure cxMRUEditSchExit(Sender: TObject);
  private
//    Ind : array of Int64;
    id_man, id_smeta, id_stat, id_r, id_k, id_sch, id_kor_sch, id_dog_add, kod_dog_add : int64;
    name_fio, name_smeta, kod_stat_, kod_r_, name_k, name_sch, name_kor_sch, title_sm, name_raz_, name_st_, title_kekv, date_dog, num_dog, name_cust, t_dog, r_dog, note_prov  : string;
    flag : TfmModeProv;
    mm : TfmBankOrder;
    id_doc, id_prov : int64;
    cr_dt : integer;
    sm_str, raz_str, st_str, kekv_str, sch_str : string;
    procedure LoadCaptions;
  public
    id_valuta   : Integer;
    name_valuta : string;
  end;

function Show_Provodka(n : TfmBankOrder; ID_KAS : INT64; db : TpFIBDatabase;
                      Tr : TpFIBTransaction; m : TfmModeProv; var id_korespond_sch,
                      id_m, id_sc, id_sm, id_st, id_razd, id_kekv : int64;
                      var sum : double; var name_fio, name_sch, name_smeta,
                      kod_stat_, kod_r_, name_k, title_sm,name_st_,  name_raz_,
                      title_kekv, name_kor_sch, tit_sch, tit_kor_sch, date_d, num_d,
                      name_c, type_dog, reg_dog : string; var id_dog, kod_dog : int64;
                      var tin, birthday : string; var id_pr : int64; var cr_by_dt : integer;
                      var note_prov : string; id_valuta_in : Integer; name_valuta_in : string;
                      var summa_valuta : double):boolean;

implementation
uses DogLoaderUnit,
     DateUtils;

{$R *.dfm}

function Show_Provodka(n : TfmBankOrder; ID_KAS : INT64; db : TpFIBDatabase; Tr : TpFIBTransaction; m : TfmModeProv; var id_korespond_sch, id_m, id_sc, id_sm, id_st, id_razd, id_kekv : int64; var sum : double; var name_fio, name_sch, name_smeta, kod_stat_, kod_r_, name_k, title_sm,name_st_, name_raz_,  title_kekv, name_kor_sch, tit_sch, tit_kor_sch, date_d, num_d, name_c, type_dog, reg_dog : string; var id_dog, kod_dog : int64; var tin, birthday : string; var id_pr : int64; var cr_by_dt : integer; var note_prov : string; id_valuta_in : Integer; name_valuta_in : string; var summa_valuta : double):boolean;
var
    T : TfmBankAddChangeProv;
    i, pr  : integer;
    ffio, n_cust, d_d, n_do, reg_n : String;
begin
    T := TfmBankAddChangeProv.Create(nil);
    t.id_valuta := id_valuta_in;
    t.name_valuta := name_valuta_in;

    if ((id_valuta_in = 0) or (id_valuta_in = null)) then
    begin
      t.ValutaLabel.Visible    := False;
      t.ValutaTextEdit.Visible := False;
      t.cxLabel21.Visible      := False;
      t.cxLabel22.Visible      := False;
    end
    else
    begin
      t.ValutaLabel.Visible    := True;
      t.ValutaTextEdit.Visible := True;
      t.cxLabel21.Visible      := True;
      t.cxLabel22.Visible      := True;
      t.ValutaLabel.Caption    := name_valuta_in;
      t.ValutaTextEdit.Text    := '';
    end;

    T.mm := n;
    T.cxMemoNote.Text := T.mm.cxMemo1.Text;
    T.cr_dt := cr_by_dt;
    T.Class_Database                       := DB;
    T.Class_Transaction_R                  := Tr;
    T.Class_Transaction_Wr.DefaultDatabase := T.Class_Database;
    T.DataSetSchKorespond.Database         := T.Class_Database;
    T.DataSetSchKorespond.Transaction      := T.Class_Database.DefaultTransaction;
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
    T.id_dog_add := id_dog;
    T.kod_dog_add := kod_dog;
    T.date_dog  := date_d;
    T.num_dog   := num_d;
    T.name_cust := name_c;
    T.name_cust := name_c;
    T.date_dog  := date_d;
    T.num_dog   := num_d;
    T.r_dog     := reg_dog;
    T.t_dog     := type_dog;
//    T.cxMemoDog.Text := Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + type_dog+'; № '+num_d+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +date_d + '( '+ Un_R_file_Alex.KASSA_REG_NUM + reg_dog+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + name_c;
    if T.mm.PageControl1.ActivePage = T.mm.TabSheet2 then
    begin
        try ffio         := T.mm.RxMemoryDataSaveAll.FieldByName('fio_stud').AsString                           except ffio   := ''; end;
        try n_cust       := T.mm.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').AsString   except n_cust := ''; end;
        try d_d          := T.mm.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldDateDog').AsString    except d_d    := ''; end;
        try n_do         := T.mm.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').AsString     except n_do   := ''; end;
        try reg_n        := T.mm.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').AsString     except reg_n  := ''; end;
        T.cxMemoDog.Text := ffio + ' ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' ' + n_cust + ' ' + n_do + Un_R_file_Alex.BANK_REG_NUM + reg_n + ' от - ' + d_d;
    end else
    if T.mm.PageControl1.ActivePage = T.mm.TabSheet1 then
    begin
        try ffio   := T.mm.RxMemoryDataDog.FieldByName('fio_stud').AsString                       except ffio   := ''; end;
        try n_cust := T.mm.RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').AsString   except n_cust := ''; end;
        try d_d    := T.mm.RxMemoryDataDog.FieldByName('RxMemoryDataDogFielddateDog').AsString    except d_d    := ''; end;
        try n_do   := T.mm.RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').AsString     except n_do   := ''; end;
        try reg_n  := T.mm.RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').AsString except reg_n  := ''; end;
        T.cxMemoDog.Text := ffio + ' ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' ' + n_cust + ' ' + n_do + Un_R_file_Alex.BANK_REG_NUM + reg_n + ' от - ' + d_d;
    end;
    T.cxMemoDog.Visible := true;


    T.cxTextEditSch.Text   := name_sch;
    T.id_sch               := id_sc;
    T.cxLabel2.Text        := tit_sch;
    T.id_k       := id_kekv;
    T.cxMRUEditKekv.Text   := name_k;
    T.cxLabel8.Text        := title_kekv;
    T.id_smeta   := id_sm;
    T.cxMRUEditSm.Text     := name_smeta;
    T.cxLabel1.Text        := title_sm;
    T.id_r       := id_razd;
    T.cxMRUEditRazd.Text   := kod_r_;
    T.Label3.Text          := name_raz_;
    T.id_stat    := id_st;
    T.cxMRUEditSt.Text     := kod_stat_;
    T.Label4.Text          := name_st_;
    T.id_man               := id_m;
    T.cxLabel12.Caption    := tin;
    T.cxLabel14.Caption    := birthday;
    T.name_fio             := name_fio;
    T.cxMRUEditFio.Text    := name_fio;
    T.id_kor_sch           := id_korespond_sch;
    T.cxMRUEditSch.Text    := name_kor_sch;
    T.cxLabel7.Text        := tit_kor_sch;
    pr := 0;
    T.cxTextEditSumma.Text := FloatToStr(sum);
    T.ValutaTextEdit.Text  := FloatToStr(summa_valuta);
    T.cxMemo1.Text         := note_prov;
    T.cxTextEditSumma.Text := AddNol(T.cxTextEditSumma.Text, pr);
    T.ValutaTextEdit.Text  := AddNol(T.ValutaTextEdit.Text, pr);
    if m = AddProv then
    begin
        T.SelectAll(1, -1, -1, -1, -1, -1, 11);
    end;
    T.flag := m;
    T.LoadCaptions;
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
        summa_valuta := StrToFloat(T.ValutaTextEdit.Text);
        name_fio   := T.cxMRUEditFio.Text;//T.Label1.Caption;
        name_smeta := T.cxMRUEditSm.Text;
        kod_r_     := T.cxMRUEditRazd.Text;
        kod_stat_  := T.cxMRUEditSt.Text;
        name_k     := T.cxMRUEditKekv.Text;
        name_sch   := T.cxTextEditSch.Text;
        title_sm   := T.cxLabel1.Text;
        name_raz_  := T.Label3.Text;
        name_st_   := T.Label4.Text;
        title_kekv := T.cxLabel8.Text;
        tit_sch     := T.cxLabel2.text;
        tit_kor_sch := T.cxLabel7.Text;
        id_dog     := T.id_dog_add;
        kod_dog    := T.kod_dog_add;
        date_d     := T.date_dog;
        num_d      := T.num_dog;
        name_c     := T.name_cust;
        reg_dog    := T.r_dog;
        type_dog   := T.t_dog;
        tin        := T.cxLabel12.Caption;
        birthday   := T.cxLabel14.Caption;
        id_pr      := T.id_prov;
        cr_by_dt   := T.cr_dt;
        note_prov  := T.cxMemo1.Text;
        Result     := true;
    end
    else
        Result  := false;
    T.Free
end;

procedure TfmBankAddChangeProv.cxMRUEditKekvPropertiesButtonClick(
  Sender: TObject);
var
    res : variant;
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
    if flag <> ShowProv then
    begin
        SelectAll(0, id_kor_sch, id_smeta, id_r, id_stat, -1, 11);
    end;
end;


procedure TfmBankAddChangeProv.LoadCaptions;
begin
    cxlabelfio.Caption := Un_R_file_Alex.KASSA_DOC_FIO;
    cxLabel4.Caption   := Un_R_file_Alex.KASSA_SMETA;
    cxLabel10.Caption  := Un_R_file_Alex.KASSA_RAZD;
    cxLabel11.Caption  := Un_R_file_Alex.KASSA_STAT;
    cxLabel6.Caption   := Un_R_file_Alex.KASSA_ADD_PROVODKA_SUMMA_PROV;
    cxLabel5.Caption   := Un_R_file_Alex.KASSA_KEKV;
    cxLabel3.Caption   := Un_R_file_Alex.BANK_DAY_SHOW_SCH_BALL;
   // cxButton1.Caption  := 'F10 - ' + Un_R_file_Alex.MY_BUTTON_ADD;
    cxButtonClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;
    cxLabelSch.Caption := Un_R_file_Alex.KASSA_SCH_KORESPOND;
    Label1.Caption     := Un_R_file_Alex.KASSA_DOC_ORDER_TIN;
    cxLabel13.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_BIRTHDAY;
    GroupBox1.Caption  := Un_R_file_Alex.KASSA_INFO_VSTRECH;
    cxLabel19.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxLabel20.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxLabel18.Caption  := Un_R_file_Alex.KASSA_SUMMA;
    cxLabel17.Caption  := Un_R_file_Alex.J4_MAIN_ADD_TYPE_DOC;
    cxLabel16.Caption  := Un_R_file_Alex.KASSA_FIND_DATE_DOC;
    cxLabel15.Caption  := Un_R_file_Alex.KASSA_FIND_NUM_DOC;
    cxLabel9.Caption       := Un_R_file_Alex.BANK_COMMENT;
    if flag = AddProv then
    begin
        caption := Un_R_file_Alex.KASSA_ADD_PROV;
        ActionAdd.caption := 'F10 - ' + Un_R_file_Alex.MY_ACTION_ADD_CONST;
    end;
    if flag = ChangeProv then
    begin
        caption := Un_R_file_Alex.KASSA_CHANGE_PROV;
        ActionAdd.caption := 'F10 - ' + Un_R_file_Alex.MY_ACTION_UPDATE_CONST;
    end;
    if flag = ClonProv then
    begin
        caption := Un_R_file_Alex.BANK_CLON_FORM;
        ActionAdd.caption := 'F10 - ' + Un_R_file_Alex.MY_ACTION_ADD_CONST;
        cxTextEditSch.Style.Color   := $00FFF8E6;
        cxMRUEditSch.Style.Color    := $00FFF8E6;
        cxMRUEditSm.Style.Color     := $00FFF8E6;
        cxMRUEditRazd.Style.Color   := $00FFF8E6;
        cxMRUEditSt.Style.Color     := $00FFF8E6;
        cxMRUEditKekv.Style.Color   := $00FFF8E6;
        cxTextEditSumma.Style.Color := $00FFF8E6;
        cxMemo1.Style.Color         := $00FFF8E6;
        cxMRUEditFio.Style.Color    := $00FFF8E6;
        cxMemoDog.Style.Color       := $00FFF8E6;
    end;
    if flag = ShowProv then
    begin
        caption := Un_R_file_Alex.KASSA_PROV_SHOW_PROV;
        ActionAdd.caption := 'F10 - ' + Un_R_file_Alex.MY_ACTION_ADD_CONST;
        ActionAdd.enabled := false;
        cxTextEditSch.Style.Color   := cl3DLight;
        cxMRUEditSch.Style.Color    := cl3DLight;
        cxMRUEditSm.Style.Color     := cl3DLight;
        cxMRUEditRazd.Style.Color   := cl3DLight;
        cxMRUEditSt.Style.Color     := cl3DLight;
        cxMRUEditKekv.Style.Color   := cl3DLight;
        cxTextEditSumma.Style.Color := cl3DLight;
        cxMemo1.Style.Color         := cl3DLight;
        cxMRUEditFio.Style.Color    := cl3DLight;
        cxMemoDog.Style.Color       := cl3DLight;
    end;
end;

procedure TfmBankAddChangeProv.ActionAddExecute(Sender: TObject);
begin
     if (StrToFloat(cxTextEditSumma.Text) = 0) then
     begin
         ShowMessage(Un_R_file_Alex.KASSA_ORDER_ADD_PROV_SUMMA_ERROR);
         exit;
     end;
     if (id_kor_sch <= 0) then
     begin
         ShowMessage(Un_R_file_Alex.BANK_ERROR_ADD_PROV_KOR_SCH);
         exit;
     end;
     if (id_dog_add <= 0) then
     begin
         ShowMessage(Un_R_file_Alex.BANK_ERROR_PROVE_DOG);
         exit;
     end;
     ModalResult := mrOK
end;

procedure TfmBankAddChangeProv.ActioncloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmBankAddChangeProv.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if flag = ShowProv then
    begin
         key := chr(0);
    end else
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
end;

procedure TfmBankAddChangeProv.cxMRUEditFioPropertiesButtonClick(
  Sender: TObject);
var
    res : Variant;
begin
    if flag <> ShowProv then
    begin
     res := Un_lo_file_Alex.MY_GetManEx(self, Class_Database.Handle);
      if VarArrayDimCount(res) > 0 then
      begin
          if (res[0]<>null) and (res[1]<>null) then
          begin
              if id_man <> res[0] then
              begin
                  id_man := res[0];
                  cxMRUEditFio.Text := res[1];
                  cxLabel12.Caption := res[9];
                  cxLabel14.Caption := res[8];
              end;
          end;
      end;
    end;
end;

procedure TfmBankAddChangeProv.cxMRUEditRazdPropertiesButtonClick(
  Sender: TObject);
var
    Res : variant;
begin
    if flag <> ShowProv then
    begin
        SelectAll(0, id_kor_sch, id_smeta, -1, id_stat, id_k, 11);
    end;
end;

procedure TfmBankAddChangeProv.cxMRUEditStPropertiesButtonClick(
  Sender: TObject);
{var
    res : variant;}
begin
{    res := GlobalSPR.GetSmets(self, Class_Database.Handle, Date, psmGroup);
    begin
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
//            id_sch := res[0][0];
//            cxMRUEditSch.Text := res[0][1];
//             name_r := ;
//             name_stat := ;
//             name_smeta := ;

        end;
    end;
    end;}
    if flag <> ShowProv then
    begin
        SelectAll(0, id_kor_sch, id_smeta, id_r, -1, id_k, 11);
    end;
end;

procedure TfmBankAddChangeProv.SelectAll(a: integer; k_sch, sm, rz, st, kv : int64; mode_ : integer);
var
    pr : integer;
    STRU : WIZARD_GET_PROV_INFO;
begin
        STRU.AOWNER         := self;
        STRU.DBHANDLE       := Class_Database.Handle;
        STRU.MODE           := mode_;//1
        STRU.CR_BY_DT       := mm.prih;
        STRU.SCH_SET_FLAG   := mm.prih;
        if mode_ = 1 then
        begin
            if mm.prih = 1 then
            begin
                STRU.ID_SCH_IN      := id_sch;
                stru.DB_ID_SMETA    := sm;
                stru.DB_ID_RAZD     := rz;
                stru.DB_ID_STAT     := st;
                stru.DB_ID_KEKV     := kv;
                stru.KR_ID_SCH      := k_sch;
            end else
            begin
                STRU.ID_SCH_IN      := id_sch;
                stru.KR_ID_SMETA    := sm;
                stru.KR_ID_RAZD     := rz;
                stru.KR_ID_STAT     := st;
                stru.KR_ID_KEKV     := kv;
                stru.DB_ID_SCH      := k_sch;
            end;
        end;
        if mode_ = 11 then
        begin
            if mm.prih = 1 then
            begin
                STRU.DB_ID_SCH      := id_sch;
                stru.DB_ID_SMETA    := sm;
                stru.DB_ID_RAZD     := rz;
                stru.DB_ID_STAT     := st;
                stru.DB_ID_KEKV     := kv;
                stru.KR_ID_SCH      := k_sch;
                stru.KR_ID_SMETA    := sm;
                stru.KR_ID_RAZD     := rz;
                stru.KR_ID_STAT     := st;
                stru.KR_ID_KEKV     := kv;
                if st=-1 then stru.DB_KOD_STAT    := -1;
            end else
            begin
                STRU.KR_ID_SCH      := id_sch;
                stru.KR_ID_SMETA    := sm;
                stru.KR_ID_RAZD     := rz;
                stru.KR_ID_STAT     := st;
                stru.KR_ID_KEKV     := kv;
                stru.DB_ID_SCH      := k_sch;
                stru.DB_ID_SMETA    := sm;
                stru.DB_ID_RAZD     := rz;
                stru.DB_ID_STAT     := st;
                stru.DB_ID_KEKV     := kv;
                if st=-1 then  stru.KR_KOD_STAT    := -1;
            end;
        end;
//        STRU.ACTUAL_DATE    := mm.cxDateEdit2.Date;

        if MonthOf(mm.DateTimePicker2.date) < 10
            then STRU.ACTUAL_DATE := StrToDate('15.'+'0'+ IntToStr(MonthOf(mm.DateTimePicker2.Date)) + '.'+ IntToStr(YearOf(mm.DateTimePicker2.date)))
            else STRU.ACTUAL_DATE := StrToDate('15.'+ IntToStr(MonthOf(mm.DateTimePicker2.date)) + '.' + IntToStr(YearOf(mm.DateTimePicker2.date)));

        STRU.WIZARD_FORM_SH := false;//true;
        STRU.INFO_PANEL_SH  := true;
        STRU.NOT_DIF_BDG_FG := true;
        if Kernel.WizardGetProvInfo(@STRU) then
        begin
            {if Stru.DB_KOD_SMETA = 0 then cxMRUEditSm.text := IntToStr(Stru.KR_KOD_SMETA) else }cxMRUEditSm.text := IntToStr(Stru.DB_KOD_SMETA);
            {if Stru.db_title_smeta = '' then cxLabel1.Text := Stru.kr_title_smeta else} cxLabel1.Text := Stru.db_title_smeta;
            cxMRUEditRazd.text   := IntToStr(Stru.DB_KOD_RAZD);
            Label3.Text          := Stru.Db_title_razd;
            cxMRUEditSt.text     := IntToStr(Stru.DB_KOD_STAT);
            Label4.Text          := Stru.Db_TITLE_STAT;
            cxMRUEditKekv.text   := IntToStr(Stru.DB_KOD_KEKV);
            cxLabel8.Text        := Stru.DB_KEKV_TITLE;
            if MM.prih = 1
            then
                begin
                    cxMRUEditSch.Text    := stru.DB_ID_SCH_KOD;
                    name_kor_sch         := stru.DB_ID_SCH_KOD;
                    cxLabel7.Text        := stru.DB_ID_SCH_TIT;
                    id_kor_sch           := stru.KR_ID_SCH;
                    cxMRUEditSch.Text    := stru.KR_ID_SCH_KOD;
                    name_kor_sch         := stru.KR_ID_SCH_KOD;
                    cxLabel7.Text        := stru.KR_ID_SCH_TIT;
                end
                else
                begin
                    cxMRUEditSch.Text    := stru.kr_ID_SCH_KOD;
                    name_kor_sch         := stru.KR_ID_SCH_KOD;
                    cxLabel7.Text        := stru.KR_ID_SCH_TIT;
                    id_kor_sch           := stru.DB_ID_SCH;
                    cxMRUEditSch.Text    := stru.DB_ID_SCH_KOD;
                    name_kor_sch         := stru.DB_ID_SCH_KOD;
                    cxLabel7.Text        := stru.DB_ID_SCH_TIT;
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
                cr_dt   := stru.FACED_CR_BY_DT;
                id_man  := stru.FACED_ID_MAN;
                kod_dog_add := stru.FACED_KOD_DOG;
                id_dog_add  := stru.FACED_ID_DOG;
                cxTextEditSumma.Text := FloatToStr(stru.FACED_PROV_SUMMA);

                DataSetDoc.Close;
                DataSetDoc.SQLs.SelectSQL.Text := 'Select * from KASSA_SELECT_ALL_DOC_PO_ID('+IntToStr(id_doc)+')';
                DataSetDoc.Open;
                if DataSetDoc['NUM_DOC'] <> null
                    then cxTextEditNumber.Text := DataSetDoc['NUM_DOC'];
                if DataSetDoc['DATE_DOC'] <> null
                    then cxDateEditDateDoc.Date := DataSetDoc['DATE_DOC'];
                if DataSetDoc['TYPE_DOC'] <> null
                    then cxTextEditTypeDoc.Text := DataSetDoc['TYPE_DOC'];
                pr := 0;
                if DataSetDoc['SUMMA'] <> null
                    then cxTextEditFio.Text := AddNol(DataSetDoc.FieldByName('SUMMA').AsString, pr);
                if DataSetDoc['NOTE'] <> null
                    then cxTextEditNote.Text := DataSetDoc['NOTE'];
            end

        end;
    cxTextEditSumma.TabOrder := 0;
    cxMemoDog.TabOrder       := 1;
    cxButton1.TabOrder       := 2;
    cxButtonClose.TabOrder   := 3;
    cxMRUEditSch.TabOrder    := 4;
    cxMRUEditSm.TabOrder     := 5;
    cxMRUEditRazd.TabOrder   := 6;
    cxMRUEditSt.TabOrder     := 7;
    cxMRUEditKekv.TabOrder   := 8;

end;

procedure TfmBankAddChangeProv.cxMRUEditSmPropertiesButtonClick(
  Sender: TObject);
begin
    if flag <> ShowProv then
    begin
        SelectAll(0, id_kor_sch, -1, id_r, id_stat, id_k, 11);
    end;
end;

procedure TfmBankAddChangeProv.cxMRUEditSchPropertiesButtonClick(
  Sender: TObject);
begin
//    res := GlobalSPR.GetSch(self, Class_Database.Handle, fsNormal, mm.cxDateEdit2.Date, 1, 0, 0);
{if (mm.prih = 0) then
    res := GlobalSPR.GetSchWithOperFilter(self, Class_Database.Handle, fsNormal, mm.cxDateEdit2.Date, 1, 0, id_sch, 1)
else
    res := GlobalSPR.GetSchWithOperFilter(self, Class_Database.Handle, fsNormal, mm.cxDateEdit2.Date, 1, 0, id_sch, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_kor_sch := res[0][0];
            cxMRUEditSch.Text := res[0][3];
            name_kor_sch      := res[0][3];
            cxLabel7.Caption  := res[0][1];
        end;
    end;
 }
    if flag <> ShowProv then
    begin
         SelectAll(0, -1, id_smeta, id_r, id_stat, id_k, 11);
    end;

end;

procedure TfmBankAddChangeProv.SpeedButton1Click(Sender: TObject);
begin
    if flag <> ShowProv then
    begin
        SelectDogovor(0);
    end;
end;


function TfmBankAddChangeProv.SelectDogovor(all_summa : double) : boolean;
var
//    summa_dog : double;
//    res : TAlexDogResult;
//    inputDog : TAlexDogInput;
    inputDog : TDogInput;
    res   : TDogResult;
//    i, j : integer;
//    flag_na_exists_dog, flag_na_exists_sm : boolean;
//    TT : TD;
begin
  //  summa_dog := all_summa;
  //  if Show_Summa_Kassa(summa_dog, '') then
    begin
   //     cxTextEditSumma.Text := FloatToStr(summa_dog);
        SelectDogovor := true;
//        Class_Transaction_Wr.StartTransaction;
        LoadSysData(Class_Transaction_R);
        SYS_ID_USER          := mm.myclass.id_user;
        decimalseparator := ',';
        inputDog              := SYS_DEFAULT_DOG_INPUT;
        inputDog.Owner        := Self;
        inputDog.DBHandle     := Class_Database.Handle;
        inputDog.ReadTrans    := Class_Database.DefaultTransaction.Handle;
        inputDog.WriteTrans   := Class_Transaction_Wr.Handle;
        inputDog.FormStyle    := fsNormal;
        DataSetDoc.Close;
        DataSetDoc.SQLs.SelectSQL.Text := 'select * from BANK_INI';
        DataSetDoc.Open;
        if mm.prih = 1
            then inputDog.id_Group_add := DataSetDoc.FieldByName('ID_GROUP_ADD_PR').AsInteger//61799//1499
            else inputDog.id_Group_add := DataSetDoc.FieldByName('ID_GROUP_ADD_RAS').AsInteger;//61799;//1599;
        inputDog.id_Group     := DataSetDoc.FieldByName('ID_GROUP').AsInteger;//61699;//699;
        DataSetDoc.Close;
        inputDog.Summa        := 1;
        inputDog.filter.bShowFilterForm := true;
        inputDog.isZayav     := false;
        inputDog.arndGetPay  := 1;
        inputDog.shablon_data.bUse     := true;
        inputDog.shablon_data.num      := mm.cxTextEditNum.Text;
        inputDog.shablon_data.date_dog := mm.DateTimePicker2.Date;
        SYS_CURRENT_DATE      := mm.DateTimePicker2.Date;
        inputDog.shablon_data.note     := mm.cxMemo1.Text;
        inputDog.shablon_data.summa    := StrToCurr(mm.cxTextEditSumma.Text);
        inputDog.shablon_data.id_rate_account    := mm.myform.id_account_customer;
        inputDog.shablon_data.id_rate_acc_native := mm.myform.id_ras;
        inputDog.filter.SummaFrom      := StrToCurr(mm.cxTextEditSumma.Text);
        inputDog.filter.SummaTo        := StrToCurr(mm.cxTextEditSumma.Text);
        inputDog.filter.bSumma         := true;
        inputDog.filter.NameCust       := mm.myform.name_cust;
        inputDog.filter.bNameCust      := true;
        inputDog.filter.id_cust        := mm.myform.id_customer;
        inputDog.filter.bID_Cust       := true;

        res := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
//            i := length(res.Smets);
            id_dog_add  := res.id_dog;
            kod_dog_add := res.kod_dog;
            name_cust   := VarToStr(res.name_customer);
            date_dog    := VarToStr(res.d_dog);
            num_dog     := VarToStr(res.n_dog);
            r_dog       := VarToStr(res.regest_num);
            t_dog       := VarToStr(res.name_tip_dog);
            cxMemoDog.Text := Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + VarToStr(res.name_tip_dog)+'; №  '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
{            for j := 0 to i-1 do
            begin
                DataSetSmRazdSt.Close;
                DataSetSmRazdSt.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_SM_RA_ST_KEKV('+IntToStr(res.Smets[j].NumSmeta)+', '+IntToStr(res.Smets[j].NumRazd)+', '+IntToStr(res.Smets[j].NumStat)+', '+IntToStr(990000002)+')';
                DataSetSmRazdSt.Open;
                id_dog_add  := res.id_dog;
                kod_dog_add := res.kod_dog;
                     RxMemoryDataSaveAll.Open;
                     RxMemoryDataSaveAll.Insert;
                     RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := res.Smets[j].NSumma;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := res.Smets[j].NumSmeta;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := res.Smets[j].NumRazd;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := res.Smets[j].NumStat;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := 990000002;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := res.id_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := res.kod_dog;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value := Class_DataSet.FieldByName('SM_KOD').AsInteger;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value  := Class_DataSet.FieldByName('RAZ_KOD').AsInteger;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value := Class_DataSet.FieldByName('ST_KOD').AsInteger;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := Class_DataSet.FieldByName('KEKV_KOD').AsInteger;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := Class_DataSet.FieldByName('SM_KOD').AsString +'\'+ Class_DataSet.FieldByName('RAZ_KOD').AsString +'\'+ Class_DataSet.FieldByName('ST_KOD').AsString +'\'+ Class_DataSet.FieldByName('KEKV_KOD').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := id_osnov_sch;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := name_osnov_sch;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := Class_DataSet.FieldByName('ST_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := Class_DataSet.FieldByName('RAZ_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := Class_DataSet.FieldByName('SM_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := Class_DataSet.FieldByName('KEKV_TITLE').AsString;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value   := '';
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value := 0;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value := title_sch;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := res.name_customer;
                     RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := res.d_dog;
                     RxMemoryDataSaveAll.Post;
           end;
}        end else
         begin
             SelectDogovor := false;
         end;
//        pFIBDataSet1.Close;
    end {else
    begin
        SelectDogovor := false;
    end;}
end;

procedure TfmBankAddChangeProv.EnableVstrechProv(s : boolean);
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

procedure TfmBankAddChangeProv.cxTextEditSummaExit(Sender: TObject);
var
    pr : integer;
begin
    pr := 1;
    cxTextEditSumma.Text := AddNol(cxTextEditSumma.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
    end;
end;

procedure TfmBankAddChangeProv.ActionShowExecute(Sender: TObject);
begin
  ShowMessage('id_sm - '+IntToStr(id_smeta)+#13+
              'id_st - '+IntToStr(id_stat)+#13+
              'id_razd - '+IntToStr(id_r)+#13+
              'id_kekv - '+IntToStr(id_k)+#13+
              'id_korespond_sch - '+IntToStr(id_kor_sch)+#13+
              'name_kor_sch - '+cxMRUEditSch.Text+#13+
              'id_sc - '+IntToStr(id_sch)+#13+
              'id_m - '+IntToStr(id_man)+#13+
              'sum - '+cxTextEditSumma.Text+#13+
              'id_dog - '+IntToStr(id_dog_add)+#13+
              'kod_dog - '+IntToStr(kod_dog_add)+#13+
              'date_d - '+date_dog+#13+
              'num_d - '+num_dog+#13+
              'name_c - '+name_cust+#13+
              'reg_dog - '+r_dog+#13+
              'type_dog - '+t_dog);

end;

procedure TfmBankAddChangeProv.cxTextEditSchKeyPress(Sender: TObject;
  var Key: Char);
begin
    if flag = ShowProv then
    begin
         key := chr(0);
    end;
end;

procedure TfmBankAddChangeProv.FormCreate(Sender: TObject);
begin
    //FormStorage1.RestoreFormPlacement;
end;

procedure TfmBankAddChangeProv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //FormStorage1.SaveFormPlacement;
end;

procedure TfmBankAddChangeProv.cxMRUEditSmExit(Sender: TObject);
begin
//showmessage(sm_str);
    sm_str  := cxMRUEditSm.Text;
    if(sm_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_NAME_BUDG_BY_KOD(:NUM_OBJECT,:ACTUAL_DATE, :TYPE_OBJECT)';
        DataSetKeyInput.ParamByName('NUM_OBJECT').AsString     := sm_str;
        DataSetKeyInput.ParamByName('ACTUAL_DATE').AsDate      := mm.DateTimePicker2.Date;
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

procedure TfmBankAddChangeProv.cxMRUEditRazdExit(Sender: TObject);
begin
    raz_str :=  cxMRUEditRazd.Text;
    if(raz_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_NAME_BUDG_BY_KOD(:NUM_OBJECT,:ACTUAL_DATE, :TYPE_OBJECT)';
        DataSetKeyInput.ParamByName('NUM_OBJECT').AsString     := raz_str;
        DataSetKeyInput.ParamByName('ACTUAL_DATE').AsDate      := mm.DateTimePicker2.Date;
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

procedure TfmBankAddChangeProv.cxMRUEditStExit(Sender: TObject);
begin
    st_str := cxMRUEditSt.Text;
    if(st_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_NAME_ST_BY_KOD(:num_razd,:num_st,:actual_date)';
        DataSetKeyInput.ParamByName('num_razd').AsString     := cxMRUEditRazd.Text;
        DataSetKeyInput.ParamByName('num_st').AsString       := st_str;
        DataSetKeyInput.ParamByName('actual_date').AsDate    := mm.DateTimePicker2.Date;
        DataSetKeyInput.Open;


        if(DataSetKeyInput['TITLE_ST']<>null)  then
           Label4.Text         :=  DataSetKeyInput['TITLE_ST']
        else
           Label4.Text      := '';

        if(DataSetKeyInput['ID_ST']<>null) then
           id_stat             :=  DataSetKeyInput['ID_ST'];
    end;
end;

procedure TfmBankAddChangeProv.cxMRUEditKekvExit(Sender: TObject);
begin
    kekv_str := cxMRUEditKekv.Text;
    if(kekv_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SPR_KEKV_INFO_EX2(:NUM_KEKV,:ACTUAL_DATE)';
        DataSetKeyInput.ParamByName('NUM_KEKV').AsString     := kekv_str;
        DataSetKeyInput.ParamByName('ACTUAL_DATE').AsDate    := mm.DateTimePicker2.Date;
        DataSetKeyInput.Open;


        if(DataSetKeyInput['KEKV_TITLE']<>null)  then
           cxLabel8.Text      :=  DataSetKeyInput['KEKV_TITLE']
        else
           cxLabel8.Text      := '';
        if(DataSetKeyInput['ID_KEKV']<>null) then
           id_k             :=  DataSetKeyInput['ID_KEKV'];
    end;
end;

procedure TfmBankAddChangeProv.cxMRUEditSchExit(Sender: TObject);
begin
    sch_str :=  cxMRUEditSch.Text;
    if(sch_str<>'') then
    begin
        DataSetKeyInput.Close;
        DataSetKeyInput.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SP_MAIN_SCH m where  m.sch_number=:sch_str and m.date_beg<=:date_beg_str and m.date_end>=:date_beg_str';
        DataSetKeyInput.Prepare;
        DataSetKeyInput.ParamByName('sch_str').AsString     := sch_str;
        DataSetKeyInput.ParamByName('date_beg_str').AsDate  := mm.DateTimePicker2.Date;
        DataSetKeyInput.Open;


        if(DataSetKeyInput['sch_title']<>null)  then
           cxLabel7.Text      :=  DataSetKeyInput['sch_title']
        else
           cxLabel7.Text      := '';
        if(DataSetKeyInput['ID_sch']<>null) then
           id_kor_sch             :=  DataSetKeyInput['ID_sch'];
    end;
end;

end.
