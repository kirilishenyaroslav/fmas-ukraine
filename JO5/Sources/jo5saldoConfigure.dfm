object frmJO5GetConfInfo: TfrmJO5GetConfInfo
  Left = 311
  Top = 162
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1086#1073#1086#1088#1086#1090#1072#1084' '#1088#1072#1093#1091#1085#1082#1072
  ClientHeight = 304
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 272
    Width = 518
    Height = 32
    Align = alBottom
    Color = 16776176
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 205
      Top = 3
      Width = 145
      Height = 25
      Caption = #1060#1086#1088#1084#1091#1074#1072#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 357
      Top = 3
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
    Width = 518
    Height = 272
    Align = alClient
    Color = clGradientActiveCaption
    TabOrder = 1
    object Bevel3: TBevel
      Left = 8
      Top = 8
      Width = 817
      Height = 249
    end
    object Label5: TLabel
      Left = 113
      Top = 15
      Width = 292
      Height = 20
      Alignment = taRightJustify
      Caption = #1053#1072#1076#1072#1090#1080' '#1072#1085#1072#1083#1110#1079' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091' '#1091' '#1088#1086#1079#1088#1110#1079#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ShowSmGr: TcxCheckBox
      Left = 28
      Top = 48
      Width = 133
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1043#1088#1091#1087' '#1073#1102#1076#1078#1077#1090#1110#1074
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object ShowSm: TcxCheckBox
      Left = 28
      Top = 88
      Width = 121
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1041#1102#1076#1078#1077#1090#1110#1074
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object ShowRz: TcxCheckBox
      Left = 28
      Top = 133
      Width = 121
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1086#1079#1076#1110#1083#1110#1074
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object ShowSt: TcxCheckBox
      Left = 28
      Top = 176
      Width = 133
      Height = 24
      AutoSize = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1057#1090#1072#1090#1077#1081
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object ShowKv: TcxCheckBox
      Left = 28
      Top = 217
      Width = 133
      Height = 24
      AutoSize = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1050#1045#1050#1042#1110#1074
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object edTypeSmGrInfo: TcxRadioGroup
      Left = 165
      Top = 40
      Width = 340
      Height = 41
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 5
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object edTypeSmInfo: TcxRadioGroup
      Left = 165
      Top = 80
      Width = 340
      Height = 41
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 6
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object edTypeRzInfo: TcxRadioGroup
      Left = 165
      Top = 125
      Width = 340
      Height = 41
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 7
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1088#1086#1079#1076#1110#1083#1110#1074
    end
    object edTypeStInfo: TcxRadioGroup
      Left = 165
      Top = 168
      Width = 340
      Height = 41
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 8
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1089#1090#1072#1090#1077#1081
    end
    object edTypeKvInfo: TcxRadioGroup
      Left = 165
      Top = 209
      Width = 340
      Height = 41
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 9
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1082#1086#1076#1110#1074' '#1074#1080#1076#1072#1090#1082#1110#1074
    end
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 8
    Top = 452
  end
end
