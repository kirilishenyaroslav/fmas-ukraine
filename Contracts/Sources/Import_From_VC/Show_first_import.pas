unit Show_first_import;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxGraphics, cxControls, {dxStatusBar,} cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxCheckBox, cxContainer, cxTextEdit, FIBQuery, pFIBQuery,
  pFIBStoredProc, ImgList, UDialg_hunt, Halcn6db, ActnList, dxStatusBar;

type
  Tfm_show_fr_import = class(TForm)
    Database_look_dog: TpFIBDatabase;
    pFIBDataSetShow: TpFIBDataSet;
    TransactionRead: TpFIBTransaction;
    Panel1: TPanel;
    cxGridShowdogDBTableView1: TcxGridDBTableView;
    cxGridShowdogLevel1: TcxGridLevel;
    cxGridShowdog: TcxGrid;
    cxButtonImporting: TcxButton;
    cxButtonExits: TcxButton;
    Panel2: TPanel;
    cxGridShowdogDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridShowdogDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridShowdogDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridShowdogDBTableView1DBColumn4: TcxGridDBColumn;
    DataSourceShow: TDataSource;
    LabelSum: TLabel;
    summa_show: TcxTextEdit;
    pFIBDataSetInfo: TpFIBDataSet;
    Labeldate_end: TLabel;
    Labeldate_beg: TLabel;
    LabelFile: TLabel;
    Labeldate_copy: TLabel;
    cxTextEditDate_beg: TcxTextEdit;
    cxTextEditDate_end: TcxTextEdit;
    cxTextEditDate_copy: TcxTextEdit;
    cxTextEditFile_name: TcxTextEdit;
    Virtual1_DataSet: TpFIBDataSet;
    Virtual2_DataSet: TpFIBDataSet;
    pFIBStoredProcDoSvyazku: TpFIBStoredProc;
    pFIBTransactionWright: TpFIBTransaction;
    cxButtonRefresh: TcxButton;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    cxButtonDoImport: TcxButton;
    HalcDataSetSelect: THalcyonDataSet;
    StoredProc_CN: TpFIBStoredProc;
    cxButton1: TcxButton;
    Labelfilter: TLabel;
    TextEditWhatFind: TcxTextEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    SpecialTransaction: TpFIBTransaction;
    STP_special: TpFIBStoredProc;
    dxStatusBar1: TdxStatusBar;
    Actionsend: TAction;
    ActionF5: TAction;
    ActionImp: TAction;
    ActionEsc: TAction;
    StoredProc_GetDefalt: TpFIBStoredProc;
    TransForDefaltSP: TpFIBTransaction;
    pFIBDataSetShowNUM_DOG: TFIBStringField;
    pFIBDataSetShowFIO: TFIBStringField;
    pFIBDataSetShowGET_REC: TFIBSmallIntField;
    pFIBDataSetShowID_DOG: TFIBBCDField;
    pFIBDataSetShowSPODRI: TFIBSmallIntField;
    pFIBDataSetShowID_MOVA: TFIBStringField;
    pFIBDataSetShowID_FORM: TFIBStringField;
    pFIBDataSetShowID_KAT: TFIBStringField;
    pFIBDataSetShowNST_DOG: TFIBBCDField;
    pFIBDataSetShowID_STAGE: TFIBBCDField;
    pFIBDataSetShowID_KD: TFIBBCDField;
    pFIBDataSetShowDTITM: TFIBStringField;
    pFIBDataSetShowSSP: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonExitsClick(Sender: TObject);
    procedure pFIBDataSetInfoAfterScroll(DataSet: TDataSet);
    procedure cxButtonImportingClick(Sender: TObject);
    procedure cxButtonRefreshClick(Sender: TObject);
    procedure cxButtonDoImportClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure ActionEscExecute(Sender: TObject);
    procedure ActionImpExecute(Sender: TObject);
    procedure ActionF5Execute(Sender: TObject);
    procedure ActionsendExecute(Sender: TObject);
  private
    { Private declarations }
    id_actived_dog : int64;
    my_date : Tdate;
    is_maindog : integer;
    id_roor, id_dogovor, id_student : String;
    name1, name2, name3, name4, name_test, name_path : String;
    old_setings, type_fin, title_more : string;
    what_do, fucking_flag : integer;
    sm_t, rz_t, st_t, kekv_t : string;
  public
       constructor Create(AOwner: TComponent; DataBase2: TISC_DB_HANDLE); reintroduce; overload;
  end;

var
  fm_show_fr_import: Tfm_show_fr_import;

implementation
uses UErrorSvyaziPodr,uAddProv, USetFilterSetings;
{$R *.dfm}

constructor Tfm_show_fr_import.Create(AOwner: TComponent; DataBase2: TISC_DB_HANDLE);
begin
    inherited Create (AOwner);
    Database_look_dog.Handle := DataBase2;
    TransactionRead.DefaultDatabase := Database_look_dog;
    Database_look_dog.Connected := true;

    pFIBDataSetInfo.SQLs.SelectSQL.Text   := 'SELECT * FROM CN_SEL_PRIVAT_DATA_ABOUT_DOG (?NUM_DOG)';
    pFIBDataSetShow.Close;
    pFIBDataSetShow.SQLs.SelectSQL.Text   := 'SELECT * FROM CN_SEL_FIRST_INFO_ABOUT_IMP_EX';
    pFIBDataSetShow.Open;
    pFIBDataSetInfo.Open;

    Caption               := 'Буфер договорiв';
    cxButtonExits.Caption := 'Вихiд';
    cxButtonImporting.Caption := 'Iмпортувати';
    cxButtonRefresh.Caption   := 'Оновити';

    cxGridShowdogDBTableView1DBColumn1.Caption := 'Iмп.';
    cxGridShowdogDBTableView1DBColumn2.Caption := 'Договiр №';
    cxGridShowdogDBTableView1DBColumn3.Caption := 'П.I.Б.';
    cxGridShowdogDBTableView1DBColumn4.Caption := 'Дата iмпорта';
    Labeldate_beg.Caption := 'Дата початку';
    Labeldate_end.Caption := 'Дата кiнця';
    LabelFile.Caption     := 'Файл iмпорту';
    Labeldate_copy.Caption:= 'Дата копiювання';
    cxButtonDoImport.Caption := 'Перенос даних';

    Labelfilter.Caption   := 'Шукати:';

    old_setings := '';
    what_do     := 0;

    LabelSum.Caption := 'Сума';

    pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
    pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
    pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
    pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_PROPUSK_UPDATE';
    pFIBStoredProcDoSvyazku.Prepare;
    try
       pFIBStoredProcDoSvyazku.ExecProc;
       pFIBTransactionWright.Commit;
    except on E:Exception do begin
       pFIBTransactionWright.Rollback;
       ShowMessage(E.Message);
    end end;
end;

procedure Tfm_show_fr_import.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
    pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
    pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
    pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_PROPUSK_UPDATE';
    pFIBStoredProcDoSvyazku.Prepare;
    try
       pFIBStoredProcDoSvyazku.ExecProc;
       pFIBTransactionWright.Commit;
    except on E:Exception do begin
       pFIBTransactionWright.Rollback;
       ShowMessage(E.Message);
    end end;

    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure Tfm_show_fr_import.cxButtonExitsClick(Sender: TObject);
begin
    close;
end;

procedure Tfm_show_fr_import.pFIBDataSetInfoAfterScroll(DataSet: TDataSet);
var
    long_pole : string;
    i, prap_flag, d : integer;
    zpt, zpt1 : string;
begin
    if (summa_show.Text          <> null) and
       (cxTextEditDate_beg.Text  <> null) and
       (cxTextEditDate_end.Text  <> null) and
       (cxTextEditFile_name.Text <> null) and
       (cxTextEditDate_copy.Text <> null) then
    begin
      summa_show.Text          := pFIBDataSetInfo.FieldByName('SUMMA').AsString;
      cxTextEditDate_beg.Text  := pFIBDataSetInfo.FieldByName('DATE_BEG').AsString;
      cxTextEditDate_end.Text  := pFIBDataSetInfo.FieldByName('DATE_END').AsString;
      cxTextEditFile_name.Text := pFIBDataSetInfo.FieldByName('NAME_FILE').AsString;
      cxTextEditDate_copy.Text := pFIBDataSetInfo.FieldByName('DATE_FILE').AsString;
      //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := summa_show.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(summa_show.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    summa_show.Clear;
                    summa_show.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                summa_show.Clear;
                summa_show.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                summa_show.Clear;
                summa_show.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************

    end;
end;

procedure Tfm_show_fr_import.cxButtonImportingClick(Sender: TObject);
var
    id_pod, id_mova, id_form, id_kat, id_dog_vc, ID_STAGE, id_kd : int64;
    Flag_poiska_facul, Flag_poiska_spec, Flag_poiska_mova, flag_poiska_form, flag_poiska_kat, FLAG_POISKA_STAGE, flag_poiska_kd : integer;
    fuc, spec, gragd, forma, kat, stage, kd : string;
    name_podr, num_dog, id_spec : String;
    res            : Variant;
    flag_importa   : integer;
    flag_facul     : int64;
    flag_na_exit   : integer;
    NST_DOG        : int64;
    sm, rz, st, kekv : String;
    id_sm, id_rz, id_st, id_kekv : int64;
    id_fuc_old, id_spec_old, id_mova_old, id_form_old, id_kat_old, ID_STAGE_old, id_kd_old : int64;
begin
    DataSourceShow.Enabled := false;
    if (pFIBDataSetShow['GET_REC'] = 1) then
    begin
        num_dog   := pFIBDataSetShow['NUM_DOG'];
        ShowMessage('Цей договiр вже проiмпортовано!');
        cxGridShowdog.SetFocus;
        pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
        DataSourceShow.Enabled := true;
    end;
    if (pFIBDataSetShow['GET_REC'] = 3) then
    begin
        num_dog   := pFIBDataSetShow['NUM_DOG'];
        ShowMessage('Цей договiр пропущений! Для спроби його iмпорту, потрiбно перезайти в буфер договорiв.');
        cxGridShowdog.SetFocus;
        pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
        DataSourceShow.Enabled := true;
    end;
    if (pFIBDataSetShow['GET_REC'] = 0) then
    begin
        id_pod    := pFIBDataSetShow['SPODRI'];
        id_spec   := pFIBDataSetShow['SSP'];
        id_mova   := pFIBDataSetShow['ID_MOVA'];
        num_dog   := pFIBDataSetShow['NUM_DOG'];
        id_dog_vc := pFIBDataSetShow['ID_DOG'];

        id_form   := pFIBDataSetShow['ID_FORM'];
        id_kat    := pFIBDataSetShow['ID_KAT'];
        NST_DOG   := pFIBDataSetShow['NST_DOG'];
        ID_STAGE  := pFIBDataSetShow['ID_STAGE'];
        id_kd     := pFIBDataSetShow['ID_KD'];


        Virtual1_DataSet.Close;
        Virtual1_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_PODRI('+IntToStr(id_pod)+')';
        Virtual1_DataSet.Open;
        Flag_poiska_facul := Virtual1_DataSet.FieldByName('FLAG').AsInteger;
        id_fuc_old        := Virtual1_DataSet.FieldByName('id_fuc_old').AsInteger;

        Virtual1_DataSet.Close;
        Virtual1_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_SPEC('''+id_spec+''')';
        Virtual1_DataSet.Open;
        Flag_poiska_spec := Virtual1_DataSet.FieldByName('FLAG').AsInteger;
        id_spec_old      := Virtual1_DataSet.FieldByName('id_spec_old').AsInteger;

        Virtual1_DataSet.Close;
        Virtual1_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_MOVA('+IntToStr(id_mova)+')';
        Virtual1_DataSet.Open;
        Flag_poiska_mova := Virtual1_DataSet.FieldByName('FLAG').AsInteger;
        id_mova_old      := Virtual1_DataSet.FieldByName('id_mova_old').AsInteger;

        Virtual1_DataSet.Close;
        Virtual1_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_FORM_STUD('+IntToStr(id_form)+')';
        Virtual1_DataSet.Open;
        flag_poiska_form := Virtual1_DataSet.FieldByName('FLAG').AsInteger;
        id_form_old      := Virtual1_DataSet.FieldByName('id_form_old').AsInteger;

        Virtual1_DataSet.Close;
        Virtual1_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_KAT_STUD('+IntToStr(id_kat)+')';
        Virtual1_DataSet.Open;
        flag_poiska_kat := Virtual1_DataSet.FieldByName('FLAG').AsInteger;
        id_kat_old      := Virtual1_DataSet.FieldByName('id_kat_old').AsInteger;

        Virtual1_DataSet.Close;
        Virtual1_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_STAGE('+IntToStr(id_stage)+')';
        Virtual1_DataSet.Open;
        flag_poiska_stage := Virtual1_DataSet.FieldByName('FLAG').AsInteger;
        ID_STAGE_old      := Virtual1_DataSet.FieldByName('id_stage_old').AsInteger;

        Virtual1_DataSet.Close;
        Virtual1_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_KD('+IntToStr(id_kd)+')';
        Virtual1_DataSet.Open;
        flag_poiska_kd := Virtual1_DataSet.FieldByName('FLAG').AsInteger;
        id_kd_old      := Virtual1_DataSet.FieldByName('id_kd_new').AsInteger;

        //***** Выборка данных для окна бюджета ***************

        Virtual2_DataSet.Close;
        Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_PODRI('+IntToStr(id_pod)+')';
        Virtual2_DataSet.Open;
        fuc := Virtual2_DataSet.FieldByName('NAME').AsString;

        Virtual2_DataSet.Close;
        Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_SPEC('''+id_spec+''')';
        Virtual2_DataSet.Open;
        spec := Virtual2_DataSet.FieldByName('NAME').AsString;

        Virtual2_DataSet.Close;
        Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_FORM_STUD('+IntToStr(id_form)+')';
        Virtual2_DataSet.Open;
        forma := Virtual2_DataSet.FieldByName('NAME').AsString;

        Virtual2_DataSet.Close;
        Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_KAT_STUD('+IntToStr(id_kat)+')';
        Virtual2_DataSet.Open;
        kat := Virtual2_DataSet.FieldByName('NAME').AsString;

        Virtual2_DataSet.Close;
        Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_STAGE('+IntToStr(id_stage)+')';
        Virtual2_DataSet.Open;
        stage := Virtual2_DataSet.FieldByName('NAME').AsString;

        Virtual2_DataSet.Close;
        Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_MOVA('+IntToStr(id_mova)+')';
        Virtual2_DataSet.Open;
        gragd := Virtual2_DataSet.FieldByName('NAME').AsString;

        Virtual2_DataSet.Close;
        Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_KD('+IntToStr(id_kd)+')';
        Virtual2_DataSet.Open;
        kd := Virtual2_DataSet.FieldByName('NAME').AsString;
        //***** Конец выборки данных для окна бюджета *********
            begin
            if Flag_poiska_facul = 0 then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_PODRI('+IntToStr(id_pod)+')';
                Virtual2_DataSet.Open;
                name_podr := Virtual2_DataSet.FieldByName('NAME').AsString;
                fuc       := name_podr;

                res := UErrorSvyaziPodr.func_ErrorSvyazi(Database_look_dog.Handle, name_podr, 1,0,'');
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;

                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SVYAZKI_PO_FACUL';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_SPODRI').AsInt64   := id_pod;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_FACULTY').AsInt64  := flag_facul;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            id_fuc_old := flag_facul;
                        end;
                        if flag_na_exit = 2 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SYMPLE_PO_FACUL';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_SPODRI').AsInt64   := id_pod;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               id_fuc_old := pFIBStoredProcDoSvyazku.FieldByName('ID_FACUL').AsInteger;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                        end;
                        if flag_na_exit = 3 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_PROPUSK_PO_1_PARAM';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('id_propuska').AsInt64   := id_pod;
                            pFIBStoredProcDoSvyazku.ParamByName('ssp').AsString          := '0';
                            pFIBStoredProcDoSvyazku.ParamByName('what').AsString         := 'facul';
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            pFIBDataSetShow.CloseOpen(False);

                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;
                    end;
                end;
            end;
            //******************************************* SPEC  ****************
            if Flag_poiska_spec = 0 then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_SPEC('''+id_spec+''')';
                Virtual2_DataSet.Open;
                name_podr := Virtual2_DataSet.FieldByName('NAME').AsString;
                spec      := name_podr;

                res := UErrorSvyaziPodr.func_ErrorSvyazi(Database_look_dog.Handle, name_podr, 2,id_fuc_old,'');
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;

                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SVYAZKI_PO_SPEC';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_SSP').AsString  := id_spec;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_SPEC').AsInt64  := flag_facul;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            id_spec_old := flag_facul;
                        end;
                        if flag_na_exit = 2 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SYMPLE_PO_SPEC';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_SSP').AsString    := id_spec;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_FACUL').AsInt64   := id_fuc_old;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               id_spec_old := pFIBStoredProcDoSvyazku.FieldByName('ID_SPEC').AsInteger;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                        end;
                        if flag_na_exit = 3 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_PROPUSK_PO_1_PARAM';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('id_propuska').AsInt64   := 0;
                            pFIBStoredProcDoSvyazku.ParamByName('ssp').AsString          := id_spec;
                            pFIBStoredProcDoSvyazku.ParamByName('what').AsString         := 'spec';
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            pFIBDataSetShow.CloseOpen(False);

                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;
                    end;
                end;
            end;
            //********************* FORM **************************************
            if flag_poiska_form = 0 then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_FORM_STUD('+IntToStr(id_form)+')';
                Virtual2_DataSet.Open;
                name_podr := Virtual2_DataSet.FieldByName('NAME').AsString;
                forma     := name_podr;

                res := UErrorSvyaziPodr.func_ErrorSvyazi(Database_look_dog.Handle, name_podr, 3,0,'');
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;

                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SVYAZKI_PO_FORM_STUD';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_FORM').AsInt64      := id_form;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_FORM_STUD').AsInt64 := flag_facul;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            id_form_old := flag_facul;
                        end;
                        if flag_na_exit = 2 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SYMPLE_PO_FORM_OBUCH';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_FORM_OLD').AsInt64   := id_form;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               id_form_old := pFIBStoredProcDoSvyazku.FieldByName('ID_FORM').AsInteger;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                        end;
                        if flag_na_exit = 3 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_PROPUSK_PO_1_PARAM';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('id_propuska').AsInt64   := id_form;
                            pFIBStoredProcDoSvyazku.ParamByName('ssp').AsString          := '0';
                            pFIBStoredProcDoSvyazku.ParamByName('what').AsString         := 'form';
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            pFIBDataSetShow.CloseOpen(False);

                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;
                    end;
                end;
            end;

            //********************* KAT **************************************
            if flag_poiska_kat = 0 then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_KAT_STUD('+IntToStr(id_kat)+')';
                Virtual2_DataSet.Open;
                name_podr := Virtual2_DataSet.FieldByName('NAME').AsString;
                kat       := name_podr;

                res := UErrorSvyaziPodr.func_ErrorSvyazi(Database_look_dog.Handle, name_podr, 4,0,'');
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;

                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SVYAZKI_PO_KAT_STUD';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_KAT').AsInt64   := id_kat;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_KAT_STUD').AsInt64  := flag_facul;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            id_kat_old := flag_facul;
                        end;
                        if flag_na_exit = 2 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SYMPLE_PO_KAT_OBUCH';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_KAT_OLD').AsInt64   := id_kat;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               id_kat_old := pFIBStoredProcDoSvyazku.FieldByName('ID_KAT').AsInteger;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                        end;
                        if flag_na_exit = 3 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_PROPUSK_PO_1_PARAM';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('id_propuska').AsInt64   := id_kat;
                            pFIBStoredProcDoSvyazku.ParamByName('ssp').AsString          := '0';
                            pFIBStoredProcDoSvyazku.ParamByName('what').AsString         := 'kat';
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            pFIBDataSetShow.CloseOpen(False);

                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;
                    end;
                end;
            end;

//********************* STAGE **************************************************
            if Flag_poiska_stage = 0 then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_STAGE('+IntToStr(id_stage)+')';
                Virtual2_DataSet.Open;
                name_podr := Virtual2_DataSet.FieldByName('NAME').AsString;
                stage     := name_podr;
                res := UErrorSvyaziPodr.func_ErrorSvyazi(Database_look_dog.Handle, name_podr, 6,0,'');
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;
                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SVYAZKI_PO_STAGE';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_STAGE').AsInt64       := ID_STAGE;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_TYPE_STAGE').AsInt64  := flag_facul;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            ID_STAGE_old := flag_facul;
                        end;
                        if flag_na_exit = 2 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SYMPLE_PO_STAGE';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_STAGE').AsInt64   := id_stage;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               ID_STAGE_old := pFIBStoredProcDoSvyazku.FieldByName('ID_STAG').AsInteger;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                        end;
                        if flag_na_exit = 3 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_PROPUSK_PO_1_PARAM';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('id_propuska').AsInt64   := id_stage;
                            pFIBStoredProcDoSvyazku.ParamByName('ssp').AsString          := '0';
                            pFIBStoredProcDoSvyazku.ParamByName('what').AsString         := 'stage';
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            pFIBDataSetShow.CloseOpen(False);

                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;
                    end;
                end;
            end;

            //********************* MOVA ***************************************
            if Flag_poiska_mova = 0 then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_MOVA('+IntToStr(id_mova)+')';
                Virtual2_DataSet.Open;
                name_podr := Virtual2_DataSet.FieldByName('NAME').AsString;
                gragd     := name_podr;

                res := UErrorSvyaziPodr.func_ErrorSvyazi(Database_look_dog.Handle, name_podr, 5,0,'');
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;

                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SVYAZKI_PO_MOVA';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_MOVA').AsInt64     := id_mova;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_NATIONAL').AsInt64 := flag_facul;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            id_mova_old := flag_facul;
                        end;
                        if flag_na_exit = 2 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SYMPLE_PO_MOVA';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_MOVA').AsInt64   := id_mova;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               id_mova_old := pFIBStoredProcDoSvyazku.FieldByName('ID_NATIONAL').AsInteger;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                        end;
                        if flag_na_exit = 3 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_PROPUSK_PO_1_PARAM';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('id_propuska').AsInt64   := id_mova;
                            pFIBStoredProcDoSvyazku.ParamByName('ssp').AsString          := '0';
                            pFIBStoredProcDoSvyazku.ParamByName('what').AsString         := 'grajd';
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            pFIBDataSetShow.CloseOpen(False);

                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;
                    end;
                end;
            end;
            //********************* KD_NDOG ***************************************
            if flag_poiska_kd = 0 then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_KD('+IntToStr(id_kd)+')';
                Virtual2_DataSet.Open;
                kd := Virtual2_DataSet.FieldByName('NAME').AsString;
                title_more := Virtual2_DataSet.FieldByName('more_info').AsString;

                //gragd     := name_podr;

                res := UErrorSvyaziPodr.func_ErrorSvyazi(Database_look_dog.Handle, kd, 7,0, title_more);
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;

                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SVYAZKI_PO_KD';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_KD').AsInt64        := id_kd;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_INI_PAYER').AsInt64 := flag_facul;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                            id_kd_old := flag_facul;
                        end;
                        if flag_na_exit = 2 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SYMPLE_PO_KD';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_KD').AsInt64   := id_kd;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               id_kd_old := pFIBStoredProcDoSvyazku.FieldByName('id_ini_payer').AsInteger;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                        end;
                        if flag_na_exit = 3 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_PROPUSK_PO_1_PARAM';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('id_propuska').AsInt64   := id_kd;
                            pFIBStoredProcDoSvyazku.ParamByName('ssp').AsString          := '0';
                            pFIBStoredProcDoSvyazku.ParamByName('what').AsString         := 'nkdog';
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;

                            pFIBDataSetShow.CloseOpen(False);
                            cxGridShowdog.SetFocus;
                            pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
                            DataSourceShow.Enabled := true;
                            exit;
                        end;
                    end;
                end;
            end;
          //end;
            //************************ Запись в осн договора ***********************
            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
            pFIBTransactionWright.StartTransaction;
            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_REAL_IMPORT';
            pFIBStoredProcDoSvyazku.Prepare;
            pFIBStoredProcDoSvyazku.ParamByName('NUM_DOG').AsString    := num_dog;
            pFIBStoredProcDoSvyazku.ParamByName('DATE_NOW').AsString   := DateToStr(Date);
            pFIBStoredProcDoSvyazku.ParamByName('TIME_NOW').AsString   := TimeToStr(Time);
            try
               pFIBStoredProcDoSvyazku.ExecProc;
               is_maindog := pFIBStoredProcDoSvyazku.FieldByName('IS_MAINDOG').AsInteger;
               id_roor    := pFIBStoredProcDoSvyazku.FieldByName('ID_DOG_ROOT').AsString;
               id_dogovor := pFIBStoredProcDoSvyazku.FieldByName('ID_DOG').AsString;
               id_student := pFIBStoredProcDoSvyazku.FieldByName('ID_STUD').AsString;
               sm         := pFIBStoredProcDoSvyazku.FieldByName('kod_sm_out').AsString;
               rz         := pFIBStoredProcDoSvyazku.FieldByName('kod_rz_out').AsString;
               st         := pFIBStoredProcDoSvyazku.FieldByName('kod_st_out').AsString;
               kekv       := pFIBStoredProcDoSvyazku.FieldByName('kod_kekv_out').AsString;
               id_sm      := pFIBStoredProcDoSvyazku.FieldByName('id_sm_out').AsInteger;
               id_rz      := pFIBStoredProcDoSvyazku.FieldByName('id_razd_out').AsInteger;
               id_st      := pFIBStoredProcDoSvyazku.FieldByName('id_stat_out').AsInteger;
               id_kekv    := pFIBStoredProcDoSvyazku.FieldByName('id_kekv_out').AsInteger;

               if ((is_maindog <> 2) and (is_maindog <> 3)) then
               begin
                   pFIBTransactionWright.Commit;
               end;
            except on E:Exception do begin
               pFIBTransactionWright.Rollback;
               ShowMessage(E.Message);
            end end;

            if (is_maindog = 2) or (is_maindog = 3) then
            begin
                StoredProc_GetDefalt.Database:=Database_look_dog;
                StoredProc_GetDefalt.Transaction:=TransForDefaltSP;
                TransForDefaltSP.StartTransaction;
                StoredProc_GetDefalt.StoredProcName:='CN_GET_DEF_SRSK';
                StoredProc_GetDefalt.Prepare;
                try
                   StoredProc_GetDefalt.ExecProc;
                   sm_t       := StoredProc_GetDefalt.FieldByName('sm_title').AsString;
                   rz_t       := StoredProc_GetDefalt.FieldByName('rz_title').AsString;
                   st_t       := StoredProc_GetDefalt.FieldByName('st_title').AsString;
                   kekv_t     := StoredProc_GetDefalt.FieldByName('kekv_title').AsString;
                   sm         := StoredProc_GetDefalt.FieldByName('kod_sm').AsString;
                   rz         := StoredProc_GetDefalt.FieldByName('kod_rz').AsString;
                   st         := StoredProc_GetDefalt.FieldByName('kod_st').AsString;
                   kekv       := StoredProc_GetDefalt.FieldByName('kod_kekv').AsString;
                   id_sm      := StoredProc_GetDefalt.FieldByName('id_smet').AsInteger;
                   id_rz      := StoredProc_GetDefalt.FieldByName('id_razd').AsInteger;
                   id_st      := StoredProc_GetDefalt.FieldByName('id_stat').AsInteger;
                   id_kekv    := StoredProc_GetDefalt.FieldByName('id_kekv').AsInteger;
                   TransForDefaltSP.Commit;
                except on E:Exception do begin
                   TransForDefaltSP.Rollback;
                   ShowMessage(E.Message);
                end end;

                if (sm = '') then sm := '0';
                if (rz = '') then rz := '0';
                if (st = '') then st := '0';
                if (kekv='') then kekv:= '0';

                {id_sm       := 0;   id_rz       := 0;   id_st       := 0;   id_kekv     := 0; }
                my_date     := Date;

                if (is_maindog = 2) then type_fin := 'додатковий договiр' else type_fin := 'основний договiр';

                res := uAddProv.GetProv(self, Database_look_dog.Handle, sm, rz, st, kekv, num_dog, my_date, id_sm, id_rz, id_st, id_kekv, id_fuc_old, id_spec_old, id_mova_old, id_form_old, id_kat_old, ID_STAGE_old, type_fin, sm_t, rz_t, st_t, kekv_t);
                if VarArrayDimCount(res) > 0 then
                begin
                    fucking_flag := res[14];
                    if (fucking_flag = 1) then
                    begin
                        //pFIBTransactionWright.Commit;
                        if (res[10]<>null) and (res[11]<>null) and (res[12]<>null) then
                        begin
                                //ShowMessage('1');
                                //pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                                //pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                                //pFIBTransactionWright.StartTransaction;
                                if (is_maindog = 2) then
                                begin
                                    pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_TO_DEF_SMET';
                                    pFIBStoredProcDoSvyazku.Prepare;
                                    pFIBStoredProcDoSvyazku.ParamByName('ID_FACUL').AsInt64     := id_fuc_old;
                                    pFIBStoredProcDoSvyazku.ParamByName('ID_SPEC').AsInt64      := id_spec_old;
                                    pFIBStoredProcDoSvyazku.ParamByName('ID_NATIONAL').AsInt64  := id_mova_old;
                                    pFIBStoredProcDoSvyazku.ParamByName('ID_FORM_STUD').AsInt64 := id_form_old;
                                    pFIBStoredProcDoSvyazku.ParamByName('ID_KAT_STUD').AsInt64  := id_kat_old;

                                    pFIBStoredProcDoSvyazku.ParamByName('ID_SMET').AsInt64      := Res[10];
                                    pFIBStoredProcDoSvyazku.ParamByName('ID_RAZD').AsInt64      := Res[11];
                                    pFIBStoredProcDoSvyazku.ParamByName('ID_STAT').AsInt64      := Res[12];
                                    pFIBStoredProcDoSvyazku.ParamByName('ID_KEKV').AsInt64      := Res[13];
                                    try
                                      pFIBStoredProcDoSvyazku.ExecProc;
                                    except on E:Exception do begin
                                      pFIBTransactionWright.Rollback;
                                      ShowMessage(E.Message);
                                    end end;
                                end;

                                pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_REAL_SMET';
                                pFIBStoredProcDoSvyazku.Prepare;
                                pFIBStoredProcDoSvyazku.ParamByName('ID_DOG_ROOT').AsString := id_roor;
                                pFIBStoredProcDoSvyazku.ParamByName('ID_STUD').AsString     := id_student;
                                pFIBStoredProcDoSvyazku.ParamByName('ID_DOG').AsString      := id_dogovor;
                                pFIBStoredProcDoSvyazku.ParamByName('ID_SMET').AsInt64      := Res[10];
                                pFIBStoredProcDoSvyazku.ParamByName('ID_RAZD').AsInt64      := Res[11];
                                pFIBStoredProcDoSvyazku.ParamByName('ID_STAT').AsInt64      := Res[12];
                                pFIBStoredProcDoSvyazku.ParamByName('ID_KEKV').AsInt64      := Res[13];
                                try
                                pFIBStoredProcDoSvyazku.ExecProc;
                                pFIBTransactionWright.Commit;
                                except on E:Exception do begin
                                   pFIBTransactionWright.Rollback;
                                   ShowMessage(E.Message);
                                end end;
                        end;
                    end else
                    begin
                        pFIBTransactionWright.Rollback;

                        if fucking_flag = 3 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=Database_look_dog;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_PROPUSK_PO_VSEM';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('NDV_I').AsString        := num_dog;
                            pFIBStoredProcDoSvyazku.ParamByName('id_facul').AsInt64      := id_pod;
                            pFIBStoredProcDoSvyazku.ParamByName('id_spec').AsString      := id_spec;
                            pFIBStoredProcDoSvyazku.ParamByName('id_kat').AsInt64        := id_kat;
                            pFIBStoredProcDoSvyazku.ParamByName('id_form').AsInt64       := id_form;
                            pFIBStoredProcDoSvyazku.ParamByName('id_stage').AsInt64      := ID_STAGE;
                            pFIBStoredProcDoSvyazku.ParamByName('id_gragd').AsInt64      := id_mova;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                        end;
                    end;
                end;
            end
        end;
    end;
    pFIBDataSetShow.CloseOpen(False);

    cxGridShowdog.SetFocus;
    pFIBDataSetShow.Locate('NUM_DOG', num_dog, []);
    DataSourceShow.Enabled := true;
end;

procedure Tfm_show_fr_import.cxButtonRefreshClick(Sender: TObject);
var
    id_dog_on_step : int64;
begin
    pFIBDataSetShow.CloseOpen(false);

    {if not pFIBDataSetShow.IsEmpty then
    begin
        id_dog_on_step := pFIBDataSetShow['ID_DOG'];
        pFIBDataSetShow.CloseOpen(False);
        pFIBDataSetShow.Locate('ID_DOG',id_dog_on_step, []);
    end;}
end;

procedure Tfm_show_fr_import.cxButtonDoImportClick(Sender: TObject);
var
   res : Variant;
   paramCopy : LongBool;
   pathtofile, pathtodir : PChar;
   i_tmp : integer;
begin
    i_tmp := 0;
    ShowMessage('Увага! DBF таблицi повиннi бути разархивованi, та лежати у однiй папцi!');
    res := UDialg_hunt.UPathAll(Self);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<> null) and (res[1]<> null) then
        begin
                name_path := res[1];
                if not FileExists(name_path+'\buxpeopl.DBF') then
                begin
                    ShowMessage('Увага! DBF таблицю buxpeopl.DBF не знайдено у цьому каталозi! Перевiрте шлях!');
                    Exit;
                end;
                if not FileExists(name_path+'\chtoplat.DBF') then
                begin
                    ShowMessage('Увага! DBF таблицю chtoplat.DBF не знайдено у цьому каталозi! Перевiрте шлях!');
                    Exit;
                end;
                if not FileExists(name_path+'\ktoplat.DBF') then
                begin
                    ShowMessage('Увага! DBF таблицю ktoplat.DBF не знайдено у цьому каталозi! Перевiрте шлях!');
                    Exit;
                end;
                if not FileExists(name_path+'\dog_vc.DBF') then
                begin
                    ShowMessage('Увага! DBF таблицю dog_vc.DBF не знайдено у цьому каталозi! Перевiрте шлях!');
                    Exit;
                end;

                if not FileExists(name_path+'\FAKUL.DBF') then
                begin
                    ShowMessage('Увага! DBF таблицю FAKUL.DBF не знайдено у цьому каталозi! Перевiрте шлях!');
                    Exit;
                end;
                if not FileExists(name_path+'\SPSPEC.DBF') then
                begin
                    ShowMessage('Увага! DBF таблицю SPSPEC.DBF не знайдено у цьому каталозi! Перевiрте шлях!');
                    Exit;
                end;
                if not FileExists(name_path+'\NATIONAL.DBF') then
                begin
                    ShowMessage('Увага! DBF таблицю NATIONAL.DBF не знайдено у цьому каталозi! Перевiрте шлях!');
                    Exit;
                end;
                if not FileExists(name_path+'\KAT_STUD.DBF') then
                begin
                    ShowMessage('Увага! DBF таблицю KAT_STUD.DBF не знайдено у цьому каталозi! Перевiрте шлях!');
                    Exit;
                end;
                if not FileExists(name_path+'\FORMSTUD.DBF') then
                begin
                    ShowMessage('Увага! DBF таблицю FORMSTUD.DBF не знайдено у цьому каталозi! Перевiрте шлях!');
                    Exit;
                end;
                if not FileExists(name_path+'\TIMEUNIT.DBF') then
                begin
                    ShowMessage('Увага! DBF таблицю TIMEUNIT.DBF не знайдено у цьому каталозi! Перевiрте шлях!');
                    Exit;
                end;
                if not FileExists(name_path+'\TR_DEFSM.DBF') then
                begin
                    ShowMessage('Увага! DBF таблицю TR_DEFSM.DBF не знайдено у цьому каталозi! Перевiрте шлях!');
                    Exit;
                end;

                //********** Импорт таблиц связки *******************
                StoredProc_CN.Database:=Database_look_dog;
                StoredProc_CN.Transaction:=pFIBTransactionWright;
                pFIBTransactionWright.StartTransaction;

                HalcDataSetSelect.Active := False;
                HalcDataSetSelect.TableName := name_path+'\TR_DEFSM.DBF';
                HalcDataSetSelect.Active := true;

                HalcDataSetSelect.First;
                while not HalcDataSetSelect.Eof do
                begin
                    StoredProc_CN.StoredProcName:='CN_VC_DEF_SMET_I';
                    StoredProc_CN.Prepare;
                    StoredProc_CN.ParamByName('kod_smet').AsInteger     := HalcDataSetSelect.FieldByName('KODS').AsInteger;
                    StoredProc_CN.ParamByName('kod_stat').AsInteger     := HalcDataSetSelect.FieldByName('KODST').AsInteger;
                    StoredProc_CN.ParamByName('kod_razd').AsInteger     := HalcDataSetSelect.FieldByName('KODR').AsInteger;
                    StoredProc_CN.ParamByName('id_faculty').AsInteger   := HalcDataSetSelect.FieldByName('KOD_FAK').AsInteger;
                    StoredProc_CN.ParamByName('id_spec').AsInteger      := HalcDataSetSelect.FieldByName('KOD_SPEC').AsInteger;
                    StoredProc_CN.ParamByName('id_form_stud').AsInteger := HalcDataSetSelect.FieldByName('KOD_FORM').AsInteger;
                    StoredProc_CN.ParamByName('id_kat_stud').AsInteger  := HalcDataSetSelect.FieldByName('ID_KAT').AsInteger;
                    StoredProc_CN.ParamByName('id_national').AsInteger  := HalcDataSetSelect.FieldByName('KOD_GRAZHD').AsInteger;
                    StoredProc_CN.ParamByName('perc_smet').AsInteger    := HalcDataSetSelect.FieldByName('PERCENT').AsInteger;
                    try
                       StoredProc_CN.ExecProc;
                    except on E:Exception do begin
                       pFIBTransactionWright.Rollback;
                       exit;
                       ShowMessage(E.Message);
                    end end;
                    HalcDataSetSelect.Next;
                end;

                StoredProc_CN.Database:=Database_look_dog;
                StoredProc_CN.Transaction:=pFIBTransactionWright;
                pFIBTransactionWright.StartTransaction;

                HalcDataSetSelect.Active := False;
                HalcDataSetSelect.TableName := name_path+'\FAKUL.DBF';
                HalcDataSetSelect.Active := true;

                HalcDataSetSelect.First;
                while not HalcDataSetSelect.Eof do
                begin
                    StoredProc_CN.StoredProcName:='CN_VC_JN_FACUL_I';
                    StoredProc_CN.Prepare;
                    StoredProc_CN.ParamByName('ID_FACUL').AsInteger      := HalcDataSetSelect.FieldByName('N_F').AsInteger;
                    StoredProc_CN.ParamByName('ID_PODR').AsInteger       := HalcDataSetSelect.FieldByName('SPODRI').AsInteger;
                    try
                       StoredProc_CN.ExecProc;
                    except on E:Exception do begin
                       pFIBTransactionWright.Rollback;
                       exit;
                       ShowMessage(E.Message);
                    end end;
                    HalcDataSetSelect.Next;
                end;
                HalcDataSetSelect.Active := False;
                HalcDataSetSelect.TableName := name_path+'\FORMSTUD.DBF';
                HalcDataSetSelect.Active := true;

                HalcDataSetSelect.First;
                while not HalcDataSetSelect.Eof do
                begin
                    StoredProc_CN.StoredProcName:='CN_VC_JN_FORM_STUD_I';
                    StoredProc_CN.Prepare;
                    StoredProc_CN.ParamByName('ID_FROM_VC').AsInteger    := HalcDataSetSelect.FieldByName('KOD_FORM_').AsInteger;
                    StoredProc_CN.ParamByName('ID_FORM_STUD').AsInteger  := HalcDataSetSelect.FieldByName('KOD_FORM').AsInteger;
                    try
                       StoredProc_CN.ExecProc;
                    except on E:Exception do begin
                       pFIBTransactionWright.Rollback;
                       exit;
                       ShowMessage(E.Message);
                    end end;
                    HalcDataSetSelect.Next;
                end;
                HalcDataSetSelect.Active := False;
                HalcDataSetSelect.TableName := name_path+'\KAT_STUD.DBF';
                HalcDataSetSelect.Active := true;

                HalcDataSetSelect.First;
                while not HalcDataSetSelect.Eof do
                begin
                    StoredProc_CN.StoredProcName:='CN_VC_JN_KAT_STUD_I';
                    StoredProc_CN.Prepare;
                    StoredProc_CN.ParamByName('ID_KAT_STUD').AsInteger   := HalcDataSetSelect.FieldByName('ID_KAT').AsInteger;
                    StoredProc_CN.ParamByName('ID_FROM_VC').AsInteger    := HalcDataSetSelect.FieldByName('VIDSP').AsInteger;
                    try
                       StoredProc_CN.ExecProc;
                    except on E:Exception do begin
                       pFIBTransactionWright.Rollback;
                       exit;
                       ShowMessage(E.Message);
                    end end;
                    HalcDataSetSelect.Next;
                end;

                HalcDataSetSelect.Active := False;
                HalcDataSetSelect.TableName := name_path+'\NATIONAL.DBF';
                HalcDataSetSelect.Active := true;

                HalcDataSetSelect.First;
                while not HalcDataSetSelect.Eof do
                begin
                    StoredProc_CN.StoredProcName:='CN_VC_JN_MOVA_I';
                    StoredProc_CN.Prepare;
                    StoredProc_CN.ParamByName('ID_NATIONAL').AsInteger   := HalcDataSetSelect.FieldByName('KOD_GRAZHD').AsInteger;
                    StoredProc_CN.ParamByName('ID_MOVA').AsInteger       := HalcDataSetSelect.FieldByName('KSTRAN').AsInteger;
                    try
                       StoredProc_CN.ExecProc;
                    except on E:Exception do begin
                       pFIBTransactionWright.Rollback;
                       exit;
                       ShowMessage(E.Message);
                    end end;
                    HalcDataSetSelect.Next;
                end;
                HalcDataSetSelect.Active := False;
                HalcDataSetSelect.TableName := name_path+'\SPSPEC.DBF';
                HalcDataSetSelect.Active := true;

                HalcDataSetSelect.First;
                while not HalcDataSetSelect.Eof do
                begin
                    StoredProc_CN.StoredProcName:='CN_VC_JN_SPEC_I';
                    StoredProc_CN.Prepare;
                    StoredProc_CN.ParamByName('ID_SSP').AsString         := HalcDataSetSelect.FieldByName('SSP').AsString;
                    StoredProc_CN.ParamByName('ID_SPEC').AsInteger       := HalcDataSetSelect.FieldByName('KS').AsInteger;
                    try
                       StoredProc_CN.ExecProc;
                    except on E:Exception do begin
                       pFIBTransactionWright.Rollback;
                       exit;
                       ShowMessage(E.Message);
                    end end;
                    HalcDataSetSelect.Next;
                end;
                HalcDataSetSelect.Active := False;
                HalcDataSetSelect.TableName := name_path+'\TIMEUNIT.DBF';
                HalcDataSetSelect.Active := true;

                HalcDataSetSelect.First;
                while not HalcDataSetSelect.Eof do
                begin
                    StoredProc_CN.StoredProcName:='CN_VC_JN_STAGE_I';
                    StoredProc_CN.Prepare;
                    StoredProc_CN.ParamByName('ID_TYPE_STAGE').AsInteger := HalcDataSetSelect.FieldByName('KOD_T_UNIT').AsInteger;
                    StoredProc_CN.ParamByName('SETOPL').AsInteger        := HalcDataSetSelect.FieldByName('SETOPL').AsInteger;
                    try
                       StoredProc_CN.ExecProc;
                    except on E:Exception do begin
                       pFIBTransactionWright.Rollback;
                       exit;
                       ShowMessage(E.Message);
                    end end;
                    HalcDataSetSelect.Next;
                end;

                    try
                       pFIBTransactionWright.Commit;
                    except on E:Exception do begin
                       pFIBTransactionWright.Rollback;
                       exit;
                       ShowMessage(E.Message);
                    end end;
                //********** Конец импорта таблиц связки ************

                //**********  Table buxpeopl.DBF ********************
                HalcDataSetSelect.Active := False;
                HalcDataSetSelect.TableName := name_path+'\buxpeopl.DBF';
                HalcDataSetSelect.Active := true;

                HalcDataSetSelect.First;
                while not HalcDataSetSelect.Eof do
                begin
                  try
                    StoredProc_CN.Database:=Database_look_dog;
                    StoredProc_CN.Transaction:=pFIBTransactionWright;
                    StoredProc_CN.Transaction.StartTransaction;
                    StoredProc_CN.StoredProcName:='CN_CHECKED_BUXPEOPL_4';
                    StoredProc_CN.Prepare;
                    StoredProc_CN.ParamByName('NFIZL').AsInteger      := HalcDataSetSelect.FieldByName('NFIZL').AsInteger;
                    StoredProc_CN.ParamByName('TIN').AsString         := HalcDataSetSelect.FieldByName('TIN').AsString;
                    StoredProc_CN.ParamByName('FIO_RU').AsString      := HalcDataSetSelect.FieldByName('FIO_RU').AsString;
                    StoredProc_CN.ParamByName('IMYA_RU').AsString     := HalcDataSetSelect.FieldByName('IMYA_RU').AsString;
                    StoredProc_CN.ParamByName('OTCHEST_RU').AsString  := HalcDataSetSelect.FieldByName('OTCHEST_RU').AsString;
                    StoredProc_CN.ParamByName('FIO_UK').AsString      := HalcDataSetSelect.FieldByName('FIO_UK').AsString;
                    StoredProc_CN.ParamByName('IMYA_UK').AsString     := HalcDataSetSelect.FieldByName('IMYA_UK').AsString;
                    StoredProc_CN.ParamByName('OTCHEST_UK').AsString  := HalcDataSetSelect.FieldByName('OTCHEST_UK').AsString;
                    StoredProc_CN.ParamByName('DATE_RO').AsString     := HalcDataSetSelect.FieldByName('DATE_RO').AsString;
                    try
                       StoredProc_CN.ExecProc;
                       pFIBTransactionWright.Commit;
                    except on E:Exception do begin
                       pFIBTransactionWright.Rollback;
                       ShowMessage(E.Message);
                    end end;

                    //******* End Write  ***********************

                  except on E : Exception
                  do begin
                      ShowMessage(E.Message);
                      exit;
                  end;
                  end;
                HalcDataSetSelect.Next;
                End;
                //**********  Table chtoplat.DBF ********************
                HalcDataSetSelect.Active := False;
                HalcDataSetSelect.TableName := name_path+'\chtoplat.DBF';
                HalcDataSetSelect.Active := true;

                HalcDataSetSelect.First;
                while not HalcDataSetSelect.Eof do
                begin
                  try
                    StoredProc_CN.Database       :=Database_look_dog;
                    StoredProc_CN.Transaction    :=pFIBTransactionWright;
                    StoredProc_CN.Transaction.StartTransaction;
                    StoredProc_CN.StoredProcName :='CN_CHECKED_CHTOPLAT_4';
                    StoredProc_CN.Prepare;
                    StoredProc_CN.ParamByName('NDV').AsString         := HalcDataSetSelect.FieldByName('NDV').AsString;
                    StoredProc_CN.ParamByName('NPPOR').AsInteger      := HalcDataSetSelect.FieldByName('NPPOR').AsInteger;
                    StoredProc_CN.ParamByName('NPAYER').AsInteger     := HalcDataSetSelect.FieldByName('NPAYER').AsInteger;
                    StoredProc_CN.ParamByName('setopl').AsString      := HalcDataSetSelect.FieldByName('setopl').AsString;
                    StoredProc_CN.ParamByName('sumgod').AsString      := HalcDataSetSelect.FieldByName('sumgod').AsString;
                    StoredProc_CN.ParamByName('svopl').AsString       := HalcDataSetSelect.FieldByName('svopl').AsString;
                    StoredProc_CN.ParamByName('edizm').AsString       := HalcDataSetSelect.FieldByName('edizm').AsString;
                    StoredProc_CN.ParamByName('diyanach').AsString    := HalcDataSetSelect.FieldByName('diyanach').AsString;
                    StoredProc_CN.ParamByName('diyakon').AsString     := HalcDataSetSelect.FieldByName('diyakon').AsString;
                    try
                       StoredProc_CN.ExecProc;
                       pFIBTransactionWright.Commit;
                    except on E:Exception do begin
                       pFIBTransactionWright.Rollback;
                       ShowMessage(E.Message);
                    end end;
                    //******* End Write  ***********************
                  except on E : Exception
                  do begin
                      ShowMessage(E.Message);
                      exit;
                  end;
                  end;
                HalcDataSetSelect.Next;
                End;
                //**********  Table ktoplat.DBF ********************
                HalcDataSetSelect.Active := False;
                HalcDataSetSelect.TableName := name_path+'\ktoplat.DBF';
                HalcDataSetSelect.Active := true;

                HalcDataSetSelect.First;
                while not HalcDataSetSelect.Eof do
                begin
                  try
                    StoredProc_CN.Database:=Database_look_dog;
                    StoredProc_CN.Transaction:=pFIBTransactionWright;
                    StoredProc_CN.Transaction.StartTransaction;
                    StoredProc_CN.StoredProcName:='CN_CHECKED_KTOPLAT';
                    StoredProc_CN.Prepare;
                    StoredProc_CN.ParamByName('ID_PLAT').AsInt64      := HalcDataSetSelect.FieldByName('ID_PLAT').Asvariant;
                    StoredProc_CN.ParamByName('KOD_PAYER').AsInteger  := HalcDataSetSelect.FieldByName('KOD_PAYER').AsInteger;
                    StoredProc_CN.ParamByName('NDV').AsString         := HalcDataSetSelect.FieldByName('NDV').AsString;
                    StoredProc_CN.ParamByName('NPPOR').AsInteger      := HalcDataSetSelect.FieldByName('NPPOR').AsInteger;
                    StoredProc_CN.ParamByName('NPAYER').AsInteger     := HalcDataSetSelect.FieldByName('NPAYER').AsInteger;
                    try
                       StoredProc_CN.ExecProc;
                       pFIBTransactionWright.Commit;
                    except on E:Exception do begin
                       pFIBTransactionWright.Rollback;
                       ShowMessage(E.Message);
                    end end;

                    //******* End Write  ***********************

                  except on E : Exception
                  do begin
                      ShowMessage(E.Message);
                      exit;
                  end;
                  end;
                HalcDataSetSelect.Next;
                End;

                //********* Add to Buffer Dog_vc *******************************
                HalcDataSetSelect.Active := False;
                HalcDataSetSelect.TableName := name_path+'\dog_vc.DBF';
                HalcDataSetSelect.Active := true;

                StoredProc_CN.Database:=Database_look_dog;
                StoredProc_CN.Transaction:=pFIBTransactionWright;
                StoredProc_CN.Transaction.StartTransaction;
                StoredProc_CN.StoredProcName:='CN_CLEAR_VC_DOG_VC';
                StoredProc_CN.Prepare;
                try
                   StoredProc_CN.ExecProc;
                   pFIBTransactionWright.Commit;
                except on E:Exception do begin
                   pFIBTransactionWright.Rollback;
                   ShowMessage(E.Message);
                end end;

                HalcDataSetSelect.First;
                while not HalcDataSetSelect.Eof do
                begin
                  try
                    i_tmp := i_tmp + 1;

                    //if i_tmp >= 6000 then ShowMessage('ID_DOG='+HalcDataSetSelect.FieldByName['ID_DOG']);
                    StoredProc_CN.Database:=Database_look_dog;
                    StoredProc_CN.Transaction:=pFIBTransactionWright;
                    StoredProc_CN.Transaction.StartTransaction;
                    StoredProc_CN.StoredProcName:='CN_CHECKED_DOG_VC_4';
                    StoredProc_CN.Prepare;
                    StoredProc_CN.ParamByName('ID_DOG').AsVariant     := HalcDataSetSelect.FieldValues['ID_DOG'];
                    StoredProc_CN.ParamByName('NST_DOG').AsInt64      := HalcDataSetSelect.FieldByName('NST_DOG').AsVariant;
                    StoredProc_CN.ParamByName('NFIZL').AsInteger      := HalcDataSetSelect.FieldByName('NFIZL').AsInteger;
                    StoredProc_CN.ParamByName('KD').AsString          := HalcDataSetSelect.FieldByName('KD').AsString;
                    StoredProc_CN.ParamByName('NDV').AsString         := HalcDataSetSelect.FieldByName('NDV').AsString;
                    StoredProc_CN.ParamByName('NPPOR').AsInteger      := HalcDataSetSelect.FieldByName('NPPOR').AsInteger;
                    if (HalcDataSetSelect.FieldByName('DDV').AsString = '') then
                    StoredProc_CN.ParamByName('DDV').AsString         := DateToStr(Date) else
                    StoredProc_CN.ParamByName('DDV').AsString         := HalcDataSetSelect.FieldByName('DDV').AsString;
                    if (HalcDataSetSelect.FieldByName('DND').AsString = '') then
                    StoredProc_CN.ParamByName('DND').AsString         := '01.09.1900' else
                    StoredProc_CN.ParamByName('DND').AsString         := HalcDataSetSelect.FieldByName('DND').AsString;
                    if (HalcDataSetSelect.FieldByName('DOD').AsString = '') then
                    StoredProc_CN.ParamByName('DOD').AsString         := '31.12.3050' else
                    StoredProc_CN.ParamByName('DOD').AsString         := HalcDataSetSelect.FieldByName('DOD').AsString;

                    StoredProc_CN.ParamByName('KOLS').AsInteger       := HalcDataSetSelect.FieldByName('KOLS').AsInteger;
                    StoredProc_CN.ParamByName('SPODRI').AsInteger     := HalcDataSetSelect.FieldByName('SPODRI').AsInteger;
                    StoredProc_CN.ParamByName('KOD_FORM').AsInteger   := HalcDataSetSelect.FieldByName('KOD_FORM').AsInteger;
                    StoredProc_CN.ParamByName('VIDSP').AsInteger      := HalcDataSetSelect.FieldByName('VIDSP').AsInteger;
                    StoredProc_CN.ParamByName('KSZD').AsInteger       := HalcDataSetSelect.FieldByName('KSZD').AsInteger;
                    StoredProc_CN.ParamByName('SSP').AsString         := HalcDataSetSelect.FieldByName('SSP').AsString;
                    StoredProc_CN.ParamByName('MOVA').AsString        := HalcDataSetSelect.FieldByName('MOVA').AsString;
                    StoredProc_CN.ParamByName('KSTRAN').AsString      := HalcDataSetSelect.FieldByName('KSTRAN').AsString;
                    StoredProc_CN.ParamByName('KLETDOG').AsString     := HalcDataSetSelect.FieldByName('KLETDOG').AsString;
                    StoredProc_CN.ParamByName('NDOK').AsString        := HalcDataSetSelect.FieldByName('NDOK').AsString;
                    if (HalcDataSetSelect.FieldByName('DDOK').AsString = '') then
                    StoredProc_CN.ParamByName('DDOK').AsString        := DateToStr(Date) else
                    StoredProc_CN.ParamByName('DDOK').AsString        := HalcDataSetSelect.FieldByName('DDOK').AsString;
                    StoredProc_CN.ParamByName('GRUP').AsString        := HalcDataSetSelect.FieldByName('GRUP').AsString;
                    StoredProc_CN.ParamByName('NAMEG').AsString       := HalcDataSetSelect.FieldByName('NAMEG').AsString;
                    StoredProc_CN.ParamByName('ID_KD').AsInt64        := HalcDataSetSelect.FieldByName('ID_KD').AsVariant;
                    StoredProc_CN.ParamByName('DATE_GET').AsString    := DateToStr(Date);
                    try
                       StoredProc_CN.ExecProc;
                       pFIBTransactionWright.Commit;
                    except on E:Exception do begin
                       pFIBTransactionWright.Rollback;
                       ShowMessage(E.Message);
                    end end;

                    //******* End Write  ***********************

                  except on E : Exception
                  do begin
                      ShowMessage(E.Message);
                      exit;
                  end;
                  end;
                HalcDataSetSelect.Next;
                End;
                //***** Вливаем из CN_VC_DOG_VC в CN_VC_BUF_DOG
                StoredProc_CN.Database:=Database_look_dog;
                StoredProc_CN.Transaction:=pFIBTransactionWright;
                StoredProc_CN.Transaction.StartTransaction;
                StoredProc_CN.StoredProcName:='CN_VC_ADD_TO_BUFFER_DOG_4';
                StoredProc_CN.Prepare;
                try
                   StoredProc_CN.ExecProc;
                   pFIBTransactionWright.Commit;
                except on E:Exception do begin
                   pFIBTransactionWright.Rollback;
                   ShowMessage(E.Message);
                end end;

        end;
    end;
    ShowMessage('Iмпорт закiнчено!');
    pFIBDataSetShow.CloseOpen(false);
end;

procedure Tfm_show_fr_import.cxButton1Click(Sender: TObject);
var
    res : Variant;
begin
    res := USetFilterSetings.func_Filter(old_setings, what_do);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<> null) and (res[1]<> null) then
        begin
            old_setings := res[0];
            what_do     := res[1];
            TextEditWhatFind.Text := old_setings;
        end;
        if (what_do = 1) then
        begin
            pFIBDataSetShow.close;
            pFIBDataSetShow.SelectSQL.clear;
            pFIBDataSetShow.SelectSQL.Add('SELECT * FROM CN_SEL_FIRST_INFO_ABOUT_IMP_EX');
            if (old_setings <> '') then
            begin
                pFIBDataSetShow.SelectSQL.Add('WHERE FIO LIKE ' + ''''+old_setings+'''');
            end;
            pFIBDataSetShow.Open;
        end;
        if (what_do = 2) then
        begin
            pFIBDataSetShow.close;
            pFIBDataSetShow.SelectSQL.clear;
            pFIBDataSetShow.SelectSQL.Add('SELECT * FROM CN_SEL_FIRST_INFO_ABOUT_IMP_EX');
            if (old_setings <> '') then
            begin
                pFIBDataSetShow.SelectSQL.Add('WHERE NUM_DOG LIKE ' + ''''+old_setings+'''');
            end;
            pFIBDataSetShow.Open;
        end;
        if (what_do = 0) then
        begin
            pFIBDataSetShow.close;
            pFIBDataSetShow.SelectSQL.clear;
            pFIBDataSetShow.SelectSQL.Add('SELECT * FROM CN_SEL_FIRST_INFO_ABOUT_IMP_EX');
            pFIBDataSetShow.Open;
        end;
    end;
end;

procedure Tfm_show_fr_import.Action1Execute(Sender: TObject);
begin
    cxButton1Click(Sender);
end;

procedure Tfm_show_fr_import.Action2Execute(Sender: TObject);
var
   str : string;
begin
    str := TextEditWhatFind.Text;
    if (str <> '') then
    begin
        str := str[1];
        if (str >= 'а') and (str <= 'я') then
        begin
            what_do := 1;
            old_setings   := AnsiUpperCase(TextEditWhatFind.Text) + '%';
        end;
        if (str >= 'А') and (str <= 'Я') then
        begin
            what_do := 1;
            old_setings   := TextEditWhatFind.Text + '%';
        end;
        if (str >= '0') and (str <= '9') then
        begin
            what_do := 2;
            old_setings   := TextEditWhatFind.Text + '%';
        end;
    end else
    begin
        what_do := 0;
        old_setings   := '';
    end;

    if (what_do = 1) then
        begin
            pFIBDataSetShow.close;
            pFIBDataSetShow.SelectSQL.clear;
            pFIBDataSetShow.SelectSQL.Add('SELECT * FROM CN_SEL_FIRST_INFO_ABOUT_IMP_EX');
            if (old_setings <> '') then
            begin
                pFIBDataSetShow.SelectSQL.Add('WHERE FIO LIKE ' + ''''+old_setings+'''');
            end;
            pFIBDataSetShow.Open;
        end;
        if (what_do = 2) then
        begin
            pFIBDataSetShow.close;
            pFIBDataSetShow.SelectSQL.clear;
            pFIBDataSetShow.SelectSQL.Add('SELECT * FROM CN_SEL_FIRST_INFO_ABOUT_IMP_EX');
            if (old_setings <> '') then
            begin
                pFIBDataSetShow.SelectSQL.Add('WHERE NUM_DOG LIKE ' + ''''+old_setings+'''');
            end;
            pFIBDataSetShow.Open;
        end;
        if (what_do = 0) then
        begin
            pFIBDataSetShow.close;
            pFIBDataSetShow.SelectSQL.clear;
            pFIBDataSetShow.SelectSQL.Add('SELECT * FROM CN_SEL_FIRST_INFO_ABOUT_IMP_EX');
            pFIBDataSetShow.Open;
        end;
end;

procedure Tfm_show_fr_import.FormCreate(Sender: TObject);
var
    Layout: array[0.. KL_NAMELENGTH] of char;
begin
    LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
end;

procedure Tfm_show_fr_import.Action3Execute(Sender: TObject);
var
    id_home : string;
begin
    DataSourceShow.Enabled := false;
    pFIBDataSetShow.first;
    id_home := pFIBDataSetShow['NUM_DOG'];

    pFIBDataSetShow.Locate('NUM_DOG',id_home, []);

    DataSourceShow.Enabled := true;
end;

procedure Tfm_show_fr_import.Action4Execute(Sender: TObject);
var
    id_end : string;
begin
    DataSourceShow.Enabled := false;
    pFIBDataSetShow.last;
    id_end := pFIBDataSetShow['NUM_DOG'];

    pFIBDataSetShow.Locate('NUM_DOG',id_end, []);

    DataSourceShow.Enabled := true;
end;

procedure Tfm_show_fr_import.ActionEscExecute(Sender: TObject);
begin
    cxButtonExitsClick(nil);
end;

procedure Tfm_show_fr_import.ActionImpExecute(Sender: TObject);
begin
    cxButtonImportingClick(nil);
end;

procedure Tfm_show_fr_import.ActionF5Execute(Sender: TObject);
begin
    cxButtonRefreshClick(nil);
end;

procedure Tfm_show_fr_import.ActionsendExecute(Sender: TObject);
begin
    cxButtonDoImportClick(nil);
end;

end.
