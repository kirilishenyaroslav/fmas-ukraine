{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clProgressBar;

interface

{$I clVer.inc}

uses
  Classes, clDC, clMultiDC, clDCUtils, Graphics, Windows, {$IFDEF DEMO}Forms,{$ENDIF} Controls;

type
  TclDrawPaintOption = (dpDrawTotal, dpDrawItems);
  TclDrawPaintOptions = set of TclDrawPaintOption;
  TclDrawOrientation = (doHorisontal, doVertical);
  TclDrawStyle = (ds3D, dsFlat);
  TclBorderStyle = (bsNone, bsFrame);
  TclStatusColor = array[TclProcessStatus] of TColor;
  TclProgressBarItemType = (gitFrame, gitBackGround, gitProcessTotal, gitProcessItem);
  TclColorScheme = (csSchemeCustom, csScheme1, csScheme2, csScheme3);

  TclProgressBarCustomDraw = procedure (Sender: TObject; AItemType: TclProgressBarItemType;
    ACanvas: TCanvas; ARect: TRect; AColor: TColor; var Handled: Boolean) of object;
  TclProgressBarPaint = procedure (Sender: TObject; var AState: TclResourceStateList) of object;

  TclProgressBar = class;
  TclDrawColors = class;

  TclStatusColors = class(TPersistent)
  private
    FOwner: TclDrawColors;
    FStatusColor: TclStatusColor;
    function GetStatusColor(const Index: Integer): TColor;
    procedure SetStatusColor(const Index: Integer; const Value: TColor);
  protected
    procedure SetStatusColors(AStatusColor: TclStatusColor);
  public
    constructor Create(AOwner: TclDrawColors);
    procedure Assign(Source: TPersistent); override;
    function GetStatusColors(): TclStatusColor;
  published
    property StatusUnknown: TColor index psUnknown read GetStatusColor write SetStatusColor;
    property StatusSuccess: TColor index psSuccess read GetStatusColor write SetStatusColor;
    property StatusFailed: TColor index psFailed read GetStatusColor write SetStatusColor;
    property StatusErrors: TColor index psErrors read GetStatusColor write SetStatusColor;
    property StatusProcess: TColor index psProcess read GetStatusColor write SetStatusColor;
    property StatusTerminated: TColor index psTerminated read GetStatusColor write SetStatusColor;
  end;

  TclDrawColors = class(TPersistent)
  private
    FBackGround: TColor;
    FOwner: TclProgressBar;
    FScheme: TclColorScheme;
    FFrame: TColor;
    FItemColors: TclStatusColors;
    FTotalColors: TclStatusColors;
    procedure SetBackGround(const Value: TColor);
    procedure SetScheme(const Value: TclColorScheme);
    procedure SetColorsByScheme;
    procedure SetFrame(const Value: TColor);
    procedure SetItemColors(const Value: TclStatusColors);
    procedure SetTotalColors(const Value: TclStatusColors);
    function ColorsStored(AColor1, AColor2: TclStatusColor): Boolean;
    function ItemColorsStored: Boolean;
    function TotalColorsStored: Boolean;
    function BackGroundStored: Boolean;
    function FrameStored: Boolean;
  protected
    procedure Changed(); virtual;
    procedure SetCustomScheme;
  public
    constructor Create(AOwner: TclProgressBar);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property BackGround: TColor read FBackGround write SetBackGround stored BackGroundStored;
    property Frame: TColor read FFrame write SetFrame stored FrameStored;
    property Scheme: TclColorScheme read FScheme write SetScheme default csScheme1;
    property ItemColors: TclStatusColors read FItemColors write SetItemColors stored ItemColorsStored;
    property TotalColors: TclStatusColors read FTotalColors write SetTotalColors stored TotalColorsStored;
  end;

  TclProgressBarNotifier = class(TclControlNotifier)
  private
    FProgressBar: TclProgressBar;
    FLastItem: TclInternetItem;
    function GetLastState(): TclResourceStateList;
  protected
    procedure DoResourceStateChanged(Item: TclInternetItem); override;
    procedure DoItemDeleted(Item: TclInternetItem); override;
  public
    constructor Create(AControl: TclCustomInternetControl; AProgressBar: TclProgressBar);
  end;

  TclProgressBar = class(TGraphicControl)
  private
    FOptions: TclDrawPaintOptions;
    FOrientation: TclDrawOrientation;
    FColors: TclDrawColors;
    FProgressSplit: Integer;
    FOnChanged: TNotifyEvent;
    FOnCustomDraw: TclProgressBarCustomDraw;
    FInternetControl: TclCustomInternetControl;
    FNotifier: TclProgressBarNotifier;
    FStyle: TclDrawStyle;
    FBorderStyle: TclBorderStyle;
    FOnPaint: TclProgressBarPaint;
    procedure DrawBackGround(ACanvas: TCanvas; ARect: TRect);
    procedure DrawFrame(ACanvas: TCanvas; ARect: TRect);
    procedure DrawProgressItems(AState: TclResourceStateList; ACanvas: TCanvas; ARect: TRect);
    procedure DrawTotalProgress(AState: TclResourceStateList; ACanvas: TCanvas; ARect: TRect);
    procedure DrawProgressItem(AState: TclResourceStateList; AItem: TclResourceStateItem;
      ACanvas: TCanvas; ARect: TRect);
    procedure PaintRect(ACanvas: TCanvas; ARect: TRect; AColor: TColor);
    function GetShadowColor(ABaseColor: TColor; AOffset: Integer): TColor;
    function GetProgressPixels(AProgress, ATotal, APixelRange: Integer): Integer;
    procedure PaintHorisontalRect(ACanvas: TCanvas; ARect: TRect; AColor: TColor);
    procedure PaintVerticalRect(ACanvas: TCanvas; ARect: TRect; AColor: TColor);
    procedure SetProgressSplit(const Value: Integer);
    procedure SetOptions(const Value: TclDrawPaintOptions);
    procedure SetOrientation(const Value: TclDrawOrientation);
    procedure SetStyle(const Value: TclDrawStyle);
    procedure SetColors(const Value: TclDrawColors);
    procedure SetInternetControl(const Value: TclCustomInternetControl);
    procedure ClearNotifier();
    function GetLastState(): TclResourceStateList;
    procedure SetBorderStyle(const Value: TclBorderStyle);
  protected
    procedure NotifyChanged; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Changed; virtual;
    procedure DoPaint(var AState: TclResourceStateList); virtual;
    procedure CustomDraw(AItemType: TclProgressBarItemType;
      ACanvas: TCanvas; ARect: TRect; AColor: TColor; var Handled: Boolean); virtual;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure Draw(AState: TclResourceStateList; ACanvas: TCanvas; ARect: TRect);
  published
    property Options: TclDrawPaintOptions read FOptions write SetOptions default [dpDrawTotal, dpDrawItems];
    property Orientation: TclDrawOrientation read FOrientation write SetOrientation default doHorisontal;
    property Style: TclDrawStyle read FStyle write SetStyle default ds3D;
    property BorderStyle: TclBorderStyle read FBorderStyle write SetBorderStyle default bsFrame;
    property Colors: TclDrawColors read FColors write SetColors;
    property ProgressSplit: Integer read FProgressSplit write SetProgressSplit default 25;
    property InternetControl: TclCustomInternetControl read FInternetControl write SetInternetControl;
    property Align;
    property Visible;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    property OnCustomDraw: TclProgressBarCustomDraw read FOnCustomDraw write FOnCustomDraw;
    property OnPaint: TclProgressBarPaint read FOnPaint write FOnPaint;
  end;

implementation

{$IFDEF DELPHI6}
uses
  Types;
{$ENDIF}

const
  BackGroundColorSchemes: array[TclColorScheme] of TColor = (
    0,
    clWhite,
    {$IFDEF DELPHI6}clCream{$ELSE}TColor($F0FBFF){$ENDIF},
    TColor($E55500)
  );
  FrameColorSchemes: array[TclColorScheme] of TColor = (
    0,
    clBlue,
    {$IFDEF DELPHI6}clSkyBlue{$ELSE}TColor($F0CAA6){$ENDIF},
    TColor($298514)
  );
  ItemColorSchemes: array[TclColorScheme] of TclStatusColor = (
    (0, 0, 0, 0, 0, 0),
    (clBlue, clBlue, clRed, clYellow, clBlue, clBlue),
    {$IFDEF DELPHI6}
    (clSkyBlue, clSkyBlue, clLtGray, clLtGray, clSkyBlue, clSkyBlue)
    {$ELSE}
    (TColor($F0CAA6), TColor($F0CAA6), clLtGray, clLtGray, TColor($F0CAA6), TColor($F0CAA6))
    {$ENDIF},
    (TColor($298514), TColor($298514), TColor($170DD6), TColor($0BC5F4), TColor($298514), TColor($298514))
  );
  TotalColorSchemes: array[TclColorScheme] of TclStatusColor = (
    (0, 0, 0, 0, 0, 0),
    (clGreen, clGreen, clRed, clYellow, clGreen, clGreen),
    {$IFDEF DELPHI6}
    (clSkyBlue, clSkyBlue, clLtGray, clLtGray, clSkyBlue, clSkyBlue)
    {$ELSE}
    (TColor($F0CAA6), TColor($F0CAA6), clLtGray, clLtGray, TColor($F0CAA6), TColor($F0CAA6))
    {$ENDIF},
    (TColor($296514), TColor($296514), TColor($170DD6), TColor($0BC5F4), TColor($296514), TColor($296514))
  );

{ TclProgressBar }

procedure TclProgressBar.DrawBackGround(ACanvas: TCanvas; ARect: TRect);
var
  Handled: Boolean;
begin
  Handled := False;
  CustomDraw(gitBackGround, ACanvas, ARect, Colors.BackGround, Handled);
  if not Handled then
  begin
    ACanvas.Brush.Color := Colors.BackGround;
    ACanvas.FillRect(ARect);
  end;
end;

procedure TclProgressBar.DrawFrame(ACanvas: TCanvas; ARect: TRect);
var
  Handled: Boolean;
begin
  Handled := False;
  CustomDraw(gitFrame, ACanvas, ARect, Colors.Frame, Handled);
  if not Handled then
  begin
    ACanvas.Brush.Color := Colors.Frame;
    ACanvas.FrameRect(ARect);
  end;
end;

function TclProgressBar.GetShadowColor(ABaseColor: TColor; AOffset: Integer): TColor;
  function GetCorrectValue(AValue, AOffset: Integer): Integer;
  begin
    Result := AValue;
    if ((Result + AOffset) > -1) and ((Result + AOffset) < 256) then
    begin
      Result := AValue + AOffset;
    end;
  end;

begin
  if (ABaseColor and (not $FFFFFF)) > 0 then
  begin
    Result := ABaseColor;
  end else
  begin
    Result := RGB(
      GetCorrectValue(GetRValue(ABaseColor), AOffset),
      GetCorrectValue(GetGValue(ABaseColor), AOffset),
      GetCorrectValue(GetBValue(ABaseColor), AOffset));
  end;
end;

procedure TclProgressBar.PaintRect(ACanvas: TCanvas; ARect: TRect; AColor: TColor);
begin
  if Orientation = doHorisontal then
  begin
    PaintHorisontalRect(ACanvas, ARect, AColor);
  end else
  begin
    PaintVerticalRect(ACanvas, ARect, AColor);
  end;
end;

procedure TclProgressBar.PaintHorisontalRect(ACanvas: TCanvas; ARect: TRect; AColor: TColor);
var
  R: TRect;
begin
  if (Style = ds3D) and ((ARect.Bottom - ARect.Top) > 2) then
  begin
    R := ARect;
    R.Bottom := R.Top + 2;
    ACanvas.Brush.Color := GetShadowColor(AColor, 30);
    ACanvas.FillRect(R);
    OffsetRect(R, 0, 2);
    ACanvas.Brush.Color := GetShadowColor(AColor, 10);
    ACanvas.FillRect(R);
    R := ARect;
    R.Top := R.Bottom - 2;
    ACanvas.Brush.Color := GetShadowColor(AColor, -30);
    ACanvas.FillRect(R);
    OffsetRect(R, 0, - 2);
    ACanvas.Brush.Color := GetShadowColor(AColor, -10);
    ACanvas.FillRect(R);
    R := ARect;
    InflateRect(R, 0, - 4);
  end else
  begin
    R := ARect;
  end;
  ACanvas.Brush.Color := AColor;
  ACanvas.FillRect(R);
end;

procedure TclProgressBar.PaintVerticalRect(ACanvas: TCanvas; ARect: TRect; AColor: TColor);
var
  R: TRect;
begin
  if (Style = ds3D) and ((ARect.Right - ARect.Left) > 2) then
  begin
    R := ARect;
    R.Right := R.Left + 2;
    ACanvas.Brush.Color := GetShadowColor(AColor, 30);
    ACanvas.FillRect(R);
    OffsetRect(R, 2, 0);
    ACanvas.Brush.Color := GetShadowColor(AColor, 10);
    ACanvas.FillRect(R);
    R := ARect;
    R.Left := R.Right - 2;
    ACanvas.Brush.Color := GetShadowColor(AColor, -30);
    ACanvas.FillRect(R);
    OffsetRect(R, - 2, 0);
    ACanvas.Brush.Color := GetShadowColor(AColor, -10);
    ACanvas.FillRect(R);
    R := ARect;
    InflateRect(R, - 4, 0);
  end else
  begin
    R := ARect;
  end;
  ACanvas.Brush.Color := AColor;
  ACanvas.FillRect(R);
end;

function TclProgressBar.GetProgressPixels(AProgress, ATotal, APixelRange: Integer): Integer;
begin
  Result := Round((AProgress / ATotal) * APixelRange);
end;

procedure TclProgressBar.DrawTotalProgress(AState: TclResourceStateList; ACanvas: TCanvas; ARect: TRect);
var
  old: Integer;
  R: TRect;
  Handled: Boolean;
begin
  R := ARect;
  if (Orientation = doHorisontal) then
  begin
    old := R.Right;
    R.Right := R.Left + GetProgressPixels(AState.BytesProceed, AState.ResourceSize, ARect.Right - ARect.Left);
    if (R.Right <> R.Left) and (R.Right <> old) then
    begin
      R.Right := R.Right + 1;
    end;
  end else
  begin
    old := R.Top;
    R.Top := R.Bottom - GetProgressPixels(AState.BytesProceed, AState.ResourceSize, ARect.Bottom - ARect.Top);
    if (R.Top <> R.Bottom) and (R.Top <> old) then
    begin
      R.Top := R.Top - 1;
    end;
  end;
  Handled := False;
  CustomDraw(gitProcessTotal, ACanvas, R, Colors.TotalColors.GetStatusColors()[AState.LastStatus], Handled);
  if not Handled then
  begin
    PaintRect(ACanvas, R, Colors.TotalColors.GetStatusColors()[AState.LastStatus]);
  end;
end;

procedure TclProgressBar.DrawProgressItem(AState: TclResourceStateList; AItem: TclResourceStateItem;
  ACanvas: TCanvas; ARect: TRect);
var
  old: Integer;
  R: TRect;
  Handled: Boolean;
begin
  R := ARect;
  if (Orientation = doHorisontal) then
  begin
    R.Left := R.Left + GetProgressPixels(AItem.ResourcePos, AState.ResourceSize, ARect.Right - ARect.Left);
    old := R.Right;
    R.Right := R.Left + GetProgressPixels(AItem.BytesProceed, AState.ResourceSize, ARect.Right - ARect.Left);
    if (R.Right <> R.Left) and (R.Right <> old) then
    begin
      R.Right := R.Right + 1;
    end;
  end else
  begin
    R.Bottom := R.Bottom - GetProgressPixels(AItem.ResourcePos, AState.ResourceSize, ARect.Bottom - ARect.Top);
    old := R.Top;
    R.Top := R.Bottom - GetProgressPixels(AItem.BytesProceed, AState.ResourceSize, ARect.Bottom - ARect.Top);
    if (R.Top <> R.Bottom) and (R.Top <> old) then
    begin
      R.Top := R.Top - 1;
    end;
  end;
  Handled := False;
  CustomDraw(gitProcessTotal, ACanvas, R, Colors.ItemColors.GetStatusColors()[AItem.Status], Handled);
  if not Handled then
  begin
    PaintRect(ACanvas, R, Colors.ItemColors.GetStatusColors()[AItem.Status]);
  end;
end;

procedure TclProgressBar.DrawProgressItems(AState: TclResourceStateList; ACanvas: TCanvas; ARect: TRect);
var
  i: Integer;
begin
  for i := 0 to AState.Count - 1 do
  begin
    DrawProgressItem(AState, AState[i], ACanvas, ARect);
  end;
end;

procedure TclProgressBar.Draw(AState: TclResourceStateList; ACanvas: TCanvas; ARect: TRect);
var
  R, RatedRect: TRect;
  BackBmp: Graphics.TBitmap;
begin
{$IFDEF DEMO}
{$IFNDEF STANDALONEDEMO}
  if FindWindow('TAppBuilder', nil) = 0 then
  begin
    MessageBox(0, 'This demo version can be run under Delphi/C++Builder IDE only. ' + 
      'Please visit www.clevercomponents.com to purchase your ' +
      'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    ExitProcess(1);
  end;
{$ENDIF}
{$ENDIF}
  BackBmp := Graphics.TBitmap.Create();
  try
    RatedRect := ARect;
    OffsetRect(RatedRect, -RatedRect.Left, -RatedRect.Top);
    BackBmp.Handle := CreateCompatibleBitmap(ACanvas.Handle, RatedRect.Right, RatedRect.Bottom);
    if (BorderStyle = bsFrame) then
    begin
      DrawFrame(BackBmp.Canvas, RatedRect);
      InflateRect(RatedRect, -1, -1);
    end;
    DrawBackGround(BackBmp.Canvas, RatedRect);
    if (AState <> nil) and (AState.ResourceSize > 0) then
    begin
      R := RatedRect;
      if (dpDrawItems in Options) then
      begin
        if (Orientation = doHorisontal) then
        begin
          R.Bottom := R.Bottom - GetProgressPixels(100 - FProgressSplit, 100, RatedRect.Bottom);
        end else
        begin
          R.Right := R.Right - GetProgressPixels(100 - FProgressSplit, 100, RatedRect.Right);
        end;
      end;
      if (dpDrawTotal in Options) then
      begin
        DrawTotalProgress(AState, BackBmp.Canvas, R);
      end;
      if (dpDrawTotal in Options) then
      begin
        if (Orientation = doHorisontal) then
        begin
          R.Top := R.Bottom;
          R.Bottom := RatedRect.Bottom;
        end else
        begin
          R.Left := R.Right;
          R.Right := RatedRect.Right;
        end;
      end else
      begin
        R := RatedRect;
      end;
      if (dpDrawItems in Options) then
      begin
        DrawProgressItems(AState, BackBmp.Canvas, R);
      end;
    end;
    ACanvas.Draw(ARect.Left, ARect.Top, BackBmp);
  finally
    BackBmp.Free();
  end;
end;

constructor TclProgressBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FColors := TclDrawColors.Create(Self);
  FOptions := [dpDrawTotal, dpDrawItems];
  FOrientation := doHorisontal;
  FStyle := ds3D;
  FBorderStyle := bsFrame;
  FProgressSplit := 25;
  Width := 150;
  Height := GetSystemMetrics(SM_CYVSCROLL);
end;

procedure TclProgressBar.SetColors(const Value: TclDrawColors);
begin
  FColors.Assign(Value);
end;

destructor TclProgressBar.Destroy();
begin
  ClearNotifier();
  FColors.Free();
  inherited Destroy();
end;

procedure TclProgressBar.SetProgressSplit(const Value: Integer);
begin
  if (FProgressSplit <> Value)
    and (Value >= 0) and (Value <= 100) then
  begin
    FProgressSplit := Value;
    NotifyChanged();
  end;
end;

procedure TclProgressBar.Changed;
begin
  if Assigned(FOnChanged) then
  begin
    FOnChanged(Self);
  end;
end;

procedure TclProgressBar.SetOptions(const Value: TclDrawPaintOptions);
begin
  if (FOptions <> Value) then
  begin
    FOptions := Value;
    NotifyChanged();
  end;
end;

procedure TclProgressBar.SetOrientation(const Value: TclDrawOrientation);
begin
  if (FOrientation <> Value) then
  begin
    FOrientation := Value;
    NotifyChanged();
  end;
end;

procedure TclProgressBar.CustomDraw(AItemType: TclProgressBarItemType;
  ACanvas: TCanvas; ARect: TRect; AColor: TColor; var Handled: Boolean);
begin
  if Assigned(FOnCustomDraw) then
  begin
    FOnCustomDraw(Self, AItemType, ACanvas, ARect, AColor, Handled);
  end;
end;

procedure TclProgressBar.Paint();
var
  state: TclResourceStateList;
begin
  if not (csLoading in ComponentState)
    and (Visible or (csDesigning in ComponentState))
    and (Parent <> nil) and Parent.HandleAllocated then
  begin
    state := nil;
    DoPaint(state);
    if (state = nil) then
    begin
      state := GetLastState();
    end;
    Draw(state, Canvas, GetClientRect());
  end;
end;

function TclProgressBar.GetLastState(): TclResourceStateList;
begin
  Result := nil;
  if (FNotifier <> nil) then
  begin
    Result := FNotifier.GetLastState();
  end;
end;

procedure TclProgressBar.Notification(AComponent: TComponent; Operation: TOperation);
begin
  if (AComponent = FInternetControl) and (Operation = opRemove) then
  begin
    InternetControl := nil;
  end;
  inherited Notification(AComponent, Operation);
end;

procedure TclProgressBar.ClearNotifier();
begin
  FNotifier.Free();
  FNotifier := nil;
end;

procedure TclProgressBar.SetInternetControl(const Value: TclCustomInternetControl);
begin
  if (FInternetControl <> Value) then
  begin
    FInternetControl := Value;
    ClearNotifier();
    if (FInternetControl <> nil) then
    begin
      FInternetControl.FreeNotification(Self);
      FNotifier := TclProgressBarNotifier.Create(FInternetControl, Self);
    end;
  end;
end;

procedure TclProgressBar.NotifyChanged;
begin
  Paint();
  Changed();
end;

procedure TclProgressBar.SetStyle(const Value: TclDrawStyle);
begin
  if (FStyle <> Value) then
  begin
    FStyle := Value;
    NotifyChanged();
  end;
end;

procedure TclProgressBar.SetBorderStyle(const Value: TclBorderStyle);
begin
  if (FBorderStyle <> Value) then
  begin
    FBorderStyle := Value;
    NotifyChanged();
  end;
end;

procedure TclProgressBar.DoPaint(var AState: TclResourceStateList);
begin
  if Assigned(OnPaint) then
  begin
    OnPaint(Self, AState);
  end;
end;

{ TclDrawColors }

procedure TclDrawColors.Assign(Source: TPersistent);
var
  Src: TclDrawColors;
begin
  if (Source is TclDrawColors) then
  begin
    Src := (Source as TclDrawColors);
    FFrame := Src.Frame;
    FBackGround := Src.BackGround;
    FTotalColors.Assign(Src.TotalColors);
    FItemColors.Assign(Src.ItemColors);
    FScheme := Src.Scheme;
    Changed();
  end else
  begin
    inherited Assign(Source);
  end;
end;

procedure TclDrawColors.Changed;
begin
  if (FOwner <> nil) then
  begin
    FOwner.NotifyChanged();
  end;
end;

constructor TclDrawColors.Create(AOwner: TclProgressBar);
begin
  inherited Create();
  FTotalColors := TclStatusColors.Create(Self);
  FItemColors := TclStatusColors.Create(Self);
  FOwner := AOwner;
  FScheme := csScheme1;
  SetColorsByScheme();
end;

procedure TclDrawColors.SetBackGround(const Value: TColor);
begin
  if (FBackGround <> Value) then
  begin
    FBackGround := Value;
    SetCustomScheme();
    Changed();
  end;
end;

procedure TclDrawColors.SetScheme(const Value: TclColorScheme);
begin
  if (FScheme <> Value) and (Value <> csSchemeCustom) then
  begin
    FScheme := Value;
    SetColorsByScheme();
    Changed();
  end;
end;

procedure TclDrawColors.SetColorsByScheme();
begin
  FFrame := FrameColorSchemes[FScheme];
  FBackGround := BackGroundColorSchemes[FScheme];
  FItemColors.SetStatusColors(ItemColorSchemes[FScheme]);
  FTotalColors.SetStatusColors(TotalColorSchemes[FScheme]);
end;

procedure TclDrawColors.SetFrame(const Value: TColor);
begin
  if (FFrame <> Value) then
  begin
    FFrame := Value;
    SetCustomScheme();
    Changed();
  end;
end;

procedure TclDrawColors.SetItemColors(const Value: TclStatusColors);
begin
  FItemColors.Assign(Value);
  SetCustomScheme();
end;

procedure TclDrawColors.SetTotalColors(const Value: TclStatusColors);
begin
  FTotalColors.Assign(Value);
  SetCustomScheme();
end;

destructor TclDrawColors.Destroy;
begin
  FItemColors.Free();
  FTotalColors.Free();
  inherited Destroy();
end;

procedure TclDrawColors.SetCustomScheme;
begin
  FScheme := csSchemeCustom;
end;

function TclDrawColors.ColorsStored(AColor1, AColor2: TclStatusColor): Boolean;
var
  i: TclProcessStatus;
begin
  for i := Low(TclStatusColor) to High(TclStatusColor) do
  begin
    Result := (AColor1[i] <> AColor2[i]);
    if Result then Exit;
  end;
  Result := False;
end;

function TclDrawColors.ItemColorsStored: Boolean;
begin
  Result := ColorsStored(ItemColors.GetStatusColors(), ItemColorSchemes[FScheme]);
end;

function TclDrawColors.TotalColorsStored: Boolean;
begin
  Result := ColorsStored(TotalColors.GetStatusColors(), TotalColorSchemes[FScheme]);
end;

function TclDrawColors.BackGroundStored: Boolean;
begin
  Result := (FBackGround <> BackGroundColorSchemes[FScheme]);
end;

function TclDrawColors.FrameStored: Boolean;
begin
  Result := (FFrame <> FrameColorSchemes[FScheme]);
end;

{ TclProgressBarNotifier }

constructor TclProgressBarNotifier.Create(AControl: TclCustomInternetControl; AProgressBar: TclProgressBar);
begin
  inherited Create(AControl);
  FProgressBar := AProgressBar;
  Assert(FProgressBar <> nil);
end;

procedure TclProgressBarNotifier.DoItemDeleted(Item: TclInternetItem);
begin
  if (FLastItem = Item) then
  begin
    FLastItem := nil;
  end;
  inherited DoItemDeleted(Item);
end;

procedure TclProgressBarNotifier.DoResourceStateChanged(Item: TclInternetItem);
begin
  FLastItem := Item;
  FProgressBar.NotifyChanged();
end;

function TclProgressBarNotifier.GetLastState(): TclResourceStateList;
begin
  Result := nil;
  if (FLastItem <> nil) then
  begin
    Result := FLastItem.ResourceState;
  end;
end;

{ TclStatusColors }

procedure TclStatusColors.Assign(Source: TPersistent);
begin
  if (Source is TclStatusColors) then
  begin
    FStatusColor := (Source as TclStatusColors).GetStatusColors();
    FOwner.Changed();
  end else
  begin
    inherited Assign(Source);
  end;
end;

constructor TclStatusColors.Create(AOwner: TclDrawColors);
begin
  inherited Create();
  FOwner := AOwner;
end;

function TclStatusColors.GetStatusColor(const Index: Integer): TColor;
begin
  Result := FStatusColor[TclProcessStatus(Index)];
end;

function TclStatusColors.GetStatusColors: TclStatusColor;
begin
  Result := FStatusColor;
end;

procedure TclStatusColors.SetStatusColors(AStatusColor: TclStatusColor);
begin
  FStatusColor := AStatusColor;
end;

procedure TclStatusColors.SetStatusColor(const Index: Integer; const Value: TColor);
begin
  if (FStatusColor[TclProcessStatus(Index)] <> Value) then
  begin
    FStatusColor[TclProcessStatus(Index)] := Value;
    FOwner.SetCustomScheme();
    FOwner.Changed();
  end;
end;

end.







