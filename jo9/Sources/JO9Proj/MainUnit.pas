unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, dxStatusBar, dxBar, Menus, cxContainer,
  cxEdit, cxLabel, ExtCtrls, StdCtrls, dxBarExtItems, AppEvnts, DB,
  FIBDataSet, pFIBDataSet, Buttons, ToolWin, ComCtrls, MDIToolBar,
  cxTextEdit, tagLibUnit,Accmgmt;

type
  TSchRecord = packed record
   _id_Sch   : integer;
   _Num_Sch  : integer;
   _Name_Sch : string;
  end;

  TSchArray = array of TSchRecord;

  TMainForm = class(TForm)
    BarManager: TdxBarManager;
    N2: TdxBarButton;
    N3: TdxBarButton;
    N1: TdxBarSubItem;
    N5: TdxBarButton;
    N6: TdxBarButton;
    N4: TdxBarSubItem;
    N8: TdxBarButton;
    N9: TdxBarButton;
    N10: TdxBarButton;
    N7: TdxBarSubItem;
    N11: TdxBarButton;
    StatusBar: TdxStatusBar;
    SysLabel: TLabel;
    dxBarCombo1: TdxBarCombo;
    DogButton: TdxBarLargeButton;
    CustButton: TdxBarLargeButton;
    DebOstButton: TdxBarLargeButton;
    CredOstButton: TdxBarLargeButton;
    DebDocsButton: TdxBarLargeButton;
    CredDocsButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    ApplicationEvents: TApplicationEvents;
    SmetButton: TdxBarLargeButton;
    DataSet: TpFIBDataSet;
    dxBarSubItem1: TdxBarSubItem;
    PrintSubItem: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    StatusBarContainer4: TdxStatusBarContainerControl;
    AboutButton: TSpeedButton;
    ReLoginButton: TdxBarButton;
    CloseButton: TdxBarButton;
    AdminSubItem: TdxBarSubItem;
    BlockButton: TdxBarButton;
    NextPeriodButton: TdxBarButton;
    PrevPeriodButton: TdxBarButton;
    OptionsButton: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    AdminLabel: TLabel;
    UserLabel: TdxBarStatic;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton9: TdxBarButton;
    NextPeriodLabel: TLabel;
    PrevPeriodLabel: TLabel;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    ErrorsButton: TdxBarButton;
    UsersButton: TdxBarButton;
    SchLabel: TLabel;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    MaxChildBarButton: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarButton21: TdxBarButton;
    dxBarButton22: TdxBarButton;
    dxBarButton23: TdxBarButton;
    dxBarButton24: TdxBarButton;
    dxBarButton25: TdxBarButton;
    dxBarButton26: TdxBarButton;
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AboutButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BlockButtonClick(Sender: TObject);
    procedure ReLoginButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure NextPeriodButtonClick(Sender: TObject);
    procedure PrevPeriodButtonClick(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure dxBarButton11Click(Sender: TObject);
    procedure dxBarButton12Click(Sender: TObject);
    procedure OptionsButtonClick(Sender: TObject);
    procedure ErrorsButtonClick(Sender: TObject);
    procedure UsersButtonClick(Sender: TObject);
    procedure dxBarButton13Click(Sender: TObject);
    procedure dxBarButton14Click(Sender: TObject);
    procedure dxBarButton15Click(Sender: TObject);
    procedure dxBarButton17Click(Sender: TObject);
    procedure dxBarButton18Click(Sender: TObject);
    procedure dxBarButton19Click(Sender: TObject);
    procedure dxBarButton20Click(Sender: TObject);
    procedure dxBarButton22Click(Sender: TObject);
    procedure dxBarButton21Click(Sender: TObject);
    procedure dxBarButton23Click(Sender: TObject);
    procedure dxBarButton24Click(Sender: TObject);
    procedure dxBarButton25Click(Sender: TObject);
    procedure dxBarButton26Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    NextPeriod  : boolean;
    MoveOstDone : boolean;
    name_child:string;
    procedure RefreshSystem;
    procedure CheckFirstWindow;
    procedure ReadReg;
    procedure SaveReg;
  end;

var
  MainForm: TMainForm;

implementation

uses jo9_PackageLoader, DataModule, DogLoaderUnit, globalspr, TagTypes, Splash{, Wait},
     DateUtils, Wait, sysadmin, Registry;

{$R *.dfm}

procedure TMainForm.N5Click(Sender: TObject);
begin
 jo9_PackageLoader.ShowOstatki(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, False, @SYS_INFO);
 CheckFirstWindow;
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
 jo9_PackageLoader.ShowOstatki(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, True, @SYS_INFO);
 CheckFirstWindow;
end;

procedure TMainForm.N9Click(Sender: TObject);
var
 Res   : TDogResult;
 input : TDogInput;
begin
 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := DM.Database.Handle;
 input.ReadTrans    := DM.ReadTransaction.Handle;
 input.WriteTrans   := DM.WriteTransaction.Handle;
 input.FormStyle    := fsMDIChild;
 input.id_Group     := SYS_INFO._id_Group_Dog_View;
 input.id_Group_add := SYS_INFO._id_Group_Dog_Add;

 res := DogLoaderUnit.ShowDogMain(Input);

 CheckFirstWindow;
end;

procedure TMainForm.N8Click(Sender: TObject);
{var
 i, o : TSpravParams;}
begin
{ i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase']     := Integer(dm.Database.Handle);
 i['FormStyle']    := fsMDIChild;
 i['bMultiSelect'] := false;
 i['id_session']   := -1;
 i['SelectMode']   := selCustomer;
 LoadSprav('Customer\CustPackage.bpl', Self, i, o);
 i.Free;
 o.Free;}

 ShowCustomers(Owner, dm.Database.Handle, fsMDIChild, now, csmNone, -1, -1, False, -1, True);

 CheckFirstWindow;
end;

procedure TMainForm.N10Click(Sender: TObject);
var
 id : variant;
 ActualDate : TDate;
begin
 ActualDate := SYS_INFO._Period_Beg;

 id := GlobalSPR.GetSmets(Self, DM.Database.Handle, ActualDate, psmRazdSt);

 CheckFirstWindow;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 AdminLabel.Visible := ADMIN_MODE;

 SysLabel.Top       := Height - 180 - 25 - 15;
 AdminLabel.Top     := Height - 115;

 ReadReg;

 DevExTranslate;

 RefreshSystem;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
 StatusBar.Panels[3].Width := Width - 95 - 135 - 20 - 120 - 23;

 SchLabel.Left := Width - SchLabel.Width - 15;
 SchLabel.Top  := Height - SchLabel.Height - 90;

 Repaint;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
 jo9_PackageLoader.ShowAllDoc(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, False, @SYS_INFO);
 CheckFirstWindow;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
 jo9_PackageLoader.ShowAllDoc(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, True, @SYS_INFO);
 CheckFirstWindow;
end;

procedure TMainForm.FormActivate(Sender: TObject);
var
 Res : TModalResult;
begin
 Exit;
 if MoveOstDone then Exit;

 Res := mrCancel;

 while Res <> mrNo do begin
  Res := jo9_PackageLoader.CheckMoveOst(Self, dm.Database.Handle, dm.ReadTransaction.Handle, @SYS_INFO);
  if Res = mrAbort then begin
   Close;
   Break;
  end;
 end;

 MoveOstDone := True;
end;

procedure TMainForm.AboutButtonClick(Sender: TObject);
var
 f : TSplashForm;
begin
 f := TSplashForm.Create(Self);
 f.ConnectLabel.Visible := False;
 f.Height := 288;
 f.ShowInfo;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 SysAdmin.FinalizeAdminSystem;

 SaveReg;
//
 WriteProtocolOut(DM.WriteTransaction); // Протоколирую выход из системы
 DM.ReadTransaction.Commit;

  {try
       DM.StoredProc.Close;
       DM.StoredProc.Transaction := DM.WriteTransaction;
       DM.StoredProc.Transaction.StartTransaction;
       DM.StoredProc.StoredProcName:='JO9_IN_CUR_BUFF_CLEAR';
       DM.StoredProc.Prepare;
       DM.StoredProc.ParamByName('KEY_SESSION').AsInteger:=0;
       DM.StoredProc.ExecProc;
       DM.StoredProc.Transaction.Commit;
       except on E : Exception
       do begin
        ShowMessage(E.Message);
        DM.StoredProc.Transaction.Rollback;
        exit;
       end;
        end;    }
// DM.ReadTransaction.StartTransaction;
 //if DM.Database.Connected then DM.Database.Close;

// if (DM.WriteTransaction.Active ) then
//  DM.WriteTransaction.Commit;
// CloseConnection;
    
 //
// DM.ReadTransaction.Commit;
// DataSet.Transaction.StartTransaction;
// DataSet.Transaction.Commit;
end;

procedure TMainForm.ApplicationEventsException(Sender: TObject;
  E: Exception);
begin
 WriteProtocolError(DM.WriteTransaction, E.Message);

 NextPeriodLabel.Visible := False;
 PrevPeriodLabel.Visible := False;

 Screen.Cursor := crDefault;

 ShowMessage(E.Message);
end;

procedure TMainForm.CloseButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 CanClose := (MessageDlg('Увага!', 'Чи дійсно Ви бажаєте залишити програму?', mtConfirmation, [mbYes, mbNo]) = mrYes);
end;

procedure TMainForm.BlockButtonClick(Sender: TObject);
begin
 GetNativeSch(dm.ReadTransaction, SYS_NATIVE_SCH, EncodeDate(SYS_YEAR, SYS_MONTH, 1));
 jo9_PackageLoader.DoBlockSch(Self, dm.Database.Handle, fsMDIChild, @SYS_INFO);

 CheckFirstWindow;
end;

procedure TMainForm.ReLoginButtonClick(Sender: TObject);
var
 i  : integer;
 sm : TModalResult;
begin
 for i := 0 to MDIChildCount - 1 do
  if (MDIChildren[i].Name = 'jo9_docs_add_Form') or (MDIChildren[i].Name = 'jo9_docs_add_Form2')
  or (MDIChildren[i].Name = 'jo9_ostatki_add_Form') or (MDIChildren[i].Name = 'jo9_ostatki_add_Form2')
  or (MDIChildren[i].Name = 'Block_Sch_Form') then
   if MessageDlg('Увага!', 'Ви дійсно бажаєте вийти з незбереженими даними?', mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;

 for i := 0 to MDIChildCount - 1 do MDIChildren[i].Close;

 with TSplashForm.Create(Self) do begin
  Height := 134;
  Show;

  SYS_FORM_UCH := 8;
  SelectSys;
  ConnectLabel.Visible := False;
  Timer.Enabled := True;
  Hide;

  sm := ShowModal;

  if sm = mrAbort then CloseButtonClick(Sender);

  SysAdmin.FinalizeAdminSystem;
  tagLibUnit.FinalizeTagLib;

  if sm <> mrOk then begin
   Application.Terminate;
   Exit;
  end;

  ConnectLabel.Visible := True;
  ConnectLabel.Caption := 'Оброблювання системної інформації';

  SysComboBox.Enabled  := False;
  UserNameEdit.Enabled := False;
  PasswordEdit.Enabled := False;

  KOD_SYS      := SysArray[SysComboBox.ItemIndex]._Kod_Sys;
  SYS_REG_UCH  := SysArray[SysComboBox.ItemIndex]._id_Reg;
  NAME_SYS     := SysArray[SysComboBox.ItemIndex]._Name_Short;

  COMPUTER_NAME := GetLocalComputerName;
  COMPUTER_USER := GetUserName;

  ReadSysInfo(DM.ReadTransaction);
  WriteSYS_INFO;

  WriteProtocolIn(DM.WriteTransaction); // Протоколирую вход в систему

  Application.CreateForm(TMainForm, MainForm);

  RefreshSystem;

  Free;
 end;
end;

procedure TMainForm.RefreshSystem;
var
 i : integer;
 s : string;
begin
 SysAdmin.InitializaAdminSystem(Self, dm.Database.Handle, SYS_INFO._id_Reg_Uch, SYS_INFO._id_User, isSuperAdmin);
 tagLibUnit.InitializeTagLib(dm.Database, dm.ReadTransaction, SYS_INFO._id_User);

 if SYS_MONTH < 10 then
  StatusBar.Panels[2].Text := '0' + IntToStr(SYS_MONTH) + ' (' + GetMonthName(SYS_MONTH) + ')  ' + IntToStr(SYS_YEAR) + 'p.'
 else
  StatusBar.Panels[2].Text := IntToStr(SYS_MONTH) + ' (' + GetMonthName(SYS_MONTH) + ')  ' + IntToStr(SYS_YEAR) + 'p.';

 StatusBar.Panels[3].Text := 'База даних: ' + DB_PATH;
 StatusBar.Panels[4].Text := 'Версія: ' + DateToStr(FileDateToDateTime(FileAge(Application.ExeName))) + ' р.';

 s := '';
 for i := 0 to Length(SYS_INFO._Native_Sch^) - 1 do begin
  if s = '' then s := SYS_INFO._Native_Sch^[i]._Num_Sch
  else s := s + ', ' + SYS_INFO._Native_Sch^[i]._Num_Sch;
 end;

 SchLabel.Caption := 'Рахунки системи: ' + s;
 SysLabel.Caption := SYS_INFO._Name_Sys;
 FormResize(nil);

 UserLabel.Caption := 'Користувач: ' + CURRENT_USER;

 Caption := 'Система обліку розрахунків з контрагентами [' + SYS_INFO._Name_Sys + '] - ' + SYS_NAME_ORGANIZATION;

 dxBarButton1.Caption  := 'Журнал-ордер: ' + SYS_INFO._Name_Sys;
 dxBarButton24.Caption  := 'Меморіальний ордер: ' + SYS_INFO._Name_Sys+'(Типова форма №408/409)';
 dxBarButton18.Caption := 'Меморіальний ордер: ' + SYS_INFO._Name_Sys;

 MoveOstDone := False;

 DataSet.SelectSQL.Text := 'select ID_REPORT from JO9_REPORTS_SYS where KOD_SYS=' + IntToStr(SYS_INFO._id_Reg_Uch);
 DataSet.Open;

 while not DataSet.Eof do begin
  for i := 0 to BarManager.ItemCount - 1 do
   if BarManager.Items[i].Tag = DataSet.FieldByName('ID_REPORT').AsInteger then BarManager.Items[i].Visible := ivAlways;

  DataSet.Next;
 end;

 DataSet.Close;

 if not SYS_INFO._Admin_Mode then begin
  if CheckAccess('/ROOT/JO9/JO9_' + IntToStr(SYS_INFO._id_Reg_Uch) ,'Print') <> 0 then PrintSubItem.Visible := ivNever
  else PrintSubItem.Visible := ivAlways;

  if CheckAccess('/ROOT/JO9/JO9_' + IntToStr(SYS_INFO._id_Reg_Uch) ,'Block') <> 0 then AdminSubItem.Visible := ivNever
  else AdminSubItem.Visible := ivAlways;
 end
 else begin
  ErrorsButton.Visible := ivAlways;
  UsersButton.Visible := ivAlways;
 end;

 DogLoaderUnit.SYS_ID_USER := SYS_INFO._id_User;

 PrevPeriodButton.Enabled := (IncMonth(EncodeDate(SYS_INFO._Year, SYS_INFO._Month, 1), -1) >= SYS_INFO._Sys_Beg);
end;

procedure TMainForm.FormShow(Sender: TObject);
var
 p : TMDITool;
begin
 p := TMDITool.Create;
 p.AddMDIToolBar(Self);
end;

procedure TMainForm.dxBarButton2Click(Sender: TObject);
begin
 TileMode := tbVertical;
 Tile;
end;

procedure TMainForm.dxBarButton5Click(Sender: TObject);
begin
 TileMode := tbHorizontal;
 Tile;
end;

procedure TMainForm.dxBarButton6Click(Sender: TObject);
begin
 Cascade;
end;

procedure TMainForm.dxBarButton7Click(Sender: TObject);
var
 i : integer;
begin
 for i := 0 to MDIChildCount - 1 do
  MDIChildren[i].WindowState := wsMinimized;
end;

procedure TMainForm.dxBarButton8Click(Sender: TObject);
var
 i : integer;
begin
 for i := 0 to MDIChildCount - 1 do
  MDIChildren[i].Close;
end;

procedure TMainForm.dxBarButton1Click(Sender: TObject);
begin
 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_MAIN);

 CheckFirstWindow;
end;

procedure TMainForm.NextPeriodButtonClick(Sender: TObject);
var
 i    : integer;
 Flag : boolean;
 wf   : TForm;

 USE_MAIN_BOOK : boolean;
begin
 if ADMIN_MODE and (GetAsyncKeyState(VK_LSHIFT) <> 0) and (GetAsyncKeyState(VK_LCONTROL) <> 0) then
  USE_MAIN_BOOK := False
 else
  USE_MAIN_BOOK := True;

 for i := 0 to MDIChildCount - 1 do
  if (MDIChildren[i].Name = 'jo9_docs_add_Form') or (MDIChildren[i].Name = 'jo9_docs_add_Form2')
  or (MDIChildren[i].Name = 'jo9_ostatki_add_Form') or (MDIChildren[i].Name = 'jo9_ostatki_add_Form2')
  or (MDIChildren[i].Name = 'Block_Sch_Form') then
   if MessageDlg('Увага!', 'Для переходу у наступний період потрібно зачинити усі форми!'
   + #13 + 'Ви дійсно бажаєте зачинити усі форми без збереження даних?', mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;

 for i := 0 to MDIChildCount - 1 do MDIChildren[i].Close;

 if USE_MAIN_BOOK then begin
  if MessageDlg('Увага!', 'Ви дійсно бажаєте перевести систему у наступний період?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;
 end
 else if MessageDlg('Увага!', 'Ви дійсно бажаєте перевести систему у наступний період?'
         + #13 + #13 + 'Увага! (Режим переведення системи минуючи головну книгу включено!)',
         mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

 ///////////

 NextPeriodLabel.Visible := True;

 wf := ShowWaitForm(Self as TForm);

 Update;

 //////////

 GetNativeSch(dm.ReadTransaction, SYS_NATIVE_SCH, EncodeDate(SYS_YEAR, SYS_MONTH, 1));

 Flag := False;
 for i := 0 to Length(SYS_INFO._Native_Sch^) - 1 do
  if not SYS_INFO._Native_Sch^[i]._is_Blocked then begin
   Flag := True;
   Break;
  end;

 if Flag then begin
  NextPeriodLabel.Visible := False;

  CloseWaitForm(wf);

  if MessageDlg('Увага!', 'Неможливо перевести систему у наступний період!'
  + #13 + 'Один або декілька рахунків системи не заблоковано!'
  + #13 + #13 + 'Відчинити вікно блокування/розблокування рахунків?',
  mtConfirmation, [mbYes, mbNo]) = mrYes then BlockButtonClick(Sender);

  Exit;
 end;

 ////////////////

 DM.WriteTransaction.StartTransaction;

 if jo9_PackageLoader.SaveSaldoOut(Self, dm.Database.Handle, dm.ReadTransaction.Handle, DM.WriteTransaction.Handle, @SYS_INFO, USE_MAIN_BOOK)
 then begin
  DM.StoredProc.ExecProcedure('JO9_MOVE_PERIOD', [SYS_INFO._id_Reg_Uch, '1']);

  DM.WriteTransaction.Commit;
 end
 else begin
  DM.WriteTransaction.Rollback;

  NextPeriodLabel.Visible := False;

  CloseWaitForm(wf);

  ShowMessage('Перехід у наступний період не здійснено!');
  Exit;
 end;

 ReadSysInfo(DM.ReadTransaction);
 WriteSYS_INFO;
 RefreshSystem;
 NextPeriodLabel.Visible := False;

 CloseWaitForm(wf);

 ShowMessage('Перехід системи у ' + GetMonthName(SYS_MONTH) + ' ' + IntToStr(SYS_YEAR) + 'p.' + ' успішно здійснено!');
end;

procedure TMainForm.PrevPeriodButtonClick(Sender: TObject);
var
 i    : integer;
 Flag : boolean;
 wf   : TForm;

 USE_MAIN_BOOK : boolean;
begin
 if ADMIN_MODE and (GetAsyncKeyState(VK_LSHIFT) <> 0) and (GetAsyncKeyState(VK_LCONTROL) <> 0) then
  USE_MAIN_BOOK := False
 else
  USE_MAIN_BOOK := True;

 for i := 0 to MDIChildCount - 1 do
  if (MDIChildren[i].Name = 'jo9_docs_add_Form') or (MDIChildren[i].Name = 'jo9_docs_add_Form2')
  or (MDIChildren[i].Name = 'jo9_ostatki_add_Form') or (MDIChildren[i].Name = 'jo9_ostatki_add_Form2')
  or (MDIChildren[i].Name = 'Block_Sch_Form') then
   if MessageDlg('Увага!', 'Для переходу у попередній період потрібно зачинити усі форми!'
   + #13 + 'Ви дійсно бажаєте зачинити усі форми без збереження даних?', mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;

 for i := 0 to MDIChildCount - 1 do MDIChildren[i].Close;

 if IncMonth(EncodeDate(SYS_INFO._Year, SYS_INFO._Month, 1), -1) < SYS_INFO._Sys_Beg then begin
  ShowMessage('Увага! Неможливо перевести систему у попередній період!' + #13
  + #13 + 'Період системи не може бути меншим ніж дата початку дії системи [' + DateToStr(SYS_INFO._Sys_Beg) + ']');
  Exit;
 end;


 if USE_MAIN_BOOK then begin
  if MessageDlg('Увага!', 'Ви дійсно бажаєте перевести систему у попередній період?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;
 end
  else if MessageDlg('Увага!', 'Ви дійсно бажаєте перевести систему у попередній період?'
         + #13 + #13 + 'Увага! Режим відкату системи минуючи головну книгу включено!',
         mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

 /////////

 PrevPeriodLabel.Visible := True;

 wf := ShowWaitForm(Self as TForm);

 Update;

 /////////

 GetNativeSch(dm.ReadTransaction, SYS_NATIVE_SCH, EncodeDate(SYS_YEAR, SYS_MONTH, 1));

 Flag := False;
 for i := 0 to Length(SYS_INFO._Native_Sch^) - 1 do
  if SYS_INFO._Native_Sch^[i]._is_Blocked then begin
   Flag := True;
   Break;
  end;

 if Flag then begin
  PrevPeriodLabel.Visible := False;

  CloseWaitForm(wf);

  if MessageDlg('Увага!', 'Неможливо перевести систему у попередній період!'
  + #13 + 'Один або декілька рахунків системи заблоковано!'
  + #13 + #13 + 'Відчинити вікно блокування/розблокування рахунків?',
  mtConfirmation, [mbYes, mbNo]) = mrYes then BlockButtonClick(Sender);

  Exit;
 end;

 ////////////////

 DM.WriteTransaction.StartTransaction;

 if jo9_PackageLoader.RollbackSystem(Self, dm.Database.Handle, dm.ReadTransaction.Handle, DM.WriteTransaction.Handle, @SYS_INFO, USE_MAIN_BOOK)
 then begin
  DM.StoredProc.ExecProcedure('JO9_MOVE_PERIOD', [SYS_INFO._id_Reg_Uch, '-1']);

  DM.WriteTransaction.Commit;
 end
 else begin
  DM.WriteTransaction.Rollback;

  CloseWaitForm(wf);
  NextPeriodLabel.Visible := False;

  ShowMessage('Перехід у попередній період не здійснено!');
  Exit;
 end;

 ReadSysInfo(DM.ReadTransaction);
 WriteSYS_INFO;
 RefreshSystem;
 PrevPeriodLabel.Visible := False;

 CloseWaitForm(wf);

 ShowMessage('Перехід системи у ' + GetMonthName(SYS_MONTH) + ' ' + IntToStr(SYS_YEAR) + 'p.' + ' успішно здійснено!');
end;

procedure TMainForm.dxBarButton10Click(Sender: TObject);
begin
 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_SCH);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton3Click(Sender: TObject);
begin
 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_REG);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton11Click(Sender: TObject);
begin
 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_SCH_CUR);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton12Click(Sender: TObject);
begin
 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_SCH_GRP);

 CheckFirstWindow;
end;

procedure TMainForm.OptionsButtonClick(Sender: TObject);
begin
 jo9_PackageLoader.ShowOptions(Self, dm.Database.Handle, dm.ReadTransaction.Handle, @SYS_INFO, fsMDIChild);

 CheckFirstWindow;
end;

procedure TMainForm.ErrorsButtonClick(Sender: TObject);
begin
 SysAdmin.AdminShowErrors(Self);
end;

procedure TMainForm.UsersButtonClick(Sender: TObject);
begin
 SysAdmin.AdminShowUsers(Self);
end;

procedure TMainForm.dxBarButton13Click(Sender: TObject);
var
 id : variant;
 ActualDate : TDate;
begin
 ActualDate := SYS_INFO._Period_Beg;

 id := GlobalSPR.GetSch(Self, DM.Database.Handle, fsMDIChild, ActualDate, 1, SYS_INFO._id_Form_Uch, -1);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton14Click(Sender: TObject);
begin
 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_OST);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton15Click(Sender: TObject);
begin
 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_CUST);

 CheckFirstWindow;
end;

procedure TMainForm.CheckFirstWindow;
var i:Integer;

begin
 if MainForm.MDIChildCount = 1 then if MaxChildBarButton.Down then MainForm.MDIChildren[0].WindowState := wsMaximized;
end;

procedure TMainForm.ReadReg;
var
 r : TRegistry;
begin
 r := TRegistry.Create;
 r.RootKey := HKEY_CURRENT_USER;
 r.OpenKey(REG_KEY, true);
 if r.ReadString('MaxFirstChild') = 'False' then MaxChildBarButton.Down := False
 else MaxChildBarButton.Down := True;

 r.Free;
end;

procedure TMainForm.SaveReg;
var
 r : TRegistry;
begin
 r := TRegistry.Create;
 r.RootKey := HKEY_CURRENT_USER;
 r.OpenKey(REG_KEY, true);
 if MaxChildBarButton.Down then
  r.WriteString('MaxFirstChild', 'True')
 else
  r.WriteString('MaxFirstChild', 'False');

 r.Free;
end;

procedure TMainForm.dxBarButton17Click(Sender: TObject);
begin
 tagLibUnit.ShowChangeStyle(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild);
end;

procedure TMainForm.dxBarButton18Click(Sender: TObject);
begin
 if not SYS_INFO._Use_MO then begin
  ShowMessage('Даний тип звітності не використовується Вашою системою!');
  Exit;
 end;

 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_MAIN_MO);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton19Click(Sender: TObject);
begin
  //ShowMessage(VarToStr(SYS_INFO._Use_MO));
 if not SYS_INFO._Use_MO then begin
  ShowMessage('Даний тип звітності не використовується Вашою системою!');
  Exit;
 end;

 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_SCH_MO);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton20Click(Sender: TObject);
begin
 if not SYS_INFO._Use_MO then begin
  ShowMessage('Даний тип звітності не використовується Вашою системою!');
  Exit;
 end;
 
 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_SCH_CUR_MO);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton22Click(Sender: TObject);
begin
 if not SYS_INFO._Use_MO then begin
  ShowMessage('Даний тип звітності не використовується Вашою системою!');
  Exit;
 end;

 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_REG_MO);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton21Click(Sender: TObject);
begin
 if not SYS_INFO._Use_MO then begin
  ShowMessage('Даний тип звітності не використовується Вашою системою!');
  Exit;
 end;

 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_SCH_GRP_MO);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton23Click(Sender: TObject);
begin
 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_REG_EX);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton24Click(Sender: TObject);
begin
 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_MAIN_MO_2011);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton25Click(Sender: TObject);
begin
 jo9_PackageLoader.PrintAkt(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_AKT_SVERKI);

 CheckFirstWindow;
end;

procedure TMainForm.dxBarButton26Click(Sender: TObject);
begin
 jo9_PackageLoader.PrintR(Self, dm.Database.Handle, dm.ReadTransaction.Handle, fsMDIChild, @SYS_INFO, JO9_REPORT_MAIN_MO_BASE_2011);

 CheckFirstWindow;
end;

end.
