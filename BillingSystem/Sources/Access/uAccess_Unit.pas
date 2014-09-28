unit uAccess_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxImage, cxSplitter, uCommon_Funcs, StdCtrls, cxHint, Registry, Animate,
  GIFCtrl, ShellApi, cxCheckBox, AccMGMT, uCommon_Messages, uCommon_Types,
  uCommon_Loader, cxLookAndFeelPainters, cxButtons, upwdcrypt, upwddecrypt,
  cxMaskEdit, cxDropDownEdit, uConsts;

function NotViewFormAccess:boolean;

type TOkButton= class(TcxButton)
  public
   constructor Create(AOwner:TComponent);override;
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
  private
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
  published
    property OnMouseDown;
  end;


type TCloseButton= class(TcxButton)
  public
   constructor Create(AOwner:TComponent);override;
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
  private
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
  published
    property OnMouseDown;
end;

type
  TfrmAccess = class(TForm)
    CloseSpeedButton: TSpeedButton;
    Image: TImage;
    LoginEdit: TcxTextEdit;
    PasswordEdit: TcxTextEdit;
    Image1: TImage;
    Image2: TImage;
    HintStyleController: TcxHintStyleController;
    SafePassword_CheckBox: TcxCheckBox;
    SpeedButton1: TSpeedButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    name_system: TcxComboBox;
    procedure CloseSpeedButtonClick(Sender: TObject);
    procedure LoginEditKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PasswordEditEnter(Sender: TObject);
    procedure LoginEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PasswordEditKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LoginEditExit(Sender: TObject);
    procedure LoginEditEnter(Sender: TObject);
    procedure PasswordEditExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxButton1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxButton2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxButton2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
   AccessResult : TbsAccessResult;
   countoftry   : byte;
   procedure HintHide;
  public
   OkBtn : TOkButton;
   CloseBtn : TCloseButton;
   is_admin : Boolean;
   constructor Create(AOwner:TComponent);override;
   property    Result:TbsAccessResult read AccessResult;
  end;

implementation

{$R *.dfm}
const Error_Caption = 'Помилка';

function CreateRGNFromBitmap(rgnBitmap : TBitmap): HRGN;
var
  TransColor: TColor;
  i, j: integer;
  i_width, i_height: integer;
  i_left, i_right: integer;
  rectRGN: HRGN;
begin
  result:=0;

  i_width:=rgnBitmap.Width;
  i_height:=rgnBitmap.Height;
  TransColor:=rgnBitmap.Canvas.Pixels[0,0];

  for i:=0 to i_height-1 do
   begin
    i_left:=-1;

    for j:=0 to i_width do
     begin
      if i_left<0 then
       begin
        if rgnBitmap.Canvas.Pixels[j,i] <> TransColor then i_left:=j;
       end
      else
       if rgnBitmap.Canvas.Pixels[j,i] = TransColor then
        begin
         i_right:=j;
         rectRGN:=CreateRectRgn(i_left, i, i_right, i+1);
         if Result = 0 then Result:=rectRGN
         else
          begin
           CombineRgn(Result, Result, rectRGN,RGN_OR);
           DeleteObject(rectRGN);
          end;
         i_left:=-1;
        end;
     end;
    if i_left>=0 then
     begin
      rectRGN:=CreateRectRgn(i_left, i, i_width, i+1);
      if Result = 0 then Result:=rectRGN
      else
       begin
        CombineRgn(Result, Result, rectRGN,RGN_OR);
        DeleteObject(rectRGN);
       end;
     end;
   end;
end;

constructor TOkButton.Create(AOwner:TComponent);
var
  ButtonRGN : HRGN;
begin
  inherited Create(AOwner);
  Parent := TWinControl(AOwner);
  SetBounds(144,167,75,20);
  Glyph.LoadFromFile(ExtractFileDir(Application.ExeName) + '\BillingSystem\img_res\' + 'button_enter.bmp');
  ButtonRGN := CreateRGNFromBitmap(Glyph);
  SetWindowRgn(Handle,ButtonRGN,TRUE);
end;

constructor TCloseButton.Create(AOwner:TComponent);
var
  ButtonRGN : HRGN;
begin
  inherited Create(AOwner);
  Parent := TWinControl(AOwner);
  SetBounds(224,167,75,20);
  Glyph.LoadFromFile(ExtractFileDir(Application.ExeName) + '\BillingSystem\img_res\' + 'button_no.bmp');
  ButtonRGN := CreateRGNFromBitmap(Glyph);
  SetWindowRgn(Handle,ButtonRGN,TRUE);
end;

procedure TOkButton.CMMouseLeave(var Message: TMessage);
begin
  Glyph.LoadFromFile(ExtractFileDir(Application.ExeName) + '\BillingSystem\img_res\' + 'button_enter.bmp');
end;

procedure TOkButton.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Glyph.LoadFromFile(ExtractFileDir(Application.ExeName) + '\BillingSystem\img_res\' + 'butt_enter_press.bmp');
end;

procedure TCloseButton.CMMouseLeave(var Message: TMessage);
begin
  Glyph.LoadFromFile(ExtractFileDir(Application.ExeName) + '\BillingSystem\img_res\' + 'button_no.bmp');
end;

procedure TCloseButton.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Glyph.LoadFromFile(ExtractFileDir(Application.ExeName) + '\BillingSystem\img_res\' + 'butt_press_no.bmp');
end;

procedure TOkButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  Glyph.LoadFromFile(ExtractFileDir(Application.ExeName) + '\BillingSystem\img_res\' + 'enter_pressed.bmp');
end;

procedure TCloseButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  Glyph.LoadFromFile(ExtractFileDir(Application.ExeName) + '\BillingSystem\img_res\' + 'pressed_no.bmp');
end;

// -----------------------------------------------------------------------------------------------------------
function NotViewFormAccess:boolean;
var
  reg : TRegistry;
  res : boolean;
begin
  res := False;
  try
   reg:=TRegistry.Create;
   reg.RootKey:=HKEY_CURRENT_USER;
   res := reg.OpenKey('\Software\BillingSystem\NotLogin\',False);
  finally
   reg.Free;
  end;
  Result:=Res;
end;

procedure TfrmAccess.HintHide;
begin
  HintStyleController.HideHint;
end;

constructor TfrmAccess.Create(AOwner:TComponent);
var
  reg: TRegistry;
begin
  inherited Create(AOwner);
  countoftry := 0;
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\BillingSystem\Login\',False) then
    begin
     LoginEdit.Text:=reg.ReadString('Login');
    end;

   {if  reg.OpenKey('\Software\BillingSystem\Password\',False) then
    begin
     PasswordEdit.Text := PwdDeCrypt(reg.ReadString('Password'));
     if PasswordEdit.Text <> '' then SafePassword_CheckBox.Checked := True;
    end  }

  finally
   reg.Free;
  end;
  name_system.ItemIndex := 0;
end;

procedure TfrmAccess.CloseSpeedButtonClick(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

procedure TfrmAccess.LoginEditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then PasswordEdit.SetFocus;
end;

procedure TfrmAccess.PasswordEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_CAPITAL then
   if bsGetKeyboardState(key)
    then HintStyleController.ShowHint(self.Left + LoginEdit.Left, Top+75, 'Підказка', 'CapsLock включений!')
    else HintHide;
end;

procedure TfrmAccess.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  HintHide;
end;

procedure TfrmAccess.PasswordEditEnter(Sender: TObject);
var
  key: word;
  Layout: array[0.. KL_NAMELENGTH] of char;
begin
  PasswordEdit.Style.Color:= $00DBBD9B;
  BsSetKeyBoardLanguage('E');
  key:=VK_CAPITAL; // CapsLock
  if bsGetKeyboardState(key)
   then HintStyleController.ShowHint(self.Left + LoginEdit.Left, Top+75, 'Підказка', 'CapsLock включений!')
   else HintHide;
end;

procedure TfrmAccess.LoginEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((key = VK_RETURN) or (key = vk_tab))
   then exit
   else HintHide;
end;

procedure TfrmAccess.PasswordEditKeyPress(Sender: TObject; var Key: Char);
begin
  HintHide;
end;

procedure TfrmAccess.PasswordEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  reg: TRegistry;
  CurrentLogin, CurrentPassword, CurCryptPas : string;
  ResultInfo : TResultInfo;
  Label GameOver;
begin
  if Key = VK_RETURN then
   begin
   	inc(countoftry);

    CurrentLogin    := LoginEdit.Text;
	  CurrentPassword := PasswordEdit.Text;
    CurCryptPas     := PwdCrypt(CurrentPassword);
    reg := TRegistry.Create;
    try
     reg.RootKey:=HKEY_CURRENT_USER;
     if  reg.OpenKey('\Software\BillingSystem\Login\',True)
      then reg.WriteString('Login', CurrentLogin);

     {if SafePassword_CheckBox.Checked then
      if reg.OpenKey('\Software\BillingSystem\Password\',True)
       then reg.WriteString('Password', CurCryptPas);}

     if not SafePassword_CheckBox.Checked then
      if  reg.OpenKey('\Software\BillingSystem\Password\',True)
       then reg.DeleteValue('Password');
    finally
     reg.Free;
    end;
//******************************************************************************
    try
	   ResultInfo := fibInitConnection(CurrentLogin,CurrentPassword);
    except
     on e: Exception do
      begin
    	 MessageDlg(e.Message, mtError,[mbOk],0);
       if CountOfTry>=3
        then Application.Terminate
        else Exit;
      end;
    end;
//******************************************************************************
    if ResultInfo.ErrorCode <> ACCMGMT_OK then
     begin
    	bsShowMessage(Error_Caption,AcMgmtErrMsg(ResultInfo.ErrorCode),mtError,[mbOk]);
      LoginEdit.SetFocus;
      try
       CloseConnection;
      except
       on e: Exception do
       MessageDlg(e.Message, mtError,[mbOk],0);
      end;
      LoginEdit.SetFocus;
      goto GameOver;
     end
//******************************************************************************
    else
     begin
      AccessResult.ID_User      := GetUserId;
      AccessResult.User_Id_Card := GetCurrentUserIDExt;
      AccessResult.User_Fio     := GetUserFIO;
      AccessResult.Name_user    := CurrentLogin;
      AccessResult.Password     := CurrentPassword;
      AccessResult.DB_Handle    := ResultInfo.DBHandle;
      AccessResult.id_system    := name_system.ItemIndex; 

      is_admin := false;
      if (fibCheckPermission('/ROOT/BillingSystem/bs_admin','Belong') = 0) then is_admin := True;

      if ((is_admin) or (fibCheckPermission('/ROOT/BillingSystem','Belong') = 0)) then
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
       bsShowMessage('Помилка','Ви не маєте прав на вхід до цієї системи',mtError,[mbOK]);
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

procedure TfrmAccess.LoginEditExit(Sender: TObject);
begin
  LoginEdit.Style.Color:= $00CFA678;
end;

procedure TfrmAccess.LoginEditEnter(Sender: TObject);
begin
  LoginEdit.Style.Color:= $00DBBD9B;
  BsSetKeyBoardLanguage('U');
end;

procedure TfrmAccess.PasswordEditExit(Sender: TObject);
begin
  PasswordEdit.Style.Color:= $00CFA678;
end;

procedure TfrmAccess.FormShow(Sender: TObject);
begin
  PasswordEdit.Style.Color:= $00CFA678 ;
  if LoginEdit.Text<>'' then
  begin
     PasswordEdit.SetFocus;
     BsSetKeyBoardLanguage('E');
  end;
end;

procedure TfrmAccess.SpeedButton1Click(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_SHOWMINIMIZED);
end;

procedure TfrmAccess.cxButton1Click(Sender: TObject);
var
  ss: TShiftState;
  key : Word;
begin
  ss:=[ssShift] ;
  key :=13;
  PasswordEditKeyDown(self, key, ss);
end;

procedure TfrmAccess.FormCreate(Sender: TObject);
var
  FormRGN   : HRGN;
begin
  OkBtn    := TOkButton.Create(self);
  CloseBtn := TCloseButton.Create(self);

  FormRGN   :=CreateRGNFromBitmap(Image.Picture.Bitmap);
  SetWindowRgn(Handle,FormRGN,TRUE);
  OkBtn.OnClick := cxButton1Click;
  CloseBtn.OnClick := cxButton2Click;
end;

procedure TfrmAccess.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

procedure TfrmAccess.cxButton1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  cxButton1.Glyph.LoadFromFile(ExtractFileDir(Application.ExeName) + '\BillingSystem\img_res\' + 'butt_enter_press.bmp');
end;

procedure TfrmAccess.cxButton1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  cxButton1.Glyph.LoadFromFile(ExtractFileDir(Application.ExeName) + '\BillingSystem\img_res\' + 'button_enter.bmp');
end;

procedure TfrmAccess.cxButton2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  cxButton2.Glyph.LoadFromFile(ExtractFileDir(Application.ExeName) + '\BillingSystem\img_res\' + 'butt_press_no.bmp');
end;

procedure TfrmAccess.cxButton2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  cxButton2.Glyph.LoadFromFile(ExtractFileDir(Application.ExeName) + '\BillingSystem\img_res\' + 'button_no.bmp');
end;

procedure TfrmAccess.Label1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const  SC_DragMove = $F012;
begin
  ReleaseCapture;
  perform(WM_SysCommand, SC_DragMove, 0);
end;

end.
