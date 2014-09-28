unit MainSpBankCardUnit;

interface

uses Classes, pFIBDatabase, pFIBStoredProc, pFIBDataSet, FIBDataSet;

Type
  TMainSpBankCardUnit = class(TComponent)
    Class_Database:        TpFIBDatabase;
    Class_Transaction_R:   TpFIBTransaction;
    Class_Transaction_Wr:  TpFIBTransaction;
    Class_StoredProc:      TpFIBStoredProc;
    Class_DataSet:         TpFIBDataSet;
    function SelectDog(f1, f2, f3 : boolean) : variant;
    function SelectBankCard(f1 : boolean) : variant;
  private
  public
    Own : TComponent;
    id_user, id_dog : int64;
    editing, take_result : boolean;
    constructor Create(AOwner: TComponent; id: int64; DB: TpFIBDatabase); reintroduce; overload;
    destructor Destroy; reintroduce; overload;
    function ShowForm(SpEdit : smallint) : boolean;
  end;

function UVSpBankCardEditing(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase) : Integer; stdcall;
function UVSpBankCardTake(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit : boolean) : Variant; stdcall;
function UVSpBankCardTakeDog(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit, flag_only_dog : boolean) : Variant; stdcall;
function UVSpBankCardEditingDog(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit, flag_only_dog : boolean) : Integer; stdcall;
function UVSpBankCardTakePoDog(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit : boolean; id_dog : int64) : Variant; stdcall;

    exports UVSpBankCardEditing, UVSpBankCardTakeDog, UVSpBankCardEditingDog, UVSpBankCardTake, UVSpBankCardTakePoDog;

implementation
uses Dialogs,
     SysUtils,
     Forms,
     Variants,
     SpBankCardfmManCard,
     SpBankCardfmDog;

function UVSpBankCardEditing(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase) : Integer; stdcall;
var
    T : TMainSpBankCardUnit;
begin
    T             := TMainSpBankCardUnit.Create(AOwner, id_user, DBHandle);
    T.take_result := false;
    T.editing     := true;
    T.id_dog      := -1;
    T.ShowForm(1);
    Result        := -1;
end;

function UVSpBankCardTake(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit : boolean) : Variant; stdcall;
var
    T : TMainSpBankCardUnit;
begin
    T             := TMainSpBankCardUnit.Create(AOwner, id_user, DBHandle);
    T.take_result := true;
    T.id_dog      := -1;
    Result        := T.SelectBankCard(flag_edit);
end;

function UVSpBankCardTakePoDog(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit : boolean; id_dog : int64) : Variant; stdcall;
var
    T : TMainSpBankCardUnit;
begin
    T             := TMainSpBankCardUnit.Create(AOwner, id_user, DBHandle);
    T.take_result := true;
    T.id_dog      := id_dog;
    Result        := T.SelectBankCard(flag_edit);
end;

function UVSpBankCardTakeDog(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit, flag_only_dog : boolean) : Variant; stdcall;
var
    T : TMainSpBankCardUnit;
begin
    T             := TMainSpBankCardUnit.Create(AOwner, id_user, DBHandle);
    T.id_dog      := -1;
    Result        := T.SelectDog(flag_edit, flag_only_dog, true);
end;

function UVSpBankCardEditingDog(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit, flag_only_dog : boolean) : Integer; stdcall;
var
    T : TMainSpBankCardUnit;
begin
    T := TMainSpBankCardUnit.Create(AOwner, id_user, DBHandle);
    T.id_dog      := -1;
    Result := T.SelectDog(flag_edit, flag_only_dog, false);
end;

constructor TMainSpBankCardUnit.Create(AOwner: TComponent; id: int64;
  DB: TpFIBDatabase);
begin
    inherited Create(AOwner);
    Own := AOwner;

    Class_Database                       := TpFIBDatabase.Create(AOwner);
    Class_Database                       := DB;

    Class_Transaction_R                  := TpFIBTransaction.Create(AOwner);
    Class_Transaction_Wr                 := TpFIBTransaction.Create(AOwner);
    Class_StoredProc                     := TpFIBStoredProc.Create(AOwner);
    Class_DataSet                        := TpFIBDataSet.Create(AOwner);

    Class_Transaction_R.DefaultDatabase  := db;
    Class_Transaction_Wr.DefaultDatabase := db;
    Class_StoredProc.Database            := db;
    Class_DataSet.Database               := db;
    Class_DataSet.Transaction            := Class_Transaction_Wr;

    Class_Database.DefaultTransaction    := Class_Transaction_R;
    id_user := id;
end;

destructor TMainSpBankCardUnit.Destroy;
begin

  inherited;
end;

function TMainSpBankCardUnit.SelectBankCard(f1: boolean): variant;
var
    G : TfmSpBankCardfmManCard;
begin
    editing := f1;
    G := TfmSpBankCardfmManCard.Create(Self);
    G.ShowModal;
    Result := G.resValue;
    G.Free;
end;

function TMainSpBankCardUnit.SelectDog(f1, f2, f3 : boolean): variant;
var
    G : TfmSpBankCardfmDog;
begin
    editing       := false;  
    G             := TfmSpBankCardfmDog.Create(Self, f1, f2, f3);
    if f3 then
    begin
        G.FormStyle   := fsNormal;
        G.ShowModal;
        Result        := G.ResValue;
        G.Free;
    end else
    begin
        G.FormStyle   := fsMDIChild;
        G.Show;
        Result        := -1;
    end;
end;

function TMainSpBankCardUnit.ShowForm(SpEdit : smallint) : boolean;
var
    T : TfmSpBankCardfmManCard;
begin
    if SpEdit = 1 then
    begin
        T             := TfmSpBankCardfmManCard.Create(Self);
        T.FormStyle   := fsMDIChild;
        T.WindowState := wsMaximized;
        T.Show;
        Result := true;
//        T.Free;
    end else
        Result := false;
end;

end.
