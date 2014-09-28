unit UnitZAccessForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, ExtCtrls, {UnitZarplataConsts,}
  AccMGMT, Registry, {ZMessages, ZTypes,} ActnList;

type
  TZAccessResult=record
  login : string;
  pswrd : string;
  Name_user:String;
  ID_User:Integer;
  User_Id_Card:Integer;
  User_Fio :String;
  end;

  TFZAccess = class(TForm)
	Panel1: TPanel;
	Image1: TImage;
	UserLabel: TcxLabel;
	LoginLabel: TcxLabel;
	UserEdit: TcxTextEdit;
	LoginEdit: TcxTextEdit;
	YesBtn: TcxButton;
	CancelBtn: TcxButton;
	ActionList: TActionList;
	ActionYes: TAction;
	procedure CancelBtnClick(Sender: TObject);
	procedure UserEditKeyUp(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure ActionYesExecute(Sender: TObject);
	procedure LoginEditKeyUp(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
  private
	AccessResult:TZAccessResult;
    countoftry:byte;
  public
    constructor Create(AOwner:TComponent);override;
    Property Result:TZAccessResult read AccessResult;
  end;

function AccessZarplata(AOwner:TComponent):TZAccessResult;stdcall;
  exports AccessZarplata;

implementation

{$R *.dfm}

function NotViewFormAccess:boolean;
var reg: TRegistry;
	res:boolean;
begin
res:=False;
 try
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  res := reg.OpenKey('\Software\Zarplata\NotLogin\',False);
 finally
  reg.Free;
 end;
Result:=Res;
end;

function AccessZarplata(AOwner:TComponent):TZAccessResult;stdcall;
var FormAccess:TFZAccess;
    Res:TZAccessResult;
begin
 if NotViewFormAccess then
  begin
   res.ID_User:=-999;
   Res.Name_user:='ZarplataAdmin';
   Res.User_Id_Card:=-999;
   Res.User_Fio:='Zarplata Admin';
   Result:=Res;
   Exit;
  end;
 FormAccess:=TFZAccess.Create(AOwner);
 Res.ID_User:=0;
 if FormAccess.ShowModal=mrYes then
    Res:=FormAccess.Result;
 FormAccess.Free;
 Result:=Res;
end;

constructor TFZAccess.Create(AOwner:TComponent);
var
 reg: TRegistry;
begin
 inherited Create(AOwner);
 countoftry := 0;
 Caption := 'Вход в систему';
 UserLabel.Caption  := 'Пользователь';
 LoginLabel.Caption := 'Пароль';
 YesBtn.Caption     := 'Принять';
 CancelBtn.Caption  := 'Отмена';
 {YesBtn.Hint        := YesBtn.Caption;
 CancelBtn.Hint     := CancelBtn.Caption+' (Esc)';}
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\Zarplata\Login\',False) then
  begin
   UserEdit.Text:=reg.ReadString('Login');
  end
 finally
  reg.Free;
 end;
end;

procedure TFZAccess.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrNo;
end;

procedure TFZAccess.UserEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then LoginEdit.SetFocus;
end;

procedure TFZAccess.ActionYesExecute(Sender: TObject);
var
 InitResult:	Integer;
 reg: TRegistry;
// CurrentAccessResult:TZAccessResult;
 CurrentLogin, CurrentPassword:string;
Label GameOver;
begin
	inc(countoftry);
//******************************************************************************
	CurrentLogin := UserEdit.Text;
	CurrentPassword := LoginEdit.Text;
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\Zarplata\Login\',True) then
   begin
    reg.WriteString('Login',CurrentLogin);
   end
  finally
   reg.Free;
 end;
//******************************************************************************
// соединиться с системой безопасности
 InitResult := -1;
 try
	 InitResult := InitConnection(CurrentLogin,CurrentPassword);
 except
 on e: Exception do
  begin
 	 MessageDlg('Фатальна помилка у системі безпеки : ' + e.Message, mtError,[mbOk],0);
   if CountOfTry>=3 then Application.Terminate
   else Exit;
  end;
 end;
//******************************************************************************
 if InitResult <> ACCMGMT_OK then		// ошибка
 begin
	ShowMessage(AcMgmtErrMsg(InitResult));
	begin
   UserEdit.SetFocus;
   try
    CloseConnection;
   except
	on e: Exception do
	 MessageDlg('Фатальна помилка у системі безпеки : ' + e.Message, mtError,[mbOk],0);
   end;
  end;
  UserEdit.SetFocus;
  goto GameOver;
 end
//******************************************************************************
 else		// все пучком
 begin
  AccessResult.ID_User:=GetUserId;
  AccessResult.User_Id_Card:=GetCurrentUserIDExt;
  AccessResult.User_Fio := GetUserFIO;
  AccessResult.Name_user:=CurrentLogin;
  if CheckPermission('/ROOT/USERS_JO5_TMP','Belong')=0 then
   begin
	ModalResult:=mrYes;
	try
	 CloseConnection;
	except
	 on e: Exception do
	  MessageDlg('Фатальна помилка у системі безпеки : ' + e.Message, mtError,[mbOk],0);
	end;
	GoTo GameOver;
   end
  else
   begin
	ShowMessage('Ви не маєте прав для входу до ціеї системи');
	try
	 CloseConnection;
	except
	 on e: Exception do
	  MessageDlg('Фатальна помилка у системі безпеки : ' + e.Message, mtError,[mbOk],0);
	end;
	GoTo GameOver;
   end;
  end;
//******************************************************************************
GameOver:
 if countoftry>=3 then Application.Terminate;
end;

procedure TFZAccess.LoginEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then ActionYesExecute(Sender);
end;

end.
