unit SelectShablon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, ExtCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, FIBDataSet,
  pFIBDataSet, KassaDocMainForm, Un_R_file_Alex, pFIBDatabase,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls, ToolWin, cxTextEdit,
  cxImage, cxCurrencyEdit, cxLabel, cxContainer, RxMemDS,AccMgmt;

type
  TfmSelectShablon = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
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
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    ActionList1: TActionList;
    ActionClose: TAction;
    DataSetShablon: TpFIBDataSet;
    DataSource: TDataSource;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    cxButtonTake: TcxButton;
    cxButtonClose: TcxButton;
    ActionTake: TAction;
    Label1: TLabel;
    DataSetShablonID_SP_OPERATION: TFIBBCDField;
    DataSetShablonNAME: TFIBStringField;
    DataSetShablonFLAG_PRIHOD: TFIBIntegerField;
    DataSetShablonFLAG_RASHOD: TFIBIntegerField;
    DataSetShablonFLAG_DEFAULT_FOND: TFIBIntegerField;
    DataSetShablonID_SCH_DEFAULT: TFIBBCDField;
    DataSetShablonID_SM: TFIBBCDField;
    DataSetShablonID_RAZD: TFIBBCDField;
    DataSetShablonID_ST: TFIBBCDField;
    DataSetShablonFLAG_SYSTEM_OPERATION: TFIBIntegerField;
    DataSetShablonID_KEKV: TFIBBCDField;
    DataSetShablonFLAG_VISIBLE_OPERATION: TFIBIntegerField;
    DataSetShablonKOD_OPERATION: TFIBIntegerField;
    DataSetShablonSHOT_NAME: TFIBStringField;
    DataSetShablonNAME_KOD: TFIBStringField;
    DataSetShablonKOD_SCH_DEFAULT: TFIBStringField;
    DataSetShablonTITLE_SCH_DEFAULT: TFIBStringField;
    DataSetShablonSUMMA: TFIBBCDField;
    DataSetShablonNOTE: TFIBStringField;
    DataSetShablonNDS: TFIBSmallIntField;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    DataSetShablonN_PP: TFIBIntegerField;
    DataSetShablonKOD_SCH: TFIBStringField;
    DataSetShablonKOD_SMETA: TFIBIntegerField;
    DataSetShablonKOD_RAZD: TFIBIntegerField;
    DataSetShablonKOD_STATE: TFIBIntegerField;
    DataSetShablonKOD_KEKV: TFIBIntegerField;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    DataSetShablonID_DOG: TFIBBCDField;
    DataSetShablonKOD_DOG: TFIBBCDField;
    ActionShowmes: TAction;
    CoolBar2: TCoolBar;
    Panel2: TPanel;
    cxLabel6: TcxLabel;
    cxTextEdit6: TcxTextEdit;
    cxButton1: TcxButton;
    RxMemoryData: TRxMemoryData;
    DataSetShablonNDS_ASK_SUM: TFIBSmallIntField;
    procedure ActionCloseExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure DataSetShablonAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ActionShowmesExecute(Sender: TObject);
    procedure RxMemoryDataAfterScroll(DataSet: TDataSet);
  private
    id, id_smeta, id_stat, id_r, id_k, id_sch, id_d_umol, kod_d_umol : int64;
    f_pr, f_r, f_fond, f_s, f_v, kodyara, f_nds, f_nds_ask_sum : integer;
    summa : double;
    name_oper, sch_kod_dedault, sch_title_default, f_note : string;
  procedure LoadCaptions;
  public
    { Public declarations }
  end;

function Show_Shablon(db : TpFIBDatabase; tran : TpFIBTransaction; prihod : smallint; var id_oper, id_sc, id_sm, id_st, id_razd, id_kekv : int64; var f_prih, f_ras, f_def_f, f_sys, f_vis, kod : integer; var name, sch_kod_d, sch_title_d : string; var sum : double; var note : string; var nds : integer; var id_dog_umol, kod_dog_umol : int64; var f_nds_ask : smallint):boolean;

implementation

{$R *.dfm}

function Show_Shablon(db : TpFIBDatabase; tran : TpFIBTransaction; prihod : smallint; var id_oper, id_sc, id_sm, id_st, id_razd, id_kekv : int64; var f_prih, f_ras, f_def_f, f_sys, f_vis, kod : integer; var name, sch_kod_d, sch_title_d : string; var sum : double; var note : string; var nds : integer; var id_dog_umol, kod_dog_umol : int64; var f_nds_ask : smallint):boolean;
var
    T : TfmSelectShablon;
    er,error, count : integer;
begin
    T := TfmSelectShablon.Create(nil);
    T.LoadCaptions;
    count := 0;
    T.DataSetShablon.Database := db;
    T.DataSetShablon.Transaction := tran;
    T.DataSetShablon.Transaction.StartTransaction;
    T.DataSetShablon.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SHABLON('+IntToStr(prihod)+')';
    T.DataSetShablon.Open;
    T.DataSetShablon.FetchAll;
    er := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Kassa_shablons','Belong');
    T.DataSetShablon.First;
    while not T.DataSetShablon.Eof do
    begin
        T.RxMemoryData.Open;
        T.RxMemoryData.Insert;
        if (er <> 0) then
        error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Kassa_shablons/Kas_Shabl_'+T.DataSetShablon.FieldByName('id_sp_operation').AsString,'Belong');
        if (error = 0) or (er=0) then
        begin
            count := count+1;
            T.RxMemoryData.FieldByName('RxMemid_sp_operation').Value      := StrToInt64(T.DataSetShablon.FieldByName('id_sp_operation').AsString);
            T.RxMemoryData.FieldByName('RxMemName').Value                 := T.DataSetShablon.FieldByName('Name').AsString;
            T.RxMemoryData.FieldByName('RxMemflag_prihod').Value          := T.DataSetShablon.FieldByName('flag_prihod').AsInteger;
            T.RxMemoryData.FieldByName('RxMemflag_rashod').Value          := T.DataSetShablon.FieldByName('flag_rashod').AsInteger;
            T.RxMemoryData.FieldByName('RxMemflag_default_fond').Value    := T.DataSetShablon.FieldByName('flag_default_fond').AsInteger;
            T.RxMemoryData.FieldByName('RxMemid_sch_default').Value       := StrToInt64(T.DataSetShablon.FieldByName('id_sch_default').AsString);
            T.RxMemoryData.FieldByName('RxMemid_sm').Value                := StrToInt64(T.DataSetShablon.FieldByName('id_sm').AsString);
            T.RxMemoryData.FieldByName('RxMemid_razd').Value              := StrToInt64(T.DataSetShablon.FieldByName('id_razd').AsString);
            T.RxMemoryData.FieldByName('RxMemid_st').Value                := StrToInt64(T.DataSetShablon.FieldByName('id_st').AsString);
            T.RxMemoryData.FieldByName('RxMemflag_system_operation').Value:= T.DataSetShablon.FieldByName('flag_system_operation').AsInteger;
            T.RxMemoryData.FieldByName('RxMemid_kekv').Value              := StrToInt64(T.DataSetShablon.FieldByName('id_kekv').AsString);
            T.RxMemoryData.FieldByName('RxMemflag_visible_operation').Value:= T.DataSetShablon.FieldByName('flag_visible_operation').AsInteger;
            T.RxMemoryData.FieldByName('RxMemkod_operation').Value        := T.DataSetShablon.FieldByName('kod_operation').AsInteger;
            T.RxMemoryData.FieldByName('RxMemshot_name').Value            := T.DataSetShablon.FieldByName('shot_name').AsString;
            T.RxMemoryData.FieldByName('RxMemname_kod').Value             := T.DataSetShablon.FieldByName('name_kod').AsString;
            T.RxMemoryData.FieldByName('RxMemkod_sch_default').Value      := T.DataSetShablon.FieldByName('kod_sch_default').AsString;
            T.RxMemoryData.FieldByName('RxMemtitle_sch_default').Value    := T.DataSetShablon.FieldByName('title_sch_default').AsString;
            T.RxMemoryData.FieldByName('RxMemsumma').Value                := T.DataSetShablon.FieldByName('summa').AsCurrency;
            T.RxMemoryData.FieldByName('RxMemnote').Value                 := T.DataSetShablon.FieldByName('note').AsString;
            T.RxMemoryData.FieldByName('RxMemnds').Value                  := T.DataSetShablon.FieldByName('nds').AsInteger;
            T.RxMemoryData.FieldByName('RxMemn_pp').Value                 := T.DataSetShablon.FieldByName('n_pp').AsInteger;
            T.RxMemoryData.FieldByName('RxMemkod_sch').Value              := T.DataSetShablon.FieldByName('kod_sch').AsString;
            T.RxMemoryData.FieldByName('RxMemkod_smeta').Value            := T.DataSetShablon.FieldByName('kod_smeta').AsInteger;
            T.RxMemoryData.FieldByName('RxMemkod_razd').Value             := T.DataSetShablon.FieldByName('kod_razd').AsInteger;
            T.RxMemoryData.FieldByName('RxMemkod_state').Value            := T.DataSetShablon.FieldByName('kod_state').AsInteger;
            T.RxMemoryData.FieldByName('RxMemkod_kekv').Value             := T.DataSetShablon.FieldByName('kod_kekv').AsInteger;
            T.RxMemoryData.FieldByName('RxMemid_dog').Value               := T.DataSetShablon.FieldByName('id_dog').AsVariant;
            T.RxMemoryData.FieldByName('RxMemkod_dog').Value              := T.DataSetShablon.FieldByName('kod_dog').AsVariant;
            T.RxMemoryData.FieldByName('RxMemNDSask_sum').Value           := T.DataSetShablon.FieldByName('NDS_ASK_SUM').AsVariant;

            T.RxMemoryData.Post;
            T.DataSetShablon.Next;
        end
        else
            T.DataSetShablon.Next;
    end;
    T.RxMemoryData.Last;

    if ((count =0) and (error<>0)) then
    begin
        showmessage(Un_R_file_Alex.KASSA_NOT_SHABLONS);
    end;


    if T.RxMemoryData.RecordCount >1 then
    begin
        if T.ShowModal=mrOk then
        begin
            id_oper := T.id;
            id_sm   := T.id_smeta;
            id_st   := T.id_stat;
            id_razd := T.id_r;
            id_kekv := T.id_k;
            id_sc   := T.id_sch;
            f_prih  := T.f_pr;
            f_ras   := T.f_r;
            f_def_f := T.f_fond;
            f_sys   := T.f_s;
            f_vis   := T.f_v;
            kod     := T.kodyara;
            name    := T.name_oper;
            sch_kod_d    := T.sch_kod_dedault;
            sch_title_d  := T.sch_title_default;
            sum          := T.summa;
            note         := T.f_note;
            nds          := T.F_nds;
            id_dog_umol  := T.id_d_umol;
            kod_dog_umol := T.kod_d_umol;
            f_nds_ask    := T.f_nds_ask_sum;
            Result := true;
        end
        else Result := false;
    end
   else if T.RxMemoryData.RecordCount = 1 then
    begin
            T.id       := T.RxMemoryData.FieldByName('RxMemid_sp_operation').Value;
        if T.RxMemoryData.FieldByName('RxMemid_sm').Value <> null
            then T.id_smeta  := T.RxMemoryData.FieldByName('RxMemid_sm').Value
            else T.id_smeta  := 0;
        if T.RxMemoryData.FieldByName('RxMemid_st').Value <> null
            then T.id_stat   := T.RxMemoryData.FieldByName('RxMemid_st').Value
            else T.id_stat   := 0;
        if T.RxMemoryData.FieldByName('RxMemid_razd').Value <> null
            then T.id_r      := T.RxMemoryData.FieldByName('RxMemid_razd').Value
            else T.id_r      := 0;
        if T.RxMemoryData.FieldByName('RxMemid_kekv').Value <> null
            then T.id_k      := T.RxMemoryData.FieldByName('RxMemid_kekv').Value
            else T.id_k      := 0;
        if T.RxMemoryData.FieldByName('RxMemflag_prihod').AsInteger <> null
            then T.f_pr      := T.RxMemoryData.FieldByName('RxMemflag_prihod').AsInteger
            else T.f_pr      := -1;
        if T.RxMemoryData.FieldByName('RxMemflag_rashod').AsInteger <> null
            then T.f_r       := T.RxMemoryData.FieldByName('RxMemflag_rashod').AsInteger
            else T.f_r       := -1;
        if T.RxMemoryData.FieldByName('RxMemflag_default_fond').AsInteger <> null
            then T.f_fond    := T.RxMemoryData.FieldByName('RxMemflag_default_fond').AsInteger
            else T.f_fond    := -1;
        if T.RxMemoryData.FieldByName('RxMemflag_system_operation').AsInteger <> null
            then T.f_s       := T.RxMemoryData.FieldByName('RxMemflag_system_operation').AsInteger
            else T.f_s       := -1;
        if T.RxMemoryData.FieldByName('RxMemflag_visible_operation').AsInteger <> null
            then T.f_v       := T.RxMemoryData.FieldByName('RxMemflag_visible_operation').AsInteger
            else T.f_v       := -1;
        T.kodyara   := T.RxMemoryData.FieldByName('RxMemkod_operation').AsInteger;
        T.name_oper := T.RxMemoryData.FieldByName('RxMemname').AsString;
        if T.RxMemoryData.FieldByName('RxMemid_sch_default').Value  <> null
            then T.id_sch    := T.RxMemoryData.FieldByName('RxMemid_sch_default').Value
            else T.id_sch    := 0;
        if T.RxMemoryData.FieldByName('RxMemkod_sch_default').AsString  <> null
            then T.sch_kod_dedault := T.RxMemoryData.FieldByName('RxMemkod_sch_default').AsString
            else T.sch_kod_dedault := '';
        if T.RxMemoryData.FieldByName('RxMemtitle_sch_default').AsString  <> null
            then T.sch_title_default := T.RxMemoryData.FieldByName('RxMemtitle_sch_default').AsString
            else T.sch_title_default := '';
        if T.RxMemoryData.FieldByName('RxMemsumma').AsCurrency <> null
            then T.summa := T.RxMemoryData.FieldByName('RxMemsumma').AsCurrency
            else T.summa := 0;
        if T.RxMemoryData.FieldByName('RxMemnote').AsString <> null
            then T.f_note := T.RxMemoryData.FieldByName('RxMemnote').AsString
            else T.f_note := '';
        if T.RxMemoryData.FieldByName('RxMemnds').AsInteger <> null
            then T.f_nds := T.RxMemoryData.FieldByName('RxMemnds').AsInteger
            else T.f_nds := 0;
        //try T.id_d_umol := TFIBBCDField(T.RxMemoryData.FieldByName('RxMemid_dog')).AsInt64 except T.id_d_umol := -1; end;
        if T.RxMemoryData.FieldByName('RxMemid_dog').AsVariant<> null
            then T.id_d_umol := T.RxMemoryData.FieldByName('RxMemid_dog').AsVariant
            else T.id_d_umol := -1;
        if T.RxMemoryData.FieldByName('RxMemkod_dog').AsVariant<> null
            then T.kod_d_umol := T.RxMemoryData.FieldByName('RxMemkod_dog').AsVariant
            else T.kod_d_umol := -1;

        if T.RxMemoryData.FieldByName('RxMemNDSask_sum').AsVariant<> null
            then T.f_nds_ask_sum := T.RxMemoryData.FieldByName('RxMemNDSask_sum').AsVariant
            else T.f_nds_ask_sum := -1;

            id_oper := T.id;
            id_sm   := T.id_smeta;
            id_st   := T.id_stat;
            id_razd := T.id_r;
            id_kekv := T.id_k;
            id_sc   := T.id_sch;
            f_prih  := T.f_pr;
            f_ras   := T.f_r;
            f_def_f := T.f_fond;
            f_sys   := T.f_s;
            f_vis   := T.f_v;
            kod     := T.kodyara;
            name    := T.name_oper;
            sch_kod_d    := T.sch_kod_dedault;
            sch_title_d  := T.sch_title_default;
            sum          := T.summa;
            note         := T.f_note;
            nds          := T.F_nds;
            id_dog_umol  := T.id_d_umol;
            kod_dog_umol := T.kod_d_umol;
            f_nds_ask    := T.f_nds_ask_sum;

            Result := true;
    end else Result := false;
    T.DataSetShablon.Close;
    T.Free
end;

procedure TfmSelectShablon.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmSelectShablon.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ActionTakeExecute(Sender);
end;

procedure TfmSelectShablon.LoadCaptions;
begin
    Caption := Un_R_file_Alex.KASSA_SELECT_SHOBLON_CAPTION;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_SELECT_SHABLON_NAME;
    cxLabel1.Caption := Un_R_file_Alex.KASSA_SCH;
    cxLabel2.Caption := Un_R_file_Alex.KASSA_SMETA;
    cxLabel3.Caption := Un_R_file_Alex.KASSA_RAZD;
    cxLabel4.Caption := Un_R_file_Alex.KASSA_STAT;
    cxLabel5.Caption := Un_R_file_Alex.KASSA_KEKV;
end;

procedure TfmSelectShablon.ActionTakeExecute(Sender: TObject);
begin
        id       := RxMemoryData.FieldByName('RxMemid_sp_operation').Value;
        if RxMemoryData.FieldByName('RxMemid_sm').Value <> null
            then id_smeta  := RxMemoryData.FieldByName('RxMemid_sm').Value
            else id_smeta  := 0;
        if RxMemoryData.FieldByName('RxMemid_st').Value <> null
            then id_stat   := RxMemoryData.FieldByName('RxMemid_st').Value
            else id_stat   := 0;
        if RxMemoryData.FieldByName('RxMemid_razd').Value <> null
            then id_r      := RxMemoryData.FieldByName('RxMemid_razd').Value
            else id_r      := 0;
        if RxMemoryData.FieldByName('RxMemid_kekv').Value <> null
            then id_k      := RxMemoryData.FieldByName('RxMemid_kekv').Value
            else id_k      := 0;
        if RxMemoryData.FieldByName('RxMemflag_prihod').AsInteger <> null
            then f_pr      := RxMemoryData.FieldByName('RxMemflag_prihod').AsInteger
            else f_pr      := -1;
        if RxMemoryData.FieldByName('RxMemflag_rashod').AsInteger <> null
            then f_r       := RxMemoryData.FieldByName('RxMemflag_rashod').AsInteger
            else f_r       := -1;
        if RxMemoryData.FieldByName('RxMemflag_default_fond').AsInteger <> null
            then f_fond    := RxMemoryData.FieldByName('RxMemflag_default_fond').AsInteger
            else f_fond    := -1;
        if RxMemoryData.FieldByName('RxMemflag_system_operation').AsInteger <> null
            then f_s       := RxMemoryData.FieldByName('RxMemflag_system_operation').AsInteger
            else f_s       := -1;
        if RxMemoryData.FieldByName('RxMemflag_visible_operation').AsInteger <> null
            then f_v       := RxMemoryData.FieldByName('RxMemflag_visible_operation').AsInteger
            else f_v       := -1;
        kodyara   := RxMemoryData.FieldByName('RxMemkod_operation').AsInteger;
        name_oper := RxMemoryData.FieldByName('RxMemname').AsString;
        if RxMemoryData.FieldByName('RxMemid_sch_default').Value  <> null
            then id_sch    := RxMemoryData.FieldByName('RxMemid_sch_default').Value
            else id_sch    := 0;
        if RxMemoryData.FieldByName('RxMemkod_sch_default').AsString  <> null
            then sch_kod_dedault := RxMemoryData.FieldByName('RxMemkod_sch_default').AsString
            else sch_kod_dedault := '';
        if RxMemoryData.FieldByName('RxMemtitle_sch_default').AsString  <> null
            then sch_title_default := RxMemoryData.FieldByName('RxMemtitle_sch_default').AsString
            else sch_title_default := '';
        if RxMemoryData.FieldByName('RxMemsumma').AsCurrency <> null
            then summa := RxMemoryData.FieldByName('RxMemsumma').AsCurrency
            else summa := 0;
        if RxMemoryData.FieldByName('RxMemnote').AsString <> null
            then f_note := RxMemoryData.FieldByName('RxMemnote').AsString
            else f_note := '';
        if RxMemoryData.FieldByName('RxMemnds').AsInteger <> null
            then f_nds := RxMemoryData.FieldByName('RxMemnds').AsInteger
            else f_nds := 0;
        //try id_d_umol := TFIBBCDField(RxMemoryData.FieldByName('RxMemid_dog')).AsInt64 except id_d_umol := -1; end;
        if RxMemoryData.FieldByName('RxMemid_dog').AsVariant<> null
            then id_d_umol := StrToInt64(RxMemoryData.FieldByName('RxMemid_dog').AsString)
            else id_d_umol := -1;


        if RxMemoryData.FieldByName('RxMemkod_dog').AsVariant<> null
            then kod_d_umol := StrToInt64(RxMemoryData.FieldByName('RxMemkod_dog').AsString)
            else kod_d_umol := -1;

        if RxMemoryData.FieldByName('RxMemNDSask_sum').AsVariant<> null
            then f_nds_ask_sum := RxMemoryData.FieldByName('RxMemNDSask_sum').AsVariant
            else f_nds_ask_sum := -1;

        ModalResult := mrOk;
        {if DataSetShablon['ID_SM'] <> null
            then id_smeta  := DataSetShablon['ID_SM']
            else id_smeta  := 0;
        if DataSetShablon['ID_ST'] <> null
            then id_stat   := DataSetShablon['ID_ST']
            else id_stat   := 0;
        if DataSetShablon['ID_RAZD'] <> null
            then id_r      := DataSetShablon['ID_RAZD']
            else id_r      := 0;
        if DataSetShablon['ID_KEKV'] <> null
            then id_k      := DataSetShablon['ID_KEKV']
            else id_k      := 0;
        if DataSetShablon['FLAG_PRIHOD'] <> null
            then f_pr      := DataSetShablon['FLAG_PRIHOD']
            else f_pr      := -1;
        if DataSetShablon['FLAG_RASHOD'] <> null
            then f_r       := DataSetShablon['FLAG_RASHOD']
            else f_r       := -1;
        if DataSetShablon['FLAG_DEFAULT_FOND'] <> null
            then f_fond    := DataSetShablon['FLAG_DEFAULT_FOND']
            else f_fond    := -1;
        if DataSetShablon['FLAG_SYSTEM_OPERATION'] <> null
            then f_s       := DataSetShablon['FLAG_SYSTEM_OPERATION']
            else f_s       := -1;
        if DataSetShablon['FLAG_VISIBLE_OPERATION'] <> null
            then f_v       := DataSetShablon['FLAG_VISIBLE_OPERATION']
            else f_v       := -1;
        kodyara   := DataSetShablon['KOD_OPERATION'];
        name_oper := DataSetShablon['NAME'];
        if DataSetShablon['ID_SCH_DEFAULT'] <> null
            then id_sch    := DataSetShablon['ID_SCH_DEFAULT']
            else id_sch    := 0;
        if DataSetShablon['KOD_SCH_DEFAULT'] <> null
            then sch_kod_dedault := DataSetShablon['KOD_SCH_DEFAULT']
            else sch_kod_dedault := '';
        if DataSetShablon['TITLE_SCH_DEFAULT'] <> null
            then sch_title_default := DataSetShablon['TITLE_SCH_DEFAULT']
            else sch_title_default := '';
        if DataSetShablon['SUMMA'] <> null
            then summa := DataSetShablon.FieldByName('SUMMA').AsFloat
            else summa := 0;
        if DataSetShablon['NOTE'] <> null
            then f_note := DataSetShablon.FieldByName('NOTE').AsString
            else f_note := '';
        if DataSetShablon['NDS'] <> null
            then f_nds := DataSetShablon.FieldByName('NDS').AsInteger
            else f_nds := 0;
        try id_d_umol := TFIBBCDField(DataSetShablon.FieldByName('ID_DOG')).AsInt64 except id_d_umol := -1; end;
        if DataSetShablon.FieldByName('KOD_DOG').AsVariant <> null
            then kod_d_umol := StrToInt64(DataSetShablon.FieldByName('KOD_DOG').AsString)
            else kod_d_umol := -1;
        ModalResult := mrOk;}
end;

procedure TfmSelectShablon.DataSetShablonAfterScroll(DataSet: TDataSet);
begin
    IF DataSetShablon.FieldByName('NAME').AsString <> null then Label1.Caption := DataSetShablon.FieldByName('NAME').AsString else Label1.Caption := '';
    cxTextEdit1.Text := '';
    cxTextEdit1.Text := DataSetShablon['KOD_SCH'];
    if DataSetShablon.FieldByName('KOD_SMETA').AsInteger > 0  then cxTextEdit2.Text := DataSetShablon.FieldByName('KOD_SMETA').AsString else cxTextEdit2.Text := '';
    if DataSetShablon.FieldByName('KOD_RAZD').AsInteger  > 0  then cxTextEdit3.Text := DataSetShablon.FieldByName('KOD_RAZD').AsString  else cxTextEdit3.Text := '';
    if DataSetShablon.FieldByName('KOD_STATE').AsInteger > 0  then cxTextEdit4.Text := DataSetShablon.FieldByName('KOD_STATE').AsString else cxTextEdit4.Text := '';
    if DataSetShablon.FieldByName('KOD_KEKV').AsInteger  >= 0  then cxTextEdit5.Text := DataSetShablon.FieldByName('KOD_KEKV').AsString  else cxTextEdit5.Text := '';
    if cxTextEdit1.Text = '' then
    begin
        if DataSetShablon['KOD_SCH_DEFAULT'] <> null then cxTextEdit1.Text := DataSetShablon['KOD_SCH_DEFAULT'];
    end;
end;

procedure TfmSelectShablon.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if (AViewInfo.GridRecord.Values[2] = -1) and (not AViewInfo.GridRecord.Focused) then
  begin //
      ACanvas.Canvas.Font.Color := RGB(204,0,153);//оранжевый;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  if (AViewInfo.GridRecord.Values[2] = 90) and (not AViewInfo.GridRecord.Focused) then
  begin //
      ACanvas.Canvas.Font.Color := RGB(0,0,255);//оранжевый;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  if (AViewInfo.GridRecord.Values[2] = 51) and (not AViewInfo.GridRecord.Focused) then
  begin //
      ACanvas.Canvas.Font.Color := RGB(0,0,255);//оранжевый;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  if (AViewInfo.GridRecord.Values[2] = 70) and (not AViewInfo.GridRecord.Focused) then
  begin //
      ACanvas.Canvas.Font.Color := RGB(0,0,255);//оранжевый;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;


end;

procedure TfmSelectShablon.ActionShowmesExecute(Sender: TObject);
begin
    showmessage(RxMemoryData.FieldByName('RxMemid_dog').AsString+#13+
                RxMemoryData.FieldByName('RxMemkod_dog').AsString);
end;

procedure TfmSelectShablon.RxMemoryDataAfterScroll(DataSet: TDataSet);
begin
    IF RxMemoryData.FieldByName('RxMemname').AsString <> null then Label1.Caption := RxMemoryData.FieldByName('RxMemname').AsString else Label1.Caption := '';
    cxTextEdit1.Text := '';
    cxTextEdit1.Text := RxMemoryData.FieldByName('RxMemkod_sch').AsString;
    if RxMemoryData.FieldByName('RxMemkod_smeta').AsInteger > 0  then cxTextEdit2.Text := RxMemoryData.FieldByName('RxMemkod_smeta').AsString else cxTextEdit2.Text := '';
    if RxMemoryData.FieldByName('RxMemkod_razd').AsInteger  > 0  then cxTextEdit3.Text := RxMemoryData.FieldByName('RxMemkod_razd').AsString  else cxTextEdit3.Text := '';
    if RxMemoryData.FieldByName('RxMemkod_state').AsInteger > 0  then cxTextEdit4.Text := RxMemoryData.FieldByName('RxMemkod_state').AsString else cxTextEdit4.Text := '';
    if RxMemoryData.FieldByName('RxMemkod_kekv').AsInteger  >= 0  then cxTextEdit5.Text := RxMemoryData.FieldByName('RxMemkod_kekv').AsString  else cxTextEdit5.Text := '';
    if cxTextEdit1.Text = '' then
    begin
        if RxMemoryData.FieldByName('RxMemkod_sch_default').AsString  <> null then cxTextEdit1.Text := RxMemoryData.FieldByName('RxMemkod_sch_default').AsString;
    end;
end;

end.
