object fmReportNation: TfmReportNation
  Left = 458
  Top = 354
  Width = 507
  Height = 140
  Caption = 'fmReportNation'
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
    Top = 83
    Width = 491
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 136
    Top = 24
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 256
    Top = 24
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 376
    Top = 24
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButtonCloseClick
  end
  object cxButtonDraft: TcxButton
    Left = 16
    Top = 24
    Width = 110
    Height = 25
    Action = FontAction
    Caption = #1064#1088#1080#1092#1090
    TabOrder = 4
  end
  object cx_ShowWithoutAge: TcxCheckBox
    Left = 16
    Top = 56
    Width = 377
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1091' '#1079#1074#1110#1090#1110' '#1076#1110#1090#1077#1081', '#1091' '#1103#1082#1080#1093' '#1085#1077' '#1074#1082#1072#1079#1072#1085#1086' '#1076#1072#1090#1091' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
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
