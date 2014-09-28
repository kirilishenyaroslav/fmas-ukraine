object frmPrice_AE: TfrmPrice_AE
  Left = 483
  Top = 257
  Width = 470
  Height = 163
  Caption = #1044#1086#1076#1072#1090#1080'/'#1088#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1087#1088#1077#1081#1089#1082#1091#1088#1072#1085#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit_price_name: TcxTextEdit
    Left = 16
    Top = 24
    Width = 433
    Height = 21
    Properties.MaxLength = 100
    TabOrder = 0
    Text = #1055#1088#1077#1081#1089#1082#1091#1088#1072#1085#1090' '#1074#1072#1088#1090#1086#1089#1090#1110' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103' '#1085#1072' '
  end
  object Label_name_price: TcxLabel
    Left = 16
    Top = 8
    Width = 156
    Height = 17
    TabOrder = 1
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1087#1088#1077#1081#1089#1082#1091#1088#1072#1085#1090#1072
  end
  object DateEdit_date_beg: TcxDateEdit
    Left = 96
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object DateEdit_date_end: TcxDateEdit
    Left = 328
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 56
    Width = 76
    Height = 17
    TabOrder = 4
    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
  end
  object cxLabel2: TcxLabel
    Left = 232
    Top = 56
    Width = 92
    Height = 17
    TabOrder = 5
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
  end
  object cxButton1: TcxButton
    Left = 288
    Top = 88
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 6
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 368
    Top = 88
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 7
    OnClick = cxButton2Click
  end
  object CheckBox_deleted: TcxCheckBox
    Left = 16
    Top = 88
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1087#1080#1089' '#1074#1080#1076#1072#1083#1077#1085#1086
    TabOrder = 8
    Visible = False
  end
end
