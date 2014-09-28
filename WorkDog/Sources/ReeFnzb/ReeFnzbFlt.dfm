object FnzbFormFlt: TFnzbFormFlt
  Left = 392
  Top = 368
  Width = 354
  Height = 191
  Caption = #1060#1110#1083#1100#1090#1088' '#1085#1072' '#1092#1110#1085#1072#1085#1089#1086#1074#1110' '#1079#1086#1073#1086#1074#39#1103#1079#1072#1085#1085#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 0
    Top = -8
    Width = 338
    Height = 121
    TabOrder = 0
    object RegNumEdit: TcxTextEdit
      Left = 24
      Top = 40
      Width = 121
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object cxCheckBox1: TcxCheckBox
      Left = 0
      Top = 16
      Width = 337
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
      TabOrder = 1
      OnClick = cxCheckBox1Click
    end
    object cxCheckBox2: TcxCheckBox
      Left = 1
      Top = 64
      Width = 264
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1053#1086#1084#1077#1088' '#1088#1077#1108#1089#1090#1088#1072', '#1091' '#1103#1082#1086#1084#1091' '#1084#1110#1089#1090#1080#1090#1100#1089#1103' '#1076#1086#1082#1091#1084#1077#1085#1090':'
      TabOrder = 2
      OnClick = cxCheckBox2Click
    end
    object NumEdit: TcxTextEdit
      Left = 24
      Top = 88
      Width = 121
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 112
    Width = 337
    Height = 41
    TabOrder = 1
    object btn1: TButton
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 240
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = btn2Click
    end
  end
end
