program BdgtMgmnt;

uses
  Forms, accmgmt,
  Ibase,
  SysUtils,
  uPwdDecrypt,
  IniFiles,
  Dialogs,
  Windows,
  GlobalSpr,
  Check_User,
  Resources_unitb,
  splash_formbu in 'splash_formbu.pas' {splashBU},
  dmMain_BookBU in 'dmMain_BookBU.pas' {dmMainBU: TDataModule},
  MainFormBU in 'MainFormBU.pas' {frmMainFormBU},
  About in 'About.pas' {AboutBox};

{$R *.res}

var ConnectionInfo:TAccessResult;

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

function CheckRunPerrmesion:Boolean;
begin
    ConnectionInfo:=Check_LUser(nil, '/ROOT/Kernell/Budgeting');

    if (ConnectionInfo.ID_User>0)
    then result:=true
    else result:=false;
end;

var   Splash:TSplashBU;
begin

ThousandSeparator:=#0;

if CheckRunPerrmesion
then begin
        Splash                  :=TsplashBU.Create(Application);
        Splash.Label2.Caption   :=Splash.Label2.Caption+GetVersionStrInfo;
        Splash.lbProcess.Caption:='Конфігурація запуска системи';
        Splash.Show;
        Splash.Update;

        Application.Initialize;

        Application.Title := 'Управління бюджетами';
        Application.CreateForm(TdmMainBU, dmMainBU);
        dmMainBU.id_user_dm         :=ConnectionInfo.ID_User;
        dmMainBU.MainDatabase.Handle:=ConnectionInfo.Connection;
        dmMainBU.ReadTransaction.StartTransaction;

        if (ConnectionInfo.Connection<>nil)
        then begin
                                     Application.CreateForm(TfrmMainFormBU,frmMainFormBU);
                                     frmMainFormBU.dxStatusBar1.Panels[0].Text:='Користувач:'+ConnectionInfo.User_Fio+' ('+ConnectionInfo.Name_user+')';
                                     frmMainFormBU.dxStatusBar1.Panels[1].Text:=fibGetCurrentDBPath;
                                     frmMainFormBU.id_user :=ConnectionInfo.ID_User;
                                     frmMainFormBU.id_pcard:=ConnectionInfo.User_Id_Card;
                                     //ShowMessage(IntToStr(GetCurrentUserIDExt));
                                     Splash.Free;
                                     Application.Run;
        end
        else Splash.Free;
end;

end.
