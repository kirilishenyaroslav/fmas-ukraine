object frmEditDocType: TfrmEditDocType
  Left = 378
  Top = 278
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1090#1080#1087#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 191
  ClientWidth = 454
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
    Top = 0
    Width = 454
    Height = 150
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 34
      Top = 21
      Width = 98
      Height = 16
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
    end
    object Label2: TLabel
      Left = 49
      Top = 53
      Width = 79
      Height = 16
      Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1085#1103
    end
    object Label3: TLabel
      Left = 42
      Top = 86
      Width = 89
      Height = 16
      Caption = #1060#1086#1088#1084#1072' '#1086#1073#1083#1110#1082#1091
    end
    object Label4: TLabel
      Left = 36
      Top = 118
      Width = 93
      Height = 16
      Caption = #1056#1077#1075#1110#1089#1090#1088' '#1086#1073#1083#1110#1082#1091
    end
    object cxTextEdit1: TcxTextEdit
      Left = 136
      Top = 19
      Width = 305
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxTextEdit2: TcxTextEdit
      Left = 136
      Top = 51
      Width = 305
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object SysLookUp: TcxLookupComboBox
      Left = 136
      Top = 83
      Width = 305
      Height = 24
      Properties.KeyFieldNames = 'ID_SYSTEM'
      Properties.ListColumns = <
        item
          Caption = #1057#1080#1089#1090#1077#1084#1072' '#1086#1073#1083#1110#1082#1072
          FieldName = 'SYSTEM_TITLE'
        end>
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object RegLookUp: TcxLookupComboBox
      Left = 136
      Top = 115
      Width = 305
      Height = 24
      Properties.KeyFieldNames = 'ID_REG'
      Properties.ListColumns = <
        item
          Caption = #1056#1077#1075#1110#1089#1090#1088' '#1086#1073#1083#1110#1082#1091
          FieldName = 'REG_TITLE'
        end>
      Style.Color = clInfoBk
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 150
    Width = 454
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 368
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
end
