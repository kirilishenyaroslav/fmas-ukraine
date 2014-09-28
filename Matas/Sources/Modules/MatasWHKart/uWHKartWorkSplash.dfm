object SplashForm: TSplashForm
  Left = 365
  Top = 288
  BorderStyle = bsNone
  ClientHeight = 73
  ClientWidth = 392
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MsgLabel: TLabel
    Left = 8
    Top = 48
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
  object ProgressBar: TProgressBar
    Left = 9
    Top = 16
    Width = 375
    Height = 25
    Smooth = True
    TabOrder = 0
  end
end
