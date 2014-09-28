unit ASUP_LoaderPrintDocs_Types;

interface

uses IBase,Classes,SysUtils;

type TESavedItem = class(Exception);

Type TSavedItem = record
 Id:integer;
 Kod:string;
 Text:string;
end;

Type TIndexSavedItem = 0..5;

Type TSavedItems = class
 protected
  PArraySavedItems : array[1..5] of TSavedItem;
  PCount:TIndexSavedItem;
 private
  function GetSavedItem(Index:TIndexSavedItem):TSavedItem;
 public
  constructor Create;reintroduce;
  procedure AddSavedItem(ASavedItem:TSavedItem);overload;
  procedure AddSavedItem(ASavedItem:string);overload;
  function IndexByKodAndText(KodAndText:String):TIndexSavedItem;
  function IndexById(Id:Integer):TIndexSavedItem;
  property SavedItem[Index: TIndexSavedItem]:TSavedItem read GetSavedItem;
  property Count:TIndexSavedItem read PCount;
end;

Type TSavedItemsForSave = class(TSavedItems)
  public
   procedure AddSavedItem(ASavedItem:string);reintroduce;
   function StringForSave:String;
end;

Type TSimpleParam = class(TObject)
 public
  DB_Handle:TISC_DB_HANDLE;
  Owner:TComponent;
end;

Type TSimpleParamWithType = class(TSimpleParam)
 public
  IdType:Variant;
end;

implementation


//*********************     TSavedItems     *********************************//

constructor TSavedItems.Create;
begin
 inherited Create;
 PCount:=0;
end;

function TSavedItems.IndexById(Id:Integer):TIndexSavedItem;
 var i:TIndexSavedItem;
begin
 for i:=1 to PCount do
  if PArraySavedItems[i].Id=Id then
   begin
    Result:=i;
    Exit;
   end;
  Result:=0;
end;

function TSavedItems.IndexByKodAndText(KodAndText:String):TIndexSavedItem;
 var i:TIndexSavedItem;
begin
 for i:=1 to PCount do
  if Trim(PArraySavedItems[i].Kod+' - '+PArraySavedItems[i].Text)=Trim(KodAndText) then
   begin
    Result:=i;
    Exit;
   end;
  Result:=0;
end;

procedure TSavedItems.AddSavedItem(ASavedItem:String);
var PSavedItem:TSavedItem;
    Str:String;
    PStrSaveItem:string;
begin
 PStrSaveItem:= ASavedItem;
 Str:=copy(PStrSaveItem,1,pos('%',PStrSaveItem)-1);
 if Str='' then raise TESavedItem.Create('Id not found!');
 PSavedItem.Id:=StrToInt(Str);
 delete(PStrSaveItem,1,pos('%',PStrSaveItem));
 Str:=copy(PStrSaveItem,1,pos('%',PStrSaveItem)-1);
 PSavedItem.Kod:=Str;
 delete(PStrSaveItem,1,pos('%',PStrSaveItem));
 PSavedItem.Text:=PStrSaveItem;
 AddSavedItem(PSavedItem);
end;

procedure TSavedItems.AddSavedItem(ASavedItem:TSavedItem);
var i:integer;
begin
 for i:=High(TIndexSavedItem) downto 2 do PArraySavedItems[i]:=PArraySavedItems[i-1];
 PArraySavedItems[1]:=ASavedItem;
 if PCount<>5 then Inc(PCount);
end;

function TSavedItems.GetSavedItem(Index: TIndexSavedItem):TSavedItem;
begin
 Result:=PArraySavedItems[Index];
end;

//*********************  TSavedItemsForSave  *********************************//
procedure TSavedItemsForSave.AddSavedItem(ASavedItem:string);
var PSavedItem:TSavedItem;
    Str:String;
    PStrSaveItem:string;
    i,index:TIndexSavedItem;
begin
 PStrSaveItem:= ASavedItem;
 Str:=copy(PStrSaveItem,1,pos('%',PStrSaveItem)-1);
 if Str='' then raise TESavedItem.Create('Id not found!');
 PSavedItem.Id:=StrToInt(Str);
 delete(PStrSaveItem,1,pos('%',PStrSaveItem));
 Str:=copy(PStrSaveItem,1,pos('%',PStrSaveItem)-1);
 PSavedItem.Kod:=Str;
 delete(PStrSaveItem,1,pos('%',PStrSaveItem));
 PSavedItem.Text:=PStrSaveItem;
 index := IndexById(PSavedItem.Id);
 if index<>0 then
  begin
   for i:=index to High(TIndexSavedItem)-1 do
    PArraySavedItems[i]:=PArraySavedItems[i+1];
   dec(PCount);
  end;  
 inherited AddSavedItem(PSavedItem);
end;

function TSavedItemsForSave.StringForSave:String;
var i:TIndexSavedItem;
begin
 for i:=1 to PCount do
  if Result<>'' then  Result:=Result+'@@@'+IntToStr(PArraySavedItems[i].Id)+'%'+PArraySavedItems[i].Kod+'%'+PArraySavedItems[i].Text
  else Result:= IntToStr(PArraySavedItems[i].Id)+'%'+PArraySavedItems[i].Kod+'%'+PArraySavedItems[i].Text;
end;

end.
