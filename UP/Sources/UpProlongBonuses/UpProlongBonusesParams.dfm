object frmChangeGetParams: TfrmChangeGetParams
  Left = 434
  Top = 238
  BorderStyle = bsDialog
  Caption = #1042#1074#1077#1076#1110#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1080' '#1076#1083#1103' '#1079#1084#1110#1085#1080' '#1073#1102#1076#1078#1077#1090#1091' '#1085#1072#1076#1073#1072#1074#1086#1082
  ClientHeight = 359
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 384
    Top = 325
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 464
    Top = 325
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object CheckDepartmentValue: TcxCheckBox
    Left = 24
    Top = 8
    Width = 233
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CheckDepartmentValuePropertiesChange
    Properties.Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
    TabOrder = 2
  end
  object DepartmentValue: TqFSpravControl
    Left = 27
    Top = 34
    Width = 549
    Height = 22
    DisplayName = '   '
    Interval = 50
    Value = Null
    LabelColor = clGreen
    Required = True
    Semicolon = False
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 3
    AutoSaveToRegistry = True
    OnOpenSprav = DepartmentValueOpenSprav
    DisplayText = ''
  end
  object CheckBudgetValue: TcxCheckBox
    Left = 24
    Top = 88
    Width = 233
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CheckBudgetValuePropertiesChange
    Properties.Caption = #1041#1102#1076#1078#1077#1090', '#1079' '#1103#1082#1086#1075#1086' '#1090#1088#1077#1073#1072' '#1079#1085#1110#1084#1072#1090#1080' '#1085#1072#1076#1073#1072#1074#1082#1080
    TabOrder = 4
  end
  object BudgetValue: TqFSpravControl
    Left = 26
    Top = 114
    Width = 551
    Height = 21
    DisplayName = '   '
    Interval = 50
    Value = Null
    LabelColor = clGreen
    Required = True
    Semicolon = False
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 5
    AutoSaveToRegistry = True
    OnOpenSprav = BudgetValueOpenSprav
    DisplayText = ''
  end
  object CheckNewBudgetValue: TcxCheckBox
    Left = 25
    Top = 139
    Width = 304
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CheckNewBudgetPropertiesChange
    Properties.Caption = #1041#1102#1076#1078#1077#1090', '#1085#1072' '#1103#1082#1080#1081' '#1090#1088#1077#1073#1072' '#1087#1077#1088#1077#1085#1086#1089#1080#1090#1080' '#1085#1072#1076#1073#1072#1074#1082#1080
    TabOrder = 6
  end
  object NewBudgetValue: TqFSpravControl
    Left = 25
    Top = 165
    Width = 553
    Height = 21
    DisplayName = '   '
    Interval = 50
    Value = Null
    LabelColor = clGreen
    Required = True
    Semicolon = False
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 7
    AutoSaveToRegistry = True
    OnOpenSprav = NewBudgetValueOpenSprav
    DisplayText = ''
  end
  object ExistRateValue: TqFSpravControl
    Left = 24
    Top = 217
    Width = 553
    Height = 21
    DisplayName = '   '
    Interval = 50
    Value = Null
    LabelColor = clGreen
    Required = True
    Semicolon = False
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 8
    AutoSaveToRegistry = True
    OnOpenSprav = ExistRateValueOpenSprav
    DisplayText = ''
  end
  object CheckRaiseValue: TcxCheckBox
    Left = 25
    Top = 193
    Width = 304
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CheckRaisePropertiesChange
    Properties.Caption = #1053#1072#1076#1073#1072#1074#1082#1072
    TabOrder = 9
  end
  object cxDateEdit1: TcxDateEdit
    Left = 184
    Top = 273
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object cxDateEdit2: TcxDateEdit
    Left = 184
    Top = 297
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object cxLabel1: TcxLabel
    Left = 32
    Top = 273
    Width = 127
    Height = 17
    TabOrder = 12
    Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091' '#1079#1072#1084#1110#1085#1080
  end
  object cxLabel2: TcxLabel
    Left = 32
    Top = 297
    Width = 141
    Height = 17
    TabOrder = 13
    Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091' '#1079#1072#1084#1110#1085#1080
  end
  object CheckDepartmentWithChild: TcxCheckBox
    Left = 74
    Top = 60
    Width = 233
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    Properties.Caption = #1042#1082#1083#1102#1095#1085#1086' '#1079' '#1076#1086#1095#1110#1088#1085#1110#1084#1080' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1072#1084#1080
    TabOrder = 14
  end
  object CheckReturnFinance: TcxCheckBox
    Left = 26
    Top = 244
    Width = 233
    Height = 21
    Hint = 
      #1054#1073#1077#1088#1110#1090#1100' '#1094#1102' '#1086#1087#1094#1110#1102', '#1103#1082#1097#1086' '#1081#1076#1077' '#1087#1086#1074#1077#1088#1085#1077#1085#1085#1103' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103', '#1085#1072#1076#1073#1072#1074#1082#1080' '#1079' '#1078 +
      #1086#1088#1089#1090#1082#1086#1102' '#1087#1088#1080#1074#39#1103#1079#1082#1086#1102' '#1073#1091#1076#1091#1090#1100' '#1088#1086#1079#1088#1072#1093#1086#1074#1072#1085#1110' '#1074#1110#1076#1087#1086#1074#1110#1076#1085#1086' '#1076#1086' '#1076#1078#1077#1088#1077#1083' '#1092#1110#1085#1072#1085 +
      #1089#1091#1074#1072#1085#1085#1103' '#1087#1086#1089#1072#1076#1080
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    Properties.Caption = #1055#1086#1074#1077#1088#1085#1077#1085#1085#1103' '#1087#1086#1095#1072#1090#1082#1086#1074#1086#1075#1086' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
    TabOrder = 15
  end
end
