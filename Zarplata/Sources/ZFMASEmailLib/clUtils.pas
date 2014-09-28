{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clUtils;

interface

{$I clVer.inc}
{$IFDEF DELPHI6}
  {$WARNINGS OFF}
{$ENDIF}

uses
  Windows, Classes;

type
  TCharSet = Set of Char;

  TclByteArray = array of Byte;
  
  TclBinaryData = class
  private
    FData: PByte;
    FDataSize: Integer;
    procedure Deallocate;
  public
    destructor Destroy; override;
    procedure AssignByStrings(AStrings: TStrings);
    procedure Allocate(ASize: Integer);
    procedure Reduce(ANewSize: Integer);
    property Data: PByte read FData;
    property DataSize: Integer read FDataSize;
  end;

  PWideStringItem = ^TWideStringItem;
  TWideStringItem = record
    FString: WideString;
    FObject: TObject;
  end;

  PWideStringItemList = ^TWideStringItemList;
  TWideStringItemList = array[0..MaxListSize] of TWideStringItem;
  
  TclWideStringList = class
  private
    FList: PWideStringItemList;
    FCount: Integer;
    FCapacity: Integer;
    FSorted: Boolean;
    FDuplicates: TDuplicates;
    procedure SetSorted(const Value: Boolean);
    procedure QuickSort(L, R: Integer);
    procedure ExchangeItems(Index1, Index2: Integer);
    procedure Grow;
  protected
    procedure Error(const Msg: string; Data: Integer);
    function Get(Index: Integer): WideString; virtual;
    function GetObject(Index: Integer): TObject; virtual;
    procedure Put(Index: Integer; const S: WideString); virtual;
    procedure PutObject(Index: Integer; AObject: TObject); virtual;
    function CompareStrings(const S1, S2: WideString): Integer; virtual;
    procedure InsertItem(Index: Integer; const S: WideString; AObject: TObject); virtual;
    procedure SetCapacity(NewCapacity: Integer); virtual;
  public
    destructor Destroy; override;
    function Add(const S: WideString): Integer; virtual;
    function AddObject(const S: WideString; AObject: TObject): Integer; virtual;
    procedure Clear; virtual;
    procedure Delete(Index: Integer); virtual;
    function Find(const S: WideString; var Index: Integer): Boolean; virtual;
    function IndexOf(const S: WideString): Integer; virtual;
    function IndexOfObject(AObject: TObject): Integer; virtual;
    procedure Insert(Index: Integer; const S: WideString); virtual;
    procedure InsertObject(Index: Integer; const S: WideString;
      AObject: TObject); virtual;
    procedure Move(CurIndex, NewIndex: Integer); virtual;
    procedure Sort; virtual;
    property Count: Integer read FCount;
    property Objects[Index: Integer]: TObject read GetObject write PutObject;
    property Strings[Index: Integer]: WideString read Get write Put; default;
    property Duplicates: TDuplicates read FDuplicates write FDuplicates;
    property Sorted: Boolean read FSorted write SetSorted;
  end;

function AddTextStr(AList: TStrings; const Value: string; AddToLastString: Boolean = False): Boolean;
function AddTextStream(AList: TStrings; ASource: TStream;
  AddToLastString: Boolean = False; ABatchSize: Integer = 0): Boolean;
function GetTextStr(AList: TStrings; AStartFrom, ACount: Integer): string;
procedure GetTopLines(ASource: TStream; ATopLines: Integer; AMessage: TStrings);
function GetStreamAsString(AStream: TStream; ASize: Integer; DefaultChar: Char): string;
function GetDataAsText(Data: PChar; Size: Integer; DefaultChar: Char): string;
function GetBinTextPos(const ASubStr: string; AData: PChar; ADataPos, ADataSize: Integer): Integer;
procedure ByteArrayWriteWord(AData: Word; var ADestination: TclByteArray; var AIndex: Integer);
function ByteArrayReadWord(const ASource: TclByteArray; var AIndex: Integer): Word;
function ByteArrayReadDWord(const ASource: TclByteArray; var AIndex: Integer): DWORD;
function MakeWord(AByte1, AByte2: Byte): Word;
function GetStringsSize(ALines: TStrings): Integer;
function FindInStrings(AList: TStrings; const Value: string): Integer;

procedure SetLocalFileTime(const AFileName: string; ADate: TDateTime);
function GetFullFileName(const AFileName, AFolder: string): string;
function ForceFileDirectories(const AFilePath: string): Boolean;
function DeleteRecursiveDir(const ARoot: string): Boolean;
function MakeRelativePath(const ABasePath, ARelativePath: string): string;
function GetUniqueFileName(const AFileName: string): string;
function AddTrailingBackSlash(const APath: string): string;
function NormalizeWin32Path(const APath: string; const AReplaceWith: string = '_'): string;
{$IFNDEF DELPHI6}
function DirectoryExists(const Directory: string): Boolean;
{$ENDIF}

function WordCount(const S: string; const WordDelims: TCharSet): Integer;
function WordPosition(const N: Integer; const S: string; const WordDelims: TCharSet): Integer;
function ExtractWord(N: Integer; const S: string; const WordDelims: TCharSet): string;
function ExtractNumeric(const ASource: string; AStartPos: Integer): string;
function ExtractQuotedString(const S: string; const AQuoteBegin: Char; const AQuoteEnd: Char = #0): string;
function GetNormName(const AName: string): string;
function GetDenormName(const AName: string): string;
function TextPos(const SubStr, Str: string; StartPos: Integer = 1): Integer;
function RTextPos(const SubStr, Str: String; StartPos: Integer = -1): Integer;
function ReversedString(const AStr: string): string;
function IndexOfStrArray(const S: string; AStrArray: array of string): Integer;

function GetHeaderFieldList(AStartFrom: Integer; ASource, AFieldList: TStrings): Integer;
function GetHeaderFieldValue(ASource, AFieldList: TStrings; const AName: string): string; overload;
function GetHeaderFieldValue(ASource, AFieldList: TStrings; AIndex: Integer): string; overload;
function GetHeaderFieldValueItem(const ASource, AItemName: string): string;
procedure AddHeaderArrayField(ASource: TStrings; const AValues: array of string;
  const AName, ADelimiter: string);
procedure AddHeaderField(ASource: TStrings; const AName, AValue: string);
procedure RemoveHeaderField(ASource, AFieldList: TStrings; const AName: string); overload;
procedure RemoveHeaderField(ASource, AFieldList: TStrings; AIndex: Integer); overload;
procedure InsertHeaderFieldIfNeed(ASource: TStrings; const AName, AValue: string);

function GetCorrectY2k(const AYear : Integer): Integer;
function TimeZoneBiasString: string;
function TimeZoneBiasToDateTime(const ABias: string): TDateTime;
function GlobalTimeToLocalTime(ATime: TDateTime): TDateTime;
function LocalTimeToGlobalTime(ATime: TDateTime): TDateTime;
function ConvertFileTimeToDateTime(AFileTime: TFileTime): TDateTime;

function GetCurrentThreadUser: string;

const
  cBatchSize = 8192;
  cDays: array[1..7] of string = ('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
  cMonths: array[1..12] of string = ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

implementation

uses
  SysUtils, {$IFDEF DELPHI6}RTLConsts{$ELSE}Consts{$ENDIF};

{$IFNDEF DELPHI6}
function CurrentYear: Word;
var
  SystemTime: TSystemTime;
begin
  GetLocalTime(SystemTime);
  Result := SystemTime.wYear;
end;
{$ENDIF}
  
function TimeZoneBiasString: string;
var
  TimeZoneInfo: TTimeZoneInformation;
  TimeZoneID: DWORD;
  Bias: Integer;
  Sign: Char;
begin
  Bias := 0;
  TimeZoneID := GetTimeZoneInformation(TimeZoneInfo);
  if (TimeZoneID <> TIME_ZONE_ID_INVALID) then
  begin
    if (TimeZoneID = TIME_ZONE_ID_DAYLIGHT) then
      Bias := TimeZoneInfo.Bias + TimeZoneInfo.DaylightBias else
      Bias := TimeZoneInfo.Bias;
  end;
  if (Bias > 0) then Sign := '-' else Sign := '+';
  Result := Format('%s%.2d%.2d', [Sign, Abs(Bias) div 60, Abs(Bias) mod 60]);
end;

function TimeZoneBiasToDateTime(const ABias: string): TDateTime;
var
  Sign: Char;
  Hour, Min: Word;
begin
  if (Length(ABias) > 4) and (ABias[1] in ['-', '+']) then
  begin
    Sign := ABias[1];
    Hour := StrToIntDef(Copy(ABias, 2, 2), 0);
    Min := StrToIntDef(Copy(ABias, 4, 2), 0);

{$IFDEF DELPHI6}
    if not TryEncodeTime(Hour, Min, 0, 0, Result) then
    begin
      Result := 0;
    end;
{$ELSE}
    try
      Result := EncodeTime(Hour, Min, 0, 0);
    except
      Result := 0;
    end;
{$ENDIF}

    if (Sign = '-') and (Result <> 0) then Result := - Result;
  end else
  begin
    Result := 0;
  end;
end;

function GlobalTimeToLocalTime(ATime: TDateTime): TDateTime;
var
  ST: TSystemTime;
  FT: TFileTime;
begin
  DateTimeToSystemTime(ATime, ST);
  SystemTimeToFileTime(ST, FT);
  FileTimeToLocalFileTime(FT, FT);
  FileTimeToSystemTime(FT, ST);
  Result := SystemTimeToDateTime(ST);
end;

function LocalTimeToGlobalTime(ATime: TDateTime): TDateTime;
var
  ST: TSystemTime;
  FT: TFileTime;
begin
  DateTimeToSystemTime(ATime, ST);
  SystemTimeToFileTime(ST, FT);
  LocalFileTimeToFileTime(FT, FT);
  FileTimeToSystemTime(FT, ST);
  Result := SystemTimeToDateTime(ST);
end;
          
function ConvertFileTimeToDateTime(AFileTime: TFileTime): TDateTime;
var
  lpSystemTime: TSystemTime;
  LocalFileTime: TFileTime;
begin
  if FileTimeToLocalFileTime(AFileTime, LocalFileTime) then
  begin
    FileTimeToSystemTime(LocalFileTime, lpSystemTime);
    Result := SystemTimeToDateTime(lpSystemTime);
  end else
  begin
    Result := 0;
  end;
end;

function GetCorrectY2k(const AYear : Integer): Integer;
begin
  Result := AYear;
  if (Result >= 100) then Exit;
  if TwoDigitYearCenturyWindow > 0 then
  begin
    if Result > TwoDigitYearCenturyWindow then
    begin
      Result := Result + (((CurrentYear() div 100) - 1) * 100);
    end else
    begin
      Result := Result + ((CurrentYear() div 100) * 100);
    end;
  end else
  begin
    Result := Result + ((CurrentYear() div 100) * 100);
  end;
end;

{ TclBinaryData }

procedure TclBinaryData.Allocate(ASize: Integer);
begin
  Deallocate();
  FDataSize := ASize;
  if (FDataSize > 0) then
  begin
    GetMem(FData, FDataSize);
  end;
end;

procedure TclBinaryData.AssignByStrings(AStrings: TStrings);
var
  I, L, Size: Integer;
  P: PChar;
  S, LB: string;
begin
  Size := 0;
  LB := #13#10;
  for I := 0 to AStrings.Count - 1 do
  begin
    Inc(Size, Length(AStrings[I]) + Length(LB));
  end;
  if (Size > 0) then
  begin
    Size := Size - Length(LB);
  end;
  Allocate(Size);
  P := Pointer(Data);
  for I := 0 to AStrings.Count - 1 do
  begin
    S := AStrings[I];
    L := Length(S);
    if L <> 0 then
    begin
      System.Move(Pointer(S)^, P^, L);
      Inc(P, L);
    end;
    L := Length(LB);
    if (L <> 0) and (I <> AStrings.Count - 1) then
    begin
      System.Move(Pointer(LB)^, P^, L);
      Inc(P, L);
    end;
  end;
end;

procedure TclBinaryData.Deallocate;
begin
  FreeMem(FData);
  FData := nil;
  FDataSize := 0;
end;

destructor TclBinaryData.Destroy;
begin
  Deallocate();
  inherited Destroy();
end;

procedure TclBinaryData.Reduce(ANewSize: Integer);
begin
  if (FDataSize > ANewSize) then
  begin
    FDataSize := ANewSize;
  end;
end;

function GetDelimitedValue(const ASource, AStartLexem: string): string;
var
  i, ind: Integer;
  inCommas: Boolean;
  commaChar: string;
begin
  if (AStartLexem = '') and (ASource <> '') then
  begin
    ind := 1;
  end else
  begin
    ind := system.Pos(AStartLexem, LowerCase(ASource));
  end;
  if (ind > 0) then
  begin
    Result := system.Copy(ASource, ind + Length(AStartLexem), 1000);
    inCommas := False;
    commaChar := '';
    for i := 1 to Length(Result) do
    begin
      if (commaChar = '') and (Result[i] in ['''', '"']) then
      begin
        commaChar := Result[i];
        inCommas := not inCommas;
      end else
      if (commaChar <> '') and (Result[i] = commaChar[1]) then
      begin
        inCommas := not inCommas;
      end;
      if (not inCommas) and (Result[i] in [';', ',']) then
      begin
        Result := system.Copy(Result, 1, i - 1);
        Break;
      end;
    end;
  end else
  begin
    Result := '';
  end;
end;

function GetHeaderFieldValueItem(const ASource, AItemName: string): string;
var
  s: string;
begin
  s := Trim(GetDelimitedValue(ASource, AItemName));
  if (s <> '') and (s[1] in ['''', '"']) and (s[Length(s)] in ['''', '"']) then
  begin
    Result := System.Copy(s, 2, Length(s) - 2);
  end else
  begin
    Result := s;
  end;
end;

function AddTextStr(AList: TStrings; const Value: string; AddToLastString: Boolean): Boolean;
var
  P, Start: PChar;
  S: string;
  b: Boolean;
begin
  b := AddToLastString;
  AList.BeginUpdate;
  try
    P := Pointer(Value);
    if P <> nil then
    begin
      while P^ <> #0 do
      begin
        Start := P;
        while not (P^ in [#0, #10, #13]) do Inc(P);
        SetString(S, Start, P - Start);
        if b and (AList.Count > 0) then
        begin
          AList[AList.Count - 1] := AList[AList.Count - 1] + S;
          b := False;
        end else
        begin
          AList.Add(S);
        end;
        if P^ = #13 then Inc(P);
        if P^ = #10 then Inc(P);
      end;
      Result := ((Length(Value) = 1) and (Value[1] <> #10))
        or ((Length(Value) > 1) and ((P - 2)^ <> #13) and ((P - 1)^ <> #10));
    end else
    begin
      Result := False;
    end;
  finally
    AList.EndUpdate;
  end;
end;

function AddTextStrCount(AList: TStrings; const Value: string;
  var AddToLastString: Boolean; var AHeadCount: Integer; ALinesCount: Integer): Boolean;
var
  P, Start: PChar;
  S: string;
  b: Boolean;
begin
  b := AddToLastString;
  P := Pointer(Value);

  AddToLastString := False;
  Result := False;

  if (P <> nil) then
  begin
    while (not Result) and (P^ <> #0) do
    begin
      Start := P;
      while not (P^ in [#0, #10, #13]) do Inc(P);
      SetString(S, Start, P - Start);
      if b and (AList.Count > 0) then
      begin
        AList[AList.Count - 1] := AList[AList.Count - 1] + S;
        b := False;
      end else
      begin
        AList.Add(S);
      end;
      if (Length(AList[AList.Count - 1]) = 0) and (AHeadCount = 0) then
      begin
        AHeadCount := AList.Count;
      end;
      Result := (AHeadCount > 0) and (AList.Count >= AHeadCount + ALinesCount);
      if P^ = #13 then Inc(P);
      if P^ = #10 then Inc(P);
    end;
    AddToLastString := (Length(Value) > 1) and ((P - 2)^ <> #13) and ((P - 1)^ <> #10);
  end;
end;

procedure GetTopLines(ASource: TStream; ATopLines: Integer; AMessage: TStrings);
var
  buf: string;
  bufSize, bytesRead, headCount: Integer;
  addToLastSring: Boolean;
begin
  AMessage.BeginUpdate();
  try
    AMessage.Clear();

    bufSize := ASource.Size - ASource.Position;
    if (bufSize > 76) then
    begin
      bufSize := 76;
    end;

    headCount := 0;
    addToLastSring := False;
    repeat
      SetString(buf, nil, bufSize);
      bytesRead := ASource.Read(Pointer(buf)^, bufSize);
      if bytesRead = 0 then Break;
      SetLength(buf, bytesRead);
    until AddTextStrCount(AMessage, buf, addToLastSring, headCount, ATopLines);
  finally
    AMessage.EndUpdate();
  end;
end;

function AddTextStream(AList: TStrings; ASource: TStream; AddToLastString: Boolean;
  ABatchSize: Integer): Boolean;
var
  size: Integer;
  p: PChar;
  i, cnt: Integer;
begin
  size := ASource.Size - ASource.Position;
  if (size > ABatchSize) and (ABatchSize > 0) then
  begin
    size := ABatchSize;
  end;
  GetMem(p, size + 1);
  try
    Result := AddToLastString;
    cnt := ASource.Read(p^, size);
    while (cnt > 0) do
    begin
      for i := 0 to cnt - 1 do
      begin
        if p[i] = #0 then
        begin
          p[i] := #32;
        end;
      end;
      p[cnt] := #0;
      Result := AddTextStr(AList, string(p), Result);
      cnt := ASource.Read(p^, size);
    end;
  finally
    FreeMem(p);
  end;
end;

function GetTextStr(AList: TStrings; AStartFrom, ACount: Integer): string;
const
  LB = #13#10;
var
  I, L, Size, Count: Integer;
  P: PChar;
  S: string;
begin
  Count := ACount;
  if (Count > AList.Count - AStartFrom) then
  begin
    Count := AList.Count - AStartFrom;
  end;
  
  Size := 0;
  for I := 0 to Count - 1 do Inc(Size, Length(AList[I + AStartFrom]) + Length(LB));
  SetString(Result, nil, Size);
  P := Pointer(Result);
  for I := 0 to Count - 1 do
  begin
    S := AList[I + AStartFrom];
    L := Length(S);
    if L <> 0 then
    begin
      System.Move(Pointer(S)^, P^, L);
      Inc(P, L);
    end;            
    L := Length(LB);
    if L <> 0 then
    begin
      System.Move(LB, P^, L);
      Inc(P, L);
    end;
  end;
end;

const
  SpecialSymbols = ['\', '"', '(', ')'];

function GetNormName(const AName: string): string;
  function GetSymbolsTotalCount(const AValue: String; ASymbolsSet: TCharSet): Integer;
  var
    i: Integer;
  begin
    Result := 0;
    for i := 1 to Length(AValue) do
    begin
      if (AValue[i] in ASymbolsSet) then Inc(Result);
    end;
  end;

var
  i, j, SpecialCount: Integer;
begin
  SpecialCount := GetSymbolsTotalCount(AName, SpecialSymbols);
  if (SpecialCount > 0) then
  begin
    SetLength(Result, SpecialCount + Length(AName));
    j := 0;
    for i := 1 to Length(AName) do
    begin
      Inc(j);
      if (AName[i] in SpecialSymbols) then
      begin
        Result[j] := '\';
        Inc(j);
      end;
      Result[j] := AName[i];
    end;
    Result := '"' + Result + '"';
  end else
  begin
    Result := AName;
  end;
  if (system.Pos(' ', Result) > 0)
    and (Result[1] <> '"') and (Result[Length(Result)] <> '"') then
  begin
    Result := '"' + Result + '"';
  end;
end;

function GetDenormName(const AName: string): string;
var
  i, j: Integer;
  Len: Integer;
  SpecSymExpect: Boolean;
  Sym: Char;
begin
  SpecSymExpect := False;
  Len := Length(AName);
  SetLength(Result, Len);
  i := 1;
  j := 1;
  while (i <= Length(AName)) do
  begin
    Sym := AName[i];
    case Sym of
      '\':
          begin
            if not SpecSymExpect then
            begin
              SpecSymExpect := True;
              Inc(i);
              Continue;
            end;
          end;
      '"':
          begin
            if not SpecSymExpect then
            begin
             Sym := ' ';
            end;
          end;
    end;
    SpecSymExpect := False;
    Result[j] := Sym;
    Inc(j);
    Inc(i);
  end;
  SetLength(Result, j - 1);
end;

function TextPos(const SubStr, Str: string; StartPos: Integer): Integer;
var
  PosRes, StrLen: Integer;
  s: string;
begin
  Result := 0;
  StrLen := Length(Str);
  if (StartPos < 1) or (StartPos > StrLen) then Exit;
  s := system.Copy(Str, StartPos, StrLen);
  PosRes := system.Pos(SubStr, s);
  if (PosRes <> 0) then Result := StartPos + PosRes - 1;
end;

function RTextPos(const SubStr, Str: String; StartPos: Integer = -1): Integer;
var
  i, len: Integer;
begin
  Result := 0;
  len := Length(SubStr);
  if StartPos = -1 then
  begin
    StartPos := Length(Str);
  end;
  if StartPos >= (Length(Str) - len + 1) then
  begin
    StartPos := (Length(Str) - len + 1);
  end;
  for i := StartPos downto 1 do
  begin
    if SameText(Copy(Str, i, len), SubStr) then
    begin
      Result := i;
      Break;
    end;
  end;
end;

function WordCount(const S: string; const WordDelims: TCharSet): Integer;
var
  SLen, I: Cardinal;
begin
  Result := 0;
  I := 1;
  SLen := Length(S);
  while I <= SLen do
  begin
    while (I <= SLen) and (S[I] in WordDelims) do Inc(I);
    if I <= SLen then Inc(Result);
    while (I <= SLen) and not(S[I] in WordDelims) do Inc(I);
  end;
end;

function WordPosition(const N: Integer; const S: string;
  const WordDelims: TCharSet): Integer;
var
  Count, I: Integer;
begin
  Count := 0;
  I := 1;
  Result := 0;
  while (I <= Length(S)) and (Count <> N) do
  begin
    while (I <= Length(S)) and (S[I] in WordDelims) do Inc(I);
    if I <= Length(S) then Inc(Count);
    if Count <> N then
      while (I <= Length(S)) and not (S[I] in WordDelims) do Inc(I)
    else Result := I;
  end;
end;

function ExtractWord(N: Integer; const S: string;
  const WordDelims: TCharSet): string;
var
  I: Word;
  Len: Integer;
begin
  Len := 0;
  I := WordPosition(N, S, WordDelims);
  if I <> 0 then
  begin
    while (I <= Length(S)) and not(S[I] in WordDelims) do
    begin
      Inc(Len);
      SetLength(Result, Len);
      Result[Len] := S[I];
      Inc(I);
    end;
  end;
  SetLength(Result, Len);
end;

function ExtractQuotedString(const S: string; const AQuoteBegin: Char; const AQuoteEnd: Char): string;
var
  q: Char;
begin
  Result := S;
  if Length(Result) < 2 then Exit;
  q := AQuoteEnd;
  if (AQuoteEnd = #0) then
  begin
    q := AQuoteBegin;
  end;
  if ((Result[1] = AQuoteBegin) and (Result[Length(Result)] = q)) then
  begin
    Result := System.Copy(Result, 2, Length(Result) - 2);
  end;
end;

function ExtractNumeric(const ASource: string; AStartPos: Integer): string;
var
  ind: Integer;
begin
  ind := AStartPos;
  while ((ind <= Length(ASource)) and (ASource[ind] in ['0'..'9'])) do
  begin
    Inc(ind);
  end;
  Result := system.Copy(ASource, AStartPos, ind - AStartPos);
end;

function GetStreamAsString(AStream: TStream; ASize: Integer; DefaultChar: Char): string;
var
  p: PChar;
  StreamPos: Integer;
begin
  StreamPos := AStream.Position;
  if (ASize = 0) or (ASize > AStream.Size) then
  begin
    ASize := AStream.Size;
  end;
  GetMem(p, ASize + 1);
  try
    AStream.Position := 0;
    ZeroMemory(p, ASize + 1);
    AStream.Read(p^, ASize);
    Result := GetDataAsText(p, ASize, DefaultChar);
  finally
    FreeMem(p);
    AStream.Position := StreamPos;
  end;
end;

procedure SetLocalFileTime(const AFileName: string; ADate: TDateTime);
var
  hFile: THandle;
  filedate: TFileTime;
  sysdate: TSystemTime;
begin
  hFile := CreateFile(PChar(AFileName), GENERIC_WRITE, FILE_SHARE_READ, nil, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if (hFile <> INVALID_HANDLE_VALUE) then
  begin
    DateTimeToSystemTime(ADate, sysdate);
    SystemTimeToFileTime(sysdate, filedate);
    LocalFileTimeToFileTime(filedate, filedate);
    SetFileTime(hFile, @filedate, @filedate, @filedate);
    CloseHandle(hFile);
  end;
end;

function GetFullFileName(const AFileName, AFolder: string): string;
begin
  Result := AddTrailingBackSlash(AFolder) + ExtractFileName(AFileName);
end;

function GetDataAsText(Data: PChar; Size: Integer; DefaultChar: Char): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Size - 1 do
  begin
    if (Ord(Data[i]) < 32) and not (Ord(Data[i]) in [9, 10, 13]) then
    begin
      Result := Result + DefaultChar;
    end else
    begin
      Result := Result + Data[i];
    end;
  end;
end;

{$IFNDEF DELPHI5}
function ExcludeTrailingBackslash(const S: string): string;
begin
  Result := S;
  if IsPathDelimiter(Result, Length(Result)) then
    SetLength(Result, Length(Result)-1);
end;
{$ENDIF}

function ForceFileDirectories(const AFilePath: string): Boolean;
  function ForceDirs(Dir: String): Boolean;
  begin
    Result := True;
    if Length(Dir) = 0 then Exit;
    Dir := ExcludeTrailingBackslash(Dir);
    if (Length(Dir) < 3) or DirectoryExists(Dir)
      or (ExtractFilePath(Dir) = Dir) then Exit; // avoid 'xyz:\' problem.
    Result := ForceDirs(ExtractFilePath(Dir)) and CreateDir(Dir);
  end;

begin
  Result := ForceDirs(ExtractFilePath(AFilePath));
end;

function DeleteRecursiveDir(const ARoot: string): Boolean;
var
  root: string;
  sr: TSearchRec;
begin
  root := ExcludeTrailingBackslash(ARoot);
  if FindFirst(root + '\*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if (sr.Name <> '.') and (sr.Name <> '..') then
      begin
        if (sr.Attr and faDirectory) > 0 then
        begin
          DeleteRecursiveDir(root + '\' + sr.Name);
        end else
        begin
          DeleteFile(root + '\' + sr.Name);
        end;
      end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  Result := RemoveDir(ARoot);
end;

function GetHeaderFieldList(AStartFrom: Integer; ASource, AFieldList: TStrings): Integer;
var
  ind: Integer;
begin
  Result := AStartFrom;
  while (Result < ASource.Count) and (ASource[Result] <> '') do
  begin
    if not (ASource[Result][1] in [#9, #32]) then
    begin
      ind := system.Pos(':', ASource[Result]);
      if (ind > 0) then
      begin
        AFieldList.AddObject(LowerCase(system.Copy(ASource[Result], 1, ind - 1)), TObject(Result));
      end;
    end;
    Inc(Result);
  end;
end;

function GetHeaderFieldValue(ASource, AFieldList: TStrings; const AName: string): string;
begin
  Result := GetHeaderFieldValue(ASource, AFieldList, AFieldList.IndexOf(LowerCase(AName)));
end;

function GetHeaderFieldValue(ASource, AFieldList: TStrings; AIndex: Integer): string;
var
  Ind, i: Integer;
begin
  if (AIndex > -1) and (AIndex < AFieldList.Count) then
  begin
    Ind := Integer(AFieldList.Objects[AIndex]);
    Result := system.Copy(ASource[Ind], Length(AFieldList[AIndex] + ':') + 1, 1000);
    Result := TrimLeft(Result);
    for i := Ind + 1 to ASource.Count - 1 do
    begin
      if not ((ASource[i] <> '') and (ASource[i][1] in [#9, #32])) then
      begin
        Break;
      end;
      Result := Result + Trim(ASource[i]);
    end;
  end else
  begin
    Result := '';
  end;
end;

procedure AddHeaderMultiField(ASource, AValues: TStrings; const AName, ADelimiter: string);
var
  i: Integer;
  Comma: array[Boolean] of string;
begin
  if (AValues.Count > 0) then
  begin
    Comma[False] := '';
    Comma[True] := ADelimiter;
    AddHeaderField(ASource, AName, AValues[0] + Comma[AValues.Count > 1]);
    for i := 1 to AValues.Count - 1 do
    begin
      ASource.Add(#9 + AValues[i] + Comma[i < (AValues.Count - 1)]);
    end;
  end;
end;

procedure AddHeaderArrayField(ASource: TStrings; const AValues: array of string;
  const AName, ADelimiter: string);
var
  i: Integer;
  List: TStrings;
begin
  List := TStringList.Create();
  try
    for i := Low(AValues) to High(AValues) do
    begin
      List.Add(AValues[i]);
    end;
    AddHeaderMultiField(ASource, List, AName, ADelimiter);
  finally
    List.Free();
  end;
end;

procedure AddHeaderField(ASource: TStrings; const AName, AValue: string);
var
  NormValue: string;
begin
  if (AValue <> '') then
  begin
    NormValue := StringReplace(AValue, #13#10, #13#10#9, [rfReplaceAll]);
    if (NormValue <> '') and (NormValue[Length(NormValue)] = #9) then
    begin
      system.Delete(NormValue, Length(NormValue), 1);
    end;
    AddTextStr(ASource, Format('%s: %s', [AName, NormValue]));
  end;
end;

procedure RemoveHeaderField(ASource, AFieldList: TStrings; const AName: string);
begin
  RemoveHeaderField(ASource, AFieldList, AFieldList.IndexOf(LowerCase(AName)));
end;

procedure RemoveHeaderField(ASource, AFieldList: TStrings; AIndex: Integer); overload;
var
  i: Integer;
begin
  if (AIndex > -1) then
  begin
    i := Integer(AFieldList.Objects[AIndex]);
    ASource.Delete(i);

    while (i < ASource.Count) do
    begin
      if (Length(ASource[i]) > 0) and (ASource[i][1] in [#9, #32]) then
      begin
        ASource.Delete(i);
      end else
      begin
        Break;
      end;
    end;
  end;
end;

procedure InsertHeaderFieldIfNeed(ASource: TStrings; const AName, AValue: string);
var
  ind: Integer;
  fieldList: TStrings;
begin
  if (AValue = '') then Exit;

  fieldList := TStringList.Create();
  try
    ind := GetHeaderFieldList(0, ASource, fieldList);
    if (fieldList.IndexOf(LowerCase(AName)) < 0) then
    begin
      if (ind < 0) or (ind > ASource.Count) then
      begin
        ind := ASource.Count;
      end;

      Assert(system.Pos(#13#10, AValue) < 1);
      ASource.Insert(ind, Format('%s: %s', [AName, AValue]));
    end;
  finally
    fieldList.Free();
  end;
end;

function IndexOfStrArray(const S: string; AStrArray: array of string): Integer;
begin
  for Result := Low(AStrArray) to High(AStrArray) do
  begin
    if (CompareText(AStrArray[Result], S) = 0) then Exit;
  end;
  Result := -1;
end;

function ReversedString(const AStr: string): string;
var
  I: Integer;
  P: PChar;
begin
  SetLength(Result, Length(AStr));
  P := PChar(Result);
  for I := Length(AStr) downto 1 do
  begin
    P^ := AStr[I];
    Inc(P);
  end;
end;

function MakeRelativePath(const ABasePath, ARelativePath: string): string;
  procedure GetPathList(const APath: string; AList: TStrings);
  var
    i: Integer;
    s: string;
  begin
    s := '';
    AList.Clear();
    for i := Length(APath) downto 1 do
    begin
      if (APath[i] = '\') then
      begin
        if (s <> '') then
        begin
          AList.Add(s);
        end;
        s := '';
      end else
      begin
        s := APath[i] + s;
      end;
    end;
    if (s <> '') then
    begin
      AList.Add(s);
    end;
  end;

  function MatchPathLists(ABaseList, ARelList: TStrings): string;
  var
    i, j: Integer;
  begin
    Result := '';
    
    i := ABaseList.Count - 1;
    j := ARelList.Count - 1;
    while (i >= 0) and (j >= 0) and (ABaseList[i] = ARelList[j]) do
    begin
      Dec(i);
      Dec(j);
    end;

    while (i >= 0) do
    begin
      Result := Result + '..\';
      Dec(i);
    end;

    while (j >= 1) do
    begin
      Result := Result + ARelList[j] + '\';
      Dec(j);
    end;

    Result := Result + ARelList[j];
  end;

var
  baseList, relList: TStrings;
begin
  Result := '';
  baseList := nil;
  relList := nil;
  try
    baseList := TStringList.Create();
    relList := TStringList.Create();
    
    GetPathList(ExtractFilePath(ABasePath), baseList);
    GetPathList(ARelativePath, relList);

    Result := MatchPathLists(baseList, relList);
  finally
    relList.Free();
    baseList.Free();
  end;
end;

function GetUniqueFileName(const AFileName: string): string;
var
  s: string;
  i, ind: Integer;
begin
  i := 1;
  Result := AFileName;
  s := Result;
  ind := RTextPos('.', s);
  if (ind < 1) then
  begin
    s := s + '.';
    ind := Length(s);
  end;
  while FileExists(Result) do
  begin
    Result := system.Copy(s, 1, ind - 1) + Format('%d', [i]) + system.Copy(s, ind, Length(s));
    Inc(i);
  end;
  if (Length(Result) > 0) and (Result[Length(Result)] = '.') then
  begin
    system.Delete(Result, Length(Result), 1);
  end;
end;

function AddTrailingBackSlash(const APath: string): string;
begin
  Result := APath; 
  if (Result <> '') and (Result[Length(Result)] <> '\') then
  begin
    Result := Result + '\';
  end;
end;

function NormalizeWin32Path(const APath: string; const AReplaceWith: string): string;
const
  invalidChars: set of Char = ['"', '*', '/', ':', '<', '>', '?', '\', '|', #0];
  invalidLastChars: set of Char = [' ', '.'];
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(APath) do
  begin
    if (APath[i] in invalidChars) then
    begin
      Result := Result + AReplaceWith;
    end else
    begin
      Result := Result + APath[i];
    end;
  end;

  if (Length(Result) > 0) and (Result[Length(Result)] in invalidLastChars) then
  begin
    Delete(Result, Length(Result), 1);
    if (Result = '') then
    begin
      Result := '_';
    end;
  end;
end;

{$IFNDEF DELPHI6}
function DirectoryExists(const Directory: string): Boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(Directory));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;
{$ENDIF}

procedure ByteArrayWriteWord(AData: Word; var ADestination: TclByteArray; var AIndex: Integer);
begin
  ADestination[AIndex] := AData div 256;
  Inc(AIndex);
  ADestination[AIndex] := AData mod 256;
  Inc(AIndex);
end;

function ByteArrayReadWord(const ASource: TclByteArray; var AIndex: Integer): Word;
begin
  Result := ASource[AIndex] shl 8;
  Inc(AIndex);
  Result := Result or ASource[AIndex];
  Inc(AIndex);
end;

function ByteArrayReadDWord(const ASource: TclByteArray; var AIndex: Integer): DWORD;
begin
  Result := ByteArrayReadWord(ASource, AIndex) shl 16;
  Result := Result or ByteArrayReadWord(ASource, AIndex);
end;

function MakeWord(AByte1, AByte2: Byte): Word;
var
  arr: array[0..1] of Byte;
begin
  arr[1] := AByte1;
  arr[0] := AByte2;
  Result := PWORD(@arr[0])^;
end;

function GetBinTextPos(const ASubStr: string; AData: PChar; ADataPos, ADataSize: Integer): Integer;
var
  i, curPos, endPos: Integer;
begin
  curPos := 1;
  endPos := Length(ASubStr) + 1;

  for i := ADataPos to ADataSize - 1 do
  begin
    if (PChar(Integer(AData) + i)^ = ASubStr[curPos]) then
    begin
      Inc(curPos);
    end else
    begin
      curPos := 1;
      Continue;
    end;
    if (Curpos = endPos) then
    begin
      Result := i - endPos + 2;
      Exit;
    end;
  end;
  Result := -1;
end;

function GetStringsSize(ALines: TStrings): Integer;
const
  cCRLF = #13#10;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to ALines.Count - 1 do
  begin
    Result := Result + Length(ALines[i]) + Length(cCRLF);
  end;
end;

function FindInStrings(AList: TStrings; const Value: string): Integer;
var
  i: Integer;
begin
  for i := 0 to AList.Count - 1 do
  begin
    if SameText(Value, AList[i]) then
    begin
      Result := i;
      Exit;
    end;
  end;
  Result := -1;
end;

function GetCurrentThreadUser: string;
var
  p: PChar;
  size: DWORD;
begin
  Result := '';
  size := 0;
  GetUserName(nil, size);

  if (size < 1) then Exit;

  GetMem(p, size + 1);
  try
    if GetUserName(p, size) then
    begin
      Result := string(p);
    end;
  finally
    FreeMem(p);
  end;
end;

{ TclWideStringList }

function TclWideStringList.Add(const S: WideString): Integer;
begin
  Result := AddObject(S, nil);
end;

function TclWideStringList.AddObject(const S: WideString; AObject: TObject): Integer;
begin
  if not Sorted then
  begin
    Result := FCount
  end else
  if Find(S, Result) then
  begin
    case Duplicates of
      dupIgnore: Exit;
      dupError: Error(SDuplicateString, 0);
    end;
  end;
  InsertItem(Result, S, AObject);
end;

procedure TclWideStringList.Clear;
begin
  if FCount <> 0 then
  begin
    Finalize(FList^[0], FCount);
    FCount := 0;
    SetCapacity(0);
  end;
end;

function TclWideStringList.CompareStrings(const S1, S2: WideString): Integer;
begin
  if (S1 > S2) then
  begin
    Result := 1;
  end else
  if (S1 < S2) then
  begin
    Result := -1;
  end else
  begin
    Result := 0;
  end;
end;

procedure TclWideStringList.Delete(Index: Integer);
begin
  if (Index < 0) or (Index >= FCount) then Error(SListIndexError, Index);
  Finalize(FList^[Index]);
  Dec(FCount);
  if Index < FCount then
  begin
    System.Move(FList^[Index + 1], FList^[Index],
      (FCount - Index) * SizeOf(TWideStringItem));
  end;
end;

destructor TclWideStringList.Destroy;
begin
  inherited Destroy();
  if FCount <> 0 then Finalize(FList^[0], FCount);
  FCount := 0;
  SetCapacity(0);
end;

procedure TclWideStringList.Error(const Msg: string; Data: Integer);
  function ReturnAddr: Pointer;
  asm
          MOV     EAX,[EBP+4]
  end;
begin
  raise EStringListError.CreateFmt(Msg, [Data]) at ReturnAddr;
end;

procedure TclWideStringList.ExchangeItems(Index1, Index2: Integer);
var
  Temp: Integer;
  Item1, Item2: PWideStringItem;
begin
  Item1 := @FList^[Index1];
  Item2 := @FList^[Index2];
  Temp := Integer(Item1^.FString);
  Integer(Item1^.FString) := Integer(Item2^.FString);
  Integer(Item2^.FString) := Temp;
  Temp := Integer(Item1^.FObject);
  Integer(Item1^.FObject) := Integer(Item2^.FObject);
  Integer(Item2^.FObject) := Temp;
end;

function TclWideStringList.Find(const S: WideString; var Index: Integer): Boolean;
var
  L, H, I, C: Integer;
begin
  Result := False;
  L := 0;
  H := FCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := CompareStrings(FList^[I].FString, S);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        if Duplicates <> dupAccept then L := I;
      end;
    end;
  end;
  Index := L;
end;

function TclWideStringList.Get(Index: Integer): WideString;
begin
  if (Index < 0) or (Index >= FCount) then Error(SListIndexError, Index);
  Result := FList^[Index].FString;
end;

function TclWideStringList.GetObject(Index: Integer): TObject;
begin
  if (Index < 0) or (Index >= FCount) then Error(SListIndexError, Index);
  Result := FList^[Index].FObject;
end;

procedure TclWideStringList.Grow;
var
  Delta: Integer;
begin
  if FCapacity > 256 then
  begin
    Delta := FCapacity div 4;
  end else
  begin
    Delta := 64;
  end;
  SetCapacity(FCapacity + Delta);
end;

function TclWideStringList.IndexOf(const S: WideString): Integer;
begin
  if not Sorted then
  begin
    for Result := 0 to Count - 1 do
    begin
      if CompareStrings(Get(Result), S) = 0 then Exit;
    end;
    Result := -1;
  end else
  if not Find(S, Result) then
  begin
    Result := -1;
  end;
end;

function TclWideStringList.IndexOfObject(AObject: TObject): Integer;
begin
  for Result := 0 to Count - 1 do
  begin
    if GetObject(Result) = AObject then Exit;
  end;
  Result := -1;
end;

procedure TclWideStringList.Insert(Index: Integer; const S: WideString);
begin
  InsertObject(Index, S, nil);
end;

procedure TclWideStringList.InsertItem(Index: Integer; const S: WideString; AObject: TObject);
begin
  if FCount = FCapacity then Grow();
  
  if Index < FCount then
  begin
    System.Move(FList^[Index], FList^[Index + 1],
      (FCount - Index) * SizeOf(TWideStringItem));
  end;
  with FList^[Index] do
  begin
    Pointer(FString) := nil;
    FObject := AObject;
    FString := S;
  end;
  Inc(FCount);
end;

procedure TclWideStringList.InsertObject(Index: Integer;
  const S: WideString; AObject: TObject);
begin
  if Sorted then
  begin
    Error(SSortedListError, 0);
  end;
  if (Index < 0) or (Index > FCount) then
  begin
    Error(SListIndexError, Index);
  end;
  InsertItem(Index, S, AObject);
end;

procedure TclWideStringList.Move(CurIndex, NewIndex: Integer);
var
  TempObject: TObject;
  TempString: WideString;
begin
  if CurIndex <> NewIndex then
  begin
    TempString := Get(CurIndex);
    TempObject := GetObject(CurIndex);
    Delete(CurIndex);
    InsertObject(NewIndex, TempString, TempObject);
  end;
end;

procedure TclWideStringList.Put(Index: Integer; const S: WideString);
begin
  if Sorted then Error(SSortedListError, 0);
  if (Index < 0) or (Index >= FCount) then Error(SListIndexError, Index);
  FList^[Index].FString := S;
end;

procedure TclWideStringList.PutObject(Index: Integer; AObject: TObject);
begin
  if (Index < 0) or (Index >= FCount) then Error(SListIndexError, Index);
  FList^[Index].FObject := AObject;
end;

function WideCompare(List: TclWideStringList; Index1, Index2: Integer): Integer;
begin
  Result := List.CompareStrings(List.FList^[Index1].FString,
                                List.FList^[Index2].FString);
end;

procedure TclWideStringList.QuickSort(L, R: Integer);
var
  I, J, P: Integer;
begin
  repeat
    I := L;
    J := R;
    P := (L + R) shr 1;
    repeat
      while WideCompare(Self, I, P) < 0 do Inc(I);
      while WideCompare(Self, J, P) > 0 do Dec(J);
      if I <= J then
      begin
        ExchangeItems(I, J);
        if P = I then
          P := J
        else if P = J then
          P := I;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then QuickSort(L, J);
    L := I;
  until I >= R;
end;

procedure TclWideStringList.SetCapacity(NewCapacity: Integer);
begin
  ReallocMem(FList, NewCapacity * SizeOf(TWideStringItem));
  FCapacity := NewCapacity;
end;

procedure TclWideStringList.SetSorted(const Value: Boolean);
begin
  if FSorted <> Value then
  begin
    if Value then Sort();
    FSorted := Value;
  end;
end;

procedure TclWideStringList.Sort;
begin
  if not Sorted and (FCount > 1) then
  begin
    QuickSort(0, FCount - 1);
  end;
end;

end.
