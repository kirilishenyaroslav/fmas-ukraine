unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, cxMaskEdit, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxDropDownEdit, ExtCtrls, DB, FIBDataSet,
  pFIBDataSet, Mask, ActnList, Accmgmt, jpeg, cxMemo, cxButtonEdit,
  cxListBox;

type
  TSysRecord = packed record
   _id_Reg      : integer;
   _Kod_Sys     : integer;
   _Name_Sys    : string;
   _Name_Short  : string;
  end;

  TSysArray = array of TSysRecord;

  TSplashForm = class(TForm)
    UserNameEdit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    ApplyButton: TSpeedButton;
    CancelButton: TSpeedButton;
    CloseButton: TSpeedButton;
    ConnectLabel: TLabel;
    Timer: TTimer;
    DataSet: TpFIBDataSet;
    PasswordEdit: TMaskEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Label4: TLabel;
    VersionLabel: TLabel;
    Image: TImage;
    InfoMemo: TcxMemo;
    procedure CloseButtonClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UserNameEditKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordEditKeyPress(Sender: TObject; var Key: Char);
    procedure SysComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure InfoMemoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    SysArray : TSysArray;
    destructor Destroy; override;

    procedure SaveLastUser;
    procedure LoadLastUser;
    procedure Login;
    procedure ShowInfo;
  end;
var
  SplashForm: TSplashForm;
  Count : Integer;

implementation

uses DataModule, Registry, ShellAPI, TagLib, tagBaseTypes;

{$R *.dfm}

procedure TSplashForm.CloseButtonClick(Sender: TObject);
begin
 if not (fsModal in FormState) then Close
 else ModalResult := mrCancel;
end;

procedure TSplashForm.TimerTimer(Sender: TObject);
begin
 if Height < 255 then Height := Height + 3
 else Timer.Enabled := False;
end;


procedure TSplashForm.ApplyButtonClick(Sender: TObject);
begin
 if Height < 255 then Exit;

 if NO_PASS_MODE then ModalResult := mrOk
 else Login; {}

// ModalResult := mrOk;
end;

procedure TSplashForm.CancelButtonClick(Sender: TObject);
begin
 if Height < 255 then Exit;

 if FormStyle = fsNormal then ModalResult := mrCancel
 else ModalResult := mrAbort;
end;

procedure TSplashForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TSplashForm.UserNameEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  PasswordEdit.SetFocus;
  Key := #0;
 end;
end;

procedure TSplashForm.PasswordEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  ApplyButtonClick(Sender);
 end;
end;

procedure TSplashForm.SysComboBoxKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  UserNameEdit.SetFocus;
  Key := #0;
 end;
end;

procedure TSplashForm.Action1Execute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

destructor TSplashForm.Destroy;
begin
 SplashForm := nil;
 inherited;
end;

procedure TSplashForm.FormShow(Sender: TObject);
begin
// SetWindowPos(Self.Handle,HWND_TOPMOST,1,1,1,1,SWP_NOMOVE+SWP_NOSIZE);

 VersionLabel.Caption := DateToStr(FileDateToDateTime(FileAge(Application.ExeName))) + ' р.';

 if UserNameEdit.Text <> '' then begin
  if PasswordEdit.Visible then PasswordEdit.SetFocus;
 end
 else if UserNameEdit.Visible then UserNameEdit.SetFocus;
end;

procedure TSplashForm.LoadLastUser;
var
 r : TRegistry;
 s : string;
begin
 r := TRegistry.Create;
 r.RootKey := HKEY_CURRENT_USER;
 r.OpenKey(REG_KEY, true);
 s := r.ReadString('LastUser');
 UserNameEdit.Text := s;

 r.Free;
end;

procedure TSplashForm.SaveLastUser;
var
 r : TRegistry;
begin
 r := TRegistry.Create;
 r.RootKey := HKEY_CURRENT_USER;
 r.OpenKey(REG_KEY, true);
 r.WriteString('LastUser', UserNameEdit.Text);
 r.Free;
end;

procedure TSplashForm.Login;
var
    InitResult : Integer;
begin
 // увеличить число попыток входа
 inc(Count);

 try
  // соединиться с системой безопасности

  if GetCurrentUserIDExt <> -21 then CloseConnection; // Закрываю предыдущее соединение (если перелогин)

	InitResult := -1;
	try
  Sys_User_Name     := UserNameEdit.Text;
  Sys_User_Password := PasswordEdit.Text;

	 InitResult := InitConnection(Sys_User_Name, Sys_User_Password);


	except on e: Exception do
  begin
	  ShowMessage('Фатальна помилка у системі безпеки : ' + e.Message);
 		Application.Terminate;
	 end;
	end;

	if InitResult <> ACCMGMT_OK then begin // ошибка
	 // отобразить сообщение об ошибке
	 ShowMessage(AcMgmtErrMsg(InitResult));

	 // если 3 раза неправильно, выйти
	 if Count >= 3 then Application.Terminate
	 else	ModalResult := 0;	// иначе дать попробовать еще
	end
	else begin // все пучком
   // получаем группу пользователя

   tagBaseTypes.CurrentID_PCARD := GetCurrentUserIDExt;  // забрать PCARD

   if CheckPermission('/ROOT/AdminGroup','Belong') = 0 then begin
    ADMIN_MODE := True;
    SaveLastUser;
    ModalResult := mrOk;
   end
   else begin
    ADMIN_MODE := False;

    if CheckPermission('/ROOT/PLANNING/' , 'View') = 0 then begin
     SaveLastUser;
     ModalResult := mrOk;
     Exit;
    end
    else ShowMessage('Ви не маєте прав на роботу з системою!');
   end;
	end;
 except
 end;
end;

procedure TSplashForm.FormCreate(Sender: TObject);
begin
 Brush.Style := bsClear;

 LoadLastUser;
end;

procedure TSplashForm.ShowInfo;
begin
 Height := 132;

 if FileExists('FPOP_Whats_New.txt') then InfoMemo.Lines.LoadFromFile('FPOP_Whats_New.txt');

 InfoMemo.Left := 9;
 InfoMemo.Top  := 131;

 ApplyButton.Visible  := False;
 CancelButton.Visible := False;

 UserNameEdit.Visible := False;
 PasswordEdit.Visible := False;

 InfoMemo.Visible     := True;

 Update;
 Timer.Enabled := True;
end;

procedure TSplashForm.FormDeactivate(Sender: TObject);
begin
 if InfoMemo.Visible then Close;
end;

procedure TSplashForm.InfoMemoDblClick(Sender: TObject);
var
  zFileName, zDir: array[0..79] of Char;
begin
 if not FileExists('FPOP_Whats_New.txt') then Exit;

  ShellExecute(Handle, nil,
    StrPCopy(zFileName, 'FPOP_Whats_New.txt'), '',
    StrPCopy(zDir, ExtractFileDir(APP_PATH + INI_FILENAME)), SW_SHOWNORMAL);
end;

end.
