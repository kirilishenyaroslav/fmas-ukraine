unit cn_Preferences;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxContainer, cxEdit, cxCheckBox, cxControls, cxGroupBox,
  ComCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxImage, ExtCtrls,
  cxRadioGroup, SHellAPI, cxTextEdit, RxGIF;

type
  TfrmOptions = class(TForm)
    PageControl: TPageControl;
    TabSheet_1: TTabSheet;
    GroupBox: TcxGroupBox;
    Desctop_Check: TcxCheckBox;
    StartMenu_Check: TcxCheckBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Image: TcxImage;
    Sheet2: TTabSheet;
    GroupBox2: TcxGroupBox;
    NotExitConfirm_CheckBox: TcxCheckBox;
    Russian_Lang: TcxRadioButton;
    Ukr_Lang: TcxRadioButton;
    Image1: TImage;
    Image2: TImage;
    Language: TLabel;
    Bevel1: TBevel;
    NotPrevedBaloon_CheckBox: TcxCheckBox;
    Preved_Edit: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Russian_LangClick(Sender: TObject);
    procedure Ukr_LangClick(Sender: TObject);
    procedure Preved_EditEnter(Sender: TObject);
  private
    { Private declarations }
  public
    ToolTipTitle : String;
    ToolTipString : PWideChar;
  end;

implementation

{$R *.dfm}

procedure ShowBalloonTip(Control: TWinControl; Icon: integer; Title: pchar;
                         Text: PWideChar; BackCL, TextCL: TColor);
const   TOOLTIPS_CLASS = 'tooltips_class32';
        TTS_ALWAYSTIP = $01;
        TTS_NOPREFIX = $02;
        TTS_BALLOON = $40;
        TTF_SUBCLASS = $0010;
        TTF_TRANSPARENT = $0100;
        TTF_CENTERTIP = $0002;
        TTM_ADDTOOL = $0400 + 50;
        TTM_SETTITLE = (WM_USER + 32);
        ICC_WIN95_CLASSES = $000000FF;
type   TOOLINFO = packed record
         cbSize: Integer;
         uFlags: Integer;
         hwnd: THandle;
         uId: Integer;
         rect: TRect;
         hinst: THandle;
         lpszText: PWideChar;
         lParam: Integer;
end;
var   hWndTip: THandle;   ti: TOOLINFO;   hWnd: THandle;
begin
hWnd := Control.Handle;
hWndTip := CreateWindow(TOOLTIPS_CLASS, nil, WS_POPUP or TTS_NOPREFIX or TTS_BALLOON or TTS_ALWAYSTIP,     0, 0, 0, 0, hWnd, 0, HInstance, nil);   if hWndTip <> 0 then   begin     SetWindowPos(hWndTip, HWND_TOPMOST, 0, 0, 0, 0,       SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);     ti.cbSize := SizeOf(ti);     ti.uFlags := TTF_CENTERTIP or TTF_TRANSPARENT or TTF_SUBCLASS;
ti.hwnd := hWnd;     ti.lpszText := Text;     Windows.GetClientRect(hWnd, ti.rect);
SendMessage(hWndTip, TTM_ADDTOOL, 1, Integer(@ti));
SendMessage(hWndTip, TTM_SETTITLE, Icon mod 4, Integer(Title));
end;
end;

procedure TfrmOptions.OkButtonClick(Sender: TObject);
begin
ModalResult:= mrOk;
end;

procedure TfrmOptions.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmOptions.Russian_LangClick(Sender: TObject);
begin
ShowBalloonTip(Russian_Lang, 1, pchar(ToolTipTitle), 'Необхідно перезавантаження програми' , clBlue,  clNavy);
end;

procedure TfrmOptions.Ukr_LangClick(Sender: TObject);
begin
ShowBalloonTip(Ukr_Lang, 1, pchar(ToolTipTitle), 'Необхідно перезавантаження програми' , clBlue,  clNavy);
end;

procedure TfrmOptions.Preved_EditEnter(Sender: TObject);
begin
//if Dog_Filter_Edit.CurText = cnConsts.cn_FilterText[PLanguageIndex] then
//Dog_Filter_Edit.CurText:='';
end;

end.
