unit KassaDayClass;

interface

uses Classes, pFIBDatabase, pFIBStoredProc, pFIBDataSet, FIBDataSet;

Type
  TMainKassaDayClass = class(TComponent)
    Class_Database:        TpFIBDatabase;
    Class_Transaction_R:   TpFIBTransaction;
    Class_Transaction_Wr:  TpFIBTransaction;
    Class_StoredProc:      TpFIBStoredProc;
    Class_DataSet:         TpFIBDataSet;
  private
    Owner : TComponent;
  public
    id_user : int64;
    constructor Create(AOwner: TComponent; id: int64; DB: TpFIBDatabase); reintroduce; overload;
    destructor Destroy;
    function ShowForm(SpEdit : Boolean):VAriant;
    function ShowSpEditForm : VAriant;

    function AddDay(id_kass : int64; day : string; saldo_beg, saldo_end, sum_deb, sum_kred : double; blok_deb, blok_kred, close_day, blok_saldo : Smallint):int64;
    function AddDay_ext(id_kass: int64; day: string; saldo_beg, saldo_end, sum_deb, sum_kred: double; blok_deb, blok_kred, close_day, blok_saldo: Smallint): int64;
    procedure DeleteDay(id, id_kassa: int64);
    procedure ChangeDay(id_kass, id_day : int64; blok_deb, blok_kred, close_day, blok_saldo : smallint);

end;


function KassaDayShow(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;stdcall;
function KassaDayEdit(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;stdcall;
function KassaDayShowEdit(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Variant;stdcall;

exports KassaDayShow, KassaDayEdit, KassaDayShowEdit;

implementation

uses Dialogs, SysUtils, Forms, Variants, KassaDayForm;
{ TMainKassaDayClass }

function KassaDayShow(AOwner:TComponent; id_user: int64; DB: TpFIBDatabase):Integer;
var
    T : TMainKassaDayClass;
begin
    T := TMainKassaDayClass.Create(AOwner, id_user, DB);
    T.ShowForm(false);
    Result := -1;
end;

function KassaDayEdit(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;
var
    T : TMainKassaDayClass;
begin
    T := TMainKassaDayClass.Create(AOwner, id_user, DB);
    T.ShowForm(true);
//    T.Free;
    Result := -1;
end;

function KassaDayShowEdit(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Variant;
var
    T : TMainKassaDayClass;
begin
    T := TMainKassaDayClass.Create(AOwner, id_user, DB);
    Result := T.ShowSpEditForm;
//    T.Free;
end;

constructor TMainKassaDayClass.Create(AOwner: TComponent; id: int64;
  DB: TpFIBDatabase);
begin
    inherited Create(AOwner);
    Owner := AOwner;

    Class_Database                       := TpFIBDatabase.Create(AOwner);
    Class_Database                       := DB;

    Class_Transaction_R                  := TpFIBTransaction.Create(AOwner);
    Class_Transaction_Wr                 := TpFIBTransaction.Create(AOwner);
    Class_StoredProc                     := TpFIBStoredProc.Create(AOwner);
    Class_DataSet                        := TpFIBDataSet.Create(AOwner);

{

    Class_Transaction_R.DefaultDatabase  := Class_Database;
    Class_Transaction_Wr.DefaultDatabase := Class_Database;
    Class_StoredProc.Database            := Class_Database;
    Class_DataSet.Database               := Class_Database;
    Class_DataSet.Transaction            := Class_Transaction_Wr;
}

    Class_Transaction_R.DefaultDatabase  := db;
    Class_Transaction_Wr.DefaultDatabase := db;
    Class_StoredProc.Database            := db;
    Class_DataSet.Database               := db;
    Class_DataSet.Transaction            := Class_Transaction_Wr;

    Class_Database.DefaultTransaction    := Class_Transaction_R;
    id_user := id;
end;

function TMainKassaDayClass.AddDay(id_kass: int64; day: string; saldo_beg,
  saldo_end, sum_deb, sum_kred: double; blok_deb, blok_kred, close_day,
  blok_saldo: Smallint): int64;
begin
    Class_DataSet.Database       := Class_Database;
    Class_DataSet.Transaction    := Class_Transaction_Wr;
    Class_StoredProc.Database    := Class_Database;
    Class_StoredProc.Transaction := Class_Transaction_Wr;

    Class_Transaction_Wr.StartTransaction;
    Class_DataSet.Close;
    try
        DecimalSeparator := '.';
        Class_DataSet.SQLs.SelectSQL.Text:='select R_ID from KASSA_DAY_INSERT('+IntToStr(id_kass)+', ''' + DAY + ''', ' +floatToStr(saldo_beg) + ', ' +floatToStr(saldo_end) + ', ' +floatToStr(sum_deb) + ', ' +floatToStr(sum_kred) + ', '+ IntTostr(blok_deb) + ', '+ IntTostr(blok_kred) + ', '+ IntTostr(id_user) + ', '+ IntTostr(blok_saldo) + ', '+ IntTostr(id_user) + ')';
        Class_DataSet.Open;
        Result := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
        Class_DataSet.Close;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        Result := 0;
    end end;
    DecimalSeparator := ',';
end;

function TMainKassaDayClass.AddDay_ext(id_kass: int64; day: string; saldo_beg,
  saldo_end, sum_deb, sum_kred: double; blok_deb, blok_kred, close_day,
  blok_saldo: Smallint): int64;
begin
    Class_DataSet.Database       := Class_Database;
    Class_DataSet.Transaction    := Class_Transaction_Wr;
    Class_StoredProc.Database    := Class_Database;
    Class_StoredProc.Transaction := Class_Transaction_Wr;

    Class_Transaction_Wr.StartTransaction;
    Class_DataSet.Close;
    try
        DecimalSeparator := '.';
        Class_DataSet.SQLs.SelectSQL.Text:='select R_ID from KASSA_DAY_INSERT_EXT('+IntToStr(id_kass)+', ''' + DAY + ''', ' +floatToStr(saldo_beg) + ', ' +floatToStr(saldo_end) + ', ' +floatToStr(sum_deb) + ', ' +floatToStr(sum_kred) + ', '+ IntTostr(blok_deb) + ', '+ IntTostr(blok_kred) + ', '+ IntTostr(id_user) + ', '+ IntTostr(blok_saldo) + ', '+ IntTostr(id_user) + ')';
        Class_DataSet.Open;
        Result := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
        Class_DataSet.Close;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        Result := 0;
    end end;
    DecimalSeparator := ',';
end;


procedure TMainKassaDayClass.ChangeDay(id_kass, id_day: int64; blok_deb,
  blok_kred, close_day, blok_saldo: smallint);
begin
    Class_DataSet.Database       := Class_Database;
    Class_DataSet.Transaction    := Class_Transaction_Wr;
    Class_StoredProc.Database    := Class_Database;
    Class_StoredProc.Transaction := Class_Transaction_Wr;

    Class_Transaction_Wr.StartTransaction;

    Class_DataSet.Close;
    try
        DecimalSeparator := '.';
        Class_StoredProc.StoredProcName := 'KASSA_DAY_UPDATE';
        Class_StoredProc.Prepare;
        Class_StoredProc.ParamByName('D_ID_SP_KASS').AsInt64          := id_kass;
        Class_StoredProc.ParamByName('D_ID_DAY_KASSA').AsInt64        := id_day;
        Class_StoredProc.ParamByName('D_BLOK_DEBET').AsInteger        := blok_deb;
        Class_StoredProc.ParamByName('D_BLOK_KREDIT').AsInteger       := blok_kred;
        Class_StoredProc.ParamByName('D_DATE_CLOSE_DAY').AsInteger    := close_day;
        Class_StoredProc.ParamByName('DATE_BLOK_SALDO_END').AsInteger := blok_saldo;
        Class_StoredProc.ParamByName('D_ID_USER_BLOK').AsInt64        := id_user;
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        exit;
    end end;
    DecimalSeparator := ',';
end;

procedure TMainKassaDayClass.DeleteDay(id, id_kassa: int64);
begin
    Class_StoredProc.Database    := Class_Database;
    Class_StoredProc.Transaction := Class_Transaction_Wr;

    Class_Transaction_Wr.StartTransaction;

    Class_StoredProc.StoredProcName:='KASSA_DAY_DELETE';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID_SP_KASS').AsInt64   := id_kassa;
    Class_StoredProc.ParamByName('D_ID_DAY_KASSA').AsInt64 := id;
    try
        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
    end end;
end;

destructor TMainKassaDayClass.Destroy;
begin

  inherited;
end;

function TMainKassaDayClass.ShowForm(SpEdit: Boolean): VAriant;
var
    T : TfmKassaDayForm;
begin
    if SpEdit then
    begin
        T := TfmKassaDayForm.Create(Owner, Self, Edit);
        T.FormStyle := fsMDIChild;
        T.Show;
//        T.Free;
    end
    else
    begin
        T := TfmKassaDayForm.Create(Owner, Self, Show);
        T.FormStyle := fsMDIChild;
     //   ShowForm:=T.ResValue;
    end;
end;

function TMainKassaDayClass.ShowSpEditForm: VAriant;
begin
//
end;

end.
