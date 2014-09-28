object frmEditFinFrm: TfrmEditFinFrm
  Left = 353
  Top = 233
  Width = 484
  Height = 237
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1092#1086#1088#1084#1110
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
    Top = 169
    Width = 476
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 392
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
    Width = 476
    Height = 169
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 164
      Height = 16
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1092#1086#1088#1084#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 25
      Top = 118
      Width = 101
      Height = 16
      Caption = #1058#1080#1087' '#1079#1074#1110#1090#1085#1086#1089#1090#1110
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 25
      Top = 62
      Width = 252
      Height = 16
      Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1092#1086#1088#1084#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbTypeForm: TcxLookupComboBox
      Left = 24
      Top = 136
      Width = 377
      Height = 24
      Enabled = False
      Properties.KeyFieldNames = 'ID_TYPE_FORM'
      Properties.ListColumns = <
        item
          Caption = #1058#1080#1087' '#1092#1110#1085#1072#1085#1089#1086#1074#1086#1075#1086' '#1079#1074#1110#1090#1091
          FieldName = 'TYPE_FORM_TITLE'
        end>
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object EdFormTitle: TcxTextEdit
      Left = 24
      Top = 26
      Width = 377
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 1
      Text = #1058#1088#1077#1073#1072' '#1074#1074#1077#1089#1090#1080' '#1085#1072#1079#1074#1091' '#1092#1110#1085#1072#1085#1089#1086#1074#1086#1111' '#1092#1086#1088#1084#1080
    end
    object cxCheckBox1: TcxCheckBox
      Left = 24
      Top = 79
      Width = 73
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1052#1110#1089#1103#1094#1100
      TabOrder = 2
    end
    object cbMonthBeg: TcxComboBox
      Left = 96
      Top = 81
      Width = 130
      Height = 24
      Enabled = False
      Properties.DropDownListStyle = lsFixedList
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object cbYearBeg: TcxComboBox
      Left = 230
      Top = 80
      Width = 171
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      TabOrder = 4
    end
  end
end
