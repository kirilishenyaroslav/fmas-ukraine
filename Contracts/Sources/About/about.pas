//***********************************************************************
//* Проект "Договора"                                                *
//* Модуль "О программе "                                               *
//* Выполнил: Чернявский А.Э. 2005 г.                              *
//***********************************************************************

unit about;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, cxLookAndFeelPainters, cxButtons, Animate,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxHyperLinkEdit, Menus,
  ShellApi, Messages, RXSplit;

type
  TAboutForm = class(TForm)
    Timer2: TTimer;
    HyperLink: TcxHyperLinkEdit;
    cxButton1: TcxButton;
    CloseSpeedButton: TSpeedButton;
    Image: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer2Timer(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure HyperLinkMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure HyperLinkMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure CloseSpeedButtonClick(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
  private 


  public
     procedure WMNCHitTest(var Message : TWMNCHitTest); message WM_NCHITTEST;
  end;


implementation


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

procedure TAboutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TAboutForm.Timer2Timer(Sender: TObject);
begin
//if Caption = 'Контракти' then Caption :='';
AlphaBlendValue:= AlphaBlendValue - 11;
Caption:=' '+Caption;
if AlphaBlendValue < 5 then close;
end;

procedure TAboutForm.OkButtonClick(Sender: TObject);
begin
Timer2.Enabled:=true;
end;

procedure TAboutForm.HyperLinkMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
HyperLink.Properties.LinkColor:= clGreen;
cxButton1.setfocus;
end;

procedure TAboutForm.HyperLinkMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
HyperLink.Properties.LinkColor:= clBlue;
end;

procedure TAboutForm.FormCreate(Sender: TObject);
var
ButtonRGN : HRGN;
FormRGN   : HRGN;
begin
 ButtonRGN :=CreateRGNFromBitmap(cxButton1.Glyph);
 SetWindowRgn(cxButton1.Handle,ButtonRGN,TRUE);
 FormRGN   :=CreateRGNFromBitmap(Image.Picture.Bitmap);
 SetWindowRgn(Handle,FormRGN,TRUE);
end;

procedure TAboutForm.cxButton1Click(Sender: TObject);
begin
Timer2.Enabled:=true;
end;

procedure TAboutForm.CloseSpeedButtonClick(Sender: TObject);
begin
close;
end;

procedure TAboutForm.WMNCHitTest(var Message : TWMNCHitTest);
begin
  if (Message.XPos-Left < 90) and  (Message.YPos-Top < 100) then
             {^^^ относительно экpана        ^^^}
        Message.Result  := HTCAPTION {как бы на заголовке}
  else
        Message.Result := HTCLIENT;

end;

procedure TAboutForm.Label9Click(Sender: TObject);
begin
ShellExecute(Application.Handle,'open','mailto:harry@buhg.dongu.donetsk.ua',nil,nil,SW_SHOWNORMAL);
end;

procedure TAboutForm.Label10Click(Sender: TObject);
begin
ShellExecute(Application.Handle,'open','mailto:lexus@buhg.dongu.donetsk.ua',nil,nil,SW_SHOWNORMAL);
end;

procedure TAboutForm.Label8Click(Sender: TObject);
begin
ShellExecute(Application.Handle,'open','mailto:hunter@buhg.dongu.donetsk.ua',nil,nil,SW_SHOWNORMAL);
end;

procedure TAboutForm.Label11Click(Sender: TObject);
begin
ShellExecute(Application.Handle,'open','mailto:ser@buhg.dongu.donetsk.ua',nil,nil,SW_SHOWNORMAL);
end;

end.





