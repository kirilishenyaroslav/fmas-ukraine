object fmSpGrantMinAdd: TfmSpGrantMinAdd
  Left = 385
  Top = 359
  Width = 551
  Height = 277
  Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1076#1072#1085#1080#1093' '#1079#1072' '#1084#1110#1085#1110#1084#1072#1083#1100#1085#1086#1111' '#1089#1090#1080#1087#1077#1085#1076#1110#1108#1102
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
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 145
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clMaroon
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = #1052#1110#1085#1110#1084#1072#1083#1100#1085#1072' '#1089#1091#1084#1072
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 39
    Width = 25
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Caption = #1047
  end
  object cxLabel3: TcxLabel
    Left = 164
    Top = 39
    Width = 25
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
    Caption = #1055#1086
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 74
    Width = 185
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 9
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072
  end
  object DateEditBeg: TcxDateEdit
    Left = 28
    Top = 37
    Width = 125
    Height = 21
    TabOrder = 2
  end
  object DateEditEnd: TcxDateEdit
    Left = 191
    Top = 37
    Width = 125
    Height = 21
    TabOrder = 3
  end
  object MemoNote: TcxMemo
    Left = 8
    Top = 97
    Width = 513
    Height = 89
    Lines.Strings = (
      '')
    TabOrder = 4
  end
  object OkButton: TcxButton
    Left = 352
    Top = 203
    Width = 75
    Height = 25
    Caption = 'OkButton'
    TabOrder = 5
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 448
    Top = 203
    Width = 75
    Height = 25
    Caption = #1042#1080#1081#1090#1080
    TabOrder = 6
    OnClick = CancelButtonClick
  end
  object TextEditMinSum: TcxCurrencyEdit
    Left = 144
    Top = 7
    Width = 169
    Height = 21
    Properties.DecimalPlaces = 5
    Properties.DisplayFormat = ',0.00;'
    TabOrder = 1
    OnKeyPress = TextEditMinSumKeyPress
  end
  object ActionList1: TActionList
    Left = 408
    Top = 88
    object ActionSave: TAction
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      ShortCut = 121
      OnExecute = OkButtonClick
    end
    object ActionExit: TAction
      Caption = #1042#1080#1081#1090#1080
      ShortCut = 27
      OnExecute = CancelButtonClick
    end
  end
end
