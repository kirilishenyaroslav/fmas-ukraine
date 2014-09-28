unit ImportCSV2;

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
** expressed or implied, including, without limitation, the warranties of     **
** merchantability and of fitness for any purpose. The author assumes no      **
** liability for damages, direct or consequential, which may result from the  **
** use of XLSReadWriteII.                                                     **
********************************************************************************
}

{$B-}
{$H+}
{$R-}
{$C-}
{$I XLSRWII2.inc}

interface

uses Classes, SysUtils, XLSUtils2, XLSReadWriteII2;

//* This routine will import a text (CSV) file into a worksheet. Any existing cells on the worksheet will be overwritten.
//* Correct value for decimal separator is detected automatically. See alse ~[link ImportCSVAuto]
//* ~param XLS The target XLSReadWriteII object.
//* ~param SheetIndex The index to the worksheet where the file will be imported to.
//* ~param Col Left column where the imported data will be written.
//* ~param Row Top row where the imported data will be written.
//* ~param Filename The name of the text file that shall be imported.
//* ~param SepChar Separator character for the fields (cells) in the source file.
//* ~param HasQuoteChar Set this to True if strings in the source file are quoted.
//* ~result The number of cells that where imported.
function ImportCSV(XLS: TXLSReadWriteII2; SheetIndex,Col,Row: integer; Filename: WideString; SepChar: Char; HasQuoteChar: boolean): boolean;
//* This routine will import a text (CSV) file into a worksheet. Any existing cells on the worksheet will be overwritten.
//* The routine will try to detect correct values for separator character, quote character and decimal separator. See alse ~[link ImportCSV]
//* ~param XLS The target XLSReadWriteII object.
//* ~param SheetIndex The index to the worksheet where the file will be imported to.
//* ~param Col Left column where the imported data will be written.
//* ~param Row Top row where the imported data will be written.
//* ~param Filename The name of the text file that shall be imported.
//* ~result The number of cells that where imported.
function ImportCSVAuto(XLS: TXLSReadWriteII2; SheetIndex,Col,Row: integer; Filename: WideString): boolean;

implementation

var SepChars: array[0..3] of char = (',',';',':',#9);

function CPosSkipQuote(C: char; S: string): integer;
var
  InQuote: boolean;
begin
  InQuote := False;
  for Result := 1 to Length(S) do begin
    if S[Result] in ['"',''''] then
      InQuote := not InQuote;
    if not InQuote and (S[Result] = C) then
      Exit;
  end;
  Result := -1;
end;

function StrTokenSkipQuote(var S: string; Token: char): string;
var
  p: integer;
begin
  p := CPosSkipQuote(Token,S);
  if p >= 1 then begin
    Result := Copy(S,1,p - 1);
    S := Copy(S,p + 1,MAXINT);
  end
  else begin
    Result := S;
    S := '';
  end;
end;

function StrToken(var S: string; Token: char): string;
var
  p: integer;
begin
  p := CPos(Token,S);
  if p >= 1 then begin
    Result := Copy(S,1,p - 1);
    S := Copy(S,p + 1,MAXINT);
  end
  else begin
    Result := S;
    S := '';
  end;
end;

function ImportCSVInt(Lines: TStringList; XLS: TXLSReadWriteII2; SheetIndex,Col,Row: integer; Filename: WideString; SepChar: Char; HasQuoteChar: boolean): integer;
var
  i,C,L: integer;
  V: double;
  S,Token: string;
  sTRUE,sFALSE: WideString;
  TempDS: char;
begin
  Result := 0;
{$ifdef OLD_COMPILER}
  sTRUE := AnsiUppercase(XLS.StrTRUE);
  sFALSE := AnsiUppercase(XLS.StrFALSE);
{$else}
  sTRUE := WideUppercase(XLS.StrTRUE);
  sFALSE := WideUppercase(XLS.StrFALSE);
{$endif}
  TempDS := DecimalSeparator;
  try
    for i := 0 to Lines.Count - 1 do begin
      S := Lines[i];
      C := 0;
      while S <> '' do begin
        if HasQuoteChar then
          Token := Trim(StrTokenSkipQuote(S,SepChar))
        else
          Token := Trim(StrToken(S,SepChar));
        if Token <> '' then begin
          Inc(Result);
          L := Length(Token);
          if HasQuoteChar and (((Token[1] = '"') and (Token[L] = '"')) or ((Token[1] = '''') and (Token[L] = ''''))) then begin
            Token := Copy(Token,2,L - 2);
            XLS.Sheets[SheetIndex].AsString[Col + C,Row + i] := Token;
          end
          else begin
{$ifdef OLD_COMPILER}
            if AnsiUppercase(Token) = sTRUE then
              XLS.Sheets[SheetIndex].AsBoolean[Col + C,Row + i] := True
            else if AnsiUppercase(Token) = sFALSE then
              XLS.Sheets[SheetIndex].AsBoolean[Col + C,Row + i] := False
{$else}
            if WideUppercase(Token) = sTRUE then
              XLS.Sheets[SheetIndex].AsBoolean[Col + C,Row + i] := True
            else if WideUppercase(Token) = sFALSE then
              XLS.Sheets[SheetIndex].AsBoolean[Col + C,Row + i] := False
{$endif}
            else begin
              try
                V := StrToFloat(Token);
                XLS.Sheets[SheetIndex].AsFloat[Col + C,Row + i] := V;
              except
                if DecimalSeparator = '.' then
                  DecimalSeparator := ','
                else
                  DecimalSeparator := '.';
                try
                  V := StrToFloat(Token);
                  XLS.Sheets[SheetIndex].AsFloat[Col + C,Row + i] := V;
                except
                  try
                    V := StrToDateTime(Token);
                    XLS.Sheets[SheetIndex].AsDateTime[Col + C,Row + i] := V;
                  except
                    XLS.Sheets[SheetIndex].AsString[Col + C,Row + i] := Token;
                  end;
                end;
              end;
            end;
          end;
        end;
        Inc(C);
      end;
    end;
  finally
    DecimalSeparator := TempDS;
  end;
  XLS[SheetIndex].CalcDimensions;
end;

function ImportCSV(XLS: TXLSReadWriteII2; SheetIndex,Col,Row: integer; Filename: WideString; SepChar: Char; HasQuoteChar: boolean): boolean;
var
  Lines: TStringList;
begin
  Lines := TStringList.Create;
  try
    Lines.LoadFromFile(Filename);
    Result := ImportCSVInt(Lines,XLS,SheetIndex,Col,Row,Filename,SepChar,HasQuoteChar) > 0;
  finally
    Lines.Free;
  end;
end;

function ImportCSVAuto(XLS: TXLSReadWriteII2; SheetIndex,Col,Row: integer; Filename: WideString): boolean;
var
  Lines: TStringList;
  SepCharCount: array[0..High(SepChars)] of integer;
  SepCharIndex: integer;

function FindSepChar(Index: integer): boolean;
var
  S: string;
  i,j,MaxCnt: integer;
  InQuote: boolean;
begin
  S := Lines[Index];
  InQuote := False;
  for i := 0 to High(SepChars) do
    SepCharCount[i] := 0;
  for i := 1 to Length(S) do begin
    if S[i] in ['"',''''] then
      InQuote := not InQuote;
    if not InQuote then begin
      for j := 0 to High(SepChars) do begin
        if S[i] = SepChars[j] then
          Inc(SepCharCount[j]);
      end;
    end;
  end;
  SepCharIndex := -1;
  MaxCnt := 0;
  for i := 0 to High(SepCharCount) do begin
    if (SepCharCount[i] > 2) and (SepCharCount[i] > MaxCnt) then begin
      MaxCnt := SepCharCount[i];
      SepCharIndex := i;
    end;
  end;
  Result := SepCharIndex >= 0;
end;

begin
  Result := False;
  Lines := TStringList.Create;
  try
    Lines.LoadFromFile(Filename);
    if Lines.Count < 3 then
      Exit;
{
    if DecimalSeparator = ',' then
      SepChars[0] := #$FF;
}      
    Result := FindSepChar(1);
    if not Result then
      Exit;
    Result := ImportCSVInt(Lines,XLS,SheetIndex,Col,Row,Filename,SepChars[SepCharIndex],True) > 0;
  finally
    Lines.Free;
  end;
end;

end.
