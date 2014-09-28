unit ResultAnalitGotOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, ActnList,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ImgList, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGrid, dxStatusBar,
  dxBar, dxBarExtItems, FIBQuery, pFIBQuery, pFIBStoredProc, StdCtrls,
  cxTextEdit, cxCurrencyEdit, cxExportGrid4Link ;

type
  TfmResultAnalitGotOper = class(TForm)
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
    dxStatusBar1: TdxStatusBar;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1Level1: TcxGridLevel;
    ImageList: TImageList;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    pFIBDataSet1R_DATE_DOC: TFIBDateField;
    pFIBDataSet1R_NUM_DOC: TFIBStringField;
    pFIBDataSet1R_NAME_CUST: TFIBStringField;
    pFIBDataSet1R_PRIHOD: TFIBBCDField;
    pFIBDataSet1R_RASHOD: TFIBBCDField;
    pFIBDataSet1R_NOTE: TFIBStringField;
    pFIBDataSet1R_NAME_RAS_CUST: TFIBStringField;
    pFIBDataSet1R_MFO_CUST: TFIBStringField;
    pFIBDataSet1R_NAME_MFO_CUST: TFIBStringField;
    pFIBDataSet1R_OKPO_CUST: TFIBStringField;
    DataSource1: TDataSource;
    ActionList1: TActionList;
    ActionFilter: TAction;
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
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    DataSet: TpFIBDataSet;
    TransactionWrite: TpFIBTransaction;
    DataSetKekv: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    Action1: TAction;
    dxBarLargeButton14: TdxBarLargeButton;
    ActionExport: TAction;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AnalitCreate(filt : boolean);
    procedure ActionCloseExecute(Sender: TObject);
    procedure CreateBandIntoGrid(num1, n_band : integer; date_kassa : string);
    procedure ActionFilterExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionExportExecute(Sender: TObject);
  private
    id_sch, id_user : int64;
    date1, date2 : TDate;
    priznak : integer;
    id_sc, id_pvr, id_tfr : int64;
    pv_kodr, pv_titler, tf_kodr, tf_titler : string;
  public
    constructor Create(AOwner: TComponent; id_us : int64; DB : TpFIBDatabase; d1, d2 : TDate; p : integer; id_sch, id_pv, id_tf : int64;  pv_kod, pv_title, tf_kod, tf_title : string); reintroduce; overload;
  end;

function ShowKassaAnalitRes(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase):integer; stdcall;
 exports ShowKassaAnalitRes;

implementation
uses FilterAnalitGotOper, Un_R_file_Alex, Un_Progress_form;
{$R *.dfm}

function ShowKassaAnalitRes(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase):integer;stdcall;
var
    T : TfmResultAnalitGotOper;
    d1, d2 : TDate;
    p : integer;
    id_s, id_pkv, id_tfin : int64;
    pkv_kod, pkv_title, tfin_kod, tfin_title : string;
begin
    id_pkv          := -1;
    id_tfin         := -1;
    pkv_kod         := '';
    pkv_title       := '';
    tfin_kod        := '';
    tfin_title      := '';
    d2              := date;
    d1              := strToDate('01.'+copy(DateToStr(d2), 4, 7));
    if ShowFilterKassaAnalit(d1, d2, p, DB, id_s, id_pkv, id_tfin,id_us, pkv_kod, pkv_title, tfin_kod, tfin_title) then
    begin
        T := TfmResultAnalitGotOper.Create(AOwner, id_us, DB, d1, d2, p, id_s, id_pkv, id_tfin, pkv_kod, pkv_title, tfin_kod, tfin_title);
        T.FormStyle := fsMdiChild;
    end;
end;

constructor TfmResultAnalitGotOper.Create(AOwner: TComponent; id_us: int64;
  DB: TpFIBDatabase; d1, d2 : TDate; p : integer; id_sch, id_pv, id_tf : int64;  pv_kod, pv_title, tf_kod, tf_title : string);
begin
    inherited Create (AOwner);

    Database                    := DB;
    Transaction.DefaultDatabase := Database;
    Database.DefaultTransaction := Transaction;
    pFIBDataSet1.Database       := Database;
    pFIBDataSet1.Transaction    := Transaction;
    Transaction.StartTransaction;

    TransactionWrite.DefaultDatabase := Database;
    DataSet.Database                 := Database;
    DataSet.Transaction              := TransactionWrite;
    DataSetKekv.Database             := Database;
    DataSetKekv.Transaction          := TransactionWrite;
    StoredProc.Database              := Database;
    StoredProc.Transaction           := TransactionWrite;

    cxGrid1DBBandedTableView1DBBandedColumn1.Caption := Un_R_file_Alex.KASSA_ANALIT_KFK;
    cxGrid1DBBandedTableView1DBBandedColumn2.Caption := Un_R_file_Alex.KASSA_KEKV;
    cxGrid1DBBandedTableView1DBBandedColumn3.Caption := Un_R_file_Alex.KASSA_RAZD;
    cxGrid1DBBandedTableView1DBBandedColumn4.Caption := Un_R_file_Alex.KASSA_ANALIT_OST_MONTH;
    ActionFilter.Caption                             := Un_R_file_Alex.MY_ACTION_FILTER_CONST;
    ActionRefresh.Caption                            := Un_R_file_Alex.MY_ACTION_REFRESH_CONST;
    ActionClose.Caption                              := Un_R_file_Alex.MY_ACTION_CLOSE_CONST;
    Caption                                          := Un_R_file_Alex.KASSA_ANALIT_RESULT + Un_R_file_Alex.KASSA_PO_PROGRAMM + pv_kod + Un_R_file_Alex.KASSA_PO_TYPE + tf_kod;
    ActionExport.Caption                             := Un_R_file_Alex.MY_BUTTON_EXPORT_TO_EXCEL;

    TransactionWrite.StartTransaction;


    id_sc   := id_sch;
    date1   := d1;
    date2   := d2;
    priznak := p;
    id_user := id_us;

    id_pvr    := id_pv;
    id_tfr    := id_tf;
    pv_kodr   := pv_kod;
    pv_titler := pv_title;
    tf_kodr   := tf_kod;
    tf_titler := tf_title;

    AnalitCreate(false);
end;

procedure TfmResultAnalitGotOper.AnalitCreate(filt : boolean);
var
    id_ses, id_kekv, id_smeta : int64;
    dd, script : string;
    i, j, count_bands, k : integer;
    T : TfmUn_Progress_form;
begin
    if filt then
    begin
        if ShowFilterKassaAnalit(date1, date2, priznak, Database, id_sc, id_pvr, id_tfr,id_user, pv_kodr, pv_titler, tf_kodr, tf_titler) then
        begin
            count_bands := cxGrid1DBBandedTableView1.Bands.Count;
            for k := count_bands-1 downto 1 do
                cxGrid1DBBandedTableView1.Bands[k].Destroy;
            Caption := Un_R_file_Alex.KASSA_ANALIT_RESULT + Un_R_file_Alex.KASSA_PO_PROGRAMM + pv_kodr + Un_R_file_Alex.KASSA_PO_TYPE + tf_kodr;
        end else
        begin
            exit;
        end;
    end;
    T := TfmUn_Progress_form.Create(nil, wait_, Un_R_file_Alex.WAIT_OTBOR_D);
    T.Show;
    T.UpDate;

    DataSet.Close;
    DataSet.Sqls.SelectSql.Text := 'SELECT * from Pub_Get_Id_By_Gen_Ex('''+'GEN_KASSA_OST'+''', '+IntToStr(1)+')';
    DataSet.Open;
    id_ses := StrToint64(DataSet.Fbn('RET_VALUE').ASString);

    StoredProc.StoredProcName := 'KASSA_SELECT_OST_INTO_TEMP';
    StoredProc.ParamByName('D_DATE_BEGIN').AsDateTime := date1;
    StoredProc.ParamByName('D_DATE_END').AsDateTime   := date2;
    StoredProc.ParamByName('R_ID_SESSION').AsInt64    := id_ses;
    StoredProc.ParamByName('D_ID_SCH').AsInt64        := id_sc;//id_sch;
    StoredProc.ExecProc;

{По Ярику}
    StoredProc.StoredProcName := 'KASSA_TEMP_DELETE_SMETA_ANALITI';
    StoredProc.ParamByName('D_DATE_BEG').AsDateTime     := date1;
    StoredProc.ParamByName('D_DATE_END').AsDateTime     := date2;
    StoredProc.ParamByName('D_ID_SESSION').AsInt64      := id_ses;
    StoredProc.ParamByName('D_ID_PKV').AsInt64          := id_pvr;
    StoredProc.ParamByName('D_ID_TYPE_FINANCE').AsInt64 := id_tfr;
    StoredProc.ExecProc;

    DataSet.Close;
    DataSet.Sqls.SelectSql.Text := 'SELECT * from KASSA_SELECT_DAY_FOR_OST('+IntToStr(id_ses)+', '''+dateToStr(date1)+''', '''+dateToStr(date2)+''')';
    DataSet.Open;
    DataSet.First;
    i := 1;
    j := 1;
    if priznak = 1 then
    begin
        cxGrid1DBBandedTableView1DBBandedColumn3.Visible := false;
        cxGrid1DBBandedTableView1DBBandedColumn2.Visible := true;
    end;
    if priznak = 2 then
    begin
        cxGrid1DBBandedTableView1DBBandedColumn2.Visible := false;
        cxGrid1DBBandedTableView1DBBandedColumn3.Visible := true;
    end;
    if priznak = 3 then
    begin
        cxGrid1DBBandedTableView1DBBandedColumn2.Visible := true;
        cxGrid1DBBandedTableView1DBBandedColumn3.Visible := true;
    end;

{    if priznak = 1 then
    begin
        script := 'SELECT K.R_KOD_KFK, K.R_ID_KEKV, K.R_KOD_KEKV, K.R_ID_SMETA, K.R_OST_ON_BEGIN ';
        cxGrid1DBBandedTableView1DBBandedColumn3.Visible := false;
    end;
    if priznak = 2 then
    begin
        script := 'SELECT K.R_KOD_KFK, K.R_KOD_RAZD, K.R_ID_SMETA, K.R_OST_ON_BEGIN ';
        cxGrid1DBBandedTableView1DBBandedColumn2.Visible := false;
    end;
    if priznak = 3 then}
        script := 'SELECT K.R_KOD_KFK, K.R_ID_KEKV, K.R_KOD_KEKV, K.R_KOD_RAZD, K.R_ID_SMETA, K.R_ID_RAZD, K.R_OST_ON_BEGIN ';

    DataSet.First;
    while not DataSet.Eof do
    begin
        dd := DataSet.fbn('R_DATE_PROV').AsString;
        CreateBandIntoGrid(i, j, dd);
        script := script + ', (select R_OBOROT_DEBET  from KASSA_SELECT_SUM_PO_KEKV_DATE(K.R_ID_KEKV, K.R_ID_SMETA, '''+dd+''', '+IntToStr(id_ses)+', K.R_ID_RAZD, '+IntToStr(priznak)+')) as b'+IntToStr(i)+' ';
        inc(i);
        script := script + ', (select R_OBOROT_KREDIT from KASSA_SELECT_SUM_PO_KEKV_DATE(K.R_ID_KEKV, K.R_ID_SMETA, '''+dd+''', '+IntToStr(id_ses)+', K.R_ID_RAZD, '+IntToStr(priznak)+')) as b'+IntToStr(i)+' ';
        inc(i);
        script := script + ', (select R_OST           from KASSA_SELECT_SUM_PO_KEKV_DATE(K.R_ID_KEKV, K.R_ID_SMETA, '''+dd+''', '+IntToStr(id_ses)+', K.R_ID_RAZD, '+IntToStr(priznak)+')) as b'+IntToStr(i)+' ';
        inc(i);

        inc(j);
        DataSet.Next;
    end;
    script := script + ' from KASSA_SELECT_KEKV_SMETA_OST('+IntToStr(id_ses)+', '''+dateToStr(date1)+''', '''+dateToStr(date2)+''', '+IntToStr(priznak)+') k ';
{    if priznak = 1 then
        script := script + ' group by K.R_KOD_KFK, K.R_ID_KEKV, K.R_KOD_KEKV, K.R_ID_SMETA, K.R_OST_ON_BEGIN ';
    if priznak = 2 then
        script := script + ' group by K.R_KOD_KFK, K.R_KOD_RAZD, K.R_ID_SMETA, K.R_OST_ON_BEGIN ';
    if priznak = 3 then}
        script := script + ' group by K.R_KOD_KFK, K.R_ID_KEKV, K.R_KOD_KEKV, K.R_KOD_RAZD, K.R_ID_SMETA, K.R_ID_RAZD, K.R_OST_ON_BEGIN ';

//showmessage(script);
    DataSet.Close;

    cxGrid1DBBandedTableView1.OptionsCustomize.BandHiding := true;
    cxGrid1DBBandedTableView1.OptionsCustomize.BandSizing := true;
    cxGrid1DBBandedTableView1.OptionsCustomize.BandMoving := true;
    DataSetKekv.Close;
    DataSetKekv.Sqls.SelectSQL.Text := script;
    DataSetKekv.Open;

    T.Free;
end;

procedure TfmResultAnalitGotOper.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Transaction.Rollback;
    if FormStyle = fsMDIChild then Action := CaFree;
end;

procedure TfmResultAnalitGotOper.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmResultAnalitGotOper.CreateBandIntoGrid(num1, n_band: integer; date_kassa : string);
var
    t : array of TcxGridDbBandedColumn;
begin
    SetLength(t, 3);
    cxGrid1DBBandedTableView1.Bands.Add;
    cxGrid1DBBandedTableView1.Bands[n_band].Caption := 'За звітом касира за ' + date_kassa;
//    cxGrid1DBBandedTableView1.Bands[n_band].FixedKind := fkLeft;
    cxGrid1DBBandedTableView1.Bands[n_band].Width := 210;

    t[0] := cxGrid1DBBandedTableView1.CreateColumn;
    t[0].DataBinding.FieldName := 'b'+intToStr(num1);
    t[0].Caption               := 'надходження';
    t[0].Position.BandIndex    := n_band;
    t[0].Width                 := 70;
//    t[0].Properties.GetStyleClass            := cxCurrencyEdit;
//    t[0].Properties.DisplayFormat := ',0.00грн'.';-,0.00грн'.'';
    t[0].HeaderAlignmentHorz   := taCenter;
//    t[0].MinWidth              := 60;
    with cxGrid1DBBandedTableView1.DataController.Summary.FooterSummaryItems.Add as TcxGridDbBandedTableSummaryItem do
    begin
        Column    := T[0];
        fieldName := 'b'+intToStr(num1);
        kind      := skSum;
        Format    := '0.00грн.;-0.00грн.';
    end;
    with cxGrid1DBBandedTableView1.DataController.Summary.DefaultGroupSummaryItems.Add as TcxGridDbBandedTableSummaryItem do
    begin
        Column    := T[0];
        fieldName := 'b'+intToStr(num1);
        kind      := skSum;
        Format    := '0.00грн.;-0.00грн.';
    end;

    t[1] := cxGrid1DBBandedTableView1.CreateColumn;
    t[1].DataBinding.FieldName := 'b'+intToStr(num1+1);
    t[1].Caption               := 'видаток';
    t[1].Position.BandIndex    := n_band;
    t[1].Width                 := 70;
    t[1].HeaderAlignmentHorz   := taCenter;
//    t[1].Properties            := CurrencyEdit;
//    t[1].Properties.DisplayFormat := ',0.00грн'.';-,0.00грн'.'';
//    t[1].MinWidth              := 60;
    with cxGrid1DBBandedTableView1.DataController.Summary.FooterSummaryItems.Add as TcxGridDbBandedTableSummaryItem do
    begin
        Column    := T[1];
        fieldName := 'b'+intToStr(num1+1);
        kind      := skSum;
        Format    := '0.00грн.;-0.00грн.';
    end;
    with cxGrid1DBBandedTableView1.DataController.Summary.DefaultGroupSummaryItems.Add as TcxGridDbBandedTableSummaryItem do
    begin
        Column := T[1];
        kind      := skSum;
        fieldName := 'b'+intToStr(num1+1);
        Format    := '0.00грн.;-0.00грн.';
    end;

    t[2] := cxGrid1DBBandedTableView1.CreateColumn;
    t[2].DataBinding.FieldName := 'b'+intToStr(num1+2);
    t[2].Caption               := 'залишок на кінець дня';
    t[2].HeaderAlignmentHorz   := taCenter;
    t[2].Position.BandIndex    := n_band;
    t[2].Width                 := 70;
//    t[2].Properties            := CurrencyEdit;
//    t[2].Properties.DisplayFormat := ',0.00грн'.';-,0.00грн'.'';
//    t[2].MinWidth              := 60;
    with cxGrid1DBBandedTableView1.DataController.Summary.FooterSummaryItems.Add as TcxGridDbBandedTableSummaryItem do
    begin
        Column    := T[2];
        fieldName := 'b'+intToStr(num1+2);
        kind      := skSum;
        Format    := '0.00грн.;-0.00грн.';
    end;
    with cxGrid1DBBandedTableView1.DataController.Summary.DefaultGroupSummaryItems.Add as TcxGridDbBandedTableSummaryItem do
    begin
        Column    := T[2];
        kind      := skSum;
        fieldName := 'b'+intToStr(num1+2);
        Format    := '0.00грн.;-0.00грн.';
    end;

end;

procedure TfmResultAnalitGotOper.ActionFilterExecute(Sender: TObject);
begin
    AnalitCreate(true);
end;

procedure TfmResultAnalitGotOper.ActionRefreshExecute(Sender: TObject);
begin
    DataSetKekv.CloseOpen(false);
end;

procedure TfmResultAnalitGotOper.ActionExportExecute(Sender: TObject);
begin
    if SaveDialog1.Execute then
        ExportGrid4ToExcel(SaveDialog1.FileName, cxGrid1, false, true, false);
end;

end.
