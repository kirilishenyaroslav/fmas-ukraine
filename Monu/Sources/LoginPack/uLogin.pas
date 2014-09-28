unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxButtons, cxLabel, cxMaskEdit, jpeg, ExtCtrls,
  IBase, Registry, uMonuLoader;

type
  TfrmLogin = class(TForm)
    eLogin: TcxTextEdit;
    lbLogin: TcxLabel;
    lbPassword: TcxLabel;
    btnCancel: TcxButton;
    btnOk: TcxButton;
    ePassword: TcxMaskEdit;
    lbSystem: TcxLabel;
    Image1: TImage;
    Timer1: TTimer;
    procedure btnCancelClick(Sender: TObject);
    procedure eLoginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ePasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    procedure SaveLastUser;
    procedure LoadLastUser;
  public
    result : TISC_DB_HANDLE;
    autologin : boolean;
  end;

  function ShowLoginForm(NameSystem : string) : TISC_DB_HANDLE;

  exports ShowLoginForm;

implementation
uses Accmgmt;

{$R *.dfm}

var
  AccResult : TResultInfo;
  Count     : integer;

function ShowLoginForm(NameSystem : string) : TISC_DB_HANDLE;
var
 frm : TfrmLogin;
begin
  frm := TfrmLogin.Create(Nil);
  frm.lbSystem.Caption := NameSystem;
  frm.ShowModal;
  Result := frm.result;
  frm.Free;
end;

procedure TfrmLogin.SaveLastUser;
var
  r : TRegistry;
begin
  r := TRegistry.Create;
  r.RootKey := HKEY_CURRENT_USER;
  r.OpenKey(MON_REG_KEY, true);
  r.WriteString('LastUser', eLogin.Text);
  r.Free;
end;

procedure TfrmLogin.LoadLastUser;
var
  r : TRegistry;
  s : string;
begin
  r := TRegistry.Create;
  r.RootKey := HKEY_CURRENT_USER;
  r.OpenKey(MON_REG_KEY, true);
  s := r.ReadString('LastUser');
  eLogin.Text := s;
  r.Free;
end;
                  
procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.eLoginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ePassword.SetFocus;
    Key := 0;
  end;
end;

procedure TfrmLogin.ePasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    btnOkClick(Self);
  end;
end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
begin
  Result := Nil;
  MON_USER_NAME     := eLogin.Text;
  MON_USER_PASSWORD := ePassword.Text;
	try
    AccResult := fibInitConnection(MON_USER_NAME, MON_USER_PASSWORD);
	except on e: Exception do
	begin
    ShowMessage('Фатальна помилка у системі безпеки : ' + e.Message);
    ModalResult := mrCancel;
    Exit;
		end;
	end;
	if AccResult.ErrorCode <> ACCMGMT_OK then
	begin
		ShowMessage(AcMgmtErrMsg(AccResult.ErrorCode));
		if Count >= 3 then Application.Terminate;
	end
	else
  begin
    MON_ID_USER := GetUserId;
    if fibCheckPermission('/ROOT/IASRM','Belong') = 0 then begin
      Result := AccResult.DBHandle;
      SaveLastUser;
      MON_DP_PATH := fibGetCurrentDBPath;
      ModalResult := mrOk;
      exit;
    end;
  end;
end;


procedure TfrmLogin.FormCreate(Sender: TObject);
var
  i : integer;
begin
  LoadLastUser;
  for i := 0 to ParamCount do if  Copy(AnsiUpperCase(ParamStr(i)), 1, 5) = '/PASS' then
  begin
    ePassword.Text := Copy(ParamStr(i), 6, Length(ParamStr(i)) - 5);
    autologin := true;
  end;  
  if MON_USE_ALPHA_LOGIN then
  begin
    AlphaBlend := true;
    AlphaBlendValue := 0;
  end;  
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  if MON_USE_ALPHA_LOGIN and (AlphaBlendValue = 0) then Timer1.Enabled := true;
  if eLogin.Text <> '' then ePassword.SetFocus;
end;

procedure TfrmLogin.Timer1Timer(Sender: TObject);
var
 c : integer;
begin
 c := integer(AlphaBlendValue) + 10;
 if c > 255 then c := 255;
 AlphaBlendValue := c;
 if AlphaBlendValue = 255 then
 begin
   AlphaBlend := false;
   Timer1.Enabled := false;
 end;   
end;

procedure TfrmLogin.FormPaint(Sender: TObject);
begin
  if autologin then btnOk.Click;
end;

end.
