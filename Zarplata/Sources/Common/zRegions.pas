unit zRegions;

interface

uses Windows, Graphics;


function CreateRGNFromBitmap(rgnBitmap : TBitmap): HRGN;

implementation

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

end.
