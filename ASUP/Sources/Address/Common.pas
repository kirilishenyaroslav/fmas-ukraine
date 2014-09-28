unit Common;

interface
uses pFIBDataBase, pFIBStoredProc, FIBDatabase, FIBDataSet, pFIBDataSet;

type
 TSPOptions = record
  soAdd : boolean;
  soDel : boolean;
  soMod : boolean;
  soSel : boolean;
 end;

const
 COMMON_SP_OPTIONS_ALL : TSPOptions = (soAdd: true; soDel: true; soMod: true; soSel: true);
 COMMON_SP_OPTIONS_WITHOUT_SEL : TSPOptions = (soAdd: true; soDel: true; soMod: true; soSel: false);

var
 common_database          : TpFIBDatabase;
 common_read_transaction  : TpFIBTransaction;
 common_write_transaction : TpFIBTransaction;


procedure CommonInitialize(Database : TpFIBDatabase; ReadTransaction : TpFIBTransaction; WriteTransaction : TpFIBTransaction);
procedure GetNewPrimaryKey(StoredProc : TpFIBStoredProc; const TableName : string; var NewID : integer);
procedure GetNewPrimaryKey2(DS : TpFIBDataSet; const TableName : string; var NewID : integer);

//String functions
function GetFirstWord(const text : string) : string;
function CutFirstWord(const text : string) : string;

implementation
uses  SysUtils, SYS_OPTIONS, Classes,  Controls;


function GetFirstWord(const text : string) : string;
var
 i : integer;
begin
 Result := '';
 if text = '' then exit;
 i := 1;
 while (i <= Length(text)) and (Text[i] <> ' ') and (Text[i] <> '.') do inc(i);
 Result := Copy(Text, 1, i - 1);
end;

function CutFirstWord(const text : string) : string;
var
 i : integer;
begin
 Result := '';
 if text = '' then exit;
 i := 1;
 while (i <= Length(text)) and (Text[i] <> ' ') and (Text[i] <> '.') do inc(i);
 Result := Trim(Copy(Text, i + 1, Length(Text) - i));
end;

procedure CommonInitialize(Database : TpFIBDatabase; ReadTransaction : TpFIBTransaction; WriteTransaction : TpFIBTransaction);
begin
 common_database := Database;
 common_read_transaction := ReadTransaction;
 common_write_transaction := WriteTransaction;
end;

procedure GetNewPrimaryKey(StoredProc : TpFIBStoredProc; const TableName : string; var NewID : integer);
var
 id : integer;
 tr : TFIBTransaction;
begin
// StoredProc.Transaction.StartTransaction;
 tr := StoredProc.Transaction;
 StoredProc.Transaction := COMMON_READ_TRANSACTION;
 if not StoredProc.Transaction.Active then StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_GEN_'+ TableName, []);
// StoredProc.Transaction.Commit;
 id := StoredProc['NEW_ID'].AsInteger;
 StoredProc.Close;
 StoredProc.Transaction := tr;
 NewID := StrToInt(IntToStr(id) + IntToStr(SYS_SERVER));
end;

procedure GetNewPrimaryKey2(DS : TpFIBDataSet; const TableName : string; var NewID : integer);
var
 id : integer;
begin
 DS.SelectSQL.Text := 'select * from PROC_GEN_'+ TableName;
 DS.Open;
 id := DS['NEW_ID'];
 DS.Close;
 NewID := StrToInt(IntToStr(id) + IntToStr(SYS_SERVER));
end;

end.
