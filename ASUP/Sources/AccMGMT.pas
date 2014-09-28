{ -internal}
{-$Id: AccMGMT.pas,v 1.2 2005/11/09 11:18:49 valik Exp $}
// Заголовочный файл для программного интерфейса к системе:
//            "Система управления доступом"
//
// Файл библиотеки: accmgmt.dll
//
// Разработчик: Яновский Андрей Петрович
// Организация: Донецкий Национальный Университет
// 2003 г.

// Путь к объектам задаётся через '/'
// Например: "/Родительский объект/ След. род. объект/.../Интересующий нас объект"
// Слеш в конце необязательно

unit AccMgmt;

interface

const
     ACCMGMT_ERR_BASE                     = 0;
     ACCMGMT_OK                           = ACCMGMT_ERR_BASE;
     ACCMGMT_ERR_UNKNOWN                  = ACCMGMT_ERR_BASE - 1;
     ACCMGMT_ERR_BAD_SYSTEM_INI           = ACCMGMT_ERR_BASE - 2;
     ACCMGMT_ERR_OPEN_CONNECTION          = ACCMGMT_ERR_BASE - 3;
     ACCMGMT_ERR_BAD_PATH                 = ACCMGMT_ERR_BASE - 4;
     ACCMGMT_ERR_INSERT_OBJECT            = ACCMGMT_ERR_BASE - 5;
     ACCMGMT_ERR_UPDATE_OBJECT            = ACCMGMT_ERR_BASE - 6;
     ACCMGMT_ERR_GET_OBJECT               = ACCMGMT_ERR_BASE - 7;
     ACCMGMT_ERR_INSERT_ACTION            = ACCMGMT_ERR_BASE - 8;
     ACCMGMT_ERR_UPDATE_ACTION            = ACCMGMT_ERR_BASE - 9;
     ACCMGMT_ERR_GET_ACTION               = ACCMGMT_ERR_BASE - 10;
     ACCMGMT_ERR_INSERT_ACTION_IN_OBJECT  = ACCMGMT_ERR_BASE - 11;
     ACCMGMT_ERR_AUTH                     = ACCMGMT_ERR_BASE - 12;
     ACCMGMT_ERR_CHECK_PER_QUERY_ROLE     = ACCMGMT_ERR_BASE - 13;
     ACCMGMT_ERR_CHECK_PER_DENY           = ACCMGMT_ERR_BASE - 14;
     ACCMGMT_ERR_INSERT_ROLE              = ACCMGMT_ERR_BASE - 15;
     ACCMGMT_ERR_UPDATE_ROLE              = ACCMGMT_ERR_BASE - 16;
     ACCMGMT_ERR_GET_ROLE                 = ACCMGMT_ERR_BASE - 17;
     ACCMGMT_ERR_ACTION_ALREADY_EXISTS    = ACCMGMT_ERR_BASE - 18;
     ACCMGMT_ERR_ACTION_IN_OBJECT         = ACCMGMT_ERR_BASE - 19;
     ACCMGMT_ERR_OBJECT_ALREADY_EXISTS    = ACCMGMT_ERR_BASE - 20;
     ACCMGMT_ERR_DB_NOT_CONNECTED         = ACCMGMT_ERR_BASE - 21;
     ACCMGMT_ERR_ALREADY_NOT_CONNECTED    = ACCMGMT_ERR_BASE - 22;

// Инициализация соединения с БД СУД
function InitConnection(pLogin, pPassword: string): Integer; stdcall; external 'accmgmt.dll';
// Разрыв соединения и освобождение ресурсов
function CloseConnection: Integer; stdcall; external 'accmgmt.dll';
// Возвращает идентификатор объекта по его пути
function GetObjectByPath(pPath: string): Integer; stdcall; external 'accmgmt.dll';
// Возвращает атрибуты объекта по его пути
function GetObjectData(var pName, pFullName: ShortString; pPath: string): Integer; stdcall; external 'accmgmt.dll';
// Функция возвращает внешний ключ текущего пользователя (id_pcard)
function GetCurrentUserIDExt: Integer; stdcall; external 'accmgmt.dll';
// Добавляет объект в указанную ветку (путь)
function AddObject(pParent, pName, pFullName: string): Integer; stdcall; external 'accmgmt.dll';
// Редактирует указанный (путём) объект
function EditObject(pObject, pNewName, pNewFullName: string): Integer; stdcall; external 'accmgmt.dll';
// Добавляет действие
function AddAction(pName, pFullName: string): Integer; stdcall; external 'accmgmt.dll';
// Редактирует действие
function EditAction(pAction, pNewName, pNewFullName: string): Integer; stdcall; external 'accmgmt.dll';
// Добавляет действие в объект
function AddActionToObject(pObject, pAction: string): Integer; stdcall; external 'accmgmt.dll';
// Проверяет наличие разрешения для указанного объекта и его действия, для текущего пользователя
function CheckPermission(pObject, pAction: string): Integer; stdcall; external 'accmgmt.dll';

function GetUserId : Integer; stdcall; external 'accmgmt.dll';

function GetUserFIO : String; stdcall; external 'accmgmt.dll';



// Преобразует код ошибки в текстовое сообщение.
// Функция реализована в данном модуле, чтобы была
// возможность перевести сообщения на др. язык
function AcMgmtErrMsg(ErrCode: Integer): string;

implementation

function AcMgmtErrMsg(ErrCode: Integer): string;
var
   cMsg: string;
begin
     Result := '';
     if ErrCode > ACCMGMT_OK then Exit;
     case ErrCode of
       ACCMGMT_OK                           : cMsg := 'Команда выполнена успешно';
       ACCMGMT_ERR_UNKNOWN                  : cMsg := 'Неизвестная ошибка';
       ACCMGMT_ERR_BAD_SYSTEM_INI           : cMsg := 'Файл config.ini отсутствует или содержит некорректные данные';
       ACCMGMT_ERR_OPEN_CONNECTION          : cMsg := 'Ошибка при соединении';
       ACCMGMT_ERR_BAD_PATH                 : cMsg := 'Путь к объекту неверный';
       ACCMGMT_ERR_INSERT_OBJECT            : cMsg := 'Ошибка при вставке объекта';
       ACCMGMT_ERR_UPDATE_OBJECT            : cMsg := 'Ошибка при обновлении объекта';
       ACCMGMT_ERR_GET_OBJECT               : cMsg := 'Ошибка при поиске объекта';
       ACCMGMT_ERR_INSERT_ACTION            : cMsg := 'Ошибка при вставке действия';
       ACCMGMT_ERR_UPDATE_ACTION            : cMsg := 'Ошибка при обновлении действия';
       ACCMGMT_ERR_GET_ACTION               : cMsg := 'Ошибка при поиске действия';
       ACCMGMT_ERR_INSERT_ACTION_IN_OBJECT  : cMsg := 'Ошибка при вставке действия в объект';
       ACCMGMT_ERR_AUTH                     : cMsg := 'Невірне ім''я або пароль';
       ACCMGMT_ERR_CHECK_PER_QUERY_ROLE     : cMsg := 'Ошибка при отборе групп пользователей';
       ACCMGMT_ERR_CHECK_PER_DENY           : cMsg := 'Доступ закрыт';
       ACCMGMT_ERR_INSERT_ROLE              : cMsg := 'Ошибка при вставке группы';
       ACCMGMT_ERR_UPDATE_ROLE              : cMsg := 'Ошибка при обновлении группы';
       ACCMGMT_ERR_GET_ROLE                 : cMsg := 'Ошибка при поиске группы';
       ACCMGMT_ERR_ACTION_ALREADY_EXISTS    : cMsg := 'Данное действие уже существует';
       ACCMGMT_ERR_ACTION_IN_OBJECT         : cMsg := 'Данное действие уже добавлено в объект';
       ACCMGMT_ERR_OBJECT_ALREADY_EXISTS    : cMsg := 'Данный объект уже существует';
       ACCMGMT_ERR_DB_NOT_CONNECTED         : cMsg := 'Нет соединения с БД СРД';
       ACCMGMT_ERR_ALREADY_NOT_CONNECTED    : cMsg := 'Соединение уже установлено'

     end;
     Result := cMsg;
end;

end.
