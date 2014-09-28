object frmSynchEDBO_kurs: TfrmSynchEDBO_kurs
  Left = 472
  Top = 252
  Width = 441
  Height = 161
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1079#1074#39#1103#1079#1082#1080' '#1082#1091#1088#1089#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 238
    Top = 89
    Width = 87
    Height = 25
    Caption = #1057#1074#1103#1079#1072#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 331
    Top = 89
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 204
    Height = 17
    TabOrder = 2
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1082#1091#1088#1089#1072' '#1045#1044#1041#1054
  end
  object TextEdit_kurs_edbo: TcxTextEdit
    Left = 8
    Top = 24
    Width = 409
    Height = 21
    Properties.ReadOnly = True
    Style.Color = 16311512
    TabOrder = 3
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 48
    Width = 170
    Height = 17
    TabOrder = 4
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1082#1091#1088#1089#1072
  end
  object TextEdit_kurs: TcxTextEdit
    Left = 8
    Top = 64
    Width = 409
    Height = 21
    Properties.ReadOnly = False
    Style.Color = 16311512
    TabOrder = 5
  end
end
