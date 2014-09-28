unit KassaDocClass;

interface

uses Classes, pFIBDatabase, pFIBStoredProc, pFIBDataSet, FIBDataSet, Controls;

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
    id_kas : int64;
    id_d : int64;
    id_doc_ : int64;
    IS_VALUTA : Integer;
    id_valuta : Integer;
    name_valuta : string;
    constructor Create(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day : int64); reintroduce; overload;
    destructor Destroy; override;
    function ShowForm(SpEdit : Boolean):VAriant;

//    function AddDOC(id_day, id_all_doc, id_man, id_operation : int64; fio, osnovanie : string; summa : double; prihod_rashod, number, add_number : integer):int64;
    function AddDOC(id_day, id_all_doc, id_man, id_operation : int64; fio, osnovanie, s, n_s : string; summa : double; prihod_rashod, number, add_number : integer):int64;
    function AddAllDOC(id_day, id_all_doc, id_man, id_operation : int64; fio, osnovanie : string; summa : double; prihod_rashod, number, add_number : integer):int64;
    procedure DeleteDoc(id_doc, all_doc : int64; dd : TDate);
//    procedure DeleteDay(id, id_kassa: int64);
//    procedure ChangeDay(id_kass, id_day : int64; blok_deb, blok_kred, close_day, blok_saldo : smallint);
  end;


function KassaDocShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64):Integer;stdcall;
function KassaDocEdit(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64):Integer;stdcall;
//function KassaDayShowEdit(AOwner : TComponent; id_us : int64; DB : PVoid; id_kass, id_day : int64;):Variant;stdcall;

exports KassaDocShow, KassaDocEdit;

implementation

uses Dialogs, SysUtils, Forms, Variants, KassaDocMainForm, Kernel, Un_Progress_form, Un_R_file_Alex,
  FIBDatabase;

function KassaDocShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64):Integer;
var
    T : TMainDocClass;
begin
    T := TMainDocClass.Create(AOwner, id_us, DB, id_kass, id_day);
    T.id_doc_ := id_doc;
    T.ShowForm(false);
    Result := -1;
end;

function KassaDocEdit(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64):Integer;
var
    T : TMainDocClass;
begin
    T := TMainDocClass.Create(AOwner, id_us, DB, id_kass, id_day);
    T.id_doc_ := id_doc;
    T.ShowForm(true);
    Result := -1;
end;

{ TMainDocClass }

constructor TMainDocClass.Create(AOwner: TComponent; id_us: int64;
  DB: TpFIBDatabase; id_kass, id_day: int64);
begin
    inherited Create(AOwner);
    Owner := AOwner;
    id_kas := id_kass;
    id_d := id_day;
    Class_Database                        := TpFIBDatabase.Create(AOwner);
    Class_Database                        := DB;
{    Class_Database.ConnectParams.UserName := 'SYSDBA';
    Class_Database.ConnectParams.Password := 'masterkey';
    Class_Database.ConnectParams.CharSet  := 'WIN1251';
    Class_Database.SQLDialect             := 3;
 }   Class_Transaction_R                   := TpFIBTransaction.Create(Aowner);
    Class_Transaction_Wr                  := TpFIBTransaction.Create(Aowner);
    Class_StoredProc                      := TpFIBStoredProc.Create(Aowner);
    Class_DataSet                         := TpFIBDataSet.Create(Aowner);

    Class_Transaction_R.DefaultDatabase   := Class_Database;
    Class_Transaction_Wr.DefaultDatabase  := Class_Database;
    Class_Database.DefaultTransaction     := Class_Transaction_R;
    Class_StoredProc.Database             := Class_Database;
    Class_DataSet.Database                := Class_Database;


    id_user := id_us;
end;

function TMainDocClass.AddDOC(id_day, id_all_doc, id_man, id_operation : int64; fio, osnovanie, s, n_s : string; summa : double; prihod_rashod, number, add_number : integer):int64;
begin
    Class_DataSet.Transaction.StartTransaction;
    Class_StoredProc.Database    := Class_Database;
    Class_StoredProc.Transaction := Class_Transaction_Wr;

    Class_Transaction_Wr.StartTransaction;

    Class_DataSet.Close;
    try
        DecimalSeparator                  := '.';
        Class_DataSet.SQLs.SelectSQL.Text := 'select R_ID from KASSA_DOC_INSERT('+IntToStr(id_day)+', '+IntToStr(prihod_rashod)+', '+IntToStr(number)+', '+IntToStr(add_number)+', '''+fio+''', '''+osnovanie+''', '+IntToStr(id_operation)+', '+floatToStr(summa) + ', '+Inttostr(id_all_doc)+', '+ IntTostr(id_man) + ', '+intToStr(id_user)+', '''+s+''', '''+n_s+''')';
        Class_DataSet.Open;
        Result                            := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
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
    T : TfmKassaDocMainForm;
begin
    if SpEdit=true then
    begin
        T := TfmKassaDocMainForm.Create(Owner, Self, Edit);
        T.FormStyle := fsNormal;
        T.ShowModal;
        T.Free;
    end
    else
    begin
        T := TfmKassaDocMainForm.Create(Owner, Self, Show);
        T.FormStyle := fsMDIChild;
     //   ShowForm:=T.ResValue;
    end;
end;

function TMainDocClass.AddAllDOC(id_day, id_all_doc, id_man,
  id_operation: int64; fio, osnovanie: string; summa: double;
  prihod_rashod, number, add_number: integer): int64;
begin

    Class_DataSet.Database    := Class_Database;
    Class_DataSet.Transaction := Class_Transaction_Wr;
    Class_Transaction_Wr.StartTransaction;
    Class_DataSet.Close;
    try
        DecimalSeparator                  := '.';
        Class_DataSet.SQLs.SelectSQL.Text := 'select R_ID from KASSA_ALL_DOC_INSERT('+IntToStr(id_day)+', '+IntToStr(prihod_rashod)+', '+IntToStr(number)+', '+IntToStr(add_number)+', '''+fio+''', '''+osnovanie+''', '+IntToStr(id_operation)+', '+floatToStr(summa) + ', '+Inttostr(id_all_doc)+', '+ IntTostr(id_man) + ', '+intToStr(id_user)+')';
        Class_DataSet.Open;
        Result                            := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
        Class_DataSet.Close;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        Result := 0;
    end end;
    DecimalSeparator := ',';

end;

procedure TMainDocClass.DeleteDoc(id_doc, all_doc : int64; dd : TDate);
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
            T.Repaint;
            if all_doc > 0 then
            begin
                 STRU.DBHANDLE      := Class_Database.Handle;
                 STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
                 STRU.WORKDATE      := dd;
                 STRU.KERNEL_ACTION := 2;
                 STRU.KEY_SESSION   := Class_Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);;
                 STRU.PK_ID         := all_doc;
                 DoResult:=Kernel.KernelDo(@STRU);
                 if not DoResult
                 then begin
                       ErrorList := Kernel.GetDocErrorsList(@STRU);
                       mes       := Un_R_file_Alex.MY_MESSAGE_ERROR + #13;
                       if ErrorList<>nil
                       then for i:=0 to  ErrorList.Count-1 do
                           mes :=  mes +' '+ ErrorList.Strings[i]+#13;
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
                       exit;
                 end else
                 begin
                    Class_StoredProc.StoredProcName := 'KASSA_DOC_DELETE';
                    Class_StoredProc.Prepare;
                    Class_StoredProc.ParamByName('D_ID_DT_DOC').AsInt64    := id_doc;
                    Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := id_user;
                    Class_StoredProc.ExecProc;
                 end;
            end else
            begin
                    Class_StoredProc.StoredProcName:='KASSA_DOC_DELETE';
                    Class_StoredProc.Prepare;
                    Class_StoredProc.ParamByName('D_ID_DT_DOC').AsInt64    := id_doc;
                    Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := id_user;
                    Class_StoredProc.ExecProc;
            end;
            Class_Transaction_Wr.Commit;
            T.Free;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        T.Free;
        ShowMessage(E.Message);
        EXIT;
    end end;
end;

end.
