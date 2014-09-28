unit MainZarplataMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, AppStruClasses,
  MainZarplataDataModul,
  StdCtrls, dxBar, AccMGMT, unit_Access_Consts,
  cxGraphics, ImgList, dxDockControl,
  pFIBErrorHandler, cxControls, dxStatusBar,
  ZMessages, SysAdmin,
  Dates, PackageLoad, ZTypes, zProc, ComCtrls, dxBarExtItems, dxBarExtDBItems,
  MDIChildFormsBar, cxLookAndFeelPainters, cxButtons,
  UnitZarplataConsts, ActnList, DB, cxGridDBTableView, FIBQuery, pFIBQuery,
  FIBDatabase, pFIBDatabase, AppEvnts, fib, TuCommonLoader, uCommonSp, TuCommonTypes,
  ShellApi;

type
  TFZMainMenu = class(TForm)
    BarManager: TdxBarManager;
    AboutProgPunktMainMenu: TdxBarButton;
    AboutSubMainMenu: TdxBarSubItem;
    SystemPreverencesPunktMainMenu: TdxBarButton;
    ReturnPrevPeriodPunktMainMenu: TdxBarButton;
    ServiceSubMainMenu: TdxBarSubItem;
    CalendarSpPunktMainMenu: TdxBarButton;
    WorkerCategorySpPunktMainMenu: TdxBarButton;
    SmetaSpPunktMainMenu: TdxBarButton;
    DivisionSpPunktMainMenu: TdxBarButton;
    PrivilegeSpPunktMainMenu: TdxBarButton;
    VOutSpPunktMainMenu: TdxBarButton;
    SpSubMainMenu: TdxBarSubItem;
    WorkerDtPunktMainMenu: TdxBarButton;
    StudentDtPunktMainMenu: TdxBarButton;
    CurrentDtPunktMainMenu: TdxBarButton;
    DopMoneyPunktMainMenu: TdxBarButton;
    AlimentPunktMainMenu: TdxBarButton;
    AlwaysUderzhPunktMainMenu: TdxBarButton;
    SsudaPunktMainMenu: TdxBarButton;
    DataSubMainMenu: TdxBarSubItem;
    PrevPeriodDataPunktMainMenu: TdxBarButton;
    LostDataPunktMainMenu: TdxBarButton;
    UchetVedPunktMainMenu: TdxBarButton;
    VedCurrentMonthPunktMainMenu: TdxBarButton;
    InformationSubMainMenu: TdxBarSubItem;
    AvansPunktMainMenu: TdxBarButton;
    PromViplatiPunktMainMenu: TdxBarButton;
    RaschetPunktMainMenu: TdxBarButton;
    ZarplataPunktMainMenu: TdxBarButton;
    StipPunktMainMenu: TdxBarButton;
    VedRaschetPunktMainMenu: TdxBarButton;
    DataRaschetPunktMainMenu: TdxBarButton;
    OperationEndPunktMainMenu: TdxBarButton;
    WorkSubMainMenu: TdxBarSubItem;
    ExitPunktMainMenu: TdxBarButton;
    BarDockControl1: TdxBarDockControl;
    PeriodSetupItem: TdxBarButton;
    UchetVedSubInformSubMainMenu: TdxBarSubItem;
    ReestrVedPunktMainMenu: TdxBarButton;
    FilterVedPunktMainMenu: TdxBarButton;
    VoplSpravPunktMainMenu: TdxBarButton;
    PeoplePrivPunktMainMenu: TdxBarButton;
    TaxesNetsPunktMainMenu: TdxBarButton;
    RemontPunktMainMenu: TdxBarButton;
    PeoplePropPunktMainMenu: TdxBarButton;
    PeoplePunktMainMenu: TdxBarButton;
    ReCountPunktMainMenu: TdxBarButton;
    ReCountDataPunktMainMenu: TdxBarButton;
    SprSubsPunktMainMenu: TdxBarButton;
    PrintSubMenu: TdxBarSubItem;
    WindowSubMenu: TdxBarSubItem;
    CascadePunktMainMenu: TdxBarButton;
    TileGorPunktMainMenu: TdxBarButton;
    CloseAllWindowsPunktMainMenu: TdxBarButton;
    TileVerPunktMainMenu: TdxBarButton;
    MinAllPunktMainMenu: TdxBarButton;
    NormAllPunktMainMenu: TdxBarButton;
    SvodSubItem: TdxBarSubItem;
    SvodPunktMainMenu: TdxBarButton;
    OrdersReestrItem: TdxBarButton;
    NonSpisokDtPunktMainMenu: TdxBarButton;
    Images: TImageList;
    ProtFSSBtn: TdxBarButton;
    ViewUsers: TdxBarButton;
    ViewErrors: TdxBarButton;
    f_1dfBtn: TdxBarButton;
    InvalidPunktMainMenu: TdxBarButton;
    InfokomImportItem: TdxBarButton;
    dxStatusBar: TdxStatusBar;
    dxBarButton1: TdxBarButton;
    VidoplSystems: TdxBarButton;
    PersonificationBtn: TdxBarButton;
    WhatsNewBtn: TdxBarButton;
    BarStaticFirm: TdxBarStatic;
    NalogFormaItem: TdxBarButton;
    NalogForma: TdxBarSubItem;
    NalogSpravkaItem: TdxBarButton;
    NalogReestrItem: TdxBarButton;
    ConstItem: TdxBarButton;
    AlgTuneBtn: TdxBarButton;
    dxBarButton2: TdxBarButton;
    RmovingExcPunktMainMenu: TdxBarButton;
    ActionList1: TActionList;
    Action1: TAction;
    WorkReasonBtn: TdxBarButton;
    Action2: TAction;
    BankCardContinue: TdxBarButton;
    TestBtn: TdxBarButton;
    Action3: TAction;
    ImportBtn: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    AccessBtn: TdxBarButton;
    dxBarButton3: TdxBarButton;
    ZarplataRollback: TdxBarButton;
    ApplicationEvents1: TApplicationEvents;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton9: TdxBarButton;
    InitUsersAuthMenu: TdxBarButton;
    dxb_UpOkladDate: TdxBarButton;
    dxBarButton10: TdxBarButton;
    ButtonSprDoh2: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    ImportMenu: TdxBarButton;
    dxBarButton166: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    ExportBtn: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton20: TdxBarButton;
    dxBarButton21: TdxBarButton;
    dxBarButton22: TdxBarButton;
    dxBarButton23: TdxBarButton;
    dxBarButton24: TdxBarButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton25: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarButton26: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure ExitPunktMainMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PrivilegeSpPunktMainMenuClick(Sender: TObject);
    procedure VOutSpPunktMainMenuClick(Sender: TObject);
    procedure WorkerDtPunktMainMenuClick(Sender: TObject);
    procedure SystemPreverencesPunktMainMenuClick(Sender: TObject);
    procedure AlimentPunktMainMenuClick(Sender: TObject);
    procedure ReestrVedPunktMainMenuClick(Sender: TObject);
    procedure DopMoneyPunktMainMenuClick(Sender: TObject);
    procedure DivisionSpPunktMainMenuClick(Sender: TObject);
    procedure AlwaysUderzhPunktMainMenuClick(Sender: TObject);
    procedure VoplSpravPunktMainMenuClick(Sender: TObject);
    procedure ViewVoPunktMainMenuClick(Sender: TObject);
    procedure CurrentDtPunktMainMenuClick(Sender: TObject);
    procedure VedCurrentMonthPunktMainMenuClick(Sender: TObject);
    procedure PeoplePrivPunktMainMenuClick(Sender: TObject);
    procedure TaxesNetsPunktMainMenuClick(Sender: TObject);
    procedure RemontPunktMainMenuClick(Sender: TObject);
    procedure PrevPeriodDataPunktMainMenuClick(Sender: TObject);
    procedure FilterVedPunktMainMenuClick(Sender: TObject);
    procedure ZarplataPunktMainMenuClick(Sender: TObject);
    procedure VedRaschetPunktMainMenuClick(Sender: TObject);
    procedure DataRaschetPunktMainMenuClick(Sender: TObject);
    procedure OperationEndPunktMainMenuClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PeoplePropPunktMainMenuClick(Sender: TObject);
    procedure PeoplePunktMainMenuClick(Sender: TObject);
    procedure ReCountPunktMainMenuClick(Sender: TObject);
    procedure ReCountDataPunktMainMenuClick(Sender: TObject);
    procedure SprSubsPunktMainMenuClick(Sender: TObject);
    procedure CascadePunktMainMenuClick(Sender: TObject);
    procedure WindowSubMenuPopup(Sender: TObject);
    procedure TileGorPunktMainMenuClick(Sender: TObject);
    procedure TileVerPunktMainMenuClick(Sender: TObject);
    procedure CloseAllWindowsPunktMainMenuClick(Sender: TObject);
    procedure MinAllPunktMainMenuClick(Sender: TObject);
    procedure NormAllPunktMainMenuClick(Sender: TObject);
    procedure BySchPunktMainMenuClick(Sender: TObject);
    procedure SvodPunktMainMenuClick(Sender: TObject);
    procedure OrdersReestrItemClick(Sender: TObject);
    procedure NonSpisokDtPunktMainMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AboutProgPunktMainMenuClick(Sender: TObject);
    procedure ProtFSSBtnClick(Sender: TObject);
    procedure dxStatusBar2Resize(Sender: TObject);
    procedure ViewUsersClick(Sender: TObject);
    procedure ViewErrorsClick(Sender: TObject);
    procedure f_1dfBtnClick(Sender: TObject);
    procedure InvalidPunktMainMenuClick(Sender: TObject);
    procedure InfokomImportItemClick(Sender: TObject);
    procedure WorkSubMainMenuPopup(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure VidoplSystemsClick(Sender: TObject);
    procedure PersonificationBtnClick(Sender: TObject);
    procedure WhatsNewBtnClick(Sender: TObject);
    procedure NalogSpravkaItemClick(Sender: TObject);
    procedure NalogReestrItemClick(Sender: TObject);
    procedure ConstItemClick(Sender: TObject);
    procedure AlgTuneBtnClick(Sender: TObject);
    procedure RaschetPunktMainMenuClick(Sender: TObject);
    procedure LostDataPunktMainMenuClick(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure RmovingExcPunktMainMenuClick(Sender: TObject);
    procedure AvansPunktMainMenuClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure WorkReasonBtnClick(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure BankCardContinueClick(Sender: TObject);
    procedure TestBtnClick(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure ImportBtnClick(Sender: TObject);
    procedure SsudaPunktMainMenuClick(Sender: TObject);
    procedure PromViplatiPunktMainMenuClick(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure AccessBtnClick(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure ZarplataRollbackClick(Sender: TObject);
    procedure ServiceSubMainMenuPopup(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure InitUsersAuthMenuClick(Sender: TObject);
    procedure dxb_UpOkladDateClick(Sender: TObject);
    procedure ButtonSprDoh2Click(Sender: TObject);
    procedure dxBarButton11Click(Sender: TObject);
    procedure dxBarButton12Click(Sender: TObject);
    procedure dxBarButton13Click(Sender: TObject);
    procedure dxBarButton14Click(Sender: TObject);
    procedure dxBarButton15Click(Sender: TObject);
    procedure ImportMenuClick(Sender: TObject);
    procedure dxBarButton17Click(Sender: TObject);
    procedure ExportBtnClick(Sender: TObject);
    procedure dxBarButton19Click(Sender: TObject);
    procedure dxBarButton20Click(Sender: TObject);
    procedure dxBarButton22Click(Sender: TObject);
    procedure dxBarButton24Click(Sender: TObject);
    procedure dxBarButton25Click(Sender: TObject);
    procedure dxBarButton16Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
  private
    Is_Univer: variant;
    use_zemail:Variant;
    pNumPredpr : integer;

    PC, PCzPers2010, PSmAss, PZEmail : TFMASAppModule;
  public
    login, password : string;
  end;

var
  FZMainMenu: TFZMainMenu;

implementation

{$R *.dfm}

procedure TFZMainMenu.ExitPunktMainMenuClick(Sender: TObject);
begin
Close;
end;

procedure TFZMainMenu.FormCreate(Sender: TObject);
 var   T: TzMDITool;
begin
    BankCardContinue.Caption                  := GetConst('CardBankCont',tcForm);
    WorkerDtPunktMainMenu.Caption             := GetConst('Workers',tcForm);

    T:=TzMDITool.Create(BarManager);
    pNumPredpr                                := StrToInt(VarToStrDef(ValueFieldZSetup(ZDataModule.DBZarplata.Handle,'NUM_PREDPR'),'0'));

    with TFMASAppModuleCreator.Create do
    begin
        PCzPers2010:= CreateFMASModule(ExtractFilePath(Application.ExeName) + 'Zarplata\', 'Zpersonification2010');
        if (PCzPers2010=nil)
        then MessageBox(self.Handle, 'Помилка при роботі з модулем персоніфікація 2010', 'Увага!', MB_OK or MB_ICONWARNING);

        PC := CreateFMASModule(ExtractFilePath(Application.ExeName) + 'Zarplata\', 'nachreport');
        if (PC = nil)
        then MessageBox(self.Handle, 'Помилка при роботі з модулем nachreport.bpl','Увага!', MB_OK or MB_ICONWARNING);

        PSmAss:= CreateFMASModule(ExtractFilePath(Application.ExeName) + 'Zarplata\', 'ZSmAss');
        if (PC = nil)
        then MessageBox(self.Handle, 'Помилка при роботі з модулем ZSmAss.bpl','Увага!', MB_OK or MB_ICONWARNING);

        PZEmail:= CreateFMASModule(ExtractFilePath(Application.ExeName) + 'Zarplata\', 'ZEmail');
        if (PC = nil)
        then MessageBox(self.Handle, 'Помилка при роботі з модулем ZEmail.bpl','Увага!', MB_OK or MB_ICONWARNING);
    end;
end;

procedure TFZMainMenu.PrivilegeSpPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Sprav/Z_Menu_LGOT','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Sprav','Belong')=0)
     then begin //yes
               LoadPrivileges(self,ZDataModule.DBZarplata.Handle,zfsChild);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.VOutSpPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Sprav/Z_Menu_BANK','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Sprav','Belong')=0)
     then begin //yes
               LoadViplata(self,ZDataModule.DBZarplata.Handle,zfsChild);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.WorkerDtPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_WORKERS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0)
     then begin //yes
               if (Is_Univer='T')
               Then LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,'Zarplata\SotrData.bpl','View_SotrData')
               else LoadSotrList(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.SystemPreverencesPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service/Z_Menu_PROP','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service','Belong')=0)
     then begin //yes
               LoadSetup(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.AlimentPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_VLISTS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0)
     then begin //yes
               LoadAlimony(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.ReestrVedPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Info/Z_Menu_REESTR_S','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Info','Belong')=0)
     then begin //yes
               LoadReeVed(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.DopMoneyPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_DOP_NACH','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0)
     then begin //yes
               LoadDopNach(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.DivisionSpPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Sprav/Z_Menu_DEPS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Sprav','Belong')=0)
     then begin //yes
               LoadDepartment(self,ZDataModule.DBZarplata.Handle, zfsChild);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.AlwaysUderzhPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_UTR','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0)
     then begin //yes
               LoadDedConst(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.VoplSpravPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Sprav/Z_Menu_VIDO','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Sprav','Belong')=0)
     then begin //yes
               LoadVidOpl(self,ZDataModule.DBZarplata.Handle,zfsChild,0,ValueFieldZSetup(ZDataModule.DBZarplata.Handle,'Z_ID_SYSTEM'));
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.ViewVoPunktMainMenuClick(Sender: TObject);
begin
     LoadVOplFilter(self,ZDataModule.DBZarplata.Handle,zfsChild);
end;

procedure TFZMainMenu.CurrentDtPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_CURRENT','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0)
     then begin //yes
               LoadCurrent(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.VedCurrentMonthPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Info/Z_Menu_SHEETS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Info','Belong')=0)
     then begin //yes
               LoadVedView(self,ZDataModule.DBZarplata.Handle,uvtvsCurrentKodSetup);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.PeoplePrivPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_LGOTA','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0)
     then begin //yes
               LoadPeoplePriv(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.TaxesNetsPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service/Z_Menu_PERCENTS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service','Belong')=0)
     then begin //yes
               LoadTaxes(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.RemontPunktMainMenuClick(Sender: TObject);
begin
     LoadRemont(self,ZDataModule.DBZarplata.Handle);
end;

procedure TFZMainMenu.PrevPeriodDataPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Info/Z_Menu_OLD_VALUES','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Info','Belong')=0)
     then begin //yes
               LoadDateAcc(self,ZDataModule.DBZarplata.Handle,ztdSaved);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.FilterVedPunktMainMenuClick(Sender: TObject);
begin
     LoadVedView(self,ZDataModule.DBZarplata.Handle,uvtvsWithFilter);
end;

procedure TFZMainMenu.ZarplataPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work/Z_Menu_ZARPLATA','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work','Belong')=0)
     then begin //yes
               if Is_Univer='T'
               then  LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle,'Zarplata\FullCount.bpl', 'FormShow')
               else  LoadPaymentCountNew(Self,ZDataModule.DBZarplata.Handle,1);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.VedRaschetPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work/Z_Menu_RSHEETS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work','Belong')=0)
     then begin //yes
               LoadVedView(self,ZDataModule.DBZarplata.Handle,uvtvsNotSaved);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);     
end;

procedure TFZMainMenu.DataRaschetPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work/Z_Menu_RAS_VALS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work','Belong')=0)
     then begin //yes
               LoadDateAcc(self,ZDataModule.DBZarplata.Handle,ztdNotSaved);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.OperationEndPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work/Z_Menu_END_OP','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work','Belong')=0)
     then begin //yes
               LoadOperationEnd(Self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);     
end;

procedure TFZMainMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if ZShowMessage(FZMainMenu_ExitAnswer_Caption,FZMainMenu_ExitAnswer_Text,mtConfirmation,[mbYes,mbNo])=mrYes
     then begin
               FinalizeAdminSystem;
               CloseAllWindowsPunktMainMenuClick(Sender);
               if assigned(PC) then PC.Free;
               if assigned(PCzPers2010) then PCzPers2010.Free;
               Action:=caFree;
     end
     else Action:=caNone;
end;

procedure TFZMainMenu.PeoplePropPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_PROPS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0)
     then begin //yes
               LoadPeopleProp(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);     
end;

procedure TFZMainMenu.PeoplePunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Sprav/Z_Menu_FIZL','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Sprav','Belong')=0)
     then begin //yes
               LoadSpAllPeople(Self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.ReCountPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work/Z_Menu_PERE','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work','Belong')=0)
     then begin //yes
               LoadReCountList(Self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.ReCountDataPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work/Z_Menu_PERE_VALS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work','Belong')=0)
     then begin //yes
               LoadReCountData(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.SprSubsPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_DOXOD','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
               PrintSprSubs(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.CascadePunktMainMenuClick(Sender: TObject);
begin
     Application.MainForm.Cascade;
end;

procedure TFZMainMenu.WindowSubMenuPopup(Sender: TObject);
begin
      CascadePunktMainMenu.Enabled := Application.MainForm.MDIChildCount>0;
      TileGorPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>1;
      TileVerPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>1;
      CloseAllWindowsPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>0;
      MinAllPunktMainMenu.Enabled  := Application.MainForm.MDIChildCount>0;
      NormAllPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>0;
end;

procedure TFZMainMenu.TileGorPunktMainMenuClick(Sender: TObject);
begin
     Application.MainForm.TileMode:=tbHorizontal;
     Application.MainForm.Tile;
end;

procedure TFZMainMenu.TileVerPunktMainMenuClick(Sender: TObject);
begin
     Application.MainForm.TileMode:=tbVertical;
     Application.MainForm.Tile;
end;

procedure TFZMainMenu.CloseAllWindowsPunktMainMenuClick(Sender: TObject);
var i:integer;
begin
     for i:=0 to Application.MainForm.MDIChildCount-1 do
     Application.MainForm.MDIChildren[i].Close;
end;

procedure TFZMainMenu.MinAllPunktMainMenuClick(Sender: TObject);
var i:integer;
begin
    for i:=Application.MainForm.MDIChildCount-1 downto 0 do
    Application.MainForm.MDIChildren[i].WindowState:=wsMinimized;
end;

procedure TFZMainMenu.NormAllPunktMainMenuClick(Sender: TObject);
var i:integer;
begin
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    Application.MainForm.MDIChildren[i].WindowState:=wsNormal;
end;

procedure TFZMainMenu.BySchPunktMainMenuClick(Sender: TObject);
begin
     LoadSvodOptions(self,ZDataModule.DBZarplata.Handle);
end;

procedure TFZMainMenu.SvodPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_SVODS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
               LoadSvodOptions(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.OrdersReestrItemClick(Sender: TObject);
begin
     if Is_Univer='T'
     then LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle,'Zarplata\Orders.bpl','View_Orders')
     else LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle,'Zarplata\OrdersReestr.bpl','ShowOrdersReestr');
end;

procedure TFZMainMenu.NonSpisokDtPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_NON_SPISOK','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0)
     then begin //yes
               LoadNonSpisok(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.FormShow(Sender: TObject);
var
 p : TzMDITool;
 CurrKod:Integer;
begin
 Is_univer := ValueFieldZSetup(ZDataModule.DBZarplata.Handle,'IS_UNIVER');
 use_zemail:= ValueFieldZSetup(ZDataModule.DBZarplata.Handle,'USE_ZEMAIL');

 if use_zemail<>NULL
 then begin
          if use_zemail=1
          then begin
                    dxBarButton15.Visible := ivAlways;

                    if not(fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Info/Z_Menu_EMAIL','Belong')=0)
                    then dxBarButton15.Visible := ivNever
                    else dxBarButton15.Visible := ivAlways;;
          end
          else begin
                    dxBarButton15.Visible := ivNever;
          end;
 end
 else begin
           dxBarButton15.Visible := ivNever;
 end;


 InitializaAdminSystem(Self, ZDataModule.DBZarplata.Handle, 999 , AccMGMT.GetUserId,False);

 //p := TzMDITool.Create(WindowSubMenu);

 Caption := Caption + ' '+VarToStrDef(GetNameFirm(ZDataModule.DBZarplata.Handle,'NAME_SHORT'),'');
 CurrKod := CurrentKodSetup(ZDataModule.DBZarplata.Handle);
 BarStaticFirm.Caption := KodSetupToPeriod(CurrKod,4);

 dxStatusBar.Panels[1].Text:=AccMGMT.fibGetCurrentDBPath;
 dxStatusBar.Panels[2].Text:= AccMGMT.GetUserFIO;
 dxStatusBar.Panels[3].Text:=DateToStr(Date);

 //Настройка разграничения пунктов меню между версиями ПО
 if (Is_Univer='T')
 then begin
           //Не показывать в ВУЗовской версии
           RmovingExcPunktMainMenu.Visible:=TdxBarItemVisible(False);
           WorkReasonBtn.Visible :=ivAlways;
           RemontPunktMainMenu.Visible := TdxBarItemVisible(False);

           //Не используются в ВУЗовской версии
           OrdersReestrItem.Visible:=TdxBarItemVisible(False);
           TestBtn.Visible:=TdxBarItemVisible(False);
           ReturnPrevPeriodPunktMainMenu.Visible:=TdxBarItemVisible(False);
 end
 else begin
           //Показывать в не ВУЗОВской версии в зависимости от настроек
           RmovingExcPunktMainMenu.Visible:=ifThen((VarToStrDef(ValueFieldZSetup(ZDataModule.DBZarplata.Handle,'SHOW_RMOVING_EXC'),'NULL')='T'),ivAlways,ivNever);


           //Показывать в не ВУЗОВской версии
           RemontPunktMainMenu.Visible := TdxBarItemVisible(true);
           dxBarButton7.Visible := TdxBarItemVisible(false);

           RemontPunktMainMenu.Visible := ivAlways;
           WorkReasonBtn.Visible :=ivAlways;
 end;

 VidoplSystems.Visible := ifThen(fibCheckPermission(cAccZMainMenuVidOpl,cBelong)=0,ivAlways,ivNever);
 ViewErrors.Visible := ifThen(fibCheckPermission(cAccZMainMenuViewErrors,cBelong)=0,ivAlways,ivNever);
 ViewUsers.Visible := ifThen(fibCheckPermission(cAccZMainMenuViewUsers,cBelong)=0,ivAlways,ivNever);
 ImportBtn.Visible := ivAlways;   {ifThen(fibCheckPermission(cAccZMainMenuViewImport,cBelong)=0,ivAlways,ivNever)};
 ReestrVedPunktMainMenu.Enabled := fibCheckPermission(cUVReeVed,cBelong)=0;

 if  (AccMGMT.GetUserId = 458)
 or  (AccMGMT.GetUserId = 452)
 then begin
           dxBarButton9.Visible := ivAlways;
 end
 else begin
           dxBarButton9.Visible := ivNever;
 end;
end;

procedure TFZMainMenu.AboutProgPunktMainMenuClick(Sender: TObject);
begin
LoadAuthors(self);
end;

procedure TFZMainMenu.ProtFSSBtnClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Info/Z_Menu_REESTR_L','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Info','Belong')=0)
     then begin //yes
               LoadProtFSS(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.dxStatusBar2Resize(Sender: TObject);
begin
 dxStatusBar.Panels[1].Width:=Round(dxStatusBar.Width/3);;
 dxStatusBar.Panels[2].Width:=Round(dxStatusBar.Width/5);
 dxStatusBar.Panels[3].Width:=Round(dxStatusBar.Width/10);
 dxStatusBar.Panels[4].Width:=Round(dxStatusBar.Width/10);
 dxStatusBar.Panels[0].Width:=dxStatusBar.Width-dxStatusBar.Panels[1].Width-dxStatusBar.Panels[2].Width-dxStatusBar.Panels[3].Width-dxStatusBar.Panels[4].Width-10;
end;

procedure TFZMainMenu.ViewUsersClick(Sender: TObject);
begin
AdminShowUsers(Self);
end;

procedure TFZMainMenu.ViewErrorsClick(Sender: TObject);
begin
AdminShowErrors(Self);
end;

procedure TFZMainMenu.f_1dfBtnClick(Sender: TObject);
var Param : string;
begin
    if((pNumPredpr=2) or (pNumPredpr=5)) then
    begin
        param := login+' '+password;
        ShellApi.ShellExecute(Self.Handle, 'open',PAnsiChar(ExtractFilePath(Application.ExeName)+'Personal_income.exe'),PAnsiChar(Param) , nil, SW_SHOW);
    end else
    begin
        if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_1DF','Belong')=0)
        or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
        then
        begin //yes
            LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle,'Zarplata\f1dfm.bpl','View_F1df')
        end
        else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
    end;
end;

procedure TFZMainMenu.InvalidPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_INVALID','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0)
     then begin //yes
               LoadInvalid(Self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.InfokomImportItemClick(Sender: TObject);
begin
     LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle,'Zarplata\Infokom.bpl', 'ShowInfokomImport');
end;

procedure TFZMainMenu.WorkSubMainMenuPopup(Sender: TObject);
var Kod_Action:integer;
    Is_Finished:boolean;
    Name_Action:string;
begin
      testBtn.Visible := ifThen(VarIsNull(ValueFieldZSetup(ZDataModule.DBZarplata.Handle,'ID_ORDER_LEVEL')),ivNever,ivAlways);
      Kod_action:=0;
      Is_Finished:=False;
      Name_Action:=CurrentAction(ZDataModule.DBZarplata.Handle,Kod_Action,Is_Finished);

      if (Kod_Action<>0)
      then begin
                AvansPunktMainMenu.Enabled        := False;
                PromViplatiPunktMainMenu.Enabled  := False;
                RaschetPunktMainMenu.Enabled      := False;
                ZarplataPunktMainMenu.Enabled     := False;
                ReCountPunktMainMenu.Enabled      := False;
                VedRaschetPunktMainMenu.Enabled   := False;
                DataRaschetPunktMainMenu.Enabled  := False;
                ReCountDataPunktMainMenu.Enabled  := False;
                OperationEndPunktMainMenu.Enabled := False;
                ZarplataRollback.Enabled          := False;

                if Is_Finished
                then begin
                          OperationEndPunktMainMenu.Enabled := True;
                          case Kod_Action of
                          1,2: begin
                                    VedRaschetPunktMainMenu.Enabled  := True;
                                    ReCountDataPunktMainMenu.Enabled := True;
                                    DataRaschetPunktMainMenu.Enabled := True;
                               end;
                          3:   begin
                                    ReCountDataPunktMainMenu.Enabled := True;
                                    DataRaschetPunktMainMenu.Enabled := True;
                               end;
                         7:    begin
                                    AvansPunktMainMenu.Enabled       := True;
                                    VedRaschetPunktMainMenu.Enabled  := True;
                                    DataRaschetPunktMainMenu.Enabled := True;
                               end;
                         8:    begin
                                    PromViplatiPunktMainMenu.Enabled := True;
                                    VedRaschetPunktMainMenu.Enabled  := True;
                                    DataRaschetPunktMainMenu.Enabled := True;
                               end;
                         end;
                end;
       end
       else begin
                  AvansPunktMainMenu.Enabled       := True;
                  PromViplatiPunktMainMenu.Enabled := True;
                  RaschetPunktMainMenu.Enabled     := True;
                  ZarplataPunktMainMenu.Enabled    := True;
                  ReCountPunktMainMenu.Enabled     := True;
                  VedRaschetPunktMainMenu.Enabled  := True;
                  DataRaschetPunktMainMenu.Enabled := True;
                  ReCountDataPunktMainMenu.Enabled := True;
                  OperationEndPunktMainMenu.Enabled:= True;
                  ZarplataRollback.Enabled         := True;
       end;
end;

procedure TFZMainMenu.dxBarButton1Click(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_FSVODS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
               LoadReeDepVO(self,ZDataModule.DBZarplata.Handle,true);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.VidoplSystemsClick(Sender: TObject);
begin
LoadVidoplSystems(Self,ZDataModule.DBZarplata.Handle);
end;

procedure TFZMainMenu.PersonificationBtnClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_PERSON','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
               LoadPersonification(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.WhatsNewBtnClick(Sender: TObject);
begin
if ValueFieldZSetup(ZDataModule.DBZarplata.Handle,'IS_UNIVER')='T'
   then LoadWhatsNew(self,'ZP_Whats_New_VUZ.txt')
   else LoadWhatsNew(self,'ZP_Whats_New.txt')
end;

procedure TFZMainMenu.NalogSpravkaItemClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_F3','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
               LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle, 'Zarplata\NalogReCountForma.bpl', 'ShowNalogReCountForm');
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.NalogReestrItemClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_F3','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
               LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle,
              'Zarplata\NalogReCountReestr.bpl', 'ShowNalogReCountReestr');
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.ConstItemClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service/Z_Menu_CONSTS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service','Belong')=0)
     then begin //yes
       LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle,'Zarplata\ConstSumsSetup.bpl', 'View_ConstSumsSetup');
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.AlgTuneBtnClick(Sender: TObject);
begin
  LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle,
    'Zarplata\ZAlgorithms.bpl', 'ShowAlgMainForm');
end;

procedure TFZMainMenu.RaschetPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work/Z_Menu_TERMIN','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work','Belong')=0)
     then begin //yes
               LoadPaymentCountNew(Self,ZDataModule.DBZarplata.Handle,2);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.LostDataPunktMainMenuClick(Sender: TObject);
begin
     LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle,'Zarplata\DelCard.bpl', 'View_FZDelCard');
end;

procedure TFZMainMenu.dxBarButton2Click(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service/Z_Menu_PERCENTS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service','Belong')=0)
     then begin //yes
               LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle,
               'Zarplata\ParSet.bpl', 'View_FZ_ParSetup');
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.RmovingExcPunktMainMenuClick(Sender: TObject);
begin
     LoadRMovingExc(Self,ZDataModule.DBZarplata.Handle,0);
end;

procedure TFZMainMenu.AvansPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work/Z_Menu_AVANS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work','Belong')=0)
     then begin //yes
               LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle,'Zarplata\AvansCount.bpl', 'FormShow');
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.Action1Execute(Sender: TObject);
var i,j:integer;
    text:string;
    DSet:TDataSet;
begin
  with Screen.ActiveForm do
    for i:=0 to ComponentCount-1 do
      begin
        if (Components[i].InheritsFrom(TcxGridDBTableView)) then
          begin
            DSet := (Components[i] as TcxGridDBTableView).DataController.DataSource.DataSet;
            if (DSet<>nil) and (DSet.Active) then
              begin
                text := text+#13+DSet.Name+#13;
                for j:=0 to DSet.Fields.Count-1 do
                    text:=text+DSet.Fields[j].FieldName+'='+VarToStrDef(DSet.Fields[j].Value,'NULL')+'     ';
              end;
          end;
      end;
  ShowMessage(text);
end;

procedure TFZMainMenu.WorkReasonBtnClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service/Z_Menu_WORK_DOG','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service','Belong')=0)
     then begin //yes
               LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,'Zarplata\WorkReason.bpl','ViewForm');
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.Action2Execute(Sender: TObject);
var Query:TpFIBQuery;
    Transaction:TpFIBTransaction;
begin

  Query := TpFIBQuery.Create(self);
  Transaction := TpFIBTransaction.Create(self);

  try
    try
      Query.Database := ZDataModule.DBZarplata;
      Transaction.DefaultDatabase := ZDataModule.DBZarplata;
      Query.Transaction := Transaction;
      Query.SQL.Text := 'update z_setup set action_finished=''T''';
      Query.Transaction.StartTransaction;
      Query.ExecQuery;
      Query.Transaction.Commit;
    except
     on E:exception do
      Query.Transaction.Rollback;
    end;
  finally
      Query.Database := nil;
      Transaction.DefaultDatabase := nil;
      Transaction.Destroy;
      Query.Destroy;
  end;
end;

procedure TFZMainMenu.BankCardContinueClick(Sender: TObject);
begin
LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,
                  'Zarplata\BankCardContinue.bpl','BankCards');
end;

procedure TFZMainMenu.TestBtnClick(Sender: TObject);
begin
LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,
                  'Zarplata\GetData.bpl','View_Form');
end;

procedure TFZMainMenu.Action3Execute(Sender: TObject);
begin
LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,
                  'Zarplata\SGData.bpl','View_Form');
end;

procedure TFZMainMenu.ImportBtnClick(Sender: TObject);
begin
LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,
                  'Zarplata\zImport.bpl','ShowForm');
end;

procedure TFZMainMenu.SsudaPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_CREDIT','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0)
     then begin //yes
               LoadLoan(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.PromViplatiPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work/Z_Menu_RCURRENT','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Work','Belong')=0)
     then begin //yes
               LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,'Zarplata\CurrentCount.bpl','ShowCurrentCount');
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.dxBarButton4Click(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_PENS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
               PrintSprDoh(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.dxBarButton5Click(Sender: TObject);
begin
LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,
                  'Zarplata\HolCount.bpl','FormShow');
end;

procedure TFZMainMenu.AccessBtnClick(Sender: TObject);
begin
LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,
                  'Zarplata\AccCtrl.bpl','ShowZUsers');
end;

procedure TFZMainMenu.dxBarButton3Click(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_PENS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
               LoadSimplePackage(self,ZDataModule.DBZarplata.Handle, 'Zarplata\SprPension.bpl','CreateSprPension');
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.ZarplataRollbackClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service/Z_Menu_SYS_ROOLBACK','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service','Belong')=0)
     then begin //yes
               LoadOperationEnd(Self,ZDataModule.DBZarplata.Handle, true);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.ServiceSubMainMenuPopup(Sender: TObject);
var Kod_Action:integer;
   Is_Finished:boolean;
   Name_Action:string;
begin
      Kod_action:=0;
      Is_Finished:=False;
      Name_Action:=CurrentAction(ZDataModule.DBZarplata.Handle,Kod_Action,Is_Finished);

      if (Kod_Action<>0)
      then begin
                ZarplataRollback.Enabled          := False;
       end
      else begin
                  ZarplataRollback.Enabled         := True;
      end;
end;

procedure TFZMainMenu.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var
temp_s:string;
begin
    if E is EFIBInterBaseError then
    begin
      if EFIBInterbaseError(E).SQLCode = -902 then
      begin
        temp_s:=EFIBInterbaseError(E).Message + 'Произошёл обрыв связи с сервером, обратитесь к администратору.';
        MessageBox(Application.Handle,Pchar(temp_s),'Внимание!',MB_OK);
        Application.Terminate;
      end else
        MessageBox(Application.Handle,PChar(EFIBInterbaseError(E).Message),'Внимание!',MB_OK);
    end else
      MessageBox(Application.Handle,PChar(E.Message),'Внимание!',MB_OK);
end;

procedure TFZMainMenu.dxBarButton7Click(Sender: TObject);
var id_user:Integer;
begin
               if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_RNACH','Belong')=0)
               or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
               then begin //yes
                          PC.InParams.Items['AOwner'] := @self;
                          PC.InParams.Items['DbHandle'] := PInteger(@ZDataModule.DBZarplata.Handle);
                          id_user:=AccMGMT.fibGetCurrentUserInfo.UserID;
                          PC.InParams.Items['Id_User'] := PInteger(@id_user);
                          (PC as IFMASModule).Run;
               end
               else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;


procedure TFZMainMenu.dxBarButton8Click(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service/Z_Menu_LCARDS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service','Belong')=0)
     then begin //yes
               LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,'Zarplata\BankCardContinue.bpl','BankCards');
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.dxBarButton6Click(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service/Z_Menu_ICARDS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service','Belong')=0)
     then begin //yes
               LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,'Zarplata\AcctCard.bpl','View_AcctCard');
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.InitUsersAuthMenuClick(Sender: TObject);
begin
     if not IsZSuperUser(GetUserId, ZDataModule.DBZarplata.Handle)
     then MessageBox(self.Handle, 'Ви не маєте доступу до цієї функції!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.dxb_UpOkladDateClick(Sender: TObject);
begin
    if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service/Z_Menu_Oklad_UP_Date','Belong')=0)
    or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service','Belong')=0) then
        LoadSimplePackage(self, ZDataModule.DBZarplata.Handle, 'Zarplata\ZIniOkladUpdates.bpl', 'View_ZIniOkladUpdates_Sp')
    else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.ButtonSprDoh2Click(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_PENS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
               PrintSprDoh2(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.dxBarButton11Click(Sender: TObject);
var id_user:Integer;
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_PERSON','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
                PCzPers2010.InParams.Items['AOwner'] := @self;
                PCzPers2010.InParams.Items['DbHandle'] := PInteger(@ZDataModule.DBZarplata.Handle);
                id_user:=AccMGMT.fibGetCurrentUserInfo.UserID;
                PCzPers2010.InParams.Items['Id_User'] := PInteger(@id_user);
                (PCzPers2010 as IFMASModule).Run;
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);

end;

procedure TFZMainMenu.dxBarButton12Click(Sender: TObject);
var id_user:Integer;
begin
    if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service/Z_Menu_BU_ASSOT','Belong')=0)
    or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service','Belong')=0)
    then begin
              PSmAss.InParams.Items['AOwner'] := @self;
              PSmAss.InParams.Items['DbHandle'] := PInteger(@ZDataModule.DBZarplata.Handle);
              id_user:=AccMGMT.fibGetCurrentUserInfo.UserID;
              PSmAss.InParams.Items['Id_User'] := PInteger(@id_user);
              (PSmAss as IFMASModule).Run;
    end
    else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.dxBarButton13Click(Sender: TObject);
var Parameter:TTuSimpleParam;
begin
  Parameter := TTuSimpleParam.Create;
  Parameter.DB_Handle := ZDataModule.DBZarplata.Handle;
  Parameter.Owner := self;
  DoFunctionFromPackage(Parameter,Tu_Calendar_Pack);
  Parameter.Destroy;
end;

procedure TFZMainMenu.dxBarButton14Click(Sender: TObject);
var Parameter:TTuSimpleParam;
begin
  Parameter := TTuSimpleParam.Create;
  Parameter.DB_Handle := ZDataModule.DBZarplata.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsChild;
  Parameter.KodSetup:=CurrentKodSetup(ZDataModule.DBZarplata.Handle);
  DoFunctionFromPackage(Parameter,Tu_SpWorkMode_Pack);
  Parameter.Destroy;
end;


procedure TFZMainMenu.dxBarButton15Click(Sender: TObject);
var id_user:Int64;
begin
    if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Info/Z_Menu_EMAIL','Belong')=0)
    or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Info','Belong')=0)
    then begin
              PZEmail.InParams.Items['AOwner'] := @self;
              PZEmail.InParams.Items['DbHandle'] := PInteger(@ZDataModule.DBZarplata.Handle);
              id_user:=AccMGMT.fibGetCurrentUserInfo.UserID;
              PZEmail.InParams.Items['Id_User'] := PInteger(@id_user);
              (PZEmail as IFMASModule).Run;
    end
    else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.ImportMenuClick(Sender: TObject);
begin
LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,'Zarplata\ImportCurrentPremiya.bpl','View_ImportCurrentPremiya');
end;

procedure TFZMainMenu.dxBarButton17Click(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_DOXOD','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
               PrintSprFond(self,ZDataModule.DBZarplata.Handle,tsZarplata,-1);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;


procedure TFZMainMenu.ExportBtnClick(Sender: TObject);
begin
  LoadSimplePackage(Self,ZDataModule.DBZarplata.Handle,'Zarplata\ExportAccount.bpl', 'ShowExportAccount');
end;

procedure TFZMainMenu.dxBarButton19Click(Sender: TObject);
begin
if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_FSVODS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
               LoadPeoplePropByPeriod(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.dxBarButton20Click(Sender: TObject);
var FilterDataSprDoh:TFilterDataSprDoh;
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_PENS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
                FilterDataSprDoh:=PrintDataFromSprDoh(self,ZDataModule.DBZarplata.Handle);
                if  FilterDataSprDoh.ID_man<>-1 then
                  begin
                    PrintSprZarplAndOthers(self,ZDataModule.DBZarplata.Handle, FilterDataSprDoh);
                  end

     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);

end;

procedure TFZMainMenu.dxBarButton22Click(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_PENS','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
     then begin //yes
               PrintSprYearDecl(self,ZDataModule.DBZarplata.Handle);
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.dxBarButton24Click(Sender: TObject);
begin
if (//fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service/Z_Menu_PERCENTS','Belong')=0)
     //or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service','Belong')=0)
     True)
     then begin //yes
               Load_InflHand(Self,ZDataModule.DBZarplata.Handle);
     end
else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFZMainMenu.dxBarButton25Click(Sender: TObject);
begin
                LoadSimplePackage(self,ZDataModule.DBZarplata.Handle,'Zarplata\SpOrderPrintDolgnost.bpl','View_SpOrderPrintDolgnost')
end;

procedure TFZMainMenu.dxBarButton16Click(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_HOSP','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0) then
     begin //yes
         LoadHospRMoving(self,ZDataModule.DBZarplata.Handle,zfsChild);

     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);

end;

procedure TFZMainMenu.dxBarLargeButton1Click(Sender: TObject);
begin
//      if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_FSVODS','Belong')=0)
//     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports','Belong')=0)
//     then begin //yes
               LoadSprWorkHours(self,ZDataModule.DBZarplata.Handle);
//     end
//     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

end.
