{*******************************************************************************
* uCrUtils                                                                     *
*                                                                              *
* Вспомогательные утилиты для шифрования                                       *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}

unit uCrUtils;

interface

const Hex = '-A;?()BWXQ8$wa+!';

function IntToHex(i: LongWord): String;
function GetIntFromString(var s: String): LongWord;
function GetIntFromHex(var s: String; var Error: Boolean): LongWord;
function IntToString(i: LongWord): String;
function Scramble(i: LongWord): LongWord;
function UnScramble(i: LongWord): LongWord;
function ScrStr(s: String): String;
function UnScrStr(s: String): String;
function RandomHex: Char;

implementation

uses StrUtils;

function RandomHex: Char;
begin
    Result := Hex[1+Random(Length(Hex))];
end;

function ScrStr(s: String): String;
var
    i: Integer;
    c: Char;
begin
    Result := '';

    for i:=1 to Length(s) do
    begin
        c := chr((ord(s[i]) + 7*i) mod 256);
        Result := Result + c;
    end;
end;

function UnScrStr(s: String): String;
var
    i: Integer;
    c: Char;
begin
    Result := '';
    for i:=1 to Length(s) do
    begin
        c := chr((ord(s[i]) - 7*i) mod 256);
        Result := Result + c;
    end;
end;

function Scramble(i: LongWord): LongWord;
begin
    Result := i xor $17061983;
end;

function UnScramble(i: LongWord): LongWord;
begin
    Result := i xor $17061983;
end;


function IntToHex(i: LongWord): String;
var
    ii, len: LongWord;
begin
    Result := '';
    while ( i > 0 ) do
    begin
        Result := Result + Hex[1+i mod 16];
        i := i div 16;
    end;

    len := Length(Result);
    for ii:=len to 7 do
        Result := Hex[1] + Result;
end;

function GetIntFromString(var s: String): LongWord;
var
    i, len: LongWord;
begin
    Result := 0;
    len := Length(s);
    if len > 4 then len := 4;

    for i:=1 to len do
    begin
        Result := Result shl 8;
        Result := Result + Ord(s[i]);
    end;

    s := Copy(s, len+1, Length(s));
end;

function GetIntFromHex(var s: String; var Error: Boolean): LongWord;
var
    i, p: LongWord;
begin
    Error := False;

    if ( Length(s) mod 2 = 1 ) or ( Length(s) < 8 )then
    begin
        Error := True;
        s := '';
        Result := 0;
        Exit;
    end;

    Result := 0;
    for i:=1 to 8 do
    begin
        Result := Result shl 4;
        p := Pos(s[i], Hex);
        if p = 0 then
        begin
            Error := True;
            s := '';
            Exit;
        end
        else Result := Result + p-1;
    end;
    s := Copy(s, 9, Length(s));
end;

function IntToString(i: LongWord): String;
var
    t: LongWord;
begin
    Result := '';
    while i > 0 do
    begin
        t := i mod 256;
        if t > 0 then
            Result := Result + Chr(t);
        i := i div 256;
    end;
end;

initialization
    Randomize;

end.
