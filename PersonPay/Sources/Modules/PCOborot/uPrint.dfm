object PrintForm: TPrintForm
  Left = 473
  Top = 293
  Width = 396
  Height = 193
  Caption = #1044#1088#1091#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 7
    Top = 11
    Width = 25
    Height = 13
    Caption = #1047#1074#1110#1090
  end
  object lbl2: TLabel
    Left = 220
    Top = 69
    Width = 91
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1082#1086#1087#1110#1081
  end
  object lbl3: TLabel
    Left = 7
    Top = 38
    Width = 8
    Height = 13
    Caption = #1079
  end
  object lbl4: TLabel
    Left = 192
    Top = 40
    Width = 15
    Height = 13
    Caption = #1087#1086
  end
  object cxReport: TcxComboBox
    Left = 41
    Top = 8
    Width = 330
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1057#1090#1080#1089#1083#1080#1081' '#1079#1074#1110#1090
      #1056#1086#1079#1075#1086#1088#1085#1091#1090#1080#1081' '#1079#1074#1110#1090
      #1044#1077#1090#1072#1083#1100#1085#1080#1081' '#1079#1074#1110#1090
      #1047#1074#1110#1090'  ('#1079#1072' '#1088#1086#1082#1072#1084#1080')'
      #1047#1074#1110#1090'  ('#1087#1086#1084#1110#1089#1103#1095#1085#1080#1081')'
      #1057#1090#1080#1089#1083#1080#1081' '#1079#1074#1110#1090' '#1073#1077#1079' '#1085#1086#1084#1077#1088#1086#1074' '#1076#1086#1075#1086#1074#1086#1088#1091)
    Properties.OnChange = cxReportPropertiesChange
    TabOrder = 0
  end
  object chbPrinter: TcxCheckBox
    Left = 9
    Top = 64
    Width = 160
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
    TabOrder = 1
  end
  object chbChoosePrinter: TcxCheckBox
    Left = 10
    Top = 91
    Width = 155
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1080#1073#1088#1072#1090#1080' '#1087#1088#1080#1085#1090#1077#1088
    TabOrder = 2
  end
  object cxCopies: TcxSpinEdit
    Left = 322
    Top = 64
    Width = 48
    Height = 21
    Properties.CanEdit = False
    Properties.MaxValue = 50.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 3
    Value = 1
  end
  object cxCheckEdit: TcxCheckBox
    Left = -1
    Top = 129
    Width = 23
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = ''
    TabOrder = 4
  end
  object btn1: TcxButton
    Left = 57
    Top = 118
    Width = 125
    Height = 25
    Action = actOk
    TabOrder = 5
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDD77DD77DD
      DDDDDDD788777F777DDDDD7F8887778F8777D78888870000787D788888888770
      0077788FFFFFF888877778FFF88888FF8887D77F877888888887DDD787777788
      887DDDDD8F88888777DDDDDD8F88888DDDDDDDD8FFF888DDDDDDDDD8FFFF88DD
      DDDDDD8FFFFF88DDDDDDDD888FFF8DDDDDDDDDDDD888DDDDDDDD}
    UseSystemPaint = False
  end
  object btn2: TcxButton
    Left = 214
    Top = 116
    Width = 125
    Height = 25
    Action = actClose
    TabOrder = 6
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD11DDDDDD1
      1DDDDDD77DDDDDD77DDDDD1991DDDD1991DDDD7877DDDD7777DDDD19991DD199
      91DDDD78877DD77777DDDDD1999119991DDDDDD7888777777DDDDDDD19999991
      DDDDDDDD78887777DDDDDDDDD199991DDDDDDDDDD788877DDDDDDDDDD199991D
      DDDDDDDDD788887DDDDDDDDD19999991DDDDDDDD78888887DDDDDDD199911999
      1DDDDDD7888778887DDDDD19991DD19991DDDD78887DD78887DDDD1791DDDD19
      91DDDD7887DDDD7887DDDDD11DDDDDD11DDDDDD77DDDDDD77DDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    NumGlyphs = 2
    UseSystemPaint = False
  end
  object cxBeg: TcxSpinEdit
    Left = 121
    Top = 36
    Width = 65
    Height = 21
    ParentFont = False
    Properties.CanEdit = False
    Properties.MaxValue = 9999.000000000000000000
    Properties.MinValue = 2000.000000000000000000
    Style.Color = clWindow
    Style.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 7
    Value = 2000
  end
  object cxEnd: TcxSpinEdit
    Left = 307
    Top = 36
    Width = 65
    Height = 21
    ParentFont = False
    Properties.CanEdit = False
    Properties.MaxValue = 9999.000000000000000000
    Properties.MinValue = 2000.000000000000000000
    Style.Color = clWindow
    Style.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 8
    Value = 2000
  end
  object cxMonthEnd: TcxComboBox
    Left = 213
    Top = 36
    Width = 89
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 12
    Properties.Items.Strings = (
      #1089#1110#1095#1077#1085#1100
      #1083#1102#1090#1080#1081
      #1073#1077#1088#1077#1079#1077#1085#1100
      #1082#1074#1110#1090#1077#1085#1100
      #1090#1088#1072#1074#1077#1085#1100
      #1095#1077#1088#1074#1077#1085#1100
      #1083#1080#1087#1077#1085#1100
      #1089#1077#1088#1087#1077#1085#1100
      #1074#1077#1088#1077#1089#1077#1085#1100
      #1078#1086#1074#1090#1077#1085#1100
      #1083#1080#1089#1090#1086#1087#1072#1076
      #1075#1088#1091#1076#1077#1085#1100)
    Properties.ReadOnly = False
    Style.Color = clWindow
    Style.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 9
  end
  object cxMonthBeg: TcxComboBox
    Left = 23
    Top = 36
    Width = 89
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 12
    Properties.Items.Strings = (
      #1089#1110#1095#1077#1085#1100
      #1083#1102#1090#1080#1081
      #1073#1077#1088#1077#1079#1077#1085#1100
      #1082#1074#1110#1090#1077#1085#1100
      #1090#1088#1072#1074#1077#1085#1100
      #1095#1077#1088#1074#1077#1085#1100
      #1083#1080#1087#1077#1085#1100
      #1089#1077#1088#1087#1077#1085#1100
      #1074#1077#1088#1077#1089#1077#1085#1100
      #1078#1086#1074#1090#1077#1085#1100
      #1083#1080#1089#1090#1086#1087#1072#1076
      #1075#1088#1091#1076#1077#1085#1100)
    Properties.ReadOnly = False
    Style.Color = clWindow
    Style.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 10
  end
  object actlst1: TActionList
    Left = 194
    Top = 88
    object act1: TAction
      Caption = 'act1'
      ShortCut = 57412
      OnExecute = act1Execute
    end
    object actOk: TAction
      Caption = #1044#1088#1091#1082
      ShortCut = 13
      OnExecute = actOkExecute
    end
    object actClose: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = actCloseExecute
    end
  end
end
