unit SpFoto_Classes;

interface
uses Classes,Controls,cxImage,Graphics,Messages,Types,ExtCtrls, Forms;

type TFotoFrame = class(TGraphicControl)
  private
//    pLeft,pTop,pWidth,pHeight:Integer;
    pFrameWidth:Integer;
    pIsPressed:Boolean;
    pMouseStartPoint:TPoint;
    pOwnStartPoint:TPoint;
    pSourceImage:TcxImage;
  protected
    procedure DrawFrame;virtual;
    procedure WMLButtonDown(var Message:TWMMouse);Message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message:TWMMouse);message WM_LBUTTONUP;
    procedure WMMouseMove(var Message:TWMMouseMove);message WM_MOUSEMOVE;
    procedure CMMouseLeave(var Message:TMessage);message CM_MOUSELEAVE;
  public
    constructor Create(AOwner:TComponent;ASourceImage:TcxImage;ALeft,ATop,AWidth,AHeight:Integer);reintroduce;
    destructor Destroy;override;
    function GetImage:TGraphic;
    procedure Paint;override;
    procedure Repaint;override;
    property Canvas;
  published
end;

{TSelectImage - потомок класса TcxImage. Отображает рамку, содержит и передает
изображение для сохранения}
type TSelectImage = class(TcxImage)
  private
    pSelWidth,pSelHeight:Integer;
    XCenter,YCenter:Integer;
    pRect:TRect;
    pPenColor:TColor;
    pBrushColor:TColor;
    pPenStyle:TPenStyle;
    pResultImage:TImage;
    pScale:Extended;
    pTotalScale:Extended;
  protected
    procedure pMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormRect(AXCenter,AYCenter:Integer);
  public
    pBorderWidth:Integer;
    procedure FitOnParent;
    procedure GetSelectedImage;
    procedure Paint;override;
    procedure SizePlus;
    procedure SizeMinus;
    procedure SetSelectionParams(ASelWidth,ASelHeight:Integer);
    procedure ShowActualSize;
    procedure Free; reintroduce;
    constructor Create(AOwner:TComponent;AResultImage:TImage;APenColor:TColor;ABrushColor:TColor;APenStyle:TPenStyle = psSolid); reintroduce;
  published
    property OnMouseDown;
    property OnMouseWheelDown;
end;

{TElementPositions - тип, определяющий положение объектов TFrameBase отностительно
друг друга, содержит  значения, соответственно:
- левый верхний;
- левый центральный;
- левый нижний;
- центральный верхний;
- центральный центральный;
- центральный нижний;
- правый верхний;
- правый центральный;
- правый нижний.}
type TElementPositions=(epLeftTop,epLeftCenter,epLeftBottom,
                       epCenterTop,epCenterCenter,epCenterBottom,
                       epRightTop,epRightCenter,epRightBottom);

{TFrameBase - базовый тип для перетаскиваемых квадратов(TFrameElement),
определяющих положение и размеры рамки}
type TFrameBase = class(TCustomControl)
  public
    pIsPressed:Boolean; // Была ли нажата над этим объектом кнопка мыши
    pElementPos:TElementPositions; // Определяет положение элемента относительно прочих
    procedure Deactivate; virtual; abstract; // Деактивация?
    procedure SetCoords(X,Y:Integer); //Задает координаты объекта, где X,Y - координатры его центра
    procedure Free; reintroduce;
end;

{TFrameObject - собственно рамка, состоящая из 9 объектов TFrameBase и рисунка
TcxImage (вообще это ОБЯЗАТЕЛЬНО ДОЛЖЕН БЫТЬ TSelectImage), откуда берется изображение}
type TFrameObject = class(TObject)
  private
   // LT,LC,LB,CT,CC,CB,RT,RC,RB:TFrameBase;
    pImage:TSelectImage;
    pTimer:TTimer;
  public
    X1,X2,Y1,Y2:Integer;  // координаты левого верхнего и правого нижнего углов рамки;
    procedure Free; reintroduce;
    procedure StartTimer;
    procedure StopTimer;
    procedure UpDate(Sender:TObject);
    procedure ReleaseAll; // делает все объекты TFrameBase неактивными, завершает перемещение и изменение размеров;
    procedure Coordinate(dX,dY:Integer;ElementPos:TElementPositions); // координирует взаимное расположение объектов TFrameBase, основываясь на изменении позиции одного (dX;dY) и его позиции ElementPos
    procedure DrawRect; // Рисует рамку (только с TSelectImage)
    procedure SelectRect(AX1,AY1,AX2,AY2:Integer); // Выделяет рамку по заданным координатам верхнего левого и нижнего правого углов
    constructor Create(AOwner:TSelectImage;AStartRect:TRect); reintroduce; // Создает объект на рисунке TSelectImage, рисует рамку AStartRect
end;

type TFrameElementParams = record
   Owner:TComponent;
   Master:TFrameObject;
   Left,Top,Width,Height:Integer;
   ElementPos:TElementPositions;
   BorderColor,Color:TColor;
end;

type TFrameElement = class(TFrameBase)
  private
    Master:TFrameObject;
    pColor:TColor;
    pBorderColor:TColor;
    pPressedCursor:TCursor;
    pDefaultCursor:TCursor;
    pMouseStartPoint:TPoint;
    pOwnStartPoint:TPoint;
  protected
    procedure DrawElement;
    procedure MoveWithMouse;
    procedure WMLButtonDown(var Message:TWMMouse);Message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message:TWMMouse);message WM_LBUTTONUP;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
  public
    property Cursor default crDefault;
    constructor Create(AParams:TFrameElementParams);reintroduce;
    procedure Deactivate; override;
    procedure Paint;override;
    procedure Repaint;override;
    property Canvas;
  published
end;

implementation

uses cxControls, Dialogs, SysUtils, Math;

constructor TFotoFrame.Create(AOwner:TComponent;ASourceImage:TcxImage;ALeft,ATop,AWidth,AHeight:Integer);
begin
  inherited Create(AOwner);
//******************************************************************************
  Parent:=AOwner as TWinControl;
  SetBounds(ALeft,ATop,AWidth,AHeight);
  pSourceImage:=ASourceImage;
  pFrameWidth:=5;
end;

destructor TFotoFrame.Destroy;
begin
  inherited Destroy;
end;

procedure TFotoFrame.DrawFrame;
begin
  Canvas.Lock;
  try
    inherited Paint;
    Canvas.Brush.Color:=clRed;
    Canvas.Pen.Color:=clRed;
    Canvas.Rectangle(0,0,Width,Height);
  finally
    Canvas.Unlock;
  end;
end;

function TFotoFrame.GetImage:TGraphic;
var
  lDest,lSource:TRect;
begin
  lDest.Left:=0;
  lDest.Top:=0;
  lDest.Right:=Width;
  lDest.Bottom:=Height;
  lSource.Left:=0;
  lSource.Top:=0;
  lSource.Right:=Width;
  lSource.Bottom:=Height;
  Result:=pSourceImage.Picture.Graphic;
end;

procedure TFotoFrame.Paint;
begin
  DrawFrame;
  inherited Paint;
end;

procedure TFotoFrame.Repaint;
begin
  inherited Paint;
end;

procedure TFotoFrame.WMLButtonDown(var Message:TWMMouse);
begin
  pIsPressed:=True;
  pMouseStartPoint:=Mouse.CursorPos;
  pOwnStartPoint:=Point(Left,Top);
end;

procedure TFotoFrame.WMLButtonUp(var Message:TWMMouse);
begin
  pIsPressed:=False;
end;

procedure TFotoFrame.WMMouseMove(var Message:TWMMouseMove);
var
  lLeft,lTop:Integer;
begin
  if pIsPressed then
    begin
      lLeft := pOwnStartPoint.X+Mouse.CursorPos.X-pMouseStartPoint.X;
      lTop  := pOwnStartPoint.Y+Mouse.CursorPos.Y-pMouseStartPoint.Y;

      if lLeft+Width>Parent.Width then
        Left:=Parent.Width-Width
      else
        if lLeft<0 then
          Left:=0
        else
          Left:=lLeft;
      if lTop+Height>Parent.Height then
        Top:=Parent.Height-Height
      else
        if lTop<0 then
          Top:=0
        else
          Top:=lTop;
{      Left := pOwnStartPoint.X+Mouse.CursorPos.X-pMouseStartPoint.X;
      Top  := pOwnStartPoint.Y+Mouse.CursorPos.Y-pMouseStartPoint.Y;   }
    end;
end;

procedure TFotoFrame.CMMouseLeave(var Message:TMessage);
begin
  pIsPressed:=False;
end;

//******************************************************************************
//                              TFrameBase
//******************************************************************************

procedure TFrameBase.SetCoords(X,Y:Integer);
begin
   Left:=X-Width div 2;
   Top:=Y-Height div 2;
end;

procedure TFrameBase.Free;
begin
  inherited Free;
end;

//******************************************************************************
//                              TFrameObject
//******************************************************************************

procedure TFrameObject.ReleaseAll;
begin
 try
 { (LT as TFrameElement).Deactivate;
  (LC as TFrameElement).Deactivate;
  (LB as TFrameElement).Deactivate;
  (CT as TFrameElement).Deactivate;
  (CC as TFrameElement).Deactivate;
  (CB as TFrameElement).Deactivate;
  (RT as TFrameElement).Deactivate;
  (RC as TFrameElement).Deactivate;
  (RB as TFrameElement).Deactivate;  }
 finally
 end;
end;

procedure TFrameObject.Coordinate(dX,dY:Integer;ElementPos:TElementPositions);
begin
  case ElementPos of
    epLeftTop:begin
                  X1:=X1+dX;
                 if Y1+dY>=0 then
                  Y1:=Y1+dY
                 else
                  Y1:=0;
              end;
    epLeftCenter:begin
                X1:=X1+dX;
              end;
    epLeftBottom:begin
                X1:=X1+dX; Y2:=Y2+dY;
              end;
    epCenterTop:begin
                Y1:=Y1+dY;
              end;
    epCenterCenter:begin
                if (X1+dX>=0) and (X2+dX<=pImage.Width) then
                  begin
                    X1:=X1+dX;
                    X2:=X2+dX;
                  end;
                if (Y1+dY>=0) and (Y2+dY<=pImage.Height) then
                  begin
                    Y1:=Y1+dY;
                    Y2:=Y2+dY;
                  end;
              end;
    epCenterBottom:begin
                Y2:=Y2+dY;
              end;
    epRightTop:begin
                X2:=X2+dX; Y1:=Y1+dY;
              end;
    epRightCenter:begin
                X2:=X2+dX;
              end;
    epRightBottom:begin
                X2:=X2+dX; Y2:=Y2+dY;
              end;
    end;
  if X1>=X2 then
    if dX<0 then
      X2:=X1+1
    else
      X1:=X2-1;
  if Y1>=Y2 then
    if dY<0 then
      Y2:=Y1+1
    else
      Y1:=Y2-1;
  if X1<0 then X1:=0;
  if X2>pImage.Width then X2:=pImage.Width;
  if Y1<0 then Y1:=0;
  if Y2>pImage.Height then Y2:=pImage.Height;
  {LT.SetCoords(X1,Y1);
  LC.SetCoords(X1,(Y1+Y2) div 2);
  LB.SetCoords(X1,Y2);
  CT.SetCoords((X1+X2) div 2,Y1);
  CC.SetCoords((X1+X2) div 2,(Y1+Y2) div 2);
  CB.SetCoords((X1+X2) div 2,Y2);
  RT.SetCoords(X2,Y1);
  RC.SetCoords(X2,(Y1+Y2) div 2);
  RB.SetCoords(X2,Y2);}
end;

procedure TFrameObject.DrawRect;
var r:TRect;
begin
  r.Left:=X1;
  r.Right:=X2;
  r.Top:=Y1;
  r.Bottom:=Y2;

  {LT.Hide;
  LC.Hide;
  LB.Hide;
  CT.Hide;
  CC.Hide;
  CB.Hide;
  RT.Hide;
  RC.Hide;
  RB.Hide;}
  
    (pImage as TSelectImage).SetSelectionParams(X2-X1,Y2-Y1);
    (pImage as TSelectImage).FormRect((X2+X1) div 2,(Y2+Y1) div 2);
    (pImage as TSelectImage).GetSelectedImage;

 { LT.Show;
  LC.Show;
  LB.Show;
  CT.Show;
  CC.Show;
  CB.Show;
  RT.Show;
  RC.Show;
  RB.Show;}
end;

procedure TFrameObject.SelectRect(AX1,AY1,AX2,AY2:Integer);
begin
  X1:=AX1; Y1:=AY1;
  X2:=AX2; Y2:=AY2;
  Coordinate(0,0,epCenterCenter);
  DrawRect;
end;

constructor TFrameObject.Create(AOwner:TSelectImage;AStartRect:TRect);
var
  lParams:TFrameElementParams;
begin
  inherited Create;
  X1:=AStartRect.Left;
  X2:=AStartRect.Right;
  Y1:=AStartRect.Top;
  Y2:=AStartRect.Bottom;
  pImage:=AOwner;

  lParams.Owner:=pImage;
  lParams.Master:=Self;
  lParams.Left:=0;
  lParams.Top:=0;
  lParams.Width:=16;
  lParams.Height:=16;
  lParams.BorderColor:=clBlack;
  lParams.Color:=$0000DCFF;
  {
  lParams.ElementPos:=epLeftTop;
  LT:=TFrameElement.Create(lParams);

  lParams.ElementPos:=epLeftCenter;
  LC:=TFrameElement.Create(lParams);

  lParams.ElementPos:=epLeftBottom;
  LB:=TFrameElement.Create(lParams);

  lParams.ElementPos:=epCenterTop;
  CT:=TFrameElement.Create(lParams);

  lParams.ElementPos:=epCenterCenter;
  CC:=TFrameElement.Create(lParams);

  lParams.ElementPos:=epCenterBottom;
  CB:=TFrameElement.Create(lParams);

  lParams.ElementPos:=epRightTop;
  RT:=TFrameElement.Create(lParams);

  lParams.ElementPos:=epRightCenter;
  RC:=TFrameElement.Create(lParams);

  lParams.ElementPos:=epRightBottom;
  RB:=TFrameElement.Create(lParams);

  Coordinate(0,0,epCenterCenter);
  }
  DrawRect;

  pTimer:=TTimer.Create(nil);
  pTimer.OnTimer:=UpDate;
  pTimer.Interval:=10;
  StartTimer;
end;

procedure TFrameObject.StartTimer;
begin
  try
    pTimer.Enabled:=True;
  finally
  end;
end;

procedure TFrameObject.StopTimer;
begin
  try
    pTimer.Enabled:=False;
  finally
  end;
end;

procedure TFrameObject.UpDate(Sender:TObject);
var ChildElements:Array[0..8] of TFrameElement;
  i:Integer;
begin
 { ChildElements[0]:=TFrameElement(LT);
  ChildElements[1]:=TFrameElement(LC);
  ChildElements[2]:=TFrameElement(LB);
  ChildElements[3]:=TFrameElement(CT);
  ChildElements[4]:=TFrameElement(CC);
  ChildElements[5]:=TFrameElement(CB);
  ChildElements[6]:=TFrameElement(RT);
  ChildElements[7]:=TFrameElement(RC);
  ChildElements[8]:=TFrameElement(RB);

  i:=0;
  while (not ChildElements[i].pIsPressed) and (i<9) do
    i:=i+1;
  if i<>9 then
    ChildElements[i].MoveWithMouse;}
end;

procedure TFrameObject.Free;
begin
  StopTimer;
  pTimer.Free;
 { LT.Free;
  LC.Free;
  LB.Free;
  CT.Free;
  CC.Free;
  CB.Free;
  RT.Free;
  RC.Free;
  RB.Free;}
  inherited Free;
end;

//******************************************************************************
//                              TFrameElement
//******************************************************************************

constructor TFrameElement.Create(AParams:TFrameElementParams);
begin
  inherited Create(AParams.Owner{.Owner});
  Parent:=AParams.Owner as TWinControl;
  SetBounds(AParams.Left,AParams.Top,AParams.Width,AParams.Height);
  Master:=AParams.Master;
  pElementPos:=AParams.ElementPos;
  pDefaultCursor:=crDefault;
  case pElementPos of
    epLeftTop,epRightBottom: pPressedCursor:=crSizeNWSE;
    epLeftCenter,epRightCenter: pPressedCursor:=crSizeWE;
    epLeftBottom,epRightTop: pPressedCursor:=crSizeNESW;
    epCenterTop,epCenterBottom: pPressedCursor:=crSizeNS;
    epCenterCenter: pPressedCursor:=crSizeAll;
  end;
  pColor:=AParams.Color;
  pBorderColor:=AParams.BorderColor;
end;

procedure TFrameElement.WMLButtonDown(var Message:TWMMouse);
begin
  Master.ReleaseAll; // Снимаем прочие функции, чтобы выполнялась только данная
  pIsPressed:=True;
  Cursor:=pPressedCursor;
  pMouseStartPoint:=Mouse.CursorPos;
  pOwnStartPoint:=Point(Left,Top);
end;

procedure TFrameElement.WMLButtonUp(var Message:TWMMouse);
begin
  Deactivate;
  Master.DrawRect;
end;

procedure TFrameElement.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  pIsPressed:=False;
  Master.DrawRect;
end;

procedure TFrameElement.DrawElement;
begin
  Canvas.Lock;
  try
    inherited Paint;
    Canvas.Brush.Color:=pColor;
    Canvas.Pen.Color:=pBorderColor;
    Canvas.Rectangle(0,0,Width,Height);
  finally
    Canvas.Unlock;
  end;
end;

procedure TFrameElement.Deactivate;
begin
  Cursor:=pDefaultCursor;
  pIsPressed:=False;
end;

procedure TFrameElement.Paint;
begin
  DrawElement;
  inherited Paint;
end;

procedure TFrameElement.Repaint;
begin
  inherited Paint;
end;

procedure TFrameElement.MoveWithMouse;
var
  lLeft,lTop:Integer;
begin
  if pIsPressed then
    begin
      lLeft := Mouse.CursorPos.X-pMouseStartPoint.X;
      lTop  := Mouse.CursorPos.Y-pMouseStartPoint.Y;
      pMouseStartPoint:=Mouse.CursorPos;
      Master.Coordinate(lLeft,lTop,pElementPos);
    end;
end;

//******************************************************************************
//                              TSelectImage
//******************************************************************************

procedure TSelectImage.Paint;
begin
  inherited Paint;
    begin
      Canvas.Canvas.Lock;

      Canvas.Pen.Color:=pBrushColor;
      Canvas.Pen.Style:=psSolid;
      Canvas.Pen.Color:=pPenColor;
      Canvas.Pen.Style:=pPenStyle;
      Canvas.MoveTo(pRect.Left-1,pRect.Top-1);
      Canvas.LineTo(pRect.Left-1,pRect.Bottom+1);
      Canvas.LineTo(pRect.Right+1,pRect.Bottom+1);
      Canvas.LineTo(pRect.Right+1,pRect.Top-1);
      Canvas.LineTo(pRect.Left-1,pRect.Top-1);

      Canvas.Canvas.Unlock;
  end;
end;

constructor TSelectImage.Create(AOwner:TComponent;AResultImage:TImage;APenColor:TColor;ABrushColor:TColor;APenStyle:TPenStyle = psSolid);
begin
  inherited Create(AOwner);
  Parent:=AOwner as TWinControl;
  pPenColor:=APenColor;
  pBrushColor:=ABrushColor;
  pPenStyle:=APenStyle;
  XCenter:=Width div 2;
  YCenter:=Height div 2;
  OnMouseDown:=pMouseDown;
  pResultImage:=AResultImage;
  pScale:=1.5;
  pTotalScale:=1;

  // Избавляемся от контекстного меню и пр.
  Properties.PopupMenuLayout.MenuItems:=[];
  Style.HotTrack:=False;
  BorderStyle:=cxcbsNone;
  BorderWidth:=0;

  // расстояние, на которое необх. отступать от краев канвы для получения корректного изображения
  pBorderWidth:=2;

end;

procedure TSelectImage.FormRect(AXCenter,AYCenter:Integer);
begin
  XCenter:=AXCenter;
  YCenter:=AYCenter;
  pRect.Left:=XCenter-pSelWidth div 2;
  pRect.Right:=XCenter+pSelWidth div 2;
  pRect.Top:=YCenter-pSelHeight div 2;
  pRect.Bottom:=YCenter+pSelHeight div 2;
  if pRect.Left<0 then
    begin
      pRect.Right:=pRect.Right-pRect.Left;
      pRect.Left:=0;
    end;
  if pRect.Right>Width then
    begin
      pRect.Left:=pRect.Left-pRect.Right+Width;
      pRect.Right:=Width;
    end;
  if pRect.Top<0 then
    begin
      pRect.Bottom:=pRect.Bottom-pRect.Top;
      pRect.Top:=0;
    end;
  if pRect.Bottom>Height then
    begin
      pRect.Top:=pRect.Top-pRect.Bottom+Height;
      pRect.Bottom:=Height;
    end;
  Parent.SetFocus;
  Refresh; // рисуем рамку
end;

procedure TSelectImage.SetSelectionParams(ASelWidth,ASelHeight:Integer);
begin
  pSelWidth:=ASelWidth;
  pSelHeight:=ASelHeight;
  if pSelWidth>Width then pSelWidth:=Width;
  if pSelHeight>Height then pSelHeight:=Height;
  pResultImage.Picture.Bitmap.Height:=ASelHeight;
  pResultImage.Picture.Bitmap.Width:=ASelWidth;
end;

procedure TSelectImage.pMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{  case Button of
    mbLeft: begin
//              pActive:=True;
              FormRect(X,Y);
              Refresh;
              GetSelectedImage;
            end;
    end; }
end;

procedure TSelectImage.ShowActualSize;
var OldWidth, OldHeight:Integer;
begin
  OldWidth:=Width;
  OldHeight:=Height;
  Properties.Stretch:=False;
  AutoSize:=True;
  Align:=alNone;
  pTotalScale:=Max(Width/OldWidth,Height/OldHeight);
end;

procedure TSelectImage.FitOnParent;
begin
  Properties.Stretch:=True;
  AutoSize:=False;
  Align:=alClient;
  pTotalScale:=1;

  if (Parent.ClassType=TScrollBox) then
    begin
      (Parent as TScrollBox).HorzScrollBar.Visible:=False;
      (Parent as TScrollBox).VertScrollBar.Visible:=False;
    end;
end;

procedure TSelectImage.GetSelectedImage;
var Dest:TRect;
begin
   Dest.Left:=0;
   Dest.Top:=0;
   Dest.Right:=pSelWidth;
   Dest.Bottom:=pSelHeight;
   pResultImage.Canvas.CopyRect(Dest,Canvas.Canvas,pRect);
end;

procedure TSelectImage.SizePlus;
begin
  Align:=alNone;
  Properties.Stretch:=True;
  Width:=round(Width*pScale);
  Height:=round(Height*pScale);
  pTotalScale:=pTotalScale*pScale;
end;

procedure TSelectImage.SizeMinus;
begin
  if pTotalScale=1 then Exit;

  Align:=alNone;
  AutoSize:=False;
  Properties.Stretch:=True;
  Width:=round(Width/pScale);
  Height:=round(Height/pScale);
  pTotalScale:=pTotalScale/pScale;
  if round(pTotalScale*100)<=100 then
    FitOnParent;
end;

procedure TSelectImage.Free;
begin
  inherited Free;
end;

end.
