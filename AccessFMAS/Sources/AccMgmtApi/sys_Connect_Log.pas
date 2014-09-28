unit sys_Connect_Log;

interface
uses pFIBDatabase, pFIBQuery, pFIBStoredProc, pFIBDataSet, Dialogs, FIBDataBase,
     Controls, Forms, IB_Externals, Classes, Registry, Windows, ExtCtrls,
     IBase, SysUtils;

type
 TConnectLog = class
  private
   S_id_User    : integer;

   Connect_PK_ID : int64;

   STransaction : TpFIBTransaction;
   StoredProc   : TpFIBStoredProc;

   function GetLocalComputerName: String;
   function GetUserName:string;

   procedure DatabaseBeforeDisconnect(Sender: TObject);
  public
    { Public declarations }
 end;

function InitializeConnectLog(DB : TpFIBDatabase; id_User : integer) : boolean;
procedure DatabaseAfterConnect(Sender: TObject);

implementation

uses FIBQuery;

var
 ConnectLog : TConnectLog;

function InitializeConnectLog(DB : TpFIBDatabase; id_User : integer) : boolean;
begin
 Result := False;

 try
  ConnectLog := TConnectLog.Create;

  ConnectLog.S_id_User := id_User;

  ConnectLog.STransaction := TpFIBTransaction.Create(nil);
  ConnectLog.STransaction.DefaultDatabase := DB;

  DB.BeforeDisconnect := ConnectLog.DatabaseBeforeDisconnect;

  ConnectLog.StoredProc := TpFIBStoredProc.Create(nil);
  ConnectLog.StoredProc.Transaction := ConnectLog.STransaction;
 except
  ShowMessage('Ініціалізація служби протоколювання транзакцій користувачів закінчено невдачою!'
  + #13 + #13 + 'Зв''яжіться із розробниками!');
  Exit;
 end;

 Result := True;
end;

{ TConnectLog }

procedure DatabaseAfterConnect(Sender: TObject);
begin
 try
  ConnectLog.StoredProc.Transaction.StartTransaction;

  ConnectLog.StoredProc.ExecProcedure('SYS_CONNECT_LOG_ADD', [ConnectLog.S_id_User, ConnectLog.GetLocalComputerName, ConnectLog.GetUserName]);

  ConnectLog.Connect_PK_ID := ConnectLog.StoredProc.Fields[0].AsInt64;

  ConnectLog.StoredProc.Transaction.Commit;
 except
  ConnectLog.StoredProc.Transaction.Rollback;
  ShowMessage('Помилка!' + #13 + #13 + 'Помилка протоколювання з''єднання користувача з БД!');
 end;
end;

procedure TConnectLog.DatabaseBeforeDisconnect(Sender: TObject);
begin
 try
  StoredProc.Transaction.StartTransaction;

  StoredProc.ExecProcedure('SYS_CONNECT_LOG_UPD', [Connect_PK_ID]);

  StoredProc.Transaction.Commit;
 except
  StoredProc.Transaction.Rollback;
  ShowMessage('Помилка!' + #13 + #13 + 'Помилка протоколювання транзакції користувача!');
 end;
end;

function TConnectLog.GetLocalComputerName: String;
var
 L : LongWord;
begin
 L := MAX_COMPUTERNAME_LENGTH + 2;
 SetLength(Result, L);
 if Windows.GetComputerName(PChar(Result), L) and (L > 0) then
  SetLength(Result, StrLen(PChar(Result)))
 else
  Result := '';
end;

function TConnectLog.GetUserName: string;
var
 Buffer: array[0..MAX_PATH] of Char;
 sz:DWord;
begin
 sz:=MAX_PATH-1;
 if windows.GetUserName(Buffer,sz) then begin
  if sz>0 then dec(sz);
  SetString(Result,Buffer,sz);
 end
 else Result := '';
end;

end.

 