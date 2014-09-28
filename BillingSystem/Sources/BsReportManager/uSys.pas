unit uSys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  IniFiles, Forms, uMain, uCommon_Messages, Dialogs, uPwdDecrypt, uPwdCrypt;

const
     IniFileName='config.ini';

type
  TBDConParams = record
     tdbPath:string;
     tdbServer:string;
     tdbUser:string;
     tdbPassword:string;
     tdbCharSet:string;
     tdbSQLDialect:SmallInt;
  end;

//var iFile:TIniFile;

function CheckIsExistIniFile:Boolean;
function DBGetParamsFromIni(Section:String):TBDConParams;
procedure DBSetParamsToIni(Section:string; DBParams:TBDConParams);
function DBGetConnectionStr(Section:string; isDB:Boolean):string;
function SourceSetParamsToIni(Section, InputStr:string):Boolean;
procedure InitParams(LocParams:TBDConParams);

implementation

procedure InitParams(LocParams:TBDConParams);
begin
  with LocParams do
  begin
     tdbPath:='';
     tdbServer:='';
     tdbUser:='';
     tdbPassword:='';
     tdbCharSet:='';
     tdbSQLDialect:=1;
  end;
end;

function CheckIsExistIniFile:Boolean;
begin
   Result:=True;
   if not FileExists(ExtractFileDir(Application.ExeName)+'\'+IniFileName) then
   begin
      bsShowMessage('Внимание!', 'Файл "config.ini" не был найден!', mtInformation, [mbOK]);
      Result:=False;
   end;
end;

function DBGetParamsFromIni(Section:String):TBDConParams;
var s:string;
    iFile:TIniFile;
begin
   if not CheckIsExistIniFile then Exit;
   iFile:=TIniFile.Create(ExtractFileDir(Application.ExeName)+'\'+IniFileName);
   with Result do
   begin
     tdbPath:=iFile.ReadString(Section, 'Path', tdbPath);
     tdbServer:=iFile.ReadString(Section, 'Server', tdbServer);
     tdbUser:=iFile.ReadString(Section, 'User', tdbUser);
     tdbPassword:=PwdDeCrypt(iFile.ReadString(Section, 'Password', tdbPassword));
     tdbCharSet:=iFile.ReadString(Section, 'CharSet', tdbCharSet);
     s:=iFile.ReadString(Section, 'SQLDialect', s);
     tdbSQLDialect:=StrToInt(s);
   end;
   iFile.Free;
end;

procedure DBSetParamsToIni(Section:string; DBParams:TBDConParams);
var iFile:TIniFile;
begin
  try
   if not CheckIsExistIniFile then Exit;
   iFile:=TIniFile.Create(ExtractFileDir(Application.ExeName)+'\'+IniFileName);
   iFile.WriteString(Section, 'Path', DBParams.tdbPath);
   iFile.WriteString(Section, 'Server', DBParams.tdbServer);
   iFile.WriteString(Section, 'User', DBParams.tdbUser);
   iFile.WriteString(Section, 'Password', PwdCrypt(DBParams.tdbPassword));
   iFile.WriteString(Section, 'CharSet', DBParams.tdbCharSet);
   iFile.WriteString(Section, 'SQLDialect', IntToStr(DBParams.tdbSQLDialect));
   iFile.Free;
 except on E:Exception
        do ShowMessage(E.Message);
 end;       
end;

function DBGetConnectionStr(Section:string; isDB:Boolean):string;
var s:string;
    iFile:TIniFile;
begin
   if not CheckIsExistIniFile then Exit;
   iFile:=TIniFile.Create(ExtractFileDir(Application.ExeName)+'\'+IniFileName);
   if isDB then
   begin
      //Путь расположения базы
      Result:=iFile.ReadString(Section, 'Server', Result);
      s:=iFile.ReadString(Section, 'Path', s);
      if ((Result='127.0.0.1') or (UpperCase(Result)='LOCALHOST')) then Result:=s
      else Result:=Result+':'+s;
   end
   else //Путь расположения модулей
    Result:=iFile.ReadString(Section, 'Path', Result);
   iFile.Free; 
end;

function SourceSetParamsToIni(Section, InputStr:string):Boolean;
var i:Integer;
    iFile:TIniFile;
begin
   if not CheckIsExistIniFile then Exit;
   iFile:=TIniFile.Create(ExtractFileDir(Application.ExeName)+'\'+IniFileName);
   Result:=True;
   for i:=Length(InputStr) downto 1 do
   begin
      if InputStr[i]='\' then
      begin
         bsShowMessage('Внимание!', 'В конце пути не должен стоять символ "\" !', mtInformation, [mbOK]);
         Result:=False;
      end;
      Break;
   end;
   if Result then iFile.WriteString(Section, 'Path', InputStr);
   iFile.Free;
end;

end.
