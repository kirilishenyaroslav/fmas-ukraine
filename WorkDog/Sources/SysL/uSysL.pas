unit uSysL;

interface
uses Windows, SysUtils, Forms, pFIBDataBase, pFIBDataSet, Dialogs, IB_EXTERNALS;

const
 no_lic_str = 'У вас нет лицензии на использование данного продукта.' + #13 +
              'Обратитесь к разработчикам ДонНУ:' + #13 +
              'тел. +38(062)3055027' + #13 +
              'e-mail: sfm_support@buhg.dongu.donetsk.ua';

function StrToStr(const s : string) : string; // :-)
procedure CheckLic(db_h : PVoid);

implementation

var
 ff : textfile;
 useLog : boolean = false;

function StrFromStr(const s, orig : string) : string; // :-)
var
 i : integer;
 j : integer;
 k : integer;
 v : integer;
 c : string;
 h : string;
 d : string;
 str : string;
 a, b : double;
begin
  if useLog then WriteLn(ff, 'Begin decode file data');
  Result := '';
  str := Copy(s, 2, Length(s) - 3);
  i := 1;
  while i <= Length(str) do
  begin
    if Result <> '' then if Result[Length(Result)] <> orig[Length(Result)] then
    begin
      ShowMessage(no_lic_str);
      Application.Terminate;
    end;
    h := '';
    for v := 1 to 2 do
    begin
      c := str[i] + str[i + 1];
      d := chr(StrToInt('$' + c));
      i := i + 2;
    if Result <> '' then if Result[Length(Result)] <> orig[Length(Result)] then
    begin
      ShowMessage(no_lic_str);
      Application.Terminate;
    end;
      c := str[i] + str[i + 1];
      d := d + chr(StrToInt('$' + c));
      i := i + 2;
      c := str[i] + str[i + 1];
    if Result <> '' then if Result[Length(Result)] <> orig[Length(Result)] then
    begin
      ShowMessage(no_lic_str);
      Application.Terminate;
    end;
      d := d + chr(StrToInt('$' + c));
      i := i + 3;
      k := StrToInt(d);
    if Result <> '' then if Result[Length(Result)] <> orig[Length(Result)] then
    begin
      ShowMessage(no_lic_str);
      Application.Terminate;
    end;  
      h := h + chr(k);
    end;
    if useLog then WriteLn(ff, 'Adding to result char: ' + chr(StrToInt('$' + h)));
    Result := Result + chr(StrToInt('$' + h));
    if Result <> '' then if Result[Length(Result)] <> orig[Length(Result)] then
    begin
      ShowMessage(no_lic_str);
      Application.Terminate;
    end;
  end;
  if Length(Result) <> Length(orig) then
  begin
    ShowMessage(no_lic_str);
    Application.Terminate;
  end;
  if (Length(Result) <> Length(orig)) or (Result <> orig) then
  begin
    ShowMessage(no_lic_str);
    Application.Terminate;
  end;  
  if Result <> orig then
  begin
    ShowMessage(no_lic_str);
    Application.Terminate;
  end;
 if useLog then WriteLn(ff, 'Result = ' + Result);
{  v := Round(cos(random - random + 0.12 * (ord('A') + ord('N') + ord('T') + ord('O') + ord('N'))) * 100);
  Result := Result + CHR(v xor $00001f);
  for i := 1 to Length(s) do
  begin
    h := IntToHex(ord(s[i]), 2);
    for j := 1 to Length(h) do
    begin
      c := IntToStr(ord(h[j]));
      if Length(c) = 1 then c := '00' + c;
      if Length(c) = 2 then c := '0' + c;
      for k := 1 to Length(c) do
      begin
        d := IntToHex(ord(c[k]), 2);
        Result := Result + d;
      end;
      v := Round(cos(random - random + 0.12 * (ord(h[1]) * ord(d[2]))) * 100);
      Result := Result + CHR(v xor $001faa);
    end;
  end;
  Result := Result + CHR(v xor $00001f);}
end;

procedure CheckLic(db_h : PVoid);
var
 tr  : TpFIBTransaction;
 ds : TpFIBDataSet;
 db : TpFIBDatabase;
 f : File;
 a, b : double;
 s    : string;
 sz : integer;
begin
 if useLog then
 begin
   WriteLn(ff, 'SysL log file ver. 1.0.');
   Write(ff, 'Connecting to DB... ');
 end;
 db := TpFIBDatabase.Create(Nil);
 db.SQLDialect := 3;
 db.Handle := db_h;

 if useLog then WriteLn(ff, 'Done');

 tr := TpFIBTransaction.Create(Nil);
 tr.DefaultDatabase := db;

 if useLog then Write(ff, 'Creating dataset... ');

 ds := TpFIBDataSet.Create(Nil);
 ds.Database := db;
 ds.Transaction := tr;

 if useLog then WriteLn(ff, 'Done');
 if useLog then Write(ff, 'Executing query: ''select c.kod_edrpou from pub_sp_customer c, pub_sys_data d where C.ID_CUSTOMER = d.organization''... ');

 tr.StartTransaction;
 try
  ds.SelectSQL.Text := 'select c.kod_edrpou from pub_sp_customer c, pub_sys_data d where C.ID_CUSTOMER = d.organization';
  ds.Open;
 except
  Application.Terminate;
 end;

 if useLog then WriteLn(ff, 'Done');
 if useLog then WriteLn(ff, 'Query return ' + IntToStr(ds.RecordCount) + ' records.');

 if ds.RecordCount = 0 then
 begin
   ShowMessage(no_lic_str);
   Application.Terminate;
 end;

 if useLog then Write(ff, 'Checking file exists ''License.dat''... ');
 if not FileExists(ExtractFilePath(Application.ExeName) + 'License.dat') then
 begin
  if useLog then WriteLn(ff, 'Failed');
  b := 3.14;
  db.Connected := false;
  db.Free;
  ShowMessage(no_lic_str);
  Application.Terminate;
  exit;
  ShowMessage(FormatFloat('0.00', a));
 end;
 if useLog then WriteLn(ff, 'Done');

 try
  if useLog then Write(ff, 'Assign file... ');
  AssignFile(f, ExtractFilePath(Application.ExeName) + 'License.dat');
  if useLog then WriteLn(ff, 'Done');
  if useLog then Write(ff, 'Reseting file... ');
  FileMode := 0;
  Reset(f, 1);
  FileMode := 2;
  if useLog then WriteLn(ff, 'Done');
  if useLog then Write(ff, 'Get file size... ');
  sz := FileSize(f);
  if useLog then WriteLn(ff, 'Done');
  SetLength(s, sz);
  if useLog then Write(ff, 'Block read... ');
  BlockRead(f, s[1], sz);
  if useLog then WriteLn(ff, 'Done');
//  ReadLn(f, s);
 except
  ShowMessage(no_lic_str);
  Application.Terminate;
 end;
 CloseFile(f);
 try
  StrFromStr(s, ds['KOD_EDRPOU']);
 except
  ShowMessage(no_lic_str);
  Application.Terminate;
 end; 
 if useLog then WriteLn(ff, 'License checked succesfuly!');
 ds.Close;
 tr.Commit;
 tr.Free;
 ds.Free;
 db.Free;
end;

function StrToStr(const s : string) : string; // :-)
var
 i : integer;
 j : integer;
 k : integer;
 v : integer;
 c : string;
 h : string;
 d : string;
begin
  Result := '';
  v := Round(cos(random - random + 0.12 * (ord('A') + ord('N') + ord('T') + ord('O') + ord('N'))) * 100);
  Result := Result + CHR(v xor $00001f);
  for i := 1 to Length(s) do
  begin
    h := IntToHex(ord(s[i]), 2);
    for j := 1 to Length(h) do
    begin
      c := IntToStr(ord(h[j]));
      if Length(c) = 1 then c := '00' + c;
      if Length(c) = 2 then c := '0' + c;
      for k := 1 to Length(c) do
      begin
        d := IntToHex(ord(c[k]), 2);
        Result := Result + d;
      end;
      v := Round(cos(random - random + 0.12 * (ord(h[1]) * ord(d[2]))) * 100);
//      Result := Result + ' ';
      Result := Result + CHR(v xor $001faa);
    end;
  end;
  Result := Result + CHR(v xor $00001f);
end;

initialization
begin
 if useLog then
 begin
   AssignFile(ff, 'C:\SysL.log');
   Rewrite(ff);
 end;
end;

finalization
begin
 if useLog then CloseFile(ff);
end;

end.

