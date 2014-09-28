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
   _Kod_Sys     : string;
   _Name_Sys    : string;
   _Name_Short  : string;
  end;

  TSysArray = array of TSysRecord;

  TSplashForm = class(TForm)
    SysComboBox: TcxComboBox;
    UserNameEdit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
    DevelsImage: TImage;
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
    procedure  SelectSys;
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

uses DataModule, Registry, tagTypes, DogLoaderUnit, ShellAPI, FIBDatabase;

{$R *.dfm}

procedure TSplashForm.CloseButtonClick(Sender: TObject);
begin
 if not (fsModal in FormState) then Close
 else ModalResult := mrCancel;
end;

procedure TSplashForm.TimerTimer(Sender: TObject);
begin
 if Height < 254 then Height := Height + 3
 else Timer.Enabled := False;
end;


procedure TSplashForm.ApplyButtonClick(Sender: TObject);
var
 reg : TRegistry;
begin
 if Height < 254 then Exit;

 if SysComboBox.ItemIndex = -1 then begin
  ShowMessage('Ви не обрали систему!');
  Exit;
 end;

 reg := TRegistry.Create;

 try
  reg.RootKey := HKEY_CURRENT_USER;
  if reg.OpenKey(REG_KEY + 'LogForm', True) then begin
   if SysComboBox.ItemIndex >= 0 then reg.WriteInteger('LastSys', SysArray[SysComboBox.ItemIndex]._id_Reg);
  end;
 finally
  reg.Free;
 end;

 if NO_PASS_MODE then ModalResult := mrOk
 else Login; {}

// ModalResult := mrOk;
end;

procedure TSplashForm.CancelButtonClick(Sender: TObject);
begin
 if Height < 254 then Exit;

 if FormStyle = fsNormal then ModalResult := mrCancel
 else ModalResult := mrAbort;
end;

procedure TSplashForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TSplashForm.SelectSys;
var
 i      : integer;
 reg    : TRegistry;
 id_Reg : integer;
 Flag   : boolean;
begin
 SysArray := nil;

 reg := TRegistry.Create;

 id_Reg := -1;
 Flag   := True;

 try
  reg.RootKey := HKEY_CURRENT_USER;

  if reg.OpenKey(REG_KEY + 'LogForm', True) then begin
   if reg.ValueExists('LastSys') then id_Reg := reg.ReadInteger('LastSys')
   else begin
    SysComboBox.SetFocus;
    Flag := False;
   end;
  end;
 finally
  reg.Free;
 end;

 if Flag and not NO_PASS_MODE then PasswordEdit.SetFocus;

 DataSet.SelectSQL.Text := 'select * from PUB_SP_REG_UCH where ID_FORM_UCH=' + IntToStr(SYS_FORM_UCH);
 DataSet.Open;

 while not DataSet.Eof do begin
  SetLength(SysArray, Length(SysArray) + 1);

  with SysArray[Length(SysArray) - 1] do begin
   _id_Reg      := DataSet['ID_REG'];
   _Name_Sys    := DataSet['REG_TITLE'];
   _Name_Short  := DataSet['REG_SHORT'];
   _Kod_Sys     := DataSet['REG_KOD'];
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 SysComboBox.Properties.Items.Clear;

 for i := 0 to Length(SysArray) - 1 do begin
  SysComboBox.Properties.Items.Add(SysArray[i]._Name_Sys + ' - ' + SysArray[i]._Name_Short);

  if SysArray[i]._id_Reg = id_Reg then SysComboBox.ItemIndex := SysComboBox.Properties.Items.Count - 1;
 end;
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
 InitResult : TResultInfo;
 i          : integer;
begin
 // увеличить число попыток входа
 inc(Count);

 try
  // соединиться с системой безопасности

  InitResult.DBHandle  := nil;
  InitResult.ErrorCode := -1;

  for i := 0 to DM.DataBase.TransactionCount - 1 do if DM.DataBase.Transactions[i].InTransaction then DM.DataBase.Transactions[i].Rollback;

  if DM.ReadTransaction.InTransaction then DM.ReadTransaction.Rollback;
  DM.Database.close;
  DM.Database.Handle := nil;

  CloseConnection; // Закрываю предыдущее соединение (если перелогин)

  try
   Sys_User_Name     := UserNameEdit.Text;
   Sys_User_Password := PasswordEdit.Text;

   InitResult := fibInitConnection(Sys_User_Name, Sys_User_Password);
  except on e: Exception do
   begin
    ShowMessage('Фатальна помилка у системі безпеки : ' + e.Message);
    Application.Terminate;
    Exit;
   end;
  end;

  if InitResult.ErrorCode <> ACCMGMT_OK then begin // ошибка
   // отобразить сообщение об ошибке
   ShowMessage(AcMgmtErrMsg(InitResult.ErrorCode));

   PasswordEdit.SelectAll;

   // если 3 раза неправильно, выйти
   if Count >= 3 then Application.Terminate
   else	ModalResult := 0;	// иначе дать попробовать еще
  end
  else begin // все пучком
    // получаем группу пользователя

    TagTypes.CurrentID_PCARD := GetCurrentUserIDExt;  // забрать PCARD

    if fibCheckPermission('/ROOT/AdminGroup','Belong') = 0 then begin
     ADMIN_MODE := True;
     SaveLastUser;

     AccessResult.ID_User      := GetUserId;
     AccessResult.User_Id_Card := GetCurrentUserIDExt;
     AccessResult.User_Fio     := GetUserFIO;
     AccessResult.Name_user    := CurrentLogin;
     AccessResult.Login        := CurrentLogin;
     AccessResult.Pswrd        := CurrentPassword;
     AccessResult.Connection   := InitResult.DBHandle;

     ModalResult := mrOk;
    end
    else begin
     ADMIN_MODE := False;

     if fibCheckPermission('/ROOT/JO9/JO9_' + IntToStr(SysArray[SysComboBox.ItemIndex]._id_Reg),'View') = 0 then begin
      SaveLastUser;

      AccessResult.ID_User      := GetUserId;
      AccessResult.User_Id_Card := GetCurrentUserIDExt;
      AccessResult.User_Fio     := GetUserFIO;
      AccessResult.Name_user    := CurrentLogin;
      AccessResult.Login        := CurrentLogin;
      AccessResult.Pswrd        := CurrentPassword;
      AccessResult.Connection   := InitResult.DBHandle;

      ModalResult := mrOk;
      Exit;
     end
     else ShowMessage('У Вас немає прав на роботу з підсистемою!');
    end;
  end;
 except
 end;
// CloseConnection;

end;

procedure TSplashForm.FormCreate(Sender: TObject);
begin
 Brush.Style := bsClear;

 if NO_PASS_MODE then begin
  UserNameEdit.Visible := False;
  PasswordEdit.Visible := False;
 end
 else LoadLastUser;
end;

procedure TSplashForm.ShowInfo;
begin
 InfoMemo.Lines.LoadFromFile('JO9_Whats_New.txt');
 InfoMemo.Left := 9;
 InfoMemo.Top  := 131;

 ApplyButton.Visible  := False;
 CancelButton.Visible := False;
 SysComboBox.Visible  := False;
 UserNameEdit.Visible := False;
 PasswordEdit.Visible := False;

 DevelsImage.Visible  := True;
 InfoMemo.Visible     := True;

 Height := 134;
 Show;
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
  ShellExecute(Handle, nil,
    StrPCopy(zFileName, 'JO9_Whats_New.txt'), '',
    StrPCopy(zDir, ExtractFileDir(APP_PATH + INI_FILENAME)), SW_SHOWNORMAL);
end;

end.
