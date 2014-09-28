{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Главный модуль                                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit fmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, Registry,
  cxControls, cxContainer, cxEdit, cxTextEdit, uResources, AccMgmt, uMatasUtils,
  uMatasVars;

type
  TLoginForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    cxUserPwd: TcxTextEdit;
    cxUserName: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxUserNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxUserPwdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
 	 Count: Integer;		// количество попыток входа
   USER_NAME: string;
   USER_ID: int64;
   USER_ID_PCARD: int64;
   USER_FIO: string;
   LResult: TResultInfo;
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

procedure TLoginForm.FormCreate(Sender: TObject);
var
 reg: TRegistry;
begin
 Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_LOGIN;
 Label1.Caption:=MAT_LOGIN_STR_NAME;
 Label2.Caption:=MAT_LOGIN_STR_PWD;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 Count := 0;
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\MATAS\Login\',False) then
  begin
   cxUserName.Text:=reg.ReadString('Login');
  end
 finally
  reg.Free;
 end;
end;

procedure TLoginForm.OkButtonClick(Sender: TObject);
var
// InitResult:	Integer;
 reg: TRegistry;
 CurrentLogin, CurrentPassword, CurrentFIO: string;
 CurrentID_USER, CurrentID_PCARD: int64;
begin
	// увеличить число попыток входа
	inc(Count);
  // считать текущие логин и пароль
	CurrentLogin := cxUserName.Text;
	CurrentPassword := cxUserPwd.Text;
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\MATAS\Login\',True) then
   begin
    reg.WriteString('Login',CurrentLogin);
   end
  finally
   reg.Free;
 end;
 // соединиться с системой безопасности
 try
	LResult := fibInitConnection(CurrentLogin, CurrentPassword);
//	InitResult := InitConnection(CurrentLogin, CurrentPassword);
 except on e: Exception do
  begin
 	 agMessageDlg(MAT_STR_WARNING, MAT_STR_ERR_ACC_MANAGER +' : ' + e.Message, mtError,[mbOk]);
	 ModalResult := mrCancel;
   Exit;
  end;
 end;
 if LResult.ErrorCode <> ACCMGMT_OK then		// ошибка
// if InitResult <> ACCMGMT_OK then		// ошибка
 begin
 	// отобразить сообщение об ошибке
	agMessageDlg(MAT_STR_WARNING, MAT_STR_ERR_ACC_MANAGER +' : ' +AcMgmtErrMsg(LResult.ErrorCode),mtError,[mbOk]);
  // если 3 раза неправильно, выйти
	if Count >= 3 then Application.Terminate
	 else	ModalResult := mrNone;	// иначе дать попробовать еще
  cxUserName.SetFocus;
 end
 else		// все пучком
 begin
  CurrentID_PCARD := GetCurrentUserIDExt;
  CurrentID_USER:=GetUserId;
  CurrentFIO:=GetUserFIO;
	// на случай совсем злых багов
	if (CurrentID_USER = 0) or (CurrentID_PCARD=0) then
	begin
 	 agMessageDlg(MAT_STR_WARNING, MAT_STR_ERR_ACC_MANAGER+'!',mtError,[mbOk]);
	 ModalResult := mrCancel;
   Exit;
	end
  else
  begin
   if MatasCheckAccess('/ROOT/MATAS','Belong', false)=0 then
   begin
    USER_NAME:=CurrentLogin;
    USER_ID:=CurrentID_USER;
    USER_ID_PCARD:=CurrentID_PCARD;
    USER_FIO:=CurrentFIO;
    ModalResult:=mrOk;
   end;
  end;
 end;
end;

procedure TLoginForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
end;

procedure TLoginForm.cxUserNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxUserPwd.SetFocus;
end;

procedure TLoginForm.cxUserPwdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  OkButtonClick(self);
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
 if cxUserName.Text<>'' then cxUserPwd.SetFocus;
end;

end.
