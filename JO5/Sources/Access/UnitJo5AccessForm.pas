unit UnitJo5AccessForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, ExtCtrls,
  AccMGMT, Registry, ZMessages,  ActnList,{ zRegions,} Buttons, jpeg,
  unit_zGlobal_Consts, zProc, JO5_Types;

type
  TFZAccess = class(TForm)
    Image4: TImage;
    Image5: TImage;
    CloseSpeedButton: TSpeedButton;
    SpeedButton1: TSpeedButton;
    UserEdit: TcxTextEdit;
    LoginEdit: TcxTextEdit;
    ActionList: TActionList;
    ActionYes: TAction;
    CancelBtn: TSpeedButton;
    YesBtn: TSpeedButton;
    ActionCancel: TAction;
    procedure UserEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionYesExecute(Sender: TObject);
    procedure LoginEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SaveUserData(Sender:TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure CloseSpeedButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    AccessResult:TJo5AccessResult;
    countoftry:byte;
    pIsAlready:boolean;
    pLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent);override;
    Property Result:TJo5AccessResult read AccessResult;
    property IsAlready:Boolean read pIsAlready;
  end;

function AccessZarplata(AOwner:TComponent):TJo5AccessResult;stdcall;
  exports AccessZarplata;

implementation

{$R *.dfm}

function AccessZarplata(AOwner:TComponent):TJo5AccessResult;stdcall;
var FormAccess:TFZAccess;
    Res:TJo5AccessResult;
begin
 FormAccess:=TFZAccess.Create(AOwner);
 Res.ID_User:=0;
 if (FormAccess.IsAlready) or (FormAccess.ShowModal=mrYes) then
    Res:=FormAccess.Result;
 FormAccess.Free;
 Result:=Res;
end;

constructor TFZAccess.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 countoftry := 0;
 pIsAlready:=False;
 pLanguageIndex:=LanguageIndex;
 YesBtn.Hint := YesBtn_Caption[pLanguageIndex];
 CancelBtn.Hint := CancelBtn_Caption[pLanguageIndex];
end;

procedure TFZAccess.UserEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then LoginEdit.SetFocus;
end;

procedure TFZAccess.ActionYesExecute(Sender: TObject);
var
 ResultInfo:TResultInfo;
begin
	inc(countoftry);
//******************************************************************************
// соединиться с системой безопасности
 try
   ResultInfo := fibInitConnection(UserEdit.Text,LoginEdit.Text);
   if ResultInfo.ErrorCode <> ACCMGMT_OK then		// ошибка
     begin
       ZShowMessage(Error_Caption[pLanguageIndex],AcMgmtErrMsg(ResultInfo.ErrorCode),mtError,[mbOk]);
       UserEdit.SetFocus;
     end
   else		// все пучком
     begin
       AccessResult.ID_User:=GetUserId;
       AccessResult.User_Id_Card:=GetCurrentUserIDExt;
       AccessResult.User_Fio := GetUserFIO;
       AccessResult.Name_user:=UserEdit.Text;
       AccessResult.DB_Handle:=ResultInfo.DBHandle;
       AccessResult.DbPath := fibGetCurrentDBPath;
//******************************************************************************
       AccessResult.User_Password:=LoginEdit.Text;
//******************************************************************************
       pIsAlready:=True;
       SaveUserData(Sender);
       if true{fibCheckPermission('/ROOT/USERS_JO5_TMP','Belong')=0}
          then ModalResult:=mrYes
     end;
 except
 on e: Exception do
  begin
 	 MessageDlg('Фатальна помилка у системі безпеки : ' + e.Message, mtError,[mbOk],0);
   if CountOfTry>=3 then Application.Terminate
   else Exit;
  end;
 end;
//******************************************************************************
 if countoftry>=3 then Application.Terminate;
end;

procedure TFZAccess.LoginEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then ActionYesExecute(Sender);
end;

procedure TFZAccess.SaveUserData(Sender:TObject);
var
 reg: TRegistry;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\Zarplata\Login\',False) then
  begin
   reg.WriteString('Login',UserEdit.Text);
   if reg.OpenKey('\Software\Zarplata\Login\Password\',False) then
      reg.WriteString('Password',LoginEdit.Text);
  end
 finally
  reg.Free;
 end;
end;

procedure TFZAccess.FormCreate(Sender: TObject);
var Reg:TRegistry;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\Zarplata\Login\',False) then
  begin
   UserEdit.Text:=reg.ReadString('Login');
   //Если нужно постоянно входить, то прописать в реестре пароль
{   if reg.OpenKey('\Software\Zarplata\Login\PassWord',False) then
     begin
      LoginEdit.Text:=reg.ReadString('PassWord');
      if LoginEdit.Text<>'' then ActionYesExecute(Sender);
     end;}
  end
 finally
  reg.Free;
 end;
end;

procedure TFZAccess.cxButton2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFZAccess.CloseSpeedButtonClick(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TFZAccess.SpeedButton1Click(Sender: TObject);
begin
ShowWindow(Application.Handle, SW_SHOWMINIMIZED);
end;

procedure TFZAccess.ActionCancelExecute(Sender: TObject);
begin
Close;
end;

end.
