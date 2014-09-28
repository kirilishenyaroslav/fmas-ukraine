unit St_UnitAccessForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, ExtCtrls,
  AccMGMT, Registry, St_Messages, St_Loader_Unit, cxGroupBox, jpeg, cxImage,
  cxRadioGroup, cxCheckBox, st_AccessCrypto_Unit;

type
  TFZAccess = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    Panel1: TPanel;
    Image1: TImage;
    cxLabel1: TcxLabel;
    LoginEdit: TcxTextEdit;
    UserEdit: TcxTextEdit;
    LoginLabel: TcxLabel;
    UserLabel: TcxLabel;
    SafePassword_CheckBox: TcxCheckBox;
    procedure YesBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure UserEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LoginEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  //  procedure FormCreate(Sender: TObject);
    procedure RebuildWindowRgn;
    procedure WMNCHitTest(var M: TWMNCHitTest);
    procedure FormShow(Sender: TObject);
  private
    AccessResult:TSt_AccessResult;
    countoftry:byte;
  public
    constructor Create(AOwner:TComponent);override;
    Property Result:TSt_AccessResult read AccessResult;
  end;

function St_Access(AOwner:TComponent):TSt_AccessResult;stdcall;
  exports St_Access;

implementation

{$R *.dfm}
const Error_Caption = 'Помилка';
const Access_UserLabel_Caption = 'Користувач';
const Access_UserLogin_Caption = 'Пароль';
const Access_YesBtn_Caption = 'Прийняти';
const Access_CancelBtn_Caption = 'Вихід';

function NotViewFormAccess:boolean;
var reg: TRegistry;
    res:boolean;
begin
res:=False;
 try
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  res := reg.OpenKey('\Software\Studcity\NotLogin\',False);
 finally
  reg.Free;
 end;
Result:=Res;
end;

function St_Access(AOwner:TComponent):TSt_AccessResult;stdcall;
var FormAccess:TFZAccess;
    Res:TSt_AccessResult;
    FormResult:TModalResult;
begin
 if NotViewFormAccess then
  begin
   res.ID_User:=-999;
   Res.Name_user:='Режим беспарольного доступа';
   Res.User_Id_Card:=-999;
   Res.User_Fio:='Режим беспарольного доступа';
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
 UserLabel.Caption  := Access_UserLabel_Caption;
 LoginLabel.Caption := Access_UserLogin_Caption;
 YesBtn.Caption     := Access_YesBtn_Caption;
 CancelBtn.Caption  := Access_CancelBtn_Caption;
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\Studcity\Login\',False) then
  begin
   UserEdit.Text:=reg.ReadString('Login');
  end;

  if  reg.OpenKey('\Software\Studcity\Password\',False) then
  begin
//   LoginEdit.Text:=Decrypt(reg.ReadString('Password'),1916);
   LoginEdit.Text:=reg.ReadString('Password');
   if LoginEdit.Text <> '' then
   SafePassword_CheckBox.Checked:=true;
  end

 finally
  reg.Free;
 end;
end;

procedure TFZAccess.YesBtnClick(Sender: TObject);
var
 InitResult:	Integer;
 reg: TRegistry;
// CurrentAccessResult:TZAccessResult;
 CurrentLogin, CurrentPassword:string;
 ResultInfo : TResultInfo;
Label GameOver;
begin
	inc(countoftry);
//******************************************************************************
	CurrentLogin := UserEdit.Text;
	CurrentPassword := LoginEdit.Text;
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\Studcity\Login\',True) then
   begin
    reg.WriteString('Login',CurrentLogin);
   end;
   if SafePassword_CheckBox.Checked then
   if  reg.OpenKey('\Software\Studcity\Password\',True) then
   begin
//    reg.WriteString('Password',Encrypt(CurrentPassword,1916));
    reg.WriteString('Password',CurrentPassword);
   end;
   if not SafePassword_CheckBox.Checked then
   if  reg.OpenKey('\Software\Studcity\Password\',True) then
   begin
    reg.DeleteValue('Password');
   end
  finally
   reg.Free;
 end;
//******************************************************************************
 //InitResult := -1;
 try
	 ResultInfo := fibInitConnection(CurrentLogin,CurrentPassword);
 except
 on e: Exception do
  begin
 	 MessageDlg(e.Message, mtError,[mbOk],0);
   if CountOfTry>=3 then Application.Terminate
   else Exit;
  end;
 end;
//******************************************************************************
 if ResultInfo.ErrorCode <> ACCMGMT_OK then
 begin
	StShowMessage(Error_Caption,AcMgmtErrMsg(ResultInfo.ErrorCode),mtError,[mbOk]);
	begin
   UserEdit.SetFocus;
   try
    CloseConnection;
   except
    on e: Exception do
     MessageDlg(e.Message, mtError,[mbOk],0);
   end;
  end;
  UserEdit.SetFocus;
  goto GameOver;
 end
//******************************************************************************
 else
 begin
  AccessResult.ID_User:=GetUserId;
  AccessResult.User_Id_Card:=GetCurrentUserIDExt;
  AccessResult.User_Fio := GetUserFIO;
  AccessResult.Name_user:=CurrentLogin;
  AccessResult.Password:=CurrentPassword;
  AccessResult.DB_Handle := ResultInfo.DBHandle;
  if fibCheckPermission('/ROOT/Studcity','Belong')=0 then
   begin
    ModalResult:=mrYes;
    try
    // CloseConnection;
    except
     on e: Exception do
      MessageDlg(e.Message, mtError,[mbOk],0);
    end;
    GoTo GameOver;
   end
  else
   begin
    StShowMessage('Помилка','Ви не маєте прав на вход до цієї системи',mtError,[mbOK]);
    try
     CloseConnection;
    except
     on e: Exception do
      MessageDlg('Фатальна помилка в системы безпеки : ' + e.Message, mtError,[mbOk],0);
    end;
    GoTo GameOver;
   end;
  end;
//******************************************************************************
GameOver:
 if (countoftry>=3) and (ModalResult<>mrYes) then Application.Terminate;
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

procedure TFZAccess.LoginEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then YesBtnClick(Sender);
end;

{procedure TFZAccess.FormCreate(Sender: TObject);
begin
inherited;
HorzScrollBar.Visible:= False; // убираем сколлбары, чтобы не мешались
VertScrollBar.Visible:= False; // при изменении размеров формы
RebuildWindowRgn; // строим новый регион
end;}

procedure TFZAccess.RebuildWindowRgn;
var
FullRgn, Rgn: THandle;
ClientX, ClientY, I: Integer;
begin
// определяем относительные координаты клиентской части
ClientX:= (Width - ClientWidth) div 2;
ClientY:= Height - ClientHeight - ClientX;
FullRgn:= CreateRectRgn(0, 0, Width, Height); // создаем регион для всей формы
// создаем регион для клиентской части формы и вычитаем его из FullRgn
Rgn:= CreateRectRgn(ClientX, ClientY, ClientX + ClientWidth, ClientY +ClientHeight);
CombineRgn(FullRgn, FullRgn, Rgn, rgn_Diff);
// теперь добавляем к FullRgn регионы каждого контрольного элемента
for I:= 0 to ControlCount -1 do
with Controls[I] do begin
Rgn:= CreateRectRgn(ClientX + Left, ClientY + Top, ClientX + Left +Width, ClientY + Top + Height);
CombineRgn(FullRgn, FullRgn, Rgn, rgn_Or);
end;
SetWindowRgn(Handle, FullRgn, True); // устанавливаем новый регион окна
end;

procedure TFZAccess.WMNCHitTest(var M: TWMNCHitTest);
begin
inherited; // вызов унаследованного обработчика
if M.Result = htClient then // Мышь сидит на окне? Если да
M.Result := htCaption; // - то пусть Windows думает, что мышь на caption bar
end;

procedure TFZAccess.FormShow(Sender: TObject);
begin
 LoginEdit.setfocus;
end;

end.
