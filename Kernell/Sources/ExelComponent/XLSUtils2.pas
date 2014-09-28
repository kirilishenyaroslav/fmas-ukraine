unit XLSUtils2;

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

uses Classes, SysUtils, Windows, BIFFRecsII2,
{$ifndef LINUX}
     Graphics,
{$endif}
     Math;

//* ~exclude
type PRecPTGS = ^TRecPTGS;
     TRecPTGS = packed record
     Size: word;
     PTGS: PByteArray;
     end;

{$ifdef LINUX}
type TColor = -$7FFFFFFF-1..$7FFFFFFF;
{$endif}

//* ~exclude
type PWordBool = ^WordBool;
//* ~exclude
type TByte8Array = array[0..7] of byte;
//* ~exclude
type TByte4Array = array[0..3] of byte;

{$ifdef OLD_COMPILER}
type PWord = ^word;
type PInteger = ^integer;
{$endif}

//* ~exclude
type TDynByteArray = array of byte;

//* ~exclude
type TDynDoubleArray = array of double;

//* ~exclude
type PLongWordArray = ^TLongWordArray;
//* ~exclude
     TLongWordArray = array[0..8191] of Longword;

//* ~exclude
type TFormulaNameType = (ntName,ntExternName,ntExternSheet,ntCurrBook,ntCellValue);

//* ~exclude
type TFormulaValType = (fvFloat,fvBoolean,fvError,fvString,fvRef,fvArea,fvExtRef,fvExtArea,fvNull);
//* ~exclude
const TFormulaValTypeRef = [fvRef,fvArea,fvExtRef,fvExtArea];

//* Type used to define the results of formulas.
type TFormulaValue = record
     // String memory is handled by the compiler, can therefore not be in the
     // variant part.
     vString:  WideString;
     case ValType: TFormulaValType of
       fvFloat   : (vFloat:   double);
       fvBoolean : (vBoolean: boolean);
       fvError   : (vError:   TCellError);
       fvString  : (xvString:  boolean);
       // Col,Row
       fvRef     : (vRef:     array[0..1] of word);
       // Col1,Row1,Col2,Row2
       fvArea    : (vArea:    array[0..3] of word);
       // Col,Row,Sheet
       fvExtRef  : (vExtRef:  array[0..2] of word);
       // Col1,Row1,Col2,Row2,Sheet
       fvExtArea : (vExtArea: array[0..4] of word);
     end;

type TFormulaValueArray = array of TFormulaValue;

//* Event with an integer value.
//* ~param Sender Sender object.
//* ~param Value An integer value.
type TIntegerEvent      = procedure (Sender: TObject; Value: integer) of object;
//* ~exclude
type TCellEvent         = procedure (Col,Row: integer) of object;
//* ~exclude
type TColRowSizeEvent   = procedure(Sender: TObject; ColRow,FormatIndex,Size: integer) of object;
//* FuncName is the name of the function. Args are the functions arguments, from
//* left to right. If the function don't have any arguments, the array size is
//* zero. Result is the result of the calculation. If the function not can be
//* calculated, set Result to NULL
//* ~param Sender Sender object.
//* ~param FuncName The name of the function.
//* ~param Args An TFormulaValue array with the arguments to the function.
//* ~param Result The result of the formula calculation.
type TFunctionEvent     = procedure(Sender: TObject; FuncName: string; Args: array of TFormulaValue; var Result: TFormulaValue) of object;
//* Event used when a password is required in order to open an encrypted file.
//* ~param Sender Sender object.
//* ~param Password Set Password to the password that the file is encrypted with.
type TPasswordEvent     = procedure(Sender: TObject; var Password: WideString) of object;
//* ~exclude
type TFormulaErrorEvent = procedure(Sender: TObject; ErrorId: integer; ErrorStr: WideString) of object;
//* ~exclude
type TGetDefaultFormatEvent = function (Col,Row: integer): word of object;

//* Options when copying and moving cells.
type TCopyCellsOption = (ccoAdjustCells,     //* Adjust relative cells according to the new location.
                         ccoLockStartRow,    //* Don't adjust the first row.
                         ccoForceAdjust,     //* Adjust absolute cell references as well.
                         ccoCopyValues,      //* Copy cell values.
                         ccoCopyShapes,      //* Copy shape objects.
                         ccoCopyNotes,       //* Copy cell notes.
                         ccoCopyCondFmt,     //* Copy conditional formats.
                         ccoCopyValidations, //* Copy cell validations.
                         ccoCopyMerged       //* Copy merged cells.
                         );
     TCopyCellsOptions = set of TCopyCellsOption;

//* What parts of the data on a worksheet that shall be copied/moved.
const CopyAllCells = [ccoCopyValues,       //* Cell values
                      ccoCopyShapes,       //* Drawing shapes.
                      ccoCopyNotes,        //* Cell notes.
                      ccoCopyCondFmt,      //* Conditional formats.
                      ccoCopyValidations,  //* Cell validations.
                      ccoCopyMerged        //* Merged cells.
                      ];


const ExcelPictureTypes: array[0..6] of string = ('wmf','emf','pic','jpg','jpeg','png','bmp');
const ExcelPictureTypesFilter: string = 'Picture files|*.wmf;*.emf;*.pic;*.jpg;*.jpeg;*.png;*.bmp|All files (*.*)|*.*';

//* ~exclude
type ICellOperations = interface
     procedure DeleteCells(Sheet, Col1, Row1, Col2, Row2: integer);
     procedure CopyCells(SrcSheet,Col1,Row1,Col2,Row2,DestSheet,DestCol,DestRow: integer; CopyOptions: TCopyCellsOptions = [ccoAdjustCells] + CopyAllCells);
     procedure MoveCells(SrcSheet,Col1,Row1,Col2,Row2,DestSheet,DestCol,DestRow: integer; CopyOptions: TCopyCellsOptions = [ccoAdjustCells] + CopyAllCells);
     end;

//* ~exclude
procedure FVClear(var FV: TFormulaValue);
//* ~exclude
procedure FVSetNull(var FV: TFormulaValue);
//* ~exclude
procedure FVSetFloat(var FV: TFormulaValue; Value: double);
//* ~exclude
procedure FVSetBoolean(var FV: TFormulaValue; Value: boolean);
//* ~exclude
procedure FVSetError(var FV: TFormulaValue; Value: TCellError);
//* ~exclude
procedure FVSetString(var FV: TFormulaValue; Value: WideString);
//* ~exclude
procedure FVSetRef(var FV: TFormulaValue; Col,Row: word);
//* ~exclude
procedure FVSetArea(var FV: TFormulaValue; Col1,Row1,Col2,Row2: word);
//* ~exclude
procedure FVSetXRef(var FV: TFormulaValue; Col,Row,Sheet: word);
//* ~exclude
procedure FVSetXArea(var FV: TFormulaValue; Col1,Row1,Col2,Row2,Sheet: word);
//* ~exclude
function  FVGetFloat(FV: TFormulaValue): double;
//* ~exclude
function  FVGetString(FV: TFormulaValue): WideString;
//* ~exclude
function  FVGetBoolean(FV: TFormulaValue): boolean;
//* ~exclude
function  FVGetVariant(FV: TFormulaValue): Variant;
//* ~exclude
function  FVCompare(FV1,FV2: TFormulaValue; var Res: double): boolean;
//* ~exclude
function  FVSize(FV: TFormulaValue): integer;

//* Returns a cell position as it's string representation, like A1
//* ~param ACol Column.
//* ~param ARow Row.
//* ~param AbsCol True if Col shall be absolute, i.e preceeded with '$'.
//* ~param AbsRow True if Row shall be absolute, i.e preceeded with '$'.
//* ~result The string with the cell reference.   
function  ColRowToRefStr(ACol,ARow: integer; AbsCol,AbsRow: boolean): string;
//* Returns a cell area as it's string representation, like A1:D4
//* ~param Col1 Left column.
//* ~param Row1 Top row.
//* ~param Col2 Right column.
//* ~param Row2 Bottom row.
//* ~param AbsCol1 True if Col1 shall be absolute, i.e preceeded with '$'.
//* ~param AbsRow1 True if Row1 shall be absolute, i.e preceeded with '$'.
//* ~param AbsCol2 True if Col2 shall be absolute, i.e preceeded with '$'.
//* ~param AbsRow2 True if Row2 shall be absolute, i.e preceeded with '$'.
//* ~result The string with the area reference.
function  AreaToRefStr(Col1,Row1,Col2,Row2: integer; AbsCol1,AbsRow1,AbsCol2,AbsRow2: boolean): string;
//* Splits a reference string into row and column values.
//* ~param S A string with the cell reference in the format 'A1'
//* ~param ACol Column.
//* ~param ARow Column.
//* ~param AbsCol True if the column is absolute, i.e preceeded with '$'.
//* ~param AbsRow True if the row is absolute, i.e preceeded with '$'.
//* ~result True if the string could be converted.
function  RefStrToColRow(S: string; var ACol,ARow: integer; var AbsCol,AbsRow: boolean): boolean; overload;
//* Splits a reference string into row and column values.
//* ~param S A string with the cell reference in the format 'A1'
//* ~param ACol Column.
//* ~param ARow Column.
//* ~result True if the string could be converted.
function  RefStrToColRow(S: string; var ACol,ARow: integer): boolean; overload;
//* Splits an area reference string into rows and columns values.
//* ~param S A string with the area reference in the format 'A1:D5'
//* ~param ACol1 Left column.
//* ~param ARow1 Top row.
//* ~param ACol2 Right column.
//* ~param ARow2 Bottom row.
//* ~param AbsCol1 True if Col1 is absolute, i.e preceeded with '$'.
//* ~param AbsRow1 True if Row1 is absolute, i.e preceeded with '$'.
//* ~param AbsCol2 True if Col2 is absolute, i.e preceeded with '$'.
//* ~param AbsRow2 True if Row2 is absolute, i.e preceeded with '$'.
//* ~result True if the string could be converted.
function  AreaStrToColRow(S: string; var ACol1,ARow1,ACol2,ARow2: integer; var AbsCol1,AbsRow1,AbsCol2,AbsRow2: boolean): boolean; overload;
//* Splits an area reference string into rows and columns values.
//* ~param S A string with the cell reference in the format 'A1'
//* ~param ACol1 Left column.
//* ~param ARow1 Top row.
//* ~param ACol2 Right column.
//* ~param ARow2 Bottom row.
//* ~result True if the string could be converted.
function  AreaStrToColRow(S: string; var ACol1,ARow1,ACol2,ARow2: integer): boolean; overload;
//* Splits an area reference string into rows and columns values.
//* ~param S A string with the cell reference in the format 'A1'
//* ~param ACol Column.
//* ~param ARow Row.
//* ~param AbsCol True if the column is absolute, i.e preceeded with '$'.
//* ~param AbsRow True if the row is absolute, i.e preceeded with '$'.
//* ~result True if the string could be converted.
function  RefStrToColRow(S: string; var ACol,ARow: word; var AbsCol,AbsRow: boolean): boolean; overload;
{$ifdef LINUX}
//* ~exclude
function  GetHashCode(const Buffer; Count: Integer): Word;
{$else}
//* ~exclude
function  GetHashCode(const Buffer; Count: Integer): Word; assembler;
{$endif}
//* ~exclude
function  CPos(C: char; S: string): integer;
//* ~exclude
function  WCPos(C: WideChar; S: WideString): integer;
//* ~exclude
function  ColRowToRC(Col, Row: integer): longword;
//* ~exclude
procedure SplitRC(RC: integer; var Col,Row: integer);
//* ~exclude
procedure NormalizeArea(var C1,R1,C2,R2: integer);
//* ~exclude
function  IsMultybyteString(S: string): boolean;
//* ~exclude
function  ToMultibyte1bHeader(S: string): string;
//* ~exclude
function  UnicodeStorageSize(S: string): integer;
//* ~exclude
function  UnicodeStringLen(S: string): integer;
//* ~exclude
function  ExcelStrToString(P: PByteArray; CharCount: integer): string;
//* ~exclude
function  ByteStrToWideString(P: PByteArray; CharCount: integer): WideString;
//* ~exclude
procedure WideStringToByteStr(S: WideString; P: PByteArray);
//* ~exclude
function  HexToByte(S: string): byte;
//* ~exclude
function  HexStringToByteArray(S: string; var PBytes: PByteArray): integer;
//* ~exclude
procedure HexStringToDynByteArray(S: string; var PBytes: TDynByteArray);
//* ~exclude
function  ErrorCodeToText(Code: integer): WideString;
//* ~exclude
function  ErrorCodeToCellError(Code: integer): TCellError;
//* ~exclude
function  CellErrorToErrorCode(Error: TCellError): byte;
//* ~exclude
function  FastReplace(var aSourceString : String; const aFindString, aReplaceString : String; CaseSensitive : Boolean = False) : String;
//* ~exclude
function  ExcelStrToWideString(S: string): WideString;
//* ~exclude
function  IntToXColor(Value: word): TExcelColor;
//* ~exclude
function  XColorToTColor(XC: TExcelColor): TColor;
//* ~exclude
function  XColorToRGB(XC: TExcelColor): longword;
//* ~exclude
function  BufUnicodeZToWS(Buf: PByteArray; Len: integer): WideString;
//* ~exclude
function  DecodeRK(Value: longint): double;
//* ~exclude
function  ClipAreaToSheet(var C1,R1,C2,R2: integer): boolean;
//* ~exclude
function  TColorToClosestXColor(Color: TColor): TExcelColor;
//* ~exclude
function  MyWideUppercase(S: WideString): WideString;
//* ~exclude
function  ValidRef(C,R: integer): boolean;
//* ~exclude
function  ValidArea(C1,R1,C2,R2: integer): boolean;
//* ~exclude
function MaxDoubleList(List: TDynDoubleArray): double;
//* ~exclude
function SplitAtChar(C: WideChar; var S: WideString): WideString;

// EMU (English Metric Units) to Centimeters
//* ~exclude
function EmuToCm(EMU: integer): double;
//* ~exclude
function CmToEmu(Cm: double): integer;

var
  XLS_DebugMode: boolean = False;
  G_StrTRUE,G_StrFALSE: WideString;
  G_DEBUG_PStr: PWideChar;

implementation

procedure FVClear(var FV: TFormulaValue);
begin
  FV.ValType := fvError;
  FV.vError := errError;
end;

procedure FVSetNull(var FV: TFormulaValue);
begin
  FV.ValType := fvNull;
end;

procedure FVSetFloat(var FV: TFormulaValue; Value: double);
begin
  FV.ValType := fvFloat;
  FV.vFloat := Value;
end;

procedure FVSetBoolean(var FV: TFormulaValue; Value: boolean);
begin
  FV.ValType := fvBoolean;
  FV.vBoolean := Value;
end;

procedure FVSetError(var FV: TFormulaValue; Value: TCellError);
begin
  FV.ValType := fvError;
  FV.vError := Value;
end;

procedure FVSetString(var FV: TFormulaValue; Value: WideString);
begin
  FV.ValType := fvString;
  FV.vString := Value;
end;

procedure FVSetRef(var FV: TFormulaValue; Col,Row: word);
begin
  FV.ValType := fvRef;
  FV.vRef[0] := Col;
  FV.vRef[1] := Row;
end;

procedure FVSetArea(var FV: TFormulaValue; Col1,Row1,Col2,Row2: word);
begin
  FV.ValType := fvArea;
  FV.vArea[0] := Col1;
  FV.vArea[1] := Row1;
  FV.vArea[2] := Col2;
  FV.vArea[3] := Row2;
end;

procedure FVSetXRef(var FV: TFormulaValue; Col,Row,Sheet: word);
begin
  FV.ValType := fvExtRef;
  FV.vExtRef[0] := Col;
  FV.vExtRef[1] := Row;
  FV.vExtRef[2] := Sheet;
end;

procedure FVSetXArea(var FV: TFormulaValue; Col1,Row1,Col2,Row2,Sheet: word);
begin
  FV.ValType := fvExtArea;
  FV.vExtArea[0] := Col1;
  FV.vExtArea[1] := Row1;
  FV.vExtArea[2] := Col2;
  FV.vExtArea[3] := Row2;
  FV.vExtArea[4] := Sheet;
end;

function FVGetFloat(FV: TFormulaValue): double;
begin
  if FV.ValType = fvFloat then
    Result := FV.vFloat
  else
    Result := 0;
end;

function  FVGetString(FV: TFormulaValue): WideString;
begin
  if FV.ValType = fvString then
    Result := FV.vString
  else
    Result := '';
end;

function FVGetBoolean(FV: TFormulaValue): boolean;
begin
  if FV.ValType = fvBoolean then
    Result := FV.vBoolean
  else
    Result := False;
end;

function  FVGetVariant(FV: TFormulaValue): Variant;
begin
  case FV.ValType of
    fvFloat    : Result := FV.vFloat;
    fvBoolean  : Result := FV.vBoolean;
    fvError    : Result := CellErrorNames[Integer(FV.vError)];
    fvString   : Result := FV.vString;
    fvRef      : Result := ColRowToRefStr(FV.vRef[0],FV.vRef[1],False,False);
    fvArea     : Result := AreaToRefStr(FV.vArea[0],FV.vArea[1],FV.vArea[2],FV.vArea[3],False,False,False,False);
    // Sheet name is not included
    fvExtRef   : Result := ColRowToRefStr(FV.vExtRef[0],FV.vExtRef[1],False,False);
    fvExtArea  : Result := AreaToRefStr(FV.vExtArea[0],FV.vExtArea[1],FV.vExtArea[2],FV.vExtArea[3],False,False,False,False);
  end;
end;

function FVCompare(FV1,FV2: TFormulaValue; var Res: double): boolean;
begin
  Result := (FV1.ValType <> fvError) and (FV2.ValType <> fvError) and (FV1.ValType = FV2.ValType);
  if not Result then
    Exit;
  if FV1.ValType in TFormulaValTypeRef then
    raise Exception.Create('Illegal value in comparision');
  case FV1.ValType of
    fvFloat   : Res := FV1.vFloat - FV2.vFloat;
    fvBoolean : Res := Integer(FV1.vBoolean = FV2.vBoolean);
{$ifdef OLD_COMPILER}
    fvString  : Res := AnsiCompareStr(AnsiUppercase(FV1.vString),AnsiUppercase(FV2.vString));
{$else}
    fvString  : Res := WideCompareStr(MyWideUppercase(FV1.vString),MyWideUppercase(FV2.vString));
{$endif}
  end;
end;

function FVSize(FV: TFormulaValue): integer;
begin
  case FV.ValType of
    fvArea,fvExtArea:
      Result := (FV.vArea[2] - FV.vArea[0] + 1) * (FV.vArea[3] - FV.vArea[1] + 1);
    else
      Result := 1;
  end;
end;

{$ifdef LINUX}
function GetHashCode(const Buffer; Count: Integer): Word;
begin
  raise Exception.Create('LINUX: GetHashCode');
end;
{$else}
function GetHashCode(const Buffer; Count: Integer): Word; assembler;
asm
        CMP     EDX,0
        JNE     @@2
        MOV     EAX,0
        JMP     @@3
@@2:
        MOV     ECX,EDX
        MOV     EDX,EAX
        XOR     EAX,EAX
@@1:    ROL     AX,5
        XOR     AL,[EDX]
        INC     EDX
        DEC     ECX
        JNE     @@1
@@3:
end;
{$endif}

function CPos(C: char; S: string): integer;
begin
  for Result := 1 to Length(S) do begin
    if S[Result] = C then
      Exit;
  end;
  Result := -1;
end;

function  WCPos(C: WideChar; S: WideString): integer;
begin
  for Result := 1 to Length(S) do begin
    if S[Result] = C then
      Exit;
  end;
  Result := -1;
end;

function ColRowToRC(Col, Row: integer): longword;
begin
  Result := (Row shl 8) + (Col and $000000FF);
end;

procedure SplitRC(RC: integer; var Col,Row: integer);
begin
  Col := RC and $000000FF;
  Row := RC shr 8;
end;

procedure NormalizeArea(var C1,R1,C2,R2: integer);
var
  T: integer;
begin
  if C1 > C2 then begin
    T := C1;
    C1 := C2;
    C2 := T;
  end;
  if R1 > R2 then begin
    T := R1;
    R1 := R2;
    R2 := T;
  end;
end;

function IsMultybyteString(S: string): boolean;
begin
  Result := (Length(S) > 0) and (S[1] = #1);
end;

function ToMultibyte1bHeader(S: string): string;
begin
  Result := #0 + S
end;

function UnicodeStorageSize(S: string): integer;
begin
  if S = '' then
    Result := 0
  else if S[1] = #0 then
    Result := Length(S) + 1
  else
    Result := Length(S) * 2 + 1;
end;

function UnicodeStringLen(S: string): integer;
begin
  if S = '' then
    Result := 0
  else if S[1] = #0 then
    Result := Length(S) - 1
  else
    Result := (Length(S) - 1) div 2;
end;

function ExcelStrToString(P: PByteArray; CharCount: integer): string;
begin
  if P[0] = 0 then begin
    SetLength(Result,CharCount + 1);
    Move(P[1],Result[2],CharCount);
    Result[1] := #0;
  end
  else begin
    SetLength(Result,CharCount * 2 + 1);
    Move(P[1],Result[2],CharCount * 2);
    Result[1] := #1;
  end;
end;

function ByteStrToWideString(P: PByteArray; CharCount: integer): WideString;
var
  i: integer;
begin
  SetLength(Result,CharCount);
  if CharCount <= 0  then
    Exit
  else if P[0] = 1 then begin
    P := PByteArray(Integer(P) + 1);
    Move(P^,Pointer(Result)^,CharCount * 2);
  end
  else begin
    for i := 1 to CharCount do
      Result[i] := WideChar(P[i]);
  end;
end;

procedure WideStringToByteStr(S: WideString; P: PByteArray);
begin
  P[0] := 1;
  Move(Pointer(S)^,P[1],Length(S) * 2);
end;

function ErrorCodeToText(Code: integer): WideString;
begin
  case Code of
    $00: Result := CellErrorNames[1];
    $07: Result := CellErrorNames[2];
    $0F: Result := CellErrorNames[3];
    $17: Result := CellErrorNames[4];
    $1D: Result := CellErrorNames[5];
    $24: Result := CellErrorNames[6];
    $2A: Result := CellErrorNames[7];
    else Result := '#???';
  end;
end;

function ErrorCodeToCellError(Code: integer): TCellError;
var
  V: byte;
begin
  case Code of
    $00: V := 1;
    $07: V := 2;
    $0F: V := 3;
    $17: V := 4;
    $1D: V := 5;
    $24: V := 6;
    $2A: V := 7;
    else V := 0;
  end;
  Result := TCellError(V);
end;

function CellErrorToErrorCode(Error: TCellError): byte;
begin
  case Error of
    errError: Result := $2A;
    errNull:  Result := $00;
    errDiv0:  Result := $07;
    errValue: Result := $0F;
    errRef:   Result := $17;
    errName:  Result := $1D;
    errNum:   Result := $24;
    errNA:    Result := $2A;
    else
      Result := $2A;
  end;
end;

function ColRowToRefStr(ACol,ARow: integer; AbsCol,AbsRow: boolean): string;
begin
  Inc(ARow);
  if AbsCol then begin
    if ACol < 26 then Result := '$' + Char(Ord('A') + ACol)
    else Result := '$' + Char(Ord('@') + ACol div 26) + Char(Ord('A') + ACol mod 26);
  end
  else begin
    if ACol < 26 then Result := Char(Ord('A') + ACol)
    else Result := Char(Ord('@') + ACol div 26) + Char(Ord('A') + ACol mod 26);
  end;
  if AbsRow then
    Result := Result + '$' + IntToStr(ARow)
  else
    Result := Result + IntToStr(ARow);
end;

function AreaToRefStr(Col1,Row1,Col2,Row2: integer; AbsCol1,AbsRow1,AbsCol2,AbsRow2: boolean): string;
begin
  Result := ColRowToRefStr(Col1,Row1,AbsCol1,AbsRow1) + ':' + ColRowToRefStr(Col2,Row2,AbsCol2,AbsRow2);
end;

function RefStrToColRow(S: string; var ACol,ARow: integer; var AbsCol,AbsRow: boolean): boolean;
var
  wCol,wRow: word;
begin
//  Result := (ACol >= 0) and (ACol <= MAXCOL) and (ARow >= 0) and (ARow <= MAXROW);
//  if Result then begin
    wCol := 0;
    wRow := 0;
    Result := RefStrToColRow(S,wCol,wRow,AbsCol,AbsRow);
    ACol := wCol;
    ARow := wRow;
//  end;
end;

function RefStrToColRow(S: string; var ACol,ARow: integer): boolean; overload;
var
  AbsCol,AbsRow: boolean;
begin
  Result := RefStrToColRow(S,ACol,ARow,AbsCol,AbsRow);
end;

function RefStrToColRow(S: string; var ACol,ARow: word; var AbsCol,AbsRow: boolean): boolean;
var
  i,j: integer;
begin
  AbsCol := False;
  AbsRow := False;
  Result := False;
  if Length(S) < 1 then
    Exit;
  i := 1;
  if S[i] = '$' then begin
    Inc(i);
    AbsCol := True;
  end;
  if i > Length(S) then
    Exit;
  if not (S[i] in ['A'..'Z']) then
    Exit;
  Inc(i);
  if i > Length(S) then
    Exit;
  if (S[i] in ['A'..'Z']) then begin
    if not (S[i - 1] in ['A'..'I']) then
      Exit;
    ACol := (Ord(S[i - 1]) - Ord('@')) * 26 + (Ord(S[i]) - Ord('A'));
    if ACol > 255 then
      ACol := 255;
    Inc(i);
    if i > Length(S) then
      Exit;
  end
  else
    ACol := Ord(S[i - 1]) - Ord('A');
  if S[i] = '$' then begin
    Inc(i);
    AbsRow := True;
  end;
  for j := i to Length(S) do begin
    if not (S[j] in ['0'..'9']) then
      Exit;
  end;
  try
    ARow := StrToInt(Copy(S,i,1024)) - 1;
  except
    Exit;
  end;
  Result := True;
end;

function  AreaStrToColRow(S: string; var ACol1,ARow1,ACol2,ARow2: integer; var AbsCol1,AbsRow1,AbsCol2,AbsRow2: boolean): boolean;
var
  p: integer;
begin
  Result := False;
  p := CPos('!',S);
  if p > 0 then
    S := Copy(S,p + 1,MAXINT);
  p := CPos(':',S);
  if p < 1 then
    Exit;
  if not RefStrToColRow(Copy(S,1,p - 1),ACol1,ARow1,AbsCol1,AbsRow1) then
    Exit;
  if not RefStrToColRow(Copy(S,p + 1,MAXINT),ACol2,ARow2,AbsCol2,AbsRow2) then
    Exit;
  Result := True;
end;

function  AreaStrToColRow(S: string; var ACol1,ARow1,ACol2,ARow2: integer): boolean;
var
  AC1,AC2,AR1,AR2: boolean;
begin
  Result := AreaStrToColRow(S,ACol1,ARow1,ACol2,ARow2,AC1,AC2,AR1,AR2);
end;

function HexToByte(S: string): byte;
begin
  if Length(S) <> 2 then
    raise Exception.Create('Length error in hex string.');
  if S[1] in ['0'..'9'] then
    Result := (Ord(S[1]) - Ord('0')) * 16
  else
    Result := (Ord(S[1]) - Ord('A') + 10) * 16;
  if S[2] in ['0'..'9'] then
    Result := Result + Ord(S[2]) - Ord('0')
  else
    Result := Result + Ord(S[2]) - Ord('A') + 10;
end;

function HexStringToByteArray(S: string; var PBytes: PByteArray): integer;
var
  i,p: integer;
begin
  Result := Length(S) div 2;
  ReAllocMem(PBytes,Result);
  p := 1;
  for i := 0 to Result - 1 do begin
    PBytes[i] := HexToByte(Copy(S,p,2)) ;
    Inc(p,2);
  end;
end;

procedure HexStringToDynByteArray(S: string; var PBytes: TDynByteArray);
var
  i,p,Sz: integer;
begin
  Sz := Length(S) div 2;
  SetLength(PBytes,Sz);
  p := 1;
  for i := 0 to Sz - 1 do begin
    PBytes[i] := HexToByte(Copy(S,p,2)) ;
    Inc(p,2);
  end;
end;

Type
  TFastPosProc = function(
    const aSourceString, aFindString : String;
    const aSourceLen, aFindLen, StartPos : integer
    ) : integer;

function FastPos(const aSourceString, aFindString : String; const aSourceLen, aFindLen, StartPos : integer) : integer;
var
  SourceLen : integer;
begin
  SourceLen := aSourceLen;
  SourceLen := SourceLen - aFindLen;
  if (StartPos-1) > SourceLen then begin
    Result := 0;
    Exit;
  end;
  SourceLen := SourceLen - StartPos;
  SourceLen := SourceLen +2;
  asm
    push ESI
    push EDI
    push EBX

    mov EDI, aSourceString
    add EDI, StartPos
    Dec EDI

    mov ESI, aFindString

    mov ECX, SourceLen

    Mov  Al, [ESI]

    @ScaSB:
    Mov  Ah, [EDI]

    cmp  Ah,Al
    jne  @NextChar

    @CompareStrings:
    mov  EBX, aFindLen

    dec  EBX

    @CompareNext:

    mov  Al, [ESI+EBX]

    mov  Ah, [EDI+EBX]

    cmp  Al, Ah
    Jz   @Matches

    Mov  Al, [ESI]
    Jmp  @NextChar

    @Matches:
    Dec  EBX
    Jnz  @CompareNext

    mov  EAX, EDI
    sub  EAX, aSourceString
    inc  EAX
    mov  Result, EAX
    jmp  @TheEnd
    @NextChar:

    Inc  EDI
    dec  ECX
    jnz  @ScaSB

    mov  Result,0

    @TheEnd:
    pop  EBX
    pop  EDI
    pop  ESI
  end;
end;

function FastPosNoCase(const aSourceString, aFindString : String; const aSourceLen, aFindLen, StartPos : integer) : integer;
var
  SourceLen : integer;
begin
  SourceLen := aSourceLen;
  SourceLen := SourceLen - aFindLen;
  if (StartPos-1) > SourceLen then begin
    Result := 0;
    Exit;
  end;
  SourceLen := SourceLen - StartPos;
  SourceLen := SourceLen +2;
  asm
    push ESI
    push EDI
    push EBX

    mov EDI, aSourceString
    add EDI, StartPos
    Dec EDI
    mov ESI, aFindString
    mov ECX, SourceLen

    Mov  Al, [ESI]

    and  Al, $df
    @ScaSB:
    Mov  Ah, [EDI]
    and  Ah, $df
    cmp  Ah,Al
    jne  @NextChar

    @CompareStrings:
    mov  EBX, aFindLen
    dec  EBX
    @CompareNext:
    mov  Al, [ESI+EBX]
    mov  Ah, [EDI+EBX]
    and  Al, $df
    and  Ah, $df
    cmp  Al, Ah
    Jz   @Matches
    Mov  Al, [ESI]
    and  Al, $df
    Jmp  @NextChar
    @Matches:
    Dec  EBX
    Jnz  @CompareNext
    mov  EAX, EDI
    sub  EAX, aSourceString
    inc  EAX
    mov  Result, EAX
    jmp  @TheEnd
    @NextChar:
    Inc  EDI
    dec  ECX
    jnz  @ScaSB
    mov  Result,0

    @TheEnd:
    pop  EBX
    pop  EDI
    pop  ESI
  end;
end;

procedure MyMove(const Source; var Dest; Count : Integer);
asm
  cmp   ECX,0
  Je    @JustQuit

  push  ESI
  push  EDI

  mov   ESI, EAX
  mov   EDI, EDX

  @Loop:
  Mov   AL, [ESI]
  Inc   ESI
  mov   [EDI], AL
  Inc   EDI
  Dec   ECX
  Jnz   @Loop


  pop   EDI
  pop   ESI
  @JustQuit:
end;

function FastReplace(var aSourceString : String; const aFindString, aReplaceString : String; CaseSensitive : Boolean = False) : String;
var
  ActualResultLen,
  CurrentPos,
  LastPos,
  BytesToCopy,
  ResultLen,
  FindLen,
  ReplaceLen,
  SourceLen         : Integer;

  FastPosProc       : TFastPosProc;
begin
  if CaseSensitive then
    FastPosProc := FastPOS
  else
    FastPOSProc := FastPOSNoCase;

  Result := '';

  FindLen := Length(aFindString);
  ReplaceLen := Length(aReplaceString);
  SourceLen := Length(aSourceString);


  if ReplaceLen <= FindLen then
    ActualResultLen := SourceLen
  else
    ActualResultLen := SourceLen + (SourceLen * ReplaceLen div FindLen) + ReplaceLen;

  SetLength(Result,ActualResultLen);

  CurrentPos := 1;
  ResultLen := 0;
  LastPos := 1;

  if ReplaceLen > 0 then begin
    repeat
      CurrentPos := FastPosProc(aSourceString, aFindString,SourceLen, FindLen, CurrentPos);

      if CurrentPos = 0 then break;

      BytesToCopy := CurrentPos-LastPos;

      MyMove(aSourceString[LastPos],Result[ResultLen+1], BytesToCopy);

      MyMove(aReplaceString[1],Result[ResultLen+1+BytesToCopy], ReplaceLen);

      ResultLen := ResultLen + BytesToCopy + ReplaceLen;

      CurrentPos := CurrentPos + FindLen;
      LastPos := CurrentPos;
    until false;
  end else begin
    repeat
      CurrentPos := FastPos(aSourceString,
        aFindString, SourceLen, FindLen, CurrentPos);
      if CurrentPos = 0 then break;

      BytesToCopy := CurrentPos-LastPos;

      MyMove(aSourceString[LastPos],
        Result[ResultLen+1], BytesToCopy);
      ResultLen := ResultLen +
        BytesToCopy + ReplaceLen;

      CurrentPos := CurrentPos + FindLen;
      LastPos := CurrentPos;
    until false;
  end;

  Dec(LastPOS);

  SetLength(Result, ResultLen + (SourceLen-LastPos));

  if LastPOS+1 <= SourceLen then
    MyMove(aSourceString[LastPos+1],Result[ResultLen+1],SourceLen-LastPos);
end;

function ExcelStrToWideString(S: string): WideString;
begin
  if Length(S) <= 0 then
    Result := ''
  else begin
    if S[1] = #0 then begin
      Result := Copy(S,2,MAXINT);
    end
    else if S[1] = #1 then begin
      SetLength(Result,(Length(S) - 1) div 2);
      S := Copy(S,2,MAXINT);
      Move(Pointer(S)^,Pointer(Result)^,Length(S));
    end
    else
      Result := S;
//      raise Exception.Create('Bad excel string id.');
  end;
end;

function IntToXColor(Value: word): TExcelColor;
begin
  if Value <= Word(High(TExcelColor)) then
    Result := TExcelColor(Value)
  else
    Result := xcAutomatic;
end;

function XColorToTColor(XC: TExcelColor): TColor;
begin
  Result := ExcelColorPalette[Integer(XC)];
end;

function XColorToRGB(XC: TExcelColor): longword;
var
  tmp: longword;
begin
  Result := XColorToTColor(XC);
  tmp := Result and $00FF0000;
  Result := Result + (((Result and $000000FF) shl 16) or tmp);
end;

function BufUnicodeZToWS(Buf: PByteArray; Len: integer): WideString;
begin
  if Len > 0 then begin
    SetLength(Result,(Len div 2) - 1);
    Move(Buf^,Pointer(Result)^,Len - 2);
  end
  else
    Result := '';
end;

function DecodeRK(Value: longint): double;
var
  RK: TRK;
begin
  RK.DW[0] := 0;
//  RK.DW[1] := Value and $FFFFFFFC;
  RK.DW[1] := Value and LongInt($FFFFFFFC);   
  case (Value and $3) of
    0: Result := RK.V;
    1: Result := RK.V / 100;
    2: Result := Integer(RK.DW[1]) / 4;
    3: Result := Integer(RK.DW[1]) / 400;
    else
      Result := RK.V;
  end;
end;

function ClipAreaToSheet(var C1,R1,C2,R2: integer): boolean;
begin
  if (C1 > MAXCOL) or (R1 > MAXROW) or (C2 < 0) or (R2 < 0) then
    Result := False
  else begin
    C1 := Max(C1,0);
    R1 := Max(R1,0);
    C2 := Min(C2,MAXCOL);
    R2 := Min(R2,MAXROW);
    Result := True;
  end;
end;

function TColorToClosestXColor(Color: TColor): TExcelColor;
var
  i,j: integer;
  C: integer;
  R1,G1,B1: byte;
  R2,G2,B2: byte;
  V1,V2: double;
begin
  j := 8;
  R1 := Color and $FF;
  G1 := (Color and $FF00) shr 8;
  B1 := (Color and $FF0000) shr 16;
  V1 := $FFFFFF;
  for i := 8 to 63 do begin
    C := ExcelColorPalette[i];
    R2 := C and $FF;
    G2 := (C and $FF00) shr 8;
    B2 := (C and $FF0000) shr 16;
    V2 := Abs(R1 - R2) + Abs(G1 - G2) + Abs(B1 - B2);
    if Abs(V2) < Abs(V1) then begin
      V1 := V2;
      j := i;
    end;
  end;
  Result := TExcelColor(j);
end;

function MyWideUppercase(S: WideString): WideString;
begin
{$ifdef OLD_COMPILER}
  Result := AnsiUppercase(S);
{$else}
  Result := WideUppercase(S);
{$endif}
end;

function  ValidRef(C,R: integer): boolean;
begin
  Result := (C >= 0) and (C <= MAXCOL) and (R >= 0) and (R <= MAXROW);
end;

function  ValidArea(C1,R1,C2,R2: integer): boolean;
begin
  Result := ValidRef(C1,R1) and ValidRef(C2,R2);
end;

function MaxDoubleList(List: TDynDoubleArray): double;
var
  i: integer;
begin
  Result := MINDOUBLE;
  for i := 0 to High(List) do begin
    if List[i] > Result then
      Result := List[i];
  end;
end;

function SplitAtChar(C: WideChar; var S: WideString): WideString;
var
  p: integer;
begin
  p := WCPos(C,S);
  if p > 0 then begin
    Result := Copy(S,1,p - 1);
    S := Copy(S,p + 1,MAXINT);
  end
  else begin
    Result := S;
    S := '';
  end;
end;

// EMU (English Metric Units) to Centimeters
function EmuToCm(EMU: integer): double;
begin
  Result := Emu / 360000;
end;

function CmToEmu(Cm: double): integer;
begin
  Result := Round(Cm * 360000);
end;

initialization
  G_StrTRUE := 'TRUE';
  G_StrFALSE := 'FALSE';

end.
