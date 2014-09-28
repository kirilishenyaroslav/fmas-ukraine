unit TIMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, dxStatusBar, dxBar, dxBarExtItems,AccMGMT,
  ZProc, dates, ImgList, StdCtrls,TICommonLoader, jpeg, ExtCtrls, ibase,
  RxGIF;

type
  TFormMain = class(TForm)
    dxStatusBar: TdxStatusBar;
    BarManager: TdxBarManager;
    BarStaticFirm: TdxBarStatic;
    ZvitMainMenu: TdxBarSubItem;
    TaxInvoicesMainMenu: TdxBarButton;
    Images: TImageList;
    Label1: TLabel;
    AboutSubMainMenu: TdxBarSubItem;
    AboutProgPunktMainMenu: TdxBarButton;
    WhatsNewBtn: TdxBarButton;
    ExitPunktMainMenu: TdxBarButton;
    WindowSubMenu: TdxBarSubItem;
    CascadePunktMainMenu: TdxBarButton;
    TileGorPunktMainMenu: TdxBarButton;
    TileVerPunktMainMenu: TdxBarButton;
    MinAllPunktMainMenu: TdxBarButton;
    CloseAllWindowsPunktMainMenu: TdxBarButton;
    NormAllPunktMainMenu: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    FonImage: TImage;
    SubDivisionLargeButton: TdxBarLargeButton;
    SettingProvBarButton: TdxBarButton;
    procedure dxStatusBarResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TaxInvoicesMainMenuClick(Sender: TObject);
    procedure ExitPunktMainMenuClick(Sender: TObject);
    procedure CascadePunktMainMenuClick(Sender: TObject);
    procedure TileGorPunktMainMenuClick(Sender: TObject);
    procedure TileVerPunktMainMenuClick(Sender: TObject);
    procedure MinAllPunktMainMenuClick(Sender: TObject);
    procedure NormAllPunktMainMenuClick(Sender: TObject);
    procedure CloseAllWindowsPunktMainMenuClick(Sender: TObject);
    procedure WindowSubMenuPopup(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure AboutProgPunktMainMenuClick(Sender: TObject);
    procedure WhatsNewBtnClick(Sender: TObject);
    procedure SubDivisionLargeButtonClick(Sender: TObject);
    procedure SettingProvBarButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses TIMainDM, FIBDatabase;

{$R *.dfm}

procedure TFormMain.dxStatusBarResize(Sender: TObject);
begin
 dxStatusBar.Panels[1].Width:=Round(dxStatusBar.Width/3);;
 dxStatusBar.Panels[2].Width:=Round(dxStatusBar.Width/5);
 dxStatusBar.Panels[3].Width:=Round(dxStatusBar.Width/10);
 dxStatusBar.Panels[4].Width:=Round(dxStatusBar.Width/10);
 dxStatusBar.Panels[0].Width:=dxStatusBar.Width-dxStatusBar.Panels[1].Width-dxStatusBar.Panels[2].Width-dxStatusBar.Panels[3].Width-dxStatusBar.Panels[4].Width-10;
end;

procedure TFormMain.FormShow(Sender: TObject);
var
 CurrKod:Integer;
begin
 //Caption := Caption + ' '+VarToStrDef(GetNameFirm(ZDataModule.DBZarplata.Handle,'NAME_SHORT'),'');
 CurrKod := CurrentKodSetup(DM.DB.Handle);
 BarStaticFirm.Caption := KodSetupToPeriod(CurrKod,4);

 dxStatusBar.Panels[1].Text:=AccMGMT.fibGetCurrentDBPath;
 dxStatusBar.Panels[2].Text:= AccMGMT.GetUserFIO;
 dxStatusBar.Panels[3].Text:=DateToStr(Date);
end;

procedure TFormMain.TaxInvoicesMainMenuClick(Sender: TObject);
var
  Parameter:TTiSimpleParam;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  DoFunctionFromPackage(Parameter,TaxInvoices_Const);
  Parameter.Destroy;
end;

procedure TFormMain.ExitPunktMainMenuClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.CascadePunktMainMenuClick(Sender: TObject);
begin
  Application.MainForm.Cascade;
end;

procedure TFormMain.TileGorPunktMainMenuClick(Sender: TObject);
begin
  Application.MainForm.TileMode:=tbHorizontal;
  Application.MainForm.Tile;
end;

procedure TFormMain.TileVerPunktMainMenuClick(Sender: TObject);
begin
  Application.MainForm.TileMode:=tbVertical;
  Application.MainForm.Tile;
end;

procedure TFormMain.MinAllPunktMainMenuClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=Application.MainForm.MDIChildCount-1 downto 0 do
  Application.MainForm.MDIChildren[i].WindowState:=wsMinimized;
end;

procedure TFormMain.NormAllPunktMainMenuClick(Sender: TObject);
var i:integer;
begin
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    Application.MainForm.MDIChildren[i].WindowState:=wsNormal;
end;

procedure TFormMain.CloseAllWindowsPunktMainMenuClick(Sender: TObject);
var i:integer;
begin
     for i:=0 to Application.MainForm.MDIChildCount-1 do
     Application.MainForm.MDIChildren[i].Close;
end;

procedure TFormMain.WindowSubMenuPopup(Sender: TObject);
begin
  CascadePunktMainMenu.Enabled := Application.MainForm.MDIChildCount>0;
  TileGorPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>1;
  TileVerPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>1;
  CloseAllWindowsPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>0;
  MinAllPunktMainMenu.Enabled  := Application.MainForm.MDIChildCount>0;
  NormAllPunktMainMenu.Enabled := Application.MainForm.MDIChildCount>0;
end;

procedure TFormMain.dxBarButton1Click(Sender: TObject);
var
  Parameter:TTiSimpleParam;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  DoFunctionFromPackage(Parameter,TaxInvoicesEdit_Const);
  Parameter.Destroy;
end;

procedure TFormMain.dxBarButton2Click(Sender: TObject);
var
  Parameter:TTiSimpleParam;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner     := self;
  DoFunctionFromPackage(Parameter,PDVTaxInvoces_Const);
  Parameter.Destroy;
end;


procedure TFormMain.AboutProgPunktMainMenuClick(Sender: TObject);
var
  Parameter:TTiSimpleParam;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner     := self;
  DoFunctionFromPackage(Parameter,TIAuthors_Const);
  Parameter.Destroy;
end;

procedure TFormMain.WhatsNewBtnClick(Sender: TObject);
begin
  LoadWhatsNew(self,'NDS_Whats_New.txt');
end;

procedure TFormMain.SubDivisionLargeButtonClick(Sender: TObject);
var
  Parameter:TTiSimpleParam;
  SubDivision:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner     := self;
  SubDivision         := DoFunctionFromPackage(Parameter,Subdivision_Const);
  Parameter.Destroy;

 { If VarArrayDimCount(KodTovar)>0 then
  begin
    KodTovarButtonEdit.Text   := KodTovar[1];
    PParameter.id_kod_tovar   := KodTovar[0];
    PParameter.Name_Kod_tovar := KodTovar[1];
    KodTovarButtonEdit.SetFocus;
  end;   }
end;

procedure TFormMain.SettingProvBarButtonClick(Sender: TObject);
var
  Parameter:TTiSimpleParam;
  SettingProvodka:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner     := self;
  SettingProvodka     := DoFunctionFromPackage(Parameter,SettingProvodka_Const);
  Parameter.Destroy;
end;

end.
