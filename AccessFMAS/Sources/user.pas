unit User;

interface

uses Windows, Messages, SysUtils, Classes, IBQuery, IBSQL, IBDatabase, Db, IBStoredProc,
    Dbun, Variants, Dialogs;

type
    TUser = class(TDbunObject)
    private
        FUserName: string;
        FUserFullName: string;
        FPassword: string;
        FPasswordHash: string;
        FUserID: Integer;
        FUserIDExt: Integer;
        FNote :string;
        FEMAIL : string;
    public
        FUseMD5 : Boolean;
        property UserName: string read FUserName write FUserName;
        property UserFullName: string read FUserFullName write FUserFullName;
        property UserID: Integer read FUserID write FUserID;
        property Password: string read FPassword write FPassword;
        property UserIDExt: Integer read FUserIDExt write FUserIDExt;
        property Note:String read FNote write FNote;
        property EMAIL:String read FEMAIL write FEMAIL;

        function FillDataBy(KeyValue: Variant): Boolean; override;
        function FillDataByAuth(Name, Passwd: string): Boolean;
        function Insert: Boolean; override;
        function Update: Boolean; override;
        function Delete: Boolean; override;

        function AddUserToRole(RoleID: Integer): Boolean;
        function DelUserFromRole(RoleID: Integer): Boolean;
        function IsUserInRole(RoleID: Integer): Boolean;
        procedure NewUser(theUserName, theFullName, thePassword, theNote, theEMAIL: string; ExtID: Integer; ID: Integer = -1);
        constructor Create(AOwner: TComponent; AConnection: TIBDatabase; Query: TIBQuery = nil); override;
    end;

implementation

{ TUser }

constructor TUser.Create(AOwner: TComponent; AConnection: TIBDatabase;
    Query: TIBQuery);
begin
    inherited;
    FUserName := '';
    FUserFullName := '';
    FPassword := '';
    FUserID := -1;
    FNote := '';
    FEMAIl := '';
end;

function TUser.FillDataBy(KeyValue: Variant): Boolean;
var
    sql: string;
    queryRes: TIBQuery;
begin
    Result := false;
    if not Assigned(FDataQuery) then
    begin
        FDataQuery := TIBQuery.Create(nil);
        FDataQuery.Transaction := Connection.DefaultTransaction;

        sql := 'select *' +
            ' from USERS' +
            ' where id_user = ' + VarToStr(KeyValue);
        FDataQuery.SQL.Text := sql;
        try
            FDataQuery.Open;
        except
            on E:Exception do
            begin
                MessageDlg('Виникла помилка:"' +
                            e.Message + '"', mtError, [mbOk], 0);
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

    FUserID := KeyValue;

    FUserName := queryRes.FieldByName('name').AsString;
    FUserFullName := queryRes.FieldByName('full_name').AsString;
    FPassword   := queryRes.FieldByName('passwd').AsString;
    FUserIDExt  := queryRes.FieldByName('id_user_ext').AsInteger;
    if queryRes['NOTE'] <> Null
     then FNOte := queryRes['NOTE']
     else FNOte := '';

    if queryRes['EMAIL'] <> Null
     then FEMAIL := queryRes['EMAIL']
     else FEMAIL := '';

  // Если отбор был самостоятельный
  if Assigned(FDataQuery) then FDataQuery.Free;
  Result := true;
end;

procedure TUser.NewUser(theUserName, theFullName, thePassword, theNote, theEMAIL: string; ExtID: Integer; ID: Integer = -1);
begin
    FUserID := ID;
    FUserName := theUserName;
    FPassword := thePassword;
    FUserFullName := theFullName;
    FUserIDExt := ExtID;
    FNote := theNote;
    FEMAIL := theEMAIL;
end;

function TUser.AddUserToRole(RoleID: Integer): Boolean;
var
    sqlInsUserToRole: TIBSQL;
    sql: string;
begin
    Result := false;
    if IsUserInRole(RoleID) then Exit;

    sqlInsUserToRole := TIBSQL.Create(nil);
    sqlInsUserToRole.Database := FConnection;
    sqlInsUserToRole.Transaction := FInputTransaction;
    sql := 'insert into users_roles (id_role, id_user) values (' +
        IntToStr(RoleID) + ', ' + IntToStr(FUserID) + ')';
    sqlInsUserToRole.SQL.Text := sql;

    StartInputTransaction;
    try
        sqlInsUserToRole.ExecQuery;
        CommitInputTransaction;
    except
        on E:Exception do
        begin
            MessageDlg('Виникла помилка:"' +
                            e.Message + '"', mtError, [mbOk], 0);        
            RollbackInputTransaction;
            Exit;
        end;
    end;
    sqlInsUserToRole.Free;
    Result := true;
end;

function TUser.Insert: Boolean;
var
    stprInsUser: TIBStoredProc;
begin
    Result := false;

    stprInsUser := TIBStoredProc.Create(nil);
    stprInsUser.Database := FConnection;
    stprInsUser.Transaction := FInputTransaction;
    stprInsUser.StoredProcName := 'INSERT_USER';

    StartInputTransaction;
    try
        stprInsUser.Prepare;
        stprInsUser.ParamByName('ppasswd').AsString := FPassword;
        stprInsUser.ParamByName('pname').AsString := FUserName;
        stprInsUser.ParamByName('pfull_name').AsString := FUserFullName;
        stprInsUser.ParamByName('pid_user_ext').AsInteger := FUserIDExt;

        stprInsUser.ExecProc;
        CommitInputTransaction;
    except
        on E:Exception do
        begin
            MessageDlg('Виникла помилка:"' +
                            e.Message + '"', mtError, [mbOk], 0);
            RollbackInputTransaction;
            Exit;
        end;
    end;
    FUserID := stprInsUser.ParamByName('pid_user').AsInteger;
    stprInsUser.Free;
    Result := true;
end;

function TUser.Update: Boolean;
var
    sqlUpdUser: TIBSQL;
    sql: string;
begin
    Result := false;

    sqlUpdUser := TIBSQL.Create(nil);
    sqlUpdUser.Database := FConnection;
    sqlUpdUser.Transaction := FInputTransaction;
    sql := 'update users set ' +
        'name = ''' + FUserName + ''', ' +
        'full_name = ''' + FUserFullName + ''', ' +
        'passwd = ''' + FPassword + ''', ' +
        'id_user_ext = ' + IntToStr(FUserIDExt) + ' ' +
        'where id_user = ' + IntToStr(FUserID);
    sqlUpdUser.SQL.Text := sql;

    StartInputTransaction;
    try
        sqlUpdUser.ExecQuery;
        CommitInputTransaction;
    except
        on E:Exception do
        begin
            MessageDlg('Виникла помилка:"' +
                            e.Message + '"', mtError, [mbOk], 0);
            RollbackInputTransaction;
            Exit;
        end;
    end;
    sqlUpdUser.Free;
    Result := true;
end;

function TUser.Delete: Boolean;
begin
    Result := false;
end;

function TUser.IsUserInRole(RoleID: Integer): Boolean;
var
    queryInRole: TIBQuery;
    sql: string;
begin
    Result := false;
    queryInRole := TIBQuery.Create(nil);
    queryInRole.Database := FConnection;
    queryInRole.Transaction := FConnection.DefaultTransaction;
    sql := 'select * from users_roles where id_user = ' + IntToStr(FUserID) +
        ' and id_role = ' + IntToStr(RoleID);
    queryInRole.SQL.Text := sql;

    try
        queryInRole.Open;
    except
        on E:Exception do
        begin
            MessageDlg('Виникла помилка:"' +
                            e.Message + '"', mtError, [mbOk], 0);
            Exit;
        end;
    end;
    if queryInRole.RecordCount > 0 then Result := true;
    queryInRole.Free;
end;

function TUser.DelUserFromRole(RoleID: Integer): Boolean;
var
    sqlDelUserFromRole: TIBSQL;
    sql: string;
begin
    Result := false;
    if not IsUserInRole(RoleID) then Exit;

    sqlDelUserFromRole := TIBSQL.Create(nil);
    sqlDelUserFromRole.Database := FConnection;
    sqlDelUserFromRole.Transaction := FInputTransaction;
    sql := 'delete from users_roles where id_role = ' + IntToStr(RoleID) +
        ' and id_user = ' + IntToStr(FUserID);
    sqlDelUserFromRole.SQL.Text := sql;

    StartInputTransaction;
    try
        sqlDelUserFromRole.ExecQuery;
        CommitInputTransaction;
    except
        on e:Exception do
        begin
            MessageDlg('Виникла помилка:"' +
                            e.Message + '"', mtError, [mbOk], 0);
            RollbackInputTransaction;
            Exit;
        end;
    end;
    sqlDelUserFromRole.Free;
    Result := true;
end;

function TUser.FillDataByAuth(Name, Passwd: string): Boolean;
var
    sql: string;
    queryRes: TIBQuery;
    StrMD5:function (Buffer : shortString): shortstring; stdcall;
    DLLInstance:THandle;
begin
    Result := false;
    if not Assigned(FDataQuery) then
    begin
        FDataQuery := TIBQuery.Create(nil);
        FDataQuery.Transaction := Connection.DefaultTransaction;

        if FUseMD5
        then begin

                  if FileExists('Md5dll.dll')
                  then begin
                            DLLInstance := LoadLibrary('Md5dll.dll');
                            @StrMD5  :=GetProcAddress(DLLInstance, 'StrMD5');
                  end;
                  FPasswordHash := StrMD5(Passwd);
        end;

            if not FUseMD5 then
                sql := 'select *' +
                    ' from ACCESS_USER_SELECT ' +
                    ' where name = ''' + Name + ''' and passwd = ''' + Passwd + ''''
            else
                sql := 'select *' +
                    ' from ACCESS_USER_SELECT ' +
                    ' where name = ''' + Name + ''' and passwd_md5_hash = ''' + FPasswordHash + '''';

        FDataQuery.SQL.Text := sql;
        try
            FDataQuery.Open;
        except
            on E: Exception do
            begin
                MessageDlg('Виникла помилка:"' +
                            e.Message + '"', mtError, [mbOk], 0);
                sql := e.Message;
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
    FUserID := queryRes.FieldByName('id_user').AsInteger;
    FUserName := queryRes.FieldByName('name').AsString;
    FUserFullName := queryRes.FieldByName('full_name').AsString;
    FPassword := queryRes.FieldByName('passwd').AsString;
    FUserIDExt := queryRes.FieldByName('id_user_ext').AsInteger;

     // Если отбор был самостоятельный
    if Assigned(FDataQuery) then FDataQuery.Free;
    Result := true;
end;


end.

