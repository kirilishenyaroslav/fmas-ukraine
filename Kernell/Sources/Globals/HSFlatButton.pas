{
  Компонент "Плоская кнопка", с возможностью указания цветов и формы кнопки.

  (с) 2002, HyperSoft, Игорь Шевченко.

  Основные идеи взяты из TBitBtn из VCL и TFlatButtonUnit из набора компонент
  FlatStyle (www.flatstyle2k.com)
}
unit HSFlatButton;

interface
uses
  Windows, Messages, Classes, Graphics, Controls, StdCtrls, Buttons;

type
  THSButtonShape = (hbsRect, hbsRoundRect);

  THSFlatButton = class(TButton)
  private
    FCanvas : TCanvas;
    IsFocused : Boolean;
    FBorderColor: TColor;
    FFocusRectColor: TColor;
    FShape: THSButtonShape;
    FDownColor: TColor;
    procedure CNMeasureItem(var Message: TWMMeasureItem); message CN_MEASUREITEM;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk);
      message WM_LBUTTONDBLCLK;
    procedure DrawItem(const DrawItemStruct: TDrawItemStruct);
    procedure SetBorderColor(const Value: TColor);
    procedure SetFocusRectColor(const Value: TColor);
    procedure SetShape(const Value: THSButtonShape);
    procedure SetDownColor(const Value: TColor);
  protected
    procedure CreateParams (var Params: TCreateParams); override;
    procedure SetButtonStyle(ADefault: Boolean); override;
  public
    constructor Create (AOwner : TComponent); override;
    destructor  Destroy; override;
  published
    property Color default clBtnFace;
    property BorderColor : TColor read FBorderColor
         write SetBorderColor default clWindowFrame;
    property DownColor : TColor read FDownColor
         write SetDownColor default clBtnFace;
    property FocusRectColor : TColor read FFocusRectColor
         write SetFocusRectColor default clBtnFace;
    property Shape : THSButtonShape read FShape write SetShape default hbsRect;
  end;

const
  HSButtonRoundRectRadius = 8;

implementation

type
  THSButtonState = (bsUp, bsDisabled, bsDown, bsExclusive);

function RectSize (const Rect : TRect) : SIZE;
begin
  Result.cx := Rect.Right - Rect.Left;
  Result.cy := Rect.Bottom - Rect.Top;
end;

procedure Frame3DBorder (Shape : THSButtonShape; Canvas: TCanvas; Rect: TRect;
                         TopColor, BottomColor: TColor; Width: Integer);
  procedure DoRect;
  var
    TopRight, BottomLeft: TPoint;
  begin
    with Canvas, Rect do begin
      TopRight.X := Right;
      TopRight.Y := Top;
      BottomLeft.X := Left;
      BottomLeft.Y := Bottom;
      Pen.Color := TopColor;
      PolyLine([BottomLeft, TopLeft, TopRight]);
      Pen.Color := BottomColor;
      Dec(BottomLeft.X);
      PolyLine([TopRight, BottomRight, BottomLeft]);
    end;
  end;

begin
  Canvas.Pen.Width := 1;
  if Shape = hbsRoundRect then begin
    Canvas.Brush.Style := bsClear;
    Canvas.Pen.Color := TopColor;
  end else begin
    Dec(Rect.Bottom);
    Dec(Rect.Right);
  end;
  while Width > 0 do begin
    Dec(Width);
    if Shape = hbsRect then
      DoRect
    else
      Canvas.RoundRect (Rect.Left, Rect.Top, Rect.Right, Rect.Bottom,
                        HSButtonRoundRectRadius, HSButtonRoundRectRadius);
    InflateRect(Rect, -1, -1);
  end;
  Inc(Rect.Bottom);
  Inc(Rect.Right);
end;

procedure CalcButtonLayout (Canvas: TCanvas; const Client: TRect; const Offset: TPoint;
  const Caption: string; var TextBounds: TRect);
var
  TextPos: TPoint;
  ClientSize, TextSize: SIZE;
begin
  // calculate the item sizes
  ClientSize := RectSize(Client);

  if Length(Caption) > 0 then begin
    TextBounds := Rect(0, 0, ClientSize.CX, 0);
    DrawText(Canvas.Handle, PChar(Caption), Length(Caption), TextBounds,
             DT_CALCRECT or DT_SINGLELINE);
    TextSize := RectSize(TextBounds);
  end else begin
    TextBounds := Rect(0, 0, 0, 0);
    TextSize.CX := 0;
    TextSize.CY := 0;
  end;
  // Текст выровнен по вертикали
  TextPos.Y := (ClientSize.CY - TextSize.CY + 1) div 2;
  TextPos.X := (ClientSize.CX - TextSize.CX + 1) div 2;

  OffsetRect(TextBounds, TextPos.X + Client.Left + Offset.X,
                         TextPos.Y + Client.Top + Offset.X);
end;


{ THSFlatButton }

procedure THSFlatButton.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure THSFlatButton.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure THSFlatButton.CNDrawItem(var Message: TWMDrawItem);
begin
  DrawItem(Message.DrawItemStruct^);
end;

procedure THSFlatButton.CNMeasureItem(var Message: TWMMeasureItem);
begin
  with Message.MeasureItemStruct^ do begin
    itemWidth := Width;
    itemHeight := Height;
  end;
end;

constructor THSFlatButton.Create(AOwner: TComponent);
begin
  inherited;
  FCanvas := TCanvas.Create();
  FBorderColor := clWindowFrame;
  FDownColor := clBtnFace;
  FShape := hbsRect;
  FFocusRectColor := clBtnFace;
  Color := clBtnFace;
end;

procedure THSFlatButton.CreateParams(var Params: TCreateParams);
begin
  inherited;
{ разрешение рисовать самому }
  with Params do
    Style := Style OR BS_OWNERDRAW;
end;

destructor THSFlatButton.Destroy;
begin
  FCanvas.Free();
  inherited;
end;

procedure THSFlatButton.DrawItem(const DrawItemStruct: TDrawItemStruct);
var
  IsDown : Boolean; { Нажата ли кнопка }
  IsDefault : Boolean; { Установлен ли фокус на форме
                        (надо ли рисовать толстый бордюр) }
  State : THSButtonState; { Состояние кнопки }
  R : TRect;
  memoryBitmap : TBitmap; { Растр для рисования в памяти }
  TextBounds : TRect;
  Offset : TPoint;
begin
  FCanvas.Handle := DrawItemStruct.hDC;
  R := ClientRect;
  with DrawItemStruct do begin
    IsDown := itemState and ODS_SELECTED <> 0;
    IsDefault := itemState and ODS_FOCUS <> 0;
  end;
  if not Enabled then
    State := bsDisabled
  else if IsDown then
    State := bsDown
  else
    State := bsUp;
  if (State in [bsDown, bsExclusive]) AND (FShape = hbsRoundRect) then
    Offset := Point(1, 1)
  else
    Offset := Point(0, 0);

  memoryBitmap := TBitmap.Create(); // create memory-bitmap to draw flicker-free
  try
    memoryBitmap.Height := R.Bottom;
    memoryBitmap.Width := R.Right;
    memoryBitmap.Canvas.Font := Font;
    CalcButtonLayout(memoryBitmap.Canvas, R, Offset, Caption, TextBounds);

    // DrawBackground
    case State of
    bsDown, bsExclusive:
      memoryBitmap.Canvas.Brush.Color := FDownColor;
    bsUp, bsDisabled:
      memoryBitmap.Canvas.Brush.Color := Color;
    end;
      memoryBitmap.Canvas.FillRect(R);
    // DrawBorder
    case State of
    bsUp, bsDown:
{      if FMouseInControl then
        Frame3DBorder(memoryBitmap.canvas, R, FColorHighlight, FColorShadow, 1)
      else} if IsDefault then
        if FShape = hbsRect then
          Frame3DBorder(FShape, memoryBitmap.canvas, R, FBorderColor, FBorderColor, 2)
        else
          Frame3DBorder(FShape, memoryBitmap.canvas, R, FBorderColor, FBorderColor, 1)
      else
        Frame3DBorder(FShape, memoryBitmap.canvas, R, FBorderColor, FBorderColor, 1);
    {bsDown,} bsExclusive:
      Frame3DBorder(FShape, memoryBitmap.canvas, R, clBtnShadow{FColorShadow}, clBtnHighLight{FColorHighlight}, 1);
    bsDisabled:
      Frame3DBorder(FShape, memoryBitmap.canvas, R, FBorderColor, FBorderColor, 1);
    end;
    // DrawText
    memoryBitmap.Canvas.Brush.Style := bsClear;
    if State = bsDisabled then begin
      OffsetRect(TextBounds, 1, 1);
      memoryBitmap.Canvas.Font.Color := clBtnHighlight;
      DrawText(memoryBitmap.Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
      OffsetRect(TextBounds, -1, -1);
      memoryBitmap.Canvas.Font.Color := clBtnShadow;
      DrawText(memoryBitmap.Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
    end else
      DrawText(memoryBitmap.Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
    // Copy memoryBitmap to screen
    FCanvas.CopyRect(ClientRect, memoryBitmap.canvas, ClientRect);
  finally
    memoryBitmap.Free();
  end;

  if IsFocused then begin
    FCanvas.Pen.Color := FFocusRectColor;
    if FShape = hbsRect then begin
      FCanvas.Brush.Style := bsClear;
      R := ClientRect;
      InflateRect(R, -3, -3);
      FCanvas.Rectangle(R)
    end else begin
      R := TextBounds;
      InflateRect (R, 2, 2);
      OffsetRect (R, 1, 0);
      FCanvas.Brush.Color := inherited Color; { Цвет для заполнения промежутков }
                                          {  между разрывами линии FocusRect }
      DrawFocusRect(FCanvas.Handle, R);
    end;
  end;

  FCanvas.Handle := 0;
end;

procedure THSFlatButton.SetBorderColor(const Value: TColor);
begin
  if (FBorderColor <> Value) then begin
    FBorderColor := Value;
    Invalidate();
  end;
end;

procedure THSFlatButton.SetButtonStyle(ADefault: Boolean);
begin
{ Если вызовется inherited, то все старания по установке OwnerDraw пропадут }
  if ADefault <> IsFocused then begin
    IsFocused := ADefault;
    Refresh;
  end;
end;

procedure THSFlatButton.SetDownColor(const Value: TColor);
begin
  if (FDownColor <> Value) then begin
    FDownColor := Value;
    Invalidate();
  end;
end;

procedure THSFlatButton.SetFocusRectColor(const Value: TColor);
begin
  if FFocusRectColor <> Value then begin
    FFocusRectColor := Value;
    Invalidate();
  end;
end;

procedure THSFlatButton.SetShape(const Value: THSButtonShape);
begin
  if FShape <> Value then begin
    FShape := Value;
    RecreateWnd;
  end;
end;

procedure THSFlatButton.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  Perform(WM_LBUTTONDOWN, Message.Keys, Longint(Message.Pos));
end;

end.
