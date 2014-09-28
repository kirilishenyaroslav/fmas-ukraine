unit SpAllPeople_MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, ImgList, dxBar, cxControls, dxStatusBar, SpAllPeople_AccessForm,
  SysAdmin, SpAllPeople_DataModule, SpPeople_ZMessages, AllPeopleUnit;

type
  TfMainMenu = class(TForm)
    brmMain: TdxBarManager;
    mnuWork: TdxBarSubItem;
    mnuExit: TdxBarButton;
    Images: TImageList;
    dxStatusBar: TdxStatusBar;
    smnSpAllPeople: TdxBarButton;
    procedure FormShow(Sender: TObject);
    procedure dxStatusBarResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure brmMainClickItem(Sender: TdxBarManager;
      ClickedItem: TdxBarItem);
    procedure smnSpAllPeopleClick(Sender: TObject);
  private
    { Private declarations }
    PUser:TAccessResult;
    procedure MaximizeMDIChild(Sender:TObject);
    procedure SpAllPeople_CloseAllWindows;
  public
    { Public declarations }
    property User:TAccessResult read PUser write PUser;
  end;

var
  FMainMenu:TfMainMenu;

implementation

{$R *.dfm}

procedure TfMainMenu.MaximizeMDIChild(Sender:TObject);
begin
 if (Sender is TForm) then
  if TForm(Sender).FormStyle=fsMDIChild then
   try
//     TForm(Sender).Refresh;
{     TForm(Sender).FormStyle:=fsNormal;
     TForm(Sender).Hide;       }
     TForm(Sender).OnShow:=nil;
  //   TForm(Sender).FormStyle:=fsMDIChild;
     TForm(Sender).WindowState:=wsMaximized;
 //    TForm(Sender).Show;
   finally
   end
end;

procedure TfMainMenu.SpAllPeople_CloseAllWindows;
var
  i:integer;
begin
  for i:=0 to Application.MainForm.MDIChildCount-1 do
    Application.MainForm.MDIChildren[i].Close;
end;

procedure TfMainMenu.FormShow(Sender: TObject);
begin
 dxStatusBar.Panels[1].Text:=User.DbPath;
 dxStatusBar.Panels[2].Text:=User.User_Fio;
 dxStatusBar.Panels[3].Text:=DateToStr(Date);
//******************************************************************************
 smnSpAllPeopleClick(Self);
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
 if ZShowMessage('Вихід','Ви дійсно бажаєте'+#13+'покинути систему?',mtConfirmation,[mbYes,mbNo])=mrYes then
  begin
   SysAdmin.FinalizeAdminSystem;
   SpAllPeople_CloseAllWindows;
   DM.DB.DefaultTransaction.Active:=False;
   Action:=caFree;
  end
 else
  Action:=caNone;
end;

procedure TfMainMenu.FormCreate(Sender: TObject);
begin
 WindowState:=wsMaximized;
 DM.DB.DefaultTransaction.Active:=True;
 SysAdmin.InitializaAdminSystem(Self, DM.DB.Handle, 9999 ,PUser.ID_User);
//******************************************************************************
 Caption:='Довідник фізичних осіб';
//******************************************************************************
end;

procedure TfMainMenu.mnuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMainMenu.brmMainClickItem(Sender: TdxBarManager;
  ClickedItem: TdxBarItem);
begin
  Refresh;
end;

procedure TfMainMenu.smnSpAllPeopleClick(Sender: TObject);
var i:Integer;
begin
  AllPeopleUnit.ShowSp(Self,DM.DB.Handle,True);
  for i:=0 to ComponentCount-1 do
    if Components[i] is TForm then
      if (UpperCase(Components[i].ClassName)=UpperCase('TfSpPeople')) and ((Components[i] as TForm).FormStyle=fsStayOnTop) then
        TForm(Components[i]).OnShow:=MaximizeMDIChild;  
end;

end.
