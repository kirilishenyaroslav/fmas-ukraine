unit SheetData2;

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

{$Q-}
{$B-}
{$H+}
{$R-}
{$I XLSRWII2.inc}


interface

uses SysUtils, Classes, Windows, Dialogs, BIFFRecsII2, XLSUtils2, XLSStream2,
     Cell2, EncodeFormulaII2, CellStorage2, Graphics, Contnrs,
{$ifndef OLD_COMPILER}
     Variants,
{$endif}
     CellFormats2, SST2, Validate2, Math, Hyperlink2, RecordStorage2, Escher2,
     EscherTypes2, DrawingObj2, ControlObj2, XLSFonts2, ApplyFormat,
     FormulaHandler2, DrawingObjChart2, MergedCells2, CondFmt2, CellAreas2,
     Columns2, Rows2, RTFReadWrite2, ComCtrls, XLSHashTrie, DecodeFormula2,
     Autofilter2, EscherCtrlObj2, XLSRange2, CellValues2, XLSWideStrList2;

//* Pane type when a worksheet has splitted panes.
type TPaneType = (ptNone,    //* No panes.
                  ptFrozen,  //* Frozen panes,
                  ptSplit    //* Splitted panes.
                  );

//* Hide state for worksheets.
type THiddenState = (hsVisible,   //* The worksheet is visible.
                     hsHidden,    //* Worksheet is hidden.
                     hsVeryHidden //* Worksheet is hidden, and it's data can only be accessed from VBA (macro) procedures.
                     );
//* Type of worksheet.
type TWorksheetType = (wtSheet,       //* Normal worksheet.
                       wtVBModule,    //* Visual Basic module.
                       wtExcel4Macro  //* Excel 4 macro sheet.
                       );

//* Specifies which actions that can be performed on a protected worksheet.
type TSheetProtection = (spEditObjects,          //* Edit objects
                         spEditScenarios,        //* Edit scenarios
                         spEditCellFormatting,   //* Change cell formattingm
                         spEditColumnFormatting, //* Change column formatting
                         spEditRowFormatting,    //* Change row formatting
                         spInsertColumns,        //* Insert columns
                         spInsertRows,           //* Insert rows
                         spInsertHyperlinks,     //* Insert hyperlinks
                         spDeleteColumns,        //* Delete columns
                         spDeleteRows,           //* Delete rows
                         spSelectLockedCells,    //* Select locked cells
                         spSortCellRange,        //* Sort cell range
                         spEditAutoFileters,     //* Edit auto fileters
                         spEditPivotTables,      //* Edit pivot tables
                         spSelectUnlockedCells   //* Select unlocked cell
                         );

type TSheetProtections = set of TSheetProtection;
//* Default worksheet protections.
const DefaultSheetProtections = [spEditObjects,spEditScenarios,spEditCellFormatting,
                         spEditColumnFormatting,spEditRowFormatting,spInsertColumns,
                         spInsertRows,spInsertHyperlinks,spDeleteColumns,spDeleteRows,
                         spSelectLockedCells,spSortCellRange,spEditAutoFileters,
                         spEditPivotTables,spSelectUnlockedCells];

type
//* Printing options.
     TPrintSetupOption = (psoLeftToRight,   //* psoLeftToRight = Print over, and then down.
                          psoPortrait,      //* psoPortrait = Portrait mode if set. Otherwise landscape mode.
                          psoNoColor,       //* psoNoColor = Print in black and white.
                          psoDraftQuality,  //* psoDraftQuality = Print draft quality.
                          psoNotes,         //* psoNotes = Print cell notes.
                          psoRowColHeading, //* psoRowColHeading = Print row and column headings.
                          psoGridlines,     //* psoGridlines = Print grid lines.
                          psoHorizCenter,   //* psoHorizCenter = Center sheet between horizontal margins.
                          psoVertCenter     //* psoVertCenter = Center sheet between vertical margins.
                          );
type TPrintSetupOptions = set of TPrintSetupOption;
type
//* Paper size.
  TPaperSize = (
  psNone,                  //* No paper size selected.
  psLetter,                //* Letter 8 12 x 11 in
  psLetterSmall,           //* Letter Small 8 12 x 11 in
  psTabloid,               //* Tabloid 11 x 17 in
  psLedger,                //* Ledger 17 x 11 in
  psLegal,                 //* Legal 8 12 x 14 in
  psStatement,             //* Statement 5 12 x 8 12 in
  psExecutive,             //* Executive 7 14 x 10 12 in
  psA3,                    //* A3 297 x 420 mm
  psA4,                    //* A4 210 x 297 mm
  psA4Small,               //* A4 Small 210 x 297 mm
  psA5,                    //* A5 148 x 210 mm
  psB4,                    //* B4 (JIS) 250 x 354
  psB5,                    //* B5 (JIS) 182 x 257 mm
  psFolio,                 //* Folio 8 12 x 13 in
  psQuarto,                //* Quarto 215 x 275 mm
  ps10X14,                 //* 10x14 in
  ps11X17,                 //* 11x17 in
  psNote,                  //* Note 8 12 x 11 in
  psEnv9,                  //* Envelope #9 3 78 x 8 78
  psEnv10,                 //* Envelope #10 4 18 x 9 12
  psEnv11,                 //* Envelope #11 4 12 x 10 38
  psEnv12,                 //* Envelope #12 4 \276 x 11
  psEnv14,                 //* Envelope #14 5 x 11 12
  psCSheet,                //* C size sheet
  psDSheet,                //* D size sheet
  psESheet,                //* E size sheet
  psEnvDL,                 //* Envelope DL 110 x 220mm
  psEnvC5,                 //* Envelope C5 162 x 229 mm
  psEnvC3,                 //* Envelope C3  324 x 458 mm
  psEnvC4,                 //* Envelope C4  229 x 324 mm
  psEnvC6,                 //* Envelope C6  114 x 162 mm
  psEnvC65,                //* Envelope C65 114 x 229 mm
  psEnvB4,                 //* Envelope B4  250 x 353 mm
  psEnvB5,                 //* Envelope B5  176 x 250 mm
  psEnvB6,                 //* Envelope B6  176 x 125 mm
  psEnvItaly,              //* Envelope 110 x 230 mm
  psEnvMonarch,            //* Envelope Monarch 3.875 x 7.5 in
  psEnvPersonal,           //* 6 34 Envelope 3 58 x 6 12 in
  psFanfoldUS,             //* US Std Fanfold 14 78 x 11 in
  psFanfoldStdGerman,      //* German Std Fanfold 8 12 x 12 in
  psFanfoldLglGerman,      //* German Legal Fanfold 8 12 x 13 in
  psISO_B4,                //* B4 (ISO) 250 x 353 mm
  psJapanesePostcard,      //* Japanese Postcard 100 x 148 mm
  ps9X11,                  //* 9 x 11 in
  ps10X11,                 //* 10 x 11 in
  ps15X11,                 //* 15 x 11 in
  psEnvInvite,             //* Envelope Invite 220 x 220 mm
  psReserved48,            //* RESERVED--DO NOT USE
  psReserved49,            //* RESERVED--DO NOT USE
  psLetterExtra,           //* Letter Extra 9 \275 x 12 in
  psLegalExtra,            //* Legal Extra 9 \275 x 15 in
  psTabloidExtra,          //* Tabloid Extra 11.69 x 18 in
  psA4Extra,               //* A4 Extra 9.27 x 12.69 in
  psLetterTransverse,      //* Letter Transverse 8 \275 x 11 in
  psA4Transverse,          //* A4 Transverse 210 x 297 mm
  psLetterExtraTransverse, //* Letter Extra Transverse 9\275 x 12 in
  psAPlus,                 //* SuperASuperAA4 227 x 356 mm
  psBPlus,                 //* SuperBSuperBA3 305 x 487 mm
  psLetterPlus,            //* Letter Plus 8.5 x 12.69 in
  psA4Plus,                //* A4 Plus 210 x 330 mm
  psA5Transverse,          //* A5 Transverse 148 x 210 mm
  psB5transverse,          //* B5 (JIS) Transverse 182 x 257 mm
  psA3Extra,               //* A3 Extra 322 x 445 mm
  psA5Extra,               //* A5 Extra 174 x 235 mm
  psB5Extra,               //* B5 (ISO) Extra 201 x 276 mm
  psA2,                    //* A2 420 x 594 mm
  psA3Transverse,          //* A3 Transverse 297 x 420 mm
  psA3ExtraTransverse      //* A3 Extra Transverse 322 x 445 mm
  );

type TSheet = class;

//* Defines a horizontal page break.
//* THorizPagebreak defines a horizontal pagebreak when printing the worksheet.
     THorizPagebreak = class(TCollectionItem)
private
     FRow: integer;
     FCol1,FCol2: integer;
public
     //* ~exclude
     constructor Create(Collection: TCollection); override;
     //* ~exclude
     procedure Assign(Source: TPersistent); override;
published
     //* Row for the horizontal pagebreak.
     //* Set Row to the row for the horizontal page break.
     property Row: integer read FRow write FRow;
     //* First column for the horizontal pagebreak.
     //* Set Col1 to the first column for the horizontal page break.
     property Col1: integer read FCol1 write FCol1;
     //* Last column for the horizontal pagebreak.
     //* Set Col2 to the Last column for the horizontal page break. If all
     //* columns shall be included, set it to 255.
     property Col2: integer read FCol2 write FCol2;
     end;

//* List of horizontal page breaks.
     THorizPagebreaks = class(TCollection)
private
     FOwner: TPersistent;
     function GetItem(Index: integer): THorizPagebreak;
protected
     function  GetOwner: TPersistent; override;
public
     //* ~exclude
     constructor Create(AOwner: TPersistent);
     //* Add a new THorizPagebreak object.
     //* ~result The new THorizPagebreak object.
     function  Add: THorizPagebreak;
     //* The THorizPagebreak objects in the list.
     property Items[Index: integer]: THorizPagebreak read GetItem; default;
     end;

//* Defines a vertical page break.
//* TVertPagebreak defines a vertical pagebreak when printing the worksheet.
     TVertPagebreak = class(TCollectionItem)
private
     FCol: integer;
     FRow1,FRow2: integer;
public
     //* ~exclude
     constructor Create(Collection: TCollection); override;
     //* ~exclude
     procedure Assign(Source: TPersistent); override;
published
     //* Column for vertical pagebreak.
     //* Set Col to the column for the vertical page break.
     property Col: integer read FCol write FCol;
     //* First row for vertical pagebreak.
     //* Set Row1 to the first row for the vertical page break.
     property Row1: integer read FRow1 write FRow1;
     //* Last row for vertical pagebreak.
     //* Set Row2 to the last row for the vertical page break. If all rows
     //* shall be included, set it to 65535.
     property Row2: integer read FRow2 write FRow2;
     end;

//* List of vertical page breaks.
     TVertPagebreaks = class(TCollection)
private
     FOwner: TPersistent;
     function GetItem(Index: integer): TVertPagebreak;
protected
     function  GetOwner: TPersistent; override;
public
     //* ~exclude
     constructor Create(AOwner: TPersistent);
     //* Add a new TVertPagebreak object.
     //* ~result The new TVertPagebreak object.
     function  Add: TVertPagebreak;
     //* The TVertPagebreak objects in the list.
     property Items[Index: integer]: TVertPagebreak read GetItem; default;
     end;

//* Options for printing the worksheet.
     TPrintSettings = class(TPersistent)
private
     FParent: TSheet;
     FHeader,FFooter: WideString;
     FMarginLeft,FMarginRight,FMarginTop,FMarginBottom: double;
     FHorizPagebreaks: THorizPagebreaks;
     FVertPagebreaks: TVertPagebreaks;

     function  GetOptions: TPrintSetupOptions;
     procedure SetOptions(const Value: TPrintSetupOptions);
     function  GetCopies: word;
     function  GetFooterMargin: double;
     function  GetHeaderMargin: double;
     function  GetPaperSize: TPaperSize;
     function  GetScalingFactor: word;
     function  GetStartingPage: word;
     procedure SetCopies(const Value: word);
     procedure SetFooterMargin(const Value: double);
     procedure SetHeaderMargin(const Value: double);
     procedure SetPaperSize(const Value: TPaperSize);
     procedure SetScalingFactor(const Value: word);
     procedure SetStartingPage(const Value: word);
     function  GetResolution: integer;
     procedure SetResolution(const Value: integer);
     function  GetMarginBottomCm: double;
     function  GetMarginLeftCm: double;
     function  GetMarginRightCm: double;
     function  GetMarginTopCm: double;
     procedure SetMarginBottomCm(const Value: double);
     procedure SetMarginLeftCm(const Value: double);
     procedure SetMarginRightCm(const Value: double);
     procedure SetMarginTopCm(const Value: double);
     function  GetFitHeight: integer;
     function  GetFitWidth: integer;
     procedure SetFitHeight(const Value: integer);
     procedure SetFitWidth(const Value: integer);
     function  GetFooterMarginCm: double;
     function  GetHeaderMarginCm: double;
     procedure SetFooterMarginCm(const Value: double);
     procedure SetHeaderMarginCm(const Value: double);
protected
     function  GetOwner: TPersistent; override;
public
     //* ~exclude
     constructor Create(Parent: TSheet);
     //* ~exclude
     destructor Destroy; override;
     //* ~exclude
     procedure Clear;
     //* ~exclude
     procedure Assign(Source: TPersistent); override;

     function PaperSizeDim: TPoint;
published
     //* Number of copies to print.
     property Copies: word read GetCopies write SetCopies;
     //* Footer text.
     //* In order to format text, the following codes can be used:
     //* &&=The "&" character.~[br]
     //* &L=Align left.~[br]
     //* &C=Align center.~[br]
     //* &R=Align right.~[br]
     //* &P=Page number.~[br]
     //* &N=Page count.~[br]
     //* &D=Current date.~[br]
     //* &T=Current time.~[br]
     //* &A=Sheet name.~[br]
     //* &F=Filename without path.~[br]
     //* &Z=Filepath without filename (Excel 2000 and later).~[br]
     //* &B=Bold on/off.~[br]
     //* &I=Italic on/off.~[br]
     //* &U=Underlining on/off.~[br]
     //* &E=Double underlining on/off.~[br]
     //* &S=Strikeout on/off.~[br]
     //* &X=Superscript on/off.~[br]
     //* &Y=Subscript on/off.~[br]
     //* &NN=Set font size to NN points.~[br]
     //* &"Fontname"=Set font to Fontname. It is also possible to set the font
     //* to bold weight, but this is localized, ie the word used for "Bold" must
     //* be in the same language as the windows version which is used! English
     //* example: &"Arial,Bold". Swedish example: &"Arial,Fet".
     property Footer: WideString read FFooter write FFooter;
     //* Footer margin in inches.
     property FooterMargin: double read GetFooterMargin write SetFooterMargin;
     //* Footer margin in centimeters.
     property FooterMarginCm: double read GetFooterMarginCm write SetFooterMarginCm;
     //* Header text.
     //* In order to format text, the following codes can be used:
     //* &&=The "&" character.~[br]
     //* &L=Align left.~[br]
     //* &C=Align center.~[br]
     //* &R=Align right.~[br]
     //* &P=Page number.~[br]
     //* &N=Page count.~[br]
     //* &D=Current date.~[br]
     //* &T=Current time.~[br]
     //* &A=Sheet name.~[br]
     //* &F=Filename without path.~[br]
     //* &Z=Filepath without filename (Excel 2000 and later).~[br]
     //* &B=Bold on/off.~[br]
     //* &I=Italic on/off.~[br]
     //* &U=Underlining on/off.~[br]
     //* &E=Double underlining on/off.~[br]
     //* &S=Strikeout on/off.~[br]
     //* &X=Superscript on/off.~[br]
     //* &Y=Subscript on/off.~[br]
     //* &NN=Set font size to NN points.~[br]
     //* &"Fontname"=Set font to Fontname. It is also possible to set the font
     //* to bold weight, but this is localized, ie the word used for "Bold" must
     //* be in the same language as the windows version which is used! English
     //* example: &"Arial,Bold". Swedish example: &"Arial,Fet".
     property Header: WideString read FHeader write FHeader;
     //* Header margin in inches.
     property HeaderMargin: double read GetHeaderMargin write SetHeaderMargin;
     //* Header margin in centimeters.
     property HeaderMarginCm: double read GetHeaderMarginCm write SetHeaderMarginCm;
     //* Bottom margin in inches.
     property MarginBottom: double read FMarginBottom write FMarginBottom;
     //* Left margin in inches.
     property MarginLeft: double read FMarginLeft write FMarginLeft;
     //* Rightmargin in inches.
     property MarginRight: double read FMarginRight write FMarginRight;
     //* Top margin in inches.
     property MarginTop: double read FMarginTop write FMarginTop;
     //* Bottom margin in centimeters.
     property MarginBottomCm: double read GetMarginBottomCm write SetMarginBottomCm;
     //* Left margin in centimeters.
     property MarginLeftCm: double read GetMarginLeftCm write SetMarginLeftCm;
     //* Right margin in centimeters.
     property MarginRightCm: double read GetMarginRightCm write SetMarginRightCm;
     //* Top margin in centimeters.
     property MarginTopCm: double read GetMarginTopCm write SetMarginTopCm;
     //* Options.
     property Options: TPrintSetupOptions read GetOptions write SetOptions;
     //* Paper size.
     //* PaperSize is taken from TXLSReadWriteII2.DefaultPaperSize, which in
     //* in turn is taken the paper size from the system settings.
     property PaperSize: TPaperSize read GetPaperSize write SetPaperSize;
     //* Scaling factor (zoom).
     //* The default scaling factor is 100%.
     property ScalingFactor: word read GetScalingFactor write SetScalingFactor;
     //* First page to print.
     property StartingPage: word read GetStartingPage write SetStartingPage;
{    Implemented in InternalNames.
     property RowsOnEachPage: WideString read GetRowsOnEachPage write SetRowsOnEachPage;
     property ColsOnEachPage: WideString read GetColsOnEachPage write SetColsOnEachPage;
}
     //* List of horizontal page breaks.
     property HorizPagebreaks: THorizPagebreaks read FHorizPagebreaks write FHorizPagebreaks;
     //* List of vertical page breaks.
     property VertPagebreaks: TVertPagebreaks read FVertPagebreaks write FVertPagebreaks;
     //* Printer resolution in dpi.
     property Resolution: integer read GetResolution write SetResolution;
     //* This is the excel Page Setop option Page/Scaling/Fit to: [x] page(s) wide by [x] pages tall. ~[br]
     //* In order to activate this option, ~[link TSheet.WorkspaceOptions] must have the value woFitToPage. ~[br]
     //* See also ~[link FitHeight]
     property FitWidth: integer read GetFitWidth write SetFitWidth;
     //* This is the excel Page Setop option Page/Scaling/Fit to: [x] page(s) wide by [x] pages tall. ~[br]
     //* In order to activate this option, ~[link TSheet.WorkspaceOptions] must have the value woFitToPage. ~[br]
     //* See also ~[link FitHeight]
     property FitHeight: integer read GetFitHeight write SetFitHeight;
     end;

//* Note used anymore, only keept for backward compatibility. Use ~[link TSheet.SelectedAreas]
     TSelection = class(TPersistent)
private
     FParent: TSheet;

     function GetActiveCol: integer;
     function GetActiveRow: integer;
     function GetCol1: integer;
     function GetCol2: integer;
     function GetRow1: integer;
     function GetRow2: integer;
     procedure SetActiveCol(const Value: integer);
     procedure SetActiveRow(const Value: integer);
     procedure SetCol1(const Value: integer);
     procedure SetCol2(const Value: integer);
     procedure SetRow1(const Value: integer);
     procedure SetRow2(const Value: integer);
public
     //* ~exclude
     constructor Create(Parent: TSheet);
     procedure Clear;
published
     property ActiveRow: integer read GetActiveRow write SetActiveRow;
     property ActiveCol: integer read GetActiveCol write SetActiveCol;
     property Row1: integer read GetRow1 write SetRow1;
     property Col1: integer read GetCol1 write SetCol1;
     property Row2: integer read GetRow2 write SetRow2;
     property Col2: integer read GetCol2 write SetCol2;
     end;

     //* ~exclude
     TSelectedAreaHit = (sahNo,sahInside,sahEdge,sahActiveCell);
     //* ~exclude
     TSelectedEdgeHit = (sehLeft,sehTop,sehRight,sehBottom);
     //* ~exclude
     TSelectedEdgeHits = set of TSelectedEdgeHit;

//* A selected area is an area that is a part of the current selection.
//* The current selection may contain a single cell (the cell with the cursor),
//* or multiple areas.
     TSelectedArea = class(TObject)
private
     FCol1,FRow1: integer;
     FCol2,FRow2: integer;
public
     //* Normalizes the selection, that is, checks that Col1 <= Col2 and Row1 <= Row2
     procedure Normalize;
     //* Tests if Col and Row is inside the area.
     //* ~param Col Column of the test cell.
     //* ~param Row Row of the test cell.
     //* ~result True if the cell is within the area.
     function  Hit(Col,Row: integer): boolean;
     //* ~exclude
     function  AsRect: TRecCellAreaI;
     //* Sets the dimension of the area.
     //* ~param C1 Left column.
     //* ~param R1 Top row.
     //* ~param C2 Right column.
     //* ~param R2 Bottom row.
     procedure SetArea(C1,R1,C2,R2: integer);
     //* Sets the current area to the intersection of the current area and C1,R1,C2,R2.
     //* ~param C1 Left column.
     //* ~param R1 Top row.
     //* ~param C2 Right column.
     //* ~param R2 Bottom row.
     procedure Intersect(C1,R1,C2,R2: integer);

     //* Left column.
     property Col1: integer read FCol1 write FCol1;
     //* Top row.
     property Row1: integer read FRow1 write FRow1;
     //* Right column.
     property Col2: integer read FCol2 write FCol2;
     //* Bottom row.
     property Row2: integer read FRow2 write FRow2;
     end;

//* List of selected areas. The first element in the list (index zero)
//* is created automatically and is always available.
     TSelectedAreas = class(TObjectList)
private
     FActiveCol,FActiveRow: integer;
     FActiveArea: integer;

     function GetItems(Index: integer): TSelectedArea;
public
     //* ~exclude
     constructor Create;
     //* ~exclude
     procedure Init(Col: integer = 0; Row: integer = 0); overload;
     //* ~exclude
     procedure Init(C1,R1,C2,R2,ActC,ActR: integer); overload;
     //* ~exclude
     procedure Move(Col,Row: integer);
     //* Adds a new area.
     //* ~result The new TSelectedArea object.
     function  Add: TSelectedArea; overload;
     //* Adds a new area and initiates it to C1,R1,C2,R2.
     //* ~param C1 Left column.
     //* ~param R1 Top row.
     //* ~param C2 Right column.
     //* ~param R2 Bottom row.
     //* ~result The new TSelectedArea object.
     function  Add(C1,R1,C2,R2: integer): TSelectedArea; overload;
     //* ~exclude
     function  CellInAreas(Col,Row: integer; var EdgeHit: TSelectedEdgeHits; var AreaHit: TSelectedAreaHit): integer;
     //* ~exclude
     function  CursorVisible: boolean;
     //* ~exclude
     function  First: TSelectedArea;
     //* ~exclude
     function  Last: TSelectedArea;

     //* ActiveCol is the column where the cursor is. See also ~[link ActiveRow]
     property ActiveCol: integer read FActiveCol write FActiveCol;
     //* ActiveRow is the row where the cursor is. See also ~[link ActiveCol]
     property ActiveRow: integer read FActiveRow write FActiveRow;
     //* Returns an index to the area where the cursor is in.
     property ActiveArea: integer read FActiveArea write FActiveArea;
     //* The areas in the list.
     property Items[Index: integer]: TSelectedArea read GetItems; default;
     end;

//* TPane stores settings for window panes.
     TPane = class(TPersistent)
private
     FPaneType: TPaneType;
     FSplitColX: integer;
     FSplitRowY: integer;
     FLeftCol: integer;
     FTopRow: integer;
     FActivePane: byte;
     FSelections: TBaseRecordStorage;

     procedure SetActivePane(const Value: byte);
public
     //* ~exclude
     constructor Create;
     //* ~exclude
     destructor Destroy; override;
     //* ~exclude
     procedure Clear;
     //* ~exclude
     property Selections: TBaseRecordStorage read FSelections;
     //* Which pane that is active, i.e the pane with the cursor.
     property ActivePane: byte read FActivePane write SetActivePane;
published
     //* Pane style.
     property PaneType: TPaneType read FPaneType write FPaneType;
     //* Vertical split.
     //* Split pane (PaneType = ptSplit): width of left pane in units of 1/20
     //* of a point.~[br]
     //* Frozen pane (PaneType = ptFrozen): Number of visible columns in left pane.~[br]
     //* If there not shall be a vertical split, set SplitColX to zero.
     property SplitColX: integer read FSplitColX write FSplitColX;
     //* Horizontal split.
     //* Split pane (PaneType = ptSplit): height of top pane in units of 1/20
     //* of a point.~[br]
     //* Frozen pane (PaneType = ptFrozen): Number of visible rows in top pane.
     //* If there not shall be a horizontal split, set SplitColY to zero.
     property SplitRowY: integer read FSplitRowY write FSplitRowY;
     //* First visible column in right pane.
     property LeftCol: integer read FLeftCol write FLeftCol;
     //* First visible row in bottom pane.
     property TopRow: integer read FTopRow write FTopRow;
     end;

     //* Options for the worksheet.
     TSheetOption = (soGridlines,      //* Show gridlines.
                     soRowColHeadings, //* Show row and column headings.
                     soProtected,      //* Worksheet is protected.
                     soR1C1Mode,       //* Show cells in R1C1 mode.
                     soIteration,
                     soShowFormulas,   //* Show formulas instead of formula result.
                     soFrozenPanes,    //* Worksheet has frozen panes.
                     soShowZeros      //* Show zero values.
                     );
     TSheetOptions = set of TSheetOption;

     TWorkspaceOption = (woShowAutoBreaks, //* Automatic page breaks are visible.
                         woApplyStyles,    //* Automatic styles are applied to an outline
                         woRowSumsBelow,   //* Summary rows appear below detail in an outline
                         woColSumsRight,   //* Summary columns appear to the right of detail in an outline
                         woFitToPage,      //* Page fit option is on.
                         woOutlineSymbols  //* Outline symbols are displayed.
                         );
     TWorkspaceOptions = set of TWorkspaceOption;

//* Base class for worksheets.
     TBasicSheet = class(TCollectionItem)
  private
    function GetIndex: integer;
protected
     FName: WideString;

     procedure SetName(Value: WideString);
     procedure SetNameNoCheck(Value: WideString);
     function  GetName: WideString;
  published
public
     //* ~exclude
     constructor Create(Collection: TCollection); override;
     //* ~exclude
     destructor Destroy; override;

     //* Index of the worksheet. 
     property Index: integer read GetIndex;
published
     //* The name of the worksheet.
     property Name: WideString read GetName write SetName;
     end;

     TSheets = class;

//* Normal worksheet.
     TSheet = class(TBasicSheet)
private
     FSheetIndex: integer;
     FCells: TCellValues;
     FRecords: TRecordStorageSheet;
     FHasDefaultRecords: boolean;

     FRecalcFormulas: boolean;
     FPrintSettings: TPrintSettings;
     FMergedCells: TMergedCells;
     FColumns: TXLSColumns;
     FValidations: TDataValidations;
     FRows: TXLSRows;
     FPane: TPane;
     FDrawingObjects: TDrawingObjects;
     FControlObjects: TControlObjects;
     FCharts: TDrwCharts;
     FEscherDrawing: TEscherDrawing;
     FApplyFormat: TApplyFormat;
     FHyperlinks: THyperlinks;
     FConditionalFormats: TConditionalFormats;
     FAutofilters: TAutofilters;
     FFormats: TCellFormats;
     FSelection: TSelection;
     FSelectedAreas: TSelectedAreas;
     FHidden: THiddenState;
     FSheetProtections: TSheetProtections;
     FCurrFindCol,FCurrFindRow,FCurrFindPos: integer;
     FWorksheetType: TWorksheetType;
     FRange: TXLSRange;
     FInvalidCellEvent: TCellEvent;
     FTabColor: TExcelColor;

     function  GetAsBoolFormulaValue(Col, Row: integer): boolean;
     function  GetAsNumFormulaValue(Col, Row: integer): double;
     function  GetAsStrFormulaValue(Col, Row: integer): WideString;
     procedure SetAsBoolFormulaValue(Col, Row: integer; const Value: boolean);
     procedure SetAsNumFormulaValue(Col, Row: integer; const Value: double);
     procedure SetAsStrFormulaValue(Col, Row: integer; const Value: WideString);
     procedure SetAsErrFormulaValue(Col, Row: integer;  const Value: TCellError);
     function  GetDefaultRowHeight: word;
     procedure SetDefaultRowHeight(const Value: word);
     function  GetWorkspaceOptions: TWorkspaceOptions;
     procedure SetWorkspaceOptions(const Value: TWorkspaceOptions);
     function  GetDefaultColWidth: word;
     procedure SetDefaultColWidth(const Value: word);
     function  GetFirstCol: word;
     function  GetFirstRow: word;
     function  GetLastCol: word;
     function  GetLastRow: word;
     procedure SetFirstCol(const Value: word);
     procedure SetFirstRow(const Value: word);
     procedure SetLastCol(const Value: word);
     procedure SetLastRow(const Value: word);
     function  GetOptions: TSheetOptions;
     function  GetZoom: word;
     function  GetZoomPreview: word;
     procedure SetOptions(const Value: TSheetOptions);
     procedure SetZoom(const Value: word);
     procedure SetZoomPreview(const Value: word);
     function  GetAsVariant(Col, Row: integer): Variant;
     procedure SetAsVariant(Col, Row: integer; const Value: Variant);
     function  GetAsFormulaValue(Col, Row: integer): TFormulaValue;
     procedure SetAsFormulaValue(Col, Row: integer; const Value: TFormulaValue);
     function  GetAsRichText(Col, Row: integer): string;
     procedure SetAsRichText(Col, Row: integer; const Value: string);
     function  GetAsBlankRef(ARef: WideString): boolean;
     function  GetAsBooleanRef(ARef: WideString): boolean;
     function  GetAsBoolFormulaValueRef(ARef: WideString): boolean;
     function  GetAsErrorRef(ARef: WideString): TCellError;
     function  GetAsFloatRef(ARef: WideString): double;
     function  GetAsFormulaRef(ARef: WideString): string;
     function  GetAsHTMLRef(ARef: WideString): string;
     function  GetAsIntegerRef(ARef: WideString): integer;
     function  GetAsNumFormulaValueRef(ARef: WideString): double;
     function  GetAsRichTextRef(ARef: WideString): string;
     function  GetAsStrFormulaValueRef(ARef: WideString): WideString;
     function  GetAsStringRef(ARef: WideString): WideString;
     function  GetAsVariantRef(ARef: WideString): Variant;
     function  GetFmtAsStringRef(ARef: WideString): WideString;
     procedure SetAsBlankRef(ARef: WideString; const Value: boolean);
     procedure SetAsBooleanRef(ARef: WideString; const Value: boolean);
     procedure SetAsBoolFormulaValueRef(ARef: WideString; const Value: boolean);
     procedure SetAsErrorRef(ARef: WideString; const Value: TCellError);
     procedure SetAsFloatRef(ARef: WideString; const Value: double);
     procedure SetAsFormulaRef(ARef: WideString; const Value: string);
     procedure SetAsIntegerRef(ARef: WideString; const Value: integer);
     procedure SetAsNumFormulaValueRef(ARef: WideString; const Value: double);
     procedure SetAsRichTextRef(ARef: WideString; const Value: string);
     procedure SetAsStrFormulaValueRef(ARef: WideString; const Value: WideString);
     procedure SetAsStringRef(ARef: WideString; const Value: WideString);
     procedure SetAsVariantRef(ARef: WideString; const Value: Variant);
     function  GetAsDateTime(Col, Row: integer): TDateTime;
     procedure SetAsDateTime(Col, Row: integer; const Value: TDateTime);
     function  GetAsDateTimeRef(ARef: WideString): TDateTime;
     procedure SetAsDateTimeRef(ARef: WideString; const Value: TDateTime);
     function  GetAsHyperlink(Col, Row: integer): WideString;
     procedure SetAsHyperlink(Col, Row: integer; const Value: WideString);
     function  GetLeftCol: integer;
     function  GetTopRow: integer;
     procedure SetLeftCol(const Value: integer);
     procedure SetTopRow(const Value: integer);
     function  GetIsDateTime(Col, Row: integer): boolean;
protected
     function  GetDisplayName: string; override;
     procedure WriteBuf(Stream: TXLSStream; RecId,Size: word; P: Pointer);
     procedure CheckFirstLast(ACol,ARow: integer);
     function  GetDefaultWriteFormat(Version: TExcelVersion; FormatIndex: integer): word;
     function  GetDefaultFormat(Col,Row: integer): word;

     function  GetCell(Col, Row: integer): TCell;
     function  GetAsBlank(Col, Row: integer): boolean;
     procedure SetAsBlank(Col, Row: integer; const Value: boolean);
     function  GetAsInteger(Col, Row: integer): integer;
     procedure SetAsInteger(Col, Row: integer; const Value: integer);
     function  GetAsBoolean(Col, Row: integer): boolean;
     function  GetAsError(Col, Row: integer): TCellError;
     procedure SetAsError(Col, Row: integer; Value: TCellError);
     function  GetAsFloat(Col, Row: integer): double;

     function  GetAsFormula(Col, Row: integer): string;

     function  GetAsString(Col, Row: integer): WideString;
     function  GetAsWideString(Col, Row: integer): WideString;
     function  GetFmtAsString(Col, Row: integer): WideString;
     function  GetAsHTML(Col, Row: integer): string;
     procedure SetAsBoolean(Col, Row: integer; const Value: boolean);
     procedure SetAsFloat(Col, Row: integer; const Value: double);

     procedure SetAsFormula(Col, Row: integer; const Value: string);
     procedure SetAsFormulaOOC(Col, Row: integer; const Value: string);

     procedure SetAsString(Col, Row: integer; const Value: WideString);
     procedure SetAsWideString(Col, Row: integer; const Value: WideString);
     function  GetCellType(Col, Row: integer): TCellType;
     function  EncodeFormula(F: string; CellType: TCellType; RC: integer; FormatIndex: word; IsOOC: boolean): TFormulaCell;
     function  GetCellAlignment(Cell: TCell): TCellHorizAlignment;
     function  MakeFormulaCell(CellType: TCellType; Data: PByteArray; DataSize,FmlaSize,RC,FI: integer): TFormulaCell;
     procedure ColFormatChange(Format: TCellFormat; Col: integer);
     procedure RowFormatChange(Format: TCellFormat; Row: integer);
     procedure InsertCellList(CellList: TList; RCSrc,RCDst: longword; DeltaCol,DeltaRow: integer);

     procedure OnEscherReadShape(Sender: TObject; Shape: TShape);
public
     //* ~exclude
     constructor Create(Collection: TCollection); override;
     //* ~exclude
     destructor Destroy; override;
     //* Clears (empties) the worksheet of all data.
     procedure ClearData;
     // **********************************************
     // *********** For internal use only. ***********
     // **********************************************
     //* ~exclude
     procedure ClearCells;
     //* ~exclude
     procedure ExecuteAutoFilter;

     //* ~exclude
     procedure IntWriteBlank         (Col,Row: integer; FormatIndex: word);
     //* ~exclude
     procedure IntWriteBoolean       (Col,Row: integer; FormatIndex: word; Value: boolean);
     //* ~exclude
     procedure IntWriteError         (Col,Row: integer; FormatIndex: word; Value: TCellError);
     //* ~exclude
     procedure IntWriteNumber        (Col,Row: integer; FormatIndex: word; Value: double);

     //* ~exclude
     procedure IntWriteSSTStringIndex(Col,Row: integer; FormatIndex: word; Value: integer);
     //* ~exclude
     procedure IntWriteSSTString     (Col,Row: integer; FormatIndex: word; Value: WideString);

     //* ~exclude
     procedure WriteRawNumFormula    (Col,Row: integer; FormatIndex: integer; Data: PByteArray; DataSize,FmlaSize: integer; Value: double);
     //* ~exclude
     procedure WriteRawStrFormula    (Col,Row: integer; FormatIndex: integer; Data: PByteArray; DataSize,FmlaSize: integer; Value: WideString);
     //* ~exclude
     procedure WriteRawBoolFormula   (Col,Row: integer; FormatIndex: integer; Data: PByteArray; DataSize,FmlaSize: integer; Value: boolean);
     //* ~exclude
     procedure WriteRawErrFormula    (Col,Row: integer; FormatIndex: integer; Data: PByteArray; DataSize,FmlaSize: integer; Value: byte);
     //* ~exclude
     procedure WriteRawArrayFormula  (Col,Row: integer; FormatIndex: integer; Data: PByteArray; DataSize,FmlaSize: integer; Value: double; Arr: PByteArray; ArrLen: integer; IsChild: boolean);

     //* ~exclude
     function FVRefToFV(FV: TFormulaValue): TFormulaValue;

     // Used by other formulas.
     //* ~exclude
     function  XCalculate(Col, Row: integer; NowCalc: TCellRefArray): TFormulaValue;

     //* ~exclude
     procedure StreamWriteCells      (Version: TExcelVersion; Stream: TXLSStream);
     //* ~exclude
     procedure StreamWriteMergedCells(Version: TExcelVersion; Stream: TXLSStream);
     //* ~exclude
     procedure NameIndexChanged(Delta: integer);
     //* ~exclude
     procedure AfterFileRead;

     //* ~exclude
     function StrListFromFmla(Fmla: TDynByteArray; List: TXLSWideStringList): integer;
     //* ~exclude
     function FloatListFromFmla(Fmla: TDynByteArray; var List: TDynDoubleArray): integer;

     //* ~exclude
     property  _Int_Cells: TCellValues read FCells;
     //* ~exclude
     property  _Int_Records: TRecordStorageSheet read FRecords;
     //* ~exclude
     property  _Int_EscherDrawing: TEscherDrawing read FEscherDrawing;
     //* ~exclude
     property _Int_HasDefaultRecords: boolean read FHasDefaultRecords write FHasDefaultRecords;
     //* ~exclude
     property _Int_SheetIndex: integer read FSheetIndex write FSheetIndex;
     //* ~exclude
     property _Int_OnCellInvalidate: TCellEvent read FInvalidCellEvent write FInvalidCellEvent;
     // **********************************************
     // *********** End internal use only. ***********
     // **********************************************
     //* Clears the worksheet of all cell data.
     procedure ClearWorksheet;
     //* Fills an area with random numbers, from 0 to Value - 1. Usefull for test purpose.
     //* ~param Ref The cell area as a string, like: A1:D9
     //* ~param Value Max random value - 1.
     procedure FillRandom(Ref: string; Value: integer);
     //* Sets column width automatically to fit the text in the cells.
     //* Use AutoWidthCol to calculate the column width automatically for column
     //* Col. The width is set to the max string width for text or numbers in
     //* the column.
     //* ~param Col The column to autowidth.
     //* ~result The new width of the column.
     function  AutoWidthCol(Col: longword): integer;
     //* Sets column width automatically to fit the text in the cells.
     //* Use AutoWidthCols to calculate the column width automatically for column
     //* Col1 to Col2. The width is set to the max string width for text or
     //* numbers in the columns.
     //* ~param Col1 Left column of the column span.
     //* ~param Col2 Right column of the column span.
     procedure AutoWidthCols(Col1,Col2: longword);
     //* Sets row height automatically to fit the text in the cells.
     //* Use AutoHeightRow to calculate the row height automatically for row
     //* Row. The height is set to the max string height for text or
     //* numbers in the row.
     //* ~param Row The row to autoheight.
     //* ~result The new height of the row.
     function  AutoHeightRow(Row: integer): integer;
     //* Sets row height automatically to fit the text in the cells.
     //* Use AutoHeightRows to calculate the row height automatically for row
     //* Row1 to Row2. The height is set to the max string height for text or
     //* numbers in the rows.
     //* ~param Row1 Top row of the row span.
     //* ~param Row2 Bottom of the row span.
     procedure AutoHeightRows(Row1,Row2: integer);
     //* Sets the column width and row height automatically to fit the text in the cell.
     //* Use AutoSizeCell to calculate the column width and row height automatically for
     //* the cell at Col, Row. The width and height is set to the string width and height
     //* for text or number in the cell.
     //* ~param Col Column of the cell.
     //* ~param Row row of the cell.
     //* ~param SizeCol True if the column width shall be autosized.
     //* ~param SizeRow True if the row height shall be autosized.
     procedure AutoSizeCell(Col,Row: integer; SizeCol,SizeRow: boolean);
     //* Calculate the dimensions of the worksheet.
     //* CalcDimensions will calculate the first and last, first and last column.
     procedure CalcDimensions;
     //* Calculate the dimensions of the worksheet.
     //* CalcDimensions will calculate the first and last, first and last column.
     //* Only cells with values are included. Cells with only formatting (blank)
     //* are excluded.
     procedure CalcDimensionsEx;
     //* Calculates a formula cell. ~[link CalculateEx].
     //* ~param Col Column of the cell.
     //* ~param Row row of the cell.
     //* ~result The result of the calculation as a variant.
     function  Calculate(Col, Row: integer): Variant;
     //* Calculates a formula cell. The result of the calculation is assigned
     //* to the cell.
     //* ~param Col Column of the cell.
     //* ~param Row row of the cell.
     //* ~param CalculateOptions calculation options.
     //* ~result The result of the calculation as a variant.
     function  CalculateEx(Col, Row: integer; CalculateOptions: TCalculateOptions): Variant;
     //* Calculates the entire sheet.
     procedure CalculateSheet;
     //* Sets the calculation state of the worksheet.
     //* ~param IsCalculated when True, all formulas on the sheet is marked as calculated, when False the formulas are marked as uncalced.
     procedure Calculated(IsCalculated: boolean);
     //* Deletes a cell.
     //* ~param Col Column of the cell.
     //* ~param Row row of the cell.
     procedure DeleteCell(Col, Row: integer);
     //* Deletes the cells in the area from Col1, Row1 to Col2, Row2.
     //* ~param Col1 Left column of the area.
     //* ~param Row1 Top row of the area.
     //* ~param Col2 Right column of the area.
     //* ~param Row2 Bottom row of the area.
     procedure DeleteCells(Col1, Row1, Col2, Row2: integer);
     //* Deleted the rows between Row1 and Row2. Rows under Row2 are shifted up in order to fill the gap.
     //* ~param Row1 Top row of the span.
     //* ~param Row2 Bottom row of the span.
     procedure DeleteRows(Row1,Row2: integer);
     //* Deleted the columns between Col1 and Col2. Columns to the right of Col2 are shifted left in order to fill the gap.
     //* ~param Col1 Left column of the span.
     //* ~param Col2 Right column of the span.
     procedure DeleteColumns(Col1,Col2: integer);
     //* Inserts Count rows starting at Row.
     //* ~param Row The insertion row.
     //* ~param RowCount Number of rows to insert.
     procedure InsertRows(Row,RowCount: integer);
     //* Inserts Count columns starting at Col.
     //* ~param Col The insertion column.
     //* ~param ColCount Number of columns to insert.
     procedure InsertColumns(Col,ColCount: integer);
     //* Assigns another worksheet to this worksheet.
     //* ~param Source The source worksheet.
     procedure Assign(Source: TPersistent); override;
     //* Paint the cell on a canvas.
     //* ~param Canvas The canvas to paint the cell on.
     //* ~param ARect A clipping rectangle on the canvas where the cell is painted.
     //* ~param ACol Column of the cell to paint.
     //* ~param ARow Row of the cell to paint.
     //* Use PaintCell to draw the contents of the cell at ACol and ARow on Canvas. ARect is a clipping rectangle, nothing is painted outside it.
     //* ~[br]
     //* ~[br]
     //* ~[b Example:]
     //* ~[br]
     //* ~[sample
     //* // This example shows how to handle the DrawCell event on a TDrawGrid object:
     //*
     //* procedure TForm1.DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
     //* begin
     //*  if (ACol > 0) and (ARow > 0) then
     //*    XLSReadWrite1.Sheets[0~[].PaintCell(DrawGrid1.Canvas,Rect,ACol - 1,ARow - 1);
     //*  end;
     //* ]
     procedure PaintCell(Canvas: TCanvas; ARect: TRect; ACol,ARow: integer);
     //* Checks if the worksheet is empty (of cells).
     //* ~result True if the worksheet don't have any cells.
     function  IsEmpty: boolean;
     //* Group rows.
     //* GroupRows will group the rows between Row1,Row2. Set Collapsed to
     //* True if the rows shall be collapsed. There can be max 7 group levels.
     //* ~param Row1 Top row of the span.
     //* ~param Row2 Bottom row of the span.
     //* ~param Collapsed True if the rows shall be collapsed.
     procedure GroupRows(Row1,Row2: integer; Collapsed: boolean = False);
     //* Group columns.
     //* GroupColumns will group the columns between Col1,Col2. Set Collapsed to
     //* True if the columns shall be collapsed. There can be max 7 group levels.
     //* ~param Col1 Left column of the span.
     //* ~param Col2 Right column of the span.
     //* ~param Collapsed True if the columns shall be collapsed.
     procedure GroupColumns(Col1, Col2: integer; Collapsed: boolean = False);
     //* Adds a chart to the workbook.
     //* ~result The new TDrwChart object.
     function  AddChart: TDrwChart;
     //* Reads a Rich Text (RTF) file into a cell. Set AllText to True if
     //* all text in the file shall be read. When False, only the body text
     //* is read.
     //* ~param Col Column of the destionation cell.
     //* ~param Row Row of the destination cell.
     //* ~param Filename The name of the disk file to read into the cell.
     //* ~param AllText Always True.
     procedure RichTextLoadFromFile(Col, Row: integer; Filename: WideString; AllText: boolean = True);
     //* Reads a Rich Text (RTF) stream into a cell. Set AllText to True if
     //* all text in the stream shall be read. When False, only the body text
     //* is read.
     //* ~param Col Column of the destionation cell.
     //* ~param Row Row of the destination cell.
     //* ~param Stream The name of the stream to read into the cell.
     //* ~param AllText Always True.
     procedure RichTextLoadFromStream(Col, Row: integer; Stream: TStream; AllText: boolean = True);
     //* Saves a cell value to a Rich Text (RTF) file.
     //* ~param Col Column of the source cell.
     //* ~param Row Row of the source cell.
     //* ~param Filename The name of the disk file to write the cell to.
     procedure RichTextSaveToFile(Col, Row: integer; Filename: WideString);
     //* Saves a cell value to a Rich Text (RTF) stream.
     //* ~param Col Column of the source cell.
     //* ~param Row Row of the source cell.
     //* ~param Stream The name of the stream to write the cell to.
     procedure RichTextSaveToStream(Col, Row: integer; Stream: TStream);
     //* Copies a cell value to a TRichEdit control.
     //* ~param Col Column of the source cell.
     //* ~param Row Row of the source cell.
     //* ~param RichEdit The TRichEdit control to write the cell to.
     procedure CopyToRichEdit(Col,Row: integer; var RichEdit: TRichEdit);

     //* Resets the position for FindText.
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
     //* for with FindText was found.
     //* ~param Col The cells column.
     //* ~param Row The cells row.
     //* ~param TextPos The position in the cells text the search text was found.
     //* ~param Text The text in the cell where the search string where found.
     procedure GetFindData(var Col,Row,TextPos: integer; var Text: WideString);
     //* Returns the cell value as a ~[link XLSUtils2.TFormulaValue].
     //* ~param Cell The cell that shall be converted to a ~[link XLSUtils2.TFormulaValue].
     //* ~result The cell as a TFormulaValue.
     function CellToFV(Cell: TCell): TFormulaValue;
     //* The first column of the worksheet with a cell value.
     property FirstCol: word read GetFirstCol write SetFirstCol;
     //* The last column of the worksheet with a cell value.
     property LastCol: word read GetLastCol write SetLastCol;
     //* The first row of the worksheet with a cell value.
     property FirstRow: word read GetFirstRow write SetFirstRow;
     //* The last row of the worksheet with a cell value.
     property LastRow: word read GetLastRow write SetLastRow;
     //* The first column in the upper left corner.
     property LeftCol: integer read GetLeftCol write SetLeftCol;
     //* The first row in the upper left corner.
     property TopRow: integer read GetTopRow write SetTopRow;
     //* Access a cell as a blank cell value.
     //* Use AsBlank to read or write the cell at Col and Row as a blank cell
     //* value. If there is no cell at the position, a blank cell will be
     //* inserted, when the property is written to. If there already is a cell
     //* there, it will be converted to a blank cell. If the previous cell was
     //* formatted, the formatting will be copied to the inserted cell.
     property AsBlank[Col,Row: integer]: boolean read GetAsBlank write SetAsBlank;
     //* Access a cell as a integer cell value.
     //* Use AsInteger to read or write the cell at Col and Row as a integer cell
     //* value. If there is no cell at the position, a integer cell will be
     //* inserted, when the property is written to. If there already is a cell
     //* there, it will be deleted, and a integer cell will be inserted. If the
     //* previous cell was formatted, the formatting will be copied to the
     //* inserted cell. When the property is read, the value of the cell will be
     //* returned. If there is no cell at the position, zero will be returned.
     property AsInteger[Col,Row: integer]: integer read GetAsInteger write SetAsInteger;
     //* Access a cell as a float cell value.
     //* Use AsFloat to read or write the cell at Col and Row as a float cell
     //* value. If there is no cell at the position, a float cell will be
     //* inserted, when the property is written to. If there already is a cell
     //* there, it will be deleted, and a float cell will be inserted. If the
     //* previous cell was formatted, the formatting will be copied to the
     //* inserted cell. When the property is read, the value of the cell will be
     //* returned. If there is no cell at the position, zero will be returned.
     property AsFloat[Col,Row: integer]: double read GetAsFloat write SetAsFloat;
     //* Get or set the value of a cell as a date and time value. When reading the
     //* cell, the cell type must be in a numeric format.
     //* When assigning a value to the cell, it is formatted to show date and time
     //* if the value contains both a integer and a fraction part. If the value
     //* only have a integere part, the cell is formatted to show a date value.
     //* If the value only have a fraction part, the cell is formatted to show
     //* a time value. Excel uses the same way to store date and time values
     //* as Delphi. For more info about this, see the Delphi TDateTime type.
     property AsDateTime[Col,Row: integer]: TDateTime read GetAsDateTime write SetAsDateTime;
     //* Access a cell as a wide string cell value.
     //* Use AsWideString to read or write the cell at Col and Row as a wide
     //* string cell value. If there is no cell at the position, a string cell
     //* will be inserted, when the property is written to. If there already is
     //* a cell there, it will be deleted, and an string cell will be inserted.
     //* If the previous cell was formatted, the formatting will be copied to
     //* the inserted cell. When the property is read, the value of the cell
     //* will be returned. If there is no cell at the position,
     //* an empty string will be returned.
     property AsString[Col,Row: integer]: WideString read GetAsString write SetAsString;
     //* For backward compatibility. Use ~[link AsString].
     property AsWideString[Col,Row: integer]: WideString read GetAsWideString write SetAsWideString;
     // A Rich Text document is always 7-bit ascii, and shall therefore not be
     // a WideString.

     //* Access a cell as a Rich Text value.
     //* Use AsRichText to read or write the cell at Col and Row as a Rich
     //* Text cell value. If there is no cell at the position, a string cell
     //* will be inserted, when the property is written to. If there already is
     //* a cell there, it will be deleted, and a string cell will be inserted.
     //* If the previous cell was formatted, the formatting will be copied to
     //* the inserted cell. When the property is read, the value of the cell
     //* will be returned.
     property AsRichText[Col,Row: integer]: string read GetAsRichText write SetAsRichText;
     //* Returns the cell value as a string. If the cell is formatted the
     //* string will be formatted according to that.
     //* Use AsFmtString to read the cell at Col and Row as a formatted
     //* string value. When the cell is formatted, formatting rules will be used.
     //* If there is no cell at the position, an empty string will be returned.
     property AsFmtString[Col,Row: integer]: WideString read GetFmtAsString;
     //* Acces the hyperlink value of a cell. Important! Hyperlink is not the
     //* Text shown in the cell, it's the address where the user is taken when
     //* the cell is clicked. To set the text of the cell, use AsString or any
     //* other property to set the cell value.
     //* What kind of of hyperlink address that is used is determined according
     //* to the following rules:~[br]
     //* URL (internet address) - If the text starts with any of the following
     //* strings: http://, https://, www., ftp://, mailto: ~[br]
     //* UNC (network address, such as \\server\path\file.txt) - If the text
     //* starts with a double backslash.~[br]
     //* Workbook - If the text can be parsed as a cell reference, such as:
     //* Sheet3!D8~[br]
     //* A local file - If none of the above matches the text, it is considered
     //* to be a local file.~[br]
     property AsHyperlink[Col,Row: integer]: WideString read GetAsHyperlink write SetAsHyperlink;
     //* Returns the content of a cell formatted as HTML text.
     property AsHTML[Col,Row: integer]: string read GetAsHTML;
     //* Access a cell as a boolean cell value.
     //* Use AsBoolean to read or write the cell at Col and Row as a boolean
     //* cell value. If there is no cell at the position, a boolean cell will
     //* be inserted, when the property is written to. If there already is a cell
     //* there, it will be deleted, and a boolean cell will be inserted.
     //* If the previous cell was formatted, the formatting will be copied to
     //* the inserted cell. When the property is read, the value of the cell
     //* will be returned. If there is no cell at the position, False will be
     //* returned.
     property AsBoolean[Col,Row: integer]: boolean read GetAsBoolean write SetAsBoolean;
     //* Access a cell as an error cell value.
     //* Use AsError to read or write the cell at Col and Row as an error cell
     //* value. If there is no cell at the position, an error cell will be
     //* inserted, when the property is written to. If there already is a cell
     //* there, it will be deleted, and an error cell will be inserted. If the
     //* previous cell was formatted, the formatting will be copied to the
     //* inserted cell. When the property is read, the value of the cell will be
     //* returned. If there is no cell at the position, zero will be returned.
     property AsError[Col,Row: integer]: TCellError read GetAsError write SetAsError;
     //* Access a cell as a formula cell value.
     //* Use AsFormula to read or write the cell at Col and Row as a formula
     //* cell value. If there is no cell at the position, a formula cell will be
     //* inserted, when the property is written to. If there already is a cell
     //* there, it will be deleted, and a formula cell will be inserted. If the
     //* previous cell was formatted, the formatting will be copied to the
     //* inserted cell. When the property is read, the value of the cell will be
     //* returned. If there is no cell at the position, an empty string will be
     //* returned. The value inserted into the cell must be a valid Excel formula.
     property AsFormula[Col,Row: integer]: string read GetAsFormula write SetAsFormula;
     //* Access a cell as a formula cell value.
     //* Writes a formula in the Open Office Calc style.
     property AsFormulaOOC[Col,Row: integer]: string write SetAsFormulaOOC;
     //* Access the value of a number formula cell.
     //* Use AsNumFormulaValue to read or write the value of a numeric formula
     //* cell at Col and Row. If the cell not is a number formula cell, or there
     //* is no cell at the position, an exception will be raised. To read or
     //* write the formula, use AsFormula
     property AsNumFormulaValue[Col,Row: integer]: double read GetAsNumFormulaValue write SetAsNumFormulaValue;
     //* Access the value of a string formula cell.
     //* Use AsStrFormulaValue to read or write the value of a string formula
     //* cell at Col and Row. If the cell not is a string formula cell, or there
     //* is no cell at the position, an exception will be raised. To read or
     //* write the formula, use AsFormula
     property AsStrFormulaValue[Col,Row: integer]: WideString read GetAsStrFormulaValue write SetAsStrFormulaValue;
     //* Access the value of a boolean formula cell.
     //* Use AsBoolFormulaValue to read or write the value of a boolean formula
     //* cell at Col and Row. If the cell not is a boolean formula cell, or there
     //* is no cell at the position, an exception will be raised. To read or
     //* write the formula, use AsFormula
     property AsBoolFormulaValue[Col,Row: integer]: boolean read GetAsBoolFormulaValue write SetAsBoolFormulaValue;
     //* Access a cell as a variant value.
     //* Use AsVariant to read or write the cell at Col and Row as a variant
     //* value. If there is no cell at the position, a cell will be inserted,
     //* according to the type of variant, when the property is written to.
     //* If there already is a cell
     //* there, it will be deleted. If the
     //* previous cell was formatted, the formatting will be copied to the
     //* inserted cell. When the property is read, the value of the cell will be
     //* returned. If there is no cell at the position, zero will be returned.
     property AsVariant[Col,Row: integer]: Variant read GetAsVariant write SetAsVariant;
     //* Access a cell as a ~[link XLSUtils2.TFormulaValue] value.
     //* Use AsFormula to read or write the cell at Col and Row as a TFormulaValue
     //* cell value. If there is no cell at the position, a formula cell will be
     //* inserted, when the property is written to. If there already is a cell
     //* there, it will be deleted, and a formula cell will be inserted. If the
     //* previous cell was formatted, the formatting will be copied to the
     //* inserted cell. When the property is read, the value of the cell will be
     //* returned. If there is no cell at the position, an empty string will be
     //* returned. The value inserted into the cell must be a valid Excel formula.
     property AsFormulaValue[Col,Row: integer]: TFormulaValue read GetAsFormulaValue write SetAsFormulaValue;
     //* Returnes True if the cell is formatted as a date or time value.
     property IsDateTime[Col,Row: integer]: boolean read GetIsDateTime;
     //* Access a cell as a blank cell value.
     //* Use AsBlank to read or write the cell at Col and Row as a blank cell
     //* value. If there is no cell at the position, a blank cell will be
     //* inserted, when the property is written to. If there already is a cell
     //* there, it will be converted to a blank cell. If the previous cell was
     //* formatted, the formatting will be copied to the inserted cell.
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsBlankRef[ARef: WideString]: boolean read GetAsBlankRef write SetAsBlankRef;
     //* Access a cell as a float cell value.
     //* Use AsFloat to read or write the cell at Col and Row as a float cell
     //* value. If there is no cell at the position, a float cell will be
     //* inserted, when the property is written to. If there already is a cell
     //* there, it will be deleted, and a float cell will be inserted. If the
     //* previous cell was formatted, the formatting will be copied to the
     //* inserted cell. When the property is read, the value of the cell will be
     //* returned. If there is no cell at the position, zero will be returned.
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsIntegerRef[ARef: WideString]: integer read GetAsIntegerRef write SetAsIntegerRef;
     //* Get or set the value of a cell as a date and time value. When reading the
     //* cell, the cell type must be in a numeric format.
     //* When assigning a value to the cell, it is formatted to show date and time
     //* if the value contains both a integer and a fraction part. If the value
     //* only have a integere part, the cell is formatted to show a date value.
     //* If the value only have a fraction part, the cell is formatted to show
     //* a time value. Excel uses the same way to store date and time values
     //* as Delphi. For more info about this, see the Delphi TDateTime type.
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsFloatRef[ARef: WideString]: double read GetAsFloatRef write SetAsFloatRef;
     //* Get or set the value of a cell as a date and time value. When reading the
     //* cell, the cell type must be in a numeric format.
     //* When assigning a value to the cell, it is formatted to show date and time
     //* if the value contains both a integer and a fraction part. If the value
     //* only have a integere part, the cell is formatted to show a date value.
     //* If the value only have a fraction part, the cell is formatted to show
     //* a time value. Excel uses the same way to store date and time values
     //* as Delphi. For more info about this, see the Delphi TDateTime type.
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsDateTimeRef[ARef: WideString]: TDateTime read GetAsDateTimeRef write SetAsDateTimeRef;
     //* Access a cell as a wide string cell value.
     //* Use AsWideString to read or write the cell at Col and Row as a wide
     //* string cell value. If there is no cell at the position, a string cell
     //* will be inserted, when the property is written to. If there already is
     //* a cell there, it will be deleted, and an string cell will be inserted.
     //* If the previous cell was formatted, the formatting will be copied to
     //* the inserted cell. When the property is read, the value of the cell
     //* will be returned. If there is no cell at the position,
     //* an empty string will be returned.
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsStringRef[ARef: WideString]: WideString read GetAsStringRef write SetAsStringRef;
     //* Returns the cell value as a string. If the cell is formatted the
     //* string will be formatted according to that.
     //* Use AsFmtString to read or write the cell at Col and Row as a formatted
     //* string value. When the cell is formatted, formatting rules will be used.
     //* If there is no cell at the position, an empty string will be returned.
     property AsRichTextRef[ARef: WideString]: string read GetAsRichTextRef write SetAsRichTextRef;
     //* Returns the cell value as a string. If the cell is formatted the
     //* string will be formatted according to that.
     //* Use AsFmtString to read or write the cell at Col and Row as a formatted
     //* string value. When the cell is formatted, formatting rules will be used.
     //* If there is no cell at the position, an empty string will be returned.
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsFmtStringRef[ARef: WideString]: WideString read GetFmtAsStringRef;
     //* Returns the content of a cell formatted as HTML text.
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsHTMLRef[ARef: WideString]: string read GetAsHTMLRef;
     //* Access a cell as a boolean cell value.
     //* Use AsBoolean to read or write the cell at Col and Row as a boolean
     //* cell value. If there is no cell at the position, a boolean cell will
     //* be inserted, when the property is written to. If there already is a cell
     //* there, it will be deleted, and a boolean cell will be inserted.
     //* If the previous cell was formatted, the formatting will be copied to
     //* the inserted cell. When the property is read, the value of the cell
     //* will be returned. If there is no cell at the position, False will be
     //* returned.
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsBooleanRef[ARef: WideString]: boolean read GetAsBooleanRef write SetAsBooleanRef;
     //* Access a cell as an error cell value.
     //* Use AsError to read or write the cell at Col and Row as an error cell
     //* value. If there is no cell at the position, an error cell will be
     //* inserted, when the property is written to. If there already is a cell
     //* there, it will be deleted, and an error cell will be inserted. If the
     //* previous cell was formatted, the formatting will be copied to the
     //* inserted cell. When the property is read, the value of the cell will be
     //* returned. If there is no cell at the position, zero will be returned.
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsErrorRef[ARef: WideString]: TCellError read GetAsErrorRef write SetAsErrorRef;
     //* Access a cell as a formula cell value.
     //* Use AsFormula to read or write the cell at Col and Row as a formula
     //* cell value. If there is no cell at the position, a formula cell will be
     //* inserted, when the property is written to. If there already is a cell
     //* there, it will be deleted, and a formula cell will be inserted. If the
     //* previous cell was formatted, the formatting will be copied to the
     //* inserted cell. When the property is read, the value of the cell will be
     //* returned. If there is no cell at the position, an empty string will be
     //* returned. The value inserted into the cell must be a valid Excel formula.
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsFormulaRef[ARef: WideString]: string read GetAsFormulaRef write SetAsFormulaRef;
     //* Access the value of a number formula cell.
     //* Use AsNumFormulaValue to read or write the value of a numeric formula
     //* cell at Col and Row. If the cell not is a number formula cell, or there
     //* is no cell at the position, an exception will be raised. To read or
     //* write the formula, use AsFormula
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsNumFormulaValueRef[ARef: WideString]: double read GetAsNumFormulaValueRef write SetAsNumFormulaValueRef;
     //* Access the value of a string formula cell.
     //* Use AsStrFormulaValue to read or write the value of a string formula
     //* cell at Col and Row. If the cell not is a string formula cell, or there
     //* is no cell at the position, an exception will be raised. To read or
     //* write the formula, use AsFormula
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsStrFormulaValueRef[ARef: WideString]: WideString read GetAsStrFormulaValueRef write SetAsStrFormulaValueRef;
     //* Access the value of a boolean formula cell.
     //* Use AsBoolFormulaValue to read or write the value of a boolean formula
     //* cell at Col and Row. If the cell not is a boolean formula cell, or there
     //* is no cell at the position, an exception will be raised. To read or
     //* write the formula, use AsFormula
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsBoolFormulaValueRef[ARef: WideString]: boolean read GetAsBoolFormulaValueRef write SetAsBoolFormulaValueRef;
     //* Access a cell as a variant value.
     //* Use AsVariant to read or write the cell at Col and Row as a variant
     //* value. If there is no cell at the position, a cell will be inserted,
     //* according to the type of variant, when the property is written to.
     //* If there already is a cell
     //* there, it will be deleted. If the
     //* previous cell was formatted, the formatting will be copied to the
     //* inserted cell. When the property is read, the value of the cell will be
     //* returned. If there is no cell at the position, zero will be returned.
     //* ~[br]
     //* ARef is the reference to the cell string ColRow format, as 'A1'.
     property AsVariantRef[ARef: WideString]: Variant read GetAsVariantRef write SetAsVariantRef;

     //* Reads the cell as a TCell object.
     //* Use Cell to read the cell at Col and Row as a TCell object. You may
     //* use the Cell property in order apply formatting to the cell.
     //* If there are no cell at the location, Nil is returned.
     property Cell[Col,Row: integer]: TCell read GetCell;
     //* Use CellType to read the cell type of the cell at Col and Row.
     property CellType[Col,Row: integer]: TCellType read GetCellType;
     //* List of rows in the worksheet.
     property Rows: TXLSRows read FRows;
     //* List of columns in the worksheet.
     property Columns: TXLSColumns read FColumns write FColumns;
     //* For backward compatibility. Use ~[link SelectedAreas] instead.
     property Selection: TSelection read FSelection;
     //* List of selected areas.
     property SelectedAreas: TSelectedAreas read FSelectedAreas;
     //* List of charts in the worksheet.
     property Charts: TDrwCharts read FCharts write FCharts;
     //* For backward compatibility. Use ~[link Range] instead.
     property ApplyFormat: TApplyFormat read FApplyFormat;
     //* Type of the worksheet. The normal is wtSheet. When files are read,
     //* the type can be also be wtVBModule,wtExcel4Macro. Do not make any
     //* changes to these sheets.
     property WorksheetType: TWorksheetType read FWorksheetType;
//     property Count: integer read FCellCount;
     //* Autofilters on the worksheet.
     property Autofilters: TAutofilters read FAutofilters write FAutofilters;
     //* Use the Range property to formattaing and other operations on a range of cells.
     property Range: TXLSRange read FRange;
     //* Color of the workseet's tab. 
     property TabColor: TExcelColor read FTabColor write FTabColor;
published
     //* Default column width.
     //* The width is in units of 1/256s of a character width.
     property DefaultColWidth: word read GetDefaultColWidth write SetDefaultColWidth;
     //* Default row height.
     //* Default row height measured in 1/20th of a character point, based on
     //* the selected font for the worksheet.
     property DefaultRowHeight: word read GetDefaultRowHeight write SetDefaultRowHeight;
     //* Options when printing a worksheet.
     property PrintSettings: TPrintSettings read FPrintSettings write FPrintSettings;
     //* List of merged cells.
     property MergedCells: TMergedCells read FMergedCells write FMergedCells;
     //* Worksheet options.
     property Options: TSheetOptions read GetOptions write SetOptions;
     //* Workspace options.
     property WorkspaceOptions: TWorkspaceOptions read GetWorkspaceOptions write SetWorkspaceOptions;
     //* Protection for the worksheet.
     property SheetProtection: TSheetProtections read FSheetProtections write FSheetProtections;
     //* Zoom magnification.
     property Zoom: word read GetZoom write SetZoom;
     //* Zoom magnification in page break preview.
     property ZoomPreview: word read GetZoomPreview write SetZoomPreview;
     //* If formulas shall be recalced when the file is opened by Excel.
     //* Set this property to true if formulas shall be marked for recalculation.
     //* As TXLSReadWriteII2 don't calculate formulas, this is advised. Default is True.
     property RecalcFormulas: boolean read FRecalcFormulas write FRecalcFormulas;
     //* True if the worksheet is hidden.
     property Hidden: THiddenState read FHidden write FHidden;
     //* List with data validations.
     property Validations: TDataValidations read FValidations write FValidations;
     //* List with drawing objects.
     property DrawingObjects: TDrawingObjects read FDrawingObjects write FDrawingObjects;
     //* List with control objects.
     property ControlsObjects: TControlObjects read FControlObjects write FControlObjects;
     //* Pane settings for the worksheet.
     property Pane: TPane read FPane;
     //* List with hyperlinks.
     property Hyperlinks: THyperlinks read FHyperlinks write FHyperlinks;
     //* List with conditional formats.
     property ConditionalFormats: TConditionalFormats read FConditionalFormats write FConditionalFormats;
     end;

//* List with TSheet objects.
     TSheets = class(TCollection)
private
     FFormulaHandler: TFormulaHandler;

     function  GetSheet(Index: integer): TSheet;
protected
     FOwner: TPersistent;

     function  GetOwner: TPersistent; override;
     procedure SetBufSize(Value: integer);
     function  GetBufSize: integer;
public
     //* ~exclude
     constructor Create(AOwner: TPersistent; FormulaHandler: TFormulaHandler);
     //* ~exclude
     destructor Destroy; override;
     //* Inserts a new TSheet at position Index.
     //* ~param Index The position to insert the sheet.
     //* ~result The new TSheet object.
     function Insert(Index: Integer): TSheet;
     //* Delete the sheet at Index.
     //* ~param Index Index of the sheet to be deleted.
     procedure Delete(Index: integer);
     //* Deletes all sheets.
     //* When deleting all sheets, a new, empty sheet is added automatically,
     //* as there has to be at least one sheet.
     procedure Clear;
     //* Add a new sheet.
     //* ~param WorksheetType Is always wtSheet.
     //* ~result The new TSheet object.
     function  Add(WorksheetType: TWorksheetType = wtSheet): TSheet;
     //* Searches for a worksheet by it's name.
     //* ~param Name The name of the worksheet.
     //* ~result The TSheet object. If not found, Nil is returned.
     function  SheetByName(Name: WideString): TSheet;
     // **********************************************
     // *********** For internal use only. ***********
     // **********************************************
     //* ~exclude
     procedure WriteSST(Stream: TXLSStream);
     //* ~exclude
     procedure ReadSST(Stream: TXLSStream; RecSize: word);
     //* ~exclude
     procedure ClearAll;
     //* ~exclude
     property MaxBufSize: integer read GetBufSize write SetBufSize;
     property FormulaHandler: TFormulaHandler read FFormulaHandler;
     //* ~exclude
//     property  SST: TSST2 read FSST;
     // **********************************************
     // *********** End internal use only. ***********
     // **********************************************

     //* The sheets in the list.
     property  Items[Index: integer]: TSheet read GetSheet; default;
{$ifdef OLD_COMPILER}
     property Owner: TPersistent read FOwner;
{$endif}
     end;

implementation

uses XLSReadWriteII2,  CalculateFormula2;

{ TPrintSettings }

constructor TPrintSettings.Create(Parent: TSheet);
begin
  FParent := Parent;
  FHorizPagebreaks := THorizPagebreaks.Create(Self);
  FVertPagebreaks := TVertPagebreaks.Create(Self);
  Clear;
end;

procedure TPrintSettings.Assign(Source: TPersistent);
begin
  if not (Source is TPrintSettings) then
    raise Exception.Create('Object is not TPrintSettings');
  FHeader := TPrintSettings(Source).FHeader;
  FFooter := TPrintSettings(Source).FFooter;
  FMarginLeft := TPrintSettings(Source).FMarginLeft;
  FMarginRight := TPrintSettings(Source).FMarginRight;
  FMarginTop := TPrintSettings(Source).FMarginTop;
  FMarginBottom := TPrintSettings(Source).FMarginBottom;
  FHorizPagebreaks.Assign(TPrintSettings(Source).FHorizPagebreaks);
  FVertPagebreaks.Assign(TPrintSettings(Source).FVertPagebreaks);
end;

procedure TPrintSettings.Clear;
begin
  StartingPage := 1;
  Options := [psoPortrait];
  MarginLeft := 0.75;
  MarginRight := 0.75;
  MarginTop := 1;
  MarginBottom := 1;
  FHorizPagebreaks.Clear;
  FVertPagebreaks.Clear;
end;

destructor TPrintSettings.Destroy;
begin
  FHorizPagebreaks.Free;
  FVertPagebreaks.Free;
  inherited;
end;

function TPrintSettings.GetOwner: TPersistent;
begin
  Result := FParent;
end;
// psoLeftToRight,psoPortrait,psoNoColor,psoDraftQuality,psoNotes,,,,
function TPrintSettings.GetOptions: TPrintSetupOptions;
begin
  Result := [];
  if FParent._Int_Records.PRINTHEADERS then
    Result := Result + [psoRowColHeading];
  if FParent._Int_Records.PRINTGRIDLINES then
    Result := Result + [psoGridlines];
  if FParent._Int_Records.HCENTER then
    Result := Result + [psoHorizCenter];
  if FParent._Int_Records.VCENTER then
    Result := Result + [psoVertCenter];

  if (FParent._Int_Records.SETUP.Options and $0001) = $0001 then
    Result := Result + [psoLeftToRight];
  if (FParent._Int_Records.SETUP.Options and $0002) = $0002 then
    Result := Result + [psoPortrait];
  if (FParent._Int_Records.SETUP.Options and $0008) = $0008 then
    Result := Result + [psoNoColor];
  if (FParent._Int_Records.SETUP.Options and $0010) = $0010 then
    Result := Result + [psoDraftQuality];
  if (FParent._Int_Records.SETUP.Options and $0020) = $0020 then
    Result := Result + [psoNotes];
end;

procedure TPrintSettings.SetOptions(const Value: TPrintSetupOptions);
begin
  FParent._Int_Records.PRINTHEADERS   := psoRowColHeading in Value;
  FParent._Int_Records.PRINTGRIDLINES := psoGridlines in Value;
  FParent._Int_Records.HCENTER        := psoHorizCenter in Value;
  FParent._Int_Records.VCENTER        := psoVertCenter in Value;

  FParent._Int_Records.SETUP.Options  := $0000;
  if psoLeftToRight in Value then
    FParent._Int_Records.SETUP.Options := FParent._Int_Records.SETUP.Options + $0001;
  if psoPortrait in Value then
    FParent._Int_Records.SETUP.Options := FParent._Int_Records.SETUP.Options + $0002;
  if psoNoColor in Value then
    FParent._Int_Records.SETUP.Options := FParent._Int_Records.SETUP.Options + $0008;
  if psoDraftQuality in Value then
    FParent._Int_Records.SETUP.Options := FParent._Int_Records.SETUP.Options + $0010;
  if psoNotes in Value then
    FParent._Int_Records.SETUP.Options := FParent._Int_Records.SETUP.Options + $0020;
end;

function TPrintSettings.GetCopies: word;
begin
  Result := FParent._Int_Records.SETUP.Copies;
end;

function TPrintSettings.GetFitHeight: integer;
begin
  Result := FParent._Int_Records.SETUP.FitHeight;
end;

function TPrintSettings.GetFitWidth: integer;
begin
  Result := FParent._Int_Records.SETUP.FitWidth;
end;

function TPrintSettings.GetFooterMargin: double;
begin
  Result := FParent._Int_Records.SETUP.FooterMargin;
end;

function TPrintSettings.GetFooterMarginCm: double;
begin
  Result := FParent._Int_Records.SETUP.FooterMargin * 2.54;
end;

function TPrintSettings.GetHeaderMargin: double;
begin
  Result := FParent._Int_Records.SETUP.HeaderMargin;
end;

function TPrintSettings.GetHeaderMarginCm: double;
begin
  Result := FParent._Int_Records.SETUP.HeaderMargin * 2.54;
end;

function TPrintSettings.GetPaperSize: TPaperSize;
begin
  Result := TPaperSize(FParent._Int_Records.SETUP.PaperSize);
end;

function TPrintSettings.GetScalingFactor: word;
begin
  Result := FParent._Int_Records.SETUP.Scale;
end;

function TPrintSettings.GetStartingPage: word;
begin
  Result := FParent._Int_Records.SETUP.PageStart;
end;

function TPrintSettings.PaperSizeDim: TPoint;
begin
  case GetPaperSize of
    psNone:        begin Result.X := 0; Result.Y := 0; end;
    psLetter:      begin Result.X := 216; Result.Y := 279; end;
    psLetterSmall: begin Result.X := 216; Result.Y := 279; end;
    psTabloid:     begin Result.X := 279; Result.Y := 432; end;
    psLedger:      begin Result.X := 279; Result.Y := 432; end;
    psLegal:       begin Result.X := 216; Result.Y := 356; end;
    psStatement:   begin Result.X := 140; Result.Y := 216; end;
    psExecutive:   begin Result.X := 184; Result.Y := 267; end;
    psA3:          begin Result.X := 297; Result.Y := 420; end;
    psA4:          begin Result.X := 210; Result.Y := 297; end;
    psA4Small:     begin Result.X := 210; Result.Y := 297; end;
    psA5:          begin Result.X := 148; Result.Y := 210; end;
    psB4:          begin Result.X := 250; Result.Y := 354; end;
    psB5:          begin Result.X := 182; Result.Y := 257; end;
//    psFolio,                 //* Folio 8 12 x 13 in
    psQuarto:      begin Result.X := 215; Result.Y := 275; end;
//    ps10X14,                 //* 10x14 in
//    ps11X17,                 //* 11x17 in
//    psNote,                  //* Note 8.12 x 11 in
//    psEnv9,                  //* Envelope #9 3.78 x 8.78
//    psEnv10,                 //* Envelope #10 4.18 x 9.12
//    psEnv11,                 //* Envelope #11 4.12 x 10.38
//    psEnv12,                 //* Envelope #12 4 \276 x 11
//    psEnv14,                 //* Envelope #14 5 x 11.12
//    psCSheet,                //* C size sheet
//    psDSheet,                //* D size sheet
//    psESheet,                //* E size sheet
    psEnvDL:       begin Result.X := 110; Result.Y := 220; end;
    psEnvC5:       begin Result.X := 162; Result.Y := 229; end;
    psEnvC3:       begin Result.X := 324; Result.Y := 458; end;
    psEnvC4:       begin Result.X := 229; Result.Y := 324; end;
    psEnvC6:       begin Result.X := 114; Result.Y := 162; end;
    psEnvC65:      begin Result.X := 114; Result.Y := 229; end;
    psEnvB4:       begin Result.X := 250; Result.Y := 353; end;
    psEnvB5:       begin Result.X := 176; Result.Y := 250; end;
    psEnvB6:       begin Result.X := 176; Result.Y := 125; end;
    psEnvItaly:    begin Result.X := 110; Result.Y := 230; end;
//    psEnvMonarch,            //* Envelope Monarch 3.875 x 7.5 in
//    psEnvPersonal,           //* 6 34 Envelope 3 58 x 6 12 in
//    psFanfoldUS,             //* US Std Fanfold 14 78 x 11 in
//    psFanfoldStdGerman,      //* German Std Fanfold 8 12 x 12 in
//    psFanfoldLglGerman,      //* German Legal Fanfold 8 12 x 13 in
    psISO_B4:      begin Result.X := 250; Result.Y := 353; end;
    psJapanesePostcard: begin Result.X := 100; Result.Y := 148; end;
//    ps9X11,                  //* 9 x 11 in
//    ps10X11,                 //* 10 x 11 in
//    ps15X11,                 //* 15 x 11 in
    psEnvInvite:   begin Result.X := 220; Result.Y := 220; end;
//    psReserved48,            //* RESERVED--DO NOT USE
//    psReserved49,            //* RESERVED--DO NOT USE
//    psLetterExtra,           //* Letter Extra 9 \275 x 12 in
//    psLegalExtra,            //* Legal Extra 9 \275 x 15 in
//    psTabloidExtra,          //* Tabloid Extra 11.69 x 18 in
//    psA4Extra,               //* A4 Extra 9.27 x 12.69 in
//    psLetterTransverse,      //* Letter Transverse 8 \275 x 11 in
    psA4Transverse: begin Result.X := 210; Result.Y := 297; end;
//    psLetterExtraTransverse, //* Letter Extra Transverse 9\275 x 12 in
    psAPlus:        begin Result.X := 227; Result.Y := 356; end;
    psBPlus:        begin Result.X := 305; Result.Y := 487; end;
//    psLetterPlus,            //* Letter Plus 8.5 x 12.69 in
    psA4Plus:       begin Result.X := 210; Result.Y := 330; end;
    psA5Transverse: begin Result.X := 148; Result.Y := 210; end;
    psB5transverse: begin Result.X := 182; Result.Y := 257; end;
    psA3Extra:      begin Result.X := 322; Result.Y := 445; end;
    psA5Extra:      begin Result.X := 174; Result.Y := 235; end;
    psB5Extra:      begin Result.X := 201; Result.Y := 276; end;
    psA2:           begin Result.X := 420; Result.Y := 594; end;
    psA3Transverse: begin Result.X := 297; Result.Y := 420; end;
    psA3ExtraTransverse: begin Result.X := 322; Result.Y := 445; end;
  end;
end;

procedure TPrintSettings.SetCopies(const Value: word);
begin
  FParent._Int_Records.SETUP.Copies := Value;
end;

procedure TPrintSettings.SetFitHeight(const Value: integer);
begin
  if (Value < 0) or (Value > $FFFF) then
    FParent._Int_Records.SETUP.FitHeight := 0
  else
    FParent._Int_Records.SETUP.FitHeight := Value;
end;

procedure TPrintSettings.SetFitWidth(const Value: integer);
begin
  if (Value < 0) or (Value > $FFFF) then
    FParent._Int_Records.SETUP.FitWidth := 0
  else
    FParent._Int_Records.SETUP.FitWidth := Value;
end;

procedure TPrintSettings.SetFooterMargin(const Value: double);
begin
  FParent._Int_Records.SETUP.FooterMargin := Value;
end;

procedure TPrintSettings.SetFooterMarginCm(const Value: double);
begin
  FParent._Int_Records.SETUP.FooterMargin := Value / 2.54;
end;

procedure TPrintSettings.SetHeaderMargin(const Value: double);
begin
  FParent._Int_Records.SETUP.HeaderMargin := Value;
end;

procedure TPrintSettings.SetHeaderMarginCm(const Value: double);
begin
  FParent._Int_Records.SETUP.HeaderMargin := Value / 2.54;
end;

procedure TPrintSettings.SetPaperSize(const Value: TPaperSize);
begin
  FParent._Int_Records.SETUP.PaperSize := Word(Value);
end;

procedure TPrintSettings.SetScalingFactor(const Value: word);
begin
  FParent._Int_Records.SETUP.Scale := Value;
end;

procedure TPrintSettings.SetStartingPage(const Value: word);
begin
  FParent._Int_Records.SETUP.PageStart := Value;
  if Value = 1 then
    FParent._Int_Records.SETUP.Options := FParent._Int_Records.SETUP.Options and not $0080
  else
    FParent._Int_Records.SETUP.Options := FParent._Int_Records.SETUP.Options or $0080;
end;

function TPrintSettings.GetResolution: integer;
begin
  Result := FParent._Int_Records.SETUP.Resolution;
end;

procedure TPrintSettings.SetResolution(const Value: integer);
begin
  FParent._Int_Records.SETUP.Resolution := Value;
end;

function TPrintSettings.GetMarginBottomCm: double;
begin
  Result := FMarginBottom * 2.54;
end;

function TPrintSettings.GetMarginLeftCm: double;
begin
  Result := FMarginLeft * 2.54;
end;

function TPrintSettings.GetMarginRightCm: double;
begin
  Result := FMarginRight * 2.54;
end;

function TPrintSettings.GetMarginTopCm: double;
begin
  Result := FMarginTop * 2.54;
end;

procedure TPrintSettings.SetMarginBottomCm(const Value: double);
begin
  FMarginBottom := Value / 2.54;
end;

procedure TPrintSettings.SetMarginLeftCm(const Value: double);
begin
  FMarginLeft := Value / 2.54;
end;

procedure TPrintSettings.SetMarginRightCm(const Value: double);
begin
  FMarginRight := Value / 2.54;
end;

procedure TPrintSettings.SetMarginTopCm(const Value: double);
begin
  FMarginTop := Value / 2.54;
end;

{ TSheets }

constructor TSheets.Create(AOwner: TPersistent; FormulaHandler: TFormulaHandler);
begin
  inherited Create(TSheet);
  FOwner := AOwner;
  FFormulaHandler := FormulaHandler;
end;

destructor TSheets.Destroy;
begin
  inherited;
end;

function TSheets.Insert(Index: Integer): TSheet;
begin
  Result := TSheet(inherited Insert(Index));
  TXLSReadWriteII2(FOwner).FormulaHandler.InsertSheet(Index);
end;

procedure TSheets.Delete(Index: integer);
begin
{$ifndef ver120}
  inherited Delete(Index);
{$endif}
  if Count < 1 then
    Add
  else
    TXLSReadWriteII2(FOwner).FormulaHandler.DeleteSheet(Index);
end;

procedure TSheets.ClearAll;
var
  i: integer;
begin
  FFormulaHandler.SST.Clear;
  for i := 0 to Count - 1 do
    Items[i].ClearData;
  inherited Clear;
end;

procedure TSheets.Clear;
begin
  ClearAll;
  Add;
end;

function TSheets.GetSheet(Index: integer): TSheet;
begin
  Result := TSheet(inherited Items[Index]);
end;

procedure TSheets.SetBufSize(Value: integer);
begin
  FFormulaHandler.SST.MaxBufSize := Value;
end;

function TSheets.GetBufSize: integer;
begin
  Result := FFormulaHandler.SST.MaxBufSize;
end;

function TSheets.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TSheets.WriteSST(Stream: TXLSStream);
begin
  FFormulaHandler.SST.Write(Stream);
end;

procedure TSheets.ReadSST(Stream: TXLSStream; RecSize: word);
begin
  FFormulaHandler.SST.Read(Stream,RecSize,True);
end;

function TSheets.SheetByName(Name: WideString): TSheet;
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
{$ifdef ver130}
    if AnsiCompareText(Items[i].Name,Name) = 0 then begin
{$else}
    if WideCompareText(Items[i].Name,Name) = 0 then begin
{$endif}
      Result := Items[i];
      Exit;
    end;
  end;
  Result := Nil;
end;

function TSheets.Add(WorksheetType: TWorksheetType = wtSheet): TSheet;
begin
//  FFormulaHandler.Cells.Add;
  Result := TSheet(inherited Add);
  Result.FWorksheetType := WorksheetType;
end;

{ TSheet }

constructor TSheet.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FTabColor := xcAutomatic;
  FSheetProtections := DefaultSheetProtections;
  FFormats := TXLSREadWriteII2(TSheets(Collection).FOwner).Formats;
  FRecords := TRecordStorageSheet.Create;
  FRecords.SetDefaultData;
  FCells := TSheets(Collection).FormulaHandler.Cells.Add;
//  FCells := TSheets(Collection).FormulaHandler.Cells[Index];
  FColumns := TXLSColumns.Create(FFormats);
  FColumns.OnFormatChange := ColFormatChange;
  FRows := TXLSRows.Create(FFormats);
  FRows.OnFormatChange := RowFormatChange;
  FRecalcFormulas := True;
  FMergedCells := TMergedCells.Create(Self);
  FPrintSettings := TPrintSettings.Create(Self);
  FPrintSettings.PaperSize := TXLSREadWriteII2(TSheets(Collection).FOwner).DefaultPaperSize;
  FValidations := TDataValidations.Create(Self,TXLSREadWriteII2(TSheets(Collection).FOwner).FormulaHandler);
  with TXLSReadWriteII2(TSheets(Collection).FOwner) do
    FEscherDrawing := TEscherDrawing.Create(MSOPictures,Fonts,InternalNames);
  FEscherDrawing.OnReadShape := OnEscherReadShape;
  with TXLSREadWriteII2(TSheets(Collection).FOwner) do
    FDrawingObjects := TDrawingObjects.Create(Self,FEscherDrawing,FormulaHandler,Fonts);
  FControlObjects := TControlObjects.Create(Self,FEscherDrawing,TXLSREadWriteII2(TSheets(Collection).FOwner).FormulaHandler);
  FCharts := TDrwCharts.Create(Self,FEscherDrawing,TXLSREadWriteII2(TSheets(Collection).FOwner).FormulaHandler,TXLSREadWriteII2(TSheets(Collection).FOwner).Fonts);
  FPane := TPane.Create;
  FApplyFormat := TApplyFormat.Create(TXLSREadWriteII2(TSheets(Collection).FOwner).Formats,FCells);
  FApplyFormat.OnGetDefaultFormat := GetDefaultFormat;
  FHyperlinks := THyperlinks.Create(Self,TXLSREadWriteII2(TSheets(Collection).FOwner).FormulaHandler);
  FConditionalFormats := TConditionalFormats.Create(Self,TXLSREadWriteII2(TSheets(Collection).FOwner).FormulaHandler);
  FAutofilters := TAutofilters.Create(Self,FControlObjects.ComboBoxes,TXLSREadWriteII2(TSheets(Collection).FOwner).InternalNames);
  FSelection := TSelection.Create(Self);
  FSelectedAreas := TSelectedAreas.Create;
  FRange := TXLSRange.Create(Index,FCells,FFormats,FMergedCells,TXLSReadWriteII2(TSheets(Collection).FOwner));
  FRange.OnGetDefaultFormat := GetDefaultFormat;
  SetNameNoCheck('Sheet' + IntToStr(ID + 1));
end;

destructor TSheet.Destroy;
begin
  FEscherDrawing.Free;
  FRows.Free;
  FValidations.Free;
  FColumns.Free;
  FMergedCells.Free;
  FPrintSettings.Free;
  FRecords.Free;
  FDrawingObjects.Free;
  FControlObjects.Free;
  FCharts.Free;                                            
  FPane.Free;
  FHyperlinks.Free;
  FApplyFormat.Free;
  FConditionalFormats.Free;
  FAutofilters.Free;
  FSelection.Free;
  FSelectedAreas.Free;
  FRange.Free;

//  Deleting FormulaHandler.Cells is done in TSheets.Delete
//  if TSheets(Collection).FormulaHandler.Cells.Count > 0 then
//    TSheets(Collection).FormulaHandler.Cells.Delete(Index);
  inherited Destroy;
end;

procedure TSheet.ClearData;
begin
  FTabColor := xcAutomatic;
  FSheetProtections := DefaultSheetProtections;
  FRecords.Clear;
  FRecords.SetDefaultData;
  FHasDefaultRecords := False;
  FValidations.Clear;
  FMergedCells.Clear;
  FPrintSettings.Clear;
  FColumns.Clear;
  FRows.Clear;
  FDrawingObjects.Clear;
  FControlObjects.Clear;
  FEscherDrawing.Clear;
  FPane.Clear;
  FHyperlinks.Clear;
  FConditionalFormats.Clear;
  FAutofilters.Clear;
  FSelection.Clear;
  FSelectedAreas.Clear;
  ClearCells;
//  FCells.Clear;
end;

procedure TSheet.CheckFirstLast(ACol,ARow: integer);
begin
  if ACol < FirstCol then FirstCol := ACol;
  if ACol > LastCol then LastCol := ACol;
  if ARow < FirstRow then FirstRow := ARow;
  if ARow > LastRow then LastRow := ARow;
end;

function TSheet.GetDisplayName: string;
begin
  inherited GetDisplayName;
  Result := GetName;
end;

procedure TSheet.IntWriteBlank(Col,Row: integer; FormatIndex: word);
begin
  FCells[ColRowToRC(Col,Row)] := TBlankCell.Create(ColRowToRC(Col,Row),FFormats,FormatIndex);
end;

procedure TSheet.IntWriteBoolean(Col,Row: integer; FormatIndex: word; Value: boolean);
begin
  FCells[ColRowToRC(Col,Row)] := TBooleanCell.Create(ColRowToRC(Col,Row),FFormats,FormatIndex,Value);
end;

procedure TSheet.IntWriteError(Col,Row: integer; FormatIndex: word; Value: TCellError);
begin
  FCells[ColRowToRC(Col,Row)] := TErrorCell.Create(ColRowToRC(Col,Row),FFormats,FormatIndex,Value);
end;

procedure TSheet.IntWriteNumber(Col,Row: integer; FormatIndex: word; Value: double);
begin
  FCells[ColRowToRC(Col,Row)] := TFloatCell.Create(ColRowToRC(Col,Row),FFormats,FormatIndex,Value);
end;

procedure TSheet.IntWriteSSTStringIndex(Col, Row: integer; FormatIndex: word; Value: integer);
begin
  FCells[ColRowToRC(Col,Row)] := TStringCell.Create(ColRowToRC(Col,Row),FFormats,FormatIndex,FCells.SST.SST[Value]);
  FCells.SST.SST[Value].RefCount := FCells.SST.SST[Value].RefCount + 1;
end;

procedure TSheet.IntWriteSSTString(Col,Row: integer; FormatIndex: word; Value: WideString);
begin
  FCells[ColRowToRC(Col,Row)] := TStringCell.Create(ColRowToRC(Col,Row),FFormats,FormatIndex,FCells.SST.AddString(Value));
end;

procedure TSheet.StreamWriteMergedCells(Version: TExcelVersion; Stream: TXLSStream);
var
  i,j,MaxCount: integer;
  Buf: PByteArray;
begin
  if Version < xvExcel97 then
    Exit;
  GetMem(Buf,TSheets(Collection).MaxBufSize);
  try
    if FMergedCells.Count > 0 then begin
      MaxCount := (TSheets(Collection).MaxBufSize - 2) div 8;
      if FMergedCells.Count < MaxCount then
        MaxCount := FMergedCells.Count;
      j := 0;
      for i := 0 to FMergedCells.Count - 1 do begin
        PRecMERGEDCELLS(Buf).Cells[j].Row1 := FMergedCells[i].Row1;
        PRecMERGEDCELLS(Buf).Cells[j].Row2 := FMergedCells[i].Row2;
        PRecMERGEDCELLS(Buf).Cells[j].Col1 := FMergedCells[i].Col1;
        PRecMERGEDCELLS(Buf).Cells[j].Col2 := FMergedCells[i].Col2;
        Inc(j);
        if j >= MaxCount then begin
          PRecMERGEDCELLS(Buf).Count := j;
          Stream.WriteHeader(BIFFRECID_MERGEDCELLS,2 + j * 8);
          Stream.Write(Buf^,2 + j * 8);
          j := 0;
        end;
      end;
      if j > 0 then begin
        PRecMERGEDCELLS(Buf).Count := j;
        Stream.WriteHeader(BIFFRECID_MERGEDCELLS,2 + j * 8);
        Stream.Write(Buf^,2 + j * 8);
      end;
    end;
  finally
    FreeMem(Buf);
  end;
end;

procedure TSheet.WriteBuf(Stream: TXLSStream; RecId,Size: word; P: Pointer);
begin
  Stream.WriteHeader(RecID,Size);
  if Size > 0 then
    Stream.Write(P^,Size);
end;

function TSheet.GetDefaultFormat(Col,Row: integer): word;
var
  XRow: TXLSRow;
begin
  if (FColumns[Col] <> Nil) and (FColumns[Col].FormatIndex <> DEFAULT_FORMAT) then begin
    Result := FColumns[Col].FormatIndex;
    FColumns[Col].Formats[FColumns[Col].FormatIndex].IncUsageCount;
  end
  else begin
    XRow := FRows.Find(Row);
    if (XRow <> Nil) and (XRow.FormatIndex <> DEFAULT_FORMAT) then begin
      XRow.Formats[XRow.FormatIndex].IncUsageCount;
      Result := XRow.FormatIndex;
    end
    else
      Result := DEFAULT_FORMAT;
  end;
end;

// Check this...
function TSheet.GetDefaultWriteFormat(Version: TExcelVersion; FormatIndex: integer): word;
begin
  if FormatIndex < 0 then
    Result := DEFAULT_FORMAT
  else if TXLSReadWriteII2(TSheets(Collection).FOwner).WriteDefaultData then begin
    if Version < xvExcel50 then
      Result := FormatIndex + DEFAULT_FORMAT40 + 1
    else if Version < xvExcel97 then
      Result := FormatIndex + DEFAULT_FORMATS_COUNT_50
    else
      Result := FormatIndex;
  end
  else
    Result := FormatIndex;
end;

procedure TSheet.StreamWriteCells(Version: TExcelVersion; Stream: TXLSStream);

type TMulRk = packed record
     XF: word;
     RK: longword;
     end;

var
  i,R,C1,C2,Count: integer;
  WrittenCells: integer;
  L: word;
  S: string;
  WS: WideString;
  V: double;
  Row,CurrRow: integer;
  RK: longword;
  Cell: TCell;
  RecBlank: TRecBLANK;
  RecNum: TRecNUMBER;
  RecRK: TRecRK;
  RecBool: TRecBOOLERR;
  RecLabel: TRecLABEL;
  RecLabelSST: TRecLABELSST;
  RecFormula: TRecFORMULA_;
  Buf: PByteArray;
  WordArray: array[0..255] of word;
  RKCache: array[0..255] of TMulRK;
  RKCachePtr: integer;
  RKFirstCol,RKLastCol: integer;

function EncodeRK(const Value: double; var RK: longword): boolean;
var
  D: double;
  pL1, pL2: ^longword;
  Mask: longword;
  i: integer;
begin
  Result := True;
  for i := 0 to 1 do begin
    D := Value * (1 + 99 * i);
    pL1 := @d;
    pL2 := pL1;
    Inc(pL2);
    if (pL1^ = 0) and ((pL2^ and 3) = 0) then begin
      RK := pL2^ + Longword(i);
      Exit;
    end;
    Mask := $1FFFFFFF;
    if (Int(D) = D) and (D <= Mask) and (D >= -Mask - 1) then begin
      RK := Round(D) shl 2 + i + 2;
      Exit;
    end;
  end;
  Result := False;
end;

procedure FlushRkCache;
begin
  if RKCachePtr > 0 then begin
    if RKCachePtr = 1 then begin
      RecRK.Row := CurrRow;
      RecRK.Col := RKFirstCol;
      RecRK.FormatIndex := RKCache[0].XF;
      RecRK.Value := RKCache[0].RK;
      WriteBuf(Stream,BIFFRECID_RK7,SizeOf(TRecRK),@RecRK);
    end
    else begin
      Stream.WriteHeader(BIFFRECID_MULRK,RKCachePtr * SizeOf(TMulRk) + 6);
      Stream.WWord(CurrRow);
      Stream.WWord(RKFirstCol);
      Stream.Write(RKCache[0],RKCachePtr * SizeOf(TMulRk));
      Stream.WWord(RKLastCol);
    end;
    RKCachePtr := 0;
    RKFirstCol := -1;
    RKLastCol := -1;
  end;
end;

function AddRk(RK: longword; XF,Col: integer): boolean;
begin
  if RKCachePtr > High(RKCache) then
    raise Exception.Create('RK Cache overflow');
  if RKFirstCol < 0 then
    RKFirstCol := Col;
  if (RKLastCol >= 0) and (Col <> (RKLastCol + 1)) then
    Result := False
  else begin
    RKLastCol := Col;
    RKCache[RKCachePtr].XF := XF;
    RKCache[RKCachePtr].RK := RK;
    Inc(RKCachePtr);
    Result := True;
  end;
end;

begin
  RKCachePtr := 0;
  RKFirstCol := -1;
  RKLastCol := -1;
  GetMem(Buf,TSheets(Collection).MaxBufSize);
  WrittenCells := 0;
  Count := 0;
  try
  try
    FCells.BeginIterate;
    Cell := FCells.GetNext;
    while Cell <> Nil do begin
      Inc(Count);

      Row := Cell.RowCol shr 8;
      if Row <> CurrRow then
        FlushRkCache;
      CurrRow := Row;
      if not (Cell.CellType in [ctFloat,ctInteger]) then
        FlushRkCache;
      case Cell.CellType of
        ctBlank: begin
          R := Cell.RowCol shr 8;
          C1 := Cell.RowCol and $000000FF;
          C2 := C1;
          i := 0;
          repeat
            WordArray[i] := Cell.FormatIndex;
            Cell := FCells.GetNextMULBLANK;
            if Cell <> Nil then begin
              if Integer(Cell.RowCol and $000000FF) <> (C2 + 1) then
               raise Exception.Create('Row error in writing MULBLANK');
              Inc(C2);
            end;
            Inc(i);
          until (Cell = Nil);
          Dec(i);

          if i > 0 then begin
            Stream.WriteHeader(BIFFRECID_MULBLANK,6 + (i + 1) * 2);
            Stream.WWord(R);
            Stream.WWord(C1);
            for C1 := 0 to i do
              Stream.WWord(WordArray[C1]);
            Stream.WWord(C2);
          end
          else begin
            RecBlank.Row := R;
            RecBlank.Col := C1;
            RecBlank.FormatIndex := GetDefaultWriteFormat(Version,WordArray[0]);
            WriteBuf(Stream,BIFFRECID_BLANK,SizeOf(TRecBLANK),@RecBlank);
          end;

        end;
        ctBoolean: begin
          RecBool.Row := Cell.RowCol shr 8;
          RecBool.Col := Cell.RowCol and $000000FF;
          RecBool.FormatIndex := GetDefaultWriteFormat(Version,Cell.FormatIndex);
          RecBool.BoolErr := Byte(TBooleanCell(Cell).Value);
          RecBool.Error := 0;
          WriteBuf(Stream,BIFFRECID_BOOLERR,SizeOf(TRecBOOLERR),@RecBool);
        end;
        ctError: begin
          RecBool.Row := Cell.RowCol shr 8;
          RecBool.Col := Cell.RowCol and $000000FF;
          RecBool.FormatIndex := GetDefaultWriteFormat(Version,Cell.FormatIndex);
          case TErrorCell(Cell).Value of
            ErrError: raise Exception.CreateFmt('Invalid error value in cell %d:%d',[RecBool.Row,RecBool.Col]);
            errNull:  RecBool.BoolErr := $00;
            errDiv0:  RecBool.BoolErr := $07;
            errValue: RecBool.BoolErr := $0F;
            errRef:   RecBool.BoolErr := $17;
            errName:  RecBool.BoolErr := $1D;
            errNum:   RecBool.BoolErr := $24;
            errNA:    RecBool.BoolErr := $2A;
          end;
          RecBool.Error := 1;
          WriteBuf(Stream,BIFFRECID_BOOLERR,SizeOf(TRecBOOLERR),@RecBool);
        end;
        ctFloat, ctInteger: begin
          if Cell.CellType = ctFloat then
            V := TFloatCell(Cell).Value
          else
            V := TIntegerCell(Cell).Value;
          if not (EncodeRK(V,RK) and AddRK(RK,GetDefaultWriteFormat(Version,Cell.FormatIndex),Cell.RowCol and $000000FF)) then begin
            FlushRkCache;
            RecNum.Row := Cell.RowCol shr 8;
            RecNum.Col := Cell.RowCol and $000000FF;
            RecNum.FormatIndex := GetDefaultWriteFormat(Version,Cell.FormatIndex);
            RecNum.Value := V;
            WriteBuf(Stream,BIFFRECID_NUMBER,SizeOf(TRecNUMBER),@RecNum);
          end;
        end;
        ctString: begin
          if Version >= xvExcel97 then begin
            RecLabelSST.Row := Cell.RowCol shr 8;
            RecLabelSST.Col := Cell.RowCol and $000000FF;
            RecLabelSST.FormatIndex := GetDefaultWriteFormat(Version,Cell.FormatIndex);
            RecLabelSST.SSTIndex := TStringCell(Cell).Value.Index;
            WriteBuf(Stream,BIFFRECID_LABELSST,SizeOf(TRecLABELSST),@RecLabelSST);
          end
          else begin
            RecLabel.Row := Cell.RowCol shr 8;
            RecLabel.Col := Cell.RowCol and $000000FF;
            RecLabel.FormatIndex := GetDefaultWriteFormat(Version,Cell.FormatIndex);
            S := #0 + FCells.SST[TStringCell(Cell).Value];
            RecLabel.Len := Length(S) - 1;
            Move(Pointer(S)^,RecLabel.Data,Length(S));
            WriteBuf(Stream,BIFFRECID_LABEL,8 + RecLabel.Len + 1,@RecLabel);
          end;
        end;
        ctNumberFormula,ctStringFormula,ctBooleanFormula,ctErrorFormula,ctArrayFormula: begin
          RecFORMULA.Row := Cell.RowCol shr 8;
          RecFORMULA.Col := Cell.RowCol and $000000FF;
          RecFORMULA.FormatIndex := GetDefaultWriteFormat(Version,Cell.FormatIndex);
          RecFORMULA.Reserved := 0;
          if FRecalcFormulas then
            RecFORMULA.Options := $02
          else
            RecFORMULA.Options := $00;
          RecFORMULA.ParseLen := TFormulaCell(Cell).FormulaSize;
          case Cell.CellType of
            ctNumberFormula,ctArrayFormula: begin
              RecFORMULA.Value := TNumberFormulaCell(Cell).NumberValue;
            end;
            ctBooleanFormula: begin
              TByte8Array(RecFORMULA.Value)[0] := 1;
              TByte8Array(RecFORMULA.Value)[1] := 0;
              TByte8Array(RecFORMULA.Value)[2] := Byte(TBooleanFormulaCell(Cell).BooleanValue);
              TByte8Array(RecFORMULA.Value)[3] := 0;
              TByte8Array(RecFORMULA.Value)[4] := 0;
              TByte8Array(RecFORMULA.Value)[5] := 0;
              TByte8Array(RecFORMULA.Value)[6] := $FF;
              TByte8Array(RecFORMULA.Value)[7] := $FF;
            end;
            ctErrorFormula: begin
              TByte8Array(RecFORMULA.Value)[0] := 1;
              TByte8Array(RecFORMULA.Value)[1] := 0;
              TByte8Array(RecFORMULA.Value)[2] := CellErrorToErrorCode(TErrorFormulaCell(Cell).ErrorValue);
              TByte8Array(RecFORMULA.Value)[3] := 0;
              TByte8Array(RecFORMULA.Value)[4] := 0;
              TByte8Array(RecFORMULA.Value)[5] := 0;
              TByte8Array(RecFORMULA.Value)[6] := $FF;
              TByte8Array(RecFORMULA.Value)[7] := $FF;
            end;
            ctStringFormula: begin
              WS := TStringFormulaCell(Cell).StringValue;
              if WS = '' then
                TByte8Array(RecFORMULA.Value)[0] := 3
              else
                TByte8Array(RecFORMULA.Value)[0] := 0;
              TByte8Array(RecFORMULA.Value)[1] := 0;
              TByte8Array(RecFORMULA.Value)[2] := 0;
              TByte8Array(RecFORMULA.Value)[3] := 0;
              TByte8Array(RecFORMULA.Value)[4] := 0;
              TByte8Array(RecFORMULA.Value)[5] := 0;
              TByte8Array(RecFORMULA.Value)[6] := $FF;
              TByte8Array(RecFORMULA.Value)[7] := $FF;
            end;
          end;
          Stream.WriteHeader(BIFFRECID_FORMULA,SizeOf(TRecFORMULA_) + TFormulaCell(Cell).DataSize);
          Stream.Write(RecFORMULA,SizeOf(TRecFORMULA_));
          Move(TFormulaCell(Cell).PTGS^,Buf^,TFormulaCell(Cell).DataSize);
          Stream.Write(Buf^,TFormulaCell(Cell).DataSize);
          if Cell.CellType = ctStringFormula then begin
            // Write STRING record.
            L := Length(WS);
            if Version >= xvExcel97 then begin
              if L > 0 then begin
                Stream.WriteHeader(BIFFRECID_STRING,Length(WS) * 2 + 2 + 1);
                Stream.Write(L,2);
                Stream.WByte(1);
                Stream.Write(Pointer(WS)^,Length(WS) * 2);
              end;
            end
            else begin
              S := WS;
              Stream.WriteHeader(BIFFRECID_STRING,L + 2);
              Stream.Write(L,2);
              Stream.Write(Pointer(S)^,L);
            end;
          end
          else if (Cell.CellType = ctArrayFormula) and not TArrayFormulaCell(Cell).isChild then begin
            Stream.WriteHeader(BIFFRECID_ARRAY,TArrayFormulaCell(Cell).ArraySize);
            Stream.Write(TArrayFormulaCell(Cell).ArrayData^,TArrayFormulaCell(Cell).ArraySize);
          end;
        end;
      end;
      Inc(WrittenCells);
      if Assigned(TXLSReadWriteII2(TSheets(Collection).FOwner).OnProgress) and (WrittenCells >= 100) then begin
        TXLSReadWriteII2(TSheets(Collection).FOwner).WrittenNCells;
        WrittenCells := 0;
      end;

      Cell := FCells.GetNext;
    end;
    FlushRkCache;
  except
    on E: Exception do
      raise Exception.CreateFmt('Error on writing record # %d' + #13 + E.Message,[Count]);
  end;
  finally
    FreeMem(Buf);
  end;
end;

procedure TSheet.ClearCells;
begin
  FCells.Clear;
end;

procedure TSheet.DeleteCell(Col, Row: integer);
var
  Cell: TCell;
begin
  try
    Cell := FCells[ColRowToRC(Col,Row)];
    if Cell <> Nil then begin
      if Cell is TStringCell then
        FCells.SST.Delete(TStringCell(Cell).Value);
      FCells.Delete(ColRowToRC(Col,Row));
    end;
  except
    raise Exception.CreateFmt('Error on deleting cell %d:%d',[Col,Row]);
  end;
end;

procedure TSheet.DeleteCells(Col1, Row1, Col2, Row2: integer);
var
  Col,Row: integer;
begin
  for Col := Col1 to Col2 do begin
    for Row := Row1 to Row2 do
      DeleteCell(Col,Row);
  end;
  FEscherDrawing.Delete(Col1, Row1, Col2, Row2);
  FConditionalFormats.DeleteLocal(Col1, Row1, Col2, Row2);
  FValidations.DeleteLocal(Col1, Row1, Col2, Row2);
  FMergedCells.Delete(Col1, Row1, Col2, Row2);
end;

function TSheet.GetCell(Col, Row: integer): TCell;
begin
  Result := FCells[ColRowToRC(Col,Row)];
end;

function TSheet.GetCellType(Col, Row: integer): TCellType;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if Cell <> Nil then
    Result := Cell.CellType
  else
    Result := ctNone;
end;

function TSheet.GetAsBlank(Col, Row: integer): boolean;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if (Cell <> Nil) then
    Result := True
  else
    Result := False;
end;

procedure TSheet.SetAsBlank(Col, Row: integer; const Value: boolean);
begin
  FCells[ColRowToRC(Col,Row)] := TBlankCell.Create(ColRowToRC(Col,Row),FFormats,GetDefaultFormat(Col,Row));
  if Assigned(FInvalidCellEvent) then FInvalidCellEvent(Col,Row);
end;

function TSheet.GetAsInteger(Col, Row: integer): integer;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if (Cell <> Nil) then begin
    if Cell is TFloatCell then
      Result := Round(TFloatCell(Cell).Value)
    else if Cell is TIntegerCell then
      Result := TIntegerCell(Cell).Value
    else
      raise Exception.Create('Cell is missing/is of wrong type');
  end
  else
    raise Exception.Create('Cell is missing/is of wrong type');
end;

procedure TSheet.SetAsInteger(Col, Row: integer; const Value: integer);
begin
  FCells[ColRowToRC(Col,Row)] := TIntegerCell.Create(ColRowToRC(Col,Row),FFormats,GetDefaultFormat(Col,Row),Value);
  if Assigned(FInvalidCellEvent) then FInvalidCellEvent(Col,Row);
end;

function TSheet.GetAsBoolean(Col, Row: integer): boolean;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if (Cell <> Nil) and (Cell is TBooleanCell) then
    Result := TBooleanCell(Cell).Value
  else
    raise Exception.Create('Cell is missing/is of wrong type');
end;

procedure TSheet.SetAsBoolean(Col, Row: integer; const Value: boolean);
begin
  FCells[ColRowToRC(Col,Row)] := TBooleanCell.Create(ColRowToRC(Col,Row),FFormats,GetDefaultFormat(Col,Row),Value);
  if Assigned(FInvalidCellEvent) then FInvalidCellEvent(Col,Row);
end;

function TSheet.GetAsError(Col, Row: integer): TCellError;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if (Cell <> Nil) and (Cell is TErrorCell) then
    Result := TErrorCell(Cell).Value
  else
    raise Exception.Create('Cell is missing/is of wrong type');
end;

procedure TSheet.SetAsError(Col, Row: integer; Value: TCellError);
begin
  FCells[ColRowToRC(Col,Row)] := TErrorCell.Create(ColRowToRC(Col,Row),FFormats,GetDefaultFormat(Col,Row),Value);
  if Assigned(FInvalidCellEvent) then FInvalidCellEvent(Col,Row);
end;

function TSheet.GetAsFloat(Col, Row: integer): double;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
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

procedure TSheet.SetAsFloat(Col, Row: integer; const Value: double);
begin
  FCells[ColRowToRC(Col,Row)] := TFloatCell.Create(ColRowToRC(Col,Row),FFormats,GetDefaultFormat(Col,Row),Value);
  if Assigned(FInvalidCellEvent) then FInvalidCellEvent(Col,Row);
end;

function TSheet.GetAsString(Col, Row: integer): WideString;
var
  Cell: TCell;
  XLS: TXLSReadWriteII2;
begin
  XLS := TXLSReadWriteII2(TSheets(Collection).FOwner);
  Cell := FCells[ColRowToRC(Col,Row)];
  if Cell <> Nil then begin
    case Cell.CellType of
      ctNone,
      ctBlank:          Result := '';
      ctInteger:        Result := IntToStr(TIntegerCell(Cell).Value);
      ctFloat:          Result := FloatToStr(TFloatCell(Cell).Value);
      ctString:         Result := FCells.SST[TStringCell(Cell).Value];
      ctBoolean:        if TBooleanCell(Cell).Value then Result := XLS.StrTRUE else Result := XLS.StrFALSE;
      ctError:          Result := CellErrorNames[Integer(TErrorCell(Cell).Value)];
      ctNumberFormula:  if XLS.ShowFormulas then
                          Result := XLS.FormulaHandler.DecodeFormulaRel(TNumberFormulaCell(Cell).PTGS,TNumberFormulaCell(Cell).FormulaSize,Index,Col,Row)
                        else
                          Result := FloatToStr(TNumberFormulaCell(Cell).NumberValue);
      ctStringFormula:  if XLS.ShowFormulas then
                          Result := XLS.FormulaHandler.DecodeFormulaRel(TStringFormulaCell(Cell).PTGS,TStringFormulaCell(Cell).FormulaSize,Index,Col,Row)
                        else
                          Result := TStringFormulaCell(Cell).StringValue;
      ctBooleanFormula: if XLS.ShowFormulas then
                          Result := XLS.FormulaHandler.DecodeFormulaRel(TBooleanFormulaCell(Cell).PTGS,TBooleanFormulaCell(Cell).FormulaSize,Index,Col,Row)
                        else
                          if TBooleanFormulaCell(Cell).BooleanValue then Result := XLS.StrTRUE else Result := XLS.StrFALSE;
      ctErrorFormula:   if XLS.ShowFormulas then
                          Result := XLS.FormulaHandler.DecodeFormulaRel(TErrorFormulaCell(Cell).PTGS,TErrorFormulaCell(Cell).FormulaSize,Index,Col,Row)
                        else
                          Result := CellErrorNames[Byte(TErrorFormulaCell(Cell).ErrorValue)];
      ctArrayFormula:  if XLS.ShowFormulas then
                          Result := XLS.FormulaHandler.DecodeFormulaRel(TArrayFormulaCell(Cell).PTGS,TArrayFormulaCell(Cell).FormulaSize,Index,Col,Row)
                        else
                          Result := FloatToStr(TArrayFormulaCell(Cell).NumberValue);
    end;
  end
  else
    Result := '';
end;

procedure TSheet.SetAsString(Col, Row: integer; const Value: WideString);
begin
  FCells[ColRowToRC(Col,Row)] := TStringCell.Create(ColRowToRC(Col,Row),FFormats,GetDefaultFormat(Col,Row),FCells.SST.AddString(Value));
end;

function TSheet.GetAsVariant(Col, Row: integer): Variant;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if Cell <> Nil then begin
    case Cell.CellType of
      ctNone,
      ctBlank:          Result := 0;
      ctInteger:        Result := TIntegerCell(Cell).Value;
      ctFloat:          Result := TFloatCell(Cell).Value;
      ctString:         Result := FCells.SST[TStringCell(Cell).Value];
      ctBoolean:        if TBooleanCell(Cell).Value then Result := 1 else Result := 0;
      ctError:          Result := CellErrorNames[Integer(TErrorCell(Cell).Value)];
      ctNumberFormula:  Result := TNumberFormulaCell(Cell).NumberValue;
      ctStringFormula:  Result := TStringFormulaCell(Cell).StringValue;
      ctBooleanFormula: if TBooleanFormulaCell(Cell).BooleanValue then Result := 1 else Result := 0;
      ctErrorFormula:   Result := CellErrorNames[Byte(TErrorFormulaCell(Cell).ErrorValue)];
    end;
  end
  else
    Result := 0;
end;

procedure TSheet.SetAsVariant(Col, Row: integer; const Value: Variant);
begin
  case VarType(Value) of
    varSmallint,
    varInteger    : SetAsInteger(Col,Row,Value);
    varSingle,
    varDouble,
    varCurrency,
    varDate       : SetAsFloat(Col,Row,Value);
    varOleStr     : SetAsString(Col,Row,Value);

    varBoolean    : SetAsBoolean(Col,Row,Value);
//    varVariant    :  ???
{$ifndef OLD_COMPILER}
    varShortInt,
    varWord,
    varLongWord,
{$endif}
    varByte       : SetAsInteger(Col,Row,Value);
{$ifndef OLD_COMPILER}
    varInt64      : SetAsFloat(Col,Row,Value);
{$endif}

    varStrArg,
    varString     : SetAsWideString(Col,Row,Value);
  end;
end;

function TSheet.GetFmtAsString(Col, Row: integer): WideString;
var
  Cell: TCell;
  FA: TFormulaHandler;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if Cell <> Nil then begin
    FA := TSheets(Collection).FFormulaHandler;
    if TXLSReadWriteII2(TSheets(Collection).FOwner).ShowFormulas then begin
      case Cell.CellType of
        ctNone: ;
        ctBlank:          Result := '';
        ctInteger,
        ctFloat,
        ctString,
        ctBoolean,
        ctError:          Result := FCells.GetAsFmtString(Col,Row);
        ctNumberFormula:  Result := FA.DecodeFormulaRel(TNumberFormulaCell(Cell).PTGS,TNumberFormulaCell(Cell).FormulaSize,Index,Col,Row);
        ctStringFormula:  Result := FA.DecodeFormulaRel(TStringFormulaCell(Cell).PTGS,TStringFormulaCell(Cell).FormulaSize,Index,Col,Row);
        ctBooleanFormula: Result := FA.DecodeFormulaRel(TBooleanFormulaCell(Cell).PTGS,TBooleanFormulaCell(Cell).FormulaSize,Index,Col,Row);
        ctErrorFormula:   Result := FA.DecodeFormulaRel(TErrorFormulaCell(Cell).PTGS,TErrorFormulaCell(Cell).FormulaSize,Index,Col,Row);
        ctArrayFormula:   Result := FA.DecodeFormulaRel(TArrayFormulaCell(Cell).PTGS,TArrayFormulaCell(Cell).FormulaSize,Index,Col,Row);
      end;
    end
    else
      Result := FCells.GetAsFmtString(Col,Row);
  end
  else
    Result := '';
end;

function TSheet.GetAsHTML(Col, Row: integer): string;
var
  i,p: integer;
  pStr: PXLSString;
  XFont: TXFont;
  S,S2: WideString;
  Cell: TCell;
  XLS: TXLSReadWriteII2;

function PtToHTMLSize(Pt: integer): integer;
begin
  case Pt of
    0..8:
      Result := 1;
    9..10:
      Result := 2;
    11..12:
      Result := 3;
    13..15:
      Result := 4;
    16..20:
      Result := 5;
    21..24:
      Result := 6;
    else
      Result := 7;
  end;
end;

function ReplaceSpaces(S: string): string;
var
  i,j: integer;
begin
  i := 1;
  j := 0;
  while (i <= Length(S)) and (S[i] = ' ') do begin
    Inc(j);
    Inc(i);
  end;
  S := Copy(S,j + 1,MAXINT);
  while j > 0 do begin
    S := '&nbsp;' + S;
    Dec(j);
  end;

  i := Length(S);
  j := 0;
  while (i >= 1) and (S[i] = ' ') do begin
    Inc(j);
    Dec(i);
  end;
  S := Copy(S,1,Length(S) - j);
  while j > 0 do begin
    S := S + '&nbsp;';
    Dec(j);
  end;
  Result := S;
end;

function FontAsHTML(XFont: TXFont; S: string): string;
var
  F: TFont;
begin
  if S = '' then begin
    Result := '';
    Exit;
  end;
  F := TFont.Create;
  try
    XFont.CopyToTFont(F);
  finally
    S := ReplaceSpaces(S);
    S := FastReplace(S,'<','&lt;',True);
    S := FastReplace(S,'>','&gt;',True);
    if fsBold in F.Style then
      S := '<b>' + S + '</b>';
    if fsItalic in F.Style then
      S := '<i>' + S + '</i>';
    if fsUnderline in F.Style then
      S := '<u>' + S + '</u>';
    if F.Color = 0 then // this is the default font color, don't write it out...
      Result := Format('<font face=%s size=%d>%s</font>',[F.Name,PtToHTMLSize(F.Size),S])
    else
      Result := Format('<font face="%s" color="#%.2X%.2X%.2X" size="%d">%s</font>',[F.Name,F.Color and $0000FF,(F.Color and $00FF00) shr 8,(F.Color and $FF0000) shr 16,PtToHTMLSize(F.Size),S]);
    F.Free;
  end;
end;

begin
  Result := '';
  XLS := TXLSReadWriteII2(TSheets(Collection).FOwner);
  Cell := FCells[ColRowToRC(Col,Row)];
  if Cell <> Nil then begin
    if Cell.CellType = ctString then begin
      pStr := TStringCell(Cell).Value;
      if FCells.SST.IsFormatted[pStr] then begin
        XFont := XLS.Fonts[Cell.FontIndex];
        p := 1;
        S := FCells.SST[pStr];
        for i := 0 to FCells.SST.FormatCount[pStr] - 1 do begin
          if FCells.SST.Font[pStr,i].Index <= 0 then
            Continue;
          S2 := Copy(S,p,FCells.SST.Font[pStr,i].Index - p + 1);
          if (S2 <> '') and (XFont <> Nil) then
            Result := Result + FontAsHTML(XFont,S2);
          p := FCells.SST.Font[pStr,i].Index + 1;
          XFont := FCells.SST.Font[pStr,i].Font;
        end;
        S2 := Copy(S,p,MAXINT);
        if (S2 <> '') and (XFont <> Nil) then
          Result := Result + FontAsHTML(XFont,S2);
      end
      else
        Result := FontAsHTML(XLS.Fonts[Cell.FontIndex],GetFmtAsString(Col,Row));
    end
    else
      Result := FontAsHTML(XLS.Fonts[Cell.FontIndex],GetFmtAsString(Col,Row));
  end;
end;

function TSheet.GetAsFormula(Col, Row: integer): string;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if (Cell <> Nil) and (Cell is TFormulaCell) then begin
    if Cell is TArrayFormulaCell then
      Result := TXLSReadWriteII2(TSheets(Collection).FOwner).FormulaHandler.DecodeFormulaRel(TArrayFormulaCell(Cell).ArrayPTGS,TArrayFormulaCell(Cell).ArrayPTGSSize,Index,Col,Row)
    else
      Result := TXLSReadWriteII2(TSheets(Collection).FOwner).FormulaHandler.DecodeFormulaRel(TFormulaCell(Cell).PTGS,TFormulaCell(Cell).FormulaSize,Index,Col,Row);
  end
  else
    raise Exception.Create('Cell is missing/is of wrong type');
end;

function TSheet.MakeFormulaCell(CellType: TCellType; Data: PByteArray; DataSize,FmlaSize,RC,FI: integer): TFormulaCell;
var
  Buf: PByteArray;
begin
  Result := Nil;
  GetMem(Buf,DataSize);
  try
    Move(Data^,Buf^,DataSize);
    case CellType of
      ctNumberFormula:  Result := TNumberFormulaCell.Create(RC,FFormats,FI,Buf,DataSize,FmlaSize);
      ctStringFormula:  Result := TStringFormulaCell.Create(RC,FFormats,FI,Buf,DataSize,FmlaSize);
      ctBooleanFormula: Result := TBooleanFormulaCell.Create(RC,FFormats,FI,Buf,DataSize,FmlaSize);
      ctErrorFormula:   Result := TErrorFormulaCell.Create(RC,FFormats,FI,Buf,DataSize,FmlaSize);
      else
        raise Exception.Create('Invalid Formula cell type');
    end
  finally
    FreeMem(Buf);
  end;
end;

procedure TSheet.WriteRawErrFormula(Col, Row, FormatIndex: integer; Data: PByteArray; DataSize,FmlaSize: integer; Value: byte);
var
  RC: integer;
  Cell: TFormulaCell;
begin
  RC := ColRowToRC(Col,Row);
  Cell := MakeFormulaCell(ctErrorFormula,Data,DataSize,FmlaSize,RC,FormatIndex);
  TErrorFormulaCell(Cell).ErrorValue := ErrorCodeToCellError(Value);
  FCells[RC] := Cell;
end;

procedure TSheet.WriteRawBoolFormula(Col, Row, FormatIndex: integer; Data: PByteArray; DataSize,FmlaSize: integer; Value: boolean);
var
  RC: integer;
  Cell: TFormulaCell;
begin
  RC := ColRowToRC(Col,Row);
  Cell := MakeFormulaCell(ctBooleanFormula,Data,DataSize,FmlaSize,RC,FormatIndex);
  TBooleanFormulaCell(Cell).BooleanValue := Value;
  FCells[RC] := Cell;
end;

procedure TSheet.WriteRawNumFormula(Col, Row, FormatIndex: integer; Data: PByteArray; DataSize,FmlaSize: integer; Value: double);
var
  RC: integer;
  Cell: TFormulaCell;
begin
  RC := ColRowToRC(Col,Row);
  Cell := MakeFormulaCell(ctNumberFormula,Data,DataSize,FmlaSize,RC,FormatIndex);
  TNumberFormulaCell(Cell).NumberValue := Value;
  FCells[RC] := Cell;
end;

procedure TSheet.WriteRawStrFormula(Col, Row, FormatIndex: integer; Data: PByteArray; DataSize,FmlaSize: integer; Value: WideString);
var
  RC: integer;
  Cell: TFormulaCell;
begin
  RC := ColRowToRC(Col,Row);
  Cell := MakeFormulaCell(ctStringFormula,Data,DataSize,FmlaSize,RC,FormatIndex);
  TStringFormulaCell(Cell).StringValue := Value;
  FCells[RC] := Cell;
end;

procedure TSheet.WriteRawArrayFormula(Col, Row, FormatIndex: integer; Data: PByteArray; DataSize,FmlaSize: integer; Value: double; Arr: PByteArray; ArrLen: integer; IsChild: boolean);
var
  RC: integer;
  Cell: TArrayFormulaCell;
begin
  RC := ColRowToRC(Col,Row);
  Cell := TArrayFormulaCell.Create(RC,FFormats,FormatIndex,Data,DataSize,FmlaSize,Arr,ArrLen,IsChild);
  Cell.NumberValue := Value;
  FCells[RC] := Cell;
end;

function TSheet.EncodeFormula(F: string; CellType: TCellType; RC: integer; FormatIndex: word; IsOOC: boolean): TFormulaCell;
var
  Buf: PByteArray;
  Size: integer;
begin
  if Copy(F,1,1) = '=' then
    raise Exception.Create('A formula can not start with "="');
  Result := Nil;
  GetMem(Buf,TXLSReadWriteII2(TSheets(Collection).FOwner).MaxBuffSize);
  try
    Size := TXLSReadWriteII2(TSheets(Collection).FOwner).FormulaHandler.EncodeFormula(F,0,Buf,TXLSReadWriteII2(TSheets(Collection).FOwner).MaxBuffSize,IsOOC);
    case CellType of
      ctNumberFormula:  Result := TNumberFormulaCell.Create(RC,FFormats,FormatIndex,Buf,Size,Size);
      ctStringFormula:  Result := TStringFormulaCell.Create(RC,FFormats,FormatIndex,Buf,Size,Size);
      ctBooleanFormula: Result := TBooleanFormulaCell.Create(RC,FFormats,FormatIndex,Buf,Size,Size);
      ctErrorFormula:   Result := TErrorFormulaCell.Create(RC,FFormats,FormatIndex,Buf,Size,Size);
      else
        raise Exception.Create('Invalid Formula cell type');
    end
  finally
    FreeMem(Buf);
  end;
end;

procedure TSheet.SetAsFormula(Col, Row: integer; const Value: string);
begin
  FCells[ColRowToRC(Col,Row)] := EncodeFormula(Value,ctNumberFormula,ColRowToRC(Col,Row),GetDefaultFormat(Col,Row),False);
end;

procedure TSheet.SetAsFormulaOOC(Col, Row: integer; const Value: string);
begin
  FCells[ColRowToRC(Col,Row)] := EncodeFormula(Value,ctNumberFormula,ColRowToRC(Col,Row),GetDefaultFormat(Col,Row),True);
end;

function TSheet.GetAsBoolFormulaValue(Col, Row: integer): boolean;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if (Cell <> Nil) and (Cell is TBooleanFormulaCell) then
    Result := TBooleanFormulaCell(Cell).BooleanValue
  else
    raise Exception.Create('Cell is missing/is of wrong type');
end;

function TSheet.GetAsNumFormulaValue(Col, Row: integer): double;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if (Cell <> Nil) and (Cell is TNumberFormulaCell) then
    Result := TNumberFormulaCell(Cell).NumberValue
  else
    raise Exception.Create('Cell is missing/is of wrong type');
end;

function TSheet.GetAsStrFormulaValue(Col, Row: integer): WideString;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if (Cell <> Nil) and (Cell is TStringFormulaCell) then
    Result := TStringFormulaCell(Cell).StringValue
  else
    raise Exception.Create('Cell is missing/is of wrong type');
end;

procedure TSheet.SetAsBoolFormulaValue(Col, Row: integer; const Value: boolean);
var
  RC: integer;
  Cell: TCell;
begin
  RC := ColRowToRC(Col,Row);
  Cell := FCells[RC];
  if Cell = Nil then
    raise Exception.Create('Formula cell is missing')
  else begin
    if Cell is TBooleanFormulaCell then
      TBooleanFormulaCell(Cell).BooleanValue := Value
    else if Cell is TFormulaCell then begin
      Cell := TBooleanFormulaCell.Create(Cell.RowCol,FFormats,Cell.FormatIndex,TFormulaCell(Cell).PTGS,TFormulaCell(Cell).DataSize,TFormulaCell(Cell).FormulaSize);
      TBooleanFormulaCell(Cell).BooleanValue := Value;
      Cell.Formats[Cell.FormatIndex].IncUsageCount;
      FCells.CellsNotChangeFmt[Cell.RowCol] := Cell;
    end
    else
      raise Exception.Create('Formula cell is not boolean')
  end;
end;

procedure TSheet.SetAsNumFormulaValue(Col, Row: integer;  const Value: double);
var
  RC: integer;
  Cell: TCell;
begin
  RC := ColRowToRC(Col,Row);
  Cell := FCells[RC];
  if Cell = Nil then
    raise Exception.Create('Formula cell is missing')
  else begin
    if Cell is TNumberFormulaCell then
      TNumberFormulaCell(Cell).NumberValue := Value
    else if Cell is TFormulaCell then begin
      Cell := TNumberFormulaCell.Create(Cell.RowCol,FFormats,Cell.FormatIndex,TFormulaCell(Cell).PTGS,TFormulaCell(Cell).DataSize,TFormulaCell(Cell).FormulaSize);
      TNumberFormulaCell(Cell).NumberValue := Value;
      Cell.Formats[Cell.FormatIndex].IncUsageCount;
      FCells.CellsNotChangeFmt[Cell.RowCol] := Cell;
    end
    else
      raise Exception.Create('Formula cell is not numeric')
  end;
end;

procedure TSheet.SetAsStrFormulaValue(Col, Row: integer;  const Value: WideString);
var
  RC: integer;
  Cell: TCell;
begin
  RC := ColRowToRC(Col,Row);
  Cell := FCells[RC];
  if Cell = Nil then
    raise Exception.Create('Formula cell is missing')
  else begin
    if Cell is TStringFormulaCell then
      TStringFormulaCell(Cell).StringValue := Value
    else if Cell is TFormulaCell then begin
//      FCells.CellsNotChangeFmt[Cell.RowCol] := TErrorFormulaCell.Create(Cell.RowCol,FFormats,Cell.FormatIndex,TFormulaCell(Cell).PTGS,TFormulaCell(Cell).Size)
      Cell := TStringFormulaCell.Create(Cell.RowCol,FFormats,Cell.FormatIndex,TFormulaCell(Cell).PTGS,TFormulaCell(Cell).DataSize,TFormulaCell(Cell).FormulaSize);
      TStringFormulaCell(Cell).StringValue := Value;
      Cell.Formats[Cell.FormatIndex].IncUsageCount;
      FCells.CellsNotChangeFmt[Cell.RowCol] := Cell;
    end
    else
      raise Exception.Create('TODO, create a formula string cell')
  end;
end;

procedure TSheet.SetAsErrFormulaValue(Col, Row: integer;  const Value: TCellError);
var
  RC: integer;
  Cell: TCell;
begin
  RC := ColRowToRC(Col,Row);
  Cell := FCells[RC];
  if Cell = Nil then
    raise Exception.Create('Formula cell is missing')
  else begin
    if Cell is TErrorFormulaCell then
      TErrorFormulaCell(Cell).ErrorValue := Value
    else if Cell is TFormulaCell then begin
      Cell := TErrorFormulaCell.Create(Cell.RowCol,FFormats,Cell.FormatIndex,TFormulaCell(Cell).PTGS,TFormulaCell(Cell).DataSize,TFormulaCell(Cell).FormulaSize);
      TErrorFormulaCell(Cell).ErrorValue := Value;
      Cell.Formats[Cell.FormatIndex].IncUsageCount;
      FCells.CellsNotChangeFmt[Cell.RowCol] := Cell;
    end
    else
      raise Exception.Create('TODO, create a formula error cell')
  end;
end;

function TSheet.GetCellAlignment(Cell: TCell): TCellHorizAlignment;
begin
  if Cell.HorizAlignment = chaGeneral then begin
    case Cell.CellType of
      ctInteger:       Result := chaRight;
      ctFloat:         Result := chaRight;
      ctString:        Result := chaLeft;
      ctBoolean:       Result := chaCenter;
      ctError:         Result := chaCenter;
      ctNumberFormula: Result := chaRight;
      ctStringFormula: Result := chaLeft;
      ctBooleanFormula:Result := chaLeft;
      ctErrorFormula:  Result := chaCenter;
      else
        Result := chaLeft;
    end;
  end
  else
    Result := Cell.HorizAlignment;
end;

procedure TSheet.PaintCell(Canvas: TCanvas; ARect: TRect; ACol, ARow: integer);
const
  HMARG = 1;
var
  Cell,C: TCell;
  S: string;
  R: TRect;
  TW,Top,W: integer;
  Col: integer;
  NoteMark: array[0..2] of TPoint;

procedure PaintEmpty;
begin
  Canvas.Pen.Style := psClear;
  Canvas.Brush.Color := clWhite;
  Canvas.Rectangle(R.Left + 1,R.Top + 1,R.Right,R.Bottom);
  Canvas.Pen.Style := psSolid;
end;

procedure SetFont;
begin
  Cell.CopyToTFont(Canvas.Font);
end;

procedure PaintBorder(BStyle: TCellBorderStyle; BColor: TExcelColor; X1,Y1,X2,Y2: integer);
begin
  if (BStyle <> cbsNone) and (BColor = xcAutomatic) then
    BColor := xcBlack;
  case BStyle of
    cbsNone:
      Exit;
    cbsThin: begin
      Canvas.Pen.Width := 1;
      Canvas.Pen.Style := psSolid;
    end;
    cbsMedium: begin
      Canvas.Pen.Width := 2;
      Canvas.Pen.Style := psSolid;
    end;
    cbsDashed: begin
      Canvas.Pen.Width := 1;
      Canvas.Pen.Style := psDash;
    end;
    cbsDotted: begin
      Canvas.Pen.Width := 1;
      Canvas.Pen.Style := psDot;
    end;
    cbsThick: begin
      Canvas.Pen.Width := 3;
      Canvas.Pen.Style := psSolid;
    end;
    cbsDouble: begin
      Canvas.Pen.Width := 1;
      Canvas.Pen.Style := psSolid;
    end;
    cbsHair: begin
      Canvas.Pen.Width := 1;
      Canvas.Pen.Style := psSolid;
    end;
    cbsMediumDashed: begin
      Canvas.Pen.Width := 2;
      Canvas.Pen.Style := psDash;
    end;
    cbsDashDot: begin
      Canvas.Pen.Width := 1;
      Canvas.Pen.Style := psDashDot;
    end;
    cbsMediumDashDot: begin
      Canvas.Pen.Width := 2;
      Canvas.Pen.Style := psDashDot;
    end;
    cbsDashDotDot: begin
      Canvas.Pen.Width := 1;
      Canvas.Pen.Style := psDashDotDot;
    end;
    cbsMediumDashDotDot: begin
      Canvas.Pen.Width := 2;
      Canvas.Pen.Style := psDashDotDot;
    end;
    cbsSlantedDashDot: begin
      Canvas.Pen.Width := 1;
      Canvas.Pen.Style := psDashDot;
    end;
  end;
  Canvas.Pen.Color := ExcelColorPalette[Integer(BColor)];
  Canvas.MoveTo(X1,Y1);
  Canvas.LineTo(X2,Y2);
end;

procedure PaintBorders;
begin
  if Cell.FormatIndex <= 0 then begin
    Canvas.Brush.Color := clSilver;
    Canvas.FrameRect(R);
  end
  else begin
    PaintBorder(Cell.BorderTopStyle,Cell.BorderTopColor,R.Left,R.Top,R.Right,R.Top);
    PaintBorder(Cell.BorderBottomStyle,Cell.BorderBottomColor,R.Left,R.Bottom - 1,R.Right,R.Bottom - 1);
    PaintBorder(Cell.BorderLeftStyle,Cell.BorderLeftColor,R.Left,R.Top,R.Left,R.Bottom);
    PaintBorder(Cell.BorderRightStyle,Cell.BorderRightColor,R.Right - 1,R.Top,R.Right - 1,R.Bottom);
  end;
end;

begin
  R := Rect(ARect.Left - 1,ARect.Top - 1,ARect.Right + 1,ARect.Bottom + 1);
  Cell := GetCell(ACol,ARow);
  if Cell = Nil then begin
    PaintEmpty;
    Exit;
  end;

  Canvas.Brush.Color := ExcelColorPalette[Integer(Cell.FillPatternForeColor)];;
  if Cell.CellType <> ctBlank then begin
    SetFont;

    Top := 0;
    S := GetFmtAsString(ACol,ARow);
    TW := Canvas.TextWidth(S);
  //  Canvas.Pen
  //  Canvas.Pen.Color := clBlue;
  //  Canvas.Rectangle(R);
  //  Inc(ARect.Top);

    if Cell.FillPatternPattern <> fpNone then begin
      Inc(ARect.Right);
      Inc(ARect.Bottom);
    end;
    if (Cell.CellType in TNumCellType) and (TW > (ARect.Right - ARect.Left - HMARG * 2)) then
      Canvas.TextRect(ARect,ARect.Left + HMARG,ARect.Top,S)
    else begin
      case Cell.VertAlignment of
        cvaTop:     Top := ARect.Top;
        cvaCenter:  Top := ARect.Top + ((ARect.Bottom - ARect.Top) div 2) - (Canvas.TextHeight(S) div 2);
        cvaBottom:  Top := ARect.Bottom - Canvas.TextHeight(S) - 1;
        cvaJustify: Top := ARect.Top;
      end;
      case GetCellAlignment(Cell) of
        chaLeft: begin
          Col := ACol + 1;
          while ((ARect.Right - ARect.Left) < TW) and (Col <= 255) do begin
            C := FCells.Cells[ColRowToRC(Col,ARow)];
            if C <> Nil then
              Break;
            W := (Canvas.TextWidth('A') * FColumns.GetColWidth(Col)) div 256;
            Inc(ARect.Right,W);
          end;
          Canvas.TextRect(ARect,ARect.Left + HMARG,Top - 1,S);
        end;
        chaCenter:       Canvas.TextRect(ARect,ARect.Left + (ARect.Right - ARect.Left) div 2 - TW div 2,Top,S);
        chaRight:        Canvas.TextRect(ARect,ARect.Right - HMARG - TW,Top,S);
        chaFill:         Canvas.TextRect(ARect,ARect.Left + HMARG,Top - 1,S);
        chaJustify:      Canvas.TextRect(ARect,ARect.Left + HMARG,Top - 1,S);
        chaCenterAcross: Canvas.TextRect(ARect,ARect.Left + HMARG,Top - 1,S);
      end;
    end;
  end
  else begin
    Canvas.FillRect(R);
  end;
  if FDrawingObjects.Notes.FindByColRow(ACol,ARow) >= 0 then begin
    Canvas.Pen.Color := clRed;
    Canvas.Brush.Color := clRed;
    NoteMark[0].X := R.Right - 6;
    NoteMark[0].Y := R.Top;
    NoteMark[1].X := R.Right - 1;
    NoteMark[1].Y := R.Top;
    NoteMark[2].X := R.Right - 1;
    NoteMark[2].Y := R.Top + 5;
    Canvas.Polygon(NoteMark);
  end;
  PaintBorders;
  Canvas.Pen.Width := 1;
end;

procedure TSheet.AutoSizeCell(Col,Row: integer; SizeCol,SizeRow: boolean);
var
  C: TCell;
  W,H: integer;
  TM: TEXTMETRIC;
  XLS: TXLSReadWriteII2;
  Canvas: TCanvas;
begin
  C := GetCell(Col,Row);
  if (C = Nil) or (C.CellType = ctBlank) then
    Exit;
  Canvas := TCanvas.Create;
  try
    XLS := TXLSREadWriteII2(TSheets(Collection).FOwner);
    Canvas.Handle := GetDC(GetDesktopWindow());
    XLS.Fonts[C.FontIndex].CopyToTFont(Canvas.Font);
    GetTextMetrics(Canvas.Handle,TM);
    if SizeCol then begin
      if C.Rotation in [90,180,255] then
        W := Canvas.TextHeight(self.GetFmtAsString(Col,C.RowCol shr 8)) + (TM.tmInternalLeading * 2)
      else
        W := Canvas.TextWidth(GetFmtAsString(Col,C.RowCol shr 8)) + (TM.tmInternalLeading * 2);
      if GetCellAlignment(C) = chaRight then
        Inc(W,TM.tmInternalLeading);
      if W > 0 then
        FColumns.SetColWidth(Col,Col,Round(((W) / Canvas.TextWidth('0')) * 256));
    end;
    if SizeRow then begin
      if C.Rotation in [90,180,255] then
        H := Canvas.TextWidth(self.GetFmtAsString(C.RowCol and $000000FF,Row)) + (TM.tmInternalLeading * 2)
      else
        H := TM.tmHeight + 1;
      if H > 0 then
        FRows.SetRowHeight(Row,Row,Round((H / (Canvas.Font.PixelsPerInch / 72)) * 20));
    end;
  finally
    ReleaseDC(GetDesktopWindow(),Canvas.Handle);
    Canvas.Free;
  end;
end;

function TSheet.AutoHeightRow(Row: integer): integer;
var
  H: integer;
  TM: TEXTMETRIC;
  CurrFont: TXFont;
  XLS: TXLSReadWriteII2;
  Canvas: TCanvas;
  C: TCell;
begin
  H := 0;
  XLS := TXLSREadWriteII2(TSheets(Collection).FOwner);
  Canvas := TCanvas.Create;
  try
    Canvas.Handle := GetDC(GetDesktopWindow());
    CurrFont := XLS.Font;
    XLS := TXLSReadWriteII2(TSheets(Collection).FOwner);
    XLS.Font.CopyToTFont(Canvas.Font);
    GetTextMetrics(Canvas.Handle,TM);
    Result := 0;
    FCells.BeginIterate;
    repeat
      C := FCells.GetNext;
      if (C <> Nil) and (Integer(C.RowCol shr 8) = Row) then begin
        if C.FontIndex <> CurrFont.Index then begin
          CurrFont := XLS.Fonts[C.FontIndex];
          CurrFont.CopyToTFont(Canvas.Font);
          GetTextMetrics(Canvas.Handle,TM);
        end;
        // Vertical
        if C.Rotation in [90,180,255] then
          H := Canvas.TextWidth(self.GetFmtAsString(C.RowCol and $000000FF,Row)) + (TM.tmInternalLeading * 2)
        else
          H := TM.tmHeight + 1{ + TM.tmInternalLeading};

        if H > Result then
          Result := H;
      end;
    until (C = Nil);
    if Result > 0 then begin
      XLS.Font.CopyToTFont(Canvas.Font);
      FRows.SetRowHeight(Row,Row,Round((H / (Canvas.Font.PixelsPerInch / 72)) * 20));
    end;
  finally
    ReleaseDC(GetDesktopWindow(),Canvas.Handle);
    Canvas.Free;
  end;
end;

procedure TSheet.AutoHeightRows(Row1,Row2: integer);
var
  i: integer;
begin
  for i := Row1 to Row2 do
    AutoHeightRow(i);
end;

function TSheet.AutoWidthCol(Col: longword): integer;
var
  W: integer;
  TM: TEXTMETRIC;
  CurrFont: TXFont;
  XLS: TXLSReadWriteII2;
  Canvas: TCanvas;
  C: TCell;
//  CF: TXLSColumn;
begin
  XLS := TXLSREadWriteII2(TSheets(Collection).FOwner);
  Canvas := TCanvas.Create;
  try
    Canvas.Handle := GetDC(GetDesktopWindow());
    CurrFont := XLS.Font;
    XLS := TXLSReadWriteII2(TSheets(Collection).FOwner);
    XLS.Font.CopyToTFont(Canvas.Font);
    GetTextMetrics(Canvas.Handle,TM);
    Result := 0; // DefaultColWidth * Canvas.TextWidth('0');
    FCells.BeginIterate;
    repeat
      C := FCells.GetNext;
      if (C <> Nil) and ((C.RowCol and $000000FF) = Col) then begin
        if C.FontIndex <> CurrFont.Index then begin
          CurrFont := XLS.Fonts[C.FontIndex];
          CurrFont.CopyToTFont(Canvas.Font);
          GetTextMetrics(Canvas.Handle,TM);
        end;
        // Vertical
        if C.Rotation in [90,180,255] then
          W := Canvas.TextHeight(self.GetFmtAsString(Col,C.RowCol shr 8)) + (TM.tmInternalLeading * 2)
        else
          W := Canvas.TextWidth(GetFmtAsString(Col,C.RowCol shr 8)) + (TM.tmInternalLeading * 2);

        if GetCellAlignment(C) = chaRight then
          Inc(W,TM.tmInternalLeading);
        if W > Result then
          Result := W;
      end;
    until (C = Nil);
    if Result > 0 then begin
      XLS.Font.CopyToTFont(Canvas.Font);
      FColumns.SetColWidth(Col,Col,Round(((Result) / Canvas.TextWidth('0')) * 256));
    end;
  finally
    ReleaseDC(GetDesktopWindow(),Canvas.Handle);
    Canvas.Free;
  end;
end;

procedure TSheet.AutoWidthCols(Col1,Col2: longword);
var
  i: integer;
begin
  for i := Col1 to Col2 do
    AutoWidthCol(i);
end;

function TSheet.XCalculate(Col, Row: integer; NowCalc: TCellRefArray): TFormulaValue;
var
  Cell: TCell;
begin
  Cell := GetCell(Col,Row);
  if (Cell <> Nil) and (Cell is TFormulaCell) then begin
    Result := CalculateFmla(TXLSReadWriteII2(TSheets(Collection).FOwner),TFormulaCell(Cell).PTGS,TFormulaCell(Cell).FormulaSize,Col,Row,Index,[],NowCalc);
    TFormulaCell(Cell).Calculated := True;
  end
  else
    FVSetError(Result,errNA);
end;

function TSheet.Calculate(Col, Row: integer): Variant;
var
  Cell: TCell;
  NowCalc: TCellRefArray;
begin
  SetLength(NowCalc,0);
  Cell := GetCell(Col,Row);
  if (Cell <> Nil) and (Cell is TFormulaCell) then
    Result := FVGetVariant(CalculateFmla(TXLSReadWriteII2(TSheets(Collection).FOwner),TFormulaCell(Cell).PTGS,TFormulaCell(Cell).FormulaSize,Col,Row,Index,[],NowCalc))
  else
    Result := '';
end;

function TSheet.CalculateEx(Col, Row: integer; CalculateOptions: TCalculateOptions): Variant;
var
  Cell: TCell;
  Res: TFormulaValue;
  NowCalc: TCellRefArray;
begin
  SetLength(NowCalc,0);
  Cell := GetCell(Col,Row);
  if (Cell <> Nil) and (Cell is TFormulaCell) then begin
    Res := CalculateFmla(TXLSReadWriteII2(TSheets(Collection).FOwner),TFormulaCell(Cell).PTGS,TFormulaCell(Cell).FormulaSize,Col,Row,Index,CalculateOptions,NowCalc);
    case Res.ValType of
      fvFloat   : SetAsNumFormulaValue(Col,Row,Res.vFloat);
      fvBoolean : SetAsBoolFormulaValue(Col,Row,Res.vBoolean);
      fvError   : SetAsErrFormulaValue(Col,Row,Res.vError);
      fvString  : SetAsStrFormulaValue(Col,Row,Res.vString);
      else
        raise Exception.Create('Illegal result of calculation');
    end;
    Result := FVGetVariant(Res);
    TFormulaCell(Cell).Calculated := True;
  end
  else
    Result := '';
end;

procedure TSheet.CalculateSheet;
var
  V: TFormulaValue;
  Cell: TCell;
  Col,Row: integer;
  NowCalc: TCellRefArray;
begin
  SetLength(NowCalc,0);
  FCells.Calculated(False);
  FCells.BeginIterate;
  Cell := FCells.GetNext;
  while Cell <> Nil do begin
    if Cell.CellType in TFormulaCellType then begin
      SplitRC(Cell.RowCol,Col,Row);
      try
        V := CalculateFmla(TXLSReadWriteII2(TSheets(Collection).FOwner),TFormulaCell(Cell).PTGS,TFormulaCell(Cell).FormulaSize,Col,Row,Index,[],NowCalc);
        case V.ValType of
          fvFloat   : SetAsNumFormulaValue(Col,Row,V.vFloat);
          fvBoolean : SetAsBoolFormulaValue(Col,Row,V.vBoolean);
          fvError   : SetAsErrFormulaValue(Col,Row,V.vError);
          fvString  : SetAsStrFormulaValue(Col,Row,V.vString);
          else
            raise Exception.Create('Illegal result of calculation');
        end;
        TFormulaCell(Cell).Calculated := True;
      except
        on E: Exception do
          raise Exception.CreateFmt('Calculate error on cell %s!%s (%d:%d:%d)' + #13 + '"%s"',[FName,ColRowToRefStr(Col,Row,False,False),Index,Col,Row,E.Message]);
      end;
    end;
    Cell := FCells.GetNext;
  end;
end;

procedure TSheet.Calculated(IsCalculated: boolean);
begin
  FCells.Calculated(IsCalculated);
end;

procedure TSheet.CalcDimensions;
begin
  FCells.CalcDimensions;
  FirstCol := FCells.FirstCol;
  LastCol := FCells.LastCol;
  FirstRow := FCells.FirstRow;
  LastRow := FCells.LastRow;
end;

procedure TSheet.CalcDimensionsEx;
begin
  FCells.CalcDimensionsEx;
  FirstCol := FCells.FirstCol;
  LastCol := FCells.LastCol;
  FirstRow := FCells.FirstRow;
  LastRow := FCells.LastRow;
end;

procedure TSheet.OnEscherReadShape(Sender: TObject; Shape: TShape);
begin
  if Shape is TShapeClientAnchor then begin
    case Shape.ShapeType of
      msosptTextBox: begin
        if Shape.ExShape is TShapeOutsideMsoNote then
          FDrawingObjects.Notes.AddFromFile(TShapeClientAnchor(Shape))
        else
          FDrawingObjects.Texts.AddFromFile(TShapeClientAnchor(Shape));
      end;
      msosptHostControl: begin
        if Shape.ExShape <> Nil then begin
          if Shape.ExShape is TShapeControlComboBox then
            FControlObjects.ComboBoxes.AddFromFile(TShapeClientAnchor(Shape))
          else if Shape.ExShape is TShapeControlListBox then
            FControlObjects.ListBoxes.AddFromFile(TShapeClientAnchor(Shape))
          else if Shape.ExShape is TShapeControlButton then
            FControlObjects.Buttons.AddFromFile(TShapeClientAnchor(Shape))
          else if Shape.ExShape is TShapeControlCheckbox then
            FControlObjects.Checkboxes.AddFromFile(TShapeClientAnchor(Shape))
          else if Shape.ExShape is TShapeOutsideMsoChart then
            FCharts.AddFromFile(TShapeClientAnchor(Shape));
        end;
      end;
      msosptPictureFrame: begin
        FDrawingObjects.Pictures.AddFromFile(TShapeClientAnchor(Shape));
      end;
    end;
  end;
end;

function TSheet.AddChart: TDrwChart;
begin
  Result := FCharts.Add(Index);
end;

function TSheet.GetAsFormulaValue(Col, Row: integer): TFormulaValue;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if Cell <> Nil then begin
    case Cell.CellType of
      ctNone,
      ctBlank:          FVSetError(Result,errNA);
      ctInteger:        FVSetFloat(Result,TIntegerCell(Cell).Value);
      ctFloat:          FVSetFloat(Result,TFloatCell(Cell).Value);
      ctString:         FVSetString(Result,FCells.SST[TStringCell(Cell).Value]);
      ctBoolean:        FVSetBoolean(Result,TBooleanCell(Cell).Value);
      ctError:          FVSetError(Result,TErrorCell(Cell).Value);
      ctNumberFormula:  FVSetFloat(Result,TNumberFormulaCell(Cell).NumberValue);
      ctStringFormula:  FVSetString(Result,TStringFormulaCell(Cell).StringValue);
      ctBooleanFormula: FVSetBoolean(Result,TBooleanFormulaCell(Cell).BooleanValue);
      ctErrorFormula:   FVSetError(Result,TErrorFormulaCell(Cell).ErrorValue);
    end;
  end
  else
    FVSetError(Result,errNA);
end;

procedure TSheet.SetAsFormulaValue(Col, Row: integer; const Value: TFormulaValue);
begin
  case Value.ValType of
    fvFloat   : SetAsFloat(Col,Row,Value.vFloat);
    fvBoolean : SetAsBoolean(Col,Row,Value.vBoolean);
    fvError   : SetAsError(Col,Row,Value.vError);
    fvString  : SetAsString(Col,Row,Value.vString);
    fvRef,
    fvArea,
    fvExtRef,
    fvExtArea:
      raise Exception.Create('Ref/Area can not be assigned to a cell');
  end;
end;

procedure TSheet.ColFormatChange(Format: TCellFormat; Col: integer);
var
  Row: integer;
  Cell: TCell;
begin
  for Row := GetFirstRow to GetLastRow do begin
    Cell := GetCell(Col,Row);
    if Cell <> Nil then
      Cell.AssignFormat(Format);
  end;
end;

procedure TSheet.RowFormatChange(Format: TCellFormat; Row: integer);
var
  Col: integer;
  Cell: TCell;
begin
  for Col := GetFirstCol to GetLastCol do begin
    Cell := GetCell(Col,Row);
    if Cell <> Nil then
      Cell.AssignFormat(Format);
  end;
end;

function TSheet.GetAsRichText(Col, Row: integer): string;
var
  Stream: TStringStream;
begin
  Stream := TStringStream.Create('');
  try
    RichTextSaveToStream(Col,Row,Stream);
    Stream.Seek(0,soFromBeginning);
    Result := Stream.ReadString(MAXINT);
  finally
    Stream.Free;
  end;
end;

procedure TSheet.SetAsRichText(Col, Row: integer; const Value: string);
var
  Stream: TStringStream;
begin
  Stream := TStringStream.Create(Value);
  try
    RichTextLoadFromStream(Col,Row,Stream);
  finally
    Stream.Free;
  end;
end;

procedure TSheet.RichTextLoadFromFile(Col, Row: integer; Filename: WideString; AllText: boolean = True);
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(Filename,fmOpenRead);
  try
    RichTextLoadFromStream(Col,Row,Stream,AllText);
  finally
    Stream.Free;
  end;
end;

procedure TSheet.RichTextSaveToStream(Col, Row: integer; Stream: TStream);
var
  i: integer;
  Cell: TCell;
  RTF: TRTFWriter;
  Fnt: TIndexFont;
  XLSString: PXLSString;
  SST: TSST2;
begin
  Cell := GetCell(Col,Row);
  if Cell= Nil then
    raise Exception.Create('Empty cell');
  RTF := TRTFWriter.Create;
  try
    Fnt := RTF.FontRuns.AddFont;
    Fnt.Index := 0;
    Cell.CopyToTFont(TFont(Fnt));
    if Cell.CellType = ctString then begin
      SST := FCells.SST;
      XLSString := TStringCell(Cell).Value;
      if SST.IsFormatted[XLSString] then begin
        for i := 0 to SST.FormatCount[XLSString] - 1 do begin
          Fnt := RTF.FontRuns.AddFont;
          SST.Font[XLSString,i].Font.CopyToTFont(TFont(Fnt));
          Fnt.Index := SST.Font[XLSString,i].Index;
        end;
      end;
      RTF.Text := SST.Items[XLSString];
    end
    else begin
      RTF.Text := GetFmtAsString(Col,Row);
    end;
    RTF.SaveToStream(Stream);
  finally
    RTF.Free;
  end;
end;

procedure TSheet.RichTextSaveToFile(Col, Row: integer; Filename: WideString);
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(Filename,fmCreate);
  try
    RichTextSaveToStream(Col,Row,Stream);
  finally
    Stream.Free;
  end;
end;

procedure TSheet.RichTextLoadFromStream(Col, Row: integer; Stream: TStream; AllText: boolean = True);
var
  RTF: TRTFReader;
  XLSString: PXLSString;
  Cell: TStringCell;
begin
  RTF := TRTFReader.Create;
  try
    RTF.IncludeAllText := AllText;
    RTF.LoadFromStream(Stream);
    if Length(RTF.Text) > MAX_EXCEL_STRSZ then
      raise Exception.Create('Rich text string to long.');
    XLSString := FCells.SST.AddRichString(RTF.Text,RTF.FontRuns);
    Cell := TStringCell.Create(ColRowToRC(Col,Row),FFormats,GetDefaultFormat(Col,Row),XLSString);
    if WCPos(WideChar($000A),RTF.Text) > 0 then
      Cell.FormatOptions := [foWrapText];
    if RTF.FontRuns.Count > 0 then
      Cell.AssignFont(TFont(RTF.FontRuns[0]));
    FCells[ColRowToRC(Col,Row)] := Cell;
  finally
    RTF.Free;
  end;
end;

procedure TSheet.CopyToRichEdit(Col, Row: integer; var RichEdit: TRichEdit);
type TRichText = record
   text: WideString;
   color: TColor;
   font: TFont;
 end;

var
  i,p: integer;
  pXS: PXLSString;
  S,S2: WideString;
  Cell: TCell;
  y: TRichText;
  Fnt: TFont;

procedure RichAdd(y:TRichText; start:integer; out z:TRichEdit);
 begin
  z.SelStart:=start;
  z.SelLength:=length(y.text);
  z.SelText:=y.text;
  if(y.color<>TColor(nil))then
   begin
   z.SelStart:=start;
   z.SelLength:=length(y.text);
   z.SelAttributes.Color:=y.color;
   end;
  if(y.font<>TFont(nil))then
   begin
   z.SelStart:=start;
   z.SelLength:=length(y.text);
   z.SelAttributes.Assign(y.font);
   end;
  z.SelStart:=0;
 end;

begin
  p := 1;
  Cell := FCells[ColRowToRC(Col,Row)];
  Fnt := TFont.Create;
  RichEdit.Text:='';
  if Cell <> Nil then begin
    if Cell.CellType = ctString then begin
      if FCells.SST.IsFormatted[TStringCell(Cell).Value] then begin
        pXS := TStringCell(Cell).Value;
        p := 1;
        S := FCells.SST[pXS];
        Cell.CopyToTFont(Fnt);
        for i := 0 to FCells.SST.FormatCount[pXS] - 1 do begin
          S2 := Copy(S,p,FCells.SST.Font[pXS,i].Index - p + 1);
          if S2 <> '' then begin
            y.text:=S2;
            y.font:=fnt;
            y.color:=fnt.Color;
            RichAdd(y,p-1,RichEdit);
            FCells.SST.Font[pXS,i].Font.CopyToTFont(Fnt);
          end;
          p := FCells.SST.Font[pXS,i].Index + 1;
        end;
        S2 := Copy(S,p,MAXINT);
        if S2 <> '' then begin
          y.text:=S2;
          y.font:=fnt;
          y.color:=fnt.Color;
          RichAdd(y,p-1,RichEdit);
        end;
      end
      else begin
        y.text:=GetFmtAsString(Col,Row);
        Cell.CopyToTFont(Fnt);
        y.font:=fnt;
        y.color:=fnt.Color;
        RichAdd(y,p-1,RichEdit);
       end;
    end
    else begin
      y.text:=GetFmtAsString(Col,Row);
      Cell.CopyToTFont(Fnt);
      y.font:=fnt;
      y.color:=fnt.Color;
      RichAdd(y,p-1,RichEdit);
    end;
  end;
  Fnt.Free;
end;

procedure TSheet.ClearWorksheet;
begin
  CalcDimensions;
  DeleteCells(FirstCol,FirstRow,LastCol,LastRow);
  FHyperlinks.Clear;
  FRows.Clear;
  FColumns.Clear;
end;

function TSheet.GetAsBlankRef(ARef: WideString): boolean;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsBlank(Col,Row);
end;

function TSheet.GetAsBooleanRef(ARef: WideString): boolean;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsBoolean(Col,Row);
end;

function TSheet.GetAsBoolFormulaValueRef(ARef: WideString): boolean;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsBoolFormulaValue(Col,Row);
end;

function TSheet.GetAsErrorRef(ARef: WideString): TCellError;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsError(Col,Row);
end;

function TSheet.GetAsFloatRef(ARef: WideString): double;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsFloat(Col,Row);
end;

function TSheet.GetAsFormulaRef(ARef: WideString): string;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsFormula(Col,Row);
end;

function TSheet.GetAsHTMLRef(ARef: WideString): string;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsHTML(Col,Row);
end;

function TSheet.GetAsIntegerRef(ARef: WideString): integer;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsInteger(Col,Row);
end;

function TSheet.GetAsNumFormulaValueRef(ARef: WideString): double;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsNumFormulaValue(Col,Row);
end;

function TSheet.GetAsRichTextRef(ARef: WideString): string;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsRichText(Col,Row);
end;

function TSheet.GetAsStrFormulaValueRef(ARef: WideString): WideString;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsStrFormulaValue(Col,Row);
end;

function TSheet.GetAsStringRef(ARef: WideString): WideString;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsString(Col,Row);
end;

function TSheet.GetAsVariantRef(ARef: WideString): Variant;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsVariant(Col,Row);
end;

function TSheet.GetFmtAsStringRef(ARef: WideString): WideString;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetFmtAsString(Col,Row);
end;

procedure TSheet.SetAsBlankRef(ARef: WideString; const Value: boolean);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsBlank(Col,Row,Value);
end;

procedure TSheet.SetAsBooleanRef(ARef: WideString; const Value: boolean);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsBoolean(Col,Row,Value);
end;

procedure TSheet.SetAsBoolFormulaValueRef(ARef: WideString; const Value: boolean);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsBoolFormulaValue(Col,Row,Value);
end;

procedure TSheet.SetAsErrorRef(ARef: WideString; const Value: TCellError);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsError(Col,Row,Value);
end;

procedure TSheet.SetAsFloatRef(ARef: WideString; const Value: double);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsFloat(Col,Row,Value);
end;

procedure TSheet.SetAsFormulaRef(ARef: WideString; const Value: string);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsFormula(Col,Row,Value);
end;

procedure TSheet.SetAsIntegerRef(ARef: WideString; const Value: integer);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsInteger(Col,Row,Value);
end;

procedure TSheet.SetAsNumFormulaValueRef(ARef: WideString; const Value: double);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsNumFormulaValue(Col,Row,Value);
end;

procedure TSheet.SetAsRichTextRef(ARef: WideString; const Value: string);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsRichText(Col,Row,Value);
end;

procedure TSheet.SetAsStrFormulaValueRef(ARef: WideString; const Value: WideString);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsStrFormulaValue(Col,Row,Value);
end;

procedure TSheet.SetAsStringRef(ARef: WideString; const Value: WideString);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsString(Col,Row,Value);
end;

procedure TSheet.SetAsVariantRef(ARef: WideString; const Value: Variant);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsVariant(Col,Row,Value);
end;

function TSheet.GetAsDateTime(Col, Row: integer): TDateTime;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if (Cell <> Nil) then begin
    if Cell is TFloatCell then
      Result := TFloatCell(Cell).Value
    else if Cell is TIntegerCell then
      Result := TIntegerCell(Cell).Value
    else if Cell is TNumberFormulaCell then
      Result := TNumberFormulaCell(Cell).NumberValue
    else
      Result := 0;
  end
  else
    Result := 0;
end;

procedure TSheet.SetAsDateTime(Col, Row: integer; const Value: TDateTime);
var
  p: integer;
  STF: WideString;
begin
  FCells[ColRowToRC(Col,Row)] := TFloatCell.Create(ColRowToRC(Col,Row),FFormats,GetDefaultFormat(Col,Row),Value);
  // Windows and Excel don't have 100% compatible time format strings;
  // Excel requires a slash (/) between AM/PM, but windows don't have it.
  p := Pos('ampm',Lowercase(ShortTimeFormat));
  if p > 0 then
    STF := Copy(ShortTimeFormat,1,p + 1) + '/' + Copy(ShortTimeFormat,p + 2,MAXINT)
  else
    STF := ShortTimeFormat;
  if (Int(Value) > 0) and (Frac(Value) > 0) then
    FCells[ColRowToRC(Col,Row)].NumberFormat := ShortDateFormat + ' ' + STF
  else if Int(Value) > 0 then
    FCells[ColRowToRC(Col,Row)].NumberFormat := ShortDateFormat
  else if Frac(Value) > 0 then
    FCells[ColRowToRC(Col,Row)].NumberFormat := STF;

end;

function TSheet.GetAsDateTimeRef(ARef: WideString): TDateTime;
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  Result := GetAsDateTime(Col,Row);
end;

procedure TSheet.SetAsDateTimeRef(ARef: WideString; const Value: TDateTime);
var
  Col,Row: integer;
begin
  RefStrToColRow(ARef,Col,Row);
  SetAsDateTime(Col,Row,Value);
end;

procedure TSheet.Assign(Source: TPersistent);
begin
  if not (Source is TSheet) then
    raise Exception.Create('Object is not TSheet');
  DefaultColWidth := TSheet(Source).DefaultColWidth;
  DefaultRowHeight := TSheet(Source).DefaultRowHeight;
  Options := TSheet(Source).Options;
  WorkspaceOptions := TSheet(Source).WorkspaceOptions;
  SheetProtection := TSheet(Source).SheetProtection;
  Zoom := TSheet(Source).Zoom;
  ZoomPreview := TSheet(Source).ZoomPreview;
  RecalcFormulas := TSheet(Source).RecalcFormulas;
  Hidden := TSheet(Source).Hidden;

  FPrintSettings.Assign(TSheet(Source).FPrintSettings);
  FMergedCells.Assign(TSheet(Source).FMergedCells);
  FHyperlinks.Assign(TSheet(Source).FHyperlinks);
end;

function TSheet.FindText(Text: WideString; CaseInsensitive: boolean = True): boolean;
var
  i: integer;
  S: WideString;
  Cell: TCell;
begin
  if FCurrFindPos >= 1 then
    Inc(FCurrFindPos);
  if CaseInsensitive then
    Text := MyWideUppercase(Text);
  while FCurrFindRow <= FCells.LastRow do begin
    while FCurrFindCol <= FCells.LastCol do begin
      Cell := FCells[ColRowToRC(FCurrFindCol,FCurrFindRow)];
      if (Cell <> Nil) and (Cell is TStringCell) then begin
        S := FCells.SST[TStringCell(Cell).Value];
        if FCurrFindPos >= 1 then
          S := Copy(S,FCurrFindPos,MAXINT);
        if CaseInsensitive then
          S := MyWideUppercase(S);
        i := FCurrFindPos;
        FCurrFindPos := Pos(Text,S);
        Result := FCurrFindPos >= 1;
        if Result then begin
          if i > 0 then
            Inc(FCurrFindPos,i);
          Exit;
        end;
      end;
      FCurrFindPos := -1;
      Inc(FCurrFindCol);
    end;
    FCurrFindCol := FCells.FirstCol;
    Inc(FCurrFindRow);
  end;
  Result := False;
end;

procedure TSheet.BeginFindText;
begin
  FCells.CalcDimensionsEx;
  FCurrFindPos := -1;
  FCurrFindCol := FCells.FirstCol;
  FCurrFindRow := FCells.FirstRow;
end;

procedure TSheet.GetFindData(var Col, Row, TextPos: integer; var Text: WideString);
var
  Cell: TCell;
begin
  if FCurrFindPos < 1 then
    raise Exception.Create('There is no text found');
  Cell := FCells[ColRowToRC(FCurrFindCol,FCurrFindRow)];
  if (Cell = Nil) or not (Cell is TStringCell) then
    raise Exception.Create('There is no text found');
  Col := FCurrFindCol;
  Row := FCurrFindRow;
  TextPos := FCurrFindPos;
  Text := FCells.SST[TStringCell(Cell).Value];
end;

procedure TSheet.InsertCellList(CellList: TList; RCSrc, RCDst: longword; DeltaCol,DeltaRow: integer);
var
  i: integer;
begin
  for i := 0 to CellList.Count - 1 do begin
    TCell(CellList[i]).RowCol := (TCell(CellList[i]).RowCol - RCSrc) + RCDst;
    FCells.CellsNotChangeFmt[TCell(CellList[i]).RowCol] := CellList[i];
{
    if FCells[TCell(CellList[i]).RowCol] is TFormulaCell then
      AdjustCell(TXLSREadWriteII2(TSheets(Collection).FOwner).Version = xvExcel97,TFormulaCell(CellList[i]).PTGS,TFormulaCell(CellList[i]).Size,DeltaCol,DeltaRow,True,False);
}
  end;
end;

procedure TSheet.DeleteColumns(Col1, Col2: integer);
var
  C,R: integer;
  Cell: TCell;
  CellList: TList;
begin
  if Col1 > Col2 then
    Exit;
  FColumns.DeleteColumns(Col1,Col2);
  DeleteCells(Col1,0,Col2,MAXROW);
  CellList := TList.Create;
  try
    FCells.BeginIterate;
    Cell := FCells.GetNext;
    while Cell <> Nil do begin
      if Cell is TFormulaCell then
        AdjustCell2(TFormulaCell(Cell).PTGS,TFormulaCell(Cell).FormulaSize,Col1,MAXROW,-1,-(Col2 - Col1 + 1),0);
      SplitRC(Cell.RowCol,C,R);
      if C > Col2 then begin
        CellList.Add(FCells[ColRowToRC(C,R)].MakeCopy);
        FCells.SetNil(ColRowToRC(C,R));
      end;
      Cell := FCells.GetNext;
    end;
    InsertCellList(CellList,ColRowToRC(Col2 + 1,0),ColRowToRC(Col1,0),Col2 - Col1,0);

    FEscherDrawing.Move(Col2 + 1,0,MAXCOL,MAXROW,Col1,0);
    FConditionalFormats.MoveLocal(Col2 + 1,0,MAXCOL,MAXROW,Col1,0);
    FValidations.MoveLocal(Col2 + 1,0,MAXCOL,MAXROW,Col1,0);
    FMergedCells.Move(Col2 + 1,0,MAXCOL,MAXROW,Col1 - Col2 - 1,0);
  finally
    CellList.Free;
  end;
end;

procedure TSheet.DeleteRows(Row1, Row2: integer);
var
  C,R: integer;
  Cell: TCell;
  CellList: TList;
begin
  if Row1 > Row2 then
    Exit;
  FRows.DeleteRows(Row1,Row2);
  DeleteCells(0,Row1,MAXCOL,Row2);
  CellList := TList.Create;
  try
    FCells.BeginIterate;
    Cell := FCells.GetNext;
    while Cell <> Nil do begin
      if Cell is TFormulaCell then
        AdjustCell2(TFormulaCell(Cell).PTGS,TFormulaCell(Cell).FormulaSize,MAXCOL,Row1,-1,0,-(Row2 - Row1 + 1));
      SplitRC(Cell.RowCol,C,R);
      if R > Row2 then begin
        CellList.Add(FCells[ColRowToRC(C,R)].MakeCopy);
//        FCells.SetNil(ColRowToRC(C,R));
      end;
      Cell := FCells.GetNext;
    end;
    InsertCellList(CellList,ColRowToRC(0,Row2 + 1),ColRowToRC(0,Row1),0,Row2 - Row1);
    FEscherDrawing.Move(0, Row2 + 1, MAXCOL, MAXROW, 0, Row1);
    FConditionalFormats.MoveLocal(0, Row2 + 1, MAXCOL, MAXROW, 0, Row1);
    FValidations.MoveLocal(0, Row2 + 1, MAXCOL, MAXROW, 0, Row1);
    FMergedCells.Move(0, Row2 + 1, MAXCOL, MAXROW,0,Row1 - Row2 - 1);
  finally
    CellList.Free;
  end;
end;

procedure TSheet.InsertColumns(Col, ColCount: integer);
var
  C,R: integer;
  Cell,DestCell: TCell;
  CellList: TList;
begin
  FColumns.InsertColumns(Col,ColCount);
  DeleteCells(MAXCOL - ColCount + 1,0,MAXCOL,MAXROW);
  CellList := TList.Create;
  try
    FCells.BeginIterate;
    Cell := FCells.GetNext;
    while Cell <> Nil do begin
      if Cell is TFormulaCell then
        AdjustCell2(TFormulaCell(Cell).PTGS,TFormulaCell(Cell).FormulaSize,Col,MAXROW,-1,ColCount,0);
      SplitRC(Cell.RowCol,C,R);
      if C >= Col then begin
        CellList.Add(FCells[ColRowToRC(C,R)].MakeCopy);
        FCells.SetNil(ColRowToRC(C,R));
        Cell.Free;
      end;
      Cell := FCells.GetNext;
    end;
    InsertCellList(CellList,ColRowToRC(Col,0),ColRowToRC(Col + ColCount,0),ColCount,0);
    for R := 0 to MAXROW do begin
      Cell := GetCell(Col - 1,R);
      if (Cell <> Nil) and (Cell.FormatIndex <> DEFAULT_FORMAT) then begin
        for C := Col to Col + ColCount - 1 do begin
          DestCell := TBlankCell.Create(ColRowToRC(C,R),FFormats,DEFAULT_FORMAT);
          DestCell.AssignFormat(Cell.FormatIndex);
          FCells[ColRowToRC(C,R)] := DestCell;
        end;
      end;
    end;
    FEscherDrawing.Move(Col, 0, MAXCOL, MAXROW, Col + ColCount, 0);
    FConditionalFormats.MoveLocal(Col, 0, MAXCOL, MAXROW, Col + ColCount, 0);
    FValidations.MoveLocal(Col, 0, MAXCOL, MAXROW, Col + ColCount, 0);
    FMergedCells.Move(Col, 0, MAXCOL, MAXROW, ColCount, 0);
  finally
    CellList.Free;
  end;
end;

procedure TSheet.InsertRows(Row, RowCount: integer);
var
  C,R: integer;
  Cell,DestCell: TCell;
  CellList: TList;
begin
  FRows.InsertRows(Row,RowCount);
  DeleteCells(0,MAXROW - RowCount + 1,MAXCOL,MAXROW);
  CellList := TList.Create;
  try
    FCells.BeginIterate;
    Cell := FCells.GetNext;
    while Cell <> Nil do begin
      SplitRC(Cell.RowCol,C,R);
      if Cell is TFormulaCell then
        AdjustCell2(TFormulaCell(Cell).PTGS,TFormulaCell(Cell).FormulaSize,MAXCOL,Row,-1,0,RowCount);
      if R >= Row then begin
        CellList.Add(FCells[ColRowToRC(C,R)].MakeCopy);
        FCells.SetNil(ColRowToRC(C,R));
        Cell.Free;
      end;
      Cell := FCells.GetNext;
    end;
    InsertCellList(CellList,ColRowToRC(0,Row),ColRowToRC(0,Row + RowCount),0,RowCount);
    for C := 0 to MAXCOL do begin
      Cell := GetCell(C,Row - 1);
      if (Cell <> Nil) and (Cell.FormatIndex <> DEFAULT_FORMAT) then begin
        for R := Row to Row + RowCount - 1 do begin
          DestCell := TBlankCell.Create(ColRowToRC(C,R),FFormats,DEFAULT_FORMAT);
          DestCell.AssignFormat(Cell.FormatIndex);
          FCells[ColRowToRC(C,R)] := DestCell;
        end;
      end;
    end;
    FEscherDrawing.Move(0, Row, MAXCOL, MAXROW, 0, Row + RowCount);
    FConditionalFormats.MoveLocal(0, Row, MAXCOL, MAXROW, 0, Row + RowCount);
    FValidations.MoveLocal(0, Row, MAXCOL, MAXROW, 0, Row + RowCount);
    FMergedCells.Move(0, Row, MAXCOL, MAXROW, 0, RowCount);
  finally
    CellList.Free;
  end;
end;

function TSheet.GetLeftCol: integer;
begin
  Result := FRecords.WINDOW2.LeftCol;
end;

function TSheet.GetTopRow: integer;
begin
  Result := FRecords.WINDOW2.TopRow;
end;

procedure TSheet.SetLeftCol(const Value: integer);
begin
  if (Value >= 0) and (Value <= MAXCOL) then
    FRecords.WINDOW2.LeftCol := Value;
end;

procedure TSheet.SetTopRow(const Value: integer);
begin
  if (Value >= 0) and (Value <= MAXROW) then
    FRecords.WINDOW2.TopRow := Value;
end;

function TSheet.GetIsDateTime(Col, Row: integer): boolean;
var
  S: string;
  Cell: TCell;
begin
  Result := False;
  Cell := FCells[ColRowToRC(Col,Row)];
  if (Cell = Nil) or (Cell.CellType = ctBlank) then
    Exit;
  S := Cell.Formats[FCells[ColRowToRC(Col,Row)].FormatIndex].NumberFormat;
  if S <> '' then begin
    Cell.Formats.XLSMask.Mask := S;
    Result := Cell.Formats.XLSMask.IsDateTime;
  end;
end;

function TSheet.CellToFV(Cell: TCell): TFormulaValue;
begin
  case Cell.CellType of
    ctNone          : FVSetError(Result,errNA);
    ctBlank         : FVSetError(Result,errNA);
    ctNotUsed       : FVSetError(Result,errNA);
    ctInteger       : FVSetFloat(Result,TIntegerCell(Cell).Value);
    ctFloat         : FVSetFloat(Result,TFloatCell(Cell).Value);
    ctString        : FVSetString(Result,FCells.SST[TStringCell(Cell).Value]);
    ctBoolean       : FVSetBoolean(Result,TBooleanCell(Cell).Value);
    ctError         : FVSetError(Result,TErrorCell(Cell).Value);
    ctNumberFormula : FVSetFloat(Result,TNumberFormulaCell(Cell).NumberValue);
    ctStringFormula : FVSetString(Result,TStringFormulaCell(Cell).StringValue);
    ctBooleanFormula: FVSetBoolean(Result,TBooleanFormulaCell(Cell).BooleanValue);
    ctErrorFormula  : FVSetError(Result,TErrorFormulaCell(Cell).ErrorValue);
    ctArrayFormula  : FVSetError(Result,errNA);
  end;
end;

procedure TSheet.NameIndexChanged(Delta: integer);
var
  i: integer;
begin
  for i := 0 to FEscherDrawing.ShapeCount - 1 do begin
    if FEscherDrawing.Group[i].ExShape <> Nil then begin
      if FEscherDrawing.Group[i].ExShape is TShapeControlButton then
        TShapeControlButton(FEscherDrawing.Group[i].ExShape).NameIndexChanged(Delta)
      else if FEscherDrawing.Group[i].ExShape is TShapeControlListBox then
        TShapeControlListBox(FEscherDrawing.Group[i].ExShape).NameIndexChanged(Delta);
    end;
  end;
end;

{ THorizPagebreaks }

function THorizPagebreaks.Add: THorizPagebreak;
begin
  Result := THorizPagebreak(inherited Add);
end;

constructor THorizPagebreaks.Create(AOwner: TPersistent);
begin
  inherited Create(THorizPagebreak);
  FOwner := AOwner;
end;

function THorizPagebreaks.GetItem(Index: integer): THorizPagebreak;
begin
  Result := THorizPagebreak(inherited Items[Index]);
end;

function THorizPagebreaks.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

{ TVertPagebreaks }

function TVertPagebreaks.Add: TVertPagebreak;
begin
  Result := TVertPagebreak(inherited Add);
end;

constructor TVertPagebreaks.Create(AOwner: TPersistent);
begin
  inherited Create(TVertPagebreak);
  FOwner := AOwner;
end;

function TVertPagebreaks.GetItem(Index: integer): TVertPagebreak;
begin
  Result := TVertPagebreak(inherited Items[Index]);
end;

function TVertPagebreaks.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

{ THorizPagebreak }

procedure THorizPagebreak.Assign(Source: TPersistent);
begin
  if not (Source is THorizPagebreak) then
    raise Exception.Create('Object is not THorizPagebreak');
  FRow := THorizPagebreak(Source).FRow;
  FCol1 := THorizPagebreak(Source).FCol1;
  FCol2 := THorizPagebreak(Source).FCol2;
end;

constructor THorizPagebreak.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FCol2 := MAXCOL;
end;

{ TVertPagebreak }

procedure TVertPagebreak.Assign(Source: TPersistent);
begin
  if not (Source is TVertPagebreak) then
    raise Exception.Create('Object is not TVertPagebreak');
  FCol := TVertPagebreak(Source).FCol;
  FRow1 := TVertPagebreak(Source).FRow1;
  FRow2 := TVertPagebreak(Source).FRow2;
end;

constructor TVertPagebreak.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FRow2 := MAXROW;
end;

function TSheet.GetAsWideString(Col, Row: integer): WideString;
var
  Cell: TCell;
begin
  Cell := FCells[ColRowToRC(Col,Row)];
  if (Cell <> Nil) and (Cell.CellType = ctString) then
    Result := FCells.SST.Items[TStringCell(Cell).Value]
  else
    Result := '';
end;

procedure TSheet.SetAsWideString(Col, Row: integer; const Value: WideString);
begin
  FCells[ColRowToRC(Col,Row)] := TStringCell.Create(ColRowToRC(Col,Row),FFormats,GetDefaultFormat(Col,Row),FCells.SST.AddString(Value));
end;

{ TBasicSheet }

constructor TBasicSheet.Create(Collection: TCollection);
begin
  inherited;
end;

destructor TBasicSheet.Destroy;
begin
  inherited;
end;

function TBasicSheet.GetIndex: integer;
begin
  Result := inherited Index;
end;

function TBasicSheet.GetName: WideString;
begin
  Result := FName;
end;

procedure TBasicSheet.SetName(Value: WideString);
var
  i: integer;
begin
  if MyWideUppercase(FName) = MyWideUppercase(Value) then
    Exit;
  for i := 0 to Collection.Count - 1 do begin
    if (Index <> i ) and (MyWideUppercase(TSheets(Collection).Items[i].Name) = MyWideUppercase(Value)) then
      raise Exception.Create('Sheet name "' + Value + '" allready exists');
  end;
  FName := Value;
end;

procedure TSheet.AfterFileRead;
begin
  FRows.Sort;
  FCells.SST.AfterFileRead;
end;

function TSheet.GetDefaultRowHeight: word;
begin
  Result := FRecords.DEFAULTROWHEIGHT.Height;
end;

procedure TSheet.SetDefaultRowHeight(const Value: word);
begin
  FRecords.DEFAULTROWHEIGHT.Height := Value;
  if Value <> DEFAULT_ROWHEIGHT then
    FRecords.DEFAULTROWHEIGHT.Options := FRecords.DEFAULTROWHEIGHT.Options or $0001
  else
    FRecords.DEFAULTROWHEIGHT.Options := FRecords.DEFAULTROWHEIGHT.Options and $FFFE;
end;

function TSheet.GetWorkspaceOptions: TWorkspaceOptions;
var
  V: word;
begin
  V := FRecords.WSBOOL;
  Result := [];
  if (V and $0001) = $0001 then
    Result := Result + [woShowAutoBreaks];
  if (V and $0020) = $0020 then
    Result := Result + [woApplyStyles];
  if (V and $0040) = $0040 then
    Result := Result + [woRowSumsBelow];
  if (V and $0080) = $0080 then
    Result := Result + [woColSumsRight];
  if (V and $0100) = $0100 then
    Result := Result + [woFitToPage];
  if (V and $0400) = $0400 then
    Result := Result + [woOutlineSymbols];
end;

procedure TSheet.SetWorkspaceOptions(const Value: TWorkspaceOptions);
var
  V: word;
begin
  V := $0000;
  if woShowAutoBreaks in Value then
    V := V or $0001;
  if woApplyStyles in Value then
    V := V or $0020;
  if woRowSumsBelow in Value then
    V := V or $0040;
  if woColSumsRight in Value then
    V := V or $0080;
  if woFitToPage in Value then
    V := V or $0100;
  if woOutlineSymbols in Value then
    V := V or $0400;
  FRecords.WSBOOL := V;
end;

function TSheet.GetDefaultColWidth: word;
begin
  Result := FRecords.DEFCOLWIDTH;
end;

procedure TSheet.SetDefaultColWidth(const Value: word);
begin
  FRecords.DEFCOLWIDTH := Value;
end;

function TSheet.GetFirstCol: word;
begin
  Result := FRecords.DIMENSIONS.FirstCol;
end;

function TSheet.GetFirstRow: word;
begin
  Result := FRecords.DIMENSIONS.FirstRow;
end;

function TSheet.GetLastCol: word;
begin
  if FRecords.DIMENSIONS.LastCol > 0 then
    Result := FRecords.DIMENSIONS.LastCol - 1
  else
    Result := 0;
end;

function TSheet.GetLastRow: word;
begin
  if FRecords.DIMENSIONS.LastRow > 0 then
    Result := FRecords.DIMENSIONS.LastRow - 1
  else
    Result := 0;
end;

procedure TSheet.SetFirstCol(const Value: word);
begin
  FRecords.DIMENSIONS.FirstCol := Value;
end;

procedure TSheet.SetFirstRow(const Value: word);
begin
  FRecords.DIMENSIONS.FirstRow := Value;
end;

procedure TSheet.SetLastCol(const Value: word);
begin
  if Value > 0 then
    FRecords.DIMENSIONS.LastCol := Value + 1
  else
    FRecords.DIMENSIONS.LastCol := 0;
end;

procedure TSheet.SetLastRow(const Value: word);
begin
  if Value > 0 then
    FRecords.DIMENSIONS.LastRow := Value + 1
  else
    FRecords.DIMENSIONS.LastRow := 0;
end;

function TSheet.GetOptions: TSheetOptions;
begin
  Result := [];
  if (FRecords.WINDOW2.Options and $0001) = $0001 then
    Result := Result + [soShowFormulas];
  if (FRecords.WINDOW2.Options and $0002) = $0002 then
    Result := Result + [soGridlines];
  if (FRecords.WINDOW2.Options and $0004) = $0004 then
    Result := Result + [soRowColHeadings];
  if (FRecords.WINDOW2.Options and $0008) = $0008 then
    Result := Result + [soFrozenPanes];
  if (FRecords.WINDOW2.Options and $0010) = $0010 then
    Result := Result + [soShowZeros];
end;

function TSheet.GetZoom: word;
begin
  Result := FRecords.WINDOW2.Zoom;
end;

function TSheet.GetZoomPreview: word;
begin
  Result := FRecords.WINDOW2.ZoomPreview;
end;

procedure TSheet.SetOptions(const Value: TSheetOptions);
begin
  FRecords.WINDOW2.Options := $06B6 and not ($0001 or $0002 or $0004 or $0008 or $0010 or $0200);

//  FRecords.WINDOW2.Options := $0000;
  if soShowFormulas in Value then
    FRecords.WINDOW2.Options := FRecords.WINDOW2.Options or $0001;
  if soGridlines in Value then
    FRecords.WINDOW2.Options := FRecords.WINDOW2.Options or $0002;
  if soRowColHeadings in Value then
    FRecords.WINDOW2.Options := FRecords.WINDOW2.Options or $0004;
  if soFrozenPanes in Value then
    FRecords.WINDOW2.Options := FRecords.WINDOW2.Options or $0008;
  if soShowZeros in Value then
    FRecords.WINDOW2.Options := FRecords.WINDOW2.Options or $0010;

end;

procedure TSheet.SetZoom(const Value: word);
begin
  FRecords.WINDOW2.Zoom := Value;
end;

procedure TSheet.SetZoomPreview(const Value: word);
begin
  FRecords.WINDOW2.ZoomPreview := Value;
end;

function TSheet.IsEmpty: boolean;
begin
  FCells.BeginIterate;
  Result := FCells.GetNext = Nil;
end;

procedure TSheet.GroupRows(Row1, Row2: integer; Collapsed: boolean = False);
var
  i,Level: integer;
  Row: TXLSRow;
begin
  for i := Row1 to Row2 do begin
    Row := FRows.Find(i);
    if Row <> Nil then
      Level := Row.Options and $0007
    else begin
      Row := FRows.AddIfNone(i);
      Level := 0;
    end;
    Inc(Level);
    if Level > 7 then
      raise Exception.Create('Row grouping level more than 7.');
    if Collapsed then
      Row.Options := (Row.Options + 1) or ($0010 + $0020)
    else
      Row.Options := (Row.Options + 1) and not ($0010 + $0020);
    if (Level + 1) > FRecords.GUTS.LevelRow then begin
      FRecords.GUTS.LevelRow := Level + 1;
      FRecords.GUTS.SizeRow := Level * 29;
    end;
  end;
end;

procedure TSheet.GroupColumns(Col1, Col2: integer; Collapsed: boolean = False);
var
  i,Level: integer;
  Col: TXLSColumn;
begin
  FColumns.AddIfNone(Col1,Col2 - Col1 + 1);
  for i := Col1 to Col2 do begin
    Col := FColumns[i];
    Level := Col.OutlineLevel;
    Inc(Level);
    Col.OutlineLevel := Level;
    if Level > 7 then
      raise Exception.Create('Column grouping level more than 7.');
    Col.CollapsedOutline := Collapsed;
    if (Level + 1) > FRecords.GUTS.LevelCol then begin
      FRecords.GUTS.LevelCol := Level + 1;
      FRecords.GUTS.SizeCol := Level * 29;
    end;
  end;
end;

procedure TSheet.ExecuteAutoFilter;
var
  i,C,R: integer;
  S: WideString;
  Cell: TCell;
  Hide: boolean;
begin
  FRows.AddIfNone(FAutofilters.Row1,FAutofilters.Row2 - FAutofilters.Row1 + 1);
  for R := FAutofilters.Row1 + 1 to FAutofilters.Row2 do
    FRows[R].Hidden := False;
  for R := FAutofilters.Row1 + 1 to FAutofilters.Row2 do begin
    i := 0;
    for C := FAutofilters.Col1 to FAutofilters.Col2 do begin
      if FAutofilters[i] <> Nil then begin
        Hide := False;
        Cell := GetCell(C,R);
        if Cell <> Nil then begin
          case Cell.CellType of
            ctBlank:          Hide := not FAutofilters[i].FilterBlankValue;
            ctInteger,
            ctFloat,
            ctNumberFormula:  Hide := not FAutofilters[i].FilterFloatValue(GetAsFloat(C,R));
            ctString,
            ctStringFormula:  begin
              S := GetAsString(C,R);
              if S = '' then
                Hide := not FAutofilters[i].FilterBlankValue
              else
                Hide := not FAutofilters[i].FilterStringValue(S);
            end;
            ctBoolean,
            ctBooleanFormula: Hide := not FAutofilters[i].FilterBooleanValue(GetAsBoolean(C,R));
            ctError,
            ctErrorFormula:   Hide := not FAutofilters[i].FilterErrorValue(GetAsError(C,R));
          end;
        end
        else
          Hide := not FAutofilters[i].FilterBlankValue;
        if Hide then
          FRows[R].Hidden := Hide;
      end;
      Inc(i);
    end;
  end;
end;

function TSheet.GetAsHyperlink(Col, Row: integer): WideString;
var
  i: integer;
begin
  i := FHyperlinks.Find(Col,Row);
  if i >= 0 then
    Result := FHyperlinks[i].Address
  else
    Result := '';
end;

procedure TSheet.SetAsHyperlink(Col, Row: integer; const Value: WideString);
var
  i: integer;
  HLink: THyperlink;
begin
  i := FHyperlinks.Find(Col,Row);
  if i >= 0 then
    HLink := FHyperlinks[i]
  else
    HLink := FHyperlinks.Add;
  HLink.Address := Value;
  HLink.Col1 := Col;
  HLink.Col2 := Col;
  HLink.Row1 := Row;
  HLink.Row2 := Row;
end;

procedure TSheet.FillRandom(Ref: string; Value: integer);
var
  C,R,C1,R1,C2,R2: integer;
  AC1,AR1,AC2,AR2: boolean;
begin
  AreaStrToColRow(Ref,C1,R1,C2,R2,AC1,AR1,AC2,AR2);
  for R := R1 to R2 do begin
    for C := C1 to C2 do
      SetAsFloat(C,R,Random(Value));
  end;
end;

function TSheet.FVRefToFV(FV: TFormulaValue): TFormulaValue;
var
  Cell: TCell;
  Col,Row: integer;
begin
  case FV.ValType of
    fvRef   : begin
      Col := FV.vRef[0];
      Row := FV.vRef[1];
    end;
    fvExtRef: begin
      Col := FV.vExtRef[0];
      Row := FV.vExtRef[1];
    end
    else
      raise Exception.Create('FV Ref expected');
  end;

  Cell := FCells[ColRowToRC(Col,Row)];
  if Cell <> Nil then begin
    case Cell.CellType of
      ctNone,
      ctBlank:          FVSetNull(Result);
      ctInteger:        FVSetFloat(Result,TIntegerCell(Cell).Value);
      ctFloat:          FVSetFloat(Result,TFloatCell(Cell).Value);
      ctString:         FVSetString(Result,FCells.SST[TStringCell(Cell).Value]);
      ctBoolean:        FVSetBoolean(Result,TBooleanCell(Cell).Value);
      ctError:          FVSetError(Result,TErrorCell(Cell).Value);
      ctNumberFormula:  FVSetFloat(Result,TNumberFormulaCell(Cell).NumberValue);
      ctStringFormula:  FVSetString(Result,TStringFormulaCell(Cell).StringValue);
      ctBooleanFormula: FVSetBoolean(Result,TBooleanFormulaCell(Cell).BooleanValue);
      ctErrorFormula:   FVSetError(Result,TErrorFormulaCell(Cell).ErrorValue);
    end;
  end
  else
    FVSetNull(Result);
end;

function TSheet.StrListFromFmla(Fmla: TDynByteArray; List: TXLSWideStringList): integer;
begin
  Result := TSheets(Collection).FFormulaHandler.StrListFromFmla(Index,Fmla,List);
end;

function TSheet.FloatListFromFmla(Fmla: TDynByteArray; var List: TDynDoubleArray): integer;
begin
  Result := TSheets(Collection).FFormulaHandler.FloatListFromFmla(Index,Fmla,List);
end;

{ TBasicSheet }

procedure TBasicSheet.SetNameNoCheck(Value: WideString);
begin
  FName := Value;
end;

{ TPane }

procedure TPane.Clear;
begin
  FPaneType := ptNone;
  FSplitColX := 0;
  FSplitRowY := 0;
  FLeftCol := 0;
  FTopRow := 0;
  FActivePane := 3;
  FSelections.Clear;
end;

constructor TPane.Create;
begin
  FSelections := TBaseRecordStorage.Create;
end;

destructor TPane.Destroy;
begin
  FSelections.Free;
  inherited;
end;

procedure TPane.SetActivePane(const Value: byte);
begin
  if Value > 3 then
    raise Exception.Create('Value out of range');
  FActivePane := Value;
end;

{ TSelection }

procedure TSelection.Clear;
begin
  SetActiveCol(0);
  SetActiveRow(0);
  SetCol1(0);
  SetRow1(0);
  SetCol2(0);
  SetRow2(0);
end;

constructor TSelection.Create(Parent: TSheet);
begin
  FParent := Parent;
end;

function TSelection.GetActiveCol: integer;
begin
  Result := FParent.FRecords.SELECTION.ActiveCol;
end;

function TSelection.GetActiveRow: integer;
begin
  Result := FParent.FRecords.SELECTION.ActiveRow;
end;

function TSelection.GetCol1: integer;
begin
  Result := FParent.FRecords.SELECTION.Col1;
end;

function TSelection.GetCol2: integer;
begin
  Result := FParent.FRecords.SELECTION.Col2;
end;

function TSelection.GetRow1: integer;
begin
  Result := FParent.FRecords.SELECTION.Row1;
end;

function TSelection.GetRow2: integer;
begin
  Result := FParent.FRecords.SELECTION.Row2;
end;

procedure TSelection.SetActiveCol(const Value: integer);
begin
  FParent.FRecords.SELECTION.ActiveCol := Value;
  FParent.FRecords.SELECTION.Col1 := Value;
  FParent.FRecords.SELECTION.Col2 := Value;
end;

procedure TSelection.SetActiveRow(const Value: integer);
begin
  FParent.FRecords.SELECTION.ActiveRow := Value;
  FParent.FRecords.SELECTION.Row1 := Value;
  FParent.FRecords.SELECTION.Row2 := Value;
end;

procedure TSelection.SetCol1(const Value: integer);
begin
  FParent.FRecords.SELECTION.Col1 := Value;
end;

procedure TSelection.SetCol2(const Value: integer);
begin
  FParent.FRecords.SELECTION.Col2 := Value;
end;

procedure TSelection.SetRow1(const Value: integer);
begin
  FParent.FRecords.SELECTION.Row1 := Value;
end;

procedure TSelection.SetRow2(const Value: integer);
begin
  FParent.FRecords.SELECTION.Row2 := Value;
end;

{ TSelectedAreas }

function TSelectedAreas.Add: TSelectedArea;
begin
  Result := TSelectedArea.Create;
  inherited Add(Result);
end;

function TSelectedAreas.Add(C1, R1, C2, R2: integer): TSelectedArea;
begin
  Result := TSelectedArea.Create;
  Result.FCol1 := C1;
  Result.FRow1 := R1;
  Result.FCol2 := C2;
  Result.FRow2 := R2;
  FActiveCol := C1;
  FActiveRow := R1;
  inherited Add(Result);
end;

function TSelectedAreas.CellInAreas(Col, Row: integer; var EdgeHit: TSelectedEdgeHits; var AreaHit: TSelectedAreaHit): integer;
const
  E_LEFT   = $01;
  E_TOP    = $02;
  E_RIGHT  = $04;
  E_BOTTOM = $08;
var
  i: integer;
  Edges: byte;
begin
  Result := 0;
  AreaHit := sahNo;
  Edges := $0;
  if (Col = FActiveCol) and (Row = FActiveRow) then
    AreaHit := sahActiveCell;
  for i := 0 to Count - 1 do begin
    if (Col >= Items[i].FCol1) and (Col <= Items[i].FCol2) and (Row >= Items[i].FRow1) and (Row <= Items[i].FRow2) then begin
      if AreaHit <> sahActiveCell then
        AreaHit := sahEdge;
      if Col <> Items[i].FCol1 then Edges := Edges or E_LEFT;
      if Col <> Items[i].FCol2 then Edges := Edges or E_RIGHT;
      if Row <> Items[i].FRow1 then Edges := Edges or E_TOP;
      if Row <> Items[i].FRow2 then Edges := Edges or E_BOTTOM;
      if (AreaHit <> sahActiveCell) and (Edges = $0F) then begin
        Result := i;
        EdgeHit := [];
        AreaHit := sahInside;
        Exit;
      end;
    end;
    Result := i;
  end;
  EdgeHit := TSelectedEdgeHits((not Edges) and $0F);
end;

constructor TSelectedAreas.Create;
begin
  inherited Create;
  Init;
end;

function TSelectedAreas.CursorVisible: boolean;
begin
  Result := Count = 1;
end;

function TSelectedAreas.First: TSelectedArea;
begin
  Result := Items[0];
end;

function TSelectedAreas.GetItems(Index: integer): TSelectedArea;
begin
  Result := TSelectedArea(inherited Items[Index]);
end;

procedure TSelectedAreas.Init(Col: integer = 0; Row: integer = 0);
begin
  with Add do begin
    Col1 := Col;
    Col2 := Col;
    Row1 := Row;
    Row2 := Row;
  end;
  FActiveCol := Col;
  FActiveRow := Row;
end;

procedure TSelectedAreas.Init(C1,R1,C2,R2,ActC,ActR: integer);
begin
  with Add do begin
    Col1 := C1;
    Col2 := C2;
    Row1 := R1;
    Row2 := R2;
  end;
  FActiveCol := ActC;
  FActiveRow := ActR;
end;

function TSelectedAreas.Last: TSelectedArea;
begin
  Result := Items[Count - 1];
end;

procedure TSelectedAreas.Move(Col, Row: integer);
begin
  while Count > 1 do
    Delete(Count - 1);
  with Items[0] do begin
    Col1 := Col;
    Col2 := Col;
    Row1 := Row;
    Row2 := Row;
  end;
  FActiveCol := Col;
  FActiveRow := Row;
end;

{ TSelectedArea }

function TSelectedArea.AsRect: TRecCellAreaI;
begin
  Result.Col1 := FCol1;
  Result.Row1 := FRow1;
  Result.Col2 := FCol2;
  Result.Row2 := FRow2;
end;

function TSelectedArea.Hit(Col, Row: integer): boolean;
begin
  Result := (Col >= FCol1) and (Row >= FRow1) and (Col <= FCol2) and (Row <= FRow2);
end;

procedure TSelectedArea.Intersect(C1, R1, C2, R2: integer);
begin
  if C1 < FCol1 then FCol1 := C1;
  if R1 < FRow1 then FRow1 := R1;
  if C2 > FCol2 then FCol2 := C2;
  if R2 > FRow2 then FRow2 := R2;
end;

procedure TSelectedArea.Normalize;

procedure Swap(var W1,W2: integer);
var
  T: Word;
begin
  T := W1;
  W1 := W2;
  W2 := T;
end;

begin
  if FCol1 > FCol2 then
    Swap(FCol1,FCol2);
  if FRow1 > FRow2 then
    Swap(FRow1,FRow2);
end;

procedure TSelectedArea.SetArea(C1, R1, C2, R2: integer);
begin
  FCol1 := C1;
  FRow1 := R1;
  FCol2 := C2;
  FRow2 := R2;
end;

end.
