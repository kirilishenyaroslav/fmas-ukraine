object fmSP_Text_OrderEdit: TfmSP_Text_OrderEdit
  Left = 423
  Top = 400
  Width = 546
  Height = 134
  Caption = #1044#1086#1076#1072#1090#1080'/'#1047#1084#1110#1085#1080#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 17
    Top = 25
    Width = 79
    Height = 13
    Caption = #1058#1077#1082#1089#1090' '#1074#1089#1090#1091#1087#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnl1: TPanel
    Left = 0
    Top = 59
    Width = 538
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 172
      Top = 7
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 277
      Top = 7
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object cxTextEdit1: TcxTextEdit
    Left = 104
    Top = 23
    Width = 425
    Height = 21
    Properties.MaxLength = 4096
    Style.Color = clInfoBk
    TabOrder = 1
  end
end
