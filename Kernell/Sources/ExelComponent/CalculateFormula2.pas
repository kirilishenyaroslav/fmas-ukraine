unit CalculateFormula2;

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
     XLSReadWriteII2, Cell2, XLSVarStack2, XLSFuncEval2;

function CalculateFmla(XLS: TXLSReadWriteII2; Buf: Pointer; Len: integer; ACol,ARow,ASheetIndex: integer; Options: TCalculateOptions; NowCalc: TCellRefArray): TFormulaValue;

implementation

function CalculateFmla(XLS: TXLSReadWriteII2; Buf: Pointer; Len: integer; ACol,ARow,ASheetIndex: integer; Options: TCalculateOptions; NowCalc: TCellRefArray): TFormulaValue;
var
  i,j,C,R: integer;
  varRef: TFormulaValue;
  P,pArray: Pointer;
  B,O: byte;
  S: WideString;
  VStack: TExcelFunctionEvaluate;
  InSheet: boolean;

function GetArray: string;
var
  i,j: integer;
begin
  Result := '';
  C := PPTGArray(pArray).Cols;
  R := PPTGArray(pArray).Rows;
  pArray := Pointer(Integer(pArray) + 3);
  for i := 0 to C do begin
    Result := Result + '{';
    for j := 0 to R do begin
      if TArrayFloat(pArray^).ID = 1 then begin
        Result := Result + FloatToStr(TArrayFloat(pArray^).Value) + ';';
        pArray := Pointer(Integer(pArray) + 9);
      end
      else if TArrayString(pArray^).ID = 2 then begin
        Result := Result + '"' + ByteStrToWideString(@TArrayString(pArray^).Data,TArrayString(pArray^).Len) + '"' + ';';
        pArray := Pointer(Integer(pArray) + TArrayString(pArray^).Len + 4);
      end
      else
        Result := 'Bad element ID#' + IntToStr(TArrayFloat(pArray^).ID) + ' in array';
    end;
  end;
end;

procedure DecodeArea7(Cin: byte; Rin: word; var Cout,Rout: integer);
begin
  if (Rin and $8000) = 0 then
    Rout := Smallint(Rin and $FF)
  else
    Rout := ARow + Shortint(Rin);
  if (Rin and $4000) = 0 then
    Cout := Cin
  else
    Cout := ACol + Shortint(Cin);
end;

procedure DecodeArea8(Cin,Rin: integer; var Cout,Rout: integer);
begin
  if (Cin and $4000) = 0 then
    Cout := Shortint(Cin and $FF)
  else
    Cout := ACol + Shortint(Cin and $FF);
  if (Cin and $8000) = 0 then
    Rout := Rin
  else
    Rout := ARow + Smallint(Rin);
end;

begin
{
  for i := 0 to High(NowCalc) do begin
    if (NowCalc[i].Col = ACol) and (NowCalc[i].Row = ARow) then
      raise Exception.Create('Circular calculation. Initiade by cell ' + ColRowToRefStr(NowCalc[0].Col,NowCalc[0].Row,False,False));
  end;
}
  Result.vError := errError;
  InSheet := False;
  VStack := TExcelFunctionEvaluate.Create(XLS,ASheetIndex);
  P := Buf;
  pArray := Pointer(Integer(P) + Len);
  while (Integer(P) - Integer(Buf)) < Len do begin
    case Byte(P^) of
      0: Break;
      ptgExp:
      begin
        asm inc P end;
        raise Exception.Create('Illegal ptg in formula');
      end;
      ptgAdd,ptgSub,ptgMul,ptgDiv,ptgPower,ptgConcat,ptgLT,ptgLE,ptgEQ,ptgGE,
      ptgGT,ptgNE,ptgIsect,ptgUnion,ptgRange,ptgUplus,ptgUminus,ptgPercent:
      begin
        VStack.Operator(Byte(P^));
        P := Pointer(Integer(P) + 1);
      end;
      ptgParen:
      begin
        asm inc P end;
      end;
      ptgMissArg:
      begin
        asm inc P end;
        VStack.Push;
      end;
      ptgStr:
      begin
        asm inc P end;
        B := Byte(P^);
        SetLength(S,B);
        asm inc P end;
        O := Byte(P^);
        S := ByteStrToWideString(P,B);
        if (O and $01) = $01 then
          P := Pointer(Integer(P) + B * 2 + 1)
        else
          P := Pointer(Integer(P) + B + 1);
        VStack.Push(S);
{
        if XLS.Version >= xvExcel97 then
          asm inc P end;
}
      end;
      ptgAttr:
      begin
        asm inc P end;
        if (Byte(P^) and $04) = $04 then begin
          asm inc P end;
          P := Pointer(Integer(P) + (Word(P^) + 2) * SizeOf(word) - 3);
        end
        else if (Byte(P^) and $10) = $10 then
          VStack.DoFunction(Integer(fiSum),1,ACol,ARow);
        if XLS.Version < xvExcel30 then
          asm add P,2 end
        else
          asm add P,3 end;
      end;
      ptgSheet:
      begin
        InSheet := True;
        asm add P,11 end;
      end;
      ptgEndSheet:
      begin
        InSheet := False;
        asm add P,5 end;
      end;
      ptgErr:
      begin
        asm inc P end;
        VStack.Push(ErrorCodeToText(Byte(P^)));
        asm inc P end;
      end;
      ptgBool:
      begin
        asm inc P end;
        if Byte(P^) = 0 then
          VStack.Push(False)
        else
          VStack.Push(True);
        asm inc P end;
      end;
      ptgInt:
      begin
        asm inc P end;
        VStack.Push(Word(P^));
        asm add P,2 end;
      end;
      ptgNum:
      begin
        asm inc P end;
        VStack.Push(Double(P^));
        asm add P,8 end;
      end;
      ptgRef,ptgRefV,ptgRefA:
      begin
        asm inc P end;
        if XLS.Version < xvExcel97 then with PPTGRef7(P)^ do begin
          VStack.Push(XLS.Sheets[ASheetIndex].AsFloat[Col,Row and $3FFF]);
          P := Pointer(Integer(P) + SizeOf(TPTGRef7));
        end
        else with PPTGRef8(P)^ do begin
          if not (coNotCalcDependent in Options) and (XLS.Sheets[ASheetIndex].CellType[Col and $3FFF,Row] in TFormulaCellType) and not TFormulaCell(XLS.Sheets[ASheetIndex].Cell[Col and $3FFF,Row]).Calculated then begin
            SetLength(NowCalc,Length(NowCalc) + 1);
            NowCalc[High(NowCalc)].Col := ACol;
            NowCalc[High(NowCalc)].Row := ARow;
            VStack.Push(XLS.Sheets[ASheetIndex].XCalculate(Col and $3FFF,Row,NowCalc));
          end
          else
            VStack.PushRef(Col and $3FFF,Row);
          P := Pointer(Integer(P) + SizeOf(TPTGRef8));
        end;
      end;
      ptgRefN,ptgRefNV,ptgRefNA:
      begin
        asm inc P end;
        if XLS.Version < xvExcel97 then with PPTGRef7(P)^ do begin
          DecodeArea7(Col,Row,C,R);
          VStack.PushRef(C,R);
          P := Pointer(Integer(P) + SizeOf(TPTGRef7));
        end
        else with PPTGRef8(P)^ do begin
          DecodeArea8(Col,Row,C,R);
          VStack.PushRef(C,R);
          P := Pointer(Integer(P) + SizeOf(TPTGRef8));
        end;
      end;
      ptgArea,ptgAreaV,ptgAreaA:
      begin
        asm inc P end;
        if XLS.Version < xvExcel97 then with PPTGArea7(P)^ do begin
          VStack.PushArea(Col1,Row1 and $3FFF,Col2,Row2 and $3FFF);
          P := Pointer(Integer(P) + SizeOf(TPTGArea7));
        end
        else with PPTGArea8(P)^ do begin
          VStack.PushArea(Col1 and $3FFF,Row1,Col2 and $3FFF,Row2);
          P := Pointer(Integer(P) + SizeOf(TPTGArea8));
        end;
      end;
      ptgAreaN,ptgAreaNV,ptgAreaNA:
      begin
        asm inc P end;
        if XLS.Version < xvExcel97 then with PPTGArea7(P)^ do begin
          DecodeArea7(Col1,Row1,C,R);
          varRef.vArea[0] := C;
          varRef.vArea[1] := R;
          DecodeArea7(Col2,Row2,C,R);
          varRef.vArea[2] := C;
          varRef.vArea[3] := R;
        end
        else with PPTGArea8(P)^ do begin
          DecodeArea8(Col1,Row1,C,R);
          varRef.vArea[0] := C;
          varRef.vArea[1] := R;
          DecodeArea8(Col2,Row2,C,R);
          varRef.vArea[2] := C;
          varRef.vArea[3] := R;
        end;
        VStack.Push(varRef);
      end;
      ptgRefErr,ptgRefErrV,ptgRefErrA:
      begin
        asm add P,4 end;
        if XLS.Version >= xvExcel97 then
          asm inc P end;
        VStack.Push('#REF!');
      end;
      ptgAreaErr,ptgAreaErrV,ptgAreaErrA:
      begin
        asm add P,7 end;
        if XLS.Version >= xvExcel97 then
          asm add P,2 end;
        VStack.Push('#REF!');
      end;
      ptgName,ptgNameV,ptgNameA:
      begin
        asm inc P end;
        if XLS.Version < xvExcel50 then with PPTGName7(P)^ do begin
          if InSheet then
            VStack.Push('[EXTERNNAME]' { XLS.ExternNames[NameIndex] } )
          else
            VStack.Push('[NAME]' { XLS.Names[NameIndex] } );
          P := Pointer(Integer(P) + SizeOf(TPTGName7) - 4);
        end
        else if XLS.Version < xvExcel97 then with PPTGName7(P)^ do begin
          raise Exception.Create('XXX ptgName');
{
          with XLS.NameDefs.WorkbookNames[NameIndex - 1] do
            VStack.Push(CalculateFmla(XLS,NameDef,NameDefLen,ACol,ARow,ASheetIndex));
}
          P := Pointer(Integer(P) + SizeOf(TPTGName7));
        end
        else with PPTGName8(P)^ do begin
          with XLS.InternalNames[NameIndex - 1] do begin
{
            SetLength(NowCalc,Length(NowCalc) + 1);
            NowCalc[High(NowCalc)].Col := ACol;
            NowCalc[High(NowCalc)].Row := ARow;
}
            if (XLS.InternalNames[NameIndex - 1].NameOptions and ($0002 + $0008)) <> 0 then
              VStack.Push(Name)
            else
              VStack.Push(CalculateFmla(XLS,NameDef,Length(NameDef),ACol,ARow,ASheetIndex,Options,NowCalc));
          end;
          P := Pointer(Integer(P) + SizeOf(TPTGName8));
        end;
      end;
      ptgNameX,ptgNameXV,ptgNameXA:
      begin
        asm inc P end;
        if XLS.Version < xvExcel97 then with PPTGNameX7(P)^ do begin
          VStack.Push(XLS.FormulaHandler.GetName(ntExternName,ExtSheet,NameIndex,0,0));
          P := Pointer(Integer(P) + SizeOf(TPTGNameX7));
        end
        else with PPTGNameX8(P)^ do begin
          i := XLS.FormulaHandler.ExternalNames.IsSelf(ExtSheet);
          if i >= 0 then begin

            with XLS.InternalNames[NameIndex - 1] do begin
              VStack.Push(CalculateFmla(XLS,NameDef,NameDefLen,ACol,ARow,ASheetIndex,Options,NowCalc));
{
              if NameIsCell then
                VStack.Push(XLS.Sheets[i].AsString[Col1,Row1])
              else if NameIsArea(False) then
                VStack.PushArea(Col1,Row1,Col2,Row2);
}
            end;

          end
          else
            VStack.Push(XLS.GetExternNameValue(ExtSheet,NameIndex));
          P := Pointer(Integer(P) + SizeOf(TPTGNameX8));
        end;
      end;
      ptgArray,ptgArrayV,ptgArrayA:
      begin
        asm inc P end;
//        P2 := Pointer(Integer(PBuf) + PRecFORMULA(PBuf)^.ParseLen);


//        S := GetArray;
//        Stack.Add(Copy(S,1,Length(S) - 1) + '}');
        P := Pointer(Integer(P) + 7);
      end;
      ptgFunc,ptgFuncV,ptgFuncA:
      begin
        asm inc P end;
        if (XLS.Version >= xvExcel40) and (word(P^) <= High(ExcelFunctions)) then begin
          VStack.DoFunction(word(P^),ExcelFunctions[word(P^)].Min,ACol,ARow);
          asm add P,1 end;
        end
        else if XLS.Version <= xvExcel30 then
          VStack.DoFunction(word(P^),ExcelFunctions[word(P^)].Min,ACol,ARow)
        else begin
          VStack.Push('?<' + IntToStr(Word(P^)) + '>?');
          asm add P,1 end;
        end;
        asm add P,1 end;
      end;
      ptgFuncVar,ptgFuncVarV,ptgFuncVarA:
      begin
        j := 0;
        asm inc P end;
        i := Byte(P^) and $7F;
        asm inc P end;
        if (XLS.Version >= xvExcel50) and (word(P^) <= High(ExcelFunctions)) then
          j := word(P^) and $7FFF
        else if XLS.Version < xvExcel50 then
          j := byte(P^);

        if j = 255 then
          VStack.DoFunction(Integer(fiUserFunc),i,ACol,ARow)
        else
          VStack.DoFunction(j,i,ACol,ARow);

        asm add P,1 end;
        if XLS.Version = xvExcel40 then
          asm add P,1 end;
        if XLS.Version >= xvExcel50 then
          asm add P,1 end;
      end;
      ptgRef3d,ptgRef3dV,ptgRef3dA:
      begin
        i := Byte(P^);
        asm inc P end;
        if XLS.Version >= xvExcel97 then with PPTGRef3d8(P)^ do begin
          i := XLS.FormulaHandler.ExternalNames.IsSelf(Index);
          if i >= $F000 then
            VStack.Push(errRef)
          else
            VStack.PushXRef(Col and $3FFF,Row,i);
          P := Pointer(Integer(P) + SizeOf(TPTGRef3d8));
        end
        else with PPTGRef3d7(P)^ do begin
          if Smallint(Index) >= 0 then
            S := XLS.FormulaHandler.GetName(ntExternSheet,Index,-1,0,0)
          else
            S := '';
          if (IndexFirst = $FFFF) or (IndexLast = $FFFF) then
            S := S + '[DELETED]'
          else if IndexFirst = IndexLast then
            S := S + XLS.Sheets[IndexLast].Name
          else
            S := S + XLS.Sheets[IndexFirst].Name + ':' + XLS.Sheets[IndexLast].Name;
          if i in [ptgRefErr3d,ptgRefErr3dV] then
            VStack.Push(S + '!#REF!')
          else
            VStack.Push(S + '!' + ColRowToRefStr(Col,Row and $3FFF,(Row and $4000) = 0,(Row and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGRef3d7));
        end;
      end;
      ptgRefErr3d,ptgRefErr3dV,ptgRefErr3dA:
        VStack.Push(errRef);
      ptgArea3d,ptgArea3dV,ptgArea3dA:
      begin
        i := Byte(P^);
        asm inc P end;
        if XLS.Version >= xvExcel97 then with PPTGArea3d8(P)^ do begin
          i := XLS.FormulaHandler.ExternalNames.IsSelf(Index);
          if i >= $F000 then
            VStack.Push(errRef)
          else
            VStack.PushXArea(Col1 and $3FFF,Row1,Col2 and $3FFF,Row2,Index);
          P := Pointer(Integer(P) + SizeOf(TPTGArea3d8));
        end
        else with PPTGArea3d7(P)^ do begin
          if Smallint(SheetIndex) >= 0 then
            S := '[EXTERN ???]:'
          else
            S := '';
          if (IndexFirst = $FFFF) or (IndexLast = $FFFF) then
            S := S + '[DELETED]'
          else if IndexFirst = IndexLast then
            S := S + XLS.Sheets[IndexLast].Name
          else
            S := S + XLS.Sheets[IndexFirst].Name + ':' + XLS.Sheets[IndexLast].Name;
          if i in [ptgAreaErr3d,ptgAreaErr3dV] then
            VStack.Push(S + '!#REF!')
          else
            VStack.PushXArea(Col1,Row1 and $3FFF,Col2,Row2 and $3FFF,SheetIndex);
          P := Pointer(Integer(P) + SizeOf(TPTGArea3d7));
        end;
      end;
      ptgAreaErr3d,ptgAreaErr3dV,ptgAreaErr3dA:
        VStack.Push(errRef);
      ptgMemFunc,
      ptgMemFuncV,
      ptgMemFuncA:
        P := Pointer(Integer(P) + 3);
      ptgMemArea,
      ptgMemAreaV,
      ptgMemAreaA:
        P := Pointer(Integer(P) + 7);
      else begin
        VStack.Push(Format('Unknown ptg[%.2X]',[Byte(P^)]));
        Break;
      end;
    end;
  end;
  Result := VStack.Pop;
  if Result.ValType = fvRef then
    Result := XLS.Sheets[ASheetIndex].AsFormulaValue[Result.vRef[0],Result.vRef[1]]
  else if Result.ValType = fvExtRef then
    Result := XLS.Sheets[Result.vExtRef[2]].AsFormulaValue[Result.vExtRef[0],Result.vExtRef[1]];
  VStack.Free;
end;

end.
