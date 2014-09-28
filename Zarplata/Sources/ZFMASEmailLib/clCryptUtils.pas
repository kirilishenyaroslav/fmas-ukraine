{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clCryptUtils;

interface

function MD5(const Value: string): string;
function HMAC_MD5(const Text, Key: string): string;

implementation

uses
  SysUtils;

type
  TMD5Ctx = record
    State: array[0..3] of integer;
    Count: array[0..1] of integer;
    case Integer of
      0: (BufChar: array[0..63] of Byte);
      1: (BufLong: array[0..15] of integer);
  end;

procedure MD5Init(var MD5Context: TMD5Ctx);
begin
  FillChar(MD5Context, SizeOf(TMD5Ctx), #0);
  with MD5Context do begin
    State[0] := Integer($67452301);
    State[1] := Integer($EFCDAB89);
    State[2] := Integer($98BADCFE);
    State[3] := Integer($10325476);
  end
end;

{$Q-}
procedure MD5Transform(var Buf:array of LongInt; const Data:array of LongInt);
  {
    This algorithm based on the arithmetic operations overflow and rounding.
    This is because the overflow checking is disabled here.
  }
var
  A,B,C,D: LongInt;

  procedure Round1(var W: LongInt; X, Y, Z, Data: LongInt; S: Byte);
  begin
    Inc(W, (Z xor (X and (Y xor Z))) + Data);
    W := (W shl S) or (W shr (32 - S));
    Inc(W, X);
  end;

  procedure Round2(var W: LongInt; X, Y, Z, Data: LongInt; S: Byte);
  begin
    Inc(W, (Y xor (Z and (X xor Y))) + Data);
    W := (W shl S) or (W shr (32 - S));
    Inc(W, X);
  end;

  procedure Round3(var W: LongInt; X, Y, Z, Data: LongInt; S: Byte);
  begin
    Inc(W, (X xor Y xor Z) + Data);
    W := (W shl S) or (W shr (32 - S));
    Inc(W, X);
  end;

  procedure Round4(var W: LongInt; X, Y, Z, Data: LongInt; S: Byte);
  begin
    Inc(W, (Y xor (X or not Z)) + Data);
    W := (W shl S) or (W shr (32 - S));
    Inc(W, X);
  end;

begin
  A:=Buf[0];
  B:=Buf[1];
  C:=Buf[2];
  D:=Buf[3];

  Round1(A,B,C,D, Data[ 0] + longint($d76aa478),  7);
  Round1(D,A,B,C, Data[ 1] + longint($e8c7b756), 12);
  Round1(C,D,A,B, Data[ 2] + longint($242070db), 17);
  Round1(B,C,D,A, Data[ 3] + longint($c1bdceee), 22);
  Round1(A,B,C,D, Data[ 4] + longint($f57c0faf),  7);
  Round1(D,A,B,C, Data[ 5] + longint($4787c62a), 12);
  Round1(C,D,A,B, Data[ 6] + longint($a8304613), 17);
  Round1(B,C,D,A, Data[ 7] + longint($fd469501), 22);
  Round1(A,B,C,D, Data[ 8] + longint($698098d8),  7);
  Round1(D,A,B,C, Data[ 9] + longint($8b44f7af), 12);
  Round1(C,D,A,B, Data[10] + longint($ffff5bb1), 17);
  Round1(B,C,D,A, Data[11] + longint($895cd7be), 22);
  Round1(A,B,C,D, Data[12] + longint($6b901122),  7);
  Round1(D,A,B,C, Data[13] + longint($fd987193), 12);
  Round1(C,D,A,B, Data[14] + longint($a679438e), 17);
  Round1(B,C,D,A, Data[15] + longint($49b40821), 22);

  Round2(A,B,C,D, Data[ 1] + longint($f61e2562),  5);
  Round2(D,A,B,C, Data[ 6] + longint($c040b340),  9);
  Round2(C,D,A,B, Data[11] + longint($265e5a51), 14);
  Round2(B,C,D,A, Data[ 0] + longint($e9b6c7aa), 20);
  Round2(A,B,C,D, Data[ 5] + longint($d62f105d),  5);
  Round2(D,A,B,C, Data[10] + longint($02441453),  9);
  Round2(C,D,A,B, Data[15] + longint($d8a1e681), 14);
  Round2(B,C,D,A, Data[ 4] + longint($e7d3fbc8), 20);
  Round2(A,B,C,D, Data[ 9] + longint($21e1cde6),  5);
  Round2(D,A,B,C, Data[14] + longint($c33707d6),  9);
  Round2(C,D,A,B, Data[ 3] + longint($f4d50d87), 14);
  Round2(B,C,D,A, Data[ 8] + longint($455a14ed), 20);
  Round2(A,B,C,D, Data[13] + longint($a9e3e905),  5);
  Round2(D,A,B,C, Data[ 2] + longint($fcefa3f8),  9);
  Round2(C,D,A,B, Data[ 7] + longint($676f02d9), 14);
  Round2(B,C,D,A, Data[12] + longint($8d2a4c8a), 20);

  Round3(A,B,C,D, Data[ 5] + longint($fffa3942),  4);
  Round3(D,A,B,C, Data[ 8] + longint($8771f681), 11);
  Round3(C,D,A,B, Data[11] + longint($6d9d6122), 16);
  Round3(B,C,D,A, Data[14] + longint($fde5380c), 23);
  Round3(A,B,C,D, Data[ 1] + longint($a4beea44),  4);
  Round3(D,A,B,C, Data[ 4] + longint($4bdecfa9), 11);
  Round3(C,D,A,B, Data[ 7] + longint($f6bb4b60), 16);
  Round3(B,C,D,A, Data[10] + longint($bebfbc70), 23);
  Round3(A,B,C,D, Data[13] + longint($289b7ec6),  4);
  Round3(D,A,B,C, Data[ 0] + longint($eaa127fa), 11);
  Round3(C,D,A,B, Data[ 3] + longint($d4ef3085), 16);
  Round3(B,C,D,A, Data[ 6] + longint($04881d05), 23);
  Round3(A,B,C,D, Data[ 9] + longint($d9d4d039),  4);
  Round3(D,A,B,C, Data[12] + longint($e6db99e5), 11);
  Round3(C,D,A,B, Data[15] + longint($1fa27cf8), 16);
  Round3(B,C,D,A, Data[ 2] + longint($c4ac5665), 23);

  Round4(A,B,C,D, Data[ 0] + longint($f4292244),  6);
  Round4(D,A,B,C, Data[ 7] + longint($432aff97), 10);
  Round4(C,D,A,B, Data[14] + longint($ab9423a7), 15);
  Round4(B,C,D,A, Data[ 5] + longint($fc93a039), 21);
  Round4(A,B,C,D, Data[12] + longint($655b59c3),  6);
  Round4(D,A,B,C, Data[ 3] + longint($8f0ccc92), 10);
  Round4(C,D,A,B, Data[10] + longint($ffeff47d), 15);
  Round4(B,C,D,A, Data[ 1] + longint($85845dd1), 21);
  Round4(A,B,C,D, Data[ 8] + longint($6fa87e4f),  6);
  Round4(D,A,B,C, Data[15] + longint($fe2ce6e0), 10);
  Round4(C,D,A,B, Data[ 6] + longint($a3014314), 15);
  Round4(B,C,D,A, Data[13] + longint($4e0811a1), 21);
  Round4(A,B,C,D, Data[ 4] + longint($f7537e82),  6);
  Round4(D,A,B,C, Data[11] + longint($bd3af235), 10);
  Round4(C,D,A,B, Data[ 2] + longint($2ad7d2bb), 15);
  Round4(B,C,D,A, Data[ 9] + longint($eb86d391), 21);

  Inc(Buf[0],A);
  Inc(Buf[1],B);
  Inc(Buf[2],C);
  Inc(Buf[3],D);
end;
{$Q+}

procedure MD5Update(var MD5Context: TMD5Ctx; const Data: string);
var
  Index, T, Len: Integer;
begin
  len := Length(Data);
  with MD5Context do
  begin
    T := Count[0];
    Inc(Count[0], Len shl 3);
    if Count[0]<T then
      Inc(Count[1]);
    Inc(Count[1], Len shr 29);
    T:=(T shr 3) and $3F;
    Index:=0;
    if T<>0 then
    begin
      Index:=T;
      T:=64-T;
      if Len<T then
        begin
          Move(Data, Bufchar[Index], Len);
          Exit;
        end;
      Move(Data, Bufchar[Index], T);
      MD5Transform(State, Buflong);
      Dec(Len, T);
      Index:=T;
    end;
    while Len>=64 do
    begin
      Move(Data[Index+1], Bufchar, 64);
      MD5Transform(State, Buflong);
      Inc(Index, 64);
      Dec(Len, 64);
    end;
    if (Index < Length(Data)) then
    begin
      Move(Data[Index+1], Bufchar, Len);
    end;
  end
end;

function MD5Final(var MD5Context: TMD5Ctx): string;
var
  Cnt : Word;
  P   : Byte;
  Digest: array[0..15] of Char;
  i: Integer;
begin
  for i := 0 to 15 do
    Byte(Digest[i]) := i + 1;
  with MD5Context do
  begin
    Cnt := (Count[0] shr 3) and $3F;
    P := Cnt;
    BufChar[P] := $80;
    Inc(P);
    Cnt := 64 - 1 - Cnt;
    if (Cnt < 8) then
    begin
      FillChar(BufChar[P], Cnt, #0);
      MD5Transform(State, BufLong);
      FillChar(BufChar, 56, #0);
    end
    else
      FillChar(BufChar[P], Cnt-8, #0);
    BufLong[14] := Count[0];
    BufLong[15] := Count[1];
    MD5Transform(State, BufLong);
    Move(State, Digest, 16);
    Result := '';
    for i := 0 to 15 do
      Result := Result + Char(Digest[i]);
  end;
  FillChar(MD5Context, SizeOf(TMD5Ctx), #0)
end;

function StrToHex(const Value: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Value) do
    Result := Result + IntToHex(Byte(Value[i]), 2);
  Result := LowerCase(Result);
end;

function MD5(const Value: string): string;
var
  MD5Context : TMD5Ctx;
begin
  MD5Init(MD5Context);
  MD5Update(MD5Context, Value);
  Result := StrToHex(MD5Final(MD5Context));
end;

function HMAC_MD5(const Text, Key: string): string;
var
  i: Integer;
  ipad, opad, S, EncodedKey: string;
  MD5Context : TMD5Ctx;
begin
  EncodedKey := Key;
  if (Length(EncodedKey) > 64) then
    EncodedKey := MD5(EncodedKey);
  ipad := '';
  for i := 1 to 64 do
    ipad := ipad + #$36;
  opad := '';
  for i := 1 to 64 do
    opad := opad + #$5c;
  for i := 1 to Length(EncodedKey) do
  begin
    ipad[i] := char(byte(ipad[i]) xor byte(EncodedKey[i]));
    opad[i] := char(byte(opad[i]) xor byte(EncodedKey[i]));
  end;
  MD5Init(MD5Context);
  MD5Update(MD5Context, ipad);
  MD5Update(MD5Context, Text);
  S := MD5Final(MD5Context);
  MD5Init(MD5Context);
  MD5Update(MD5Context, opad);
  MD5Update(MD5Context, S);
  Result := StrToHex(MD5Final(MD5Context));
end;

end.
