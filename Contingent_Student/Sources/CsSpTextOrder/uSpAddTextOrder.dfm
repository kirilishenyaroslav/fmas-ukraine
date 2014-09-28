object fmSpAddTextOrder: TfmSpAddTextOrder
  Left = 468
  Top = 379
  Width = 433
  Height = 219
  Caption = #1060#1086#1088#1084#1072' '#1076#1086#1076#1072#1074#1072#1085#1085#1103' '#1090#1077#1082#1089#1090#1091' '#1074#1089#1090#1091#1087#1091
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
  object MemoText: TcxMemo
    Left = 8
    Top = 40
    Width = 401
    Height = 89
    Style.Color = 15850428
    TabOrder = 0
  end
  object OkButton: TcxButton
    Left = 237
    Top = 143
    Width = 75
    Height = 25
    Action = ActionSave
    TabOrder = 1
  end
  object CancelButton: TcxButton
    Left = 333
    Top = 143
    Width = 75
    Height = 25
    Action = ActionExit
    TabOrder = 2
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 12
    Width = 185
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Caption = #1058#1077#1082#1089#1090' '#1074#1089#1090#1091#1087#1091
  end
  object ActionList1: TActionList
    Left = 96
    Top = 144
    object ActionSave: TAction
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      ShortCut = 121
      OnExecute = ActionSaveExecute
    end
    object ActionExit: TAction
      Caption = #1042#1080#1081#1090#1080
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
end
