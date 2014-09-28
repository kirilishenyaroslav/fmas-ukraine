unit XLSExport2;

{-
********************************************************************************
******* XLSReadWriteII V3.00                                             *******
*******                                                                  *******
******* Copyright(C) 1999,2004 Lars Arvidsson, Axolot Data               *******
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

uses Classes, SysUtils, XLSReadWriteII2;

//* Base class for objects that exports TXLSReadWriteII data to other file formats.
type TXLSExport2 = class(TComponent)
private
    procedure SetFilename(const Value: string);
protected
    FFilename: string;
    FXLS: TXLSReadWriteII2;
    FCurrSheetIndex: integer;
    FCol1,FCol2: integer;
    FRow1,FRow2: integer;

    procedure OpenFile;        virtual;
    procedure WriteFilePrefix; virtual;
    procedure WritePagePrefix; virtual;
    procedure WriteRowPrefix;  virtual;
    procedure WriteCell(SheetIndex,Col,Row: integer); virtual;
    procedure WriteRowSuffix;  virtual;
    procedure WritePageSuffix; virtual;
    procedure WriteFileSuffix; virtual;
    procedure CloseFile;       virtual;
    procedure WriteData;       virtual;
public
    constructor Create(AOwner: TComponent); override;
    //* Writes the data to the file set with ~[link Filename]
    procedure Write;
    //* Writes the data to a stream.
    procedure SaveToStream(Stream: TStream); virtual;
published
    //* Left column of the source area on the worksheet.
    property Col1: integer read FCol1 write FCol1;
    //* Right column of the source area on the worksheet.
    property Col2: integer read FCol2 write FCol2;
    //* Name of the destination file tjat the data shall be written to.
    property Filename: string read FFilename write SetFilename;
    //* Top row of the source area on the worksheet.
    property Row1: integer read FRow1 write FRow1;
    //* Bottom row of the source area on the worksheet.
    property Row2: integer read FRow2 write FRow2;
    //* The source TXLSReadWriteII2 object.
    property XLS: TXLSReadWriteII2 read FXLS write FXLS;
    end;

implementation

{ TXLSExport }

procedure TXLSExport2.CloseFile;
begin

end;

constructor TXLSExport2.Create(AOwner: TComponent);
begin
  inherited;
  FCol1 := -1;
  FCol2 := -1;
  FRow1 := -1;
  FRow2 := -1;
end;

procedure TXLSExport2.OpenFile;
begin

end;

procedure TXLSExport2.SaveToStream(Stream: TStream);
begin
  if FXLS = Nil then
    raise Exception.Create('No TXLSReadWriteII defined');
  WriteData;
end;

procedure TXLSExport2.SetFilename(const Value: string);
begin
  FFilename := Value;
end;

procedure TXLSExport2.Write;
begin
  if FFilename = '' then
    raise Exception.Create('Filename is missing');
  if FXLS = Nil then
    raise Exception.Create('No TXLSReadWriteII defined');
  OpenFile;
  try
    WriteData;
  finally
    CloseFile;
  end;
end;

procedure TXLSExport2.WriteCell(SheetIndex, Col, Row: integer);
begin

end;

procedure TXLSExport2.WriteData;
var
  i,Col,Row: integer;
  C1,C2,R1,R2: integer;
begin
  WriteFilePrefix;
  for i := 0 to FXLS.Sheets.Count - 1 do begin
    FXLS.Sheets[i].CalcDimensions;
    if FCol1 >= 0 then C1 := FCol1 else C1 := FXLS.Sheets[i].FirstCol;
    if FCol2 >= 0 then C2 := FCol2 else C2 := FXLS.Sheets[i].LastCol;
    if FRow1 >= 0 then R1 := FRow1 else R1 := FXLS.Sheets[i].FirstRow;
    if FRow2 >= 0 then R2 := FRow2 else R2 := FXLS.Sheets[i].LastRow;
    FCurrSheetIndex := i;
    WritePagePrefix;
    for Row := R1 to R2 do begin
      WriteRowPrefix;
      for Col := C1 to C2 do
        WriteCell(i,Col,Row);
      WriteRowSuffix;
    end;
    WritePageSuffix;
  end;
  WriteFileSuffix;
end;

procedure TXLSExport2.WriteFilePrefix;
begin

end;

procedure TXLSExport2.WriteFileSuffix;
begin

end;

procedure TXLSExport2.WritePagePrefix;
begin

end;

procedure TXLSExport2.WritePageSuffix;
begin

end;

procedure TXLSExport2.WriteRowPrefix;
begin

end;

procedure TXLSExport2.WriteRowSuffix;
begin

end;

end.
