unit Action;

interface

uses Windows, Messages, SysUtils, Classes, IBQuery, IBSQL,
    IBDatabase, Db, IBStoredProc, Dbun, Variants;

type
    TObjectAction = class(TDbunObject)
    private
        FActionName: string;
        FActionFullName: string;
        FActionID: Integer;
        FNewInObject: Boolean;
    public
        property NewInObject: Boolean read FNewInObject write FNewInObject;
        property ActionName: string read FActionName write FActionName;
        property ActionFullName: string read FActionFullName write FActionFullName;
        property ActionID: Integer read FActionID write FActionID;

        function FillDataBy(KeyValue: Variant): Boolean; override;
        function FillDataByName(KeyValue: string): Boolean;
        function Insert: Boolean; override;
        function Update: Boolean; override;
        function Delete: Boolean; override;

        procedure NewAction(Name, FullName: string; ID: Integer = -1);
        function IsInObject(ObjectID: Integer): Boolean;
        function DeleteFromObject(ObjectID: Integer): Boolean;
        function InsertActionInObject(ObjectID: Integer): Boolean;
        function AddPermission(ObjectID, RoleID: Integer): Boolean;

        constructor Create(AOwner: TComponent; AConnection: TIBDatabase; Query: TIBQuery = nil); override;
    end;

implementation

{ TObjectAction }

constructor TObjectAction.Create(AOwner: TComponent; AConnection: TIBDatabase; Query: TIBQuery = nil);
begin
    inherited;
    FActionID := -1;
    FNewInObject := false;
    FActionName := '';
    FActionFullName := '';
end;

function TObjectAction.Insert: Boolean;
var
    stprInsAction: TIBStoredProc;
begin
    Result := false;
    stprInsAction := TIBStoredProc.Create(nil);
    stprInsAction.Database := FConnection;
    stprInsAction.Transaction := FInputTransaction;
    stprInsAction.StoredProcName := 'INSERT_ACTION';

    StartInputTransaction;
    try
        stprInsAction.Prepare;
        stprInsAction.ParamByName('pname').AsString := FActionName;
        stprInsAction.ParamByName('pfull_name').AsString := FActionFullName;
        stprInsAction.ExecProc;
        CommitInputTransaction;
    except
        on Exception do
        begin
            RollbackInputTransaction;
            Exit;
        end;
    end;
    FActionID := stprInsAction.ParamByName('pid_action').AsInteger;
    stprInsAction.Free;
    Result := true;
end;

function TObjectAction.Update: Boolean;
var
    sqlUpdAction: TIBSQL;
    sql: string;
begin
    Result := false;

    sqlUpdAction := TIBSQL.Create(nil);
    sqlUpdAction.Database := FConnection;
    sqlUpdAction.Transaction := FInputTransaction;
    sql := 'update actions set ' +
        'name = ''' + FActionName + ''', ' +
        'full_name = ''' + FActionFullName + ''' ' +
        'where id_action = ' + IntToStr(FActionID);
    sqlUpdAction.SQL.Text := sql;

    StartInputTransaction;
    try
        sqlUpdAction.ExecQuery;
        CommitInputTransaction;
    except
        on Exception do
        begin
            RollbackInputTransaction;
            Exit;
        end;
    end;
    sqlUpdAction.Free;
    Result := true;
end;

function TObjectAction.FillDataBy(KeyValue: Variant): Boolean;
var
    sql: string;
    queryRes: TIBQuery;
begin
    Result := false;
    if not Assigned(FDataQuery) then
    begin
        FDataQuery := TIBQuery.Create(nil);
        FDataQuery.Transaction := FConnection.DefaultTransaction;

        sql := 'select *';
        sql := sql + ' from actions';
        sql := sql + ' where actions.id_action = ' + VarToStr(KeyValue);
        FDataQuery.SQL.Text := sql;
        try
            FDataQuery.Open;
        except
            on Exception do
            begin
                     // !
                Exit;
            end;
        end;
        queryRes := FDataQuery;
    end else begin
        queryRes := FDataQuery;
        FDataQuery := nil;
    end;
    if queryRes.RecordCount <= 0 then
    begin
        if Assigned(FDataQuery) then
        begin
            FDataQuery.Free;
            FDataQuery := nil;
        end;
        Exit;
    end;
    FActionID := KeyValue;
    FActionName := queryRes.FieldByName('name').AsString;
    FActionFullName := queryRes.FieldByName('full_name').AsString;
     // Если отбор был самостоятельный
    if Assigned(FDataQuery) then
    begin
        FDataQuery.Free;
        FDataQuery := nil;
    end;
    Result := true;
end;

procedure TObjectAction.NewAction(Name, FullName: string; ID: Integer = -1);
begin
    FActionID := ID;
    FActionName := Name;
    FActionFullName := FullName;
end;

function TObjectAction.InsertActionInObject(ObjectID: Integer): Boolean;
var
    sqlInsActionInObj: TIBSQL;
    sql: string;
begin
    Result := false;
    sqlInsActionInObj := TIBSQL.Create(nil);
    sqlInsActionInObj.Database := FConnection;
    sqlInsActionInObj.Transaction := FInputTransaction;
    sql := 'insert into objects_actions (id_object, id_action) values (' +
        IntToStr(ObjectID) + ', ' + IntToStr(FActionID) + ')';
    sqlInsActionInObj.SQL.Text := sql;

    StartInputTransaction;
    try
        sqlInsActionInObj.ExecQuery;
        CommitInputTransaction;
    except
        on Exception do
        begin
            RollbackInputTransaction;
            Exit;
        end;
    end;
    sqlInsActionInObj.Free;
    Result := true;
end;

function TObjectAction.IsInObject(ObjectID: Integer): Boolean;
var
    queryInObj: TIBQuery;
    sql: string;
begin
    Result := false;
    queryInObj := TIBQuery.Create(nil);
    queryInObj.Database := FConnection;
    queryInObj.Transaction := FConnection.DefaultTransaction;
    sql := 'select * from objects_actions where id_object = ' + IntToStr(ObjectID) +
        ' and id_action = ' + IntToStr(FActionID);
    queryInObj.SQL.Text := sql;

    try
        queryInObj.Open;
    except
        on Exception do
        begin
                //!
            Exit;
        end;
    end;
    if queryInObj.RecordCount > 0 then Result := true;
    queryInObj.Free;
end;

function TObjectAction.DeleteFromObject(ObjectID: Integer): Boolean;
var
    sqlDelActionFromObj: TIBSQL;
    sql: string;
begin
    Result := false;
    sqlDelActionFromObj := TIBSQL.Create(nil);
    sqlDelActionFromObj.Database := FConnection;
    sqlDelActionFromObj.Transaction := FInputTransaction;
    sql := 'delete from objects_actions where id_object = ' + IntToStr(ObjectID) +
        ' and id_action = ' + IntToStr(FActionID);
    sqlDelActionFromObj.SQL.Text := sql;

    StartInputTransaction;
    try
        // Удаляем действие из объекта
        sqlDelActionFromObj.ExecQuery;

        // Удаляем права для данного объекта и действия
        sql := 'delete from permissions where id_object = ' + IntToStr(ObjectID) +
            ' and id_action = ' + IntToStr(FActionID);
        sqlDelActionFromObj.SQL.Text := sql;
        sqlDelActionFromObj.ExecQuery;
        CommitInputTransaction;
    except
        on Exception do
        begin
            RollbackInputTransaction;
            Exit;
        end;
    end;
    sqlDelActionFromObj.Free;
    Result := true;
end;

function TObjectAction.AddPermission(ObjectID, RoleID: Integer): Boolean;
var
    sqlInsPermission: TIBSQL;
    sql: string;
begin
    Result := false;

    sqlInsPermission := TIBSQL.Create(nil);
    sqlInsPermission.Database := FConnection;
    sqlInsPermission.Transaction := FInputTransaction;
    sql := 'insert into permissions (id_role, id_object, id_action) values (' +
        IntToStr(RoleID) + ', ' + IntToStr(ObjectID) + ', ' + IntToStr(FActionID) + ')';
    sqlInsPermission.SQL.Text := sql;

    StartInputTransaction;
    try
        sqlInsPermission.ExecQuery;
        CommitInputTransaction;
    except
        on Exception do
        begin
            RollbackInputTransaction;
            Exit;
        end;
    end;
    sqlInsPermission.Free;
    Result := true;
end;

function TObjectAction.Delete: Boolean;
begin
    Result := false;
end;

function TObjectAction.FillDataByName(KeyValue: string): Boolean;
var
    sql: string;
    queryRes: TIBQuery;
begin
    Result := false;
    if not Assigned(FDataQuery) then
    begin
        FDataQuery := TIBQuery.Create(nil);
        FDataQuery.Transaction := FConnection.DefaultTransaction;

        sql := 'select *';
        sql := sql + ' from actions';
        sql := sql + ' where actions.name = ''' + Trim(KeyValue) + '''';
        FDataQuery.SQL.Text := sql;
        try
            FDataQuery.Open;
        except
            on Exception do
            begin
                     // !
                Exit;
            end;
        end;
        queryRes := FDataQuery;
    end else begin
        queryRes := FDataQuery;
        FDataQuery := nil;
    end;
    if queryRes.RecordCount <= 0 then
    begin
        if Assigned(FDataQuery) then
        begin
            FDataQuery.Free;
            FDataQuery := nil;
        end;
        Exit;
    end;
    FActionID := queryRes.FieldByName('id_action').AsInteger;
    FActionName := queryRes.FieldByName('name').AsString;
    FActionFullName := queryRes.FieldByName('full_name').AsString;
     // Если отбор был самостоятельный
    if Assigned(FDataQuery) then
    begin
        FDataQuery.Free;
        FDataQuery := nil;
    end;
    Result := true;
end;

end.
