object fmSetKorParams: TfmSetKorParams
  Left = 311
  Top = 162
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1072#1085#1072#1083#1110#1079#1091' '#1082#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1111' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091
  ClientHeight = 296
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 16
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 521
    Height = 261
    Color = 16247513
    TabOrder = 0
    object Bevel: TBevel
      Left = 8
      Top = 8
      Width = 817
      Height = 249
    end
    object lblDescription: TLabel
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
    object cbxShowGrSmet: TcxCheckBox
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
      TabOrder = 0
    end
    object cbxShowSmet: TcxCheckBox
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
      TabOrder = 1
    end
    object cbxShowRazd: TcxCheckBox
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
      TabOrder = 2
    end
    object cbxShowStat: TcxCheckBox
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
      TabOrder = 3
    end
    object cbxShowKekv: TcxCheckBox
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
      TabOrder = 4
    end
    object rgrTypeGrSmetInfo: TcxRadioGroup
      Left = 165
      Top = 38
      Width = 340
      Height = 41
      ItemIndex = 0
      ParentCtl3D = False
      ParentFont = False
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 5
      Ctl3D = False
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object rgrTypeSmetInfo: TcxRadioGroup
      Left = 165
      Top = 81
      Width = 340
      Height = 41
      ItemIndex = 0
      ParentCtl3D = False
      ParentFont = False
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 6
      Ctl3D = False
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object rgrTypeRazdInfo: TcxRadioGroup
      Left = 165
      Top = 125
      Width = 340
      Height = 41
      ItemIndex = 0
      ParentCtl3D = False
      ParentFont = False
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 7
      Ctl3D = False
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1088#1086#1079#1076#1110#1083#1110#1074
    end
    object rgrTypeStatInfo: TcxRadioGroup
      Left = 165
      Top = 168
      Width = 340
      Height = 41
      ItemIndex = 0
      ParentCtl3D = False
      ParentFont = False
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 8
      Ctl3D = False
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1089#1090#1072#1090#1077#1081
    end
    object rgrTypeKekvInfo: TcxRadioGroup
      Left = 165
      Top = 209
      Width = 340
      Height = 41
      ItemIndex = 0
      ParentCtl3D = False
      ParentFont = False
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 9
      Ctl3D = False
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1082#1086#1076#1110#1074' '#1074#1080#1076#1072#1090#1082#1110#1074
    end
  end
  object btnOK: TcxButton
    Left = 327
    Top = 267
    Width = 90
    Height = 25
    Hint = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079#1084#1110#1085#1080' - <F10>'
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnOKClick
    Colors.Default = 16247513
    Colors.Normal = clBtnFace
    Colors.Hot = 16247513
    Colors.Pressed = 11184895
  end
  object btnCancel: TcxButton
    Left = 426
    Top = 267
    Width = 90
    Height = 25
    Hint = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1079#1084#1110#1085#1080' - <Esc>'
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Colors.Default = 16247513
    Colors.Normal = clBtnFace
    Colors.Hot = 16247513
    Colors.Pressed = 11184895
  end
end
