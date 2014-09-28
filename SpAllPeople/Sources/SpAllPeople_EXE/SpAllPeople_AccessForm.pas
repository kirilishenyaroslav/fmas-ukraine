unit SpAllPeople_AccessForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, ExtCtrls,
  AccMgmt, Registry, ActnList, Buttons, jpeg, IBase, SpPeople_ZMessages;

type TAccessResult = record
 ID_User:integer;
 Name_user:string;
 User_Id_Card:integer;
 User_Fio:string;
 User_Password:string;
 DB_Handle:TISC_DB_HANDLE;
 DbPath:string;
end;

type
  TFAccess = class(TForm)
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
    TitleLbl: TcxLabel;
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
    AccessResult:TAccessResult;
    countoftry:byte;
    pIsAlready:boolean;
  public
    constructor Create(AOwner:TComponent);override;
    Property Result:TAccessResult read AccessResult;
    property IsAlready:Boolean read pIsAlready;
  end;

function LoadAccess(AOwner:TComponent):TAccessResult;

implementation

{$R *.dfm}

function LoadAccess(AOwner:TComponent):TAccessResult;
var FormAccess:TFAccess;
    Res:TAccessResult;
begin
 FormAccess:=TFAccess.Create(AOwner);
 Res.ID_User:=0;
 if (FormAccess.IsAlready) or (FormAccess.ShowModal=mrYes) then
    Res:=FormAccess.Result;
 FormAccess.Free;
 Result:=Res;
end;

constructor TFAccess.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 countoftry := 0;
 pIsAlready:=False;
 YesBtn.Hint := 'Прийняти';
 CancelBtn.Hint := 'Відмінити';
end;

procedure TFAccess.UserEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then LoginEdit.SetFocus;
end;

procedure TFAccess.ActionYesExecute(Sender: TObject);
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
       ZShowMessage('Помилка!',AcMgmtErrMsg(ResultInfo.ErrorCode),mtError,[mbOk]);
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
       if fibCheckPermission('/ROOT/SpAllPeople','Belong')=0
          then begin
                ModalResult:=mrYes;
                Exit;
               end;
     end;
 except
 on e: Exception do
  begin
 	 ZShowMessage('Помилка!','Фатальна помилка у системі безпеки : ' + e.Message, mtError,[mbOk],);
   if CountOfTry>=3 then Application.Terminate
   else Exit;
  end;
 end;
//******************************************************************************
 if countoftry>=3 then Application.Terminate;
end;

procedure TFAccess.LoginEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then ActionYesExecute(Sender);
end;

procedure TFAccess.SaveUserData(Sender:TObject);
var
 reg: TRegistry;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\SpAllPeople\Login\',True) then
  begin
   reg.WriteString('Login',UserEdit.Text);
{   if reg.OpenKey('\Software\SpAllPeople\Login\Password\',False) then
      reg.WriteString('Password',LoginEdit.Text);  }
  end
 finally
  reg.Free;
 end;
end;

procedure TFAccess.FormCreate(Sender: TObject);
var Reg:TRegistry;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\SpAllPeople\Login\',False) then
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

procedure TFAccess.cxButton2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFAccess.CloseSpeedButtonClick(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TFAccess.SpeedButton1Click(Sender: TObject);
begin
ShowWindow(Application.Handle, SW_SHOWMINIMIZED);
end;

procedure TFAccess.ActionCancelExecute(Sender: TObject);
begin
Close;
end;

end.
