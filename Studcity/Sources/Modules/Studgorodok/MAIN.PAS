//***********************************************************************
//* Проект "Студгородок"                                                *
//* Главный форма приложения                                            *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit MAIN;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList, inifiles, jpeg, cxControls,
  cxContainer, cxEdit, cxImage, ShellAPI,St_Loader_Unit,
  dxBar,GlobalSPR,Kernel, RXShell,LoadPackegeStudCity,
  uCommonSp, cxGraphics, dxStatusBar, Animate, GIFCtrl, MDIChildFormsBar,
  cxLabel, cxGroupBox, cxHint, dxBarExtItems, SysAdmin, DB, FIBDataSet,
  pFIBDataSet, AccMGMT, Registry, St_Proc, st_ConstUnit, FIBQuery,
  pFIBQuery, pFIBStoredProc, st_Sprav, st_SpravReportSettings, Propiska_Builds,
  st_PaspData, st_common_loader, AppEvnts, st_common_funcs, AllPeopleUnit,
  cxButtons;

  type
  TMainForm = class(TForm)
    ActionList1: TActionList;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowArrangeAll1: TWindowArrange;
    WindowMinimizeAll1: TWindowMinimizeAll;
    HelpAbout1: TAction;
    WindowTileVertical1: TWindowTileVertical;
    ImageList1: TImageList;
    TrayIcon: TRxTrayIcon;
    Main_menu_BarManager: TdxBarManager;
    N9: TdxBarButton;
    N7: TdxBarSubItem;
    Kat_Pay: TdxBarButton;
    N1: TdxBarButton;
    N8: TdxBarButton;
    N10: TdxBarButton;
    Class_Kat: TdxBarButton;
    Type_Kat: TdxBarButton;
    N11: TdxBarButton;
    N12: TdxBarButton;
    C2: TdxBarButton;
    C1: TdxBarSubItem;
    N20: TdxBarButton;
    N21: TdxBarButton;
    N22: TdxBarButton;
    N19: TdxBarSubItem;
    N18: TdxBarButton;
    WindowTileItem: TdxBarButton;
    WindowTileItem2: TdxBarButton;
    WindowMinimizeItem: TdxBarButton;
    N13: TdxBarButton;
    Window1: TdxBarSubItem;
    N2: TdxBarButton;
    N14: TdxBarButton;
    Help1: TdxBarSubItem;
    ExitMenu: TdxBarButton;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N17: TMenuItem;
    N23: TMenuItem;
    Ser_BarButton: TdxBarButton;
    dxBarButton1: TdxBarButton;
    ConnectTimer: TTimer;
    StatusBar: TdxStatusBar;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    ShowSecret_Action: TAction;
    Panel1: TPanel;
    GIFAnimator: TRxGIFAnimator;
    GIFTimer: TTimer;
    SystemAction: TAction;
    N15: TMenuItem;
    dxBarSubItem6: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    Hint_Label: TLabel;
    dxBarSubItem7: TdxBarSubItem;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    Now_Date: TdxBarStatic;
    TodayAction: TAction;
    RazvorotAction: TAction;
    User_Login_Label: TLabel;
    User_Login_FIO_Label: TLabel;
    dxBarButton10: TdxBarButton;
    FinalTimer: TTimer;
    ErrorShow: TdxBarButton;
    Slugba_BarButton: TdxBarSubItem;
    UserShow: TdxBarButton;
    User_Info: TdxBarButton;
    ReadDataSet: TpFIBDataSet;
    LoginShow: TdxBarButton;
    OnTrayHide: TdxBarButton;
    dxBarSubItem8: TdxBarSubItem;
    N16: TMenuItem;
    N24: TMenuItem;
    Universal: TdxBarButton;
    MainMenuFocusAction: TAction;
    RahunokWork: TdxBarButton;
    SpravSmet: TdxBarButton;
    IconsBtn: TdxBarButton;
    Whats_New_Button: TdxBarButton;
    SpisanieBtn: TdxBarButton;
    LanguageBtn: TdxBarSubItem;
    RusLngBtn: TdxBarButton;
    UkrLngBtn: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    OnPrintsForms: TdxBarButton;
    dxBarBtnPaspData: TdxBarButton;
    ApplicationEvents1: TApplicationEvents;
    dxBarButton14: TdxBarButton;
    BarButton_fiz_lica: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarSubItem9: TdxBarSubItem;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ExitMenuClick(Sender: TObject);
    procedure Kat_PayClick(Sender: TObject);
    procedure Class_KatClick(Sender: TObject);
    procedure Type_KatClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure Window1Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Ser_BarButtonClick(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ShowSecret_ActionExecute(Sender: TObject);
    procedure GIFTimerTimer(Sender: TObject);
    procedure SystemActionExecute(Sender: TObject);
    procedure StatusBarContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TrayIconMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrayIconDblClick(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure ConnectTimerTimer(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
    procedure RazvorotActionExecute(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
    procedure FinalTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UserShowClick(Sender: TObject);
    procedure ErrorShowClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure User_InfoClick(Sender: TObject);
    procedure LoginShowClick(Sender: TObject);
    procedure TrayIconClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N16Click(Sender: TObject);
    procedure UniversalClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MainMenuFocusActionExecute(Sender: TObject);
    procedure RahunokWorkClick(Sender: TObject);
    procedure SpravSmetClick(Sender: TObject);
    procedure Whats_New_ButtonClick(Sender: TObject);
    procedure SpisanieBtnClick(Sender: TObject);
    procedure RusLngBtnClick(Sender: TObject);
    procedure UkrLngBtnClick(Sender: TObject);
    procedure dxBarButton12Click(Sender: TObject);
    procedure dxBarButton13Click(Sender: TObject);
    procedure OnPrintsFormsClick(Sender: TObject);
    procedure dxBarBtnPaspDataClick(Sender: TObject);
    procedure dxBarButton14Click(Sender: TObject);
    procedure BarButton_fiz_licaClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure dxBarButton16Click(Sender: TObject);
    procedure dxBarButton17Click(Sender: TObject);
    procedure dxBarButton18Click(Sender: TObject);
    procedure dxBarButton19Click(Sender: TObject);

  //  procedure Button1Click(Sender: TObject);

  private
    Yes_IsCloseNow: boolean;
    PLanguageIndex: byte;
    is_admin : Boolean;
    procedure ApplicationMinimize(Sender : TObject);
  public
    //SpravLgotForm: TSpravLgotForm;
    WaitFormHandle: Boolean;
    DB_PATH: string;
    FileInfo: string;
    procedure CloseAllWindows;

 end;

var
  MainForm: TMainForm;
  AccessResult: TSt_AccessResult;


  implementation

{$R *.dfm}

uses about, DataModule1_Unit, St_Ptio_Registration, st_sp_Subsidy,
     St_sp_Substate, ST_INI_TYPE_ROOM, Unit_of_Utilits, ST_DT_SQL_WaitForm,
     Variants, st_common_types;

procedure TMainForm.ApplicationMinimize(Sender : TObject);
begin
if OnTrayHide.Down then
ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TMainForm.CloseAllWindows;
begin
if MDIChildCount=1 then N13.Enabled:=false;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
AboutBox:=TAboutBox.Create(self);
TrayIcon.Animated:=true;
AboutBox.ShowModal;
end;

procedure TMainForm.N1Click(Sender: TObject);
var
  aParameter : TstSimpleParams;
begin
  if not is_admin then
  if fibCheckPermission('/ROOT/Studcity/Sp_Lgot','View') <> 0 then
   begin
    messagebox(handle,
    pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
    +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
    pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;

  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  RunFunctionFromPackage(aParameter, 'Studcity\st_sp_lgots.bpl', 'ShowSpLgota');

  aParameter.Free;
end;

procedure TMainForm.ExitMenuClick(Sender: TObject);
var res: boolean;
   i: Byte;
begin
if MessageBox(Handle,PChar(st_ConstUnit.st_ExitPromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then begin
exit;
end;
Yes_IsCloseNow:=true;
if DataModule1.ReadTransaction.InTransaction then DataModule1.ReadTransaction.Rollback;
if DataModule1.WriteTransaction.InTransaction then DataModule1.WriteTransaction.Rollback;

if Application.MainForm.MDIChildCount <> 0 then
for i:=Application.MainForm.MDIChildCount-1 downto 0 do
  begin
   if Application.MainForm.MDIChildren[i].Handle > 32 then Application.MainForm.MDIChildren[i].Free;
  end;


FinalTimer.Enabled:=true;
Res:= Load_Final(self);
ShowWindow(Application.Handle, SW_HIDE);
MainForm.Visible:=false;
end;

procedure TMainForm.Kat_PayClick(Sender: TObject);
var
  aParameter : TstSimpleParams;
begin
  if not is_admin then
  if fibCheckPermission('/ROOT/Studcity/Sp_KAT_PAY','View') <> 0 then
   begin
    messagebox(handle,
    pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
    +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
    pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;


  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  RunFunctionFromPackage(aParameter, 'Studcity\st_sp_kat_pay.bpl', 'ShowSPKat_Pay');

  aParameter.Free;
end;

procedure TMainForm.Class_KatClick(Sender: TObject);
var
  aParameter : TstSimpleParams;
begin
  if not is_admin then
  if fibCheckPermission('/ROOT/Studcity/Sp_Class_Kat','View') <> 0 then
   begin
    messagebox(handle,
    pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
    +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
    pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;

  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  RunFunctionFromPackage(aParameter, 'Studcity\st_sp_class_kat.bpl', 'ShowSPClass_Kat');

  aParameter.Free;
end;

procedure TMainForm.Type_KatClick(Sender: TObject);
var
  aParameter : TstSimpleParams;
begin
  if not is_admin then
  if fibCheckPermission('/ROOT/Studcity/Sp_Type_Kat','View') <> 0 then
   begin
    messagebox(handle,
    pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
    +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
    pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;

  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  RunFunctionFromPackage(aParameter, 'Studcity\st_sp_type_kat.bpl', 'ShowSPType_Kat');

  aParameter.Free;
end;

procedure TMainForm.N8Click(Sender: TObject);
var
  ResOpl:Variant;
  BuildInfo: TBuildsInfo;
begin
  BuildInfo.id_build:=-1;
  BuildInfo.N_Room:='';
  ResOpl:= Load_st_Builds(self,DataModule1.DB.Handle,false,false, BuildInfo);
{ if VarArrayDimCount(ResOpl)>0 then
   begin
     ShowMessage(VarToStr(ResOpl[0]));
     ShowMessage(VarToStr(ResOpl[1]));
     ShowMessage(VarToStr(ResOpl[2]));
   end;}
end;

procedure TMainForm.N9Click(Sender: TObject);
begin
 if GetChildPosition (Registration_Form, N9.Caption) = true then exit;
 Screen.Cursor:= crHourGlass;
 SQL_Wait_Form:= TSQL_Wait_Form.Create(Self);
 SQL_Wait_Form.Show;
 SQL_Wait_Form.Update;
 Registration_Form := TRegistration_Form.Create(Self);
 Registration_Form.is_admin := is_admin;
 Registration_Form.HotKey_StatusBar.Update;
 Registration_Form.Progress.Position:=10;
 Registration_Form.BorderStyle := bsSizeable;
 Registration_Form.FormStyle := fsMDIChild;
 Registration_Form.Position:=poMainFormCenter;
 Registration_Form.Caption:=N9.Caption;
 Registration_Form.Show;
 Registration_Form.Progress.Update;
 Registration_Form.Update;
 SQL_Wait_Form.BringToFront;
 SQL_Wait_Form.Update;
 N13.Enabled:=true;
 Registration_Form.Filter_BarEdit.SetFocus;
end;

procedure TMainForm.N10Click(Sender: TObject);
begin
if GetChildPosition (Subsidy_Form, N10.Caption) = true then exit;
 Screen.Cursor:= crSQLWait;
 Subsidy_Form := TSubsidy_Form.Create(Self);
 Subsidy_Form.BorderStyle := bsSizeable;
 Subsidy_Form.FormStyle := fsMDIChild;
 Subsidy_Form.Caption:= N10.Caption;
 Subsidy_Form.Show;
 N13.Enabled:=true;
 Screen.Cursor:= crDefault;
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
if GetChildPosition (Substate_Form, N11.Caption) = true then exit;
 Screen.Cursor:= crSQLWait;
 Substate_Form := TSubstate_Form.Create(Self);
 Substate_Form.BorderStyle := bsSizeable;
 Substate_Form.FormStyle := fsMDIChild;
 Substate_Form.Caption:=N11.Caption;
 Substate_Form.Show;
 N13.Enabled:=true;
 Screen.Cursor:= crDefault;
end;

procedure TMainForm.N12Click(Sender: TObject);
begin
  if GetChildPosition (Ini_Type_Room_Form, N12.Caption) = true then exit;

  Screen.Cursor:= crSQLWait;

  Ini_Type_Room_Form := TIni_Type_Room_Form.Create(Self);

  Ini_Type_Room_Form.BorderStyle := bsSizeable;
  Ini_Type_Room_Form.FormStyle   := fsMDIChild;
  Ini_Type_Room_Form.Caption     := N12.Caption;
  Ini_Type_Room_Form.Show;
  N13.Enabled := true;

  Screen.Cursor:= crDefault;
end;

procedure TMainForm.N13Click(Sender: TObject);
var
  i:Integer;
begin
for i:=MDIChildCount-1 downto 0 do 
  begin
    MDIChildren[i].Close;
  end;
  N13.enabled:=false;
  end;

procedure TMainForm.FormShow(Sender: TObject);
var i,p: integer;
    Bar:TzMDITool;
w:PAnsiChar;
begin
InitializaAdminSystem(Self, DataModule1_Unit.DataModule1.DB.Handle, 19, AccessResult.ID_User, false);

  is_admin:=true;
  If FibCheckPermission('/ROOT/StudCity/st_admin','Belong') <> 0
   then is_admin:=false;

StatusBar.Panels[1].Text:=st_ConstUnit.st_Connect_Tiltle[PLanguageIndex]+ DB_PATH;
w:=pchar(fileinfo);
i:=StrLen(w);
FileInfo:='';
for p:= 0 to i-1 do
FileInfo:=FileInfo+ w[p];
StatusBar.Panels[2].Text:=st_ConstUnit.st_FileVersion[PLanguageIndex]+ FileInfo+ ' ' + st_ConstUnit.st_AssemblingVersion[PLanguageIndex]+DateToStr(FileDateToDateTime(FileAge(Application.ExeName)));
Bar := TzMDITool.Create(Window1);

Now_Date.Caption:= Now_Date.Caption+datetostr(DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP);
Now_Date.Hint:=formatdatetime('dddd, dd mmmm yyyy "гг."',DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP);

Hint_Label.Top:=0;
Hint_Label.Left:=5;
Hint_Label.Top:=MainForm.ClientHeight+100;

User_Login_Label.Caption:= User_Login_Label.Caption + AccessResult.Name_user;
User_Login_FIO_Label.Caption:= User_Login_FIO_Label.Caption + AccessResult.User_Fio;


ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text:='select * from ST_ROLES_SELECT('+ inttostr(AccessResult.ID_User) + ')';
ReadDataSet.Open;
if ReadDataSet['NAME_GROUP'] <> 'St_Admin' then
begin
UserShow.Visible:=ivNever;
ErrorShow.Visible:=ivNever;
end;
ReadDataSet.Close;

  if PLanguageIndex = 2 then RusLngBtn.Down :=True;
  if PLanguageIndex = 1 then UkrLngBtn.Down :=True;

end;

procedure TMainForm.N14Click(Sender: TObject);
begin
ShellExecute(Application.Handle,'open','http://buhg.dongu.donetsk.ua',nil,nil,0);
end;

procedure TMainForm.C2Click(Sender: TObject);
var
  ResOpl:Variant;
begin
 ResOpl:= Load_st_BuildLivers(self,DataModule1.DB.Handle,false,'');//, 'fak', 0, true);

  if VarArrayDimCount(ResOpl)>0 //ShowMessage(VarToStr(ResOpl[0][9]));
   then begin
     ShowMessage('id_kod:  '+VarToStr(ResOpl[0][0]));
     ShowMessage('дата начала проживания:  '+VarToStr(ResOpl[0][1]));
     ShowMessage('дата конца проживания:  '+VarToStr(ResOpl[0][2]));
     ShowMessage('нужно заплатить:  '+VarToStr(ResOpl[0][3]));
     ShowMessage('уплаченная сумма:  '+VarToStr(ResOpl[0][4]));
     ShowMessage('долг:  '+VarToStr(ResOpl[0][5]));
     ShowMessage('начало оплаты:  '+VarToStr(ResOpl[0][6]));
     ShowMessage('конец оплаты:  '+VarToStr(ResOpl[0][7]));
     ShowMessage('вносимая сумма:  '+VarToStr(ResOpl[0][8]));
     ShowMessage('кол-во записей:  '+VarToStr(ResOpl[0][9]));
     ShowMessage('фио:  '+VarToStr(ResOpl[0][10]));
     ShowMessage('код-дог:  '+VarToStr(ResOpl[0][11]));      


     ShowMessage(#13);
     ShowMessage(VarToStr(ResOpl[1][0]));
     ShowMessage(VarToStr(ResOpl[1][1]));
     ShowMessage(VarToStr(ResOpl[1][2]));
     ShowMessage(VarToStr(ResOpl[1][3]));

     ShowMessage(VarToStr(ResOpl[1][4]));
   //  ShowMessage(VarToStr(ResOpl[2][0]));
   //  ShowMessage(VarToStr(ResOpl[2][1]));
   //  ShowMessage(VarToStr(ResOpl[2][2]));
   //  ShowMessage(VarToStr(ResOpl[2][3]));
   //  ShowMessage(VarToStr(ResOpl[2][4]));
   end;
end;

procedure TMainForm.Window1Click(Sender: TObject);
begin
 N13.Enabled:=(Self.MDIChildCount>0);
end;

procedure TMainForm.N18Click(Sender: TObject);
begin
  LoadPackegeStudCity.LoadReports(self,DataModule1.DB.Handle);
end;

procedure TMainForm.N20Click(Sender: TObject);
begin
LoadPackegeStudCity.LoadSudsReestr(self,DataModule1.DB.Handle);
end;

procedure TMainForm.N21Click(Sender: TObject);
begin
LoadPackegeStudCity.LoadGetFileSubsOtdel(Self,DataModule1.DB.Handle);
end;

procedure TMainForm.N22Click(Sender: TObject);
begin
LoadPackegeStudCity.LoadWorkSubsOtdel(Self,DataModule1.DB.Handle);
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
MainForm.N2Click(Sender);
end;

procedure TMainForm.N17Click(Sender: TObject);
begin
MainForm.Close;
end;

{procedure TMainForm.Button1Click(Sender: TObject);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DataModule1.pFIBDatabase1.Handle,Now,psmRazdSt);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
{             id[0]  -идентификатор сметы
              id[1]  -идентификатор раздела
              id[2]  -идентификатор статьи
              id[3]  -идентификатор группы смет
              id[4]  -наименование раздела
              id[5]  -наименование статьи
              id[6]  -наименование сметы
              id[7]  -номер раздела
              id[8]  -номер статьи
              id[9]  -код сметы
              id[10] -наименование группы смет}
{     end;
   end;end;}

procedure TMainForm.Button1Click(Sender: TObject);
var
  Res: variant;
begin
 Res:= Load_st_BuildLivers(Self, DataModule1.DB.Handle, true, '', '--', 1.00, false);
end;

procedure TMainForm.Ser_BarButtonClick(Sender: TObject);
begin
  LoadPackegeStudCity.LoadViewBuildsRooms(self,DataModule1.DB.Handle);
end;

procedure TMainForm.dxBarButton1Click(Sender: TObject);
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
            FieldValues['DBHandle'] := Integer(DataModule1.DB.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!');
    sp.Free;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i:integer;
res: boolean;
begin
if Yes_IsCloseNow then exit;
if MessageBox(Handle,PChar(st_ConstUnit.st_ExitPromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then begin
CanClose:=false;
exit;
end;
if DataModule1.ReadTransaction.InTransaction then DataModule1.ReadTransaction.Commit;
if DataModule1.WriteTransaction.InTransaction then DataModule1.WriteTransaction.Commit;
if Application.MainForm.MDIChildCount <> 0 then
for i:=Application.MainForm.MDIChildCount-1 downto 0 do
  begin
   if Application.MainForm.MDIChildren[i].Handle > 32 then Application.MainForm.MDIChildren[i].Free;
  end;
end;

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  begin
  if button = mbRight then
  dxBarPopupMenu1.PopupFromCursorPos;

end;

procedure TMainForm.dxBarButton2Click(Sender: TObject);
begin
LoadPackegeStudCity.LoadReports(self,DataModule1.DB.Handle);
end;

procedure TMainForm.dxBarButton4Click(Sender: TObject);
begin
MainForm.ExitMenuClick(Sender);
end;

procedure TMainForm.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if  Source.ClassName = 'TPanel' then
Accept:=true;
end;

procedure TMainForm.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
TPanel(Source).Left:=X;
TPanel(Source).Top:=Y;
end;

procedure TMainForm.ShowSecret_ActionExecute(Sender: TObject);
begin
Panel1.Width:=163;
Panel1.Height:=145;
Panel1.Visible:=true;
Panel1.Left:=MainForm.ClientWidth div 2 - Panel1.Width div 2;
Panel1.Top:=MainForm.ClientHeight div 2 - Panel1.Height div 2;
GIFAnimator.Animate:=true;
GIFTimer.Enabled:=true;
end;

procedure TMainForm.GIFTimerTimer(Sender: TObject);
begin
Panel1.Visible:=false;
Panel1.Destroy;
GIFTimer.Enabled:=false;
MainForm.ShowSecret_Action.Destroy;
end;

procedure TMainForm.SystemActionExecute(Sender: TObject);
var
Str_DB_PATH: string;
Str_Version, StrSborka: string;
Str_FileDir,Str_FileName: string;
begin
Str_FileName:= st_ConstUnit.st_ApplicationName[PLanguageIndex] + Application.Title+ #13;
Str_FileDir:=  st_ConstUnit.st_ApplicationWay[PLanguageIndex]  + '[ '+ Application.ExeName+' ]'+ #13;
Str_Version:=  st_ConstUnit.st_FileVersionFull[PLanguageIndex] + FileInfo+ #13;
StrSborka:=    st_ConstUnit.st_AssemblingDate[PLanguageIndex]  + DateTimeToStr(FileDateToDateTime(FileAge(Application.ExeName)))+ #13;
Str_DB_PATH := st_ConstUnit.st_DBWay[PLanguageIndex]           + '[ '+DB_PATH+ ' ]'+ #13;
ShowMessage(Str_FileName+Str_FileDir+Str_Version+StrSborka+Str_DB_PATH);

end;

procedure TMainForm.StatusBarContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
N3.Visible:=false;
N17.Visible:=false;
end;

procedure TMainForm.TrayIconMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then
N3.Visible:=true;
N17.Visible:=true;
end;

procedure TMainForm.TrayIconDblClick(Sender: TObject);
begin
N2Click(Sender);
end;

procedure TMainForm.FormDblClick(Sender: TObject);
begin
MainForm.N9Click(Sender);
end;

procedure TMainForm.ConnectTimerTimer(Sender: TObject);
begin
Hint_Label.Visible:=false;
ConnectTimer.Enabled:=False;
end;

procedure TMainForm.dxBarButton7Click(Sender: TObject);
begin
ShellExecute(Application.Handle,'open','C:\WINDOWS\System32\spider.exe',nil,nil,SW_SHOW);
end;

procedure TMainForm.dxBarButton8Click(Sender: TObject);
begin
ShellExecute(Application.Handle,'open','mailto:lexus@buhg.dongu.donetsk.ua',nil,nil,SW_SHOWNORMAL);
end;

procedure TMainForm.dxBarButton9Click(Sender: TObject);
begin
ShellExecute(Application.Handle,'open','http://buhg.dongu.donetsk.ua/Forum',nil,nil,0);
end;

procedure TMainForm.RazvorotActionExecute(Sender: TObject);
begin
if Application.MainForm.MDIChildCount = 0 then exit;
case Application.MainForm.ActiveMDIChild.WindowState of
wsNormal     : Application.MainForm.ActiveMDIChild.WindowState := wsMaximized;
wsMinimized  : Application.MainForm.ActiveMDIChild.WindowState := wsNormal;
wsMaximized  : Application.MainForm.ActiveMDIChild.WindowState := wsNormal;
end;
end;

procedure TMainForm.dxBarButton10Click(Sender: TObject);
begin
LoadPackegeStudCity.LoadListROVD(self,DataModule1.DB.Handle);
end;

procedure TMainForm.FinalTimerTimer(Sender: TObject);
begin
 MainForm.close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
  procedure MainFormInitializ; // инициализация главной формы
  begin
   PLanguageIndex:=           St_Proc.cnLanguageIndex;
   Application.Title :=       st_ConstUnit.st_Application_Caption[PLanguageIndex];
   MainForm.Caption:=         st_ConstUnit.st_Application_Caption[PLanguageIndex];
   // окна
    Window1.Caption:=                st_ConstUnit.st_Windows_Tiltle[PLanguageIndex];
    Window1.Hint:=                   st_ConstUnit.st_Windows_Tiltle[PLanguageIndex];
    dxBarButton5.Caption:=           st_ConstUnit.st_WindowsCacade[PLanguageIndex];
    WindowTileItem.Caption:=         st_ConstUnit.st_WindowsHorizontal[PLanguageIndex];
    WindowTileItem2.Caption:=        st_ConstUnit.st_WindowsVertical[PLanguageIndex];
    WindowMinimizeItem.Caption:=     st_ConstUnit.st_WindowsMinimizeAll[PLanguageIndex];
    N13.Caption:=                    st_ConstUnit.st_WindowsCloseAll[PLanguageIndex];

    dxBarButton5.Hint:=             st_ConstUnit.st_WindowsCacade[PLanguageIndex];
    WindowTileItem.Hint:=           st_ConstUnit.st_WindowsHorizontal[PLanguageIndex];
    WindowTileItem2.Hint:=          st_ConstUnit.st_WindowsVertical[PLanguageIndex];
    WindowMinimizeItem.Hint:=       st_ConstUnit.st_WindowsMinimizeAll[PLanguageIndex];
    N13.Hint:=                      st_ConstUnit.st_WindowsCloseAll[PLanguageIndex];
    dxBarBtnPaspData.Caption:=      st_ConstUnit.st_PaspDataCaption[PLanguageIndex];

   // статусбар
   StatusBar.Panels[0].Text:= st_ConstUnit.st_Main_Ready_Caption[PLanguageIndex];
   StatusBar.Hint:=           st_ConstUnit.st_Main_StatusBar_Caption[PLanguageIndex];

   // кнопки
   N7.Caption:=               st_ConstUnit.st_Main_WorkBtn_Caption[PLanguageIndex];
   N7.Hint:=                  st_ConstUnit.st_Main_WorkBtn_Caption[PLanguageIndex];
   C1.Caption:=               st_ConstUnit.st_Main_SpravBtn_Caption[PLanguageIndex];
   C1.Hint:=                  st_ConstUnit.st_Main_SpravBtn_Caption[PLanguageIndex];
   N18.Caption:=              st_ConstUnit.st_Main_ZvitBtn_Caption[PLanguageIndex];

   Help1.Caption:='';
   Help1.Hint:=               st_ConstUnit.st_HelpText[PLanguageIndex];
   Now_Date.Caption:=         st_ConstUnit.st_NowDate_Caption[PLanguageIndex];

   Slugba_BarButton.Caption:= st_ConstUnit.st_Main_SlygBtn_Caption[PLanguageIndex];
   Slugba_BarButton.Hint:=    st_ConstUnit.st_Main_SlygBtn_Caption[PLanguageIndex];

   dxBarSubItem8.Caption:=    st_ConstUnit.st_Main_OptionsBtn_Caption[PLanguageIndex];
   dxBarSubItem8.Hint:=       st_ConstUnit.st_Main_OptionsBtn_Caption[PLanguageIndex];

   ExitMenu.Caption:=         st_ConstUnit.st_Main_ExitBtn_Caption[PLanguageIndex];
   ExitMenu.Hint:=            st_ConstUnit.st_Main_ExitBtn_Caption[PLanguageIndex];

   Whats_New_Button.Caption:=  st_ConstUnit.st_WhatsNew_Caption[PLanguageIndex];
   Whats_New_Button.Hint:=     st_ConstUnit.st_WhatsNew_Caption[PLanguageIndex];

  // справочники
  //справочник физ. лиц
  BarButton_fiz_lica.Caption := st_ConstUnit.st_main_fiz_lica[PLanguageIndex];
  BarButton_fiz_lica.Hint    := st_ConstUnit.st_main_fiz_lica[PLanguageIndex];

  // категорий
  Kat_Pay.Caption := st_ConstUnit.st_Main_Kat[PLanguageIndex];
  Kat_Pay.Hint    := st_ConstUnit.st_Main_Kat[PLanguageIndex];

  // льгот
  N1.Caption:=         st_ConstUnit.st_Main_Lgot[PLanguageIndex];
  N1.Hint:=            st_ConstUnit.st_Main_Lgot[PLanguageIndex];
  //общежитий
  N8.Caption:=         st_ConstUnit.st_Main_Builds[PLanguageIndex];
  N8.Hint:=            st_ConstUnit.st_Main_Builds[PLanguageIndex];
  // адресов прописки
  dxBarButton12.Caption:=st_ConstUnit.st_Main_Propi_Builds[PLanguageIndex];
  dxBarButton12.Hint   :=st_ConstUnit.st_Main_Propi_Builds[PLanguageIndex];
  //субсидий
  N10.Caption:=         st_ConstUnit.st_Main_Subsidy[PLanguageIndex];
  N10.Hint:=            st_ConstUnit.st_Main_Subsidy[PLanguageIndex];
  //подразделений
  dxBarButton1.Caption:=         st_ConstUnit.st_Main_Pidpozdiliv[PLanguageIndex];
  dxBarButton1.Hint:=            st_ConstUnit.st_Main_Pidpozdiliv[PLanguageIndex];

  // классов категорий
  Class_kat.Caption:=         st_ConstUnit.st_Main_KatClass[PLanguageIndex];
  Class_kat.Hint:=            st_ConstUnit.st_Main_KatClass[PLanguageIndex];
  //типов категорий
  Type_Kat.Caption:=         st_ConstUnit.st_Main_KatType[PLanguageIndex];
  Type_Kat.Hint:=            st_ConstUnit.st_Main_KatType[PLanguageIndex];
  //состояний субсидий
  N11.Caption:=         st_ConstUnit.st_Main_SubStage[PLanguageIndex];
  N11.Hint:=            st_ConstUnit.st_Main_SubStage[PLanguageIndex];
  //типов комнат
  N12.Caption:=         st_ConstUnit.st_Main_TypeRoom[PLanguageIndex];
  N12.Hint:=            st_ConstUnit.st_Main_TypeRoom[PLanguageIndex];
  //проживающих в общ
  C2.Caption:=         st_ConstUnit.st_Main_LiveInBuilds[PLanguageIndex];
  C2.Hint:=            st_ConstUnit.st_Main_LiveInBuilds[PLanguageIndex];

  //работа
  //регистрация
  N9.Caption:=         st_ConstUnit.st_Main_Registration[PLanguageIndex];
  N9.Hint:=            st_ConstUnit.st_Main_Registration[PLanguageIndex];
  //просмотр по общ и комнатам
  Ser_BarButton.Caption:=         st_ConstUnit.st_BuildRoomLook[PLanguageIndex];
  Ser_BarButton.Hint:=            st_ConstUnit.st_BuildRoomLook[PLanguageIndex];
  //список ровд
  dxBarButton10.Caption:=         st_ConstUnit.st_ROVDList[PLanguageIndex];
  dxBarButton10.Hint:=            st_ConstUnit.st_ROVDList[PLanguageIndex];
  //универс пропуск
  Universal.Caption:=             st_ConstUnit.st_UniversalVisa[PLanguageIndex];
  Universal.Hint:=                st_ConstUnit.st_UniversalVisa[PLanguageIndex];
  //работа со счетами
  RahunokWork.Caption:=           st_ConstUnit.st_SchWork[PLanguageIndex];
  RahunokWork.Hint:=              st_ConstUnit.st_SchWork[PLanguageIndex];
  //субсидии
  N19.Caption:=                   st_ConstUnit.st_Subcidy[PLanguageIndex];
  N19.Hint:=                      st_ConstUnit.st_Subcidy[PLanguageIndex];
  //списки субсидир
  N20.Caption:=                   st_ConstUnit.st_SubcidyList[PLanguageIndex];
  N20.Hint:=                      st_ConstUnit.st_SubcidyList[PLanguageIndex];
  //прием списка субсидир
  N21.Caption:=                   st_ConstUnit.st_EntrySubcidyList[PLanguageIndex];
  N21.Hint:=                      st_ConstUnit.st_EntrySubcidyList[PLanguageIndex];
  //обработка списка субсидир
  N22.Caption:=                   st_ConstUnit.st_WorkEntrySubcidyList[PLanguageIndex];
  N22.Hint:=                      st_ConstUnit.st_WorkEntrySubcidyList[PLanguageIndex];

  //службы
  //список юзеров
  UserShow.Caption:=                    st_ConstUnit.st_UsersLook[PLanguageIndex];
  UserShow.Hint:=                       st_ConstUnit.st_UsersLook[PLanguageIndex];
  //список ошибок
  ErrorShow.Caption:=                   st_ConstUnit.st_ErrorsLook[PLanguageIndex];
  ErrorShow.Hint:=                      st_ConstUnit.st_ErrorsLook[PLanguageIndex];
  //юзеринфо
  User_Info.Caption:=                   st_ConstUnit.st_UserInfo[PLanguageIndex];
  User_Info.Hint:=                      st_ConstUnit.st_UserInfo[PLanguageIndex];

  //опции
  //скрывать логин
  LoginShow.Caption:=                   st_ConstUnit.st_LoginHide[PLanguageIndex];
  LoginShow.Hint:=                      st_ConstUnit.st_LoginHide[PLanguageIndex];
  //свернуть в трей
  OnTrayHide.Caption:=                  st_ConstUnit.st_TrayHide[PLanguageIndex];
  OnTrayHide.Hint:=                     st_ConstUnit.st_TrayHide[PLanguageIndex];
  //Настройка печатных форм
  OnPrintsForms.Caption:=               St_ConstUnit.st_PrintsForms[PLanguageIndex];
  OnPrintsForms.Hint:=                  St_ConstUnit.st_PrintsForms[PLanguageIndex];

  //?
  //о программе
  N2.Caption:=                          st_ConstUnit.st_About[PLanguageIndex];
  N2.Hint:=                             st_ConstUnit.st_About[PLanguageIndex];
  //система
  dxBarButton6.Caption:=                st_ConstUnit.st_System[PLanguageIndex];
  dxBarButton6.Hint:=                   st_ConstUnit.st_System[PLanguageIndex];
  //сайт
  N14.Caption:=                         st_ConstUnit.st_Site[PLanguageIndex];
  N14.Hint:=                            st_ConstUnit.st_Site[PLanguageIndex];
  //письмо
  dxBarButton8.Caption:=                st_ConstUnit.st_Mail[PLanguageIndex];
  dxBarButton8.Hint:=                   st_ConstUnit.st_Mail[PLanguageIndex];
  //форум
  dxBarButton9.Caption:=                st_ConstUnit.st_Forum[PLanguageIndex];
  dxBarButton9.Hint:=                   st_ConstUnit.st_Forum[PLanguageIndex];
  //отдохнуть
  dxBarSubItem7.Caption:=               st_ConstUnit.st_NeedRelax[PLanguageIndex];
  dxBarSubItem7.Hint:=                  st_ConstUnit.st_NeedRelax[PLanguageIndex];
  //паук
  dxBarButton7.Caption:=                st_ConstUnit.st_PaykPlay[PLanguageIndex];
  dxBarButton7.Hint:=                   st_ConstUnit.st_PaykPlay[PLanguageIndex];

  // лейблы логина фио_юзера
  User_Login_Label.Caption:=            st_ConstUnit.st_Login[PLanguageIndex];
  User_Login_FIO_Label.Caption:=        st_ConstUnit.st_User[PLanguageIndex];

  Hint_Label.Caption:=                  st_ConstUnit.st_Hint[PLanguageIndex] + #13 + st_ConstUnit.st_FirstBootHint[PLanguageIndex] ;
  // popup
  dxBarSubItem1.Caption:=               st_ConstUnit.st_Main_SpravBtn_Caption[PLanguageIndex];
  dxBarSubItem1.Hint:=                  st_ConstUnit.st_Main_SpravBtn_Caption[PLanguageIndex];
  dxBarSubItem3.Caption:=               st_ConstUnit.st_Subcidy[PLanguageIndex];
  dxBarSubItem3.Hint:=                  st_ConstUnit.st_Subcidy[PLanguageIndex];
  // работа попап
  dxBarSubItem2.Caption:=               st_ConstUnit.st_Main_WorkBtn_Caption[PLanguageIndex];
  dxBarSubItem2.Hint:=                  st_ConstUnit.st_Main_WorkBtn_Caption[PLanguageIndex];

     // popup
    dxBarSubItem4.Caption:=             st_ConstUnit.st_Windows_Tiltle[PLanguageIndex];
    dxBarSubItem4.Hint:=                st_ConstUnit.st_Windows_Tiltle[PLanguageIndex];
    dxBarButton5.Caption:=              st_ConstUnit.st_WindowsCacade[PLanguageIndex];
    dxBarButton5.Hint:=                 st_ConstUnit.st_WindowsCacade[PLanguageIndex];
    WindowTileItem.Caption:=            st_ConstUnit.st_WindowsHorizontal[PLanguageIndex];
    WindowTileItem.Hint:=               st_ConstUnit.st_WindowsHorizontal[PLanguageIndex];
    WindowTileItem2.Caption:=           st_ConstUnit.st_WindowsVertical[PLanguageIndex];
    WindowTileItem2.Hint:=              st_ConstUnit.st_WindowsVertical[PLanguageIndex];
    WindowMinimizeItem.Caption:=        st_ConstUnit.st_WindowsMinimizeAll[PLanguageIndex];
    WindowMinimizeItem.Hint:=           st_ConstUnit.st_WindowsMinimizeAll[PLanguageIndex];
    dxBarSubItem5.Hint:=                st_ConstUnit.st_HelpText[PLanguageIndex];
    dxBarButton4.Caption:=              st_ConstUnit.st_Main_ExitBtn_Caption[PLanguageIndex];
    dxBarButton4.Hint:=                 st_ConstUnit.st_Main_ExitBtn_Caption[PLanguageIndex];
    dxBarButton2.Hint:=                 st_ConstUnit.st_Main_ZvitBtn_Caption[PLanguageIndex];
    dxBarButton2.Caption:=              st_ConstUnit.st_Main_ZvitBtn_Caption[PLanguageIndex];
    LanguageBtn.Caption:=               st_ConstUnit.st_Language[PLanguageIndex];
    RusLngBtn.Caption:=                 st_ConstUnit.st_RusLng[PLanguageIndex];
    UkrLngBtn.Caption:=                 st_ConstUnit.st_UkrLng[PLanguageIndex];
    LanguageBtn.Hint:=               st_ConstUnit.st_Language[PLanguageIndex];
    RusLngBtn.Hint:=                 st_ConstUnit.st_RusLng[PLanguageIndex];
    UkrLngBtn.Hint:=                 st_ConstUnit.st_UkrLng[PLanguageIndex];
     // popup2
    N16.Caption:=                       st_ConstUnit.st_WindowsOnTop[PLanguageIndex];
    N16.Hint:=                          st_ConstUnit.st_WindowsOnTop[PLanguageIndex];
    N3.Caption:=                        st_ConstUnit.st_About[PLanguageIndex];
    N3.Hint:=                           st_ConstUnit.st_About[PLanguageIndex];
    N15.Caption:=                       st_ConstUnit.st_System[PLanguageIndex];
    N15.Hint:=                          st_ConstUnit.st_System[PLanguageIndex];
    N17.Caption:=                       st_ConstUnit.st_Main_ExitBtn_Caption[PLanguageIndex];
    N17.Hint:=                          st_ConstUnit.st_Main_ExitBtn_Caption[PLanguageIndex];

    SpravSmet.Caption:=                 st_ConstUnit.st_SpravSmet[PLanguageIndex];

    SpisanieBtn.Caption:=               st_ConstUnit.st_Spisanie[PLanguageIndex];
    SpisanieBtn.Hint:=                  st_ConstUnit.st_Spisanie[PLanguageIndex];

    dxBarButton14.Caption:=             st_ConstUnit.St_Services_title[PLanguageIndex];
    dxBarButton14.Hint:=                st_ConstUnit.St_Services_title[PLanguageIndex];
  end;

var
 reg: TRegistry;
begin
 MainFormInitializ;
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\Studcity\Options\LoginHide',False) then
  if reg.ReadString('LoginHide') = '1' then
   begin
   LoginShow.Down:=true;
   User_Login_Label.Visible:=false;
   User_Login_FIO_Label.Visible:=false;
   end
   else
  begin
  LoginShow.Down:=false;
  User_Login_Label.Visible:=true;
  User_Login_FIO_Label.Visible:=true;
  end
 finally
  reg.Free;
 end;

TrayIcon.Hint:=st_ConstUnit.st_SubSystem[PLanguageIndex]+ #13+
st_ConstUnit.st_LastCompile[PLanguageIndex]+DateTimeToStr(FileDateToDateTime(FileAge(Application.ExeName)));
Yes_IsCloseNow:=false;

Application.OnMinimize := ApplicationMinimize;
end;

procedure TMainForm.UserShowClick(Sender: TObject);
begin
AdminShowUsers(Self);
end;

procedure TMainForm.ErrorShowClick(Sender: TObject);
begin
 AdminShowErrors(Self);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var reg: TRegistry;
begin
FinalizeAdminSystem;
reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\Studcity\Options\LoginHide',True) then
   begin
    if LoginShow.down then
    reg.WriteString('LoginHide','1')
    else reg.WriteString('LoginHide','0');
   end
  finally
   reg.Free;
 end;

end;

procedure TMainForm.User_InfoClick(Sender: TObject);
var
name, full_name : string;
begin
full_name:='Группа не определена системой';
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text:='select * from ST_ROLES_SELECT('+ inttostr(AccessResult.ID_User) + ')';
ReadDataSet.Open;
if ReadDataSet['NAME_GROUP'] <> null then
name:= ReadDataSet['NAME_GROUP'];
if ReadDataSet['FULL_NAME'] <> null then
full_name := ReadDataSet['FULL_NAME'];
ReadDataSet.Close;
MessageDlg( st_ConstUnit.st_UserUser[PLanguageIndex]+
AccessResult.Name_user
+#13+
st_ConstUnit.st_FIOUser[PLanguageIndex]+
AccessResult.User_Fio
+#13+
st_ConstUnit.st_UserRole[PLanguageIndex] + full_name,
mtInformation, [mbOk], 0
);
end;

procedure TMainForm.LoginShowClick(Sender: TObject);
begin
if LoginShow.Down then
begin
User_Login_Label.Visible:=false;
User_Login_FIO_Label.Visible:=false;
end
else
begin                                                
User_Login_Label.Visible:=true;
User_Login_FIO_Label.Visible:=true;
end;
end;

procedure TMainForm.TrayIconClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ShowWindow(Application.Handle, SW_RESTORE);
Application.BringToFront;
end;

procedure TMainForm.N16Click(Sender: TObject);
begin
ShowWindow(Application.Handle, SW_RESTORE);
Application.BringToFront;
end;



procedure TMainForm.UniversalClick(Sender: TObject);
var
res: Variant;                                              
begin
res:=Load_List(self, DataModule1.DB.Handle);
end;

procedure TMainForm.Button2Click(Sender: TObject);
var res: variant;
begin
{res:=Load_Reestr(SELF,DataModule1.pFIBDatabase1.Handle);
ShowMessage(vartostr(res[0]));
ShowMessage(vartostr(res[1]));
ShowMessage(vartostr(res[2]));
ShowMessage(vartostr(res[3]));}


{res:=Load_Sp_Category(SELF,DataModule1.pFIBDatabase1.Handle,true, true);
ShowMessage(vartostr(res[0]));
ShowMessage(vartostr(res[1]));
ShowMessage(vartostr(res[2]));
ShowMessage(vartostr(res[3]));}                        
end;

procedure TMainForm.MainMenuFocusActionExecute(Sender: TObject);
begin
if MainForm.MDIChildCount = 0 then
N7.DropDown;
end;

procedure TMainForm.RahunokWorkClick(Sender: TObject);
begin
GetStAccounts(self,DataModule1.DB.Handle,AccessResult.ID_User, AccessResult.Name_user, AccessResult.Password);
end;

procedure TMainForm.SpravSmetClick(Sender: TObject);
var frmSprav: TfrmSprav;
    frmSpravReportSettings: TfrmSpravReportSettings;
begin
if MessageBox(Handle,PChar(st_ConstUnit.st_LoadProcess[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;

 frmSpravReportSettings := TfrmSpravReportSettings.Create(self);
 if frmSpravReportSettings.ShowModal = mrOk then
 begin
   screen.Cursor := crHourGlass;
   frmSprav:= TfrmSprav.Create(self);
   frmSprav.DataSet.SelectSQL.Clear;
   if frmSpravReportSettings.Payers_RadioButton.Checked then
    frmSprav.DataSet.SelectSQL.Text:= 'select ID_KOD from ST_SPRAV_FIO_SELECT('
                                       + ''''+ datetostr(frmSpravReportSettings.cxDateEdit1.date)+''''+ ')'
   else
    frmSprav.DataSet.SelectSQL.Text:= 'select ID_KOD from ST_SPRAV_FIO_SELECT(' +
                                       ''''+ '01.01.1900' + ''''+ ')';
   frmSpravReportSettings.Free;
{   frmSprav.DataSet.Open;
   frmSprav.DataSet.FetchAll;
   frmSprav.DataSet.First;
   frmSprav.ProgressBar.Properties.Max := frmSprav.DataSet.RecordCount;}
   //frmSprav.Timer1.Enabled:=true;
   frmSprav.CloseButton.Caption := st_ConstUnit.st_Cancel[PLanguageIndex];
   frmSprav.Caption := st_ConstUnit.st_SpravCaption[PLanguageIndex];
//   frmSprav.countLabel.Caption := inttostr(frmSprav.DataSet.RecordCount);
   frmSprav.ShowModal;
   frmSprav.DataSet.Close;
 end;
 end;

procedure TMainForm.Whats_New_ButtonClick(Sender: TObject);
var
  Res:Variant;
begin
  {Perchak}
//  Res:= Load_st_WhatsNew(self);
end;
procedure TMainForm.SpisanieBtnClick(Sender: TObject);
var
  ResOpl:Variant;
begin
  ResOpl:= Load_Spisanie(self,DataModule1.DB.Handle,false, AccessResult.ID_User);
end;

procedure TMainForm.RusLngBtnClick(Sender: TObject);
var   reg: TRegistry;
begin
if RusLngBtn.Down then UkrLngBtn.Down:= false;
      reg := TRegistry.Create;
      try
       reg.RootKey:=HKEY_CURRENT_USER;
       if  reg.OpenKey('\Software\Studcity\Options\Language',True) then
       begin
        if UkrLngBtn.Down then
         reg.WriteString('Index','1');
        if RusLngBtn.Down then
         reg.WriteString('Index','2');
       end
      finally
       reg.Free;
     end;
Showmessage( pchar(st_ConstUnit.st_NeedReboot[PLanguageIndex]));
end;

procedure TMainForm.UkrLngBtnClick(Sender: TObject);
var   reg: TRegistry;
begin
if UkrLngBtn.Down then RusLngBtn.Down:= false;
      reg := TRegistry.Create;
      try
       reg.RootKey:=HKEY_CURRENT_USER;
       if  reg.OpenKey('\Software\Studcity\Options\Language',True) then
       begin
        if UkrLngBtn.Down then
         reg.WriteString('Index','1');
        if RusLngBtn.Down then
         reg.WriteString('Index','2');
       end
      finally
       reg.Free;
     end;
Showmessage( pchar(st_ConstUnit.st_NeedReboot[PLanguageIndex]));
end;

procedure TMainForm.dxBarButton12Click(Sender: TObject);
Var
 PB:Tfrm_AdresaPropiski;
begin
 Screen.Cursor:=crSQLWait;
 PB:=Tfrm_AdresaPropiski.Create(Self);
 //PB.BorderStyle:=bsSizeable;
 //PB.FormStyle:=fsMDIChild;
 screen.Cursor:=crDefault;
 PB.AddButton.Visible:=ivAlways;
 PB.EditButton.Visible:=ivAlways;
 PB.DeleteButton.Visible:=ivAlways;
 Pb.SelectButton.Enabled:=False;
 pb.Show;
end;

procedure TMainForm.dxBarButton13Click(Sender: TObject);
begin
 if fibCheckPermission('/ROOT/Studcity/Sp_OplSub','View') <> 0 then
 begin
  messagebox(handle,
  pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
  +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
  pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
  exit;
 end;
 LoadPackegeStudCity.LoadReestrSuds(self,DataModule1.DB.Handle);
end;

procedure TMainForm.OnPrintsFormsClick(Sender: TObject);
begin
 if fibCheckPermission('/ROOT/Studcity/Object','View') <> 0 then
 begin
  messagebox(handle,
  pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
  +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
  pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
  exit;
 end;
 LoadPackegeStudCity.LoadPrintForms(self,DataModule1.DB.Handle);
end;

procedure TMainForm.dxBarBtnPaspDataClick(Sender: TObject);
begin
    getPaspData(self);
end;

procedure TMainForm.dxBarButton14Click(Sender: TObject);
var
  aParameter : TstSimpleParams;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  RunFunctionFromPackage(aParameter, 'Studcity\st_services.bpl', 'getServices');

  aParameter.Free;
end;

procedure TMainForm.BarButton_fiz_licaClick(Sender: TObject);
begin
  AllPeopleUnit.GetManForASUP(Self, DataModule1.DB.Handle, False, True, -1);
end;

procedure TMainForm.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
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
            if UpperCase((Components[i] as TcxButton).Caption)= st_ConstUnit.st_Accept[PLanguageIndex] then
                (Components[i] as TcxButton).OnClick(self);
          end;
       end;
end;

procedure TMainForm.dxBarButton16Click(Sender: TObject);
var
  aParameter : TstSimpleParams;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  RunFunctionFromPackage(aParameter, 'Studcity\st_sp_effective_area.bpl', 'ShowSpEffectiveArea');

  aParameter.Free;
end;

procedure TMainForm.dxBarButton17Click(Sender: TObject);
var
  aParameter : TstSimpleParams;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  RunFunctionFromPackage(aParameter, 'Studcity\st_sp_tarif.bpl', 'ShowSpTarif');

  aParameter.Free;
end;

procedure TMainForm.dxBarButton18Click(Sender: TObject);
var
  aParameter : TstSimpleParams;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  RunFunctionFromPackage(aParameter, 'Studcity\st_sp_norma.bpl', 'ShowSpNorma');

  aParameter.Free;
end;

procedure TMainForm.dxBarButton19Click(Sender: TObject);
var
  aParameter : TstSimpleParams;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  AParameter.Formstyle       := fsMDIChild;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  RunFunctionFromPackage(aParameter, 'Studcity\st_prices.bpl', 'ShowSPPrices');

  aParameter.Free;
end;

end.
