unit CondFmt2;
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

uses Classes, SysUtils, BIFFRecsII2, XLSNames2, CellFormats2, XLSFonts2,
     XLSUtils2, CellAreas2, FormulaHandler2, XLSStream2, MoveCopy2;



type TConditionOperator = (coNoComparision,coBetween,coNotBetween,coEqual,coNotEqual,coGreater,coLess,coGreateEqual,coLessEqual);

type
//* Font for conditional formats.
    TCondFmtFont = class(TPersistent)
private
     FCFFont: TCFFont;
     FAssigned: boolean;

     function  GetColor: TExcelColor;
     function  GetFontStyle: TXFontStyles;
     function  GetHeight20: longword;
     function  GetSubSuperscript: TXSubSuperscript;
     function  GetUnderline: TXUnderline;
     procedure SetColor(const Value: TExcelColor);
     procedure SetFontStyle(const Value: TXFontStyles);
     procedure SetHeight20(const Value: longword);
     procedure SetSubSuperscript(const Value: TXSubSuperscript);
     procedure SetUnderline(const Value: TXUnderline);
     procedure SetRec(CFFont: PCFFont);
protected
public
     constructor Create;
     //* ~exclude
     procedure Assign(Source: TPersistent); override;
     //* ~exclude
     property Assigned: boolean read FAssigned;
published
     //* Height of the font in 1:20th of a point.
     property Height20: longword read GetHeight20 write SetHeight20;
     //* Font style.
     property FontStyle: TXFontStyles read GetFontStyle write SetFontStyle;
     //* Font escapment.
     property Escapment: TXSubSuperscript read GetSubSuperscript write SetSubSuperscript;
     //* Font underline.
     property Underline: TXUnderline read GetUnderline write SetUnderline;
     //* Font color.
     property Color: TExcelColor read GetColor write SetColor;
     end;

type
//* Cell border style for conditional formats.
    TCondFmtBorder = class(TPersistent)
private
     FCFBorder: TCFBorder;
     // Left,Top,Right,Bottom
     FAssigned: array[0..3] of boolean;

     function  GetBottomColor: TExcelColor;
     function  GetBottomStyle: TCellBorderStyle;
     function  GetLeftColor: TExcelColor;
     function  GetLeftStyle: TCellBorderStyle;
     function  GetRightColor: TExcelColor;
     function  GetRightStyle: TCellBorderStyle;
     function  GetTopColor: TExcelColor;
     function  GetTopStyle: TCellBorderStyle;
     procedure SetBottomColor(const Value: TExcelColor);
     procedure SetBottomStyle(const Value: TCellBorderStyle);
     procedure SetLeftColor(const Value: TExcelColor);
     procedure SetLeftStyle(const Value: TCellBorderStyle);
     procedure SetRightColor(const Value: TExcelColor);
     procedure SetRightStyle(const Value: TCellBorderStyle);
     procedure SetTopColor(const Value: TExcelColor);
     procedure SetTopStyle(const Value: TCellBorderStyle);
     procedure SetRec(CFBorder: PCFBorder; Flags: longword);
     function  GetAssigned: boolean;
protected
public
     //* ~exclude
     constructor Create;
     //* ~exclude
     procedure Assign(Source: TPersistent); override;
     //* ~exclude
     function AssignedLeft: boolean;
     //* ~exclude
     function AssignedTop: boolean;
     //* ~exclude
     function AssignedRight: boolean;
     //* ~exclude
     function AssignedBottom: boolean;
     //* ~exclude
     property Assigned: boolean read GetAssigned;
published
     //* Left border line style.
     property LeftStyle: TCellBorderStyle read GetLeftStyle write SetLeftStyle;
     //* Right border line style.
     property RightStyle: TCellBorderStyle read GetRightStyle write SetRightStyle;
     //* Top border line style. S
     property TopStyle: TCellBorderStyle read GetTopStyle write SetTopStyle;
     //* Bottom border line style.
     property BottomStyle: TCellBorderStyle read GetBottomStyle write SetBottomStyle;
     //* Color for left border line.
     property LeftColor: TExcelColor read GetLeftColor write SetLeftColor;
     //* Color for right border line.
     property RightColor: TExcelColor read GetRightColor write SetRightColor;
     //* Color for top border line.
     property TopColor: TExcelColor read GetTopColor write SetTopColor;
     //* Color for bottom border line.
     property BottomColor: TExcelColor read GetBottomColor write SetBottomColor;
     end;

type
//* Fill pattern for conditional formats.
    TCondFmtPattern = class(TPersistent)
private
     FCFPattern: TCFPattern;
     // Patter, Fg color, Bg color
     FAssigned: array[0..2] of boolean;

     function  GetBackColor: TExcelColor;
     function  GetFillPattern: TExcelFillPattern;
     function  GetForeColor: TExcelColor;
     procedure SetBackColor(const Value: TExcelColor);
     procedure SetFillPattern(const Value: TExcelFillPattern);
     procedure SetForeColor(const Value: TExcelColor);
     procedure SetRec(CFPattern: PCFPattern; Flags: longword);
     function  GetAssigned: boolean;
protected
public
     constructor Create;
     //* ~exclude
     procedure Assign(Source: TPersistent); override;
     //* ~exclude
     property Assigned: boolean read GetAssigned;
published
     //* Fill pattern style.
     property FillPattern: TExcelFillPattern read GetFillPattern write SetFillPattern;
     //* Color for fill pattern foreground.
     property ForeColor: TExcelColor read GetForeColor write SetForeColor;
     //* Color for fill pattern background.
     property BackColor: TExcelColor read GetBackColor write SetBackColor;
     end;

type
//* Settings for one conditional format.
    TCondFmtData = class(TPersistent)
private
     FRecCF: PRecCF;
     FFormula1: TRecPTGS;
     FFormula2: TRecPTGS;
     FFmtFont: TCondFmtFont;
     FFmtBorder: TCondFmtBorder;
     FFmtPattern: TCondFmtPattern;
     FFormulaHandler: TFormulaHandler;

     function  GetCompareCell: boolean;
     function  GetCompOperator: TConditionOperator;
     function  GetFormula1: WideString;
     function  GetFormula2: WideString;
     procedure SetCompareCell(const Value: boolean);
     procedure SetCompOperator(const Value: TConditionOperator);
     procedure SetFormula1(const Value: WideString);
     procedure SetFormula2(const Value: WideString);
     procedure SetRec(RecCF: PRecCF);
     function  GetFormulaRel1(SheetIndex, Col, Row: integer): WideString;
     function  GetFormulaRel2(SheetIndex, Col, Row: integer): WideString;
     procedure SetFormulaRel1(SheetIndex, Col, Row: integer; const Value: WideString);
     procedure SetFormulaRel2(SheetIndex, Col, Row: integer; const Value: WideString);
protected
     procedure SaveToStream(Stream: TXLSStream; PBuf: PByteArray);
     function  Evaluate(Val: TFormulaValue; Col,Row,SheetIndex: integer): TCondFmtData;
public
     //* ~exclude
     constructor Create(FmlaHandler: TFormulaHandler);
     //* ~exclude
     destructor Destroy; override;
     //* ~exclude
     procedure Assign(Source: TPersistent); override;
     //* ~exclude
     function Assigned: boolean;
     //* ~exclude
     property FormulaRel1[Col,Row,SheetIndex: integer]: WideString read GetFormulaRel1 write SetFormulaRel1;
     //* ~exclude
     property FormulaRel2[Col,Row,SheetIndex: integer]: WideString read GetFormulaRel2 write SetFormulaRel2;
published
     //* CompareCell is True if the conditional format shall compare a cell
     //* value. When CompareCell is False, the formula in Formula1 is evaluated.
     property CompareCell: boolean read GetCompareCell write SetCompareCell;
     //* Condition operator. Only used when ~[link CompareCell] is True.
     property CompOperator: TConditionOperator read GetCompOperator write SetCompOperator;
     //* Value for the first condition when CompareCell is True, or the formula
     //* evaluated when CompareCell is False. If a formula is used, it must
     //* evaluate tp a boolena value, true or false.
     property Formula1: WideString read GetFormula1 write SetFormula1;
     //* Value for the second condition when CompareCell is True, or the formula
     //* evaluated when CompareCell is False. If a formula is used, it must
     //* evaluate tp a boolena value, true or false.
     property Formula2: WideString read GetFormula2 write SetFormula2;
     //* Font to use for the cell when the condition is fulfilled.
     property FmtFont: TCondFmtFont read FFmtFont write FFmtFont;
     //* Cell border to use for the cell when the condition is fulfilled.
     property FmtBorder: TCondFmtBorder read FFmtBorder write FFmtBorder;
     //* Fill pattern to use for the cell when the condition is fulfilled.
     property FmtPattern: TCondFmtPattern read FFmtPattern write FFmtPattern;
     end;

type
//* Conditional format for one or several cells given in Areas. A conditional
//* format can have up to three conditions. Each condition can have it's own
//* formatting settings for the cell. If more than one of the conditions are
//* met, the first condition is used to format the cell.
    TConditionalFormat = class(TCollectionItemMoveCopy)
private
     FCond1: TCondFmtData;
     FCond2: TCondFmtData;
     FCond3: TCondFmtData;
     FAreas: TCellAreas;
protected
     function Assigned: integer;
     procedure SaveToStream(Stream: TXLSStream; PBuf: PByteArray);
     function  Intersect(Col1,Row1,Col2,Row2: integer): boolean; override;
     procedure Copy(Col1,Row1,Col2,Row2,DeltaCol,DeltaRow: integer); override;
     procedure Delete(Col1,Row1,Col2,Row2: integer); override;
     procedure Include(Col1,Row1,Col2,Row2: integer); override;
     procedure Move(DeltaCol,DeltaRow: integer); override;
     procedure Move(Col1,Row1,Col2,Row2,DeltaCol,DeltaRow: integer); override;
public
     //* ~exclude
     constructor Create(Collection: TCollection); override;
     //* ~exclude
     destructor Destroy; override;
     //* ~exclude
     procedure Assign(Source: TPersistent); override;
     //* ~exclude
     function  Evaluate(Val: TFormulaValue; Col,Row,SheetIndex: integer): TCondFmtData;
published
     //* Condition number one.
     property Condition1: TCondFmtData read FCond1 write FCond1;
     //* Condition number two.
     property Condition2: TCondFmtData read FCond2 write FCond2;
     //* Condition number three.
     property Condition3: TCondFmtData read FCond3 write FCond3;
     //* Cells and areas that are formatted when the condition(s) are met.
     property Areas: TCellAreas read FAreas write FAreas;
     end;

type
//* TConditionalFormats implements the Excel Conditional Formats command.
//* ~[br]
//* ~[br]
//* ~[b Example:]
//* ~[br]
//* ~[sample
//* var
//*   CondFmt: TConditionalFormat;
//* begin
//*   // Add some values
//*   XLS.Sheet[0~[].FillRandom('A1:A10',1000);
//*   XLS.Sheet[0~[].AsString[3,0~[] := 'Hello';
//*   XLS.Sheet[0~[].AsString[3,5~[] := 'World';
//*
//*   // Create a conditional format
//*   CondFmt := XLS.Sheet[0~[].ConditionalFormats.Add;
//*   // Add the the target area for the conditional format, B1:B3
//*   CondFmt.Areas.Add(1,0,1,2);
//*   // First value for the condition
//*   CondFmt.Condition1.Formula1 := '100';
//*   // Second value for the condition
//*   CondFmt.Condition1.Formula2 := '200';
//*   // Simple comparison, values are between the numbers in Formula1 and Formula2
//*   CondFmt.Condition1.CompOperator := coBetween;
//*   // Format top border
//*   CondFmt.Condition1.FmtBorder.TopStyle := cbsThick;
//*   CondFmt.Condition1.FmtBorder.TopColor := xcGreen;
//*   // Format bottom border
//*   CondFmt.Condition1.FmtBorder.BottomStyle := cbsThick;
//*   CondFmt.Condition1.FmtBorder.BottomColor := xcGreen;
//*
//*   // Create second conditional format
//*   CondFmt := XLS.Sheet[0~[].ConditionalFormats.Add;
//*   // Add the the target area for the conditional format, C1:C3
//*   CondFmt.Areas.Add(2,0,2,2);
//*   // Use evaluated formula for condition
//*   CondFmt.Condition1.CompareCell := False;
//*   // Formula to evaluate. The result of the formula must be a boolean value.
//*   CondFmt.Condition1.Formula1 := 'SUM(A1:A5)<100';
//*   // Set the cell color
//*   CondFmt.Condition1.FmtPattern.ForeColor := xcRed;
//*
//*   // Create third conditional format
//*   CondFmt := XLS.Sheet[0~[].ConditionalFormats.Add;
//*   // Add the the target area for the conditional format, D1
//*   CondFmt.Areas.Add(3,0,3,0);
//*   // Add one more target area for the conditional format, D6
//*   CondFmt.Areas.Add(3,5,3,5);
//*   // Formula to evaluate for the first condition. The result of the formula must be a boolean value.
//*   CondFmt.Condition1.Formula1 := 'AND(A1>=10;A1<=90)';
//*   // Use evaluated formula for condition
//*   CondFmt.Condition1.CompareCell := False;
//*   // Set the font style
//*   CondFmt.Condition1.FmtFont.FontStyle := [xfsBold~[];
//*   // Formula to evaluate for the second condition. If the first formula is
//*   // evaluated to boolean False, this formula is evaluated.
//*   // The result of the formula must be a boolean value.
//*   CondFmt.Condition2.Formula1 := 'SUM(A1:A2)>100';
//*   // Use evaluated formula for condition
//*   CondFmt.Condition2.CompareCell := False;
//*   // Set the cell color
//*   CondFmt.Condition2.FmtPattern.ForeColor := xcYellow;
//* end;
//* ]
    TConditionalFormats = class(TCollectionMoveCopy)
private
     FOwner: TPersistent;
     FFormulaHandler: TFormulaHandler;

     function GetItems(Index: integer): TConditionalFormat;
protected
     function GetOwner: TPersistent; override;
public
     //* ~exclude
     constructor Create(AOwner: TPersistent; FmlaHandler: TFormulaHandler);
     //* Add a new condition.
     //* ~result The added TConditionalFormat
     function Add: TConditionalFormat;
     //* Searches for a TConditionalFormat that matches Col and Row. Returns Nil if none is found.
     //* ~param Col Column.
     //* ~param Row Row.
     //* ~result The TConditionalFormat object if found, otherwise Nil.
     function Find(Col,Row: integer): TConditionalFormat;
     //* ~exclude
     procedure LoadFromStream(Stream: TXLSStream; PBuf: PByteArray);
     //* ~exclude
     procedure SaveToStream(Stream: TXLSStream; PBuf: PByteArray);

     //* TConditionalFormat in the list.
     property Items[Index: integer]: TConditionalFormat read GetItems; default;
     end;

implementation

{ TCondFmtFont }

procedure TCondFmtFont.Assign(Source: TPersistent);
begin
  Move(TCondFmtFont(Source).FCFFont,FCFFont,SizeOf(TCFFont));
  FAssigned := TCondFmtFont(Source).FAssigned;
end;

constructor TCondFmtFont.Create;
begin
  inherited Create;
  FAssigned := False;
  FillChar(FCFFont,SizeOf(TCFFont),#0);
  FCFFont.Height := $FFFFFFFF;
  FCFFont.Weight := 400;
  FCFFont.ColorIndex := $FFFFFFFF;
  FCFFont.ModifiedFlags := $0000009A;
  FCFFont.EscapementModified := $00000001;
  FCFFont.UnderlineModified := $00000001;
  FCFFont.Is0001 := $0001;
end;

function TCondFmtFont.GetColor: TExcelColor;
begin
  if FCFFont.ColorIndex = $FFFFFFFF then
    Result := xcAutomatic
  else
    Result := TExcelColor(FCFFont.ColorIndex);
end;

function TCondFmtFont.GetFontStyle: TXFontStyles;
begin
  Result := [];
  if (FCFFont.Options and $00000002) = $00000002 then
    Result := Result + [xfsItalic];
  if (FCFFont.Options and $00000080) = $00000002 then
    Result := Result + [xfsStrikeOut];
  if FCFFont.Weight >= 700 then
    Result := Result + [xfsBold];
end;

function TCondFmtFont.GetHeight20: longword;
begin
  Result := FCFFont.Height;
  if Result = $FFFFFFFF then
    Result := 0;
end;

function TCondFmtFont.GetSubSuperscript: TXSubSuperscript;
begin
  Result := TXSubSuperscript(FCFFont.Escapement);
end;

function TCondFmtFont.GetUnderline: TXUnderline;
begin
  case FCFFont.Underline of
    $00: Result := xulNone;
    $01: Result := xulSingle;
    $02: Result := xulDouble;
    $21: Result := xulSingleAccount;
    $22: Result := xulDoubleAccount;
    else
       Result := xulNone;
  end;
end;

procedure TCondFmtFont.SetColor(const Value: TExcelColor);
var
  V: longword;
begin
  if Value = xcAutomatic then
    V := $FFFFFFFF
  else
    V := Longword(Value);
  if V = FCFFont.ColorIndex then
    Exit;
  FCFFont.ColorIndex := V;
  FAssigned := True;
end;

procedure TCondFmtFont.SetFontStyle(const Value: TXFontStyles);
begin
  if Value = GetFontStyle then
    Exit;
  FCFFont.Options := 0;
  FCFFont.ModifiedFlags := $00000018 + $00000002 + $00000080;
  if xfsItalic in Value then begin
    FCFFont.Options := FCFFont.Options or $00000002;
    FCFFont.ModifiedFlags := FCFFont.ModifiedFlags and not $00000002;
  end;
  if xfsStrikeOut in Value then begin
    FCFFont.Options := FCFFont.Options or $00000080;
    FCFFont.ModifiedFlags := FCFFont.ModifiedFlags and not $00000080;
  end;
  if xfsBold in Value then begin
    FCFFont.Weight := 700;
    FCFFont.ModifiedFlags := FCFFont.ModifiedFlags and not $00000002;
  end
  else
    FCFFont.Weight := 400;
  FAssigned := True;
end;

procedure TCondFmtFont.SetHeight20(const Value: longword);
begin
  if Value = 0 then
    FCFFont.Height := $FFFFFFFF
  else
    FCFFont.Height := Value;
  FAssigned := FCFFont.Height <> $FFFFFFFF;
end;

procedure TCondFmtFont.SetRec(CFFont: PCFFont);
begin
  Move(CFFont^,FCFFont,SizeOf(TCFFont));
  FAssigned := True;
end;

procedure TCondFmtFont.SetSubSuperscript(const Value: TXSubSuperscript);
begin
  if FCFFont.Escapement = Word(Value) then
    Exit;
  FCFFont.Escapement := Word(Value);
  FCFFont.EscapementModified := 0;
  FAssigned := True;
end;

procedure TCondFmtFont.SetUnderline(const Value: TXUnderline);
begin
  if GetUnderline = Value then
    Exit;
  FCFFont.Underline := 0;
  case Value of
    xulNone          : FCFFont.Underline := $00;
    xulSingle        : FCFFont.Underline := $01;
    xulDouble        : FCFFont.Underline := $02;
    xulSingleAccount : FCFFont.Underline := $21;
    xulDoubleAccount : FCFFont.Underline := $22;
  end;
  FCFFont.UnderlineModified := 0;
  FAssigned := True;
end;

{ TCondFmtBorder }

procedure TCondFmtBorder.Assign(Source: TPersistent);
var
  i: integer;
begin
  Move(TCondFmtBorder(Source).FCFBorder,FCFBorder,SizeOf(TCFBorder));
  for i := 0 to High(FAssigned) do
    FAssigned[i] := TCondFmtBorder(Source).FAssigned[i];
end;

function TCondFmtBorder.AssignedBottom: boolean;
begin
  Result := FAssigned[3];
end;

function TCondFmtBorder.AssignedLeft: boolean;
begin
  Result := FAssigned[0];
end;

function TCondFmtBorder.AssignedRight: boolean;
begin
  Result := FAssigned[2];
end;

function TCondFmtBorder.AssignedTop: boolean;
begin
  Result := FAssigned[1];
end;

constructor TCondFmtBorder.Create;
begin
  inherited Create;
  FCFBorder.ColorIndex := 0;
  FCFBorder.ColorIndex := FCFBorder.ColorIndex + Word(xcAutomatic);
  FCFBorder.ColorIndex := FCFBorder.ColorIndex + (Word(xcAutomatic) shl 7);
  FCFBorder.ColorIndex := FCFBorder.ColorIndex + (Word(xcAutomatic) shl 16);
  FCFBorder.ColorIndex := FCFBorder.ColorIndex + (Word(xcAutomatic) shl 23);
end;

function TCondFmtBorder.GetAssigned: boolean;
begin
  Result := FAssigned[0] or FAssigned[1] or FAssigned[2] or FAssigned[3];
end;

function TCondFmtBorder.GetBottomColor: TExcelColor;
begin
  Result := IntToXColor((FCFBorder.ColorIndex shr 23) and $7F);
end;

function TCondFmtBorder.GetBottomStyle: TCellBorderStyle;
begin
  Result := TCellBorderStyle((FCFBorder.Linestyle shr 12) and $0F);
end;

function TCondFmtBorder.GetLeftColor: TExcelColor;
begin
  Result := IntToXColor((FCFBorder.ColorIndex shr 0) and $7F);
end;

function TCondFmtBorder.GetLeftStyle: TCellBorderStyle;
begin
  Result := TCellBorderStyle((FCFBorder.Linestyle shr 0) and $0F);
end;

function TCondFmtBorder.GetRightColor: TExcelColor;
begin
  Result := IntToXColor((FCFBorder.ColorIndex shr 7) and $7F);
end;

function TCondFmtBorder.GetRightStyle: TCellBorderStyle;
begin
  Result := TCellBorderStyle((FCFBorder.Linestyle shr 4) and $0F);
end;

function TCondFmtBorder.GetTopColor: TExcelColor;
begin
  Result := IntToXColor((FCFBorder.ColorIndex shr 16) and $7F);
end;

function TCondFmtBorder.GetTopStyle: TCellBorderStyle;
begin
  Result := TCellBorderStyle((FCFBorder.Linestyle shr 8) and $0F);
end;

procedure TCondFmtBorder.SetBottomColor(const Value: TExcelColor);
begin
  if Value = GetBottomColor then
    Exit;
  FCFBorder.ColorIndex := FCFBorder.ColorIndex and not $3F800000;
  FCFBorder.ColorIndex := FCFBorder.ColorIndex or (Word(Value) shl 23);
end;

procedure TCondFmtBorder.SetBottomStyle(const Value: TCellBorderStyle);
begin
  if Value = GetBottomStyle then
    Exit;
  FCFBorder.LineStyle := FCFBorder.LineStyle and not $F000;
  FCFBorder.LineStyle := FCFBorder.LineStyle or (Byte(Value) shl 12);
  FAssigned[3] := Value <> cbsNone;
end;

procedure TCondFmtBorder.SetLeftColor(const Value: TExcelColor);
begin
  if Value = GetLeftColor then
    Exit;
  FCFBorder.ColorIndex := FCFBorder.ColorIndex and not $0000007F;
  FCFBorder.ColorIndex := FCFBorder.ColorIndex or (Word(Value) shl 0);
end;

procedure TCondFmtBorder.SetLeftStyle(const Value: TCellBorderStyle);
begin
  if Value = GetLeftStyle then
    Exit;
  FCFBorder.LineStyle := FCFBorder.LineStyle and not $000F;
  FCFBorder.LineStyle := FCFBorder.LineStyle or (Byte(Value) shl 0);
  FAssigned[0] := Value <> cbsNone;
end;

procedure TCondFmtBorder.SetRec(CFBorder: PCFBorder; Flags: longword);
begin
  Move(CFBorder^,FCFBorder,SizeOf(TCFBorder));
  FAssigned[0] := (Flags and $00000400) = 0;
  FAssigned[1] := (Flags and $00001000) = 0;
  FAssigned[2] := (Flags and $00000800) = 0;
  FAssigned[3] := (Flags and $00002000) = 0;
end;

procedure TCondFmtBorder.SetRightColor(const Value: TExcelColor);
begin
  if Value = GetRightColor then
    Exit;
  FCFBorder.ColorIndex := FCFBorder.ColorIndex and not $00003F80;
  FCFBorder.ColorIndex := FCFBorder.ColorIndex or (Word(Value) shl 7);
end;

procedure TCondFmtBorder.SetRightStyle(const Value: TCellBorderStyle);
begin
  if Value = GetRightStyle then
    Exit;
  FCFBorder.LineStyle := FCFBorder.LineStyle and not $00F0;
  FCFBorder.LineStyle := FCFBorder.LineStyle or (Byte(Value) shl 4);
  FAssigned[2] := Value <> cbsNone;
end;

procedure TCondFmtBorder.SetTopColor(const Value: TExcelColor);
begin
  if Value = GetTopColor then
    Exit;
  FCFBorder.ColorIndex := FCFBorder.ColorIndex and not $07F00000;
  FCFBorder.ColorIndex := FCFBorder.ColorIndex or (Word(Value) shl 16);
end;

procedure TCondFmtBorder.SetTopStyle(const Value: TCellBorderStyle);
begin
  if Value = GetTopStyle then
    Exit;
  FCFBorder.LineStyle := FCFBorder.LineStyle and not $0000;
  FCFBorder.LineStyle := FCFBorder.LineStyle or (Byte(Value) shl 8);
  FAssigned[1] := Value <> cbsNone;
end;

{ TCondFmtPattern }

procedure TCondFmtPattern.Assign(Source: TPersistent);
var
  i: integer;
begin
  Move(TCondFmtPattern(Source).FCFPattern,FCFPattern,SizeOf(TCFPattern));
  for i := 0 to High(FAssigned) do
    FAssigned[i] := TCondFmtPattern(Source).FAssigned[i];
end;

constructor TCondFmtPattern.Create;
begin
  inherited Create;
  FCFPattern.ColorIndex := 0;
  FCFPattern.PatternStyle := 0;
end;

function TCondFmtPattern.GetAssigned: boolean;
begin
  Result := FAssigned[0] or FAssigned[1] or FAssigned[2];
end;

function TCondFmtPattern.GetBackColor: TExcelColor;
begin
  Result := IntToXColor((FCFPattern.ColorIndex shr 0) and $7F);
  if Result = xc0 then
    Result := xcAutomatic;
end;

function TCondFmtPattern.GetFillPattern: TExcelFillPattern;
begin
  Result := TExcelFillPattern(FCFPattern.PatternStyle shr 10);
end;

function TCondFmtPattern.GetForeColor: TExcelColor;
begin
  Result := IntToXColor((FCFPattern.ColorIndex shr 7) and $7F);
  if Result = xc0 then
    Result := xcAutomatic;
end;

procedure TCondFmtPattern.SetBackColor(const Value: TExcelColor);
begin
  FAssigned[1] := not (Value in[xc0,xcAutomatic]);
  FCFPattern.ColorIndex := FCFPattern.ColorIndex and not $007F;
  if FAssigned[1] then
    FCFPattern.ColorIndex := FCFPattern.ColorIndex or (Word(Value) shl 0);
end;

procedure TCondFmtPattern.SetFillPattern(const Value: TExcelFillPattern);
begin
  FAssigned[0] := Value <> fpNone;
  FCFPattern.PatternStyle := FCFPattern.PatternStyle and not $FC00;
  if FAssigned[0] then
    FCFPattern.PatternStyle := FCFPattern.PatternStyle or (Word(Value) shl 10);
end;

procedure TCondFmtPattern.SetForeColor(const Value: TExcelColor);
begin
  FAssigned[2] := not (Value in[xc0,xcAutomatic]);
  FCFPattern.ColorIndex := FCFPattern.ColorIndex and not $3F80;
  if FAssigned[2] then
    FCFPattern.ColorIndex := FCFPattern.ColorIndex or (Word(Value) shl 7);
end;

procedure TCondFmtPattern.SetRec(CFPattern: PCFPattern; Flags: longword);
begin
  Move(CFPattern^,FCFPattern,SizeOf(TCFPattern));
  FAssigned[0] := (Flags and $00010000) = 0;
  FAssigned[1] := (Flags and $00020000) = 0;
  FAssigned[2] := (Flags and $00040000) = 0;
end;

{ TCondFmtData }

procedure TCondFmtData.Assign(Source: TPersistent);
begin
  Move(TCondFmtData(Source).FRecCF^,FRecCF^,SizeOf(TRecCF));
                                          
  FFormula1.Size := TCondFmtData(Source).FFormula1.Size;
  GetMem(FFormula1.PTGS,FFormula1.Size);
  Move(TCondFmtData(Source).FFormula1.PTGS^,FFormula1.PTGS^,FFormula1.Size);

  FFormula2.Size := TCondFmtData(Source).FFormula2.Size;
  GetMem(FFormula2.PTGS,FFormula2.Size);
  Move(TCondFmtData(Source).FFormula2.PTGS^,FFormula2.PTGS^,FFormula2.Size);

  FFmtFont.Assign(TCondFmtData(Source).FFmtFont);
  FFmtBorder.Assign(TCondFmtData(Source).FFmtBorder);
  FFmtPattern.Assign(TCondFmtData(Source).FFmtPattern);
end;

function TCondFmtData.Assigned: boolean;
begin
  Result := FFmtFont.Assigned or FFmtBorder.Assigned or FFmtPattern.Assigned;
end;

constructor TCondFmtData.Create(FmlaHandler: TFormulaHandler);
begin
  GetMem(FRecCF,SizeOf(TRecCF));
  FRecCF.CFType := $01;
  FRecCF.Operator_ := $03;
  FRecCF.Flags := $003FFFFF;
  FFormulaHandler := FmlaHandler;
  FFmtFont := TCondFmtFont.Create;
  FFmtBorder := TCondFmtBorder.Create;
  FFmtPattern := TCondFmtPattern.Create;
end;

destructor TCondFmtData.Destroy;
begin
  FFmtFont.Free;
  FFmtBorder.Free;
  FFmtPattern.Free;
  FreeMem(FFormula1.PTGS);
  FreeMem(FFormula2.PTGS);
  FreeMem(FRecCF);
  inherited;
end;

function TCondFmtData.Evaluate(Val: TFormulaValue; Col,Row,SheetIndex: integer): TCondFmtData;
var
  D1,D2: double;
  Res1,Res2: TFormulaValue;
begin
  Result := Nil;
  if GetCompareCell then begin
    case GetCompOperator of
      coNoComparision: Result := Nil;
      coBetween: begin
        Res1 := FFormulaHandler.Calculate(FFormula1,Col,Row,SheetIndex);
        Res2 := FFormulaHandler.Calculate(FFormula2,Col,Row,SheetIndex);
        if FVCompare(Val,Res1,D1) and FVCompare(Val,Res2,D2) and (D1 >= 0) and (D2 <= 0) then
          Result := Self;
      end;
      coNotBetween: begin
        Res1 := FFormulaHandler.Calculate(FFormula1,Col,Row,SheetIndex);
        Res2 := FFormulaHandler.Calculate(FFormula2,Col,Row,SheetIndex);
        if FVCompare(Val,Res1,D1) and FVCompare(Val,Res2,D2) and not ((D1 >= 0) and (D2 <= 0)) then
          Result := Self;
      end;
      coEqual: begin
        Res1 := FFormulaHandler.Calculate(FFormula1,Col,Row,SheetIndex);
        if FVCompare(Val,Res1,D1) and (D1 = 0) then
          Result := Self;
      end;
      coNotEqual: begin
        Res1 := FFormulaHandler.Calculate(FFormula1,Col,Row,SheetIndex);
        if FVCompare(Val,Res1,D1) and (D1 <> 0) then
          Result := Self;
      end;
      coGreater: begin
        Res1 := FFormulaHandler.Calculate(FFormula1,Col,Row,SheetIndex);
        if FVCompare(Val,Res1,D1) and (D1 > 0) then
          Result := Self;
      end;
      coLess: begin
        Res1 := FFormulaHandler.Calculate(FFormula1,Col,Row,SheetIndex);
        if FVCompare(Val,Res1,D1) and (D1 < 0) then
          Result := Self;
      end;
      coGreateEqual: begin
        Res1 := FFormulaHandler.Calculate(FFormula1,Col,Row,SheetIndex);
        if FVCompare(Val,Res1,D1) and (D1 >= 0) then
          Result := Self;
      end;
      coLessEqual: begin
        Res1 := FFormulaHandler.Calculate(FFormula1,Col,Row,SheetIndex);
        if FVCompare(Val,Res1,D1) and (D1 <= 0) then
          Result := Self;
      end;
    end;
  end
  else begin
    Res1 := FFormulaHandler.Calculate(FFormula1,Col,Row,SheetIndex);
    if (Res1.ValType = fvBoolean) and Res1.vBoolean then
      Result := Self;
  end;
end;

function TCondFmtData.GetCompareCell: boolean;
begin
  Result := FRecCF.CFType = $01;
end;

function TCondFmtData.GetCompOperator: TConditionOperator;
begin
  Result := TConditionOperator(FRecCF.Operator_);
end;

function TCondFmtData.GetFormula1: WideString;
begin
  if FFormula1.Size > 0 then
    Result := FFormulaHandler.DecodeFormula(FFormula1.PTGS,FFormula1.Size)
  else
    Result := '';
end;

function TCondFmtData.GetFormula2: WideString;
begin
  if FFormula2.Size > 0 then
    Result := FFormulaHandler.DecodeFormula(FFormula2.PTGS,FFormula2.Size)
  else
    Result := '';
end;

function TCondFmtData.GetFormulaRel1(SheetIndex, Col, Row: integer): WideString;
begin
  if FFormula1.Size > 0 then
    Result := FFormulaHandler.DecodeFormulaRel(FFormula1.PTGS,FFormula1.Size,SheetIndex,Col,Row)
  else
    Result := '';
end;

function TCondFmtData.GetFormulaRel2(SheetIndex, Col, Row: integer): WideString;
begin
  if FFormula1.Size > 0 then
    Result := FFormulaHandler.DecodeFormulaRel(FFormula2.PTGS,FFormula2.Size,SheetIndex,Col,Row)
  else
    Result := '';
end;

procedure TCondFmtData.SaveToStream(Stream: TXLSStream; PBuf: PByteArray);
var
  Sz: integer;
begin
  Sz := 0;
  if FFmtFont.Assigned then begin
    FRecCF.Flags := FRecCF.Flags or $04000000;
    Inc(Sz,SizeOf(TCFFont));
  end;
  if FFmtBorder.Assigned then begin
    FRecCF.Flags := FRecCF.Flags or $10000000;
    if FFmtBorder.FAssigned[0] then
      FRecCF.Flags := FRecCF.Flags and not $00000400;
    if FFmtBorder.FAssigned[1] then
      FRecCF.Flags := FRecCF.Flags and not $00001000;
    if FFmtBorder.FAssigned[2] then
      FRecCF.Flags := FRecCF.Flags and not $00000800;
    if FFmtBorder.FAssigned[3] then
      FRecCF.Flags := FRecCF.Flags and not $00002000;
    Inc(Sz,SizeOf(TCFBorder));
  end;
  if FFmtPattern.Assigned then begin
    FRecCF.Flags := FRecCF.Flags or $20000000;
    if FFmtPattern.FAssigned[0] then
      FRecCF.Flags := FRecCF.Flags and not $00010000;
    if FFmtPattern.FAssigned[1] then
      FRecCF.Flags := FRecCF.Flags and not $00020000;
    if FFmtPattern.FAssigned[2] then
      FRecCF.Flags := FRecCF.Flags and not $00040000;
    Inc(Sz,SizeOf(TCFPattern));
  end;
  FRecCF.Formula1Size := FFormula1.Size;
  FRecCF.Formula2Size := FFormula2.Size;
  Inc(Sz,FFormula1.Size + FFormula2.Size);
  Stream.WriteHeader(BIFFRECID_CF,SizeOf(TRecCF) + Sz);
  Stream.Write(FRecCF^,SizeOf(TRecCF));
  if FFmtFont.Assigned then
    Stream.Write(FFmtFont.FCFFont,SizeOf(TCFFont));
  if FFmtBorder.Assigned then
    Stream.Write(FFmtBorder.FCFBorder,SizeOf(TCFBorder));
  if FFmtPattern.Assigned then
    Stream.Write(FFmtPattern.FCFPattern,SizeOf(TCFPattern));
  if FFormula1.Size > 0 then
    Stream.Write(FFormula1.PTGS^,FFormula1.Size);
  if FFormula2.Size > 0 then
    Stream.Write(FFormula2.PTGS^,FFormula2.Size);
end;

procedure TCondFmtData.SetCompareCell(const Value: boolean);
begin
  if Value then
    FRecCF.CFType := $01
  else
    FRecCF.CFType := $02;
end;

procedure TCondFmtData.SetCompOperator(const Value: TConditionOperator);
begin
  FRecCF.Operator_ := Word(Value);
end;

procedure TCondFmtData.SetFormula1(const Value: WideString);
begin
  if Value = '' then begin
    FreeMem(FFormula1.PTGS);
    FFormula1.PTGS := Nil;
  end
  else begin
    GetMem(FFormula1.PTGS,1024);
    FFormula1.Size := FFormulaHandler.EncodeFormula(Value,0,FFormula1.PTGS,1024,False);
    ReAllocMem(FFormula1.PTGS,FFormula1.Size);
    if FFormula1.Size = 0 then
      FFormula1.PTGS := Nil;
  end;
end;

procedure TCondFmtData.SetFormula2(const Value: WideString);
begin
  if Value = '' then begin
    FreeMem(FFormula2.PTGS);
    FFormula2.PTGS := Nil;
  end
  else begin
    GetMem(FFormula2.PTGS,1024);
    FFormula2.Size := FFormulaHandler.EncodeFormula(Value,0,FFormula2.PTGS,1024,False);
    ReAllocMem(FFormula2.PTGS,FFormula2.Size);
    if FFormula2.Size = 0 then
      FFormula2.PTGS := Nil;
  end;
end;

procedure TCondFmtData.SetFormulaRel1(SheetIndex, Col, Row: integer; const Value: WideString);
begin
  raise Exception.Create('SetFormulaRel1 not implemented');
end;

procedure TCondFmtData.SetFormulaRel2(SheetIndex, Col, Row: integer; const Value: WideString);
begin
  raise Exception.Create('SetFormulaRel2 not implemented');
end;

procedure TCondFmtData.SetRec(RecCF: PRecCF);
var
  P: PByteArray;
begin
  Move(RecCF^,FRecCF^,SizeOf(TRecCF));
  P := @RecCF.VarData;
  if (FRecCF.Flags and $04000000) = $04000000 then begin
    FFmtFont.SetRec(PCFFont(P));
    P := PByteArray(Integer(P) + SizeOf(TCFFont));
  end;
  if (FRecCF.Flags and $10000000) = $10000000 then begin
    FFmtBorder.SetRec(PCFBorder(P),FRecCF.Flags);
    P := PByteArray(Integer(P) + SizeOf(TCFBorder));
  end;
  if (FRecCF.Flags and $20000000) = $20000000 then begin
    FFmtPattern.SetRec(PCFPattern(P),FRecCF.Flags);
    P := PByteArray(Integer(P) + SizeOf(TCFPattern));
  end;
  FFormula1.Size := FRecCF.Formula1Size;
  if FFormula1.Size > 0 then begin
    GetMem(FFormula1.PTGS,FFormula1.Size);
    Move(P^,FFormula1.PTGS^,FFormula1.Size);
    P := PByteArray(Integer(P) + FFormula1.Size);
  end;
  FFormula2.Size := FRecCF.Formula2Size;
  if FFormula2.Size > 0 then begin
    GetMem(FFormula2.PTGS,FFormula2.Size);
    Move(P^,FFormula2.PTGS^,FFormula2.Size);
  end;
end;

{ TConditionalFormat }

procedure TConditionalFormat.Assign(Source: TPersistent);
begin
  FCond1.Assign(TConditionalFormat(Source).FCond1);
  FCond2.Assign(TConditionalFormat(Source).FCond2);
  FCond3.Assign(TConditionalFormat(Source).FCond3);
  FAreas.Assign(TConditionalFormat(Source).FAreas);
end;

function TConditionalFormat.Assigned: integer;
begin
  Result := 0;
  if FCond1.Assigned then
    Inc(Result);
  if FCond2.Assigned then
    Inc(Result);
  if FCond3.Assigned then
    Inc(Result);
end;

constructor TConditionalFormat.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FCond1 := TCondFmtData.Create(TConditionalFormats(Collection).FFormulaHandler);
  FCond2 := TCondFmtData.Create(TConditionalFormats(Collection).FFormulaHandler);
  FCond3 := TCondFmtData.Create(TConditionalFormats(Collection).FFormulaHandler);
  FAreas := TCellAreas.Create(Self);
end;

destructor TConditionalFormat.Destroy;
begin
  FCond1.Free;
  FCond2.Free;
  FCond3.Free;
  FAreas.Free;
  inherited;
end;

procedure TConditionalFormat.Delete(Col1, Row1, Col2, Row2: integer);
begin
  FAreas.Delete(Col1, Row1, Col2, Row2);
end;

function TConditionalFormat.Intersect(Col1, Row1, Col2, Row2: integer): boolean;
begin
  Result := FAreas.AreaInAreas(Col1, Row1, Col2, Row2);
end;

procedure TConditionalFormat.Copy(Col1, Row1, Col2, Row2,DeltaCol,DeltaRow: integer);
begin
  FAreas.Copy(Col1, Row1, Col2, Row2,DeltaCol,DeltaRow);
end;

procedure TConditionalFormat.Move(DeltaCol, DeltaRow: integer);
begin
  FAreas.Move(DeltaCol, DeltaRow);
end;

procedure TConditionalFormat.Move(Col1, Row1, Col2, Row2, DeltaCol, DeltaRow: integer);
begin
  FAreas.Move(Col1, Row1, Col2, Row2, DeltaCol, DeltaRow);
end;

procedure TConditionalFormat.SaveToStream(Stream: TXLSStream; PBuf: PByteArray);
var
  i: integer;
  Ext: TRecCellArea;
begin
  FAreas.NormalizeAll;
  Ext := FAreas.TotExtent;
  Stream.WriteHeader(BIFFRECID_CONDFMT,SizeOf(TRecCONDFMT) + ((FAreas.Count - 1) * SizeOf(TRecCellArea)));
  Stream.WWord(Assigned);
  Stream.WWord($0001);
  Stream.WriteCellArea(Ext);
  Stream.WWord(FAreas.Count);
  for i := 0 to FAreas.Count - 1 do
    Stream.WriteCellArea(FAreas[i].AsRecArea);
  if FCond1.Assigned then
    FCond1.SaveToStream(Stream,PBuf);
  if FCond2.Assigned then
    FCond2.SaveToStream(Stream,PBuf);
  if FCond3.Assigned then
    FCond3.SaveToStream(Stream,PBuf);
end;

procedure TConditionalFormat.Include(Col1, Row1, Col2, Row2: integer);
begin
  FAreas.Include(Col1, Row1, Col2, Row2);
end;

function TConditionalFormat.Evaluate(Val: TFormulaValue; Col,Row,SheetIndex: integer): TCondFmtData;
begin
  Result := FCond1.Evaluate(Val,Col,Row,SheetIndex);
  if (Result = Nil) and FCond2.Assigned then begin
    Result := FCond2.Evaluate(Val,Col,Row,SheetIndex);
    if (Result = Nil) and FCond3.Assigned then
      Result := FCond3.Evaluate(Val,Col,Row,SheetIndex);
  end;
end;

{ TConditionalFormats }

function TConditionalFormats.Add: TConditionalFormat;
begin
  Result := TConditionalFormat(inherited Add);
end;

constructor TConditionalFormats.Create(AOwner: TPersistent; FmlaHandler: TFormulaHandler);
begin
  inherited Create(TConditionalFormat);
  FOwner := AOwner;
  FFormulaHandler := FmlaHandler;
end;

function TConditionalFormats.Find(Col, Row: integer): TConditionalFormat;
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    if Items[i].Areas.CellInAreas(Col,Row) >= 0 then begin
      Result := Items[i];
      Exit;
    end;
  end;
  Result := Nil;
end;

function TConditionalFormats.GetItems(Index: integer): TConditionalFormat;
begin
  Result := TConditionalFormat(inherited Items[Index]);
end;

function TConditionalFormats.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TConditionalFormats.LoadFromStream(Stream: TXLSStream; PBuf: PByteArray);
var
  i,Count: integer;
  CONDFMT: TConditionalFormat;

procedure ReadCF(CF: TCondFmtData);
var
  Header: TBIFFHeader;
begin
  if Stream.PeekHeader <> BIFFRECID_CF then
    raise Exception.Create('Excpected record missing: CF');
  Stream.ReadHeader(Header);
  Stream.Read(PBuf^,Header.Length);
  CF.SetRec(PRecCF(PBuf));
end;

begin
  CONDFMT := Add;
  for i := 0 to PRecCONDFMT(PBuf).AreaCount - 1 do
    CONDFMT.FAreas.Add(@PRecCONDFMT(PBuf).Areas[i]);
  if (PRecCONDFMT(PBuf).CFCount < 1) or (PRecCONDFMT(PBuf).CFCount > 3) then
    raise Exception.Create('Bad number of CF records.');
  Count := PRecCONDFMT(PBuf).CFCount;
  if Count >= 1 then
    ReadCF(CONDFMT.FCond1);
  if Count >= 2 then
    ReadCF(CONDFMT.FCond2);
  if Count >= 3 then
    ReadCF(CONDFMT.FCond3);
end;

procedure TConditionalFormats.SaveToStream(Stream: TXLSStream; PBuf: PByteArray);
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    if (Items[i].Assigned > 0) and (Items[i].FAreas.Count > 0) then
      Items[i].SaveToStream(Stream,PBuf);
  end;
end;

end.
