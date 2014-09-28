{******************************************************************************}
{*              Автоматизированная система «Учет и анализ договорных          *}
{*                         обязательств ГПП «Укрпромводчермет»                *}
{*              (c) Донецкий национальный университет, 2002-2003              *}
{******************************************************************************}

{                          Модуль "Системные настройки"                        }
{ Содержит переменные настройки системы и функции для работы с ними.           }
{                                                 ответственный: Таганский Андрей }

unit tagSYS_OPTIONS;

interface

uses pFIBDatabase, pFIBQuery, Controls, Classes, Graphics, tagBaseTypes, Variants;

const
 SYS_TABLE = 'tagSYS_OPTIONS';
var
 SYS_SERVER                 : integer;
 SYS_MAX_DATE               : TDate;
 SYS_MAX_TIMESTAMP          : TDateTime;
 SYS_MIN_TIMESTAMP          : TDateTime;
 SYS_START_DATE             : TDate;
 SYS_ENABLED_COLOR          : TColor = clInfoBk;
 SYS_DISABLED_COLOR         : TColor = clSilver;
 SYS_DEF_UNIT_MEAS          : integer;
 SYS_NDS                    : currency = 1 / 6;
 SYS_DEF_ID_DEPARTMENT      : integer;
 SYS_DEF_NAME_DEPARTMENT    : string;
 SYS_DEF_ID_TYPE_ACCOUNT    : integer;
 SYS_DEF_NAME_TYPE_ACCOUNT  : string;
 SYS_DEF_NAME_UNIT_MEAS     : string;
 SYS_DEF_NAME_UNIT_MEAS_SUM : string;
 SYS_DEF_UNIT_MEAS_COEF     : integer;
 SYS_DEF_UNIT_MEAS_SUM_COEF : integer;
 DEFAULT_COST_UNIT_MEAS     : integer;
 SYS_F                      : integer = 12;
 SYS_MAX_CHILD_COUNT        : integer; // Ограничение на максимальное количество чилдов в спавочнике типов продукции и продукции

 Post_Name         : string; // Должность утверждающего планы
 Post_FIO          : string; // ФИО утверждающего планы
 EconPost_Name     : string; // Должность подписывающего планы
 EconPost_FIO      : string; // ФИО подписывающего планы

function sys_ReadOptions(ReadTransaction : TpFIBTransaction) : boolean;

implementation
uses SysUtils, FIBQuery;

function sys_ReadOptions(ReadTransaction : TpFIBTransaction) : boolean;
var
 Query1 : TpFIBQuery;
begin
 Result := True;

 Post_Name     := '';
 Post_FIO      := '';
 EconPost_Name := '';
 EconPost_FIO  := '';

 try
  Query1             := TpFIBQuery.Create(Nil);
  Query1.Transaction := ReadTransaction;
  Query1.SQL.Text    := 'select * from SYS_OPTIONS';
  Query1.ExecQuery;

  SYS_SERVER             := Query1['ID_SERVER'].Value;
  SYS_MAX_DATE           := Query1['MAX_DATE'].Value;
  SYS_MAX_TIMESTAMP      := Query1['MAX_TIMESTAMP'].Value;
  SYS_MIN_TIMESTAMP      := Query1['MIN_TIMESTAMP'].AsDateTime;
  SYS_START_DATE         := Query1['START_DATE'].AsDate;
  SYS_DEF_UNIT_MEAS      := Query1['DEF_UNIT_MEAS'].AsInteger;
  DEFAULT_COST_UNIT_MEAS := Query1['DEFAULT_COST_UNIT_MEAS'].AsInteger;

  SYS_MAX_CHILD_COUNT     := Query1['MAX_CHILD_COUNT'].AsInteger;
  SYS_NDS                 := Query1['NDS'].AsCurrency;
  SYS_DEF_ID_DEPARTMENT   := Query1['ID_DEPARTMENT'].AsInteger;
  SYS_DEF_ID_TYPE_ACCOUNT := Query1['ID_TYPE_ACCOUNT'].AsInteger;
  Query1.Close;

  Query1.SQl.Text := 'select NAME_SHORT from SP_DEPARTMENT where ID_DEPARTMENT = ' + IntToStr(SYS_DEF_ID_DEPARTMENT);
  Query1.ExecQuery;
  SYS_DEF_NAME_DEPARTMENT := Query1['NAME_SHORT'].AsString;
  Query1.Close;

  Query1.SQl.Text := 'select NAME_TYPE_ACCOUNT from PUB_INI_TYPE_ACCOUNT where ID_TYPE_ACCOUNT = ' + IntToStr(SYS_DEF_ID_TYPE_ACCOUNT);
  Query1.ExecQuery;
  SYS_DEF_NAME_TYPE_ACCOUNT := Query1['NAME_TYPE_ACCOUNT'].AsString;
  Query1.Close;

  Query1.SQl.Text := 'select SHORT_NAME, COEFFICIENT from INI_UNIT_MEAS where ID_UNIT_MEAS = ' + IntToStr(SYS_DEF_UNIT_MEAS);
  Query1.ExecQuery;
  SYS_DEF_NAME_UNIT_MEAS := Query1['SHORT_NAME'].AsString;
  SYS_DEF_UNIT_MEAS_COEF := Query1['COEFFICIENT'].AsInteger;
  Query1.Close;

  Query1.SQL.Text := 'select ID_USER from USERS where ID_USER_EXT='
  + IntToStr(CurrentID_PCARD);
  Query1.ExecQuery;

  id_user := Query1.Fields[0].AsInteger;

  Query1.Close;

  // Выбираю подписывающего и утверждающего

{  Query1.SQL.Text := 'select * from GET_SHTAT_PROP_PEOPLE(912,' + QuotedStr(DateToStr(Date)) + ')';
  Query1.ExecQuery;

  if Query1.RecordCount > 0 then begin
   if not VarIsNull(Query1.Fields[1].AsVariant) then Post_Name := Query1.Fields[1].AsString;
   if not VarIsNull(Query1.Fields[2].AsVariant) then Post_FIO  := Query1.Fields[2].AsString;
  end;

  Query1.Close;

  Query1.SQL.Text := 'select * from GET_SHTAT_PROP_PEOPLE(1012,' + QuotedStr(DateToStr(Date)) + ')';
  Query1.ExecQuery;

  if Query1.RecordCount > 0 then begin
   if not VarIsNull(Query1.Fields[1].AsVariant) then EconPost_Name := Query1.Fields[1].AsString;
   if not VarIsNull(Query1.Fields[2].AsVariant) then EconPost_FIO  := Query1.Fields[2].AsString;
  end;

  Query1.Close;}
 except
  Result := False;
 end; 
end;

begin
 ShortDateFormat := 'dd.MM.yyyy';
 DecimalSeparator := ',';
 SYS_MAX_TIMESTAMP := StrToDate('30.12.9999');
 SYS_MAX_DATE := StrToDate('30.12.9999');
end.
