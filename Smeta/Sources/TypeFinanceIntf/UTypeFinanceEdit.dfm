object frmEditTypeFinance: TfrmEditTypeFinance
  Left = 362
  Top = 176
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1090#1080#1087#1091' '#1082#1086#1096#1090#1110#1074
  ClientHeight = 273
  ClientWidth = 452
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
    Top = 232
    Width = 452
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 280
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 360
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
    Width = 452
    Height = 232
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 173
      Top = 28
      Width = 24
      Height = 16
      Caption = #1050#1086#1076
    end
    object Label2: TLabel
      Left = 100
      Top = 59
      Width = 98
      Height = 16
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
    end
    object Label3: TLabel
      Left = 8
      Top = 89
      Width = 192
      Height = 16
      Caption = #1041#1091#1082#1074#1072' '#1084#1077#1084#1086#1088#1110#1072#1083#1100#1085#1086#1075#1086' '#1086#1088#1076#1077#1088#1091
    end
    object Label4: TLabel
      Left = 38
      Top = 121
      Width = 161
      Height = 16
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1076#1083#1103' '#1079#1074#1110#1090#1091
    end
    object lbl1: TLabel
      Left = 45
      Top = 180
      Width = 120
      Height = 16
      Caption = #1050#1086#1076' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072
    end
    object NameText: TcxTextEdit
      Left = 208
      Top = 55
      Width = 233
      Height = 24
      Properties.MaxLength = 100
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object CodeText: TcxTextEdit
      Left = 208
      Top = 24
      Width = 121
      Height = 24
      Properties.MaxLength = 10
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object NameExtText: TcxTextEdit
      Left = 208
      Top = 117
      Width = 233
      Height = 24
      Properties.MaxLength = 255
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object MLetterText: TcxTextEdit
      Left = 208
      Top = 85
      Width = 121
      Height = 24
      Properties.MaxLength = 1
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object InsertAsRoot: TcxCheckBox
      Left = 34
      Top = 147
      Width = 175
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1044#1086#1076#1072#1090#1080' '#1091' '#1082#1086#1088#1110#1085#1100
      TabOrder = 4
    end
    object cxtxtdtKaznCode: TcxTextEdit
      Left = 208
      Top = 176
      Width = 121
      Height = 24
      Properties.MaxLength = 10
      Style.Color = clInfoBk
      TabOrder = 5
    end
  end
end
