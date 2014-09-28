unit XLSFuncEval2;

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

// Currently supported functions
// COUNT,IF,ISNA,ISERROR,SUM,AVERAGE,MIN,MAX,ROW,COLUMN,NA,NPV,STDEV,DOLLAR,
// FIXED,COS,SIN,TAN,ATAN,PI,EXP,LN,LOG10,ABS,INT,SIGN,ROUND,LOOKUP,TRUE,FALSE,
// AND,OR,NOT,MOD

interface

uses Classes, SysUtils, Math, ExcelFuncII2, XLSUtils2, XLSVarStack2,
     BIFFRecsII2, XLSReadWriteII2;

type TExcelFunctionEvaluate = class(TVarStack)
protected
     FArgs: TFormulaValueArray;
     FValues: TFormulaValueArray;
     FFuncName: WideString;

     procedure GetArgValues(Args: array of TFormulaValue; var Values: TFormulaValueArray);
     procedure ValueIsVector(Id: Integer; Value: TFormulaValue);
     function  MakeFloat(var Vals: array of TFormulaValue; Last: integer): boolean;
     function  FVToFloat(FV: TFormulaValue; var Res: double): boolean;
     function  FVToStr(FV: TFormulaValue; var Res: WideString): boolean;
     function  FVToBool(FV: TFormulaValue; var Res: boolean): boolean;
     function  FVToFloatFV(FV: TFormulaValue; var Res: TFormulaValue): boolean;
     function  FVToStrFV(FV: TFormulaValue; var Res: TFormulaValue): boolean;
     function  FVToBoolFV(FV: TFormulaValue; var Res: TFormulaValue): boolean;

     function  DoCONCATENATE: TFormulaValue;
     function  DoISNUMBER: TFormulaValue;
     function  DoFIXED: TFormulaValue;
     function  DoDOLLAR: TFormulaValue;
     function  DoMOD: TFormulaValue;
     function  DoNOT: TFormulaValue;
     function  DoOR: TFormulaValue;
     function  DoAND: TFormulaValue;
     function  DoSTDEV: TFormulaValue;
     function  DoNPV: TFormulaValue;
     function  DoNA: TFormulaValue;
     function  DoCOLUMN(Column: integer): TFormulaValue;
     function  DoROW(Row: integer): TFormulaValue;
     function  DoROUND: TFormulaValue;
     function  DoLOOKUP: TFormulaValue;
     function  DoMAX: TFormulaValue;
     function  DoMIN: TFormulaValue;
     function  DoAVERAGE: TFormulaValue;
     function  DoSUM: TFormulaValue;
     function  DoIsERROR: TFormulaValue;
     function  DoIsNA: TFormulaValue;
     function  DoIF: TFormulaValue;
     function  DoCOUNT: TFormulaValue;
public
     procedure DoFunction(Id: integer; ArgCount,Col,Row: integer); virtual;
     end;

implementation

procedure CheckArgCount(Id: TFunctionId; Count: integer);
begin
  if (Count < ExcelFunctions[Integer(Id)].Min) or (Count > ExcelFunctions[Integer(Id)].Max) then
    raise Exception.CreateFmt('Wrong number of arguments (%d) to function %s',[Count,ExcelFunctions[Integer(Id)].Name]);
end;

{ TExcelFunctionEvaluate }

procedure TExcelFunctionEvaluate.DoFunction(Id: integer; ArgCount,Col,Row: integer);
var
  i: integer;
  FuncId: TFunctionId;
  Calculated: boolean;
  Res: TFormulaValue;

function CheckArgType(Id: TFunctionId; V: TFormulaValue; ExcpectedArgType: TFormulaValType): TFormulaValue;
begin
  Result := V;
  if V.ValType <> ExcpectedArgType then begin
    if V.ValType = fvRef then
      Result := FXLS.Sheets[FSheetIndex].AsFormulaValue[V.vRef[0],V.vRef[1]]
    else if V.ValType = fvExtRef then
      Result := FXLS.Sheets[V.vExtRef[2]].AsFormulaValue[V.vExtRef[0],V.vExtRef[1]];
  end;
  if Result.ValType <> ExcpectedArgType then
    raise Exception.CreateFmt('Wrong type of argument in function %s',[ExcelFunctions[Integer(Id)].Name]);
end;

begin
  Calculated := True;
  SetLength(FArgs,ArgCount);
  for i := 0 to ArgCount - 1 do
    FArgs[ArgCount - i - 1] := Pop;

  FVSetError(Res,errError);

  if Id <= Integer(fiUserFunc) then begin
    FuncId := TFunctionId(Id);
    if FuncId <> fiUserFunc then
      CheckArgCount(FuncId,ArgCount);
    case FuncId of
       fiCount: begin
         GetArgValues(FArgs,FValues);
         Res := DoCOUNT;
       end;
       fiIf: begin
         GetArgValues(FArgs,FValues);
         Res := DoIF;
       end;
       fiIsNA: begin
         GetArgValues(FArgs,FValues);
         Res := DoIsNA;
       end;
       fiIsError: begin
         GetArgValues(FArgs,FValues);
         Res := DoIsERROR;
       end;
       fiSum: begin
         GetArgValues(FArgs,FValues);
         Res := DoSUM;
       end;
       fiAverage: begin
         GetArgValues(FArgs,FValues);
         Res := DoAVERAGE;
       end;
       fiMin: begin
         GetArgValues(FArgs,FValues);
         Res := DoMIN;
       end;
       fiMax: begin
         GetArgValues(FArgs,FValues);
         Res := DoMAX;
       end;
       fiRow:    Res := DoROW(Row);
       fiColumn: Res := DoCOLUMN(Col);
       fiNA:     Res := DoNA;
       fiNPV: begin
         GetArgValues(FArgs,FValues);
         Res := DoNPV;
       end;
       fiSTDEV: begin
         GetArgValues(FArgs,FValues);
         Res := DoSTDEV;
       end;
       fiDollar: begin
         GetArgValues(FArgs,FValues);
         Res := DoDOLLAR;
       end;
       fiFixed: begin
         GetArgValues(FArgs,FValues);
         Res := DoFIXED;
       end;
       fiCos:  FVSetFloat(Res,Cos(CheckArgType(FuncId,FArgs[0],fvFloat).vFloat));
       fiSin:  FVSetFloat(Res,Sin(CheckArgType(FuncId,FArgs[0],fvFloat).vFloat));
       fiTan:  FVSetFloat(Res,Tan(CheckArgType(FuncId,FArgs[0],fvFloat).vFloat));
       fiATan: FVSetFloat(Res,ArcTan(CheckArgType(FuncId,FArgs[0],fvFloat).vFloat));
       fiPi:   FVSetFloat(Res,Pi);
       fiExp:  FVSetFloat(Res,Exp(CheckArgType(FuncId,FArgs[0],fvFloat).vFloat));
       fiLn:   FVSetFloat(Res,Ln(CheckArgType(FuncId,FArgs[0],fvFloat).vFloat));
       fiLog10:FVSetFloat(Res,Log10(CheckArgType(FuncId,FArgs[0],fvFloat).vFloat));
       fiAbs:  FVSetFloat(Res,Abs(CheckArgType(FuncId,FArgs[0],fvFloat).vFloat));
       fiInt:  FVSetFloat(Res,Int(CheckArgType(FuncId,FArgs[0],fvFloat).vFloat));
{$ifdef OLD_COMPILER}
       fiSign: begin
         if FArgs[0].vFloat > 0 then
           FVSetFloat(Res,1)
         else if FArgs[0].vFloat < 0 then
           FVSetFloat(Res,-1)
         else
           FVSetFloat(Res,0);
       end;
{$else}
       fiSign: FVSetFloat(Res,Sign(CheckArgType(FuncId,FArgs[0],fvFloat).vFloat));
{$endif}
       fiRound: begin
          GetArgValues(FArgs,FValues);
          Res := DoROUND;
       end;
       fiLookup:   Res := DoLOOKUP;

       fiTrue:     FVSetBoolean(Res,True);
       fiFalse:    FVSetBoolean(Res,False);
       fiAnd: begin
         GetArgValues(FArgs,FValues);
         Res := DoAND;
       end;
       fiOr: begin
         GetArgValues(FArgs,FValues);
         Res := DoOR;
       end;
       fiNot: begin
         GetArgValues(FArgs,FValues);
         Res := DoNOT;
       end;
       fiMod: begin
         GetArgValues(FArgs,FValues);
         Res := DoMOD;
       end;
       fiIsNumber: begin
         GetArgValues(FArgs,FValues);
         Res := DoISNUMBER;
       end;
       fiConcatenate: begin
         GetArgValues(FArgs,FValues);
         Res := DoCONCATENATE;
       end;
       fiUserFunc: begin
         Calculated := False;
         if FArgs[0].ValType = fvError then begin
           Push(FArgs[0]);
           Exit;
         end
         else begin
           FFuncName := FVGetString(FArgs[0]);
           for i := 0 to High(FArgs) - 1 do
             FArgs[i] := FArgs[i + 1];
           SetLength(FArgs,Length(FArgs) - 1);
         end;
       end;
       else begin
         FFuncName := ExcelFunctions[Integer(Id)].Name;
         Calculated := False;
       end;
    end;
  end
  else begin // if VStack.Pop = varString then
    FFuncName := ExcelFunctions[Integer(Id)].Name;
    Calculated := False;
  end;
  if not Calculated and Assigned(FXLS.OnFunction) then begin
    for i := 0 to High(FArgs) do begin
      case FArgs[i].ValType of
        fvRef: begin
          FArgs[i].ValType := fvExtRef;
          FArgs[i].vExtRef[2] := FSheetIndex;
        end;
        fvArea: begin
          FArgs[i].ValType := fvExtArea;
          FArgs[i].vExtArea[4] := FSheetIndex;
        end;
      end;
    end;
    FXLS.OnFunction(FXLS,FFuncName,FArgs,Res);
  end;

  if not ((Res.ValType = fvError) and (Res.vError = errError)) then
    Push(Res)
  else
    raise Exception.CreateFmt('Can not calculate function %s',[FFuncName]);
end;

procedure TExcelFunctionEvaluate.GetArgValues(Args: array of TFormulaValue; var Values: TFormulaValueArray);
var
  i,Col,Row,Count: integer;
begin
  Count := 0;
  for i := 0 to High(Args) do
    Inc(Count,FVSize(Args[i]));
  SetLength(Values,Count);
  Count := 0;
  for i := 0 to High(Args) do begin
    case Args[i].ValType of
      fvRef: begin
        Values[Count] := FXLS.Sheets[FSheetIndex].AsFormulaValue[Args[i].vRef[0],Args[i].vRef[1]];
        Inc(Count);
      end;
      fvArea: begin
        for Col := Args[i].vArea[0] to Args[i].vArea[2] do begin
          for Row := Args[i].vArea[1] to Args[i].vArea[3] do begin
            Values[Count] := FXLS.Sheets[FSheetIndex].AsFormulaValue[Col,Row];
            Inc(Count);
          end;
        end;
      end;
      fvExtRef: begin
        Values[Count] := FXLS.Sheets[Args[i].vExtRef[2]].AsFormulaValue[Args[i].vExtRef[0],Args[i].vExtRef[1]];
        Inc(Count);
      end;
      fvExtArea: begin
        for Col := Args[i].vExtArea[0] to Args[i].vExtArea[2] do begin
          for Row := Args[i].vExtArea[1] to Args[i].vExtArea[3] do begin
            Values[Count] := FXLS.Sheets[Args[i].vExtArea[4]].AsFormulaValue[Col,Row];
            Inc(Count);
          end;
        end;
      end;
      else begin
        Values[Count] := Args[i];
        Inc(Count);
      end;
    end;
  end;
end;

procedure TExcelFunctionEvaluate.ValueIsVector(Id: Integer; Value: TFormulaValue);
var
  Ok: boolean;
begin
  Ok := False;
  if Value.ValType in TFormulaValTypeRef then begin
    if Value.ValType in [fvArea,fvExtArea] then
      Ok := (Value.vArea[0] = Value.vArea[2]) or (Value.vArea[1] = Value.vArea[3])
    else
      Ok := True;
  end;
  if not Ok then
    raise Exception.CreateFmt('Wrong type of argument to function %s',[ExcelFunctions[Id].Name]);
end;

function TExcelFunctionEvaluate.MakeFloat(var Vals: array of TFormulaValue; Last: integer): boolean;
var
  i: integer;
begin
  Result := True;
  for i := 0 to Min(Last,High(Vals)) do begin
    if not FVToFloatFV(Vals[i],Vals[i]) then begin
      Result := False;
      Exit;
    end;
  end;
end;

function TExcelFunctionEvaluate.DoCOUNT: TFormulaValue;
var
  i: integer;
begin
  FVSetFloat(Result,0);
  for i := 0 to High(FValues) do begin
    if FValues[i].ValType = fvFloat then
      Result.vFloat := Result.vFloat + 1;
  end;
end;

function TExcelFunctionEvaluate.DoIF: TFormulaValue;
begin
  if FVToBoolFV(FValues[0],Result) then begin
    if Result.vBoolean then
      Result := FValues[1]
    // If there are 2 arguments, Result is allready False
    else if Length(FValues) = 3 then
      Result := FValues[2];
  end;
end;

function TExcelFunctionEvaluate.DoIsNA: TFormulaValue;
var
  i: integer;
begin
  FVSetBoolean(Result,True);
  for i := 0 to High(FValues) do begin
    if not ((FValues[i].ValType = fvError) and (FValues[i].vError = errNA)) then begin
      FVSetBoolean(Result,False);
      Exit;
    end;
  end;
end;

function TExcelFunctionEvaluate.DoIsERROR: TFormulaValue;
var
  i: integer;
begin
  FVSetBoolean(Result,True);
  for i := 0 to High(FValues) do begin
    if FValues[i].ValType <> fvError then begin
      FVSetBoolean(Result,False);
      Exit;
    end;
  end;
end;

function TExcelFunctionEvaluate.DoSUM: TFormulaValue;
var
  i: integer;
  V: double;
begin
  FVSetFloat(Result,0);
  for i := 0 to High(FValues) do begin
{
    if not FVToFloat(FValues[i],V) then begin
      FVSetError(Result,errValue);
      Exit;
    end;
}
    if FVToFloat(FValues[i],V) then 
      Result.vFloat := Result.vFloat + V;
  end;
end;

function TExcelFunctionEvaluate.FVToBool(FV: TFormulaValue; var Res: boolean): boolean;
begin
  Result := True;
  case FV.ValType of
    fvFloat:   Res := FV.vFloat <> 0;
    fvBoolean: Res := FV.vBoolean;
    fvError:   Result := False;
    fvString: begin
{$ifdef OLD_COMPILER}
      if AnsiUppercase(FV.vString) = FXLS.StrTRUE then
{$else}
      if WideUppercase(FV.vString) = FXLS.StrTRUE then
{$endif}
        Res := True
      else
        Res := False;
    end;
    fvRef,
    fvArea,
    fvExtRef,
    fvExtArea: raise Exception.Create('[int] Cell reference is not possible here');
    fvNull: Result := False;
  end;
end;

function TExcelFunctionEvaluate.FVToBoolFV(FV: TFormulaValue; var Res: TFormulaValue): boolean;
begin
  Result := True;
  case FV.ValType of
    fvFloat:   FVSetBoolean(Res,FV.vFloat <> 0);
    fvBoolean: Res := FV;
    fvError: begin
      FVSetError(Res,errValue);
      Result := False;
    end;
    fvString: begin
{$ifdef OLD_COMPILER}
      if AnsiUppercase(FV.vString) = FXLS.StrTRUE then
{$else}
      if WideUppercase(FV.vString) = FXLS.StrTRUE then
{$endif}
        FVSetBoolean(Res,True)
      else
        FVSetBoolean(Res,False);
    end;
    fvRef,
    fvArea,
    fvExtRef,
    fvExtArea: raise Exception.Create('[int] Cell reference is not possible here');
    fvNull: Result := False;
  end;
end;

function TExcelFunctionEvaluate.FVToFloat(FV: TFormulaValue; var Res: double): boolean;
begin
  Result := True;
  case FV.ValType of
    fvFloat: Res := FV.vFloat;
    fvBoolean: begin
      if FV.vBoolean then
        Res := 1
      else
        Res := 0;
    end;
    fvError: Result := False;
    fvString: begin
      try
        Res := StrToFloat(FV.vString);
      except
        Result := False;
      end;
    end;
    fvRef,
    fvArea,
    fvExtRef,
    fvExtArea: raise Exception.Create('[int] Cell reference is not possible here');
    fvNull: Result := False;
  end;
end;

function TExcelFunctionEvaluate.FVToFloatFV(FV: TFormulaValue; var Res: TFormulaValue): boolean;
begin
  Result := True;
  case FV.ValType of
    fvFloat: Res := FV;
    fvBoolean: begin
      if FV.vBoolean then
        FVSetFloat(Res,1)
      else
        FVSetFloat(Res,0);
    end;
    fvError: begin
      FVSetError(Res,errValue);
      Result := False;
    end;
    fvString: begin
      try
        FVSetFloat(Res,StrToFloat(FV.vString));
      except
        FVSetError(Res,errValue);
        Result := False;
      end;
    end;
    fvRef,
    fvArea,
    fvExtRef,
    fvExtArea,
    fvNull: raise Exception.Create('[int] Cell reference is not possible here');
  end;
end;

function TExcelFunctionEvaluate.FVToStr(FV: TFormulaValue; var Res: WideString): boolean;
begin
  Result := True;
  case FV.ValType of
    fvFloat: Res := FloatToStr(FV.vFloat);
    fvBoolean: begin
      if FV.vBoolean then
        Res := FXLS.StrTRUE
      else
        Res := FXLS.StrFALSE;
    end;
    fvError: begin
      Res := CellErrorNames[Integer(FV.vError)];
      Result := False;
    end;
    fvString: Res := FV.vString;
    fvRef,
    fvArea,
    fvExtRef,
    fvExtArea: raise Exception.Create('[int] Cell reference is not possible here');
    fvNull: Result := False;
  end;
end;

function TExcelFunctionEvaluate.FVToStrFV(FV: TFormulaValue; var Res: TFormulaValue): boolean;
begin
  Result := True;
  case FV.ValType of
    fvFloat: FVSetString(Res,FloatToStr(FV.vFloat));
    fvBoolean: begin
      if FV.vBoolean then
        FVSetString(Res,FXLS.StrTRUE)
      else
        FVSetString(Res,FXLS.StrFALSE);
    end;
    fvError: begin
      FVSetString(Res,CellErrorNames[Integer(FV.vError)]);
      Result := False;
    end;
    fvString: Res := FV;
    fvRef,
    fvArea,
    fvExtRef,
    fvExtArea: raise Exception.Create('[int] Cell reference is not possible here');
    fvNull: Result := False;
  end;
end;

function TExcelFunctionEvaluate.DoAVERAGE: TFormulaValue;
begin
  FVSetFloat(Result,0);
  Result := DoSUM;
  Result.vFloat := Result.vFloat / Length(FValues);
end;

function TExcelFunctionEvaluate.DoMIN: TFormulaValue;
var
  i: integer;
  V: double;
begin
  FVSetFloat(Result,MaxDouble);
  for i := 0 to High(FValues) do begin
    if not FVToFloat(FValues[i],V) then begin
      FVSetError(Result,errValue);
      Exit;
    end;
    if V < Result.vFloat then
      Result.vFloat := V;
  end;
end;

function TExcelFunctionEvaluate.DoMAX: TFormulaValue;
var
  i: integer;
  V: double;
begin
  FVSetFloat(Result,MinDouble);
  for i := 0 to High(FValues) do begin
    if not FVToFloat(FValues[i],V) then begin
      FVSetError(Result,errValue);
      Exit;
    end;
    if V > Result.vFloat then
      Result.vFloat := V;
  end;
end;

function TExcelFunctionEvaluate.DoLOOKUP: TFormulaValue;
var
  Cmp: double;
  Col,Row,pCol,pRow: integer;

procedure SetResult;
begin
  if Length(FArgs) = 3 then
    Result := FXLS.Sheets[0].AsFormulaValue[FArgs[2].vArea[0] + (pCol - FArgs[1].vArea[0]),FArgs[2].vArea[1] + (pRow - FArgs[1].vArea[1])]
  else
    Result := FXLS.Sheets[0].AsFormulaValue[pCol,pRow];
end;

begin
  FVSetError(Result,errNA);
  CheckArgCount(fiLookup,Length(FArgs));
  ValueIsVector(28,FArgs[1]);
  if Length(FArgs) = 3 then
    ValueIsVector(28,FArgs[2]);
  pCol := -1;
  pRow := -1;
  for Row := FArgs[1].vArea[1] to FArgs[1].vArea[3] do begin
    for Col := FArgs[1].vArea[0] to FArgs[1].vArea[2] do begin
      if not FVCompare(FXLS.Sheets[0].AsFormulaValue[Col,Row],FArgs[0],Cmp) then
        Exit;
      if Cmp >= 0 then begin
        if pCol < 0 then
          Exit;
        if Cmp = 0 then begin
          pCol := Col;
          pRow := Row;
        end;
        SetResult;
        Exit;
      end;
      pCol := Col;
      pRow := Row;
    end;
  end;
  if (Cmp < 0) and (pCol >= 0) then
    SetResult;
end;

{
function DoVLOOKUP(XLS: TXLSReadWriteII2; Args: array of TFormulaValue): TFormulaValue;
begin
  CheckArgCount(fiVLOOKUP,Length(Args));
end;
}

function TExcelFunctionEvaluate.DoROUND: TFormulaValue;
var
  A,B: double;
begin
  CheckArgCount(fiRound,2);
 if not FVToFloat(FValues[0],A) or not FVToFloat(FValues[1],B) then
   FVSetError(Result,errValue)
  else
{$ifdef OLD_COMPILER }
    FVSetFloat(Result,Round(A));
{$else}
    FVSetFloat(Result,RoundTo(A,Round(-B)));
{$endif}
end;

function TExcelFunctionEvaluate.DoROW(Row: integer): TFormulaValue;
begin
  if Length(FArgs) <= 0 then
    FVSetFloat(Result,Row + 1)
  else if FArgs[0].ValType in [fvRef,fvArea,fvExtRef,fvExtArea] then
    FVSetFloat(Result,FArgs[0].vRef[1] + 1)
  else
    raise Exception.Create('Argument must be a reference');
end;

function TExcelFunctionEvaluate.DoCOLUMN(Column: integer): TFormulaValue;
begin
  if Length(FArgs) <= 0 then
    FVSetFloat(Result,Column + 1)
  else if FArgs[0].ValType in [fvRef,fvArea,fvExtRef,fvExtArea] then
    FVSetFloat(Result,FArgs[0].vRef[0] + 1)
  else
    raise Exception.Create('Argument must be a reference');
end;

function TExcelFunctionEvaluate.DoNA: TFormulaValue;
begin
  FVSetError(Result,errNA);
end;

function TExcelFunctionEvaluate.DoNPV: TFormulaValue;
var
  i: integer;
  Vals: array of double;
begin
  if FVToFloatFV(FValues[0],FValues[0]) then begin
    SetLength(Vals,Length(FValues) - 1);
    for i := 1 to High(FValues) do begin
      if not FVToFloat(FValues[i],Vals[i - 1]) then begin
        FVSetError(Result,errValue);
        Exit;
      end;
    end;
    FVSetFloat(Result,NetPresentValue(FValues[0].vFloat,Vals,ptEndOfPeriod));
  end;
end;

function TExcelFunctionEvaluate.DoSTDEV: TFormulaValue;
var
  i: integer;
  Vals: array of double;
begin
  SetLength(Vals,Length(FValues));
  for i := 0 to High(FValues) do begin
    if not FVToFloat(FValues[i],Vals[i]) then begin
      FVSetError(Result,errValue);
      Exit;
    end;
  end;
  FVSetFloat(Result,StdDev(Vals));
end;

function TExcelFunctionEvaluate.DoAND: TFormulaValue;
var
  i: integer;
  B: boolean;
begin
  B := True;
  for i := 0 to High(FValues) do begin
    if not FVToBoolFV(FValues[i],Result) then
      Exit;
    if not Result.vBoolean then
      B := False;
  end;
  FVSetBoolean(Result,B);
end;

function TExcelFunctionEvaluate.DoOR: TFormulaValue;
var
  i: integer;
  B: boolean;
begin
  B := False;
  for i := 0 to High(FValues) do begin
    if not FVToBoolFV(FValues[i],Result) then
      Exit;
    if Result.vBoolean then
      B := True;
  end;
  FVSetBoolean(Result,B);
end;

function TExcelFunctionEvaluate.DoNOT: TFormulaValue;
begin
  if FVToBoolFV(FValues[0],Result) then
    Result.vBoolean := not Result.vBoolean;
end;

function TExcelFunctionEvaluate.DoMOD: TFormulaValue;
var
  Number,Divisor: double;
begin
  if not FVToFloat(FValues[0],Number) or not FVToFloat(FValues[1],Divisor) then begin
    FVSetError(Result,errValue);
  end;
  if Divisor = 0 then
    FVSetError(Result,errDiv0)
  else
    FVSetFloat(Result,Number - Divisor * Int(Number / Divisor));
end;

function TExcelFunctionEvaluate.DoDOLLAR: TFormulaValue;
begin
  if not MakeFloat(FValues,High(FValues)) then
    FVSetError(Result,errValue)
  else if Length(FValues) > 1 then
    FVSetString(Result,Format('%.*m',[Integer(Round(FValues[1].vFloat)),FValues[0].vFloat]))
  else
{$ifdef OLD_COMPILER}
    FVSetString(Result,Format('%m',[FValues[0].vFloat]));
{$else}
    FVSetString(Result,Format('%m',[RoundTo(FValues[0].vFloat,-CurrencyDecimals)]));
{$endif}
end;

function TExcelFunctionEvaluate.DoFIXED: TFormulaValue;
var
  Decimals: integer;
  S: string;
begin
  if not MakeFloat(FValues,1) then
    FVSetError(Result,errValue)
  else if (Length(FValues) = 3) and (FValues[2].ValType <> fvBoolean) then
    FVSetError(Result,errValue)
  else begin
    if Length(FValues) >= 2 then
      Decimals := Round(FValues[1].vFloat)
    else
      Decimals := 2;
    if (Length(FValues) = 3) and FValues[2].vBoolean then
      S := '%.*f'
    else
      S := '%.*n';
    FVSetString(Result,Format(S,[Decimals,FValues[0].vFloat]));
  end;
end;

function TExcelFunctionEvaluate.DoISNUMBER: TFormulaValue;
var
  i: integer;
begin
  FVSetBoolean(Result,True);
  for i := 0 to High(FValues) do begin
    if FValues[i].ValType <> fvFloat then begin
      FVSetBoolean(Result,False);
      Break;
    end;
  end;
end;

function TExcelFunctionEvaluate.DoCONCATENATE: TFormulaValue;
var
  i: integer;
  S: WideString;
  FV: TFormulaValue;
begin
  S := '';
  for i := 0 to High(FValues) do begin
    if FVToStrFV(FValues[i],FV) then
      S := S + FV.vString
    else begin
      S := FV.vString;
      Break;
    end;
  end;
  FVSetString(Result,S);
end;

end.
