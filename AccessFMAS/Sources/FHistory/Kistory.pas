unit Kistory;

interface

uses Classes, Ibase, pFibStoredProc, pFibDatabase, pFibDataSet, SysUtils,
     Dialogs, Variants, RxMemDS, DB, WinSock, Windows,
     Forms, Clipbrd, Controls, IBDataBase, IBCustomDataSet, AccMgmt;

function StartConnHistory(DBHandle:TISC_DB_HANDLE): Int64; stdcall;
function StartHistory(WriteTransaction: TpFIBTransaction; CodeSystem: Integer=10; IdSession : integer=0): Int64; stdcall;
function StartHistoryEX(WriteTransaction: TIBTransaction; CodeSystem: Integer=10; IdSession : integer=0): Int64; stdcall;

implementation

function StartConnHistory(DBHandle:TISC_DB_HANDLE): Int64; stdcall;
  function GetCompName : string;
  var
    s : array [0..255] of Char;
    sLen : Longword;
  begin
       sLen := 255;
       GetHostName(s, sLen);
       Result := Trim(s);
  end;

  function GetIPAddress : string;
  var
    wVerReq: WORD;
    wsaData: TWSAData;
    i: pchar;
    h: PHostEnt;
    c: array[0..128] of char;
  begin
        wVerReq := MAKEWORD(1, 1);
        WSAStartup(wVerReq, wsaData);
        GetHostName(c, 128);
        h := GetHostByName(c);
        i := iNet_ntoa(PInAddr(h^.h_addr_list^)^);
        Result := i; //O
        WSACleanup;
  end;
var

  ExQuery : TpFIBDataSet;
  Tr:TpFibTransaction;
  Db:TpFibDatabase;
  ip_str:string;
begin
     ExQuery := TpFIBDataSet.Create(nil);

     Tr:=TpFibTransaction.Create(nil);

     Db:=TpFibDatabase.Create(nil);
     Db.SQLDialect:=3;
     Db.DefaultTransaction:=Tr;
     Db.DefaultUpdateTransaction:=Tr;
     Db.Handle:=DBHandle;

     Tr.DefaultDatabase:=DB;



     ExQuery.Database:=DB;
     ExQuery.Transaction:=Tr;
     ExQuery.SelectSQL.Text:='select OUT_ID_HISTORY_INFO from PUB_SET_HISTORY_INS(:code_sys,:id_sess,:id_user,:ip_adr,:host_name, :appname)';
     try
        ExQuery.ParamByName('code_sys').Value     := Null;
        ExQuery.ParamByName('id_sess').Value      := Null;
        ExQuery.ParamByName('id_user').AsInt64    := GetUserId;
        ip_str :=GetIPAddress;
        ExQuery.ParamByName('ip_adr').AsString    := ip_str;
        ExQuery.ParamByName('host_name').AsString := GetCompName;
        ExQuery.ParamByName('appname').AsString   := ExtractFileName(ParamStr(0));
        ExQuery.Open;

        result:=ExQuery['OUT_ID_HISTORY_INFO'];
        ExQuery.Close;
     except
        ExQuery.Close;
        result:=-1;
     end;

     Tr.Commit;

     ExQuery.Free;
     Tr.Free;
     Db.Free;

end;



function StartHistory(WriteTransaction: TpFIBTransaction; CodeSystem: Integer=10; IdSession : integer=0): Int64;
begin
     Result:=0;
end;

function StartHistoryEX(WriteTransaction: TIBTransaction; CodeSystem: Integer=10; IdSession : integer=0): Int64;
begin
     Result:=0;
end;


end.