object FormMain: TFormMain
  Left = 486
  Top = 303
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 90
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dxStatusBar: TdxStatusBar
    Left = 0
    Top = 70
    Width = 491
    Height = 20
    Panels = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object cxButtonFont: TcxButton
    Left = 12
    Top = 23
    Width = 110
    Height = 25
    Action = FontAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object cxButtonFilter: TcxButton
    Left = 132
    Top = 23
    Width = 110
    Height = 25
    Action = FilterAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object cxButtonApply: TcxButton
    Left = 252
    Top = 23
    Width = 110
    Height = 25
    Action = PrintAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object cxButtonCancel: TcxButton
    Left = 372
    Top = 23
    Width = 110
    Height = 25
    Hint = #1047#1072#1082#1088#1080#1090#1080' '#1087#1086#1090#1086#1095#1085#1077' '#1074#1110#1082#1085#1086
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = cxButtonCancelClick
  end
  object FontDialog: TFontDialog
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    Left = 112
    Top = 8
  end
  object ActionList: TActionList
    Left = 80
    object FilterAction: TAction
      Caption = #1060#1110#1083#1100#1090#1088
      Hint = #1042#1110#1076#1086#1073#1088#1072#1079#1080#1090#1080' '#1074#1110#1082#1085#1086' '#1092#1110#1083#1100#1090#1088#1110#1074
      ShortCut = 16454
      OnExecute = FilterActionExecute
    end
    object PrintAction: TAction
      Caption = #1043#1072#1088#1072#1079#1076
      Hint = #1055#1086#1095#1072#1090#1080' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1079#1074#1110#1090#1091
      ShortCut = 121
      OnExecute = PrintActionExecute
    end
    object FontAction: TAction
      Caption = #1064#1088#1080#1092#1090
      Hint = #1042#1110#1076#1086#1073#1088#1072#1079#1080#1090#1080' '#1074#1110#1082#1085#1086' '#1085#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1096#1088#1080#1092#1090#1091
      ShortCut = 8262
      OnExecute = FontActionExecute
    end
  end
end
