 {Изменения внесены}

unit accmgmt;

interface

uses
    Windows,
    SysUtils,
    Classes,
    IBDatabase,
    IBQuery,
    IBStoredProc,
    IniFiles,
    Dbun,
    Action,
    AccessObject,
    FibDatabase,
    pFibDatabase,
    Role,
    User,
    Dialogs,
    ib_externals,
    ibexternals,
    Ibase,
    FIBDataSet,
    pFIBDataSet,
    FIBQuery,
    pFIBQuery,
    pFIBStoredProc,
    Forms;



type TUserInfo=record
     UserID       : Integer;
     UserName     : String;
     UserFullName : String;
     Password     : String;
     UserIDExt    : Integer;
     end;

     TResultInfo=record
     DBHandle  :TISC_DB_HANDLE;
     ErrorCode :Integer;
     end;

const
    ACCMGMT_ERR_BASE = 0;
    ACCMGMT_OK = ACCMGMT_ERR_BASE;
    ACCMGMT_ERR_UNKNOWN = ACCMGMT_ERR_BASE - 1;
    ACCMGMT_ERR_BAD_SYSTEM_INI = ACCMGMT_ERR_BASE - 2;
    ACCMGMT_ERR_OPEN_CONNECTION = ACCMGMT_ERR_BASE - 3;
    ACCMGMT_ERR_BAD_PATH = ACCMGMT_ERR_BASE - 4;
    ACCMGMT_ERR_INSERT_OBJECT = ACCMGMT_ERR_BASE - 5;
    ACCMGMT_ERR_UPDATE_OBJECT = ACCMGMT_ERR_BASE - 6;
    ACCMGMT_ERR_GET_OBJECT = ACCMGMT_ERR_BASE - 7;
    ACCMGMT_ERR_INSERT_ACTION = ACCMGMT_ERR_BASE - 8;
    ACCMGMT_ERR_UPDATE_ACTION = ACCMGMT_ERR_BASE - 9;
    ACCMGMT_ERR_GET_ACTION = ACCMGMT_ERR_BASE - 10;
    ACCMGMT_ERR_INSERT_ACTION_IN_OBJECT = ACCMGMT_ERR_BASE - 11;
    ACCMGMT_ERR_AUTH = ACCMGMT_ERR_BASE - 12;
    ACCMGMT_ERR_CHECK_PER_QUERY_ROLE = ACCMGMT_ERR_BASE - 13;
    ACCMGMT_ERR_CHECK_PER_DENY = ACCMGMT_ERR_BASE - 14;
    ACCMGMT_ERR_INSERT_ROLE = ACCMGMT_ERR_BASE - 15;
    ACCMGMT_ERR_UPDATE_ROLE = ACCMGMT_ERR_BASE - 16;
    ACCMGMT_ERR_GET_ROLE = ACCMGMT_ERR_BASE - 17;
    ACCMGMT_ERR_ACTION_ALREADY_EXISTS = ACCMGMT_ERR_BASE - 18;
    ACCMGMT_ERR_ACTION_IN_OBJECT = ACCMGMT_ERR_BASE - 19;
    ACCMGMT_ERR_OBJECT_ALREADY_EXISTS = ACCMGMT_ERR_BASE - 20;
    ACCMGMT_ERR_DB_NOT_CONNECTED = ACCMGMT_ERR_BASE - 21;
    ACCMGMT_ERR_ALREADY_NOT_CONNECTED = ACCMGMT_ERR_BASE - 22;
    ACCMGMT_ERR_USER_NOT_FOUND = ACCMGMT_ERR_BASE - 23;

// Инициализация соединения с БД СУД
function InitConnection(pLogin, pPassword: string): Integer; stdcall;
function fibInitConnection(pLogin, pPassword: string): TResultInfo; stdcall;
function fibInitImageConnection(pLogin, pPassword: string): TResultInfo; stdcall;
function fibGetCurrentDBPath:string;stdcall;
function fibGetCurrentUserInfo: TUserInfo; stdcall;

// Разрыв соединения и освобождение ресурсов
function CloseConnection: Integer; stdcall;
// Возвращает идентификатор объекта по его пути
function GetObjectByPath(pPath: string): Integer; stdcall;
// Возвращает атрибуты объекта по его пути
function GetObjectData(var pName, pFullName: ShortString; pPath: string): Integer; stdcall;
// Функция возвращает внешний ключ текущего пользователя (id_pcard)
function GetCurrentUserIDExt: Integer; stdcall;
// Добавляет объект в указанную ветку (путь)
function AddObject(pParent, pName, pFullName: string): Integer; stdcall;
// Редактирует указанный (путём) объект
function EditObject(pObject, pNewName, pNewFullName: string): Integer; stdcall;
// Добавляет действие
function AddAction(pName, pFullName: string): Integer; stdcall;
// Редактирует действие
function EditAction(pAction, pNewName, pNewFullName: string): Integer; stdcall;
// Добавляет действие в объект
function AddActionToObject(pObject, pAction: string): Integer; stdcall;
// Проверяет наличие разрешения для указанного объекта и его действия, для текущего пользователя
function CheckPermission(pObject, pAction: string): Integer; stdcall;
function fibCheckPermission(pObject, pAction: string): Integer; stdcall;
function CheckUserInfo(pIdUser:Int64; pass:AnsiString): Boolean; stdcall;

function GetUserId: Integer; stdcall;

function GetUserFIO: string; stdcall;

function GetUserIdMan: Int64; stdcall;

procedure InitializeDefaultUserInfo; stdcall;

// Преобразует код ошибки в текстовое сообщение.
// Функция реализована в данном модуле, чтобы была
// возможность перевести сообщения на др. язык
function AcMgmtErrMsg(ErrCode: Integer): string;




exports
InitConnection,
fibInitConnection,
fibInitImageConnection,
fibGetCurrentDBPath,
fibGetCurrentUserInfo,
CloseConnection,
GetObjectByPath,
GetObjectData,
GetCurrentUserIDExt,
AddObject,
EditObject,
AddAction,
EditAction,
AddActionToObject,
CheckPermission,
fibCheckPermission,
CheckUserInfo,
GetUserId,
GetUserFIO,
GetUserIdMan,
InitializeDefaultUserInfo,
AcMgmtErrMsg;




implementation

uses sys_Connect_Log, Kistory;

var
    UserInfo              :TUserInfo;
    FConnection           :TIBDatabase;
    FDefaultTransaction   :TIBTransaction;

    fibFConnection        :TpFibDataBase;
    fibFDefaultTransaction:TpFibTransaction;

    fibImageFConnection        :TpFibDataBase;
    fibImageFDefaultTransaction:TpFibTransaction;

    FUser                 :TUser;
    UseMD5                :Boolean;

    fibDatabaseConnected  :Boolean;
    fibImageDatabaseConnected  :Boolean;

    DB_PATH               :String;
    DB_SERVER             :String;
    DB_USER               :String;
    DB_PASSWORD           :String;


function PwdDeCrypt_(pwd:string):string;
var DLLInstance : THandle;
    PwdDeCrypt  : procedure(var Buffer:LPTSTR; var Len:UINT); stdcall;
    Res:string;
    Res_PC:PChar;
    Len:UINT;
begin
    Res:='';
    //Загружаем библиотеку с алгоритом расшифровки пароля
    if FileExists('PwdCrypt.dll')
    then begin
              Res_PC:=PChar(pwd);
              Len   :=Length(pwd);
              DLLInstance := LoadLibrary('PwdCrypt.dll');
              @PwdDeCrypt  :=GetProcAddress(DLLInstance, 'PwdDeCrypt');
              PwdDeCrypt(Res_PC,Len);
              SetString(Res,Res_PC,Len);
    end
    else ShowMessage('Файл PwdCrypt.dll не знайдено!');

    Result:=Res;
end;


procedure InitializeDefaultUserInfo;
begin
       UserInfo.UserID:=-1;
       UserInfo.UserName:='Системный пользователь';
       UserInfo.UserFullName:='Системный пользователь';
       UserInfo.Password:='';
       UserInfo.UserIDExt:=-1;
end;


function fibGetCurrentUserInfo: TUserInfo;
var Res:TUserInfo;
begin
      if Assigned(fibFConnection)
      then begin
                Res:=UserInfo;
      end;
      Result:=Res;
end;

function fibGetCurrentDBPath:string;
var Res:String;
begin
     if Assigned(fibFConnection)
     then Res:=fibFConnection.DatabaseName
     else Res:='DB not assigned';

     Result:=res;
end;

function AcMgmtErrMsg(ErrCode: Integer): string;
var
    cMsg: string;
begin
    Result := '';
    if ErrCode > ACCMGMT_OK then Exit;
    case ErrCode of
        ACCMGMT_OK: cMsg := 'Команду виконано';
        ACCMGMT_ERR_UNKNOWN: cMsg := 'Невірний логін або пароль';
        ACCMGMT_ERR_BAD_SYSTEM_INI: cMsg := 'Файл config.ini відсутній, або не заповнений';
        ACCMGMT_ERR_OPEN_CONNECTION: cMsg := 'Помилка при з`єднанні';
        ACCMGMT_ERR_BAD_PATH: cMsg := 'Шлях до об`єкту хибний';
        ACCMGMT_ERR_INSERT_OBJECT: cMsg := 'Помилка при додаванні об`єкту';
        ACCMGMT_ERR_UPDATE_OBJECT: cMsg := 'Помилка при оновленні ';
        ACCMGMT_ERR_GET_OBJECT: cMsg := 'Помилка при пошуку об`єкту';
        ACCMGMT_ERR_INSERT_ACTION: cMsg := 'Помилка при додаванні дії';
        ACCMGMT_ERR_UPDATE_ACTION: cMsg := 'Помилка при оновленні дії';
        ACCMGMT_ERR_GET_ACTION: cMsg := 'Помилка при пошуку дії';
        ACCMGMT_ERR_INSERT_ACTION_IN_OBJECT: cMsg := 'Помилка при додаванні дії до об`єкту';
        ACCMGMT_ERR_AUTH: cMsg := 'Невірне ім`я або пароль';
        ACCMGMT_ERR_CHECK_PER_QUERY_ROLE: cMsg := 'Помилка при відборі груп';
        ACCMGMT_ERR_CHECK_PER_DENY: cMsg := 'Доступ заборонено';
        ACCMGMT_ERR_INSERT_ROLE: cMsg := 'Помилка при додаванні групи';
        ACCMGMT_ERR_UPDATE_ROLE: cMsg := 'Помилка при оновленні групи';
        ACCMGMT_ERR_GET_ROLE: cMsg := 'Помилка при пошуку групи';
        ACCMGMT_ERR_ACTION_ALREADY_EXISTS: cMsg := 'Ця дія вже існує';
        ACCMGMT_ERR_ACTION_IN_OBJECT: cMsg := 'Цю дію вже додано до об`єкту';
        ACCMGMT_ERR_OBJECT_ALREADY_EXISTS: cMsg := 'Цей об`єкт вже існує';
        ACCMGMT_ERR_DB_NOT_CONNECTED: cMsg := 'Нема зв`язку з базою даних';
        ACCMGMT_ERR_ALREADY_NOT_CONNECTED: cMsg := 'З`єднання з базою даних вже встановлено';
        ACCMGMT_ERR_USER_NOT_FOUND: cMsg := 'Користувача с такими настройками не існує';

    end;
    Result := cMsg;
end;

function DatabaseConnected: Boolean;
begin
    Result := false;
    if Assigned(FConnection) and FConnection.Connected then Result := true;
end;

function GetObjectByPath(pPath: string): Integer; stdcall;
var
    thePath: string;
    theBranch: string;
    DelimPos, ParentID: Integer;
    accObj: TAccessObject;
begin
    //Result := ACCMGMT_ERR_UNKNOWN;
    if not DatabaseConnected then
    begin
        Result := ACCMGMT_ERR_DB_NOT_CONNECTED;
        Exit
    end;
    ParentID := 0;
    thePath := pPath;
    accObj := TAccessObject.Create(FConnection);
    if Copy(thePath, 1, 1) = '/' then Delete(thePath, 1, 1);
    if Copy(thePath, Length(thePath), 1) <> '/' then thePath := thePath + '/';

    DelimPos := Pos('/', thePath);
    while DelimPos <> 0 do
    begin
        theBranch := Trim(Copy(thePath, 1, DelimPos - 1));
        if not accObj.FillDataByName(theBranch, ParentID) then
        begin
            Result := ACCMGMT_ERR_BAD_PATH;
            accObj.Free;
            Exit;
        end;
        ParentID := accObj.ObjectID;

        Delete(thePath, 1, DelimPos - 1);
        if Copy(thePath, 1, 1) = '/' then Delete(thePath, 1, 1);
        DelimPos := Pos('/', thePath);
    end;
    accObj.Free;
    Result := ParentID;
end;

function GetCurrentUserIDExt: Integer;
begin
    Result := ACCMGMT_ERR_UNKNOWN;

    if Assigned(FConnection)
    then begin
              if not DatabaseConnected
              then begin
                        Result := ACCMGMT_ERR_DB_NOT_CONNECTED;
                        Exit
              end
              else begin
                        Result := FUser.UserIDExt;
                        Exit
              end;
    end;
    if Assigned(fibFConnection)
    then begin
                 if not fibFConnection.Connected
                 then begin
                           Result := ACCMGMT_ERR_DB_NOT_CONNECTED;
                           Exit
                 end
                 else begin
                           Result   :=UserInfo.UserIDExt;
                           Exit
                 end;
    end;
end;

function GetObjectData(var pName, pFullName: ShortString; pPath: string): Integer; stdcall;
var
    accObj: TAccessObject;
    ID: Integer;
begin
    //Result := ACCMGMT_ERR_UNKNOWN;
    if not DatabaseConnected then
    begin
        Result := ACCMGMT_ERR_DB_NOT_CONNECTED;
        Exit
    end;
    ID := GetObjectByPath(pPath);
    if ID < 0 then
    begin
        Result := ID;
        Exit;
    end;
    accObj := TAccessObject.Create(FConnection);
    if not accObj.FillDataByID(ID) then
    begin
        Result := ACCMGMT_ERR_GET_OBJECT;
        accObj.Free;
        Exit;
    end;
    pName := accObj.ObjectName;
    pFullName := accObj.ObjectFullName;
    accObj.Free;
    Result := ACCMGMT_OK;
end;

function CloseConnection: Integer;
var
 i : integer;
begin
     Result := ACCMGMT_ERR_UNKNOWN;

     if Assigned(fibFConnection)
     then begin
              if Assigned(fibFDefaultTransaction)
              then begin

                        if fibFDefaultTransaction.Active
                        then fibFDefaultTransaction.Rollback;

                        if fibFConnection.Connected then begin
                         for i := 0 to fibFConnection.TransactionCount - 1 do
                         if fibFConnection.Transactions[i].InTransaction then begin
                          fibFConnection.Transactions[i].Rollback;
                          fibFConnection.Transactions[i].Free;
                         end;
                         fibFConnection.ForceCloseTransactions;

                         //ShowMessage(IntToStr(fibFConnection.ActiveTransactionCount));
                         fibFConnection.Close;
                        end;

                        fibFDefaultTransaction.Free;
                        fibFDefaultTransaction:= nil;
              end;
              if Assigned(fibFConnection)
              then begin
                        fibFConnection.Free;
                        fibFConnection := nil;
              end;
              UserInfo.UserID:=0;
              UserInfo.UserName:='';
              UserInfo.UserFullName:='';
              UserInfo.Password:='';
              UserInfo.UserIDExt:=0;
     end;
     
     if Assigned(FConnection)
     then begin
                if not DatabaseConnected
                then begin
                          Result := ACCMGMT_ERR_DB_NOT_CONNECTED;
                          Exit
                end;

                if Assigned(FConnection)
                then begin
                          FConnection.Close;
                          FConnection.Free;
                          FConnection := nil;
                end;
                if Assigned(FDefaultTransaction)
                then begin
                          if FDefaultTransaction.Active
                          then FDefaultTransaction.Rollback;
                          FDefaultTransaction.Free;
                          FDefaultTransaction := nil;
                end;
                if Assigned(FUser)
                then begin
                          FUser.Free;
                          FUser := nil;
                end;
     end;
     Result := ACCMGMT_OK;
end;


function ReadIniFile(is_image:Boolean=false):boolean;
var
    IniFile : TIniFile;
    APP_PATH: String;
begin
              IniFile:=nil;
              APP_PATH := ExtractFileDir(Application.ExeName) + '\';
              if not FileExists(APP_PATH + 'config.ini')
              then begin
                        MessageBox(Application.Handle,'Не знайдено config.ini!',PChar('Помилка!'),MB_OK and MB_ICONERROR);
                        ReadIniFile:=false;
              end
              else begin
                        try
                                IniFile        := TIniFile.Create(APP_PATH + 'config.ini');

                                if not is_image
                                then begin
                                          DB_PATH        := IniFile.ReadString('CONNECTION', 'Path', DB_PATH);
                                          DB_SERVER      := IniFile.ReadString('CONNECTION', 'Server', DB_SERVER);
                                          DB_USER        := IniFile.ReadString('CONNECTION', 'User', DB_USER);
                                          DB_PASSWORD    := PwdDeCrypt_(IniFile.ReadString('CONNECTION', 'Password_Crypted', DB_PASSWORD));
                                end
                                else begin
                                          DB_PATH        := IniFile.ReadString('IMAGE_CONNECTION', 'Path', DB_PATH);
                                          DB_SERVER      := IniFile.ReadString('IMAGE_CONNECTION', 'Server', DB_SERVER);
                                          DB_USER        := IniFile.ReadString('IMAGE_CONNECTION', 'User', DB_USER);
                                          DB_PASSWORD    := PwdDeCrypt_(IniFile.ReadString('IMAGE_CONNECTION', 'Password_Crypted', DB_PASSWORD));
                                end;


                                if (IniFile.ReadString('Params', 'UseMD5', 'F')='T')
                                then UseMD5    :=true else UseMD5    :=false;
                        finally
                                IniFile.Free;
                        end;
                        ReadIniFile:=true;
              end;
end;

function CheckUserInfo(pIdUser:Int64; pass:AnsiString): Boolean; stdcall;
var UserInfoQuery:TpFibDataSet;
    Res:Boolean;
    PasswordHash:String;
    StrMD5:function (Buffer : shortString): shortstring; stdcall;
    DLLInstance:THandle;
begin
    if FileExists('Md5dll.dll')
    then begin
              DLLInstance := LoadLibrary('Md5dll.dll');
              @StrMD5  :=GetProcAddress(DLLInstance, 'StrMD5');

              Res:=false;
              UserInfoQuery:=TpFibDataSet.Create(nil);
              UserInfoQuery.Database:=fibFConnection;
              UserInfoQuery.Transaction:=fibFDefaultTransaction;
              if not UseMD5
              then begin
                         UserInfoQuery.SelectSQL.Text:='select *' +
                                                       ' from ACCESS_USER_SELECT_EX(' + IntToStr(pIdUser)+')'+
                                                       ' where  passwd = ''' + Pass + '''';
              end
              else begin
                         PasswordHash := StrMD5(Pass);
                         UserInfoQuery.SelectSQL.Text:='select *' +
                                                       ' from ACCESS_USER_SELECT_EX(' + IntToStr(pIdUser)+')'+
                                                       ' where passwd_md5_hash = ''' + PasswordHash + '''';
              end;
              UserInfoQuery.Open;
              UserInfoQuery.FetchAll;
              if (UserInfoQuery.RecordCount>0)
              then begin
                         Res                   :=true;
              end;

              UserInfoQuery.Close;
              UserInfoQuery.Free;
              FreeLibrary(DLLInstance);
    end
    else begin
               Res:=false;
               ShowMessage('Не знайдено Md5dll.dll!');
    end;

    Result:=Res;
end;



function GetUserInfo(User,Password:String) :Boolean;
var UserInfoQuery:TpFibDataSet;
    Res:Boolean;
    PasswordHash:String;
    StrMD5:function (Buffer : shortString): shortstring; stdcall;
    DLLInstance:THandle;
begin
    if FileExists('Md5dll.dll')
    then begin
              DLLInstance := LoadLibrary('Md5dll.dll');
              @StrMD5  :=GetProcAddress(DLLInstance, 'StrMD5');

              Res:=false;
              UserInfoQuery:=TpFibDataSet.Create(nil);
              UserInfoQuery.Database:=fibFConnection;
              UserInfoQuery.Transaction:=fibFDefaultTransaction;
              if not UseMD5
              then begin
                         UserInfoQuery.SelectSQL.Text:='select *' +
                                                       ' from ACCESS_USER_SELECT' +
                                                       ' where name = ''' + user + ''' and passwd = ''' + Password + '''';
              end
              else begin
                         PasswordHash := StrMD5(Password);
                         UserInfoQuery.SelectSQL.Text:='select *' +
                                                       ' from ACCESS_USER_SELECT' +
                                                       ' where name = ''' + user + ''' and passwd_md5_hash = ''' + PasswordHash + '''';
              end;
              UserInfoQuery.Open;
              UserInfoQuery.FetchAll;
              if (UserInfoQuery.RecordCount>0)
              then begin
                         UserInfo.UserID       :=UserInfoQuery.FieldByName('id_user').AsInteger;
                         UserInfo.UserName     :=UserInfoQuery.FieldByName('name').AsString;
                         UserInfo.UserFullName :=UserInfoQuery.FieldByName('full_name').AsString;
                         UserInfo.Password     :=Password;
                         UserInfo.UserIDExt    :=UserInfoQuery.FieldByName('id_user_ext').AsInteger;
                         Res                   :=true;
              end;

              UserInfoQuery.Close;
              UserInfoQuery.Free;
    end
    else begin
               Res:=false;
               ShowMessage('Не знайдено Md5dll.dll!');
    end;
    Result:=Res;
end;

function fibInitImageConnection(pLogin, pPassword: string): TResultInfo; stdcall;
  var ResultStru:TResultInfo;
begin
     ResultStru.DBHandle :=nil;
     ResultStru.ErrorCode:=ACCMGMT_ERR_AUTH;

     fibImageDatabaseConnected:=false;
     if fibImageDatabaseConnected then
     begin
          //если пользователь уже ранее установил соединение то просто возвращаем хендл
          ResultStru.DBHandle := fibImageFConnection.Handle;
          ResultStru.ErrorCode:= ACCMGMT_ERR_AUTH;
          Exit
     end;
     if not Assigned(fibImageFConnection)
     then begin
             try
                     if ReadIniFile(true)
                     then begin
                                {Создаем экземпляр БД и читающей транзакции}
                                fibImageFDefaultTransaction                 := TpFibTransaction.Create(nil);

                                fibImageFConnection                         := TpFibDatabase.Create(nil);

                                fibImageFConnection.DefaultTransaction      := fibFDefaultTransaction;
                                fibImageFDefaultTransaction.DefaultDatabase := fibFConnection;
                                fibImageFConnection.SQLDialect              := 3;
                                fibImageFConnection.ConnectParams.CharSet   :='WIN1251';

                                fibImageFConnection.DBName                  := DB_SERVER+':'+DB_PATH;
                                fibImageFConnection.ConnectParams.UserName  := DB_USER;
                                fibImageFConnection.ConnectParams.Password  := DB_PASSWORD;

                                {Соединяемся с БД}
                                fibImageFConnection.Open;
                                fibImageFDefaultTransaction.StartTransaction;
                                StartConnHistory(fibImageFConnection.Handle);

                                ResultStru.DBHandle :=fibImageFConnection.Handle;
                                ResultStru.ErrorCode:=ACCMGMT_OK;
                     end
                     else begin
                                ResultStru.DBHandle:=nil;
                                ResultStru.ErrorCode:=ACCMGMT_ERR_BAD_SYSTEM_INI;
                     end;
             except
                    on exc: Exception do
                    begin
                          MessageDlg('При з`єднанні з БД у системі безпеки виникла помилка:"' +exc.Message + '"', mtError, [mbOk], 0);
                          fibImageFConnection.Free;
                          fibImageFDefaultTransaction.Free;
                          Exit;
                    end;
             end;
    end;

    if (ResultStru.DBHandle=nil)
    then begin
              if Assigned(fibImageFDefaultTransaction)
              then begin
                        if fibImageFDefaultTransaction.InTransaction
                        then fibImageFDefaultTransaction.Commit;

                        fibImageFDefaultTransaction.Free;
                        fibImageFDefaultTransaction:=nil;
              end;

              if Assigned(fibImageFConnection)
              then begin
                        fibImageFConnection.Free;
                        fibImageFConnection:=nil;
              end;
    end;

    Result := ResultStru;
end;


function fibInitConnection(pLogin, pPassword: string): TResultInfo; stdcall;
  var ResultStru:TResultInfo;
var
    CheckLic:procedure (db_h : PVoid); stdcall;
    DLLInstance:THandle;
begin
    if FileExists('Licence.dll')
    then begin
               DLLInstance := LoadLibrary('Licence.dll');
               @CheckLic  :=GetProcAddress(DLLInstance, 'CheckLic');


               ResultStru.DBHandle :=nil;
               ResultStru.ErrorCode:=ACCMGMT_ERR_AUTH;

               fibDatabaseConnected:=false;
               if fibDatabaseConnected then
               begin
                    //если пользователь уже ранее установил соединение то просто возвращаем хендл
                    ResultStru.DBHandle := fibFConnection.Handle;
                    ResultStru.ErrorCode:= ACCMGMT_ERR_AUTH;
                    Exit
               end;
               if not Assigned(fibFConnection)
               then begin
                       try
                               if ReadIniFile
                               then begin
                                          {Создаем экземпляр БД и читающей транзакции}
                                          fibFDefaultTransaction                 := TpFibTransaction.Create(nil);

                                          fibFConnection                         := TpFibDatabase.Create(nil);

                                          fibFConnection.DefaultTransaction      := fibFDefaultTransaction;
                                          fibFDefaultTransaction.DefaultDatabase := fibFConnection;
                                          fibFConnection.SQLDialect              := 3;
                                          fibFConnection.ConnectParams.CharSet   :='WIN1251';

                                          fibFConnection.DBName                  := DB_SERVER+':'+DB_PATH;
                                          fibFConnection.ConnectParams.UserName  := DB_USER;
                                          fibFConnection.ConnectParams.Password  := DB_PASSWORD;

                                          {Соединяемся с БД}
                                          fibFConnection.Open;
                                          fibFDefaultTransaction.StartTransaction;


                                          ResultStru.DBHandle :=fibFConnection.Handle;
                                          ResultStru.ErrorCode:=ACCMGMT_OK;

                                          {Проверка лицензии}
                                          CheckLic(fibFConnection.Handle);

                                          if not GetUserInfo(pLogin,pPassword)
                                          then begin
                                                    ResultStru.DBHandle:=nil;
                                                    ResultStru.ErrorCode:=ACCMGMT_ERR_AUTH;
                                          end
                                          else begin
                                                    InitializeConnectLog(fibFConnection, UserInfo.UserID);
                                                    DatabaseAfterConnect(nil);
                                                    StartConnHistory(fibFConnection.Handle);
                                          end;

                               end
                               else begin
                                          ResultStru.DBHandle:=nil;
                                          ResultStru.ErrorCode:=ACCMGMT_ERR_BAD_SYSTEM_INI;
                               end;
                       except
                              on exc: Exception do
                              begin
                                    MessageDlg('При з`єднанні з БД у системі безпеки виникла помилка:"' +exc.Message + '"', mtError, [mbOk], 0);
                                    fibFConnection.Free;
                                    fibFDefaultTransaction.Free;
                                    Exit;
                              end;
                       end;
               end;
    end
    else begin
              ShowMessage('Не знайдено Licence.dll');
              ResultStru.DBHandle :=nil;
              ResultStru.ErrorCode:=ACCMGMT_ERR_AUTH;
    end;

    if (ResultStru.DBHandle=nil)
    then begin
              if Assigned(fibFDefaultTransaction)
              then begin
                        if fibFDefaultTransaction.InTransaction
                        then fibFDefaultTransaction.Commit;

                        fibFDefaultTransaction.Free;
                        fibFDefaultTransaction:=nil;
              end;

              if Assigned(fibFConnection)
              then begin
                        fibFConnection.Free;
                        fibFConnection:=nil;
              end;
    end;

    Result := ResultStru;
end;


function InitConnection(pLogin, pPassword: string): Integer; stdcall;
var
    SystemIni: TIniFile;
    IniDatabaseName: string;
    CheckLic:procedure (db_h : PVoid); stdcall;
    DLLInstance:THandle;
begin
    if FileExists('Licence.dll')
    then begin
               DLLInstance := LoadLibrary('Licence.dll');
               @CheckLic  :=GetProcAddress(DLLInstance, 'CheckLic');
              //Result := ACCMGMT_ERR_UNKNOWN;
              if DatabaseConnected then
              begin
                  Result := ACCMGMT_ERR_ALREADY_NOT_CONNECTED;
                  Exit
              end;
              if not Assigned(FConnection) then
              begin

                  if (FileSearch(GetCurrentDir + '\config.ini', '') = '') then begin
                      Result := ACCMGMT_ERR_BAD_SYSTEM_INI;
                      Exit;
                  end;

                  SystemIni := TIniFile.Create(GetCurrentDir + '\config.ini');

                  IniDatabaseName := SystemIni.ReadString('CONNECTION', 'Server', '') + ':' + SystemIni.ReadString('CONNECTION', 'Path', '');
                  UseMD5 := (SystemIni.ReadString('Params', 'UseMD5', 'F') = 'T');

                  if (SystemIni.ReadString('CONNECTION', 'Server', '') = '') or (SystemIni.ReadString('CONNECTION', 'Path', '') = '') then
                  begin
                      Result := ACCMGMT_ERR_BAD_SYSTEM_INI;
                      SystemIni.Free;
                      Exit;
                  end;

                  SystemIni.Free;

                  FDefaultTransaction := TIBTransaction.Create(nil);
                  FDefaultTransaction.Params.Add('read_committed');
                  FDefaultTransaction.Params.Add('nowait');
                  FDefaultTransaction.Params.Add('rec_version');

                  FConnection := TIBDatabase.Create(nil);
                  FConnection.DatabaseName := IniDatabaseName;
                  FConnection.DefaultTransaction := FDefaultTransaction;
                  FDefaultTransaction.DefaultDatabase := FConnection;
                  FConnection.Params.Add('user_name=' + 'DEVEL');
                  FConnection.Params.Add('password=' + '@devel');
                  FConnection.Params.Add('lc_ctype=WIN1251');
                  FConnection.LoginPrompt := false;
                  try
                      FConnection.Open;
                      FDefaultTransaction.StartTransaction;
                  except
                      on exc: Exception do
                      begin
                          Result := ACCMGMT_ERR_OPEN_CONNECTION;
                          MessageDlg('При з`єднанні з БД у системі безпеки виникла помилка:"' +
                                      exc.Message + '"', mtError, [mbOk], 0);
                          FConnection.Free;
                          FDefaultTransaction.Free;
                          Exit;
                      end;
                  end;
              end;

              CheckLic(ib_externals.pvoid(FConnection.Handle));

              FUser := TUser.Create(nil, FConnection);
              FUser.FUseMD5 := UseMD5;

              if not FUser.FillDataByAuth(pLogin, pPassword) then
              begin
                  FUser.Free;
                  FUser := nil;
                  Result := ACCMGMT_ERR_AUTH;
                  CloseConnection;
                  Exit;
              end
              else begin
                         UserInfo.UserID       :=FUser.UserID;
                         UserInfo.UserName     :=FUser.UserName;
                         UserInfo.UserFullName :=FUser.UserFullName;
                         UserInfo.Password     :=FUser.Password;
                         UserInfo.UserIDExt    :=FUser.UserIDExt;
              end;
              Result := ACCMGMT_OK;
    end
    else begin
              ShowMessage('Не знайдено Licence.dll');
              Result := ACCMGMT_ERR_UNKNOWN;
    end;
end;

function AddObject(pParent, pName, pFullName: string): Integer; stdcall;
var
    accObj: TAccessObject;
    ParentID: Integer;
    emessage:string;
begin
    //Result := ACCMGMT_ERR_UNKNOWN;
    if not DatabaseConnected then
    begin
        Result := ACCMGMT_ERR_DB_NOT_CONNECTED;
        Exit
    end;
    ParentID := GetObjectByPath(pParent);
    if ParentID < 0 then
    begin
        Result := ParentID;
        Exit;
    end;
    accObj := TAccessObject.Create(FConnection);
    if accObj.FillDataByName(pName, ParentID) then
    begin
        accObj.Free;
        Result := ACCMGMT_ERR_OBJECT_ALREADY_EXISTS;
        Exit;
    end;
    accObj.NewObject(pName, pFullName, ParentID);
    if not accObj.InsertObject(emessage) then
    begin
        Result := ACCMGMT_ERR_INSERT_OBJECT;
        accObj.Free;
        Exit;
    end;
    accObj.Free;
    Result := ACCMGMT_OK;
end;

function EditObject(pObject, pNewName, pNewFullName: string): Integer; stdcall;
var
    accObj, checkObj: TAccessObject;
    ID: Integer;
    emessage:string;
begin
    //Result := ACCMGMT_ERR_UNKNOWN;
    if not DatabaseConnected then
    begin
        Result := ACCMGMT_ERR_DB_NOT_CONNECTED;
        Exit
    end;
    ID := GetObjectByPath(pObject);
    if ID < 0 then
    begin
        Result := ID;
        Exit;
    end;
    accObj := TAccessObject.Create(FConnection);
    if not accObj.FillDataByID(ID) then
    begin
        Result := ACCMGMT_ERR_GET_OBJECT;
        accObj.Free;
        Exit;
    end;

    checkObj := TAccessObject.Create(FConnection);
    if checkObj.FillDataByName(pNewName, accObj.ParentObjectID) then
    begin
        accObj.Free;
        checkObj.Free;
        Result := ACCMGMT_ERR_OBJECT_ALREADY_EXISTS;
        Exit;
    end;
    checkObj.Free;

    accObj.ObjectName := pNewName;
    accObj.ObjectFullName := pNewFullName;
    if not accObj.UpdateObject(emessage) then
    begin
        Result := ACCMGMT_ERR_UPDATE_OBJECT;
        accObj.Free;
        Exit;
    end;
    accObj.Free;
    Result := ACCMGMT_OK;
end;

function AddAction(pName, pFullName: string): Integer; stdcall;
var
    theAction: TObjectAction;
begin
    //Result := ACCMGMT_ERR_UNKNOWN;
    if not DatabaseConnected then
    begin
        Result := ACCMGMT_ERR_DB_NOT_CONNECTED;
        Exit
    end;
    theAction := TObjectAction.Create(nil, FConnection);
    if theAction.FillDataByName(pName) then
    begin
        Result := ACCMGMT_ERR_ACTION_ALREADY_EXISTS;
        theAction.Free;
        Exit;
    end;
    theAction.NewAction(pName, pFullName);
    if not theAction.Insert then
    begin
        Result := ACCMGMT_ERR_INSERT_ACTION;
        theAction.Free;
        Exit;
    end;
    theAction.Free;
    Result := ACCMGMT_OK;
end;

function EditAction(pAction, pNewName, pNewFullName: string): Integer; stdcall;
var
    theAction: TObjectAction;
begin
    //Result := ACCMGMT_ERR_UNKNOWN;
    if not DatabaseConnected then
    begin
        Result := ACCMGMT_ERR_DB_NOT_CONNECTED;
        Exit
    end;
    theAction := TObjectAction.Create(nil, FConnection);
    if theAction.FillDataByName(pNewName) then
    begin
        Result := ACCMGMT_ERR_ACTION_ALREADY_EXISTS;
        theAction.Free;
        Exit;
    end;
    if not theAction.FillDataByName(pAction) then
    begin
        Result := ACCMGMT_ERR_GET_ACTION;
        theAction.Free;
        Exit;
    end;
    theAction.ActionName := pNewName;
    theAction.ActionFullName := pNewFullName;
    if not theAction.Update then
    begin
        Result := ACCMGMT_ERR_UPDATE_ACTION;
        theAction.Free;
        Exit;
    end;
    theAction.Free;
    Result := ACCMGMT_OK;
end;

function AddActionToObject(pObject, pAction: string): Integer; stdcall;
var
    theAction: TObjectAction;
    ID: Integer;
begin
    //Result := ACCMGMT_ERR_UNKNOWN;
    if not DatabaseConnected then
    begin
        Result := ACCMGMT_ERR_DB_NOT_CONNECTED;
        Exit
    end;
    ID := GetObjectByPath(pObject);
    if ID < 0 then
    begin
        Result := ID;
        Exit;
    end;
    theAction := TObjectAction.Create(nil, FConnection);
    if theAction.IsInObject(ID) then
    begin
        Result := ACCMGMT_ERR_ACTION_IN_OBJECT;
        theAction.Free;
        Exit;
    end;
    if not theAction.FillDataByName(pAction) then
    begin
        Result := ACCMGMT_ERR_GET_ACTION;
        theAction.Free;
        Exit;
    end;
    if not theAction.InsertActionInObject(ID) then
    begin
        theAction.Free;
        Result := ACCMGMT_ERR_INSERT_ACTION_IN_OBJECT;
        Exit;
    end;
    theAction.Free;
    Result := ACCMGMT_OK;
end;

function GetUserId: Integer; stdcall;
begin

    if UserInfo.UserID <> 0 then
        result := UserInfo.UserID
    else
        result := 0;
end;

function GetUserFIO: string; stdcall;
begin
    if UserInfo.UserID <> 0 then
        result := UserInfo.UserFullName
    else
        result := 'Error';
end;

function GetUserIdMan: int64; stdcall;
var
    Query : TIBQuery;
    FibDataSet:TpFibDataSet;
begin
     if Assigned(FConnection)
     then begin
              Query := TIBQuery.Create(nil);
              Query.Database := FConnection;
              Query.Transaction := FDefaultTransaction;
              Query.SQL.Text := 'select id_man from private_cards where id_pcard = ' +
                                IntToStr(FUser.UserIDExt);
              try
                  Query.Open;
              except
                  on E:Exception do
                  begin
                      MessageDlg('Виникла помилка:"' +
                                      e.Message + '"', mtError, [mbOk], 0);
                      Query.Free;
                      Result := -1;
                      Exit;
                  end;
              end;

              if Query.IsEmpty then
                  result := -1
              else
                  result := Query['ID_MAN'];

              Query.Free;
     end;

     if assigned(fibFConnection)
     then begin
              FibDataSet := TpFIBDataSet.Create(nil);
              FibDataSet.Database := fibFConnection;
              FibDataSet.Transaction := fibFDefaultTransaction;
              FibDataSet.SelectSQL.Text := 'select id_man from private_cards where id_pcard = ' +
                                           IntToStr(UserInfo.UserIDExt);
              try
                  FibDataSet.Open;
              except
                  on E:Exception do
                  begin
                      MessageDlg('Виникла помилка:"' +
                                      e.Message + '"', mtError, [mbOk], 0);
                      FibDataSet.Free;
                      Result := -1;
                      Exit;
                  end;
              end;

              if FibDataSet.IsEmpty then
                  result := -1
              else
                  result := FibDataSet['ID_MAN'];

              FibDataSet.Free;
     end;
end;


function fibCheckPermission(pObject, pAction: string): Integer; stdcall;
var Permission : Integer;
     getInfoDS:TpFibDataSet;
 begin
    Result:=ACCMGMT_ERR_UNKNOWN;
    if Assigned(fibFConnection) and Assigned(fibFDefaultTransaction)
    then begin
        //Поднимаем информацию по объекту
        getInfoDS:=TpFibDataSet.Create(nil);
        getInfoDS.Database:=fibFConnection;
        getInfoDS.Transaction:=fibFDefaultTransaction;
        getInfoDS.SelectSQL.Text:='SELECT FIRST 1 * FROM ACCESS_OBJECTS_PATH WHERE UPPER(PATH)='+''''+UpperCase(pObject)+'''';
        getInfoDS.Open;
        getInfoDS.FetchAll;
        if (getInfoDS.RecordCount<=0)
        then begin
            getInfoDS.close;
            getInfoDS.free;
            Result:=ACCMGMT_ERR_GET_OBJECT;
            Exit
        end;
        getInfoDS.close;

        //Поднимаем информацию по действию
        getInfoDS.SelectSQL.Text:='SELECT * FROM ACTIONS WHERE UPPER(NAME)='+''''+UpperCase(pAction)+'''';
        getInfoDS.Open;
        getInfoDS.FetchAll;
        if (getInfoDS.RecordCount<=0)
        then begin
            getInfoDS.close;
            getInfoDS.free;
            Result:=ACCMGMT_ERR_GET_ACTION;
            Exit
        end;
        getInfoDS.close;

        //Делаем проверку разрешения
        getInfoDS.SelectSQL.Text:=' SELECT * FROM ACCESS_CHECK_PERM_BY_ID_OBJ('+''''+pObject+''''+','+
                                 ''''+pAction+''''+','+IntToStr(UserInfo.UserID)+')';
        getInfoDS.Open;
        getInfoDS.FetchAll;
        if (getInfoDS.RecordCount>0)
        then begin
            Permission:=getInfoDS.FieldByName('RESULT').AsInteger;
        end else begin
            getInfoDS.close;
            getInfoDS.free;
            Result:=ACCMGMT_ERR_CHECK_PER_QUERY_ROLE;
            Exit
        end;
        getInfoDS.close;
        getInfoDS.Free;
 
        if Permission=1 then Result:=ACCMGMT_OK
    end
    else Result := ACCMGMT_ERR_DB_NOT_CONNECTED;
 end;


function CheckPermission(pObject, pAction: string): Integer; stdcall;
var
    queryCheckPermission:TIBQuery;
    sql: string;
    theRole: TRole;
    theAction: TObjectAction;
    ObjectID, ActionID: Integer;
begin
    //Result := ACCMGMT_ERR_UNKNOWN;
    if not DatabaseConnected then
    begin
        Result := ACCMGMT_ERR_DB_NOT_CONNECTED;
        Exit
    end;
    ObjectID := GetObjectByPath(pObject);
    if ObjectID < 0 then
    begin
        Result := ObjectID;
        Exit;
    end;
    theAction := TObjectAction.Create(nil, FConnection);
    if not theAction.FillDataByName(pAction) then
    begin
        Result := ACCMGMT_ERR_GET_ACTION;
        theAction.Free;
        Exit;
    end;
    ActionID := theAction.ActionID;
    theAction.Free;

    queryCheckPermission := TIBQuery.Create(nil);
    queryCheckPermission.Database := FConnection;
    queryCheckPermission.Transaction := FDefaultTransaction;
    sql := 'select * from users_roles ' +
        'where id_user = ' + IntToStr(FUser.UserID);
    queryCheckPermission.SQL.Text := sql;
    try
        queryCheckPermission.Open;
    except
        on E:Exception do
        begin
            MessageDlg('Виникла помилка:"' +
                            e.Message + '"', mtError, [mbOk], 0);
            queryCheckPermission.Free;
            Result := ACCMGMT_ERR_CHECK_PER_QUERY_ROLE;
            Exit;
        end;
    end;
    if queryCheckPermission.RecordCount <= 0 then
    begin
        queryCheckPermission.Free;
        Result := ACCMGMT_ERR_CHECK_PER_DENY;
        Exit;
    end;
    theRole := TRole.Create(nil, FConnection);

    Result := ACCMGMT_ERR_CHECK_PER_DENY;
    while not queryCheckPermission.Eof do
    begin
        if not theRole.FillDataBy(queryCheckPermission.FieldByName('id_role').Value) then
        begin
            theRole.Free;
            queryCheckPermission.Free;
            Result := ACCMGMT_ERR_GET_ROLE;
            Exit;
        end;
        if theRole.CheckPermission(ObjectID, ActionID) then
        begin
            Result := ACCMGMT_OK;
            break;
        end;
        queryCheckPermission.Next;
    end;
    queryCheckPermission.Free;
    theRole.Free;
end;


initialization
       Randomize;


finalization


end.

