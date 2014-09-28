{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clEncoder;

interface

{$I clVer.inc}
{$IFDEF DELPHI7}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
{$ENDIF}

uses
  SysUtils, Classes;

const
  DefaultCharsPerLine = 76;
  
type
  EclEncoderError = class(Exception);

  TclEncoderProgressEvent = procedure (Sender: TObject; ABytesProceed, ATotalBytes: Integer) of object;

  TclEncodeMethod = (cmNone, cmMIMEQuotedPrintable, cmMIMEBase64, cmUUEncode, cm8Bit);

  TclEncoder = class(TComponent)
  private
    FMethod: TclEncodeMethod;
    FCharsPerLine: Integer;
    FFirstPass,
    FDelimPresent,
    FStringProcessed,
    FSuppressCrlf: Boolean;
    FOnProgress: TclEncoderProgressEvent;
    function GetCorrectCharsPerLine: Integer;
    procedure DoProgress(ABytesProceed, ATotalBytes: Integer);
    function ReadOneLine(AStream: TStream; var Eof: Boolean; var crlfSkipped: Integer): string;
    function EncodeUUE(ASource, ADestination: TStream): Boolean;
    function DecodeUUE(ASource, ADestination: TStream): Boolean;
    function EncodeBASE64(ASource, ADestination: TStream): Boolean;
    function DecodeBASE64(ASource, ADestination: TStream): Boolean;
    function EncodeQP(ASource, ADestination: TStream): Boolean;
    function DecodeQP(ASource, ADestination: TStream): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    function GetNeedEncoding(ASource: TStream): TclEncodeMethod; overload;
    function GetNeedEncoding(ASource: string): TclEncodeMethod; overload;
    procedure EncodeStream(ASource, ADestination: TStream; AMethod: TclEncodeMethod);
    procedure DecodeStream(ASource, ADestination: TStream; AMethod: TclEncodeMethod);
    procedure EncodeString(const ASource: string; var ADestination: string; AMethod: TclEncodeMethod);
    procedure DecodeString(const ASource: string; var ADestination: string; AMethod: TclEncodeMethod);
    procedure EncodeToString(ASource: TStream; var ADestination: string; AMethod: TclEncodeMethod);
    procedure DecodeFromString(const ASource: string; ADestination: TStream; AMethod: TclEncodeMethod);
  published
    property CharsPerLine: Integer read FCharsPerLine write FCharsPerLine default DefaultCharsPerLine;
    property SuppressCrlf: Boolean read FSuppressCrlf write FSuppressCrlf default False;
    property OnProgress: TclEncoderProgressEvent read FOnProgress write FOnProgress;
  end;
 
{$IFDEF DEMO}
{$IFNDEF IDEDEMO}
var
  IsEncoderDemoDisplayed: Boolean = False;
{$ENDIF}
{$ENDIF}

resourcestring
  SclErrorUnsupported = 'Unsupported format.';
  SclErrorWrongSymbols = 'Wrong symbols in source stream.';
  
implementation

{$IFDEF DEMO}
uses
  Windows, Forms;
{$ENDIF}

const
  CR  = #13;
  LF  = #10;
  CRLF = CR + LF;
  MaxUUECharsPerLine = 132;
  MaxQPCharsPerLine = 132;
  MinBASE64CharsPerLine = 76;
  Base64CodeTable: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  Base64CodeTableEx: array[0..255] of Integer =
        ($00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        ,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3f,$00,$00,$00,$40
        ,$35,$36,$37,$38,$39,$3a,$3b,$3c,$3d,$3e,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$04,$05,$06,$07
        ,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1a,$00,$00,$00,$00,$00
        ,$00,$1b,$1c,$1d,$1e,$1f,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2f,$30,$31
        ,$32,$33,$34,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        ,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        ,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        ,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        ,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        ,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00);

procedure clEncoderError(const Msg: string);
begin
  raise EclEncoderError.Create(Msg);
end;

{ TclEncoder }

constructor TclEncoder.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCharsPerLine := DefaultCharsPerLine;
  FStringProcessed := False;
  FSuppressCrlf := False;
end;

function TclEncoder.GetNeedEncoding(ASource: string): TclEncodeMethod;
var
  SourceStream: TStream;
begin
  SourceStream := TMemoryStream.Create;
  try
    SourceStream.Write(PChar(ASource)^, Length(ASource));
    SourceStream.Position := 0;
    Result := GetNeedEncoding(SourceStream);
  finally
    SourceStream.Free;
  end;
end;

function TclEncoder.GetNeedEncoding(ASource: TStream): TclEncodeMethod;
var
  NonTransportable,
  MaxNonTransportable: Integer;
  Symbol: Char;
  CharPerLine: Integer;
begin
  NonTransportable := 0;
  CharPerLine := 0;
  MaxNonTransportable := ASource.Size div 2;
  Result := cmNone;
  while(ASource.Read(Symbol, 1) = 1) do
  begin
    case Ord(Symbol) of
      13,10:
        begin
          if(CharPerLine > 76) then
            Result := cmMIMEQuotedPrintable;
          CharPerLine := 0;
        end;
      0..9,11..12,14..31:
        begin
          Result := cmMIMEBase64;
          CharPerLine := 0;
          Break;
        end;
      32..126:
        begin
          Inc(CharPerLine);
        end;
      127..255:
        begin
          Result := cmMIMEQuotedPrintable;
          Inc(NonTransportable);
          if (MaxNonTransportable < NonTransportable) then
          begin
            Result := cmMIMEBase64;
            Break;
          end;
        end;
    end;
  end;
  if(CharPerLine > 76) and (Result = cmNone) then
  begin
    Result := cmMIMEQuotedPrintable;
  end;
end;

procedure TclEncoder.EncodeStream(ASource, ADestination: TStream; AMethod: TclEncodeMethod);
var
  EncodeFurther: Boolean;
begin
{$IFDEF DEMO}
{$IFNDEF STANDALONEDEMO}
  if FindWindow('TAppBuilder', nil) = 0 then
  begin
    MessageBox(0, 'This demo version can be run under Delphi/C++Builder IDE only. ' +
      'Please visit www.clevercomponents.com to purchase your ' +
      'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    ExitProcess(1);
  end else
{$ENDIF}
  begin
{$IFNDEF IDEDEMO}
    if not IsEncoderDemoDisplayed then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsEncoderDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  if (ASource.Size = 0) then Exit;

  FFirstPass := True;
  DoProgress(0, ASource.Size);
  EncodeFurther := False;
  FMethod := AMethod;
  repeat
    case FMethod of
      cmMIMEQuotedPrintable: EncodeFurther := EncodeQP(ASource, ADestination);
      cmMIMEBase64:          EncodeFurther := EncodeBASE64(ASource, ADestination);
      cmUUEncode:            EncodeFurther := EncodeUUE(ASource, ADestination);
      cmNone, cm8Bit:                ADestination.CopyFrom(ASource, ASource.Size);
      else clEncoderError(SclErrorUnsupported);
    end;
    DoProgress(ASource.Position, ASource.Size);
  until not EncodeFurther;
end;

procedure TclEncoder.DecodeStream(ASource, ADestination: TStream; AMethod: TclEncodeMethod);
var
  DecodeFurther: Boolean;
begin
{$IFDEF DEMO}
{$IFNDEF STANDALONEDEMO}
  if FindWindow('TAppBuilder', nil) = 0 then
  begin
    MessageBox(0, 'This demo version can be run under Delphi/C++Builder IDE only. ' +
      'Please visit www.clevercomponents.com to purchase your ' +
      'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    ExitProcess(1);
  end else
{$ENDIF}
  begin
{$IFNDEF IDEDEMO}
    if not IsEncoderDemoDisplayed then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsEncoderDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  if (ASource.Size = 0) then Exit;

  DoProgress(0, ASource.Size);
  FDelimPresent := False;
  DecodeFurther := False;
  FMethod := AMethod;
  repeat
    case FMethod of
      cmMIMEQuotedPrintable: DecodeFurther := DecodeQP(ASource, ADestination);
      cmMIMEBase64:          DecodeFurther := DecodeBASE64(ASource, ADestination);
      cmUUEncode:            DecodeFurther := DecodeUUE(ASource, ADestination);
      cmNone, cm8Bit:                ADestination.CopyFrom(ASource, ASource.Size);
      else clEncoderError(SclErrorUnsupported);
    end;
    DoProgress(ASource.Position, ASource.Size);
  until not DecodeFurther;
end;

procedure TclEncoder.EncodeString(const ASource: string; var ADestination: string; AMethod: TclEncodeMethod);
var
  SourceStream: TStream;
  DestinationStream: TStream;
begin
  SourceStream := nil;
  DestinationStream := nil;
  try
    SourceStream := TMemoryStream.Create();
    SourceStream.WriteBuffer(PChar(ASource)^, Length(ASource));
    DestinationStream := TMemoryStream.Create();
    FStringProcessed := True;
    SourceStream.Position := 0;
    EncodeStream(SourceStream, DestinationStream, AMethod);
    SetLength(ADestination, DestinationStream.Size);
    DestinationStream.Position := 0;
    DestinationStream.ReadBuffer(PChar(ADestination)^, DestinationStream.Size);
  finally
    SourceStream.Free();
    DestinationStream.Free();
    FStringProcessed := False;
  end;
end;

procedure TclEncoder.DecodeString(const ASource: string; var ADestination: string; AMethod: TclEncodeMethod);
var
  SourceStream: TStream;
  DestinationStream: TStream;
begin
  SourceStream := nil;
  DestinationStream := nil;
  try
    SourceStream := TMemoryStream.Create();
    SourceStream.WriteBuffer(PChar(ASource)^, Length(ASource));
    DestinationStream := TMemoryStream.Create();
    SourceStream.Position := 0;
    DecodeStream(SourceStream, DestinationStream, AMethod);
    SetLength(ADestination, DestinationStream.Size);
    DestinationStream.Position := 0;
    DestinationStream.ReadBuffer(PChar(ADestination)^, DestinationStream.Size);
  finally
    SourceStream.Free();
    DestinationStream.Free();
  end;
end;

function TclEncoder.EncodeBASE64(ASource, ADestination: TStream): Boolean;

  procedure ConvertToBase64(ASymbolsArray: PChar; ACount: Integer);
  var
    Symb,
    i: Integer;
  begin
    for i := 0 to ACount - 1 do
    begin
      Symb := Integer(ASymbolsArray[i]);
      case Symb of
        64: ASymbolsArray[i] := Char(13);
        65: ASymbolsArray[i] := Char(10);
        0..63: ASymbolsArray[i] := Base64CodeTable[Symb + 1];
      else
        ASymbolsArray[i] := '=';
      end;
    end;
  end;

var
  Buffer: PChar;
  OutBuffer: PChar;
  i,
  Completed,
  Length,
  LineLength,
  RestLength,
  InIndex, OutIndex: Integer;
begin
  Result := False;
  if FSuppressCrlf then
  begin
    LineLength := ASource.Size;
  end else
  begin
    LineLength := Trunc(GetCorrectCharsPerLine() * 3/4);
  end;
  Completed := ASource.Size;
  if (Completed = 0) then Exit;
  Length := (((Completed div 3)*4) div LineLength) * (LineLength + 2);
  if (Length = 0) then Length := LineLength + 2;
  Length := (Length + ($2000 - 1)) and not ($2000 - 1);
  GetMem(Buffer, Completed + 1);
  GetMem(OutBuffer, Length);
  try
    ASource.Read(Buffer^, Completed);
    Buffer[Completed] := #0;
    OutIndex := 0;
    InIndex := 0;
    repeat
      if not (FSuppressCrlf or FFirstPass) then
      begin
        OutBuffer[OutIndex] := Char(64);
        OutBuffer[OutIndex + 1] := Char(65);
        Inc(OutIndex, 2);
      end;
      FFirstPass := False;
      RestLength := Completed - InIndex;
      if (RestLength > LineLength) then RestLength := LineLength;
      for i := 0 to (RestLength div 3) - 1 do
      begin
        OutBuffer[OutIndex] := Char(Word(Buffer[InIndex]) shr 2);
        OutBuffer[OutIndex + 1] := Char(((Word(Buffer[InIndex]) shl 4) and 48) or ((Word(Buffer[InIndex + 1]) shr 4) and 15));
        OutBuffer[OutIndex + 2] := Char(((Word(Buffer[InIndex + 1]) shl 2) and 60) or ((Word(Buffer[InIndex + 2]) shr 6) and 3));
        OutBuffer[OutIndex + 3] := Char(Word(Buffer[InIndex + 2]) and 63);
        Inc(InIndex, 3);
        Inc(OutIndex, 4);
      end;
      if (RestLength mod 3) > 0 then
      begin
        OutBuffer[OutIndex] := Char(Word(Buffer[InIndex]) shr 2);
        OutBuffer[OutIndex + 1] := Char(((Word(Buffer[InIndex]) shl 4) and 48) or ((Word(Buffer[InIndex + 1]) shr 4) and 15));
        if((RestLength mod 3) = 1) then
        begin
          OutBuffer[OutIndex + 2] := Char(-1);//'=';
          OutBuffer[OutIndex + 3] := Char(-1);//'=';
        end else
        begin
          OutBuffer[OutIndex + 2] := Char(((Word(Buffer[InIndex + 1]) shl 2) and 60) or ((Word(Buffer[InIndex + 2]) shr 6) and 3));
          OutBuffer[OutIndex + 3] := Char(-1);//'=';
        end;
        Inc(InIndex, 3);
        Inc(OutIndex, 4);
      end;
    until not(InIndex < Completed);
    ConvertToBase64(OutBuffer, OutIndex);
    ADestination.Write(OutBuffer^, OutIndex);
  finally
    FreeMem(OutBuffer);
    FreeMem(Buffer);
  end;
end;

function TclEncoder.DecodeBASE64(ASource, ADestination: TStream): Boolean;
var
  Buffer: PChar;
  DestBuffer: PChar;
  CharCode,
  i, Completed,
  Index, OutIndex, TmpIndex,
  StrLength: Integer;
begin
  Result := False;
  Completed := ASource.Size;
  if (Completed = 0) then Exit;
  GetMem(Buffer, Completed);
  GetMem(DestBuffer, Completed);
  try
    ASource.Read(Buffer^, Completed);
    StrLength := 0;
    OutIndex := 0;
    for Index := 0 to Completed - 1 do
    begin
      if ((Buffer[Index] in ['=', CR, LF]) or (Index = (Completed - 1))) then
      begin
        if (Index = (Completed - 1)) and not (Buffer[Index] in ['=', CR, LF]) then
        begin
          CharCode := Base64CodeTableEx[Integer(Buffer[Index])] - 1;
          if (CharCode < 0) then
            clEncoderError(SclErrorWrongSymbols);
          DestBuffer[Index] := Char(CharCode);
          Inc(StrLength);
          TmpIndex := Index - StrLength + 1;
        end else
        begin
          TmpIndex := Index - StrLength;
        end;
        for i := 0 to (StrLength div 4) - 1 do
        begin
          DestBuffer[OutIndex] := Chr((Word(DestBuffer[TmpIndex]) shl 2) or (Word(DestBuffer[TmpIndex + 1]) shr 4));
          DestBuffer[OutIndex + 1] := Chr((Word(DestBuffer[TmpIndex + 1]) shl 4) or (Word(DestBuffer[TmpIndex + 2]) shr 2));
          DestBuffer[OutIndex + 2] := Chr((Word(DestBuffer[TmpIndex + 2]) shl 6) or (Word(DestBuffer[TmpIndex + 3])));
          Inc(TmpIndex, 4);
          Inc(OutIndex, 3);
        end;
        if (StrLength mod 4) > 0 then
        begin
          DestBuffer[OutIndex] := Chr((Word(DestBuffer[TmpIndex]) shl 2) or (Word(DestBuffer[TmpIndex + 1]) shr 4));
          DestBuffer[OutIndex + 1] := Chr((Word(DestBuffer[TmpIndex + 1]) shl 4) or (Word(DestBuffer[TmpIndex + 2]) shr 2));
          Inc(OutIndex, (StrLength mod 4)-1);
        end;
        StrLength := 0;
        if (Buffer[Index] = '=') then
        begin
          Break;
        end;
      end else
      begin
        CharCode := Base64CodeTableEx[Integer(Buffer[Index])] - 1;
        if (CharCode < 0) then
          clEncoderError(SclErrorWrongSymbols);
        DestBuffer[Index] := Char(CharCode);
        Inc(StrLength);
      end;
    end;
    ADestination.Write(DestBuffer^, OutIndex);
  finally
    FreeMem(DestBuffer);
    FreeMem(Buffer);
  end;
end;

function TclEncoder.EncodeQP(ASource, ADestination: TStream): Boolean;
var
  Symbol, Symbol1: Char;
  i: Integer;
  Code: Integer;
  SoftBreak: Boolean;
begin
  ADestination.Size := 0;
  ADestination.Position := 0;
  repeat
    Result := True;
    SoftBreak := True;
    i := 0;
    while(FSuppressCrlf or(i <= GetCorrectCharsPerLine() - 6)) do
    begin
      if (ASource.Read(Symbol, 1) = 1) then
      begin
        Code := Ord(Symbol);
        case Code of
        32..60,62..126:
          ADestination.Write(Symbol, 1);
        61:
          begin
            ADestination.Write(Pointer(Format('=%2.2X', [Code]))^, 3);
            i := i + 2;
          end;
        13:
          begin
            if (ASource.Read(Symbol, 1) = 1) then
            begin
              if (Symbol = LF) then
              begin
                Symbol1 := CR;
                ADestination.Write(Symbol1, 1);
                Symbol1 := LF;
                ADestination.Write(Symbol1, 1);
                SoftBreak := False;
                Break;
              end else
              begin
                ADestination.Write(Pointer(Format('=%2.2X', [Code]))^, 3);
                i := i + 2;
                ASource.Seek(-1, soFromCurrent);
              end;
            end;
          end;
        else
          begin
            ADestination.Write(Pointer(Format('=%2.2X', [Code]))^, 3);
            i := i + 2;
          end;
        end;
        FFirstPass := False;
      end else
      begin
        SoftBreak := False;
        Result := False;
        break;
      end;
      Inc(i);
    end;
    if SoftBreak and not FStringProcessed then
    begin
      Symbol := '=';
      ADestination.Write(Symbol, 1);
      Symbol1 := CR;
      ADestination.Write(Symbol1, 1);
      Symbol1 := LF;
      ADestination.Write(Symbol1, 1);
    end;
  until not Result;
end;

function TclEncoder.DecodeQP(ASource, ADestination: TStream): Boolean;
var
  Symbol: Char;
  Buffer: string;
  Eof: Boolean;
  i: Integer;
  HexNumber: Integer;
  CRLFSkipped: Integer;
  CodePresent: Boolean;
begin
  HexNumber := 0;
  CRLFSkipped := 0;
  CodePresent := False;
  ADestination.Size := 0;
  ADestination.Position := 0;
  repeat
    Buffer := ReadOneLine(ASource, Eof, CRLFSkipped);
    Result := not Eof;
    if FDelimPresent then
    begin
      Dec(CRLFSkipped);
    end;
    FDelimPresent := False;

    for i := 0 to CRLFSkipped - 1 do
    begin
      ADestination.Write(#13#10, 2);
    end;
    CRLFSkipped := 0;

    for i := 1 to Length(Buffer) do
    begin
      if (FDelimPresent) then
      begin
        case Buffer[i] of
        'A'..'F':
          begin
            HexNumber := HexNumber + (Ord(Buffer[i]) - 55);
          end;
        'a'..'f':
          begin
            HexNumber := HexNumber + (Ord(Buffer[i]) - 87);
          end;
        '0'..'9':
          begin
            HexNumber := HexNumber + (Ord(Buffer[i]) - 48);
          end;
        else
          begin
            CodePresent := False;
            FDelimPresent := False;
            HexNumber := 0;
            Symbol := '=';
            ADestination.Write(Symbol, 1);
            ADestination.Write(Buffer[i], 1);
          end;
        end;
        if not CodePresent then
        begin
          HexNumber := HexNumber*16;
          CodePresent := True;
          continue;
        end else
        begin
          Symbol := Chr(HexNumber);
          ADestination.Write(Symbol, 1);
          CodePresent := False;
          FDelimPresent := False;
          HexNumber := 0;
        end;
      end else
      begin
        if Buffer[i] = '=' then
        begin
          FDelimPresent := True;
        end else
        begin
          ADestination.Write(Buffer[i], 1);
        end;
      end;
    end;
  until Eof;
end;

function TclEncoder.EncodeUUE(ASource, ADestination: TStream): Boolean;

  procedure ConvertToUUE(ASymbolsArray: PChar; ACount, ALineLength: Integer);
  var
    SymbCount, Symb,
    i: Integer;
  begin
    SymbCount := 0;
    for i := 0 to ACount - 1 do
    begin
      Inc(SymbCount);
      if (SymbCount > ALineLength) then
      begin
        if (SymbCount <= (ALineLength + 2)) then Continue;
        SymbCount := 1;
      end;
      Symb := Integer(ASymbolsArray[i]);
      if Symb = 0 then
        ASymbolsArray[i] := '`'
      else
        ASymbolsArray[i] := Chr((Symb and 63) + Ord(' '));
    end;
  end;

var
  Buffer: PChar;
  OutBuffer: PChar;
  LineLength, Length, OutLineLength, OutLen,
  i, k,
  Completed,
  Index, OutIndex: Integer;
begin
  Result := False;
  if FSuppressCrlf then
  begin
    Length:= ASource.Size;
  end else
  begin
    Length:= Trunc(GetCorrectCharsPerLine() * 3/4);
  end;
  Completed := ASource.Size;
  if (Completed = 0) then Exit;
  GetMem(Buffer, Completed);
  OutLen := ((Completed div Length) + 1) * (GetCorrectCharsPerLine() + 5);
  OutLen := (OutLen + ($2000 - 1)) and not ($2000 - 1);
  GetMem(OutBuffer, OutLen);
  try
    ASource.Read(Buffer^, Completed);
    Index := 0;
    OutIndex := 0;
    LineLength := 0;
    OutLineLength := 0;
    for i := 0 to (Completed div Length) do
    begin
      LineLength := Completed - Index;
      if (LineLength > Length) then LineLength := Length;
      OutBuffer[OutIndex] := Char(LineLength);
      Inc(OutIndex);
      for k := 0 to (LineLength div 3) - 1 do
      begin
        OutBuffer[OutIndex] := Char(Word(Buffer[Index]) shr 2);
        OutBuffer[OutIndex + 1] := Char(((Word(Buffer[Index]) shl 4) and 48) or ((Word(Buffer[Index + 1]) shr 4) and 15));
        OutBuffer[OutIndex + 2] := Char(((Word(Buffer[Index + 1]) shl 2) and 60) or ((Word(Buffer[Index + 2]) shr 6) and 3));
        OutBuffer[OutIndex + 3] := Char(Word(Buffer[Index + 2]) and 63);
        Inc(Index, 3);
        Inc(OutIndex, 4);
      end;
      if ((LineLength mod 3) > 0) then
      begin
        OutBuffer[OutIndex] := Char(Word(Buffer[Index]) shr 2);
        if ((LineLength mod 3) = 2) then
        begin
          OutBuffer[OutIndex + 1] := Char(((Word(Buffer[Index]) shl 4) and 48) or ((Word(Buffer[Index + 1]) shr 4) and 15));
          OutBuffer[OutIndex + 2] := Char(((Word(Buffer[Index + 1]) shl 2) and 60));
        end else
        begin
          OutBuffer[OutIndex + 1] := Char(((Word(Buffer[Index]) shl 4) and 48));
          OutBuffer[OutIndex + 2] := #0;
        end;
        Inc(Index, LineLength mod 3);
        Inc(OutIndex, LineLength mod 3 + 1);
      end;
      if (OutLineLength = 0) then OutLineLength := OutIndex;
      if (not FSuppressCrlf) and (LineLength >= Length) then
      begin
        OutBuffer[OutIndex] := CR;
        OutBuffer[OutIndex + 1] := LF;
        Inc(OutIndex, 2);
      end;
    end;
    ConvertToUUE(OutBuffer, OutIndex, OutLineLength);
    if not FSuppressCrlf then
    begin
      if (LineLength < Length) then
      begin
        OutBuffer[OutIndex] := CR;
        OutBuffer[OutIndex + 1] := LF;
        Inc(OutIndex, 2);
      end;
      OutBuffer[OutIndex] := '`';
      Inc(OutIndex, 1);
      OutBuffer[OutIndex] := CR;
      OutBuffer[OutIndex + 1] := LF;
      Inc(OutIndex, 2);
    end;
    ADestination.Write(OutBuffer^, OutIndex);
  finally
    FreeMem(OutBuffer);
    FreeMem(Buffer);
  end;
end;

function TclEncoder.DecodeUUE(ASource, ADestination: TStream): Boolean;
var
  Buffer,
  DestBuffer: PChar;
  curStrLength, Completed,
  i, Index, OutIndex, LineStartIndex,
  StrLength: Integer;
  SckipToLineEnd, HeaderSkipped, CRLFSkipped: Boolean;
  TmpStr: string;
begin
  Result := False;
  Completed := ASource.Size;
  if (Completed = 0) then Exit;
  GetMem(Buffer, Completed);
  GetMem(DestBuffer, Completed);
  try
    ASource.Read(Buffer^, Completed);
    StrLength := 0;
    OutIndex := 0;
    curStrLength := 0;
    LineStartIndex := 0;
    CRLFSkipped := True;
    HeaderSkipped := False;
    SckipToLineEnd := False;
    for Index := 0 to Completed - 1 do
    begin
      if ((Buffer[Index] in [CR, LF]) or (Index = (Completed - 1))) then
      begin
        if (Index = (Completed - 1)) and (not SckipToLineEnd) and not (Buffer[Index] in [CR, LF]) then
        begin
          DestBuffer[OutIndex] := Char((Integer(Buffer[Index]) - $20) and 63);
        end;
        SckipToLineEnd := False;
        OutIndex := LineStartIndex;
        for i := 0 to (StrLength div 4) - 1 do
        begin
          DestBuffer[OutIndex] := Chr((Word(DestBuffer[LineStartIndex]) shl 2) or (Word(DestBuffer[LineStartIndex + 1]) shr 4));
          DestBuffer[OutIndex + 1] := Chr((Word(DestBuffer[LineStartIndex + 1]) shl 4) or (Word(DestBuffer[LineStartIndex + 2]) shr 2));
          DestBuffer[OutIndex + 2] := Chr((Word(DestBuffer[LineStartIndex + 2]) shl 6) or (Word(DestBuffer[LineStartIndex + 3])));
          Inc(OutIndex, 3);
          Inc(LineStartIndex, 4);
        end;
        if ((StrLength mod 4) > 0) then
        begin
          DestBuffer[OutIndex] := Chr((Word(DestBuffer[LineStartIndex]) shl 2) or (Word(DestBuffer[LineStartIndex + 1]) shr 4));
          DestBuffer[OutIndex + 1] := Chr((Word(DestBuffer[LineStartIndex + 1]) shl 4) or (Word(DestBuffer[LineStartIndex + 2]) shr 2));
          Inc(OutIndex, StrLength mod 4);
        end;
        curStrLength := 0;
        StrLength := 0;
        CRLFSkipped := True;
        LineStartIndex := OutIndex;
      end else
      begin
        if SckipToLineEnd then
        begin
          DestBuffer[OutIndex] := #0;
          Inc(OutIndex);
          Continue;
        end;
        if CRLFSkipped then
        begin
          curStrLength := 0;
          if not HeaderSkipped then
          begin
            HeaderSkipped := True;
            TmpStr := 'begin';
            if CompareMem(PChar(Buffer + Index), PChar(TmpStr), 5) then
            begin
              SckipToLineEnd := True;
              Continue;
            end;
          end;
          StrLength := (((Integer(Buffer[Index]) - $20) and 63)*4) div 3;
          CRLFSkipped := False;
          if StrLength = 0 then
            Break
          else
            Continue;
        end;
        DestBuffer[OutIndex] := Char((Integer(Buffer[Index]) - $20) and 63);
        Inc(OutIndex);
        Inc(curStrLength);
        if (curStrLength > StrLength) then
        begin
          SckipToLineEnd := True;
        end;
      end;
    end;
    ADestination.Write(DestBuffer^, OutIndex);
  finally
    FreeMem(DestBuffer);
    FreeMem(Buffer);
  end;
end;

procedure TclEncoder.DoProgress(ABytesProceed, ATotalBytes: Integer);
begin
  if Assigned(FOnProgress) then
  begin
    FOnProgress(Self, ABytesProceed, ATotalBytes);
  end;
end;

function TclEncoder.ReadOneLine(AStream: TStream; var Eof: Boolean;
  var crlfSkipped: Integer): string;
var
  Symbol: Char;
  PrevSymbol: Char;
  Completed: Integer;
  StrLength: Integer;
  RollBackCnt: Integer;
begin
  Result := '';
  Eof := False;
  crlfSkipped := 0;
  StrLength := 0;
  PrevSymbol := #0;
  RollBackCnt := 0;
  while (True) do
  begin
    Completed := AStream.Read(Symbol, 1);
    if (Completed = 0) then
    begin
      Eof := True;
      RollBackCnt := StrLength;
      Break;
    end;
    if (Symbol in [CR, LF]) then
    begin
      if (StrLength <> 0) then
      begin
        RollBackCnt := StrLength + 1;
        Break;
      end;
      if not ((PrevSymbol = CR) and (Symbol = LF)) then
      begin
        Inc(crlfSkipped);
      end;
    end else
    begin
      Inc(StrLength);
    end;
    PrevSymbol := Symbol;
  end;
  if (StrLength <> 0) then
  begin
    SetLength(Result, StrLength);
    AStream.Seek(-RollBackCnt, soFromCurrent);
    AStream.Read(Pointer(Result)^, StrLength);
  end;
end;

function TclEncoder.GetCorrectCharsPerLine: Integer;
begin
  Result := CharsPerLine;
  if (Result < 1) then
  begin
    Result := DefaultCharsPerLine;
  end;
  
  case FMethod of
  cmUUEncode:
    begin
      if (CharsPerLine < 3) then
      begin
        Result := 3;
      end else
      if (CharsPerLine > MaxUUECharsPerLine) then
      begin
        Result := MaxUUECharsPerLine;
      end;
    end;
  cmMIMEQuotedPrintable:
    begin
      if (CharsPerLine < 4) then
      begin
        Result := 4;
      end else
      if (CharsPerLine > MaxQPCharsPerLine) then
      begin
        Result := MaxQPCharsPerLine;
      end;
    end;
  cmMIMEBase64:
    begin
      if(MinBASE64CharsPerLine <= CharsPerLine) then
      begin
        Result := Round(CharsPerLine/4 + 0.25) * 4;
      end else
      begin
        Result := MinBASE64CharsPerLine;
      end;
    end;
  end;
end;

procedure TclEncoder.DecodeFromString(const ASource: string; ADestination: TStream; AMethod: TclEncodeMethod);
var
  SourceStream: TStream;
begin
  SourceStream := TMemoryStream.Create();
  try
    SourceStream.WriteBuffer(PChar(ASource)^, Length(ASource));
    SourceStream.Position := 0;
    DecodeStream(SourceStream, ADestination, AMethod);
  finally
    SourceStream.Free();
  end;
end;

procedure TclEncoder.EncodeToString(ASource: TStream; var ADestination: string; AMethod: TclEncodeMethod);
var
  DestinationStream: TStream;
begin
  DestinationStream := TMemoryStream.Create();
  try
    FStringProcessed := True;
    EncodeStream(ASource, DestinationStream, AMethod);
    SetLength(ADestination, DestinationStream.Size);
    DestinationStream.Position := 0;
    DestinationStream.ReadBuffer(PChar(ADestination)^, DestinationStream.Size);
  finally
    DestinationStream.Free();
    FStringProcessed := False;
  end;
end;

end.

