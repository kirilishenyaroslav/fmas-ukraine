object fmCryptDo: TfmCryptDo
  Left = 402
  Top = 302
  Width = 588
  Height = 332
  Caption = 'fmCryptDo'
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
  object cxMemo1: TcxMemo
    Left = 8
    Top = 8
    Width = 561
    Height = 89
    Lines.Strings = (
      'cxMemo1')
    TabOrder = 0
  end
  object cxMemo2: TcxMemo
    Left = 8
    Top = 160
    Width = 561
    Height = 89
    Lines.Strings = (
      'cxMemo2')
    TabOrder = 1
  end
  object ButtonCrypt: TcxButton
    Left = 64
    Top = 120
    Width = 113
    Height = 25
    Caption = #1047#1072#1096#1080#1092#1088#1091#1074#1072#1090#1080
    TabOrder = 2
    OnClick = ButtonCryptClick
  end
  object ButtonUnCrypt: TcxButton
    Left = 360
    Top = 120
    Width = 113
    Height = 25
    Caption = #1056#1086#1079#1096#1080#1092#1088#1091#1074#1072#1090#1080
    TabOrder = 3
    OnClick = ButtonUnCryptClick
  end
  object cxButton1: TcxButton
    Left = 368
    Top = 264
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 4
    OnClick = cxButton1Click
  end
end
