unit FormulaHandler2;

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

uses Classes, SysUtils, BIFFRecsII2, XLSUtils2, DecodeFormula2, EncodeFormulaII2,
     XLSNames2, ExcelFuncII2, SST2, CellValues2, ExcelMaskII2, XLSWideStrList2;

type TSheetDataType = (sdtName,sdtCell);

type TSheetNameEvent = procedure (Name: WideString; var Index,TabCount: integer) of object;
type TSheetDataEvent = function (DataType: TSheetDataType; SheetIndex,Col,Row: integer): WideString of object;

type TFormulaHandler = class(TObject)
private
     FOwner: TPersistent;
     FVersion: TExcelVersion;
     FSheetNameEvent: TSheetNameEvent;
     FSheetDataEvent: TSheetDataEvent;
     FFormulaEncoder: TEncodeFormula;
     FExternalNames: TExternalNames;
     FInternalNames: TInternalNames;
     FValuesList: TCellValuesList;
     FSST: TSST2;

     procedure FormulaUnknownFunction(Name: WideString; var ID: integer);
     procedure FormulaUnknownName(Name: WideString; var ID: integer);
     procedure FormulaExternName(Path,Filename,SheetName,Name: WideString; IsRef: boolean; var ExtIndex,NameIndex: integer);
     procedure SetVersion(const Value: TExcelVersion);
     function  AreaFromFmla(Fmla: TDynByteArray; var Sheet,Col1,Row1,Col2,Row2: integer): boolean;
public
     constructor Create(AOwner: TPersistent; ASST: TSST2);
     destructor Destroy; override;
     procedure Clear;
     function  DecodeFormula(Buf: PByteArray; Len: integer): WideString;
     function  DecodeFormulaRel(Buf: PByteArray; Len: integer; SheetIndex,Col,Row: integer): WideString;
     function  EncodeFormula(Formula: WideString; ReturnClass: byte; var Buf: PByteArray; BufSz: integer; IsOOC: boolean): integer;
     function  GetName(NameType: TFormulaNameType; SheetIndex,NameIndex,Col,Row: integer): WideString;
     procedure GetNameRef(AName: string; out ASheetIndex,Col1,Row1,Col2,Row2: integer; AcceptArea: boolean = False);
     procedure DeleteSheet(SheetIndex: integer);
     procedure InsertSheet(SheetIndex: integer);
     procedure DeleteRows(SheetIndex,Row1,Row2: integer);
     procedure InsertRows(SheetIndex,Row,Count: integer);
     procedure DeleteColumns(SheetIndex,Col1,Col2: integer);
     procedure InsertColumns(SheetIndex,Col,Count: integer);
     function  Calculate(PTGS: TRecPTGS; Col,Row,SheetIndex: integer): TFormulaValue;
     function  StrListFromFmla(SheetIndex: integer; Fmla: TDynByteArray; List: TXLSWideStringList): integer;
     function  FloatListFromFmla(SheetIndex: integer; Fmla: TDynByteArray; var List: TDynDoubleArray): integer;

     property Version: TExcelVersion read FVersion write SetVersion;
     property InternalNames: TInternalNames read FInternalNames write FInternalNames;
     property ExternalNames: TExternalNames read FExternalNames write FExternalNames;

     property OnSheetName: TSheetNameEvent read FSheetNameEvent write FSheetNameEvent;
     property OnSheetData: TSheetDataEvent read FSheetDataEvent write FSheetDataEvent;
     property Cells: TCellValuesList read FValuesList;
     property SST: TSST2 read FSST;
     end;

implementation

uses XLSReadWriteII2, CalculateFormula2;

{ TFormulaHandler }

function TFormulaHandler.AreaFromFmla(Fmla: TDynByteArray; var Sheet, Col1, Row1, Col2, Row2: integer): boolean;
var
  i: integer;
  S: WideString;
begin
  Result := True;
  Col1 := -1;
  if (Length(Fmla) = (SizeOf(TPTGArea8) + 1)) and (Fmla[0] = ptgArea) then begin
    Col1 := PPTGArea8(@Fmla[1]).Col1;
    Row1 := PPTGArea8(@Fmla[1]).Row1;
    Col2 := PPTGArea8(@Fmla[1]).Col2;
    Row2 := PPTGArea8(@Fmla[1]).Row2;
  end
  else if (Length(Fmla) = (SizeOf(TPTGArea3d8) + 1)) and (Fmla[0] = ptgArea3d) then begin
    Col1 := PPTGArea3d8(@Fmla[1]).Col1;
    Row1 := PPTGArea3d8(@Fmla[1]).Row1;
    Col2 := PPTGArea3d8(@Fmla[1]).Col2;
    Row2 := PPTGArea3d8(@Fmla[1]).Row2;
    Sheet := PPTGArea3d8(@Fmla[1]).Index;
    i := FExternalNames.IsSelf(Sheet);
    if i >= 0 then
      Sheet := i;
  end
  else if (Length(Fmla) = (SizeOf(TPTGName8) + 1)) and (Fmla[0] = ptgName) then begin
    S := GetName(ntName,-1,PPTGName8(@Fmla[1]).NameIndex,0,0);
    GetNameRef(S,Sheet,Col1,Row1,Col2,Row2,True);
  end
{
  else if (Length(Fmla) = (SizeOf(TPTGNameX8) + 1)) and (Fmla[0] = ptgNameX) then begin
    Extern name...
  end
}
  else
    Result := False;
end;

function TFormulaHandler.Calculate(PTGS: TRecPTGS; Col, Row, SheetIndex: integer): TFormulaValue;
begin
  Result := CalculateFmla(TXLSReadWriteII2(FOwner),PTGS.PTGS,PTGS.Size,Col,Row,SheetIndex,[],Nil);
end;

procedure TFormulaHandler.Clear;
begin
  FExternalNames.Clear;
  FInternalNames.Clear;
  FValuesList.Clear;
end;

constructor TFormulaHandler.Create(AOwner: TPersistent; ASST: TSST2);
begin
  FOwner := AOwner;
  FSST := ASST;
  FValuesList := TCellValuesList.Create(FSST);
  FFormulaEncoder := TEncodeFormula.Create;
  FFormulaEncoder.OnUnknownFunction := FormulaUnknownFunction;
  FFormulaEncoder.OnUnknownName := FormulaUnknownName;
  FFormulaEncoder.OnExternName := FormulaExternName;

  FExternalNames := TExternalNames.Create;
  FInternalNames := TInternalNames.Create(FOwner,GetName,FFormulaEncoder);
end;

function TFormulaHandler.DecodeFormula(Buf: PByteArray; Len: integer): WideString;
begin
  Result := DecodeFmla(FVersion,Buf,Len,-1,-1,-1,GetName);
end;

function TFormulaHandler.DecodeFormulaRel(Buf: PByteArray; Len, SheetIndex, Col, Row: integer): WideString;
begin
  Result := DecodeFmla(FVersion,Buf,Len,SheetIndex,Col,Row,GetName);
end;

procedure TFormulaHandler.DeleteColumns(SheetIndex, Col1, Col2: integer);
var
  i,j,C1,C2,Count: integer;
begin
  Count := Col2 - Col1 + 1;
  for i := 0 to FInternalNames.Count - 1 do begin
    j := FInternalNames[i].ExtSheet;
    if (j >= 0) and (FExternalNames.IsSelf(j) = SheetIndex) then begin
      C1 := FInternalNames[i].Col1;
      C2 := FInternalNames[i].Col2;

      if C1 > Col2 then begin
        Dec(C1,Count);
        Dec(C2,Count);
      end
      else if (C1 < Col1) and (C2 > Col2) then begin
        Dec(C2,Count);
      end
      else if (C1 <= Col2) and (C2 > Col2) then begin
        C1 := Col1;
        Dec(C2,Count);
      end
      else if (C1 >= Col1) and (C2 <= Col2) then begin
        C1 := -1;
        C2 := -1;
      end
      else if (C2 >= Col1) and (C2 <= Col2) then begin
        C2 := Col1 - 1;
      end
      else if C2 < Col1 then begin
        Continue;
      end;
      if (C1 >= 0) and (C1 <= MAXCOL) and (C2 >= 0) and (C2 <= MAXCOL) then begin
        FInternalNames[i].Col1 := C1;
        FInternalNames[i].Col2 := C2;
      end
      else
        FInternalNames[i].SetError;
    end;
  end;
end;

procedure TFormulaHandler.DeleteRows(SheetIndex, Row1, Row2: integer);
var
  i,j,R1,R2,Count: integer;
begin
  Count := Row2 - Row1 + 1;
  for i := 0 to FInternalNames.Count - 1 do begin
    j := FInternalNames[i].ExtSheet;
    if (j >= 0) and (FExternalNames.IsSelf(j) = SheetIndex) then begin
      R1 := FInternalNames[i].Row1;
      R2 := FInternalNames[i].Row2;

      if R1 > Row2 then begin
        Dec(R1,Count);
        Dec(R2,Count);
      end
      else if (R1 < Row1) and (R2 > Row2) then begin
        Dec(R2,Count);
      end
      else if (R1 <= Row2) and (R2 > Row2) then begin
        R1 := Row1;
        Dec(R2,Count);
      end
      else if (R1 >= Row1) and (R2 <= Row2) then begin
        R1 := -1;
        R2 := -1;
      end
      else if (R2 >= Row1) and (R2 <= Row2) then begin
        R2 := Row1 - 1;
      end
      else if R2 < Row1 then begin
        Continue;
      end;
      if (R1 >= 0) and (R1 <= MAXROW) and (R2 >= 0) and (R2 <= MAXROW) then begin
        FInternalNames[i].Row1 := R1;
        FInternalNames[i].Row2 := R2;
      end
      else
        FInternalNames[i].SetError;
    end;
  end;
end;

procedure TFormulaHandler.DeleteSheet(SheetIndex: integer);
begin
  FValuesList.Delete(SheetIndex);
  FExternalNames.DeleteSheet(SheetIndex);
end;

destructor TFormulaHandler.Destroy;
begin
  FInternalNames.Free;
  FExternalNames.Free;
  FFormulaEncoder.Free;
  FValuesList.Free;
  inherited;
end;

function TFormulaHandler.EncodeFormula(Formula: WideString; ReturnClass: byte; var Buf: PByteArray; BufSz: integer; IsOOC: boolean): integer;
begin
  Result := FFormulaEncoder.Encode(Formula,ReturnClass,Buf,BufSz,IsOOC);
end;

function TFormulaHandler.FloatListFromFmla(SheetIndex: integer; Fmla: TDynByteArray; var List: TDynDoubleArray): integer;
var
  C,R,C1,R1,C2,R2: integer;
begin
  Result := 0;
  if Length(Fmla) <= 0 then
    Exit;
  if not AreaFromFmla(Fmla,SheetIndex,C1,R1,C2,R2) then
    raise Exception.CreateFmt('Unknown formula. (%.2X)',[Fmla[0]]);
  if C1 >= 0 then begin
    if C1 = C2 then begin
      SetLength(List,R2 - R1 + 1);
      for R := R1 to R2 do begin
        List[R - R1] := Cells[SheetIndex].GetAsFloat(C1,R);
        Inc(Result);
      end;
    end
    else begin
      SetLength(List,C2 - C1 + 1);
      for C := C1 to C2 do begin
        List[C - C1] := Cells[SheetIndex].GetAsfloat(C,R1);
        Inc(Result);
      end;
    end;
  end;
end;

procedure TFormulaHandler.FormulaExternName(Path,Filename,SheetName,Name: WideString; IsRef: boolean; var ExtIndex, NameIndex: integer);
var
  Index,TabCount: integer;
begin
  if (Path = '') and (Filename = '') then begin
    FSheetNameEvent(SheetName,Index,TabCount);
    if Index >= 0 then begin
      ExtIndex := FExternalNames.AddSelf(Index,TabCount);
      NameIndex := Index;
    end;
  end
  else begin
    if IsRef then begin
      FExternalNames.RefIndexByName(Path,Filename,SheetName,ExtIndex,NameIndex);
      if NameIndex < 0 then
        FExternalNames.AddRef(Path,Filename,SheetName,ExtIndex,NameIndex);
    end
    else
      FExternalNames.NameIndexByName(Path,Filename,Name,ExtIndex,NameIndex);
  end;
end;

procedure TFormulaHandler.FormulaUnknownFunction(Name: WideString; var ID: integer);
begin
  ID := -1;
end;

procedure TFormulaHandler.FormulaUnknownName(Name: WideString; var ID: integer);
begin
  ID := FInternalNames.FindName(Name);
end;

function TFormulaHandler.GetName(NameType: TFormulaNameType; SheetIndex, NameIndex, Col, Row: integer): WideString;
var
  i: integer;
begin
  case NameType of
    ntExternSheet: begin
      i := FExternalNames.IsSelf(SheetIndex);
      // The sheet is deleted
      if i = $FFFF then
        Result := CellErrorNames[ERR_REF] + '!'
      else if i = $FFFE then
        Result := FInternalNames[NameIndex - 1].Name
      else if i >= 0 then
        Result := FSheetDataEvent(sdtName,i,-1,-1) + '!'
      else
        Result := FExternalNames.AsString[SheetIndex,NameIndex];
    end;
    ntCellValue: begin
      Result := FSheetDataEvent(sdtName,SheetIndex,Col,Row)
    end;
    else
      Result := FInternalNames[NameIndex - 1].Name;
  end;
end;

procedure TFormulaHandler.GetNameRef(AName: string; out ASheetIndex, Col1,Row1,Col2,Row2: integer; AcceptArea: boolean = False);
var
  i: integer;
begin
  i := FInternalNames.FindName(AName);
  if i < 0 then
    raise Exception.CreateFmt('Can not find name "%s"',[AName]);
  if (Length(FInternalNames[i].NameDef) = 11) and (FInternalNames[i].NameDef[0] in [ptgArea3d,ptgArea3dA,ptgArea3dV]) then begin
    if not AcceptArea then
      raise Exception.CreateFmt('Name "%s" is an area',[AName]);
    ASheetIndex := FExternalNames.IsSelf(PPTGArea3d8(@FInternalNames[i].NameDef[1]).Index);
    if ASheetIndex < 0 then
      raise Exception.CreateFmt('Name "%s" is not an internal name',[AName]);
    Col1 := PPTGArea3d8(@FInternalNames[i].NameDef[1]).Col1;
    Row1 := PPTGArea3d8(@FInternalNames[i].NameDef[1]).Row1;
    Col2 := PPTGArea3d8(@FInternalNames[i].NameDef[1]).Col2;
    Row2 := PPTGArea3d8(@FInternalNames[i].NameDef[1]).Row2;
  end
  else if (Length(FInternalNames[i].NameDef) = 7) and (FInternalNames[i].NameDef[0] in [ptgRef3d,ptgRef3dV,ptgRef3dA]) then begin
    with PPTGRef3d8(@FInternalNames[i].NameDef[1])^ do begin
      ASheetIndex := FExternalNames.IsSelf(Index);
      if ASheetIndex < 0 then
        raise Exception.CreateFmt('Name "%s" is not an internal name',[AName]);
      Col1 := Col;
      Row1 := Row;
      Col2 := Col;
      Row2 := Row;
    end;
  end
  else
    raise Exception.CreateFmt('Name "%s" is not valid',[AName]);
end;

procedure TFormulaHandler.InsertColumns(SheetIndex, Col, Count: integer);
var
  i,j,C1,C2: integer;
begin
  for i := 0 to FInternalNames.Count - 1 do begin
    j := FInternalNames[i].ExtSheet;
    if (j >= 0) and (FExternalNames.IsSelf(j) = SheetIndex) then begin
      C1 := FInternalNames[i].Col1;
      C2 := FInternalNames[i].Col2;

      if C1 >= Col then begin
        Inc(C1,Count);
        Inc(C2,Count);
      end
      else if C2 < Col then
        Continue
      else
        Inc(C2,Count);

      if (C1 > MAXCOL) and (C2 > MAXCOL) then begin
        FInternalNames[i].SetError;
        Continue;
      end;
      if C1 > MAXCOL then
        C1 := MAXCOL;
      if C2 > MAXCOL then
        C2 := MAXCOL;
      FInternalNames[i].Col1 := C1;
      FInternalNames[i].Col2 := C2;
    end;
  end;
end;

procedure TFormulaHandler.InsertRows(SheetIndex, Row, Count: integer);
var
  i,j,R1,R2: integer;
begin
  for i := 0 to FInternalNames.Count - 1 do begin
    j := FInternalNames[i].ExtSheet;
    if (j >= 0) and (FExternalNames.IsSelf(j) = SheetIndex) then begin
      R1 := FInternalNames[i].Row1;
      R2 := FInternalNames[i].Row2;

      if R1 >= Row then begin
        Inc(R1,Count);
        Inc(R2,Count);
      end
      else if R2 < Row then
        Continue
      else
        Inc(R2,Count);

      if (R1 > MAXROW) and (R2 > MAXROW) then begin
        FInternalNames[i].SetError;
        Continue;
      end;
      if R1 > MAXROW then
        R1 := MAXROW;
      if R2 > MAXROW then
        R2 := MAXROW;
      FInternalNames[i].Row1 := R1;
      FInternalNames[i].Row2 := R2;
    end;
  end;
end;

procedure TFormulaHandler.InsertSheet(SheetIndex: integer);
begin
  FValuesList.Insert(SheetIndex);
  FExternalNames.InsertSheet(SheetIndex);
end;

procedure TFormulaHandler.SetVersion(const Value: TExcelVersion);
begin
  FVersion := Value;
  FFormulaEncoder.ExcelVersion := FVersion;
end;

function TFormulaHandler.StrListFromFmla(SheetIndex: integer; Fmla: TDynByteArray; List: TXLSWideStringList): integer;
var
  C,R,C1,R1,C2,R2: integer;
begin
  Result := 0;
  if Length(Fmla) <= 0 then
    Exit;
  if not AreaFromFmla(Fmla,SheetIndex,C1,R1,C2,R2) then
    raise Exception.CreateFmt('Unknown formula. (%.2X)',[Fmla[0]]);
  if C1 >= 0 then begin
    if C1 = C2 then begin
      for R := R1 to R2 do begin
        List.Add(Cells[SheetIndex].GetAsFmtString(C1,R));
        Inc(Result);
      end;
    end
    else begin
      for C := C1 to C2 do begin
        List.Add(Cells[SheetIndex].GetAsFmtString(C,R1));
        Inc(Result);
      end;
    end;
  end;
end;

end.
