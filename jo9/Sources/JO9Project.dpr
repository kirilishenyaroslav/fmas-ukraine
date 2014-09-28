program JO9Project;
uses
  Forms,
  Windows,
  SysUtils,
  Controls,
  tagTypes,
  Dialogs,
  MainUnit in 'JO9Proj\MainUnit.pas' {MainForm},
  DataModule in 'JO9Proj\DataModule.pas' {DM: TDataModule},
  Splash in 'JO9Proj\Splash.pas' {SplashForm},
  MDIToolBar in 'MDITollBar\MDIToolBar.pas';

{$R *.res}

var
 i : integer;
// tagMutex   : THandle;
begin
 Application.Initialize;
 Application.Title := 'Система обліку розрахунків з контрагентами';
 ShortDateFormat   := 'dd.MM.yyyy';
 DecimalSeparator  := ',';
 SysUtils.ThousandSeparator := TagTypes.ThousandSeparator;

// tagMutex := CreateMutex(nil, False, 'URsK');
// if WaitForSingleObject(tagMutex, 0) <> Wait_TimeOut then begin

 for i := 1 to ParamCount do	begin
  if ParamStr(i) = 'iddqd'  then ADMIN_MODE   := True;
  if ParamStr(i) = 'idclip' then NO_PASS_MODE := True;
 end;

 with TSplashForm.Create(nil) do begin
  Height := 134;
  Show;
  Update;

  Application.CreateForm(TDM, DM);
  APP_PATH := ExtractFileDir(Application.ExeName) + '\';
  ReadIniFile;
  DM.DataBase.DBName := DB_PATH;
  DM.DataBase.ConnectParams.UserName := DB_USER;
  DM.DataBase.ConnectParams.Password := DB_PASSWORD;

  try DM.DataBase.Open;
      DM.ReadTransaction.StartTransaction;
  except
   begin
    ShowMessage('Неможливо з''єднатися з БД!');
    dm.Free;
    Exit;
   end
  end;

  SYS_FORM_UCH := 8;
  SelectSys;
  ConnectLabel.Visible := False;
  Timer.Enabled := True;
  Hide;

  if ShowModal <> mrOk then begin
   dm.Free;
   Exit;
  end;

  ConnectLabel.Visible := True;
  ConnectLabel.Caption := 'Оброблювання системної інформації';

  try DM.DataBase.Close;
      DM.DataBase.Handle := AccessResult.Connection;
      DM.ReadTransaction.StartTransaction;
  except
   begin
    ShowMessage('Неможливо з''єднатися з БД!');
    dm.Free;
    Exit;
   end
  end;

  SysComboBox.Enabled  := False;
  UserNameEdit.Enabled := False;
  PasswordEdit.Enabled := False;

  LoadKeyboardLayout('00000422',KLF_ACTIVATE or KLF_SUBSTITUTE_OK);

  KOD_SYS      := SysArray[SysComboBox.ItemIndex]._Kod_Sys;
  SYS_REG_UCH  := SysArray[SysComboBox.ItemIndex]._id_Reg;
  NAME_SYS     := SysArray[SysComboBox.ItemIndex]._Name_Short;

  COMPUTER_NAME := GetLocalComputerName;
  COMPUTER_USER := GetUserName;

  if not ReadSysInfo(DM.ReadTransaction) then begin
   dm.Free;
   Exit;
  end;

  WriteSYS_INFO;

  WriteProtocolIn(DM.WriteTransaction); // Протоколирую вход в систему

  Application.CreateForm(TMainForm, MainForm);

  Free;
  Application.Run;

// end
// else ShowMessage('Ви не можете запустити дві копії програми одночасно!');
 end;
end.
