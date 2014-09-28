object Form2: TForm2
  Left = 569
  Top = 168
  Width = 637
  Height = 255
  Caption = #1060#1110#1083#1100#1090#1088' ['#1044#1086#1074#1110#1076#1085#1080#1082'  '#1096#1072#1073#1083#1086#1085#1110#1074']'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 175
    Width = 621
    Height = 42
    Align = alBottom
    TabOrder = 0
    object ButtonYes: TcxButton
      Left = 458
      Top = 10
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
    end
    object ButtonCancel: TcxButton
      Left = 537
      Top = 10
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 3
    Top = 5
    Width = 609
    Height = 53
    Alignment = alTopLeft
    Caption = #1055#1077#1088#1110#1086#1076':'
    TabOrder = 1
  end
  object cxGroupBox2: TcxGroupBox
    Left = 4
    Top = 57
    Width = 609
    Height = 53
    Alignment = alTopLeft
    Caption = #1060#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072':'
    TabOrder = 2
  end
  object cxGroupBox3: TcxGroupBox
    Left = 5
    Top = 109
    Width = 609
    Height = 53
    Alignment = alTopLeft
    Caption = #1055#1077#1088#1110#1086#1076
    TabOrder = 3
  end
  object ActionList: TActionList
    Left = 36
    Top = 16
    object ActionYes: TAction
      Caption = #1054#1073#1088#1072#1090#1080
      ShortCut = 121
    end
    object ActionCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
    end
  end
end
