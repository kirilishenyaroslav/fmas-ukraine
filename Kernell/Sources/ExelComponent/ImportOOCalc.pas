unit ImportOOCalc;

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

uses Classes, SysUtils, Contnrs,
     ZipInterface,
     BIFFRecsII2, XLSUtils2, CellFormats2, XLSFonts2, XLSReadWriteII2,
     ROws2, XLSXML;

//* This routine will import an Open Office Calc spreadsheet file.
//* As Open Office files are compressed with the zip format, an external
//* unzip library is needed. XLSReadWriteII have an interface to the free
//* Abbrevia zip component. For more info about Abrrevia, and download,
//* see ~[linkExtern http://sourceforge.net/projects/tpabbrevia/].
//* The class ~[link ZipInterface.TXLSReadZip TXLSReadZip] can be overridden to
//* suit any other zip library.
//* ~param XLS The TXLSReadWriteII2 object that will receive the imported file.
//* ~param ZIP The TXLSReadZip used to unzip the Open Office Calc file.
//* ~param Filename The Open Office Calc filename that shall be imported.
//* ~[br]
//* ~[br]
//*´~[b Example:]
//* ~[br]
//* ~[sample
//* uses ZipInterfaceAbbrevia, ImportOOCalc;
//*
//* var
//*   ZIP: TXLSReadZipAbbrevia;
//* begin
//*   // Create the unzip object.
//*   ZIP := TXLSReadZipAbbrevia.Create;
//*   try
//*     // Import the file.
//*     ImportOpenOfficeCalc(XLS,ZIP,'testfile.ods');
//*   finally
//*     ZIP.Free;
//*   end;
//* end;
//* ]
procedure ImportOpenOfficeCalc(XLS: TXLSReadWriteII2; Dummy: TObject; Filename: WideString);

implementation

//~endparse~

function SafeStrToFloat(S: string): double;
begin
  if S = '' then begin
    Result := 0;
    Exit;
  end;
  try
    Result := StrToFloat(S);
  except
    Result := 0;
  end;
end;

procedure ColorSwap(var Cl: integer);
var
  T: byte;
begin
  T := (Cl and $FF0000) shr 16;
  Cl := (Cl and $00FF00) or ((Cl and $0000FF) shl 16) or T
end;

type TOOXMLColData = class(TObject)
protected
     FWidth: integer;
     FStyle,FDefCellStyle: string;
public
     property Width: integer read FWidth write FWidth;
     property Style: string read FStyle write FStyle;
     property DefCellStyle: string read FDefCellStyle write FDefCellStyle;
     end;

type TOOXMLColList = class(TObjectList)
private
     function GetItems(Index: integer): TOOXMLColData;
protected
public
     function Add: TOOXMLColData;

     property Items[Index: integer]: TOOXMLColData read GetItems; default;
     end;

type TOOXMLColRowStyle = class(TObject)
private
     FName: string;
     FSize: double;
public
     property Name: string read FName write FName;
     property Size: double read FSize write FSize;
     end;

type TOOXMLColRowStyleList = class(TObjectList)
private
     function GetItems(Index: integer): TOOXMLColRowStyle;
public
     function Find(Name: string): integer;
     function Add: TOOXMLColRowStyle;
     property Items[Index: integer]: TOOXMLColRowStyle read GetItems; default;
     end;

type TOOReadMetaData = class(TObject)
protected
     FXLS: TXLSReadWriteII2;
     FFormats: TStringList;
     FXML: TXLSReadXML;
     FCurrSheet: integer;
     FCurrRow,FCurrCol: integer;
     FColumns: TOOXMLColList;
     FRowStyles: TOOXMLColRowStyleList;

     procedure AddFormula(Formula: WideString);
public
     constructor Create(XML: TXLSReadXML; XLS: TXLSReadWriteII2);
     destructor Destroy; override;

     property XLS: TXLSReadWriteII2 read FXLS;
     property XML: TXLSReadXML read FXML write FXML;
     end;

type TOOXMLTag = class(TObjectList)
private
    function GetItems(Index: integer): TOOXMLTag;
protected
     FOOData: TOOReadMetaData;
     FTagName: string;
     FRepeatTag: boolean;

     procedure Parse; virtual;
     procedure EndTag; virtual;
public
     constructor Create(OOData: TOOReadMetaData; TagName: string);
     function Add(Tag: TOOXMLTag): TOOXMLTag;
     procedure FindTag;
     procedure Run;

     property Items[Index: integer]: TOOXMLTag read GetItems; default;
     end;

type TOOXMLTagStyleParent = class(TOOXMLTag)
protected
     procedure Parse; override;
     procedure EndTag; override;
public
     end;

type TOOXMLBorder = record
     BorderStyle: TCellBorderStyle;
     BorderColor: TExcelColor;
     end;

type TOOXMLFont = record
     Size: double;
     Name: WideString;
     Color: TExcelColor;
     Style: TXFontStyles;
     SubSuperscript: TXSubSuperscript;
     Underline: TXUnderline;
     end;

type TOOXMLTagStyle = class(TOOXMLTag)
protected
     FName: string;
     FAssigned,FFontAssigned: boolean;
     FBkgColor: TExcelColor;
     FBorders: array[0..3] of TOOXMLBorder;
     FFont: TOOXMLFont;

     procedure Parse; override;
     procedure EndTag; override;
     procedure Reset;
     procedure SetBorder(Index,Color: integer; BorderStyle: TCellBorderStyle);
public
     end;

type TOOXMLTagStyleCell = class(TOOXMLTag)
protected
     FParent: TOOXMLTagStyle;

     procedure Parse; override;
public
     constructor Create(OOData: TOOReadMetaData; TagName: string; Parent: TOOXMLTagStyle);
     end;

type TOOXMLTagStyleText = class(TOOXMLTag)
protected
     FParent: TOOXMLTagStyle;

     procedure Parse; override;
public
     constructor Create(OOData: TOOReadMetaData; TagName: string; Parent: TOOXMLTagStyle);
     end;

type TOOXMLTagStyleRow = class(TOOXMLTag)
protected
     FParent: TOOXMLTagStyle;

     procedure Parse; override;
public
     constructor Create(OOData: TOOReadMetaData; TagName: string; Parent: TOOXMLTagStyle);
     end;

type TOOXMLTagTable = class(TOOXMLTag)
protected
     procedure Parse; override;
     procedure EndTag; override;
public
     end;

type TOOXMLTagColumn = class(TOOXMLTag)
protected
     procedure Parse; override;
public
     end;

type TOOXMLTagRow = class(TOOXMLTag)
protected
     FRowsRepeated: integer;
     FRepeatPos: integer;

     procedure SetHeight;
     procedure Parse; override;
     procedure EndTag; override;
public
     end;

type TOOXMLTagCell = class(TOOXMLTag)
protected
     procedure Parse; override;
public
     end;

type TOOXMLTagCellCovered = class(TOOXMLTag)
protected
     procedure Parse; override;
public
     end;

procedure ImportOpenOfficeCalc(XLS: TXLSReadWriteII2; Dummy: TObject; Filename: WideString);
var
  XML: TXLSReadXMLStream;
  ZIP: TXLSReadZip;
  SheetXML: TXLSReadXMLMemory;
  Stream: TMemoryStream;
  OOData: TOOReadMetaData;
  OOTag: TOOXMLTag;
  SheetTag: TOOXMLTag;
  TempDS: char;
{$ifdef AXOLOT_DEBUG}
  FileStream: TFileStream;
{$endif}

procedure BuildStructure;
var
  Tag: TOOXMLTag;
begin
  OOTag := TOOXMLTag.Create(OOData,'office:document-content');

    Tag := OOTag.Add(TOOXMLTagStyleParent.Create(OOData,'office:automatic-styles'));
      Tag := Tag.Add(TOOXMLTagStyle.Create(OOData,'style:style'));
        Tag.Add(TOOXMLTagStyleCell.Create(OOData,'style:table-cell-properties',TOOXMLTagStyle(Tag)));
        Tag.Add(TOOXMLTagStyleText.Create(OOData,'style:text-properties',TOOXMLTagStyle(Tag)));
        Tag.Add(TOOXMLTagStyleRow.Create(OOData,'style:table-row-properties',TOOXMLTagStyle(Tag)));


    Tag := OOTag.Add(TOOXMLTag.Create(OOData,'office:body'));
      Tag := Tag.Add(TOOXMLTag.Create(OOData,'office:spreadsheet'));
        SheetTag := Tag.Add(TOOXMLTagTable.Create(OOData,'table:table'));
          SheetTag.Add(TOOXMLTagColumn.Create(OOData,'table:table-column'));
          Tag := SheetTag.Add(TOOXMLTagRow.Create(OOData,'table:table-row'));
            Tag.Add(TOOXMLTagCell.Create(OOData,'table:table-cell'));
            Tag.Add(TOOXMLTagCellCovered.Create(OOData,'table:covered-table-cell'));
end;

begin
  ZIP := TXLSReadZip.Create;
  try
    ZIP.OpenZip(Filename);
    Stream := TMemoryStream.Create;
    try
      if not ZIP.ReadFileToStream('content.xml',Stream) then
        raise Exception.Create('Can not find content.xml in Open Office Calc archive');
      Stream.Seek(0,soFromBeginning);
  {$ifdef AXOLOT_DEBUG}
      FileStream := TFileStream.Create('d:\temp\content.xml',fmCreate);
      try
        FileStream.CopyFrom(Stream,0);
        Stream.Seek(0,soFromBeginning);
      finally
        FileStream.Free;
      end;
  {$endif}
      XML := TXLSReadXMLStream.Create(Stream);
      try
        OOData := TOOReadMetaData.Create(XML,XLS);
        BuildStructure;
        SheetXML := TXLSReadXMLMemory.Create(Stream.Memory,Stream.Size);
        try
          OOData.XML := SheetXML;
          while SheetXML.FindTag('<table:table table:name') do
            SheetTag.Parse;
        finally
          OOData.FXML := XML;
          OOData.FCurrSheet := -1;
          SheetXML.Free;
        end;
        try
          try
            TempDS := DecimalSeparator;
            DecimalSeparator := '.';
            try
              OOTag.FindTag;
              OOTag.Run;
            finally
              DecimalSeparator := TempDS;
            end;
          finally
            OOtag.Free;
          end;
        finally
          OOData.Free;
        end;
      finally
        XML.Free;
      end;
    finally
      Stream.Free;
    end;
  finally
    ZIP.Free;
  end;
end;

{ TOOReadMetaData }

procedure TOOReadMetaData.AddFormula(Formula: WideString);
var
  i: integer;
  Fmla: WideString;
  InSingleQuote: boolean;
  InDoubleQuote: boolean;
begin
  Fmla := '';
  InSingleQuote := False;
  InDoubleQuote := False;
  i := 1;
  while i <= Length(Formula) do begin
    if Formula[i] = '''' then begin
      InSingleQuote := not InSingleQuote;
      Fmla := Fmla + Formula[i];
      Inc(i);
    end
    else if Formula[i] = '"' then begin
      InDoubleQuote := not InDoubleQuote;
      Fmla := Fmla + Formula[i];
      Inc(i);
    end
    else if not InSingleQuote and not InDoubleQuote and (Formula[i] = '[') then begin
      Inc(i);
    end
    else begin
      Fmla := Fmla + Formula[i];
      Inc(i);
    end;
  end;
end;

constructor TOOReadMetaData.Create(XML: TXLSReadXML; XLS: TXLSReadWriteII2);
begin
  FXML := XML;
  FXLS := XLS;
  FFormats := TStringList.Create;
  FColumns := TOOXMLColList.Create;
  FRowStyles := TOOXMLColRowStyleList.Create;
  FCurrRow := -1;
  FCurrSheet := -1;
end;

destructor TOOReadMetaData.Destroy;
begin
  FFormats.Free;
  FColumns.Free;
  FRowStyles.Free;
  inherited;
end;

{ TOOXMLTag }

function TOOXMLTag.Add(Tag: TOOXMLTag): TOOXMLTag;
begin
  Result := Tag;
  inherited Add(Tag);
end;

constructor TOOXMLTag.Create(OOData: TOOReadMetaData; TagName: string);
begin
  inherited Create;
  FOOData := OOData;
  FTagName := TagName;
end;

procedure TOOXMLTag.EndTag;
begin

end;

procedure TOOXMLTag.FindTag;
begin
  while FOOData.XML.GetTagNext do begin
    if (FTagName = FOOData.XML.FullTag) and (FOOData.XML.TagType = ttBegin) then
      Break;
  end;
end;

function TOOXMLTag.GetItems(Index: integer): TOOXMLTag;
begin
  Result := TOOXMLTag(inherited Items[Index]);
end;

procedure TOOXMLTag.Parse;
begin

end;

procedure TOOXMLTag.Run;
var
  i: integer;
begin
  Parse;
  if FOOData.XML.TagType = ttSingle then
    Exit;
  while FOOData.XML.GetTagNext do begin
    for I := 0 to Count - 1 do begin
      if Items[i].FTagName = FOOData.XML.FullTag then
        Items[i].Run();
    end;
    if (FOOData.XML.FullTag = FTagName) and (FOOData.XML.TagType = ttEnd) then begin
      EndTag;
      if not FRepeatTag then
        Break;
    end;
  end;
end;

{ TOOXMLTagCell }

procedure TOOXMLTagCell.Parse;
var
  S,URL: string;
  Fmla: PByteArray;
  i,FmlaSz,ColsRepeated: integer;
  FmtIndex: integer;
  MergedCols,MergedRows: integer;
  WS: WideString;

function GetFormatIndex(Col: integer): integer;
var
  FmtName: string;
begin
  FmtName := Lowercase(FOOData.XML.Values.FindStrElement('table:style-name'));
  if FmtName = 'default' then
    Result := DEFAULT_FORMAT
  else if (FmtName <> '') and FOOData.FFormats.Find(FmtName,i) then
    Result := Integer(FOOData.FFormats.Objects[i])
  else begin
    if Col <= MAXCOL then
      FmtName := FOOData.FColumns[Col].DefCellStyle;
    if (FmtName <> '') and FOOData.FFormats.Find(FmtName,i) then
      Result := Integer(FOOData.FFormats.Objects[i])
    else
      Result := DEFAULT_FORMAT;
  end;
end;

begin
  ColsRepeated := StrToIntDef(FOOData.XML.Values.FindStrElement('table:number-columns-repeated'),1);
  S := FOOData.XML.Values.FindStrElement('office:value-type');
  FmtIndex := GetFormatIndex(FOOData.FCurrCol);
  MergedCols := FOOData.XML.Values.FindIntElement('table:number-columns-spanned',-1);
  MergedRows := FOOData.XML.Values.FindIntElement('table:number-rows-spanned',-1);
{
  with FOOData do begin
    if FmtName <> '' then
      FOOData.FXLS.Sheets[FCurrSheet].AsString[FCurrCol,FCurrRow] := FmtName
    else
      FOOData.FXLS.Sheets[FCurrSheet].AsString[FCurrCol,FCurrRow] := '[DEF]';
  end;
}

  with FOOData do begin
    if S <> '' then begin
      WS := FOOData.XML.Values.FindStrElement('table:formula');
      if (WS <> '') and (Copy(WS,1,6) = 'oooc:=') then begin
        GetMem(Fmla,FXLS.MaxBuffSize);
        FmlaSz := FXLS.FormulaHandler.EncodeFormula(Copy(WS,7,MAXINT),0,Fmla,FXLS.MaxBuffSize,True);
      end
      else begin
        Fmla := Nil;
        FmlaSz := 0;
      end;

      if S = 'float' then begin
        if Fmla <> Nil then
          FXLS.Sheets[FCurrSheet].WriteRawNumFormula(FCurrCol,FCurrRow,FmtIndex,Fmla,FmlaSz,FmlaSz,SafeStrToFloat(XML.Values.FindStrElement('office:value')))
        else
          FXLS.Sheets[FCurrSheet].IntWriteNumber(FCurrCol,FCurrRow,FmtIndex,SafeStrToFloat(XML.Values.FindStrElement('office:value')));
        FXLS.Formats[FmtIndex].IncUsageCount;
      end
      else if S = 'string' then begin
        URL := '';
        WS := '';
        while XML.GetTagNext do begin
          if (XML.FullTag = 'text:p') and (XML.TagType = ttEnd) then
            Break
          else if (XML.FullTag = 'text:a') and not (XML.TagType = ttEnd) then begin
            URL := XML.Values.FindStrElement('xlink:href');
            if URL <> '' then
              FXLS.Sheets[FCurrSheet].AsHyperlink[FCurrCol,FCurrRow] := URL;
          end;
          WS := WS + XML.Text + ' ';
        end;
        WS := Trim(WS);
        if Fmla <> Nil then
          FXLS.Sheets[FCurrSheet].WriteRawStrFormula(FCurrCol,FCurrRow,FmtIndex,Fmla,FmlaSz,FmlaSz,WS)
        else
          FXLS.Sheets[FCurrSheet].IntWriteSSTString(FCurrCol,FCurrRow,FmtIndex,WS);
        FXLS.Formats[FmtIndex].IncUsageCount;
        if URL <> '' then begin
          FXLS.Sheets[FCurrSheet].Cell[FCurrCol,FCurrRow].FontUnderline := xulSingle;
          FXLS.Sheets[FCurrSheet].Cell[FCurrCol,FCurrRow].FontColor := xcBlue;
        end;
      end
      else if S = 'boolean' then begin
        if Fmla <> Nil then
          FXLS.Sheets[FCurrSheet].WriteRawBoolFormula(FCurrCol,FCurrRow,FmtIndex,Fmla,FmlaSz,FmlaSz,XML.Values.FindStrElement('office:boolean-value') = 'true')
        else
          FXLS.Sheets[FCurrSheet].IntWriteBoolean(FCurrCol,FCurrRow,FmtIndex,XML.Values.FindStrElement('office:boolean-value') = 'true');
        FXLS.Formats[FmtIndex].IncUsageCount;
      end
      else if S = 'date' then begin
        S := XML.Values.FindStrElement('office:date-value');
        if S <> '' then
          FOOData.FXLS.Sheets[FCurrSheet].AsDateTime[FCurrCol,FCurrRow] := EncodeDate(StrToIntDef(Copy(S,1,4),0),StrToIntDef(Copy(S,6,2),0),StrToIntDef(Copy(S,9,2),0));
      end
      else if S = 'time' then begin
        S := XML.Values.FindStrElement('office:time-value');
        if S <> '' then
          FOOData.FXLS.Sheets[FCurrSheet].AsDateTime[FCurrCol,FCurrRow] := EncodeTime(StrToIntDef(Copy(S,3,2),0),StrToIntDef(Copy(S,6,2),0),StrToIntDef(Copy(S,9,2),0),0);
      end
      else
        FOOData.FXLS.Sheets[FCurrSheet].AsString[FCurrCol,FCurrRow] := '[' + S + ']';
      if Fmla <> Nil then
        FreeMem(Fmla);
    end
    else begin
      for i := 0 to ColsRepeated - 1 do begin
        if i > 0 then
          FmtIndex := GetFormatIndex(FCurrCol + i);
        if FmtIndex <> DEFAULT_FORMAT then begin
          FXLS.Sheets[FCurrSheet].IntWriteBlank(FCurrCol + i,FCurrRow,FmtIndex);
          FXLS.Formats[FmtIndex].IncUsageCount;
        end;
      end;
    end;
    if (MergedCols > 1) or (MergedRows > 1) then begin
      if MergedCols <= 0 then
        MergedCols := 1;
      if MergedRows <= 0 then
        MergedRows := 1;
      with FXLS.Sheets[0].MergedCells.Add do begin
        Col1 := FOOData.FCurrCol;
        Row1 := FOOData.FCurrRow;
        Col2 := FOOData.FCurrCol + MergedCols - 1;
        Row2 := FOOData.FCurrRow + MergedRows - 1;
        if FmtIndex <> DEFAULT_FORMAT then begin
          FXLS.Sheets[FCurrSheet].Range[Col1,Row1,Col2,Row2].BorderLeftColor := FXLS.Formats[FmtIndex].BorderLeftColor;
          FXLS.Sheets[FCurrSheet].Range[Col1,Row1,Col2,Row2].BorderLeftStyle := FXLS.Formats[FmtIndex].BorderLeftStyle;
          FXLS.Sheets[FCurrSheet].Range[Col1,Row1,Col2,Row2].BorderTopColor := FXLS.Formats[FmtIndex].BorderTopColor;
          FXLS.Sheets[FCurrSheet].Range[Col1,Row1,Col2,Row2].BorderTopStyle := FXLS.Formats[FmtIndex].BorderTopStyle;
          FXLS.Sheets[FCurrSheet].Range[Col1,Row1,Col2,Row2].BorderRightColor := FXLS.Formats[FmtIndex].BorderRightColor;
          FXLS.Sheets[FCurrSheet].Range[Col1,Row1,Col2,Row2].BorderRightStyle := FXLS.Formats[FmtIndex].BorderRightStyle;
          FXLS.Sheets[FCurrSheet].Range[Col1,Row1,Col2,Row2].BorderBottomColor := FXLS.Formats[FmtIndex].BorderBottomColor;
          FXLS.Sheets[FCurrSheet].Range[Col1,Row1,Col2,Row2].BorderBottomStyle := FXLS.Formats[FmtIndex].BorderBottomStyle;
        end;
      end;
    end;
  end;

  Inc(FOOData.FCurrCol,ColsRepeated);
end;

{ TOOXMLTagRow }

procedure TOOXMLTagRow.EndTag;
begin
  FRepeatTag := FRowsRepeated > 1;
  if FRepeatTag then begin
    Dec(FRowsRepeated);
    FOOData.XML.Seek(FRepeatPos);
    FOOData.FCurrCol := 0;
    Inc(FOOData.FCurrRow);
    SetHeight;
  end;
end;

procedure TOOXMLTagRow.Parse;
begin
  FOOData.FCurrCol := 0;
  FRowsRepeated := StrToIntDef(FOOData.XML.Values.FindStrElement('table:number-rows-repeated'),1);
  if FRowsRepeated > 1 then
    FRepeatPos := FOOData.XML.Position
  else
    FRepeatPos := -1;
//  Inc(FOOData.FCurrRow,FRowsRepeated);
  Inc(FOOData.FCurrRow);
  SetHeight;
end;

procedure TOOXMLTagRow.SetHeight;
var
  S: string;
  i: integer;
  XRow: TXLSRow;
begin
  S := FOOData.XML.Values.FindStrElement('table:style-name');
  if S <> '' then begin
    i := FOOData.FRowStyles.Find(S);
    if (i >= 0) and (FOOData.FRowStyles[i].FSize >= 0) then begin
      XRow := FOOData.XLS.Sheet[FOOData.FCurrSheet].Rows.AddIfNone(FOOData.FCurrRow);
      XRow.Height := Round((FOOData.FRowStyles[i].FSize * 28.34) * 20);
    end;
  end;
end;

{ TOOXMLTagCellCovered }

procedure TOOXMLTagCellCovered.Parse;
begin
  Inc(FOOData.FCurrCol,StrToIntDef(FOOData.XML.Values.FindStrElement('table:number-columns-repeated'),1));
end;

{ TOOXMLTagTable }

procedure TOOXMLTagTable.EndTag;
begin
  FOOData.FColumns.Clear;
end;

procedure TOOXMLTagTable.Parse;
var
  WS: WideString;
begin
  Inc(FOOData.FCurrSheet);
  WS := FOOData.FXML.Values.FindStrElement('table:name');
  if (WS <> '') and (FOOData.FXLS.Sheets.SheetByName(WS) = Nil) then begin
    if (FOOData.FCurrSheet > 0) and ((FOOData.FXLS.Sheets.Count - 1) <= FOOData.FCurrSheet) then
      FOOData.FXLS.Sheets.Add;
    FOOData.FXLS.Sheet[FOOData.FCurrSheet].Name := WS;
  end
  else if FOOData.FCurrSheet = 0 then
    FOOData.FXLS.Sheet[FOOData.FCurrSheet].Name := WS;
end;

{ TOOXMLTagStyle }

procedure TOOXMLTagStyle.EndTag;
var
  FI: integer;
begin
  FI := -1;
  if FFontAssigned then begin
    with FOOData.FXLS.Fonts.Add do begin
      if FFont.Name <> '' then
        Name := FFont.Name;
      if FFont.Size > 0 then
        Size20 := Round(FFont.Size * 20);
      if FFont.Color <> xcAutomatic then
        Color := FFont.Color;
      if FFont.Style <> [] then
        Style := FFont.Style;
      if FFont.SubSuperscript > xssNone then
        SubSuperscript := FFont.SubSuperscript;
      if FFont.Underline > xulNone then
        Underline := FFont.Underline;
      FI := Index;
      FAssigned := True;
    end;
  end;
  if FAssigned then begin
    with FOOData.FXLS.Formats.Add do begin
      FillPatternForeColor := FBkgColor;

      BorderLeftColor := FBorders[0].BorderColor;
      BorderLeftStyle := FBorders[0].BorderStyle;
      BorderTopColor := FBorders[1].BorderColor;
      BorderTopStyle := FBorders[1].BorderStyle;
      BorderRightColor := FBorders[2].BorderColor;
      BorderRightStyle := FBorders[2].BorderStyle;
      BorderBottomColor := FBorders[3].BorderColor;
      BorderBottomStyle := FBorders[3].BorderStyle;

      if FI > 0 then
        FontIndex := FI;

      FOOData.FFormats.AddObject(FName,TObject(Index));
      IncUsageCount;
    end;
  end;
end;

procedure TOOXMLTagStyle.Parse;
begin
  Reset;
  FName := FOOData.FXML.Values.FindStrElement('style:name');
end;

procedure TOOXMLTagStyle.Reset;
var
  i: integer;
begin
  FAssigned := False;
  FFontAssigned := False;
  FFont.Size := 0;
  FFont.Name := '';
  FFont.Style := [];
  FFont.SubSuperscript := xssNone;
  FFont.Underline := xulNone;
  FFont.Color := xcAutomatic;
  FBkgColor := xcAutomatic;
  for i  := 0 to 3 do begin
    FBorders[i].BorderStyle := cbsNone;
    FBorders[i].BorderColor := xcAutomatic;
  end;
end;

procedure TOOXMLTagStyle.SetBorder(Index,Color: integer; BorderStyle: TCellBorderStyle);
begin
  ColorSwap(Color);
  FBorders[Index].BorderColor := TColorToClosestXColor(Color);
  FBorders[Index].BorderStyle := BorderStyle;
end;

{ TOOXMLTagStyleParent }

procedure TOOXMLTagStyleParent.EndTag;
begin
  inherited;
  FOOData.FFormats.Sort;
end;

procedure TOOXMLTagStyleParent.Parse;
begin

end;

{ TOOXMLTagStyleData }

constructor TOOXMLTagStyleCell.Create(OOData: TOOReadMetaData; TagName: string; Parent: TOOXMLTagStyle);
begin
  inherited Create(OOData,TagName);
  FParent := Parent;
end;

procedure TOOXMLTagStyleCell.Parse;
var
  i: integer;
  S: string;

procedure SetColor(var Dest: TExcelColor; Src: integer);
begin
  ColorSwap(Src);
  Dest := TColorToClosestXColor(Src);
end;

procedure GetBorderData(Index,Border: integer);
var
  S: string;
  D: double;
  W: integer;
  BStyle: TCellBorderStyle;
begin
  FOOData.XML.Values.SplitValue(Index);
  if FOOData.XML.Values.ValueParts.Count = 3 then begin
    FParent.FAssigned := True;
    BStyle := cbsNone;
    S := FOOData.XML.Values.ValueParts[0];
    if Copy(S,Length(S) - 1,2) = 'cm' then begin
      D := SafeStrToFloat(Copy(S,1,Length(S) - 2));
      W := Round((96 / 2.54) * D);
      case W of
        0: BStyle := cbsHair;
        1: BStyle := cbsThin;
        2: BStyle := cbsMedium;
        else
          BStyle := cbsThick;
      end;
    end;
    if Border >= 0 then
      FParent.SetBorder(Border,HexStrToInt(FOOData.XML.Values.ValueParts[2]),BStyle)
    else begin
      FParent.SetBorder(0,HexStrToInt(FOOData.XML.Values.ValueParts[2]),BStyle);
      FParent.SetBorder(1,HexStrToInt(FOOData.XML.Values.ValueParts[2]),BStyle);
      FParent.SetBorder(2,HexStrToInt(FOOData.XML.Values.ValueParts[2]),BStyle);
      FParent.SetBorder(3,HexStrToInt(FOOData.XML.Values.ValueParts[2]),BStyle);
    end;
  end;
end;

begin
  for i := 0 to FOOData.FXML.Values.Count - 1 do begin
    S := FOOData.XML.Values.Element[i];
    if S = 'fo:background-color' then begin
      if FOOData.XML.Values.Value[i] = 'transparent' then
        FParent.FBkgColor := xcAutomatic
      else
        SetColor(FParent.FBkgColor,FOOData.XML.Values.AsInteger[i]);
      FParent.FAssigned := True;
    end
    else if S = 'fo:border' then
      GetBorderData(i,-1)
    else if S = 'fo:border-left' then
      GetBorderData(i,0)
    else if S = 'fo:border-top' then
      GetBorderData(i,1)
    else if S = 'fo:border-right' then
      GetBorderData(i,2)
    else if S = 'fo:border-bottom' then
      GetBorderData(i,3);
  end;
end;

{ TOOXMLColList }

function TOOXMLColList.Add: TOOXMLColData;
begin
  Result := TOOXMLColData.Create;
  inherited Add(Result);
end;

function TOOXMLColList.GetItems(Index: integer): TOOXMLColData;
begin
  Result := TOOXMLColData(inherited Items[Index]);
end;

{ TOOXMLTagColumn }

procedure TOOXMLTagColumn.Parse;
var
  i: integer;
  S1,S2: string;
begin
  S1 := FOOData.FXML.Values.FindStrElement('table:style-name');
  S2 := Lowercase(FOOData.FXML.Values.FindStrElement('table:default-cell-style-name'));
  if S2 = 'default' then
    S2 := '';
  for i := 0 to FOOData.FXML.Values.FindIntElement('table:number-columns-repeated',1) - 1 do begin
    with FOOData.FColumns.Add do begin
      FStyle := S1;
      FDefCellStyle := S2;
    end;
  end;
end;

{ TOOXMLTagStyleText }

constructor TOOXMLTagStyleText.Create(OOData: TOOReadMetaData; TagName: string; Parent: TOOXMLTagStyle);
begin
  inherited Create(OOData,TagName);
  FParent := Parent;
end;

procedure TOOXMLTagStyleText.Parse;
var
  i: integer;
  S: string;
  Cl: integer;
begin
  for i := 0 to FOOData.FXML.Values.Count - 1 do begin
    S := FOOData.XML.Values.Element[i];
    if S = 'fo:font-size' then begin
      FParent.FFontAssigned := True;
      FParent.FFont.Size := FOOData.XML.Values.AsFloat[i];
    end
    else if S = 'style:font-name' then begin
      FParent.FFontAssigned := True;
      FParent.FFont.Name := FOOData.XML.Values.Value[i];
    end
    else if S = 'fo:font-style' then begin
      if FOOData.XML.Values.Value[i] = 'italic' then begin
        FParent.FFontAssigned := True;
        FParent.FFont.Style := FParent.FFont.Style + [xfsItalic];
      end;
    end
    else if S = 'fo:font-weight' then begin
      if FOOData.XML.Values.Value[i] = 'bold' then begin
        FParent.FFontAssigned := True;
        FParent.FFont.Style := FParent.FFont.Style + [xfsBold];
      end;
    end
    else if S = 'style:text-underline-style' then begin
      if FOOData.XML.Values.Value[i] = 'solid' then begin
        FParent.FFontAssigned := True;
        FParent.FFont.Underline := xulSingle;
      end;
    end
    else if S = 'fo:color' then begin
      FParent.FFontAssigned := True;
      Cl := HexStrToInt(FOOData.XML.Values[i]);
      ColorSwap(Cl);
      FParent.FFont.Color := TColorToClosestXColor(Cl);
    end;
  end;
end;

{ TOOXMLTagStyleRow }

constructor TOOXMLTagStyleRow.Create(OOData: TOOReadMetaData; TagName: string; Parent: TOOXMLTagStyle);
begin
  inherited Create(OOData,TagName);
  FParent := Parent;
end;

procedure TOOXMLTagStyleRow.Parse;
var
  i: integer;
  S: string;
begin
  with FOOData.FRowStyles.Add do begin
    Name := FParent.FName;
    Size := -1;
    for i := 0 to FOOData.FXML.Values.Count - 1 do begin
      S := FOOData.XML.Values.Element[i];
      if S = 'style:row-height' then
        Size := FOOData.FXML.Values.AsFloat[i];
    end;
  end;
end;

{ TOOXMLColRowStyleList }

function TOOXMLColRowStyleList.Add: TOOXMLColRowStyle;
begin
  Result := TOOXMLColRowStyle.Create;
  inherited Add(Result);
end;

function TOOXMLColRowStyleList.Find(Name: string): integer;
begin
  for Result := 0 to Count - 1 do begin
    if Items[Result].FName = Name then
      Exit;
  end;
  Result := -1;
end;

function TOOXMLColRowStyleList.GetItems(Index: integer): TOOXMLColRowStyle;
begin
  Result := TOOXMLColRowStyle(inherited Items[Index]);
end;

end.
