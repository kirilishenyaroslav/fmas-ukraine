unit ZcxFilterBar;

interface

uses

  SysUtils, Classes, Forms, dxBar, pFIBDataSet,DB, Unit_ZGlobal_Consts,
  ZProc, Menus, Z_Images_DM, dxBarExtItems, Dates, ZMessages, Dialogs;



type TzFilterBarPeriods = class
  protected
   procedure fOnYear1SpinEditCurChange(Sender:TObject);
   procedure fOnYear2SpinEditCurChange(Sender:TObject);
  private
   pBar:TdxBar;
   pBarManager:TdxBarManager;
   pFilterBtn:TdxBarButton;
   pYear1SpinEdit:TdxBarSpinEdit;
   pYear2SpinEdit:TdxBarSpinEdit;
   pMonth1Combo:TdxBarCombo;
   pMonth2Combo:TdxBarCombo;
   pSeparatorStatic:TdxBarStatic;

   pDMImage:TDMImages;
   pLanguageIndex:Byte;

   procedure SetKodSetup1(KodSetup:Integer);
   procedure SetKodSetup2(KodSetup:Integer);
   function GetKodSetup1:Integer;
   function GetKodSetup2:Integer;
   procedure SetKodSetup2Visible(AVisible:TdxBarItemVisible);
   function GetKodSetup2Visible:TdxBarItemVisible;
  public
   constructor Create(ABarManager:TdxBarManager;ABar:TdxBar=nil);
   destructor Destroy;override;

   property Bar:TdxBar read pBar;
   property BarManager:TdxBarManager read PBarManager;
   property FilterBtn:TdxBarButton read pFilterBtn;
   property KodSetupBeg:Integer read GetKodSetup1 write SetKodSetup1;
   property KodSetupEnd:Integer read GetKodSetup2 write SetKodSetup2;
   property KodSetup2Visible:TdxBarItemVisible read GetKodSetup2Visible write SetKodSetup2Visible;
end;

implementation

constructor TzFilterBarPeriods.Create(ABarManager:TdxBarManager;ABar:TdxBar=nil);
begin
 inherited Create;
 PLanguageIndex:=LanguageIndex;

 PBarManager := ABarManager;

 if PBarManager.Images=nil then
  begin
   PDMImage:=TDMImages.Create(ABarManager.Owner as TForm);
   PBarManager.Images := PDMImage.Images;
  end;

 if ABar=nil then
  pBar := PBarManager.Bars.Add
 else
  pBar:=ABar;

 with pBar do
  begin
   Name                  := 'zBarFilter';

   caption               := FilterBtn_Caption[pLanguageIndex];
   DockingStyle          := dsBottom;

   AllowClose            := False;
   AllowCustomizing      := False;
   AllowQuickCustomizing := False;
   AllowReset            := False;

   NotDocking            := [dsNone,dsLeft,dsTop,dsRight,dsBottom];

   MultiLine             := True;
   UseRestSpace          := True;
   Visible               := True;
  end;

   pMonth1Combo     := TdxBarCombo.Create(PBarManager);
   pYear1SpinEdit   := TdxBarSpinEdit.Create(PBarManager);
   pMonth2Combo     := TdxBarCombo.Create(PBarManager);
   pYear2SpinEdit   := TdxBarSpinEdit.Create(PBarManager);
   pFilterBtn       := TdxBarButton.Create(PBarManager);
   pSeparatorStatic := TdxBarStatic.Create(pBarManager);

   with pMonth1Combo do begin
    Name          := 'pMonth1Combo';
    Caption       := LabelMonth_Caption[pLanguageIndex];
    Hint          := Caption;
    Visible       := ivAlways;
    ShowCaption   := False;
    Items.Text    := MonthesList_Text[pLanguageIndex];
    DropDownCount := 12;
    ShowEditor    := False;
//    ReadOnly      := True;
   end;

   with pMonth2Combo do begin
    Name        := 'pMonth2Combo';
    Caption     := LabelMonth_Caption[pLanguageIndex];
    Hint        := Caption;
    Visible     := ivAlways;
    ShowCaption := False;
    Items.Text  := MonthesList_Text[pLanguageIndex];
    DropDownCount := 12;
    ShowEditor    := False;
//    ReadOnly      := True;
   end;

   with pSeparatorStatic do begin
    Name        := 'pSeparatorStatic';
    Caption     := ' - ';
    Hint        := '';
    Visible     := ivAlways;
    ShowCaption := True;
    AllowClick  := True;
   end;

   with pYear1SpinEdit do begin
    Name        := 'pYear1SpinEdit';
    Caption     := LabelYear_Caption[pLanguageIndex];
    Hint        := Caption;
    Visible     := ivAlways;
    ShowCaption := False;
    MinValue    := 2000;
    MaxValue    := 2100;
    OnCurChange := fOnYear1SpinEditCurChange;
   end;

   with pYear2SpinEdit do begin
    Name        := 'pYear2SpinEdit';
    Caption     := LabelYear_Caption[pLanguageIndex];
    Hint        := Caption;
    Visible     := ivAlways;
    ShowCaption := False;
    MinValue    := 2000;
    MaxValue    := 2100;
    OnCurChange := fOnYear2SpinEditCurChange;
   end;

   with pFilterBtn do begin
    Name              := 'pFilterBtn';
    Caption           := FilterBtn_Caption[pLanguageIndex];
    Hint              := Caption;
    ButtonStyle       := bsDefault;
    PaintStyle        := psCaptionGlyph;
    UnclickAfterDoing := True;
    Visible           := ivAlways;
    ShortCut:=119; //F8
    ImageIndex  := PDMImage.ImageIndexByName(zbiFilter);
   end;

  with Bar, ItemLinks do begin
   LockUpdate := True;

   with Add  do begin
    Item := pMonth1Combo;
    Index := AvailableItemCount - 1;
    BringToTopInRecentList(False);
   end;

   with Add  do begin
    Item := pYear1SpinEdit;
    Index := AvailableItemCount - 1;
    BringToTopInRecentList(False);
   end;

   with Add  do begin
    Item := pSeparatorStatic;
    Index := AvailableItemCount - 1;
    BringToTopInRecentList(False);
   end;

   with Add  do begin
    Item := pMonth2Combo;
    Index := AvailableItemCount - 1;
    BringToTopInRecentList(False);
   end;

   with Add  do begin
    Item := pYear2SpinEdit;
    Index := AvailableItemCount - 1;
    BringToTopInRecentList(False);
   end;

   with Add  do begin
    Item := pFilterBtn;
    Index := AvailableItemCount - 1;
    BeginGroup := True;
    BringToTopInRecentList(False);
   end;

   LockUpdate := False;
  end;

end;

destructor TzFilterBarPeriods.Destroy;
begin
 pFilterBtn.Destroy;
 pYear1SpinEdit.Destroy;
 pYear2SpinEdit.Destroy;
 pMonth1Combo.Destroy;
 pMonth2Combo.Destroy;
 inherited Destroy;
end;

procedure TzFilterBarPeriods.SetKodSetup1(KodSetup:Integer);
begin
 pYear1SpinEdit.IntValue :=  YearMonthFromKodSetup(KodSetup);
 pMonth1Combo.ItemIndex :=  YearMonthFromKodSetup(KodSetup,False)-1;
end;

procedure TzFilterBarPeriods.SetKodSetup2(KodSetup:Integer);
begin
 pYear2SpinEdit.IntValue :=  YearMonthFromKodSetup(KodSetup);
 pMonth2Combo.ItemIndex :=  YearMonthFromKodSetup(KodSetup,False)-1;
end;

function TzFilterBarPeriods.GetKodSetup1:Integer;
begin
 Result:=PeriodToKodSetup(pYear1SpinEdit.IntValue,pMonth1Combo.ItemIndex+1);
end;

function TzFilterBarPeriods.GetKodSetup2:Integer;
begin
 Result:=PeriodToKodSetup(pYear2SpinEdit.IntValue,pMonth2Combo.ItemIndex+1);
end;

procedure TzFilterBarPeriods.fOnYear1SpinEditCurChange(Sender:TObject);
begin
 pYear1SpinEdit.Value := pYear1SpinEdit.CurValue;
end;

procedure TzFilterBarPeriods.fOnYear2SpinEditCurChange(Sender:TObject);
begin
 pYear2SpinEdit.Value := pYear2SpinEdit.CurValue;
end;

procedure TzFilterBarPeriods.SetKodSetup2Visible(AVisible:TdxBarItemVisible);
begin
 pSeparatorStatic.Visible := AVisible;
 pYear2SpinEdit.Visible   := AVisible;
 pMonth2Combo.Visible     := AVisible;
end;

function TzFilterBarPeriods.GetKodSetup2Visible:TdxBarItemVisible;
begin
 Result := pSeparatorStatic.Visible;
end;

end.
