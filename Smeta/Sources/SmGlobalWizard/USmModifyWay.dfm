object frmSmModifyWay: TfrmSmModifyWay
  Left = 253
  Top = 194
  BorderStyle = bsDialog
  Caption = #1042#1080#1073#1077#1088#1110#1090#1100' '#1089#1087#1086#1089#1110#1073' '#1084#1086#1076#1080#1092#1110#1082#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1091
  ClientHeight = 382
  ClientWidth = 548
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
  object Panel1: TPanel
    Left = 0
    Top = 334
    Width = 548
    Height = 48
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 384
      Top = 16
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 464
      Top = 16
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object cxRadioGroup1: TcxRadioGroup
    Left = 0
    Top = 104
    Width = 548
    Height = 189
    Align = alClient
    ItemIndex = 0
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = #1047#1072#1076#1072#1090#1080' '#1089#1091#1084#1091' '#1076#1086#1093#1086#1076#1085#1086#1111' '#1095#1072#1089#1090#1080#1085#1080
      end
      item
        Caption = #1047#1072#1076#1072#1090#1080' '#1089#1091#1084#1091' '#1074#1080#1076#1072#1090#1082#1086#1074#1086#1111' '#1095#1072#1089#1090#1080#1085#1080
      end
      item
        Caption = #1055#1086#1084#1085#1086#1078#1080#1090#1080' '#1087#1086#1082#1072#1079#1085#1080#1082#1080' '#1085#1072' '#1082#1086#1077#1092#1110#1094#1110#1077#1085#1090
      end
      item
        Caption = #1055#1086#1084#1085#1086#1078#1080#1090#1080' '#1076#1086#1093#1086#1076#1085#1091' '#1095#1072#1089#1090#1080#1085#1091' '#1085#1072' '#1082#1086#1077#1092#1110#1094#1110#1108#1085#1090
      end
      item
        Caption = #1055#1086#1084#1085#1086#1078#1080#1090#1080' '#1074#1080#1076#1072#1090#1082#1086#1074#1091' '#1095#1072#1089#1090#1080#1085#1091' '#1085#1072' '#1082#1086#1077#1092#1110#1094#1110#1077#1085#1090
      end
      item
        Caption = #1047#1084#1110#1085#1080#1090#1080' '#1089#1090#1088#1091#1082#1090#1091#1088#1091' '#1073#1102#1076#1078#1077#1090#1091
      end>
    TabOrder = 1
    Caption = ''
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 548
    Height = 104
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 21
      Top = 6
      Width = 206
      Height = 13
      Caption = #1041#1102#1076#1078#1077#1090', '#1087#1086#1082#1072#1079#1085#1080#1082#1080' '#1103#1082#1086#1075#1086' '#1090#1088#1077#1073#1072' '#1079#1084#1110#1085#1080#1090#1080
    end
    object Label6: TLabel
      Left = 29
      Top = 75
      Width = 50
      Height = 13
      Caption = #1050#1086#1084#1077#1085#1090#1072#1088
      Enabled = False
    end
    object Label2: TLabel
      Left = 293
      Top = 75
      Width = 75
      Height = 13
      Caption = #1041#1102#1076#1078#1077#1090#1085#1080#1081' '#1088#1110#1082
      Enabled = False
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 109
      Top = 22
      Width = 393
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxCheckBox1: TcxCheckBox
      Left = 24
      Top = 48
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1079#1084#1110#1085#1080' '#1087#1110#1076' '#1085#1086#1074#1080#1084' '#1087#1088#1086#1077#1082#1090#1086#1084
      TabOrder = 1
    end
    object cxTextEdit1: TcxTextEdit
      Left = 87
      Top = 73
      Width = 202
      Height = 21
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 2
      Text = #1053#1086#1074#1080#1081' '#1074#1072#1088#1110#1072#1085#1090
    end
    object cxSpinEdit1: TcxSpinEdit
      Left = 375
      Top = 73
      Width = 121
      Height = 21
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 293
    Width = 548
    Height = 41
    Align = alBottom
    TabOrder = 3
    object Label3: TLabel
      Left = 32
      Top = 16
      Width = 117
      Height = 13
      Caption = #1055#1086#1082#1072#1079#1085#1080#1082' '#1082#1086#1088#1077#1075#1091#1074#1072#1085#1085#1103
    end
    object cxCalcEdit1: TcxCalcEdit
      Left = 160
      Top = 12
      Width = 121
      Height = 21
      EditValue = '0'
      TabOrder = 0
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 216
    Top = 152
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 216
    Top = 120
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 216
    Top = 184
  end
end
