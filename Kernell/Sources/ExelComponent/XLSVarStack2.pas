unit XLSVarStack2;

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

uses SysUtils, Classes, Math, BIFFRecsII2, ExcelFuncII2, XLSUtils2,
     XLSReadWriteII2, Cell2;

type TVarStack = class(TObject)
private
    FStack: array of TFormulaValue;
    FStackPtr: integer;
protected
    FXLS: TXLSReadWriteII2;
    FSheetIndex: integer;
public
    constructor Create(XLS: TXLSReadWriteII2; SheetIndex: integer);
    destructor Destroy; override;
    procedure IncStack;
    procedure Push; overload;
    procedure Push(Value: TFormulaValue); overload;
    procedure Push(Value: WideString); overload;
    procedure Push(Value: double); overload;
    procedure Push(Value: boolean); overload;
    procedure Push(Value: TCellError); overload;
    procedure PushRef(Col,Row: word);
    procedure PushArea(Col1,Row1,Col2,Row2: word);
    procedure PushXRef(Col,Row,Sheet: word);
    procedure PushXArea(Col1,Row1,Col2,Row2,Sheet: word);
    function  Pop: TFormulaValue;
    function  Peek: TFormulaValue;
    procedure Operator(Op: Byte);
    end;

implementation

{ TVarStack }

constructor TVarStack.Create(XLS: TXLSReadWriteII2; SheetIndex: integer);
begin
  FXLS := XLS;
  FSheetIndex := SheetIndex;
  SetLength(FStack,32);
  FStackPtr := -1;
end;

destructor TVarStack.Destroy;
begin
  SetLength(FStack,0);
  inherited;
end;

procedure TVarStack.Operator(Op: Byte);
var
  F1,F2: double;
  FV1,FV2: TFormulaValue;
  FVResult: TFormulaValue;
  V: integer;

function GetValue(FV: TFormulaValue): TFormulaValue;
begin
  case FV.ValType of
    fvRef   : Result := FXLS.Sheets[FSheetIndex].FVRefToFV(FV);
    fvExtRef: Result := FXLS.Sheets[FV.vExtRef[2]].FVRefToFV(FV);
    else
      Result := FV;
  end;
end;

function GetFloatValue(FV: TFormulaValue): double;
var
  S: string;
begin
  Result := 0;
  case FV.ValType of
    fvFloat:   Result := FV.vFloat;
    fvBoolean: Result := Integer(FV.vBoolean);
    fvError:   FVResult := FV;
    fvString:  begin
{$ifdef DELPHI_6_OR_LATER}
      if not TextToFloat(PChar(S),Result,fvExtended) then
        FVSetError(FVResult,errValue);
{$else}
    try
      Result := StrToFloat(FV.vString);
    except
      FVSetError(FVResult,errValue);
    end;
{$endif}
    end;
    fvArea:    FVSetError(FVResult,errValue);
    fvExtArea: FVSetError(FVResult,errValue);
    fvNull:    Result := 0;
  end;
end;

function GetStrValue(FV: TFormulaValue): WideString;
begin
  case FV.ValType of
    fvFloat:   Result := FloatToStr(FV.vFloat);
    fvError:   Result := CellErrorNames[Integer(FV.vError)];
    fvBoolean: begin
      if FV.vBoolean then
        Result := FXLS.StrTRUE
      else
        Result := FXLS.StrFALSE;
    end;
    else
      Result := FVGetString(FV);
  end;
end;

begin
  if FStackPtr < 0 then
    raise Exception.Create('Value is missing');
  FVSetNull(FVResult);

  F1 := 0;
  F2 := 0;

  if OP in [ptgAdd..ptgConcat,ptgLT..ptgNE,ptgUPlus,ptgUMinus,ptgPercent] then begin
    FV1 := GetValue(FStack[FStackPtr]);
    F1 := GetFloatValue(FV1);
    if (FVResult.ValType <> fvError) and (not (Op in [ptgUPlus,ptgUMinus,ptgPercent])) then begin
      FV2 := GetValue(FStack[FStackPtr - 1]);
      F2 := GetFloatValue(FV2);
    end;
  end;

  if FVResult.ValType <> fvError then begin
    case Op of
      ptgAdd:    FVSetFloat(FVResult,F2 + F1);
      ptgSub:    FVSetFloat(FVResult,F2 - F1);
      ptgMul:    FVSetFloat(FVResult,F2 * F1);
      ptgDiv:    begin
        if F1 = 0 then
          FVSetError(FVResult,errDiv0)
        else
          FVSetFloat(FVResult,F2 / F1);
      end;
      ptgPower:  FVSetFloat(FVResult,Power(F2,F1));

      ptgUPlus: FVSetFloat(FVResult,F1);
      ptgUMinus: FVSetFloat(FVResult,-F1);

      // This is probably not correct...
      ptgUnion: FVSetString(FVResult,GetStrValue(FV1));
  {
      ptgPercent: UnaryOperator('%');
  }
      ptgConcat: FVSetString(FVResult,GetStrValue(FV2) + GetStrValue(FV1));
      else begin
        if (FV1.ValType in [fvString,fvNull]) or (FV2.ValType in [fvString,fvNull]) then begin
{$ifdef OLD_COMPILER}
          V := AnsiCompareStr(AnsiUppercase(GetStrValue(FV1)),AnsiUppercase(GetStrValue(FV2)));
{$else}
          V := WideCompareStr(MyWideUppercase(GetStrValue(FV1)),MyWideUppercase(GetStrValue(FV2)));
{$endif}
          case Op of
            ptgLT: FVSetBoolean(FVResult,V  < 0);
            ptgLE: FVSetBoolean(FVResult,V <= 0);
            ptgEQ: FVSetBoolean(FVResult,V  = 0);
            ptgGE: FVSetBoolean(FVResult,V >= 0);
            ptgGT: FVSetBoolean(FVResult,V  > 0);
            ptgNE: FVSetBoolean(FVResult,V <> 0);
          end;
        end
        else begin
          if FVResult.ValType <> fvError then begin
            case Op of
              ptgLT: FVSetBoolean(FVResult,F2 <  F1);
              ptgLE: FVSetBoolean(FVResult,F2 <= F1);
              ptgEQ: FVSetBoolean(FVResult,F2  = F1);
              ptgGE: FVSetBoolean(FVResult,F2 >= F1);
              ptgGT: FVSetBoolean(FVResult,F2 >  F1);
              ptgNE: FVSetBoolean(FVResult,F2 <> F1);
            end;
          end;
        end;
      end;
    end;
  end;
  if not (Op in [ptgUPlus,ptgUMinus,ptgPercent]) then
    Dec(FStackPtr);
  FStack[FStackPtr] := FVResult;
end;

function TVarStack.Pop: TFormulaValue;
begin
  if FStackPtr < 0 then
    raise Exception.Create('Empty stack');
  Result := FStack[FStackPtr];
  Dec(FStackPtr);
end;

function TVarStack.Peek: TFormulaValue;
begin
  if FStackPtr < 0 then
    raise Exception.Create('Empty stack');
  Result := FStack[FStackPtr];
end;

procedure TVarStack.IncStack;
begin
  Inc(FStackPtr);
  if FStackPtr >= High(FStack) then
    SetLength(FStack,Length(FStack) + 32);
end;

procedure TVarStack.Push(Value: TFormulaValue);
begin
  IncStack;
  FStack[FStackPtr] := Value;
end;

procedure TVarStack.Push(Value: double);
begin
  IncStack;
  FVSetFloat(FStack[FStackPtr],Value);
end;

procedure TVarStack.Push(Value: WideString);
begin
  IncStack;
  FVSetString(FStack[FStackPtr],Value);
end;

procedure TVarStack.Push(Value: boolean);
begin
  IncStack;
  FVSetBoolean(FStack[FStackPtr],Value);
end;

procedure TVarStack.Push(Value: TCellError);
begin
  IncStack;
  FVSetError(FStack[FStackPtr],Value);
end;

procedure TVarStack.PushArea(Col1, Row1, Col2, Row2: word);
begin
  IncStack;
  FVSetArea(FStack[FStackPtr],Col1, Row1, Col2, Row2);
end;

procedure TVarStack.PushRef(Col, Row: word);
begin
  IncStack;
  FVSetRef(FStack[FStackPtr],Col, Row);
end;

procedure TVarStack.PushXArea(Col1, Row1, Col2, Row2, Sheet: word);
begin
  IncStack;
  FVSetXArea(FStack[FStackPtr],Col1, Row1, Col2, Row2, Sheet);
end;

procedure TVarStack.PushXRef(Col, Row, Sheet: word);
begin
  IncStack;
  FVSetXRef(FStack[FStackPtr],Col, Row, Sheet);
end;

procedure TVarStack.Push;
begin
  IncStack;
  FVSetNull(FStack[FStackPtr]);
end;

end.
