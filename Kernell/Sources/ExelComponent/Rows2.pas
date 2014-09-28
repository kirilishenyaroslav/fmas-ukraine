unit Rows2;

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

uses Classes, SysUtils, Contnrs, XLSUtils2, BIFFRecsII2, CellFormats2,
     FormattedObj2, Graphics;

//* Default height of a row in units of 1/20th of a character point, 12.75pt.
const DEFAULT_ROWHEIGHT = 255;

type
//* TXLSRow represents a row on a worksheet.
//* In order to format all cells in a row, format the row and not the
//* individual cells, as this will save space and execute faster.
    TXLSRow = class(TFormattedObjectNotify)
private
     FRow: word;
     FCol1,FCol2: word;
     FHeight: word;
     FOptions: word;

     function  GetHidden: boolean;
     procedure SetHidden(const Value: boolean);
     procedure SetHeight(const Value: word);
     function  GetCollapsedOutline: boolean;
     procedure SetCollapsedOutline(const Value: boolean);
     function  GetOutlineLevel: byte;
     function  GetPixelHeight: integer;
     procedure SetPixelHeight(const Value: integer);
protected
     function  GetIndex: integer; override;
     function  IsDefault: boolean;
     procedure FormatChange; override;
public
     //* ~exclude
     constructor Create(Formats: TCellFormats; FormatIndex: word; ChangeEvent: TFormatEvent);
     //* Assign another row to this row.
     //* ~param Source The source TXLSRow object.
     procedure Assign(Source: TXLSRow);

     //* The heigh of the row in units of 1/20 of a character point.
     property Height: word read FHeight write SetHeight;
     //* The heigh of the row in pixels.
     property PixelHeight: integer read GetPixelHeight write SetPixelHeight;
     //* Set to True if the row is hidden
     property Hidden: boolean read GetHidden write SetHidden;
     //* Set to True if the row is collapsed in outlining
     property CollapsedOutline: boolean read GetCollapsedOutline write SetCollapsedOutline;
     //* Sets or returns the group/outline level. The value can be in the range
     //* 0-16, where zero is no outline.
     property OutlineLevel: byte read GetOutlineLevel;
     //* ~exclude
     property Options: word read FOptions write FOptions;
     end;

type
//* Holds a list of all rows. There can be max 65536 rows in a worksheet.
//* Only rows that are changed can be read trough the Items property, i.e
//* default rows are not stored.
//* In order to set data for a row, and there is no TXLSRow assigned to
//* it, use the AddIfNone method to create rows.
//* In order to make sure tha there is a row object at a position, use
//* ~[link AddIfNone]
//* ~[br]
//* ~[br]
//* ~[b Example:]
//* ~[br]
//* ~[sample
//* // Make sure that there are row objects at the desired positions
//* XLS.Sheet[0~[].Rows.AddIfNone(6,4);
//* // Set the height of a row in points (14pt, 1/20th of a point).
//* XLS.Sheet[0~[].Rows[6~[].Height := 280;
//* // Set the height of a row in pixels
//* XLS.Sheet[0~[].Rows[7~[].PixelHeight := 20;
//* // Format cell color of all cells in the row
//* XLS.Sheet[0~[].Rows[8~[].FillPatternForeColor := xcRed;
//* // Format font style of all cells in the row
//* XLS.Sheet[0~[].Rows[9~[].FontStyle := [xfsBold~[];
//* ]
    TXLSRows = class(TObjectList)
private
     FFormats: TCellFormats;
     FFormatChangeEvent: TFormatEvent;

     function  GetItemByIndex(Index: integer): TXLSRow;
     procedure ValidRows(Row1,Row2: integer);
     function  FindClosestIndex(Row: integer): integer;
     function  GetFirstLastIndex(Row1,Row2: integer; var Index1,Index2: integer): boolean;
     function  FindIndex(Row: integer): integer;
     procedure SetItemByIndex(Index: integer; const Value: TXLSRow);

     property  ItemByIndex[Index: integer]: TXLSRow read GetItemByIndex write SetItemByIndex;
     function  GetItem(Row: integer): TXLSRow;
     function  GetFormatted(Row: integer): TXLSRow;
public
     //* ~exclude
     constructor Create(Formats: TCellFormats);
     //* ~exclude
     procedure SetRecROW(ARow: PRecROW; FormatIndex: word);
     //* ~exclude
     procedure GetRecROW(Index: integer; ARow: PRecROW);
     //* Adds a row if there are no row at the position.
     //* ~param Row Row to add.
     //* ~result The row object.
     function  AddIfNone(Row: integer): TXLSRow; overload;
     //* Adds rows if there are no rows at the position(s).
     //* ~param Row First row.
     //* ~param Count Number of rows to add.
     procedure AddIfNone(Row,Count: integer); overload;
     //* Delets all rows between Row1 and Row2. Rows to the bottom of
     //* Row2 will be shifted up.
     //* ~param Row1 Top row in the span.
     //* ~param Row2 Bottom row in the span.
     procedure DeleteRows(Row1,Row2: integer);
     //* Delets all rows between Row1 and Row2.
     //* ~param Row1 Top row in the span.
     //* ~param Row2 Bottom row in the span.
     procedure ClearRows(Row1,Row2: integer);
     //* Copies rows between Row1 to Row2 to DestRow. Only the row height
     //* and other row data is copied. Cells will remain unchanged. In order
     //* to copy cell values as well, see @link(TXLSReadWriteII2.CopyRows).
     //* ~param Row1 Top row in the span.
     //* ~param Row2 Bottom row in the span.
     //* ~param DestRow Destinatoin row for the copied rows.
     procedure CopyRows(Row1,Row2,DestRow: integer);
     //* Moves rows between Row1 to Row2 to DestRow. Only the row height
     //* and other row data is moved. Cells will remain unchanged. In order
     //* to move cell values as well, see @link(TXLSReadWriteII2.MoveRows).
     //* ~param Row1 Top row in the span.
     //* ~param Row2 Bottom row in the span.
     //* ~param DestRow Destinatoin row for the moved rows.
     procedure MoveRows(Row1,Row2,DestRow: integer);
     //* Inserts RowCount rows at Row. Existing rows will be shifted
     //* down. This command will not move any cells, just the row heading.
     //* ~param Row Insertion position for the rows.
     //* ~param RowCount Number of rows to insert.
     procedure InsertRows(Row,RowCount: integer);
     //* Sets the height (in units of 1/256s of a character) for rows Row1 to
     //* Row2.
     //* ~param Row1 Top row in the span.
     //* ~param Row2 Bottom row in the span.
     //* ~param Height Height of the rows in units of 1/256s of a character.
     procedure SetRowHeight(Row1,Row2,Height: integer);
     //* Returns the height for row Row. If there is no row at Row, the
     //* default row height is returned.
     //* ~param Row The row to get the height for.
     //* ~result Height of the row in units of 1/256s of a character.
     function  GetRowHeight(Row: integer): integer;
     //* Searches for row number Row in the list. If found, the TXLSRow object
     //* is returned, otherwise is Nil returned.
     //* ~param Row The row to search for.
     //* ~result The TXLSRow object. If not found, Nil is returned.
     function  Find(Row: integer): TXLSRow;
     function  Hidden(Row: integer): boolean;
     //* ~exclude
     procedure Sort;
     //* ~exclude
     procedure CopyList(List: TList; Row1,Row2: integer);
     //* ~exclude
     procedure InsertList(List: TList; DeltaRow,DestRow,RowCount: integer);
     //* ~exclude
     procedure Group(Row: integer);
     //* ~exclude
     procedure GroupAll(Level: integer);
     //* The rows in the list.
     //* Row is the row number. If there is no TXLSRow at Row, Nil will be
     //* returned.
     property  Items[Row: integer]: TXLSRow read GetItem; default;
     //* ~exclude
     property  Formatted[Row: integer]: TXLSRow read GetFormatted;
     //* ~exclude
     property  OnFormatChange: TFormatEvent read FFormatChangeEvent write FFormatChangeEvent;
     end;


implementation

{ TXLSRow }

procedure TXLSRow.Assign(Source: TXLSRow);
begin
  AssignFormat(Source.FFormat);
  FRow := Source.FRow;
  FCol1 := Source.FCol1;
  FCol2 := Source.FCol2;
  FHeight := Source.FHeight;
  FOptions := Source.FOptions;
end;

constructor TXLSRow.Create(Formats: TCellFormats; FormatIndex: word; ChangeEvent: TFormatEvent);
begin
  inherited Create(Formats,FormatIndex);
  FChangeEvent := ChangeEvent;
  if FormatIndex <> DEFAULT_FORMAT then
    FOptions := $0080;
  FHeight := DEFAULT_ROWHEIGHT;
  FCol2 := MAXCOL;
end;

procedure TXLSRow.FormatChange;
begin
{
  if FFormat.Index <> DEFAULT_FORMAT then
    FOptions := FOptions or $0080
  else
    FOptions := FOptions and not $0080;
}
end;

function TXLSRow.GetCollapsedOutline: boolean;
begin
  Result := (FOptions and $0010) = $0010;
end;

function TXLSRow.GetHidden: boolean;
begin
  Result := (FOptions and $0020) = $0020;
end;

function TXLSRow.GetIndex: integer;
begin
  Result := FRow;
end;

function TXLSRow.GetOutlineLevel: byte;
begin
  Result := FOptions and $0007;
end;

function TXLSRow.GetPixelHeight: integer;
var
  F: TFont;
begin
  F := TFont.Create;
  try
    FFormats.Fonts[0].CopyToTFont(F);
    Result := -Round((F.Height / F.Size) * (FHeight / 20));
  finally
    F.Free;
  end;
end;

function TXLSRow.IsDefault: boolean;
begin
  Result := not IsFormatted and (FHeight = DEFAULT_ROWHEIGHT) and not GetHidden;
end;

procedure TXLSRow.SetCollapsedOutline(const Value: boolean);
begin
  if Value then
    FOptions := FOptions or $0010
  else
    FOptions := FOptions and not $0010;
end;

procedure TXLSRow.SetHeight(const Value: word);
begin
  FHeight := Value;
  if Height <> DEFAULT_ROWHEIGHT then
    FOptions := FOptions or $0040
  else
    FOptions := FOptions and not $0040;
end;

procedure TXLSRow.SetHidden(const Value: boolean);
begin
  if Value then
    FOptions := FOptions or $0020
  else
    FOptions := FOptions and not $0020;
end;

procedure TXLSRow.SetPixelHeight(const Value: integer);
var
  F: TFont;
begin
  F := TFont.Create;
  try
    FFormats.Fonts[0].CopyToTFont(F);
    SetHeight(-Round((Value / (F.Height / F.Size)) * 20));
  finally
    F.Free;
  end;
end;

{ TXLSRows }

function TXLSRows.AddIfNone(Row: integer): TXLSRow;
begin
  Result := Find(Row);
  if Result = Nil then begin
    Result := TXLSRow.Create(FFormats,DEFAULT_FORMAT,FFormatChangeEvent);
    Result.FRow := Row;
    inherited Add(Result);
  end;
  Sort;
end;

procedure TXLSRows.AddIfNone(Row,Count: integer);
var
  i: integer;
begin
  for i := Row to Row + Count - 1 do
    AddIfNone(i);
end;

procedure TXLSRows.ClearRows(Row1, Row2: integer);
var
  i,Start,Stop: integer;
begin
  ValidRows(Row1,Row2);
  if not GetFirstLastIndex(Row1,Row2,Start,Stop) then
    Exit;
  i := Start;
  while i <= Stop do begin
    if (ItemByIndex[i] <> Nil) and (ItemByIndex[i].FRow >= Row1) and (ItemByIndex[i].FRow <= Row2) then begin
      Delete(i);
      Dec(Stop);
    end
    else
      Inc(i);
  end;
end;

procedure TXLSRows.CopyList(List: TList; Row1, Row2: integer);
var
  i,j: integer;
begin
  ValidRows(Row1,Row2);
  if (Row1 = 0) and (Row2 = MAXROW) then begin
    for i := 0 to Count - 1 do
      List.Add(ItemByIndex[i]);
  end
  else begin
    for i := Row1 to Row2 do begin
      j := FindIndex(i);
      if j >= 0 then
        List.Add(ItemByIndex[i]);
    end;
  end;
end;

procedure TXLSRows.CopyRows(Row1, Row2, DestRow: integer);
var
  i,Cnt,Start,Stop: integer;
  XRow: TXLSRow;
begin
  if DestRow >= MAXROW then
    Exit;
  ValidRows(Row1,Row2);
  Cnt := (Row2 - Row1 + 1);
  ClearRows(DestRow,DestRow + Cnt);
  if not GetFirstLastIndex(Row1,Row2,Start,Stop) then
    Exit;
  i := Start;
  while i <= Stop do begin
    if (ItemByIndex[i].FRow >= Row1) and (ItemByIndex[i].FRow <= Row2) then begin
      XRow := TXLSRow.Create(FFormats,DEFAULT_FORMAT,FFormatChangeEvent);
      XRow.Assign(ItemByIndex[i]);
      XRow.FRow := DestRow + (ItemByIndex[i].FRow - Row1);
      inherited Add(XRow);
    end;
    Inc(i);
  end;
  Sort;
end;

constructor TXLSRows.Create(Formats: TCellFormats);
begin
  inherited Create;
  FFormats := Formats;
end;

procedure TXLSRows.DeleteRows(Row1, Row2: integer);
var
  i,Start,Stop,Last: integer;
begin
  ValidRows(Row1,Row2);
  if not GetFirstLastIndex(Row1,Row2,Start,Stop) then
    Exit;
  Last := -1;
  i := Start;
  while i <= Stop do begin
    if (ItemByIndex[i].FRow >= Row1) and (ItemByIndex[i].FRow <= Row2) then begin
      Delete(i);
      Dec(Stop);
      Last := i;
    end
    else
      Inc(i);
  end;
  if (Last < 0) or (Last > (Count - 1)) then
    Exit;
  for i := Last to Count - 1 do
    ItemByIndex[i].FRow := ItemByIndex[i].FRow - (Row2 - Row1 + 1);
end;

function TXLSRows.Find(Row: integer): TXLSRow;
var
  i: integer;
begin
  i := FindIndex(Row);
  if i >= 0 then
    Result := ItemByIndex[i]
  else
    Result := Nil;
end;

function TXLSRows.FindClosestIndex(Row: integer): integer;
var
  First : Integer;
  Last  : Integer;
begin
  First := 0;
  Last := Count - 1;
  Result := -1;

  while First <= Last do begin
    Result := (First + Last) div 2;
    if ItemByIndex[Result].FRow = Row then
      Break;
    if ItemByIndex[Result].FRow > Row then
      Last := Result - 1
    else
      First := Result + 1;
  end;

  if (Result < 0) or (Result >= (Count - 1)) then
    Exit
  else if (Result >= Count) and (ItemByIndex[Result].FRow > Row) then
    Inc(Result)
  else if ItemByIndex[Result].FRow < Row then
    Inc(Result);
end;

function TXLSRows.FindIndex(Row: integer): integer;
var
  i,lo,hi: integer;
begin
  if (Row < 0) or (Count <= 0) or (Row > MAXROW) then begin
    Result := -1;
    Exit;
  end;
  i := 0;
  lo := 0;
  hi := Count - 1;
  while lo <= hi do begin
    i := (lo + hi) div 2;
    if Row > ItemByIndex[i].FRow then
      lo := i + 1
    else if Row < ItemByIndex[i].FRow then
      hi := i - 1
    else
      Break;
  end;
  if Row = ItemByIndex[i].FRow then
    Result := i
  else
    Result := -1;
end;

function TXLSRows.GetFirstLastIndex(Row1, Row2: integer; var Index1, Index2: integer): boolean;
begin
  Result := False;
  Index1 := FindClosestIndex(Row1);
  if Index1 < 0 then
    Exit;
  if Index1 > 0 then
    Dec(Index1);
  Index2 := FindClosestIndex(Row2);
  if Index2 < (Count - 1) then
    Inc(Index2);
  Result := True;
end;

function TXLSRows.GetFormatted(Row: integer): TXLSRow;
begin
  Result := GetItem(Row);
  if (Result <> Nil) and not Result.IsFormatted then
    Result := Nil;
end;

function TXLSRows.GetItem(Row: integer): TXLSRow;
begin
  Result := Find(Row);
{
  if Result = Nil then
    raise Exception.Create('No Row object defined');
}    
end;

function TXLSRows.GetItemByIndex(Index: integer): TXLSRow;
begin
  Result := TXLSRow(inherited Items[Index]);
end;

procedure TXLSRows.GetRecROW(Index: integer; ARow: PRecROW);
begin
  ARow.Row := ItemByIndex[Index].FRow;
  ARow.Col1 := ItemByIndex[Index].FCol1;
  ARow.Col2 := ItemByIndex[Index].FCol2;
  ARow.Height := ItemByIndex[Index].FHeight;
{
  if (ItemByIndex[Index].FOptions and $0020) <> 0 then
    ARow.Height := ItemByIndex[Index].FHeight or $8000;
}    
  if ItemByIndex[Index].FormatIndex <> DEFAULT_FORMAT then
    ARow.Options := ItemByIndex[Index].FOptions or $0080
  else
    ARow.Options := ItemByIndex[Index].FOptions and not $0080;
  ARow.Options := ARow.Options or $0100;
  ARow.FormatIndex := ItemByIndex[Index].FormatIndex;
  ARow.Reserved1 := 0;
  ARow.Reserved2 := 0;
end;

function TXLSRows.GetRowHeight(Row: integer): integer;
var
  XRow: TXLSRow;
begin
  XRow := Find(Row);
  if XRow <> Nil then
    Result := XRow.FHeight
  else
    Result := DEFAULT_ROWHEIGHT;
end;

procedure TXLSRows.Group(Row: integer);
var
  XRow: TXLSRow;
  UnGroup: boolean;
  Level: integer;

procedure SkipCollapsed(var Row: integer);
var
  XRow: TXLSRow;
  Level: integer;
begin
  Dec(Row);
  XRow := Items[Row];
  if XRow <> Nil then
    Level := XRow.OutlineLevel
  else
    Level := -1;
  while (Row >= 0) and (XRow <> Nil) and (XRow.OutlineLevel >= Level) do begin
    if XRow.CollapsedOutline then
      SkipCollapsed(Row);
    Dec(Row);
    XRow := Items[Row];
  end;
  if Row > 0 then
    Inc(Row);
end;

begin
  if (Row < 0) or (Row > MAXROW) then
    Exit;
  XRow := Items[Row - 1];
  if (XRow = Nil) or (XRow.OutlineLevel <= 0) then
    Exit;
  Level := XRow.OutlineLevel;
  XRow := Items[Row];
  if XRow <> Nil then begin
    UnGroup := XRow.CollapsedOutline;
    XRow.CollapsedOutline := not XRow.CollapsedOutline;
  end
  else begin
    UnGroup := False;
    AddIfNone(Row,1);
    Items[Row].CollapsedOutline := True;
  end;
  Dec(Row);
  while Row >= 0 do begin
    XRow := Items[Row];
    if (XRow = Nil) or (XRow.OutlineLevel < Level) then
      Break
    else if XRow.OutlineLevel >= Level then begin
      XRow.Hidden := not UnGroup;
      if XRow.CollapsedOutline then
        SkipCollapsed(Row)
    end;
    Dec(Row);
  end;
end;

procedure TXLSRows.GroupAll(Level: integer);
var
  i: integer;
  XRow: TXLSRow;

procedure CheckButton(Index: integer; Value: boolean);
var
  XR: TXLSRow;
begin
  XR := Items[Index];
  if (XR <> Nil) and (XR.OutlineLevel >= XRow.OutlineLevel) then
    Exit;
  AddIfNone(Index,1);
  XR := Items[Index];
  if (XR <> Nil) and (XR.OutlineLevel < XRow.OutlineLevel) then
    XR.CollapsedOutline := Value;
end;

begin
  for i := MAXROW downto 0 do begin
    XRow := Items[i];
    if (XRow <> Nil) and (XRow.OutlineLevel > 0) then begin
      if XRow.OutlineLevel >= Level then
        XRow.Hidden := True
      else
        XRow.Hidden := False;
      CheckButton(i + 1,XRow.Hidden);
    end;
  end;
end;

procedure TXLSRows.InsertList(List: TList; DeltaRow,DestRow, RowCount: integer);
var
  i,j: integer;
  XRow: TXLSRow;
begin
  MoveRows(DestRow,DestRow + RowCount - 1,DestRow + RowCount);
  for i := 0 to List.Count - 1 do begin
    if ((TXLSRow(List[i]).FRow + DeltaRow) >= 0) and ((TXLSRow(List[i]).FRow + DeltaRow) <= MAXROW) then begin
      XRow := TXLSRow.Create(FFormats,DEFAULT_FORMAT,FFormatChangeEvent);
      XRow.Assign(TXLSRow(List[i]));
      XRow.FRow := XRow.FRow + DeltaRow;
      j := FindIndex(XRow.FRow);
      if j >= 0 then
        Delete(j);
      Add(XRow);
    end;
  end;
end;

procedure TXLSRows.InsertRows(Row, RowCount: integer);
var
  i,Start: integer;
  XRow,SrcRow: TXLSRow;
begin
  if (Row < 0) or (Row > MAXROW) then
    raise Exception.Create('Invalid row');
  SrcRow := Find(Row - 1);

  Start := FindClosestIndex(Row);
  if Start >= 0 then begin
    for i := Start to Count - 1 do
      ItemByIndex[i].FRow := ItemByIndex[i].FRow + RowCount;
  end;

  for i := 0 to RowCount - 1 do begin
    XRow := TXLSRow.Create(FFormats,DEFAULT_FORMAT,FFormatChangeEvent);
    if (SrcRow <> Nil) and not SrcRow.IsDefault then
      XRow.Assign(SrcRow);
    XRow.FRow := Row + i;
    inherited Add(XRow);
  end;
  Sort;
end;

procedure TXLSRows.MoveRows(Row1, Row2, DestRow: integer);
begin
  CopyRows(Row1,Row2,DestRow);
  ClearRows(Row1,Row2);
end;

procedure TXLSRows.SetItemByIndex(Index: integer; const Value: TXLSRow);
begin
  inherited Items[Index] := Value;
end;

procedure TXLSRows.SetRecROW(ARow: PRecROW; FormatIndex: word);
var
  R: TXLSRow;
begin
  if (ARow.Options and $0080) = $0080 then
    R := TXLSRow.Create(FFormats,ARow.FormatIndex,FFormatChangeEvent)
  else
    R := TXLSRow.Create(FFormats,DEFAULT_FORMAT,FFormatChangeEvent);
  R.FRow := ARow.Row;
  R.FCol1 := ARow.Col1;
  R.FCol2 := ARow.Col2;
  R.FHeight := ARow.Height;
  R.FOptions := ARow.Options;
  inherited Add(R);
end;

procedure TXLSRows.SetRowHeight(Row1, Row2, Height: integer);
var
  i,j: integer;
  XRow: TXLSRow;
begin
  ValidRows(Row1,Row2);
  for i := Row1 to Row2 do begin
    j := FindIndex(i);
    if j >= 0 then begin
      ItemByIndex[j].FHeight := Height;
      if Height <> DEFAULT_ROWHEIGHT then
        ItemByIndex[j].FOptions := ItemByIndex[j].FOptions or $0040
      else
        ItemByIndex[j].FOptions := ItemByIndex[j].FOptions and not $0040;
      if ItemByIndex[j].IsDefault then
        Delete(j);
    end
    else if Height <> DEFAULT_ROWHEIGHT then begin
      XRow := TXLSRow.Create(FFormats,DEFAULT_FORMAT,FFormatChangeEvent);
      XRow.FRow := i;
      XRow.FHeight := Height;
      XRow.FOptions := XRow.FOptions or $0040;
      inherited Add(XRow);
    end;
  end;
  Sort;
end;

procedure TXLSRows.Sort;

procedure QSort(L, R: Integer);
var
  I, J, Row: Integer;
begin
  repeat
    i := L;
    j := R;
    Row := ItemByIndex[(L + R) shr 1].FRow;
    repeat
      while ItemByIndex[i].FRow < Row do Inc(i);
      while ItemByIndex[j].FRow > Row do Dec(j);
      if I <= J then begin
        Exchange(i,j);
        Inc(i);
        Dec(j);
      end;
    until I > J;
    if L < j then QSort(L, j);
    L := i;
  until i >= R;
end;


begin
  if Count > 0 then
    QSort(0,Count - 1);
end;

procedure TXLSRows.ValidRows(Row1, Row2: integer);
begin
  if (Row1 < 0) or (Row1 > MAXROW) or (Row2 < 0) or (Row2 > MAXROW) or (Row2 < Row1) then
    raise Exception.Create('Invalid rows');
end;

function TXLSRows.Hidden(Row: integer): boolean;
var
  R: TXLSRow;
begin
  Result := False;
  R := Find(Row);
  if R = Nil then
    Exit;
  Result := R.Hidden;
end;

end.
