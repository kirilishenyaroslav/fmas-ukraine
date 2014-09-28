unit XLSDbRead2;

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

uses Classes, SysUtils, XLSReadWriteII2, BIFFRecsII2, CellFormats2, XLSFonts2,
     db;

//* Event type fired when ~[link TXLSDbRead2] reads a cell.
//* ~param Sender The TXLSDbRead2 object.
//* ~param IsFieldNames True if the cell is a field name.
//* ~param Dataset The source data set.
//* ~param FieldIndex Index into the source data set's field list.
//* ~param Col The column in the destination XLSReadWriteII object where the cell is inserted.
//* ~param Row The row in the destination XLSReadWriteII object where the cell is inserted.
type TXLSDbCellEvent = procedure(Sender: TObject; IsFieldNames: boolean; Dataset: TDataSet; FieldIndex,Col,Row: integer) of object;

//* ~exclude
type TXLSDataSetList = class(TList)
private
     FDataSet: TDataSet;
     FIncludeFieldsInx: array of boolean;
     FExcludeFieldsInx: array of boolean;

     function GetItems(Index: integer): TXLSDataSetList;
public
     constructor Create;
     destructor Destroy; override;
     procedure Clear; override;
     procedure GetDetail(DS: TDataSet; InclFields,ExclFields: TStrings);
     function  Add: TXLSDataSetList;

     property DataSet: TDataSet read FDataSet;
     property Items[Index: integer]: TXLSDataSetList read GetItems; default;
     end;

//* Component for importing data sets (TDataset) into a XLSReadWriteII component.
type TXLSDbRead2 = class(TComponent)
private
    FXLS: TXLSReadWriteII2;
    FDataSet: TDataSet;
    FCol: byte;
    FRow: word;
    FSheet: integer;
    FIncludeFields: TStrings;
    FExcludeFields: TStrings;
    FIncludeFieldnames: boolean;
    FReadDetailTables: boolean;
    FIndentDetailTables: boolean;
    FFormatCells: boolean;
    FXLSDetails: TXLSDataSetList;
    FDbCellEvent: TXLSDbCellEvent;

    function  GetCellColors(Index: integer): TExcelColor;
    procedure SetCellColors(Index: integer; const Value: TExcelColor);

    procedure SetExcludeFields(const Value: TStrings);
    procedure SetIncludeFields(const Value: TStrings);
    procedure ReadDataSet(XLSDetails: TXLSDataSetList; var ARow: integer; Level: integer);
    procedure ShowFieldnames(XLSDetails: TXLSDataSetList; var ARow: integer; Level: integer);
public
    //* ~exclude
    constructor Create(AOwner: TComponent); override;
    //* ~exclude
    destructor Destroy; override;
    //* Starts reading the source ~[link Dataset].
    procedure Read;

    //* Cell colors used when ~[link FormatCells] is on. The frist index (#0) is
    //* for the master table, the following for detail tables. There can be
    //* 8 levels, index 0..7
    property CellColors[Index: integer]: TExcelColor read GetCellColors write SetCellColors;
published
    //* Current column where the cells are inserted.
    property Column: byte read FCol write FCol;
    //* Source data set.
    property Dataset: TDataset read FDataset write FDataset;
    //* List of field names in the data set that not shall be imported.
    property ExcludeFields: TStrings read FExcludeFields write SetExcludeFields;
    //* List of field names in the data set that shall be imported. If the list is empty, all fileds are included.
    property IncludeFields: TStrings read FIncludeFields write SetIncludeFields;
    //* Write the names of the fields on the first row.
    property IncludeFieldnames: boolean read FIncludeFieldnames write FIncludeFieldnames;
    //* When True, detail tables are shifted one column to the right for each level.
    property IndentDetailTables: boolean read FIndentDetailTables write FIndentDetailTables;
    //* When True, detail tables are read. When False, only the master table is read.
    property ReadDetailTables: boolean read FReadDetailTables write FReadDetailTables;
    //* When True, the color of the inserted cells are set according to the colors in ~[link CellColors]
    property FormatCells: boolean read FFormatCells write FFormatCells;
    //* Current row where the cells are inserted.
    property Row: word read FRow write FRow;
    //* Index to the current sheet where the cells are inserted.
    property Sheet: integer read FSheet write FSheet;
    //* The destination TXLSReadWriteII2 object.
    property XLS: TXLSReadWriteII2 read FXLS write FXLS;
    //* Event fired when a cell is inserted. The event is fired after data is written to the cell.
    //* Use this event for user formatting of the cells, or changing the destination on where the cells are inserted.
    property OnDbCell: TXLSDbCellEvent read FDbCellEvent write FDbCellEvent;
    end;

implementation

var DetailCellColors: array [0..7] of TExcelColor = (xcLightYellow,xcPaleTurquois,xcPaleGreen,xcLightBrown,xc31,xc31,xc31,xc31);

{ TXLSDbRead }

constructor TXLSDbRead2.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FReadDetailTables := True;
  FIndentDetailTables := True;
  FIncludeFieldnames := True;
  FFormatCells := True;
  FIncludeFields := TStringList.Create;
  FExcludeFields := TStringList.Create;
  FXLSDetails := TXLSDataSetList.Create;
end;

destructor TXLSDbRead2.Destroy;
begin
  FIncludeFields.Free;
  FExcludeFields.Free;
  FXLSDetails.Free;
  inherited;
end;

function TXLSDbRead2.GetCellColors(Index: integer): TExcelColor;
begin
  if (Index < 0) or (Index > High(DetailCellColors)) then
    raise Exception.Create('Index out of range');
  Result := DetailCellColors[Index];
end;

procedure TXLSDbRead2.Read;
var
  ARow: integer;
begin
  if FXLS = Nil then
    raise Exception.Create('No TXLSReadWriteII defined');
  if FSheet >= FXLS.Sheets.Count then
    raise Exception.Create('Sheet index out of range');
  if FDataset = Nil then
    raise Exception.Create('No Dataset defined');
  FXLSDetails.GetDetail(FDataSet,FIncludeFields,FExcludeFields);
  ARow := FRow;
  ReadDataSet(FXLSDetails,ARow,0);
  FXLS.Sheets[FSheet].CalcDimensions;
end;

procedure TXLSDbRead2.ReadDataSet(XLSDetails: TXLSDataSetList; var ARow: integer; Level: integer);
var
  i,j: integer;
  ACol: integer;
begin
  ShowFieldnames(XLSDetails,ARow,Level);
  XLSDetails.DataSet.First;
  while not XLSDetails.DataSet.Eof do begin
    ACol := FCol;
    if FIndentDetailTables then
      Inc(ACol,Level);
    for i := 0 to XLSDetails.DataSet.FieldCount - 1 do begin
      if XLSDetails.FIncludeFieldsInx[i] and not XLSDetails.FExcludeFieldsInx[i] then begin
        if not XLSDetails.DataSet.Fields[i].IsNull then begin
          case XLSDetails.DataSet.Fields[i].DataType of
            ftString,
{$ifndef ver120}
            ftVariant,
{$endif}
            ftFixedChar,
{$ifdef D6_AND_LATER}
            ftGuid:
                        FXLS.Sheets[FSheet].AsString[ACol,ARow] := XLSDetails.DataSet.Fields[i].AsString;
{$endif}
            ftWideString:
                        FXLS.Sheets[FSheet].AsWideString[ACol,ARow] := XLSDetails.DataSet.Fields[i].AsString;
            ftMemo,
            ftFmtMemo,
{$ifdef DELPHI_2006_OR_LATER}
            ftWideMemo:
                        FXLS.Sheets[FSheet].AsString[ACol,ARow] := XLSDetails.DataSet.Fields[i].AsString;
{$endif}
            ftSmallint,
            ftInteger,
            ftLargeInt,
            ftWord,
            ftCurrency,
{$ifdef D6_AND_LATER}
            ftBCD,
            ftFMTBcd,
{$endif}
            ftAutoInc,
            ftFloat:
                        FXLS.Sheets[FSheet].AsFloat[ACol,ARow] := XLSDetails.DataSet.Fields[i].AsFloat;
            ftBoolean:
                        FXLS.Sheets[FSheet].AsBoolean[ACol,ARow] := XLSDetails.DataSet.Fields[i].AsBoolean;
            ftGraphic: ;

            ftDate,
{$ifdef D6_AND_LATER}
            ftTimestamp,
{$endif}
            ftTime,
            ftDateTime: FXLS.Sheets[FSheet].AsDateTime[ACol,ARow] := XLSDetails.DataSet.Fields[i].AsFloat;
          end;
        end;
        if FFormatCells then begin
          if FXLS.Sheets[FSheet].Cell[ACol,ARow] = Nil then
            FXLS.Sheets[FSheet].AsBlank[ACol,ARow] := True;
          if Level <= High(DetailCellColors) then
            FXLS.Sheets[FSheet].Cell[ACol,ARow].FillPatternForeColor := DetailCellColors[Level]
          else
            FXLS.Sheets[FSheet].Cell[ACol,ARow].FillPatternForeColor := DetailCellColors[High(DetailCellColors)];
          if Assigned(FDbCellEvent) then
            FDbCellEvent(Self,False,XLSDetails.DataSet,i,ACol,ARow);
        end;
        Inc(ACol);
      end;
    end;
    Inc(ARow);
    if ARow >= FXLS.MaxRowCount then
      Break;
    if FReadDetailTables then begin
      for j := 0 to XLSDetails.Count - 1 do begin
        ReadDataSet(XLSDetails[j],ARow,Level + 1);
      end;
    end;
    XLSDetails.DataSet.Next;
  end;
end;

procedure TXLSDbRead2.SetCellColors(Index: integer; const Value: TExcelColor);
begin
  if (Index < 0) or (Index > High(DetailCellColors)) then
    raise Exception.Create('Index out of range');
  DetailCellColors[Index] := Value;
end;

procedure TXLSDbRead2.SetExcludeFields(const Value: TStrings);
begin
  FExcludeFields.Assign(Value);
end;

procedure TXLSDbRead2.SetIncludeFields(const Value: TStrings);
begin
  FIncludeFields.Assign(Value);
end;

procedure TXLSDbRead2.ShowFieldnames(XLSDetails: TXLSDataSetList; var ARow: integer; Level: integer);
var
  i,ACol: integer;
begin
  if FIncludeFieldnames then begin
    ACol := FCol;
    if FIndentDetailTables then
      Inc(ACol,Level);
    for i := 0 to XLSDetails.DataSet.FieldCount - 1 do begin
      if XLSDetails.FIncludeFieldsInx[i] and not XLSDetails.FExcludeFieldsInx[i] then begin
          FXLS.Sheets[FSheet].AsString[ACol,ARow] := XLSDetails.DataSet.Fields[i].DisplayName;
          if FFormatCells then begin
            FXLS.Sheets[FSheet].Cell[ACol,ARow].FillPatternForeColor := xcOrange;
            FXLS.Sheets[FSheet].Cell[ACol,ARow].FontStyle := [xfsBold];
            if Assigned(FDbCellEvent) then
              FDbCellEvent(Self,False,DataSet,i,ACol,ARow);
          end;
        Inc(ACol);
      end;
    end;
    Inc(ARow);
  end;
end;

{ TXLSDataSetList }

function TXLSDataSetList.Add: TXLSDataSetList;
begin
  Result := TXLSDataSetList.Create;
  inherited Add(Result);
end;

procedure TXLSDataSetList.Clear;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Clear;
  inherited Clear;
end;

constructor TXLSDataSetList.Create;
begin

end;

destructor TXLSDataSetList.Destroy;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Free;
  inherited;
end;

procedure TXLSDataSetList.GetDetail(DS: TDataSet; InclFields,ExclFields: TStrings);
var
  i: integer;
  List: TList;
  XDS: TXLSDataSetList;
  Field: TField;
begin
  SetLength(FIncludeFieldsInx,DS.FieldCount);
  SetLength(FExcludeFieldsInx,DS.FieldCount);
  for i := 0 to DS.FieldCount - 1 do begin
    FIncludeFieldsInx[i] := InclFields.Count <= 0;
    FExcludeFieldsInx[i] := False;
  end;
  for i := 0 to InclFields.Count - 1 do begin
    Field := DS.Fields.FindField(InclFields[i]);
    if Field <> Nil then
      FIncludeFieldsInx[Field.Index] := True;
  end;
  for i := 0 to ExclFields.Count - 1 do begin
    Field := DS.Fields.FindField(ExclFields[i]);
    if Field <> Nil then
      FExcludeFieldsInx[Field.Index] := True;
  end;
  List := TList.Create;
  try
    FDataSet := DS;
    FDataSet.GetDetailDataSets(List);
    for i := 0 to List.Count - 1 do begin
      XDS := Add;
      XDS.GetDetail(List[i],InclFields,ExclFields);
    end;
  finally
    List.Free;
  end;
end;

function TXLSDataSetList.GetItems(Index: integer): TXLSDataSetList;
begin
  Result := TXLSDataSetList(inherited Items[Index]);
end;

end.
