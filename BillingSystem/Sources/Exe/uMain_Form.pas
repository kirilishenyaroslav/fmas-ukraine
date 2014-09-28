//******************************************************************************
// Проект "ГорВодоКанал" (bs)
// Файл главной формы
// Перчак А.Л.
// создан 18/01/2010
// последние изменения Перчак А.Л. 18/01/2010
//******************************************************************************
unit uMain_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon_Loader, dxBar, cxGraphics, cxControls, dxStatusBar, uConsts,
  ExtCtrls, ActnList, ShellAPI, uCommon_Funcs, uCommon_Messages, uCommon_Types,
  uMain_DM, cxContainer, cxEdit, cxTextEdit, ImgList, cxHint, Buttons,
  pFIBErrorHandler, dxBarExtItems, StdActns, jpeg, uPreferences,
  uConsts_Messages, Registry, ActiveX, ComObj, ShlObj, uCommon_Tray_Baloon,
  AccMGMT, uCommonSp, AppEvnts, StdCtrls, cxLookAndFeelPainters,
  cxButtons, uMDIFormsBar,
  sysAdmin, cxMaskEdit, cxButtonEdit, DB, FIBDataSet, pFIBDataSet,
  frxExportPDF, frxExportRTF, frxExportXLS, frxClass, frxExportHTML,
  frxDBSet, frxDesgn, cxLabel;

type
  ShortcutType = (_DESKTOP, _QUICKLAUNCH, _SENDTO, _STARTMENU, _OTHERFOLDER);

  TMainForm = class(TForm)
    main_BarManager: TdxBarManager;
    AboutBtn: TdxBarButton;
    ExitBtn: TdxBarButton;
    StatusBar: TdxStatusBar;
    SplashTimer: TTimer;
    Main_ActionList: TActionList;
    StatusBarContainer: TdxStatusBarContainerControl;
    DB_Info_TextEdit: TcxTextEdit;
    MainImageList: TImageList;
    HintStyleController: TcxHintStyleController;
    StatusBarContainer1: TdxStatusBarContainerControl;
    ConnectionInfo_Button: TSpeedButton;
    ErrorHandler: TpFibErrorHandler;
    ReestrBtn: TdxBarButton;
    WorkBtn: TdxBarSubItem;
    HelpBtn: TdxBarSubItem;
    Now_Date: TdxBarStatic;
    Windows: TdxBarSubItem;
    Cascade: TdxBarButton;
    Horizontal: TdxBarButton;
    Vertical: TdxBarButton;
    Minimize: TdxBarButton;
    WindowsCloseAll: TdxBarButton;
    WindowCascade: TWindowCascade;
    WindowTileHorizontal: TWindowTileHorizontal;
    WindowTileVertical: TWindowTileVertical;
    WindowMinimizeAll: TWindowMinimizeAll;
    StatusBarContainer5: TdxStatusBarContainerControl;
    UserButton: TSpeedButton;
    Timer1: TTimer;
    ContractsList: TdxBarButton;
    ImageFon: TImage;
    Menu_Configuration: TdxBarSubItem;
    Options: TdxBarButton;
    Whats_New: TdxBarButton;
    Preyskurant_Button: TdxBarButton;
    SpdbfBuffer: TdxBarButton;
    RZ_Postyp: TdxBarButton;
    SysOptions: TdxBarButton;
    dxBarButton1: TdxBarButton;
    Sp_subsidy: TdxBarButton;
    frSplataIstochnikiBtn: TdxBarButton;
    frPercentValueBtn: TdxBarButton;
    frLgotaAnalisBtn: TdxBarButton;
    ApplicationEvents1: TApplicationEvents;
    SvodNepostupSummBtn: TdxBarButton;
    frSvodPoOtchislenimBtn: TdxBarButton;
    DogStatusBtn: TdxBarButton;
    SpRapStatus: TdxBarButton;
    SpTypeDocum: TdxBarButton;
    RaportOtchislBtn: TdxBarButton;
    RaportVosstanovlBtn: TdxBarButton;
    frVikonannya_Btn: TdxBarButton;
    Sp_Orders: TdxBarButton;
    NamesReport: TdxBarButton;
    DogTypeBtn: TdxBarButton;
    dxBarBtnSpisanie: TdxBarButton;
    btnCredit: TdxBarButton;
    btnShowSPCreditStatus: TdxBarButton;
    BtAdminUsers: TdxBarButton;
    dxBarButtonPanel: TdxBarButton;
    pricebutton: TdxBarButton;
    dog_reg: TdxBarButton;
    Report_exports: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    ReportsBtn: TdxBarButton;
    SpravBtn: TdxBarButton;
    EnterpriseBtn: TdxBarButton;
    DogsBtn: TdxBarButton;
    Menu_shortcut: TdxBarButton;
    imgSystem: TImage;
    btnOplata: TdxBarButton;
    btnClientAccount: TdxBarLargeButton;
    btnSprInput: TdxBarLargeButton;
    btnSprHydrometer: TdxBarLargeButton;
    btnSprDOM: TdxBarLargeButton;
    btnSprDocuments: TdxBarLargeButton;
    btnList: TdxBarLargeButton;
    procedure AboutBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SplashTimerTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure DB_Info_TextEditDblClick(Sender: TObject);
    procedure ConnectionInfo_ButtonClick(Sender: TObject);
    procedure ReestrBtnClick(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure SP_KATClick(Sender: TObject);
    procedure WindowsCloseAllClick(Sender: TObject);
    procedure UserButtonClick(Sender: TObject);
    procedure WindowsClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SP_LGOTClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure OptionsClick(Sender: TObject);
    procedure Whats_NewClick(Sender: TObject);
    procedure TypeDissClick(Sender: TObject);
    procedure RolesBtnClick(Sender: TObject);
    procedure ActionsClick(Sender: TObject);
    procedure SysOptionsClick(Sender: TObject);
    procedure SignatureBtnClick(Sender: TObject);
    procedure RahunokWorkClick(Sender: TObject);
    procedure Sp_subsidyClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure Sp_OrdersClick(Sender: TObject);
    procedure NamesReportClick(Sender: TObject);
    procedure MainFormInitialize;
    procedure BtAdminUsersClick(Sender: TObject);
    procedure dxBarButtonPanelClick(Sender: TObject);
    procedure ReportsBtnClick(Sender: TObject);
    procedure SpravBtnClick(Sender: TObject);
    procedure Menu_shortcutClick(Sender: TObject);
    procedure pricebuttonClick(Sender: TObject);
    procedure btnOplataClick(Sender: TObject);
    procedure btnClientAccountClick(Sender: TObject);
    procedure btnSprInputClick(Sender: TObject);
    procedure btnSprHydrometerClick(Sender: TObject);
    procedure btnSprDOMClick(Sender: TObject);
    procedure btnSprDocumentsClick(Sender: TObject);
    procedure btnListClick(Sender: TObject);
  private
    Yes_IsCloseNow : boolean;
    IsConfirm : boolean;
    FileUserInfo : string;
  public
    DB_PATH, config_path: string;
    PLanguageIndex: byte;
    CurrentFileInfo: string;
    AccessResult : TbsAccessResult;
    ID_USER : int64;
    is_Admin : boolean;
    Name_user : string;
    id_system : byte;
  end;

var
  MainForm       : TMainForm;
  MainMDIFormBar : TMDIToolBar;

implementation

uses uSplash_Unit, FIBDatabase, pFIBDatabase, uRep_spr_list;

{$R *.dfm}

procedure TMainForm.AboutBtnClick(Sender: TObject);
begin
  LoadAboutInfo(Self);
end;

procedure TMainForm.MainFormInitialize;
begin
  PLanguageIndex:=           uCommon_Funcs.bsLanguageIndex;
  Application.Title :=       uConsts.bs_Application_Caption[PLanguageIndex];
  MainForm.Caption:=         uConsts.bs_Application_Caption[PLanguageIndex];

  // окна
  Windows.Caption:=                uConsts.bs_Windows_Tiltle[PLanguageIndex];
  WindowCascade.Caption:=          uConsts.bs_WindowsCacade[PLanguageIndex];
  WindowTileHorizontal.Caption:=   uConsts.bs_WindowsHorizontal[PLanguageIndex];
  WindowTileVertical.Caption:=     uConsts.bs_WindowsVertical[PLanguageIndex];
  WindowMinimizeAll.Caption:=      uConsts.bs_WindowsMinimizeAll[PLanguageIndex];
  WindowsCloseAll.Caption:=        uConsts.bs_WindowsCloseAll[PLanguageIndex];

  WindowCascade.Hint:=             uConsts.bs_WindowsCacade[PLanguageIndex];
  WindowTileHorizontal.Hint:=      uConsts.bs_WindowsHorizontal[PLanguageIndex];
  WindowTileVertical.Hint:=        uConsts.bs_WindowsVertical[PLanguageIndex];
  WindowMinimizeAll.Hint:=         uConsts.bs_WindowsMinimizeAll[PLanguageIndex];
  WindowsCloseAll.Hint:=           uConsts.bs_WindowsCloseAll[PLanguageIndex];

  // статусбар
  StatusBar.Panels[0].Text:= uConsts.bs_Main_Ready_Caption[PLanguageIndex];
  StatusBar.Hint:=           uConsts.bs_Main_StatusBar_Caption[PLanguageIndex];

  // кнопки
  WorkBtn.Caption:=          uConsts.bs_Main_WorkBtn_Caption[PLanguageIndex];
  WorkBtn.Hint:=             uConsts.bs_Main_WorkBtn_Caption[PLanguageIndex];
  SpravBtn.Caption:=         uConsts.bs_Main_SpravBtn_Caption[PLanguageIndex];
  SpravBtn.Hint:=            uConsts.bs_Main_SpravBtn_Caption[PLanguageIndex];
  ReestrBtn.Caption       := uConsts.bs_WorkWithPopulation[PLanguageIndex];
  EnterpriseBtn.Caption   := uConsts.bs_WorkWithEnterprise[PLanguageIndex];
  DogsBtn.Caption         := uConsts.bs_WorkWitDogs[PLanguageIndex];
  HelpBtn.Caption:='';
  HelpBtn.Hint:=             uConsts.bs_HelpText[PLanguageIndex];
  Now_Date.Caption:=         uConsts.bs_NowDate_Caption[PLanguageIndex];

  Sp_Subsidy.Caption:=      uConsts.bs_Main_Subsidy[PLanguageIndex];
  Sp_Subsidy.hint:=         uConsts.bs_Main_Subsidy[PLanguageIndex];
  Sp_Orders.Caption :=      uConsts.bs_Main_SpOrders[PLanguageIndex];
  Sp_Orders.Hint :=         uConsts.bs_Main_SpOrders[PLanguageIndex];

  ContractsList.Caption :=   uConsts.bs_sp_ContractsList[PLanguageIndex];
  ContractsList.Hint :=      uConsts.bs_sp_ContractsList[PLanguageIndex];

  AboutBtn.Caption:=         uConsts.bs_Main_AboutBtn_Caption[PLanguageIndex];
  AboutBtn.Hint:=            uConsts.bs_Main_AboutBtn_Caption[PLanguageIndex];
  ExitBtn.Caption:=          uConsts.bs_Main_ExitBtn_Caption[PLanguageIndex];
  ExitBtn.Hint:=             uConsts.bs_Main_ExitBtn_Caption[PLanguageIndex];
  DB_Info_TextEdit.hint:=    uConsts.bs_DBInfo_Tiltle[PLanguageIndex];
  ConnectionInfo_Button.hint:=  uConsts.bs_ConnectionInfo[PLanguageIndex];
  Menu_Configuration.Caption:=     uConsts.bs_Config[PLanguageIndex];
  Menu_shortcut.Caption     := uConsts.bs_Short_Cut[PLanguageIndex];
  Options.Caption:=           uConsts.bs_Tunning[PLanguageIndex];
  Preyskurant_Button.Caption :=  uConsts.bs_PreyskurantWork[PLanguageIndex];
  Preyskurant_Button.Hint :=  uConsts.bs_PreyskurantWork[PLanguageIndex];

  //pricebutton.Caption :=  uConsts.bs_PreyskurantWork[PLanguageIndex];
  pricebutton.Hint :=  uConsts.bs_PreyskurantWork[PLanguageIndex];

  Whats_New.Caption :=        uConsts.bs_WhatsNew_Cap[PLanguageIndex];
  ReportsBtn.Caption :=       uConsts.fr_Zvit[PLanguageIndex];
  ReportsBtn.Hint :=          uConsts.fr_Zvit[PLanguageIndex];
  SpdbfBuffer.Caption :=      uConsts.bs_VC_BufferCaption[PLanguageIndex];
  SpdbfBuffer.Hint :=         uConsts.bs_VC_BufferCaption[PLanguageIndex];
  SysOptions.Caption :=       uConsts.bs_SysOptions[PLanguageIndex];
  SysOptions.Hint :=          uConsts.bs_SysOptions[PLanguageIndex];
  RZ_Postyp.Caption :=            uConsts.bs_print_RZ_Postyp[PLanguageIndex];
  RZ_Postyp.Hint :=               uConsts.bs_print_RZ_Postyp[PLanguageIndex];

  DogStatusBtn.Caption:=      uConsts.bs_Main_SpDogStatus[PLanguageIndex];
  DogStatusBtn.Hint:=         uConsts.bs_Main_SpDogStatus[PLanguageIndex];
  frSplataIstochnikiBtn.Caption :=  uConsts.frSplataIstochnikiBtn[PLanguageIndex];
  frPercentValueBtn    .Caption :=  uConsts.frPercentValueBtn[PLanguageIndex];
  frLgotaAnalisBtn     .Caption :=  uConsts.frLgotaAnalisBtn[PLanguageIndex];
  frSplataIstochnikiBtn.Hint    :=  uConsts.frSplataIstochnikiBtn[PLanguageIndex];
  frPercentValueBtn    .Hint    :=  uConsts.frPercentValueBtn[PLanguageIndex];
  frLgotaAnalisBtn     .Hint    :=  uConsts.frLgotaAnalisBtn[PLanguageIndex];
  SpRapStatus.Caption :=     uConsts.bs_Main_SpRapStatus[PLanguageIndex];
  SpTypeDocum.Caption :=     uConsts.bs_Main_SpTypeDocum[PLanguageIndex];
  btnCredit.Caption   :=     uConsts.bs_Credit_Caption[PLanguageIndex];

{  bs_Main_DawaVCImport.Caption :=    uConsts.bs_Main_DawaVCImport[PLanguageIndex];
  bs_Main_DawaVCPrimary.Caption :=   uConsts.bs_Main_DawaVCPrimary[PLanguageIndex];
  bs_Main_DawaVCLinks.Caption :=     uConsts.bs_Main_DawaVCLinks[PLanguageIndex];
  bs_Main_DawaVCBuffer.Caption :=    uConsts.bs_Main_DawaVCBuffer[PLanguageIndex];
  bs_Main_DawaVCImport.Hint :=    uConsts.bs_Main_DawaVCImport[PLanguageIndex];
  bs_Main_DawaVCPrimary.Hint :=   uConsts.bs_Main_DawaVCPrimary[PLanguageIndex];
  bs_Main_DawaVCLinks.Hint :=     uConsts.bs_Main_DawaVCLinks[PLanguageIndex];
  bs_Main_DawaVCBuffer.Hint :=    uConsts.bs_Main_DawaVCBuffer[PLanguageIndex];}

  SvodNepostupSummBtn.Hint :=  uConsts.frSvodNepostupSummBtn[PLanguageIndex];
  SvodNepostupSummBtn.Caption :=  uConsts.frSvodNepostupSummBtn[PLanguageIndex];

  frSvodPoOtchislenimBtn.Hint :=  uConsts.frSvodPoOtchislenim[PLanguageIndex];
  frSvodPoOtchislenimBtn.Caption :=  uConsts.frSvodPoOtchislenim[PLanguageIndex];

  RaportOtchislBtn.Caption :=  uConsts.bs_Main_RaportOtchisl[PLanguageIndex];
  RaportOtchislBtn.Hint :=     uConsts.bs_Main_RaportOtchisl[PLanguageIndex];

  RaportVosstanovlBtn.Caption :=  uConsts.bs_Main_RaportVotanovl[PLanguageIndex];
  RaportVosstanovlBtn.Hint :=  uConsts.bs_Main_RaportVotanovl[PLanguageIndex];

  BtAdminUsers.Caption:= uConsts.bs_User[PLanguageIndex];
  BtAdminUsers.Hint:= uConsts.bs_User[PLanguageIndex];
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  reg: TRegistry;
begin
  MainFormInitialize;

  Yes_IsCloseNow := false;

  reg:=TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\BillingSystem\Options\ExitConfirm',False) then
   if reg.ReadString('NotConfirm') = '1'
    then IsConfirm :=true
    else IsConfirm :=false;
  finally
   reg.Free;
  end;

  DZAddTrayIcon(handle , 1, Application.Icon.Handle);

  MainMDIFormBar:=TMDIToolBar.Create(main_BarManager);
end;

procedure TMainForm.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  if Application.MainForm.MDIChildCount <> 0 then
   for i:=Application.MainForm.MDIChildCount-1 downto 0 do
    if Application.MainForm.MDIChildren[i].Handle > 32 then  Application.MainForm.MDIChildren[i].Free;
  if uMain_DM.frmMainDM.Main_DB.Connected then uMain_DM.frmMainDM.Main_DB.Close;
  DZRemoveTrayIcon(Handle, 1);
end;

procedure TMainForm.SplashTimerTimer(Sender: TObject);
var
  reg : TRegistry;
begin
 // frmSplash.cxProgressBar1.Position := 100;
 // frmSplash.close;
  SplashTimer.Enabled:= false;
  Timer1.Enabled := false;
  //ImageFon.Visible := true;

  reg:=TRegistry.Create;
  try
    reg.RootKey:=HKEY_CURRENT_USER;
    if  reg.OpenKey('\Software\BillingSystem\Options\Preved',False) then
    if reg.ReadString('NotPreved')= '1' then exit
    else
      if reg.ReadString('UseSys')= '1' then
        DZBalloonTrayIcon(Handle, 1, 3, FileUserInfo, uConsts.bs_Welcome[PLanguageIndex] , bitInfo )
      else
        DZBalloonTrayIcon(Handle, 1, 3, reg.ReadString('Message'), ' ' , bitInfo )
    else
      DZBalloonTrayIcon(Handle, 1, 3, FileUserInfo, uConsts.bs_Welcome[PLanguageIndex] , bitInfo )
  finally
    reg.Free;
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i: byte;
begin
  if Yes_IsCloseNow then exit;
  if not IsConfirm then
   begin
    i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts.bs_ExitPromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
    if ((i = 7) or (i= 2)) then CanClose:=false;
   end;
end;

procedure TMainForm.FormShow(Sender: TObject);
var strSystem:string;
    Tr:TRect;
begin
  if id_system = 0 then strSystem := 'Работа с населением';
  if id_system = 1 then strSystem := 'Работа с предприятием';

  imgSystem.Top:=Round(Self.Height/2);

  imgSystem.Canvas.Pen.Color:=clBlack;
  imgSystem.Canvas.Font.Size:=14;
  Tr.Left:=0;
  Tr.Top:=0;
  Tr.Right:=imgSystem.Width;
  Tr.Bottom:=imgSystem.Height;
  imgSystem.Canvas.Brush.Color:=$009B8168;
  imgSystem.Canvas.FillRect(Tr);
  imgSystem.Canvas.TextOut(5, 5, strSystem);

  InitializaAdminSystem(Self, frmMainDM.Main_DB.Handle, 12, ID_USER, false);

  DB_Info_TextEdit.text:= MainForm.DB_PATH;
  Now_Date.Caption:= Now_Date.Caption+datetostr(uMain_DM.frmMainDM.CURRENT_TIMESTAMP) + '   ';
  Now_Date.Hint:=formatdatetime('dddd, dd mmmm yyyy'+ uConsts.bs_Year_Short[PLanguageIndex] ,uMain_DM.frmMainDM.CURRENT_TIMESTAMP);
  StatusBar.Panels[4].Text:= AccessResult.Name_user;

  UserButton.Hint:= uConsts.bs_UserInfo[PLanguageIndex] + #13 +
    uConsts.bs_Login[PLanguageIndex] + AccessResult.Name_user + #13 +
    uConsts.bs_UserFio[PLanguageIndex] +  AccessResult.User_Fio;

  FileUserInfo:= uConsts.bs_Login[PLanguageIndex] + AccessResult.Name_user + #13 +
    uConsts.bs_UserFio[PLanguageIndex] +  AccessResult.User_Fio+ #13+
    uConsts.bs_FileVersionFull[PLanguageIndex]  + CurrentFileInfo+ '. '  +
    uConsts.bs_AssemblingDate[PLanguageIndex] +

  DateTimeToStr(FileDateToDateTime(FileAge(Application.ExeName)));

  If not Is_Admin then
   Begin
    If fibCheckPermission('/ROOT/BillingSystem/BS_Reports','Belong') <> 0
      then ReportsBtn.Enabled := False;

    If fibCheckPermission('/ROOT/BillingSystem/BS_Sprav','Belong') <> 0
      then SpravBtn.Enabled := False;

    If fibCheckPermission('/ROOT/BillingSystem/BS_Configuration','Belong') <> 0
     then Menu_Configuration.Enabled := False;

    If fibCheckPermission('/ROOT/BillingSystem/BS_Configuration/SP_ShortCut','Belong') <> 0
     then Menu_shortcut.Enabled := False;



    {If fibCheckPermission('/ROOT/Contracts/Cn_Options','Belong') <> 0
      then
       Begin
         SysOptions.Enabled:=false;
         Service.Enabled:=false;
       End;

    If fibCheckPermission('/ROOT/Contracts/Cn_Price','Belong') <> 0
      then
       Begin
         Preyskurant_Button.Enabled:=false;
       End;

    If CheckPermission('/ROOT/Contracts/Cn_Sch','Belong') <> 0
      then
       Begin
         RahunokWork.Enabled:=false;
       End;

    If fibCheckPermission('/ROOT/Contracts/Cn_Report','Belong') <> 0
      then
       Begin
         RaportOtchislBtn.Enabled:=false;
         RaportVosstanovlBtn.Enabled:=false;
       End;

    If fibCheckPermission('/ROOT/Contracts/Cn_Reg','Belong') <> 0
      then
       Begin
         ReestrBtn.Enabled:=false;
       End;

     If fibCheckPermission('/ROOT/Contracts/Cn_DogReg','Belong') <> 0
      then
       Begin
        dog_reg.Enabled:=false;
       End;

     If fibCheckPermission('/ROOT/Contracts/Cn_Price','Belong') <> 0
      then
       Begin
        pricebutton.Enabled:=false;
       End;}
   End
  else StatusBar.Panels[4].Text:= StatusBar.Panels[4].Text + ' (admin)';
end;

procedure TMainForm.DB_Info_TextEditDblClick(Sender: TObject);
begin
 if is_admin then
  ShellExecute(Application.Handle,'open', pchar(config_path) ,nil,nil,SW_SHOW);
end;

procedure TMainForm.ConnectionInfo_ButtonClick(Sender: TObject);
var
  FileFullInfo : string;
begin
  FileFullInfo:=
  uConsts.bs_ApplicationName[PLanguageIndex] + Application.Title+ #13
    +
    uConsts.bs_ApplicationWay[PLanguageIndex] + '[ '+Application.ExeName+' ]'+ #13
    +
    uConsts.bs_FileVersionFull[PLanguageIndex]  + CurrentFileInfo+ #13
    +
    uConsts.bs_AssemblingDate[PLanguageIndex] + DateTimeToStr(FileDateToDateTime(FileAge(Application.ExeName)))+ #13
    +
    uConsts.bs_DBWay[PLanguageIndex] +'[ '+DB_PATH+ ' ]'+ #13;

  uCommon_Messages.bsShowMessage(uConsts.bs_ConnectionInfo[PLanguageIndex], FileFullInfo, mtInformation, [mbOK]);
end;

procedure TMainForm.ReestrBtnClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  // запуск справочника
  AParameter                           := TbsSimpleParams.Create;
  AParameter.Owner                     := self;
  AParameter.Db_Handle                 := uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.ID_User                   := AccessResult.ID_User;
  AParameter.User_Name                 := AccessResult.Name_user;
  AParameter.Formstyle                 := fsMDIChild;
  AParameter.WaitPakageOwner           := self;
  AParameter.is_admin                  := is_admin;

  RunFunctionFromPackage(AParameter, 'BillingSystem\bs_Reestr.bpl','ShowReestr');
  AParameter.Free;
end;

procedure TMainForm.FormDblClick(Sender: TObject);
begin
  ReestrBtnClick(sender);
end;

procedure TMainForm.SP_KATClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter:= TbsSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_Kat.bpl','ShowSPKat');
  AParameter.Free;
end;

procedure TMainForm.WindowsCloseAllClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=MDIChildCount-1 downto 0 do
  begin
    MDIChildren[i].Close;
  end;
  WindowsCloseAll.enabled:=false;
end;

procedure TMainForm.UserButtonClick(Sender: TObject);
var
  UserInfo : string;
  i: integer;
begin
  Screen.Cursor := crHourGlass;
  UserInfo:=
    uConsts.bs_Login[PLanguageIndex]   + #13 + '  ' + AccessResult.Name_user + #13 +
    uConsts.bs_UserFio[PLanguageIndex] + #13 + '  ' + AccessResult.User_Fio + #13 +
    uConsts.bs_Role[PLanguageIndex] + ':' + #13;

  frmMainDM.ReadTimestampDataSet.Close;
  frmMainDM.ReadTimestampDataSet.SQLs.SelectSQL.clear;
  frmMainDM.ReadTimestampDataSet.SelectSQL.Text := 'select * from CN_GET_ROLE_BY_USER(' + inttostr(AccessResult.ID_User) + ')';
  frmMainDM.ReadTimestampDataSet.Open;
  frmMainDM.ReadTimestampDataSet.FetchAll;
  frmMainDM.ReadTimestampDataSet.First;
  for i:= 0 to frmMainDM.ReadTimestampDataSet.RecordCount -1 do
   begin
     UserInfo:=UserInfo + '  ' +
     '['+frmMainDM.ReadTimestampDataSet['NAME']+ ' - '
     +
     frmMainDM.ReadTimestampDataSet['FULL_NAME']+ ']' + #13;
     frmMainDM.ReadTimestampDataSet.Next;
   end;
  frmMainDM.ReadTimestampDataSet.Close;

  UserInfo:= UserInfo + uConsts.bs_DotypSmetiTitle[PLanguageIndex]+ ':' + #13;

  if bool(is_admin) then UserInfo:=UserInfo + '  ' + uConsts.bs_AllForAdmin[PLanguageIndex]
  else
   begin
    frmMainDM.ReadTimestampDataSet.SQLs.SelectSQL.clear;
    frmMainDM.ReadTimestampDataSet.SelectSQL.Text := 'select * from CN_GET_ALL_SMETS_BY_ROLES(' + inttostr(AccessResult.ID_User) + ')';
    frmMainDM.ReadTimestampDataSet.Open;
    frmMainDM.ReadTimestampDataSet.FetchAll;
    frmMainDM.ReadTimestampDataSet.First;
    for i:= 0 to frmMainDM.ReadTimestampDataSet.RecordCount -1 do
     begin
      UserInfo:=UserInfo + '  ' +
        inttostr(frmMainDM.ReadTimestampDataSet['SMETA_KOD'])+ ' - '
        +
        frmMainDM.ReadTimestampDataSet['SMETA_TITLE'] + #13;
        frmMainDM.ReadTimestampDataSet.Next;
     end;
    frmMainDM.ReadTimestampDataSet.Close;
   end;

  Screen.Cursor := crDefault;
  uCommon_Messages.bsShowMessage(uConsts.bs_UserInfo[PLanguageIndex], UserInfo, mtInformation, [mbOK]);
end;

procedure TMainForm.WindowsClick(Sender: TObject);
begin
  WindowsCloseAll.Enabled:=(Self.MDIChildCount>0);
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  //frmSplash.cxProgressBar1.Position := frmSplash.cxProgressBar1.Position + 2;
end;

procedure TMainForm.SP_LGOTClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter:= TbsSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_Lgots.bpl','ShowSPLgots');
  AParameter.Free;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  //ImageFon.Left :=  ClientWidth  - ImageFon.Width - 4;
  //ImageFon.Top  :=  main_BarManager.Bars[0].FloatClientHeight;
end;

procedure TMainForm.OptionsClick(Sender: TObject);
var
  frmOptions: TfrmOptions;
  reg: TRegistry;
begin
  frmOptions := TfrmOptions.Create(self);
  frmOptions.Caption :=                                    uConsts.bs_Tunning[PLanguageIndex];
  frmOptions.TabSheet_1.Caption :=                         uConsts.bs_Icons[PLanguageIndex];
  frmOptions.GroupBox.Caption :=                           uConsts.bs_CreateIcons[PLanguageIndex];
  frmOptions.OkButton.Caption :=                           uConsts.bs_Accept[PLanguageIndex];
  frmOptions.CancelButton.Caption :=                       uConsts.bs_Cancel[PLanguageIndex];
  frmOptions.Desctop_Check.Properties.Caption :=           uConsts.bs_Desctop[PLanguageIndex];
  frmOptions.StartMenu_Check.Properties.Caption :=         uConsts.bs_StartMenu[PLanguageIndex];
  frmOptions.Sheet2.Caption :=                             uConsts.bs_Interface[PLanguageIndex];
  frmOptions.NotExitConfirm_CheckBox.Properties.Caption := uConsts.bs_NoExitConfirm[PLanguageIndex];
  frmOptions.Language.Caption :=                           uConsts.bs_Language[PLanguageIndex];
  frmOptions.Russian_Lang.Caption :=                       uConsts.bs_Rus_Lang[PLanguageIndex];
  frmOptions.Ukr_Lang.Caption :=                           uConsts.bs_Ukr_Lang[PLanguageIndex];
  frmOptions.NotExitConfirm_CheckBox.Checked :=            IsConfirm;
  frmOptions.ToolTipTitle:=                                uConsts.bs_Baloon[PLanguageIndex];
  frmOptions.NotPrevedBaloon_CheckBox.Properties.Caption:= uConsts.bs_Preved[PLanguageIndex];
  frmOptions.Preved_Edit.Hint :=                           uConsts.bs_PrevedHint[PLanguageIndex];

  if PLanguageIndex = 2 then frmOptions.Russian_Lang.Checked := True;
  if PLanguageIndex = 1 then frmOptions.Ukr_Lang.Checked := True;

  reg:=TRegistry.Create;
  try
    reg.RootKey:=HKEY_CURRENT_USER;
    if  reg.OpenKey('\Software\BillingSystem\Options\Preved',False) then
      if reg.ReadString('NotPreved')= '1' then
      begin
        frmOptions.NotPrevedBaloon_CheckBox.Checked := True;
        frmOptions.Preved_Edit.Text := uConsts.bs_PrevedSelf[PLanguageIndex];
      end
      else
      begin
        frmOptions.NotPrevedBaloon_CheckBox.Checked := False;
        if reg.ReadString('UseSys')= '0' then
          frmOptions.Preved_Edit.Text := reg.ReadString('Message')
        else
          frmOptions.Preved_Edit.Text := uConsts.bs_PrevedSelf[PLanguageIndex];
      end
      else
        frmOptions.Preved_Edit.Text := uConsts.bs_PrevedSelf[PLanguageIndex];
  finally
    reg.Free;
  end;

  if frmOptions.ShowModal = mrOk then
  begin
    reg := TRegistry.Create;
    try
      reg.RootKey:=HKEY_CURRENT_USER;
      if  reg.OpenKey('\Software\BillingSystem\Options\ExitConfirm',True) then
      begin
        if frmOptions.NotExitConfirm_CheckBox.Checked then
        begin
          reg.WriteString('NotConfirm','1');
          IsConfirm := true;
        end
        else
        begin
          reg.WriteString('NotConfirm','0');
          IsConfirm := false;
        end
      end
    finally
      reg.Free;
    end;

    reg := TRegistry.Create;
    try
      reg.RootKey:=HKEY_CURRENT_USER;
      if  reg.OpenKey('\Software\BillingSystem\Options\Preved',True) then
        if frmOptions.NotPrevedBaloon_CheckBox.Checked then
          reg.WriteString('NotPreved','1')
        else
        begin
          reg.WriteString('NotPreved','0');
          reg.WriteString('Message', frmOptions.Preved_Edit.Text );
          if  ((frmOptions.Preved_Edit.Text = '') or (frmOptions.Preved_Edit.Text = uConsts.bs_PrevedHint[PLanguageIndex]))
           then reg.WriteString('UseSys', '1')
           else reg.WriteString('UseSys', '0')
          end;
    finally
      reg.Free;
    end;

    reg := TRegistry.Create;
    try
      reg.RootKey:=HKEY_CURRENT_USER;
      if  reg.OpenKey('\Software\BillingSystem\Options\Language',True) then
      begin
        if frmOptions.Ukr_Lang.Checked then
         reg.WriteString('Index','1');
        if frmOptions.Russian_Lang.Checked then
         reg.WriteString('Index','2');
       end
    finally
       reg.Free;
    end;
  end;
end;

procedure TMainForm.Whats_NewClick(Sender: TObject);
begin
  Load_bs_WhatsNew(Self);
end;

procedure TMainForm.TypeDissClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
  res: Variant;
begin
  AParameter:= TbsSimpleParams.Create;
  AParameter.Owner := self;
  AParameter.Db_Handle := uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin := is_admin;
  res := RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_TypeDiss.bpl','ShowSPTypeDiss');
  AParameter.Free;
end;

procedure TMainForm.RolesBtnClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter := TbsSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_Roles.bpl','ShowSPRoles');
  AParameter.Free;
end;

procedure TMainForm.ActionsClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter:= TbsSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_Actions.bpl','ShowSPActions');
  AParameter.Free;
end;

procedure TMainForm.SysOptionsClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter:= TbsSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'BillingSystem\bs_SysOptions.bpl','ShowSysOp');
  AParameter.Free;
end;


procedure TMainForm.SignatureBtnClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
  res: Variant;
begin
  AParameter:= TbsSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_Signature.bpl','ShowSPSignature');
  AParameter.Free;
end;

procedure TMainForm.RahunokWorkClick(Sender: TObject);
begin
//  GetCnAccounts(self,Main_DM.MainDM.Main_DB.Handle,AccessResult.ID_User, AccessResult.Name_user, AccessResult.Password);
end;

procedure TMainForm.Sp_subsidyClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
   //вызов справочника
  AParameter:= TbsSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_Subsidy.bpl','ShowSPSubsidy');
  AParameter.Free;
end;

procedure TMainForm.ApplicationEvents1Message(var Msg: tagMSG;var Handled: Boolean);
var
  i: integer;
begin
 if Msg.message = wm_keydown then
    if Msg.wParam = VK_F10 then
      with Screen.ActiveForm do
       begin
        for i:=0 to ComponentCount-1 do
         if (Components[i].ClassType = TcxButton) then
          begin
            if UpperCase((Components[i] as TcxButton).Caption)= uConsts.bs_Accept[PLanguageIndex] then
                (Components[i] as TcxButton).OnClick(self);
          end;
       end;
end;

procedure TMainForm.Sp_OrdersClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter := TbsSimpleParams.Create;
  AParameter.Owner := self;
  AParameter.Db_Handle:= uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin := is_admin;
  RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_Orders.bpl','ShowSPOrders');
  AParameter.Free;
end;

procedure TMainForm.NamesReportClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
  res: Variant;
begin
  AParameter:= TbsSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin := is_admin;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_NamesReport.bpl','ShowSPNamesReport');
  AParameter.Free; 
end;

procedure TMainForm.BtAdminUsersClick(Sender: TObject);
begin
  AdminShowUsers(Self);
end;

procedure TMainForm.dxBarButtonPanelClick(Sender: TObject);
begin
  if dxBarButtonPanel.Down
   then MainMDIFormBar.Visible:=true
   else MainMDIFormBar.Visible:=false;
end;

procedure TMainForm.ReportsBtnClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter                 := TbsSimpleParams.Create;
  AParameter.Owner           := self;
  AParameter.Db_Handle       := uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.ID_User         := ID_USER;
  AParameter.is_admin        := is_Admin;
  AParameter.WaitPakageOwner := self;

  RunFunctionFromPackage(AParameter, 'BillingSystem\BsReportsLoader.bpl','ShowReports');

  AParameter.Free;
end;

procedure TMainForm.SpravBtnClick(Sender: TObject);
var
  ViewForm : TfrmRep_Spr_list;
begin
  ViewForm := TfrmRep_Spr_list.Create(self, 'BS_INI_NAME_SPRAV_INFO', ID_USER, is_Admin, Name_user);
  ViewForm.Caption := uConsts.bs_Main_SpravBtn_Caption[PLanguageIndex];
  ViewForm.FormStyle := fsMDIChild;
  ViewForm.Visible := True;
  //ViewForm.ShowModal;
  //ViewForm.Free;
  ViewForm.Show;
end;

procedure TMainForm.Menu_shortcutClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter                 := TbsSimpleParams.Create;
  AParameter.Owner           := self;
  AParameter.Db_Handle       := uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.ID_User         := ID_USER;
  AParameter.is_admin        := is_Admin;
  AParameter.WaitPakageOwner := self;

  RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_ShortCut.bpl','ShowSPShortCut');

  AParameter.Free;
end;

procedure TMainForm.pricebuttonClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter                 := TbsSimpleParams.Create;
  AParameter.Owner           := self;
  AParameter.Db_Handle       := uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.ID_User         := ID_USER;
  AParameter.is_admin        := is_Admin;
  AParameter.WaitPakageOwner := self;

  RunFunctionFromPackage(AParameter, 'BillingSystem\bs_dt_accounts.bpl','ShowSPAccounts');

  AParameter.Free;
end;

procedure TMainForm.btnOplataClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter                           := TbsSimpleParams.Create;
  AParameter.Owner                     := self;
  AParameter.Db_Handle                 := uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.ID_User                   := AccessResult.ID_User;
  AParameter.User_Name                 := AccessResult.Name_user;
  AParameter.Formstyle                 := fsMDIChild;
  AParameter.WaitPakageOwner           := self;
  AParameter.is_admin                  := is_admin;

  RunFunctionFromPackage(AParameter, 'BillingSystem\BsOplata.bpl','ShowBsOplata');
  AParameter.Free;
end;

procedure TMainForm.btnClientAccountClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter                           := TbsSimpleParams.Create;
  AParameter.Owner                     := self;
  AParameter.Db_Handle                 := uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.ID_User                   := AccessResult.ID_User;
  AParameter.User_Name                 := AccessResult.Name_user;
  AParameter.Formstyle                 := fsMDIChild;
  AParameter.WaitPakageOwner           := self;
  AParameter.is_admin                  := is_admin;

  RunFunctionFromPackage(AParameter, 'BillingSystem\BsClientAccount.bpl','ShowClientAccount');
  AParameter.Free;
end;

procedure TMainForm.btnSprInputClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter                           := TbsSimpleParams.Create;
  AParameter.Owner                     := self;
  AParameter.Db_Handle                 := uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.ID_User                   := AccessResult.ID_User;
  AParameter.User_Name                 := AccessResult.Name_user;
  AParameter.Formstyle                 := fsMDIChild;
  AParameter.WaitPakageOwner           := self;
  AParameter.is_admin                  := is_admin;

  RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_Inputs.bpl','ShowSPInputs');
  AParameter.Free;
end;


procedure TMainForm.btnSprHydrometerClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter                           := TbsSimpleParams.Create;
  AParameter.Owner                     := self;
  AParameter.Db_Handle                 := uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.ID_User                   := AccessResult.ID_User;
  AParameter.User_Name                 := AccessResult.Name_user;
  AParameter.Formstyle                 := fsMDIChild;
  AParameter.WaitPakageOwner           := self;
  AParameter.is_admin                  := is_admin;

  RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_hydrometer.bpl','ShowSPHydrometer');
  AParameter.Free;
end;

procedure TMainForm.btnSprDOMClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter                           := TbsSimpleParams.Create;
  AParameter.Owner                     := self;
  AParameter.Db_Handle                 := uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.ID_User                   := AccessResult.ID_User;
  AParameter.User_Name                 := AccessResult.Name_user;
  AParameter.Formstyle                 := fsMDIChild;
  AParameter.WaitPakageOwner           := self;
  AParameter.is_admin                  := is_admin;

  RunFunctionFromPackage(AParameter, 'BillingSystem\BsDiscountObjects.bpl','ShowDiscountObjects');
  AParameter.Free;
end;

procedure TMainForm.btnSprDocumentsClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter                           := TbsSimpleParams.Create;
  AParameter.Owner                     := self;
  AParameter.Db_Handle                 := uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.ID_User                   := AccessResult.ID_User;
  AParameter.User_Name                 := AccessResult.Name_user;
  AParameter.Formstyle                 := fsMDIChild;
  AParameter.WaitPakageOwner           := self;
  AParameter.is_admin                  := is_admin;

  RunFunctionFromPackage(AParameter, 'BillingSystem\BsDocuments.bpl','ShowDocuments');
  AParameter.Free;
end;

procedure TMainForm.btnListClick(Sender: TObject);
var
  AParameter:TbsSimpleParams;
begin
  AParameter                           := TbsSimpleParams.Create;
  AParameter.Owner                     := self;
  AParameter.Db_Handle                 := uMain_DM.frmMainDM.Main_DB.Handle;
  AParameter.ID_User                   := AccessResult.ID_User;
  AParameter.User_Name                 := AccessResult.Name_user;
  AParameter.Formstyle                 := fsMDIChild;
  AParameter.WaitPakageOwner           := self;
  AParameter.is_admin                  := is_admin;

  RunFunctionFromPackage(AParameter, 'BillingSystem\BsGroupObjects.bpl','ShowObjectsGroup');
  AParameter.Free;
end;

end.


