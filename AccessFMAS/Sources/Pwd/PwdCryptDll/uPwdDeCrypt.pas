unit uPwdDecrypt;

interface

uses Windows;

type A = array[0..255] of Char;

procedure PwdDeCrypt(var Buffer:LPTSTR; var Len:UINT);stdcall;

function PwdDeCrypt2(var Buffer:A):Integer; stdcall;
exports PwdDeCrypt, PwdDeCrypt2;

implementation

uses uCrUtils, StrUtils, SysUtils, dialogs;

procedure PwdDeCrypt(var Buffer:LPTSTR; var Len:UINT);
var
    i: LongWord;
    b: Boolean;
    ts: String;
    s: string;
    Result_:string;
begin
    SetString(s, buffer, len);

    ts := '';
    for i:=1 to Length(s) do
        if i mod 2 = 0 then ts := ts + s[i];

    ts := ReverseString(ts);

    Result_ := '';
    while ts <> '' do
    begin
        i := GetIntFromHex(ts, b);
        i := UnScramble(i);
        if b then
        begin
            Result_ := 'ERROR!';
            Exit;
        end;
        Result_ := Result_ + IntToString(i);
    end;
    Result_ := ReverseString(Result_);
    Result_ := UnScrStr(Result_);

    buffer:=PChar(Result_);
    len   :=Length(Result_);
end;

function PwdDeCrypt2(var Buffer: A):Integer;
var str:string;
    i:Integer;
    b:PAnsiChar;
    len:UINT;
begin
     for i:=0 to 255 do
     begin
          str:=str+Buffer[i];
     end;
     b:=PAnsiChar(str);
     len:=Length(b);

     PwdDeCrypt(b,len);

     for i:=0 to len do
     begin
          Buffer[i]:=b[i];
     end;

     Result:=len;
end;


end.
