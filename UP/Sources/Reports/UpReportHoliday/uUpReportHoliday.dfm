object fmMain: TfmMain
  Left = 202
  Top = 384
  Width = 591
  Height = 177
  Caption = 'fmMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 120
    Width = 575
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 176
    Top = 87
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 7
  end
  object cxButtonPrint: TcxButton
    Left = 296
    Top = 87
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    TabOrder = 8
  end
  object cxButtonClose: TcxButton
    Left = 416
    Top = 87
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 9
    OnClick = cxButtonCloseClick
  end
  object cxButtonDraft: TcxButton
    Left = 56
    Top = 87
    Width = 110
    Height = 25
    Action = FontAction
    Caption = #1064#1088#1080#1092#1090
    TabOrder = 6
  end
  object cxDecret: TcxCheckBox
    Left = 18
    Top = 36
    Width = 363
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1079#1072#1083#1080#1096#1082#1080' '#1079#1072' '#1076#1077#1082#1088#1077#1090#1085#1080#1084#1080' '#1074#1110#1076#1087#1091#1089#1090#1082#1072#1084#1080
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object LabelDateForm: TcxLabel
    Left = 56
    Top = 12
    Width = 57
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = #1055#1077#1088#1110#1086#1076':'
  end
  object cxLabel1: TcxLabel
    Left = 136
    Top = 12
    Width = 17
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Caption = #1079
  end
  object cxDateBeg: TcxDateEdit
    Left = 171
    Top = 10
    Width = 122
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DateButtons = [btnToday]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
  end
  object cxLabel2: TcxLabel
    Left = 304
    Top = 12
    Width = 25
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1087#1086
  end
  object cxDateEnd: TcxDateEdit
    Left = 344
    Top = 10
    Width = 122
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DateButtons = [btnToday]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
  end
  object cxShowDekr: TcxCheckBox
    Left = 18
    Top = 61
    Width = 551
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = 
      #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1079#1072#1083#1080#1096#1082#1080' '#1091' '#1090#1080#1093' '#1083#1102#1076#1077#1081', '#1093#1090#1086' '#1079#1072#1088#1072#1079' '#1079#1085#1072#1093#1086#1076#1080#1090#1100#1089#1103' '#1091' '#1076#1077#1082#1088#1077#1090#1085 +
      #1080#1093' '#1074#1110#1076#1087#1091#1089#1090#1082#1072#1093
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
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
