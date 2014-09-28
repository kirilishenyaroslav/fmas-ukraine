unit TimeKeepingMainForm;

interface

uses
  Windows,Messages,SysUtils,Variants,Classes,Graphics,Controls,Forms,
  Dialogs,Menus,AppStruClasses,cxGraphics,AppEvnts,ActnList,ImgList,
  dxDockControl,pFIBErrorHandler,dxBarExtItems,dxBar,cxControls,
  dxStatusBar,StdCtrls,ComCtrls,dxBarExtDBItems,
  cxLookAndFeelPainters,cxButtons,DB,cxGridDBTableView,
  FIBQuery, pFIBQuery,FIBDatabase,pFIBDatabase,fib,
  AccMGMT,TimeKeepingDM,TuMessages,TuDates,TuCommonProc,
  TuCommonLoader, cxContainer, cxEdit, cxLabel,TuCommonTypes, cxHeader,MDIChildFormsBar;

type
  TFTimeKeepingMainMenu = class(TForm)
    BarManager: TdxBarManager;
    AboutProgPunktMainMenu: TdxBarButton;
    AboutSubMainMenu: TdxBarSubItem;
    ServiceSubMainMenu: TdxBarSubItem;
    SpSubMainMenu: TdxBarSubItem;
    DataSubMainMenu: TdxBarSubItem;
    InformationSubMainMenu: TdxBarSubItem;
    WorkSubMainMenu: TdxBarSubItem;
    ExitPunktMainMenu: TdxBarButton;
    BarDockControl: TdxBarDockControl;
    PrintSubMenu: TdxBarSubItem;
    WindowSubMenu: TdxBarSubItem;
    CascadePunktMainMenu: TdxBarButton;
    TileGorPunktMainMenu: TdxBarButton;
    CloseAllWindowsPunktMainMenu: TdxBarButton;
    TileVerPunktMainMenu: TdxBarButton;
    MinAllPunktMainMenu: TdxBarButton;
    NormAllPunktMainMenu: TdxBarButton;
    pFibErrorHandler: TpFibErrorHandler;
    Images: TImageList;
    dxStatusBar: TdxStatusBar;
    WhatsNewBtn: TdxBarButton;
    BarStaticFirm: TdxBarStatic;
    ActionList: TActionList;
    Action1: TAction;
    ApplicationEvents: TApplicationEvents;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    LabelSystem: TLabel;
    dxBarButton3: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    ButtonTempletTimeSheet: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton7: TdxBarButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton8: TdxBarButton;
    ButtonTypeWork: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    dxBarButton9: TdxBarButton;
    dxDockingManager1: TdxDockingManager;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    OpenDialog1: TOpenDialog;
    procedure ExitPunktMainMenuClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CascadePunktMainMenuClick(Sender: TObject);
    procedure WindowSubMenuPopup(Sender: TObject);
    procedure TileGorPunktMainMenuClick(Sender: TObject);
    procedure TileVerPunktMainMenuClick(Sender: TObject);
    procedure CloseAllWindowsPunktMainMenuClick(Sender: TObject);
    procedure MinAllPunktMainMenuClick(Sender: TObject);
    procedure NormAllPunktMainMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxStatusBar2Resize(Sender: TObject);
    procedure WhatsNewBtnClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure ButtonTempletTimeSheetClick(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure ButtonTypeWorkClick(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
    procedure dxBarButton12Click(Sender: TObject);
    procedure dxBarButton13Click(Sender: TObject);
  private
    PC: TFMASAppModule;
  public
    KodSetup:integer;
  end;

var
  FTimeKeepingMainMenu: TFTimeKeepingMainMenu;

implementation

{$R *.dfm}

procedure TFTimeKeepingMainMenu.ExitPunktMainMenuClick(Sender: TObject);
begin
Close;
end;

procedure TFTimeKeepingMainMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // if TuShowMessage(GetConst('ExitAnswer_Caption','MainMenu'),GetConst('ExitAnswer_Text','MainMenu'),mtConfirmation,[mbYes,mbNo])=mrYes then
//  begin
    CloseAllWindowsPunktMainMenuClick(Sender);
    Action:=caFree;
 // end
//  else Action:=caNone;
 //   if assigned(PC) then PC.Free;
end;

procedure TFTimeKeepingMainMenu.CascadePunktMainMenuClick(Sender: TObject);
begin
     Application.MainForm.Cascade;
end;

procedure TFTimeKeepingMainMenu.WindowSubMenuPopup(Sender: TObject);
begin
  CascadePunktMainMenu.Enabled := Application.MainForm.MDIChildCount>0;
  TileGorPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>1;
  TileVerPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>1;
  CloseAllWindowsPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>0;
  MinAllPunktMainMenu.Enabled  := Application.MainForm.MDIChildCount>0;
  NormAllPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>0;
end;

procedure TFTimeKeepingMainMenu.TileGorPunktMainMenuClick(Sender: TObject);
begin
  Application.MainForm.TileMode:=tbHorizontal;
  Application.MainForm.Tile;
end;

procedure TFTimeKeepingMainMenu.TileVerPunktMainMenuClick(Sender: TObject);
begin
  Application.MainForm.TileMode:=tbVertical;
  Application.MainForm.Tile;
end;

procedure TFTimeKeepingMainMenu.CloseAllWindowsPunktMainMenuClick(Sender: TObject);
var i:integer;
begin
  for i:=0 to Application.MainForm.MDIChildCount-1 do
    Application.MainForm.MDIChildren[i].Close;
end;

procedure TFTimeKeepingMainMenu.MinAllPunktMainMenuClick(Sender: TObject);
var i:integer;
begin
  for i:=Application.MainForm.MDIChildCount-1 downto 0 do
    Application.MainForm.MDIChildren[i].WindowState:=wsMinimized;
end;

procedure TFTimeKeepingMainMenu.NormAllPunktMainMenuClick(Sender: TObject);
var i:integer;
begin
  for i:=0 to Application.MainForm.MDIChildCount-1 do
    Application.MainForm.MDIChildren[i].WindowState:=wsNormal;
end;

procedure TFTimeKeepingMainMenu.FormShow(Sender: TObject);
var T:TzMDITool;
begin

  dxStatusBar.Panels[1].Text:=AccMGMT.fibGetCurrentDBPath;
  dxStatusBar.Panels[2].Text:= AccMGMT.GetUserFIO;
  dxStatusBar.Panels[3].Text:=DateToStr(Date);
  T:=TzMDITool.Create(BarManager);
end;

procedure TFTimeKeepingMainMenu.dxStatusBar2Resize(Sender: TObject);
begin
  dxStatusBar.Panels[1].Width:=Round(dxStatusBar.Width/5);;
  dxStatusBar.Panels[2].Width:=Round(dxStatusBar.Width/3);
  dxStatusBar.Panels[3].Width:=Round(dxStatusBar.Width/10);
  dxStatusBar.Panels[4].Width:=Round(dxStatusBar.Width/10);
  dxStatusBar.Panels[0].Width:=dxStatusBar.Width-dxStatusBar.Panels[1].Width-dxStatusBar.Panels[2].Width-dxStatusBar.Panels[3].Width-dxStatusBar.Panels[4].Width-10;
end;

procedure TFTimeKeepingMainMenu.WhatsNewBtnClick(Sender: TObject);
begin
  LoadWhatsNew(self,'TU_Whats_New.txt')
end;

procedure TFTimeKeepingMainMenu.Action1Execute(Sender: TObject);
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

procedure TFTimeKeepingMainMenu.ApplicationEventsException(Sender: TObject;
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

procedure TFTimeKeepingMainMenu.dxBarButton1Click(Sender: TObject);
var Parameter:TTuSimpleParam;
begin
  if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav/TU_Calendar','Belong')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav','Belong')=0)
  then begin //yes
    Parameter := TTuSimpleParam.Create;
    Parameter.DB_Handle := ExeDM.DBTimeKeeping.Handle;
    Parameter.Owner := self;
    DoFunctionFromPackage(Parameter,Tu_Calendar_Pack);
    Parameter.Destroy;
  end
    else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);

end;

procedure TFTimeKeepingMainMenu.dxBarButton2Click(Sender: TObject);
var Parameter:TTuSimpleParam;
begin
     if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_WorkMode','Belong')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Belong')=0)
     then begin //yes
       Parameter := TTuSimpleParam.Create;
       Parameter.DB_Handle := ExeDM.DBTimeKeeping.Handle;
       Parameter.Owner := self;
       Parameter.CFStyle:=tfsChild;
       Parameter.KodSetup:=KodSetup;
       DoFunctionFromPackage(Parameter,Tu_SpWorkMode_Pack);
       Parameter.Destroy;
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);



end;

procedure TFTimeKeepingMainMenu.FormCreate(Sender: TObject);
begin
KodSetup:=CurrentKodSetup(ExeDM.DBTimeKeeping.Handle);
Caption:=GetConst('MainFormCaption','Form');
LabelSystem.Caption:=GetConst('MainFormCaption','Form');

AboutSubMainMenu.Caption        :=GetConst('Help','MainMenu');
AboutProgPunktMainMenu.Caption  :=GetConst('AboutProgram','MainMenu');
WhatsNewBtn.Caption             :=GetConst('WhatsNew','MainMenu');

ServiceSubMainMenu.Caption      :=GetConst('Service','MainMenu');

SpSubMainMenu.Caption           :=GetConst('Directories','MainMenu');
dxBarButton1.Caption            :=GetConst('Calendar','MainMenu');

DataSubMainMenu.Caption         :=GetConst('Indicators','MainMenu');

InformationSubMainMenu.Caption  :=GetConst('Info','MainMenu');

WorkSubMainMenu.Caption         :=GetConst('Work','MainMenu');
dxBarButton2.Caption            :=GetConst('ModeWork','MainMenu');
PrintSubMenu.Caption            :=GetConst('Helps','MainMenu');

WindowSubMenu.Caption                 :=GetConst('Windows','MainMenu');
CascadePunktMainMenu.Caption          :=GetConst('Cascade','MainMenu');
TileGorPunktMainMenu.Caption          :=GetConst('Horizontal','MainMenu');
TileVerPunktMainMenu.Caption          :=GetConst('Vertical','MainMenu');
MinAllPunktMainMenu.Caption           :=GetConst('Minimize','MainMenu');
NormAllPunktMainMenu.Caption          :=GetConst('Normalize','MainMenu');
CloseAllWindowsPunktMainMenu.Caption  :=GetConst('Close','MainMenu');

ExitPunktMainMenu.Caption            :=GetConst('Exit','MainMenu');
end;

procedure TFTimeKeepingMainMenu.dxBarButton3Click(Sender: TObject);
var Parameter:TTuSimpleParam;
begin

end;

procedure TFTimeKeepingMainMenu.ButtonTempletTimeSheetClick(Sender: TObject);
var Parameter:TTuSimpleParam;
begin
  if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav/TU_Templet','Belong')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav','Belong')=0)
  then begin //yes
    LoadTuSpTemplet(self, ExeDM.DBTimeKeeping.Handle,KodSetup,tfsNormal,null);
  end
    else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);


end;

procedure TFTimeKeepingMainMenu.dxBarButton4Click(Sender: TObject);
begin

        LoadTuTimeSheet(self,ExeDM.DBTimeKeeping.Handle, AccMGMT.GetUserIdMan,KodSetup,tfsWork)


end;

procedure TFTimeKeepingMainMenu.Button1Click(Sender: TObject);
var res:variant;
begin

end;

procedure TFTimeKeepingMainMenu.dxBarButton6Click(Sender: TObject);
begin
    LoadTuTimeSheet(self,ExeDM.DBTimeKeeping.Handle,AccMGMT.GetUserId, KodSetup, tfsEditPast)

end;

procedure TFTimeKeepingMainMenu.dxBarButton8Click(Sender: TObject);
begin
    LoadTuTimeSheet(self,ExeDM.DBTimeKeeping.Handle,AccMGMT.GetUserId, KodSetup, tfsPast);
end;

procedure TFTimeKeepingMainMenu.ButtonTypeWorkClick(Sender: TObject);
var Parameter:TTuSimpleParam;
begin

  if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav/TU_TypeVihod','Belong')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav','Belong')=0)
  then begin //yes
     Parameter := TTuSimpleParam.Create;
     Parameter.DB_Handle := ExeDM.DBTimeKeeping.Handle;
     Parameter.Owner := self;
     Parameter.CFStyle:=tfsNormal;
     DoFunctionFromPackage(Parameter,Tu_SpTypeWork_Pack);
     Parameter.Destroy;
  end
    else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
end;

procedure TFTimeKeepingMainMenu.dxBarButton10Click(Sender: TObject);
begin
  if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav/TU_WorkDog','Belong')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav','Belong')=0)
  then begin //yes
    LoadTuSpDog(self,ExeDM.DBTimeKeeping.Handle, kodSetup , Null);
  end
    else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);

end;

procedure TFTimeKeepingMainMenu.dxBarButton12Click(Sender: TObject);
var Parameter:TTuSimpleParam;
begin
     if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_OfficialNote','Belong')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Belong')=0)
     then begin //yes
         Parameter := TTuSimpleParam.Create;
         Parameter.DB_Handle := ExeDM.DBTimeKeeping.Handle;
         Parameter.Owner := self;
         Parameter.KodSetup:=KodSetup;
         DoFunctionFromPackage(Parameter,Tu_SpOfficialNote_Pack);
         Parameter.Destroy;
     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);

end;

procedure TFTimeKeepingMainMenu.dxBarButton13Click(Sender: TObject);
//var xls:TXLSReadWriteII2;
 //   n,i,j,k:integer;
//    caption,T,T2:string;
begin
 { if  OpenDialog1.Execute  then
  begin

   xls:= TXLSReadWriteII2.Create(Application);
   xls.Filename:=OpenDialog1.FileName;
   xls.Read;
  n:=xls.Sheet[0].LastRow;
 //n:=50;
  i:=2;
      ExeDM.StProc.Transaction.StartTransaction;
    ExeDM.StProc.StoredProcName:='PUB_SP_CLASS_IMPORT_TEMP';
    ExeDM.StProc.prepare;
  while (i<=n) do
  begin

    caption:='';
    T:=xls.Sheet[0].AsString[5,6];
    j:=1;
    k:=0;
    while (j<=3) do
    begin
      if (tRIM(xls.Sheet[0].AsString[j-1,i])<>'') AND(xls.Sheet[0].AsString[j-1,i]<>T) then
        ExeDM.StProc.ParamByName('P'+inttostr(j)).AsString:=xls.Sheet[0].AsString[j-1,i]
      else
        ExeDM.StProc.ParamByName('P'+inttostr(j)).Asvariant:= Null;
      j:=j+1;
      k:=k+1;
    end ;

    while (j<=6) do
    begin
      T2:=tRIM(xls.Sheet[0].AsString[k,i]);
      if (T2<>'') AND(T2<>T) then
        ExeDM.StProc.ParamByName('P'+inttostr(j)).AsString:=T2[1]
      else
        ExeDM.StProc.ParamByName('P'+inttostr(j)).Asvariant:= Null;
      j:=j+1;
      if Length(T2)=2 then
      begin

        if (T2<>'') AND(T2<>T) then
          ExeDM.StProc.ParamByName('P'+inttostr(j)).AsString:=T2[2]
        else
          ExeDM.StProc.ParamByName('P'+inttostr(j)).Asvariant:= Null;

      end
      else
        ExeDM.StProc.ParamByName('P'+inttostr(j)).Asvariant:= Null;
      j:=j+1;
      k:=k+1;
    end ;

    while (j<=9) do
    begin
      if (tRIM(xls.Sheet[0].AsString[k,i])<>'') AND(xls.Sheet[0].AsString[k,i]<>T) then
         ExeDM.StProc.ParamByName('P'+inttostr(j)).AsString:=xls.Sheet[0].AsString[k,i]
      else
        ExeDM.StProc.ParamByName('P'+inttostr(j)).Asvariant:= Null;
      k:=k+1;
      j:=j+1;
    end;



    ExeDM.StProc.ParamByName('NAME').AsString:=xls.Sheet[0].AsString[8,i];
    for k:=1 to 100 do
    begin




      if ((xls.Sheet[0].AsString[0,i+1]=xls.Sheet[0].AsString[0,i] ) or (xls.Sheet[0].AsString[0,i+1]=''))and
         ( (xls.Sheet[0].AsString[1,i+1]=xls.Sheet[0].AsString[1,i]))and
         (xls.Sheet[0].AsString[2,i+1]='' )and
         (xls.Sheet[0].AsString[3,i+1]='')and
         (xls.Sheet[0].AsString[4,i+1]='' )and
         (xls.Sheet[0].AsString[5,i+1]='' )and
         (xls.Sheet[0].AsString[6,i+1]='' )   then
      begin
        i:=i+1;
          caption:=caption+xls.Sheet[0].AsString[8,i]+#13;
       end
      else
       break;
    end;
   ExeDM.StProc.ParamByName('CAPTION').AsString:=caption;
    ExeDM.StProc.ExecProc;

    I:=I+1;
  end   ;
   ExeDM.StProc.Transaction.Commit;
  end;
  }
end;

end.
