unit uReqCommon;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, AccMgmt, IniFiles, uCommonSp, FIBDatabase, pFIBDatabase, IBase,
    FIBDataSet, pFIBDataSet;

function GetImageDBHandle(MAIN_DB_HANDLE: TISC_DB_HANDLE): TISC_DB_HANDLE;

implementation

function GetImageDBHandle(MAIN_DB_HANDLE: TISC_DB_HANDLE): TISC_DB_HANDLE;
var
    CurrUserInfo: AccMgmt.TUserInfo;
    ResultInfo: AccMgmt.TResultInfo;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    pShowFoto: Variant;
    F: TIniFile;
    ImagePath: string;
begin
    CurrUserInfo := AccMgmt.fibGetCurrentUserInfo;
{ Первый шаг проверки - разрешено ли использование пакета фотографий,
  второй шаг - проверка на наличие базы, т.к. мало ли что можно отметить в таблице}
// Первый шаг

    Result := nil;
    DB := TpFIBDatabase.Create(nil);
    ReadTransaction := TpFIBTransaction.Create(nil);
    DSet := TpFIBDataSet.Create(nil);

    ReadTransaction.DefaultDatabase := DB;
    DB.DefaultTransaction := ReadTransaction;
    DSet.Database := DB;
    DSet.Transaction := ReadTransaction;

    DB.Handle := MAIN_DB_HANDLE;
    ReadTransaction.Active := True;
    DSet.SQLs.SelectSQL.Text := 'SELECT SHOW_FOTO FROM PUB_SYS_DATA';
    DSet.Open;
    pShowFoto := DSet['SHOW_FOTO'];

    ReadTransaction.Active := False;
    DSet.Free;
    ReadTransaction.Free;
    DB.Free;

    if pShowFoto <> 1 then Exit; // Не повезло.

// Второй шаг

// Проверяем на наличие базы по ее пути в config.ini
    F := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\config.ini');
    try
        ImagePath := F.ReadString('IMAGE_CONNECTION', 'Path', '');
    finally;
        F.Free;
    end;

    if ImagePath = '' then Exit; // Не повезло.

// Пытаемся установить подключение
    ResultInfo := AccMgmt.fibInitImageConnection(CurrUserInfo.UserName, CurrUserInfo.Password);
    if ResultInfo.ErrorCode <> ACCMGMT_OK then // ошибка
        if ResultInfo.ErrorCode = -12 then
    {... т.е. если ошибка "Невірне ім'я або пароль"(а она появляется при повторной
    загрузке справочника физических лиц, то мы вызываем fibInitImageConnection
    снова и база, закрытая предыдущим вызовом, вновь открывается. Вот так вот,
    и не надо нигде запоминать хэндл базы.}
        begin
            ResultInfo := AccMgmt.fibInitImageConnection(CurrUserInfo.UserName, CurrUserInfo.Password);
            if ResultInfo.ErrorCode <> ACCMGMT_OK then // ошибка, мало ли чего...
                Result := nil
            else
                Result := ResultInfo.DBHandle;
        end
        else
            Result := nil
    else
        Result := ResultInfo.DBHandle;
end;
end.
