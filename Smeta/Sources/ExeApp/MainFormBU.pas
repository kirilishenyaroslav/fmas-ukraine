unit MainFormBU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, FIBDatabase, pFIBDatabase, ExtCtrls,
  ComCtrls, ImgList,TypInfo,IBase,DB,
  RxMemDS , GlobalSPR, dxDockControl, pFIBErrorHandler,SysAdmin, dxBar,
  dxBarConverter, cxGraphics, cxControls, dxStatusBar, dxBarExtItems,
  Halcn6db, accmgmt, pFibDataSet, AppStruClasses, AppEvnts, fib, Check_User;

type

TfrmMainFormBU = class(TForm)
    Images: TImageList;
    Timer1: TTimer;
    pFibErrorHandler1: TpFibErrorHandler;
    dxDockingManager1: TdxDockingManager;
    dxBarManager1: TdxBarManager;
    N20: TdxBarButton;
    N2: TdxBarButton;
    N21: TdxBarButton;
    N1: TdxBarButton;
    N11: TdxBarButton;
    N15: TdxBarButton;
    new1: TdxBarSubItem;
    HTML1: TdxBarButton;
    N10: TdxBarButton;
    N23: TdxBarButton;
    N30: TdxBarButton;
    N28: TdxBarButton;
    N22: TdxBarButton;
    N8: TdxBarSubItem;
    N17: TdxBarButton;
    N18: TdxBarButton;
    N9: TdxBarSubItem;
    N14: TdxBarButton;
    N16: TdxBarButton;
    N34: TdxBarButton;
    N31: TdxBarButton;
    N32: TdxBarButton;
    N25: TdxBarSubItem;
    N13: TdxBarSubItem;
    N41: TdxBarButton;
    N40: TdxBarButton;
    N4: TdxBarButton;
    N5: TdxBarButton;
    N6: TdxBarButton;
    N3: TdxBarSubItem;
    N26: TdxBarButton;
    N24: TdxBarButton;
    dxStatusBar1: TdxStatusBar;
    dxBarDateCombo1: TdxBarDateCombo;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    HalcyonDataSet1: THalcyonDataSet;
    OpenDialog1: TOpenDialog;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    WizardTimer: TTimer;
    dxBarButton5: TdxBarButton;
    ApplicationEvents1: TApplicationEvents;
    dxBarButton6: TdxBarButton;
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure HTML1Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure WizardTimerTimer(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure dxBarButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    id_user:Integer;
    id_pcard:integer;
    PC: TFMASAppModule;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

var frmMainFormBU:TfrmMainFormBU;

implementation

uses dmMain_Bookbu, Kernel, About, MDIChildFormsBar, BaseTypes, DateUtils;

{$R *.dfm}



procedure TfrmMainFormBU.N4Click(Sender: TObject);
begin
          Cascade;
end;

procedure TfrmMainFormBU.N5Click(Sender: TObject);
begin
          TileMode:=tbVertical;
          Tile;
end;

procedure TfrmMainFormBU.FormShow(Sender: TObject);
begin
          dxStatusBar1.Panels[0].Text:=dmMainbu.MainDatabase.DatabaseName;
          InitializaAdminSystem(self,
                           dmmainbu.MainDatabase.Handle,
                           33, dmmainbu.id_user_dm);

end;

procedure TfrmMainFormBU.N6Click(Sender: TObject);
begin
     TileMode:=tbHorizontal;
     Tile;
end;

procedure TfrmMainFormBU.N22Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Work/Bg_M_W_OstatkiBudget','BELONG')=0 then
        GlobalSpr.GetSmRest(self,dmMainbu.MainDatabase.handle,id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.FormClose(Sender: TObject;
  var Action: TCloseAction);
var  i:integer;
begin
  for i:=0 to self.MDIChildCount-1 do
  begin
     if (MDIChildren[i].Owner as TForm).Handle=self.Handle
     then begin
               MDIChildren[i].Release;
     end;
  end;

  FinalizeAdminSystem;
end;

procedure TfrmMainFormBU.FormCreate(Sender: TObject);
var  //p : TzMDITool;
     t : TzMDITool;
     SysInfoDataSet:TpFibDataSet;
begin
     {SetWindowLong(Application.Handle, GWL_EXSTYLE,
                   GetWindowLong(Application.Handle, GWL_EXSTYLE)
                   or WS_EX_TOOLWINDOW and
                   not WS_EX_APPWINDOW or WS_EX_TOPMOST);}

     //self.WindowMenu:=N3;
     SendMessage(handle,WM_SIZE,SIZE_MAXIMIZED,0);
     //p := TzMDITool.Create(N3);
     t := TzMDITool.Create(dxBarManager1);

     with TFMASAppModuleCreator.Create do
     begin
          if not Assigned(PC)
          then PC :=CreateFMASModule(ExtractFilePath(Application.ExeName)+'Smeta\','SmGlobalWizard');
     end;

     SysInfoDataSet:=TpFibDataSet.Create(self);
     SysInfoDataSet.Database:=dmmainbu.MainDatabase;
     SysInfoDataSet.Transaction:=dmmainbu.ReadTransaction;
     SysInfoDataSet.SelectSQL.Text:='SELECT * FROM BU_INI';
     SysInfoDataSet.Open;
     if (SysInfoDataSet.RecordCount>0)
     then begin
               if (SysInfoDataSet.FieldByName('USE_GLOBAL_WIZARD').Value=1)
               then begin
                          if PC<>nil
                          then begin
                                    WizardTimer.Enabled:=True;
                          end;
               end;
     end;
     SysInfoDataSet.Close;
     SysInfoDataSet.Free;
end;

procedure TfrmMainFormBU.N21Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Spravochnik/Bg_M_SP_RozdStatey','BELONG')=0 then
        GetRazdStSpr(self, dmMainbu.MainDatabase.Handle,fsMDIChild, dmmainbu.MAIN_BOOK_DATE, DEFAULT_ROOT_ID,allData,cmNone)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainFormBU.N20Click(Sender: TObject);
var Filter:TSmetaFilterValues;
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Spravochnik/Bg_M_SP_Budget','BELONG')=0 then
    begin
        Filter.DateFilter:=false;
        Filter.GroupFilter:=false;
        GlobalSPR.GetSmetaSpr(self, dmMainbu.MainDatabase.handle,fsMDIChild, dmmainbu.MAIN_BOOK_DATE,Filter,id_user);
    end else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;



procedure TfrmMainFormBU.N30Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Work/Bg_M_W_ReesrtFormul','BELONG')=0
    then begin
        //showmessage(inttostr(id_user));
        GlobalSPR.GetOtchIntf(self,dmmainbu.MainDatabase.Handle,0,id_user,fsMdiChild)
    end
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);    
end;

procedure TfrmMainFormBU.N40Click(Sender: TObject);
var i:integer;
begin
  for i:=self.MDIChildCount-1 downto 0 do
  begin
     if (MDIChildren[i].Owner as TForm).Handle=self.Handle
     then begin
               MDIChildren[i].Close;
     end;
  end;

end;

procedure TfrmMainFormBU.N2Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Spravochnik/Bg_M_SP_GrBudget','BELONG')=0 then
        GlobalSPR.GetSmGrp(self,dmmainbu.MainDatabase.Handle,fsMdiChild,0,id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainFormBU.Timer1Timer(Sender: TObject);
var
   dc:HDC;
   Cc:TCanvas;
   s:string;
begin

  dc:=GetWindowDC(Handle);
  Cc:=TCanvas.Create;
  cc.Handle:=dc;
  s:=TimeToStr(time);
  cc.Brush.Color:=8388608;
  cc.Font.Size:=10;
  cc.Font.Color:=clWhite;
  cc.TextOut(Width div 2,5,s);
  ReleaseDc(Handle,dc);
end;

procedure TfrmMainFormBU.N11Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Spravochnik/Bg_M_SP_ProgFinance','BELONG')=0 then
        GlobalSPR.GetSmPKV(self,dmmainbu.MainDatabase.Handle,fsMdiChild,0)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);   
end;

procedure TfrmMainFormBU.N15Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Spravochnik/Bg_M_SP_PropBRS','BELONG')=0 then
        GetPropertiesSpr(self,dmMainbu.MainDatabase.Handle,dmmainbu.MAIN_BOOK_DATE)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);      
end;

procedure TfrmMainFormBU.N17Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Report/Bg_M_R_Bud+PeriodFun','BELONG')=0 then
        GlobalSpr.PrintSmetPlusPeriods(self,dmMainbu.MainDatabase.Handle)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.N23Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Work/Bg_M_W_OtchislRasch','BELONG')=0 then
        GlobalSpr.Dotch(self,dmMainbu.MainDatabase.Handle)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.N24Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmMainFormBU.N14Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Config/Bg_M_C_ConSystem','BELONG')=0 then
        GlobalSpr.GetSysOptBu(self,dmMainbu.MainDatabase.Handle)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.HTML1Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Work/Bg_M_W_VykonBudgets','BELONG')=0 then
        GlobalSpr.ShowHtmlReport(self,dmMainbu.MainDatabase.Handle,Id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.N28Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Work/Bg_M_W_DocKoreg','BELONG')=0
    then GlobalSpr.GetProvs(self, dmMainbu.MainDatabase.handle, StartOfTheMonth(Date),0, id_user,'','',10)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.N31Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Config/Bg_M_C_WorkWithUsers','BELONG')=0 then
        AdminShowUsers(self)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.N32Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Config/Bg_M_C_WorkWithError','BELONG')=0 then
        AdminShowErrors(self)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.N10Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Work/Bg_M_W_ZadolgRasch','BELONG')=0 then
        GlobalSpr.CalcBuRests(self,dmMainbu.MainDatabase.Handle,id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.N34Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Config/Bg_M_C_Pererozrah','BELONG')=0 then
        GlobalSpr.DoSmRecalc(self,dmMainbu.MainDatabase.Handle,id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.N1Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Spravochnik/Bg_M_SP_CodovRashod','BELONG')=0 then
        GetKEKVSpr(self, dmMainbu.MainDatabase.Handle,fsMDIChild, dmMainbu.MAIN_BOOK_DATE, DEFAULT_ROOT_ID)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);    
end;

procedure TfrmMainFormBU.N26Click(Sender: TObject);
var T:TAboutBox;
begin
      T:=TAboutBox.Create(self);
      T.ShowModal;
      T.Free;
end;

procedure TfrmMainFormBU.dxBarButton1Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Spravochnik/Bg_M_SP_TypeFinance','BELONG')=0 then
        Globalspr.GetTypeFinance(self,dmMainbu.MainDatabase.Handle,fsMDIChild,id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.dxBarButton2Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Work/Bg_M_W_ObobsenieBudg','BELONG')=0 then
        GlobalSpr.GetSmGlobalization(self,dmMainbu.MainDatabase.Handle,id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.dxBarButton3Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Work/Bg_M_W_WideRepBudget','BELONG')=0 then
        GlobalSpr.GetExtendedSmReport(self,dmMainbu.MainDatabase.Handle)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);     
end;

procedure TfrmMainFormBU.N16Click(Sender: TObject);
begin
     ShowMessage(IntToStr(fibCheckPermission('/ROOT/CloseAllAccess','Belong')));
end;

procedure TfrmMainFormBU.FormDblClick(Sender: TObject);
begin
      accmgmt.fibInitImageConnection('Alex','240645');
end;

constructor TfrmMainFormBU.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
end;

procedure TfrmMainFormBU.WizardTimerTimer(Sender: TObject);
var SysInfoDataSet:TpFIBDataSet;
    FirstOnce:Integer;
begin
     WizardTimer.Enabled:=False;
     SysInfoDataSet:=TpFibDataSet.Create(self);
     SysInfoDataSet.Database:=dmmainbu.MainDatabase;
     SysInfoDataSet.Transaction:=dmmainbu.ReadTransaction;
     SysInfoDataSet.SelectSQL.Text:='SELECT * FROM BU_INI';
     SysInfoDataSet.Open;
     if (SysInfoDataSet.RecordCount>0)
     then begin
               if (SysInfoDataSet.FieldByName('USE_GLOBAL_WIZARD').Value=1)
               then begin
                          if PC<>nil
                          then begin
                                    FirstOnce:=1;
                                    PC.InParams.Items['AOwner']        :=@self;
                                    PC.InParams.Items['DbHandle']      :=PInteger(@dmmainbu.MainDatabase.Handle);
                                    PC.InParams.Items['Id_User']       :=PInteger(@id_user);
                                    PC.InParams.Items['FirstOnce']     :=PInteger(@FirstOnce);


                                    (PC as IFMASModule).Run;
                          end;
               end;
     end;
     SysInfoDataSet.Close;
     SysInfoDataSet.Free;

end;

procedure TfrmMainFormBU.dxBarButton4Click(Sender: TObject);
var FirstOnce:Integer;
begin
    if PC<>nil
    then begin
              FirstOnce:=0;
              PC.InParams.Items['AOwner']        :=@self;
              PC.InParams.Items['DbHandle']      :=PInteger(@dmmainbu.MainDatabase.Handle);
              PC.InParams.Items['Id_User']       :=PInteger(@id_user);
              PC.InParams.Items['FirstOnce']     :=PInteger(@FirstOnce);

              (PC as IFMASModule).Run;
    end;

end;

procedure TfrmMainFormBU.dxBarButton5Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/Budgeting/Budget_Menu/Bg_Menu_Report/Bg_M_R_RepVykBudgets','BELONG')=0 then
        GlobalSpr.PrintSmetaValues(self,dmMainbu.MainDatabase.Handle)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainFormBU.ApplicationEvents1Exception(Sender: TObject; E: Exception);
var
  temp_s:string;
begin
    if E is EFIBInterBaseError then begin
         if EFIBInterbaseError(E).SQLCode = -902 then begin
               temp_s:=EFIBInterbaseError(E).Message + 'Відбувся обрив зв`язку з сервером, зверніться до адміністратора.';
               MessageBox(Application.Handle,Pchar(temp_s),'Увага!',MB_OK);
               Application.Terminate;
         end
    end;
end;

procedure TfrmMainFormBU.dxBarButton6Click(Sender: TObject);
begin
     GlobalSPR.GetEnums(self,dmmainbu.MainDatabase.Handle,fsMdichild);
end;

end.
