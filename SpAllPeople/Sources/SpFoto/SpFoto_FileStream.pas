unit SpFoto_FileStream;

interface

Uses
  Windows, SysUtils, Classes;

Type
  TEndian = (Little, Big);

  TmdFileStream = class
  Private
    FName     : String;
    FStream   : TFileStream;
    FBufSize  : Integer;
    FBuf      : PChar;
    FBufStart : LongInt;
    FBufUsed  : LongInt;
    FPos      : LongInt;

    FEndian   : TEndian;

    Procedure CheckBuffer(Index : LongInt);
    function InBuffer(Index : LongInt) : Boolean;

    function GetEOF : Boolean;
    function GetData(Index : LongInt) : Byte;
  Protected
  Public
    Constructor Create(Const FileName : String; Mode: Word);
    Destructor Destroy; Override;

    // Read bytes from the buffer
    function Read(var Buffer; Count: Longint): Longint;
    // Get one byte from the buffer (as byte or char)
    Function GetByte : Byte;
    Function GetChar : Char;
    // Get a word from the buffer
    Function GetWord : Word;
    // Get a double word / integer from the buffer
    Function GetInt : DWord;
    // Seek a special position. This should
    // be changed the match the normal file seek function.
    Procedure Seek(Pos : LongInt); Virtual;
    // Find the next occourance on a byte.
    // Return true if it was found, and the next read will
    // read that byte.
    Function SeekByte(AByte : Byte) : Boolean;

    // Are we at the end of the file (actually, are we
    // after the end)
    Property EOF : Boolean Read GetEOF;
    // The current position, in bytes from the beginning
    // (first = 0)
    Property Position : LongInt Read FPos Write Seek;
    // Access data in the file on position "index"
    Property Data[Index : LongInt] : Byte read GetData;
    // Select the endian format used the return words and
    // integers. Default is big endian.
    Property Endian : TEndian Read FEndian Write FEndian;
  end;

implementation

//
// Construct our own object
//
Constructor TmdFileStream.Create(Const FileName : String; Mode: Word);
Begin
  Inherited Create;
  FBufSize := 1024;  // Static 1 K byte of read buffer
  FName := FileName;
  FStream := TFileStream.Create(FName, Mode);
  GetMem(FBuf, FBufSize);

  FBufStart := FStream.Position;
  FBufUsed := FStream.Read(FBuf^, FBufSize);
  FPos := 0;
  FEndian := Big;
end;

//
// Release our memory again
//
Destructor TmdFileStream.Destroy;
Begin
  FreeMem(FBuf, FBufSize);
  FStream.Free;
  Inherited Destroy;
end;

//
// Check if we want to read a byte inside our current buffer.
// if it's not inside the buffer make sure that we actually
// have the right data in our buffer
//
Procedure TmdFileStream.CheckBuffer(Index : LongInt);
Begin
  If NOT InBuffer(Index) Then
  Begin
    FStream.Seek(Index, soFromBeginning);

    FBufStart := FStream.Position;
    FBufUsed := FStream.Read(FBuf^, FBufSize);
  end;
end;

//
// Check that Index is in the buffer
//
function TmdFileStream.InBuffer(Index : LongInt) : Boolean;
Begin
  Result := (Index >= FBufStart) AND (Index < (FBufUsed+FBufStart));
end;

//
// Are we at the end of the File... ?
// (Not sure that this always work!)
//
function TmdFileStream.GetEOF : Boolean;
Begin
  Result := FBufUsed = 0;
end;

//
// Read X bytes from the current position
//
function TmdFileStream.Read(var Buffer; Count: Longint): Longint;
Begin
  Result := 0;
  While (NOT EOF) AND (Result < Count) do
  Begin
    PChar(Buffer)[Result] := GetChar;
    Inc(Result);
  end;
end;

//
// Get One Byte from the buffer
//
Function TmdFileStream.GetData(Index : LongInt) : Byte;
Begin
  CheckBuffer(Index);

  If NOT EOF Then
  Begin
    Result := Byte(FBuf[Index-FBufStart]);
    FPos := Index+1;
  end
  else
    raise Exception.Create('Out of bounds'); 
end;

//
// Get next byte from the buffer
//
Function TmdFileStream.GetByte : Byte;
Begin
  Result := GetData(FPos);
end;

//
// Get Next word from the buffer
//
Function TmdFileStream.GetWord : Word;
Begin
  If FEndian = Big Then
    Result := (GetByte SHL 8) OR (GetByte)
  else
    Result := (GetByte) OR (GetByte SHL 8);
end;

//
// Get next integer (Double Word)
//
Function TmdFileStream.GetInt : DWord;
Begin
  If FEndian = Big Then
    Result := (GetWord SHL 16) OR (GetWord)
  else
    Result := (GetWord) OR (GetWord SHL 16);
end;

//
// The same a GetByte, just returning a char!
//
Function TmdFileStream.GetChar : Char;
Begin
  Result := Char(GetByte);
end;

//
// Seek to a new position
// (Change this to be more "standard like")
//
Procedure TmdFileStream.Seek(Pos : LongInt);
Begin
  FPos := Pos;
end;

//
// Find the next occurance of a byte
//
Function TmdFileStream.SeekByte(AByte : Byte) : Boolean;
Begin
  Result := False;
  CheckBuffer(FPos);
  While Byte(FBuf[FPos-FBufStart]) <> AByte do
  Begin
    Inc(FPos);
    CheckBuffer(FPos);
    If EOF Then
      Exit;
  end;
  Result := True;
end;

end.
