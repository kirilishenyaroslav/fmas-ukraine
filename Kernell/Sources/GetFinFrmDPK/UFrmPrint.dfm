object frmPrintFrm: TfrmPrintFrm
  Left = 420
  Top = 159
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1103' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091' '#1092#1086#1088#1084#1080' '#1092#1110#1085'.'#1079#1074#1110#1090#1085#1086#1089#1090#1110
  ClientHeight = 431
  ClientWidth = 672
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
    Top = 390
    Width = 672
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 508
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 588
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 390
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 114
      Top = 16
      Width = 211
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
    end
    object Label2: TLabel
      Left = 113
      Top = 38
      Width = 211
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
    end
    object Label5: TLabel
      Left = 54
      Top = 65
      Width = 582
      Height = 20
      Alignment = taRightJustify
      Caption = 
        #1053#1072#1076#1072#1090#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1080' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091' '#1092#1086#1088#1084#1080' '#1092#1110#1085#1072#1085#1089#1086#1074#1086#1111' '#1079#1074#1110#1090#1085#1086#1089#1090#1110' '#1091' '#1088#1086#1079#1088#1110#1079 +
        #1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbMonthBeg: TComboBox
      Left = 339
      Top = 10
      Width = 130
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
    end
    object cbYearBeg: TComboBox
      Left = 476
      Top = 23
      Width = 117
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
    end
    object cbMonthEnd: TComboBox
      Left = 339
      Top = 36
      Width = 130
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
    end
    object ShowSmGr: TcxCheckBox
      Left = 6
      Top = 173
      Width = 145
      Height = 31
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1043#1088#1091#1087' '#1073#1102#1076#1078#1077#1090#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object ShowSm: TcxCheckBox
      Left = 6
      Top = 213
      Width = 136
      Height = 31
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1041#1102#1076#1078#1077#1090#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object ShowRz: TcxCheckBox
      Left = 6
      Top = 258
      Width = 136
      Height = 31
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1086#1079#1076#1110#1083#1110#1074
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object ShowSt: TcxCheckBox
      Left = 6
      Top = 301
      Width = 132
      Height = 30
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1057#1090#1072#1090#1077#1081
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
    end
    object ShowKv: TcxCheckBox
      Left = 6
      Top = 342
      Width = 131
      Height = 30
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1050#1045#1050#1042#1110#1074
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
    object edTypeKvInfo: TcxRadioGroup
      Left = 159
      Top = 342
      Width = 507
      Height = 41
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 8
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1082#1086#1076#1110#1074' '#1074#1080#1076#1072#1090#1082#1110#1074
    end
    object edTypeStInfo: TcxRadioGroup
      Left = 159
      Top = 301
      Width = 507
      Height = 41
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 9
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1089#1090#1072#1090#1077#1081
    end
    object edTypeRzInfo: TcxRadioGroup
      Left = 159
      Top = 258
      Width = 507
      Height = 41
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 10
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1088#1086#1079#1076#1110#1083#1110#1074
    end
    object edTypeSmInfo: TcxRadioGroup
      Left = 159
      Top = 213
      Width = 507
      Height = 41
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 11
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object edTypeSmGrInfo: TcxRadioGroup
      Left = 159
      Top = 173
      Width = 507
      Height = 41
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 12
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object ShowSch: TcxCheckBox
      Left = 7
      Top = 96
      Width = 120
      Height = 33
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1072#1093#1091#1085#1082#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 13
    end
    object edTypeSchInfo: TcxRadioGroup
      Left = 159
      Top = 91
      Width = 507
      Height = 41
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 14
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1088#1072#1093#1091#1085#1082#1110#1074
    end
    object ShowReg: TcxCheckBox
      Left = 7
      Top = 136
      Width = 144
      Height = 33
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1077#1075#1110#1089#1090#1088#1110#1074' '#1086#1073#1083#1110#1082#1072
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 15
    end
    object edTypeRegInfo: TcxRadioGroup
      Left = 159
      Top = 131
      Width = 507
      Height = 41
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 16
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1088#1072#1093#1091#1085#1082#1110#1074
    end
  end
end
