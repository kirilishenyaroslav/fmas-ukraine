unit Cell2;

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

uses Classes, SysUtils, Graphics, BIFFRecsII2, CellFormats2, XLSFonts2,
     XLSHashTrie, FormattedObj2;

//* Cell type constants.
type TCellType = (ctNone,           //* Undefined cell.
                  ctBlank,          //* Blank cell.
                  ctNotUsed,        //* Not used value.
                  ctInteger,        //* Integer cell.
                  ctFloat,          //* Floating point cell.
                  ctString,         //* String cell.
                  ctBoolean,        //* Boolean cell.
                  ctError,          //* Cell with an error value.
                  ctNumberFormula,  //* Formula cell where the result of the formula is a numeric value.
                  ctStringFormula,  //* Formula cell where the result of the formula is a string value.
                  ctBooleanFormula, //* Formula cell where the result of the formula is a boolean value.
                  ctErrorFormula,   //* Formula cell where the result of the formula is an error value.
                  ctArrayFormula    //* Array formula cell.
                  );
//* ~exclude
const TFormulaCellType = [ctNumberFormula,ctStringFormula,ctBooleanFormula,ctErrorFormula,ctArrayFormula];
//* ~exclude
const TNumCellType = [ctNotUsed,ctInteger,ctFloat,ctNumberFormula,ctArrayFormula];

type
//* Base class for all cell objects. Cell objects are never created directly
//* in code, instead they are created by the various methods that writes
//* values to to the cells, or when a file is read.
    TCell = class(TFormattedObject)
private
     function GetCol: integer;
     function GetRow: integer;
protected
     FRowCol: longword;
public
     //* ~exclude
     destructor Destroy; override;
     //* Returns the cell type. Implemented by the ancestor.
     //* ~result Cell type.
     function CellType: TCellType; virtual; abstract;
     //* ~exclude
     function MakeCopy: TCell; virtual;

     //* ~exclude
     property RowCol: longword read FRowCol write FRowCol;
     //* The column where the cell i located.
     property Col: integer read GetCol;
     //* The row where the cell i located.
     property Row: integer read GetRow;
     end;

type
//* A blank cell is a cell without a value, but that is formatted.
//* Use ~[link SheetData2.TSheet.AsBlank TSheet.AsBlank] in order to create a blank cell.
    TBlankCell = class(TCell)
protected
public
     //* ~exclude
     constructor Create(RC: integer; Formats: TCellFormats; FormatIndex: word);
     //* Returns the cell type, ctBlank.
     //* ~result Cell type.
     function CellType: TCellType; override;
     //* ~exclude
     function MakeCopy: TCell; override;
     end;

type
//* A cell with a integer value.
//* Use ~[link SheetData2.TSheet.AsInteger TSheet.AsInteger] in order to create a integer cell.
    TIntegerCell = class(TCell)
private
     FValue: integer;
protected
public
     //* ~exclude
     constructor Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: integer);
     //* Returns the cell type, ctInteger.
     //* ~result Cell type.
     function CellType: TCellType; override;
     //* ~exclude
     function MakeCopy: TCell; override;
     //* The value of the cell.
     property Value: integer read FValue write FValue;
     end;

type
//* A cell with a floating point value.
//* Use ~[link SheetData2.TSheet.AsFloat TSheet.AsFloat] in order to create a floating point cell.
    TFloatCell = class(TCell)
private
     FValue: double;
protected
public
     //* ~exclude
     constructor Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: double);
     //* Returns the cell type, ctFloat.
     //* ~result Cell type.
     function CellType: TCellType; override;
     //* ~exclude
     function MakeCopy: TCell; override;
     //* The value of the cell.
     property Value: double read FValue write FValue;
     end;

type
//* A cell with a string value.
//* Use ~[link SheetData2.TSheet.AsString TSheet.AsString] in order to create a string cell.
    TStringCell = class(TCell)
private
     FValue: PXLSString;
protected
public
     //* ~exclude
     constructor Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: PXLSString);
     //* Returns the cell type, ctString.
     //* ~result Cell type.
     function CellType: TCellType; override;
     //* ~exclude
     function MakeCopy: TCell; override;
     //* The value of the cell.
     property Value: PXLSString read FValue write FValue;
     end;

type
//* A cell with a boolean value.
//* Use ~[link SheetData2.TSheet.AsBoolean TSheet.AsBoolean] in order to create a boolean cell.
    TBooleanCell = class(TCell)
private
     FValue: boolean;
protected
public
     //* ~exclude
     constructor Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: boolean);
     //* Returns the cell type, ctBoolean.
     //* ~result Cell type.
     function CellType: TCellType; override;
     //* ~exclude
     function MakeCopy: TCell; override;
     //* The value of the cell.
     property Value: boolean read FValue write FValue;
     end;

type
//* A cell with a error value.
//* Use ~[link SheetData2.TSheet.AsError TSheet.AsError] in order to create an error cell.
    TErrorCell = class(TCell)
private
     FValue: TCellError;
protected
public
     //* ~exclude
     constructor Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: TCellError);
     //* Returns the cell type, ctError.
     //* ~result Cell type.
     function CellType: TCellType; override;
     //* ~exclude
     function MakeCopy: TCell; override;
     //* The value of the cell.
     property Value: TCellError read FValue write FValue;
     end;

type
//* Base class for formula cells.
//* Use ~[link SheetData2.TSheet.AsFormula TSheet.AsFormula] in order to create a formula cell.
    TFormulaCell = class(TCell)
private
     FPTGS: PByteArray;
     FDataSize: integer;
     FFmlaSize: integer;
     FCalculated: boolean;
protected
public
     //* ~exclude
     constructor Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: PByteArray; DataSize,FmlaSize: integer);
     //* ~exclude
     destructor Destroy; override;

     //* ~exclude
     property PTGS: PByteArray read FPTGS;
     //* ~exclude
     property DataSize: integer read FDataSize;
     //* ~exclude
     property FormulaSize: integer read FFmlaSize;
     //* Returns true if the formula is calculated.
     property Calculated: boolean read FCalculated write FCalculated;
     end;

type
//* A formula cell with a floating point result.
//* Use ~[link SheetData2.TSheet.AsFormula TSheet.AsFormula] in order to create a formula cell.
//* What kind of formula cell that is created depends on the result of the
//* formula, and this is handled automatically by the component.
    TNumberFormulaCell = class(TFormulaCell)
private
     FNumberValue: double;
public
     //* Returns the cell type, ctNumberFormula.
     //* ~result Cell type.
     function CellType: TCellType; override;
     //* ~exclude
     function MakeCopy: TCell; override;
     //* The result of the formula. When a file is read, the propert usually has
     //* a correct value, but if a formula is created with XLSReadWriteII it
     //* has to be calculated in order to set the value.
     property NumberValue: double read FNumberValue write FNumberValue;
     end;

type
//* A formula cell with a string result.
//* Use ~[link SheetData2.TSheet.AsFormula TSheet.AsFormula] in order to create a formula cell.
//* What kind of formula cell that is created depends on the result of the
//* formula, and this is handled automatically by the component.
    TStringFormulaCell = class(TFormulaCell)
private
     FStringValue: WideString;
public
     //* Returns the cell type, ctStringFormula.
     //* ~result Cell type.
     function CellType: TCellType; override;
     //* ~exclude
     function MakeCopy: TCell; override;
     //* The result of the formula. When a file is read, the propert usually has
     //* a correct value, but if a formula is created with XLSReadWriteII it
     //* has to be calculated in order to set the value.
     property StringValue: WideString read FStringValue write FStringValue;
     end;

type
//* A formula cell with a boolean result.
//* Use ~[link SheetData2.TSheet.AsFormula TSheet.AsFormula] in order to create a formula cell.
//* What kind of formula cell that is created depends on the result of the
//* formula, and this is handled automatically by the component.
    TBooleanFormulaCell = class(TFormulaCell)
private
     FBooleanValue: boolean;
public
     //* Returns the cell type, ctBooleanFormula.
     //* ~result Cell type.
     function CellType: TCellType; override;
     //* ~exclude
     function MakeCopy: TCell; override;
     //* The result of the formula. When a file is read, the propert usually has
     //* a correct value, but if a formula is created with XLSReadWriteII it
     //* has to be calculated in order to set the value.
     property BooleanValue: boolean read FBooleanValue write FBooleanValue;
     end;

type
//* A formula cell with an error result.
//* Use ~[link SheetData2.TSheet.AsFormula TSheet.AsFormula] in order to create a formula cell.
//* What kind o kind of formula cell that is created depends on the result of the
//* formula, and this is handled automatically by the component.
    TErrorFormulaCell = class(TFormulaCell)
private
     FErrorValue: TCellError;
public
     //* Returns the cell type, ctErrorFormula.
     //* ~result Cell type.
     function CellType: TCellType; override;
     //* ~exclude
     function MakeCopy: TCell; override;
     //* The result of the formula. When a file is read, the propert usually has
     //* a correct value, but if a formula is created with XLSReadWriteII it
     //* has to be calculated in order to set the value.
     property ErrorValue: TCellError read FErrorValue write FErrorValue;
     end;

type
//* A formula cell with an array result.
//* Array formulas can not be created, only read from a file.
    TArrayFormulaCell = class(TFormulaCell)
private
     FNumberValue: double;
     FArray: PByteArray;
     FArraySize: integer;
     FIsChild: boolean;
public
     //* ~exclude
     constructor Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: PByteArray; DataSize,FmlaSize: integer; Arr: PByteArray; ArrSize: integer; Child: boolean);
     //* ~exclude
     destructor Destroy; override;
     //* Returns the cell type, ctArrayFormula.
     //* ~result Cell type.
     function CellType: TCellType; override;
     //* ~exclude
     function MakeCopy: TCell; override;
     //* ~exclude
     function ArrayPTGS: PByteArray;
     //* ~exclude
     function ArrayPTGSSize: integer;

     //* The calculation result of the array formula as a double value.
     property NumberValue: double read FNumberValue write FNumberValue;
     //* ~exclude
     property ArrayData: PByteArray read FArray;
     //* ~exclude
     property ArraySize: integer read FArraySize;
     //* ~exclude
     property IsChild: boolean read FIsChild;
     end;

implementation

{ TBlankCell }

constructor TBlankCell.Create(RC: integer; Formats: TCellFormats; FormatIndex: word);
begin
  inherited Create(Formats,FormatIndex);
  RowCol := RC;
end;

function TBlankCell.CellType: TCellType;
begin
  Result := ctBlank;
end;

function TBlankCell.MakeCopy: TCell;
begin
  inherited MakeCopy;
  Result := TBlankCell.Create(FRowCol,FFormats,FFormat.Index);
end;

{ TIntegerCell }

constructor TIntegerCell.Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: integer);
begin
  inherited Create(Formats,FormatIndex);
  RowCol := RC;
  FValue := Val;
end;

function TIntegerCell.CellType: TCellType;
begin
  Result := ctInteger;
end;

function TIntegerCell.MakeCopy: TCell;
begin
  inherited MakeCopy;
  Result := TIntegerCell.Create(FRowCol,FFormats,FFormat.Index,FValue);
end;

{ TFloatCell }

constructor TFloatCell.Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: double);
begin
  inherited Create(Formats,FormatIndex);
  RowCol := RC;
  FValue := Val;
end;

function TFloatCell.CellType: TCellType;
begin
  Result := ctFloat;
end;

function TFloatCell.MakeCopy: TCell;
begin
  inherited MakeCopy;
  Result := TFloatCell.Create(FRowCol,FFormats,FFormat.Index,FValue);
end;

{ TStringCell }

constructor TStringCell.Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: PXLSString);
begin
  inherited Create(Formats,FormatIndex);
  RowCol := RC;
  FValue := Val;
end;

function TStringCell.CellType: TCellType;
begin
  Result := ctString;
end;

function TStringCell.MakeCopy: TCell;
begin
  inherited MakeCopy;
  Result := TStringCell.Create(FRowCol,FFormats,FFormat.Index,FValue);
  Inc(TStringCell(Result).Value.RefCount); 
end;

{ TBooleanCell }

constructor TBooleanCell.Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: boolean);
begin
  inherited Create(Formats,FormatIndex);
  RowCol := RC;
  FValue := Val;
end;

function TBooleanCell.CellType: TCellType;
begin
  Result := ctBoolean;
end;

function TBooleanCell.MakeCopy: TCell;
begin
  inherited MakeCopy;
  Result := TBooleanCell.Create(FRowCol,FFormats,FFormat.Index,FValue);
end;

{ TErrorCell }

constructor TErrorCell.Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: TCellError);
begin
  inherited Create(Formats,FormatIndex);
  RowCol := RC;
  FValue := Val;
end;

function TErrorCell.CellType: TCellType;
begin
  Result := ctError;
end;

function TErrorCell.MakeCopy: TCell;
begin
  inherited MakeCopy;
  Result := TErrorCell.Create(FRowCol,FFormats,FFormat.Index,FValue);
end;

{ TFormulaCell }


constructor TFormulaCell.Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: PByteArray; DataSize,FmlaSize: integer);
begin
  inherited Create(Formats,FormatIndex);
  RowCol := RC;
  FDataSize := DataSize;
  FFmlaSize := FmlaSize;
  GetMem(FPTGS,FDataSize);
  Move(Val^,FPTGS^,FDataSize);
end;

destructor TFormulaCell.Destroy;
begin
  if FPTGS <> Nil then
    FreeMem(FPTGS);
  inherited;
end;

function TNumberFormulaCell.CellType: TCellType;
begin
  Result := ctNumberFormula;
end;

function TNumberFormulaCell.MakeCopy: TCell;
begin
  inherited MakeCopy;
  Result := TNumberFormulaCell.Create(FRowCol,FFormats,FFormat.Index,FPTGS,FDataSize,FFmlaSize);
end;

function TStringFormulaCell.CellType: TCellType;
begin
  Result := ctStringFormula;
end;

function TStringFormulaCell.MakeCopy: TCell;
begin
  inherited MakeCopy;
  Result := TStringFormulaCell.Create(FRowCol,FFormats,FFormat.Index,FPTGS,FDataSize,FFmlaSize);
end;

function TBooleanFormulaCell.CellType: TCellType;
begin
  Result := ctBooleanFormula;
end;

function TBooleanFormulaCell.MakeCopy: TCell;
begin
  inherited MakeCopy;
  Result := TBooleanFormulaCell.Create(FRowCol,FFormats,FFormat.Index,FPTGS,FDataSize,FFmlaSize);
end;

{ TErrorFormulaCell }

function TErrorFormulaCell.CellType: TCellType;
begin
  Result := ctErrorFormula;
end;

function TErrorFormulaCell.MakeCopy: TCell;
begin
  inherited MakeCopy;
  Result := TErrorFormulaCell.Create(FRowCol,FFormats,FFormat.Index,FPTGS,FDataSize,FFmlaSize);
end;

{ TArrayFormulaCell }

constructor TArrayFormulaCell.Create(RC: integer; Formats: TCellFormats; FormatIndex: word; Val: PByteArray; DataSize,FmlaSize: integer; Arr: PByteArray; ArrSize: integer; Child: boolean);
begin
  inherited Create(RC,Formats,FormatIndex,Val,DataSize,FmlaSize);
  FIsChild := Child;
  FArraySize := ArrSize;
  GetMem(FArray,ArrSize);
  Move(Arr^,FArray^,ArrSize);
end;

destructor TArrayFormulaCell.Destroy;
begin
  FreeMem(FArray);
  inherited;
end;

function TArrayFormulaCell.CellType: TCellType;
begin
  Result := ctArrayFormula;
end;

function TArrayFormulaCell.MakeCopy: TCell;
begin
  inherited MakeCopy;
  Result := TArrayFormulaCell.Create(FRowCol,FFormats,FFormat.Index,FPTGS,FDataSize,FFmlaSize,FArray,FArraySize,FIsChild);
end;

function TArrayFormulaCell.ArrayPTGS: PByteArray;
begin
  Result := PByteArray(@PRecARRAY(FArray).Data);
end;

function TArrayFormulaCell.ArrayPTGSSize: integer;
begin
  Result := PRecARRAY(FArray).DataSize;
end;

{ TCell }

destructor TCell.Destroy;
begin
  if FFormat.Index >= FFormats.DeleteIndex then begin
    FFormat.UsageCount := FFormat.UsageCount - 1;
    if FFormat.UsageCount <= 0 then
      FFormats.Delete(FFormat.Index);
  end;
  inherited;
end;

function TCell.GetCol: integer;
begin
  Result := FRowCol and $000000FF;
end;

function TCell.GetRow: integer;
begin
  Result := FRowCol shr 8;
end;

function TCell.MakeCopy: TCell;
begin
  FFormat.UsageCount := FFormat.UsageCount + 1;
  Result := Nil;
end;

end.
