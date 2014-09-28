unit uPrK_Loader;

interface
uses
    Forms, Windows, SysUtils,  Variants, Classes, Controls, Ibase,uPrK_Resources,
    Dialogs,AArray;

resourcestring
     LoadErrorPrK        ='Помилка при роботі з бібліотекою ';
     LoadErrorCaptionPrK ='Увага помилка!';


const PathPrK ='PrK\';

{name bpl}
const PrK_Spravochnikibpl    ='PrK_Spravochniki.bpl';
const PrK_Vuz_Licensebpl     ='PrK_Vuz_License.bpl';
const PrK_Abitbpl            ='PrK_Abit.bpl';

const Error_Caption             = 'Помилка';
const Load_Error                = 'Файл пакета не знайдено!!!';

// загрузчик справочников
function ShowPrkSprav (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aNamePrKSprav: TNamePrKSprav; aFrmStyle:TFormStyle; aParam: TAArray=nil):Variant;
procedure ShowVuzLicense (aOwner: TComponent;aParam :TAArray);
// загрузчик карточки абитуриента
procedure ShowAbit (aOwner: TComponent;aParam :TAArray);
// загрузчик остальных bpl
procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
// загрузчик всех прочих bpl )
function LoadSimplePackage(AOwner:TComponent;AParam:TAArray;
    BplName:String;FunctionName:String):Variant; overload;

function LoadSimplePackage(AOwner:TComponent;AParam:TISC_DB_HANDLE;
    BplName:String;FunctionName:String):Variant; overload;

implementation

function ShowPrkSprav (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE;
                       aNamePrKSprav: TNamePrKSprav; aFrmStyle:TFormStyle; aParam: TAArray=nil):Variant;
var
  HandlePack: HModule;
  MDIFUNC   : function(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE;
                       aNamePrKSprav: TNamePrKSprav; aFrmStyle:TFormStyle; aParam: TAArray=nil):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PrK_Spravochnikibpl);
  if HandlePack<32
  then begin
      Screen.Cursor := crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathPrK+PrK_Spravochnikibpl);
      Screen.Cursor := crDefault;
  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowPrkSprav'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,aDBHANDLE,aNamePrKSprav,aFrmStyle,aParam);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorPrK+PrK_Spravochnikibpl),
                       PChar(LoadErrorCaptionPrK),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  ShowPrkSprav:=Res;
end;          

procedure ShowVuzLicense (aOwner: TComponent;aParam :TAArray);
var
  HandlePack: HModule;
  MDIFUNC   : procedure(aOwner: TComponent;aParam :TAArray);stdcall;
begin
  HandlePack:=GetModuleHandle(PrK_Vuz_Licensebpl);
  if HandlePack<32
  then begin
      Screen.Cursor := crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathPrK+PrK_Vuz_Licensebpl);
      Screen.Cursor := crDefault;
  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowVuzLicense'));
            if @MDIFUNC<>nil
            then MDIFUNC(aOwner,aParam);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorPrK+PrK_Vuz_Licensebpl),
                       PChar(LoadErrorCaptionPrK),MB_OK and MB_ICONWARNING);
  end;
end;

procedure ShowAbit (aOwner: TComponent;aParam :TAArray);
var
  HandlePack: HModule;
  MDIFUNC   : procedure(aOwner: TComponent;aParam :TAArray);stdcall;
begin
  HandlePack:=GetModuleHandle(PrK_Abitbpl);
  if HandlePack<32
  then begin
      Screen.Cursor := crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathPrK+PrK_Abitbpl);
      Screen.Cursor := crDefault;
  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowAbit'));
            if @MDIFUNC<>nil
            then MDIFUNC(aOwner,aParam);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorPrK+PrK_Abitbpl),
                       PChar(LoadErrorCaptionPrK),MB_OK and MB_ICONWARNING);
  end;
end;


procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
  HandlePack: HModule;
  MDIFUNC   : procedure(aOwner: TComponent;aParam :TAArray);stdcall;
begin
  HandlePack:=GetModuleHandle(Pchar(aParam['Name_Bpl'].AsString));
  if HandlePack<32
  then begin
      Screen.Cursor := crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathPrK+aParam['Name_Bpl'].AsString);
      Screen.Cursor := crDefault;
  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowAllPrkBpl'));
            if @MDIFUNC<>nil
            then begin
              // ViewArray(nil,aParam);
              MDIFUNC(aOwner,aParam);
            end;
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorPrK+aParam['Name_Bpl'].AsString),
                       PChar(LoadErrorCaptionPrK),MB_OK and MB_ICONWARNING);
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
