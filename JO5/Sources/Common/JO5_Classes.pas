unit JO5_Classes;

interface
uses Classes,IBase,Controls, cxDBTL, cxTL, Jo5_Types;

type
 TRegValue=class(TObject)
 public
     id_reg:Integer;
 end;

 TJo5RegTreeCast = class(TObject)
 private
  pSelected:Variant;
  pArrayOpened:TArrayVariant;
 public
  procedure GetCast(Nodes:TcxTreeListNodes;KeyCmn:TcxDBTreeListColumn);
  procedure UseCastOnTree(KeyCmn:TcxDBTreeListColumn;var Nodes:TcxTreeListNodes;var SelectedNum:Integer);
end;

implementation

procedure TJo5RegTreeCast.GetCast(Nodes:TcxTreeListNodes;KeyCmn:TcxDBTreeListColumn );
var i,Total,Count:Integer;
  TempArr:TArrayVariant;
begin
  Count:=0;
  Total:=Nodes.Count;
  SetLength(TempArr,Total);
  for i:=0 to Total-1 do
   begin
    if Nodes.Items[i].Expanded then
     begin
      TempArr[Count]:=KeyCmn.Values[i];
      Count:=Count+1;
     end;
    if Nodes.Items[i].Selected then
      pSelected:=KeyCmn.Values[i];
   end;
  SetLength(pArrayOpened,Count);
  for i:=0 to Count-1 do
    pArrayOpened[i]:=TempArr[i];
end;

procedure TJo5RegTreeCast.UseCastOnTree(KeyCmn:TcxDBTreeListColumn;var Nodes:TcxTreeListNodes;var SelectedNum:Integer);
var i,j,Total,Count:Integer;
begin
  if pArrayOpened<>nil then
    begin
      Count:=Length(pArrayOpened);
      Total:=KeyCmn.ValueCount;
      for i:=0 to Count-1 do
        for j:=0 to Total-1 do
         begin
          if pArrayOpened[i]=KeyCmn.Values[j] then
            Nodes.Items[j].Expand(False);
          if KeyCmn.Values[j]=pSelected then
            SelectedNum:=j;
         end;
    end;
end;

end.
