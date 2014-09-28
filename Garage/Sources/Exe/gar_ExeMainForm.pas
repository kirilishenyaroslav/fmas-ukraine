unit gar_ExeMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,
  gar_ExeDM,
  StdCtrls, dxBar,
  cxGraphics, ImgList, dxDockControl,
  pFIBErrorHandler, cxControls, dxStatusBar, ComCtrls, dxBarExtItems,
  dxBarExtDBItems,   cxLookAndFeelPainters, cxButtons,
  AppEvnts, Fib, ActnList, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, inifiles,  AccMGMT, BaseTypes, gar_LoadPackageGarage, gr_uCommonLoader,
  gar_Types, gr_uCommonProc, Dates, FIBDataSet, DB, pFIBDataSet,
  pFIBStoredProc, gar_GarageProc, MDIChildFormsBar, gr_uCommonConsts, gr_uCommonTypes,gar_Consts;

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
    PrintBarSubItem: TdxBarSubItem;
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
    AvtoBarButton: TdxBarButton;
    ReestrListBarButton: TdxBarButton;
    dxBarButton12: TdxBarButton;
    CartAvtoBarButton: TdxBarButton;
    VedMonthAvtoBarButton: TdxBarButton;
    WorkBarSubItem: TdxBarSubItem;
    CLosePeriodBarButton: TdxBarButton;
    RollBackPeriodBarButton: TdxBarButton;
    VedomostBarButton: TdxBarButton;
    FactorToplBarButton: TdxBarButton;
    VedomAvtoBarButton: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    dxBarButton20: TdxBarButton;
    FilterdxBarSubItem: TdxBarSubItem;
    FilterSeriesBarButton: TdxBarButton;
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
    procedure AvtoBarButtonClick(Sender: TObject);
    procedure ReestrListBarButtonClick(Sender: TObject);
    procedure CartAvtoBarButtonClick(Sender: TObject);
    procedure VedMonthAvtoBarButtonClick(Sender: TObject);
    procedure CLosePeriodBarButtonClick(Sender: TObject);
    procedure RollBackPeriodBarButtonClick(Sender: TObject);
    procedure VedomostBarButtonClick(Sender: TObject);
    procedure FactorToplBarButtonClick(Sender: TObject);
    procedure VedomAvtoBarButtonClick(Sender: TObject);
    procedure dxBarButton20Click(Sender: TObject);
    procedure FilterSeriesBarButtonClick(Sender: TObject);
  private
    PUser:TUser;
    PLanguageIndex:byte;
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
if garShowMessage(ExitBtn_Caption[LanguageIndex],Q_DoYouWantExit_Text[LanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
 begin
   CloseAllWindowsPunktMainMenuClick(Sender);
   Action:=caFree;
 end
else
 Action:=caNone;
end;

procedure TExeMainForm.PeoplePunktMainMenuClick(Sender: TObject);
var Param:TgarSimpleParamMode;
begin
  Param:=TgarSimpleParamMode.Create();
  Param.DB_Handle:=ExeDM.MainDB.Handle;
  Param.Owner:=self;
  Param.fs:=garfsEdit;
  LoadPackageGarage(Param, Name_Gar_Sp_People);
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
begin
 PLanguageIndex := 1;
 Caption := 'Гараж';
 //-------------------------называем менюшки----------------------------------//
 AboutSubMainMenu.Caption        := MainMenuSpravka[PLanguageIndex];
 AboutProgPunktMainMenu.Caption  := MainMenuProgram[PLanguageIndex];
 WhatsNewBtn.Caption             := MainMenuAbout[PLanguageIndex];
 SpSubMainMenu.Caption           := MainMenuSP[PLanguageIndex];
 PeoplePunktMainMenu.Caption     := MainMenuOtvLico[PLanguageIndex];
 VoplSpravPunktMainMenu.Caption  := MainMenuMarkaAvro[PLanguageIndex];
 VOutSpPunktMainMenu.Caption     := MainMenuModeliAvto[PLanguageIndex];
 DivisionSpPunktMainMenu.Caption := MainMenuMarkiTopl[PLanguageIndex];
 FactorToplBarButton.Caption     := MainMenuFactorTopl[PLanguageIndex];
 DataSubMainMenu.Caption         := MainMenuData[PLanguageIndex];
 AvtoBarButton.Caption           := MainMenuAvto[PLanguageIndex];
 ReestrListBarButton.Caption     := MainMenuReestrList[PLanguageIndex];
 VedomostBarButton.caption       := MainMenuVedomost[PLanguageIndex];
 WorkBarSubItem.caption          := MainMenuWork[PLanguageIndex];
 CLosePeriodBarButton.caption    := MainMenuClosePeriod[PLanguageIndex];
 RollBackPeriodBarButton.caption := MainRollBackPeriod[PLanguageIndex];
 PrintBarSubItem.caption         := MainMenuPrint[PLanguageIndex];
 CartAvtoBarButton.caption       := MainMenuCartAvto[PLanguageIndex];
 VedMonthAvtoBarButton.caption   := MainMenuVedMonthAvto[PLanguageIndex];
 VedomAvtoBarButton.caption      := MainMenuVedomAvto[PLanguageIndex];
 ExitPunktMainMenu.caption       := MainMenuExit[PLanguageIndex];
 WindowSubMenu.caption           := MainMenuWindowMenu[PLanguageIndex];

 dxStatusBar.Panels[1].Text:=AccMGMT.fibGetCurrentDBPath;
 dxStatusBar.Panels[2].Text:= AccMGMT.GetUserFIO;
 dxStatusBar.Panels[3].Text:=DateToStr(Date);

 BarStaticNameFirm.Caption  := grNameFirm(ExeDM.MainDB.Handle,'NAME_SHORT');
 BarStaticNameFirm.Hint     := grNameFirm(ExeDM.MainDB.Handle);
 BarStaticNameFirm.Caption  := BarStaticNameFirm.Hint;
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
//AdminShowUsers(Self);
end;

procedure TExeMainForm.ViewErrorsClick(Sender: TObject);
begin
//AdminShowErrors(Self);
end;

procedure TExeMainForm.FormCreate(Sender: TObject);

var   T: TzMDITool;
begin
  T:=TzMDITool.Create(BarManager);
  SystemDate.Caption := dates.KodSetupToPeriod(Global_Kod_Setup(ExeDM.MainDB.Handle),2);
end;

procedure TExeMainForm.VoplSpravPunktMainMenuClick(Sender: TObject);
var Param:TgarSimpleParamMode;
s:string;
HandlePack: HModule;
begin
Param:=TgarSimpleParamMode.Create();
Param.DB_Handle:=ExeDM.MainDB.Handle;
Param.Owner:=self;
Param.fs:=garfsEdit;
LoadPackageGarage(Param, Name_Gar_Sp_Marka_Avto);
end;

procedure TExeMainForm.DivisionSpPunktMainMenuClick(Sender: TObject);
{var
  sp: TSprav;
  OldValue: integer; }
var Param:TgarSimpleParamMode;
begin
Param:=TgarSimpleParamMode.Create();
Param.DB_Handle:=ExeDM.MainDB.Handle;
Param.Owner:=self;
Param.fs:=garfsEdit;
LoadPackageGarage(Param, Name_Gar_Sp_Marka_Topl);

{     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Sprav/Gr_Menu_Pidrozd','Belong')=0)
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

}
end;

{begin
  LoadDepartment(self,ExeDM.MainDB.Handle,zfsChild);
 end;}

procedure TExeMainForm.VOutSpPunktMainMenuClick(Sender: TObject);
var Param:TgarSimpleParamMode;
begin
Param:=TgarSimpleParamMode.Create();
Param.DB_Handle:=ExeDM.MainDB.Handle;
Param.Owner:=self;
Param.fs:=garfsEdit;
LoadPackageGarage(Param, Name_Gar_Sp_Model);
{
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Sprav/Gr_Menu_VidOplat','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Sprav','Belong')=0)
     then begin //yes
             LoadViplata(self,ExeDM.MainDB.Handle,zfsChild);
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
}
end;

procedure TExeMainForm.StudDtPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
{       if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data/Gr_Menu_DataStud','Belong')=0 )
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
}
end;

procedure TExeMainForm.PrevPeriodDataPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrBooleanParam;
begin
{   if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Info/Gr_Menu_LastData','Belong')=0 )
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
}
end;

procedure TExeMainForm.DataRaschetPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrBooleanParam;
begin
{     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work/Gr_Menu_DataScet','Belong')=0)
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
}
end;

procedure TExeMainForm.WhatsNewBtnClick(Sender: TObject);
begin
//LoadWhatsNew(self,'gr_Whats_new.txt');
end;

procedure TExeMainForm.TaxesNetsPunktMainMenuClick(Sender: TObject);
begin
{
     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Service/Gr_Menu_Taxes','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Service','Belong')=0 )
     then begin //yes
               LoadTaxes(self,ExeDM.MainDB.Handle);

     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
  }
end;

procedure TExeMainForm.QuickCountPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
 {    if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work/Gr_Menu_ExprScet','Belong')=0 )
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
     }
end;

procedure TExeMainForm.OperationEndPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
{

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
     }
end;

procedure TExeMainForm.ReCountPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
{     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work/Gr_Menu_ReScet','Belong')=0 )
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
     }
end;

procedure TExeMainForm.ReCountDataPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
{
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
     }
end;

procedure TExeMainForm.VedRaschetPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrPriznakSimpleParam;
begin
  {
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
     }
end;

procedure TExeMainForm.AllCountPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
{
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
     }
end;

procedure TExeMainForm.FilterVedPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrPriznakSimpleParam;
begin
 {    if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Info/Gr_Menu_Vedom/Gr_Menu_PoiskVed','Belong')=0)
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
 }
end;

procedure TExeMainForm.VedCurrentMonthPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrPriznakSimpleParam;
begin
{Parameter := TgrPriznakSimpleParam.Create;
Parameter.DB_Handle := ExeDM.MainDB.Handle;
Parameter.Owner := self;
Parameter.Priznak := uvpFilter;
DoFunctionFromPackage(Parameter,Stud_CountSheet_Pack);
Parameter.Destroy;     }
end;

procedure TExeMainForm.PromViplatiPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrPriznakSimpleParam;
begin
 {    if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Work/Gr_Menu_Viplat','Belong')=0 )
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
   }
end;

procedure TExeMainForm.CurrentAllDtPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
{       if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data/Gr_Menu_DataOper','Belong')=0 )
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
     }
end;

procedure TExeMainForm.StudBtnClick(Sender: TObject);
begin
//StudDtPunktMainMenuClick(Sender);
end;

procedure TExeMainForm.CurrentBtnClick(Sender: TObject);
begin
//CurrentAllDtPunktMainMenuClick(Sender);
end;

procedure TExeMainForm.CountDataBtnClick(Sender: TObject);
begin
//PrevPeriodDataPunktMainMenuClick(Sender);
end;

procedure TExeMainForm.dxBarButton1Click(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
{   if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintSumVed','Belong')=0 )
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
     }
end;

procedure TExeMainForm.BarBtnGrantRiseClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
{
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
     end;   }
end;

procedure TExeMainForm.dxBarButton3Click(Sender: TObject);
begin

{
    if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintFlRep','Belong')=0 )
    or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print','Belong')=0)
     then begin //yes
      LoadReeDepVO(self,ExeDM.MainDB.Handle,false);
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;  }
end;

procedure TExeMainForm.BarButtonSvodBySchClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
{     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintRep/Gr_Menu_PrintRah','Belong')=0)
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
     end;    }
end;

procedure TExeMainForm.ReestrVedPunktMainMenuClick(Sender: TObject);
begin
{     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Info/Gr_Menu_Vedom/Gr_Menu_RegVed','Belong')=0)
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Info','Belong')=0)
     then begin //yes
          LoadReeVed(self,ExeDM.MainDB.Handle,-1,True);

     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end; }
end;

procedure TExeMainForm.dxBarButton4Click(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
{
      if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintSubs','Belong')=0 )
      or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print','Belong')=0)
     then begin //yes
        PrintSprSubs(self,ExeDM.MainDB.Handle,tsGrant);
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;   }
end;

procedure TExeMainForm.dxBarButton5Click(Sender: TObject);
begin
{
  if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrSprDoh','Belong')=0 )
     or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print','Belong')=0)
     then begin //yes
        PrintSprDoh(self,ExeDM.MainDB.Handle,tsGrant);
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end; }
end;

procedure TExeMainForm.WorkSubMainMenuPopup(Sender: TObject);
{var
  PKod_Action:integer;
  PIs_Finished: boolean;}
begin
{  grCurrentAction(ExeDM.MainDB.Handle,PKod_Action,PIs_Finished);
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
  end}
end;

procedure TExeMainForm.dxBarButtonReeAlimonyClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
  {   if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintRep/Gr_Menu_PrintAlim','Belong')=0 )
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
     end;}
end;

procedure TExeMainForm.dxBarButtonReeDolgClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
  { if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintRep/Gr_Menu_PrintDuty','Belong')=0 )
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
     end;}
end;

procedure TExeMainForm.IndexCountPunktMainMenuClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
  {
if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data/Gr_Menu_Indexing','Belong')=0 )
or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data','Belong')=0 )
     then begin //yes
        Parameter := TgrSimpleParam.Create;
        Parameter.DB_Handle := ExeDM.MainDB.Handle;
        Parameter.Owner := self;
        DoFunctionFromPackage(Parameter,Stud_IndexCount);
        Parameter.Destroy;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;}
end;

procedure TExeMainForm.ApplicationEventsException(Sender: TObject;
  E: Exception);
begin
{ grShowMessage(ECaption[Indexlanguage],e.Message,mtError,[mbOK]);
 if E is EFIBInterBaseError then
 begin
   if EFIBInterbaseError(E).SQLCode = -902 then
     Application.Terminate;
 end}
end;

procedure TExeMainForm.Action1Execute(Sender: TObject);
begin
{  if(BtnRollback.Visible=ivNever)
  then BtnRollback.Visible:=ivAlways
  else BtnRollback.Visible:=ivNever;}
end;

procedure TExeMainForm.BtnRollbackClick(Sender: TObject);
//var Query:TpFIBQuery;
//    Transaction:TpFIBTransaction;
begin
  {
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
  end;}
end;

procedure TExeMainForm.Action2Execute(Sender: TObject);
//var Query:TpFIBQuery;
 //   Transaction:TpFIBTransaction;
begin
 { Query := TpFIBQuery.Create(self);
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
  end;}
end;


procedure TExeMainForm.BarManagerClickItem(Sender: TdxBarManager;
  ClickedItem: TdxBarItem);
begin
//SystemDate.Caption := dates.KodSetupToPeriod(grKodSetup(ExeDM.MainDB.Handle),2);
end;

procedure TExeMainForm.ServiceSubMainMenuPopup(Sender: TObject);
{var Kod_Action:integer;
    Is_Finished:boolean;
    Name_Action:string;}
begin
{  Kod_action:=0;
  Is_Finished:=False;
  Name_Action:=grCurrentAction(ExeDM.MainDB.Handle,Kod_Action,Is_Finished);
  if (Kod_Action<>0)
  then
    RollbackPunctMainMenu.Enabled := False
  else
    RollbackPunctMainMenu.Enabled := True;
 }
end;

procedure TExeMainForm.RollbackPunctMainMenuClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
  {

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
     end;}
end;

procedure TExeMainForm.dxBarButton2Click(Sender: TObject);
begin
{
        if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_Print1DF','Belong')=0 )
        or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print','Belong')=0)
     then begin //yes
     LoadSimplePackage(Self,ExeDM.MainDB.Handle,'Zarplata\f1dfm.bpl','View_F1df')
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
     }
end;

procedure TExeMainForm.VedByMonthClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
{Parameter := TgrSimpleParam.Create;
Parameter.DB_Handle := ExeDM.MainDB.Handle;
Parameter.Owner := self;
DoFunctionFromPackage(Parameter,Stud_PrintVedByMonth);
Parameter.Destroy;}
end;

procedure TExeMainForm.BarButtonSvodBySmClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
  {if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Print/Gr_Menu_PrintRep/Gr_Menu_PrintRah','Belong')=0)
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
  end;}
end;

procedure TExeMainForm.AnalitControlClick(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
{Parameter := TgrSimpleParam.Create;
Parameter.DB_Handle := ExeDM.MainDB.Handle;
Parameter.Owner := self;
DoFunctionFromPackage(Parameter,Stud_PrintAnalitControl);
Parameter.Destroy;}
end;

procedure TExeMainForm.dxBarButton7Click(Sender: TObject);
//var Parameter:TgrSimpleParam;
begin
  {     if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data/Gr_Menu_DataStud','Belong')=0 )
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
   }
end;

procedure TExeMainForm.dxBarButton8Click(Sender: TObject);
begin
 { if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Service','Belong')=0 )
  then begin //yes
    LoadSimplePackage(Self,ExeDM.MainDB.Handle,'Zarplata\ConstSumsSetup.bpl', 'View_ConstSumsSetup');
  end
  else begin
    BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
  end;}
end;

procedure TExeMainForm.AvtoBarButtonClick(Sender: TObject);
var Param:TgarSimpleParamMode;
begin
  Param:=TgarSimpleParamMode.Create();
  Param.DB_Handle:=ExeDM.MainDB.Handle;
  Param.Owner:=self;
  Param.fs:=garfsEdit;
  LoadPackageGarage(Param, Name_Gar_Sp_Avto);
end;

procedure TExeMainForm.ReestrListBarButtonClick(Sender: TObject);
var Param:TgarSimpleParamMode;
begin
  Param:=TgarSimpleParamMode.Create();
  Param.DB_Handle:=ExeDM.MainDB.Handle;
  Param.fs:=garfsEdit;
  Param.Owner:=self;
  LoadPackageGarage(Param, Name_Gar_Sp_WayBill);
end;

procedure TExeMainForm.CartAvtoBarButtonClick(Sender: TObject);
var Param:TgarSimpleParamMode;
begin
  Param:=TgarSimpleParamMode.Create();
  Param.DB_Handle:=ExeDM.MainDB.Handle;
  Param.Owner:=self;
  LoadPackageGarage(Param, Name_Gar_Comulative_List_By_Avto);    
  Param.Destroy
end;

procedure TExeMainForm.VedMonthAvtoBarButtonClick(Sender: TObject);
var Param:TgarSimpleParamMode;
begin
  Param:=TgarSimpleParamMode.Create();
  Param.DB_Handle:=ExeDM.MainDB.Handle;
  Param.Owner:=self;
  LoadPackageGarage(Param, Name_Gar_Comulative_List_By_Period);
  Param.Destroy
end;

procedure TExeMainForm.CLosePeriodBarButtonClick(Sender: TObject);
Var
Transaction:TpFIBTransaction;
pFIBStoredProc1:TpFIBStoredProc;
begin
  Transaction:=TpFIBTransaction.Create(self);
  Transaction.DefaultDatabase:=ExeDM.MainDB;
  pFIBStoredProc1:=TpFIBStoredProc.create(self);
  pFIBStoredProc1.Transaction:=Transaction;
  pFIBStoredProc1.StoredProcName:='GAR_CLOSEPERIOD';
  pFIBStoredProc1.Transaction.StartTransaction;
  pFIBStoredProc1.ExecProc;
  pFIBStoredProc1.Transaction.Commit;
  pFIBStoredProc1.Free;
  Transaction.Free;
  SystemDate.Caption := dates.KodSetupToPeriod(Global_Kod_Setup(ExeDM.MainDB.Handle),2);
end;

procedure TExeMainForm.RollBackPeriodBarButtonClick(Sender: TObject);
Var
Transaction:TpFIBTransaction;
pFIBStoredProc1:TpFIBStoredProc;
begin
  Transaction:=TpFIBTransaction.Create(self);
  Transaction.DefaultDatabase:=ExeDM.MainDB;
  pFIBStoredProc1:=TpFIBStoredProc.create(self);
  pFIBStoredProc1.Transaction:=Transaction;
  pFIBStoredProc1.StoredProcName:='GAR_ROLLBACK';
  pFIBStoredProc1.Transaction.StartTransaction;
  pFIBStoredProc1.Prepare;
  //pFIBStoredProc1.ParamByName('ID_AVTO').AsInteger:= Param.ID_AVTO;
  pFIBStoredProc1.ExecProc;
  pFIBStoredProc1.Transaction.Commit;
  pFIBStoredProc1.Free;
  Transaction.Free;
  SystemDate.Caption := dates.KodSetupToPeriod(Global_Kod_Setup(ExeDM.MainDB.Handle),2);
end;


procedure TExeMainForm.VedomostBarButtonClick(Sender: TObject);
var Param:TgarSimpleParamMode;
begin
  Param:=TgarSimpleParamMode.Create();
  Param.DB_Handle:=ExeDM.MainDB.Handle;
  Param.Owner:=self;
  LoadPackageGarage(Param, Name_Gar_Ved);
  Param.Destroy;
end;

procedure TExeMainForm.FactorToplBarButtonClick(Sender: TObject);
var Param:TgarSimpleParamMode;
begin
Param:=TgarSimpleParamMode.Create();
Param.DB_Handle:=ExeDM.MainDB.Handle;
Param.Owner:=self;
Param.fs:=garfsInsert;
LoadPackageGarage(Param, Name_Gar_Sp_Factor);
end;

procedure TExeMainForm.VedomAvtoBarButtonClick(Sender: TObject);
var Param:TgarSimpleParamMode;
begin
  Param:=TgarSimpleParamMode.Create();
  Param.DB_Handle:=ExeDM.MainDB.Handle;
  Param.Owner:=self;
  LoadPackageGarage(Param, Name_Gar_Comulative_HelpList);
  Param.Destroy
end;

procedure TExeMainForm.dxBarButton20Click(Sender: TObject);
var res:integer;
begin

end;

procedure TExeMainForm.FilterSeriesBarButtonClick(Sender: TObject);
var
  Param      : TgarSimpleParamMode;
  s          : string;
  HandlePack : HModule;
begin
  Param           := TgarSimpleParamMode.Create();
  Param.DB_Handle := ExeDM.MainDB.Handle;
  Param.Owner     := self;
  Param.fs        := garfsEdit;
  LoadPackageGarage(Param, Name_Gar_FilterWaybill);
end;

end.
