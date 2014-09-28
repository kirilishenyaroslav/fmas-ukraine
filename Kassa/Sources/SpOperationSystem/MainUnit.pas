unit MainUnit;

interface

uses Classes, pFIBDatabase, pFIBStoredProc, pFIBDataSet;

Type
  TSpOperetionClass = class(TComponent)
    Class_Database       : TpFIBDatabase;
    Class_Transaction_R  : TpFIBTransaction;
    Class_Transaction_Wr : TpFIBTransaction;
    Class_StoredProc     : TpFIBStoredProc;
    Class_DataSet        : TpFIBDataSet;
  private
    Owner : TComponent;
    id_user : int64;
  public
    constructor Create(AOwner: TComponent; id_use: int64; DB: TpFIBDatabase); reintroduce; overload;
    destructor Destroy; override;
    function ShowForm(SpEdit : Boolean):VAriant;
    function ShowSpEditForm : VAriant;
    function Add(name : string; flag_prixod, flag_rasxod, flag_fond, flag_system, flag_visible, kod : integer; id_sch, id_sm, id_razd, id_st, id_kekv : int64):int64;
    procedure Delete(id : int64);
    procedure Change(name : string; flag_prixod, flag_rasxod, flag_fond, flag_system, flag_visible, kod : integer; id_sch, id_sm, id_razd, id_st, id_kekv, id : int64);
  end;


function SpOperetionKassa(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): integer;stdcall;
function EditOperetionKassa(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;stdcall;
function SpEditSpOperetionKassa(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;stdcall;

exports SpOperetionKassa, EditOperetionKassa, EditOperetionKassa;

implementation
uses MainForm, Dialogs, SysUtils, Forms;

{ TSpOperetionClass }

constructor TSpOperetionClass.Create(AOwner: TComponent; id_use: int64;
  DB: TpFIBDatabase);
begin
    inherited Create(AOwner);
    Owner := AOwner;

    Class_Database                       := TpFIBDatabase.Create(nil);
    Class_Database                       := DB;

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
    id_user := id_use;
end;

function TSpOperetionClass.Add(name: string; flag_prixod, flag_rasxod,
  flag_fond, flag_system, flag_visible, kod: integer; id_sch, id_sm,
  id_razd, id_st, id_kekv: int64): int64;
begin
    Class_DataSet.Database    := Class_Database;
    Class_DataSet.Transaction := Class_Transaction_Wr;
    Class_DataSet.Close;
    Class_DataSet.Transaction.StartTransaction;
    Class_DataSet.SQLs.SelectSQL.Text := 'select R_ID from KASSA_SP_OPERATION_INSERT('''+name+''', ' + IntToStr(id_sch) + ', ' + IntToStr(id_sm) + ',' + IntToStr(id_razd) + ',' + IntToStr(id_st) + ',' + IntToStr(id_kekv) + ', ' + IntToStr(flag_prixod) + ', ' + IntToStr(flag_rasxod) + ', ' + IntToStr(flag_fond) + ', ' + IntToStr(flag_system) + ', ' + IntToStr(flag_visible) + ', ' + IntToStr(kod) + ')';
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

procedure TSpOperetionClass.Change(name: string; flag_prixod, flag_rasxod,
  flag_fond, flag_system, flag_visible, kod: integer; id_sch, id_sm,
  id_razd, id_st, id_kekv, id: int64);
begin
    Class_StoredProc.Database       := Class_Database;
    Class_StoredProc.Transaction    := Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName := 'KASSA_SP_OPERATION_UPDATE';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64             := ID;
    Class_StoredProc.ParamByName('D_NAME').AsString          := name;
    Class_StoredProc.ParamByName('D_ID_SCH').AsInt64         := id_sch;
    Class_StoredProc.ParamByName('D_ID_SM').AsInt64          := id_sm;
    Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64        := id_razd;
    Class_StoredProc.ParamByName('D_ID_ST').AsInt64          := id_st;
    Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64        := id_kekv;
    Class_StoredProc.ParamByName('D_FLAG_PRIHOD').AsInteger  := flag_prixod;
    Class_StoredProc.ParamByName('D_FLAG_RASHOD').AsInteger  := flag_rasxod;
    Class_StoredProc.ParamByName('D_FLAG_FOND').AsInteger    := flag_fond;
    Class_StoredProc.ParamByName('D_FLAG_SYSTEM').AsInteger  := flag_system;
    Class_StoredProc.ParamByName('D_FLAG_VISIBLE').AsInteger := flag_visible;
    Class_StoredProc.ParamByName('D_KOD').AsInteger          := kod;
    try
        Class_StoredProc.ExecProc;
        Class_StoredProc.Transaction.Commit;
    except on E:Exception do begin
        Class_StoredProc.Transaction.Rollback;
        ShowMessage(E.Message);
    end end;
end;



procedure TSpOperetionClass.Delete(id: int64);
begin
    Class_StoredProc.Database       := Class_Database;
    Class_StoredProc.Transaction    := Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName := 'KASSA_SP_OPERATION_DELETE';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64 := ID;
    try
        Class_StoredProc.ExecProc;
        Class_StoredProc.Transaction.Commit;
    except on E:Exception do begin
        Class_StoredProc.Transaction.Rollback;
        ShowMessage(E.Message);
    end end;
end;


function TSpOperetionClass.ShowForm(SpEdit: Boolean): VAriant;
var
    T : TfmMainForm;
begin
    if SpEdit=true then
    begin
        T           := TfmMainForm.Create(Owner, Self, Edit);
        T.FormStyle := fsMDIChild;
        T.Show;
    end
    else
    begin
        T        := TfmMainForm.Create(Owner, Self, Sp);
        T.ShowModal;
        ShowForm := T.ResValue;
        T.Free;
    end;
end;

function TSpOperetionClass.ShowSpEditForm: VAriant;
var
    T : TfmMainForm;
begin
        T := TfmMainForm.Create(Owner, Self, SpEdit);
        T.ShowModal;
        ShowSpEditForm := T.ResValue;
        T.Free;
end;

destructor TSpOperetionClass.Destroy;
begin

  inherited;
end;


function SpOperetionKassa(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): integer;stdcall;
var
    T : TSpOperetionClass;
begin
    T := TSpOperetionClass.Create(AOwner, id_user, DBHandle);
    T.ShowForm(false);
    Result := -1;
end;

function EditOperetionKassa(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;stdcall;
var
    T : TSpOperetionClass;
begin
    T := TSpOperetionClass.Create(AOwner, id_user, DBHandle);
    T.ShowForm(true);
//    T.Free;
    Result := -1;
end;

function SpEditSpOperetionKassa(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;stdcall;
var
    T : TSpOperetionClass;
begin
    T := TSpOperetionClass.Create(AOwner, id_user, DBHandle);
    Result := T.ShowSpEditForm;
end;

end.
