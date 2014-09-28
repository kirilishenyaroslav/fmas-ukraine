object SplashForm: TSplashForm
  Left = 305
  Top = 260
  BorderStyle = bsNone
  ClientHeight = 81
  ClientWidth = 492
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
    Width = 492
    Height = 81
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object MsgLabel: TLabel
      Left = 104
      Top = 60
      Width = 149
      Height = 13
      Caption = #1048#1076#1077#1090' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1072#1085#1085#1099#1093
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TitleLabel: TLabel
      Left = 104
      Top = 9
      Width = 4
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ProgressBar: TProgressBar
      Left = 105
      Top = 32
      Width = 375
      Height = 25
      Smooth = True
      TabOrder = 0
    end
    object Animate1: TAnimate
      Left = 13
      Top = 15
      Width = 80
      Height = 50
      CommonAVI = aviFindFolder
      StopFrame = 29
    end
  end
end
