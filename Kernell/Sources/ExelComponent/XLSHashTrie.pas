unit XLSHashTrie;

{
  Delphi implementation of HashTrie dynamic hashing method
  Full description available on www.softlab.od.ua

  Delphi 2,3,4,5
  Freware with source. 

  Copyright (c) 2000-2001, SoftLab MIL-TEC Ltd
  Web:   http://www.softcomplete.com
  Email: support@softcomplete.com

  THIS SOFTWARE AND THE ACCOMPANYING FILES ARE DISTRIBUTED 
  "AS IS" AND WITHOUT WARRANTIES AS TO PERFORMANCE OF MERCHANTABILITY OR 
  ANY OTHER WARRANTIES WHETHER EXPRESSED OR IMPLIED.
  NO WARRANTY OF FITNESS FOR A PARTICULAR PURPOSE IS OFFERED.
  THE USER MUST ASSUME THE ENTIRE RISK OF USING THE ACCOMPANYING CODE.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions: 

  1. The origin of this software must not be misrepresented, you must 
     not claim that you wrote the original software. If you use this software 
     in a product, an acknowledgment in the product documentation 
     would be appreciated but is not required. 
  2. Altered source versions must be plainly marked as such, and must not be 
     misrepresented as being the original software.
  3. Original copyright may not be removed or altered from any source 
     distribution.
  4. All copyright of HashTrie dynamic hashing method belongs to Andre N Belokon, 
     SoftLab MIL-TEC Ltd.

  Changes to original HashTrie Copyright (c) 2004, Axolot Data.     
}


interface

uses Windows, SysUtils;

const
  // DON'T CHANGE LeafSize VALUE !!! MUST BE EQ 256
  // because some code optimization used
  LeafSize = 256;
  // determines max length of the list
  // very big|small values decrease performance
  // optimum value in range 4..16
  BucketSize = 8;

type PXLSString = ^TXLSString;
     TXLSString = record
     Index: integer;
     RefCount: integer;
     Len: word;
     Options: byte;
     Data: record end;
     end;

type
  TLinkedItem = class
private
    Value: DWORD;
    Next: TLinkedItem;
public
    constructor Create(FValue: DWORD; FNext: TLinkedItem);
    destructor Destroy; override;
  end;

  THashTrie = class; // forward
  TTraverseProc = procedure (UserData,UserProc: Pointer;
    Value: DWORD; var Done: Boolean) of object;

  TTreeItem = class
private
    Owner: THashTrie;
    Level: integer;
    Filled: integer;
    Items: array[0..LeafSize-1] of TObject;
    function ROR(Value: DWORD): DWORD;
    function RORN(Value: DWORD; Level: integer): DWORD;
    procedure AddDown(Value,Hash: DWORD);
    procedure Delete(Value,Hash: DWORD);
    function Find(Value,Hash: DWORD): Boolean;
    function FindVal(Value,Hash: DWORD): Pointer;
    function Traverse(UserData,UserProc: Pointer; TraverseProc: TTraverseProc): Boolean;
    function GetCount(var Count: integer): Boolean;
    procedure Clear;
public
    constructor Create(AOwner: THashTrie);
    destructor Destroy; override;
  end;

  THashTrie = class(TObject)
  private
    Root: TTreeItem;
  protected
    function HashValue(Value: DWORD): DWORD; virtual; abstract;
    procedure DestroyItem(var Value: DWORD); virtual; abstract;
    function CompareValue(Value1,Value2: DWORD): Boolean; virtual; abstract;
    procedure AddDown(Value,Hash: DWORD);
    procedure Delete(Value,Hash: DWORD);
    function Find(Value,Hash: DWORD): Boolean;
    function FindVal(Value,Hash: DWORD): Pointer;
    procedure Traverse(UserData,UserProc: Pointer; TraverseProc: TTraverseProc);
  public
    constructor Create;
    destructor Destroy; override;
    procedure  ClearTree;
    function  Count: integer;
  end;

  TSSTHashTraverseProc = procedure (UserData: Pointer; const Value: PXLSString; var Done: Boolean);
  TSSTHashTraverseMeth = procedure (UserData: Pointer; const Value: PXLSString; var Done: Boolean) of object;

  TSSTHashTrie = class(THashTrie)
private
protected
    function HashValue(Value: DWORD): DWORD; override;
    procedure DestroyItem(var Value: DWORD); override;
    function CompareValue(Value1,Value2: DWORD): Boolean; override;
    function HashStr(P: PXLSString): DWORD;
    procedure TraverseProc(UserData,UserProc: Pointer; Value: DWORD; var Done: Boolean);
    procedure TraverseMeth(UserData,UserProc: Pointer; Value: DWORD; var Done: Boolean);
    function  GetSize(Value: PXLSString): integer; virtual; abstract;
    function  GetDataPointer(Value: PXLSString): PByteArray; virtual; abstract;
public
    function  Add(P: PXLSString): PXLSString;
    procedure Delete(P: PXLSString);
    function  FindVal(P: PXLSString; Hash: DWORD): PXLSString;
    procedure Traverse(UserData: Pointer; UserProc: TSSTHashTraverseProc); overload;
    procedure Traverse(UserData: Pointer; UserProc: TSSTHashTraverseMeth); overload;
    end;

function CalcStrCRC32(const S: string): DWORD;

implementation

{ TTreeItem }

procedure TTreeItem.AddDown(Value, Hash: DWORD);
var i,j: integer;
    TreeItem: TTreeItem;
    LinkedItem: TLinkedItem;
begin
  i:=Hash and $FF;
  if Items[i] = nil then begin
    Items[i]:=TLinkedItem.Create(Value,nil);
    Inc(Filled);
  end else if Items[i] is TTreeItem then begin
    TTreeItem(Items[i]).AddDown(Value,ROR(Hash));
  end else begin
    j:=0;
    LinkedItem:=TLinkedItem(Items[i]);
    while LinkedItem <> nil do begin
      if Owner.CompareValue(LinkedItem.Value,Value) then begin
        // found
        Exit;
      end;
      LinkedItem:=LinkedItem.Next;
      Inc(j)
    end;
    if j >= BucketSize then begin
      // full
      TreeItem:=TTreeItem.Create(Owner);
      TreeItem.Level:=Level+1;
      LinkedItem:=TLinkedItem(Items[i]);
      while LinkedItem <> nil do begin
        TreeItem.AddDown(LinkedItem.Value, 
                         RORN(Owner.HashValue(LinkedItem.Value), Level+1));
        LinkedItem:=LinkedItem.Next;
      end;
      TreeItem.AddDown(Value,ROR(Hash));
      TLinkedItem(Items[i]).Free;
      Items[i]:=TreeItem;
    end else
      Items[i]:=TLinkedItem.Create(Value,TLinkedItem(Items[i]));
  end;
end;

procedure TTreeItem.Clear;
var
  j: integer;
  LinkedItem: TLinkedItem;
begin
  for j:=0 to LeafSize-1 do begin
    if Items[j] <> nil then begin
      if Items[j] is TTreeItem then begin
        TTreeItem(Items[j]).Free;
        Items[j] := Nil;
      end
      else begin
        LinkedItem:=TLinkedItem(Items[j]);
        while LinkedItem <> nil do begin
          Owner.DestroyItem(LinkedItem.Value);
          LinkedItem:=LinkedItem.Next;
        end;
        TLinkedItem(Items[j]).Free;
        Items[j] := Nil;
      end;
    end;
  end;
end;

constructor TTreeItem.Create(AOwner: THashTrie);
var j: integer;
begin
  Owner:=AOwner;
  Level:=0;
  Filled:=0;
  for j:=0 to LeafSize-1 do Items[j]:=nil;
end;

procedure TTreeItem.Delete(Value, Hash: DWORD);
var i: integer;
    PrevLinkedItem,LinkedItem: TLinkedItem;
begin
  i:=Hash and $FF;
  if Items[i] = nil then begin
    Exit;
  end else if Items[i] is TTreeItem then begin
    TTreeItem(Items[i]).Delete(Value,ROR(Hash));
    if TTreeItem(Items[i]).Filled = 0 then begin
      TTreeItem(Items[i]).Free;
      Items[i]:=nil;
    end;
  end else begin
    PrevLinkedItem:=nil;
    LinkedItem:=TLinkedItem(Items[i]);
    while LinkedItem <> nil do begin
      if Owner.CompareValue(LinkedItem.Value,Value) then begin
        // found
        if PrevLinkedItem = nil then begin
          Items[i]:=LinkedItem.Next;
          if Items[i] = nil then
            Dec(Filled);
        end else
          PrevLinkedItem.Next:=LinkedItem.Next;
        LinkedItem.Next:=nil;
        Owner.DestroyItem(LinkedItem.Value);
        LinkedItem.Free;
        Exit;
      end;
      PrevLinkedItem:=LinkedItem;
      LinkedItem:=LinkedItem.Next;
    end;
  end;
end;

destructor TTreeItem.Destroy;
begin
  Clear;
  inherited;
end;

function TTreeItem.Find(Value, Hash: DWORD): Boolean;
var i: integer;
    LinkedItem: TLinkedItem;
begin
  Result:=False;
  i:=Hash and $FF;
  if Items[i] = nil then begin
    Exit;
  end else if Items[i] is TTreeItem then begin
    Result:=TTreeItem(Items[i]).Find(Value,ROR(Hash));
  end else begin
    LinkedItem:=TLinkedItem(Items[i]);
    while LinkedItem <> nil do begin
      if Owner.CompareValue(LinkedItem.Value,Value) then begin
        // found
        Result:=True;
        Exit;
      end;
      LinkedItem:=LinkedItem.Next;
    end;
  end;
end;

function TTreeItem.FindVal(Value, Hash: DWORD): Pointer;
var i: integer;
    LinkedItem: TLinkedItem;
begin
  Result:=Nil;
  i:=Hash and $FF;
  if Items[i] = nil then begin
    Exit;
  end else if Items[i] is TTreeItem then begin
    Result:=TTreeItem(Items[i]).FindVal(Value,ROR(Hash));
  end else begin
    LinkedItem:=TLinkedItem(Items[i]);
    while LinkedItem <> nil do begin
      if Owner.CompareValue(LinkedItem.Value,Value) then begin
        // found
        Result:=Pointer(LinkedItem.Value);
        Exit;
      end;
      LinkedItem:=LinkedItem.Next;
    end;
  end;
end;

function TTreeItem.GetCount(var Count: integer): Boolean;
var j: integer;
    LinkedItem: TLinkedItem;
begin
  Result := False;
  for j:=0 to LeafSize-1 do
    if Items[j] <> nil then begin
      if Items[j] is TTreeItem then begin
        Result := TTreeItem(Items[j]).GetCount(Count);
      end else begin
        LinkedItem := TLinkedItem(Items[j]);
        while LinkedItem <> nil do begin
          Inc(Count);
          LinkedItem:=LinkedItem.Next;
        end;
      end;
      if Result then
        Exit;
    end;
end;

function TTreeItem.ROR(Value: DWORD): DWORD;
begin
  Result:=((Value and $FF) shl 24) or ((Value shr 8) and $FFFFFF);
end;

function TTreeItem.RORN(Value: DWORD; Level: integer): DWORD;
begin
  Result:=Value;
  while Level > 0 do begin
    Result:=ROR(Result);
    Dec(Level);
  end;
end;

function TTreeItem.Traverse(UserData,UserProc: Pointer;
  TraverseProc: TTraverseProc): Boolean;
var j: integer;
    LinkedItem: TLinkedItem;
begin
  Result:=False;
  for j:=0 to LeafSize-1 do
    if Items[j] <> nil then begin
      if Items[j] is TTreeItem then begin
        Result:=TTreeItem(Items[j]).Traverse(UserData,UserProc,TraverseProc);
      end else begin
        LinkedItem:=TLinkedItem(Items[j]);
        while LinkedItem <> nil do begin
          TraverseProc(UserData,UserProc,LinkedItem.Value,Result);
          LinkedItem:=LinkedItem.Next;
        end;
      end;
      if Result then Exit;
    end;
end;

{ TLinkedItem }

constructor TLinkedItem.Create(FValue: DWORD; FNext: TLinkedItem);
begin
  Value:=FValue;
  Next:=FNext;
end;

destructor TLinkedItem.Destroy;
begin
  if Next <> nil then
    Next.Free;
end;

{ THashTrie }

procedure THashTrie.AddDown(Value,Hash: DWORD);
begin
  if Root = nil then
    Root:=TTreeItem.Create(Self);
  Root.AddDown(Value,Hash);
end;

procedure THashTrie.Delete(Value,Hash: DWORD);
begin
  if Root <> nil then
    Root.Delete(Value,Hash);
end;

function THashTrie.Find(Value,Hash: DWORD): Boolean;
begin
  if Root <> nil then
    Result:=Root.Find(Value,Hash)
  else
    Result:=False;
end;

constructor THashTrie.Create;
begin
  inherited;
  Root:=nil;
end;

destructor THashTrie.Destroy;
begin
  if Root <> nil then Root.Free;
  inherited;
end;

procedure THashTrie.Traverse(UserData, UserProc: Pointer;
  TraverseProc: TTraverseProc);
begin
  if Root <> nil then
    Root.Traverse(UserData, UserProc, TraverseProc);
end;

function THashTrie.FindVal(Value, Hash: DWORD): Pointer;
begin
  if Root <> nil then
    Result:=Root.FindVal(Value,Hash)
  else
    Result:=Nil;
end;

procedure THashTrie.ClearTree;
begin
  if Root <> Nil then
    Root.Clear;
end;

{ dynamic crc32 table }

const
  CRC32_POLYNOMIAL = $EDB88320;
var
  Ccitt32Table: array[0..255] of DWORD;

function CalcStrCRC32(const S: string): DWORD;
var j: integer;
begin
  Result:=$FFFFFFFF;
  for j:=1 to Length(S) do
    Result:= (((Result shr 8) and $00FFFFFF) xor (Ccitt32Table[(Result xor byte(S[j])) and $FF]));
end;

function CalcStrCRC32P(const P: Pointer; Len: integer): DWORD;
var j: integer;
begin
  Result:=$FFFFFFFF;
  for j:=0 to Len - 1 do
    Result:= (((Result shr 8) and $00FFFFFF) xor (Ccitt32Table[(Result xor PByteArray(P)[j]) and $FF]));
end;

procedure BuildCRCTable;
var i, j: longint;
    value: DWORD;
begin
  for i := 0 to 255 do begin
    value := i;
    for j := 8 downto 1 do
      if ((value and 1) <> 0) then
        value := (value shr 1) xor CRC32_POLYNOMIAL
      else
        value := value shr 1;
    Ccitt32Table[i] := value;
  end
end;

function THashTrie.Count: integer;
begin
  Result := 0;
  if Root <> nil then
    Root.GetCount(Result);
end;

{ TSSTHashTrie }

function TSSTHashTrie.Add(P: PXLSString): PXLSString;
var
  Hash: DWORD;
begin
  Hash := HashStr(P);
  Result := FindVal(P,Hash);
  if Result <> Nil then begin
    Inc(Result.RefCount);
    FreeMem(P);
  end
  else begin
    AddDown(DWORD(P),Hash);
    Result := P;
  end;
end;

function TSSTHashTrie.CompareValue(Value1, Value2: DWORD): Boolean;
var
  Sz1,Sz2: integer;
begin
  Sz1 := GetSize(PXLSString(Value1));
  Sz2 := GetSize(PXLSString(Value2));
  if Sz1 = Sz2 then
    Result := CompareMem(GetDataPointer(Pointer(Value1)),GetDataPointer(Pointer(Value2)),Sz1)
  else
    Result := False;
end;

procedure TSSTHashTrie.Delete(P: PXLSString);
var
  FoundStr: PXLSString;
begin
  FoundStr := FindVal(P,HashStr(P));
  if FoundStr <> Nil then begin
    Dec(FoundStr.RefCount);
    if FoundStr.RefCount <= 0 then
      inherited Delete(DWORD(P),HashStr(P));
  end;
end;

procedure TSSTHashTrie.DestroyItem(var Value: DWORD);
begin
  FreeMem(Pointer(Value));
end;

function TSSTHashTrie.FindVal(P: PXLSString; Hash: DWord): PXLSString;
begin
  Result := inherited FindVal(DWORD(P),Hash);
end;

function TSSTHashTrie.HashStr(P: PXLSString): DWORD;
begin
  Result:=CalcStrCRC32P(GetDataPointer(P),GetSize(P));
end;

function TSSTHashTrie.HashValue(Value: DWORD): DWORD;
begin
  Result:=CalcStrCRC32P(Pointer(Value),GetSize(Pointer(Value)));
end;

procedure TSSTHashTrie.Traverse(UserData: Pointer; UserProc: TSSTHashTraverseProc);
begin
  inherited Traverse(UserData,@UserProc,TraverseProc);
end;

procedure TSSTHashTrie.Traverse(UserData: Pointer; UserProc: TSSTHashTraverseMeth);
begin
  inherited Traverse(UserData,@TMethod(UserProc),TraverseMeth);
end;

procedure TSSTHashTrie.TraverseMeth(UserData, UserProc: Pointer; Value: DWORD; var Done: Boolean);
type
  PTSSTHashTraverseMeth = ^TSSTHashTraverseMeth;
begin
  PTSSTHashTraverseMeth(UserProc)^(UserData,PXLSString(Value),Done);
end;

procedure TSSTHashTrie.TraverseProc(UserData, UserProc: Pointer; Value: DWORD; var Done: Boolean);
begin
  TSSTHashTraverseProc(UserProc)(UserData,PXLSString(Value),Done);
end;

initialization
  BuildCRCTable;
end.
