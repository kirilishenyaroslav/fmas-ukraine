unit XLSReadWriteII2;

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
** expressed or implied, including, without limitation, the warranties of     **
** merchantability and of fitness for any purpose. The author assumes no      **
** liability for damages, direct or consequential, which may result from the  **
** use of XLSReadWriteII.                                                     **
********************************************************************************
}

{$B-}
{$H+}
{$R-}
{$I XLSRWII2.inc}

// {$define SHAREWARE}
// {$define SHAREWARE_DLL}

interface

uses Classes, SysUtils, BIFFRecsII2, XLSUtils2, SST2,
     CellFormats2, SheetData2, XLSStream2, XLSFonts2, EncodeFormulaII2,
     ExcelMaskII2, Graphics, Cell2, Printers, Forms, RecordStorage2,
{$ifdef USE_MSSTORAGE}
     Windows, WinSpool, ComObj, ActiveX, Dialogs,
{$else}
     CompoundStream,
{$endif}
     XLSNames2,ExcelFuncII2,Escher2, FormulaHandler2, DrawingObjChart2,
     XLSVBA2;

//* ~[userDoc ..\help\metadata.txt CANT_FIND METADATA]
const CurrentVersionNumber = '3.01.01';

type TWorkbookOption = (woHidden,   //* The window is hidden.
                        woIconized, //* The window is displayed as an icon.
                        woHScroll,  //* The horizontal scroll bar is displayed.
                        woVScroll,  //* The vertical scroll bar is displayed.
                        woTabs      //* The workbook tabs are displayed.
                        );
     TWorkbookOptions = set of TWorkbookOption;

type TShowObjects = (soShowAll,      //* Show all.
                     soPlaceholders, //* Show placeholders.
                     soHideAll       //* Hide all.
                     );

//* Calculation mode.
type TCalcMode = (cmManual,      //* Manual calculation.
                  cmAutomatic,   //* Automatic calculation.
                  cmAutoExTables //* Automatic calculation, except for tables.
                  );

//* ~exclude                  
type TStyles = class(TList)
private
     function GetItems(Index: integer): PRecSTYLE;
public
     destructor Destroy; override;
     procedure Clear; override;
     procedure Add(Style: PRecSTYLE);

     property Items[Index: integer]: PRecSTYLE read GetItems; default;
     end;

//* Options for the workbook window.
type TWorkbookData = class(TPersistent)
private
     FRecords: TRecordStorageGlobals;

     function  ReadHeight: word;
     function  ReadLeft: word;
     function  ReadOptions: TWorkbookOptions;
     function  ReadSelectedTab: word;
     function  ReadTop: word;
     function  ReadWidth: word;
     procedure WriteHeight(const Value: word);
     procedure WriteLeft(const Value: word);
     procedure WriteOptions(const Value: TWorkbookOptions);
     procedure WriteSelectedTab(const Value: word);
     procedure WriteTop(const Value: word);
     procedure WriteWidth(const Value: word);
     function  GetDate1904: boolean;
public
     //* ~exclude
     constructor Create(Records: TRecordStorageGlobals);
published
     //* Left position of the window, in units if 1/20th of a point.
     property Left: word read ReadLeft write WriteLeft;
     //* Top position of the window, in units if 1/20th of a point.
     property Top: word read ReadTop write WriteTop;
     //* Width of the window, in units if 1/20th of a point.
     property Width: word read ReadWidth write WriteWidth;
     //* Height of the window, in units if 1/20th of a point.
     property Height: word read ReadHeight write WriteHeight;
     //* Index of selected workbook tab, zero based.
     property SelectedTab: word read ReadSelectedTab write WriteSelectedTab;
     //* Options for the window.
     property Options: TWorkbookOptions read ReadOptions write WriteOptions;
     //* Returns True if the 1904 date system is used.
     property Date1904: boolean read GetDate1904;
     end;

//* The TOptionsDialog contains options for the workbook. These options
//* are from the Options dialog in Excel, for more info regarding the
//* options, please see the Excel documentation.
type TOptionsDialog = class(TPersistent)
private
     FRecords: TRecordStorageGlobals;
     FCalcCount: word;
     FCalcMode: TCalcMode;
     FDelta: double;
     FIteration: boolean;
     FR1C1Mode: boolean;
     FRecalcBeforeSave: boolean;
     FUncalced: boolean;
     FSaveRecalc: boolean;

     function  GetShowObjects: TShowObjects;
     procedure SetShowObjects(const Value: TShowObjects);
     function  GetPrecisionAsDisplayed: boolean;
     procedure SetPrecisionAsDisplayed(const Value: boolean);
     function  GetSaveExtLinkVal: boolean;
     procedure SetSaveExtLinkVal(const Value: boolean);
     procedure SetCalcCount(const Value: word);
published
     //* ~exclude
     constructor Create(Records: TRecordStorageGlobals);
     //* TRue if the Save External Link Values option is turned off (Options dialog box, Calculation tab).
     property SaveExtLinkVal: boolean read GetSaveExtLinkVal write SetSaveExtLinkVal;
     //* Maximum Iterations option from the Options dialog box, Calculation tab.
     property CalcCount: word read FCalcCount write SetCalcCount;
     //* Calculation mode.
     property CalcMode: TCalcMode read FCalcMode write FCalcMode;
     //* Maximum Change value from the Options dialog box, Calculation tab.
     property Delta: double read FDelta write FDelta;
     //* Which object to show.
     property ShowObjects: TShowObjects read GetShowObjects write SetShowObjects;
     //* True if the iteration option is on.
     property Iteration: boolean read FIteration write FIteration;
     //* True if Precision As Displayed option is selected.
     property PrecisionAsDisplayed: boolean read GetPrecisionAsDisplayed write SetPrecisionAsDisplayed;
     //* True if RIC1 mode is on.
     property R1C1Mode: boolean read FR1C1Mode write FR1C1Mode;
     //* True if recalc before save is on.
     property RecalcBeforeSave: boolean read FRecalcBeforeSave write FRecalcBeforeSave;
     //* True if the workbook is marked as uncalced.
     property Uncalced: boolean read FUncalced write FUncalced;
     //* True if recalculate before saving is on. 
     property SaveRecalc: boolean read FSaveRecalc write FSaveRecalc;
     end;

//* This is the TXLSReadWriteII2 component.
//* ~example
//* ~[sample
//*  // Here are some basic examples.
//*  // Write a value to cell C3.
//*  XLS.Sheet[0~[].AsString[2,2~[] := 'Hello';
//*  // Read a value from cell C3.
//*  S := XLS.Sheet[0~[].AsString[2,2~[];
//*  // Read the same cell, but the position is given as a string.
//*  S := XLS.Sheet[0~[].AsStringRef['C:3'~[];
//*
//*  // Add a named cell.
//*  with XLS.InternalNames.Add do begin
//*    Name := 'MyCell';
//*    Definition := 'Sheet1!C3';
//*  end;
//*  // Read the value from cell C3 by using the previous defined name.
//*  S := XLS.NameAsString['MyCell'~[];
//*
//*  // Set the color of a cell.
//*  XLS.Sheet[0~[].Cell[2,2~[].FillPatternForeColor := xcYellow;
//*  // Set the color of another cell. As there is in cell at this position, add a blank cell.
//*  XLS.Sheet[0~[].AsBlank[2,3~[] := True;
//*  XLS.Sheet[0~[].Cell[2,3~[].FillPatternForeColor := xcYellow;
//* ]
type TXLSReadWriteII2 = class(TComponent, ICellOperations)
private
      FFilename: WideString;
      FVersion: TExcelVersion;
      FFormats: TCellFormats;
      FDefaultFormat: TCellFormat;
      FSheets: TSheets;
      FWorkbookData: TWorkbookData;
      FOptionsDialog: TOptionsDialog;
      FFonts: TXFonts;
      FMaxBuffsize: integer;
      FIsMac: boolean;
      FWriteDefaultData: boolean;
      FDefaultCountryIndex: integer;
      FWinIniCountry: integer;
      FShowFormulas: boolean;
      FAfterLoad: TNotifyEvent;
      FFormulaHandler: TFormulaHandler;
      FSST: TSST2;
      FProgressEvent: TIntegerEvent;
      FFunctionEvent: TFunctionEvent;
      FPasswordEvent: TPasswordEvent;
      FDevMode: PDeviceModeW;
      FStyles: TStyles;
{$ifdef SHAREWARE}
      FNagMsgShown: boolean;
{$endif}
      FRecords: TRecordStorageGlobals;
{$ifdef USE_MSSTORAGE}
      FExtraObjects: TExtraObjects;
{$else}
      FCacheFiles: TCacheFile;
{$endif}
      FMSOPictures: TMSOPictures;
//      FPrintPictures: TMSOPictures;
      FSheetCharts: TSheetCharts;
      FPreserveMacros: boolean;
      FPassword: WideString;
      FDefaultPaperSize: TPaperSize;
      FCellCount: integer;
      FProgressCount: integer;
      FCurrFindSheet: integer;
      FVBA: TXLSVBA;
      FFILESHARING: array of byte;
      FAborted: boolean;

      function  GetRecomendReadOnly: boolean;
      procedure SetRecomendReadOnly(const Value: boolean);
      procedure SetVersion(Value: TExcelVersion);
      procedure SetFont(F: TXFont);
      function  GetFont: TXFont;
      procedure SetCodepage(Value: word);
      procedure FormulaHandlerSheetName(Name: WideString; var Index,Count: integer);
      function  FormulaHandlerSheetData(DataType: TSheetDataType; SheetIndex,Col,Row: integer): WideString;
      function  GetCodepage: word;
      function  GetUserName: string;
      procedure SetUserName(const Value: string);
      function  GetBookProtected: boolean;
      procedure SetBookProtected(const Value: boolean);
      function  GetBackup: boolean;
      procedure SetBackup(const Value: boolean);
      function  GetRefreshAll: boolean;
      procedure SetRefreshAll(const Value: boolean);
      function  GetNameAsFloat(AName: string): double;
      procedure SetNameAsFloat(AName: string; const Value: double);
      function  GetNameAsBoolean(AName: string): boolean;
      function  GetNameAsBoolFormulaValue(AName: string): boolean;
      function  GetNameAsError(AName: string): TCellError;
      function  GetNameAsFmtString(AName: string): WideString;
      function  GetNameAsFormula(AName: string): string;
      function  GetNameAsNumFormulaValue(AName: string): double;
      function  GetNameAsStrFormulaValue(AName: string): WideString;
      function  GetNameAsString(AName: string): WideString;
      procedure SetNameAsBoolean(AName: string; const Value: boolean);
      procedure SetNameAsBoolFormulaValue(AName: string; const Value: boolean);
      procedure SetNameAsError(AName: string; const Value: TCellError);
      procedure SetNameAsFormula(AName: string; const Value: string);
      procedure SetNameAsNumFormulaValue(AName: string; const Value: double);
      procedure SetNameAsStrFormulaValue(AName: string; const Value: WideString);
      procedure SetNameAsString(AName: string; const Value: WideString);
      function  GetNameAsCell(AName: string): TCell;
      function  GetVersionNumber: string;
      procedure SetVerionNumber(const Value: string);
      function  GetInternalNames: TInternalNames;
      procedure SetInternalNames(const Value: TInternalNames);
      procedure SetStrFALSE(const Value: WideString);
      procedure SetStrTRUE(const Value: WideString);
      function  GetPalette(Index: integer): TColor;
      procedure SetPalette(Index: integer; const Value: TColor);
      function  GetSheet(Index: integer): TSheet;
      procedure SetFilename(const Value: WideString);
      function  GetStrFALSE: WideString;
      function  GetStrTRUE: WideString;
protected
      procedure GetCommonSheetData;
      procedure SetCommonSheetData;
      procedure InternalNameDeleted(Sender: TObject; Delta: integer);
public
      //* ~exclude
      constructor Create(AOwner: TComponent); override;
      //* ~exclude
      destructor Destroy; override;
      //* Clears all cell values in all sheets. See also ~[link Clear]
      procedure ClearCells;
      //* Clears all data from the workbook.
      procedure Clear;
      //* Reads the file given by ~[link Filename]
      procedure Read;
      //* Writes the file given by ~[link Filename]. Please note that if
      //* the file allready is opened by another application, such as Excel, it
      //* is not possible to write to it, as Excel locks the file for exclusive
      //* use.
      procedure Write;
      //* Writes the workbook to a stream instead of writing to a file.
      //* ~param Stream The stream to write the workbook to.
      procedure WriteToStream(Stream: TStream);
      //* Reads the workbook from a stream instead of reading from a file.
      //* ~param Stream The stream to read the workbook from.
      procedure LoadFromStream(Stream: TStream);
      //* Returns a password that can be used to unprotect worksheets.
      //* This may not be the same password used to protect it.
      //* If there is no protection, an empty string is returned.
      function GetWeakPassword: string;
      //* The max number of rows there can be in a worksheet. Normally 65536.
      //* ~result Max number of rows.
      function  MaxRowCount: integer;
      //* Copies the cells in area Col1,Row1 - Col2,Row2 on sheet
      //* SrcSheet to DestCol and DestRow on sheet DestSheet. Which type of
      //* cells and data that are copied can be set with CopyOptions. The
      //* copying is carried out correctly even if the areas overlap.
      //* See also ~[link XLSUtils2.TCopyCellsOptions TCopyCellsOptions]
      //* ~param SrcSheet Source sheet index.
      //* ~param Col1 Left column of source area.
      //* ~param Row1 Top row of source area.
      //* ~param Col2 Right column of source area.
      //* ~param Row2 Bottom row of source area.
      //* ~param DestSheet Destination sheet index.
      //* ~param DestCol Destination column for the copied cells.
      //* ~param DestRow Destination row for the copied cells.
      //* ~param CopyOptions Cell copying options.
      procedure CopyCells(SrcSheet,Col1,Row1,Col2,Row2,DestSheet,DestCol,DestRow: integer; CopyOptions: TCopyCellsOptions = [ccoAdjustCells] + CopyAllCells);
      //* Moves the cells in area Col1,Row1 - Col2,Row2 on sheet SrcSheet
      //* to DestCol and DestRow on sheet DestSheet. Which type of cells and
      //* data that are moved can be set with CopyOptions.
      //* See also ~[link XLSUtils2.TCopyCellsOptions TCopyCellsOptions]
      //* ~param SrcSheet Source sheet index.
      //* ~param Col1 Left column of source area.
      //* ~param Row1 Top row of source area.
      //* ~param Col2 Right column of source area.
      //* ~param Row2 Bottom row of source area.
      //* ~param DestSheet Destination sheet index.
      //* ~param DestCol Destination column for the moved cells.
      //* ~param DestRow Destination row for the moved cells.
      //* ~param CopyOptions Cell copying options.
      procedure MoveCells(SrcSheet,Col1,Row1,Col2,Row2,DestSheet,DestCol,DestRow: integer; CopyOptions: TCopyCellsOptions = [ccoAdjustCells] + CopyAllCells);
      //* Deletes an area of cells.
      //* ~param Sheet Sheet index.
      //* ~param Col1 Left column of the area.
      //* ~param Row1 Top row of the area.
      //* ~param Col2 Right column of the area.
      //* ~param Row2 Bottom row of the area.
      procedure DeleteCells(Sheet, Col1, Row1, Col2, Row2: integer);
      //* Copy columns Col1 to Col2 on sheet SrcSheet to column DestCol
      //* on sheet DestSheet. Cell values are copied as well. Any existing data
      //* at the destination is overwritten. For only copying column widths, see
      //* ~[link Columns2.TXLSColumns].
      //* ~param SrcSheet Source sheet index.
      //* ~param Col1 Left column of source area.
      //* ~param Col2 Right column of source area.
      //* ~param DestSheet Destination sheet index.
      //* ~param DestCol Destination column for the copied cells.
      //* ~param DoCopyCells Copy the cells as well, and not just the column settings.
      procedure CopyColumns(SrcSheet,Col1,Col2,DestSheet,DestCol: integer; DoCopyCells: boolean = True);
      //* Copies columns Col1 to Col2 on sheet SrcSheet to column DestCol on
      //* sheet DestSheet. Cell values are moved as well.
      //* Any existing data at the destination is overwritten, and the source
      //* columns are cleared.
      //* For only moving column widths, see ~[link Columns2.TXLSColumns].
      //* ~param SrcSheet Source sheet index.
      //* ~param Col1 Left column of source area.
      //* ~param Col2 Right column of source area.
      //* ~param DestSheet Destination sheet index.
      //* ~param DestCol Destination column for the moved cells.
      //* ~param DoMoveCells Copy the cells as well, and not just the column settings.
      procedure MoveColumns(SrcSheet,Col1,Col2,DestSheet,DestCol: integer; DoMoveCells: boolean = True);
      //* Deletes columns Col1 to Col2 on sheet Sheet.
      //* Columns to the right of Col2 are shifted left.
      //* ~param Sheet Index of the sheet to delete the columns on.
      //* ~param Col1 Left column of the span.
      //* ~param Col2 Right column of the span.
      procedure DeleteColumns(Sheet,Col1,Col2: integer);
      //* Clears columns Col1 to Col2 on sheet Sheet.
      //* ~param Sheet Index of the sheet to clear the columns on.
      //* ~param Col1 Left column of the span.
      //* ~param Col2 Right column of the span.
      procedure ClearColumns(Sheet,Col1,Col2: integer);
      //* Inserts ColCount empty columns at column Col in sheet Sheet.
      //* ~param Sheet Index of the sheet to insert the columns on.
      //* ~param Col Insertion point for the columns.
      //* ~param ColCount Number of columns to insert.
      procedure InsertColumns(Sheet,Col,ColCount: integer);
      //* Copy rows Row1 to Row2 on sheet SrcSheet to row DestRow on
      //* sheet DestSheet. Cell values are copied as well.
      //* Any existing data at the destination is overwritten.
      //* For only copying row heights, see ~[link Rows2.TXLSRows].
      //* ~param SrcSheet Source sheet index.
      //* ~param Row1 Top row of source area.
      //* ~param Row2 Bottom row of source area.
      //* ~param DestSheet Destination sheet index.
      //* ~param DestRow Destination row for the copied cells.
      //* ~param DoCopyCells Copy the cells as well, and not just the column settings.
      procedure CopyRows(SrcSheet,Row1,Row2,DestSheet,DestRow: integer; DoCopyCells: boolean = True);
      //* Moves rows Row1 to Row2 on sheet SrcSheet to row DestRow on
      //* sheet DestSheet. Cell values are copied as well.
      //* Any existing data at the destination is overwritten.
      //* For only moving row heights, see ~[link Rows2.TXLSRows].
      //* ~param SrcSheet Source sheet index.
      //* ~param Row1 Top row of source area.
      //* ~param Row2 Bottom row of source area.
      //* ~param DestSheet Destination sheet index.
      //* ~param DestRow Destination row for the moved cells.
      //* ~param DoMoveCells Copy the cells as well, and not just the column settings.
      procedure MoveRows(SrcSheet,Row1,Row2,DestSheet,DestRow: integer; DoMoveCells: boolean = True);
      //* Deletes rows Row1 to Row2 on sheet Sheet.
      //* Rows below Row2 are shifted uppwards.
      //* ~param Sheet Index of the sheet to delete the rows on.
      //* ~param Row1 Top row of the span.
      //* ~param Row2 Bottom row of the span.
      procedure DeleteRows(Sheet,Row1,Row2: integer);
      //* Clears rows Row1 to Row2 on sheet Sheet.
      //* ~param Sheet Index of the sheet to clear the rows on.
      //* ~param Row1 Top row of the span.
      //* ~param Row2 Bottom row of the span.
      procedure ClearRows(Sheet,Row1,Row2: integer);
      //* Inserts RowCount empty Rows at row Row in sheet Sheet.
      //* ~param Sheet Index of the sheet to insert the rows on.
      //* ~param Row Insertion point for the first row.
      //* ~param RowCount Number of rows to insert.
      procedure InsertRows(Sheet,Row,RowCount: integer);
      //* Copies the content of SrcSheet to DestSheet.
      //* ~param SrcSheet Index of the source sheet.
      //* ~param DestSheet Index of the destination sheet.
      procedure CopySheet(SrcSheet,DestSheet: integer);
      //* ~exclude
      function  GetDEVMODE: PDeviceModeW;
      //* ~exclude
      procedure  SetDEVMODE(P: Pointer; Sz: integer);
      //* ~exclude
      function  HasDEVMODE: boolean;
      //* Calculates all sheets in the workbook.
      //* See also ~[link TSheet.Calculate]
      procedure Calculate;
      //* Use BeginUpdate when you do a lot of changes to the workbook.
      //* BeginUpdate is most usefull when adding many string cells.
      //* EndUpdate must be called after the changes are done.
      //* See also ~[link EndUpdate]
      procedure BeginUpdate;
      //* Writes any pending changes since BeginUpdate was called.
      //* See also ~[link BeginUpdate]
      procedure EndUpdate;

      //* Abort reading of a file. After the reading is aborted ~[link Aborted] is set tor True.
      procedure Abort;
      //* Checks ~[link Abort] was called to stop the file reading.
      //* ~result True if the read operation was aborted.
      function  Aborted: boolean;
      //* Resets the position to the first cell when searching the workbook for a text. See also ~[link FindText].
      procedure BeginFindText;
     //* Searches the string cells in the worksheet for Text. Each subsequent
     //* call to FindText will stop at the next occurrence if the text.
     //* The search text may occure more than once in a cell.
     //* FindText will return True if the text was found.
     //* Use GetFindData to get information about where in the worksheet
     //* the text was found. Call ~[link BeginFindText] to start a new text search.
     //* ~param Text The text string to search for.
     //* ~param CaseInsensitive True if the text search shall be case insensitive.
     //* ~result True if the text was found.
      function  FindText(Text: WideString; CaseInsensitive: boolean = True): boolean;
     //* Returns information about where in a worksheet a text searched
     //* for with ~[link FindText] was found.
     //* ~param Sheet The worksheet where the text was found.
     //* ~param Col The cells column.
     //* ~param Row The cells row.
     //* ~param TextPos The position in the cells text the search text was found.
     //* ~param Text The text in the cell where the search string where found.
      procedure GetFindData(var Sheet,Col,Row,TextPos: integer; var Text: WideString);

      //* Access a Cell object by a name that references to a cell. See also ~[link InternalNames]
      property NameAsCell            [AName: string]: TCell read GetNameAsCell;
      //* Access a float cell value by a name that references to a cell. See also ~[link InternalNames] , ~[link TSheet.AsFloat]
      property NameAsFloat           [AName: string]: double read GetNameAsFloat write SetNameAsFloat;
      //* Access a string cell value by a name that references to a cell. See also ~[link InternalNames] , ~[link TSheet.AsString]
      property NameAsString          [AName: string]: WideString read GetNameAsString write SetNameAsString;
      //* Access a formatted string cell value by a name that references to a cell. See also ~[link InternalNames] , ~[link TSheet.AsFmtString]
      property NameAsFmtString       [AName: string]: WideString read GetNameAsFmtString;
      //* Access a boolean cell value by a name that references to a cell. See also ~[link InternalNames] , ~[link TSheet.AsBoolean]
      property NameAsBoolean         [AName: string]: boolean read GetNameAsBoolean write SetNameAsBoolean;
      //* Access an error cell value by a name that references to a cell. See also ~[link InternalNames] , ~[link TSheet.AsError]
      property NameAsError           [AName: string]: TCellError read GetNameAsError write SetNameAsError;
      //* Access a formula cell value by a name that references to a cell. See also ~[link InternalNames] , ~[link TSheet.AsFormula]
      property NameAsFormula         [AName: string]: string read GetNameAsFormula write SetNameAsFormula;
      //* Access a number formula result cell value by a name that references to a cell. See also ~[link InternalNames] , ~[link TSheet.AsNumFormulaValue]
      property NameAsNumFormulaValue [AName: string]: double read GetNameAsNumFormulaValue write SetNameAsNumFormulaValue;
      //* Access a string formula result cell value by a name that references to a cell. See also ~[link InternalNames] , ~[link TSheet.AsStrFormulaValue]
      property NameAsStrFormulaValue [AName: string]: WideString read GetNameAsStrFormulaValue write SetNameAsStrFormulaValue;
      //* Access a boolean formula result cell value by a name that references to a cell. See also ~[link InternalNames] , ~[link TSheet.AsBoolFormulaValue]
      property NameAsBoolFormulaValue[AName: string]: boolean read GetNameAsBoolFormulaValue write SetNameAsBoolFormulaValue;
      //* Default paper size.
      property DefaultPaperSize: TPaperSize read FDefaultPaperSize write FDefaultPaperSize;

      { ********************************************* }
      { ********** For internal use only. *********** }
      { ********************************************* }

      // Set to False when loading an Excel file, as there is default data in the file.
      property WriteDefaultData: boolean read FWriteDefaultData write FWriteDefaultData;
      //* ~exclude
      property MaxBuffSize: integer read FMaxBuffsize;
      //* ~exclude
      property Styles: TStyles read FStyles;
      //* ~exclude
      property OnAfterLoad: TNotifyEvent read FAfterLoad write FAfterLoad;

      //* ~exclude
      property Records: TRecordStorageGlobals read FRecords;
      //* ~exclude
{$ifdef USE_MSSTORAGE}
      property ExtraObjects: TExtraObjects read FExtraObjects;
{$else}
      property CacheFiles: TCacheFile read FCacheFiles write FCacheFiles;
{$endif}
      //* ~exclude
      property Formats: TCellFormats read FFormats write FFormats;
      //* ~exclude
      property Fonts: TXFonts read FFonts write FFonts;
      //* ~exclude
      property DefaultFormat: TCellFormat read FDefaultFormat;

      //* ~exclude
      function  GetNameValue(Index, Col, Row: integer): TFormulaValue;
      //* ~exclude
      function  GetExternNameValue(NameIndex,SheetIndex: integer): TFormulaValue;
      //* ~exclude
      procedure AddNumberFormat(Format: string; Index: integer);
      //* ~exclude
      procedure WrittenNCells;
      //* ~exclude
      procedure SetFILESHARING(PBuf: PByteArray; Size: integer);
      //* ~exclude
      function  GetFILESHARING(PBuf: PByteArray): integer;
      // @exclude
      // *********************************************
      // ********** End internal use only. ***********
      // *********************************************
      //* User defined names for cells and areas.
      property InternalNames: TInternalNames read GetInternalNames write SetInternalNames;
      //* Charts that are on it's own sheet.
      //* See also ~[link TSheetCharts]
      property SheetCharts: TSheetCharts read FSheetCharts;

      //* ~exclude
      property DefaultCountryIndex: integer read FDefaultCountryIndex write FDefaultCountryIndex;
      //* ~exclude
      property WinIniCountry: integer read FWinIniCountry write FWinIniCountry;
      //* ~exclude
      property FormulaHandler: TFormulaHandler read FFormulaHandler;
      //* ~exclude
      property Codepage: word read GetCodepage write SetCodepage;
      //* The palette for the colors used by Excel. The palette has 64 entries,
      //* but the first 8 are fixed and can not be changed.
      property Palette[Index: integer]: TColor read GetPalette write SetPalette;
      //* THe worksheets in the workbook.
      //* See ~[link TSheet]
      property Sheet[Index: integer]: TSheet read GetSheet; default;
      //* Object for handling Visual Basic macros.
      property VBA: TXLSVBA read FVBA;
published
      //* The Excel file version for the workbook.
      //* See also ~[link TExcelVersion]
      property Version: TExcelVersion read FVersion write SetVersion;
      //* The worksheets in the workbook.
      //* See ~[link TSheet]
      property Sheets: TSheets read FSheets write FSheets;
      //* Options for the worksheets in the workbook.
      property Workbook: TWorkbookData read FWorkbookData write FWorkbookData;
      //* Here you will find parameters from the Tools->Options dialog in Excel.
      property OptionsDialog: TOptionsDialog read FOptionsDialog write FOptionsDialog;
      //* The default font for the workbook.
      property Font: TXFont read GetFont write SetFont;
      //* The name of the creator of the workbook.
      property UserName: string read GetUserName write SetUserName;
      //* The BookProtect property stores the protection state for a sheet or workbook.
      property BookProtected: boolean read GetBookProtected write SetBookProtected;
      //* The Backup property specifies whether Microsoft Excel should save
      //* backup versions of a file, when the file is opened with Excel.
      property Backup: boolean read GetBackup write SetBackup;
      //* Set the RefreshAll property to True if all external data should be
      //* refreshed when the workbook is loaded by Excel.
      property RefreshAll: boolean read GetRefreshAll write SetRefreshAll;
      //* Change StrTRUE property to change the string representation of the
      //* boolean value True. The default is 'True'.
      //* See also ~[link StrFALSE]
      property StrTRUE: WideString read GetStrTRUE write SetStrTRUE;
      //* Change StrFALSE property to change the string representation of the
      //* boolean value False. The default is 'False'.
      //* See also ~[link StrTRUE]
      property StrFALSE: WideString read GetStrFALSE write SetStrFALSE;
      //* Set the ShowFormulas property to True if functions which reads cells
      //*and return string values shall return the formula itself or de result
      //* (value) of the formula.
      property ShowFormulas: boolean read FShowFormulas write FShowFormulas;
      //* Set the Filename property to the name of the file you want to read or
      //* write.
      //* See also ~[link Read], ~[link Write], ~[link LoadFromStream], ~[link WriteToStream]
      property Filename: WideString read FFilename write SetFilename;
      //* True if the file is created by Excel for Macintosh.
      property IsMac: boolean read FIsMac write FIsMac;
      //* Set PreserveMacros to True if macros (VBA script) shall be preserved
      //* when a file is read. When set to False, all macros are deleted.
      property PreserveMacros: boolean read FPreserveMacros write FPreserveMacros;
      //* The version of the TXLSReadWriteII2 component.
      property ComponentVersion: string read GetVersionNumber write SetVerionNumber;
      //* Global storage for pictures used in the worksheets.
      property MSOPictures: TMSOPictures read FMSOPictures write FMSOPictures;
      //* ~exclude
//      property PrintPictures: TMSOPictures read FPrintPictures write FPrintPictures;
      //* Password when reading/writing encrypted files.
      property Password: WideString read FPassword write FPassword;
      //* Mark the file as recomended read only.
      property RecomendReadOnly: boolean read GetRecomendReadOnly write SetRecomendReadOnly;
      //* Event fired while a file is read or written. The Value parameter
      //* increases from 0 to 100 while the file is read or written.
      property OnProgress: TIntegerEvent read FProgressEvent write FProgressEvent;
      //* Use the OnFunction event to do the calculation of formulas which not
      //* are calculated by TXLSReadWriteII2.
      //* See also ~[link Calculate]
      property OnFunction: TFunctionEvent read FFunctionEvent write FFunctionEvent;
      //* Event fired when a password protected (encrypted) file is read, and
      //* the password is required.
      property OnPassword: TPasswordEvent read FPasswordEvent write FPasswordEvent;
      end;

implementation

uses XLSReadII2, XLSWriteII2, DecodeFormula2;

{ TOptionsDialog }

constructor TOptionsDialog.Create(Records: TRecordStorageGlobals);
begin
  FRecords := Records;
  FCalcMode := cmAutomatic;
end;

function TOptionsDialog.GetPrecisionAsDisplayed: boolean;
begin
  Result := FRecords.PRECISION;
end;

function TOptionsDialog.GetSaveExtLinkVal: boolean;
begin
  Result := FRecords.BOOKBOOL;
end;

function TOptionsDialog.GetShowObjects: TShowObjects;
begin
  Result := TShowObjects(FRecords.HIDEOBJ);
end;

procedure TOptionsDialog.SetCalcCount(const Value: word);
begin
  if Value <= 0 then
    FCalcCount := 1
  else if Value > $7FFF then
    FCalcCount := $7FFF
  else
    FCalcCount := Value;
end;

procedure TOptionsDialog.SetPrecisionAsDisplayed(const Value: boolean);
begin
  FRecords.PRECISION := Value;
end;

procedure TOptionsDialog.SetSaveExtLinkVal(const Value: boolean);
begin
  FRecords.BOOKBOOL := Value;
end;

procedure TOptionsDialog.SetShowObjects(const Value: TShowObjects);
begin
  FRecords.HIDEOBJ := Word(Value);
end;

{ TStyle }

procedure TStyles.Add(Style: PRecSTYLE);
var
  P: PRecSTYLE;
begin
  New(P);
  System.Move(Style^,P^,SizeOf(TRecSTYLE));
  inherited Add(P);
end;

procedure TStyles.Clear;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    FreeMem(inherited Items[i]);
  inherited Clear;
end;

destructor TStyles.Destroy;
begin
  Clear;
  inherited;
end;

function TStyles.GetItems(Index: integer): PRecSTYLE;
begin
  Result := inherited Items[Index];
end;

{ TWorkbookData }

constructor TWorkbookData.Create(Records: TRecordStorageGlobals);
begin
  FRecords := Records;
end;

function TWorkbookData.GetDate1904: boolean;
begin
   Result := FRecords.DATE1904;
end;

function TWorkbookData.ReadHeight: word;
begin
  Result := FRecords.WINDOW1.Height;
end;

function TWorkbookData.ReadLeft: word;
begin
  Result := FRecords.WINDOW1.Left;
end;

function TWorkbookData.ReadOptions: TWorkbookOptions;
begin
  Result := [];
  if (FRecords.WINDOW1.Options and $01) = $01 then
    Result := Result + [woHidden];
  if (FRecords.WINDOW1.Options and $02) = $02 then
    Result := Result + [woIconized];
  if (FRecords.WINDOW1.Options and $08) = $08 then
    Result := Result + [woHScroll];
  if (FRecords.WINDOW1.Options and $10) = $10 then
    Result := Result + [woVScroll];
  if (FRecords.WINDOW1.Options and $20) = $20 then
    Result := Result + [woTabs];
end;

function TWorkbookData.ReadSelectedTab: word;
begin
  Result := FRecords.WINDOW1.SelectedTabIndex;
end;

function TWorkbookData.ReadTop: word;
begin
  Result := FRecords.WINDOW1.Top;
end;

function TWorkbookData.ReadWidth: word;
begin
  Result := FRecords.WINDOW1.Width;
end;

procedure TWorkbookData.WriteHeight(const Value: word);
begin
  FRecords.WINDOW1.Height := Value;
end;

procedure TWorkbookData.WriteLeft(const Value: word);
begin
  FRecords.WINDOW1.Left := Value;
end;

procedure TWorkbookData.WriteOptions(const Value: TWorkbookOptions);
begin
  FRecords.WINDOW1.Options := 0;
  if woHidden in Value then
    FRecords.WINDOW1.Options := FRecords.WINDOW1.Options or $01;
  if woIconized in Value then
    FRecords.WINDOW1.Options := FRecords.WINDOW1.Options or $02;
  if woHScroll in Value then
    FRecords.WINDOW1.Options := FRecords.WINDOW1.Options or $08;
  if woVScroll in Value then
    FRecords.WINDOW1.Options := FRecords.WINDOW1.Options or $10;
  if woTabs in Value then
    FRecords.WINDOW1.Options := FRecords.WINDOW1.Options or $20;
end;

procedure TWorkbookData.WriteSelectedTab(const Value: word);
begin
  FRecords.WINDOW1.SelectedTabIndex := Value;
end;

procedure TWorkbookData.WriteTop(const Value: word);
begin
  FRecords.WINDOW1.Top := Value;
end;

procedure TWorkbookData.WriteWidth(const Value: word);
begin
  FRecords.WINDOW1.Width := Value;
end;

constructor TXLSReadWriteII2.Create(AOwner: TComponent);
var
{$ifdef SHAREWARE}
  A,B,C,D: boolean;
{$endif}
  PB: PByteArray;
  Sz: integer;
begin
  inherited Create(AOwner);
{$ifdef SHAREWARE}
{$ifdef SHAREWARE_DLL}
  FNagMsgShown := True;
{$endif}
  if not FNagMsgShown then begin
    A := (FindWindow('TApplication', nil) = 0);
//    B := (FindWindow('TAlignPalette', nil) = 0);
//    C := (FindWindow('TPropertyInspector', nil) = 0);
    B := False;
    C := False;
    D := (FindWindow('TAppBuilder', nil) = 0);
    if A or B or C or D then begin
      MessageDlg('This application was built with a demo version of' + #13 +
                  'the XLSReadWriteII components.' + #13 + #13 +
                  'Distributing an application based upon this version' + #13 +
                  'of the components are against the licensing agreement.' + #13 + #13 +
                  'Please see http://www.axolot.com for more information' + #13 +
                  'on purchasing.',mtInformation,[mbOk],0);
      FNagMsgShown := True;
    end;
  end;
{$endif}
  Move(TDefaultExcelColorPalette[0],ExcelColorPalette[0],SizeOf(ExcelColorPalette));

{
  FCodepage := $04B0;
}

  // GetDEVMODE can cause all kind of strange errors. It's only used for
  // reading the default paper size.
  FDevMode := Nil; // GetDEVMODE;
  FDefaultPaperSize := psA4;
  PB := Nil;
  Sz := GetLocaleInfo(GetUserDefaultLCID,$100A {LOCALE_IPAPERSIZE},PChar(PB),0);
  GetMem(PB,Sz);
  try
    if GetLocaleInfo(LOCALE_SYSTEM_DEFAULT,$100A {LOCALE_IPAPERSIZE},PChar(PB),Sz) <> 0 then begin
      case Char(PB[0]) of
        '1': FDefaultPaperSize := psLegal;
        '5': FDefaultPaperSize := psLetter;
        '8': FDefaultPaperSize := psA3;
        '9': FDefaultPaperSize := psA4;
      end;
    end;
  finally
     FreeMem(PB);
  end;

  FRecords := TRecordStorageGlobals.Create;
  FRecords.SetDefaultData;
  FPreserveMacros := True;
{$ifdef USE_MSSTORAGE}
  FExtraObjects := TExtraObjects.Create;
{$else}
  FCacheFiles := TCacheFile.Create;
{$endif}
  FIsMac := False;
  FWriteDefaultData := True;
  FWorkbookData := TWorkbookData.Create(FRecords);
  FWorkbookData.Options := [woHScroll,woVScroll,woTabs];
  FWorkbookData.Top := 100;
  FWorkbookData.Left := 100;
  FWorkbookData.Width := 10000;
  FWorkbookData.Height := 7000;
  FOptionsDialog := TOptionsDialog.Create(FRecords);
  FFonts := TXFonts.Create(Self);
  FFormats := TCellFormats.Create(FFonts);
  FDefaultFormat := FFormats[DEFAULT_FORMAT];
  FSST := TSST2.Create(FFonts);
  FFormulaHandler := TFormulaHandler.Create(Self,FSST);
  FFormulaHandler.OnSheetName := FormulaHandlerSheetName;
  FFormulaHandler.OnSheetData := FormulaHandlerSheetData;
  FFormulaHandler.InternalNames.OnNameDeleted := InternalNameDeleted;
  SetStrTRUE('TRUE');
  SetStrFALSE('FALSE');
  FMSOPictures := TMSOPictures.Create(Self);
//  FPrintPictures := TMSOPictures.Create(Self);
  FStyles := TStyles.Create;
  FSheets := TSheets.Create(Self,FFormulaHandler);
//  Clear;
  FSheets.Add;
  FSheetCharts := TSheetCharts.Create(Self,MSOPictures);
  FVBA := TXLSVBA.Create;
  GetCommonSheetData;
  SetVersion(xvExcel97);
end;

destructor TXLSReadWriteII2.Destroy;
begin
  try
//    Clear;
  except
  end;
  FSST.Free;
  FSheets.Free;
  FFormulaHandler.Free;
  FFormats.Free;
  FFonts.Free;
  FOptionsDialog.Free;
  FWorkbookData.Free;
  FStyles.Free;
  FreeMem(FDevMode);
  FRecords.Free;
  FMSOPictures.Free;
//  FPrintPictures.Free;
{$ifdef USE_MSSTORAGE}
  FExtraObjects.Free;
{$else}
  FCacheFiles.Free;
{$endif}
  FSheetCharts.Free;
  FVBA.Free;
  inherited;
end;

procedure TXLSReadWriteII2.ClearCells;
begin
  FSheets.Clear;
end;

procedure TXLSReadWriteII2.Clear;
begin
  FFormulaHandler.Clear;
  FSST.Clear;
  FRecords.SetDefaultData;
  FWriteDefaultData := True;
  ClearCells;
  FFormats.Clear;
  FFormats.SetDefault;
  FFonts.Clear;
  FFonts.SetDefault;
  FStyles.Clear;
  FMSOPictures.Clear;
//  FPrintPictures.Free;
{$ifdef USE_MSSTORAGE}
  FExtraObjects.Clear;
{$else}
  FCacheFiles.Clear;
{$endif}
  FSheetCharts.Clear;
  FVBA.Clear;
  if FDevMode <> Nil then
    FreeMem(FDevMode);
  FDevMode := Nil;
  SetLength(FFILESHARING,0);
  FAborted := False;
end;

procedure TXLSReadWriteII2.SetVersion(Value: TExcelVersion);
begin
  FVersion := Value;
  if FVersion >= xvExcel97 then
    FMaxBuffsize := MAXRECSZ_97
  else
    FMaxBuffsize := MAXRECSZ_40;
  FSheets.MaxBufSize := FMaxBuffsize;
  FFormulaHandler.Version := FVersion;
end;

function TXLSReadWriteII2.GetFont: TXFont;
begin
  Result := Nil;
  if FFonts.Count > 0 then
    Result := FFonts[0]
  else
    ShowMessage('No Fonts');
end;

procedure TXLSReadWriteII2.SetFilename(const Value: WideString);
begin
  FFilename := Value;
end;

procedure TXLSReadWriteII2.SetFILESHARING(PBuf: PByteArray; Size: integer);
begin
  SetLength(FFILESHARING,Size);
  Move(PBuf^,FFILESHARING[0],Size);
end;

procedure TXLSReadWriteII2.SetFont(F: TXFont);
begin
  if FFonts.Count > 0 then
    FFonts[0].Assign(F)
  else
    ShowMessage('No Fonts');
end;

procedure TXLSReadWriteII2.SetCodepage(Value: word);
begin
  if Value = 0 then
    FRecords.CODEPAGE := $04E4
  else
    FRecords.CODEPAGE := Value;
end;

function TXLSReadWriteII2.GetCodepage: word;
begin
  Result := FRecords.CODEPAGE;
end;

procedure TXLSReadWriteII2.GetCommonSheetData;
begin
  case FSheets[0]._Int_Records.CALCMODE of
    $0000: FOptionsDialog.CalcMode := cmManual;
    $0001: FOptionsDialog.CalcMode := cmAutomatic;
    $FFFF: FOptionsDialog.CalcMode := cmAutoExTables;
  end;
  FOptionsDialog.CalcCount := FSheets[0]._Int_Records.CALCCOUNT;
  FOptionsDialog.Delta := FSheets[0]._Int_Records.DELTA;
  FOptionsDialog.R1C1Mode := FSheets[0]._Int_Records.REFMODE = 0;
  FOptionsDialog.Iteration := FSheets[0]._Int_Records.ITERATION;
  FOptionsDialog.SaveRecalc := FSheets[0]._Int_Records.SAVERECALC;
end;

procedure TXLSReadWriteII2.SetCommonSheetData;
var
  i: integer;
begin
  for i := 0 to FSheets.Count - 1 do begin
    case FOptionsDialog.CalcMode of
      cmManual       : FSheets[i]._Int_Records.CALCMODE := $0000;
      cmAutomatic    : FSheets[i]._Int_Records.CALCMODE := $0001;
      cmAutoExTables : FSheets[i]._Int_Records.CALCMODE := $FFFF;
    end;
    FSheets[i]._Int_Records.CALCCOUNT := FOptionsDialog.CalcCount;
    FSheets[i]._Int_Records.REFMODE := Word(not FOptionsDialog.R1C1Mode);
    FSheets[i]._Int_Records.ITERATION := FOptionsDialog.Iteration;
    FSheets[i]._Int_Records.SAVERECALC := FOptionsDialog.SaveRecalc;
  end;
end;

procedure TXLSReadWriteII2.SetDEVMODE(P: Pointer; Sz: integer);
begin
  GetMem(FDevmode,Sz);
  Move(P^,FDevmode^,Sz);
end;

procedure TXLSReadWriteII2.Read;
begin
  LoadFromStream(Nil);
end;

procedure TXLSReadWriteII2.LoadFromStream(Stream: TStream);
var
  i: integer;
  List: TList;
  XLSRead: TXLSReadII;
begin
  Clear;
  FSheets.ClearAll;
  FFonts.Clear;
  FFormats.Clear;
  FFormats.NumberFormats.SetDefault;
  BeginUpdate;
  XLSRead := TXLSReadII.Create(Self);
  try
    XLSRead.LoadFromStream(Stream);
//    FixupPictureData;
    FFormulaHandler.ExternalNames.FilePath := ExtractFilePath(FFilename);
    if Assigned(FAfterLoad) then
      FAfterLoad(Self);
  finally
    XLSRead.Free;
    EndUpdate;
    if FSheets.Count < 1 then begin
      Clear;
      FSheets.Clear;
    end;
  end;
  FFormats.UpdateDeleteIndex;
  FFonts.UpdateDeleteIndex;
  if FFormats.Count > DEFAULT_FORMAT then
    FDefaultFormat := FFormats[DEFAULT_FORMAT]
  else
    FDefaultFormat := FFormats[0];
  GetCommonSheetData;
  FRecords.PostCheck;
  List := TList.Create;
  try
    FMSOPictures.GetBlipIds(List);
    for i := 0 to FSheets.Count - 1 do begin
      FSheets[i]._Int_EscherDrawing.AssignBlipIds(List);
      FSheets[i].AfterFileRead;
    end;
    for i := 0 to FSheetCharts.Count - 1 do begin
      if FSheetCharts[i].Drawing <> Nil then
        FSheetCharts[i].Drawing.AssignBlipIds(List);
    end;
  finally
    List.Free;
  end;
{$ifdef SHAREWARE}
  for i := 0 to FSheets.Count - 1 do
    FSheets[i].AsString[0,0] := 'XLSReadWriteII Copyright(c) 2006 Axolot Data';
{$endif}
end;

procedure TXLSReadWriteII2.Write;
begin
  WriteToStream(Nil);
end;

procedure TXLSReadWriteII2.WriteToStream(Stream: TStream);
var
  i: integer;
  XLSWrite: TXLSWriteII;
begin
  if FVersion in [xvExcel21,xvExcel30] then
    ShowMessage('Can not write Excel 2.1/3.0 files');
{$ifdef SHAREWARE}
  for i := 0 to Sheets.Count - 1 do
    FSheets[i].AsString[0,0] := 'XLSReadWriteII Copyright(c) 2006 Axolot Data';
{$endif}

  FAborted := False;
  if Assigned(FProgressEvent) then begin
    FProgressEvent(Self,0);
    FCellCount := 0;
    FProgressCount := 0;
    for i := 0 to FSheets.Count - 1 do
      Inc(FCellCount,FSheets[i]._Int_Records.Count);
  end;

  SetCommonSheetData;
  FFormulaHandler.ExternalNames.UpdateIntSupbooks(FSheets.Count);

//  FMSOPictures.ResetBlipRefCount;
  for i := 0 to FSheets.Count - 1 do
    FSheets[i]._Int_EscherDrawing.SetBlipRefCount;

  XLSWrite := TXLSWriteII.Create(Self);
  try
    if FVersion > xvExcel40 then
      XLSWrite.WriteToStream(Stream)
    else
      XLSWrite.WriteToStream40(Stream);
  finally
    XLSWrite.Free;
  end;
  if Assigned(FProgressEvent) then
    FProgressEvent(Self,100);
end;

procedure TXLSReadWriteII2.Abort;
begin
  Clear;
  FAborted := True;
end;

function TXLSReadWriteII2.Aborted: boolean;
begin
  Result := FAborted;
end;

procedure TXLSReadWriteII2.AddNumberFormat(Format: string; Index: integer);
begin
  FFormats.NumberFormats.AddSorted(Format,Index,1);
end;

function TXLSReadWriteII2.MaxRowCount: integer;
begin
  Result := MAXROW;
end;

function TXLSReadWriteII2.GetNameValue(Index,Col,Row: integer): TFormulaValue;
var
  i: integer;
begin
  i := FFormulaHandler.ExternalNames.IsSelf(Index);
  if i = $FFFF then
    FVSetError(Result,errNA)
  else if i > FSheets.Count then
    raise Exception.Create('Sheet index out of range')
  else if i >= 0 then
    Result := FSheets[i].AsFormulaValue[Col,Row]
  else
    Result := FFormulaHandler.ExternalNames.GetValue(Index,Col,Row);
end;

function TXLSReadWriteII2.GetExternNameValue(NameIndex, SheetIndex: integer): TFormulaValue;
begin
  Result := FFormulaHandler.ExternalNames.GetNameValue(NameIndex,SheetIndex);
end;

procedure TXLSReadWriteII2.CopyCells(SrcSheet, Col1, Row1, Col2, Row2, DestSheet, DestCol, DestRow: integer; CopyOptions: TCopyCellsOptions);
var
  i,C,R: integer;
  RCSrc,RCDst: longword;
  Cell: TCell;
  Cells: TList;
begin
  if (SrcSheet = DestSheet) and (Col1 = DestCol) and (Row1 = DestRow) then
    Exit;
  NormalizeArea(Col1, Row1, Col2, Row2);
  Cells := TList.Create;
  try
    if ccoCopyValues in CopyOptions then begin
      if (Col1 = 0) and (Col2 = MAXCOL) and (Row1 = 0) and (Row2 = MAXROW) then begin
        FSheets[SrcSheet]._Int_Cells.BeginIterate;
        repeat
          Cell := FSheets[SrcSheet]._Int_Cells.GetNext;
          if Cell <> Nil then
            Cells.Add(Cell.MakeCopy);
        until (Cell = Nil);
      end
      else begin
        for R := Row1 to Row2 do begin
          for C := Col1 to Col2 do begin
            if FSheets[SrcSheet]._Int_Cells[ColRowToRC(C,R)] <> Nil then
              Cells.Add(FSheets[SrcSheet]._Int_Cells[ColRowToRC(C,R)].MakeCopy);
          end;
        end;
      end;

      RCSrc := ColRowToRC(Col1,Row1);
      RCDst := ColRowToRC(DestCol,DestRow);
      for i := 0 to Cells.Count - 1 do begin
        TCell(Cells[i]).RowCol := (TCell(Cells[i]).RowCol - RCSrc) + RCDst;
        FSheets[DestSheet]._Int_Cells.CellsNotChangeFmt[TCell(Cells[i]).RowCol] := Cells[i];
        if (ccoAdjustCells in CopyOptions) and (FSheets[DestSheet]._Int_Cells[TCell(Cells[i]).RowCol] is TFormulaCell) then
          AdjustCell(FVersion = xvExcel97,TFormulaCell(Cells[i]).PTGS,TFormulaCell(Cells[i]).FormulaSize,DestCol - Col1,DestRow - Row1,ccoLockStartRow in CopyOptions,ccoForceAdjust in CopyOptions);
      end;
    end;

    if DestSheet = SrcSheet then begin
      if ccoCopyShapes in CopyOptions then
        FSheets[DestSheet]._Int_EscherDrawing.Copy(Col1, Row1, Col2, Row2, DestCol, DestRow);
      if ccoCopyCondFmt in CopyOptions then
        FSheets[DestSheet].ConditionalFormats.CopyLocal(Col1, Row1, Col2, Row2, DestCol, DestRow);
      if ccoCopyValidations in CopyOptions then
        FSheets[DestSheet].Validations.CopyLocal(Col1, Row1, Col2, Row2, DestCol, DestRow);
      if ccoCopyMerged in CopyOptions then
        FSheets[DestSheet].MergedCells.Copy(Col1, Row1, Col2, Row2,DestCol - Col1,DestRow - Row1);
    end
    else begin
      if ccoCopyShapes in CopyOptions then begin
        Cells.Clear;
        FSheets[SrcSheet]._Int_EscherDrawing.CopyList(Cells,Col1, Row1, Col2, Row2);
        FSheets[DestSheet]._Int_EscherDrawing.InsertList(Cells,DestCol,DestRow);
      end;
      if ccoCopyCondFmt in CopyOptions then begin
        Cells.Clear;
        FSheets[SrcSheet].ConditionalFormats.CopyList(Cells,Col1, Row1, Col2, Row2);
        FSheets[DestSheet].ConditionalFormats.InsertList(Cells,Col1, Row1, Col2, Row2,DestCol,DestRow);
      end;
      if ccoCopyValidations in CopyOptions then begin
        Cells.Clear;
        FSheets[SrcSheet].Validations.CopyList(Cells,Col1, Row1, Col2, Row2);
        FSheets[DestSheet].Validations.InsertList(Cells,Col1, Row1, Col2, Row2,DestCol,DestRow);
      end;
      if ccoCopyMerged in CopyOptions then begin
        Cells.Clear;
        FSheets[SrcSheet].MergedCells.CopyList(Cells,Col1, Row1, Col2, Row2);
        FSheets[DestSheet].MergedCells.InsertList(Cells,Col1, Row1, Col2, Row2,DestCol,DestRow);
      end;
    end;
  finally
    Cells.Free;
  end;
end;

procedure TXLSReadWriteII2.MoveCells(SrcSheet, Col1, Row1, Col2, Row2, DestSheet, DestCol, DestRow: integer; CopyOptions: TCopyCellsOptions);
var
  i,C,R: integer;
  RCSrc,RCDst: longword;
  Cell: TCell;
  Cells: TList;
begin
  if (SrcSheet = DestSheet) and (Col1 = DestCol) and (Row1 = DestRow) then
    Exit;
  NormalizeArea(Col1, Row1, Col2, Row2);
  Cells := TList.Create;
  try
    if ccoCopyValues in CopyOptions then begin
      if (Col1 = 0) and (Col2 = MAXCOL) and (Row1 = 0) and (Row2 = MAXROW) then begin
        FSheets[SrcSheet]._Int_Cells.BeginIterate;
        repeat
          Cell := FSheets[SrcSheet]._Int_Cells.GetNext;
          if Cell <> Nil then begin
            Cells.Add(Cell.MakeCopy);
            FSheets[SrcSheet]._Int_Cells[ColRowToRC(C,R)].Free;
            FSheets[SrcSheet]._Int_Cells.SetNil(Cell.RowCol);
          end;
        until (Cell = Nil);
      end
      else begin
        FSheets[SrcSheet]._Int_Cells.BeginIterate;
        Cell := FSheets[SrcSheet]._Int_Cells.GetNext;
        while Cell <> Nil do begin
          SplitRC(Cell.RowCol,C,R);
          if (C >= Col1) and (R >= Row1) and (C <= Col2) and (R <= Row2) then begin
            Cells.Add(FSheets[SrcSheet]._Int_Cells[ColRowToRC(C,R)].MakeCopy);
            FSheets[SrcSheet]._Int_Cells[ColRowToRC(C,R)].Free;
            FSheets[SrcSheet]._Int_Cells.SetNil(ColRowToRC(C,R));
          end;
          Cell := FSheets[SrcSheet]._Int_Cells.GetNext;
        end;
{
        for R := Row1 to Row2 do begin
          for C := Col1 to Col2 do begin
            if FSheets[SrcSheet].StorageCells[ColRowToRC(C,R)] <> Nil then begin
              Cells.Add(FSheets[SrcSheet].StorageCells[ColRowToRC(C,R)].MakeCopy);
              FSheets[SrcSheet].StorageCells.SetNil(ColRowToRC(C,R));
            end;
          end;
        end;
}
      end;

      RCSrc := ColRowToRC(Col1,Row1);
      RCDst := ColRowToRC(DestCol,DestRow);

      for i := 0 to Cells.Count - 1 do begin
        TCell(Cells[i]).RowCol := (TCell(Cells[i]).RowCol - RCSrc) + RCDst;
        FSheets[DestSheet]._Int_Cells.CellsNotChangeFmt[TCell(Cells[i]).RowCol] := Cells[i];
        if (ccoAdjustCells in CopyOptions) and (FSheets[DestSheet]._Int_Cells[TCell(Cells[i]).RowCol] is TFormulaCell) then
          AdjustCell(FVersion = xvExcel97,TFormulaCell(Cells[i]).PTGS,TFormulaCell(Cells[i]).FormulaSize,DestCol - Col1,DestRow - Row1,ccoLockStartRow in CopyOptions,ccoForceAdjust in CopyOptions);
      end;

    end;
    // TODO: Can only move shapes on same sheet.
    if DestSheet = SrcSheet then begin
      if ccoCopyShapes in CopyOptions then
        FSheets[DestSheet]._Int_EscherDrawing.Move(Col1, Row1, Col2, Row2, DestCol, DestRow);
      if ccoCopyCondFmt in CopyOptions then
        FSheets[DestSheet].ConditionalFormats.MoveLocal(Col1, Row1, Col2, Row2, DestCol, DestRow);
      if ccoCopyValidations in CopyOptions then
        FSheets[DestSheet].Validations.MoveLocal(Col1, Row1, Col2, Row2, DestCol, DestRow);
      if ccoCopyMerged in CopyOptions then
        FSheets[DestSheet].MergedCells.Move(Col1, Row1, Col2, Row2,DestCol - Col1,DestRow - Row1);
    end
    else begin
      if ccoCopyShapes in CopyOptions then begin
        Cells.Clear;
        FSheets[SrcSheet]._Int_EscherDrawing.CopyList(Cells,Col1, Row1, Col2, Row2);
        FSheets[DestSheet]._Int_EscherDrawing.InsertList(Cells,DestCol,DestRow);
        FSheets[SrcSheet]._Int_EscherDrawing.DeleteList(Cells);
      end;
      if ccoCopyCondFmt in CopyOptions then begin
        Cells.Clear;
        FSheets[SrcSheet].ConditionalFormats.CopyList(Cells,Col1, Row1, Col2, Row2);
        FSheets[DestSheet].ConditionalFormats.InsertList(Cells,Col1, Row1, Col2, Row2,DestCol,DestRow);
        FSheets[SrcSheet].ConditionalFormats.DeleteList(Cells,Col1, Row1, Col2, Row2);
      end;
      if ccoCopyValidations in CopyOptions then begin
        Cells.Clear;
        FSheets[SrcSheet].Validations.CopyList(Cells,Col1, Row1, Col2, Row2);
        FSheets[DestSheet].Validations.InsertList(Cells,Col1, Row1, Col2, Row2,DestCol,DestRow);
        FSheets[SrcSheet].Validations.DeleteList(Cells,Col1, Row1, Col2, Row2);
      end;
      if ccoCopyMerged in CopyOptions then begin
        Cells.Clear;
        FSheets[SrcSheet].MergedCells.CopyList(Cells,Col1, Row1, Col2, Row2);
        FSheets[DestSheet].MergedCells.InsertList(Cells,Col1, Row1, Col2, Row2,DestCol,DestRow);
        FSheets[SrcSheet].MergedCells.DeleteList(Cells,Col1, Row1, Col2, Row2);
      end;
    end;
  finally
    Cells.Free;
  end;
end;

procedure TXLSReadWriteII2.DeleteCells(Sheet, Col1, Row1, Col2, Row2: integer);
begin
  FSheets[Sheet].DeleteCells(Col1, Row1, Col2, Row2);
end;

function TXLSReadWriteII2.GetDEVMODE: PDeviceModeW;
var
  hDevMode,FPrinterHandle: THandle;
  P: PDeviceModeW;
  ADevice: PWideChar;
  StubDevMode: TDeviceModeW;
  sPrinter: string;
begin
  if (Printer = Nil) or (Printer.Printers = Nil) or (Printer.Printers.Count <= 0) or (Printer.PrinterIndex < 0) then
    FDevMode := Nil
  else if FDevMode = Nil then begin
    sPrinter := Printer.Printers[Printer.PrinterIndex];
    if (sPrinter <> '') and OpenPrinter(PChar(sPrinter),FPrinterHandle, nil) then begin
      GetMem(ADevice,64);
      StringToWideChar(sPrinter,ADevice,64);
      hDevMode := GlobalAlloc(GHND,DocumentPropertiesW(0, FPrinterHandle, ADevice, StubDevMode, StubDevMode, 0));
      if hDevMode <> 0 then begin
        P := GlobalLock(hDevMode);
        if DocumentPropertiesW(0, FPrinterHandle, ADevice, P^, P^, DM_OUT_BUFFER) < 0 then
          FDevMode := Nil
        else begin
          GetMem(FDevMode,P.dmSize + P.dmDriverExtra);
          Move(P^,FDevMode^,P.dmSize + P.dmDriverExtra);
        end;
        GlobalUnlock(hDevMode);
        GlobalFree(hDevMode);
      end;
    end;
  end;
  Result := FDevMode;
end;

function TXLSReadWriteII2.HasDEVMODE: boolean;
begin
  Result := FDevMode <> Nil;
end;

function TXLSReadWriteII2.GetUserName: string;
begin
  Result := FRecords.WRITEACCESS;
end;

procedure TXLSReadWriteII2.SetUserName(const Value: string);
begin
  FRecords.WRITEACCESS := Value;
end;

function TXLSReadWriteII2.GetBookProtected: boolean;
begin
  Result := FRecords.WINDOWPROTECT;
end;

procedure TXLSReadWriteII2.SetBookProtected(const Value: boolean);
begin
  FRecords.WINDOWPROTECT := Value;
end;

function TXLSReadWriteII2.GetBackup: boolean;
begin
  Result := FRecords.BACKUP;
end;

procedure TXLSReadWriteII2.SetBackup(const Value: boolean);
begin
  FRecords.BACKUP := Value;
end;

function TXLSReadWriteII2.GetRecomendReadOnly: boolean;
begin
  if Length(FFILESHARING) < 2 then
    Result := False
  else
    Result := PWordArray(FFILESHARING)[0] = 1;
end;

function TXLSReadWriteII2.GetRefreshAll: boolean;
begin
  Result := FRecords.REFRESHALL;
end;

procedure TXLSReadWriteII2.SetRecomendReadOnly(const Value: boolean);
var
  Z: boolean;
  i: integer;
begin
  if Value then begin
    if Length(FFILESHARING) < 2 then begin
      SetLength(FFILESHARING,6);
      FillChar(FFILESHARING[0],Length(FFILESHARING),#0);
    end;
    PWordArray(FFILESHARING)[0] := 1;
  end
  else begin
    if Length(FFILESHARING) < 2 then
      SetLength(FFILESHARING,0)
    else begin
      PWordArray(FFILESHARING)[0] := 0;
      Z := True;
      for i := 0 to High(FFILESHARING) do begin
        if FFILESHARING[i] <> 0 then begin
          Z := False; 
          Break;
        end;
      end;
      if Z then
        SetLength(FFILESHARING,0);
    end;
  end;
end;

procedure TXLSReadWriteII2.SetRefreshAll(const Value: boolean);
begin
  FRecords.REFRESHALL := Value;
end;

function TXLSReadWriteII2.GetNameAsFloat(AName: string): double;
var
  SheetIndex,Col1,Row1,Col2,Row2: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2);
  Result := FSheets[SheetIndex].AsFloat[Col1,Row1];
end;

procedure TXLSReadWriteII2.SetNameAsFloat(AName: string; const Value: double);
var
  SheetIndex,Col1,Row1,Col2,Row2,C,R: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2,True);
  for R := Row1 to Row2 do begin
    for C := Col1 to Col2 do
      FSheets[SheetIndex].AsFloat[C,R] := Value;
  end;
end;

function TXLSReadWriteII2.GetNameAsCell(AName: string): TCell;
var
  SheetIndex,Col1,Row1,Col2,Row2: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2);
  Result := FSheets[SheetIndex].Cell[Col1,Row1];
end;

function TXLSReadWriteII2.GetNameAsBoolean(AName: string): boolean;
var
  SheetIndex,Col1,Row1,Col2,Row2: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2,True);
  Result := FSheets[SheetIndex].AsBoolean[Col1,Row1];
end;

function TXLSReadWriteII2.GetNameAsBoolFormulaValue(AName: string): boolean;
var
  SheetIndex,Col1,Row1,Col2,Row2: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2);
  Result := FSheets[SheetIndex].AsBoolFormulaValue[Col1,Row1];
end;

function TXLSReadWriteII2.GetNameAsError(AName: string): TCellError;
var
  SheetIndex,Col1,Row1,Col2,Row2: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2);
  Result := FSheets[SheetIndex].AsError[Col1,Row1];
end;

function TXLSReadWriteII2.GetNameAsFmtString(AName: string): WideString;
var
  SheetIndex,Col1,Row1,Col2,Row2: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2);
  Result := FSheets[SheetIndex].AsFmtString[Col1,Row1];
end;

function TXLSReadWriteII2.GetNameAsFormula(AName: string): string;
var
  SheetIndex,Col1,Row1,Col2,Row2: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2);
  Result := FSheets[SheetIndex].AsFormula[Col1,Row1];
end;

function TXLSReadWriteII2.GetNameAsNumFormulaValue(AName: string): double;
var
  SheetIndex,Col1,Row1,Col2,Row2: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2);
  Result := FSheets[SheetIndex].AsNumFormulaValue[Col1,Row1];
end;

function TXLSReadWriteII2.GetNameAsStrFormulaValue(AName: string): WideString;
var
  SheetIndex,Col1,Row1,Col2,Row2: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2);
  Result := FSheets[SheetIndex].AsStrFormulaValue[Col1,Row1];
end;

function TXLSReadWriteII2.GetNameAsString(AName: string): WideString;
var
  SheetIndex,Col1,Row1,Col2,Row2: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2);
  Result := FSheets[SheetIndex].AsString[Col1,Row1];
end;

procedure TXLSReadWriteII2.SetNameAsBoolean(AName: string; const Value: boolean);
var
  SheetIndex,Col1,Row1,Col2,Row2,C,R: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2,True);
  for R := Row1 to Row2 do begin
    for C := Col1 to Col2 do
      FSheets[SheetIndex].AsBoolean[C,R] := Value;
  end;
end;

procedure TXLSReadWriteII2.SetNameAsBoolFormulaValue(AName: string; const Value: boolean);
var
  SheetIndex,Col1,Row1,Col2,Row2,C,R: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2,True);
  for R := Row1 to Row2 do begin
    for C := Col1 to Col2 do
      FSheets[SheetIndex].AsBoolFormulaValue[C,R] := Value;
  end;
end;

procedure TXLSReadWriteII2.SetNameAsError(AName: string; const Value: TCellError);
var
  SheetIndex,Col1,Row1,Col2,Row2,C,R: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2,True);
  for R := Row1 to Row2 do begin
    for C := Col1 to Col2 do
      FSheets[SheetIndex].AsError[C,R] := Value;
  end;
end;

procedure TXLSReadWriteII2.SetNameAsFormula(AName: string; const Value: string);
var
  SheetIndex,Col1,Row1,Col2,Row2,C,R: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2,True);
  for R := Row1 to Row2 do begin
    for C := Col1 to Col2 do
      FSheets[SheetIndex].AsFormula[C,R] := Value;
  end;
end;

procedure TXLSReadWriteII2.SetNameAsNumFormulaValue(AName: string; const Value: double);
var
  SheetIndex,Col1,Row1,Col2,Row2,C,R: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2,True);
  for R := Row1 to Row2 do begin
    for C := Col1 to Col2 do
      FSheets[SheetIndex].AsNumFormulaValue[C,R] := Value;
  end;
end;

procedure TXLSReadWriteII2.SetNameAsStrFormulaValue(AName: string; const Value: WideString);
var
  SheetIndex,Col1,Row1,Col2,Row2,C,R: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2,True);
  for R := Row1 to Row2 do begin
    for C := Col1 to Col2 do
      FSheets[SheetIndex].AsStrFormulaValue[C,R] := Value;
  end;
end;

procedure TXLSReadWriteII2.SetNameAsString(AName: string; const Value: WideString);
var
  SheetIndex,Col1,Row1,Col2,Row2,C,R: integer;
begin
  FFormulaHandler.GetNameRef(AName,SheetIndex,Col1,Row1,Col2,Row2,True);
  for R := Row1 to Row2 do begin
    for C := Col1 to Col2 do
      FSheets[SheetIndex].AsString[C,R] := Value;
  end;
end;

function TXLSReadWriteII2.GetVersionNumber: string;
begin
  Result := CurrentVersionNumber;
{$ifdef SHAREWARE}
  Result := Result + 'a';
{$endif}
end;

function TXLSReadWriteII2.GetWeakPassword: string;
var
  P: word;
  Chars,S: string;
  i,j,k: integer;

function MakeWeakPassword(S: string): word;
var
  C,T: word;
  i: integer;
begin
  Result := 0;
  S := Copy(S,1,15);
  for i := 1 to Length(S) do begin
    T := Byte(S[i]);
    C := ((T shl i) + (T shr (15 - i))) and $7FFF;
    Result := Result xor C;
  end;
  Result := Result xor Length(S) xor $CE4B;
end;

begin
  Result := '';
  P := FRecords.PASSWORD;
  if P = 0 then
    Exit;
  Chars := 'abcdefghijklmnopqrstuwvxyzABCDEFGHIJKLMNOPQRSTUWVXYZ0123456789_';
  Randomize;
  for k := 1 to 1000000 do begin
    i := Random(15) + 1;
    SetLength(S,i);
    for j := 1 to i do
      S[j] := Chars[Random(Length(Chars)) + 1];
    if P = MakeWeakPassword(S) then begin
      Result := S;
      Exit;
    end;
  end;
end;

procedure TXLSReadWriteII2.SetVerionNumber(const Value: string);
begin
//
end;

procedure TXLSReadWriteII2.FormulaHandlerSheetName(Name: WideString; var Index,Count: integer);
var
  Sheet: TSheet;
begin
  Sheet := FSheets.SheetByName(Name);
  if Sheet = Nil then begin
    Index := -1;
    Count := 0;
  end
  else begin
    Index := Sheet.Index;
    Count := FSheets.Count;
  end;
end;

function TXLSReadWriteII2.FormulaHandlerSheetData(DataType: TSheetDataType; SheetIndex, Col, Row: integer): WideString;
begin
  case DataType of
    sdtName:
      Result := FSheets[SheetIndex].Name;
    sdtCell:
      Result := FSheets[SheetIndex].AsString[Col,Row];
  end;
end;

function TXLSReadWriteII2.GetInternalNames: TInternalNames;
begin
  Result := FFormulaHandler.InternalNames;
end;

procedure TXLSReadWriteII2.SetInternalNames(const Value: TInternalNames);
begin

end;

procedure TXLSReadWriteII2.Calculate;
var
  i: integer;
begin
  for i := 0 to FSheets.Count - 1 do
    FSheets[i].CalculateSheet;
end;

procedure TXLSReadWriteII2.BeginUpdate;
begin
  FSST.BeginUpdate;
end;

procedure TXLSReadWriteII2.EndUpdate;
begin
  FSST.EndUpdate;
end;

procedure TXLSReadWriteII2.CopyColumns(SrcSheet, Col1, Col2, DestSheet, DestCol: integer; DoCopyCells: boolean = True);
var
  List: TList;
begin
  if SrcSheet = DestSheet then
    FSheets[SrcSheet].Columns.CopyColumns(Col1,Col2,DestCol)
  else begin
    List := TList.Create;
    try
      FSheets[SrcSheet].Columns.CopyList(List,Col1,Col2);
      FSheets[DestSheet].Columns.InsertList(List,DestCol - Col1,DestCol,Col2 - Col2 + 1);
    finally
      List.Free;
    end;
  end;
  if DoCopyCells then
    CopyCells(SrcSheet,Col1,0,Col2,MAXROW,DestSheet,DestCol,0);
end;

procedure TXLSReadWriteII2.CopyRows(SrcSheet, Row1, Row2, DestSheet, DestRow: integer; DoCopyCells: boolean = True);
var
  List: TList;
begin
  if SrcSheet = DestSheet then
    FSheets[SrcSheet].Rows.CopyRows(Row1,Row2,DestRow)
  else begin
    List := TList.Create;
    try
      FSheets[SrcSheet].Rows.CopyList(List,Row1,Row2);
      FSheets[DestSheet].Rows.InsertList(List,DestRow - Row1,DestRow,Row2 - Row1 + 1);
    finally
      List.Free;
    end;
  end;
  if DoCopyCells then
    CopyCells(SrcSheet,0,Row1,MAXCOL,Row2,DestSheet,0,DestRow);
end;

procedure TXLSReadWriteII2.DeleteColumns(Sheet, Col1, Col2: integer);
begin
  FSheets[Sheet].DeleteColumns(Col1,Col2);
  FFormulaHandler.DeleteColumns(Sheet,Col1,Col2);
//  FSheets[Sheet].Columns.DeleteColumns(Col1,Col2);
end;

procedure TXLSReadWriteII2.DeleteRows(Sheet, Row1, Row2: integer);
begin
  FSheets[Sheet].DeleteRows(Row1,Row2);
  FFormulaHandler.DeleteRows(Sheet,Row1,Row2);
//  FSheets[Sheet].Rows.DeleteRows(Row1,Row2);
end;

procedure TXLSReadWriteII2.MoveColumns(SrcSheet, Col1, Col2, DestSheet, DestCol: integer; DoMoveCells: boolean = True);
var
  List: TList;
begin
  if SrcSheet = DestSheet then
    FSheets[SrcSheet].Columns.MoveColumns(Col1,Col2,DestCol)
  else begin
    List := TList.Create;
    try
      FSheets[SrcSheet].Columns.CopyList(List,Col1,Col2);
      FSheets[DestSheet].Columns.InsertList(List,DestCol - Col1,DestCol,Col2 - Col1 + 1);
      FSheets[SrcSheet].Columns.DeleteColumns(Col1,Col2);
    finally
      List.Free;
    end;
  end;
  if DoMoveCells then
    MoveCells(SrcSheet,Col1,0,Col2,MAXROW,DestSheet,DestCol,0);
end;

procedure TXLSReadWriteII2.MoveRows(SrcSheet, Row1, Row2, DestSheet, DestRow: integer; DoMoveCells: boolean = True);
var
  List: TList;
begin
  if SrcSheet = DestSheet then
    FSheets[SrcSheet].Rows.MoveRows(Row1,Row2,DestRow)
  else begin
    List := TList.Create;
    try
      FSheets[SrcSheet].Rows.CopyList(List,Row1,Row2);
      FSheets[DestSheet].Rows.InsertList(List,DestRow - Row1,DestRow,Row2 - Row1 + 1);
      FSheets[SrcSheet].Rows.DeleteRows(Row1,Row2);
    finally
      List.Free;
    end;
  end;
  if DoMoveCells then
    MoveCells(SrcSheet,0,Row1,MAXCOL,Row2,DestSheet,0,DestRow);
end;

procedure TXLSReadWriteII2.ClearColumns(Sheet, Col1, Col2: integer);
begin
  FSheets[Sheet].Columns.ClearColumns(Col1,Col2);
  FSheets[Sheet].DeleteCells(Col1,0,Col2,MAXROW);
end;

procedure TXLSReadWriteII2.ClearRows(Sheet, Row1, Row2: integer);
begin
  FSheets[Sheet].Rows.ClearRows(Row1,Row2);
end;

procedure TXLSReadWriteII2.InsertColumns(Sheet, Col, ColCount: integer);
begin
  FSheets[Sheet].InsertColumns(Col,ColCount);
  FFormulaHandler.InsertColumns(Sheet,Col,ColCount);
//  FSheets[Sheet].Columns.InsertColumns(Col,ColCount);
// If MoveCells is executed, cells are move twice.
// But I don't remember why it ever was included. Check this carefully
// if there are any problems.
//  MoveCells(Sheet,Col,0,MAXCOL,MAXROW,Sheet,Col + ColCount,0);
end;

procedure TXLSReadWriteII2.InsertRows(Sheet, Row, RowCount: integer);
begin
  FSheets[Sheet].InsertRows(Row,RowCount);
  FFormulaHandler.InsertRows(Sheet,Row,RowCount);
//  FSheets[Sheet].Rows.InsertRows(Row,RowCount);
// If MoveCells is executed, cells are move twice.
// But I don't remember why it ever was included. Check this carefully
// if there are any problems.
// MoveCells(Sheet,0,Row,MAXCOL,MAXROW,Sheet,0,Row + RowCount);
end;

procedure TXLSReadWriteII2.CopySheet(SrcSheet, DestSheet: integer);
begin
  if SrcSheet <> DestSheet then begin
    Sheets[DestSheet].ClearWorksheet;
    Sheets[DestSheet].Assign(Sheets[SrcSheet]);
    CopyColumns(SrcSheet,0,MAXCOL,DestSheet,0,False);
    CopyRows(SrcSheet,0,MAXROW,DestSheet,0,False);
    CopyCells(SrcSheet,0,0,MAXCOL,MAXROW,DestSheet,0,0);
  end;
end;

procedure TXLSReadWriteII2.WrittenNCells;
var
  V: double;
  Last: integer;
begin
  if FCellCount > 0 then begin
    V := 100 / FCellCount;
    Last := Round(FProgressCount * V);
    Inc(FProgressCount,100);
    if Round(FProgressCount * V) <> Last then
      FProgressEvent(Self,Round(FProgressCount * V));
  end;
  Application.ProcessMessages;
end;

procedure TXLSReadWriteII2.SetStrFALSE(const Value: WideString);
begin
  G_StrFALSE := Value;
end;

procedure TXLSReadWriteII2.SetStrTRUE(const Value: WideString);
begin
  G_StrTRUE := Value;
end;

procedure TXLSReadWriteII2.BeginFindText;
var
  i: integer;
begin
  for i := 0 to FSheets.Count - 1 do
    FSheets[i].BeginFindText;
  FCurrFindSheet := 0;
end;

function TXLSReadWriteII2.FindText(Text: WideString; CaseInsensitive: boolean): boolean;
begin
  while FCurrFindSheet < FSheets.Count do begin
    Result := FSheets[FCurrFindSheet].FindText(Text,CaseInsensitive);
    if Result then
      Exit;
    Inc(FCurrFindSheet);
  end;
  Result := False;
end;

function TXLSReadWriteII2.GetFILESHARING(PBuf: PByteArray): integer;
begin
  Move(FFILESHARING[0],PBuf^,Length(FFILESHARING));
  Result := Length(FFILESHARING);
end;

procedure TXLSReadWriteII2.GetFindData(var Sheet,Col, Row, TextPos: integer; var Text: WideString);
begin
  FSheets[FCurrFindSheet].GetFindData(Col, Row, TextPos,Text);
  Sheet := FCurrFindSheet;
end;

function TXLSReadWriteII2.GetPalette(Index: integer): TColor;
begin
  if (Index < 0) or (Index > High(ExcelColorPalette)) then
    raise Exception.Create('Palette index out of range');
  Result := ExcelColorPalette[Index];
end;

procedure TXLSReadWriteII2.SetPalette(Index: integer; const Value: TColor);
begin
  if (Index < 8) or (Index > High(ExcelColorPalette)) then
    raise Exception.Create('Palette index out of range');
  ExcelColorPalette[Index] := Value;
end;

function TXLSReadWriteII2.GetSheet(Index: integer): TSheet;
begin
  Result := FSheets[Index];
end;

function TXLSReadWriteII2.GetStrFALSE: WideString;
begin
  Result := G_StrFALSE;
end;

function TXLSReadWriteII2.GetStrTRUE: WideString;
begin
  Result := G_StrTRUE;
end;

procedure TXLSReadWriteII2.InternalNameDeleted(Sender: TObject; Delta: integer);
var
  i: integer;
begin
  for i := 0 to FSheets.Count - 1 do
    FSheets[i].NameIndexChanged(Delta);
end;

end.
