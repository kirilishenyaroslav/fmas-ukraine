unit JO5_PackageLoad;

interface

uses Classes,IBase,Windows,Forms,Controls,SysUtils,Variants,Dialogs,DB,
     JO5_Types, JO5_PackageConst, uneTypes;


function LoadAccess(AOwner: TComponent):TJo5AccessResult;
function LoadRegSch(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;SysInfo:TJo5SysInfo):variant;
function LoadKorToSch(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParam:TJo5SchKor; SysInfo:TJo5SysInfo):Variant;
function LoadDopKorToSch(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParam:TJo5SchKor):Variant;
function LoadPrint(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;SysInfo:TJo5SysInfo):variant;
function LoadSimplePackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string):Variant;

procedure LoadSaldoBySmRzSt(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id_User:Int64;ActualDate:TDateTime);
procedure LoadPrintJournal(AOwner:TComponent;AStyle:TEnm_FormStyle;DB_HANDLE:TISC_DB_HANDLE;
          TRR_HANDLE:TISC_TR_HANDLE;ADateFirstImport,ADateCurrPeriod:TDate;ADefCaseKey:integer);
function DoFunctionFromPackage(AParameter:TObject;const Bpl:array of string):variant;
implementation

function DoFunctionFromPackage(AParameter:TObject;const Bpl:array of string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TObject):Variant;stdcall;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Bpl[0]));
  if HandlePack<32
  then
   try

      //wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);

      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl[0]);

   finally
      Screen.Cursor:=crDefault;
      //CloseWaitForm(wf);
   end;

  if HandlePack > 0 then
  begin  
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Bpl[1]));
            if @MDIFUNC<>nil then
             Result:=MDIFUNC(AParameter);

  end
end;


function LoadAccess(AOwner: TComponent):TJo5AccessResult;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent):TJo5AccessResult;stdcall;
  Res:TJo5AccessResult;
begin
  HandlePack:=GetModuleHandle(Bpl_ZAccess_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ZAccess_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_ZAccess_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_ZAccess_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res.ID_User:=0;
   end;
  Result:=Res;
end;

function LoadRegSch(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;SysInfo:TJo5SysInfo):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;SysInfo:TJo5SysInfo):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_Jo5_RegSch_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Jo5_RegSch_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Jo5_RegSch_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,SysInfo);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Jo5_RegSch_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadRegSch:=Res;
end;

function LoadKorToSch(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParam:TJo5SchKor; SysInfo:TJo5SysInfo):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParam:TJo5SchKor; SysInfo:TJo5SysInfo):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_Jo5_KorToSch_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Jo5_KorToSch_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_jo5_KorToSch_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,AParam, SysInfo);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Jo5_KorToSch_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadKorToSch:=Res;
end;

function LoadDopKorToSch(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParam:TJo5SchKor):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParam:TJo5SchKor):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_Jo5_DopKorToSch_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Jo5_DopKorToSch_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Jo5_DopKorToSch_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,AParam);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Jo5_DopKorToSch_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadDopKorToSch:=Res;
end;

function LoadPrint(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;SysInfo:TJo5SysInfo):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;SysInfo:TJo5SysInfo):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_Jo5_Print_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Jo5_Print_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Jo5_Print_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,SysInfo);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Jo5_Print_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadPrint:=Res;
end;

function LoadSimplePackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;stdcall;
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
            then Res:=MDIFUNC(AOwner,DB_HANDLE);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadSimplePackage:=Res;
end;

procedure LoadSaldoBySmRzSt(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id_User:Int64;ActualDate:TDateTime);
var
  HandlePack: HModule;
  MDIPROC   :procedure (AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id_User:Int64;ActualDate:TDateTime);stdcall;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_GetJo5SchSaldo_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_GetJo5SchSaldo_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIPROC:=GetProcAddress(HandlePack,PChar(Func_GetJo5SchSaldo_Name));
            if @MDIPROC<>nil
            then MDIPROC(AOwner,DB_HANDLE,Id_User,ActualDate);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_GetJo5SchSaldo_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
  end;
end;

procedure LoadPrintJournal(AOwner:TComponent;AStyle:TEnm_FormStyle;DB_HANDLE:TISC_DB_HANDLE;
          TRR_HANDLE:TISC_TR_HANDLE;ADateFirstImport,ADateCurrPeriod:TDate;ADefCaseKey:integer);
var
  HandlePack: HModule;
  MDIPROC   :procedure(const DBFM:TRec_DBFMParams;const SysOptions:TRec_SysOptions);stdcall;
  ADBFM:TRec_DBFMParams;
  ASysOptions:TRec_SysOptions;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_PrintJournal_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintJournal_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIPROC:=GetProcAddress(HandlePack,PChar(Func_PrintJournal_Name));
            if @MDIPROC<>nil
            then
              begin
                ADBFM.Owner:=AOwner;
                ADBFM.Style:=AStyle;
                ADBFM.DBHandle:=DB_HANDLE;
                ADBFM.TRRHandle:=TRR_HANDLE;

                ASysOptions.DefCaseKey:=ADefCaseKey;
                ASysOptions.DateFirstImport:=ADateFirstImport;
                ASysOptions.DateCurrPeriod:=ADateCurrPeriod;

                MDIPROC(ADBFM,ASysOptions);
              end;
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_PrintJournal_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
  end;
end;

end.
