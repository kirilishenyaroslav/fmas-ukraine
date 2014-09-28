unit ApplyFormat;

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

uses Classes, SysUtils, CellFormats2, Cell2,CellStorage2, BIFFRecsII2,
     XLSUtils2, XLSFonts2, Graphics;

type
// NOTE! TApplyFormat is kept for backward compatibility. Use the ~[link SheetData2.TSheet.Range TSheet.Range] property insted.
TApplyFormat = class(TObject)
private
     FFmt: TCellFormat;
     FFormats: TCellFormats;
     FCells: TCellStorage;
     FGetDefaultFormatEvent: TGetDefaultFormatEvent;

     function  GetCell(Col, Row: integer): TCell;
public
     //* ~exclude
     constructor Create(Formats: TCellFormats; Cells: TCellStorage);
     //* ~exclude
     destructor Destroy; override;
     //* TApplyFormat is kept for backward compatibility. Use the ~[link SheetData2.TSheet.Range TSheet.Range] property insted.
     //* ~param Col1 Left column.
     //* ~param Row1 Top row.
     //* ~param Col2 Right column.
     //* ~param Row2 Bottom row.
     procedure ClearFormats(Col1, Row1, Col2, Row2: integer);
     //* TApplyFormat is kept for backward compatibility. Use the ~[link SheetData2.TSheet.Range TSheet.Range] property insted.
     //* ~param Col1 Left column.
     //* ~param Row1 Top row.
     //* ~param Col2 Right column.
     //* ~param Row2 Bottom row.
     //* ~param Border Celll border style.
     //* ~param CellColor Cell fill color.
     //* ~param BorderColor Cell border color.
     procedure Box(Col1, Row1, Col2, Row2: integer; Border: TCellBorderStyle; CellColor,BorderColor: TExcelColor);
     //* TApplyFormat is kept for backward compatibility. Use the ~[link SheetData2.TSheet.Range TSheet.Range] property insted.
     //* ~param Col1 Left column.
     //* ~param Row1 Top row.
     //* ~param Col2 Right column.
     //* ~param Row2 Bottom row.
     //* ~param Color Cell fill color.
     procedure Color(Col1, Row1, Col2, Row2: integer; Color: TExcelColor);
     //* TApplyFormat is kept for backward compatibility. Use the ~[link SheetData2.TSheet.Range TSheet.Range] property insted.
     //* ~param Col1 Left column.
     //* ~param Row1 Top row.
     //* ~param Col2 Right column.
     //* ~param Row2 Bottom row.
     //* ~param SrcCell The cell to copy the formatting from.
     procedure Format(Col1, Row1, Col2, Row2: integer; SrcCell: TCell);
     //* TApplyFormat is kept for backward compatibility. Use the ~[link SheetData2.TSheet.Range TSheet.Range] property insted.
     //* ~param Col1 Left column.
     //* ~param Row1 Top row.
     //* ~param Col2 Right column.
     //* ~param Row2 Bottom row.
     //* ~param HorizAlignment Horizontal text alignment for the cells.
     //* ~param VertAlignment Vertcal text alignment for the cells.
     procedure Alignment(Col1, Row1, Col2, Row2: integer; HorizAlignment: TCellHorizAlignment; VertAlignment: TCellVertAlignment);
     //* TApplyFormat is kept for backward compatibility. Use the ~[link SheetData2.TSheet.Range TSheet.Range] property insted.
     //* ~param Col1 Left column.
     //* ~param Row1 Top row.
     //* ~param Col2 Right column.
     //* ~param Row2 Bottom row.
     //* ~param Font The font to use for the cells.
     procedure Font(Col1, Row1, Col2, Row2: integer; Font: TFont); overload;
     //* TApplyFormat is kept for backward compatibility. Use the ~[link SheetData2.TSheet.Range TSheet.Range] property insted.
     //* ~param Col1 Left column.
     //* ~param Row1 Top row.
     //* ~param Col2 Right column.
     //* ~param Row2 Bottom row.
     //* ~param Font The font to use for the cells.
     procedure Font(Col1, Row1, Col2, Row2: integer; Font: TXFont); overload;
     //* TApplyFormat is kept for backward compatibility. Use the ~[link SheetData2.TSheet.Range TSheet.Range] property insted.
     //* ~result The created format.
     function  CreateDefault: TCellFormat;
     //* TApplyFormat is kept for backward compatibility. Use the ~[link SheetData2.TSheet.Range TSheet.Range] property insted.
     property OnGetDefaultFormat: TGetDefaultFormatEvent read FGetDefaultFormatEvent write FGetDefaultFormatEvent;
     end;

implementation

{ TApplyFormat }

procedure TApplyFormat.Alignment(Col1, Row1, Col2, Row2: integer; HorizAlignment: TCellHorizAlignment; VertAlignment: TCellVertAlignment);
var
  Col,Row: integer;
begin
  for Col := Col1 to Col2 do begin
    for Row := Row1 to Row2 do begin
      if FCells[ColRowToRC(Col,Row)] <> Nil then begin
        FCells[ColRowToRC(Col,Row)].HorizAlignment := HorizAlignment;
        FCells[ColRowToRC(Col,Row)].VertAlignment := VertAlignment;
      end;
    end;
  end;
end;

procedure TApplyFormat.Box(Col1, Row1, Col2, Row2: integer; Border: TCellBorderStyle; CellColor,BorderColor: TExcelColor);
var
  Col,Row: integer;
  BoxType: integer;
  Cell: TCell;

procedure ApplyBox;
begin
  case BoxType of
    1: begin
      FFmt.BorderLeftStyle := Border;
      FFmt.BorderTopStyle := Border;
      FFmt.BorderRightStyle := Border;
      FFmt.BorderBottomStyle := Border;
    end;
    2: begin
      if Row = Row1 then begin
        FFmt.BorderLeftStyle := Border;
        FFmt.BorderTopStyle := Border;
        FFmt.BorderRightStyle := Border;
      end
      else if Row = Row2 then begin
        FFmt.BorderLeftStyle := Border;
        FFmt.BorderRightStyle := Border;
        FFmt.BorderBottomStyle := Border;
      end
      else begin
        FFmt.BorderLeftStyle := Border;
        FFmt.BorderRightStyle := Border;
      end;
    end;
    3: begin
      if Col = Col1 then begin
        FFmt.BorderLeftStyle := Border;
        FFmt.BorderTopStyle := Border;
        FFmt.BorderBottomStyle := Border;
      end
      else if Col = Col2 then begin
        FFmt.BorderTopStyle := Border;
        FFmt.BorderRightStyle := Border;
        FFmt.BorderBottomStyle := Border;
      end
      else begin
        FFmt.BorderTopStyle := Border;
        FFmt.BorderBottomStyle := Border;
      end;
    end;
    4: begin
      if (Col = Col1) and (Row = Row1) then begin
        FFmt.BorderLeftStyle := Border;
        FFmt.BorderTopStyle := Border;
      end
      else if (Col = Col2) and (Row = Row1) then begin
        FFmt.BorderTopStyle := Border;
        FFmt.BorderRightStyle := Border;
      end
      else if (Col = Col1) and (Row = Row2) then begin
        FFmt.BorderLeftStyle := Border;
        FFmt.BorderBottomStyle := Border;
      end
      else if (Col = Col2) and (Row = Row2) then begin
        FFmt.BorderRightStyle := Border;
        FFmt.BorderBottomStyle := Border;
      end
      else if Col = Col1 then
        FFmt.BorderLeftStyle := Border
      else if Col = Col2 then
        FFmt.BorderRightStyle := Border
      else if Row = Row1 then
        FFmt.BorderTopStyle := Border
      else if Row = Row2 then
        FFmt.BorderBottomStyle := Border;
    end;
  end;
end;

begin
  FFmt.Assign(FFormats[DEFAULT_FORMAT]);
  if (Col1 = Col2) and (Row1 = Row2) then
    BoxType := 1
  else if Col1 = Col2 then
    BoxType := 2
  else if Row1 = Row2 then
    BoxType := 3
  else
    BoxType := 4;
  for Col := Col1 to Col2 do begin
    for Row := Row1 to Row2 do begin
      // Don't add blank cells with xcAutomatic color
      if (CellColor = xcAutomatic) and not ((Col = Col1) or (Col = Col2) or (Row = Row1) or (Row = Row2)) then
        Continue;
      Cell := GetCell(Col,Row);
      ApplyBox;
      if CellColor <> xcAutomatic then
        FFmt.FillPatternForeColor := CellColor;

      FFmt.BorderLeftColor := BorderColor;
      FFmt.BorderTopColor := BorderColor;
      FFmt.BorderRightColor := BorderColor;
      FFmt.BorderBottomColor := BorderColor;
      Cell.AssignFormat(FFmt);
    end;
  end;
end;

procedure TApplyFormat.ClearFormats(Col1, Row1, Col2, Row2: integer);
var
  Col,Row: integer;
  Cell: TCell;
begin
  for Col := Col1 to Col2 do begin
    for Row := Row1 to Row2 do begin
      Cell := FCells[ColRowToRC(Col,Row)];
      if Cell <> Nil then begin
        if Cell.CellType = ctBlank then
          FCells.Delete(ColRowToRC(Col,Row))
        else
          Cell.SetDefaultFormat;
      end;
    end;
  end;
end;

procedure TApplyFormat.Color(Col1, Row1, Col2, Row2: integer; Color: TExcelColor);
var
  Col,Row: integer;
  Cell: TCell;
begin
  for Col := Col1 to Col2 do begin
    for Row := Row1 to Row2 do begin
      Cell := GetCell(Col,Row);
      Cell.FillPatternForeColor := Color;
    end;
  end;
end;

constructor TApplyFormat.Create(Formats: TCellFormats; Cells: TCellStorage);
begin
  FFormats := Formats;
  FCells := Cells;
  FFmt := TCellFormat.Create(Formats);
end;

destructor TApplyFormat.Destroy;
begin
  FFmt.Free;
  inherited;
end;

procedure TApplyFormat.Format(Col1, Row1, Col2, Row2: integer; SrcCell: TCell);
var
  Col,Row: integer;
  Cell: TCell;
begin
  for Col := Col1 to Col2 do begin
    for Row := Row1 to Row2 do begin
      Cell := GetCell(Col,Row);
      Cell.AssignFormat(FFormats[SrcCell.FormatIndex]);
    end;
  end;
end;

function TApplyFormat.GetCell(Col, Row: integer): TCell;
begin
  Result := FCells[ColRowToRC(Col,Row)];
  if Result <> Nil then
    FFmt.Assign(FFormats[Result.FormatIndex])
  else begin
    Result := TBlankCell.Create(ColRowToRC(Col,Row),FFormats,FGetDefaultFormatEvent(Col,Row));
    FFmt.Assign(FFormats[Result.FormatIndex]);
    FCells[ColRowToRC(Col,Row)] := Result;
  end;
end;

function TApplyFormat.CreateDefault: TCellFormat;
begin
  Result := FFormats.Add;
  Result.Assign(FFormats[DEFAULT_FORMAT]);
end;

procedure TApplyFormat.Font(Col1, Row1, Col2, Row2: integer; Font: TFont);
var
  Col,Row: integer;
begin
  for Col := Col1 to Col2 do begin
    for Row := Row1 to Row2 do begin
      if FCells[ColRowToRC(Col,Row)] <> Nil then
        FCells[ColRowToRC(Col,Row)].AssignFont(Font);
    end;
  end;
end;

procedure TApplyFormat.Font(Col1, Row1, Col2, Row2: integer; Font: TXFont);
var
  Col,Row: integer;
begin
  raise Exception.Create('Not implemented.');
  for Col := Col1 to Col2 do begin
    for Row := Row1 to Row2 do begin
      if FCells[ColRowToRC(Col,Row)] <> Nil then
//        FCells[ColRowToRC(Col,Row)].AssignFont(Font);
    end;
  end;
end;

end.
