unit Final_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, cn_Common_Loader;

type
  TFinal_Form = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function View_Final(AOwner : TComponent):boolean;stdcall;
exports View_Final;
var
  Final_Form: TFinal_Form;
  res:boolean;
implementation

{$R *.dfm}

function View_Final(AOwner : TComponent):boolean;stdcall;
var ViewForm:TFinal_Form;
begin
      ViewForm:=TFinal_Form.Create(AOwner);
      ViewForm.FormStyle:=fsStayOnTop;
    
      ViewForm.Show;
      
      View_Final:=res;
end;


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

procedure TFinal_Form.FormCreate(Sender: TObject);
var WindowRGN: HRGN;
begin
 BorderStyle:=bsNone;
 ClientWidth:=Image1.Picture.Bitmap.Width;
 ClientHeight:=Image1.Picture.Bitmap.Height;
 WindowRGN:=CreateRGNFromBitmap(Image1.Picture.Bitmap);
 SetWindowRgn(Handle, WindowRGN, True);
end;

procedure TFinal_Form.FormShow(Sender: TObject);
begin
res:=false;
Timer1.Enabled:=true;
end;

procedure TFinal_Form.Timer1Timer(Sender: TObject);
begin
res:=true;
close;
end;

end.
