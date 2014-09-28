unit SpFoto_Types;

interface
uses Classes, SysUtils;

type TJpegGeneralInfo = record
    Width:Integer;
    Height:Integer;
    XPP:Integer;
    YPP:Integer;
    ResolutionUnit:Integer;
  end;

function GetJpegGeneralInfo(AFileName:String):TJpegGeneralInfo;

implementation

uses SpFoto_ImgSize, SpFoto_JpegInfo;

function GetJpegGeneralInfo(AFileName:String):TJpegGeneralInfo;
const
  BufferSize = 50;
var
  Buffer     :  String;
  FileStream:TFileStream;
  index:Integer;
  pWidth:Word;
  pHeight:Word;
  pXPP:Word;
  pYPP:Word;
  pResolutionUnit:Word;
begin
   Result.Width:=-1;
   Result.Height:=-1;
   Result.XPP:=-1;
   Result.YPP:=-1;
   Result.ResolutionUnit:=-1;

// Определить тип JPEG-файла
   FileStream := TFileStream.Create(AFileName,
                                    fmOpenRead or fmShareDenyNone);
   try
     SetLength(Buffer, BufferSize);
     FileStream.Read(buffer[1], BufferSize);
     index := Pos('JFIF'+#$00, buffer);
     if index > 0 then //JFIF
       begin
         GetJPGSize(AFileName,pWidth,pHeight);
         GetJpegPPI(AFileName,pResolutionUnit,pXPP,pYPP);
       end
     else  //Exif or JFXX, or smth else
       begin
         index := Pos('Exif'+#$00, buffer);
         if index>0 then
           begin
             
           end
         else
           Exit;
       end;
   finally
     FileStream.Free
   end;

end;

end.
