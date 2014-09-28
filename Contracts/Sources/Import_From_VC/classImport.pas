unit classImport;

interface

uses Classes, pFIBDatabase, pFIBStoredProc, pFIBDataSet, Forms, USvyazivaniya, Ibase;

function LoadImport(AOwner:TComponent; id_user: int64; DB: TpFIBDatabase):Integer;stdcall;
function LoadShowImport(AOwner:TComponent; DB: TpFIBDatabase):Integer;stdcall;
function LoadImportConection(AOwner:TComponent; id_active: int64; DB: TpFIBDatabase):Integer;stdcall;

exports LoadImport;
exports LoadShowImport;
exports LoadImportConection;

implementation

uses Dialogs, SysUtils, Variants, UMain_Import_Unit, Show_first_import;
var
    Class_Database:        TpFIBDatabase;
    Class_Transaction_R:   TpFIBTransaction;
    Class_Transaction_Wr:  TpFIBTransaction;
    Class_StoredProc:      TpFIBStoredProc;
    Class_DataSet:         TpFIBDataSet;
procedure Create(DB: TpFIBDatabase); forward;

function LoadImport(AOwner:TComponent; id_user: int64; DB: TpFIBDatabase):Integer;
var
    T : TfmImport;
begin
    Create(DB);
    T := TfmImport.Create(AOwner, Class_Database.Handle);
    T.FormStyle := fsMDIChild;
    T.Show;
    Result := 0;
end;

function LoadShowImport(AOwner:TComponent; DB: TpFIBDatabase):Integer;
var
    T : Tfm_show_fr_import;
begin
    Create(DB);
    T := Tfm_show_fr_import.Create(AOwner, Class_Database.Handle);
    T.FormStyle := fsMDIChild;
    T.Show;
    Result := 0;
end;

function LoadImportConection(AOwner:TComponent; id_active: int64; DB: TpFIBDatabase):Integer;
var
    res : Variant;
begin
    Create(DB);
    res := USvyazivaniya.func_Svyazi(Class_Database.Handle, id_active);
    {if VarArrayDimCount(res) > 0 then
    begin
        //
    end;}
end;

procedure Create(DB: TpFIBDatabase);
begin
    Class_Database                       := db;
    if not Class_Database.Connected then ShowMessage('База не подкдючена!');
    Class_Transaction_R.DefaultDatabase  := Class_Database;
    Class_Transaction_Wr.DefaultDatabase := Class_Database;
    Class_StoredProc.Database            := Class_Database;
    Class_DataSet.Database               := Class_Database;
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
