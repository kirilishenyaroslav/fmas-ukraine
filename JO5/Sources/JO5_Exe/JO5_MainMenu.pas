unit JO5_MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JO5_Types, dxBarExtItems, dxBar, dxDockControl, pFIBErrorHandler,
  cxGraphics, cxControls, dxStatusBar, ImgList, JO5_PackageLoad,
  JO5_DataModule, JO5_PackageConst, SysAdmin, Jo5_Proc, Jo5_Message, Jo5_Consts,
  Jo5_dmService, AppEvnts, fib, StdCtrls;

type
  TfMainMenu = class(TForm)
    brmMain: TdxBarManager;
    mnuWork: TdxBarSubItem;
    smnWatchJO5: TdxBarButton;
    smnInputProvs: TdxBarButton;
    smnImportProvs: TdxBarButton;
    smnCreateOstatki: TdxBarButton;
    mnuHelp: TdxBarSubItem;
    smnHelp: TdxBarButton;
    mnuExit: TdxBarButton;
    smnAbout: TdxBarButton;
    mnuService: TdxBarSubItem;
    mnuReports: TdxBarSubItem;
    smnNextPeriod: TdxBarButton;
    smnPrtJournal: TdxBarButton;
    smnPreviousPeriod: TdxBarButton;
    mnuCurrPeriod: TdxBarStatic;
    Images: TImageList;
    dxStatusBar: TdxStatusBar;
    mnuParams: TdxBarSubItem;
    smnSchImpParam: TdxBarButton;
    ApplicationEvents1: TApplicationEvents;
    Label1: TLabel;
    dxBarButton1: TdxBarButton;
    dxBarInPlaceSubItem1: TdxBarInPlaceSubItem;
    dxBarButton2: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    procedure smnWatchJO5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxStatusBarResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure smnPrtJournalClick(Sender: TObject);
    procedure smnHelpClick(Sender: TObject);
    procedure smnNextPeriodClick(Sender: TObject);
    procedure smnPreviousPeriodClick(Sender: TObject);
    procedure smnInputProvsClick(Sender: TObject);
    procedure smnImportProvsClick(Sender: TObject);
    procedure smnSchImpParamClick(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
  private
    { Private declarations }
    PUser:TJo5AccessResult;
    PLanguageIndex:byte;
    PSysInfo:TJo5SysInfo;
  public
    { Public declarations }
    property User:TJo5AccessResult read PUser write PUser;
    property SysInfo:TJo5SysInfo read PSysInfo write PSysInfo;
  end;

var
  fMainMenu: TfMainMenu;

implementation

{$R *.dfm}

uses Dates, GlobalSpr, uneTypes, AccMGMT, Jo5setFormUch, BaseTypes, PrintMOParams;

procedure TfMainMenu.smnWatchJO5Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Menu/JO5_Menu_Work/JO5_Menu_Work_Jrnl','Belong')=0
     then begin //yes
                LoadRegSch(Self,JO5_DM.JO5_DB.Handle,SysInfo);

     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TfMainMenu.FormShow(Sender: TObject);
begin
 dxStatusBar.Panels[1].Text:=User.DbPath;
 dxStatusBar.Panels[2].Text:= User.User_Fio;
 dxStatusBar.Panels[3].Text:=DateToStr(Date);
end;

procedure TfMainMenu.dxStatusBarResize(Sender: TObject);
begin
 dxStatusBar.Panels[1].Width:=Round(dxStatusBar.Width/3);;
 dxStatusBar.Panels[2].Width:=Round(dxStatusBar.Width/5);
 dxStatusBar.Panels[3].Width:=Round(dxStatusBar.Width/10);
 dxStatusBar.Panels[4].Width:=Round(dxStatusBar.Width/10);
 dxStatusBar.Panels[0].Width:=dxStatusBar.Width-dxStatusBar.Panels[1].Width-dxStatusBar.Panels[2].Width-dxStatusBar.Panels[3].Width-dxStatusBar.Panels[4].Width-10;
end;

procedure TfMainMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Jo5ShowMessage(ExitBtn_Caption[PLanguageIndex], Q_DoYouWantExit_Text[PLanguageIndex] ,mtConfirmation,[mbYes,mbNo])=mrYes then
 begin
   FinalizeAdminSystem;
   Jo5_CloseAllWindows;
   JO5_DM.JO5_DB.DefaultTransaction.Active:=False;
   Action:=caFree;
 end
else
 Action:=caNone;
end;

procedure TfMainMenu.FormCreate(Sender: TObject);
begin
     with TfrmSetFormUch.Create(self, JO5_DM.JO5_DB.Handle, AccMGMT.GetUserId) do
     begin
           if FormUchDataSet.RecordCount>1
           then begin
                     if ShowModal=MrYes
                     then begin
                               PLanguageIndex:=IndexLanguage;
                               WindowState:=wsMaximized;
                               PSysInfo:=GetSysInfo(Self, JO5_DM.JO5_DB.Handle,Integer(ItemsListBox.Items.Objects[ItemsListBox.ItemIndex]));
                               JO5_DM.JO5_DB.DefaultTransaction.Active:=True;

                               if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Systems/JO5_Sys_'+IntToStr(PSysInfo.id_system),'Belong')=0
                               then begin //yes
                                         InitializaAdminSystem(Self, JO5_DM.JO5_DB.Handle, 9999 ,AccMGMT.GetUserId, false);

                                        //******************************************************************************
                                         self.Caption:=PSysInfo.SystemName;//Application_Caption[PLanguageIndex];
                                        //******************************************************************************
                                         mnuCurrPeriod.Caption:=LabelCurrPeriod_Caption[PLanguageIndex]
                                                                +': '+KodSetupToPeriod(PSysInfo.KodSetup,4);

                                         Label1.Caption:=PSysInfo.SystemName;
                               end
                               else begin
                                         BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
                                         Application.Terminate;
                               end;



                     end
                     else begin
                              Application.Terminate;
                     end;
                     Free;
           end
           else begin
                     dxBarButton2.Visible:=ivNever;
                     PLanguageIndex:=IndexLanguage;
                     WindowState:=wsMaximized;
                     PSysInfo:=GetSysInfo(Self, JO5_DM.JO5_DB.Handle,Integer(ItemsListBox.Items.Objects[0]));
                     JO5_DM.JO5_DB.DefaultTransaction.Active:=True;

                     if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Systems/JO5_Sys_'+IntToStr(PSysInfo.id_system),'Belong')=0
                     then begin //yes
                               InitializaAdminSystem(Self, JO5_DM.JO5_DB.Handle, 9999 ,AccMGMT.GetUserId, false);

                              //******************************************************************************
                               self.Caption:=PSysInfo.SystemName;//Application_Caption[PLanguageIndex];
                              //******************************************************************************
                               mnuCurrPeriod.Caption:=LabelCurrPeriod_Caption[PLanguageIndex]
                                                      +': '+KodSetupToPeriod(PSysInfo.KodSetup,4);

                               Label1.Caption:=PSysInfo.SystemName;
                     end
                     else begin
                               BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
                               Application.Terminate;
                     end;
           end;
      end;
end;

procedure TfMainMenu.mnuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMainMenu.smnPrtJournalClick(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Menu/JO5_Menu_Report/JO5_Menu_Report_Prn','Belong')=0
     then begin //yes
                   LoadPrintJournal(Self,fsModal,JO5_DM.JO5_DB.Handle,JO5_DM.Transaction.Handle,
                   SysInfo.DateFirstImport,SysInfo.CurrDate,SysInfo.DefCaseKey);
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї функції?',mtWarning,[mbOk]);
     end;
end;

procedure TfMainMenu.smnHelpClick(Sender: TObject);
begin
  MessageBox( Handle, 'Находиться на стадии разработки', 'Информация', MB_OK or MB_ICONINFORMATION );
end;

procedure TfMainMenu.smnNextPeriodClick(Sender: TObject);
var pDM:TJO5_ServiceDM;
  Res:Integer;
  pRegSch:TForm;
begin
     if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Menu/JO5_Menu_Service','Belong')=0
     then begin //yes
                pDM:=TJO5_ServiceDM.Create(Application,JO5_DM.JO5_DB.Handle);
                Res:=pDM.NextPeriod(SysInfo.id_system);
                if Res>-1 then
                  begin
                    PSysInfo.KodSetup:=Res;
                    PSysInfo.CurrDate:=ConvertKodToDate(Res);
                     mnuCurrPeriod.Caption:=LabelCurrPeriod_Caption[PLanguageIndex]
                                      +': '+KodSetupToPeriod(PSysInfo.KodSetup,4);
                  end;
                pDM.Free;
                pRegSch:=MDIGetForm('TfRegSch');
                if pRegSch<>nil then
                  pRegSch.Close;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї функції?',mtWarning,[mbOk]);
     end;
end;

procedure TfMainMenu.smnPreviousPeriodClick(Sender: TObject);
var pDM:TJO5_ServiceDM;
  Res:Integer;
  pRegSch:TForm;
begin
     if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Menu/JO5_Menu_Service','Belong')=0
     then begin //yes
                pDM:=TJO5_ServiceDM.Create(Application,JO5_DM.JO5_DB.Handle);
                Res:=pDM.PrevPeriod(SysInfo.id_system);
                if Res>-1 then
                  begin
                    PSysInfo.KodSetup:=Res;
                    PSysInfo.CurrDate:=ConvertKodToDate(Res);
                     mnuCurrPeriod.Caption:=LabelCurrPeriod_Caption[PLanguageIndex]
                                      +': '+KodSetupToPeriod(PSysInfo.KodSetup,4);
                  end;
                pDM.Free;
                pRegSch:=MDIGetForm('TfRegSch');
                if pRegSch<>nil then
                  pRegSch.Close;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї функції?',mtWarning,[mbOk]);
     end;
end;
procedure TfMainMenu.smnInputProvsClick(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Menu/JO5_Menu_Work/JO5_Menu_Work_Docs','Belong')=0
     then begin //yes
                GlobalSpr.GetProvs( Self,JO5_DM.JO5_DB.Handle,SysInfo.CurrDate, 0,User.ID_User,User.Name_user,User.User_Password, SysInfo.id_system);

     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;
end;

procedure TfMainMenu.smnImportProvsClick(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Menu/JO5_Menu_Work/JO5_Menu_Work_Import','Belong')=0
     then begin //yes
                GlobalSpr.ZDocImportAppRun(Self,JO5_DM.JO5_DB.Handle,User.ID_User, SysInfo.id_system);
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї функції?',mtWarning,[mbOk]);
     end;
end;

procedure TfMainMenu.smnSchImpParamClick(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Menu/JO5_Menu_Params','Belong')=0
     then begin //yes
                GlobalSpr.ZDocImportConfigure(Self,JO5_DM.JO5_DB.Handle,User.ID_User);

     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї функції?',mtWarning,[mbOk]);
     end;
end;

procedure TfMainMenu.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var
temp_s:string;
begin
    if E is EFIBInterBaseError
    then begin
          if EFIBInterbaseError(E).SQLCode = -902
          then begin
                    temp_s:=EFIBInterbaseError(E).Message + 'Произошёл обрыв связи с сервером, обратитесь к администратору.';
                    MessageBox(Application.Handle,Pchar(temp_s),'Внимание!',MB_OK);
                    Application.Terminate;
          end
    end;
end;

procedure TfMainMenu.dxBarButton2Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Menu/JO5_Menu_Work/JO5_Menu_Work_ChgFU','Belong')=0
     then begin //yes
               with TfrmSetFormUch.Create(self, JO5_DM.JO5_DB.Handle, AccMGMT.GetUserId) do
               begin
                     if ShowModal=MrYes
                     then begin
                               PSysInfo:=GetSysInfo(Self, JO5_DM.JO5_DB.Handle,Integer(ItemsListBox.Items.Objects[ItemsListBox.ItemIndex]));

                               if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Systems/JO5_Sys_'+IntToStr(PSysInfo.id_system),'Belong')=0
                               then begin //yes
                                          //******************************************************************************
                                           self.Caption:=PSysInfo.SystemName;//Application_Caption[PLanguageIndex];
                                          //******************************************************************************
                                           mnuCurrPeriod.Caption:=LabelCurrPeriod_Caption[PLanguageIndex]
                                                                  +': '+KodSetupToPeriod(PSysInfo.KodSetup,4);

                                           Label1.Caption:=PSysInfo.SystemName;
                               end
                               else begin
                                           BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
                               end;
                     end
               end;
     end
     else begin

     end;

end;

procedure TfMainMenu.dxBarButton3Click(Sender: TObject);
var Parameter:TJo5Object;
begin
if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Menu/JO5_Menu_Work/JO5_Menu_Work_Remn','Belong')=0 then
begin //yes
  Parameter := TJo5Object.Create;
  Parameter.DB_Handle := Jo5_DM.Jo5_DB.Handle;
  Parameter.Owner := self;
  Parameter.User:=PUser;
  Parameter.id_system:=PSysInfo.id_system;
  DoFunctionFromPackage(Parameter,Bpl_Jo5_WorkRemnants);
  Parameter.Destroy;
end
else
  BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
end;

procedure TfMainMenu.dxBarButton4Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/USERS_JO5_TMP/JO5_Menu/JO5_Menu_Report/JO5_Menu_Report_Prn','Belong')=0
     then begin //yes
                with TfrmGetMOParams.Create(self, JO5_DM.JO5_DB.Handle,PSysInfo.id_system) do
                begin
                     ShowModal;
                     Free;
                end;
     end
     else begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї функції?',mtWarning,[mbOk]);
     end;

end;

end.
