unit uWhatsNew_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, Buttons,
  uConsts, uCommon_Funcs;

type
  TfrmWhatsNew = class(TForm)
    Memo: TcxMemo;
    Image: TImage;
    CloseSpeedButton: TSpeedButton;
    Label1: TLabel;
    cxButton1: TcxButton;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure CloseSpeedButtonClick(Sender: TObject);
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public

  end;

procedure View_WhatsNew(AOwner : TComponent);stdcall;
exports   View_WhatsNew;

var
  frmWhatsNew: TfrmWhatsNew;
implementation

{$R *.dfm}

procedure View_WhatsNew(AOwner : TComponent);stdcall;
var
  ViewForm: TfrmWhatsNew;
begin
  ViewForm:=TfrmWhatsNew.Create(AOwner);
  ViewForm.FormStyle:=fsNormal;
  ViewForm.ShowModal;
end;

procedure TfrmWhatsNew.FormIniLanguage();
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex :=          uCommon_Funcs.bsLanguageIndex;
  Label1.Caption :=          uConsts.bs_WhatsNew[PLanguageIndex];
end;


function CreateRGNFromBitmap(rgnBitmap : TBitmap): HRGN;
var
  TransColor: TColor;
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

     for j:=0 to i_width do
      begin
       if i_left<0 then
        begin
         if rgnBitmap.Canvas.Pixels[j,i] <> TransColor then i_left:=j;
        end
       else
        if rgnBitmap.Canvas.Pixels[j,i] = TransColor then
         begin
          i_right:=j;
          rectRGN:=CreateRectRgn(i_left, i, i_right, i+1);
          if Result = 0
           then Result:=rectRGN
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
      if Result = 0
       then Result:=rectRGN
       else
        begin
         CombineRgn(Result, Result, rectRGN,RGN_OR);
         DeleteObject(rectRGN);
        end;
     end;
   end;
end;


procedure TfrmWhatsNew.FormCreate(Sender: TObject);
var
  ButtonRGN : HRGN;
  FormRGN   : HRGN;
  F : TextFile;
begin
  ButtonRGN :=CreateRGNFromBitmap(cxButton1.Glyph);
  SetWindowRgn(cxButton1.Handle,ButtonRGN,TRUE);
  FormRGN   :=CreateRGNFromBitmap(Image.Picture.Bitmap);
  SetWindowRgn(Handle,FormRGN,TRUE);
  if not FileExists(ExtractFileDir(Application.ExeName) + '\' + 'bs_Whats_New.txt') then
   begin
    AssignFile(f,ExtractFileDir(Application.ExeName) + '\' + 'bs_Whats_New.txt');
    Reset(f);
    Write(f,'Программа ГОРВОДОКАНАЛ');
    Close;
   end;

  Memo.Lines.LoadFromFile(ExtractFileDir(Application.ExeName) + '\' + 'bs_Whats_New.txt');
  FormIniLanguage();
end;

procedure TfrmWhatsNew.cxButton1Click(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfrmWhatsNew.CloseSpeedButtonClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfrmWhatsNew.Label1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const  SC_DragMove = $F012;
begin
  ReleaseCapture;
  perform(WM_SysCommand, SC_DragMove, 0);
end;


procedure TfrmWhatsNew.Label2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const  SC_DragMove = $F012;
begin
  ReleaseCapture;
  perform(WM_SysCommand, SC_DragMove, 0);
end;

end.
