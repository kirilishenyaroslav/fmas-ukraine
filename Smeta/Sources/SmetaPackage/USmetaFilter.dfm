object frmSmFilter: TfrmSmFilter
  Left = 334
  Top = 187
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088' '#1076#1083#1103' '#1074#1110#1076#1073#1086#1088#1091' '#1073#1102#1076#1078#1077#1090#1110#1074
  ClientHeight = 257
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 216
    Width = 461
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 16
      Top = 8
      Width = 121
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1074#1089#1077
      TabOrder = 2
      OnClick = cxButton3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 216
    Align = alClient
    TabOrder = 1
    object CheckActivity: TcxCheckBox
      Left = 24
      Top = 16
      Width = 249
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1110#1076#1073#1080#1088#1072#1090#1080' '#1090#1110#1083#1100#1082#1110' '#1072#1082#1090#1080#1074#1085#1110' '#1073#1102#1076#1078#1077#1090#1080
      State = cbsChecked
      TabOrder = 0
    end
    object CheckPeriod: TcxCheckBox
      Left = 24
      Top = 48
      Width = 345
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckPeriodPropertiesChange
      Properties.Caption = #1047' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1087#1077#1088#1110#1086#1076#1091' '#1092#1091#1085#1082#1094#1110#1086#1085#1091#1074#1072#1085#1085#1103
      TabOrder = 1
    end
    object EdDateBeg: TcxDateEdit
      Left = 280
      Top = 96
      Width = 161
      Height = 24
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object EdDateEnd: TcxDateEdit
      Left = 280
      Top = 120
      Width = 161
      Height = 24
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object CheckGroup: TcxCheckBox
      Left = 24
      Top = 160
      Width = 233
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckGroupPropertiesChange
      Properties.Caption = #1047' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1075#1088#1091#1087#1080' '#1073#1102#1076#1078#1077#1090#1110#1074
      TabOrder = 4
    end
    object EdSmGroup: TcxButtonEdit
      Left = 30
      Top = 184
      Width = 417
      Height = 24
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = EdSmGroupPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 5
    end
    object CheckDateBeg: TcxCheckBox
      Left = 138
      Top = 95
      Width = 142
      Height = 24
      Enabled = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckDateBegPropertiesChange
      Properties.Caption = #1055#1086#1095#1080#1085#1072#1102#1095#1080' '#1079
      TabOrder = 6
    end
    object CheckDateEnd: TcxCheckBox
      Left = 138
      Top = 119
      Width = 142
      Height = 24
      Enabled = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckDateEndPropertiesChange
      Properties.Caption = #1047#1072#1082#1110#1085#1095#1091#1102#1095#1080' '
      TabOrder = 7
    end
    object CheckCurDate: TcxCheckBox
      Left = 138
      Top = 71
      Width = 141
      Height = 24
      Enabled = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckCurDatePropertiesChange
      Properties.Caption = #1060#1091#1085#1082#1094#1110#1086#1085#1091#1102#1090#1100' '#1085#1072
      TabOrder = 8
    end
    object EdCurDate: TcxDateEdit
      Left = 280
      Top = 72
      Width = 161
      Height = 24
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 9
    end
  end
end
