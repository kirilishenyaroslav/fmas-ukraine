unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, FIBDatabase, pFIBDatabase, ExtCtrls,
  ComCtrls, ImgList,TypInfo,IBase,DB,
  RxMemDS , GlobalSPR, ToolWin, StdCtrls ,pFibQuery , SysAdmin,
  Registry,pfibDataset, dxBar, dxBarExtItems, cxGraphics, cxControls,
  dxStatusBar, AppStruClasses, AppEvnts, fib;


const lbcpshift:Integer=60;

type



TfrmMainForm = class(TForm)
    Images: TImageList;
    Timer1: TTimer;
    lbCurPerriod: TLabel;
    lbNativeCustomer: TLabel;
    dxBarManager1: TdxBarManager;
    N1: TdxBarButton;
    N2: TdxBarButton;
    N21: TdxBarButton;
    new1: TdxBarSubItem;
    N29: TdxBarButton;
    N14: TdxBarButton;
    N36: TdxBarButton;
    N37: TdxBarButton;
    N33: TdxBarButton;
    N26: TdxBarButton;
    N10: TdxBarButton;
    DBF1: TdxBarButton;
    N24: TdxBarButton;
    N9: TdxBarSubItem;
    N11: TdxBarButton;
    N46: TdxBarButton;
    N18: TdxBarButton;
    N34: TdxBarButton;
    N15: TdxBarButton;
    N19: TdxBarButton;
    N30: TdxBarButton;
    N31: TdxBarButton;
    AdminItem: TdxBarSubItem;
    N25: TdxBarSubItem;
    N41: TdxBarButton;
    N40: TdxBarButton;
    N4: TdxBarButton;
    N5: TdxBarButton;
    N6: TdxBarButton;
    N3: TdxBarSubItem;
    N28: TdxBarButton;
    N13: TdxBarButton;
    dxBarDateCombo1: TdxBarDateCombo;
    dxStatusBar1: TdxStatusBar;
    dxBarButton1: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    ApplicationEvents1: TApplicationEvents;
    BarButton_BalanceReport: TdxBarButton;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure BarButton_BalanceReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_user:Integer;
    login : string;
    user  : string;
  end;

var frmMainForm:TfrmMainForm;

implementation

uses dmMain_Book, BaseTypes, Win2DosImprt, UGetFormUch, Kernel, AccMGMT, About, MDIChildFormsBar;

{$R *.dfm}

procedure TfrmMainForm.N1Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Spravochnik/MB_M_BalansSch','Belong')=0 then
        GlobalSpr.GetSch( self, dmmain.MainDatabase.Handle, FSMdiChild,dmmain.MAIN_BOOK_DATE, DEFAULT_ROOT_ID,0,0)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N2Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Spravochnik/MB_M_ObjetsProp','Belong')=0 then
        GlobalSpr.GetPropertiesSpr( self, dmMain.MainDatabase.Handle, dmmain.MAIN_BOOK_DATE)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N4Click(Sender: TObject);
begin
     Cascade;
end;

procedure TfrmMainForm.N5Click(Sender: TObject);
begin
          TileMode:=tbVertical;
          Tile;
end;

procedure TfrmMainForm.FormShow(Sender: TObject);
var NativeCusiInfo:TpfibDataset;
begin
          dxStatusBar1.Panels[0].Text:='Підключення до '+dmMain.MainDatabase.DatabaseName;

          InitializaAdminSystem(self, dmmain.MainDatabase.Handle, 22, dmMain.id_user_dm);

          NativeCusiInfo:=TpfibDataset.Create(self);
          NativeCusiInfo.Database:=dmMain.MainDatabase;
          NativeCusiInfo.Transaction:=dmMain.ReadTransaction;
          NativeCusiInfo.SelectSQL.Text:='select cust.SHORT_NAME as NAME from PUB_SYS_DATA s, PUB_SP_CUSTOMER cust where cust.ID_CUSTOMER = s.ORGANIZATION ';
          NativeCusiInfo.Open;
          NativeCusiInfo.FetchAll;
          if (NativeCusiInfo.RecordCount>0)
          then begin
                    lbNativeCustomer.Caption:=NativeCusiInfo.FieldByName('NAME').AsString;
                    lbNativeCustomer.Update;
          end;
          NativeCusiInfo.Close;
          NativeCusiInfo.Free;
end;

procedure TfrmMainForm.N6Click(Sender: TObject);
begin
     TileMode:=tbHorizontal;
     Tile;
end;

procedure TfrmMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var  i:integer;
     reg:TRegistry;
begin
  for i:=0 to self.MDIChildCount-1 do
  begin
     if (MDIChildren[i].Owner as TForm).Handle=self.Handle
     then begin
          MDIChildren[i].Release;
     end;
  end;

  reg:=TRegistry.Create;
  try
     reg.RootKey:=HKEY_CURRENT_USER;
     if   reg.OpenKey('\Software\Budgeting\ALL_DOC_DBF_PATH\',true)
     then reg.WriteString('ALL_DOC_DBF_PATH','');

     if   reg.OpenKey('\Software\Budgeting\ALL_PROV_DBF_PATH\',true)
     then reg.WriteString('ALL_PROV_DBF_PATH','');

  finally
     reg.Free;
  end;

  FinalizeAdminSystem;
end;

procedure TfrmMainForm.FormCreate(Sender: TObject);
var  t : TzMDITool;
begin
     //self.WindowMenu:=N3;
     lbCurPerriod.Top:=self.ClientHeight-lbcpshift;
     lbCurPerriod.Caption:=lbCurPerriod.Caption+' '+DateToStr(dmMain.MAIN_BOOK_DATE);
     t := TzMDITool.Create(N3);
     SendMessage(handle,WM_SIZE,SIZE_MAXIMIZED,0);

     if (not dmMain.USE_MO)
     then begin
               dxbarButton3.Visible:=tdxbaritemvisible(false);
               dxbarButton4.Visible:=tdxbaritemvisible(false);
               dxbarButton6.Visible:=tdxbaritemvisible(false);
     end
     else begin
               dxBarButton2.Visible:=tdxbaritemvisible(false);
     end
end;

procedure TfrmMainForm.N29Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_System/MB_M_S_SaldBalanSch','Belong')=0 then
        GlobalSPR.GetSchSaldo(self,dmmain.MainDatabase.Handle,dmmain.MAIN_BOOK_DATE,DEFAULT_ROOT_ID)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);

end;

procedure TfrmMainForm.N30Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Config/MB_M_C_WorkSUsers','Belong')=0 then
        AdminShowUsers(self)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N31Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Config/MB_M_C_WorkSErrors','Belong')=0 then
        AdminShowErrors(self)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;


procedure TfrmMainForm.N33Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_System/MB_M_S_WorkMBDocs','Belong')=0 then
        GlobalSpr.GetProvs(self, dmMain.MainDatabase.handle, dmmain.MAIN_BOOK_DATE,0,id_user,login,user,1)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N34Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Config/MB_M_C_AnalitBalRah','Belong')=0 then
        GlobalSpr.GetSchAnalitic(self,dmmain.MainDatabase.Handle,fsMdiChild)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N19Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Config/MB_M_C_ConPropBalRah','Belong')=0 then
        GlobalSPR.GetSchAnalize(self,dmmain.MainDatabase.Handle,dmmain.MAIN_BOOK_DATE,DEFAULT_ROOT_ID)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N40Click(Sender: TObject);
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

procedure TfrmMainForm.N18Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Config/MB_M_C_ConAnilitic','Belong')=0 then
        GlobalSPR.GetIniAnalitic(self,dmmain.MainDatabase.Handle,fsMdichild)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N10Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_System/MB_M_S_MBWork','Belong')=0 then
        GlobalSPR.GetMBOOK(self,dmmain.MainDatabase.Handle)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N11Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Config/MB_M_C_ConMB','Belong')=0 then
        GlobalSpr.GetSysOpt(self,dmmain.MainDatabase.handle)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.Timer1Timer(Sender: TObject);
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

procedure TfrmMainForm.ToolButton2Click(Sender: TObject);
begin
      N1Click(self);
end;

procedure TfrmMainForm.ToolButton1Click(Sender: TObject);
begin
      N2Click(self);
end;

procedure TfrmMainForm.ToolButton3Click(Sender: TObject);
begin
      N11Click(Self);
end;

procedure TfrmMainForm.ToolButton4Click(Sender: TObject);
begin
      //N46Click(self);
end;

procedure TfrmMainForm.ToolButton5Click(Sender: TObject);
begin
      N34Click(Self);
end;

procedure TfrmMainForm.ToolButton7Click(Sender: TObject);
begin
      N18Click(Self);
end;

procedure TfrmMainForm.ToolButton11Click(Sender: TObject);
begin
      N33Click(self);
end;

procedure TfrmMainForm.ToolButton9Click(Sender: TObject);
begin
      N10Click(self);
end;

procedure TfrmMainForm.ToolButton10Click(Sender: TObject);
begin
      N29Click(self);
end;

procedure TfrmMainForm.N15Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Config/MB_M_C_ConCorespond','Belong')=0 then
        GlobalSpr.GetOMatrix(self, dmMain.MainDatabase.handle, dmmain.MAIN_BOOK_DATE)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N13Click(Sender: TObject);
begin
   if BaseTypes.agMessageDlg('Увага!','Ви дійсно бажаєте завершити роботу з системою "Головна книга"?',mtWarning,[mbYes, mbNo])=mrYes
   then Close;
end;

procedure TfrmMainForm.N14Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_System/MB_M_S_AnalisOborot','Belong')=0 then
        GlobalSpr.GetOborAnalize(self,dmMain.MainDatabase.Handle,id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N21Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Spravochnik/MB_M_Currency','Belong')=0 then
        GlobalSpr.GetValute(self,dmMain.MainDatabase.Handle,fsMdiChild,0,id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N26Click(Sender: TObject);
var ffmGetSystem: TffmGetSystem;
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_System/MB_M_S_WorkDocsKor','Belong')=0 then
    begin
         //необходимо выбрать форму учета в рамках которой будет проходить корректировка
        ffmGetSystem:=TffmGetSystem.Create(self);
        if ffmGetSystem.ShowModal=mrYes
        then begin
                  GlobalSpr.GetProvs(self, dmMain.MainDatabase.handle, dmmain.MAIN_BOOK_DATE,0,id_user,login,user,ffmGetSystem.GetSystemDataSet.FieldByName('ID_SYSTEM').Value);
        end;
        ffmGetSystem.Free;
    end
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N35Click(Sender: TObject);
begin
     GlobalSpr.GetMBookReports(self,dmMain.MainDatabase.handle,id_user);
end;

procedure TfrmMainForm.N36Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_System/MB_M_S_AnalisOstat','Belong')=0 then
        GlobalSpr.GetMOst(self,dmMain.MainDatabase.Handle,id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N37Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_System/MB_M_S_AnalisZadolgn','Belong')=0 then
        GlobalSpr.GetKrDbZ(self,dmMain.MainDatabase.Handle,id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.FormResize(Sender: TObject);
begin
     lbCurPerriod.Top:=self.ClientHeight-lbcpshift;
end;

procedure TfrmMainForm.N28Click(Sender: TObject);
var T:TAboutBox;
begin
     T:=TAboutBox.Create(self);
     T.ShowModal;
     T.Free;
end;

procedure TfrmMainForm.dxBarButton2Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Reports/MB_M_REP_DocReestr','Belong')=0 then
        GlobalSpr.GetMBookReports(self,dmMain.MainDatabase.Handle,id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.dxBarButton3Click(Sender: TObject);
var   PC: TFMASAppModule;
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Reports/MB_M_REP_MemOrderMM','Belong')=0 then
    begin
      with TFMASAppModuleCreator.Create do
      begin
              PC :=CreateFMASModule(ExtractFilePath(Application.ExeName)+'Kernell\','mo_mainbook');
              if (PC<>nil)
              then begin
                        PC.InParams.Items['AOwner']  :=@self;
                        PC.InParams.Items['DbHandle']:=PInteger(@dmMain.MainDatabase.Handle);
                        PC.InParams.Items['Id_User'] :=PInteger(@id_user);
                        (PC as IFMASModule).Run;
              end
              else agMessageDlg('Увага!','Помилка при работі з бібліотекою mo_mainbook.bpl',mtError,[mbOk]);
      end;
    end else  BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.dxBarButton4Click(Sender: TObject);
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Reports/MB_M_REP_FormsFinRep','Belong')=0 then
        GlobalSpr.GetFinForms(self,dmMain.MainDatabase.Handle,id_user)
    else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.dxBarButton6Click(Sender: TObject);
var   PC: TFMASAppModule;
begin
    if fibCheckPermission('/ROOT/Kernell/MBook/MBook_Menu/MB_Menu_Reports/MB_M_REP_MemOrderaMB','Belong')=0 then
    begin
      with TFMASAppModuleCreator.Create do
      begin
              PC :=CreateFMASModule(ExtractFilePath(Application.ExeName)+'Kernell\','mo_17form');
              if (PC<>nil)
              then begin
                        PC.InParams.Items['AOwner']  :=@self;
                        PC.InParams.Items['DbHandle']:=PInteger(@dmMain.MainDatabase.Handle);
                        PC.InParams.Items['Id_User'] :=PInteger(@id_user);
                        (PC as IFMASModule).Run;
              end
              else agMessageDlg('Увага!','Помилка при работі з бібліотекою mo_14form.bpl',mtError,[mbOk]);
      end;
    end else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.FormDblClick(Sender: TObject);
{var   PC: TFMASAppModule;
      id_order_type:integer;
      Key_session:Int64;
      Count:Integer;}
begin
{      with TFMASAppModuleCreator.Create do
      begin
              PC :=CreateFMASModule(ExtractFilePath(Application.ExeName)+'up\','up_filter');
              if (PC<>nil)
              then begin
                        //Инициализация входящих параметров
                        id_order_type                      := 1;
                        key_session                        :=-1;
                        PC.InParams.Items['AOwner']        :=@self;
                        PC.InParams.Items['DbHandle']      :=PInteger(@dmMain.MainDatabase.Handle);
                        PC.InParams.Items['Id_User']       :=PInteger(@id_user);
                        PC.InParams.Items['Id_order_type'] :=PInteger(@id_order_type);
                        PC.InParams.Items['KEY_SESSION']   :=PInt64(@Key_session);


                        //Работа модуля
                        (PC as IFMASModule).Run;


                        //Получение выходящих параметров
                        Count:=PInteger(PC.OutParams.Items['Count'])^;
                        ShowMessage(IntToStr(Count));
              end
              else agMessageDlg('Увага!','Помилка при работі з бібліотекою up_filter.bpl',mtError,[mbOk]);
      end;}
end;

procedure TfrmMainForm.ApplicationEvents1Exception(Sender: TObject; E: Exception);
var
  temp_s:string;
begin
    if E is EFIBInterBaseError then begin
         if EFIBInterbaseError(E).SQLCode = -902 then begin
               temp_s:=EFIBInterbaseError(E).Message + 'Відбувся обрив зв`язку з сервером, зверніться до адміністратора.';
               MessageBox(Application.Handle,Pchar(temp_s),'Увага!',MB_OK);
               Application.Terminate;
         end
    end
    else  ShowMessage(E.Message);
end;

procedure TfrmMainForm.BarButton_BalanceReportClick(Sender: TObject);
begin
    globalspr.getBalance(Self,dmMain.MainDatabase.Handle,id_user);
end;

end.




