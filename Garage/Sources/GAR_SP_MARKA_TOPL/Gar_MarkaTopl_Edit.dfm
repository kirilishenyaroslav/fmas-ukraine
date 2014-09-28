object FEditMarkaTopl: TFEditMarkaTopl
  Left = 846
  Top = 531
  Width = 270
  Height = 119
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 46
    Width = 254
    Height = 35
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 88
      Top = 6
      Width = 75
      Height = 25
      Action = Action1
      Caption = #1055#1088#1080#1085#1103#1090#1100
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 168
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object GroupBoxProp: TcxGroupBox
    Left = 1
    Top = 1
    Width = 250
    Height = 41
    Alignment = alTopLeft
    Caption = #1052#1072#1088#1082#1072' '#1090#1086#1087#1083#1080#1074#1072
    TabOrder = 0
    TabStop = False
    object cxMaskEdit1: TcxMaskEdit
      Left = 5
      Top = 15
      Width = 240
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      TabOrder = 0
    end
  end
  object Actions: TActionList
    Left = 264
    Top = 373
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
    end
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ShortCut = 45
    end
    object ActionDel: TAction
      Caption = 'ActionDel'
      ShortCut = 46
    end
    object ActionClean: TAction
      Caption = 'ActionClean'
      ShortCut = 117
    end
  end
  object ActionList1: TActionList
    Left = 25
    Top = 51
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
  end
end
