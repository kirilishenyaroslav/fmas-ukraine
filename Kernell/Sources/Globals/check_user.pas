unit check_user;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, ExtCtrls,Registry,
  Ibase;

type
  TAccessResult=record
  login : string;
  pswrd : string;
  Name_user:String;
  ID_User:Integer;
  User_Id_Card:Integer;
  User_Fio :String;
  Connection:TISC_DB_HANDLE;
  end;

  TCkeckAccessFrm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    UserLabel: TcxLabel;
    LoginLabel: TcxLabel;
    UserEdit: TcxTextEdit;
    LoginEdit: TcxTextEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    procedure YesBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure UserEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LoginEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    login:string;
    user:string;
    AccessResult:TAccessResult;
    countoftry:byte;
    CheckPath:String;
  public
    constructor Create(AOwner:TComponent;CheckPath:String);overload;
    Property Result:TAccessResult read AccessResult;
  end;

function Check_LUser(AOwner:TComponent;CheckPath:String):TAccessResult;stdcall;
  exports Check_LUser;

implementation

uses AccMGMT,BaseTypes;
{$R *.dfm}

function Check_LUser(AOwner:TComponent;CheckPath:String):TAccessResult;stdcall;
var FormAccess:TCkeckAccessFrm;
    Res:TAccessResult;
begin
 FormAccess:=TCkeckAccessFrm.Create(AOwner,CheckPath);
 Res.ID_User:=0;
 if (FormAccess.ShowModal=mrYes)
 then begin
           Res:=FormAccess.Result;
 end;
 FormAccess.Free;
 Result:=Res;
end;

constructor TCkeckAccessFrm.Create(AOwner:TComponent;CheckPath:String);
var
 reg: TRegistry;
begin
 inherited Create(AOwner);
 self.CheckPath:=CheckPath;
 countoftry := 0;
 Caption := 'Ідентифікація';
 UserLabel.Caption  := 'Логін';
 LoginLabel.Caption := 'Пароль';
 YesBtn.Caption     := 'Так';
 CancelBtn.Caption  := 'Ні';
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\Budgeting\Login\',False) then
  begin
        UserEdit.Text:=reg.ReadString('Login');
  end
 finally
  reg.Free;
 end;
end;

procedure TCkeckAccessFrm.YesBtnClick(Sender: TObject);
var
   InitResult:	TResultInfo;
   reg: TRegistry;
   CurrentLogin, CurrentPassword:String;
begin
	inc(countoftry);
	CurrentLogin    := UserEdit.Text;
	CurrentPassword := LoginEdit.Text;
  reg := TRegistry.Create;
  try
         reg.RootKey:=HKEY_CURRENT_USER;
         if  reg.OpenKey('\Software\Budgeting\Login\',True)
         then begin
                   reg.WriteString('Login',CurrentLogin);
         end
         finally
         reg.Free;
  end;

  // соединиться с системой безопасности

////////////////////////////////
 InitResult.DBHandle := nil;
 InitResult.ErrorCode:=-1;
 try
   		InitResult := fibInitConnection(CurrentLogin,CurrentPassword);
 except on e: Exception do
                           begin
                             	 MessageDlg('Фатальна помилка у системі безпеки : ' + e.Message, mtError,[mbOk],0);
                             	 ModalResult := mrCancel;
                               Exit;
                           end;
 end;

 if InitResult.ErrorCode <> ACCMGMT_OK
 then begin
           	agMessageDlg('Увага!','Невірний логін або пароль!',mtError,[mbOk]);
          	if (CountOfTry >= 3)then Application.Terminate
                              	else begin
                                          UserEdit.SetFocus;
                                          Exit;
                                end;
            UserEdit.SetFocus;
 end
 else	begin
                      if fibCheckPermission(CheckPath,'Belong')=0
                      then begin
                                AccessResult.ID_User:=GetUserId;
                                AccessResult.User_Id_Card:=GetCurrentUserIDExt;
                                AccessResult.User_Fio := GetUserFIO;
                                AccessResult.Name_user:=CurrentLogin;
                                AccessResult.login:=CurrentLogin;
                                AccessResult.pswrd:=CurrentPassword;
                                AccessResult.Connection:=InitResult.DBHandle;
                                ModalResult:=mrYes;
                      end;
  end;
end;

procedure TCkeckAccessFrm.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrNo;
end;

procedure TCkeckAccessFrm.UserEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then LoginEdit.SetFocus;
end;

procedure TCkeckAccessFrm.LoginEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then YesBtnClick(Sender);
end;

end.

{
type

   ip_option_information = packed record  // Информация заголовка IP (Наполнение
				                                  // этой структуры и формат полей описан в RFC791.
        Ttl : byte;			                  // Время жизни (используется traceroute-ом)
        Tos : byte;			                  // Тип обслуживания, обычно 0
        Flags : byte;		                  // Флаги заголовка IP, обычно 0
        OptionsSize : byte;		            // Размер данных в заголовке, обычно 0, максимум 40
        OptionsData : Pointer;	          // Указатель на данные
    end;

   icmp_echo_reply = packed record
        Address : u_long; 	    	        // Адрес отвечающего
        Status : u_long;	    	          // IP_STATUS (см. ниже)
        RTTime : u_long;	    	          // Время между эхо-запросом и эхо-ответом
                                	         // в миллисекундах
        DataSize : u_short; 	          	 // Размер возвращенных данных
        Reserved : u_short; 	    	      // Зарезервировано
        Data : Pointer; 		              // Указатель на возвращенные данные
        Options : ip_option_information;  // Информация из заголовка IP
    end;

    PIPINFO = ^ip_option_information;
    PVOID = Pointer;

    function IcmpCreateFile() : THandle; stdcall; external 'ICMP.DLL' name 'IcmpCreateFile';
    function IcmpCloseHandle(IcmpHandle : THandle) : BOOL; stdcall; external 'ICMP.DLL'  name 'IcmpCloseHandle';
    function IcmpSendEcho(
                      IcmpHandle : THandle;    // handle, возвращенный IcmpCreateFile()
                      DestAddress : u_long;    // Адрес получателя (в сетевом порядке)
                      RequestData : PVOID;     // Указатель на посылаемые данные
                      RequestSize : Word;      // Размер посылаемых данных
                      RequestOptns : PIPINFO;  // Указатель на посылаемую структуру
                                               // ip_option_information (может быть nil)
                      ReplyBuffer : PVOID;     // Указатель на буфер, содержащий ответы.
                      ReplySize : DWORD;       // Размер буфера ответов
                      Timeout : DWORD          // Время ожидания ответа в миллисекундах
                     ) : DWORD; stdcall; external 'ICMP.DLL' name 'IcmpSendEcho';


function IsServerValid(Addr: PChar): Boolean;
var
    hIP : THandle;
    pingBuffer : array [0..31] of Char;
    pIpe : ^icmp_echo_reply;
    pHostEn : PHostEnt;
    wVersionRequested : WORD;
    lwsaData : WSAData;
    error : DWORD;
    destAddress : In_Addr;
    Res_func:Boolean;
begin
    Res_func:=true;
    hIP := IcmpCreateFile();
    GetMem( pIpe,
                sizeof(icmp_echo_reply) + sizeof(pingBuffer));
    pIpe.Data := @pingBuffer;
    pIpe.DataSize := sizeof(pingBuffer);
    wVersionRequested := MakeWord(1,1);
    error := WSAStartup(wVersionRequested,lwsaData);
    if (error <> 0) then
    begin
                 Res_func:=false;
    end;
    pHostEn := gethostbyname(Addr);
    error := GetLastError();
    if (error <> 0) then
    begin
                 Res_func:=false;
    end;
    destAddress := PInAddr(pHostEn^.h_addr_list^)^;
    IcmpSendEcho(hIP,
                 destAddress.S_addr,
                 @pingBuffer,
                 sizeof(pingBuffer),
                 nil,
                 pIpe,
                 sizeof(icmp_echo_reply) + sizeof(pingBuffer),
                 5000);
    if u_int(pIpe^.Status)<>u_int(0)
    then begin
                 Res_func:=false;
                 MessageBox(Application.Handle,PChar(BU_PingError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
    end;
    IcmpCloseHandle(hIP);
    WSACleanup();
    FreeMem(pIpe);
    IsServerValid:=Res_func;
end;
}

