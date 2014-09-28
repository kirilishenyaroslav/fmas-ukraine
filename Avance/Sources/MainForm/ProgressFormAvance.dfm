object fmProgressFormAvance: TfmProgressFormAvance
  Left = 316
  Top = 301
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 103
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Animate1: TAnimate
    Left = 24
    Top = 8
    Width = 304
    Height = 60
    CommonAVI = aviDeleteFile
    StopFrame = 24
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 80
    Width = 473
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Orientation = cxoLeftTop
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 1
    Caption = ''
  end
end
