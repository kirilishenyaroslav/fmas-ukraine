unit XLSWriteII2;

{-
********************************************************************************
******* XLSReadWriteII V3.00                                             *******
*******                                                                  *******
******* Copyright(C) 1999,2006 Lars Arvidsson, Axolot Data               *******
*******                                                                  *******
******* email: components@axolot.com                                     *******
******* URL:   http://www.axolot.com                                     *******
*******************************************************f*************************
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

uses Classes, SysUtils, Dialogs, BIFFRecsII2, CellFormats2, SheetData2, Windows,
     XLSUtils2, XLSStream2, XLSFonts2, ExcelMaskII2, EncodeFormulaII2,
     XLSReadWriteII2, Cell2, Graphics, Contnrs, RecordStorage2;

type TBoundsheetType = (btSheet,btChart,btVBModule,btExcel4Macro);

type TBoundsheetData = class(TObject)
private
     FBoundsheetType: TBoundsheetType;
     FIndex: integer;
     FFilePos: integer;
     FName: WideString;
     FHidden: THiddenState;
public
     procedure WritePos(Stream: TXLSStream);
     property BoundsheetType: TBoundsheetType read FBoundsheetType write FBoundsheetType;
     property Index: integer read FIndex write FIndex;
     property FilePos: integer read FFilePos write FFilePos;
     property Name: WideString read FName write FName;
     property Hidden: THiddenState read FHidden write FHidden;
     end;

type TBoundsheetList = class(TObjectList)
private
     function GetCharts(Index: integer): TBoundsheetData;
     function GetItems(Index: integer): TBoundsheetData;
     function GetSheets(Index: integer): TBoundsheetData;
public
     procedure AddSheet(Index: integer; Name: WideString; Hidden: THiddenState; WorksheetType: TWorksheetType);
     procedure AddChart(Index: integer; Name: WideString);

     property Items[Index: integer]: TBoundsheetData read GetItems; default;
     property Sheets[Index: integer]: TBoundsheetData read GetSheets;
     property Charts[Index: integer]: TBoundsheetData read GetCharts;
     end;

type TXLSWriteII = class(TObject)
protected
     FXLS: TXLSReadWriteII2;
     PBuf: PByteArray;
     FCurrSheet: integer;
     FXLSStream: TXLSStream;
     FBoundsheetList: TBoundsheetList;

     procedure WriteRecId(RecId: word);
     procedure WriteWord(RecId,Value: word);
     procedure WriteBoolean(RecId: word; Value: boolean);
     procedure WriteBuf(RecId,Size: word);
     procedure WritePointer(RecId: word; P: Pointer; Size: word);

     // File prefix
     procedure WREC_BOF(SubStreamType: TSubStreamType);
     procedure WREC_INTERFACEHDR;
     procedure WREC_ADDMENU;
     procedure WREC_DELMENU;
     procedure WREC_INTERFACEEND;
     procedure WREC_WRITEACCESS;
     procedure WREC_CODEPAGE;
     procedure WREC_DSF;
     procedure WREC_EXCEL9FILE;
//     procedure WREC_TABID;
     procedure WREC_OBPROJ;
     procedure WREC_FNGROUPCOUNT;
     procedure WREC_WINDOWPROTECT;
     procedure WREC_PROTECT;
     procedure WREC_PROTECT_Sheet(Value: boolean);
     procedure WREC_PASSWORD;
     procedure WREC_PROT4REV;
     procedure WREC_PROT4REVPASS;
     procedure WREC_WINDOW1;
     procedure WREC_BACKUP;
     procedure WREC_HIDEOBJ;
     procedure WREC_1904;
     procedure WREC_PRECISION;
     procedure WREC_REFRESHALL;
     procedure WREC_BOOKBOOL;
     procedure WREC_FONT;
     procedure WREC_FORMAT;
     procedure WREC_XF;
     procedure WREC_STYLE;
     procedure WREC_PALETTE;
//     procedure WREC_EXTERNNAME;
     procedure WREC_USESELFS;
     procedure WREC_BOUNDSHEET(Index: integer);
     procedure WREC_COUNTRY;
     procedure WREC_MSODRAWINGGROUP;
     procedure WREC_SST;
     procedure WREC_EOF;

     // Sheet prefix
     procedure WREC_CALCMODE;
     procedure WREC_CALCCOUNT;
     procedure WREC_REFMODE;
     procedure WREC_ITERATION;
     procedure WREC_DELTA;
     procedure WREC_SAVERECALC;
     procedure WREC_PRINTHEADERS;
     procedure WREC_PRINTGRIDLINES;
     procedure WREC_GRIDSET;
     procedure WREC_GUTS;
     procedure WREC_DEFAULTROWHEIGHT;
     procedure WREC_WSBOOL;
     procedure WREC_HORIZONTALPAGEBREAKS;
     procedure WREC_VERTICALPAGEBREAKS;
     procedure WREC_HEADER;
     procedure WREC_FOOTER;
     procedure WREC_HCENTER;
     procedure WREC_VCENTER;
     procedure WREC_PLS;
     procedure WREC_MARGINS;
     procedure WREC_SETUP;
     procedure WREC_DEFCOLWIDTH;
     procedure WREC_COLINFO;
     procedure WREC_DIMENSIONS;
     procedure WREC_ROW;

     // Sheet suffix
     procedure WREC_MSODRAWING;
     procedure WREC_MSODRAWINGSELECTION;
     procedure WREC_NOTE;
     procedure WREC_WINDOW2;
     procedure WREC_SCL;
     procedure WREC_PANE;
     procedure WREC_SELECTION;
     procedure WREC_SHEETPROTECTION;

     procedure WREC_MERGECELLS;
     procedure WREC_CONDFMT;
     procedure WREC_HLINK;
     procedure WREC_DVAL;
public
     constructor Create(XLS: TXLSReadWriteII2);
     destructor Destroy; override;
     procedure WriteToStream(Stream: TStream);
     procedure WriteToStream40(Stream: TStream);
     end;

implementation

type TWordArray = array[0..65535] of word;
     PWordArray = ^TWordArray;

// If the number of default formats are changed, DEFAULT_FORMATS_COUNT_97 in BIFFRecsII must be changed.
{ TXLSWriteII }

constructor TXLSWriteII.Create(XLS: TXLSReadWriteII2);
begin
  FXLS := XLS;
  GetMem(PBuf,FXLS.MaxBuffsize);
  FXLSStream := TXLSStream.Create(FXLS.VBA);
  FBoundsheetList := TBoundsheetList.Create;
end;

destructor TXLSWriteII.Destroy;
begin
  FreeMem(PBuf);
  FXLSStream.Free;
  FBoundsheetList.Free;
end;

procedure TXLSWriteII.WriteRecId(RecId: word);
var
  Header: TBIFFHeader;
begin
  Header.RecId := RecID;
  Header.Length := 0;
  FXLSStream.Write(Header,SizeOf(TBIFFHeader));
end;

procedure TXLSWriteII.WriteWord(RecId,Value: word);
var
  Header: TBIFFHeader;
begin
  Header.RecId := RecID;
  Header.Length := SizeOf(word);
  FXLSStream.Write(Header,SizeOf(TBIFFHeader));
  FXLSStream.Write(Value,SizeOf(word));
end;

procedure TXLSWriteII.WriteBoolean(RecId: word; Value: boolean);
begin
  if Value then
    WriteWord(RecId,1)
  else
    WriteWord(RecId,0);
end;

procedure TXLSWriteII.WriteBuf(RecId,Size: word);
begin
  FXLSStream.WriteHeader(RecId,Size);
  if Size > 0 then
    FXLSStream.Write(PBuf^,Size);
end;

procedure TXLSWriteII.WritePointer(RecId: word; P: Pointer; Size: word);
var
  Header: TBIFFHeader;
begin
  Header.RecId := RecID;
  Header.Length := Size;
  FXLSStream.Write(Header,SizeOf(TBIFFHeader));
  if Size > 0 then
    FXLSStream.Write(P^,Header.Length);
end;

procedure TXLSWriteII.WriteToStream(Stream: TStream);
var
  i,j,k: integer;
  HasRecordData: boolean;
begin
  FBoundsheetList.Clear;
  try
    k := 0;
    for i := 0 to FXLS.Sheets.Count - 1 do begin
      while (k < FXLS.SheetCharts.Count) and (FXLS.SheetCharts[k].SheetIndex <= FXLS.Sheets[i]._Int_SheetIndex) do begin
        FBoundsheetList.AddChart(k,FXLS.SheetCharts[k].Name);
        Inc(k);
      end;
      if FXLS.Sheets[i].Pane.PaneType = ptFrozen then begin
        FXLS.Sheets[i]._Int_Records.WINDOW2.Options := FXLS.Sheets[i]._Int_Records.WINDOW2.Options or $0008;
        FXLS.Sheets[i]._Int_Records.WINDOW2.Options := FXLS.Sheets[i]._Int_Records.WINDOW2.Options or $0100;
      end;
      if i = FXLS.Workbook.SelectedTab then
        // Selected tab.
        FXLS.Sheets[i]._Int_Records.WINDOW2.Options := FXLS.Sheets[i]._Int_Records.WINDOW2.Options or $0200
      else
        FXLS.Sheets[i]._Int_Records.WINDOW2.Options := FXLS.Sheets[i]._Int_Records.WINDOW2.Options and not $0200;
      FBoundsheetList.AddSheet(i,FXLS.Sheets[i].Name,FXLS.Sheets[i].Hidden,FXLS.Sheets[i].WorksheetType);
    end;
    // Charts after the last sheet.
    while k < FXLS.SheetCharts.Count do begin
      FBoundsheetList.AddChart(k,FXLS.SheetCharts[k].Name);
      Inc(k);
    end;

    HasRecordData := FXLS.Records.Count > 0;

{$ifdef USE_MSSTORAGE}
    FXLSStream.ExtraObjects := FXLS.ExtraObjects;
    FXLSStream.TargetStream := Stream;
{$endif}
    FXLSStream.SaveVBA := FXLS.PreserveMacros;
    FXLSStream.OpenStorageWrite(FXLS.Filename,FXLS.Version);

    if not HasRecordData then
      FXLS.Records.MoveAllDefault;
    for i := 0 to FXLS.Records.Count - 1 do begin
      try
        case FXLS.Records[i].RecId of
          $0809: begin
            FXLS.Records.WriteRec(i,FXLSStream);
            if (PRecBOF8(@FXLS.Records[i].Data).SubstreamType = $0005) and (FXLS.Password <> '') then begin
              PRecFILEPASS(PBuf).Options := $0001;
              PRecFILEPASS(PBuf).SillyPassword[0] := $01;
              PRecFILEPASS(PBuf).SillyPassword[1] := $00;
              PRecFILEPASS(PBuf).SillyPassword[2] := $01;
              PRecFILEPASS(PBuf).SillyPassword[3] := $00;
              FXLSStream.CreatePassword(PRecFILEPASS(PBuf),FXLS.Password);
              FXLSStream.WriteHeader(BIFFRECID_FILEPASS,SizeOf(TRecFILEPASS));
              FXLSStream.Write(PBuf^,SizeOf(TRecFILEPASS));
              // These records are not really needed, but when encrypting files,
              // the first record after FILEPASS is unencrypted, and without
              // these, that record will be WRITEACCESS.
              if FXLS.Records.FindRecord(BIFFRECID_INTERFACEHDR) < 0 then begin
                FXLSStream.WriteWord(BIFFRECID_INTERFACEHDR,$04B0);
                FXLSStream.WriteWord(BIFFRECID_MMSADDMENUDELMENU,$0000);
                FXLSStream.WriteHeader(BIFFRECID_INTERFACEEND,0);
              end;
            end;
          end;

          BIFFRECID_WRITEACCESS: begin
            FXLS.Records.WriteRec(i,FXLSStream);
            j := FXLS.GetFILESHARING(PBuf);
            if j > 1 then
              FXLSStream.WriteBufHeader(PBuf^,BIFFRECID_FILESHAREING,j);
          end;

          BIFFRECID_OBPROJ:
            WREC_OBPROJ;
{
          BIFFRECID_PASSWORD:
            WREC_PASSWORD;
}
          INTERNAL_FORMATS: begin
            WREC_FONT;
            WREC_FORMAT;
            WREC_XF;
            WREC_STYLE;
            WREC_PALETTE;
          end;
          INTERNAL_BOUNDSHEETS: begin
            for j := 0 to FBoundsheetList.Count - 1 do
              WREC_BOUNDSHEET(j);
          end;
          INTERNAL_NAMES: begin
            FXLS.FormulaHandler.ExternalNames.WriteRecords(FXLSStream);
            FXLS.FormulaHandler.InternalNames.WriteRecords(FXLSStream);
          end;
          INTERNAL_MSODRWGRP: begin
            if FXLS.MSOPictures.HasData then begin
              FXLSStream.BeginCONTINUEWrite(MAXRECSZ_97);
              FXLS.MSOPictures.WriteToStream(FXLSStream,PBuf);
              FXLSStream.EndCONTINUEWrite;
            end;
          end;
          INTERNAL_SST:
            FXLS.Sheets.WriteSST(FXLSStream);
          BIFFRECID_TABID: begin
            if FXLS.Records[i].Length = 0 then begin
              FXLSStream.WriteHeader(BIFFRECID_TABID,FXLS.Sheets.Count * 2);
              for j := 1 to FXLS.Sheets.Count do
                FXLSStream.WWord(j);
            end;
            if (FXLS.VBA.Count > 0) and (FXLS.Records.FindRecord(BIFFRECID_OBPROJ) < 0)  then
              WREC_OBPROJ;
          end;
          else
            FXLS.Records.WriteRec(i,FXLSStream);
        end;
      except
        on E: Exception do
          raise Exception.CreateFmt('Error on writing record # %d' + #13 + E.Message,[i]);
      end;
    end;
    k := 0;
    for i := 0 to FXLS.Sheets.Count - 1 do begin
      if FXLS.Sheets[i].SheetProtection <> DefaultSheetProtections then
        FXLS.Sheets[i]._Int_Records.PROTECT := 1
      else
        FXLS.Sheets[i]._Int_Records.PROTECT := 0;
      FXLS.Sheets[i].CalcDimensions;

      if not FXLS.Sheets[i]._Int_HasDefaultRecords then begin
        FXLS.Sheets[i]._Int_Records.MoveAllDefault;
        FXLS.Sheets[i]._Int_HasDefaultRecords := True;
      end;

      FCurrSheet := i;

      while (k < FXLS.SheetCharts.Count) and (FXLS.SheetCharts[k].SheetIndex < FXLS.Sheets[i]._Int_SheetIndex) do begin
        FBoundsheetList.Charts[k].WritePos(FXLSStream);
        FXLS.SheetCharts.SaveToStream(k,FXLSStream);
        Inc(k);
      end;
      FBoundsheetList.Sheets[i].WritePos(FXLSStream);

      for j := 0 to FXLS.Sheets[i]._Int_Records.Count - 1 do begin
        case FXLS.Sheets[i]._Int_Records[j].RecId of
          // Prefix data
          BIFFRECID_SETUP: begin
            FXLS.Sheets[i]._Int_Records.WriteRec(j,FXLSStream);
{
            if FXLS.Sheets[FCurrSheet].SheetProtection <> DefaultSheetProtections then begin
              WriteWord(BIFFRECID_SCENPROTECT,1);
              WriteWord(BIFFRECID_OBJPROTECT,1);
            end;
}
          end;
          BIFFRECID_DEFCOLWIDTH: begin
            FXLS.Sheets[i]._Int_Records.WriteRec(j,FXLSStream);
            FXLS.Sheets[i].Autofilters.SaveToStream(FXLSStream,PBuf);
          end;
          INTERNAL_PAGEBREAKES: begin
            WREC_HORIZONTALPAGEBREAKS;
            WREC_VERTICALPAGEBREAKS;
          end;
          INTERNAL_HEADER: begin
            WREC_HEADER;
            WREC_FOOTER;
          end;
          INTERNAL_MARGINS: begin
            WREC_MARGINS;
          end;
          INTERNAL_COLINFO: begin
            WREC_COLINFO;
          end;
          INTERNAL_CELLDATA: begin
            WREC_ROW;
            FXLS.Sheets[i].StreamWriteCells(FXLS.Version,FXLSStream);
          end;
          BIFFRECID_SELECTION: begin
            if FXLS.Sheets[FCurrSheet].Pane.PaneType = ptNone then
              FXLS.Sheets[i]._Int_Records.WriteRec(j,FXLSStream);
          end;
          BIFFRECID_WINDOW2: begin
            // If zoom in WINDOW2 is changed, SCL has to be written.
            FXLS.Sheets[i]._Int_Records.WriteRec(j,FXLSStream);
            WREC_SCL;
          end;
{
          BIFFRECID_PASSWORD:
            WREC_PASSWORD;
}
          INTERNAL_SUFFIXDATA : begin
            WREC_MSODRAWING;
            WREC_PANE;
            WREC_MERGECELLS;
            WREC_CONDFMT;
            WREC_HLINK;
            WREC_DVAL;
            WREC_SHEETPROTECTION;
          end;
          else
            FXLS.Sheets[i]._Int_Records.WriteRec(j,FXLSStream);
        end;
      end;
//      FXLSStream.WriteHeader(BIFFRECID_EOF,0);
    end;
    // Charts after the last sheet.
    while k < FXLS.SheetCharts.Count do begin
      FBoundsheetList.Charts[k].WritePos(FXLSStream);
      FXLS.SheetCharts.SaveToStream(k,FXLSStream);
      Inc(k);
    end;
{$ifdef USE_MSSTORAGE}
    if FXLS.Password <> '' then
      FXLSStream.EncryptFile;
    if FXLSStream.SaveVBA then
      FXLSStream.WriteVBA;
{$else}
    FXLSStream.CloseStream;
    if FXLSStream.SaveVBA then
      FXLSStream.WriteCache(FXLS.CacheFiles);
{$endif}
  finally
    FXLSStream.CloseStorage;
  end;
  FBoundsheetList.Clear;
end;

procedure TXLSWriteII.WriteToStream40(Stream: TStream);
begin
  try
{$ifdef USE_MSSTORAGE}
    FXLSStream.TargetStream := Stream;
{$endif}    
    FXLSStream.OpenStorageWrite(FXLS.Filename,FXLS.Version);
    WREC_BOF(stWorksheet);
    WREC_WRITEACCESS;
  //  WREC_CODENAME;
    WREC_CALCMODE;
    WREC_CALCCOUNT;
    WREC_REFMODE;
    WREC_ITERATION;
    WREC_DELTA;
    WREC_SAVERECALC;
    WREC_PRECISION;
    WREC_1904;
    WREC_PRINTHEADERS;
    WREC_PRINTGRIDLINES;
    WREC_GRIDSET;
    WREC_GUTS;
    WREC_DEFAULTROWHEIGHT;
    WREC_COUNTRY;
    WREC_HIDEOBJ;
    WREC_WSBOOL;

    WREC_FONT;
    WREC_HEADER;
    WREC_FOOTER;
    WREC_HCENTER;
    WREC_VCENTER;
    WREC_SETUP;
    WREC_BACKUP;
    WREC_FORMAT;
    WREC_WINDOWPROTECT;
    WREC_XF;
    WREC_STYLE;
    WREC_DEFCOLWIDTH;
    WREC_DIMENSIONS;
  //  WREC_ROW;
    FXLS.Sheets[0].StreamWriteCells(FXLS.Version,FXLSStream);
    WREC_WINDOW1;
    WREC_WINDOW2;
    WREC_SELECTION;
  //  WREC_GCW;
      WREC_EOF;
  finally
    FXLSStream.CloseStorage;
  end;
end;

procedure TXLSWriteII.WREC_1904;
begin
//  WriteWord(BIFFRECID_1904,Integer(FXLS.DateSystem1904));
end;

procedure TXLSWriteII.WREC_ADDMENU;
begin
  // Not used
end;

procedure TXLSWriteII.WREC_BACKUP;
begin
  WriteWord(BIFFRECID_BACKUP,Word(FXLS.Backup));
end;

procedure TXLSWriteII.WREC_BOF(SubStreamType: TSubStreamType);
begin
  case FXLS.Version of
    xvExcel40: begin
      PRecBOF4(PBuf).A := $0000;
      PRecBOF4(PBuf).B := $0010;
      PRecBOF4(PBuf).C := $18AF;
    end;
    xvExcel50: begin
      PRecBOF8(PBuf).VersionNumber := $0500;
      // Can not be zero.
      PRecBOF8(PBuf).BuildIdentifier := $0DBB;
      // Can not be zero.
      PRecBOF8(PBuf).BuildYear := $07CE;
    end;
    xvExcel97: begin
      PRecBOF8(PBuf).VersionNumber := $0600;
      PRecBOF8(PBuf).BuildIdentifier := $18AF;
      PRecBOF8(PBuf).BuildYear := $07CD;
      PRecBOF8(PBuf).FileHistoryFlags := 0;
      if FXLS.IsMac then
        PRecBOF8(PBuf).FileHistoryFlags := $00000010;
      PRecBOF8(PBuf).LowBIFF := $00000106;
    end;
  end;
  if FXLS.Version > xvExcel40 then begin
    case SubStreamType of
      stGlobals:      PRecBOF8(PBuf).SubStreamType := $0005;
      stVBModule:     PRecBOF8(PBuf).SubStreamType := $0006;
      stWorksheet:    PRecBOF8(PBuf).SubStreamType := $0010;
      stChart:        PRecBOF8(PBuf).SubStreamType := $0020;
      stExcel4Macro:  PRecBOF8(PBuf).SubStreamType := $0040;
      stWorkspace:    PRecBOF8(PBuf).SubStreamType := $0100;
    end;
  end;
  case FXLS.Version of
    xvExcel40: WriteBuf($0409,SizeOf(TRecBOF4));
    xvExcel50: WriteBuf($0809,SizeOf(TRecBOF7));
    xvExcel97: WriteBuf($0809,SizeOf(TRecBOF8));
  end;
end;

procedure TXLSWriteII.WREC_BOOKBOOL;
begin
  WriteWord(BIFFRECID_BOOKBOOL,Word(FXLS.OptionsDialog.SaveExtLinkVal));
end;

procedure TXLSWriteII.WREC_BOUNDSHEET(Index: integer);
var
  S: string;
begin
  if FXLS.Version >= xvExcel97 then begin
    FBoundsheetList[Index].FilePos := FXLSStream.Pos + SizeOf(TBIFFHeader);
    PRecBOUNDSHEET8(PBuf).BOFPos := 0;
    case FBoundsheetList[Index].FBoundsheetType of
      btSheet:       PRecBOUNDSHEET8(PBuf).Options := $0000;
      btChart:       PRecBOUNDSHEET8(PBuf).Options := $0200;
      btVBModule:    PRecBOUNDSHEET8(PBuf).Options := $0600;
      btExcel4Macro: PRecBOUNDSHEET8(PBuf).Options := $0100;
    end;
    PRecBOUNDSHEET8(PBuf).Options := PRecBOUNDSHEET8(PBuf).Options + Word(FBoundsheetList[Index].FHidden);
    PRecBOUNDSHEET8(PBuf).NameLen := Length(FBoundsheetList[Index].Name);
    PRecBOUNDSHEET8(PBuf).Name[0] := $01;
    Move(Pointer(FBoundsheetList[Index].Name)^,PRecBOUNDSHEET8(PBuf).Name[1],Length(FBoundsheetList[Index].Name) * 2);
    WriteBuf(BIFFRECID_BOUNDSHEET,7 + Length(FBoundsheetList[Index].Name) * 2 + 1);
  end
  else if FXLS.Version >= xvExcel50 then begin
    FBoundsheetList[Index].FilePos := FXLSStream.Pos + SizeOf(TBIFFHeader);
    PRecBOUNDSHEET7(PBuf).BOFPos := 0;
    case FBoundsheetList[Index].FBoundsheetType of
      btSheet: PRecBOUNDSHEET7(PBuf).Options := $0000;
      btChart: PRecBOUNDSHEET7(PBuf).Options := $0200;
    end;
    PRecBOUNDSHEET7(PBuf).Options := PRecBOUNDSHEET7(PBuf).Options + Word(FBoundsheetList[Index].FHidden);
    S := '0' + FBoundsheetList[Index].Name;
    PRecBOUNDSHEET7(PBuf).NameLen := Length(S) - 1;
    Move(Pointer(S)^,PRecBOUNDSHEET7(PBuf).Name,Length(S));
    WriteBuf(BIFFRECID_BOUNDSHEET,7 + Length(S));
  end;
end;

procedure TXLSWriteII.WREC_CODEPAGE;
begin
  WriteWord(BIFFRECID_CODEPAGE,FXLS.Codepage);
end;

procedure TXLSWriteII.WREC_COUNTRY;
begin
  if FXLS.Version < xvExcel97 then Exit;
  PRecCOUNTRY(PBuf).DefaultCountryIndex := FXLS.DefaultCountryIndex;
  PRecCOUNTRY(PBuf).WinIniCountry := FXLS.WinIniCountry;
  WriteBuf(BIFFRECID_COUNTRY,SizeOf(TRecCOUNTRY));
end;

procedure TXLSWriteII.WREC_DELMENU;
begin
  // Not used.
end;

procedure TXLSWriteII.WREC_DSF;
begin
  if FXLS.Version < xvExcel97 then Exit;
  WriteWord(BIFFRECID_DSF,$00);
end;

procedure TXLSWriteII.WREC_EXCEL9FILE;
begin
  WriteRecId(BIFFRECID_EXCEL9FILE);
end;

procedure TXLSWriteII.WREC_EOF;
begin
  WriteRecId(BIFFRECID_EOF);
end;

procedure TXLSWriteII.WREC_FONT;

procedure WriteFONT40;
var
  i,Sz: integer;
begin
  for i := 0 to FXLS.Fonts.Count - 1 do begin
    PRecFont4(PBuf).Height := FXLS.Fonts[i].Size20;
    PRecFont4(PBuf).Attributes := 0;
    if xfsItalic    in FXLS.Fonts[i].Style then PRecFont4(PBuf).Attributes := PRecFont4(PBuf).Attributes or $02;
    if xfsStrikeOut in FXLS.Fonts[i].Style then PRecFont4(PBuf).Attributes := PRecFont4(PBuf).Attributes or $08;

    PRecFont4(PBuf).Unknown := $7FFF;

    Sz := SizeOf(TRecFONT4) - 256;
    PRecFont4(PBuf).NameLen := Length(FXLS.Fonts[i].Name);
    Move(Pointer(FXLS.Fonts[i].Name)^,PRecFont4(PBuf).Name,PRecFont4(PBuf).NameLen);
    Inc(Sz,PRecFont4(PBuf).NameLen);
    if i <> 4 then
      WriteBuf(BIFFRECID_FONT,Sz);
  end;
end;

procedure WriteFONT50;
var
  i,Sz: integer;
  S: string;
begin
  for i := 0 to FXLS.Fonts.Count - 1 do begin
    PRecFont(PBuf).Height := FXLS.Fonts[i].Size20;
    PRecFont(PBuf).Attributes := 0;
    if xfsItalic    in FXLS.Fonts[i].Style then PRecFont(PBuf).Attributes := PRecFont(PBuf).Attributes or $02;
    if xfsStrikeOut in FXLS.Fonts[i].Style then PRecFont(PBuf).Attributes := PRecFont(PBuf).Attributes or $08;
    if FXLS.Fonts[i].Color = xc0 then
      PRecFont(PBuf).ColorIndex := FONT_COLOR_SYS_WINTEXT
    else
      PRecFont(PBuf).ColorIndex := Integer(FXLS.Fonts[i].Color);
    if xfsBold in FXLS.Fonts[i].Style then
      PRecFont(PBuf).Bold := $02BC
    else
      PRecFont(PBuf).Bold := $0190;
    case FXLS.Fonts[i].SubSuperScript of
      xssNone:        PRecFont(PBuf).SubSuperScript := $00;
      xssSuperscript: PRecFont(PBuf).SubSuperScript := $01;
      xssSubscript:   PRecFont(PBuf).SubSuperScript := $02;
    end;
    case FXLS.Fonts[i].Underline of
      xulNone:          PRecFont(PBuf).Underline := $00;
      xulSingle:        PRecFont(PBuf).Underline := $01;
      xulDouble:        PRecFont(PBuf).Underline := $02;
      xulSingleAccount: PRecFont(PBuf).Underline := $21;
      xulDoubleAccount: PRecFont(PBuf).Underline := $22;
    end;
    PRecFont(PBuf).Reserved := 0;
    PRecFont(PBuf).CharSet := Byte(FXLS.Fonts[i].CharSet);
    PRecFont(PBuf).Family := FXLS.Fonts[i].Family;
    PRecFont(PBuf).NameLen := Length(FXLS.Fonts[i].Name);
    Sz := SizeOf(TRecFONT) - 256;
    if FXLS.Version >= xvExcel97 then begin
      WideStringToByteStr(FXLS.Fonts[i].Name,@PRecFont(PBuf).Name);
      Inc(Sz,Length(FXLS.Fonts[i].Name) * 2 + 1);
    end
    else begin
      S := FXLS.Fonts[i].Name;
      Move(Pointer(S)^,PRecFont(PBuf).Name,Length(S));
      Inc(Sz,PRecFont(PBuf).NameLen);
    end;
    if i <> 4 then
      WriteBuf(BIFFRECID_FONT,Sz);
  end;
end;

begin
  if FXLS.Version > xvExcel40 then
    WriteFONT50
  else
    WriteFONT40;
end;

procedure TXLSWriteII.WREC_FORMAT;
var
  i: integer;
  S: WideString;
begin
  // NumberFormat #0 shall never be written to the file. Makes excel sick.
  for i := 1 to FXLS.Formats.NumberFormats.Count - 1 do begin
    if FXLS.Formats.NumberFormats.ItemsByIndex[i].IsDefault then
      Continue;
    S := FXLS.Formats.NumberFormats.ItemsByIndex[i].Value;

    if FXLS.Version < xvExcel97 then begin
      PRecFORMAT7(PBuf).Index := i;
      PRecFORMAT7(PBuf).Len := Length(S);
      WideStringToByteStr(S,@PRecFORMAT7(PBuf).Data);
      WriteBuf(BIFFRECID_FORMAT,3 + Length(S) * 2 + 1);
    end
    else begin
      PRecFORMAT8(PBuf).Index := FXLS.Formats.NumberFormats.ItemsByIndex[i].IndexId;
      PRecFORMAT8(PBuf).Len := Length(S);
      WideStringToByteStr(S,@PRecFORMAT8(PBuf).Data);
      WriteBuf(BIFFRECID_FORMAT,4 + Length(S) * 2 + 1);
    end
  end;
end;

procedure TXLSWriteII.WREC_HIDEOBJ;
begin
  WriteWord(BIFFRECID_HIDEOBJ,Word(FXLS.OptionsDialog.ShowObjects));
end;

procedure TXLSWriteII.WREC_INTERFACEEND;
begin
//  WriteRecID(BIFFRECID_INTERFACEEND);
end;

procedure TXLSWriteII.WREC_INTERFACEHDR;
begin
{
  if FVersion = xvExcel97 then
    WriteWord(BIFFRECID_INTERFACEHDR,FCodepage)
  else
    WriteRecID(BIFFRECID_INTERFACEHDR);
}
end;

procedure TXLSWriteII.WREC_MSODRAWINGGROUP;
begin

end;

procedure TXLSWriteII.WREC_PASSWORD;
begin
  // Password is: abcdefghij
  WriteWord(BIFFRECID_PASSWORD,$FEF1);
end;

procedure TXLSWriteII.WREC_PRECISION;
begin
  WriteWord(BIFFRECID_PRECISION,Word(FXLS.OptionsDialog.PrecisionAsDisplayed));
end;

procedure TXLSWriteII.WREC_PROT4REV;
begin

end;

procedure TXLSWriteII.WREC_PROT4REVPASS;
begin
  if FXLS.Version < xvExcel97 then Exit;
  WriteWord(BIFFRECID_PROT4REVPASS,$0000);
end;

procedure TXLSWriteII.WREC_PROTECT;
var
  i: integer;
begin
  for i := 0 to FXLS.Sheets.Count - 1 do begin
    if soProtected in FXLS.Sheets[i].Options then begin
      WriteWord(BIFFRECID_PROTECT,1);
      Break;
    end;
  end;
end;

procedure TXLSWriteII.WREC_PROTECT_Sheet(Value: boolean);
begin
  WriteWord(BIFFRECID_PROTECT,Word(Value));
end;

procedure TXLSWriteII.WREC_REFRESHALL;
begin
  WriteWord(BIFFRECID_REFRESHALL,Word(FXLS.RefreshAll));
end;

procedure TXLSWriteII.WREC_SST;
begin
  if FXLS.Version < xvExcel97 then Exit;
  FXLS.Sheets.WriteSST(FXLSStream);
end;

procedure TXLSWriteII.WREC_STYLE;
const DefaultSTYLE: array[0..5] of longword =
($FF038010,$FF068011,$FF048012,$FF078013,$FF008000,$FF058014);
var
  i: integer;
begin
  if FXLS.WriteDefaultData then begin
    for i := 0 to High(DefaultSTYLE) do
      WritePointer(BIFFRECID_STYLE,@DefaultSTYLE[i],SizeOf(DefaultSTYLE[i]));
  end
  else begin
    for i := 0 to FXLS.Styles.Count - 1 do begin
      Move(FXLS.Styles[i]^,PBuf^,SizeOf(TRecSTYLE));
      WriteBuf(BIFFRECID_STYLE,SizeOf(TRecSTYLE));
    end;
  end;
end;

{
procedure TXLSWriteII.WREC_TABID;
var
  i: integer;
begin
  if FXLS.Version < xvExcel97 then Exit;
  for i := 0 to FXLS.Sheets.Count - 1 do
    PWordArray(PBuf)[i] := i + 1;
  WriteBuf(BIFFRECID_TABID,FXLS.Sheets.Count * 2);
end;
}

procedure TXLSWriteII.WREC_OBPROJ;
begin
  if FXLS.PreserveMacros then
    FXLSStream.WriteHeader(BIFFRECID_OBPROJ,0);
end;                                                           

procedure TXLSWriteII.WREC_USESELFS;
begin
  if FXLS.Version < xvExcel97 then Exit;
  WriteWord(BIFFRECID_USESELFS,$0000);
end;

procedure TXLSWriteII.WREC_WINDOW1;
begin
  PRecWINDOW1(PBuf).Left := FXLS.Workbook.Left;
  PRecWINDOW1(PBuf).Top := FXLS.Workbook.Top;
  PRecWINDOW1(PBuf).Width := FXLS.Workbook.Width;
  PRecWINDOW1(PBuf).Height := FXLS.Workbook.Height;
  PRecWINDOW1(PBuf).Options := 0;
  if woHidden in FXLS.Workbook.Options then   PRecWINDOW1(PBuf).Options := PRecWINDOW1(PBuf).Options or $01;
  if woIconized in FXLS.Workbook.Options then PRecWINDOW1(PBuf).Options := PRecWINDOW1(PBuf).Options or $02;
  if woHScroll in FXLS.Workbook.Options then  PRecWINDOW1(PBuf).Options := PRecWINDOW1(PBuf).Options or $08;
  if woVScroll in FXLS.Workbook.Options then  PRecWINDOW1(PBuf).Options := PRecWINDOW1(PBuf).Options or $10;
  if woTabs in FXLS.Workbook.Options then     PRecWINDOW1(PBuf).Options := PRecWINDOW1(PBuf).Options or $20 ;
//  PRecWINDOW1(PBuf).TabIndex := FXLS.Workbook.SelectedTab + FXLS.FileCharts.Count;
  PRecWINDOW1(PBuf).FirstDispTabIndex := 0;
  PRecWINDOW1(PBuf).SelectedTabs := 1;
  PRecWINDOW1(PBuf).TabRatio := $0258;
  WriteBuf(BIFFRECID_WINDOW1,SizeOf(TRecWINDOW1));
end;

procedure TXLSWriteII.WREC_WINDOWPROTECT;
begin
  WriteWord(BIFFRECID_WINDOWPROTECT,Word(FXLS.BookProtected));
end;

procedure TXLSWriteII.WREC_FNGROUPCOUNT;
begin
//  WriteWord(BIFFRECID_FNGROUPCOUNT,$000E);
end;

procedure TXLSWriteII.WREC_WRITEACCESS;
var
  sz: byte;
  S: string;
begin
  if FXLS.Version < xvExcel40 then
    sz := 31
  else
    sz :=112;
  S := Copy(FXLS.UserName,1,sz);
  if FXLS.Version <= xvExcel50 then
    S := Char(Length(S)) + S;
  FillChar(PBuf^,sz,$20);
  Move(Pointer(S)^,PBuf^,Length(S));
  WriteBuf(BIFFRECID_WRITEACCESS,sz);
end;

procedure TXLSWriteII.WREC_XF;
var
  i: integer;
begin
  if FXLS.Version >= xvExcel97 then begin
    for i := 0 to FXLS.Formats.Count - 1 do begin
      FXLS.Formats[i].ToXF8(PBuf);
      WriteBuf(BIFFRECID_XF,SizeOf(TRecXF8));
    end;
  end
  else if FXLS.Version >= xvExcel50 then begin
    for i := 0 to FXLS.Formats.Count - 1 do begin
      FXLS.Formats[i].ToXF7(PBuf);
      WriteBuf(BIFFRECID_XF,SizeOf(TRecXF7));
    end;
  end
  else if FXLS.Version >= xvExcel40 then begin
    for i := 0 to FXLS.Formats.Count - 1 do begin
      FXLS.Formats[i].ToXF4(PBuf);
      WriteBuf(BIFFRECID_XF_40,SizeOf(TRecXF4));
    end;
  end;
end;

procedure TXLSWriteII.WREC_PALETTE;
var
  V,I: integer;
  W: word;
begin
  if FXLS.Version = xvExcel50 then begin
    FXLSStream.WriteHeader(BIFFRECID_PALETTE,2 + SizeOf(longword) * 56);
    W := 56;
    FXLSStream.Write(W,SizeOf(word));
    for i := 8 to 63 do begin
      V := ExcelColorPalette[i];
      FXLSStream.Write(V,SizeOf(longword));
    end;
  end
  else if FXLS.Version >= xvExcel97 then begin
    for i := 8 to High(ExcelColorPalette) do begin
      if ExcelColorPalette[i] <> TDefaultExcelColorPalette[i] then begin
        Move(ExcelColorPalette[8],PBuf[2],SizeOf(longword) * 56);
        PWordArray(PBuf)[0] := 56;
        WriteBuf(BIFFRECID_PALETTE,2 + SizeOf(longword) * 56);
        Break;
      end;
    end;
  end;
end;

// Sheet prefix

procedure TXLSWriteII.WREC_CALCCOUNT;
begin
//  WriteWord(BIFFRECID_CALCCOUNT,FXLS.Sheets[FCurrSheet].CalcCount);
end;

procedure TXLSWriteII.WREC_CALCMODE;
begin
  case FXLS.OptionsDialog.CalcMode of
    cmManual:       WriteWord(BIFFRECID_CALCMODE,$0000);
    cmAutomatic:    WriteWord(BIFFRECID_CALCMODE,$0001);
    cmAutoExTables: WriteWord(BIFFRECID_CALCMODE,$FFFF);
  end;
end;

procedure TXLSWriteII.WREC_COLINFO;
begin
  FXLS.Sheets[FCurrSheet].Columns.SaveToStream(FXLSStream,PBuf);
end;

procedure TXLSWriteII.WREC_DEFAULTROWHEIGHT;
begin
  if FXLS.Sheets[FCurrSheet].DefaultRowHeight > 0 then begin
    PRecDEFAULTROWHEIGHT(PBuf).Options := 1;
    PRecDEFAULTROWHEIGHT(PBuf).Height := FXLS.Sheets[FCurrSheet].DefaultRowHeight;
  end
  else begin
    PRecDEFAULTROWHEIGHT(PBuf).Options := 0;
    PRecDEFAULTROWHEIGHT(PBuf).Height := 255;
  end;
  WriteBuf(BIFFRECID_DEFAULTROWHEIGHT,SizeOf(TRecDEFAULTROWHEIGHT));
end;

procedure TXLSWriteII.WREC_DEFCOLWIDTH;
begin
  if FXLS.Sheets[FCurrSheet].DefaultColWidth > 0 then
    WriteWord(BIFFRECID_DEFCOLWIDTH,FXLS.Sheets[FCurrSheet].DefaultColWidth)
end;

procedure TXLSWriteII.WREC_DELTA;
begin
//  WritePointer(BIFFRECID_DELTA,@FXLS.Sheets[FCurrSheet].Delta,SizeOf(double));
end;

procedure TXLSWriteII.WREC_DIMENSIONS;
begin
  if FXLS.Version >= xvExcel97 then
    WriteBuf(BIFFRECID_DIMENSIONS,SizeOf(TRecDIMENSIONS8))
  else
    WriteBuf(BIFFRECID_DIMENSIONS,SizeOf(TRecDIMENSIONS7));
end;

procedure TXLSWriteII.WREC_ROW;
var
  i: integer;
begin
  for i := 0 to FXLS.Sheets[FCurrSheet].Rows.Count - 1 do begin
    FXLS.Sheets[FCurrSheet].Rows.GetRecROW(i,PRecROW(PBuf));
    WriteBuf(BIFFRECID_ROW,SizeOf(TRecROW));
  end;
end;

procedure TXLSWriteII.WREC_FOOTER;
var
  L: integer;
  S: string;
begin
  if FXLS.Version >= xvExcel97 then begin
    if FXLS.Sheets[FCurrSheet].PrintSettings.Footer <> '' then begin
      L := Length(FXLS.Sheets[FCurrSheet].PrintSettings.Footer);
      FXLSStream.WriteHeader(BIFFRECID_FOOTER,2 + 1 + L * 2);
      FXLSStream.WWord(L);
      WideStringToByteStr(FXLS.Sheets[FCurrSheet].PrintSettings.Footer,PBuf);
      FXLSStream.Write(PBuf^,1 + L * 2);
    end
    else
      WriteBuf(BIFFRECID_FOOTER,0);
  end
  else begin
    S := FXLS.Sheets[FCurrSheet].PrintSettings.Footer;
    PRecSTRING1Byte(PBuf).Len := Length(S);
    Move(Pointer(S)^,PRecSTRING1Byte(PBuf).Data,Length(S));
    WriteBuf(BIFFRECID_FOOTER,2 + Length(S));
  end;
end;

procedure TXLSWriteII.WREC_GRIDSET;
begin
//  WriteWord(BIFFRECID_GRIDSET,FXLS.Sheets[FCurrSheet].Gridset);
end;

procedure TXLSWriteII.WREC_GUTS;
begin
{
  PRecGUTS(PBuf).SizeRow := FXLS.Sheets[FCurrSheet].RowGutter;
  PRecGUTS(PBuf).SizeCol := FXLS.Sheets[FCurrSheet].ColGutter;
  PRecGUTS(PBuf).LevelRow := FXLS.Sheets[FCurrSheet].RowOutlineGutter;
  PRecGUTS(PBuf).LevelCol := FXLS.Sheets[FCurrSheet].ColOutlineGutter;
  WriteBuf(BIFFRECID_GUTS,SizeOf(TRecGUTS));
}  
end;

procedure TXLSWriteII.WREC_HCENTER;
begin
  WriteBoolean(BIFFRECID_HCENTER,psoHorizCenter in FXLS.Sheets[FCurrSheet].PrintSettings.Options);
end;

procedure TXLSWriteII.WREC_HEADER;
var
  L:integer;
  S: string;
begin
  if FXLS.Sheets[FCurrSheet].PrintSettings.Header = '' then
    WriteRecId(BIFFRECID_HEADER)
  else if FXLS.Version >= xvExcel97 then begin
    if FXLS.Sheets[FCurrSheet].PrintSettings.Header <> '' then begin
      L := Length(FXLS.Sheets[FCurrSheet].PrintSettings.Header);
      FXLSStream.WriteHeader(BIFFRECID_HEADER,2 + 1 + L * 2);
      FXLSStream.WWord(L);
      WideStringToByteStr(FXLS.Sheets[FCurrSheet].PrintSettings.Header,PBuf);
      FXLSStream.Write(PBuf^,1 + L * 2);
    end
    else
      WriteBuf(BIFFRECID_HEADER,0);
  end
  else begin
    S := FXLS.Sheets[FCurrSheet].PrintSettings.Header;
    PRecSTRING1Byte(PBuf).Len := Length(S);
    Move(Pointer(S)^,PRecSTRING1Byte(PBuf).Data,Length(S));
    WriteBuf(BIFFRECID_HEADER,2 + Length(S));
  end;
end;

procedure TXLSWriteII.WREC_ITERATION;
begin
  WriteBoolean(BIFFRECID_ITERATION,soIteration in FXLS.Sheets[FCurrSheet].Options);
end;

procedure TXLSWriteII.WREC_PLS;
var
  P: PDeviceModeW;
begin
  if FXLS.HasDEVMODE and (FXLS.Version >= xvExcel97) then begin
    P := FXLS.GetDEVMODE;
    FXLSStream.WriteHeader(BIFFRECID_PLS,P.dmSize + P.dmDriverExtra + 2);
    FXLSStream.WWord(0);
    FXLSStream.Write(P^,P.dmSize + P.dmDriverExtra);
  end;
end;

procedure TXLSWriteII.WREC_PRINTGRIDLINES;
begin
  WriteBoolean(BIFFRECID_PRINTGRIDLINES,psoGridlines in FXLS.Sheets[FCurrSheet].PrintSettings.Options);
end;

procedure TXLSWriteII.WREC_PRINTHEADERS;
begin
  WriteBoolean(BIFFRECID_PRINTHEADERS,psoRowColHeading in FXLS.Sheets[FCurrSheet].PrintSettings.Options);
end;

procedure TXLSWriteII.WREC_REFMODE;
begin
  WriteBoolean(BIFFRECID_REFMODE,not (soR1C1Mode in FXLS.Sheets[FCurrSheet].Options));
end;

procedure TXLSWriteII.WREC_SAVERECALC;
begin
//  WriteBoolean(BIFFRECID_SAVERECALC,FXLS.SaveRecalc);
end;

procedure TXLSWriteII.WREC_MARGINS;
begin
  with FXLS.Sheets[FCurrSheet].PrintSettings do begin
    if MarginLeft >= 0 then begin
      PRecMARGIN(PBuf).Value := MarginLeft;
      WriteBuf(BIFFRECID_LEFTMARGIN,SizeOf(TRecMARGIN));
    end;
    if MarginRight >= 0 then begin
      PRecMARGIN(PBuf).Value := MarginRight;
      WriteBuf(BIFFRECID_RIGHTMARGIN,SizeOf(TRecMARGIN));
    end;
    if MarginTop >= 0 then begin
      PRecMARGIN(PBuf).Value := MarginTop;
      WriteBuf(BIFFRECID_TOPMARGIN,SizeOf(TRecMARGIN));
    end;
    if MarginBottom >= 0 then begin
      PRecMARGIN(PBuf).Value := MarginBottom;
      WriteBuf(BIFFRECID_BOTTOMMARGIN,SizeOf(TRecMARGIN));
    end;
  end;
end;

procedure TXLSWriteII.WREC_SETUP;
begin
  with FXLS.Sheets[FCurrSheet].PrintSettings do begin
    PRecSETUP(PBuf).PaperSize := Integer(FXLS.Sheets[FCurrSheet].PrintSettings.PaperSize);
    PRecSETUP(PBuf).Scale := ScalingFactor;
    PRecSETUP(PBuf).PageStart := StartingPage;
    PRecSETUP(PBuf).FitWidth := 1;
    PRecSETUP(PBuf).FitHeight := 1;
    PRecSETUP(PBuf).Options := $0000;
    if psoLeftToRight in Options then
      PRecSETUP(PBuf).Options := PRecSETUP(PBuf).Options or $0001;
    if psoPortrait in Options then
      PRecSETUP(PBuf).Options := PRecSETUP(PBuf).Options or $0002;
    if psoNoColor in Options then
      PRecSETUP(PBuf).Options := PRecSETUP(PBuf).Options or $0008;
    if psoDraftQuality in Options then
      PRecSETUP(PBuf).Options := PRecSETUP(PBuf).Options or $0010;
    if psoNotes in Options then
      PRecSETUP(PBuf).Options := PRecSETUP(PBuf).Options or $0020;
    PRecSETUP(PBuf).Resolution := 600;
    PRecSETUP(PBuf).VertResolution := 600;
    PRecSETUP(PBuf).HeaderMargin := HeaderMargin;
    PRecSETUP(PBuf).FooterMargin := FooterMargin;
    PRecSETUP(PBuf).Copies := Copies;
    WriteBuf(BIFFRECID_SETUP,SizeOf(TRecSETUP));
  end;
end;

procedure TXLSWriteII.WREC_VCENTER;
begin
  WriteBoolean(BIFFRECID_VCENTER,psoVertCenter in FXLS.Sheets[FCurrSheet].PrintSettings.Options);
end;

procedure TXLSWriteII.WREC_WSBOOL;
var
  W: word;
begin
  W := 0;
  with FXLS.Sheets[FCurrSheet] do begin
    if woShowAutoBreaks in WorkspaceOptions then W := W or $0001;
    if woApplyStyles    in WorkspaceOptions then W := W or $0020;
    if woRowSumsBelow   in WorkspaceOptions then W := W or $0040;
    if woFitToPage      in WorkspaceOptions then W := W or $0100;
    if woOutlineSymbols in WorkspaceOptions then W := W or $0600;
  end;
  WriteWord(BIFFRECID_WSBOOL,W);
end;

procedure TXLSWriteII.WREC_HORIZONTALPAGEBREAKS;
var
  i: integer;
begin
  if FXLS.Sheets[FCurrSheet].PrintSettings.HorizPagebreaks.Count <= 0 then
    Exit;
  if FXLS.Version >= xvExcel97 then begin
    with FXLS.Sheets[FCurrSheet].PrintSettings do begin
      PRecHORIZONTALPAGEBREAKS(PBuf).Count := HorizPagebreaks.Count;
      for i := 0 to HorizPagebreaks.Count - 1 do begin
        PRecHORIZONTALPAGEBREAKS(PBuf).Breaks[i].Val1 := HorizPagebreaks[i].Row + 1;
        PRecHORIZONTALPAGEBREAKS(PBuf).Breaks[i].Val2 := HorizPagebreaks[i].Col1 + 1;
        PRecHORIZONTALPAGEBREAKS(PBuf).Breaks[i].Val3 := HorizPagebreaks[i].Col2 + 1;
      end;
      WriteBuf(BIFFRECID_HORIZONTALPAGEBREAKS,2 + SizeOf(TPageBreak) * HorizPagebreaks.Count);
    end;
  end
  else begin
    with FXLS.Sheets[FCurrSheet].PrintSettings do begin
      PWordArray(PBuf)[0] := HorizPagebreaks.Count;
      for i := 0 to HorizPagebreaks.Count - 1 do
        PWordArray(PBuf)[i + 1] := HorizPagebreaks[i].Row + 1;
      WriteBuf(BIFFRECID_HORIZONTALPAGEBREAKS,2 + 2 * HorizPagebreaks.Count);
    end;
  end;
end;

procedure TXLSWriteII.WREC_VERTICALPAGEBREAKS;
var
  i: integer;
begin
  if FXLS.Sheets[FCurrSheet].PrintSettings.VertPagebreaks.Count <= 0 then
    Exit;
  if FXLS.Version >= xvExcel97 then begin
    with FXLS.Sheets[FCurrSheet].PrintSettings do begin
      PRecVERTICALPAGEBREAKS(PBuf).Count := VertPagebreaks.Count;
      for i := 0 to VertPagebreaks.Count - 1 do begin
        PRecVERTICALPAGEBREAKS(PBuf).Breaks[i].Val1 := VertPagebreaks[i].Col + 1;
        PRecVERTICALPAGEBREAKS(PBuf).Breaks[i].Val2 := VertPagebreaks[i].Row1 + 1;
        PRecVERTICALPAGEBREAKS(PBuf).Breaks[i].Val3 := VertPagebreaks[i].Row2 + 1;
      end;
      WriteBuf(BIFFRECID_VERTICALPAGEBREAKS,2 + SizeOf(TPageBreak) * VertPagebreaks.Count);
    end;
  end
  else begin
    with FXLS.Sheets[FCurrSheet].PrintSettings do begin
      PWordArray(PBuf)[0] := VertPagebreaks.Count;
      for i := 0 to VertPagebreaks.Count - 1 do
        PWordArray(PBuf)[i + 1] := VertPagebreaks[i].Col + 1;
      WriteBuf(BIFFRECID_VERTICALPAGEBREAKS,2 + 2 * VertPagebreaks.Count);
    end;
  end;
end;

// Sheet suffix

procedure TXLSWriteII.WREC_MSODRAWING;

{
procedure SetPictSize(Pict: TSheetPicture);
var
  W,H,T: integer;
  CellW,CellH: integer;
  CurrFI: integer;
  PixCellWidth: integer;
  PixCellHeight: integer;
  C2,R2: integer;
  C: TCell;
  Canvas: TCanvas;
begin
  Canvas := TCanvas.Create;
  try
    Canvas.Handle := GetDC(0);
    FXLS.Font.CopyToTFont(Canvas.Font);
    CurrFI := 0;
    C2 := Pict.Col;
    R2 := Pict.Row;
    PixCellWidth := FXLS.Sheets[FCurrSheet].DefaultColWidth * Canvas.TextWidth('0') + 4;
    if FXLS.Sheets[FCurrSheet].DefaultRowHeight > 0 then
      PixCellHeight := Round((FXLS.Sheets[FCurrSheet].DefaultRowHeight / 20) * (Canvas.Font.Size / -Canvas.Font.Height)) + 4
    else
      PixCellHeight := -Canvas.Font.Height + 4;
    if (Pict.XLSPicture.Width <= 0) or (Pict.XLSPicture.Height <= 0) then begin
      W := Round(Pict.XLSPicture.BMP.Width * (Pict.Zoom / 100));
      H := Round(Pict.XLSPicture.BMP.Height * (Pict.Zoom / 100));
    end
    else begin
      W := Round(Pict.XLSPicture.Width * (Pict.Zoom / 100));
      H := Round(Pict.XLSPicture.Height * (Pict.Zoom / 100));
    end;

    repeat
      C := FXLS.Sheets[FCurrSheet].Cell[C2,Pict.Row];
      if (C <> Nil) and (C.FormatIndex >= 0) and (FXLS.Formats[C.FormatIndex].FontIndex <> CurrFI) then begin
        CurrFI := FXLS.Formats[C.FormatIndex].FontIndex;
        FXLS.Fonts[CurrFI].CopyToTFont(Canvas.Font);
      end;
      T := FXLS.Sheets[FCurrSheet].ColumnFormats.ColWidth(C2);
      if T >= 0 then
        CellW := Round(T * (Canvas.TextWidth('0') / 256))
      else
        CellW := PixCellWidth;
      Inc(C2);
      Dec(W,CellW);
    until (W < 0);
    if W < 0 then begin
      Dec(C2);
      Pict.Col2Offset := Round(1024 * ((CellW - -W) / CellW));
    end;
    Pict.Col2 := C2;

    repeat
      C := FXLS.Sheets[FCurrSheet].Cell[Pict.Col,R2];
      if (C <> Nil) and (C.FormatIndex >= 0) and (FXLS.Formats[C.FormatIndex].FontIndex <> CurrFI) then begin
        CurrFI := FXLS.Formats[C.FormatIndex].FontIndex;
        FXLS.Fonts[CurrFI].CopyToTFont(Canvas.Font);
      end;
//      T := FXLS.Sheets[FCurrSheet].ColumnFormats.ColWidth(C2);
      T := -1;
      if T >= 0 then
        CellH := Round((T / 20) * (Canvas.Font.Size / -Canvas.Font.Height)) + 4
      else
        CellH := PixCellHeight;
      Inc(R2);
      Dec(H,CellH);
    until (H < 0);
    if H < 0 then begin
      Dec(R2);
      Pict.Row2Offset := Round(256 * ((CellH - -H) / CellH));
    end;
    Pict.Row2 := R2;
  finally
    Canvas.Free;
  end;
end;
}

begin
  if FXLS.Version < xvExcel97 then Exit;

  if FXLS.Sheets[FCurrSheet]._Int_EscherDrawing.ShapeCount > 0 then
    FXLS.Sheets[FCurrSheet]._Int_EscherDrawing.SaveToStream(FXLSStream,PBuf);
end;

procedure TXLSWriteII.WREC_NOTE;
begin
//  Written by escher
end;

procedure TXLSWriteII.WREC_MSODRAWINGSELECTION;
begin
  // Don't need to write this.
end;

procedure TXLSWriteII.WREC_SELECTION;
begin
  if FXLS.Sheets[FCurrSheet].Pane.PaneType <> ptNone then begin
    PRecSELECTION(PBuf).Pane := 3;
    PRecSELECTION(PBuf).ActiveRow := 0;
    PRecSELECTION(PBuf).ActiveCol := 0;
    PRecSELECTION(PBuf).ActiveRef := 0;
    PRecSELECTION(PBuf).Refs := 1;
    PRecSELECTION(PBuf).Row1 := 0;
    PRecSELECTION(PBuf).Row2 := 0;
    PRecSELECTION(PBuf).Col1 := 0;
    PRecSELECTION(PBuf).Col2 := 0;
    WriteBuf(BIFFRECID_SELECTION,SizeOf(TRecSELECTION));
  end;
end;

procedure TXLSWriteII.WREC_SHEETPROTECTION;
var
  W: word;
  Val: TSheetProtections;
begin
  if FXLS.Sheets[FCurrSheet].SheetProtection <> DefaultSheetProtections then begin
    FillChar(PBuf^,SizeOf(TRecSHEETPROTECTION),#0);
    PRecSHEETPROTECTION(PBuf).RepeatId := BIFFRECID_SHEETPROTECTION;
    PRecSHEETPROTECTION(PBuf).Unknown[1] := $02;
    PRecSHEETPROTECTION(PBuf).Unknown[3] := $01;
    PRecSHEETPROTECTION(PBuf).Unknown[4] := $FF;
    PRecSHEETPROTECTION(PBuf).Unknown[5] := $FF;
    PRecSHEETPROTECTION(PBuf).Unknown[6] := $FF;
    PRecSHEETPROTECTION(PBuf).Unknown[7] := $FF;
    W := 0;
    Val := FXLS.Sheets[FCurrSheet].SheetProtection;
    if spEditObjects          in Val then W := W or $0001;
    if spEditScenarios        in Val then W := W or $0002;
    if spEditCellFormatting   in Val then W := W or $0004;
    if spEditColumnFormatting in Val then W := W or $0008;
    if spEditRowFormatting    in Val then W := W or $0010;
    if spInsertColumns        in Val then W := W or $0020;
    if spInsertRows           in Val then W := W or $0040;
    if spInsertHyperlinks     in Val then W := W or $0080;
    if spDeleteColumns        in Val then W := W or $0100;
    if spDeleteRows           in Val then W := W or $0200;
    if spSelectLockedCells    in Val then W := W or $0400;
    if spSortCellRange        in Val then W := W or $0800;
    if spEditAutoFileters     in Val then W := W or $1000;
    if spEditPivotTables      in Val then W := W or $2000;
    if spSelectUnlockedCells  in Val then W := W or $4000;
    PRecSHEETPROTECTION(PBuf).Options := W;
    WriteBuf(BIFFRECID_SHEETPROTECTION,SizeOf(TRecSHEETPROTECTION));
  end;
end;

procedure TXLSWriteII.WREC_DVAL;
begin
  if FXLS.Sheets[FCurrSheet].Validations.Count > 0 then
    FXLS.Sheets[FCurrSheet].Validations.SaveToStream(FXLSStream,PBuf);
end;

procedure TXLSWriteII.WREC_WINDOW2;
begin
  PRecWINDOW2_7(PBuf).Options := $0020 + $0080 + $0400;
  with FXLS.Sheets[FCurrSheet] do begin
    if soShowFormulas in Options   then PRecWINDOW2_7(PBuf).Options := PRecWINDOW2_7(PBuf).Options or $0001;
    if soGridlines in Options      then PRecWINDOW2_7(PBuf).Options := PRecWINDOW2_7(PBuf).Options or $0002;
    if soRowColHeadings in Options then PRecWINDOW2_7(PBuf).Options := PRecWINDOW2_7(PBuf).Options or $0004;
    if soFrozenPanes in Options    then PRecWINDOW2_7(PBuf).Options := PRecWINDOW2_7(PBuf).Options or $0008;
    if soShowZeros in Options      then PRecWINDOW2_7(PBuf).Options := PRecWINDOW2_7(PBuf).Options or $0010;
    if FCurrSheet = 0              then PRecWINDOW2_7(PBuf).Options := PRecWINDOW2_7(PBuf).Options or $0200;

    if FXLS.Version < xvExcel97 then begin
      PRecWINDOW2_7(PBuf).TopRow := 0;
      PRecWINDOW2_7(PBuf).LeftCol := 0;
      PRecWINDOW2_7(PBuf).HeaderColorIndex := 0;
      WriteBuf(BIFFRECID_WINDOW2,SizeOf(TRecWINDOW2_7));
    end
    else begin
      PRecWINDOW2_8(PBuf).TopRow := 0;
      PRecWINDOW2_8(PBuf).LeftCol := 0;
      PRecWINDOW2_8(PBuf).HeaderColorIndex := $40;
      PRecWINDOW2_8(PBuf).ZoomPreview := ZoomPreview;
      PRecWINDOW2_8(PBuf).Zoom := 100;
      WriteBuf(BIFFRECID_WINDOW2,SizeOf(TRecWINDOW2_8));
    end;
  end;
end;

procedure TXLSWriteII.WREC_SCL;
begin
  if (FXLS.Sheets[FCurrSheet].Zoom > 0) and (FXLS.Sheets[FCurrSheet].Zoom <> 100) then begin
    PRecSCL(PBuf).Numerator := FXLS.Sheets[FCurrSheet].Zoom;
    PRecSCL(PBuf).Denominator := 100;
    WriteBuf(BIFFRECID_SCL,SizeOf(TRecSCL));
  end;
end;

procedure TXLSWriteII.WREC_PANE;

procedure WriteSelection(P,C,R: integer);
begin
  PRecSELECTION(PBuf).Pane := P;
  PRecSELECTION(PBuf).ActiveRow := R;
  PRecSELECTION(PBuf).ActiveCol := C;
  PRecSELECTION(PBuf).ActiveRef := 0;
  PRecSELECTION(PBuf).Refs := 1;
  PRecSELECTION(PBuf).Row1 := R;
  PRecSELECTION(PBuf).Row2 := R;
  PRecSELECTION(PBuf).Col1 := C;
  PRecSELECTION(PBuf).Col2 := C;
  WriteBuf(BIFFRECID_SELECTION,SizeOf(TRecSELECTION));
end;

begin
  if FXLS.Sheets[FCurrSheet].Pane.PaneType > ptNone then begin
    if (FXLS.Sheets[FCurrSheet].Pane.SplitColX <= 0) and (FXLS.Sheets[FCurrSheet].Pane.SplitRowY <= 0) then
      Exit;
    if (FXLS.Sheets[FCurrSheet].Pane.SplitColX > 0) and (FXLS.Sheets[FCurrSheet].Pane.SplitRowY > 0) then
      PRecPANE(PBuf).PaneNumber := 0
    else if (FXLS.Sheets[FCurrSheet].Pane.SplitColX > 0) and (FXLS.Sheets[FCurrSheet].Pane.SplitRowY = 0) then
      PRecPANE(PBuf).PaneNumber := 1
    else
      PRecPANE(PBuf).PaneNumber := 2;

    PRecPANE(PBuf).X := FXLS.Sheets[FCurrSheet].Pane.SplitColX;
    PRecPANE(PBuf).Y := FXLS.Sheets[FCurrSheet].Pane.SplitRowY;
    PRecPANE(PBuf).LeftCol := FXLS.Sheets[FCurrSheet].Pane.LeftCol;
    PRecPANE(PBuf).TopRow := FXLS.Sheets[FCurrSheet].Pane.TopRow;

    WriteBuf(BIFFRECID_PANE,SizeOf(TRecPANE));

    if (FXLS.Sheets[FCurrSheet].Pane.SplitColX > 0) and (FXLS.Sheets[FCurrSheet].Pane.SplitRowY > 0) then begin
      if FXLS.Sheets[FCurrSheet].Pane.Selections.Count = 4 then
        FXLS.Sheets[FCurrSheet].Pane.Selections.WriteAllRecs(FXLSStream)
      else begin
        WriteSelection(3,0,0);
        WriteSelection(2,0,FXLS.Sheets[FCurrSheet].Pane.TopRow);
        WriteSelection(1,FXLS.Sheets[FCurrSheet].Pane.LeftCol,0);
        WriteSelection(0,FXLS.Sheets[FCurrSheet].Pane.LeftCol,FXLS.Sheets[FCurrSheet].Pane.TopRow);
      end;
    end
    else if (FXLS.Sheets[FCurrSheet].Pane.SplitColX > 0) and (FXLS.Sheets[FCurrSheet].Pane.SplitRowY = 0) then begin
      if FXLS.Sheets[FCurrSheet].Pane.Selections.Count = 2 then
        FXLS.Sheets[FCurrSheet].Pane.Selections.WriteAllRecs(FXLSStream)
      else begin
        WriteSelection(3,0,FXLS.Sheets[FCurrSheet].Pane.TopRow);
        WriteSelection(1,FXLS.Sheets[FCurrSheet].Pane.LeftCol,0);
      end;
    end
    else begin
      if FXLS.Sheets[FCurrSheet].Pane.Selections.Count = 2 then
        FXLS.Sheets[FCurrSheet].Pane.Selections.WriteAllRecs(FXLSStream)
      else begin
        WriteSelection(3,0,0);
        WriteSelection(2,0,FXLS.Sheets[FCurrSheet].Pane.TopRow);
      end;
    end;
  end;
end;

procedure TXLSWriteII.WREC_HLINK;
begin
  if FXLS.Version < xvExcel97 then Exit;
  FXLS.Sheets[FCurrSheet].Hyperlinks.SaveToStream(FXLSStream,PBuf);
end;

procedure TXLSWriteII.WREC_MERGECELLS;
begin
  if FXLS.Version < xvExcel97 then Exit;
  FXLS.Sheets[FCurrSheet].StreamWriteMergedCells(FXLS.Version,FXLSStream);
end;

procedure TXLSWriteII.WREC_CONDFMT;
begin
  FXLS.Sheets[FCurrSheet].ConditionalFormats.SaveToStream(FXLSStream,PBuf);
end;

{ TBoundsheetList }

procedure TBoundsheetList.AddChart(Index: integer; Name: WideString);
var
  BD: TBoundsheetData;
begin
  BD := TBoundsheetData.Create;
  BD.FBoundsheetType := btChart;
  BD.FIndex := Index;
  BD.FName := Name;
  inherited Add(BD); 
end;

procedure TBoundsheetList.AddSheet(Index: integer; Name: WideString; Hidden: THiddenState; WorksheetType: TWorksheetType);
var
  BD: TBoundsheetData;
begin
  BD := TBoundsheetData.Create;
  case WorksheetType of
    wtSheet:       BD.FBoundsheetType := btSheet;
    wtVBModule:    BD.FBoundsheetType := btVBModule;
    wtExcel4Macro: BD.FBoundsheetType := btExcel4Macro;
  end;
  BD.FIndex := Index;
  BD.FName := Name;
  BD.FHidden := Hidden;
  inherited Add(BD); 
end;

function TBoundsheetList.GetCharts(Index: integer): TBoundsheetData;
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    if (Items[i].FBoundsheetType = btChart) and (Items[i].FIndex = Index) then begin
      Result := Items[i];
      Exit;
    end;
  end;
  Result := Nil;
end;

function TBoundsheetList.GetItems(Index: integer): TBoundsheetData;
begin
  Result := TBoundsheetData(inherited Items[Index]);
end;

function TBoundsheetList.GetSheets(Index: integer): TBoundsheetData;
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    if (Items[i].FBoundsheetType in [btSheet,btVBModule,btExcel4Macro]) and (Items[i].FIndex = Index) then begin
      Result := Items[i];
      Exit;
    end;
  end;
  Result := Nil;
end;

{ TBoundsheetData }

procedure TBoundsheetData.WritePos(Stream: TXLSStream);
var
  Pos: longint;
begin
  Pos := Stream.Pos;
  Stream.Seek(FFilePos,0);
  Stream.Write(Pos,SizeOf(longint));
  Stream.Seek(0,2);
end;

end.
