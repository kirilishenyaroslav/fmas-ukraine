unit LoaderClBank;
interface
uses Forms, Windows,Dialogs,SysUtils,Variants,Classes,
     Controls,pFIBDataBase,IBase;
resourcestring
     LoadErrorG=           'Ошибка при работе с библиотекой';
     ErrorCaptionG=        'Внимание ошибка!';
{PATH}
const Path_ClBank ='ClBank\';


{Name_BPL}

const Name_ConfigClBank ='ConfigClBank.bpl';
const Name_RunClBank ='RunClBank.bpl';
const Name_ViewClBank ='ViewClBank.bpl';
const Name_AddDocClBank ='AddDocClBank.bpl';
const Name_PrintDocClBank ='PrintDocClBank.bpl';

function LoadconfigClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

function LoadRunClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

function LoadViewClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

function LoadAddDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_acc_native:int64;DateDoc:TDateTime):Integer;

function LoadEditDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;

function LoadClonDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;

function LoadDelDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;

function LoadViewDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;

function LoadPrintDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Integer):Integer;

function LoadPrintDocChP(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Integer):Integer;

implementation

function LoadconfigClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_ConfigClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_ConfigClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ConfigClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_ConfigClBank),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadconfigClBank:=Res;
end;

function LoadRunClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_RunClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_RunClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('RunClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_RunClBank),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadRunClBank:=Res;
end;

function LoadViewClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_ViewClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_ViewClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ViewClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_ViewClBank),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadViewClBank:=Res;
end;


function LoadAddDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_acc_native:int64;DateDoc:TDateTime):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_acc_native:int64;DateDoc:TDatetime):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_AddDocClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_AddDocClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('AddDocClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,frmSt,id_acc_native,DateDoc);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_ViewClBank),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadAddDocClBank:=Res;
end;

function LoadEditDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_AddDocClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_AddDocClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('EditDocClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,frmSt,id_doc);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_ViewClBank),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadEditDocClBank:=Res;
end;

function LoadClonDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_AddDocClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_AddDocClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ClonDocClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,frmSt,id_doc);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_ViewClBank),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadClonDocClBank:=Res;
end;

function LoadViewDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_ViewClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_ViewClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ViewDocClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,frmSt,id_doc);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_ViewClBank),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadviewDocClBank:=Res;
end;

function LoadDelDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_AddDocClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_AddDocClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('DelDocClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,frmSt,id_doc);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_ViewClBank),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadDelDocClBank:=Res;
end;

function LoadPrintDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Integer):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Integer):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_PrintDocClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_PrintDocClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('PrintDocClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,Type_print);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_PrintDocClBank),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadPrintDocClBank:=Res;
end;

function LoadPrintDocChP(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Integer):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Integer):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_PrintDocClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_PrintDocClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('PrintDocChP'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,Type_print);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_PrintDocClBank),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadPrintDocChP:=Res;
end;


end.
