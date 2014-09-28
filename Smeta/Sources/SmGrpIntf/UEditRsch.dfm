object frmGetSchInfo: TfrmGetSchInfo
  Left = 435
  Top = 287
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1084#1091' '#1088#1072#1093#1091#1085#1082#1091
  ClientHeight = 227
  ClientWidth = 575
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
  object Label1: TLabel
    Left = 74
    Top = 17
    Width = 57
    Height = 16
    Caption = #1056#1072#1093#1091#1085#1086#1082' '
  end
  object Label2: TLabel
    Left = 11
    Top = 83
    Width = 120
    Height = 16
    Caption = #1055#1086#1095#1080#1085#1072#1102#1095#1080' '#1089' '#1076#1072#1090#1080
  end
  object Label3: TLabel
    Left = 99
    Top = 49
    Width = 32
    Height = 16
    Caption = #1052#1060#1054
  end
  object Label4: TLabel
    Left = 80
    Top = 115
    Width = 51
    Height = 16
    Caption = #1044#1086' '#1076#1072#1090#1080
    Visible = False
  end
  object Label5: TLabel
    Left = 81
    Top = 147
    Width = 262
    Height = 16
    Caption = #1042#1080#1076#1072#1090#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1079#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
  end
  object Panel1: TPanel
    Left = 0
    Top = 186
    Width = 575
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 238
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 318
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1080#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object rateaccounttext: TcxButtonEdit
    Left = 137
    Top = 17
    Width = 360
    Height = 24
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    Style.Color = clInfoBk
    TabOrder = 1
  end
  object DateBeg: TcxDateEdit
    Left = 136
    Top = 79
    Width = 121
    Height = 24
    Style.Color = clInfoBk
    TabOrder = 2
  end
  object mfotext: TcxTextEdit
    Left = 136
    Top = 48
    Width = 121
    Height = 24
    Properties.ReadOnly = True
    Style.Color = clInfoBk
    TabOrder = 3
  end
  object mfoname: TcxTextEdit
    Left = 264
    Top = 48
    Width = 233
    Height = 24
    Properties.ReadOnly = True
    Style.Color = clInfoBk
    TabOrder = 4
  end
  object DateEnd: TcxDateEdit
    Left = 136
    Top = 111
    Width = 121
    Height = 24
    Style.Color = clInfoBk
    TabOrder = 5
    Visible = False
  end
  object isDefault: TcxCheckBox
    Left = 349
    Top = 144
    Width = 20
    Height = 24
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = ''
    TabOrder = 6
  end
end
