object frmProlongBonuses: TfrmProlongBonuses
  Left = 374
  Top = 245
  Width = 559
  Height = 305
  Caption = #1060#1110#1083#1100#1090#1088' '#1076#1083#1103' '#1087#1086#1076#1086#1074#1078#1077#1085#1085#1103' '#1085#1072#1076#1073#1072#1074#1086#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CheckDepartmentValue: TcxCheckBox
    Left = 21
    Top = 37
    Width = 229
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CheckDepartmentValuePropertiesChange
    Properties.Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
    TabOrder = 0
  end
  object DepartmentValue: TqFSpravControl
    Left = -24
    Top = 63
    Width = 545
    Height = 26
    DisplayName = '   '
    Interval = 50
    Value = Null
    LabelColor = clGreen
    Required = True
    Semicolon = False
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 1
    AutoSaveToRegistry = True
    OnOpenSprav = DepartmentValueOpenSprav
    DisplayText = ''
  end
  object CheckDepartmentWithChild: TcxCheckBox
    Left = 71
    Top = 89
    Width = 229
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    Properties.Caption = #1042#1082#1083#1102#1095#1085#1086' '#1079' '#1076#1086#1095#1110#1088#1085#1110#1084#1080' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1072#1084#1080
    TabOrder = 2
  end
  object CheckRaiseValue: TcxCheckBox
    Left = 22
    Top = 107
    Width = 300
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CheckRaiseValuePropertiesChange
    Properties.Caption = #1053#1072#1076#1073#1072#1074#1082#1072
    TabOrder = 3
  end
  object ExistRateValue: TqFSpravControl
    Left = -24
    Top = 131
    Width = 547
    Height = 25
    DisplayName = '   '
    Interval = 50
    Value = Null
    LabelColor = clGreen
    Required = True
    Semicolon = False
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 4
    AutoSaveToRegistry = True
    OnOpenSprav = ExistRateValueOpenSprav
    DisplayText = ''
  end
  object lblNewDateBeg: TcxLabel
    Left = 25
    Top = 168
    Width = 155
    Height = 17
    TabOrder = 5
    Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091' '#1087#1086#1076#1086#1074#1078#1077#1085#1085#1103
  end
  object NewDateBeg: TcxDateEdit
    Left = 229
    Top = 164
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object lblNewDateEnd: TcxLabel
    Left = 25
    Top = 198
    Width = 169
    Height = 17
    TabOrder = 7
    Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091' '#1087#1086#1076#1086#1074#1078#1077#1085#1085#1103
  end
  object NewDateEnd: TcxDateEdit
    Left = 229
    Top = 194
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object btnOk: TcxButton
    Left = 136
    Top = 230
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 9
    OnClick = btnOkClick
  end
  object btnCancel: TcxButton
    Left = 309
    Top = 230
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 10
    OnClick = btnCancelClick
  end
  object lblDateFilter: TcxLabel
    Left = 25
    Top = 16
    Width = 87
    Height = 17
    TabOrder = 11
    Caption = #1044#1072#1090#1072' '#1092#1110#1083#1100#1090#1088#1072#1094#1110#1111
  end
  object DateFilter: TcxDateEdit
    Left = 128
    Top = 16
    Width = 115
    Height = 21
    TabOrder = 12
  end
end
