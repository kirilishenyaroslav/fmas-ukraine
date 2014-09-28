unit XLSReadII2;

{
********************************************************************************
******* XLSReadWriteII V2.00                                             *******
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

{$I XLSRWII2.inc}
{$B-}
{$R-}
{$H+}

interface

uses Classes, SysUtils, Windows, Messages, BIFFRecsII2, CellFormats2, SheetData2,
     XLSStream2, XLSReadWriteII2, XLSUtils2, Dialogs, DecodeFormula2, XLSFonts2,
     ExcelMaskII2, Validate2, Math, RecordStorage2, Escher2, MergedCells2;

type TSharedFormula = record
     Row1,Row2: word;
     Col1,Col2: byte;
     Len: word;
     Formula: PByteArray;
     end;

type TXLSReadII = class(TObject)
protected
     PBuf: PByteArray;
     FXLS: TXLSReadWriteII2;
     FCurrSheet: integer;
     FXLSStream: TXLSStream;
     FBoundsheets: TStringList;
     FBoundsheetIndex: integer;
     Header: TBIFFHeader;
     FSharedFormulas: array of TSharedFormula;
     FBIFFVer: longword;
     FLastARRAY: PByteArray;
     FLastARRAYSize: integer;
     FIsXLS137: boolean; // The file is created with XLSReadWrite 1.37

     CurrRecs: TRecordStorage;
     InsertRecord: boolean;

     // File prefix
     procedure RREC_FILEPASS;
     procedure RREC_INTERFACEHDR;
     procedure RREC_ADDMENU;
     procedure RREC_DELMENU;
     procedure RREC_INTERFACEEND;
     procedure RREC_WRITEACCESS;
     procedure RREC_FILESHAREING;
     procedure RREC_CODEPAGE;
     procedure RREC_DSF;
     procedure RREC_FNGROUPCOUNT;
     procedure RREC_WINDOWPROTECT;
     procedure RREC_PROTECT;
     procedure RREC_PASSWORD;
     procedure RREC_PROT4REV;
     procedure RREC_PROT4REVPASS;
     procedure RREC_WINDOW1;
     procedure RREC_BACKUP;
     procedure RREC_HIDEOBJ;
     procedure RREC_1904;
     procedure RREC_PRECISION;
     procedure RREC_REFRESHALL;
     procedure RREC_BOOKBOOL;
     procedure RREC_PALETTE;
     procedure RREC_FONT;
     procedure RREC_FORMAT;
     procedure RREC_XF;
     procedure RREC_STYLE;
     procedure RREC_NAME;
     procedure RREC_SUPBOOK;
     procedure RREC_EXTERNNAME;
     procedure RREC_XCT;
     procedure RREC_EXTERNCOUNT;
     procedure RREC_EXTERNSHEET;
     procedure RREC_USESELFS;
     procedure RREC_BOUNDSHEET;
     procedure RREC_COUNTRY;
     procedure RREC_RECALCID;
     procedure RREC_MSODRAWINGGROUP;
     procedure RREC_MSO_0866;
     procedure RREC_SST;
     procedure RREC_EXTSST;
     procedure RREC_EOF;

     // Sheet prefix
     procedure RREC_CALCMODE;
     procedure RREC_CALCCOUNT;
     procedure RREC_REFMODE;
     procedure RREC_ITERATION;
     procedure RREC_DELTA;
     procedure RREC_SAVERECALC;
     procedure RREC_PRINTHEADERS;
     procedure RREC_PRINTGRIDLINES;
     procedure RREC_GRIDSET;
     procedure RREC_GUTS;
     procedure RREC_DEFAULTROWHEIGHT;
     procedure RREC_WSBOOL;
     procedure RREC_HORIZONTALPAGEBREAKS;
     procedure RREC_VERTICALPAGEBREAKS;
     procedure RREC_HEADER;
     procedure RREC_FOOTER;
     procedure RREC_HCENTER;
     procedure RREC_VCENTER;
     procedure RREC_PLS;
     procedure RREC_SETUP;
     procedure RREC_LEFTMARGIN;
     procedure RREC_RIGHTMARGIN;
     procedure RREC_TOPMARGIN;
     procedure RREC_BOTTOMMARGIN;
     procedure RREC_DEFCOLWIDTH;
     procedure RREC_FILTERMODE;
     procedure RREC_AUTOFILTERINFO;
     procedure RREC_COLINFO;
     procedure RREC_DIMENSIONS;

     // Sheet data
     procedure RREC_INTEGER_20;
     procedure RREC_NUMBER_20;
     procedure RREC_LABEL_20;

     procedure RREC_ROW;
     procedure RREC_BLANK;
     procedure RREC_BOOLERR;
     procedure RREC_FORMULA;
     procedure RREC_FORMULA_30;
     procedure RREC_NUMBER;
     procedure RREC_RK;
     procedure RREC_MULRK;
     procedure RREC_MULBLANK;
     procedure RREC_LABELSST;
     procedure RREC_LABEL;
     procedure RREC_RSTRING;
     procedure RREC_NOTE;

     procedure READ_SHRFMLA;

     // Sheet suffix
     procedure RREC_MSODRAWING;
     procedure RREC_MSODRAWINGSELECTION;
     procedure RREC_WINDOW2;
     procedure RREC_SCL;
     procedure RREC_PANE;
     procedure RREC_SELECTION;
     procedure RREC_SHEETLAYOUT;
     procedure RREC_SHEETPROTECTION;
     procedure RREC_DVAL;
     procedure RREC_MERGEDCELLS;
     procedure RREC_CONDFMT;
     procedure RREC_HLINK;

     procedure Clear;
     procedure ClearSharedFmla;
     procedure ReadFormulaVal(Col,Row,FormatIndex: integer; Value: double; Formula: PByteArray; Len,DataSz: integer);
     procedure FixupSharedFormula(LeftCol,TopRow,ACol,ARow: integer);
public
     constructor Create(XLS: TXLSReadWriteII2);
     destructor Destroy; override;
     procedure LoadFromStream(Stream: TStream);
     end;


implementation

constructor TXLSReadII.Create(XLS: TXLSReadWriteII2);
begin
  FXLS := XLS;
  FXLSStream := TXLSStream.Create(FXLS.VBA);
  FXLSStream.SaveVBA := XLS.PreserveMacros;
  FBoundsheets := TStringList.Create;
end;

destructor TXLSReadII.Destroy;
begin
  FXLSStream.Free;
  FBoundsheets.Free;
  ClearSharedFmla;
  FreeMem(FLastARRAY);
  inherited Destroy;
end;

procedure TXLSReadII.Clear;
begin
  FCurrSheet := -1;
  FBoundsheets.Clear;
  FBoundsheetIndex := -1;
end;

procedure TXLSReadII.ClearSharedFmla;
var
  i: integer;
begin
  for i := 0 to High(FSharedFormulas) do
    FreeMem(FSharedFormulas[i].Formula);
  SetLength(FSharedFormulas,0);
end;

procedure TXLSReadII.LoadFromStream(Stream: TStream);
var
  i,V,ProgressCount: integer;
  Count: integer;
  InUSERSVIEW: boolean;
begin
  InUSERSVIEW := False;
  Count := 0;
  Clear;
  FXLS.WriteDefaultData := False;
  try
{$ifdef USE_MSSTORAGE}
    FXLSStream.ExtraObjects := FXLS.ExtraObjects;
    FXLSStream.SourceStream := Stream;
{$endif}
    FXLS.Version := FXLSStream.OpenStorageRead(FXLS.Filename);
    GetMem(PBuf,FXLS.MaxBuffsize);

    CurrRecs := FXLS.Records;

    if FXLS.Version <= xvExcel21 then begin
      for i := 0 to DEFAULT_FORMAT do
        FXLS.Formats.Add;
    end;

    ProgressCount := 0;
    if Assigned(FXLS.OnProgress) then
      FXLS.OnProgress(Self,0);
    try
      while FXLSStream.ReadHeader(Header) = SizeOf(TBIFFHeader) do begin
        if FXLS.Aborted then
          Exit;
        if Header.Length > FXLS.MaxBuffsize then begin
          // Invalid record size
          ReAllocMem(PBuf,Header.Length);
//          FXLSStream.Seek(Header.Length,soFromCurrent);
//          Continue;
        end
        else if (Header.RecID and INTERNAL_PLACEHOLDER) <> 0 then
          raise Exception.Create('Bad record in file')
        // BOFPos in BOUNDSHEET will not have correect values when reading
        // encrypted files, as BOFPos is written unencrypted.
        else if ((Header.RecID and $FF) <> BIFFRECID_BOF) and
                 (Header.RecId <> BIFFRECID_SST) and
//                 (Header.RecId <> BIFFRECID_MSO_0866) and
                 (Header.RecId <> BIFFRECID_MSODRAWINGGROUP) and
                 (Header.RecId <> BIFFRECID_MSODRAWING) then
          FXLSStream.Read(PBuf^,Header.Length);
        if Assigned(FXLS.OnProgress) then begin
          V := Round((FXLSStream.Pos / FXLSStream.Size) * 100);
          if V > ProgressCount then begin
            ProgressCount := V;
            FXLS.OnProgress(Self,ProgressCount);
          end;
        end;

  //      if ((Header.RecID and $FF) <> BIFFRECID_BOF) and (Header.RecID <> BIFFRECID_EXCEL9FILE) then
  //        CurrRecs.Add(Header,PBuf);

        if InUSERSVIEW then begin
          if Header.RecID = BIFFRECID_USERSVIEWEND then
            InUSERSVIEW := False;
          Continue;
        end;

        InsertRecord := True;
        case Header.RecID of
          BIFFRECID_EOF: begin
            CurrRecs.UpdateDefault(Header,PBuf);
            InsertRecord := False;
            ClearSharedFmla;
            if (FBoundsheets.Count <= 0) or (FBoundsheetIndex >= (FBoundsheets.Count - 1)) then begin
              Break;
            end;
          end;
          // File prefix
  //        BIFFRECID_OBPROJ:              InsertRecord := False;
//          BIFFRECID_EXCEL9FILE:          InsertRecord := False;
          BIFFRECID_FILEPASS:            RREC_FILEPASS;
          BIFFRECID_INTERFACEHDR:        RREC_INTERFACEHDR;
          BIFFRECID_INTERFACEEND:        RREC_INTERFACEEND;
          BIFFRECID_WRITEACCESS:         RREC_WRITEACCESS;
          BIFFRECID_FILESHAREING:        RREC_FILESHAREING;
          BIFFRECID_CODEPAGE:            RREC_CODEPAGE;
          BIFFRECID_DSF:                 RREC_DSF;
          BIFFRECID_FNGROUPCOUNT:        RREC_FNGROUPCOUNT;

          BIFFRECID_WINDOWPROTECT:       RREC_WINDOWPROTECT;
          BIFFRECID_PROTECT:             RREC_PROTECT;
          BIFFRECID_PASSWORD:            RREC_PASSWORD;
          BIFFRECID_PROT4REV:            RREC_PROT4REV;
          BIFFRECID_PROT4REVPASS:        RREC_PROT4REVPASS;

          BIFFRECID_WINDOW1:             RREC_WINDOW1;
          BIFFRECID_BACKUP:              RREC_BACKUP;
          BIFFRECID_HIDEOBJ:             RREC_HIDEOBJ;
          BIFFRECID_1904:                RREC_1904;
          BIFFRECID_PRECISION:           RREC_PRECISION;
          BIFFRECID_REFRESHALL:          RREC_REFRESHALL;
          BIFFRECID_BOOKBOOL:            RREC_BOOKBOOL;
          BIFFRECID_PALETTE:             RREC_PALETTE;

          BIFFRECID_FONT,$0231:          RREC_FONT;
          BIFFRECID_FORMAT:              RREC_FORMAT;
          BIFFRECID_XF_30,
          BIFFRECID_XF_40,
          BIFFRECID_XF:                  RREC_XF;

          // STYLE (inbyggda) måste finnas, annars så fungerar inte "style"
          // knapparna i Excel.
  //        BIFFRECID_STYLE:               RREC_STYLE;

          BIFFRECID_NAME,$0218:          RREC_NAME;
          BIFFRECID_SUPBOOK:             RREC_SUPBOOK;
          BIFFRECID_EXTERNNAME,$0223:    RREC_EXTERNNAME;
          BIFFRECID_XCT:                 RREC_XCT;
          BIFFRECID_EXTERNCOUNT:         RREC_EXTERNCOUNT;
          BIFFRECID_EXTERNSHEET:         RREC_EXTERNSHEET;

          BIFFRECID_USESELFS:            RREC_USESELFS;

          BIFFRECID_BOUNDSHEET:          RREC_BOUNDSHEET;

          BIFFRECID_COUNTRY:             RREC_COUNTRY;
          BIFFRECID_RECALCID:            RREC_RECALCID;

          BIFFRECID_MSODRAWINGGROUP:     RREC_MSODRAWINGGROUP;
          BIFFRECID_MSO_0866:            RREC_MSO_0866;

          BIFFRECID_SST:                 RREC_SST;
          BIFFRECID_EXTSST:              RREC_EXTSST;

          // Sheet prefix
          BIFFRECID_CALCMODE:            RREC_CALCMODE;
          BIFFRECID_CALCCOUNT:           RREC_CALCCOUNT;
          BIFFRECID_REFMODE:             RREC_REFMODE;
          BIFFRECID_ITERATION:           RREC_ITERATION;
          BIFFRECID_DELTA:               RREC_DELTA;
          BIFFRECID_SAVERECALC:          RREC_SAVERECALC;

          BIFFRECID_PRINTHEADERS:        RREC_PRINTHEADERS;
          BIFFRECID_PRINTGRIDLINES:      RREC_PRINTGRIDLINES;
          BIFFRECID_GRIDSET:             RREC_GRIDSET;
          BIFFRECID_GUTS:                RREC_GUTS;
          BIFFRECID_DEFAULTROWHEIGHT:    RREC_DEFAULTROWHEIGHT;
          BIFFRECID_WSBOOL:              RREC_WSBOOL;
          BIFFRECID_HORIZONTALPAGEBREAKS:RREC_HORIZONTALPAGEBREAKS;
          BIFFRECID_VERTICALPAGEBREAKS:  RREC_VERTICALPAGEBREAKS;

          BIFFRECID_HEADER:              RREC_HEADER;
          BIFFRECID_FOOTER:              RREC_FOOTER;
          BIFFRECID_HCENTER:             RREC_HCENTER;
          BIFFRECID_VCENTER:             RREC_VCENTER;
          BIFFRECID_PLS:                 RREC_PLS;
          BIFFRECID_SETUP:               RREC_SETUP;
          BIFFRECID_LEFTMARGIN:          RREC_LEFTMARGIN;
          BIFFRECID_RIGHTMARGIN:         RREC_RIGHTMARGIN;
          BIFFRECID_TOPMARGIN:           RREC_TOPMARGIN;
          BIFFRECID_BOTTOMMARGIN:        RREC_BOTTOMMARGIN;
          BIFFRECID_DEFCOLWIDTH:         RREC_DEFCOLWIDTH;
          BIFFRECID_FILTERMODE:          RREC_FILTERMODE;
          BIFFRECID_AUTOFILTERINFO:      RREC_AUTOFILTERINFO;
          BIFFRECID_COLINFO:             RREC_COLINFO;
          BIFFRECID_DIMENSIONS_20:       begin
            // DIMENSIONS_20 has the value $0000. This record was used in excel
            // 5 files created with XLSReadWrite 1.x, in order to pad the file
            // size.
            if (FXLS.Version = xvExcel50) or FIsXLS137 then
              InsertRecord := False
            else
              RREC_DIMENSIONS;
          end;
          BIFFRECID_DIMENSIONS:          RREC_DIMENSIONS;

          // Sheet cells/data
          BIFFRECID_INDEX:               begin
            InsertRecord := False;
            if FXLS.Version <= xvExcel40 then
              CurrRecs := FXLS.Sheets[FCurrSheet]._Int_Records;
          end;
          BIFFRECID_DBCELL:              InsertRecord := False;

          BIFFRECID_INTEGER_20:          RREC_INTEGER_20;
          BIFFRECID_NUMBER_20:           RREC_NUMBER_20;
          BIFFRECID_LABEL_20:            RREC_LABEL_20;

          BIFFRECID_ROW:                 RREC_ROW;
          BIFFRECID_BLANK:               RREC_BLANK;
          BIFFRECID_BOOLERR:             RREC_BOOLERR;
          BIFFRECID_FORMULA:             RREC_FORMULA;
          BIFFRECID_FORMULA_30,
          BIFFRECID_FORMULA_40:          RREC_FORMULA_30;
          BIFFRECID_MULBLANK:            RREC_MULBLANK;
          BIFFRECID_RK,
          BIFFRECID_RK7:                 RREC_RK;
          BIFFRECID_MULRK:               RREC_MULRK;
          BIFFRECID_NUMBER:              RREC_NUMBER;
          BIFFRECID_LABELSST:            RREC_LABELSST;
          BIFFRECID_LABEL:               RREC_LABEL;
          BIFFRECID_RSTRING:             RREC_RSTRING;

          BIFFRECID_NOTE:                RREC_NOTE;

          // Sheet suffix
          BIFFRECID_MSODRAWING:          RREC_MSODRAWING;

          BIFFRECID_MSODRAWINGSELECTION: RREC_MSODRAWINGSELECTION;

          BIFFRECID_WINDOW2:             RREC_WINDOW2;
  {
          BIFFRECID_SCL:                 RREC_SCL;
  }
          BIFFRECID_PANE:                RREC_PANE;
          BIFFRECID_SELECTION:           RREC_SELECTION;
          BIFFRECID_SHEETLAYOUT:         RREC_SHEETLAYOUT;
          BIFFRECID_SHEETPROTECTION:     RREC_SHEETPROTECTION;
          BIFFRECID_MERGEDCELLS:         RREC_MERGEDCELLS;

          BIFFRECID_CONDFMT:             RREC_CONDFMT;
          BIFFRECID_HLINK:               RREC_HLINK;
          BIFFRECID_DVAL:                RREC_DVAL;

          BIFFRECID_USERBVIEW:           InsertRecord := False;
          BIFFRECID_USERSVIEWBEGIN:      begin
            InsertRecord := False;
            InUSERSVIEW := True;
          end;
//          0000:                          InsertRecord := False; // Dummy recors used by XLSReadWrite 1.37

          else begin
            if (Header.RecID and $FF) = BIFFRECID_BOF then begin
              ClearSharedFmla;
              FXLSStream.ReadUnencryptedSync(PBuf^,Header.Length);
              InsertRecord := False;
              case PRecBOF8(PBuf).SubStreamType of
                $0005: begin // Workbook globals
                  if Header.Length > 256 then
                    raise Exception.Create('Invalid BOF size');
                  FXLS.IsMac := (FXLS.Version >= xvExcel97) and ((PRecBOF8(PBuf).FileHistoryFlags and $00000010) = $00000010);
                  CurrRecs := FXLS.Records;
                  CurrRecs.UpdateDefault(Header,PBuf);
                  FIsXLS137 := (PRecBOF8(PBuf).BuildYear = 1998) and (PRecBOF8(PBuf).FileHistoryFlags = 0) and (PRecBOF8(PBuf).LowBIFF = 6);
                end;
                $0040, // BIFF4 Macro sheet
                $0006, // VB Module
                $0010: begin // Worksheet
                  Inc(FBoundsheetIndex);
                  Inc(FCurrSheet);
                  case PRecBOF8(PBuf).SubStreamType of
                    $0040: FXLS.Sheets.Add(wtExcel4Macro);
                    $0006: FXLS.Sheets.Add(wtVBModule);
                    $0010: FXLS.Sheets.Add(wtSheet);
                  end;
                  FXLS.Sheets[FCurrSheet]._Int_HasDefaultRecords := True;
                  if FXLS.Version <= xvExcel40 then
                    FXLS.Sheets[FCurrSheet].Name := 'Sheet1'
                  else begin
                    FXLS.Sheets[FCurrSheet].Name := ExcelStrToWideString(FBoundsheets[FBoundsheetIndex]);
                    FXLS.Sheets[FCurrSheet].Hidden := THiddenState(FBoundsheets.Objects[FBoundsheetIndex]);
                    FXLS.Sheets[FCurrSheet]._Int_SheetIndex := FBoundsheetIndex;
                    CurrRecs := FXLS.Sheets[FCurrSheet]._Int_Records;
                    CurrRecs.UpdateDefault(Header,PBuf);
                  end;
                  FBIFFVer := PRecBOF8(PBuf).LowBIFF;
                end;
                $0020: begin // Chart
                  Inc(FBoundsheetIndex);
                  FXLS.SheetCharts.LoadFromStream(FXLSStream,ExcelStrToWideString(FBoundsheets[FBoundsheetIndex]),PBuf,FXLS.Fonts,FBoundsheetIndex);
                  //raise Exception.Create('Chart unhandled');
                end;
                $0100: begin // BIFF4 Workbook globals
                  raise Exception.Create('BIFF4 Workbook unhandled');
                end;
              end;
            end
          end;
        end;
        if InsertRecord then
          CurrRecs.AddRec(Header,PBuf);
        Inc(Count);
      end;
    except
      on E: Exception do
        raise Exception.CreateFmt('Error on reading record # %d, %.4X Offs: %.8X' + #13 + E.Message,[Count,Header.RecId,FXLSStream.Pos]);
    end;
{$ifndef USE_MSSTORAGE}
    if FXLSStream.SaveVBA then
      FXLSStream.ReadCache(FXLS.CacheFiles);
{$endif}
    if Assigned(FXLS.OnProgress) then
      FXLS.OnProgress(Self,100);
  finally
    FXLSStream.CloseStorage;
    FreeMem(PBuf);
  end;

end;

// Sheet cells

procedure TXLSReadII.RREC_BLANK;
begin
  InsertRecord := False;
  with PRecBLANK(PBuf)^ do
    FXLS.Sheets[FCurrSheet].IntWriteBlank(Col,Row,FormatIndex);
end;

procedure TXLSReadII.RREC_ROW;
begin
  InsertRecord := False;

{
  if XLS_DebugMode then begin
    if Assigned(FXLS.OnRowHeight) and (PRecROW(PBuf).Height <> 255) then
      FXLS.OnRowHeight(Self,PRecROW(PBuf).Row,PRecROW(PBuf).FormatIndex,PRecROW(PBuf).Height);
  end;
}  

  if (PRecROW(PBuf).Options and $0080) = $0080 then
    FXLS.Sheets[FCurrSheet].Rows.SetRecROW(PRecROW(PBuf),PRecROW(PBuf).FormatIndex and $0FFF)
  else
    FXLS.Sheets[FCurrSheet].Rows.SetRecROW(PRecROW(PBuf),DEFAULT_FORMAT);
end;

procedure TXLSReadII.RREC_BOOLERR;
begin
  InsertRecord := False;
  with PRecBOOLERR(PBuf)^ do begin
    if Error = 0 then
      FXLS.Sheets[FCurrSheet].IntWriteBoolean(Col,Row,FormatIndex,Boolean(BoolErr))
    else
      FXLS.Sheets[FCurrSheet].IntWriteError(Col,Row,FormatIndex,ErrorCodeToCellError(BoolErr));
  end;
end;

procedure TXLSReadII.ReadFormulaVal(Col,Row,FormatIndex: integer; Value: double; Formula: PByteArray; Len,DataSz: integer);
var
  Fmla: PByteArray;
  S: string;
begin
  GetMem(Fmla,DataSz);
  try
    // Formula points to PBuf, which is overwritten by the next read of the file.
    Move(Formula^,Fmla^,DataSz);
    case TByte8Array(Value)[0] of
      0: begin
        Header.RecID := FXLSStream.PeekHeader;
        if (Header.RecID = BIFFRECID_SHRFMLA) or (Header.RecID = $04BC) then begin
          raise Exception.Create('Unxepected SHRFMLA');
{
          ExtSz := SizeOf(TBIFFHeader) + Header.Length;
          FXLSStream.Read(PBuf^,Header.Length);
          FXLSStream.ReadHeader(Header);
}
        end;
        if Header.RecID = BIFFRECID_STRING then begin
          FXLSStream.ReadHeader(Header);
          FXLSStream.Read(PBuf^,Header.Length);
          S := ByteStrToWideString(@PRecSTRING(PBuf).Data,PRecSTRING(PBuf).Len);
{
          if ExtSz > 0 then begin
            Inc(ExtSz,SizeOf(TBIFFHeader) + Header.Length);
            FXLSStream.Seek2(-ExtSz,soFromCurrent);
          end;
}
        end
        else if Header.RecID = BIFFRECID_STRING_20 then begin
          FXLSStream.ReadHeader(Header);
          FXLSStream.Read(PBuf^,Header.Length);
          S := ByteStrToWideString(@PRec2STRING(PBuf).Data,PRec2STRING(PBuf).Len);
        end
        else
          Exit;
        FXLS.Sheets[FCurrSheet].WriteRawStrFormula(Col,Row,FormatIndex,Fmla,DataSz,Len,S);
      end;
      1: FXLS.Sheets[FCurrSheet].WriteRawBoolFormula(Col,Row,FormatIndex,Fmla,DataSz,Len,Boolean(Integer(TByte8Array(Value)[2])));
      2: FXLS.Sheets[FCurrSheet].WriteRawErrFormula(Col,Row,FormatIndex,Fmla,DataSz,Len,TByte8Array(Value)[2]);
      // Undocumented: the value 3 indicates that the result is an empty string,
      // and therefore there is no STRING record following the formula.
      3: FXLS.Sheets[FCurrSheet].WriteRawStrFormula(Col,Row,FormatIndex,Fmla,DataSz,Len,'');
    end;
  finally
    FreeMem(Fmla);
  end;
end;

procedure TXLSReadII.RREC_FORMULA;
var
  DataSz: integer;
begin
  InsertRecord := False;
  if FXLS.Version < xvExcel30 then with PRec2FORMULA(PBuf)^ do begin
    DataSz := Header.Length - 17;
    if (TByte8Array(Value)[6] = $FF) and (TByte8Array(Value)[7] = $FF) then
      ReadFormulaVal(Col,Row,-1,Value,@Data,ParseLen,DataSz)
    else
      FXLS.Sheets[FCurrSheet].WriteRawNumFormula(Col,Row,DEFAULT_FORMAT,@Data,DataSz,ParseLen,Value);
  end
  else with PRecFORMULA(PBuf)^ do begin
    DataSz := Header.Length - 22;
    // ATTN: Under some circumstances (don't know why) the Shared Formula bit is set
    // in the Options field, even if the formula not is part of a shared formula group.
    // There is no SHRFMLA record following the FORMULA record.
    // The formula contaions a complete expression.
    // This seems to only occure in XLS-97 files.
    // Bug in Excel?
    // One way to check this is to se if the first PTG in the formula is ptgExp, = part of shared formula.
    if ((Options and $0008) = $0008) and (Data[0] = ptgExp) then begin
      Header.RecID := FXLSStream.PeekHeader;
      if (Header.RecID = BIFFRECID_SHRFMLA) or (Header.RecID = BIFFRECID_SHRFMLA_20) then begin
        FXLSStream.ReadHeader(Header);
        READ_SHRFMLA
      end;
//      FixupSharedFormula(Col,Row);
      FixupSharedFormula(PWordArray(@Data[1])[1],PWordArray(@Data[1])[0],Col,Row);
      DataSz := ParseLen;
    end
    else if Data[0] = ptgExp then begin
      if FXLSStream.PeekHeader = BIFFRECID_ARRAY then begin
        FXLSStream.ReadHeader(Header);
        GetMem(FLastARRAY,Header.Length);
        FXLSStream.Read(FLastARRAY^,Header.Length);
        FXLS.Sheets[FCurrSheet].WriteRawArrayFormula(Col,Row,FormatIndex,@Data,DataSz,ParseLen,Value,FLastARRAY,Header.Length,False);
        FLastARRAYSize := Header.Length;
        Exit;
      end
      else if (FLastARRAY <> Nil) and (Col >= PRecARRAY(FLastARRAY).Col1) and (Col <= PRecARRAY(FLastARRAY).Col2) and (Row >= PRecARRAY(FLastARRAY).Row1) and (Row <= PRecARRAY(FLastARRAY).Row2) then begin
        FXLS.Sheets[FCurrSheet].WriteRawArrayFormula(Col,Row,FormatIndex,@Data,DataSz,ParseLen,Value,FLastARRAY,FLastARRAYSize,True);
        Exit;      end
      else begin
        FLastARRAY := Nil;
        FLastARRAYSize := 0;
      end;
    end;
    if (TByte8Array(Value)[0] in [$00,$01,$02,$03]) and (TByte8Array(Value)[6] = $FF) and (TByte8Array(Value)[7] = $FF) then
      ReadFormulaVal(Col,Row,FormatIndex,Value,@Data,ParseLen,DataSz)
    else if ParseLen <> 0 then begin
      // This detects NAN values. A NAN number may cause an "Invalid Floating Point Operation" exception when used.
      if (TByte8Array(Value)[0] = $02) and (TByte8Array(Value)[6] = $FF) and (TByte8Array(Value)[7] = $FF) then
        FXLS.Sheets[FCurrSheet].WriteRawNumFormula(Col,Row,FormatIndex,@Data,DataSz,ParseLen,0)
      else
        FXLS.Sheets[FCurrSheet].WriteRawNumFormula(Col,Row,FormatIndex,@Data,DataSz,ParseLen,Value);
    end;
  end;
end;

procedure TXLSReadII.RREC_FORMULA_30;
begin
  InsertRecord := False;
  // PocketPC
  if FBIFFVer = 6 then begin
    RREC_FORMULA;
  end
  else begin
    with PRecFORMULA3(PBuf)^ do begin
      FXLS.Sheets[FCurrSheet].WriteRawNumFormula(Col,Row,FormatIndex,@Data,Header.Length - 18,ParseLen,Value);
      if (TByte8Array(Value)[6] = $FF) and (TByte8Array(Value)[7] = $FF) then
        ReadFormulaVal(Col,Row,FormatIndex,Value,@Data,ParseLen,ParseLen);
    end;
  end;
end;

procedure TXLSReadII.RREC_NUMBER;
begin
  InsertRecord := False;
  with PRecNUMBER(PBuf)^ do
    FXLS.Sheets[FCurrSheet].IntWriteNumber(Col,Row,FormatIndex,Value);
end;

procedure TXLSReadII.RREC_INTEGER_20;
begin
  InsertRecord := False;
  with PRec2INTEGER(PBuf)^ do
    FXLS.Sheets[FCurrSheet].IntWriteNumber(Col,Row,DEFAULT_FORMAT,Value);
end;

procedure TXLSReadII.RREC_LABEL_20;
var
  S: string;
begin
  InsertRecord := False;
  with PRec2LABEL(PBuf)^ do begin
    SetLength(S,Len);
    Move(Data,Pointer(S)^,Len);
    FXLS.Sheets[FCurrSheet].IntWriteSSTString(Col,Row,DEFAULT_FORMAT,S);
  end;
end;

procedure TXLSReadII.RREC_NUMBER_20;
begin
  InsertRecord := False;
  with PRec2NUMBER(PBuf)^ do
    FXLS.Sheets[FCurrSheet].IntWriteNumber(Col,Row,DEFAULT_FORMAT,Value);
end;

procedure TXLSReadII.RREC_LABELSST;
begin
  InsertRecord := False;
  try
    with PRecLABELSST(PBuf)^ do
      FXLS.Sheets[FCurrSheet].IntWriteSSTStringIndex(Col,Row,FormatIndex,SSTIndex);
  except
    raise Exception.CreateFmt('Read error at %.8D',[FXLSStream.Pos]);
  end;
end;

procedure TXLSReadII.RREC_LABEL;
var
  i: integer;
  P: PWordArray;
  WS: WideString;
begin
  InsertRecord := False;
  with PRecLABEL(PBuf)^ do begin
    if FXLS.Version > xvExcel97 then
      FXLS.Sheets[FCurrSheet].IntWriteSSTString(Col,Row,FormatIndex,ByteStrToWideString(@Data[0],Len))
    else begin
      SetLength(WS,Len);
      if Data[0] = 0 then begin
        for i := 1 to Len do
          WS[i] := WideChar(Data[i]);
      end
      else if Data[0] = 1 then begin
        P := @Data[1];
        for i := 0 to Len - 1 do
          WS[i + 1] := WideChar(P[i]);
      end
      else begin
        for i := 0 to Len - 1 do
          WS[i + 1] := WideChar(Data[i]);
      end;
      FXLS.Sheets[FCurrSheet].IntWriteSSTString(Col,Row,FormatIndex,WS);
    end;
  end;
end;

procedure TXLSReadII.RREC_RSTRING;
var
  S: string;
begin
  InsertRecord := False;

  with PRecLABEL(PBuf)^ do begin
    SetLength(S,Len);
    Move(Data,Pointer(S)^,Len);
    FXLS.Sheets[FCurrSheet].IntWriteSSTString(Col,Row,FormatIndex,S);
  end;
end;

procedure TXLSReadII.RREC_MULBLANK;
var
  i: integer;
begin
  InsertRecord := False;
  with PRecMULBLANK(PBuf)^ do begin
    for i := 0 to (Header.Length - 6) div 2 - 1 do
      FXLS.Sheets[FCurrSheet].IntWriteBlank(Col1 + i,Row,FormatIndexes[i]);
  end;
end;

procedure TXLSReadII.RREC_RK;
begin
  InsertRecord := False;
  with PRecRK(PBuf)^ do
    FXLS.Sheets[FCurrSheet].IntWriteNumber(Col,Row,FormatIndex,DecodeRK(Value));
end;

procedure TXLSReadII.RREC_MULRK;
var
  i: integer;
begin
  InsertRecord := False;
  with PRecMULRK(PBuf)^ do begin
    for i := 0 to (Header.Length - 6) div 6 - 1 do
      FXLS.Sheets[FCurrSheet].IntWriteNumber(Col1 + i,Row,RKs[i].FormatIndex,DecodeRK(RKs[i].Value));
  end;
end;

procedure TXLSReadII.FixupSharedFormula(LeftCol,TopRow,ACol,ARow: integer);
var
  i: integer;
begin
  // A shard formula identifies the definition it belongs to by the upper left
  // corner of the definition area.
  for i := 0 to High(FSharedFormulas) do begin
    with FSharedFormulas[i] do begin
      if (LeftCol = Col1) and (TopRow = Row1) then begin
        Move(Formula^,PRecFORMULA(PBuf).Data,Len);
        PRecFORMULA(PBuf).ParseLen := Len;
        ConvertShrFmla(FXLS.Version = xvExcel97,@PRecFORMULA(PBuf).Data,PRecFORMULA(PBuf).ParseLen,ACol,ARow);
        Break;
      end;
    end;
  end;
{
  // ATTN: Ranges of shared formulas may overlap. The last one written seems
  // to be the correct, therefore all shared formulas has to be searched.
  for i := 0 to High(FSharedFormulas) do begin
    with FSharedFormulas[i] do begin
      if (ACol >= Col1) and (ACol <= Col2) and (ARow >= Row1) and (ARow <= Row2) then begin
        Move(Formula^,PRecFORMULA(PBuf).Data,Len);
        PRecFORMULA(PBuf).ParseLen := Len;
        ConvertShrFmla(FXLS.Version = xvExcel97,@PRecFORMULA(PBuf).Data,PRecFORMULA(PBuf).ParseLen,ACol,ARow);
        Break;
      end;
    end;
  end;
}
end;

procedure TXLSReadII.READ_SHRFMLA;
var
  i: integer;
begin
  // ATTN: If Excel saves a SHRFMLA where some cells have been deleted,
  // (Ex: If you have 10 formulas in a row, saves it, open the sheet again,
  // deletes 4 of them and saves it again) then may the deleted formulas
  // still be saved in the SHRFMLA record!
  // The only way to check this is to look for the corresponding FORMULA
  // records. There is only FORMULA records for formulas that exsists on
  // the sheet. I think :-)

  SetLength(FSharedFormulas,Length(FSharedFormulas) + 1);
  i := High(FSharedFormulas);
  FXLSStream.Read(FSharedFormulas[i],6);
  FXLSStream.Read(FSharedFormulas[i].Len,2); // Reserved data
  FXLSStream.Read(FSharedFormulas[i].Len,2);
  GetMem(FSharedFormulas[i].Formula,FSharedFormulas[i].Len);
  FXLSStream.Read(FSharedFormulas[i].Formula^,FSharedFormulas[i].Len);
end;

procedure TXLSReadII.RREC_NOTE;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then begin
    TRecordStorageSheet(CurrRecs).UpdateInternal(INTERNAL_SUFFIXDATA);
    with PRecNOTE(PBuf)^ do
      FXLS.Sheets[FCurrSheet]._Int_EscherDrawing.SetNoteData(Col,Row,Options,ObjId,ByteStrToWideString(PByteArray(@AuthorName),AuthorNameLen));
  end;
end;

procedure TXLSReadII.RREC_1904;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_ADDMENU;
begin
  // Not used
end;

procedure TXLSReadII.RREC_AUTOFILTERINFO;
begin
  InsertRecord := False;
  if FXLS.Version >= xvExcel97 then
    FXLS.Sheets[FCurrSheet].Autofilters.LoadFromStream(FXLSStream,PBuf);
end;

procedure TXLSReadII.RREC_BACKUP;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_BOOKBOOL;
begin
  CurrRecs.UpdateDefault(Header,PBuf);
  InsertRecord := False;
  TRecordStorageGlobals(CurrRecs).UpdateInternal(INTERNAL_FORMATS);
end;

procedure TXLSReadII.RREC_PALETTE;
var
  i: integer;
begin
  if PRecPALETTE(PBuf).Count > (Length(ExcelColorPalette) - 8) then
    PRecPALETTE(PBuf).Count := Length(ExcelColorPalette) - 8;
  for i := 0 to PRecPALETTE(PBuf).Count - 1 do
    ExcelColorPalette[i + 8] := PRecPALETTE(PBuf).Color[i];
end;

procedure TXLSReadII.RREC_BOUNDSHEET;
var
  S: string;
  Hidden: byte;
begin
  TRecordStorageGlobals(CurrRecs).UpdateInternal(INTERNAL_BOUNDSHEETS);
  InsertRecord := False;
  if FXLS.Version < xvExcel97 then with PRecBOUNDSHEET7(PBuf)^ do begin
    SetLength(S,NameLen);
    Move(Name,Pointer(S)^,NameLen);
    Hidden := (Options and $0300) shr 8;
  end
  else with PRecBOUNDSHEET8(PBuf)^ do begin
    if Name[0] = 1 then begin
      SetLength(S,((NameLen * 2) and $00FF) + 1);
      Move(Name[0],Pointer(S)^,((NameLen * 2) and $00FF) + 1)
    end
    else begin
      SetLength(S,(NameLen and $00FF) + 1);
      Move(Name[0],Pointer(S)^,(NameLen and $00FF) + 1);
    end;
    Hidden := Options and $0003;
  end;
  FBoundsheets.AddObject(S,TObject(Hidden));
end;

procedure TXLSReadII.RREC_CALCCOUNT;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_CALCMODE;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_CODEPAGE;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_COLINFO;
{
var
  Col,MaxCol: integer;
}
begin
  if FXLS.Version >= xvExcel50 then begin
    TRecordStorageSheet(CurrRecs).UpdateInternal(INTERNAL_COLINFO);
    InsertRecord := False;
    FXLS.Sheets[FCurrSheet].Columns.SetRecCOLINFO(PRecCOLINFO(PBuf));
  end;
{
  MaxCol := PRecCOLINFO(PBuf).Col2;
  if PRecCOLINFO(PBuf).Col2 > 255 then
    MaxCol := 255;
  if Assigned(FXLS.OnColWidth) then begin
    for Col := PRecCOLINFO(PBuf).Col1 to MaxCol do
      FXLS.OnColWidth(Self,Col,PRecCOLINFO(PBuf).FormatIndex,PRecCOLINFO(PBuf).Width);
  end;
}
end;

procedure TXLSReadII.RREC_COUNTRY;
begin
  InsertRecord := False;
  if (FXLS.Version >= xvExcel97) and not FIsXLS137 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_RECALCID;
begin
  InsertRecord := False;
  CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_DEFAULTROWHEIGHT;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_DEFCOLWIDTH;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_DELMENU;
begin
  // Not used.
end;

procedure TXLSReadII.RREC_DELTA;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_DIMENSIONS;
var
  C1,R1,C2,R2: integer;
begin
  InsertRecord := False;
  if FXLS.Version >= xvExcel97 then
    CurrRecs.UpdateDefault(Header,PBuf)
  else if FXLS.Version > xvExcel40 then begin
    C1 := PRecDIMENSIONS7(PBuf).FirstCol;
    R1 := PRecDIMENSIONS7(PBuf).FirstRow;
    C2 := PRecDIMENSIONS7(PBuf).LastCol;
    R2 := PRecDIMENSIONS7(PBuf).LastRow;
    PRecDIMENSIONS8(PBuf).FirstCol := C1;
    PRecDIMENSIONS8(PBuf).FirstRow := R1;
    PRecDIMENSIONS8(PBuf).LastCol := C2;
    PRecDIMENSIONS8(PBuf).LastRow := R2;
    CurrRecs.UpdateDefault(Header,PBuf);
  end;
end;

procedure TXLSReadII.RREC_DSF;
begin
  InsertRecord := False;
  CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_FNGROUPCOUNT;
begin
  InsertRecord := False;
  CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_EOF;
begin
  // This shall never happens.
  raise Exception.Create('Unexspected EOF');
end;

procedure TXLSReadII.RREC_NAME;
begin
  case FXLS.Version of
    xvExcel97: begin
      TRecordStorageGlobals(CurrRecs).UpdateInternal(INTERNAL_NAMES);
      FXLS.InternalNames.SetNAME(PRecNAME(PBuf));
      InsertRecord := False;
    end;
  end;
end;

procedure TXLSReadII.RREC_SUPBOOK;
begin
  case FXLS.Version of
    xvExcel97: begin
      TRecordStorageGlobals(CurrRecs).UpdateInternal(INTERNAL_NAMES);
      InsertRecord := False;
      FXLS.FormulaHandler.ExternalNames.SetSUPBOOK(PRecSUPBOOK(PBuf));
    end;
  end;
end;

procedure TXLSReadII.RREC_EXTERNNAME;
begin
  case FXLS.Version of
    xvExcel97: begin
      TRecordStorageGlobals(CurrRecs).UpdateInternal(INTERNAL_NAMES);
      InsertRecord := False;
      FXLS.FormulaHandler.ExternalNames.SetEXTERNNAME(PRecEXTERNNAME8(PBuf));
    end;
  end;
end;

procedure TXLSReadII.RREC_XCT;
var
  i,Count,Index: integer;
begin
  InsertRecord := False;
  Count := PRecXCT(PBuf).CRNCount;
  // Don't know why some Count are negative
  if (Count and $F000) = $F000 then
    Count := $FFFF - Count + 1;
  Index := PRecXCT(PBuf).SheetIndex;
  for i := 0 to Count - 1 do begin
    if (FXLSStream.ReadHeader(Header) <> SizeOf(TBIFFHeader)) or (Header.RecID <> BIFFRECID_CRN) then
      raise Exception.Create('CRN record missing');
    FXLSStream.Read(PBuf^,Header.Length);
    FXLS.FormulaHandler.ExternalNames.SetCRN(Index,PRecCRN(PBuf),Header.Length);
  end;
end;

procedure TXLSReadII.RREC_EXTERNCOUNT;
begin
//  if FXLS.Version = xvExcel97 then
//    FXLS.NameDefs.ExternCount := PWord(PBuf)^;
end;

procedure TXLSReadII.RREC_EXTERNSHEET;
begin
  case FXLS.Version of
    xvExcel97: begin
      if not FIsXLS137 then begin
        TRecordStorageGlobals(CurrRecs).UpdateInternal(INTERNAL_NAMES);
        FXLS.FormulaHandler.ExternalNames.SetEXTERNSHEET(PBuf);
      end;
      InsertRecord := False;
    end;
    xvExcel50: begin
    end;
  end;
end;

procedure TXLSReadII.RREC_FONT;
begin
  InsertRecord := False;
  with FXLS.Fonts.Add do begin
    CharSet := PRecFONT(PBuf).CharSet;
    Family := PRecFONT(PBuf).Family;
    if PRecFONT(PBuf).ColorIndex > $00FF then
      Color := xc0
    else
      Color := TExcelColor(PRecFONT(PBuf).ColorIndex);
    Name := ByteStrToWideString(@PRecFONT(PBuf).Name,PRecFONT(PBuf).NameLen);
    Size20 := PRecFONT(PBuf).Height;
    Style := [];
    if PRecFONT(PBuf).Bold >= $02BC then
      Style := Style + [xfsBold];
    Underline := TXUnderline(PRecFONT(PBuf).Underline);
    if (PRecFONT(PBuf).Attributes and $02) = $02 then
      Style := Style + [xfsItalic];
    if (PRecFONT(PBuf).Attributes and $08) = $08 then
      Style := Style + [xfsStrikeout];
    // Font #4 does not exsists (and is not stored in the XLS file).
    if FXLS.Fonts.Count = 4 then
      FXLS.Fonts.Add;
  end;
end;

procedure TXLSReadII.RREC_HEADER;
begin
  InsertRecord := False;
  if FXLS.Version <= xvExcel40 then
    Exit;
  TRecordStorageSheet(CurrRecs).UpdateInternal(INTERNAL_HEADER);
  if FXLS.Version < xvExcel97 then begin
    Move(PBuf[1],PBuf[3],Header.Length - 1);
    PBuf[1] := 0;
    PBuf[2] := 0;
  end
  else if Header.Length > 0 then
    FXLS.Sheets[FCurrSheet].PrintSettings.Header := ByteStrToWideString(@PBuf[2],PWordArray(PBuf)[0])
  else
    FXLS.Sheets[FCurrSheet].PrintSettings.Header := '';
end;

procedure TXLSReadII.RREC_FOOTER;
begin
  InsertRecord := False;
  if FXLS.Version <= xvExcel40 then
    Exit;
  TRecordStorageSheet(CurrRecs).UpdateInternal(INTERNAL_HEADER);
  if FXLS.Version < xvExcel97 then begin
    Move(PBuf[1],PBuf[3],Header.Length - 1);
    PBuf[1] := 0;
    PBuf[2] := 0;
  end
  else if Header.Length > 0 then
    FXLS.Sheets[FCurrSheet].PrintSettings.Footer := ByteStrToWideString(@PBuf[2],PWordArray(PBuf)[0])
  else
    FXLS.Sheets[FCurrSheet].PrintSettings.Footer := '';
end;

procedure TXLSReadII.RREC_FORMAT;
begin
  InsertRecord := False;
  if FXLS.Version < xvExcel97 then begin
    with PRecFORMAT7(PBuf)^ do
      FXLS.AddNumberFormat(ByteStrToWideString(@Data,Len),Index);
  end
  else begin
    with PRecFORMAT8(PBuf)^ do
      FXLS.AddNumberFormat(ByteStrToWideString(@Data,Len),Index);
  end;
end;

procedure TXLSReadII.RREC_GRIDSET;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_GUTS;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_HCENTER;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_HIDEOBJ;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_HLINK;
begin
  if FXLS.Version < xvExcel97 then
    Exit;
  FXLS.Sheets[FCurrSheet].Hyperlinks.LoadFromStream(FXLSStream,Header.Length,PBuf);
  InsertRecord := False;
end;

procedure TXLSReadII.RREC_FILEPASS;
var
  S: WideString;
begin
  if PRecFILEPASS(PBuf).Options = 0 then
    raise Exception.Create('File encrypted with non-standard key. French?');
  if PRecFILEPASS(PBuf).Options <> 1 then
    raise Exception.Create('Can not read file, unknown type of encryption.');
  if not Assigned(FXLS.OnPassword) and (FXLS.Password = '') then
    raise Exception.Create('File is encrypted. Password required.');

  S := FXLS.Password;
  if Assigned(FXLS.OnPassword) then
    FXLS.OnPassword(FXLS,S);
  if not FXLS.Aborted then begin
    if S = '' then
      raise Exception.Create('Password is missing.');

    if not FXLSStream.SetReadDecrypt(PRecFILEPASS(PBuf),S) then
      raise Exception.Create('Invalid password');
  end;
  InsertRecord := False;
end;

procedure TXLSReadII.RREC_FILESHAREING;
begin
  InsertRecord := False;
  FXLS.SetFILESHARING(PBuf,Header.Length);
end;

procedure TXLSReadII.RREC_FILTERMODE;
begin
  InsertRecord := False;
  if FXLS.Version >= xvExcel97 then
    FXLS.Sheets[FCurrSheet].Autofilters.LoadFromStream(FXLSStream,PBuf);
end;

procedure TXLSReadII.RREC_INTERFACEEND;
begin
  // Not used.
end;

procedure TXLSReadII.RREC_INTERFACEHDR;
begin
  // Not used.
end;

procedure TXLSReadII.RREC_ITERATION;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_MERGEDCELLS;
var
  i,Count: integer;
begin
  TRecordStorageSheet(CurrRecs).UpdateInternal(INTERNAL_SUFFIXDATA);
  InsertRecord := False;
  Count := PRecMERGEDCELLS(PBuf).Count;
  for i := 0 to Count - 1 do begin
    with TMergedCell(FXLS.Sheets[FCurrSheet].MergedCells.Add) do begin
      Row1 := PRecMERGEDCELLS(PBuf).Cells[i].Row1;
      Row2 := PRecMERGEDCELLS(PBuf).Cells[i].Row2;
      Col1 := PRecMERGEDCELLS(PBuf).Cells[i].Col1;
      Col2 := PRecMERGEDCELLS(PBuf).Cells[i].Col2;
    end;
  end;
end;

procedure TXLSReadII.RREC_CONDFMT;
begin
  InsertRecord := False;
  FXLS.Sheets[FCurrSheet].ConditionalFormats.LoadFromStream(FXLSStream,PBuf);
end;

procedure TXLSReadII.RREC_MSODRAWING;
begin
{
  FXLSStream.Read(PBuf^,Header.Length);
  Exit;
}
  TRecordStorageSheet(CurrRecs).UpdateInternal(INTERNAL_SUFFIXDATA);
  FXLS.Sheets[FCurrSheet]._Int_EscherDrawing.LoadFromStream(FXLSStream,PBuf);
  InsertRecord := False;
end;

procedure TXLSReadII.RREC_MSODRAWINGGROUP;
begin
{
  FXLSStream.Read(PBuf^,Header.Length);
  Exit;
}
  InsertRecord := False;

  TRecordStorageGlobals(CurrRecs).UpdateInternal(INTERNAL_MSODRWGRP);
  FXLSStream.BeginCONTINUERead;
  try
    FXLS.MSOPictures.LoadFromStream(FXLSStream,PBuf);
  finally
    FXLSStream.EndCONTINUERead;
  end;
end;

procedure TXLSReadII.RREC_MSODRAWINGSELECTION;
begin
  InsertRecord := False;
end;

procedure TXLSReadII.RREC_MSO_0866;
{
var
  StreamType: word;
}
begin
{
  if FCurrSheet < 0 then begin
    FXLSStream.BeginCONTINUERead;
    try
      FXLSStream.Read(PBuf^,12);
      FXLSStream.Read(StreamType,2);
      case StreamType of
        1: ;
        2: FXLS.PrintPictures.LoadFromStream(FXLSStream,PBuf);
      end;
    finally
      FXLSStream.EndCONTINUERead;
    end;
  end;
}
end;

procedure TXLSReadII.RREC_PASSWORD;
begin
  // Silly password for not encrypted sheets.
  // password protected
  if FBoundsheetIndex < 0 then begin
    InsertRecord := False;
    CurrRecs.UpdateDefault(Header,PBuf);
  end;
{
  if PWord(PBuf)^ <> 0 then
    raise Exception.Create(ersPasswordProtect);
}
end;

procedure TXLSReadII.RREC_PLS;
//var
//  P: Pointer;
begin
//  P := Pointer(Integer(PBuf) + 2);
//  FXLS.SetDEVMODE(P,Header.Length - 2);
//  InsertRecord := False;
//  CurrRecs.AddDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_PRECISION;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_PRINTGRIDLINES;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_PRINTHEADERS;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_PROT4REV;
begin
  InsertRecord := False;
  CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_PROT4REVPASS;
begin

end;

procedure TXLSReadII.RREC_PROTECT;
begin
  InsertRecord := False;
  CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_REFMODE;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_REFRESHALL;
begin
  InsertRecord := False;
  CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_SAVERECALC;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_SELECTION;
var
  i: integer;
  P: PByteArray;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then begin
    CurrRecs.UpdateDefault(Header,PBuf);

    FXLS.Sheets[FCurrSheet].SelectedAreas.Clear;

    FXLS.Sheets[FCurrSheet].SelectedAreas.ActiveCol := PRecSELECTION_2(PBuf).ActiveCol;
    FXLS.Sheets[FCurrSheet].SelectedAreas.ActiveRow := PRecSELECTION_2(PBuf).ActiveRow;
    FXLS.Sheets[FCurrSheet].SelectedAreas.ActiveArea := PRecSELECTION_2(PBuf).ActiveRef;
    P := @PRecSELECTION_2(PBuf).Refs;
    for i := 0 to PRecSELECTION_2(PBuf).RefCount - 1 do begin
      with FXLS.Sheets[FCurrSheet].SelectedAreas.Add do begin
        Col1 := PRecCellAreaShort(P).Col1;
        Row1 := PRecCellAreaShort(P).Row1;
        Col2 := PRecCellAreaShort(P).Col2;
        Row2 := PRecCellAreaShort(P).Row2;
        P := PByteArray(Integer(P) + SizeOf(TRecCellAreaShort));
      end;
    end;
  end;
end;

procedure TXLSReadII.RREC_SHEETLAYOUT;
begin
  FXLS.Sheets[FCurrSheet].TabColor := TExcelColor(PWordArray(PBuf)[8]);
end;

procedure TXLSReadII.RREC_SHEETPROTECTION;
var
  Val: TSheetProtections;
  W: word;
begin
  InsertRecord := False;
  Val := [];
  W := PRecSHEETPROTECTION(PBuf).Options;
  if (W and $0001) = $0001 then Val := Val + [spEditObjects];
  if (W and $0002) = $0002 then Val := Val + [spEditScenarios];
  if (W and $0004) = $0004 then Val := Val + [spEditCellFormatting];
  if (W and $0008) = $0008 then Val := Val + [spEditColumnFormatting];
  if (W and $0010) = $0010 then Val := Val + [spEditRowFormatting];
  if (W and $0020) = $0020 then Val := Val + [spInsertColumns];
  if (W and $0040) = $0040 then Val := Val + [spInsertRows];
  if (W and $0080) = $0080 then Val := Val + [spInsertHyperlinks];
  if (W and $0100) = $0100 then Val := Val + [spDeleteColumns];
  if (W and $0200) = $0200 then Val := Val + [spDeleteRows];
  if (W and $0400) = $0400 then Val := Val + [spSelectLockedCells];
  if (W and $0800) = $0800 then Val := Val + [spSortCellRange];
  if (W and $1000) = $1000 then Val := Val + [spEditAutoFileters];
  if (W and $2000) = $2000 then Val := Val + [spEditPivotTables];
  if (W and $4000) = $4000 then Val := Val + [spSelectUnlockedCells];
  FXLS.Sheets[FCurrSheet].SheetProtection := Val;
end;

procedure TXLSReadII.RREC_DVAL;
begin
  FXLS.Sheets[FCurrSheet].Validations.LoadFromStream(FXLSStream,PBuf);
  InsertRecord := False;
end;

procedure TXLSReadII.RREC_BOTTOMMARGIN;
begin
  InsertRecord := False;
  if FXLS.Version <= xvExcel40 then
    Exit;
  TRecordStorageSheet(CurrRecs).UpdateInternal(INTERNAL_MARGINS);
  FXLS.Sheets[FCurrSheet].PrintSettings.MarginBottom := PRecMARGIN(PBuf).Value;
end;

procedure TXLSReadII.RREC_LEFTMARGIN;
begin
  InsertRecord := False;
  if FXLS.Version <= xvExcel40 then
    Exit;
  TRecordStorageSheet(CurrRecs).UpdateInternal(INTERNAL_MARGINS);
  FXLS.Sheets[FCurrSheet].PrintSettings.MarginLeft := PRecMARGIN(PBuf).Value;
end;

procedure TXLSReadII.RREC_RIGHTMARGIN;
begin
  InsertRecord := False;
  if FXLS.Version <= xvExcel40 then
    Exit;
  TRecordStorageSheet(CurrRecs).UpdateInternal(INTERNAL_MARGINS);
  FXLS.Sheets[FCurrSheet].PrintSettings.MarginRight := PRecMARGIN(PBuf).Value;
end;

procedure TXLSReadII.RREC_TOPMARGIN;
begin
  InsertRecord := False;
  if FXLS.Version <= xvExcel40 then
    Exit;
  TRecordStorageSheet(CurrRecs).UpdateInternal(INTERNAL_MARGINS);
  FXLS.Sheets[FCurrSheet].PrintSettings.MarginTop := PRecMARGIN(PBuf).Value;
end;

procedure TXLSReadII.RREC_SETUP;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_SST;
begin
  TRecordStorageGlobals(CurrRecs).UpdateInternal(INTERNAL_SST);
  InsertRecord := False;
//  FXLSStream.Seek2(-(SizeOf(TBIFFHeader) + Header.Length),soFromCurrent);
  FXLS.Sheets.ReadSST(FXLSStream,Header.Length);
end;

procedure TXLSReadII.RREC_EXTSST;
begin
  InsertRecord := False;
end;

procedure TXLSReadII.RREC_STYLE;
begin
  // Only save Built-in styles.
{
  if (PRecSTYLE(PBuf).FormatIndex and $8000) = $8000 then
    FXLS.Styles.Add(PRecSTYLE(PBuf));
}
end;

procedure TXLSReadII.RREC_USESELFS;
begin
  // Not used.
end;

procedure TXLSReadII.RREC_VCENTER;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_WINDOW1;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel97 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_WINDOW2;
begin
  if FXLS.Version <= xvExcel50 then begin
    PRecWINDOW2_8(PBuf).Zoom := 0;
    PRecWINDOW2_8(PBuf).ZoomPreview := 0;
    PRecWINDOW2_8(PBuf).Reserved := 0;
    Header.Length := SizeOf(TRecWINDOW2_8);
  end;
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_SCL;
begin
  FXLS.Sheets[FCurrSheet].Zoom := Round((PRecSCL(PBuf).Numerator / PRecSCL(PBuf).Denominator) * 100);
end;

procedure TXLSReadII.RREC_PANE;
var
  i: integer;
  P: PByteArray;
begin
  InsertRecord := False;
  with PRecPANE(PBuf)^ do begin
    FXLS.Sheets[FCurrSheet].Pane.ActivePane := PaneNumber;
    FXLS.Sheets[FCurrSheet].Pane.SplitColX := X;
    FXLS.Sheets[FCurrSheet].Pane.SplitRowY := Y;
    FXLS.Sheets[FCurrSheet].Pane.LeftCol := LeftCol;
    FXLS.Sheets[FCurrSheet].Pane.TopRow := TopRow;
    if FXLS.Sheets[FCurrSheet].Pane.PaneType = ptNone then
      FXLS.Sheets[FCurrSheet].Pane.PaneType := ptSplit;

    while FXLSStream.PeekHeader = BIFFRECID_SELECTION do begin
      FXLSStream.ReadHeader(Header);
      FXLSStream.Read(PBuf^,Header.Length);

      if PRecSELECTION(PBuf).Pane = 3 then begin
        FXLS.Sheets[FCurrSheet].SelectedAreas.ActiveCol := PRecSELECTION_2(PBuf).ActiveCol;
        FXLS.Sheets[FCurrSheet].SelectedAreas.ActiveRow := PRecSELECTION_2(PBuf).ActiveRow;
        FXLS.Sheets[FCurrSheet].SelectedAreas.ActiveArea := PRecSELECTION_2(PBuf).ActiveRef;
        P := @PRecSELECTION_2(PBuf).Refs;
        for i := 0 to PRecSELECTION_2(PBuf).RefCount - 1 do begin
          with FXLS.Sheets[FCurrSheet].SelectedAreas.Add do begin
            Col1 := PRecCellAreaShort(P).Col1;
            Row1 := PRecCellAreaShort(P).Row1;
            Col2 := PRecCellAreaShort(P).Col2;
            Row2 := PRecCellAreaShort(P).Row2;
            P := PByteArray(Integer(P) + SizeOf(TRecCellAreaShort));
          end;
        end;
      end;

      FXLS.Sheets[FCurrSheet].Pane.Selections.AddRec(Header,PBuf);
    end;
  end;
end;

procedure TXLSReadII.RREC_WINDOWPROTECT;
begin
  InsertRecord := False;
  if FXLS.Version > xvExcel40 then
    CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_WRITEACCESS;
begin
  InsertRecord := False;
  if FXLS.Version < xvExcel97 then begin
    Move(PBuf[1],PBuf[3],Header.Length - 2);
    PBuf[1] := 0;
    PBuf[2] := 0;
  end;
  if Header.Length < 112 then begin
    FillChar(PBuf[Header.Length],112 - Header.Length,' ');
    Header.Length := 112;
  end;
  CurrRecs.UpdateDefault(Header,PBuf);
end;

procedure TXLSReadII.RREC_WSBOOL;
begin
  if (FXLS.Version > xvExcel40) and not (CurrRecs is TRecordStorageGlobals) then begin
    InsertRecord := False;
    CurrRecs.UpdateDefault(Header,PBuf);
  end;
end;

procedure TXLSReadII.RREC_HORIZONTALPAGEBREAKS;
var
  i: integer;
begin
  TRecordStorageSheet(CurrRecs).UpdateInternal(INTERNAL_PAGEBREAKES);
  if FXLS.Version >= xvExcel97 then begin
    for i := 0 to PRecHORIZONTALPAGEBREAKS(PBuf).Count - 1 do begin
      with FXLS.Sheets[FCurrSheet].PrintSettings.HorizPagebreaks.Add do begin
        Row := PRecHORIZONTALPAGEBREAKS(PBuf).Breaks[i].Val1 - 1;
        Col1 := PRecHORIZONTALPAGEBREAKS(PBuf).Breaks[i].Val2 - 1;
        Col2 := PRecHORIZONTALPAGEBREAKS(PBuf).Breaks[i].Val3 - 1;
      end;
    end;
  end
  else if FXLS.Version = xvExcel50 then begin
    for i := 1 to PWordArray(PBuf)[0] - 1 do begin
      with FXLS.Sheets[FCurrSheet].PrintSettings.HorizPagebreaks.Add do begin
        Row := PWordArray(PBuf)[i] - 1;
        Col1 := 0;
        Col2 := 255;
      end;
    end;
  end;
  InsertRecord := False;
end;

procedure TXLSReadII.RREC_VERTICALPAGEBREAKS;
var
  i: integer;
begin
  TRecordStorageSheet(CurrRecs).UpdateInternal(INTERNAL_PAGEBREAKES);
  if FXLS.Version >= xvExcel97 then begin
    for i := 0 to PRecVERTICALPAGEBREAKS(PBuf).Count - 1 do begin
      with FXLS.Sheets[FCurrSheet].PrintSettings.VertPagebreaks.Add do begin
        Col := PRecVERTICALPAGEBREAKS(PBuf).Breaks[i].Val1 - 1;
        Row1 := PRecVERTICALPAGEBREAKS(PBuf).Breaks[i].Val2 - 1;
        Row2 := PRecVERTICALPAGEBREAKS(PBuf).Breaks[i].Val3 - 1;
      end;
    end;
  end
  else if FXLS.Version = xvExcel50 then begin
    for i := 1 to PWordArray(PBuf)[0] - 1 do begin
      with FXLS.Sheets[FCurrSheet].PrintSettings.VertPagebreaks.Add do begin
        Col := PWordArray(PBuf)[i] - 1;
        Row1 := 0;
        Row2 := MAXROW;
      end;
    end;
  end;
  InsertRecord := False;
end;

procedure TXLSReadII.RREC_XF;

procedure ReadXF30;
begin
  with FXLS.Formats.Add do begin
//    Font := FXLS.Fonts[PRecXF3(PBuf).FontIndex];
//    FontIndex := PRecXF3(PBuf).FontIndex;
  end;
end;

begin
  if not FXLS.Formats.NumberFormats.Sorted then
    FXLS.Formats.NumberFormats.Sort;

  InsertRecord := False;
  if FXLS.Version >= xvExcel97 then
    FXLS.Formats.Add.FromXF8(PBuf)
  else if FXLS.Version >= xvExcel50 then
    FXLS.Formats.Add.FromXF7(PBuf)
  else if FXLS.Version >= xvExcel30 then
    ReadXF30;
end;

end.
