unit MainFormFinance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, FIBDatabase, pFIBDatabase, ExtCtrls,
  ComCtrls, ImgList,TypInfo,IBase,DB,
  RxMemDS , GlobalSPR, ToolWin, StdCtrls ,pFibQuery , SysAdmin,
  Registry, dxBar, cxGraphics, cxControls, dxStatusBar, AppStruClasses;

type

TfrmMainForm = class(TForm)
    Images: TImageList;
    Timer1: TTimer;
    dxBarManager1: TdxBarManager;
    N1: TdxBarButton;
    N2: TdxBarButton;
    new1: TdxBarSubItem;
    N8: TdxBarButton;
    N10: TdxBarButton;
    N15: TdxBarButton;
    N16: TdxBarButton;
    N20: TdxBarButton;
    N17: TdxBarButton;
    N21: TdxBarButton;
    N18: TdxBarButton;
    N19: TdxBarButton;
    N11: TdxBarSubItem;
    N14: TdxBarButton;
    N9: TdxBarSubItem;
    N41: TdxBarButton;
    N40: TdxBarButton;
    N4: TdxBarButton;
    N5: TdxBarButton;
    N6: TdxBarButton;
    N3: TdxBarSubItem;
    N13: TdxBarButton;
    dxStatusBar1: TdxStatusBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
  private
    { Private declarations }
    PC     :TFMASAppModule;
    PC_Kow :TFMASAppModule;
  public
    id_user:Integer;
    login : string;
    user  : string;
  end;

var frmMainForm:TfrmMainForm;

implementation

uses dmFinance, BaseTypes, Kernel, AccMGMT;

{$R *.dfm}

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
begin
          InitializaAdminSystem(self,
                                dmmain.MainDatabase.Handle,
                                22, self.id_user);
end;

procedure TfrmMainForm.N6Click(Sender: TObject);
begin
     TileMode:=tbHorizontal;
     Tile;
end;

procedure TfrmMainForm.FormClose(Sender: TObject;
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

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
     SendMessage(handle,WM_SIZE,SIZE_MAXIMIZED,0);

    with TFMASAppModuleCreator.Create do
    begin
         PC    :=CreateFMASModule(ExtractFilePath(Application.ExeName) + 'Zarplata\', 'nachreport');
         PC_Kow:=CreateFMASModule(ExtractFilePath(Application.ExeName) + 'Kernell\', 'kowtoris');

         if (PC = nil)
         then MessageBox(self.Handle, 'Помилка при роботі з модулем nachreport.bpl','Увага!', MB_OK or MB_ICONWARNING);

         if (PC = nil)
         then MessageBox(self.Handle, 'Помилка при роботі з модулем kowtoris.bpl','Увага!', MB_OK or MB_ICONWARNING);

    end;

end;

procedure TfrmMainForm.N30Click(Sender: TObject);
begin
        AdminShowUsers(self);
end;

procedure TfrmMainForm.N31Click(Sender: TObject);
begin
        AdminShowErrors(self);
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

procedure TfrmMainForm.N13Click(Sender: TObject);
begin
     if BaseTypes.agMessageDlg('Увага!','Ви дійсно бажаєте завершити роботу з системою ?',mtWarning,[mbYes, mbNo])=mrYes
     then Close;
end;

procedure TfrmMainForm.N1Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/Kernell/Finance/Finance_Menu/F_Menu_Spravochnik/F_M_SP_CodeRashod','Belong')=0
     then GetKEKVSpr(self, dmFinance.dmMain.MainDatabase.Handle,fsMDIChild, dmFinance.dmMain.MAIN_BOOK_DATE, DEFAULT_ROOT_ID)
     else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N2Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/Kernell/Finance/Finance_Menu/F_Menu_Spravochnik/F_M_SP_ProgFin','Belong')=0
     then GlobalSPR.GetSmPKV(self,dmmain.MainDatabase.Handle,fsMdiChild,0)
     else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N8Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/Kernell/Finance/Finance_Menu/F_Menu_WorkReports/F_M_REP_FormsFinRep','Belong')=0
     then GlobalSPR.GetFinForms(self,dmmain.MainDatabase.Handle,id_user)
     else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N14Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/Kernell/Finance/Finance_Menu/F_Menu_WorkReports/F_M_REP_AnlsOborotiv','Belong')=0
     then GlobalSpr.GetOborAnalize(self,dmMain.MainDatabase.Handle,id_user)
     else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N17Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/Kernell/Finance/Finance_Menu/F_Menu_WorkReports/F_M_REP_CardAnalitic/F_M_REP_Card_Asygnuv','Belong')=0
     then GlobalSpr.GetACardGetAssign(self,dmMain.MainDatabase.Handle,id_user)
     else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.N20Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/Kernell/Finance/Finance_Menu/F_Menu_WorkReports/F_M_REP_CardAnalitic/F_M_REP_Card_FactVyd','Belong')=0
     then GlobalSpr.GetACardFactRasx(self,dmMain.MainDatabase.Handle,id_user)
     else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.dxBarButton1Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/Kernell/Finance/Finance_Menu/F_Menu_Spravochnik/F_M_SP_TypeKostiv','Belong')=0
     then GlobalSpr.GetTypeFinance(self, dmMain.MainDatabase.Handle, fsMdiChild, id_user)
     else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.dxBarButton2Click(Sender: TObject);
begin
     PC.InParams.Items['AOwner'] := @self;
     PC.InParams.Items['DbHandle'] := PInteger(@dmMain.MainDatabase.Handle);
     id_user:=AccMGMT.fibGetCurrentUserInfo.UserID;
     PC.InParams.Items['Id_User'] := PInteger(@id_user);
     (PC as IFMASModule).Run;
end;

procedure TfrmMainForm.N10Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/Kernell/Finance/Finance_Menu/F_Menu_WorkReports/F_M_REP_CardAnalitic/F_M_REP_Card_Rachod','Belong')=0
     then GlobalSpr.GetACardEx(self,dmMain.MainDatabase.Handle,id_user)
     else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);

end;

procedure TfrmMainForm.N19Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/Kernell/Finance/Finance_Menu/F_Menu_WorkReports/F_M_REP_CardAnalitic/F_M_REP_Card_Rachod','Belong')=0
     then GlobalSpr.GetACardKassaKV(self,dmMain.MainDatabase.Handle,id_user)
     else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.dxBarButton4Click(Sender: TObject);
begin
     if fibCheckPermission('/ROOT/Kernell/Finance/Finance_Menu/F_Menu_WorkReports/F_M_REP_CardAnalitic/F_M_REP_Card_Rachod','Belong')=0
     then GlobalSpr.GetACardKassaRasx(self,dmMain.MainDatabase.Handle,id_user)
     else BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації.',mtWarning,[mbOk]);
end;

procedure TfrmMainForm.dxBarButton5Click(Sender: TObject);
begin
     PC_Kow.InParams.Items['AOwner'] := @self;
     PC_Kow.InParams.Items['DbHandle'] := PInteger(@dmMain.MainDatabase.Handle);
     id_user:=AccMGMT.fibGetCurrentUserInfo.UserID;
     PC_Kow.InParams.Items['Id_User'] := PInteger(@id_user);
     (PC_Kow as IFMASModule).Run;
end;

end.
