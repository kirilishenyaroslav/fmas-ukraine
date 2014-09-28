{
  Яновский Андрей Петрович 2003 г. (c)

  Родительский класс для объектов работы с данными.
}
unit Dbun;

interface

uses
    Windows, SysUtils, Classes, IBDatabase, IBQuery;

type EDbunError = class(Exception);

type TDbunObject = class(TComponent)
    private
    protected
        FConnection: TIBDatabase;
        FInputTransaction: TIBTransaction;
        FDataQuery: TIBQuery;
        FUsedExternalTransaction: Boolean;
        procedure InitInputTransaction;
        procedure SetInputTransaction(Value: TIBTransaction);
        procedure StartInputTransaction;
        procedure CommitInputTransaction;
        procedure RollBackInputTransaction;
    public
        property Connection: TIBDatabase read FConnection;
        property InputTransaction: TIBTransaction read FInputTransaction write SetInputTransaction;

        function Insert: Boolean; virtual; abstract;
        function Update: Boolean; virtual; abstract;
        function Delete: Boolean; virtual; abstract;
        function FillDataBy(KeyValue: Variant): Boolean; virtual; abstract;

        constructor Create(AOwner: TComponent; AConnection: TIBDatabase; Query: TIBQuery = nil) overload; virtual;
        destructor Destroy; override;
    end;

implementation

{ TDbunObject }

constructor TDbunObject.Create(AOwner: TComponent;
    AConnection: TIBDatabase; Query: TIBQuery = nil);
begin
    inherited Create(AOwner);
    if not Assigned(AConnection) then
    begin
        raise EDbunError.Create('Не створено з`єднання!');
        Exit;
    end;
    FConnection := AConnection;
    FUsedExternalTransaction := false;
    FDataQuery := nil;
    if Assigned(Query) then FDataQuery := Query;
    InitInputTransaction;
end;

destructor TDbunObject.Destroy;
begin
    if (not FUsedExternalTransaction) and Assigned(FInputTransaction) then
        FInputTransaction.Free;
    inherited;
end;

procedure TDbunObject.InitInputTransaction;
begin
    if FUsedExternalTransaction then FInputTransaction := nil;
    if not Assigned(FInputTransaction) then
    begin
        FInputTransaction := TIBTransaction.Create(Self);
        FInputTransaction.DefaultDatabase := FConnection;
        FInputTransaction.Params.Add('read_committed');
        FInputTransaction.Params.Add('rec_version');
        FInputTransaction.Params.Add('nowait');
    end;
    FUsedExternalTransaction := false;
end;

procedure TDbunObject.SetInputTransaction(Value: TIBTransaction);
begin
    if FInputTransaction <> Value then
        if Assigned(FInputTransaction) then
        begin
            if FInputTransaction.Active then
            begin
                raise EDbunError.Create('Помилка!');
                Exit;
            end;
            if not FUsedExternalTransaction then FInputTransaction.Free;
            FInputTransaction := Value;
            FUsedExternalTransaction := true
        end else begin
            FInputTransaction := Value;
            FUsedExternalTransaction := true
        end;
end;

procedure TDbunObject.StartInputTransaction;
begin
    if not FUsedExternalTransaction then FInputTransaction.StartTransaction;
end;

procedure TDbunObject.CommitInputTransaction;
begin
    if not FUsedExternalTransaction then FInputTransaction.Commit;
end;

procedure TDbunObject.RollBackInputTransaction;
begin
    if not FUsedExternalTransaction then FInputTransaction.Rollback;
end;

end.
