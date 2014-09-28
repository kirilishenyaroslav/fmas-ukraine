//***********************************************************************
//* Проект "Студгородок"                                                *
//* Модуль "О программе "                                               *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************

unit about;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, cxLookAndFeelPainters, cxButtons, Animate, GIFCtrl,
  ShellApi, Messages, cxControls, cxContainer, cxEdit, cxImage;

type
  TAboutBox = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    RxGIFAnimator1: TRxGIFAnimator;
    RxGIFAnimator2: TRxGIFAnimator;
    Image1: TImage;
    cxButton1: TcxButton;
    Image2: TImage;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses MAIN;

{$R *.dfm}



function CreateRGNFromBitmap(rgnBitmap : TBitmap): HRGN;
var TransColor: TColor;
i, j: integer;
i_width, i_height: integer;
i_left, i_right: integer;
rectRGN: HRGN;
begin
 result:=0;

      i_width:=rgnBitmap.Width;
      i_height:=rgnBitmap.Height;
      TransColor:=rgnBitmap.Canvas.Pixels[0,0];

  for i:=0 to i_height-1 do
      begin
        i_left:=-1;

        for j:=0 to i_width do begin
          if i_left<0 then
           begin
            if rgnBitmap.Canvas.Pixels[j,i] <> TransColor then
              i_left:=j;
           end
           else
           if rgnBitmap.Canvas.Pixels[j,i] = TransColor then
              begin
              i_right:=j;
              rectRGN:=CreateRectRgn(i_left, i, i_right, i+1);
              if Result = 0 then Result:=rectRGN
              else
              begin
               CombineRgn(Result, Result, rectRGN,RGN_OR);
               DeleteObject(rectRGN);
               end;
              i_left:=-1;
              end;
              end;
              if i_left>=0 then
              begin
              rectRGN:=CreateRectRgn(i_left, i, i_width, i+1);
              if Result = 0 then Result:=rectRGN
              else
              begin
               CombineRgn(Result, Result, rectRGN,RGN_OR);
               DeleteObject(rectRGN);
               end;
             end;
            end;
end;



procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
MainForm.TrayIcon.Animated:=false;
end;

procedure TAboutBox.Timer1Timer(Sender: TObject);
begin
RxGIFAnimator2.Animate:=true;
end;

procedure TAboutBox.Timer2Timer(Sender: TObject);
begin
AlphaBlendValue:= AlphaBlendValue - 20;
if AlphaBlendValue < 20 then close;
end;

procedure TAboutBox.cxButton1Click(Sender: TObject);
begin
Timer2.Enabled:=true;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
var
ButtonRGN : HRGN;
begin
 ButtonRGN :=CreateRGNFromBitmap(cxButton1.Glyph);
 SetWindowRgn(cxButton1.Handle,ButtonRGN,TRUE);

end;

procedure TAboutBox.Image2Click(Sender: TObject);
begin
cxButton1Click(Sender);
end;

end.


