object FilterMainForm: TFilterMainForm
  Left = 274
  Top = 164
  BorderStyle = bsDialog
  Caption = #1060#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1076#1072#1085#1085#1080#1093' '#1076#1083#1103' '#1085#1072#1082#1072#1079#1072
  ClientHeight = 449
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 408
    Align = alClient
    TabOrder = 0
    object cxPageControl1: TcxPageControl
      Left = 1
      Top = 1
      Width = 627
      Height = 406
      ActivePage = cxTabSheet1
      Align = alClient
      Images = IL_Orders
      MultiLine = True
      TabOrder = 0
      object cxTabSheet1: TcxTabSheet
        Caption = #1047#1072#1075#1072#1083#1100#1085#1110' '#1076#1072#1085#1085#1110
        ImageIndex = 1
        object Label7: TLabel
          Left = 78
          Top = 148
          Width = 139
          Height = 16
          Caption = #1047#1085#1072#1095#1077#1085#1085#1103' '#1074' '#1110#1085#1090#1077#1088#1074#1072#1083#1110
          Enabled = False
        end
        object Label8: TLabel
          Left = 237
          Top = 148
          Width = 19
          Height = 16
          Caption = #1074#1110#1076
          Enabled = False
        end
        object Label9: TLabel
          Left = 386
          Top = 148
          Width = 16
          Height = 16
          Caption = #1076#1086
          Enabled = False
        end
        object CheckPrivateCard: TcxCheckBox
          Left = 24
          Top = 8
          Width = 157
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckPrivateCardPropertiesChange
          Properties.Caption = #1055#1086' '#1086#1089#1086#1073#1086#1074#1110#1081' '#1082#1072#1088#1090#1094#1110
          TabOrder = 0
        end
        object PCardValue: TqFSpravControl
          Left = 24
          Top = 30
          Width = 541
          Height = 21
          DisplayName = '  '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 1
          AutoSaveToRegistry = True
          OnOpenSprav = PCardValueOpenSprav
          DisplayText = ''
        end
        object CheckPostSalary: TcxCheckBox
          Left = 24
          Top = 64
          Width = 105
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckPostPropertiesChange
          Properties.Caption = #1055#1086' '#1087#1086#1089#1072#1076#1110
          TabOrder = 2
        end
        object PostSalaryValue: TqFSpravControl
          Left = 26
          Top = 86
          Width = 541
          Height = 21
          DisplayName = '   '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 3
          AutoSaveToRegistry = True
          OnOpenSprav = PostSalaryValueOpenSprav
          DisplayText = ''
        end
        object CheckRates: TcxCheckBox
          Left = 24
          Top = 123
          Width = 105
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = cxCheckBox4PropertiesChange
          Properties.Caption = #1055#1086' '#1089#1090#1072#1074#1094#1110
          TabOrder = 4
        end
        object CheckWorkReason: TcxCheckBox
          Left = 24
          Top = 181
          Width = 177
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckWorkReasonPropertiesChange
          Properties.Caption = #1055#1086' '#1087#1110#1076#1089#1090#1072#1074#1110' '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080
          TabOrder = 7
        end
        object WorkReasonValue: TqFSpravControl
          Left = 26
          Top = 204
          Width = 541
          Height = 21
          DisplayName = '   '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 8
          AutoSaveToRegistry = True
          OnOpenSprav = WorkReasonValueOpenSprav
          DisplayText = ''
        end
        object RateMinValue: TqFFloatControl
          Left = 280
          Top = 146
          Width = 89
          Height = 21
          DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Interval = 0
          Value = 0.000000000000000000
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 5
          AutoSaveToRegistry = False
          MaxLength = 0
          NegativeAllowed = False
          Precision = 2
          Format = '#########0.00'
        end
        object RateMaxValue: TqFFloatControl
          Left = 424
          Top = 146
          Width = 89
          Height = 21
          DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Interval = 0
          Value = 1.000000000000000000
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 6
          AutoSaveToRegistry = False
          MaxLength = 0
          NegativeAllowed = False
          Precision = 2
          Format = '#########0.00'
        end
        object cxIsInSovm: TcxCheckBox
          Left = 24
          Top = 240
          Width = 169
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1042#1085#1091#1090#1088#1110#1096#1085#1110#1081' '#1089#1091#1084#1110#1089#1085#1080#1082
          TabOrder = 9
        end
        object cxIsExtSovm: TcxCheckBox
          Left = 408
          Top = 240
          Width = 153
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1047#1086#1074#1085#1110#1096#1085#1110#1081' '#1089#1091#1084#1110#1089#1085#1080#1082
          TabOrder = 10
        end
        object WithoutDekret: TcxCheckBox
          Left = 24
          Top = 273
          Width = 601
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = WithoutDekretPropertiesChange
          Properties.Caption = 
            #1042#1080#1082#1083#1102#1095#1080#1090#1080' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1097#1086' '#1087#1077#1088#1077#1073#1091#1074#1072#1102#1090#1100' '#1091' '#1074#1110#1076#1087#1091#1089#1090#1094#1110' '#1087#1086' '#1076#1086#1075#1083#1103#1076#1091' ' +
            #1079#1072' '#1076#1080#1090#1080#1085#1086#1102' ('#1076#1077#1082#1088#1077#1090#1110')'
          TabOrder = 11
        end
        object DekretDateBeg: TcxDateEdit
          Left = 139
          Top = 306
          Width = 100
          Height = 21
          Enabled = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 13
        end
        object DekretDateEnd: TcxDateEdit
          Left = 281
          Top = 306
          Width = 100
          Height = 21
          Enabled = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 15
        end
        object lblDekretBeg: TcxLabel
          Left = 75
          Top = 306
          Width = 67
          Height = 20
          TabOrder = 12
          Caption = #1055#1077#1088#1110#1086#1076' '#1079' '
        end
        object lblDekretEnd: TcxLabel
          Left = 252
          Top = 307
          Width = 24
          Height = 20
          TabOrder = 14
          Caption = #1087#1086
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = #1059#1084#1086#1074#1080' '#1087#1088#1072#1094#1110
        ImageIndex = 5
        object CheckWorkCond: TcxCheckBox
          Left = 24
          Top = 9
          Width = 137
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckWorkCondPropertiesChange
          Properties.Caption = #1055#1086' '#1091#1084#1086#1074#1072#1084' '#1087#1088#1072#1094#1110
          TabOrder = 0
        end
        object WorkCondValue: TqFSpravControl
          Left = 24
          Top = 35
          Width = 545
          Height = 21
          DisplayName = '   '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 1
          AutoSaveToRegistry = True
          OnOpenSprav = WorkCondValueOpenSprav
          DisplayText = ''
        end
        object CheckWorkMode: TcxCheckBox
          Left = 24
          Top = 76
          Width = 161
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckWorkModePropertiesChange
          Properties.Caption = #1055#1086' '#1088#1077#1078#1080#1084#1091' '#1088#1086#1073#1086#1090#1080
          TabOrder = 2
        end
        object WorkModeValue: TqFSpravControl
          Left = 24
          Top = 103
          Width = 545
          Height = 21
          DisplayName = '   '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 3
          AutoSaveToRegistry = True
          OnOpenSprav = WorkModeValueOpenSprav
          DisplayText = ''
        end
        object CheckIsMain: TcxCheckBox
          Left = 24
          Top = 145
          Width = 217
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckIsMainPropertiesChange
          Properties.Caption = #1054#1089#1085#1086#1074#1085#1072'/'#1085#1077' '#1086#1089#1085#1086#1074#1085#1072' '#1087#1086#1089#1072#1076#1072
          TabOrder = 4
        end
        object IsMainValue: TcxRadioGroup
          Left = 72
          Top = 165
          Width = 473
          Height = 57
          Enabled = False
          ItemIndex = 0
          Properties.Items = <
            item
              Caption = #1085#1077' '#1086#1089#1085#1086#1074#1085#1072
            end
            item
              Caption = #1086#1089#1085#1086#1074#1085#1072
            end>
          TabOrder = 5
          Caption = ''
        end
        object CheckCategory: TcxCheckBox
          Left = 24
          Top = 230
          Width = 217
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckCategoryPropertiesChange
          Properties.Caption = #1055#1086' '#1090#1080#1087#1091' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
          TabOrder = 6
        end
        object CategoryValue: TqFSpravControl
          Left = 23
          Top = 253
          Width = 545
          Height = 21
          DisplayName = '   '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 7
          AutoSaveToRegistry = True
          OnOpenSprav = CategoryValueOpenSprav
          DisplayText = ''
        end
      end
      object cxTabSheet3: TcxTabSheet
        Caption = #1054#1087#1083#1072#1090#1072
        ImageIndex = 0
        object CheckFormPayValue: TcxCheckBox
          Left = 40
          Top = 24
          Width = 161
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckFormPayValuePropertiesChange
          Properties.Caption = #1055#1086' '#1092#1086#1088#1084#1110' '#1086#1087#1083#1072#1090#1080
          TabOrder = 0
        end
        object FormPayValue: TqFSpravControl
          Left = 16
          Top = 50
          Width = 545
          Height = 21
          DisplayName = '   '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 1
          AutoSaveToRegistry = True
          OnOpenSprav = FormPayValueOpenSprav
          DisplayText = ''
        end
      end
      object cxTabSheet4: TcxTabSheet
        Caption = #1041#1102#1076#1078#1077#1090#1080'/'#1087#1110#1076#1088#1086#1079#1076#1110#1083#1080
        ImageIndex = 2
        object CheckBudgetValue: TcxCheckBox
          Left = 40
          Top = 24
          Width = 233
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckBudgetValuePropertiesChange
          Properties.Caption = #1055#1086' '#1073#1102#1076#1078#1077#1090#1091' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
          TabOrder = 0
        end
        object BudgetValue: TqFSpravControl
          Left = 16
          Top = 50
          Width = 545
          Height = 21
          DisplayName = '   '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 1
          AutoSaveToRegistry = True
          OnOpenSprav = BudgetValueOpenSprav
          DisplayText = ''
        end
        object CheckDepartmentValue: TcxCheckBox
          Left = 40
          Top = 144
          Width = 233
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckDepartmentValuePropertiesChange
          Properties.Caption = #1055#1086' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091
          TabOrder = 2
        end
        object DepartmentValue: TqFSpravControl
          Left = 16
          Top = 170
          Width = 545
          Height = 21
          DisplayName = '   '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 3
          AutoSaveToRegistry = True
          OnOpenSprav = DepartmentValueOpenSprav
          DisplayText = ''
        end
        object CHECK_CHILD_DEPARTMENT: TcxCheckBox
          Left = 64
          Top = 193
          Width = 153
          Height = 24
          Enabled = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1074#1082#1083#1102#1095#1072#1102#1095#1080' '#1076#1086#1095#1110#1088#1085#1110
          TabOrder = 4
        end
      end
      object cxTabSheet5: TcxTabSheet
        Caption = #1053#1072#1076#1073#1072#1074#1082#1080
        ImageIndex = 4
        object ExistRateDateValue: TqFDateControl
          Left = 249
          Top = 11
          Width = 289
          Height = 21
          DisplayName = #1085#1072' '#1076#1072#1090#1091
          Interval = 65
          Value = 0
          LabelColor = clBlack
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 0
          AutoSaveToRegistry = True
          CheckDateIsEmpty = False
        end
        object CheckExistRate: TcxCheckBox
          Left = 40
          Top = 9
          Width = 200
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckExistRatePropertiesChange
          Properties.Caption = #1030#1089#1085#1091#1108' '#1085#1072#1076#1073#1072#1074#1082#1072'/'#1076#1086#1073#1083#1072#1090#1072' '
          TabOrder = 1
        end
        object ExistRateValue: TqFSpravControl
          Left = 16
          Top = 36
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
          Blocked = True
          TabOrder = 2
          AutoSaveToRegistry = True
          OnOpenSprav = ExistRateValueOpenSprav
          DisplayText = ''
        end
        object ExistTypeRateValue: TcxRadioGroup
          Left = 65
          Top = 104
          Width = 471
          Height = 75
          Enabled = False
          ItemIndex = 1
          ParentCtl3D = False
          Properties.Items = <
            item
              Caption = #1057#1091#1084#1086#1074#1072
            end
            item
              Caption = #1055#1088#1086#1094#1077#1085#1090#1086#1074#1072
            end>
          Properties.OnChange = ExistTypeRateValuePropertiesChange
          TabOrder = 3
          Ctl3D = True
          Caption = #1058#1080#1087' '#1085#1072#1076#1073#1072#1074#1082#1080'/'#1076#1086#1087#1083#1072#1090#1080
        end
        object CheckNotExistsRate: TcxCheckBox
          Left = 40
          Top = 184
          Width = 265
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckNotExistsRatePropertiesChange
          Properties.Caption = #1053#1077' '#1110#1089#1085#1091#1108' '#1085#1072#1076#1073#1072#1074#1082#1072'/'#1076#1086#1073#1083#1072#1090#1072' '
          TabOrder = 4
        end
        object NotExistRateValue: TqFSpravControl
          Left = 16
          Top = 209
          Width = 545
          Height = 21
          DisplayName = '   '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 5
          AutoSaveToRegistry = True
          OnOpenSprav = NotExistRateValueOpenSprav
          DisplayText = ''
        end
        object NotExistTypeRateValue: TcxRadioGroup
          Left = 65
          Top = 240
          Width = 471
          Height = 78
          Enabled = False
          ItemIndex = 1
          ParentCtl3D = False
          Properties.Items = <
            item
              Caption = #1057#1091#1084#1086#1074#1072
            end
            item
              Caption = #1055#1088#1086#1094#1077#1085#1090#1086#1074#1072
            end>
          TabOrder = 6
          Ctl3D = True
          Caption = #1058#1080#1087' '#1085#1072#1076#1073#1072#1074#1082#1080'/'#1076#1086#1087#1083#1072#1090#1080
        end
        object NotExistRateDateValue: TqFDateControl
          Left = 249
          Top = 185
          Width = 289
          Height = 21
          DisplayName = #1085#1072' '#1076#1072#1090#1091
          Interval = 65
          Value = 0
          LabelColor = clBlack
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 7
          AutoSaveToRegistry = True
          CheckDateIsEmpty = False
        end
        object cxCheck4: TcxCheckBox
          Left = 184
          Top = 285
          Width = 97
          Height = 24
          Enabled = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1047#1085#1072#1095#1077#1085#1085#1103
          TabOrder = 8
        end
        object qFIntControl1: TqFIntControl
          Left = 280
          Top = 286
          Width = 97
          Height = 21
          DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Interval = 0
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          Blocked = True
          TabOrder = 9
          AutoSaveToRegistry = False
          MaxLength = 10
          NegativeAllowed = False
          ZeroAllowed = False
        end
        object CheckProcBox: TcxCheckBox
          Left = 186
          Top = 149
          Width = 97
          Height = 24
          Enabled = False
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = cxCheckBox1PropertiesChange
          Properties.Caption = #1047#1085#1072#1095#1077#1085#1085#1103
          TabOrder = 10
        end
        object CheckSumBox: TcxCheckBox
          Left = 186
          Top = 123
          Width = 97
          Height = 24
          Enabled = False
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = cxCheckBox2PropertiesChange
          Properties.Caption = #1047#1085#1072#1095#1077#1085#1085#1103
          TabOrder = 11
        end
        object cxCheckBox3: TcxCheckBox
          Left = 184
          Top = 260
          Width = 97
          Height = 24
          Enabled = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1047#1085#1072#1095#1077#1085#1085#1103
          TabOrder = 12
        end
        object qFIntControl4: TqFIntControl
          Left = 280
          Top = 261
          Width = 97
          Height = 21
          DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Interval = 0
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          Blocked = True
          TabOrder = 13
          AutoSaveToRegistry = False
          MaxLength = 10
          NegativeAllowed = False
          ZeroAllowed = False
        end
        object CheckBudgetRate: TcxCheckBox
          Left = 40
          Top = 52
          Width = 233
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckBudgetRatePropertiesChange
          Properties.Caption = #1055#1086' '#1073#1102#1076#1078#1077#1090#1091' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
          TabOrder = 14
        end
        object BudgetRate: TqFSpravControl
          Left = 24
          Top = 78
          Width = 545
          Height = 21
          DisplayName = '   '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 15
          AutoSaveToRegistry = True
          OnOpenSprav = BudgetRateOpenSprav
          DisplayText = ''
        end
        object ProcRateValue: TqFFloatControl
          Left = 284
          Top = 151
          Width = 90
          Height = 21
          DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Interval = 0
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          Blocked = True
          TabOrder = 16
          AutoSaveToRegistry = False
          MaxLength = 0
          NegativeAllowed = False
          Precision = 2
          Format = '#########0.00'
        end
        object SumRateValue: TqFFloatControl
          Left = 284
          Top = 124
          Width = 92
          Height = 21
          DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Interval = 0
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          Blocked = True
          TabOrder = 17
          AutoSaveToRegistry = False
          MaxLength = 0
          NegativeAllowed = False
          Precision = 2
          Format = '#########0.00'
        end
      end
      object cxTabSheet6: TcxTabSheet
        Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
        ImageIndex = 6
        object Label13: TLabel
          Left = 133
          Top = 235
          Width = 139
          Height = 16
          Caption = #1047#1085#1072#1095#1077#1085#1085#1103' '#1074' '#1110#1085#1090#1077#1088#1074#1072#1083#1110
          Enabled = False
        end
        object Label14: TLabel
          Left = 292
          Top = 235
          Width = 19
          Height = 16
          Caption = #1074#1110#1076
          Enabled = False
        end
        object Label15: TLabel
          Left = 441
          Top = 235
          Width = 16
          Height = 16
          Caption = #1076#1086
          Enabled = False
        end
        object CheckIdMen: TcxCheckBox
          Left = 24
          Top = 8
          Width = 169
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckIdMenPropertiesChange
          Properties.Caption = #1055#1086' '#1092#1110#1079#1080#1095#1085#1110#1081' '#1086#1089#1086#1073#1110
          TabOrder = 0
        end
        object ManValue: TqFSpravControl
          Left = 87
          Top = 34
          Width = 477
          Height = 21
          DisplayName = '  '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 1
          AutoSaveToRegistry = True
          OnOpenSprav = ManValueOpenSprav
          DisplayText = ''
        end
        object CheckSex: TcxCheckBox
          Left = 24
          Top = 77
          Width = 105
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckSexPropertiesChange
          Properties.Caption = #1055#1086' '#1089#1090#1072#1090#1110
          TabOrder = 2
        end
        object SexValue: TqFSpravControl
          Left = 88
          Top = 106
          Width = 479
          Height = 21
          DisplayName = '   '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 3
          AutoSaveToRegistry = True
          OnOpenSprav = SexValueOpenSprav
          DisplayText = ''
        end
        object CheckPostRazr: TcxCheckBox
          Left = 24
          Top = 141
          Width = 161
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckPostRazrPropertiesChange
          Properties.Caption = #1055#1086' '#1088#1086#1079#1088#1103#1076#1091' '#1087#1086#1089#1072#1076#1080
          TabOrder = 4
        end
        object PostRazr: TqFFloatControl
          Left = 136
          Top = 170
          Width = 89
          Height = 21
          DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Interval = 0
          Value = 0.000000000000000000
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 5
          AutoSaveToRegistry = False
          MaxLength = 0
          NegativeAllowed = False
          Precision = 2
          Format = '#########0'
        end
        object CheckPostSum: TcxCheckBox
          Left = 24
          Top = 205
          Width = 129
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckPostSumPropertiesChange
          Properties.Caption = #1055#1086' '#1089#1091#1084#1110' '#1086#1082#1083#1072#1076#1091
          TabOrder = 6
        end
        object MinPostSumValue: TqFFloatControl
          Left = 335
          Top = 233
          Width = 89
          Height = 21
          DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Interval = 0
          Value = 0.000000000000000000
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 7
          AutoSaveToRegistry = False
          MaxLength = 0
          NegativeAllowed = False
          Precision = 2
          Format = '#########0.00'
        end
        object MaxPostSumValue: TqFFloatControl
          Left = 479
          Top = 233
          Width = 89
          Height = 21
          DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Interval = 0
          Value = 0.000000000000000000
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 8
          AutoSaveToRegistry = False
          MaxLength = 0
          NegativeAllowed = False
          Precision = 2
          Format = '#########0.00'
        end
      end
      object cxTabSheet7: TcxTabSheet
        Caption = #1057#1090#1072#1078
        ImageIndex = 3
        object Label2: TLabel
          Left = 75
          Top = 68
          Width = 100
          Height = 16
          Caption = #1089#1090#1072#1085#1086#1084' '#1085#1072' '#1076#1072#1090#1091
        end
        object Label3: TLabel
          Left = 75
          Top = 100
          Width = 134
          Height = 16
          Caption = #1073#1110#1083#1100#1096#1077' '#1072#1073#1086' '#1076#1086#1088#1110#1074#1085#1102#1108
        end
        object Label4: TLabel
          Left = 75
          Top = 132
          Width = 133
          Height = 16
          Caption = #1084#1077#1085#1096#1077' '#1072#1073#1086' '#1076#1086#1088#1110#1074#1085#1102#1108
        end
        object Label5: TLabel
          Left = 347
          Top = 102
          Width = 34
          Height = 16
          Caption = #1088#1086#1082#1110#1074
        end
        object Label6: TLabel
          Left = 347
          Top = 134
          Width = 34
          Height = 16
          Caption = #1088#1086#1082#1110#1074
        end
        object TypeStajValue: TqFSpravControl
          Left = 24
          Top = 34
          Width = 541
          Height = 21
          DisplayName = '  '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 0
          AutoSaveToRegistry = True
          OnOpenSprav = TypeStajValueOpenSprav
          DisplayText = ''
        end
        object CheckStaj: TcxCheckBox
          Left = 24
          Top = 8
          Width = 157
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckStajPropertiesChange
          Properties.Caption = #1055#1086#1082#1072#1079#1085#1080#1082#1080' '#1087#1086' '#1089#1090#1072#1078#1091
          TabOrder = 1
        end
        object StajDate: TqFDateControl
          Left = 221
          Top = 67
          Width = 124
          Height = 21
          DisplayName = '  '
          Interval = 0
          Value = 0
          LabelColor = clBlack
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 2
          AutoSaveToRegistry = True
          CheckDateIsEmpty = False
        end
        object StajValueMIn: TqFIntControl
          Left = 222
          Top = 100
          Width = 119
          Height = 21
          DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Interval = 0
          Value = 3
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 3
          AutoSaveToRegistry = False
          MaxLength = 10
          NegativeAllowed = False
          ZeroAllowed = False
        end
        object StajValueMax: TqFIntControl
          Left = 222
          Top = 132
          Width = 119
          Height = 21
          DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Interval = 0
          Value = 50
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 4
          AutoSaveToRegistry = False
          MaxLength = 10
          NegativeAllowed = False
          ZeroAllowed = False
        end
      end
      object cxTabSheet8: TcxTabSheet
        Caption = #1055#1077#1088#1110#1086#1076#1080
        ImageIndex = 3
        object Label1: TLabel
          Left = 32
          Top = 16
          Width = 95
          Height = 16
          Caption = #1055#1077#1088#1110#1086#1076' '#1088#1086#1073#1086#1090#1080
        end
        object CheckMMDateBeg: TcxCheckBox
          Left = 69
          Top = 42
          Width = 83
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckMMDateBegPropertiesChange
          Properties.Caption = #1055#1086#1095#1072#1090#1086#1082
          TabOrder = 0
        end
        object MMDateBeg: TqFDateControl
          Left = 213
          Top = 45
          Width = 112
          Height = 21
          DisplayName = '  '
          Interval = 0
          Value = 0
          LabelColor = clBlack
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 1
          AutoSaveToRegistry = True
          CheckDateIsEmpty = False
        end
        object CheckMMDateEnd: TcxCheckBox
          Left = 341
          Top = 40
          Width = 101
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckMMDateEndPropertiesChange
          Properties.Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
          TabOrder = 2
        end
        object MMDateEnd: TqFDateControl
          Left = 445
          Top = 43
          Width = 99
          Height = 21
          DisplayName = '  '
          Interval = 0
          Value = 0
          LabelColor = clBlack
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 3
          AutoSaveToRegistry = True
          CheckDateIsEmpty = False
        end
        object CheckMMDate: TcxCheckBox
          Left = 68
          Top = 96
          Width = 135
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckMMDatePropertiesChange
          Properties.Caption = #1055#1088#1072#1094#1102#1108' '#1085#1072' '#1076#1072#1090#1091
          State = cbsChecked
          TabOrder = 4
        end
        object MMDate: TqFDateControl
          Left = 214
          Top = 97
          Width = 110
          Height = 21
          DisplayName = '  '
          Interval = 0
          Value = 0
          LabelColor = clBlack
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = False
          TabOrder = 5
          AutoSaveToRegistry = True
          CheckDateIsEmpty = False
        end
        object CheckDateEndAfter: TcxCheckBox
          Left = 68
          Top = 144
          Width = 253
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckDateEndAfterPropertiesChange
          Properties.Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1088#1086#1073#1086#1090#1080' '#1073#1110#1083#1100#1096#1077' '#1079#1072
          TabOrder = 6
        end
        object DateEndAfter: TqFDateControl
          Left = 328
          Top = 145
          Width = 110
          Height = 21
          DisplayName = '  '
          Interval = 0
          Value = 0
          LabelColor = clBlack
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = False
          TabOrder = 7
          AutoSaveToRegistry = True
          CheckDateIsEmpty = False
        end
      end
      object cxTabSheet9: TcxTabSheet
        Caption = 'C'#1087#1077#1094#1110#1072#1083#1100#1085#1080#1081' '#1074#1110#1076#1073#1110#1088
        ImageIndex = 6
        object Label10: TLabel
          Left = 155
          Top = 108
          Width = 100
          Height = 16
          Caption = #1089#1090#1072#1085#1086#1084' '#1085#1072' '#1076#1072#1090#1091
        end
        object Label11: TLabel
          Left = 135
          Top = 142
          Width = 119
          Height = 16
          Caption = #1073#1091#1076#1077' '#1076#1086#1088#1110#1074#1085#1102#1074#1072#1090#1080
        end
        object Label12: TLabel
          Left = 387
          Top = 142
          Width = 34
          Height = 16
          Caption = #1088#1086#1082#1110#1074
        end
        object WillDateValue: TqFDateControl
          Left = 261
          Top = 107
          Width = 124
          Height = 21
          DisplayName = '  '
          Interval = 0
          Value = 0
          LabelColor = clBlack
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 0
          AutoSaveToRegistry = True
          CheckDateIsEmpty = False
        end
        object WillStajYearValue: TqFIntControl
          Left = 262
          Top = 140
          Width = 119
          Height = 21
          DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Interval = 0
          Value = 3
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 1
          AutoSaveToRegistry = False
          MaxLength = 10
          NegativeAllowed = False
          ZeroAllowed = False
        end
        object WillTypeStajValue: TqFSpravControl
          Left = 104
          Top = 66
          Width = 485
          Height = 21
          DisplayName = '  '
          Interval = 50
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          Blocked = True
          TabOrder = 2
          AutoSaveToRegistry = True
          OnOpenSprav = TypeStajValueOpenSprav
          DisplayText = ''
        end
      end
    end
    object Panel3: TPanel
      Left = 144
      Top = 61
      Width = 329
      Height = 73
      Caption = #1063#1077#1082#1072#1081#1090#1077' '#1081#1076#1077' '#1072#1085#1072#1083#1110#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1111
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 408
    Width = 629
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 456
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFA47874A47874A47874A47874A47874A47874A47874
        A47874A47874A47874A47874A47874A47874A47874A47874A47874A47874A478
        74986B66FF00FFFF00FFFF00FFFF00FF7E7D7F4A667CBE9596F8E3C6F6DFBFF5
        DCB8F4D9B2F3D7ACF3D4A7F2D2A0F0CF9AF0CE98F0CE98F0CE98F0CE98F0CE98
        F0CE98F1CF98EFCD97986B66FF00FFFF00FFFF00FFFF00FF6B9CC31E89E84B7A
        A3C89693F5DFC2F4DCBCF3DAB6F2D7B1F1D4ABF1D2A5F0CF9FEFCD9AEECC97EE
        CC97EECC97EECC97EECC97EFCD97EDCB96986B66FF00FFFF00FFFF00FFFF00FF
        4BB4FE51B5FF2089E94B7AA2C69592F5DEC2F4DCBCF3DAB7F2D7B1F1D4ABF1D2
        A5F0CFA0EFCD9AEECC97EECC97EECC97EECC97EFCD97EDCB96986B66FF00FFFF
        00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792F5DEC1F4DCBC
        F3D9B6F2D7B0F1D4AAF1D2A5F0CFA0EECC99EECC97EECC97EECC97EFCD97EDCB
        96986B66FF00FFFF00FFFF00FFFF00FFFF00FFA97F7B51B7FE4EB2FF1F89E64E
        7BA2B99497F5DFC2F4DCBCF3D9B6F2D7B0F1D4ABF1D2A6F0CFA0EECD9AEECC97
        EECC97EFCD97EDCB96986B66FF00FFFF00FFFF00FFFF00FFFF00FFAA807BF5E9
        DD52B8FE4BB1FF2787D95F6A76E3C8B4A87875AD807BA97976AF807DC8A18DE0
        BD9AF0CFA0EECC99EECC97EFCD97EDCB96986B66FF00FFFF00FFFF00FFFF00FF
        FF00FFAD837DF5ECE3FBF2E655BDFFB5D6EDA58785AB807AD0B6A3EEE4C7FCFA
        D7EDE4C6CDAFA0B18580D7B294F0CFA0EECC99EFCD97EDCB96986B66FF00FFFF
        00FFFF00FFFF00FFFF00FFB2887EF7EFE8FCF5ECFAEFE4C4A8A7B48780F1DEB7
        FFFDD6FFFFDAFFFFDAFFFFDFFFFFEFEADDD8AB7D7ADFBD9AF0CF9FEFCD9AEDCA
        96986B66FF00FFFF00FFFF00FFFF00FFFF00FFB68B80F8F2EEFDF8F1FAF3EAB5
        8681D4B399F8DBAAFDF7D0FFFFDAFFFFE1FFFFF2FFFFFBFFFFFFC7A99EC8A18C
        F0D1A4F0D09FEDCB98986B66FF00FFFF00FFFF00FFFF00FFFF00FFBA8E82FAF6
        F4FEFCF8FCF6F0B1847EEDD0A4F2C897FCF4CCFFFFDBFFFFE4FFFFF9FFFFFBFF
        FFECE4D9BFAE7F7BF1D4AAF1D2A5EECD9E986B66FF00FFFF00FFFF00FFFF00FF
        FF00FFBE9283FBF8F7FFFFFEFEFAF6A97A76F9DEAAEFBA86F9E3B6FFFFD9FFFF
        DEFFFFE8FFFFEAFFFFE0F8F5D5A97976F2D7B0F2D5ABEFCFA4986B66FF00FFFF
        00FFFF00FFFF00FFFF00FFC29685FBF8F7FFFFFFFFFEFCB2857FEED4A9EFBB84
        F3CC98FBEEC4FFFFDBFFFFDDFFFFDCFFFFDCE8DCC1AE807BF3D9B5F2D7B0F0D2
        A8986B66FF00FFFF00FFFF00FFFF00FFFF00FFC69986FBF8F7FFFFFFFFFFFFB7
        8A85D7BBA0FAE9C5F4D3A6F4D09DF9E4B8FEF6CFFEFAD3FFFFDACAAE9CCAA596
        F4DCBBF4DAB6F1D5AE986B66FF00FFFF00FFFF00FFFF00FFFF00FFCA9C88FBF8
        F7FFFFFFFFFFFFEBDFDFB48A82F1EAE9FFF7E9F3CC98F0BD89F4CE9DFCE6B6F0
        E2BBAD817BE3C8B3F4DEC0F3DBBAD9C4A7986B66FF00FFFF00FFFF00FFFF00FF
        FF00FFCEA089FCF9F7FFFFFFFFFFFFFFFFFFE0CECDB28985D3BBAEEFDCB2FBE3
        B0EED4A9D2B19AB1847EDBBEB0F6E4CCEBD9C0D1C1ABB5A897986B66FF00FFFF
        00FFFF00FFFF00FFFF00FFD2A38AFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFEBDFDF
        B78F84AF827CA97A76B2847ECCADA5E7D1C5FBEEDBE7DBC9C8BDAFBAB0A2B7AC
        9D986B66FF00FFFF00FFFF00FFFF00FFFF00FFD7A78CFCF9F7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFCFDF9F4FCF5EEFCF5EBEEDDD1B28176AD8076
        AA7F76AB7F76AB7F76AD8274FF00FFFF00FFFF00FFFF00FFFF00FFDAAB8DFCF9
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFDF9F4FFFBF3E3
        CEC6B38176E3B585E5AD6AE9A654EFA039B88285FF00FFFF00FFFF00FFFF00FF
        FF00FFDEAD8EFDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFCFFFEF9E5D1CBB38176EFC48DF3BB6DF8B450B88285FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFDEAD8EFDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D4D0B38176EFC38CF3BA6CB88285FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEAD8EFFFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DBD9B38176F1C58B
        B88285FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAA482DAA4
        82DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DA
        A482B38176B88285FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object cxButton2: TcxButton
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 256
      Top = 8
      Width = 113
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1074#1089#1077
      TabOrder = 2
      OnClick = cxButton3Click
    end
    object cxButton4: TcxButton
      Left = 16
      Top = 8
      Width = 233
      Height = 25
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1082#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1102' '#1092#1110#1083#1100#1090#1088#1072
      Enabled = False
      TabOrder = 3
      OnClick = cxButton4Click
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 333
    Top = 180
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 365
    Top = 180
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 397
    Top = 180
  end
  object SelectCurWorkPlace: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_KER_GET_CUR_WORK_PLACE(:Cur_Date, :Id_Pcard)')
    Left = 429
    Top = 180
    poSQLINT64ToBCD = True
    object SelectCurWorkPlaceID_DEPARTMENT: TFIBIntegerField
      FieldName = 'ID_DEPARTMENT'
      Visible = False
    end
    object SelectCurWorkPlaceNAME_POST_SALARY: TFIBStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
      DisplayWidth = 50
      FieldName = 'NAME_POST'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectCurWorkPlaceID_POST_SALARY: TFIBIntegerField
      FieldName = 'ID_POST_SALARY_REAL'
      Visible = False
    end
    object SelectCurWorkPlaceNAME_DEPARTMENT: TFIBStringField
      DisplayLabel = #1055#1110#1076#1088#1086#1079#1076#1110#1083
      DisplayWidth = 50
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectCurWorkPlaceID_MAN_MOVING: TFIBIntegerField
      FieldName = 'ID_MAN_MOVING'
      Visible = False
    end
    object SelectCurWorkPlaceDATE_BEG: TFIBDateField
      DisplayLabel = #1055#1086#1095#1072#1090#1086#1082
      DisplayWidth = 30
      FieldName = 'DATE_BEG'
    end
    object SelectCurWorkPlaceDATE_END: TFIBDateField
      DisplayWidth = 50
      FieldName = 'DATE_END'
      Visible = False
    end
    object SelectCurWorkPlaceKOL_STAVOK: TFIBFloatField
      DisplayLabel = #1050'-'#1090#1100' '#1089#1090#1072#1074#1086#1082
      DisplayWidth = 30
      FieldName = 'KOL_STAVOK'
    end
    object SelectCurWorkPlaceWORK_REASON: TFIBStringField
      DisplayLabel = #1058#1080#1087' '#1088#1086#1073#1086#1090#1080
      DisplayWidth = 30
      FieldName = 'WORK_REASON'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectCurWorkPlaceID_POST_SALARY2: TIntegerField
      FieldName = 'ID_POST_SALARY'
    end
  end
  object IL_Orders: TImageList
    Height = 24
    Width = 24
    Left = 461
    Top = 181
    Bitmap = {
      494C010107000900040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000060000000480000000100200000000000006C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000014C0100014C01000151020001530300025403000252
      020001510200004F0100004B0000004A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000024F0300096A0F0011801E00168B2600168C27001689240012821F00107D
      1B000D731500096A0F00056009000356040001500100004C0000000000000000
      0000000000000000000000000000000000008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008C5D59008B5B53008857480086543C00845239008452
      390084523900845239008452390086533A0086543E008856440089584D008A59
      4D0088574800885746008A594D008C5C55000000000000000000A87D7800A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004400000C6F
      140023AB3E002DBF4E002ABA4A0025AF41001FA035001B972D0016902800118B
      22000C841A0007771100056E0E00036A0A00035E060001530300004C0000004B
      00000000000000000000000000000000000092625A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFC00F7F4EF00E7DDCE00D5C1A600CCB59200CAB18C00CAB1
      8C00CAB18C00CBB49000CEB79600D4C0A400E0D1BD00EFE7DE00F7F4EF00F4F0
      EA00EEE6DC00F0EAE100F7F4EF008E5C57000000000000000000A97F7900F3DD
      C400F8E3C600F6DFBF00F5DCB800F4D9B200F3D7AC00F3D4A700F2D2A000F0CF
      9A00F0CE9800F0CE9800F0CE9800F0CE9800F0CE9800F0CE9800F1CF9800EFCD
      9700986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000055E0800117F1E0039DA
      64003ADA650031C755002BBD4B0024B845001EB4400018A5390017952F00187D
      23001F681F00345C2800384923001C4F160007590A00005C040000560100004D
      0000004B000000000000000000000000000097665D00FFFFFF00FFFFFF00FFFE
      FE00FFFCFB00FAF4EE00E7DAC900D7C1A300CEB48F00CBAF8700CCAF8800CEAF
      8900CFB18A00D4B89500DDC5A500E9D4BB00F4E1CE00FCEAD900FFEEDE00FEED
      DC00FBE9D700FEEDDC00FFEEDE008E5D59000000000000000000A97F7A00F2DE
      C800F7E3CA00F5DFC200F4DCBC00F3DAB600F2D7B100F1D4AB00F1D2A500F0CF
      9F00EFCD9A00EECC9700EECC9700EECC9700EECC9700EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000358060039DA640043F4
      770034DE5F002EC954002EB64E00349640003F742D0055561A0064350B007E4D
      3C00AF959800B28A9000653B3B00834F5600684941003C43230015480D000252
      0200004D00000000000000000000000000009E6B6000FFFFFF00E6D7D300E6D5
      D000E6D1CB00E0C5B500CCAA8C00C49D7700C49A7300C5997000C79A7000CA9C
      7400CE9D7500D4A37A00DDA77F00E1AA8200F0B68600F2B58100AD786500AD78
      6500AD786500AD786500D99C74008E5D59000000000000000000A97F7A00F2E0
      CE00F8E7CF00F5E2C800F5DEC200F4DCBC00F3DAB700F2D7B100F1D4AB00F1D2
      A500F0CFA000EFCD9A00EECC9700EECC9700EECC9700EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000055E080041F375004BD1
      6E00578C58006E836400935B1C00B04A040096330600A93301009E270000A05F
      4800D4BFC900BD9FA000653B3B008F636B009A636F009D576A00653B3B000C4F
      090000510000000000000000000000000000A6726300FFFFFF0090605B009060
      5B0090605B008F5F590000334B002D91B400B4C5BB00F0D5B700F0D3B200F4D3
      B100F6D1AB00FAD0AA00FCD0A500FECE9F00FEC99700E6AC8200A9736300E6A6
      7800E6A67800E6A67800B77B65008E5D59000000000000000000A97F7A00F3E3
      D200F9E9D400F6E4CD00F5E1C700F5DEC100F4DCBC00F3D9B600F2D7B000F1D4
      AA00F1D2A500F0CFA000EECC9900EECC9700EECC9700EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000055E080063AC
      6E00D4A1B400E0C0CC00D96D1300DC5B00009F400200B1410000A6300000A05F
      4800CFBBC500BD9FA000653B3B008F636B00916870009A636F00653B3B00004A
      000000000000000000000000000000000000AF796700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFC0008739E0000A6E60008739E0045A7C700D4D9CB00FFE3
      C900FFDEC000FEDAB700FED5AF00FED1A700FECE9F00EBB68C00A36E6200A36E
      6000A36D5F00A36D5F00C78B6C008E5D59000000000000000000A97F7B00F4E6
      D800FAECDA00993300009933000099330000993300009933000099330000F2D7
      B000F1D4AB00F1D2A600F0CFA000EECD9A00EECC9700EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000055E08003D72
      3900E2C6CF00DDCACE00C9721200D35E0100A3480B00B4500D00AB491200A974
      5E00D4C5C900C1A5A400653B3B00916870009769730097697300653B3B000000
      000000000000000000000000000000000000B7806A00FFFFFF0090605B009060
      5B0090605B0090605B004D6C7E00009FDE0000BDFF0008739E001C647B009060
      5B008F5B540090605B0090605B0090605B00E0AD8E00FECE9F00FEC99700FEC5
      8F00FEC08700FEBD8200FEBD82008E5D59000000000000000000AA807B00F5E9
      DD00FBEFE00099330000FEFEFE00D8DEF5003961FD007189E50099330000F3D9
      B600F2D7B100F1D4AC00F1D2A600F0CFA000EECC9900EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000653B
      3B00DDCACE00E9DADE00D4B59800D3AC9500C1A5A400C1A5A400C5ABAC00C6B1
      BA00CFBBC500BCA3AA00653B3B008C6F7D00967581009A747D00653B3B000000
      000000000000000000000000000000000000C0866D00FFFFFF00FFFFFF00FFFF
      FF00FFFCFB00FFFAF400EAEEED0008739E001C849A0090280000B0410000811E
      0000FED9B600FED9B600FED7B100FED3AC00FED1A700FED1A700FECE9F00FEC9
      9700FEC58F00FEC08700FEBD82008E5D59000000000000000000AD837D00F5EC
      E300FBF2E60099330000C9D3FB002C58FF007691FE00204BF7008E300400F4DC
      BB00F3D9B600F2D7B100F1D4AB00F1D2A500F0CFA000EECC9900EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000653B
      3B00D1BDBA00D1BDBA00B29C9F00B1969000BB998400C19A7500AB7F6000B787
      5200C07F3600B46E2300653B3B00964922007E4D3C0082636900653B3B000000
      000000000000000000000000000000000000C78C6F00FFFFFF004BB14B00FFFF
      FF00FFFFFF00A4BAFF00A4BAFF003699D9009C310000EE882000F77D0200D862
      0000811E0000FFE3C900FFE3C900FFDEC000FEDAB700FED5AF00FED1A700FECE
      9F00FEC99700FEC58F00FEC087008E5D59000000000000000000B2887E00F7EF
      E800FCF5EC0099330000E1E7FE00CAD4FE00FEFEFE007E98F900332B7900F5DF
      C100F4DCBC00F3D9B700F1D7B000F1D4AB00F0D2A500F0CF9F00EFCD9A00EDCA
      9600986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000653B
      3B00D5B48100DDB87A00A5764C00CF9E5100E2A94700E19F3A00A9682600D084
      2000E08C1700C5700D00653B3B00C14800008F320200872D0700653B3B000000
      000000000000000000000000000000000000CC927200FFFFFF00FFFFFF000081
      0000FFFFFF00315EFF00315EFF002963F7009C310000FFB66A00FF992700F67B
      0200D8600000811E0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008E5D59000000000000000000B68B8000F8F2
      EE00FDF8F10099330000FEFEFE00FEFEFE00FEFEFE00F8F8FA001D2EAF007B8C
      E300F4DFC100F4DCBC00F3D9B600F2D6B000F1D4AA00F0D1A400F0D09F00EDCB
      9800986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000653B
      3B00F7E9AC00FEE79F00B88F6000E7BD6F00EFBD5F00EAB15100AB6F2E00D893
      3000E3962500CA7B1B00653B3B00D95C0000A4420300A5380000653B3B000000
      000000000000000000000000000000000000D1967400FFFFFF004BB14B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C310000CE7A4500FFB66900FF99
      2600F67B0200D7600000811E0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008E5D59000000000000000000BA8E8200FAF6
      F400FEFCF80099330000993300009933000099330000993300008D320C004163
      F2004866EC00ABAAD300F4DCBB00F3D9B600F1D7B000F1D4AA00F1D2A500EECD
      9E00986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000653B
      3B00E6D8AD00EFDAA100AB845F00DDB87A00E6BA6800D9A95D00A7744000CC91
      4100D9983B00C1813100653B3B00DC670300A7470500B1410000653B3B000000
      000000000000000000000000000000000000D1967400CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E68009C310000CE7A4500FFB5
      6800FF982400F67A0100CB560000811E0000CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E68008E5D59000000000000000000BE928300FBF8
      F700FFFFFE00FEFAF600FCF5EF00FAF2EA00FAF0E300F9ECDD00F9E9D800F3E4
      D3008290E3006E81E400F5DEC100F4DCBC00F3D9B600F2D7B000F2D5AB00EFCF
      A400986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000653B
      3B00D0C2BB00DED0C700CAB4AB00CFBAB000CAB4AB00C7AFA400BB9F9700BFA0
      9500C1A49800AD8C8300653B3B00936A5800906959009A695000653B3B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C310000CE7A
      4500FFB56700C16F1F00288188005765450000334B0000000000000000000000
      0000000000000000000000000000000000000000000000000000C2968500FBF8
      F700FFFFFF00FFFEFC00FEF9F400FCF6EF00FBF3EA00FAEFE300F9EDDD00F8E9
      D700F8E7D200F6E4CD00F5E1C600F5DEC100F4DCBB00F3D9B500F2D7B000F0D2
      A800986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000653B
      3B00D4B59800DCBF9100B0896A00CBA36D00D3A36400CC995400A7744000C283
      3A00CB862F00B46E2300653B3B00AB4F13000C489800843D1F00653B3B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C31
      0000C5703C00288492008C632D00F4790100D55E0000811E0000000000000000
      0000000000000000000000000000000000000000000000000000C6998600FBF8
      F700FFFFFF00993300009933000099330000993300009933000099330000F9EC
      DD00F8EAD800F8E6D200F6E4CC00F6E1C600F5DEC000F4DCBB00F4DAB600F1D5
      AE00986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000653B
      3B00F0E6AB00FEE79F00B7875200E6BA6800EFBD5F00E2A94700AB6F2E00D48B
      2600E08C1700C9721200653B3B000C489800135FC4000C489800633B3D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C3100001C849A00F7A95B00FF962100F3790100D45E0000811E00000000
      0000000000000000000000000000000000000000000000000000CA9C8800FBF8
      F700FFFFFF0099330000FEFEFE00D8DEF5003961FD007189E50099330000FAEF
      E300F9ECDD00F8E9D700F8E6D100F6E3CB00F5E1C600F4DEC000F3DBBA00D9C4
      A700986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000653B
      3B00DDD1B200E6D8AD00B18E7000D5B48100DAB26F00D9A95D00A7744000CC91
      4100D8933000BF7A23000C489800185FB8001F83FF001462C6000C4898000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000334B00CE7A4400FFB46300FF961F00F3780100D45D0000811E
      0000000000000000000000000000000000000000000000000000CEA08900FCF9
      F700FFFFFF0099330000C9D3FB002C58FF007691FE00204BF7008E300400FBF2
      E900FAF0E300F9ECDD00F8E9D700F8E6D100F6E4CC00EBD9C000D1C1AB00B5A8
      9700986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000653B
      3B00DED4D500EFEAEA00E7E0E000E6DCDA00E2D7D300DED0C700D1BDB700D1BB
      AF00D4BBA900C19F8B000D4DA1001F82FA001F81FF002086FF00115DC6000C48
      9800000000000C4898000C489800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C310000CE7A4400FFB26200FF951F00F3780100D35D
      0000811E00000000000000000000000000000000000000000000D2A38A00FCF9
      F700FFFFFF0099330000E1E7FE00CAD4FE00FEFEFE007E98F900332B7900FCF6
      EF00FAF2E900FAEFE200FAEDDE00FBEEDB00E7DBC900C8BDAF00BAB0A200B7AC
      9D00986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000653B
      3B00EFEAEA00EFEAEA00F2EDEE00F2EEF400F6F3F800F4F2FA00F6F3F800F2EE
      F400F4F2FA00F4F2FA000C4898001C79E9002188FF001C7FFF002087FF001F70
      C5000C4898002C8ADA000C489800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C310000982E0000000000009C310000E69C6200FFB26000FF951D00F277
      0100D35C0000811E000000000000000000000000000000000000D7A78C00FCF9
      F700FFFFFF0099330000FEFEFE00FEFEFE00FEFEFE00F8F8FA001D2EAF007F98
      FA00FCF5EE00FCF5EB00EEDDD100B4817600B4817600B4817600B4817600B481
      7600B48176000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000653B
      3B00653B3B00653B3B00653B3B00653B3B00653B3B00653B3B00653B3B00653B
      3B00653B3B00653B3B00653B3B000C4898001972E300258BFF002F99FF0042B4
      FF003DA7F2002D8BD9000C489800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C310000972D000091290000811E0000E69C6200FFB15E00FF93
      1C009E4105002B51580014668100000000000000000000000000DAAB8D00FCF9
      F800FFFFFF0099330000993300009933000099330000993300008D320C004369
      FE004B6DF900B2BEF500E3CEC600B4817600E3B58500E5AD6A00E9A65400EFA0
      3900B88285000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C4898002889ED0041B0FF0046B8
      FF004DC2FF002E8CD7000C489800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C3100009D3200009C31000088260300E69C6200AA5E
      2C000E6C900000A3E20008739E00000000000000000000000000DEAD8E00FDFA
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFB
      FF00869DFC00738EFA00E5D1CB00B4817600EFC48D00F3BB6D00F8B45000B882
      8500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A4391002070BD0048B8FE0050C6
      FF0051C9FF003090D8000C489800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C310000962D0000811E0000892603002862
      6F0000A6E600009AD90008739E00000000000000000000000000DEAD8E00FDFA
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E5D4D000B4817600EFC38C00F3BA6C00B88285000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C489800287FC700287FC7003DA5EA003596
      DD002E8BD3003395DC000C489800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C31000000000000000000000F6B
      8C0008739E0008739E0000000000000000000000000000000000DEAD8E00FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E9DBD900B4817600F1C58B00B8828500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C4898000C4898000C4898000C4898000C48
      98000C4898000C4898000C489800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA4
      8200DAA48200DAA48200DAA48200B4817600B882850000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000490000004900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000A7713000A77
      130009731100076D0F0007680D0006630B00045E0900045C0A00045C0A00045C
      0A00045C0A00045C0A00045C0A00045C0A00045C0A00045C0A00045C0A00045B
      0A00045207000452070000000000000000000000000000000000000000000000
      0000004900000049000000520000004900000049000000490000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000001548B000058910000528A0000528A000056
      8F00000000000000000000000000000000000000000000000000000000007A7A
      7A007A7A7A009D969600A9A7A700939392008F8E8C00908B8A009D9696009690
      9000818181007A7A7A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000E8E1D000D851A001091
      23000E8E1F000C8A1B000A86180009821300077E1000067D0F00067D0F00067D
      0F00067D0F00067D0F00067D0F00067D0F00067D0F00067D0F00067E0F00067E
      0F0005690C00044D070004520700000000000000000000000000004900000049
      0000007500000084000000840000004900000183040000750000004900000049
      0000004900000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004E830000528A00036399000169A30000649D0000649E000056
      8F00004D840000000000000000000000000000000000000000007A7A7A008E8E
      8E00B4B4B40056747A000A6F96000580B000005BB1000A6F96000D6080003D5D
      6700A09090008B8787006C6766004B322F0062413D0079514C00895B56008F5E
      5900905F5A00905F5A0090605B0080504B00000000000E8E1D001CB43F001DBE
      430019BB3A0016B9330013B82E0011B627000DB521000AB51B0009B4190009B4
      190009B4190009B4190009B4190009B4190009B4190009B4190009B4190009B7
      1A0008AC180006690B0004520700000000000000000000000000004900000183
      0400018B0300018E0100018E010000490000018B030000830000007D00000074
      000001680D0000490000004B8200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000005089000053
      8C0000508900086091002EA9CE002DD3F20017C9F30005BFF20000B6F00000A4
      DE0000649E0000487F0000487F0000000000000000007A7A7A0090909000C2C1
      C1003E7B8B000DC5FF0002BBFB0000AFEF00021F9E000086C6000086C6000082
      BF000E5774008F7A79008E878700756D620087704D00B2926000D9B17500EAC0
      7F00EFC48100F0C58100F3C9820082524C0000000000149F2A0023BF500022C0
      4C001DBD43001ABC3D0017BB370015BA310011B82A000EB624000BB51E00FFFF
      FF0009B4190009B4190009B41A0009B41A0009B41A0009B41A0009B41A0009B7
      1A0009B71A00067E0F00045B0A00000000000000000000000000004900000393
      090003900900039309000393090000490000028A1200047E3500025617000051
      000001751300004A810032B4F60000477B000035000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003568B00086B9F000573
      A9000067A000056499002EA9CE003ED4EF002DD3F20017C9F30007BAF0000196
      CC0000609A00004D84000050890000528A00000000007A7A7A00C2C1C1005B89
      95003BD4FF002ACFFF0018C9FF0009C2FF0002BBFB0000ACED00009DDC00008C
      CA000082BF0011516A00A9919000807F7E0076654C009A7E5400C9A36C00E1B7
      7A00EABF7F00EABF7F00EDC1800082524C000000000016A52E0028BF570025C0
      530022BD4B001EBC44001BBA3E0019B9380015B7320013B62D000FB52500FFFF
      FF0009B21A0009B2190009B2190009B2190009B2190009B2190009B2190009B4
      1A0009B41900067E0F00045C0A00000000000000000000000000004900000798
      12000798120006990F0006990F0000490000179D7200004A8100004273000353
      23000253220000477B0020A4E900004A81000167120000480000004B8200004B
      8200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000508800005088000050
      8800005088000059930000538C0003568B00055B9100086B9F0002578C000052
      8A00004E88000069A40000A4DE000087C2007A7A7A00A3A3A3009397980074D8
      F30062DDFF004BD8FF003BD4FF0025CEFF0013C7FF0007C1FF0000B6F70000A7
      E7000099D800008CCA00485256009F909000756F66008E744D00BD9D6A00E1B7
      7A00EABF7F00EABF7F00EDC1800082524C000000000018AB33002EC162002CC1
      5E0028BE550025BD4F0022BC49009CE1AC00C6EDCE00FFFFFF00FFFFFF00FFFF
      FF00D2F1D500A3E2AA0028BC360009B2190009B2190009B2190009B2190009B4
      1A0009B41900067D0F00045C0A00000000000000000000000000004900000CA0
      1C000A9F19000A9F19000A9F19000049000021A17F00004B820036D7FC000046
      7A0000467A000FACE90016A1E0001C9ED300004B8200004B820065D7F700004B
      8200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000548E0005649900046D
      A4000168A1000068A1000069A40000609A00004E88000000000001528A000058
      91000076B20002BBF30001CEFF00006DA6007A7A7A00CFCECE007E989E0097EA
      FF0086E5FF0074E1FF005DDCFF004BD8FF0034D1FF001FCBFF0013C7FF0004BF
      FE0000B6F70000A7E7000D608000B2979600777575005C3E3C00815653009866
      63009E696600EABF7F00EDC1800082524C000000000019AD350036C46D0036C4
      6D0030C261002BBF580026BE5100FFFFFF00F1FBF30063D07A0018B93700FFFF
      FF005CCD6E00F0FAF100FFFFFF0047C5530009B2180009B2190009B2190009B4
      1A0009B41900067D0F00045C0A00000000000000000000000000004900000FA9
      24000EA323000FA924000FA92400004900000AA1250000477B0048C6EF002ED7
      FF000FCEFF000BB7F8000FA1E90018A0E60026A9E2003CB7E30036AAD100004B
      8200000000000000000000000000000000000000000000000000000000006637
      3800663738006637380066373800663738000000000000508800005088000050
      88000050880000508800005088000050880000508800014F860001578E000781
      B60013D3FB001ADDFF000182C000000000007A7A7A00C9C9C900A6BFC500B6F0
      FF00A6EDFF0097EAFF0081E5FF0067D1EE00357081003493AD0034D1FF001FCB
      FF000DC5FF0004BFFE00078EBA00967D7B008682820087704D00BD9D6A00E0B7
      7E00EAC08200EABF7F00EDC1800082524C000000000019AD340041C8750042C9
      78003BC66F0033C365002DC25D00FFFFFF009FE2B1001FBB47001CBA4000FFFF
      FF0016B8340097DFA300FFFFFF00E1F5E3000AB21B0009B2190009B2190009B4
      1A0009B41900067D0F00045C0A000000000000000000000000000049000013B0
      2F0011A92C0011B02D0011B02D00004900000B9630000F6D430000477B004EDE
      FF0019B1DA0000477B00004A8100004B82001598DA0026A9E200004B82000000
      000000000000000000000000000000000000000000002F1D6700885046007E48
      470080494900824B4B00824B4B00834C4A00663738000C5A800004699E000469
      9E00015E9700005E980000629C0000649E0000589100004D8400096A9D002DD3
      F20032F0FF000DA1DC0000000000000000007A7A7A00D1D1D100818BBB001F21
      9C00C6F3FF00B6F0FF00A6EDFF0064929F001E1E1E001E1E1E001E1E1E001E1E
      1E00289CBD00021F9E000D529D00836D6B00868282008A755500BD9F7300E0BB
      8300EAC28400EAC08200EDC1800082524C000000000019AD34004FCC800050CD
      820046C979003BC7710035C46800FFFFFF005ECE810025BD4F0020BC4900FFFF
      FF001ABA3C0099E0A700FFFFFF00FFFFFF000FB525000AB21E0009B21A0009B4
      190009B41900067D0F00045C0A000000000000000000000000000049000017B4
      3A0017B43A0011B12C001C9E4A0066B0BA00004A810000477B0095EAFB005BD3
      F70000467A00086C0D000B9511000D8F2300004B820018A0E60023A3D800004B
      8200004B82000000000000000000000000000000000023136500A3594F00C467
      6300C05C5E00B5535400A94D4E00A04B49007F4A5100094D8100004E88000050
      880000538C00004E8800004D8400004D8400024B7D0001466B0018A3C6003ED4
      EF001C7F990037433E009E3D01009E3D01007A7A7A00CCCBCB00C7CBCC00CCD4
      EE00E3FAFF00D3F6FF00C6F3FF009FD0DE00445458001E1E1E002C3B3F0054A7
      BD004ECBEE0039C2F7002C95BD009C8180008381810060413F00815653009866
      63009E696600EBC58A00EDC1800082524C000000000019AD340062D28D0063D2
      8F004FCC80003CC773003CC7730066D48F003AC56B0028BF580025BE5100FFFF
      FF0057CC7400F1FBF300FFFFFF00FFFFFF0013B62D0010B427000DB320000AB5
      1B0009B41900067D0F00045C0A00000000000000000000000000004900001EC1
      4A001CBB410011B12D0036BA7400004B8200D8FBFF00CAF6FF00B7F0FB0064CE
      EB00004579000A6B14000D911F000D971800004A810013A1ED001DA1DA0030B0
      E60049C9F200004B8200000000000000000006068A002323A0005E356800F37A
      7300FF898100EA6B6D00D95D5F00D451530069464B00014F8600066A9F000781
      B6000388C1000182C0000079B6000060A0000C5A800072957B00398986007295
      7B00FFFFFF00FFFFFF00FFFFFF009E3D01007A7A7A00CFCECE00ADACAC00FEFF
      FF00F7FEFF00EBFBFF00DEF8FF00D3F6FF00C1F2FF0089B2BD00262828003D5D
      670074E1FF0062DDFF00488FA100B59999007A7A7A009E896B00CCAF8600E6C5
      9200EBC58F00EBC48C00EDC1800082524C000000000019AD340073D79A0074D7
      9C005BCF880041C8750041C8750038C56F0031C369006FD49200AEE7C100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F1FBF30017B8360014B72F0011B629000EB6
      24000BB51C00067E0F00045D09000000000000000000000000000049000020C7
      52001EC14A001EC14A001EC14A0000490000004B8200004B8200B7F0FB00A4ED
      FE0000467A00076520000B6A1C000968370000477B000FB4F4001195CF00004B
      8200004B82000000000000000000000000000A067F009CB2FE002F3CC0003F22
      6B00D5706D00FF898100FB747A009F544900166330001C7F990048E2FF0035E6
      FF001ADDFF000BD5FF0001CEFF0000B8FF000A75BC00AFA7D3008AC481000D6A
      2B00FFFFFF00FFFFFF00FFFFFF009E3D01007A7A7A00A3A3A300AFAFAF00F7F7
      F700FFFFFF00FCFFFF00F7FEFF00EBFBFF00DEF8FF00CEF4FF009DC4CE002628
      280056747A0081E5FF006F7274009F9090007F7A7400B49D7E00D8BA9100E6C5
      9200EDC69000EBC48A00EDC2840082524C000000000019AD34007ED9A20080DB
      A40062D28D0046C9790045C9780060D28C00D9F4E300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1FBF40065D07F001BBA3E0018B9370015B7320012B8
      2C000FB525000983140006630C000000000000000000000000000049000026CE
      5A0024C9550026CE5A0026CE5A00004900001ACC510022AA6F00004B8200CAFB
      FF0095DEF20000467A000045790000467A0013C9FC000CC0FB00004B82000000
      0000000000000000000000000000000000000A067F00E2E9FC007390FF001C35
      D40030238000C6646A00DA7265004181350022CA48001EA772002CB7BC002CB7
      BC0018A3C6000DA1DC000196CC0000898300004B8800051EE0000F478C000D6A
      2B000D6A2B000D6A2B000D6A2B009E3D0100000000007A7A7A00C7C6C600B4B4
      B400FFFFFF00FFFFFF00FFFFFF00FCFFFF00F3FCFF00E7FAFF00DAF7FF00A7C6
      CE0098C2CE007E989E00B1989800807F7E006E53510087595700986663009E69
      66009F6A6700EEC69300EEC58E0082524C000000000019AD340085DBA60087DD
      AA0068D3910049CA7B0047C97A00CEF1DC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CAEFD70086DBA20033C25E0022BC4C001FBB47001CBA400018B93A0016BA
      340013B82E000B881900076B0E00000000000000000000000000004900002BD7
      630028D15C002BD7630026CE5A000049000034CC7E00004B8200C0F0FE00C0F0
      FE00CAF6FF00A4EDFE0070E2FF004EDEFF002ED7FF000FCEFF000AB2EB00004B
      8200000000000000000000000000000000000A067F00C7CCF200B5C1FA005E80
      FF001C39EE001A148F00272C41000D6A2B00188A3C001886280009771F000977
      1F00247A59000735CF0018598E004DA3410052A54B0041818C000523F8004674
      A000FFFFFF00FFFFFF00FFFFFF009E3D0100000000007A7A7A0090909000CECE
      CE00B4B4B400FFFFFF00FFFFFF00FFFFFF001F219C00CCD4EE00F3FCFF00E3FA
      FF009FB1B500A99190008E87870089847E00C7B8A600E1C9AA00EBCFAA00EFCF
      A500EECCA000EECA9900EFC7930082524C000000000019AD340089DDAA008CDE
      AD006DD495004DCB7E004DCB7E00FFFFFF00FFFFFF00F3FBF6007FDAA300FFFF
      FF0031C369002CC2620029C15B0026BF550023BF4F0020BC49001DBB42001ABC
      3D0017BB37000E8D1E00097311000000000000000000000000000049000030DE
      68002DD5620030DD690030DD69000049000054CCB500004B8200C0F0FE00004B
      8200004B8200A7E5F00096EDFE004CBDD800004B8200004B820011D0FF00004B
      820000000000000000000000000000000000000000000A067F00B5C1FA0090A9
      FF004B6FFF00092AFB00000ECA000010A600010E900001147600011476001429
      56009AB5C000112AFF006990C600FFFFEE00FFFFFF00FFFFFF003B60D5004E56
      F700FFFFFF00FFFFFF00FFFFFF009E3D010000000000000000007A7A7A008E8E
      8E00BBBABA00ADACAC00C5C5C500E6E6E600ADADDE00E6E6E600C9C9C900A4A0
      A000AC9D9D008B87870084828000C7B8A600E1D4BD00EDD8B800F2D7B400F2D4
      AD00F0D0A600EECCA000F4CF9A0082534D000000000019AD34008CDDAB0091DF
      B10073D79A0052CD820056CE8500FFFFFF00FFFFFF00A8E6C00036C46D00FFFF
      FF0034C36B0032C36B00FFFFFF0052CD7C0028BF580025BE520022BD4B001FBE
      46001CBA4000109322000A7A14000000000000000000000000000049000035E7
      6B0034E0670035E76F0030DD69000049000040D49300004B8200004B82001FC0
      5F0027BB6C00004B8200C5F4FF00004B820014B246000F8F6300004B8200004B
      82000000000000000000000000000000000000000000000000000A067F006F7B
      DD00607EFE002C4CF300092AFB00001DFF00011DEF000018E0000004B0004348
      B700EDEBFF001C39EE005073E700FCFFE600FFFFFF00FFFFFF00355CCC002C4C
      F300FFFFFF00FFFFFF00FFFFFF009E3D01000000000000000000000000007A7A
      7A007A7A7A0098989800ADACAC00A9A7A700A9A7A700A7A3A300A69F9E009690
      9000807F7E00796A69008759570093635F00986663009E6966009F6A67009F6A
      67009F6A6700F6D4AA00E6C79C0082534D000000000019AD34008FDEAE0098E1
      B5007DD9A10058CE860063D28E00D6F3E100FFFFFF00B9EBCD0041C87500FFFF
      FF003AC5700075D79B00FFFFFF0065D18E002EC1620029C05A0026BF550023BF
      4F0020BC4900139828000C821700000000000000000000000000004900003CF0
      760037E56B003CF076003CF076000049000041FB7E002ACB6E002BCF6A0030E3
      5F0032CA7500004B8200CFF0FF00004B820023D15B0000490000000000000000
      0000000000000000000000000000000000000000000000000000000000000A06
      7F000A067F001B2AC6000C1FCB00000ECA00000ECA00090F9200163E45000D6A
      2B000D6A2B001D6878000524F200275AC500275AC500233FFC000524F2001D68
      78000D6A2B000D6A2B000D6A2B009E3D01000000000000000000000000000000
      0000000000007A7A7A007E7A7900828282008282820082828200818181009393
      9200C1BDB800E2DDD700EFE6DE00F4EBE000F8EEE000F7E7CE00F4DDBF00F4DD
      BF00F2D7B400DDC2A100B5A6900081514C000000000019AD340092DFB0009EE3
      BA008BDDAA005BCF880063D28E0071D69900DFF6E800FFFFFF00AFE8C500FFFF
      FF00A3E4BC00F3FBF600FFFFFF008DDDAC0032C36B002EC164002AC05D0027C0
      580025BE5100169E2E000D8919000000000000000000000000000049000043F8
      7E0041F4790047FF860047FF86000049000051FF930047FE7B0041F475003AEA
      6F0032DC6C0044C19900004B820034CC7E0035E76B0000490000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000A067F000A067F000A067F000A067F009E3D0100FFFFFF00FFFF
      FF00FFFFFF000D6A2B0014578400011DEF00000CF6000012FF00094D81000D6A
      2B00FFFFFF00FFFFFF00FFFFFF009E3D01000000000000000000000000000000
      00000000000000000000BA806900F2EEE900EFEBE900EFEBE900EFEBE900EFEB
      E900F3EFED00F8F2ED00F8F2ED00FAF3EA00FAF3EA00F8EAD900FFF4DA00F7E7
      CE00D1C5AD00B5A69000A49D8A0080504B000000000019AD340091DFAE00A3E4
      BC009EE3B80073D79A006DD4950066D290005DD08A0097E0B400A8E6C000FFFF
      FF00A8E6C000A3E4BC0085DCA80043C9770034C36B0032C36B002EC366002CC2
      610029C05A0017A232000E911C000000000000000000000000000049000043F8
      7E0034E067001CBB4100117B1C00004900001CAF3B002ED55B0041F4750047FE
      810043F87E003AEA6F0030DD690037E56B003FF2760000490000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009E3D0100FFFFFF00FFFF
      FF00FFFFFF000D6A2B00FFFFFF00FFFFFF00607EFE002645FF00034E7D000D6A
      2B00FFFFFF00FFFFFF00FFFFFF009E3D01000000000000000000000000000000
      00000000000000000000C78E7000FCFAF700FBF7F400FBF7F400FBF7F400FBF7
      F400FBF7F400FBF7F400FCF7F400FCF7F400FCF7F400F8EAD9009F675A009F67
      5A009F675A009F675A009F675A008F6053000000000019AD350089DDAA00A0E4
      BB00A9E6C000A3E4BC009DE3B80097E0B4008EDEAD0085DBA60079D89E00FFFF
      FF0061D18C0051CC800043C977003AC5700034C36B0032C36B0030C4690030C4
      69002DC264001AA938000F991F000000000000000000000000000049000043F8
      7E000F5F10003E6A300096B7900096B790004F8B4900176B16000A741C00159D
      2D002ED55B003FF2760046FF7F0043F87E0045FB7E0000490000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009E3D0100FFFFFF00FFFF
      FF00FFFFFF000D6A2B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000D6A
      2B00FFFFFF00FFFFFF00FFFFFF009E3D01000000000000000000000000000000
      00000000000000000000C78E7000FFFFFC00FCF8F600FCF8F600FCF8F600FCF8
      F600FCF8F600FCF8F600FCF8F600FCF8F600FFFCFB00F2EEF0009F675A00FAC6
      8000EDA95700EDA95700EDA95700A46A6500000000001AAE34007CD9A20093E0
      B300A0E4BB00A6E5BF00A6E5BF00A3E4BC009DE3B80093E0B30089DDAA007BD9
      A0006AD4940059CF880048CA7D003CC8740035C6700033C56E0031C46C0033C5
      6E0031C56D001DAD3D0011A02100000000000000000000000000094102000040
      0000735E4C00735E4C00B68E8A00E3C2C600FFFFFF00E9DCD400C6C0A4004E87
      4200176B16000C74130018A4320037DC65004DFF8A0000490000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009E3D0100BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B00009E3D01000000000000000000000000000000
      00000000000000000000CC917200FFFFFF00FCF8F600FCF8F600FCF8F600FCF8
      F600FCF8F600FCF8F600FCF8F600FCF8F600FFFFFC00F2EEF0009F675A00FAC6
      8000EDA95700FFA73100BB75580000000000000000001AAE34002ABD5A007BD9
      A00088DCA80091DFAE0092DFB00092DFB0008DDDAC0087DCA8007DD9A10071D5
      980063D28E0054CD820045C978003BC7710034C56D0032C36B0030C4690031C4
      6C002CBF5F0014AA2B0011A02100000000000000000000000000000000000000
      0000094102000546020009410200234612004D5C3500958A7800E3C2C600E9DC
      D400C6C0A400926959002D461600035404000049000000490000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009E3D01009E3D
      01009E3D01009E3D01009E3D01009E3D01009E3D01009E3D01009E3D01009E3D
      01009E3D01009E3D01009E3D0100000000000000000000000000000000000000
      00000000000000000000CF957300FFFFFF00FCF7F400FCF7F400FCF7F400FCF7
      F400FCF7F400FCF7F400FCF7F400FCF7F400FFFCFB00F2EEF0009F675A00FAC6
      8000FBB55200BB7558000000000000000000000000000000000019AD340019AD
      340019AD350019AD340019AD340019AD340019AD340019AD340019AD340019AD
      340019AD340019AD340019AD340019AD340019AD34001BAD360019AD350019AD
      350013A8270013A8270000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000044000009410200124508004D5C
      3500726B4B000941020000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D1967400FFFFFF00FCF7F400FCF7F400FCF7F400FCF7
      F400FCF7F400FCF7F400FCF7F400FCF7F400FCF7F400F2EEF0009F675A00FAC6
      8000BA8069000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000941
      0200024300000749030000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D1967400CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E68009F675A00AA6D
      680000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000480000000100010000000000600300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FC00FFFFFFFFFFFFFF000000F0003F00
      0000C00007000000C0000F000000C00007000000800007000000C00007000000
      800007000000C00007000000800007000000C00007000000C0000F000000C000
      07000000C0001F000000C00007000000E0001F000000C00007000000E0001F00
      0000C00007000000E0001F000000C00007000000E0001F000000C00007000000
      E0001F000000C00007000000E0001FFFC07FC00007000000E0001FFFE03FC000
      07000000E0001FFFF01FC00007000000E0001FFFF80FC00007000000E00009FF
      FC07C00007000000E00001FFF203C00007000000E00001FFF801C00007000000
      FFFF01FFFC01C0000F000000FFFF01FFFE01C0001F000000FFFE01FFFF63C000
      3F000000FFFE01FFFFFFC0007F000000FFFFFFFCFFFFFFFFFFF80FFFC00003F0
      3FFFFFFE0FE003FF800001C007FFFFF807C00000800001C001FFFFC001800000
      800001C0007FFF8000800000800001C0000FFF8000000000800001C0000FFF80
      40000000800001C0000FE08001000000800001C0001F800003000000800001C0
      0007800000000000800001C00003000000000000800001C00007000000000000
      800001C0001F000000800000800001C0000F000000800000800001C0000F8000
      00C00000800001C0000FC00000E00000800001C0003FE00000F80000800001C0
      003FF80000FC0000800001C0003FFF8000FC0000800001C0003FFF8000FC0000
      800001C0003FFF8000FC0001800001F0003FFFC001FC0003C00003FF03FFFFFF
      FFFC0007FFFFFFFFE3FFFFFFFFFC000F00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Left = 41
    Top = 105
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = cxButton1Click
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = cxButton2Click
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 16504
      OnExecute = cxButton3Click
    end
  end
  object DSetConsts: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 491
    Top = 181
    poSQLINT64ToBCD = True
  end
  object DSetGetMoveType: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 523
    Top = 181
    poSQLINT64ToBCD = True
  end
end
