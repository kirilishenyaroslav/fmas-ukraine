unit XLSWideStrList2;

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

uses Classes, SysUtils;

type TWSRec = record
     WS: WideString;
     end;

type TXLSWideStringList = class(TObject)
private
     FStrings: TList;
     FChangeEvent: TNotifyEvent;
     FIsUpdating: boolean;

     function  GetText: WideString;
     procedure SetText(const Value: WideString);
     function  GetStrings(Index: Integer): WideString;
     procedure SetStrings(Index: Integer; const Value: WideString);
protected
     procedure SetStrAtPos(Index: Integer; const S: WideString);
public
     constructor Create;
     destructor Destroy; override;
     function  Count: Integer;
     procedure Clear;
     function  Add(const S: WideString): Integer;
     function  IndexOf(const S: WideString): Integer;
     procedure Insert(Index: Integer; const S: WideString);
     procedure Delete(Index: integer);
     procedure BeginUpdate;
     procedure EndUpdate;
     procedure Sort;

     property Strings[Index: Integer]: WideString read GetStrings write SetStrings; default;
     property Text: WideString read GetText write SetText;
     property OnChange: TNotifyEvent read FChangeEvent write FChangeEvent;
     end;

type TXLSValueWideStringList = class(TXLSWideStringList)
private
     function  GetValue(Index: integer): WideString;
     function  GetValueName(Index: integer): WideString;
     procedure SetValue(Index: integer; const Value: WideString);
     procedure SetValueName(Index: integer; const Value: WideString);
protected
     FSepChar: WideChar;
public
     constructor Create;
     function  AddSkipFirstWord(const S: WideString): Integer;
     function  PrefixText(Prefix: WideString): WideString;

     property SeparatorChar: WideChar read FSepChar write FSepChar;
     property ValueName[Index: integer]: WideString read GetValueName write SetValueName;
     property Value[Index: integer]: WideString read GetValue write SetValue;
     end;

implementation

const
  LF = WideChar($000A); {Line feed}
  VT = WideChar($000B); {Vertical tab}
  FF = WideChar($000C); {Form feed}
  CR = WideChar($000D); {Carriage return}
  LS = WideChar($2028); {Line separator}
  PS = WideChar($2029); {Pararaph separator}

{ TXLSWideStringList }

function TXLSWideStringList.Add(const S: WideString): Integer;
var
  PWS: ^TWSRec;
begin
  New(PWS);
  PWS^.WS := S;
  Result := FStrings.Add(PWS);
  if not FIsUpdating and Assigned(FChangeEvent) then
    FChangeEvent(Self);
end;

procedure TXLSWideStringList.BeginUpdate;
begin
  FIsUpdating := True;
end;

procedure TXLSWideStringList.Clear;
var
  i: integer;
  PWS: ^TWSRec;
begin
  for i := 0 to FStrings.Count - 1 do begin
    PWS := FStrings.Items[i];
    if PWS <> nil then
      Dispose(PWS);
  end;
  FStrings.Clear;
  if not FIsUpdating and Assigned(FChangeEvent) then
    FChangeEvent(Self);
end;

function TXLSWideStringList.Count: Integer;
begin
  Result := FStrings.Count;
end;

constructor TXLSWideStringList.Create;
begin
  FStrings := TList.Create;
end;

procedure TXLSWideStringList.Delete(Index: integer);
var
  PWS: ^TWSRec;
begin
  if (Index < 0) or (Index >= FStrings.Count) then
    raise Exception.Create('Index out of range');
  PWS := FStrings.Items[Index];
  if PWS <> nil then
    Dispose(PWS);
  FStrings.Delete(Index);
  if not FIsUpdating and Assigned(FChangeEvent) then
    FChangeEvent(Self);
end;

destructor TXLSWideStringList.Destroy;
begin
  Clear;
  FStrings.Free;
  inherited Destroy;
end;

procedure TXLSWideStringList.EndUpdate;
begin
  FIsUpdating := False;
  if Assigned(FChangeEvent) then
    FChangeEvent(Self);
end;

function TXLSWideStringList.GetStrings(Index: Integer): WideString;
var
  PWS: ^TWSRec;
begin
  PWS := FStrings.Items[Index];
  if PWS <> nil then
    Result := PWS^.WS
  else
    Result := '';
end;

function TXLSWideStringList.GetText: WideString;
var
  i,Sz,L: integer;
  P: PWideChar;
  S: WideString;
begin
  Sz := 0;
  for i := 0 to Count - 1 do
    Inc(Sz,Length(Strings[i]) + 2);
  SetLength(Result,Sz);
  P := Pointer(Result);
  for i := 0 to Count - 1 do begin
    S := Strings[i];
    L := Length(S);
    if L <> 0 then  begin
      Move(Pointer(S)^, P^, 2 * L);
      Inc(P,L);
    end;
    P^ := CR;
    Inc(P);
    P^ := LF;
    Inc(P);
  end;
end;

function TXLSWideStringList.IndexOf(const S: WideString): Integer;
var
  PWS: ^TWSRec;
begin
  for Result := 0 to FStrings.Count - 1 do begin
    PWS := FStrings.Items[Result];
    if (PWS <> nil) and (S = PWS^.WS) then
      Exit;
  end;
  Result := -1;
end;

procedure TXLSWideStringList.Insert(Index: Integer; const S: WideString);
var
  PWS: ^TWSRec;
begin
  if((Index < 0) or (Index > FStrings.Count)) then
    raise Exception.Create('Index out of range');
  New(PWS);
  PWS^.WS := S;
  FStrings.Insert(Index,PWS);
  if not FIsUpdating and Assigned(FChangeEvent) then
    FChangeEvent(Self);
end;

procedure TXLSWideStringList.SetStrAtPos(Index: Integer; const S: WideString);
var
  PWS: ^TWSRec;
begin
  if((Index < 0) or (Index > FStrings.Count)) then
    raise Exception.Create('Index out of range');
  if Index < FStrings.Count then begin
    PWS := FStrings.Items[Index];
    if PWS <> nil then
      PWS.WS := S;
  end
  else
    Add(S);
  if not FIsUpdating and Assigned(FChangeEvent) then
    FChangeEvent(Self);
end;

procedure TXLSWideStringList.SetStrings(Index: Integer; const Value: WideString);
begin
  SetStrAtPos(Index,Value);
end;

procedure TXLSWideStringList.SetText(const Value: WideString);
var
  i,j,Sz: integer;
begin
  Clear;
  Sz := Length(Value);
  i := 1;
  while i <= Sz do begin
    j := i;
    while (i <= Sz) and (Value[i] <> LF) and (Value[i] <> VT) and (Value[i] <> FF) and (Value[i] <> CR) and (Value[i] <> LS) and (Value[i] <> PS) do
      Inc(i);
    Add(Copy(Value,j,i - j));
    if i < Sz then begin
      Inc(i);
      if (Value[i] = LF) or (Value[i] = CR) then
        Inc(i);
    end;
  end;
end;

procedure TXLSWideStringList.Sort;

function ComparValue(V1,V2: WideString): integer;
var
  S1,S2: string;
  F1,F2: extended;
begin
  S1 := V1;
  S2 := V2;
  if TextToFloat(PChar(S1), F1, fvExtended) and TextToFloat(PChar(S2), F2, fvExtended) then begin
    F1 := F1 - F2;
    if F1 < 0 then
      Result := -1
    else if F1 > 0 then
      Result := 1
    else
      Result := 0;
  end
  else
{$ifdef OLD_COMPILER}
    Result := AnsiCompareStr(V1,V2) * 100;
{$else}
    Result := WideCompareStr(V1,V2) * 100;
{$endif}
end;

procedure QuickSort(L,R: integer);
var
  i,J: integer;
  S,T: WideString;
begin
  repeat
    I := L;
    J := R;
    S := GetStrings((L + R) shr 1);
    repeat
      while ComparValue(GetStrings(I),S) < 0 do Inc(I);
      while ComparValue(GetStrings(J),S) > 0 do Dec(J);
      if I <= J then
      begin
        T := GetStrings(I);
        SetStrings(I,GetStrings(J));
        SetStrings(J,T);
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then QuickSort(L,J);
      L := I;
  until I >= R;
end;

begin
  QuickSort(0,Count - 1);
end;

{ TXLSValueWideStringList }

function TXLSValueWideStringList.AddSkipFirstWord(const S: WideString): Integer;
var
  p: integer;
begin
  p := Pos(' ',S);
  if p > 1 then
    Result := Add(Trim(Copy(S,p + 1,MAXINT)))
  else
    Result := Add(S);
end;

constructor TXLSValueWideStringList.Create;
begin
  inherited Create;
  FSepChar := '=';
end;

function TXLSValueWideStringList.GetValue(Index: integer): WideString;
var
  p: integer;
  S: WideString;
begin
  S := GetStrings(Index);
  p := Pos(FSepChar,S);
  if p > 0 then
    Result := Trim(Copy(S,p + 1,MAXINT))
  else
    Result := S;
end;

function TXLSValueWideStringList.GetValueName(Index: integer): WideString;
var
  p: integer;
  S: WideString;
begin
  S := GetStrings(Index);
  p := Pos(FSepChar,S);
  if p > 0 then
    Result := Trim(Copy(S,1,p - 1))
  else
    Result := S;
end;

function TXLSValueWideStringList.PrefixText(Prefix: WideString): WideString;
var
  i,Sz,L: integer;
  P: PWideChar;
  S: WideString;
begin
  Sz := 0;
  for i := 0 to Count - 1 do
    Inc(Sz,Length(Prefix) + 1 + Length(Strings[i]) +  + 2);
  SetLength(Result,Sz);
  P := Pointer(Result);
  for i := 0 to Count - 1 do begin
    S := Prefix + ' ' + Strings[i];
    L := Length(S);
    if L <> 0 then  begin
      Move(Pointer(S)^, P^, 2 * L);
      Inc(P,L);
    end;
    P^ := CR;
    Inc(P);
    P^ := LF;
    Inc(P);
  end;
end;

procedure TXLSValueWideStringList.SetValue(Index: integer; const Value: WideString);
var
  p: integer;
  S: WideString;
begin
  S := GetStrings(Index);
  p := Pos(FSepChar,S);
  if p > 0 then
    SetStrAtPos(Index,Copy(S,1,p) + Value)
  else
    SetStrAtPos(Index,S + FSepChar + Value);
end;

procedure TXLSValueWideStringList.SetValueName(Index: integer; const Value: WideString);
var
  p: integer;
  S: WideString;
begin
  S := GetStrings(Index);
  p := Pos(FSepChar,S);
  if p > 0 then
    SetStrAtPos(Index,Value + Copy(S,p,MAXINT))
  else
    SetStrAtPos(Index,Value);
end;

end.
