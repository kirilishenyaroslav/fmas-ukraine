object frmEditReg: TfrmEditReg
  Left = 337
  Top = 207
  BorderStyle = bsDialog
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1084#1080' '#1091#1095#1077#1090#1072
  ClientHeight = 173
  ClientWidth = 463
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
  object Label2: TLabel
    Left = 19
    Top = 52
    Width = 125
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1077#1075#1080#1089#1090#1088#1072
  end
  object Panel1: TPanel
    Left = 0
    Top = 132
    Width = 463
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
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 132
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 19
      Top = 43
      Width = 125
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1077#1075#1080#1089#1090#1088#1072
    end
    object Label3: TLabel
      Left = 23
      Top = 68
      Width = 121
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1057#1086#1082#1088'. '#1085#1072#1080#1084#1077#1085'. '#1088#1077#1075#1080#1089#1090#1088#1072
    end
    object Label4: TLabel
      Left = 23
      Top = 92
      Width = 122
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1060#1086#1088#1084#1072' '#1091#1095#1077#1090#1072
    end
    object Label5: TLabel
      Left = 19
      Top = 19
      Width = 125
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1086#1076' '#1088#1077#1075#1080#1089#1090#1088#1072
    end
    object Edit1: TEdit
      Left = 152
      Top = 40
      Width = 293
      Height = 21
      Color = clInfoBk
      MaxLength = 100
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 152
      Top = 64
      Width = 293
      Height = 21
      Color = clInfoBk
      MaxLength = 16
      TabOrder = 1
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 152
      Top = 88
      Width = 293
      Height = 21
      Color = clInfoBk
      KeyField = 'ID_SYSTEM'
      ListField = 'SYSTEM_TITLE'
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 152
      Top = 16
      Width = 153
      Height = 21
      Color = clInfoBk
      MaxLength = 100
      TabOrder = 3
    end
  end
end
