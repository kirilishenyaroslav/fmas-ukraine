object fmPropIncomeAdd: TfmPropIncomeAdd
  Left = 447
  Top = 219
  Width = 569
  Height = 273
  Caption = 'fmPropIncomeAdd'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel4: TcxLabel
    Left = 8
    Top = 67
    Width = 185
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = #1053#1072#1079#1074#1072' '#1086#1079#1085#1072#1082#1080' '#1076#1086#1093#1086#1076#1072
  end
  object MemoName: TcxMemo
    Left = 8
    Top = 90
    Width = 513
    Height = 89
    Lines.Strings = (
      '')
    Style.Color = clWindow
    TabOrder = 1
  end
  object OkButton: TcxButton
    Left = 346
    Top = 196
    Width = 75
    Height = 25
    Caption = 'OkButton'
    TabOrder = 2
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 442
    Top = 196
    Width = 75
    Height = 25
    Caption = #1042#1080#1081#1090#1080
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 11
    Width = 185
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1050#1086#1076' '#1086#1079#1085#1072#1082#1080' '#1076#1086#1093#1086#1076#1072
  end
  object TextEditKod: TcxTextEdit
    Left = 8
    Top = 36
    Width = 161
    Height = 21
    TabOrder = 5
  end
  object ActionList1: TActionList
    Left = 408
    Top = 143
    object ActionSave: TAction
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      ShortCut = 121
    end
    object ActionExit: TAction
      Caption = #1042#1080#1081#1090#1080
      ShortCut = 27
    end
  end
end
