unit AssociationList;

interface
  uses AssociationListConst, AssociationListUtils;

type
  TStringAssociationList = class(TObject)
  private
    FCapacity: Integer;
    FKeys: PStringItemList;
    FValues: PPointerItemList;
    FCount: Integer;
    FCaseSensitive: Boolean;
    FOwnValues: Boolean;
    procedure SetCapacity(NewCapacity: Integer);
    function GetItem(const Key: string): Pointer;
    function SearchFirstGE(const Key: string): Integer;
    procedure SetItem(const Key: string; Value: Pointer);
  public
    constructor Create(CaseSensitive: Boolean; InitialCapacity: Integer = 0);
    destructor Destroy; override;
    property Count: Integer read FCount write FCount;
    property Items[const Key: string]: Pointer read GetItem write SetItem; default;
    property Capacity: Integer read FCapacity write SetCapacity;
    property CaseSensitive: Boolean read FCaseSensitive;
    property OwnValues: Boolean read FOwnValues write FOwnValues;
    property KeyList: PStringItemList read FKeys;
    property ValueList: PPointerItemList read FValues;
    procedure EnsureCapacity(Capacity: Integer);
    function IndexOf(const Key: string): Integer;
    procedure Add(const Key: string; Value: Pointer);
    procedure Remove(const Key: string);
    procedure RemoveAt(Index: Integer); overload;
    procedure RemoveAt(Index, Count: Integer); overload;
    procedure Clear(SuppressDisposingValues: Boolean = False);
    procedure TrimToSize;
  end;

implementation

{ TStringAssociationList }
constructor TStringAssociationList.Create(CaseSensitive: Boolean;
  InitialCapacity: Integer);
begin
     FCapacity := InitialCapacity;
     FCaseSensitive := CaseSensitive;
     if (InitialCapacity > 0)
     then begin
               GetMem(FKeys, InitialCapacity * SizeOf(Pointer));
               GetMem(FValues, InitialCapacity * SizeOf(Pointer));
     end;
end;

destructor TStringAssociationList.Destroy;
begin
  if FCapacity > 0 then
  begin
    Clear(False);
    FreeMem(FKeys);
    FreeMem(FValues);
  end;
end;

procedure TStringAssociationList.SetCapacity(NewCapacity: Integer);
var
  NewKeys: PStringItemList;
  NewValues: PPointerItemList;
begin
  if (NewCapacity <> FCapacity) and (NewCapacity >= FCount) then
  begin
    if NewCapacity > 0 then
    begin
      GetMem(NewKeys, NewCapacity * SizeOf(Pointer));
      GetMem(NewValues, NewCapacity * SizeOf(Pointer));
      if FCount > 0 then
      begin
        G_CopyLongs(FKeys, NewKeys, FCount);
        G_CopyLongs(FValues, NewValues, FCount);
      end;
    end else
    begin
      NewKeys := nil;
      NewValues := nil;
    end;
    if FCapacity > 0 then
    begin
      FreeMem(FKeys);
      FreeMem(FValues);
    end;
    FCapacity := NewCapacity;
    FKeys := NewKeys;
    FValues := NewValues;
  end;
end;

function TStringAssociationList.GetItem(const Key: string): Pointer;
var
  L: Integer;
begin
  L := IndexOf(Key);
  if L >= 0 then
    Result := FValues^[L]
  else
    Result := nil;
end;

function TStringAssociationList.SearchFirstGE(const Key: string): Integer;
var
  L, H, I: Integer;
begin
  L := 0;
  H := FCount - 1;
  if not FCaseSensitive then
    while L <= H do
    begin
      I := (L + H) shr 1;
      if G_CompareText(FKeys^[I], Key) < 0 then
        L := I + 1
      else
        H := I - 1;
    end
  else
    while L <= H do
    begin
      I := (L + H) shr 1;
      if G_CompareStr(FKeys^[I], Key) < 0 then
        L := I + 1
      else
        H := I - 1;
    end;
  Result := L;
end;

procedure TStringAssociationList.SetItem(const Key: string; Value: Pointer);
var
  L: Integer;
  O: Pointer;
begin
  L := SearchFirstGE(Key);
  if (L < FCount) and (FKeys^[L] = Key) then
  begin
    if not FOwnValues then
      FValues^[L] := Value
    else
    begin
      O := FValues^[L];
      if O <> Value then
      begin
        FValues^[L] := Value;
        TObject(O).Free;
      end;
    end;
  end else
  begin
    if FCount >= FCapacity then
      SetCapacity(G_EnlargeCapacity(FCapacity));
    if L < FCount then
    begin
      G_MoveLongs(@FKeys^[L], @FKeys^[L + 1], FCount - L);
      G_MoveLongs(@FValues^[L], @FValues^[L + 1], FCount - L);
    end;
    Pointer(FKeys^[L]) := nil;
    FKeys^[L] := Key;
    FValues^[L] := Value;
    Inc(FCount);
  end;
end;

procedure TStringAssociationList.EnsureCapacity(Capacity: Integer);
begin
  if FCapacity < Capacity then
    SetCapacity(G_NormalizeCapacity(Capacity));
end;

function TStringAssociationList.IndexOf(const Key: string): Integer;
var
  L, H, I, C: Integer;
begin
  L := 0;
  H := FCount - 1;
  if not FCaseSensitive then
    while L <= H do
    begin
      I := (L + H) shr 1;
      C := G_CompareText(FKeys^[I], Key);
      if C < 0 then
        L := I + 1
      else
      begin
        if C = 0 then
        begin
          Result := I;
          Exit;
        end;
        H := I - 1;
      end;
    end
  else
    while L <= H do
    begin
      I := (L + H) shr 1;
      C := G_CompareStr(FKeys^[I], Key);
      if C < 0 then
        L := I + 1
      else
      begin
        if C = 0 then
        begin
          Result := I;
          Exit;
        end;
        H := I - 1;
      end;
    end;
  Result := -1;
end;

procedure TStringAssociationList.Add(const Key: string; Value: Pointer);
var
  L: Integer;
begin
  L := SearchFirstGE(Key);
  if (L < FCount) and (FKeys^[L] = Key) then
    RaiseErrorFmt(SErrKeyDuplicatesInAssociationList, 'TStringAssociationList');
  if FCount >= FCapacity then
    SetCapacity(G_EnlargeCapacity(FCapacity));
  if L < FCount then
  begin
    G_MoveLongs(@FKeys^[L], @FKeys^[L + 1], FCount - L);
    G_MoveLongs(@FValues^[L], @FValues^[L + 1], FCount - L);
  end;
  Pointer(FKeys^[L]) := nil;
  FKeys^[L] := Key;
  FValues^[L] := Value;
  Inc(FCount);
end;

procedure TStringAssociationList.Remove(const Key: string);
var
  L: Integer;
begin
  L := IndexOf(Key);
  if L >= 0 then
    RemoveAt(L);
end;

procedure TStringAssociationList.RemoveAt(Index: Integer);
begin
  if LongWord(Index) >= LongWord(FCount) then
    RaiseError(SErrIndexOutOfRange);
  if FOwnValues then
    TObject(FValues^[Index]).Free;
  FKeys^[Index] := '';
  Dec(FCount);
  if Index < FCount then
  begin
    G_MoveLongs(@FKeys^[Index + 1], @FKeys^[Index], FCount - Index);
    G_MoveLongs(@FValues^[Index + 1], @FValues^[Index], FCount - Index);
  end;
end;

procedure TStringAssociationList.RemoveAt(Index, Count: Integer);
var
  I: Integer;
begin
  if LongWord(Index) > LongWord(FCount) then
    RaiseError(SErrIndexOutOfRange);
  if LongWord(Index + Count) >= LongWord(FCount) then
  begin
    for I := FCount - 1 downto Index do
    begin
      if FOwnValues then
        TObject(FValues^[I]).Free;
      FKeys^[I] := '';
    end;
    FCount := Index;
  end
  else if Count > 0 then
  begin
    for I := Index + Count - 1 downto Index do
    begin
      if FOwnValues then
        TObject(FValues^[I]).Free;
      FKeys^[I] := '';
    end;
    Dec(FCount, Count);
    G_MoveLongs(@FKeys^[Index + Count], @FKeys^[Index], FCount - Index);
    G_MoveLongs(@FValues^[Index + Count], @FValues^[Index], FCount - Index);
  end;
end;

procedure TStringAssociationList.Clear(SuppressDisposingValues: Boolean);
var
  I: Integer;
begin
  for I := FCount - 1 downto 0 do
  begin
    if FOwnValues and not SuppressDisposingValues then
      TObject(FValues^[I]).Free;
    FKeys^[I] := '';
  end;
  FCount := 0;
end;

procedure TStringAssociationList.TrimToSize;
begin
  if FCount < FCapacity then
    SetCapacity(FCount);
end;


end.
