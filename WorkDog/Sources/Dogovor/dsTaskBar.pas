unit dsTaskBar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, ComCtrls, Menus;

type
  TdsTaskBar = class;
  TTaskBarButton = class;

  TTaskBarEmulate = set of (tbeOpera);
  TGradOrientation = (goNone, goVertical, goHorizontal);

  TScrollType = (stNone, stLeft, stLeftRight);
  TScrollDirection = (sdLeft, sdRight);

  TOnAddButton = procedure(Sender: TObject; Button: TTaskBarButton) of object;
  TSimilarGroupEvent = procedure(Sender: TObject; Form1, Form2: TCustomForm; var Result: Boolean) of object;

  TTaskBarButton = class(TSpeedButton)
  private
    FTaskBar: TdsTaskBar;
    FFullText: String;

    FGroupButton: TTaskBarButton;
    FTextButton: TTaskBarButton;
    FGroupCount: Integer;

    ScrollPosition: Integer;
    ScrollDirection: TScrollDirection;
    ScrollTimeOut: Integer;

    OldWindowState: TWindowState;
    OldFormActivate: TNotifyEvent;
    OldFormDeactivate: TNotifyEvent;
    OldWindowProc: TWndMethod;

    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormWindowProc(var Message: TMessage);
    procedure AssignGlyphIcon;
    procedure BringFormToFront;
    procedure SetFullText(const Value: String);

    function GetForm: TForm;
    function GetCanvasWidth: Integer;
  protected
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Click; override;

    procedure ResetCaption;
    procedure ScrollCaption;

    property Form: TForm read GetForm;
    property FullText: String read FFullText write SetFullText;
    property GroupButton: TTaskBarbutton read FGroupButton;
  end;

  TdsTaskBar = class(TCustomPanel)
  private
    FFlat: Boolean;
    FButtonWidth: Integer;
    FAutoCreateButtons: Boolean;
    FEmulate: TTaskBarEmulate;
    FScrollType: TScrollType;
    FHideMinimizedMDI: Boolean;
    FTimer: TTimer;
    FColor1: TColor;
    FColor2: TColor;
    FGradOrientation: TGradOrientation;
    FSyncCaptions: Boolean;

    FGroupSimilar: Boolean;
    FGroupMenu: TPopupMenu;

    FOnAddButton: TOnAddButton;
    FIsSimilarGroup: TSimilarGroupEvent;

    OldActiveFormChange: TNotifyEvent;

    procedure SetFlat(Value: Boolean);
    procedure SetAutoCreateButtons(Value: Boolean);
    procedure SetButtonWidth(Value: Integer);
    procedure SetScrollType(Value: TScrollType);
    procedure SetHideMinimizedMDI(Value: Boolean);
    procedure SetColor1(Value: TColor);
    procedure SetColor2(Value: TColor);
    procedure SetGradOrientation(Value: TGradOrientation);
    procedure SetGroupSimilar(Value: Boolean);
    procedure SetButtonDown(Value: TTaskBarButton);

    procedure SetButtonsWidths;
    procedure ActiveFormChange(Sender: TObject);
    procedure GroupMenuClick(Sender: TObject);
    procedure MeasureMenuItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
    procedure DrawMenuItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
    procedure ScrollButtonsCaptions(Sender: TObject);
    procedure GroupButtons;
    procedure UngroupButtons;

    function GetButtonCount: Integer;
    function GetButton(index: Integer): TTaskBarButton;
    function GetButtonDown: TTaskBarButton;
  protected
    procedure Resize; override;
    procedure VisibleChanging; override;
    procedure Paint; override;

    function FindGroup(Form1, Form2: TCustomForm): Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;

    function AddButton(AForm: TForm): TTaskBarButton; overload;
    function AddButton(AForm: TForm; Group: Boolean): TTaskBarButton; overload;
    function ButtonByForm(AForm: TForm): TTaskBarButton;

    property ButtonCount: Integer read GetButtonCount;
    property Buttons[Index: Integer]: TTaskBarButton read GetButton;
  published
    property AutoCreateButtons: Boolean read FAutoCreateButtons write SetAutoCreateButtons;
    property ButtonWidth: Integer read FButtonWidth write SetButtonWidth;
    property Flat: Boolean read FFlat write SetFlat;
    property Emulate: TTaskBarEmulate read FEmulate write FEmulate default [];
    property OnAddButton: TOnAddButton read FOnAddButton write FOnAddButton;
    property ScrollType: TScrollType read FScrollType write SetScrollType;
    property HideMinimizedMDI: Boolean read FHideMinimizedMDI write SetHideMinimizedMDI;
    property Color1: TColor read FColor1 write SetColor1;
    property Color2: TColor read FColor2 write SetColor2;
    property GradOrientation: TGradOrientation read FGradOrientation write SetGradOrientation;
    property GroupSimilar: Boolean read FGroupSimilar write SetGroupSimilar;
    property IsSimilarGroup: TSimilarGroupEvent read FIsSimilarGroup write FIsSimilarGroup;
    property SyncCaptions: Boolean read FSyncCaptions write FSyncCaptions;

    property Align;
    property BevelInner;
    property BevelOuter;
    property BorderStyle;
    property BorderWidth;
    property Font;
    property ShowHint;
    property Visible;
  end;

procedure SetGlobalTaskBar(tb: TdsTaskBar);
procedure AddToGlobalTaskBar(F: TForm; Group: Boolean = false);

function GetGlobalTaskBar: TdsTaskBar;

implementation

const
  ellipsis = '...';
  GlyphSize = 28;
  cMenuHeight = 22;

//global task bar functions can be used to add buttons to taskbar
//from any form, no need to include unit where task bar is in uses
var
  GlobalTaskBar: TdsTaskBar;

procedure SetGlobalTaskBar(tb: TdsTaskBar);
begin
  GlobalTaskBar := tb;
end;

procedure AddToGlobalTaskBar(F: TForm; Group: Boolean = false);
begin
  if Assigned(GlobalTaskBar) then
    GlobalTaskBar.AddButton(F, Group);
end;

function GetGlobalTaskBar: TdsTaskBar;
begin
  Result := GlobalTaskBar;
end;

function ShortenString(const s, back: String; Width: Integer; Canvas: TCanvas): String;
begin
  Result := s;

  if Canvas.TextWidth(Result) > Width then
  begin
    //if button width is too small don't go to infinite loop
    if Canvas.TextWidth(back) > Width then
      Exit;

    //if caption is to long for the button
    //shrink it to as many as possible characters
    Result := Result + back;

    while Canvas.TextWidth(Result) > Width do
      Delete(Result, Length(Result) - Length(back), 1);
  end;
end;

constructor TTaskBarButton.Create(AOwner: TComponent);
begin
  if not (AOwner is TForm) then
    raise Exception.Create('Owner must be form.');

  inherited;

  Align := alLeft;
  Layout := blGlyphLeft;
  GroupIndex := 1;
  Margin := 5;

  FTextButton := Self;

  AssignGlyphIcon;

  if not (csDesigning in ComponentState) then
  begin
    OldFormActivate := TForm(AOwner).OnActivate;
    OldFormDeactivate := TForm(AOwner).OnDeactivate;
    TForm(AOwner).OnActivate := FormActivate;
    TForm(AOwner).OnDeactivate := FormDeactivate;
  end;
end;

destructor TTaskBarButton.Destroy;
var
  i: Integer;
  b: TTaskBarButton;
begin
  if FGroupCount > 0 then
  begin
    b := nil;

    for i := 0 to FTaskBar.ButtonCount - 1 do
      if FTaskBar.Buttons[i].FGroupButton = Self then
      begin
        b := FTaskBar.Buttons[i];
        Break;
      end;

    if Assigned(b) then
    begin
      for i := 0 to FTaskBar.ButtonCount - 1 do
        if FTaskBar.Buttons[i].FGroupButton = Self then
        begin
          FTaskBar.Buttons[i].FGroupButton := b;
          Inc(b.FGroupCount);
        end;

      b.Left := Left;
      b.Visible := true;
      b.Down := true;
    end;
  end
  else
  begin
    if Assigned(FGroupButton) then
    begin
      Dec(FGroupButton.FGroupCount);
      if FGroupButton.FGroupCount = 0 then
        FGroupButton.Invalidate;
    end;
  end;

  inherited;

  if not (csDestroying in FTaskBar.ComponentState) then
    FTaskBar.SetButtonsWidths;
end;

procedure TTaskBarButton.Click;

  function InternalAdd(b: TTaskBarButton): TMenuItem;
  begin
    Result := TMenuItem.Create(FTaskBar.FGroupMenu);
    Result.Checked := Screen.ActiveForm = b.Form;
    Result.Caption := b.FullText;
    Result.Tag := Integer(b);
    Result.OnMeasureItem := FTaskBar.MeasureMenuItem;
    Result.OnDrawItem := FTaskBar.DrawMenuItem;
    Result.OnClick := FTaskBar.GroupMenuClick;
  end;

var
  i, x, y: Integer;
begin
  inherited;

  if FGroupCount > 0 then
  begin
    for i := FTaskBar.FGroupMenu.Items.Count - 1 downto 0 do
      FTaskBar.FGroupMenu.Items[i].Free;

    FTaskBar.FGroupMenu.Items.Add(InternalAdd(Self));

    for i := 0 to FTaskBar.ButtonCount - 1 do
      if FTaskBar.Buttons[i].FGroupButton = Self then
        FTaskBar.FGroupMenu.Items.Add(InternalAdd(FTaskBar.Buttons[i]));

    x := ClientOrigin.x;
    y := ClientOrigin.y;

    for i := 0 to FTaskBar.FGroupMenu.Items.Count - 1 do
      y := y - cMenuHeight;

    y := y - 7;

    FTaskBar.FGroupMenu.Popup(x, y);
  end
  else BringFormToFront;
end;

procedure TTaskBarButton.BringFormToFront;
var
  IsFocused: Boolean;
begin
  IsFocused := Screen.ActiveForm = Form;

  with Form do
  begin
    if IsFocused then
    begin
      if (WindowState in [wsNormal, wsMaximized]) then
      begin
        OldWindowState := WindowState;
        WindowState := wsMinimized;
      end
      else
      begin
        WindowState := OldWindowState;
      end;
    end
    else
    begin
      //LockWindowUpdate to smooth transition when MDI child in maximized state
      LockWindowUpdate(Handle);
      try
        SetFocus;
        BringToFront;

        if WindowState = wsMinimized then
          WindowState := OldWindowState;
      finally
        LockWindowUpdate(0);
      end;
    end;
  end;
end;

procedure TTaskBarButton.AssignGlyphIcon;
var
  GlyphIcon: TIcon;
  b: TBitmap;
begin
  if TForm(owner).Icon.Empty then
    GlyphIcon := Application.Icon
  else
    GlyphIcon := TForm(owner).Icon;

  b := TBitmap.create;
  try
    b.Width := GlyphIcon.Width;
    b.Height := GlyphIcon.Height;
    b.Canvas.Draw(0,0, GlyphIcon);
    Glyph.Width := 16;
    Glyph.Height := 16;
    Glyph.Canvas.StretchDraw(Rect(0, 0, 16, 16), b);
  finally
    b.free;
  end;
end;

procedure TTaskBarButton.SetFullText(const Value: String);
begin
  if Value <> FFullText then
  begin
    FFullText := Value;
    Hint := FFullText;
    ShowHint := true;
    ResetCaption;
    if Assigned(FGroupButton) then
      FGroupButton.ResetCaption;
  end;
end;

procedure TTaskBarButton.ResetCaption;
begin
  ScrollPosition := 0;

  case FTaskBar.ScrollType of
    stNone: Caption := ShortenString(FTextButton.FullText, ellipsis, GetCanvasWidth, Canvas);
    stLeft: Caption := ShortenString(FTextButton.FullText, '', GetCanvasWidth, Canvas);
    stLeftRight: Caption := ShortenString(FTextButton.FullText, '', GetCanvasWidth, Canvas);
  end;
end;

procedure TTaskBarButton.ScrollCaption;

  function ScrollLeft: String;

    function GetScrollText: String;
    begin
      Result := Copy(FFullText + '  >>>  ', ScrollPosition, 1000);
    end;

  begin
    Inc(ScrollPosition);

    Result := GetScrollText;

    if Result = '' then
    begin
      ScrollTimeOut := 2;
      ScrollPosition := 1;
      Result := GetScrollText;
    end
    else if Canvas.TextWidth(Result) + Margin + GlyphSize < Width then
    begin
      Result := Result + FFullText;
    end;
  end;

  function ScrollLeftRight: String;
  begin
    if ScrollDirection = sdRight then
    begin
      Dec(ScrollPosition);
      if ScrollPosition <= 0 then
      begin
        ScrollTimeOut := 2;
        Result := Copy(FFullText, ScrollPosition, 1000);
        ScrollDirection := sdLeft;
        Exit;
      end;
    end
    else Inc(ScrollPosition);

    Result := Copy(FFullText, ScrollPosition, 1000);

    if ScrollDirection = sdLeft then
      if Canvas.TextWidth(Result) + Margin + GlyphSize < Width then
      begin
        ScrollTimeOut := 3;
        ScrollDirection := sdRight;
        Exit;
      end;
  end;

begin
  if Canvas.TextWidth(FFullText) + Margin + GlyphSize > Width then
  begin
    if ScrollTimeOut > 0 then
      Dec(ScrollTimeOut)
    else
      case FTaskBar.ScrollType of
        stLeft: Caption := ShortenString(ScrollLeft, '', GetCanvasWidth, Canvas);
        stLeftRight: Caption := ShortenString(ScrollLeftRight, '', GetCanvasWidth, Canvas);
      end;
  end;
end;

procedure TTaskBarButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  sm: HMENU;
  P: TPoint;
  cm: DWORD;
begin
  inherited;
  // Handle only simple right clicks, without any modifiers
  if (Button = mbRight) and (Shift = []) then
  begin
    P := ClientToScreen(Point(X, Y));
    sm := GetSystemMenu(Form.Handle, False);
    if (sm <> 0) then
    begin
      // Show window's system menu at the click-point like pop-up,
      // and get back the selected command, if any
      cm := DWORD(TrackPopupMenuEx(sm,
                                   TPM_RETURNCMD or TPM_NONOTIFY or TPM_VERTICAL or
                                   TPM_LEFTBUTTON or TPM_LEFTALIGN,
                                   P.X, P.Y, Form.Handle, nil));
      // If some command was selected, pass it to appropriate MDI child.
      // Actually, TrackPopupMenuEx should pass it itself, when used w/o TPM_NONOTIFY,
      // but it seems it sends the command as WM_COMMAND, instead of WM_SYSCOMMAND,
      // so we need to set TPM_RETURNCMD and handle matters here.
      if cm > 0 then
        Form.Perform(WM_SYSCOMMAND, cm, P.X);
    end;
  end;
  // Close child form on Shift+LeftClick (Opera emulation)
  if (Button = mbLeft) and (Shift = [ssShift]) and (tbeOpera in FTaskBar.Emulate) then
    Form.Close;
end;

procedure TTaskBarButton.Paint;
begin
  inherited;
  if FGroupCount > 0 then
  begin
    Canvas.Brush.Color := clBlack;
    Canvas.Polygon([Point(Width - 15, 9),
                    Point(Width - 7, 9),
                    Point(Width - 11, 13)]);
  end;
end;

procedure TTaskBarButton.FormActivate(Sender: TObject);
begin
  if Assigned(FGroupButton) then
  begin
    FGroupButton.Down := true;
    FGroupButton.FTextButton := Self;
    FGroupButton.ResetCaption;
  end
  else
  begin
    Down := true;
    FTextButton := Self;
    ResetCaption;
  end;

  if Assigned(OldFormActivate) then
    OldFormActivate(Sender);
end;

procedure TTaskBarButton.FormDeactivate(Sender: TObject);
begin
  if Assigned(FGroupButton) then
    FGroupButton.Down := false
  else
    Down := false;

  if Assigned(OldFormDEactivate) then
    OldFormDeactivate(Sender);
end;

procedure TTaskBarButton.FormWindowProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_SIZE:
      if FTaskBar.Visible and FTaskBar.HideMinimizedMDI then
        case Message.WParam of
          SIZE_MINIMIZED: ShowWindow(Form.Handle, SW_HIDE);
        end;
  end;
  OldWindowProc(Message);
  case Message.Msg of
    WM_SETTEXT:
      if FTaskBar.SyncCaptions then
        FullText := Form.Caption;
  end;
end;

function TTaskBarButton.GetForm: TForm;
begin
  Result := TForm(Owner);
end;

function TTaskBarButton.GetCanvasWidth: Integer;
begin
  Result := Width - GlyphSize - Margin;
end;


constructor TdsTaskBar.Create(AOwner: TComponent);
begin
  inherited;
  FButtonWidth := Screen.Width shr 3;
  FColor1 := clBtnFace;
  FColor2 := clBtnFace;

  FGroupMenu := TPopupMenu.Create(Self);
  FGroupMenu.OwnerDraw := true;
end;

function TdsTaskBar.GetButtonCount: Integer;
begin
  Result := ControlCount;
end;

function TdsTaskBar.GetButton(index: Integer): TTaskBarButton;
begin
  Result := TTaskBarButton(Controls[index]);
end;

function TdsTaskBar.GetButtonDown: TTaskBarButton;
var
  i: Integer;
begin
  for i := 0 to ButtonCount - 1 do
    if Buttons[i].Down then
    begin
      Result := Buttons[i].FTextButton;
      Exit;
    end;

  Result := nil;
end;

procedure TdsTaskBar.Resize;
begin
  inherited;
  SetButtonsWidths;
end;

procedure TdsTaskBar.VisibleChanging;
var
  i: Integer;
begin
  inherited;
  for i := 0 to ButtonCount - 1 do
    if Buttons[i].Form.WindowState = wsMinimized then
      if Visible then
        ShowWindow(Buttons[i].Form.Handle, SW_SHOWMINNOACTIVE)
      else
        ShowWindow(Buttons[i].Form.Handle, SW_HIDE)
end;

procedure TdsTaskBar.SetFlat(Value: Boolean);
var
  i: Integer;
begin
  if Value <> FFlat then
  begin
    FFlat := Value;
    for i := 0 to ButtonCount - 1 do
      Buttons[i].Flat := Flat;
  end;
end;

procedure TdsTaskBar.SetAutoCreateButtons(Value: Boolean);
begin
  FAutoCreateButtons := Value;

  if FAutoCreateButtons and not (csDesigning in ComponentState) then
  begin
    OldActiveFormChange := Screen.OnActiveFormChange;
    Screen.OnActiveFormChange := ActiveFormChange;
  end
  else
  begin
    if Assigned(OldActiveFormChange) then
    begin
      Screen.OnActiveFormChange := OldActiveFormChange;
      OldActiveFormChange := nil;
    end;
  end;
end;

procedure TdsTaskBar.SetButtonWidth(Value: Integer);
begin
  if Value <> FButtonWidth then
  begin
    FButtonWidth := Value;
    SetButtonsWidths;
  end;
end;

procedure TdsTaskBar.SetScrollType(Value: TScrollType);

  procedure CreateTimer;
  begin
    FTimer := TTimer.Create(Self);
    FTimer.Interval := 200;
    FTimer.OnTimer := ScrollButtonsCaptions;
    FTimer.Enabled := not (csDesigning in ComponentState);
  end;

var
  i: Integer;
begin
  if FScrollType <> Value then
  begin
    FScrolltype := Value;

    for i := 0 to ButtonCount - 1 do
      Buttons[i].ResetCaption;

    FTimer.Free;
    FTimer := nil;

    case FScrollType of
      stLeft,
      stLeftRight: CreateTimer;
    end;
  end;
end;

procedure TdsTaskBar.SetHideMinimizedMDI(Value: Boolean);
var
  i: Integer;
begin
  if Value <> FHideMinimizedMDI then
  begin
    FHideMinimizedMDI := Value;

    for i := 0 to ButtonCount - 1 do
      if Buttons[i].Form.WindowState = wsMinimized then
        if Visible and Value then
          ShowWindow(Buttons[i].Form.Handle, SW_HIDE)
        else
          ShowWindow(Buttons[i].Form.Handle, SW_SHOWMINNOACTIVE);
  end;
end;

function TdsTaskBar.AddButton(AForm: TForm): TTaskBarButton;
begin
  AddButton(AForm, FGroupSimilar);
end;

function TdsTaskBar.AddButton(AForm: TForm; Group: Boolean): TTaskBarButton;
var
  i: Integer;
  b: TTaskBarButton;
begin
  b := nil;

  if Group then
  begin
    for i := 0 to ButtonCount - 1 do
      if FindGroup(Buttons[i].Form, AForm) then
      begin
        b := Buttons[i];
        Break;
      end;
  end;

  Result := TTaskBarButton.Create(AForm);

  with Result do
  begin
    FTaskBar := Self;
    Parent := Self;
    Hint := AForm.Hint;
    Flat := FFlat;

    if Assigned(b) then
    begin
      Visible := false;
      Inc(b.FGroupCount);
      b.FTextButton := Result;
      FGroupButton := b;
      b.Down := true;
    end
    else
    begin
      Down := true;
    end;

    Left := ControlCount * FButtonWidth;
    Width := FButtonWidth;
    Height := Self.Height;
    Canvas.Font.Assign(Font);

    FullText := AForm.Caption;

    OldWindowProc := AForm.WindowProc;
    AForm.WindowProc := FormWindowProc;

    if Assigned(b) then
      b.ResetCaption;
  end;

  if Assigned(FOnAddButton) then
    FOnAddButton(Self, Result);

  SetButtonsWidths;
end;

function TdsTaskBar.ButtonByForm(AForm: TForm): TTaskBarButton;
var
  i: Integer;
begin
  for i := 0 to ButtonCount - 1 do
    if Buttons[i].Form = AForm then
    begin
      Result := Buttons[i];
      Exit;
    end;

  Result := nil;
end;

procedure TdsTaskBar.SetButtonsWidths;
var
  i, bc, max, bw: Integer;
begin
  bc := 0;
  for i := 0 to ButtonCount - 1 do
    if Buttons[i].Visible then
      Inc(bc);

  if bc > 0 then
  begin
    //get max width of one button
    max := (Width - (2 * BorderWidth)) div bc;

    //get the right button width
    if max > FButtonWidth then
      bw := FButtonWidth
    else
      bw := max;

    // set button captions
    if bw <> Buttons[0].Width then
      for i := 0 to ButtonCount - 1 do
        with Buttons[i] do
        begin
          Width := bw;
          ResetCaption;
        end;
  end;
end;

procedure TdsTaskBar.ActiveFormChange(Sender: TObject);
var
  i: Integer;
  F: TForm;
begin
  F := Screen.ActiveForm;

  if Assigned(F) and AutoCreateButtons and (F.FormStyle = fsMDIChild) then
  begin
    for i := 0 to ButtonCount - 1 do
      if Buttons[i].Form = F then
        Exit;

    AddButton(F);
  end;

  if Assigned(OldActiveFormChange) then
    OldActiveFormChange(Sender);
end;

procedure TdsTaskBar.ScrollButtonsCaptions(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ButtonCount - 1 do
    Buttons[i].ScrollCaption;
end;

procedure TdsTaskBar.Paint;
var
  R1, G1, B1, R2, G2, B2: Byte;
  I, nR, nG, nB, nLine: Integer;
  RLine:TRect;
begin
  if (FColor1 <> FColor2) and (FGradOrientation <> goNone) then
  begin
    case FGradOrientation of
      goVertical: nLine := Height - 1;
      goHorizontal: nLine := Width - 1;
      else nLine := Width - 1;
    end;

    R1 := (ColorToRGB(FColor1) and $000000FF);
    G1 := (ColorToRGB(FColor1) and $0000FF00) shr 8;
    B1 := (ColorToRGB(FColor1) and $00FF0000) shr 16;

    R2 := (ColorToRGB(FColor2) and $000000FF);
    G2 := (ColorToRGB(FColor2) and $0000FF00) shr 8;
    B2 := (ColorToRGB(FColor2) and $00FF0000) shr 16;

    nR := R2 - R1;
    nG := G2 - G1;
    nB := B2 - B1;

    for I := 0 to nLine do
    begin
      with Canvas do
      begin
        Brush.Color := RGB(R1 + MulDiv(I, nR, nLine),
                           G1 + MulDiv(I, nG, nLine),
                           B1 + MulDiv(I, nB, nLine));
        case FGradOrientation of
          goVertical: RLine := Bounds(0, I, Width, 1);
          goHorizontal: RLine := Bounds(I, 0, 1, Height);
        end;
        FillRect(RLine);
      end;
    end;
  end
  else inherited;
end;

function TdsTaskBar.FindGroup(Form1, Form2: TCustomForm): Boolean;
begin
  if Assigned(FIsSimilarGroup) then
    FIsSimilarGroup(Self, Form1, Form2, Result)
  else
    Result := SameText(Form1.ClassName, Form2.ClassName);
end;

procedure TdsTaskBar.SetColor1(Value: TColor);
begin
  if FColor1 <> Value then
  begin
    FColor1 := Value;
    Invalidate;
  end;
end;

procedure TdsTaskBar.SetColor2(Value: TColor);
begin
  if FColor2 <> Value then
  begin
    FColor2 := Value;
    Invalidate;
  end;
end;

procedure TdsTaskBar.SetGradOrientation(Value: TGradOrientation);
begin
  if FGradOrientation <> Value then
  begin
    FGradOrientation := Value;
    Invalidate;
  end;
end;

procedure TdsTaskBar.SetGroupSimilar(Value: Boolean);
begin
  if Value <> FGroupSimilar then
  begin
    FGroupSimilar := Value;
    if FGroupSimilar then
      GroupButtons
    else
      UngroupButtons;
  end;
end;

procedure TdsTaskBar.SetButtonDown(Value: TTaskBarButton);
var
  i: Integer;
begin
  for i := 0 to ButtonCount - 1 do
    if Buttons[i] = Value then
    begin
      if Assigned(Buttons[i].FGroupButton) then
      begin
        Buttons[i].FGroupButton.Down := true;
        Buttons[i].FGroupButton.FTextButton := Buttons[i];
      end
      else Buttons[i].Down := true;

      Exit;
    end;
end;

procedure TdsTaskBar.GroupButtons;

  function Group(idx: Integer): TTaskBarButton;
  var
    i: Integer;
    b: TTaskBarButton;
  begin
    b := Buttons[idx];
    for i := 0 to idx - 1 do
      if FindGroup(Buttons[i].Form, b.Form) then
      begin
        Result := Buttons[i];
        Exit;
      end;

    Result := nil;
  end;

var
  i: Integer;
  b, downb: TTaskBarButton;
begin
  downb := GetButtonDown;

  for i := 0 to ButtonCount - 1 do
  begin
    b := Group(i);
    if Assigned(b) then
    begin
      Buttons[i].Visible := false;
      Inc(b.FGroupCount);
      Buttons[i].FGroupButton := b;
    end;
  end;

  SetButtonDown(downb);
end;

procedure TdsTaskBar.UngroupButtons;
var
  i: Integer;
  downb: TTaskBarButton;
begin
  downb := GetButtonDown;

  for i := 0 to ButtonCount - 1 do
  begin
    Buttons[i].Left := 10000;
    Buttons[i].Visible := true;
    Buttons[i].FGroupCount := 0;
    Buttons[i].FTextButton := Buttons[i];
    Buttons[i].FGroupButton := nil;
    Buttons[i].ResetCaption;
    Buttons[i].Invalidate;
  end;

  SetButtonDown(downb);
end;

procedure TdsTaskBar.GroupMenuClick(Sender: TObject);
begin
  TTaskBarButton(TMenuItem(Sender).Tag).BringFormToFront;
end;

procedure TdsTaskBar.MeasureMenuItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
begin
  Height := cMenuHeight;
  Width := ACanvas.TextWidth(TMenuItem(Sender).Caption) + 25;
end;

procedure TdsTaskBar.DrawMenuItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
var
  R: TRect;
  Flags: LongInt;
  c: TColor;
begin
  R := ARect;
  Flags := DT_VCENTER;
  ACanvas.FillRect(R);
  R.Left := R.Left + 20;
  if TMenuItem(Sender).Checked then
  begin
    c := ACanvas.Brush.Color;
    try
      ACanvas.Brush.Color := clBlack;
      ACanvas.Polygon([Point(3, ARect.Top + (cMenuHeight div 2) - 4),
                       Point(3, ARect.Top + (cMenuHeight div 2) + 4),
                       Point(9, ARect.Top + (cMenuHeight div 2))]);
    finally
      ACanvas.Brush.Color := c;
    end;
  end;
  R.Top := R.Top + 2;
  R.Bottom := R.Bottom + 2;
  DrawText(ACanvas.Handle,
           PChar(TMenuItem(Sender).Caption),
           Length(TMenuItem(Sender).Caption),
           R,
           Flags);
end;
end.
