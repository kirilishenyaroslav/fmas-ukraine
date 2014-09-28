unit FormattedObj2;

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

uses Classes, SysUtils, Graphics, Windows, BIFFRecsII2, XLSFonts2, CellFormats2;

//* Base class for object that can be formatted, such as cells, rows and
//* columns. If you want to format all cells in a row or a column, format
//* the row or the column then. Formatting all individual cells is much more
//* innefficient.
//* See also ~[link XLSRange2.TXLSRange] ~[link Columns2.TXLSColumn] ~[link Rows2.TXLSRow]
//* ~[br]
//* ~[br]
//* ~[b Example:]
//* ~[br]
//* ~[sample
//* // Set the color of a cell. Before a cell can be formatted, it must
//* // contain a value. If no visible value is desired, assign a blank value.
//* XLS.Sheets[0~[].AsBlank[2,0~[] := True;
//* XLS.Sheets[0~[].Cell[2,0~[].FillPatternForeColor := xcYellow;
//*
//* // Set the borders of a cell.
//* XLS.Sheets[0~[].AsFloat[2,1~[] := 125.25;
//* XLS.Sheets[0~[].Cell[2,1~[].BorderLeftStyle := cbsThick;
//* XLS.Sheets[0~[].Cell[2,1~[].BorderLeftColor := xcGreen;
//* XLS.Sheets[0~[].Cell[2,1~[].BorderTopStyle := cbsThick;
//* XLS.Sheets[0~[].Cell[2,1~[].BorderTopColor := xcRed;
//* XLS.Sheets[0~[].Cell[2,1~[].BorderRightStyle := cbsThick;
//* XLS.Sheets[0~[].Cell[2,1~[].BorderRightColor := xcGreen;
//* XLS.Sheets[0~[].Cell[2,1~[].BorderBottomStyle := cbsThick;
//* XLS.Sheets[0~[].Cell[2,1~[].BorderBottomColor := xcRed;
//*
//* // Set the number format to 3 decimals.
//* XLS.Sheets[0~[].AsFloat[2,2~[] := 125.12345678;
//* XLS.Sheets[0~[].Cell[2,2~[].NumberFormat := '#.###';
//*
//* // Set the number format to two decimals, thousand separator an negative numbers in red.
//* XLS.Sheets[0~[].AsFloat[2,3~[] := 125.12345678;
//* XLS.Sheets[0~[].Cell[2,3~[].NumberFormat := '# ##0.00;[Red~[]-# ##0.00';
//*
//* // Change the font properties of the cell.
//* XLS.Sheets[0~[].AsString[2,4~[] := 'Hello, world';
//* XLS.Sheets[0~[].Cell[2,4~[].FontName := 'Courier New';
//* XLS.Sheets[0~[].Cell[2,4~[].FontStyle := [xfsBold,xfsItalic~[];
//* XLS.Sheets[0~[].Cell[2,4~[].FontSize := 24;
//* ]
type TFormattedObject = class(TObject)
  private
protected
     FFormats: TCellFormats;
     FFormat: TCellFormat;

     function  GetFillPatternBackColor: TExcelColor;
     function  GetFillPatternForeColor: TExcelColor;
     function  GetHorizAlignment: TCellHorizAlignment;
     function  GetBorderBottomColor: TExcelColor;
     function  GetBorderBottomStyle: TCellBorderStyle;
     function  GetBorderDiagColor: TExcelColor;
     function  GetBorderDiagLines: TDiagLines;
     function  GetBorderDiagStyle: TCellBorderStyle;
     function  GetBorderLeftColor: TExcelColor;
     function  GetBorderLeftStyle: TCellBorderStyle;
     function  GetBorderRightColor: TExcelColor;
     function  GetBorderRightStyle: TCellBorderStyle;
     function  GetBorderTopColor: TExcelColor;
     function  GetBorderTopStyle: TCellBorderStyle;
     function  GetFormatOptions: TFormatOptions;
     function  GetIndent: byte;
     function  GetNumberFormat: WideString;
     function  GetProtection: TCellProtections;
     function  GetRotation: smallint;
     function  GetVertAlignment: TCellVertAlignment;
     function  GetFillPatternPattern: TExcelFillPattern;
     function  GetFontIndex: word;
     function  GetFontStyle: TXFontStyles;
     function  GetFontCharset: TFontCharset;
     function  GetFontColor: TExcelColor;
     function  GetFontFamily: byte;
     function  GetFontName: WideString;
     function  GetFontSize: integer;
     function  GetFontSize20: integer;
     function  GetFontSubSuperScript: TXSubSuperscript;
     function  GetFontUnderline: TXUnderline;
     function  GetFormatIndex: word;

     procedure SetFillPatternBackColor(const Value: TExcelColor); virtual;
     procedure SetFillPatternForeColor(const Value: TExcelColor); virtual;
     procedure SetBorderBottomColor(const Value: TExcelColor); virtual;
     procedure SetBorderBottomStyle(const Value: TCellBorderStyle); virtual;
     procedure SetBorderDiagColor(const Value: TExcelColor); virtual;
     procedure SetBorderDiagLines(const Value: TDiagLines); virtual;
     procedure SetBorderDiagStyle(const Value: TCellBorderStyle); virtual;
     procedure SetBorderLeftColor(const Value: TExcelColor); virtual;
     procedure SetBorderLeftStyle(const Value: TCellBorderStyle); virtual;
     procedure SetBorderRightColor(const Value: TExcelColor); virtual;
     procedure SetBorderRightStyle(const Value: TCellBorderStyle); virtual;
     procedure SetBorderTopColor(const Value: TExcelColor); virtual;
     procedure SetBorderTopStyle(const Value: TCellBorderStyle); virtual;
     procedure SetFFormatOptions(const Value: TFormatOptions); virtual;
     procedure SetIndent(const Value: byte); virtual;
     procedure SetNumberFormat(const Value: WideString); virtual;
     procedure SetProtection(const Value: TCellProtections); virtual;
     procedure SetRotation(const Value: smallint); virtual;
     procedure SetHorizAlignment(const Value: TCellHorizAlignment); virtual;
     procedure SetVertAlignment(const Value: TCellVertAlignment); virtual;
     procedure SetFillPatternPattern(const Value: TExcelFillPattern); virtual;
     procedure SetFontCharset(const Value: TFontCharset); virtual;
     procedure SetFontColor(const Value: TExcelColor); virtual;
     procedure SetFontFamily(const Value: byte); virtual;
     procedure SetFontName(const Value: WideString); virtual;
     procedure SetFontSize(const Value: integer); virtual;
     procedure SetFontSize20(const Value: integer); virtual;
     procedure SetFontSubSuperScript(const Value: TXSubSuperscript); virtual;
     procedure SetFontUnderline(const Value: TXUnderline); virtual;
     procedure SetFontStyle(const Value: TXFontStyles); virtual;

     procedure UpdateFormat(NewFormat: TCellFormat);
     procedure UpdateFont(NewFont: TXFont);
public
     //* ~exclude
     constructor Create(Formats: TCellFormats; FormatIndex: word);
     //* ~exclude
     procedure AssignFormat(FormatIndex: word); overload;
     //* ~exclude
     procedure AssignFormat(Format: TCellFormat); overload;
     //* ~exclude
     procedure AssignFont(Font: TFont); overload;
     //* ~exclude
     function GetFontHandle(PixelsPerInch: integer): longword;
     //* ~exclude
     procedure CopyToLOGFONT(var Dest: LOGFONT; var FontColor: longword);
     //* ~exclude
     function  FontHeight(PPI: integer): integer;
     //* Resets the format to default settings.
     procedure SetDefaultFormat;
     //* Copies the font (TXFont) of the format to a TFont object.
     //* ~param Font The TFont object to copy the properties to.
     procedure CopyToTFont(Font: TFont);
     //* Returns True if the object has formatting that differs from the default.
     //* ~result True if the object is formatted.
     function  IsFormatted: boolean;

     //* ~exclude
     property Formats: TCellFormats read FFormats;
     //* ~exclude
     property FormatIndex: word read GetFormatIndex;
     //* ~exclude
     property FontIndex: word read GetFontIndex;

     //* Protection of cells.
     property Protection: TCellProtections        read GetProtection           write SetProtection;
     //* Horizontal alignment of text in cells.
     property HorizAlignment: TCellHorizAlignment read GetHorizAlignment       write SetHorizAlignment;
     //* Vertical alignment of text in cells.
     property VertAlignment: TCellVertAlignment   read GetVertAlignment        write SetVertAlignment;
     //* Text indent
     //* The indent values can range from 0-15. A value of 0 (zero) is no
     //* indent. An increase with one increases the indent with about one character.
     property Indent: byte                        read GetIndent               write SetIndent;
     //* Rotation of cell text.
     //* Rotation, in degrees. ~[br]
     //* The value 0 – 90 is rotation up 0 – 90 deg. The value 91 – 180 is
     //* rotation down 1 – 90 deg. The value 255 is vertical text.
     property Rotation: smallint                  read GetRotation             write SetRotation;
     //* Cell format options.
     property FormatOptions: TFormatOptions       read GetFormatOptions        write SetFFormatOptions;
     //* The foreground fill color.
     //* Use this property to set the color of the foreground fill pattern. ~[br]
     //* Note: This is the cell color. If you want to have just one color
     //* for the cell, use this property. ~[br]
     //* ~[link FillPatternBackColor] ~[link FillPatternPattern]
     property FillPatternForeColor: TExcelColor   read GetFillPatternForeColor write SetFillPatternForeColor;
     //* The background fill color.
     //* Use this property to set the color of the background fill pattern. ~[br]
     //* Note: If no fill pattern is assigned to the format, this
     //* property has no effect. If you just want to set the cell color, use
     //* FillPatternForeColor.
     //* ~[link FillPatternForeColor] ~[link FillPatternPattern]
     property FillPatternBackColor: TExcelColor   read GetFillPatternBackColor write SetFillPatternBackColor;
     //* The fill pattern for the cell.
     //* Use this property to set the fill pattern for the cell. Values can
     //* range between 0-127. 0 (zero) is no fill pattern.
     //* Fill patterns and there corresponding numbers, that are used in Excel:~[br]
     //* ~[image ..\help\PatternsNum.bmp]
     //* ~[link FillPatternForeColor] ~[link FillPatternBackColor]
     property FillPatternPattern: TExcelFillPattern read GetFillPatternPattern write SetFillPatternPattern;
     //* Format mask used to format numbers.
     //* NumberFormat uses the same options as in the Format dilaog inExcel.~[br]
     //* NumberFormat is also used to create cells with date and time values,
     //* as there are no specific date or time cells in Excel.
     property NumberFormat: WideString            read GetNumberFormat         write SetNumberFormat;

     //* The color of the top cell border.
     //* ~[link TCellBorderStyle]
     property BorderTopColor:    TExcelColor      read GetBorderTopColor       write SetBorderTopColor;
     //* The style of the top cell border.
     property BorderTopStyle:    TCellBorderStyle read GetBorderTopStyle       write SetBorderTopStyle;
     //* The color of the left cell border.
     property BorderLeftColor:   TExcelColor      read GetBorderLeftColor      write SetBorderLeftColor;
     //* The style of the left cell border.
     property BorderLeftStyle:   TCellBorderStyle read GetBorderLeftStyle      write SetBorderLeftStyle;
     //* The color of the right cell border.
     property BorderRightColor:  TExcelColor      read GetBorderRightColor     write SetBorderRightColor;
     //* The style of the right cell border.
     property BorderRightStyle:  TCellBorderStyle read GetBorderRightStyle     write SetBorderRightStyle;
     //* The color of the bottom cell border.
     property BorderBottomColor: TExcelColor      read GetBorderBottomColor    write SetBorderBottomColor;
     //* The style of the bottom cell border.
     property BorderBottomStyle: TCellBorderStyle read GetBorderBottomStyle    write SetBorderBottomStyle;
     //* The color of the lines in a cell with diagonal lines.
     property BorderDiagColor:   TExcelColor      read GetBorderDiagColor      write SetBorderDiagColor;
     //* The style of diagonal lines in a cell.
     property BorderDiagStyle:   TCellBorderStyle read GetBorderDiagStyle      write SetBorderDiagStyle;
     //* If the cell shall have diagonal lines.
     property BorderDiagLines:   TDiagLines       read GetBorderDiagLines      write SetBorderDiagLines;

     //* The name of the font.
     property FontName: WideString read GetFontName write SetFontName;
     //* The character set of the font.
     property FontCharset: TFontCharset read GetFontCharset write SetFontCharset;
     //* The family of the font.
     //* The FontFamily can have the following values: ~[br]
     //* 0 = None (unknown/don't care). ~[br]
     //* 1 = Roman. ~[br]
     //* 2 = Swiss. ~[br]
     //* 3 = Modern (fixed width). ~[br]
     //* 4 = Script. ~[br]
     //* 5 = Decorative. ~[br]
     property FontFamily: byte read GetFontFamily write SetFontFamily;
     //* The color of the font.
     property FontColor: TExcelColor read GetFontColor write SetFontColor;
     //* The size of the font in points.
     //* ~[link FontSize20]
     property FontSize: integer read GetFontSize write SetFontSize;
     //* Size of the font in units of 1/20th of a point.
     //* ~[link FontSize]
     property FontSize20: integer read GetFontSize20 write SetFontSize20;
     //* Font style.
     property FontStyle: TXFontStyles read GetFontStyle write SetFontStyle;
     //* Use FontSubSuperScript to set if the font shall be subscript or superscript.
     property FontSubSuperScript: TXSubSuperscript read GetFontSubSuperScript write SetFontSubSuperScript;
     //* Underline style of the font.
     property FontUnderline: TXUnderline read GetFontUnderline write SetFontUnderline;
     end;

type
//* ~exclude
   TFormattedObjectNotify = class(TFormattedObject)
protected
     FChangeEvent: TFormatEvent;

     function  GetIndex: integer; virtual; abstract;

     procedure FormatChange; virtual;

     procedure SetFillPatternBackColor(const Value: TExcelColor);        override;
     procedure SetFillPatternForeColor(const Value: TExcelColor);        override;
     procedure SetBorderBottomColor   (const Value: TExcelColor);        override;
     procedure SetBorderBottomStyle   (const Value: TCellBorderStyle);   override;
     procedure SetBorderDiagColor     (const Value: TExcelColor);        override;
     procedure SetBorderDiagLines     (const Value: TDiagLines);         override;
     procedure SetBorderDiagStyle     (const Value: TCellBorderStyle);   override;
     procedure SetBorderLeftColor     (const Value: TExcelColor);        override;
     procedure SetBorderLeftStyle     (const Value: TCellBorderStyle);   override;
     procedure SetBorderRightColor    (const Value: TExcelColor);        override;
     procedure SetBorderRightStyle    (const Value: TCellBorderStyle);   override;
     procedure SetBorderTopColor      (const Value: TExcelColor);        override;
     procedure SetBorderTopStyle      (const Value: TCellBorderStyle);   override;
     procedure SetFFormatOptions      (const Value: TFormatOptions);     override;
     procedure SetIndent              (const Value: byte);               override;
     procedure SetNumberFormat        (const Value: WideString);         override;
     procedure SetProtection          (const Value: TCellProtections);   override;
     procedure SetRotation            (const Value: smallint);           override;
     procedure SetHorizAlignment      (const Value: TCellHorizAlignment); override;
     procedure SetVertAlignment       (const Value: TCellVertAlignment); override;
     procedure SetFillPatternPattern  (const Value: TExcelFillPattern);  override;
     procedure SetFontCharset         (const Value: TFontCharset);       override;
     procedure SetFontColor           (const Value: TExcelColor);        override;
     procedure SetFontFamily          (const Value: byte);               override;
     procedure SetFontName            (const Value: WideString);         override;
     procedure SetFontSize            (const Value: integer);            override;
     procedure SetFontSize20          (const Value: integer);            override;
     procedure SetFontSubSuperScript  (const Value: TXSubSuperscript);   override;
     procedure SetFontUnderline       (const Value: TXUnderline);        override;
     procedure SetFontStyle           (const Value: TXFontStyles);       override;
public
     end;

implementation

{ TFormattedObject }

procedure TFormattedObject.AssignFormat(FormatIndex: word);
begin
  if FFormat.Index >= FFormats.DeleteIndex then begin
    FFormat.UsageCount := FFormat.UsageCount - 1;
    if FFormat.UsageCount <= 0 then
      FFormats.Delete(FFormat.Index);
  end;
  FFormat := FFormats[FormatIndex];
  if FFormat.Index >= FFormats.DeleteIndex then
    FFormat.UsageCount := FFormat.UsageCount + 1;
end;

procedure TFormattedObject.AssignFont(Font: TFont);
var
  F: TXFont;
begin
  F := TXFont.Create;
  try
    F.Assign(Font);
    UpdateFont(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.AssignFormat(Format: TCellFormat);
begin
  UpdateFormat(Format);
end;

constructor TFormattedObject.Create(Formats: TCellFormats; FormatIndex: word);
begin
  FFormats := Formats;
  if FormatIndex >= FFormats.Count then
    FFormat := FFormats[DEFAULT_FORMAT]
  else
    FFormat := FFormats[FormatIndex];
end;

function TFormattedObject.FontHeight(PPI: integer): integer;
begin
  Result := -Round(FontSize * (PPI / 72));
end;

function TFormattedObject.GetBorderBottomColor: TExcelColor;
begin
  Result := FFormat.BorderBottomColor;
end;

function TFormattedObject.GetBorderBottomStyle: TCellBorderStyle;
begin
  Result := FFormat.BorderBottomStyle;
end;

function TFormattedObject.GetBorderDiagColor: TExcelColor;
begin
  Result := FFormat.BorderDiagColor;
end;

function TFormattedObject.GetBorderDiagLines: TDiagLines;
begin
  Result := FFormat.BorderDiagLines;
end;

function TFormattedObject.GetBorderDiagStyle: TCellBorderStyle;
begin
  Result := FFormat.BorderDiagStyle;
end;

function TFormattedObject.GetBorderLeftColor: TExcelColor;
begin
  Result := FFormat.BorderLeftColor;
end;

function TFormattedObject.GetBorderLeftStyle: TCellBorderStyle;
begin
  Result := FFormat.BorderLeftStyle;
end;

function TFormattedObject.GetBorderRightColor: TExcelColor;
begin
  Result := FFormat.BorderRightColor;
end;

function TFormattedObject.GetBorderRightStyle: TCellBorderStyle;
begin
  Result := FFormat.BorderRightStyle;
end;

function TFormattedObject.GetBorderTopColor: TExcelColor;
begin
  Result := FFormat.BorderTopColor;
end;

function TFormattedObject.GetBorderTopStyle: TCellBorderStyle;
begin
  Result := FFormat.BorderTopStyle;
end;

function TFormattedObject.GetFillPatternBackColor: TExcelColor;
begin
  Result := FFormat.FillPatternBackColor
end;

function TFormattedObject.GetFillPatternForeColor: TExcelColor;
begin
  Result := FFormat.FillPatternForeColor
end;

function TFormattedObject.GetFillPatternPattern: TExcelFillPattern;
begin
  Result := FFormat.FillPatternPattern;
end;

function TFormattedObject.GetFontIndex: word;
begin
  Result := FFormat.FontIndex;
end;

function TFormattedObject.GetFormatOptions: TFormatOptions;
begin
  Result := FFormat.FormatOptions;
end;

function TFormattedObject.GetHorizAlignment: TCellHorizAlignment;
begin
  Result := FFormat.HorizAlignment;
end;

function TFormattedObject.GetIndent: byte;
begin
  Result := FFormat.Indent;
end;

function TFormattedObject.GetNumberFormat: WideString;
begin
  Result := FFormat.NumberFormat;
end;

function TFormattedObject.GetProtection: TCellProtections;
begin
  Result := FFormat.Protection;
end;

function TFormattedObject.GetRotation: smallint;
begin
  Result := FFormat.Rotation;
end;

function TFormattedObject.GetVertAlignment: TCellVertAlignment;
begin
  Result := FFormat.VertAlignment;
end;

procedure TFormattedObject.SetBorderBottomColor(const Value: TExcelColor);
var
  F: TCellFormat;
begin
  if Value = GetBorderBottomColor then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.BorderBottomColor := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetBorderBottomStyle(const Value: TCellBorderStyle);
var
  F: TCellFormat;
begin
  if Value = GetBorderBottomStyle then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.BorderBottomStyle := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetBorderDiagColor(const Value: TExcelColor);
var
  F: TCellFormat;
begin
  if Value = GetBorderDiagColor then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.BorderDiagColor := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetBorderDiagLines(const Value: TDiagLines);
var
  F: TCellFormat;
begin
  if Value = GetBorderDiagLines then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.BorderDiagLines := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetBorderDiagStyle(const Value: TCellBorderStyle);
var
  F: TCellFormat;
begin
  if Value = GetBorderDiagStyle then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.BorderDiagStyle := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetBorderLeftColor(const Value: TExcelColor);
var
  F: TCellFormat;
begin
  if Value = GetBorderLeftColor then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.BorderLeftColor := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetBorderLeftStyle(const Value: TCellBorderStyle);
var
  F: TCellFormat;
begin
  if Value = GetBorderLeftStyle then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.BorderLeftStyle := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetBorderRightColor(const Value: TExcelColor);
var
  F: TCellFormat;
begin
  if Value = GetBorderRightColor then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.BorderRightColor := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetBorderRightStyle(const Value: TCellBorderStyle);
var
  F: TCellFormat;
begin
  if Value = GetBorderRightStyle then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.BorderRightStyle := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetBorderTopColor(const Value: TExcelColor);
var
  F: TCellFormat;
begin
  if Value = GetBorderTopColor then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.BorderTopColor := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetBorderTopStyle(const Value: TCellBorderStyle);
var
  F: TCellFormat;
begin
  if Value = GetBorderTopStyle then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.BorderTopStyle := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetDefaultFormat;
var
  F: TCellFormat;
begin
  F := TCellFormat.Create(FFormats,DEFAULT_FORMAT);
  try
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetFFormatOptions(const Value: TFormatOptions);
var
  F: TCellFormat;
begin
  if Value = GetFormatOptions then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.FormatOptions := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetFillPatternBackColor(const Value: TExcelColor);
var
  F: TCellFormat;
begin
  if Value = GetFillPatternBackColor then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.FillPatternBackColor := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetFillPatternForeColor(const Value: TExcelColor);
var
  F: TCellFormat;
begin
  if Value = GetFillPatternForeColor then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.FillPatternForeColor := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetFillPatternPattern(const Value: TExcelFillPattern);
var
  F: TCellFormat;
begin
  if Value = GetFillPatternPattern then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.FillPatternPattern := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetHorizAlignment(const Value: TCellHorizAlignment);
var
  F: TCellFormat;
begin
  if Value = GetHorizAlignment then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.HorizAlignment := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetIndent(const Value: byte);
var
  F: TCellFormat;
begin
  if Value = GetIndent then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.Indent := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetNumberFormat(const Value: WideString);
var
  F: TCellFormat;
begin
  if Value = GetNumberFormat then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.NumberFormat := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetProtection(const Value: TCellProtections);
var
  F: TCellFormat;
begin
  if Value = GetProtection then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.Protection := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetRotation(const Value: smallint);
var
  F: TCellFormat;
begin
  if Value = GetRotation then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.Rotation := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetVertAlignment(const Value: TCellVertAlignment);
var
  F: TCellFormat;
begin
  if Value = GetVertAlignment then
    Exit;
  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.VertAlignment := Value;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.UpdateFormat(NewFormat: TCellFormat);
var
  i: integer;
begin
  if FFormat.Index >= FFormats.DeleteIndex then begin
    FFormat.UsageCount := FFormat.UsageCount - 1;
    if FFormat.UsageCount <= 0 then
      FFormats.Delete(FFormat.Index);
  end;
  i := FFormats.FindIndex(NewFormat);
  if i < 0 then begin
    FFormat := FFormats.Add;
    FFormat.Assign(NewFormat);
    FFormat.UsageCount := 1;
  end
  else begin
    FFormat := FFormats[i];
    FFormat.UsageCount := FFormat.UsageCount + 1;
  end;
end;

procedure TFormattedObject.UpdateFont(NewFont: TXFont);
var
  i,FI: integer;
  F: TCellFormat;
begin
  FI := FFormat.FontIndex;
  if not FFormats.Fonts[FI].Unique and (FI >= FFormats.Fonts.DeleteIndex) then begin
    FFormats.Fonts[FI].UsageCount := FFormats.Fonts[FI].UsageCount - 1;
    if FFormats.Fonts[FI].UsageCount <= 0 then begin
      FFormats.Fonts.Delete(FI);
      // TODO: Formats must have pointers to Fonts. Index may cause disater
      // when fonts are deleted.
      for i := 0 to FFormats.Count - 1 do begin
        if FFormats[i].FontIndex > FI then
          FFormats[i].FontIndex := FFormats[i].FontIndex - 1;
      end;
    end;
  end;
  FI := FFormats.Fonts.FindIndex(NewFont);
  if FI < 0 then begin
    FI := FFormats.Fonts.Add.Index;
    FFormats.Fonts[FI].Assign(NewFont);
    FFormats.Fonts[FI].UsageCount := 1;
  end
  else
    FFormats.Fonts[FI].UsageCount := FFormats.Fonts[FI].UsageCount + 1;

  F := TCellFormat.Create(FFormats,FFormat.Index);
  try
    F.FontIndex := FI;
    UpdateFormat(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.CopyToLOGFONT(var Dest: LOGFONT; var FontColor: longword);
begin
  FFormat.XFont.CopyToLOGFONT(Dest,FontColor);
end;

procedure TFormattedObject.CopyToTFont(Font: TFont);
begin
  FFormat.XFont.CopyToTFont(Font);
end;

function TFormattedObject.GetFontStyle: TXFontStyles;
begin
  Result := FFormat.XFont.Style;
end;

procedure TFormattedObject.SetFontStyle(const Value: TXFontStyles);
var
  F: TXFont;
begin
  if Value = GetFontStyle then
    Exit;
  F := TXFont.Create(FFormat.XFont);
  try
    F.Style := Value;
    UpdateFont(F);
  finally
    F.Free;
  end;
end;

function TFormattedObject.GetFontCharset: TFontCharset;
begin
  Result := FFormat.XFont.Charset;
end;

function TFormattedObject.GetFontColor: TExcelColor;
begin
  Result := FFormat.XFont.Color;
end;

function TFormattedObject.GetFontFamily: byte;
begin
  Result := FFormat.XFont.Family;
end;

function TFormattedObject.GetFontHandle(PixelsPerInch: integer): longword;
begin
  Result := FFormat.XFont.GetHandle(PixelsPerInch);
end;

function TFormattedObject.GetFontName: WideString;
begin
  Result := FFormat.XFont.Name;
end;

function TFormattedObject.GetFontSize: integer;
begin
  Result := FFormat.XFont.Size;
end;

function TFormattedObject.GetFontSize20: integer;
begin
  Result := FFormat.XFont.Size20;
end;

function TFormattedObject.GetFontSubSuperScript: TXSubSuperscript;
begin
  Result := FFormat.XFont.SubSuperScript;
end;

function TFormattedObject.GetFontUnderline: TXUnderline;
begin
  Result := FFormat.XFont.Underline;
end;

procedure TFormattedObject.SetFontCharset(const Value: TFontCharset);
var
  F: TXFont;
begin
  if Value = GetFontCharset then
    Exit;
  F := TXFont.Create(FFormat.XFont);
  try
    F.Charset := Value;
    UpdateFont(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetFontColor(const Value: TExcelColor);
var
  F: TXFont;
begin
  if Value = GetFontColor then
    Exit;
  F := TXFont.Create(FFormat.XFont);
  try
    F.Color := Value;
    UpdateFont(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetFontFamily(const Value: byte);
var
  F: TXFont;
begin
  if Value = GetFontFamily then
    Exit;
  F := TXFont.Create(FFormat.XFont);
  try
    F.Family := Value;
    UpdateFont(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetFontName(const Value: WideString);
var
  F: TXFont;
begin
  if Value = GetFontName then
    Exit;
  F := TXFont.Create(FFormat.XFont);
  try
    F.Name := Value;
    UpdateFont(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetFontSize(const Value: integer);
var
  F: TXFont;
begin
  if Value = GetFontSize then
    Exit;
  F := TXFont.Create(FFormat.XFont);
  try
    F.Size := Value;
    UpdateFont(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetFontSize20(const Value: integer);
var
  F: TXFont;
begin
  if Value = GetFontSize20 then
    Exit;
  F := TXFont.Create(FFormat.XFont);
  try
    F.Size20 := Value;
    UpdateFont(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetFontSubSuperScript(const Value: TXSubSuperscript);
var
  F: TXFont;
begin
  if Value = GetFontSubSuperScript then
    Exit;
  F := TXFont.Create(FFormat.XFont);
  try
    F.SubSuperScript := Value;
    UpdateFont(F);
  finally
    F.Free;
  end;
end;

procedure TFormattedObject.SetFontUnderline(const Value: TXUnderline);
var
  F: TXFont;
begin
  if Value = GetFontUnderline then
    Exit;
  F := TXFont.Create(FFormat.XFont);
  try
    F.Underline := Value;
    UpdateFont(F);
  finally
    F.Free;
  end;
end;

function TFormattedObject.GetFormatIndex: word;
begin
  Result := FFormat.Index;
end;

function TFormattedObject.IsFormatted: boolean;
begin
  Result := (FFormat.Index <> DEFAULT_FORMAT) or (FFormat.FontIndex <> DEFAULT_FONT) or (FFormat.NumberFormat <> '');
end;

{ TFormattedObjectNotify }

procedure TFormattedObjectNotify.FormatChange;
begin

end;

procedure TFormattedObjectNotify.SetBorderBottomColor(const Value: TExcelColor);
var
  FI: word;
begin
  FI := FFormat.FontIndex;
  inherited SetBorderBottomColor(Value);
  if FI <> FFormat.FontIndex then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetBorderBottomStyle(const Value: TCellBorderStyle);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetBorderBottomStyle(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetBorderDiagColor(const Value: TExcelColor);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetBorderDiagColor(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetBorderDiagLines(const Value: TDiagLines);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetBorderDiagLines(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetBorderDiagStyle(const Value: TCellBorderStyle);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetBorderDiagStyle(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetBorderLeftColor(const Value: TExcelColor);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetBorderLeftColor(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetBorderLeftStyle(const Value: TCellBorderStyle);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetBorderLeftStyle(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetBorderRightColor(const Value: TExcelColor);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetBorderRightColor(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetBorderRightStyle(const Value: TCellBorderStyle);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetBorderRightStyle(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetBorderTopColor(const Value: TExcelColor);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetBorderTopColor(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetBorderTopStyle(const Value: TCellBorderStyle);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetBorderTopStyle(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFFormatOptions(const Value: TFormatOptions);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFFormatOptions(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFillPatternBackColor(const Value: TExcelColor);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFillPatternBackColor(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFillPatternForeColor(const Value: TExcelColor);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFillPatternForeColor(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFillPatternPattern(const Value: TExcelFillPattern);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFillPatternPattern(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFontCharset(const Value: TFontCharset);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFontCharset(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFontColor(const Value: TExcelColor);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFontColor(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFontFamily(const Value: byte);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFontFamily(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFontName(const Value: WideString);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFontName(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFontSize(const Value: integer);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFontSize(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFontSize20(const Value: integer);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFontSize20(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFontStyle(const Value: TXFontStyles);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFontStyle(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFontSubSuperScript(const Value: TXSubSuperscript);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFontSubSuperScript(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetFontUnderline(const Value: TXUnderline);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetFontUnderline(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetHorizAlignment(const Value: TCellHorizAlignment);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetHorizAlignment(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetIndent(const Value: byte);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetIndent(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetNumberFormat(const Value: WideString);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetNumberFormat(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetProtection(const Value: TCellProtections);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetProtection(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetRotation(const Value: smallint);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetRotation(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

procedure TFormattedObjectNotify.SetVertAlignment(const Value: TCellVertAlignment);
var
  FI: word;
begin
  FI := FFormat.Index;
  inherited SetVertAlignment(Value);
  if FI <> FFormat.Index then
    FChangeEvent(FFormat,GetIndex);
  FormatChange;
end;

end.
