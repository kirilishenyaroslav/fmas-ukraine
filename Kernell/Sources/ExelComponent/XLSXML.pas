unit XLSXML;

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

uses Classes, SysUtils, XLSHTMLDecode;

type TTagType = (ttUnknown,ttBegin,ttEnd,ttSingle,ttXmlId);

{$WARNINGS OFF}
type TXMLValueList = class(TStringList)
private
     FValueParts: TStringList;

     function GetAsFloat(Index: integer): double;
     function GetAsInteger(Index: integer): integer;
     function GetElement(Index: integer): string;
     function GetValue(Index: integer): string;
     function GetIsFloat(Index: integer): boolean;
public
     constructor Create;
     destructor Destroy; override;
     procedure SplitValue(Index: integer);
     procedure Add(S: string); // reintroduce;
     function  FindElement(E: string): integer;
     function  FindStrElement(E: string): WideString;
     function  FindIntElement(E: string; Default: integer): integer;

     property Element[Index: integer]: string read GetElement;
     property Value[Index: integer]: string read GetValue;
     property ValueParts: TStringList  read FValueParts;
     property AsInteger[Index: integer]: integer read GetAsInteger;
     property AsFloat[Index: integer]: double read GetAsFloat;
     property IsFloat[Index: integer]: boolean read GetIsFloat;
     end;
{$WARNINGS ON}

type TXLSReadXML = class(TObject)
private
     function GetFullTag: string;
protected
     FValues: TXMLValueList;
     FTagType: TTagType;
     FTagClass,FTagName: string;
     FText: WideString;

     function  GetChar(var C: char): boolean; virtual; abstract;
     procedure UnGetChar; virtual; abstract;
     function  ReadTag: boolean;
public
     constructor Create;
     destructor Destroy; override;
     function  GetTagNext: boolean;
     procedure Seek(Offset: integer); virtual; abstract;
     function Position: integer; virtual; abstract;

     property TagType: TTagType read FTagType;
     property TagClass: string read FTagClass;
     property TagName: string read FTagName;
     property FullTag: string read GetFullTag;
     property Text: WideString read FText;
     property Values: TXMLValueList read FValues;
     end;

type TXLSReadXMLStream = class(TXLSReadXML)
private
     FStream: TStream;

protected
     procedure UnGetChar; override;
     function  GetChar(var C: char): boolean; override;
public
     constructor Create(Stream: TStream);
     procedure Seek(Offset: integer); override;
     function Position: integer; override;
     end;


type TXLSReadXMLMemory = class(TXLSReadXML)
private
     FBuf: PByteArray;
     FBufSize,FBufPos: integer;
protected
     function  GetChar(var C: char): boolean; override;
     procedure UnGetChar; override;
public
     constructor Create(Buf: PByteArray; BufSize: integer);
     procedure Seek(Offset: integer); override;
     function Position: integer; override;
     function FindTag(Tag: string): boolean;
     end;


function GetNextWord(var S: string; Sep: char): string;
function HexStrToInt(S: string): integer;

implementation

function CPos(C: char; S: string): integer;
begin
  for Result := 1 to Length(S) do begin
    if S[Result] = C then
      Exit;
  end;
  Result := -1;
end;

function CPosSkipQuotes(C: char; S: string): integer;
var
  InQuote: boolean;
begin
  InQuote := False;
  for Result := 1 to Length(S) do begin
    if S[Result] = '"' then
      InQuote := not InQuote;
    if not InQuote and (S[Result] = C) then
      Exit;
  end;
  Result := -1;
end;

function GetNextWordSkipQuotes(var S: string; Sep: char): string;
var
  p: integer;
begin
   p := CPosSkipQuotes(Sep,S);
   if p > 0 then begin
     Result := Trim(Copy(S,1,p - 1));
     S := Trim(Copy(S,p + 1,MAXINT));
   end
   else begin
     Result := Trim(S);
     S := '';
   end;
end;

function GetNextWord(var S: string; Sep: char): string;
var
  p: integer;
begin
   p := CPos(Sep,S);
   if p > 0 then begin
     Result := Trim(Copy(S,1,p - 1));
     S := Trim(Copy(S,p + 1,MAXINT));
   end
   else begin
     Result := Trim(S);
     S := '';
   end;
end;

procedure SplitStr(S: string; var Left,Right: string; Sep: char);
var
  p: integer;
begin
   p := CPos(Sep,S);
   if p > 0 then begin
     Left := Trim(Copy(S,1,p - 1));
     Right := Trim(Copy(S,p + 1,MAXINT));
   end
   else
     Left := S;
end;

procedure RemoveQuotes(var S: string);
begin
  if (S <> '') and (S[1] in ['"','''']) then
    S := Copy(S,2,MAXINT);
  if (S <> '') and (S[Length(S)] in ['"','''']) then
    S := Copy(S,1,Length(S) - 1);
end;

function HexStrToInt(S: string): integer;
var
  i: integer;
  C: char;
begin
  Result := 0;
  for i := 1 to Length(S) do begin
    C := S[i];
    case C of
      '0'..'9': Result := (Result shl 4) + (Ord(C) - $30);
      'A'..'F': Result := (Result shl 4) + (Ord(C) - $37);
      'a'..'f': Result := (Result shl 4) + (Ord(C) - $57);
    end;
  end;
end;

{ TXMLValueList }

procedure TXMLValueList.Add(S: string);
var
  S2: string;
begin
  S2 := GetNextWord(S,'=');
  if S <> '' then begin
    RemoveQuotes(S);
    S2 := S2 + '=' + S;
  end;
  inherited Add(S2);
end;

constructor TXMLValueList.Create;
begin
  FValueParts := TStringList.Create;
end;

destructor TXMLValueList.Destroy;
begin
  FValueParts.Free;
  inherited;
end;

function TXMLValueList.FindElement(E: string): integer;
begin
  for Result := 0 to Count - 1 do begin
    if GetElement(Result) = E then
      Exit;
  end;
  Result := -1;
end;

function TXMLValueList.FindIntElement(E: string; Default: integer): integer;
var
  i: integer;
  S: string;
begin
  for i := 0 to Count - 1 do begin
    if GetElement(i) = E then begin
      S := GetValue(i);
      if Copy(S,1,1) = '#' then
        Result := HexStrToInt(S)
      else
        Result := StrToIntDef(S,Default);
      Exit;
    end;
  end;
  Result := Default;
end;

function TXMLValueList.FindStrElement(E: string): WideString;
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    if GetElement(i) = E then begin
      Result := DecodeHTMLText(UTF8ToWideString(GetValue(i)));
      Exit;
    end;
  end;
  Result := '';
end;

function TXMLValueList.GetAsFloat(Index: integer): double;
var
  tempDS: char;
  i: integer;
  S: string;
begin
  tempDS := DecimalSeparator;
  DecimalSeparator := '.';
  try
    S := GetValue(Index);
    i := 1;
    while (i <= Length(S)) and (S[i] in ['0'..'9','.']) do
      Inc(i);
    if i < Length(S) then
      S := Copy(S,1,i - 1);
    Result := StrToFloat(S);
  finally
    DecimalSeparator := tempDS;
  end;
end;

function TXMLValueList.GetAsInteger(Index: integer): integer;
var
  S: string;
begin
  S := GetValue(Index);
  if Copy(S,1,1) = '#' then
    Result := HexStrToInt(S)
  else
    Result := StrToIntDef(S,0);
end;

function TXMLValueList.GetElement(Index: integer): string;
var
  S: string;
  p: integer;
begin
  S := Strings[Index];
  p := CPos('=',S);
  if p > 0 then
    Result := Copy(S,1,p - 1)
  else
    Result := S;
end;

function TXMLValueList.GetIsFloat(Index: integer): boolean;
var
  i: integer;
  S: string;
begin
  S := GetValue(Index);
  i := 1;
  while (i <= Length(S)) and (S[i] in ['0'..'9','.']) do
    Inc(i);
  Result := i > Length(S);
end;

function TXMLValueList.GetValue(Index: integer): string;
var
  S: string;
  p: integer;
begin
  S := Strings[Index];
  p := CPos('=',S);
  if p > 0 then
    Result := Copy(S,p + 1,MAXINT)
  else
    Result := '';
end;

procedure TXMLValueList.SplitValue(Index: integer);
var
  S: string;
begin
  FValueParts.Clear;
  S := GetValue(Index);
  while S <> '' do
    FValueParts.Add(GetNextWord(S,' '));
end;

{ TXLSReadXML }

constructor TXLSReadXML.Create;
begin
  FValues := TXMLValueList.Create;
end;

destructor TXLSReadXML.Destroy;
begin
  FValues.Free;
  inherited;
end;

function TXLSReadXML.GetFullTag: string;
begin
  Result := FTagClass + ':' + FTagName;
end;

function TXLSReadXML.GetTagNext: boolean;
begin
  Result := ReadTag;
end;

function TXLSReadXML.ReadTag: boolean;
var
  C: char;
  S,S2: string;
  Slash: boolean;
  InString: boolean;
begin
  Result := False;
  InString := False;
  Slash := False;
  FTagType := ttUnknown;
  while GetChar(C) do begin
    if C = '<' then begin
      if GetChar(C) and (C = '/') then
        FTagType := ttEnd
      else
        S := S + C;
      while GetChar(C) do begin
        if C = '"' then
          InString := not InString;
        if InString then begin
          S := S + C;
          Continue;
        end;
        if C = '>' then begin
          if (S <> '') and (S[1] = '?') and (Copy(S,1,4) = '?xml') then begin
            FTagType := ttXmlId;
            Result := True;
            Exit;
          end;
          if Slash then
            FTagType := ttSingle
          else if FTagType = ttUnknown then
            FTagType := ttBegin;

          S2 := S;

          FTagClass := GetNextWord(S,' ');
          SplitStr(FTagClass,FTagClass,FTagName,':');

          FValues.Clear;
          while S <> '' do begin
            FValues.Add(GetNextWordSkipQuotes(S,' '));
          end;

          S2 := '';
          while GetChar(C) do begin
            if C = '<' then begin
              unGetChar;
              Break;
            end;
            S2 := S2 + C;
          end;
          FText := DecodeHTMLText(UTF8ToWideString(Trim(S2)));

          Result := True;
          Exit;
        end
        else begin
          Slash := C = '/';
          if not Slash then
            S := S + C;
        end;
      end;
    end;
  end;
end;

{ TXLSReadXMLStream }

constructor TXLSReadXMLStream.Create(Stream: TStream);
begin
  inherited Create;
  FStream := Stream;
end;

function TXLSReadXMLStream.GetChar(var C: char): boolean;
begin
  Result := FStream.Read(C,1) = 1;
end;

function TXLSReadXMLStream.Position: integer;
begin
  Result := FStream.Position;
end;

procedure TXLSReadXMLStream.Seek(Offset: integer);
begin
  FStream.Seek(Offset,soFromBeginning);
end;

procedure TXLSReadXMLStream.UnGetChar;
begin
  FStream.Seek(-1,soFromCurrent);
end;

{ TXLSReadXMLMemory }

constructor TXLSReadXMLMemory.Create(Buf: PByteArray; BufSize: integer);
begin
  inherited Create;
  FBuf := Buf;
  FBufSize := BufSize;
  FBufPos := 0;
end;

function TXLSReadXMLMemory.FindTag(Tag: string): boolean;
var
  i,j,L: integer;
begin
  Result := False;
  if Tag = '' then
    Exit;
  L := Length(Tag);
  i := FBufPos;
  while i < FBufSize do begin
    j := 1;
    while (Char(FBuf[i]) = Tag[j]) and (j <= L) and (i < FBufSize) do begin
      Inc(i);
      Inc(j);
    end;
    Result := j = (L + 1);
    if Result then begin
      FBufPos := i - j;
      Result := ReadTag;
      Exit;
    end;
    Inc(i);
  end;
end;

function TXLSReadXMLMemory.GetChar(var C: char): boolean;
begin
  Result := FBufPos < FBufSize;
  if Result then begin
    C := Char(FBuf[FBufPos]);
    Inc(FBufPos);
  end;
end;

function TXLSReadXMLMemory.Position: integer;
begin
  Result := FBufPos;
end;

procedure TXLSReadXMLMemory.Seek(Offset: integer);
begin
  FBufPos := Offset;
end;

procedure TXLSReadXMLMemory.UnGetChar;
begin
  if FBufPos > 0 then
    Dec(FBufPos);
end;

end.
