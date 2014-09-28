unit BankDocClass;

interface

uses Classes, pFIBDatabase, pFIBStoredProc, pFIBDataSet, Controls, Un_lo_file_Alex;

Type
  TMainDocClass = class(TComponent)
    Class_Database:        TpFIBDatabase;
    Class_Transaction_R:   TpFIBTransaction;
    Class_Transaction_Wr:  TpFIBTransaction;
    Class_StoredProc:      TpFIBStoredProc;
    Class_DataSet:         TpFIBDataSet;
  private
    Owner : TComponent;
  public
    id_user : int64;
    id_ras_sch_pris : int64;
    id_osn_sch : int64;
    name_osn_sch, title_osn_sch, mfo, bank, name_ras_sch, bank_day : string;
    id_day_pris : int64;
    id_doc_pris : int64;
    block_deb, block_kred,  block_sal : integer;
    IS_VALUTA : Integer;
    id_valuta : Integer;
    name_valuta : string;
    constructor Create(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day : int64); reintroduce; overload;
    destructor Destroy; override;
    function ShowForm(SpEdit : Boolean):VAriant;

    function AddDOC(id_day, id_all_doc, id_man, id_operation : int64; fio, osnovanie : string; summa : double; prihod_rashod, number, add_number : integer):int64;
    function AddAllDOC(id_day, id_all_doc, id_man, id_operation : int64; fio, osnovanie : string; summa : double; prihod_rashod, number, add_number : integer):int64;
    function DeleteDoc(id_doc, all_doc : int64; SUM : DOUBLE; date_pr : TDate; prih : integer; id_key, id_komis : int64; is_add_cl_bank : integer) : INTEGER;
//    procedure DeleteDay(id, id_kassa: int64);
//    procedure ChangeDay(id_kass, id_day : int64; blok_deb, blok_kred, close_day, blok_saldo : smallint);
  end;


function BankDocShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64; param : td):Integer;stdcall;
function BankDocEdit(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64; param : td):Integer;stdcall;
//function KassaDayShowEdit(AOwner : TComponent; id_us : int64; DB : PVoid; id_kass, id_day : int64;):Variant;stdcall;

exports BankDocShow, BankDocEdit;

implementation

uses Dialogs, SysUtils, Forms, Variants, BankDocMainForm, Kernel, Un_Progress_form, Un_R_file_Alex, GlobalSpr;

function BankDocShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64; param : td):Integer;
var
    T : TMainDocClass;
begin
    T := TMainDocClass.Create(AOwner, id_us, DB, id_kass, id_day);
    T.id_doc_pris   := id_doc;
    T.id_day_pris   := id_day;
    T.id_osn_sch    := param.id_kor_sch;
    T.name_osn_sch  := param.kod_kor_sch;
    T.mfo           := param.mfo;
    T.title_osn_sch := param.title_kor_sch;
    T.id_ras_sch_pris := id_kass;
    T.bank            := param.bank;
    T.name_ras_sch    := param.id_rate_acc;
    T.bank_day        := VarTostr(param.kod_dog);
    T.ShowForm(false);
    Result := -1;
end;

function BankDocEdit(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64; param : td):Integer;
var
    T : TMainDocClass;
begin
    T := TMainDocClass.Create(AOwner, id_us, DB, id_kass, id_day);
    T.id_doc_pris   := id_doc;
    T.id_day_pris   := id_day;
    T.id_osn_sch    := param.id_kor_sch;
    T.name_osn_sch  := param.kod_kor_sch;
    T.mfo           := param.mfo;
    T.title_osn_sch := param.title_kor_sch;
    T.id_ras_sch_pris := id_kass;
    T.bank            := param.bank;
    T.name_ras_sch    := param.id_rate_acc;
    T.bank_day        := VarTostr(param.kod_dog);
    T.block_deb       := param.block_debet;
    T.block_kred      := param.block_kredit;
    T.block_sal       := param.block_saldo;
    t.id_valuta       := param.id_valuta;
    t.is_valuta       := param.is_valuta;
    t.name_valuta     := param.name_valuta;
    T.ShowForm(true);
    Result := -1;
end;



{ TMainDocClass }

constructor TMainDocClass.Create(AOwner: TComponent; id_us: int64;
  DB: TpFIBDatabase; id_kass, id_day: int64);
begin
    inherited Create(AOwner);
    Owner := AOwner;
    id_ras_sch_pris    := id_kass;
    id_day_pris := id_day;
    Class_Database                        := TpFIBDatabase.Create(nil{AOwner});
    Class_Database                        := DB;
    Class_Transaction_R                   := TpFIBTransaction.Create(nil{Aowner});
    Class_Transaction_Wr                  := TpFIBTransaction.Create(nil{Aowner});
    Class_StoredProc                      := TpFIBStoredProc.Create(nil{Aowner});
    Class_DataSet                         := TpFIBDataSet.Create(nil{Aowner});

    Class_Transaction_R.DefaultDatabase   := Class_Database;
    Class_Transaction_Wr.DefaultDatabase  := Class_Database;
    Class_Database.DefaultTransaction     := Class_Transaction_R;
    Class_StoredProc.Database             := Class_Database;
    Class_DataSet.Database                := Class_Database;

    id_user := id_us;
end;

function TMainDocClass.AddDOC(id_day, id_all_doc, id_man, id_operation : int64; fio, osnovanie : string; summa : double; prihod_rashod, number, add_number : integer):int64;
begin
    Class_DataSet.Transaction.StartTransaction;
    Class_StoredProc.Database    := Class_Database;
    Class_StoredProc.Transaction := Class_Transaction_Wr;

    Class_Transaction_Wr.StartTransaction;

    Class_DataSet.Close;
    try
        DecimalSeparator := '.';
        Class_DataSet.SQLs.SelectSQL.Text:='select R_ID from KASSA_DOC_INSERT('+IntToStr(id_day)+', '+IntToStr(prihod_rashod)+', '+IntToStr(number)+', '+IntToStr(add_number)+', '''+fio+''', '''+osnovanie+''', '+IntToStr(id_operation)+', '+floatToStr(summa) + ', '+Inttostr(id_all_doc)+', '+ IntTostr(id_man) + ', '+intToStr(id_user)+')';
        Class_DataSet.Open;
        Result := Class_DataSet.FieldByName('R_ID').AsVariant;
        Class_DataSet.Close;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        Result := 0;
    end end;
    DecimalSeparator := ',';
end;

destructor TMainDocClass.Destroy;
begin

  inherited;
end;

function TMainDocClass.ShowForm(SpEdit: Boolean): VAriant;
var
    T : TfmBankDocMainForm;
begin
    if SpEdit=true then
    begin
        T := TfmBankDocMainForm.Create(Owner, Self, Edit,IS_VALUTA,id_valuta,name_valuta);
        T.FormStyle := fsNormal;
        T.ShowModal;
        T.Free;
    end
    else
    begin
        T := TfmBankDocMainForm.Create(Owner, Self, Show,IS_VALUTA,id_valuta,name_valuta);
        T.FormStyle := fsMDIChild;
     //   ShowForm:=T.ResValue;
    end;
end;

function TMainDocClass.AddAllDOC(id_day, id_all_doc, id_man,
  id_operation: int64; fio, osnovanie: string; summa: double;
  prihod_rashod, number, add_number: integer): int64;
begin
    Class_DataSet.Transaction.StartTransaction;
    Class_StoredProc.Database    := Class_Database;
    Class_StoredProc.Transaction := Class_Transaction_Wr;

    Class_Transaction_Wr.StartTransaction;

    Class_DataSet.Close;
    try
        DecimalSeparator := '.';
        Class_DataSet.SQLs.SelectSQL.Text:='select R_ID from KASSA_ALL_DOC_INSERT('+IntToStr(id_day)+', '+IntToStr(prihod_rashod)+', '+IntToStr(number)+', '+IntToStr(add_number)+', '''+fio+''', '''+osnovanie+''', '+IntToStr(id_operation)+', '+floatToStr(summa) + ', '+Inttostr(id_all_doc)+', '+ IntTostr(id_man) + ', '+intToStr(id_user)+')';
        Class_DataSet.Open;
        Result := Class_DataSet.FieldByName('R_ID').AsVariant;
        Class_DataSet.Close;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        Result := 0;
    end end;
    DecimalSeparator := ',';

end;

FUNCTION TMainDocClass.DeleteDoc(id_doc, all_doc : int64; SUM : DOUBLE; date_pr : TDate; prih : integer; id_key, id_komis : int64; is_add_cl_bank : integer) : INTEGER;
   var STRU:KERNEL_MODE_STRUCTURE;
       ErrorList:TStringList;
       DoResult : boolean;
       i : integer;
       mes : string;
       T : TfmUn_Progress_form;
begin 
    Class_StoredProc.Database    := Class_Database;
    Class_StoredProc.Transaction := Class_Transaction_Wr;

    Class_DataSet.Database       := Class_Database;
    Class_DataSet.Transaction    := Class_Transaction_Wr;

    Class_Transaction_Wr.StartTransaction;
    try
            T := TfmUn_Progress_form.Create(nil, wait_, Un_R_file_Alex.WAIT_DELETE_DATA);
            T.Show;
            T.UpDate;
            // изменение BANK_DT_DAY
{            Class_StoredProc.StoredProcName:='BANK_DELETE_INTO_DAY_SUMMU_COL';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('D_ID_DT_DAY').AsInt64 := id_day_pris;
            Class_StoredProc.ParamByName('D_ID_RAS').AsInt64    := id_ras_sch_pris;
            Class_StoredProc.ParamByName('D_PRIHOD').AsInteger  := prih;
            Class_StoredProc.ParamByName('D_DAY').AsDate        := date_pr;
            Class_StoredProc.ParamByName('D_SUMMA').AsString    := StringReplace(FloatToStr(Sum),',','.',[]);
            Class_StoredProc.ExecProc;
}
{            Class_DataSet.Close;
            Class_DataSet.SQLs.SelectSQL.Text:='select * from CLBANK_BUFF where ID_DOC='+inttostr(id_doc)+'';
            Class_DataSet.Open;
 }

            // изменение BANK_DT_DAY
           { Class_StoredProc.StoredProcName:='BANK_DELETE_INTO_DAY_SUMMU_COL';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('D_ID_DT_DAY').AsInt64 := id_day_pris;
            Class_StoredProc.ParamByName('D_ID_RAS').AsInt64    := id_ras_sch_pris;
            Class_StoredProc.ParamByName('D_PRIHOD').AsInteger  := prih;
            Class_StoredProc.ParamByName('D_DAY').AsDate        := date_pr;
            Class_StoredProc.ParamByName('D_SUMMA').AsString    := StringReplace(FloatToStr(Sum),',','.',[]);
            Class_StoredProc.ExecProc;}

            Class_StoredProc.StoredProcName:='BANK_DELETE_DOC';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('D_ID_DOC').AsInt64    := id_doc;
            Class_StoredProc.ExecProc;

            Class_StoredProc.StoredProcName:='BANK_DELETE_PL';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('ID_KEY').AsInt64    := id_key;
            Class_StoredProc.ParamByName('ID_ALL').AsInt64    := all_doc;
            Class_StoredProc.ExecProc;

            Class_StoredProc.StoredProcName     :='BANK_DELETE_DOC_GAL';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('D_ID_DOC').AsInt64    := id_doc;
            Class_StoredProc.ExecProc;  


            Class_StoredProc.StoredProcName := 'J4_DT_D_H_INSERT';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('PK_ID').AsInt64              := all_doc;
            Class_StoredProc.ParamByName('DATETIME').AsDateTime        := Date;
            Class_StoredProc.ParamByName('DATE_REG').AsDateTime        := Date;
            Class_StoredProc.ParamByName('DATE_PROV').AsDateTime       := date_pr;
            Class_StoredProc.ParamByName('DATE_DOC').AsDateTime        := Date;
            Class_StoredProc.ParamByName('ID_TYPE_DOC').AsInt64        := 2;
            Class_StoredProc.ParamByName('NUM_DOC').AsString           := '';
            Class_StoredProc.ParamByName('SUMMA').AsCurrency           := 0;
            Class_StoredProc.ParamByName('ID_CUSTOMER').AsInt64        := -1;
            Class_StoredProc.ParamByName('NOTE').AsString              := '';
//                        Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxKomis.FieldByName('RxMemDatsumma_value').Value;
//                        Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxKomis.FieldByName('RxMemDatid_value').Value;
            Class_StoredProc.ParamByName('FIO').AsString               := '';
            Class_StoredProc.ParamByName('ID_RATE_ACC').AsInt64        := -1;
            Class_StoredProc.ParamByName('ID_RATE_ACC_NATIVE').AsInt64 := -1;
            Class_StoredProc.ParamByName('PRIHOD').AsInteger           := 3;
            Class_StoredProc.ParamByName('ID_USER').AsInt64            := id_user;
            Class_StoredProc.ParamByName('ID_SERVER').AsInt64          := -1;
            Class_StoredProc.ParamByName('COMPUTER').AsString          := GetComputerNetName;
            Class_StoredProc.ParamByName('PR').AsInteger               := 3;
            Class_StoredProc.ExecProc;

//            if all_doc > 0 then
            begin
                 STRU.DBHANDLE      := Class_Database.Handle;
                 STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
                 STRU.WORKDATE      := date_pr;
                 STRU.KERNEL_ACTION := 2;
                 STRU.KEY_SESSION   := Class_Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
                 STRU.id_user       := id_user;
                 STRU.PK_ID         := all_doc;
                 DoResult:=Kernel.KernelDo(@STRU);
                 if not DoResult
                 then begin
                       ErrorList:=Kernel.GetDocErrorsList(@STRU);
                       mes := Un_R_file_Alex.MY_MESSAGE_ERROR+#13;
                       if ErrorList<>nil
                           then for i:=0 to  ErrorList.Count-1 do mes :=  mes +' '+ ErrorList.Strings[i]+#13;
                       Class_DataSet.Close;
                       Class_DataSet.SQLs.SelectSQL.Text:='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                       Class_DataSet.Open;
                       Class_DataSet.First;
                       while not Class_DataSet.Eof do
                       begin
                           mes := mes + Class_DataSet.FieldByName('ERROR_MESSAGE').AsString+#13;
                           Class_DataSet.Next;
                       end;
                       T.Free;
                       Class_Transaction_Wr.Rollback;
                       ShowMessage(mes);
                       result := 0;
                       exit;
                 end;
            end;

            if id_komis > 0 then
            begin
                Class_StoredProc.StoredProcName := 'J4_DT_D_H_INSERT';
                Class_StoredProc.Prepare;
                Class_StoredProc.ParamByName('PK_ID').AsInt64              := id_komis;
                Class_StoredProc.ParamByName('DATETIME').AsDateTime        := Date;
                Class_StoredProc.ParamByName('DATE_REG').AsDateTime        := Date;
                Class_StoredProc.ParamByName('DATE_PROV').AsDateTime       := date_pr;
                Class_StoredProc.ParamByName('DATE_DOC').AsDateTime        := Date;
                Class_StoredProc.ParamByName('ID_TYPE_DOC').AsInt64        := 2;
                Class_StoredProc.ParamByName('NUM_DOC').AsString           := '';
                Class_StoredProc.ParamByName('SUMMA').AsCurrency           := 0;
                Class_StoredProc.ParamByName('ID_CUSTOMER').AsInt64        := -1;
                Class_StoredProc.ParamByName('NOTE').AsString              := '';
//                        Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxKomis.FieldByName('RxMemDatsumma_value').Value;
//                        Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxKomis.FieldByName('RxMemDatid_value').Value;
                Class_StoredProc.ParamByName('FIO').AsString               := '';
                Class_StoredProc.ParamByName('ID_RATE_ACC').AsInt64        := -1;
                Class_StoredProc.ParamByName('ID_RATE_ACC_NATIVE').AsInt64 := -1;
                Class_StoredProc.ParamByName('PRIHOD').AsInteger           := 3;
                Class_StoredProc.ParamByName('ID_USER').AsInt64            := id_user;
                Class_StoredProc.ParamByName('ID_SERVER').AsInt64          := -1;
                Class_StoredProc.ParamByName('COMPUTER').AsString          := GetComputerNetName;
                Class_StoredProc.ParamByName('PR').AsInteger               := 3;
                Class_StoredProc.ExecProc;

                 STRU.DBHANDLE      := Class_Database.Handle;
                 STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
                 STRU.WORKDATE      := date_pr;
                 STRU.KERNEL_ACTION := 2;
                 STRU.KEY_SESSION   := Class_Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
                 STRU.PK_ID         := id_komis;
                 STRU.id_user       := id_user;
                 DoResult:=Kernel.KernelDo(@STRU);
                 if not DoResult
                 then begin
                       ErrorList:=Kernel.GetDocErrorsList(@STRU);
                       mes := Un_R_file_Alex.MY_MESSAGE_ERROR+#13;
                       if ErrorList<>nil
                           then for i:=0 to  ErrorList.Count-1 do mes :=  mes +' '+ ErrorList.Strings[i]+#13;
                       Class_DataSet.Close;
                       Class_DataSet.SQLs.SelectSQL.Text:='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                       Class_DataSet.Open;
                       Class_DataSet.First;
                       while not Class_DataSet.Eof do
                       begin
                           mes := mes + Class_DataSet.FieldByName('ERROR_MESSAGE').AsString+#13;
                           Class_DataSet.Next;
                       end;
                       Class_Transaction_Wr.Rollback;
                       T.Free;
                       ShowMessage(mes);
                       result := 0;
                       exit;
                 end;
            end;

            if (is_add_cl_bank = 2) then
            begin
                Class_StoredProc.StoredProcName:='BANK_DELETE_BANK';
                Class_StoredProc.Prepare;
                Class_StoredProc.ParamByName('ID_DOC').AsInt64    := id_doc;
                Class_StoredProc.ExecProc;
            end;

        Class_Transaction_Wr.Commit;
        T.Free;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        result := 0;
        T.Free;
        ShowMessage(E.Message);
        exit;
    end end;
    result := 1;
end;

end.
