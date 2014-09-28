unit USvyazivaniya;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, cxProgressBar, ibase, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfmSvyazki = class(TForm)
    cxProgressBar1: TcxProgressBar;
    cxButtonSvyazati: TcxButton;
    cxButtonClose: TcxButton;
    pFIBDatabaseSvyazki: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWright: TpFIBTransaction;
    DataSetSvyazki: TpFIBDataSet;
    Virtual1_DataSet: TpFIBDataSet;
    Virtual2_DataSet: TpFIBDataSet;
    pFIBStoredProcDoSvyazku: TpFIBStoredProc;
    DataSetSvyazkiFIO: TFIBStringField;
    DataSetSvyazkiDTITM: TFIBStringField;
    DataSetSvyazkiGET_REC: TFIBSmallIntField;
    DataSetSvyazkiID_DOG: TFIBBCDField;
    DataSetSvyazkiSPODRI: TFIBSmallIntField;
    DataSetSvyazkiID_MOVA: TFIBStringField;
    DataSetSvyazkiID_FORM: TFIBStringField;
    DataSetSvyazkiID_KAT: TFIBStringField;
    DataSetSvyazkiNST_DOG: TFIBBCDField;
    DataSetSvyazkiID_STAGE: TFIBBCDField;
    DataSetSvyazkiID_KD: TFIBBCDField;
    DataSetSvyazkiNUM_DOG: TFIBStringField;
    TransForDefaltSP: TpFIBTransaction;
    StoredProc_GetDefalt: TpFIBStoredProc;
    DataSetSvyazkiSSP: TFIBStringField;
    Label1: TLabel;
    LabelNumDog: TLabel;
    Label2: TLabel;
    LabelRecNo: TLabel;
    LabelRecCount: TLabel;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonSvyazatiClick(Sender: TObject);
    procedure do_all_work;
  private
    { Private declarations }
    id_actived_dog : int64;
    my_date : Tdate;
    is_maindog, fucking_flag, import_finish : integer;
    id_roor, id_dogovor, id_student, type_fin, title_more : String;
    sm_t, rz_t, st_t, kekv_t : string;
  public
    { Public declarations }
    ResultArray : Variant;
  end;

  function func_Svyazi(Base: TISC_DB_HANDLE; active_id_dog : Int64) : variant;
var
  fmSvyazki: TfmSvyazki;

implementation
uses UErrorSvyaziPodr,uAddProv;

{$R *.dfm}

function func_Svyazi(Base: TISC_DB_HANDLE; active_id_dog : Int64) : variant;
var
    fm : TfmSvyazki;
begin
    fm := TfmSvyazki.Create(nil);
    fm.pFIBDatabaseSvyazki.Handle := Base;
    fm.id_actived_dog := active_id_dog;

    fm.import_finish := 0;

    fm.Caption                  := 'Проведення св''язання';
    fm.cxButtonClose.Caption    := 'Вихiд';
    fm.cxButtonSvyazati.Caption := 'Iмпортувати';

    fm.DataSetSvyazki.Close;
    fm.DataSetSvyazki.SQLs.SelectSQL.Text := 'select * from CN_SEL_FIRST_INFO_ABOUT_IMP';
    fm.DataSetSvyazki.Open;

    fm.pFIBStoredProcDoSvyazku.Database:=fm.pFIBDatabaseSvyazki;
    fm.pFIBStoredProcDoSvyazku.Transaction:=fm.pFIBTransactionWright;
    fm.pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
    fm.pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_PROPUSK_UPDATE';
    fm.pFIBStoredProcDoSvyazku.Prepare;
    try
       fm.pFIBStoredProcDoSvyazku.ExecProc;
       fm.pFIBTransactionWright.Commit;
    except on E:Exception do begin
       fm.pFIBTransactionWright.Rollback;
       ShowMessage(E.Message);
    end end;

    fm.ShowModal;
    func_Svyazi := fm.ResultArray;
    fm.Free;
end;

procedure TfmSvyazki.cxButtonCloseClick(Sender: TObject);
begin
    pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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

    close;
end;


procedure TfmSvyazki.cxButtonSvyazatiClick(Sender: TObject);
begin
    DataSetSvyazki.FetchAll;

    // Раньше здесь был код, который теперь вызывается процедурой do_all_work
    if  not DataSetSvyazki.IsEmpty then
    begin
        cxProgressBar1.Properties.Max := DataSetSvyazki.RecordCount;
        do_all_work;
    end else
    begin
        ShowMessage('Вибачте, але договорiв для проведення iмпорта у системi нема!');
        Exit;
    end;


    pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
    pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
    pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
    pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_CLEAR_FROM_SPODRI_TMP';
    pFIBStoredProcDoSvyazku.Prepare;
    try
       pFIBStoredProcDoSvyazku.ExecProc;
       pFIBTransactionWright.Commit;
    except on E:Exception do begin
       pFIBTransactionWright.Rollback;
       ShowMessage(E.Message);
    end end;

    pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
    pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
    pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
    pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_FOR_MESS_SELECT';
    pFIBStoredProcDoSvyazku.Prepare;
    try
       pFIBStoredProcDoSvyazku.ExecProc;
       ShowMessage('Проiмпортовано: ' + IntToStr(import_finish) + '. Пропущено: ' + pFIBStoredProcDoSvyazku.FieldByName('propusheno').AsString + '. Розглянено: ' + pFIBStoredProcDoSvyazku.FieldByName('neproimp').AsString);
       pFIBTransactionWright.Commit;
    except on E:Exception do begin
       pFIBTransactionWright.Rollback;
       ShowMessage(E.Message);
    end end;
end;

procedure TfmSvyazki.do_all_work;
var
    id_pod, id_mova, id_form, id_kat, id_dog_vc, ID_STAGE, id_kd : int64;
    id_pod_prop, id_spec_prop, id_mova_prop, id_form_prop, id_kat_prop, ID_STAGE_PROP : int64;
    fuc, spec, gragd, forma, kat, stage, kd : string;
    Flag_poiska_facul, Flag_poiska_spec, Flag_poiska_mova, flag_poiska_form, flag_poiska_kat, FLAG_POISKA_STAGE, flag_poiska_kd : integer;
    name_podr, num_dog, id_spec : String;
    res            : Variant;
    flag_importa   : integer;
    flag_facul     : int64;
    flag_na_exit   : integer;
    NST_DOG        : int64;
    sm, rz, st, kekv : String;
    id_sm, id_rz, id_st, id_kekv : int64;
    id_fuc_old, id_spec_old, id_mova_old, id_form_old, id_kat_old, ID_STAGE_old, id_kd_old : int64;
    fucking_ales : Integer;
begin
    LabelRecCount.Caption:=IntToStr(DataSetSvyazki.RecordCount);
    while not DataSetSvyazki.Eof do
    begin
        if (DataSetSvyazki['GET_REC'] = 0) then
        begin
            id_pod    := DataSetSvyazki['SPODRI'];
            id_spec   := DataSetSvyazki['SSP'];
            id_mova   := DataSetSvyazki['ID_MOVA'];
            num_dog   := DataSetSvyazki['NUM_DOG'];
            id_dog_vc := DataSetSvyazki['ID_DOG'];

            id_form   := DataSetSvyazki['ID_FORM'];
            id_kat    := DataSetSvyazki['ID_KAT'];
            NST_DOG   := DataSetSvyazki['NST_DOG'];
            ID_STAGE  := DataSetSvyazki['ID_STAGE'];
            id_kd     := DataSetSvyazki['ID_KD'];

            fucking_ales :=0;

            LabelNumDog.Caption:=num_dog;
            LabelRecNo.Caption:=IntToStr(DataSetSvyazki.RecNo);

            Virtual1_DataSet.Close;
            Virtual1_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_ZAPRET_SPODRI('+IntToStr(id_pod)+')';
            Virtual1_DataSet.Open;
            id_pod_prop := Virtual1_DataSet.FieldByName('FLAG').AsInteger;

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

            if id_pod_prop = 0 then
            begin
            if Flag_poiska_facul = 0 then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_PODRI('+IntToStr(id_pod)+')';
                Virtual2_DataSet.Open;
                name_podr := Virtual2_DataSet.FieldByName('NAME').AsString;
                fuc       := name_podr;

                res := UErrorSvyaziPodr.func_ErrorSvyazi(pFIBDatabaseSvyazki.Handle, name_podr, 1,0,'');
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            fucking_ales :=1;
                            exit;
                        end;

                        if flag_na_exit = 1 then
                        begin
//                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
//                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
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
//                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
//                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SYMPLE_PO_FACUL';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_SPODRI').AsInt64   := id_pod;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               id_fuc_old := pFIBStoredProcDoSvyazku.FieldByName('ID_FACUL').AsInteger;
                               pFIBStoredProcDoSvyazku.Transaction.Commit;
                            except on E:Exception do begin
                               pFIBStoredProcDoSvyazku.Transaction.Rollback;
                               ShowMessage(E.Message);
                            end end;
                        end;
                        if flag_na_exit = 3 then
                        begin
//                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
//                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
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

//                            DataSetSvyazki.closeOpen(false);
//                            DataSetSvyazki.Locate('NUM_DOG', num_dog, []);
                            //DataSetSvyazki.Next;
                            fucking_ales :=1;
                            //exit;
                        end;
                    end;
                end;
            end else
            begin
                flag_facul := id_fuc_old;
                //fucking_ales :=1;
            end;
            //******************************************* SPEC  ****************
            if (Flag_poiska_spec = 0) and (fucking_ales =0) then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_SPEC('''+id_spec+''')';
                Virtual2_DataSet.Open;
                name_podr := Virtual2_DataSet.FieldByName('NAME').AsString;
                spec      := name_podr;

                res := UErrorSvyaziPodr.func_ErrorSvyazi(pFIBDatabaseSvyazki.Handle, name_podr, 2,id_fuc_old,'');
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            fucking_ales :=1;
                            exit;
                        end;

                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SVYAZKI_PO_SPEC';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_SSP').AsString  := id_spec;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_SPEC').AsInt64  := flag_facul;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_FACUL').AsInt64 := id_fuc_old;
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
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_SYMPLE_PO_SPEC';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_SSP').AsString   := id_spec;
                            pFIBStoredProcDoSvyazku.ParamByName('ID_FACUL').AsInt64 := id_fuc_old;

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
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                               //ShowMessage('id_spec'+IntToStr(id_spec));
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
//                            DataSetSvyazki.closeOpen(false);
//                            DataSetSvyazki.Locate('NUM_DOG', num_dog, []);
                            fucking_ales :=1;
                            //exit;
                        end;
                    end;
                end;
            end;
            //********************* FORM **************************************
            if (flag_poiska_form = 0) and (fucking_ales =0) then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_FORM_STUD('+IntToStr(id_form)+')';
                Virtual2_DataSet.Open;
                name_podr := Virtual2_DataSet.FieldByName('NAME').AsString;
                forma     := name_podr;

                res := UErrorSvyaziPodr.func_ErrorSvyazi(pFIBDatabaseSvyazki.Handle, name_podr, 3,0,'');
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            fucking_ales :=1;
                            Close;
                            exit;
                        end;

                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
//                            DataSetSvyazki.closeOpen(false);
//                            DataSetSvyazki.Locate('NUM_DOG', num_dog, []);
                            fucking_ales :=1;
                            //exit;
                        end;
                    end;
                end;
            end;

            //********************* KAT **************************************
            if (flag_poiska_kat = 0) and (fucking_ales =0) then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_KAT_STUD('+IntToStr(id_kat)+')';
                Virtual2_DataSet.Open;
                name_podr := Virtual2_DataSet.FieldByName('NAME').AsString;
                kat       := name_podr;

                res := UErrorSvyaziPodr.func_ErrorSvyazi(pFIBDatabaseSvyazki.Handle, name_podr, 4,0,'');
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            fucking_ales :=1;
                            Close;
                            exit;
                        end;

                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
//                            DataSetSvyazki.closeOpen(false);
//                            DataSetSvyazki.Locate('NUM_DOG', num_dog, []);
                            fucking_ales :=1;
                            //exit;
                        end;
                    end;
                end;
            end;
//********************* STAGE **************************************************
            if (Flag_poiska_stage = 0) and (fucking_ales =0) then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_STAGE('+IntToStr(id_stage)+')';
                Virtual2_DataSet.Open;
                name_podr := Virtual2_DataSet.FieldByName('NAME').AsString;
                stage     := name_podr;
                res := UErrorSvyaziPodr.func_ErrorSvyazi(pFIBDatabaseSvyazki.Handle, name_podr, 6,0,'');
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            fucking_ales :=1;
                            Close;
                            exit;
                        end;
                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
//                            DataSetSvyazki.closeOpen(false);
//                            DataSetSvyazki.Locate('NUM_DOG', num_dog, []);
                            fucking_ales :=1;
                            //exit;
                        end;
                    end;
                end;
            end;
            //********************* MOVA ***************************************
            if (Flag_poiska_mova = 0) and (fucking_ales =0) then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_MOVA('+IntToStr(id_mova)+')';
                Virtual2_DataSet.Open;
                name_podr := Virtual2_DataSet.FieldByName('NAME').AsString;
                gragd     := name_podr;

                res := UErrorSvyaziPodr.func_ErrorSvyazi(pFIBDatabaseSvyazki.Handle, name_podr, 5,0,'');
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            fucking_ales :=1;
                            Close;
                            exit;
                        end;

                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
//                            DataSetSvyazki.closeOpen(false);
//                            DataSetSvyazki.Locate('NUM_DOG', num_dog, []);
                            fucking_ales :=1;
                            //exit;
                        end;
                    end;
                end;
            end;
            //********************* KD_NDOG ***************************************
            if (flag_poiska_kd = 0) and (fucking_ales =0) then
            begin
                Virtual2_DataSet.Close;
                Virtual2_DataSet.SQLs.SelectSQL.Text := 'select * from CN_VC_SEL_NAME_KD('+IntToStr(id_kd)+')';
                Virtual2_DataSet.Open;
                kd := Virtual2_DataSet.FieldByName('NAME').AsString;
                title_more := Virtual2_DataSet.FieldByName('more_info').AsString;
                //gragd     := name_podr;

                res := UErrorSvyaziPodr.func_ErrorSvyazi(pFIBDatabaseSvyazki.Handle, kd, 7,0, title_more);
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null) then
                    begin
                        flag_facul   := res[0];
                        flag_na_exit := res[1];
                        if flag_na_exit = 0 then
                        begin
                            fucking_ales :=1;
                            Close;
                            exit;
                        end;

                        if flag_na_exit = 1 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
//                            DataSetSvyazki.closeOpen(false);
//                            DataSetSvyazki.Locate('NUM_DOG', num_dog, []);
                            fucking_ales :=1;
                            //exit;
                        end;
                    end;
                end;
            end;
          //end;
//************************ Запись в буфер договоров ВЦ *************************
           {
            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
            pFIBStoredProcDoSvyazku.Transaction.StartTransaction;
            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ADD_TO_BUFFER_DOG';
            pFIBStoredProcDoSvyazku.Prepare;
            pFIBStoredProcDoSvyazku.ParamByName('NST_DOG').AsInt64   := NST_DOG;
            pFIBStoredProcDoSvyazku.ParamByName('NDV').AsString      := num_dog;
            try
               pFIBStoredProcDoSvyazku.ExecProc;
               pFIBTransactionWright.Commit;
            except on E:Exception do begin
               pFIBTransactionWright.Rollback;
               ShowMessage(E.Message);
            end end;
           }
//************************ Запись в осн договора *******************************
           //ShowMessage('fucking_ales='+IntToStr(fucking_ales));
           if (fucking_ales =0) then
           begin
           //ShowMessage('fucking_ales1='+IntToStr(fucking_ales));
            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                   import_finish := import_finish + 1;
                   cxProgressBar1.Position := cxProgressBar1.Position + 1;
                   Refresh;
               end;
            except on E:Exception do begin
               pFIBTransactionWright.Rollback;
               ShowMessage(E.Message);
            end end;

            if (is_maindog = 2) or (is_maindog = 3) then
            begin
                StoredProc_GetDefalt.Database:=pFIBDatabaseSvyazki;
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
                {sm          := '0'; rz          := '0'; st          := '0'; kekv        := '0';
                id_sm       := 0;   id_rz       := 0;   id_st       := 0;   id_kekv     := 0;}
                my_date     := Date;

                if (is_maindog = 2) then type_fin := 'додатковий договiр' else type_fin := 'основний договiр';
//                ShowMessage(num_dog);
                res := uAddProv.GetProv(self, pFIBDatabaseSvyazki.Handle, sm, rz, st, kekv, num_dog, my_date, id_sm, id_rz, id_st, id_kekv,  id_fuc_old, id_spec_old, id_mova_old, id_form_old, id_kat_old, ID_STAGE_old, type_fin, sm_t, rz_t, st_t, kekv_t);
                if VarArrayDimCount(res) > 0 then
                begin
                    fucking_flag := res[14];
                    if (fucking_flag = 1) then
                    begin
                        if (res[10]<>null) and (res[11]<>null) and (res[12]<>null) then
                        begin
                              //pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                                cxProgressBar1.Position := cxProgressBar1.Position + 1;
                                Refresh;
                                import_finish := import_finish + 1;
                                pFIBTransactionWright.Commit;
                                except on E:Exception do begin
                                   pFIBTransactionWright.Rollback;
                                   ShowMessage(E.Message);
                                end end;
                        end;
                    end else
                    begin
                        pFIBTransactionWright.Rollback;

                        if fucking_flag = 0 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
                            pFIBStoredProcDoSvyazku.Transaction:=pFIBTransactionWright;
                            pFIBTransactionWright.StartTransaction;
                            pFIBStoredProcDoSvyazku.StoredProcName:='CN_VC_ROZSMOTRENNIY_DOG';
                            pFIBStoredProcDoSvyazku.Prepare;
                            pFIBStoredProcDoSvyazku.ParamByName('NDV').AsString        := num_dog;
                            try
                               pFIBStoredProcDoSvyazku.ExecProc;
                               pFIBTransactionWright.Commit;
                               import_finish := import_finish + 1;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                        end;

                        if fucking_flag = 4 then
                        begin
                            DataSetSvyazki.last;
                        end;

                        if fucking_flag = 3 then
                        begin
                            pFIBStoredProcDoSvyazku.Database:=pFIBDatabaseSvyazki;
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
                               import_finish := import_finish + 1;
                            except on E:Exception do begin
                               pFIBTransactionWright.Rollback;
                               ShowMessage(E.Message);
                            end end;
                        end;
                    end;
                end;
            end;
           end;
        end;
        end;
        if fucking_flag = 4 then
        begin
            DataSetSvyazki.last;
        end;

        DataSetSvyazki.Next;
    end;
end;

end.
