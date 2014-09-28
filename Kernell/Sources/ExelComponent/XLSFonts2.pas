unit XLSFonts2;

{-
********************************************************************************
******* XLSReadWriteII V3.00                                             *******
*******                                                                  *******
******* Copyright(C) 1999,2006 Lars Arvidsson, Axolot Data               *******
*******                                                                  *******
******* email: components@axolot.com                                     *******
******* URL:   http://www.axolot.com                                     *******
********************************************************************************
** Users of the XLSReadWriteII component must accept the following            **
** disclaimer of warranty:                                                    **
**                                                                            **
** XLSReadWriteII is supplied as is. The author disclaims all warranties,     **
** expressedor implied, including, without limitation, the warranties of      **
** merchantability and of fitness for any purpose. The author assumes no      **
** liability for damages, direct or consequential, which may result from the  **
** use of XLSReadWriteII.                                                     **
********************************************************************************
}

{$B-}
{$H+}
{$R-}
{$I XLSRWII2.inc}

interface

uses SysUtils, Classes, Contnrs, Graphics, Windows, BIFFRecsII2, XLSUtils2;

const DEFAULT_FONT_COUNT = 5;

type
//* Font style.
     TXFontStyle = (xfsBold,     //* Set the font style to boldface.
                    xfsItalic,   //* Set the font style to italic.
                    xfsStrikeOut //* The font is displayed with a horizontal line through it.
                    );
//* Set of TXFontStyle
type TXFontStyles = set of TXFontStyle;
//* Subscript and superscript style for the font.
type TXSubSuperscript = (xssNone,        //* No sub or superscript.
                         xssSuperscript, //* Superscript is used for the font.
                         xssSubscript    //* Subscript is used for the font.
                         );
type
//* Underline style of the font.
    TXUnderline = (xulNone,          //* No underline.
                   xulSingle,        //* Single line underline.
                   xulDouble,        //* Double line underline.
                   xulSingleAccount, //* Single accounting line underline.
                   xulDoubleAccount  //* Double accounting line underline.
                   );

//* ~exclude
type TFontChangeEvent = procedure (NewIndex: word) of object;

//* ~exclude
type PXFontData = ^TXFontData;
     TXFontData = packed record
     FCharset: TFontCharset;
     FFamily: byte;
     FColorIndex: TExcelColor;
     FSize: integer;
     FStyle: TXFontStyles;
     FSubSuperScript: TXSubSuperscript;
     FUnderline: TXUnderline;
     end;

//* ~exclude
type TXFont = class(TPersistent)
private
     FName: WideString;
     FD: TXFontData;
     FLF: LOGFONT;
     FHandle: longword;
     FIndex: integer;
     FUsageCount: integer;
     // If FUnique = True, then the font can only be used by the owner. It will
     // never be shared by other objects. Charts requires such fonts.
     FUnique: boolean;

     function  TFontColorToXColor(Font: TFont): TExcelColor;
     function  GetSize: integer;
     procedure SetSize(const Value: integer);
     procedure SetSize20(const Value: integer);
public
     constructor Create; overload;
     constructor Create(Font: TXFont); overload;
     destructor Destroy; override;
     procedure Assign(Font: TFont); reintroduce; overload;
     procedure Assign(Font: TXFont); reintroduce; overload;
     procedure CopyToTFont(Dest: TFont);
     procedure CopyToLOGFONT(var Dest: LOGFONT; var FontColor: longword);
     function  Equal(Value: TXFont): boolean; overload;
     function  Equal(Value: TFont): boolean; overload;
     procedure IncUsage;
     procedure DecUsage;
     function  GetHandle(PixelsPerInch: integer): longword;
     procedure FreeHandle;

     // UsageCount and deletion of fonts are handled by the instance that
     // uses them, such as Formats and Rich Strings.
     property UsageCount: integer read FUsageCount write FUsageCount;
     property Unique: boolean read FUnique write FUnique;

     property Index: integer read FIndex;
published
     property Name: WideString read FName write FName;
     property Charset: TFontCharset read FD.FCharset write FD.FCharset nodefault;
     property Family: byte read FD.FFamily write FD.FFamily nodefault;
     property Color: TExcelColor read FD.FColorIndex write FD.FColorIndex;
     property Size: integer read GetSize write SetSize;
     // Size of the font in units of 1/20th of a point.
     property Size20: integer read FD.FSize write SetSize20;
     property Style: TXFontStyles read FD.FStyle write FD.FStyle;
     property SubSuperScript: TXSubSuperscript read FD.FSubSuperScript write FD.FSubSuperScript;
     property Underline: TXUnderline read FD.FUnderline write FD.FUnderline;
     end;

//* ~exclude
type TXFonts = class(TObjectList)
private
     FDeleteIndex: integer;

     function  GetFont(Index: integer): TXFont;
//     Don't exists in D5
//     procedure Deleting(Item: TCollectionItem); override;
public
     constructor Create(AOwner: TPersistent);
     destructor Destroy; override;
     procedure Delete(Index: integer);
     procedure Clear; override;
     procedure SetDefault;
     function  Add: TXFont; overload;
     procedure Add(Font: TXFont); overload;
     function  AddFind(Font: TXFont): TXFont; overload;
     function  AddFind(Font: TFont): TXFont; overload;
     function  Find(Font: TXFont): TXFont;
     function  FindIndex(Font: TXFont): integer;
     procedure UpdateDeleteIndex;

     property Items[Index: integer]: TXFont read GetFont; default;
     property DeleteIndex: integer read FDeleteIndex;
     end;

// A TFormatRun is replaced by a TFontRun in the SST.
//* ~exclude
type PFontRun = ^TFontRun;
     TFontRun = record
     Index: integer;
     Font: TXFont;
     end;

//* ~exclude
type TFontRunArray = array of TFontRun;

implementation

{ TXFont }
                                          
constructor TXFont.Create;
begin
  FName := 'Arial';
  FD.FSize := 200;
  FD.FColorIndex := xcBlack;
  FD.FStyle := [];
  FD.FSubSuperScript := xssNone;
  FD.FUnderline := xulNone;
  FD.FFamily := 2;
end;

constructor TXFont.Create(Font: TXFont);
begin
  Assign(Font);
end;

destructor TXFont.Destroy;
begin
  inherited;
  FreeHandle;
end;

procedure TXFont.Assign(Font: TXFont);
begin
  FD := Font.FD;
  FName := Font.FName;
end;

function TXFont.TFontColorToXColor(Font: TFont): TExcelColor;
begin
  case Font.Color of
    clBlack:   Result := xcBlack;
    clMaroon:  Result := xcDarkRed;
    clGreen:   Result := xcGreen;
    clOlive:   Result := xcBrownGreen;
    clNavy:    Result := xcDarkBlue;
    clPurple:  Result := xc36;
    clTeal:    Result := xcDarkTurquois;
    clGray:    Result := xcGray40;
    clSilver:  Result := xcGray25;
    clRed:     Result := xcRed;
    clLime:    Result := xcBrightGreen;
    clYellow:  Result := xcYellow;
    clBlue:    Result := xcBlue;
    clFuchsia: Result := xc33;
    clAqua:    Result := xcTurquoise;
    else
      Result := TColorToClosestXColor(Font.Color);
  end;
end;

procedure TXFont.Assign(Font: TFont);
begin
  Charset := Font.Charset;
  Family := 2;
  Color := TFontColorToXColor(Font);
  Name := Font.Name;
  Size20 := Font.Size * 20;
  Style := [];
  SubSuperScript := xssNone;
  Underline := xulNone;
  if fsBold in Font.Style then
    Style := Style + [xfsBold];
  if fsItalic in Font.Style then
    Style := Style + [xfsItalic];
  if fsStrikeOut in Font.Style then
    Style := Style + [xfsStrikeOut];
  if fsUnderline in Font.Style then
    Underline := xulSingle;
end;

procedure TXFont.CopyToLOGFONT(var Dest: LOGFONT; var FontColor: longword);
var
  i: integer;
begin
  FillChar(Dest,SizeOf(LOGFONT),#0);
  Dest.lfCharSet := Charset;
  for i := 1 to Length(FName) do
    Dest.lfFaceName[i - 1] := Char(FName[i]);
  for i := Length(FName) to 31 do
    Dest.lfFaceName[i] := #0;
  // Height is not correct. Shall be in pixels.
  Dest.lfHeight := Size20;
  Dest.lfItalic := Byte(xfsItalic in Style);
  Dest.lfUnderline := Byte(Underline <> xulNone);
  if xfsBold in Style then
    Dest.lfWeight := 700
  else
    Dest.lfWeight := 400;
  Dest.lfStrikeOut := Byte(xfsStrikeOut in Style);
  // Is black the right automatic color?
  if (Integer(Color) >= 0) and (Color <> xcAutomatic) then
    FontColor := ExcelColorPalette[Integer(Color)]
  else
    FontColor := clBlack;
end;

procedure TXFont.CopyToTFont(Dest: TFont);
begin
  Dest.Charset := Charset;
  Dest.Name := Name;
  Dest.Size := Size20 div 20;
  Dest.Style := [];
  if Underline <> xulNone then
    Dest.Style := [fsUnderline];
  if xfsBold in Style then
    Dest.Style := Dest.Style + [fsBold];
  if xfsItalic in Style then
    Dest.Style := Dest.Style + [fsItalic];
  if xfsStrikeOut in Style then
    Dest.Style := Dest.Style + [fsStrikeOut];
  // Is black the right automatic color?
  if (Integer(Color) >= 0) and (Color <> xcAutomatic) then
    Dest.Color := ExcelColorPalette[Integer(Color)]
  else
    Dest.Color := clBlack;
end;

function TXFont.Equal(Value: TXFont): boolean;
begin
  if FUnique then
    Result := False
  else
{$ifdef ver130}
    Result := (AnsiLowercase(FName) = AnsiLowercase(Value.Name)) and CompareMem(@FD,@Value.FD,SizeOf(TXFontData));
{$else}
    Result := (WideLowercase(FName) = WideLowercase(Value.Name)) and CompareMem(@FD,@Value.FD,SizeOf(TXFontData));
{$endif}
end;

function TXFont.Equal(Value: TFont): boolean;
var
  XStyle: TXFontStyles;
begin
  if FUnique then begin
    Result := False;
    Exit;
  end;
  XStyle := [];
  if fsBold in Value.Style then
    XStyle := XStyle + [xfsBold];
  if fsItalic in Value.Style then
    XStyle := XStyle + [xfsItalic];
  if fsStrikeOut in Value.Style then
    XStyle := XStyle + [xfsStrikeOut];
  if fsUnderline in Value.Style then begin
    Result := FD.FUnderline = xulSingle;
    if not Result then
      Exit;
  end;

  Result := (Value.Charset = FD.FCharset) and
            (Value.Name = FName) and
            ((Value.Size * 20) = FD.FSize) and
            (XStyle = FD.FStyle) and
            (FD.FSubSuperScript = xssNone) and
            (FD.FUnderline in [xulNone,xulSingle]) and
            (TFontColorToXColor(Value) = FD.FColorIndex);
end;

procedure TXFont.FreeHandle;
begin
  if FHandle > 0 then
    DeleteObject(FHandle);
  FHandle := 0;
end;

procedure TXFont.IncUsage;
begin
  Inc(FUsageCount);
end;

procedure TXFont.DecUsage;
begin
  Dec(FUsageCount);
end;

{ TXFonts }

constructor TXFonts.Create;
begin
  inherited Create;
  SetDefault;
end;

procedure TXFonts.Delete(Index: integer);
var
  i: integer;
begin
  inherited Delete(Index);
  for i := Index to Count - 1 do
    Dec(Items[i].FIndex);
{

  if Index >= DEFAULT_FONTS_COUNT then begin
    inherited Delete(Index);
    for i := Index to Count - 1 do
      Dec(Items[i].FIndex);
  end;
}
end;

destructor TXFonts.Destroy;
begin
  inherited Destroy;
end;

function TXFonts.Find(Font: TXFont): TXFont;
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    if Items[i].Equal(Font) then begin
      Result := Items[i];
      Exit;
    end;
  end;
  Result := Nil;
end;

function TXFonts.FindIndex(Font: TXFont): integer;
begin
  for Result := 0 to Count - 1 do begin
    if Items[Result].Equal(Font) then
      Exit;
  end;
  Result := -1;
end;

procedure TXFonts.Clear;
begin
  inherited Clear;
  FDeleteIndex := 0;
end;

procedure TXFonts.SetDefault;
var
  i: integer;
begin
  for i := 1 to DEFAULT_FONTS_COUNT do
    Add;
  FDeleteIndex := Count;
end;

function TXFonts.Add: TXFont;
begin
  Result := TXFont.Create;
  Result.FIndex := inherited Add(Result);
end;

procedure TXFonts.Add(Font: TXFont);
begin
  Font.FIndex := inherited Add(Font);
end;

function TXFonts.AddFind(Font: TXFont): TXFont;
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    if Items[i].Equal(Font) then begin
      Result := Items[i];
      Exit;
    end;
  end;
  Result := Add;
  Result.Assign(Font);
end;

function TXFonts.AddFind(Font: TFont): TXFont;
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    if Items[i].Equal(Font) then begin
      Result := Items[i];
      Exit;
    end;
  end;
  Result := Add;
  Result.Assign(Font);
end;

function TXFonts.GetFont(Index: integer): TXFont;
begin
  Result := TXFont(inherited Items[Index]);
end;

{
procedure TXFonts.Deleting(Item: TCollectionItem);
begin
  inherited;

end;
}

function TXFont.GetHandle(PixelsPerInch: integer): longword;
var
  Cl: longword;
begin
  if FHandle = 0 then begin
    CopyToLOGFONT(FLF,Cl);
//    FLF.lfHeight := -Round((FLF.lfHeight / 20) * PixelsPerInch / 72);
    FLF.lfHeight := -MulDiv(FLF.lfHeight div 20,PixelsPerInch,72);
    FHandle := CreateFontIndirect(FLF);
    if FHandle = 0 then
      FHandle := GetStockObject(SYSTEM_FONT);
  end;
  Result := FHandle;
end;

function TXFont.GetSize: integer;
begin
  Result := FD.FSize div 20;
end;

procedure TXFont.SetSize(const Value: integer);
begin
  if Value > 0 then
    FD.FSize := Value * 20;
end;

procedure TXFont.SetSize20(const Value: integer);
begin
  FD.FSize := Value;
end;

procedure TXFonts.UpdateDeleteIndex;
begin
  FDeleteIndex := Count;
end;

end.
