unit AvanceMainFormSpravkaNA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ImgList, cxGridTableView, ActnList,
  dxBar, dxBarExtItems, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid,
  cxSplitter, ExtCtrls, StdCtrls, cxGridBandedTableView,
  cxGridDBBandedTableView, cxContainer, cxLabel, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxTL, cxInplaceContainer, cxTLData, cxDBTL,
  cxMaskEdit, cxTextEdit, cxDropDownEdit, cxSpinEdit, Un_R_file_Alex,
  Buttons, cxCurrencyEdit, cxCheckBox;

type
  TfmAvanceMainFormSpravka = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    ActionList1: TActionList;
    ActionRefresh: TAction;
    ActionClose: TAction;
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
    ImageList: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    DataSetFIO: TpFIBDataSet;
    Database: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    DataSourceFIO: TDataSource;
    DataSourceDebet: TDataSource;
    DataSourceKredit: TDataSource;
    DataSetDebet: TpFIBDataSet;
    DataSetKredit: TpFIBDataSet;
    Panel5: TPanel;
    cxComboBoxSystem: TcxComboBox;
    cxLabel3: TcxLabel;
    DataSetSelectSystem: TpFIBDataSet;
    cxComboBoxMonth: TcxComboBox;
    cxSpinEdit1: TcxSpinEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel6: TPanel;
    cxDBTreeList2: TcxDBTreeList;
    cxDBTreeList2cxDBTreeListColumn1: TcxDBTreeListColumn;
    Panel4: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel3: TPanel;
    cxGrid4: TcxGrid;
    cxGrid4DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid4DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid4Level1: TcxGridLevel;
    cxLabel2: TcxLabel;
    cxSplitter1: TcxSplitter;
    cxGrid3: TcxGrid;
    cxGrid3DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid3DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid3BandedTableView1: TcxGridBandedTableView;
    cxGrid3Level2: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    cxDBTreeList2cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList2cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeList2cxDBTreeListColumn6: TcxDBTreeListColumn;
    cxDBTreeList2cxDBTreeListColumn7: TcxDBTreeListColumn;
    cxCheckBox1: TcxCheckBox;
    cxDBTreeList2cxDBTreeListColumn8: TcxDBTreeListColumn;
    cxLabel6: TcxLabel;
    cxGrid3DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    Label2: TcxTextEdit;
    cxLabel7: TcxTextEdit;
    DataSetFIOSCH_TITLE: TFIBStringField;
    DataSetFIOFAMILIA: TFIBStringField;
    DataSetFIOIMYA: TFIBStringField;
    DataSetFIOOTCHESTVO: TFIBStringField;
    DataSetFIOBIRTHDAY: TFIBDateField;
    DataSetFIOTIN: TFIBStringField;
    DataSetFIOFIO: TFIBStringField;
    DataSetFIOOSN_SCH: TFIBStringField;
    DataSetFIOID_OBOROT: TFIBBCDField;
    DataSetFIOLINKTO: TFIBBCDField;
    DataSetFIOR_LEVEL: TFIBIntegerField;
    DataSetFIOR_ID_SESSION: TFIBBCDField;
    DataSetFIOR_DATE_BEGIN: TFIBDateField;
    DataSetFIOR_DATE_END: TFIBDateField;
    DataSetFIOR_ID_MAN: TFIBBCDField;
    DataSetFIOR_ID_SCH: TFIBBCDField;
    DataSetFIOR_ID_SM: TFIBBCDField;
    DataSetFIOR_ID_ST: TFIBBCDField;
    DataSetFIOR_ID_RAZ: TFIBBCDField;
    DataSetFIOR_ID_KEKV: TFIBBCDField;
    DataSetFIOR_J4: TFIBBCDField;
    DataSetFIODEBET_VHOD: TFIBBCDField;
    DataSetFIOKREDIT_VHOD: TFIBBCDField;
    DataSetFIODEBET_VIH: TFIBBCDField;
    DataSetFIOKREDIT_VIH: TFIBBCDField;
    DataSetFIOOBOROT_DEBET: TFIBBCDField;
    DataSetFIOOBOROT_KREDIT: TFIBBCDField;
    DataSetFIOR_DATE: TFIBDateField;
    DataSetFIOID_DOG: TFIBBCDField;
    DataSetFIOKOD_DOG: TFIBBCDField;
    DataSetFIOTAB_NUM: TFIBIntegerField;
    DataSetDebetSUMMA: TFIBBCDField;
    DataSetDebetKOD_SCH: TFIBStringField;
    DataSetDebetDATE_DOC: TFIBDateField;
    DataSetDebetNUM_DOC: TFIBStringField;
    DataSetDebetNAME: TFIBStringField;
    DataSetDebetNUM_SCH_KOR: TFIBStringField;
    DataSetDebetSM_KOD: TFIBIntegerField;
    DataSetDebetRAZ_KOD: TFIBIntegerField;
    DataSetDebetST_KOD: TFIBIntegerField;
    DataSetDebetKEKV_KOD: TFIBIntegerField;
    DataSetDebetS_R_S_K: TFIBStringField;
    DataSetKreditSUMMA: TFIBBCDField;
    DataSetKreditKOD_SCH: TFIBStringField;
    DataSetKreditDATE_DOC: TFIBDateField;
    DataSetKreditNUM_DOC: TFIBStringField;
    DataSetKreditNAME: TFIBStringField;
    DataSetKreditNUM_SCH_KOR: TFIBStringField;
    DataSetKreditSM_KOD: TFIBIntegerField;
    DataSetKreditRAZ_KOD: TFIBIntegerField;
    DataSetKreditST_KOD: TFIBIntegerField;
    DataSetKreditKEKV_KOD: TFIBIntegerField;
    DataSetKreditS_R_S_K: TFIBStringField;
    DataSetFIOS_DEBET: TFIBBCDField;
    DataSetFIOS_KREDIT: TFIBBCDField;
    cxDBTreeList2cxDBTreeListColumn9: TcxDBTreeListColumn;
    cxDBTreeList2cxDBTreeListColumn10: TcxDBTreeListColumn;
    cxDBTreeList2cxDBTreeListColumn4: TcxDBTreeListColumn;
    procedure DataSetFIOAfterScroll(DataSet: TDataSet);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure cxComboBoxSystemClick(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cxDBTreeList2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxDBTreeList2CustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure cxSpinEdit1Click(Sender: TObject);
  private
    IndSystem : array of Int64;
    id_system : int64;
    flag_show_doc : boolean;
  public
    new_alg : integer;
    date_new_alg : TDate;
    constructor Create(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase); reintroduce; overload;
  end;

function AvanceShowOborotNew(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase) : integer; stdcall;
    exports AvanceShowOborotNew;

implementation

uses DateUtils, Un_Progress_form;

{$R *.dfm}

constructor TfmAvanceMainFormSpravka.Create(AOwner: TComponent;
  id_us: int64; DB: TpFIBDatabase);
var
    i, item_index : integer;
    d : TDate;
    T : TfmUn_Progress_form;
    d_vh, k_vh, o_d, o_k, d_vih, k_vih : double;
begin
    inherited Create(AOwner);
    cxSplitter2.CloseSplitter;

    Database := DB;
    pFIBTransaction1.DefaultDatabase := Database;
    DataSetFIO.Transaction           := pFIBTransaction1;
    DataSetDebet.Transaction         := pFIBTransaction1;
    DataSetKredit.Transaction        := pFIBTransaction1;
    DataSetSelectSystem.Transaction  := pFIBTransaction1;
    DataSetFIO.Database              := Database;
    DataSetDebet.Database            := Database;
    DataSetKredit.Database           := Database;
    DataSetSelectSystem.Database     := Database;
    cxSpinEdit1.Value          := YearOf(date);
    cxComboBoxMonth.ItemIndex  := MonthOf(date)-1;

    if cxComboBoxMonth.ItemIndex < 9
         then d := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
         else d := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));

//    DataSetOstatki.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_OSTATOK_PO_FIO(?R_ID_SESSION, ?R_LEVEL, ?R_ID_MAN, ?R_ID_SCH, ?R_ID_SM, ?R_ID_RAZ, ?R_ID_ST, ?R_ID_KEKV, ?R_J4, ?R_DATE_BEGIN, ?R_DATE_END)';

    Caption               := Un_R_file_Alex.J4_OBOROT_CAPTION;
    ActionRefresh.Caption := Un_R_file_Alex.MY_ACTION_REFRESH_CONST;
    ActionClose.Caption   := Un_R_file_Alex.MY_ACTION_CLOSE_CONST;
    cxLabel1.Caption      := Un_R_file_Alex.KASSA_DEBET;
    cxLabel2.Caption      := Un_R_file_Alex.KASSA_KREDIT;
    cxLabel3.Caption      := Un_R_file_Alex.J4_SYSTEM;
    cxLabel4.Caption      := Un_R_file_Alex.J4_OSTATOK_FORM_PERIOD;
    cxLabel5.Caption      := Un_R_file_Alex.J4_OSTATOK_FORM_YEAR;
    Label5.Caption        := Un_R_file_Alex.J4_MAIN_FORM_DATA_BORN;
    Label3.Caption        := Un_R_file_Alex.J4_MAIN_FORM_IDEN_KOD;
    Label1.Caption        := Un_R_file_Alex.J4_MAIN_FORM_FIO;
    cxLabel6.Caption      := Un_R_file_Alex.TAB_NUM;

    cxDBTreeList2cxDBTreeListColumn1.Caption.Text    := Un_R_file_Alex.J4_MAIN_ADD_TAKE_INI;
//    cxGrid2DBBandedTableView1.Bands.Items[0].Caption := Un_R_file_Alex.J4_OBOROT_BAND_OST_VHOD;
//    cxGrid2DBBandedTableView1.Bands.Items[1].Caption := Un_R_file_Alex.J4_OBOROT_BAND_OST_VIHOD;

//    cxGrid2DBBandedTableView1DBBandedColumn1.Caption := Un_R_file_Alex.KASSA_DEBET;
//    cxGrid2DBBandedTableView1DBBandedColumn2.Caption := Un_R_file_Alex.KASSA_KREDIT;
//    cxGrid2DBBandedTableView1DBBandedColumn3.Caption := Un_R_file_Alex.KASSA_DEBET;
//    cxGrid2DBBandedTableView1DBBandedColumn4.Caption := Un_R_file_Alex.KASSA_KREDIT;
    cxDBTreeList2.Bands.Items[0].Caption.Text        := '';
    cxDBTreeList2.Bands.Items[1].Caption.Text        := Un_R_file_Alex.J4_OBOROT_BAND_OST_VHOD;
    cxDBTreeList2.Bands.Items[2].Caption.Text        := Un_R_file_Alex.AVANCE_OBOROT;
    cxDBTreeList2.Bands.Items[3].Caption.Text        := Un_R_file_Alex.J4_OBOROT_BAND_OST_VIHOD;

    cxDBTreeList2cxDBTreeListColumn2.Caption.Text    := Un_R_file_Alex.KASSA_DEBET;
    cxDBTreeList2cxDBTreeListColumn3.Caption.Text    := Un_R_file_Alex.KASSA_KREDIT;
    cxDBTreeList2cxDBTreeListColumn9.Caption.Text    := Un_R_file_Alex.KASSA_DEBET;
    cxDBTreeList2cxDBTreeListColumn10.Caption.Text    := Un_R_file_Alex.KASSA_KREDIT;
    cxDBTreeList2cxDBTreeListColumn6.Caption.Text    := Un_R_file_Alex.KASSA_DEBET;
    cxDBTreeList2cxDBTreeListColumn7.Caption.Text    := Un_R_file_Alex.KASSA_KREDIT;
    cxDBTreeList2cxDBTreeListColumn8.Caption.Text    := Un_R_file_Alex.TAB_NUM;


    cxGrid3DBBandedTableView1.Bands.Items[0].Caption := Un_R_file_Alex.J4_OBOROT_BAND_REKV_DOC;
    cxGrid3DBBandedTableView1.Bands.Items[1].Caption := Un_R_file_Alex.J4_OBOROT_BAND_REKV_PROV;
    cxGrid3DBBandedTableView1DBBandedColumn1.Caption := Un_R_file_Alex.J4_MAIN_FORM_NUMBER;
    cxGrid3DBBandedTableView1DBBandedColumn2.Caption := Un_R_file_Alex.J4_MAIN_FORM_DATA;
    cxGrid3DBBandedTableView1DBBandedColumn3.Caption := Un_R_file_Alex.KASSA_DEBET;
    cxGrid3DBBandedTableView1DBBandedColumn4.Caption := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;

    cxGrid3DBBandedTableView1DBBandedColumn5.Caption := Un_R_file_Alex.KASSA_KOD_S_R_S_K;
    cxGrid3DBBandedTableView1DBBandedColumn6.Caption := Un_R_file_Alex.TYPE_DOC_SHORT;
    cxGrid3DBBandedTableView1DBBandedColumn7.Caption := Un_R_file_Alex.KOR_SCH_SHORT;
//    cxGrid3DBBandedTableView1DBBandedColumn8.Caption := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;



    cxGrid4DBBandedTableView1.Bands.Items[0].Caption := Un_R_file_Alex.J4_OBOROT_BAND_REKV_DOC;
    cxGrid4DBBandedTableView1.Bands.Items[1].Caption := Un_R_file_Alex.J4_OBOROT_BAND_REKV_PROV;
    cxGrid4DBBandedTableView1DBBandedColumn1.Caption := Un_R_file_Alex.J4_MAIN_FORM_NUMBER;
    cxGrid4DBBandedTableView1DBBandedColumn2.Caption := Un_R_file_Alex.J4_MAIN_FORM_DATA;
    cxGrid4DBBandedTableView1DBBandedColumn3.Caption := Un_R_file_Alex.KASSA_KREDIT;
    cxGrid4DBBandedTableView1DBBandedColumn4.Caption := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;
    cxGrid4DBBandedTableView1DBBandedColumn5.Caption := Un_R_file_Alex.TYPE_DOC_SHORT;
    cxGrid4DBBandedTableView1DBBandedColumn6.Caption := Un_R_file_Alex.KOR_SCH_SHORT;
    cxGrid4DBBandedTableView1DBBandedColumn7.Caption := Un_R_file_Alex.KASSA_KOD_S_R_S_K;

    cxCheckBox1.Properties.Caption                   := Un_R_file_Alex.J4_OBOROT_SHOW_DOC;

    flag_show_doc := false;
    pFIBTransaction1.StartTransaction;

    DataSetSelectSystem.Close;
    DataSetSelectSystem.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
    DataSetSelectSystem.Open;
    new_alg := DataSetSelectSystem.FieldByName('FLAG_NEW_ALGORITHM').AsInteger;
    date_new_alg := DataSetSelectSystem.FieldByName('DATE_NEW_ALGORITHM').AsDateTime;

    {загрузка журнала}
    DataSetSelectSystem.Close;
    DataSetSelectSystem.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SP_JO WHERE SYSTEM_OPEN = '+ QuotedStr(IntToStr(1))+'';
    DataSetSelectSystem.Open;
    If DataSetSelectSystem.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.J4_WARNING_LOAD_JORNAL), PChar(Un_R_file_Alex.J4_SP_RAZDELENIE_MESSAGA), 16);
        close;
    end;
    DataSetSelectSystem.Close;
    DataSetSelectSystem.SQLs.SelectSQL.Text := ' SELECT * FROM J4_SP_JO ';
    DataSetSelectSystem.open;
    DataSetSelectSystem.FetchAll;
    SetLength(IndSystem, DataSetSelectSystem.RecordCount);
    DataSetSelectSystem.First;
    {i := 0;
    While not DataSetSelectSystem.Eof do
    begin
        IndSystem[DataSetSelectSystem.RecNo - 1] := DataSetSelectSystem['ID_J4_SP_JO'];
        IF DataSetSelectSystem.FieldByName('SYSTEM_OPEN').Asinteger <> 1 THEN
            cxComboBoxSystem.Properties.Items.Add(DataSetSelectSystem.FieldByName('FULL_NAME').AsString)
        else
        begin
            cxComboBoxSystem.Properties.Items.Insert(0, DataSetSelectSystem.FieldByName('FULL_NAME').AsString);
//            kod_system       := DataSetSelectSystem.FieldByName('KOD').AsString;
            id_system        := TFIBBCDField(DataSetSelectSystem.FieldByName('ID_J4_SP_JO')).AsInt64;
            i := DataSetSelectSystem.RecNo - 1;
//            Caption          := DataSetSelectSystem.FieldByName('FULL_NAME').AsString;
        end;
        DataSetSelectSystem.Next;
    end;
    DataSetSelectSystem.Close;
    cxComboBoxSystem.ItemIndex := i; }

    i := 0;
    item_index := 0;
    cxComboBoxSystem.Properties.Items.Clear;

    While not DataSetSelectSystem.Eof do
    begin
        IndSystem[DataSetSelectSystem.RecNo - 1] := DataSetSelectSystem['ID_J4_SP_JO'];
        cxComboBoxSystem.Properties.Items.Add(DataSetSelectSystem.FieldByName('SHORT_NAME').AsString);
        IF DataSetSelectSystem.FieldByName('SYSTEM_OPEN').Asinteger = 1 THEN
        begin
            //kod_system       := DataSetSelectSystem.FieldByName('KOD').AsString;
            id_system        := TFIBBCDField(DataSetSelectSystem.FieldByName('ID_J4_SP_JO')).AsInt64;
            //Caption          := DataSetSelectSystem.FieldByName('FULL_NAME').AsString;
            item_index       := i;
        end;
        inc(i);
        DataSetSelectSystem.Next;
    end;
    DataSetSelectSystem.Close;
    cxComboBoxSystem.ItemIndex := item_index; 

    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.J4_WAIT_DANN);
    T.Show;
    T.Update;
    if (new_alg = 1) and (date_new_alg<=d) then
    begin
        DataSetFIO.SQLs.SelectSQL.Text     := 'SELECT * FROM J4_SELECT_OBOROTI_FIO_NEW_ALG('''+DateToStr(d)+''', '+IntToStr(id_system)+') where FIO <> '+QuotedStr('1')+'';
    end;
    DataSetFIO.Open;
    d_vh  := 0;
    k_vh  := 0;
    o_d   := 0;
    o_k   := 0;
    d_vih := 0;
    k_vih := 0;
{    DataSetFIO.First;
    while not DataSetFIO.Eof do
    begin
        if DataSetFIO.FieldByName('ALL_SUM_VH_OST_D').AsFloat <> null then
            if DataSetFIO.FieldByName('ALL_SUM_VH_OST_D').AsFloat > d_vh then d_vh := DataSetFIO.FieldByName('ALL_SUM_VH_OST_D').AsFloat;

        if DataSetFIO.FieldByName('ALL_SUM_VH_OST_K').AsFloat <> null then
            if DataSetFIO.FieldByName('ALL_SUM_VH_OST_K').AsFloat > k_vh then k_vh := DataSetFIO.FieldByName('ALL_SUM_VH_OST_K').AsFloat;

        if DataSetFIO.FieldByName('ALL_SUM_VIH_OST_K').AsFloat <> null then
            if DataSetFIO.FieldByName('ALL_SUM_VIH_OST_K').AsFloat > k_vih then k_vih := DataSetFIO.FieldByName('ALL_SUM_VIH_OST_K').AsFloat;

        if DataSetFIO.FieldByName('ALL_SUM_VIH_OST_D').AsFloat <> null then
            if DataSetFIO.FieldByName('ALL_SUM_VIH_OST_D').AsFloat > o_k then o_k := DataSetFIO.FieldByName('ALL_SUM_VIH_OST_D').AsFloat;

        if DataSetFIO.FieldByName('ALL_SUMM_OB_DEB').AsFloat <> null then
            if DataSetFIO.FieldByName('ALL_SUMM_OB_DEB').AsFloat > o_d then o_d := DataSetFIO.FieldByName('ALL_SUMM_OB_DEB').AsFloat;

        if DataSetFIO.FieldByName('ALL_SUMM_OB_KRED').AsFloat <> null then
            if DataSetFIO.FieldByName('ALL_SUMM_OB_KRED').AsFloat > o_k then o_k := DataSetFIO.FieldByName('ALL_SUMM_OB_KRED').AsFloat;

        DataSetFIO.Next;
    end;
    if d_vh <> 0  then try cxTextEdit6.Text := FloatToStr(d_vh)  except cxTextEdit6.Text := ''; end;
    if k_vh <> 0  then try cxTextEdit5.Text := FloatToStr(k_vh)  except cxTextEdit5.Text := ''; end;
    if o_d <> 0   then try cxTextEdit4.Text := FloatToStr(o_d)   except cxTextEdit4.Text := ''; end;
    if o_k <> 0   then try cxTextEdit3.Text := FloatToStr(o_k)   except cxTextEdit3.Text := ''; end;
    if d_vih <> 0 then try cxTextEdit2.Text := FloatToStr(d_vih) except cxTextEdit2.Text := ''; end;
    if k_vih <> 0 then try cxTextEdit1.Text := FloatToStr(k_vih) except cxTextEdit1.Text := ''; end;
}    SpeedButton2Click(Self);
    T.Free;
end;

function AvanceShowOborotNew(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase) : integer; stdcall;
var
    T : TfmAvanceMainFormSpravka;
begin
    T := TfmAvanceMainFormSpravka.Create(AOwner, id_us, DB);
    T.ShowModal;
    T.Free;
    AvanceShowOborotNew := -1;
end;

procedure TfmAvanceMainFormSpravka.DataSetFIOAfterScroll(
  DataSet: TDataSet);
var
    T : TfmUn_Progress_form;
    r_lev, r_id_m, r_id_s, r_id_sm, r_id_r, r_id_st, r_id_k, r_id_j, r_id_d, r_kod_d : int64;
    r_date, d : TDate;
begin
    if DataSetFIO.IsEmpty then exit;
    try Label2.Text := DataSetFIOFAMILIA.AsString +' ' + DataSetFIOIMYA.AsString + ' ' + DataSetFIOOTCHESTVO.AsString; except Label2.Text := ''; end;
    IF DataSetFIO['TIN'] <> null then
        Label4.Caption := DataSetFIO['TIN'];
    IF DataSetFIO['BIRTHDAY'] <> null then
        Label6.Caption := DataSetFIO['BIRTHDAY'];
    try cxLabel7.Text := DataSetFIOTAB_NUM.AsString except cxLabel7.Text := ''; end;
    if flag_show_doc then
    begin
        cxDBTreeList2.IsFocused;
        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.J4_WAIT_DANN);
        T.Show;
        T.Update;
        if cxComboBoxMonth.ItemIndex < 9
            then d := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
            else d := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
        DataSetDebet.Close;
        DataSetKredit.Close;
        if DataSetFIO.FieldByName('R_LEVEL').AsVariant  <> null  then r_lev   := DataSetFIO.FieldByName('R_LEVEL').AsVariant   else r_lev   := 0;
        if DataSetFIO.FieldByName('R_ID_MAN').AsVariant <> null  then r_id_m  := DataSetFIO.FieldByName('R_ID_MAN').AsVariant  else r_id_m  := 0;
        if DataSetFIO.FieldByName('R_ID_SCH').AsVariant <> null  then r_id_s  := DataSetFIO.FieldByName('R_ID_SCH').AsVariant  else r_id_s  := 0;
        if DataSetFIO.FieldByName('R_ID_SM').AsVariant  <> null  then r_id_sm := DataSetFIO.FieldByName('R_ID_SM').AsVariant   else r_id_sm := 0;
        if DataSetFIO.FieldByName('R_ID_RAZ').AsVariant <> null  then r_id_r  := DataSetFIO.FieldByName('R_ID_RAZ').AsVariant  else r_id_r  := 0;
        if DataSetFIO.FieldByName('R_ID_ST').AsVariant  <> null  then r_id_st := DataSetFIO.FieldByName('R_ID_ST').AsVariant   else r_id_st := 0;
        if DataSetFIO.FieldByName('R_ID_KEKV').AsVariant <> null then r_id_k  := DataSetFIO.FieldByName('R_ID_KEKV').AsVariant else r_id_k  := 0;
        if DataSetFIO.FieldByName('R_J4' ).AsVariant     <> null then r_id_j  := DataSetFIO.FieldByName('R_J4').AsVariant      else r_id_j  := 0;
        if DataSetFIO.FieldByName('ID_DOG').AsVariant   <> null  then r_id_d  := DataSetFIO.FieldByName('ID_DOG').AsVariant    else r_id_d  := 0;
        if DataSetFIO.FieldByName('KOD_DOG').AsVariant  <> null  then r_kod_d := DataSetFIO.FieldByName('KOD_DOG').AsVariant   else r_kod_d := 0;
//        r_date  := DataSetFIO.FieldByName('R_DATE').AsDateTime;
        DataSetDebet.SQLs.SelectSQL.Text   := 'SELECT * FROM J4_SELECT_OBOROT_BUH_NEW_ALG('+IntToStr(R_LEV)+', '+IntToStr(R_ID_M)+', '+IntToStr(R_ID_S)+', '+IntToStr(R_ID_SM)+', '+IntToStr(r_id_r)+', '+IntToStr(R_ID_ST)+', '+IntToStr(r_id_k)+', '+IntToStr(1)+', '+IntToStr(r_id_j)+', '''+DateToStr(D)+''', '+IntToStr(r_id_d)+', '+IntToStr(r_kod_d)+')';
        DataSetKredit.SQLs.SelectSQL.Text  := 'SELECT * FROM J4_SELECT_OBOROT_BUH_NEW_ALG('+IntToStr(R_LEV)+', '+IntToStr(R_ID_M)+', '+IntToStr(R_ID_S)+', '+IntToStr(r_id_sm)+', '+IntToStr(R_ID_R)+', '+IntToStr(R_ID_ST)+', '+IntToStr(r_id_k)+', '+IntToStr(0)+', '+IntToStr(r_id_j)+', '''+DateToStr(d)+''', '+IntToStr(r_id_d)+', '+IntToStr(r_kod_d)+')';
        DataSetDebet.Open;
        DataSetKredit.Open;
        T.Free;
    end;
end;

procedure TfmAvanceMainFormSpravka.ActionRefreshExecute(Sender: TObject);
var
    d : TDate;
    d_vh, k_vh, o_d, o_k, d_vih, k_vih : double;
    T : TfmUn_Progress_form;
begin
    cxDBTreeList2.IsFocused;
    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.J4_WAIT_DANN);
    T.Show;
    T.Update;
    if cxComboBoxMonth.ItemIndex < 9
         then d := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
         else d := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
    DataSetFIO.Close;
    if (new_alg = 1) and (date_new_alg<=d) then
    begin
        DataSetFIO.SQLs.SelectSQL.Text     := 'SELECT * FROM J4_SELECT_OBOROTI_FIO_NEW_ALG('''+DateToStr(d)+''', '+IntToStr(id_system)+') where FIO <> '+QuotedStr('1')+'';
    end;
    DataSetFIO.Open;
{    d_vh  := 0;
    k_vh  := 0;
    o_d   := 0;
    o_k   := 0;
    d_vih := 0;
    k_vih := 0;
    DataSetFIO.First;
    while not DataSetFIO.Eof do
    begin
        if DataSetFIO.FieldByName('ALL_SUM_VH_OST_D').AsFloat <> null then
            if DataSetFIO.FieldByName('ALL_SUM_VH_OST_D').AsFloat > d_vh then d_vh := DataSetFIO.FieldByName('ALL_SUM_VH_OST_D').AsFloat;

        if DataSetFIO.FieldByName('ALL_SUM_VH_OST_K').AsFloat <> null then
            if DataSetFIO.FieldByName('ALL_SUM_VH_OST_K').AsFloat > k_vh then k_vh := DataSetFIO.FieldByName('ALL_SUM_VH_OST_K').AsFloat;

        if DataSetFIO.FieldByName('ALL_SUM_VIH_OST_K').AsFloat <> null then
            if DataSetFIO.FieldByName('ALL_SUM_VIH_OST_K').AsFloat > k_vih then k_vih := DataSetFIO.FieldByName('ALL_SUM_VIH_OST_K').AsFloat;

        if DataSetFIO.FieldByName('ALL_SUM_VIH_OST_D').AsFloat <> null then
            if DataSetFIO.FieldByName('ALL_SUM_VIH_OST_D').AsFloat > o_k then o_k := DataSetFIO.FieldByName('ALL_SUM_VIH_OST_D').AsFloat;

        if DataSetFIO.FieldByName('ALL_SUMM_OB_DEB').AsFloat <> null then
            if DataSetFIO.FieldByName('ALL_SUMM_OB_DEB').AsFloat > o_d then o_d := DataSetFIO.FieldByName('ALL_SUMM_OB_DEB').AsFloat;

        if DataSetFIO.FieldByName('ALL_SUMM_OB_KRED').AsFloat <> null then
            if DataSetFIO.FieldByName('ALL_SUMM_OB_KRED').AsFloat > o_k then o_k := DataSetFIO.FieldByName('ALL_SUMM_OB_KRED').AsFloat;

        DataSetFIO.Next;
    end;
    if d_vh <> 0  then try cxTextEdit6.Text := FloatToStr(d_vh)  except cxTextEdit6.Text := ''; end;
    if k_vh <> 0  then try cxTextEdit5.Text := FloatToStr(k_vh)  except cxTextEdit5.Text := ''; end;
    if o_d <> 0   then try cxTextEdit4.Text := FloatToStr(o_d)   except cxTextEdit4.Text := ''; end;
    if o_k <> 0   then try cxTextEdit3.Text := FloatToStr(o_k)   except cxTextEdit3.Text := ''; end;
    if d_vih <> 0 then try cxTextEdit2.Text := FloatToStr(d_vih) except cxTextEdit2.Text := ''; end;
    if k_vih <> 0 then try cxTextEdit1.Text := FloatToStr(k_vih) except cxTextEdit1.Text := ''; end;
}    SpeedButton2Click(Sender);
    T.Free;
end;

procedure TfmAvanceMainFormSpravka.cxComboBoxSystemClick(Sender: TObject);
var
    i : integer;
begin
        i := cxComboBoxSystem.ItemIndex;
        if id_system <> IndSystem[i] then
        begin
            id_system        := IndSystem[i];
            ActionRefreshExecute(Sender);
        end;
end;

procedure TfmAvanceMainFormSpravka.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAvanceMainFormSpravka.SpeedButton1Click(Sender: TObject);
begin
    cxDBTreeList2.FullExpand;
end;

procedure TfmAvanceMainFormSpravka.SpeedButton2Click(Sender: TObject);
begin
    cxDBTreeList2.FullCollapse;
end;

procedure TfmAvanceMainFormSpravka.cxDBTreeList2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (KEY=VK_LEFT) then
    begin
       if cxDBTreeList2.FocusedNode<>nil
           then cxDBTreeList2.FocusedNode.Collapse(true);
    end;
    if (KEY=VK_RIGHT) then
    begin
       if cxDBTreeList2.FocusedNode<>nil
           then cxDBTreeList2.FocusedNode.Expand(false);
    end;
end;

procedure TfmAvanceMainFormSpravka.cxCheckBox1Click(Sender: TObject);
var
    T : TfmUn_Progress_form;
    r_lev, r_id_m, r_id_s, r_id_sm, r_id_r, r_id_st, r_id_k, r_id_j, r_id_d, r_kod_d : int64;
    r_date, d : TDate;
begin
    if cxCheckBox1.Checked then
    begin
        if DataSetFIO.IsEmpty then exit;
        cxSplitter2.OpenSplitter;
        cxDBTreeList2.IsFocused;
        T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.J4_WAIT_DANN);
        T.Show;
        T.Update;
        if cxComboBoxMonth.ItemIndex < 9
            then d := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
            else d := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
        DataSetDebet.Close;
        DataSetKredit.Close;
        if DataSetFIO.FieldByName('R_LEVEL').AsVariant  <> null then r_lev   := DataSetFIO.FieldByName('R_LEVEL').AsVariant  else r_lev   := 0;
        if DataSetFIO.FieldByName('R_ID_MAN').AsVariant <> null then r_id_m  := DataSetFIO.FieldByName('R_ID_MAN').AsVariant else r_id_m  := 0;
        if DataSetFIO.FieldByName('R_ID_SCH').AsVariant <> null then r_id_s  := DataSetFIO.FieldByName('R_ID_SCH').AsVariant else r_id_s  := 0;
        if DataSetFIO.FieldByName('R_ID_SM').AsVariant  <> null then r_id_sm := DataSetFIO.FieldByName('R_ID_SM').AsVariant  else r_id_sm := 0;
        if DataSetFIO.FieldByName('R_ID_RAZ').AsVariant <> null then r_id_r  := DataSetFIO.FieldByName('R_ID_RAZ').AsVariant else r_id_r  := 0;
        if DataSetFIO.FieldByName('R_ID_ST').AsVariant  <> null then r_id_st := DataSetFIO.FieldByName('R_ID_ST').AsVariant  else r_id_st := 0;
        if DataSetFIO.FieldByName('R_ID_KEKV').AsVariant <> null then r_id_k  := DataSetFIO.FieldByName('R_ID_KEKV').AsVariant else r_id_k := 0;
        if DataSetFIO.FieldByName('R_J4').AsVariant     <> null then r_id_j  := DataSetFIO.FieldByName('R_J4').AsVariant     else r_id_j  := 0;
        if DataSetFIO.FieldByName('ID_DOG').AsVariant   <> null then r_id_d  := DataSetFIO.FieldByName('ID_DOG').AsVariant   else r_id_d  := 0;
        if DataSetFIO.FieldByName('KOD_DOG').AsVariant  <> null then r_kod_d := DataSetFIO.FieldByName('KOD_DOG').AsVariant  else r_kod_d := 0;
        DataSetDebet.SQLs.SelectSQL.Text   := 'SELECT * FROM J4_SELECT_OBOROT_BUH_NEW_ALG('+IntToStr(R_LEV)+', '+IntToStr(R_ID_M)+', '+IntToStr(R_ID_S)+', '+IntToStr(R_ID_SM)+', '+IntToStr(r_id_r)+', '+IntToStr(R_ID_ST)+', '+IntToStr(r_id_k)+', '+IntToStr(1)+', '+IntToStr(r_id_j)+', '''+DateToStr(D)+''', '+IntToStr(r_id_d)+', '+IntToStr(r_kod_d)+')';
        DataSetKredit.SQLs.SelectSQL.Text  := 'SELECT * FROM J4_SELECT_OBOROT_BUH_NEW_ALG('+IntToStr(R_LEV)+', '+IntToStr(R_ID_M)+', '+IntToStr(R_ID_S)+', '+IntToStr(r_id_sm)+', '+IntToStr(R_ID_R)+', '+IntToStr(R_ID_ST)+', '+IntToStr(r_id_k)+', '+IntToStr(0)+', '+IntToStr(r_id_j)+', '''+DateToStr(d)+''', '+IntToStr(r_id_d)+', '+IntToStr(r_kod_d)+')';
        DataSetDebet.Open;
        DataSetKredit.Open;
        T.Free;
        flag_show_doc := true;
    end else
    begin
        cxSplitter2.CloseSplitter;
        DataSetDebet.Close;
        DataSetKredit.Close;
        flag_show_doc := false;
    end;
end;

procedure TfmAvanceMainFormSpravka.cxDBTreeList2CustomDrawCell(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.Node.Focused) then
  begin   // остальные
      ACanvas.Font.Color := clWhite;
      exit;
  end;
  if (AViewInfo.Node.Values[cxDBTreeList2cxDBTreeListColumn4.ItemIndex] = 0) and (not AViewInfo.Node.Focused) then
  begin //выход дебет и кредит
      ACanvas.Font.Color := RGB(0, 0, 0);//оранжевый;
      exit;
  end; //выход дебет или кредит
  if (AViewInfo.Node.Values[cxDBTreeList2cxDBTreeListColumn6.ItemIndex] > 0) and (AViewInfo.Node.Values[cxDBTreeList2cxDBTreeListColumn7.ItemIndex] > 0) and (not AViewInfo.Node.Focused) then
  begin //выход дебет и кредит
      ACanvas.Font.Color := RGB(255, 0, 0);//оранжевый;
      exit;
  end; //выход дебет или кредит
  if (AViewInfo.Node.Values[cxDBTreeList2cxDBTreeListColumn6.ItemIndex] > 0) or (AViewInfo.Node.Values[cxDBTreeList2cxDBTreeListColumn7.ItemIndex] > 0) and (not AViewInfo.Node.Focused) then
  begin //
      ACanvas.Font.Color := RGB(0, 0, 255);
      exit;
  end;
  if (not AViewInfo.Node.Focused) then
  begin   // остальные
      ACanvas.Font.Color := RGB(51,102,0);//темно-зелёный;
  end;
end;

procedure TfmAvanceMainFormSpravka.cxSpinEdit1Click(Sender: TObject);
begin
    cxSpinEdit1.Value := cxSpinEdit1.Text;
end;

end.
