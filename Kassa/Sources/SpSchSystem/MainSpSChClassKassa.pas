unit MainSpSChClassKassa;

interface

uses Classes, pFIBDatabase, pFIBStoredProc, pFIBDataSet, IBase, IB_EXTERNALS;

Type
  TSpRazdClass = class(TComponent)
    Class_Database:        TpFIBDatabase;
    Class_Transaction_R:   TpFIBTransaction;
    Class_Transaction_Wr:  TpFIBTransaction;
    Class_StoredProc:      TpFIBStoredProc;
    Class_DataSet:         TpFIBDataSet;
  private
    Owner : TComponent;
    id_user : int64;
  public
    constructor Create(AOwner: TComponent; id: int64; DB: TpFIBDatabase); reintroduce; overload;
    destructor Destroy; override;
    function ShowForm(SpEdit : Boolean):VAriant;
    function ShowSpEditForm : VAriant;
    function AddVetka(long_name, short_name, date_close : String):int64;
    procedure DeleteVetka(id : int64);
    procedure ChangeVetka(long_name, short_name, kod, date_open : String; sys_open : integer; id : int64);
    procedure AddSch(date_begin, date_end : String; id_j4, id_sch : int64);
    procedure DeleteSch(id : int64; date_begin, date_end : string);
    procedure ChangeSch(date_begin, date_end : String; id_j4, id_sch : int64);
  end;


function SpSchSystemKassa(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): integer;stdcall;
//function EditSpTypeDoc(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;stdcall;
//function SpEditSpTypeDoc(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;stdcall;

exports SpSchSystemKassa{, EditSpTypeDoc, SpEditSpTypeDoc};

implementation

uses MainSpSchFormKassa, Dialogs, SysUtils, Forms;

function SpSchSystemKassa(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Integer;
var
    T : TSpRazdClass;
begin
    T := TSpRazdClass.Create(AOwner, id_user, DBHandle);
    T.ShowForm(false);
    T.Free;
    Result := -1;
end;

{function EditSpTypeDoc(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;
var
    T : TSpRazdClass;
begin
    T := TSpRazdClass.Create(AOwner, id_user, DBHandle);
    T.ShowForm(true);
//    T.Free;
    Result := -1;
end;

function SpEditSpTypeDoc(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;
var
    T : TSpRazdClass;
begin
    T := TSpRazdClass.Create(AOwner, id_user, DBHandle);
    Result := T.ShowSpEditForm;
    T.Free;
end;
}
function TSpRazdClass.ShowSpEditForm : VAriant;
var
    T : TfmForm;
begin
        T := TfmForm.Create(Owner, Self, Class_Database.Handle, Class_Transaction_R.Handle, SpEdit);
        T.ShowModal;
        ShowSpEditForm := T.ResValue;
        T.Free;
end;

function TSpRazdClass.AddVetka(long_name, short_name, date_close : String) : int64;
begin
    Class_DataSet.Database    := Class_Database;
    Class_DataSet.Transaction := Class_Transaction_Wr;
    Class_DataSet.Close;
    Class_DataSet.Transaction.StartTransaction;
    Class_DataSet.SQLs.SelectSQL.Text := 'select R_ID from KASSA_SP_KASS_INSERT('''+long_name+''', ''' + short_name + ''',  ''' + date_close + ''', '+IntTostr(id_user)+')';
    try
        Class_DataSet.Open;
        Result := Class_DataSet.FieldByName('R_ID').AsVariant;
        Class_DataSet.Close;
        Class_DataSet.Transaction.Commit;
    except on E: Exception do begin
        Class_DataSet.Transaction.Rollback;
        ShowMessage(E.Message);
        Result := 0;
    end end;
end;

procedure TSpRazdClass.ChangeVetka(long_name, short_name, kod, date_open : String; sys_open : integer; id : int64);
begin
    Class_StoredProc.Database       := Class_Database;
    Class_StoredProc.Transaction    := Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName := 'KASSA_SP_KASS_UPDATE';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID_SP_KASS').AsInt64 := ID;
    Class_StoredProc.ParamByName('D_FULL_NAME').AsString := long_name;
    Class_StoredProc.ParamByName('D_SHORT_NAME').AsString := short_name;
    Class_StoredProc.ParamByName('D_DATE_BLOCK').AsDate := StrTodate(date_open);
    Class_StoredProc.ParamByName('D_DATE_CLOSE').AsInteger := sys_open;
    Class_StoredProc.ParamByName('D_ID_USER_BLOK').AsInt64 := id_user;
    Class_StoredProc.ParamByName('D_ID_USER_CLOSE').AsInt64 := id_user;
    try
        Class_StoredProc.ExecProc;
        Class_StoredProc.Transaction.Commit;
    except on E:Exception do begin
        Class_StoredProc.Transaction.Rollback;
        ShowMessage(E.Message);
    end end;
end;

constructor TSpRazdClass.Create(AOwner: TComponent; id: int64; DB: TpFIBDatabase);
begin
    inherited Create(AOwner);
    Owner := AOwner;

    Class_Database                       := TpFIBDatabase.Create(AOwner);
    Class_Database                       := DB;

{    Class_Database.ConnectParams.UserName := 'SYSDBA';
    Class_Database.ConnectParams.Password := 'masterkey';
    Class_Database.ConnectParams.CharSet  := 'WIN1251';
    Class_Database.SQLDialect             := 3;
 }

    Class_Transaction_R                  := TpFIBTransaction.Create(nil);
    Class_Transaction_Wr                 := TpFIBTransaction.Create(nil);
    Class_StoredProc                     := TpFIBStoredProc.Create(nil);
    Class_DataSet                        := TpFIBDataSet.Create(nil);

    Class_Transaction_R.DefaultDatabase  := Class_Database;
    Class_Transaction_Wr.DefaultDatabase := Class_Database;
    Class_StoredProc.Database            := Class_Database;
    Class_DataSet.Database               := Class_Database;
    Class_DataSet.Transaction            := Class_Transaction_Wr;

    Class_Database.DefaultTransaction    := Class_Transaction_R;
    id_user := id;
end;

procedure TSpRazdClass.DeleteVetka(id: int64);
begin
    Class_StoredProc.Database       := Class_Database;
    Class_StoredProc.Transaction    := Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName := 'KASSA_SP_KASS_DELETE';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID_SP_KASS').AsInt64 := ID;
    try
        Class_StoredProc.ExecProc;
        Class_StoredProc.Transaction.Commit;
    except on E:Exception do begin
        Class_StoredProc.Transaction.Rollback;
        ShowMessage(E.Message);
    end end;
end;

destructor TSpRazdClass.Destroy;
begin
    inherited;
end;


function TSpRazdClass.ShowForm(SpEdit : Boolean): Variant;
var
    T : TfmForm;
begin
    if SpEdit=true then
    begin
        T           := TfmForm.Create(Owner, Self, Class_Database.Handle, Class_Transaction_R.Handle, Edit);
        T.FormStyle := fsMDIChild;
        T.Show;
    end
    else
    begin
        T        := TfmForm.Create(Owner, Self, Class_Database.Handle, Class_Transaction_R.Handle, Sp);
        T.ShowModal;
        ShowForm := T.ResValue;
        T.Free;
    end;
end;

procedure TSpRazdClass.AddSch(date_begin, date_end : String; id_j4, id_sch : int64);
begin
    Class_StoredProc.Database       := Class_Database;
    Class_StoredProc.Transaction    := Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName := 'KASSA_SP_SCH_SYSTEM_INSERT';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID_SP_KASS').AsInt64         := ID_j4;
    Class_StoredProc.ParamByName('D_ID_SCH').AsInt64             := id_sch;
    Class_StoredProc.ParamByName('D_DATE_BEGIN').AsDate          := StrToDate(Date_begin);
    Class_StoredProc.ParamByName('D_DATE_END').AsDate            := StrToDate(Date_end);
    Class_StoredProc.ParamByName('D_ID_USER').AsInt64            := id_user;
    Class_StoredProc.ParamByName('D_FLAG_SCH_DEFAULT').AsInteger := 1;
    try
        Class_StoredProc.ExecProc;
        Class_StoredProc.Transaction.Commit;
    except on E:Exception do begin
        Class_StoredProc.Transaction.Rollback;
        ShowMessage(E.Message);
    end end;
end;

procedure TSpRazdClass.ChangeSch(date_begin, date_end : String; id_j4, id_sch : int64);
begin
    Class_StoredProc.Database       := Class_Database;
    Class_StoredProc.Transaction    := Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName := 'KASSA_SP_SCH_SYSTEM_UPDATE';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID_SP_KASS').AsInt64         := ID_j4;
    Class_StoredProc.ParamByName('D_ID_SCH').AsInt64             := id_sch;
    Class_StoredProc.ParamByName('D_DATE_BEGIN').AsDate          := StrToDate(Date_begin);
    Class_StoredProc.ParamByName('D_DATE_END').AsDate            := StrToDate(Date_end);
//  Class_StoredProc.ParamByName('D_ID_USER').AsInt64            := id_user;
    Class_StoredProc.ParamByName('D_FLAG_SCH_DEFAULT').AsInteger := 1;
    try
        Class_StoredProc.ExecProc;
        Class_StoredProc.Transaction.Commit;
    except on E:Exception do begin
        Class_StoredProc.Transaction.Rollback;
        ShowMessage(E.Message);
    end end;
end;

procedure TSpRazdClass.DeleteSch(id: int64; date_begin, date_end : string);
begin
    Class_StoredProc.Database       := Class_Database;
    Class_StoredProc.Transaction    := Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName := 'KASSA_SP_SCH_SYSTEM_DELETE';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64        := ID;
    Class_StoredProc.ParamByName('D_ID_SCH').AsInt64        := ID;
    Class_StoredProc.ParamByName('D_DATE_BEGIN').AsDate := StrToDate(Date_begin);
    Class_StoredProc.ParamByName('D_DATE_END').AsDate   := StrToDate(Date_end);
    try
        Class_StoredProc.ExecProc;
        Class_StoredProc.Transaction.Commit;
    except on E:Exception do begin
        Class_StoredProc.Transaction.Rollback;
        ShowMessage(E.Message);
    end end;
end;

end.


