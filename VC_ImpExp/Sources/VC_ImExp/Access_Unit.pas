unit Access_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, AccMGMT, cxCheckBox, Registry, ibase;

type TAccessResult = record
 ID_User:integer;
 Name_user:string;
 User_Id_Card:integer;
 User_Fio:string;
 DB_Handle : TISC_DB_HANDLE;
 Password: string;
end;

type
  TfrmAccess = class(TForm)
    LoginEdit: TcxTextEdit;
    PasswordEdit: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    SafePassword_CheckBox: TcxCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure PasswordEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton2Click(Sender: TObject);
    procedure LoginEditKeyPress(Sender: TObject; var Key: Char);
  private
    countoftry   : byte;
  public
     AccessResult : TAccessResult;
     constructor Create(AOwner:TComponent);override;
  end;

var
  frmAccess: TfrmAccess;

implementation

{$R *.dfm}

constructor TfrmAccess.Create(AOwner:TComponent);
var
 reg: TRegistry;
begin
 inherited Create(AOwner);
 countoftry := 0;
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\VC\Login\',False) then
  begin
   LoginEdit.Text:=reg.ReadString('Login');
  end;

  if  reg.OpenKey('\Software\VC\Password\',False) then
  begin
   PasswordEdit.Text:=reg.ReadString('Password');
   if PasswordEdit.Text <> '' then
   SafePassword_CheckBox.Checked:=true;
  end

 finally
  reg.Free;
 end;
end;

procedure TfrmAccess.FormShow(Sender: TObject);
begin
LoginEdit.SetFocus;
end;

procedure TfrmAccess.cxButton1Click(Sender: TObject);
var ss: TShiftState;
   key : Word;
begin
ss:=[ssShift] ;
key :=13;
PasswordEditKeyDown(self, key, ss);
end;

procedure TfrmAccess.PasswordEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 InitResult:	Integer;
 reg: TRegistry;
 CurrentLogin, CurrentPassword:string;
  ResultInfo : TResultInfo;
Label GameOver;
begin
if Key = VK_RETURN then begin
	inc(countoftry);
//******************************************************************************
	CurrentLogin    := LoginEdit.Text;
	CurrentPassword := PasswordEdit.Text;
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\VC\Login\',True) then
   begin
    reg.WriteString('Login',CurrentLogin);
   end;
   if SafePassword_CheckBox.Checked then
   if  reg.OpenKey('\Software\VC\Password\',True) then
   begin
    reg.WriteString('Password',CurrentPassword);
   end;
   if not SafePassword_CheckBox.Checked then
   if  reg.OpenKey('\Software\VC\Password\',True) then
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
	ShowMessage(AcMgmtErrMsg(ResultInfo.ErrorCode));
	begin
   LoginEdit.SetFocus;
   try
    CloseConnection;
   except
    on e: Exception do
     MessageDlg(e.Message, mtError,[mbOk],0);
   end;
  end;
  LoginEdit.SetFocus;
  goto GameOver;
 end
//******************************************************************************
 else
 begin
  AccessResult.ID_User:=GetUserId;
  AccessResult.User_Id_Card:=GetCurrentUserIDExt;
  AccessResult.User_Fio := GetUserFIO;
  AccessResult.Name_user:=CurrentLogin;
  AccessResult.Password:= CurrentPassword;
  AccessResult.DB_Handle := ResultInfo.DBHandle;
  if fibCheckPermission('/ROOT/VC','Belong')=0 then
   begin
    ModalResult:=mrYes;
    try
    except
     on e: Exception do
      MessageDlg(e.Message, mtError,[mbOk],0);
    end;
    GoTo GameOver;
   end
  else
   begin
    ShowMessage('Ви не маєте прав на вхід до цієї системи');
    try
     CloseConnection;
    except
     on e: Exception do
      MessageDlg('Фатальна помилка в системі безпеки : ' + e.Message, mtError,[mbOk],0);
    end;
    GoTo GameOver;
   end;
  end;
//******************************************************************************
GameOver:
 if (countoftry>=3) and (ModalResult<>mrYes) then Application.Terminate;
end;
end;

procedure TfrmAccess.cxButton2Click(Sender: TObject);
begin
ModalResult:=mrNo;
end;

procedure TfrmAccess.LoginEditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then PasswordEdit.SetFocus;
end;

end.
