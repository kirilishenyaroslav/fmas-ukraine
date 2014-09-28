unit AvancePrintFormNewAlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, DB, FIBDataSet, pFIBDataSet, FR_DSet,
  FR_DBSet, FR_Class, ExtCtrls, StdCtrls, cxButtons, MainForm, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxSpinEdit, cxCheckBox, DateUtils, pFIBDatabase,
  cxLabel, Un_R_file_Alex, GlobalSPR, frxClass, frxDBSet, frxCross,
  FIBDatabase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, RxMemDS, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, dxStatusBar;

type
  TfmMode = (Jornal4New);

  TAvancePrintFormNewAlg = class(TForm)
    cxButtonClose: TcxButton;
    cxButtonPrint: TcxButton;
    Bevel1: TBevel;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    PrintDialog1: TPrintDialog;
    cxSpinEdit1: TcxSpinEdit;
    cxComboBoxMonth: TcxComboBox;
    cxComboBoxJornal: TcxComboBox;
    DataSetJornal: TpFIBDataSet;
    DataSet: TpFIBDataSet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxComboBoxSch: TcxComboBox;
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
    DataSetID_DOG: TFIBBCDField;
    DataSetKOD_DOG: TFIBBCDField;
    DataSetTAB_NUM: TFIBIntegerField;
    DBDatasetSch: TfrxDBDataset;
    DataSetSch: TpFIBDataSet;
    DataSetSchNAME_PREDPR: TFIBStringField;
    DataSetSchSCH_TITLE: TFIBStringField;
    DataSetSchOSN_SCH: TFIBStringField;
    DataSetSchFIO: TFIBStringField;
    DataSetSchBIRTHDAY: TFIBDateField;
    DataSetSchTIN: TFIBStringField;
    DataSetSchTAB_NUM: TFIBIntegerField;
    DataSetSchDEBET_SCH: TFIBStringField;
    DataSetSchKREDIT_SCH: TFIBStringField;
    DataSetSchOST_DEBET: TFIBBCDField;
    DataSetSchOST_KREDIT: TFIBBCDField;
    DataSetSchSUMMA_DEBET: TFIBBCDField;
    DataSetSchSUMMA_KREDIT: TFIBBCDField;
    DataSetSchOST_ALL_DEBET: TFIBBCDField;
    DataSetSchOST_ALL_KREDIT: TFIBBCDField;
    DataSetSchDEBET_RAH: TFIBStringField;
    frxCrossObject1: TfrxCrossObject;
    DataSetLang: TpFIBDataSet;
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
    frDBDataSet2: TfrDBDataSet;
    frReport2: TfrReport;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    RX_Otchet: TRxMemoryData;
    DataSource1: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
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
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    dxStatusBar1: TdxStatusBar;
    DataSetSpravka: TpFIBDataSet;
    frxDBDatasetSpravka: TfrxDBDataset;
    DataSetSpravkaR_OSN_SCH: TFIBStringField;
    DataSetSpravkaR_TYTLE_OSN_SCH: TFIBStringField;
    DataSetSpravkaR_KOR_SCH: TFIBStringField;
    DataSetSpravkaR_TYTLE_KOR_SCH: TFIBStringField;
    DataSetSpravkaR_SUMMA: TFIBBCDField;
    DataSetSpravkaNAME_PREDPR: TFIBStringField;
    DataSetSchNUM_P_P: TFIBIntegerField;
    frxReport2: TfrxReport;
    frxReport1: TfrxReport;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
    procedure DataSetDATE_OSTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure PrintMonth(d1 : TDate; lang : integer);
    procedure PrintKorSch(d1 : TDate; lang : integer; prihod : integer);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    Procedure CellSelect;
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PrintBuhSpPoSch(d1 : TDate; lang, prihod  :integer);
    procedure PrintVedomost_3_2(date_month : TDate);
  private
    n : TfmMode;
    myform : TfmAvanceMainForm;
    Ind1 : array [1..2] of array of Variant;
    Ind : array of Int64;
  public
    pFIBTransaction1: TpFIBTransaction;
    pFIBDatabase1: TpFIBDatabase;
    id_jornal : int64;
    constructor Create(m : TfmMode; db : TpFIBDatabase; Tr : TpFIBTransaction; mform : TfmAvanceMainForm); reintroduce; overload;
    destructor Destroy; override;
  end;


implementation
uses ACCMGMT,
     ProgressFormAvance,
     Un_lo_file_Alex;

{$R *.dfm}
constructor TAvancePrintFormNewAlg.Create(m : TfmMode; db : TpFIBDatabase; Tr : TpFIBTransaction; mform : TfmAvanceMainForm);
var
    i : integer;
begin
    inherited Create(nil);
    n := m;
    myform := mform;
    pFIBTransaction1 := TpFIBTransaction.Create(nil);
//    pFIBDatabase1    := TpFIBDatabase.Create(nil);

//    pFIBDatabase1             := db;
         pFIBTransaction1.DefaultDatabase := db;
         DataSet.Database                 := db;
         DataSet.Transaction              := pFIBTransaction1;


    DataSetJornal.Database      := db;
    DataSetJornal.Transaction   := Tr;
    DataSetSch.Database         := db;
    DataSetSch.Transaction      := Tr;
    DataSetLang.Database        := db;
    DataSetLang.Transaction     := Tr;
    DataSetSpravka.Database     := db;
    DataSetSpravka.Transaction  := Tr;
    
    DataSetJornal.StartTransaction;

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

    if m = Jornal4New then
    begin
    {загрузка журнала}

    DataSetJornal.Close;
    DataSetJornal.SQLs.SelectSQL.Text := ' SELECT * FROM J4_SP_JO ';
    DataSetJornal.open;
    DataSetJornal.FetchAll;
    If DataSetJornal.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.WARNINH_CLOSE_JORNAL), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        close;
    end;
    SetLength(Ind1[1], DataSetJornal.RecordCount);
    SetLength(Ind1[2], DataSetJornal.RecordCount);
    DataSetJornal.First;
    cxComboBoxJornal.Properties.Items.Clear;
    i := 0;
    While not DataSetJornal.Eof do
    begin
        Ind1[1, DataSetJornal.RecNo - 1] := TFIBBCDField(DataSetJornal.FieldByName('ID_J4_SP_JO')).AsInt64;
        Ind1[2, DataSetJornal.RecNo - 1] := DataSetJornal.FieldByName('DATA_OPEN').AsDateTime;
        if DataSetJornal.FieldByName('SYSTEM_OPEN').Asinteger = 1
        then
        begin
            i := DataSetJornal.RecNo - 1;
            id_jornal                       := TFIBBCDField(DataSetJornal.FieldByName('ID_J4_SP_JO')).AsInt64;
//            cxSpinEdit1.Properties.MinValue := YearOf(DataSetJornal.FieldByName('DATA_OPEN').AsDateTime);
        end;
        cxComboBoxJornal.Properties.Items.Insert(DataSetJornal.RecNo - 1, DataSetJornal.FieldByName('SHORT_NAME').AsString);
        DataSetJornal.Next;
    end;
    DataSetJornal.Close;
//    DataSetJornal.Transaction.Commit;
    cxSpinEdit1.Value          := YearOf(date);
    cxComboBoxMonth.ItemIndex  := MonthOf(date)-1;
    cxComboBoxJornal.ItemIndex := i;
    end;

    DataSetJornal.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_ALL_SCH('+IntToStr(id_jornal)+') ';
    DataSetJornal.Open;

    if (not DataSetJornal.IsEmpty) then
    begin
        DataSetJornal.FetchAll;
        SetLength(Ind, DataSetJornal.RecordCount);
        DataSetJornal.First;

        cxComboBoxSch.Properties.Items.Clear;
        i := 0;
        while not DataSetJornal.Eof do
        begin
            Ind[DataSetJornal.RecNo - 1] := DataSetJornal['ID_SCH'];
            cxComboBoxSch.Properties.Items.Insert(DataSetJornal.RecNo - 1, DataSetJornal['SCH_NUM']);
            DataSetJornal.Next;
        end;
        cxComboBoxSch.ItemIndex := 0;
    end else
    begin
        ShowMessage(Un_R_file_Alex.KASSA_ERROR_SCH);
        exit;
    end;

    cxLabel1.Caption               := Un_R_file_Alex.J4_PRINT_SLECT_JORNAL;
    cxButtonClose.Caption          := Un_R_file_Alex.MY_BUTTON_CLOSE;
    cxButtonPrint.Caption          := Un_R_file_Alex.MY_BUTTON_PRINT;
    Caption                        := Un_R_file_Alex.KASSA_PRINT_CAPTION;


    DataSetJornal.Close;
    DataSetJornal.SQLs.SelectSQL.Text := ' SELECT * FROM J4_INI_PRINT_FORM_MONTH where VISIBLE=' +IntToStr(1)+ ' and NEW_ALG='+IntToStr(1)+'';
    DataSetJornal.open;
    while not DataSetJornal.Eof do
    begin
        RX_Otchet.Open;
        RX_Otchet.Insert;
        RX_Otchet.FieldByName('NAME').Value   := DataSetJornal.FieldByName('NAME_OTCHET').AsString;
        RX_Otchet.FieldByName('Print').Value  := 0;
        RX_Otchet.FieldByName('Kod').Value    := DataSetJornal.FieldByName('SYS_KOD').AsInteger;
        RX_Otchet.Post;
        DataSetJornal.Next;
    end;

{    cxCheckBox1.Properties.Caption      := Un_R_file_Alex.J4_PRINT_J4;
    cxCheckBox2.Properties.Caption      := Un_R_file_Alex.J4_RAS_DEBET_SCH;
    cxCheckBox3.Properties.Caption      := Un_R_file_Alex.J4_RAS_KREDIT_SCH;
    cxCheckBoxKorSch.Properties.Caption := Un_R_file_Alex.J4_JORNAL_KOR_SCH;}
    dxStatusBar1.Panels[0].Text          := 'SPACE - ' + Un_R_file_Alex.J4_PRINT_NEW_ALG_CAP;
    dxStatusBar1.Panels[1].Text          := 'ENTER - ' + Un_R_file_Alex.MY_ACTION_PRINT_CONST;
    cxGrid1.Hint                         := 'SPACE - ' + Un_R_file_Alex.J4_PRINT_NEW_ALG_CAP;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.MY_VALUE_PRINT_CAPTION;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.J4_NAME_OTCHET;
    cxLabel2.Caption                     := Un_R_file_Alex.J4_OSTATOK_FORM_YEAR;
    cxLabel3.Caption                     := Un_R_file_Alex.KASSA_ADDSCH_FORM_SCH;
end;

destructor TAvancePrintFormNewAlg.Destroy;
begin

  inherited;
end;


procedure TAvancePrintFormNewAlg.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TAvancePrintFormNewAlg.cxButtonPrintClick(Sender: TObject);
var
    d : TDate;
    id_lang : integer;
    T : TfmProgressFormAvance;
begin
    DataSetLang.Close;
    DataSetLang.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SYS_DATA';
    DataSetLang.Open;
    id_lang := DataSetLang.FBN('ID_LANGUAGE').AsInteger;
    DataSetLang.Close;
    if cxComboBoxMonth.ItemIndex < 10
        then d := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
        else d := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
    RX_Otchet.First;
    while not RX_Otchet.Eof do
    begin
        if RX_Otchet.FieldByName('Print').AsInteger = 1 then
        begin
            case RX_Otchet.FieldByName('KOD').AsInteger of
                1 : PrintMonth(d, id_lang);
                2 : PrintKorSch(d, id_lang, 1);
                3 : PrintKorSch(d, id_lang, 0);
                4 : PrintBuhSpPoSch(d, id_lang, 1);
                5 : PrintBuhSpPoSch(d, id_lang, 0);
                6 : PrintVedomost_3_2(d);
            end;
        end;
        RX_Otchet.Next;
    end;
end;

procedure TAvancePrintFormNewAlg.DataSetDATE_OSTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if DataSetDATE_OST.IsNull then text := '' else text := DataSetDATE_OST.AsString;
end;

procedure TAvancePrintFormNewAlg.PrintMonth(d1: TDate; lang: integer);
begin
         pFIBTransaction1.StartTransaction;
         DataSet.Close;
         DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM J4_OTCHET_MONTH_NEW_ALG('''+ DateToStr(d1) +''', '+intToStr(id_jornal)+', '+intToStr(1)+', '+intToStr(myform.id_user)+', '+intToStr(Ind[cxComboBoxSch.ItemIndex])+')';
         DataSet.Open;
         frVariables['name_machine'] := GetComputerNetName;
         frVariables['fio_user']     := GetUserFIO;
         frVariables['id_us']        := myform.id_user;
         frVariables['month']        := cxComboBoxMonth.Text;
         frVariables['year']         := IntToStr(cxSpinEdit1.Value);
         if lang = 1 then frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40005.frf');
         if lang = 0 then frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40005_ukr.frf');
         frReport1.ShowReport;
         pFIBTransaction1.Commit;
end;

procedure TAvancePrintFormNewAlg.PrintKorSch(d1: TDate; lang, prihod : integer);
begin
    DataSetSch.Close;
    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM J4_OTCHET_SCH_NEW_ALG('''+ DateToStr(d1) +''', '+intToStr(id_jornal)+', '+intToStr(myform.id_user)+', '+intToStr(Ind[cxComboBoxSch.ItemIndex])+', '+intToStr(prihod)+')';
    DataSetSch.Open;
    if (lang = 1) and (prihod=0) then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\j4_sch_new_alg_k.fr3');
    if (lang = 0) and (prihod=0) then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\j4_sch_new_alg_k_ukr.fr3');
    if (lang = 1) and (prihod=1) then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\j4_sch_new_alg_d.fr3');
    if (lang = 0) and (prihod=1) then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\j4_sch_new_alg_d_ukr.fr3');

    frxReport1.Variables['comp']       := QuotedStr(GetComputerNetName);
    frxReport1.Variables['fio_user']   := QuotedStr(GetUserFIO);
    frxReport1.Variables['id_user']    := myform.id_user;
    frxReport1.Variables['month']      := QuotedStr(cxComboBoxMonth.Text);
    frxReport1.Variables['year']       := IntToStr(cxSpinEdit1.Value);
    frxReport1.PrepareReport(true);
    frxReport1.ShowReport(true);
    DataSetSch.Close;
end;

procedure TAvancePrintFormNewAlg.cxGrid1DBTableView1DblClick(
  Sender: TObject);
begin
    CellSelect;
end;

procedure TAvancePrintFormNewAlg.CellSelect;
var
    i : integer;
    s : Currency;
begin
    if not RX_Otchet.IsEmpty then
    begin
        if RX_Otchet.FieldByName('Print').AsInteger = 1
            then
            begin
                RX_Otchet.Edit;
                RX_Otchet.FieldByName('Print').AsInteger := 0;
                RX_Otchet.Post;
            end
            else
            begin
                RX_Otchet.Edit;
                RX_Otchet.FieldByName('Print').AsInteger := 1;
                RX_Otchet.Post;
            end;
    end;
end;

procedure TAvancePrintFormNewAlg.cxGrid1DBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = VK_SPACE then
        CellSelect;
end;

procedure TAvancePrintFormNewAlg.PrintBuhSpPoSch(d1: TDate; lang, prihod: integer);
begin
    if prihod = 0 then
    begin
        DataSetSpravka.Close;
        DataSetSpravka.SQLs.SelectSQL.Text := 'SELECT * FROM J4_CREATE_SPRAVKA_PO_SCH_NEW_AL('''+ DateToStr(d1) +''', '+intToStr(Ind[cxComboBoxSch.ItemIndex])+', '+intToStr(prihod)+')';
        DataSetSpravka.Open;
        if lang = 1 then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40012.fr3');
        if lang = 0 then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40012_ukr.fr3');
        frxReport2.Variables['comp']       := QuotedStr(GetComputerNetName);
        frxReport2.Variables['fio_user']   := QuotedStr(GetUserFIO);
        frxReport2.Variables['id_user']    := myform.id_user;
        frxReport2.Variables['month']      := QuotedStr(cxComboBoxMonth.Text);
        frxReport2.Variables['year']       := IntToStr(cxSpinEdit1.Value);
        frxReport2.PrepareReport(true);
        frxReport2.ShowReport(true);
        DataSetSpravka.Close;
    end;
    if prihod = 1 then
    begin
        DataSetSpravka.Close;
        DataSetSpravka.SQLs.SelectSQL.Text := 'SELECT * FROM J4_CREATE_SPRAVKA_PO_SCH_NEW_AL('''+ DateToStr(d1) +''', '+intToStr(Ind[cxComboBoxSch.ItemIndex])+', '+intToStr(prihod)+')';
        DataSetSpravka.Open;
        if lang = 1 then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40011.fr3');
        if lang = 0 then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_40011_ukr.fr3');
        frxReport2.Variables['comp']       := QuotedStr(GetComputerNetName);
        frxReport2.Variables['fio_user']   := QuotedStr(GetUserFIO);
        frxReport2.Variables['id_user']    := myform.id_user;
        frxReport2.Variables['month']      := QuotedStr(cxComboBoxMonth.Text);
        frxReport2.Variables['year']       := IntToStr(cxSpinEdit1.Value);
        frxReport2.PrepareReport(true);
        frxReport2.ShowReport(true);
        DataSetSpravka.Close;
    end;

end;

procedure TAvancePrintFormNewAlg.PrintVedomost_3_2(date_month : TDate);
begin
    Un_lo_file_Alex.LCreateVedomost_3_2(Self, myform.Database, Ind[cxComboBoxSch.ItemIndex], id_jornal, date_month);
end;

end.





