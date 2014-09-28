unit gr_ExeMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, zTypes, uCommonSp,
  gr_ExeDM, gr_uCommonConsts,
  StdCtrls, dxBar,
  cxGraphics, ImgList, dxDockControl,
  pFIBErrorHandler, cxControls, dxStatusBar,
  gr_uMessage, SysAdmin, gr_dmCommonStyles,
  gr_uCommonLoader, gr_uCommonTypes, gr_uCommonProc, ComCtrls, dxBarExtItems, dxBarExtDBItems,
  MDIChildFormsBar, cxLookAndFeelPainters, cxButtons, PackageLoad, ZProc, dates,
  AppEvnts, Fib, ActnList, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, inifiles,
  AccMGMT, BaseTypes;

type
  TExeMainForm = class(TForm)
    BarManager: TdxBarManager;
    AboutProgPunktMainMenu: TdxBarButton;
    AboutSubMainMenu: TdxBarSubItem;
    SystemPreverencesPunktMainMenu: TdxBarButton;
    ReturnPrevPeriodPunktMainMenu: TdxBarButton;
    ServiceSubMainMenu: TdxBarSubItem;
    DivisionSpPunktMainMenu: TdxBarButton;
    VOutSpPunktMainMenu: TdxBarButton;
    SpSubMainMenu: TdxBarSubItem;
    StudDtPunktMainMenu: TdxBarButton;
    CurrentDtPunktMainMenu: TdxBarButton;
    AlimentPunktMainMenu: TdxBarButton;
    DataSubMainMenu: TdxBarSubItem;
    PrevPeriodDataPunktMainMenu: TdxBarButton;
    UchetVedPunktMainMenu: TdxBarButton;
    VedCurrentMonthPunktMainMenu: TdxBarButton;
    InformationSubMainMenu: TdxBarSubItem;
    PromViplatiPunktMainMenu: TdxBarButton;
    QuickCountPunktMainMenu: TdxBarButton;
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
    TaxesNetsPunktMainMenu: TdxBarButton;
    PeoplePunktMainMenu: TdxBarButton;
    ReCountPunktMainMenu: TdxBarButton;
    ReCountDataPunktMainMenu: TdxBarButton;
    WindowSubMenu: TdxBarSubItem;
    CascadePunktMainMenu: TdxBarButton;
    TileGorPunktMainMenu: TdxBarButton;
    CloseAllWindowsPunktMainMenu: TdxBarButton;
    TileVerPunktMainMenu: TdxBarButton;
    MinAllPunktMainMenu: TdxBarButton;
    NormAllPunktMainMenu: TdxBarButton;
    SvodSubItem: TdxBarSubItem;
    pFibErrorHandler1: TpFibErrorHandler;
    dxDockingManager1: TdxDockingManager;
    Images: TImageList;
    ViewUsers: TdxBarButton;
    ViewErrors: TdxBarButton;
    InfokomImportItem: TdxBarButton;
    dxStatusBar: TdxStatusBar;
    WhatsNewBtn: TdxBarButton;
    AllCountPunktMainMenu: TdxBarButton;
    CurrentAllDtPunktMainMenu: TdxBarButton;
    BarStaticNameFirm: TdxBarStatic;
    dxBarButton1: TdxBarButton;
    BarBtnGrantRise: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    BarButtonSvodBySch: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButtonReeAlimony: TdxBarButton;
    dxBarSubItemSvods: TdxBarSubItem;
    dxBarButtonReeDolg: TdxBarButton;
    IndexCountPunktMainMenu: TdxBarButton;
    ApplicationEvents: TApplicationEvents;
    ActionList1: TActionList;
    Action1: TAction;
    BtnRollback: TdxBarButton;
    Action2: TAction;
    dxBarEdit1: TdxBarEdit;
    dxBarSubItem2: TdxBarSubItem;
    SystemDate: TdxBarStatic;
    dxBarStatic1: TdxBarStatic;
    RollbackPunctMainMenu: TdxBarButton;
    dxBarButton2: TdxBarButton;
    VedByMonth: TdxBarButton;
    BarButtonSvodBySm: TdxBarLargeButton;
    AnalitControl: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure ExitPunktMainMenuClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PeoplePunktMainMenuClick(Sender: TObject);
    procedure CascadePunktMainMenuClick(Sender: TObject);
    procedure WindowSubMenuPopup(Sender: TObject);
    procedure TileGorPunktMainMenuClick(Sender: TObject);
    procedure TileVerPunktMainMenuClick(Sender: TObject);
    procedure CloseAllWindowsPunktMainMenuClick(Sender: TObject);
    procedure MinAllPunktMainMenuClick(Sender: TObject);
    procedure NormAllPunktMainMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxStatusBar2Resize(Sender: TObject);
    procedure ViewUsersClick(Sender: TObject);
    procedure ViewErrorsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VoplSpravPunktMainMenuClick(Sender: TObject);
    procedure DivisionSpPunktMainMenuClick(Sender: TObject);
    procedure VOutSpPunktMainMenuClick(Sender: TObject);
    procedure StudDtPunktMainMenuClick(Sender: TObject);
    procedure PrevPeriodDataPunktMainMenuClick(Sender: TObject);
    procedure DataRaschetPunktMainMenuClick(Sender: TObject);
    procedure WhatsNewBtnClick(Sender: TObject);
    procedure TaxesNetsPunktMainMenuClick(Sender: TObject);
    procedure QuickCountPunktMainMenuClick(Sender: TObject);
    procedure OperationEndPunktMainMenuClick(Sender: TObject);
    procedure ReCountPunktMainMenuClick(Sender: TObject);
    procedure ReCountDataPunktMainMenuClick(Sender: TObject);
    procedure VedRaschetPunktMainMenuClick(Sender: TObject);
    procedure AllCountPunktMainMenuClick(Sender: TObject);
    procedure FilterVedPunktMainMenuClick(Sender: TObject);
    procedure VedCurrentMonthPunktMainMenuClick(Sender: TObject);
    procedure PromViplatiPunktMainMenuClick(Sender: TObject);
    procedure CurrentAllDtPunktMainMenuClick(Sender: TObject);
    procedure StudBtnClick(Sender: TObject);
    procedure CurrentBtnClick(Sender: TObject);
    procedure CountDataBtnClick(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure BarBtnGrantRiseClick(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure BarButtonSvodBySchClick(Sender: TObject);
    procedure ReestrVedPunktMainMenuClick(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure WorkSubMainMenuPopup(Sender: TObject);
    procedure dxBarButtonReeAlimonyClick(Sender: TObject);
    procedure dxBarButtonReeDolgClick(Sender: TObject);
    procedure IndexCountPunktMainMenuClick(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure Action1Execute(Sender: TObject);
    procedure BtnRollbackClick(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure BarManagerClickItem(Sender: TdxBarManager;
      ClickedItem: TdxBarItem);
    procedure ServiceSubMainMenuPopup(Sender: TObject);
    procedure RollbackPunctMainMenuClick(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure VedByMonthClick(Sender: TObject);
    procedure BarButtonSvodBySmClick(Sender: TObject);
    procedure AnalitControlClick(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
  private
    PUser:TUser;
    PLanguageIndex:byte;
    IdSystem:integer;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    property User:TUser read PUser write PUser;
  end;

var
  ExeMainForm: TExeMainForm;

implementation

{$R *.dfm}

uses cxGridDBTableView;

constructor TExeMainForm.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
end;

procedure TExeMainForm.ExitPunktMainMenuClick(Sender: TObject);
begin
Close;
end;

procedure TExeMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if grShowMessage(ExitBtn_Caption[PLanguageIndex],Q_DoYouWantExit_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
 begin
   FinalizeAdminSystem;
   CloseAllWindowsPunktMainMenuClick(Sender);
   Action:=caFree;
 end
else
 Action:=caNone;
end;

procedure TExeMainForm.PeoplePunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Sprav/Gr_Menu_FizPersons','Belong')=0)
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Sprav','Belong')=0)
     then begin //yes
           LoadSpAllPeople(Self,ExeDM.MainDB.Handle);
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.CascadePunktMainMenuClick(Sender: TObject);
begin
Application.MainForm.Cascade;
end;

procedure TExeMainForm.WindowSubMenuPopup(Sender: TObject);
begin
CascadePunktMainMenu.Enabled := Application.MainForm.MDIChildCount>0;
TileGorPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>1;
TileVerPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>1;
CloseAllWindowsPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>0;
MinAllPunktMainMenu.Enabled  := Application.MainForm.MDIChildCount>0;
NormAllPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>0;
end;

procedure TExeMainForm.TileGorPunktMainMenuClick(Sender: TObject);
begin
Application.MainForm.TileMode:=tbHorizontal;
Application.MainForm.Tile;
end;

procedure TExeMainForm.TileVerPunktMainMenuClick(Sender: TObject);
begin
Application.MainForm.TileMode:=tbVertical;
Application.MainForm.Tile;
end;

procedure TExeMainForm.CloseAllWindowsPunktMainMenuClick(Sender: TObject);
var i:integer;
begin
for i:=0 to Application.MainForm.MDIChildCount-1 do
  Application.MainForm.MDIChildren[i].Close;
end;

procedure TExeMainForm.MinAllPunktMainMenuClick(Sender: TObject);
var i:integer;
begin
for i:=Application.MainForm.MDIChildCount-1 downto 0 do
    Application.MainForm.MDIChildren[i].WindowState:=wsMinimized;
end;

procedure TExeMainForm.NormAllPunktMainMenuClick(Sender: TObject);
var i:integer;
begin
for i:=0 to Application.MainForm.MDIChildCount-1 do
    Application.MainForm.MDIChildren[i].WindowState:=wsNormal;
end;

procedure TExeMainForm.FormShow(Sender: TObject);
var
 p : TzMDITool;
begin
PLanguageIndex := IndexLanguage;
SetOptionsBarManager(BarManager);
BarDockControl1.SunkenBorder := True;
Caption := Application_Caption[PLanguageIndex];
AboutSubMainMenu.Caption := InformatData_Text[PLanguageIndex];
AboutProgPunktMainMenu.Caption := Service_Text[PLanguageIndex];
ServiceSubMainMenu.Caption := Service_Text[PLanguageIndex];
TaxesNetsPunktMainMenu.Caption := Nalogi_Text[PLanguageIndex];
ViewUsers.Caption := ViewUsers_Text[PLanguageIndex];
ViewErrors.Caption := ViewErrors_Text[PLanguageIndex];
SpSubMainMenu.Caption := Sprav_Text[PLanguageIndex];
PeoplePunktMainMenu.Caption := People_Text[PLanguageIndex];
VoplSpravPunktMainMenu.Caption := VidOpl_Text[PLanguageIndex];
DivisionSpPunktMainMenu.Caption := Departments_Text[PLanguageIndex];
VOutSpPunktMainMenu.Caption := TypePayment_Text[PLanguageIndex];
DataSubMainMenu.Caption  := Data_Text[PLanguageIndex];
StudDtPunktMainMenu.Caption := DataStud_Caption[PLanguageIndex];
CurrentAllDtPunktMainMenu.Caption := CurrentOperationsData_Text[PLanguageIndex];
InformationSubMainMenu.Caption := Information_Text[PLanguageIndex];
PrevPeriodDataPunktMainMenu.Caption := LastPeriodData_Text[PLanguageIndex];
UchetVedSubInformSubMainMenu.Caption := UchVed_Text[PLanguageIndex];
VedCurrentMonthPunktMainMenu.Caption := PeriodVed_Text[PLanguageIndex];
UchetVedPunktMainMenu.Caption := ReeVed_Text[PLanguageIndex];
FilterVedPunktMainMenu.Caption := LocateAndFilter_Text[PLanguageIndex];
WorkSubMainMenu.Caption := Work_Text[PLanguageIndex];
PromViplatiPunktMainMenu.Caption := Current_Text[PLanguageIndex];
AllCountPunktMainMenu.Caption := AllCount_Text[PLanguageIndex];
QuickCountPunktMainMenu.Caption := QuickCount_Text[PLanguageIndex];
ReCountPunktMainMenu.Caption := Recount_Text[PLanguageIndex];
VedRaschetPunktMainMenu.Caption := ViewVedData_Text[PLanguageIndex];
DataRaschetPunktMainMenu.Caption := ViewAccData_Text[PLanguageIndex];
ReCountDataPunktMainMenu.Caption := ViewRecData_Text[PLanguageIndex];
OperationEndPunktMainMenu.Caption := OperationEnd_Text[PLanguageIndex];
WindowSubMenu.Caption := Windows_Text[PLanguageIndex];
CascadePunktMainMenu.Caption := Cascade_Text[PLanguageIndex];
TileGorPunktMainMenu.Caption := TileGor_Text[PLanguageIndex];
TileVerPunktMainMenu.Caption := TileVer_Text[PLanguageIndex];
MinAllPunktMainMenu.Caption := Minimize_Text[PLanguageIndex];
NormAllPunktMainMenu.Caption := Normalize_Text[PLanguageIndex];
CloseAllWindowsPunktMainMenu.Caption := CloseAll_Text[PLanguageIndex];
ExitPunktMainMenu.Caption := ExitBtn_Caption[PLanguageIndex];
BarBtnGrantRise.Caption := GrantRise_Text[PLanguageIndex];
ReestrVedPunktMainMenu.Caption := ReeVed_Text[PLanguageIndex];
WhatsNewBtn.Caption := WhatsNewBtn_Caption[PLanguageIndex];
dxBarSubItemSvods.Caption := PrintSubItemSvods_Caption[PLanguageIndex];
BarButtonSvodBySch.Caption := PrintSvodBySch_Caption[PLanguageIndex];
dxBarButtonReeAlimony.Caption := PrintReeAlimony_Caption[PLanguageIndex];
dxBarButtonReeDolg.Caption := PrintReeDolg_Caption[PLanguageIndex];
dxBarButton1.Caption := PrintSvodVed_Caption[PLanguageIndex];
dxBarButton3.Caption := PrintVedByFilter_Caption[PLanguageIndex];
dxBarButton4.Caption := PrintSpDohSubs_Caption[PLanguageIndex];
dxBarButton5.Caption := PrintSpDoh_Caption[PLanguageIndex];
IndexCountPunktMainMenu.Caption := Indexation_Caption[PLanguageIndex];
dxBarSubItem1.Caption := MenuPrint_Caption[PLanguageIndex];
VedByMonth.Caption := PrintVedByMonth_Caption[PLanguageIndex];
If PUser.ID=-999 then
 begin
  ViewUsers.Visible:=ivAlways;
  ViewErrors.Visible:=ivAlways;
 end
else
 begin
  ViewUsers.Visible:=ivNever;
  ViewErrors.Visible:=ivNever;
 end;
 InitializaAdminSystem(Self, ExeDM.MainDB.Handle, 999 ,PUser.ID,False);
 p := TzMDITool.Create(WindowSubMenu);

 dxStatusBar.Panels[1].Text:=User.DbPath;
 dxStatusBar.Panels[2].Text:= User.Fio;
 dxStatusBar.Panels[3].Text:=DateToStr(Date);

 BarStaticNameFirm.Caption := grNameFirm(ExeDM.MainDB.Handle,'NAME_SHORT');
 BarStaticNameFirm.Hint := grNameFirm(ExeDM.MainDB.Handle);
 BarStaticNameFirm.Caption := BarStaticNameFirm.Hint;
end;

procedure TExeMainForm.dxStatusBar2Resize(Sender: TObject);
begin
 dxStatusBar.Panels[1].Width:=Round(dxStatusBar.Width/4);;
 dxStatusBar.Panels[2].Width:=Round(dxStatusBar.Width/3);
 dxStatusBar.Panels[3].Width:=Round(dxStatusBar.Width/10);
 dxStatusBar.Panels[4].Width:=Round(dxStatusBar.Width/10);
 dxStatusBar.Panels[0].Width:=dxStatusBar.Width-dxStatusBar.Panels[1].Width-dxStatusBar.Panels[2].Width-dxStatusBar.Panels[3].Width-dxStatusBar.Panels[4].Width-10;
end;

procedure TExeMainForm.ViewUsersClick(Sender: TObject);
begin
AdminShowUsers(Self);
end;

procedure TExeMainForm.ViewErrorsClick(Sender: TObject);
begin
AdminShowErrors(Self);
end;

procedure TExeMainForm.FormCreate(Sender: TObject);
var Config: TIniFile;
begin
 IdSystem := ValueFieldZSetup(ExeDM.MainDB.Handle,'GR_ID_SYSTEM');
 SystemDate.Caption := dates.KodSetupToPeriod(grKodSetup(ExeDM.MainDB.Handle),2);
end;

procedure TExeMainForm.VoplSpravPunktMainMenuClick(Sender: TObject);
begin

     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Sprav/Gr_Menu_VidOper','Belong')=0)
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Sprav','Belong')=0)
     then begin //yes
          LoadVidOpl(self,ExeDM.MainDB.Handle,zfsChild,0,IdSystem);
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.DivisionSpPunktMainMenuClick(Sender: TObject);
var
  sp: TSprav;
  OldValue: integer;
begin
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Sprav/Gr_Menu_Pidrozd','Belong')=0)
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Sprav','Belong')=0 )
     then begin //yes
           // создать справочник
      sp := GetSprav('SpDepartment');
      if sp <> nil then
      begin
        // заполнить входные параметры
      with sp.Input do
      begin
        Append;
        FieldValues['DBHandle'] := Integer(ExeDM.MainDB.Handle);
        FieldValues['Actual_Date'] := Date();
        FieldValues['AllowEdit'] := True;
        FieldValues['Id_Property']:=4;
        Post;
      end;
    // показать справочник и проанализировать результат (выбор одного подр.)
      sp.Show;
      sp.Free;
      end;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;


end;

{begin
  LoadDepartment(self,ExeDM.MainDB.Handle,zfsChild);
 end;}

procedure TExeMainForm.VOutSpPunktMainMenuClick(Sender: TObject);
begin

     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Sprav/Gr_Menu_VidOplat','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Sprav','Belong')=0)
     then begin //yes
             LoadViplata(self,ExeDM.MainDB.Handle,zfsChild);
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.StudDtPunktMainMenuClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin
       if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data/Gr_Menu_DataStud','Belong')=0 )
       or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data','Belong')=0 )
     then begin //yes
             Parameter := TgrSimpleParam.Create;
              Parameter.DB_Handle := ExeDM.MainDB.Handle;
              Parameter.Owner := self;
              DoFunctionFromPackage(Parameter,StudentPack);
              Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;

end;

procedure TExeMainForm.PrevPeriodDataPunktMainMenuClick(Sender: TObject);
var Parameter:TgrBooleanParam;
begin
   if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Info/Gr_Menu_LastData','Belong')=0 )
   or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Info','Belong')=0 )
     then begin //yes
      Parameter := TgrBooleanParam.Create;
      Parameter.DB_Handle := ExeDM.MainDB.Handle;
      Parameter.Owner     := self;
      Parameter.Priznak   := True;
      DoFunctionFromPackage(Parameter,Stud_AcCountData_Pack);
      Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.DataRaschetPunktMainMenuClick(Sender: TObject);
var Parameter:TgrBooleanParam;
begin
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work/Gr_Menu_DataScet','Belong')=0)
     or(fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work','Belong')=0)
     then begin //yes
        Parameter := TgrBooleanParam.Create;
        Parameter.DB_Handle := ExeDM.MainDB.Handle;
        Parameter.Owner     := self;
        Parameter.Priznak   := False;
        DoFunctionFromPackage(Parameter,Stud_AcCountData_Pack);
        Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.WhatsNewBtnClick(Sender: TObject);
begin
LoadWhatsNew(self,'gr_Whats_new.txt');
end;

procedure TExeMainForm.TaxesNetsPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Service/Gr_Menu_Taxes','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Service','Belong')=0 )
     then begin //yes
               LoadTaxes(self,ExeDM.MainDB.Handle);

     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;

end;

procedure TExeMainForm.QuickCountPunktMainMenuClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work/Gr_Menu_ExprScet','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work','Belong')=0 )
     then begin //yes
              Parameter := TgrSimpleParam.Create;
              Parameter.DB_Handle := ExeDM.MainDB.Handle;
              Parameter.Owner := self;
              DoFunctionFromPackage(Parameter,Stud_Account_Spisok_Pack);
              Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.OperationEndPunktMainMenuClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin


     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work/Gr_Menu_FinishOp','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work','Belong')=0)
     then begin //yes
          Parameter := TgrSimpleParam.Create;
          Parameter.DB_Handle := ExeDM.MainDB.Handle;
          Parameter.Owner := self;
          LoadgrOperationEnd(Parameter,false);
          Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.ReCountPunktMainMenuClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work/Gr_Menu_ReScet','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work','Belong')=0)
     then begin //yes
        Parameter := TgrSimpleParam.Create;
        Parameter.DB_Handle := ExeDM.MainDB.Handle;
        Parameter.Owner := self;
        DoFunctionFromPackage(Parameter,Stud_Recount_Spisok_Pack);
        Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.ReCountDataPunktMainMenuClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin

     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work/Gr_Menu_DataReScet','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work','Belong')=0)
     then begin //yes
      Parameter := TgrSimpleParam.Create;
      Parameter.DB_Handle := ExeDM.MainDB.Handle;
      Parameter.Owner := self;
      DoFunctionFromPackage(Parameter,Stud_ReCountData_Pack);
      Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.VedRaschetPunktMainMenuClick(Sender: TObject);
var Parameter:TgrPriznakSimpleParam;
begin

     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work/Gr_Menu_DataVedom','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work','Belong')=0 )
     then begin //yes
        Parameter := TgrPriznakSimpleParam.Create;
        Parameter.DB_Handle := ExeDM.MainDB.Handle;
        Parameter.Owner := self;
        Parameter.Priznak := uvpNotSaved;
        DoFunctionFromPackage(Parameter,Stud_CountSheet_Pack);
        Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.AllCountPunktMainMenuClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin

     if( fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work/Gr_Menu_Scet','Belong')=0  )
     or(fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work','Belong')=0)
     then begin //yes
        Parameter := TgrSimpleParam.Create;
        Parameter.DB_Handle := ExeDM.MainDB.Handle;
        Parameter.Owner := self;
        DoFunctionFromPackage(Parameter,Stud_AccountFull_Pack);
        Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.FilterVedPunktMainMenuClick(Sender: TObject);
var Parameter:TgrPriznakSimpleParam;
begin
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Info/Gr_Menu_Vedom/Gr_Menu_PoiskVed','Belong')=0)
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Info','Belong')=0)
     then begin //yes
          Parameter := TgrPriznakSimpleParam.Create;
          Parameter.DB_Handle := ExeDM.MainDB.Handle;
          Parameter.Owner := self;
          Parameter.Priznak := uvpFilter;
          DoFunctionFromPackage(Parameter,Stud_CountSheet_Pack);
          Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;

end;

procedure TExeMainForm.VedCurrentMonthPunktMainMenuClick(Sender: TObject);
var Parameter:TgrPriznakSimpleParam;
begin
Parameter := TgrPriznakSimpleParam.Create;
Parameter.DB_Handle := ExeDM.MainDB.Handle;
Parameter.Owner := self;
Parameter.Priznak := uvpFilter;
DoFunctionFromPackage(Parameter,Stud_CountSheet_Pack);
Parameter.Destroy;
end;

procedure TExeMainForm.PromViplatiPunktMainMenuClick(Sender: TObject);
var Parameter:TgrPriznakSimpleParam;
begin
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work/Gr_Menu_Viplat','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work','Belong')=0 )
     then begin //yes
              Parameter := TgrPriznakSimpleParam.Create;
              Parameter.DB_Handle := ExeDM.MainDB.Handle;
              Parameter.Owner := self;
              Parameter.Priznak := uvpFilter;
              DoFunctionFromPackage(Parameter,Stud_CountCurrent_Pack);
              Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;

end;

procedure TExeMainForm.CurrentAllDtPunktMainMenuClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin
       if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data/Gr_Menu_DataOper','Belong')=0 )
        or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data','Belong')=0 )
     then begin //yes
      Parameter := TgrSimpleParam.Create;
      Parameter.DB_Handle := ExeDM.MainDB.Handle;
      Parameter.Owner := self;
      DoFunctionFromPackage(Parameter,Stud_Current_Pack);
      Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.StudBtnClick(Sender: TObject);
begin
StudDtPunktMainMenuClick(Sender);
end;

procedure TExeMainForm.CurrentBtnClick(Sender: TObject);
begin
CurrentAllDtPunktMainMenuClick(Sender);
end;

procedure TExeMainForm.CountDataBtnClick(Sender: TObject);
begin
PrevPeriodDataPunktMainMenuClick(Sender);
end;

procedure TExeMainForm.dxBarButton1Click(Sender: TObject);
var Parameter:TgrSimpleParam;
begin
   if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintSumVed','Belong')=0 )
   or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print','Belong')=0)
     then begin //yes
      Parameter := TgrSimpleParam.Create;
      Parameter.DB_Handle := ExeDM.MainDB.Handle;
      Parameter.Owner := self;
      DoFunctionFromPackage(Parameter,Stud_Print);
      Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.BarBtnGrantRiseClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin

if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data/Gr_Menu_Increase','Belong')=0 )
or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data','Belong')=0)
     then begin //yes
      Parameter := TgrSimpleParam.Create;
      Parameter.DB_Handle := ExeDM.MainDB.Handle;
      Parameter.Owner := self;
      DoFunctionFromPackage(Parameter,Stud_GrantRise);
      Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.dxBarButton3Click(Sender: TObject);
begin


    if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintFlRep','Belong')=0 )
    or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print','Belong')=0)
     then begin //yes
      LoadReeDepVO(self,ExeDM.MainDB.Handle,false);
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.BarButtonSvodBySchClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintRep/Gr_Menu_PrintRah','Belong')=0)
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print','Belong')=0)
     then begin //yes
        Parameter := TgrSimpleParam.Create;
        Parameter.DB_Handle := ExeDM.MainDB.Handle;
        Parameter.Owner := self;
        DoFunctionFromPackage(Parameter,Stud_SvodBySch);
        Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.ReestrVedPunktMainMenuClick(Sender: TObject);
begin
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Info/Gr_Menu_Vedom/Gr_Menu_RegVed','Belong')=0)
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Info','Belong')=0)
     then begin //yes
          LoadReeVed(self,ExeDM.MainDB.Handle,-1,True);

     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.dxBarButton4Click(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin

      if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintSubs','Belong')=0 )
      or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print','Belong')=0)
     then begin //yes
        PrintSprSubs(self,ExeDM.MainDB.Handle,tsGrant);
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.dxBarButton5Click(Sender: TObject);
begin

  if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrSprDoh','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print','Belong')=0)
     then begin //yes
        PrintSprDoh(self,ExeDM.MainDB.Handle,tsGrant);
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.WorkSubMainMenuPopup(Sender: TObject);
var
  PKod_Action:integer;
  PIs_Finished: boolean;
begin
  grCurrentAction(ExeDM.MainDB.Handle,PKod_Action,PIs_Finished);
  if(PIs_Finished=false) then
  begin
    PromViplatiPunktMainMenu.Enabled:=false;
    QuickCountPunktMainMenu.Enabled:=false;
    AllCountPunktMainMenu.Enabled:=false;
    ReCountPunktMainMenu.Enabled:=false;
    VedRaschetPunktMainMenu.Enabled:=false;
    DataRaschetPunktMainMenu.Enabled:=false;
    ReCountDataPunktMainMenu.Enabled:=false;
    OperationEndPunktMainMenu.Enabled:=false;
  end
  else
  begin
    if(PKod_Action<>0)then
    begin
      PromViplatiPunktMainMenu.Enabled:=false;
      QuickCountPunktMainMenu.Enabled:=false;
      AllCountPunktMainMenu.Enabled:=false;
      ReCountPunktMainMenu.Enabled:=false;
      VedRaschetPunktMainMenu.Enabled:=true;
      DataRaschetPunktMainMenu.Enabled:=true;
      ReCountDataPunktMainMenu.Enabled:=true;
      OperationEndPunktMainMenu.Enabled:=true;
    end
    else
    begin
      PromViplatiPunktMainMenu.Enabled:=true;
      QuickCountPunktMainMenu.Enabled:=true;
      AllCountPunktMainMenu.Enabled:=true;
      ReCountPunktMainMenu.Enabled:=true;
      VedRaschetPunktMainMenu.Enabled:=true;
      DataRaschetPunktMainMenu.Enabled:=true;
      ReCountDataPunktMainMenu.Enabled:=true;
      OperationEndPunktMainMenu.Enabled:=true;
    end
  end
end;

procedure TExeMainForm.dxBarButtonReeAlimonyClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintRep/Gr_Menu_PrintAlim','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/','Belong')=0)
     then begin //yes
      Parameter := TgrSimpleParam.Create;
      Parameter.DB_Handle := ExeDM.MainDB.Handle;
      Parameter.Owner := self;
      DoFunctionFromPackage(Parameter,Stud_ReeAlimony);
      Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.dxBarButtonReeDolgClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin
   if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintRep/Gr_Menu_PrintDuty','Belong')=0 )
   or(fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print','Belong')=0)
     then begin //yes
      Parameter := TgrSimpleParam.Create;
      Parameter.DB_Handle := ExeDM.MainDB.Handle;
      Parameter.Owner := self;
      DoFunctionFromPackage(Parameter,Stud_ReeDolg);
      Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.IndexCountPunktMainMenuClick(Sender: TObject);
var Parameter:TgrIndexacParam;
begin
if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data/Gr_Menu_Indexing','Belong')=0 )
or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data','Belong')=0 )
     then begin //yes
        Parameter := TgrIndexacParam.Create;
        Parameter.DB_Handle := ExeDM.MainDB.Handle;
        Parameter.Owner := self;
        Parameter.id_man:=null;
        DoFunctionFromPackage(Parameter,Stud_IndexCount);
        Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.ApplicationEventsException(Sender: TObject;
  E: Exception);
begin
 grShowMessage(ECaption[Indexlanguage],e.Message,mtError,[mbOK]);
 if E is EFIBInterBaseError then
 begin
   if EFIBInterbaseError(E).SQLCode = -902 then
     Application.Terminate;
 end
end;

procedure TExeMainForm.Action1Execute(Sender: TObject);
begin
  if(BtnRollback.Visible=ivNever)
  then BtnRollback.Visible:=ivAlways
  else BtnRollback.Visible:=ivNever;
end;

procedure TExeMainForm.BtnRollbackClick(Sender: TObject);
var Query:TpFIBQuery;
    Transaction:TpFIBTransaction;
begin

  Query := TpFIBQuery.Create(self);
  Transaction := TpFIBTransaction.Create(self);
  try
    try
      Query.Database := ExeDM.MainDB;
      Transaction.DefaultDatabase := ExeDM.MainDB;
      Query.Transaction := Transaction;
      Query.SQL.Text := 'execute procedure GR_PAYMENT_COUNT_OPERATION_END(''O'')';
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

procedure TExeMainForm.Action2Execute(Sender: TObject);
var Query:TpFIBQuery;
    Transaction:TpFIBTransaction;
begin
  Query := TpFIBQuery.Create(self);
  Transaction := TpFIBTransaction.Create(self);
  try
    try
      Query.Database := ExeDM.MainDB;
      Transaction.DefaultDatabase := ExeDM.MainDB;
      Query.Transaction := Transaction;
      Query.SQL.Text := 'update z_setup set gr_action_finished=''T''';
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


procedure TExeMainForm.BarManagerClickItem(Sender: TdxBarManager;
  ClickedItem: TdxBarItem);
begin
SystemDate.Caption := dates.KodSetupToPeriod(grKodSetup(ExeDM.MainDB.Handle),2);
end;

procedure TExeMainForm.ServiceSubMainMenuPopup(Sender: TObject);
var Kod_Action:integer;
    Is_Finished:boolean;
    Name_Action:string;
begin
  Kod_action:=0;
  Is_Finished:=False;
  Name_Action:=grCurrentAction(ExeDM.MainDB.Handle,Kod_Action,Is_Finished);
  if (Kod_Action<>0)
  then
    RollbackPunctMainMenu.Enabled := False
  else
    RollbackPunctMainMenu.Enabled := True;

end;

procedure TExeMainForm.RollbackPunctMainMenuClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin


     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Service/Gr_Menu_Rollback','Belong')=0)
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Service','Belong')=0)
     then begin //yes
          Parameter := TgrSimpleParam.Create;
          Parameter.DB_Handle := ExeDM.MainDB.Handle;
          Parameter.Owner := self;
          LoadgrOperationEnd(Parameter,true);
          Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.dxBarButton2Click(Sender: TObject);
begin

        if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_Print1DF','Belong')=0 )
        or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print','Belong')=0)
     then begin //yes
     LoadSimplePackage(Self,ExeDM.MainDB.Handle,'Zarplata\f1dfm.bpl','View_F1df')
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TExeMainForm.VedByMonthClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin
Parameter := TgrSimpleParam.Create;
Parameter.DB_Handle := ExeDM.MainDB.Handle;
Parameter.Owner := self;
DoFunctionFromPackage(Parameter,Stud_PrintVedByMonth);
Parameter.Destroy;
end;

procedure TExeMainForm.BarButtonSvodBySmClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin
  if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintRep/Gr_Menu_PrintRah','Belong')=0)
  or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print','Belong')=0) then
  begin //yes
    Parameter := TgrSimpleParam.Create;
    Parameter.DB_Handle := ExeDM.MainDB.Handle;
    Parameter.Owner := self;
    DoFunctionFromPackage(Parameter,Stud_SvodBySm);
    Parameter.Destroy;
  end else
  begin
    BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
  end;
end;

procedure TExeMainForm.AnalitControlClick(Sender: TObject);
var Parameter:TgrSimpleParam;
begin
Parameter := TgrSimpleParam.Create;
Parameter.DB_Handle := ExeDM.MainDB.Handle;
Parameter.Owner := self;
DoFunctionFromPackage(Parameter,Stud_PrintAnalitControl);
Parameter.Destroy;
end;

procedure TExeMainForm.dxBarButton7Click(Sender: TObject);
var Parameter:TgrSimpleParam;
begin
       if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data/Gr_Menu_DataStud','Belong')=0 )
       or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data','Belong')=0 )
     then begin //yes
              Parameter := TgrSimpleParam.Create;
              Parameter.DB_Handle := ExeDM.MainDB.Handle;
              Parameter.Owner := self;
              //Parameter.Group_Grant:=True;
              DoFunctionFromPackage(Parameter,Group_Grant_Pack);
              Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;

end;

procedure TExeMainForm.dxBarButton8Click(Sender: TObject);
begin
  if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Service','Belong')=0 )
  then begin //yes
    LoadSimplePackage(Self,ExeDM.MainDB.Handle,'Zarplata\ConstSumsSetup.bpl', 'View_ConstSumsSetup');
  end
  else begin
    BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
  end;
end;

procedure TExeMainForm.dxBarButton10Click(Sender: TObject);
begin
LoadSimplePackage(self,ExeDM.MainDB.Handle,
                  'Zarplata\zImport.bpl','ShowForm');
end;

procedure TExeMainForm.dxBarLargeButton1Click(Sender: TObject);
begin
if (//fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service/Z_Menu_PERCENTS','Belong')=0)
     //or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Service','Belong')=0)
     True)
     then begin //yes
               Load_InflHand(Self,ExeDM.MainDB.Handle);
     end
else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

end.
