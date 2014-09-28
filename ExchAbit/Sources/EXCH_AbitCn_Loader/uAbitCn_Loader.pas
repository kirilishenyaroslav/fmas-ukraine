unit uAbitCn_Loader;

interface
uses
    Forms, Windows, SysUtils,  Variants, Classes, Controls, Ibase,uAbitCn_Resources,
    Dialogs,AArray;

resourcestring
     LoadErrorPrK        ='Помилка при роботі з бібліотекою ';
     LoadErrorCaptionPrK ='Увага помилка!';


//const PathPrK ='PrK\';

const Error_Caption             = 'Помилка';
const Load_Error                = 'Файл пакета не знайдено!!!';

function LoadSimplePackage(AOwner:TComponent;AParam:TAArray;
    BplName:String;FunctionName:String):Variant;overload;
function LoadSimplePackage(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:String):Variant;overload;


implementation

function LoadSimplePackage(AOwner:TComponent;AParam:TAArray;
    BplName:String;FunctionName:String):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;AParam:TAArray):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(BplName));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+BplName);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(FunctionName));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,AParam);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadSimplePackage:=Res;
end;

function LoadSimplePackage(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:String):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(BplName));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+BplName);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(FunctionName));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,ADB_HANDLE);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadSimplePackage:=Res;
end;
end.
