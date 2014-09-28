object fmMain: TfmMain
  Left = 376
  Top = 378
  Width = 510
  Height = 162
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
    Top = 105
    Width = 494
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 129
    Top = 72
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 249
    Top = 72
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 369
    Top = 72
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButtonCloseClick
  end
  object cxButtonDraft: TcxButton
    Left = 9
    Top = 72
    Width = 110
    Height = 25
    Action = FontAction
    Caption = #1064#1088#1080#1092#1090
    TabOrder = 4
  end
  object lblMan: TcxLabel
    Left = 39
    Top = 14
    Width = 83
    Height = 17
    TabOrder = 5
    Caption = #1060#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072
  end
  object lblNumCert: TcxLabel
    Left = 16
    Top = 40
    Width = 109
    Height = 17
    TabOrder = 6
    Caption = #1053#1086#1084#1077#1088' '#1074#1110#1076#1088#1103#1076#1078#1077#1085#1085#1103
  end
  object ManSpr: TcxButtonEdit
    Left = 127
    Top = 14
    Width = 345
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = False
    Properties.OnButtonClick = ManSprPropertiesButtonClick
    TabOrder = 7
    OnKeyPress = ManSprKeyPress
  end
  object NumCert: TcxTextEdit
    Left = 128
    Top = 40
    Width = 121
    Height = 21
    Properties.MaxLength = 10
    TabOrder = 8
  end
  object ActionList1: TActionList
    Left = 88
    Top = 64
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
    Left = 120
    Top = 64
  end
end
