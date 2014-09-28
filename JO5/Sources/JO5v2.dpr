program JO5v2;

uses
  Forms,
  IBase,
  Windows,
  Dialogs,
  SysUtils,
  JO5_Types,
  JO5_PackageLoad,
  JO5_MainMenu in 'JO5_Exe\JO5_MainMenu.pas' {fMainMenu},
  JO5_DataModule in 'JO5_Exe\JO5_DataModule.pas' {JO5_DM: TDataModule},
  JO5SetFormUch in 'JO5_Exe\JO5SetFormUch.pas' {frmSetFormUch},
  PrintMOParams in 'JO5_Exe\PrintMOParams.pas' {frmGetMOParams};

{$R *.res}

function SetConnection(DB_Handle:TISC_DB_HANDLE):boolean;
begin
  Result:=not(DB_Handle=nil);
  if not Result then Application.Terminate;
  JO5_DM.JO5_DB.Handle:=DB_Handle;
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

var User:TJo5AccessResult;
begin
 LoadKeyboardLayout('00000422',KLF_ACTIVATE or KLF_SUBSTITUTE_OK);
 User:=LoadAccess(Application);
 if User.ID_User<>0 then
  begin
   Application.Initialize;
   Application.CreateForm(TJO5_DM, JO5_DM);
  if SetConnection(User.DB_Handle) then
    begin
     Application.CreateForm(TFMainMenu, FMainMenu);
     Application.Title := 'Æ/Î-5';
     FMainMenu.User := User;
     Application.Run;
    end;
  end
 else
  Application.Terminate;
end.
