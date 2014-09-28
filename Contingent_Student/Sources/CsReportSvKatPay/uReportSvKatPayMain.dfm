object fmReportSvKatPay: TfmReportSvKatPay
  Left = 425
  Top = 322
  Width = 413
  Height = 119
  Caption = 'fmReportSvKatPay'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 62
    Width = 397
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 32
    Top = 24
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 152
    Top = 24
    Width = 110
    Height = 25
    Action = PrintAction
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 272
    Top = 24
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButtonCloseClick
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
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
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
