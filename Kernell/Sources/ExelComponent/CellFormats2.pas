unit CellFormats2;

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

uses SysUtils, Classes,
{$ifndef LINUX}
     Graphics,
{$endif}
     BIFFRecsII2, ExcelMaskII2, Dialogs, XLSFonts2,
     XLSUtils2, ContNrs;

const ExcelStandardNumFormats: array[0..49] of WideString = (
{00} '',
{01} '0',
{02} '0.00',
{03} '#,##0',
{04} '#,##0.00',
{05} '_($#,##0_);($#,##0)',
{06} '_($#,##0_);[Red]($#,##0)',
{07} '_($#,##0.00_);($#,##0.00)',
{08} '_($#,##0.00_);[Red]($#,##0.00)',
{09} '0%',
{0A} '0.00%',
{0B} '0.00E+00',
{0C} '# ?/?',
{0D} '# ??/??',
{0E} 'm/d/yy',          // Localized date format in Excel.
{0F} 'd-mmm-y',
{10} 'd-mmm',
{11} 'mmmm-yy',
{12} 'h:mm AM/PM',
{13} 'h:mm:ss AM/PM',
{14} 'h:mm',            // Localized time format in Excel.
{15} 'h:mm:SS',
{16} 'm/d/yy h:mm',
{17} // Format $17 - $24 are undocumented.
{18} '',
{19} '',
{1A} '',
{1B} '',
{1C} '',
{1D} '',
{1E} '',
{1F} '',
{20} '',
{21} '',
{22} '',
{23} '',
{24} '',
{25} '',
{26} '#,##0_);(#,##0)',
{27} '#,##0_);[Red](#,##0)',
{28} '#,##0.00_);(#,##0.00)',
{29} '#,##0.00_);[Red](#,##0.00)',
{2A} '_(* #,##0_);_(* (#,##0);_(* "-"_);_(@_)',
{2B} '_($* #,##0_);_($* (#,##0);_($* "-"_);_(@_)',
{2C} '_(* #,##0.00_);_(* (#,##0.00);_(* "-"??_);_(@_)',
{2D} '_($* #,##0.00_);_($* (#,##0.00);_($* "-"??_);_(@_)',
{2E} 'mm:ss',
{2F} '[h]:mm:ss',
{30} 'mm:ss.0',
{31} '# #0.0E+0',
{32} '@');

const NUMFORMAT_DATE = 14;
const NUMFORMAT_TIME = 20;

type TCellProtection = (cpLocked, //* Cell is locked. This does not mean that the cell value not can be
                                  //* changed. To prevent the cell from being changed, the worksheet has to be locked.
                        cpHidden  //* Cell value is hidden.
                        );
     TCellProtections = set of TCellProtection;

//* Horizontal alignment of text in cells. <br>
type TCellHorizAlignment = (chaGeneral,     //* No alignment.
                            chaLeft,        //* Left alignment
                            chaCenter,      //* Center alignment.
                            chaRight,       //* Right alignment.
                            chaFill,        //* Fill's the entire cell with the text or character. Like: 'XXXXXXXXXX'.
                            chaJustify,     //* Justify's the word space to fit the text in the cell.
                            chaCenterAcross //* Don't know what this is.
                            );


//* cvaTop = Top alignment. <br>//* cvaTop = Top alignment. <br>


//* Vertical alignment of text in cells.
type TCellVertAlignment = (cvaTop,        //* Top alignment.
                           cvaCenter,     //* Center alignment.
                           cvaBottom,     //* Bottom alignment.
                           cvaJustify,    //* Justify's the line space to fit the text in the cell.
                           cvaDistributed //* Text vertical distributed in cell.
                           );

//* Cell border line style.
type TCellBorderStyle = (cbsNone,             //* Cell has no border lines.
                         cbsThin,             //* Thin lines.
                         cbsMedium,           //* Medium lines.
                         cbsDashed,           //* Dashed lines.
                         cbsDotted,           //* Dotted lines.
                         cbsThick,            //* Thick lines.
                         cbsDouble,           //* Double lines.
                         cbsHair,             //* Hair lines.
                         cbsMediumDashed,     //* Medium dashed lines.
                         cbsDashDot,          //* Dash dot lines.
                         cbsMediumDashDot,    //* Medium dash dot lines.
                         cbsDashDotDot,       //* Dash dot dot lines.
                         cbsMediumDashDotDot, //* Medium dash dot dot lines.
                         cbsSlantedDashDot    //* Slanted dash dot lines.
                         );

//* Diagonal lines in cells.
type TDiagLines =        (dlNone,  //* No diagonal lines.
                          dlDown,  //* Lines from upper left corner to lower right.
                          dlUp,    //* Lines from lower left corner to upper right.
                          dlBoth   //* Both dlUp and dlDown.
                          );

type TFormatOption = (foWrapText,   //* Wrap text in cells.
                      foShrinkToFit //* Shrink text to fit horizontal cell space. The result is
                                    //* that the font size is changed so the text fit's the cell's horizontal size.
                      );
     TFormatOptions = set of TFormatOption;

//* ~exclude
type TCellFormats = class;

//* ~exclude
     TCellFormat = class(TObject)
private
     FParent: TCellFormats;
     FIndex: integer;
     FUsageCount: integer;
     FXF: TRecXF8;

     procedure SetIndent(const Value: byte);
     procedure SetRotation(const Value: smallint);
     function  GetRotation: smallint;
     function  GetFormatOptions: TFormatOptions;
     function  GetHorizAlignment: TCellHorizAlignment;
     function  GetIndent: byte;
     function  GetProtection: TCellProtections;
     function  GetVertAlignment: TCellVertAlignment;
     procedure SetFFormatOptions(const Value: TFormatOptions);
     procedure SetHorizAlignment(const Value: TCellHorizAlignment);
     procedure SetProtection(const Value: TCellProtections);
     procedure SetVertAlignment(const Value: TCellVertAlignment);
     function  GetMerged: boolean;
     procedure SetMerged(const Value: boolean);
     function  GetBorderBottomColor: TExcelColor;
     function  GetBorderBottomStyle: TCellBorderStyle;
     function  GetBorderDiagColor: TExcelColor;
     function  GetBorderDiagLines: TDiagLines;
     function  GetBorderDiagStyle: TCellBorderStyle;
     function  GetBorderLeftColor: TExcelColor;
     function  GetBorderLeftStyle: TCellBorderStyle;
     function  GetBorderRightColor: TExcelColor;
     function  GetBorderRightStyle: TCellBorderStyle;
     function  GetBorderTopColor: TExcelColor;
     function  GetBorderTopStyle: TCellBorderStyle;
     function  GetFillPatternBackColor: TExcelColor;
     function  GetFillPatternForeColor: TExcelColor;
     function  GetFillPatternPattern: TExcelFillPattern;
     procedure SetBorderBottomColor(const Value: TExcelColor);
     procedure SetBorderBottomStyle(const Value: TCellBorderStyle);
     procedure SetBorderDiagColor(const Value: TExcelColor);
     procedure SetBorderDiagLines(const Value: TDiagLines);
     procedure SetBorderDiagStyle(const Value: TCellBorderStyle);
     procedure SetBorderLeftColor(const Value: TExcelColor);
     procedure SetBorderLeftStyle(const Value: TCellBorderStyle);
     procedure SetBorderRightColor(const Value: TExcelColor);
     procedure SetBorderRightStyle(const Value: TCellBorderStyle);
     procedure SetBorderTopColor(const Value: TExcelColor);
     procedure SetBorderTopStyle(const Value: TCellBorderStyle);
     procedure SetFillPatternBackColor(const Value: TExcelColor);
     procedure SetFillPatternForeColor(const Value: TExcelColor);
     procedure SetFillPatternPattern(const Value: TExcelFillPattern);

//     procedure OnFontChanged(NewIndex: word);
     function  GetXFont: TXFont;
protected
     function  GetNumberFormat: WideString;
     procedure SetNumberFormat(Value: WideString);
public
     constructor Create(Parent: TCellFormats); overload;
     constructor Create(Parent: TCellFormats; FormatIndex: word); overload;
     destructor Destroy; override;
     procedure Assign(Source: TCellFormat); overload;
     function  FormatIsDateTime: boolean;
     function  Equal(F: TCellFormat): boolean;

     // **********************************************
     // *********** For internal use only. ***********
     // **********************************************
     procedure FromXF8(P: PByteArray);
     procedure FromXF7(P: PByteArray);
     procedure FromXF4(P: PByteArray);
     procedure ToXF8(var P: PByteArray);
     procedure ToXF7(var P: PByteArray);
     procedure ToXF4(var P: PByteArray);
     procedure IncUsageCount;

     property Merged: boolean                     read GetMerged               write SetMerged;
     property NumberFormatIndex: word             read FXF.NumFmtIndex;
     property UsageCount: integer                 read FUsageCount             write FUsageCount;
     // **********************************************
     // *********** End internal use only. ***********
     // **********************************************

     property Index: integer                      read FIndex;
     property XFont: TXFont                       read GetXFont;
     property FontIndex: word                     read FXF.FontIndex           write FXF.FontIndex;

     property Protection: TCellProtections        read GetProtection           write SetProtection;
     property HorizAlignment: TCellHorizAlignment read GetHorizAlignment       write SetHorizAlignment;
     property VertAlignment: TCellVertAlignment   read GetVertAlignment        write SetVertAlignment;
     property Indent: byte                        read GetIndent               write SetIndent;
     property Rotation: smallint                  read GetRotation             write SetRotation;
     property FormatOptions: TFormatOptions       read GetFormatOptions        write SetFFormatOptions;
     property FillPatternForeColor: TExcelColor   read GetFillPatternForeColor write SetFillPatternForeColor;
     property FillPatternBackColor: TExcelColor   read GetFillPatternBackColor write SetFillPatternBackColor;
     property FillPatternPattern: TExcelFillPattern read GetFillPatternPattern   write SetFillPatternPattern;
     property NumberFormat: WideString            read GetNumberFormat         write SetNumberFormat;
//     property Font: TXFont                        read FFont                   write SetFont;

     property BorderTopColor: TExcelColor         read GetBorderTopColor       write SetBorderTopColor;
     property BorderTopStyle: TCellBorderStyle    read GetBorderTopStyle       write SetBorderTopStyle;
     property BorderLeftColor: TExcelColor        read GetBorderLeftColor      write SetBorderLeftColor;
     property BorderLeftStyle: TCellBorderStyle   read GetBorderLeftStyle      write SetBorderLeftStyle;
     property BorderRightColor: TExcelColor       read GetBorderRightColor     write SetBorderRightColor;
     property BorderRightStyle: TCellBorderStyle  read GetBorderRightStyle     write SetBorderRightStyle;
     property BorderBottomColor: TExcelColor      read GetBorderBottomColor    write SetBorderBottomColor;
     property BorderBottomStyle: TCellBorderStyle read GetBorderBottomStyle    write SetBorderBottomStyle;
     property BorderDiagColor: TExcelColor        read GetBorderDiagColor      write SetBorderDiagColor;
     property BorderDiagStyle: TCellBorderStyle   read GetBorderDiagStyle      write SetBorderDiagStyle;
     property BorderDiagLines: TDiagLines         read GetBorderDiagLines      write SetBorderDiagLines;
     end;

//* ~exclude
     TNumberFormat = class(TObject)
private
     FHash: word;
     FValue: WideString;
     FIndexId: integer;
     // A negative FUsageCount means that the number format is internal, and
     // not can be deleted.
     FUsageCount: integer;
public
     procedure CreateHash;
     function  IsDefault: boolean;

     property Value: WideString read FValue write FValue;
     property IndexId: integer read FIndexId write FIndexId;
     property UsageCount: integer read FUsageCount write FUsageCount;
     end;

//* ~exclude
     TNumberFormats = class(TObjectList)
private
     FCurrentId: integer;
     FSorted: boolean;

     function  Find(IndexId: integer): integer;
     function  FindValue(Value: WideString): integer;
     function  GetItems(IndexId: integer): TNumberFormat;
     function  GetItemsByIndex(Index: integer): TNumberFormat;
     procedure SetItemsByIndex(Index: integer; const Value: TNumberFormat);
public
     constructor Create;
     destructor Destroy; override;
     function  Add(Value: WideString): TNumberFormat;
     // Only used when reading files.
     function  AddSorted(Value: WideString; IndexId,UsageCount: integer): TNumberFormat;
     procedure DeleteById(IndexId: integer);
     procedure IncUsageById(IndexId: integer);
     procedure SetDefault;
     procedure Sort;

     property Items[IndexId: integer]: TNumberFormat read GetItems; // default;
     property ItemsByIndex[Index: integer]: TNumberFormat read GetItemsByIndex write SetItemsByIndex;
     property Sorted: boolean read FSorted;
     end;

//* ~exclude
     TCellFormats = class(TObjectList)
private
     function  GetItems(Index: integer): TCellFormat;
protected
     FFonts: TXFonts;
     FNumberFormats: TNumberFormats;
     FDeleteIndex: integer;
     FXLSMask: TExcelMask;

     procedure AddDefXF;
public
     constructor Create(Fonts: TXFonts);
     destructor Destroy; override;
     procedure Clear; override;
     procedure SetDefault;
     procedure Delete(Index: integer);
     function  Add: TCellFormat; overload;
     function  Find(F: TCellFormat): TCellFormat; overload;
     function  FindIndex(F: TCellFormat): integer; overload;
     procedure UpdateDeleteIndex;

     property  Items[IndexId: integer]: TCellFormat read GetItems; default;
     property  NumberFormats: TNumberFormats read FNumberFormats;
     property  Fonts: TXFonts read FFonts;
     property  DeleteIndex: integer read FDeleteIndex;
     property  XLSMask: TExcelMask read FXLSMask;
     end;

//* ~exclude
type TFormatEvent = procedure(Format: TCellFormat; Index: integer) of object;

implementation

const
  DefaultData1 = $0001;
  DefaultData2 = $0020;
  DefaultData3 = $0000;
  DefaultData4 = $0000;
  DefaultData5 = $2040;
  DefaultData6 = $00102040;
  DefaultData7 = $20C0;

const DefaultXF8: array[0..20] of TRecXF8 = (
(FontIndex: 0;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $0000;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 1;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 1;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 2;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 2;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: 0;Data1: $FFF5;Data2: $0020;Data3: $F400;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: 0;Data1: $0001;Data2: $0020;Data3: $0000;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
// The last 5 XF records are for the STYLE records.
(FontIndex: 0;NumFmtIndex: $2A;Data1: $FFF5;Data2: $0020;Data3: $0000;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: $2B;Data1: $FFF5;Data2: $0020;Data3: $0000;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: $2C;Data1: $FFF5;Data2: $0020;Data3: $0000;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: $2D;Data1: $FFF5;Data2: $0020;Data3: $0000;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0),
(FontIndex: 0;NumFmtIndex: $09;Data1: $FFF5;Data2: $0020;Data3: $0000;Data4: $0000;Data5: $0000;Data6: $00000000;Data7: $20C0));

{ TCellFormats }

constructor TCellFormats.Create(Fonts: TXFonts);
begin
  inherited Create;
  FFonts := Fonts;
  FNumberFormats := TNumberFormats.Create;
  FXLSMask := TExcelMask.Create;
  SetDefault;
end;

destructor TCellFormats.Destroy;
begin
  inherited Destroy;
  FNumberFormats.Free;
  FNumberFormats := Nil;
  FXLSMask.Free;
end;

procedure TCellFormats.Clear;
begin
  inherited Clear;
  FNumberFormats.Clear;
end;

procedure TCellFormats.SetDefault;
begin
  FNumberFormats.SetDefault;
  AddDefXF;
  FDeleteIndex := Count;
end;

procedure TCellFormats.Delete(Index: integer);
var
  i: integer;
begin
  inherited Delete(Index);
  for i := Index to Count - 1 do
    Dec(Items[i].FIndex);
  Exit;

  if Index >= DEFAULT_FORMATS_COUNT_97 then begin
    Items[Index].Free;
    inherited Delete(Index);
    for i := Index to Count - 1 do
      Dec(Items[i].FIndex);
  end;
end;

function TCellFormats.GetItems(Index: integer): TCellFormat;
begin
  Result := TCellFormat(inherited Items[Index]);
end;

function TCellFormats.Add: TCellFormat;
begin
  Result := TCellFormat.Create(Self);
  Result.FIndex := Count;
  inherited Add(Result);
end;

procedure TCellFormats.AddDefXF;
var
  i: integer;
  Fmt: TCellFormat;
begin
  if Count > 0 then
    raise Exception.Create('Add default formats when not empty.');
  for i := 0 to High(DefaultXF8) do begin
    Fmt := TCellFormat.Create(Self);
    Fmt.FromXF8(@DefaultXF8[i]);
    Fmt.FIndex := i;
    if DefaultXF8[i].NumFmtIndex > 0 then
      FNumberFormats.ItemsByIndex[DefaultXF8[i].NumFmtIndex].FUsageCount := 1;
    inherited Add(Fmt);
  end;
end;

function TCellFormats.Find(F: TCellFormat): TCellFormat;
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    if Items[i].Equal(F) then begin
      Result := Items[i];
      Exit;
    end;
  end;
  Result := Nil;
end;

function TCellFormats.FindIndex(F: TCellFormat): integer;
begin
  for Result := 0 to Count - 1 do begin
    if Items[Result].Equal(F) then
      Exit;
  end;
  Result := -1;
end;

procedure TCellFormats.UpdateDeleteIndex;
begin
  FDeleteIndex := Count;
end;

{ TCellFormat }

constructor TCellFormat.Create(Parent: TCellFormats);
begin
  FParent := Parent;
  FXF.Data1 := DefaultData1;
  FXF.Data2 := DefaultData2;
  FXF.Data3 := DefaultData3;
  FXF.Data4 := DefaultData4;
  FXF.Data5 := DefaultData5;
  FXF.Data6 := DefaultData6;
  FXF.Data7 := DefaultData7;
  FXF.NumFmtIndex := 0;
  FXF.FontIndex := 0;
end;

constructor TCellFormat.Create(Parent: TCellFormats; FormatIndex: word);
begin
  FParent := Parent;
  Assign(FParent[FormatIndex]);
end;

procedure TCellFormat.Assign(Source: TCellFormat);
begin
  Move(Source.FXF,FXF,SizeOf(TRecXF8));
  Inc(FParent.FNumberFormats.Items[FXF.NumFmtIndex].FUsageCount);
end;

function TCellFormat.GetNumberFormat: WideString;
begin
  if FParent <> Nil then
    Result := FParent.FNumberFormats.Items[FXF.NumFmtIndex].Value
  else
    Result := '';
end;

procedure TCellFormat.SetNumberFormat(Value: WideString);
var
  Mask: TExcelMask;
begin
  if FParent = Nil then
    raise Exception.Create('CellFormat has no parent');
  if Value = '' then
    FXF.NumFmtIndex := 0
  else begin
    Mask := TExcelMask.Create;
    try
      Mask.Mask := Value;
    finally
      Mask.Free;
    end;
    FXF.NumFmtIndex := FParent.FNumberFormats.Add(Value).FIndexId;
  end;
end;

function TCellFormat.FormatIsDateTime: boolean;
begin
  Result := FXF.NumFmtIndex in [$0E,$14];
end;

function TCellFormat.GetBorderBottomColor: TExcelColor;
begin
  Result := TExcelColor((FXF.Data6 and $00003F80) shr 7);
end;

function TCellFormat.GetBorderBottomStyle: TCellBorderStyle;
begin
  Result := TCellBorderStyle((FXF.Data4 and $F000) shr 12);
end;

function TCellFormat.GetBorderDiagColor: TExcelColor;
begin
  Result := TExcelColor((FXF.Data6 and $001FC000) shr 14);
end;

function TCellFormat.GetBorderDiagLines: TDiagLines;
begin
  Result := TDiagLines((FXF.Data5 and $C000) shr 14);
end;

function TCellFormat.GetBorderDiagStyle: TCellBorderStyle;
begin
  Result := TCellBorderStyle((FXF.Data6 and $01E00000) shr 21);
end;

function TCellFormat.GetBorderLeftColor: TExcelColor;
begin
  Result := TExcelColor((FXF.Data5 and $007F) shr 0);
end;

function TCellFormat.GetBorderLeftStyle: TCellBorderStyle;
begin
  Result := TCellBorderStyle((FXF.Data4 and $000F) shr 0);
end;

function TCellFormat.GetBorderRightColor: TExcelColor;
begin
  Result := TExcelColor((FXF.Data5 and $3F80) shr 7);
end;

function TCellFormat.GetBorderRightStyle: TCellBorderStyle;
begin
  Result := TCellBorderStyle((FXF.Data4 and $00F0) shr 4);
end;

function TCellFormat.GetBorderTopColor: TExcelColor;
begin
  Result := TExcelColor((FXF.Data6 and $0000007F) shr 0);
end;

function TCellFormat.GetBorderTopStyle: TCellBorderStyle;
begin
  Result := TCellBorderStyle((FXF.Data4 and $0F00) shr 8);
end;

function TCellFormat.GetFillPatternBackColor: TExcelColor;
var
  V: word;
begin
  V := FXF.Data7 and $3F80;
  V := V shr 7;
  if V > Word(Ord(xcAutomatic)) then
    V := Ord(xcAutomatic);
  Result := TExcelColor(V);
end;

function TCellFormat.GetFillPatternForeColor: TExcelColor;
begin
  Result := TExcelColor((FXF.Data7 and $007F) shr 0);
end;

function TCellFormat.GetFillPatternPattern: TExcelFillPattern;
begin
  Result := TExcelFillPattern((FXF.Data6 and $FC000000) shr 26);
end;

function TCellFormat.GetFormatOptions: TFormatOptions;
begin
  Result := [];
  if ((FXF.Data2 and $0008) shr 3) > 0 then
    Result := [foWrapText];
  if ((FXF.Data3 and $0010) shr 4) > 0 then
    Result := Result + [foShrinkToFit];
end;

function TCellFormat.GetHorizAlignment: TCellHorizAlignment;
begin
  Result := TCellHorizAlignment(FXF.Data2 and $0007);
end;

function TCellFormat.GetIndent: byte;
begin
  Result := FXF.Data3 and $000F;
end;

function TCellFormat.GetMerged: boolean;
begin
  Result := (FXF.Data3 and $0020) = $0020;
end;

function TCellFormat.GetProtection: TCellProtections;
begin
  Result := TCellProtections(Byte(FXF.Data1 and $0003));
end;

function TCellFormat.GetRotation: smallint;
begin
  Result := FXF.Data2 shr 8;
  if (Result > 90) and (Result <> 255) then
    Result := -(Result - 90)
end;

function TCellFormat.GetVertAlignment: TCellVertAlignment;
begin
  Result := TCellVertAlignment((FXF.Data2 and $0070) shr 4);
end;

procedure TCellFormat.SetBorderBottomColor(const Value: TExcelColor);
begin
  FXF.Data6 := FXF.Data6 and (not $00003F80);
  FXF.Data6 := FXF.Data6 + (Longword(Value) shl 7);
end;

procedure TCellFormat.SetBorderBottomStyle(const Value: TCellBorderStyle);
begin
  FXF.Data4 := FXF.Data4 and (not $F000);
  FXF.Data4 := FXF.Data4 + (Word(Value) shl 12);
  if (FXF.Data4 <> 0) or ((FXF.Data6 and $01E00000) <> 0) then
    FXF.Data3 := FXF.Data3 or $2000
  else
    FXF.Data3 := FXF.Data3 and (not $2000);
end;

procedure TCellFormat.SetBorderDiagColor(const Value: TExcelColor);
begin
  FXF.Data6 := FXF.Data6 and (not $001FC000);
  FXF.Data6 := FXF.Data6 + (Longword(Value) shl 14);
end;

procedure TCellFormat.SetBorderDiagLines(const Value: TDiagLines);
begin
  FXF.Data5 := FXF.Data5 and (not $C000);
  FXF.Data5 := FXF.Data5 + (Word(Value) shl 14);
end;

procedure TCellFormat.SetBorderDiagStyle(const Value: TCellBorderStyle);
begin
  FXF.Data6 := FXF.Data6 and (not $01E00000);
  FXF.Data6 := FXF.Data6 + (Longword(Value) shl 21);
  if (FXF.Data4 <> 0) or ((FXF.Data6 and $01E00000) <> 0) then
    FXF.Data3 := FXF.Data3 or $2000
  else
    FXF.Data3 := FXF.Data3 and (not $2000);
end;

procedure TCellFormat.SetBorderLeftColor(const Value: TExcelColor);
begin
  FXF.Data5 := FXF.Data5 and (not $007F);
  FXF.Data5 := FXF.Data5 + (Word(Value) shl 0);
end;

procedure TCellFormat.SetBorderLeftStyle(const Value: TCellBorderStyle);
begin
  FXF.Data4 := FXF.Data4 and (not $000F);
  FXF.Data4 := FXF.Data4 + (Word(Value) shl 0);
  if (FXF.Data4 <> 0) or ((FXF.Data6 and $01E00000) <> 0) then
    FXF.Data3 := FXF.Data3 or $2000
  else
    FXF.Data3 := FXF.Data3 and (not $2000);
end;

procedure TCellFormat.SetBorderRightColor(const Value: TExcelColor);
begin
  FXF.Data5 := FXF.Data5 and (not $3F80);
  FXF.Data5 := FXF.Data5 + (Word(Value) shl 7);
end;

procedure TCellFormat.SetBorderRightStyle(const Value: TCellBorderStyle);
begin
  FXF.Data4 := FXF.Data4 and (not $00F0);
  FXF.Data4 := FXF.Data4 + (Word(Value) shl 4);
  if (FXF.Data4 <> 0) or ((FXF.Data6 and $01E00000) <> 0) then
    FXF.Data3 := FXF.Data3 or $2000
  else
    FXF.Data3 := FXF.Data3 and (not $2000);
end;

procedure TCellFormat.SetBorderTopColor(const Value: TExcelColor);
begin
  FXF.Data6 := FXF.Data6 and (not $0000007F);
  FXF.Data6 := FXF.Data6 + (Longword(Value) shl 0);
end;

procedure TCellFormat.SetBorderTopStyle(const Value: TCellBorderStyle);
begin
  FXF.Data4 := FXF.Data4 and (not $0F00);
  FXF.Data4 := FXF.Data4 + (Word(Value) shl 8);
  if (FXF.Data4 <> 0) or ((FXF.Data6 and $01E00000) <> 0) then
    FXF.Data3 := FXF.Data3 or $2000
  else
    FXF.Data3 := FXF.Data3 and (not $2000);
end;

procedure TCellFormat.SetFFormatOptions(const Value: TFormatOptions);
begin
  FXF.Data2 := FXF.Data2 and (not ($0008 + $0010 + $0070));
  if foWrapText in Value then
    FXF.Data2 := FXF.Data2 + $0008;
  if foShrinkToFit in Value then
    FXF.Data3 := FXF.Data3 + $0010;
  if ((FXF.Data2 and $0008) <> 0) or ((FXF.Data2 and $0007) <> 0) then
    FXF.Data3 := FXF.Data3 or $1000
  else
    FXF.Data3 := FXF.Data3 and (not $1000);
end;

procedure TCellFormat.SetFillPatternBackColor(const Value: TExcelColor);
begin
  FXF.Data7 := FXF.Data7 and (not $3F80);
  FXF.Data7 := FXF.Data7 + (Word(Value) shl 7);
  if (FXF.Data7 and ($007F + $3F80)) <> $2040 then
    FXF.Data3 := FXF.Data3 or $4000
  else
    FXF.Data3 := FXF.Data3 and (not $4000);
end;

procedure TCellFormat.SetFillPatternForeColor(const Value: TExcelColor);
begin
  FXF.Data7 := FXF.Data7 and (not $007F);
  FXF.Data7 := FXF.Data7 + (Word(Value) shl 0);
  if (FXF.Data7 and ($007F + $3F80)) <> $2040 then
    FXF.Data3 := FXF.Data3 or $4000
  else
    FXF.Data3 := FXF.Data3 and (not $4000);
  if Value <> xcAutomatic then begin
    SetFillPatternPattern(fpPattern1);
    SetFillPatternBackColor(xcWhite);
  end;
end;

procedure TCellFormat.SetFillPatternPattern(const Value: TExcelFillPattern);
begin
  FXF.Data6 := FXF.Data6 and (not $FC000000);
  FXF.Data6 := FXF.Data6 + ((Longword(Value) shl 26) and $FC000000);
  if Value <> fpNone then
    FXF.Data3 := FXF.Data3 or $4000
  else
    FXF.Data3 := FXF.Data3 and (not $4000);
end;

procedure TCellFormat.SetHorizAlignment(const Value: TCellHorizAlignment);
begin
  FXF.Data2 := FXF.Data2 and (not $0007);
  FXF.Data2 := FXF.Data2 + (Word(Value) shl 0);
  if ((FXF.Data2 and $0008) <> 0) or ((FXF.Data2 and $0007) <> 0) or ((FXF.Data2 and $0070) <> 0) then
    FXF.Data3 := FXF.Data3 or $1000
  else
    FXF.Data3 := FXF.Data3 and (not $1000);
end;

procedure TCellFormat.SetIndent(const Value: byte);
begin
  FXF.Data3 := FXF.Data3 and (not $000F);
  FXF.Data3 := FXF.Data3 + (Word(Value and $0F) and $000F);
end;

procedure TCellFormat.SetMerged(const Value: boolean);
begin
  FXF.Data3 := FXF.Data3 and (not $0020);
  if Value then
    FXF.Data3 := FXF.Data3 + $0020;
end;

procedure TCellFormat.SetProtection(const Value: TCellProtections);
begin
  FXF.Data1 := FXF.Data1 and (not $0003);
  if cpLocked in Value then
    FXF.Data1 := FXF.Data1 + $0001;
  if cpHidden in Value then
    FXF.Data1 := FXF.Data1 + $0002;
end;

procedure TCellFormat.SetRotation(const Value: smallint);
var
  V: byte;
begin
  if Value >= 255 then
    V := 255
  else if Value > 90 then
    V := 90
  else if Value < -90 then
    V := 180
  else if Value < 0 then
    V := -Value + 90
  else
    V := Value;
  FXF.Data2 := (FXF.Data2 and $00FF) + (V shl 8);
end;

procedure TCellFormat.SetVertAlignment(const Value: TCellVertAlignment);
begin
  FXF.Data2 := FXF.Data2 and (not $0070);
  FXF.Data2 := FXF.Data2 + (Word(Value) shl 4);
  if ((FXF.Data2 and $0008) <> 0) or ((FXF.Data2 and $0007) <> 0) or ((FXF.Data2 and $0070) <> 0) then
    FXF.Data3 := FXF.Data3 or $1000
  else
    FXF.Data3 := FXF.Data3 and (not $1000);
end;

procedure TCellFormat.FromXF4(P: PByteArray);

function Get4BorderStyle(Value: byte): TCellBorderStyle;
begin
  case Value of
    0: Result := cbsNone;
    1: Result := cbsThin;
    2: Result := cbsMedium;
    3: Result := cbsDashed;
    4: Result := cbsDotted;
    5: Result := cbsThick;
    6: Result := cbsDouble;
    7: Result := cbsHair;
    else
      Result := cbsNone;
  end;
end;

begin
  FXF.Data1 := DefaultData1;
  FXF.Data2 := DefaultData2;
  FXF.Data3 := DefaultData3;
  FXF.Data4 := DefaultData4;
  FXF.Data5 := DefaultData5;
  FXF.Data6 := DefaultData6;
  FXF.Data7 := DefaultData7;

  FXF.FontIndex := PRecXF4(P).FontIndex;
  if FParent.FNumberFormats.Count > Length(ExcelStandardNumFormats) then
    FXF.NumFmtIndex := PRecXF4(P).FormatIndex + Length(ExcelStandardNumFormats)
  else
    FXF.NumFmtIndex := PRecXF4(P).FormatIndex;

  Protection := [];
  if (PRecXF4(P).Data1 and $01) = $01 then  Protection := Protection + [cpLocked];
  if (PRecXF4(P).Data1 and $02) = $02 then  Protection := Protection + [cpHidden];

  case PRecXF4(P).Data2 and $07 of
    0: HorizAlignment := chaGeneral;
    1: HorizAlignment := chaLeft;
    2: HorizAlignment := chaCenter;
    3: HorizAlignment := chaRight;
    4: HorizAlignment := chaFill;
    5: HorizAlignment := chaJustify;
    6: HorizAlignment := chaCenterAcross;
  end;

  FormatOptions := [];
  if (PRecXF4(P).Data2 and $08) = $08 then FormatOptions := [foWrapText];

  case (PRecXF4(P).Data2 and $30) shr 4 of
    0: VertAlignment := cvaTop;
    1: VertAlignment := cvaCenter;
    2: VertAlignment := cvaBottom;
  end;

  if (PRecXF4(P).UsedAttributes and $20) = $20 then begin
    FillPatternPattern := TExcelFillPattern(PRecXF4(P).CellColor and $003F);
    FillPatternForeColor := TExcelColor((PRecXF4(P).CellColor and $07C0) shr 6);
    FillPatternBackColor := TExcelColor((PRecXF4(P).CellColor and $F800) shr 11);
  end;

  BorderTopStyle    := Get4BorderStyle(PRecXF4(P).TopBorder and $07);
  BorderLeftStyle   := Get4BorderStyle(PRecXF4(P).LeftBorder and $07);
  BorderBottomStyle := Get4BorderStyle(PRecXF4(P).BottomBorder and $07);
  BorderRightStyle  := Get4BorderStyle(PRecXF4(P).RightBorder and $07);
end;

procedure TCellFormat.FromXF7(P: PByteArray);
begin
  FXF.Data1 := 0;
  FXF.Data2 := 0;
  FXF.Data3 := 0;
  FXF.Data4 := 0;
  FXF.Data5 := 0;
  FXF.Data6 := 0;
  FXF.Data7 := 0;
  FXF.FontIndex := PRecXF7(P).FontIndex;

  FXF.NumFmtIndex := PRecXF7(P).FormatIndex;
  FParent.FNumberFormats.IncUsageById(FXF.NumFmtIndex);
  FXF.Data1 := PRecXF7(P).Data1;
  FXF.Data2 := PRecXF7(P).Data2 and $00FF;
  case (PRecXF7(P).Data2 and $0300) shr 8 of
    1: FXF.Data2 := FXF.Data2 + $FF00;
    2: FXF.Data2 := FXF.Data2 +  (90 shl 8);
    3: FXF.Data2 := FXF.Data2 + (180 shl 8);
  end;
  FXF.Data3 := PRecXF7(P).Data2 and $FC00;
  FXF.Data4 := FXF.Data4 + ((PRecXF7(P).Data5 and $0038) shr 3); // Left
  FXF.Data4 := FXF.Data4 + ((PRecXF7(P).Data5 and $01C0) shr 2); // Right
  FXF.Data4 := FXF.Data4 + ((PRecXF7(P).Data5 and $0007) shl 8); // Top
  FXF.Data4 := FXF.Data4 + ((PRecXF7(P).Data4 and $01C0) shl 6); // Bottom
  FXF.Data5 := FXF.Data5 +  (PRecXF7(P).Data6 and ($007F + $3F80));
  FXF.Data6 := FXF.Data6 + ((PRecXF7(P).Data5 and $FE00) shr 9);
  FXF.Data6 := FXF.Data6 + ((PRecXF7(P).Data4 and $FE00) shr 2);
  FXF.Data6 := FXF.Data6 + ((PRecXF7(P).Data4 and $003F) shl 26);  // Fill pattern
  FXF.Data7 := FXF.Data7 +  (PRecXF7(P).Data3 and $007F);
  FXF.Data7 := FXF.Data7 +  (PRecXF7(P).Data3 and $1F80);
  FXF.Data7 := FXF.Data7 + ((PRecXF7(P).Data3 and $2000) shl 1);
end;

procedure TCellFormat.FromXF8(P: PByteArray);
begin
  FXF.FontIndex := PRecXF8(P).FontIndex;
  FXF.NumFmtIndex := PRecXF8(P).NumFmtIndex;
  FParent.FNumberFormats.IncUsageById(FXF.NumFmtIndex);
  FXF.Data1 := PRecXF8(P).Data1;
  FXF.Data2 := PRecXF8(P).Data2;
  FXF.Data3 := PRecXF8(P).Data3;
  FXF.Data4 := PRecXF8(P).Data4;
  FXF.Data5 := PRecXF8(P).Data5;
  FXF.Data6 := PRecXF8(P).Data6;
  FXF.Data7 := PRecXF8(P).Data7;
end;

procedure TCellFormat.ToXF4(var P: PByteArray);
function Get4BorderValue(Value: TCellBorderStyle): byte;
begin
  case Value of
    cbsNone:   Result := 0;
    cbsThin:   Result := 1;
    cbsMedium: Result := 2;
    cbsDashed: Result := 3;
    cbsDotted: Result := 4;
    cbsThick:  Result := 5;
    cbsDouble: Result := 6;
    cbsHair:   Result := 7;
    else
      Result := 0;
  end;
end;

begin
  PRecXF4(P).FontIndex := FXF.FontIndex;
  PRecXF4(P).FormatIndex := FXF.NumFmtIndex - Length(ExcelStandardNumFormats);

  PRecXF4(P).Data1 := $0000;
  if cpLocked in Protection then
    PRecXF4(P).Data1 := PRecXF4(P).Data1 or $0001;
  if cpHidden in Protection then
    PRecXF4(P).Data1 := PRecXF4(P).Data1 or $0002;

  case HorizAlignment of
    chaGeneral:      PRecXF4(P).Data2 := 0;
    chaLeft:         PRecXF4(P).Data2 := 1;
    chaCenter:       PRecXF4(P).Data2 := 2;
    chaRight:        PRecXF4(P).Data2 := 3;
    chaFill:         PRecXF4(P).Data2 := 4;
    chaJustify:      PRecXF4(P).Data2 := 5;
    chaCenterAcross: PRecXF4(P).Data2 := 6;
    else
      PRecXF4(P).Data2 := 0;
  end;
  if foWrapText in FormatOptions then
    PRecXF4(P).Data2 := PRecXF4(P).Data2 or $0008;
  case VertAlignment of
    cvaCenter: PRecXF4(P).Data2 := PRecXF4(P).Data2 or (1 shl 4);
    cvaBottom: PRecXF4(P).Data2 := PRecXF4(P).Data2 or (2 shl 4);
  end;

  PRecXF4(P).UsedAttributes := 0;
  if FXF.NumFmtIndex > 0 then
    PRecXF4(P).UsedAttributes := PRecXF4(P).UsedAttributes or $04;
  PRecXF4(P).UsedAttributes := PRecXF4(P).UsedAttributes or $08;
  if (HorizAlignment <> chaGeneral) or (foWrapText in FormatOptions) or (VertAlignment <> cvaBottom) then
    PRecXF4(P).UsedAttributes := PRecXF4(P).UsedAttributes or $10;
  if (BorderTopStyle <> cbsNone) or (BorderLeftStyle <> cbsNone) or (BorderBottomStyle <> cbsNone) or (BorderRightStyle <> cbsNone) then
    PRecXF4(P).UsedAttributes := PRecXF4(P).UsedAttributes or $20;
  if Protection <> [cpLocked] then
    PRecXF4(P).UsedAttributes := PRecXF4(P).UsedAttributes or $80;

  PRecXF4(P).CellColor := $0000;
  PRecXF4(P).CellColor := Integer(FillPatternPattern) and $003F;
  PRecXF4(P).CellColor := (PRecXF4(P).CellColor and $07C0) shl 6;
  PRecXF4(P).CellColor := (PRecXF4(P).CellColor and $F80) shl 11;

  PRecXF4(P).TopBorder := Get4BorderValue(BorderTopStyle);
  PRecXF4(P).LeftBorder := Get4BorderValue(BorderLeftStyle);
  PRecXF4(P).BottomBorder := Get4BorderValue(BorderBottomStyle);
  PRecXF4(P).RightBorder := Get4BorderValue(BorderRightStyle);

  if PRecXF4(P).TopBorder <> 0    then PRecXF4(P).TopBorder :=    PRecXF4(P).TopBorder or $C0;
  if PRecXF4(P).LeftBorder <> 0   then PRecXF4(P).LeftBorder :=   PRecXF4(P).LeftBorder or $C0;
  if PRecXF4(P).BottomBorder <> 0 then PRecXF4(P).BottomBorder := PRecXF4(P).BottomBorder or $C0;
  if PRecXF4(P).RightBorder <> 0  then PRecXF4(P).RightBorder :=  PRecXF4(P).RightBorder or $C0;
end;

procedure TCellFormat.ToXF7(var P: PByteArray);
var
  V: word;
begin
  FillChar(P^,SizeOf(TRecXF7),#0);

  with PRecXF7(P)^ do begin
    FontIndex := FXF.FontIndex;
    FormatIndex := FXF.NumFmtIndex;
    Data1 := FXF.Data1;
    Data2 := FXF.Data2 and $00FF;
    V := FXF.Data2 shr 8;
    if V = $00FF then
      Data2 := Data2 + $0100
    else if V > 135 then
      Data2 := Data2 + $0300
    else if V > 45 then
      Data2 := Data2 + $0200;

    Data2 := Data2 + FXF.Data3 and $FC00;
    Data5 := Data5 + ((FXF.Data4 shl 3) and $0038);
    Data5 := Data5 + ((FXF.Data4 shl 2) and $01C0);
    Data5 := Data5 + ((FXF.Data4 shr 8) and $0007);
    Data4 := Data4 + ((FXF.Data4 shr 6) and $01C0);
    Data6 := FXF.Data5 and ($007F + $3F80);
    Data5 := Data5 + ((FXF.Data6 shl 9) and $FE00);
    Data4 := Data4 + ((FXF.Data6 shl 2) and $FE00);
    Data4 := Data4 + ((FXF.Data6 shr 26) and $003F);
    Data3 := Data3 + (FXF.Data7 and $007F);
    Data3 := Data3 + (FXF.Data7 and $1F80);
    Data3 := Data3 + ((FXF.Data7 shr 1) and $2000);
  end;
end;

procedure TCellFormat.ToXF8(var P: PByteArray);
begin
  PRecXF8(P).FontIndex := FXF.FontIndex;
  PRecXF8(P).NumFmtIndex := FXF.NumFmtIndex;
  PRecXF8(P).Data1 := FXF.Data1;
  PRecXF8(P).Data2 := FXF.Data2;
  PRecXF8(P).Data3 := FXF.Data3;
  PRecXF8(P).Data4 := FXF.Data4;
  PRecXF8(P).Data5 := FXF.Data5;
  PRecXF8(P).Data6 := FXF.Data6;
  PRecXF8(P).Data7 := FXF.Data7;
end;

function TCellFormat.Equal(F: TCellFormat): boolean;
begin
  Result := CompareMem(@F.FXF,@FXF,SizeOf(TRecXF8));
end;

destructor TCellFormat.Destroy;
begin
  if FParent.FNumberFormats <> nil then
    FParent.FNumberFormats.DeleteById(FXF.NumFmtIndex);
  inherited;
end;

{
procedure TCellFormat.OnFontChanged(NewIndex: word);
begin
  FXF.FontIndex := NewIndex;
end;
}

function TCellFormat.GetXFont: TXFont;
begin
  Result := FParent.FFonts[FXF.FontIndex];
end;

procedure TCellFormat.IncUsageCount;
begin
  Inc(FUsageCount);
end;

{ TNumberFormats }

function TNumberFormats.Add(Value: WideString): TNumberFormat;
var
  i: integer;
begin
  i := FindValue(Value);
  if i >= 0 then begin
    Result := ItemsByIndex[i];
    Inc(Result.FUsageCount);
  end
  else begin
    Inc(FCurrentId);
    Result := TNumberFormat.Create;
    Result.FValue := Value;
    Result.FIndexId := FCurrentId;
    Result.FUsageCount := 1;
    Result.CreateHash;
    inherited Add(Result);
  end;
end;

function TNumberFormats.AddSorted(Value: WideString; IndexId,UsageCount: integer): TNumberFormat;
var
  i: integer;
begin
  FSorted := False;
  i := Find(IndexId);
  if i > 0 then begin
    Result := TNumberFormat(inherited Items[i]);
    Result.FValue := Value;
    if Result.FUsageCount >= 0 then
      Inc(Result.FUsageCount,UsageCount)
    else
      Result.FUsageCount := UsageCount;
  end
  else begin
    Result := TNumberFormat.Create;
    Result.FValue := Value;
    Result.FIndexId := IndexId;
    Result.FUsageCount := UsageCount;
    inherited Add(Result);
  end;
  Result.CreateHash;
  if IndexId > FCurrentId then
    FCurrentId := IndexId;
end;

procedure TNumberFormats.SetDefault;
var
  i: integer;
begin
  FCurrentId := 0;
  for i := 0 to High(ExcelStandardNumFormats) do
    AddSorted(ExcelStandardNumFormats[i],i,-1);
end;

constructor TNumberFormats.Create;
begin
  inherited Create;
//  SetDefault;
end;

procedure TNumberFormats.DeleteById(IndexId: integer);
var
  i: integer;
  NF: TNumberFormat;
begin
  if IndexId <= High(ExcelStandardNumFormats) then
    Exit;
  i := Find(IndexId);
  if i < 0 then
    raise Exception.CreateFmt('Can not find number format# %d',[IndexId]);
  NF := TNumberFormat(inherited Items[i]);
  if NF.FUsageCount >= 0 then begin
    Dec(NF.FUsageCount);
    if NF.FUsageCount <= 0 then begin
      if IndexId <= High(ExcelStandardNumFormats) then begin
        NF.FValue := ExcelStandardNumFormats[i];
        NF.FIndexId := i;
        NF.FUsageCount := -1;
      end
      else
        inherited Delete(i);
    end;
  end;
end;

destructor TNumberFormats.Destroy;
begin

  inherited;
end;

function TNumberFormats.Find(IndexId: integer): integer;
var
  i,lo,hi: integer;
begin
  if (IndexId < 0) or (Count <= 0) then begin
    Result := -1;
    Exit;
  end;
  i := 0;
  lo := 0;
  hi := Count - 1;
  while lo <= hi do begin
    i := (lo + hi) div 2;
    if IndexId > ItemsByIndex[i].FIndexId then
      lo := i + 1
    else if IndexId < ItemsByIndex[i].FIndexId then
      hi := i - 1
    else
      Break;
  end;
  if IndexId = ItemsByIndex[i].FIndexId then
    Result := i
  else
    Result := -1;
end;

function TNumberFormats.FindValue(Value: WideString): integer;
var
  Hash: word;
begin
  if Value = '' then
    Result := 0
  else begin
    Hash := GetHashCode(Pointer(Value)^,Length(Value) * 2);
    for Result := 0 to Count - 1 do begin
      if (ItemsByIndex[Result].FHash = Hash) and (ItemsByIndex[Result].FValue = Value) then
        Exit;
    end;
    Result := -1;
  end;
end;

function TNumberFormats.GetItems(IndexId: integer): TNumberFormat;
begin
  Result := TNumberFormat(inherited Items[Find(IndexId)]);
end;

function TNumberFormats.GetItemsByIndex(Index: integer): TNumberFormat;
begin
  Result := TNumberFormat(inherited Items[Index]);
end;

procedure TNumberFormats.SetItemsByIndex(Index: integer; const Value: TNumberFormat);
begin
  inherited Items[Index] := Value;
end;

function NumberFormatsCompare(Item1, Item2: Pointer): Integer;
begin
  Result := TNumberFormat(Item1).IndexId - TNumberFormat(Item2).IndexId;
end;

procedure TNumberFormats.Sort;
begin
  inherited Sort(NumberFormatsCompare);
  FSorted := True;
end;

{
procedure TNumberFormats.Sort;

procedure QSort(L, R: Integer);
var
  i, j, IndexId: Integer;
  T: TNumberFormat;
begin
  repeat
    i := L;
    j := R;
    IndexId := ItemsByIndex[(L + R) shr 1].FIndexId;
    repeat
      while ItemsByIndex[i].FIndexId < IndexId do Inc(i);
      while ItemsByIndex[j].FIndexId > IndexId do Dec(j);
      if I <= J then
      begin
        T := ItemsByIndex[i];
        ItemsByIndex[i] := ItemsByIndex[j];
        ItemsByIndex[j] := T;
        Inc(i);
        Dec(j);
      end;
    until i > j;
    if L < j then QSort(L, j);
    L := i;
  until i >= R;
end;

begin
  if Count > 0 then
    QSort(0,Count - 1);
end;
}

procedure TNumberFormats.IncUsageById(IndexId: integer);
var
  i: integer;
  NF: TNumberFormat;
begin
  if IndexId <= High(ExcelStandardNumFormats) then
    Exit;
  i := Find(IndexId);
  if i < 0 then
    raise Exception.CreateFmt('Can not find number format# %d',[IndexId]);
  NF := TNumberFormat(inherited Items[i]);
  Inc(NF.FUsageCount);
end;

{ TNumberFormat }

procedure TNumberFormat.CreateHash;
begin
  if FValue = '' then
    FHash := 0
  else
    FHash := GetHashCode(Pointer(FValue)^,Length(FValue) * 2);
end;

function TNumberFormat.IsDefault: boolean;
begin
  Result := FUsageCount < 0;
end;

end.
