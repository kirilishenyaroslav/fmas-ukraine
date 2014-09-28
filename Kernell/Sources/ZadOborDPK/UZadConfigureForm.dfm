object frmGetConfInfo: TfrmGetConfInfo
  Left = 317
  Top = 183
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1079#1072#1083#1080#1096#1082#1072#1084#1080' '#1087#1086' '#1084#1072#1090#1077#1088#1110#1072#1083#1100#1085#1080#1084' '#1088#1072#1093#1091#1085#1082#1072#1084
  ClientHeight = 491
  ClientWidth = 837
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
    Top = 445
    Width = 837
    Height = 46
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 512
      Top = 12
      Width = 145
      Height = 25
      Caption = #1060#1086#1088#1084#1091#1074#1072#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 664
      Top = 12
      Width = 145
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 837
    Height = 445
    Align = alClient
    TabOrder = 1
    object Bevel1: TBevel
      Left = 8
      Top = 8
      Width = 817
      Height = 50
    end
    object Bevel2: TBevel
      Left = 8
      Top = 62
      Width = 817
      Height = 46
    end
    object Bevel3: TBevel
      Left = 8
      Top = 112
      Width = 817
      Height = 329
    end
    object Label1: TLabel
      Left = 29
      Top = 23
      Width = 128
      Height = 16
      Alignment = taRightJustify
      Caption = #1042#1080#1073#1088#1072#1090#1080' '#1088#1072#1093#1091#1085#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 27
      Top = 75
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
      Left = 39
      Top = 126
      Width = 179
      Height = 16
      Alignment = taRightJustify
      Caption = #1053#1072#1076#1072#1090#1080' '#1072#1085#1072#1083#1110#1079' '#1091' '#1088#1086#1079#1088#1110#1079#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 174
      Top = 24
      Width = 395
      Height = 24
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInfoBk
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 0
      Text = #1047#1072#1083#1080#1096#1082#1080' '#1087#1086' '#1074#1089#1110#1084' '#1084#1072#1090#1077#1088#1110#1072#1083#1100#1085#1080#1084' '#1088#1072#1093#1091#1085#1082#1072#1084
    end
    object ShowSmGr: TcxCheckBox
      Left = 36
      Top = 225
      Width = 221
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
      TabOrder = 1
    end
    object ShowSm: TcxCheckBox
      Left = 36
      Top = 265
      Width = 121
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
      TabOrder = 2
    end
    object ShowRz: TcxCheckBox
      Left = 36
      Top = 310
      Width = 121
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
      TabOrder = 3
    end
    object ShowSt: TcxCheckBox
      Left = 36
      Top = 353
      Width = 220
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
      TabOrder = 4
    end
    object ShowKv: TcxCheckBox
      Left = 36
      Top = 394
      Width = 221
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
      TabOrder = 5
    end
    object edTypeSmGrInfo: TcxRadioGroup
      Left = 264
      Top = 225
      Width = 553
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
    object edTypeSmInfo: TcxRadioGroup
      Left = 264
      Top = 265
      Width = 553
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
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object edTypeRzInfo: TcxRadioGroup
      Left = 264
      Top = 310
      Width = 553
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
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1088#1086#1079#1076#1110#1083#1110#1074
    end
    object edTypeStInfo: TcxRadioGroup
      Left = 264
      Top = 353
      Width = 553
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
    object edTypeKvInfo: TcxRadioGroup
      Left = 264
      Top = 394
      Width = 553
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
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1082#1086#1076#1110#1074' '#1074#1080#1076#1072#1090#1082#1110#1074
    end
    object ShowProgram: TcxCheckBox
      Left = 36
      Top = 185
      Width = 221
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1088#1086#1075#1088#1072#1084' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 11
    end
    object edProgramInfo: TcxRadioGroup
      Left = 264
      Top = 185
      Width = 553
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
    object cxDateEdit1: TcxDateEdit
      Left = 312
      Top = 72
      Width = 257
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 13
    end
    object EdSchFilter: TcxCheckBox
      Left = 576
      Top = 24
      Width = 145
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = EdSchFilterPropertiesChange
      Properties.Caption = #1042#1080#1073#1088#1072#1090#1080' '#1088#1072#1093#1091#1085#1086#1082
      TabOrder = 14
    end
    object ShowSch: TcxCheckBox
      Left = 36
      Top = 147
      Width = 221
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
      TabOrder = 15
    end
    object edTypeSchInfo: TcxRadioGroup
      Left = 264
      Top = 147
      Width = 553
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
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 8
    Top = 452
  end
end
