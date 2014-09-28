object fmMain: TfmMain
  Left = 202
  Top = 384
  Width = 591
  Height = 131
  Caption = 'fmMain'
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 74
    Width = 575
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 176
    Top = 24
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 296
    Top = 24
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 416
    Top = 24
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButtonCloseClick
  end
  object cxButtonDraft: TcxButton
    Left = 56
    Top = 24
    Width = 110
    Height = 25
    Action = FontAction
    Caption = #1064#1088#1080#1092#1090
    TabOrder = 4
  end
  object CBWith_Child: TCheckBox
    Left = 296
    Top = 58
    Width = 209
    Height = 17
    Caption = #1042#1082#1083#1102#1095#1085#1086' '#1079' '#1076#1086#1095#1110#1088#1085#1110#1084#1080' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1072#1084#1080
    Checked = True
    State = cbChecked
    TabOrder = 5
    Visible = False
  end
  object CBWith_Hide: TCheckBox
    Left = 40
    Top = 57
    Width = 153
    Height = 17
    Caption = #1053#1077' '#1074#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1074#1080#1082#1086#1085#1072#1085#1110
    TabOrder = 6
    Visible = False
  end
  object ActionList1: TActionList
    Left = 80
    Top = 48
    object FilterAction: TAction
      Caption = 'FilterAction'
      ShortCut = 16454
      OnExecute = FilterActionExecute
    end
    object PrintAction: TAction
      Caption = 'PrintAction'
      ShortCut = 121
      OnExecute = PrintActionExecute
    end
    object DesAction: TAction
      Caption = 'DesRep'
      ShortCut = 8315
    end
    object FontAction: TAction
      Caption = 'FontAction'
      ShortCut = 8262
      OnExecute = FontActionExecute
    end
  end
  object FontDialogs: TFontDialog
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    Left = 112
    Top = 48
  end
end
