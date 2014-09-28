object fmMain: TfmMain
  Left = 202
  Top = 384
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fmMain'
  ClientHeight = 93
  ClientWidth = 489
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 74
    Width = 489
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 131
    Top = 14
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 251
    Top = 14
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 371
    Top = 14
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButtonCloseClick
  end
  object cxButtonDraft: TcxButton
    Left = 11
    Top = 14
    Width = 110
    Height = 25
    Action = FontAction
    Caption = #1064#1088#1080#1092#1090
    TabOrder = 4
  end
  object chNotDismiss: TCheckBox
    Left = 11
    Top = 52
    Width = 16
    Height = 17
    TabOrder = 5
  end
  object lblNotDismiss: TcxLabel
    Left = 29
    Top = 51
    Width = 199
    Height = 20
    ParentFont = False
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 6
    Caption = #1053#1077' '#1084#1072#1108' '#1085#1072#1082#1072#1079#1091' '#1085#1072' '#1079#1074#1110#1083#1100#1085#1077#1085#1085#1103
  end
  object ActionList1: TActionList
    Left = 32
    Top = 16
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
    Left = 64
    Top = 16
  end
end
