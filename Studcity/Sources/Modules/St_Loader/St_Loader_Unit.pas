unit St_Loader_Unit;

interface

uses Classes,IBase,Windows,Forms,Controls,SysUtils,Variants,Dialogs;

type TSt_AccessResult = record
 ID_User:integer;
 Name_user:string;
 User_Id_Card:integer;
 User_Fio:string;
 Password: string;
 DB_Handle : TISC_DB_HANDLE;
end;

type
TBuildsInfo = record
 id_build : Int64;
 N_Room  : string;
end;

function Load_st_BuildLivers(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; BarCode : string; Osnovanie: string = '';  Summa: Currency = 0; IsWithSumma: Boolean = false):variant;
function Load_st_Builds(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; ShowRooms: boolean; BuildsInfo : TBuildsInfo):variant;
function Load_st_Class_Category(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean; ID : int64):variant;
function Load_st_Type_Category(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean; ID : int64):variant;
function Load_St_Access(AOwner:TComponent):TSt_AccessResult;
function Load_Final(AOwner:TComponent) : boolean;
function Load_Reestr(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function Load_List(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function Load_Order(AOwner : TComponent;DB:TISC_DB_HANDLE; id_kod: int64):variant;
function Load_Sp_Category(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean):variant;
function Load_st_WhatsNew(AOwner : TComponent):variant;
function Load_Spisanie(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; id_user_in : int64):variant;

implementation

const Error_Caption             = 'Ошибка';
const Load_Error                = 'Файл пакета не обнаружен !';

const Bpl_st_BuildLivers_Name           = 'Studcity\st_BuildLivers.bpl';
const Bpl_st_Builds_Name                = 'studcity\stBuilds.bpl';
const Bpl_st_Class_Cat_Name             = 'studcity\St_Class_Category.bpl';
const Bpl_st_Type_Cat_Name              = 'studcity\St_Type_Category.bpl';
const Bpl_st_Access_Name                = 'studcity\St_Access.bpl';
const Bpl_st_Final                      = 'studcity\St_Final.bpl';
const Bpl_st_Reestr                     = 'studcity\Reestr.bpl';
const Bpl_st_List                       = 'studcity\List_PropMan.bpl';
const Bpl_st_Order                      = 'studcity\St_Order.bpl';
const Bpl_st_Category                   ='studcity\Sp_Category.bpl';
const Bpl_st_WatsNew_Name               ='studcity\st_WhatsNew.bpl';
const Bpl_Spisanie_Name                 ='studcity\st_Spisanie.bpl';

const Func_st_BuildLivers_Name          = 'View_st_BuildLivers_Sp';
const Func_st_Builds_Name               = 'View_st_Builds_Sp';
const Func_st_Class_Cat_Name            = 'View_st_Class_Category';
const Func_st_Type_Cat_Name             = 'View_st_Type_Category';
const Func_st_Access_Name               = 'St_Access';
const Func_st_Final                     = 'View_Final';
const Func_st_Reestr                    = 'View_Reestr';
const Func_st_List                      = 'View_List';
const Func_st_Order                     = 'View_Order';
const Func_st_Category                  = 'View_Category';
const Func_st_WatsNew_Name              = 'View_WhatsNew';
const Func_st_Spisanie                  = 'View_Spisanie';

////////////////////////////////////////////////////////////////////////////////////////////////
function Load_Sp_Category(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_st_Category);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_st_Category);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_st_Category));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB, ShowModal, MultiSelect);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_st_Category),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Load_Sp_Category:=Res;
end;
////////////////////////////////////////////////////////////////////////////////////////////////
function Load_Order(AOwner : TComponent;DB:TISC_DB_HANDLE;id_kod: int64):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;id_kod: int64):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_st_Order);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_st_Order);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_st_Order));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB, id_kod);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_st_Order),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Load_Order:=Res;
end;
////////////////////////////////////////////////////////////////////////////////////////////////
function Load_List(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_st_List);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_st_List);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_st_List));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_st_List),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Load_List:=Res;
end;
////////////////////////////////////////////////////////////////////////////////////////////////
function Load_Reestr(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_st_Reestr);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_st_Reestr);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_st_Reestr));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_st_Reestr),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Load_Reestr:=Res;
end;

////////////////////////////////////////////////////////////////////////////////////////////////

function Load_Final(AOwner : TComponent):boolean;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent):boolean;stdcall;
  Res:boolean;
begin
  HandlePack:=GetModuleHandle(Bpl_st_Final);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_st_Final);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_st_Final));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_st_Final),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Load_Final:=Res;
end;

////////////////////////////////////////////////////////////////////////////////////////////////

function Load_St_Access(AOwner:TComponent):TSt_AccessResult;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent):TSt_AccessResult;stdcall;
  Res:TSt_AccessResult;
begin
  HandlePack:=GetModuleHandle(Bpl_st_Access_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_st_Access_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_st_Access_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_st_Access_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res.ID_User:=-1;
   end;
  Load_St_Access:=Res;
end;
////////////////////////////////////////////////////////////////////////////////////////////////
function Load_st_BuildLivers(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; BarCode : string; Osnovanie: string = ''; Summa: Currency = 0; IsWithSumma: Boolean = false):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; Osnovanie: string; Summa: Currency; IsWithSumma: Boolean; BarCode : string):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_st_BuildLivers_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_st_BuildLivers_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_st_BuildLivers_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB, ShowModal,  Osnovanie, Summa, IsWithSumma, BarCode);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_st_BuildLivers_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Load_st_BuildLivers:=Res;
end;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Load_st_Builds(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; ShowRooms: boolean; BuildsInfo : TBuildsInfo):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; ShowRooms: boolean; BuildsInfo : TBuildsInfo):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_st_Builds_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_st_Builds_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_st_Builds_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB, ShowModal, ShowRooms, BuildsInfo);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_st_Builds_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Load_st_Builds:=Res;
end;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Load_st_Class_Category(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean; ID : int64):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean; ID : int64):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_st_Class_Cat_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_st_Class_Cat_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_st_Class_Cat_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB, ShowModal, MultiSelect, ID);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_st_Class_Cat_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Load_st_Class_Category:=Res;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Load_st_Type_Category(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean; ID : int64):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean; ID : int64):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_st_Type_Cat_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_st_Type_Cat_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_st_Type_Cat_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB, ShowModal, MultiSelect, ID);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_st_Type_Cat_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Load_st_Type_Category:=Res;
end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////
function Load_st_WhatsNew(AOwner : TComponent):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_st_WatsNew_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_st_WatsNew_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_st_WatsNew_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_st_WatsNew_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Load_st_WhatsNew:=Res;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Load_Spisanie(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; id_user_in : int64):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; id_user_in : int64):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Spisanie_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Spisanie_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_st_Spisanie));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB, ShowModal, id_user_in);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Spisanie_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Load_Spisanie:=Res;
end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////


end.
