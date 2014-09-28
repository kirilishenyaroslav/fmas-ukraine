unit uIBXCommonDB;

interface

uses uCommonDB, DB, IBDatabase, IBHeader, uIBXCommonDBErrors, IBQuery;

type
    TIBXCommonDB = class(TCommonDB)
    private
        IBX_DB: TIBDatabase;
        DefaultTransaction: TIBTransaction;
    public
        constructor Create;
        destructor Destroy; override;

        procedure SetHandle(const Handle); override;
        procedure GetHandle(var Handle: Integer); override;

        function GetTransaction: TCommonDBTransaction; override;
    end;

    TIBXDBTransaction = class(TCommonDBTransaction)
    private
        IBX_Transaction: TIBTransaction;
        InProcess: Boolean;

        Queries: array of TIBQuery;
        WorkQuery: TIBQuery;

        procedure FreeDataSets;
    protected
        function GetInTransaction: Boolean; override;
        function GetNativeTransaction: TObject; override;
    public
        constructor Create(IBX_DB: TIBDatabase);
        destructor Destroy; override;

        procedure Start; override;
        procedure Rollback; override;
        procedure Commit; override;

        procedure ExecQuery(SQL: string); override;
        function QueryData(SQL: string): TDataSet; override;

        procedure NewSQL(query: TDataSet; SQL: string); override;
        procedure RemoveDataSet(query: TDataSet); override;
    end;

function IBXCreateDBCenter(Handle: TISC_DB_Handle): TDBCenter;

implementation

uses SysUtils, Classes;

function IBXCreateDBCenter(Handle: TISC_DB_Handle): TDBCenter;
var
    DB: TIBXCommonDB;
begin
    DB := TIBXCommonDB.Create;
    DB.SetHandle(Handle);
    Result := TDBCenter.Create(DB);
end;

    {*****************TIBXDBTransaction***************}

procedure TIBXDBTransaction.RemoveDataSet(query: TDataSet);
var
    i, j: Integer;
begin
    for i := 0 to High(Queries) do
        if Queries[i] = query then
        begin
            query.Close;
            for j := i + 1 to High(Queries) do
                Queries[j - 1] := Queries[j];
            SetLength(Queries, Length(Queries) - 1);
            break;
        end;
end;

function TIBXDBTransaction.GetNativeTransaction: TObject;
begin
    Result := IBX_Transaction;
end;

procedure TIBXDBTransaction.NewSQL(query: TDataSet; SQL: string);
var
    ibq: TIBQuery;
    i: Integer;
begin
    if not (query is TIBQuery) then
        raise Exception.Create(E_IBXCommonDB_NewSQLNotIBQuery);

    ibq := query as TIBQuery;

    for i := 0 to High(Queries) do
        if Queries[i] = ibq then
        begin
            ibq.Close;
            ibq.SQL.Text := SQL;
            ibq.Open;
            Exit;
        end;

    raise Exception.Create(E_IBXCommonDB_NewSQLNotMine);
end;

function TIBXDBTransaction.GetInTransaction: Boolean;
begin
    Result := InProcess;
end;

procedure TIBXDBTransaction.ExecQuery(SQL: string);
var
    inTran: Boolean;
begin
    inTran := InProcess;
    if not inTran then Start;

    WorkQuery.Close;
    WorkQuery.SQL.Text := SQL;
    WorkQuery.ExecSQL;

    if not inTran then Commit;
end;

function TIBXDBTransaction.QueryData(SQL: string): TDataSet;
var
    query: TIBQuery;
begin
    if not InProcess then Start;

    query := TIBQuery.Create(IBX_Transaction);
    query.Transaction := IBX_Transaction;

    SetLength(Queries, Length(Queries) + 1);
    Queries[High(Queries)] := query;

    query.SQL.Text := SQL;
    query.Open;

    Result := query;
end;

procedure TIBXDBTransaction.FreeDataSets;
var
    i: Integer;
begin
    for i := 0 to High(Queries) do
        Queries[i].Free;
    SetLength(Queries, 0);
end;

procedure TIBXDBTransaction.Start;
begin
    if InProcess then
        raise Exception.Create(E_IBXCommonDB_AlreadyStarted);

    if not IBX_Transaction.Active then
        IBX_Transaction.StartTransaction;
    InProcess := True;
end;

procedure TIBXDBTransaction.Rollback;
begin
    if not InProcess then
        raise Exception.Create(E_IBXCommonDB_RollbackNotInTran);

    IBX_Transaction.Rollback;
    FreeDataSets;
    InProcess := False;
end;

procedure TIBXDBTransaction.Commit;
begin
    if not InProcess then
        raise Exception.Create(E_IBXCommonDB_CommitNotInTran);

    IBX_Transaction.Commit;
    FreeDataSets;
    InProcess := False;
end;

constructor TIBXDBTransaction.Create(IBX_DB: TIBDatabase);
begin
    inherited Create;

    IBX_Transaction := TIBTransaction.Create(IBX_DB);
    IBX_Transaction.DefaultDatabase := IBX_DB;
    with IBX_Transaction.Params do
    begin
        Add('read_committed');
        Add('rec_version');
        Add('nowait');
    end;

    SetLength(Queries, 0);

    WorkQuery := TIBQuery.Create(IBX_Transaction);
    WorkQuery.Transaction := IBX_Transaction;

    InProcess := False;
end;

destructor TIBXDBTransaction.Destroy;
begin
    WorkQuery.Free;
    FreeDataSets;
    IBX_Transaction.Free;
    inherited Destroy;
end;

 {********************TIBXCommonDB***********************}

function TIBXCommonDB.GetTransaction: TCommonDBTransaction;
begin
    if IBX_DB = nil then
        raise Exception.Create(E_IBXCommonDB_DBIsNil);

    Result := TIBXDBTransaction.Create(IBX_DB);
end;

constructor TIBXCommonDB.Create;
begin
    inherited Create;

    IBX_DB := TIBDatabase.Create(nil);

    DefaultTransaction := TIBTransaction.Create(IBX_DB);
    IBX_DB.DefaultTransaction := DefaultTransaction;
    DefaultTransaction.DefaultDatabase := IBX_DB;
end;

destructor TIBXCommonDB.Destroy;
begin
    IBX_DB := nil;
    DefaultTransaction.Free;
    inherited Destroy;
end;

procedure TIBXCommonDB.SetHandle(const Handle);
begin
    if IBX_DB = nil then
        raise Exception.Create(E_IBXCommonDB_DBIsNil);

    IBX_DB.SetHandle(TISC_DB_Handle(Handle));
end;

procedure TIBXCommonDB.GetHandle(var Handle: Integer);
begin
    if IBX_DB = nil then
        raise Exception.Create(E_IBXCommonDB_DBIsNil);

    Handle := Integer(IBX_DB.Handle);
end;

end.
