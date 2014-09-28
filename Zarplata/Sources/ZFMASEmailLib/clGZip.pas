{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clGZip;

interface

uses
  SysUtils, Windows, Classes, clZLibStreams;

{$I clVer.inc}

type
  TclGZipProgressEvent = procedure (Sender: TObject; ABytesProceed, ATotalBytes: Integer) of object;

  TclGZip = class(TComponent)
  private
    FBatchSize: Integer;
    FOnProgress: TclGZipProgressEvent;
    FFlags: Integer;
    FCompressionLevel: TclCompressionLevel;
    FStrategy: TclCompressionStrategy;
    procedure CopyFrom(ASource, ADestination: TStream);
  protected
    procedure DoProgress(ABytesProceed, ATotalBytes: Integer); dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Compress(const AFileSource, AFileDestination: string); overload;
    procedure Uncompress(const AFileSource, AFileDestination: string); overload;
    procedure Compress(ASource, ADestination: TStream); overload;
    procedure Uncompress(ASource, ADestination: TStream); overload;
  published
    property BatchSize: Integer read FBatchSize write FBatchSize default 8192;
    property CompressionLevel: TclCompressionLevel read FCompressionLevel
      write FCompressionLevel default clDefault;
    property Strategy: TclCompressionStrategy read FStrategy write FStrategy default csDefault;
    property Flags: Integer read FFlags write FFlags default 0;
    property OnProgress: TclGZipProgressEvent read FOnProgress write FOnProgress;
  end;

implementation

procedure TclGZip.Uncompress(ASource, ADestination: TStream);
var
  compressor: TStream;
begin
  compressor := TclGZipInflateStream.Create(ADestination);
  try
    CopyFrom(ASource, compressor);
  finally
    compressor.Free();
  end;
end;

procedure TclGZip.Uncompress(const AFileSource, AFileDestination: string);
var
  inFile, outFile: TStream;
begin
  inFile := nil;
  outFile := nil;
  try
    inFile := TFileStream.Create(AFileSource, fmOpenRead);
    outFile := TFileStream.Create(AFileDestination, fmCreate);
    Uncompress(inFile, outFile);
  finally
    outFile.Free();
    inFile.Free();
  end;
end;

constructor TclGZip.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBatchSize := 8192;
  FCompressionLevel := clDefault;
  FStrategy := csDefault;
  FFlags := 0;
end;

procedure TclGZip.Compress(const AFileSource, AFileDestination: string);
var
  inFile, outFile: TStream;
begin
  inFile := nil;
  outFile := nil;
  try
    inFile := TFileStream.Create(AFileSource, fmOpenRead);
    outFile := TFileStream.Create(AFileDestination, fmCreate);
    Compress(inFile, outFile);
  finally
    outFile.Free();
    inFile.Free();
  end;
end;

procedure TclGZip.CopyFrom(ASource, ADestination: TStream);
var
  bufLen, bytesRead, proceed, total: Integer;
  buf: PChar;
begin
  bufLen := BatchSize;
  total := (ASource.Size - ASource.Position);
  if total < bufLen then
  begin
    bufLen := total;
  end;
  proceed := 0;

  GetMem(buf, bufLen);
  try
    repeat
      bytesRead := ASource.Read(buf^, bufLen);
      if (bytesRead > 0) then
      begin
        ADestination.Write(buf^, bytesRead);
        proceed := proceed + bytesRead;

        DoProgress(proceed, total);
      end;
    until (bytesRead = 0);
  finally
    FreeMem(buf);
  end;
end;

procedure TclGZip.Compress(ASource, ADestination: TStream);
var
  compressor: TStream;
begin
  compressor := TclGZipDeflateStream.Create(ADestination, CompressionLevel, Strategy, Flags);
  try
    CopyFrom(ASource, compressor);
  finally
    compressor.Free();
  end;
end;

procedure TclGZip.DoProgress(ABytesProceed, ATotalBytes: Integer);
begin
  if Assigned(OnProgress) then
  begin
    OnProgress(Self, ABytesProceed, ATotalBytes);
  end;
end;

end.
