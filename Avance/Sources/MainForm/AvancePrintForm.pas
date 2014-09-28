unit AvancePrintForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, DB, FIBDataSet, pFIBDataSet, ExtCtrls, StdCtrls, cxButtons, MainForm, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxSpinEdit, cxCheckBox, DateUtils, pFIBDatabase,
  cxLabel, Un_R_file_Alex, GlobalSPR, FIBDatabase, FR_DSet, FR_DBSet,
  FR_Class, frxClass, frxDBSet, Placemnt, frxDesgn, cxButtonEdit;

type
  TfmMode = (Jornal4, Edit, Sp, SpEdit);

  TfmPrintForm = class(TForm)
    cxButtonClose: TcxButton;
    cxButtonPrint: TcxButton;
    Bevel1: TBevel;
    PrintDialog1: TPrintDialog;
    cxCheckBox1: TcxCheckBox;
    cxSpinEdit1: TcxSpinEdit;
    cxComboBoxMonth: TcxComboBox;
    cxComboBoxJornal: TcxComboBox;
    DataSetJornal: TpFIBDataSet;
    DataSet: TpFIBDataSet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    DataSetSUMMA_DEBET: TFIBBCDField;
    DataSetSCH_TITLE: TFIBStringField;
    DataSetDATE_PROV_DEBET: TFIBDateField;
    DataSetNAME_RECVIZITI_DEBET: TFIBStringField;
    DataSetNAME_RECVIZITI_KREDIT: TFIBStringField;
    DataSetDATE_PROV_KREDIT: TFIBDateField;
    DataSetFAMILIA: TFIBStringField;
    DataSetIMYA: TFIBStringField;
    DataSetOTCHESTVO: TFIBStringField;
    DataSetBIRTHDAY: TFIBDateField;
    DataSetTIN: TFIBStringField;
    DataSetNUM_DOC_DEBET: TFIBStringField;
    DataSetNUM_DOC_KREDIT: TFIBStringField;
    DataSetDEBET_SCH: TFIBStringField;
    DataSetKREDIT_SCH: TFIBStringField;
    DataSetOST_ALL_DEBET: TFIBBCDField;
    DataSetOST_ALL_KREDIT: TFIBBCDField;
    DataSetOST_DEBET: TFIBBCDField;
    DataSetOST_KREDIT: TFIBBCDField;
    DataSetFLAG_FIO: TFIBIntegerField;
    DataSetFIO: TFIBStringField;
    DataSetOSN_SCH: TFIBStringField;
    DataSetSUMMA_KREDIT: TFIBBCDField;
    DataSetDATE_OST: TFIBDateField;
    DataSetCOUNT_DOC: TFIBIntegerField;
    DataSetNAME_PREDPR: TFIBStringField;
    DataSetR_J4: TFIBBCDField;
    DataSetLEVEL_: TFIBIntegerField;
    DataSetR_ID_MAN: TFIBBCDField;
    DataSetR_ID_SCH: TFIBBCDField;
    DataSetR_ID_SM: TFIBBCDField;
    DataSetR_ID_ST: TFIBBCDField;
    DataSetR_ID_RAZ: TFIBBCDField;
    DataSetR_ID_KEKV: TFIBBCDField;
    DataSetID_LEVE: TFIBIntegerField;
    DataSetLINKTO_LEVE: TFIBIntegerField;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    DataSetKorSch: TpFIBDataSet;
    DataSetKorSchNAME_SCH: TFIBStringField;
    DataSetKorSchVH_DEB: TFIBBCDField;
    DataSetKorSchVH_KRED: TFIBBCDField;
    DataSetKorSchOBOR_DEB: TFIBBCDField;
    DataSetKorSchOBOR_KRED: TFIBBCDField;
    DataSetKorSchVIH_DEB: TFIBBCDField;
    DataSetKorSchVIH_KRED: TFIBBCDField;
    DataSetKorSchR_LEVEL: TFIBIntegerField;
    DataSetKorSchNAME_PREDPR: TFIBStringField;
    DataSetKorSchR_ID_SCH: TFIBBCDField;
    DataSetKorSchKOD_SCH: TFIBStringField;
    DataSetKorSchSCH_TITLE: TFIBStringField;
    DataSetKorSchKR_ID_SCH: TFIBBCDField;
    DataSetSm: TpFIBDataSet;
    DataSetSmSUMMA_DEBET: TFIBBCDField;
    DataSetSmSCH_TITLE: TFIBStringField;
    DataSetSmDEBET_SCH: TFIBStringField;
    DataSetSmOST_ALL_DEBET: TFIBBCDField;
    DataSetSmOST_ALL_KREDIT: TFIBBCDField;
    DataSetSmOST_DEBET: TFIBBCDField;
    DataSetSmOST_KREDIT: TFIBBCDField;
    DataSetSmFIO: TFIBStringField;
    DataSetSmOSN_SCH: TFIBStringField;
    DataSetSmSUMMA_KREDIT: TFIBBCDField;
    DataSetSmNAME_PREDPR: TFIBStringField;
    DataSetSmR_J4: TFIBBCDField;
    DataSetSmR_ID_MAN: TFIBBCDField;
    DataSetSmR_ID_SCH: TFIBBCDField;
    DataSetSmR_ID_SM: TFIBBCDField;
    DataSetSmR_ID_ST: TFIBBCDField;
    DataSetSmR_ID_RAZ: TFIBBCDField;
    DataSetSmR_ID_KEKV: TFIBBCDField;
    DataSetSmID_LEVE: TFIBIntegerField;
    DataSetSmLINKTO_LEVE: TFIBIntegerField;
    DataSetSmSM_TITLE: TFIBStringField;
    DataSetSmRZ_TITLE: TFIBStringField;
    DataSetSmST_TITLE: TFIBStringField;
    DataSetSmKEKV_TITLE: TFIBStringField;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DataSetTAB_NUM: TFIBIntegerField;
    DataSetALL_SUM_VH_OST_D: TFIBBCDField;
    DataSetALL_SUM_VH_OST_K: TFIBBCDField;
    DataSetALL_SUM_VIH_OST_K: TFIBBCDField;
    DataSetALL_SUM_VIH_OST_D: TFIBBCDField;
    DataSetALL_SUMM_OB_DEB: TFIBBCDField;
    DataSetALL_SUMM_OB_KRED: TFIBBCDField;
    TransactionWr: TpFIBTransaction;
    DataSetLang: TpFIBDataSet;
    cxCheckBox4: TcxCheckBox;
    frxDBDatasetMemorial: TfrxDBDataset;
    pFIBDataSet1: TpFIBDataSet;
    cxCheckBox5: TcxCheckBox;
    DataSetRasshifr: TfrxDBDataset;
    DataSetKorSch1: TpFIBDataSet;
    DataSetKorSch1NAME_SCH: TFIBStringField;
    DataSetKorSch1VH_DEB: TFIBBCDField;
    DataSetKorSch1VH_KRED: TFIBBCDField;
    DataSetKorSch1OBOR_DEB: TFIBBCDField;
    DataSetKorSch1OBOR_KRED: TFIBBCDField;
    DataSetKorSch1VIH_DEB: TFIBBCDField;
    DataSetKorSch1VIH_KRED: TFIBBCDField;
    DataSetKorSch1R_LEVEL: TFIBIntegerField;
    DataSetKorSch1NAME_PREDPR: TFIBStringField;
    DataSetKorSch1R_ID_SCH: TFIBBCDField;
    DataSetKorSch1KOD_SCH: TFIBStringField;
    DataSetKorSch1SCH_TITLE: TFIBStringField;
    DataSetKorSch1KR_ID_SCH: TFIBBCDField;
    DataSetKorSch1VH_DEB1: TFIBBCDField;
    DataSetKorSch1VH_KRED1: TFIBBCDField;
    DataSetKorSch1VIH_DEB1: TFIBBCDField;
    DataSetKorSch1VIH_KRED1: TFIBBCDField;
    DataSetKorSch1R_ID_SCH1: TFIBBCDField;
    DataSetKorSch1KOD_SCH1: TFIBStringField;
    FormStorage1: TFormStorage;
    cxComboBoxMonthEnd: TcxComboBox;
    cxLabel3: TcxLabel;
    cxSpinEdit2: TcxSpinEdit;
    cxLabel4: TcxLabel;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxDBDatasetKorSch: TfrxDBDataset;
    frxDBDatasetSm: TfrxDBDataset;
    DataSetSigns: TpFIBDataSet;
    frxReport1: TfrxReport;
    ButtonEditBuh: TcxButtonEdit;
    ButtonEditFioCheck: TcxButtonEdit;
    ButtonEditGlBuhg: TcxButtonEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    DataSetIni: TpFIBDataSet;
    frxReport2: TfrxReport;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
    procedure DataSetDATE_OSTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cxComboBoxJornalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonEditBuhPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditFioCheckPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditGlBuhgPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Get_Fio_post(id_man :int64; var name_post_out, fio_small_buhg_out,fio_full_buhg_out : string);
  private
    n : TfmMode;
    myform : TfmAvanceMainForm;
//    Ind1 : array [1..2] of array of Variant;
    Ind1 : array of Int64;
    id_man_buh, id_man_check, id_man_gl_buhg : int64;
    name_post_buhg, name_post_check, name_post_gl_buhg,fio_small_buhg,fio_small_check,fio_small_gl_buhg,fio_full_buhg,fio_full_check,fio_full_gl_buhg :string;
  public
    id_jornal : int64;
    constructor Create(m : TfmMode; db : TpFIBDatabase; Tr : TpFIBTransaction; mform : TfmAvanceMainForm); reintroduce; overload;
    destructor Destroy; override;
  end;


implementation
uses ACCMGMT, ProgressFormAvance,Un_lo_file_Alex;

{$R *.dfm}
constructor TfmPrintForm.Create(m : TfmMode; db : TpFIBDatabase; Tr : TpFIBTransaction; mform : TfmAvanceMainForm);
var
    i, item_index, id_user : integer;
    name_post, fio_small,fio_full : string;
begin
    inherited Create(nil);
    n := m;
    myform := mform;
    Database                    := db;
    Transaction.DefaultDatabase := Database;

    FormStorage1.RestoreFormPlacement;
    
    DataSetJornal.Database      := Database;
    DataSetJornal.Transaction   := Transaction;
    DataSetLang.Database        := Database;
    DataSetLang.Transaction     := Transaction;

    pFIBDataSet1.Database       := Database;
    pFIBDataSet1.Transaction    := Transaction;

    DataSetSigns.Database       := Database;
    DataSetSigns.Transaction    := Transaction;

    DataSetIni.Database       := Database;
    DataSetIni.Transaction    := Transaction;

    Transaction.StartTransaction;
    if m = Jornal4 then
    begin
    {загрузка журнала}

    cxComboBoxMonth.Properties.Items.Insert(0, Un_R_file_Alex.MY_JANUARY);
    cxComboBoxMonth.Properties.Items.Insert(1, Un_R_file_Alex.MY_FEBRIARY);
    cxComboBoxMonth.Properties.Items.Insert(2, Un_R_file_Alex.MY_MARCH);
    cxComboBoxMonth.Properties.Items.Insert(3, Un_R_file_Alex.MY_APRILE);
    cxComboBoxMonth.Properties.Items.Insert(4, Un_R_file_Alex.MY_MAY);
    cxComboBoxMonth.Properties.Items.Insert(5, Un_R_file_Alex.MY_JUNE);
    cxComboBoxMonth.Properties.Items.Insert(6, Un_R_file_Alex.MY_JULY);
    cxComboBoxMonth.Properties.Items.Insert(7, Un_R_file_Alex.MY_AUGUST);
    cxComboBoxMonth.Properties.Items.Insert(8, Un_R_file_Alex.MY_SEPTEMBER);
    cxComboBoxMonth.Properties.Items.Insert(9, Un_R_file_Alex.MY_OCTOBER);
    cxComboBoxMonth.Properties.Items.Insert(10, Un_R_file_Alex.MY_NOVEMBER);
    cxComboBoxMonth.Properties.Items.Insert(11, Un_R_file_Alex.MY_DESEMBER);

    cxComboBoxMonthEnd.Properties.Items.Insert(0, Un_R_file_Alex.MY_JANUARY);
    cxComboBoxMonthEnd.Properties.Items.Insert(1, Un_R_file_Alex.MY_FEBRIARY);
    cxComboBoxMonthEnd.Properties.Items.Insert(2, Un_R_file_Alex.MY_MARCH);
    cxComboBoxMonthEnd.Properties.Items.Insert(3, Un_R_file_Alex.MY_APRILE);
    cxComboBoxMonthEnd.Properties.Items.Insert(4, Un_R_file_Alex.MY_MAY);
    cxComboBoxMonthEnd.Properties.Items.Insert(5, Un_R_file_Alex.MY_JUNE);
    cxComboBoxMonthEnd.Properties.Items.Insert(6, Un_R_file_Alex.MY_JULY);
    cxComboBoxMonthEnd.Properties.Items.Insert(7, Un_R_file_Alex.MY_AUGUST);
    cxComboBoxMonthEnd.Properties.Items.Insert(8, Un_R_file_Alex.MY_SEPTEMBER);
    cxComboBoxMonthEnd.Properties.Items.Insert(9, Un_R_file_Alex.MY_OCTOBER);
    cxComboBoxMonthEnd.Properties.Items.Insert(10, Un_R_file_Alex.MY_NOVEMBER);
    cxComboBoxMonthEnd.Properties.Items.Insert(11, Un_R_file_Alex.MY_DESEMBER);


    id_user := myform.id_user;
    DataSetJornal.Close;
    DataSetJornal.SQLs.SelectSQL.Text := 'SELECT * FROM J4_CHOOSE_SYS_BY_ID('+IntToStr(id_user)+')';
    DataSetJornal.Open;
    DataSetJornal.FetchAll;

    If DataSetJornal.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.J4_WARNING_LOAD_JORNAL), PChar(Un_R_file_Alex.J4_SP_RAZDELENIE_MESSAGA), 16);
        close;
    end;

    SetLength(Ind1, DataSetJornal.RecordCount);

    DataSetJornal.First;
    i := 0;
    item_index := 0;
    cxComboBoxJornal.Properties.Items.Clear;
    While not DataSetJornal.Eof do
    begin
        Ind1[DataSetJornal.RecNo - 1] := TFIBBCDField(DataSetJornal.FieldByName('ID_J4_SP_JO')).AsInt64;
        cxComboBoxJornal.Properties.Items.Add(DataSetJornal.FieldByName('SHORT_NAME').AsString);
        IF DataSetJornal.FieldByName('SYSTEM_OPEN').Asinteger = 1 THEN
        begin
            id_jornal        := TFIBBCDField(DataSetJornal.FieldByName('ID_J4_SP_JO')).AsInt64;
            item_index       := i;
        end;
        inc(i);
        DataSetJornal.Next;
    end;
    DataSetJornal.Close;

    DataSetIni.Close;
    DataSetIni.Sqls.SelectSQL.Text := 'select * from J4_INI';
    DataSetIni.Open;
    if DataSetIni['ID_MEN_CHECK']<>null then
          id_man_check   := strtoint64(DataSetIni.fbn('ID_MEN_CHECK').AsString)
    else  id_man_check   := 0;
    if DataSetIni['ID_MEN_GL_BUHG']<>null then
          id_man_gl_buhg := strtoint64(DataSetIni.fbn('ID_MEN_GL_BUHG').AsString)
    else  id_man_gl_buhg   := 0;

    DataSetSigns.Close;
    DataSetSigns.SQLs.SelectSQL.Text := 'select p.id_man from users u, private_cards pc, people p where u.id_user_ext = pc.id_pcard and p.id_man = pc.id_man and u.id_user='+IntToStr(id_user);
    DataSetSigns.Open;
    if DataSetSigns['id_man']<>null then
          id_man_buh  := strtoint64(DataSetSigns.fbn('id_man').AsString)
    else  id_man_buh  := 0;

    Get_Fio_post(id_man_buh,name_post, fio_small,fio_full);
    name_post_buhg    := name_post;
    fio_small_buhg    := fio_small;
    fio_full_buhg     := fio_full;

    Get_Fio_post(id_man_check,name_post, fio_small,fio_full);
    name_post_check    := name_post;
    fio_small_check    := fio_small;
    fio_full_check     := fio_full;

    Get_Fio_post(id_man_gl_buhg,name_post, fio_small,fio_full);
    name_post_gl_buhg    := name_post;
    fio_small_gl_buhg    := fio_small;
    fio_full_gl_buhg     := fio_full;

    ButtonEditBuh.Text      := fio_full_buhg;
    ButtonEditFioCheck.Text := fio_full_check;
    ButtonEditGlBuhg.Text   := fio_full_gl_buhg;


    cxComboBoxJornal.ItemIndex := item_index;
    cxComboBoxJornal.OnClick := cxComboBoxJornalClick;
    DataSetJornal.Transaction.Commit;
    cxSpinEdit1.Value             := YearOf(date);
    cxComboBoxMonth.ItemIndex     := MonthOf(date)-1;
    cxSpinEdit2.Value             := YearOf(date);
    cxComboBoxMonthEnd.ItemIndex  := MonthOf(date)-1;
    end;

    cxLabel1.Caption               := Un_R_file_Alex.J4_PRINT_SLECT_JORNAL;
    cxButtonClose.Caption          := Un_R_file_Alex.MY_BUTTON_CLOSE;
    cxButtonPrint.Caption          := Un_R_file_Alex.MY_BUTTON_PRINT;
    Caption                        := Un_R_file_Alex.KASSA_PRINT_CAPTION;
    cxCheckBox1.Properties.Caption := Un_R_file_Alex.J4_PRINT_J4;
    cxLabel2.Caption               := Un_R_file_Alex.J4_OSTATOK_FORM_YEAR;
    cxLabel3.Caption               := Un_R_file_Alex.J4_OSTATOK_FORM_YEAR;
    cxCheckBox2.Properties.Caption := Un_R_file_Alex.J4_JORNAL_KOR_SCH;
    cxCheckBox3.Properties.Caption := Un_R_file_Alex.J4_JORNAL_SMETA_PRINT;
    cxCheckBox5.Properties.Caption := Un_R_file_Alex.J4_JORNAL_RASHIFR_PRINT;
    cxLabel5.Caption               := Un_R_file_Alex.J4_BUHG;
    cxLabel6.Caption               := Un_R_file_Alex.J4_CHECK;
    cxLabel7.Caption               := Un_R_file_Alex.J4_GL_BUHG;

    cxCheckBox4.Properties.Caption := Un_R_file_Alex.BANK_PRINT_MEMORIAL_ORDER;

end;

procedure TfmPrintForm.Get_Fio_post(id_man :int64; var name_post_out, fio_small_buhg_out,fio_full_buhg_out : string);
begin
    DataSetSigns.Close;
    DataSetSigns.SQLs.SelectSQL.Text := 'SELECT * FROM J4_GET_INFO_SIGN('+IntToStr(id_man)+','''+datetostr(date)+''')';
    DataSetSigns.Open;

    name_post_out          := DataSetSigns.FBN('name_post_buhg').AsString;
    fio_small_buhg_out     := DataSetSigns.FBN('fio_small_buhg').AsString;
    fio_full_buhg_out      := DataSetSigns.FBN('fio_full_buhg').AsString;

end;

destructor TfmPrintForm.Destroy;
begin

  inherited;
end;


procedure TfmPrintForm.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfmPrintForm.cxButtonPrintClick(Sender: TObject);
var
    d,d2 : TDate;
    T : TfmProgressFormAvance;
    id_lang : integer;
begin
    if n = Jornal4 then
    begin
        pFIBDataSet1.Close;
        pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
        pFIBDataSet1.Open;

        DataSetLang.Close;
        DataSetLang.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SYS_DATA';
        DataSetLang.Open;
        id_lang := DataSetLang.FBN('ID_LANGUAGE').AsInteger;
        DataSetLang.Close;
        if(cxSpinEdit1.Value>cxSpinEdit2.Value) then
        begin
            showmessage(Un_R_file_Alex.J4_WARNING_DATE_BEG_END);
            exit;
        end;
        if  (cxComboBoxMonth.ItemIndex>cxComboBoxMonthEnd.ItemIndex) then
        begin
             if(cxSpinEdit1.Value>=cxSpinEdit2.Value) then
             begin
                 showmessage(Un_R_file_Alex.J4_WARNING_DATE_BEG_END);
                 exit;
             end;
        end;
         if cxCheckBox1.Checked then
         begin
             T := TfmProgressFormAvance.Create(self, wait_, Un_R_file_Alex.WAIT_OTBOR_D);
             T.Show;
             if cxComboBoxMonth.ItemIndex < 10
                 then d := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
                 else d := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
             if cxComboBoxMonthEnd.ItemIndex < 10
                 then d2 := StrToDate('01.0'+IntTostr(cxComboBoxMonthEnd.ItemIndex+1)+'.'+IntToStr(cxSpinEdit2.Value))
                 else d2 := StrToDate('01.'+IntTostr(cxComboBoxMonthEnd.ItemIndex+1)+'.'+IntToStr(cxSpinEdit2.Value));

             TransactionWr.DefaultDatabase := Database;
             DataSet.Database              := Database;
             DataSet.Transaction           := TransactionWr;
             TransactionWr.StartTransaction;
             DataSet.Close;
             DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM J4_OTCHET_MONTH('''+ DateToStr(d) +''', '''+ DateToStr(d2) +''', '+intToStr(id_jornal)+', '+intToStr(0)+', '+intToStr(myform.id_user)+')';

             DataSet.Open;

             T.Free;
             pFIBDataSet1.Close;
             pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
             pFIBDataSet1.Open;
             if id_lang = 0 then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40004_ukr.fr3');
             frxReport2.Variables['name_shab']    := QuotedStr(pFIBDataSet1.fbn('NAME_JORNAL').AsString);

             frxReport2.Variables['name_machine'] := QuotedStr(GetComputerNetName);
             frxReport2.Variables['month_oo']     := QuotedStr(cxComboBoxMonth.Text);
             frxReport2.Variables['month_end']    := QuotedStr(cxComboBoxMonthEnd.Text);
             frxReport2.Variables['year_oo']      := IntToStr(cxSpinEdit1.Value);
             frxReport2.Variables['year_end']     := IntToStr(cxSpinEdit2.Value);
             frxReport2.Variables['fio_b']        := QuotedStr(GetUserFIO);;
             frxReport2.Variables['name_post_b']  := QuotedStr(name_post_buhg);
             frxReport2.Variables['name_post_c']  := QuotedStr(name_post_check);
             frxReport2.Variables['name_post_g_b']:= QuotedStr(name_post_gl_buhg);
             frxReport2.Variables['fio_small_b']  := QuotedStr(fio_small_buhg);
             frxReport2.Variables['fio_small_c']  := QuotedStr(fio_small_check);
             frxReport2.Variables['fio_small_g_b']:= QuotedStr(fio_small_gl_buhg);
             frxReport2.Variables['fio_full_b']   := QuotedStr(fio_full_buhg);
             frxReport2.Variables['fio_full_c']   := QuotedStr(fio_full_check);
             frxReport2.Variables['fio_full_g_b'] := QuotedStr(fio_full_gl_buhg);
             frxReport2.Variables['J4_MO_PRINT_ONLY_VIKON'] := pFIBDataSet1['J4_MO_PRINT_ONLY_VIKON'];


             frxReport2.PrepareReport(true);
             //frxReport2.DesignReport;
             frxReport2.ShowReport(true);
             pFIBDataSet1.Close;
             TransactionWr.Commit;
         end;
         if cxCheckBox2.Checked then
         begin
             T := TfmProgressFormAvance.Create(self, wait_, Un_R_file_Alex.WAIT_OTBOR_D);
             T.Show;
             if cxComboBoxMonth.ItemIndex < 10
                 then d := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
                 else d := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
             if cxComboBoxMonthEnd.ItemIndex < 10
                 then d2 := StrToDate('01.0'+IntTostr(cxComboBoxMonthEnd.ItemIndex+1)+'.'+IntToStr(cxSpinEdit2.Value))
                 else d2 := StrToDate('01.'+IntTostr(cxComboBoxMonthEnd.ItemIndex+1)+'.'+IntToStr(cxSpinEdit2.Value));
             TransactionWr.DefaultDatabase       := Database;
             DataSetKorSch.Database              := Database;
             DataSetKorSch.Transaction           := TransactionWr;
             TransactionWr.StartTransaction;

             DataSetKorSch.Close;
             DataSetKorSch.SQLs.SelectSQL.Text   := 'SELECT * FROM J4_OTCHET_KOR_SCH('+intToStr(id_jornal)+', '''+ DateToStr(d) +''', '''+ DateToStr(d2) +''')';
             DataSetKorSch.Open;
             T.Free;

             pFIBDataSet1.Close;
             pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
             pFIBDataSet1.Open;

             if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40002_ukr.fr3');
             frxReport1.Variables['name_machine'] := QuotedStr(GetComputerNetName);
             frxReport1.Variables['fio']          := QuotedStr(GetUserFIO);
             frxReport1.Variables['id_us']        := IntToStr(GetUserId);
             frxReport1.Variables['mon']          := QuotedStr(cxComboBoxMonth.Text);
             frxReport1.Variables['mon_end']      := QuotedStr(cxComboBoxMonthEnd.Text);
             frxReport1.Variables['year_']        := IntToStr(cxSpinEdit1.Value);
             frxReport1.Variables['year_end']     := IntToStr(cxSpinEdit2.Value);
             frxReport1.Variables['name_post_b']  := QuotedStr(name_post_buhg);
             frxReport1.Variables['name_post_c']  := QuotedStr(name_post_check);
             frxReport1.Variables['name_post_g_b']:= QuotedStr(name_post_gl_buhg);
             frxReport1.Variables['fio_small_b']  := QuotedStr(fio_small_buhg);
             frxReport1.Variables['fio_small_c']  := QuotedStr(fio_small_check);
             frxReport1.Variables['fio_small_g_b']:= QuotedStr(fio_small_gl_buhg);
             frxReport1.Variables['fio_full_b']   := QuotedStr(fio_full_buhg);
             frxReport1.Variables['fio_full_c']   := QuotedStr(fio_full_check);
             frxReport1.Variables['fio_full_g_b'] := QuotedStr(fio_full_gl_buhg);
             frxReport1.Variables['J4_MO_PRINT_ONLY_VIKON'] := pFIBDataSet1['J4_MO_PRINT_ONLY_VIKON'];

             frxReport1.PrepareReport(true);
             frxReport1.ShowReport(true);

             TransactionWr.Commit;
         end;
         if cxCheckBox5.Checked then
         begin
             T := TfmProgressFormAvance.Create(self, wait_, Un_R_file_Alex.WAIT_OTBOR_D);
             T.Show;
             if cxComboBoxMonth.ItemIndex < 10
                 then d := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
                 else d := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
             if cxComboBoxMonthEnd.ItemIndex < 10
                 then d2 := StrToDate('01.0'+IntTostr(cxComboBoxMonthEnd.ItemIndex+1)+'.'+IntToStr(cxSpinEdit2.Value))
                 else d2 := StrToDate('01.'+IntTostr(cxComboBoxMonthEnd.ItemIndex+1)+'.'+IntToStr(cxSpinEdit2.Value));
             TransactionWr.DefaultDatabase := Database;
             DataSetKorSch1.Database        := Database;
             DataSetKorSch1.Transaction     := TransactionWr;
             TransactionWr.StartTransaction;
             DataSetKorSch1.Close;
             DataSetKorSch1.SQLs.SelectSQL.Text   := 'SELECT * FROM J4_OTCHET_KOR_SCH_1('+intToStr(id_jornal)+', '''+ DateToStr(d) +''', '''+ DateToStr(d2) +''')';
             DataSetKorSch1.Open;
             T.Free;
            // if id_lang = 1 then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40013.fr3');
             if id_lang = 0 then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40015_ukr.fr3');

             pFIBDataSet1.Close;
             pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
             pFIBDataSet1.Open;

             frxReport2.Variables['name_machine']:= QuotedStr(GetComputerNetName);
             frxReport2.Variables['id_us']       := IntToStr(GetUserId);
             frxReport2.Variables['mon']         := QuotedStr(cxComboBoxMonth.Text);
             frxReport2.Variables['mon_end']     := QuotedStr(cxComboBoxMonthEnd.Text);
             frxReport2.Variables['year_']       := IntToStr(cxSpinEdit1.Value);
             frxReport2.Variables['year_end']    := IntToStr(cxSpinEdit2.Value);
             frxReport2.Variables['fio']         := QuotedStr(GetUserFIO);
             frxReport2.Variables['name_post_b']  := QuotedStr(name_post_buhg);
             frxReport2.Variables['name_post_c']  := QuotedStr(name_post_check);
             frxReport2.Variables['name_post_g_b']:= QuotedStr(name_post_gl_buhg);
             frxReport2.Variables['fio_small_b']  := QuotedStr(fio_small_buhg);
             frxReport2.Variables['fio_small_c']  := QuotedStr(fio_small_check);
             frxReport2.Variables['fio_small_g_b']:= QuotedStr(fio_small_gl_buhg);
             frxReport2.Variables['fio_full_b']   := QuotedStr(fio_full_buhg);
             frxReport2.Variables['fio_full_c']   := QuotedStr(fio_full_check);
             frxReport2.Variables['fio_full_g_b'] := QuotedStr(fio_full_gl_buhg);
             frxReport2.Variables['J4_MO_PRINT_ONLY_VIKON'] := pFIBDataSet1['J4_MO_PRINT_ONLY_VIKON'];

             frxReport2.PrepareReport(true);
             //frxReport2.DesignReport;
             frxReport2.ShowReport(true);
             TransactionWr.Commit;
         end;
         if cxCheckBox3.Checked then
         begin
             T := TfmProgressFormAvance.Create(self, wait_, Un_R_file_Alex.WAIT_OTBOR_D);
             T.Show;
             if cxComboBoxMonth.ItemIndex < 10
                 then d := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
                 else d := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
             if cxComboBoxMonthEnd.ItemIndex < 10
                 then d2 := StrToDate('01.0'+IntTostr(cxComboBoxMonthEnd.ItemIndex+1)+'.'+IntToStr(cxSpinEdit2.Value))
                 else d2 := StrToDate('01.'+IntTostr(cxComboBoxMonthEnd.ItemIndex+1)+'.'+IntToStr(cxSpinEdit2.Value));
             TransactionWr.DefaultDatabase := Database;
             DataSetSm.Database              := Database;
             DataSetSm.Transaction           := TransactionWr;
             TransactionWr.StartTransaction;

             DataSetSm.Close;
             DataSetSm.SQLs.SelectSQL.Text := 'SELECT * FROM J4_OTCHET_SM('''+ DateToStr(d) +''', '''+ DateToStr(d2) +''', '+intToStr(id_jornal)+')';
             DataSetSm.Open;
             T.Free;
             
             pFIBDataSet1.Close;
             pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
             pFIBDataSet1.Open;

             if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40003_ukr.fr3');
             frxReport1.Variables['name_machine'] := QuotedStr(GetComputerNetName);
             frxReport1.Variables['fio_us']       := QuotedStr(GetUserFIO);
             frxReport1.Variables['id_us']        := inttostr(GetUserId);
             frxReport1.Variables['mon']          := QuotedStr(cxComboBoxMonth.Text);
             frxReport1.Variables['mon_end']      := QuotedStr(cxComboBoxMonthEnd.Text);
             frxReport1.Variables['year_']        := IntToStr(cxSpinEdit1.Value);
             frxReport1.Variables['year_end']     := IntToStr(cxSpinEdit2.Value);
             frxReport1.Variables['name_post_b']  := QuotedStr(name_post_buhg);
             frxReport1.Variables['name_post_c']  := QuotedStr(name_post_check);
             frxReport1.Variables['name_post_g_b']:= QuotedStr(name_post_gl_buhg);
             frxReport1.Variables['fio_small_b']  := QuotedStr(fio_small_buhg);
             frxReport1.Variables['fio_small_c']  := QuotedStr(fio_small_check);
             frxReport1.Variables['fio_small_g_b']:= QuotedStr(fio_small_gl_buhg);
             frxReport1.Variables['fio_full_b']   := QuotedStr(fio_full_buhg);
             frxReport1.Variables['fio_full_c']   := QuotedStr(fio_full_check);
             frxReport1.Variables['fio_full_g_b'] := QuotedStr(fio_full_gl_buhg);
             frxReport1.Variables['J4_MO_PRINT_ONLY_VIKON'] := pFIBDataSet1['J4_MO_PRINT_ONLY_VIKON'];

             frxReport1.PrepareReport(true);
             //frxReport1.DesignReport;
             frxReport1.ShowReport(true);


             TransactionWr.Commit;
         end;
         if cxCheckBox4.Checked then
         begin
             T := TfmProgressFormAvance.Create(self, wait_, Un_R_file_Alex.WAIT_OTBOR_D);
             T.Show;
             if cxComboBoxMonth.ItemIndex < 10
                 then d := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
                 else d := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
             if cxComboBoxMonthEnd.ItemIndex < 10
                 then d2 := StrToDate('01.0'+IntTostr(cxComboBoxMonthEnd.ItemIndex+1)+'.'+IntToStr(cxSpinEdit2.Value))
                 else d2 := StrToDate('01.'+IntTostr(cxComboBoxMonthEnd.ItemIndex+1)+'.'+IntToStr(cxSpinEdit2.Value));
             TransactionWr.DefaultDatabase := Database;
             DataSet.Database              := Database;
             DataSet.Transaction           := TransactionWr;
             TransactionWr.StartTransaction;
             DataSet.Close;
             DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM J4_OTCHET_MONTH('''+ DateToStr(d) +''', '''+ DateToStr(d2) +''', '+intToStr(id_jornal)+', '+intToStr(0)+', '+intToStr(myform.id_user)+') where FLAG_FIO = ' + IntToStr(1) + ' ';

             DataSet.Open;
             T.Free;

             pFIBDataSet1.Close;
             pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
             pFIBDataSet1.Open;

             if id_lang = 1 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40013.fr3');
             if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40013_ukr.fr3');

             frxReport1.Variables['comp']         := QuotedStr(GetComputerNetName);
             frxReport1.Variables['id_user']      := IntToStr(GetUserId);
             frxReport1.Variables['month_oo']     := QuotedStr(cxComboBoxMonth.Text);
             frxReport1.Variables['month_end']    := QuotedStr(cxComboBoxMonthEnd.Text);
             frxReport1.Variables['year_oo']      := IntToStr(cxSpinEdit1.Value);
             frxReport1.Variables['year_end']     := IntToStr(cxSpinEdit2.Value);
             frxReport1.Variables['name_post_b']  := QuotedStr(name_post_buhg);
             frxReport1.Variables['name_post_c']  := QuotedStr(name_post_check);
             frxReport1.Variables['name_post_g_b']:= QuotedStr(name_post_gl_buhg);
             frxReport1.Variables['fio_small_b']  := QuotedStr(fio_small_buhg);
             frxReport1.Variables['fio_small_c']  := QuotedStr(fio_small_check);
             frxReport1.Variables['fio_small_g_b']:= QuotedStr(fio_small_gl_buhg);
             frxReport1.Variables['fio_full_b']   := QuotedStr(fio_full_buhg);
             frxReport1.Variables['fio_full_c']   := QuotedStr(fio_full_check);
             frxReport1.Variables['fio_full_g_b'] := QuotedStr(fio_full_gl_buhg);
             frxReport1.Variables['J4_MO_PRINT_ONLY_VIKON'] := pFIBDataSet1['J4_MO_PRINT_ONLY_VIKON'];
//             frxReport1.Variables['fio_b']        := GetUserFIO;;

             frxReport1.PrepareReport(true);
             //frxReport1.DesignReport;
             frxReport1.ShowReport(true);
             TransactionWr.Commit;
         end;


    end;

end;

procedure TfmPrintForm.DataSetDATE_OSTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if DataSetDATE_OST.IsNull then text := '' else text := DataSetDATE_OST.AsString;
end;

procedure TfmPrintForm.cxComboBoxJornalClick(Sender: TObject);
begin
    if id_jornal <> Ind1[cxComboBoxJornal.ItemIndex] then
        id_jornal        := Ind1[cxComboBoxJornal.ItemIndex];
end;

procedure TfmPrintForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FormStorage1.SaveFormPlacement;
end;

procedure TfmPrintForm.ButtonEditBuhPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    res : Variant;
begin
    res := Un_lo_file_Alex.MY_GetManEx(self, Database.Handle, false, false, id_man_buh);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            if id_man_buh <> res[0] then
            begin
                id_man_buh         := res[0];
                ButtonEditBuh.Text := res[1];
                fio_full_buhg      := res[1];
            end;
        end;
    end;
end;

procedure TfmPrintForm.ButtonEditFioCheckPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    res := Un_lo_file_Alex.MY_GetManEx(self, Database.Handle, false, false, id_man_check);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            if id_man_check <> res[0] then
            begin
                id_man_check            := res[0];
                ButtonEditFioCheck.Text := res[1];
                fio_full_check          := res[1];
            end;
        end;
    end;
end;

procedure TfmPrintForm.ButtonEditGlBuhgPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    res := Un_lo_file_Alex.MY_GetManEx(self, Database.Handle, false, false, id_man_gl_buhg);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            if id_man_gl_buhg <> res[0] then
            begin
                id_man_gl_buhg        := res[0];
                ButtonEditGlBuhg.Text := res[1];
                fio_full_gl_buhg      := res[1];
            end;
        end;
    end;
end;

end.
