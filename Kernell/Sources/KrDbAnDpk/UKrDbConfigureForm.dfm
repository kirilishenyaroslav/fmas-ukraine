object frmGetConfInfo: TfrmGetConfInfo
  Left = 268
  Top = 164
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1076#1077#1073#1110#1090#1086#1088#1089#1100#1082#1086#1102'/'#1082#1088#1077#1076#1080#1090#1086#1088#1089#1100#1082#1086#1102' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1110#1089#1090#1102
  ClientHeight = 465
  ClientWidth = 655
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
    Top = 419
    Width = 655
    Height = 46
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 442
      Top = 12
      Width = 100
      Height = 25
      Caption = #1060#1086#1088#1084#1091#1074#1072#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 546
      Top = 12
      Width = 100
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 655
    Height = 419
    Align = alClient
    TabOrder = 1
    object Bevel2: TBevel
      Left = 8
      Top = 6
      Width = 817
      Height = 46
    end
    object Bevel3: TBevel
      Left = 8
      Top = 54
      Width = 817
      Height = 329
    end
    object Label4: TLabel
      Left = 57
      Top = 19
      Width = 276
      Height = 16
      Alignment = taRightJustify
      Caption = #1042#1080#1073#1088#1072#1090#1080' '#1085#1072' '#1103#1082#1091' '#1076#1072#1090#1091' '#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1079#1074#1110#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 219
      Top = 65
      Width = 199
      Height = 20
      Alignment = taRightJustify
      Caption = #1053#1072#1076#1072#1090#1080' '#1072#1085#1072#1083#1110#1079' '#1091' '#1088#1086#1079#1088#1110#1079#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ShowSmGr: TcxCheckBox
      Left = 12
      Top = 175
      Width = 133
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1043#1088#1091#1087' '#1073#1102#1076#1078#1077#1090#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object ShowSm: TcxCheckBox
      Left = 12
      Top = 215
      Width = 97
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1041#1102#1076#1078#1077#1090#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object ShowRz: TcxCheckBox
      Left = 12
      Top = 260
      Width = 97
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1086#1079#1076#1110#1083#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object ShowSt: TcxCheckBox
      Left = 12
      Top = 303
      Width = 85
      Height = 24
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1057#1090#1072#1090#1077#1081
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object ShowKv: TcxCheckBox
      Left = 12
      Top = 344
      Width = 93
      Height = 24
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1050#1045#1050#1042#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object edTypeSmGrInfo: TcxRadioGroup
      Left = 145
      Top = 167
      Width = 500
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
      TabOrder = 5
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object edTypeSmInfo: TcxRadioGroup
      Left = 145
      Top = 207
      Width = 500
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
      TabOrder = 6
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object edTypeRzInfo: TcxRadioGroup
      Left = 145
      Top = 252
      Width = 500
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
      TabOrder = 7
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1088#1086#1079#1076#1110#1083#1110#1074
    end
    object edTypeStInfo: TcxRadioGroup
      Left = 145
      Top = 295
      Width = 500
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
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1089#1090#1072#1090#1077#1081
    end
    object edTypeKvInfo: TcxRadioGroup
      Left = 145
      Top = 336
      Width = 500
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
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1082#1086#1076#1110#1074' '#1074#1080#1076#1072#1090#1082#1110#1074
    end
    object ShowProgram: TcxCheckBox
      Left = 12
      Top = 135
      Width = 117
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1088#1086#1075#1088#1072#1084
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 10
    end
    object edProgramInfo: TcxRadioGroup
      Left = 145
      Top = 127
      Width = 500
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
    object cxDateEdit1: TcxDateEdit
      Left = 342
      Top = 16
      Width = 257
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 12
    end
    object ShowSch: TcxCheckBox
      Left = 12
      Top = 97
      Width = 125
      Height = 27
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1072#1093#1091#1085#1082#1110#1074
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 13
    end
    object edTypeSchInfo: TcxRadioGroup
      Left = 145
      Top = 89
      Width = 500
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
    object ShowSchFilter: TcxCheckBox
      Left = 400
      Top = 387
      Width = 217
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1060#1110#1083#1100#1090#1088' '#1076#1083#1103' '#1088#1072#1093#1091#1085#1082#1110#1074' '#1073#1072#1083#1072#1085#1089#1091
      TabOrder = 15
    end
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 8
    Top = 452
  end
end
