unit Role;

interface

uses Windows, Messages, SysUtils, Classes, IBQuery, IBSQL, IBDatabase,
    Db, IBStoredProc, Dbun, Variants;

type
    TRole = class(TDbunObject)
    private
        FRoleName: string;
        FRoleFullName: string;
        FRoleID: Integer;

    public
        property RoleName: string read FRoleName write FRoleName;
        property RoleFullName: string read FRoleFullName write FRoleFullName;
        property RoleID: Integer read FRoleID write FRoleID;

        function FillDataBy(KeyValue: Variant): Boolean; override;
        procedure NewRole(Name, FullName: string; ID: Integer = -1);
        function DeletePermission(ObjectID, ActionID: Integer): Boolean;
        function AddUserToRole(UserID: Integer): Boolean;
        function DelUserFromRole(UserID: Integer): Boolean;
        function CheckPermission(ObjectID, ActionID: Integer): Boolean;

        function Insert: Boolean; override;
        function Update: Boolean; override;
        function Delete: Boolean; override;
        constructor Create(AOwner: TComponent; AConnection: TIBDatabase; Query: TIBQuery = nil); override;
    end;

implementation

{ TRole }

uses user;

function TRole.AddUserToRole(UserID: Integer): Boolean;
var
    theUser: TUser;
begin
    Result := false;
    theUser := TUser.Create(Self, FConnection);
    if theUser.FillDataBy(UserID) then Result := theUser.AddUserToRole(FRoleID);
    theUser.Free;
end;

constructor TRole.Create(AOwner: TComponent; AConnection: TIBDatabase; Query: TIBQuery = nil);
begin
    inherited;
    FRoleID := -1;
    FRoleFullName := '';
    FRoleName := '';
end;

function TRole.Delete: Boolean;
begin
    Result := false;
end;

function TRole.DeletePermission(ObjectID, ActionID: Integer): Boolean;
var
    sqlDelPermission: TIBSQL;
    sql: string;
begin
    Result := false;

    sqlDelPermission := TIBSQL.Create(nil);
    sqlDelPermission.Database := FConnection;
    sqlDelPermission.Transaction := FInputTransaction;
    sql := 'delete from permissions where id_object = ' + IntToStr(ObjectID) +
        ' and id_action = ' + IntToStr(ActionID) + ' and id_role = ' + IntToStr(FRoleID);
    sqlDelPermission.SQL.Text := sql;

    StartInputTransaction;
    try
        sqlDelPermission.ExecQuery;
        CommitInputTransaction;
    except
        on Exception do
        begin
            RollbackInputTransaction;
            Exit;
        end;
    end;
    sqlDelPermission.Free;
    Result := true;
end;

function TRole.DelUserFromRole(UserID: Integer): Boolean;
var
    theUser: TUser;
begin
    Result := false;
    theUser := TUser.Create(Self, FConnection);
    if theUser.FillDataBy(UserID) then Result := theUser.DelUserFromRole(FRoleID);
    theUser.Free;
end;

function TRole.FillDataBy(KeyValue: Variant): Boolean;
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
        sql := sql + ' from roles';
        sql := sql + ' where roles.id_role = ' + VarToStr(KeyValue);
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
    FRoleID := KeyValue;
    FRoleName := queryRes.FieldByName('name').AsString;
    FRoleFullName := queryRes.FieldByName('full_name').AsString;
     // Если отбор был самостоятельный
    if Assigned(FDataQuery) then
    begin
        FDataQuery.Free;
        FDataQuery := nil;
    end;
    Result := true;
end;

function TRole.Insert: Boolean;
var
    stprInsRole: TIBStoredProc;
begin
    Result := false;
    stprInsRole := TIBStoredProc.Create(nil);
    stprInsRole.Database := FConnection;
    stprInsRole.Transaction := FInputTransaction;
    stprInsRole.StoredProcName := 'INSERT_ROLE';

    StartInputTransaction;
    try
        stprInsRole.Prepare;
        stprInsRole.ParamByName('pname').AsString := FRoleName;
        stprInsRole.ParamByName('pfull_name').AsString := FRoleFullName;
        stprInsRole.ExecProc;
        CommitInputTransaction;
    except
        on Exception do
        begin
            RollbackInputTransaction;
            Exit;
        end;
    end;
    FRoleID := stprInsRole.ParamByName('pid_role').AsInteger;
    stprInsRole.Free;
    Result := true;
end;

function TRole.CheckPermission(ObjectID, ActionID: Integer): Boolean;
var
    queryCheckPermission: TIBQuery;
    sql: string;
begin
    Result := false;

    queryCheckPermission := TIBQuery.Create(nil);
    queryCheckPermission.Database := FConnection;
    queryCheckPermission.Transaction := FConnection.DefaultTransaction;
    sql := 'select * from permissions where id_object = ' + IntToStr(ObjectID) +
        ' and id_action = ' + IntToStr(ActionID) + ' and id_role = ' + IntToStr(FRoleID);
    queryCheckPermission.SQL.Text := sql;

    try
        queryCheckPermission.Open;
    except
        on Exception do
        begin
                //!
            Exit;
        end;
    end;
    if queryCheckPermission.RecordCount > 0 then Result := true;
    queryCheckPermission.Free;
end;

procedure TRole.NewRole(Name, FullName: string; ID: Integer);
begin
    FRoleID := ID;
    FRoleName := Name;
    FRoleFullName := FullName;
end;

function TRole.Update: Boolean;
var
    sqlUpdRole: TIBSQL;
    sql: string;
begin
    Result := false;
    sqlUpdRole := TIBSQL.Create(nil);
    sqlUpdRole.Database := FConnection;
    sqlUpdRole.Transaction := FInputTransaction;
    sql := 'update roles set ' +
        'name = ''' + FRoleName + ''', ' +
        'full_name = ''' + FRoleFullName + ''' ' +
        'where id_role = ' + IntToStr(FRoleID);
    sqlUpdRole.SQL.Text := sql;

    StartInputTransaction;
    try
        sqlUpdRole.ExecQuery;
        CommitInputTransaction;
    except
        on Exception do
        begin
            RollbackInputTransaction;
            Exit;
        end;
    end;
    sqlUpdRole.Free;
    Result := true;
end;

end.
