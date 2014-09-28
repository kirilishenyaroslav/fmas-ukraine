program pubburprt;

uses
  Forms,
  Resources_unitb,
  uPwdDecrypt,
  SysUtils,
  IniFiles,
  Dialogs,
  Windows,
  GlobalSpr,
  Check_User,
  dmMain_BookHtml in 'PublicBuReport\dmMain_BookHtml.pas' {dmMainHtml: TDataModule},
  MainFormHtml in 'PublicBuReport\MainFormHtml.pas' {frmMainFormHtml},
  splash_formhtml in 'PublicBuReport\splash_formhtml.pas' {splashHtml};

{$R *.res}

var AccessStru:TAccessResult;


function SetConnection:boolean;
begin
    dmMainHtml.MainDatabase.DBName :=DB_SERVER+':'+DB_PATH;
    dmMainHtml.MainDatabase.ConnectParams.UserName := DB_USER;
    dmMainHtml.MainDatabase.ConnectParams.Password := DB_PASSWORD;
    try
        dmMainHtml.MainDatabase.Open;
        dmMainHtml.ReadTransaction.StartTransaction;
        CORRECT_CONNECT:=true;
        SetConnection:=true;
    except
        on E:exception do
            begin
                MessageBox(Application.Handle,PChar(BU_OpenDBError+#13+#13+E.message),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
                Application.Terminate;
                SetConnection:=false;
            end;
    end;
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

function CheckRunPerrmesion:boolean;
begin
    AccessStru:=Check_LUser(nil,'/ROOT/Kernell/BuReport');
    if (AccessStru.ID_User>0)
    then result:=true
    else result:=false;
end;

var   Splash:TSplashHtml;
      OpenIniFile:Boolean;
      Layout: array[0.. KL_NAMELENGTH] of char;
begin

ThousandSeparator:=#0;

if CheckRunPerrmesion
then begin
        Splash:=TsplashHtml.Create(nil);
        Splash.Label2.Caption:=Splash.Label2.Caption+GetVersionStrInfo;
        Splash.lbProcess.Caption:='Конфігурація системи';
        Splash.Show;
        Splash.Update;

        Application.Initialize;
        Application.Title := 'Звіти по бюджетам';
        Application.CreateForm(TdmMainHtml, dmMainHtml);
  dmMainHtml.id_user_dm:=AccessStru.ID_User;
        dmMainHtml.MainDatabase.Handle:=AccessStru.Connection;
        dmMainHtml.ReadTransaction.StartTransaction;

        Application.CreateForm(TfrmMainFormHtml, frmMainFormHtml);
        frmMainFormHtml.id_user:=AccessStru.ID_User;
        Splash.Free;
        Application.Run;
end;
end.
