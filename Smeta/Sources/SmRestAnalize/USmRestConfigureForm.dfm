object frmGetConfInfo: TfrmGetConfInfo
  Left = 276
  Top = 162
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1079#1072#1083#1080#1096#1082#1072#1084#1080' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1072#1093
  ClientHeight = 304
  ClientWidth = 659
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
    Top = 258
    Width = 659
    Height = 46
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 464
      Top = 12
      Width = 90
      Height = 25
      Caption = #1060#1086#1088#1084#1091#1074#1072#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 561
      Top = 12
      Width = 81
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 659
    Height = 258
    Align = alClient
    TabOrder = 1
    object Bevel2: TBevel
      Left = 8
      Top = 6
      Width = 637
      Height = 39
    end
    object Bevel3: TBevel
      Left = 8
      Top = 54
      Width = 637
      Height = 195
    end
    object Label4: TLabel
      Left = 81
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
      Left = 243
      Top = 61
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
      Left = 13
      Top = 124
      Width = 132
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
      Left = 13
      Top = 164
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
      TabOrder = 1
    end
    object edTypeSmGrInfo: TcxRadioGroup
      Left = 148
      Top = 119
      Width = 492
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
      TabOrder = 2
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object edTypeSmInfo: TcxRadioGroup
      Left = 148
      Top = 159
      Width = 492
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
      TabOrder = 3
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object ShowProgram: TcxCheckBox
      Left = 13
      Top = 84
      Width = 100
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
      TabOrder = 4
    end
    object edProgramInfo: TcxRadioGroup
      Left = 148
      Top = 79
      Width = 492
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
    object cxDateEdit1: TcxDateEdit
      Left = 366
      Top = 16
      Width = 257
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 6
    end
    object ShowSch: TcxCheckBox
      Left = 13
      Top = 205
      Width = 121
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1072#1093#1091#1085#1082#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
    object edTypeSchInfo: TcxRadioGroup
      Left = 148
      Top = 200
      Width = 492
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
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 8
    Top = 452
  end
end
