unit BsMemoFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxClasses, cxTextEdit, cxLabel, cxDBLookupComboBox, cxCheckBox,
  cxCalendar, cxDropDownEdit, cxMemo, cxCurrencyEdit;

type
    TBsMemoFilter=class(TForm)
    private
        curIndex, nComponents:Smallint;
        arParams:array of Variant;
        NameComponents:array of string;
        FormFilter:TComponent;
    public
       constructor Create(NameComp:string; FForm:TComponent);reintroduce;
       procedure SetParams;
       function MoveOnIndex(Undo:Boolean):Boolean;
       function FillComponents:Boolean;
       function EnableBtn(isUndo:Boolean):Boolean;
       function GetValueByNameComponent(NameComponent:string):Variant;
       function GetValueByNameComponentEx(NameComponent:string):Variant;
       function FilterArrayIsNil:Boolean;
       function FilterUndo:Boolean;
       function FilterRedo:Boolean;
  end;

implementation

constructor TBsMemoFilter.Create(NameComp:string; FForm:TComponent);
var i:Smallint;
begin
   Self.curIndex:=0;
   if Trim(NameComp)='' then Self.nComponents:=0
   else
   begin
      Self.nComponents:=1;
      SetLength(Self.NameComponents,Self.nComponents);
      for i:=1 to Length(NameComp) do
      begin
         if NameComp[i]<>';' then
            Self.NameComponents[Self.nComponents-1]:=Self.NameComponents[Self.nComponents-1]+NameComp[i]
         else
         begin
            Inc(Self.nComponents);
            SetLength(Self.NameComponents, Self.nComponents);
         end;
      end;
   end;
   FormFilter:=FForm;

end;

function TBsMemoFilter.GetValueByNameComponent(NameComponent:string):Variant;
begin
      if FormFilter.FindComponent(NameComponent) is TcxTextEdit then
         Result:=(FormFilter.FindComponent(NameComponent) as TcxTextEdit).Text
      else if FormFilter.FindComponent(NameComponent) is TcxCheckBox then
              Result:=(FormFilter.FindComponent(NameComponent) as TcxCheckBox).Checked
           else if FormFilter.FindComponent(NameComponent) is TcxDateEdit then
                   Result:=(FormFilter.FindComponent(NameComponent) as TcxDateEdit).Date
                else if FormFilter.FindComponent(NameComponent) is TcxLookupComboBox then
                        Result:=(FormFilter.FindComponent(NameComponent) as TcxLookupComboBox).EditValue
                     else if FormFilter.FindComponent(NameComponent) is TcxComboBox then
                             Result:=(FormFilter.FindComponent(NameComponent) as TcxComboBox).EditValue
                          else if FormFilter.FindComponent(NameComponent) is TcxMemo then
                                  Result:=(FormFilter.FindComponent(NameComponent) as TcxMemo).Text
                               else if FormFilter.FindComponent(NameComponent) is TcxCurrencyEdit then
                                    Result:=(FormFilter.FindComponent(NameComponent) as TcxCurrencyEdit).Value;
end;

function TBsMemoFilter.GetValueByNameComponentEx(NameComponent:string):Variant;
var i:SmallInt;
    v:Variant;
begin
   v:=Self.arParams[Self.curIndex];
   for i:=0 to Self.nComponents-1 do
   begin
      if Self.NameComponents[i]=NameComponent then
      begin
         Result:=v[i];
         Break;
      end;
   end;

end;

procedure TBsMemoFilter.SetParams;
var i:SmallInt;
    v:Variant;
begin
   if Self.arParams=nil then SetLength(Self.arParams, 1)
   else SetLength(Self.arParams, Length(Self.arParams)+1);
   Self.curIndex:=Length(Self.arParams)-1;
   v:=VarArrayCreate([0, Self.nComponents-1], varVariant);
   for i:=0 to Self.nComponents-1 do
   begin
      v[i]:=GetValueByNameComponent(Self.NameComponents[i]);
   end;
   Self.arParams[Self.curIndex]:=v;
end;


function TBsMemoFilter.FilterUndo:Boolean;
begin
  Result:=False;
  if Self.curIndex>0 then
  begin
     Dec(Self.curIndex);
     Result:=True;
  end;
end;

function TBsMemoFilter.FilterRedo:Boolean;
begin
   Result:=False;
   if Self.curIndex<Length(Self.arParams) then
   begin
      Inc(Self.curIndex);
      Result:=True;
   end;
end;

function TBsMemoFilter.MoveOnIndex(Undo:Boolean):Boolean;
begin
   if not Undo then
   begin
     if Self.curIndex>=Length(Self.arParams) then
     begin
       Result:=False;
     end
     else
     begin
        Result:=True;
        Inc(Self.curIndex);
     end;
   end
   else
   begin
     if Self.curIndex<=0 then
     begin
        Result:=False;
     end
     else
     begin
        Result:=True;
        Dec(Self.curIndex);
     end;
   end;
end;

function TBsMemoFilter.FillComponents:Boolean;
var i:SmallInt;
    v:Variant;
begin
   try
     v:=arParams[curIndex];
     for i:=0 to Self.nComponents-1 do
     begin
        if FormFilter.FindComponent(Self.NameComponents[i]) is TcxTextEdit then
           (FormFilter.FindComponent(Self.NameComponents[i]) as TcxTextEdit).Text:=v[i]
        else if FormFilter.FindComponent(Self.NameComponents[i]) is TcxCheckBox then
                (FormFilter.FindComponent(Self.NameComponents[i]) as TcxCheckBox).Checked:=v[i]
             else if FormFilter.FindComponent(Self.NameComponents[i]) is TcxDateEdit then
                     (FormFilter.FindComponent(Self.NameComponents[i]) as TcxDateEdit).Date:=v[i]
                   else if FormFilter.FindComponent(Self.NameComponents[i]) is TcxComboBox then
                           (FormFilter.FindComponent(Self.NameComponents[i]) as TcxComboBox).EditValue:=v[i]
                        else if FormFilter.FindComponent(Self.NameComponents[i]) is TcxMemo then
                                (FormFilter.FindComponent(Self.NameComponents[i]) as TcxMemo).Text:=v[i]
                             else if FormFilter.FindComponent(Self.NameComponents[i]) is TcxCurrencyEdit then
                                  (FormFilter.FindComponent(Self.NameComponents[i]) as TcxCurrencyEdit).Value:=v[i];
     end;
     Result:=True;
   except
      Result:=False;
   end;
end;

function TBsMemoFilter.EnableBtn(isUndo:Boolean):Boolean;
begin
   Result:=False;
   if isUndo then
   begin
      if curIndex in [1..Length(Self.arParams)-1] then Result:=True;
   end
   else
   begin
      if curIndex in [0..Length(Self.arParams)-2] then Result:=True;
   end;
end;


function TBsMemoFilter.FilterArrayIsNil:Boolean;
begin
   if Self.arParams=nil then Result:=True
   else Result:=False;
end;

end.
