{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clStreams;

interface

uses
  Classes, SysUtils;

type
  EclStreamError = class(Exception);

  TclMultiStream = class(TStream)
  private
    FPosition: Integer;
    FList: TList;
    function GetStream(Index: Integer): TStream;
    function GetTotalSize: Longint;
  protected
    procedure SetSize(NewSize: Longint); override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddStream(AStream: TStream);
    function Read(var Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

  TclNullStream = class(TStream)
  protected
    procedure SetSize(NewSize: Longint); override;
  public
    function Read(var Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

  TclChunkedStream = class(TStream)
  private
    FChunkSizeStr: string;
    FIsReadChunk: Boolean;
    FChunkSize: Integer;
    FChunkWritten: Integer;
    FIsCompleted: Boolean;
    FDestination: TStream;
    FTotalWritten: Integer;
    function ReadChunkData(const Buffer; var Offset: Integer; Count: Integer): Boolean;
    function ReadChunkSize(const Buffer; var Offset: Integer; Count: Integer): Boolean;
    function GetChunkSizeStr(const Buffer: PChar; Count: Integer): string;
  protected
    procedure SetSize(NewSize: Longint); override;
  public
    constructor Create(ADestination: TStream);
    function Read(var Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    property IsCompleted: Boolean read FIsCompleted;
  end;

implementation

{ TclMultiStream }

procedure TclMultiStream.AddStream(AStream: TStream);
begin
  FList.Add(AStream);
end;

constructor TclMultiStream.Create;
begin
  inherited Create();
  FList := TList.Create();
  FPosition := 0;
end;

destructor TclMultiStream.Destroy;
var
  i: Integer;
begin
  for i := FList.Count - 1 downto 0 do
  begin
    GetStream(i).Free();
  end;
  FList.Free();
  inherited Destroy();
end;

function TclMultiStream.GetStream(Index: Integer): TStream;
begin
  Result := TStream(FList[Index]);
end;

function TclMultiStream.Read(var Buffer; Count: Integer): Longint;
var
  i: Integer;
  buf_pos: PChar;
  len, bytesRead: Longint;
begin
  len := 0;
  Result := 0;
  buf_pos := PChar(@Buffer);
  for i := 0 to FList.Count - 1 do
  begin
    if (FPosition < (len + GetStream(i).Size)) then
    begin
      GetStream(i).Position := FPosition - len;
      bytesRead := GetStream(i).Read(buf_pos^, Count);
      Inc(Result, bytesRead);
      buf_pos := buf_pos + bytesRead;
      Inc(FPosition, bytesRead);
      if (bytesRead < Count) then
      begin
        Dec(Count, bytesRead);
      end else
      begin
        break;
      end;
    end;
    Inc(len, GetStream(i).Size);
  end;
end;

function TclMultiStream.GetTotalSize: Longint;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to FList.Count - 1 do
  begin
    Result := Result + GetStream(i).Size;
  end;
end;

function TclMultiStream.Seek(Offset: Integer; Origin: Word): Longint;
var
  len: Integer;
begin
  len := GetTotalSize();
  case Origin of
    soFromBeginning: FPosition := Offset;
    soFromCurrent: FPosition := FPosition + Offset;
    soFromEnd: FPosition := len - Offset;
  end;
  if (FPosition > len) then
  begin
    FPosition := len;
  end else
  if (FPosition < 0) then
  begin
    FPosition := 0;
  end;
  Result := FPosition;
end;

procedure TclMultiStream.SetSize(NewSize: Integer);
begin
end;

function TclMultiStream.Write(const Buffer; Count: Integer): Longint;
begin
  Result := 0;
end;

{ TclNullStream }

function TclNullStream.Read(var Buffer; Count: Integer): Longint;
begin
  Result := 0;
end;

function TclNullStream.Seek(Offset: Integer; Origin: Word): Longint;
begin
  Result := 0;
end;

function TclNullStream.Write(const Buffer; Count: Integer): Longint;
begin
  Result := 0;
end;

procedure TclNullStream.SetSize(NewSize: Integer);
begin
end;

{ TclChunkedStream }

constructor TclChunkedStream.Create(ADestination: TStream);
begin
  inherited Create();
  Assert(ADestination <> nil);
  FDestination := ADestination;
  FTotalWritten := 0;
end;

function TclChunkedStream.Read(var Buffer; Count: Integer): Longint;
begin
  Result := 0;
end;

function TclChunkedStream.Seek(Offset: Integer; Origin: Word): Longint;
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
    raise EclStreamError.Create('Invalid Stream operation');
  end;
end;

procedure TclChunkedStream.SetSize(NewSize: Integer);
begin
end;

function TclChunkedStream.Write(const Buffer; Count: Integer): Longint;
var
  offset: Integer;
begin
  Result := Count;
  FTotalWritten := FTotalWritten + Result;
  offset := 0;
  repeat
    if not FIsReadChunk then
    begin
      FIsReadChunk := ReadChunkSize(Buffer, offset, Count);
    end;

    if FIsReadChunk then
    begin
      FIsReadChunk := not ReadChunkData(Buffer, offset, Count);
    end;
  until (offset >= Count) or IsCompleted;
end;

function TclChunkedStream.GetChunkSizeStr(const Buffer: PChar; Count: Integer): string;
var
  i: Integer;
  c: Char;
begin
  Result := '';
  for i := 0 to Count - 1 do
  begin
    c := Buffer[i];
    if (c in ['0'..'9']) or (c in ['a'..'f']) or (c in ['A'..'F']) then
    begin
      Result := Result + c; 
    end else
    begin
      Break;
    end;
  end;
end;

function TclChunkedStream.ReadChunkSize(const Buffer; var Offset: Integer; Count: Integer): Boolean;
var
  start: Integer;
  cur_pos: PChar;
begin
  start := Offset;
  Result := False;

  while (Offset < Count) do
  begin
    cur_pos := PChar(@Buffer) + Offset;
    Inc(Offset);
    if (cur_pos[0] = #10) then
    begin
      FChunkSizeStr := FChunkSizeStr + GetChunkSizeStr(PChar(@Buffer) + start, Offset - start - 1);
      if (FChunkSizeStr <> '') then
      begin
        FChunkSizeStr := '$' + FChunkSizeStr;
      end;
      FChunkSize := StrToIntDef(FChunkSizeStr, 0);
      FChunkSizeStr := '';
      FChunkWritten := 0;

      Result := True;
      Exit;
    end;
  end;
  FChunkSizeStr := FChunkSizeStr + GetChunkSizeStr(PChar(@Buffer) + start, Offset - start);
end;

function TclChunkedStream.ReadChunkData(const Buffer; var Offset: Integer; Count: Integer): Boolean;
var
  cnt: Integer;
  cur_pos: PChar;
begin
  Result := False;

  if (FChunkSize > 0) then
  begin
    cnt := Count - Offset;
    if (cnt > FChunkSize - FChunkWritten) then
    begin
      cnt := FChunkSize - FChunkWritten;
    end;

    FDestination.Write((PChar(@Buffer) + Offset)^, cnt);
    Offset := Offset + cnt;
    FChunkWritten := FChunkWritten + cnt;
  end;
  if (FChunkWritten = FChunkSize) then
  begin
    while (Offset < Count) do
    begin
      cur_pos := PChar(@Buffer) + Offset;
      Inc(Offset);
      if (cur_pos[0] = #10) then
      begin
        Result := True;
        if (FChunkSize = 0) then
        begin
          FIsCompleted := True;
        end;
        Break;
      end;
    end;
  end;
end;

end.