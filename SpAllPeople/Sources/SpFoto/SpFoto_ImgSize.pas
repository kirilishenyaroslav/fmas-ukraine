unit SpFoto_ImgSize;

interface

uses Classes,JPEG;


procedure GetJPGSize(const sFile: string; var wWidth, wHeight: word);
procedure GetPNGSize(const sFile: string; var wWidth, wHeight: word);
procedure GetGIFSize(const sGIFFile: string; var wWidth, wHeight: word);
procedure GetJpegPPI(const AFileName:String; var AResolutionUnit,AXPP,AYPP:Word);

implementation

uses SysUtils{, Dialogs};

function ReadMWord(f: TFileStream): word;
type
  TMotorolaWord = record
    case byte of
      0: (Value: word);
      1: (Byte1, Byte2: byte);
  end;
var
  MW: TMotorolaWord;
begin
  { It would probably be better to just read these two bytes in normally }
  { and then do a small ASM routine to swap them.  But we aren't talking }
  { about reading entire files, so I doubt the performance gain would be }
  { worth the trouble. }
  f.Read(MW.Byte2, SizeOf(Byte));
  f.Read(MW.Byte1, SizeOf(Byte));
  Result := MW.Value;
end;

procedure GetJPGSize(const sFile: string; var wWidth, wHeight: word);
var
  jpg: TJpegImage;
begin
  jpg := TJpegImage.Create;

  try
    jpg.Loadfromfile( sFile );
    wWidth := jpg.Width;
    wHeight := jpg.Height;
  finally
    jpg.free;
  end;
end;
 

procedure GetPNGSize(const sFile: string; var wWidth, wHeight: word);
type
  TPNGSig = array[0..7] of byte;
const
  ValidSig: TPNGSig = (137,80,78,71,13,10,26,10);
var
  Sig: TPNGSig;
  f: tFileStream;
  x: integer;
begin
  FillChar(Sig, SizeOf(Sig), #0);
  f := TFileStream.Create(sFile, fmOpenRead);
  try
    f.Read(Sig[0], SizeOf(Sig));
    for x := Low(Sig) to High(Sig) do
      if Sig[x] <> ValidSig[x] then exit;
    f.Seek(18, 0);
    wWidth := ReadMWord(f);
    f.Seek(22, 0);
    wHeight := ReadMWord(f);
  finally
    f.Free;
  end;
end;


procedure GetGIFSize(const sGIFFile: string; var wWidth, wHeight: word);
type
  TGIFHeader = record
    Sig: array[0..5] of char;
    ScreenWidth, ScreenHeight: word;
    Flags, Background, Aspect: byte;
  end;

  TGIFImageBlock = record
    Left, Top, Width, Height: word;
    Flags: byte;
  end;
var
  f: file;
  Header: TGifHeader;
  ImageBlock: TGifImageBlock;
  nResult: integer;
  x: integer;
  c: char;
  DimensionsFound: boolean;
begin
  wWidth  := 0;
  wHeight := 0;

  if sGifFile = '' then
    exit;

  {$I-}
  FileMode := 0;   { read-only }
  AssignFile(f, sGifFile);
  reset(f, 1);
  if IOResult <> 0 then
    { Could not open file }
    exit;

  { Read header and ensure valid file. }
  BlockRead(f, Header, SizeOf(TGifHeader), nResult);
  if (nResult <> SizeOf(TGifHeader)) or (IOResult <> 0) or
     (StrLComp('GIF', Header.Sig, 3) <> 0) then
  begin
    { Image file invalid }
    close(f);
    exit;
  end;

  { Skip color map, if there is one }
  if (Header.Flags and $80) > 0 then
  begin
    x := 3 * (1 SHL ((Header.Flags and 7) + 1));
    Seek(f, x);
    if IOResult <> 0 then
    begin
      { Color map thrashed }
      close(f);
      exit;
    end;
  end;

  DimensionsFound := False;
  FillChar(ImageBlock, SizeOf(TGIFImageBlock), #0);
  { Step through blocks. }
  BlockRead(f, c, 1, nResult);
  while (not EOF(f)) and (not DimensionsFound) do
  begin
    case c of
      ',': { Found image }
        begin
          BlockRead(f, ImageBlock, SizeOf(TGIFImageBlock), nResult);
          if nResult <> SizeOf(TGIFImageBlock) then begin
            { Invalid image block encountered }
            close(f);
            exit;
          end;
          wWidth  := ImageBlock.Width;
          wHeight := ImageBlock.Height;
          DimensionsFound := True;
        end;
      'y' : { Skip }
        begin
          { NOP }
        end;
    { nothing else.  just ignore }
    end;
    BlockRead(f, c, 1, nResult);
  end;

  close(f);
  {$I+}
end;

procedure GetJpegPPI(const AFileName:String;var AResolutionUnit,AXPP,AYPP:Word);

{Byte 13 gives the dimensions in which the pixel density is given later
in the header, 0 = pixels, 1 = DPI, 2 = dots per centimeter.

Bytes 14/15 give X density.
Bytes 16/17 give Y density.}

{Exif
   48 00 00 00 01 00 00 00 48 00 00 00 01
   72x72 PPI}
const
 BufferSize = 50;
var
 Buffer     :  String;
 index      :  Integer;
 FileStream :  TFileStream;
 xResolution:  Word;
 yResolution:  Word;
 ResolutionUnit:Word;
begin
   FileStream := TFileStream.Create(AFileName,
                                    fmOpenRead or fmShareDenyNone);
   try
     SetLength(Buffer, BufferSize);
     FileStream.Read(buffer[1], BufferSize);
     index := Pos('JFIF'+#$00, buffer);
     if index > 0 then
     begin
       FileStream.Seek(index+6, soFromBeginning);
{       FileStream.Read(ResolutionUnit,1);
       FileStream.Read(xResolution, 2);
       FileStream.Read(yResolution, 2);

       xResolution :=  Swap(xResolution);
       yResolution :=  Swap(yResolution);
}
       FileStream.Read(ResolutionUnit,1);
       xResolution :=  ReadMWord(FileStream);
       yResolution :=  ReadMWord(FileStream);

       AXPP:=xResolution;
       AYPP:=yResolution;

     end
     else  //Exif or JFXX
       Exit;
   finally
     FileStream.Free
   end;
end;

end.
