object frmEditReg: TfrmEditReg
  Left = 337
  Top = 207
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1088#1077#1075#1110#1089#1090#1088#1072#1084#1080' '#1086#1073#1083#1110#1082#1091
  ClientHeight = 187
  ClientWidth = 483
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
  object Label2: TLabel
    Left = 19
    Top = 52
    Width = 162
    Height = 16
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1077#1075#1080#1089#1090#1088#1072
  end
  object Panel1: TPanel
    Left = 0
    Top = 146
    Width = 483
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 483
    Height = 146
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 43
      Width = 156
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1088#1077#1075#1110#1089#1090#1088#1072
    end
    object Label3: TLabel
      Left = 38
      Top = 68
      Width = 121
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1085#1103
    end
    object Label4: TLabel
      Left = 38
      Top = 92
      Width = 122
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1060#1086#1088#1084#1072' '#1086#1073#1083#1110#1082#1091
    end
    object Label5: TLabel
      Left = 34
      Top = 19
      Width = 125
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1086#1076' '#1088#1077#1075#1110#1089#1090#1088#1072
    end
    object Label6: TLabel
      Left = 34
      Top = 115
      Width = 247
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1086#1076' '#1076#1083#1103' '#1089#1086#1088#1090#1091#1074#1072#1085#1085#1103' '#1074' '#1079#1074#1110#1090#1085#1080#1093' '#1092#1086#1088#1084#1072#1093
    end
    object Edit1: TEdit
      Left = 165
      Top = 40
      Width = 293
      Height = 24
      Color = clInfoBk
      MaxLength = 100
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 165
      Top = 64
      Width = 293
      Height = 24
      Color = clInfoBk
      MaxLength = 16
      TabOrder = 2
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 165
      Top = 88
      Width = 293
      Height = 24
      Color = clInfoBk
      KeyField = 'ID_SYSTEM'
      ListField = 'SYSTEM_TITLE'
      TabOrder = 3
    end
    object Edit3: TEdit
      Left = 165
      Top = 16
      Width = 153
      Height = 24
      Color = clInfoBk
      MaxLength = 10
      TabOrder = 0
    end
    object N_PP: TEdit
      Left = 285
      Top = 112
      Width = 172
      Height = 24
      Color = clInfoBk
      MaxLength = 10
      TabOrder = 4
      Text = '0'
    end
  end
end
