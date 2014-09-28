object fmGrantRulesAdd: TfmGrantRulesAdd
  Left = 348
  Top = 307
  Width = 558
  Height = 377
  Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1076#1072#1085#1085#1080#1093' '#1087#1088#1086' '#1088#1086#1079#1084#1110#1088#1080' '#1089#1090#1080#1087#1077#1085#1076#1110#1081
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
  object LabelSubType: TcxLabel
    Left = 8
    Top = 8
    Width = 97
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clMaroon
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = #1058#1080#1087' '#1089#1090#1080#1087#1077#1085#1076#1110#1111
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 119
    Width = 25
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
    Caption = #1047
  end
  object cxLabel3: TcxLabel
    Left = 164
    Top = 119
    Width = 25
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
    Caption = #1055#1086
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 179
    Width = 185
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 12
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072
  end
  object DateEditBeg: TcxDateEdit
    Left = 28
    Top = 117
    Width = 125
    Height = 21
    TabOrder = 5
  end
  object DateEditEnd: TcxDateEdit
    Left = 191
    Top = 117
    Width = 125
    Height = 21
    TabOrder = 6
  end
  object MemoNote: TcxMemo
    Left = 8
    Top = 202
    Width = 513
    Height = 89
    Lines.Strings = (
      '')
    TabOrder = 7
  end
  object OkButton: TcxButton
    Left = 352
    Top = 302
    Width = 75
    Height = 25
    Caption = 'OkButton'
    TabOrder = 8
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 448
    Top = 302
    Width = 75
    Height = 25
    Caption = #1042#1080#1081#1090#1080
    TabOrder = 9
    OnClick = CancelButtonClick
  end
  object Labelkoef: TcxLabel
    Left = 8
    Top = 59
    Width = 185
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 13
    Caption = #1050#1086#1077#1092#1110#1094#1110#1108#1085#1090
  end
  object LabelAddSum: TcxLabel
    Left = 8
    Top = 88
    Width = 185
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 14
    Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1072' '#1089#1091#1084#1072' '#1076#1086' '#1089#1090#1080#1087#1077#1085#1076#1110#1111
  end
  object ButtonEditSubType: TcxButtonEdit
    Left = 136
    Top = 7
    Width = 385
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEditSubTypePropertiesButtonClick
    Style.Color = clWindow
    TabOrder = 1
  end
  object LabelMinGrant: TcxLabel
    Left = 8
    Top = 33
    Width = 121
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 15
    Caption = #1052#1110#1085#1110#1084#1072#1083#1100#1085#1072' '#1089#1091#1084#1072
  end
  object ButtonEditMinGrant: TcxButtonEdit
    Left = 136
    Top = 32
    Width = 385
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEditMinGrantPropertiesButtonClick
    Style.Color = clWindow
    TabOrder = 2
    OnExit = TextEditKoefExit
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 150
    Width = 97
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clMaroon
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 16
    Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072
  end
  object TextEditKoef: TcxCurrencyEdit
    Left = 192
    Top = 57
    Width = 169
    Height = 21
    Properties.DecimalPlaces = 5
    Properties.DisplayFormat = ',0.0000;'
    TabOrder = 3
    OnExit = TextEditKoefExit
    OnKeyPress = TextEditKoefKeyPress
  end
  object TextEditAddSum: TcxCurrencyEdit
    Left = 192
    Top = 87
    Width = 169
    Height = 21
    Properties.DecimalPlaces = 5
    Properties.DisplayFormat = ',0.00;'
    TabOrder = 4
    OnExit = TextEditKoefExit
    OnKeyPress = TextEditKoefKeyPress
  end
  object TextEditAllSum: TcxCurrencyEdit
    Left = 192
    Top = 148
    Width = 169
    Height = 21
    ParentFont = False
    Properties.DecimalPlaces = 5
    Properties.DisplayFormat = ',0.00;'
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clMaroon
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 17
    OnExit = TextEditKoefExit
    OnKeyPress = TextEditKoefKeyPress
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
