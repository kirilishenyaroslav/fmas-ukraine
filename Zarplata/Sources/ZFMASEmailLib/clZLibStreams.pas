{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clZLibStreams;

interface

{$I clVer.inc}

uses
  Classes, SysUtils;

type
  EclZLibError = class(Exception);

  TZAlloc = function (opaque: Pointer; items, size: Integer): Pointer;
  TZFree  = procedure (opaque, block: Pointer);

  TZStreamRec = packed record
    next_in  : PChar;     // next input byte
    avail_in : Longint;   // number of bytes available at next_in
    total_in : Longint;   // total nb of input bytes read so far

    next_out : PChar;     // next output byte should be put here
    avail_out: Longint;   // remaining free space at next_out
    total_out: Longint;   // total nb of bytes output so far

    msg      : PChar;     // last error message, NULL if no error
    state    : Pointer;   // not visible by applications

    zalloc   : TZAlloc;   // used to allocate the internal state
    zfree    : TZFree;    // used to free the internal state
    opaque   : Pointer;   // private data object passed to zalloc and zfree

    data_type: Integer;   // best guess about the data type: ascii or binary
    adler    : Longint;   // adler32 value of the uncompressed data
    reserved : Longint;   // reserved for future use
  end;

  TclCompressionLevel = (clDefault, clNoCompression, clBestSpeed, clBestCompression);

  TclCompressionStrategy = (csDefault, csFiltered, csHuffman, csRLE, csFixed);

  TclGZipInflateStream = class(TStream)
  private
    FStreamRec: TZStreamRec;
    FDestination: TStream;
    FFileCrc: LongWord;
    FFileSize: LongWord;
    FRawData: TStream;
    FIsContent: Boolean;
    FIsTrailer: Boolean;
    FTotalWritten: Integer;
    procedure InitStream;
    function WriteHeader(const Buffer; Count: Integer; var Offset: Integer): Boolean;
    function WriteData(const Buffer; Count: Integer; var Offset: Integer): Boolean;
    function WriteTrailer(const Buffer; Count, Offset: Integer): Boolean;
  public
    constructor Create(ADestination: TStream);
    destructor Destroy; override;
    function Read(var Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

  TclGZipDeflateStream = class(TStream)
  private
    FStreamRec: TZStreamRec;
    FDestination: TStream;
    FFileCrc: LongWord;
    FFileSize: LongWord;
    FBuffer: PChar;
    FTotalWritten: Integer;
    procedure WriteHeader(AFlags: Integer);
    procedure WriteTrailer;
    procedure InitStream(ADestination: TStream;
      ALevel: TclCompressionLevel; AStrategy: TclCompressionStrategy;
      AFlags: Integer);
  public
    constructor Create(ADestination: TStream; ALevel: TclCompressionLevel;
      AStrategy: TclCompressionStrategy; AFlags: Integer); overload;
    constructor Create(ADestination: TStream); overload;
    destructor Destroy; override;
    function Read(var Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

implementation

uses
  Windows;
  
const
  ZLIB_VERSION = '1.2.3';

  Z_NO_FLUSH      = 0;
  Z_PARTIAL_FLUSH = 1;
  Z_SYNC_FLUSH    = 2;
  Z_FULL_FLUSH    = 3;
  Z_FINISH        = 4;
  Z_BLOCK         = 5;

  Z_OK            = 0;
  Z_STREAM_END    = 1;
  Z_NEED_DICT     = 2;
  Z_ERRNO         = (-1);
  Z_STREAM_ERROR  = (-2);
  Z_DATA_ERROR    = (-3);
  Z_MEM_ERROR     = (-4);
  Z_BUF_ERROR     = (-5);
  Z_VERSION_ERROR = (-6);

  Z_DEFAULT_COMPRESSION  = (-1);
  Z_NO_COMPRESSION       =   0;
  Z_BEST_SPEED           =   1;
  Z_BEST_COMPRESSION     =   9;

  Z_DEFAULT_STRATEGY    = 0;
  Z_FILTERED            = 1;
  Z_HUFFMAN_ONLY        = 2;
  Z_RLE                 = 3;
  Z_FIXED               = 4;

  Z_BINARY   = 0;
  Z_ASCII    = 1;
  Z_TEXT     = Z_ASCII;
  Z_UNKNOWN  = 2;

  Z_DEFLATED = 8;

  MAX_WBITS = 15;

  DEF_MEM_LEVEL = 8;

  Z_BUFSIZE = $4000;

  _z_errmsg: array[0..9] of PChar = (
    'need dictionary',      // Z_NEED_DICT      (2)
    'stream end',           // Z_STREAM_END     (1)
    'ok',                   // Z_OK             (0)
    'file error',           // Z_ERRNO          (-1)
    'stream error',         // Z_STREAM_ERROR   (-2)
    'data error',           // Z_DATA_ERROR     (-3)
    'insufficient memory',  // Z_MEM_ERROR      (-4)
    'buffer error',         // Z_BUF_ERROR      (-5)
    'incompatible version', // Z_VERSION_ERROR  (-6)
    ''
  );

{$L deflate.obj}
{$L inflate.obj}
{$L inftrees.obj}
{$L infback.obj}
{$L inffast.obj}
{$L trees.obj}
{$L compress.obj}
{$L adler32.obj}
{$L crc32.obj}

function deflateInit_(var strm: TZStreamRec; level: Integer; version: PChar;
  recsize: Integer): Integer;
  external;

function deflateInit2_(var strm: TZStreamRec; level, method, windowBits,
  memLevel, strategy: Integer; version: PChar; recsize: Integer): Integer;
  external;

function deflate(var strm: TZStreamRec; flush: Integer): Integer;
  external;

function deflateEnd(var strm: TZStreamRec): Integer;
  external;

function inflateInit_(var strm: TZStreamRec; version: PChar;
  recsize: Integer): Integer;
  external;

function inflateInit2_(var strm: TZStreamRec; windowBits: Integer;
  version: PChar; recsize: Integer): Integer;
  external;

function inflate(var strm: TZStreamRec; flush: Integer): Integer;
  external;

function inflateEnd(var strm: TZStreamRec): Integer;
  external;

function inflateReset(var strm: TZStreamRec): Integer;
  external;

function crc32(crc : LongWord; buf : Pointer; len : Integer) : LongWord;
  external;

function zcalloc(opaque: Pointer; items, size: Integer): Pointer;
begin
  GetMem(result,items * size);
end;

procedure zcfree(opaque, block: Pointer);
begin
  FreeMem(block);
end;

procedure _memset(p: Pointer; b: Byte; count: Integer); cdecl;
begin
  FillChar(p^,count,b);
end;

procedure _memcpy(dest, source: Pointer; count: Integer); cdecl;
begin
  Move(source^,dest^,count);
end;

{ TclGZipInflateStream }

constructor TclGZipInflateStream.Create(ADestination: TStream);
begin
  inherited Create();
  FRawData := TMemoryStream.Create();
  Assert(ADestination <> nil);
  FDestination := ADestination;
  inflateInit2_(FStreamRec, -MAX_WBITS, ZLIB_VERSION, SizeOf(TZStreamRec));
  InitStream();
  FTotalWritten := 0;
end;

destructor TclGZipInflateStream.Destroy;
begin
  inflateEnd(FStreamRec);
  FRawData.Free();
  inherited Destroy();
end;

function TclGZipInflateStream.Read(var Buffer; Count: Integer): Longint;
begin
  Result := 0;
end;

function TclGZipInflateStream.Seek(Offset: Integer; Origin: Word): Longint;
begin
  case Origin of
    soFromBeginning: Result := Offset;
    soFromCurrent: Result := FTotalWritten + Offset;
    soFromEnd: Result := FTotalWritten - Offset
  else
    Result := 0;
  end;
  if (Result <> FTotalWritten) then
  begin
    raise EclZLibError.Create('Invalid Stream operation');
  end;
end;

function TclGZipInflateStream.WriteHeader(const Buffer; Count: Integer; var Offset: Integer): Boolean;
var
  flags: Byte;
  extra: Word;
  b: Byte;
begin
  Offset := 0;
  Result := False;
  
  FRawData.Seek(0, soFromEnd);
  FRawData.Write(Buffer, Count);

  FRawData.Position := 0;

  if FRawData.Size < 10 then
  begin
    Result := False;
    Exit;
  end;

  FRawData.Seek(3, soFromCurrent);
  FRawData.Read(flags, 1);
  FRawData.Seek(6, soFromCurrent);

  if flags and $4 = $4 then
  begin // FEXTRA
    if FRawData.Size - FRawData.Position < 2 then Exit;
    FRawData.Read(extra, 2);

    if FRawData.Size - FRawData.Position < extra then Exit;
    FRawData.Seek(extra, soFromCurrent);
  end;

  if flags and $8 = $8 then
  begin // FNAME
    repeat
      if FRawData.Read(b, 1) = 0 then Exit;
    until (b = 0);
  end;

  if flags and $10 = $10 then
  begin // FCOMMENT
    repeat
      if FRawData.Read(b, 1) = 0 then Exit;
    until (b = 0);
  end;

  if flags and $2 = $2 then
  begin // FHCRC
    if FRawData.Size - FRawData.Position < 2 then Exit;
    FRawData.Seek(2, soFromCurrent);
  end;

  Offset := FRawData.Position - FRawData.Size + Count;
  FRawData.Size := 0;
  FRawData.Position := 0;
  Result := True;
end;

function TclGZipInflateStream.WriteData(const Buffer; Count: Integer; var Offset: Integer): Boolean;
var
  res: Integer;
  buf: PChar;
begin
  Result := False;

  if (Offset >= Count) then Exit;
  
  FStreamRec.next_in := PChar(Integer(@Buffer) + offset);
  FStreamRec.avail_in := Count - offset;

  GetMem(buf, Z_BUFSIZE);
  try
    res := Z_OK;
    while (FStreamRec.avail_in > 0) and (res = Z_OK) do
    begin
      FStreamRec.next_out := buf;
      FStreamRec.avail_out := Z_BUFSIZE;

      res := inflate(FStreamRec, Z_NO_FLUSH);
      FDestination.Write(buf^, Z_BUFSIZE - FStreamRec.avail_out);
      FFileCrc := crc32(FFileCrc, Pointer(buf), Z_BUFSIZE - FStreamRec.avail_out);
      FFileSize := FFileSize + Z_BUFSIZE - LongWord(FStreamRec.avail_out);
    end;

    if (res <> Z_OK) and (res <> Z_STREAM_END) then
    begin
      raise EclZLibError.Create('Uncompressing error - ' + FStreamRec.msg);
    end;

    Result := (res = Z_STREAM_END);

    Offset := Integer(FStreamRec.next_in) - Integer(@Buffer);
  finally
    FreeMem(buf);
  end;
end;

function TclGZipInflateStream.WriteTrailer(const Buffer; Count, Offset: Integer): Boolean;
var
  crc, size: LongWord;
begin
  Result := False;

  if (Offset >= Count) then Exit;
  
  FRawData.Seek(0, soFromEnd);
  FRawData.Write(PChar(Integer(@Buffer) + Offset)^, Count - Offset);
  FRawData.Position := 0;

  if (FRawData.Size >= SizeOf(crc) + SizeOf(size)) then
  begin
    FRawData.Read(crc, SizeOf(crc));
    FRawData.Read(size, SizeOf(size));
    if (crc <> FFileCrc) then
    begin
      raise EclZLibError.Create('Uncompressing error - invalid crc');
    end;
    if (size <> FFileSize) then
    begin
      raise EclZLibError.Create('Uncompressing error - invalid data size');
    end;
    Result := True;
  end;
end;

function TclGZipInflateStream.Write(const Buffer; Count: Integer): Longint;
var
  offset: Integer;
begin
  Result := Count;
  FTotalWritten := FTotalWritten + Result;

  offset := 0;
  if not FIsContent then
  begin
    if not WriteHeader(Buffer, Count, offset) then Exit;
    FIsContent := True;
  end;

  if (not FIsTrailer) then
  begin
    FIsTrailer := WriteData(Buffer, Count, offset);
  end;

  if FIsTrailer then
  begin
    if WriteTrailer(Buffer, Count, offset) then
    begin
      InitStream();
    end;
  end;
end;

procedure TclGZipInflateStream.InitStream;
begin
  FFileCrc := 0;
  FFileSize := 0;
  FRawData.Size := 0;
  FRawData.Position := 0;
  FIsContent := False;
  FIsTrailer := False;
end;

{ TclGZipDeflateStream }

procedure TclGZipDeflateStream.InitStream(ADestination: TStream;
  ALevel: TclCompressionLevel; AStrategy: TclCompressionStrategy; AFlags: Integer);
const
  compressionLevels: array[TclCompressionLevel] of Integer = (
    Z_DEFAULT_COMPRESSION, Z_NO_COMPRESSION, Z_BEST_SPEED, Z_BEST_COMPRESSION);
begin
  FFileCrc := 0;
  FFileSize := 0;
  FTotalWritten := 0;
  Assert(ADestination <> nil);
  FDestination := ADestination;

  deflateInit2_(FStreamRec, compressionLevels[ALevel], Z_DEFLATED, -MAX_WBITS,
    DEF_MEM_LEVEL, Integer(AStrategy), ZLIB_VERSION, SizeOf(TZStreamRec));

  WriteHeader(AFlags);

  GetMem(FBuffer, Z_BUFSIZE);
  FStreamRec.next_out := FBuffer;
  FStreamRec.avail_out := Z_BUFSIZE;
end;

constructor TclGZipDeflateStream.Create(ADestination: TStream;
  ALevel: TclCompressionLevel; AStrategy: TclCompressionStrategy; AFlags: Integer);
begin
  inherited Create();
  InitStream(ADestination, ALevel, AStrategy, AFlags);
end;

constructor TclGZipDeflateStream.Create(ADestination: TStream);
begin
  inherited Create();
  InitStream(ADestination, clDefault, csDefault, 0);
end;

destructor TclGZipDeflateStream.Destroy;
begin
  try
    WriteTrailer();
  finally
    FreeMem(FBuffer);
    deflateEnd(FStreamRec);
    inherited Destroy();
  end;
end;

function TclGZipDeflateStream.Read(var Buffer; Count: Integer): Longint;
begin
  Result := 0;
end;

function TclGZipDeflateStream.Seek(Offset: Integer; Origin: Word): Longint;
begin
  case Origin of
    soFromBeginning: Result := Offset;
    soFromCurrent: Result := FTotalWritten + Offset;
    soFromEnd: Result := FTotalWritten - Offset
  else
    Result := 0;
  end;
  if (Result <> FTotalWritten) then
  begin
    raise EclZLibError.Create('Invalid Stream operation');
  end;
end;

function TclGZipDeflateStream.Write(const Buffer; Count: Integer): Longint;
begin
  Result := Count;
  FTotalWritten := FTotalWritten + Result;

  FStreamRec.next_in := @Buffer;
  FStreamRec.avail_in := Count;

  while FStreamRec.avail_in > 0 do
  begin
    if FStreamRec.avail_out = 0 then
    begin
      if (FDestination.Write(FBuffer^, Z_BUFSIZE) <> Z_BUFSIZE) then
      begin
        raise EclZLibError.Create('Compressing error - can not write to Stream');
      end;

      FStreamRec.next_out := FBuffer;
      FStreamRec.avail_out := Z_BUFSIZE;
    end;

    if (deflate(FStreamRec, Z_NO_FLUSH) <> Z_OK) then
    begin
      raise EclZLibError.Create('Compressing error - ' + FStreamRec.msg);
    end;
  end;

  FFileCrc := crc32(FFileCrc, @Buffer, Count);
  FFileSize := FFileSize + LongWord(Count);
end;

procedure TclGZipDeflateStream.WriteHeader(AFlags: Integer);
var
  gzheader: array[0..9] of Byte;
begin
  ZeroMemory(@gzheader, SizeOf(gzheader));
	gzheader[0] := $1F;
	gzheader[1] := $8B;
	gzheader[2] := Z_DEFLATED;
  gzheader[3] := Byte(AFlags);
  FDestination.Write(gzheader, SizeOf(gzheader));
end;

procedure TclGZipDeflateStream.WriteTrailer;
var
  len, res: Integer;
  done: Boolean;
begin
  FStreamRec.avail_in := 0;

  done := False;
  repeat
    len := Z_BUFSIZE - FStreamRec.avail_out;
    if (len <> 0) then
    begin
      if (FDestination.Write(FBuffer^, len) <> len) then
      begin
        raise EclZLibError.Create('Compressing error - can not write to Stream');
      end;

      FStreamRec.next_out := FBuffer;
      FStreamRec.avail_out := Z_BUFSIZE;
    end;

    if done then Break;

    res := deflate(FStreamRec, Z_FINISH);
    if (len = 0) and (res = Z_BUF_ERROR) then
    begin
      res := Z_OK;
    end;

    done := (FStreamRec.avail_out <> 0) or (res = Z_STREAM_END);

    if (res <> Z_OK) and (res <> Z_STREAM_END) then
    begin
      raise EclZLibError.Create('Compressing error - ' + FStreamRec.msg);
    end;
  until False;

  FDestination.Write(FFileCrc, SizeOf(FFileCrc));
  FDestination.Write(FFileSize, SizeOf(FFileSize));
end;

end.
