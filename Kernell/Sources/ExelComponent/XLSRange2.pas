unit XLSRange2;

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

uses Classes, SysUtils, XLSUtils2, BIFFRecsII2, CellFormats2, CellStorage2,
     Graphics, XLSFonts2, MergedCells2, Cell2;

//* What type of are the range covers.
type TXLSRangeType = (xrtCell,   //* A single cell.
                      xrtColumn, //* A whole column.
                      xrtRow,    //* A whole row.
                      xrtArea    //* An area.
                      );

//* Use TXLSRange to manipulate a whole area of cells. The area can be
//* formatted, merged, moved, copied etc. When formatting an area, blank
//* cells are added automatically if there are no cells in the area.
//* ~[br]
//* ~[br]
//* ~[b Example:]
//* ~[br]
//* ~[sample
//* // Write a string cell.
//* XLS.Sheet[0~[].AsStringRef['C2'~[] := 'Hello';
//* // Set the font size of the cells in the area.
//* XLS.Sheet[0~[].Range.Items[1,0,3,3~[].FontSize := 14;
//* // Set the color of the cells.
//* XLS.Sheet[0~[].Range.ItemsRef['B1:D4'~[].FillPatternForeColor := xcYellow;
//* // Set a outline border.
//* XLS.Sheet[0~[].Range.ItemsRef['B1:D4'~[].BorderOutlineStyle := cbsThick;
//* // Set color of the outline border.
//* XLS.Sheet[0~[].Range.ItemsRef['B1:D4'~[].BorderOutlineColor := xcRed;
//* // Make a copy of the cells.
//* XLS.Sheet[0~[].Range.ItemsRef['B1:D4'~[].Copy(8,10);
//* // Move the cells.
//* XLS.Sheet[0~[].Range.ItemsRef['B1:D4'~[].Move(8,2);
//* ]
type TXLSRange = class(TObject)
private
     FSheetIndex: integer;
     FCells: TCellStorage;
     FMergedCells: TMergedCells;
     FCol1,FRow1,FCol2,FRow2: integer;
     FRangeType: TXLSRangeType;
     FFormats: TCellFormats;
     ICellOp: ICellOperations;

     procedure SetBorderInsideHorizColor(const Value: TExcelColor);
     procedure SetBorderInsideHorizStyle(const Value: TCellBorderStyle);
     procedure SetBorderInsideVertColor(const Value: TExcelColor);
     procedure SetBorderInsideVertStyle(const Value: TCellBorderStyle);
     procedure SetBorderOutlineColor(const Value: TExcelColor);
     procedure SetBorderOutlineStyle(const Value: TCellBorderStyle);
     procedure SetBorderBottomColor(const Value: TExcelColor);
     procedure SetBorderBottomStyle(const Value: TCellBorderStyle);
     procedure SetBorderDiagColor(const Value: TExcelColor);
     procedure SetBorderDiagLines(const Value: TDiagLines);
     procedure SetBorderDiagStyle(const Value: TCellBorderStyle);
     procedure SetBorderLeftColor(const Value: TExcelColor);
     procedure SetBorderLeftStyle(const Value: TCellBorderStyle);
     procedure SetBorderRightColor(const Value: TExcelColor);
     procedure SetBorderRightStyle(const Value: TCellBorderStyle);
     procedure SetBorderTopColor(const Value: TExcelColor);
     procedure SetBorderTopStyle(const Value: TCellBorderStyle);
     procedure SetFormatOptions(const Value: TFormatOptions);
     procedure SetFillPatternBackColor(const Value: TExcelColor);
     procedure SetFillPatternForeColor(const Value: TExcelColor);
     procedure SetFillPatternPattern(const Value: TExcelFillPattern);
     procedure SetFontCharset(const Value: TFontCharset);
     procedure SetFontColor(const Value: TExcelColor);
     procedure SetFontFamily(const Value: byte);
     procedure SetFontName(const Value: WideString);
     procedure SetFontSize(const Value: integer);
     procedure SetFontSize20(const Value: integer);
     procedure SetFontSubSuperScript(const Value: TXSubSuperscript);
     procedure SetFontUnderline(const Value: TXUnderline);
     procedure SetHorizAlignment(const Value: TCellHorizAlignment);
     procedure SetIndent(const Value: byte);
     procedure SetNumberFormat(const Value: WideString);
     procedure SetProtection(const Value: TCellProtections);
     procedure SetRotation(const Value: smallint);
     procedure SetVertAlignment(const Value: TCellVertAlignment);
     procedure SetFontStyle(const Value: TXFontStyles);

     function  GetMerged: boolean;
     procedure SetMerged(const Value: boolean);
     procedure AddBlanks;

     function GetItems(C1, R1, C2, R2: integer): TXLSRange;
     function GetItemsRef(Ref: WideString): TXLSRange;
protected
     FGetDefaultFormatEvent: TGetDefaultFormatEvent;
public
     //* ~exclude
     constructor Create(SheetIndex: integer; Cells: TCellStorage; Formats: TCellFormats; MergedCells: TMergedCells; CellOp: ICellOperations);

     //* Deletes the cells in the area.
     procedure Delete;
     //* Copies the cells in the area.
     //* ~param DestCol Destionation column.
     //* ~param DestRow Destionation row.
     procedure Copy(DestCol,DestRow: integer); overload;
     //* Copies the cells in the area.
     //* ~param DestSheet Destionation sheet index.
     //* ~param DestCol Destionation column.
     //* ~param DestRow Destionation row.
     procedure Copy(DestSheet,DestCol,DestRow: integer); overload;
     //* Moves the cells in the area.
     //* ~param DestCol Destionation column.
     //* ~param DestRow Destionation row.
     procedure Move(DestCol,DestRow: integer); overload;
     //* Moves the cells in the area.
     //* ~param DestSheet Destionation sheet index.
     //* ~param DestCol Destionation column.
     //* ~param DestRow Destionation row.
     procedure Move(DestSheet,DestCol,DestRow: integer); overload;

     //* Protection of cells.
     property Protection: TCellProtections        write SetProtection;
     //* Horizontal alignment of text in cells.
     property HorizAlignment: TCellHorizAlignment write SetHorizAlignment;
     //* Vertical alignment of text in cells.
     property VertAlignment: TCellVertAlignment   write SetVertAlignment;
     //* Text indent
     //* The indent values can range from 0-15. A value of 0 (zero) is no
     //* indent. An increment with one increases the indent with about one character.
     property Indent: byte                        write SetIndent;
     //* Rotation of cell text.
     //* Rotation, in degrees. ~[br]
     //* The value 0 – 90 is rotation up 0 – 90 deg. The value 91 – 180 is
     //* rotation down 1 – 90 deg. The value 255 is vertical text.
     property Rotation: smallint                  write SetRotation;
     //* Cell format options.
     property FormatOptions: TFormatOptions       write SetFormatOptions;
     //* The foreground fill color.
     //* Use this property to set the color of the foreground fill pattern. ~[br]
     //* Note: This is the cell color. If you want to have just one color
     //* for the cell, use this property. ~[br]
     //* ~[link FillPatternBackColor], ~[link FillPatternPattern]
     property FillPatternForeColor: TExcelColor   write SetFillPatternForeColor;
     //* The background fill color.
     //* Use this property to set the color of the background fill pattern. ~[br]
     //* <b>Note:</b> If no fill pattern is assigned to the format, this
     //* property has no effect. If you just want to set the cell color, use
     //* FillPatternForeColor.
     //* ~[link FillPatternForeColor], ~[link FillPatternPattern]
     property FillPatternBackColor: TExcelColor   write SetFillPatternBackColor;
     //* The fill pattern for the cell.
     //* Use this property to set the fill pattern for the cell. Values can
     //* range between 0-127. 0 (zero) is no fill pattern.
     //* Fill patterns and there corresponding numbers, that are used in Excel:~[br]
     //* ~[image ..\help\PatternsNum.bmp]
     //* ~[link FillPatternForeColor], ~[link FillPatternBackColor]
     property FillPatternPattern: TExcelFillPattern write SetFillPatternPattern;
     //* Format mask used to format numbers.
     //* NumberFormat uses the same options as in the Format dilaog inExcel.~[br]
     //* NumberFormat is also used to create cells with date and time values,
     //* as there are no specific date or time cells in Excel.
     property NumberFormat: WideString            write SetNumberFormat;

     //* The color of the top cell border.
     //* ~[link TCellBorderStyle]
     property BorderTopColor:    TExcelColor      write SetBorderTopColor;
     //* The style of the top cell border;
     property BorderTopStyle:    TCellBorderStyle write SetBorderTopStyle;
     //* The color of the left cell border.
     //* ~[link TCellBorderStyle]
     property BorderLeftColor:   TExcelColor      write SetBorderLeftColor;
     //* The style of the left cell border;
     property BorderLeftStyle:   TCellBorderStyle write SetBorderLeftStyle;
     //* The color of the right cell border.
     //* ~[link TCellBorderStyle]
     property BorderRightColor:  TExcelColor      write SetBorderRightColor;
     //* The style of the right cell border;
     property BorderRightStyle:  TCellBorderStyle write SetBorderRightStyle;
     //* The color of the bottom cell border.
     //* ~[link TCellBorderStyle]
     property BorderBottomColor: TExcelColor      write SetBorderBottomColor;
     //* The style of the bottom cell border;
     property BorderBottomStyle: TCellBorderStyle write SetBorderBottomStyle;
     //* The color of the lines in a cell with diagonal lines.
     //* ~[link TCellBorderStyle]
     property BorderDiagColor:   TExcelColor      write SetBorderDiagColor;
     //* The style of diagonal lines in a cell;
     property BorderDiagStyle:   TCellBorderStyle write SetBorderDiagStyle;
     //* If the cell shall have diagonal lines.
     property BorderDiagLines:   TDiagLines       write SetBorderDiagLines;

     //* Set the outline border color of the cells in the area.
     property BorderOutlineColor:TExcelColor      write SetBorderOutlineColor;
     //* Set the outline border style of the cells in the area.
     property BorderOutlineStyle:TCellBorderStyle write SetBorderOutlineStyle;
     //* Set the color of vertical lines between the cells in the area. The outline of the
     //* cell area is not affected. See ~[link BorderOutlineColor] and ~[link BorderOutlineStyle]
     property BorderInsideVertColor:TExcelColor   write SetBorderInsideVertColor;
     //* Set the style of vertical lines between the cells in the area. The outline of the
     //* cell area is not affected. See ~[link BorderOutlineColor] and ~[link BorderOutlineStyle]
     property BorderInsideVertStyle:TCellBorderStyle write SetBorderInsideVertStyle;
     //* Set the color of horizontal lines between the cells in the area. The outline of the
     //* cell area is not affected. See ~[link BorderOutlineColor] and ~[link BorderOutlineStyle]
     property BorderInsideHorizColor:TExcelColor   write SetBorderInsideHorizColor;
     //* Set the style of horizontal lines between the cells in the area. The outline of the
     //* cell area is not affected. See ~[link BorderOutlineColor] and ~[link BorderOutlineStyle]
     property BorderInsideHorizStyle:TCellBorderStyle write SetBorderInsideHorizStyle;

     //* The name of the font.
     property FontName: WideString                write SetFontName;
     //* The character set of the font.
     property FontCharset: TFontCharset           write SetFontCharset;
     //* The family of the font.
     //* The FontFamily can have the following values:~[br]
     //* 0 = None (unknown/don't care).~[br]
     //* 1 = Roman.~[br]
     //* 2 = Swiss.~[br]
     //* 3 = Modern (fixed width).~[br]
     //* 4 = Script.~[br]
     //* 5 = Decorative.~[br]
     property FontFamily: byte                    write SetFontFamily;
     //* The color of the font.
     property FontColor: TExcelColor              write SetFontColor;
     //* The size of the font in points.
     //* ~[link FontSize20]
     property FontSize: integer                   write SetFontSize;
     //* Size of the font in units of 1/20th of a point.
     //* ~[link FontSize]
     property FontSize20: integer                 write SetFontSize20;
     //* Font style.
     property FontStyle: TXFontStyles             write SetFontStyle;
     //* Use FontSubSuperScript to set if the font shall be subscript or superscript.
     property FontSubSuperScript: TXSubSuperscript write SetFontSubSuperScript;
     //* Underline style of the font.
     property FontUnderline: TXUnderline           write SetFontUnderline;
     //* Merges or unmerges the cells int the area.
     property Merged: boolean read GetMerged write SetMerged;
     //* Defines the cell area to manipulate.
     //* C1 = Left column. ~[br]
     //* R1 = Top row. ~[br]
     //* C2 = Right column. ~[br]
     //* R2 = bottom row. ~[br]
     property Items[C1,R1,C2,R2: integer]: TXLSRange read GetItems; default;
     //* Defines the cell area to manipulate.
     //* Ref = The area as a string, like: 'A1:D4'.
     property ItemsRef[Ref: WideString]: TXLSRange read GetItemsRef;
     //* ~exclude
     property OnGetDefaultFormat: TGetDefaultFormatEvent read FGetDefaultFormatEvent write FGetDefaultFormatEvent;
     end;

implementation


{ TXLSRange }

procedure TXLSRange.AddBlanks;
var
  C,R: integer;
  RC: longword;
begin
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do begin
      RC := ColRowToRC(C,R);
      if FCells[RC] = Nil then
        FCells[RC] := TBlankCell.Create(RC,FFormats,FGetDefaultFormatEvent(C,R));
    end;
  end;
end;

procedure TXLSRange.Copy(DestSheet, DestCol, DestRow: integer);
begin
  ICellOp.CopyCells(FSheetIndex,FCol1,FRow1,FCol2,FRow2,DestSheet,DestCol,DestRow);
end;

procedure TXLSRange.Copy(DestCol, DestRow: integer);
begin
  ICellOp.CopyCells(FSheetIndex,FCol1,FRow1,FCol2,FRow2,FSheetIndex,DestCol,DestRow);
end;

constructor TXLSRange.Create(SheetIndex: integer; Cells: TCellStorage; Formats: TCellFormats; MergedCells: TMergedCells; CellOp: ICellOperations);
begin
  FSheetIndex := SheetIndex;
  FCells := Cells;
  FFormats := Formats;
  FMergedCells := MergedCells;
  ICellOp := CellOp;
end;

procedure TXLSRange.Delete;
begin
  ICellOp.DeleteCells(FSheetIndex,FCol1,FRow1,FCol2,FRow2);
end;

function TXLSRange.GetItems(C1, R1, C2, R2: integer): TXLSRange;
begin
  if not ClipAreaToSheet(C1,R1,C2,R2) then
    raise Exception.Create('Range is outside sheet limits');
  NormalizeArea(C1,R1,C2,R2);
  FCol1 := C1;
  FRow1 := R1;
  FCol2 := C2;
  FRow2 := R2;
  if (FCol1 = FCol2) and (FRow1 = FRow2) then
    FRangeType := xrtCell
  else if FCol1 = FCol2 then
    FRangeType := xrtColumn
  else if FRow1 = FRow2 then
    FRangeType := xrtRow
  else
    FRangeType := xrtArea;
  Result := Self;
end;

function TXLSRange.GetItemsRef(Ref: WideString): TXLSRange;
begin
  AreaStrToColRow(Ref,FCol1,FRow1,FCol2,FRow2);
  if (FCol1 = FCol2) and (FRow1 = FRow2) then
    FRangeType := xrtCell
  else if FCol1 = FCol2 then
    FRangeType := xrtColumn
  else if FRow1 = FRow2 then
    FRangeType := xrtRow
  else
    FRangeType := xrtArea;
  Result := Self;
end;

function TXLSRange.GetMerged: boolean;
begin
  Result := FMergedCells.FindArea(FCol1,FRow1,FCol2,FRow2) >= 0;
end;

procedure TXLSRange.Move(DestSheet, DestCol, DestRow: integer);
begin
  ICellOp.MoveCells(FSheetIndex,FCol1,FRow1,FCol2,FRow2,DestSheet,DestCol,DestRow);
end;

procedure TXLSRange.Move(DestCol, DestRow: integer);
begin
  ICellOp.MoveCells(FSheetIndex,FCol1,FRow1,FCol2,FRow2,FSheetIndex,DestCol,DestRow);
end;

procedure TXLSRange.SetBorderOutlineColor(const Value: TExcelColor);
begin
  SetBorderLeftColor(Value);
  SetBorderTopColor(Value);
  SetBorderRightColor(Value);
  SetBorderBottomColor(Value);
end;

procedure TXLSRange.SetBorderOutlineStyle(const Value: TCellBorderStyle);
begin
  SetBorderLeftStyle(Value);
  SetBorderTopStyle(Value);
  SetBorderRightStyle(Value);
  SetBorderBottomStyle(Value);
end;

procedure TXLSRange.SetBorderBottomColor(const Value: TExcelColor);
var
  C: integer;
begin
  AddBlanks;
  for C := FCol1 to FCol2 do
    FCells[ColRowToRC(C,FRow2)].BorderBottomColor := Value;
end;

procedure TXLSRange.SetBorderBottomStyle(const Value: TCellBorderStyle);
var
  C: integer;
begin
  AddBlanks;
  for C := FCol1 to FCol2 do begin
    if FCells[ColRowToRC(C,FRow1)].BorderBottomColor = xc0 then
      FCells[ColRowToRC(C,FRow1)].BorderBottomColor := xcAutomatic;
    FCells[ColRowToRC(C,FRow2)].BorderBottomStyle := Value;
  end;
end;

procedure TXLSRange.SetBorderDiagColor(const Value: TExcelColor);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].BorderDiagColor := Value;
  end;
end;

procedure TXLSRange.SetBorderDiagLines(const Value: TDiagLines);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].BorderDiagLines := Value;
  end;
end;

procedure TXLSRange.SetBorderDiagStyle(const Value: TCellBorderStyle);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do begin
      if FCells[ColRowToRC(C,R)].BorderDiagColor = xc0 then
        FCells[ColRowToRC(C,R)].BorderDiagColor := xcAutomatic;
      FCells[ColRowToRC(C,R)].BorderDiagStyle := Value;
    end;
  end;
end;

procedure TXLSRange.SetBorderInsideHorizColor(const Value: TExcelColor);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 - 1 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].BorderBottomColor := Value;
  end;
end;

procedure TXLSRange.SetBorderInsideHorizStyle(const Value: TCellBorderStyle);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 - 1 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].BorderBottomStyle := Value;
  end;
end;

procedure TXLSRange.SetBorderInsideVertColor(const Value: TExcelColor);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 - 1 do
      FCells[ColRowToRC(C,R)].BorderRightColor := Value;
  end;
end;

procedure TXLSRange.SetBorderInsideVertStyle(const Value: TCellBorderStyle);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 - 1 do
      FCells[ColRowToRC(C,R)].BorderRightStyle := Value;
  end;
end;

procedure TXLSRange.SetBorderLeftColor(const Value: TExcelColor);
var
  R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do
    FCells[ColRowToRC(FCol1,R)].BorderLeftColor := Value;
end;

procedure TXLSRange.SetBorderLeftStyle(const Value: TCellBorderStyle);
var
  R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    if FCells[ColRowToRC(FCol1,R)].BorderLeftColor = xc0 then
      FCells[ColRowToRC(FCol1,R)].BorderLeftColor := xcAutomatic;
    FCells[ColRowToRC(FCol1,R)].BorderLeftStyle := Value;
  end;
end;

procedure TXLSRange.SetBorderRightColor(const Value: TExcelColor);
var
  R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do
    FCells[ColRowToRC(FCol2,R)].BorderRightColor := Value;
end;

procedure TXLSRange.SetBorderRightStyle(const Value: TCellBorderStyle);
var
  R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    if FCells[ColRowToRC(FCol1,R)].BorderRightColor = xc0 then
      FCells[ColRowToRC(FCol1,R)].BorderRightColor := xcAutomatic;
    FCells[ColRowToRC(FCol2,R)].BorderRightStyle := Value;
  end;
end;

procedure TXLSRange.SetBorderTopColor(const Value: TExcelColor);
var
  C: integer;
begin
  AddBlanks;
  for C := FCol1 to FCol2 do
    FCells[ColRowToRC(C,FRow1)].BorderTopColor := Value;
end;

procedure TXLSRange.SetBorderTopStyle(const Value: TCellBorderStyle);
var
  C: integer;
begin
  AddBlanks;
  for C := FCol1 to FCol2 do begin
    if FCells[ColRowToRC(C,FRow1)].BorderTopColor = xc0 then
      FCells[ColRowToRC(C,FRow1)].BorderTopColor := xcAutomatic;
    FCells[ColRowToRC(C,FRow1)].BorderTopStyle := Value;
  end;
end;

procedure TXLSRange.SetFormatOptions(const Value: TFormatOptions);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FormatOptions := Value;
  end;
end;

procedure TXLSRange.SetFillPatternBackColor(const Value: TExcelColor);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FillPatternBackColor := Value;
  end;
end;

procedure TXLSRange.SetFillPatternForeColor(const Value: TExcelColor);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FillPatternForeColor := Value;
  end;
end;

procedure TXLSRange.SetFillPatternPattern(const Value: TExcelFillPattern);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FillPatternPattern := Value;
  end;
end;

procedure TXLSRange.SetFontCharset(const Value: TFontCharset);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FontCharset := Value;
  end;
end;

procedure TXLSRange.SetFontColor(const Value: TExcelColor);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FontColor := Value;
  end;
end;

procedure TXLSRange.SetFontFamily(const Value: byte);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FontFamily := Value;
  end;
end;

procedure TXLSRange.SetFontName(const Value: WideString);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FontName := Value;
  end;
end;

procedure TXLSRange.SetFontSize(const Value: integer);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FontSize := Value;
  end;
end;

procedure TXLSRange.SetFontSize20(const Value: integer);
var
  C,R: integer;
begin

  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FontSize20 := Value;
  end;
end;

procedure TXLSRange.SetFontStyle(const Value: TXFontStyles);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FontStyle := Value;
  end;
end;

procedure TXLSRange.SetFontSubSuperScript(const Value: TXSubSuperscript);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FontSubSuperScript := Value;
  end;
end;

procedure TXLSRange.SetFontUnderline(const Value: TXUnderline);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].FontUnderline := Value;
  end;
end;

procedure TXLSRange.SetHorizAlignment(const Value: TCellHorizAlignment);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].HorizAlignment := Value;
  end;
end;

procedure TXLSRange.SetIndent(const Value: byte);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].Indent := Value;
  end;
end;

procedure TXLSRange.SetMerged(const Value: boolean);
begin
  if Value then begin
    if FMergedCells.AreaInAreas(FCol1,FRow1,FCol2,FRow2) then
      raise Exception.Create('Can not change part of a merged cell');
    FMergedCells.Add(FCol1,FRow1,FCol2,FRow2);
  end
  else
    FMergedCells.Delete(FCol1,FRow1,FCol2,FRow2);
end;

procedure TXLSRange.SetNumberFormat(const Value: WideString);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].NumberFormat := Value;
  end;
end;

procedure TXLSRange.SetProtection(const Value: TCellProtections);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].Protection := Value;
  end;
end;

procedure TXLSRange.SetRotation(const Value: smallint);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].Rotation := Value;
  end;
end;

procedure TXLSRange.SetVertAlignment(const Value: TCellVertAlignment);
var
  C,R: integer;
begin
  AddBlanks;
  for R := FRow1 to FRow2 do begin
    for C := FCol1 to FCol2 do
      FCells[ColRowToRC(C,R)].VertAlignment := Value;
  end;
end;

end.
