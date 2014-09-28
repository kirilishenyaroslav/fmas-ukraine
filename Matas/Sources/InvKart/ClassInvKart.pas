{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit ClassInvKart;

interface

uses Classes, pFIBDatabase, pFIBStoredProc, pFIBDataSet, Forms,
     Windows, Messages, SysUtils, Variants, Dialogs, Controls,
     DateUtils, StdCtrls, AccMGMT, uResources, uWaitWindow,
     cxDropDownEdit, uZProc, FIBDatabase, ibase,
     DB, FIBDataSet, Registry, MainInvKartForm;

function AddPapka(name, kod_name : string; linkto : int64; has_child : int64):int64;
procedure ChangePapka(id : int64; name, kod_name : string; linkto : int64);
procedure ChangeChild(linkto, chaild : int64);
procedure DeletePapka(id : int64);

function AddKartochku(id, MOL, nomn, sch : int64; grp_num, tip_kart : string; inv_num : string; zav_num, pas_num : string;
                      kart_num : int64; beg_price : string; beg_iznos, ost_price, ost_iznos : Variant; date_ost{, date_opr} : string;
                      id_oper_opr : int64; {date_expl : string;} id_oper_expl : int64; {date_update : string;} id_oper_update : int64;
                      {date_out : string;} id_oper_out : Int64; date_create : string; id_cust : Int64; doc_reg : string;
                      date_reg : string; note, model, marka : string; buh_id_grp, buh_id_metod, nal_id_grp, nal_id_metod, update_child : Int64;
                      buh_percent, buh_min_price : variant; buh_Year, buh_month : integer; buh_db_sch, buh_kr_sch, is_check : int64;
                      nal_percent, nal_min_price : variant; nal_Year, nal_month : integer; nal_db_sch, nal_kr_sch, work: integer; inv_full : string; is_buhg_acc, is_ost : integer; id_ost : int64; is_inv_obj : Integer; name_full:string;
                      bal_price_nal:string; bal_iznos_nal:string; ost_price_nal:string; ost_iznos_nal:string):int64;
procedure ChangeKartochku(GRP_ID, id, MOL, nomn, sch : int64; grp_num, tip_kart : string; inv_num : string; zav_num, pas_num : string;
                      kart_num : int64; beg_price, beg_iznos, ost_price, ost_iznos : Variant; date_ost, date_opr : string;
                      id_oper_opr : int64; date_expl : string; id_oper_expl : int64; date_update : string; id_oper_update : int64;
                      date_out : string; id_oper_out : Int64; date_create : string; id_cust : Int64; doc_reg : string;
                      date_reg : string; note, model, marka : string; buh_id_grp, buh_id_metod, nal_id_grp, nal_id_metod : Int64;
                      buh_percent, buh_min_price : variant; buh_Year, buh_month : integer; buh_db_sch, buh_kr_sch, is_check : int64;
                      nal_percent, nal_min_price : variant; nal_Year, nal_month  : integer; nal_db_sch, nal_kr_sch : integer; inv_full : string; is_buhg_acc, is_ost : integer; id_ost : int64; is_inv_obj : Integer; id_user:Int64; user_name:string; name_full:string;
                      bal_price_nal:string; bal_iznos_nal:string; ost_price_nal:string; ost_iznos_nal:string);
procedure DeleteKartochku(id : int64);

function AddMetall(id, name : int64; kol : Variant):int64;
procedure ChangeMetall(id, name : int64;  kol : Variant);
procedure DeleteMetall(id : int64);

function AddNorma(NAME_NORMA : string; PERCENTI : Variant; PERIOD, ID_METHOD, TIP :int64; FORMULA : string; SR_YEAR, SR_MONTH : integer):int64;
procedure ChangeNorma(id : int64; NAME_NORMA : string; PERCENTI : Variant; PERIOD, ID_METHOD, TIP :int64; FORMULA : string; SR_YEAR, SR_MONTH : integer);
procedure DeleteNorma(id : int64);

function AddObject(id_inv_krt, id_obj_from_nomn, id_nomn_from_inv_krt : int64; material, siyzi : string; coef, kol_mat, summ : Variant; note_obj : string): int64;
procedure ChangeObject (id_obj, id_inv_krt, id_obj_from_nomn, id_nomn_from_inv_krt : int64; material, siyzi : string; coef, kol_mat, summ : Variant; note_obj : string);
procedure DeleteObject(id : int64);

function Provodki(tip_oper : integer; num_doc, date_doc, date_rec : string; id_mo_old, id_mo_new, id_sch_old, id_sch_new : int64; ost_price_old, ost_price_new, ost_iznos_old, ost_iznos_new, iznos, summa : Variant; pub_id_doc, id_inv_kart,  id_user : int64; computer_name : string): int64;
procedure Insert_into_MATAS(Doc_num, Date_doc : string; id_mo_old : int64; Summa_old : string; id_user : int64; user_name, computer_name : string; id_nomn : int64; beg_price, Summa_oper : string; id_sch_old, id_ost_in, id_kart : int64);
procedure Update_oprih(id_kart, id_oper_opr : int64; date_oprih : string);


procedure Update_peremesh(id_kart, id_mo, id_sch : int64);
procedure Update_expl(id_kart, id_oper_expl : int64; date_expl : string; id_mo : int64);
procedure Update_out(id_kart : int64; date_out : string);
procedure Update_modern(id_kart, id_oper_update : int64; date_update : string; ost_price : Variant);
procedure Update_out_modern(id_kart, id_oper_update : int64; date_update : string; ost_price : Variant);
procedure UnOper_peremeshenie(id_kartochki, ID_OPER : int64);
procedure UnOper_expl(id_kartochki, ID_OPER : int64);
procedure Pereocenka(id_karti : int64; iznosik, priycik : string);
procedure Un_Pereocenka(id_karti, id_operka : int64; tip_op : integer);

function For_main_ved(date_rec, koeff, tip : String) : Int64;
procedure Info_for_ved(id_ved : int64);
procedure Delete_ved(id_ved : int64);

procedure Un_all_Operacii(id_kartochki, id_operacii : int64);

procedure Update_modern_cansel(id_kart, id_oper_update : int64; date_update : string; ost_price, ost_iznos : Variant);

procedure Create_Full_Inv_num(id_kart : int64; inv_num : integer);

procedure Otmena_amort(id_ved : int64);
procedure Save_amort_setings(id_ved : int64);
procedure Save_to_ved(id_ved : int64);
procedure Save_amort_calc(id_ved : int64; id_session:Integer);
procedure Save_pereocenku(id_user : int64; user_name, computer, Date_doc,  Date_rec : string; ID_SESSION_PER, PUB_ID_DOC : int64; TIP_OPER : Integer; ID_KARTI : int64; UNDELOPER: integer; NOTE:string);
procedure Save_mass_pereocenku(id_mo_input, id_user : int64; user_name, computer, Date_doc,  Date_rec : string; ID_SESSION_PER, PUB_ID_DOC : int64; TIP_OPER : Integer; UNDELOPER: integer);

procedure LoadReportsTocxComboBoxMy(aOBJECT: string; aComboBox: TcxComboBox; var aReports: Variant);

procedure Work_with_sch_and_grp(GRP_FLAG, GRP_ID : int64);
procedure Work_with_sch_and_grp_one(GRP_FLAG, GRP_ID : int64);
procedure Delete_from_tmp_print;

function GenId_sessionFilter:Variant;
function Sel_checkers:Variant;

procedure Delete_prov_from_doc(PUB_ID_DOC: int64; T_OPER : integer);
procedure Delete_prov_from_doc_mass(PUB_ID_DOC: int64);
procedure Delete_prov_from_doc_minus(PUB_ID_DOC: int64);

procedure ADD_TO_VED_ABOUT_PEREOC(TIP, DATE_PEREOC, COEFF :string);

function InvWork(AOwner:TComponent; id_user: int64; DB: TpFIBDatabase):Integer;stdcall;

exports InvWork;

var
    Global_id_user : int64;

implementation

var
    Class_Database:        TpFIBDatabase;
    Class_Transaction_R:   TpFIBTransaction;
    Class_Transaction_Wr:  TpFIBTransaction;
    Class_StoredProc:      TpFIBStoredProc;
    Class_DataSet:         TpFIBDataSet;

    id_oper        : int64;
    id_vedom       : INT64;
    ID_PEREOC_VED  : int64;
    id_oper_pereoc : Int64;

procedure Create(id: int64; DB: TpFIBDatabase); forward;

function InvWork(AOwner:TComponent; id_user: int64; DB: TpFIBDatabase):Integer;
var
    T : TfmMainIvKartForm;
begin
    Create(id_user,DB);
    T := TfmMainIvKartForm.Create(AOwner, Class_Database.Handle, Show);
    T.FormStyle := fsMDIChild;
    T.Show;
    T.cxDBTreeListPapka.SetFocus;
    Result := 0;
end;

function GenId_sessionFilter:Variant;
begin
    GenId_sessionFilter:=Class_Database.Gen_Id('MAT_ID_SESSION',1, Class_Transaction_Wr);
end;

function Sel_checkers:Variant;
begin
    Class_DataSet.close;
    Class_DataSet.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_PO_CHEKERU';
    Class_DataSet.Open;
    Class_DataSet.First;
    Sel_checkers := Class_DataSet.FieldByName('ID_KART').AsString;
    Class_DataSet.close;
end;

procedure Create(id: int64; DB: TpFIBDatabase);
begin
    Class_Database                       := db;
    if not Class_Database.Connected then ShowMessage('База не подкдючена!');
    Class_Transaction_R.DefaultDatabase  := Class_Database;
    Class_Transaction_Wr.DefaultDatabase := Class_Database;
    Class_StoredProc.Database            := Class_Database;
    Class_DataSet.Database               := Class_Database;
    Global_id_user                       := id;
end;

function AddPapka(name, kod_name : string; linkto : int64; has_child : int64): int64;
begin
//    Class_DataSet.Database:=Class_Database;
    Class_DataSet.Transaction:=Class_Transaction_Wr;
    Class_DataSet.Transaction.StartTransaction;
    Class_DataSet.Close;
    try
        Class_DataSet.SQLs.SelectSQL.Text := 'select ID_PAPKA from MAT_INV_ADD_PAPKA_GROUP('+IntToStr(linkto)+', ''' + name + ''','''+kod_name+''','+IntToStr(has_child)+')';
        Class_DataSet.Open;
        Result := Class_DataSet.FieldByName('ID_PAPKA').AsVariant;
        Class_DataSet.Close;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        Result := 0;
        exit;
    end end;
    Class_Transaction_Wr.Commit;
end;


procedure ChangeChild(linkto, chaild : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_CHAING_CHAILD';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_LINKTO').AsInt64               := linkto;
    Class_StoredProc.ParamByName('UPDATE_CHILD').AsInt64           := chaild;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;


procedure ChangePapka(id : int64; name, kod_name : string; linkto : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_CHANGE_PAPKA';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64               := id;
    Class_StoredProc.ParamByName('D_NAME').AsString            := name;
    Class_StoredProc.ParamByName('D_KOD_NAME').AsString        := kod_name;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;

procedure DeletePapka(id: int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_DELETE_PAPKA';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64:=ID;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;

function AddKartochku(id, MOL, nomn, sch : int64; grp_num, tip_kart : string; inv_num : string; zav_num, pas_num : string;
                      kart_num : int64; beg_price : string; beg_iznos, ost_price, ost_iznos : Variant; date_ost{, date_opr} : string;
                      id_oper_opr : int64; {date_expl : string;} id_oper_expl : int64;{ date_update : string;} id_oper_update : int64;
                      {date_out : string;} id_oper_out : Int64; date_create : String; id_cust : Int64; doc_reg : string;
                      date_reg : string; note, model, marka : string; buh_id_grp, buh_id_metod, nal_id_grp, nal_id_metod, update_child : Int64;
                      buh_percent, buh_min_price : variant; buh_Year, buh_month : integer; buh_db_sch, buh_kr_sch, is_check : int64;
                      nal_percent, nal_min_price : variant; nal_Year, nal_month : integer; nal_db_sch, nal_kr_sch, work : integer; inv_full : string;  is_buhg_acc, is_ost : integer; id_ost : int64; is_inv_obj : Integer;name_full:string;
                      bal_price_nal:string; bal_iznos_nal:string; ost_price_nal:string; ost_iznos_nal:string):int64;
VAR
    ID_KARTA : INT64;
begin
    Class_DataSet.Transaction := Class_Transaction_Wr;
    Class_DataSet.Transaction.StartTransaction;
    Class_DataSet.Close;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    try
        Class_DataSet.Close;
        Class_DataSet.Sqls.SelectSQL.Text := 'select * from PUB_GET_ID_BY_GEN(''' + 'MAT_GEN_ID_INV_KART' + ''', '+IntToStr(1)+')';
        Class_DataSet.Open;
        Result   := StrToInt64(Class_DataSet.FieldByName('RET_VALUE').asString);
        id_karta := StrToInt64(Class_DataSet.FieldByName('RET_VALUE').asString);

        Class_DataSet.Close;
        //DecimalSeparator := '.';
    Class_StoredProc.StoredProcName:='MAT_INV_ADD_NEW_KART';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KARTA').AsInt64            := id_karta;
    Class_StoredProc.ParamByName('D_LINKTO').AsInt64            := id;
    Class_StoredProc.ParamByName('ID_MO').AsInt64               := MOL;
    Class_StoredProc.ParamByName('ID_NOMN').AsInt64             := nomn;
    Class_StoredProc.ParamByName('ID_SCH').AsInt64              := sch;
    Class_StoredProc.ParamByName('TIP_KRT').AsString            := tip_kart;
    Class_StoredProc.ParamByName('GRP_NUM').AsString            := grp_num;
    Class_StoredProc.ParamByName('INV_NUM').AsString            := inv_num;
    Class_StoredProc.ParamByName('ZAV_NUM').AsString            := zav_num;
    Class_StoredProc.ParamByName('PAS_NUM').AsString            := pas_num;
    Class_StoredProc.ParamByName('KART_NUM').AsInt64            := kart_num;
    Class_StoredProc.ParamByName('BEG_PRICE').AsString          := beg_price;
    Class_StoredProc.ParamByName('BEG_IZNOS').AsString          := beg_iznos;
    Class_StoredProc.ParamByName('OST_PRICE').AsString          := ost_price;
    Class_StoredProc.ParamByName('OST_IZNOS').AsString          := ost_iznos;
    Class_StoredProc.ParamByName('DATE_OST').AsString           := date_ost;
//    Class_StoredProc.ParamByName('DATE_OPR').AsString           := date_opr;
    Class_StoredProc.ParamByName('ID_OPER_OPR').AsInt64         := id_oper_opr;
//    Class_StoredProc.ParamByName('DATE_EXPL').AsString          := date_expl;
    Class_StoredProc.ParamByName('ID_OPER_EXPL').AsInt64        := id_oper_expl;
//    Class_StoredProc.ParamByName('DATE_UPDATE').AsString        := date_update;
    Class_StoredProc.ParamByName('ID_OPER_UPDATE').AsInt64      := id_oper_update;
//    Class_StoredProc.ParamByName('DATE_OUT').AsString           := date_out;
    Class_StoredProc.ParamByName('ID_OPER_OUT').AsInt64         := id_oper_out;
    Class_StoredProc.ParamByName('DATE_CREATE').AsString        := date_create;
    Class_StoredProc.ParamByName('ID_CUSTOMER').AsInt64         := id_cust;
    Class_StoredProc.ParamByName('DOC_REG').AsString            := doc_reg;
    Class_StoredProc.ParamByName('DATE_REG').AsString           := date_reg;
    Class_StoredProc.ParamByName('NOTE').AsString               := note;
    Class_StoredProc.ParamByName('MODEL').AsString              := model;
    Class_StoredProc.ParamByName('MARKA').AsString              := marka;
    Class_StoredProc.ParamByName('BUH_ID_AM_GRP').AsInt64       := buh_id_grp;
    Class_StoredProc.ParamByName('BUH_ID_AM_METOD').AsInt64     := buh_id_metod;
    Class_StoredProc.ParamByName('NAL_ID_AM_GRP').AsInt64       := nal_id_grp;
    Class_StoredProc.ParamByName('NAL_ID_AM_METOD').AsInt64     := nal_id_metod;
    Class_StoredProc.ParamByName('UPDATE_CHILD').AsInt64        := update_child;
    Class_StoredProc.ParamByName('BUH_PERCENT').AsString        := buh_percent;
    Class_StoredProc.ParamByName('BUH_MIN_PRICE').AsString      := buh_min_price;
    Class_StoredProc.ParamByName('BUH_YEAR_IZN').Asinteger      := buh_Year;
    Class_StoredProc.ParamByName('BUH_MONTH_IZN').Asinteger     := buh_month;
    Class_StoredProc.ParamByName('BUH_DB_SCH').Asint64          := buh_db_sch;
    Class_StoredProc.ParamByName('BUH_KR_SCH').Asint64          := buh_kr_sch;
    Class_StoredProc.ParamByName('NA_CHECK').Asint64            := is_check;
    Class_StoredProc.ParamByName('NAL_PERCENT').AsString        := nal_percent;
    Class_StoredProc.ParamByName('NAL_MIN_PRICE').AsString      := nal_min_price;
    Class_StoredProc.ParamByName('NAL_YEAR_IZN').Asinteger      := nal_Year;
    Class_StoredProc.ParamByName('NAL_MONTH_IZN').Asinteger     := nal_month;
    Class_StoredProc.ParamByName('NAL_DB_SCH').Asint64          := nal_db_sch;
    Class_StoredProc.ParamByName('NAL_KR_SCH').Asint64          := nal_kr_sch;
    Class_StoredProc.ParamByName('WORKED').AsInteger            := 1;
    Class_StoredProc.ParamByName('INV_FULL').AsString           := inv_full;
    Class_StoredProc.ParamByName('is_buhg_acc').AsInteger       := is_buhg_acc;
    Class_StoredProc.ParamByName('is_ost').AsInteger            := is_ost;
    Class_StoredProc.ParamByName('ID_OST_IN').Asint64           := id_ost;
    Class_StoredProc.ParamByName('IS_INV_OBJ').AsInteger        := is_inv_obj;
    Class_StoredProc.ParamByName('NAME_FULL').AsString          := name_full;
    Class_StoredProc.ParamByName('BEG_PRICE_NAL').AsString      := bal_price_nal;
    Class_StoredProc.ParamByName('BEG_IZNOS_NAL').AsString      := bal_iznos_nal;
    Class_StoredProc.ParamByName('OST_PRICE_NAL').AsString      := ost_price_nal;
    Class_StoredProc.ParamByName('OST_IZNOS_NAL').AsString      := ost_iznos_nal;
    Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        Result := 0;
        exit;
    end end;
    DecimalSeparator := ',';
end;


procedure ChangeKartochku(GRP_ID, id, MOL, nomn, sch : int64; grp_num, tip_kart : string; inv_num : string; zav_num, pas_num : string;
                      kart_num : int64; beg_price, beg_iznos, ost_price, ost_iznos : Variant; date_ost, date_opr : string;
                      id_oper_opr : int64; date_expl : string; id_oper_expl : int64; date_update : string; id_oper_update : int64;
                      date_out : string; id_oper_out : Int64; date_create : String; id_cust : Int64; doc_reg : string;
                      date_reg : string; note, model, marka : string; buh_id_grp, buh_id_metod, nal_id_grp, nal_id_metod : Int64;
                      buh_percent, buh_min_price : variant; buh_Year, buh_month : integer; buh_db_sch, buh_kr_sch, is_check : int64;
                      nal_percent, nal_min_price : variant; nal_Year, nal_month  : integer; nal_db_sch, nal_kr_sch : integer; inv_full : string; is_buhg_acc, is_ost : integer; id_ost : int64; is_inv_obj : Integer; id_user:Int64; user_name:string; name_full:string;
                      bal_price_nal:string; bal_iznos_nal:string; ost_price_nal:string; ost_iznos_nal:string);
begin
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    try
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    DecimalSeparator := '.';
    Class_StoredProc.StoredProcName:='MAT_INV_CHANGE_KART';
    Class_StoredProc.Prepare;

    Class_StoredProc.ParamByName('GRP_ID').AsInt64              := GRP_ID;
    Class_StoredProc.ParamByName('D_ID').AsInt64                := id;
    Class_StoredProc.ParamByName('ID_MO').AsInt64               := MOL;
    Class_StoredProc.ParamByName('ID_NOMN').AsInt64             := nomn;
    Class_StoredProc.ParamByName('ID_SCH').AsInt64              := sch;
    Class_StoredProc.ParamByName('TIP_KRT').AsString            := tip_kart;
    Class_StoredProc.ParamByName('GRP_NUM').AsString            := grp_num;
    Class_StoredProc.ParamByName('INV_NUM').AsString            := inv_num;
    Class_StoredProc.ParamByName('ZAV_NUM').AsString            := zav_num;
    Class_StoredProc.ParamByName('PAS_NUM').AsString            := pas_num;
    Class_StoredProc.ParamByName('KART_NUM').AsInt64            := kart_num;
    Class_StoredProc.ParamByName('BEG_PRICE').AsString          := beg_price;
    Class_StoredProc.ParamByName('BEG_IZNOS').AsString          := beg_iznos;
    Class_StoredProc.ParamByName('OST_PRICE').AsString          := ost_price;
    Class_StoredProc.ParamByName('OST_IZNOS').AsString          := ost_iznos;
    Class_StoredProc.ParamByName('DATE_OST').AsString           := date_ost;
    Class_StoredProc.ParamByName('DATE_OPR').AsString           := date_opr;
    Class_StoredProc.ParamByName('ID_OPER_OPR').AsInt64         := id_oper_opr;
    Class_StoredProc.ParamByName('DATE_EXPL').AsString          := date_expl;
    Class_StoredProc.ParamByName('ID_OPER_EXPL').AsInt64        := id_oper_expl;
    Class_StoredProc.ParamByName('DATE_UPDATE').AsString        := date_update;
    Class_StoredProc.ParamByName('ID_OPER_UPDATE').AsInt64      := id_oper_update;
    Class_StoredProc.ParamByName('DATE_OUT').AsString           := date_out;
    Class_StoredProc.ParamByName('ID_OPER_OUT').AsInt64         := id_oper_out;
    Class_StoredProc.ParamByName('DATE_CREATE').AsString        := date_create;
    Class_StoredProc.ParamByName('ID_CUSTOMER').AsInt64         := id_cust;
    Class_StoredProc.ParamByName('DOC_REG').AsString            := doc_reg;
    Class_StoredProc.ParamByName('DATE_REG').AsString           := date_reg;
    Class_StoredProc.ParamByName('NOTE').AsString               := note;
    Class_StoredProc.ParamByName('MODEL').AsString              := model;
    Class_StoredProc.ParamByName('MARKA').AsString              := marka;
    Class_StoredProc.ParamByName('BUH_ID_AM_GRP').AsInt64       := buh_id_grp;
    Class_StoredProc.ParamByName('BUH_ID_AM_METOD').AsInt64     := buh_id_metod;
    Class_StoredProc.ParamByName('NAL_ID_AM_GRP').AsInt64       := nal_id_grp;
    Class_StoredProc.ParamByName('NAL_ID_AM_METOD').AsInt64     := nal_id_metod;
    Class_StoredProc.ParamByName('BUH_PERCENT').AsString        := buh_percent;
    Class_StoredProc.ParamByName('BUH_MIN_PRICE').AsString      := buh_min_price;
    Class_StoredProc.ParamByName('BUH_YEAR_IZN').Asinteger      := buh_Year;
    Class_StoredProc.ParamByName('BUH_MONTH_IZN').Asinteger     := buh_month;
    Class_StoredProc.ParamByName('BUH_DB_SCH').Asint64          := buh_db_sch;
    Class_StoredProc.ParamByName('BUH_KR_SCH').Asint64          := buh_kr_sch;
    Class_StoredProc.ParamByName('NA_CHECK').Asint64            := is_check;
    Class_StoredProc.ParamByName('NAL_PERCENT').AsString        := nal_percent;
    Class_StoredProc.ParamByName('NAL_MIN_PRICE').AsString      := nal_min_price;
    Class_StoredProc.ParamByName('NAL_YEAR_IZN').Asinteger      := nal_Year;
    Class_StoredProc.ParamByName('NAL_MONTH_IZN').Asinteger     := nal_month;
    Class_StoredProc.ParamByName('NAL_DB_SCH').Asint64          := nal_db_sch;
    Class_StoredProc.ParamByName('NAL_KR_SCH').Asint64          := nal_kr_sch;
    Class_StoredProc.ParamByName('FULL_INV').AsString           := inv_full;
    Class_StoredProc.ParamByName('is_buhg_acc').AsInteger       := is_buhg_acc;
    Class_StoredProc.ParamByName('is_ost').AsInteger            := is_ost;
    Class_StoredProc.ParamByName('ID_OST_IN').Asint64           := id_ost;
    Class_StoredProc.ParamByName('IS_INV_OBJ').AsInteger        := is_inv_obj;
    Class_StoredProc.ParamByName('ID_USER').Asint64             := id_user;
    Class_StoredProc.ParamByName('USER_NAME').AsString          := USER_NAME;
    Class_StoredProc.ParamByName('NAME_FULL').AsString          := name_full;
    Class_StoredProc.ParamByName('BEG_PRICE_NAL').AsString      := bal_price_nal;
    Class_StoredProc.ParamByName('BEG_IZNOS_NAL').AsString      := bal_iznos_nal;
    Class_StoredProc.ParamByName('OST_PRICE_NAL').AsString      := ost_price_nal;
    Class_StoredProc.ParamByName('OST_IZNOS_NAL').AsString      := ost_iznos_nal;
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        exit;
    end end;
    DecimalSeparator := ',';
end;

procedure DeleteKartochku(id : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_DELETE_KART';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64         := ID;
    //Class_StoredProc.ParamByName('UPDATE_CHILD').AsInt64 := chaild;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;

function AddMetall(id, name : int64; kol : Variant):int64;
begin
    Class_DataSet.Database:=Class_Database;
    Class_DataSet.Transaction:=Class_Transaction_Wr;
    Class_DataSet.Transaction.StartTransaction;
    Class_DataSet.Close;
    try
        Class_DataSet.SQLs.SelectSQL.Text := 'select ID_METALL from MAT_INV_ADD_DRAG_METALL('+IntToStr(name)+', '+IntToStr(id)+', '''+kol+''')';
        Class_DataSet.Open;
        Result := Class_DataSet.FieldByName('ID_METALL').AsVariant;
        Class_DataSet.Close;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        Result := 0;
        exit;
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure ChangeMetall(id, name : int64;  kol : Variant);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_CHANGE_DRAG_METALL';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID').AsInt64                := id;
    Class_StoredProc.ParamByName('ID_MET').AsInt64            := name;
    Class_StoredProc.ParamByName('KOL').AsVariant               := kol;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;

procedure DeleteMetall(id : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_DELETE_DRAG_MET';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64         := ID;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;

function AddNorma(NAME_NORMA : string; PERCENTI : Variant; PERIOD, ID_METHOD, TIP :int64; FORMULA : string; SR_YEAR, SR_MONTH : integer):int64;
begin
    Class_DataSet.Database:=Class_Database;
    Class_DataSet.Transaction:=Class_Transaction_Wr;
    Class_DataSet.Transaction.StartTransaction;
    Class_DataSet.Close;
    try
        Class_DataSet.SQLs.SelectSQL.Text := 'select ID_NORMA from MAT_INV_ADD_NORMA('''+NAME_NORMA+''', '''+PERCENTI+''', '+IntToStr(PERIOD)+','+IntToStr(ID_METHOD)+', '+IntToStr(TIP)+', '''+FORMULA+''', '+IntToStr(SR_YEAR)+', '+IntToStr(SR_MONTH)+')';
        Class_DataSet.Open;
        Result := Class_DataSet.FieldByName('ID_NORMA').AsVariant;
        Class_DataSet.Close;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        Result := 0;
        exit;
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure ChangeNorma(id :int64; NAME_NORMA : string; PERCENTI : Variant; PERIOD, ID_METHOD, TIP :int64; FORMULA : string; SR_YEAR, SR_MONTH : integer);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_CHANGE_NORMA';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID').AsInt64                := id;
    Class_StoredProc.ParamByName('NAME_NORMA').AsString       := NAME_NORMA;
    Class_StoredProc.ParamByName('PERCENTI').AsVariant        := PERCENTI;
    Class_StoredProc.ParamByName('PERIOD').AsInteger          := PERIOD;
    Class_StoredProc.ParamByName('ID_METHOD').AsInt64         := ID_METHOD;
    Class_StoredProc.ParamByName('TIP').AsInteger             := TIP;
    Class_StoredProc.ParamByName('FORMULA').AsString          := FORMULA;
    Class_StoredProc.ParamByName('SR_YEAR').AsInteger         := SR_YEAR;
    Class_StoredProc.ParamByName('SR_MONTH').AsInteger        := SR_MONTH;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;

procedure DeleteNorma(id : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_DELETE_NORMA';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64         := ID;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;

function AddObject(id_inv_krt, id_obj_from_nomn, id_nomn_from_inv_krt : int64; material, siyzi : string; coef, kol_mat, summ : Variant; note_obj : string): int64;
begin
    Class_DataSet.Database:=Class_Database;
    Class_DataSet.Transaction:=Class_Transaction_Wr;
    Class_DataSet.Transaction.StartTransaction;
    Class_DataSet.Close;
    try
        Class_DataSet.SQLs.SelectSQL.Text := 'select ID_OBJ from MAT_INV_ADD_NEW_OBJ('+IntToStr(id_inv_krt)+', '+IntToStr(id_obj_from_nomn)+', '+IntToStr(id_nomn_from_inv_krt)+', '''+material+''', '''+siyzi+''', '''+coef+''', '''+kol_mat+''', '''+summ+''', '''+note_obj+''')';
        Class_DataSet.Open;
        Result := Class_DataSet.FieldByName('ID_OBJ').AsVariant;
        Class_DataSet.Close;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        Result := 0;
        exit;
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure ChangeObject (id_obj, id_inv_krt, id_obj_from_nomn, id_nomn_from_inv_krt : int64; material, siyzi : string; coef, kol_mat, summ : Variant; note_obj : string);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_CHANGE_OBJECT';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_OBJ').AsInt64                 := id_obj;
    Class_StoredProc.ParamByName('ID_INV_KRT').AsInt64             := id_inv_krt;
    Class_StoredProc.ParamByName('ID_OBJ_FROM_NOMN').AsInt64       := id_obj_from_nomn;
    Class_StoredProc.ParamByName('ID_NOMN_FROM_INV_KRT').AsInt64   := id_nomn_from_inv_krt;
    Class_StoredProc.ParamByName('MATERIAL').AsString              := material;
    Class_StoredProc.ParamByName('SIYZI').AsString                 := siyzi;
    Class_StoredProc.ParamByName('COEF').AsString                  := coef;
    Class_StoredProc.ParamByName('KOL_MAT').AsString               := kol_mat;
    Class_StoredProc.ParamByName('SUMM').AsString                  := summ;
    Class_StoredProc.ParamByName('NOTE_OBJ').AsString              := note_obj;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;



procedure DeleteObject(id : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_DELETE_FROM_OBJ';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_OBJ').AsInt64         := ID;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;

//Class_DataSet

function Provodki(tip_oper : integer; num_doc, date_doc, date_rec : string; id_mo_old, id_mo_new, id_sch_old, id_sch_new : int64; ost_price_old, ost_price_new, ost_iznos_old, ost_iznos_new, iznos, summa : Variant; pub_id_doc, id_inv_kart,  id_user : int64; computer_name : string): int64;
begin
    Class_DataSet.Database:=Class_Database;
    Class_DataSet.Transaction:=Class_Transaction_Wr;
    Class_DataSet.Transaction.StartTransaction;
    Class_DataSet.Close;
    try
        Class_DataSet.SQLs.SelectSQL.Text := 'select ID_OPER FROM MAT_INV_ADD_OPERACIYU('+IntToStr(tip_oper)+', '''+num_doc+''', '''+date_doc+''', '''+date_rec+''', '+IntToStr(id_mo_old)+', '+IntToStr(id_mo_new)+', '+IntToStr(id_sch_old)+', '+IntToStr(id_sch_new)+', '''+ost_price_old+''', '''+ost_price_new+''', '''+ost_iznos_old+''', '''+ost_iznos_new+''', '''+iznos+''', '''+summa+''', '+IntToStr(pub_id_doc)+', '+IntToStr(id_inv_kart)+', '+IntToStr(id_user)+', '''+computer_name+''', 1)';
        Class_DataSet.Open;
        Result := Class_DataSet.FieldByName('ID_OPER').AsVariant;
        id_oper:= Class_DataSet.FieldByName('ID_OPER').AsVariant;
        Class_DataSet.Close;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        Result := 0;
        exit;
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Save_pereocenku(id_user : int64; user_name, computer, Date_doc,  Date_rec : string; ID_SESSION_PER, PUB_ID_DOC : int64; TIP_OPER : Integer; ID_KARTI : int64; UNDELOPER: integer; NOTE:string);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_SAVE_FOR_PEREOCENKA';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_USER').AsInt64       := id_user;
    Class_StoredProc.ParamByName('USER_NAME').AsString    := user_name;
    Class_StoredProc.ParamByName('COMPUTER').AsString     := computer;
    Class_StoredProc.ParamByName('DATE_DOG').AsString     := Date_doc;
    Class_StoredProc.ParamByName('DATE_REC').AsString     := Date_rec;
    Class_StoredProc.ParamByName('ID_SESSION').AsString   := IntToStr(ID_SESSION_PER);
    Class_StoredProc.ParamByName('PUB_ID_DOC').AsInt64    := PUB_ID_DOC;
    Class_StoredProc.ParamByName('TIP_OPER').AsInteger    := TIP_OPER;
    Class_StoredProc.ParamByName('ID_KARTKA').AsInt64     := ID_KARTI;
    Class_StoredProc.ParamByName('ID_PEREOC_VED').AsInt64 := ID_PEREOC_VED;
    Class_StoredProc.ParamByName('UNDELOPER').AsInteger   := UNDELOPER;
    Class_StoredProc.ParamByName('NOTE').AsString         := NOTE;
    try
        Class_StoredProc.ExecProc;
        //id_oper_pereoc := Class_StoredProc.FieldByName('ID_OPER').AsInt64;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        exit;
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Save_mass_pereocenku(id_mo_input, id_user : int64; user_name, computer, Date_doc,  Date_rec : string; ID_SESSION_PER, PUB_ID_DOC : int64; TIP_OPER : Integer; UNDELOPER: integer);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_SAVE_MASS_PEREOCENKA';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_MO_INPUT').AsInt64   := id_mo_input;
    Class_StoredProc.ParamByName('ID_USER').AsInt64       := id_user;
    Class_StoredProc.ParamByName('USER_NAME').AsString    := user_name;
    Class_StoredProc.ParamByName('COMPUTER').AsString     := computer;
    Class_StoredProc.ParamByName('DATE_DOG').AsString     := Date_doc;
    Class_StoredProc.ParamByName('DATE_REC').AsString     := Date_rec;
    Class_StoredProc.ParamByName('ID_SESSION').AsString   := IntToStr(ID_SESSION_PER);
    Class_StoredProc.ParamByName('PUB_ID_DOC').AsInt64    := PUB_ID_DOC;
    Class_StoredProc.ParamByName('TIP_OPER').AsInteger    := TIP_OPER;
    Class_StoredProc.ParamByName('ID_PEREOC_VED').AsInt64 := ID_PEREOC_VED;
    Class_StoredProc.ParamByName('UNDELOPER').AsInteger   := UNDELOPER;
    try
        Class_StoredProc.ExecProc;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        exit;
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Insert_into_MATAS(Doc_num, Date_doc : string; id_mo_old : int64; Summa_old : string; id_user : int64; user_name, computer_name : string; id_nomn : int64; beg_price, Summa_oper : string; id_sch_old, id_ost_in, id_kart : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_ADD_TO_MAT_DT_DOC';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('NUM_DOC').AsString    := Doc_num;
    Class_StoredProc.ParamByName('DATE_DOC').AsString   := Date_doc;
    Class_StoredProc.ParamByName('ID_MO').AsInt64       := id_mo_old;
    Class_StoredProc.ParamByName('SUMMA').AsString      := Summa_old;
    Class_StoredProc.ParamByName('ID_USER').AsInt64     := id_user;
    Class_StoredProc.ParamByName('USER_NAME').AsString  := user_name;
    Class_StoredProc.ParamByName('COMPUTER').AsString   := computer_name;
    Class_StoredProc.ParamByName('ID_NOMN').AsInt64     := id_nomn;
    Class_StoredProc.ParamByName('BEG_PRICE').AsString  := beg_price;
    Class_StoredProc.ParamByName('SUMMA_OPER').AsString := Summa_oper;
    Class_StoredProc.ParamByName('ID_SCH').AsInt64      := id_sch_old;
    Class_StoredProc.ParamByName('ID_OST_IN').AsInt64   := id_ost_in;
    Class_StoredProc.ParamByName('ID_INV_KART').AsInt64 := id_kart;
    Class_StoredProc.ParamByName('ID_INV_OPER').AsInt64 := id_oper;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        exit;
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Update_oprih(id_kart, id_oper_opr : int64; date_oprih : string);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_UPDATE_OPER_OPR';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64                := id_kart;
    Class_StoredProc.ParamByName('ID_OPER_OPR').AsInt64            := id_oper;
    Class_StoredProc.ParamByName('DATA_OPR').AsString              := date_oprih;
    id_oper:=0;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        exit;
    end end;
    Class_Transaction_Wr.Commit;
end;


procedure Update_peremesh(id_kart, id_mo, id_sch : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_UPDATE_OPER_PEREM';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64          := id_kart;
    Class_StoredProc.ParamByName('ID_MO').AsInt64            := id_mo;
    Class_StoredProc.ParamByName('ID_SCH').AsInt64           := id_sch;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Update_expl(id_kart, id_oper_expl : int64; date_expl : string; id_mo : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_UPDATE_OPER_EXPL';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64                := id_kart;
    Class_StoredProc.ParamByName('ID_OPER_EXPL').AsInt64           := id_oper;
    Class_StoredProc.ParamByName('DATA_EXPL').AsString             := date_expl;
    Class_StoredProc.ParamByName('ID_MO').AsInt64                  := id_mo;
    id_oper:=0;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Update_out(id_kart : int64; date_out : string);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_UPDATE_OPER_OUT';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64               := id_kart;
    Class_StoredProc.ParamByName('ID_OPER_OUT').AsInt64           := id_oper;
    Class_StoredProc.ParamByName('DATA_OUT').AsString             := date_out;
    id_oper:=0;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;


procedure Update_modern(id_kart, id_oper_update : int64; date_update : string; ost_price : Variant);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_OPER_MODER';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64                := id_kart;
    Class_StoredProc.ParamByName('ID_OPER_UPDATE').AsInt64         := id_oper;
    Class_StoredProc.ParamByName('DATA_UPDATE').AsString           := date_update;
    Class_StoredProc.ParamByName('OST_PR').AsString                := ost_price;
    id_oper:=0;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        exit;
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Update_modern_cansel(id_kart, id_oper_update : int64; date_update : string; ost_price, ost_iznos : Variant);
begin
    id_oper:=0;
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_OPER_MODER_CANCEL';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64                := id_kart;
    Class_StoredProc.ParamByName('ID_OPER_UPDATE').AsInt64         := id_oper;
    Class_StoredProc.ParamByName('DATA_UPDATE').AsString           := date_update;
    Class_StoredProc.ParamByName('OST_PR').AsString                := ost_price;
    Class_StoredProc.ParamByName('OST_IZ').AsString                := ost_iznos;
    id_oper:=0;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        exit;
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Update_out_modern(id_kart, id_oper_update : int64; date_update : string; ost_price : Variant);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_OPER_MODER';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64                := id_kart;
    Class_StoredProc.ParamByName('ID_OPER_UPDATE').AsInt64         := 0;
    Class_StoredProc.ParamByName('DATA_UPDATE').AsString           := date_update;
    Class_StoredProc.ParamByName('OST_PR').AsString                := ost_price;
    id_oper:=0;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        exit;
    end end;
    Class_Transaction_Wr.Commit;
end;


procedure Create_Full_Inv_num(id_kart : int64; inv_num : integer);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_CREATE_FULL_INV';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64               := id_kart;
    Class_StoredProc.ParamByName('INV_NUM').AsInteger             := inv_num;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure UnOper_peremeshenie(id_kartochki, ID_OPER : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_UNOPER_PEREM';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64    := id_kartochki;
    Class_StoredProc.ParamByName('ID_OPER').AsInt64    :=  ID_OPER;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure UnOper_expl(id_kartochki, ID_OPER : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_UNOPER_EXPL';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64    := id_kartochki;
    Class_StoredProc.ParamByName('ID_OPER').AsInt64    :=  ID_OPER;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;


procedure Un_all_Operacii(id_kartochki, id_operacii : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_OTKAT_OPER_OPR';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64        := id_kartochki;
    Class_StoredProc.ParamByName('ID_OPER_OPR').AsInt64    := id_operacii;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Pereocenka(id_karti : int64; iznosik, priycik : string);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_OPER_PEREOCENKI';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64         := id_karti;
    Class_StoredProc.ParamByName('new_ost_izn').AsString    := iznosik;
    Class_StoredProc.ParamByName('new_ost_pr').AsString     := priycik;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Un_Pereocenka(id_karti, id_operka : int64; tip_op : integer);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_OPER_UN_PEREOCENKI';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_KART').AsInt64         := id_karti;
    Class_StoredProc.ParamByName('tipa_oper').AsInteger     := tip_op;
    Class_StoredProc.ParamByName('ID_OPER').AsInt64         := id_operka;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

function For_main_ved(date_rec, koeff, tip : String) : Int64;
begin
    Class_DataSet.Transaction := Class_Transaction_Wr;
    Class_DataSet.Transaction.StartTransaction;
    Class_DataSet.Close;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_DataSet.Close;
    Class_DataSet.Sqls.SelectSQL.Text := 'select * from PUB_GET_ID_BY_GEN(''' + 'MAT_INV_GEN_ID_FOR_VED' + ''', '+IntToStr(1)+')';
    Class_DataSet.Open;
    Result   := StrToInt64(Class_DataSet.FieldByName('RET_VALUE').asString);
    id_vedom := StrToInt64(Class_DataSet.FieldByName('RET_VALUE').asString);
    Class_DataSet.Close;


    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_INSERT_INTO_VED_MAIN';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_VEDOMOST').AsInt64   := id_vedom;
    Class_StoredProc.ParamByName('DATE_REC').AsString     := date_rec;
    Class_StoredProc.ParamByName('KOEFF').AsString        := koeff;
    Class_StoredProc.ParamByName('TIP').AsString          := tip;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Info_for_ved(id_ved : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_INSERT_INTO_VED';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('id_vedomost').AsInt64   := ID_PEREOC_VED;//id_vedom;
    Class_StoredProc.ParamByName('id_oper').AsInt64       := id_oper_pereoc;
    try
        Class_StoredProc.ExecProc;

    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
    //id_vedom := 0;
    id_oper_pereoc := 0;
end;

procedure Delete_ved(id_ved : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_DELETE_FROM_VED';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('id_vedomost').AsInt64   := id_vedom;
    try
        Class_StoredProc.ExecProc;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
    //id_vedom := 0;
end;

procedure Otmena_amort(id_ved : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_AMORT_DEL';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_AMORT_VED').AsInt64   := id_ved;
    try
        Class_StoredProc.ExecProc;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Save_amort_setings(id_ved : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_AMORT_SAVE';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_AMORT_VED').AsInt64   := id_ved;
    try
        Class_StoredProc.ExecProc;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Save_to_ved(id_ved : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_UPDATE_AMORT_VED';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_AMORT_VED').AsInt64   := id_ved;
    Class_StoredProc.ParamByName('Date_rec').AsDate        := Date;
    try
        Class_StoredProc.ExecProc;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Save_amort_calc(id_ved : int64; id_session:Integer);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_ADD_AMORT_CALC';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('ID_AMORT_VED').AsInt64   := id_ved;
    Class_StoredProc.ParamByName('ID_SESSION').AsInteger   := id_session;
    try
        Class_StoredProc.ExecProc;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure LoadReportsTocxComboBoxMy(aOBJECT: string; aComboBox: TcxComboBox; var aReports: Variant);
var
 rID, rKOD, rNAME, rTEMPLATE: string;
 i: integer;
begin
 Class_DataSet.Close;
 Class_DataSet.SQLs.SelectSQL.Clear;
 Class_DataSet.SQLs.SelectSQL.Text :='SELECT * FROM MAT_INI_REPORTS WHERE OBJECT=:OBJECT ORDER BY ID_REPORTS';
 Class_DataSet.ParamByName('OBJECT').Value:=aOBJECT;
 Class_DataSet.Open;
 Class_DataSet.FetchAll;
 aReports := VarArrayCreate([0, Class_DataSet.RecordCount-1], varVariant);
 aComboBox.Properties.Items.Clear;
 i:=0;
 while not Class_DataSet.Eof do
 begin
  aComboBox.Properties.Items.Add(Class_DataSet.FieldByName('NAME').AsString);
  rID:=Class_DataSet.FieldByName('ID_REPORTS').AsString;
  rKOD:=Class_DataSet.FieldByName('KOD').AsString;
  rNAME:=Class_DataSet.FieldByName('NAME').AsString;
  rTEMPLATE:=Class_DataSet.FieldByName('TEMPLATE').AsString;
  aReports[i]:=VarArrayOf([rID, rKOD, rNAME, rTEMPLATE]);
  Class_DataSet.Next;
  Inc(i);
 end;
end;

procedure Work_with_sch_and_grp(GRP_FLAG, GRP_ID : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_ADD_TO_TMP';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('GRP_ID').AsInt64     := GRP_ID;
    Class_StoredProc.ParamByName('GRP_FLAG').AsInt64   := GRP_FLAG;
    try
        Class_StoredProc.ExecProc;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Work_with_sch_and_grp_one(GRP_FLAG, GRP_ID : int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_ADD_TO_TMP_ONE';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('GRP_ID').AsInt64     := GRP_ID;
    Class_StoredProc.ParamByName('GRP_FLAG').AsInt64   := GRP_FLAG;
    try
        Class_StoredProc.ExecProc;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Delete_from_tmp_print;
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_DROP_FROM_TMP_PRINT';
    Class_StoredProc.Prepare;
    try
        Class_StoredProc.ExecProc;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Delete_prov_from_doc_mass(PUB_ID_DOC: int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_DEL_FROM_DOC_1';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('PUB_ID_DOC').AsInt64  := PUB_ID_DOC;
    try
        Class_StoredProc.ExecProc;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Delete_prov_from_doc(PUB_ID_DOC: int64; T_OPER : integer);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_DEL_FROM_DOC';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('PUB_ID_DOC').AsInt64  := PUB_ID_DOC;
    Class_StoredProc.ParamByName('TIP_OPER').AsInteger  := T_OPER;
    try
        Class_StoredProc.ExecProc;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure Delete_prov_from_doc_minus(PUB_ID_DOC: int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_DEL_FROM_DOC_MINUS';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('PUB_ID_DOC').AsInt64  := PUB_ID_DOC;
    try
        Class_StoredProc.ExecProc;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

procedure ADD_TO_VED_ABOUT_PEREOC(TIP, DATE_PEREOC, COEFF :string);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='MAT_INV_ADD_PEREOC_VED';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('TIP').AsString          := TIP;
    Class_StoredProc.ParamByName('DATE_PEREOC').AsString  := DATE_PEREOC;
    Class_StoredProc.ParamByName('COEFF').AsString        := COEFF;
    try
        Class_StoredProc.ExecProc;
        ID_PEREOC_VED := Class_StoredProc.FieldByName('ID_PEREOC_VED').AsInt64;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
    Class_Transaction_Wr.Commit;
end;

initialization
    Class_Transaction_R  := TpFIBTransaction.Create(nil);
    Class_Transaction_Wr := TpFIBTransaction.Create(nil);
    Class_StoredProc     := TpFIBStoredProc.Create(nil);
    Class_DataSet        := TpFIBDataSet.Create(nil);
finalization
    Class_DataSet.Free;
    Class_StoredProc.Free;
    Class_Transaction_Wr.Free;
    Class_Transaction_R.Free;

end.

