//******************************************************************************
// Проект "Контракты"
// Главная форма
// Чернявский А.Э.
// Шамарин Ю.В.
// Перчак А.Л.
//******************************************************************************
unit Main_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cn_Common_Loader, dxBar, cxGraphics, cxControls, dxStatusBar, cnConsts,
  ExtCtrls, ActnList,ShellAPI,
  cn_Common_Funcs, cn_Common_Messages, cn_Common_Types,
  Main_DM, cxContainer, cxEdit, cxTextEdit, ImgList, cxHint, Buttons,
  pFIBErrorHandler, dxBarExtItems, StdActns, jpeg, cn_Preferences, cnConsts_Messages,
  Registry, ActiveX, ComObj, ShlObj, cn_Common_Tray_Baloon, AccMGMT,
  GlobalSpr, uCommonSp, AppEvnts, StdCtrls, cxLookAndFeelPainters,
  cxButtons, AllPeopleUnit, DogLoaderUnit, ImportLoadMenedger,
  uMDIFormsBar, sysAdmin, cxMaskEdit, cxButtonEdit, cn_Common_WaitForm;

type
  ShortcutType = (_DESKTOP, _QUICKLAUNCH, _SENDTO, _STARTMENU, _OTHERFOLDER);

  TMainForm = class(TForm)
    main_BarManager: TdxBarManager;
    AboutBtn: TdxBarButton;
    ExitBtn: TdxBarButton;
    StatusBar: TdxStatusBar;
    SplashTimer: TTimer;
    SpravBtn: TdxBarSubItem;
    TypeLgot: TdxBarButton;
    PayerType: TdxBarButton;
    FacultySpecialityGroup: TdxBarButton;
    FormStudy: TdxBarButton;
    Faculty: TdxBarButton;
    Nationality: TdxBarButton;
    CategoryStudy: TdxBarButton;
    IniPeriodic: TdxBarButton;
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
    Configuration: TdxBarSubItem;
    Options: TdxBarButton;
    Whats_New: TdxBarButton;
    TypeDiss: TdxBarButton;
    Preyskurant_Button: TdxBarButton;
    frStudBtn: TdxBarButton;
    ReportsBtn: TdxBarSubItem;
    frPayBtn: TdxBarButton;
    RolesBtn: TdxBarButton;
    VC_Import: TdxBarButton;
    Service: TdxBarSubItem;
    SpdbfBuffer: TdxBarButton;
    Actions: TdxBarButton;
    RZ_Postyp: TdxBarButton;
    SysOptions: TdxBarButton;
    SignatureBtn: TdxBarButton;
    ToNextCursBtn: TdxBarButton;
    frReestrSvodPoOplate: TdxBarButton;
    RahunokWork: TdxBarButton;
    dxBarButton1: TdxBarButton;
    SpSpecBtn: TdxBarButton;
    SpDepartmentBtn: TdxBarButton;
    frSplataIstochnikiBtn: TdxBarButton;
    frPercentValueBtn: TdxBarButton;
    frLgotaAnalisBtn: TdxBarButton;
    ApplicationEvents1: TApplicationEvents;
    SvodNepostupSummBtn: TdxBarButton;
    frSvodPoOtchislenimBtn: TdxBarButton;
    DogStatusBtn: TdxBarButton;
    SpPeopleBtn: TdxBarButton;
    SpYurLizaBtn: TdxBarButton;
    cn_Main_DawaVCImport: TdxBarSubItem;
    cn_Main_DawaVCPrimary: TdxBarButton;
    cn_Main_DawaVCLinks: TdxBarButton;
    cn_Main_DawaVCBuffer: TdxBarButton;
    SpRapStatus: TdxBarButton;
    SpTypeDocum: TdxBarButton;
    RaportOtchislBtn: TdxBarButton;
    RaportVosstanovlBtn: TdxBarButton;
    frVikonannya_Btn: TdxBarButton;
    SpOrderTypesBtn: TdxBarButton;
    NamesReport: TdxBarButton;
    DogTypeBtn: TdxBarButton;
    dxBarBtnSpisanie: TdxBarButton;
    btnCredit: TdxBarButton;
    btnShowSPCreditStatus: TdxBarButton;
    BtAdminUsers: TdxBarButton;
    dxBarButtonPanel: TdxBarButton;
    pricebutton: TdxBarButton;
    dog_reg: TdxBarButton;
    sp_calc: TdxBarButton;
    Report_exports: TdxBarButton;
    RpMailList: TdxBarButton;
    act_send_test: TAction;
    dxBarSubItem1: TdxBarSubItem;
    BarButton_SynchEDBO: TdxBarButton;
    Timer_SynchEDBO: TTimer;
    check_link_edbo_fizButton: TdxBarButton;
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
    procedure NationalityClick(Sender: TObject);
    procedure CategoryStudyClick(Sender: TObject);
    procedure FormStudyClick(Sender: TObject);
    procedure FacultySpecialityGroupClick(Sender: TObject);
    procedure IniPeriodicClick(Sender: TObject);
    procedure WindowsCloseAllClick(Sender: TObject);
    procedure UserButtonClick(Sender: TObject);
    procedure WindowsClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ContractsListClick(Sender: TObject);
    procedure TypeLgotClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure OptionsClick(Sender: TObject);
    procedure Whats_NewClick(Sender: TObject);
    procedure TypeDissClick(Sender: TObject);
    procedure frStudBtnClick(Sender: TObject);
    procedure frPayBtnClick(Sender: TObject);
    procedure RolesBtnClick(Sender: TObject);
    procedure VC_ImportClick(Sender: TObject);
    procedure SpdbfBufferClick(Sender: TObject);
    procedure ActionsClick(Sender: TObject);
    procedure RZ_PostypClick(Sender: TObject);
    procedure SysOptionsClick(Sender: TObject);
    procedure SignatureBtnClick(Sender: TObject);
    procedure ToNextCursBtnClick(Sender: TObject);
    procedure frReestrSvodPoOplateClick(Sender: TObject);
    procedure RahunokWorkClick(Sender: TObject);
    procedure SpSpecBtnClick(Sender: TObject);
    procedure SpDepartmentBtnClick(Sender: TObject);
    procedure frSplataIstochnikiBtnClick(Sender: TObject);
    procedure frPercentValueBtnClick(Sender: TObject);
    procedure frLgotaAnalisBtnClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure SvodNepostupSummBtnClick(Sender: TObject);
    procedure frSvodPoOtchislenimBtnClick(Sender: TObject);
    procedure DogStatusBtnClick(Sender: TObject);
    procedure SpPeopleBtnClick(Sender: TObject);
    procedure SpYurLizaBtnClick(Sender: TObject);
    procedure cn_Main_DawaVCPrimaryClick(Sender: TObject);
    procedure SpRapStatusClick(Sender: TObject);
    procedure SpTypeDocumClick(Sender: TObject);
    procedure RaportOtchislBtnClick(Sender: TObject);
    procedure RaportVosstanovlBtnClick(Sender: TObject);
    procedure cn_Main_DawaVCLinksClick(Sender: TObject);
    procedure cn_Main_DawaVCBufferClick(Sender: TObject);
    procedure frVikonannya_BtnClick(Sender: TObject);
    procedure SpOrderTypesBtnClick(Sender: TObject);
    procedure NamesReportClick(Sender: TObject);
    procedure DogTypeBtnClick(Sender: TObject);
    procedure dxBarBtnSpisanieClick(Sender: TObject);
    procedure btnCreditClick(Sender: TObject);
    procedure btnShowSPCreditStatusClick(Sender: TObject);
    procedure MainFormInitialize;
    procedure BtAdminUsersClick(Sender: TObject);
    procedure dxBarButtonPanelClick(Sender: TObject);
    procedure pricebuttonClick(Sender: TObject);
    procedure dog_regClick(Sender: TObject);
    procedure sp_calcClick(Sender: TObject);
    procedure Report_exportsClick(Sender: TObject);
    procedure RpMailListClick(Sender: TObject);
    procedure BarButton_SynchEDBOClick(Sender: TObject);
    procedure Timer_SynchEDBOTimer(Sender: TObject);
    procedure check_link_edbo_fizButtonClick(Sender: TObject);
  private
    Yes_IsCloseNow : boolean;
    IsConfirm : boolean;
    FileUserInfo : string;
    is_admin : boolean;
    CN_USE_EDBO_FIZ_LIC : Integer;
  public
    DB_PATH, config_path: string;
    PLanguageIndex: byte;
    CurrentFileInfo: string;
    AccessResult : TcnAccessResult;
    ID_USER: int64;
  end;

var
  MainForm: TMainForm;
  MainMDIFormBar: TMDIToolBar;

implementation

uses Splash_Unit, FIBDatabase;

{$R *.dfm}

procedure TMainForm.AboutBtnClick(Sender: TObject);
begin
  LoadAboutInfo(Self);
end;

procedure TMainForm.MainFormInitialize;
begin
  PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex;
  Application.Title :=       cnConsts.cn_Application_Caption[PLanguageIndex];
  MainForm.Caption:=         cnConsts.cn_Application_Caption[PLanguageIndex];
  // окна
  Windows.Caption:=                cnConsts.cn_Windows_Tiltle[PLanguageIndex];
  WindowCascade.Caption:=          cnConsts.cn_WindowsCacade[PLanguageIndex];
  WindowTileHorizontal.Caption:=   cnConsts.cn_WindowsHorizontal[PLanguageIndex];
  WindowTileVertical.Caption:=     cnConsts.cn_WindowsVertical[PLanguageIndex];
  WindowMinimizeAll.Caption:=      cnConsts.cn_WindowsMinimizeAll[PLanguageIndex];
  WindowsCloseAll.Caption:=        cnConsts.cn_WindowsCloseAll[PLanguageIndex];

  WindowCascade.Hint:=             cnConsts.cn_WindowsCacade[PLanguageIndex];
  WindowTileHorizontal.Hint:=      cnConsts.cn_WindowsHorizontal[PLanguageIndex];
  WindowTileVertical.Hint:=        cnConsts.cn_WindowsVertical[PLanguageIndex];
  WindowMinimizeAll.Hint:=         cnConsts.cn_WindowsMinimizeAll[PLanguageIndex];
  WindowsCloseAll.Hint:=           cnConsts.cn_WindowsCloseAll[PLanguageIndex];

  // статусбар
  StatusBar.Panels[0].Text:= cnConsts.cn_Main_Ready_Caption[PLanguageIndex];
  StatusBar.Hint:=           cnConsts.cn_Main_StatusBar_Caption[PLanguageIndex];
  // кнопки
  WorkBtn.Caption:=          cnConsts.cn_Main_WorkBtn_Caption[PLanguageIndex];
  WorkBtn.Hint:=             cnConsts.cn_Main_WorkBtn_Caption[PLanguageIndex];
  SpravBtn.Caption:=         cnConsts.cn_Main_SpravBtn_Caption[PLanguageIndex];
  SpravBtn.Hint:=            cnConsts.cn_Main_SpravBtn_Caption[PLanguageIndex];
  ReestrBtn.Caption:=        cnConsts.cn_ContractsReestrText[PLanguageIndex];
  HelpBtn.Caption:='';
  HelpBtn.Hint:=             cnConsts.cn_HelpText[PLanguageIndex];
  Now_Date.Caption:=         cnConsts.cn_NowDate_Caption[PLanguageIndex];

  TypeLgot.Caption:=         cnConsts.cn_Main_TypeLgot[PLanguageIndex];
  TypeLgot.hint:=            cnConsts.cn_Main_TypeLgot[PLanguageIndex];
  PayerType.Caption:=        cnConsts.cn_Main_PayerType[PLanguageIndex];
  PayerType.hint:=           cnConsts.cn_Main_PayerType[PLanguageIndex];
  FacultySpecialityGroup.Caption:=cnConsts.cn_Main_FaculSpecGroup[PLanguageIndex];
  FacultySpecialityGroup.Hint:=   cnConsts.cn_Main_FaculSpecGroup[PLanguageIndex];
  FormStudy.Caption:=        cnConsts.cn_Main_FormStudy[PLanguageIndex];
  FormStudy.Hint:=           cnConsts.cn_Main_FormStudy[PLanguageIndex];
  Faculty.Caption:=          cnConsts.cn_Main_Faculty[PLanguageIndex];
  Faculty.Hint:=             cnConsts.cn_Main_Faculty[PLanguageIndex];
  Nationality.Caption:=      cnConsts.cn_Main_Nationality[PLanguageIndex];
  Nationality.Hint:=         cnConsts.cn_Main_Nationality[PLanguageIndex];
  CategoryStudy.Caption:=    cnConsts.cn_Main_CategoryStudy[PLanguageIndex];
  CategoryStudy.Hint:=       cnConsts.cn_Main_CategoryStudy[PLanguageIndex];
  IniPeriodic.Caption:=      cnConsts.cn_Main_IniPeriodic[PLanguageIndex];
  IniPeriodic.Hint:=         cnConsts.cn_Main_IniPeriodic[PLanguageIndex];
  ContractsList.Caption :=   cnConsts.cn_sp_ContractsList[PLanguageIndex];
  ContractsList.Hint :=      cnConsts.cn_sp_ContractsList[PLanguageIndex];
  TypeDiss.Caption   :=      cnConsts.cn_sp_IniTypeDiss[PLanguageIndex];
  TypeDiss.Hint      :=      cnConsts.cn_sp_IniTypeDiss[PLanguageIndex];

  AboutBtn.Caption:=         cnConsts.cn_Main_AboutBtn_Caption[PLanguageIndex];
  AboutBtn.Hint:=            cnConsts.cn_Main_AboutBtn_Caption[PLanguageIndex];
  ExitBtn.Caption:=          cnConsts.cn_Main_ExitBtn_Caption[PLanguageIndex];
  ExitBtn.Hint:=             cnConsts.cn_Main_ExitBtn_Caption[PLanguageIndex];
  DB_Info_TextEdit.hint:=    cnConsts.cn_DBInfo_Tiltle[PLanguageIndex];
  ConnectionInfo_Button.hint:=  cnConsts.cn_ConnectionInfo[PLanguageIndex];
  Configuration.Caption:=     cnConsts.cn_Config[PLanguageIndex];
  Options.Caption:=           cnConsts.cn_Tunning[PLanguageIndex];
  Preyskurant_Button.Caption :=  cnConsts.cn_PreyskurantWork[PLanguageIndex];
  Preyskurant_Button.Hint :=  cnConsts.cn_PreyskurantWork[PLanguageIndex];
  
  pricebutton.Caption :=  cnConsts.cn_PreyskurantWork[PLanguageIndex];
  pricebutton.Hint :=  cnConsts.cn_PreyskurantWork[PLanguageIndex];

  Whats_New.Caption :=        cnConsts.cn_WhatsNew_Cap[PLanguageIndex];
  ReportsBtn.Caption :=       cnConsts.fr_Zvit[PLanguageIndex];
  ReportsBtn.Hint :=          cnConsts.fr_Zvit[PLanguageIndex];
  frPayBtn.Caption :=         cnConsts.fr_Pay[PLanguageIndex];
  frPayBtn.Hint :=            cnConsts.fr_Pay[PLanguageIndex];
  frStudBtn.Caption :=        cnConsts.fr_Stud[PLanguageIndex];
  frStudBtn.Hint :=           cnConsts.fr_Stud[PLanguageIndex];
  RolesBtn.Caption :=         cnConsts.cn_Main_SpRoles[PLanguageIndex];
  RolesBtn.Hint :=            cnConsts.cn_Main_SpRoles[PLanguageIndex];
  Service.Caption :=          cnConsts.cn_Service[PLanguageIndex];
  Service.Hint :=             cnConsts.cn_Service[PLanguageIndex];
  VC_Import.Caption :=        cnConsts.cn_VC_Import[PLanguageIndex];
  VC_Import.Hint :=           cnConsts.cn_VC_Import[PLanguageIndex];
  SpdbfBuffer.Caption :=      cnConsts.cn_VC_BufferCaption[PLanguageIndex];
  SpdbfBuffer.Hint :=         cnConsts.cn_VC_BufferCaption[PLanguageIndex];
  Actions.Caption :=          cnConsts.cn_Main_SpActions[PLanguageIndex];
  Actions.Hint :=             cnConsts.cn_Main_SpActions[PLanguageIndex];
  SysOptions.Caption :=       cnConsts.cn_SysOptions[PLanguageIndex];
  SysOptions.Hint :=          cnConsts.cn_SysOptions[PLanguageIndex];
  ToNextCursBtn.Caption :=    cnConsts.cn_TransferToNextCurs[PLanguageIndex];
  RZ_Postyp.Caption :=        cnConsts.cn_print_RZ_Postyp[PLanguageIndex];
  RZ_Postyp.Hint :=        cnConsts.cn_print_RZ_Postyp[PLanguageIndex];
  frReestrSvodPoOplate.Caption :=        cnConsts.frReestrSvodPoOplate[PLanguageIndex];
  frReestrSvodPoOplate.Hint    :=        cnConsts.frReestrSvodPoOplate[PLanguageIndex];
  SignatureBtn.Caption :=     cnConsts.cn_Main_SpSignature[PLanguageIndex];
  SignatureBtn.Hint    :=     cnConsts.cn_Main_SpSignature[PLanguageIndex];
  RahunokWork.Caption :=      cnConsts.cn_RahunokWork[PLanguageIndex];
  RahunokWork.Hint    :=      cnConsts.cn_RahunokWork[PLanguageIndex];
  SpSpecBtn.Caption :=        cnConsts.cn_Main_SpSpec[PLanguageIndex];
  SpSpecBtn.Hint :=           cnConsts.cn_Main_SpSpec[PLanguageIndex];
  SpDepartmentBtn.Caption :=  cnConsts.cn_Main_SpDepartment[PLanguageIndex];
  SpDepartmentBtn.Hint :=     cnConsts.cn_Main_SpDepartment[PLanguageIndex];
  DogStatusBtn.Caption:=      cnConsts.cn_Main_SpDogStatus[PLanguageIndex];
  DogStatusBtn.Hint:=         cnConsts.cn_Main_SpDogStatus[PLanguageIndex];
  frSplataIstochnikiBtn.Caption :=  cnConsts.frSplataIstochnikiBtn[PLanguageIndex];
  frPercentValueBtn    .Caption :=  cnConsts.frPercentValueBtn[PLanguageIndex];
  frLgotaAnalisBtn     .Caption :=  cnConsts.frLgotaAnalisBtn[PLanguageIndex];
  frSplataIstochnikiBtn.Hint :=  cnConsts.frSplataIstochnikiBtn[PLanguageIndex];
  frPercentValueBtn    .Hint :=  cnConsts.frPercentValueBtn[PLanguageIndex];
  frLgotaAnalisBtn     .Hint :=  cnConsts.frLgotaAnalisBtn[PLanguageIndex];
  SpPeopleBtn.Caption :=     cnConsts.cn_Main_SpPeople[PLanguageIndex];
  SpYurLizaBtn.Caption :=    cnConsts.cn_Main_SpYurLiza[PLanguageIndex];
  SpPeopleBtn.Hint :=        cnConsts.cn_Main_SpPeople[PLanguageIndex];
  SpYurLizaBtn.Hint :=       cnConsts.cn_Main_SpYurLiza[PLanguageIndex];
  SpRapStatus.Caption :=     cnConsts.cn_Main_SpRapStatus[PLanguageIndex];
  SpTypeDocum.Caption :=     cnConsts.cn_Main_SpTypeDocum[PLanguageIndex];
  btnCredit.Caption   :=     cnConsts.cn_Credit_Caption[PLanguageIndex];

  cn_Main_DawaVCImport.Caption :=    cnConsts.cn_Main_DawaVCImport[PLanguageIndex];
  cn_Main_DawaVCPrimary.Caption :=   cnConsts.cn_Main_DawaVCPrimary[PLanguageIndex];
  cn_Main_DawaVCLinks.Caption :=     cnConsts.cn_Main_DawaVCLinks[PLanguageIndex];
  cn_Main_DawaVCBuffer.Caption :=    cnConsts.cn_Main_DawaVCBuffer[PLanguageIndex];
  cn_Main_DawaVCImport.Hint :=    cnConsts.cn_Main_DawaVCImport[PLanguageIndex];
  cn_Main_DawaVCPrimary.Hint :=   cnConsts.cn_Main_DawaVCPrimary[PLanguageIndex];
  cn_Main_DawaVCLinks.Hint :=     cnConsts.cn_Main_DawaVCLinks[PLanguageIndex];
  cn_Main_DawaVCBuffer.Hint :=    cnConsts.cn_Main_DawaVCBuffer[PLanguageIndex];

  SvodNepostupSummBtn.Hint :=  cnConsts.frSvodNepostupSummBtn[PLanguageIndex];
  SvodNepostupSummBtn.Caption :=  cnConsts.frSvodNepostupSummBtn[PLanguageIndex];

  frSvodPoOtchislenimBtn.Hint :=  cnConsts.frSvodPoOtchislenim[PLanguageIndex];
  frSvodPoOtchislenimBtn.Caption :=  cnConsts.frSvodPoOtchislenim[PLanguageIndex];

  RaportOtchislBtn.Caption :=  cnConsts.cn_Main_RaportOtchisl[PLanguageIndex];
  RaportOtchislBtn.Hint :=     cnConsts.cn_Main_RaportOtchisl[PLanguageIndex];

  RaportVosstanovlBtn.Caption :=  cnConsts.cn_Main_RaportVotanovl[PLanguageIndex];
  RaportVosstanovlBtn.Hint :=  cnConsts.cn_Main_RaportVotanovl[PLanguageIndex];

  BtAdminUsers.Caption:= cnConsts.cn_User[PLanguageIndex];
  BtAdminUsers.Hint:= cnConsts.cn_User[PLanguageIndex];
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
   if  reg.OpenKey('\Software\Contracts\Options\ExitConfirm',False) then
   if reg.ReadString('NotConfirm') = '1' then IsConfirm :=true
      else
     IsConfirm :=false;
  finally
   reg.Free;
  end;
  DZAddTrayIcon(handle , 1, Application.Icon.Handle);

  is_admin:=true;
  If FibCheckPermission('/ROOT/Contracts/Cn_admin','Belong') <> 0
   then is_admin:=false;

  If not Is_Admin then
   Begin
    If fibCheckPermission('/ROOT/Contracts/Cn_Credit','Belong') <> 0
      then btnCredit.Enabled:=False;

    If fibCheckPermission('/ROOT/Contracts/Cn_Reports','Belong') <> 0
      then ReportsBtn.Enabled:=False;

    If fibCheckPermission('/ROOT/Contracts/Cn_Options','Belong') <> 0
      then
       Begin
         SysOptions.Enabled:=false;
       End;
   //*----------------------------service-------------------------------------*/
    
     If fibCheckPermission('/ROOT/Contracts/Cn_Service/cn_VC_Import','Belong') <> 0 then
      Begin
       VC_Import.Enabled            := false;
       SpdbfBuffer.Enabled          := false;
       cn_Main_DawaVCImport.Enabled := false;
      End;

     If fibCheckPermission('/ROOT/CS/CS_Menu_Service/CS_Menu_SynchEDBO','Belong') <> 0 then
      Begin
       check_link_edbo_fizButton.Enabled := false;
       BarButton_SynchEDBO.Enabled := false;
      end;

     If fibCheckPermission('/ROOT/Contracts/Cn_Service/cn_ToNextCurs','Belong') <> 0
      then ToNextCursBtn.Enabled := false;

   //*----------------------------price---------------------------------------*/
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

    If fibCheckPermission('/ROOT/Contracts/Cn_Sp','Belong') <> 0
      then
       Begin
         SpravBtn.Enabled:=false;
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
       End;
   End;
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
    begin
      if Application.MainForm.MDIChildren[i].Handle > 32 then
        Application.MainForm.MDIChildren[i].Free;
    end;
  if Main_DM.MainDM.Main_DB.Connected then Main_DM.MainDM.Main_DB.Close;
  DZRemoveTrayIcon(Handle, 1);
end;

procedure TMainForm.SplashTimerTimer(Sender: TObject);
var
  reg : TRegistry;
begin
  frmSplash.cxProgressBar1.Position := 100;
  frmSplash.close;
  SplashTimer.Enabled:=false;
  Timer1.Enabled :=false;
  ImageFon.Visible := true;

  reg:=TRegistry.Create;
  try
    reg.RootKey:=HKEY_CURRENT_USER;
    if  reg.OpenKey('\Software\Contracts\Options\Preved',False) then
    if reg.ReadString('NotPreved')= '1' then exit
    else
      if reg.ReadString('UseSys')= '1' then
        DZBalloonTrayIcon(Handle, 1, 3, FileUserInfo, cnConsts.cn_Welcome[PLanguageIndex] , bitInfo )
      else
        DZBalloonTrayIcon(Handle, 1, 3, reg.ReadString('Message'), ' ' , bitInfo )
    else
      DZBalloonTrayIcon(Handle, 1, 3, FileUserInfo, cnConsts.cn_Welcome[PLanguageIndex] , bitInfo )
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
    i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_ExitPromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
    if ((i = 7) or (i= 2)) then CanClose:=false;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  InitializaAdminSystem(Self, MainDM.Main_DB.Handle, 12, ID_USER, false);
  LoadSysData(MainDM.ReadTransaction);

  DB_Info_TextEdit.text:= MainForm.DB_PATH;
  Now_Date.Caption:= Now_Date.Caption+datetostr(Main_DM.MainDM.CURRENT_TIMESTAMP) + '   ';
  Now_Date.Hint:=formatdatetime('dddd, dd mmmm yyyy'+ cnConsts.cn_Year_Short[PLanguageIndex] ,Main_DM.MainDM.CURRENT_TIMESTAMP);
  StatusBar.Panels[4].Text:= AccessResult.Name_user;
  UserButton.Hint:= cnConsts.cn_UserInfo[PLanguageIndex] + #13 +
    cnConsts.cn_Login[PLanguageIndex] + AccessResult.Name_user + #13
    +
    cnConsts.cn_UserFio[PLanguageIndex] +  AccessResult.User_Fio;

  FileUserInfo:=
    cnConsts.cn_Login[PLanguageIndex] + AccessResult.Name_user + #13
    +
    cnConsts.cn_UserFio[PLanguageIndex] +  AccessResult.User_Fio+ #13+
    cnConsts.cn_FileVersionFull[PLanguageIndex]  + CurrentFileInfo+ '. '
    +
    cnConsts.cn_AssemblingDate[PLanguageIndex] +

  DateTimeToStr(FileDateToDateTime(FileAge(Application.ExeName)));

  RolesBtn.Enabled:=False;
  Actions.Enabled:=False;
  SignatureBtn.Enabled:=False;

  If is_admin then
  Begin
    RolesBtn.Enabled:=True;
    Actions.Enabled:=true;
    SignatureBtn.Enabled:=true;
    StatusBar.Panels[4].Text:= StatusBar.Panels[4].Text + ' (admin)';
  end;

  Timer_SynchEDBO.Enabled := True;

  MainDM.ReadTimestampDataSet.Close;
  MainDM.ReadTimestampDataSet.SQLs.SelectSQL.Text := 'select * from pub_sys_data';
  MainDM.ReadTimestampDataSet.Open;

  if MainDM.ReadTimestampDataSet['CN_USE_EDBO_FIZ_LIC'] <> null
   then CN_USE_EDBO_FIZ_LIC := MainDM.ReadTimestampDataSet['CN_USE_EDBO_FIZ_LIC']
   else CN_USE_EDBO_FIZ_LIC := 0;
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
    cnConsts.cn_ApplicationName[PLanguageIndex] + Application.Title+ #13
    +
    cnConsts.cn_ApplicationWay[PLanguageIndex] + '[ '+Application.ExeName+' ]'+ #13
    +
    cnConsts.cn_FileVersionFull[PLanguageIndex]  + CurrentFileInfo+ #13
    +
    cnConsts.cn_AssemblingDate[PLanguageIndex] + DateTimeToStr(FileDateToDateTime(FileAge(Application.ExeName)))+ #13
    +
    cnConsts.cn_DBWay[PLanguageIndex] +'[ '+DB_PATH+ ' ]'+ #13;

  cn_Common_Messages.cnShowMessage(cnConsts.cn_ConnectionInfo[PLanguageIndex], FileFullInfo, mtInformation, [mbOK]);
end;

procedure TMainForm.ReestrBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParamsAbiturient;
  cnParamsRecord: TcnParamsToAddContract;
begin
  // запуск справочника
  AParameter:= TcnSimpleParamsAbiturient.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.ID_User := AccessResult.ID_User;
  AParameter.User_Name := AccessResult.Name_user;

  AParameter.CN_USE_EDBO_FIZ_LIC := CN_USE_EDBO_FIZ_LIC; //какой справочник ЕБДО использовать(0) или наш(1)

  AParameter.Formstyle:=fsMDIChild;

  AParameter.WaitPakageOwner:=self;
  AParameter.cnParamsToPakage.Is_Admin:=is_admin;

  AParameter.cnParamsToAddContract := cnParamsRecord;

  RunFunctionFromPackage(AParameter, 'Contracts\cn_Contracts.bpl','ShowContracts');
  AParameter.Free;
end;

procedure TMainForm.FormDblClick(Sender: TObject);
begin
 ReestrBtnClick(sender);
end;

procedure TMainForm.NationalityClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  {Perchak8}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_National.bpl','ShowSPNational');
  AParameter.Free;
end;

procedure TMainForm.CategoryStudyClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  {Perchak9}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CategoryStudy.bpl','ShowSPCategoryStudy');
  AParameter.Free;
end;

procedure TMainForm.FormStudyClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  {Perchak7}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FormStud.bpl','ShowSPFormStud');
  AParameter.Free;
end;

procedure TMainForm.FacultySpecialityGroupClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
{  // проверка прав
  if not Is_Admin then
  if fibCheckPermission('/ROOT/Contracts/cn_sp_GroupsWork','Belong') <> 0 then
   begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;}

   //вызов справочника
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
end;

procedure TMainForm.IniPeriodicClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  {Perchak10}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ini_TypeStage.bpl','ShowIniTypeStage');
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
    cnConsts.cn_Login[PLanguageIndex]   + #13 + '  '+ AccessResult.Name_user + #13
    +
    cnConsts.cn_UserFio[PLanguageIndex] +#13 + '  '+   AccessResult.User_Fio + #13 +
    cnConsts.cn_Role[PLanguageIndex]+':' + #13;

  MainDM.ReadTimestampDataSet.Close;
  MainDM.ReadTimestampDataSet.SQLs.SelectSQL.clear;
  MainDM.ReadTimestampDataSet.SelectSQL.Text := 'select * from CN_GET_ROLE_BY_USER(' + inttostr(AccessResult.ID_User) + ')';
  MainDM.ReadTimestampDataSet.Open;
  MainDM.ReadTimestampDataSet.FetchAll;
  MainDM.ReadTimestampDataSet.First;
  for i:= 0 to MainDM.ReadTimestampDataSet.RecordCount -1 do
  begin
    UserInfo:=UserInfo + '  ' +
    '['+MainDM.ReadTimestampDataSet['NAME']+ ' - '
    +
    MainDM.ReadTimestampDataSet['FULL_NAME']+ ']' + #13;
    MainDM.ReadTimestampDataSet.Next;
  end;
  MainDM.ReadTimestampDataSet.Close;

  UserInfo:= UserInfo + cnConsts.cn_DotypSmetiTitle[PLanguageIndex]+ ':' + #13;

  if bool(is_admin) then
     UserInfo:=UserInfo + '  ' + cnConsts.cn_AllForAdmin[PLanguageIndex]
  else
  begin
    MainDM.ReadTimestampDataSet.SQLs.SelectSQL.clear;
    MainDM.ReadTimestampDataSet.SelectSQL.Text := 'select * from CN_GET_ALL_SMETS_BY_ROLES(' + inttostr(AccessResult.ID_User) + ')';
    MainDM.ReadTimestampDataSet.Open;
    MainDM.ReadTimestampDataSet.FetchAll;
    MainDM.ReadTimestampDataSet.First;
    for i:= 0 to MainDM.ReadTimestampDataSet.RecordCount -1 do
    begin
      UserInfo:=UserInfo + '  ' +
        inttostr(MainDM.ReadTimestampDataSet['SMETA_KOD'])+ ' - '
        +
        MainDM.ReadTimestampDataSet['SMETA_TITLE'] + #13;
        MainDM.ReadTimestampDataSet.Next;
    end;
    MainDM.ReadTimestampDataSet.Close;
  end;

  Screen.Cursor := crDefault;
  cn_Common_Messages.cnShowMessage(cnConsts.cn_UserInfo[PLanguageIndex], UserInfo, mtInformation, [mbOK]);
end;

procedure TMainForm.WindowsClick(Sender: TObject);
begin
  WindowsCloseAll.Enabled:=(Self.MDIChildCount>0);
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  frmSplash.cxProgressBar1.Position := frmSplash.cxProgressBar1.Position + 2;
end;

procedure TMainForm.ContractsListClick(Sender: TObject);
var
  AParameter:TcnSimpleParamsEx;
  ResOpl:Variant;
begin
  {Perchak18}
  // проверка прав
  if not Is_Admin then
  if fibCheckPermission('/ROOT/Contracts/cn_ContractsKassaBank','Belong') <> 0 then
   begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
   exit;
   end;

  // вызов справочника
  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  // AParameter.cnParamsToPakage.Summa := 1050;
  // AParameter.cnParamsToPakage.IsWithSumma:=true;
  AParameter.cnParamsToPakage.Summa := -1;
  AParameter.cnParamsToPakage.IsWithSumma:=false;
  AParameter.cnParamsToPakage.Note := 'основание оплаты здесь';
  AParameter.is_admin :=is_admin;
  ResOpl:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');
  AParameter.Free;
end;

procedure TMainForm.TypeLgotClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  {Perchak6}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ini_TypeLgots.bpl','ShowSPIniTypeLgot');
  AParameter.Free;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  ImageFon.Left :=  ClientWidth  - ImageFon.Width - 4;
  ImageFon.Top  :=  main_BarManager.Bars[0].FloatClientHeight;
end;

procedure TMainForm.OptionsClick(Sender: TObject);
var
  frmOptions: TfrmOptions;
  reg: TRegistry;
begin
  frmOptions := TfrmOptions.Create(self);
  frmOptions.Caption := cnConsts.cn_Tunning[PLanguageIndex];
  frmOptions.TabSheet_1.Caption := cnConsts.cn_Icons[PLanguageIndex];
  frmOptions.GroupBox.Caption := cnConsts.cn_CreateIcons[PLanguageIndex];
  frmOptions.OkButton.Caption := cnConsts.cn_Accept[PLanguageIndex];
  frmOptions.CancelButton.Caption := cnConsts.cn_Cancel[PLanguageIndex];
  frmOptions.Desctop_Check.Properties.Caption := cnConsts.cn_Desctop[PLanguageIndex];
  frmOptions.StartMenu_Check.Properties.Caption := cnConsts.cn_StartMenu[PLanguageIndex];
  frmOptions.Sheet2.Caption := cnConsts.cn_Interface[PLanguageIndex];
  frmOptions.NotExitConfirm_CheckBox.Properties.Caption := cnConsts.cn_NoExitConfirm[PLanguageIndex];
  frmOptions.Language.Caption := cnConsts.cn_Language[PLanguageIndex];
  frmOptions.Russian_Lang.Caption := cnConsts.cn_Rus_Lang[PLanguageIndex];
  frmOptions.Ukr_Lang.Caption := cnConsts.cn_Ukr_Lang[PLanguageIndex];
  frmOptions.NotExitConfirm_CheckBox.Checked:= IsConfirm;
  frmOptions.ToolTipTitle:=  cnConsts.cn_Baloon[PLanguageIndex];
  frmOptions.NotPrevedBaloon_CheckBox.Properties.Caption:=  cnConsts.cn_Preved[PLanguageIndex];
  frmOptions.Preved_Edit.Hint := cnConsts.cn_PrevedHint[PLanguageIndex];

  if PLanguageIndex = 2 then frmOptions.Russian_Lang.Checked :=True;
  if PLanguageIndex = 1 then frmOptions.Ukr_Lang.Checked :=True;

  reg:=TRegistry.Create;
  try
    reg.RootKey:=HKEY_CURRENT_USER;
    if  reg.OpenKey('\Software\Contracts\Options\Preved',False) then
      if reg.ReadString('NotPreved')= '1' then
      begin
        frmOptions.NotPrevedBaloon_CheckBox.Checked := True;
        frmOptions.Preved_Edit.Text := cnConsts.cn_PrevedSelf[PLanguageIndex];
      end
      else
      begin
        frmOptions.NotPrevedBaloon_CheckBox.Checked := False;
        if reg.ReadString('UseSys')= '0' then
          frmOptions.Preved_Edit.Text := reg.ReadString('Message')
        else
          frmOptions.Preved_Edit.Text := cnConsts.cn_PrevedSelf[PLanguageIndex];
      end
      else
        frmOptions.Preved_Edit.Text := cnConsts.cn_PrevedSelf[PLanguageIndex];
  finally
    reg.Free;
  end;

  if frmOptions.ShowModal = mrOk then
  begin
    reg := TRegistry.Create;
    try
      reg.RootKey:=HKEY_CURRENT_USER;
      if  reg.OpenKey('\Software\Contracts\Options\ExitConfirm',True) then
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
      if  reg.OpenKey('\Software\Contracts\Options\Preved',True) then
        if frmOptions.NotPrevedBaloon_CheckBox.Checked then
          reg.WriteString('NotPreved','1')
        else
        begin
          reg.WriteString('NotPreved','0');
          reg.WriteString('Message', frmOptions.Preved_Edit.Text );
          if  frmOptions.Preved_Edit.Text = '' then
            reg.WriteString('UseSys', '1')
          else
            reg.WriteString('UseSys', '0')
          end;
    finally
      reg.Free;
    end;

    reg := TRegistry.Create;
    try
      reg.RootKey:=HKEY_CURRENT_USER;
      if  reg.OpenKey('\Software\Contracts\Options\Language',True) then
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
  Load_cn_WhatsNew(Self);
end;

procedure TMainForm.TypeDissClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  {Perchak11}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_TypeDiss.bpl','ShowSPTypeDiss');
  AParameter.Free;
end;

procedure TMainForm.frStudBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  {// проверка прав
  if not Is_Admin then
  if fibCheckPermission('/ROOT/Contracts/cn_GlobalPrintForms','Belong') <> 0 then
   begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
   exit;
   end;}

  // вызов справочника
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsStud.bpl','ShowReportStud');
  AParameter.Free;
end;

procedure TMainForm.frPayBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
{  // проверка прав
  if not Is_Admin then
  if fibCheckPermission('/ROOT/Contracts/cn_GlobalPrintForms','Belong') <> 0 then
   begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
   exit;
   end;}

  // вызов справочника
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsPayDPK.bpl','ShowReportPay');
  AParameter.Free;
end;

procedure TMainForm.RolesBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  {Perchak22}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_Roles.bpl','ShowSPRoles');
  AParameter.Free;
 end;

procedure TMainForm.VC_ImportClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  //AParameter.Formstyle:=fsMDIChild;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ImportDBF.bpl','ShowImport');
  AParameter.Free;
end;

procedure TMainForm.SpdbfBufferClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_dbfBuffer.bpl','ShowDbfBuffer');
  AParameter.Free;
end;

procedure TMainForm.ActionsClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  {Perchak21}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_Actions.bpl','ShowSPActions');
  AParameter.Free;
end;

procedure TMainForm.RZ_PostypClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
{  // проверка прав
  if not Is_Admin then
  if fibCheckPermission('/ROOT/Contracts/cn_GlobalPrintForms','Belong') <> 0 then
  begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
  end;}

  // вызов справочника
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsDocProv.bpl','ShowReportDocProv');
  AParameter.Free;
end;

procedure TMainForm.SysOptionsClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_SysOptions.bpl','ShowSysOp');
  AParameter.Free;
end;


procedure TMainForm.SignatureBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  {Perchak20}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_Signature.bpl','ShowSPSignature');
  AParameter.Free;
end;

procedure TMainForm.ToNextCursBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_ToNextCurs.bpl','ShowToNextCurs');
  AParameter.Free;
end;

procedure TMainForm.frReestrSvodPoOplateClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
{  // проверка прав
  if not Is_Admin then
  if fibCheckPermission('/ROOT/Contracts/cn_GlobalPrintForms','Belong') <> 0 then
   begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
   exit;
   end;}

  // вызов справочника
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsAnalyz.bpl','ShowReportPayAnalyz');
  AParameter.Free;
end;

procedure TMainForm.RahunokWorkClick(Sender: TObject);
begin
  GetCnAccounts(self,Main_DM.MainDM.Main_DB.Handle,AccessResult.ID_User, AccessResult.Name_user, AccessResult.Password);
end;

procedure TMainForm.SpSpecBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  {Perchak4}
   //вызов справочника
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_Spec.bpl','ShowSPSpec');
  AParameter.Free;
end;

procedure TMainForm.SpDepartmentBtnClick(Sender: TObject);
var
  sp: TSprav;
begin
  // создать справочник
  sp :=  GetSprav('SpDepartment');
  if sp <> nil then
  begin
    // заполнить входные параметры
    with sp.Input do
    begin
      Append;
      FieldValues['DBHandle'] := Integer(Main_DM.MainDM.Main_DB.Handle);
      // модальный показ
      FieldValues['ShowStyle'] := 1;
      // единичная выборка
      FieldValues['Select'] := 1;
      FieldValues['AllowEdit'] := true;
      Post;
    end;
  end;
  // показать справочник и проанализировать результат (выбор одного подр.)
  sp.Show;
  if sp.Output = nil then
    ShowMessage('BUG: Output is NIL!!!');
  sp.Free;
end;

procedure TMainForm.frSplataIstochnikiBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsAnalyzSmeta.bpl','ShowReportPayAnalyzSmeta');
  AParameter.Free;
end;

procedure TMainForm.frPercentValueBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportPercentPay.bpl','ShowReportPercentPay');
  AParameter.Free;
end;

procedure TMainForm.frLgotaAnalisBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsLgot.bpl','ShowReportSumLgot');
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
            if UpperCase((Components[i] as TcxButton).Caption)= cnConsts.cn_Accept[PLanguageIndex] then
                (Components[i] as TcxButton).OnClick(self);
          end;
       end;
end;

procedure TMainForm.SvodNepostupSummBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsUnSum.bpl','ShowReportUnSum');
  AParameter.Free;
end;

procedure TMainForm.frSvodPoOtchislenimBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportDiss.bpl','ShowReportDiss');
  AParameter.Free;
end;

procedure TMainForm.DogStatusBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  {Perchak12}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_DogStatus.bpl','ShowSPDogStatus');
  AParameter.Free;
end;

procedure TMainForm.SpPeopleBtnClick(Sender: TObject);
begin
  AllPeopleUnit.GetManForASUP(Self, Main_DM.MainDM.Main_DB.Handle, False, True, -1) //наш справочник
  // else AllPeopleUnit.GetManFromEdbo(Self, Main_DM.MainDM.Main_DB.Handle, False, -1);     //справочник ЕБДО 3й параметр можно ли редактировать
end;

procedure TMainForm.SpYurLizaBtnClick(Sender: TObject);
var
  i, o : TSpravParams;
begin
  {Perchak2}
  i := TSpravParams.Create;
  o := TSpravParams.Create;
  i['DataBase']     := Integer(Main_DM.MainDM.Main_DB.Handle);
  i['FormStyle']    := fsNormal;
  i['bMultiSelect'] := false;
  i['id_session']   := -1;
  i['SelectMode']   := SelCustomer;
  LoadSprav('Customer\CustPackage.bpl', Self, i, o);
end;

procedure TMainForm.cn_Main_DawaVCPrimaryClick(Sender: TObject);
begin
  LoadPackage(ExtractFilepath(Application.ExeName)+'Import_vc_loader.bpl');
  ImportLoadMenedger.LoadImports(Self,1,Main_DM.MainDM.Main_DB);
end;

procedure TMainForm.SpRapStatusClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  {Perchak14}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_RaportStatus.bpl','ShowSPRapStatus');
  AParameter.Free;
end;

procedure TMainForm.SpTypeDocumClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  {Perchak15}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_TypeDocum.bpl','ShowSPTypeDocum');
  AParameter.Free;
 end;

procedure TMainForm.RaportOtchislBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParamsEx;
begin
  // запуск справочника
  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.TypeDoc := 1;  // отчисление
  RunFunctionFromPackage(AParameter, 'Contracts\cn_dt_Raport.bpl','ShowRaport');
  AParameter.Free;
end;

procedure TMainForm.RaportVosstanovlBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParamsEx;
begin
  // запуск справочника
  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.TypeDoc := 2;  // восстановление
  RunFunctionFromPackage(AParameter, 'Contracts\cn_dt_Raport.bpl','ShowRaport');
  AParameter.Free;
end;

procedure TMainForm.cn_Main_DawaVCLinksClick(Sender: TObject);
begin
  LoadPackage(ExtractFilepath(Application.ExeName)+'Import_vc_loader.bpl');
  ImportLoadMenedger.LoadImportConections(Self,1,Main_DM.MainDM.Main_DB);
end;

procedure TMainForm.cn_Main_DawaVCBufferClick(Sender: TObject);
begin
  LoadPackage(ExtractFilepath(Application.ExeName)+'Import_vc_loader.bpl');
  ImportLoadMenedger.LoadShowImports(Self,Main_DM.MainDM.Main_DB);
end;

procedure TMainForm.frVikonannya_BtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportPayAnalyzDPK.bpl','ShowReportPayAnalyz');
  AParameter.Free;
end;

procedure TMainForm.SpOrderTypesBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  {Perchak16}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_OrderTypes.bpl','ShowSPOrderTypes');
  AParameter.Free;
 end;

procedure TMainForm.NamesReportClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  {Perchak19}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_NamesReport.bpl','ShowSPNamesReport');
  AParameter.Free;
end;

procedure TMainForm.DogTypeBtnClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  {Perchak13}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_TypeDog.bpl','ShowSPTypeDog');
  AParameter.Free;
end;

procedure TMainForm.dxBarBtnSpisanieClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_spisanie.bpl','ShowDTSpisanie');
  AParameter.Free;
end;

procedure TMainForm.btnCreditClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_Credit.bpl','ShowCredit');
  AParameter.Free;
end;

procedure TMainForm.btnShowSPCreditStatusClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  {Perchak17}
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin :=is_admin;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CreditStatus.bpl','ShowSPCreditStatus');
  AParameter.Free;
end;

procedure TMainForm.BtAdminUsersClick(Sender: TObject);
begin
 if not is_admin then
  Begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
  end;
  
 AdminShowUsers(Self);
end;

procedure TMainForm.dxBarButtonPanelClick(Sender: TObject);
begin
  if dxBarButtonPanel.Down then
   MainMDIFormBar.Visible:=true
  else
   MainMDIFormBar.Visible:=false;
end;

procedure TMainForm.pricebuttonClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  // проверка прав
  if not Is_Admin then
  if fibCheckPermission('/ROOT/Contracts/Cn_Price','Belong') <> 0 then
   begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;

  //вызов справочника
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin := is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_prices_ex.bpl','ShowPrices');
  AParameter.Free;
end;

procedure TMainForm.dog_regClick(Sender: TObject);
var
  AParameter : TcnSimpleParamsEx;
begin
  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.ID_User:=ID_user;
  AParameter.WaitPakageOwner:= self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_reestr.bpl','ShowReg');
  AParameter.Free;
end;

procedure TMainForm.sp_calcClick(Sender: TObject);
var
  AParameter : TcnSimpleParamsEx;
begin
  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.ID_User:=ID_user;
  AParameter.WaitPakageOwner:= self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_Calc.bpl','ShowDtCalc');
  AParameter.Free;

end;

procedure TMainForm.Report_exportsClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle:=fsMDIChild;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsExpSer.bpl','ShowReportExpSer');
  AParameter.Free;
end;

procedure TMainForm.RpMailListClick(Sender: TObject);
var
  AParameter : TcnSimpleParams;
begin
  // вызов справочника
  AParameter                 := TcnSimpleParams.Create;
  AParameter.Owner           := self;
  AParameter.Db_Handle       := Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsMail.bpl','ShowReportsMail');
  AParameter.Free;
end;

procedure TMainForm.BarButton_SynchEDBOClick(Sender: TObject);
var
  AParameter : TcnSimpleParams;
begin
  // вызов справочника
  AParameter                 := TcnSimpleParams.Create;
  AParameter.Owner           := self;
  AParameter.Db_Handle       := Main_DM.MainDM.Main_DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin        := is_admin;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_SynchEDBO.bpl','ShowSynchEDBO');
  AParameter.Free;
end;

procedure TMainForm.Timer_SynchEDBOTimer(Sender: TObject);
{var
  DateTime_now, Next_time_synchEDBO : TDateTime;}
begin
  {MainDM.DataSet_synchEDBO.Close;
  MainDM.DataSet_synchEDBO.SQLs.SelectSQL.Text := 'SELECT * FROM CN_WEB_INI_NEXT_SYNCHEDBO';
  MainDM.DataSet_synchEDBO.Open;

  if MainDM.DataSet_synchEDBO['NEXT_DATETIME_SYNCH'] <> null
   then next_time_synchEDBO := MainDM.DataSet_synchEDBO['NEXT_DATETIME_SYNCH']
   else next_time_synchEDBO := StrToDate('01.01.1900');

  MainDM.DataSet_synchEDBO.Close;
  
  DateTime_now := now;
  if DateTime_now > next_time_synchEDBO then
   begin
    cn_Common_Funcs.SynchEDBO(Self, MainDM.Main_DB.Handle, 0);
    Timer_SynchEDBO.Enabled := false;
   End;}
end;

procedure TMainForm.check_link_edbo_fizButtonClick(Sender: TObject);
var
  i : Integer;
  cnWaitForm :TcnWaitForm;
begin
  i := cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], 'Ви дійсно бажаєте провести перевірку та встановити зв''язок фіз. осіб контрактних студентів?', mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  cnWaitForm  := TcnWaitForm.create(self);
  cnWaitForm.Show;

  AllPeopleUnit.GetContractManWithoutEdbo(Self, Main_DM.MainDM.Main_DB.Handle, false, -1, 0);

  cnWaitForm.Free;
end;

end.


