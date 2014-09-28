unit ExtSeek2;

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

uses Classes, SysUtils, BIFFRecsII2, XLSUtils2, XLSStream2, SST2, XLSFonts2;

type
//* Performs a fast seek for a cell value in an Excel file. TExternalSeek is much
//* faster for reading a single value in a file than TXLSReadWriteII2. It shall
//* however only be used for reading single cells. It is not possible to change
//* a cell value with TExternalSeek.
    TExternalSeek = class(TObject)
private
     FSSTPos,FExtSSTPos: integer;
     FFilename: WideString;
     PBuf: PByteArray;
     FHeader: TBIFFHeader;
     FVersion: TExcelVersion;
     FStream: TXLSStream;
     FValue: TFormulaValue;
     FSST: TSST2;

     function CheckCell(Col,Row: word): boolean;
public
     constructor Create;
     destructor Destroy; override;
     //* Seeks the file.
     //* Seek the file given by Filename for the sheet SheetIndex and the cell
     //* at Col and Row. Returns True if a cell was found at the location.
     function Seek(SheetIndex,Col,Row: integer): boolean;

     //* The name of the file to be seeked.
     property Filename: WideString read FFilename write FFilename;
     //* The value of the cell, if it was found.
     property Value: TFormulaValue read FValue;
     end;

implementation

constructor TExternalSeek.Create;
begin
  FVersion := xvExcel97;
  FSST := TSST2.Create(Nil);
end;

function TExternalSeek.CheckCell(Col,Row: word): boolean;

function GetFormulaStr(V: double): WideString;
begin
  case TByte8Array(V)[0] of
    0: begin
     FStream.ReadHeader(FHeader);
      if FHeader.RecID = $0207 then begin
        FStream.Read(PBuf^,FHeader.Length);
        Result := ByteStrToWideString(PBuf,PRecSTRING(PBuf).Len);
      end;
    end;
    1: if TByte8Array(V)[2] = 0 then
         Result := 'False'
       else
         Result := 'True';
    2: Result := ErrorCodeToText(TByte8Array(V)[2]);
  end;
end;

begin
  Result := False;
  case FHeader.RecID of
    BIFFRECID_LABEL:
      if (PRecLABEL(PBuf).Col = Col) and (PRecLABEL(PBuf).Row = Row) then begin
        FVSetString(FValue,ByteStrToWideString(@PRecLABEL(PBuf).Data,PRecLABEL(PBuf).Len));
        Result := True;
      end;
    BIFFRECID_LABELSST:
      if (PRecLABELSST(PBuf).Col = Col) and (PRecLABELSST(PBuf).Row = Row) then begin
        if FExtSSTPos > 0 then
          FVSetString(FValue,FSST.StrSeek(FStream,FExtSSTPos,PRecLABELSST(PBuf).SSTIndex))
        else begin
          FStream.Seek(FSSTPos,soFromBeginning);
          FStream.ReadHeader(FHeader);
          FSST.Read(FStream,FHeader.Length,False);
          FVSetString(FValue,FSST.ItemsByIndex[PRecLABELSST(PBuf).SSTIndex]);
        end;
        Result := True;
      end;
    BIFFRECID_MULRK:
    begin
      if (Col >= PRecMULRK(PBuf).Col1) and (Col <= (PRecMULRK(PBuf).Col1 + ((FHeader.Length - 6) div 6 - 1))) and (Row = PRecMULRK(PBuf).Row) then begin
        FVSetFloat(FValue,DecodeRK(PRecMULRK(PBuf).RKs[Col - PRecMULRK(PBuf).Col1].Value));
        Result := True;
      end;
    end;
    BIFFRECID_NUMBER:
      if (PRecNUMBER(PBuf).Col = Col) and (PRecNUMBER(PBuf).Row = Row) then begin
        FVSetFloat(FValue,PRecNUMBER(PBuf).Value);
        Result := True;
      end;
    BIFFRECID_RK,$027E:
      if (PRecRK(PBuf).Col = Col) and (PRecRK(PBuf).Row = Row) then begin
        FVSetFloat(FValue,DecodeRK(PRecRK(PBuf).Value));
        Result := True;
      end;
    BIFFRECID_RSTRING:
      if (PRecRSTRING(PBuf).Col = Col) and (PRecRSTRING(PBuf).Row = Row) then begin
        FVSetString(FValue,ByteStrToWideString(@PRecRSTRING(PBuf).Data,PRecRSTRING(PBuf).Len));
        Result := True;
      end;
    BIFFRECID_FORMULA:
      if (PRecFORMULA(PBuf).Col = Col) and (PRecFORMULA(PBuf).Row = Row) then begin
        if (TByte8Array(PRecFORMULA(PBuf).Value)[6] = $FF) and (TByte8Array(PRecFORMULA(PBuf).Value)[7] = $FF) then
          FVSetString(FValue,GetFormulaStr(PRecFORMULA(PBuf).Value))
        else
          FVSetFloat(FValue,PRecFORMULA(PBuf).Value);
        Result := True;
      end;
    $0206,$0406:
      if (PRecFORMULA3(PBuf).Col = Col) and (PRecFORMULA3(PBuf).Row = Row) then begin
        if (TByte8Array(PRecFORMULA3(PBuf).Value)[6] = $FF) and (TByte8Array(PRecFORMULA3(PBuf).Value)[7] = $FF) then
          FVSetString(FValue,GetFormulaStr(PRecFORMULA3(PBuf).Value))
        else
          FVSetFloat(FValue,PRecFORMULA3(PBuf).Value);
        Result := True;
      end;
  end;
end;

function TExternalSeek.Seek(SheetIndex,Col,Row: integer): boolean;
type
  TIntArray = array[0..High(integer) div 4 - 1] of integer;
  PIntArray = ^TIntArray;
  TSmallIntArray = array[0..High(smallint) div 2 - 1] of smallint;
  PSmallIntArray = ^TSmallIntArray;
var
  Pos,DbCellPos,Offs: integer;
  R1,R2,DBCellCount,RowCount: integer;
  DbCellOffsets: PIntArray;
  CellOffsets: PSmallIntArray;

function NoneIndexSearch: boolean;
begin
  Result := False;
  while True do begin
    Pos := FStream.ReadHeader(FHeader);
    if (FHeader.RecID = BIFFRECID_EOF) or (Pos <= 0) then
      Exit;
    if (FHeader.RecID = BIFFRECID_LABEL) or
       (FHeader.RecID = BIFFRECID_LABELSST) or
       (FHeader.RecID = BIFFRECID_MULRK) or
       (FHeader.RecID = BIFFRECID_NUMBER) or
       (FHeader.RecID = BIFFRECID_RK) or (FHeader.RecID = $027E) or
       (FHeader.RecID = BIFFRECID_RSTRING) or
       (FHeader.RecID = BIFFRECID_FORMULA) or (FHeader.RecID = $0206) or (FHeader.RecID = $0406) then begin
      FStream.Read(PBuf^,FHeader.Length);
      Result := CheckCell(Col,Row);
      if Result then
        Exit;
    end
    else
      FStream.Seek(FHeader.Length,soFromCurrent);
  end;
end;

function OleSearch: boolean;
var
  i,j: integer;
begin
  FSSTPos := -1;
  FExtSSTPos := -1;
  Result := False;
  j := 0;
  while True do begin
    Pos := FStream.ReadHeader(FHeader);
    if Pos <= 0 then
      Exit;
    if (FHeader.RecID = BIFFRECID_BOUNDSHEET) and (SheetIndex >= 0) then begin
      Dec(SheetIndex);
      if SheetIndex < 0 then begin
        FStream.Read(PBuf^,FHeader.Length);
        if FVersion < xvExcel97 then with PRecBOUNDSHEET7(PBuf)^ do
          j := BOFPos
        else with PRecBOUNDSHEET8(PBuf)^ do
          j := BOFPos;
        // ???
        if (FVersion < xvExcel97) {or (FSST <> Nil)} then
          Break;
      end
      else
        FStream.Seek(FHeader.Length,soFromCurrent);
    end
    else if FHeader.RecID = BIFFRECID_SST then begin
      FSSTPos := FStream.Pos - SizeOf(TBIFFHeader);
      FStream.Seek(FHeader.Length,soFromCurrent);
    end
    else if FHeader.RecID = BIFFRECID_EXTSST then begin
      FExtSSTPos := FStream.Pos - SizeOf(TBIFFHeader);
      FStream.Seek(FHeader.Length,soFromCurrent);
    end
    else if FHeader.RecID = BIFFRECID_EOF then
      Break
    else
      FStream.Seek(FHeader.Length,soFromCurrent);
  end;
  if SheetIndex >= 0 then
    raise Exception.Create('Can not find the sheet');
  FStream.Seek(j,soFromBeginning);
  FStream.Read(FHeader,SizeOf(TBIFFHeader));
  if (FHeader.RecID and $FF) <> BIFFRECID_BOF then
    raise Exception.Create('File has no data');
  FStream.Seek(FHeader.Length,soFromCurrent);
  FStream.Read(FHeader,SizeOf(TBIFFHeader));
  FStream.Read(PBuf^,FHeader.Length);
  if FHeader.RecID <> BIFFRECID_INDEX then begin
    Result := NoneIndexSearch;
    Exit;
  end;
  if FVersion < xvExcel97 then with PRecINDEX7(PBuf)^ do begin
    R1 := Row1;
    R2 := Row2 - 1;
    DBCellCount := (FHeader.Length - (Integer(@PRecINDEX7(PBuf).Offsets[0]) - Integer(PBuf))) div 4;
  end
  else with PRecINDEX8(PBuf)^ do begin
    R1 := Row1;
    R2 := Row2 - 1;
    DBCellCount := (FHeader.Length - (Integer(@PRecINDEX8(PBuf).Offsets[0]) - Integer(PBuf))) div 4;
  end;
  if (Row >= R1) and (Row <= R2) then begin
    GetMem(DbCellOffsets,DBCellCount * 4);
    try
      if FVersion < xvExcel97 then
        Move(PRecINDEX7(PBuf).Offsets[0],DbCellOffsets^,DBCellCount * 4)
      else
        Move(PRecINDEX8(PBuf).Offsets[0],DbCellOffsets^,DBCellCount * 4);
      for i := 0 to DBCellCount - 1 do begin
        FStream.Seek(DbCellOffsets[i],soFromBeginning);
        FStream.Read(FHeader,SizeOf(TBIFFHeader));
        if FHeader.RecID <> BIFFRECID_DBCELL then
          raise Exception.Create('DBCELL record is missing');
        FStream.Read(PBuf^,FHeader.Length);
        RowCount := (FHeader.Length - 4) div 2;
        GetMem(CellOffsets,RowCount * 2);
        Move(PRecDBCELL(PBuf).Offsets[0],CellOffsets^,RowCount * 2);
        try
          Offs := 0;
          DbCellPos := FStream.Seek(0,soFromCurrent);
          DbCellPos := DbCellPos - (FHeader.Length + 4);
          FStream.Seek(DbCellPos - PRecDBCELL(PBuf).RowOffset,soFromBeginning);
          for j := 0 to RowCount - 1 do begin
            FStream.Read(FHeader,SizeOf(TBIFFHeader));
            if FHeader.RecID <> BIFFRECID_ROW then
              raise Exception.Create('ROW record is missing');
            FStream.Read(PBuf^,FHeader.Length);
            if Offs <= 0 then
              Offs := FStream.Pos;
            Offs := Offs + CellOffsets[j];
            if (PRecROW(PBuf).Row = Row) and (Col >= PRecROW(PBuf).Col1) and (Col <= (PRecROW(PBuf).Col2 - 1)) then begin
              FStream.Seek(Offs,soFromBeginning);
              repeat
                FStream.Read(FHeader,SizeOf(TBIFFHeader));
                Pos := FStream.Read(PBuf^,FHeader.Length);
                if CheckCell(Col,Row) then begin
                  Result := True;
                  Exit;
                end;
              until ((FHeader.RecID in [BIFFRECID_DBCELL,BIFFRECID_EOF]) or (Pos <= 0));
              Exit;
            end;
          end;
        finally
          FreeMem(CellOffsets);
        end;
      end;
    finally
      FreeMem(DbCellOffsets);
    end;
  end;
end;

function FileSearch: boolean;
var
  i: integer;
begin
  Result := False;
  PBuf := AllocMem(MAXRECSZ_97);
  try
    i := 0;
    repeat
      FStream.Read(FHeader,SizeOf(TBIFFHeader));
      FStream.Read(PBuf^,FHeader.Length);
      Inc(i);
    until ((FHeader.RecID = BIFFRECID_INDEX) or (i > 10));
    if i > 0 then begin
      Result := NoneIndexSearch;
      Exit;
    end;
    if FVersion < xvExcel97 then with PRecINDEX7(PBuf)^ do begin
      R1 := Row1;
      R2 := Row2 - 1;
      DBCellCount := (FHeader.Length - (Integer(@PRecINDEX7(PBuf).Offsets[0]) - Integer(PBuf))) div 4;
    end
    else with PRecINDEX8(PBuf)^ do begin
      R1 := Row1;
      R2 := Row2 - 1;
      DBCellCount := (FHeader.Length - (Integer(@PRecINDEX8(PBuf).Offsets[0]) - Integer(PBuf))) div 4;
    end;
    // ATTN: I am not sure this is the moste efficiant way to search.
    // There seem to be no DBCELL records (or anyhing similar).
    // I have no ducumentation on records prior to Excel 5.
    if (Row >= R1) and (Row <= R2) then begin
      GetMem(DbCellOffsets,DBCellCount * 4);
      try
        if FVersion < xvExcel97 then
          Move(PRecINDEX7(PBuf).Offsets[0],DbCellOffsets^,DBCellCount * 4)
        else
          Move(PRecINDEX8(PBuf).Offsets[0],DbCellOffsets^,DBCellCount * 4);
        for i := 0 to DBCellCount - 1 do begin
          FStream.Seek(DbCellOffsets[i],soFromBeginning);
          repeat
            FStream.Read(FHeader,SizeOf(TBIFFHeader));
            FStream.Read(PBuf^,FHeader.Length);
            if FHeader.RecID = BIFFRECID_ROW then begin
              if (PRecROW(PBuf).Row = Row) and (Col >= PRecROW(PBuf).Col1) and (Col <= (PRecROW(PBuf).Col2 - 1)) then begin
                repeat
                  FStream.Read(FHeader,SizeOf(TBIFFHeader));
                  FStream.Seek(FHeader.Length,soFromCurrent);
                until (FHeader.RecID <> BIFFRECID_ROW);
                repeat
                  FStream.Read(FHeader,SizeOf(TBIFFHeader));
                  Pos := FStream.Read(PBuf^,FHeader.Length);
                  if CheckCell(Col,Row) then begin
                    Result := True;
                    Exit;
                  end;
                until ((FHeader.RecID in [BIFFRECID_DBCELL,BIFFRECID_EOF]) or (Pos <= 0));
                Exit;
              end;
            end;
          until (FHeader.RecID <> BIFFRECID_ROW);
        end;
      finally
        FreeMem(DbCellOffsets);
      end;
    end;
  finally
    FreeMem(PBuf);
  end;
end;

begin
  FStream := TXLSStream.Create(Nil);
  try
    FVersion := FStream.OpenStorageRead(FFilename);
    GetMem(PBuf,MAXRECSZ_97);
    try
      if FVersion  < xvExcel50 then
        Result := FileSearch
      else
        Result := OleSearch;
    finally
      FreeMem(PBuf);
      FSST.Clear;
    end
  finally
    FStream.CloseStorage;
  end;
end;



destructor TExternalSeek.Destroy;
begin
  FSST.Free;
  inherited;
end;

end.
