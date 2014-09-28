unit MainCrypt;

interface
 function GetCrypted(password : string): string;
 function GetUnCrypted(cryptstring : string): string;
implementation

uses SysUtils, Dialogs;

function GetCrypted(password : string): string;
var
 i : integer;
 number : integer;
 crypted : string;
 s : char;
 add : string;
begin
 crypted := '';
 for i:=1 to length(password) do
  begin
   s := password[i];
   number := ord(s) + i;
   if number > 255 then number := number - 256;
   add := IntToStr(number);

   if length(Add)=1 then add:= '00'+add;
   if length(Add)=2 then add:= '0'+add;

   crypted := crypted + add;
  end;
 GetCrypted := crypted;
end;

function GetUnCrypted(cryptstring : string): string;
var
 i :integer;
 part : string;
 number : integer;
 add : char;
 password : string;
begin
 Password := '';
 for i:= 1 to Round(length(CryptString)/3) do
  Begin
   part := copy(CryptString,(3*i-2),3);
   number := StrToInt(part);
   number := number - i;
   If number < 0 then number := number + 256;
   add := chr(number);
   password := password + Add;
  End;
 GetUnCrypted := password;
end;

end.
