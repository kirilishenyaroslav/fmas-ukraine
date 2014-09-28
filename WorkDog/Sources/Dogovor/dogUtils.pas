unit dogUtils;

interface
uses SysUtils, cxGridDBTableView, pFIBDataSet;

var
 SYS_MAX_TIMESTAMP : TDateTime;
 DATABASE_PATH     : string;
 SERVER            : string;
 DB_USER           : string;
 DB_PASS           : string;
 DB_CHARSET        : string;
 DB_DIALECT        : string;
 IMPORT_PATH       : string;

function GetAppPath : string;
procedure ReadIniFile;
function isInteger(const s : string) : boolean;
function isFloat(const s : string) : boolean;
function BoolToInt(const b : boolean) : shortint;
//Используются для мультивыбора-------------
//Переходит на первую выбранную запись в DataSet-е
function GoToFirstSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;
//Переходит на следующую выбранную запись в DataSet-е
function GoToNextSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;

implementation
uses Forms, IniFiles, cxCustomData, dogLoaderUnit, uPwdDecrypt;

function GoToFirstSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;
var
 i : integer;
begin
 Result := false;
 if DataSet.RecordCount = 0 then exit;
 TableView.DataController.FocusedRecordIndex := 0;
 i := 0;
 while (i < TableView.DataController.RecordCount) and (TableView.DataController.Values[i, 0] <> 1) do inc(i);
 DataSet.MoveBy(i);
 if i <> TableView.DataController.RecordCount then Result := true;
end;

function GoToNextSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;
var
 i : integer;
begin
 Result := false;
 if DataSet.RecordCount = 0 then exit;
 i := TableView.DataController.FocusedRecordIndex + 1;
 while (i < TableView.DataController.RecordCount) and (TableView.DataController.Values[i, 0] <> 1) do inc(i);
 DataSet.MoveBy(i - TableView.DataController.FocusedRecordIndex);
 if i <> TableView.DataController.RecordCount then Result := true;
end;

function GetAppPath : string;
begin
 Result := ExtractFileDir(Application.ExeName) + '\';
end;

procedure ReadIniFile;
var
 IniFile : TMemIniFile;
begin
 if not FileExists(GetAppPath + 'config.ini') then exit;
 IniFile := TMemIniFile.Create(GetAppPath + 'config.ini');
 DATABASE_PATH := IniFile.ReadString('CONNECTION', 'Path', DATABASE_PATH);
 dogUtils.SERVER := IniFile.ReadString('CONNECTION', 'Server', dogUtils.SERVER);
 dogUtils.DB_USER := IniFile.ReadString('CONNECTION', 'User', dogUtils.DB_USER);
 dogUtils.DB_PASS := IniFile.ReadString('CONNECTION', 'Password_Crypted', dogUtils.DB_PASS);
 dogUtils.DB_PASS :=  PwdDeCrypt(dogUtils.DB_PASS);
 DATABASE_PATH := dogUtils.SERVER + ':' + DATABASE_PATH;
 SYS_LANG_FILE := IniFile.ReadString('Params', 'Lang', '');
// IMPORT_PATH   := IniFile.ReadString('CONNECTION', 'Import path', IMPORT_PATH);
 IniFile.Free;
end;

procedure CheckInteger(var Key : char);
begin
 if not (Key in ['0'..'9',#8, #13]) then Key := #0;
end;

procedure CheckFloat(var Key : char);
begin
 if not (Key in ['0'..'9',#8, #13, DecimalSeparator]) then Key := #0;
end;

function isInteger(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
  CheckInteger(k);
  if k = #0 then exit;
 end;
 Result := true;
end;

function isFloat(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
  CheckFloat(k);
  if k = #0 then exit;
 end;
 i := pos(DecimalSeparator, s);
 if i <> 0 then if Copy(s, i + 1, Length(s) - i) = '' then exit;
 if pos(DecimalSeparator, Copy(s, i + 1, Length(s) - i)) <> 0 then exit;
 Result := true;
end;

function BoolToInt(const b : boolean) : shortint;
begin
 if b then Result := 1 else Result := 0;
end;

begin
 SYS_MAX_TIMESTAMP := StrToDateTime('01.01.2050');
end.

