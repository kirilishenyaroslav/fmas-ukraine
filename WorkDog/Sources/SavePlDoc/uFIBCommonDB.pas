unit uFIBCommonDB;

interface

uses DB, uCommonDB, uFIBCommonDBErrors, pFIBDataSet, IBase, pFIBQuery,
    pFIBDatabase;

type
    TFIBCommonDB = class(TCommonDB)
    private
        FIB_DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
    public
        constructor Create;
        destructor Destroy; override;

        procedure SetHandle(const Handle); override;
        procedure GetHandle(var Handle: Integer); override;

        function GetTransaction: TCommonDBTransaction; override;
    end;

    TFIBDBTransaction = class(TCommonDBTransaction)
    private
        FIB_Transaction: TpFIBTransaction;
        InProcess: Boolean;

        Queries: array of TpFIBDataSet;
        WorkQuery: TpFIBQuery;

        procedure FreeDataSets;
    protected
        function GetInTransaction: Boolean; override;
        function GetNativeTransaction: TObject; override;
    public
        constructor Create(FIB_DB: TpFIBDatabase);
        destructor Destroy; override;

        procedure Start; override;
        procedure Rollback; override;
        procedure Commit; override;

        procedure ExecQuery(SQL: string); override;
        function QueryData(SQL: string): TDataSet; override;

        procedure NewSQL(query: TDataSet; SQL: string); override;
        procedure RemoveDataSet(query: TDataSet); override;
    end;

function FIBCreateDBCenter(Handle: TISC_DB_Handle): TDBCenter;

implementation

uses SysUtils, Classes;

function FIBCreateDBCenter(Handle: TISC_DB_Handle): TDBCenter;
var
    DB: TFIBCommonDB;
begin
    DB := TFIBCommonDB.Create;
    DB.SetHandle(Handle);
    Result := TDBCenter.Create(DB);
end;

    {*****************TFIBDBTransaction***************}

function TFIBDBTransaction.GetNativeTransaction: TObject;
begin
    Result := FIB_Transaction;
end;

procedure TFIBDBTransaction.NewSQL(query: TDataSet; SQL: string);
var
    fibDs: TpFIBDataSet;
    i: Integer;
begin
    if not (query is TpFIBDataSet) then
        raise Exception.Create(E_FIBCommonDB_NewSQLNoTpFIBDataSet);

    fibDs := query as TpFIBDataSet;

    for i := 0 to High(Queries) do
        if Queries[i] = fibDs then
        begin
            fibDs.Close;
            fibDs.SelectSQL.Text := SQL;
            fibDs.Open;
            Exit;
        end;

    raise Exception.Create(E_FIBCommonDB_NewSQLNotMine);
end;

function TFIBDBTransaction.GetInTransaction: Boolean;
begin
    Result := InProcess;
end;

procedure TFIBDBTransaction.ExecQuery(SQL: string);
var
    inTran: Boolean;
begin
    inTran := InProcess;
    if not inTran then Start;

    WorkQuery.Close;
    WorkQuery.SQL.Text := SQL;
    WorkQuery.ExecQuery;

    if not inTran then Commit;
end;

function TFIBDBTransaction.QueryData(SQL: string): TDataSet;
var
    query: TpFIBDataSet;
begin
    if not InProcess then Start;

    query := TpFIBDataSet.Create(nil);
    query.Database := FIB_Transaction.DefaultDatabase;
    query.Transaction := FIB_Transaction;

    SetLength(Queries, Length(Queries) + 1);
    Queries[High(Queries)] := query;

    query.SelectSQL.Text := SQL;
    query.Open;

    Result := query;
end;

procedure TFIBDBTransaction.FreeDataSets;
var
    i: Integer;
begin
    for i := 0 to High(Queries) do
    begin
        Queries[i].Close;
        Queries[i].Free;
    end;
    SetLength(Queries, 0);
end;

procedure TFIBDBTransaction.Start;
begin
    if InProcess then
        raise Exception.Create(E_FIBCommonDB_AlreadyStarted);

    if not FIB_Transaction.Active then
        FIB_Transaction.StartTransaction;
    InProcess := True;
end;

procedure TFIBDBTransaction.Rollback;
begin
    if not InProcess then
        raise Exception.Create(E_FIBCommonDB_RollbackNotInTran);

    FIB_Transaction.Rollback;
    FreeDataSets;
    InProcess := False;
end;

procedure TFIBDBTransaction.Commit;
begin
    if not InProcess then
        raise Exception.Create(E_FIBCommonDB_CommitNotInTran);

    FIB_Transaction.Commit;
    FreeDataSets;
    InProcess := False;
end;

constructor TFIBDBTransaction.Create(FIB_DB: TpFIBDatabase);
begin
    inherited Create;

    FIB_Transaction := TpFIBTransaction.Create(FIB_DB);
    FIB_Transaction.DefaultDatabase := FIB_DB;
    with FIB_Transaction.TRParams do
    begin
        Add('read_committed');
        Add('rec_version');
        Add('nowait');
    end;

    SetLength(Queries, 0);

    WorkQuery := TpFIBQuery.Create(nil);
    WorkQuery.Database := FIB_DB;
    WorkQuery.Transaction := FIB_Transaction;

    InProcess := False;
end;

destructor TFIBDBTransaction.Destroy;
begin
    if InProcess then Rollback;
    WorkQuery.Free;
    FreeDataSets;
    FIB_Transaction.Free;
    inherited Destroy;
end;

 {********************TFIBCommonDB***********************}

procedure TFIBDBTransaction.RemoveDataSet(query: TDataSet);
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

function TFIBCommonDB.GetTransaction: TCommonDBTransaction;
begin
    if FIB_DB = nil then
        raise Exception.Create(E_FIBCommonDB_DBIsNil);

    Result := TFIBDBTransaction.Create(FIB_DB);
end;

constructor TFIBCommonDB.Create;
begin
    inherited Create;

    FIB_DB := TpFIBDatabase.Create(nil);

    DefaultTransaction := TpFIBTransaction.Create(FIB_DB);
    FIB_DB.DefaultTransaction := DefaultTransaction;
    DefaultTransaction.DefaultDatabase := FIB_DB;
end;

destructor TFIBCommonDB.Destroy;
begin
    DefaultTransaction.Free;
//    FIB_DB.Free;
    FIB_DB := nil;
    inherited Destroy;
end;

procedure TFIBCommonDB.SetHandle(const Handle);
begin
    if FIB_DB = nil then
        raise Exception.Create(E_FIBCommonDB_DBIsNil);

    FIB_DB.SQLDialect := 3;
    FIB_DB.Handle := TISC_DB_Handle(Handle);
end;

procedure TFIBCommonDB.GetHandle(var Handle: Integer);
begin
    if FIB_DB = nil then
        raise Exception.Create(E_FIBCommonDB_DBIsNil);

    Handle := Integer(FIB_DB.Handle);
end;

end.
