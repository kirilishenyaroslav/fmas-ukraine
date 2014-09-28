unit uUO_Loader;

interface
uses
    Forms, Windows, SysUtils,  Variants, Classes, Controls, Ibase,
    Dialogs, AArray;

resourcestring
     LoadErrorUo        ='Помилка при роботі з бібліотекою ';
     LoadErrorCaptionUo ='Увага помилка!';

const PathUO ='UO\';
const Error_Caption             = 'Помилка';
const Load_Error                = 'Файл пакета не знайдено!!!';

// загрузчик всех bpl
procedure ShowAllUoBpl (aOwner: TComponent;aParam :TAArray);
// загрузчик всех прочих bpl )
function LoadSimplePackage(AOwner:TComponent;AParam:TAArray;
    BplName:String;FunctionName:String):Variant; overload;
function LoadSimplePackage(AOwner:TComponent;AParam:TISC_DB_HANDLE;
    BplName:String;FunctionName:String):Variant; overload;

implementation

procedure ShowAllUoBpl (aOwner: TComponent;aParam :TAArray);
var
  HandlePack: HModule;
  MDIFUNC   : procedure(aOwner: TComponent;aParam :TAArray);stdcall;
begin
  HandlePack:=GetModuleHandle(Pchar(aParam['Name_Bpl'].AsString));
  if HandlePack<32
  then begin
      Screen.Cursor := crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathUO+aParam['Name_Bpl'].AsString);
      Screen.Cursor := crDefault;
  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowAllUoBpl'));
            if @MDIFUNC<>nil
            then begin
                MDIFUNC(aOwner,aParam);
            end;
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorUO+aParam['Name_Bpl'].AsString),
                       PChar(LoadErrorCaptionUO),MB_OK and MB_ICONWARNING);
  end;
end;

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


function LoadSimplePackage(AOwner:TComponent;AParam:TISC_DB_HANDLE;
    BplName:String;FunctionName:String):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;AParam:TISC_DB_HANDLE):Variant;stdcall;
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

end.
