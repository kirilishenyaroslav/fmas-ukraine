object fmMain: TfmMain
  Left = 202
  Top = 384
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fmMain'
  ClientHeight = 101
  ClientWidth = 583
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
    Top = 82
    Width = 583
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 176
    Top = 48
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 296
    Top = 48
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 416
    Top = 48
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButtonCloseClick
  end
  object cxButtonDraft: TcxButton
    Left = 56
    Top = 48
    Width = 110
    Height = 25
    Action = FontAction
    Caption = #1064#1088#1080#1092#1090
    TabOrder = 4
  end
  object LabelDateWork: TcxLabel
    Left = 64
    Top = 18
    Width = 73
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Caption = #1055#1088#1072#1094#1102#1108' '#1076#1086
  end
  object WorkEdit: TcxDateEdit
    Left = 144
    Top = 16
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
    TabOrder = 6
  end
  object LabelDateStd: TcxLabel
    Left = 288
    Top = 18
    Width = 100
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Caption = #1028' '#1074#1080#1073#1088#1072#1085#1085#1103' '#1085#1072
  end
  object StdEdit: TcxDateEdit
    Left = 392
    Top = 16
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
    TabOrder = 8
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
