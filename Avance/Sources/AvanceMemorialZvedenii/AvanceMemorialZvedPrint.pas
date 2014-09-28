unit AvanceMemorialZvedPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ExtCtrls, cxCheckBox, cxSpinEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxControls, cxContainer, cxEdit, cxLabel, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RxMemDS, FIBDataSet,
  pFIBDataSet, ActnList, FIBQuery, pFIBQuery, frxClass, frxDBSet,
  cxButtonEdit, frxExportXLS, cxProgressBar;

type
  TfmAvanceMemorialZvedPrint = class(TForm)
    DBase: TpFIBDatabase;
    Tr: TpFIBTransaction;
    cxLabel1: TcxLabel;
    cxComboBoxMonth: TcxComboBox;
    cxLabel2: TcxLabel;
    cxSpinEditYear: TcxSpinEdit;
    cxCheckBoxShow: TcxCheckBox;
    cxButtonPrint: TcxButton;
    cxButtonClose: TcxButton;
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
    DataSource1: TDataSource;
    cxButton1: TcxButton;
    DS: TpFIBDataSet;
    RXLeft: TRxMemoryData;
    TWr: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    DataSource3: TDataSource;
    ActionList1: TActionList;
    Aprint: TAction;
    APereform: TAction;
    DSPer: TpFIBDataSet;
    TWrite: TpFIBTransaction;
    Query: TpFIBQuery;
    DSDebet: TpFIBDataSet;
    frDBDebet: TfrxDBDataset;
    DSDSch: TpFIBDataSet;
    frDBKSch: TfrxDBDataset;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    DSProverka: TpFIBDataSet;
    DSDebetNAME_PRED: TFIBStringField;
    DSDebetSALDO_BEGIN_D: TFIBBCDField;
    DSDebetSUMMA_INTO_MBOOK: TFIBBCDField;
    DSDebetOKPO: TFIBStringField;
    DSDebetID_MAN: TFIBBCDField;
    DSDebetID_KEKV: TFIBBCDField;
    DSDebetKOD_KEKV: TFIBIntegerField;
    DSDebetTITLE_KEKV: TFIBStringField;
    DSDebetFAMILIYA: TFIBStringField;
    DSDebetIMYA: TFIBStringField;
    DSDebetOTCHESTVO: TFIBStringField;
    DSDebetTIN: TFIBStringField;
    DSDebetBIRTHDAY: TFIBDateField;
    DSDebetTAB_NUM: TFIBIntegerField;
    DSDebetSUMMA_DEBET: TFIBBCDField;
    DSDebetSUMMA_KREDIT: TFIBBCDField;
    DSDebetOST_DEBET: TFIBBCDField;
    DSDebetOST_KREDIT: TFIBBCDField;
    DSDebetOST_ALL_DEBET: TFIBBCDField;
    DSDebetOST_ALL_KREDIT: TFIBBCDField;
    DSDebetSALDO_BEGIN_K: TFIBBCDField;
    DSKSch: TpFIBDataSet;
    frxDBKSch: TfrxDBDataset;
    frxDNeos: TfrxDBDataset;
    frxKNeos: TfrxDBDataset;
    DBDNeos: TpFIBDataSet;
    DBKNeos: TpFIBDataSet;
    DBDNeosKOD_SCH: TFIBStringField;
    DBDNeosTITLE_SCH: TFIBStringField;
    DBDNeosID_SCH: TFIBBCDField;
    DBDNeosSUMMA: TFIBBCDField;
    DBDNeosPAR_S: TFIBStringField;
    DBKNeosKOD_SCH: TFIBStringField;
    DBKNeosTITLE_SCH: TFIBStringField;
    DBKNeosID_SCH: TFIBBCDField;
    DBKNeosSUMMA: TFIBBCDField;
    DBKNeosPAR_S: TFIBStringField;
    DSDebetDB_SCH_NUMBER: TFIBStringField;
    DSDebetDB_SCH_TITLE: TFIBStringField;
    DSDebetDB_ID_SCH: TFIBBCDField;
    DSDebetDB_DATE_REG: TFIBDateField;
    DSDebetDB_NUM_DOC: TFIBStringField;
    DSDebetKR_SCH_NUMBER: TFIBStringField;
    DSDebetKR_SCH_TITLE: TFIBStringField;
    DSDebetKR_ID_SCH: TFIBBCDField;
    DSDebetKR_DATE_REG: TFIBDateField;
    DSDebetKR_NUM_DOC: TFIBStringField;
    DSDebetSUMMA_DEBET_ALL: TFIBBCDField;
    DSDebetSUMMA_KREDIT_ALL: TFIBBCDField;
    Panel1: TPanel;
    DataSetSigns: TpFIBDataSet;
    cxLabel5: TcxLabel;
    ButtonEditBuh: TcxButtonEdit;
    cxLabel6: TcxLabel;
    ButtonEditFioCheck: TcxButtonEdit;
    cxLabel7: TcxLabel;
    ButtonEditGlBuhg: TcxButtonEdit;
    frxXLSExport1: TfrxXLSExport;
    DSDebetMAX_DATE_DOC_OST: TFIBDateField;
    DSDebetNUM_DOC_OST: TFIBStringField;
    frxReport1: TfrxReport;
    DSetZvedSum: TpFIBDataSet;
    DSetZvedTypeFinPkv: TpFIBDataSet;
    DSourceZvedSum: TDataSource;
    TransRead: TpFIBTransaction;
    frxDBDsetZvedSum: TfrxDBDataset;
    frxDBDsetZvedTypeFinPkv: TfrxDBDataset;
    frxDBDset: TfrxDBDataset;
    pFIBDSet: TpFIBDataSet;
    ProgressBar: TcxProgressBar;
    LabelFormirovanie: TLabel;
    pFIBDataSet2: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure RXLeftAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid3DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AprintExecute(Sender: TObject);
    procedure APereformExecute(Sender: TObject);
    procedure ShowPereform;
    procedure deltable;
    procedure ButtonEditBuhPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditFioCheckPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditGlBuhgPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Get_Fio_post(id_man :int64; var name_post_out, fio_small_buhg_out,fio_full_buhg_out : string);
    procedure DSetZvedSumBeforeFetchRecord(FromQuery: TFIBQuery;
      RecordNumber: Integer; var StopFetching: Boolean);
    procedure DSetZvedSumBeforeOpen(DataSet: TDataSet);
    procedure DSetZvedTypeFinPkvBeforeOpen(DataSet: TDataSet);
    procedure DSetZvedTypeFinPkvBeforeFetchRecord(FromQuery: TFIBQuery;
      RecordNumber: Integer; var StopFetching: Boolean);

  private
      id_man_buh, id_man_check, id_man_gl_buhg : int64;
    flag_show_right : boolean;
    id_session, id_user_ : int64;
    j4_mo_print_doc_ost, j4_mo_bukv : integer;
    name_post_buhg, name_post_check, name_post_gl_buhg,fio_small_buhg,fio_small_check,fio_small_gl_buhg,fio_full_buhg,fio_full_check,fio_full_gl_buhg :string;
  public
    Datasetcount : Integer;
    constructor Create(AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64); reintroduce; overload;
  end;

function ShowMemorialAvance (AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;
    exports ShowMemorialAvance;


implementation

uses DateUtils,
     Un_Progress_form,
     GlobalSPR,
     Un_R_file_Alex,
     Un_lo_file_Alex;

{$R *.dfm}

function ShowMemorialAvance (AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;
var
    T  : TfmAvanceMemorialZvedPrint;
begin
    T := TfmAvanceMemorialZvedPrint.Create(AOwner, db, id_user);
    T.FormStyle := fsMDIChild;
    T.Show;
    Result := -1;
end;

constructor TfmAvanceMemorialZvedPrint.Create(AOwner: Tcomponent; db: Tpfibdatabase;
  id_user: int64);
var
    name_post, fio_small,fio_full : string;
begin
    inherited Create(AOwner);

    id_user_                  := id_user;
    flag_show_right           := false;
    DBase                     := DB;
    Tr.DefaultDatabase        := DBase;
    TWr.DefaultDatabase       := DBase;
    TWrite.DefaultDatabase    := DBase;
    TransRead.DefaultDatabase := DBase;

    DBase.DefaultTransaction := Tr;

    DS.Database              := DBase;
    DS.Transaction           := Tr;

    DSProverka.Database      := DBase;
    DSProverka.Transaction   := Tr;

    DSDebet.Database         := DBase;
    DSDebet.Transaction      := TWrite;

    DSDSch.Database          := DBase;
    DSDSch.Transaction       := TWrite;

    DSKSch.Database          := DBase;
    DSKSch.Transaction       := TWrite;

    DBDNeos.Database         := DBase;
    DBDNeos.Transaction      := TWrite;

    DBKNeos.Database         := DBase;
    DBKNeos.Transaction      := TWrite;

    DSetZvedSum.Database     := DBase;
    DSetZvedSum.Transaction  := TransRead;

    DSetZvedTypeFinPkv.Database    := DBase;
    DSetZvedTypeFinPkv.Transaction := TransRead;

    pFIBDataSet2.Database    := DBase;
    pFIBDataSet2.Transaction := TransRead;

    pFIBDSet.Database    := DBase;
    pFIBDSet.Transaction := TransRead;

    DataSetSigns.Database    := DBase;
    DataSetSigns.Transaction := Tr;

    Query.Database           := DBase;
    Query.Transaction        := TWrite;

    pFIBDataSet1.Database    := DBase;
    pFIBDataSet1.Transaction := TWr;
    TWr.StartTransaction;

    Tr.StartTransaction;

    TransRead.StartTransaction;  

    id_session := -1;

    DS.Close;
    DS.Sqls.SelectSQL.Text := 'select * from J4_INI';
    DS.Open;

    if DS['ID_MEN_CHECK']<>null then
          id_man_check   := strtoint64(DS.fbn('ID_MEN_CHECK').AsString)
    else  id_man_check   := 0;
    if DS['ID_MEN_GL_BUHG']<>null then
          id_man_gl_buhg := strtoint64(DS.fbn('ID_MEN_GL_BUHG').AsString)
    else  id_man_gl_buhg   := 0;

    if DS['J4_MO_PRINT_DOC_OST']<>null then
          j4_mo_print_doc_ost := DS.fbn('J4_MO_PRINT_DOC_OST').AsInteger
    else  j4_mo_print_doc_ost   := 0;

    if DS['J4_MO_NOT_PRINT_BUKV_MO']<>null then
          j4_mo_bukv := DS.fbn('J4_MO_NOT_PRINT_BUKV_MO').AsInteger
    else  j4_mo_bukv   := 0;


    cxComboBoxMonth.ItemIndex := MonthOf(IncDay(date, -DS.fbn('J4_DAY_SHOW_LAST').AsInteger))-1;
    cxSpinEditYear.Value := YearOf(IncDay(date, -DS.fbn('J4_DAY_SHOW_LAST').AsInteger));

    //cxGrid3.Enabled := false;
    //cxGrid3DBTableView1.Styles.Background := cxStyleBorder;
    flag_show_right := true;

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

    Caption                              := Un_R_file_Alex.BANK_MO_CAPTION[1];
    cxLabel1.Caption                     := Un_R_file_Alex.BANK_MO_TAKE_MONT[1];
    cxLabel2.Caption                     := Un_R_file_Alex.BANK_MO_TAKE_YEAR[1];
    cxButton1.Caption                    := Un_R_file_Alex.BANK_MO_TAKE_PEREFORM[1];
    cxButtonPrint.Caption                := Un_R_file_Alex.BANK_MO_PRINT[1];
    cxButtonClose.Caption                := Un_R_file_Alex.BANK_MO_EXIT[1];
    cxLabel5.Caption                     := Un_R_file_Alex.J4_BUHG;
    cxLabel6.Caption                     := Un_R_file_Alex.J4_CHECK;
    cxLabel7.Caption                     := Un_R_file_Alex.J4_GL_BUHG;
    cxCheckBoxShow.Properties.Caption    := Un_R_file_Alex.BANK_MO_PRINT_M[1];

    cxGridDBTableView1DBColumn1.Caption  := '';
    cxGridDBTableView1DBColumn2.Caption  := Un_R_file_Alex.BANK_MO_REG_SHORT[1];
    cxGridDBTableView1DBColumn3.Caption  := Un_R_file_Alex.BANK_MO_SCH_KOD[1];
    cxGridDBTableView1DBColumn4.Caption  := Un_R_file_Alex.BANK_MO_SCH_TITLE[1];

    //cxGrid3DBTableView1DBColumn1.Caption := Un_R_file_Alex.BANK_MO_MO[1];
    //cxGrid3DBTableView1DBColumn2.Caption := Un_R_file_Alex.BANK_MO_RAS[1];
    //cxGrid3DBTableView1DBColumn3.Caption := Un_R_file_Alex.BANK_MO_NAME_FINANCE[1];
    //cxGrid3DBTableView1DBColumn4.Caption := Un_R_file_Alex.BANK_MO_BUKVA[1];
    //cxGrid3DBTableView1DBColumn5.Caption := Un_R_file_Alex.BANK_MO_KOD_REG[1];
    //cxGrid3DBTableView1DBColumn6.Caption := Un_R_file_Alex.BANK_MO_PROGRAMM[1];

end;

procedure TfmAvanceMemorialZvedPrint.Get_Fio_post(id_man :int64; var name_post_out, fio_small_buhg_out,fio_full_buhg_out : string);
begin
    DataSetSigns.Close;
    DataSetSigns.SQLs.SelectSQL.Text := 'SELECT * FROM J4_GET_INFO_SIGN('+IntToStr(id_man)+','''+datetostr(date)+''')';
    DataSetSigns.Open;

    name_post_out          := DataSetSigns.FBN('name_post_buhg').AsString;
    fio_small_buhg_out     := DataSetSigns.FBN('fio_small_buhg').AsString;
    fio_full_buhg_out      := DataSetSigns.FBN('fio_full_buhg').AsString;

end;


procedure TfmAvanceMemorialZvedPrint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //  deltable;
    if FormStyle = fsMDIChild then Action := CaFree;
end;

procedure TfmAvanceMemorialZvedPrint.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfmAvanceMemorialZvedPrint.RXLeftAfterScroll(DataSet: TDataSet);
var
    id, id_reg : int64;
begin
   { if flag_show_right then
    begin
        if not RXLeft.IsEmpty then
        begin
            try pFIBDataSet1.Post except end;
            id     := RXLeft.FieldByName('id_sch').value;
            id_reg := RXLeft.FieldByName('id_reg').value;
            pFIBDataSet1.Close;
//            pFIBDataSet1.SQLs.SelectSQL.Text := 'select ID_PKV, PKV_TITLE, PKV_KOD, ID_TYPE_FINANCE, TYPE_FINANCE_NAME, TYPE_FINANCE_CODE, MO_CHAR, PRINT_MO, PRINT_RAS_SCH from BANK_TEMP_MO where ID_SESSION='+IntToStr(id_session)+' and ID_SCH= '+IntToStr(id)+'';
            pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from BANK_TEMP_MO where ID_SESSION='+IntToStr(id_session)+' and ID_SCH= '+IntToStr(id)+' and ID_REG='+IntToStr(id_reg)+'';
            pFIBDataSet1.Open;
            if RXLeft.FieldByName('print').asInteger = 1
                then begin
                    //cxGrid3.Enabled := true;
                    //cxGrid3DBTableView1.Styles.Background := cxStyleYellow;
                end
                else begin
                    //cxGrid3.Enabled := false;
                    //cxGrid3DBTableView1.Styles.Background := cxStyleBorder;
                end;
        end;
    end;  }
end;

procedure TfmAvanceMemorialZvedPrint.cxGrid1DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if not RXLeft.IsEmpty then
        if Key = vk_space then
        begin
            RXLeft.Open;
            RXLeft.Edit;
            if RXLeft.FieldByName('print').AsInteger = 1
                then RXLeft.FieldByName('print').Value := 0
                else begin
                    RXLeft.FieldByName('print').Value := 1;
                    RXLeft.Post;
                    cxGridDBTableView1.Controller.GoToNext(false);
                    exit;
                end;
            RXLeft.Post;
        end
end;

procedure TfmAvanceMemorialZvedPrint.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    if not RXLeft.IsEmpty then
    begin
        RXLeft.Open;
        RXLeft.Edit;
        if RXLeft.FieldByName('print').AsInteger = 1
            then RXLeft.FieldByName('print').Value := 0
            else RXLeft.FieldByName('print').Value := 1;
        RXLeft.Post;
    end
end;

procedure TfmAvanceMemorialZvedPrint.cxGrid3DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_RETURN then pFIBDataSet1.Post;
end;

procedure TfmAvanceMemorialZvedPrint.AprintExecute(Sender: TObject);
var
    id , i: int64;
    d1, d2 : string;
    i1, i2, i3, i4 : int64;
    //T : TfmUn_Progress_form;
    RecordCount : Integer;
begin
    flag_show_right := false;
    if not RXLeft.IsEmpty then
    begin  
        if cxComboBoxMonth.ItemIndex < 9
            then d1 := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else d1 := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        d2 := DateToStr(IncDay(IncMonth(StrToDate(d1),1), -1));

        RXLeft.First;
        while not RXLeft.Eof do
        begin
            if RXLeft.FieldByName('print').AsInteger = 1 then
            begin
                ProgressBar.Position := 0;
                //начало отчета
                DSetZvedSum.Close;
                pFIBDSet.Close;
                DSDSch.Close;
                DSKSch.Close;
                DSetZvedSum.SQLs.SelectSQL.Text := 'select * from J4_MO_ZVED_NEW(:d1, :d2, :ID_SCH, :ID_RAS) order by FAMILIYA, KOD_KEKV';
                DSetZvedSum.ParamByName('ID_SCH').AsInt64   := RXLeft.FieldByName('id_sch').value;
                DSetZvedSum.ParamByName('d1').Value         := d1;
                DSetZvedSum.ParamByName('d2').Value         := d2;
                DSetZvedSum.ParamByName('ID_RAS').AsInt64   := RXLeft.FieldByName('ID_RAS').value;
                //старенький долгий вызов
                {DSetZvedSum.SQLs.SelectSQL.Text := 'select * from J4_MO_ZVED_SUM_ID_MAN(:ID_SES, :ID_SCH, :ID_REG, :d1, :d2, :ID_RAS) order by FAMILIYA, KOD_KEKV';
                DSetZvedSum.ParamByName('ID_SES').AsInt64   := id_session;
                DSetZvedSum.ParamByName('ID_SCH').AsInt64   := RXLeft.FieldByName('id_sch').value;
                DSetZvedSum.ParamByName('ID_REG').AsInt64   := RXLeft.FieldByName('id_reg').value;
                DSetZvedSum.ParamByName('d1').Value         := d1;
                DSetZvedSum.ParamByName('d2').Value         := d2;
                DSetZvedSum.ParamByName('ID_RAS').AsInt64   := RXLeft.FieldByName('ID_RAS').value;

                DSetZvedTypeFinPkv.SQLs.SelectSQL.Text := 'select * from J4_MO_ZVED_TYPE_FIN_PKV(:ID_SESSION, :ID_SCH, :ID_REG, :d1, :d2, :ID_RAS) where id_man = :id_man and kod_kekv = :kod_kekv';
                DSetZvedTypeFinPkv.ParamByName('ID_SESSION').AsInt64 := id_session;
                DSetZvedTypeFinPkv.ParamByName('ID_SCH').AsInt64     := RXLeft.FieldByName('id_sch').value;
                DSetZvedTypeFinPkv.ParamByName('ID_REG').AsInt64     := RXLeft.FieldByName('id_reg').value;
                DSetZvedTypeFinPkv.ParamByName('d1').Value           := d1;
                DSetZvedTypeFinPkv.ParamByName('d2').Value           := d2;
                DSetZvedTypeFinPkv.ParamByName('ID_RAS').AsInt64     := RXLeft.FieldByName('ID_RAS').value; }

                pFIBDSet.SQLs.SelectSQL.Text := 'select * from J4_MO_SUM_MBOOK_TYPE_FIN_PKV(:ID_SES, :ID_SCH, :ID_REG, :d1, :d2, :ID_RAS)';
                pFIBDSet.ParamByName('ID_SES').AsInt64   := id_session;
                pFIBDSet.ParamByName('ID_SCH').AsInt64   := RXLeft.FieldByName('id_sch').value;
                pFIBDSet.ParamByName('ID_REG').AsInt64   := RXLeft.FieldByName('id_reg').value;
                pFIBDSet.ParamByName('d1').Value         := d1;
                pFIBDSet.ParamByName('d2').Value         := d2;
                pFIBDSet.ParamByName('ID_RAS').AsInt64   := RXLeft.FieldByName('ID_RAS').value;
                DSDSch.SQLs.SelectSQL.Text := 'select * from J4_MO_1_ZVED_SUM(:ID_SESSION, :ID_SCH, :ID_REG, :d1, :d2, :ID_RAS)';
                DSDSch.ParamByName('ID_SESSION').AsInt64 := id_session;
                DSDSch.ParamByName('ID_SCH').AsInt64     := RXLeft.FieldByName('id_sch').value;
                DSDSch.ParamByName('ID_REG').AsInt64     := RXLeft.FieldByName('id_reg').value;
                DSDSch.ParamByName('d1').Value           := d1;
                DSDSch.ParamByName('d2').Value           := d2;
                DSDSch.ParamByName('ID_RAS').AsInt64     := RXLeft.FieldByName('ID_RAS').value;
                DSKSch.SQLs.SelectSQL.Text := 'select * from J4_MO_2_ZVED_SUM(:ID_SESSION, :ID_SCH, :ID_REG, :d1, :d2, :ID_RAS)';
                DSKSch.ParamByName('ID_SESSION').AsInt64 := id_session;
                DSKSch.ParamByName('ID_SCH').AsInt64     := RXLeft.FieldByName('id_sch').value;
                DSKSch.ParamByName('ID_REG').AsInt64     := RXLeft.FieldByName('id_reg').value;
                DSKSch.ParamByName('d1').Value           := d1;
                DSKSch.ParamByName('d2').Value           := d2;
                DSKSch.ParamByName('ID_RAS').AsInt64     := RXLeft.FieldByName('ID_RAS').value;
                DSetZvedSum.Open;
                pFIBDSet.Open;
                DSDSch.Open;
                DSKSch.Open;

                id := RXLeft.FieldByName('id_sch').value;
                DSProverka.Close;
                DSProverka.SQLs.SelectSQL.Text := 'select * from BANK_MO_PROVERKA('+intToStr(id)+', '''+d1+''')';
                DSProverka.Open;
                if DSProverka.FBN('R_RESULT').AsInteger = 1 then
                begin
                    showmessage(Un_R_file_Alex.AVANCE_MO_SCH[1] +RXLeft.FieldByName('kod_sch').AsString + Un_R_file_Alex.BANK_MO_MES1[1]+cxComboBoxMonth.Text+' '+cxSpinEditYear.Text+'.'+#13+Un_R_file_Alex.BANK_MO_MES2[1]);
                    exit;
                end;
                DSProverka.Close;
                frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_Zved_New.fr3');
                frxReport1.Variables['comp']         := QuotedStr(GetComputerNetName);
                frxReport1.Variables['id_user']      := QuotedStr(IntToStr(id_user_));
                frxReport1.Variables['kod_sch']      := ''''+RXLeft.FieldByName('kod_sch').AsString+'''';
                frxReport1.Variables['name_sch']     := ''''+RXLeft.FieldByName('title_sch').AsString+'''';
                frxReport1.Variables['mon_mo']       := QuotedStr(cxComboBoxMonth.Text);
                frxReport1.Variables['year_mo']      := QuotedStr(VarToStr(cxSpinEditYear.Value));
                frxReport1.Variables['name_post_b']  := QuotedStr(name_post_buhg);
                frxReport1.Variables['name_post_c']  := QuotedStr(name_post_check);
                frxReport1.Variables['name_post_g_b']:= QuotedStr(name_post_gl_buhg);
                frxReport1.Variables['fio_small_b']  := QuotedStr(fio_small_buhg);
                frxReport1.Variables['fio_small_c']  := QuotedStr(fio_small_check);
                frxReport1.Variables['fio_small_g_b']:= QuotedStr(fio_small_gl_buhg);
                frxReport1.Variables['fio_full_b']   := QuotedStr(fio_full_buhg);
                frxReport1.Variables['fio_full_c']   := QuotedStr(fio_full_check);
                frxReport1.Variables['fio_full_g_b'] := QuotedStr(fio_full_gl_buhg);
                frxReport1.Variables['j4_mo_print_doc_o'] := QuotedStr(inttostr(j4_mo_print_doc_ost));
                frxReport1.Variables['j4_mo_bukv_not'] := QuotedStr(inttostr(j4_mo_bukv));

                //frxReport1.PrepareReport(true);
                //frxReport1.designreport;


                if not cxCheckBoxShow.Checked then
                  begin
                    frxReport1.PrintOptions.ShowDialog := False;
                    frxReport1.Print;
                  end
                else
                  begin
                    frxReport1.ShowReport(true);
                  end;

                  TWrite.Rollback;
            end;
            RXLeft.Next;
        end;
    end;
    flag_show_right := true;
end;

procedure TfmAvanceMemorialZvedPrint.APereformExecute(Sender: TObject);
var
    d1, d2 : string;
    T : TfmUn_Progress_form;
begin
    T := TfmUn_Progress_form.Create(nil, wait_, Un_R_file_Alex.M_WAIT[1]);
    T.Show;
    T.Repaint;
    DSPer.Database    := DBase;
    DSPer.Transaction := TWrite;
    TWrite.StartTransaction;
    if id_session > 0 then
    begin
        deltable;
    end;
    if cxComboBoxMonth.ItemIndex < 9
        then d1 := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
        else d1 := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
    d2 := DateToStr(IncDay(IncMonth(StrToDate(d1),1), -1));

    DSPer.Close;
    DSPer.SQLs.SelectSQL.Text := 'select * from J4_MO_ZAP_GRID('''+d1+''', '''+d2+''')';
    DSPer.Open;
    id_session  := StrToint64(DSPer.fbn('R_ID_SESSION').AsString);
    DSPer.Close;
    TWrite.Commit;
    ShowPereform;
    T.Free;
end;

procedure TfmAvanceMemorialZvedPrint.ShowPereform;
begin
    flag_show_right := false;
    try
    DS.Close;
    DS.Sqls.SelectSQL.Text := 'select distinct ID_SCH, KOD_SCH, TITLE_SCH, ID_RAS, REG_SHORT, ID_REG  from BANK_TEMP_MO where ID_SESSION='+IntToStr(id_session)+'';
    DS.Open;
    DS.First;
    RXLeft.EmptyTable;
    while not DS.Eof do
    begin
        RXLeft.Open;
        RXLeft.Insert;
        RXLeft.FieldByName('print').Value     := 0;
        RXLeft.FieldByName('kod_sch').Value   := DS.fbn('KOD_SCH').asString;
        RXLeft.FieldByName('id_sch').Value    := strToInt64(DS.fbn('ID_SCH').asString);
        RXLeft.FieldByName('id_ras').Value    := strToInt64(DS.fbn('ID_RAS').asString);
        RXLeft.FieldByName('title_sch').Value := DS.fbn('TITLE_SCH').asString;
        RXLeft.FieldByName('id_reg').Value    := DS.fbn('ID_REG').asString;
        RXLeft.FieldByName('Reg_short').Value := DS.fbn('REG_SHORT').asString;
        RXLeft.Post;
        DS.Next;
    end;

    RXLeft.First;

    pFIBDataSet1.SQLs.UpdateSQL.Text  := 'UPDATE BANK_TEMP_MO SET PRINT_MO = ?PRINT_MO, PRINT_RAS_SCH = ?PRINT_RAS_SCH WHERE ID_SESSION = ?OLD_ID_SESSION and ID_SCH = ?OLD_ID_SCH and ID_RAS = ?OLD_ID_RAS and ID_PKV = ?OLD_ID_PKV and ID_TYPE_FINANCE = ?OLD_ID_TYPE_FINANCE and ID_REG=?OLD_ID_REG';
//    pFIBDataSet1.SQLs.RefreshSQL.Text := 'SELECT BAN.ID_SESSION, BAN.ID_SCH, BAN.KOD_SCH, BAN.TITLE_SCH, BAN.ID_RAS, BAN.KOD_RAS, BAN.ID_PKV, BAN.PKV_TITLE, BAN.PKV_KOD, BAN.ID_TYPE_FINANCE, BAN.TYPE_FINANCE_NAME, BAN.TYPE_FINANCE_CODE, BAN.MO_CHAR, BAN.PRINT_MO, BAN.PRINT_RAS_SCH FROM BANK_TEMP_MO BAN WHERE (BAN.ID_SESSION = ?OLD_ID_SESSION and BAN.ID_SCH = ?OLD_ID_SCH and BAN.ID_RAS = ?OLD_ID_RAS and BAN.ID_PKV = ?OLD_ID_PKV and BAN.ID_TYPE_FINANCE = ?OLD_ID_TYPE_FINANCE';
    pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from BANK_TEMP_MO where ID_SESSION='+IntToStr(id_session)+' and ID_SCH= '''+RXLeft.FieldByName('id_sch').AsString+''' and ID_REG= '''+RXLeft.FieldByName('id_reg').AsString+''' ';
    pFIBDataSet1.Open;
    except
        pFIBDataSet1.Close;
    end;
    flag_show_right := true;
end;

procedure TfmAvanceMemorialZvedPrint.deltable;
begin
    TWrite.StartTransaction;

    Query.close;
    Query.SQL.Clear;
    Query.SQL.Text := 'delete from BANK_TEMP_MO where id_session='+IntToStr(id_session)+'';

    try
        Query.ExecQuery;
        TWrite.Commit;
    except
        TWrite.Rollback;
    end;
end;


procedure TfmAvanceMemorialZvedPrint.ButtonEditBuhPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
    name_post, fio_small,fio_full : string;
begin
    res := Un_lo_file_Alex.MY_GetManEx(self, DBase.Handle, false, false, id_man_buh);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            if id_man_buh <> res[0] then
            begin
                id_man_buh         := res[0];
                ButtonEditBuh.Text := res[1];
                Get_Fio_post(id_man_buh,name_post, fio_small,fio_full);
                name_post_buhg    := name_post;
                fio_small_buhg    := fio_small;
                fio_full_buhg     := fio_full;

            end;
        end;
    end;
end;

procedure TfmAvanceMemorialZvedPrint.ButtonEditFioCheckPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
    name_post, fio_small,fio_full : string;
begin
    res := Un_lo_file_Alex.MY_GetManEx(self, DBase.Handle, false, false, id_man_check);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            if id_man_check <> res[0] then
            begin
                id_man_check            := res[0];
                ButtonEditFioCheck.Text := res[1];
                Get_Fio_post(id_man_check,name_post, fio_small,fio_full);
                name_post_check    := name_post;
                fio_small_check    := fio_small;
                fio_full_check     := fio_full;

            end;
        end;
    end;
end;

procedure TfmAvanceMemorialZvedPrint.ButtonEditGlBuhgPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
    name_post, fio_small,fio_full : string;
begin
    res := Un_lo_file_Alex.MY_GetManEx(self, DBase.Handle, false, false, id_man_gl_buhg);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            if id_man_gl_buhg <> res[0] then
            begin
                id_man_gl_buhg        := res[0];
                ButtonEditGlBuhg.Text := res[1];
                Get_Fio_post(id_man_gl_buhg,name_post, fio_small,fio_full);
                name_post_gl_buhg    := name_post;
                fio_small_gl_buhg    := fio_small;
                fio_full_gl_buhg     := fio_full;
            end;
        end;
    end;
end;

procedure TfmAvanceMemorialZvedPrint.DSetZvedSumBeforeFetchRecord(
  FromQuery: TFIBQuery; RecordNumber: Integer; var StopFetching: Boolean);
begin
//  ShowMessage(inttostr(RecordNumber));
 // ProgressBar.Position:= Round(100*(RecordNumber+1)/Datasetcount);
 // ProgressBar.Refresh;
end;

procedure TfmAvanceMemorialZvedPrint.DSetZvedSumBeforeOpen(
  DataSet: TDataSet);
begin
 // ProgressBar.Position := 0;
end;

procedure TfmAvanceMemorialZvedPrint.DSetZvedTypeFinPkvBeforeOpen(
  DataSet: TDataSet);
begin
//  ProgressBar.Position := 0;
end;

procedure TfmAvanceMemorialZvedPrint.DSetZvedTypeFinPkvBeforeFetchRecord(
  FromQuery: TFIBQuery; RecordNumber: Integer; var StopFetching: Boolean);
begin
 // ProgressBar.Position:= Round(100*(RecordNumber+1)/Datasetcount);
 // ProgressBar.Refresh;
end;

end.
