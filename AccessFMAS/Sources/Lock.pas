unit Lock;

interface

uses Windows, Messages, SysUtils, Classes, IBQuery, IBSQL, IBDatabase, Db, IBStoredProc;

type
  TLockTransaction = class(TObject)
  private
    dbConnection: TIBDatabase;
    transInput: TIBTransaction;

    FLockID: Integer;
    FKeyFieldName: string;
    FTableName: string;
    FUseLocalTransaction: Boolean;
    FLocked: Boolean;

    procedure SetUseLocalTransaction(Value: Boolean);
    procedure SetTransaction(trans: TIBTransaction);
  public
    property LockID: Integer read FLockID write FLockID default -1;
    property KeyFieldName: string read FKeyFieldName;
    property TableName: string read FTableName;
    property UseLocalTransaction: Boolean read FUseLocalTransaction write SetUseLocalTransaction default false;
    property Transaction: TIBTransaction read transInput write SetTransaction default nil;
    property Locked: Boolean read FLocked default false;

    function Lock(LockTable, LockKeyField: string; KeyValue: Integer): Boolean;
    function UnLock(Commit: Boolean = true): Boolean;

    constructor Create(db: TIBDatabase; LockingTransaction: TIBTransaction = nil);
    destructor Destroy; override;
  end;

implementation

{ TLockTransaction }

constructor TLockTransaction.Create(db: TIBDatabase; LockingTransaction: TIBTransaction);
begin
     inherited Create;
     dbConnection := db;
     FKeyFieldName := '';
     FTableName := '';
     if Assigned(LockingTransaction) then transInput := LockingTransaction;
end;

destructor TLockTransaction.Destroy;
begin
     inherited;
     if FUseLocalTransaction then
     begin
          if transInput.InTransaction then transInput.Commit;
             transInput.Free;
     end;
end;

function TLockTransaction.Lock(LockTable, LockKeyField: string;
  KeyValue: Integer): Boolean;
var
   sqlLock: TIBSQL;
begin
     Result := false;
     if not FLocked then
     begin
          sqlLock := TIBSQL.Create(nil);
          sqlLock.Database := dbConnection;
          sqlLock.Transaction := transInput;
          sqlLock.SQL.Text := 'update '+
                              Trim(LockTable)+
                              ' set '+Trim(LockKeyField)+'='+IntToStr(KeyValue)+
                              ' where '+Trim(LockTable)+'.'+Trim(LockKeyField)+'='+IntToStr(KeyValue);
          transInput.StartTransaction;
          try
             sqlLock.ExecQuery;
          except
                on Exception do Exit;
          end;
          Result := true;
          FLocked := true;
          FTableName := Trim(LockTable);
          FKeyFieldName := Trim(LockKeyField);
          FLockID := KeyValue;
     end;
end;

procedure TLockTransaction.SetTransaction(trans: TIBTransaction);
begin
     if not FUseLocalTransaction then transInput := trans
end;

procedure TLockTransaction.SetUseLocalTransaction(Value: Boolean);
begin
     if Locked then
     begin
          Raise Exception.Create('Дані заблоковано!');
          Exit;
     end;
     if (Value = true) and
        (FUseLocalTransaction = false) then
     begin
          FUseLocalTransaction := true;
          transInput := TIBTransaction.Create(nil);
          transInput.DefaultDatabase := dbConnection;
          transInput.Params.Add('read_committed');
          transInput.Params.Add('rec_version');
          transInput.Params.Add('wait');
     end;

     if (Value = false) and
        (FUseLocalTransaction = true) then
     begin
          FUseLocalTransaction := false;
          if transInput.InTransaction then transInput.Commit;
          transInput.Free;
          transInput := nil;
     end;
end;

function TLockTransaction.UnLock(Commit: Boolean): Boolean;
begin
     Result := true;
     if FLocked then
        try
           if Commit then
              transInput.Commit
           else transInput.Rollback;
        except
              on exc: Exception do
              begin
                   ShowException(exc, ExceptAddr);
                   Result := false;
                   Exit
              end;
        end;
     FLocked := false;
end;

end.
