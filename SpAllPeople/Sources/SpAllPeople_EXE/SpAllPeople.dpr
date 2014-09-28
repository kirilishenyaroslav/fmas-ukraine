program SpAllPeople;

uses
  Forms,
  IBase,
  Windows,
  Dialogs,
  SysUtils,
  SpAllPeople_MainMenu in 'SpAllPeople_MainMenu.pas' {fMainMenu},
  SpAllPeople_DataModule in 'SpAllPeople_DataModule.pas' {DM: TDataModule},
  SpAllPeople_AccessForm in 'SpAllPeople_AccessForm.pas' {FAccess};

{$R *.res}

function SetConnection(DB_Handle:TISC_DB_HANDLE):boolean;
begin
  Result:=not(DB_Handle=nil);
  if not Result then Application.Terminate;
  DM.DB.Handle:=DB_Handle;
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

var User:TAccessResult;
begin
 LoadKeyboardLayout('00000422',KLF_ACTIVATE or KLF_SUBSTITUTE_OK);
 User:=LoadAccess(Application);
 if User.ID_User<>0 then
  begin
   Application.Initialize;
   Application.CreateForm(TDM, DM);
  if SetConnection(User.DB_Handle) then
    begin
     Application.CreateForm(TFMainMenu, FMainMenu);
     Application.Title := 'Довідник фізичних осіб';
     FMainMenu.User := User;
     Application.Run;
    end;
  end
 else
  Application.Terminate;
end.
