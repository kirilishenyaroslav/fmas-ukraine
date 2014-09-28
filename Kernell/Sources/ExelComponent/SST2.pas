unit SST2;

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

uses Classes, SysUtils, Windows, BIFFRecsII2, XLSStream2, XLSUtils2, XLSFonts2,
     XLSHashTrie, RTFReadWrite2, Graphics;

{     
type PXLSString = ^TXLSString;
     TXLSString = record
     Index: integer;
     Hash: longword;
     RefCount: integer;
     Len: word;
     Options: byte;
     Data: record end;
     end;
}

type PExtSSTRec = ^TExtSSTRec;
     TExtSSTRec = record
     StreamPos: longword;
     RecPos: word;
     end;

type TExtSST = class(TList)
private
     FBucketSize: integer;

     procedure SetStringCount(const Value: integer);
public
     procedure Clear; override;
     procedure Add(StreamPos: longword; RecPos: word);
     procedure Write(Stream: TXLSStream);

     property BucketSize: integer read FBucketSize;
     property StringCount: integer write SetStringCount;
     end;

type TSST2 = class(TSSTHashTrie)
private
     FSST: TList;
     FExtSST: TExtSST;
     FTotalCount: integer;
     FMaxBufSize: integer;
     FFonts: TXFonts;
     FIsUpdating: boolean;
     FRecPos,FRecSize,FCurrIndex: integer;

     function  GetItemByIndex(Index: integer): WideString;
     function  GetItem(Value: PXLSString): WideString;
     function  GetIsFormatted(Value: PXLSString): boolean;
     function  GetFormatCount(Value: PXLSString): integer;
     function  AddCompressedString(S: string; Fonts: TIndexFontList = Nil): PXLSString;
     function  AddUnicodeString(S: WideString; Fonts: TIndexFontList = Nil): PXLSString;
     function  IsUnicode(S: WideString): boolean;
     function  StreamReadString(Stream: TXLSStream; var RecSize: word): PByteArray;
     function  ReadCONTINUE(Stream: TXLSStream): word;
     function  GetSST(Index: integer): PXLSString;
     function  GetFont(Value: PXLSString; FormatIndex: integer): PFontRun;
     procedure TreeWriteStr(UserData: Pointer; const Value: PXLSString; var Done: Boolean);
protected
     function  GetDataPointer(Value: PXLSString): PByteArray; override;
     function  GetSize(Value: PXLSString): integer; override;
public
     constructor Create(Fonts: TXFonts);
     destructor Destroy; override;
     procedure Clear;
     function  AddString(S: WideString): PXLSString;
     function  AddRichString(S: WideString; Fonts: TIndexFontList): PXLSString;
     function  Delete(Value: PXLSString): boolean;
     procedure Write(Stream: TXLSStream);
     procedure Read(Stream: TXLSStream; RecSize: word; BuildHashTree: boolean);
     function  StrSeek(Stream: TXLSStream; ExtSSTPos,Index: integer): WideString;
     procedure BeginUpdate;
     procedure EndUpdate;
     procedure AfterFileRead;

     property ItemsByIndex[Index: integer]: WideString read GetItemByIndex;
     property Items[Value: PXLSString]: WideString read GetItem; default;
     property MaxBufSize: integer read FMaxBufSize write FMaxBufSize;
     property IsFormatted[Value: PXLSString]: boolean read GetIsFormatted;
     property FormatCount[Value: PXLSString]: integer read GetFormatCount;
     property Font[Value: PXLSString; FormatIndex: integer]: PFontRun read GetFont;
     property SST[Index: integer]: PXLSString read GetSST;
     end;

implementation

const STRID_COMPRESSED      = $00;
const STRID_UNICODE         = $01;
const STRID_RICH            = $08;
const STRID_RICH_UNICODE    = STRID_RICH + STRID_UNICODE;
const STRID_FAREAST         = $04;
const STRID_FAREAST_RICH    = STRID_FAREAST + STRID_RICH;
const STRID_FAREAST_UC      = STRID_FAREAST + STRID_UNICODE;
const STRID_FAREAST_RICH_UC = STRID_FAREAST + STRID_UNICODE + STRID_RICH;

// Compressed
// Declared public above

// Unicode
type PXLSStringUC = ^TXLSStringUC;
     TXLSStringUC = record
     Index: integer;
     RefCount: integer;
     Len: word;
     Options: byte;
     Data: record end;
     end;

// Compressed with formatting
type PXLSStringRich = ^TXLSStringRich;
     TXLSStringRich = record
     Index: integer;
     RefCount: integer;
     Len: word;
     Options: byte;
     FormatCount: word;
     Data: record end;
     end;

// Unicode with formatting
type PXLSStringRichUC = ^TXLSStringRichUC;
     TXLSStringRichUC = record
     Index: integer;
     RefCount: integer;
     Len: word;
     Options: byte;
     FormatCount: word;
     Data: record end;
     end;

// Compressed with Far East data
type PXLSStringFarEast = ^TXLSStringFarEast;
     TXLSStringFarEast = record
     Index: integer;
     RefCount: integer;
     Len: word;
     Options: byte;
     FarEastDataSize: longword;
     Data: record end;
     end;

// Unicode with Far East data
type PXLSStringFarEastUC = ^TXLSStringFarEastUC;
     TXLSStringFarEastUC = record
     Index: integer;
     RefCount: integer;
     Len: word;
     Options: byte;
     FarEastDataSize: longword;
     Data: record end;
     end;

// Compressed with Far East data and formatting
type PXLSStringFarEastRich = ^TXLSStringFarEastRich;
     TXLSStringFarEastRich = record
     Index: integer;
     RefCount: integer;
     Len: word;
     Options: byte;
     FormatCount: word;
     FarEastDataSize: longword;
     Data: record end;
     end;

// Unicode with Far East data and formatting
type PXLSStringFarEastRichUC = ^TXLSStringFarEastRichUC;
     TXLSStringFarEastRichUC = record
     Index: integer;
     RefCount: integer;
     Len: word;
     Options: byte;
     FormatCount: word;
     FarEastDataSize: longword;
     Data: record end;
     end;

type TRecREFormat = packed record
     CharIndex: word;
     case word of
       0: (FontIndex: word);
       1: (FormatCount: word);
     end;

type TRecREFormatArray = array[0..32767] of TRecREFormat;
     PRecREFormatArray = ^TRecREFormatArray;

type PRecUnicodeStr = ^TRecUnicodeStr;
     TRecUnicodeStr = packed record
     CharCount: word;
     Options: byte;
     case integer of
       0: (Data: array[0..MAXINT div 2] of byte);
       1: (FormattingRuns: word);
     end;

{ TSST2 }

function TSST2.AddCompressedString(S: string; Fonts: TIndexFontList = Nil): PXLSString;
var
  i: integer;
begin
  Inc(FTotalCount);
  if (Fonts <> Nil) and (Fonts.Count > 0) then begin
    GetMem(Result,SizeOf(TXLSStringRich) + Length(S) + Fonts.Count * SizeOf(TFontRun));
    Result.Options := STRID_COMPRESSED + STRID_RICH;
    PXLSStringRich(Result).FormatCount := Fonts.Count;
  end
  else begin
    GetMem(Result,SizeOf(TXLSString) + Length(S));
    Result.Options := STRID_COMPRESSED;
  end;
  Result.Index := $FFFF;
  Result.RefCount := 1;
  Result.Len := Length(S);
  Move(Pointer(S)^,GetDataPointer(Result)^,Length(S));
  if (Fonts <> Nil) and (Fonts.Count > 0) then begin
    for i := 0 to Fonts.Count - 1 do begin
      GetFont(Result,i).Index := Fonts[i].Index;
      GetFont(Result,i).Font := FFonts.AddFind(TFont(Fonts[i]));
      GetFont(Result,i).Font.IncUsage;
    end;
  end;
  Result := Add(Result);
end;

function TSST2.AddUnicodeString(S: WideString; Fonts: TIndexFontList = Nil): PXLSString;
var
  i: integer;
begin
  Inc(FTotalCount);
  if (Fonts <> Nil) and (Fonts.Count > 0) then begin
    GetMem(Result,SizeOf(TXLSStringRichUC) + (Length(S) * 2) + Fonts.Count * SizeOf(TFontRun));
    Result.Options := STRID_UNICODE + STRID_RICH;
    PXLSStringRichUC(Result).FormatCount := Fonts.Count;
  end
  else begin
    GetMem(Result,SizeOf(TXLSStringUC) + Length(S) * 2);
    Result.Options := STRID_UNICODE;
  end;
  Result.Index := $FFFF;
  Result.RefCount := 1;
  Result.Len := Length(S);
  Move(Pointer(S)^,GetDataPointer(Result)^,Length(S) * 2);
  if (Fonts <> Nil) and (Fonts.Count > 0) then begin
    for i := 0 to Fonts.Count - 1 do begin
      GetFont(Result,i).Index := Fonts[i].Index;
      GetFont(Result,i).Font := FFonts.AddFind(TFont(Fonts[i]));
      GetFont(Result,i).Font.IncUsage;
    end;
  end;
  Result := Add(Result);
end;

function TSST2.IsUnicode(S: WideString): boolean;
var
  i: integer;
  W: word;
begin
  for i := 1 to Length(S) do begin
    W := Word(S[i]);
    if (W and $FF00) <> 0 then begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

function TSST2.AddString(S: WideString): PXLSString;
begin
  if IsUnicode(S) then
    Result := AddUnicodeString(S)
  else
    Result := AddCompressedString(S);
end;

function TSST2.AddRichString(S: WideString; Fonts: TIndexFontList): PXLSString;
begin
  if IsUnicode(S) then
    Result := AddUnicodeString(S,Fonts)
  else
    Result := AddCompressedString(S,Fonts);
end;

procedure TSST2.Clear;
var
  i: integer;
begin
  FTotalCount := 0;
  for i := 0 to FSST.Count - 1 do
    FreeMem(FSST[i]);
  ClearTree;
  FExtSST.Clear;
  FIsUpdating := False;
end;

constructor TSST2.Create(Fonts: TXFonts);
begin
  FFonts := Fonts;
  FIsUpdating := False;
  FSST := TList.Create;
  FExtSST := TExtSST.Create;
end;

destructor TSST2.Destroy;
begin
  Clear;
  FSST.Free;
  FExtSST.Free;
  inherited;
end;

function TSST2.Delete(Value: PXLSString): boolean;
var
  i: integer;
  pFnt: PFontRun;
begin
  Dec(Value.RefCount);
  Result := Value.RefCount <= 0;
  if Result then begin
    if Value.Options in [STRID_RICH,STRID_RICH_UNICODE,STRID_FAREAST_RICH,STRID_FAREAST_RICH_UC] then begin
      for i := 0 to GetFormatCount(Value) - 1 do begin
        pFnt := GetFont(Value,i);
        if pFnt.Font.Index >= FFonts.DeleteIndex then begin
          pFnt.Font.UsageCount := pFnt.Font.UsageCount - 1;
          if pFnt.Font.UsageCount <= 0 then
            FFonts.Delete(pFnt.Font.Index);
        end;
      end;
    end;
    inherited Delete(Value);
    Dec(FTotalCount);
  end;
end;

function TSST2.GetFont(Value: PXLSString; FormatIndex: integer): PFontRun;
begin
  case Value.Options of
    STRID_RICH:            Result := PFontRun(Integer(@PXLSStringRich(Value).Data) +
                                     PXLSStringRich(Value).Len +
                                     FormatIndex * SizeOf(TFontRun));
    STRID_RICH_UNICODE:    Result := PFontRun(Integer(@PXLSStringRichUC(Value).Data) +
                                     PXLSStringRichUC(Value).Len * 2 +
                                     FormatIndex * SizeOf(TFontRun));
    STRID_FAREAST_RICH:    Result := PFontRun(Integer(@PXLSStringFarEastRich(Value).Data) +
                                     PXLSStringFarEastRich(Value).Len +
                                     FormatIndex * SizeOf(TFontRun));
    STRID_FAREAST_RICH_UC: Result := PFontRun(Integer(@PXLSStringFarEastRichUC(Value).Data) +
                                     PXLSStringFarEastRichUC(Value).Len * 2 +
                                     FormatIndex * SizeOf(TFontRun));
    else
      raise Exception.Create('String is not formatted');
  end;
  if FormatIndex >= PXLSStringRich(Value).FormatCount then
    raise Exception.Create('FormatIndedx out of range');
end;

function TSST2.GetFormatCount(Value: PXLSString): integer;
begin
  if (Value.Options and $08) = $08 then
    Result := PXLSStringRich(Value).FormatCount
  else
    Result := 0;
end;

function TSST2.GetIsFormatted(Value: PXLSString): boolean;
begin
  Result := (Value.Options and $08) = $08;
end;

function TSST2.GetDataPointer(Value: PXLSString): PByteArray;
begin
  case Value.Options of
    STRID_COMPRESSED     : Result := @PXLSString(Value).Data;
    STRID_UNICODE        : Result := @PXLSStringUC(Value).Data;
    STRID_RICH           : Result := @PXLSStringRich(Value).Data;
    STRID_RICH_UNICODE   : Result := @PXLSStringRichUC(Value).Data;
    STRID_FAREAST        : Result := @PXLSStringFarEast(Value).Data;
    STRID_FAREAST_UC     : Result := @PXLSStringFarEastUC(Value).Data;
    STRID_FAREAST_RICH   : Result := @PXLSStringFarEastRich(Value).Data;
    STRID_FAREAST_RICH_UC: Result := @PXLSStringFarEastRichUC(Value).Data;
    else
      raise Exception.Create('STT: Unhandled string type.');
  end;
end;

function TSST2.GetItemByIndex(Index: integer): WideString;
begin
  if (Index < 0) or (Index >= FSST.Count) then begin
    Result := '';
    Exit;
  end;
  Result := GetItem(FSST[Index]);
end;

function TSST2.GetItem(Value: PXLSString): WideString;
var
  i: integer;
  P: PByteArray;
begin
  P := GetDataPointer(Value);
  SetLength(Result,Value.Len);
  if (Value.Options and $01) = $01 then
    Move(P^,Pointer(Result)^,Value.Len * 2)
  else begin
    for i := 1 to Value.Len do
      Result[i] := WideChar(P[i - 1]);
  end;
end;

function TSST2.ReadCONTINUE(Stream: TXLSStream): word;
var
  Header: TBIFFHeader;
begin
  Stream.ReadHeader(Header);
  if Header.RecID <> BIFFRECID_CONTINUE then
    raise Exception.Create('CONTINUE record is missing in SST');
  Result := Header.Length;
end;


procedure TSST2.Read(Stream: TXLSStream; RecSize: word; BuildHashTree: boolean);
var
  i: integer;
  Count: longword;
begin
  Dec(RecSize,Stream.Read(FTotalCount,4));
  Dec(RecSize,Stream.Read(Count,4));
  for i := 1 to Count do begin
    if RecSize = 0 then
      RecSize := ReadCONTINUE(Stream);
    FSST.Add(StreamReadString(Stream,RecSize));
    // Add may replace the string with an existing one.
    FSST[i - 1] := Add(PXLSString(FSST[i - 1]));
  end;
end;

function TSST2.StreamReadString(Stream: TXLSStream; var RecSize: word): PByteArray;
var
  Len,FmtCount: word;
  Options: byte;
  MemLen,StrMemLen: word;
  FarEastDataSize: longword;

procedure ReadSplittedString(P: PByteArray; Len: word; Unicode: boolean);
type
  PStrPart = ^TStrPart;
  TStrPart = record
  Unicode: byte;
  Len: word;
  PStr: PByteArray;
  end;
var
  i,j: integer;
  Parts: TList;
  SPart: PStrPart;

procedure ReadPart(Opt: byte);
var
  BytesToRead: integer;
begin
  if Opt = $FF then
    Dec(RecSize,Stream.Read(Opt,1));
  if Opt = $01 then begin
    BytesToRead := Len * 2;
    Options := Options or $01;
  end
  else
    BytesToRead := Len;
  if BytesToRead > RecSize then
    BytesToRead := RecSize;
  New(SPart);
  SPart.Unicode := Opt;
  GetMem(SPart.PStr,BytesToRead);
  Dec(RecSize,Stream.Read(SPart.PStr^,BytesToRead));
  if Opt = $01 then
    SPart.Len := BytesToRead div 2
  else
    SPart.Len := BytesToRead;
  Dec(Len,SPart.Len);
  Parts.Add(SPart);
end;

begin
  Parts := TList.Create;
  try
    ReadPart(Byte(Unicode));
    while Len > 0 do begin
      RecSize := ReadCONTINUE(Stream);
      ReadPart($FF);
    end;
    for i := 0 to Parts.Count - 1 do begin
      if (Options and $01) = $01 then begin
        if (PStrPart(Parts[i]).Unicode and $01) = $01 then
          Move(PStrPart(Parts[i]).PStr^,P^,PStrPart(Parts[i]).Len * 2)
        else begin
          for j := 0 to PStrPart(Parts[i]).Len - 1 do
            PWordArray(P)[j] := PStrPart(Parts[i]).PStr[j];
        end;
        P := PByteArray(Integer(P) + PStrPart(Parts[i]).Len * 2);
      end
      else begin
        if (PStrPart(Parts[i]).Unicode and $01) = $01 then
          raise Exception.Create('SST split error: unicode part in compressed string.');
        Move(PStrPart(Parts[i]).PStr^,P^,PStrPart(Parts[i]).Len);
        P := PByteArray(Integer(P) + PStrPart(Parts[i]).Len);
      end;
      FreeMem(PStrPart(Parts[i]).PStr);
      FreeMem(PStrPart(Parts[i]));
    end;
  finally
    Parts.Free;
  end;
end;

procedure ReadString(P: PByteArray; Len: word; Unicode: boolean);
begin
  if MemLen > RecSize then
    ReadSplittedString(P,Len,Unicode)
  else
    Dec(RecSize,Stream.Read(P^,MemLen));
end;

procedure ReadData(P: PByteArray; Len: word);
begin
  if Len > RecSize then begin
    Stream.Read(P^,RecSize);
    Dec(Len,RecSize);
    P := PByteArray(Integer(P) + RecSize);
    RecSize := ReadCONTINUE(Stream);
    ReadData(P,Len);
  end
  else
    Dec(RecSize,Stream.Read(P^,Len));
end;

procedure ConvertFormatRunsToFonts(P: PByteArray; Count: integer);
var
  i: integer;
  pFmt: PFormatRun;
  pFnt: PFontRun;
begin
  if FFonts = Nil then
    Exit;
  // Work backwards trough the memory, as TFontRun always is bigger than
  // TFormatRun.
  for i := Count - 1 downto 0 do begin
    pFmt := PFormatRun(Integer(P) + (i * SizeOf(TFormatRun)));
    pFnt := PFontRun(Integer(P) + (i * SizeOf(TFontRun)));
    pFnt.Font := FFonts[pFmt.FontIndex];
    pFnt.Index := pFmt.Index;
    pFnt.Font.UsageCount := pFnt.Font.UsageCount + 1;
  end;
end;

procedure CheckIfSplittedString;
var
  L: integer;
  AdjOptions: byte;
begin
  L := 0;
  case Options of
    STRID_COMPRESSED,
    STRID_UNICODE:
      L := 0;
    STRID_RICH,
    STRID_RICH_UNICODE:
      L := 2;
    STRID_FAREAST,
    STRID_FAREAST_UC:
      L := 4;
    STRID_FAREAST_RICH,
    STRID_FAREAST_RICH_UC:
      L := 5;
  end;
  if (Options and STRID_UNICODE) = STRID_UNICODE then
    Inc(L,Len * 2)
  else
    Inc(L,Len);
  if L > RecSize then
    AdjOptions := Options or $01
  else
    AdjOptions := Options;
  if (AdjOptions and $01) = $01 then
    MemLen := Len * 2
  else
    MemLen := Len;
end;

begin
//  Result := Nil;
  Dec(RecSize,Stream.Read(Len,2));
  Dec(RecSize,Stream.Read(Options,1));
  CheckIfSplittedString;
{  
  if (Options and $01) = $01 then
    StrMemLen := Len * 2
  else
    StrMemLen := Len;
}

  StrMemLen := MemLen;

  case Options of
    STRID_COMPRESSED: begin
      GetMem(Result,SizeOf(TXLSString) + MemLen);
      ReadString(PByteArray(@PXLSString(Result).Data),Len,False);
    end;
    STRID_UNICODE: begin
      GetMem(Result,SizeOf(TXLSStringUC) + MemLen);
      ReadString(@PXLSStringUC(Result).Data,Len,True);
    end;
    STRID_RICH: begin
      Dec(RecSize,Stream.Read(FmtCount,2));
      GetMem(Result,SizeOf(TXLSStringRich) + MemLen + FmtCount * SizeOf(TFontRun));
      ReadString(PByteArray(@PXLSStringRich(Result).Data),Len,False);
      ReadData(Pointer(Integer(@PXLSStringRich(Result).Data) + StrMemLen),FmtCount * SizeOf(TFormatRun));
      ConvertFormatRunsToFonts(Pointer(Integer(@PXLSStringRich(Result).Data) + StrMemLen),FmtCount);
      PXLSStringRich(Result).FormatCount := FmtCount;
    end;
    STRID_RICH_UNICODE: begin
      Dec(RecSize,Stream.Read(FmtCount,2));
      GetMem(Result,SizeOf(TXLSStringRichUC) + MemLen + FmtCount * SizeOf(TFontRun));
      ReadString(@PXLSStringRichUC(Result).Data,Len,True);
      ReadData(Pointer(Integer(@PXLSStringRichUC(Result).Data) + StrMemLen),FmtCount * SizeOf(TFormatRun));
      ConvertFormatRunsToFonts(Pointer(Integer(@PXLSStringRichUC(Result).Data) + StrMemLen),FmtCount);
      PXLSStringRich(Result).FormatCount := FmtCount;
    end;
    STRID_FAREAST: begin
      Dec(RecSize,Stream.Read(FarEastDataSize,4));
      GetMem(Result,SizeOf(TXLSStringFarEast) + MemLen + FarEastDataSize);
      ReadString(@PXLSStringFarEast(Result).Data,Len,False);
      ReadData(Pointer(Integer(@PXLSStringFarEast(Result).Data) + StrMemLen),FarEastDataSize);
      PXLSStringFarEast(Result).FarEastDataSize := FarEastDataSize;
    end;
    STRID_FAREAST_UC: begin
      Dec(RecSize,Stream.Read(FarEastDataSize,4));
      GetMem(Result,SizeOf(TXLSStringFarEastUC) + MemLen + FarEastDataSize);
      ReadString(@PXLSStringFarEastUC(Result).Data,Len,True);
      ReadData(Pointer(Integer(@PXLSStringFarEastUC(Result).Data) + StrMemLen),FarEastDataSize);
      PXLSStringFarEastUC(Result).FarEastDataSize := FarEastDataSize;
    end;
    STRID_FAREAST_RICH: begin
      Dec(RecSize,Stream.Read(FmtCount,2));
      Dec(RecSize,Stream.Read(FarEastDataSize,4));
      GetMem(Result,SizeOf(TXLSStringFarEastRich) + MemLen + FmtCount * SizeOf(TFontRun) + FarEastDataSize);
      ReadString(@PXLSStringFarEastRich(Result).Data,Len,True);
      ReadData(Pointer(Integer(@PXLSStringFarEastRich(Result).Data) + StrMemLen),FmtCount * SizeOf(TFormatRun));
      ConvertFormatRunsToFonts(Pointer(Integer(@PXLSStringFarEastRich(Result).Data) + StrMemLen),FmtCount);
      ReadData(Pointer(Integer(@PXLSStringFarEastRich(Result).Data) + StrMemLen + FmtCount * SizeOf(TFontRun)),FarEastDataSize);
      PXLSStringFarEastRich(Result).FormatCount := FmtCount;
      PXLSStringFarEastRich(Result).FarEastDataSize := FarEastDataSize;
    end;
    STRID_FAREAST_RICH_UC: begin
      Dec(RecSize,Stream.Read(FmtCount,2));
      Dec(RecSize,Stream.Read(FarEastDataSize,4));
      GetMem(Result,SizeOf(TXLSStringFarEastRichUC) + MemLen + FmtCount * SizeOf(TFontRun) + FarEastDataSize);
      ReadString(@PXLSStringFarEastRichUC(Result).Data,Len,True);
      ReadData(Pointer(Integer(@PXLSStringFarEastRichUC(Result).Data) + StrMemLen),FmtCount * SizeOf(TFormatRun));
      ConvertFormatRunsToFonts(Pointer(Integer(@PXLSStringFarEastRichUC(Result).Data) + StrMemLen),FmtCount);
      ReadData(Pointer(Integer(@PXLSStringFarEastRichUC(Result).Data) + StrMemLen + FmtCount * SizeOf(TFontRun)),FarEastDataSize);
      PXLSStringFarEastRichUC(Result).FormatCount := FmtCount;
      PXLSStringFarEastRichUC(Result).FarEastDataSize := FarEastDataSize;
    end;
    else
      raise Exception.CreateFmt('STT: Unhandled string type in Read (%.2X)',[Options]);
  end;
  PXLSString(Result).Index := FSST.Count;
  PXLSString(Result).Len := Len;
  // RefCount is increased when the cell is read.
  PXLSString(Result).RefCount := 0;
  PXLSString(Result).Options := Options;
end;

procedure TSST2.Write(Stream: TXLSStream);
var
  W: word;
  SSTRecPos: integer;

begin
  // FFonts can be Nil if SST only is used by external seek, and only string
  // values are read (and are used).
  if FFonts = Nil then
    raise Exception.Create('Can not write SST when FFonts = Nil');

  FCurrIndex := 0;
  
  FExtSST.StringCount := Count;

  FRecSize := FMaxBufSize;
  Stream.WriteHeader(BIFFRECID_SST,0);
  FRecPos := Stream.Pos - 2;
  SSTRecPos := Stream.Pos;
  Dec(FRecSize,Stream.Write(FTotalCount,4));
  // Is replaced later.
  Dec(FRecSize,Stream.Write(FTotalCount,4));

  FCurrIndex := 0;
  Traverse(Pointer(Stream),TreeWriteStr);

  Stream.Seek(FRecPos,soFromBeginning);
  W := FMaxBufSize - FRecSize;
  Stream.Write(W,2);

  Stream.Seek(SSTRecPos + 4,soFromBeginning);
  Stream.Write(FCurrIndex,4);

  Stream.Seek(0,soFromEnd);
  FExtSST.Write(Stream);
  FExtSST.Clear;
end;

function TSST2.StrSeek(Stream: TXLSStream; ExtSSTPos,Index: integer): WideString;
var
  i,j: integer;
  Header: TBIFFHeader;
  Rec: TRecEXTSST;
  Bucket: TRecISSTINF;
  BucketPos,BucketOffs: integer;
  RecSize: word;
  P,pData: PByteArray;
begin
  pData := Nil;
  Stream.Seek(ExtSSTPos,soFromBeginning);
  Stream.ReadHeader(Header);
  if Header.RecID <> BIFFRECID_EXTSST then
    raise Exception.Create('Expected record missing: EXTSST');
  Stream.Read(Rec,SizeOf(TRecEXTSST));
  BucketPos := (Index div Rec.BucketSize) * SizeOf(TRecISSTINF);
  BucketOffs := Index mod Rec.BucketSize;
  Stream.Seek(BucketPos,soFromCurrent);
  Stream.Read(Bucket,SizeOf(TRecISSTINF));

  Stream.Seek(Bucket.Pos - Bucket.Offset,soFromBeginning);
  Stream.ReadHeader(Header);
  if (Header.RecId <> BIFFRECID_SST) and (Header.RecId <> BIFFRECID_CONTINUE) then
    raise Exception.Create('Expected record missing: SST or CONTINUE');
  RecSize := Header.Length - Bucket.Offset + 4;
  Stream.Seek(Bucket.Pos,soFromBeginning);
  P := Nil;
  try
    for i := 0 to BucketOffs do begin
      P := StreamReadString(Stream,RecSize);
      case PXLSString(P).Options of
        STRID_COMPRESSED     : pData := @PXLSString(P).Data;
        STRID_UNICODE        : pData := @PXLSStringUC(P).Data;
        STRID_RICH           : pData := @PXLSStringRich(P).Data;
        STRID_RICH_UNICODE   : pData := @PXLSStringRichUC(P).Data;
        STRID_FAREAST        : pData := @PXLSStringFarEast(P).Data;
        STRID_FAREAST_UC     : pData := @PXLSStringFarEastUC(P).Data;
        STRID_FAREAST_RICH   : pData := @PXLSStringFarEastRich(P).Data;
        STRID_FAREAST_RICH_UC: pData := @PXLSStringFarEastRichUC(P).Data;
        else
          raise Exception.Create('STT: Unhandled string type.');
      end;
      SetLength(Result,PXLSString(P).Len);
      if (PXLSString(P).Options and $01) = $01 then
        Move(pData^,Pointer(Result)^,PXLSString(P).Len * 2)
      else begin
        for j := 1 to PXLSString(P).Len do
          Result[j] := WideChar(pData[j - 1]);
      end;
    end;
  finally
    FreeMem(P);
  end;
end;

function TSST2.GetSST(Index: integer): PXLSString;
begin
  Result := FSST[Index];
end;

procedure TSST2.BeginUpdate;
begin
  FIsUpdating := True;
end;

procedure TSST2.EndUpdate;
begin
  FIsUpdating := False;
end;

function TSST2.GetSize(Value: PXLSString): integer;
begin
  case Value.Options of
    STRID_COMPRESSED:
      Result := Value.Len;
    STRID_UNICODE:
      Result := Value.Len * 2;
    STRID_RICH:
      Result := Value.Len
{$ifndef NETTEST}
      + PXLSStringRich(Value).FormatCount * SizeOf(TFormatRun)
{$endif}
      ;
    STRID_RICH_UNICODE:
      Result := Value.Len * 2
{$ifndef NETTEST}
      + PXLSStringRich(Value).FormatCount * SizeOf(TFormatRun)
{$endif}
      ;
    STRID_FAREAST:
      Result := Value.Len + PXLSStringFarEast(Value).FarEastDataSize;
    STRID_FAREAST_RICH:
      Result := Value.Len + PXLSStringFarEastRich(Value).FormatCount * SizeOf(TFormatRun) + PXLSStringFarEastRich(Value).FarEastDataSize;
    STRID_FAREAST_UC:
      Result := Value.Len * 2 + PXLSStringFarEast(Value).FarEastDataSize;
    STRID_FAREAST_RICH_UC:
      Result := Value.Len * 2 + PXLSStringFarEastRichUC(Value).FormatCount * SizeOf(TFormatRun) + PXLSStringFarEastRichUC(Value).FarEastDataSize;
    else
      raise Exception.Create('Unknown SST string type.');
  end;
end;

procedure TSST2.TreeWriteStr(UserData: Pointer; const Value: PXLSString; var Done: Boolean);
var

  Stream: TXLSStream;

procedure WriteCONTINUE;
var
  W: word;
begin
  Stream.Seek(FRecPos,soFromBeginning);
  W := FMaxBufSize - FRecSize;
  Stream.Write(W,2);
  Stream.Seek(0,soFromEnd);
  Stream.WriteHeader(BIFFRECID_CONTINUE,0);
  FRecPos := Stream.Pos - 2;
  FRecSize := FMaxBufSize;
end;

procedure WriteString(P: PByteArray; Len: word; IsUnicode: boolean);
var
  Options: byte;
  IsSplittedChar: boolean;
begin
  if Len > FRecSize then begin
    // Do not split unicode characters
    IsSplittedChar := IsUnicode and Odd(Len - FRecSize);
    if IsSplittedChar then
      Dec(FRecSize);
    Stream.Write(P^,FRecSize);
    Dec(Len,FRecSize);
    P := PByteArray(Integer(P) + FRecSize);
    if IsSplittedChar then
      FRecSize := 1
    else
      FRecSize := 0;
    WriteCONTINUE;
    if IsUnicode then
      Options := $01
    else
      Options := $00;
    Dec(FRecSize,Stream.Write(Options,1));
    WriteString(P,Len,IsUnicode);
  end
  else
    Dec(FRecSize,Stream.Write(P^,Len));
end;

procedure WriteData(P: PByteArray; Len: word);
begin
  if Len > FRecSize then begin
    Stream.Write(P^,FRecSize);
    Dec(Len,FRecSize);
    P := PByteArray(Integer(P) + FRecSize);
    FRecSize := 0;
    WriteCONTINUE;
    WriteData(P,Len);
  end
  else
    Dec(FRecSize,Stream.Write(P^,Len));
end;

procedure WriteRichData(P: PByteArray; Count: integer);
var
  i: integer;
  pFnt: PFontRun;
begin
  for i := 0 to Count - 1 do begin
    if FRecSize < SizeOf(TFormatRun) then begin
      WriteCONTINUE;
    end;
    pFnt := PFontRun(Integer(P) + (i * SizeOf(TFontRun)));
    Dec(FRecSize,Stream.Write(pFnt.Index,2));
    Dec(FRecSize,Stream.Write(pFnt.Font.Index,2));
  end;
end;

begin
  Stream := TXLSStream(UserData);
  if (FCurrIndex mod FExtSST.BucketSize) = 0 then
    FExtSST.Add(Stream.Pos,Stream.Pos - FRecPos + SizeOf(TBIFFHeader) - 2);

  Value.Index := FCurrIndex;

  // Don't split string headers over CONTINUE records
  if FRecSize <= 15 then
    WriteCONTINUE;
  Dec(FRecSize,Stream.Write(Value.Len,2));
  Dec(FRecSize,Stream.Write(Value.Options,1));
  case Value.Options of
    STRID_COMPRESSED: begin
      with Value^ do
        WriteString(PByteArray(@Data),Len,False);
    end;
    STRID_UNICODE: begin
      with Value^ do
        WriteString(PByteArray(@Data),Len * 2,True);
    end;
    STRID_RICH: begin
      with PXLSStringRich(Value)^ do begin
        Dec(FRecSize,Stream.Write(FormatCount,2));
        WriteString(PByteArray(@Data),Len,False);
        WriteRichData(Pointer(Integer(@Data) + Len),FormatCount);
      end;
    end;
    STRID_RICH_UNICODE: begin
      with PXLSStringRichUC(Value)^ do begin
        Dec(FRecSize,Stream.Write(FormatCount,2));
        WriteString(PByteArray(@Data),Len * 2,False);
        WriteRichData(Pointer(Integer(@Data) + Len * 2),FormatCount);
      end;
    end;
    STRID_FAREAST: begin
      with PXLSStringFarEast(Value)^ do begin
        Dec(FRecSize,Stream.Write(FarEastDataSize,4));
        WriteString(PByteArray(@Data),Len,False);
        WriteData(Pointer(Integer(@Data) + Len),FarEastDataSize);
      end;
    end;
    STRID_FAREAST_RICH: begin
      with PXLSStringFarEastRich(Value)^ do begin
        Dec(FRecSize,Stream.Write(FormatCount,2));
        Dec(FRecSize,Stream.Write(FarEastDataSize,4));
        WriteString(PByteArray(@Data),Len,False);
        WriteRichData(Pointer(Integer(@Data) + Len),FormatCount);
        WriteData(Pointer(Integer(@Data) + Len + FormatCount * SizeOf(TFontRun)),FarEastDataSize);
      end;
    end;
    STRID_FAREAST_UC: begin
      with PXLSStringFarEastUC(Value)^ do begin
        Dec(FRecSize,Stream.Write(FarEastDataSize,4));
        WriteString(PByteArray(@Data),Len * 2,False);
        WriteData(Pointer(Integer(@Data) + Len * 2),FarEastDataSize);
      end;
    end;
    STRID_FAREAST_RICH_UC: begin
      with PXLSStringFarEastRichUC(Value)^ do begin
        Dec(FRecSize,Stream.Write(FormatCount,2));
        Dec(FRecSize,Stream.Write(FarEastDataSize,4));
        WriteString(PByteArray(@Data),Len * 2,False);
        WriteRichData(Pointer(Integer(@Data) + Len * 2),FormatCount);
        WriteData(Pointer(Integer(@Data) + Len * 2 + FormatCount * SizeOf(TFontRun)),FarEastDataSize);
      end;
    end;
    else
      raise Exception.CreateFmt('STT: Unhandled string type in Write (%.2X) # %d',[Value.Options,FCurrIndex]);
  end;
  Inc(FCurrIndex);
end;

procedure TSST2.AfterFileRead;
begin
  FSST.Clear;
end;

{ TExtSST }

procedure TExtSST.Add(StreamPos: longword; RecPos: word);
var
  P: PExtSSTRec;
begin
  New(P);
  P.StreamPos := StreamPos;
  P.RecPos := RecPos;
  inherited Add(P);
end;

procedure TExtSST.Clear;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    FreeMem(Items[i]);
  inherited;
end;

procedure TExtSST.SetStringCount(const Value: integer);
var
  MaxBuckets: integer;
begin
  MaxBuckets := (MAXRECSZ_97 - SizeOf(TRecEXTSST)) div SizeOf(TRecISSTINF);
  FBucketSize := (Value div MaxBuckets) + 1;
  if FBucketSize < 8 then
    FBucketSize := 8;
end;

procedure TExtSST.Write(Stream: TXLSStream);
var
  i: integer;
  Rec: TRecISSTINF;
begin
  Stream.WriteHeader(BIFFRECID_EXTSST,SizeOf(TRecEXTSST) + Count * SizeOf(TRecISSTINF));
  Stream.WWord(FBucketSize);
  for i := 0 to Count - 1 do begin
    Rec.Pos := PExtSSTRec(Items[i]).StreamPos;
    Rec.Offset := PExtSSTRec(Items[i]).RecPos;
    Rec.Reserved := 0;
    Stream.Write(Rec,SizeOf(TRecISSTINF));
  end;
end;

end.
