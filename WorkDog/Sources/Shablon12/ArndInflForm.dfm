object ArndInfl: TArndInfl
  Left = 574
  Top = 488
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1088#1077#1085#1076#1085#1072' '#1087#1083#1072#1090#1072' ('#1079' '#1091#1088#1072#1093'.'#1082#1086#1108#1092'.'#1110#1085#1092#1083'.)'
  ClientHeight = 159
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 2
    Top = 2
    Width = 503
    Height = 127
    Brush.Style = bsClear
  end
  object Label3: TLabel
    Left = 13
    Top = 37
    Width = 49
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100':'
  end
  object Label1: TLabel
    Left = 13
    Top = 9
    Width = 45
    Height = 13
    Caption = #1055#1086#1089#1083#1091#1075#1072':'
  end
  object Label2: TLabel
    Left = 13
    Top = 57
    Width = 136
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1074' '#1084#1080#1085#1091#1083#1086#1084#1091' '#1087#1077#1088#1110#1086#1076#1110':'
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
  object Label4: TLabel
    Left = 77
    Top = 9
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 248
    Top = 38
    Width = 39
    Height = 13
    Caption = 'Label5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 13
    Top = 81
    Width = 123
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1074' '#1085#1086#1074#1086#1084#1091' '#1087#1077#1088#1110#1086#1076#1110':'
  end
  object Label7: TLabel
    Left = 13
    Top = 105
    Width = 95
    Height = 13
    Caption = #1050#1086#1101#1092#1110#1094#1110#1108#1085#1090' '#1110#1085#1092#1083#1103#1094#1110#1110
  end
  object Label8: TLabel
    Left = 245
    Top = 60
    Width = 165
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1074' '#1084#1080#1085#1091#1083#1086#1084#1091' '#1087#1077#1088#1110#1086#1076#1110' 100%:'
  end
  object Label9: TLabel
    Left = 245
    Top = 84
    Width = 152
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1074' '#1085#1086#1074#1086#1084#1091' '#1087#1077#1088#1110#1086#1076#1110' 100%:'
  end
  object CountEdit: TcxCurrencyEdit
    Left = 160
    Top = 33
    Width = 81
    Height = 21
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 4
    Properties.DisplayFormat = ',0.0000'#39#39';-,0.0000'#39#39
    Properties.Nullable = False
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnKeyPress = CountEditKeyPress
  end
  object OldSumEdit: TcxCurrencyEdit
    Left = 160
    Top = 56
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
    TabOrder = 1
  end
  object SumEdit: TcxCurrencyEdit
    Left = 160
    Top = 80
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
    TabOrder = 3
    OnKeyPress = SumEditKeyPress
  end
  object InflEdit: TcxCurrencyEdit
    Left = 160
    Top = 104
    Width = 81
    Height = 21
    EditValue = '1'
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 4
    Properties.DisplayFormat = ',0.0000'#39#39';-,0.0000'#39#39
    Properties.OnEditValueChanged = InflEditPropertiesEditValueChanged
    Style.Color = clMoneyGreen
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Shadow = False
    TabOrder = 5
    OnKeyPress = InflEditKeyPress
  end
  object OldFullSumEdit: TcxCurrencyEdit
    Left = 416
    Top = 56
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
    TabOrder = 2
  end
  object NewFullSumEdit: TcxCurrencyEdit
    Left = 416
    Top = 80
    Width = 81
    Height = 21
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
    Properties.OnEditValueChanged = NewFullSumEditPropertiesEditValueChanged
    Style.Color = clMoneyGreen
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Shadow = False
    TabOrder = 4
    OnKeyPress = NewFullSumEditKeyPress
  end
  object ApplyButton: TcxButton
    Left = 350
    Top = 133
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 6
    OnClick = ApplyButtonClick
  end
  object CancelButton: TcxButton
    Left = 429
    Top = 133
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 7
  end
  object ActionList1: TActionList
    Left = 304
    Top = 200
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 27
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 38
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 40
      OnExecute = Action3Execute
    end
  end
end
