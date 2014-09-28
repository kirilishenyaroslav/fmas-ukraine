unit CellValues2;

interface

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

uses Classes, SysUtils, BIFFRecsII2, XLSUtils2, Cell2, CellStorage2, SST2,
     Contnrs;

type TCellValuesList = class;

     TCellValues = class(TCellStorage)
private
     function GetRCAsString(RC: longword): WideString;
     procedure SetRCAsString(RC: longword; const Value: WideString);
protected
     FParent: TCellValuesList;
     FSST: TSST2;
public
     constructor Create(AParent: TCellValuesList; ASST: TSST2);
     function GetAsFloat(Col,Row: integer): double;
     function GetAsString(Col,Row: integer): WideString;
     function GetAsFmtString(Col,Row: integer): WideString;

     property SST: TSST2 read FSST;
     property RCAsString[RC: longword]: WideString read GetRCAsString write SetRCAsString;
     end;

     TCellValuesList = class(TObjectList)
private
     function GetItems(Index: integer): TCellValues;
protected
     FSST: TSST2;
public
     constructor Create(ASST: TSST2);
     destructor Destroy; override;
     function Add: TCellValues;
     function Insert(Index: integer): TCellValues;
     procedure Clear; //override;

     property Items[Index: integer]: TCellValues read GetItems; default;
     end;

implementation

{ TCellValues }

constructor TCellValues.Create(AParent: TCellValuesList; ASST: TSST2);
begin
  FParent := AParent;
  FSST := ASST;
end;

function TCellValues.GetAsFloat(Col, Row: integer): double;
var
  Cell: TCell;
begin
  Cell := Cells[ColRowToRC(Col,Row)];
  if (Cell <> Nil) then begin
    if Cell is TFloatCell then
      Result := TFloatCell(Cell).Value
    else if Cell is TIntegerCell then
      Result := TIntegerCell(Cell).Value
    else if Cell is TNumberFormulaCell then
      Result := TNumberFormulaCell(Cell).NumberValue
    else if Cell is TArrayFormulaCell then
      Result := TArrayFormulaCell(Cell).NumberValue
    else
      Result := 0;
  end
  else
    Result := 0;
end;

function TCellValues.GetAsFmtString(Col, Row: integer): WideString;
var
  Cell: TCell;

function FormatNumber(V: double; FormatIndex: word): string;

function DoUserFormat: string;
var
  S: string;
begin
  S := Cell.Formats[FormatIndex].NumberFormat;
  if S <> '' then begin
    Cell.Formats.XLSMask.Mask := S;
    Result := Cell.Formats.XLSMask.FormatNumber(V);
  end
  else
    Result := FloatToStr(V);
end;

function FloatToFracStr(Value: double; MaxDenom: integer): string;
var
  an,ad: integer;
  bn,bd: integer;
  n,d: integer;
  sp,delta: double;
  sPrefix: string;
begin
  if Frac(Value) = 0 then begin
    Result := FloatToStr(Value);
    Exit;
  end;
  sPrefix := '';
  if Int(Value) > 0 then begin
    sPrefix := FloatToStr(Int(Value)) + ' ';
    Value := Frac(Value);
  end;
  an := 0;
  ad := 1;
  bn := 1;
  bd := 1;
  d := ad + bd;
  while (d <= MaxDenom) do begin
    sp := 1e-5 * d;
    n := an + bn;
    delta := Value * d - n;
    if delta > sp then begin
      an := n;
      ad := d;
    end
    else if delta < -sp then begin
      bn := n;
      bd := d;
    end
    else begin
      Result := sPrefix + SysUtils.Format('%d/%d',[n,d]);
      Exit;
    end;
    d := ad + bd;
  end;
  if (bd > MaxDenom) or (Abs(Value * ad - an) < Abs(Value * bd - bn)) then
    Result := sPrefix + SysUtils.Format('%d/%d',[an,ad])
  else
    Result := sPrefix + SysUtils.Format('%d/%d',[bn,bd]);
end;

begin
  // ???
  if (FormatIndex > 0) then begin
    case Cell.Formats[FormatIndex].NumberFormatIndex of
      $0B: Result := FloatToStrF(V,ffExponent,3,2);
      $0C: Result := FloatToFracStr(V,9);
      $0D: Result := FloatToFracStr(V,99);
      $0E: Result := DateToStr(V);
      $14: Result := FormatDateTime('t',V);
      else
        Result := DoUserFormat;
    end;
  end
  else
    Result := FloatToStr(V);
end;

begin
  Cell := Cells[ColRowToRC(Col,Row)];
  if Cell <> Nil then begin
    case Cell.CellType of
      ctNone: ;
      ctBlank:          Result := '';
      ctInteger:        Result := FormatNumber(TIntegerCell(Cell).Value,Cell.FormatIndex);
      ctFloat:          Result := FormatNumber(TFloatCell(Cell).Value,Cell.FormatIndex);
      ctString:         Result := FSST[TStringCell(Cell).Value];
      ctBoolean:        if TBooleanCell(Cell).Value then Result := G_StrTRUE else Result := G_StrFALSE;
      ctError:          Result := CellErrorNames[Integer(TErrorCell(Cell).Value)];
      ctNumberFormula:  Result := FormatNumber(TNumberFormulaCell(Cell).NumberValue,Cell.FormatIndex);
      ctStringFormula:  Result := TStringFormulaCell(Cell).StringValue;
      ctBooleanFormula: if TBooleanFormulaCell(Cell).BooleanValue then Result := G_StrTRUE else Result := G_StrFALSE;
      ctErrorFormula:   Result := CellErrorNames[Byte(TErrorFormulaCell(Cell).ErrorValue)];
      ctArrayFormula:   Result := FormatNumber(TArrayFormulaCell(Cell).NumberValue,Cell.FormatIndex);
    end;
  end
  else
    Result := '';
end;

function TCellValues.GetAsString(Col, Row: integer): WideString;
var
  Cell: TCell;
begin
  Cell := Cells[ColRowToRC(Col,Row)];
  if (Cell <> Nil) then begin
    if Cell.CellType = ctString then
      Result := FSST[TStringCell(Cell).Value]
    else
      Result := '';
  end
  else
    Result := '';
end;

function TCellValues.GetRCAsString(RC: longword): WideString;
var
  Cell: TCell;
begin
  Cell := Cells[RC];
  if (Cell <> Nil) then begin
    if Cell.CellType = ctString then
      Result := FSST[TStringCell(Cell).Value]
    else
      Result := '';
  end
  else
    Result := '';
end;

procedure TCellValues.SetRCAsString(RC: longword; const Value: WideString);
begin

end;

{ TCellValuesList }

function TCellValuesList.Add: TCellValues;
begin
  Result := TCellValues.Create(Self,FSST);
  inherited Add(Result);
end;

procedure TCellValuesList.Clear;
begin
  // Don't do nothing. Items are deleted by the sheets.
  Exit;
end;

constructor TCellValuesList.Create(ASST: TSST2);
begin
  inherited Create;
  FSST := ASST;
end;

destructor TCellValuesList.Destroy;
begin

  inherited;
end;

function TCellValuesList.GetItems(Index: integer): TCellValues;
begin
  Result := TCellValues(inherited Items[Index]);
end;

function TCellValuesList.Insert(Index: integer): TCellValues;
begin
  Result := TCellValues.Create(Self,FSST);
  inherited Insert(Index,Result);
end;

end.
