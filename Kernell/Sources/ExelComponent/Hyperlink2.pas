unit Hyperlink2;

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

uses Classes, SysUtils, Contnrs, BIFFRecsII2, XLSStream2, XLSUtils2,
     Windows, FormulaHandler2;

type THyperlinkType = (hltUnknown, hltURL, hltFile, hltUNC, hltWorkbook);
type THyperlinkEncoding = (hleUnknown, hleURL, hleFile, hleUNC, hleWorkbook);

type
//* Object for handling hyperlinks (clickable texts) in cells. A THyperlink
//* only determins what shall happends when the text is clicked, it don't
//* have any settings for how the text in the cell is displayed. If you want
//* to have the text in classic hyperlink look, blue and underlined, it has
//* to be formmated in that way.
  THyperlink = class(TCollectionItem)
private
     FHyperlinkType: THyperlinkType;
     FHyperlinkEncoding: THyperlinkEncoding;
     FCol1,FCol2: word;
     FRow1,FRow2: word;
     FOptions: longword;
     FDescription: WideString;
     FTargetFrame: WideString;
     FAddress: WideString;
     FScreenTip: WideString;
     FToolTip: WideString;
     FBuf: PByteArray;
     FBufLen: integer;
     FChanged: boolean;
     procedure SetAddress(const Value: WideString);
     procedure SetDescription(const Value: WideString);
     procedure SetToolTip(const Value: WideString);
protected
     procedure StoreUnknown(Len: integer; PBuf: PByteArray);
public
     //* ~exclude
     constructor Create(Collection: TCollection); override;
     //* ~exclude
     destructor Destroy; override;
     //* ~exclude
     procedure Assign(Source: TPersistent); override;
published
     //* First column for the hyperlink area.
     property Col1: word read FCol1 write FCol1;
     //* Last column for the hyperlink area.
     property Col2: word read FCol2 write FCol2;
     //* Top row for the hyperlink area.
     property Row1: word read FRow1 write FRow1;
     //* Bottom row the hyperlink area.
     property Row2: word read FRow2 write FRow2;
     //* The hyperlink address, i.e. where the user is taken when the text is
     //* clicked.
     //* What kind of of hyperlink address that is used is determined according
     //* to the following rules:~[br]
     //* URL> (internet address) - If the text starts with any of the following
     //* strings: http://, https://, www., ftp://, mailto: ~[br]
     //* UNC (network address, such as \\server\path\file.txt) - If the text
     //* starts with a double backslash.~[br]
     //* Workbook - If the text can be parsed as a cell reference, such as:
     //* Sheet3!D8~[br]
     //* A local file - If none of the above matches the text, it is considered
     //* to be a local file.~[br]
     property Address: WideString read FAddress write SetAddress;
     //* Text that is shown instead of the real address.
     property Description: WideString read FDescription write SetDescription;
     //* Optional tooltip (hint) that is shown when the user holds the mouse
     //* pointer above the text.
     property ToolTip: WideString read FToolTip write SetToolTip;
     //* The type of the hyperlink.
     property HyperlinkType: THyperlinkType read FHyperlinkType;
     end;

type
//* List with THyperlink objects.
     THyperlinks =  class(TCollection)
private
     FOwner: TPersistent;
     FFormulaHandler: TFormulaHandler;

     function GetItems(Index: integer): THyperlink;
protected
     function GetOwner: TPersistent; override;
public
     //* ~exclude
     constructor Create(AOwner: TPersistent; FormulaHandler: TFormulaHandler);
     //* Add a new THyperlink.
     //* ~result The new THyperlink object.
     function  Add: THyperlink; overload;
     //* Searches the list for a hyperlink at position Col,Row. If found, the
     //* index in the list for the hyperlink is returned. Otherwise -1 is returned.
     //* ~param Col The column of the cell to search for.
     //* ~param Row The row of the cell to search for.
     //* ~result Index of the THyperlink object. If not found, -1 is returned.
     function  Find(Col,Row: integer): integer;
     //* ~exclude
     procedure LoadFromStream(Stream: TXLSStream; Len: integer; PBuf: PByteArray);
     //* ~exclude
     procedure SaveToStream(Stream: TXLSStream; PBuf: PByteArray);

     //* The items in the list.
     property Items[Index: integer]: THyperlink read GetItems; default;
     end;

implementation

const
  GUID_STDLINK: array[0..15] of byte = ($D0,$C9,$EA,$79,$F9,$BA,$CE,$11,$8C,$82,$00,$AA,$00,$4B,$A9,$0B);
  GUID_URL:     array[0..15] of byte = ($E0,$C9,$EA,$79,$F9,$BA,$CE,$11,$8C,$82,$00,$AA,$00,$4B,$A9,$0B);
  GUID_FILE:    array[0..15] of byte = ($03,$03,$00,$00,$00,$00,$00,$00,$C0,$00,$00,$00,$00,$00,$00,$46);

{ THyperlinks }

function THyperlinks.Add: THyperlink;
begin
  Result := THyperlink(inherited Add);
end;

constructor THyperlinks.Create(AOwner: TPersistent; FormulaHandler: TFormulaHandler);
begin
  inherited Create(THyperlink);
  FFormulaHandler := FormulaHandler;
  FOwner := AOwner;
end;

function THyperlinks.Find(Col, Row: integer): integer;
begin
  for Result := 0 to Count - 1 do begin
    if (Items[Result].FCol1 >= Col) and (Items[Result].FRow1 >= Row) and
       (Items[Result].FCol2 <= Col) and (Items[Result].FRow2 <= Row) then
      Exit;
  end;
  Result := -1;
end;

function THyperlinks.GetItems(Index: integer): THyperlink;
begin
  Result := THyperlink(inherited Items[Index]);
end;

function THyperlinks.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure THyperlinks.LoadFromStream(Stream: TXLSStream; Len: integer; PBuf: PByteArray);
var
  P,P2: PByteArray;
  S: string;
  WS: WideString;
  HLink: THyperlink;
  Header: TBIFFHeader;
  DirUpCnt: word;
begin
  HLink := Add;

  HLink.FCol1 := PRecHLINK(PBuf).Col1;
  HLink.FCol2 := PRecHLINK(PBuf).Col2;
  HLink.FRow1 := PRecHLINK(PBuf).Row1;
  HLink.FRow2 := PRecHLINK(PBuf).Row2;
  HLink.FOptions := PRecHLINK(PBuf).Options;

  if ((HLink.FOptions and $0160) = 0) and ((HLink.FOptions and $0003) = $0003) then
    HLink.FHyperlinkType := hltURL
  else if ((HLink.FOptions and $0160) = 0) and ((HLink.FOptions and $0001) = $0001) then
    HLink.FHyperlinkType := hltFile
  else if ((HLink.FOptions and $0060) = 0) and ((HLink.FOptions and $0103) = $0103) then
    HLink.FHyperlinkType := hltUNC
  else if (HLink.FOptions and $0008) = $0008 then
    HLink.FHyperlinkType := hltWorkbook
  else begin
    HLink.FHyperlinkType := hltUnknown;
    HLink.StoreUnknown(Len,PBuf);
    Exit;
  end;

  HLink.FHyperlinkEncoding := THyperlinkEncoding(HLink.FHyperlinkType);

  P := PByteArray(Integer(PBuf) + SizeOf(TRecHLINK));
  if (HLink.FOptions and $0014) = $0014 then begin
    HLink.FDescription := BufUnicodeZToWS(@P[4],PLongwordArray(P)[0] * 2);
    P := PByteArray(Longword(P) + 4 + PLongwordArray(P)[0] * 2);
  end;
  if (HLink.FOptions and $0080) = $0080 then begin
    HLink.FTargetFrame := BufUnicodeZToWS(@P[4],PLongwordArray(P)[0] * 2);
    P := PByteArray(Longword(P) + 4 + PLongwordArray(P)[0] * 2);
  end;

  if HLink.FHyperlinkType in [hltURL,hltFile] then begin
    if CompareMem(P,@GUID_URL,SizeOf(GUID_URL)) then
      HLink.FHyperlinkEncoding := hleURL
    else if CompareMem(P,@GUID_FILE,SizeOf(GUID_FILE)) then
      HLink.FHyperlinkEncoding := hleFile;
  end;

  case HLink.FHyperlinkEncoding of
    hleUnknown: begin
    end;
    hleURL: begin
      P := PByteArray(Integer(P) + 16);
      HLink.FAddress := BufUnicodeZToWS(@P[4],PLongwordArray(P)[0]);
      P := PByteArray(Longword(P) + 4 + PLongwordArray(P)[0]);
    end;
    hleFile: begin
      P := PByteArray(Integer(P) + 16);
      DirUpCnt := PWordArray(P)[0];
      P := PByteArray(Integer(P) + 2);
      SetLength(S,PLongwordArray(P)[0] - 1);
      P := PByteArray(Integer(P) + 4);
      Move(P^,Pointer(S)^,Length(S));
      P := PByteArray(Integer(P) + Length(S) + 1 + 24);
      if PLongwordArray(P)[0] > 0 then begin
        P2 := PByteArray(Integer(P) + 4);
        SetLength(WS,PLongwordArray(P2)[0] div 2);
        Move(P2[6],Pointer(WS)^,PLongwordArray(P2)[0]);
        HLink.FAddress := WS;
      end
      else
        HLink.FAddress := S;
      while DirUpCnt > 0 do begin
        HLink.FAddress := HLink.FAddress + '..\';
        Dec(DirUpCnt);
      end;
      P := PByteArray(Longword(P) + PLongwordArray(P)[0]);
    end;
    hleUNC: begin
      HLink.FAddress := BufUnicodeZToWS(@P[4],PLongwordArray(P)[0] * 2);
      P := PByteArray(Longword(P) + 4 + PLongwordArray(P)[0] * 2);
    end;
    hleWorkbook: begin

    end;
  end;
  if (HLink.FOptions and $0008) = $0008 then begin
    HLink.FScreenTip := BufUnicodeZToWS(@P[4],PLongwordArray(P)[0] * 2);
    if HLink.FHyperlinkEncoding = hleWorkbook then
      HLink.FAddress := HLink.FScreenTip;
  end;

  // Assume that the HLINKTOOLTIP belongs to the hyperlink.
  if Stream.PeekHeader = BIFFRECID_HLINKTOOLTIP then begin
    Stream.ReadHeader(Header);
    Stream.Read(PBuf^,Header.Length);
    HLink.FToolTip := BufUnicodeZToWS(@PRecHLINKTOOLTIP(PBuf).Text,Header.Length - SizeOf(TRecHLINKTOOLTIP));
  end;
end;

procedure THyperlinks.SaveToStream(Stream: TXLSStream; PBuf: PByteArray);
const
  UnSequence: array[0..23] of byte = ($FF,$FF,$AD,$DE,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00);
var
  i,Sz: integer;
  DirUpCnt: word;
  S,Dos8_3: string;

function ZUCLen(WS: WideString): integer;
begin
  if WS <> '' then
    Result := Length(WS) * 2 + 2
  else
    Result := 0;
end;

procedure WriteUSZLen(WS: WideString; CharLen: boolean = True);
var
  L: longword;
  Z: word;
begin
  Z := 0;
  if CharLen then
    L := Length(WS) + 1
  else
    L := Length(WS) * 2 + 2;
  Stream.Write(L,4);
  Stream.Write(Pointer(WS)^,Length(WS) * 2);
  Stream.WWord(Z);
end;

begin
  for i := 0 to Count - 1 do begin
    if Items[i].FHyperlinkType = hltUnknown then begin
      Stream.WriteHeader(BIFFRECID_HLINK,Items[i].FBufLen);
      Stream.Write(Items[i].FBuf^,Items[i].FBufLen);
      Continue;
    end;

    if Items[i].FChanged then begin
      case Items[i].FHyperlinkEncoding of
        hleURL: begin
          Items[i].FOptions := Items[i].FOptions and not $0160;
          Items[i].FOptions := Items[i].FOptions or $0003;
        end;
        hleFile: begin
          Items[i].FOptions := Items[i].FOptions and not $0160;
          Items[i].FOptions := Items[i].FOptions or $0001;
        end;
        hleUNC: begin
          Items[i].FOptions := Items[i].FOptions and not $0060;
          Items[i].FOptions := Items[i].FOptions or $0103;
        end;
        hleWorkbook: begin
          Items[i].FOptions := Items[i].FOptions and not $0163;
          Items[i].FOptions := Items[i].FOptions or $0008;
        end;
      end;
      if Items[i].FDescription <> '' then
        Items[i].FOptions := Items[i].FOptions or $0014
      else
        Items[i].FOptions := Items[i].FOptions and not $0014;
    end;

    Sz := SizeOf(TRecHLINK);

    if Items[i].FDescription <> '' then
      Inc(Sz,4 + ZUCLen(Items[i].FDescription));
    if Items[i].FTargetFrame <> '' then
      Inc(Sz,4 + ZUCLen(Items[i].FTargetFrame));
    case Items[i].FHyperlinkEncoding of
      hleURL:
        Inc(Sz,16 + 4 + ZUCLen(Items[i].FAddress));
      hleFile: begin
        S := Items[i].FAddress;
        // The DOS file path will only be included if GetShortPathName can find
        // the disk file.
        SetLength(Dos8_3,255);
        SetLength(Dos8_3,GetShortPathName(PChar(S),PChar(Dos8_3),255));
        if Dos8_3 <> '' then
          Inc(Sz,16 + 2 + 4 + (Length(Dos8_3) + 1) + 24 + 4)
        else
          Inc(Sz,16 + 2 + 4 + 24 + 4);
        if Items[i].FAddress <> '' then
          Inc(Sz,4 + 2 + Length(Items[i].FAddress) * 2);
      end;
      hleUNC:
        Inc(Sz,4 + ZUCLen(Items[i].FAddress));
      hleWorkbook: ;
    end;
    if Items[i].FScreenTip <> '' then
      Inc(Sz,4 + ZUCLen(Items[i].FScreenTip));

    Stream.WriteHeader(BIFFRECID_HLINK,Sz);
    PRecHLINK(PBuf).Row1 := Items[i].FRow1;
    PRecHLINK(PBuf).Row2 := Items[i].FRow2;
    PRecHLINK(PBuf).Col1 := Items[i].FCol1;
    PRecHLINK(PBuf).Col2 := Items[i].FCol2;
    Move(GUID_STDLINK,PRecHLINK(PBuf).GUID,Length(GUID_STDLINK));
    PRecHLINK(PBuf).Reserved := $00000002;
    PRecHLINK(PBuf).Options := Items[i].FOptions;
    Stream.Write(PBuf^,SizeOf(TRecHLINK));
    if Items[i].FDescription <> '' then
      WriteUSZLen(Items[i].FDescription);
    if Items[i].FTargetFrame <> '' then
      WriteUSZLen(Items[i].FTargetFrame);
    case Items[i].FHyperlinkEncoding of
      hleURL: begin
        Stream.Write(GUID_URL,Length(GUID_URL));
        WriteUSZLen(Items[i].FAddress,False);
      end;
      hleFile: begin
        Stream.Write(GUID_FILE,Length(GUID_FILE));
        DirUpCnt := 0;
        while Copy(Items[i].FAddress,1,3) = '..\' do begin
          Inc(DirUpCnt);
          Items[i].FAddress := Copy(Items[i].FAddress,4,MAXINT);
        end;
        Stream.WWord(DirUpCnt);
        if Dos8_3 <> '' then begin
          Stream.WLWord(Length(Dos8_3) + 1);
          Stream.Write(Pointer(Dos8_3)^,Length(Dos8_3));
          Stream.WByte(0);
        end
        else
          Stream.WLWord(0);
        Stream.Write(UnSequence[0],Length(UnSequence));
        if Items[i].FAddress <> '' then begin
          Stream.WLWord(4 + 2 + Length(Items[i].FAddress) * 2);
          Stream.WLWord(Length(Items[i].FAddress) * 2);
          Stream.WByte($03);
          Stream.WByte($00);
          Stream.Write(Pointer(Items[i].FAddress)^,Length(Items[i].FAddress) * 2);
        end
        else
          Stream.WLWord(0);
      end;
      hleUNC: begin
        WriteUSZLen(Items[i].FAddress);
      end;
      hleWorkbook: begin
      end;
    end;
    if Items[i].FScreenTip <> '' then
      WriteUSZLen(Items[i].FScreenTip);

    if Items[i].FToolTip <> '' then begin
      Stream.WriteHeader(BIFFRECID_HLINKTOOLTIP,SizeOf(TRecHLINKTOOLTIP) + Length(Items[i].FToolTip) * 2 + 2);
      PRecHLINKTOOLTIP(PBuf).RecId := BIFFRECID_HLINKTOOLTIP;
      PRecHLINKTOOLTIP(PBuf).Row1 := Items[i].FRow1;
      PRecHLINKTOOLTIP(PBuf).Row2 := Items[i].FRow2;
      PRecHLINKTOOLTIP(PBuf).Col1 := Items[i].FCol1;
      PRecHLINKTOOLTIP(PBuf).Col2 := Items[i].FCol2;
      Stream.Write(PBuf^,SizeOf(TRecHLINKTOOLTIP));
      Stream.Write(Pointer(Items[i].FToolTip)^,Length(Items[i].FToolTip) * 2);
      Stream.WWord(0);
    end;

  end;
end;

{ THyperlink }

procedure THyperlink.Assign(Source: TPersistent);
begin
  FHyperlinkType := THyperlink(Source).FHyperlinkType;
  FHyperlinkEncoding := THyperlink(Source).FHyperlinkEncoding;
  FCol1 := THyperlink(Source).FCol1;
  FCol2 := THyperlink(Source).FCol2;
  FRow1 := THyperlink(Source).FRow1;
  FRow2 := THyperlink(Source).FRow2;
  FOptions := THyperlink(Source).FOptions;
  FDescription := THyperlink(Source).FDescription;
  FTargetFrame := THyperlink(Source).FTargetFrame;
  FAddress := THyperlink(Source).FAddress;
  FScreenTip := THyperlink(Source).FScreenTip;
  FToolTip := THyperlink(Source).FToolTip;
  FChanged := True;
end;

constructor THyperlink.Create(Collection: TCollection);
begin
  inherited Create(Collection);
end;

destructor THyperlink.Destroy;
begin
  if FBuf <> Nil then
    FreeMem(FBuf);
  inherited;
end;

procedure THyperlink.SetAddress(const Value: WideString);
var
  Buf: PByteArray;

function BeginWith(WS: WideString): boolean;
begin
  Result := AnsiLowercase(Copy(Value,1,Length(WS))) = WS;
end;

begin
  FScreenTip := '';
  if BeginWith('http://') or BeginWith('https://') or BeginWith('www.') or BeginWith('ftp://') then
    FHyperlinkType := hltURL
  else if BeginWith('mailto:') then
    FHyperlinkType := hltURL
  else if BeginWith('\\') then
    FHyperlinkType := hltUNC
  else begin
    try
      GetMem(Buf,255);
      try
        // If EncodeFormula can't parse the value as a formula, there will
        // be an exception, and the value is assumed to be a file.
        THyperlinks(Collection).FFormulaHandler.EncodeFormula(Value,0,Buf,255,False);
        FHyperlinkType := hltWorkbook;
        FScreenTip := '#' + Value;
      finally
        FreeMem(Buf);
      end;
    except
      FHyperlinkType := hltFile;
    end;
  end;
  FHyperlinkEncoding := THyperlinkEncoding(FHyperlinkType);
  FAddress := Value;
  FChanged := True;
end;

procedure THyperlink.SetDescription(const Value: WideString);
begin
  FDescription := Value;
  FChanged := True;
end;

procedure THyperlink.SetToolTip(const Value: WideString);
begin
  FToolTip := Value;
  FChanged := True;
end;

procedure THyperlink.StoreUnknown(Len: integer; PBuf: PByteArray);
begin
  FBufLen := Len;
  GetMem(FBuf,FBufLen);
  Move(PBuf^,FBuf^,FBufLen);
end;

end.
