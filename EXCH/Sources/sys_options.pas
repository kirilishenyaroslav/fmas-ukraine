unit SYS_OPTIONS;

interface
uses pFIBDatabase, pFIBQuery, Controls, Classes, Graphics, IBase;
type
 TAccessResult=record
  Login        : string;
  Pswrd        : string;
  Name_User    : string;
  ID_User      : integer;
  User_Id_Card : integer;
  User_Fio     : string;
  Connection   : TISC_DB_HANDLE;
 end;

const
 SYS_TABLE = 'SYS_OPTIONS';
 SYS_PASSWORD = 'aLxWjCREFG';
var
 SYS_SERVER                : integer;
 SYS_MAX_DATE              : TDate;
 SYS_MAX_TIMESTAMP         : TDateTime;
 SYS_MIN_TIMESTAMP         : TDateTime;
 SYS_START_DATE            : TDate;

 SYS_DEF_ID_DEPARTMENT     : integer;
 SYS_DEF_NAME_DEPARTMENT   : string;
 EXCH_NAME_DEPARTMENT      : string;

 SYS_EXCH_ROLLBACK         : boolean;
 SYS_EXCH_CHECK_ID         : boolean;

 AccessResult     : TAccessResult;

procedure sys_ReadOptions(ReadTransaction : TpFIBTransaction);

implementation
uses SysUtils, FIBQuery, BaseTypes;

procedure sys_ReadOptions(ReadTransaction : TpFIBTransaction);
var
 Query : TpFIBQuery;
begin
 Query := TpFIBQuery.Create(Nil);
 Query.Transaction := ReadTransaction;
 Query.SQL.Text := 'select * from SYS_OPTIONS';
 Query.ExecQuery;

 SYS_SERVER        := Query['ID_SERVER'].Value;
 SYS_MAX_DATE      := Query['MAX_DATE'].Value;
 SYS_MAX_TIMESTAMP := Query['MAX_TIMESTAMP'].Value;
 SYS_MIN_TIMESTAMP := Query['MIN_TIMESTAMP'].AsDateTime;
 SYS_START_DATE    := Query['START_DATE'].AsDate;
 SYS_EXCH_ROLLBACK := (Query['EXCH_ROLLBACK'].AsInteger = 1);
 SYS_EXCH_CHECK_ID := (Query['EXCH_CHECK_ID'].AsInteger = 1);

 SYS_DEF_ID_DEPARTMENT  := Query['ID_DEPARTMENT'].AsInteger;

 Query.Close;
 Query.SQl.Text := 'select NAME_SHORT from SP_DEPARTMENT where ID_DEPARTMENT = ' + IntToStr(SYS_DEF_ID_DEPARTMENT);
 Query.ExecQuery;
 SYS_DEF_NAME_DEPARTMENT := Query['NAME_SHORT'].AsString;
 Query.Close;

 Query.SQL.Text := 'select ID_USER from USERS where ID_USER_EXT='
 + IntToStr(CurrentID_PCARD);
 Query.ExecQuery;

 id_user := Query.Fields[0].AsInteger;

 Query.Close;


 Query.SQL.Text := 'select SHORT_NAME from EXCH_INI_SERVERS where ID_SERVER='
 + IntToStr(SYS_SERVER);
 Query.ExecQuery;

 EXCH_NAME_DEPARTMENT := Query.Fields[0].AsString;

 Query.Close;

 Query.Free;
end;

begin
 ShortDateFormat := 'dd.MM.yyyy';
 DecimalSeparator := ',';
 SYS_MAX_TIMESTAMP := StrToDate('30.12.9999');
 SYS_MAX_DATE := StrToDate('30.12.9999');
end.
