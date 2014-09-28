object FEditEQUIPMENT: TFEditEQUIPMENT
  Left = 529
  Top = 333
  Width = 272
  Height = 296
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
  object Panel1: TPanel
    Left = 0
    Top = 223
    Width = 256
    Height = 35
    Align = alBottom
    TabOrder = 5
    object cxButton1: TcxButton
      Left = 90
      Top = 6
      Width = 75
      Height = 25
      Action = Action1
      Caption = #1055#1088#1080#1085#1103#1090#1100
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 170
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 253
    Height = 46
    Alignment = alTopLeft
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    TabOrder = 0
    TabStop = False
    object cxTextEdit1: TcxTextEdit
      Left = 5
      Top = 18
      Width = 241
      Height = 21
      TabOrder = 0
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 46
    Width = 253
    Height = 41
    Alignment = alTopLeft
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    TabOrder = 1
    TabStop = False
    object cxTextEdit12: TcxMaskEdit
      Left = 6
      Top = 14
      Width = 239
      Height = 21
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      TabOrder = 0
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 0
    Top = 88
    Width = 253
    Height = 41
    Alignment = alTopLeft
    Caption = #1053#1086#1084#1077#1088
    TabOrder = 2
    TabStop = False
    object cxTextEdit3: TcxTextEdit
      Left = 5
      Top = 15
      Width = 241
      Height = 21
      TabOrder = 0
    end
  end
  object cxGroupBox5: TcxGroupBox
    Left = 0
    Top = 134
    Width = 253
    Height = 41
    Alignment = alTopLeft
    Caption = #1044#1072#1090#1072' '#1089#1087#1080#1089#1072#1085#1080#1103
    TabOrder = 3
    TabStop = False
    object cxDateEdit1: TcxDateEdit
      Left = 6
      Top = 14
      Width = 238
      Height = 21
      TabOrder = 0
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 176
    Width = 253
    Height = 43
    Alignment = alTopLeft
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1089#1087#1080#1089#1072#1085#1080#1103
    TabOrder = 4
    TabStop = False
    object cxTextEdit5: TcxTextEdit
      Left = 5
      Top = 16
      Width = 241
      Height = 21
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 9
    Top = 184
    object Action1: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 13
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 27
      OnExecute = cxButton2Click
    end
  end
end
