program Main_book;

uses
  Forms,
  Resources_unitb,
  uPwdDecrypt,
  SysUtils,
  accmgmt,
  IniFiles,
  Dialogs,
  Windows,
  GlobalSpr,
  Check_User,
  splash_form in 'splash_form.pas' {splash},
  dmMain_Book in 'dmMain_Book.pas' {dmMain: TDataModule},
  MainForm in 'MainForm.pas' {frmMainForm},
  Win2DosImprt in 'Win2DosImprt.pas' {frmDosImport},
  UGetFormUch in 'UGetFormUch.pas' {ffmGetSystem},
  About in 'About.pas' {AboutBox};

{$R *.res}

var AccessStru:TAccessResult;


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

function CheckRunPerrmesion:boolean;
begin
    AccessStru:=Check_LUser(nil,'/ROOT/Kernell/MBook');
    if (AccessStru.ID_User>0)
    then result:=true
    else result:=false;
end;



var   Splash:TSplash;

begin
        ThousandSeparator:=#0;
        if CheckRunPerrmesion
        then begin
                    Splash                  :=Tsplash.Create(Application);
                    Splash.Label2.Caption   :=Splash.Label2.Caption+GetVersionStrInfo;
                    Splash.lbProcess.Caption:='Конфігурація системи';
                    Splash.Show;
                    Splash.Update;

                    Application.Initialize;

                    Application.Title := 'Головна книга';
                    Application.CreateForm(TdmMain, dmMain);
                    dmmain.id_user_dm:=AccessStru.ID_User;
                    dmMain.MainDatabase.Handle:=AccessStru.Connection;
                    dmMain.ReadTransaction.StartTransaction;

                    Application.CreateForm(TfrmMainForm, frmMainForm);
                    frmMainForm.dxStatusBar1.Panels[0].Text:='Користувач:'+AccessStru.User_Fio+' ('+AccessStru.Name_user+')';
                    frmMainForm.dxStatusBar1.Panels[1].Text:=accmgmt.fibGetCurrentDBPath;
                    frmMainForm.login:=AccessStru.login;
                    frmMainForm.user :=AccessStru.pswrd;
                    frmMainForm.id_user:=AccessStru.ID_User;
                    Splash.Free;
                    Application.Run;
        end;
end.
