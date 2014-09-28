unit st_AccessCrypto_Unit;

interface
function Encrypt(const S: String; Key: Word): String;
function Decrypt(const S: String; Key: Word): String;
implementation

const
C1 = 52845;
C2 = 22719;

function Encrypt(const S: String; Key: Word): String;
var

I: byte;
begin
Result := S[1];
for I := 2 to Length(S)+1 do begin
Result := Result + char(byte(S[I]) xor (Key shr 8));
Key := (byte(Result[I]) + Key) * C1 + C2;
end;
end;

function Decrypt(const S: String; Key: Word): String;
var

I: byte;
begin
Result := S[1];
for I := 2 to Length(S)+1 do begin
Result := Result + char(byte(S[I]) xor (Key shr 8));
Key := (byte(S[I]) + Key) * C1 + C2;
end;
end;
end.
