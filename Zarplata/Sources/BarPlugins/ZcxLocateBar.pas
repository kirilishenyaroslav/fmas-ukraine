unit ZcxLocateBar;

interface

uses

  SysUtils, Classes, Forms, dxBar, pFIBDataSet,DB, Unit_ZGlobal_Consts,
  ZProc, Menus, Z_Images_DM, dxBarExtItems, Dates, ZMessages, Dialogs;

type EzcxBarLocate = class(Exception);

type TZItemLocate = record
 NameField:string;
 Caption:string;
 LocateOptions:TLocateOptions;
end;

type TZLocateItems = class
 private
  PCount:integer;
  PItems:array of TZItemLocate;
 protected
  function GetItem(Index:integer):TZItemLocate;
 public
  constructor Create;
  property Count:integer read PCount;
  function Add(ItemLocate:TZItemLocate):TZItemLocate;
  function ItemByIndex(Index:Integer):TZItemLocate;
  property ItemLocate[Index:Integer]:TZItemLocate read GetItem;
end;



type TZBarLocate = class

  private

   Bar:TdxBar;
   PLocateItems:TZLocateItems;
   PBarManager:TdxBarManager;
   PDataSet:TpFiBDataSet;
   PLocateBtn:TdxBarButton;
   PLocateNextBtn:TdxBarButton;
   PTextEditLocate:TdxBarEdit;
   PComboFieldsLocate:TdxBarCombo;

   PDigitalField:string;

   PDigitalFieldIndex:integer;
   PNonDigitalFieldIndex:integer;

   PDMImage:TDMImages;

   PNewComboIndex:Integer;
   PLanguageIndex:Byte;

   PCurrentLocateItem:TZItemLocate;
   PCurrentLocateItemIndex:integer;
   PTextEditCurText:string;
  protected

   procedure OnLocateBtnClick(Sender : TObject);
   procedure OnLocateNextBtnClick(Sender : TObject);
   procedure OnTextEditLocateKeyUp(Sender: TObject; var Key: Word;Shift: TShiftState);
   procedure OnTextEditKeyPress(Sender: TObject; var Key: Char);
   procedure OnComboChange(Sender: TObject);
   procedure OnTextEditExit(Sender: TObject);
   procedure OnTextEditCurChange(Sender: TObject);

   procedure SetDataSet(ADataSet:TpFIBDataSet);
   procedure SetDigitalField(NameField:string);
   procedure SetComboVisible(AVisible:boolean);
   function  GetComboVisible:boolean;
   function  GetDockControl:TdxBarDockControl;
   procedure SetDockControl(ADockControl:TdxBarDockControl);
   procedure SetBorderStyle(BorderStyle:TdxBarBorderStyle);
   function  GetBorderStyle:TdxBarBorderStyle;
  public

   constructor Create(ABarManager:TdxBarManager;ABar:TdxBar=nil);

   property LocateItems:TZLocateItems read PLocateItems write PLocateItems;
   property BarManager:TdxBarManager read PBarManager;
   property DataSet:TpFIBDataSet read PDataSet  write SetDataSet;
   property LocateBtn:TdxBarButton read PLocateBtn write PLocateBtn;
   property LocateNextBtn:TdxBarButton read PLocateNextBtn write PLocateNextBtn;
   property DigitalField:String read PDigitalField write SetDigitalField;
   property FieldSelectVisible:boolean read GetComboVisible write SetComboVisible;
   property BorderStyle:TdxBarBorderStyle read GetBorderStyle write SetBorderStyle;
   property DockControl:TdxBarDockControl read GetDockControl write SetDockControl;

   procedure AddLocateItem(LocateItem:TZItemLocate);overload;
   procedure AddLocateItem(NameField:string;Caption:string;LocateOptions:TLocateOptions);overload;
   procedure Default;
end;

implementation

function TZLocateItems.GetItem(Index:Integer):TZItemLocate;
begin
 Result:=PItems[Index];
end;

procedure TZBarLocate.SetBorderStyle(BorderStyle:TdxBarBorderStyle);
begin
 Bar.BorderStyle := BorderStyle;
end;

function TZBarLocate.GetBorderStyle:TdxBarBorderStyle;
begin
 result:=Bar.BorderStyle;
end;

function TZBarLocate.GetDockControl:TdxBarDockControl;
begin
 Result:=Bar.DockControl;
end;

procedure TZBarLocate.SetDockControl(ADockControl:TdxBarDockControl);
begin
 Bar.NotDocking := [];
 Bar.DockedDockControl:=ADockControl;
 Bar.DockControl:= ADockControl;
 Bar.NotDocking := [dsNone,dsLeft,dsTop,dsRight,dsBottom];
end;

constructor TZBarLocate.Create(ABarManager:TdxBarManager;ABar:TdxBar=nil);
begin
 inherited Create;
 PLanguageIndex:=LanguageIndex;

 PLocateItems:=TZLocateItems.Create;

 PBarManager := ABarManager;

 if PBarManager.Images=nil then
  begin
   PDMImage:=TDMImages.Create(ABarManager.Owner as TForm);
   PBarManager.Images := PDMImage.Images;
  end;

 if ABar=nil then
  Bar := PBarManager.Bars.Add
 else
  Bar:=ABar;

 with Bar do begin
  Name                  := 'zBarLocate';
  caption               := 'Пошук';
  DockingStyle          := dsBottom;

//  BorderStyle := bbsNone;

  AllowClose            := False;
  AllowCustomizing      := False;
  AllowQuickCustomizing := False;
  AllowReset            := False;

  NotDocking            := [dsNone,dsLeft,dsTop,dsRight,dsBottom];

  MultiLine             := True;
  UseRestSpace          := True;
  Visible               := True;
 end;

   PTextEditLocate  := TdxBarEdit.Create(PBarManager);
   PComboFieldsLocate := TdxBarCombo.Create(PBarManager);
   PLocateBtn := TdxBarButton.Create(PBarManager);
   PLocateNextBtn := TdxBarButton.Create(PBarManager);


   with PTextEditLocate do begin
    Name    := 'TextEditLocate';
    OnKeyUp := OnTextEditLocateKeyUp;
    OnExit  := OnTextEditExit;
    OnCurChange := OnTextEditCurChange;
    Caption := Name;
    Hint        := Caption;
    Visible     := ivAlways;
    ShowCaption := False;
   end;

   with PComboFieldsLocate do begin
    Name    := 'ComboFieldsLocate';
    OnChange:= OnComboChange;
    Caption := Name;
    Hint    := Caption;
    Visible := ivAlways;
   end;

   with PLocateBtn do begin
    Name    := 'LocateBtn';
    OnClick := OnLocateBtnClick;
    Caption := Name;
    Hint        := Caption;
    ButtonStyle := bsDefault;
    PaintStyle := psCaptionGlyph;
    UnclickAfterDoing := True;
    Visible     := ivAlways;
    ShortCut:=118; //F7
    ImageIndex  := PDMImage.ImageIndexByName(zbiLocate);
   end;

   with PLocateNextBtn do begin
    Name    := 'LocateNextBtn';
    OnClick := OnLocateNextBtnClick;
    Caption := Name;
    Hint        := Caption;
    ButtonStyle := bsDefault;
    PaintStyle := psCaptionGlyph;
    UnclickAfterDoing := True;
    Visible     := ivAlways;
    ShortCut    := 16502;  //Ctrl+F7
    ImageIndex  := PDMImage.ImageIndexByName(zbiLocateNext);
   end;

  with Bar, ItemLinks do begin
   LockUpdate := True;

   with Add  do begin
    Item := PComboFieldsLocate;
    Index := AvailableItemCount - 1;
    BringToTopInRecentList(False);
   end;

   with Add  do begin
    Item := PTextEditLocate;
    Index := AvailableItemCount - 1;
    BeginGroup := True;
    BringToTopInRecentList(False);
   end;

   with Add  do begin
    Item := PLocateBtn;
    Index := AvailableItemCount - 1;
    BeginGroup := True;
    BringToTopInRecentList(False);
   end;

   with Add  do begin
    Item := PLocateNextBtn;
    Index := AvailableItemCount - 1;
    BeginGroup := True;
    BringToTopInRecentList(False);
   end;

   LockUpdate := False;
  end;

 Default;
end;

procedure TZBarLocate.SetComboVisible(AVisible:boolean);
begin
 if (not AVisible) and (PLocateItems.Count>1) then
  begin
   EzcxBarLocate.Create('This option for Locate Items Count =1');
   exit;
  end;
 if AVisible then
  PComboFieldsLocate.Visible:=ivAlways
 else PComboFieldsLocate.Visible:=ivNever;
end;

function TZBarLocate.GetComboVisible:boolean;
begin
 result:=(PComboFieldsLocate.Visible=ivAlways);
end;

procedure TZBarLocate.OnTextEditExit(Sender: TObject);
begin
 PTextEditLocate.Text:=PTextEditCurText;
 OnLocateBtnClick(Sender);
end;

procedure TZBarLocate.OnComboChange(Sender: TObject);
begin
 PCurrentLocateItem:=PLocateItems.ItemLocate[PComboFieldsLocate.ItemIndex];
end;

procedure TZBarLocate.OnTextEditKeyPress(Sender: TObject; var Key: Char);
begin
 PNewComboIndex:=-1;
 if (PLocateItems.Count<>2) or (key=#8) or (Key=#0) then exit;
 If (Key in ['0'..'9']) then
  begin
   if (PDigitalFieldIndex <> PCurrentLocateItemIndex)then
    begin
     PNewComboIndex:=PDigitalFieldIndex;
     PTextEditLocate.CurText:='';
    end;
  end
 else
  if (PNonDigitalFieldIndex <> PCurrentLocateItemIndex)then
   begin
     PNewComboIndex:=PNonDigitalFieldIndex;
     PTextEditLocate.CurText:='';
   end;
end;

procedure TZBarLocate.SetDigitalField(NameField:string);
var i:integer;
begin
 if PLocateItems.Count<>2 then
  EzcxBarLocate.Create('Operation defined only for count of locate items equals 2');

 PDigitalField:=NameField;
 if NameField<>'' then
  begin
   for I:=0 to PLocateItems.Count-1 do
    if PLocateItems.ItemByIndex(i).NameField=NameField then
     PDigitalFieldIndex:=i
    else
     PNonDigitalFieldIndex:=i;
   PTextEditLocate.OnKeyPress := OnTextEditKeyPress;
   PComboFieldsLocate.Visible := ivNever;
  end
 else
  begin
   PDigitalFieldIndex:=-1;
   PNonDigitalFieldIndex:=-1;
   PTextEditLocate.OnKeyPress := nil;
   PComboFieldsLocate.Visible := ivAlways;
   Bar.ItemLinks.Items[1].BeginGroup:=True;
  end;
end;

procedure TZBarLocate.Default;
begin
 PLocateBtn.Caption := LocateBtn_Caption[PLanguageIndex];
 PLocateBtn.Hint := PLocateBtn.Caption;
 PLocateNextBtn.Caption := LocateNextBtn_Caption[PLanguageIndex];
 PLocateNextBtn.Hint := PLocateNextBtn.Caption;
 PTextEditLocate.Hint := BarEditLocate_Hint[PLanguageIndex];
 PTextEditLocate.Caption := BarEditLocate_Caption[PLanguageIndex];
 PComboFieldsLocate.Hint := ComboNameFields_Hint[PLanguageIndex];
end;

function TZLocateItems.ItemByIndex(Index:Integer):TZItemLocate;
begin
 Result:=PItems[Index];
end;

procedure TZBarLocate.AddLocateItem(LocateItem:TZItemLocate);
begin
 if PDigitalField<>'' then
  begin
   EzcxBarLocate.Create('DigitalField was Defined!');
   Exit;
  end;
 if not GetComboVisible then
  begin
   EzcxBarLocate.Create('FieldsSelect isn''t visible!');
   Exit;
  end;

 PComboFieldsLocate.Items.Add(PLocateItems.Add(LocateItem).Caption);
 PComboFieldsLocate.ItemIndex:=0;
 PCurrentLocateItem:=PLocateItems.ItemLocate[0];
 PCurrentLocateItemIndex:=0;
end;

procedure TZBarLocate.AddLocateItem(NameField:string;Caption:string;LocateOptions:TLocateOptions);
var LocateItem:TZItemLocate;
begin
 if PDigitalField<>'' then
  begin
   EzcxBarLocate.Create('DigitalField was Defined!');
   Exit;
  end;
 if not GetComboVisible then
  begin
   EzcxBarLocate.Create('FieldsSelect isn''t visible!');
   Exit;
  end;

 LocateItem.NameField:=NameField;
 LocateItem.Caption := Caption;
 LocateItem.LocateOptions := LocateOptions;
 PComboFieldsLocate.Items.Add(PLocateItems.Add(LocateItem).Caption);
 PComboFieldsLocate.ItemIndex:=0;
 PCurrentLocateItem:=PLocateItems.ItemLocate[0];
 PCurrentLocateItemIndex:=0;
end;

procedure TZBarLocate.OnTextEditLocateKeyUp(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
 if PNewComboIndex>=0 then
  begin
   if PTextEditLocate.ShowCaption then
    begin
     PTextEditLocate.Caption := PLocateItems.ItemLocate[PNewComboIndex].Caption;
     PTextEditLocate.SetFocus;
    end;
   PCurrentLocateItem := PLocateItems.ItemLocate[PNewComboIndex];
   PCurrentLocateItemIndex := PNewComboIndex;
   PNewComboIndex := -1;
  end;
end;

procedure TZBarLocate.OnLocateBtnClick(Sender : TObject);
begin
 if (PDataSet=nil) or (not PDataSet.Active) or (PTextEditLocate.Text='') then exit;

 PDataSet.Locate(PCurrentLocateItem.NameField,
                 PTextEditLocate.Text,PCurrentLocateItem.LocateOptions);
end;

procedure TZBarLocate.OnLocateNextBtnClick(Sender : TObject);
begin
 if (PDataSet=nil) or (not PDataSet.Active) or (PTextEditLocate.Text='') then exit;
 PDataSet.LocateNext(PCurrentLocateItem.NameField,
                 PTextEditLocate.Text,PCurrentLocateItem.LocateOptions);
end;

procedure TZBarLocate.SetDataSet(ADataSet:TpFIBDataSet);
begin
 PDataSet:=ADataSet;
end;

function TZLocateItems.Add(ItemLocate:TZItemLocate):TZItemLocate;
begin
 inc(PCount);
 SetLength(PItems,PCount);
 PItems[PCount-1]:=ItemLocate;
 if ItemLocate.LocateOptions=[] then PItems[PCount-1].LocateOptions:=[loCaseInsensitive];
 result:=PItems[PCount-1];
end;

constructor TZLocateItems.Create;
begin
 inherited Create;
 PCount:=0;
end;

procedure TZBarLocate.OnTextEditCurChange(Sender: TObject);
begin
 PTextEditCurText:=PTextEditLocate.CurText;
end;

end.
