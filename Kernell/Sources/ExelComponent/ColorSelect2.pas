unit ColorSelect2;

{-
********************************************************************************
******* XLSReadWriteII V3.00                                             *******
*******                                                                  *******
******* Copyright(C) 1999,2006 Lars Arvidsson, Axolot Data               *******
*******                                                                  *******
******* email: components@axolot.com                                     *******
******* URL:   http://www.axolot.com                                     *******
********************************************************************************
** Users of the XLSReadWriteII component must accept the following            **
** disclaimer of warranty:                                                    **
**                                                                            **
** XLSReadWriteII is supplied as is. The author disclaims all warranties,     **
** expressedor implied, including, without limitation, the warranties of      **
** merchantability and of fitness for any purpose. The author assumes no      **
** liability for damages, direct or consequential, which may result from the  **
** use of XLSReadWriteII.                                                     **
********************************************************************************
}

{$B-}
{$H+}
{$R-}
{$I XLSRWII2.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, BIFFRecsII2, Buttons, TypInfo, ComCtrls,
  ToolWin,ImgList;

type
  TfrmExcelColorSelect = class(TForm)
    ImageList: TImageList;
    pbColors: TPaintBox;
    Button1: TButton;
    Button2: TButton;
    ToolBar1: TToolBar;
    btnNoColor: TToolButton;
    procedure pbColorsPaint(Sender: TObject);
    procedure pbColorsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnNoColorClick(Sender: TObject);
  private
    FColorIndex: integer;

    procedure SetColorIndex(Value: integer);
    function  ColorIndexToRect: TRect;
    procedure DrawColors;
    procedure ColorsPaintOver;
  public
    function Execute(var Color: TExcelColor): boolean;

    property EditorColor: integer read FColorIndex write SetColorIndex;
  end;

implementation

{$R *.DFM}

const TExcelColorPalette64: array[0..64] of integer = (
      $000400,$003494,$003431,$003400,$633400,$840400,$943431,$313431,
      $000484,$0065FF,$008684,$008600,$848600,$FF0400,$946563,$848684,
      $0004FF,$0096FF,$00C794,$639631,$C6C731,$FF6531,$840484,$949694,
      $FF04FF,$00C7FF,$00FFFF,$00FF00,$FFFF00,$FFC700,$633494,$C6C7C6,
      $C696FF,$94CFFF,$94FFFF,$C6FFC6,$FFFFC6,$FFCF94,$FF96C6,$FFFFFE,
      $FF9694,$633494,$C6FFFF,$FFFFC6,$630463,$8486FF,$C66500,$FFC7C6,
      $840400,$FF04FF,$00FFFF,$FFFF00,$840484,$000484,$848600,$FF0400,
      $FFFFFF,$FFFFFF,$FFFFFF,$FFFFFF,$FFFFFF,$FFFFFF,$FFFFFF,$FFFFFF,$FFFFFF);

const ExcelColorXltTbl_In: array[0..64] of byte = (
      00,00,00,00,00,00,00,00,
      00,39,16,27,13,26,24,28,
      08,11,05,10,22,12,31,15,
      40,41,42,43,44,45,46,47,
      48,49,50,51,52,53,54,55,
      29,36,35,34,37,32,38,33,
      21,20,18,25,17,09,14,23,
      04,19,03,02,01,30,06,07,
      64);

const ExcelColorXltTbl_Out: array[0..64] of byte = (
//
      08,60,59,58,56,18,62,63,
      16,53,19,17,21,12,54,23,
      10,52,50,57,49,48,20,55,
      14,51,13,11,15,40,61,22,
      45,47,43,42,41,44,46,09,
      24,25,26,27,28,29,30,31,
      32,33,34,35,36,37,38,39,
      00,00,00,00,00,00,00,00,
      64);

procedure TfrmExcelColorSelect.SetColorIndex(Value: integer);
begin
  if Value > 55 then begin
    btnNoColor.Down := True;
    FColorIndex := Integer(xcAutomatic);
  end
  else                            
    FColorIndex := Value;
  ColorsPaintOver;
end;

function TfrmExcelColorSelect.ColorIndexToRect: TRect;
begin
  Result.Left := (FColorIndex mod 8) * 18;
  Result.Top := (FColorIndex div 8) * 18;
  Result.Right := Result.Left + 20;
  Result.Bottom := Result.Top + 20;
end;

procedure TfrmExcelColorSelect.ColorsPaintOver;
var
  R: TRect;
begin
  if FColorIndex >= 0 then begin
    R := ColorIndexToRect;
    pbColors.Canvas.Pen.Color := clBtnFace;
    pbColors.Canvas.Brush.Color := clBtnFace;
    pbColors.Canvas.Rectangle(R.Left,R.Top,R.Right,R.Bottom);
    pbColors.Canvas.Pen.Color := clBlack;
    pbColors.Canvas.Brush.Color := TExcelColorPalette64[FColorIndex];
    pbColors.Canvas.Rectangle(R.Left + 4,R.Top + 4,R.Right - 4,R.Bottom - 4);
  end;
end;

procedure TfrmExcelColorSelect.DrawColors;
var
  X,Y,i,j: integer;
begin
  Y := 4;
  pbColors.Canvas.Pen.Color := clBlack;
  for j := 0 to 6 do begin
    X := 4;
    for i := 0 to 7 do begin
      pbColors.Canvas.Brush.Color := TExcelColorPalette64[i + j * 8];
      pbColors.Canvas.Rectangle(X,Y,X + 12,Y + 12);
      Inc(X,18);
    end;
    Inc(Y,18);
  end;
end;

procedure TfrmExcelColorSelect.pbColorsPaint(Sender: TObject);
var
  R: TRect;
begin
  DrawColors;
  if FColorIndex >= 0 then begin
    R := ColorIndexToRect;
    DrawEdge(pbColors.Canvas.Handle,R,BDR_SUNKENINNER,BF_TOPLEFT);
    DrawEdge(pbColors.Canvas.Handle,R,BDR_SUNKENOUTER,BF_BOTTOMRIGHT);
  end;
end;

procedure TfrmExcelColorSelect.pbColorsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  R: TRect;
begin
  btnNoColor.Down := False;
  ColorsPaintOver;
  FColorIndex := (X div 18) + (Y div 18) * 8;
  if FColorIndex < 0 then
    FColorIndex := 0;
  if FColorIndex > High(TExcelColorPalette64) then
    FColorIndex := High(TExcelColorPalette64);
  R := ColorIndexToRect;
  DrawEdge(pbColors.Canvas.Handle,R,BDR_SUNKENINNER,BF_TOPLEFT);
  DrawEdge(pbColors.Canvas.Handle,R,BDR_SUNKENOUTER,BF_BOTTOMRIGHT);
  if ssDouble in Shift then
    ModalResult := mrOk;
end;

procedure TfrmExcelColorSelect.btnNoColorClick(Sender: TObject);
begin
  ColorsPaintOver;
  if btnNoColor.Down then
    FColorIndex := Integer(xcAutomatic);
end;

function TfrmExcelColorSelect.Execute(var Color: TExcelColor): boolean;
begin
  FColorIndex := ExcelColorXltTbl_In[Integer(Color)];
  ShowModal;
  Result := ModalResult = mrOk;
  if Result then
    Color := TExcelColor(ExcelColorXltTbl_Out[FColorIndex]);
end;

end.


