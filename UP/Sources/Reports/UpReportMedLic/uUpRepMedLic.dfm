object fmMain: TfmMain
  Left = 376
  Top = 378
  Width = 503
  Height = 158
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
    Top = 101
    Width = 487
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 127
    Top = 13
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 2
  end
  object cxButtonPrint: TcxButton
    Left = 247
    Top = 13
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    TabOrder = 3
  end
  object cxButtonClose: TcxButton
    Left = 367
    Top = 13
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 4
    OnClick = cxButtonCloseClick
  end
  object cxButtonDraft: TcxButton
    Left = 7
    Top = 13
    Width = 110
    Height = 25
    Action = FontAction
    Caption = #1064#1088#1080#1092#1090
    TabOrder = 0
  end
  object chPeriod: TCheckBox
    Left = 8
    Top = 51
    Width = 233
    Height = 17
    Caption = #1055#1077#1088#1110#1086#1076' '#1086#1089#1090#1072#1085#1085#1100#1086#1075#1086' '#1084#1077#1076#1086#1075#1083#1103#1076#1091' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = chPeriodClick
  end
  object PeriodBeg: TcxDateEdit
    Left = 22
    Top = 73
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object PeriodEnd: TcxDateEdit
    Left = 175
    Top = 73
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object lblPeriodBeg: TcxLabel
    Left = 6
    Top = 72
    Width = 16
    Height = 20
    ParentFont = False
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 8
    Caption = #1079
  end
  object lblPeriodEnd: TcxLabel
    Left = 151
    Top = 72
    Width = 24
    Height = 20
    ParentFont = False
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 9
    Caption = #1087#1086
  end
  object ActionList1: TActionList
    Left = 216
    Top = 32
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
    Left = 256
    Top = 32
  end
end
