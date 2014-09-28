unit uCommonDB;

interface

uses DB, uCommonDBParams, NagScreenUnit;

type
    TCommonDBTransaction = class;

    TCommonDB = class(TObject)
    public
        procedure SetHandle(const Handle); virtual; abstract;
        procedure GetHandle(var Handle: Integer); virtual; abstract;

        function GetTransaction: TCommonDBTransaction; virtual; abstract;
    end;

    TCommonDBTransaction = class(TObject)
    protected
        function GetInTransaction: Boolean; virtual; abstract;
        function GetNativeTransaction: TObject; virtual; abstract;
    public
        procedure Start; virtual; abstract;
        procedure Rollback; virtual; abstract;
        procedure Commit; virtual; abstract;

        property InTransaction: Boolean read GetInTransaction;

        procedure ExecQuery(SQL: string); virtual; abstract;
        function QueryData(SQL: string): TDataSet; virtual; abstract;

        procedure NewSQL(query: TDataSet; SQL: string); virtual; abstract;

        procedure RemoveDataSet(query: TDataSet); virtual; abstract;

        property NativeTransaction: TObject read GetNativeTransaction;
    end;

    TDBCenter = class(TObject)
    private
        FDB: TCommonDB;
        FWriteTransaction: TCommonDBTransaction;
        FReadTransaction: TCommonDBTransaction;
        FParams: TCommonDBParams;

        FDataSets: array of TDataSet;
        FOriginalSQLs: array of string;
        FFields: array of string;
        FQuoteStrs: array of Boolean;

        function ReadValue(s: string): Variant;
        procedure SetValue(s: string; value: Variant);
    public
        ShowNagScreen: Boolean;

        constructor Create(DB: TCommonDB);
        destructor Destroy; override;

        procedure ExecQuery(Transaction: TCommonDBTransaction; SQL: string;
            ParamsToSubstitute: string = '';
            QuoteStr: Boolean = True); overload;

        function QueryData(Transaction: TCommonDBTransaction; SQL: string;
            ParamsToSubstitute: string = '';
            QuoteStr: Boolean = True): TDataSet; overload;

        procedure ExecWithResult(Transaction: TCommonDBTransaction;
            SQL: string; ParamsToSubstitute: string = '';
            QuoteStr: Boolean = True); overload;

        procedure ExecQuery(SQL: string; ParamsToSubstitute: string = '';
            QuoteStr: Boolean = True); overload;

        function QueryData(SQL: string; ParamsToSubstitute: string = '';
            QuoteStr: Boolean = True): TDataSet; overload;

        procedure ExecWithResult(SQL: string; ParamsToSubstitute: string = '';
            QuoteStr: Boolean = True); overload;

        procedure StoreFields(query: TDataSet; fields: string);
        procedure Reopen(query: TDataSet);
        procedure Seek(query: TDataSet; fields: string);
        procedure Refresh(query: TDataSet; fields: string);
        procedure Rebind(query: TDataSet);

        procedure RemoveDataset(Transaction: TCommonDBTransaction; query: TDataSet); overload;
        procedure RemoveDataset(query: TDataSet); overload;

        property DB: TCommonDB read FDB;
        property WriteTransaction: TCommonDBTransaction read FWriteTransaction;
        property ReadTransaction: TCommonDBTransaction read FReadTransaction;
        property Params: TCommonDBParams read FParams;
        property ParamValues[s: string]: Variant read ReadValue write SetValue; default;
    end;

implementation

uses SysUtils;

procedure TDBCenter.RemoveDataset(Transaction: TCommonDBTransaction; query: TDataSet);
begin
    Transaction.RemoveDataSet(query);
    if query <> nil then query.Free;
end;

procedure TDBCenter.RemoveDataset(query: TDataSet);
begin
    RemoveDataSet(ReadTransaction, query);
end;

procedure TDBCenter.Rebind(query: TDataSet);
var
    i: Integer;
    new_sql: string;
begin
    for i := 0 to High(FDataSets) do
        if query = FDataSets[i] then
        begin
            new_sql := FParams.Substitute(FOriginalSQLs[i], FFields[i], FQuoteStrs[i]);
            ReadTransaction.NewSQL(query, new_sql);
        end;
end;

procedure TDBCenter.Refresh(query: TDataSet; fields: string);
begin
    StoreFields(query, fields);
    ReOpen(query);
    Seek(query, fields);
end;

procedure TDBCenter.Seek(query: TDataSet; fields: string);
var
    loc_fields: string;
    values: array of Variant;
    p: Integer;
    fieldName: string;
begin
    loc_fields := StringReplace(fields, ',', ';', [rfReplaceAll]);

    SetLength(values, 0);
    fields := Trim(fields) + ',';
    repeat
        p := Pos(',', fields);
        fieldName := Copy(fields, 1, p - 1);
        fields := Trim(Copy(fields, p + 1, Length(fields)));

        SetLength(values, Length(values) + 1);
        values[High(values)] := Params[fieldName];
    until fields = '';

    query.Locate(loc_fields, values, [])
end;

procedure TDBCenter.Reopen(query: TDataSet);
begin
    query.Close;
    query.Open;
end;

procedure TDBCenter.StoreFields(query: TDataSet; fields: string);
begin
    FParams.StoreFields(query, fields);
end;

procedure TDBCenter.ExecWithResult(Transaction: TCommonDBTransaction;
    SQL: string; ParamsToSubstitute: string = ''; QuoteStr: Boolean = True);
var
    result_sql: string;
    result: TDataSet;
    inTran: Boolean;
    i: Integer;
    field: TField;
begin
    if Trim(ParamsToSubstitute) = '' then
        result_sql := SQL
    else
        result_sql := FParams.Substitute(SQL, ParamsToSubstitute, QuoteStr);

    inTran := Transaction.InTransaction;

    if not inTran then Transaction.Start;
    result := Transaction.QueryData(result_sql);

    for i := 0 to result.FieldCount - 1 do
    begin
        field := result.Fields[i];
        Params[field.FieldName] := field.Value;
    end;

    if not inTran then Transaction.Commit;
end;

procedure TDBCenter.ExecWithResult(SQL: string; ParamsToSubstitute: string = '';
    QuoteStr: Boolean = True);
begin
    ExecWithResult(WriteTransaction, SQL, ParamsToSubstitute, QuoteStr);
end;

function TDBCenter.QueryData(Transaction: TCommonDBTransaction; SQL: string;
    ParamsToSubstitute: string = ''; QuoteStr: Boolean = True): TDataSet;
var
    result_sql: string;
    NagScreen: TNagScreen;
begin
    if ShowNagScreen then
    begin
        NagScreen := TNagScreen.Create(nil);
        NagScreen.Show;
        NagScreen.SetStatusText('Отримуються дані з бази даних, зачекайте...');
    end;

    try
        if Trim(ParamsToSubstitute) = '' then
            result_sql := SQL
        else
            result_sql := FParams.Substitute(SQL, ParamsToSubstitute, QuoteStr);

        Result := Transaction.QueryData(result_sql);

        SetLength(FDataSets, Length(FDataSets) + 1);
        SetLength(FOriginalSQLs, Length(FOriginalSQLs) + 1);
        SetLength(FFields, Length(FFields) + 1);
        SetLength(FQuoteStrs, Length(FQuoteStrs) + 1);

        FDataSets[High(FDataSets)] := Result;
        FOriginalSQLs[High(FOriginalSQLs)] := SQL;
        FFields[High(FFields)] := ParamsToSubstitute;
        FQuoteStrs[High(FQuoteStrs)] := QuoteStr;
    finally
        if ShowNagScreen then NagScreen.Free;
    end;
end;

function TDBCenter.QueryData(SQL: string; ParamsToSubstitute: string = '';
    QuoteStr: Boolean = True): TDataSet;
begin
    Result := QueryData(ReadTransaction, SQL, ParamsToSubstitute, QuoteStr);
end;

procedure TDBCenter.ExecQuery(Transaction: TCommonDBTransaction; SQL: string;
    ParamsToSubstitute: string = ''; QuoteStr: Boolean = True);
var
    result_sql: string;
begin
    if Trim(ParamsToSubstitute) = '' then
        result_sql := SQL
    else
        result_sql := FParams.Substitute(SQL, ParamsToSubstitute, QuoteStr);

    Transaction.ExecQuery(result_sql);
end;

procedure TDBCenter.ExecQuery(SQL: string; ParamsToSubstitute: string = '';
    QuoteStr: Boolean = True);
begin
    ExecQuery(WriteTransaction, SQL, ParamsToSubstitute, QuoteStr);
end;

constructor TDBCenter.Create(DB: TCommonDB);
begin
    inherited Create;

    FDB := DB;
    FWriteTransaction := DB.GetTransaction;
    FReadTransaction := DB.GetTransaction;
    FParams := TCommonDBParams.Create;
end;

destructor TDBCenter.Destroy;
begin
    FParams.Free;
    FReadTransaction.Free;
    FWriteTransaction.Free;
    FDB.Free;
    inherited Destroy;
end;

function TDBCenter.ReadValue(s: string): Variant;
begin
    Result := FParams[s];
end;

procedure TDBCenter.SetValue(s: string; value: Variant);
begin
    FParams[s] := value;
end;

end.
