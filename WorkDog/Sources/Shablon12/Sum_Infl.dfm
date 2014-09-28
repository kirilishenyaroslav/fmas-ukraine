object FormSum: TFormSum
  Left = 446
  Top = 253
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = #1054#1088#1077#1085#1076#1085#1072' '#1087#1083#1072#1090#1072' (100%)'
  ClientHeight = 136
  ClientWidth = 253
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
  object Shape1: TShape
    Left = 2
    Top = 2
    Width = 247
    Height = 103
    Brush.Style = bsClear
  end
  object Label1: TLabel
    Left = 13
    Top = 9
    Width = 45
    Height = 13
    Caption = #1055#1086#1089#1083#1091#1075#1072':'
  end
  object Edizm: TLabel
    Left = 176
    Top = 33
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 13
    Top = 76
    Width = 95
    Height = 13
    Caption = #1050#1086#1101#1092#1110#1094#1110#1108#1085#1090' '#1110#1085#1092#1083#1103#1094#1110#1110
  end
  object FavLabel: TLabel
    Left = 88
    Top = 9
    Width = 145
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 13
    Top = 33
    Width = 136
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1074' '#1084#1080#1085#1091#1083#1086#1084#1091' '#1087#1077#1088#1110#1086#1076#1110':'
  end
  object Label6: TLabel
    Left = 13
    Top = 54
    Width = 123
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1074' '#1085#1086#1074#1086#1084#1091' '#1087#1077#1088#1110#1086#1076#1110':'
  end
  object ApplyButton: TcxButton
    Left = 95
    Top = 108
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 3
    OnClick = ApplyButtonClick
  end
  object CancelButton: TcxButton
    Left = 175
    Top = 108
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 4
  end
  object InflEdit: TcxCurrencyEdit
    Left = 160
    Top = 74
    Width = 81
    Height = 21
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 4
    Properties.DisplayFormat = ',0.0000'#39#39';-,0.0000'#39#39
    Properties.OnEditValueChanged = InflEditPropertiesEditValueChanged
    Style.Color = clMoneyGreen
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Shadow = False
    TabOrder = 2
    OnKeyPress = InflEditKeyPress
  end
  object OldSumEdit: TcxCurrencyEdit
    Left = 160
    Top = 32
    Width = 81
    Height = 21
    TabStop = False
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
    Properties.ReadOnly = True
    Style.Color = clMoneyGreen
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Shadow = False
    TabOrder = 0
  end
  object SumEdit: TcxCurrencyEdit
    Left = 160
    Top = 53
    Width = 81
    Height = 21
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
    Properties.ReadOnly = False
    Style.Color = clMoneyGreen
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Shadow = False
    TabOrder = 1
    OnKeyPress = SumEditKeyPress
  end
  object ActionList1: TActionList
    Left = 64
    Top = 104
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 27
      OnExecute = Action1Execute
    end
  end
end
