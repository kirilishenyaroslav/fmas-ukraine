unit LoadingUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, Buttons, LoadDogManedger, DogLoaderUnit;

type
  TLoadingForm = class(TForm)
    Image1: TImage;
    UserLabel: TLabel;
    PassLabel: TLabel;
    UserEdit: TEdit;
    PassEdit: TEdit;
    CloseButton: TSpeedButton;
    procedure UserEditKeyPress(Sender: TObject; var Key: Char);
    procedure PassEditKeyPress(Sender: TObject; var Key: Char);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    ForceUserName : string;
    ForceUserPass : string;
    Logged : Boolean;
    procedure SaveLastUser;
    procedure LoadLastUser;
    procedure Login;
    procedure HideLoginControls;
    procedure ShowLogniControls;
    function FindFlash : boolean;
  end;

var
  LoadingForm: TLoadingForm;

implementation
uses DataModule, Registry, LangUnit, Accmgmt, dogUnit;

{$R *.dfm}
var
  Count : Integer;

function TLoadingForm.FindFlash : boolean;
var
 ch : char;
 RootPath:PChar;
 f : Textfile;
 str : string;
begin
 Result := False;
 GetMem(RootPath,16);
 for Ch := 'A' to 'Z' do
 begin
   StrPLCopy(RootPath, Ch + ':\',16);
   if GetDriveType(RootPath) = DRIVE_REMOVABLE then
   begin
     if FileExists(ch + ':\__dogovor.psf') then
     begin
       AssignFile(f, ch + ':\__dogovor.psf');
       Reset(f);
       ReadLn(f, str);
       UserEdit.Text := str;
       ReadLn(f, str);
       PassEdit.Text := str;
       CloseFile(f);
       FreeMem(RootPath,16);
       Result := True;
       Login;
       Exit;
     end;
   end;
 end;
 FreeMem(RootPath,16);
end;


procedure TLoadingForm.LoadLastUser;
var
 r : TRegistry;
 s : string;
begin
 r := TRegistry.Create;
 r.RootKey := HKEY_CURRENT_USER;
 r.OpenKey(REG_KEY, true);
 s := r.ReadString('LastUser');
 UserEdit.Text := s;
 r.Free;
end;

procedure TLoadingForm.SaveLastUser;
var
 r : TRegistry;
 s : string;
begin
 r := TRegistry.Create;
 r.RootKey := HKEY_CURRENT_USER;
 r.OpenKey(REG_KEY, true);
 r.WriteString('LastUser', UserEdit.Text);
 r.Free;
end;


procedure TLoadingForm.UserEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  PassEdit.SetFocus;
  Key := #0;
 end;
end;

procedure TLoadingForm.PassEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Login;
  Key := #0;
 end;
end;

procedure TLoadingForm.Login;
var
    InitResult : Integer;
begin

    SYS_USER_NAME := UserEdit.Text;
    SYS_USER_PASSWORD := PassEdit.Text;
	// увеличить число попыток входа
	inc(Count);

(*    try
    // соединиться с системой безопасности
	InitResult := -1;
	try
		InitResult := InitConnection(UserEdit.Text, PassEdit.Text);
	except on e: Exception do
		begin
			MessageDlg('Увага', 'Фатальна помилка у системі безпеки : ' +
				e.Message, mtError,[mbOk]);
			Application.Terminate;
		end;
	end;

	if InitResult <> ACCMGMT_OK then		// ошибка
	begin
			// отобразить сообщение об ошибке
		MessageDlg('Увага', AcMgmtErrMsg(InitResult),mtError,[mbOk]);

	       				// если 3 раза неправильно, выйти
		if Count >= 3 then Application.Terminate
		else	ModalResult := 0;	// иначе дать попробовать еще
	end
	else		// все пучком
	begin
       SaveLastUser;

       // получаем группу пользователя

       CurrentID_PCARD := GetCurrentUserIDExt;  // забрать PCARD


        if fibCheckPermission('/ROOT/DOG','Belong') = 0 then begin
            Logged := True;
            if fibCheckPermission('/ROOT/SuperAdminGroup','Belong')=0 then begin
                isSuperAdmin := True
            end
            else
                isSuperAdmin := False;

            if fibCheckPermission('/ROOT/AdminGroup','Belong')=0 then begin
                isAdmin := True
            end
            else
                isAdmin := False;

            HideLoginControls;
            ModalResult := mrOk;
            exit;
        end;

       // Admin?
         if fibCheckPermission('/ROOT/AdminGroup','Belong')=0 then begin
           isAdmin := True;
           HideLoginControls;
           ModalResult := mrOk;
         end else isAdmin := False;
	end;
    except
    end; *)


 // соединиться с системой безопасности

	try
        AccResult := fibInitConnection(SYS_USER_NAME, SYS_USER_PASSWORD);
	except on e: Exception do
		begin
            ShowMessage('Фатальна помилка у системі безпеки : ' +
				e.Message);
			ModalResult := mrCancel;
            Exit;
		end;
	end;

	if AccResult.ErrorCode <> ACCMGMT_OK then		// ошибка
	begin
			// отобразить сообщение об ошибке
		ShowMessage(AcMgmtErrMsg(AccResult.ErrorCode));
            // если 3 раза неправильно, выйти
		if Count >= 3 then Application.Terminate
		else	ModalResult := 0;	// иначе дать попробовать еще
	end
	else		// все пучком
  begin
    SYS_ID_USER := GetUserId;

        if fibCheckPermission('/ROOT/DOG','Belong') = 0 then begin
            Logged := True;
            if fibCheckPermission('/ROOT/SuperAdminGroup','Belong')=0 then begin
                isSuperAdmin := True
            end
            else
                isSuperAdmin := False;

            if fibCheckPermission('/ROOT/AdminGroup','Belong')=0 then begin
                isAdmin := True
            end
            else
                isAdmin := False;

            HideLoginControls;
            SaveLastUser;
            ModalResult := mrOk;
            exit;
        end;

       // Admin?
         if fibCheckPermission('/ROOT/AdminGroup','Belong')=0 then begin
           isAdmin := True;
           HideLoginControls;

           ModalResult := mrOk;
         end else isAdmin := False;
  end;

{
 if (UserEdit.Text <> 'user') or (PassEdit.Text <> 'user') then begin
  ShowMessage('Доступ запрещен. Неверное имя пользователя или пароль.');
  exit;
 end;
 HideLoginControls;
 ModalResult := mrOk;}
end;

procedure TLoadingForm.CloseButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TLoadingForm.HideLoginControls;
begin
 UserEdit.Visible := false;
 PassEdit.Visible := false;
 UserLabel.Visible := false;
 PassLabel.Visible := false;
 CloseButton.Visible := false;
end;

procedure TLoadingForm.ShowLogniControls;
begin
 UserEdit.Visible := true;
 PassEdit.Visible := true;
 UserLabel.Visible := true;
 PassLabel.Visible := true;
 CloseButton.Visible := true;
end;

procedure TLoadingForm.FormCreate(Sender: TObject);
begin
 if ForceUserName <> '' then UserEdit.Text := ForceUserName;
 if ForceUserPass <> '' then PassEdit.Text := ForceUserPass;
 if (ForceUserPass <> '') and (ForceUserName <> '') then
 begin
   Login;
   Exit;
 end;
// if FindFlash then Exit;
 LangPackApply(Self);
 LoadLastUser;
end;

procedure TLoadingForm.FormShow(Sender: TObject);
var
ch :char;
begin
 ch := #13;
 if not UserEdit.Visible then exit;
 if UserEdit.Text <> '' then PassEdit.SetFocus else UserEdit.SetFocus;
end;


end.
