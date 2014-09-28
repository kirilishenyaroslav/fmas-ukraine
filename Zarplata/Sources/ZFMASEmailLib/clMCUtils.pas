{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clMCUtils;

interface

{$I clVer.inc}

const
  cDefaultPop3Port = 110;
  cDefaultSmtpPort = 25;

function GenerateMessageID: string;
function GenerateCramMD5Key: string;

implementation

uses
  Windows, SysUtils, clSocket;

var
  MessageCounter: Integer = 0;

function GenerateMessageID: string;
var
  y, mm, d, h, m, s, ms: Word;
begin
  DecodeTime(Now(), h, m, s, ms);
  DecodeDate(Date(), y, mm, d);
  Result := IntToHex(mm, 2) + IntToHex(d, 2) + IntToHex(h, 2)
    + IntToHex(m, 2) + IntToHex(s, 2) + IntToHex(ms, 2);
  InterlockedIncrement(MessageCounter);
  Result := '<' + IntToHex(GetTickCount(), 8) + '$'
    + system.Copy(Result, 1, 12) + '$'
    + IntToHex(MessageCounter, 3) + IntToHex(MessageCounter * 2, 3) + '@'
    + GetLocalHost() + '>';
end;

function GenerateCramMD5Key: string;
var
  y, mm, d, h, m, s, ms: Word;
begin
  DecodeTime(Now(), h, m, s, ms);
  DecodeDate(Date(), y, mm, d);
  Result := Format('<INETSUITE-F%d%d%d%d%d.%s@%s>',
    [y, mm, d, h, m, IntToHex(m, 3) + IntToHex(s, 3) + IntToHex(ms, 3) + IntToHex(Random(100), 5),
    GetLocalHost()]);
end;

end.


