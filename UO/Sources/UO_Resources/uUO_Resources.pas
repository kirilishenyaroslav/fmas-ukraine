unit uUO_Resources;

interface
uses Registry, Windows;

type UORejim = (uoAdd, uoEdit, uoDelete, uoView);

function SelectLanguage   : integer; stdcall;

implementation

{ выбор языка:  0-украинский, 1-русский}

function SelectLanguage: integer;
var
    reg           :TRegistry;
    RegisterValue :integer;
begin
   //вслучае боков по умолчанию будет украинский язык
   RegisterValue:=0;
   //чтение из регистра
   reg:=TRegistry.Create;
     try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\UO\Languegies\',false) then
        begin
           RegisterValue:=reg.ReadInteger('Index');
        end;
     finally
         reg.Free;
     end;
     result:=RegisterValue;
end;

end.
