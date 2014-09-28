unit DecodeFormula2;

{
********************************************************************************
******* XLSReadWriteII V2.00                                             *******
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
{$R-}
{$H+}

interface

uses SysUtils, Classes, Contnrs, Cell2, BIFFRecsII2, ExcelFuncII2, XLSUtils2;

type TGetNameEvent = function(NameType: TFormulaNameType; SheetIndex,NameIndex,Col,Row: integer): WideString of object;

function  DecodeFmla(Version: TExcelVersion; Buf: Pointer; Len: integer; SheetIndex,ACol,ARow: integer; GetNameMethod: TGetNameEvent): WideString;
procedure ConvertShrFmla(BIFF8: boolean; Buf: Pointer; Len,ACol,ARow: integer);
procedure AdjustCell(BIFF8: boolean; Buf: Pointer; Len,DCol,DRow: integer; LockStartRow,ForceAdjust: Boolean);
procedure AdjustCell2(Buf: Pointer; Len,Col,Row,SheetIndex,DCol,DRow: integer);
function  GetExFormulaSize(Buf: Pointer; Len: integer): integer;

type TAbsoluteRef = (arCol1,arRow1,arCol2,arRow2);
type TAbsoluteRefs = set of TAbsoluteRef;

type TFormulaRef = class(TObject)
private
     FPTG: byte;
     FRef: PByteArray;
     FAbsRef: TAbsoluteRefs;
     FCol1,FRow1: word;
     FCol2,FRow2: word;
     FSheet: integer;

     function GetIsArea: boolean;
public
     constructor Create(Pg: byte; Ref: PByteArray; Abs: TAbsoluteRefs; C1,R1,C2,R2: word; Sht: integer);

     property PTG: byte read FPTG;
     property IsArea: boolean read GetIsArea;
     property AbsRef: TAbsoluteRefs read FAbsRef;
     property Col1: word read FCol1;
     property Row1: word read FRow1;
     property Col2: word read FCol2;
     property Row2: word read FRow2;
     property Sheet: integer read FSheet;
     end;

type TFormulaRefs = class(TObjectList)
private
     FVersion: TExcelVersion;

     function GetItems(Index: integer): TFormulaRef;
     function MakeAbsR(C,R: boolean): TAbsoluteRefs; overload;
     function MakeAbsA(C1,R1,C2,R2: boolean): TAbsoluteRefs; overload;
     procedure Add(Pg: byte; Ref: PByteArray; Abs: TAbsoluteRefs; C1,R1,C2,R2: word; Sht: integer);
     procedure FindRefs(BIFF8: boolean; Buf: Pointer; Len: integer);
public
     constructor Create(Version: TExcelVersion);
     function Find(Formula: TFormulaCell): boolean;
     procedure AdjustRefR1InArea(C1,R1,C2,R2: word; Delta: integer);
     property Items[Index: integer]: TFormulaRef read GetItems; default;
     end;

var
  StrTRUE: string;
  StrFALSE: string;
  FuncArgSeparator: char;

implementation

// There is a warning that is impossible to get rid of here...
{$WARNINGS OFF}
function DecodeFmla(Version: TExcelVersion; Buf: Pointer; Len: integer; SheetIndex,ACol,ARow: integer; GetNameMethod: TGetNameEvent): WideString;
var
  i,C,R: integer;
  P,pArray: Pointer;
  B: byte;
  S: WideString;
  Stack: TStringList;
  InSheet: boolean;

procedure Operator(O: string);
begin
  if Stack.Count < 2 then
    Stack.Add('<Val missing>')
  else begin
    Stack[Stack.Count - 2] := Stack[Stack.Count - 2] + O + Stack[Stack.Count - 1];
    Stack.Delete(Stack.Count - 1);
  end;
  P := Pointer(Integer(P) + 1);
end;

procedure UnaryOperator(O: string);
begin
  if Stack.Count < 1 then
    Stack.Add('<Val missing>')
  else
    Stack[Stack.Count - 1] := O + Stack[Stack.Count - 1];
  P := Pointer(Integer(P) + 1);
end;

function GetArray: WideString;
var
  i,j: integer;
begin
  C := PPTGArray(pArray).Cols;
  R := PPTGArray(pArray).Rows;
  pArray := Pointer(Integer(pArray) + 3);
  for i := 0 to C do begin
    Result := Result + '{';
    for j := 0 to R do begin
      case Byte(pArray^) of
        $00: pArray := Pointer(Integer(pArray) + 9);
        $01: begin
          Result := Result + FloatToStr(TArrayFloat(pArray^).Value) + FuncArgSeparator;
          pArray := Pointer(Integer(pArray) + 9);
        end;
        $02: begin
          Result := Result + '"' + ByteStrToWideString(@TArrayString(pArray^).Data,TArrayString(pArray^).Len) + '"' + FuncArgSeparator;
          pArray := Pointer(Integer(pArray) + TArrayString(pArray^).Len + 4);
        end;
        $04: begin
          pArray := Pointer(Integer(pArray) + 1);
          if Byte(pArray^) = 1 then
            Result := Result + StrTRUE + FuncArgSeparator
          else
            Result := Result + StrFALSE + FuncArgSeparator;
          pArray := Pointer(Integer(pArray) + 8);
        end;
        $10: begin
          pArray := Pointer(Integer(pArray) + 1);
          Result := Result + ErrorCodeToText(Byte(pArray^)) + FuncArgSeparator;
          pArray := Pointer(Integer(pArray) + 8);
        end;
        else
          Result := 'Bad element ID#' + IntToStr(TArrayFloat(pArray^).ID) + ' in array';
      end;
    end;
    Result := Copy(Result,1,Length(Result) - 1) + '}';
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

function GetFuncArgs(Count: integer): string;
var
  i: integer;
begin
  Result := '';
  for i := Count downto 1 do begin
    if (Stack.Count - i) < 0 then
      raise Exception.Create('Function arguments missing');
    Result := Result + Stack[Stack.Count - i] + FuncArgSeparator;
    Stack.Delete(Stack.Count - i);
  end;
  if Count > 0 then
    Result := Copy(Result,1,Length(Result) - 1);
end;


begin
  // The compiler waring "Return value of function 'DecodeFmla might be undefined"
  // is impossible to get rid of.
  // NOTE! Do not try to fix the warning by splitting up this function. It may
  // result in compiler bugs, i.e. some code may not be executed! 
  Result := '';
  InSheet := False;
  Stack := TStringList.Create;
  P := Buf;
  pArray := Pointer(Integer(P) + Len);
  while (Integer(P) - Integer(Buf)) < Len do begin
    case Byte(P^) of
      0: Break;
      ptgExtend: begin
        asm inc P; end;
        case Byte(P^) of
          eptgElfLel:        asm add P,4; end;
          eptgElfRw:         asm add P,4; end;
          eptgElfCol:        asm add P,4; end;
          eptgElfRwV: begin
            asm inc P; end;
            Stack.Add(GetNameMethod(ntCellValue,SheetIndex,-1,PByteArray(P)[2],PWordArray(P)[0]));
            asm add P,3; end;
          end;
          eptgElfColV: begin
            asm inc P; end;
            Stack.Add(GetNameMethod(ntCellValue,SheetIndex,-1,PByteArray(P)[2],PWordArray(P)[0]));
            asm add P,3; end;
          end;
          eptgElfRadical:    asm add P,13; end;
          eptgElfRadicalS:   asm add P,13; end;
          eptgElfRwS:        asm add P,4; end;
          eptgElfColS:       asm add P,4; end;
          eptgElfRwSV:       asm add P,4; end;
          eptgElfColSV:      asm add P,4; end;
          eptgElfRadicalLel: asm add P,4; end;
          eptgSxName:        asm add P,4; end;
          else
            Stack.Add(Format('Unknown eptg[%.2X]',[Byte(P^)]));
        end;
        asm inc P; end;
      end;
      ptgExp:
      begin
        asm inc P; end;
//        Stack.Add('<Shared>');
//        Break;
      end;
      ptgAdd: Operator('+');
      ptgSub: Operator('-');
      ptgMul: Operator('*');
      ptgDiv: Operator('/');
      ptgPower: Operator('^');
      ptgConcat: Operator('&');
      ptgLT: Operator('<');
      ptgLE: Operator('<=');
      ptgEQ: Operator('=');
      ptgGE: Operator('>=');
      ptgGT: Operator('>');
      ptgNE: Operator('<>');
      ptgUnion: Operator(ListSeparator);
      ptgRange: Operator(':');
      ptgUPlus: UnaryOperator('+'); //P := Pointer(Integer(P) + 1);
      ptgUMinus: UnaryOperator('-');
      ptgPercent: begin
        if Stack.Count < 1 then
          Stack.Add('<Val missing>')
        else
          Stack[Stack.Count - 1] := Stack[Stack.Count - 1] + '%';
        P := Pointer(Integer(P) + 1);
      end;
      ptgParen:
      begin
        Stack[Stack.Count - 1] := '(' + Stack[Stack.Count - 1] + ')';
        asm inc P; end;
      end;
      ptgMissArg:
      begin
        asm inc P; end;
        Stack.Add('');
      end;
      ptgStr:
      begin
        asm inc P; end;
        if PByteArray(P)[1] = 0 then begin
          B := Byte(P^);
          SetLength(S,B);
          asm inc P; end;
          S := ByteStrToWideString(P,B);
        end
        else begin
          B := Byte(P^) * 2;
          SetLength(S,B);
          asm inc P; end;
          S := ByteStrToWideString(P,B div 2);
        end;
        P := Pointer(Integer(P) + B);
        Stack.Add('"' + S + '"');
        if Version >= xvExcel97 then
          asm inc P; end;
      end;
      ptgAttr:
      begin
        asm inc P; end;
        if (Byte(P^) and $04) = $04 then begin
          asm inc P; end;
          P := Pointer(Integer(P) + (Word(P^) + 2) * SizeOf(word) - 3);
        end
        else if (Byte(P^) and $10) = $10 then begin
//          CheckNames(Stack.Count - 1);
          Stack[Stack.Count - 1] := 'SUM(' + Stack[Stack.Count - 1] + ')';
        end;
{
        else if (Byte(P^) and $40) = $40 then
          Stack[Stack.Count - 1] := Stack[Stack.Count - 1] + ' ';
}
        if Version < xvExcel30 then
          asm add P,2; end
        else
          asm add P,3; end;
      end;
      ptgSheet:
      begin
        InSheet := True;
        asm add P,11; end;
      end;
      ptgEndSheet:
      begin
        InSheet := False;
        asm add P,5; end;
      end;
      ptgErr:
      begin
        asm inc P; end;
        Stack.Add(ErrorCodeToText(Byte(P^)));
        asm inc P; end;
      end;
      ptgBool:
      begin
        asm inc P; end;
        if Byte(P^) = 0 then
          Stack.Add(StrFALSE)
        else
          Stack.Add(StrTRUE);
        asm inc P; end;
      end;
      ptgInt:
      begin
        asm inc P; end;
        Stack.Add(IntToStr(Word(P^)));
        asm add P,2; end;
      end;
      ptgNum:
      begin
        asm inc P; end;
        Stack.Add(FloatToStr(Double(P^)));
        asm add P,8; end;
      end;
      ptgRef,ptgRefV,ptgRefA:
      begin
        asm inc P; end;
        if Version < xvExcel97 then with PPTGRef7(P)^ do begin
          Stack.Add(ColRowToRefStr(Col,Row and $3FFF,(Row and $4000) = 0,(Row and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGRef7));
        end
        else with PPTGRef8(P)^ do begin
          Stack.Add(ColRowToRefStr(Col and $3FFF,Row,(Col and $4000) = 0,(Col and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGRef8));
        end;
      end;
      ptgRefN,ptgRefNV,ptgRefNA:
      begin
        asm inc P; end;
        if Version < xvExcel97 then with PPTGRef7(P)^ do begin
          DecodeArea7(Col,Row,C,R);
          Stack.Add(ColRowToRefStr(C,R,(Row and $4000) = 0,(Row and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGRef7));
        end
        else with PPTGRef8(P)^ do begin
          DecodeArea8(Col,Row,C,R);
          Stack.Add(ColRowToRefStr(C,R,(Col and $4000) = 0,(Col and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGRef8));
        end;
      end;
      ptgArea,ptgAreaV,ptgAreaA:
      begin
        asm inc P; end;
        if Version < xvExcel97 then with PPTGArea7(P)^ do begin
          Stack.Add(ColRowToRefStr(Col1,Row1 and $3FFF,(Row1 and $4000) = 0,(Row1 and $8000) = 0) + ':' +
                    ColRowToRefStr(Col2,Row2 and $3FFF,(Row2 and $4000) = 0,(Row2 and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGArea7));
        end
        else with PPTGArea8(P)^ do begin
          Stack.Add(ColRowToRefStr(Col1 and $3FFF,Row1,(Col1 and $4000) = 0,(Col1 and $8000) = 0) + ':' +
                    ColRowToRefStr(Col2 and $3FFF,Row2,(Col2 and $4000) = 0,(Col2 and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGArea8));
        end;
      end;
      ptgAreaN,ptgAreaNV,ptgAreaNA:
      begin
        asm inc P; end;
        if Version < xvExcel97 then with PPTGArea7(P)^ do begin
          DecodeArea7(Col1,Row1,C,R);
          S := ColRowToRefStr(C,R,(Row1 and $4000) = 0,(Row1 and $8000) = 0);
          DecodeArea7(Col2,Row2,C,R);
          Stack.Add(S + ':' + ColRowToRefStr(C,R,(Row2 and $4000) = 0,(Row2 and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGArea7));
        end
        else with PPTGArea8(P)^ do begin
          DecodeArea8(Col1,Row1,C,R);
          S := ColRowToRefStr(C,R,(Col1 and $4000) = 0,(Col1 and $8000) = 0);
          DecodeArea8(Col2,Row2,C,R);
          Stack.Add(S + ':' + ColRowToRefStr(C,R,(Col2 and $4000) = 0,(Col2 and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGArea8));
        end;
      end;
      ptgRefErr,ptgRefErrV,ptgRefErrA:
      begin
        asm add P,4; end;
        if Version >= xvExcel97 then
          asm inc P; end;
        Stack.Add('#REF!');
      end;
      ptgAreaErr,ptgAreaErrV,ptgAreaErrA:
      begin
        asm add P,7; end;
        if Version >= xvExcel97 then
          asm add P,2; end;
        Stack.Add('#REF!');
      end;
      ptgName,ptgNameV,ptgNameA:
      begin
        asm inc P; end;
        if Version < xvExcel50 then with PPTGName7(P)^ do begin
          if InSheet then
            Stack.Add('[EXTERNNAME]' { XLS.ExternNames[NameIndex] } )
          else
            Stack.Add('[NAME]' { XLS.Names[NameIndex] } );
          P := Pointer(Integer(P) + SizeOf(TPTGName7) - 4);
        end
        else if Version < xvExcel97 then with PPTGName7(P)^ do begin
          Stack.Add(GetNameMethod(ntName,-1,NameIndex,0,0));
          P := Pointer(Integer(P) + SizeOf(TPTGName7));
        end
        else with PPTGName8(P)^ do begin
          if Assigned(GetNameMethod) then
            Stack.Add(GetNameMethod(ntName,-1,NameIndex,0,0))
          else
            Stack.Add('[EXTERNNAME]');
          P := Pointer(Integer(P) + SizeOf(TPTGName8));
        end;
      end;
      ptgNameX,ptgNameXV,ptgNameXA:
      begin
        asm inc P; end;
        if Version < xvExcel97 then with PPTGNameX7(P)^ do begin
          Stack.Add(GetNameMethod(ntExternName,ExtSheet,NameIndex,0,0));
          P := Pointer(Integer(P) + SizeOf(TPTGNameX7));
        end
        else with PPTGNameX8(P)^ do begin
          if Assigned(GetNameMethod) then
            S := GetNameMethod(ntExternSheet,ExtSheet,NameIndex,0,0)
          else
            S := '[EXTERNNAME X]';
          Stack.Add(S);
          P := Pointer(Integer(P) + SizeOf(TPTGNameX8));
        end;
      end;
{
      ptgNameV:
      begin
        asm inc P; end;
        with PPTGName(P)^ do
          Stack.Add(FNames[ExtIndex - 1]);
        P := Pointer(Integer(P) + SizeOf(TPTGName));
      end;
}
      ptgArray,ptgArrayV,ptgArrayA:
      begin
        asm inc P; end;
//        P2 := Pointer(Integer(PBuf) + PRecFORMULA(PBuf)^.ParseLen);
        Stack.Add(GetArray);
        P := Pointer(Integer(P) + 7);
      end;
      ptgFunc,ptgFuncV,ptgFuncA:
      begin
        asm inc P; end;
        if (Version >= xvExcel40) and (word(P^) <= High(ExcelFunctions)) then begin
          Stack.Add(ExcelFunctions[word(P^)].Name + '(' + GetFuncArgs(ExcelFunctions[word(P^)].Min) + ')');
          asm add P,1; end;
        end
        else if Version <= xvExcel30 then
          Stack.Add(ExcelFunctions[byte(P^)].Name + '(' + GetFuncArgs(ExcelFunctions[byte(P^)].Min) + ')')
        else begin
          Stack.Add('?<' + IntToStr(Word(P^)) + '>?' + '(' + GetFuncArgs(1) + ')');
          asm add P,1; end;
        end;
        asm add P,1; end;
      end;
      ptgFuncVar,ptgFuncVarV,ptgFuncVarA:
      begin
        asm inc P; end;
        i := Byte(P^) and $7F;
        asm inc P; end;
        S := '1';
        if (Version >= xvExcel50) and (word(P^) <= High(ExcelFunctions)) then
          S := ExcelFunctions[word(P^) and $7FFF].Name
        else if Version < xvExcel50 then
          S := ExcelFunctions[byte(P^)].Name;
        if (S[1] >= '0') and (S[1] <= '9') then begin
          S := Stack[Stack.Count - i];
          Stack.Delete(Stack.Count - i);
          Dec(i);
        end;
        Stack.Add(S + '(' + GetFuncArgs(i) + ')');
        asm add P,1; end;
        if Version = xvExcel40 then
          asm add P,1; end;
        if Version >= xvExcel50 then
          asm add P,1; end;
      end;
      ptgRef3d,ptgRef3dV,ptgRef3dA,ptgRefErr3d,ptgRefErr3dV,ptgRefErr3dA:
      begin
        i := Byte(P^);
        asm inc P; end;
        if Version >= xvExcel97 then with PPTGRef3d8(P)^ do begin
          if Assigned(GetNameMethod) then
            S := GetNameMethod(ntExternSheet,Index,-1,0,0)
          else
            S := '[ExternSheet]';
          if i in [ptgRefErr3d,ptgRefErr3dV] then
            Stack.Add(S + '!#REF!')
          else
            Stack.Add(S + ColRowToRefStr(Col and $3FFF,Row,(Col and $4000) = 0,(Col and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGRef3d8));
        end
        else with PPTGRef3d7(P)^ do begin
          if Smallint(Index) >= 0 then begin
            S := GetNameMethod(ntExternSheet,Index,-1,0,0)
          end
          else
            S := '';
          if (IndexFirst = $FFFF) or (IndexLast = $FFFF) then
            S := S + '[DELETED]'
          else if IndexFirst = IndexLast then begin
            S := S + GetNameMethod(ntCurrBook,IndexLast,-1,0,0)
          end
          else begin
            S := S + GetNameMethod(ntCurrBook,IndexFirst,-1,0,0) + ':' + GetNameMethod(ntCurrBook,IndexLast,-1,0,0)
          end;
          if i in [ptgRefErr3d,ptgRefErr3dV] then
            Stack.Add(S + '!#REF!')
          else
            Stack.Add(S + '!' + ColRowToRefStr(Col,Row and $3FFF,(Row and $4000) = 0,(Row and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGRef3d7));
        end;
      end;
      ptgArea3d,ptgArea3dV,ptgArea3dA,ptgAreaErr3d,ptgAreaErr3dV,ptgAreaErr3dA:
      begin
        i := Byte(P^);
        P := Pointer(Integer(P) + 1);
        // Compiler bugg? add P,1 don't works.
//        asm add P,1; end;
        if Version >= xvExcel97 then with PPTGArea3d8(P)^ do begin
          if Assigned(GetNameMethod) then
            S := GetNameMethod(ntExternSheet,Index,-1,0,0)
          else
            S := '[ExternSheet]';
          if i in [ptgAreaErr3d,ptgAreaErr3dV] then
            Stack.Add(S + '!#REF!')
          else
            Stack.Add(S + ColRowToRefStr(Col1 and $3FFF,Row1,(Col1 and $4000) = 0,(Col1 and $8000) = 0) + ':' +
                          ColRowToRefStr(Col2 and $3FFF,Row2,(Col2 and $4000) = 0,(Col2 and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGArea3d8));
        end
        else with PPTGArea3d7(P)^ do begin
          if Smallint(SheetIndex) >= 0 then
            S := '[EXTERN ???]:'
          else
            S := '';
          if (IndexFirst = $FFFF) or (IndexLast = $FFFF) then
            S := S + '[DELETED]'
          else if IndexFirst = IndexLast then begin
            S := S + GetNameMethod(ntCurrBook,IndexLast,-1,0,0)
          end
          else begin
            S := S + GetNameMethod(ntCurrBook,IndexFirst,-1,0,0) + ':' + GetNameMethod(ntCurrBook,IndexLast,-1,0,0)
          end;
          if i in [ptgAreaErr3d,ptgAreaErr3dV] then
            Stack.Add(S + '!#REF!')
          else
            Stack.Add(S + '!' + ColRowToRefStr(Col1,Row1 and $3FFF,(Row1 and $4000) = 0,(Row1 and $8000) = 0) + ':' +
                                ColRowToRefStr(Col2,Row2 and $3FFF,(Row2 and $4000) = 0,(Row2 and $8000) = 0));
          P := Pointer(Integer(P) + SizeOf(TPTGArea3d7));
        end;
      end;
      ptgMemFunc,ptgMemFuncV,ptgMemFuncA: begin
        P := Pointer(Integer(P) + 3);
{
        asm inc P; end;
        W := Word(P^);
        P := Pointer(Integer(P) + 2 + W);
}
      end;
      ptgMemArea     {26} ,
      ptgMemAreaV    {46} ,
      ptgMemAreaA    {66} : begin
        P := Pointer(Integer(P) + 7);
      end;
      else begin
        Stack.Add(Format('Unknown ptg[%.2X]',[Byte(P^)]));
        Break;
      end;
    end;
  end;
  if Stack.Count < 1 then
    Result := '[ERROR]'
  else
    Result := Stack[Stack.Count - 1];
  Stack.Free;
end;
{$WARNINGS ON}

procedure AdjustCell(BIFF8: boolean; Buf: Pointer; Len,DCol,DRow: integer; LockStartRow,ForceAdjust : Boolean);
var
  V,C1,R1,C2,R2: integer;
  Ok: boolean;
  P,P2: PByteArray;
begin
  P := Buf;
  while (Integer(P) - Integer(Buf)) < Len do begin
    case P[0] of
      ptgExp         {01} : V := 1;
      ptgTbl         {02} : V := 5;
      ptgAdd         {03} : V := 1;
      ptgSub         {04} : V := 1;
      ptgMul         {05} : V := 1;
      ptgDiv         {06} : V := 1;
      ptgPower       {07} : V := 1;
      ptgConcat      {08} : V := 1;
      ptgLT          {09} : V := 1;
      ptgLE          {0A} : V := 1;
      ptgEQ          {0B} : V := 1;
      ptgGE          {0C} : V := 1;
      ptgGT          {0D} : V := 1;
      ptgNE          {0E} : V := 1;
      ptgIsect       {0F} : V := 1;
      ptgUnion       {10} : V := 1;
      ptgRange       {11} : V := 1;
      ptgUplus       {12} : V := 1;
      ptgUminus      {13} : V := 1;
      ptgPercent     {14} : V := 1;
      ptgParen       {15} : V := 1;
      ptgMissArg     {16} : V := 1;
      ptgStr         {17} : begin
        asm inc P; end;
        if BIFF8 then begin
          if PByteArray(P)[1] = 0 then
            V := PByteArray(P)[0] + 2
          else
            V := (PByteArray(P)[0] * 2) + 2;
        end
        else
          V := PByteArray(P)[0] + 1;
      end;
      ptgAttr        {19} : begin
        asm inc P; end;

        if P[0] = $04 then begin
          asm inc P; end;
          V := (Word(Pointer(P)^) + 1) * SizeOf(word) + 2;
        end
        else
          V := 3;
      end;
      ptgSheet       {1A} : V := 1;
      ptgEndSheet    {1B} : V := 1;
      ptgErr         {1C} : V := 2;
      ptgBool        {1D} : V := 2;
      ptgInt         {1E} : V := 3;
      ptgNum         {1F} : V := 9;

      ptgArray       {20} ,
      ptgArrayV      {40} ,
      ptgArrayA      {60} : V := 8;

      ptgFunc        {21} ,
      ptgFuncV       {41} ,
      ptgFuncA       {61} : V := 3;

      ptgFuncVar     {22} ,
      ptgFuncVarV    {42} ,
      ptgFuncVarA    {62} : V := 4;

      ptgName        {23} ,
      ptgNameV       {43} ,
      ptgNameA       {63} : if BIFF8 then V := 5 else V := 15;

      ptgRef         {24} ,
      ptgRefV        {44} ,
      ptgRefA        {64} ,
      ptgRefN        {2C} ,
      ptgRefNV       {4C} ,
      ptgRefNA       {6C} : begin
                              P2 := P;
                              P := Pointer(Integer(P) + 1);
                              if BIFF8 then begin
                                C1 := PPTGRef8(P).Col and $3FFF;
                                R1 := PPTGRef8(P).Row;
                                if ForceAdjust or ((PPTGRef8(P).Col and $8000) = $8000) then
                                  If not LockStartRow Then
                                    R1 := PPTGRef8(P).Row + DRow
                                  else
                                    R1 := PPTGRef8(P).Row;
                                if ForceAdjust or ((PPTGRef8(P).Col and $4000) = $4000) then
                                  C1 := (PPTGRef8(P).Col and $3FFF) + DCol;
                                Ok := (C1 >= 0) and (C1 <= $FF) and (R1 >= 0) and (R1 <= $FFFF);
                                if Ok then begin
                                  PPTGRef8(P).Col := (PPTGRef8(P).Col and $C000) + C1;
                                  PPTGRef8(P).Row := R1;
                                end
                                else
                                  P2[0] := (P2[0] and $F0) + $0A;
                                V := 4;
                              end
                              else begin
                                C1 := PPTGRef7(P).Col;
                                R1 := PPTGRef7(P).Row;
                                if ForceAdjust or ((PPTGRef7(P).Row and $8000) = $8000) then
                                  C1 := PPTGRef7(P).Col + DCol;
                                if ForceAdjust or ((PPTGRef7(P).Row and $4000) = $4000) then
                                  If not LockStartRow Then
                                    R1 := (PPTGRef7(P).Row and $3FFF) + DRow
                                  else
                                    R1 := (PPTGRef7(P).Row and $3FFF);
                                Ok := (C1 >= 0) and (C1 <= $FF) and (R1 >= 0) and (R1 <= $3FFF);
                                if Ok then begin
                                  PPTGRef7(P).Col := C1;
                                  PPTGRef7(P).Row := (PPTGRef7(P).Row and $C000) + R1;
                                end
                                else
                                  P2[0] := (P2[0] and $F0) + $0A;
                                V := 3;
                              end;
                            end;

      ptgRefErr      {2A} ,
      ptgRefErrV     {4A} ,
      ptgRefErrA     {6A} : if BIFF8 then V := 5 else V := 4;

      ptgArea        {25} ,
      ptgAreaV       {45} ,
      ptgAreaA       {65} ,
      ptgAreaN       {2D} ,
      ptgAreaNV      {4D} ,
      ptgAreaNA      {6D} : begin
                              P2 := P;
                              P := Pointer(Integer(P) + 1);
                              if BIFF8 then begin
                                C1 := PPTGArea8(P).Col1 and $3FFF;
                                R1 := PPTGArea8(P).Row1;
                                C2 := PPTGArea8(P).Col2 and $3FFF;
                                R2 := PPTGArea8(P).Row2;
                                if ForceAdjust or ((PPTGArea8(P).Col1 and $8000) = $8000) then
                                  If not LockStartRow Then
                                    R1 := PPTGArea8(P).Row1 + DRow
                                  else
                                    R1 := PPTGArea8(P).Row1;
                                if ForceAdjust or ((PPTGArea8(P).Col1 and $4000) = $4000) then
                                  C1 := (PPTGArea8(P).Col1 and $3FFF) + DCol;
                                if ForceAdjust or ((PPTGArea8(P).Col2 and $8000) = $8000) then
                                  R2 := PPTGArea8(P).Row2 + DRow;
                                if ForceAdjust or ((PPTGArea8(P).Col2 and $4000) = $4000) then
                                  C2 := (PPTGArea8(P).Col2 and $3FFF) + DCol;
                                Ok := (C1 >= 0) and (C1 <= $FF) and (R1 >= 0) and (R1 <= $FFFF) and
                                      (C2 >= 0) and (C2 <= $FF) and (R2 >= 0) and (R2 <= $FFFF);
                                if Ok then begin
                                  PPTGArea8(P).Col1 := (PPTGArea8(P).Col1 and $C000) + C1;
                                  PPTGArea8(P).Row1 := R1;
                                  PPTGArea8(P).Col2 := (PPTGArea8(P).Col2 and $C000) + C2;
                                  PPTGArea8(P).Row2 := R2;
                                end
                                else
                                  P2[0] := (P2[0] and $F0) + $0B;
                                V := 8;
                              end
                              else begin
                                C1 := PPTGArea7(P).Col1;
                                R1 := PPTGArea7(P).Row1;
                                C2 := PPTGArea7(P).Col2;
                                R2 := PPTGArea7(P).Row2;
                                if ForceAdjust or ((PPTGArea7(P).Row1 and $8000) = $8000) then
                                  C1 := PPTGArea7(P).Col1 + DCol;
                                if ForceAdjust or ((PPTGArea7(P).Row1 and $4000) = $4000) then
                                  If not LockStartRow Then
                                    R1 := (PPTGArea7(P).Row1 and $3FFF) + DRow
                                  else
                                    R1 := (PPTGArea7(P).Row1 and $3FFF);
                                if ForceAdjust or ((PPTGArea7(P).Row2 and $8000) = $8000) then
                                  C2 := PPTGArea7(P).Col2 + DCol;
                                if ForceAdjust or ((PPTGArea7(P).Row2 and $4000) = $4000) then
                                  R2 := (PPTGArea7(P).Row2 and $3FFF) + DRow;
                                Ok := (C1 >= 0) and (C1 <= $FF) and (R1 >= 0) and (R1 <= $3FFF) and
                                      (C2 >= 0) and (C2 <= $FF) and (R2 >= 0) and (R2 <= $3FFF);
                                if Ok then begin
                                  PPTGArea7(P).Col1 := C1;
                                  PPTGArea7(P).Row1 := (PPTGArea7(P).Row1 and $C000) + R1;
                                  PPTGArea7(P).Col2 := C2;
                                  PPTGArea7(P).Row2 := (PPTGArea7(P).Row2 and $C000) + R2;
                                end
                                else
                                  P2[0] := (P2[0] and $F0) + $0B;
                                V := 6;
                              end;
                            end;

      ptgAreaErr     {2B} ,
      ptgAreaErrV    {4B} ,
      ptgAreaErrA    {6B} : if BIFF8 then V := 9 else V := 7;

      ptgMemArea     {26} ,
      ptgMemAreaV    {46} ,
      ptgMemAreaA    {66} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemAreaN    {2E} ,
      ptgMemAreaNV   {4E} ,
      ptgMemAreaNA   {6E} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgMemErr      {27} ,
      ptgMemErrV     {47} ,
      ptgMemErrA     {67} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemNoMem    {28} ,
      ptgMemNoMemV   {48} ,
      ptgMemNoMemA   {68} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemNoMemN   {2F} ,
      ptgMemNoMemNV  {4F} ,
      ptgMemNoMemNA  {6F} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgMemFunc     {29} ,
      ptgMemFuncV    {49} ,
      ptgMemFuncA    {69} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgNameX       {39} ,
      ptgNameXV      {59} ,
      ptgNameXA      {79} : if BIFF8 then V := 5 else V := 25;

      ptgRef3d       {3A} ,
      ptgRef3dV      {5A} ,
      ptgRef3dA      {7A} : begin
                              P2 := P;
                              P := Pointer(Integer(P) + 1);
                              if BIFF8 then begin
                                C1 := PPTGRef3d8(P).Col and $3FFF;
                                R1 := PPTGRef3d8(P).Row;
                                if ForceAdjust or ((PPTGRef3d8(P).Col and $8000) = $8000) then
                                  If not LockStartRow Then
                                    R1 := PPTGRef3d8(P).Row + DRow
                                  else
                                    R1 := PPTGRef3d8(P).Row;
                                if ForceAdjust or ((PPTGRef3d8(P).Col and $4000) = $4000) then
                                  C1 := (PPTGRef3d8(P).Col and $3FFF) + DCol;
                                Ok := (C1 >= 0) and (C1 <= $FF) and (R1 >= 0) and (R1 <= $FFFF);
                                if Ok then begin
                                  PPTGRef3d8(P).Col := (PPTGRef3d8(P).Col and $C000) + C1;
                                  PPTGRef3d8(P).Row := R1;
                                end
                                else
                                  P2[0] := (P2[0] and $F0) + $0C;
                                V := 6;
                              end
                              else begin
                                C1 := PPTGRef3d7(P).Col;
                                R1 := PPTGRef3d7(P).Row;
                                if ForceAdjust or ((PPTGRef3d7(P).Row and $8000) = $8000) then
                                  C1 := PPTGRef3d7(P).Col + DCol;
                                if ForceAdjust or ((PPTGRef3d7(P).Row and $4000) = $4000) then
                                  If not LockStartRow Then
                                    R1 := (PPTGRef3d7(P).Row and $3FFF) + DRow
                                  else
                                    R1 := (PPTGRef3d7(P).Row and $3FFF);
                                Ok := (C1 >= 0) and (C1 <= $FF) and (R1 >= 0) and (R1 <= $3FFF);
                                if Ok then begin
                                  PPTGRef3d7(P).Col := C1;
                                  PPTGRef3d7(P).Row := (PPTGRef3d7(P).Row and $C000) + R1;
                                end
                                else
                                  P2[0] := (P2[0] and $F0) + $0C;
                                V := 16;
                              end;
                            end;

      ptgRefErr3d    {3C} ,
      ptgRefErr3dV   {5C} ,
      ptgRefErr3dA   {7C} : if BIFF8 then V := 7 else V := 17;

      ptgArea3d      {3B} ,
      ptgArea3dV     {5B} ,
      ptgArea3dA     {7B} : begin
                              P2 := P;
                              P := Pointer(Integer(P) + 1);
                              if BIFF8 then begin
                                C1 := PPTGArea3d8(P).Col1 and $3FFF;
                                R1 := PPTGArea3d8(P).Row1;
                                C2 := PPTGArea3d8(P).Col2 and $3FFF;
                                R2 := PPTGArea3d8(P).Row2;
                                if ForceAdjust or ((PPTGArea3d8(P).Col1 and $8000) = $8000) then
                                  If not LockStartRow Then
                                    R1 := PPTGArea3d8(P).Row1 + DRow
                                  else
                                    R1 := PPTGArea3d8(P).Row1;
                                if ForceAdjust or ((PPTGArea3d8(P).Col1 and $4000) = $4000) then
                                  C1 := (PPTGArea3d8(P).Col1 and $3FFF) + DCol;
                                if ForceAdjust or ((PPTGArea3d8(P).Col2 and $8000) = $8000) then
                                  R2 := PPTGArea3d8(P).Row2 + DRow;
                                if ForceAdjust or ((PPTGArea3d8(P).Col2 and $4000) = $4000) then
                                  C2 := (PPTGArea3d8(P).Col2 and $3FFF) + DCol;
                                Ok := (C1 >= 0) and (C1 <= $FF) and (R1 >= 0) and (R1 <= $FFFF) and
                                      (C2 >= 0) and (C2 <= $FF) and (R2 >= 0) and (R2 <= $FFFF);
                                if Ok then begin
                                  PPTGArea3d8(P).Col1 := (PPTGArea3d8(P).Col1 and $C000) + C1;
                                  PPTGArea3d8(P).Row1 := R1;
                                  PPTGArea3d8(P).Col2 := (PPTGArea3d8(P).Col2 and $C000) + C2;
                                  PPTGArea3d8(P).Row2 := R2;
                                end
                                else
                                  P2[0] := (P2[0] and $F0) + $0D;
                                V := 10;
                              end
                              else begin
                                C1 := PPTGArea3d7(P).Col1;
                                R1 := PPTGArea3d7(P).Row1;
                                C2 := PPTGArea3d7(P).Col2;
                                R2 := PPTGArea3d7(P).Row2;
                                if ForceAdjust or ((PPTGArea3d7(P).Row1 and $8000) = $8000) then
                                  C1 := PPTGArea3d7(P).Col1 + DCol;
                                if ForceAdjust or ((PPTGArea3d7(P).Row1 and $4000) = $4000) then
                                  If not LockStartRow Then
                                    R1 := (PPTGArea3d7(P).Row1 and $3FFF) + DRow
                                  else
                                    R1 := (PPTGArea3d7(P).Row1 and $3FFF);
                                if ForceAdjust or ((PPTGArea3d7(P).Row2 and $8000) = $8000) then
                                  C2 := PPTGArea3d7(P).Col2 + DCol;
                                if ForceAdjust or ((PPTGArea3d7(P).Row2 and $4000) = $4000) then
                                  R2 := (PPTGArea3d7(P).Row2 and $3FFF) + DRow;
                                Ok := (C1 >= 0) and (C1 <= $FF) and (R1 >= 0) and (R1 <= $3FFF) and
                                      (C2 >= 0) and (C2 <= $FF) and (R2 >= 0) and (R2 <= $3FFF);
                                if Ok then begin
                                  PPTGArea3d7(P).Col1 := C1;
                                  PPTGArea3d7(P).Row1 := (PPTGArea3d7(P).Row1 and $C000) + R1;
                                  PPTGArea3d7(P).Col2 := C2;
                                  PPTGArea3d7(P).Row2 := (PPTGArea3d7(P).Row2 and $C000) + R2;
                                end
                                else
                                  P2[0] := (P2[0] and $F0) + $0D;
                                V := 20;
                              end;
                            end;

      ptgAreaErr3d   {3D} ,
      ptgAreaErr3dV  {5D} ,
      ptgAreaErr3dA  {7D} : if BIFF8 then V := 11 else V := 21;

      ptgFuncCEV     {58} : V := 3; // Not sure how to handle these.
      ptgFuncCEA     {78} : V := 3;
      else
        raise Exception.CreateFmt('Unknown ptg[%.2X] in AdjustCell',[P[0]]);
//        V := 1;
    end;
    P := Pointer(Integer(P) + V);
  end;
end;

procedure AdjustCell2(Buf: Pointer; Len,Col,Row,SheetIndex,DCol,DRow: integer);
var
  V,C1,R1,C2,R2: integer;
  Ok: boolean;
  P,P2: PByteArray;
begin
  P := Buf;
  while (Integer(P) - Integer(Buf)) < Len do begin
    case P[0] of
      ptgTbl         {02} : V := 5;
      ptgStr         {17} : begin
        asm inc P; end;
        if PByteArray(P)[1] = 0 then
          V := PByteArray(P)[0] + 2
        else
          V := (PByteArray(P)[0] * 2) + 2;
      end;
      ptgAttr        {19} : begin
        asm inc P; end;

        if P[0] = $04 then begin
          asm inc P; end;
          V := (Word(Pointer(P)^) + 1) * SizeOf(word) + 2;
        end
        else
          V := 3;
      end;
      ptgErr         {1C} : V := 2;
      ptgBool        {1D} : V := 2;
      ptgInt         {1E} : V := 3;
      ptgNum         {1F} : V := 9;

      ptgArray       {20} ,
      ptgArrayV      {40} ,
      ptgArrayA      {60} : V := 8;

      ptgFunc        {21} ,
      ptgFuncV       {41} ,
      ptgFuncA       {61} : V := 4;

      ptgFuncVar     {22} ,
      ptgFuncVarV    {42} ,
      ptgFuncVarA    {62} : V := 5;

      ptgName        {23} ,
      ptgNameV       {43} ,
      ptgNameA       {63} : V := 5;

      ptgRef         {24} ,
      ptgRefV        {44} ,
      ptgRefA        {64} ,
      ptgRefN        {2C} ,
      ptgRefNV       {4C} ,
      ptgRefNA       {6C} : begin
                              P2 := P;
                              P := Pointer(Integer(P) + 1);
                              C1 := PPTGRef8(P).Col and $3FFF;
                              R1 := PPTGRef8(P).Row;
                              if ((PPTGRef8(P).Col and $8000) = $8000) and (R1 >= Row) then
                                Inc(R1,DRow);
                              if ((PPTGRef8(P).Col and $4000) = $4000) and (C1 >= Col) then
                                Inc(C1,DCol);
                              Ok := (C1 >= 0) and (C1 <= $FF) and (R1 >= 0) and (R1 <= $FFFF);
                              if Ok then begin
                                PPTGRef8(P).Col := (PPTGRef8(P).Col and $C000) + C1;
                                PPTGRef8(P).Row := R1;
                              end
                              else
                                P2[0] := (P2[0] and $F0) + $0A;
                              V := 4;
                            end;

      ptgRefErr      {2A} ,
      ptgRefErrV     {4A} ,
      ptgRefErrA     {6A} : V := 5;

      ptgArea        {25} ,
      ptgAreaV       {45} ,
      ptgAreaA       {65} ,
      ptgAreaN       {2D} ,
      ptgAreaNV      {4D} ,
      ptgAreaNA      {6D} : begin
                              P2 := P;
                              P := Pointer(Integer(P) + 1);
                              C1 := PPTGArea8(P).Col1 and $3FFF;
                              R1 := PPTGArea8(P).Row1;
                              C2 := PPTGArea8(P).Col2 and $3FFF;
                              R2 := PPTGArea8(P).Row2;
                              if ((PPTGArea8(P).Col1 and $8000) = $8000) and (R1 >= Row) then
                                Inc(R1,DRow);
                              if ((PPTGArea8(P).Col1 and $4000) = $4000) and (C1 >= Col) then
                                Inc(C1,DCol);
                              if ((PPTGArea8(P).Col2 and $8000) = $8000) and (R2 >= Row) then
                                Inc(R2,DRow);
                              if ((PPTGArea8(P).Col2 and $4000) = $4000) and (C2 >= Col) then
                                Inc(C2,DCol);
                              Ok := (C1 >= 0) and (C1 <= $FF) and (R1 >= 0) and (R1 <= $FFFF) and
                                    (C2 >= 0) and (C2 <= $FF) and (R2 >= 0) and (R2 <= $FFFF);
                              if Ok then begin
                                PPTGArea8(P).Col1 := (PPTGArea8(P).Col1 and $C000) + C1;
                                PPTGArea8(P).Row1 := R1;
                                PPTGArea8(P).Col2 := (PPTGArea8(P).Col2 and $C000) + C2;
                                PPTGArea8(P).Row2 := R2;
                              end
                              else
                                P2[0] := (P2[0] and $F0) + $0B;
                              V := 8;
                            end;

      ptgAreaErr     {2B} ,
      ptgAreaErrV    {4B} ,
      ptgAreaErrA    {6B} : V := 9;

      ptgMemArea     {26} ,
      ptgMemAreaV    {46} ,
      ptgMemAreaA    {66} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemAreaN    {2E} ,
      ptgMemAreaNV   {4E} ,
      ptgMemAreaNA   {6E} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgMemErr      {27} ,
      ptgMemErrV     {47} ,
      ptgMemErrA     {67} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemNoMem    {28} ,
      ptgMemNoMemV   {48} ,
      ptgMemNoMemA   {68} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemNoMemN   {2F} ,
      ptgMemNoMemNV  {4F} ,
      ptgMemNoMemNA  {6F} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgMemFunc     {29} ,
      ptgMemFuncV    {49} ,
      ptgMemFuncA    {69} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgNameX       {39} ,
      ptgNameXV      {59} ,
      ptgNameXA      {79} : V := 7;

      ptgRef3d       {3A} ,
      ptgRef3dV      {5A} ,
      ptgRef3dA      {7A} : begin
//                              P2 := P;
                              P := Pointer(Integer(P) + 1);
{
                              C1 := PPTGRef3d8(P).Col and $3FFF;
                              R1 := PPTGRef3d8(P).Row;
                              if ForceAdjust or ((PPTGRef3d8(P).Col and $8000) = $8000) then
                                If not LockStartRow Then
                                  R1 := PPTGRef3d8(P).Row + DRow
                                else
                                  R1 := PPTGRef3d8(P).Row;
                              if ForceAdjust or ((PPTGRef3d8(P).Col and $4000) = $4000) then
                                C1 := (PPTGRef3d8(P).Col and $3FFF) + DCol;
                              Ok := (C1 >= 0) and (C1 <= $FF) and (R1 >= 0) and (R1 <= $FFFF);
                              if Ok then begin
                                PPTGRef3d8(P).Col := (PPTGRef3d8(P).Col and $C000) + C1;
                                PPTGRef3d8(P).Row := R1;
                              end
                              else
                                P2[0] := (P2[0] and $F0) + $0C;
}
                              V := 6;
                            end;

      ptgRefErr3d    {3C} ,
      ptgRefErr3dV   {5C} ,
      ptgRefErr3dA   {7C} : V := 7;

      ptgArea3d      {3B} ,
      ptgArea3dV     {5B} ,
      ptgArea3dA     {7B} : begin
//                              P2 := P;
                              P := Pointer(Integer(P) + 1);
{
                              C1 := PPTGArea3d8(P).Col1 and $3FFF;
                              R1 := PPTGArea3d8(P).Row1;
                              C2 := PPTGArea3d8(P).Col2 and $3FFF;
                              R2 := PPTGArea3d8(P).Row2;
                              if ForceAdjust or ((PPTGArea3d8(P).Col1 and $8000) = $8000) then
                                If not LockStartRow Then
                                  R1 := PPTGArea3d8(P).Row1 + DRow
                                else
                                  R1 := PPTGArea3d8(P).Row1;
                              if ForceAdjust or ((PPTGArea3d8(P).Col1 and $4000) = $4000) then
                                C1 := (PPTGArea3d8(P).Col1 and $3FFF) + DCol;
                              if ForceAdjust or ((PPTGArea3d8(P).Col2 and $8000) = $8000) then
                                R2 := PPTGArea3d8(P).Row2 + DRow;
                              if ForceAdjust or ((PPTGArea3d8(P).Col2 and $4000) = $4000) then
                                C2 := (PPTGArea3d8(P).Col2 and $3FFF) + DCol;
                              Ok := (C1 >= 0) and (C1 <= $FF) and (R1 >= 0) and (R1 <= $FFFF) and
                                    (C2 >= 0) and (C2 <= $FF) and (R2 >= 0) and (R2 <= $FFFF);
                              if Ok then begin
                                PPTGArea3d8(P).Col1 := (PPTGArea3d8(P).Col1 and $C000) + C1;
                                PPTGArea3d8(P).Row1 := R1;
                                PPTGArea3d8(P).Col2 := (PPTGArea3d8(P).Col2 and $C000) + C2;
                                PPTGArea3d8(P).Row2 := R2;
                              end
                              else
                                P2[0] := (P2[0] and $F0) + $0D;
}                                
                              V := 10;
                            end;

      ptgAreaErr3d   {3D} ,
      ptgAreaErr3dV  {5D} ,
      ptgAreaErr3dA  {7D} : V := 11;

      ptgFuncCEV     {58} : V := 3; // Not sure how to handle these.
      ptgFuncCEA     {78} : V := 3;
      else
//        raise Exception.CreateFmt('Unknown ptg[%.2X] in AdjustCell',[P[0]]);
        V := 1;
    end;
    P := Pointer(Integer(P) + V);
  end;
end;

procedure ConvertShrFmla(BIFF8: boolean; Buf: Pointer; Len,ACol,ARow: integer);
var
  V,C,R: integer;
  P: Pointer;

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
  P := Buf;
  while (Integer(P) - Integer(Buf)) < Len do begin
    case Byte(P^) of
      ptgExp         {01} : V := 1;
      ptgTbl         {02} : V := 5;
      ptgAdd         {03} : V := 1;
      ptgSub         {04} : V := 1;
      ptgMul         {05} : V := 1;
      ptgDiv         {06} : V := 1;
      ptgPower       {07} : V := 1;
      ptgConcat      {08} : V := 1;
      ptgLT          {09} : V := 1;
      ptgLE          {0A} : V := 1;
      ptgEQ          {0B} : V := 1;
      ptgGE          {0C} : V := 1;
      ptgGT          {0D} : V := 1;
      ptgNE          {0E} : V := 1;
      ptgIsect       {0F} : V := 1;
      ptgUnion       {10} : V := 1;
      ptgRange       {11} : V := 1;
      ptgUplus       {12} : V := 1;
      ptgUminus      {13} : V := 1;
      ptgPercent     {14} : V := 1;
      ptgParen       {15} : V := 1;
      ptgMissArg     {16} : V := 1;
      ptgStr         {17} : begin
        asm inc P; end;
        if BIFF8 then begin
          if PByteArray(P)[1] = 0 then
            V := PByteArray(P)[0] + 2
          else
            V := (PByteArray(P)[0] * 2) + 2;
        end
        else
          V := PByteArray(P)[0] + 1;
      end;
      ptgAttr        {19} : begin
        asm inc P; end;

        if Byte(P^) = $04 then begin
          asm inc P; end;
          V := (Word(P^) + 1) * SizeOf(word) + 2;
        end
        else
          V := 3;
      end;
      ptgSheet       {1A} : V := 1;
      ptgEndSheet    {1B} : V := 1;
      ptgErr         {1C} : V := 2;
      ptgBool        {1D} : V := 2;
      ptgInt         {1E} : V := 3;
      ptgNum         {1F} : V := 9;

      ptgArray       {20} ,
      ptgArrayV      {40} ,
      ptgArrayA      {60} : V := 8;

      ptgFunc        {21} ,
      ptgFuncV       {41} ,
      ptgFuncA       {61} : V := 3;

      ptgFuncVar     {22} ,
      ptgFuncVarV    {42} ,
      ptgFuncVarA    {62} : V := 4;

      ptgName        {23} ,
      ptgNameV       {43} ,
      ptgNameA       {63} : if BIFF8 then V := 5 else V := 15;

      ptgRef         {24} ,
      ptgRefV        {44} ,
      ptgRefA        {64} : if BIFF8 then V := 5 else V := 4;

      ptgArea        {25} ,
      ptgAreaV       {45} ,
      ptgAreaA       {65} : if BIFF8 then V := 9 else V := 7;

      ptgMemArea     {26} ,
      ptgMemAreaV    {46} ,
      ptgMemAreaA    {66} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemAreaN    {2E} ,
      ptgMemAreaNV   {4E} ,
      ptgMemAreaNA   {6E} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgMemErr      {27} ,
      ptgMemErrV     {47} ,
      ptgMemErrA     {67} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemNoMem    {28} ,
      ptgMemNoMemV   {48} ,
      ptgMemNoMemA   {68} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemNoMemN   {2F} ,
      ptgMemNoMemNV  {4F} ,
      ptgMemNoMemNA  {6F} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgMemFunc     {29} ,
      ptgMemFuncV    {49} ,
      ptgMemFuncA    {69} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgRefErr      {2A} ,
      ptgRefErrV     {4A} ,
      ptgRefErrA     {6A} : if BIFF8 then V := 5 else V := 4;

      ptgAreaErr     {2B} ,
      ptgAreaErrV    {4B} ,
      ptgAreaErrA    {6B} : if BIFF8 then V := 9 else V := 7;

      ptgRefN,       {2C}
      ptgRefNV,      {4C}
      ptgRefNA       {6C} : begin
        case Byte(P^) of
          ptgRefN:  Byte(P^) := ptgRef;
          ptgRefNV: Byte(P^) := ptgRefV;
          ptgRefNA: Byte(P^) := ptgRefA;
        end;
        asm inc P; end;
        if BIFF8 then begin
          DecodeArea8(PPTGRef8(P).Col,PPTGRef8(P).Row,C,R);
          PPTGRef8(P).Row := R;
          PPTGRef8(P).Col := (PPTGRef8(P).Col and $C000) + C;
          V := SizeOf(TPTGRef8);
        end
        else begin
          DecodeArea7(PPTGRef7(P).Col,PPTGRef7(P).Row,C,R);
          PPTGRef7(P).Row := (PPTGRef7(P).Row and $C000) + R;
          PPTGRef7(P).Col := C;
          V := SizeOf(TPTGRef7);
        end;
      end;
      ptgAreaN,      {2D}
      ptgAreaNV,     {4D}
      ptgAreaNA      {6D} : begin
        case Byte(P^) of
          ptgAreaN:  Byte(P^) := ptgArea;
          ptgAreaNV: Byte(P^) := ptgAreaV;
          ptgAreaNA: Byte(P^) := ptgAreaA;
        end;
        asm inc P; end;
        if BIFF8 then begin
          DecodeArea8(PPTGArea8(P).Col1,PPTGArea8(P).Row1,C,R);
          PPTGArea8(P).Row1 := R;
          PPTGArea8(P).Col1 := (PPTGArea8(P).Col1 and $C000) + C;

          DecodeArea8(PPTGArea8(P).Col2,PPTGArea8(P).Row2,C,R);
          PPTGArea8(P).Row2 := R;
          PPTGArea8(P).Col2 := (PPTGArea8(P).Col2 and $C000) + C;
          V := SizeOf(TPTGArea8);
        end
        else begin
          DecodeArea7(PPTGArea7(P).Col1,PPTGArea7(P).Row1,C,R);
          PPTGArea7(P).Row1 := (PPTGArea7(P).Row1 and $C000) + R;
          PPTGArea7(P).Col1 := C;

          DecodeArea7(PPTGArea7(P).Col2,PPTGArea7(P).Row2,C,R);
          PPTGArea7(P).Row2 := (PPTGArea7(P).Row2 and $C000) + R;
          PPTGArea7(P).Col2 := C;
          V := SizeOf(TPTGArea7);
        end;
      end;

      ptgNameX       {39} ,
      ptgNameXV      {59} ,
      ptgNameXA      {79} : if BIFF8 then V := 7 else V := 25;

      ptgRef3d       {3A} ,
      ptgRef3dV      {5A} ,
      ptgRef3dA      {7A} : if BIFF8 then V := 7 else V := 17;

      ptgArea3d      {3B} ,
      ptgArea3dV     {5B} ,
      ptgArea3dA     {7B} : if BIFF8 then V := 11 else V := 21;

      ptgRefErr3d    {3C} ,
      ptgRefErr3dV   {5C} ,
      ptgRefErr3dA   {7C} : if BIFF8 then V := 7 else V := 17;

      ptgAreaErr3d   {3D} ,
      ptgAreaErr3dV  {5D} ,
      ptgAreaErr3dA  {7D} : if BIFF8 then V := 11 else V := 21;

      ptgFuncCEV     {58} : V := 3; // Not sure how to handle these.
      ptgFuncCEA     {78} : V := 3;
      else
        raise Exception.CreateFmt('Unknown ptg[%.2X] in Shared Formula',[Byte(P^)]);
//        V := 1;
    end;
    P := Pointer(Integer(P) + V);
  end;
end;

function GetExFormulaSize(Buf: Pointer; Len: integer): integer;
var
  P: Pointer;
  V: integer;

procedure GetArraySize;
var
  P2: Pointer;
  L: integer;
  Col,Row: integer;
  Cols,Rows: integer;
begin
  P2 := Pointer(Integer(Buf) + Len + Result);
  Cols := Byte(P2^) + 1;
  asm inc P2; end;
  Rows := Word(P2^) + 1;
  asm add P2,2; end;
  for Row := 1 to Rows do begin
    for Col := 1 to Cols do begin
      if Byte(P2^) = $02 then begin
        asm inc P2; end;
        L := Word(P2^);
        asm add P2,2; end;
        if Byte(P2^) = $01 then
          P2 := Pointer(Integer(P2) + L * 2 + 1)
        else
          P2 := Pointer(Integer(P2) + L + 1);
      end
      else
        asm add P2,9; end;
    end;
  end;
  Inc(Result,Integer(P2) - (Integer(Buf) + Len));
end;

begin
  Result := 0;
  P := Buf;
  while (Integer(P) - Integer(Buf)) < Len do begin
    case Byte(P^) of
      ptgExp         {01} : V := 1;
      ptgTbl         {02} : V := 5;
      ptgAdd         {03} : V := 1;
      ptgSub         {04} : V := 1;
      ptgMul         {05} : V := 1;
      ptgDiv         {06} : V := 1;
      ptgPower       {07} : V := 1;
      ptgConcat      {08} : V := 1;
      ptgLT          {09} : V := 1;
      ptgLE          {0A} : V := 1;
      ptgEQ          {0B} : V := 1;
      ptgGE          {0C} : V := 1;
      ptgGT          {0D} : V := 1;
      ptgNE          {0E} : V := 1;
      ptgIsect       {0F} : V := 1;
      ptgUnion       {10} : V := 1;
      ptgRange       {11} : V := 1;
      ptgUplus       {12} : V := 1;
      ptgUminus      {13} : V := 1;
      ptgPercent     {14} : V := 1;
      ptgParen       {15} : V := 1;
      ptgMissArg     {16} : V := 1;
      ptgStr         {17} : begin
        asm inc P; end;
        if PByteArray(P)[1] = 0 then
          V := PByteArray(P)[0] + 2
        else
          V := (PByteArray(P)[0] * 2) + 2;
      end;
      ptgAttr        {19} : begin
        asm inc P; end;

        if Byte(P^) = $04 then begin
          asm inc P; end;
          V := (Word(P^) + 1) * SizeOf(word) + 2;
        end
        else
          V := 3;
      end;
      ptgSheet       {1A} : V := 1;
      ptgEndSheet    {1B} : V := 1;
      ptgErr         {1C} : V := 2;
      ptgBool        {1D} : V := 2;
      ptgInt         {1E} : V := 3;
      ptgNum         {1F} : V := 9;

      ptgArray       {20} ,
      ptgArrayV      {40} ,
      ptgArrayA      {60} : begin
        V := 8;
        GetArraySize;
      end;

      ptgFunc        {21} ,
      ptgFuncV       {41} ,
      ptgFuncA       {61} : V := 3;

      ptgFuncVar     {22} ,
      ptgFuncVarV    {42} ,
      ptgFuncVarA    {62} : V := 4;

      ptgName        {23} ,
      ptgNameV       {43} ,
      ptgNameA       {63} : V := 5;

      ptgRef         {24} ,
      ptgRefV        {44} ,
      ptgRefA        {64} : V := 5;

      ptgArea        {25} ,
      ptgAreaV       {45} ,
      ptgAreaA       {65} : V := 9;

      ptgMemArea     {26} ,
      ptgMemAreaV    {46} ,
      ptgMemAreaA    {66} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemAreaN    {2E} ,
      ptgMemAreaNV   {4E} ,
      ptgMemAreaNA   {6E} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgMemErr      {27} ,
      ptgMemErrV     {47} ,
      ptgMemErrA     {67} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemNoMem    {28} ,
      ptgMemNoMemV   {48} ,
      ptgMemNoMemA   {68} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemNoMemN   {2F} ,
      ptgMemNoMemNV  {4F} ,
      ptgMemNoMemNA  {6F} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgMemFunc     {29} ,
      ptgMemFuncV    {49} ,
      ptgMemFuncA    {69} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgRefErr      {2A} ,
      ptgRefErrV     {4A} ,
      ptgRefErrA     {6A} : V := 5;

      ptgAreaErr     {2B} ,
      ptgAreaErrV    {4B} ,
      ptgAreaErrA    {6B} : V := 9;

      ptgRefN,       {2C}
      ptgRefNV,      {4C}
      ptgRefNA       {6C} : V := SizeOf(TPTGRef8) + 1;
      ptgAreaN,      {2D}
      ptgAreaNV,     {4D}
      ptgAreaNA      {6D} : V := SizeOf(TPTGArea8) + 1;

      ptgNameX       {39} ,
      ptgNameXV      {59} ,
      ptgNameXA      {79} : V := 7;

      ptgRef3d       {3A} ,
      ptgRef3dV      {5A} ,
      ptgRef3dA      {7A} : V := 7;

      ptgArea3d      {3B} ,
      ptgArea3dV     {5B} ,
      ptgArea3dA     {7B} : V := 11;

      ptgRefErr3d    {3C} ,
      ptgRefErr3dV   {5C} ,
      ptgRefErr3dA   {7C} : V := 7;

      ptgAreaErr3d   {3D} ,
      ptgAreaErr3dV  {5D} ,
      ptgAreaErr3dA  {7D} : V := 11;

      ptgFuncCEV     {58} : V := 3; // Not sure how to handle these.
      ptgFuncCEA     {78} : V := 3;
      else
        raise Exception.CreateFmt('Unknown ptg[%.2X] in Shared Formula',[Byte(P^)]);
//        V := 1;
    end;
    P := Pointer(Integer(P) + V);
  end;
end;

{ TFormulaRef }

constructor TFormulaRef.Create(Pg: byte; Ref: PByteArray; Abs: TAbsoluteRefs; C1, R1, C2, R2: word; Sht: integer);
begin
  FPTG := Pg;
  FRef := Ref;
  FAbsRef := Abs;
  FCol1 := C1;
  FRow1 := R1;
  FCol2 := C2;
  FRow2 := R2;
  FSheet := Sht
end;

function TFormulaRef.GetIsArea: boolean;
begin
  Result := FPTG in [ptgArea,ptgArea3d];
end;

{ TFormulaRefs }

procedure TFormulaRefs.Add(Pg: byte; Ref: PByteArray; Abs: TAbsoluteRefs; C1, R1, C2, R2: word; Sht: integer);
var
  FmlaRef: TFormulaRef;
begin
  FmlaRef := TFormulaRef.Create(Pg,Ref,Abs,C1,R1,C2,R2,Sht);
  inherited Add(FmlaRef);
end;

procedure TFormulaRefs.FindRefs(BIFF8: boolean; Buf: Pointer; Len: integer);
var
  V,C1,R1,C2,R2: integer;
  P: PByteArray;
begin
  P := Buf;
  while (Integer(P) - Integer(Buf)) < Len do begin
    case P[0] of
      ptgExp         {01} : V := 1;
      ptgTbl         {02} : V := 5;
      ptgAdd         {03} : V := 1;
      ptgSub         {04} : V := 1;
      ptgMul         {05} : V := 1;
      ptgDiv         {06} : V := 1;
      ptgPower       {07} : V := 1;
      ptgConcat      {08} : V := 1;
      ptgLT          {09} : V := 1;
      ptgLE          {0A} : V := 1;
      ptgEQ          {0B} : V := 1;
      ptgGE          {0C} : V := 1;
      ptgGT          {0D} : V := 1;
      ptgNE          {0E} : V := 1;
      ptgIsect       {0F} : V := 1;
      ptgUnion       {10} : V := 1;
      ptgRange       {11} : V := 1;
      ptgUplus       {12} : V := 1;
      ptgUminus      {13} : V := 1;
      ptgPercent     {14} : V := 1;
      ptgParen       {15} : V := 1;
      ptgMissArg     {16} : V := 1;
      ptgStr         {17} : begin
        asm inc P; end;
        if BIFF8 then begin
          if PByteArray(P)[1] = 0 then
            V := PByteArray(P)[0] + 2
          else
            V := (PByteArray(P)[0] * 2) + 2;
        end
        else
          V := PByteArray(P)[0] + 1;
      end;
      ptgAttr        {19} : begin
        asm inc P; end;

        if P[0] = $04 then begin
          asm inc P; end;
          V := (Word(Pointer(P)^) + 1) * SizeOf(word) + 2;
        end
        else
          V := 3;
      end;
      ptgSheet       {1A} : V := 1;
      ptgEndSheet    {1B} : V := 1;
      ptgErr         {1C} : V := 2;
      ptgBool        {1D} : V := 2;
      ptgInt         {1E} : V := 3;
      ptgNum         {1F} : V := 9;

      ptgArray       {20} ,
      ptgArrayV      {40} ,
      ptgArrayA      {60} : V := 8;

      ptgFunc        {21} ,
      ptgFuncV       {41} ,
      ptgFuncA       {61} : V := 3;

      ptgFuncVar     {22} ,
      ptgFuncVarV    {42} ,
      ptgFuncVarA    {62} : V := 4;

      ptgName        {23} ,
      ptgNameV       {43} ,
      ptgNameA       {63} : if BIFF8 then V := 5 else V := 15;

      ptgRef         {24} ,
      ptgRefV        {44} ,
      ptgRefA        {64} ,
      ptgRefN        {2C} ,
      ptgRefNV       {4C} ,
      ptgRefNA       {6C} : begin
                              P := Pointer(Integer(P) + 1);
                              if BIFF8 then begin
                                C1 := PPTGRef8(P).Col and $3FFF;
                                R1 := PPTGRef8(P).Row;
                                Add(ptgRef,P,MakeAbsR((PPTGRef8(P).Col and $8000) <> $8000,(PPTGRef8(P).Col and $4000) <> $4000),C1,R1,C1,R1,-1);
                                V := 4;
                              end
                              else begin
                                C1 := PPTGRef7(P).Col;
                                R1 := PPTGRef7(P).Row;
                                Add(ptgRef,P,MakeAbsR((PPTGRef8(P).Row and $8000) <> $8000,(PPTGRef8(P).Row and $4000) <> $4000),C1,R1,C1,R1,-1);
                                V := 3;
                              end;
                            end;

      ptgRefErr      {2A} ,
      ptgRefErrV     {4A} ,
      ptgRefErrA     {6A} : if BIFF8 then V := 5 else V := 4;

      ptgArea        {25} ,
      ptgAreaV       {45} ,
      ptgAreaA       {65} ,
      ptgAreaN       {2D} ,
      ptgAreaNV      {4D} ,
      ptgAreaNA      {6D} : begin
                              P := Pointer(Integer(P) + 1);
                              if BIFF8 then begin
                                C1 := PPTGArea8(P).Col1 and $3FFF;
                                R1 := PPTGArea8(P).Row1;
                                C2 := PPTGArea8(P).Col2 and $3FFF;
                                R2 := PPTGArea8(P).Row2;
                                Add(ptgArea,P,MakeAbsA((PPTGArea8(P).Col1 and $8000) <> $8000,(PPTGArea8(P).Col1 and $4000) <> $4000,(PPTGArea8(P).Col2 and $8000) <> $8000,(PPTGArea8(P).Col2 and $4000) <> $4000),C1,R1,C2,R2,-1);
                                V := 8;
                              end
                              else begin
                                C1 := PPTGArea7(P).Col1;
                                R1 := PPTGArea7(P).Row1;
                                C2 := PPTGArea7(P).Col2;
                                R2 := PPTGArea7(P).Row2;
                                Add(ptgArea,P,MakeAbsA((PPTGArea7(P).Row1 and $8000) <> $8000,(PPTGArea7(P).Row1 and $4000) <> $4000,(PPTGArea7(P).Row2 and $8000) <> $8000,(PPTGArea7(P).Row2 and $4000) <> $4000),C1,R1,C2,R2,-1);
                                V := 6;
                              end;
                            end;

      ptgAreaErr     {2B} ,
      ptgAreaErrV    {4B} ,
      ptgAreaErrA    {6B} : if BIFF8 then V := 9 else V := 7;

      ptgMemArea     {26} ,
      ptgMemAreaV    {46} ,
      ptgMemAreaA    {66} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemAreaN    {2E} ,
      ptgMemAreaNV   {4E} ,
      ptgMemAreaNA   {6E} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgMemErr      {27} ,
      ptgMemErrV     {47} ,
      ptgMemErrA     {67} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemNoMem    {28} ,
      ptgMemNoMemV   {48} ,
      ptgMemNoMemA   {68} : V := Word(Pointer(Integer(P) + 1)^) + 7;

      ptgMemNoMemN   {2F} ,
      ptgMemNoMemNV  {4F} ,
      ptgMemNoMemNA  {6F} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgMemFunc     {29} ,
      ptgMemFuncV    {49} ,
      ptgMemFuncA    {69} : V := Word(Pointer(Integer(P) + 1)^) + 3;

      ptgNameX       {39} ,
      ptgNameXV      {59} ,
      ptgNameXA      {79} : if BIFF8 then V := 7 else V := 25;

      ptgRef3d       {3A} ,
      ptgRef3dV      {5A} ,
      ptgRef3dA      {7A} : begin
                              P := Pointer(Integer(P) + 1);
                              if BIFF8 then begin
                                C1 := PPTGRef3d8(P).Col and $3FFF;
                                R1 := PPTGRef3d8(P).Row;
                                Add(ptgRef3d,P,MakeAbsR((PPTGRef3d8(P).Col and $8000) <> $8000,(PPTGRef3d8(P).Col and $4000) <> $4000),C1,R1,C1,R1,PPTGRef3d8(P).Index);
                                V := 6;
                              end
                              else begin
                                C1 := PPTGRef3d7(P).Col;
                                R1 := PPTGRef3d7(P).Row;
                                Add(ptgRef3d,P,MakeAbsR((PPTGRef3d7(P).Row and $8000) <> $8000,(PPTGRef3d7(P).Row and $4000) <> $4000),C1,R1,C1,R1,PPTGRef3d7(P).Index);
                                V := 16;
                              end;
                            end;

      ptgRefErr3d    {3C} ,
      ptgRefErr3dV   {5C} ,
      ptgRefErr3dA   {7C} : if BIFF8 then V := 7 else V := 17;

      ptgArea3d      {3B} ,
      ptgArea3dV     {5B} ,
      ptgArea3dA     {7B} : begin
                              P := Pointer(Integer(P) + 1);
                              if BIFF8 then begin
                                C1 := PPTGArea3d8(P).Col1 and $3FFF;
                                R1 := PPTGArea3d8(P).Row1;
                                C2 := PPTGArea3d8(P).Col2 and $3FFF;
                                R2 := PPTGArea3d8(P).Row2;
                                Add(ptgArea3d,P,MakeAbsA((PPTGArea3d8(P).Col1 and $8000) <> $8000,(PPTGArea3d8(P).Col1 and $4000) <> $4000,(PPTGArea3d8(P).Col2 and $8000) <> $8000,(PPTGArea3d8(P).Col2 and $4000) <> $4000),C1,R1,C2,R2,PPTGArea3d8(P).Index);
                                V := 10;
                              end
                              else begin
                                C1 := PPTGArea3d7(P).Col1;
                                R1 := PPTGArea3d7(P).Row1;
                                C2 := PPTGArea3d7(P).Col2;
                                R2 := PPTGArea3d7(P).Row2;
                                Add(ptgArea3d,P,MakeAbsA((PPTGArea3d7(P).Row1 and $8000) <> $8000,(PPTGArea3d7(P).Row1 and $4000) <> $4000,(PPTGArea3d7(P).Row2 and $8000) <> $8000,(PPTGArea3d7(P).Row2 and $4000) <> $4000),C1,R1,C2,R2,PPTGArea3d7(P).SheetIndex);
                                V := 20;
                              end;
                            end;

      ptgAreaErr3d   {3D} ,
      ptgAreaErr3dV  {5D} ,
      ptgAreaErr3dA  {7D} : if BIFF8 then V := 11 else V := 21;

      ptgFuncCEV     {58} : V := 3; // Not sure how to handle these.
      ptgFuncCEA     {78} : V := 3;
      else
        raise Exception.CreateFmt('Unknown ptg[%.2X] in FindRefs',[P[0]]);
    end;
    P := Pointer(Integer(P) + V);
  end;
end;

function TFormulaRefs.GetItems(Index: integer): TFormulaRef;
begin
  Result := TFormulaRef(inherited Items[Index]);
end;

function TFormulaRefs.MakeAbsR(C,R: boolean): TAbsoluteRefs;
begin
  Result := [];
  if C then
    Result := Result + [arCol1,arCol2];
  if R then
    Result := Result + [arRow1,arRow2];
end;

function TFormulaRefs.MakeAbsA(C1,R1,C2,R2: boolean): TAbsoluteRefs;
begin
  Result := [];
  if C1 then
    Result := Result + [arCol1];
  if R1 then
    Result := Result + [arRow1];
  if C2 then
    Result := Result + [arCol2];
  if R2 then
    Result := Result + [arRow2];
end;

function TFormulaRefs.Find(Formula: TFormulaCell): boolean;
begin
  FindRefs(FVersion = xvExcel97,Formula.PTGS,Formula.FormulaSize);
  Result := Count > 0;
end;

constructor TFormulaRefs.Create(Version: TExcelVersion);
begin
  FVersion := Version;
end;

procedure TFormulaRefs.AdjustRefR1InArea(C1, R1, C2, R2: word; Delta: integer);
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    if Items[i].IsArea and (Items[i].FCol1 >= C1) and (Items[i].FRow1 >= R1) and (Items[i].FCol1 <= C2) and (Items[i].FRow1 <= R2) then begin
      if Items[i].FPTG = ptgArea then
        PPTGArea8(Items[i].FRef).Row1 := PPTGArea8(Items[i].FRef).Row1 + Delta;
    end;
  end;
end;

initialization
  StrTRUE := 'TRUE';
  StrFALSE := 'FALSE';
  FuncArgSeparator := ListSeparator;

end.
