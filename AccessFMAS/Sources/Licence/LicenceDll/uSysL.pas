unit uSysL;

interface
uses Windows, SysUtils, Forms, pFIBDataBase, pFIBDataSet, Dialogs, IB_EXTERNALS;

const
 no_lic_str = 'У вас нет лицензии на использование данного продукта.';
 
function StrToStr(const s : string) : string; // :-)
procedure CheckLic(db_h : PVoid); stdcall;

exports CheckLic;

implementation

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
  Result := '';
  str := Copy(s, 2, Length(s) - 3);
  i := 1;
  while i <= Length(str) do
  begin
    if Result <> '' then if Result[Length(Result)] <> orig[Length(Result)]
                             then begin
                                        MessageBox(Application.Handle,  'Помилка при роботі з ліцензією.','Увага!', MB_OK + MB_ICONSTOP);
                                        Application.Terminate;
                             end;
    h := '';
    for v := 1 to 2 do
    begin
      c := str[i] + str[i + 1];
      d := chr(StrToInt('$' + c));
      i := i + 2;
    if Result <> '' then if Result[Length(Result)] <> orig[Length(Result)]
                            then begin
                                      MessageBox(Application.Handle,  'Помилка при роботі з ліцензією.','Увага!', MB_OK + MB_ICONSTOP);

                                      Application.Terminate;
                            end;
      c := str[i] + str[i + 1];
      d := d + chr(StrToInt('$' + c));
      i := i + 2;
      c := str[i] + str[i + 1];
    if Result <> '' then if Result[Length(Result)] <> orig[Length(Result)]
                             then begin
                                        MessageBox(Application.Handle,  'Помилка при роботі з ліцензією.','Увага!', MB_OK + MB_ICONSTOP);
                                        Application.Terminate;
                             end;
      d := d + chr(StrToInt('$' + c));
      i := i + 3;
      k := StrToInt(d);
    if Result <> '' then if Result[Length(Result)] <> orig[Length(Result)]
                             then begin
                                       MessageBox(Application.Handle,  'Помилка при роботі з ліцензією.','Увага!', MB_OK + MB_ICONSTOP);
                                       Application.Terminate;
                             end;
      h := h + chr(k);
    end;
    Result := Result + chr(StrToInt('$' + h));
    if Result <> '' then if Result[Length(Result)] <> orig[Length(Result)]
                             then begin
                                       MessageBox(Application.Handle,  'Помилка при роботі з ліцензією.','Увага!', MB_OK + MB_ICONSTOP);
                                       Application.Terminate;
                             end;
  end;

  if Length(Result) <> Length(orig)
  then begin
            MessageBox(Application.Handle,  'Помилка при роботі з ліцензією.','Увага!', MB_OK + MB_ICONSTOP);

            Application.Terminate;

  end;
  if (Length(Result) <> Length(orig)) or (Result <> orig)
  then begin
            MessageBox(Application.Handle,  'Помилка при роботі з ліцензією.','Увага!', MB_OK + MB_ICONSTOP);

            Application.Terminate;
  end;
  if Result <> orig
  then begin
            MessageBox(Application.Handle,  'Помилка при роботі з ліцензією.','Увага!', MB_OK + MB_ICONSTOP);

            Application.Terminate;
  end;
end;

procedure CheckLic(db_h : PVoid);
var  tr  : TpFIBTransaction;
     ds  : TpFIBDataSet;
     db  : TpFIBDatabase;
      f  : TextFile;
   a, b  : double;
      s  : string;
begin
 db := TpFIBDatabase.Create(Nil);
 db.SQLDialect := 3;
 db.Handle := db_h;
 tr := TpFIBTransaction.Create(Nil);
 tr.DefaultDatabase := db;

 ds := TpFIBDataSet.Create(Nil);
 ds.Database := db;
 ds.Transaction := tr;
 tr.StartTransaction;
 try
     ds.SelectSQL.Text := 'select c.kod_edrpou from pub_sp_customer c, pub_sys_data d where C.ID_CUSTOMER = d.organization';
     ds.Open;
 except
     Application.MessageBox('Помилка при роботі з ліцензією.','Увага!', MB_OK + MB_ICONSTOP);
     Application.Terminate;
 end;

 if ds.RecordCount = 0
 then begin
           MessageBox(Application.Handle,  'Помилка при роботі з ліцензією.','Увага!', MB_OK + MB_ICONSTOP);

           Application.Terminate;
 end;

 if not FileExists(ExtractFilePath(Application.ExeName) + 'License.dat')
 then
 begin
  b := 3.14;
  db.Connected := false;
  db.Free;
  Application.Terminate;
  MessageBox(Application.Handle,  'Помилка при роботі з ліцензією.','Увага!', MB_OK + MB_ICONSTOP);
  ShowMessage(FormatFloat('0.00', a));
 end;
 try
  AssignFile(f, ExtractFilePath(Application.ExeName) + 'License.dat');
  Reset(f);
  ReadLn(f, s);
 except
  MessageBox(Application.Handle,  'Помилка при роботі з ліцензією.','Увага!', MB_OK + MB_ICONSTOP);
  Application.Terminate;
 end;
 CloseFile(f);
 try
  StrFromStr(s, ds['KOD_EDRPOU']);
 except
  Application.Terminate;
 end; 
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

end.
