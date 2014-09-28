unit XLSExportHTML2;

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

uses Classes, SysUtils, XLSExport2, Cell2, BIFFRecsII2, XLSUtils2;


//* Settings for the tables created on the destionation file.
type TTABLEProperties = class(TPersistent)
private
     FBordeWidth: integer;
     FCellPadding: integer;
     FCellSpacing: integer;
protected
public
published
     //* Border width of the cells on the table.
     property BordeWidth: integer read FBordeWidth write FBordeWidth;
     //* Cell padding of the cells on the table.
     property CellPadding: integer read FCellPadding write FCellPadding;
     //* Cell spacing of the cells on the table.
     property CellSpacing: integer read FCellSpacing write FCellSpacing;
     end;

//* Exports a workbook to a HTML file. On the destionation file one table is created
//* for each worksheet on the source TXLSReadWriteII object.
type TXLSExportHTML2 = class(TXLSExport2)
private
protected
    FStream: TStream;
    FWriteOnlyTables: boolean;
    FTABLE: TTABLEProperties;

    procedure WString(S: string);
    procedure WStringCR(S: string);

    procedure OpenFile;        override;
    procedure WriteFilePrefix; override;
    procedure WritePagePrefix; override;
    procedure WriteRowPrefix;  override;
    procedure WriteCell(SheetIndex,Col,Row: integer); override;
    procedure WriteRowSuffix;  override;
    procedure WritePageSuffix; override;
    procedure WriteFileSuffix; override;
    procedure CloseFile;       override;
public
    //* ~exclude
    constructor Create(AOwner: TComponent); override;
    //* ~exclude
    destructor Destroy; override;
    //* Writes the data to a stream.
    //* ~param Stream The destination stream.
    procedure SaveToStream(Stream: TStream); override;
published
    //* When True, only tables are written and the HTML page prefix and suffix are excluded.
    property WriteOnlyTables: boolean read FWriteOnlyTables write FWriteOnlyTables;
    //* Settings for the tables created on the destionation file.
    property TABLE: TTABLEProperties read FTABLE write FTABLE;
    end;

implementation

{ TXLSExport }

procedure TXLSExportHTML2.CloseFile;
begin
  inherited;
  FStream.Free;
  FStream := Nil;
end;

constructor TXLSExportHTML2.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTABLE := TTABLEProperties.Create;
end;

destructor TXLSExportHTML2.Destroy;
begin
  FTABLE.Free;
  inherited;
end;

procedure TXLSExportHTML2.OpenFile;
begin
  FStream := TFileStream.Create(FFilename,fmCreate);
  inherited;
end;

procedure TXLSExportHTML2.SaveToStream(Stream: TStream);
begin
  FStream := Stream;
  inherited;
end;

procedure TXLSExportHTML2.WriteCell(SheetIndex, Col, Row: integer);
var
  i: integer;
  S,Link,sAlign,sColor: string;
  C: TCell;
  Cl: longword;
begin
  inherited;
  C := FXLS.Sheets[SheetIndex].Cell[Col,Row];
  if C = Nil then
    WStringCR('<TD>' + '&nbsp;' + '</TD>')
  else begin
    if not (C.CellType in [ctString,ctBoolean,ctError,ctStringFormula]) then
      sAlign := ' ALIGN="right"'
    else
      sAlign := '';
    if C.FillPatternForeColor <> xcAutomatic then begin
      Cl := ExcelColorPalette[Integer(C.FillPatternForeColor)];
      sColor := Format(' BGCOLOR="#%.2X%.2X%.2X"',[Cl and $0000FF,(Cl and $00FF00) shr 8,(Cl and $FF0000) shr 16])
    end
    else
      sColor := '';
    S := FXLS.Sheets[SheetIndex].AsHTML[Col,Row];
//    Link := FXLS.Sheets[SheetIndex].RawHyperlink(Col,Row);
    if Link <> '' then begin
      i := CPos(#9,Link);
      if i > 0 then
        Link := Copy(Link,i + 1,MAXINT);
      S := '<A href="' + Link + '">' + S + '</A>';
    end;
    if S = '' then
      S := '&nbsp;';
    WStringCR('<TD' + sAlign + sColor + '>' + S + '</TD>');
  end;
end;

procedure TXLSExportHTML2.WriteFilePrefix;
begin
  inherited;
  if not FWriteOnlyTables then begin
    WStringCR('<HTML><HEAD>');
    WStringCR('<meta http-equiv="Content-Type" content="text/html; charset=iso8859-1">');
    WStringCR('<TITLE>' + FXLS.Filename + '</TITLE>');
    WStringCR('</HEAD>');
    WStringCR('<BODY bgcolor="#FFFFFF">');
  end;
end;

procedure TXLSExportHTML2.WriteFileSuffix;
begin
  inherited;
  if not FWriteOnlyTables then begin
    WStringCR('</BODY>');
    WStringCR('</HTML>');
  end;
end;

procedure TXLSExportHTML2.WritePagePrefix;
begin
  inherited;
  WStringCR(Format('<TABLE COLS="%d" BORDER="%d" CELLPADDING="%d" CELLSPACING="%d">',
     [FXLS.Sheets[FCurrSheetIndex].LastCol - FXLS.Sheets[FCurrSheetIndex].FirstCol + 1,FTABLE.BordeWidth,FTABLE.CellPadding,FTABLE.CellSpacing]));
end;

procedure TXLSExportHTML2.WritePageSuffix;
begin
  inherited;
  WStringCR('</TABLE>');
end;

procedure TXLSExportHTML2.WriteRowPrefix;
begin
  inherited;
  WStringCR('<TR>');
end;

procedure TXLSExportHTML2.WriteRowSuffix;
begin
  inherited;
  WStringCR('</TR>');
end;

procedure TXLSExportHTML2.WString(S: string);
begin
  FStream.Write(Pointer(S)^,Length(S));
end;

procedure TXLSExportHTML2.WStringCR(S: string);
begin
  WString(S + #13#10);
end;

end.
