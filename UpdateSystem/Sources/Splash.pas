unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, cxMaskEdit, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxDropDownEdit, ExtCtrls, DB, FIBDataSet,
  pFIBDataSet, Mask, ActnList, jpeg, cxMemo, cxButtonEdit,
  cxListBox;

const
 REG_KEY = '\Software\FMAS\UPD\';

type

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
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    destructor Destroy; override;

    procedure SaveLastUser;
    procedure LoadLastUser;
    procedure ShowInfo;
  end;
var
  SplashForm: TSplashForm;
  Count : Integer;

implementation

uses Registry, ShellAPI, DMUnit, SysAdmin, IBase, MMSystem;

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

 DM.MainDatabase.Close;
 DM.MainDatabase.Params.Clear;
 DM.MainDatabase.DatabaseName := DM.DBPath;
 DM.MainDatabase.Params.Add('user_name=' + UserNameEdit.Text);
 DM.MainDatabase.Params.Add('password=' + PasswordEdit.Text);

 try
  Dm.MainDatabase.Open;
  Dm.ReadTransaction.DefaultDatabase  := dm.MainDatabase;
  Dm.WriteTransaction.DefaultDatabase := dm.MainDatabase;
 except on e:Exception do
  begin
    PlaySound(PChar('SYSTEMHAND'), 0, SND_ASYNC);
    ShowMessage('Соединение с БД не установлено!'+#13+#13+E.Message);
    ModalResult := mrCancel;
    Application.Terminate;
    Exit;
  end;
 end;

 InitializaAdminSystem(Application.MainForm, TISC_DB_Handle(DM.MainDatabase.Handle), 555, -1, False);

 DM.CurrentLogin    := UserNameEdit.Text;
 DM.CurrentPassword := PasswordEdit.Text;

 SaveLastUser;

 ModalResult := mrOk;
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

 VersionLabel.Caption := DateToStr(FileDateToDateTime(FileAge(Application.ExeName))) + ' г.';

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

procedure TSplashForm.FormCreate(Sender: TObject);
begin
 Brush.Style := bsClear;

 LoadLastUser;
end;

procedure TSplashForm.ShowInfo;
var
 App_Path : string;
begin
 Height := 132;

 App_Path := ExtractFileDir(Application.ExeName);

 if FileExists(App_Path + '\UPD_Whats_New.txt') then InfoMemo.Lines.LoadFromFile(APP_PATH + '\UPD_Whats_New.txt');

 InfoMemo.Left := 9;
 InfoMemo.Top  := 131;

 ApplyButton.Visible  := False;
 CancelButton.Visible := False;

 UserNameEdit.Visible := False;
 PasswordEdit.Visible := False;

// ConnectLabel.Caption := 'Developer: Andrew A. Taganski';
// ConnectLabel.Visible := True;

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
 App_Path : string;
begin
 App_Path := ExtractFileDir(Application.ExeName);

 if not FileExists(App_Path + '\UPD_Whats_New.txt') then Exit;

 ShellExecute(Handle, nil,
   StrPCopy(zFileName, 'UPD_Whats_New.txt'), '',
   StrPCopy(zDir, APP_PATH), SW_SHOWNORMAL);
end;

procedure TSplashForm.btn1Click(Sender: TObject);
begin
  ApplyButton.Click;
end;

procedure TSplashForm.btn2Click(Sender: TObject);
begin
  CancelButton.Click;
end;

end.
