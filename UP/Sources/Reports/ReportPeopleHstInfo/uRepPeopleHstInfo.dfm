object fmMain: TfmMain
  Left = 376
  Top = 378
  Width = 507
  Height = 195
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1060#1110#1083#1100#1090#1088
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
    Top = 142
    Width = 499
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 16
    Top = 117
    Width = 110
    Height = 24
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 1
    Visible = False
  end
  object cxButtonPrint: TcxButton
    Left = 256
    Top = 117
    Width = 110
    Height = 24
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 376
    Top = 117
    Width = 110
    Height = 24
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButtonCloseClick
  end
  object cxButtonDraft: TcxButton
    Left = 136
    Top = 117
    Width = 110
    Height = 24
    Action = FontAction
    Caption = #1064#1088#1080#1092#1090
    TabOrder = 4
  end
  object dePeriodBeg: TcxDateEdit
    Left = 98
    Top = 5
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object dePeriodEnd: TcxDateEdit
    Left = 98
    Top = 34
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object lblPeriodBeg: TcxLabel
    Left = 20
    Top = 5
    Width = 64
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 7
    Caption = #1055#1077#1088#1110#1086#1076' '#1079
  end
  object lblPeriodEnd: TcxLabel
    Left = 22
    Top = 33
    Width = 72
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 8
    Caption = #1055#1077#1088#1110#1086#1076' '#1087#1086
  end
  object teTimeBeg: TcxTimeEdit
    Left = 325
    Top = 4
    Width = 121
    Height = 21
    EditValue = 0.000000000000000000
    TabOrder = 9
  end
  object teTimeEnd: TcxTimeEdit
    Left = 325
    Top = 31
    Width = 121
    Height = 21
    EditValue = 0.000000000000000000
    TabOrder = 10
  end
  object lblTimeBeg: TcxLabel
    Left = 272
    Top = 4
    Width = 43
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 11
    Caption = #1063#1072#1089' '#1079
  end
  object lblTimeEnd: TcxLabel
    Left = 272
    Top = 30
    Width = 51
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 12
    Caption = #1063#1072#1089' '#1087#1086
  end
  object IsOnlyExchanged: TcxCheckBox
    Left = 25
    Top = 60
    Width = 432
    Height = 24
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1056#1086#1079#1075#1083#1103#1076#1072#1090#1080' '#1090#1110#1083#1100#1082#1080' '#1079#1084#1110#1085#1080' '#1110#1079' '#1079#1086#1074#1085#1110#1096#1085#1110#1093' '#1089#1080#1089#1090#1077#1084' ('#1089#1080#1085#1093#1088#1086#1085#1110#1079#1072#1094#1110#1103')'
    State = cbsChecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 13
  end
  object CheckByMan: TcxCheckBox
    Left = 25
    Top = 86
    Width = 432
    Height = 24
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1060#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080' '#1087#1086' '#1092#1110#1079#1080#1095#1085#1110#1081' '#1086#1089#1086#1073#1110
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 14
  end
  object ActionList1: TActionList
    Left = 232
    Top = 8
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
    Left = 232
    Top = 40
  end
end
