program Zarplata;





uses
  Forms,
  IniFiles,
  SysUtils,
  WinSock,
  Dialogs,
  Windows,
  PackageLoad,
  Variants,
  ZTypes,
  iBase,
  MainZarplataDataModul in 'MainZarplataDataModul.pas' {ZDataModule: TDataModule},
  MainZarplataMenu in 'MainZarplataMenu.pas' {FZMainMenu};

{$R *.res}



function SetConnection(DB_Handle:TISC_DB_HANDLE):boolean;
begin
  Result:=not(DB_Handle=nil);
  if not Result then Application.Terminate;
  ZDataModule.DBZarplata.Handle := DB_Handle;
end;

function GetVersionStrInfo:string;
var
    VerInfoSize: DWORD;
    VerInfo: Pointer;
    VerValueSize: DWORD;
    VerValue: PVSFixedFileInfo;
    Dummy: DWORD;
    V1,V2,V3,V4:DWORD;
begin
    VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
    if VerInfoSize = 0 then begin
            Dummy := GetLastError;
            ShowMessage(IntToStr(Dummy));
    end; {if}
    GetMem(VerInfo, VerInfoSize);
    GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
    with VerValue^ do begin
             V1 := dwFileVersionMS shr 16;
             V2 := dwFileVersionMS and $FFFF;
             V3 := dwFileVersionLS shr 16;
             V4 := dwFileVersionLS and $FFFF;
   end;
   FreeMem(VerInfo, VerInfoSize);
   GetVersionStrInfo:=' '+IntToStr(V1)+'.'+IntToStr(V2)+'.'+IntToStr(V3)+'.'+IntToStr(V4)+' ';
end;

var DB_Handle : TISC_DB_HANDLE;
    Aparam  : TZAccessResult;
begin
 LoadKeyboardLayout('00000422',KLF_ACTIVATE or KLF_SUBSTITUTE_OK);

 Aparam :=LoadZAccessFull(Application);
 DB_Handle           := Aparam.DB_Handle;

 if DB_Handle<>nil then
  begin
   Application.Initialize;
   Application.CreateForm(TZDataModule, ZDataModule);
  if SetConnection(DB_Handle) then
    begin
     Application.CreateForm(TFZMainMenu, FZMainMenu);
     FZMainMenu.password := Aparam.User_Fio;
     FZMainMenu.login    := Aparam.Name_user;
     Application.Title := 'Зарплата';
     Application.Run;
    end;
  end
 else
  Application.Terminate;
end.
