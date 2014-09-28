unit Columns2;

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

uses Classes, SysUtils, Contnrs, BIFFRECSII2,
     CellFormats2, FormattedObj2, XLSStream2, Graphics, Windows, Math;

//* Default width of a column in units of 1/256s of a character width.
const DEFAULT_COLWIDTH = 2500;

type
//* TXLSColumn represents a column on a worksheet.
//* In order to format all cells in a column, format the column and not the
//* individual cells, as this will save space and execute faster.
    TXLSColumn = class(TFormattedObjectNotify)
private
     FIndex: byte;
     FWidth: integer;
     FHidden: boolean;
     FOutlineLevel: byte;
     FCollapsedOutline: boolean;
     FUnknownOptionsFlag: boolean;

     procedure SetWidth(Value: integer);
     procedure SetOutlineLevel(Value: byte);
     function  GetCharWidth: double;
     procedure SetCharWidth(const Value: double);
     function  GetPixelWidth: integer;
     procedure SetPixelWidth(const Value: integer);
protected
     function  GetIndex: integer; override;
     function  IsDefault: boolean;
     function  Equal(XCol: TXLSColumn): boolean;
public
     //* ~exclude
     constructor Create(Index: byte; Formats: TCellFormats; FormatIndex: word; ChangeEvent: TFormatEvent);
     //* Assign another column to this column.
     //* ~param Source The source column.
     procedure Assign(Source: TXLSColumn);

     //* Set to true if group/outline is collapsed.
     property CollapsedOutline: boolean read FCollapsedOutline write FCollapsedOutline;
     //* Set to true if the column is hidden
     property Hidden: boolean read FHidden write FHidden;
     //* Sets or returns the group/outline level. The value can be in the range
     //* 0-16, where zero is no outline.
     property OutlineLevel: byte read FOutlineLevel write SetOutlineLevel;
     //* The width of the column in units of 1/256s of a character width.
     property Width: integer read FWidth write SetWidth;
     //* The width of the column in characters.
     property CharWidth: double read GetCharWidth write SetCharWidth;
     //* The width of the column in pixels.
     property PixelWidth: integer read GetPixelWidth write SetPixelWidth;
     end;

type
//* Holds a list of all columns. There can be max 256 columns on a worksheet.
//* Only columns that are changed can be read trough the Items property, i.e
//* default columns are not stored.
//* In order to make sure tha there is a column object at a position, use ~[link AddIfNone]
//* ~[br]
//* ~[br]
//* ~[b Example:]
//* ~[br]
//* ~[sample
//* // Make sure that there are colum objects at the desired positions
//* XLS.Sheet[0~[].Columns.AddIfNone(6,4);
//* // Set the width of a column in characters
//* XLS.Sheet[0~[].Columns[6~[].CharWidth := 12;
//* // Set the width of a column in pixels
//* XLS.Sheet[0~[].Columns[7~[].PixelWidth := 30;
//* // Format cell color of all cells in the column
//* XLS.Sheet[0~[].Columns[8~[].FillPatternForeColor := xcRed;
//* // Format font style of all cells in the column
//* XLS.Sheet[0~[].Columns[9~[].FontStyle := [xfsBold~[];
//* ]
    TXLSColumns = class(TObject)
private
     FCols: array[0..MAXCOL] of TXLSColumn;
     FFormats: TCellFormats;
     FFormatChangeEvent: TFormatEvent;

     function  GetXLSColumn(Col: integer): TXLSColumn;
     function  GetFormatted(Col: integer): TXLSColumn;
protected
     function  ValidColumns(Col1,Col2: integer): boolean;
public
     //* ~exclude
     constructor Create(Formats: TCellFormats);
     //* ~exclude
     destructor Destroy; override;
     //* ~exclude
     procedure SetRecCOLINFO(Rec: PRecCOLINFO);
     //* Clears all columns.
     procedure Clear;
     //* Adds columns if there are no columns at the position(s).
     //* ~param Col First column.
     //* ~param Count Number of columns to add.
     procedure AddIfNone(Col,Count: integer);
     //* Returns the witdth for column Col. If there is no column at Col, the
     //* default column width is returned.
     //* ~param Col Column
     //* ~result The column width.
     function  GetColWidth(Col: integer): integer;
     //* ~exclude
     function  GetColWidthPixels(Canvas: TCanvas; Col: integer): integer;
     //* Sets the width (in units of 1/256s of a character) for colmns Col1 to
     //* Col2.
     //* ~param Col1 Left column.
     //* ~param Col2 Right column.
     //* ~param Value The column width in units of 1/256s of a character.
     procedure SetColWidth(Col1,Col2: integer; Value: integer);
     //* Sets the width in characters for colmns Col1 to Col2.
     //* ~param Col1 Left column.
     //* ~param Col2 Right column.
     //* ~param Value The column width in units of characters.
     procedure SetColWidthChar(Col1,Col2: integer; Value: double);
     //* Delets all columns between Col1 and Col2. Columns to the right of
     //* Col2 will be shifted left.
     //* ~param Col1 Left column.
     //* ~param Col2 Right column.
     procedure DeleteColumns(Col1,Col2: integer);
     //* Delets all columns between Col1 and Col2.
     //* ~param Col1 Left column.
     //* ~param Col2 Right column.
     procedure ClearColumns(Col1,Col2: integer);
     //* Copies columns between Col1 to Col2 to DestCol. Only the column width
     //* and other column data is copied. Cells will remain unchanged. In order
     //* to copy cell values as well, see ~[link XLSReadWriteII2.TXLSReadWriteII2.CopyColumns TXLSReadWriteII2.CopyColumns].
     //* ~param Col1 Left column of source area.
     //* ~param Col2 Right column of source area.
     //* ~param DestCol Destination column for the copied columns.
     procedure CopyColumns(Col1,Col2,DestCol: integer);
     //* Moves columns between Col1 to Col2 to DestCol. Only the column width
     //* and other column data is moved. Cells will remain unchanged. In order
     //* to move cell values as well, see @link(TXLSReadWriteII2.MoveColumns).
     //* ~param Col1 Left column of source area.
     //* ~param Col2 Right column of source area.
     //* ~param DestCol Destination column for the moved columns.
     procedure MoveColumns(Col1,Col2,DestCol: integer);
     //* Inserts ColCount columns at Col. Existing columns will be shifted
     //* left.
     //* ~param Col First column.
     //* ~param ColCount Number of columns to add.
     procedure InsertColumns(Col,ColCount: integer);
     //* ~exclude
     procedure SaveToStream(Stream: TXLSStream; PBuf: PByteArray);
     //* ~exclude
     procedure CopyList(List: TList; Col1,Col2: integer);
     //* ~exclude
     procedure InsertList(List: TList; DeltaCol,DestCol,ColCount: integer);
     //* ~exclude
     procedure Group(Col: integer);
     //* ~exclude
     procedure GroupAll(Level: integer);
     //* The columns in the list.
     //* Col is the column number. If there is no TXLSColumn at Col, Nil will
     //* be returned.
     property Items[Col: integer]: TXLSColumn read GetXLSColumn; default;
     //* ~exclude
     property Formatted[Col: integer]: TXLSColumn read GetFormatted;
     //* ~exclude
     property  OnFormatChange: TFormatEvent read FFormatChangeEvent write FFormatChangeEvent;
     end;

implementation

{ TXLSColumn }

procedure TXLSColumn.Assign(Source: TXLSColumn);
begin
  AssignFormat(Source.FFormat);
  FWidth := Source.FWidth;
  FHidden := Source.FHidden;
  FOutlineLevel := Source.FOutlineLevel;
  FCollapsedOutline := Source.FCollapsedOutline;
  FUnknownOptionsFlag := Source.FUnknownOptionsFlag;
end;

constructor TXLSColumn.Create(Index: byte; Formats: TCellFormats; FormatIndex: word; ChangeEvent: TFormatEvent);
begin
  inherited Create(Formats,FormatIndex);
  FIndex := Index;
  FWidth := DEFAULT_COLWIDTH;
  FChangeEvent := ChangeEvent;
end;

function TXLSColumn.Equal(XCol: TXLSColumn): boolean;
begin
  Result := (XCol.FWidth = FWidth) and
            (XCol.FHidden = FHidden) and
            (XCol.FOutlineLevel = FOutlineLevel) and
            (XCol.FCollapsedOutline = FCollapsedOutline) and
            (XCol.FormatIndex = FormatIndex);
end;

function TXLSColumn.GetCharWidth: double;
begin
  Result := FWidth / 256;
end;

function TXLSColumn.GetIndex: integer;
begin
  Result := FIndex;
end;

function TXLSColumn.GetPixelWidth: integer;
var
  Canvas: TCanvas;
  F: TFont;
begin
  Canvas := TCanvas.Create;
  Canvas.Handle := GetDC(0);
  try
    F := TFont.Create;
    try
      FFormats.Fonts[0].CopyToTFont(F);
      Canvas.Font.Assign(F);
      Result := Round((FWidth / 256) * Canvas.TextWidth('8'));
    finally
      F.Free;
    end;
  finally
    Canvas.Free;
  end;
end;

function TXLSColumn.IsDefault: boolean;
begin
  Result := (FWidth = DEFAULT_COLWIDTH) and
            not FHidden and
            (FOutlineLevel = 0) and
            not FCollapsedOutline and
            not IsFormatted;
end;

procedure TXLSColumn.SetCharWidth(const Value: double);
begin
  SetWidth(Round(Value * 256));
end;

procedure TXLSColumn.SetOutlineLevel(Value: byte);
begin
  if Value > $10 then
    raise Exception.Create('Invalid value');
  FOutlineLevel := Value;
end;

procedure TXLSColumn.SetPixelWidth(const Value: integer);
var
  Canvas: TCanvas;
  F: TFont;
begin
  Canvas := TCanvas.Create;
  Canvas.Handle := GetDC(0);
  try
    F := TFont.Create;
    try
      FFormats.Fonts[0].CopyToTFont(F);
      Canvas.Font.Assign(F);
      FWidth := (Value * 256) div Canvas.TextWidth('8');
    finally
      F.Free;
    end;
  finally
    Canvas.Free;
  end;
end;

procedure TXLSColumn.SetWidth(Value: integer);
begin
  if (Value < 0) or (Value > $FFFF) then
    raise Exception.Create('Invalid value');
  FWidth := Value;
end;

{ TXLSColumns }

procedure TXLSColumns.SetRecCOLINFO(Rec: PRecCOLINFO);
var
  i,C1,C2: integer;
  XCol: TXLSColumn;
begin
  // There exists records with at least Col2 = 256. This is illegal as max
  // col # is 255. This is also what the docs says.
  C1 := Min(Rec.Col1,MAXCOL);
  C2 := Min(Rec.Col2,MAXCOL);
  for i := C1 to C2 do begin
    XCol := TXLSColumn.Create(i,FFormats,Rec.FormatIndex,FFormatChangeEvent);
    XCol.FWidth := Rec.Width;
    XCol.Hidden := (Rec.Options and $0001) = $0001;
    XCol.FUnknownOptionsFlag := (Rec.Options and $0002) = $0002;
    XCol.FOutlineLevel := (Rec.Options shr 8) and $0007;
    XCol.FCollapsedOutline := (Rec.Options and $1000) = $1000;
    if FCols[i] <> Nil then
      FCols[i].Free;
    FCols[i] := XCol;
  end;
end;

function TXLSColumns.GetColWidth(Col: integer): integer;
begin
  if FCols[Col] <> Nil then
    Result := FCols[Col].Width
  else
    Result := DEFAULT_COLWIDTH;
end;

procedure TXLSColumns.CopyColumns(Col1, Col2, DestCol: integer);
var
  i: integer;
  XCol: TXLSColumn;
begin
  if not ValidColumns(Col1,Col2) then
    raise Exception.Create('Invalid source columns');
  if not ValidColumns(DestCol,DestCol + (Col2 - Col1)) then
    raise Exception.Create('Invalid destination columns');
  ClearColumns(DestCol,DestCol + (Col2 - Col1));
  for i := Col1 to Col2 do begin
    if FCols[i] <> Nil then begin
      XCol := TXLSColumn.Create(i,FFormats,DEFAULT_FORMAT,FFormatChangeEvent);
      XCol.Assign(FCols[i]);
      FCols[DestCol + (i - Col1)] := XCol;
    end;
  end;
end;

constructor TXLSColumns.Create(Formats: TCellFormats);
begin
  FFormats := Formats;
end;

destructor TXLSColumns.Destroy;
begin
  ClearColumns(0,MAXCOL);
  inherited;
end;

procedure TXLSColumns.Clear;
begin
  ClearColumns(0,MAXCOL);
end;

procedure TXLSColumns.DeleteColumns(Col1, Col2: integer);
var
  i,Cnt: integer;
begin
  if not ValidColumns(Col1,Col2) then
    raise Exception.Create('Invalid columns');
  Cnt := Col2 - Col1 + 1;
  ClearColumns(Col1,Col2);
  for i := Col1 to (MAXCOL - Cnt) do begin
    FCols[i] := FCols[i + Cnt];
    if FCols[i] <> Nil then
      FCols[i].FIndex := i;
  end;
  for i := MAXCOL - Cnt + 1 to MAXCOL do
    FCols[i] := Nil;
end;

procedure TXLSColumns.ClearColumns(Col1, Col2: integer);
var
  i: integer;
begin
  if not ValidColumns(Col1,Col2) then
    raise Exception.Create('Invalid columns');
  for i := Col1 to Col2 do begin
    if FCols[i] <> Nil then begin
      FCols[i].Free;
      FCols[i] := Nil;
    end;
  end;
end;

function TXLSColumns.GeTXLSColumn(Col: integer): TXLSColumn;
begin
  Result := FCols[Col];
{
  if Result = Nil then
    raise Exception.Create('No Column object defined');
}    
end;

procedure TXLSColumns.InsertColumns(Col, ColCount: integer);
var
  i: integer;
  XCol: TXLSColumn;
begin
  if (Col < 0) or (Col > MAXCOL) or (ColCount < 1) or ((ColCount + Col) > MAXCOL) then
    raise Exception.Create('Invalid column');

  if (Col > 0) and (FCols[Col - 1] <> Nil) then
    XCol := FCols[Col - 1]
  else
    XCol := Nil;
  ClearColumns(MAXCOL - ColCount,MAXCOL);
  for i := (MAXCOL - ColCount) downto Col do begin
    FCols[i + ColCount] := FCols[i];
    if FCols[i + ColCount] <> Nil then
      FCols[i + ColCount].FIndex := i;
  end;

  for i := Col to Col + ColCount do begin
    if XCol <> Nil then begin
      FCols[i] := TXLSColumn.Create(i,FFormats,DEFAULT_FORMAT,FFormatChangeEvent);
      FCols[i].Assign(XCol);
    end
    else
      FCols[i] := Nil;
  end;
end;

procedure TXLSColumns.MoveColumns(Col1, Col2, DestCol: integer);
begin
  CopyColumns(Col1,Col2,DestCol);
  ClearColumns(Col1,Col2);
end;

function TXLSColumns.ValidColumns(Col1, Col2: integer): boolean;
begin
  Result := (Col1 >= 0) and (Col2 >= 0) and (Col1 <= MAXCOL) and (Col2 <= MAXCOL) and (Col2 >= Col1);
end;

procedure TXLSColumns.SetColWidth(Col1,Col2: integer; Value: integer);
var
  i: integer;
begin
  if Col1 > Col2 then
    raise Exception.Create('Invalid columns');

  for i := Col1 to Col2 do begin
    if (FCols[i] <> Nil) and (FCols[i].FWidth = Value) then
      Continue;
    if FCols[i] <> Nil then begin
      FCols[i].FWidth := Value;
      if FCols[i].IsDefault then begin
        FCols[i].Free;
        FCols[i] := Nil;
      end;
    end
    else if Value <> DEFAULT_COLWIDTH then begin
      FCols[i] := TXLSColumn.Create(i,FFormats,DEFAULT_FORMAT,FFormatChangeEvent);
      FCols[i].FWidth := Value;
    end;
  end;
end;

procedure TXLSColumns.SetColWidthChar(Col1, Col2: integer; Value: double);
begin
  SetColWidth(Col1,Col2,Round(Value * 256));
end;

procedure TXLSColumns.SaveToStream(Stream: TXLSStream; PBuf: PByteArray);
var
  i,j: integer;
begin
  i := 0;
  while i <= MAXCOL do begin
    if FCols[i] <> Nil then begin
      j := i;
      while (j <= MAXCOL) and (FCols[j] <> Nil) and FCols[j].Equal(FCols[i]) do
        Inc(j);
      PRecCOLINFO(PBuf).Col1 := i;
      PRecCOLINFO(PBuf).Col2 := j - 1;
      PRecCOLINFO(PBuf).Width := FCols[i].Width;
      PRecCOLINFO(PBuf).FormatIndex := FCols[i].FormatIndex;
      PRecCOLINFO(PBuf).Reserved := $0000;
      if PRecCOLINFO(PBuf).Width <> DEFAULT_COLWIDTH then
        PRecCOLINFO(PBuf).Options := $0002
      else
        PRecCOLINFO(PBuf).Options := $0000;
      if FCols[i].Hidden then
        PRecCOLINFO(PBuf).Options := PRecCOLINFO(PBuf).Options or $0001;
      if FCols[i].FUnknownOptionsFlag then
        PRecCOLINFO(PBuf).Options := PRecCOLINFO(PBuf).Options or $0002;
      PRecCOLINFO(PBuf).Options := PRecCOLINFO(PBuf).Options or (FCols[i].OutlineLevel shl 8);
      if FCols[i].CollapsedOutline then
        PRecCOLINFO(PBuf).Options := PRecCOLINFO(PBuf).Options or $1000;
      Stream.WriteHeader(BIFFRECID_COLINFO,SizeOf(TRecCOLINFO));
      Stream.Write(PBuf^,SizeOf(TRecCOLINFO));
      i := j;
    end
    else
      Inc(i);
  end;
end;

function TXLSColumns.GetColWidthPixels(Canvas: TCanvas; Col: integer): integer;
begin
  if FCols[Col] = Nil then
    Result := Round((DEFAULT_COLWIDTH / 256) * Canvas.TextWidth('8'))
  else
    Result := Round((Items[Col].FWidth / 256) * Canvas.TextWidth('8'));
end;

procedure TXLSColumns.CopyList(List: TList; Col1, Col2: integer);
var
  i: integer;
begin
  if not ValidColumns(Col1,Col2) then
    raise Exception.Create('Invalid columns');
  for i := Col1 to Col2 do begin
    if FCols[i] <> Nil then
      List.Add(FCols[i]);
  end;
end;

procedure TXLSColumns.InsertList(List: TList; DeltaCol,DestCol,ColCount: integer);
var
  i: integer;
  XCol: TXLSColumn;
begin
  MoveColumns(DestCol,DestCol + ColCount,DestCol + ColCount + 1);
  for i := 0 to List.Count - 1 do begin
    if ((TXLSColumn(List[i]).FIndex + DeltaCol) >= 0) and ((TXLSColumn(List[i]).FIndex + DeltaCol) <= MAXCOL) then begin
      XCol := TXLSColumn.Create(TXLSColumn(List[i]).FIndex,FFormats,DEFAULT_FORMAT,FFormatChangeEvent);
      XCol.Assign(TXLSColumn(List[i]));
      if FCols[XCol.FIndex] <> Nil then
        FCols[XCol.FIndex].Free;
      FCols[XCol.FIndex] := XCol;
    end;
  end;
end;

procedure TXLSColumns.AddIfNone(Col, Count: integer);
var
  i: integer;
begin
  for i := Col to Col + Count - 1 do begin
    if FCols[i] = Nil then begin
      FCols[i] := TXLSColumn.Create(i,FFormats,DEFAULT_FORMAT,FFormatChangeEvent);
    end;
  end;
end;

procedure TXLSColumns.Group(Col: integer);
var
  XCol: TXLSColumn;
  UnGroup: boolean;
  Level: integer;

procedure SkipCollapsed(var Col: integer);
var
  XCol: TXLSColumn;
  Level: integer;
begin
  Dec(Col);
  XCol := FCols[Col];
  if XCol <> Nil then
    Level := XCol.FOutlineLevel
  else
    Level := -1;
  while (Col >= 0) and (XCol <> Nil) and (XCol.FOutlineLevel >= Level) do begin
    if XCol.FCollapsedOutline then
      SkipCollapsed(Col);
    Dec(Col);
    XCol := FCols[Col];
  end;
  if Col > 0 then
    Inc(Col);
end;

begin
  if (Col < 0) or (Col > MAXCOL) then
    Exit;
  XCol := FCols[Col - 1];
  if (XCol = Nil) or (XCol.FOutlineLevel <= 0) then
    Exit;
  Level := XCol.FOutlineLevel;
  XCol := FCols[Col];
  if XCol <> Nil then begin
    UnGroup := XCol.FCollapsedOutline;
    XCol.FCollapsedOutline := not XCol.FCollapsedOutline;
  end
  else begin
    UnGroup := False;
    AddIfNone(Col,1);
    FCols[Col].FCollapsedOutline := True;
  end;
  Dec(Col);
  while Col >= 0 do begin
    XCol := FCols[Col];
    if (XCol = Nil) or (XCol.FOutlineLevel < Level) then
      Break
    else if XCol.FOutlineLevel >= Level then begin
      XCol.FHidden := not UnGroup;
      if XCol.FCollapsedOutline then
        SkipCollapsed(Col)
    end;
    Dec(Col);
  end;
end;

procedure TXLSColumns.GroupAll(Level: integer);
var
  i: integer;
  XCol: TXLSColumn;

procedure CheckButton(Index: integer; Value: boolean);
var
  XC: TXLSColumn;
begin
  XC := FCols[Index];
  if (XC <> Nil) and (XC.OutlineLevel >= XCol.OutlineLevel) then
    Exit;
  AddIfNone(Index,1);
  XC := FCols[Index];
  if (XC <> Nil) and (XC.OutlineLevel < XCol.OutlineLevel) then
    XC.FCollapsedOutline := Value;
end;

begin
  for i := MAXCOL downto 0 do begin
    XCol := FCols[i];
    if (XCol <> Nil) and (XCol.OutlineLevel > 0) then begin
      if XCol.OutlineLevel >= Level then
        XCol.FHidden := True
      else
        XCol.FHidden := False;
      CheckButton(i + 1,XCol.FHidden);
    end;
  end;
end;

function TXLSColumns.GetFormatted(Col: integer): TXLSColumn;
begin
  Result := GetXLSColumn(Col);
  if (Result <> Nil) and not Result.IsFormatted then
    Result := Nil;
end;

end.
