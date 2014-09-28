//******************************************************************************
// Проект "Контракты"
// Реестр контрактов
// Чернявский А.Э. 2005г.
//******************************************************************************

unit Default_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls;

type
  TfrmDefault = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    HotKey_StatusBar: TdxStatusBar;
    HotKey_StatusBarContainer5: TdxStatusBarContainerControl;
    Progress: TcxProgressBar;
    dxStatusBar1: TdxStatusBar;
  private
  public

  end;


implementation

{$R *.dfm}



end.
