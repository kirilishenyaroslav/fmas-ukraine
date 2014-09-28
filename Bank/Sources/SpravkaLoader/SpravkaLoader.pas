unit SpravkaLoader;

interface

uses Forms, Windows, IBase, Dialogs,
     SysUtils, Variants, Classes, Controls, pFIBDataBase;


resourcestring
     ErrorLLibrary   =           'Внимание, ошибка при работе с библиотекой ';
     ErrorWarningC   =           'Внимание ошибка!';

const   MY_KASSA      ='Kassa\';
const   MY_People     ='SpAllPeople.bpl';
const   AVANCE_PATH   ='Avance\';
const   Bank          ='Bank\';
const   Path_ClBank   ='ClBank\';

const Name_ConfigClBank ='ConfigClBank.bpl';
const Name_RunClBank    ='RunClBank.bpl';
const Name_ViewClBank   ='ViewClBank.bpl';
const Name_AddDocClBank ='AddDocClBank.bpl';


//работа с кассовыми днями
function Lspravka(AOwner:TComponent; id_user : int64; DB : TpFIBDatabase; kod_system : integer):Integer;stdcall;

implementation


function Lspravka(AOwner:TComponent; id_user : int64; DB : TpFIBDatabase; kod_system : integer):Integer;stdcall;
var func:function(AOwner:TComponent; id_user : int64; DB : TpFIBDatabase; kod_system : integer):integer;stdcall;
    HandlePack: HModule;
begin
  Lspravka := -1;
  HandlePack := GetModuleHandle('SpravkaBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bank+'SpravkaBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('spravka'));
            if @func<>nil
            then Lspravka := func(AOwner, id_user, DB, kod_system);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'SpravkaBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
  end;
end;

end.

