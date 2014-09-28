unit uExcelFile;

interface
uses Windows, SysUtils, Classes, OleServer, ExcelXP, WordXP, Dialogs, Variants,
     VBIDEXP;
type

  TExcelWorksheet = class;
  TExcelWorkBook = class;

  TExcelWorksheet = class
  private
    fWorksheet : _Worksheet;
    fOwner     : TExcelWorkbook;
    function GetWorkSheetName: string;
    procedure SetSheetName(const Value: string);
    function GetCell(index1, index2 : integer): Variant;
    procedure SetCell(index1, index2 : integer; const Value: Variant);
    function GetFormula(index1, index2: integer): Variant;
    procedure SetFormula(index1, index2: integer; const Value: Variant);
    function GetLockCell(index1, index2: integer): boolean;
    procedure SetLockCell(index1, index2: integer; const Value: boolean);
  public
    constructor Create(AOwner : TExcelWorkbook);
    procedure Copy(SheetAfter : TExcelWorksheet);
    procedure Protect(const password : string);
    procedure Hide;
    property Cells[index1, index2 : integer] : Variant read GetCell write SetCell;
    property LockCell[index1, index2 : integer] : boolean read GetLockCell write SetLockCell;
    property Formula[index1, index2 : integer] : Variant read GetFormula write SetFormula;
    property SheetName : string read GetWorkSheetName write SetSheetName;
    property WorkSheet : _Worksheet read fWorksheet;
    property WorkBook  : TExcelWorkbook read fOwner;
  end;


  TExcelWorkBook = class
  private
    fWorkbook : _Workbook;
    fWorksheets : array of TExcelWorksheet;
    function GetSheetsCount: integer;
    function GetSheet(index: integer): TExcelWorksheet;
    procedure CreateSheets;
    function GetIdByName(const SheetName : string) : integer;
  public
    constructor Create;
    destructor Destroy; override;
    function GetName : string;
    procedure CopyMacro(wb : TExcelWorkbook);
    procedure AddSheet(const SheetName : string);
    procedure DeleteSheet(const idx : integer);
    procedure Save(const FileName : string);
    procedure Close;
    function SheetByName(const SheetName : string) : TExcelWorksheet;
    property Sheets[index : integer] : TExcelWorksheet read GetSheet;
    property SheetsCount : integer read GetSheetsCount;
  end;

  TExcel = class(TComponent)
  private
    fXl  : TExcelApplication;
    fWorkBooks : array of TExcelWorkBook;
    function GetWorkbookCount: integer;
    function GetWorkbook(index: integer): TExcelWorkBook;
    function GetIdByName(const WorkbookName : string) : integer;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure AddWorkBook; overload;
    procedure RunMacro(const Macro : string);
    procedure AddWorkBook(const FileName : string); overload;
    function WorkbookByName(const WorkbookName : string) : TExcelWorkBook;
    property WorkbookCount : integer read GetWorkbookCount;
    property WorkBooks[index : integer] : TExcelWorkBook read GetWorkbook;
  end;


implementation

uses ComObj;

var
  lcid : integer = 0;

{ TExcel }

procedure TExcel.AddWorkBook;
begin
  SetLength(fWorkBooks, WorkbookCount + 1);
  fWorkBooks[WorkbookCount - 1] := TExcelWorkBook.Create;
  fWorkBooks[WorkbookCount - 1].fWorkbook := fXl.Workbooks.Add(1, lcid);
  fWorkBooks[WorkbookCount - 1].CreateSheets;
end;

procedure TExcel.AddWorkBook(const FileName : string);
begin
  SetLength(fWorkBooks, WorkbookCount + 1);
  fWorkBooks[WorkbookCount - 1] := TExcelWorkBook.Create;
  fWorkBooks[WorkbookCount - 1].fWorkbook := fxl.Workbooks.Add(FileName, lcid);
  fWorkBooks[WorkbookCount - 1].CreateSheets;
 { fXl.Workbooks.Open(FileName, 2, False, 0,
     0,
     0,
     0,
     0,
     0,
     0,
     0,
     0,
     False,
     0,
     0,
     lcid);}
end;

constructor TExcel.Create(AOwner: TComponent);
begin
  inherited;
  lcid := GetUserDefaultLCId;
  fXL := TExcelApplication.Create(nil);
  try
    fXL.ConnectKind := ckNewInstance;
    fXl.Application.AutomationSecurity := 1;
    fXL.DisplayAlerts[lcid] := False;
    fXL.AutoQuit := False;
    fXL.Visible[lcid] := False;
    fXL.Connect;
  except
    ShowMessage('Невозможно соединиться с MS Excel');
  end;
end;

destructor TExcel.Destroy;
var
  i : Integer;
begin
  for i := 0 to Workbookcount - 1 do WorkBooks[i].Free; 
  fXL.UserControl := True;
  fXL.Workbooks.Close(lcid);
  fXL.Quit;
  fXL.Disconnect;
  FreeAndNil(fXL);
  inherited;
end;

function TExcel.GetIdByName(const WorkbookName: string): integer;
var
  i : integer;
begin
  Result := -1;
  if WorkbookCount = 0 then exit;
  for i := 0 to WorkbookCount - 1 do if WorkBooks[i].GetName = WorkbookName then
  begin
    Result := i;
    break;
  end;
end;

function TExcel.GetWorkbook(index: integer): TExcelWorkBook;
begin
  Result := fWorkBooks[index];
end;

function TExcel.GetWorkbookCount: integer;
begin
  Result := Length(fWorkBooks);
end;

procedure TExcel.RunMacro(const Macro: string);
begin
//  Workbooks[1].fWorkbook.VBProject.VBComponents.Item(0).Activate;
  fXl.Run(Macro);
end;

function TExcel.WorkbookByName(const WorkbookName: string): TExcelWorkBook;
var
  id : integer;
begin
  Result := Nil;
  id := GetIdByName(WorkbookName);
  if id <> -1 then Result := WorkBooks[id];
end;

{ TExcelWorkBook }

procedure TExcelWorkBook.AddSheet(const SheetName: string);
var
  sh : OleVariant;
begin
  SetLength(fWorksheets, Length(fWorksheets) + 1);
  fWorksheets[Length(fWorksheets) - 1] := TExcelWorksheet.Create(Self);

  sh := fWorkBook.WorkSheets.Add(EmptyParam, fWorkbook.ActiveSheet, 1, EmptyParam, lcid);
  fWorksheets[Length(fWorksheets) - 1].fWorksheet := iDispatch(sh) as _Worksheet;

  fWorksheets[Length(fWorksheets) - 1].fWorksheet.Name := SheetName;
end;

constructor TExcelWorkBook.Create;
begin
  inherited;
end;

procedure TExcelWorkBook.CreateSheets;
var
  i : integer;
begin
  fWorksheets := Nil;
  SetLength(fWorksheets, fWorkbook.Worksheets.Count);
  for i := 0 to SheetsCount - 1 do
  begin
    fWorksheets[i] := TExcelWorksheet.Create(Self);
    fWorksheets[i].fWorksheet := (fWorkbook.Sheets[i + 1] as _Worksheet);
  end;
end;

procedure TExcelWorkBook.DeleteSheet(const idx: integer);
begin
  fWorksheets[idx].fWorksheet.Delete(lcid);
  if (Length(fWorksheets) <> 1) and (idx <> Length(fWorksheets) - 1) then fWorksheets[idx] := fWorksheets[Length(fWorksheets) - 1];
  SetLength(fWorksheets, Length(fWorksheets) - 1);
end;

destructor TExcelWorkBook.Destroy;
var
  i : integer;
begin
  for i := 0 to SheetsCount - 1 do Sheets[i].Free;
  fWorksheets := Nil;
  inherited;
end;

function TExcelWorkBook.GetIdByName(const SheetName: string): integer;
var
 i : integer;
begin
  Result := -1;
  if SheetsCount = 0 then exit;
  for i := 0 to SheetsCount - 1 do if Sheets[i].SheetName = SheetName then
  begin
    Result := i;
    break;
  end;
end;

function TExcelWorkBook.GetName: string;
begin
  Result := fWorkbook.Name;
end;

function TExcelWorkBook.GetSheet(index: integer): TExcelWorksheet;
begin
  Result := fWorkSheets[index];
end;

function TExcelWorkBook.GetSheetsCount: integer;
begin
  Result := Length(fWorksheets);
end;

procedure TExcelWorkBook.Save(const FileName: string);
begin
  fWorkbook.SaveAs(FileName, 39, '', '', false, false, 1, 1, false, varNull, varNull, true, lcid);
end;

function TExcelWorkBook.SheetByName(const SheetName: string): TExcelWorksheet;
var
  id : integer;
begin
  Result := Nil;
  id := GetIdByName(SheetName);
  if id <> -1 then Result := Sheets[id];
end;

procedure TExcelWorkBook.CopyMacro(wb : TExcelWorkbook);
var
 comp : _VBComponent;
begin
  fWorkbook.VBProject.VBComponents.Item('Module1').Export('c:\tmp_macro_xls.txt');
  comp := wb.fWorkbook.VBProject.VBComponents.Add(1);
  comp.CodeModule.AddFromFile('c:\tmp_macro_xls.txt');
  DeleteFile('C:\tmp_macro_xls.txt');
end;

procedure TExcelWorkBook.Close;
begin
  fWorkbook.Close(false, '', EmptyParam, lcid);
end;

{ TExcelWorksheet }

procedure TExcelWorksheet.Copy(SheetAfter : TExcelWorksheet);
begin
  fWorksheet.Copy(EmptyParam, SheetAfter.fWorksheet, lcid);
  SetLength(SheetAfter.WorkBook.fWorksheets, Length(SheetAfter.WorkBook.fWorksheets) + 1);
  SheetAfter.WorkBook.fWorksheets[Length(SheetAfter.WorkBook.fWorksheets) - 1] := TExcelWorksheet.Create(SheetAfter.WorkBook);
  SheetAfter.WorkBook.fWorksheets[Length(SheetAfter.WorkBook.fWorksheets) - 1].fWorksheet := iDispatch(SheetAfter.WorkBook.fWorkbook.ActiveSheet) as _Worksheet;
// ASheet.Move(EmptyParam, XL.Workbooks[2].Sheets[XL.Workbooks[2].Sheets.Count]);
end;

constructor TExcelWorksheet.Create(AOwner: TExcelWorkbook);
begin
  inherited Create;
  fOwner := AOwner;
end;

function TExcelWorksheet.GetCell(index1, index2 : integer): Variant;
begin
  Result := fWorksheet.Cells.Item[index1, index2];
end;

function TExcelWorksheet.GetFormula(index1, index2: integer): Variant;
begin
  Result := fWorksheet.Cells.Item[index1, index2].Formula;
end;

function TExcelWorksheet.GetLockCell(index1, index2: integer): boolean;
begin
 Result := fWorksheet.Cells.Item[index1, index2].Locked; 
end;

function TExcelWorksheet.GetWorkSheetName: string;
begin
  Result := fWorksheet.Name;
end;

procedure TExcelWorksheet.Hide;
begin
  fWorksheet.Visible[lcid] := xlSheetHidden;
end;

procedure TExcelWorksheet.Protect(const password: string);
begin
  fWorkSheet.Protect(password, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false);
end;

procedure TExcelWorksheet.SetCell(index1, index2 : integer; const Value: Variant);
begin
 fWorksheet.Cells.Item[index1, index2] := Value;
end;

procedure TExcelWorksheet.SetFormula(index1, index2: integer;
  const Value: Variant);
begin
 fWorksheet.Cells.Item[index1, index2].FormulaR1C1 := Value;
end;

procedure TExcelWorksheet.SetLockCell(index1, index2: integer;
  const Value: boolean);
begin
  fWorksheet.Cells.Item[index1, index2].Locked := Value;
end;

procedure TExcelWorksheet.SetSheetName(const Value: string);
begin
  fWorksheet.Name := Value;
end;

end.
