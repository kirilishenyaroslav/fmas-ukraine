unit MakeLicUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FIBQuery, pFIBQuery, FIBDatabase,
  pFIBDatabase, ExtCtrls, uSysL;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{procedure TForm1.ReadIniFile;
var
 IniFile : TMemIniFile;
begin
 if not FileExists(ExtractFilePath(Application.ExeName) + 'config.ini') then exit;
 IniFile := TMemIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
 WorkDatabase.DatabaseName := IniFile.ReadString('CONNECTION', 'Server', '') + ':' + IniFile.ReadString('CONNECTION', 'Path', '');
 WorkDatabase.ConnectParams.UserName := IniFile.ReadString('CONNECTION', 'User', '');
 WorkDatabase.ConnectParams.Password := IniFile.ReadString('CONNECTION', 'Password_Crypted', '');
 WorkDatabase.ConnectParams.Password := PwdDeCrypt(WorkDatabase.ConnectParams.Password);
 IniFile.Free;
end;}


procedure TForm1.FormCreate(Sender: TObject);
//var
// f : TextFile;
// s : string;
begin
{  AssignFile(f, ExtractFilePath(Application.ExeName) + 'license.dat');
  Reset(f);
  Readln(f, s);
  CloseFile(f);
  s := StrFromStr(s);}
{  ReadIniFile;
  try
    WorkDatabase.Connected := true;
  except
    on E: Exception do
    begin
      ShowMessage('Невозможно соединится с БД.' + #13 + e.Message);
      Application.Terminate;
    end;
  end;
  Transaction1.StartTransaction;}
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
//  Transaction1.Commit;
//  WorkDatabase.Connected := false;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
//var
// s : string;
// f : file;
begin
{  Query1.SQL.Text := 'select c.kod_edrpou from pub_sp_customer c, pub_sys_data d where C.ID_CUSTOMER = d.organization';
  Query1.ExecQuery;
  if Query1.RecordCount = 0 then
  begin
    ShowMessage('Система договоров настроена не корректно!' + #13 + 'Обратитесь к разработчику.');
    Close;
  end;
  s := StrToStr(Query1['KOD_EDRPOU'].AsString);
  Query1.Close;
  AssignFile(f, ExtractFilePath(Application.ExeName) + 'License.dat');
  Rewrite(f, 1);
  BlockWrite(f, s[1], Length(s));
  CloseFile(f);
  Timer1.Enabled := false;
  Close;}
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 s : string;
 f : file;
begin
  s := StrToStr(Edit1.Text);
  AssignFile(f, ExtractFilePath(Application.ExeName) + 'License.dat');
  Rewrite(f, 1);
  BlockWrite(f, s[1], Length(s));
  CloseFile(f);
//  Timer1.Enabled := false;
  Close;
end;

end.
