object SplashForm: TSplashForm
  Left = 274
  Top = 327
  BorderStyle = bsNone
  ClientHeight = 73
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 593
    Height = 73
    Align = alClient
    BevelInner = bvLowered
    Color = clInfoBk
    TabOrder = 0
    object Title: TLabel
      Left = 88
      Top = 8
      Width = 61
      Height = 16
      Caption = 'msgTitle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MsgLabel: TLabel
      Left = 88
      Top = 51
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Animate1: TAnimate
      Left = 2
      Top = 11
      Width = 64
      Height = 64
      CommonAVI = aviFindFolder
      StopFrame = 22
    end
    object Progress: TProgressBar
      Left = 88
      Top = 28
      Width = 500
      Height = 20
      TabOrder = 1
    end
  end
end
