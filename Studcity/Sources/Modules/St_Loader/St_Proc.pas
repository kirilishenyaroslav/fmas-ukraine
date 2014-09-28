unit St_Proc;

interface

uses Forms, Windows, SysUtils, Classes, StrUtils,Dialogs,StdCtrls, ShellAPI, Registry;

function IsMDIChildFormShow(AClass:TClass):boolean;
function  cnLanguageIndex:byte;
procedure LanguageSwitch;
function  IntegerCheck(const s : string) : boolean;

implementation

function IsMDIChildFormShow(AClass:TClass):boolean;
var IsFormShow:boolean;
    i:integer;
begin
IsFormShow:=False;
for i:=Application.MainForm.MDIChildCount-1 downto 0 do
 if (Application.MainForm.MDIChildren[i].ClassType = AClass) then
  begin
     IsFormShow:=True;
     Application.MainForm.MDIChildren[i].BringToFront;
     break;
  end;
IsMDIChildFormShow:=IsFormShow;
end;

procedure LanguageSwitch;
  var
    Layout: array[0.. KL_NAMELENGTH] of char;
  begin
    case cnLanguageIndex() of
      1: LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
      2: LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
    else
         LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
    end;
  end;

// чтение настроек языковых предпочтений клиента из реестра
function cnLanguageIndex:byte;
var
  reg: TRegistry;
  Index : string;
begin
     reg := TRegistry.Create;
      try
       reg.RootKey:=HKEY_CURRENT_USER;
       if  reg.OpenKey('\Software\Studcity\Options\Language',False) then
       begin
        Index := reg.ReadString('Index');
       end
       else Index := '1';
      finally
       reg.Free;
     end;
   Result := StrToInt(Index);
end;

// проверка строки на тип Integer
function IntegerCheck(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
  if not (k in ['0'..'9',#8, #13]) then k := #0;
  if k = #0 then exit;
 end;
 Result := true;
end;

end.
