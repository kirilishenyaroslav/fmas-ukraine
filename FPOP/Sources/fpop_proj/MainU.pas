unit MainU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, tagBaseTypes, tagSYS_OPTIONS, sp_Object_Form, ImgList,
  dt_Plan_Form, dt_Pair_Scheme, Object_Scheme, dt_Plan_Type_Form,
// Other
  AppEvnts, StdCtrls, ToolWin, Buttons,
  ExtCtrls, cxGraphics, dxBar, cxControls, dxStatusBar;

type
  TOpt = packed record
   _sp_Product       : TSpravOptions;
   _ini_UnitM        : TSpravOptions;
   _dt_Cost_Product  : TSpravOptions;
   _ini_Cat_Customer : TSpravOptions;
   _sp_Object        : TSpravOptions;
   _dt_Pair_Scheme   : TSpravOptions;
   _dt_Plan_Type     : TSpravOptions;
   _sp_Price_GRP     : TSpravOptions;
  end;

  TMainForm = class(TForm)
    ApplicationEvents: TApplicationEvents;
    Act_ImageList: TImageList;
    StatusBar1: TdxStatusBar;
    BarManager: TdxBarManager;
    N5: TdxBarButton;
    N20: TdxBarButton;
    dgff1: TdxBarButton;
    N1: TdxBarSubItem;
    N6: TdxBarButton;
    N8: TdxBarButton;
    N10: TdxBarButton;
    N11: TdxBarButton;
    N13: TdxBarButton;
    N15: TdxBarButton;
    N18: TdxBarButton;
    N19: TdxBarButton;
    N22: TdxBarButton;
    N2: TdxBarSubItem;
    N7: TdxBarButton;
    N9: TdxBarButton;
    N14: TdxBarButton;
    MinimizeAllBtn: TdxBarButton;
    N16: TdxBarButton;
    N3: TdxBarSubItem;
    TB_Exit: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    TB_ReLogin: TdxBarButton;
    dxBarButton1: TdxBarButton;
    StatusBar1Container2: TdxStatusBarContainerControl;
    AboutButton: TSpeedButton;
    AdminLabel: TLabel;
    dxBarButton9: TdxBarButton;
    AdminBtn: TdxBarSubItem;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    procedure N4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure WMTray(var Msg : TMessage);message WM_TRAY_ICON;
    procedure ApplicationEventsMinimize(Sender: TObject);
    procedure TileHorClick(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Arrangeicons1Click(Sender: TObject);
    procedure TileVertClick(Sender: TObject);
    procedure CloseAllButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MinimizeAllBtnClick(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure dgff1Click(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure TB_ExitClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure AboutButtonClick(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CreateTaskBarIcon;
    procedure DeleteTaskBarIcon;
    procedure HideTaskBarIcon;
    class procedure GlobalExceptionHandler(Sender: TObject; E: Exception);
  end;

var
  MainForm         : TMainForm;
  Opt              : TOpt;
implementation

uses DataModule, ShellAPI, Splash, SysAdmin, MDIToolBar, dt_IntMoving_Plan_Editor,
     fpop_PackageLoader;

{$R *.DFM}

const
 DEF_BUTTON_WIDTH = 120;

procedure TMainForm.WMTray(var Msg : TMessage);
begin
{ if Msg.LParam = WM_LBUTTONDOWN then begin
  Show;
  Application.Restore;
  SetForegroundWindow(Handle);
  DeleteTaskBarIcon;
 end;}
end;

procedure TMainForm.CreateTaskBarIcon;
{var
 tbnaStruct: TNotifyIconData;
 hIcon1: HICON;}
begin
{ hIcon1 := Application.Icon.Handle;
 with tbnaStruct do begin
  cbSize := SizeOf(TNotifyIconData);
  Wnd    := Handle;
  uID    := 0;
  uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
  szTip  := 'Планування';
  hIcon  := hIcon1;
  uCallbackMessage := WM_TRAY_ICON;
 end;
 Shell_NotifyIcon( NIM_ADD, @tbnaStruct );}
end;

procedure TMainForm.HideTaskBarIcon;
{var
 tbnaStruct: TNotifyIconData;
 hIcon1: HICON;}
begin
{ hIcon1 := Icon.Handle;
 with tbnaStruct do begin
  cbSize := SizeOf(TNotifyIconData);
  Wnd    := Handle;
  uID    := 0;
  uFlags := 0;
  szTip  := 'Планування';
  hIcon  := hIcon1;
  uCallbackMessage := WM_TRAY_ICON;
 end;
 Shell_NotifyIcon( NIM_MODIFY, @tbnaStruct );}
end;

procedure TMainForm.DeleteTaskBarIcon;
{var
 tbnaStruct: TNotifyIconData;}
begin
{ with tbnaStruct do begin
  cbSize := SizeOf(TNotifyIconData);
  Wnd    := handle;
  uID    := 0;
 end;
 Shell_NotifyIcon( NIM_DELETE, @tbnaStruct );}
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
 Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
{var
 i : integer;}
begin
// for i := 0 to dm.DataBase.TransactionCount do if  dm.DataBase.Transactions[i].Active then dm.DataBase.Transactions[i].Rollback;

 WriteIniFile;

 SysAdmin.FinalizeAdminSystem;

 dm.ReadTransaction.Rollback;
 dm.DataBase.Close;

// DeleteTaskBarIcon;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
 p : TMDITool;
begin
 p := TMDITool.Create;
 p.AddMDIToolBar(Self);

 FormResize(Sender);
// DeleteTaskBarIcon;
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
 Show_sp_Product(Self, dm.DataBase.Handle, dm.ReadTransaction.Handle, fsMDIChild);
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
 ShowCatCustomer(Self, dm.DataBase.Handle, dm.ReadTransaction.Handle, fsMDIChild);
end;

procedure TMainForm.N13Click(Sender: TObject);
begin
 sp_Object_Form.PanelVisible := True;
 sp_Object_Form1.tagShow(Opt._sp_Object);
end;

procedure TMainForm.N5Click(Sender: TObject);
begin
 Application.CreateForm(Tdt_Plan_Form1, dt_Plan_Form1);
end;

procedure TMainForm.ApplicationEventsMinimize(Sender: TObject);
begin
{ CreateTaskBarIcon;
 Hide;}
end;

procedure TMainForm.TileHorClick(Sender: TObject);
begin
 TileMode := tbHorizontal;
 Tile;
end;

procedure TMainForm.Cascade1Click(Sender: TObject);
begin
 Cascade;
end;

procedure TMainForm.Arrangeicons1Click(Sender: TObject);
begin
 ArrangeIcons;
end;

procedure TMainForm.TileVertClick(Sender: TObject);
begin
 TileMode := tbVertical;
 Tile;
end;

procedure TMainForm.CloseAllButtonClick(Sender: TObject);
var
 i : integer;
begin
 for i := 0 to MDIChildCount - 1 do
  MDIChildren[i].Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 AdminLabel.Visible := ADMIN_MODE;
 AdminLabel.Top     := Height - 85;

 Opt._sp_Product.isModal        := FormStyle = fsNormal;
 Opt._sp_Product.canAdd         := (SYS_DEF_ID_DEPARTMENT = 2612);
 Opt._sp_Product.canEdit        := (SYS_DEF_ID_DEPARTMENT = 2612);
 Opt._sp_Product.canDelete      := (SYS_DEF_ID_DEPARTMENT = 2612);
 Opt._sp_Product.HideButtons    := false;
 Opt._sp_Product.canSelect      := False;
 Opt._sp_Product.canSelect2     := false;
 Opt._sp_Product.MoveUp         := (SYS_DEF_ID_DEPARTMENT = 2612);
 Opt._sp_Product.MoveDown       := (SYS_DEF_ID_DEPARTMENT = 2612);

 Opt._dt_Plan_Type     := opt._sp_Product;
 Opt._ini_Cat_Customer := opt._sp_Product;
 Opt._ini_UnitM        := opt._sp_Product;

{ Opt._ini_UnitM.isModal        := FormStyle = fsNormal;
 Opt._ini_UnitM.canAdd         := False;
 Opt._ini_UnitM.canEdit        := False;
 Opt._ini_UnitM.canDelete      := False;
 Opt._ini_UnitM.HideButtons    := false;
 Opt._ini_UnitM.canSelect      := False;
 Opt._ini_UnitM.canSelect2     := false;
 Opt._ini_UnitM.MoveUp         := false;
 Opt._ini_UnitM.MoveDawn       := false;}

 Opt._sp_Object       := Opt._ini_UnitM;
 Opt._dt_Cost_Product := Opt._ini_UnitM;

 StatusBar1.Panels[2].Text := 'База даних [' + DB_PATH + ']';
 StatusBar1.Panels[3].Text := 'Версія: ' + DateToStr(FileDateToDateTime(FileAge(Application.ExeName))) + ' р.';

 SysAdmin.InitializaAdminSystem(Self, dm.Database.Handle, 777, id_user, ADMIN_MODE);

 if not ADMIN_MODE then AdminBtn.Visible := ivNever;
end;

procedure TMainForm.MinimizeAllBtnClick(Sender: TObject);
var
 i : integer;
begin
 for i := 0 to MDIChildCount - 1 do
  MDIChildren[i].WindowState := wsMinimized;
end;

procedure TMainForm.N15Click(Sender: TObject);
begin
 dt_Pair_Scheme_Form.tagShow(Opt._dt_Pair_Scheme);
end;

procedure TMainForm.dgff1Click(Sender: TObject);
begin
 Object_Scheme_Form.tagShow(Opt._dt_Pair_Scheme);
end;

procedure TMainForm.ApplicationEventsHint(Sender: TObject);
begin
 StatusBar1.Panels[1].Text := Application.Hint;
// HintStyleController.ShowHint(Mouse.CursorPos.X, Mouse.CursorPos.Y, 'Підказка', Application.Hint);
end;

procedure TMainForm.N18Click(Sender: TObject);
begin
 dt_Plan_Type_Form1.tagShow(Opt._dt_Plan_Type);
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 CanClose := (MessageDlg('Підтвердження', 'Чи дійсно Ви бажаєте вийти?',
  mtConfirmation, [mbYes, mbNo]) = mrYes);
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
 StatusBar1.Panels[2].Width := Width - 300 - 150 - 20;
end;

procedure TMainForm.N22Click(Sender: TObject);
{var
    sp: TDepartmentsSprav;}
begin
     // создать справочник
{ sp :=  TDepartmentsSprav.Create;
 if sp <> nil then begin
      // заполнить входные параметры
  with sp.Input do begin
   Append;
   FieldValues['DBHandle'] := Integer(DM.Database.Handle);
       // модальный показ
   FieldValues['ShowStyle'] := 0;
       // единичная выборка
   FieldValues['Select'] := 1;

   FieldValues['Root_Department'] := 2612;
   FieldValues['Actual_Date'] := Date;
   Post;
  end;
 end;
     // показать справочник и проанализировать результат (выбор одного подр.)
 sp.Show;

 sp.Free;}
end;

procedure TMainForm.TB_ExitClick(Sender: TObject);
begin
 Close;
end;

procedure TMainForm.ToolButton1Click(Sender: TObject);
begin
 if ActiveMDIChild = nil then Exit;

 if ActiveMDIChild.ActiveControl is TCustomEdit
  then (ActiveMDIChild.ActiveControl as TCustomEdit).CopyToClipboard;
end;

procedure TMainForm.ToolButton2Click(Sender: TObject);
begin
 if ActiveMDIChild = nil then Exit;

 if ActiveMDIChild.ActiveControl is TCustomEdit
  then (ActiveMDIChild.ActiveControl as TCustomEdit).CutToClipboard;
end;

procedure TMainForm.ToolButton3Click(Sender: TObject);
begin
 if ActiveMDIChild = nil then Exit;
 
 if ActiveMDIChild.ActiveControl is TCustomEdit
  then (ActiveMDIChild.ActiveControl as TCustomEdit).PasteFromClipboard;
end;

procedure TMainForm.AboutButtonClick(Sender: TObject);
var
 f : TSplashForm;
begin
 f := TSplashForm.Create(Self);
 f.ConnectLabel.Visible := False;
 f.Height := 288;
 f.ShowInfo;
 f.Show;
end;

class procedure TMainForm.GlobalExceptionHandler(Sender: TObject;
  E: Exception);
{var
  MapFileAddress: DWORD;
  UnitName,
  ProcedureName,
  LineNumber: string;
//const
//  CrLf = #10#13;}
begin
{  MapFileAddress := GetMapAddressFromAddress(DWORD(ExceptAddr));
  UnitName := GetModuleNameFromAddress(MapFileAddress);
  ProcedureName := GetProcNameFromAddress(MapFileAddress);
  LineNumber := GetLineNumberFromAddress(MapFileAddress);

  ShowMessage(
    'Exception ' + E.Message + CrLf + CrLf +
    ' в файле: ' + UnitName + CrLf +
    ' в процедуре: ' + ProcedureName + CrLf +
    ' в строке: ' + LineNumber);}
end;

procedure TMainForm.dxBarButton10Click(Sender: TObject);
begin
 SysAdmin.AdminShowUsers(Self);
end;

{initialization
  LoadAndParseMapFile;
  Application.OnException := TMainForm.GlobalExceptionHandler;
finalization
  CleanUpMapFile;  }
procedure TMainForm.N20Click(Sender: TObject);
var
 f : Tdt_IntMoving_Plan_EditorForm;
begin
 f := Tdt_IntMoving_Plan_EditorForm.Create(Self);
 f.Show;
end;

procedure TMainForm.dxBarButton4Click(Sender: TObject);
begin
 N20Click(Sender);
end;

procedure TMainForm.N10Click(Sender: TObject);
var
 i, o  : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i.Values['DataBase'] := Integer(dm.Database.Handle);
 i.Values['ReadTransaction'] := Integer(dm.ReadTransaction.Handle);
 i.Values['WriteTransaction'] := Integer(dm.WriteTransaction.Handle);
 i.Values['FormStyle'] := fsMDIChild;
 LoadSprav('FPOP\ini_unit_meas.bpl', Self, i, o);
end;

end.
