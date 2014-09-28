object fmMain: TfmMain
  Left = 376
  Top = 378
  Width = 507
  Height = 133
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
    Top = 76
    Width = 491
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 133
    Top = 14
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 253
    Top = 14
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 373
    Top = 14
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButtonCloseClick
  end
  object cxButtonDraft: TcxButton
    Left = 13
    Top = 14
    Width = 110
    Height = 25
    Action = FontAction
    Caption = #1064#1088#1080#1092#1090
    TabOrder = 4
  end
  object IsShowPochas: TcxCheckBox
    Left = 12
    Top = 47
    Width = 157
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1082#1083#1102#1095#1072#1090#1080' '#1087#1086#1095#1072#1089#1086#1074#1080#1082#1110#1074
    TabOrder = 5
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
