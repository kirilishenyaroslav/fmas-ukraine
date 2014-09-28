program TimeKeeping;

uses
  Forms,
  IniFiles,
  SysUtils,
  WinSock,
  Dialogs,
  Windows,
  Variants,
  iBase,
  TuCommonTypes,
  TuCommonLoader,
  TimeKeepingMainForm in 'TimeKeepingExe\TimeKeepingMainForm.pas' {FTimeKeepingMainMenu},
  TimeKeepingDM in 'TimeKeepingExe\TimeKeepingDM.pas' {TimeKeepingDataModule: TDataModule};

{$R *.res}



function SetConnection(DB_Handle:TISC_DB_HANDLE):boolean;
begin
  Result:=not(DB_Handle=nil);
  if not Result then Application.Terminate;
  ExeDM.DBTimeKeeping.Handle := DB_Handle;
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

var User:TUser;
begin
 LoadKeyboardLayout('00000422',KLF_ACTIVATE or KLF_SUBSTITUTE_OK);
 User:=LoadTuAccess(Application);
 if User.ID<>0 then
  begin
   Application.Initialize;
   Application.CreateForm(TTimeKeepingDataModule, ExeDM);
  if SetConnection(User.DB_Handle) then
    begin
     Application.CreateForm(TFTimeKeepingMainMenu, FTimeKeepingMainMenu);
     Application.Title := 'Табельный учет';
//     FTimeKeepingMainMenu.User := User;
     Application.Run;
    end;
  end
 else
  Application.Terminate;

end.
