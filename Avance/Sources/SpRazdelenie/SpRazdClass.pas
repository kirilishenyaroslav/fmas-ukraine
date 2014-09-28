unit SpRazdClass;

interface

uses Classes, pFIBDatabase, pFIBStoredProc, pFIBDataSet;

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
    function AddVetka(long_name, shrot_name : String; LinkTo : int64; Sutochnie : integer):int64;
    procedure DeleteVetka(id : int64);
    function ChangeVetka(long_name, shrot_name : String; id, linkto : int64; Sutochnie : integer): int64;
//    procedure CopyVetka(id_copy, move_linkto : int64);
//    procedure MoveVetka(id, old_linkto, moveto_linkto : int64);
  end;


function SpRazdelAvanse(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Variant;stdcall;
function EditSpRazdelAvanse(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;stdcall;
function SpEditSpRazdelAvanse(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;stdcall;

exports SpRazdelAvanse, EditSpRazdelAvanse, SpEditSpRazdelAvanse;

implementation

uses SpRazdForm, Dialogs, SysUtils, Forms;

function SpRazdelAvanse(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Variant;
var
    T : TSpRazdClass;
begin
    T := TSpRazdClass.Create(AOwner, id_user, DBHandle);
    Result := T.ShowForm(false);
    T.Free;
end;

function EditSpRazdelAvanse(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;
var
    T : TSpRazdClass;
begin
    T := TSpRazdClass.Create(AOwner, id_user, DBHandle);
    T.ShowForm(true);
//    T.Free;
    Result := -1;
end;

function SpEditSpRazdelAvanse(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;
var
    T : TSpRazdClass;
begin
    T := TSpRazdClass.Create(AOwner, id_user, DBHandle);
    Result := T.ShowSpEditForm;
    T.Free;
end;

function TSpRazdClass.ShowSpEditForm : VAriant;
var
    T : TfmSpRazdForm;
begin
        T := TfmSpRazdForm.Create(Owner, Self, Class_Database.Handle, Class_Transaction_R.Handle, SpEdit);
        T.ShowModal;
        ShowSpEditForm := T.ResValue;
        T.Free;
end;

function TSpRazdClass.AddVetka(long_name, shrot_name : String; LinkTo : int64; Sutochnie : integer) : int64;
begin
//    Class_DataSet.Database:=Class_Database;
//    Class_DataSet.Transaction:=Class_Transaction_Wr;
    Class_DataSet.Close;
    Class_DataSet.Transaction.StartTransaction;
    Class_DataSet.SQLs.SelectSQL.Text:='select R_ID from J4_SP_RAZDELENIE_INSERT('+IntToStr(linkto)+', ''' + shrot_name + ''', ''' + long_name + ''', '+IntToStr(Sutochnie)+')';
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

function TSpRazdClass.ChangeVetka(long_name, shrot_name : String; id, linkto : int64; Sutochnie : integer) : int64;
begin
//    Class_DataSet.Database:=Class_Database;
//    Class_DataSet.Transaction:=Class_Transaction_Wr;
    Class_DataSet.Transaction.StartTransaction;
    Class_DataSet.Close;
    Class_DataSet.SQLs.SelectSQL.Text:='select R_ID from J4_SP_RAZDELENIE_UPDATE('+IntToStr(Id)+', '+IntToStr(linkto)+', ''' + shrot_name + ''', ''' + long_name + ''', '+IntToStr(Sutochnie)+')';
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

{procedure TSpRazdClass.CopyVetka(id_copy, move_linkto: int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='SP_AUTOKOD_COPY_VETKA';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64:=id_copy;
    Class_StoredProc.ParamByName('D_MOVETO_ID').AsInt64:=move_linkto;
    try
        Class_StoredProc.ExecProc;
        Class_StoredProc.Transaction.Commit;
    except on E:Exception do begin
        Class_StoredProc.Transaction.Rollback;
        ShowMessage(E.Message);
    end end;
end;
}
constructor TSpRazdClass.Create(AOwner: TComponent; id: int64; DB: TpFIBDatabase);
begin
    inherited Create(AOwner);
    Owner := AOwner;

    Class_Database                       := TpFIBDatabase.Create(nil);
    Class_Database                       := DB;

    {    Class_Database.SQLDialect            := 3;
    Class_Database.ConnectParams.UserName := 'SYSDBA';
    Class_Database.ConnectParams.Password := 'masterkey';
    Class_Database.ConnectParams.CharSet  := 'WIN1251';
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
//    Class_Database.Connected             := true;

    id_user := id;
end;

procedure TSpRazdClass.DeleteVetka(id: int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='J4_SP_RAZD_DELETE';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_ID').AsInt64:=ID;
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

{procedure TSpAutoKod.MoveVetka(id, old_linkto, moveto_linkto: int64);
begin
    Class_StoredProc.Database:=Class_Database;
    Class_StoredProc.Transaction:=Class_Transaction_Wr;
    Class_StoredProc.Transaction.StartTransaction;
    Class_StoredProc.StoredProcName:='SP_AUTOKOD_MOVETO_VETKA';
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('D_OLD_LINKTO').AsInt64:=old_linkto;
    Class_StoredProc.ParamByName('D_ID').AsInt64:=id;
    Class_StoredProc.ParamByName('D_LINKTO_MOVETO').AsInt64:=moveto_linkto;
    try
        Class_StoredProc.ExecProc;
        Class_StoredProc.Transaction.Commit;
    except on E:Exception do begin
        Class_StoredProc.Transaction.Rollback;
        ShowMessage(E.Message);
    end
    end;

end;
}
function TSpRazdClass.ShowForm(SpEdit : Boolean): Variant;
var
    T : TfmSpRazdForm;
begin
    if SpEdit=true then
    begin
        T := TfmSpRazdForm.Create(Owner, Self, Class_Database.Handle, Class_Transaction_R.Handle, Edit);
        T.FormStyle := fsMDIChild;
        T.Show;
    end
    else
    begin
        T := TfmSpRazdForm.Create(Owner, Self, Class_Database.Handle, Class_Transaction_R.Handle, Sp);
        T.ShowModal;
        ShowForm:=T.ResValue;
        T.Free;
    end;
end;

end.


