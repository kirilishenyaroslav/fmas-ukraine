unit SYS_OPTIONS;

interface
uses pFIBDatabase, pFIBQuery, Controls, Classes, Graphics;
const
 SYS_TABLE = 'SYS_OPTIONS';
var
 SYS_SERVER        : integer;
 SYS_MAX_DATE      : TDate;
 SYS_MAX_TIMESTAMP : TDateTime;
 SYS_MIN_TIMESTAMP : TDateTime;
 SYS_START_DATE    : TDate;
 SYS_ENABLED_COLOR : TColor = clInfoBk;
 SYS_DISABLED_COLOR : TColor = clSilver;
 SYS_DEF_UNIT_MEAS : integer;
 SYS_NDS           : currency = 1 / 6;
 SYS_DEF_ID_DEPARTMENT : integer;
 SYS_DEF_NAME_DEPARTMENT : string;
 SYS_DEF_ID_TYPE_ACCOUNT : integer;
 SYS_DEF_NAME_TYPE_ACCOUNT : string;
 SYS_F : integer = 12;

procedure sys_ReadOptions(AOwner : TComponent; ReadTransaction : TpFIBTransaction);

implementation
uses SysUtils;

procedure sys_ReadOptions(AOwner : TComponent; ReadTransaction : TpFIBTransaction);
var
 Query1 : TpFIBQuery;
begin
 Query1 := TpFIBQuery.Create(Nil);
 Query1.Transaction := ReadTransaction;
 Query1.SQL.Text := 'select * from SYS_OPTIONS';
 Query1.ExecQuery;

 SYS_SERVER := Query1['ID_SERVER'].AsInteger;
 SYS_MAX_DATE := Query1['MAX_DATE'].asdate;
 SYS_MAX_TIMESTAMP := Query1['MAX_TIMESTAMP'].AsDateTime;
 SYS_MIN_TIMESTAMP := Query1['MIN_TIMESTAMP'].AsDateTime;
 SYS_START_DATE := Query1['START_DATE'].AsDate;
 SYS_DEF_UNIT_MEAS := Query1['DEF_UNIT_MEAS'].AsInteger;
 SYS_NDS := Query1['NDS'].AsCurrency;
 SYS_DEF_ID_DEPARTMENT := Query1['ID_DEPARTMENT'].AsInteger;
 SYS_DEF_ID_TYPE_ACCOUNT := Query1['ID_TYPE_ACCOUNT'].AsInteger;
 Query1.Close;
 Query1.SQl.Text := 'select NAME_SHORT from SP_DEPARTMENT where ID_DEPARTMENT = ' + IntToStr(SYS_DEF_ID_DEPARTMENT);
 Query1.ExecQuery;

 SYS_DEF_NAME_DEPARTMENT := Query1['NAME_SHORT'].AsString;

 Query1.Close;
 Query1.Close;
 Query1.SQl.Text := 'select NAME_TYPE_ACCOUNT from INI_TYPE_ACCOUNT where ID_TYPE_ACCOUNT = ' + IntToStr(SYS_DEF_ID_TYPE_ACCOUNT);
 Query1.ExecQuery;
 SYS_DEF_NAME_TYPE_ACCOUNT := Query1['NAME_TYPE_ACCOUNT'].AsString;
end;

begin
 ShortDateFormat := 'dd.MM.yyyy';
 DecimalSeparator := ',';
 SYS_MAX_TIMESTAMP := StrToDate('30.12.9999');
 SYS_MAX_DATE := StrToDate('30.12.9999');
end.
