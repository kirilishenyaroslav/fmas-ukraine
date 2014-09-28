unit AccessObject;

interface

uses Windows, Messages, SysUtils, Classes, IBQuery, IBSQL, IBDatabase, Db, Action, IBStoredProc;

type
    TAccessObject = class(TComponent)
    private
        dbConnection: TIBDatabase;
        transInput: TIBTransaction;
        transOutput: TIBTransaction;
        queryData: TIBQuery;

        FObjectName: string;
        FObjectFullName: string;
        FParentObjectID: Integer;
        FObjectID: Integer;
        FId_system :Integer;
    public
        queryDataActions: TIBQuery;
        bCloseQuery: Boolean;
        property ObjectName: string read FObjectName write FObjectName;
        property ObjectFullName: string read FObjectFullName write FObjectFullName;
        property ObjectID: Integer read FObjectID write FObjectID;
        property ParentObjectID: Integer read FParentObjectID write FParentObjectID;
        property Id_system: Integer read FId_system write FId_system;

        constructor Create(db: TIBDatabase; Data: TIBQuery = nil);
        destructor Destroy; override;
        function FillDataByID(ID: Integer): Boolean;
        function FillDataByName(Name: string; ParentID: Integer = 0): Boolean;
        procedure NewObject(Name, FullName: string;Id_system:Integer=-1 ;ParentID: Integer = -1);

        function InsertObject(var str: string): Boolean;
        function UpdateObject(var str: string): Boolean;
        function DeleteObject: Boolean;
        function DeleteAction(ActionID: Integer): Boolean;
    end;

implementation

{ TAccessObject }

constructor TAccessObject.Create(db: TIBDatabase; Data: TIBQuery = nil);
begin
    dbConnection := db;
    queryData := Data;

    FObjectID := -1;
    FParentObjectID := -1;
    FObjectName := '';
    FObjectFullName := '';
    bCloseQuery := false;

    transInput := TIBTransaction.Create(nil);
    transInput.DefaultDatabase := dbConnection;
    transInput.Params.Add('read_committed');
    transInput.Params.Add('rec_version');
    transInput.Params.Add('nowait');

    transOutput := TIBTransaction.Create(nil);
    transOutput.DefaultDatabase := dbConnection;
    transOutput.Params.AddStrings(transInput.Params);
    transOutput.StartTransaction;
end;

destructor TAccessObject.Destroy;
begin
    if Assigned(queryData) then
    begin
        queryData.Close;
        queryData.Free;
    end;
    if transOutput.InTransaction then transOutput.Commit;
    if transInput.InTransaction then transInput.Commit;

    transOutput.Free;
    transInput.Free;
end;

function TAccessObject.FillDataByID(ID: Integer): Boolean;
var
    sql: string;
begin
    Result := false;
    if not Assigned(queryData) then
    begin
        queryData := TIBQuery.Create(nil);
        queryData.Transaction := transOutput;

        sql := 'select first1 *' +
            ' from objects' +
            ' where objects.id_object=' + IntToStr(ID);
        queryData.SQL.Text := sql;
        try
            queryData.Open;
        except
            on exc: Exception do
            begin
                     //!
                Exit;
            end;
        end;
    end;
     // Получаем данные об объекте
    FObjectID := ID;
    FParentObjectID := queryData.FieldByName('id_parent').AsInteger;
    FObjectName := queryData.FieldByName('name').AsString;
    FObjectFullName := queryData.FieldByName('full_name').AsString; ;
    if bCloseQuery then queryData.Close;
    Result := true;
end;

// Создание нового объекта

procedure TAccessObject.NewObject(Name, FullName: string;Id_system:Integer=-1; ParentID: Integer = -1);
begin
    if Assigned(queryData) then queryData.Close;
    FObjectID := -1;
    FParentObjectID := ParentID;
    FObjectName := Name;
    FObjectFullName := FullName;
    FId_system      :=Id_system;
end;

// Вставка нового объекта

function TAccessObject.InsertObject(var str: string): Boolean;
var
    stprInsObject: TIBStoredProc;
begin
    Result := false;
    if FParentObjectID < 0 then Exit;
    stprInsObject := TIBStoredProc.Create(nil);
    stprInsObject.Database := dbConnection;
    stprInsObject.Transaction := transInput;
    stprInsObject.StoredProcName := 'INSERT_OBJECT_EX';

    transInput.StartTransaction;
    try
              stprInsObject.Prepare;
              stprInsObject.ParamByName('pid_parent').AsInteger := FParentObjectID;
              stprInsObject.ParamByName('pname').AsString := FObjectName;
              stprInsObject.ParamByName('pfull_name').AsString := FObjectFullName;
              stprInsObject.ParamByName('pid_sys').AsInteger := FId_system;
              stprInsObject.ExecProc;
              transInput.Commit;
    except
          on E:Exception do
              begin
                  str:=E.Message;
                  transInput.Rollback; Exit;
              end;
    end;
    FObjectID := stprInsObject.ParamByName('pid_object').AsInteger;
    stprInsObject.Free;
    Result := true;
end;

// Обновление объекта

function TAccessObject.UpdateObject(var str: string): Boolean;
var
    sqlUpdObject: TIBSQL;
    sql: string;
begin
    Result := false;
    if FParentObjectID < 0 then Exit;
    sqlUpdObject := TIBSQL.Create(nil);
    sqlUpdObject.Database := dbConnection;
    sqlUpdObject.Transaction := transInput;
    sql := 'update objects set ' +
        ' id_parent = ' + IntToStr(FParentObjectID) + ', ' +
        ' name = ''' + FObjectName + ''', ' +
        ' full_name = ''' + FObjectFullName + ''''+', ' +
        ' id_sys =    '+IntToStr(FId_system)+
        ' where id_object = ' + IntToStr(FObjectID);
    sqlUpdObject.SQL.Text := sql;

    transInput.StartTransaction;
    try
        sqlUpdObject.ExecQuery;
        transInput.Commit;
    except
          on E:Exception do
              begin
                  str:=E.Message;
                  transInput.Rollback; Exit;
              end;
    end;
    sqlUpdObject.Free;
    Result := true;
end;

function TAccessObject.DeleteObject: Boolean;
begin
     //
    Result := false;
end;

function TAccessObject.DeleteAction(ActionID: Integer): Boolean;
var
    sqlDelActionFromObj: TIBSQL;
    sql: string;
    theAction: TObjectAction;
begin
    Result := false;
    theAction := TObjectAction.Create(Self, dbConnection);
    if theAction.FillDataBy(ActionID) and
        theAction.DeleteFromObject(FObjectID) then Result := true;
    theAction.Free;
end;

function TAccessObject.FillDataByName(Name: string;
    ParentID: Integer): Boolean;
var
    sql: string;
begin
    Result := false;
    if not Assigned(queryData) then
    begin
        queryData := TIBQuery.Create(nil);
        queryData.Transaction := transOutput;
    end else queryData.Close;

    sql := 'select first 1 *' +
        ' from objects' +
        ' where objects.name=''' + Trim(Name) + ''' and id_parent=' + IntToStr(ParentID);
    queryData.SQL.Text := sql;
    try
        queryData.Open;
    except
        on exc: Exception do
        begin
                //!
            Exit;
        end;
    end;
    if queryData.RecordCount <= 0 then Exit;
     // Получаем данные об объекте
    FObjectID := queryData.FieldByName('id_object').AsInteger;
    FParentObjectID := ParentID;
    FObjectName := Trim(Name);
    FObjectFullName := queryData.FieldByName('full_name').AsString; ;
    Result := true;
end;

end.

