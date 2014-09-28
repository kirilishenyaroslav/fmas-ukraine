unit uMatasMDIFormsBar;

interface

uses
  SysUtils, Classes, Forms, dxBar;

type
  TMDIActiveFormChange = procedure (Sender : TObject);

  TMDIBtnRecord = packed record
   Btn : TdxBarButton;
   FName : string;
   Form : TForm;
  end;

  TMDIBtnArray = array of TMDIBtnRecord;

  TMDIToolBar = class
  private
   MDIBtnArray : TMDIBtnArray;
   PItemLinkBeginGroup:integer;
  protected
   { Protected declarations }
  public
   NumBtn     : integer;
   BarManager : TdxBarManager;
   SubItem    : TdxBarSubItem;

   constructor Create(AOwner:TdxBarSubItem);overload;
   constructor Create(AOwner:TdxBarManager);overload;

   procedure  DelArraysCell(Num : integer);
   procedure  MDIActiveFormChange(Sender : TObject);
   procedure  OnMDIBtnClick(Sender : TObject);
   procedure  CloseWindAll;
  end;


implementation

constructor TMDIToolBar.Create(AOwner:TdxBarManager);
var Bar : TdxBar;
begin
 BarManager:=AOwner;
 SubItem:=nil;
 Screen.OnActiveFormChange := MDIActiveFormChange;

 Bar := BarManager.Bars.Add;

 with Bar do begin
  Name                  := 'MDIBar';
  caption               := 'ѕанель в≥кон';
  DockingStyle          := dsBottom;
  AllowClose            := False;
  AllowCustomizing      := False;
  AllowQuickCustomizing := False;
  AllowReset            := False;
  MultiLine             := True;
  UseRestSpace          := True;
  Visible := True;
 end;
end;

constructor TMDIToolBar.Create(AOwner:TdxBarSubItem);
begin
 SubItem:=AOwner;
 BarManager:= SubItem.BarManager;
 Screen.OnActiveFormChange := MDIActiveFormChange;
end;

procedure TMDIToolBar.DelArraysCell(Num : integer);
var
 i : integer;
begin
 if Num > Length(MDIBtnArray) - 1 then Exit;

 for i := Num to Length(MDIBtnArray) - 2 do
   MDIBtnArray[i] := MDIBtnArray[i + 1];

 SetLength(MDIBtnArray, Length(MDIBtnArray) - 1);

 if (SubItem<>nil) and (Length(MDIBtnArray)>0) then
   SubItem.ItemLinks.Items[PItemLinkBeginGroup].BeginGroup:=true;
end;

procedure TMDIToolBar.MDIActiveFormChange(Sender: TObject);
var
 i, j     : integer;
 Flag     : boolean;
 Deleted  : boolean;
 DelArray : array of integer;
 strCaption: string;
 nb: integer;
begin
 DelArray := nil;

 if ((Screen.ActiveForm = nil) and ((BarManager.Owner as TForm).MDIChildCount = 0))
 or (csDestroying in (BarManager.Owner as TForm).ComponentState) then begin
  for i := 0 to Length(MDIBtnArray) - 1 do begin
   MDIBtnArray[i].Btn.Destroy;
   SetLength(DelArray, Length(DelArray) + 1);
   DelArray[Length(DelArray) - 1] := i;
  end;

  for i := Length(DelArray) - 1 downto 0 do DelArraysCell(DelArray[i]);

  Exit;
 end
 else if (Screen.ActiveForm = nil) and ((BarManager.Owner as TForm).MDIChildCount > 0) then Exit;

 if Screen.ActiveForm.FormStyle <> fsMDIChild then Exit;

 DelArray := nil;

 Flag := False;

 for i := 0 to Length(MDIBtnArray) - 1 do
  if Screen.ActiveForm.Name = MDIBtnArray[i].FName then begin
   MDIBtnArray[i].Btn.Down := True;
   Flag := True;
  end
  else begin
   Deleted := True;
   for j := 0 to (BarManager.Owner as TForm).MDIChildCount - 1 do begin
    if (BarManager.Owner as TForm).MDIChildren[j].Name = MDIBtnArray[i].FName then begin
     if csDestroying in (BarManager.Owner as TForm).MDIChildren[j].ComponentState then Break;

     if MDIBtnArray[i].Btn.Down then MDIBtnArray[i].Btn.Down := False;
     Deleted := False;
     Break;
    end;
   end;

   if Deleted or (MDIBtnArray[i].FName = '') then begin
     MDIBtnArray[i].Btn.Destroy;
    SetLength(DelArray, Length(DelArray) + 1);
    DelArray[Length(DelArray) - 1] := i;
   end;
  end;

 for i := Length(DelArray) - 1 downto 0 do DelArraysCell(DelArray[i]);

 if not Flag then begin
  SetLength(MDIBtnArray, Length(MDIBtnArray) + 1);
  Inc(NumBtn);

  with MDIBtnArray[Length(MDIBtnArray) - 1] do begin
   Btn := TdxBarButton.Create(BarManager);

   with Btn do begin
    Name    := 'MDIBtn_' + IntToStr(NumBtn);
    OnClick := OnMDIBtnClick;

    strCaption:=Screen.ActiveForm.Caption;
    nb:=Pos('::',strCaption);
    if nb>0 then strCaption:=Copy(strCaption, nb+3, 35);

    if SubItem<>nil then Caption := strCaption
    else
    if Length(strCaption) < 35 then
     Caption     := strCaption
    else
     Caption := Copy(strCaption, 1, 34);

    Hint        := Screen.ActiveForm.Caption;
    ButtonStyle := bsChecked;
    Down        := True;

    OnClick     := OnMDIBtnClick;

    Visible     := ivAlways;
   end;

   FName := Screen.ActiveForm.Name;
   Form  := Screen.ActiveForm;
  end;

  if SubItem<> nil then
   with BarManager.BarByName('Main Menu'), SubItem.ItemLinks do begin
    LockUpdate := True;

    with Add  do begin
     Item := MDIBtnArray[Length(MDIBtnArray) - 1].Btn;
     Index := AvailableItemCount - 1;
     if (Length(MDIBtnArray) = 1) then
      begin
       BeginGroup:=(Length(MDIBtnArray) = 1);
       PItemLinkBeginGroup:=Count-1;
      end;
     BringToTopInRecentList(False);
    end;

    LockUpdate := False;
   end
  else
   with BarManager.BarByName('MDIBar'),  ItemLinks do begin
    LockUpdate := True;

    with Add  do begin
     Item := MDIBtnArray[Length(MDIBtnArray) - 1].Btn;
     Index := BarManager.BarByName('MDIBar').ItemLinks.AvailableItemCount - 1;
     BringToTopInRecentList(False);
    end;

    LockUpdate := False;
   end;
 end;
end;

procedure TMDIToolBar.OnMDIBtnClick(Sender: TObject);
var
 i, j : integer;
 Flag : boolean;
 b    : boolean;
begin
 Flag := False;
 b    := False;
 for i := 0 to Length(MDIBtnArray) - 1 do
  if MDIBtnArray[i].Btn.Name = (Sender as TdxBarButton).Name then begin
   b := True;

   for j := 0 to ((Sender as TdxBarButton).BarManager.Owner as TForm).MDIChildCount - 1 do
    if ((Sender as TdxBarButton).BarManager.Owner as TForm).MDIChildren[j].Name = MDIBtnArray[i].FName then begin
     with ((Sender as TdxBarButton).BarManager.Owner as TForm).MDIChildren[j] do begin
      if WindowState = wsMinimized then WindowState := wsNormal;
      if not Active then Show;
      (Sender as TdxBarButton).Down := True;
     end;

     Flag := True;
    end;

   Break;
  end;

 if Flag then Exit;

 (Sender as TdxBarButton).Destroy;

 if b then DelArraysCell(i);
end;

procedure TMDIToolBar.CloseWindAll;
var i:integer;
begin
 for i:=Length(MDIBtnArray)-1 downto 0 do MDIBtnArray[i].Form.Close;
end;

end.
