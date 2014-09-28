unit CellStorage2;

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

uses Classes, SysUtils, BIFFRecsII2, Cell2, CellFormats2;

type TPointerArray = array[0..$FF] of Pointer;
     PPointerArray = ^TPointerArray;

type TCellStorage = class(TObject)
protected
    FCells: TPointerArray;
    RowHi,RowLo: integer;
    ColHi,ColLo: integer;
    iRowHi,iRowLo: integer;
    iColHi,iColLo: integer;
    FLastCell: TCell;
    FFirstCol,FLastCol: integer;
    FFirstRow,FLastRow: integer;

    procedure Split(RC: integer);
    function  GetCells(RC: longword): TCell;
    procedure SetCells(RC: longword; const Value: TCell);
    procedure SetCellsNotChangeFmt(RC: longword; const Value: TCell);
public
    destructor Destroy; override;
    procedure Clear;
    procedure Delete(RC: longword);
    procedure DeleteFmt(RC: longword);
    procedure SetNil(RC: longword);
    procedure CalcDimensions;
    procedure CalcDimensionsEx;
    procedure BeginIterate;
    procedure Calculated(IsCalculated: boolean);
    function  GetNext: TCell;
    function  GetNextMULBLANK: TBlankCell;
    function  Count: integer;

    property Cells[RC: longword]: TCell read GetCells write SetCells; default;
    property CellsNotChangeFmt[RC: longword]: TCell read GetCells write SetCellsNotChangeFmt;
    property FirstCol: integer read FFirstCol;
    property LastCol: integer read FLastCol;
    property FirstRow: integer read FFirstRow;
    property LastRow: integer read FLastRow;
    end;

implementation

{ TCellStorage }

procedure TCellStorage.BeginIterate;
begin
  iRowHi := 0;
  iRowLo := 0;
  iColHi := 0;
  iColLo := 0;
end;

procedure TCellStorage.CalcDimensions;
var
  P1,P2,P3: PPointerArray;
  C,R,i,j,k,l: integer;
begin
  FFirstCol := MAXCOL;
  FLastCol := 0;
  FFirstRow := MAXROW;
  FLastRow := 0;
  P1 := Nil;
  for i := 0 to High(FCells) do begin
    if FCells[i] <> Nil then begin
      P1 := FCells[i];
      for j := 0 to $FF do begin
        if P1[j] <> Nil then begin
          P2 := P1[j];
          for k := 0 to $0F do begin
            if P2[k] <> Nil then begin
              P3 := P2[k];
              for l := 0 to $0F do begin
                if P3[l] <> Nil then begin
                  C := (k shl 4) + l;
                  R := (i shl 8) + j;
                  if C < FFirstCol then FFirstCol := C;
                  if C > FLastCol  then FLastCol := C;
                  if R < FFirstRow then FFirstRow := R;
                  if R > FLastRow  then FLastRow := R;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if P1 = Nil then begin
    FFirstCol := 0;
    FFirstRow := 0;
  end;
end;

procedure TCellStorage.CalcDimensionsEx;
var
  P1,P2,P3: PPointerArray;
  C,R,i,j,k,l: integer;
begin
  FFirstCol := MAXINT;
  FLastCol := 0;
  FFirstRow := MAXINT;
  FLastRow := 0;
  P1 := Nil;
  for i := 0 to High(FCells) do begin
    if FCells[i] <> Nil then begin
      P1 := FCells[i];
      for j := 0 to $FF do begin
        if P1[j] <> Nil then begin
          P2 := P1[j];
          for k := 0 to $0F do begin
            if P2[k] <> Nil then begin
              P3 := P2[k];
              for l := 0 to $0F do begin
                if (P3[l] <> Nil) and (TCell(P3[l]).CellType <> ctBlank) then begin
                  C := (k shl 4) + l;
                  R := (i shl 8) + j;
                  if C < FFirstCol then FFirstCol := C;
                  if C > FLastCol  then FLastCol := C;
                  if R < FFirstRow then FFirstRow := R;
                  if R > FLastRow  then FLastRow := R;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if P1 = Nil then begin
    FFirstCol := 0;
    FFirstRow := 0;
  end;
end;

procedure TCellStorage.Clear;
var
  P1,P2,P3: PPointerArray;
  i,j,k,l: integer;
begin
  for i := 0 to High(FCells) do begin
    if FCells[i] <> Nil then begin
      P1 := FCells[i];
      for j := 0 to $FF do begin
        if P1[j] <> Nil then begin
          P2 := P1[j];
          for k := 0 to $0F do begin
            if P2[k] <> Nil then begin
              P3 := P2[k];
              for l := 0 to $0F do begin
                if P3[l] <> Nil then
                  TCell(P3[l]).Free;
              end;
              FreeMem(P2[k]);
            end;
          end;
          FreeMem(P1[j]);
        end;
      end;
      FreeMem(FCells[i]);
      FCells[i] := Nil;
    end;
  end;
  FillChar(FCells,Length(FCells) * SizeOf(Pointer),#0);
end;

procedure TCellStorage.Delete(RC: longword);
var
  P: PPointerArray;
begin
  Split(RC);
  if FCells[RowHi] = Nil then
    Exit;
  P := FCells[RowHi];
  if P[RowLo] = Nil then
    Exit;
  P := P[RowLo];
  if P[ColHi] = Nil then
    Exit;
  P := P[ColHi];
  if P[ColLo] = Nil then
    Exit;
  if TCell(P[ColLo]) = FLastCell then
    FLastCell := Nil;
  TCell(P[ColLo]).Free;
  P[ColLo] := Nil;
end;

procedure TCellStorage.DeleteFmt(RC: longword);
var
  FI: word;
  Fmts: TCellFormats;
  P: PPointerArray;
begin
  Split(RC);
  if FCells[RowHi] = Nil then
    Exit;
  P := FCells[RowHi];
  if P[RowLo] = Nil then
    Exit;
  P := P[RowLo];
  if P[ColHi] = Nil then
    Exit;
  P := P[ColHi];
  if P[ColLo] = Nil then
    Exit;
  FLastCell := TCell(P[ColLo]);
  if not (FLastCell is TBlankCell) then begin
    Fmts := FLastCell.Formats;
    FI := FLastCell.FormatIndex;
    P[ColLo] := TBlankCell.Create(RC,Fmts,FI);
    FLastCell.Free;
  end;
end;

procedure TCellStorage.SetNil(RC: longword);
var
  P: PPointerArray;
begin
  Split(RC);
  if FCells[RowHi] = Nil then
    Exit;
  P := FCells[RowHi];
  if P[RowLo] = Nil then
    Exit;
  P := P[RowLo];
  if P[ColHi] = Nil then
    Exit;
  P := P[ColHi];
  if P[ColLo] = Nil then
    Exit;
  P[ColLo] := Nil;
end;

destructor TCellStorage.Destroy;
begin
  Clear;
  inherited;
end;

function TCellStorage.GetCells(RC: longword): TCell;
var
  P: PPointerArray;
begin
  if RC > $1000100 then begin
    Result := Nil;
    Exit;
  end;
  if (FLastCell <> Nil) and (FLastCell.RowCol = RC) then begin
    Result := FLastCell;
    Exit;
  end;
  Result := Nil;
  Split(RC);
  if FCells[RowHi] = Nil then
    Exit;
  P := FCells[RowHi];
  if P[RowLo] = Nil then
    Exit;
  P := P[RowLo];
  if P[ColHi] = Nil then
    Exit;
  P := P[ColHi];
  if P[ColLo] = Nil then
    Exit;
  Result := TCell(P[ColLo]);
  FLastCell := Result;
end;

function TCellStorage.GetNext: TCell;
var
  P1,P2,P3: PPointerArray;
begin
  while iRowHi <= $FF do begin
    if FCells[iRowHi] <> Nil then begin
      P1 := FCells[iRowHi];
      while iRowLo <= $FF do begin
        if P1[iRowLo] <> Nil then begin
          P2 := P1[iRowLo];
          while iColHi <= $0F do begin
            if P2[iColHi] <> Nil then begin
              P3 := P2[iColHi];
              while iColLo <= $0F do begin
                if P3[iColLo] <> Nil then begin
                  Result := TCell(P3[iColLo]);
                  Inc(iColLo);
                  Exit;
                end;
                Inc(iColLo);
              end;
              iColLo := 0;
            end;
            Inc(iColHi);
          end;
          iColHi := 0;
        end;
        Inc(iRowLo);
      end;
      iRowLo := 0;
    end;
    Inc(iRowHi);
  end;
  Result := Nil;
end;

function TCellStorage.GetNextMULBLANK: TBlankCell;
var
  PRow,P3: PPointerArray;
begin
  Result := Nil;
  if (iColHi >= $0F) and (iColLo >= $0F) then
    Exit;
  if FCells[iRowHi] = Nil then
    Exit;
  PRow := FCells[iRowHi];
  if PRow[iRowLo] = Nil then
    Exit;
  PRow := PRow[iRowLo];
  while iColHi <= $0F do begin
    if PRow[iColHi] = Nil then
      Exit;
    P3 := PRow[iColHi];
    while iColLo <= $0F do begin
      if P3[iColLo] = Nil then
        Exit;
      if (TCell(P3[iColLo]) is TBlankCell) then begin
        Result := TBlankCell(P3[iColLo]);
        Inc(iColLo);
      end;
      Exit;
    end;
    iColLo := 0;
    Inc(iColHi);
  end;
  Result := Nil;
end;

{
function TCellStorage.IterateEnd: boolean;
begin
  Result := (iRowHi >= $FF) and (iRowLo >= $FF) and (iColHi >= $0F) and (iColLo >= $0F);
end;
}
procedure TCellStorage.SetCells(RC: longword; const Value: TCell);
var
  FI: word;
  P: PPointerArray;
begin
  FLastCell := Value;
  Split(RC);
  if FCells[RowHi] = Nil then begin
    GetMem(FCells[RowHi],256 * SizeOf(Pointer));
    P := FCells[RowHi];
    FillChar(P^,256 * SizeOf(Pointer),#0);
    GetMem(P[RowLo],16 * SizeOf(Pointer));
    P := P[RowLo];
    FillChar(P^,16 * SizeOf(Pointer),#0);
    GetMem(P[ColHi],16 * SizeOf(Pointer));
    P := P[ColHi];
    FillChar(P^,16 * SizeOf(Pointer),#0);
    P[ColLo] := Value;
    Exit;
  end;
  P := FCells[RowHi];
  if P[RowLo] = Nil then begin
    GetMem(P[RowLo],16 * SizeOf(Pointer));
    P := P[RowLo];
    FillChar(P^,16 * SizeOf(Pointer),#0);
    GetMem(P[ColHi],16 * SizeOf(Pointer));
    P := P[ColHi];
    FillChar(P^,16 * SizeOf(Pointer),#0);
    P[ColLo] := Value;
    Exit;
  end;
  P := P[RowLo];
  if P[ColHi] = Nil then begin
    GetMem(P[ColHi],16 * SizeOf(Pointer));
    P := P[ColHi];
    FillChar(P^,16 * SizeOf(Pointer),#0);
    P[ColLo] := Value;
    Exit;
  end;
  P := P[ColHi];
  if (P[ColLo] <> Nil) and (P[ColLo] <> Value) then begin
    FI := TCell(P[ColLo]).FormatIndex;
    if Value <> Nil then
      Value.AssignFormat(FI);
    TCell(P[ColLo]).Free;
  end;
  P[ColLo] := Value
end;


procedure TCellStorage.SetCellsNotChangeFmt(RC: longword; const Value: TCell);
var
  P: PPointerArray;
begin
  FLastCell := Value;
  Split(RC);
  if FCells[RowHi] = Nil then begin
    GetMem(FCells[RowHi],256 * SizeOf(Pointer));
    P := FCells[RowHi];
    FillChar(P^,256 * SizeOf(Pointer),#0);
    GetMem(P[RowLo],16 * SizeOf(Pointer));
    P := P[RowLo];
    FillChar(P^,16 * SizeOf(Pointer),#0);
    GetMem(P[ColHi],16 * SizeOf(Pointer));
    P := P[ColHi];
    FillChar(P^,16 * SizeOf(Pointer),#0);
    P[ColLo] := Value;
    Exit;
  end;
  P := FCells[RowHi];
  if P[RowLo] = Nil then begin
    GetMem(P[RowLo],16 * SizeOf(Pointer));
    P := P[RowLo];
    FillChar(P^,16 * SizeOf(Pointer),#0);
    GetMem(P[ColHi],16 * SizeOf(Pointer));
    P := P[ColHi];
    FillChar(P^,16 * SizeOf(Pointer),#0);
    P[ColLo] := Value;
    Exit;
  end;
  P := P[RowLo];
  if P[ColHi] = Nil then begin
    GetMem(P[ColHi],16 * SizeOf(Pointer));
    P := P[ColHi];
    FillChar(P^,16 * SizeOf(Pointer),#0);
    P[ColLo] := Value;
    Exit;
  end;
  P := P[ColHi];
  if (P[ColLo] <> Nil) and (P[ColLo] <> Value) then begin
    TCell(P[ColLo]).Free;
  end;
  P[ColLo] := Value
end;

procedure TCellStorage.Split(RC: integer);
begin
  RowHi := RC shr 16;
  RowLo := (RC shr 8) and $FF;
  ColHi := (RC shr 4) and $0F;
  ColLo := RC and $0F;
end;

procedure TCellStorage.Calculated(IsCalculated: boolean);
var
  P1,P2,P3: PPointerArray;
  i,j,k,l: integer;
begin
  FFirstCol := MAXINT;
  FLastCol := 0;
  FFirstRow := MAXINT;
  FLastRow := 0;
  for i := 0 to High(FCells) do begin
    if FCells[i] <> Nil then begin
      P1 := FCells[i];
      for j := 0 to $FF do begin
        if P1[j] <> Nil then begin
          P2 := P1[j];
          for k := 0 to $0F do begin
            if P2[k] <> Nil then begin
              P3 := P2[k];
              for l := 0 to $0F do begin
                if (P3[l] <> Nil) and (TCell(P3[l]).CellType in TFormulaCellType) then
                  TFormulaCell(P3[l]).Calculated := IsCalculated;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TCellStorage.Count: integer;
var
  P1,P2,P3: PPointerArray;
  i,j,k,l: integer;
begin
  Result := 0;
  for i := 0 to High(FCells) do begin
    if FCells[i] <> Nil then begin
      P1 := FCells[i];
      for j := 0 to $FF do begin
        if P1[j] <> Nil then begin
          P2 := P1[j];
          for k := 0 to $0F do begin
            if P2[k] <> Nil then begin
              P3 := P2[k];
              for l := 0 to $0F do begin
                if P3[l] <> Nil then
                  Inc(Result);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

end.
