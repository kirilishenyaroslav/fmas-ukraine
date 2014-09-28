unit ImportHTMLTable2;

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

uses Windows, Messages, SysUtils, Classes, XLSReadWriteII2, HTMLParse2,
     HTMLTypes2, BIFFRecsII2, XLSFonts2;

//* This routine will import a table <TABLE> tag from a html file into a worksheet. Any existing cells on the worksheet will be overwritten.
//* ~param XLS The target XLSReadWriteII object.
//* ~param SheetIndex The index to the worksheet where the file will be imported to.
//* ~param Col Left column where the imported data will be written.
//* ~param Row Top row where the imported data will be written.
//* ~param Filename The name of the text file that shall be imported.
//* ~param TableIndex The zero based index of which table (if there is more than one) that shall be imported. If TableIndex is set to -1, all tables will be imported.
//* ~result True if any cells where imported.
function ImportHTMLTable(XLS: TXLSReadWriteII2; SheetIndex,Col,Row: integer; Filename: WideString; TableIndex: integer; SpecialDecode: boolean = False; DecSep: char = #0): boolean;

implementation

type TXLSImportHTMLTable2 = class(TObject)
private
    FXLS: TXLSReadWriteII2;
    FFilename: string;
    FConvertNumValues: boolean;
    FSkipBlankStrings: boolean;
    FCurrTable,FCurrRow,FCurrCol: integer;
    FTableIndex: integer;
    FSheetIndex,FInsCol,FInsRow: integer;
    FSpecialDecodeText: boolean;
    FDecSep: char;
protected
    procedure ScanForTables (E: THTMLElementArray);
    procedure DoTable       (E: THTMLElementArray; var i: integer);
    procedure DoRow         (E: THTMLElementArray; var i: integer);
    procedure DoCell        (E: THTMLElementArray; var i: integer);

    property CurrRow: integer read FCurrRow;
public
    constructor Create;
    procedure Read;

    property SpecialDecodeText: boolean read FSpecialDecodeText write FSpecialDecodeText;
published
    property XLS: TXLSReadWriteII2 read FXLS write FXLS;
    property Filename: string read FFilename write FFilename;
    property ConvertNumValues: boolean read FConvertNumValues write FConvertNumValues;
    property InsertCol: integer read FInsCol write FInsCol;
    property InsertRow: integer read FInsRow write FInsRow;
    property SheetIndex: integer read FSheetIndex write FSheetIndex;
    property TableIndex: integer read FTableIndex write FTableIndex;
  end;

function ImportHTMLTable(XLS: TXLSReadWriteII2; SheetIndex,Col,Row: integer; Filename: WideString; TableIndex: integer; SpecialDecode: boolean = False; DecSep: char = #0): boolean;
var
  HTML: TXLSImportHTMLTable2;
begin
  HTML := TXLSImportHTMLTable2.Create;
  try
    HTML.XLS := XLS;
    HTML.SheetIndex := SheetIndex;
    HTML.InsertCol := Col;
    HTML.InsertRow := Row;
    HTML.Filename := Filename;
    HTML.TableIndex := TableIndex;
    HTML.SpecialDecodeText := SpecialDecode;
    HTML.FDecSep := DecSep;
    HTML.Read;
  finally
    HTML.Free;
  end;
  Result := HTML.CurrRow >= 0;
end;

  { TXLSImportHTMLTable }

procedure TXLSImportHTMLTable2.Read;
var
  Parser: THTMLParser;
  Elements: THTMLElementArray;
begin
  if FFilename = '' then
    raise Exception.Create('Filename is missing');
  if FXLS = Nil then
    raise Exception.Create('TXLSReadWriteII is missing');
  FCurrTable := -1;
  FCurrRow := -1;
  Parser := THTMLParser.Create(Elements);
  Parser.SpecialDecodeText := FSpecialDecodeText;
  try
    Parser.LoadFromFile(FFilename);
    ScanForTables(Elements);
  finally
    Parser.Free;
  end;
end;

procedure TXLSImportHTMLTable2.DoCell(E: THTMLElementArray; var i: integer);
var
  j: integer;
  HRef: string;

procedure AddCell(S: string);
var
  TempDS: char;
begin
  if FSkipBlankStrings and (Trim(S) = '') then
    Exit;
  TempDS := DecimalSeparator;
  if FDecSep <> #0 then
    DecimalSeparator := FDecSep;
  try
    if not FConvertNumValues then
      FXLS.Sheets[FSheetIndex].AsString[FCurrCol,FCurrRow] := S
    else begin
      try
        FXLS.Sheets[FSheetIndex].AsFloat[FCurrCol,FCurrRow] := StrToFloat(S);
      except
        FXLS.Sheets[FSheetIndex].AsString[FCurrCol,FCurrRow] := S;
      end;
    end;
    if (S <> '') and (HRef <> '') then begin
      with FXLS.Sheets[FSheetIndex].Hyperlinks.Add do begin
        Col1 := FCurrCol;
        Row1 := FCurrRow;
        Col2 := FCurrCol;
        Row2 := FCurrRow;
        Address := HRef;
        FXLS.Sheets[FSheetIndex].Cell[FCurrCol,FCurrRow].FontColor := xcBlue;
        FXLS.Sheets[FSheetIndex].Cell[FCurrCol,FCurrRow].FontUnderline := xulSingle;
      end;
    end;
  finally
    DecimalSeparator := TempDS;
  end;
end;

function GetHRef(E: THTMLElementArray): string;
var
  j: integer;
begin
  Result := '';
  for j := 0 to High(E[i].Attributes) do begin
    if E[i].Attributes[j].ID = eaHRef then begin
      if E[i].Attributes[j].AttType = atString then begin
        Result := E[i].Attributes[j].StrVal;
        Break;
      end;
    end;
  end;
end;

begin
  HRef := '';
  Inc(FCurrCol);
  while i <= High(E) do begin
    case E[i].ID of
      heEndTABLE,heEndTR,heEndTD:
        Break;
      heA:
        HRef := GetHRef(E);
      else begin
        for j := 0 to High(E[i].Attributes) do begin
          if E[i].Attributes[j].ID = eaText then begin
            if E[i].Attributes[j].AttType = atString then
              AddCell(Trim(E[i].Attributes[j].StrVal));
          end;
        end;
      end;
    end;
    Inc(i);
  end;
end;

procedure TXLSImportHTMLTable2.DoRow(E: THTMLElementArray; var i: integer);
begin
  Inc(FCurrRow);
  FCurrCol := -1;
  Inc(i);
  while i <= High(E) do begin
    case E[i].ID of
      heEndTABLE,heEndTR:
        Break;
      heTABLE:
        DoTable(E,i);
      heTR:
        DoRow(E,i);
      heTD:
        DoCell(E,i);
    end;
    Inc(i);
  end;
end;

procedure TXLSImportHTMLTable2.DoTable(E: THTMLElementArray; var i: integer);
var
  Ok: boolean;
begin
  Inc(FCurrTable);
  Ok := (FCurrTable = FTableIndex) or (FTableIndex = -1);
  Inc(FCurrRow);
  Inc(i);
  while i <= High(E) do begin
    case E[i].ID of
      heEndTABLE:
        Break;
      heTABLE:
        if Ok then DoTable(E,i);
      heTR:
        if Ok then DoRow(E,i);
    end;
    Inc(i);
  end;
end;

procedure TXLSImportHTMLTable2.ScanForTables(E: THTMLElementArray);
var
  i: integer;
begin
  i := 0;
  while i <= High(E) do begin
    if E[i].ID = heTABLE then
      DoTable(E,i);
    Inc(i);
  end;
end;

constructor TXLSImportHTMLTable2.Create;
begin
  FConvertNumValues := True;
  FSkipBlankStrings := True;
end;

end.
