unit TuCommonProc;

interface

uses Forms, Windows, Registry, IBase, pFibStoredProc,
     TuStProcDM, Variants, SysUtils, TuMessages,
     Dialogs, IniFiles,TuCommonConsts,Winsock ;

function TuNameFirm(DB_Handle:TISC_DB_HANDLE;FieldName:string='NAME_FULL'):variant;
function GetConst(ConstName:string;ConstType:string):string;
function TuDesignReport:boolean;
function CurrentKodSetup(DB_Handle:TISC_DB_HANDLE):integer;
function TuGetCompName: string;
function TuGetIPAddress: string;
implementation

function GetConst(ConstName:string;ConstType:string):string;
var IniFile:TIniFile;
    IniFilePath:string;
begin
    IniFilePath:='TimeKeeping\Ukrainian.lng';

    if FileExists(ExtractFilePath(Application.ExeName)+IniFilePath) then
    begin
       IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+IniFilePath);
       Result := IniFile.ReadString(ConstType,ConstName,ConstName);
       IniFile.Destroy;
    end
    else Result := ConstName;
end;

function TuNameFirm(DB_Handle:TISC_DB_HANDLE;FieldName:string='NAME_FULL'):variant;
var DM:TStProcDM;
begin
 Result:=NULL;
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_GET_SYSDATA_NAMEFIRM';
   Prepare;
   ExecProc;
   Result := ParamByName(FieldName).AsVariant;
   Transaction.Commit;
  except
   on E:exception do
    begin
     TuShowMessage(GetConst('Caption','Error'),e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
end;

function TuDesignReport:boolean;
var Registry:TRegistry;
begin
 Result:=False;
 Registry:=TRegistry.Create;
 try
  Registry.RootKey:=HKEY_CURRENT_USER;
  Result:=Registry.OpenKey('\Software\Grant\DesignReport\',False);
 finally
  Registry.Free;
 end;
end;

function CurrentKodSetup(DB_Handle:TISC_DB_HANDLE):integer;
var DM:TStProcDM;
    res:integer;
begin
 Res:=0;
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_KOD_SETUP_RETURN';
   Prepare;
   ExecProc;
   Res := ParamByName('KOD_SETUP').AsInteger;
   Transaction.Commit;
  except
   on E:exception do
    begin
     TuShowMessage(GetConst('Caption','Error'),e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
 Result:=res;
end;
function TuGetCompName: string;
var
    s: string;
    sLen: Longword;
begin
    SetLength(s, 255);
    sLen := 255;
    GetHostName(@s[1], sLen);
    Result := Trim(StrPas(PAnsiChar(s)));
end;

function TuGetIPAddress: string;
var
    wVerReq: WORD;
    wsaData: TWSAData;
    i: pchar;
    h: PHostEnt;
    c: array[0..128] of char;
begin
    wVerReq := MAKEWORD(1, 1);
    WSAStartup(wVerReq, wsaData);
    GetHostName(@c, 128);
    h := GetHostByName(@c);
    i := iNet_ntoa(PInAddr(h^.h_addr_list^)^);
    Result := i; //O
    WSACleanup;
end;




end.
